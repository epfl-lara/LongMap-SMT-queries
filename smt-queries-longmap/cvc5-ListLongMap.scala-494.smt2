; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11112 () Bool)

(assert start!11112)

(declare-fun b!90914 () Bool)

(declare-fun b_free!2317 () Bool)

(declare-fun b_next!2317 () Bool)

(assert (=> b!90914 (= b_free!2317 (not b_next!2317))))

(declare-fun tp!9199 () Bool)

(declare-fun b_and!5499 () Bool)

(assert (=> b!90914 (= tp!9199 b_and!5499)))

(declare-fun b!90896 () Bool)

(declare-fun b_free!2319 () Bool)

(declare-fun b_next!2319 () Bool)

(assert (=> b!90896 (= b_free!2319 (not b_next!2319))))

(declare-fun tp!9201 () Bool)

(declare-fun b_and!5501 () Bool)

(assert (=> b!90896 (= tp!9201 b_and!5501)))

(declare-fun b!90895 () Bool)

(declare-fun res!46331 () Bool)

(declare-fun e!59281 () Bool)

(assert (=> b!90895 (=> res!46331 e!59281)))

(declare-fun from!355 () (_ BitVec 32))

(declare-datatypes ((V!3081 0))(
  ( (V!3082 (val!1332 Int)) )
))
(declare-datatypes ((array!4117 0))(
  ( (array!4118 (arr!1959 (Array (_ BitVec 32) (_ BitVec 64))) (size!2206 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!944 0))(
  ( (ValueCellFull!944 (v!2710 V!3081)) (EmptyCell!944) )
))
(declare-datatypes ((array!4119 0))(
  ( (array!4120 (arr!1960 (Array (_ BitVec 32) ValueCell!944)) (size!2207 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!796 0))(
  ( (LongMapFixedSize!797 (defaultEntry!2399 Int) (mask!6457 (_ BitVec 32)) (extraKeys!2230 (_ BitVec 32)) (zeroValue!2287 V!3081) (minValue!2287 V!3081) (_size!447 (_ BitVec 32)) (_keys!4079 array!4117) (_values!2382 array!4119) (_vacant!447 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!596 0))(
  ( (Cell!597 (v!2711 LongMapFixedSize!796)) )
))
(declare-datatypes ((LongMap!596 0))(
  ( (LongMap!597 (underlying!309 Cell!596)) )
))
(declare-fun thiss!992 () LongMap!596)

(assert (=> b!90895 (= res!46331 (bvsge (bvsub from!355 #b00000000000000000000000000000001) (size!2206 (_keys!4079 (v!2711 (underlying!309 thiss!992))))))))

(declare-fun e!59280 () Bool)

(declare-fun e!59284 () Bool)

(declare-fun tp_is_empty!2575 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!796)

(declare-fun array_inv!1213 (array!4117) Bool)

(declare-fun array_inv!1214 (array!4119) Bool)

(assert (=> b!90896 (= e!59280 (and tp!9201 tp_is_empty!2575 (array_inv!1213 (_keys!4079 newMap!16)) (array_inv!1214 (_values!2382 newMap!16)) e!59284))))

(declare-fun b!90897 () Bool)

(declare-fun e!59283 () Bool)

(assert (=> b!90897 (= e!59283 tp_is_empty!2575)))

(declare-fun b!90898 () Bool)

(declare-fun e!59278 () Bool)

(assert (=> b!90898 (= e!59278 (not e!59281))))

(declare-fun res!46337 () Bool)

(assert (=> b!90898 (=> res!46337 e!59281)))

(declare-datatypes ((tuple2!2250 0))(
  ( (tuple2!2251 (_1!1136 Bool) (_2!1136 LongMapFixedSize!796)) )
))
(declare-fun lt!44187 () tuple2!2250)

(declare-datatypes ((tuple2!2252 0))(
  ( (tuple2!2253 (_1!1137 (_ BitVec 64)) (_2!1137 V!3081)) )
))
(declare-datatypes ((List!1545 0))(
  ( (Nil!1542) (Cons!1541 (h!2133 tuple2!2252) (t!5363 List!1545)) )
))
(declare-datatypes ((ListLongMap!1491 0))(
  ( (ListLongMap!1492 (toList!761 List!1545)) )
))
(declare-fun getCurrentListMap!453 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) ListLongMap!1491)

(declare-fun map!1216 (LongMapFixedSize!796) ListLongMap!1491)

(assert (=> b!90898 (= res!46337 (not (= (getCurrentListMap!453 (_keys!4079 (v!2711 (underlying!309 thiss!992))) (_values!2382 (v!2711 (underlying!309 thiss!992))) (mask!6457 (v!2711 (underlying!309 thiss!992))) (extraKeys!2230 (v!2711 (underlying!309 thiss!992))) (zeroValue!2287 (v!2711 (underlying!309 thiss!992))) (minValue!2287 (v!2711 (underlying!309 thiss!992))) from!355 (defaultEntry!2399 (v!2711 (underlying!309 thiss!992)))) (map!1216 (_2!1136 lt!44187)))))))

(declare-fun lt!44172 () ListLongMap!1491)

(declare-fun lt!44182 () tuple2!2252)

(declare-fun lt!44173 () tuple2!2252)

(declare-fun lt!44171 () ListLongMap!1491)

(declare-fun +!123 (ListLongMap!1491 tuple2!2252) ListLongMap!1491)

(assert (=> b!90898 (= (+!123 lt!44171 lt!44182) (+!123 (+!123 lt!44172 lt!44182) lt!44173))))

(assert (=> b!90898 (= lt!44182 (tuple2!2253 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2711 (underlying!309 thiss!992)))))))

(declare-datatypes ((Unit!2703 0))(
  ( (Unit!2704) )
))
(declare-fun lt!44181 () Unit!2703)

(declare-fun lt!44180 () V!3081)

(declare-fun addCommutativeForDiffKeys!42 (ListLongMap!1491 (_ BitVec 64) V!3081 (_ BitVec 64) V!3081) Unit!2703)

(assert (=> b!90898 (= lt!44181 (addCommutativeForDiffKeys!42 lt!44172 (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) lt!44180 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!2287 (v!2711 (underlying!309 thiss!992)))))))

(declare-fun lt!44178 () ListLongMap!1491)

(assert (=> b!90898 (= lt!44178 lt!44171)))

(assert (=> b!90898 (= lt!44171 (+!123 lt!44172 lt!44173))))

(declare-fun lt!44183 () ListLongMap!1491)

(declare-fun lt!44186 () tuple2!2252)

(assert (=> b!90898 (= lt!44178 (+!123 lt!44183 lt!44186))))

(declare-fun lt!44184 () ListLongMap!1491)

(assert (=> b!90898 (= lt!44172 (+!123 lt!44184 lt!44186))))

(assert (=> b!90898 (= lt!44186 (tuple2!2253 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2711 (underlying!309 thiss!992)))))))

(assert (=> b!90898 (= lt!44183 (+!123 lt!44184 lt!44173))))

(assert (=> b!90898 (= lt!44173 (tuple2!2253 (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) lt!44180))))

(declare-fun lt!44170 () Unit!2703)

(assert (=> b!90898 (= lt!44170 (addCommutativeForDiffKeys!42 lt!44184 (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) lt!44180 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!2287 (v!2711 (underlying!309 thiss!992)))))))

(declare-fun getCurrentListMapNoExtraKeys!88 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 32) Int) ListLongMap!1491)

(assert (=> b!90898 (= lt!44184 (getCurrentListMapNoExtraKeys!88 (_keys!4079 (v!2711 (underlying!309 thiss!992))) (_values!2382 (v!2711 (underlying!309 thiss!992))) (mask!6457 (v!2711 (underlying!309 thiss!992))) (extraKeys!2230 (v!2711 (underlying!309 thiss!992))) (zeroValue!2287 (v!2711 (underlying!309 thiss!992))) (minValue!2287 (v!2711 (underlying!309 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2711 (underlying!309 thiss!992)))))))

(declare-fun b!90899 () Bool)

(declare-fun e!59279 () Bool)

(declare-fun e!59287 () Bool)

(assert (=> b!90899 (= e!59279 e!59287)))

(declare-fun b!90900 () Bool)

(declare-fun res!46333 () Bool)

(declare-fun e!59276 () Bool)

(assert (=> b!90900 (=> (not res!46333) (not e!59276))))

(declare-fun valid!348 (LongMapFixedSize!796) Bool)

(assert (=> b!90900 (= res!46333 (valid!348 newMap!16))))

(declare-fun b!90901 () Bool)

(declare-fun e!59273 () Bool)

(assert (=> b!90901 (= e!59273 e!59278)))

(declare-fun res!46338 () Bool)

(assert (=> b!90901 (=> (not res!46338) (not e!59278))))

(assert (=> b!90901 (= res!46338 (and (_1!1136 lt!44187) (bvsgt from!355 #b00000000000000000000000000000000)))))

(declare-fun lt!44177 () Unit!2703)

(declare-fun e!59286 () Unit!2703)

(assert (=> b!90901 (= lt!44177 e!59286)))

(declare-fun lt!44175 () ListLongMap!1491)

(declare-fun c!15083 () Bool)

(declare-fun contains!772 (ListLongMap!1491 (_ BitVec 64)) Bool)

(assert (=> b!90901 (= c!15083 (contains!772 lt!44175 (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355)))))

(declare-fun update!123 (LongMapFixedSize!796 (_ BitVec 64) V!3081) tuple2!2250)

(assert (=> b!90901 (= lt!44187 (update!123 newMap!16 (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) lt!44180))))

(declare-fun mapIsEmpty!3543 () Bool)

(declare-fun mapRes!3544 () Bool)

(assert (=> mapIsEmpty!3543 mapRes!3544))

(declare-fun b!90902 () Bool)

(assert (=> b!90902 (= e!59281 (valid!348 (_2!1136 lt!44187)))))

(declare-fun mapNonEmpty!3543 () Bool)

(declare-fun mapRes!3543 () Bool)

(declare-fun tp!9200 () Bool)

(declare-fun e!59288 () Bool)

(assert (=> mapNonEmpty!3543 (= mapRes!3543 (and tp!9200 e!59288))))

(declare-fun mapRest!3543 () (Array (_ BitVec 32) ValueCell!944))

(declare-fun mapValue!3543 () ValueCell!944)

(declare-fun mapKey!3544 () (_ BitVec 32))

(assert (=> mapNonEmpty!3543 (= (arr!1960 (_values!2382 (v!2711 (underlying!309 thiss!992)))) (store mapRest!3543 mapKey!3544 mapValue!3543))))

(declare-fun b!90903 () Bool)

(declare-fun Unit!2705 () Unit!2703)

(assert (=> b!90903 (= e!59286 Unit!2705)))

(declare-fun lt!44185 () Unit!2703)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!76 (array!4117 array!4119 (_ BitVec 32) (_ BitVec 32) V!3081 V!3081 (_ BitVec 64) (_ BitVec 32) Int) Unit!2703)

(assert (=> b!90903 (= lt!44185 (lemmaListMapContainsThenArrayContainsFrom!76 (_keys!4079 (v!2711 (underlying!309 thiss!992))) (_values!2382 (v!2711 (underlying!309 thiss!992))) (mask!6457 (v!2711 (underlying!309 thiss!992))) (extraKeys!2230 (v!2711 (underlying!309 thiss!992))) (zeroValue!2287 (v!2711 (underlying!309 thiss!992))) (minValue!2287 (v!2711 (underlying!309 thiss!992))) (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355) (defaultEntry!2399 (v!2711 (underlying!309 thiss!992)))))))

(declare-fun arrayContainsKey!0 (array!4117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!90903 (arrayContainsKey!0 (_keys!4079 (v!2711 (underlying!309 thiss!992))) (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) (bvadd #b00000000000000000000000000000001 from!355))))

(declare-fun lt!44176 () Unit!2703)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!4117 (_ BitVec 32) (_ BitVec 32)) Unit!2703)

(assert (=> b!90903 (= lt!44176 (lemmaNoDuplicateFromThenFromBigger!0 (_keys!4079 (v!2711 (underlying!309 thiss!992))) #b00000000000000000000000000000000 from!355))))

(declare-datatypes ((List!1546 0))(
  ( (Nil!1543) (Cons!1542 (h!2134 (_ BitVec 64)) (t!5364 List!1546)) )
))
(declare-fun arrayNoDuplicates!0 (array!4117 (_ BitVec 32) List!1546) Bool)

(assert (=> b!90903 (arrayNoDuplicates!0 (_keys!4079 (v!2711 (underlying!309 thiss!992))) from!355 Nil!1543)))

(declare-fun lt!44179 () Unit!2703)

(declare-fun lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (array!4117 (_ BitVec 32) (_ BitVec 64) List!1546) Unit!2703)

(assert (=> b!90903 (= lt!44179 (lemmaArrayNoDuplicateFromNotContainsKeysInAcc!0 (_keys!4079 (v!2711 (underlying!309 thiss!992))) (bvadd #b00000000000000000000000000000001 from!355) (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) (Cons!1542 (select (arr!1959 (_keys!4079 (v!2711 (underlying!309 thiss!992)))) from!355) Nil!1543)))))

(assert (=> b!90903 false))

(declare-fun b!90904 () Bool)

(declare-fun e!59275 () Bool)

(assert (=> b!90904 (= e!59275 e!59279)))

(declare-fun b!90905 () Bool)

(declare-fun e!59272 () Bool)

(assert (=> b!90905 (= e!59272 tp_is_empty!2575)))

(declare-fun mapIsEmpty!3544 () Bool)

(assert (=> mapIsEmpty!3544 mapRes!3543))

(declare-fun b!90906 () Bool)

(assert (=> b!90906 (= e!59284 (and e!59272 mapRes!3544))))

(declare-fun condMapEmpty!3544 () Bool)

(declare-fun mapDefault!3544 () ValueCell!944)

