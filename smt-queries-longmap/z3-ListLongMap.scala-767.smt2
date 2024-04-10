; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18072 () Bool)

(assert start!18072)

(declare-fun b!179968 () Bool)

(declare-fun b_free!4443 () Bool)

(declare-fun b_next!4443 () Bool)

(assert (=> b!179968 (= b_free!4443 (not b_next!4443))))

(declare-fun tp!16059 () Bool)

(declare-fun b_and!10977 () Bool)

(assert (=> b!179968 (= tp!16059 b_and!10977)))

(declare-fun b!179965 () Bool)

(declare-fun e!118526 () Bool)

(assert (=> b!179965 (= e!118526 false)))

(declare-datatypes ((V!5267 0))(
  ( (V!5268 (val!2152 Int)) )
))
(declare-datatypes ((tuple2!3344 0))(
  ( (tuple2!3345 (_1!1683 (_ BitVec 64)) (_2!1683 V!5267)) )
))
(declare-datatypes ((List!2286 0))(
  ( (Nil!2283) (Cons!2282 (h!2907 tuple2!3344) (t!7134 List!2286)) )
))
(declare-datatypes ((ListLongMap!2271 0))(
  ( (ListLongMap!2272 (toList!1151 List!2286)) )
))
(declare-fun lt!88862 () ListLongMap!2271)

