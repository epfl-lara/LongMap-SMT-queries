; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97268 () Bool)

(assert start!97268)

(declare-fun b_free!23239 () Bool)

(declare-fun b_next!23239 () Bool)

(assert (=> start!97268 (= b_free!23239 (not b_next!23239))))

(declare-fun tp!82016 () Bool)

(declare-fun b_and!37309 () Bool)

(assert (=> start!97268 (= tp!82016 b_and!37309)))

(declare-fun res!739008 () Bool)

(declare-fun e!631809 () Bool)

(assert (=> start!97268 (=> (not res!739008) (not e!631809))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71915 0))(
  ( (array!71916 (arr!34610 (Array (_ BitVec 32) (_ BitVec 64))) (size!35146 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71915)

(assert (=> start!97268 (= res!739008 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35146 _keys!1208))))))

(assert (=> start!97268 e!631809))

(declare-fun tp_is_empty!27499 () Bool)

(assert (=> start!97268 tp_is_empty!27499))

(declare-fun array_inv!26636 (array!71915) Bool)

(assert (=> start!97268 (array_inv!26636 _keys!1208)))

(assert (=> start!97268 true))

(assert (=> start!97268 tp!82016))

(declare-datatypes ((V!41793 0))(
  ( (V!41794 (val!13806 Int)) )
))
(declare-datatypes ((ValueCell!13040 0))(
  ( (ValueCellFull!13040 (v!16439 V!41793)) (EmptyCell!13040) )
))
(declare-datatypes ((array!71917 0))(
  ( (array!71918 (arr!34611 (Array (_ BitVec 32) ValueCell!13040)) (size!35147 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71917)

(declare-fun e!631807 () Bool)

(declare-fun array_inv!26637 (array!71917) Bool)

(assert (=> start!97268 (and (array_inv!26637 _values!996) e!631807)))

(declare-fun b!1107345 () Bool)

(declare-fun res!739015 () Bool)

(declare-fun e!631804 () Bool)

(assert (=> b!1107345 (=> (not res!739015) (not e!631804))))

(declare-fun lt!495614 () array!71915)

(declare-datatypes ((List!24121 0))(
  ( (Nil!24118) (Cons!24117 (h!25326 (_ BitVec 64)) (t!34406 List!24121)) )
))
(declare-fun arrayNoDuplicates!0 (array!71915 (_ BitVec 32) List!24121) Bool)

(assert (=> b!1107345 (= res!739015 (arrayNoDuplicates!0 lt!495614 #b00000000000000000000000000000000 Nil!24118))))

(declare-fun b!1107346 () Bool)

(declare-fun res!739017 () Bool)

(assert (=> b!1107346 (=> (not res!739017) (not e!631809))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1107346 (= res!739017 (validKeyInArray!0 k!934))))

(declare-fun b!1107347 () Bool)

(assert (=> b!1107347 (= e!631809 e!631804)))

(declare-fun res!739016 () Bool)

(assert (=> b!1107347 (=> (not res!739016) (not e!631804))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71915 (_ BitVec 32)) Bool)

(assert (=> b!1107347 (= res!739016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495614 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1107347 (= lt!495614 (array!71916 (store (arr!34610 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35146 _keys!1208)))))

(declare-fun zeroValue!944 () V!41793)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17436 0))(
  ( (tuple2!17437 (_1!8729 (_ BitVec 64)) (_2!8729 V!41793)) )
))
(declare-datatypes ((List!24122 0))(
  ( (Nil!24119) (Cons!24118 (h!25327 tuple2!17436) (t!34407 List!24122)) )
))
(declare-datatypes ((ListLongMap!15405 0))(
  ( (ListLongMap!15406 (toList!7718 List!24122)) )
))
(declare-fun call!46413 () ListLongMap!15405)

(declare-fun bm!46410 () Bool)

(declare-fun minValue!944 () V!41793)

(declare-fun getCurrentListMapNoExtraKeys!4216 (array!71915 array!71917 (_ BitVec 32) (_ BitVec 32) V!41793 V!41793 (_ BitVec 32) Int) ListLongMap!15405)

(assert (=> bm!46410 (= call!46413 (getCurrentListMapNoExtraKeys!4216 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107348 () Bool)

(declare-fun res!739011 () Bool)

(assert (=> b!1107348 (=> (not res!739011) (not e!631809))))

(assert (=> b!1107348 (= res!739011 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24118))))

(declare-fun b!1107349 () Bool)

(declare-fun e!631806 () Bool)

(assert (=> b!1107349 (= e!631806 tp_is_empty!27499)))

(declare-fun b!1107350 () Bool)

(declare-fun res!739009 () Bool)

(assert (=> b!1107350 (=> (not res!739009) (not e!631809))))

(assert (=> b!1107350 (= res!739009 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35146 _keys!1208))))))

(declare-fun mapIsEmpty!43066 () Bool)

(declare-fun mapRes!43066 () Bool)

(assert (=> mapIsEmpty!43066 mapRes!43066))

(declare-fun b!1107351 () Bool)

(declare-fun e!631805 () Bool)

(declare-fun call!46414 () ListLongMap!15405)

(assert (=> b!1107351 (= e!631805 (= call!46414 call!46413))))

(declare-fun b!1107352 () Bool)

(declare-fun -!999 (ListLongMap!15405 (_ BitVec 64)) ListLongMap!15405)

(assert (=> b!1107352 (= e!631805 (= call!46414 (-!999 call!46413 k!934)))))

(declare-fun b!1107353 () Bool)

(declare-fun e!631802 () Bool)

(assert (=> b!1107353 (= e!631804 (not e!631802))))

(declare-fun res!739013 () Bool)

(assert (=> b!1107353 (=> res!739013 e!631802)))

(assert (=> b!1107353 (= res!739013 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35146 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!71915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1107353 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36342 0))(
  ( (Unit!36343) )
))
(declare-fun lt!495613 () Unit!36342)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71915 (_ BitVec 64) (_ BitVec 32)) Unit!36342)

(assert (=> b!1107353 (= lt!495613 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1107354 () Bool)

(assert (=> b!1107354 (= e!631802 true)))

(assert (=> b!1107354 e!631805))

(declare-fun c!109038 () Bool)

(assert (=> b!1107354 (= c!109038 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495612 () Unit!36342)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!245 (array!71915 array!71917 (_ BitVec 32) (_ BitVec 32) V!41793 V!41793 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36342)

(assert (=> b!1107354 (= lt!495612 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!245 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43066 () Bool)

(declare-fun tp!82015 () Bool)

(declare-fun e!631808 () Bool)

(assert (=> mapNonEmpty!43066 (= mapRes!43066 (and tp!82015 e!631808))))

(declare-fun mapValue!43066 () ValueCell!13040)

(declare-fun mapKey!43066 () (_ BitVec 32))

(declare-fun mapRest!43066 () (Array (_ BitVec 32) ValueCell!13040))

(assert (=> mapNonEmpty!43066 (= (arr!34611 _values!996) (store mapRest!43066 mapKey!43066 mapValue!43066))))

(declare-fun bm!46411 () Bool)

(declare-fun dynLambda!2349 (Int (_ BitVec 64)) V!41793)

(assert (=> bm!46411 (= call!46414 (getCurrentListMapNoExtraKeys!4216 lt!495614 (array!71918 (store (arr!34611 _values!996) i!673 (ValueCellFull!13040 (dynLambda!2349 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35147 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1107355 () Bool)

(declare-fun res!739010 () Bool)

(assert (=> b!1107355 (=> (not res!739010) (not e!631809))))

(assert (=> b!1107355 (= res!739010 (and (= (size!35147 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35146 _keys!1208) (size!35147 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1107356 () Bool)

(declare-fun res!739014 () Bool)

(assert (=> b!1107356 (=> (not res!739014) (not e!631809))))

(assert (=> b!1107356 (= res!739014 (= (select (arr!34610 _keys!1208) i!673) k!934))))

(declare-fun b!1107357 () Bool)

(assert (=> b!1107357 (= e!631807 (and e!631806 mapRes!43066))))

(declare-fun condMapEmpty!43066 () Bool)

(declare-fun mapDefault!43066 () ValueCell!13040)

