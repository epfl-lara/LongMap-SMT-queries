; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16798 () Bool)

(assert start!16798)

(declare-fun b!168984 () Bool)

(declare-fun b_free!4099 () Bool)

(declare-fun b_next!4099 () Bool)

(assert (=> b!168984 (= b_free!4099 (not b_next!4099))))

(declare-fun tp!14903 () Bool)

(declare-fun b_and!10487 () Bool)

(assert (=> b!168984 (= tp!14903 b_and!10487)))

(declare-fun b!168974 () Bool)

(declare-fun b_free!4101 () Bool)

(declare-fun b_next!4101 () Bool)

(assert (=> b!168974 (= b_free!4101 (not b_next!4101))))

(declare-fun tp!14902 () Bool)

(declare-fun b_and!10489 () Bool)

(assert (=> b!168974 (= tp!14902 b_and!10489)))

(declare-fun e!111228 () Bool)

(declare-fun e!111230 () Bool)

(declare-fun tp_is_empty!3901 () Bool)

(declare-datatypes ((V!4849 0))(
  ( (V!4850 (val!1995 Int)) )
))
(declare-datatypes ((ValueCell!1607 0))(
  ( (ValueCellFull!1607 (v!3854 V!4849)) (EmptyCell!1607) )
))
(declare-datatypes ((array!6879 0))(
  ( (array!6880 (arr!3274 (Array (_ BitVec 32) (_ BitVec 64))) (size!3563 (_ BitVec 32))) )
))
(declare-datatypes ((array!6881 0))(
  ( (array!6882 (arr!3275 (Array (_ BitVec 32) ValueCell!1607)) (size!3564 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2122 0))(
  ( (LongMapFixedSize!2123 (defaultEntry!3503 Int) (mask!8281 (_ BitVec 32)) (extraKeys!3244 (_ BitVec 32)) (zeroValue!3346 V!4849) (minValue!3346 V!4849) (_size!1110 (_ BitVec 32)) (_keys!5327 array!6879) (_values!3486 array!6881) (_vacant!1110 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2122)

(declare-fun array_inv!2105 (array!6879) Bool)

(declare-fun array_inv!2106 (array!6881) Bool)

(assert (=> b!168974 (= e!111228 (and tp!14902 tp_is_empty!3901 (array_inv!2105 (_keys!5327 thiss!1248)) (array_inv!2106 (_values!3486 thiss!1248)) e!111230))))

(declare-fun b!168975 () Bool)

(declare-fun e!111232 () Bool)

(assert (=> b!168975 (= e!111232 tp_is_empty!3901)))

(declare-fun b!168976 () Bool)

(declare-fun e!111233 () Bool)

(declare-fun mapRes!6573 () Bool)

(assert (=> b!168976 (= e!111230 (and e!111233 mapRes!6573))))

(declare-fun condMapEmpty!6572 () Bool)

(declare-fun mapDefault!6573 () ValueCell!1607)

(assert (=> b!168976 (= condMapEmpty!6572 (= (arr!3275 (_values!3486 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1607)) mapDefault!6573)))))

(declare-fun mapNonEmpty!6572 () Bool)

(declare-fun tp!14901 () Bool)

(declare-fun e!111234 () Bool)

(assert (=> mapNonEmpty!6572 (= mapRes!6573 (and tp!14901 e!111234))))

(declare-fun mapRest!6573 () (Array (_ BitVec 32) ValueCell!1607))

(declare-fun mapKey!6572 () (_ BitVec 32))

(declare-fun mapValue!6573 () ValueCell!1607)

(assert (=> mapNonEmpty!6572 (= (arr!3275 (_values!3486 thiss!1248)) (store mapRest!6573 mapKey!6572 mapValue!6573))))

(declare-fun mapIsEmpty!6572 () Bool)

(declare-fun mapRes!6572 () Bool)

(assert (=> mapIsEmpty!6572 mapRes!6572))

(declare-fun b!168978 () Bool)

(declare-fun res!80392 () Bool)

(declare-fun e!111236 () Bool)

(assert (=> b!168978 (=> (not res!80392) (not e!111236))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!168978 (= res!80392 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6573 () Bool)

(assert (=> mapIsEmpty!6573 mapRes!6573))

(declare-fun b!168977 () Bool)

(assert (=> b!168977 (= e!111234 tp_is_empty!3901)))

(declare-fun res!80391 () Bool)

(assert (=> start!16798 (=> (not res!80391) (not e!111236))))

(declare-fun valid!932 (LongMapFixedSize!2122) Bool)

(assert (=> start!16798 (= res!80391 (valid!932 thiss!1248))))

(assert (=> start!16798 e!111236))

(assert (=> start!16798 e!111228))

(assert (=> start!16798 true))

(declare-fun b!168979 () Bool)

(assert (=> b!168979 (= e!111233 tp_is_empty!3901)))

(declare-fun b!168980 () Bool)

(declare-fun e!111227 () Bool)

(declare-fun e!111231 () Bool)

(assert (=> b!168980 (= e!111227 (and e!111231 mapRes!6572))))

(declare-fun condMapEmpty!6573 () Bool)

(declare-datatypes ((tuple2!3200 0))(
  ( (tuple2!3201 (_1!1611 Bool) (_2!1611 LongMapFixedSize!2122)) )
))
(declare-fun err!39 () tuple2!3200)

(declare-fun mapDefault!6572 () ValueCell!1607)

(assert (=> b!168980 (= condMapEmpty!6573 (= (arr!3275 (_values!3486 (_2!1611 err!39))) ((as const (Array (_ BitVec 32) ValueCell!1607)) mapDefault!6572)))))

(declare-fun b!168981 () Bool)

(declare-fun e!111229 () Bool)

(assert (=> b!168981 (= e!111236 e!111229)))

(declare-fun res!80390 () Bool)

(assert (=> b!168981 (=> (not res!80390) (not e!111229))))

(declare-datatypes ((SeekEntryResult!532 0))(
  ( (MissingZero!532 (index!4296 (_ BitVec 32))) (Found!532 (index!4297 (_ BitVec 32))) (Intermediate!532 (undefined!1344 Bool) (index!4298 (_ BitVec 32)) (x!18703 (_ BitVec 32))) (Undefined!532) (MissingVacant!532 (index!4299 (_ BitVec 32))) )
))
(declare-fun lt!84666 () SeekEntryResult!532)

(get-info :version)

(assert (=> b!168981 (= res!80390 (and (not ((_ is Undefined!532) lt!84666)) (not ((_ is MissingVacant!532) lt!84666)) (not ((_ is MissingZero!532) lt!84666)) (not ((_ is Found!532) lt!84666))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6879 (_ BitVec 32)) SeekEntryResult!532)

(assert (=> b!168981 (= lt!84666 (seekEntryOrOpen!0 key!828 (_keys!5327 thiss!1248) (mask!8281 thiss!1248)))))

(declare-fun b!168982 () Bool)

(assert (=> b!168982 (= e!111229 false)))

(declare-fun lt!84665 () Bool)

(assert (=> b!168982 (= lt!84665 (valid!932 (_2!1611 err!39)))))

(assert (=> b!168982 true))

(declare-fun e!111237 () Bool)

(assert (=> b!168982 e!111237))

(declare-fun b!168983 () Bool)

(assert (=> b!168983 (= e!111231 tp_is_empty!3901)))

(assert (=> b!168984 (= e!111237 (and tp!14903 tp_is_empty!3901 (array_inv!2105 (_keys!5327 (_2!1611 err!39))) (array_inv!2106 (_values!3486 (_2!1611 err!39))) e!111227))))

(declare-fun mapNonEmpty!6573 () Bool)

(declare-fun tp!14904 () Bool)

(assert (=> mapNonEmpty!6573 (= mapRes!6572 (and tp!14904 e!111232))))

(declare-fun mapKey!6573 () (_ BitVec 32))

(declare-fun mapRest!6572 () (Array (_ BitVec 32) ValueCell!1607))

(declare-fun mapValue!6572 () ValueCell!1607)

(assert (=> mapNonEmpty!6573 (= (arr!3275 (_values!3486 (_2!1611 err!39))) (store mapRest!6572 mapKey!6573 mapValue!6572))))

(assert (= (and start!16798 res!80391) b!168978))

(assert (= (and b!168978 res!80392) b!168981))

(assert (= (and b!168981 res!80390) b!168982))

(assert (= (and b!168980 condMapEmpty!6573) mapIsEmpty!6572))

(assert (= (and b!168980 (not condMapEmpty!6573)) mapNonEmpty!6573))

(assert (= (and mapNonEmpty!6573 ((_ is ValueCellFull!1607) mapValue!6572)) b!168975))

(assert (= (and b!168980 ((_ is ValueCellFull!1607) mapDefault!6572)) b!168983))

(assert (= b!168984 b!168980))

(assert (= b!168982 b!168984))

(assert (= (and b!168976 condMapEmpty!6572) mapIsEmpty!6573))

(assert (= (and b!168976 (not condMapEmpty!6572)) mapNonEmpty!6572))

(assert (= (and mapNonEmpty!6572 ((_ is ValueCellFull!1607) mapValue!6573)) b!168977))

(assert (= (and b!168976 ((_ is ValueCellFull!1607) mapDefault!6573)) b!168979))

(assert (= b!168974 b!168976))

(assert (= start!16798 b!168974))

(declare-fun m!197659 () Bool)

(assert (=> b!168984 m!197659))

(declare-fun m!197661 () Bool)

(assert (=> b!168984 m!197661))

(declare-fun m!197663 () Bool)

(assert (=> start!16798 m!197663))

(declare-fun m!197665 () Bool)

(assert (=> mapNonEmpty!6572 m!197665))

(declare-fun m!197667 () Bool)

(assert (=> b!168982 m!197667))

(declare-fun m!197669 () Bool)

(assert (=> b!168974 m!197669))

(declare-fun m!197671 () Bool)

(assert (=> b!168974 m!197671))

(declare-fun m!197673 () Bool)

(assert (=> mapNonEmpty!6573 m!197673))

(declare-fun m!197675 () Bool)

(assert (=> b!168981 m!197675))

(check-sat (not b!168982) (not b_next!4101) (not mapNonEmpty!6572) (not start!16798) tp_is_empty!3901 (not b!168981) (not b!168984) (not mapNonEmpty!6573) (not b!168974) b_and!10489 (not b_next!4099) b_and!10487)
(check-sat b_and!10487 b_and!10489 (not b_next!4101) (not b_next!4099))
