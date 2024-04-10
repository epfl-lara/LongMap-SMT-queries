; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79980 () Bool)

(assert start!79980)

(declare-fun b!940208 () Bool)

(declare-fun b_free!17835 () Bool)

(declare-fun b_next!17835 () Bool)

(assert (=> b!940208 (= b_free!17835 (not b_next!17835))))

(declare-fun tp!61979 () Bool)

(declare-fun b_and!29247 () Bool)

(assert (=> b!940208 (= tp!61979 b_and!29247)))

(declare-fun b!940206 () Bool)

(declare-fun e!528314 () Bool)

(declare-fun e!528315 () Bool)

(assert (=> b!940206 (= e!528314 e!528315)))

(declare-fun res!632211 () Bool)

(assert (=> b!940206 (=> (not res!632211) (not e!528315))))

(declare-datatypes ((SeekEntryResult!8992 0))(
  ( (MissingZero!8992 (index!38339 (_ BitVec 32))) (Found!8992 (index!38340 (_ BitVec 32))) (Intermediate!8992 (undefined!9804 Bool) (index!38341 (_ BitVec 32)) (x!80629 (_ BitVec 32))) (Undefined!8992) (MissingVacant!8992 (index!38342 (_ BitVec 32))) )
))
(declare-fun lt!424640 () SeekEntryResult!8992)

(get-info :version)

