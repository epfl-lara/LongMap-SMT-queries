; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16672 () Bool)

(assert start!16672)

(declare-fun b!166648 () Bool)

(declare-fun b_free!3973 () Bool)

(declare-fun b_next!3973 () Bool)

(assert (=> b!166648 (= b_free!3973 (not b_next!3973))))

(declare-fun tp!14520 () Bool)

(declare-fun b_and!10361 () Bool)

(assert (=> b!166648 (= tp!14520 b_and!10361)))

(declare-fun mapIsEmpty!6381 () Bool)

(declare-fun mapRes!6381 () Bool)

(assert (=> mapIsEmpty!6381 mapRes!6381))

(declare-fun res!79198 () Bool)

(declare-fun e!109363 () Bool)

(assert (=> start!16672 (=> (not res!79198) (not e!109363))))

(declare-datatypes ((V!4681 0))(
  ( (V!4682 (val!1932 Int)) )
))
(declare-datatypes ((ValueCell!1544 0))(
  ( (ValueCellFull!1544 (v!3791 V!4681)) (EmptyCell!1544) )
))
(declare-datatypes ((array!6627 0))(
  ( (array!6628 (arr!3148 (Array (_ BitVec 32) (_ BitVec 64))) (size!3437 (_ BitVec 32))) )
))
(declare-datatypes ((array!6629 0))(
  ( (array!6630 (arr!3149 (Array (_ BitVec 32) ValueCell!1544)) (size!3438 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1996 0))(
  ( (LongMapFixedSize!1997 (defaultEntry!3440 Int) (mask!8176 (_ BitVec 32)) (extraKeys!3181 (_ BitVec 32)) (zeroValue!3283 V!4681) (minValue!3283 V!4681) (_size!1047 (_ BitVec 32)) (_keys!5264 array!6627) (_values!3423 array!6629) (_vacant!1047 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1996)

(declare-fun valid!882 (LongMapFixedSize!1996) Bool)

(assert (=> start!16672 (= res!79198 (valid!882 thiss!1248))))

(assert (=> start!16672 e!109363))

(declare-fun e!109368 () Bool)

(assert (=> start!16672 e!109368))

(assert (=> start!16672 true))

(declare-fun b!166638 () Bool)

(declare-fun res!79197 () Bool)

(declare-fun e!109367 () Bool)

(assert (=> b!166638 (=> (not res!79197) (not e!109367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6627 (_ BitVec 32)) Bool)

(assert (=> b!166638 (= res!79197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5264 thiss!1248) (mask!8176 thiss!1248)))))

(declare-fun b!166639 () Bool)

(declare-fun e!109361 () Bool)

(assert (=> b!166639 (= e!109361 e!109367)))

(declare-fun res!79193 () Bool)

(assert (=> b!166639 (=> (not res!79193) (not e!109367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166639 (= res!79193 (validMask!0 (mask!8176 thiss!1248)))))

(declare-datatypes ((Unit!5052 0))(
  ( (Unit!5053) )
))
(declare-fun lt!83258 () Unit!5052)

(declare-fun e!109365 () Unit!5052)

(assert (=> b!166639 (= lt!83258 e!109365)))

(declare-fun c!30215 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3102 0))(
  ( (tuple2!3103 (_1!1562 (_ BitVec 64)) (_2!1562 V!4681)) )
))
(declare-datatypes ((List!2105 0))(
  ( (Nil!2102) (Cons!2101 (h!2718 tuple2!3102) (t!6898 List!2105)) )
))
(declare-datatypes ((ListLongMap!2045 0))(
  ( (ListLongMap!2046 (toList!1038 List!2105)) )
))
(declare-fun contains!1083 (ListLongMap!2045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!680 (array!6627 array!6629 (_ BitVec 32) (_ BitVec 32) V!4681 V!4681 (_ BitVec 32) Int) ListLongMap!2045)

(assert (=> b!166639 (= c!30215 (contains!1083 (getCurrentListMap!680 (_keys!5264 thiss!1248) (_values!3423 thiss!1248) (mask!8176 thiss!1248) (extraKeys!3181 thiss!1248) (zeroValue!3283 thiss!1248) (minValue!3283 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3440 thiss!1248)) key!828))))

(declare-fun b!166640 () Bool)

(declare-fun e!109360 () Bool)

(declare-fun tp_is_empty!3775 () Bool)

(assert (=> b!166640 (= e!109360 tp_is_empty!3775)))

(declare-fun b!166641 () Bool)

(assert (=> b!166641 (= e!109367 false)))

(declare-fun lt!83261 () Bool)

(declare-datatypes ((List!2106 0))(
  ( (Nil!2103) (Cons!2102 (h!2719 (_ BitVec 64)) (t!6899 List!2106)) )
))
(declare-fun arrayNoDuplicates!0 (array!6627 (_ BitVec 32) List!2106) Bool)

(assert (=> b!166641 (= lt!83261 (arrayNoDuplicates!0 (_keys!5264 thiss!1248) #b00000000000000000000000000000000 Nil!2103))))

(declare-fun b!166642 () Bool)

(declare-fun res!79195 () Bool)

(assert (=> b!166642 (=> (not res!79195) (not e!109367))))

(assert (=> b!166642 (= res!79195 (and (= (size!3438 (_values!3423 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8176 thiss!1248))) (= (size!3437 (_keys!5264 thiss!1248)) (size!3438 (_values!3423 thiss!1248))) (bvsge (mask!8176 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3181 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3181 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166643 () Bool)

(declare-fun e!109364 () Bool)

(declare-datatypes ((SeekEntryResult!473 0))(
  ( (MissingZero!473 (index!4060 (_ BitVec 32))) (Found!473 (index!4061 (_ BitVec 32))) (Intermediate!473 (undefined!1285 Bool) (index!4062 (_ BitVec 32)) (x!18476 (_ BitVec 32))) (Undefined!473) (MissingVacant!473 (index!4063 (_ BitVec 32))) )
))
(declare-fun lt!83259 () SeekEntryResult!473)

(assert (=> b!166643 (= e!109364 (= (select (arr!3148 (_keys!5264 thiss!1248)) (index!4061 lt!83259)) key!828))))

(declare-fun b!166644 () Bool)

(declare-fun e!109359 () Bool)

(declare-fun e!109366 () Bool)

(assert (=> b!166644 (= e!109359 (and e!109366 mapRes!6381))))

(declare-fun condMapEmpty!6381 () Bool)

(declare-fun mapDefault!6381 () ValueCell!1544)

(assert (=> b!166644 (= condMapEmpty!6381 (= (arr!3149 (_values!3423 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1544)) mapDefault!6381)))))

(declare-fun b!166645 () Bool)

(declare-fun lt!83262 () Unit!5052)

(assert (=> b!166645 (= e!109365 lt!83262)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!91 (array!6627 array!6629 (_ BitVec 32) (_ BitVec 32) V!4681 V!4681 (_ BitVec 64) Int) Unit!5052)

(assert (=> b!166645 (= lt!83262 (lemmaInListMapThenSeekEntryOrOpenFindsIt!91 (_keys!5264 thiss!1248) (_values!3423 thiss!1248) (mask!8176 thiss!1248) (extraKeys!3181 thiss!1248) (zeroValue!3283 thiss!1248) (minValue!3283 thiss!1248) key!828 (defaultEntry!3440 thiss!1248)))))

(declare-fun res!79196 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166645 (= res!79196 (inRange!0 (index!4061 lt!83259) (mask!8176 thiss!1248)))))

(assert (=> b!166645 (=> (not res!79196) (not e!109364))))

(assert (=> b!166645 e!109364))

(declare-fun b!166646 () Bool)

(declare-fun res!79194 () Bool)

(assert (=> b!166646 (=> (not res!79194) (not e!109363))))

(assert (=> b!166646 (= res!79194 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166647 () Bool)

(assert (=> b!166647 (= e!109366 tp_is_empty!3775)))

(declare-fun array_inv!2027 (array!6627) Bool)

(declare-fun array_inv!2028 (array!6629) Bool)

(assert (=> b!166648 (= e!109368 (and tp!14520 tp_is_empty!3775 (array_inv!2027 (_keys!5264 thiss!1248)) (array_inv!2028 (_values!3423 thiss!1248)) e!109359))))

(declare-fun mapNonEmpty!6381 () Bool)

(declare-fun tp!14519 () Bool)

(assert (=> mapNonEmpty!6381 (= mapRes!6381 (and tp!14519 e!109360))))

(declare-fun mapKey!6381 () (_ BitVec 32))

(declare-fun mapRest!6381 () (Array (_ BitVec 32) ValueCell!1544))

(declare-fun mapValue!6381 () ValueCell!1544)

(assert (=> mapNonEmpty!6381 (= (arr!3149 (_values!3423 thiss!1248)) (store mapRest!6381 mapKey!6381 mapValue!6381))))

(declare-fun b!166649 () Bool)

(declare-fun Unit!5054 () Unit!5052)

(assert (=> b!166649 (= e!109365 Unit!5054)))

(declare-fun lt!83260 () Unit!5052)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!88 (array!6627 array!6629 (_ BitVec 32) (_ BitVec 32) V!4681 V!4681 (_ BitVec 64) Int) Unit!5052)

(assert (=> b!166649 (= lt!83260 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!88 (_keys!5264 thiss!1248) (_values!3423 thiss!1248) (mask!8176 thiss!1248) (extraKeys!3181 thiss!1248) (zeroValue!3283 thiss!1248) (minValue!3283 thiss!1248) key!828 (defaultEntry!3440 thiss!1248)))))

(assert (=> b!166649 false))

(declare-fun b!166650 () Bool)

(assert (=> b!166650 (= e!109363 e!109361)))

(declare-fun res!79192 () Bool)

(assert (=> b!166650 (=> (not res!79192) (not e!109361))))

(get-info :version)

(assert (=> b!166650 (= res!79192 (and (not ((_ is Undefined!473) lt!83259)) (not ((_ is MissingVacant!473) lt!83259)) (not ((_ is MissingZero!473) lt!83259)) ((_ is Found!473) lt!83259)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6627 (_ BitVec 32)) SeekEntryResult!473)

(assert (=> b!166650 (= lt!83259 (seekEntryOrOpen!0 key!828 (_keys!5264 thiss!1248) (mask!8176 thiss!1248)))))

(assert (= (and start!16672 res!79198) b!166646))

(assert (= (and b!166646 res!79194) b!166650))

(assert (= (and b!166650 res!79192) b!166639))

(assert (= (and b!166639 c!30215) b!166645))

(assert (= (and b!166639 (not c!30215)) b!166649))

(assert (= (and b!166645 res!79196) b!166643))

(assert (= (and b!166639 res!79193) b!166642))

(assert (= (and b!166642 res!79195) b!166638))

(assert (= (and b!166638 res!79197) b!166641))

(assert (= (and b!166644 condMapEmpty!6381) mapIsEmpty!6381))

(assert (= (and b!166644 (not condMapEmpty!6381)) mapNonEmpty!6381))

(assert (= (and mapNonEmpty!6381 ((_ is ValueCellFull!1544) mapValue!6381)) b!166640))

(assert (= (and b!166644 ((_ is ValueCellFull!1544) mapDefault!6381)) b!166647))

(assert (= b!166648 b!166644))

(assert (= start!16672 b!166648))

(declare-fun m!195511 () Bool)

(assert (=> b!166650 m!195511))

(declare-fun m!195513 () Bool)

(assert (=> start!16672 m!195513))

(declare-fun m!195515 () Bool)

(assert (=> mapNonEmpty!6381 m!195515))

(declare-fun m!195517 () Bool)

(assert (=> b!166649 m!195517))

(declare-fun m!195519 () Bool)

(assert (=> b!166639 m!195519))

(declare-fun m!195521 () Bool)

(assert (=> b!166639 m!195521))

(assert (=> b!166639 m!195521))

(declare-fun m!195523 () Bool)

(assert (=> b!166639 m!195523))

(declare-fun m!195525 () Bool)

(assert (=> b!166638 m!195525))

(declare-fun m!195527 () Bool)

(assert (=> b!166641 m!195527))

(declare-fun m!195529 () Bool)

(assert (=> b!166648 m!195529))

(declare-fun m!195531 () Bool)

(assert (=> b!166648 m!195531))

(declare-fun m!195533 () Bool)

(assert (=> b!166643 m!195533))

(declare-fun m!195535 () Bool)

(assert (=> b!166645 m!195535))

(declare-fun m!195537 () Bool)

(assert (=> b!166645 m!195537))

(check-sat (not b!166638) (not start!16672) (not b!166645) b_and!10361 (not b!166639) (not b!166650) (not b!166648) (not mapNonEmpty!6381) (not b_next!3973) (not b!166649) (not b!166641) tp_is_empty!3775)
(check-sat b_and!10361 (not b_next!3973))
