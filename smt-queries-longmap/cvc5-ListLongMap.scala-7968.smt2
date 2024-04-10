; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98648 () Bool)

(assert start!98648)

(declare-fun b_free!24253 () Bool)

(declare-fun b_next!24253 () Bool)

(assert (=> start!98648 (= b_free!24253 (not b_next!24253))))

(declare-fun tp!85469 () Bool)

(declare-fun b_and!39355 () Bool)

(assert (=> start!98648 (= tp!85469 b_and!39355)))

(declare-datatypes ((V!43505 0))(
  ( (V!43506 (val!14448 Int)) )
))
(declare-fun zeroValue!944 () V!43505)

(declare-datatypes ((tuple2!18308 0))(
  ( (tuple2!18309 (_1!9165 (_ BitVec 64)) (_2!9165 V!43505)) )
))
(declare-datatypes ((List!25059 0))(
  ( (Nil!25056) (Cons!25055 (h!26264 tuple2!18308) (t!36304 List!25059)) )
))
(declare-datatypes ((ListLongMap!16277 0))(
  ( (ListLongMap!16278 (toList!8154 List!25059)) )
))
(declare-fun call!52580 () ListLongMap!16277)

(declare-fun lt!512174 () ListLongMap!16277)

(declare-fun bm!52575 () Bool)

(declare-fun minValue!944 () V!43505)

(declare-fun c!113138 () Bool)

(declare-fun c!113135 () Bool)

(declare-fun +!3578 (ListLongMap!16277 tuple2!18308) ListLongMap!16277)

