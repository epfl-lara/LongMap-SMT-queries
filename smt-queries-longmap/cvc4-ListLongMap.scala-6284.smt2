; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80386 () Bool)

(assert start!80386)

(declare-fun b!944121 () Bool)

(declare-fun b_free!18029 () Bool)

(declare-fun b_next!18029 () Bool)

(assert (=> b!944121 (= b_free!18029 (not b_next!18029))))

(declare-fun tp!62597 () Bool)

(declare-fun b_and!29447 () Bool)

(assert (=> b!944121 (= tp!62597 b_and!29447)))

(declare-fun b!944115 () Bool)

(declare-fun e!530886 () Bool)

(declare-fun e!530881 () Bool)

(assert (=> b!944115 (= e!530886 (not e!530881))))

(declare-fun res!634257 () Bool)

(assert (=> b!944115 (=> res!634257 e!530881)))

(declare-datatypes ((V!32347 0))(
  ( (V!32348 (val!10319 Int)) )
))
(declare-datatypes ((ValueCell!9787 0))(
  ( (ValueCellFull!9787 (v!12851 V!32347)) (EmptyCell!9787) )
))
(declare-datatypes ((array!57042 0))(
  ( (array!57043 (arr!27446 (Array (_ BitVec 32) ValueCell!9787)) (size!27912 (_ BitVec 32))) )
))
(declare-datatypes ((array!57044 0))(
  ( (array!57045 (arr!27447 (Array (_ BitVec 32) (_ BitVec 64))) (size!27913 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4724 0))(
  ( (LongMapFixedSize!4725 (defaultEntry!5657 Int) (mask!27299 (_ BitVec 32)) (extraKeys!5389 (_ BitVec 32)) (zeroValue!5493 V!32347) (minValue!5493 V!32347) (_size!2417 (_ BitVec 32)) (_keys!10535 array!57044) (_values!5680 array!57042) (_vacant!2417 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4724)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!944115 (= res!634257 (not (validMask!0 (mask!27299 thiss!1141))))))

(declare-fun lt!425531 () (_ BitVec 32))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57044 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!944115 (= lt!425531 (arrayScanForKey!0 (_keys!10535 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!944115 (arrayContainsKey!0 (_keys!10535 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31834 0))(
  ( (Unit!31835) )
))
(declare-fun lt!425532 () Unit!31834)

(declare-fun lemmaKeyInListMapIsInArray!297 (array!57044 array!57042 (_ BitVec 32) (_ BitVec 32) V!32347 V!32347 (_ BitVec 64) Int) Unit!31834)

(assert (=> b!944115 (= lt!425532 (lemmaKeyInListMapIsInArray!297 (_keys!10535 thiss!1141) (_values!5680 thiss!1141) (mask!27299 thiss!1141) (extraKeys!5389 thiss!1141) (zeroValue!5493 thiss!1141) (minValue!5493 thiss!1141) key!756 (defaultEntry!5657 thiss!1141)))))

(declare-fun b!944116 () Bool)

(assert (=> b!944116 (= e!530881 true)))

(declare-fun lt!425530 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57044 (_ BitVec 32)) Bool)

(assert (=> b!944116 (= lt!425530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10535 thiss!1141) (mask!27299 thiss!1141)))))

(declare-fun res!634256 () Bool)

(assert (=> start!80386 (=> (not res!634256) (not e!530886))))

(declare-fun valid!1805 (LongMapFixedSize!4724) Bool)

(assert (=> start!80386 (= res!634256 (valid!1805 thiss!1141))))

(assert (=> start!80386 e!530886))

(declare-fun e!530885 () Bool)

(assert (=> start!80386 e!530885))

(assert (=> start!80386 true))

(declare-fun b!944117 () Bool)

(declare-fun res!634254 () Bool)

(assert (=> b!944117 (=> res!634254 e!530881)))

(assert (=> b!944117 (= res!634254 (or (not (= (size!27913 (_keys!10535 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27299 thiss!1141)))) (bvsgt #b00000000000000000000000000000000 (size!27913 (_keys!10535 thiss!1141))) (bvslt lt!425531 #b00000000000000000000000000000000) (bvsgt lt!425531 (size!27913 (_keys!10535 thiss!1141)))))))

(declare-fun mapIsEmpty!32631 () Bool)

(declare-fun mapRes!32631 () Bool)

(assert (=> mapIsEmpty!32631 mapRes!32631))

(declare-fun b!944118 () Bool)

(declare-fun e!530887 () Bool)

(declare-fun tp_is_empty!20537 () Bool)

(assert (=> b!944118 (= e!530887 tp_is_empty!20537)))

(declare-fun b!944119 () Bool)

(declare-fun res!634253 () Bool)

(assert (=> b!944119 (=> (not res!634253) (not e!530886))))

(declare-datatypes ((tuple2!13460 0))(
  ( (tuple2!13461 (_1!6741 (_ BitVec 64)) (_2!6741 V!32347)) )
))
(declare-datatypes ((List!19264 0))(
  ( (Nil!19261) (Cons!19260 (h!20411 tuple2!13460) (t!27581 List!19264)) )
))
(declare-datatypes ((ListLongMap!12157 0))(
  ( (ListLongMap!12158 (toList!6094 List!19264)) )
))
(declare-fun contains!5166 (ListLongMap!12157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3328 (array!57044 array!57042 (_ BitVec 32) (_ BitVec 32) V!32347 V!32347 (_ BitVec 32) Int) ListLongMap!12157)

(assert (=> b!944119 (= res!634253 (contains!5166 (getCurrentListMap!3328 (_keys!10535 thiss!1141) (_values!5680 thiss!1141) (mask!27299 thiss!1141) (extraKeys!5389 thiss!1141) (zeroValue!5493 thiss!1141) (minValue!5493 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5657 thiss!1141)) key!756))))

(declare-fun b!944120 () Bool)

(declare-fun res!634252 () Bool)

(assert (=> b!944120 (=> (not res!634252) (not e!530886))))

(declare-datatypes ((SeekEntryResult!9060 0))(
  ( (MissingZero!9060 (index!38611 (_ BitVec 32))) (Found!9060 (index!38612 (_ BitVec 32))) (Intermediate!9060 (undefined!9872 Bool) (index!38613 (_ BitVec 32)) (x!81079 (_ BitVec 32))) (Undefined!9060) (MissingVacant!9060 (index!38614 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57044 (_ BitVec 32)) SeekEntryResult!9060)

(assert (=> b!944120 (= res!634252 (not (is-Found!9060 (seekEntry!0 key!756 (_keys!10535 thiss!1141) (mask!27299 thiss!1141)))))))

(declare-fun e!530883 () Bool)

(declare-fun array_inv!21326 (array!57044) Bool)

(declare-fun array_inv!21327 (array!57042) Bool)

(assert (=> b!944121 (= e!530885 (and tp!62597 tp_is_empty!20537 (array_inv!21326 (_keys!10535 thiss!1141)) (array_inv!21327 (_values!5680 thiss!1141)) e!530883))))

(declare-fun b!944122 () Bool)

(declare-fun res!634255 () Bool)

(assert (=> b!944122 (=> (not res!634255) (not e!530886))))

(assert (=> b!944122 (= res!634255 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32631 () Bool)

(declare-fun tp!62596 () Bool)

(assert (=> mapNonEmpty!32631 (= mapRes!32631 (and tp!62596 e!530887))))

(declare-fun mapKey!32631 () (_ BitVec 32))

(declare-fun mapValue!32631 () ValueCell!9787)

(declare-fun mapRest!32631 () (Array (_ BitVec 32) ValueCell!9787))

(assert (=> mapNonEmpty!32631 (= (arr!27446 (_values!5680 thiss!1141)) (store mapRest!32631 mapKey!32631 mapValue!32631))))

(declare-fun b!944123 () Bool)

(declare-fun e!530884 () Bool)

(assert (=> b!944123 (= e!530884 tp_is_empty!20537)))

(declare-fun b!944124 () Bool)

(assert (=> b!944124 (= e!530883 (and e!530884 mapRes!32631))))

(declare-fun condMapEmpty!32631 () Bool)

(declare-fun mapDefault!32631 () ValueCell!9787)

