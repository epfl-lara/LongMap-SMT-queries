; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16756 () Bool)

(assert start!16756)

(declare-fun b!168280 () Bool)

(declare-fun b_free!4057 () Bool)

(declare-fun b_next!4057 () Bool)

(assert (=> b!168280 (= b_free!4057 (not b_next!4057))))

(declare-fun tp!14771 () Bool)

(declare-fun b_and!10445 () Bool)

(assert (=> b!168280 (= tp!14771 b_and!10445)))

(declare-fun b!168276 () Bool)

(declare-fun e!110627 () Bool)

(declare-fun e!110625 () Bool)

(declare-fun mapRes!6507 () Bool)

(assert (=> b!168276 (= e!110627 (and e!110625 mapRes!6507))))

(declare-fun condMapEmpty!6507 () Bool)

(declare-datatypes ((V!4793 0))(
  ( (V!4794 (val!1974 Int)) )
))
(declare-datatypes ((ValueCell!1586 0))(
  ( (ValueCellFull!1586 (v!3833 V!4793)) (EmptyCell!1586) )
))
(declare-datatypes ((array!6795 0))(
  ( (array!6796 (arr!3232 (Array (_ BitVec 32) (_ BitVec 64))) (size!3521 (_ BitVec 32))) )
))
(declare-datatypes ((array!6797 0))(
  ( (array!6798 (arr!3233 (Array (_ BitVec 32) ValueCell!1586)) (size!3522 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2080 0))(
  ( (LongMapFixedSize!2081 (defaultEntry!3482 Int) (mask!8246 (_ BitVec 32)) (extraKeys!3223 (_ BitVec 32)) (zeroValue!3325 V!4793) (minValue!3325 V!4793) (_size!1089 (_ BitVec 32)) (_keys!5306 array!6795) (_values!3465 array!6797) (_vacant!1089 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2080)

(declare-fun mapDefault!6507 () ValueCell!1586)

(assert (=> b!168276 (= condMapEmpty!6507 (= (arr!3233 (_values!3465 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1586)) mapDefault!6507)))))

(declare-fun b!168277 () Bool)

(declare-fun e!110621 () Bool)

(declare-fun e!110619 () Bool)

(assert (=> b!168277 (= e!110621 e!110619)))

(declare-fun res!80079 () Bool)

(assert (=> b!168277 (=> (not res!80079) (not e!110619))))

(declare-datatypes ((SeekEntryResult!512 0))(
  ( (MissingZero!512 (index!4216 (_ BitVec 32))) (Found!512 (index!4217 (_ BitVec 32))) (Intermediate!512 (undefined!1324 Bool) (index!4218 (_ BitVec 32)) (x!18627 (_ BitVec 32))) (Undefined!512) (MissingVacant!512 (index!4219 (_ BitVec 32))) )
))
(declare-fun lt!84038 () SeekEntryResult!512)

(get-info :version)

(assert (=> b!168277 (= res!80079 (and (not ((_ is Undefined!512) lt!84038)) (not ((_ is MissingVacant!512) lt!84038)) (not ((_ is MissingZero!512) lt!84038)) ((_ is Found!512) lt!84038)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6795 (_ BitVec 32)) SeekEntryResult!512)

(assert (=> b!168277 (= lt!84038 (seekEntryOrOpen!0 key!828 (_keys!5306 thiss!1248) (mask!8246 thiss!1248)))))

(declare-fun res!80080 () Bool)

(assert (=> start!16756 (=> (not res!80080) (not e!110621))))

(declare-fun valid!915 (LongMapFixedSize!2080) Bool)

(assert (=> start!16756 (= res!80080 (valid!915 thiss!1248))))

(assert (=> start!16756 e!110621))

(declare-fun e!110622 () Bool)

(assert (=> start!16756 e!110622))

(assert (=> start!16756 true))

(declare-fun tp_is_empty!3859 () Bool)

(assert (=> start!16756 tp_is_empty!3859))

(declare-fun b!168278 () Bool)

(declare-fun e!110624 () Bool)

(assert (=> b!168278 (= e!110624 true)))

(declare-fun lt!84036 () Bool)

(declare-datatypes ((List!2170 0))(
  ( (Nil!2167) (Cons!2166 (h!2783 (_ BitVec 64)) (t!6963 List!2170)) )
))
(declare-fun arrayNoDuplicates!0 (array!6795 (_ BitVec 32) List!2170) Bool)

(assert (=> b!168278 (= lt!84036 (arrayNoDuplicates!0 (_keys!5306 thiss!1248) #b00000000000000000000000000000000 Nil!2167))))

(declare-fun mapIsEmpty!6507 () Bool)

(assert (=> mapIsEmpty!6507 mapRes!6507))

(declare-fun b!168279 () Bool)

(assert (=> b!168279 (= e!110619 (not e!110624))))

(declare-fun res!80078 () Bool)

(assert (=> b!168279 (=> res!80078 e!110624)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168279 (= res!80078 (not (validMask!0 (mask!8246 thiss!1248))))))

(declare-datatypes ((tuple2!3168 0))(
  ( (tuple2!3169 (_1!1595 (_ BitVec 64)) (_2!1595 V!4793)) )
))
(declare-datatypes ((List!2171 0))(
  ( (Nil!2168) (Cons!2167 (h!2784 tuple2!3168) (t!6964 List!2171)) )
))
(declare-datatypes ((ListLongMap!2111 0))(
  ( (ListLongMap!2112 (toList!1071 List!2171)) )
))
(declare-fun lt!84042 () ListLongMap!2111)

(declare-fun v!309 () V!4793)

(declare-fun +!222 (ListLongMap!2111 tuple2!3168) ListLongMap!2111)

(declare-fun getCurrentListMap!713 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 32) Int) ListLongMap!2111)

(assert (=> b!168279 (= (+!222 lt!84042 (tuple2!3169 key!828 v!309)) (getCurrentListMap!713 (_keys!5306 thiss!1248) (array!6798 (store (arr!3233 (_values!3465 thiss!1248)) (index!4217 lt!84038) (ValueCellFull!1586 v!309)) (size!3522 (_values!3465 thiss!1248))) (mask!8246 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3482 thiss!1248)))))

(declare-datatypes ((Unit!5159 0))(
  ( (Unit!5160) )
))
(declare-fun lt!84039 () Unit!5159)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!94 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 32) (_ BitVec 64) V!4793 Int) Unit!5159)

(assert (=> b!168279 (= lt!84039 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!94 (_keys!5306 thiss!1248) (_values!3465 thiss!1248) (mask!8246 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) (index!4217 lt!84038) key!828 v!309 (defaultEntry!3482 thiss!1248)))))

(declare-fun lt!84037 () Unit!5159)

(declare-fun e!110623 () Unit!5159)

(assert (=> b!168279 (= lt!84037 e!110623)))

(declare-fun c!30341 () Bool)

(declare-fun contains!1116 (ListLongMap!2111 (_ BitVec 64)) Bool)

(assert (=> b!168279 (= c!30341 (contains!1116 lt!84042 key!828))))

(assert (=> b!168279 (= lt!84042 (getCurrentListMap!713 (_keys!5306 thiss!1248) (_values!3465 thiss!1248) (mask!8246 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3482 thiss!1248)))))

(declare-fun array_inv!2079 (array!6795) Bool)

(declare-fun array_inv!2080 (array!6797) Bool)

(assert (=> b!168280 (= e!110622 (and tp!14771 tp_is_empty!3859 (array_inv!2079 (_keys!5306 thiss!1248)) (array_inv!2080 (_values!3465 thiss!1248)) e!110627))))

(declare-fun b!168281 () Bool)

(declare-fun lt!84040 () Unit!5159)

(assert (=> b!168281 (= e!110623 lt!84040)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!122 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 64) Int) Unit!5159)

(assert (=> b!168281 (= lt!84040 (lemmaInListMapThenSeekEntryOrOpenFindsIt!122 (_keys!5306 thiss!1248) (_values!3465 thiss!1248) (mask!8246 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) key!828 (defaultEntry!3482 thiss!1248)))))

(declare-fun res!80077 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168281 (= res!80077 (inRange!0 (index!4217 lt!84038) (mask!8246 thiss!1248)))))

(declare-fun e!110620 () Bool)

(assert (=> b!168281 (=> (not res!80077) (not e!110620))))

(assert (=> b!168281 e!110620))

(declare-fun b!168282 () Bool)

(declare-fun res!80076 () Bool)

(assert (=> b!168282 (=> res!80076 e!110624)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6795 (_ BitVec 32)) Bool)

(assert (=> b!168282 (= res!80076 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5306 thiss!1248) (mask!8246 thiss!1248))))))

