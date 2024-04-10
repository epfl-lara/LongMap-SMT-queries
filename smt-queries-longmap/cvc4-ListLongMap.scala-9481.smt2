; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112498 () Bool)

(assert start!112498)

(declare-fun b_free!30893 () Bool)

(declare-fun b_next!30893 () Bool)

(assert (=> start!112498 (= b_free!30893 (not b_next!30893))))

(declare-fun tp!108316 () Bool)

(declare-fun b_and!49787 () Bool)

(assert (=> start!112498 (= tp!108316 b_and!49787)))

(declare-fun b!1334302 () Bool)

(declare-fun res!885545 () Bool)

(declare-fun e!759962 () Bool)

(assert (=> b!1334302 (=> (not res!885545) (not e!759962))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90472 0))(
  ( (array!90473 (arr!43702 (Array (_ BitVec 32) (_ BitVec 64))) (size!44252 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90472)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1334302 (= res!885545 (not (= (select (arr!43702 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1334303 () Bool)

(declare-fun res!885540 () Bool)

(assert (=> b!1334303 (=> (not res!885540) (not e!759962))))

(declare-datatypes ((V!54173 0))(
  ( (V!54174 (val!18476 Int)) )
))
(declare-datatypes ((ValueCell!17503 0))(
  ( (ValueCellFull!17503 (v!21113 V!54173)) (EmptyCell!17503) )
))
(declare-datatypes ((array!90474 0))(
  ( (array!90475 (arr!43703 (Array (_ BitVec 32) ValueCell!17503)) (size!44253 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90474)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun minValue!1262 () V!54173)

(declare-fun zeroValue!1262 () V!54173)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23822 0))(
  ( (tuple2!23823 (_1!11922 (_ BitVec 64)) (_2!11922 V!54173)) )
))
(declare-datatypes ((List!30962 0))(
  ( (Nil!30959) (Cons!30958 (h!32167 tuple2!23822) (t!45214 List!30962)) )
))
(declare-datatypes ((ListLongMap!21479 0))(
  ( (ListLongMap!21480 (toList!10755 List!30962)) )
))
(declare-fun contains!8919 (ListLongMap!21479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5731 (array!90472 array!90474 (_ BitVec 32) (_ BitVec 32) V!54173 V!54173 (_ BitVec 32) Int) ListLongMap!21479)

(assert (=> b!1334303 (= res!885540 (contains!8919 (getCurrentListMap!5731 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1334304 () Bool)

(declare-fun res!885547 () Bool)

(assert (=> b!1334304 (=> (not res!885547) (not e!759962))))

(declare-datatypes ((List!30963 0))(
  ( (Nil!30960) (Cons!30959 (h!32168 (_ BitVec 64)) (t!45215 List!30963)) )
))
(declare-fun arrayNoDuplicates!0 (array!90472 (_ BitVec 32) List!30963) Bool)

(assert (=> b!1334304 (= res!885547 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30960))))

(declare-fun b!1334305 () Bool)

(declare-fun res!885549 () Bool)

(assert (=> b!1334305 (=> (not res!885549) (not e!759962))))

(assert (=> b!1334305 (= res!885549 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44252 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334307 () Bool)

(declare-fun e!759961 () Bool)

(assert (=> b!1334307 (= e!759961 (not true))))

(declare-fun lt!592309 () ListLongMap!21479)

(assert (=> b!1334307 (contains!8919 lt!592309 k!1153)))

(declare-fun lt!592308 () V!54173)

(declare-datatypes ((Unit!43891 0))(
  ( (Unit!43892) )
))
(declare-fun lt!592307 () Unit!43891)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!308 ((_ BitVec 64) (_ BitVec 64) V!54173 ListLongMap!21479) Unit!43891)

(assert (=> b!1334307 (= lt!592307 (lemmaInListMapAfterAddingDiffThenInBefore!308 k!1153 (select (arr!43702 _keys!1590) from!1980) lt!592308 lt!592309))))

(declare-fun b!1334308 () Bool)

(declare-fun res!885542 () Bool)

(assert (=> b!1334308 (=> (not res!885542) (not e!759962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90472 (_ BitVec 32)) Bool)

(assert (=> b!1334308 (= res!885542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56878 () Bool)

(declare-fun mapRes!56878 () Bool)

(declare-fun tp!108315 () Bool)

(declare-fun e!759960 () Bool)

(assert (=> mapNonEmpty!56878 (= mapRes!56878 (and tp!108315 e!759960))))

(declare-fun mapRest!56878 () (Array (_ BitVec 32) ValueCell!17503))

(declare-fun mapKey!56878 () (_ BitVec 32))

(declare-fun mapValue!56878 () ValueCell!17503)

(assert (=> mapNonEmpty!56878 (= (arr!43703 _values!1320) (store mapRest!56878 mapKey!56878 mapValue!56878))))

(declare-fun b!1334309 () Bool)

(declare-fun res!885541 () Bool)

(assert (=> b!1334309 (=> (not res!885541) (not e!759961))))

(assert (=> b!1334309 (= res!885541 (not (= k!1153 (select (arr!43702 _keys!1590) from!1980))))))

(declare-fun b!1334310 () Bool)

(assert (=> b!1334310 (= e!759962 e!759961)))

(declare-fun res!885543 () Bool)

(assert (=> b!1334310 (=> (not res!885543) (not e!759961))))

(declare-fun +!4725 (ListLongMap!21479 tuple2!23822) ListLongMap!21479)

(assert (=> b!1334310 (= res!885543 (contains!8919 (+!4725 lt!592309 (tuple2!23823 (select (arr!43702 _keys!1590) from!1980) lt!592308)) k!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6363 (array!90472 array!90474 (_ BitVec 32) (_ BitVec 32) V!54173 V!54173 (_ BitVec 32) Int) ListLongMap!21479)

(assert (=> b!1334310 (= lt!592309 (getCurrentListMapNoExtraKeys!6363 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22051 (ValueCell!17503 V!54173) V!54173)

(declare-fun dynLambda!3664 (Int (_ BitVec 64)) V!54173)

(assert (=> b!1334310 (= lt!592308 (get!22051 (select (arr!43703 _values!1320) from!1980) (dynLambda!3664 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334311 () Bool)

(declare-fun res!885546 () Bool)

(assert (=> b!1334311 (=> (not res!885546) (not e!759962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334311 (= res!885546 (validKeyInArray!0 (select (arr!43702 _keys!1590) from!1980)))))

(declare-fun b!1334312 () Bool)

(declare-fun tp_is_empty!36803 () Bool)

(assert (=> b!1334312 (= e!759960 tp_is_empty!36803)))

(declare-fun b!1334313 () Bool)

(declare-fun res!885539 () Bool)

(assert (=> b!1334313 (=> (not res!885539) (not e!759962))))

(assert (=> b!1334313 (= res!885539 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!56878 () Bool)

(assert (=> mapIsEmpty!56878 mapRes!56878))

(declare-fun b!1334314 () Bool)

(declare-fun e!759963 () Bool)

(declare-fun e!759964 () Bool)

(assert (=> b!1334314 (= e!759963 (and e!759964 mapRes!56878))))

(declare-fun condMapEmpty!56878 () Bool)

(declare-fun mapDefault!56878 () ValueCell!17503)

