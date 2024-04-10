; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75824 () Bool)

(assert start!75824)

(declare-fun b!892053 () Bool)

(declare-fun b_free!15795 () Bool)

(declare-fun b_next!15795 () Bool)

(assert (=> b!892053 (= b_free!15795 (not b_next!15795))))

(declare-fun tp!55353 () Bool)

(declare-fun b_and!26035 () Bool)

(assert (=> b!892053 (= tp!55353 b_and!26035)))

(declare-fun b!892051 () Bool)

(declare-fun e!497892 () Bool)

(assert (=> b!892051 (= e!497892 true)))

(declare-fun lt!402995 () Bool)

(declare-datatypes ((V!29129 0))(
  ( (V!29130 (val!9112 Int)) )
))
(declare-datatypes ((tuple2!11980 0))(
  ( (tuple2!11981 (_1!6001 (_ BitVec 64)) (_2!6001 V!29129)) )
))
(declare-datatypes ((List!17770 0))(
  ( (Nil!17767) (Cons!17766 (h!18897 tuple2!11980) (t!25069 List!17770)) )
))
(declare-datatypes ((ListLongMap!10677 0))(
  ( (ListLongMap!10678 (toList!5354 List!17770)) )
))
(declare-fun lt!402999 () ListLongMap!10677)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4356 (ListLongMap!10677 (_ BitVec 64)) Bool)

(assert (=> b!892051 (= lt!402995 (contains!4356 lt!402999 key!785))))

(declare-fun b!892052 () Bool)

(declare-fun res!604377 () Bool)

(assert (=> b!892052 (=> res!604377 e!497892)))