(declare-datatypes ((ValueCell!1764 0))(
  ( (ValueCellFull!1764 (v!4041 V!5267)) (EmptyCell!1764) )
))
(declare-datatypes ((array!7599 0))(
  ( (array!7600 (arr!3599 (Array (_ BitVec 32) (_ BitVec 64))) (size!3907 (_ BitVec 32))) )
))
(declare-datatypes ((array!7601 0))(
  ( (array!7602 (arr!3600 (Array (_ BitVec 32) ValueCell!1764)) (size!3908 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2436 0))(
  ( (LongMapFixedSize!2437 (defaultEntry!3694 Int) (mask!8687 (_ BitVec 32)) (extraKeys!3431 (_ BitVec 32)) (zeroValue!3535 V!5267) (minValue!3535 V!5267) (_size!1267 (_ BitVec 32)) (_keys!5585 array!7599) (_values!3677 array!7601) (_vacant!1267 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2436)

(declare-fun map!1928 (LongMapFixedSize!2436) ListLongMap!2271)

(assert (=> b!179965 (= lt!88862 (map!1928 thiss!1248))))

(declare-datatypes ((Unit!5475 0))(
  ( (Unit!5476) )
))
(declare-fun lt!88861 () Unit!5475)

(declare-fun e!118523 () Unit!5475)

(assert (=> b!179965 (= lt!88861 e!118523)))

(declare-fun c!32243 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun contains!1227 (ListLongMap!2271 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!803 (array!7599 array!7601 (_ BitVec 32) (_ BitVec 32) V!5267 V!5267 (_ BitVec 32) Int) ListLongMap!2271)

(assert (=> b!179965 (= c!32243 (contains!1227 (getCurrentListMap!803 (_keys!5585 thiss!1248) (_values!3677 thiss!1248) (mask!8687 thiss!1248) (extraKeys!3431 thiss!1248) (zeroValue!3535 thiss!1248) (minValue!3535 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3694 thiss!1248)) key!828))))

(declare-fun res!85255 () Bool)

(assert (=> start!18072 (=> (not res!85255) (not e!118526))))

(declare-fun valid!1015 (LongMapFixedSize!2436) Bool)

(assert (=> start!18072 (= res!85255 (valid!1015 thiss!1248))))

(assert (=> start!18072 e!118526))

(declare-fun e!118525 () Bool)

(assert (=> start!18072 e!118525))

(assert (=> start!18072 true))

(declare-fun b!179966 () Bool)

(declare-fun res!85253 () Bool)

(assert (=> b!179966 (=> (not res!85253) (not e!118526))))

(assert (=> b!179966 (= res!85253 (not (= key!828 (bvneg key!828))))))

(declare-fun b!179967 () Bool)

(declare-fun e!118528 () Bool)

(declare-fun e!118524 () Bool)

(declare-fun mapRes!7216 () Bool)

(assert (=> b!179967 (= e!118528 (and e!118524 mapRes!7216))))

(declare-fun condMapEmpty!7216 () Bool)

(declare-fun mapDefault!7216 () ValueCell!1764)

(assert (=> b!179967 (= condMapEmpty!7216 (= (arr!3600 (_values!3677 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1764)) mapDefault!7216)))))

(declare-fun tp_is_empty!4215 () Bool)

(declare-fun array_inv!2317 (array!7599) Bool)

(declare-fun array_inv!2318 (array!7601) Bool)

(assert (=> b!179968 (= e!118525 (and tp!16059 tp_is_empty!4215 (array_inv!2317 (_keys!5585 thiss!1248)) (array_inv!2318 (_values!3677 thiss!1248)) e!118528))))

(declare-fun mapIsEmpty!7216 () Bool)

(assert (=> mapIsEmpty!7216 mapRes!7216))

(declare-fun b!179969 () Bool)

(declare-fun e!118527 () Bool)

(assert (=> b!179969 (= e!118527 tp_is_empty!4215)))

(declare-fun b!179970 () Bool)

(declare-fun Unit!5477 () Unit!5475)

(assert (=> b!179970 (= e!118523 Unit!5477)))

(declare-fun lt!88860 () Unit!5475)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!139 (array!7599 array!7601 (_ BitVec 32) (_ BitVec 32) V!5267 V!5267 (_ BitVec 64) Int) Unit!5475)

(assert (=> b!179970 (= lt!88860 (lemmaInListMapThenSeekEntryOrOpenFindsIt!139 (_keys!5585 thiss!1248) (_values!3677 thiss!1248) (mask!8687 thiss!1248) (extraKeys!3431 thiss!1248) (zeroValue!3535 thiss!1248) (minValue!3535 thiss!1248) key!828 (defaultEntry!3694 thiss!1248)))))

(assert (=> b!179970 false))

(declare-fun b!179971 () Bool)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (array!7599 array!7601 (_ BitVec 32) (_ BitVec 32) V!5267 V!5267 (_ BitVec 64) Int) Unit!5475)

(assert (=> b!179971 (= e!118523 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!140 (_keys!5585 thiss!1248) (_values!3677 thiss!1248) (mask!8687 thiss!1248) (extraKeys!3431 thiss!1248) (zeroValue!3535 thiss!1248) (minValue!3535 thiss!1248) key!828 (defaultEntry!3694 thiss!1248)))))

(declare-fun b!179972 () Bool)

(declare-fun res!85254 () Bool)

(assert (=> b!179972 (=> (not res!85254) (not e!118526))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!587 0))(
  ( (MissingZero!587 (index!4516 (_ BitVec 32))) (Found!587 (index!4517 (_ BitVec 32))) (Intermediate!587 (undefined!1399 Bool) (index!4518 (_ BitVec 32)) (x!19669 (_ BitVec 32))) (Undefined!587) (MissingVacant!587 (index!4519 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7599 (_ BitVec 32)) SeekEntryResult!587)

(assert (=> b!179972 (= res!85254 ((_ is Undefined!587) (seekEntryOrOpen!0 key!828 (_keys!5585 thiss!1248) (mask!8687 thiss!1248))))))

(declare-fun b!179973 () Bool)

(assert (=> b!179973 (= e!118524 tp_is_empty!4215)))

(declare-fun mapNonEmpty!7216 () Bool)

(declare-fun tp!16060 () Bool)

(assert (=> mapNonEmpty!7216 (= mapRes!7216 (and tp!16060 e!118527))))

(declare-fun mapKey!7216 () (_ BitVec 32))

(declare-fun mapValue!7216 () ValueCell!1764)

(declare-fun mapRest!7216 () (Array (_ BitVec 32) ValueCell!1764))

(assert (=> mapNonEmpty!7216 (= (arr!3600 (_values!3677 thiss!1248)) (store mapRest!7216 mapKey!7216 mapValue!7216))))

(assert (= (and start!18072 res!85255) b!179966))

(assert (= (and b!179966 res!85253) b!179972))

(assert (= (and b!179972 res!85254) b!179965))

(assert (= (and b!179965 c!32243) b!179970))

(assert (= (and b!179965 (not c!32243)) b!179971))

(assert (= (and b!179967 condMapEmpty!7216) mapIsEmpty!7216))

(assert (= (and b!179967 (not condMapEmpty!7216)) mapNonEmpty!7216))

(assert (= (and mapNonEmpty!7216 ((_ is ValueCellFull!1764) mapValue!7216)) b!179969))

(assert (= (and b!179967 ((_ is ValueCellFull!1764) mapDefault!7216)) b!179973))

(assert (= b!179968 b!179967))

(assert (= start!18072 b!179968))

(declare-fun m!208045 () Bool)

(assert (=> b!179965 m!208045))

(declare-fun m!208047 () Bool)

(assert (=> b!179965 m!208047))

(assert (=> b!179965 m!208047))

(declare-fun m!208049 () Bool)

(assert (=> b!179965 m!208049))

(declare-fun m!208051 () Bool)

(assert (=> b!179971 m!208051))

(declare-fun m!208053 () Bool)

(assert (=> start!18072 m!208053))

(declare-fun m!208055 () Bool)

(assert (=> mapNonEmpty!7216 m!208055))

(declare-fun m!208057 () Bool)

(assert (=> b!179972 m!208057))

(declare-fun m!208059 () Bool)

(assert (=> b!179970 m!208059))

(declare-fun m!208061 () Bool)

(assert (=> b!179968 m!208061))

(declare-fun m!208063 () Bool)

(assert (=> b!179968 m!208063))

(check-sat b_and!10977 (not b_next!4443) (not b!179971) (not start!18072) (not b!179968) tp_is_empty!4215 (not b!179970) (not mapNonEmpty!7216) (not b!179965) (not b!179972))
(check-sat b_and!10977 (not b_next!4443))
