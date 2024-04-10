; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97374 () Bool)

(assert start!97374)

(declare-fun b_free!23345 () Bool)

(declare-fun b_next!23345 () Bool)

(assert (=> start!97374 (= b_free!23345 (not b_next!23345))))

(declare-fun tp!82333 () Bool)

(declare-fun b_and!37525 () Bool)

(assert (=> start!97374 (= tp!82333 b_and!37525)))

(declare-fun b!1110019 () Bool)

(declare-fun res!740757 () Bool)

(declare-fun e!633087 () Bool)

(assert (=> b!1110019 (=> (not res!740757) (not e!633087))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110019 (= res!740757 (validMask!0 mask!1564))))

(declare-fun b!1110020 () Bool)

(declare-fun e!633089 () Bool)

(declare-fun tp_is_empty!27605 () Bool)

(assert (=> b!1110020 (= e!633089 tp_is_empty!27605)))

(declare-fun b!1110021 () Bool)

(declare-fun e!633088 () Bool)

(assert (=> b!1110021 (= e!633087 e!633088)))

(declare-fun res!740758 () Bool)

(assert (=> b!1110021 (=> (not res!740758) (not e!633088))))

(declare-datatypes ((array!72127 0))(
  ( (array!72128 (arr!34716 (Array (_ BitVec 32) (_ BitVec 64))) (size!35252 (_ BitVec 32))) )
))
(declare-fun lt!496091 () array!72127)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72127 (_ BitVec 32)) Bool)

(assert (=> b!1110021 (= res!740758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496091 mask!1564))))

(declare-fun _keys!1208 () array!72127)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110021 (= lt!496091 (array!72128 (store (arr!34716 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35252 _keys!1208)))))

(declare-datatypes ((V!41933 0))(
  ( (V!41934 (val!13859 Int)) )
))
(declare-fun zeroValue!944 () V!41933)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17524 0))(
  ( (tuple2!17525 (_1!8773 (_ BitVec 64)) (_2!8773 V!41933)) )
))
(declare-datatypes ((List!24208 0))(
  ( (Nil!24205) (Cons!24204 (h!25413 tuple2!17524) (t!34599 List!24208)) )
))
(declare-datatypes ((ListLongMap!15493 0))(
  ( (ListLongMap!15494 (toList!7762 List!24208)) )
))
(declare-fun call!46731 () ListLongMap!15493)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46728 () Bool)

