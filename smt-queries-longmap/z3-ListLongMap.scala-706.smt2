; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16744 () Bool)

(assert start!16744)

(declare-fun b!168044 () Bool)

(declare-fun b_free!4045 () Bool)

(declare-fun b_next!4045 () Bool)

(assert (=> b!168044 (= b_free!4045 (not b_next!4045))))

(declare-fun tp!14735 () Bool)

(declare-fun b_and!10433 () Bool)

(assert (=> b!168044 (= tp!14735 b_and!10433)))

(declare-fun b!168042 () Bool)

(declare-fun e!110445 () Bool)

(assert (=> b!168042 (= e!110445 true)))

(declare-fun lt!83910 () Bool)

(declare-datatypes ((V!4777 0))(
  ( (V!4778 (val!1968 Int)) )
))
(declare-datatypes ((ValueCell!1580 0))(
  ( (ValueCellFull!1580 (v!3827 V!4777)) (EmptyCell!1580) )
))
(declare-datatypes ((array!6771 0))(
  ( (array!6772 (arr!3220 (Array (_ BitVec 32) (_ BitVec 64))) (size!3509 (_ BitVec 32))) )
))
(declare-datatypes ((array!6773 0))(
  ( (array!6774 (arr!3221 (Array (_ BitVec 32) ValueCell!1580)) (size!3510 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2068 0))(
  ( (LongMapFixedSize!2069 (defaultEntry!3476 Int) (mask!8236 (_ BitVec 32)) (extraKeys!3217 (_ BitVec 32)) (zeroValue!3319 V!4777) (minValue!3319 V!4777) (_size!1083 (_ BitVec 32)) (_keys!5300 array!6771) (_values!3459 array!6773) (_vacant!1083 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2068)

(declare-datatypes ((List!2161 0))(
  ( (Nil!2158) (Cons!2157 (h!2774 (_ BitVec 64)) (t!6954 List!2161)) )
))
(declare-fun arrayNoDuplicates!0 (array!6771 (_ BitVec 32) List!2161) Bool)

(assert (=> b!168042 (= lt!83910 (arrayNoDuplicates!0 (_keys!5300 thiss!1248) #b00000000000000000000000000000000 Nil!2158))))

(declare-fun mapNonEmpty!6489 () Bool)

(declare-fun mapRes!6489 () Bool)

(declare-fun tp!14736 () Bool)

(declare-fun e!110441 () Bool)

(assert (=> mapNonEmpty!6489 (= mapRes!6489 (and tp!14736 e!110441))))

(declare-fun mapRest!6489 () (Array (_ BitVec 32) ValueCell!1580))

(declare-fun mapKey!6489 () (_ BitVec 32))

(declare-fun mapValue!6489 () ValueCell!1580)

(assert (=> mapNonEmpty!6489 (= (arr!3221 (_values!3459 thiss!1248)) (store mapRest!6489 mapKey!6489 mapValue!6489))))

(declare-fun b!168043 () Bool)

(declare-fun e!110443 () Bool)

(assert (=> b!168043 (= e!110443 (not e!110445))))

(declare-fun res!79949 () Bool)

(assert (=> b!168043 (=> res!79949 e!110445)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!168043 (= res!79949 (not (validMask!0 (mask!8236 thiss!1248))))))

(declare-datatypes ((tuple2!3158 0))(
  ( (tuple2!3159 (_1!1590 (_ BitVec 64)) (_2!1590 V!4777)) )
))
(declare-datatypes ((List!2162 0))(
  ( (Nil!2159) (Cons!2158 (h!2775 tuple2!3158) (t!6955 List!2162)) )
))
(declare-datatypes ((ListLongMap!2101 0))(
  ( (ListLongMap!2102 (toList!1066 List!2162)) )
))
(declare-fun lt!83913 () ListLongMap!2101)

(declare-fun v!309 () V!4777)

(declare-datatypes ((SeekEntryResult!506 0))(
  ( (MissingZero!506 (index!4192 (_ BitVec 32))) (Found!506 (index!4193 (_ BitVec 32))) (Intermediate!506 (undefined!1318 Bool) (index!4194 (_ BitVec 32)) (x!18605 (_ BitVec 32))) (Undefined!506) (MissingVacant!506 (index!4195 (_ BitVec 32))) )
))
(declare-fun lt!83914 () SeekEntryResult!506)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun +!217 (ListLongMap!2101 tuple2!3158) ListLongMap!2101)

(declare-fun getCurrentListMap!708 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 32) Int) ListLongMap!2101)

(assert (=> b!168043 (= (+!217 lt!83913 (tuple2!3159 key!828 v!309)) (getCurrentListMap!708 (_keys!5300 thiss!1248) (array!6774 (store (arr!3221 (_values!3459 thiss!1248)) (index!4193 lt!83914) (ValueCellFull!1580 v!309)) (size!3510 (_values!3459 thiss!1248))) (mask!8236 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3476 thiss!1248)))))

(declare-datatypes ((Unit!5146 0))(
  ( (Unit!5147) )
))
(declare-fun lt!83916 () Unit!5146)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!89 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 32) (_ BitVec 64) V!4777 Int) Unit!5146)

(assert (=> b!168043 (= lt!83916 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!89 (_keys!5300 thiss!1248) (_values!3459 thiss!1248) (mask!8236 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) (index!4193 lt!83914) key!828 v!309 (defaultEntry!3476 thiss!1248)))))

(declare-fun lt!83912 () Unit!5146)

(declare-fun e!110440 () Unit!5146)

(assert (=> b!168043 (= lt!83912 e!110440)))

(declare-fun c!30323 () Bool)

(declare-fun contains!1111 (ListLongMap!2101 (_ BitVec 64)) Bool)

(assert (=> b!168043 (= c!30323 (contains!1111 lt!83913 key!828))))

(assert (=> b!168043 (= lt!83913 (getCurrentListMap!708 (_keys!5300 thiss!1248) (_values!3459 thiss!1248) (mask!8236 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3476 thiss!1248)))))

(declare-fun mapIsEmpty!6489 () Bool)

(assert (=> mapIsEmpty!6489 mapRes!6489))

(declare-fun e!110444 () Bool)

(declare-fun tp_is_empty!3847 () Bool)

(declare-fun e!110447 () Bool)

(declare-fun array_inv!2075 (array!6771) Bool)

(declare-fun array_inv!2076 (array!6773) Bool)

(assert (=> b!168044 (= e!110444 (and tp!14735 tp_is_empty!3847 (array_inv!2075 (_keys!5300 thiss!1248)) (array_inv!2076 (_values!3459 thiss!1248)) e!110447))))

(declare-fun b!168045 () Bool)

(declare-fun e!110439 () Bool)

(assert (=> b!168045 (= e!110439 tp_is_empty!3847)))

(declare-fun b!168046 () Bool)

(declare-fun res!79951 () Bool)

(assert (=> b!168046 (=> res!79951 e!110445)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6771 (_ BitVec 32)) Bool)

(assert (=> b!168046 (= res!79951 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5300 thiss!1248) (mask!8236 thiss!1248))))))

