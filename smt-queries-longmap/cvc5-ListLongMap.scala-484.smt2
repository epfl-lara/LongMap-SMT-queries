; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10346 () Bool)

(assert start!10346)

(declare-fun b!80211 () Bool)

(declare-fun b_free!2197 () Bool)

(declare-fun b_next!2197 () Bool)

(assert (=> b!80211 (= b_free!2197 (not b_next!2197))))

(declare-fun tp!8800 () Bool)

(declare-fun b_and!4899 () Bool)

(assert (=> b!80211 (= tp!8800 b_and!4899)))

(declare-fun b!80204 () Bool)

(declare-fun b_free!2199 () Bool)

(declare-fun b_next!2199 () Bool)

(assert (=> b!80204 (= b_free!2199 (not b_next!2199))))

(declare-fun tp!8799 () Bool)

(declare-fun b_and!4901 () Bool)

(assert (=> b!80204 (= tp!8799 b_and!4901)))

(declare-fun b!80199 () Bool)

(declare-datatypes ((Unit!2338 0))(
  ( (Unit!2339) )
))
(declare-fun e!52389 () Unit!2338)

(declare-fun Unit!2340 () Unit!2338)

(assert (=> b!80199 (= e!52389 Unit!2340)))

(declare-fun lt!37229 () Unit!2338)

(declare-datatypes ((V!3001 0))(
  ( (V!3002 (val!1302 Int)) )
))
(declare-datatypes ((array!3985 0))(
  ( (array!3986 (arr!1899 (Array (_ BitVec 32) (_ BitVec 64))) (size!2141 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!914 0))(
  ( (ValueCellFull!914 (v!2605 V!3001)) (EmptyCell!914) )
))
(declare-datatypes ((array!3987 0))(
  ( (array!3988 (arr!1900 (Array (_ BitVec 32) ValueCell!914)) (size!2142 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!736 0))(
  ( (LongMapFixedSize!737 (defaultEntry!2292 Int) (mask!6298 (_ BitVec 32)) (extraKeys!2139 (_ BitVec 32)) (zeroValue!2188 V!3001) (minValue!2188 V!3001) (_size!417 (_ BitVec 32)) (_keys!3956 array!3985) (_values!2275 array!3987) (_vacant!417 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!538 0))(
  ( (Cell!539 (v!2606 LongMapFixedSize!736)) )
))
(declare-datatypes ((LongMap!538 0))(
  ( (LongMap!539 (underlying!280 Cell!538)) )
))
(declare-fun thiss!992 () LongMap!538)

(declare-fun from!355 () (_ BitVec 32))

(declare-fun lemmaListMapContainsThenArrayContainsFrom!63 (array!3985 array!3987 (_ BitVec 32) (_ BitVec 32) V!3001 V!3001 (_ BitVec 64) (_ BitVec 32) Int) Unit!2338)

(assert (=> b!80199 (= lt!37229 (lemmaListMapContainsThenArrayContainsFrom!63 (_keys!3956 (v!2606 (underlying!280 thiss!992))) (_values!2275 (v!2606 (underlying!280 thiss!992))) (mask!6298 (v!2606 (underlying!280 thiss!992))) (extraKeys!2139 (v!2606 (underlying!280 thiss!992))) (zeroValue!2188 (v!2606 (underlying!280 thiss!992))) (minValue!2188 (v!2606 (underlying!280 thiss!992))) (select (arr!1899 (_keys!3956 (v!2606 (underlying!280 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2292 (v!2606 (underlying!280 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!3985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!80199 (arrayContainsKey!0 (_keys!3956 (v!2606 (underlying!280 thiss!992))) (select (arr!1899 (_keys!3956 (v!2606 (underlying!280 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!37216 () Unit!2338)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!3985 (_ BitVec 32) (_ BitVec 32)) Unit!2338)

(assert (=> b!80199 (= lt!37216 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!3956 (v!2606 (underlying!280 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1510 0))(
  ( (Nil!1507) (Cons!1506 (h!2095 (_ BitVec 64)) (t!5173 List!1510)) )
))
(declare-fun arrayNoDuplicates!0 (array!3985 (_ BitVec 32) List!1510) Bool)

(assert (=> b!80199 (arrayNoDuplicates!0 (_keys!3956 (v!2606 (underlying!280 thiss!992))) from!355 Nil!1507)))

(declare-fun lt!37228 () Unit!2338)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!3985 (_ BitVec 32) (_ BitVec 64) List!1510) Unit!2338)

(assert (=> b!80199 (= lt!37228 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!3956 (v!2606 (underlying!280 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1899 (_keys!3956 (v!2606 (underlying!280 thiss!992)))) from!355) (Cons!1506 (select (arr!1899 (_keys!3956 (v!2606 (underlying!280 thiss!992)))) from!355) Nil!1507)))))

(assert (=> b!80199 false))

(declare-fun b!80200 () Bool)

(declare-fun e!52386 () Bool)

(declare-fun e!52383 () Bool)

(assert (=> b!80200 (= e!52386 e!52383)))

(declare-fun mapNonEmpty!3323 () Bool)

(declare-fun mapRes!3323 () Bool)

(declare-fun tp!8801 () Bool)

(declare-fun e!52377 () Bool)

(assert (=> mapNonEmpty!3323 (= mapRes!3323 (and tp!8801 e!52377))))

(declare-fun mapRest!3323 () (Array (_ BitVec 32) ValueCell!914))

(declare-fun newMap!16 () LongMapFixedSize!736)

(declare-fun mapKey!3323 () (_ BitVec 32))

(declare-fun mapValue!3323 () ValueCell!914)

(assert (=> mapNonEmpty!3323 (= (arr!1900 (_values!2275 newMap!16)) (store mapRest!3323 mapKey!3323 mapValue!3323))))

(declare-fun b!80201 () Bool)

(declare-fun res!41819 () Bool)

(declare-fun e!52380 () Bool)

(assert (=> b!80201 (=> (not res!41819) (not e!52380))))

(declare-fun valid!315 (LongMapFixedSize!736) Bool)

(assert (=> b!80201 (= res!41819 (valid!315 newMap!16))))

(declare-fun b!80202 () Bool)

(declare-fun e!52387 () Bool)

(declare-fun e!52381 () Bool)

(assert (=> b!80202 (= e!52387 (and e!52381 mapRes!3323))))

(declare-fun condMapEmpty!3323 () Bool)

(declare-fun mapDefault!3323 () ValueCell!914)

