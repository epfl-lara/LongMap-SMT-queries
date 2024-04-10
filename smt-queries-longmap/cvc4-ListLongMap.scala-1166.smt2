; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24764 () Bool)

(assert start!24764)

(declare-fun b!258892 () Bool)

(declare-fun b_free!6749 () Bool)

(declare-fun b_next!6749 () Bool)

(assert (=> b!258892 (= b_free!6749 (not b_next!6749))))

(declare-fun tp!23563 () Bool)

(declare-fun b_and!13837 () Bool)

(assert (=> b!258892 (= tp!23563 b_and!13837)))

(declare-fun b!258880 () Bool)

(declare-fun e!167801 () Bool)

(declare-fun e!167803 () Bool)

(assert (=> b!258880 (= e!167801 e!167803)))

(declare-fun res!126581 () Bool)

(declare-fun call!24628 () Bool)

(assert (=> b!258880 (= res!126581 call!24628)))

(assert (=> b!258880 (=> (not res!126581) (not e!167803))))

(declare-fun b!258881 () Bool)

(declare-fun e!167807 () Bool)

(declare-fun tp_is_empty!6611 () Bool)

(assert (=> b!258881 (= e!167807 tp_is_empty!6611)))

(declare-fun b!258882 () Bool)

(declare-datatypes ((Unit!8050 0))(
  ( (Unit!8051) )
))
(declare-fun e!167800 () Unit!8050)

(declare-fun Unit!8052 () Unit!8050)

(assert (=> b!258882 (= e!167800 Unit!8052)))

(declare-fun lt!130374 () Unit!8050)

