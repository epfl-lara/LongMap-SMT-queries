; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100304 () Bool)

(assert start!100304)

(declare-fun b_free!25691 () Bool)

(declare-fun b_next!25691 () Bool)

(assert (=> start!100304 (= b_free!25691 (not b_next!25691))))

(declare-fun tp!90021 () Bool)

(declare-fun b_and!42249 () Bool)

(assert (=> start!100304 (= tp!90021 b_and!42249)))

(declare-fun b!1196863 () Bool)

(declare-fun res!796529 () Bool)

(declare-fun e!679970 () Bool)

(assert (=> b!1196863 (=> (not res!796529) (not e!679970))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196863 (= res!796529 (validKeyInArray!0 k!934))))

(declare-fun b!1196864 () Bool)

(declare-fun res!796528 () Bool)

(assert (=> b!1196864 (=> (not res!796528) (not e!679970))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77521 0))(
  ( (array!77522 (arr!37407 (Array (_ BitVec 32) (_ BitVec 64))) (size!37943 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77521)

(assert (=> b!1196864 (= res!796528 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37943 _keys!1208))))))

(declare-datatypes ((V!45621 0))(
  ( (V!45622 (val!15242 Int)) )
))
(declare-fun zeroValue!944 () V!45621)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14476 0))(
  ( (ValueCellFull!14476 (v!17880 V!45621)) (EmptyCell!14476) )
))
(declare-datatypes ((array!77523 0))(
  ( (array!77524 (arr!37408 (Array (_ BitVec 32) ValueCell!14476)) (size!37944 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77523)

(declare-fun minValue!944 () V!45621)

(declare-datatypes ((tuple2!19506 0))(
  ( (tuple2!19507 (_1!9764 (_ BitVec 64)) (_2!9764 V!45621)) )
))
(declare-datatypes ((List!26316 0))(
  ( (Nil!26313) (Cons!26312 (h!27521 tuple2!19506) (t!38999 List!26316)) )
))
(declare-datatypes ((ListLongMap!17475 0))(
  ( (ListLongMap!17476 (toList!8753 List!26316)) )
))
(declare-fun call!57195 () ListLongMap!17475)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!57191 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5193 (array!77521 array!77523 (_ BitVec 32) (_ BitVec 32) V!45621 V!45621 (_ BitVec 32) Int) ListLongMap!17475)

(assert (=> bm!57191 (= call!57195 (getCurrentListMapNoExtraKeys!5193 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196865 () Bool)

(declare-fun res!796534 () Bool)

(assert (=> b!1196865 (=> (not res!796534) (not e!679970))))

(assert (=> b!1196865 (= res!796534 (and (= (size!37944 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37943 _keys!1208) (size!37944 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196866 () Bool)

(declare-fun res!796527 () Bool)

(declare-fun e!679973 () Bool)

(assert (=> b!1196866 (=> (not res!796527) (not e!679973))))

(declare-fun lt!543154 () array!77521)

(declare-datatypes ((List!26317 0))(
  ( (Nil!26314) (Cons!26313 (h!27522 (_ BitVec 64)) (t!39000 List!26317)) )
))
(declare-fun arrayNoDuplicates!0 (array!77521 (_ BitVec 32) List!26317) Bool)

(assert (=> b!1196866 (= res!796527 (arrayNoDuplicates!0 lt!543154 #b00000000000000000000000000000000 Nil!26314))))

(declare-fun b!1196867 () Bool)

(assert (=> b!1196867 (= e!679970 e!679973)))

(declare-fun res!796524 () Bool)

(assert (=> b!1196867 (=> (not res!796524) (not e!679973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77521 (_ BitVec 32)) Bool)

(assert (=> b!1196867 (= res!796524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543154 mask!1564))))

(assert (=> b!1196867 (= lt!543154 (array!77522 (store (arr!37407 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37943 _keys!1208)))))

(declare-fun b!1196868 () Bool)

(declare-fun call!57194 () ListLongMap!17475)

(declare-fun e!679971 () Bool)

(declare-fun -!1773 (ListLongMap!17475 (_ BitVec 64)) ListLongMap!17475)

(assert (=> b!1196868 (= e!679971 (= call!57194 (-!1773 call!57195 k!934)))))

(declare-fun bm!57192 () Bool)

(declare-fun dynLambda!3120 (Int (_ BitVec 64)) V!45621)

(assert (=> bm!57192 (= call!57194 (getCurrentListMapNoExtraKeys!5193 lt!543154 (array!77524 (store (arr!37408 _values!996) i!673 (ValueCellFull!14476 (dynLambda!3120 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37944 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196870 () Bool)

(declare-fun e!679974 () Bool)

(declare-fun e!679975 () Bool)

(declare-fun mapRes!47393 () Bool)

(assert (=> b!1196870 (= e!679974 (and e!679975 mapRes!47393))))

(declare-fun condMapEmpty!47393 () Bool)

(declare-fun mapDefault!47393 () ValueCell!14476)

