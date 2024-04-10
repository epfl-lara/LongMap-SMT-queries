; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16684 () Bool)

(assert start!16684)

(declare-fun b!167101 () Bool)

(declare-fun b_free!3989 () Bool)

(declare-fun b_next!3989 () Bool)

(assert (=> b!167101 (= b_free!3989 (not b_next!3989))))

(declare-fun tp!14568 () Bool)

(declare-fun b_and!10403 () Bool)

(assert (=> b!167101 (= tp!14568 b_and!10403)))

(declare-fun b!167097 () Bool)

(declare-fun res!79456 () Bool)

(declare-fun e!109702 () Bool)

(assert (=> b!167097 (=> (not res!79456) (not e!109702))))

(declare-datatypes ((V!4701 0))(
  ( (V!4702 (val!1940 Int)) )
))
(declare-datatypes ((ValueCell!1552 0))(
  ( (ValueCellFull!1552 (v!3805 V!4701)) (EmptyCell!1552) )
))
(declare-datatypes ((array!6679 0))(
  ( (array!6680 (arr!3175 (Array (_ BitVec 32) (_ BitVec 64))) (size!3463 (_ BitVec 32))) )
))
(declare-datatypes ((array!6681 0))(
  ( (array!6682 (arr!3176 (Array (_ BitVec 32) ValueCell!1552)) (size!3464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2012 0))(
  ( (LongMapFixedSize!2013 (defaultEntry!3448 Int) (mask!8189 (_ BitVec 32)) (extraKeys!3189 (_ BitVec 32)) (zeroValue!3291 V!4701) (minValue!3291 V!4701) (_size!1055 (_ BitVec 32)) (_keys!5273 array!6679) (_values!3431 array!6681) (_vacant!1055 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2012)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6679 (_ BitVec 32)) Bool)

(assert (=> b!167097 (= res!79456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5273 thiss!1248) (mask!8189 thiss!1248)))))

(declare-fun b!167098 () Bool)

(declare-fun e!109700 () Bool)

(declare-fun e!109704 () Bool)

(assert (=> b!167098 (= e!109700 e!109704)))

(declare-fun res!79457 () Bool)

(assert (=> b!167098 (=> (not res!79457) (not e!109704))))

(declare-datatypes ((SeekEntryResult!471 0))(
  ( (MissingZero!471 (index!4052 (_ BitVec 32))) (Found!471 (index!4053 (_ BitVec 32))) (Intermediate!471 (undefined!1283 Bool) (index!4054 (_ BitVec 32)) (x!18491 (_ BitVec 32))) (Undefined!471) (MissingVacant!471 (index!4055 (_ BitVec 32))) )
))
(declare-fun lt!83559 () SeekEntryResult!471)

(assert (=> b!167098 (= res!79457 (and (not (is-Undefined!471 lt!83559)) (not (is-MissingVacant!471 lt!83559)) (not (is-MissingZero!471 lt!83559)) (is-Found!471 lt!83559)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6679 (_ BitVec 32)) SeekEntryResult!471)

(assert (=> b!167098 (= lt!83559 (seekEntryOrOpen!0 key!828 (_keys!5273 thiss!1248) (mask!8189 thiss!1248)))))

(declare-fun res!79455 () Bool)

(assert (=> start!16684 (=> (not res!79455) (not e!109700))))

(declare-fun valid!881 (LongMapFixedSize!2012) Bool)

(assert (=> start!16684 (= res!79455 (valid!881 thiss!1248))))

(assert (=> start!16684 e!109700))

(declare-fun e!109708 () Bool)

(assert (=> start!16684 e!109708))

(assert (=> start!16684 true))

(declare-fun b!167099 () Bool)

(declare-datatypes ((Unit!5104 0))(
  ( (Unit!5105) )
))
(declare-fun e!109706 () Unit!5104)

(declare-fun lt!83562 () Unit!5104)

(assert (=> b!167099 (= e!109706 lt!83562)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!99 (array!6679 array!6681 (_ BitVec 32) (_ BitVec 32) V!4701 V!4701 (_ BitVec 64) Int) Unit!5104)

(assert (=> b!167099 (= lt!83562 (lemmaInListMapThenSeekEntryOrOpenFindsIt!99 (_keys!5273 thiss!1248) (_values!3431 thiss!1248) (mask!8189 thiss!1248) (extraKeys!3189 thiss!1248) (zeroValue!3291 thiss!1248) (minValue!3291 thiss!1248) key!828 (defaultEntry!3448 thiss!1248)))))

(declare-fun res!79459 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!167099 (= res!79459 (inRange!0 (index!4053 lt!83559) (mask!8189 thiss!1248)))))

(declare-fun e!109703 () Bool)

(assert (=> b!167099 (=> (not res!79459) (not e!109703))))

(assert (=> b!167099 e!109703))

(declare-fun mapIsEmpty!6405 () Bool)

(declare-fun mapRes!6405 () Bool)

(assert (=> mapIsEmpty!6405 mapRes!6405))

(declare-fun b!167100 () Bool)

(assert (=> b!167100 (= e!109704 e!109702)))

(declare-fun res!79458 () Bool)

(assert (=> b!167100 (=> (not res!79458) (not e!109702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!167100 (= res!79458 (validMask!0 (mask!8189 thiss!1248)))))

(declare-fun lt!83561 () Unit!5104)

(assert (=> b!167100 (= lt!83561 e!109706)))

(declare-fun c!30265 () Bool)

(declare-datatypes ((tuple2!3130 0))(
  ( (tuple2!3131 (_1!1576 (_ BitVec 64)) (_2!1576 V!4701)) )
))
(declare-datatypes ((List!2116 0))(
  ( (Nil!2113) (Cons!2112 (h!2729 tuple2!3130) (t!6918 List!2116)) )
))
(declare-datatypes ((ListLongMap!2085 0))(
  ( (ListLongMap!2086 (toList!1058 List!2116)) )
))
(declare-fun contains!1100 (ListLongMap!2085 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!716 (array!6679 array!6681 (_ BitVec 32) (_ BitVec 32) V!4701 V!4701 (_ BitVec 32) Int) ListLongMap!2085)

(assert (=> b!167100 (= c!30265 (contains!1100 (getCurrentListMap!716 (_keys!5273 thiss!1248) (_values!3431 thiss!1248) (mask!8189 thiss!1248) (extraKeys!3189 thiss!1248) (zeroValue!3291 thiss!1248) (minValue!3291 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3448 thiss!1248)) key!828))))

(declare-fun e!109707 () Bool)

(declare-fun tp_is_empty!3791 () Bool)

(declare-fun array_inv!2041 (array!6679) Bool)

(declare-fun array_inv!2042 (array!6681) Bool)

(assert (=> b!167101 (= e!109708 (and tp!14568 tp_is_empty!3791 (array_inv!2041 (_keys!5273 thiss!1248)) (array_inv!2042 (_values!3431 thiss!1248)) e!109707))))

(declare-fun b!167102 () Bool)

(declare-fun e!109709 () Bool)

(assert (=> b!167102 (= e!109709 tp_is_empty!3791)))

(declare-fun b!167103 () Bool)

(assert (=> b!167103 (= e!109702 false)))

(declare-fun lt!83560 () Bool)

(declare-datatypes ((List!2117 0))(
  ( (Nil!2114) (Cons!2113 (h!2730 (_ BitVec 64)) (t!6919 List!2117)) )
))
(declare-fun arrayNoDuplicates!0 (array!6679 (_ BitVec 32) List!2117) Bool)

(assert (=> b!167103 (= lt!83560 (arrayNoDuplicates!0 (_keys!5273 thiss!1248) #b00000000000000000000000000000000 Nil!2114))))

(declare-fun b!167104 () Bool)

(declare-fun e!109701 () Bool)

(assert (=> b!167104 (= e!109701 tp_is_empty!3791)))

(declare-fun b!167105 () Bool)

(assert (=> b!167105 (= e!109707 (and e!109709 mapRes!6405))))

(declare-fun condMapEmpty!6405 () Bool)

(declare-fun mapDefault!6405 () ValueCell!1552)