(declare-fun b!168283 () Bool)

(declare-fun res!80075 () Bool)

(assert (=> b!168283 (=> res!80075 e!110624)))

(assert (=> b!168283 (= res!80075 (or (not (= (size!3522 (_values!3465 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8246 thiss!1248)))) (not (= (size!3521 (_keys!5306 thiss!1248)) (size!3522 (_values!3465 thiss!1248)))) (bvslt (mask!8246 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3223 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3223 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6507 () Bool)

(declare-fun tp!14772 () Bool)

(declare-fun e!110628 () Bool)

(assert (=> mapNonEmpty!6507 (= mapRes!6507 (and tp!14772 e!110628))))

(declare-fun mapRest!6507 () (Array (_ BitVec 32) ValueCell!1586))

(declare-fun mapValue!6507 () ValueCell!1586)

(declare-fun mapKey!6507 () (_ BitVec 32))

(assert (=> mapNonEmpty!6507 (= (arr!3233 (_values!3465 thiss!1248)) (store mapRest!6507 mapKey!6507 mapValue!6507))))

(declare-fun b!168284 () Bool)

(assert (=> b!168284 (= e!110625 tp_is_empty!3859)))

(declare-fun b!168285 () Bool)

(declare-fun Unit!5161 () Unit!5159)

(assert (=> b!168285 (= e!110623 Unit!5161)))

(declare-fun lt!84041 () Unit!5159)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!119 (array!6795 array!6797 (_ BitVec 32) (_ BitVec 32) V!4793 V!4793 (_ BitVec 64) Int) Unit!5159)

(assert (=> b!168285 (= lt!84041 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!119 (_keys!5306 thiss!1248) (_values!3465 thiss!1248) (mask!8246 thiss!1248) (extraKeys!3223 thiss!1248) (zeroValue!3325 thiss!1248) (minValue!3325 thiss!1248) key!828 (defaultEntry!3482 thiss!1248)))))

(assert (=> b!168285 false))

(declare-fun b!168286 () Bool)

(assert (=> b!168286 (= e!110620 (= (select (arr!3232 (_keys!5306 thiss!1248)) (index!4217 lt!84038)) key!828))))

(declare-fun b!168287 () Bool)

(assert (=> b!168287 (= e!110628 tp_is_empty!3859)))

(declare-fun b!168288 () Bool)

(declare-fun res!80074 () Bool)

(assert (=> b!168288 (=> (not res!80074) (not e!110621))))

(assert (=> b!168288 (= res!80074 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16756 res!80080) b!168288))

(assert (= (and b!168288 res!80074) b!168277))

(assert (= (and b!168277 res!80079) b!168279))

(assert (= (and b!168279 c!30341) b!168281))

(assert (= (and b!168279 (not c!30341)) b!168285))

(assert (= (and b!168281 res!80077) b!168286))

(assert (= (and b!168279 (not res!80078)) b!168283))

(assert (= (and b!168283 (not res!80075)) b!168282))

(assert (= (and b!168282 (not res!80076)) b!168278))

(assert (= (and b!168276 condMapEmpty!6507) mapIsEmpty!6507))

(assert (= (and b!168276 (not condMapEmpty!6507)) mapNonEmpty!6507))

(assert (= (and mapNonEmpty!6507 ((_ is ValueCellFull!1586) mapValue!6507)) b!168287))

(assert (= (and b!168276 ((_ is ValueCellFull!1586) mapDefault!6507)) b!168284))

(assert (= b!168280 b!168276))

(assert (= start!16756 b!168280))

(declare-fun m!196879 () Bool)

(assert (=> b!168277 m!196879))

(declare-fun m!196881 () Bool)

(assert (=> b!168279 m!196881))

(declare-fun m!196883 () Bool)

(assert (=> b!168279 m!196883))

(declare-fun m!196885 () Bool)

(assert (=> b!168279 m!196885))

(declare-fun m!196887 () Bool)

(assert (=> b!168279 m!196887))

(declare-fun m!196889 () Bool)

(assert (=> b!168279 m!196889))

(declare-fun m!196891 () Bool)

(assert (=> b!168279 m!196891))

(declare-fun m!196893 () Bool)

(assert (=> b!168279 m!196893))

(declare-fun m!196895 () Bool)

(assert (=> b!168285 m!196895))

(declare-fun m!196897 () Bool)

(assert (=> b!168280 m!196897))

(declare-fun m!196899 () Bool)

(assert (=> b!168280 m!196899))

(declare-fun m!196901 () Bool)

(assert (=> mapNonEmpty!6507 m!196901))

(declare-fun m!196903 () Bool)

(assert (=> b!168278 m!196903))

(declare-fun m!196905 () Bool)

(assert (=> b!168281 m!196905))

(declare-fun m!196907 () Bool)

(assert (=> b!168281 m!196907))

(declare-fun m!196909 () Bool)

(assert (=> start!16756 m!196909))

(declare-fun m!196911 () Bool)

(assert (=> b!168286 m!196911))

(declare-fun m!196913 () Bool)

(assert (=> b!168282 m!196913))

(check-sat b_and!10445 (not b_next!4057) (not b!168278) tp_is_empty!3859 (not start!16756) (not b!168285) (not b!168277) (not b!168280) (not b!168281) (not mapNonEmpty!6507) (not b!168279) (not b!168282))
(check-sat b_and!10445 (not b_next!4057))
