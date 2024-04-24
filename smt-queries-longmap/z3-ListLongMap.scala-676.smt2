; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16564 () Bool)

(assert start!16564)

(declare-fun b!164958 () Bool)

(declare-fun b_free!3865 () Bool)

(declare-fun b_next!3865 () Bool)

(assert (=> b!164958 (= b_free!3865 (not b_next!3865))))

(declare-fun tp!14195 () Bool)

(declare-fun b_and!10293 () Bool)

(assert (=> b!164958 (= tp!14195 b_and!10293)))

(declare-fun b!164956 () Bool)

(declare-fun e!108209 () Bool)

(declare-fun e!108213 () Bool)

(declare-fun mapRes!6219 () Bool)

(assert (=> b!164956 (= e!108209 (and e!108213 mapRes!6219))))

(declare-fun condMapEmpty!6219 () Bool)

(declare-datatypes ((V!4537 0))(
  ( (V!4538 (val!1878 Int)) )
))
(declare-datatypes ((ValueCell!1490 0))(
  ( (ValueCellFull!1490 (v!3744 V!4537)) (EmptyCell!1490) )
))
(declare-datatypes ((array!6417 0))(
  ( (array!6418 (arr!3044 (Array (_ BitVec 32) (_ BitVec 64))) (size!3332 (_ BitVec 32))) )
))
(declare-datatypes ((array!6419 0))(
  ( (array!6420 (arr!3045 (Array (_ BitVec 32) ValueCell!1490)) (size!3333 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1888 0))(
  ( (LongMapFixedSize!1889 (defaultEntry!3386 Int) (mask!8087 (_ BitVec 32)) (extraKeys!3127 (_ BitVec 32)) (zeroValue!3229 V!4537) (minValue!3229 V!4537) (_size!993 (_ BitVec 32)) (_keys!5211 array!6417) (_values!3369 array!6419) (_vacant!993 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1888)

(declare-fun mapDefault!6219 () ValueCell!1490)

(assert (=> b!164956 (= condMapEmpty!6219 (= (arr!3045 (_values!3369 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1490)) mapDefault!6219)))))

(declare-fun b!164957 () Bool)

(declare-fun res!78179 () Bool)

(declare-fun e!108214 () Bool)

(assert (=> b!164957 (=> (not res!78179) (not e!108214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164957 (= res!78179 (validMask!0 (mask!8087 thiss!1248)))))

(declare-fun tp_is_empty!3667 () Bool)

(declare-fun e!108211 () Bool)

(declare-fun array_inv!1953 (array!6417) Bool)

(declare-fun array_inv!1954 (array!6419) Bool)

(assert (=> b!164958 (= e!108211 (and tp!14195 tp_is_empty!3667 (array_inv!1953 (_keys!5211 thiss!1248)) (array_inv!1954 (_values!3369 thiss!1248)) e!108209))))

(declare-fun b!164959 () Bool)

(assert (=> b!164959 (= e!108214 false)))

(declare-fun lt!83034 () Bool)

(declare-datatypes ((List!2022 0))(
  ( (Nil!2019) (Cons!2018 (h!2635 (_ BitVec 64)) (t!6816 List!2022)) )
))
(declare-fun arrayNoDuplicates!0 (array!6417 (_ BitVec 32) List!2022) Bool)

(assert (=> b!164959 (= lt!83034 (arrayNoDuplicates!0 (_keys!5211 thiss!1248) #b00000000000000000000000000000000 Nil!2019))))

(declare-fun b!164960 () Bool)

(declare-fun e!108215 () Bool)

(assert (=> b!164960 (= e!108215 e!108214)))

(declare-fun res!78175 () Bool)

(assert (=> b!164960 (=> (not res!78175) (not e!108214))))

(declare-datatypes ((SeekEntryResult!422 0))(
  ( (MissingZero!422 (index!3856 (_ BitVec 32))) (Found!422 (index!3857 (_ BitVec 32))) (Intermediate!422 (undefined!1234 Bool) (index!3858 (_ BitVec 32)) (x!18282 (_ BitVec 32))) (Undefined!422) (MissingVacant!422 (index!3859 (_ BitVec 32))) )
))
(declare-fun lt!83033 () SeekEntryResult!422)

(get-info :version)

(assert (=> b!164960 (= res!78175 (and (not ((_ is Undefined!422) lt!83033)) (not ((_ is MissingVacant!422) lt!83033)) (not ((_ is MissingZero!422) lt!83033)) ((_ is Found!422) lt!83033)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6417 (_ BitVec 32)) SeekEntryResult!422)

(assert (=> b!164960 (= lt!83033 (seekEntryOrOpen!0 key!828 (_keys!5211 thiss!1248) (mask!8087 thiss!1248)))))

(declare-fun res!78180 () Bool)

(assert (=> start!16564 (=> (not res!78180) (not e!108215))))

(declare-fun valid!854 (LongMapFixedSize!1888) Bool)

(assert (=> start!16564 (= res!78180 (valid!854 thiss!1248))))

(assert (=> start!16564 e!108215))

(assert (=> start!16564 e!108211))

(assert (=> start!16564 true))

(declare-fun b!164961 () Bool)

(declare-fun res!78178 () Bool)

(assert (=> b!164961 (=> (not res!78178) (not e!108214))))

(assert (=> b!164961 (= res!78178 (and (= (size!3333 (_values!3369 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8087 thiss!1248))) (= (size!3332 (_keys!5211 thiss!1248)) (size!3333 (_values!3369 thiss!1248))) (bvsge (mask!8087 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3127 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3127 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6219 () Bool)

(declare-fun tp!14196 () Bool)

(declare-fun e!108212 () Bool)

(assert (=> mapNonEmpty!6219 (= mapRes!6219 (and tp!14196 e!108212))))

(declare-fun mapRest!6219 () (Array (_ BitVec 32) ValueCell!1490))

(declare-fun mapKey!6219 () (_ BitVec 32))

(declare-fun mapValue!6219 () ValueCell!1490)

(assert (=> mapNonEmpty!6219 (= (arr!3045 (_values!3369 thiss!1248)) (store mapRest!6219 mapKey!6219 mapValue!6219))))

(declare-fun b!164962 () Bool)

(declare-fun res!78177 () Bool)

(assert (=> b!164962 (=> (not res!78177) (not e!108214))))

(declare-datatypes ((tuple2!3002 0))(
  ( (tuple2!3003 (_1!1512 (_ BitVec 64)) (_2!1512 V!4537)) )
))
(declare-datatypes ((List!2023 0))(
  ( (Nil!2020) (Cons!2019 (h!2636 tuple2!3002) (t!6817 List!2023)) )
))
(declare-datatypes ((ListLongMap!1963 0))(
  ( (ListLongMap!1964 (toList!997 List!2023)) )
))
(declare-fun contains!1049 (ListLongMap!1963 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!659 (array!6417 array!6419 (_ BitVec 32) (_ BitVec 32) V!4537 V!4537 (_ BitVec 32) Int) ListLongMap!1963)

(assert (=> b!164962 (= res!78177 (contains!1049 (getCurrentListMap!659 (_keys!5211 thiss!1248) (_values!3369 thiss!1248) (mask!8087 thiss!1248) (extraKeys!3127 thiss!1248) (zeroValue!3229 thiss!1248) (minValue!3229 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3386 thiss!1248)) key!828))))

(declare-fun b!164963 () Bool)

(assert (=> b!164963 (= e!108213 tp_is_empty!3667)))

(declare-fun mapIsEmpty!6219 () Bool)

(assert (=> mapIsEmpty!6219 mapRes!6219))

(declare-fun b!164964 () Bool)

(declare-fun res!78174 () Bool)

(assert (=> b!164964 (=> (not res!78174) (not e!108215))))

(assert (=> b!164964 (= res!78174 (not (= key!828 (bvneg key!828))))))

(declare-fun b!164965 () Bool)

(declare-fun res!78176 () Bool)

(assert (=> b!164965 (=> (not res!78176) (not e!108214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6417 (_ BitVec 32)) Bool)

(assert (=> b!164965 (= res!78176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5211 thiss!1248) (mask!8087 thiss!1248)))))

(declare-fun b!164966 () Bool)

(assert (=> b!164966 (= e!108212 tp_is_empty!3667)))

(assert (= (and start!16564 res!78180) b!164964))

(assert (= (and b!164964 res!78174) b!164960))

(assert (= (and b!164960 res!78175) b!164962))

(assert (= (and b!164962 res!78177) b!164957))

(assert (= (and b!164957 res!78179) b!164961))

(assert (= (and b!164961 res!78178) b!164965))

(assert (= (and b!164965 res!78176) b!164959))

(assert (= (and b!164956 condMapEmpty!6219) mapIsEmpty!6219))

(assert (= (and b!164956 (not condMapEmpty!6219)) mapNonEmpty!6219))

(assert (= (and mapNonEmpty!6219 ((_ is ValueCellFull!1490) mapValue!6219)) b!164966))

(assert (= (and b!164956 ((_ is ValueCellFull!1490) mapDefault!6219)) b!164963))

(assert (= b!164958 b!164956))

(assert (= start!16564 b!164958))

(declare-fun m!195113 () Bool)

(assert (=> b!164958 m!195113))

(declare-fun m!195115 () Bool)

(assert (=> b!164958 m!195115))

(declare-fun m!195117 () Bool)

(assert (=> b!164959 m!195117))

(declare-fun m!195119 () Bool)

(assert (=> b!164962 m!195119))

(assert (=> b!164962 m!195119))

(declare-fun m!195121 () Bool)

(assert (=> b!164962 m!195121))

(declare-fun m!195123 () Bool)

(assert (=> b!164960 m!195123))

(declare-fun m!195125 () Bool)

(assert (=> start!16564 m!195125))

(declare-fun m!195127 () Bool)

(assert (=> b!164965 m!195127))

(declare-fun m!195129 () Bool)

(assert (=> b!164957 m!195129))

(declare-fun m!195131 () Bool)

(assert (=> mapNonEmpty!6219 m!195131))

(check-sat (not mapNonEmpty!6219) tp_is_empty!3667 (not b!164962) (not b_next!3865) (not start!16564) (not b!164965) (not b!164960) (not b!164958) (not b!164959) (not b!164957) b_and!10293)
(check-sat b_and!10293 (not b_next!3865))
