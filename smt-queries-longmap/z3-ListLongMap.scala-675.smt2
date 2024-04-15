; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16558 () Bool)

(assert start!16558)

(declare-fun b!164671 () Bool)

(declare-fun b_free!3859 () Bool)

(declare-fun b_next!3859 () Bool)

(assert (=> b!164671 (= b_free!3859 (not b_next!3859))))

(declare-fun tp!14177 () Bool)

(declare-fun b_and!10247 () Bool)

(assert (=> b!164671 (= tp!14177 b_and!10247)))

(declare-fun mapIsEmpty!6210 () Bool)

(declare-fun mapRes!6210 () Bool)

(assert (=> mapIsEmpty!6210 mapRes!6210))

(declare-fun b!164663 () Bool)

(declare-fun res!78001 () Bool)

(declare-fun e!108022 () Bool)

(assert (=> b!164663 (=> (not res!78001) (not e!108022))))

(declare-datatypes ((V!4529 0))(
  ( (V!4530 (val!1875 Int)) )
))
(declare-datatypes ((ValueCell!1487 0))(
  ( (ValueCellFull!1487 (v!3734 V!4529)) (EmptyCell!1487) )
))
(declare-datatypes ((array!6399 0))(
  ( (array!6400 (arr!3034 (Array (_ BitVec 32) (_ BitVec 64))) (size!3323 (_ BitVec 32))) )
))
(declare-datatypes ((array!6401 0))(
  ( (array!6402 (arr!3035 (Array (_ BitVec 32) ValueCell!1487)) (size!3324 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1882 0))(
  ( (LongMapFixedSize!1883 (defaultEntry!3383 Int) (mask!8081 (_ BitVec 32)) (extraKeys!3124 (_ BitVec 32)) (zeroValue!3226 V!4529) (minValue!3226 V!4529) (_size!990 (_ BitVec 32)) (_keys!5207 array!6399) (_values!3366 array!6401) (_vacant!990 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1882)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3034 0))(
  ( (tuple2!3035 (_1!1528 (_ BitVec 64)) (_2!1528 V!4529)) )
))
(declare-datatypes ((List!2033 0))(
  ( (Nil!2030) (Cons!2029 (h!2646 tuple2!3034) (t!6826 List!2033)) )
))
(declare-datatypes ((ListLongMap!1977 0))(
  ( (ListLongMap!1978 (toList!1004 List!2033)) )
))
(declare-fun contains!1049 (ListLongMap!1977 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!646 (array!6399 array!6401 (_ BitVec 32) (_ BitVec 32) V!4529 V!4529 (_ BitVec 32) Int) ListLongMap!1977)

(assert (=> b!164663 (= res!78001 (contains!1049 (getCurrentListMap!646 (_keys!5207 thiss!1248) (_values!3366 thiss!1248) (mask!8081 thiss!1248) (extraKeys!3124 thiss!1248) (zeroValue!3226 thiss!1248) (minValue!3226 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3383 thiss!1248)) key!828))))

(declare-fun b!164664 () Bool)

(declare-fun e!108021 () Bool)

(declare-fun e!108023 () Bool)

(assert (=> b!164664 (= e!108021 (and e!108023 mapRes!6210))))

(declare-fun condMapEmpty!6210 () Bool)

(declare-fun mapDefault!6210 () ValueCell!1487)

(assert (=> b!164664 (= condMapEmpty!6210 (= (arr!3035 (_values!3366 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1487)) mapDefault!6210)))))

(declare-fun b!164665 () Bool)

(declare-fun tp_is_empty!3661 () Bool)

(assert (=> b!164665 (= e!108023 tp_is_empty!3661)))

(declare-fun b!164666 () Bool)

(declare-fun res!77997 () Bool)

(declare-fun e!108027 () Bool)

(assert (=> b!164666 (=> (not res!77997) (not e!108027))))

(assert (=> b!164666 (= res!77997 (not (= key!828 (bvneg key!828))))))

(declare-fun mapNonEmpty!6210 () Bool)

(declare-fun tp!14178 () Bool)

(declare-fun e!108024 () Bool)

(assert (=> mapNonEmpty!6210 (= mapRes!6210 (and tp!14178 e!108024))))

(declare-fun mapValue!6210 () ValueCell!1487)

(declare-fun mapKey!6210 () (_ BitVec 32))

(declare-fun mapRest!6210 () (Array (_ BitVec 32) ValueCell!1487))

(assert (=> mapNonEmpty!6210 (= (arr!3035 (_values!3366 thiss!1248)) (store mapRest!6210 mapKey!6210 mapValue!6210))))

(declare-fun b!164667 () Bool)

(declare-fun res!77998 () Bool)

(assert (=> b!164667 (=> (not res!77998) (not e!108022))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6399 (_ BitVec 32)) Bool)

(assert (=> b!164667 (= res!77998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5207 thiss!1248) (mask!8081 thiss!1248)))))

(declare-fun res!77995 () Bool)

(assert (=> start!16558 (=> (not res!77995) (not e!108027))))

(declare-fun valid!842 (LongMapFixedSize!1882) Bool)

(assert (=> start!16558 (= res!77995 (valid!842 thiss!1248))))

(assert (=> start!16558 e!108027))

(declare-fun e!108026 () Bool)

(assert (=> start!16558 e!108026))

(assert (=> start!16558 true))

(declare-fun b!164668 () Bool)

(assert (=> b!164668 (= e!108022 false)))

(declare-fun lt!82776 () Bool)

(declare-datatypes ((List!2034 0))(
  ( (Nil!2031) (Cons!2030 (h!2647 (_ BitVec 64)) (t!6827 List!2034)) )
))
(declare-fun arrayNoDuplicates!0 (array!6399 (_ BitVec 32) List!2034) Bool)

(assert (=> b!164668 (= lt!82776 (arrayNoDuplicates!0 (_keys!5207 thiss!1248) #b00000000000000000000000000000000 Nil!2031))))

(declare-fun b!164669 () Bool)

(assert (=> b!164669 (= e!108024 tp_is_empty!3661)))

(declare-fun b!164670 () Bool)

(declare-fun res!78000 () Bool)

(assert (=> b!164670 (=> (not res!78000) (not e!108022))))

(assert (=> b!164670 (= res!78000 (and (= (size!3324 (_values!3366 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8081 thiss!1248))) (= (size!3323 (_keys!5207 thiss!1248)) (size!3324 (_values!3366 thiss!1248))) (bvsge (mask!8081 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3124 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3124 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun array_inv!1955 (array!6399) Bool)

(declare-fun array_inv!1956 (array!6401) Bool)

(assert (=> b!164671 (= e!108026 (and tp!14177 tp_is_empty!3661 (array_inv!1955 (_keys!5207 thiss!1248)) (array_inv!1956 (_values!3366 thiss!1248)) e!108021))))

(declare-fun b!164672 () Bool)

(declare-fun res!77999 () Bool)

(assert (=> b!164672 (=> (not res!77999) (not e!108022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164672 (= res!77999 (validMask!0 (mask!8081 thiss!1248)))))

(declare-fun b!164673 () Bool)

(assert (=> b!164673 (= e!108027 e!108022)))

(declare-fun res!77996 () Bool)

(assert (=> b!164673 (=> (not res!77996) (not e!108022))))

(declare-datatypes ((SeekEntryResult!433 0))(
  ( (MissingZero!433 (index!3900 (_ BitVec 32))) (Found!433 (index!3901 (_ BitVec 32))) (Intermediate!433 (undefined!1245 Bool) (index!3902 (_ BitVec 32)) (x!18284 (_ BitVec 32))) (Undefined!433) (MissingVacant!433 (index!3903 (_ BitVec 32))) )
))
(declare-fun lt!82775 () SeekEntryResult!433)

(get-info :version)

(assert (=> b!164673 (= res!77996 (and (not ((_ is Undefined!433) lt!82775)) (not ((_ is MissingVacant!433) lt!82775)) (not ((_ is MissingZero!433) lt!82775)) ((_ is Found!433) lt!82775)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6399 (_ BitVec 32)) SeekEntryResult!433)

(assert (=> b!164673 (= lt!82775 (seekEntryOrOpen!0 key!828 (_keys!5207 thiss!1248) (mask!8081 thiss!1248)))))

(assert (= (and start!16558 res!77995) b!164666))

(assert (= (and b!164666 res!77997) b!164673))

(assert (= (and b!164673 res!77996) b!164663))

(assert (= (and b!164663 res!78001) b!164672))

(assert (= (and b!164672 res!77999) b!164670))

(assert (= (and b!164670 res!78000) b!164667))

(assert (= (and b!164667 res!77998) b!164668))

(assert (= (and b!164664 condMapEmpty!6210) mapIsEmpty!6210))

(assert (= (and b!164664 (not condMapEmpty!6210)) mapNonEmpty!6210))

(assert (= (and mapNonEmpty!6210 ((_ is ValueCellFull!1487) mapValue!6210)) b!164669))

(assert (= (and b!164664 ((_ is ValueCellFull!1487) mapDefault!6210)) b!164665))

(assert (= b!164671 b!164664))

(assert (= start!16558 b!164671))

(declare-fun m!194251 () Bool)

(assert (=> b!164672 m!194251))

(declare-fun m!194253 () Bool)

(assert (=> start!16558 m!194253))

(declare-fun m!194255 () Bool)

(assert (=> b!164663 m!194255))

(assert (=> b!164663 m!194255))

(declare-fun m!194257 () Bool)

(assert (=> b!164663 m!194257))

(declare-fun m!194259 () Bool)

(assert (=> b!164668 m!194259))

(declare-fun m!194261 () Bool)

(assert (=> b!164673 m!194261))

(declare-fun m!194263 () Bool)

(assert (=> b!164667 m!194263))

(declare-fun m!194265 () Bool)

(assert (=> b!164671 m!194265))

(declare-fun m!194267 () Bool)

(assert (=> b!164671 m!194267))

(declare-fun m!194269 () Bool)

(assert (=> mapNonEmpty!6210 m!194269))

(check-sat (not b!164668) (not b!164672) (not b!164671) (not start!16558) (not b!164667) b_and!10247 (not b!164673) (not b_next!3859) tp_is_empty!3661 (not mapNonEmpty!6210) (not b!164663))
(check-sat b_and!10247 (not b_next!3859))
