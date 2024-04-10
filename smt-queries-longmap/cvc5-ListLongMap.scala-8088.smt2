; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99394 () Bool)

(assert start!99394)

(declare-fun b_free!24973 () Bool)

(declare-fun b_next!24973 () Bool)

(assert (=> start!99394 (= b_free!24973 (not b_next!24973))))

(declare-fun tp!87632 () Bool)

(declare-fun b_and!40813 () Bool)

(assert (=> start!99394 (= tp!87632 b_and!40813)))

(declare-fun b!1173107 () Bool)

(declare-fun e!666792 () Bool)

(declare-fun e!666795 () Bool)

(assert (=> b!1173107 (= e!666792 e!666795)))

(declare-fun res!778966 () Bool)

(assert (=> b!1173107 (=> res!778966 e!666795)))

(declare-datatypes ((array!75817 0))(
  ( (array!75818 (arr!36558 (Array (_ BitVec 32) (_ BitVec 64))) (size!37094 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75817)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1173107 (= res!778966 (not (= (select (arr!36558 _keys!1208) from!1455) k!934)))))

(declare-fun b!1173108 () Bool)

(declare-fun res!778954 () Bool)

(declare-fun e!666801 () Bool)

(assert (=> b!1173108 (=> (not res!778954) (not e!666801))))

(declare-datatypes ((List!25660 0))(
  ( (Nil!25657) (Cons!25656 (h!26865 (_ BitVec 64)) (t!37625 List!25660)) )
))
(declare-fun arrayNoDuplicates!0 (array!75817 (_ BitVec 32) List!25660) Bool)

(assert (=> b!1173108 (= res!778954 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25657))))

(declare-fun b!1173109 () Bool)

(declare-fun res!778963 () Bool)

(assert (=> b!1173109 (=> (not res!778963) (not e!666801))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75817 (_ BitVec 32)) Bool)

(assert (=> b!1173109 (= res!778963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173110 () Bool)

(declare-fun res!778956 () Bool)

(assert (=> b!1173110 (=> (not res!778956) (not e!666801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173110 (= res!778956 (validMask!0 mask!1564))))

(declare-fun b!1173111 () Bool)

(declare-fun e!666798 () Bool)

(assert (=> b!1173111 (= e!666801 e!666798)))

(declare-fun res!778960 () Bool)

(assert (=> b!1173111 (=> (not res!778960) (not e!666798))))

(declare-fun lt!528701 () array!75817)

(assert (=> b!1173111 (= res!778960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528701 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173111 (= lt!528701 (array!75818 (store (arr!36558 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37094 _keys!1208)))))

(declare-fun res!778964 () Bool)

(assert (=> start!99394 (=> (not res!778964) (not e!666801))))

(assert (=> start!99394 (= res!778964 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37094 _keys!1208))))))

(assert (=> start!99394 e!666801))

(declare-fun tp_is_empty!29503 () Bool)

(assert (=> start!99394 tp_is_empty!29503))

(declare-fun array_inv!27932 (array!75817) Bool)

(assert (=> start!99394 (array_inv!27932 _keys!1208)))

(assert (=> start!99394 true))

(assert (=> start!99394 tp!87632))

(declare-datatypes ((V!44465 0))(
  ( (V!44466 (val!14808 Int)) )
))
(declare-datatypes ((ValueCell!14042 0))(
  ( (ValueCellFull!14042 (v!17446 V!44465)) (EmptyCell!14042) )
))
(declare-datatypes ((array!75819 0))(
  ( (array!75820 (arr!36559 (Array (_ BitVec 32) ValueCell!14042)) (size!37095 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75819)

(declare-fun e!666791 () Bool)

(declare-fun array_inv!27933 (array!75819) Bool)

(assert (=> start!99394 (and (array_inv!27933 _values!996) e!666791)))

(declare-fun b!1173112 () Bool)

(declare-fun e!666797 () Bool)

(declare-fun e!666802 () Bool)

(assert (=> b!1173112 (= e!666797 e!666802)))

(declare-fun res!778955 () Bool)

(assert (=> b!1173112 (=> res!778955 e!666802)))

(assert (=> b!1173112 (= res!778955 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528711 () array!75819)

(declare-datatypes ((tuple2!18922 0))(
  ( (tuple2!18923 (_1!9472 (_ BitVec 64)) (_2!9472 V!44465)) )
))
(declare-datatypes ((List!25661 0))(
  ( (Nil!25658) (Cons!25657 (h!26866 tuple2!18922) (t!37626 List!25661)) )
))
(declare-datatypes ((ListLongMap!16891 0))(
  ( (ListLongMap!16892 (toList!8461 List!25661)) )
))
(declare-fun lt!528710 () ListLongMap!16891)

(declare-fun minValue!944 () V!44465)

(declare-fun zeroValue!944 () V!44465)

(declare-fun getCurrentListMapNoExtraKeys!4924 (array!75817 array!75819 (_ BitVec 32) (_ BitVec 32) V!44465 V!44465 (_ BitVec 32) Int) ListLongMap!16891)

(assert (=> b!1173112 (= lt!528710 (getCurrentListMapNoExtraKeys!4924 lt!528701 lt!528711 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!528714 () V!44465)

(assert (=> b!1173112 (= lt!528711 (array!75820 (store (arr!36559 _values!996) i!673 (ValueCellFull!14042 lt!528714)) (size!37095 _values!996)))))

(declare-fun dynLambda!2895 (Int (_ BitVec 64)) V!44465)

(assert (=> b!1173112 (= lt!528714 (dynLambda!2895 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528704 () ListLongMap!16891)

(assert (=> b!1173112 (= lt!528704 (getCurrentListMapNoExtraKeys!4924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1173113 () Bool)

(assert (=> b!1173113 (= e!666798 (not e!666797))))

(declare-fun res!778961 () Bool)

(assert (=> b!1173113 (=> res!778961 e!666797)))

(assert (=> b!1173113 (= res!778961 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173113 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38684 0))(
  ( (Unit!38685) )
))
(declare-fun lt!528702 () Unit!38684)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75817 (_ BitVec 64) (_ BitVec 32)) Unit!38684)

(assert (=> b!1173113 (= lt!528702 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173114 () Bool)

(declare-fun e!666799 () Bool)

(assert (=> b!1173114 (= e!666799 tp_is_empty!29503)))

(declare-fun b!1173115 () Bool)

(declare-fun res!778959 () Bool)

(assert (=> b!1173115 (=> (not res!778959) (not e!666801))))

(assert (=> b!1173115 (= res!778959 (= (select (arr!36558 _keys!1208) i!673) k!934))))

(declare-fun b!1173116 () Bool)

(declare-fun e!666796 () Bool)

(declare-fun mapRes!46082 () Bool)

(assert (=> b!1173116 (= e!666791 (and e!666796 mapRes!46082))))

(declare-fun condMapEmpty!46082 () Bool)

(declare-fun mapDefault!46082 () ValueCell!14042)

