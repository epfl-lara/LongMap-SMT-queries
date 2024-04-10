; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13080 () Bool)

(assert start!13080)

(declare-fun b!114438 () Bool)

(declare-fun b_free!2637 () Bool)

(declare-fun b_next!2637 () Bool)

(assert (=> b!114438 (= b_free!2637 (not b_next!2637))))

(declare-fun tp!10271 () Bool)

(declare-fun b_and!7067 () Bool)

(assert (=> b!114438 (= tp!10271 b_and!7067)))

(declare-fun b!114441 () Bool)

(declare-fun b_free!2639 () Bool)

(declare-fun b_next!2639 () Bool)

(assert (=> b!114441 (= b_free!2639 (not b_next!2639))))

(declare-fun tp!10270 () Bool)

(declare-fun b_and!7069 () Bool)

(assert (=> b!114441 (= tp!10270 b_and!7069)))

(declare-fun b!114427 () Bool)

(declare-fun e!74488 () Bool)

(declare-fun tp_is_empty!2735 () Bool)

(assert (=> b!114427 (= e!74488 tp_is_empty!2735)))

(declare-fun b!114428 () Bool)

(declare-fun e!74478 () Bool)

(assert (=> b!114428 (= e!74478 tp_is_empty!2735)))

(declare-fun b!114429 () Bool)

(declare-datatypes ((Unit!3576 0))(
  ( (Unit!3577) )
))
(declare-fun e!74495 () Unit!3576)

(declare-fun Unit!3578 () Unit!3576)

(assert (=> b!114429 (= e!74495 Unit!3578)))

(declare-fun lt!59597 () Unit!3576)

(declare-datatypes ((V!3293 0))(
  ( (V!3294 (val!1412 Int)) )
))
(declare-datatypes ((array!4471 0))(
  ( (array!4472 (arr!2119 (Array (_ BitVec 32) (_ BitVec 64))) (size!2379 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1024 0))(
  ( (ValueCellFull!1024 (v!2991 V!3293)) (EmptyCell!1024) )
))
(declare-datatypes ((array!4473 0))(
  ( (array!4474 (arr!2120 (Array (_ BitVec 32) ValueCell!1024)) (size!2380 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!956 0))(
  ( (LongMapFixedSize!957 (defaultEntry!2684 Int) (mask!6880 (_ BitVec 32)) (extraKeys!2473 (_ BitVec 32)) (zeroValue!2551 V!3293) (minValue!2551 V!3293) (_size!527 (_ BitVec 32)) (_keys!4406 array!4471) (_values!2667 array!4473) (_vacant!527 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!756 0))(
  ( (Cell!757 (v!2992 LongMapFixedSize!956)) )
))
(declare-datatypes ((LongMap!756 0))(
  ( (LongMap!757 (underlying!389 Cell!756)) )
))
(declare-fun thiss!992 () LongMap!756)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!121 (array!4471 array!4473 (_ BitVec 32) (_ BitVec 32) V!3293 V!3293 (_ BitVec 64) (_ BitVec 32) Int) Unit!3576)

(assert (=> b!114429 (= lt!59597 (lemmaListMapContainsThenArrayContainsFrom!121 (_keys!4406 (v!2992 (underlying!389 thiss!992))) (_values!2667 (v!2992 (underlying!389 thiss!992))) (mask!6880 (v!2992 (underlying!389 thiss!992))) (extraKeys!2473 (v!2992 (underlying!389 thiss!992))) (zeroValue!2551 (v!2992 (underlying!389 thiss!992))) (minValue!2551 (v!2992 (underlying!389 thiss!992))) (select (arr!2119 (_keys!4406 (v!2992 (underlying!389 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2684 (v!2992 (underlying!389 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!114429 (arrayContainsKey!0 (_keys!4406 (v!2992 (underlying!389 thiss!992))) (select (arr!2119 (_keys!4406 (v!2992 (underlying!389 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!59591 () Unit!3576)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4471 (_ BitVec 32) (_ BitVec 32)) Unit!3576)

(assert (=> b!114429 (= lt!59591 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4406 (v!2992 (underlying!389 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1655 0))(
  ( (Nil!1652) (Cons!1651 (h!2251 (_ BitVec 64)) (t!5885 List!1655)) )
))
(declare-fun arrayNoDuplicates!0 (array!4471 (_ BitVec 32) List!1655) Bool)

(assert (=> b!114429 (arrayNoDuplicates!0 (_keys!4406 (v!2992 (underlying!389 thiss!992))) from!355 Nil!1652)))

(declare-fun lt!59603 () Unit!3576)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4471 (_ BitVec 32) (_ BitVec 64) List!1655) Unit!3576)

(assert (=> b!114429 (= lt!59603 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4406 (v!2992 (underlying!389 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!2119 (_keys!4406 (v!2992 (underlying!389 thiss!992)))) from!355) (Cons!1651 (select (arr!2119 (_keys!4406 (v!2992 (underlying!389 thiss!992)))) from!355) Nil!1652)))))

(assert (=> b!114429 false))

(declare-fun b!114430 () Bool)

(declare-fun e!74481 () Bool)

(declare-fun e!74489 () Bool)

(declare-fun mapRes!4134 () Bool)

(assert (=> b!114430 (= e!74481 (and e!74489 mapRes!4134))))

(declare-fun condMapEmpty!4134 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!956)

(declare-fun mapDefault!4134 () ValueCell!1024)

