; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16642 () Bool)

(assert start!16642)

(declare-fun b!166256 () Bool)

(declare-fun b_free!3943 () Bool)

(declare-fun b_next!3943 () Bool)

(assert (=> b!166256 (= b_free!3943 (not b_next!3943))))

(declare-fun tp!14430 () Bool)

(declare-fun b_and!10371 () Bool)

(assert (=> b!166256 (= tp!14430 b_and!10371)))

(declare-fun res!78993 () Bool)

(declare-fun e!109043 () Bool)

(assert (=> start!16642 (=> (not res!78993) (not e!109043))))

(declare-datatypes ((V!4641 0))(
  ( (V!4642 (val!1917 Int)) )
))
(declare-datatypes ((ValueCell!1529 0))(
  ( (ValueCellFull!1529 (v!3783 V!4641)) (EmptyCell!1529) )
))
(declare-datatypes ((array!6573 0))(
  ( (array!6574 (arr!3122 (Array (_ BitVec 32) (_ BitVec 64))) (size!3410 (_ BitVec 32))) )
))
(declare-datatypes ((array!6575 0))(
  ( (array!6576 (arr!3123 (Array (_ BitVec 32) ValueCell!1529)) (size!3411 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1966 0))(
  ( (LongMapFixedSize!1967 (defaultEntry!3425 Int) (mask!8152 (_ BitVec 32)) (extraKeys!3166 (_ BitVec 32)) (zeroValue!3268 V!4641) (minValue!3268 V!4641) (_size!1032 (_ BitVec 32)) (_keys!5250 array!6573) (_values!3408 array!6575) (_vacant!1032 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1966)

(declare-fun valid!878 (LongMapFixedSize!1966) Bool)

(assert (=> start!16642 (= res!78993 (valid!878 thiss!1248))))

(assert (=> start!16642 e!109043))

(declare-fun e!109041 () Bool)

(assert (=> start!16642 e!109041))

(assert (=> start!16642 true))

(declare-fun b!166247 () Bool)

(declare-fun e!109034 () Bool)

(assert (=> b!166247 (= e!109034 false)))

(declare-fun lt!83276 () Bool)

(declare-datatypes ((List!2070 0))(
  ( (Nil!2067) (Cons!2066 (h!2683 (_ BitVec 64)) (t!6864 List!2070)) )
))
(declare-fun arrayNoDuplicates!0 (array!6573 (_ BitVec 32) List!2070) Bool)

(assert (=> b!166247 (= lt!83276 (arrayNoDuplicates!0 (_keys!5250 thiss!1248) #b00000000000000000000000000000000 Nil!2067))))

(declare-fun b!166248 () Bool)

(declare-datatypes ((Unit!5056 0))(
  ( (Unit!5057) )
))
(declare-fun e!109040 () Unit!5056)

(declare-fun Unit!5058 () Unit!5056)

(assert (=> b!166248 (= e!109040 Unit!5058)))

(declare-fun lt!83275 () Unit!5056)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!82 (array!6573 array!6575 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 64) Int) Unit!5056)

(assert (=> b!166248 (= lt!83275 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!82 (_keys!5250 thiss!1248) (_values!3408 thiss!1248) (mask!8152 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) key!828 (defaultEntry!3425 thiss!1248)))))

(assert (=> b!166248 false))

(declare-fun mapNonEmpty!6336 () Bool)

(declare-fun mapRes!6336 () Bool)

(declare-fun tp!14429 () Bool)

(declare-fun e!109037 () Bool)

(assert (=> mapNonEmpty!6336 (= mapRes!6336 (and tp!14429 e!109037))))

(declare-fun mapKey!6336 () (_ BitVec 32))

(declare-fun mapRest!6336 () (Array (_ BitVec 32) ValueCell!1529))

(declare-fun mapValue!6336 () ValueCell!1529)

(assert (=> mapNonEmpty!6336 (= (arr!3123 (_values!3408 thiss!1248)) (store mapRest!6336 mapKey!6336 mapValue!6336))))

(declare-fun b!166249 () Bool)

(declare-fun e!109035 () Bool)

(assert (=> b!166249 (= e!109043 e!109035)))

(declare-fun res!78997 () Bool)

(assert (=> b!166249 (=> (not res!78997) (not e!109035))))

(declare-datatypes ((SeekEntryResult!446 0))(
  ( (MissingZero!446 (index!3952 (_ BitVec 32))) (Found!446 (index!3953 (_ BitVec 32))) (Intermediate!446 (undefined!1258 Bool) (index!3954 (_ BitVec 32)) (x!18410 (_ BitVec 32))) (Undefined!446) (MissingVacant!446 (index!3955 (_ BitVec 32))) )
))
(declare-fun lt!83274 () SeekEntryResult!446)

(get-info :version)

(assert (=> b!166249 (= res!78997 (and (not ((_ is Undefined!446) lt!83274)) (not ((_ is MissingVacant!446) lt!83274)) (not ((_ is MissingZero!446) lt!83274)) ((_ is Found!446) lt!83274)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6573 (_ BitVec 32)) SeekEntryResult!446)

(assert (=> b!166249 (= lt!83274 (seekEntryOrOpen!0 key!828 (_keys!5250 thiss!1248) (mask!8152 thiss!1248)))))

(declare-fun e!109038 () Bool)

(declare-fun b!166250 () Bool)

(assert (=> b!166250 (= e!109038 (= (select (arr!3122 (_keys!5250 thiss!1248)) (index!3953 lt!83274)) key!828))))

(declare-fun b!166251 () Bool)

(declare-fun e!109036 () Bool)

(declare-fun e!109042 () Bool)

(assert (=> b!166251 (= e!109036 (and e!109042 mapRes!6336))))

(declare-fun condMapEmpty!6336 () Bool)

(declare-fun mapDefault!6336 () ValueCell!1529)

(assert (=> b!166251 (= condMapEmpty!6336 (= (arr!3123 (_values!3408 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1529)) mapDefault!6336)))))

(declare-fun b!166252 () Bool)

(declare-fun res!78998 () Bool)

(assert (=> b!166252 (=> (not res!78998) (not e!109043))))

(assert (=> b!166252 (= res!78998 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166253 () Bool)

(declare-fun res!78996 () Bool)

(assert (=> b!166253 (=> (not res!78996) (not e!109034))))

(assert (=> b!166253 (= res!78996 (and (= (size!3411 (_values!3408 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8152 thiss!1248))) (= (size!3410 (_keys!5250 thiss!1248)) (size!3411 (_values!3408 thiss!1248))) (bvsge (mask!8152 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3166 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3166 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166254 () Bool)

(declare-fun tp_is_empty!3745 () Bool)

(assert (=> b!166254 (= e!109037 tp_is_empty!3745)))

(declare-fun b!166255 () Bool)

(declare-fun res!78999 () Bool)

(assert (=> b!166255 (=> (not res!78999) (not e!109034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6573 (_ BitVec 32)) Bool)

(assert (=> b!166255 (= res!78999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5250 thiss!1248) (mask!8152 thiss!1248)))))

(declare-fun array_inv!1999 (array!6573) Bool)

(declare-fun array_inv!2000 (array!6575) Bool)

(assert (=> b!166256 (= e!109041 (and tp!14430 tp_is_empty!3745 (array_inv!1999 (_keys!5250 thiss!1248)) (array_inv!2000 (_values!3408 thiss!1248)) e!109036))))

(declare-fun b!166257 () Bool)

(assert (=> b!166257 (= e!109035 e!109034)))

(declare-fun res!78995 () Bool)

(assert (=> b!166257 (=> (not res!78995) (not e!109034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166257 (= res!78995 (validMask!0 (mask!8152 thiss!1248)))))

(declare-fun lt!83277 () Unit!5056)

(assert (=> b!166257 (= lt!83277 e!109040)))

(declare-fun c!30209 () Bool)

(declare-datatypes ((tuple2!3052 0))(
  ( (tuple2!3053 (_1!1537 (_ BitVec 64)) (_2!1537 V!4641)) )
))
(declare-datatypes ((List!2071 0))(
  ( (Nil!2068) (Cons!2067 (h!2684 tuple2!3052) (t!6865 List!2071)) )
))
(declare-datatypes ((ListLongMap!2013 0))(
  ( (ListLongMap!2014 (toList!1022 List!2071)) )
))
(declare-fun contains!1074 (ListLongMap!2013 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!684 (array!6573 array!6575 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 32) Int) ListLongMap!2013)

(assert (=> b!166257 (= c!30209 (contains!1074 (getCurrentListMap!684 (_keys!5250 thiss!1248) (_values!3408 thiss!1248) (mask!8152 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3425 thiss!1248)) key!828))))

(declare-fun b!166258 () Bool)

(declare-fun lt!83273 () Unit!5056)

(assert (=> b!166258 (= e!109040 lt!83273)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!85 (array!6573 array!6575 (_ BitVec 32) (_ BitVec 32) V!4641 V!4641 (_ BitVec 64) Int) Unit!5056)

(assert (=> b!166258 (= lt!83273 (lemmaInListMapThenSeekEntryOrOpenFindsIt!85 (_keys!5250 thiss!1248) (_values!3408 thiss!1248) (mask!8152 thiss!1248) (extraKeys!3166 thiss!1248) (zeroValue!3268 thiss!1248) (minValue!3268 thiss!1248) key!828 (defaultEntry!3425 thiss!1248)))))

(declare-fun res!78994 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166258 (= res!78994 (inRange!0 (index!3953 lt!83274) (mask!8152 thiss!1248)))))

(assert (=> b!166258 (=> (not res!78994) (not e!109038))))

(assert (=> b!166258 e!109038))

(declare-fun b!166259 () Bool)

(assert (=> b!166259 (= e!109042 tp_is_empty!3745)))

(declare-fun mapIsEmpty!6336 () Bool)

(assert (=> mapIsEmpty!6336 mapRes!6336))

(assert (= (and start!16642 res!78993) b!166252))

(assert (= (and b!166252 res!78998) b!166249))

(assert (= (and b!166249 res!78997) b!166257))

(assert (= (and b!166257 c!30209) b!166258))

(assert (= (and b!166257 (not c!30209)) b!166248))

(assert (= (and b!166258 res!78994) b!166250))

(assert (= (and b!166257 res!78995) b!166253))

(assert (= (and b!166253 res!78996) b!166255))

(assert (= (and b!166255 res!78999) b!166247))

(assert (= (and b!166251 condMapEmpty!6336) mapIsEmpty!6336))

(assert (= (and b!166251 (not condMapEmpty!6336)) mapNonEmpty!6336))

(assert (= (and mapNonEmpty!6336 ((_ is ValueCellFull!1529) mapValue!6336)) b!166254))

(assert (= (and b!166251 ((_ is ValueCellFull!1529) mapDefault!6336)) b!166259))

(assert (= b!166256 b!166251))

(assert (= start!16642 b!166256))

(declare-fun m!195893 () Bool)

(assert (=> start!16642 m!195893))

(declare-fun m!195895 () Bool)

(assert (=> b!166256 m!195895))

(declare-fun m!195897 () Bool)

(assert (=> b!166256 m!195897))

(declare-fun m!195899 () Bool)

(assert (=> b!166257 m!195899))

(declare-fun m!195901 () Bool)

(assert (=> b!166257 m!195901))

(assert (=> b!166257 m!195901))

(declare-fun m!195903 () Bool)

(assert (=> b!166257 m!195903))

(declare-fun m!195905 () Bool)

(assert (=> b!166249 m!195905))

(declare-fun m!195907 () Bool)

(assert (=> b!166258 m!195907))

(declare-fun m!195909 () Bool)

(assert (=> b!166258 m!195909))

(declare-fun m!195911 () Bool)

(assert (=> mapNonEmpty!6336 m!195911))

(declare-fun m!195913 () Bool)

(assert (=> b!166255 m!195913))

(declare-fun m!195915 () Bool)

(assert (=> b!166247 m!195915))

(declare-fun m!195917 () Bool)

(assert (=> b!166250 m!195917))

(declare-fun m!195919 () Bool)

(assert (=> b!166248 m!195919))

(check-sat (not b!166255) (not b!166256) (not b!166258) (not b!166249) (not b!166257) b_and!10371 (not b!166248) tp_is_empty!3745 (not start!16642) (not b!166247) (not mapNonEmpty!6336) (not b_next!3943))
(check-sat b_and!10371 (not b_next!3943))
