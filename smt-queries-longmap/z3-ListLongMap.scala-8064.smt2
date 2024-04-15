; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99218 () Bool)

(assert start!99218)

(declare-fun b_free!24829 () Bool)

(declare-fun b_next!24829 () Bool)

(assert (=> start!99218 (= b_free!24829 (not b_next!24829))))

(declare-fun tp!87197 () Bool)

(declare-fun b_and!40485 () Bool)

(assert (=> start!99218 (= tp!87197 b_and!40485)))

(declare-fun b!1168431 () Bool)

(declare-fun e!664052 () Bool)

(declare-fun e!664051 () Bool)

(declare-fun mapRes!45863 () Bool)

(assert (=> b!1168431 (= e!664052 (and e!664051 mapRes!45863))))

(declare-fun condMapEmpty!45863 () Bool)

(declare-datatypes ((V!44273 0))(
  ( (V!44274 (val!14736 Int)) )
))
(declare-datatypes ((ValueCell!13970 0))(
  ( (ValueCellFull!13970 (v!17372 V!44273)) (EmptyCell!13970) )
))
(declare-datatypes ((array!75464 0))(
  ( (array!75465 (arr!36383 (Array (_ BitVec 32) ValueCell!13970)) (size!36921 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75464)

(declare-fun mapDefault!45863 () ValueCell!13970)

(assert (=> b!1168431 (= condMapEmpty!45863 (= (arr!36383 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13970)) mapDefault!45863)))))

(declare-fun b!1168432 () Bool)

(declare-fun e!664050 () Bool)

(declare-fun tp_is_empty!29359 () Bool)

(assert (=> b!1168432 (= e!664050 tp_is_empty!29359)))

(declare-fun mapNonEmpty!45863 () Bool)

(declare-fun tp!87198 () Bool)

(assert (=> mapNonEmpty!45863 (= mapRes!45863 (and tp!87198 e!664050))))

(declare-fun mapValue!45863 () ValueCell!13970)

(declare-fun mapRest!45863 () (Array (_ BitVec 32) ValueCell!13970))

(declare-fun mapKey!45863 () (_ BitVec 32))

(assert (=> mapNonEmpty!45863 (= (arr!36383 _values!996) (store mapRest!45863 mapKey!45863 mapValue!45863))))

(declare-fun b!1168433 () Bool)

(declare-fun e!664049 () Bool)

(declare-fun e!664056 () Bool)

(assert (=> b!1168433 (= e!664049 e!664056)))

(declare-fun res!775256 () Bool)

(assert (=> b!1168433 (=> res!775256 e!664056)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168433 (= res!775256 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((array!75466 0))(
  ( (array!75467 (arr!36384 (Array (_ BitVec 32) (_ BitVec 64))) (size!36922 (_ BitVec 32))) )
))
(declare-fun lt!525911 () array!75466)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18896 0))(
  ( (tuple2!18897 (_1!9459 (_ BitVec 64)) (_2!9459 V!44273)) )
))
(declare-datatypes ((List!25611 0))(
  ( (Nil!25608) (Cons!25607 (h!26816 tuple2!18896) (t!37423 List!25611)) )
))
(declare-datatypes ((ListLongMap!16865 0))(
  ( (ListLongMap!16866 (toList!8448 List!25611)) )
))
(declare-fun lt!525915 () ListLongMap!16865)

(declare-fun minValue!944 () V!44273)

(declare-fun zeroValue!944 () V!44273)

(declare-fun lt!525906 () array!75464)

(declare-fun getCurrentListMapNoExtraKeys!4924 (array!75466 array!75464 (_ BitVec 32) (_ BitVec 32) V!44273 V!44273 (_ BitVec 32) Int) ListLongMap!16865)

(assert (=> b!1168433 (= lt!525915 (getCurrentListMapNoExtraKeys!4924 lt!525911 lt!525906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525912 () V!44273)

(assert (=> b!1168433 (= lt!525906 (array!75465 (store (arr!36383 _values!996) i!673 (ValueCellFull!13970 lt!525912)) (size!36921 _values!996)))))

(declare-fun dynLambda!2852 (Int (_ BitVec 64)) V!44273)

(assert (=> b!1168433 (= lt!525912 (dynLambda!2852 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!75466)

(declare-fun lt!525907 () ListLongMap!16865)

(assert (=> b!1168433 (= lt!525907 (getCurrentListMapNoExtraKeys!4924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168434 () Bool)

(declare-fun res!775250 () Bool)

(declare-fun e!664053 () Bool)

(assert (=> b!1168434 (=> (not res!775250) (not e!664053))))

(declare-datatypes ((List!25612 0))(
  ( (Nil!25609) (Cons!25608 (h!26817 (_ BitVec 64)) (t!37424 List!25612)) )
))
(declare-fun arrayNoDuplicates!0 (array!75466 (_ BitVec 32) List!25612) Bool)

(assert (=> b!1168434 (= res!775250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25609))))

(declare-fun b!1168435 () Bool)

(declare-fun res!775261 () Bool)

(assert (=> b!1168435 (=> (not res!775261) (not e!664053))))

(assert (=> b!1168435 (= res!775261 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36922 _keys!1208))))))

(declare-fun b!1168436 () Bool)

(declare-fun res!775253 () Bool)

(assert (=> b!1168436 (=> (not res!775253) (not e!664053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168436 (= res!775253 (validMask!0 mask!1564))))

(declare-fun b!1168437 () Bool)

(declare-fun res!775254 () Bool)

(assert (=> b!1168437 (=> (not res!775254) (not e!664053))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168437 (= res!775254 (validKeyInArray!0 k0!934))))

(declare-fun b!1168438 () Bool)

(declare-fun res!775260 () Bool)

(assert (=> b!1168438 (=> (not res!775260) (not e!664053))))

(assert (=> b!1168438 (= res!775260 (= (select (arr!36384 _keys!1208) i!673) k0!934))))

(declare-fun b!1168440 () Bool)

(declare-fun e!664048 () Bool)

(assert (=> b!1168440 (= e!664048 (not e!664049))))

(declare-fun res!775259 () Bool)

(assert (=> b!1168440 (=> res!775259 e!664049)))

(assert (=> b!1168440 (= res!775259 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168440 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38385 0))(
  ( (Unit!38386) )
))
(declare-fun lt!525913 () Unit!38385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75466 (_ BitVec 64) (_ BitVec 32)) Unit!38385)

(assert (=> b!1168440 (= lt!525913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168441 () Bool)

(declare-fun e!664054 () Bool)

(assert (=> b!1168441 (= e!664054 true)))

(declare-fun lt!525914 () ListLongMap!16865)

(declare-fun +!3775 (ListLongMap!16865 tuple2!18896) ListLongMap!16865)

(declare-fun get!18549 (ValueCell!13970 V!44273) V!44273)

(assert (=> b!1168441 (= lt!525915 (+!3775 lt!525914 (tuple2!18897 (select (arr!36384 _keys!1208) from!1455) (get!18549 (select (arr!36383 _values!996) from!1455) lt!525912))))))

(declare-fun mapIsEmpty!45863 () Bool)

(assert (=> mapIsEmpty!45863 mapRes!45863))

(declare-fun b!1168442 () Bool)

(assert (=> b!1168442 (= e!664053 e!664048)))

(declare-fun res!775252 () Bool)

(assert (=> b!1168442 (=> (not res!775252) (not e!664048))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75466 (_ BitVec 32)) Bool)

(assert (=> b!1168442 (= res!775252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525911 mask!1564))))

(assert (=> b!1168442 (= lt!525911 (array!75467 (store (arr!36384 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36922 _keys!1208)))))

(declare-fun b!1168443 () Bool)

(declare-fun res!775257 () Bool)

(assert (=> b!1168443 (=> (not res!775257) (not e!664053))))

(assert (=> b!1168443 (= res!775257 (and (= (size!36921 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36922 _keys!1208) (size!36921 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168444 () Bool)

(assert (=> b!1168444 (= e!664056 e!664054)))

(declare-fun res!775251 () Bool)

(assert (=> b!1168444 (=> res!775251 e!664054)))

(assert (=> b!1168444 (= res!775251 (not (validKeyInArray!0 (select (arr!36384 _keys!1208) from!1455))))))

(declare-fun lt!525908 () ListLongMap!16865)

(assert (=> b!1168444 (= lt!525908 lt!525914)))

(declare-fun lt!525909 () ListLongMap!16865)

(declare-fun -!1455 (ListLongMap!16865 (_ BitVec 64)) ListLongMap!16865)

(assert (=> b!1168444 (= lt!525914 (-!1455 lt!525909 k0!934))))

(assert (=> b!1168444 (= lt!525908 (getCurrentListMapNoExtraKeys!4924 lt!525911 lt!525906 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1168444 (= lt!525909 (getCurrentListMapNoExtraKeys!4924 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!525910 () Unit!38385)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!719 (array!75466 array!75464 (_ BitVec 32) (_ BitVec 32) V!44273 V!44273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38385)

(assert (=> b!1168444 (= lt!525910 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!719 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168445 () Bool)

(assert (=> b!1168445 (= e!664051 tp_is_empty!29359)))

(declare-fun b!1168446 () Bool)

(declare-fun res!775255 () Bool)

(assert (=> b!1168446 (=> (not res!775255) (not e!664048))))

(assert (=> b!1168446 (= res!775255 (arrayNoDuplicates!0 lt!525911 #b00000000000000000000000000000000 Nil!25609))))

(declare-fun b!1168439 () Bool)

(declare-fun res!775258 () Bool)

(assert (=> b!1168439 (=> (not res!775258) (not e!664053))))

(assert (=> b!1168439 (= res!775258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!775262 () Bool)

(assert (=> start!99218 (=> (not res!775262) (not e!664053))))

(assert (=> start!99218 (= res!775262 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36922 _keys!1208))))))

(assert (=> start!99218 e!664053))

(assert (=> start!99218 tp_is_empty!29359))

(declare-fun array_inv!27914 (array!75466) Bool)

(assert (=> start!99218 (array_inv!27914 _keys!1208)))

(assert (=> start!99218 true))

(assert (=> start!99218 tp!87197))

(declare-fun array_inv!27915 (array!75464) Bool)

(assert (=> start!99218 (and (array_inv!27915 _values!996) e!664052)))

(assert (= (and start!99218 res!775262) b!1168436))

(assert (= (and b!1168436 res!775253) b!1168443))

(assert (= (and b!1168443 res!775257) b!1168439))

(assert (= (and b!1168439 res!775258) b!1168434))

(assert (= (and b!1168434 res!775250) b!1168435))

(assert (= (and b!1168435 res!775261) b!1168437))

(assert (= (and b!1168437 res!775254) b!1168438))

(assert (= (and b!1168438 res!775260) b!1168442))

(assert (= (and b!1168442 res!775252) b!1168446))

(assert (= (and b!1168446 res!775255) b!1168440))

(assert (= (and b!1168440 (not res!775259)) b!1168433))

(assert (= (and b!1168433 (not res!775256)) b!1168444))

(assert (= (and b!1168444 (not res!775251)) b!1168441))

(assert (= (and b!1168431 condMapEmpty!45863) mapIsEmpty!45863))

(assert (= (and b!1168431 (not condMapEmpty!45863)) mapNonEmpty!45863))

(get-info :version)

(assert (= (and mapNonEmpty!45863 ((_ is ValueCellFull!13970) mapValue!45863)) b!1168432))

(assert (= (and b!1168431 ((_ is ValueCellFull!13970) mapDefault!45863)) b!1168445))

(assert (= start!99218 b!1168431))

(declare-fun b_lambda!19917 () Bool)

(assert (=> (not b_lambda!19917) (not b!1168433)))

(declare-fun t!37422 () Bool)

(declare-fun tb!9633 () Bool)

(assert (=> (and start!99218 (= defaultEntry!1004 defaultEntry!1004) t!37422) tb!9633))

(declare-fun result!19839 () Bool)

(assert (=> tb!9633 (= result!19839 tp_is_empty!29359)))

(assert (=> b!1168433 t!37422))

(declare-fun b_and!40487 () Bool)

(assert (= b_and!40485 (and (=> t!37422 result!19839) b_and!40487)))

(declare-fun m!1075783 () Bool)

(assert (=> start!99218 m!1075783))

(declare-fun m!1075785 () Bool)

(assert (=> start!99218 m!1075785))

(declare-fun m!1075787 () Bool)

(assert (=> b!1168444 m!1075787))

(declare-fun m!1075789 () Bool)

(assert (=> b!1168444 m!1075789))

(declare-fun m!1075791 () Bool)

(assert (=> b!1168444 m!1075791))

(declare-fun m!1075793 () Bool)

(assert (=> b!1168444 m!1075793))

(declare-fun m!1075795 () Bool)

(assert (=> b!1168444 m!1075795))

(declare-fun m!1075797 () Bool)

(assert (=> b!1168444 m!1075797))

(assert (=> b!1168444 m!1075795))

(declare-fun m!1075799 () Bool)

(assert (=> b!1168439 m!1075799))

(declare-fun m!1075801 () Bool)

(assert (=> b!1168433 m!1075801))

(declare-fun m!1075803 () Bool)

(assert (=> b!1168433 m!1075803))

(declare-fun m!1075805 () Bool)

(assert (=> b!1168433 m!1075805))

(declare-fun m!1075807 () Bool)

(assert (=> b!1168433 m!1075807))

(assert (=> b!1168441 m!1075795))

(declare-fun m!1075809 () Bool)

(assert (=> b!1168441 m!1075809))

(assert (=> b!1168441 m!1075809))

(declare-fun m!1075811 () Bool)

(assert (=> b!1168441 m!1075811))

(declare-fun m!1075813 () Bool)

(assert (=> b!1168441 m!1075813))

(declare-fun m!1075815 () Bool)

(assert (=> b!1168437 m!1075815))

(declare-fun m!1075817 () Bool)

(assert (=> b!1168438 m!1075817))

(declare-fun m!1075819 () Bool)

(assert (=> b!1168442 m!1075819))

(declare-fun m!1075821 () Bool)

(assert (=> b!1168442 m!1075821))

(declare-fun m!1075823 () Bool)

(assert (=> b!1168446 m!1075823))

(declare-fun m!1075825 () Bool)

(assert (=> mapNonEmpty!45863 m!1075825))

(declare-fun m!1075827 () Bool)

(assert (=> b!1168436 m!1075827))

(declare-fun m!1075829 () Bool)

(assert (=> b!1168434 m!1075829))

(declare-fun m!1075831 () Bool)

(assert (=> b!1168440 m!1075831))

(declare-fun m!1075833 () Bool)

(assert (=> b!1168440 m!1075833))

(check-sat (not b!1168442) (not mapNonEmpty!45863) (not b!1168444) tp_is_empty!29359 (not b_lambda!19917) (not b!1168436) (not b!1168446) (not b!1168437) b_and!40487 (not b!1168440) (not b!1168433) (not b!1168434) (not b!1168441) (not b!1168439) (not start!99218) (not b_next!24829))
(check-sat b_and!40487 (not b_next!24829))
