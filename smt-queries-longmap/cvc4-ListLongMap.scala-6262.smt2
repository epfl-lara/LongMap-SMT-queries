; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80042 () Bool)

(assert start!80042)

(declare-fun b!941114 () Bool)

(declare-fun b_free!17897 () Bool)

(declare-fun b_next!17897 () Bool)

(assert (=> b!941114 (= b_free!17897 (not b_next!17897))))

(declare-fun tp!62165 () Bool)

(declare-fun b_and!29309 () Bool)

(assert (=> b!941114 (= tp!62165 b_and!29309)))

(declare-fun b!941112 () Bool)

(declare-fun e!529048 () Bool)

(assert (=> b!941112 (= e!529048 (not true))))

(declare-datatypes ((V!32171 0))(
  ( (V!32172 (val!10253 Int)) )
))
(declare-datatypes ((ValueCell!9721 0))(
  ( (ValueCellFull!9721 (v!12784 V!32171)) (EmptyCell!9721) )
))
(declare-datatypes ((array!56758 0))(
  ( (array!56759 (arr!27314 (Array (_ BitVec 32) ValueCell!9721)) (size!27775 (_ BitVec 32))) )
))
(declare-datatypes ((array!56760 0))(
  ( (array!56761 (arr!27315 (Array (_ BitVec 32) (_ BitVec 64))) (size!27776 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4592 0))(
  ( (LongMapFixedSize!4593 (defaultEntry!5587 Int) (mask!27142 (_ BitVec 32)) (extraKeys!5319 (_ BitVec 32)) (zeroValue!5423 V!32171) (minValue!5423 V!32171) (_size!2351 (_ BitVec 32)) (_keys!10437 array!56760) (_values!5610 array!56758) (_vacant!2351 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4592)

(declare-datatypes ((SeekEntryResult!9016 0))(
  ( (MissingZero!9016 (index!38435 (_ BitVec 32))) (Found!9016 (index!38436 (_ BitVec 32))) (Intermediate!9016 (undefined!9828 Bool) (index!38437 (_ BitVec 32)) (x!80733 (_ BitVec 32))) (Undefined!9016) (MissingVacant!9016 (index!38438 (_ BitVec 32))) )
))
(declare-fun lt!424920 () SeekEntryResult!9016)

(declare-datatypes ((tuple2!13404 0))(
  ( (tuple2!13405 (_1!6713 (_ BitVec 64)) (_2!6713 V!32171)) )
))
(declare-datatypes ((List!19203 0))(
  ( (Nil!19200) (Cons!19199 (h!20345 tuple2!13404) (t!27518 List!19203)) )
))
(declare-datatypes ((ListLongMap!12101 0))(
  ( (ListLongMap!12102 (toList!6066 List!19203)) )
))
(declare-fun contains!5130 (ListLongMap!12101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3300 (array!56760 array!56758 (_ BitVec 32) (_ BitVec 32) V!32171 V!32171 (_ BitVec 32) Int) ListLongMap!12101)

(assert (=> b!941112 (contains!5130 (getCurrentListMap!3300 (_keys!10437 thiss!1141) (_values!5610 thiss!1141) (mask!27142 thiss!1141) (extraKeys!5319 thiss!1141) (zeroValue!5423 thiss!1141) (minValue!5423 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5587 thiss!1141)) (select (arr!27315 (_keys!10437 thiss!1141)) (index!38436 lt!424920)))))

(declare-datatypes ((Unit!31798 0))(
  ( (Unit!31799) )
))
(declare-fun lt!424919 () Unit!31798)

(declare-fun lemmaValidKeyInArrayIsInListMap!265 (array!56760 array!56758 (_ BitVec 32) (_ BitVec 32) V!32171 V!32171 (_ BitVec 32) Int) Unit!31798)

(assert (=> b!941112 (= lt!424919 (lemmaValidKeyInArrayIsInListMap!265 (_keys!10437 thiss!1141) (_values!5610 thiss!1141) (mask!27142 thiss!1141) (extraKeys!5319 thiss!1141) (zeroValue!5423 thiss!1141) (minValue!5423 thiss!1141) (index!38436 lt!424920) (defaultEntry!5587 thiss!1141)))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941112 (arrayContainsKey!0 (_keys!10437 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!424921 () Unit!31798)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56760 (_ BitVec 64) (_ BitVec 32)) Unit!31798)

(assert (=> b!941112 (= lt!424921 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10437 thiss!1141) key!756 (index!38436 lt!424920)))))

(declare-fun b!941113 () Bool)

(declare-fun e!529050 () Bool)

(assert (=> b!941113 (= e!529050 e!529048)))

(declare-fun res!632746 () Bool)

(assert (=> b!941113 (=> (not res!632746) (not e!529048))))

(assert (=> b!941113 (= res!632746 (is-Found!9016 lt!424920))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56760 (_ BitVec 32)) SeekEntryResult!9016)

(assert (=> b!941113 (= lt!424920 (seekEntry!0 key!756 (_keys!10437 thiss!1141) (mask!27142 thiss!1141)))))

(declare-fun tp_is_empty!20405 () Bool)

(declare-fun e!529047 () Bool)

(declare-fun e!529051 () Bool)

(declare-fun array_inv!21228 (array!56760) Bool)

(declare-fun array_inv!21229 (array!56758) Bool)

(assert (=> b!941114 (= e!529047 (and tp!62165 tp_is_empty!20405 (array_inv!21228 (_keys!10437 thiss!1141)) (array_inv!21229 (_values!5610 thiss!1141)) e!529051))))

(declare-fun res!632745 () Bool)

(assert (=> start!80042 (=> (not res!632745) (not e!529050))))

(declare-fun valid!1759 (LongMapFixedSize!4592) Bool)

(assert (=> start!80042 (= res!632745 (valid!1759 thiss!1141))))

(assert (=> start!80042 e!529050))

(assert (=> start!80042 e!529047))

(assert (=> start!80042 true))

(declare-fun b!941115 () Bool)

(declare-fun res!632744 () Bool)

(assert (=> b!941115 (=> (not res!632744) (not e!529050))))

(assert (=> b!941115 (= res!632744 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!941116 () Bool)

(declare-fun e!529049 () Bool)

(assert (=> b!941116 (= e!529049 tp_is_empty!20405)))

(declare-fun mapNonEmpty!32398 () Bool)

(declare-fun mapRes!32398 () Bool)

(declare-fun tp!62166 () Bool)

(assert (=> mapNonEmpty!32398 (= mapRes!32398 (and tp!62166 e!529049))))

(declare-fun mapRest!32398 () (Array (_ BitVec 32) ValueCell!9721))

(declare-fun mapValue!32398 () ValueCell!9721)

(declare-fun mapKey!32398 () (_ BitVec 32))

(assert (=> mapNonEmpty!32398 (= (arr!27314 (_values!5610 thiss!1141)) (store mapRest!32398 mapKey!32398 mapValue!32398))))

(declare-fun b!941117 () Bool)

(declare-fun e!529045 () Bool)

(assert (=> b!941117 (= e!529045 tp_is_empty!20405)))

(declare-fun mapIsEmpty!32398 () Bool)

(assert (=> mapIsEmpty!32398 mapRes!32398))

(declare-fun b!941118 () Bool)

(assert (=> b!941118 (= e!529051 (and e!529045 mapRes!32398))))

(declare-fun condMapEmpty!32398 () Bool)

(declare-fun mapDefault!32398 () ValueCell!9721)

