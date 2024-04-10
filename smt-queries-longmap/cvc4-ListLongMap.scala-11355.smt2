; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!132038 () Bool)

(assert start!132038)

(declare-fun b_free!31751 () Bool)

(declare-fun b_next!31751 () Bool)

(assert (=> start!132038 (= b_free!31751 (not b_next!31751))))

(declare-fun tp!111505 () Bool)

(declare-fun b_and!51161 () Bool)

(assert (=> start!132038 (= tp!111505 b_and!51161)))

(declare-fun b!1547465 () Bool)

(declare-datatypes ((V!59145 0))(
  ( (V!59146 (val!19091 Int)) )
))
(declare-datatypes ((tuple2!24562 0))(
  ( (tuple2!24563 (_1!12292 (_ BitVec 64)) (_2!12292 V!59145)) )
))
(declare-datatypes ((List!36060 0))(
  ( (Nil!36057) (Cons!36056 (h!37501 tuple2!24562) (t!50754 List!36060)) )
))
(declare-datatypes ((ListLongMap!22171 0))(
  ( (ListLongMap!22172 (toList!11101 List!36060)) )
))
(declare-fun e!861361 () ListLongMap!22171)

(declare-fun call!69860 () ListLongMap!22171)

(declare-fun minValue!436 () V!59145)

(declare-fun +!4932 (ListLongMap!22171 tuple2!24562) ListLongMap!22171)

(assert (=> b!1547465 (= e!861361 (+!4932 call!69860 (tuple2!24563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1547466 () Bool)

(declare-fun res!1060698 () Bool)

(declare-fun e!861364 () Bool)

(assert (=> b!1547466 (=> (not res!1060698) (not e!861364))))

(declare-datatypes ((array!103254 0))(
  ( (array!103255 (arr!49829 (Array (_ BitVec 32) (_ BitVec 64))) (size!50379 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103254)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18103 0))(
  ( (ValueCellFull!18103 (v!21892 V!59145)) (EmptyCell!18103) )
))
(declare-datatypes ((array!103256 0))(
  ( (array!103257 (arr!49830 (Array (_ BitVec 32) ValueCell!18103)) (size!50380 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103256)

(assert (=> b!1547466 (= res!1060698 (and (= (size!50380 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50379 _keys!618) (size!50380 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1547467 () Bool)

(declare-fun res!1060692 () Bool)

(declare-fun e!861368 () Bool)

(assert (=> b!1547467 (=> (not res!1060692) (not e!861368))))

(declare-fun from!762 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1547467 (= res!1060692 (validKeyInArray!0 (select (arr!49829 _keys!618) from!762)))))

(declare-fun b!1547468 () Bool)

(declare-fun res!1060693 () Bool)

(assert (=> b!1547468 (=> (not res!1060693) (not e!861364))))

(declare-datatypes ((List!36061 0))(
  ( (Nil!36058) (Cons!36057 (h!37502 (_ BitVec 64)) (t!50755 List!36061)) )
))
(declare-fun arrayNoDuplicates!0 (array!103254 (_ BitVec 32) List!36061) Bool)

(assert (=> b!1547468 (= res!1060693 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36058))))

(declare-fun b!1547469 () Bool)

(assert (=> b!1547469 (= e!861364 e!861368)))

(declare-fun res!1060697 () Bool)

(assert (=> b!1547469 (=> (not res!1060697) (not e!861368))))

(assert (=> b!1547469 (= res!1060697 (bvslt from!762 (size!50379 _keys!618)))))

(declare-fun lt!666887 () ListLongMap!22171)

(assert (=> b!1547469 (= lt!666887 e!861361)))

(declare-fun c!142010 () Bool)

(declare-fun lt!666884 () Bool)

(assert (=> b!1547469 (= c!142010 (and (not lt!666884) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1547469 (= lt!666884 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1547470 () Bool)

(assert (=> b!1547470 (= e!861368 (not true))))

(declare-fun lt!666883 () ListLongMap!22171)

(declare-fun apply!1053 (ListLongMap!22171 (_ BitVec 64)) V!59145)

(assert (=> b!1547470 (= (apply!1053 (+!4932 lt!666883 (tuple2!24563 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49829 _keys!618) from!762)) (apply!1053 lt!666883 (select (arr!49829 _keys!618) from!762)))))

(declare-datatypes ((Unit!51556 0))(
  ( (Unit!51557) )
))
(declare-fun lt!666885 () Unit!51556)

(declare-fun addApplyDifferent!595 (ListLongMap!22171 (_ BitVec 64) V!59145 (_ BitVec 64)) Unit!51556)

(assert (=> b!1547470 (= lt!666885 (addApplyDifferent!595 lt!666883 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49829 _keys!618) from!762)))))

(declare-fun zeroValue!436 () V!59145)

(declare-fun contains!10060 (ListLongMap!22171 (_ BitVec 64)) Bool)

(assert (=> b!1547470 (contains!10060 (+!4932 lt!666883 (tuple2!24563 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)) (select (arr!49829 _keys!618) from!762))))

(declare-fun lt!666886 () Unit!51556)

(declare-fun addStillContains!1248 (ListLongMap!22171 (_ BitVec 64) V!59145 (_ BitVec 64)) Unit!51556)

(assert (=> b!1547470 (= lt!666886 (addStillContains!1248 lt!666883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49829 _keys!618) from!762)))))

(declare-fun defaultEntry!478 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6561 (array!103254 array!103256 (_ BitVec 32) (_ BitVec 32) V!59145 V!59145 (_ BitVec 32) Int) ListLongMap!22171)

(assert (=> b!1547470 (= lt!666883 (getCurrentListMapNoExtraKeys!6561 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!69857 () Bool)

(declare-fun call!69862 () ListLongMap!22171)

(declare-fun call!69861 () ListLongMap!22171)

(assert (=> bm!69857 (= call!69862 call!69861)))

(declare-fun b!1547471 () Bool)

(declare-fun e!861362 () Bool)

(declare-fun e!861367 () Bool)

(declare-fun mapRes!58744 () Bool)

(assert (=> b!1547471 (= e!861362 (and e!861367 mapRes!58744))))

(declare-fun condMapEmpty!58744 () Bool)

(declare-fun mapDefault!58744 () ValueCell!18103)

