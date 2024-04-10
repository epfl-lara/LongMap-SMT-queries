; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97344 () Bool)

(assert start!97344)

(declare-fun b_free!23315 () Bool)

(declare-fun b_next!23315 () Bool)

(assert (=> start!97344 (= b_free!23315 (not b_next!23315))))

(declare-fun tp!82244 () Bool)

(declare-fun b_and!37465 () Bool)

(assert (=> start!97344 (= tp!82244 b_and!37465)))

(declare-fun b!1109269 () Bool)

(declare-fun res!740266 () Bool)

(declare-fun e!632728 () Bool)

(assert (=> b!1109269 (=> (not res!740266) (not e!632728))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109269 (= res!740266 (validKeyInArray!0 k!934))))

(declare-datatypes ((V!41893 0))(
  ( (V!41894 (val!13844 Int)) )
))
(declare-fun zeroValue!944 () V!41893)

(declare-datatypes ((array!72067 0))(
  ( (array!72068 (arr!34686 (Array (_ BitVec 32) (_ BitVec 64))) (size!35222 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72067)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46638 () Bool)

(declare-datatypes ((ValueCell!13078 0))(
  ( (ValueCellFull!13078 (v!16477 V!41893)) (EmptyCell!13078) )
))
(declare-datatypes ((array!72069 0))(
  ( (array!72070 (arr!34687 (Array (_ BitVec 32) ValueCell!13078)) (size!35223 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72069)

(declare-datatypes ((tuple2!17502 0))(
  ( (tuple2!17503 (_1!8762 (_ BitVec 64)) (_2!8762 V!41893)) )
))
(declare-datatypes ((List!24184 0))(
  ( (Nil!24181) (Cons!24180 (h!25389 tuple2!17502) (t!34545 List!24184)) )
))
(declare-datatypes ((ListLongMap!15471 0))(
  ( (ListLongMap!15472 (toList!7751 List!24184)) )
))
(declare-fun call!46642 () ListLongMap!15471)

(declare-fun minValue!944 () V!41893)

(declare-fun getCurrentListMapNoExtraKeys!4245 (array!72067 array!72069 (_ BitVec 32) (_ BitVec 32) V!41893 V!41893 (_ BitVec 32) Int) ListLongMap!15471)

(assert (=> bm!46638 (= call!46642 (getCurrentListMapNoExtraKeys!4245 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43180 () Bool)

(declare-fun mapRes!43180 () Bool)

(declare-fun tp!82243 () Bool)

(declare-fun e!632732 () Bool)

(assert (=> mapNonEmpty!43180 (= mapRes!43180 (and tp!82243 e!632732))))

(declare-fun mapValue!43180 () ValueCell!13078)

(declare-fun mapKey!43180 () (_ BitVec 32))

(declare-fun mapRest!43180 () (Array (_ BitVec 32) ValueCell!13078))

(assert (=> mapNonEmpty!43180 (= (arr!34687 _values!996) (store mapRest!43180 mapKey!43180 mapValue!43180))))

(declare-fun res!740270 () Bool)

(assert (=> start!97344 (=> (not res!740270) (not e!632728))))

(assert (=> start!97344 (= res!740270 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35222 _keys!1208))))))

(assert (=> start!97344 e!632728))

(declare-fun tp_is_empty!27575 () Bool)

(assert (=> start!97344 tp_is_empty!27575))

(declare-fun array_inv!26692 (array!72067) Bool)

(assert (=> start!97344 (array_inv!26692 _keys!1208)))

(assert (=> start!97344 true))

(assert (=> start!97344 tp!82244))

(declare-fun e!632726 () Bool)

(declare-fun array_inv!26693 (array!72069) Bool)

(assert (=> start!97344 (and (array_inv!26693 _values!996) e!632726)))

(declare-fun mapIsEmpty!43180 () Bool)

(assert (=> mapIsEmpty!43180 mapRes!43180))

(declare-fun e!632729 () Bool)

(declare-fun call!46641 () ListLongMap!15471)

(declare-fun b!1109270 () Bool)

(declare-fun -!1027 (ListLongMap!15471 (_ BitVec 64)) ListLongMap!15471)

(assert (=> b!1109270 (= e!632729 (= call!46641 (-!1027 call!46642 k!934)))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun bm!46639 () Bool)

(declare-fun lt!495956 () array!72067)

(declare-fun dynLambda!2375 (Int (_ BitVec 64)) V!41893)

(assert (=> bm!46639 (= call!46641 (getCurrentListMapNoExtraKeys!4245 lt!495956 (array!72070 (store (arr!34687 _values!996) i!673 (ValueCellFull!13078 (dynLambda!2375 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35223 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109271 () Bool)

(declare-fun res!740269 () Bool)

(assert (=> b!1109271 (=> (not res!740269) (not e!632728))))

(assert (=> b!1109271 (= res!740269 (and (= (size!35223 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35222 _keys!1208) (size!35223 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109272 () Bool)

(declare-fun res!740268 () Bool)

(assert (=> b!1109272 (=> (not res!740268) (not e!632728))))

(declare-datatypes ((List!24185 0))(
  ( (Nil!24182) (Cons!24181 (h!25390 (_ BitVec 64)) (t!34546 List!24185)) )
))
(declare-fun arrayNoDuplicates!0 (array!72067 (_ BitVec 32) List!24185) Bool)

(assert (=> b!1109272 (= res!740268 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24182))))

(declare-fun b!1109273 () Bool)

(declare-fun res!740265 () Bool)

(assert (=> b!1109273 (=> (not res!740265) (not e!632728))))

(assert (=> b!1109273 (= res!740265 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35222 _keys!1208))))))

(declare-fun b!1109274 () Bool)

(assert (=> b!1109274 (= e!632729 (= call!46641 call!46642))))

(declare-fun b!1109275 () Bool)

(declare-fun res!740271 () Bool)

(assert (=> b!1109275 (=> (not res!740271) (not e!632728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72067 (_ BitVec 32)) Bool)

(assert (=> b!1109275 (= res!740271 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109276 () Bool)

(declare-fun e!632733 () Bool)

(declare-fun e!632731 () Bool)

(assert (=> b!1109276 (= e!632733 (not e!632731))))

(declare-fun res!740263 () Bool)

(assert (=> b!1109276 (=> res!740263 e!632731)))

(assert (=> b!1109276 (= res!740263 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35222 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109276 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36406 0))(
  ( (Unit!36407) )
))
(declare-fun lt!495955 () Unit!36406)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72067 (_ BitVec 64) (_ BitVec 32)) Unit!36406)

(assert (=> b!1109276 (= lt!495955 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1109277 () Bool)

(declare-fun e!632730 () Bool)

(assert (=> b!1109277 (= e!632730 tp_is_empty!27575)))

(declare-fun b!1109278 () Bool)

(assert (=> b!1109278 (= e!632728 e!632733)))

(declare-fun res!740267 () Bool)

(assert (=> b!1109278 (=> (not res!740267) (not e!632733))))

(assert (=> b!1109278 (= res!740267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495956 mask!1564))))

(assert (=> b!1109278 (= lt!495956 (array!72068 (store (arr!34686 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35222 _keys!1208)))))

(declare-fun b!1109279 () Bool)

(assert (=> b!1109279 (= e!632732 tp_is_empty!27575)))

(declare-fun b!1109280 () Bool)

(declare-fun res!740262 () Bool)

(assert (=> b!1109280 (=> (not res!740262) (not e!632733))))

(assert (=> b!1109280 (= res!740262 (arrayNoDuplicates!0 lt!495956 #b00000000000000000000000000000000 Nil!24182))))

(declare-fun b!1109281 () Bool)

(declare-fun res!740272 () Bool)

(assert (=> b!1109281 (=> (not res!740272) (not e!632728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109281 (= res!740272 (validMask!0 mask!1564))))

(declare-fun b!1109282 () Bool)

(assert (=> b!1109282 (= e!632731 true)))

(assert (=> b!1109282 e!632729))

(declare-fun c!109164 () Bool)

(assert (=> b!1109282 (= c!109164 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495954 () Unit!36406)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!272 (array!72067 array!72069 (_ BitVec 32) (_ BitVec 32) V!41893 V!41893 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36406)

(assert (=> b!1109282 (= lt!495954 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!272 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109283 () Bool)

(assert (=> b!1109283 (= e!632726 (and e!632730 mapRes!43180))))

(declare-fun condMapEmpty!43180 () Bool)

(declare-fun mapDefault!43180 () ValueCell!13078)

