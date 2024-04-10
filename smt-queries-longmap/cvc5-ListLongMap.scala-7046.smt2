; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89288 () Bool)

(assert start!89288)

(declare-fun b!1023832 () Bool)

(declare-fun b_free!20329 () Bool)

(declare-fun b_next!20329 () Bool)

(assert (=> b!1023832 (= b_free!20329 (not b_next!20329))))

(declare-fun tp!72022 () Bool)

(declare-fun b_and!32569 () Bool)

(assert (=> b!1023832 (= tp!72022 b_and!32569)))

(declare-fun b!1023827 () Bool)

(declare-fun e!576997 () Bool)

(assert (=> b!1023827 (= e!576997 (not true))))

(declare-fun lt!450517 () Bool)

(declare-datatypes ((V!36939 0))(
  ( (V!36940 (val!12075 Int)) )
))
(declare-datatypes ((ValueCell!11321 0))(
  ( (ValueCellFull!11321 (v!14644 V!36939)) (EmptyCell!11321) )
))
(declare-datatypes ((array!64142 0))(
  ( (array!64143 (arr!30883 (Array (_ BitVec 32) (_ BitVec 64))) (size!31394 (_ BitVec 32))) )
))
(declare-datatypes ((array!64144 0))(
  ( (array!64145 (arr!30884 (Array (_ BitVec 32) ValueCell!11321)) (size!31395 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5236 0))(
  ( (LongMapFixedSize!5237 (defaultEntry!5970 Int) (mask!29603 (_ BitVec 32)) (extraKeys!5702 (_ BitVec 32)) (zeroValue!5806 V!36939) (minValue!5806 V!36939) (_size!2673 (_ BitVec 32)) (_keys!11115 array!64142) (_values!5993 array!64144) (_vacant!2673 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5236)

(declare-fun lt!450519 () V!36939)

(declare-fun valid!1995 (LongMapFixedSize!5236) Bool)

(assert (=> b!1023827 (= lt!450517 (valid!1995 (LongMapFixedSize!5237 (defaultEntry!5970 thiss!1427) (mask!29603 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) lt!450519 (_size!2673 thiss!1427) (_keys!11115 thiss!1427) (_values!5993 thiss!1427) (_vacant!2673 thiss!1427))))))

(declare-datatypes ((tuple2!15522 0))(
  ( (tuple2!15523 (_1!7772 (_ BitVec 64)) (_2!7772 V!36939)) )
))
(declare-datatypes ((List!21722 0))(
  ( (Nil!21719) (Cons!21718 (h!22916 tuple2!15522) (t!30780 List!21722)) )
))
(declare-datatypes ((ListLongMap!13663 0))(
  ( (ListLongMap!13664 (toList!6847 List!21722)) )
))
(declare-fun -!474 (ListLongMap!13663 (_ BitVec 64)) ListLongMap!13663)

(declare-fun getCurrentListMap!3895 (array!64142 array!64144 (_ BitVec 32) (_ BitVec 32) V!36939 V!36939 (_ BitVec 32) Int) ListLongMap!13663)

(assert (=> b!1023827 (= (-!474 (getCurrentListMap!3895 (_keys!11115 thiss!1427) (_values!5993 thiss!1427) (mask!29603 thiss!1427) (extraKeys!5702 thiss!1427) (zeroValue!5806 thiss!1427) (minValue!5806 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5970 thiss!1427)) #b1000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3895 (_keys!11115 thiss!1427) (_values!5993 thiss!1427) (mask!29603 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) lt!450519 #b00000000000000000000000000000000 (defaultEntry!5970 thiss!1427)))))

(declare-datatypes ((Unit!33337 0))(
  ( (Unit!33338) )
))
(declare-fun lt!450518 () Unit!33337)

(declare-fun lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!6 (array!64142 array!64144 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36939 V!36939 V!36939 Int) Unit!33337)

(assert (=> b!1023827 (= lt!450518 (lemmaRemoveLongMinValueKeyThenRemoveKeyFromListMap!6 (_keys!11115 thiss!1427) (_values!5993 thiss!1427) (mask!29603 thiss!1427) (extraKeys!5702 thiss!1427) (bvand (extraKeys!5702 thiss!1427) #b00000000000000000000000000000001) (zeroValue!5806 thiss!1427) (minValue!5806 thiss!1427) lt!450519 (defaultEntry!5970 thiss!1427)))))

(declare-fun dynLambda!1944 (Int (_ BitVec 64)) V!36939)

(assert (=> b!1023827 (= lt!450519 (dynLambda!1944 (defaultEntry!5970 thiss!1427) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!37491 () Bool)

(declare-fun mapRes!37491 () Bool)

(declare-fun tp!72021 () Bool)

(declare-fun e!576996 () Bool)

(assert (=> mapNonEmpty!37491 (= mapRes!37491 (and tp!72021 e!576996))))

(declare-fun mapRest!37491 () (Array (_ BitVec 32) ValueCell!11321))

(declare-fun mapValue!37491 () ValueCell!11321)

(declare-fun mapKey!37491 () (_ BitVec 32))

(assert (=> mapNonEmpty!37491 (= (arr!30884 (_values!5993 thiss!1427)) (store mapRest!37491 mapKey!37491 mapValue!37491))))

(declare-fun b!1023828 () Bool)

(declare-fun e!576999 () Bool)

(declare-fun tp_is_empty!24049 () Bool)

(assert (=> b!1023828 (= e!576999 tp_is_empty!24049)))

(declare-fun b!1023829 () Bool)

(declare-fun e!576998 () Bool)

(assert (=> b!1023829 (= e!576998 (and e!576999 mapRes!37491))))

(declare-fun condMapEmpty!37491 () Bool)

(declare-fun mapDefault!37491 () ValueCell!11321)