(declare-datatypes ((ValueCell!13093 0))(
  ( (ValueCellFull!13093 (v!16492 V!41933)) (EmptyCell!13093) )
))
(declare-datatypes ((array!72129 0))(
  ( (array!72130 (arr!34717 (Array (_ BitVec 32) ValueCell!13093)) (size!35253 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72129)

(declare-fun minValue!944 () V!41933)

(declare-fun getCurrentListMapNoExtraKeys!4256 (array!72127 array!72129 (_ BitVec 32) (_ BitVec 32) V!41933 V!41933 (_ BitVec 32) Int) ListLongMap!15493)

(assert (=> bm!46728 (= call!46731 (getCurrentListMapNoExtraKeys!4256 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110022 () Bool)

(declare-fun e!633093 () Bool)

(assert (=> b!1110022 (= e!633093 tp_is_empty!27605)))

(declare-fun b!1110023 () Bool)

(declare-fun res!740765 () Bool)

(assert (=> b!1110023 (=> (not res!740765) (not e!633087))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1110023 (= res!740765 (= (select (arr!34716 _keys!1208) i!673) k!934))))

(declare-fun b!1110024 () Bool)

(declare-fun res!740761 () Bool)

(assert (=> b!1110024 (=> (not res!740761) (not e!633087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110024 (= res!740761 (validKeyInArray!0 k!934))))

(declare-fun b!1110026 () Bool)

(declare-fun e!633092 () Bool)

(declare-fun call!46732 () ListLongMap!15493)

(assert (=> b!1110026 (= e!633092 (= call!46732 call!46731))))

(declare-fun b!1110027 () Bool)

(declare-fun res!740763 () Bool)

(assert (=> b!1110027 (=> (not res!740763) (not e!633088))))

(declare-datatypes ((List!24209 0))(
  ( (Nil!24206) (Cons!24205 (h!25414 (_ BitVec 64)) (t!34600 List!24209)) )
))
(declare-fun arrayNoDuplicates!0 (array!72127 (_ BitVec 32) List!24209) Bool)

(assert (=> b!1110027 (= res!740763 (arrayNoDuplicates!0 lt!496091 #b00000000000000000000000000000000 Nil!24206))))

(declare-fun b!1110028 () Bool)

(declare-fun res!740759 () Bool)

(assert (=> b!1110028 (=> (not res!740759) (not e!633087))))

(assert (=> b!1110028 (= res!740759 (and (= (size!35253 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35252 _keys!1208) (size!35253 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43225 () Bool)

(declare-fun mapRes!43225 () Bool)

(declare-fun tp!82334 () Bool)

(assert (=> mapNonEmpty!43225 (= mapRes!43225 (and tp!82334 e!633093))))

(declare-fun mapValue!43225 () ValueCell!13093)

(declare-fun mapRest!43225 () (Array (_ BitVec 32) ValueCell!13093))

(declare-fun mapKey!43225 () (_ BitVec 32))

(assert (=> mapNonEmpty!43225 (= (arr!34717 _values!996) (store mapRest!43225 mapKey!43225 mapValue!43225))))

(declare-fun bm!46729 () Bool)

(declare-fun dynLambda!2384 (Int (_ BitVec 64)) V!41933)

(assert (=> bm!46729 (= call!46732 (getCurrentListMapNoExtraKeys!4256 lt!496091 (array!72130 (store (arr!34717 _values!996) i!673 (ValueCellFull!13093 (dynLambda!2384 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35253 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110029 () Bool)

(declare-fun res!740762 () Bool)

(assert (=> b!1110029 (=> (not res!740762) (not e!633087))))

(assert (=> b!1110029 (= res!740762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43225 () Bool)

(assert (=> mapIsEmpty!43225 mapRes!43225))

(declare-fun b!1110025 () Bool)

(declare-fun e!633086 () Bool)

(assert (=> b!1110025 (= e!633086 true)))

(assert (=> b!1110025 e!633092))

(declare-fun c!109209 () Bool)

(assert (=> b!1110025 (= c!109209 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36430 0))(
  ( (Unit!36431) )
))
(declare-fun lt!496090 () Unit!36430)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!284 (array!72127 array!72129 (_ BitVec 32) (_ BitVec 32) V!41933 V!41933 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36430)

(assert (=> b!1110025 (= lt!496090 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!284 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!740760 () Bool)

(assert (=> start!97374 (=> (not res!740760) (not e!633087))))

(assert (=> start!97374 (= res!740760 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35252 _keys!1208))))))

(assert (=> start!97374 e!633087))

(assert (=> start!97374 tp_is_empty!27605))

(declare-fun array_inv!26714 (array!72127) Bool)

(assert (=> start!97374 (array_inv!26714 _keys!1208)))

(assert (=> start!97374 true))

(assert (=> start!97374 tp!82333))

(declare-fun e!633090 () Bool)

(declare-fun array_inv!26715 (array!72129) Bool)

(assert (=> start!97374 (and (array_inv!26715 _values!996) e!633090)))

(declare-fun b!1110030 () Bool)

(declare-fun res!740767 () Bool)

(assert (=> b!1110030 (=> (not res!740767) (not e!633087))))

(assert (=> b!1110030 (= res!740767 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24206))))

(declare-fun b!1110031 () Bool)

(assert (=> b!1110031 (= e!633090 (and e!633089 mapRes!43225))))

(declare-fun condMapEmpty!43225 () Bool)

(declare-fun mapDefault!43225 () ValueCell!13093)

