; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97296 () Bool)

(assert start!97296)

(declare-fun b_free!23267 () Bool)

(declare-fun b_next!23267 () Bool)

(assert (=> start!97296 (= b_free!23267 (not b_next!23267))))

(declare-fun tp!82099 () Bool)

(declare-fun b_and!37365 () Bool)

(assert (=> start!97296 (= tp!82099 b_and!37365)))

(declare-fun mapIsEmpty!43108 () Bool)

(declare-fun mapRes!43108 () Bool)

(assert (=> mapIsEmpty!43108 mapRes!43108))

(declare-fun b!1108045 () Bool)

(declare-fun e!632141 () Bool)

(declare-datatypes ((V!41829 0))(
  ( (V!41830 (val!13820 Int)) )
))
(declare-datatypes ((tuple2!17464 0))(
  ( (tuple2!17465 (_1!8743 (_ BitVec 64)) (_2!8743 V!41829)) )
))
(declare-datatypes ((List!24148 0))(
  ( (Nil!24145) (Cons!24144 (h!25353 tuple2!17464) (t!34461 List!24148)) )
))
(declare-datatypes ((ListLongMap!15433 0))(
  ( (ListLongMap!15434 (toList!7732 List!24148)) )
))
(declare-fun call!46498 () ListLongMap!15433)

(declare-fun call!46497 () ListLongMap!15433)

(assert (=> b!1108045 (= e!632141 (= call!46498 call!46497))))

(declare-fun b!1108046 () Bool)

(declare-fun e!632145 () Bool)

(declare-fun e!632140 () Bool)

(assert (=> b!1108046 (= e!632145 (not e!632140))))

(declare-fun res!739479 () Bool)

(assert (=> b!1108046 (=> res!739479 e!632140)))

(declare-datatypes ((array!71971 0))(
  ( (array!71972 (arr!34638 (Array (_ BitVec 32) (_ BitVec 64))) (size!35174 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71971)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1108046 (= res!739479 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35174 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108046 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36368 0))(
  ( (Unit!36369) )
))
(declare-fun lt!495738 () Unit!36368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71971 (_ BitVec 64) (_ BitVec 32)) Unit!36368)

(assert (=> b!1108046 (= lt!495738 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1108047 () Bool)

(declare-fun res!739476 () Bool)

(declare-fun e!632139 () Bool)

(assert (=> b!1108047 (=> (not res!739476) (not e!632139))))

(assert (=> b!1108047 (= res!739476 (= (select (arr!34638 _keys!1208) i!673) k!934))))

(declare-fun b!1108048 () Bool)

(declare-fun -!1012 (ListLongMap!15433 (_ BitVec 64)) ListLongMap!15433)

(assert (=> b!1108048 (= e!632141 (= call!46498 (-!1012 call!46497 k!934)))))

(declare-fun b!1108049 () Bool)

(declare-fun res!739475 () Bool)

(assert (=> b!1108049 (=> (not res!739475) (not e!632139))))

(assert (=> b!1108049 (= res!739475 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35174 _keys!1208))))))

(declare-fun b!1108050 () Bool)

(assert (=> b!1108050 (= e!632139 e!632145)))

(declare-fun res!739480 () Bool)

(assert (=> b!1108050 (=> (not res!739480) (not e!632145))))

(declare-fun lt!495739 () array!71971)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71971 (_ BitVec 32)) Bool)

(assert (=> b!1108050 (= res!739480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495739 mask!1564))))

(assert (=> b!1108050 (= lt!495739 (array!71972 (store (arr!34638 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35174 _keys!1208)))))

(declare-fun b!1108051 () Bool)

(declare-fun res!739474 () Bool)

(assert (=> b!1108051 (=> (not res!739474) (not e!632139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108051 (= res!739474 (validKeyInArray!0 k!934))))

(declare-fun b!1108052 () Bool)

(declare-fun res!739473 () Bool)

(assert (=> b!1108052 (=> (not res!739473) (not e!632139))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13054 0))(
  ( (ValueCellFull!13054 (v!16453 V!41829)) (EmptyCell!13054) )
))
(declare-datatypes ((array!71973 0))(
  ( (array!71974 (arr!34639 (Array (_ BitVec 32) ValueCell!13054)) (size!35175 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71973)

(assert (=> b!1108052 (= res!739473 (and (= (size!35175 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35174 _keys!1208) (size!35175 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41829)

(declare-fun bm!46494 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41829)

(declare-fun getCurrentListMapNoExtraKeys!4228 (array!71971 array!71973 (_ BitVec 32) (_ BitVec 32) V!41829 V!41829 (_ BitVec 32) Int) ListLongMap!15433)

(assert (=> bm!46494 (= call!46497 (getCurrentListMapNoExtraKeys!4228 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108053 () Bool)

(declare-fun e!632142 () Bool)

(declare-fun tp_is_empty!27527 () Bool)

(assert (=> b!1108053 (= e!632142 tp_is_empty!27527)))

(declare-fun mapNonEmpty!43108 () Bool)

(declare-fun tp!82100 () Bool)

(assert (=> mapNonEmpty!43108 (= mapRes!43108 (and tp!82100 e!632142))))

(declare-fun mapValue!43108 () ValueCell!13054)

(declare-fun mapRest!43108 () (Array (_ BitVec 32) ValueCell!13054))

(declare-fun mapKey!43108 () (_ BitVec 32))

(assert (=> mapNonEmpty!43108 (= (arr!34639 _values!996) (store mapRest!43108 mapKey!43108 mapValue!43108))))

(declare-fun b!1108054 () Bool)

(declare-fun res!739478 () Bool)

(assert (=> b!1108054 (=> (not res!739478) (not e!632139))))

(assert (=> b!1108054 (= res!739478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1108055 () Bool)

(declare-fun res!739470 () Bool)

(assert (=> b!1108055 (=> (not res!739470) (not e!632139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108055 (= res!739470 (validMask!0 mask!1564))))

(declare-fun b!1108057 () Bool)

(declare-fun res!739471 () Bool)

(assert (=> b!1108057 (=> (not res!739471) (not e!632145))))

(declare-datatypes ((List!24149 0))(
  ( (Nil!24146) (Cons!24145 (h!25354 (_ BitVec 64)) (t!34462 List!24149)) )
))
(declare-fun arrayNoDuplicates!0 (array!71971 (_ BitVec 32) List!24149) Bool)

(assert (=> b!1108057 (= res!739471 (arrayNoDuplicates!0 lt!495739 #b00000000000000000000000000000000 Nil!24146))))

(declare-fun bm!46495 () Bool)

(declare-fun dynLambda!2360 (Int (_ BitVec 64)) V!41829)

(assert (=> bm!46495 (= call!46498 (getCurrentListMapNoExtraKeys!4228 lt!495739 (array!71974 (store (arr!34639 _values!996) i!673 (ValueCellFull!13054 (dynLambda!2360 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35175 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108058 () Bool)

(declare-fun e!632143 () Bool)

(declare-fun e!632144 () Bool)

(assert (=> b!1108058 (= e!632143 (and e!632144 mapRes!43108))))

(declare-fun condMapEmpty!43108 () Bool)

(declare-fun mapDefault!43108 () ValueCell!13054)

