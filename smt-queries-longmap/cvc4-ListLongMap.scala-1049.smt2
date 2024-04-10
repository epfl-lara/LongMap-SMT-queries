; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21980 () Bool)

(assert start!21980)

(declare-fun b!225437 () Bool)

(declare-fun b_free!6047 () Bool)

(declare-fun b_next!6047 () Bool)

(assert (=> b!225437 (= b_free!6047 (not b_next!6047))))

(declare-fun tp!21283 () Bool)

(declare-fun b_and!12945 () Bool)

(assert (=> b!225437 (= tp!21283 b_and!12945)))

(declare-fun b!225427 () Bool)

(declare-fun e!146312 () Bool)

(declare-fun e!146324 () Bool)

(assert (=> b!225427 (= e!146312 e!146324)))

(declare-fun res!110946 () Bool)

(assert (=> b!225427 (=> (not res!110946) (not e!146324))))

(declare-fun index!297 () (_ BitVec 32))

(declare-datatypes ((V!7525 0))(
  ( (V!7526 (val!2999 Int)) )
))
(declare-datatypes ((ValueCell!2611 0))(
  ( (ValueCellFull!2611 (v!5019 V!7525)) (EmptyCell!2611) )
))
(declare-datatypes ((array!11061 0))(
  ( (array!11062 (arr!5250 (Array (_ BitVec 32) ValueCell!2611)) (size!5583 (_ BitVec 32))) )
))
(declare-datatypes ((array!11063 0))(
  ( (array!11064 (arr!5251 (Array (_ BitVec 32) (_ BitVec 64))) (size!5584 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3122 0))(
  ( (LongMapFixedSize!3123 (defaultEntry!4220 Int) (mask!10062 (_ BitVec 32)) (extraKeys!3957 (_ BitVec 32)) (zeroValue!4061 V!7525) (minValue!4061 V!7525) (_size!1610 (_ BitVec 32)) (_keys!6274 array!11063) (_values!4203 array!11061) (_vacant!1610 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3122)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!225427 (= res!110946 (inRange!0 index!297 (mask!10062 thiss!1504)))))

(declare-datatypes ((Unit!6797 0))(
  ( (Unit!6798) )
))
(declare-fun lt!113544 () Unit!6797)

(declare-fun e!146318 () Unit!6797)

(assert (=> b!225427 (= lt!113544 e!146318)))

(declare-fun c!37380 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4442 0))(
  ( (tuple2!4443 (_1!2232 (_ BitVec 64)) (_2!2232 V!7525)) )
))
(declare-datatypes ((List!3355 0))(
  ( (Nil!3352) (Cons!3351 (h!3999 tuple2!4442) (t!8314 List!3355)) )
))
(declare-datatypes ((ListLongMap!3355 0))(
  ( (ListLongMap!3356 (toList!1693 List!3355)) )
))
(declare-fun contains!1567 (ListLongMap!3355 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1221 (array!11063 array!11061 (_ BitVec 32) (_ BitVec 32) V!7525 V!7525 (_ BitVec 32) Int) ListLongMap!3355)

(assert (=> b!225427 (= c!37380 (contains!1567 (getCurrentListMap!1221 (_keys!6274 thiss!1504) (_values!4203 thiss!1504) (mask!10062 thiss!1504) (extraKeys!3957 thiss!1504) (zeroValue!4061 thiss!1504) (minValue!4061 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4220 thiss!1504)) key!932))))

(declare-fun b!225428 () Bool)

(declare-fun e!146317 () Bool)

(declare-fun e!146321 () Bool)

(assert (=> b!225428 (= e!146317 e!146321)))

(declare-fun res!110949 () Bool)

(declare-fun call!20976 () Bool)

(assert (=> b!225428 (= res!110949 call!20976)))

(assert (=> b!225428 (=> (not res!110949) (not e!146321))))

(declare-fun b!225429 () Bool)

(declare-fun res!110942 () Bool)

(declare-fun e!146311 () Bool)

(assert (=> b!225429 (=> res!110942 e!146311)))

(declare-fun lt!113539 () Bool)

(assert (=> b!225429 (= res!110942 lt!113539)))

(declare-fun b!225430 () Bool)

(declare-fun e!146315 () Unit!6797)

(declare-fun Unit!6799 () Unit!6797)

(assert (=> b!225430 (= e!146315 Unit!6799)))

(declare-fun b!225431 () Bool)

(declare-fun res!110945 () Bool)

(assert (=> b!225431 (=> res!110945 e!146311)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11063 (_ BitVec 32)) Bool)

(assert (=> b!225431 (= res!110945 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6274 thiss!1504) (mask!10062 thiss!1504))))))

(declare-fun c!37379 () Bool)

(declare-fun bm!20972 () Bool)

(declare-datatypes ((SeekEntryResult!869 0))(
  ( (MissingZero!869 (index!5646 (_ BitVec 32))) (Found!869 (index!5647 (_ BitVec 32))) (Intermediate!869 (undefined!1681 Bool) (index!5648 (_ BitVec 32)) (x!23177 (_ BitVec 32))) (Undefined!869) (MissingVacant!869 (index!5649 (_ BitVec 32))) )
))
(declare-fun lt!113541 () SeekEntryResult!869)

(assert (=> bm!20972 (= call!20976 (inRange!0 (ite c!37379 (index!5646 lt!113541) (index!5649 lt!113541)) (mask!10062 thiss!1504)))))

(declare-fun b!225432 () Bool)

(declare-fun res!110947 () Bool)

(assert (=> b!225432 (=> res!110947 e!146311)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!225432 (= res!110947 (not (validKeyInArray!0 key!932)))))

(declare-fun b!225433 () Bool)

(declare-fun c!37377 () Bool)

(assert (=> b!225433 (= c!37377 (is-MissingVacant!869 lt!113541))))

(declare-fun e!146314 () Bool)

(assert (=> b!225433 (= e!146314 e!146317)))

(declare-fun b!225434 () Bool)

(declare-fun lt!113542 () Unit!6797)

(assert (=> b!225434 (= e!146318 lt!113542)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!259 (array!11063 array!11061 (_ BitVec 32) (_ BitVec 32) V!7525 V!7525 (_ BitVec 64) Int) Unit!6797)

(assert (=> b!225434 (= lt!113542 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!259 (_keys!6274 thiss!1504) (_values!4203 thiss!1504) (mask!10062 thiss!1504) (extraKeys!3957 thiss!1504) (zeroValue!4061 thiss!1504) (minValue!4061 thiss!1504) key!932 (defaultEntry!4220 thiss!1504)))))

(assert (=> b!225434 (= c!37379 (is-MissingZero!869 lt!113541))))

(assert (=> b!225434 e!146314))

(declare-fun b!225435 () Bool)

(assert (=> b!225435 (= e!146317 (is-Undefined!869 lt!113541))))

(declare-fun b!225436 () Bool)

(declare-fun e!146313 () Bool)

(declare-fun e!146319 () Bool)

(declare-fun mapRes!10033 () Bool)

(assert (=> b!225436 (= e!146313 (and e!146319 mapRes!10033))))

(declare-fun condMapEmpty!10033 () Bool)

(declare-fun mapDefault!10033 () ValueCell!2611)

