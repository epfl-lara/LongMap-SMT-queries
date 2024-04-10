; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97262 () Bool)

(assert start!97262)

(declare-fun b_free!23233 () Bool)

(declare-fun b_next!23233 () Bool)

(assert (=> start!97262 (= b_free!23233 (not b_next!23233))))

(declare-fun tp!81998 () Bool)

(declare-fun b_and!37297 () Bool)

(assert (=> start!97262 (= tp!81998 b_and!37297)))

(declare-fun b!1107195 () Bool)

(declare-fun res!738913 () Bool)

(declare-fun e!631734 () Bool)

(assert (=> b!1107195 (=> (not res!738913) (not e!631734))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71903 0))(
  ( (array!71904 (arr!34604 (Array (_ BitVec 32) (_ BitVec 64))) (size!35140 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71903)

(assert (=> b!1107195 (= res!738913 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35140 _keys!1208))))))

(declare-fun res!738919 () Bool)

(assert (=> start!97262 (=> (not res!738919) (not e!631734))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97262 (= res!738919 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35140 _keys!1208))))))

(assert (=> start!97262 e!631734))

(declare-fun tp_is_empty!27493 () Bool)

(assert (=> start!97262 tp_is_empty!27493))

(declare-fun array_inv!26630 (array!71903) Bool)

(assert (=> start!97262 (array_inv!26630 _keys!1208)))

(assert (=> start!97262 true))

(assert (=> start!97262 tp!81998))

(declare-datatypes ((V!41785 0))(
  ( (V!41786 (val!13803 Int)) )
))
(declare-datatypes ((ValueCell!13037 0))(
  ( (ValueCellFull!13037 (v!16436 V!41785)) (EmptyCell!13037) )
))
(declare-datatypes ((array!71905 0))(
  ( (array!71906 (arr!34605 (Array (_ BitVec 32) ValueCell!13037)) (size!35141 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71905)

(declare-fun e!631730 () Bool)

(declare-fun array_inv!26631 (array!71905) Bool)

(assert (=> start!97262 (and (array_inv!26631 _values!996) e!631730)))

(declare-fun b!1107196 () Bool)

(declare-fun e!631737 () Bool)

(assert (=> b!1107196 (= e!631737 true)))

(declare-fun e!631736 () Bool)

(assert (=> b!1107196 e!631736))

(declare-fun c!109029 () Bool)

(assert (=> b!1107196 (= c!109029 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41785)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((Unit!36336 0))(
  ( (Unit!36337) )
))
(declare-fun lt!495587 () Unit!36336)

(declare-fun minValue!944 () V!41785)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!242 (array!71903 array!71905 (_ BitVec 32) (_ BitVec 32) V!41785 V!41785 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36336)

(assert (=> b!1107196 (= lt!495587 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!242 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107197 () Bool)

(declare-datatypes ((tuple2!17430 0))(
  ( (tuple2!17431 (_1!8726 (_ BitVec 64)) (_2!8726 V!41785)) )
))
(declare-datatypes ((List!24116 0))(
  ( (Nil!24113) (Cons!24112 (h!25321 tuple2!17430) (t!34395 List!24116)) )
))
(declare-datatypes ((ListLongMap!15399 0))(
  ( (ListLongMap!15400 (toList!7715 List!24116)) )
))
(declare-fun call!46395 () ListLongMap!15399)

(declare-fun call!46396 () ListLongMap!15399)

(assert (=> b!1107197 (= e!631736 (= call!46395 call!46396))))

(declare-fun b!1107198 () Bool)

(declare-fun res!738912 () Bool)

(assert (=> b!1107198 (=> (not res!738912) (not e!631734))))

(assert (=> b!1107198 (= res!738912 (and (= (size!35141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35140 _keys!1208) (size!35141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46392 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4213 (array!71903 array!71905 (_ BitVec 32) (_ BitVec 32) V!41785 V!41785 (_ BitVec 32) Int) ListLongMap!15399)

(assert (=> bm!46392 (= call!46396 (getCurrentListMapNoExtraKeys!4213 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107199 () Bool)

(declare-fun e!631731 () Bool)

(assert (=> b!1107199 (= e!631731 (not e!631737))))

(declare-fun res!738910 () Bool)

(assert (=> b!1107199 (=> res!738910 e!631737)))

(assert (=> b!1107199 (= res!738910 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35140 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107199 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!495585 () Unit!36336)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71903 (_ BitVec 64) (_ BitVec 32)) Unit!36336)

(assert (=> b!1107199 (= lt!495585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1107200 () Bool)

(declare-fun res!738918 () Bool)

(assert (=> b!1107200 (=> (not res!738918) (not e!631734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107200 (= res!738918 (validKeyInArray!0 k!934))))

(declare-fun b!1107201 () Bool)

(declare-fun res!738915 () Bool)

(assert (=> b!1107201 (=> (not res!738915) (not e!631734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71903 (_ BitVec 32)) Bool)

(assert (=> b!1107201 (= res!738915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43057 () Bool)

(declare-fun mapRes!43057 () Bool)

(assert (=> mapIsEmpty!43057 mapRes!43057))

(declare-fun b!1107202 () Bool)

(assert (=> b!1107202 (= e!631734 e!631731)))

(declare-fun res!738911 () Bool)

(assert (=> b!1107202 (=> (not res!738911) (not e!631731))))

(declare-fun lt!495586 () array!71903)

(assert (=> b!1107202 (= res!738911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495586 mask!1564))))

(assert (=> b!1107202 (= lt!495586 (array!71904 (store (arr!34604 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35140 _keys!1208)))))

(declare-fun b!1107203 () Bool)

(declare-fun e!631735 () Bool)

(assert (=> b!1107203 (= e!631730 (and e!631735 mapRes!43057))))

(declare-fun condMapEmpty!43057 () Bool)

(declare-fun mapDefault!43057 () ValueCell!13037)

