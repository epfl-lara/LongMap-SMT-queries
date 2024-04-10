; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131992 () Bool)

(assert start!131992)

(declare-fun b_free!31705 () Bool)

(declare-fun b_next!31705 () Bool)

(assert (=> start!131992 (= b_free!31705 (not b_next!31705))))

(declare-fun tp!111367 () Bool)

(declare-fun b_and!51115 () Bool)

(assert (=> start!131992 (= tp!111367 b_and!51115)))

(declare-fun b!1546361 () Bool)

(declare-fun res!1060212 () Bool)

(declare-fun e!860748 () Bool)

(assert (=> b!1546361 (=> (not res!1060212) (not e!860748))))

(declare-datatypes ((array!103168 0))(
  ( (array!103169 (arr!49786 (Array (_ BitVec 32) (_ BitVec 64))) (size!50336 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103168)

(declare-datatypes ((List!36025 0))(
  ( (Nil!36022) (Cons!36021 (h!37466 (_ BitVec 64)) (t!50719 List!36025)) )
))
(declare-fun arrayNoDuplicates!0 (array!103168 (_ BitVec 32) List!36025) Bool)

(assert (=> b!1546361 (= res!1060212 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36022))))

(declare-fun bm!69512 () Bool)

(declare-datatypes ((V!59085 0))(
  ( (V!59086 (val!19068 Int)) )
))
(declare-datatypes ((tuple2!24518 0))(
  ( (tuple2!24519 (_1!12270 (_ BitVec 64)) (_2!12270 V!59085)) )
))
(declare-datatypes ((List!36026 0))(
  ( (Nil!36023) (Cons!36022 (h!37467 tuple2!24518) (t!50720 List!36026)) )
))
(declare-datatypes ((ListLongMap!22127 0))(
  ( (ListLongMap!22128 (toList!11079 List!36026)) )
))
(declare-fun call!69515 () ListLongMap!22127)

(declare-fun call!69518 () ListLongMap!22127)

(assert (=> bm!69512 (= call!69515 call!69518)))

(declare-fun b!1546362 () Bool)

(declare-fun res!1060215 () Bool)

(assert (=> b!1546362 (=> (not res!1060215) (not e!860748))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18080 0))(
  ( (ValueCellFull!18080 (v!21869 V!59085)) (EmptyCell!18080) )
))
(declare-datatypes ((array!103170 0))(
  ( (array!103171 (arr!49787 (Array (_ BitVec 32) ValueCell!18080)) (size!50337 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103170)

(assert (=> b!1546362 (= res!1060215 (and (= (size!50337 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50336 _keys!618) (size!50337 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun res!1060210 () Bool)

(assert (=> start!131992 (=> (not res!1060210) (not e!860748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131992 (= res!1060210 (validMask!0 mask!926))))

(assert (=> start!131992 e!860748))

(declare-fun array_inv!38723 (array!103168) Bool)

(assert (=> start!131992 (array_inv!38723 _keys!618)))

(declare-fun tp_is_empty!37981 () Bool)

(assert (=> start!131992 tp_is_empty!37981))

(assert (=> start!131992 true))

(assert (=> start!131992 tp!111367))

(declare-fun e!860741 () Bool)

(declare-fun array_inv!38724 (array!103170) Bool)

(assert (=> start!131992 (and (array_inv!38724 _values!470) e!860741)))

(declare-fun b!1546363 () Bool)

(declare-fun e!860745 () ListLongMap!22127)

(assert (=> b!1546363 (= e!860745 call!69515)))

(declare-fun b!1546364 () Bool)

(declare-fun c!141802 () Bool)

(declare-fun lt!666545 () Bool)

(assert (=> b!1546364 (= c!141802 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!666545))))

(declare-fun e!860740 () ListLongMap!22127)

(assert (=> b!1546364 (= e!860740 e!860745)))

(declare-fun c!141803 () Bool)

(declare-fun minValue!436 () V!59085)

(declare-fun c!141801 () Bool)

(declare-fun zeroValue!436 () V!59085)

(declare-fun bm!69513 () Bool)

(declare-fun call!69517 () ListLongMap!22127)

(declare-fun call!69516 () ListLongMap!22127)

(declare-fun +!4914 (ListLongMap!22127 tuple2!24518) ListLongMap!22127)

(assert (=> bm!69513 (= call!69517 (+!4914 (ite c!141801 call!69516 (ite c!141803 call!69518 call!69515)) (ite (or c!141801 c!141803) (tuple2!24519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24519 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1546365 () Bool)

(declare-fun e!860746 () Bool)

(assert (=> b!1546365 (= e!860746 (not true))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun lt!666546 () ListLongMap!22127)

(declare-fun contains!10046 (ListLongMap!22127 (_ BitVec 64)) Bool)

(assert (=> b!1546365 (contains!10046 (+!4914 lt!666546 (tuple2!24519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49786 _keys!618) from!762))))

(declare-datatypes ((Unit!51528 0))(
  ( (Unit!51529) )
))
(declare-fun lt!666547 () Unit!51528)

(declare-fun addStillContains!1234 (ListLongMap!22127 (_ BitVec 64) V!59085 (_ BitVec 64)) Unit!51528)

(assert (=> b!1546365 (= lt!666547 (addStillContains!1234 lt!666546 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49786 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6545 (array!103168 array!103170 (_ BitVec 32) (_ BitVec 32) V!59085 V!59085 (_ BitVec 32) Int) ListLongMap!22127)

(assert (=> b!1546365 (= lt!666546 (getCurrentListMapNoExtraKeys!6545 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69514 () Bool)

(assert (=> bm!69514 (= call!69516 (getCurrentListMapNoExtraKeys!6545 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1546366 () Bool)

(declare-fun res!1060213 () Bool)

(assert (=> b!1546366 (=> (not res!1060213) (not e!860748))))

(assert (=> b!1546366 (= res!1060213 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50336 _keys!618))))))

(declare-fun bm!69515 () Bool)

(assert (=> bm!69515 (= call!69518 call!69516)))

(declare-fun b!1546367 () Bool)

(declare-fun call!69519 () ListLongMap!22127)

(assert (=> b!1546367 (= e!860740 call!69519)))

(declare-fun mapIsEmpty!58675 () Bool)

(declare-fun mapRes!58675 () Bool)

(assert (=> mapIsEmpty!58675 mapRes!58675))

(declare-fun b!1546368 () Bool)

(declare-fun e!860744 () Bool)

(assert (=> b!1546368 (= e!860741 (and e!860744 mapRes!58675))))

(declare-fun condMapEmpty!58675 () Bool)

(declare-fun mapDefault!58675 () ValueCell!18080)