(declare-datatypes ((V!8461 0))(
  ( (V!8462 (val!3350 Int)) )
))
(declare-datatypes ((ValueCell!2962 0))(
  ( (ValueCellFull!2962 (v!5454 V!8461)) (EmptyCell!2962) )
))
(declare-datatypes ((array!12571 0))(
  ( (array!12572 (arr!5952 (Array (_ BitVec 32) ValueCell!2962)) (size!6300 (_ BitVec 32))) )
))
(declare-datatypes ((array!12573 0))(
  ( (array!12574 (arr!5953 (Array (_ BitVec 32) (_ BitVec 64))) (size!6301 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3824 0))(
  ( (LongMapFixedSize!3825 (defaultEntry!4775 Int) (mask!11083 (_ BitVec 32)) (extraKeys!4512 (_ BitVec 32)) (zeroValue!4616 V!8461) (minValue!4616 V!8461) (_size!1961 (_ BitVec 32)) (_keys!6949 array!12573) (_values!4758 array!12571) (_vacant!1961 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3824)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!439 (array!12573 array!12571 (_ BitVec 32) (_ BitVec 32) V!8461 V!8461 (_ BitVec 64) Int) Unit!8050)

(assert (=> b!258882 (= lt!130374 (lemmaInListMapThenSeekEntryOrOpenFindsIt!439 (_keys!6949 thiss!1504) (_values!4758 thiss!1504) (mask!11083 thiss!1504) (extraKeys!4512 thiss!1504) (zeroValue!4616 thiss!1504) (minValue!4616 thiss!1504) key!932 (defaultEntry!4775 thiss!1504)))))

(assert (=> b!258882 false))

(declare-fun b!258883 () Bool)

(declare-fun e!167808 () Bool)

(declare-fun e!167811 () Bool)

(assert (=> b!258883 (= e!167808 e!167811)))

(declare-fun res!126573 () Bool)

(assert (=> b!258883 (=> (not res!126573) (not e!167811))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!258883 (= res!126573 (inRange!0 index!297 (mask!11083 thiss!1504)))))

(declare-fun lt!130364 () Unit!8050)

(assert (=> b!258883 (= lt!130364 e!167800)))

(declare-fun c!43895 () Bool)

(declare-datatypes ((tuple2!4940 0))(
  ( (tuple2!4941 (_1!2481 (_ BitVec 64)) (_2!2481 V!8461)) )
))
(declare-datatypes ((List!3819 0))(
  ( (Nil!3816) (Cons!3815 (h!4478 tuple2!4940) (t!8884 List!3819)) )
))
(declare-datatypes ((ListLongMap!3853 0))(
  ( (ListLongMap!3854 (toList!1942 List!3819)) )
))
(declare-fun lt!130372 () ListLongMap!3853)

(declare-fun contains!1883 (ListLongMap!3853 (_ BitVec 64)) Bool)

(assert (=> b!258883 (= c!43895 (contains!1883 lt!130372 key!932))))

(declare-fun getCurrentListMap!1470 (array!12573 array!12571 (_ BitVec 32) (_ BitVec 32) V!8461 V!8461 (_ BitVec 32) Int) ListLongMap!3853)

(assert (=> b!258883 (= lt!130372 (getCurrentListMap!1470 (_keys!6949 thiss!1504) (_values!4758 thiss!1504) (mask!11083 thiss!1504) (extraKeys!4512 thiss!1504) (zeroValue!4616 thiss!1504) (minValue!4616 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4775 thiss!1504)))))

(declare-fun b!258884 () Bool)

(declare-fun lt!130366 () Unit!8050)

(assert (=> b!258884 (= e!167800 lt!130366)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (array!12573 array!12571 (_ BitVec 32) (_ BitVec 32) V!8461 V!8461 (_ BitVec 64) Int) Unit!8050)

(assert (=> b!258884 (= lt!130366 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!441 (_keys!6949 thiss!1504) (_values!4758 thiss!1504) (mask!11083 thiss!1504) (extraKeys!4512 thiss!1504) (zeroValue!4616 thiss!1504) (minValue!4616 thiss!1504) key!932 (defaultEntry!4775 thiss!1504)))))

(declare-fun c!43894 () Bool)

(declare-datatypes ((SeekEntryResult!1178 0))(
  ( (MissingZero!1178 (index!6882 (_ BitVec 32))) (Found!1178 (index!6883 (_ BitVec 32))) (Intermediate!1178 (undefined!1990 Bool) (index!6884 (_ BitVec 32)) (x!25072 (_ BitVec 32))) (Undefined!1178) (MissingVacant!1178 (index!6885 (_ BitVec 32))) )
))
(declare-fun lt!130373 () SeekEntryResult!1178)

(assert (=> b!258884 (= c!43894 (is-MissingZero!1178 lt!130373))))

(declare-fun e!167806 () Bool)

(assert (=> b!258884 e!167806))

(declare-fun b!258885 () Bool)

(declare-fun e!167813 () Bool)

(assert (=> b!258885 (= e!167813 e!167808)))

(declare-fun res!126574 () Bool)

(assert (=> b!258885 (=> (not res!126574) (not e!167808))))

(assert (=> b!258885 (= res!126574 (or (= lt!130373 (MissingZero!1178 index!297)) (= lt!130373 (MissingVacant!1178 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12573 (_ BitVec 32)) SeekEntryResult!1178)

(assert (=> b!258885 (= lt!130373 (seekEntryOrOpen!0 key!932 (_keys!6949 thiss!1504) (mask!11083 thiss!1504)))))

(declare-fun res!126576 () Bool)

(assert (=> start!24764 (=> (not res!126576) (not e!167813))))

(declare-fun valid!1493 (LongMapFixedSize!3824) Bool)

(assert (=> start!24764 (= res!126576 (valid!1493 thiss!1504))))

(assert (=> start!24764 e!167813))

(declare-fun e!167804 () Bool)

(assert (=> start!24764 e!167804))

(assert (=> start!24764 true))

(assert (=> start!24764 tp_is_empty!6611))

(declare-fun b!258886 () Bool)

(declare-fun c!43897 () Bool)

(assert (=> b!258886 (= c!43897 (is-MissingVacant!1178 lt!130373))))

(assert (=> b!258886 (= e!167806 e!167801)))

(declare-fun b!258887 () Bool)

(assert (=> b!258887 (= e!167801 (is-Undefined!1178 lt!130373))))

(declare-fun b!258888 () Bool)

(declare-fun e!167802 () Unit!8050)

(declare-fun Unit!8053 () Unit!8050)

(assert (=> b!258888 (= e!167802 Unit!8053)))

(declare-fun b!258889 () Bool)

(declare-fun Unit!8054 () Unit!8050)

(assert (=> b!258889 (= e!167802 Unit!8054)))

(declare-fun lt!130367 () Unit!8050)

(declare-fun lemmaArrayContainsKeyThenInListMap!247 (array!12573 array!12571 (_ BitVec 32) (_ BitVec 32) V!8461 V!8461 (_ BitVec 64) (_ BitVec 32) Int) Unit!8050)

(assert (=> b!258889 (= lt!130367 (lemmaArrayContainsKeyThenInListMap!247 (_keys!6949 thiss!1504) (_values!4758 thiss!1504) (mask!11083 thiss!1504) (extraKeys!4512 thiss!1504) (zeroValue!4616 thiss!1504) (minValue!4616 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4775 thiss!1504)))))

(assert (=> b!258889 false))

(declare-fun b!258890 () Bool)

(declare-fun call!24629 () Bool)

(assert (=> b!258890 (= e!167803 (not call!24629))))

(declare-fun bm!24625 () Bool)

(declare-fun arrayContainsKey!0 (array!12573 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!24625 (= call!24629 (arrayContainsKey!0 (_keys!6949 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!258891 () Bool)

(declare-fun e!167809 () Bool)

(declare-fun e!167810 () Bool)

(declare-fun mapRes!11260 () Bool)

(assert (=> b!258891 (= e!167809 (and e!167810 mapRes!11260))))

(declare-fun condMapEmpty!11260 () Bool)

(declare-fun mapDefault!11260 () ValueCell!2962)

