require "spec_helper"

describe HydeToJekyll::Outputter do
  describe "#output_str" do
    let(:outputter) { HydeToJekyll::Outputter.new(dynamic_table, dynamic_records) }
    let(:dynamic_table) do
      {
        id: 1,
        uid: "whatsnew",
        name: "サンプル情報",
        type: "data"
      }
    end
    let(:json_path) { File.join(Dir.pwd, "spec", "fixtures", "sample_data_dynamic_records.json") }
    let(:answer_path) { File.join(Dir.pwd, "spec", "fixtures", "sample_data_answer.yaml") }
    let(:dynamic_records) { JSON.parse(File.read(json_path), {:symbolize_names => true}) }
    let(:answer) { YAML.load(File.read(answer_path)) }
    it { expect(YAML.load(outputter.send(:output_str))).to eq answer }
  end

  describe "#output_dir and #file_name" do
    let(:outputter) { HydeToJekyll::Outputter.new(dynamic_table, dynamic_records) }
    let(:dynamic_table) do
      {
        id: 1,
        uid: "event",
        name: "イベント",
        type: "data"
      }
    end
    let(:dynamic_records) { {} }
    it { expect(outputter.send(:output_dir)).to eq File.join(Dir.pwd, "_data") }
    it { expect(outputter.send(:file_name)).to eq "events.yml" }
  end
end