(assert (=> bm!52575 (= call!52580 (+!3578 lt!512174 (ite (or c!113138 c!113135) (tuple2!18309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18309 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1146650 () Bool)

(declare-fun res!763360 () Bool)

(declare-fun e!652250 () Bool)

(assert (=> b!1146650 (=> (not res!763360) (not e!652250))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1146650 (= res!763360 (validKeyInArray!0 k!934))))

(declare-fun b!1146651 () Bool)

(declare-datatypes ((Unit!37652 0))(
  ( (Unit!37653) )
))
(declare-fun e!652238 () Unit!37652)

(declare-fun Unit!37654 () Unit!37652)

(assert (=> b!1146651 (= e!652238 Unit!37654)))

(declare-fun b!1146652 () Bool)

(declare-fun e!652239 () Bool)

(assert (=> b!1146652 (= e!652250 e!652239)))

(declare-fun res!763371 () Bool)

(assert (=> b!1146652 (=> (not res!763371) (not e!652239))))

(declare-datatypes ((array!74413 0))(
  ( (array!74414 (arr!35857 (Array (_ BitVec 32) (_ BitVec 64))) (size!36393 (_ BitVec 32))) )
))
(declare-fun lt!512168 () array!74413)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74413 (_ BitVec 32)) Bool)

(assert (=> b!1146652 (= res!763371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!512168 mask!1564))))

(declare-fun _keys!1208 () array!74413)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1146652 (= lt!512168 (array!74414 (store (arr!35857 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36393 _keys!1208)))))

(declare-fun b!1146653 () Bool)

(declare-fun e!652240 () Bool)

(assert (=> b!1146653 (= e!652239 (not e!652240))))

(declare-fun res!763372 () Bool)

(assert (=> b!1146653 (=> res!763372 e!652240)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1146653 (= res!763372 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!74413 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1146653 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!512173 () Unit!37652)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!74413 (_ BitVec 64) (_ BitVec 32)) Unit!37652)

(assert (=> b!1146653 (= lt!512173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1146654 () Bool)

(declare-fun res!763359 () Bool)

(assert (=> b!1146654 (=> (not res!763359) (not e!652250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1146654 (= res!763359 (validMask!0 mask!1564))))

(declare-fun b!1146655 () Bool)

(declare-fun lt!512181 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1146655 (= c!113135 (and (not lt!512181) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!652242 () Unit!37652)

(declare-fun e!652241 () Unit!37652)

(assert (=> b!1146655 (= e!652242 e!652241)))

(declare-fun b!1146656 () Bool)

(declare-fun call!52585 () ListLongMap!16277)

(declare-fun e!652249 () Bool)

(declare-fun call!52581 () ListLongMap!16277)

(declare-fun -!1291 (ListLongMap!16277 (_ BitVec 64)) ListLongMap!16277)

(assert (=> b!1146656 (= e!652249 (= call!52581 (-!1291 call!52585 k!934)))))

(declare-fun b!1146657 () Bool)

(declare-fun res!763363 () Bool)

(assert (=> b!1146657 (=> (not res!763363) (not e!652250))))

(assert (=> b!1146657 (= res!763363 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36393 _keys!1208))))))

(declare-fun b!1146659 () Bool)

(declare-fun call!52584 () Bool)

(assert (=> b!1146659 call!52584))

(declare-fun lt!512177 () Unit!37652)

(declare-fun call!52582 () Unit!37652)

(assert (=> b!1146659 (= lt!512177 call!52582)))

(assert (=> b!1146659 (= e!652238 lt!512177)))

(declare-fun b!1146660 () Bool)

(declare-fun res!763368 () Bool)

(assert (=> b!1146660 (=> (not res!763368) (not e!652239))))

(declare-datatypes ((List!25060 0))(
  ( (Nil!25057) (Cons!25056 (h!26265 (_ BitVec 64)) (t!36305 List!25060)) )
))
(declare-fun arrayNoDuplicates!0 (array!74413 (_ BitVec 32) List!25060) Bool)

(assert (=> b!1146660 (= res!763368 (arrayNoDuplicates!0 lt!512168 #b00000000000000000000000000000000 Nil!25057))))

(declare-fun b!1146661 () Bool)

(declare-fun e!652248 () Bool)

(assert (=> b!1146661 (= e!652240 e!652248)))

(declare-fun res!763361 () Bool)

(assert (=> b!1146661 (=> res!763361 e!652248)))

(assert (=> b!1146661 (= res!763361 (not (= from!1455 i!673)))))

(declare-datatypes ((ValueCell!13682 0))(
  ( (ValueCellFull!13682 (v!17085 V!43505)) (EmptyCell!13682) )
))
(declare-datatypes ((array!74415 0))(
  ( (array!74416 (arr!35858 (Array (_ BitVec 32) ValueCell!13682)) (size!36394 (_ BitVec 32))) )
))
(declare-fun lt!512175 () array!74415)

(declare-fun lt!512161 () ListLongMap!16277)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4628 (array!74413 array!74415 (_ BitVec 32) (_ BitVec 32) V!43505 V!43505 (_ BitVec 32) Int) ListLongMap!16277)

(assert (=> b!1146661 (= lt!512161 (getCurrentListMapNoExtraKeys!4628 lt!512168 lt!512175 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!512176 () V!43505)

(declare-fun _values!996 () array!74415)

(assert (=> b!1146661 (= lt!512175 (array!74416 (store (arr!35858 _values!996) i!673 (ValueCellFull!13682 lt!512176)) (size!36394 _values!996)))))

(declare-fun dynLambda!2661 (Int (_ BitVec 64)) V!43505)

(assert (=> b!1146661 (= lt!512176 (dynLambda!2661 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!512172 () ListLongMap!16277)

(assert (=> b!1146661 (= lt!512172 (getCurrentListMapNoExtraKeys!4628 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!652244 () Bool)

(declare-fun b!1146662 () Bool)

(assert (=> b!1146662 (= e!652244 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1146663 () Bool)

(declare-fun lt!512179 () Unit!37652)

(assert (=> b!1146663 (= e!652241 lt!512179)))

(assert (=> b!1146663 (= lt!512179 call!52582)))

(assert (=> b!1146663 call!52584))

(declare-fun b!1146664 () Bool)

(declare-fun e!652235 () Bool)

(declare-fun e!652243 () Bool)

(declare-fun mapRes!44999 () Bool)

(assert (=> b!1146664 (= e!652235 (and e!652243 mapRes!44999))))

(declare-fun condMapEmpty!44999 () Bool)

(declare-fun mapDefault!44999 () ValueCell!13682)

