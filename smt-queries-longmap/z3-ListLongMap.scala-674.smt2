; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16552 () Bool)

(assert start!16552)

(declare-fun b!164572 () Bool)

(declare-fun b_free!3853 () Bool)

(declare-fun b_next!3853 () Bool)

(assert (=> b!164572 (= b_free!3853 (not b_next!3853))))

(declare-fun tp!14160 () Bool)

(declare-fun b_and!10241 () Bool)

(assert (=> b!164572 (= tp!14160 b_and!10241)))

(declare-fun b!164564 () Bool)

(declare-fun e!107962 () Bool)

(assert (=> b!164564 (= e!107962 false)))

(declare-fun lt!82757 () Bool)

(declare-datatypes ((V!4521 0))(
  ( (V!4522 (val!1872 Int)) )
))
(declare-datatypes ((ValueCell!1484 0))(
  ( (ValueCellFull!1484 (v!3731 V!4521)) (EmptyCell!1484) )
))
(declare-datatypes ((array!6387 0))(
  ( (array!6388 (arr!3028 (Array (_ BitVec 32) (_ BitVec 64))) (size!3317 (_ BitVec 32))) )
))
(declare-datatypes ((array!6389 0))(
  ( (array!6390 (arr!3029 (Array (_ BitVec 32) ValueCell!1484)) (size!3318 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1876 0))(
  ( (LongMapFixedSize!1877 (defaultEntry!3380 Int) (mask!8076 (_ BitVec 32)) (extraKeys!3121 (_ BitVec 32)) (zeroValue!3223 V!4521) (minValue!3223 V!4521) (_size!987 (_ BitVec 32)) (_keys!5204 array!6387) (_values!3363 array!6389) (_vacant!987 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1876)

(declare-datatypes ((List!2028 0))(
  ( (Nil!2025) (Cons!2024 (h!2641 (_ BitVec 64)) (t!6821 List!2028)) )
))
(declare-fun arrayNoDuplicates!0 (array!6387 (_ BitVec 32) List!2028) Bool)

(assert (=> b!164564 (= lt!82757 (arrayNoDuplicates!0 (_keys!5204 thiss!1248) #b00000000000000000000000000000000 Nil!2025))))

(declare-fun mapIsEmpty!6201 () Bool)

(declare-fun mapRes!6201 () Bool)

(assert (=> mapIsEmpty!6201 mapRes!6201))

(declare-fun b!164565 () Bool)

(declare-fun res!77934 () Bool)

(assert (=> b!164565 (=> (not res!77934) (not e!107962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6387 (_ BitVec 32)) Bool)

(assert (=> b!164565 (= res!77934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5204 thiss!1248) (mask!8076 thiss!1248)))))

(declare-fun b!164566 () Bool)

(declare-fun res!77933 () Bool)

(declare-fun e!107961 () Bool)

(assert (=> b!164566 (=> (not res!77933) (not e!107961))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164566 (= res!77933 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164567 () Bool)

(assert (=> b!164567 (= e!107961 e!107962)))

(declare-fun res!77937 () Bool)

(assert (=> b!164567 (=> (not res!77937) (not e!107962))))

(declare-datatypes ((SeekEntryResult!431 0))(
  ( (MissingZero!431 (index!3892 (_ BitVec 32))) (Found!431 (index!3893 (_ BitVec 32))) (Intermediate!431 (undefined!1243 Bool) (index!3894 (_ BitVec 32)) (x!18274 (_ BitVec 32))) (Undefined!431) (MissingVacant!431 (index!3895 (_ BitVec 32))) )
))
(declare-fun lt!82758 () SeekEntryResult!431)

(get-info :version)

(assert (=> b!164567 (= res!77937 (and (not ((_ is Undefined!431) lt!82758)) (not ((_ is MissingVacant!431) lt!82758)) (not ((_ is MissingZero!431) lt!82758)) ((_ is Found!431) lt!82758)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6387 (_ BitVec 32)) SeekEntryResult!431)

(assert (=> b!164567 (= lt!82758 (seekEntryOrOpen!0 key!828 (_keys!5204 thiss!1248) (mask!8076 thiss!1248)))))

(declare-fun res!77932 () Bool)

(assert (=> start!16552 (=> (not res!77932) (not e!107961))))

(declare-fun valid!839 (LongMapFixedSize!1876) Bool)

(assert (=> start!16552 (= res!77932 (valid!839 thiss!1248))))

(assert (=> start!16552 e!107961))

(declare-fun e!107963 () Bool)

(assert (=> start!16552 e!107963))

(assert (=> start!16552 true))

(declare-fun b!164568 () Bool)

(declare-fun e!107959 () Bool)

(declare-fun tp_is_empty!3655 () Bool)

(assert (=> b!164568 (= e!107959 tp_is_empty!3655)))

(declare-fun b!164569 () Bool)

(declare-fun res!77935 () Bool)

(assert (=> b!164569 (=> (not res!77935) (not e!107962))))

(declare-datatypes ((tuple2!3028 0))(
  ( (tuple2!3029 (_1!1525 (_ BitVec 64)) (_2!1525 V!4521)) )
))
(declare-datatypes ((List!2029 0))(
  ( (Nil!2026) (Cons!2025 (h!2642 tuple2!3028) (t!6822 List!2029)) )
))
(declare-datatypes ((ListLongMap!1971 0))(
  ( (ListLongMap!1972 (toList!1001 List!2029)) )
))
(declare-fun contains!1046 (ListLongMap!1971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!643 (array!6387 array!6389 (_ BitVec 32) (_ BitVec 32) V!4521 V!4521 (_ BitVec 32) Int) ListLongMap!1971)

(assert (=> b!164569 (= res!77935 (contains!1046 (getCurrentListMap!643 (_keys!5204 thiss!1248) (_values!3363 thiss!1248) (mask!8076 thiss!1248) (extraKeys!3121 thiss!1248) (zeroValue!3223 thiss!1248) (minValue!3223 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3380 thiss!1248)) key!828))))

(declare-fun b!164570 () Bool)

(declare-fun e!107960 () Bool)

(declare-fun e!107964 () Bool)

(assert (=> b!164570 (= e!107960 (and e!107964 mapRes!6201))))

(declare-fun condMapEmpty!6201 () Bool)

(declare-fun mapDefault!6201 () ValueCell!1484)

(assert (=> b!164570 (= condMapEmpty!6201 (= (arr!3029 (_values!3363 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1484)) mapDefault!6201)))))

(declare-fun b!164571 () Bool)

(declare-fun res!77938 () Bool)

(assert (=> b!164571 (=> (not res!77938) (not e!107962))))

(assert (=> b!164571 (= res!77938 (and (= (size!3318 (_values!3363 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8076 thiss!1248))) (= (size!3317 (_keys!5204 thiss!1248)) (size!3318 (_values!3363 thiss!1248))) (bvsge (mask!8076 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3121 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3121 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6201 () Bool)

(declare-fun tp!14159 () Bool)

(assert (=> mapNonEmpty!6201 (= mapRes!6201 (and tp!14159 e!107959))))

(declare-fun mapKey!6201 () (_ BitVec 32))

(declare-fun mapRest!6201 () (Array (_ BitVec 32) ValueCell!1484))

(declare-fun mapValue!6201 () ValueCell!1484)

(assert (=> mapNonEmpty!6201 (= (arr!3029 (_values!3363 thiss!1248)) (store mapRest!6201 mapKey!6201 mapValue!6201))))

(declare-fun array_inv!1949 (array!6387) Bool)

(declare-fun array_inv!1950 (array!6389) Bool)

(assert (=> b!164572 (= e!107963 (and tp!14160 tp_is_empty!3655 (array_inv!1949 (_keys!5204 thiss!1248)) (array_inv!1950 (_values!3363 thiss!1248)) e!107960))))

(declare-fun b!164573 () Bool)

(declare-fun res!77936 () Bool)

(assert (=> b!164573 (=> (not res!77936) (not e!107962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164573 (= res!77936 (validMask!0 (mask!8076 thiss!1248)))))

(declare-fun b!164574 () Bool)

(assert (=> b!164574 (= e!107964 tp_is_empty!3655)))

(assert (= (and start!16552 res!77932) b!164566))

(assert (= (and b!164566 res!77933) b!164567))

(assert (= (and b!164567 res!77937) b!164569))

(assert (= (and b!164569 res!77935) b!164573))

(assert (= (and b!164573 res!77936) b!164571))

(assert (= (and b!164571 res!77938) b!164565))

(assert (= (and b!164565 res!77934) b!164564))

(assert (= (and b!164570 condMapEmpty!6201) mapIsEmpty!6201))

(assert (= (and b!164570 (not condMapEmpty!6201)) mapNonEmpty!6201))

(assert (= (and mapNonEmpty!6201 ((_ is ValueCellFull!1484) mapValue!6201)) b!164568))

(assert (= (and b!164570 ((_ is ValueCellFull!1484) mapDefault!6201)) b!164574))

(assert (= b!164572 b!164570))

(assert (= start!16552 b!164572))

(declare-fun m!194191 () Bool)

(assert (=> mapNonEmpty!6201 m!194191))

(declare-fun m!194193 () Bool)

(assert (=> b!164567 m!194193))

(declare-fun m!194195 () Bool)

(assert (=> b!164572 m!194195))

(declare-fun m!194197 () Bool)

(assert (=> b!164572 m!194197))

(declare-fun m!194199 () Bool)

(assert (=> start!16552 m!194199))

(declare-fun m!194201 () Bool)

(assert (=> b!164573 m!194201))

(declare-fun m!194203 () Bool)

(assert (=> b!164564 m!194203))

(declare-fun m!194205 () Bool)

(assert (=> b!164569 m!194205))

(assert (=> b!164569 m!194205))

(declare-fun m!194207 () Bool)

(assert (=> b!164569 m!194207))

(declare-fun m!194209 () Bool)

(assert (=> b!164565 m!194209))

(check-sat (not b!164569) b_and!10241 tp_is_empty!3655 (not b!164572) (not b!164565) (not b!164564) (not mapNonEmpty!6201) (not b!164573) (not start!16552) (not b_next!3853) (not b!164567))
(check-sat b_and!10241 (not b_next!3853))
