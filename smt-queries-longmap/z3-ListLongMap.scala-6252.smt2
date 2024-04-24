; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80146 () Bool)

(assert start!80146)

(declare-fun b!941080 () Bool)

(declare-fun b_free!17833 () Bool)

(declare-fun b_next!17833 () Bool)

(assert (=> b!941080 (= b_free!17833 (not b_next!17833))))

(declare-fun tp!61974 () Bool)

(declare-fun b_and!29255 () Bool)

(assert (=> b!941080 (= tp!61974 b_and!29255)))

(declare-fun b!941079 () Bool)

(declare-fun e!528867 () Bool)

(assert (=> b!941079 (= e!528867 true)))

(declare-fun lt!424994 () Bool)

(declare-datatypes ((V!32087 0))(
  ( (V!32088 (val!10221 Int)) )
))
(declare-datatypes ((ValueCell!9689 0))(
  ( (ValueCellFull!9689 (v!12749 V!32087)) (EmptyCell!9689) )
))
(declare-datatypes ((array!56681 0))(
  ( (array!56682 (arr!27271 (Array (_ BitVec 32) ValueCell!9689)) (size!27733 (_ BitVec 32))) )
))
(declare-datatypes ((array!56683 0))(
  ( (array!56684 (arr!27272 (Array (_ BitVec 32) (_ BitVec 64))) (size!27734 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4528 0))(
  ( (LongMapFixedSize!4529 (defaultEntry!5555 Int) (mask!27133 (_ BitVec 32)) (extraKeys!5287 (_ BitVec 32)) (zeroValue!5391 V!32087) (minValue!5391 V!32087) (_size!2319 (_ BitVec 32)) (_keys!10433 array!56683) (_values!5578 array!56681) (_vacant!2319 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4528)

(declare-datatypes ((List!19168 0))(
  ( (Nil!19165) (Cons!19164 (h!20316 (_ BitVec 64)) (t!27475 List!19168)) )
))
(declare-fun arrayNoDuplicates!0 (array!56683 (_ BitVec 32) List!19168) Bool)

(assert (=> b!941079 (= lt!424994 (arrayNoDuplicates!0 (_keys!10433 thiss!1141) #b00000000000000000000000000000000 Nil!19165))))

(declare-fun mapNonEmpty!32302 () Bool)

(declare-fun mapRes!32302 () Bool)

(declare-fun tp!61975 () Bool)

(declare-fun e!528868 () Bool)

(assert (=> mapNonEmpty!32302 (= mapRes!32302 (and tp!61975 e!528868))))

(declare-fun mapKey!32302 () (_ BitVec 32))

(declare-fun mapRest!32302 () (Array (_ BitVec 32) ValueCell!9689))

(declare-fun mapValue!32302 () ValueCell!9689)

(assert (=> mapNonEmpty!32302 (= (arr!27271 (_values!5578 thiss!1141)) (store mapRest!32302 mapKey!32302 mapValue!32302))))

(declare-fun tp_is_empty!20341 () Bool)

(declare-fun e!528870 () Bool)

(declare-fun e!528869 () Bool)

(declare-fun array_inv!21292 (array!56683) Bool)

(declare-fun array_inv!21293 (array!56681) Bool)

(assert (=> b!941080 (= e!528870 (and tp!61974 tp_is_empty!20341 (array_inv!21292 (_keys!10433 thiss!1141)) (array_inv!21293 (_values!5578 thiss!1141)) e!528869))))

(declare-fun b!941081 () Bool)

(declare-fun res!632538 () Bool)

(assert (=> b!941081 (=> res!632538 e!528867)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56683 (_ BitVec 32)) Bool)

(assert (=> b!941081 (= res!632538 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10433 thiss!1141) (mask!27133 thiss!1141))))))

(declare-fun b!941082 () Bool)

(declare-fun e!528874 () Bool)

(assert (=> b!941082 (= e!528874 tp_is_empty!20341)))

(declare-fun b!941083 () Bool)

(declare-fun e!528871 () Bool)

(assert (=> b!941083 (= e!528871 (not e!528867))))

(declare-fun res!632536 () Bool)

(assert (=> b!941083 (=> res!632536 e!528867)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941083 (= res!632536 (not (validMask!0 (mask!27133 thiss!1141))))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!56683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941083 (arrayContainsKey!0 (_keys!10433 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31738 0))(
  ( (Unit!31739) )
))
(declare-fun lt!424993 () Unit!31738)

(declare-datatypes ((SeekEntryResult!8947 0))(
  ( (MissingZero!8947 (index!38159 (_ BitVec 32))) (Found!8947 (index!38160 (_ BitVec 32))) (Intermediate!8947 (undefined!9759 Bool) (index!38161 (_ BitVec 32)) (x!80598 (_ BitVec 32))) (Undefined!8947) (MissingVacant!8947 (index!38162 (_ BitVec 32))) )
))
(declare-fun lt!424992 () SeekEntryResult!8947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56683 (_ BitVec 64) (_ BitVec 32)) Unit!31738)

(assert (=> b!941083 (= lt!424993 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10433 thiss!1141) key!756 (index!38160 lt!424992)))))

(declare-fun b!941084 () Bool)

(declare-fun res!632537 () Bool)

(assert (=> b!941084 (=> res!632537 e!528867)))

(assert (=> b!941084 (= res!632537 (or (not (= (size!27733 (_values!5578 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27133 thiss!1141)))) (not (= (size!27734 (_keys!10433 thiss!1141)) (size!27733 (_values!5578 thiss!1141)))) (bvslt (mask!27133 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5287 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5287 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!32302 () Bool)

(assert (=> mapIsEmpty!32302 mapRes!32302))

(declare-fun b!941085 () Bool)

(declare-fun res!632541 () Bool)

(declare-fun e!528873 () Bool)

(assert (=> b!941085 (=> (not res!632541) (not e!528873))))

(assert (=> b!941085 (= res!632541 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!632539 () Bool)

(assert (=> start!80146 (=> (not res!632539) (not e!528873))))

(declare-fun valid!1746 (LongMapFixedSize!4528) Bool)

(assert (=> start!80146 (= res!632539 (valid!1746 thiss!1141))))

(assert (=> start!80146 e!528873))

(assert (=> start!80146 e!528870))

(assert (=> start!80146 true))

(declare-fun b!941086 () Bool)

(assert (=> b!941086 (= e!528873 e!528871)))

(declare-fun res!632540 () Bool)

(assert (=> b!941086 (=> (not res!632540) (not e!528871))))

(get-info :version)

(assert (=> b!941086 (= res!632540 ((_ is Found!8947) lt!424992))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56683 (_ BitVec 32)) SeekEntryResult!8947)

(assert (=> b!941086 (= lt!424992 (seekEntry!0 key!756 (_keys!10433 thiss!1141) (mask!27133 thiss!1141)))))

(declare-fun b!941087 () Bool)

(assert (=> b!941087 (= e!528868 tp_is_empty!20341)))

(declare-fun b!941088 () Bool)

(assert (=> b!941088 (= e!528869 (and e!528874 mapRes!32302))))

(declare-fun condMapEmpty!32302 () Bool)

(declare-fun mapDefault!32302 () ValueCell!9689)

(assert (=> b!941088 (= condMapEmpty!32302 (= (arr!27271 (_values!5578 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9689)) mapDefault!32302)))))

(assert (= (and start!80146 res!632539) b!941085))

(assert (= (and b!941085 res!632541) b!941086))

(assert (= (and b!941086 res!632540) b!941083))

(assert (= (and b!941083 (not res!632536)) b!941084))

(assert (= (and b!941084 (not res!632537)) b!941081))

(assert (= (and b!941081 (not res!632538)) b!941079))

(assert (= (and b!941088 condMapEmpty!32302) mapIsEmpty!32302))

(assert (= (and b!941088 (not condMapEmpty!32302)) mapNonEmpty!32302))

(assert (= (and mapNonEmpty!32302 ((_ is ValueCellFull!9689) mapValue!32302)) b!941087))

(assert (= (and b!941088 ((_ is ValueCellFull!9689) mapDefault!32302)) b!941082))

(assert (= b!941080 b!941088))

(assert (= start!80146 b!941080))

(declare-fun m!877007 () Bool)

(assert (=> b!941080 m!877007))

(declare-fun m!877009 () Bool)

(assert (=> b!941080 m!877009))

(declare-fun m!877011 () Bool)

(assert (=> b!941086 m!877011))

(declare-fun m!877013 () Bool)

(assert (=> b!941079 m!877013))

(declare-fun m!877015 () Bool)

(assert (=> b!941083 m!877015))

(declare-fun m!877017 () Bool)

(assert (=> b!941083 m!877017))

(declare-fun m!877019 () Bool)

(assert (=> b!941083 m!877019))

(declare-fun m!877021 () Bool)

(assert (=> start!80146 m!877021))

(declare-fun m!877023 () Bool)

(assert (=> mapNonEmpty!32302 m!877023))

(declare-fun m!877025 () Bool)

(assert (=> b!941081 m!877025))

(check-sat (not b!941081) (not b!941083) (not b!941086) (not b_next!17833) (not start!80146) tp_is_empty!20341 b_and!29255 (not b!941079) (not mapNonEmpty!32302) (not b!941080))
(check-sat b_and!29255 (not b_next!17833))
