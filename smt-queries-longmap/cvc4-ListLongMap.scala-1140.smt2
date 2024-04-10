; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23574 () Bool)

(assert start!23574)

(declare-fun b!247757 () Bool)

(declare-fun b_free!6593 () Bool)

(declare-fun b_next!6593 () Bool)

(assert (=> b!247757 (= b_free!6593 (not b_next!6593))))

(declare-fun tp!23027 () Bool)

(declare-fun b_and!13595 () Bool)

(assert (=> b!247757 (= tp!23027 b_and!13595)))

(declare-fun b!247740 () Bool)

(declare-datatypes ((Unit!7666 0))(
  ( (Unit!7667) )
))
(declare-fun e!160715 () Unit!7666)

(declare-fun Unit!7668 () Unit!7666)

(assert (=> b!247740 (= e!160715 Unit!7668)))

(declare-fun lt!124063 () Unit!7666)

(declare-datatypes ((V!8253 0))(
  ( (V!8254 (val!3272 Int)) )
))
(declare-datatypes ((ValueCell!2884 0))(
  ( (ValueCellFull!2884 (v!5330 V!8253)) (EmptyCell!2884) )
))
(declare-datatypes ((array!12217 0))(
  ( (array!12218 (arr!5796 (Array (_ BitVec 32) ValueCell!2884)) (size!6139 (_ BitVec 32))) )
))
(declare-datatypes ((array!12219 0))(
  ( (array!12220 (arr!5797 (Array (_ BitVec 32) (_ BitVec 64))) (size!6140 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3668 0))(
  ( (LongMapFixedSize!3669 (defaultEntry!4583 Int) (mask!10723 (_ BitVec 32)) (extraKeys!4320 (_ BitVec 32)) (zeroValue!4424 V!8253) (minValue!4424 V!8253) (_size!1883 (_ BitVec 32)) (_keys!6705 array!12219) (_values!4566 array!12217) (_vacant!1883 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3668)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaArrayContainsKeyThenInListMap!188 (array!12219 array!12217 (_ BitVec 32) (_ BitVec 32) V!8253 V!8253 (_ BitVec 64) (_ BitVec 32) Int) Unit!7666)

(assert (=> b!247740 (= lt!124063 (lemmaArrayContainsKeyThenInListMap!188 (_keys!6705 thiss!1504) (_values!4566 thiss!1504) (mask!10723 thiss!1504) (extraKeys!4320 thiss!1504) (zeroValue!4424 thiss!1504) (minValue!4424 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4583 thiss!1504)))))

(assert (=> b!247740 false))

(declare-fun b!247741 () Bool)

(declare-fun Unit!7669 () Unit!7666)

(assert (=> b!247741 (= e!160715 Unit!7669)))

(declare-fun b!247742 () Bool)

(declare-fun c!41483 () Bool)

(declare-datatypes ((SeekEntryResult!1105 0))(
  ( (MissingZero!1105 (index!6590 (_ BitVec 32))) (Found!1105 (index!6591 (_ BitVec 32))) (Intermediate!1105 (undefined!1917 Bool) (index!6592 (_ BitVec 32)) (x!24541 (_ BitVec 32))) (Undefined!1105) (MissingVacant!1105 (index!6593 (_ BitVec 32))) )
))
(declare-fun lt!124066 () SeekEntryResult!1105)

(assert (=> b!247742 (= c!41483 (is-MissingVacant!1105 lt!124066))))

(declare-fun e!160716 () Bool)

(declare-fun e!160719 () Bool)

(assert (=> b!247742 (= e!160716 e!160719)))

(declare-fun b!247743 () Bool)

(assert (=> b!247743 (= e!160719 (is-Undefined!1105 lt!124066))))

(declare-fun b!247744 () Bool)

(declare-fun res!121422 () Bool)

(declare-fun e!160724 () Bool)

(assert (=> b!247744 (=> (not res!121422) (not e!160724))))

(assert (=> b!247744 (= res!121422 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!247745 () Bool)

(declare-fun e!160717 () Bool)

(declare-fun e!160720 () Bool)

(assert (=> b!247745 (= e!160717 e!160720)))

(declare-fun res!121418 () Bool)

(assert (=> b!247745 (=> (not res!121418) (not e!160720))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247745 (= res!121418 (inRange!0 index!297 (mask!10723 thiss!1504)))))

(declare-fun lt!124068 () Unit!7666)

(declare-fun e!160721 () Unit!7666)

(assert (=> b!247745 (= lt!124068 e!160721)))

(declare-fun c!41486 () Bool)

(declare-datatypes ((tuple2!4818 0))(
  ( (tuple2!4819 (_1!2420 (_ BitVec 64)) (_2!2420 V!8253)) )
))
(declare-datatypes ((List!3699 0))(
  ( (Nil!3696) (Cons!3695 (h!4353 tuple2!4818) (t!8722 List!3699)) )
))
(declare-datatypes ((ListLongMap!3731 0))(
  ( (ListLongMap!3732 (toList!1881 List!3699)) )
))
(declare-fun contains!1795 (ListLongMap!3731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1409 (array!12219 array!12217 (_ BitVec 32) (_ BitVec 32) V!8253 V!8253 (_ BitVec 32) Int) ListLongMap!3731)

(assert (=> b!247745 (= c!41486 (contains!1795 (getCurrentListMap!1409 (_keys!6705 thiss!1504) (_values!4566 thiss!1504) (mask!10723 thiss!1504) (extraKeys!4320 thiss!1504) (zeroValue!4424 thiss!1504) (minValue!4424 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4583 thiss!1504)) key!932))))

(declare-fun b!247746 () Bool)

(declare-fun res!121420 () Bool)

(assert (=> b!247746 (= res!121420 (= (select (arr!5797 (_keys!6705 thiss!1504)) (index!6593 lt!124066)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!160723 () Bool)

(assert (=> b!247746 (=> (not res!121420) (not e!160723))))

(declare-fun call!23200 () Bool)

(declare-fun c!41484 () Bool)

(declare-fun bm!23197 () Bool)

(assert (=> bm!23197 (= call!23200 (inRange!0 (ite c!41484 (index!6590 lt!124066) (index!6593 lt!124066)) (mask!10723 thiss!1504)))))

(declare-fun b!247747 () Bool)

(declare-fun e!160718 () Bool)

(declare-fun tp_is_empty!6455 () Bool)

(assert (=> b!247747 (= e!160718 tp_is_empty!6455)))

(declare-fun res!121421 () Bool)

(assert (=> start!23574 (=> (not res!121421) (not e!160724))))

(declare-fun valid!1435 (LongMapFixedSize!3668) Bool)

(assert (=> start!23574 (= res!121421 (valid!1435 thiss!1504))))

(assert (=> start!23574 e!160724))

(declare-fun e!160728 () Bool)

(assert (=> start!23574 e!160728))

(assert (=> start!23574 true))

(declare-fun b!247748 () Bool)

(declare-fun res!121423 () Bool)

(declare-fun e!160722 () Bool)

(assert (=> b!247748 (=> (not res!121423) (not e!160722))))

(assert (=> b!247748 (= res!121423 call!23200)))

(assert (=> b!247748 (= e!160716 e!160722)))

(declare-fun b!247749 () Bool)

(declare-fun e!160726 () Bool)

(declare-fun mapRes!10958 () Bool)

(assert (=> b!247749 (= e!160726 (and e!160718 mapRes!10958))))

(declare-fun condMapEmpty!10958 () Bool)

(declare-fun mapDefault!10958 () ValueCell!2884)

