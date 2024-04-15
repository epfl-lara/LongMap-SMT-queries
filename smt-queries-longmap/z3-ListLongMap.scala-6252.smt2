; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79960 () Bool)

(assert start!79960)

(declare-fun b!939937 () Bool)

(declare-fun b_free!17833 () Bool)

(declare-fun b_next!17833 () Bool)

(assert (=> b!939937 (= b_free!17833 (not b_next!17833))))

(declare-fun tp!61974 () Bool)

(declare-fun b_and!29219 () Bool)

(assert (=> b!939937 (= tp!61974 b_and!29219)))

(declare-fun e!528140 () Bool)

(declare-datatypes ((V!32087 0))(
  ( (V!32088 (val!10221 Int)) )
))
(declare-datatypes ((ValueCell!9689 0))(
  ( (ValueCellFull!9689 (v!12751 V!32087)) (EmptyCell!9689) )
))
(declare-datatypes ((array!56595 0))(
  ( (array!56596 (arr!27233 (Array (_ BitVec 32) ValueCell!9689)) (size!27696 (_ BitVec 32))) )
))
(declare-datatypes ((array!56597 0))(
  ( (array!56598 (arr!27234 (Array (_ BitVec 32) (_ BitVec 64))) (size!27697 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4528 0))(
  ( (LongMapFixedSize!4529 (defaultEntry!5555 Int) (mask!27083 (_ BitVec 32)) (extraKeys!5287 (_ BitVec 32)) (zeroValue!5391 V!32087) (minValue!5391 V!32087) (_size!2319 (_ BitVec 32)) (_keys!10400 array!56597) (_values!5578 array!56595) (_vacant!2319 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4528)

(declare-fun tp_is_empty!20341 () Bool)

(declare-fun e!528139 () Bool)

(declare-fun array_inv!21238 (array!56597) Bool)

(declare-fun array_inv!21239 (array!56595) Bool)

(assert (=> b!939937 (= e!528140 (and tp!61974 tp_is_empty!20341 (array_inv!21238 (_keys!10400 thiss!1141)) (array_inv!21239 (_values!5578 thiss!1141)) e!528139))))

(declare-fun b!939938 () Bool)

(declare-fun e!528137 () Bool)

(declare-fun e!528142 () Bool)

(assert (=> b!939938 (= e!528137 (not e!528142))))

(declare-fun res!632084 () Bool)

(assert (=> b!939938 (=> res!632084 e!528142)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!939938 (= res!632084 (not (validMask!0 (mask!27083 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!939938 (arrayContainsKey!0 (_keys!10400 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31641 0))(
  ( (Unit!31642) )
))
(declare-fun lt!424397 () Unit!31641)

(declare-datatypes ((SeekEntryResult!8992 0))(
  ( (MissingZero!8992 (index!38339 (_ BitVec 32))) (Found!8992 (index!38340 (_ BitVec 32))) (Intermediate!8992 (undefined!9804 Bool) (index!38341 (_ BitVec 32)) (x!80624 (_ BitVec 32))) (Undefined!8992) (MissingVacant!8992 (index!38342 (_ BitVec 32))) )
))
(declare-fun lt!424396 () SeekEntryResult!8992)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56597 (_ BitVec 64) (_ BitVec 32)) Unit!31641)

(assert (=> b!939938 (= lt!424397 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10400 thiss!1141) key!756 (index!38340 lt!424396)))))

(declare-fun b!939939 () Bool)

(declare-fun e!528143 () Bool)

(assert (=> b!939939 (= e!528143 tp_is_empty!20341)))

(declare-fun b!939940 () Bool)

(declare-fun e!528141 () Bool)

(assert (=> b!939940 (= e!528141 tp_is_empty!20341)))

(declare-fun mapNonEmpty!32302 () Bool)

(declare-fun mapRes!32302 () Bool)

(declare-fun tp!61975 () Bool)

(assert (=> mapNonEmpty!32302 (= mapRes!32302 (and tp!61975 e!528143))))

(declare-fun mapKey!32302 () (_ BitVec 32))

(declare-fun mapRest!32302 () (Array (_ BitVec 32) ValueCell!9689))

(declare-fun mapValue!32302 () ValueCell!9689)

(assert (=> mapNonEmpty!32302 (= (arr!27233 (_values!5578 thiss!1141)) (store mapRest!32302 mapKey!32302 mapValue!32302))))

(declare-fun b!939941 () Bool)

(declare-fun res!632083 () Bool)

(declare-fun e!528138 () Bool)

(assert (=> b!939941 (=> (not res!632083) (not e!528138))))

(assert (=> b!939941 (= res!632083 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632082 () Bool)

(assert (=> start!79960 (=> (not res!632082) (not e!528138))))

(declare-fun valid!1744 (LongMapFixedSize!4528) Bool)

(assert (=> start!79960 (= res!632082 (valid!1744 thiss!1141))))

(assert (=> start!79960 e!528138))

(assert (=> start!79960 e!528140))

(assert (=> start!79960 true))

(declare-fun b!939942 () Bool)

(declare-fun res!632087 () Bool)

(assert (=> b!939942 (=> res!632087 e!528142)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56597 (_ BitVec 32)) Bool)

(assert (=> b!939942 (= res!632087 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10400 thiss!1141) (mask!27083 thiss!1141))))))

(declare-fun b!939943 () Bool)

(declare-fun res!632085 () Bool)

(assert (=> b!939943 (=> res!632085 e!528142)))

(assert (=> b!939943 (= res!632085 (or (not (= (size!27696 (_values!5578 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27083 thiss!1141)))) (not (= (size!27697 (_keys!10400 thiss!1141)) (size!27696 (_values!5578 thiss!1141)))) (bvslt (mask!27083 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5287 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5287 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32302 () Bool)

(assert (=> mapIsEmpty!32302 mapRes!32302))

(declare-fun b!939944 () Bool)

(assert (=> b!939944 (= e!528138 e!528137)))

(declare-fun res!632086 () Bool)

(assert (=> b!939944 (=> (not res!632086) (not e!528137))))

(get-info :version)

(assert (=> b!939944 (= res!632086 ((_ is Found!8992) lt!424396))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56597 (_ BitVec 32)) SeekEntryResult!8992)

(assert (=> b!939944 (= lt!424396 (seekEntry!0 key!756 (_keys!10400 thiss!1141) (mask!27083 thiss!1141)))))

(declare-fun b!939945 () Bool)

(assert (=> b!939945 (= e!528142 true)))

(declare-fun lt!424395 () Bool)

(declare-datatypes ((List!19197 0))(
  ( (Nil!19194) (Cons!19193 (h!20339 (_ BitVec 64)) (t!27503 List!19197)) )
))
(declare-fun arrayNoDuplicates!0 (array!56597 (_ BitVec 32) List!19197) Bool)

(assert (=> b!939945 (= lt!424395 (arrayNoDuplicates!0 (_keys!10400 thiss!1141) #b00000000000000000000000000000000 Nil!19194))))

(declare-fun b!939946 () Bool)

(assert (=> b!939946 (= e!528139 (and e!528141 mapRes!32302))))

(declare-fun condMapEmpty!32302 () Bool)

(declare-fun mapDefault!32302 () ValueCell!9689)

(assert (=> b!939946 (= condMapEmpty!32302 (= (arr!27233 (_values!5578 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9689)) mapDefault!32302)))))

(assert (= (and start!79960 res!632082) b!939941))

(assert (= (and b!939941 res!632083) b!939944))

(assert (= (and b!939944 res!632086) b!939938))

(assert (= (and b!939938 (not res!632084)) b!939943))

(assert (= (and b!939943 (not res!632085)) b!939942))

(assert (= (and b!939942 (not res!632087)) b!939945))

(assert (= (and b!939946 condMapEmpty!32302) mapIsEmpty!32302))

(assert (= (and b!939946 (not condMapEmpty!32302)) mapNonEmpty!32302))

(assert (= (and mapNonEmpty!32302 ((_ is ValueCellFull!9689) mapValue!32302)) b!939939))

(assert (= (and b!939946 ((_ is ValueCellFull!9689) mapDefault!32302)) b!939940))

(assert (= b!939937 b!939946))

(assert (= start!79960 b!939937))

(declare-fun m!874955 () Bool)

(assert (=> b!939937 m!874955))

(declare-fun m!874957 () Bool)

(assert (=> b!939937 m!874957))

(declare-fun m!874959 () Bool)

(assert (=> start!79960 m!874959))

(declare-fun m!874961 () Bool)

(assert (=> b!939945 m!874961))

(declare-fun m!874963 () Bool)

(assert (=> mapNonEmpty!32302 m!874963))

(declare-fun m!874965 () Bool)

(assert (=> b!939944 m!874965))

(declare-fun m!874967 () Bool)

(assert (=> b!939942 m!874967))

(declare-fun m!874969 () Bool)

(assert (=> b!939938 m!874969))

(declare-fun m!874971 () Bool)

(assert (=> b!939938 m!874971))

(declare-fun m!874973 () Bool)

(assert (=> b!939938 m!874973))

(check-sat (not b!939937) (not mapNonEmpty!32302) (not b!939938) (not b!939942) (not b!939945) (not b!939944) (not b_next!17833) b_and!29219 (not start!79960) tp_is_empty!20341)
(check-sat b_and!29219 (not b_next!17833))
