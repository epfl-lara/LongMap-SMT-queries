; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97308 () Bool)

(assert start!97308)

(declare-fun b_free!23279 () Bool)

(declare-fun b_next!23279 () Bool)

(assert (=> start!97308 (= b_free!23279 (not b_next!23279))))

(declare-fun tp!82135 () Bool)

(declare-fun b_and!37389 () Bool)

(assert (=> start!97308 (= tp!82135 b_and!37389)))

(declare-fun b!1108345 () Bool)

(declare-fun res!739674 () Bool)

(declare-fun e!632288 () Bool)

(assert (=> b!1108345 (=> (not res!739674) (not e!632288))))

(declare-datatypes ((array!71995 0))(
  ( (array!71996 (arr!34650 (Array (_ BitVec 32) (_ BitVec 64))) (size!35186 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71995)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41845 0))(
  ( (V!41846 (val!13826 Int)) )
))
(declare-datatypes ((ValueCell!13060 0))(
  ( (ValueCellFull!13060 (v!16459 V!41845)) (EmptyCell!13060) )
))
(declare-datatypes ((array!71997 0))(
  ( (array!71998 (arr!34651 (Array (_ BitVec 32) ValueCell!13060)) (size!35187 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71997)

(assert (=> b!1108345 (= res!739674 (and (= (size!35187 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35186 _keys!1208) (size!35187 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!739676 () Bool)

(assert (=> start!97308 (=> (not res!739676) (not e!632288))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97308 (= res!739676 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35186 _keys!1208))))))

(assert (=> start!97308 e!632288))

(declare-fun tp_is_empty!27539 () Bool)

(assert (=> start!97308 tp_is_empty!27539))

(declare-fun array_inv!26668 (array!71995) Bool)

(assert (=> start!97308 (array_inv!26668 _keys!1208)))

(assert (=> start!97308 true))

(assert (=> start!97308 tp!82135))

(declare-fun e!632287 () Bool)

(declare-fun array_inv!26669 (array!71997) Bool)

(assert (=> start!97308 (and (array_inv!26669 _values!996) e!632287)))

(declare-fun b!1108346 () Bool)

(declare-fun e!632283 () Bool)

(assert (=> b!1108346 (= e!632283 tp_is_empty!27539)))

(declare-fun b!1108347 () Bool)

(declare-fun e!632282 () Bool)

(assert (=> b!1108347 (= e!632282 true)))

(declare-fun e!632285 () Bool)

(assert (=> b!1108347 e!632285))

(declare-fun c!109098 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108347 (= c!109098 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!41845)

(declare-datatypes ((Unit!36378 0))(
  ( (Unit!36379) )
))
(declare-fun lt!495792 () Unit!36378)

(declare-fun defaultEntry!1004 () Int)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun minValue!944 () V!41845)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!261 (array!71995 array!71997 (_ BitVec 32) (_ BitVec 32) V!41845 V!41845 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36378)

(assert (=> b!1108347 (= lt!495792 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!261 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108348 () Bool)

(declare-fun res!739669 () Bool)

(assert (=> b!1108348 (=> (not res!739669) (not e!632288))))

(declare-datatypes ((List!24157 0))(
  ( (Nil!24154) (Cons!24153 (h!25362 (_ BitVec 64)) (t!34482 List!24157)) )
))
(declare-fun arrayNoDuplicates!0 (array!71995 (_ BitVec 32) List!24157) Bool)

(assert (=> b!1108348 (= res!739669 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24154))))

(declare-fun b!1108349 () Bool)

(declare-fun res!739671 () Bool)

(assert (=> b!1108349 (=> (not res!739671) (not e!632288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71995 (_ BitVec 32)) Bool)

(assert (=> b!1108349 (= res!739671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108350 () Bool)

(declare-fun e!632289 () Bool)

(assert (=> b!1108350 (= e!632289 tp_is_empty!27539)))

(declare-fun b!1108351 () Bool)

(declare-fun e!632284 () Bool)

(assert (=> b!1108351 (= e!632288 e!632284)))

(declare-fun res!739675 () Bool)

(assert (=> b!1108351 (=> (not res!739675) (not e!632284))))

(declare-fun lt!495793 () array!71995)

(assert (=> b!1108351 (= res!739675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495793 mask!1564))))

(assert (=> b!1108351 (= lt!495793 (array!71996 (store (arr!34650 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35186 _keys!1208)))))

(declare-fun b!1108352 () Bool)

(declare-fun res!739672 () Bool)

(assert (=> b!1108352 (=> (not res!739672) (not e!632288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108352 (= res!739672 (validMask!0 mask!1564))))

(declare-fun b!1108353 () Bool)

(declare-fun res!739678 () Bool)

(assert (=> b!1108353 (=> (not res!739678) (not e!632288))))

(assert (=> b!1108353 (= res!739678 (= (select (arr!34650 _keys!1208) i!673) k!934))))

(declare-fun b!1108354 () Bool)

(declare-fun mapRes!43126 () Bool)

(assert (=> b!1108354 (= e!632287 (and e!632283 mapRes!43126))))

(declare-fun condMapEmpty!43126 () Bool)

(declare-fun mapDefault!43126 () ValueCell!13060)

