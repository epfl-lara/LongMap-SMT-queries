; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21860 () Bool)

(assert start!21860)

(declare-fun b!220606 () Bool)

(declare-fun b_free!5927 () Bool)

(declare-fun b_next!5927 () Bool)

(assert (=> b!220606 (= b_free!5927 (not b_next!5927))))

(declare-fun tp!20922 () Bool)

(declare-fun b_and!12825 () Bool)

(assert (=> b!220606 (= tp!20922 b_and!12825)))

(declare-fun b!220588 () Bool)

(declare-fun e!143415 () Bool)

(declare-fun call!20615 () Bool)

(assert (=> b!220588 (= e!143415 (not call!20615))))

(declare-fun b!220589 () Bool)

(declare-datatypes ((Unit!6579 0))(
  ( (Unit!6580) )
))
(declare-fun e!143422 () Unit!6579)

(declare-fun Unit!6581 () Unit!6579)

(assert (=> b!220589 (= e!143422 Unit!6581)))

(declare-fun lt!112216 () Unit!6579)

(declare-datatypes ((V!7365 0))(
  ( (V!7366 (val!2939 Int)) )
))
(declare-datatypes ((ValueCell!2551 0))(
  ( (ValueCellFull!2551 (v!4959 V!7365)) (EmptyCell!2551) )
))
(declare-datatypes ((array!10821 0))(
  ( (array!10822 (arr!5130 (Array (_ BitVec 32) ValueCell!2551)) (size!5463 (_ BitVec 32))) )
))
(declare-datatypes ((array!10823 0))(
  ( (array!10824 (arr!5131 (Array (_ BitVec 32) (_ BitVec 64))) (size!5464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3002 0))(
  ( (LongMapFixedSize!3003 (defaultEntry!4160 Int) (mask!9962 (_ BitVec 32)) (extraKeys!3897 (_ BitVec 32)) (zeroValue!4001 V!7365) (minValue!4001 V!7365) (_size!1550 (_ BitVec 32)) (_keys!6214 array!10823) (_values!4143 array!10821) (_vacant!1550 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3002)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!204 (array!10823 array!10821 (_ BitVec 32) (_ BitVec 32) V!7365 V!7365 (_ BitVec 64) Int) Unit!6579)

(assert (=> b!220589 (= lt!112216 (lemmaInListMapThenSeekEntryOrOpenFindsIt!204 (_keys!6214 thiss!1504) (_values!4143 thiss!1504) (mask!9962 thiss!1504) (extraKeys!3897 thiss!1504) (zeroValue!4001 thiss!1504) (minValue!4001 thiss!1504) key!932 (defaultEntry!4160 thiss!1504)))))

(assert (=> b!220589 false))

(declare-fun b!220590 () Bool)

(declare-fun e!143426 () Bool)

(declare-fun e!143417 () Bool)

(declare-fun mapRes!9853 () Bool)

(assert (=> b!220590 (= e!143426 (and e!143417 mapRes!9853))))

(declare-fun condMapEmpty!9853 () Bool)

(declare-fun mapDefault!9853 () ValueCell!2551)