(declare-fun b!168047 () Bool)

(assert (=> b!168047 (= e!110441 tp_is_empty!3847)))

(declare-fun b!168048 () Bool)

(declare-fun e!110442 () Bool)

(assert (=> b!168048 (= e!110442 e!110443)))

(declare-fun res!79950 () Bool)

(assert (=> b!168048 (=> (not res!79950) (not e!110443))))

(get-info :version)

(assert (=> b!168048 (= res!79950 (and (not ((_ is Undefined!506) lt!83914)) (not ((_ is MissingVacant!506) lt!83914)) (not ((_ is MissingZero!506) lt!83914)) ((_ is Found!506) lt!83914)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6771 (_ BitVec 32)) SeekEntryResult!506)

(assert (=> b!168048 (= lt!83914 (seekEntryOrOpen!0 key!828 (_keys!5300 thiss!1248) (mask!8236 thiss!1248)))))

(declare-fun b!168049 () Bool)

(declare-fun Unit!5148 () Unit!5146)

(assert (=> b!168049 (= e!110440 Unit!5148)))

(declare-fun lt!83911 () Unit!5146)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!116 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 64) Int) Unit!5146)

(assert (=> b!168049 (= lt!83911 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!116 (_keys!5300 thiss!1248) (_values!3459 thiss!1248) (mask!8236 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) key!828 (defaultEntry!3476 thiss!1248)))))

(assert (=> b!168049 false))

(declare-fun b!168050 () Bool)

(declare-fun res!79953 () Bool)

(assert (=> b!168050 (=> res!79953 e!110445)))

