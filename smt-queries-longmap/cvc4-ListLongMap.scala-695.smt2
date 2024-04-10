; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16678 () Bool)

(assert start!16678)

(declare-fun b!166985 () Bool)

(declare-fun b_free!3983 () Bool)

(declare-fun b_next!3983 () Bool)

(assert (=> b!166985 (= b_free!3983 (not b_next!3983))))

(declare-fun tp!14550 () Bool)

(declare-fun b_and!10397 () Bool)

(assert (=> b!166985 (= tp!14550 b_and!10397)))

(declare-fun b!166980 () Bool)

(declare-fun e!109617 () Bool)

(declare-fun e!109612 () Bool)

(assert (=> b!166980 (= e!109617 e!109612)))

(declare-fun res!79394 () Bool)

(assert (=> b!166980 (=> (not res!79394) (not e!109612))))

(declare-datatypes ((V!4693 0))(
  ( (V!4694 (val!1937 Int)) )
))
(declare-datatypes ((ValueCell!1549 0))(
  ( (ValueCellFull!1549 (v!3802 V!4693)) (EmptyCell!1549) )
))
(declare-datatypes ((array!6667 0))(
  ( (array!6668 (arr!3169 (Array (_ BitVec 32) (_ BitVec 64))) (size!3457 (_ BitVec 32))) )
))
(declare-datatypes ((array!6669 0))(
  ( (array!6670 (arr!3170 (Array (_ BitVec 32) ValueCell!1549)) (size!3458 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2006 0))(
  ( (LongMapFixedSize!2007 (defaultEntry!3445 Int) (mask!8184 (_ BitVec 32)) (extraKeys!3186 (_ BitVec 32)) (zeroValue!3288 V!4693) (minValue!3288 V!4693) (_size!1052 (_ BitVec 32)) (_keys!5270 array!6667) (_values!3428 array!6669) (_vacant!1052 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2006)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166980 (= res!79394 (validMask!0 (mask!8184 thiss!1248)))))

(declare-datatypes ((Unit!5096 0))(
  ( (Unit!5097) )
))
(declare-fun lt!83518 () Unit!5096)

(declare-fun e!109611 () Unit!5096)

(assert (=> b!166980 (= lt!83518 e!109611)))

(declare-fun c!30256 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3124 0))(
  ( (tuple2!3125 (_1!1573 (_ BitVec 64)) (_2!1573 V!4693)) )
))
(declare-datatypes ((List!2111 0))(
  ( (Nil!2108) (Cons!2107 (h!2724 tuple2!3124) (t!6913 List!2111)) )
))
(declare-datatypes ((ListLongMap!2079 0))(
  ( (ListLongMap!2080 (toList!1055 List!2111)) )
))
(declare-fun contains!1097 (ListLongMap!2079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!713 (array!6667 array!6669 (_ BitVec 32) (_ BitVec 32) V!4693 V!4693 (_ BitVec 32) Int) ListLongMap!2079)

(assert (=> b!166980 (= c!30256 (contains!1097 (getCurrentListMap!713 (_keys!5270 thiss!1248) (_values!3428 thiss!1248) (mask!8184 thiss!1248) (extraKeys!3186 thiss!1248) (zeroValue!3288 thiss!1248) (minValue!3288 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3445 thiss!1248)) key!828))))

(declare-fun b!166981 () Bool)

(declare-fun e!109610 () Bool)

(declare-fun tp_is_empty!3785 () Bool)

(assert (=> b!166981 (= e!109610 tp_is_empty!3785)))

(declare-fun b!166982 () Bool)

(declare-fun lt!83515 () Unit!5096)

(assert (=> b!166982 (= e!109611 lt!83515)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!96 (array!6667 array!6669 (_ BitVec 32) (_ BitVec 32) V!4693 V!4693 (_ BitVec 64) Int) Unit!5096)

(assert (=> b!166982 (= lt!83515 (lemmaInListMapThenSeekEntryOrOpenFindsIt!96 (_keys!5270 thiss!1248) (_values!3428 thiss!1248) (mask!8184 thiss!1248) (extraKeys!3186 thiss!1248) (zeroValue!3288 thiss!1248) (minValue!3288 thiss!1248) key!828 (defaultEntry!3445 thiss!1248)))))

(declare-fun res!79397 () Bool)

(declare-datatypes ((SeekEntryResult!468 0))(
  ( (MissingZero!468 (index!4040 (_ BitVec 32))) (Found!468 (index!4041 (_ BitVec 32))) (Intermediate!468 (undefined!1280 Bool) (index!4042 (_ BitVec 32)) (x!18480 (_ BitVec 32))) (Undefined!468) (MissingVacant!468 (index!4043 (_ BitVec 32))) )
))
(declare-fun lt!83514 () SeekEntryResult!468)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!166982 (= res!79397 (inRange!0 (index!4041 lt!83514) (mask!8184 thiss!1248)))))

(declare-fun e!109616 () Bool)

(assert (=> b!166982 (=> (not res!79397) (not e!109616))))

(assert (=> b!166982 e!109616))

(declare-fun mapNonEmpty!6396 () Bool)

(declare-fun mapRes!6396 () Bool)

(declare-fun tp!14549 () Bool)

(assert (=> mapNonEmpty!6396 (= mapRes!6396 (and tp!14549 e!109610))))

(declare-fun mapValue!6396 () ValueCell!1549)

(declare-fun mapRest!6396 () (Array (_ BitVec 32) ValueCell!1549))

(declare-fun mapKey!6396 () (_ BitVec 32))

(assert (=> mapNonEmpty!6396 (= (arr!3170 (_values!3428 thiss!1248)) (store mapRest!6396 mapKey!6396 mapValue!6396))))

(declare-fun b!166983 () Bool)

(declare-fun res!79398 () Bool)

(declare-fun e!109619 () Bool)

(assert (=> b!166983 (=> (not res!79398) (not e!109619))))

(assert (=> b!166983 (= res!79398 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166984 () Bool)

(assert (=> b!166984 (= e!109612 false)))

(declare-fun lt!83517 () Bool)

(declare-datatypes ((List!2112 0))(
  ( (Nil!2109) (Cons!2108 (h!2725 (_ BitVec 64)) (t!6914 List!2112)) )
))
(declare-fun arrayNoDuplicates!0 (array!6667 (_ BitVec 32) List!2112) Bool)

(assert (=> b!166984 (= lt!83517 (arrayNoDuplicates!0 (_keys!5270 thiss!1248) #b00000000000000000000000000000000 Nil!2109))))

(declare-fun e!109614 () Bool)

(declare-fun e!109613 () Bool)

(declare-fun array_inv!2035 (array!6667) Bool)

(declare-fun array_inv!2036 (array!6669) Bool)

(assert (=> b!166985 (= e!109613 (and tp!14550 tp_is_empty!3785 (array_inv!2035 (_keys!5270 thiss!1248)) (array_inv!2036 (_values!3428 thiss!1248)) e!109614))))

(declare-fun b!166986 () Bool)

(declare-fun e!109618 () Bool)

(assert (=> b!166986 (= e!109614 (and e!109618 mapRes!6396))))

(declare-fun condMapEmpty!6396 () Bool)

(declare-fun mapDefault!6396 () ValueCell!1549)

