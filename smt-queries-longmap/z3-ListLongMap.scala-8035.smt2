; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99286 () Bool)

(assert start!99286)

(declare-fun b_free!24655 () Bool)

(declare-fun b_next!24655 () Bool)

(assert (=> start!99286 (= b_free!24655 (not b_next!24655))))

(declare-fun tp!86675 () Bool)

(declare-fun b_and!40161 () Bool)

(assert (=> start!99286 (= tp!86675 b_and!40161)))

(declare-fun mapIsEmpty!45602 () Bool)

(declare-fun mapRes!45602 () Bool)

(assert (=> mapIsEmpty!45602 mapRes!45602))

(declare-fun b!1165824 () Bool)

(declare-fun e!662938 () Bool)

(declare-fun tp_is_empty!29185 () Bool)

(assert (=> b!1165824 (= e!662938 tp_is_empty!29185)))

(declare-fun b!1165825 () Bool)

(declare-fun e!662942 () Bool)

(declare-fun e!662943 () Bool)

(assert (=> b!1165825 (= e!662942 (not e!662943))))

(declare-fun res!772761 () Bool)

(assert (=> b!1165825 (=> res!772761 e!662943)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165825 (= res!772761 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75255 0))(
  ( (array!75256 (arr!36272 (Array (_ BitVec 32) (_ BitVec 64))) (size!36809 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75255)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1165825 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38421 0))(
  ( (Unit!38422) )
))
(declare-fun lt!525148 () Unit!38421)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75255 (_ BitVec 64) (_ BitVec 32)) Unit!38421)

(assert (=> b!1165825 (= lt!525148 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1165826 () Bool)

(declare-fun res!772768 () Bool)

(declare-fun e!662940 () Bool)

(assert (=> b!1165826 (=> (not res!772768) (not e!662940))))

(assert (=> b!1165826 (= res!772768 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36809 _keys!1208))))))

(declare-fun b!1165827 () Bool)

(declare-fun res!772766 () Bool)

(assert (=> b!1165827 (=> (not res!772766) (not e!662942))))

(declare-fun lt!525150 () array!75255)

(declare-datatypes ((List!25450 0))(
  ( (Nil!25447) (Cons!25446 (h!26664 (_ BitVec 64)) (t!37089 List!25450)) )
))
(declare-fun arrayNoDuplicates!0 (array!75255 (_ BitVec 32) List!25450) Bool)

