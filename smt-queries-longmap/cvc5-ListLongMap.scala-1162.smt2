; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24510 () Bool)

(assert start!24510)

(declare-fun b!256677 () Bool)

(declare-fun b_free!6721 () Bool)

(declare-fun b_next!6721 () Bool)

(assert (=> b!256677 (= b_free!6721 (not b_next!6721))))

(declare-fun tp!23466 () Bool)

(declare-fun b_and!13783 () Bool)

(assert (=> b!256677 (= tp!23466 b_and!13783)))

(declare-fun b!256659 () Bool)

(declare-fun res!125569 () Bool)

(declare-fun e!166371 () Bool)

(assert (=> b!256659 (=> (not res!125569) (not e!166371))))

(declare-datatypes ((V!8425 0))(
  ( (V!8426 (val!3336 Int)) )
))
(declare-datatypes ((ValueCell!2948 0))(
  ( (ValueCellFull!2948 (v!5425 V!8425)) (EmptyCell!2948) )
))
(declare-datatypes ((array!12507 0))(
  ( (array!12508 (arr!5924 (Array (_ BitVec 32) ValueCell!2948)) (size!6271 (_ BitVec 32))) )
))
(declare-datatypes ((array!12509 0))(
  ( (array!12510 (arr!5925 (Array (_ BitVec 32) (_ BitVec 64))) (size!6272 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3796 0))(
  ( (LongMapFixedSize!3797 (defaultEntry!4736 Int) (mask!11014 (_ BitVec 32)) (extraKeys!4473 (_ BitVec 32)) (zeroValue!4577 V!8425) (minValue!4577 V!8425) (_size!1947 (_ BitVec 32)) (_keys!6900 array!12509) (_values!4719 array!12507) (_vacant!1947 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3796)

(declare-datatypes ((SeekEntryResult!1164 0))(
  ( (MissingZero!1164 (index!6826 (_ BitVec 32))) (Found!1164 (index!6827 (_ BitVec 32))) (Intermediate!1164 (undefined!1976 Bool) (index!6828 (_ BitVec 32)) (x!24978 (_ BitVec 32))) (Undefined!1164) (MissingVacant!1164 (index!6829 (_ BitVec 32))) )
))
(declare-fun lt!128909 () SeekEntryResult!1164)

(assert (=> b!256659 (= res!125569 (= (select (arr!5925 (_keys!6900 thiss!1504)) (index!6826 lt!128909)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!256660 () Bool)

(declare-fun e!166380 () Bool)

(declare-fun e!166372 () Bool)

(assert (=> b!256660 (= e!166380 e!166372)))

(declare-fun res!125570 () Bool)

(assert (=> b!256660 (=> (not res!125570) (not e!166372))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!256660 (= res!125570 (inRange!0 index!297 (mask!11014 thiss!1504)))))

(declare-datatypes ((Unit!7965 0))(
  ( (Unit!7966) )
))
(declare-fun lt!128910 () Unit!7965)

(declare-fun e!166375 () Unit!7965)

(assert (=> b!256660 (= lt!128910 e!166375)))

(declare-fun c!43396 () Bool)

(declare-datatypes ((tuple2!4912 0))(
  ( (tuple2!4913 (_1!2467 (_ BitVec 64)) (_2!2467 V!8425)) )
))
(declare-datatypes ((List!3792 0))(
  ( (Nil!3789) (Cons!3788 (h!4450 tuple2!4912) (t!8849 List!3792)) )
))
(declare-datatypes ((ListLongMap!3825 0))(
  ( (ListLongMap!3826 (toList!1928 List!3792)) )
))
(declare-fun lt!128907 () ListLongMap!3825)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun contains!1867 (ListLongMap!3825 (_ BitVec 64)) Bool)

(assert (=> b!256660 (= c!43396 (contains!1867 lt!128907 key!932))))

(declare-fun getCurrentListMap!1456 (array!12509 array!12507 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 32) Int) ListLongMap!3825)

(assert (=> b!256660 (= lt!128907 (getCurrentListMap!1456 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4736 thiss!1504)))))

(declare-fun b!256661 () Bool)

(declare-fun e!166373 () Unit!7965)

(declare-fun Unit!7967 () Unit!7965)

(assert (=> b!256661 (= e!166373 Unit!7967)))

(declare-fun mapNonEmpty!11205 () Bool)

(declare-fun mapRes!11205 () Bool)

(declare-fun tp!23465 () Bool)

(declare-fun e!166379 () Bool)

(assert (=> mapNonEmpty!11205 (= mapRes!11205 (and tp!23465 e!166379))))

(declare-fun mapValue!11205 () ValueCell!2948)

(declare-fun mapKey!11205 () (_ BitVec 32))

(declare-fun mapRest!11205 () (Array (_ BitVec 32) ValueCell!2948))

(assert (=> mapNonEmpty!11205 (= (arr!5924 (_values!4719 thiss!1504)) (store mapRest!11205 mapKey!11205 mapValue!11205))))

(declare-fun bm!24325 () Bool)

(declare-fun call!24328 () Bool)

(declare-fun arrayContainsKey!0 (array!12509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24325 (= call!24328 (arrayContainsKey!0 (_keys!6900 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!256662 () Bool)

(declare-fun res!125563 () Bool)

(assert (=> b!256662 (=> (not res!125563) (not e!166371))))

(declare-fun call!24329 () Bool)

(assert (=> b!256662 (= res!125563 call!24329)))

(declare-fun e!166378 () Bool)

(assert (=> b!256662 (= e!166378 e!166371)))

(declare-fun c!43397 () Bool)

(declare-fun bm!24326 () Bool)

(assert (=> bm!24326 (= call!24329 (inRange!0 (ite c!43397 (index!6826 lt!128909) (index!6829 lt!128909)) (mask!11014 thiss!1504)))))

(declare-fun b!256663 () Bool)

(declare-fun res!125567 () Bool)

(assert (=> b!256663 (= res!125567 (= (select (arr!5925 (_keys!6900 thiss!1504)) (index!6829 lt!128909)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!166370 () Bool)

(assert (=> b!256663 (=> (not res!125567) (not e!166370))))

(declare-fun res!125562 () Bool)

(declare-fun e!166383 () Bool)

(assert (=> start!24510 (=> (not res!125562) (not e!166383))))

(declare-fun valid!1483 (LongMapFixedSize!3796) Bool)

(assert (=> start!24510 (= res!125562 (valid!1483 thiss!1504))))

(assert (=> start!24510 e!166383))

(declare-fun e!166382 () Bool)

(assert (=> start!24510 e!166382))

(assert (=> start!24510 true))

(declare-fun tp_is_empty!6583 () Bool)

(assert (=> start!24510 tp_is_empty!6583))

(declare-fun b!256664 () Bool)

(declare-fun e!166376 () Bool)

(assert (=> b!256664 (= e!166376 (bvslt (size!6272 (_keys!6900 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!256665 () Bool)

(assert (=> b!256665 (= e!166370 (not call!24328))))

(declare-fun b!256666 () Bool)

(declare-fun c!43395 () Bool)

(assert (=> b!256666 (= c!43395 (is-MissingVacant!1164 lt!128909))))

(declare-fun e!166374 () Bool)

(assert (=> b!256666 (= e!166378 e!166374)))

(declare-fun b!256667 () Bool)

(assert (=> b!256667 (= e!166374 e!166370)))

(declare-fun res!125566 () Bool)

(assert (=> b!256667 (= res!125566 call!24329)))

(assert (=> b!256667 (=> (not res!125566) (not e!166370))))

(declare-fun mapIsEmpty!11205 () Bool)

(assert (=> mapIsEmpty!11205 mapRes!11205))

(declare-fun b!256668 () Bool)

(declare-fun lt!128913 () Unit!7965)

(assert (=> b!256668 (= e!166375 lt!128913)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!431 (array!12509 array!12507 (_ BitVec 32) (_ BitVec 32) V!8425 V!8425 (_ BitVec 64) Int) Unit!7965)

(assert (=> b!256668 (= lt!128913 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!431 (_keys!6900 thiss!1504) (_values!4719 thiss!1504) (mask!11014 thiss!1504) (extraKeys!4473 thiss!1504) (zeroValue!4577 thiss!1504) (minValue!4577 thiss!1504) key!932 (defaultEntry!4736 thiss!1504)))))

(assert (=> b!256668 (= c!43397 (is-MissingZero!1164 lt!128909))))

(assert (=> b!256668 e!166378))

(declare-fun b!256669 () Bool)

(declare-fun e!166377 () Bool)

(declare-fun e!166369 () Bool)

(assert (=> b!256669 (= e!166377 (and e!166369 mapRes!11205))))

(declare-fun condMapEmpty!11205 () Bool)

(declare-fun mapDefault!11205 () ValueCell!2948)