(declare-datatypes ((array!52226 0))(
  ( (array!52227 (arr!25119 (Array (_ BitVec 32) (_ BitVec 64))) (size!25563 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8580 0))(
  ( (ValueCellFull!8580 (v!11590 V!29129)) (EmptyCell!8580) )
))
(declare-datatypes ((array!52228 0))(
  ( (array!52229 (arr!25120 (Array (_ BitVec 32) ValueCell!8580)) (size!25564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4176 0))(
  ( (LongMapFixedSize!4177 (defaultEntry!5285 Int) (mask!25790 (_ BitVec 32)) (extraKeys!4979 (_ BitVec 32)) (zeroValue!5083 V!29129) (minValue!5083 V!29129) (_size!2143 (_ BitVec 32)) (_keys!9968 array!52226) (_values!5270 array!52228) (_vacant!2143 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4176)

(assert (=> b!892052 (= res!604377 (or (not (= (size!25564 (_values!5270 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25790 thiss!1181)))) (not (= (size!25563 (_keys!9968 thiss!1181)) (size!25564 (_values!5270 thiss!1181)))) (bvslt (mask!25790 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4979 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4979 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!497898 () Bool)

(declare-fun e!497895 () Bool)

(declare-fun tp_is_empty!18123 () Bool)

(declare-fun array_inv!19734 (array!52226) Bool)

(declare-fun array_inv!19735 (array!52228) Bool)

(assert (=> b!892053 (= e!497898 (and tp!55353 tp_is_empty!18123 (array_inv!19734 (_keys!9968 thiss!1181)) (array_inv!19735 (_values!5270 thiss!1181)) e!497895))))

(declare-fun b!892054 () Bool)

(declare-fun e!497897 () Bool)

(declare-fun mapRes!28739 () Bool)

(assert (=> b!892054 (= e!497895 (and e!497897 mapRes!28739))))

(declare-fun condMapEmpty!28739 () Bool)

(declare-fun mapDefault!28739 () ValueCell!8580)

(assert (=> b!892054 (= condMapEmpty!28739 (= (arr!25120 (_values!5270 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8580)) mapDefault!28739)))))

(declare-fun b!892055 () Bool)

(declare-fun res!604378 () Bool)

(declare-fun e!497893 () Bool)

(assert (=> b!892055 (=> (not res!604378) (not e!497893))))

(assert (=> b!892055 (= res!604378 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892056 () Bool)

(declare-fun e!497896 () Bool)

(assert (=> b!892056 (= e!497896 tp_is_empty!18123)))

(declare-fun b!892057 () Bool)

(declare-fun e!497894 () Bool)

(declare-datatypes ((SeekEntryResult!8839 0))(
  ( (MissingZero!8839 (index!37727 (_ BitVec 32))) (Found!8839 (index!37728 (_ BitVec 32))) (Intermediate!8839 (undefined!9651 Bool) (index!37729 (_ BitVec 32)) (x!75807 (_ BitVec 32))) (Undefined!8839) (MissingVacant!8839 (index!37730 (_ BitVec 32))) )
))
(declare-fun lt!402998 () SeekEntryResult!8839)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892057 (= e!497894 (inRange!0 (index!37728 lt!402998) (mask!25790 thiss!1181)))))

(declare-fun mapNonEmpty!28739 () Bool)

(declare-fun tp!55354 () Bool)

(assert (=> mapNonEmpty!28739 (= mapRes!28739 (and tp!55354 e!497896))))

(declare-fun mapRest!28739 () (Array (_ BitVec 32) ValueCell!8580))

(declare-fun mapKey!28739 () (_ BitVec 32))

(declare-fun mapValue!28739 () ValueCell!8580)

(assert (=> mapNonEmpty!28739 (= (arr!25120 (_values!5270 thiss!1181)) (store mapRest!28739 mapKey!28739 mapValue!28739))))

(declare-fun b!892058 () Bool)

(declare-fun res!604379 () Bool)

(assert (=> b!892058 (=> res!604379 e!497892)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52226 (_ BitVec 32)) Bool)

(assert (=> b!892058 (= res!604379 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9968 thiss!1181) (mask!25790 thiss!1181))))))

(declare-fun res!604374 () Bool)

(assert (=> start!75824 (=> (not res!604374) (not e!497893))))

(declare-fun valid!1617 (LongMapFixedSize!4176) Bool)

(assert (=> start!75824 (= res!604374 (valid!1617 thiss!1181))))

(assert (=> start!75824 e!497893))

(assert (=> start!75824 e!497898))

(assert (=> start!75824 true))

(declare-fun mapIsEmpty!28739 () Bool)

(assert (=> mapIsEmpty!28739 mapRes!28739))

(declare-fun b!892059 () Bool)

(declare-fun e!497890 () Bool)

(assert (=> b!892059 (= e!497890 e!497892)))

(declare-fun res!604375 () Bool)

(assert (=> b!892059 (=> res!604375 e!497892)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892059 (= res!604375 (not (validMask!0 (mask!25790 thiss!1181))))))

(assert (=> b!892059 (contains!4356 lt!402999 (select (arr!25119 (_keys!9968 thiss!1181)) (index!37728 lt!402998)))))

(declare-fun getCurrentListMap!2636 (array!52226 array!52228 (_ BitVec 32) (_ BitVec 32) V!29129 V!29129 (_ BitVec 32) Int) ListLongMap!10677)

(assert (=> b!892059 (= lt!402999 (getCurrentListMap!2636 (_keys!9968 thiss!1181) (_values!5270 thiss!1181) (mask!25790 thiss!1181) (extraKeys!4979 thiss!1181) (zeroValue!5083 thiss!1181) (minValue!5083 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5285 thiss!1181)))))

(declare-datatypes ((Unit!30374 0))(
  ( (Unit!30375) )
))
(declare-fun lt!402996 () Unit!30374)

(declare-fun lemmaValidKeyInArrayIsInListMap!225 (array!52226 array!52228 (_ BitVec 32) (_ BitVec 32) V!29129 V!29129 (_ BitVec 32) Int) Unit!30374)

(assert (=> b!892059 (= lt!402996 (lemmaValidKeyInArrayIsInListMap!225 (_keys!9968 thiss!1181) (_values!5270 thiss!1181) (mask!25790 thiss!1181) (extraKeys!4979 thiss!1181) (zeroValue!5083 thiss!1181) (minValue!5083 thiss!1181) (index!37728 lt!402998) (defaultEntry!5285 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52226 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892059 (arrayContainsKey!0 (_keys!9968 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402997 () Unit!30374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52226 (_ BitVec 64) (_ BitVec 32)) Unit!30374)

(assert (=> b!892059 (= lt!402997 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9968 thiss!1181) key!785 (index!37728 lt!402998)))))

(declare-fun b!892060 () Bool)

(assert (=> b!892060 (= e!497893 (not e!497890))))

(declare-fun res!604376 () Bool)

(assert (=> b!892060 (=> res!604376 e!497890)))

(get-info :version)

(assert (=> b!892060 (= res!604376 (not ((_ is Found!8839) lt!402998)))))

(assert (=> b!892060 e!497894))

(declare-fun res!604372 () Bool)

(assert (=> b!892060 (=> res!604372 e!497894)))

(assert (=> b!892060 (= res!604372 (not ((_ is Found!8839) lt!402998)))))

(declare-fun lt!403000 () Unit!30374)

(declare-fun lemmaSeekEntryGivesInRangeIndex!40 (array!52226 array!52228 (_ BitVec 32) (_ BitVec 32) V!29129 V!29129 (_ BitVec 64)) Unit!30374)

(assert (=> b!892060 (= lt!403000 (lemmaSeekEntryGivesInRangeIndex!40 (_keys!9968 thiss!1181) (_values!5270 thiss!1181) (mask!25790 thiss!1181) (extraKeys!4979 thiss!1181) (zeroValue!5083 thiss!1181) (minValue!5083 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52226 (_ BitVec 32)) SeekEntryResult!8839)

(assert (=> b!892060 (= lt!402998 (seekEntry!0 key!785 (_keys!9968 thiss!1181) (mask!25790 thiss!1181)))))

(declare-fun b!892061 () Bool)

(declare-fun res!604373 () Bool)

(assert (=> b!892061 (=> res!604373 e!497892)))

(declare-datatypes ((List!17771 0))(
  ( (Nil!17768) (Cons!17767 (h!18898 (_ BitVec 64)) (t!25070 List!17771)) )
))
(declare-fun arrayNoDuplicates!0 (array!52226 (_ BitVec 32) List!17771) Bool)

(assert (=> b!892061 (= res!604373 (not (arrayNoDuplicates!0 (_keys!9968 thiss!1181) #b00000000000000000000000000000000 Nil!17768)))))

(declare-fun b!892062 () Bool)

(assert (=> b!892062 (= e!497897 tp_is_empty!18123)))

(assert (= (and start!75824 res!604374) b!892055))

(assert (= (and b!892055 res!604378) b!892060))

(assert (= (and b!892060 (not res!604372)) b!892057))

(assert (= (and b!892060 (not res!604376)) b!892059))

(assert (= (and b!892059 (not res!604375)) b!892052))

(assert (= (and b!892052 (not res!604377)) b!892058))

(assert (= (and b!892058 (not res!604379)) b!892061))

(assert (= (and b!892061 (not res!604373)) b!892051))

(assert (= (and b!892054 condMapEmpty!28739) mapIsEmpty!28739))

(assert (= (and b!892054 (not condMapEmpty!28739)) mapNonEmpty!28739))

(assert (= (and mapNonEmpty!28739 ((_ is ValueCellFull!8580) mapValue!28739)) b!892056))

(assert (= (and b!892054 ((_ is ValueCellFull!8580) mapDefault!28739)) b!892062))

(assert (= b!892053 b!892054))

(assert (= start!75824 b!892053))

(declare-fun m!830329 () Bool)

(assert (=> b!892058 m!830329))

(declare-fun m!830331 () Bool)

(assert (=> b!892051 m!830331))

(declare-fun m!830333 () Bool)

(assert (=> b!892057 m!830333))

(declare-fun m!830335 () Bool)

(assert (=> b!892053 m!830335))

(declare-fun m!830337 () Bool)

(assert (=> b!892053 m!830337))

(declare-fun m!830339 () Bool)

(assert (=> b!892059 m!830339))

(declare-fun m!830341 () Bool)

(assert (=> b!892059 m!830341))

(declare-fun m!830343 () Bool)

(assert (=> b!892059 m!830343))

(assert (=> b!892059 m!830341))

(declare-fun m!830345 () Bool)

(assert (=> b!892059 m!830345))

(declare-fun m!830347 () Bool)

(assert (=> b!892059 m!830347))

(declare-fun m!830349 () Bool)

(assert (=> b!892059 m!830349))

(declare-fun m!830351 () Bool)

(assert (=> b!892059 m!830351))

(declare-fun m!830353 () Bool)

(assert (=> start!75824 m!830353))

(declare-fun m!830355 () Bool)

(assert (=> mapNonEmpty!28739 m!830355))

(declare-fun m!830357 () Bool)

(assert (=> b!892061 m!830357))

(declare-fun m!830359 () Bool)

(assert (=> b!892060 m!830359))

(declare-fun m!830361 () Bool)

(assert (=> b!892060 m!830361))

(check-sat (not b!892061) tp_is_empty!18123 b_and!26035 (not b!892059) (not b_next!15795) (not mapNonEmpty!28739) (not b!892053) (not start!75824) (not b!892051) (not b!892057) (not b!892060) (not b!892058))
(check-sat b_and!26035 (not b_next!15795))
