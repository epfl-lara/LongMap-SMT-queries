; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16624 () Bool)

(assert start!16624)

(declare-fun b!165949 () Bool)

(declare-fun b_free!3925 () Bool)

(declare-fun b_next!3925 () Bool)

(assert (=> b!165949 (= b_free!3925 (not b_next!3925))))

(declare-fun tp!14376 () Bool)

(declare-fun b_and!10353 () Bool)

(assert (=> b!165949 (= tp!14376 b_and!10353)))

(declare-fun b!165946 () Bool)

(declare-fun e!108839 () Bool)

(declare-fun tp_is_empty!3727 () Bool)

(assert (=> b!165946 (= e!108839 tp_is_empty!3727)))

(declare-fun b!165947 () Bool)

(declare-fun e!108843 () Bool)

(declare-fun e!108845 () Bool)

(declare-fun mapRes!6309 () Bool)

(assert (=> b!165947 (= e!108843 (and e!108845 mapRes!6309))))

(declare-fun condMapEmpty!6309 () Bool)

(declare-datatypes ((V!4617 0))(
  ( (V!4618 (val!1908 Int)) )
))
(declare-datatypes ((ValueCell!1520 0))(
  ( (ValueCellFull!1520 (v!3774 V!4617)) (EmptyCell!1520) )
))
(declare-datatypes ((array!6537 0))(
  ( (array!6538 (arr!3104 (Array (_ BitVec 32) (_ BitVec 64))) (size!3392 (_ BitVec 32))) )
))
(declare-datatypes ((array!6539 0))(
  ( (array!6540 (arr!3105 (Array (_ BitVec 32) ValueCell!1520)) (size!3393 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1948 0))(
  ( (LongMapFixedSize!1949 (defaultEntry!3416 Int) (mask!8137 (_ BitVec 32)) (extraKeys!3157 (_ BitVec 32)) (zeroValue!3259 V!4617) (minValue!3259 V!4617) (_size!1023 (_ BitVec 32)) (_keys!5241 array!6537) (_values!3399 array!6539) (_vacant!1023 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1948)

(declare-fun mapDefault!6309 () ValueCell!1520)

(assert (=> b!165947 (= condMapEmpty!6309 (= (arr!3105 (_values!3399 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1520)) mapDefault!6309)))))

(declare-fun mapIsEmpty!6309 () Bool)

(assert (=> mapIsEmpty!6309 mapRes!6309))

(declare-fun b!165948 () Bool)

(declare-fun res!78810 () Bool)

(declare-fun e!108844 () Bool)

(assert (=> b!165948 (=> (not res!78810) (not e!108844))))

(assert (=> b!165948 (= res!78810 (and (= (size!3393 (_values!3399 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8137 thiss!1248))) (= (size!3392 (_keys!5241 thiss!1248)) (size!3393 (_values!3399 thiss!1248))) (bvsge (mask!8137 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3157 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3157 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!108840 () Bool)

(declare-fun array_inv!1991 (array!6537) Bool)

(declare-fun array_inv!1992 (array!6539) Bool)

(assert (=> b!165949 (= e!108840 (and tp!14376 tp_is_empty!3727 (array_inv!1991 (_keys!5241 thiss!1248)) (array_inv!1992 (_values!3399 thiss!1248)) e!108843))))

(declare-fun b!165950 () Bool)

(declare-fun res!78804 () Bool)

(assert (=> b!165950 (=> (not res!78804) (not e!108844))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165950 (= res!78804 (validMask!0 (mask!8137 thiss!1248)))))

(declare-fun b!165951 () Bool)

(declare-fun e!108842 () Bool)

(assert (=> b!165951 (= e!108842 e!108844)))

(declare-fun res!78808 () Bool)

(assert (=> b!165951 (=> (not res!78808) (not e!108844))))

(declare-datatypes ((SeekEntryResult!440 0))(
  ( (MissingZero!440 (index!3928 (_ BitVec 32))) (Found!440 (index!3929 (_ BitVec 32))) (Intermediate!440 (undefined!1252 Bool) (index!3930 (_ BitVec 32)) (x!18380 (_ BitVec 32))) (Undefined!440) (MissingVacant!440 (index!3931 (_ BitVec 32))) )
))
(declare-fun lt!83213 () SeekEntryResult!440)

(get-info :version)

(assert (=> b!165951 (= res!78808 (and (not ((_ is Undefined!440) lt!83213)) (not ((_ is MissingVacant!440) lt!83213)) (not ((_ is MissingZero!440) lt!83213)) ((_ is Found!440) lt!83213)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6537 (_ BitVec 32)) SeekEntryResult!440)

(assert (=> b!165951 (= lt!83213 (seekEntryOrOpen!0 key!828 (_keys!5241 thiss!1248) (mask!8137 thiss!1248)))))

(declare-fun mapNonEmpty!6309 () Bool)

(declare-fun tp!14375 () Bool)

(assert (=> mapNonEmpty!6309 (= mapRes!6309 (and tp!14375 e!108839))))

(declare-fun mapValue!6309 () ValueCell!1520)

(declare-fun mapRest!6309 () (Array (_ BitVec 32) ValueCell!1520))

(declare-fun mapKey!6309 () (_ BitVec 32))

(assert (=> mapNonEmpty!6309 (= (arr!3105 (_values!3399 thiss!1248)) (store mapRest!6309 mapKey!6309 mapValue!6309))))

(declare-fun b!165952 () Bool)

(declare-fun res!78806 () Bool)

(assert (=> b!165952 (=> (not res!78806) (not e!108844))))

(declare-datatypes ((tuple2!3040 0))(
  ( (tuple2!3041 (_1!1531 (_ BitVec 64)) (_2!1531 V!4617)) )
))
(declare-datatypes ((List!2059 0))(
  ( (Nil!2056) (Cons!2055 (h!2672 tuple2!3040) (t!6853 List!2059)) )
))
(declare-datatypes ((ListLongMap!2001 0))(
  ( (ListLongMap!2002 (toList!1016 List!2059)) )
))
(declare-fun contains!1068 (ListLongMap!2001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!678 (array!6537 array!6539 (_ BitVec 32) (_ BitVec 32) V!4617 V!4617 (_ BitVec 32) Int) ListLongMap!2001)

(assert (=> b!165952 (= res!78806 (not (contains!1068 (getCurrentListMap!678 (_keys!5241 thiss!1248) (_values!3399 thiss!1248) (mask!8137 thiss!1248) (extraKeys!3157 thiss!1248) (zeroValue!3259 thiss!1248) (minValue!3259 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3416 thiss!1248)) key!828)))))

(declare-fun res!78807 () Bool)

(assert (=> start!16624 (=> (not res!78807) (not e!108842))))

(declare-fun valid!872 (LongMapFixedSize!1948) Bool)

(assert (=> start!16624 (= res!78807 (valid!872 thiss!1248))))

(assert (=> start!16624 e!108842))

(assert (=> start!16624 e!108840))

(assert (=> start!16624 true))

(declare-fun b!165953 () Bool)

(declare-fun res!78809 () Bool)

(assert (=> b!165953 (=> (not res!78809) (not e!108842))))

(assert (=> b!165953 (= res!78809 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165954 () Bool)

(assert (=> b!165954 (= e!108844 false)))

(declare-fun lt!83214 () Bool)

(declare-datatypes ((List!2060 0))(
  ( (Nil!2057) (Cons!2056 (h!2673 (_ BitVec 64)) (t!6854 List!2060)) )
))
(declare-fun arrayNoDuplicates!0 (array!6537 (_ BitVec 32) List!2060) Bool)

(assert (=> b!165954 (= lt!83214 (arrayNoDuplicates!0 (_keys!5241 thiss!1248) #b00000000000000000000000000000000 Nil!2057))))

(declare-fun b!165955 () Bool)

(declare-fun res!78805 () Bool)

(assert (=> b!165955 (=> (not res!78805) (not e!108844))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6537 (_ BitVec 32)) Bool)

(assert (=> b!165955 (= res!78805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5241 thiss!1248) (mask!8137 thiss!1248)))))

(declare-fun b!165956 () Bool)

(assert (=> b!165956 (= e!108845 tp_is_empty!3727)))

(assert (= (and start!16624 res!78807) b!165953))

(assert (= (and b!165953 res!78809) b!165951))

(assert (= (and b!165951 res!78808) b!165952))

(assert (= (and b!165952 res!78806) b!165950))

(assert (= (and b!165950 res!78804) b!165948))

(assert (= (and b!165948 res!78810) b!165955))

(assert (= (and b!165955 res!78805) b!165954))

(assert (= (and b!165947 condMapEmpty!6309) mapIsEmpty!6309))

(assert (= (and b!165947 (not condMapEmpty!6309)) mapNonEmpty!6309))

(assert (= (and mapNonEmpty!6309 ((_ is ValueCellFull!1520) mapValue!6309)) b!165946))

(assert (= (and b!165947 ((_ is ValueCellFull!1520) mapDefault!6309)) b!165956))

(assert (= b!165949 b!165947))

(assert (= start!16624 b!165949))

(declare-fun m!195713 () Bool)

(assert (=> b!165954 m!195713))

(declare-fun m!195715 () Bool)

(assert (=> b!165952 m!195715))

(assert (=> b!165952 m!195715))

(declare-fun m!195717 () Bool)

(assert (=> b!165952 m!195717))

(declare-fun m!195719 () Bool)

(assert (=> b!165955 m!195719))

(declare-fun m!195721 () Bool)

(assert (=> b!165949 m!195721))

(declare-fun m!195723 () Bool)

(assert (=> b!165949 m!195723))

(declare-fun m!195725 () Bool)

(assert (=> start!16624 m!195725))

(declare-fun m!195727 () Bool)

(assert (=> mapNonEmpty!6309 m!195727))

(declare-fun m!195729 () Bool)

(assert (=> b!165951 m!195729))

(declare-fun m!195731 () Bool)

(assert (=> b!165950 m!195731))

(check-sat (not start!16624) (not b!165951) (not b!165952) tp_is_empty!3727 (not b!165954) (not b!165950) b_and!10353 (not b_next!3925) (not mapNonEmpty!6309) (not b!165949) (not b!165955))
(check-sat b_and!10353 (not b_next!3925))
