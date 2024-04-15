; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16576 () Bool)

(assert start!16576)

(declare-fun b!164967 () Bool)

(declare-fun b_free!3877 () Bool)

(declare-fun b_next!3877 () Bool)

(assert (=> b!164967 (= b_free!3877 (not b_next!3877))))

(declare-fun tp!14232 () Bool)

(declare-fun b_and!10265 () Bool)

(assert (=> b!164967 (= tp!14232 b_and!10265)))

(declare-fun b!164960 () Bool)

(declare-fun res!78187 () Bool)

(declare-fun e!108211 () Bool)

(assert (=> b!164960 (=> (not res!78187) (not e!108211))))

(declare-datatypes ((V!4553 0))(
  ( (V!4554 (val!1884 Int)) )
))
(declare-datatypes ((ValueCell!1496 0))(
  ( (ValueCellFull!1496 (v!3743 V!4553)) (EmptyCell!1496) )
))
(declare-datatypes ((array!6435 0))(
  ( (array!6436 (arr!3052 (Array (_ BitVec 32) (_ BitVec 64))) (size!3341 (_ BitVec 32))) )
))
(declare-datatypes ((array!6437 0))(
  ( (array!6438 (arr!3053 (Array (_ BitVec 32) ValueCell!1496)) (size!3342 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1900 0))(
  ( (LongMapFixedSize!1901 (defaultEntry!3392 Int) (mask!8096 (_ BitVec 32)) (extraKeys!3133 (_ BitVec 32)) (zeroValue!3235 V!4553) (minValue!3235 V!4553) (_size!999 (_ BitVec 32)) (_keys!5216 array!6435) (_values!3375 array!6437) (_vacant!999 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1900)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6435 (_ BitVec 32)) Bool)

(assert (=> b!164960 (= res!78187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5216 thiss!1248) (mask!8096 thiss!1248)))))

(declare-fun b!164961 () Bool)

(declare-fun res!78190 () Bool)

(declare-fun e!108213 () Bool)

(assert (=> b!164961 (=> (not res!78190) (not e!108213))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!164961 (= res!78190 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164962 () Bool)

(declare-fun e!108214 () Bool)

(declare-fun e!108215 () Bool)

(declare-fun mapRes!6237 () Bool)

(assert (=> b!164962 (= e!108214 (and e!108215 mapRes!6237))))

(declare-fun condMapEmpty!6237 () Bool)

(declare-fun mapDefault!6237 () ValueCell!1496)

(assert (=> b!164962 (= condMapEmpty!6237 (= (arr!3053 (_values!3375 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1496)) mapDefault!6237)))))

(declare-fun b!164963 () Bool)

(declare-fun e!108216 () Bool)

(declare-fun tp_is_empty!3679 () Bool)

(assert (=> b!164963 (= e!108216 tp_is_empty!3679)))

(declare-fun b!164964 () Bool)

(declare-fun res!78188 () Bool)

(assert (=> b!164964 (=> (not res!78188) (not e!108211))))

(declare-datatypes ((tuple2!3044 0))(
  ( (tuple2!3045 (_1!1533 (_ BitVec 64)) (_2!1533 V!4553)) )
))
(declare-datatypes ((List!2043 0))(
  ( (Nil!2040) (Cons!2039 (h!2656 tuple2!3044) (t!6836 List!2043)) )
))
(declare-datatypes ((ListLongMap!1987 0))(
  ( (ListLongMap!1988 (toList!1009 List!2043)) )
))
(declare-fun contains!1054 (ListLongMap!1987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!651 (array!6435 array!6437 (_ BitVec 32) (_ BitVec 32) V!4553 V!4553 (_ BitVec 32) Int) ListLongMap!1987)

(assert (=> b!164964 (= res!78188 (contains!1054 (getCurrentListMap!651 (_keys!5216 thiss!1248) (_values!3375 thiss!1248) (mask!8096 thiss!1248) (extraKeys!3133 thiss!1248) (zeroValue!3235 thiss!1248) (minValue!3235 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3392 thiss!1248)) key!828))))

(declare-fun b!164965 () Bool)

(assert (=> b!164965 (= e!108211 false)))

(declare-fun lt!82829 () Bool)

(declare-datatypes ((List!2044 0))(
  ( (Nil!2041) (Cons!2040 (h!2657 (_ BitVec 64)) (t!6837 List!2044)) )
))
(declare-fun arrayNoDuplicates!0 (array!6435 (_ BitVec 32) List!2044) Bool)

(assert (=> b!164965 (= lt!82829 (arrayNoDuplicates!0 (_keys!5216 thiss!1248) #b00000000000000000000000000000000 Nil!2041))))

(declare-fun mapNonEmpty!6237 () Bool)

(declare-fun tp!14231 () Bool)

(assert (=> mapNonEmpty!6237 (= mapRes!6237 (and tp!14231 e!108216))))

(declare-fun mapRest!6237 () (Array (_ BitVec 32) ValueCell!1496))

(declare-fun mapValue!6237 () ValueCell!1496)

(declare-fun mapKey!6237 () (_ BitVec 32))

(assert (=> mapNonEmpty!6237 (= (arr!3053 (_values!3375 thiss!1248)) (store mapRest!6237 mapKey!6237 mapValue!6237))))

(declare-fun b!164966 () Bool)

(declare-fun res!78189 () Bool)

(assert (=> b!164966 (=> (not res!78189) (not e!108211))))

(assert (=> b!164966 (= res!78189 (and (= (size!3342 (_values!3375 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8096 thiss!1248))) (= (size!3341 (_keys!5216 thiss!1248)) (size!3342 (_values!3375 thiss!1248))) (bvsge (mask!8096 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3133 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3133 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!6237 () Bool)

(assert (=> mapIsEmpty!6237 mapRes!6237))

(declare-fun e!108210 () Bool)

(declare-fun array_inv!1961 (array!6435) Bool)

(declare-fun array_inv!1962 (array!6437) Bool)

(assert (=> b!164967 (= e!108210 (and tp!14232 tp_is_empty!3679 (array_inv!1961 (_keys!5216 thiss!1248)) (array_inv!1962 (_values!3375 thiss!1248)) e!108214))))

(declare-fun b!164968 () Bool)

(assert (=> b!164968 (= e!108213 e!108211)))

(declare-fun res!78186 () Bool)

(assert (=> b!164968 (=> (not res!78186) (not e!108211))))

(declare-datatypes ((SeekEntryResult!438 0))(
  ( (MissingZero!438 (index!3920 (_ BitVec 32))) (Found!438 (index!3921 (_ BitVec 32))) (Intermediate!438 (undefined!1250 Bool) (index!3922 (_ BitVec 32)) (x!18313 (_ BitVec 32))) (Undefined!438) (MissingVacant!438 (index!3923 (_ BitVec 32))) )
))
(declare-fun lt!82830 () SeekEntryResult!438)

(get-info :version)

(assert (=> b!164968 (= res!78186 (and (not ((_ is Undefined!438) lt!82830)) (not ((_ is MissingVacant!438) lt!82830)) (not ((_ is MissingZero!438) lt!82830)) ((_ is Found!438) lt!82830)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6435 (_ BitVec 32)) SeekEntryResult!438)

(assert (=> b!164968 (= lt!82830 (seekEntryOrOpen!0 key!828 (_keys!5216 thiss!1248) (mask!8096 thiss!1248)))))

(declare-fun res!78184 () Bool)

(assert (=> start!16576 (=> (not res!78184) (not e!108213))))

(declare-fun valid!847 (LongMapFixedSize!1900) Bool)

(assert (=> start!16576 (= res!78184 (valid!847 thiss!1248))))

(assert (=> start!16576 e!108213))

(assert (=> start!16576 e!108210))

(assert (=> start!16576 true))

(declare-fun b!164969 () Bool)

(declare-fun res!78185 () Bool)

(assert (=> b!164969 (=> (not res!78185) (not e!108211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164969 (= res!78185 (validMask!0 (mask!8096 thiss!1248)))))

(declare-fun b!164970 () Bool)

(assert (=> b!164970 (= e!108215 tp_is_empty!3679)))

(assert (= (and start!16576 res!78184) b!164961))

(assert (= (and b!164961 res!78190) b!164968))

(assert (= (and b!164968 res!78186) b!164964))

(assert (= (and b!164964 res!78188) b!164969))

(assert (= (and b!164969 res!78185) b!164966))

(assert (= (and b!164966 res!78189) b!164960))

(assert (= (and b!164960 res!78187) b!164965))

(assert (= (and b!164962 condMapEmpty!6237) mapIsEmpty!6237))

(assert (= (and b!164962 (not condMapEmpty!6237)) mapNonEmpty!6237))

(assert (= (and mapNonEmpty!6237 ((_ is ValueCellFull!1496) mapValue!6237)) b!164963))

(assert (= (and b!164962 ((_ is ValueCellFull!1496) mapDefault!6237)) b!164970))

(assert (= b!164967 b!164962))

(assert (= start!16576 b!164967))

(declare-fun m!194431 () Bool)

(assert (=> b!164968 m!194431))

(declare-fun m!194433 () Bool)

(assert (=> b!164965 m!194433))

(declare-fun m!194435 () Bool)

(assert (=> start!16576 m!194435))

(declare-fun m!194437 () Bool)

(assert (=> b!164969 m!194437))

(declare-fun m!194439 () Bool)

(assert (=> b!164964 m!194439))

(assert (=> b!164964 m!194439))

(declare-fun m!194441 () Bool)

(assert (=> b!164964 m!194441))

(declare-fun m!194443 () Bool)

(assert (=> mapNonEmpty!6237 m!194443))

(declare-fun m!194445 () Bool)

(assert (=> b!164960 m!194445))

(declare-fun m!194447 () Bool)

(assert (=> b!164967 m!194447))

(declare-fun m!194449 () Bool)

(assert (=> b!164967 m!194449))

(check-sat tp_is_empty!3679 (not b!164969) (not b!164960) (not b!164964) (not b_next!3877) b_and!10265 (not b!164967) (not mapNonEmpty!6237) (not b!164968) (not start!16576) (not b!164965))
(check-sat b_and!10265 (not b_next!3877))