(assert (=> b!168050 (= res!79953 (or (not (= (size!3510 (_values!3459 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8236 thiss!1248)))) (not (= (size!3509 (_keys!5300 thiss!1248)) (size!3510 (_values!3459 thiss!1248)))) (bvslt (mask!8236 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3217 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3217 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun res!79954 () Bool)

(assert (=> start!16744 (=> (not res!79954) (not e!110442))))

(declare-fun valid!910 (LongMapFixedSize!2068) Bool)

(assert (=> start!16744 (= res!79954 (valid!910 thiss!1248))))

(assert (=> start!16744 e!110442))

(assert (=> start!16744 e!110444))

(assert (=> start!16744 true))

(assert (=> start!16744 tp_is_empty!3847))

(declare-fun b!168051 () Bool)

(declare-fun lt!83915 () Unit!5146)

(assert (=> b!168051 (= e!110440 lt!83915)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!117 (array!6771 array!6773 (_ BitVec 32) (_ BitVec 32) V!4777 V!4777 (_ BitVec 64) Int) Unit!5146)

(assert (=> b!168051 (= lt!83915 (lemmaInListMapThenSeekEntryOrOpenFindsIt!117 (_keys!5300 thiss!1248) (_values!3459 thiss!1248) (mask!8236 thiss!1248) (extraKeys!3217 thiss!1248) (zeroValue!3319 thiss!1248) (minValue!3319 thiss!1248) key!828 (defaultEntry!3476 thiss!1248)))))

(declare-fun res!79952 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!168051 (= res!79952 (inRange!0 (index!4193 lt!83914) (mask!8236 thiss!1248)))))

(declare-fun e!110448 () Bool)

(assert (=> b!168051 (=> (not res!79952) (not e!110448))))

(assert (=> b!168051 e!110448))

(declare-fun b!168052 () Bool)

(assert (=> b!168052 (= e!110448 (= (select (arr!3220 (_keys!5300 thiss!1248)) (index!4193 lt!83914)) key!828))))

(declare-fun b!168053 () Bool)

(declare-fun res!79948 () Bool)

(assert (=> b!168053 (=> (not res!79948) (not e!110442))))

(assert (=> b!168053 (= res!79948 (not (= key!828 (bvneg key!828))))))

(declare-fun b!168054 () Bool)

(assert (=> b!168054 (= e!110447 (and e!110439 mapRes!6489))))

(declare-fun condMapEmpty!6489 () Bool)

(declare-fun mapDefault!6489 () ValueCell!1580)

(assert (=> b!168054 (= condMapEmpty!6489 (= (arr!3221 (_values!3459 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1580)) mapDefault!6489)))))

(assert (= (and start!16744 res!79954) b!168053))

(assert (= (and b!168053 res!79948) b!168048))

(assert (= (and b!168048 res!79950) b!168043))

(assert (= (and b!168043 c!30323) b!168051))

(assert (= (and b!168043 (not c!30323)) b!168049))

(assert (= (and b!168051 res!79952) b!168052))

(assert (= (and b!168043 (not res!79949)) b!168050))

(assert (= (and b!168050 (not res!79953)) b!168046))

(assert (= (and b!168046 (not res!79951)) b!168042))

(assert (= (and b!168054 condMapEmpty!6489) mapIsEmpty!6489))

(assert (= (and b!168054 (not condMapEmpty!6489)) mapNonEmpty!6489))

(assert (= (and mapNonEmpty!6489 ((_ is ValueCellFull!1580) mapValue!6489)) b!168047))

(assert (= (and b!168054 ((_ is ValueCellFull!1580) mapDefault!6489)) b!168045))

(assert (= b!168044 b!168054))

(assert (= start!16744 b!168044))

(declare-fun m!196663 () Bool)

(assert (=> b!168052 m!196663))

(declare-fun m!196665 () Bool)

(assert (=> mapNonEmpty!6489 m!196665))

(declare-fun m!196667 () Bool)

(assert (=> b!168043 m!196667))

(declare-fun m!196669 () Bool)

(assert (=> b!168043 m!196669))

(declare-fun m!196671 () Bool)

(assert (=> b!168043 m!196671))

(declare-fun m!196673 () Bool)

(assert (=> b!168043 m!196673))

(declare-fun m!196675 () Bool)

(assert (=> b!168043 m!196675))

(declare-fun m!196677 () Bool)

(assert (=> b!168043 m!196677))

(declare-fun m!196679 () Bool)

(assert (=> b!168043 m!196679))

(declare-fun m!196681 () Bool)

(assert (=> b!168049 m!196681))

(declare-fun m!196683 () Bool)

(assert (=> b!168048 m!196683))

(declare-fun m!196685 () Bool)

(assert (=> b!168042 m!196685))

(declare-fun m!196687 () Bool)

(assert (=> b!168046 m!196687))

(declare-fun m!196689 () Bool)

(assert (=> b!168051 m!196689))

(declare-fun m!196691 () Bool)

(assert (=> b!168051 m!196691))

(declare-fun m!196693 () Bool)

(assert (=> b!168044 m!196693))

(declare-fun m!196695 () Bool)

(assert (=> b!168044 m!196695))

(declare-fun m!196697 () Bool)

(assert (=> start!16744 m!196697))

(check-sat tp_is_empty!3847 (not b!168043) (not b!168048) b_and!10433 (not b!168049) (not b!168044) (not b!168046) (not b_next!4045) (not start!16744) (not mapNonEmpty!6489) (not b!168042) (not b!168051))
(check-sat b_and!10433 (not b_next!4045))