(assert (=> b!1165827 (= res!772766 (arrayNoDuplicates!0 lt!525150 #b00000000000000000000000000000000 Nil!25447))))

(declare-fun b!1165828 () Bool)

(declare-fun res!772763 () Bool)

(assert (=> b!1165828 (=> (not res!772763) (not e!662940))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165828 (= res!772763 (validKeyInArray!0 k0!934))))

(declare-fun b!1165829 () Bool)

(declare-fun e!662939 () Bool)

(assert (=> b!1165829 (= e!662939 tp_is_empty!29185)))

(declare-fun b!1165830 () Bool)

(declare-fun res!772762 () Bool)

(assert (=> b!1165830 (=> (not res!772762) (not e!662940))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165830 (= res!772762 (validMask!0 mask!1564))))

(declare-fun b!1165831 () Bool)

(declare-fun res!772770 () Bool)

(assert (=> b!1165831 (=> (not res!772770) (not e!662940))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75255 (_ BitVec 32)) Bool)

(assert (=> b!1165831 (= res!772770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165832 () Bool)

(declare-fun res!772760 () Bool)

(assert (=> b!1165832 (=> (not res!772760) (not e!662940))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44041 0))(
  ( (V!44042 (val!14649 Int)) )
))
(declare-datatypes ((ValueCell!13883 0))(
  ( (ValueCellFull!13883 (v!17282 V!44041)) (EmptyCell!13883) )
))
(declare-datatypes ((array!75257 0))(
  ( (array!75258 (arr!36273 (Array (_ BitVec 32) ValueCell!13883)) (size!36810 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75257)

(assert (=> b!1165832 (= res!772760 (and (= (size!36810 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36809 _keys!1208) (size!36810 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165833 () Bool)

(declare-fun res!772765 () Bool)

(assert (=> b!1165833 (=> (not res!772765) (not e!662940))))

(assert (=> b!1165833 (= res!772765 (= (select (arr!36272 _keys!1208) i!673) k0!934))))

(declare-fun b!1165834 () Bool)

(declare-fun e!662944 () Bool)

(assert (=> b!1165834 (= e!662944 (and e!662938 mapRes!45602))))

(declare-fun condMapEmpty!45602 () Bool)

(declare-fun mapDefault!45602 () ValueCell!13883)

(assert (=> b!1165834 (= condMapEmpty!45602 (= (arr!36273 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13883)) mapDefault!45602)))))

(declare-fun b!1165835 () Bool)

(assert (=> b!1165835 (= e!662943 true)))

(declare-fun zeroValue!944 () V!44041)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18714 0))(
  ( (tuple2!18715 (_1!9368 (_ BitVec 64)) (_2!9368 V!44041)) )
))
(declare-datatypes ((List!25451 0))(
  ( (Nil!25448) (Cons!25447 (h!26665 tuple2!18714) (t!37090 List!25451)) )
))
(declare-datatypes ((ListLongMap!16691 0))(
  ( (ListLongMap!16692 (toList!8361 List!25451)) )
))
(declare-fun lt!525151 () ListLongMap!16691)

(declare-fun minValue!944 () V!44041)

(declare-fun getCurrentListMapNoExtraKeys!4852 (array!75255 array!75257 (_ BitVec 32) (_ BitVec 32) V!44041 V!44041 (_ BitVec 32) Int) ListLongMap!16691)

(declare-fun dynLambda!2841 (Int (_ BitVec 64)) V!44041)

(assert (=> b!1165835 (= lt!525151 (getCurrentListMapNoExtraKeys!4852 lt!525150 (array!75258 (store (arr!36273 _values!996) i!673 (ValueCellFull!13883 (dynLambda!2841 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36810 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!525149 () ListLongMap!16691)

(assert (=> b!1165835 (= lt!525149 (getCurrentListMapNoExtraKeys!4852 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165823 () Bool)

(assert (=> b!1165823 (= e!662940 e!662942)))

(declare-fun res!772767 () Bool)

(assert (=> b!1165823 (=> (not res!772767) (not e!662942))))

(assert (=> b!1165823 (= res!772767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!525150 mask!1564))))

(assert (=> b!1165823 (= lt!525150 (array!75256 (store (arr!36272 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36809 _keys!1208)))))

(declare-fun res!772769 () Bool)

(assert (=> start!99286 (=> (not res!772769) (not e!662940))))

(assert (=> start!99286 (= res!772769 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36809 _keys!1208))))))

(assert (=> start!99286 e!662940))

(assert (=> start!99286 tp_is_empty!29185))

(declare-fun array_inv!27818 (array!75255) Bool)

(assert (=> start!99286 (array_inv!27818 _keys!1208)))

(assert (=> start!99286 true))

(assert (=> start!99286 tp!86675))

(declare-fun array_inv!27819 (array!75257) Bool)

(assert (=> start!99286 (and (array_inv!27819 _values!996) e!662944)))

(declare-fun b!1165836 () Bool)

(declare-fun res!772764 () Bool)

(assert (=> b!1165836 (=> (not res!772764) (not e!662940))))

(assert (=> b!1165836 (= res!772764 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25447))))

(declare-fun mapNonEmpty!45602 () Bool)

(declare-fun tp!86676 () Bool)

(assert (=> mapNonEmpty!45602 (= mapRes!45602 (and tp!86676 e!662939))))

(declare-fun mapValue!45602 () ValueCell!13883)

(declare-fun mapKey!45602 () (_ BitVec 32))

(declare-fun mapRest!45602 () (Array (_ BitVec 32) ValueCell!13883))

(assert (=> mapNonEmpty!45602 (= (arr!36273 _values!996) (store mapRest!45602 mapKey!45602 mapValue!45602))))

(assert (= (and start!99286 res!772769) b!1165830))

(assert (= (and b!1165830 res!772762) b!1165832))

(assert (= (and b!1165832 res!772760) b!1165831))

(assert (= (and b!1165831 res!772770) b!1165836))

(assert (= (and b!1165836 res!772764) b!1165826))

(assert (= (and b!1165826 res!772768) b!1165828))

(assert (= (and b!1165828 res!772763) b!1165833))

(assert (= (and b!1165833 res!772765) b!1165823))

(assert (= (and b!1165823 res!772767) b!1165827))

(assert (= (and b!1165827 res!772766) b!1165825))

(assert (= (and b!1165825 (not res!772761)) b!1165835))

(assert (= (and b!1165834 condMapEmpty!45602) mapIsEmpty!45602))

(assert (= (and b!1165834 (not condMapEmpty!45602)) mapNonEmpty!45602))

(get-info :version)

(assert (= (and mapNonEmpty!45602 ((_ is ValueCellFull!13883) mapValue!45602)) b!1165829))

(assert (= (and b!1165834 ((_ is ValueCellFull!13883) mapDefault!45602)) b!1165824))

(assert (= start!99286 b!1165834))

(declare-fun b_lambda!19755 () Bool)

(assert (=> (not b_lambda!19755) (not b!1165835)))

(declare-fun t!37088 () Bool)

(declare-fun tb!9459 () Bool)

(assert (=> (and start!99286 (= defaultEntry!1004 defaultEntry!1004) t!37088) tb!9459))

(declare-fun result!19491 () Bool)

(assert (=> tb!9459 (= result!19491 tp_is_empty!29185)))

(assert (=> b!1165835 t!37088))

(declare-fun b_and!40163 () Bool)

(assert (= b_and!40161 (and (=> t!37088 result!19491) b_and!40163)))

(declare-fun m!1074509 () Bool)

(assert (=> b!1165831 m!1074509))

(declare-fun m!1074511 () Bool)

(assert (=> b!1165827 m!1074511))

(declare-fun m!1074513 () Bool)

(assert (=> b!1165825 m!1074513))

(declare-fun m!1074515 () Bool)

(assert (=> b!1165825 m!1074515))

(declare-fun m!1074517 () Bool)

(assert (=> b!1165833 m!1074517))

(declare-fun m!1074519 () Bool)

(assert (=> mapNonEmpty!45602 m!1074519))

(declare-fun m!1074521 () Bool)

(assert (=> b!1165836 m!1074521))

(declare-fun m!1074523 () Bool)

(assert (=> b!1165823 m!1074523))

(declare-fun m!1074525 () Bool)

(assert (=> b!1165823 m!1074525))

(declare-fun m!1074527 () Bool)

(assert (=> start!99286 m!1074527))

(declare-fun m!1074529 () Bool)

(assert (=> start!99286 m!1074529))

(declare-fun m!1074531 () Bool)

(assert (=> b!1165835 m!1074531))

(declare-fun m!1074533 () Bool)

(assert (=> b!1165835 m!1074533))

(declare-fun m!1074535 () Bool)

(assert (=> b!1165835 m!1074535))

(declare-fun m!1074537 () Bool)

(assert (=> b!1165835 m!1074537))

(declare-fun m!1074539 () Bool)

(assert (=> b!1165830 m!1074539))

(declare-fun m!1074541 () Bool)

(assert (=> b!1165828 m!1074541))

(check-sat (not start!99286) (not mapNonEmpty!45602) (not b_next!24655) (not b!1165827) (not b!1165825) (not b!1165823) b_and!40163 (not b!1165831) tp_is_empty!29185 (not b!1165830) (not b!1165836) (not b!1165828) (not b_lambda!19755) (not b!1165835))
(check-sat b_and!40163 (not b_next!24655))
