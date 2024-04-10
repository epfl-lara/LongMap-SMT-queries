; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80026 () Bool)

(assert start!80026)

(declare-fun b!940902 () Bool)

(declare-fun b_free!17881 () Bool)

(declare-fun b_next!17881 () Bool)

(assert (=> b!940902 (= b_free!17881 (not b_next!17881))))

(declare-fun tp!62117 () Bool)

(declare-fun b_and!29293 () Bool)

(assert (=> b!940902 (= tp!62117 b_and!29293)))

(declare-fun b!940896 () Bool)

(declare-fun e!528863 () Bool)

(declare-fun tp_is_empty!20389 () Bool)

(assert (=> b!940896 (= e!528863 tp_is_empty!20389)))

(declare-fun b!940897 () Bool)

(declare-fun res!632629 () Bool)

(declare-fun e!528861 () Bool)

(assert (=> b!940897 (=> res!632629 e!528861)))

(declare-datatypes ((V!32151 0))(
  ( (V!32152 (val!10245 Int)) )
))
(declare-datatypes ((ValueCell!9713 0))(
  ( (ValueCellFull!9713 (v!12776 V!32151)) (EmptyCell!9713) )
))
(declare-datatypes ((array!56726 0))(
  ( (array!56727 (arr!27298 (Array (_ BitVec 32) ValueCell!9713)) (size!27759 (_ BitVec 32))) )
))
(declare-datatypes ((array!56728 0))(
  ( (array!56729 (arr!27299 (Array (_ BitVec 32) (_ BitVec 64))) (size!27760 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4576 0))(
  ( (LongMapFixedSize!4577 (defaultEntry!5579 Int) (mask!27130 (_ BitVec 32)) (extraKeys!5311 (_ BitVec 32)) (zeroValue!5415 V!32151) (minValue!5415 V!32151) (_size!2343 (_ BitVec 32)) (_keys!10429 array!56728) (_values!5602 array!56726) (_vacant!2343 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4576)

(assert (=> b!940897 (= res!632629 (or (not (= (size!27759 (_values!5602 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27130 thiss!1141)))) (not (= (size!27760 (_keys!10429 thiss!1141)) (size!27759 (_values!5602 thiss!1141)))) (bvslt (mask!27130 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5311 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5311 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940898 () Bool)

(declare-fun e!528868 () Bool)

(declare-fun e!528864 () Bool)

(assert (=> b!940898 (= e!528868 e!528864)))

(declare-fun res!632627 () Bool)

(assert (=> b!940898 (=> (not res!632627) (not e!528864))))

(declare-datatypes ((SeekEntryResult!9011 0))(
  ( (MissingZero!9011 (index!38415 (_ BitVec 32))) (Found!9011 (index!38416 (_ BitVec 32))) (Intermediate!9011 (undefined!9823 Bool) (index!38417 (_ BitVec 32)) (x!80712 (_ BitVec 32))) (Undefined!9011) (MissingVacant!9011 (index!38418 (_ BitVec 32))) )
))
(declare-fun lt!424849 () SeekEntryResult!9011)

(assert (=> b!940898 (= res!632627 (is-Found!9011 lt!424849))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56728 (_ BitVec 32)) SeekEntryResult!9011)

(assert (=> b!940898 (= lt!424849 (seekEntry!0 key!756 (_keys!10429 thiss!1141) (mask!27130 thiss!1141)))))

(declare-fun res!632626 () Bool)

(assert (=> start!80026 (=> (not res!632626) (not e!528868))))

(declare-fun valid!1755 (LongMapFixedSize!4576) Bool)

(assert (=> start!80026 (= res!632626 (valid!1755 thiss!1141))))

(assert (=> start!80026 e!528868))

(declare-fun e!528866 () Bool)

(assert (=> start!80026 e!528866))

(assert (=> start!80026 true))

(declare-fun b!940899 () Bool)

(assert (=> b!940899 (= e!528864 (not e!528861))))

(declare-fun res!632628 () Bool)

(assert (=> b!940899 (=> res!632628 e!528861)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940899 (= res!632628 (not (validMask!0 (mask!27130 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940899 (arrayContainsKey!0 (_keys!10429 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31788 0))(
  ( (Unit!31789) )
))
(declare-fun lt!424847 () Unit!31788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56728 (_ BitVec 64) (_ BitVec 32)) Unit!31788)

(assert (=> b!940899 (= lt!424847 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10429 thiss!1141) key!756 (index!38416 lt!424849)))))

(declare-fun b!940900 () Bool)

(declare-fun res!632624 () Bool)

(assert (=> b!940900 (=> (not res!632624) (not e!528868))))

(assert (=> b!940900 (= res!632624 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940901 () Bool)

(declare-fun e!528865 () Bool)

(assert (=> b!940901 (= e!528865 tp_is_empty!20389)))

(declare-fun mapNonEmpty!32374 () Bool)

(declare-fun mapRes!32374 () Bool)

(declare-fun tp!62118 () Bool)

(assert (=> mapNonEmpty!32374 (= mapRes!32374 (and tp!62118 e!528865))))

(declare-fun mapRest!32374 () (Array (_ BitVec 32) ValueCell!9713))

(declare-fun mapKey!32374 () (_ BitVec 32))

(declare-fun mapValue!32374 () ValueCell!9713)

(assert (=> mapNonEmpty!32374 (= (arr!27298 (_values!5602 thiss!1141)) (store mapRest!32374 mapKey!32374 mapValue!32374))))

(declare-fun e!528867 () Bool)

(declare-fun array_inv!21218 (array!56728) Bool)

(declare-fun array_inv!21219 (array!56726) Bool)

(assert (=> b!940902 (= e!528866 (and tp!62117 tp_is_empty!20389 (array_inv!21218 (_keys!10429 thiss!1141)) (array_inv!21219 (_values!5602 thiss!1141)) e!528867))))

(declare-fun b!940903 () Bool)

(assert (=> b!940903 (= e!528867 (and e!528863 mapRes!32374))))

(declare-fun condMapEmpty!32374 () Bool)

(declare-fun mapDefault!32374 () ValueCell!9713)

