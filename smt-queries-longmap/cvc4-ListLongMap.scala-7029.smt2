; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89190 () Bool)

(assert start!89190)

(declare-fun b!1022598 () Bool)

(declare-fun b_free!20231 () Bool)

(declare-fun b_next!20231 () Bool)

(assert (=> b!1022598 (= b_free!20231 (not b_next!20231))))

(declare-fun tp!71727 () Bool)

(declare-fun b_and!32445 () Bool)

(assert (=> b!1022598 (= tp!71727 b_and!32445)))

(declare-fun b!1022595 () Bool)

(declare-fun e!576113 () Bool)

(declare-fun tp_is_empty!23951 () Bool)

(assert (=> b!1022595 (= e!576113 tp_is_empty!23951)))

(declare-fun b!1022596 () Bool)

(declare-fun e!576112 () Bool)

(assert (=> b!1022596 (= e!576112 (not true))))

(declare-fun lt!450294 () Bool)

(declare-datatypes ((V!36807 0))(
  ( (V!36808 (val!12026 Int)) )
))
(declare-datatypes ((ValueCell!11272 0))(
  ( (ValueCellFull!11272 (v!14595 V!36807)) (EmptyCell!11272) )
))
(declare-datatypes ((array!63946 0))(
  ( (array!63947 (arr!30785 (Array (_ BitVec 32) (_ BitVec 64))) (size!31296 (_ BitVec 32))) )
))
(declare-datatypes ((array!63948 0))(
  ( (array!63949 (arr!30786 (Array (_ BitVec 32) ValueCell!11272)) (size!31297 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5138 0))(
  ( (LongMapFixedSize!5139 (defaultEntry!5921 Int) (mask!29520 (_ BitVec 32)) (extraKeys!5653 (_ BitVec 32)) (zeroValue!5757 V!36807) (minValue!5757 V!36807) (_size!2624 (_ BitVec 32)) (_keys!11066 array!63946) (_values!5944 array!63948) (_vacant!2624 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5138)

(declare-fun lt!450292 () V!36807)

(declare-fun valid!1957 (LongMapFixedSize!5138) Bool)

(assert (=> b!1022596 (= lt!450294 (valid!1957 (LongMapFixedSize!5139 (defaultEntry!5921 thiss!1427) (mask!29520 thiss!1427) (bvand (extraKeys!5653 thiss!1427) #b00000000000000000000000000000010) lt!450292 (minValue!5757 thiss!1427) (_size!2624 thiss!1427) (_keys!11066 thiss!1427) (_values!5944 thiss!1427) (_vacant!2624 thiss!1427))))))

(declare-datatypes ((tuple2!15506 0))(
  ( (tuple2!15507 (_1!7764 (_ BitVec 64)) (_2!7764 V!36807)) )
))
(declare-datatypes ((List!21687 0))(
  ( (Nil!21684) (Cons!21683 (h!22881 tuple2!15506) (t!30719 List!21687)) )
))
(declare-datatypes ((ListLongMap!13647 0))(
  ( (ListLongMap!13648 (toList!6839 List!21687)) )
))
(declare-fun -!466 (ListLongMap!13647 (_ BitVec 64)) ListLongMap!13647)

(declare-fun getCurrentListMap!3887 (array!63946 array!63948 (_ BitVec 32) (_ BitVec 32) V!36807 V!36807 (_ BitVec 32) Int) ListLongMap!13647)

(assert (=> b!1022596 (= (-!466 (getCurrentListMap!3887 (_keys!11066 thiss!1427) (_values!5944 thiss!1427) (mask!29520 thiss!1427) (extraKeys!5653 thiss!1427) (zeroValue!5757 thiss!1427) (minValue!5757 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5921 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3887 (_keys!11066 thiss!1427) (_values!5944 thiss!1427) (mask!29520 thiss!1427) (bvand (extraKeys!5653 thiss!1427) #b00000000000000000000000000000010) lt!450292 (minValue!5757 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5921 thiss!1427)))))

(declare-datatypes ((Unit!33321 0))(
  ( (Unit!33322) )
))
(declare-fun lt!450293 () Unit!33321)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!7 (array!63946 array!63948 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36807 V!36807 V!36807 Int) Unit!33321)

(assert (=> b!1022596 (= lt!450293 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!7 (_keys!11066 thiss!1427) (_values!5944 thiss!1427) (mask!29520 thiss!1427) (extraKeys!5653 thiss!1427) (bvand (extraKeys!5653 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5757 thiss!1427) lt!450292 (minValue!5757 thiss!1427) (defaultEntry!5921 thiss!1427)))))

(declare-fun dynLambda!1936 (Int (_ BitVec 64)) V!36807)

(assert (=> b!1022596 (= lt!450292 (dynLambda!1936 (defaultEntry!5921 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1022597 () Bool)

(declare-fun e!576114 () Bool)

(declare-fun mapRes!37344 () Bool)

(assert (=> b!1022597 (= e!576114 (and e!576113 mapRes!37344))))

(declare-fun condMapEmpty!37344 () Bool)

(declare-fun mapDefault!37344 () ValueCell!11272)

