; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99274 () Bool)

(assert start!99274)

(declare-fun b_free!24859 () Bool)

(declare-fun b_next!24859 () Bool)

(assert (=> start!99274 (= b_free!24859 (not b_next!24859))))

(declare-fun tp!87291 () Bool)

(declare-fun b_and!40563 () Bool)

(assert (=> start!99274 (= tp!87291 b_and!40563)))

(declare-fun mapNonEmpty!45911 () Bool)

(declare-fun mapRes!45911 () Bool)

(declare-fun tp!87290 () Bool)

(declare-fun e!664613 () Bool)

(assert (=> mapNonEmpty!45911 (= mapRes!45911 (and tp!87290 e!664613))))

(declare-fun mapKey!45911 () (_ BitVec 32))

(declare-datatypes ((V!44313 0))(
  ( (V!44314 (val!14751 Int)) )
))
(declare-datatypes ((ValueCell!13985 0))(
  ( (ValueCellFull!13985 (v!17388 V!44313)) (EmptyCell!13985) )
))
(declare-fun mapValue!45911 () ValueCell!13985)

(declare-fun mapRest!45911 () (Array (_ BitVec 32) ValueCell!13985))

(declare-datatypes ((array!75526 0))(
  ( (array!75527 (arr!36413 (Array (_ BitVec 32) ValueCell!13985)) (size!36951 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75526)

(assert (=> mapNonEmpty!45911 (= (arr!36413 _values!996) (store mapRest!45911 mapKey!45911 mapValue!45911))))

(declare-fun b!1169383 () Bool)

(declare-fun e!664614 () Bool)

(declare-fun tp_is_empty!29389 () Bool)

(assert (=> b!1169383 (= e!664614 tp_is_empty!29389)))

(declare-fun b!1169384 () Bool)

(declare-fun res!775960 () Bool)

(declare-fun e!664609 () Bool)

(assert (=> b!1169384 (=> (not res!775960) (not e!664609))))

(declare-datatypes ((array!75528 0))(
  ( (array!75529 (arr!36414 (Array (_ BitVec 32) (_ BitVec 64))) (size!36952 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75528)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1169384 (= res!775960 (= (select (arr!36414 _keys!1208) i!673) k0!934))))

(declare-fun b!1169385 () Bool)

(declare-fun res!775957 () Bool)

(assert (=> b!1169385 (=> (not res!775957) (not e!664609))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1169385 (= res!775957 (and (= (size!36951 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36952 _keys!1208) (size!36951 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169386 () Bool)

(declare-fun e!664612 () Bool)

(declare-fun e!664605 () Bool)

(assert (=> b!1169386 (= e!664612 e!664605)))

(declare-fun res!775965 () Bool)

(assert (=> b!1169386 (=> res!775965 e!664605)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1169386 (= res!775965 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44313)

(declare-fun lt!526438 () array!75526)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526435 () array!75528)

(declare-datatypes ((tuple2!18922 0))(
  ( (tuple2!18923 (_1!9472 (_ BitVec 64)) (_2!9472 V!44313)) )
))
(declare-datatypes ((List!25637 0))(
  ( (Nil!25634) (Cons!25633 (h!26842 tuple2!18922) (t!37479 List!25637)) )
))
(declare-datatypes ((ListLongMap!16891 0))(
  ( (ListLongMap!16892 (toList!8461 List!25637)) )
))
(declare-fun lt!526434 () ListLongMap!16891)

(declare-fun minValue!944 () V!44313)

(declare-fun getCurrentListMapNoExtraKeys!4936 (array!75528 array!75526 (_ BitVec 32) (_ BitVec 32) V!44313 V!44313 (_ BitVec 32) Int) ListLongMap!16891)

(assert (=> b!1169386 (= lt!526434 (getCurrentListMapNoExtraKeys!4936 lt!526435 lt!526438 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526432 () V!44313)

(assert (=> b!1169386 (= lt!526438 (array!75527 (store (arr!36413 _values!996) i!673 (ValueCellFull!13985 lt!526432)) (size!36951 _values!996)))))

(declare-fun dynLambda!2862 (Int (_ BitVec 64)) V!44313)

(assert (=> b!1169386 (= lt!526432 (dynLambda!2862 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526436 () ListLongMap!16891)

(assert (=> b!1169386 (= lt!526436 (getCurrentListMapNoExtraKeys!4936 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169387 () Bool)

(declare-fun res!775953 () Bool)

(assert (=> b!1169387 (=> (not res!775953) (not e!664609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169387 (= res!775953 (validKeyInArray!0 k0!934))))

(declare-fun e!664615 () Bool)

(declare-fun b!1169388 () Bool)

(declare-fun arrayContainsKey!0 (array!75528 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169388 (= e!664615 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169389 () Bool)

(assert (=> b!1169389 (= e!664613 tp_is_empty!29389)))

(declare-fun mapIsEmpty!45911 () Bool)

(assert (=> mapIsEmpty!45911 mapRes!45911))

(declare-fun b!1169390 () Bool)

(declare-fun e!664608 () Bool)

(assert (=> b!1169390 (= e!664608 e!664615)))

(declare-fun res!775958 () Bool)

(assert (=> b!1169390 (=> res!775958 e!664615)))

(assert (=> b!1169390 (= res!775958 (not (= (select (arr!36414 _keys!1208) from!1455) k0!934)))))

(declare-fun res!775954 () Bool)

(assert (=> start!99274 (=> (not res!775954) (not e!664609))))

(assert (=> start!99274 (= res!775954 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36952 _keys!1208))))))

(assert (=> start!99274 e!664609))

(assert (=> start!99274 tp_is_empty!29389))

(declare-fun array_inv!27932 (array!75528) Bool)

(assert (=> start!99274 (array_inv!27932 _keys!1208)))

(assert (=> start!99274 true))

(assert (=> start!99274 tp!87291))

(declare-fun e!664607 () Bool)

(declare-fun array_inv!27933 (array!75526) Bool)

(assert (=> start!99274 (and (array_inv!27933 _values!996) e!664607)))

(declare-fun b!1169382 () Bool)

(declare-fun res!775956 () Bool)

(declare-fun e!664611 () Bool)

(assert (=> b!1169382 (=> (not res!775956) (not e!664611))))

(declare-datatypes ((List!25638 0))(
  ( (Nil!25635) (Cons!25634 (h!26843 (_ BitVec 64)) (t!37480 List!25638)) )
))
(declare-fun arrayNoDuplicates!0 (array!75528 (_ BitVec 32) List!25638) Bool)

(assert (=> b!1169382 (= res!775956 (arrayNoDuplicates!0 lt!526435 #b00000000000000000000000000000000 Nil!25635))))

(declare-fun b!1169391 () Bool)

(declare-fun res!775964 () Bool)

(assert (=> b!1169391 (=> (not res!775964) (not e!664609))))

(assert (=> b!1169391 (= res!775964 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36952 _keys!1208))))))

(declare-fun b!1169392 () Bool)

(declare-fun res!775959 () Bool)

(assert (=> b!1169392 (=> (not res!775959) (not e!664609))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75528 (_ BitVec 32)) Bool)

(assert (=> b!1169392 (= res!775959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169393 () Bool)

(assert (=> b!1169393 (= e!664607 (and e!664614 mapRes!45911))))

(declare-fun condMapEmpty!45911 () Bool)

(declare-fun mapDefault!45911 () ValueCell!13985)

(assert (=> b!1169393 (= condMapEmpty!45911 (= (arr!36413 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13985)) mapDefault!45911)))))

(declare-fun b!1169394 () Bool)

(declare-fun e!664606 () Bool)

(assert (=> b!1169394 (= e!664605 e!664606)))

(declare-fun res!775963 () Bool)

(assert (=> b!1169394 (=> res!775963 e!664606)))

(assert (=> b!1169394 (= res!775963 (not (validKeyInArray!0 (select (arr!36414 _keys!1208) from!1455))))))

(declare-fun lt!526439 () ListLongMap!16891)

(declare-fun lt!526433 () ListLongMap!16891)

(assert (=> b!1169394 (= lt!526439 lt!526433)))

(declare-fun lt!526440 () ListLongMap!16891)

(declare-fun -!1464 (ListLongMap!16891 (_ BitVec 64)) ListLongMap!16891)

(assert (=> b!1169394 (= lt!526433 (-!1464 lt!526440 k0!934))))

(assert (=> b!1169394 (= lt!526439 (getCurrentListMapNoExtraKeys!4936 lt!526435 lt!526438 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169394 (= lt!526440 (getCurrentListMapNoExtraKeys!4936 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38409 0))(
  ( (Unit!38410) )
))
(declare-fun lt!526437 () Unit!38409)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!728 (array!75528 array!75526 (_ BitVec 32) (_ BitVec 32) V!44313 V!44313 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38409)

(assert (=> b!1169394 (= lt!526437 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!728 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169395 () Bool)

(declare-fun res!775966 () Bool)

(assert (=> b!1169395 (=> (not res!775966) (not e!664609))))

(assert (=> b!1169395 (= res!775966 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25635))))

(declare-fun b!1169396 () Bool)

(assert (=> b!1169396 (= e!664611 (not e!664612))))

(declare-fun res!775952 () Bool)

(assert (=> b!1169396 (=> res!775952 e!664612)))

(assert (=> b!1169396 (= res!775952 (bvsgt from!1455 i!673))))

(assert (=> b!1169396 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526431 () Unit!38409)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75528 (_ BitVec 64) (_ BitVec 32)) Unit!38409)

(assert (=> b!1169396 (= lt!526431 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169397 () Bool)

(declare-fun res!775961 () Bool)

(assert (=> b!1169397 (=> (not res!775961) (not e!664609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169397 (= res!775961 (validMask!0 mask!1564))))

(declare-fun b!1169398 () Bool)

(assert (=> b!1169398 (= e!664606 true)))

(assert (=> b!1169398 e!664608))

(declare-fun res!775955 () Bool)

(assert (=> b!1169398 (=> (not res!775955) (not e!664608))))

(declare-fun +!3785 (ListLongMap!16891 tuple2!18922) ListLongMap!16891)

(declare-fun get!18571 (ValueCell!13985 V!44313) V!44313)

(assert (=> b!1169398 (= res!775955 (= lt!526434 (+!3785 lt!526433 (tuple2!18923 (select (arr!36414 _keys!1208) from!1455) (get!18571 (select (arr!36413 _values!996) from!1455) lt!526432)))))))

(declare-fun b!1169399 () Bool)

(assert (=> b!1169399 (= e!664609 e!664611)))

(declare-fun res!775962 () Bool)

(assert (=> b!1169399 (=> (not res!775962) (not e!664611))))

(assert (=> b!1169399 (= res!775962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526435 mask!1564))))

(assert (=> b!1169399 (= lt!526435 (array!75529 (store (arr!36414 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36952 _keys!1208)))))

(assert (= (and start!99274 res!775954) b!1169397))

(assert (= (and b!1169397 res!775961) b!1169385))

(assert (= (and b!1169385 res!775957) b!1169392))

(assert (= (and b!1169392 res!775959) b!1169395))

(assert (= (and b!1169395 res!775966) b!1169391))

(assert (= (and b!1169391 res!775964) b!1169387))

(assert (= (and b!1169387 res!775953) b!1169384))

(assert (= (and b!1169384 res!775960) b!1169399))

(assert (= (and b!1169399 res!775962) b!1169382))

(assert (= (and b!1169382 res!775956) b!1169396))

(assert (= (and b!1169396 (not res!775952)) b!1169386))

(assert (= (and b!1169386 (not res!775965)) b!1169394))

(assert (= (and b!1169394 (not res!775963)) b!1169398))

(assert (= (and b!1169398 res!775955) b!1169390))

(assert (= (and b!1169390 (not res!775958)) b!1169388))

(assert (= (and b!1169393 condMapEmpty!45911) mapIsEmpty!45911))

(assert (= (and b!1169393 (not condMapEmpty!45911)) mapNonEmpty!45911))

(get-info :version)

(assert (= (and mapNonEmpty!45911 ((_ is ValueCellFull!13985) mapValue!45911)) b!1169389))

(assert (= (and b!1169393 ((_ is ValueCellFull!13985) mapDefault!45911)) b!1169383))

(assert (= start!99274 b!1169393))

(declare-fun b_lambda!19985 () Bool)

(assert (=> (not b_lambda!19985) (not b!1169386)))

(declare-fun t!37478 () Bool)

(declare-fun tb!9663 () Bool)

(assert (=> (and start!99274 (= defaultEntry!1004 defaultEntry!1004) t!37478) tb!9663))

(declare-fun result!19901 () Bool)

(assert (=> tb!9663 (= result!19901 tp_is_empty!29389)))

(assert (=> b!1169386 t!37478))

(declare-fun b_and!40565 () Bool)

(assert (= b_and!40563 (and (=> t!37478 result!19901) b_and!40565)))

(declare-fun m!1076753 () Bool)

(assert (=> b!1169394 m!1076753))

(declare-fun m!1076755 () Bool)

(assert (=> b!1169394 m!1076755))

(declare-fun m!1076757 () Bool)

(assert (=> b!1169394 m!1076757))

(declare-fun m!1076759 () Bool)

(assert (=> b!1169394 m!1076759))

(declare-fun m!1076761 () Bool)

(assert (=> b!1169394 m!1076761))

(declare-fun m!1076763 () Bool)

(assert (=> b!1169394 m!1076763))

(assert (=> b!1169394 m!1076761))

(declare-fun m!1076765 () Bool)

(assert (=> b!1169396 m!1076765))

(declare-fun m!1076767 () Bool)

(assert (=> b!1169396 m!1076767))

(declare-fun m!1076769 () Bool)

(assert (=> b!1169397 m!1076769))

(declare-fun m!1076771 () Bool)

(assert (=> b!1169392 m!1076771))

(declare-fun m!1076773 () Bool)

(assert (=> b!1169384 m!1076773))

(declare-fun m!1076775 () Bool)

(assert (=> b!1169387 m!1076775))

(declare-fun m!1076777 () Bool)

(assert (=> b!1169399 m!1076777))

(declare-fun m!1076779 () Bool)

(assert (=> b!1169399 m!1076779))

(declare-fun m!1076781 () Bool)

(assert (=> b!1169395 m!1076781))

(assert (=> b!1169398 m!1076761))

(declare-fun m!1076783 () Bool)

(assert (=> b!1169398 m!1076783))

(assert (=> b!1169398 m!1076783))

(declare-fun m!1076785 () Bool)

(assert (=> b!1169398 m!1076785))

(declare-fun m!1076787 () Bool)

(assert (=> b!1169398 m!1076787))

(declare-fun m!1076789 () Bool)

(assert (=> b!1169388 m!1076789))

(declare-fun m!1076791 () Bool)

(assert (=> start!99274 m!1076791))

(declare-fun m!1076793 () Bool)

(assert (=> start!99274 m!1076793))

(assert (=> b!1169390 m!1076761))

(declare-fun m!1076795 () Bool)

(assert (=> mapNonEmpty!45911 m!1076795))

(declare-fun m!1076797 () Bool)

(assert (=> b!1169382 m!1076797))

(declare-fun m!1076799 () Bool)

(assert (=> b!1169386 m!1076799))

(declare-fun m!1076801 () Bool)

(assert (=> b!1169386 m!1076801))

(declare-fun m!1076803 () Bool)

(assert (=> b!1169386 m!1076803))

(declare-fun m!1076805 () Bool)

(assert (=> b!1169386 m!1076805))

(check-sat (not mapNonEmpty!45911) (not b!1169394) (not b!1169395) (not b!1169382) (not b!1169388) b_and!40565 (not b!1169398) (not b!1169386) (not b_next!24859) (not b!1169396) (not b!1169387) (not b_lambda!19985) (not start!99274) (not b!1169397) tp_is_empty!29389 (not b!1169392) (not b!1169399))
(check-sat b_and!40565 (not b_next!24859))
