; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101772 () Bool)

(assert start!101772)

(declare-fun b_free!26467 () Bool)

(declare-fun b_next!26467 () Bool)

(assert (=> start!101772 (= b_free!26467 (not b_next!26467))))

(declare-fun tp!92446 () Bool)

(declare-fun b_and!44177 () Bool)

(assert (=> start!101772 (= tp!92446 b_and!44177)))

(declare-fun b!1225739 () Bool)

(declare-fun res!814614 () Bool)

(declare-fun e!696158 () Bool)

(assert (=> b!1225739 (=> (not res!814614) (not e!696158))))

(declare-datatypes ((array!79040 0))(
  ( (array!79041 (arr!38147 (Array (_ BitVec 32) (_ BitVec 64))) (size!38685 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79040)

(declare-datatypes ((List!27027 0))(
  ( (Nil!27024) (Cons!27023 (h!28232 (_ BitVec 64)) (t!40465 List!27027)) )
))
(declare-fun arrayNoDuplicates!0 (array!79040 (_ BitVec 32) List!27027) Bool)

(assert (=> b!1225739 (= res!814614 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!27024))))

(declare-fun b!1225740 () Bool)

(declare-fun e!696155 () Bool)

(declare-fun e!696153 () Bool)

(assert (=> b!1225740 (= e!696155 (not e!696153))))

(declare-fun res!814607 () Bool)

(assert (=> b!1225740 (=> res!814607 e!696153)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1225740 (= res!814607 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79040 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225740 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40477 0))(
  ( (Unit!40478) )
))
(declare-fun lt!558416 () Unit!40477)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79040 (_ BitVec 64) (_ BitVec 32)) Unit!40477)

(assert (=> b!1225740 (= lt!558416 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225741 () Bool)

(declare-fun res!814608 () Bool)

(assert (=> b!1225741 (=> (not res!814608) (not e!696158))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79040 (_ BitVec 32)) Bool)

(assert (=> b!1225741 (= res!814608 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225742 () Bool)

(declare-fun e!696156 () Bool)

(declare-fun tp_is_empty!31171 () Bool)

(assert (=> b!1225742 (= e!696156 tp_is_empty!31171)))

(declare-fun b!1225743 () Bool)

(declare-fun res!814617 () Bool)

(assert (=> b!1225743 (=> (not res!814617) (not e!696158))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46689 0))(
  ( (V!46690 (val!15642 Int)) )
))
(declare-datatypes ((ValueCell!14876 0))(
  ( (ValueCellFull!14876 (v!18303 V!46689)) (EmptyCell!14876) )
))
(declare-datatypes ((array!79042 0))(
  ( (array!79043 (arr!38148 (Array (_ BitVec 32) ValueCell!14876)) (size!38686 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79042)

(assert (=> b!1225743 (= res!814617 (and (= (size!38686 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38685 _keys!1208) (size!38686 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225744 () Bool)

(declare-fun res!814616 () Bool)

(assert (=> b!1225744 (=> (not res!814616) (not e!696155))))

(declare-fun lt!558417 () array!79040)

(assert (=> b!1225744 (= res!814616 (arrayNoDuplicates!0 lt!558417 #b00000000000000000000000000000000 Nil!27024))))

(declare-fun b!1225745 () Bool)

(declare-fun e!696159 () Bool)

(assert (=> b!1225745 (= e!696159 tp_is_empty!31171)))

(declare-fun b!1225746 () Bool)

(declare-fun e!696160 () Bool)

(assert (=> b!1225746 (= e!696160 true)))

(declare-fun zeroValue!944 () V!46689)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558421 () array!79042)

(declare-fun minValue!944 () V!46689)

(declare-datatypes ((tuple2!20248 0))(
  ( (tuple2!20249 (_1!10135 (_ BitVec 64)) (_2!10135 V!46689)) )
))
(declare-datatypes ((List!27028 0))(
  ( (Nil!27025) (Cons!27024 (h!28233 tuple2!20248) (t!40466 List!27028)) )
))
(declare-datatypes ((ListLongMap!18217 0))(
  ( (ListLongMap!18218 (toList!9124 List!27028)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5553 (array!79040 array!79042 (_ BitVec 32) (_ BitVec 32) V!46689 V!46689 (_ BitVec 32) Int) ListLongMap!18217)

(declare-fun -!1939 (ListLongMap!18217 (_ BitVec 64)) ListLongMap!18217)

(assert (=> b!1225746 (= (getCurrentListMapNoExtraKeys!5553 lt!558417 lt!558421 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1939 (getCurrentListMapNoExtraKeys!5553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!558419 () Unit!40477)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1170 (array!79040 array!79042 (_ BitVec 32) (_ BitVec 32) V!46689 V!46689 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40477)

(assert (=> b!1225746 (= lt!558419 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1170 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225747 () Bool)

(declare-fun res!814613 () Bool)

(assert (=> b!1225747 (=> (not res!814613) (not e!696158))))

(assert (=> b!1225747 (= res!814613 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38685 _keys!1208))))))

(declare-fun mapIsEmpty!48655 () Bool)

(declare-fun mapRes!48655 () Bool)

(assert (=> mapIsEmpty!48655 mapRes!48655))

(declare-fun b!1225748 () Bool)

(declare-fun res!814609 () Bool)

(assert (=> b!1225748 (=> (not res!814609) (not e!696158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225748 (= res!814609 (validMask!0 mask!1564))))

(declare-fun b!1225749 () Bool)

(assert (=> b!1225749 (= e!696153 e!696160)))

(declare-fun res!814615 () Bool)

(assert (=> b!1225749 (=> res!814615 e!696160)))

(assert (=> b!1225749 (= res!814615 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!558418 () ListLongMap!18217)

(assert (=> b!1225749 (= lt!558418 (getCurrentListMapNoExtraKeys!5553 lt!558417 lt!558421 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3398 (Int (_ BitVec 64)) V!46689)

(assert (=> b!1225749 (= lt!558421 (array!79043 (store (arr!38148 _values!996) i!673 (ValueCellFull!14876 (dynLambda!3398 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38686 _values!996)))))

(declare-fun lt!558420 () ListLongMap!18217)

(assert (=> b!1225749 (= lt!558420 (getCurrentListMapNoExtraKeys!5553 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225750 () Bool)

(declare-fun res!814611 () Bool)

(assert (=> b!1225750 (=> (not res!814611) (not e!696158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225750 (= res!814611 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48655 () Bool)

(declare-fun tp!92447 () Bool)

(assert (=> mapNonEmpty!48655 (= mapRes!48655 (and tp!92447 e!696159))))

(declare-fun mapValue!48655 () ValueCell!14876)

(declare-fun mapKey!48655 () (_ BitVec 32))

(declare-fun mapRest!48655 () (Array (_ BitVec 32) ValueCell!14876))

(assert (=> mapNonEmpty!48655 (= (arr!38148 _values!996) (store mapRest!48655 mapKey!48655 mapValue!48655))))

(declare-fun b!1225751 () Bool)

(declare-fun e!696154 () Bool)

(assert (=> b!1225751 (= e!696154 (and e!696156 mapRes!48655))))

(declare-fun condMapEmpty!48655 () Bool)

(declare-fun mapDefault!48655 () ValueCell!14876)

(assert (=> b!1225751 (= condMapEmpty!48655 (= (arr!38148 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14876)) mapDefault!48655)))))

(declare-fun b!1225752 () Bool)

(declare-fun res!814612 () Bool)

(assert (=> b!1225752 (=> (not res!814612) (not e!696158))))

(assert (=> b!1225752 (= res!814612 (= (select (arr!38147 _keys!1208) i!673) k0!934))))

(declare-fun res!814610 () Bool)

(assert (=> start!101772 (=> (not res!814610) (not e!696158))))

(assert (=> start!101772 (= res!814610 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38685 _keys!1208))))))

(assert (=> start!101772 e!696158))

(assert (=> start!101772 tp_is_empty!31171))

(declare-fun array_inv!29136 (array!79040) Bool)

(assert (=> start!101772 (array_inv!29136 _keys!1208)))

(assert (=> start!101772 true))

(assert (=> start!101772 tp!92446))

(declare-fun array_inv!29137 (array!79042) Bool)

(assert (=> start!101772 (and (array_inv!29137 _values!996) e!696154)))

(declare-fun b!1225753 () Bool)

(assert (=> b!1225753 (= e!696158 e!696155)))

(declare-fun res!814606 () Bool)

(assert (=> b!1225753 (=> (not res!814606) (not e!696155))))

(assert (=> b!1225753 (= res!814606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558417 mask!1564))))

(assert (=> b!1225753 (= lt!558417 (array!79041 (store (arr!38147 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38685 _keys!1208)))))

(assert (= (and start!101772 res!814610) b!1225748))

(assert (= (and b!1225748 res!814609) b!1225743))

(assert (= (and b!1225743 res!814617) b!1225741))

(assert (= (and b!1225741 res!814608) b!1225739))

(assert (= (and b!1225739 res!814614) b!1225747))

(assert (= (and b!1225747 res!814613) b!1225750))

(assert (= (and b!1225750 res!814611) b!1225752))

(assert (= (and b!1225752 res!814612) b!1225753))

(assert (= (and b!1225753 res!814606) b!1225744))

(assert (= (and b!1225744 res!814616) b!1225740))

(assert (= (and b!1225740 (not res!814607)) b!1225749))

(assert (= (and b!1225749 (not res!814615)) b!1225746))

(assert (= (and b!1225751 condMapEmpty!48655) mapIsEmpty!48655))

(assert (= (and b!1225751 (not condMapEmpty!48655)) mapNonEmpty!48655))

(get-info :version)

(assert (= (and mapNonEmpty!48655 ((_ is ValueCellFull!14876) mapValue!48655)) b!1225745))

(assert (= (and b!1225751 ((_ is ValueCellFull!14876) mapDefault!48655)) b!1225742))

(assert (= start!101772 b!1225751))

(declare-fun b_lambda!22437 () Bool)

(assert (=> (not b_lambda!22437) (not b!1225749)))

(declare-fun t!40464 () Bool)

(declare-fun tb!11259 () Bool)

(assert (=> (and start!101772 (= defaultEntry!1004 defaultEntry!1004) t!40464) tb!11259))

(declare-fun result!23139 () Bool)

(assert (=> tb!11259 (= result!23139 tp_is_empty!31171)))

(assert (=> b!1225749 t!40464))

(declare-fun b_and!44179 () Bool)

(assert (= b_and!44177 (and (=> t!40464 result!23139) b_and!44179)))

(declare-fun m!1130393 () Bool)

(assert (=> b!1225753 m!1130393))

(declare-fun m!1130395 () Bool)

(assert (=> b!1225753 m!1130395))

(declare-fun m!1130397 () Bool)

(assert (=> start!101772 m!1130397))

(declare-fun m!1130399 () Bool)

(assert (=> start!101772 m!1130399))

(declare-fun m!1130401 () Bool)

(assert (=> b!1225750 m!1130401))

(declare-fun m!1130403 () Bool)

(assert (=> b!1225740 m!1130403))

(declare-fun m!1130405 () Bool)

(assert (=> b!1225740 m!1130405))

(declare-fun m!1130407 () Bool)

(assert (=> mapNonEmpty!48655 m!1130407))

(declare-fun m!1130409 () Bool)

(assert (=> b!1225748 m!1130409))

(declare-fun m!1130411 () Bool)

(assert (=> b!1225744 m!1130411))

(declare-fun m!1130413 () Bool)

(assert (=> b!1225752 m!1130413))

(declare-fun m!1130415 () Bool)

(assert (=> b!1225739 m!1130415))

(declare-fun m!1130417 () Bool)

(assert (=> b!1225741 m!1130417))

(declare-fun m!1130419 () Bool)

(assert (=> b!1225749 m!1130419))

(declare-fun m!1130421 () Bool)

(assert (=> b!1225749 m!1130421))

(declare-fun m!1130423 () Bool)

(assert (=> b!1225749 m!1130423))

(declare-fun m!1130425 () Bool)

(assert (=> b!1225749 m!1130425))

(declare-fun m!1130427 () Bool)

(assert (=> b!1225746 m!1130427))

(declare-fun m!1130429 () Bool)

(assert (=> b!1225746 m!1130429))

(assert (=> b!1225746 m!1130429))

(declare-fun m!1130431 () Bool)

(assert (=> b!1225746 m!1130431))

(declare-fun m!1130433 () Bool)

(assert (=> b!1225746 m!1130433))

(check-sat (not b!1225744) (not b!1225749) (not mapNonEmpty!48655) (not b!1225750) (not b!1225741) (not b!1225739) (not b!1225753) (not b_next!26467) (not b!1225746) b_and!44179 (not b!1225748) (not b_lambda!22437) (not b!1225740) tp_is_empty!31171 (not start!101772))
(check-sat b_and!44179 (not b_next!26467))
