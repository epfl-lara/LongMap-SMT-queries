; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23050 () Bool)

(assert start!23050)

(declare-fun b!241468 () Bool)

(declare-fun b_free!6487 () Bool)

(declare-fun b_next!6487 () Bool)

(assert (=> b!241468 (= b_free!6487 (not b_next!6487))))

(declare-fun tp!22669 () Bool)

(declare-fun b_and!13459 () Bool)

(assert (=> b!241468 (= tp!22669 b_and!13459)))

(declare-fun mapNonEmpty!10759 () Bool)

(declare-fun mapRes!10759 () Bool)

(declare-fun tp!22668 () Bool)

(declare-fun e!156693 () Bool)

(assert (=> mapNonEmpty!10759 (= mapRes!10759 (and tp!22668 e!156693))))

(declare-datatypes ((V!8113 0))(
  ( (V!8114 (val!3219 Int)) )
))
(declare-datatypes ((ValueCell!2831 0))(
  ( (ValueCellFull!2831 (v!5258 V!8113)) (EmptyCell!2831) )
))
(declare-datatypes ((array!11979 0))(
  ( (array!11980 (arr!5690 (Array (_ BitVec 32) ValueCell!2831)) (size!6032 (_ BitVec 32))) )
))
(declare-datatypes ((array!11981 0))(
  ( (array!11982 (arr!5691 (Array (_ BitVec 32) (_ BitVec 64))) (size!6033 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3562 0))(
  ( (LongMapFixedSize!3563 (defaultEntry!4474 Int) (mask!10545 (_ BitVec 32)) (extraKeys!4211 (_ BitVec 32)) (zeroValue!4315 V!8113) (minValue!4315 V!8113) (_size!1830 (_ BitVec 32)) (_keys!6580 array!11981) (_values!4457 array!11979) (_vacant!1830 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3562)

(declare-fun mapValue!10759 () ValueCell!2831)

(declare-fun mapRest!10759 () (Array (_ BitVec 32) ValueCell!2831))

(declare-fun mapKey!10759 () (_ BitVec 32))

(assert (=> mapNonEmpty!10759 (= (arr!5690 (_values!4457 thiss!1504)) (store mapRest!10759 mapKey!10759 mapValue!10759))))

(declare-fun b!241452 () Bool)

(declare-fun e!156696 () Bool)

(declare-fun e!156691 () Bool)

(assert (=> b!241452 (= e!156696 e!156691)))

(declare-fun res!118367 () Bool)

(assert (=> b!241452 (=> (not res!118367) (not e!156691))))

(declare-datatypes ((SeekEntryResult!1055 0))(
  ( (MissingZero!1055 (index!6390 (_ BitVec 32))) (Found!1055 (index!6391 (_ BitVec 32))) (Intermediate!1055 (undefined!1867 Bool) (index!6392 (_ BitVec 32)) (x!24217 (_ BitVec 32))) (Undefined!1055) (MissingVacant!1055 (index!6393 (_ BitVec 32))) )
))
(declare-fun lt!121369 () SeekEntryResult!1055)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!241452 (= res!118367 (or (= lt!121369 (MissingZero!1055 index!297)) (= lt!121369 (MissingVacant!1055 index!297))))))

(declare-fun key!932 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11981 (_ BitVec 32)) SeekEntryResult!1055)

(assert (=> b!241452 (= lt!121369 (seekEntryOrOpen!0 key!932 (_keys!6580 thiss!1504) (mask!10545 thiss!1504)))))

(declare-fun b!241453 () Bool)

(declare-fun e!156690 () Bool)

(assert (=> b!241453 (= e!156690 false)))

(declare-datatypes ((Unit!7433 0))(
  ( (Unit!7434) )
))
(declare-fun lt!121368 () Unit!7433)

(declare-fun e!156695 () Unit!7433)

(assert (=> b!241453 (= lt!121368 e!156695)))

(declare-fun c!40253 () Bool)

(declare-fun arrayContainsKey!0 (array!11981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!241453 (= c!40253 (arrayContainsKey!0 (_keys!6580 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241454 () Bool)

(declare-fun e!156702 () Bool)

(declare-fun call!22466 () Bool)

(assert (=> b!241454 (= e!156702 (not call!22466))))

(declare-fun b!241455 () Bool)

(assert (=> b!241455 (= e!156691 e!156690)))

(declare-fun res!118365 () Bool)

(assert (=> b!241455 (=> (not res!118365) (not e!156690))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!241455 (= res!118365 (inRange!0 index!297 (mask!10545 thiss!1504)))))

(declare-fun lt!121370 () Unit!7433)

(declare-fun e!156692 () Unit!7433)

(assert (=> b!241455 (= lt!121370 e!156692)))

(declare-fun c!40251 () Bool)

(declare-datatypes ((tuple2!4742 0))(
  ( (tuple2!4743 (_1!2382 (_ BitVec 64)) (_2!2382 V!8113)) )
))
(declare-datatypes ((List!3623 0))(
  ( (Nil!3620) (Cons!3619 (h!4276 tuple2!4742) (t!8620 List!3623)) )
))
(declare-datatypes ((ListLongMap!3655 0))(
  ( (ListLongMap!3656 (toList!1843 List!3623)) )
))
(declare-fun contains!1733 (ListLongMap!3655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1371 (array!11981 array!11979 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 32) Int) ListLongMap!3655)

(assert (=> b!241455 (= c!40251 (contains!1733 (getCurrentListMap!1371 (_keys!6580 thiss!1504) (_values!4457 thiss!1504) (mask!10545 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4474 thiss!1504)) key!932))))

(declare-fun b!241456 () Bool)

(declare-fun res!118366 () Bool)

(assert (=> b!241456 (= res!118366 (= (select (arr!5691 (_keys!6580 thiss!1504)) (index!6393 lt!121369)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!156698 () Bool)

(assert (=> b!241456 (=> (not res!118366) (not e!156698))))

(declare-fun b!241457 () Bool)

(assert (=> b!241457 (= e!156698 (not call!22466))))

(declare-fun res!118368 () Bool)

(assert (=> start!23050 (=> (not res!118368) (not e!156696))))

(declare-fun valid!1400 (LongMapFixedSize!3562) Bool)

(assert (=> start!23050 (= res!118368 (valid!1400 thiss!1504))))

(assert (=> start!23050 e!156696))

(declare-fun e!156697 () Bool)

(assert (=> start!23050 e!156697))

(assert (=> start!23050 true))

(declare-fun b!241458 () Bool)

(declare-fun tp_is_empty!6349 () Bool)

(assert (=> b!241458 (= e!156693 tp_is_empty!6349)))

(declare-fun bm!22463 () Bool)

(assert (=> bm!22463 (= call!22466 (arrayContainsKey!0 (_keys!6580 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!241459 () Bool)

(declare-fun res!118361 () Bool)

(assert (=> b!241459 (=> (not res!118361) (not e!156702))))

(declare-fun call!22467 () Bool)

(assert (=> b!241459 (= res!118361 call!22467)))

(declare-fun e!156701 () Bool)

(assert (=> b!241459 (= e!156701 e!156702)))

(declare-fun b!241460 () Bool)

(declare-fun e!156703 () Bool)

(assert (=> b!241460 (= e!156703 tp_is_empty!6349)))

(declare-fun b!241461 () Bool)

(declare-fun e!156694 () Bool)

(assert (=> b!241461 (= e!156694 (is-Undefined!1055 lt!121369))))

(declare-fun b!241462 () Bool)

(declare-fun Unit!7435 () Unit!7433)

(assert (=> b!241462 (= e!156692 Unit!7435)))

(declare-fun lt!121365 () Unit!7433)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (array!11981 array!11979 (_ BitVec 32) (_ BitVec 32) V!8113 V!8113 (_ BitVec 64) Int) Unit!7433)

(assert (=> b!241462 (= lt!121365 (lemmaInListMapThenSeekEntryOrOpenFindsIt!347 (_keys!6580 thiss!1504) (_values!4457 thiss!1504) (mask!10545 thiss!1504) (extraKeys!4211 thiss!1504) (zeroValue!4315 thiss!1504) (minValue!4315 thiss!1504) key!932 (defaultEntry!4474 thiss!1504)))))

(assert (=> b!241462 false))

(declare-fun b!241463 () Bool)

(assert (=> b!241463 (= e!156694 e!156698)))

(declare-fun res!118364 () Bool)

(assert (=> b!241463 (= res!118364 call!22467)))

(assert (=> b!241463 (=> (not res!118364) (not e!156698))))

(declare-fun b!241464 () Bool)

(declare-fun e!156699 () Bool)

(assert (=> b!241464 (= e!156699 (and e!156703 mapRes!10759))))

(declare-fun condMapEmpty!10759 () Bool)

(declare-fun mapDefault!10759 () ValueCell!2831)

