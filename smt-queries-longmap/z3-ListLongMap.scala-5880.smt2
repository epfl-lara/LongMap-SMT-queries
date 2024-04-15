; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75792 () Bool)

(assert start!75792)

(declare-fun b!891560 () Bool)

(declare-fun b_free!15781 () Bool)

(declare-fun b_next!15781 () Bool)

(assert (=> b!891560 (= b_free!15781 (not b_next!15781))))

(declare-fun tp!55312 () Bool)

(declare-fun b_and!25995 () Bool)

(assert (=> b!891560 (= tp!55312 b_and!25995)))

(declare-datatypes ((array!52181 0))(
  ( (array!52182 (arr!25097 (Array (_ BitVec 32) (_ BitVec 64))) (size!25543 (_ BitVec 32))) )
))
(declare-datatypes ((V!29111 0))(
  ( (V!29112 (val!9105 Int)) )
))
(declare-datatypes ((ValueCell!8573 0))(
  ( (ValueCellFull!8573 (v!11577 V!29111)) (EmptyCell!8573) )
))
(declare-datatypes ((array!52183 0))(
  ( (array!52184 (arr!25098 (Array (_ BitVec 32) ValueCell!8573)) (size!25544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4162 0))(
  ( (LongMapFixedSize!4163 (defaultEntry!5278 Int) (mask!25772 (_ BitVec 32)) (extraKeys!4972 (_ BitVec 32)) (zeroValue!5076 V!29111) (minValue!5076 V!29111) (_size!2136 (_ BitVec 32)) (_keys!9956 array!52181) (_values!5263 array!52183) (_vacant!2136 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4162)

(declare-fun e!497555 () Bool)

(declare-fun tp_is_empty!18109 () Bool)

(declare-fun e!497557 () Bool)

(declare-fun array_inv!19776 (array!52181) Bool)

(declare-fun array_inv!19777 (array!52183) Bool)

(assert (=> b!891560 (= e!497557 (and tp!55312 tp_is_empty!18109 (array_inv!19776 (_keys!9956 thiss!1181)) (array_inv!19777 (_values!5263 thiss!1181)) e!497555))))

(declare-fun b!891561 () Bool)

(declare-fun e!497559 () Bool)

(assert (=> b!891561 (= e!497559 tp_is_empty!18109)))

(declare-fun b!891562 () Bool)

(declare-fun e!497561 () Bool)

(assert (=> b!891562 (= e!497561 tp_is_empty!18109)))

(declare-fun b!891563 () Bool)

(declare-fun e!497560 () Bool)

(declare-fun e!497554 () Bool)

(assert (=> b!891563 (= e!497560 (not e!497554))))

(declare-fun res!604096 () Bool)

(assert (=> b!891563 (=> res!604096 e!497554)))

(declare-datatypes ((SeekEntryResult!8837 0))(
  ( (MissingZero!8837 (index!37719 (_ BitVec 32))) (Found!8837 (index!37720 (_ BitVec 32))) (Intermediate!8837 (undefined!9649 Bool) (index!37721 (_ BitVec 32)) (x!75784 (_ BitVec 32))) (Undefined!8837) (MissingVacant!8837 (index!37722 (_ BitVec 32))) )
))
(declare-fun lt!402635 () SeekEntryResult!8837)

(get-info :version)

(assert (=> b!891563 (= res!604096 (not ((_ is Found!8837) lt!402635)))))

(declare-fun e!497556 () Bool)

(assert (=> b!891563 e!497556))

(declare-fun res!604094 () Bool)

(assert (=> b!891563 (=> res!604094 e!497556)))

(assert (=> b!891563 (= res!604094 (not ((_ is Found!8837) lt!402635)))))

(declare-datatypes ((Unit!30308 0))(
  ( (Unit!30309) )
))
(declare-fun lt!402637 () Unit!30308)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!42 (array!52181 array!52183 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 64)) Unit!30308)

(assert (=> b!891563 (= lt!402637 (lemmaSeekEntryGivesInRangeIndex!42 (_keys!9956 thiss!1181) (_values!5263 thiss!1181) (mask!25772 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52181 (_ BitVec 32)) SeekEntryResult!8837)

(assert (=> b!891563 (= lt!402635 (seekEntry!0 key!785 (_keys!9956 thiss!1181) (mask!25772 thiss!1181)))))

(declare-fun b!891564 () Bool)

(declare-fun res!604098 () Bool)

(declare-fun e!497553 () Bool)

(assert (=> b!891564 (=> res!604098 e!497553)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52181 (_ BitVec 32)) Bool)

(assert (=> b!891564 (= res!604098 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9956 thiss!1181) (mask!25772 thiss!1181))))))

(declare-fun mapNonEmpty!28718 () Bool)

(declare-fun mapRes!28718 () Bool)

(declare-fun tp!55313 () Bool)

(assert (=> mapNonEmpty!28718 (= mapRes!28718 (and tp!55313 e!497561))))

(declare-fun mapValue!28718 () ValueCell!8573)

(declare-fun mapRest!28718 () (Array (_ BitVec 32) ValueCell!8573))

(declare-fun mapKey!28718 () (_ BitVec 32))

(assert (=> mapNonEmpty!28718 (= (arr!25098 (_values!5263 thiss!1181)) (store mapRest!28718 mapKey!28718 mapValue!28718))))

(declare-fun b!891565 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891565 (= e!497556 (inRange!0 (index!37720 lt!402635) (mask!25772 thiss!1181)))))

(declare-fun b!891566 () Bool)

(declare-fun res!604095 () Bool)

(assert (=> b!891566 (=> res!604095 e!497553)))

(declare-datatypes ((List!17765 0))(
  ( (Nil!17762) (Cons!17761 (h!18892 (_ BitVec 64)) (t!25055 List!17765)) )
))
(declare-fun arrayNoDuplicates!0 (array!52181 (_ BitVec 32) List!17765) Bool)

(assert (=> b!891566 (= res!604095 (not (arrayNoDuplicates!0 (_keys!9956 thiss!1181) #b00000000000000000000000000000000 Nil!17762)))))

(declare-fun res!604101 () Bool)

(assert (=> start!75792 (=> (not res!604101) (not e!497560))))

(declare-fun valid!1618 (LongMapFixedSize!4162) Bool)

(assert (=> start!75792 (= res!604101 (valid!1618 thiss!1181))))

(assert (=> start!75792 e!497560))

(assert (=> start!75792 e!497557))

(assert (=> start!75792 true))

(declare-fun b!891567 () Bool)

(declare-fun res!604099 () Bool)

(assert (=> b!891567 (=> (not res!604099) (not e!497560))))

(assert (=> b!891567 (= res!604099 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891568 () Bool)

(declare-fun res!604097 () Bool)

(assert (=> b!891568 (=> res!604097 e!497553)))

(assert (=> b!891568 (= res!604097 (or (not (= (size!25544 (_values!5263 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25772 thiss!1181)))) (not (= (size!25543 (_keys!9956 thiss!1181)) (size!25544 (_values!5263 thiss!1181)))) (bvslt (mask!25772 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4972 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4972 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28718 () Bool)

(assert (=> mapIsEmpty!28718 mapRes!28718))

(declare-fun b!891569 () Bool)

(assert (=> b!891569 (= e!497553 true)))

(declare-fun lt!402633 () Bool)

(declare-datatypes ((tuple2!11984 0))(
  ( (tuple2!11985 (_1!6003 (_ BitVec 64)) (_2!6003 V!29111)) )
))
(declare-datatypes ((List!17766 0))(
  ( (Nil!17763) (Cons!17762 (h!18893 tuple2!11984) (t!25056 List!17766)) )
))
(declare-datatypes ((ListLongMap!10671 0))(
  ( (ListLongMap!10672 (toList!5351 List!17766)) )
))
(declare-fun lt!402638 () ListLongMap!10671)

(declare-fun contains!4321 (ListLongMap!10671 (_ BitVec 64)) Bool)

(assert (=> b!891569 (= lt!402633 (contains!4321 lt!402638 key!785))))

(declare-fun b!891570 () Bool)

(assert (=> b!891570 (= e!497554 e!497553)))

(declare-fun res!604100 () Bool)

(assert (=> b!891570 (=> res!604100 e!497553)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891570 (= res!604100 (not (validMask!0 (mask!25772 thiss!1181))))))

(assert (=> b!891570 (contains!4321 lt!402638 (select (arr!25097 (_keys!9956 thiss!1181)) (index!37720 lt!402635)))))

(declare-fun getCurrentListMap!2579 (array!52181 array!52183 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 32) Int) ListLongMap!10671)

(assert (=> b!891570 (= lt!402638 (getCurrentListMap!2579 (_keys!9956 thiss!1181) (_values!5263 thiss!1181) (mask!25772 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5278 thiss!1181)))))

(declare-fun lt!402634 () Unit!30308)

(declare-fun lemmaValidKeyInArrayIsInListMap!215 (array!52181 array!52183 (_ BitVec 32) (_ BitVec 32) V!29111 V!29111 (_ BitVec 32) Int) Unit!30308)

(assert (=> b!891570 (= lt!402634 (lemmaValidKeyInArrayIsInListMap!215 (_keys!9956 thiss!1181) (_values!5263 thiss!1181) (mask!25772 thiss!1181) (extraKeys!4972 thiss!1181) (zeroValue!5076 thiss!1181) (minValue!5076 thiss!1181) (index!37720 lt!402635) (defaultEntry!5278 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52181 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891570 (arrayContainsKey!0 (_keys!9956 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402636 () Unit!30308)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52181 (_ BitVec 64) (_ BitVec 32)) Unit!30308)

(assert (=> b!891570 (= lt!402636 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9956 thiss!1181) key!785 (index!37720 lt!402635)))))

(declare-fun b!891571 () Bool)

(assert (=> b!891571 (= e!497555 (and e!497559 mapRes!28718))))

(declare-fun condMapEmpty!28718 () Bool)

(declare-fun mapDefault!28718 () ValueCell!8573)

(assert (=> b!891571 (= condMapEmpty!28718 (= (arr!25098 (_values!5263 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8573)) mapDefault!28718)))))

(assert (= (and start!75792 res!604101) b!891567))

(assert (= (and b!891567 res!604099) b!891563))

(assert (= (and b!891563 (not res!604094)) b!891565))

(assert (= (and b!891563 (not res!604096)) b!891570))

(assert (= (and b!891570 (not res!604100)) b!891568))

(assert (= (and b!891568 (not res!604097)) b!891564))

(assert (= (and b!891564 (not res!604098)) b!891566))

(assert (= (and b!891566 (not res!604095)) b!891569))

(assert (= (and b!891571 condMapEmpty!28718) mapIsEmpty!28718))

(assert (= (and b!891571 (not condMapEmpty!28718)) mapNonEmpty!28718))

(assert (= (and mapNonEmpty!28718 ((_ is ValueCellFull!8573) mapValue!28718)) b!891562))

(assert (= (and b!891571 ((_ is ValueCellFull!8573) mapDefault!28718)) b!891561))

(assert (= b!891560 b!891571))

(assert (= start!75792 b!891560))

(declare-fun m!829333 () Bool)

(assert (=> b!891563 m!829333))

(declare-fun m!829335 () Bool)

(assert (=> b!891563 m!829335))

(declare-fun m!829337 () Bool)

(assert (=> b!891570 m!829337))

(declare-fun m!829339 () Bool)

(assert (=> b!891570 m!829339))

(declare-fun m!829341 () Bool)

(assert (=> b!891570 m!829341))

(declare-fun m!829343 () Bool)

(assert (=> b!891570 m!829343))

(assert (=> b!891570 m!829339))

(declare-fun m!829345 () Bool)

(assert (=> b!891570 m!829345))

(declare-fun m!829347 () Bool)

(assert (=> b!891570 m!829347))

(declare-fun m!829349 () Bool)

(assert (=> b!891570 m!829349))

(declare-fun m!829351 () Bool)

(assert (=> b!891564 m!829351))

(declare-fun m!829353 () Bool)

(assert (=> b!891565 m!829353))

(declare-fun m!829355 () Bool)

(assert (=> mapNonEmpty!28718 m!829355))

(declare-fun m!829357 () Bool)

(assert (=> start!75792 m!829357))

(declare-fun m!829359 () Bool)

(assert (=> b!891566 m!829359))

(declare-fun m!829361 () Bool)

(assert (=> b!891569 m!829361))

(declare-fun m!829363 () Bool)

(assert (=> b!891560 m!829363))

(declare-fun m!829365 () Bool)

(assert (=> b!891560 m!829365))

(check-sat (not b!891560) (not start!75792) (not b!891570) (not b!891564) (not b!891566) (not b!891569) b_and!25995 (not mapNonEmpty!28718) (not b!891563) tp_is_empty!18109 (not b_next!15781) (not b!891565))
(check-sat b_and!25995 (not b_next!15781))