(assert (=> b!940206 (= res!632211 ((_ is Found!8992) lt!424640))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32089 0))(
  ( (V!32090 (val!10222 Int)) )
))
(declare-datatypes ((ValueCell!9690 0))(
  ( (ValueCellFull!9690 (v!12753 V!32089)) (EmptyCell!9690) )
))
(declare-datatypes ((array!56634 0))(
  ( (array!56635 (arr!27252 (Array (_ BitVec 32) ValueCell!9690)) (size!27713 (_ BitVec 32))) )
))
(declare-datatypes ((array!56636 0))(
  ( (array!56637 (arr!27253 (Array (_ BitVec 32) (_ BitVec 64))) (size!27714 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4530 0))(
  ( (LongMapFixedSize!4531 (defaultEntry!5556 Int) (mask!27091 (_ BitVec 32)) (extraKeys!5288 (_ BitVec 32)) (zeroValue!5392 V!32089) (minValue!5392 V!32089) (_size!2320 (_ BitVec 32)) (_keys!10406 array!56636) (_values!5579 array!56634) (_vacant!2320 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4530)

(declare-fun seekEntry!0 ((_ BitVec 64) array!56636 (_ BitVec 32)) SeekEntryResult!8992)

(assert (=> b!940206 (= lt!424640 (seekEntry!0 key!756 (_keys!10406 thiss!1141) (mask!27091 thiss!1141)))))

(declare-fun b!940207 () Bool)

(declare-fun e!528310 () Bool)

(assert (=> b!940207 (= e!528315 (not e!528310))))

(declare-fun res!632215 () Bool)

(assert (=> b!940207 (=> res!632215 e!528310)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!940207 (= res!632215 (not (validMask!0 (mask!27091 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!940207 (arrayContainsKey!0 (_keys!10406 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!31756 0))(
  ( (Unit!31757) )
))
(declare-fun lt!424641 () Unit!31756)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56636 (_ BitVec 64) (_ BitVec 32)) Unit!31756)

(assert (=> b!940207 (= lt!424641 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10406 thiss!1141) key!756 (index!38340 lt!424640)))))

(declare-fun e!528309 () Bool)

(declare-fun tp_is_empty!20343 () Bool)

(declare-fun e!528313 () Bool)

(declare-fun array_inv!21186 (array!56636) Bool)

(declare-fun array_inv!21187 (array!56634) Bool)

(assert (=> b!940208 (= e!528309 (and tp!61979 tp_is_empty!20343 (array_inv!21186 (_keys!10406 thiss!1141)) (array_inv!21187 (_values!5579 thiss!1141)) e!528313))))

(declare-fun b!940209 () Bool)

(declare-fun e!528312 () Bool)

(assert (=> b!940209 (= e!528312 tp_is_empty!20343)))

(declare-fun res!632212 () Bool)

(assert (=> start!79980 (=> (not res!632212) (not e!528314))))

(declare-fun valid!1738 (LongMapFixedSize!4530) Bool)

(assert (=> start!79980 (= res!632212 (valid!1738 thiss!1141))))

(assert (=> start!79980 e!528314))

(assert (=> start!79980 e!528309))

(assert (=> start!79980 true))

(declare-fun b!940210 () Bool)

(declare-fun res!632213 () Bool)

(assert (=> b!940210 (=> res!632213 e!528310)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56636 (_ BitVec 32)) Bool)

(assert (=> b!940210 (= res!632213 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10406 thiss!1141) (mask!27091 thiss!1141))))))

(declare-fun mapIsEmpty!32305 () Bool)

(declare-fun mapRes!32305 () Bool)

(assert (=> mapIsEmpty!32305 mapRes!32305))

(declare-fun b!940211 () Bool)

(declare-fun e!528316 () Bool)

(assert (=> b!940211 (= e!528316 tp_is_empty!20343)))

(declare-fun b!940212 () Bool)

(declare-fun res!632210 () Bool)

(assert (=> b!940212 (=> (not res!632210) (not e!528314))))

(assert (=> b!940212 (= res!632210 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!940213 () Bool)

(assert (=> b!940213 (= e!528310 true)))

(declare-fun lt!424642 () Bool)

(declare-datatypes ((List!19182 0))(
  ( (Nil!19179) (Cons!19178 (h!20324 (_ BitVec 64)) (t!27497 List!19182)) )
))
(declare-fun arrayNoDuplicates!0 (array!56636 (_ BitVec 32) List!19182) Bool)

(assert (=> b!940213 (= lt!424642 (arrayNoDuplicates!0 (_keys!10406 thiss!1141) #b00000000000000000000000000000000 Nil!19179))))

(declare-fun mapNonEmpty!32305 () Bool)

(declare-fun tp!61980 () Bool)

(assert (=> mapNonEmpty!32305 (= mapRes!32305 (and tp!61980 e!528312))))

(declare-fun mapValue!32305 () ValueCell!9690)

(declare-fun mapRest!32305 () (Array (_ BitVec 32) ValueCell!9690))

(declare-fun mapKey!32305 () (_ BitVec 32))

(assert (=> mapNonEmpty!32305 (= (arr!27252 (_values!5579 thiss!1141)) (store mapRest!32305 mapKey!32305 mapValue!32305))))

(declare-fun b!940214 () Bool)

(assert (=> b!940214 (= e!528313 (and e!528316 mapRes!32305))))

(declare-fun condMapEmpty!32305 () Bool)

(declare-fun mapDefault!32305 () ValueCell!9690)

(assert (=> b!940214 (= condMapEmpty!32305 (= (arr!27252 (_values!5579 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9690)) mapDefault!32305)))))

(declare-fun b!940215 () Bool)

(declare-fun res!632214 () Bool)

(assert (=> b!940215 (=> res!632214 e!528310)))

(assert (=> b!940215 (= res!632214 (or (not (= (size!27713 (_values!5579 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27091 thiss!1141)))) (not (= (size!27714 (_keys!10406 thiss!1141)) (size!27713 (_values!5579 thiss!1141)))) (bvslt (mask!27091 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5288 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5288 thiss!1141) #b00000000000000000000000000000011)))))

(assert (= (and start!79980 res!632212) b!940212))

(assert (= (and b!940212 res!632210) b!940206))

(assert (= (and b!940206 res!632211) b!940207))

(assert (= (and b!940207 (not res!632215)) b!940215))

(assert (= (and b!940215 (not res!632214)) b!940210))

(assert (= (and b!940210 (not res!632213)) b!940213))

(assert (= (and b!940214 condMapEmpty!32305) mapIsEmpty!32305))

(assert (= (and b!940214 (not condMapEmpty!32305)) mapNonEmpty!32305))

(assert (= (and mapNonEmpty!32305 ((_ is ValueCellFull!9690) mapValue!32305)) b!940209))

(assert (= (and b!940214 ((_ is ValueCellFull!9690) mapDefault!32305)) b!940211))

(assert (= b!940208 b!940214))

(assert (= start!79980 b!940208))

(declare-fun m!875733 () Bool)

(assert (=> mapNonEmpty!32305 m!875733))

(declare-fun m!875735 () Bool)

(assert (=> b!940207 m!875735))

(declare-fun m!875737 () Bool)

(assert (=> b!940207 m!875737))

(declare-fun m!875739 () Bool)

(assert (=> b!940207 m!875739))

(declare-fun m!875741 () Bool)

(assert (=> b!940213 m!875741))

(declare-fun m!875743 () Bool)

(assert (=> b!940208 m!875743))

(declare-fun m!875745 () Bool)

(assert (=> b!940208 m!875745))

(declare-fun m!875747 () Bool)

(assert (=> start!79980 m!875747))

(declare-fun m!875749 () Bool)

(assert (=> b!940210 m!875749))

(declare-fun m!875751 () Bool)

(assert (=> b!940206 m!875751))

(check-sat (not mapNonEmpty!32305) (not b_next!17835) tp_is_empty!20343 b_and!29247 (not b!940207) (not b!940210) (not b!940213) (not start!79980) (not b!940208) (not b!940206))
(check-sat b_and!29247 (not b_next!17835))
