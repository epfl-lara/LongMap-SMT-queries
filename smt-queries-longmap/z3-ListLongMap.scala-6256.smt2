; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!80170 () Bool)

(assert start!80170)

(declare-fun b!941443 () Bool)

(declare-fun b_free!17857 () Bool)

(declare-fun b_next!17857 () Bool)

(assert (=> b!941443 (= b_free!17857 (not b_next!17857))))

(declare-fun tp!62047 () Bool)

(declare-fun b_and!29279 () Bool)

(assert (=> b!941443 (= tp!62047 b_and!29279)))

(declare-fun b!941439 () Bool)

(declare-fun res!632752 () Bool)

(declare-fun e!529156 () Bool)

(assert (=> b!941439 (=> (not res!632752) (not e!529156))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!941439 (= res!632752 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!32338 () Bool)

(declare-fun mapRes!32338 () Bool)

(declare-fun tp!62046 () Bool)

(declare-fun e!529158 () Bool)

(assert (=> mapNonEmpty!32338 (= mapRes!32338 (and tp!62046 e!529158))))

(declare-datatypes ((V!32119 0))(
  ( (V!32120 (val!10233 Int)) )
))
(declare-datatypes ((ValueCell!9701 0))(
  ( (ValueCellFull!9701 (v!12761 V!32119)) (EmptyCell!9701) )
))
(declare-fun mapValue!32338 () ValueCell!9701)

(declare-fun mapRest!32338 () (Array (_ BitVec 32) ValueCell!9701))

(declare-datatypes ((array!56729 0))(
  ( (array!56730 (arr!27295 (Array (_ BitVec 32) ValueCell!9701)) (size!27757 (_ BitVec 32))) )
))
(declare-datatypes ((array!56731 0))(
  ( (array!56732 (arr!27296 (Array (_ BitVec 32) (_ BitVec 64))) (size!27758 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4552 0))(
  ( (LongMapFixedSize!4553 (defaultEntry!5567 Int) (mask!27153 (_ BitVec 32)) (extraKeys!5299 (_ BitVec 32)) (zeroValue!5403 V!32119) (minValue!5403 V!32119) (_size!2331 (_ BitVec 32)) (_keys!10445 array!56731) (_values!5590 array!56729) (_vacant!2331 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4552)

(declare-fun mapKey!32338 () (_ BitVec 32))

(assert (=> mapNonEmpty!32338 (= (arr!27295 (_values!5590 thiss!1141)) (store mapRest!32338 mapKey!32338 mapValue!32338))))

(declare-fun res!632757 () Bool)

(assert (=> start!80170 (=> (not res!632757) (not e!529156))))

(declare-fun valid!1753 (LongMapFixedSize!4552) Bool)

(assert (=> start!80170 (= res!632757 (valid!1753 thiss!1141))))

(assert (=> start!80170 e!529156))

(declare-fun e!529155 () Bool)

(assert (=> start!80170 e!529155))

(assert (=> start!80170 true))

(declare-fun b!941440 () Bool)

(declare-fun e!529162 () Bool)

(assert (=> b!941440 (= e!529162 true)))

(declare-fun lt!425100 () Bool)

(declare-datatypes ((List!19175 0))(
  ( (Nil!19172) (Cons!19171 (h!20323 (_ BitVec 64)) (t!27482 List!19175)) )
))
(declare-fun arrayNoDuplicates!0 (array!56731 (_ BitVec 32) List!19175) Bool)

(assert (=> b!941440 (= lt!425100 (arrayNoDuplicates!0 (_keys!10445 thiss!1141) #b00000000000000000000000000000000 Nil!19172))))

(declare-fun b!941441 () Bool)

(declare-fun e!529160 () Bool)

(assert (=> b!941441 (= e!529160 (not e!529162))))

(declare-fun res!632755 () Bool)

(assert (=> b!941441 (=> res!632755 e!529162)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941441 (= res!632755 (not (validMask!0 (mask!27153 thiss!1141))))))

(declare-fun arrayContainsKey!0 (array!56731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!941441 (arrayContainsKey!0 (_keys!10445 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8957 0))(
  ( (MissingZero!8957 (index!38199 (_ BitVec 32))) (Found!8957 (index!38200 (_ BitVec 32))) (Intermediate!8957 (undefined!9769 Bool) (index!38201 (_ BitVec 32)) (x!80640 (_ BitVec 32))) (Undefined!8957) (MissingVacant!8957 (index!38202 (_ BitVec 32))) )
))
(declare-fun lt!425102 () SeekEntryResult!8957)

(declare-datatypes ((Unit!31754 0))(
  ( (Unit!31755) )
))
(declare-fun lt!425101 () Unit!31754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!56731 (_ BitVec 64) (_ BitVec 32)) Unit!31754)

(assert (=> b!941441 (= lt!425101 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10445 thiss!1141) key!756 (index!38200 lt!425102)))))

(declare-fun b!941442 () Bool)

(declare-fun e!529157 () Bool)

(declare-fun tp_is_empty!20365 () Bool)

(assert (=> b!941442 (= e!529157 tp_is_empty!20365)))

(declare-fun e!529161 () Bool)

(declare-fun array_inv!21308 (array!56731) Bool)

(declare-fun array_inv!21309 (array!56729) Bool)

(assert (=> b!941443 (= e!529155 (and tp!62047 tp_is_empty!20365 (array_inv!21308 (_keys!10445 thiss!1141)) (array_inv!21309 (_values!5590 thiss!1141)) e!529161))))

(declare-fun b!941444 () Bool)

(declare-fun res!632756 () Bool)

(assert (=> b!941444 (=> res!632756 e!529162)))

(assert (=> b!941444 (= res!632756 (or (not (= (size!27757 (_values!5590 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27153 thiss!1141)))) (not (= (size!27758 (_keys!10445 thiss!1141)) (size!27757 (_values!5590 thiss!1141)))) (bvslt (mask!27153 thiss!1141) #b00000000000000000000000000000000) (bvslt (extraKeys!5299 thiss!1141) #b00000000000000000000000000000000) (bvsgt (extraKeys!5299 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!941445 () Bool)

(assert (=> b!941445 (= e!529158 tp_is_empty!20365)))

(declare-fun b!941446 () Bool)

(assert (=> b!941446 (= e!529161 (and e!529157 mapRes!32338))))

(declare-fun condMapEmpty!32338 () Bool)

(declare-fun mapDefault!32338 () ValueCell!9701)

(assert (=> b!941446 (= condMapEmpty!32338 (= (arr!27295 (_values!5590 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9701)) mapDefault!32338)))))

(declare-fun b!941447 () Bool)

(declare-fun res!632753 () Bool)

(assert (=> b!941447 (=> res!632753 e!529162)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56731 (_ BitVec 32)) Bool)

(assert (=> b!941447 (= res!632753 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10445 thiss!1141) (mask!27153 thiss!1141))))))

(declare-fun b!941448 () Bool)

(assert (=> b!941448 (= e!529156 e!529160)))

(declare-fun res!632754 () Bool)

(assert (=> b!941448 (=> (not res!632754) (not e!529160))))

(get-info :version)

(assert (=> b!941448 (= res!632754 ((_ is Found!8957) lt!425102))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!56731 (_ BitVec 32)) SeekEntryResult!8957)

(assert (=> b!941448 (= lt!425102 (seekEntry!0 key!756 (_keys!10445 thiss!1141) (mask!27153 thiss!1141)))))

(declare-fun mapIsEmpty!32338 () Bool)

(assert (=> mapIsEmpty!32338 mapRes!32338))

(assert (= (and start!80170 res!632757) b!941439))

(assert (= (and b!941439 res!632752) b!941448))

(assert (= (and b!941448 res!632754) b!941441))

(assert (= (and b!941441 (not res!632755)) b!941444))

(assert (= (and b!941444 (not res!632756)) b!941447))

(assert (= (and b!941447 (not res!632753)) b!941440))

(assert (= (and b!941446 condMapEmpty!32338) mapIsEmpty!32338))

(assert (= (and b!941446 (not condMapEmpty!32338)) mapNonEmpty!32338))

(assert (= (and mapNonEmpty!32338 ((_ is ValueCellFull!9701) mapValue!32338)) b!941445))

(assert (= (and b!941446 ((_ is ValueCellFull!9701) mapDefault!32338)) b!941442))

(assert (= b!941443 b!941446))

(assert (= start!80170 b!941443))

(declare-fun m!877247 () Bool)

(assert (=> b!941441 m!877247))

(declare-fun m!877249 () Bool)

(assert (=> b!941441 m!877249))

(declare-fun m!877251 () Bool)

(assert (=> b!941441 m!877251))

(declare-fun m!877253 () Bool)

(assert (=> b!941443 m!877253))

(declare-fun m!877255 () Bool)

(assert (=> b!941443 m!877255))

(declare-fun m!877257 () Bool)

(assert (=> b!941448 m!877257))

(declare-fun m!877259 () Bool)

(assert (=> b!941440 m!877259))

(declare-fun m!877261 () Bool)

(assert (=> b!941447 m!877261))

(declare-fun m!877263 () Bool)

(assert (=> start!80170 m!877263))

(declare-fun m!877265 () Bool)

(assert (=> mapNonEmpty!32338 m!877265))

(check-sat (not b!941443) (not b!941448) (not b!941441) (not start!80170) tp_is_empty!20365 b_and!29279 (not b_next!17857) (not mapNonEmpty!32338) (not b!941440) (not b!941447))
(check-sat b_and!29279 (not b_next!17857))
