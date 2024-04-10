; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98754 () Bool)

(assert start!98754)

(declare-fun b_free!24359 () Bool)

(declare-fun b_next!24359 () Bool)

(assert (=> start!98754 (= b_free!24359 (not b_next!24359))))

(declare-fun tp!85788 () Bool)

(declare-fun b_and!39567 () Bool)

(assert (=> start!98754 (= tp!85788 b_and!39567)))

(declare-fun res!765755 () Bool)

(declare-fun e!654947 () Bool)

(assert (=> start!98754 (=> (not res!765755) (not e!654947))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!74625 0))(
  ( (array!74626 (arr!35963 (Array (_ BitVec 32) (_ BitVec 64))) (size!36499 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!74625)

(assert (=> start!98754 (= res!765755 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36499 _keys!1208))))))

(assert (=> start!98754 e!654947))

(declare-fun tp_is_empty!28889 () Bool)

(assert (=> start!98754 tp_is_empty!28889))

(declare-fun array_inv!27542 (array!74625) Bool)

(assert (=> start!98754 (array_inv!27542 _keys!1208)))

(assert (=> start!98754 true))

(assert (=> start!98754 tp!85788))

(declare-datatypes ((V!43645 0))(
  ( (V!43646 (val!14501 Int)) )
))
(declare-datatypes ((ValueCell!13735 0))(
  ( (ValueCellFull!13735 (v!17138 V!43645)) (EmptyCell!13735) )
))
(declare-datatypes ((array!74627 0))(
  ( (array!74628 (arr!35964 (Array (_ BitVec 32) ValueCell!13735)) (size!36500 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!74627)

(declare-fun e!654951 () Bool)

(declare-fun array_inv!27543 (array!74627) Bool)

(assert (=> start!98754 (and (array_inv!27543 _values!996) e!654951)))

(declare-fun b!1151526 () Bool)

(declare-fun res!765747 () Bool)

(assert (=> b!1151526 (=> (not res!765747) (not e!654947))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1151526 (= res!765747 (and (= (size!36500 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36499 _keys!1208) (size!36500 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!43645)

(declare-fun c!114089 () Bool)

(declare-fun bm!53847 () Bool)

(declare-datatypes ((tuple2!18412 0))(
  ( (tuple2!18413 (_1!9217 (_ BitVec 64)) (_2!9217 V!43645)) )
))
(declare-datatypes ((List!25160 0))(
  ( (Nil!25157) (Cons!25156 (h!26365 tuple2!18412) (t!36511 List!25160)) )
))
(declare-datatypes ((ListLongMap!16381 0))(
  ( (ListLongMap!16382 (toList!8206 List!25160)) )
))
(declare-fun call!53851 () ListLongMap!16381)

(declare-fun c!114091 () Bool)

(declare-fun minValue!944 () V!43645)

(declare-fun lt!515597 () ListLongMap!16381)

(declare-fun +!3624 (ListLongMap!16381 tuple2!18412) ListLongMap!16381)

(assert (=> bm!53847 (= call!53851 (+!3624 lt!515597 (ite (or c!114089 c!114091) (tuple2!18413 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18413 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944))))))

(declare-fun b!1151527 () Bool)

(declare-datatypes ((Unit!37883 0))(
  ( (Unit!37884) )
))
(declare-fun e!654954 () Unit!37883)

(declare-fun Unit!37885 () Unit!37883)

(assert (=> b!1151527 (= e!654954 Unit!37885)))

(declare-fun b!1151528 () Bool)

(declare-fun e!654944 () Bool)

(declare-fun e!654940 () Bool)

(assert (=> b!1151528 (= e!654944 e!654940)))

(declare-fun res!765756 () Bool)

(assert (=> b!1151528 (=> res!765756 e!654940)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1151528 (= res!765756 (not (= from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!515601 () array!74625)

(declare-fun lt!515593 () array!74627)

(declare-fun lt!515588 () ListLongMap!16381)

(declare-fun getCurrentListMapNoExtraKeys!4678 (array!74625 array!74627 (_ BitVec 32) (_ BitVec 32) V!43645 V!43645 (_ BitVec 32) Int) ListLongMap!16381)

(assert (=> b!1151528 (= lt!515588 (getCurrentListMapNoExtraKeys!4678 lt!515601 lt!515593 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!515584 () V!43645)

(assert (=> b!1151528 (= lt!515593 (array!74628 (store (arr!35964 _values!996) i!673 (ValueCellFull!13735 lt!515584)) (size!36500 _values!996)))))

(declare-fun dynLambda!2701 (Int (_ BitVec 64)) V!43645)

(assert (=> b!1151528 (= lt!515584 (dynLambda!2701 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!515591 () ListLongMap!16381)

(assert (=> b!1151528 (= lt!515591 (getCurrentListMapNoExtraKeys!4678 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1151529 () Bool)

(declare-fun res!765744 () Bool)

(declare-fun e!654948 () Bool)

(assert (=> b!1151529 (=> (not res!765744) (not e!654948))))

(declare-datatypes ((List!25161 0))(
  ( (Nil!25158) (Cons!25157 (h!26366 (_ BitVec 64)) (t!36512 List!25161)) )
))
(declare-fun arrayNoDuplicates!0 (array!74625 (_ BitVec 32) List!25161) Bool)

(assert (=> b!1151529 (= res!765744 (arrayNoDuplicates!0 lt!515601 #b00000000000000000000000000000000 Nil!25158))))

(declare-fun b!1151530 () Bool)

(declare-fun e!654953 () Bool)

(assert (=> b!1151530 (= e!654953 tp_is_empty!28889)))

(declare-fun b!1151531 () Bool)

(declare-fun res!765752 () Bool)

(assert (=> b!1151531 (=> (not res!765752) (not e!654947))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1151531 (= res!765752 (= (select (arr!35963 _keys!1208) i!673) k!934))))

(declare-fun b!1151532 () Bool)

(declare-fun res!765745 () Bool)

(assert (=> b!1151532 (=> (not res!765745) (not e!654947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!74625 (_ BitVec 32)) Bool)

(assert (=> b!1151532 (= res!765745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1151533 () Bool)

(declare-fun call!53852 () Bool)

(assert (=> b!1151533 call!53852))

(declare-fun lt!515581 () Unit!37883)

(declare-fun call!53853 () Unit!37883)

(assert (=> b!1151533 (= lt!515581 call!53853)))

(assert (=> b!1151533 (= e!654954 lt!515581)))

(declare-fun e!654941 () Bool)

(declare-fun call!53856 () ListLongMap!16381)

(declare-fun b!1151534 () Bool)

(declare-fun call!53854 () ListLongMap!16381)

(declare-fun -!1337 (ListLongMap!16381 (_ BitVec 64)) ListLongMap!16381)

(assert (=> b!1151534 (= e!654941 (= call!53856 (-!1337 call!53854 k!934)))))

(declare-fun b!1151535 () Bool)

(declare-fun res!765754 () Bool)

(assert (=> b!1151535 (=> (not res!765754) (not e!654947))))

(assert (=> b!1151535 (= res!765754 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25158))))

(declare-fun bm!53848 () Bool)

(declare-fun call!53850 () ListLongMap!16381)

(assert (=> bm!53848 (= call!53850 call!53851)))

(declare-fun mapIsEmpty!45158 () Bool)

(declare-fun mapRes!45158 () Bool)

(assert (=> mapIsEmpty!45158 mapRes!45158))

(declare-fun b!1151536 () Bool)

(assert (=> b!1151536 (= e!654941 (= call!53856 call!53854))))

(declare-fun lt!515600 () ListLongMap!16381)

(declare-fun b!1151537 () Bool)

(declare-fun e!654950 () Bool)

(assert (=> b!1151537 (= e!654950 (= lt!515600 (getCurrentListMapNoExtraKeys!4678 lt!515601 lt!515593 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004)))))

(declare-fun b!1151538 () Bool)

(declare-fun res!765753 () Bool)

(assert (=> b!1151538 (=> (not res!765753) (not e!654947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1151538 (= res!765753 (validKeyInArray!0 k!934))))

(declare-fun b!1151539 () Bool)

(declare-fun e!654945 () Unit!37883)

(assert (=> b!1151539 (= e!654945 e!654954)))

(declare-fun c!114092 () Bool)

(declare-fun lt!515580 () Bool)

(assert (=> b!1151539 (= c!114092 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!515580))))

(declare-fun b!1151540 () Bool)

(declare-fun e!654949 () Bool)

(assert (=> b!1151540 (= e!654949 tp_is_empty!28889)))

(declare-fun bm!53849 () Bool)

(assert (=> bm!53849 (= call!53856 (getCurrentListMapNoExtraKeys!4678 lt!515601 lt!515593 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1151541 () Bool)

(assert (=> b!1151541 (= c!114091 (and (not lt!515580) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun e!654942 () Unit!37883)

(assert (=> b!1151541 (= e!654942 e!654945)))

(declare-fun b!1151542 () Bool)

(assert (=> b!1151542 (= e!654951 (and e!654949 mapRes!45158))))

(declare-fun condMapEmpty!45158 () Bool)

(declare-fun mapDefault!45158 () ValueCell!13735)

