; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132184 () Bool)

(assert start!132184)

(declare-fun b_free!31879 () Bool)

(declare-fun b_next!31879 () Bool)

(assert (=> start!132184 (= b_free!31879 (not b_next!31879))))

(declare-fun tp!111891 () Bool)

(declare-fun b_and!51305 () Bool)

(assert (=> start!132184 (= tp!111891 b_and!51305)))

(declare-fun mapNonEmpty!58939 () Bool)

(declare-fun mapRes!58939 () Bool)

(declare-fun tp!111892 () Bool)

(declare-fun e!863252 () Bool)

(assert (=> mapNonEmpty!58939 (= mapRes!58939 (and tp!111892 e!863252))))

(declare-datatypes ((V!59317 0))(
  ( (V!59318 (val!19155 Int)) )
))
(declare-datatypes ((ValueCell!18167 0))(
  ( (ValueCellFull!18167 (v!21957 V!59317)) (EmptyCell!18167) )
))
(declare-fun mapRest!58939 () (Array (_ BitVec 32) ValueCell!18167))

(declare-fun mapValue!58939 () ValueCell!18167)

(declare-fun mapKey!58939 () (_ BitVec 32))

(declare-datatypes ((array!103508 0))(
  ( (array!103509 (arr!49955 (Array (_ BitVec 32) ValueCell!18167)) (size!50505 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103508)

(assert (=> mapNonEmpty!58939 (= (arr!49955 _values!470) (store mapRest!58939 mapKey!58939 mapValue!58939))))

(declare-datatypes ((array!103510 0))(
  ( (array!103511 (arr!49956 (Array (_ BitVec 32) (_ BitVec 64))) (size!50506 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103510)

(declare-fun zeroValue!436 () V!59317)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-datatypes ((tuple2!24688 0))(
  ( (tuple2!24689 (_1!12355 (_ BitVec 64)) (_2!12355 V!59317)) )
))
(declare-datatypes ((List!36167 0))(
  ( (Nil!36164) (Cons!36163 (h!37608 tuple2!24688) (t!50875 List!36167)) )
))
(declare-datatypes ((ListLongMap!22297 0))(
  ( (ListLongMap!22298 (toList!11164 List!36167)) )
))
(declare-fun call!70841 () ListLongMap!22297)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun minValue!436 () V!59317)

(declare-fun bm!70835 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6613 (array!103510 array!103508 (_ BitVec 32) (_ BitVec 32) V!59317 V!59317 (_ BitVec 32) Int) ListLongMap!22297)

(assert (=> bm!70835 (= call!70841 (getCurrentListMapNoExtraKeys!6613 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550767 () Bool)

(declare-fun res!1062130 () Bool)

(declare-fun e!863251 () Bool)

(assert (=> b!1550767 (=> (not res!1062130) (not e!863251))))

(declare-datatypes ((List!36168 0))(
  ( (Nil!36165) (Cons!36164 (h!37609 (_ BitVec 64)) (t!50876 List!36168)) )
))
(declare-fun arrayNoDuplicates!0 (array!103510 (_ BitVec 32) List!36168) Bool)

(assert (=> b!1550767 (= res!1062130 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36165))))

(declare-fun b!1550768 () Bool)

(declare-fun c!142643 () Bool)

(declare-fun lt!668386 () Bool)

(assert (=> b!1550768 (= c!142643 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668386))))

(declare-fun e!863249 () ListLongMap!22297)

(declare-fun e!863256 () ListLongMap!22297)

(assert (=> b!1550768 (= e!863249 e!863256)))

(declare-fun bm!70836 () Bool)

(declare-fun call!70838 () ListLongMap!22297)

(assert (=> bm!70836 (= call!70838 call!70841)))

(declare-fun b!1550769 () Bool)

(declare-fun call!70840 () ListLongMap!22297)

(assert (=> b!1550769 (= e!863256 call!70840)))

(declare-fun b!1550770 () Bool)

(declare-fun call!70842 () ListLongMap!22297)

(assert (=> b!1550770 (= e!863256 call!70842)))

(declare-fun b!1550771 () Bool)

(declare-fun e!863250 () Bool)

(declare-fun e!863254 () Bool)

(assert (=> b!1550771 (= e!863250 (not e!863254))))

(declare-fun res!1062132 () Bool)

(assert (=> b!1550771 (=> (not res!1062132) (not e!863254))))

(declare-fun lt!668388 () ListLongMap!22297)

(declare-fun contains!10105 (ListLongMap!22297 (_ BitVec 64)) Bool)

(assert (=> b!1550771 (= res!1062132 (contains!10105 lt!668388 (select (arr!49956 _keys!618) from!762)))))

(declare-fun +!4986 (ListLongMap!22297 tuple2!24688) ListLongMap!22297)

(assert (=> b!1550771 (contains!10105 (+!4986 lt!668388 (tuple2!24689 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49956 _keys!618) from!762))))

(declare-datatypes ((Unit!51652 0))(
  ( (Unit!51653) )
))
(declare-fun lt!668387 () Unit!51652)

(declare-fun addStillContains!1287 (ListLongMap!22297 (_ BitVec 64) V!59317 (_ BitVec 64)) Unit!51652)

(assert (=> b!1550771 (= lt!668387 (addStillContains!1287 lt!668388 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49956 _keys!618) from!762)))))

(assert (=> b!1550771 (= lt!668388 (getCurrentListMapNoExtraKeys!6613 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun b!1550772 () Bool)

(assert (=> b!1550772 (= e!863249 call!70842)))

(declare-fun b!1550773 () Bool)

(declare-fun e!863255 () Bool)

(declare-fun e!863253 () Bool)

(assert (=> b!1550773 (= e!863255 (and e!863253 mapRes!58939))))

(declare-fun condMapEmpty!58939 () Bool)

(declare-fun mapDefault!58939 () ValueCell!18167)

