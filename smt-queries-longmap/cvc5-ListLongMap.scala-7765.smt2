; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97334 () Bool)

(assert start!97334)

(declare-fun b_free!23305 () Bool)

(declare-fun b_next!23305 () Bool)

(assert (=> start!97334 (= b_free!23305 (not b_next!23305))))

(declare-fun tp!82214 () Bool)

(declare-fun b_and!37445 () Bool)

(assert (=> start!97334 (= tp!82214 b_and!37445)))

(declare-fun b!1109019 () Bool)

(declare-fun res!740106 () Bool)

(declare-fun e!632609 () Bool)

(assert (=> b!1109019 (=> (not res!740106) (not e!632609))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109019 (= res!740106 (validKeyInArray!0 k!934))))

(declare-fun b!1109020 () Bool)

(declare-fun res!740104 () Bool)

(assert (=> b!1109020 (=> (not res!740104) (not e!632609))))

(declare-datatypes ((array!72047 0))(
  ( (array!72048 (arr!34676 (Array (_ BitVec 32) (_ BitVec 64))) (size!35212 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72047)

(declare-datatypes ((List!24175 0))(
  ( (Nil!24172) (Cons!24171 (h!25380 (_ BitVec 64)) (t!34526 List!24175)) )
))
(declare-fun arrayNoDuplicates!0 (array!72047 (_ BitVec 32) List!24175) Bool)

(assert (=> b!1109020 (= res!740104 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24172))))

(declare-fun b!1109021 () Bool)

(declare-fun res!740107 () Bool)

(assert (=> b!1109021 (=> (not res!740107) (not e!632609))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72047 (_ BitVec 32)) Bool)

(assert (=> b!1109021 (= res!740107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43165 () Bool)

(declare-fun mapRes!43165 () Bool)

(assert (=> mapIsEmpty!43165 mapRes!43165))

(declare-fun b!1109022 () Bool)

(declare-fun res!740097 () Bool)

(assert (=> b!1109022 (=> (not res!740097) (not e!632609))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109022 (= res!740097 (= (select (arr!34676 _keys!1208) i!673) k!934))))

(declare-fun b!1109023 () Bool)

(declare-fun res!740098 () Bool)

(assert (=> b!1109023 (=> (not res!740098) (not e!632609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109023 (= res!740098 (validMask!0 mask!1564))))

(declare-fun b!1109024 () Bool)

(declare-fun e!632608 () Bool)

(declare-fun e!632611 () Bool)

(assert (=> b!1109024 (= e!632608 (not e!632611))))

(declare-fun res!740105 () Bool)

(assert (=> b!1109024 (=> res!740105 e!632611)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109024 (= res!740105 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35212 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109024 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36396 0))(
  ( (Unit!36397) )
))
(declare-fun lt!495910 () Unit!36396)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72047 (_ BitVec 64) (_ BitVec 32)) Unit!36396)

(assert (=> b!1109024 (= lt!495910 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!740099 () Bool)

(assert (=> start!97334 (=> (not res!740099) (not e!632609))))

(assert (=> start!97334 (= res!740099 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35212 _keys!1208))))))

(assert (=> start!97334 e!632609))

(declare-fun tp_is_empty!27565 () Bool)

(assert (=> start!97334 tp_is_empty!27565))

(declare-fun array_inv!26686 (array!72047) Bool)

(assert (=> start!97334 (array_inv!26686 _keys!1208)))

(assert (=> start!97334 true))

(assert (=> start!97334 tp!82214))

(declare-datatypes ((V!41881 0))(
  ( (V!41882 (val!13839 Int)) )
))
(declare-datatypes ((ValueCell!13073 0))(
  ( (ValueCellFull!13073 (v!16472 V!41881)) (EmptyCell!13073) )
))
(declare-datatypes ((array!72049 0))(
  ( (array!72050 (arr!34677 (Array (_ BitVec 32) ValueCell!13073)) (size!35213 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72049)

(declare-fun e!632607 () Bool)

(declare-fun array_inv!26687 (array!72049) Bool)

(assert (=> start!97334 (and (array_inv!26687 _values!996) e!632607)))

(declare-fun b!1109025 () Bool)

(declare-fun e!632610 () Bool)

(assert (=> b!1109025 (= e!632610 tp_is_empty!27565)))

(declare-fun zeroValue!944 () V!41881)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17492 0))(
  ( (tuple2!17493 (_1!8757 (_ BitVec 64)) (_2!8757 V!41881)) )
))
(declare-datatypes ((List!24176 0))(
  ( (Nil!24173) (Cons!24172 (h!25381 tuple2!17492) (t!34527 List!24176)) )
))
(declare-datatypes ((ListLongMap!15461 0))(
  ( (ListLongMap!15462 (toList!7746 List!24176)) )
))
(declare-fun call!46611 () ListLongMap!15461)

(declare-fun minValue!944 () V!41881)

(declare-fun bm!46608 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4240 (array!72047 array!72049 (_ BitVec 32) (_ BitVec 32) V!41881 V!41881 (_ BitVec 32) Int) ListLongMap!15461)

(assert (=> bm!46608 (= call!46611 (getCurrentListMapNoExtraKeys!4240 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109026 () Bool)

(declare-fun res!740103 () Bool)

(assert (=> b!1109026 (=> (not res!740103) (not e!632609))))

(assert (=> b!1109026 (= res!740103 (and (= (size!35213 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35212 _keys!1208) (size!35213 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109027 () Bool)

(assert (=> b!1109027 (= e!632609 e!632608)))

(declare-fun res!740100 () Bool)

(assert (=> b!1109027 (=> (not res!740100) (not e!632608))))

(declare-fun lt!495909 () array!72047)

(assert (=> b!1109027 (= res!740100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495909 mask!1564))))

(assert (=> b!1109027 (= lt!495909 (array!72048 (store (arr!34676 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35212 _keys!1208)))))

(declare-fun b!1109028 () Bool)

(declare-fun e!632613 () Bool)

(declare-fun call!46612 () ListLongMap!15461)

(assert (=> b!1109028 (= e!632613 (= call!46612 call!46611))))

(declare-fun b!1109029 () Bool)

(assert (=> b!1109029 (= e!632607 (and e!632610 mapRes!43165))))

(declare-fun condMapEmpty!43165 () Bool)

(declare-fun mapDefault!43165 () ValueCell!13073)

