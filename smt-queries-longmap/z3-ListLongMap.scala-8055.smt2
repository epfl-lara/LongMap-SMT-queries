; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99406 () Bool)

(assert start!99406)

(declare-fun b_free!24775 () Bool)

(declare-fun b_next!24775 () Bool)

(assert (=> start!99406 (= b_free!24775 (not b_next!24775))))

(declare-fun tp!87036 () Bool)

(declare-fun b_and!40401 () Bool)

(assert (=> start!99406 (= tp!87036 b_and!40401)))

(declare-fun b!1168555 () Bool)

(declare-fun res!774843 () Bool)

(declare-fun e!664296 () Bool)

(assert (=> b!1168555 (=> (not res!774843) (not e!664296))))

(declare-datatypes ((array!75487 0))(
  ( (array!75488 (arr!36388 (Array (_ BitVec 32) (_ BitVec 64))) (size!36925 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75487)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1168555 (= res!774843 (= (select (arr!36388 _keys!1208) i!673) k0!934))))

(declare-fun b!1168556 () Bool)

(declare-fun e!664290 () Bool)

(declare-fun tp_is_empty!29305 () Bool)

(assert (=> b!1168556 (= e!664290 tp_is_empty!29305)))

(declare-fun b!1168557 () Bool)

(declare-fun res!774833 () Bool)

(assert (=> b!1168557 (=> (not res!774833) (not e!664296))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168557 (= res!774833 (validMask!0 mask!1564))))

(declare-fun b!1168558 () Bool)

(declare-fun res!774835 () Bool)

(assert (=> b!1168558 (=> (not res!774835) (not e!664296))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44201 0))(
  ( (V!44202 (val!14709 Int)) )
))
(declare-datatypes ((ValueCell!13943 0))(
  ( (ValueCellFull!13943 (v!17342 V!44201)) (EmptyCell!13943) )
))
(declare-datatypes ((array!75489 0))(
  ( (array!75490 (arr!36389 (Array (_ BitVec 32) ValueCell!13943)) (size!36926 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75489)

(assert (=> b!1168558 (= res!774835 (and (= (size!36926 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36925 _keys!1208) (size!36926 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168559 () Bool)

(declare-fun e!664297 () Bool)

(declare-fun mapRes!45782 () Bool)

(assert (=> b!1168559 (= e!664297 (and e!664290 mapRes!45782))))

(declare-fun condMapEmpty!45782 () Bool)

(declare-fun mapDefault!45782 () ValueCell!13943)

(assert (=> b!1168559 (= condMapEmpty!45782 (= (arr!36389 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13943)) mapDefault!45782)))))

(declare-fun b!1168560 () Bool)

(declare-fun res!774842 () Bool)

(assert (=> b!1168560 (=> (not res!774842) (not e!664296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75487 (_ BitVec 32)) Bool)

(assert (=> b!1168560 (= res!774842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45782 () Bool)

(assert (=> mapIsEmpty!45782 mapRes!45782))

(declare-fun b!1168562 () Bool)

(declare-fun res!774839 () Bool)

(assert (=> b!1168562 (=> (not res!774839) (not e!664296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168562 (= res!774839 (validKeyInArray!0 k0!934))))

(declare-fun b!1168563 () Bool)

(declare-fun e!664291 () Bool)

(assert (=> b!1168563 (= e!664291 tp_is_empty!29305)))

(declare-fun b!1168564 () Bool)

(declare-fun e!664293 () Bool)

(declare-fun e!664294 () Bool)

(assert (=> b!1168564 (= e!664293 (not e!664294))))

(declare-fun res!774832 () Bool)

(assert (=> b!1168564 (=> res!774832 e!664294)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1168564 (= res!774832 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168564 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38501 0))(
  ( (Unit!38502) )
))
(declare-fun lt!526053 () Unit!38501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75487 (_ BitVec 64) (_ BitVec 32)) Unit!38501)

(assert (=> b!1168564 (= lt!526053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168565 () Bool)

(declare-fun e!664292 () Bool)

(assert (=> b!1168565 (= e!664292 true)))

(declare-fun zeroValue!944 () V!44201)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44201)

(declare-fun lt!526054 () array!75489)

(declare-fun lt!526055 () array!75487)

(declare-datatypes ((tuple2!18798 0))(
  ( (tuple2!18799 (_1!9410 (_ BitVec 64)) (_2!9410 V!44201)) )
))
(declare-datatypes ((List!25539 0))(
  ( (Nil!25536) (Cons!25535 (h!26753 tuple2!18798) (t!37298 List!25539)) )
))
(declare-datatypes ((ListLongMap!16775 0))(
  ( (ListLongMap!16776 (toList!8403 List!25539)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4894 (array!75487 array!75489 (_ BitVec 32) (_ BitVec 32) V!44201 V!44201 (_ BitVec 32) Int) ListLongMap!16775)

(declare-fun -!1465 (ListLongMap!16775 (_ BitVec 64)) ListLongMap!16775)

(assert (=> b!1168565 (= (getCurrentListMapNoExtraKeys!4894 lt!526055 lt!526054 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1465 (getCurrentListMapNoExtraKeys!4894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!526052 () Unit!38501)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!690 (array!75487 array!75489 (_ BitVec 32) (_ BitVec 32) V!44201 V!44201 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38501)

(assert (=> b!1168565 (= lt!526052 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!690 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!45782 () Bool)

(declare-fun tp!87035 () Bool)

(assert (=> mapNonEmpty!45782 (= mapRes!45782 (and tp!87035 e!664291))))

(declare-fun mapValue!45782 () ValueCell!13943)

(declare-fun mapKey!45782 () (_ BitVec 32))

(declare-fun mapRest!45782 () (Array (_ BitVec 32) ValueCell!13943))

(assert (=> mapNonEmpty!45782 (= (arr!36389 _values!996) (store mapRest!45782 mapKey!45782 mapValue!45782))))

(declare-fun b!1168566 () Bool)

(declare-fun res!774840 () Bool)

(assert (=> b!1168566 (=> (not res!774840) (not e!664293))))

(declare-datatypes ((List!25540 0))(
  ( (Nil!25537) (Cons!25536 (h!26754 (_ BitVec 64)) (t!37299 List!25540)) )
))
(declare-fun arrayNoDuplicates!0 (array!75487 (_ BitVec 32) List!25540) Bool)

(assert (=> b!1168566 (= res!774840 (arrayNoDuplicates!0 lt!526055 #b00000000000000000000000000000000 Nil!25537))))

(declare-fun b!1168567 () Bool)

(declare-fun res!774836 () Bool)

(assert (=> b!1168567 (=> (not res!774836) (not e!664296))))

(assert (=> b!1168567 (= res!774836 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25537))))

(declare-fun b!1168568 () Bool)

(declare-fun res!774834 () Bool)

(assert (=> b!1168568 (=> (not res!774834) (not e!664296))))

(assert (=> b!1168568 (= res!774834 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36925 _keys!1208))))))

(declare-fun b!1168569 () Bool)

(assert (=> b!1168569 (= e!664294 e!664292)))

(declare-fun res!774841 () Bool)

(assert (=> b!1168569 (=> res!774841 e!664292)))

(assert (=> b!1168569 (= res!774841 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526057 () ListLongMap!16775)

(assert (=> b!1168569 (= lt!526057 (getCurrentListMapNoExtraKeys!4894 lt!526055 lt!526054 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2882 (Int (_ BitVec 64)) V!44201)

(assert (=> b!1168569 (= lt!526054 (array!75490 (store (arr!36389 _values!996) i!673 (ValueCellFull!13943 (dynLambda!2882 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36926 _values!996)))))

(declare-fun lt!526056 () ListLongMap!16775)

(assert (=> b!1168569 (= lt!526056 (getCurrentListMapNoExtraKeys!4894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168561 () Bool)

(assert (=> b!1168561 (= e!664296 e!664293)))

(declare-fun res!774837 () Bool)

(assert (=> b!1168561 (=> (not res!774837) (not e!664293))))

(assert (=> b!1168561 (= res!774837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526055 mask!1564))))

(assert (=> b!1168561 (= lt!526055 (array!75488 (store (arr!36388 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36925 _keys!1208)))))

(declare-fun res!774838 () Bool)

(assert (=> start!99406 (=> (not res!774838) (not e!664296))))

(assert (=> start!99406 (= res!774838 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36925 _keys!1208))))))

(assert (=> start!99406 e!664296))

(assert (=> start!99406 tp_is_empty!29305))

(declare-fun array_inv!27896 (array!75487) Bool)

(assert (=> start!99406 (array_inv!27896 _keys!1208)))

(assert (=> start!99406 true))

(assert (=> start!99406 tp!87036))

(declare-fun array_inv!27897 (array!75489) Bool)

(assert (=> start!99406 (and (array_inv!27897 _values!996) e!664297)))

(assert (= (and start!99406 res!774838) b!1168557))

(assert (= (and b!1168557 res!774833) b!1168558))

(assert (= (and b!1168558 res!774835) b!1168560))

(assert (= (and b!1168560 res!774842) b!1168567))

(assert (= (and b!1168567 res!774836) b!1168568))

(assert (= (and b!1168568 res!774834) b!1168562))

(assert (= (and b!1168562 res!774839) b!1168555))

(assert (= (and b!1168555 res!774843) b!1168561))

(assert (= (and b!1168561 res!774837) b!1168566))

(assert (= (and b!1168566 res!774840) b!1168564))

(assert (= (and b!1168564 (not res!774832)) b!1168569))

(assert (= (and b!1168569 (not res!774841)) b!1168565))

(assert (= (and b!1168559 condMapEmpty!45782) mapIsEmpty!45782))

(assert (= (and b!1168559 (not condMapEmpty!45782)) mapNonEmpty!45782))

(get-info :version)

(assert (= (and mapNonEmpty!45782 ((_ is ValueCellFull!13943) mapValue!45782)) b!1168563))

(assert (= (and b!1168559 ((_ is ValueCellFull!13943) mapDefault!45782)) b!1168556))

(assert (= start!99406 b!1168559))

(declare-fun b_lambda!19875 () Bool)

(assert (=> (not b_lambda!19875) (not b!1168569)))

(declare-fun t!37297 () Bool)

(declare-fun tb!9579 () Bool)

(assert (=> (and start!99406 (= defaultEntry!1004 defaultEntry!1004) t!37297) tb!9579))

(declare-fun result!19731 () Bool)

(assert (=> tb!9579 (= result!19731 tp_is_empty!29305)))

(assert (=> b!1168569 t!37297))

(declare-fun b_and!40403 () Bool)

(assert (= b_and!40401 (and (=> t!37297 result!19731) b_and!40403)))

(declare-fun m!1076789 () Bool)

(assert (=> b!1168560 m!1076789))

(declare-fun m!1076791 () Bool)

(assert (=> b!1168569 m!1076791))

(declare-fun m!1076793 () Bool)

(assert (=> b!1168569 m!1076793))

(declare-fun m!1076795 () Bool)

(assert (=> b!1168569 m!1076795))

(declare-fun m!1076797 () Bool)

(assert (=> b!1168569 m!1076797))

(declare-fun m!1076799 () Bool)

(assert (=> b!1168555 m!1076799))

(declare-fun m!1076801 () Bool)

(assert (=> start!99406 m!1076801))

(declare-fun m!1076803 () Bool)

(assert (=> start!99406 m!1076803))

(declare-fun m!1076805 () Bool)

(assert (=> mapNonEmpty!45782 m!1076805))

(declare-fun m!1076807 () Bool)

(assert (=> b!1168564 m!1076807))

(declare-fun m!1076809 () Bool)

(assert (=> b!1168564 m!1076809))

(declare-fun m!1076811 () Bool)

(assert (=> b!1168561 m!1076811))

(declare-fun m!1076813 () Bool)

(assert (=> b!1168561 m!1076813))

(declare-fun m!1076815 () Bool)

(assert (=> b!1168567 m!1076815))

(declare-fun m!1076817 () Bool)

(assert (=> b!1168565 m!1076817))

(declare-fun m!1076819 () Bool)

(assert (=> b!1168565 m!1076819))

(assert (=> b!1168565 m!1076819))

(declare-fun m!1076821 () Bool)

(assert (=> b!1168565 m!1076821))

(declare-fun m!1076823 () Bool)

(assert (=> b!1168565 m!1076823))

(declare-fun m!1076825 () Bool)

(assert (=> b!1168566 m!1076825))

(declare-fun m!1076827 () Bool)

(assert (=> b!1168557 m!1076827))

(declare-fun m!1076829 () Bool)

(assert (=> b!1168562 m!1076829))

(check-sat (not b!1168565) (not b!1168561) (not b!1168569) b_and!40403 (not b!1168562) (not b!1168557) (not mapNonEmpty!45782) (not b!1168560) (not b!1168564) tp_is_empty!29305 (not b_next!24775) (not b!1168566) (not start!99406) (not b!1168567) (not b_lambda!19875))
(check-sat b_and!40403 (not b_next!24775))
