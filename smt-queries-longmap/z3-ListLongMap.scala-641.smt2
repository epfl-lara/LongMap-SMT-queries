; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16196 () Bool)

(assert start!16196)

(declare-fun b!161560 () Bool)

(declare-fun b_free!3657 () Bool)

(declare-fun b_next!3657 () Bool)

(assert (=> b!161560 (= b_free!3657 (not b_next!3657))))

(declare-fun tp!13540 () Bool)

(declare-fun b_and!10071 () Bool)

(assert (=> b!161560 (= tp!13540 b_and!10071)))

(declare-fun b!161558 () Bool)

(declare-datatypes ((Unit!5029 0))(
  ( (Unit!5030) )
))
(declare-fun e!105600 () Unit!5029)

(declare-fun Unit!5031 () Unit!5029)

(assert (=> b!161558 (= e!105600 Unit!5031)))

(declare-fun lt!82240 () Unit!5029)

(declare-datatypes ((V!4259 0))(
  ( (V!4260 (val!1774 Int)) )
))
(declare-datatypes ((ValueCell!1386 0))(
  ( (ValueCellFull!1386 (v!3639 V!4259)) (EmptyCell!1386) )
))
(declare-datatypes ((array!5997 0))(
  ( (array!5998 (arr!2843 (Array (_ BitVec 32) (_ BitVec 64))) (size!3127 (_ BitVec 32))) )
))
(declare-datatypes ((array!5999 0))(
  ( (array!6000 (arr!2844 (Array (_ BitVec 32) ValueCell!1386)) (size!3128 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1680 0))(
  ( (LongMapFixedSize!1681 (defaultEntry!3282 Int) (mask!7876 (_ BitVec 32)) (extraKeys!3023 (_ BitVec 32)) (zeroValue!3125 V!4259) (minValue!3125 V!4259) (_size!889 (_ BitVec 32)) (_keys!5083 array!5997) (_values!3265 array!5999) (_vacant!889 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1680)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!81 (array!5997 array!5999 (_ BitVec 32) (_ BitVec 32) V!4259 V!4259 (_ BitVec 64) Int) Unit!5029)

(assert (=> b!161558 (= lt!82240 (lemmaInListMapThenSeekEntryOrOpenFindsIt!81 (_keys!5083 thiss!1248) (_values!3265 thiss!1248) (mask!7876 thiss!1248) (extraKeys!3023 thiss!1248) (zeroValue!3125 thiss!1248) (minValue!3125 thiss!1248) key!828 (defaultEntry!3282 thiss!1248)))))

(assert (=> b!161558 false))

(declare-fun b!161559 () Bool)

(declare-fun e!105603 () Bool)

(declare-fun tp_is_empty!3459 () Bool)

(assert (=> b!161559 (= e!105603 tp_is_empty!3459)))

(declare-fun e!105601 () Bool)

(declare-fun e!105604 () Bool)

(declare-fun array_inv!1815 (array!5997) Bool)

(declare-fun array_inv!1816 (array!5999) Bool)

(assert (=> b!161560 (= e!105601 (and tp!13540 tp_is_empty!3459 (array_inv!1815 (_keys!5083 thiss!1248)) (array_inv!1816 (_values!3265 thiss!1248)) e!105604))))

(declare-fun mapNonEmpty!5876 () Bool)

(declare-fun mapRes!5876 () Bool)

(declare-fun tp!13541 () Bool)

(declare-fun e!105605 () Bool)

(assert (=> mapNonEmpty!5876 (= mapRes!5876 (and tp!13541 e!105605))))

(declare-fun mapValue!5876 () ValueCell!1386)

(declare-fun mapRest!5876 () (Array (_ BitVec 32) ValueCell!1386))

(declare-fun mapKey!5876 () (_ BitVec 32))

(assert (=> mapNonEmpty!5876 (= (arr!2844 (_values!3265 thiss!1248)) (store mapRest!5876 mapKey!5876 mapValue!5876))))

(declare-fun b!161561 () Bool)

(assert (=> b!161561 (= e!105605 tp_is_empty!3459)))

(declare-fun b!161562 () Bool)

(declare-fun e!105602 () Bool)

(assert (=> b!161562 (= e!105602 false)))

(declare-fun lt!82239 () Unit!5029)

(assert (=> b!161562 (= lt!82239 e!105600)))

(declare-fun c!29974 () Bool)

(declare-datatypes ((tuple2!2966 0))(
  ( (tuple2!2967 (_1!1494 (_ BitVec 64)) (_2!1494 V!4259)) )
))
(declare-datatypes ((List!1979 0))(
  ( (Nil!1976) (Cons!1975 (h!2588 tuple2!2966) (t!6781 List!1979)) )
))
(declare-datatypes ((ListLongMap!1953 0))(
  ( (ListLongMap!1954 (toList!992 List!1979)) )
))
(declare-fun contains!1028 (ListLongMap!1953 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!656 (array!5997 array!5999 (_ BitVec 32) (_ BitVec 32) V!4259 V!4259 (_ BitVec 32) Int) ListLongMap!1953)

(assert (=> b!161562 (= c!29974 (contains!1028 (getCurrentListMap!656 (_keys!5083 thiss!1248) (_values!3265 thiss!1248) (mask!7876 thiss!1248) (extraKeys!3023 thiss!1248) (zeroValue!3125 thiss!1248) (minValue!3125 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3282 thiss!1248)) key!828))))

(declare-fun b!161563 () Bool)

(declare-fun res!76568 () Bool)

(assert (=> b!161563 (=> (not res!76568) (not e!105602))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!356 0))(
  ( (MissingZero!356 (index!3592 (_ BitVec 32))) (Found!356 (index!3593 (_ BitVec 32))) (Intermediate!356 (undefined!1168 Bool) (index!3594 (_ BitVec 32)) (x!17828 (_ BitVec 32))) (Undefined!356) (MissingVacant!356 (index!3595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5997 (_ BitVec 32)) SeekEntryResult!356)

(assert (=> b!161563 (= res!76568 ((_ is Undefined!356) (seekEntryOrOpen!0 key!828 (_keys!5083 thiss!1248) (mask!7876 thiss!1248))))))

(declare-fun res!76567 () Bool)

(assert (=> start!16196 (=> (not res!76567) (not e!105602))))

(declare-fun valid!770 (LongMapFixedSize!1680) Bool)

(assert (=> start!16196 (= res!76567 (valid!770 thiss!1248))))

(assert (=> start!16196 e!105602))

(assert (=> start!16196 e!105601))

(assert (=> start!16196 true))

(declare-fun b!161564 () Bool)

(declare-fun res!76566 () Bool)

(assert (=> b!161564 (=> (not res!76566) (not e!105602))))

(assert (=> b!161564 (= res!76566 (not (= key!828 (bvneg key!828))))))

(declare-fun b!161565 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!82 (array!5997 array!5999 (_ BitVec 32) (_ BitVec 32) V!4259 V!4259 (_ BitVec 64) Int) Unit!5029)

(assert (=> b!161565 (= e!105600 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!82 (_keys!5083 thiss!1248) (_values!3265 thiss!1248) (mask!7876 thiss!1248) (extraKeys!3023 thiss!1248) (zeroValue!3125 thiss!1248) (minValue!3125 thiss!1248) key!828 (defaultEntry!3282 thiss!1248)))))

(declare-fun b!161566 () Bool)

(assert (=> b!161566 (= e!105604 (and e!105603 mapRes!5876))))

(declare-fun condMapEmpty!5876 () Bool)

(declare-fun mapDefault!5876 () ValueCell!1386)

(assert (=> b!161566 (= condMapEmpty!5876 (= (arr!2844 (_values!3265 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1386)) mapDefault!5876)))))

(declare-fun mapIsEmpty!5876 () Bool)

(assert (=> mapIsEmpty!5876 mapRes!5876))

(assert (= (and start!16196 res!76567) b!161564))

(assert (= (and b!161564 res!76566) b!161563))

(assert (= (and b!161563 res!76568) b!161562))

(assert (= (and b!161562 c!29974) b!161558))

(assert (= (and b!161562 (not c!29974)) b!161565))

(assert (= (and b!161566 condMapEmpty!5876) mapIsEmpty!5876))

(assert (= (and b!161566 (not condMapEmpty!5876)) mapNonEmpty!5876))

(assert (= (and mapNonEmpty!5876 ((_ is ValueCellFull!1386) mapValue!5876)) b!161561))

(assert (= (and b!161566 ((_ is ValueCellFull!1386) mapDefault!5876)) b!161559))

(assert (= b!161560 b!161566))

(assert (= start!16196 b!161560))

(declare-fun m!193011 () Bool)

(assert (=> start!16196 m!193011))

(declare-fun m!193013 () Bool)

(assert (=> b!161565 m!193013))

(declare-fun m!193015 () Bool)

(assert (=> b!161560 m!193015))

(declare-fun m!193017 () Bool)

(assert (=> b!161560 m!193017))

(declare-fun m!193019 () Bool)

(assert (=> b!161563 m!193019))

(declare-fun m!193021 () Bool)

(assert (=> mapNonEmpty!5876 m!193021))

(declare-fun m!193023 () Bool)

(assert (=> b!161562 m!193023))

(assert (=> b!161562 m!193023))

(declare-fun m!193025 () Bool)

(assert (=> b!161562 m!193025))

(declare-fun m!193027 () Bool)

(assert (=> b!161558 m!193027))

(check-sat (not b!161562) (not b_next!3657) tp_is_empty!3459 (not mapNonEmpty!5876) b_and!10071 (not start!16196) (not b!161563) (not b!161565) (not b!161558) (not b!161560))
(check-sat b_and!10071 (not b_next!3657))
