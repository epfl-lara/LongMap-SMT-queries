; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75966 () Bool)

(assert start!75966)

(declare-fun b!892489 () Bool)

(declare-fun b_free!15769 () Bool)

(declare-fun b_next!15769 () Bool)

(assert (=> b!892489 (= b_free!15769 (not b_next!15769))))

(declare-fun tp!55277 () Bool)

(declare-fun b_and!26019 () Bool)

(assert (=> b!892489 (= tp!55277 b_and!26019)))

(declare-fun b!892486 () Bool)

(declare-fun res!604410 () Bool)

(declare-fun e!498124 () Bool)

(assert (=> b!892486 (=> (not res!604410) (not e!498124))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!892486 (= res!604410 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892487 () Bool)

(declare-fun e!498121 () Bool)

(assert (=> b!892487 (= e!498121 true)))

(declare-fun lt!403123 () Bool)

(declare-datatypes ((V!29095 0))(
  ( (V!29096 (val!9099 Int)) )
))
(declare-datatypes ((tuple2!11878 0))(
  ( (tuple2!11879 (_1!5950 (_ BitVec 64)) (_2!5950 V!29095)) )
))
(declare-datatypes ((List!17705 0))(
  ( (Nil!17702) (Cons!17701 (h!18838 tuple2!11878) (t!24996 List!17705)) )
))
(declare-datatypes ((ListLongMap!10577 0))(
  ( (ListLongMap!10578 (toList!5304 List!17705)) )
))
(declare-fun lt!403126 () ListLongMap!10577)

(declare-fun contains!4317 (ListLongMap!10577 (_ BitVec 64)) Bool)

(assert (=> b!892487 (= lt!403123 (contains!4317 lt!403126 key!785))))

(declare-fun b!892488 () Bool)

(declare-fun res!604409 () Bool)

(assert (=> b!892488 (=> res!604409 e!498121)))

(declare-datatypes ((array!52213 0))(
  ( (array!52214 (arr!25108 (Array (_ BitVec 32) (_ BitVec 64))) (size!25553 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8567 0))(
  ( (ValueCellFull!8567 (v!11574 V!29095)) (EmptyCell!8567) )
))
(declare-datatypes ((array!52215 0))(
  ( (array!52216 (arr!25109 (Array (_ BitVec 32) ValueCell!8567)) (size!25554 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4150 0))(
  ( (LongMapFixedSize!4151 (defaultEntry!5272 Int) (mask!25812 (_ BitVec 32)) (extraKeys!4966 (_ BitVec 32)) (zeroValue!5070 V!29095) (minValue!5070 V!29095) (_size!2130 (_ BitVec 32)) (_keys!9983 array!52213) (_values!5257 array!52215) (_vacant!2130 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4150)

(declare-datatypes ((List!17706 0))(
  ( (Nil!17703) (Cons!17702 (h!18839 (_ BitVec 64)) (t!24997 List!17706)) )
))
(declare-fun arrayNoDuplicates!0 (array!52213 (_ BitVec 32) List!17706) Bool)

(assert (=> b!892488 (= res!604409 (not (arrayNoDuplicates!0 (_keys!9983 thiss!1181) #b00000000000000000000000000000000 Nil!17703)))))

(declare-fun mapIsEmpty!28700 () Bool)

(declare-fun mapRes!28700 () Bool)

(assert (=> mapIsEmpty!28700 mapRes!28700))

(declare-fun tp_is_empty!18097 () Bool)

(declare-fun e!498126 () Bool)

(declare-fun e!498125 () Bool)

(declare-fun array_inv!19780 (array!52213) Bool)

(declare-fun array_inv!19781 (array!52215) Bool)

(assert (=> b!892489 (= e!498125 (and tp!55277 tp_is_empty!18097 (array_inv!19780 (_keys!9983 thiss!1181)) (array_inv!19781 (_values!5257 thiss!1181)) e!498126))))

(declare-fun b!892490 () Bool)

(declare-fun e!498127 () Bool)

(assert (=> b!892490 (= e!498127 tp_is_empty!18097)))

(declare-fun b!892491 () Bool)

(declare-fun e!498128 () Bool)

(assert (=> b!892491 (= e!498128 e!498121)))

(declare-fun res!604405 () Bool)

(assert (=> b!892491 (=> res!604405 e!498121)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892491 (= res!604405 (not (validMask!0 (mask!25812 thiss!1181))))))

(declare-datatypes ((SeekEntryResult!8785 0))(
  ( (MissingZero!8785 (index!37511 (_ BitVec 32))) (Found!8785 (index!37512 (_ BitVec 32))) (Intermediate!8785 (undefined!9597 Bool) (index!37513 (_ BitVec 32)) (x!75735 (_ BitVec 32))) (Undefined!8785) (MissingVacant!8785 (index!37514 (_ BitVec 32))) )
))
(declare-fun lt!403125 () SeekEntryResult!8785)

(assert (=> b!892491 (contains!4317 lt!403126 (select (arr!25108 (_keys!9983 thiss!1181)) (index!37512 lt!403125)))))

(declare-fun getCurrentListMap!2582 (array!52213 array!52215 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 32) Int) ListLongMap!10577)

(assert (=> b!892491 (= lt!403126 (getCurrentListMap!2582 (_keys!9983 thiss!1181) (_values!5257 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5272 thiss!1181)))))

(declare-datatypes ((Unit!30340 0))(
  ( (Unit!30341) )
))
(declare-fun lt!403124 () Unit!30340)

(declare-fun lemmaValidKeyInArrayIsInListMap!212 (array!52213 array!52215 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 32) Int) Unit!30340)

(assert (=> b!892491 (= lt!403124 (lemmaValidKeyInArrayIsInListMap!212 (_keys!9983 thiss!1181) (_values!5257 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) (index!37512 lt!403125) (defaultEntry!5272 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892491 (arrayContainsKey!0 (_keys!9983 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403122 () Unit!30340)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52213 (_ BitVec 64) (_ BitVec 32)) Unit!30340)

(assert (=> b!892491 (= lt!403122 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9983 thiss!1181) key!785 (index!37512 lt!403125)))))

(declare-fun b!892492 () Bool)

(declare-fun res!604411 () Bool)

(assert (=> b!892492 (=> res!604411 e!498121)))

(assert (=> b!892492 (= res!604411 (or (not (= (size!25554 (_values!5257 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25812 thiss!1181)))) (not (= (size!25553 (_keys!9983 thiss!1181)) (size!25554 (_values!5257 thiss!1181)))) (bvslt (mask!25812 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4966 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4966 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892493 () Bool)

(declare-fun e!498123 () Bool)

(assert (=> b!892493 (= e!498126 (and e!498123 mapRes!28700))))

(declare-fun condMapEmpty!28700 () Bool)

(declare-fun mapDefault!28700 () ValueCell!8567)

(assert (=> b!892493 (= condMapEmpty!28700 (= (arr!25109 (_values!5257 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8567)) mapDefault!28700)))))

(declare-fun b!892495 () Bool)

(declare-fun e!498129 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892495 (= e!498129 (inRange!0 (index!37512 lt!403125) (mask!25812 thiss!1181)))))

(declare-fun b!892496 () Bool)

(declare-fun res!604406 () Bool)

(assert (=> b!892496 (=> res!604406 e!498121)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52213 (_ BitVec 32)) Bool)

(assert (=> b!892496 (= res!604406 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9983 thiss!1181) (mask!25812 thiss!1181))))))

(declare-fun b!892497 () Bool)

(assert (=> b!892497 (= e!498123 tp_is_empty!18097)))

(declare-fun mapNonEmpty!28700 () Bool)

(declare-fun tp!55276 () Bool)

(assert (=> mapNonEmpty!28700 (= mapRes!28700 (and tp!55276 e!498127))))

(declare-fun mapRest!28700 () (Array (_ BitVec 32) ValueCell!8567))

(declare-fun mapKey!28700 () (_ BitVec 32))

(declare-fun mapValue!28700 () ValueCell!8567)

(assert (=> mapNonEmpty!28700 (= (arr!25109 (_values!5257 thiss!1181)) (store mapRest!28700 mapKey!28700 mapValue!28700))))

(declare-fun b!892494 () Bool)

(assert (=> b!892494 (= e!498124 (not e!498128))))

(declare-fun res!604407 () Bool)

(assert (=> b!892494 (=> res!604407 e!498128)))

(get-info :version)

(assert (=> b!892494 (= res!604407 (not ((_ is Found!8785) lt!403125)))))

(assert (=> b!892494 e!498129))

(declare-fun res!604404 () Bool)

(assert (=> b!892494 (=> res!604404 e!498129)))

(assert (=> b!892494 (= res!604404 (not ((_ is Found!8785) lt!403125)))))

(declare-fun lt!403127 () Unit!30340)

(declare-fun lemmaSeekEntryGivesInRangeIndex!38 (array!52213 array!52215 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 64)) Unit!30340)

(assert (=> b!892494 (= lt!403127 (lemmaSeekEntryGivesInRangeIndex!38 (_keys!9983 thiss!1181) (_values!5257 thiss!1181) (mask!25812 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52213 (_ BitVec 32)) SeekEntryResult!8785)

(assert (=> b!892494 (= lt!403125 (seekEntry!0 key!785 (_keys!9983 thiss!1181) (mask!25812 thiss!1181)))))

(declare-fun res!604408 () Bool)

(assert (=> start!75966 (=> (not res!604408) (not e!498124))))

(declare-fun valid!1619 (LongMapFixedSize!4150) Bool)

(assert (=> start!75966 (= res!604408 (valid!1619 thiss!1181))))

(assert (=> start!75966 e!498124))

(assert (=> start!75966 e!498125))

(assert (=> start!75966 true))

(assert (= (and start!75966 res!604408) b!892486))

(assert (= (and b!892486 res!604410) b!892494))

(assert (= (and b!892494 (not res!604404)) b!892495))

(assert (= (and b!892494 (not res!604407)) b!892491))

(assert (= (and b!892491 (not res!604405)) b!892492))

(assert (= (and b!892492 (not res!604411)) b!892496))

(assert (= (and b!892496 (not res!604406)) b!892488))

(assert (= (and b!892488 (not res!604409)) b!892487))

(assert (= (and b!892493 condMapEmpty!28700) mapIsEmpty!28700))

(assert (= (and b!892493 (not condMapEmpty!28700)) mapNonEmpty!28700))

(assert (= (and mapNonEmpty!28700 ((_ is ValueCellFull!8567) mapValue!28700)) b!892490))

(assert (= (and b!892493 ((_ is ValueCellFull!8567) mapDefault!28700)) b!892497))

(assert (= b!892489 b!892493))

(assert (= start!75966 b!892489))

(declare-fun m!831181 () Bool)

(assert (=> b!892489 m!831181))

(declare-fun m!831183 () Bool)

(assert (=> b!892489 m!831183))

(declare-fun m!831185 () Bool)

(assert (=> b!892495 m!831185))

(declare-fun m!831187 () Bool)

(assert (=> b!892487 m!831187))

(declare-fun m!831189 () Bool)

(assert (=> b!892488 m!831189))

(declare-fun m!831191 () Bool)

(assert (=> b!892491 m!831191))

(declare-fun m!831193 () Bool)

(assert (=> b!892491 m!831193))

(declare-fun m!831195 () Bool)

(assert (=> b!892491 m!831195))

(declare-fun m!831197 () Bool)

(assert (=> b!892491 m!831197))

(declare-fun m!831199 () Bool)

(assert (=> b!892491 m!831199))

(assert (=> b!892491 m!831191))

(declare-fun m!831201 () Bool)

(assert (=> b!892491 m!831201))

(declare-fun m!831203 () Bool)

(assert (=> b!892491 m!831203))

(declare-fun m!831205 () Bool)

(assert (=> b!892496 m!831205))

(declare-fun m!831207 () Bool)

(assert (=> start!75966 m!831207))

(declare-fun m!831209 () Bool)

(assert (=> b!892494 m!831209))

(declare-fun m!831211 () Bool)

(assert (=> b!892494 m!831211))

(declare-fun m!831213 () Bool)

(assert (=> mapNonEmpty!28700 m!831213))

(check-sat tp_is_empty!18097 (not mapNonEmpty!28700) (not b!892487) (not b!892496) (not b!892489) (not b!892495) (not start!75966) (not b!892491) (not b!892494) b_and!26019 (not b_next!15769) (not b!892488))
(check-sat b_and!26019 (not b_next!15769))
