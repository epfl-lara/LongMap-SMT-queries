; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89180 () Bool)

(assert start!89180)

(declare-fun b!1022498 () Bool)

(declare-fun b_free!20221 () Bool)

(declare-fun b_next!20221 () Bool)

(assert (=> b!1022498 (= b_free!20221 (not b_next!20221))))

(declare-fun tp!71697 () Bool)

(declare-fun b_and!32425 () Bool)

(assert (=> b!1022498 (= tp!71697 b_and!32425)))

(declare-fun b!1022495 () Bool)

(declare-fun e!576027 () Bool)

(assert (=> b!1022495 (= e!576027 (not true))))

(declare-fun lt!450249 () Bool)

(declare-datatypes ((V!36795 0))(
  ( (V!36796 (val!12021 Int)) )
))
(declare-datatypes ((ValueCell!11267 0))(
  ( (ValueCellFull!11267 (v!14590 V!36795)) (EmptyCell!11267) )
))
(declare-datatypes ((array!63926 0))(
  ( (array!63927 (arr!30775 (Array (_ BitVec 32) (_ BitVec 64))) (size!31286 (_ BitVec 32))) )
))
(declare-datatypes ((array!63928 0))(
  ( (array!63929 (arr!30776 (Array (_ BitVec 32) ValueCell!11267)) (size!31287 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5128 0))(
  ( (LongMapFixedSize!5129 (defaultEntry!5916 Int) (mask!29513 (_ BitVec 32)) (extraKeys!5648 (_ BitVec 32)) (zeroValue!5752 V!36795) (minValue!5752 V!36795) (_size!2619 (_ BitVec 32)) (_keys!11061 array!63926) (_values!5939 array!63928) (_vacant!2619 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5128)

(declare-fun lt!450247 () V!36795)

(declare-fun valid!1953 (LongMapFixedSize!5128) Bool)

(assert (=> b!1022495 (= lt!450249 (valid!1953 (LongMapFixedSize!5129 (defaultEntry!5916 thiss!1427) (mask!29513 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) lt!450247 (minValue!5752 thiss!1427) (_size!2619 thiss!1427) (_keys!11061 thiss!1427) (_values!5939 thiss!1427) (_vacant!2619 thiss!1427))))))

(declare-datatypes ((tuple2!15498 0))(
  ( (tuple2!15499 (_1!7760 (_ BitVec 64)) (_2!7760 V!36795)) )
))
(declare-datatypes ((List!21683 0))(
  ( (Nil!21680) (Cons!21679 (h!22877 tuple2!15498) (t!30705 List!21683)) )
))
(declare-datatypes ((ListLongMap!13639 0))(
  ( (ListLongMap!13640 (toList!6835 List!21683)) )
))
(declare-fun -!462 (ListLongMap!13639 (_ BitVec 64)) ListLongMap!13639)

(declare-fun getCurrentListMap!3883 (array!63926 array!63928 (_ BitVec 32) (_ BitVec 32) V!36795 V!36795 (_ BitVec 32) Int) ListLongMap!13639)

(assert (=> b!1022495 (= (-!462 (getCurrentListMap!3883 (_keys!11061 thiss!1427) (_values!5939 thiss!1427) (mask!29513 thiss!1427) (extraKeys!5648 thiss!1427) (zeroValue!5752 thiss!1427) (minValue!5752 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5916 thiss!1427)) #b0000000000000000000000000000000000000000000000000000000000000000) (getCurrentListMap!3883 (_keys!11061 thiss!1427) (_values!5939 thiss!1427) (mask!29513 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) lt!450247 (minValue!5752 thiss!1427) #b00000000000000000000000000000000 (defaultEntry!5916 thiss!1427)))))

(declare-datatypes ((Unit!33313 0))(
  ( (Unit!33314) )
))
(declare-fun lt!450248 () Unit!33313)

(declare-fun lemmaRemoveZeroKeyThenRemoveKeyFromListMap!3 (array!63926 array!63928 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!36795 V!36795 V!36795 Int) Unit!33313)

(assert (=> b!1022495 (= lt!450248 (lemmaRemoveZeroKeyThenRemoveKeyFromListMap!3 (_keys!11061 thiss!1427) (_values!5939 thiss!1427) (mask!29513 thiss!1427) (extraKeys!5648 thiss!1427) (bvand (extraKeys!5648 thiss!1427) #b00000000000000000000000000000010) (zeroValue!5752 thiss!1427) lt!450247 (minValue!5752 thiss!1427) (defaultEntry!5916 thiss!1427)))))

(declare-fun dynLambda!1932 (Int (_ BitVec 64)) V!36795)

(assert (=> b!1022495 (= lt!450247 (dynLambda!1932 (defaultEntry!5916 thiss!1427) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!684950 () Bool)

(assert (=> start!89180 (=> (not res!684950) (not e!576027))))

(assert (=> start!89180 (= res!684950 (valid!1953 thiss!1427))))

(assert (=> start!89180 e!576027))

(declare-fun e!576023 () Bool)

(assert (=> start!89180 e!576023))

(assert (=> start!89180 true))

(declare-fun mapNonEmpty!37329 () Bool)

(declare-fun mapRes!37329 () Bool)

(declare-fun tp!71698 () Bool)

(declare-fun e!576025 () Bool)

(assert (=> mapNonEmpty!37329 (= mapRes!37329 (and tp!71698 e!576025))))

(declare-fun mapRest!37329 () (Array (_ BitVec 32) ValueCell!11267))

(declare-fun mapValue!37329 () ValueCell!11267)

(declare-fun mapKey!37329 () (_ BitVec 32))

(assert (=> mapNonEmpty!37329 (= (arr!30776 (_values!5939 thiss!1427)) (store mapRest!37329 mapKey!37329 mapValue!37329))))

(declare-fun mapIsEmpty!37329 () Bool)

(assert (=> mapIsEmpty!37329 mapRes!37329))

(declare-fun b!1022496 () Bool)

(declare-fun e!576024 () Bool)

(declare-fun e!576022 () Bool)

(assert (=> b!1022496 (= e!576024 (and e!576022 mapRes!37329))))

(declare-fun condMapEmpty!37329 () Bool)

(declare-fun mapDefault!37329 () ValueCell!11267)

