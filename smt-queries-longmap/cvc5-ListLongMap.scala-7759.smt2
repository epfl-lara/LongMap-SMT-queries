; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97298 () Bool)

(assert start!97298)

(declare-fun b_free!23269 () Bool)

(declare-fun b_next!23269 () Bool)

(assert (=> start!97298 (= b_free!23269 (not b_next!23269))))

(declare-fun tp!82105 () Bool)

(declare-fun b_and!37369 () Bool)

(assert (=> start!97298 (= tp!82105 b_and!37369)))

(declare-fun b!1108095 () Bool)

(declare-fun e!632167 () Bool)

(assert (=> b!1108095 (= e!632167 true)))

(declare-fun e!632168 () Bool)

(assert (=> b!1108095 e!632168))

(declare-fun c!109083 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108095 (= c!109083 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!41833 0))(
  ( (V!41834 (val!13821 Int)) )
))
(declare-fun zeroValue!944 () V!41833)

(declare-datatypes ((array!71975 0))(
  ( (array!71976 (arr!34640 (Array (_ BitVec 32) (_ BitVec 64))) (size!35176 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71975)

(declare-datatypes ((Unit!36370 0))(
  ( (Unit!36371) )
))
(declare-fun lt!495747 () Unit!36370)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13055 0))(
  ( (ValueCellFull!13055 (v!16454 V!41833)) (EmptyCell!13055) )
))
(declare-datatypes ((array!71977 0))(
  ( (array!71978 (arr!34641 (Array (_ BitVec 32) ValueCell!13055)) (size!35177 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71977)

(declare-fun minValue!944 () V!41833)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!257 (array!71975 array!71977 (_ BitVec 32) (_ BitVec 32) V!41833 V!41833 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36370)

(assert (=> b!1108095 (= lt!495747 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!257 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108096 () Bool)

(declare-fun e!632169 () Bool)

(assert (=> b!1108096 (= e!632169 (not e!632167))))

(declare-fun res!739509 () Bool)

(assert (=> b!1108096 (=> res!739509 e!632167)))

(assert (=> b!1108096 (= res!739509 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35176 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108096 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!495749 () Unit!36370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71975 (_ BitVec 64) (_ BitVec 32)) Unit!36370)

(assert (=> b!1108096 (= lt!495749 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun res!739503 () Bool)

(declare-fun e!632163 () Bool)

(assert (=> start!97298 (=> (not res!739503) (not e!632163))))

(assert (=> start!97298 (= res!739503 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35176 _keys!1208))))))

(assert (=> start!97298 e!632163))

(declare-fun tp_is_empty!27529 () Bool)

(assert (=> start!97298 tp_is_empty!27529))

(declare-fun array_inv!26658 (array!71975) Bool)

(assert (=> start!97298 (array_inv!26658 _keys!1208)))

(assert (=> start!97298 true))

(assert (=> start!97298 tp!82105))

(declare-fun e!632162 () Bool)

(declare-fun array_inv!26659 (array!71977) Bool)

(assert (=> start!97298 (and (array_inv!26659 _values!996) e!632162)))

(declare-fun bm!46500 () Bool)

(declare-datatypes ((tuple2!17466 0))(
  ( (tuple2!17467 (_1!8744 (_ BitVec 64)) (_2!8744 V!41833)) )
))
(declare-datatypes ((List!24150 0))(
  ( (Nil!24147) (Cons!24146 (h!25355 tuple2!17466) (t!34465 List!24150)) )
))
(declare-datatypes ((ListLongMap!15435 0))(
  ( (ListLongMap!15436 (toList!7733 List!24150)) )
))
(declare-fun call!46504 () ListLongMap!15435)

(declare-fun lt!495748 () array!71975)

(declare-fun getCurrentListMapNoExtraKeys!4229 (array!71975 array!71977 (_ BitVec 32) (_ BitVec 32) V!41833 V!41833 (_ BitVec 32) Int) ListLongMap!15435)

(declare-fun dynLambda!2361 (Int (_ BitVec 64)) V!41833)

(assert (=> bm!46500 (= call!46504 (getCurrentListMapNoExtraKeys!4229 lt!495748 (array!71978 (store (arr!34641 _values!996) i!673 (ValueCellFull!13055 (dynLambda!2361 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35177 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108097 () Bool)

(declare-fun e!632166 () Bool)

(assert (=> b!1108097 (= e!632166 tp_is_empty!27529)))

(declare-fun b!1108098 () Bool)

(declare-fun e!632165 () Bool)

(declare-fun mapRes!43111 () Bool)

(assert (=> b!1108098 (= e!632162 (and e!632165 mapRes!43111))))

(declare-fun condMapEmpty!43111 () Bool)

(declare-fun mapDefault!43111 () ValueCell!13055)

