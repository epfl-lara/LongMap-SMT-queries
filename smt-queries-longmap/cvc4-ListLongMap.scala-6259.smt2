; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80024 () Bool)

(assert start!80024)

(declare-fun b!940866 () Bool)

(declare-fun b_free!17879 () Bool)

(declare-fun b_next!17879 () Bool)

(assert (=> b!940866 (= b_free!17879 (not b_next!17879))))

(declare-fun tp!62112 () Bool)

(declare-fun b_and!29291 () Bool)

(assert (=> b!940866 (= tp!62112 b_and!29291)))

(declare-fun e!528842 () Bool)

(declare-fun e!528841 () Bool)

(declare-datatypes ((V!32147 0))(
  ( (V!32148 (val!10244 Int)) )
))
(declare-datatypes ((ValueCell!9712 0))(
  ( (ValueCellFull!9712 (v!12775 V!32147)) (EmptyCell!9712) )
))
(declare-datatypes ((array!56722 0))(
  ( (array!56723 (arr!27296 (Array (_ BitVec 32) ValueCell!9712)) (size!27757 (_ BitVec 32))) )
))
(declare-datatypes ((array!56724 0))(
  ( (array!56725 (arr!27297 (Array (_ BitVec 32) (_ BitVec 64))) (size!27758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4574 0))(
  ( (LongMapFixedSize!4575 (defaultEntry!5578 Int) (mask!27127 (_ BitVec 32)) (extraKeys!5310 (_ BitVec 32)) (zeroValue!5414 V!32147) (minValue!5414 V!32147) (_size!2342 (_ BitVec 32)) (_keys!10428 array!56724) (_values!5601 array!56722) (_vacant!2342 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4574)

(declare-fun tp_is_empty!20387 () Bool)

(declare-fun array_inv!21216 (array!56724) Bool)

(declare-fun array_inv!21217 (array!56722) Bool)

(assert (=> b!940866 (= e!528841 (and tp!62112 tp_is_empty!20387 (array_inv!21216 (_keys!10428 thiss!1141)) (array_inv!21217 (_values!5601 thiss!1141)) e!528842))))

(declare-fun b!940867 () Bool)

(declare-fun res!632611 () Bool)

(declare-fun e!528844 () Bool)

(assert (=> b!940867 (=> res!632611 e!528844)))

(assert (=> b!940867 (= res!632611 (or (not (= (size!27757 (_values!5601 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27127 thiss!1141)))) (not (= (size!27758 (_keys!10428 thiss!1141)) (size!27757 (_values!5601 thiss!1141)))) (bvslt (mask!27127 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5310 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5310 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!940868 () Bool)

(assert (=> b!940868 (= e!528844 true)))

(declare-fun lt!424840 () Bool)

(declare-datatypes ((List!19198 0))(
  ( (Nil!19195) (Cons!19194 (h!20340 (_ BitVec 64)) (t!27513 List!19198)) )
))
(declare-fun arrayNoDuplicates!0 (array!56724 (_ BitVec 32) List!19198) Bool)

(assert (=> b!940868 (= lt!424840 (arrayNoDuplicates!0 (_keys!10428 thiss!1141) #b00000000000000000000000000000000 Nil!19195))))

(declare-fun b!940869 () Bool)

(declare-fun e!528838 () Bool)

(assert (=> b!940869 (= e!528838 (not e!528844))))

(declare-fun res!632607 () Bool)

(assert (=> b!940869 (=> res!632607 e!528844)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940869 (= res!632607 (not (validMask!0 (mask!27127 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940869 (arrayContainsKey!0 (_keys!10428 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31786 0))(
  ( (Unit!31787) )
))
(declare-fun lt!424838 () Unit!31786)

(declare-datatypes ((SeekEntryResult!9010 0))(
  ( (MissingZero!9010 (index!38411 (_ BitVec 32))) (Found!9010 (index!38412 (_ BitVec 32))) (Intermediate!9010 (undefined!9822 Bool) (index!38413 (_ BitVec 32)) (x!80703 (_ BitVec 32))) (Undefined!9010) (MissingVacant!9010 (index!38414 (_ BitVec 32))) )
))
(declare-fun lt!424839 () SeekEntryResult!9010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56724 (_ BitVec 64) (_ BitVec 32)) Unit!31786)

(assert (=> b!940869 (= lt!424838 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10428 thiss!1141) key!756 (index!38412 lt!424839)))))

(declare-fun b!940870 () Bool)

(declare-fun e!528843 () Bool)

(assert (=> b!940870 (= e!528843 tp_is_empty!20387)))

(declare-fun b!940871 () Bool)

(declare-fun res!632606 () Bool)

(declare-fun e!528837 () Bool)

(assert (=> b!940871 (=> (not res!632606) (not e!528837))))

(assert (=> b!940871 (= res!632606 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632608 () Bool)

(assert (=> start!80024 (=> (not res!632608) (not e!528837))))

(declare-fun valid!1754 (LongMapFixedSize!4574) Bool)

(assert (=> start!80024 (= res!632608 (valid!1754 thiss!1141))))

(assert (=> start!80024 e!528837))

(assert (=> start!80024 e!528841))

(assert (=> start!80024 true))

(declare-fun b!940872 () Bool)

(declare-fun mapRes!32371 () Bool)

(assert (=> b!940872 (= e!528842 (and e!528843 mapRes!32371))))

(declare-fun condMapEmpty!32371 () Bool)

(declare-fun mapDefault!32371 () ValueCell!9712)

