; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81742 () Bool)

(assert start!81742)

(declare-fun b!953848 () Bool)

(declare-fun b_free!18301 () Bool)

(declare-fun b_next!18301 () Bool)

(assert (=> b!953848 (= b_free!18301 (not b_next!18301))))

(declare-fun tp!63531 () Bool)

(declare-fun b_and!29795 () Bool)

(assert (=> b!953848 (= tp!63531 b_and!29795)))

(declare-fun b!953845 () Bool)

(declare-fun res!638645 () Bool)

(declare-fun e!537283 () Bool)

(assert (=> b!953845 (=> (not res!638645) (not e!537283))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((V!32711 0))(
  ( (V!32712 (val!10455 Int)) )
))
(declare-datatypes ((ValueCell!9923 0))(
  ( (ValueCellFull!9923 (v!13005 V!32711)) (EmptyCell!9923) )
))
(declare-datatypes ((array!57707 0))(
  ( (array!57708 (arr!27739 (Array (_ BitVec 32) ValueCell!9923)) (size!28219 (_ BitVec 32))) )
))
(declare-datatypes ((array!57709 0))(
  ( (array!57710 (arr!27740 (Array (_ BitVec 32) (_ BitVec 64))) (size!28220 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4996 0))(
  ( (LongMapFixedSize!4997 (defaultEntry!5833 Int) (mask!27737 (_ BitVec 32)) (extraKeys!5565 (_ BitVec 32)) (zeroValue!5669 V!32711) (minValue!5669 V!32711) (_size!2553 (_ BitVec 32)) (_keys!10820 array!57709) (_values!5856 array!57707) (_vacant!2553 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4996)

(get-info :version)

(declare-datatypes ((SeekEntryResult!9122 0))(
  ( (MissingZero!9122 (index!38859 (_ BitVec 32))) (Found!9122 (index!38860 (_ BitVec 32))) (Intermediate!9122 (undefined!9934 Bool) (index!38861 (_ BitVec 32)) (x!81950 (_ BitVec 32))) (Undefined!9122) (MissingVacant!9122 (index!38862 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57709 (_ BitVec 32)) SeekEntryResult!9122)

(assert (=> b!953845 (= res!638645 (not ((_ is Found!9122) (seekEntry!0 key!756 (_keys!10820 thiss!1141) (mask!27737 thiss!1141)))))))

(declare-fun mapIsEmpty!33157 () Bool)

(declare-fun mapRes!33157 () Bool)

(assert (=> mapIsEmpty!33157 mapRes!33157))

(declare-fun b!953847 () Bool)

(declare-fun e!537284 () Bool)

(declare-fun tp_is_empty!20809 () Bool)

(assert (=> b!953847 (= e!537284 tp_is_empty!20809)))

(declare-fun e!537285 () Bool)

(declare-fun e!537282 () Bool)

(declare-fun array_inv!21604 (array!57709) Bool)

(declare-fun array_inv!21605 (array!57707) Bool)

(assert (=> b!953848 (= e!537282 (and tp!63531 tp_is_empty!20809 (array_inv!21604 (_keys!10820 thiss!1141)) (array_inv!21605 (_values!5856 thiss!1141)) e!537285))))

(declare-fun mapNonEmpty!33157 () Bool)

(declare-fun tp!63532 () Bool)

(declare-fun e!537281 () Bool)

(assert (=> mapNonEmpty!33157 (= mapRes!33157 (and tp!63532 e!537281))))

(declare-fun mapValue!33157 () ValueCell!9923)

(declare-fun mapRest!33157 () (Array (_ BitVec 32) ValueCell!9923))

(declare-fun mapKey!33157 () (_ BitVec 32))

(assert (=> mapNonEmpty!33157 (= (arr!27739 (_values!5856 thiss!1141)) (store mapRest!33157 mapKey!33157 mapValue!33157))))

(declare-fun b!953849 () Bool)

(assert (=> b!953849 (= e!537285 (and e!537284 mapRes!33157))))

(declare-fun condMapEmpty!33157 () Bool)

(declare-fun mapDefault!33157 () ValueCell!9923)

(assert (=> b!953849 (= condMapEmpty!33157 (= (arr!27739 (_values!5856 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9923)) mapDefault!33157)))))

(declare-fun b!953850 () Bool)

(assert (=> b!953850 (= e!537281 tp_is_empty!20809)))

(declare-fun b!953846 () Bool)

(assert (=> b!953846 (= e!537283 (not true))))

(assert (=> b!953846 false))

(declare-fun lt!429811 () (_ BitVec 32))

(declare-datatypes ((Unit!32038 0))(
  ( (Unit!32039) )
))
(declare-fun lt!429814 () Unit!32038)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!57709 (_ BitVec 32)) Unit!32038)

(assert (=> b!953846 (= lt!429814 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!756 lt!429811 (_keys!10820 thiss!1141) (mask!27737 thiss!1141)))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57709 (_ BitVec 32)) Bool)

(assert (=> b!953846 (arrayForallSeekEntryOrOpenFound!0 lt!429811 (_keys!10820 thiss!1141) (mask!27737 thiss!1141))))

(declare-fun lt!429812 () Unit!32038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32038)

(assert (=> b!953846 (= lt!429812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10820 thiss!1141) (mask!27737 thiss!1141) #b00000000000000000000000000000000 lt!429811))))

(declare-fun arrayScanForKey!0 (array!57709 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953846 (= lt!429811 (arrayScanForKey!0 (_keys!10820 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953846 (arrayContainsKey!0 (_keys!10820 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429813 () Unit!32038)

(declare-fun lemmaKeyInListMapIsInArray!337 (array!57709 array!57707 (_ BitVec 32) (_ BitVec 32) V!32711 V!32711 (_ BitVec 64) Int) Unit!32038)

(assert (=> b!953846 (= lt!429813 (lemmaKeyInListMapIsInArray!337 (_keys!10820 thiss!1141) (_values!5856 thiss!1141) (mask!27737 thiss!1141) (extraKeys!5565 thiss!1141) (zeroValue!5669 thiss!1141) (minValue!5669 thiss!1141) key!756 (defaultEntry!5833 thiss!1141)))))

(declare-fun res!638643 () Bool)

(assert (=> start!81742 (=> (not res!638643) (not e!537283))))

(declare-fun valid!1908 (LongMapFixedSize!4996) Bool)

(assert (=> start!81742 (= res!638643 (valid!1908 thiss!1141))))

(assert (=> start!81742 e!537283))

(assert (=> start!81742 e!537282))

(assert (=> start!81742 true))

(declare-fun b!953851 () Bool)

(declare-fun res!638642 () Bool)

(assert (=> b!953851 (=> (not res!638642) (not e!537283))))

(declare-datatypes ((tuple2!13574 0))(
  ( (tuple2!13575 (_1!6798 (_ BitVec 64)) (_2!6798 V!32711)) )
))
(declare-datatypes ((List!19359 0))(
  ( (Nil!19356) (Cons!19355 (h!20523 tuple2!13574) (t!27710 List!19359)) )
))
(declare-datatypes ((ListLongMap!12273 0))(
  ( (ListLongMap!12274 (toList!6152 List!19359)) )
))
(declare-fun contains!5258 (ListLongMap!12273 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3385 (array!57709 array!57707 (_ BitVec 32) (_ BitVec 32) V!32711 V!32711 (_ BitVec 32) Int) ListLongMap!12273)

(assert (=> b!953851 (= res!638642 (contains!5258 (getCurrentListMap!3385 (_keys!10820 thiss!1141) (_values!5856 thiss!1141) (mask!27737 thiss!1141) (extraKeys!5565 thiss!1141) (zeroValue!5669 thiss!1141) (minValue!5669 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5833 thiss!1141)) key!756))))

(declare-fun b!953852 () Bool)

(declare-fun res!638644 () Bool)

(assert (=> b!953852 (=> (not res!638644) (not e!537283))))

(assert (=> b!953852 (= res!638644 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!81742 res!638643) b!953852))

(assert (= (and b!953852 res!638644) b!953845))

(assert (= (and b!953845 res!638645) b!953851))

(assert (= (and b!953851 res!638642) b!953846))

(assert (= (and b!953849 condMapEmpty!33157) mapIsEmpty!33157))

(assert (= (and b!953849 (not condMapEmpty!33157)) mapNonEmpty!33157))

(assert (= (and mapNonEmpty!33157 ((_ is ValueCellFull!9923) mapValue!33157)) b!953850))

(assert (= (and b!953849 ((_ is ValueCellFull!9923) mapDefault!33157)) b!953847))

(assert (= b!953848 b!953849))

(assert (= start!81742 b!953848))

(declare-fun m!886313 () Bool)

(assert (=> b!953846 m!886313))

(declare-fun m!886315 () Bool)

(assert (=> b!953846 m!886315))

(declare-fun m!886317 () Bool)

(assert (=> b!953846 m!886317))

(declare-fun m!886319 () Bool)

(assert (=> b!953846 m!886319))

(declare-fun m!886321 () Bool)

(assert (=> b!953846 m!886321))

(declare-fun m!886323 () Bool)

(assert (=> b!953846 m!886323))

(declare-fun m!886325 () Bool)

(assert (=> start!81742 m!886325))

(declare-fun m!886327 () Bool)

(assert (=> b!953848 m!886327))

(declare-fun m!886329 () Bool)

(assert (=> b!953848 m!886329))

(declare-fun m!886331 () Bool)

(assert (=> b!953851 m!886331))

(assert (=> b!953851 m!886331))

(declare-fun m!886333 () Bool)

(assert (=> b!953851 m!886333))

(declare-fun m!886335 () Bool)

(assert (=> mapNonEmpty!33157 m!886335))

(declare-fun m!886337 () Bool)

(assert (=> b!953845 m!886337))

(check-sat (not b!953846) (not b!953845) b_and!29795 (not start!81742) (not b_next!18301) tp_is_empty!20809 (not mapNonEmpty!33157) (not b!953851) (not b!953848))
(check-sat b_and!29795 (not b_next!18301))
