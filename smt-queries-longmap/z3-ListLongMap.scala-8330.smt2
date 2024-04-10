; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101382 () Bool)

(assert start!101382)

(declare-fun b_free!26253 () Bool)

(declare-fun b_next!26253 () Bool)

(assert (=> start!101382 (= b_free!26253 (not b_next!26253))))

(declare-fun tp!91787 () Bool)

(declare-fun b_and!43659 () Bool)

(assert (=> start!101382 (= tp!91787 b_and!43659)))

(declare-fun b!1218391 () Bool)

(declare-fun res!809196 () Bool)

(declare-fun e!691746 () Bool)

(assert (=> b!1218391 (=> (not res!809196) (not e!691746))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!78689 0))(
  ( (array!78690 (arr!37977 (Array (_ BitVec 32) (_ BitVec 64))) (size!38513 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78689)

(assert (=> b!1218391 (= res!809196 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38513 _keys!1208))))))

(declare-fun b!1218392 () Bool)

(declare-fun res!809194 () Bool)

(assert (=> b!1218392 (=> (not res!809194) (not e!691746))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1218392 (= res!809194 (validKeyInArray!0 k0!934))))

(declare-fun b!1218393 () Bool)

(declare-fun e!691748 () Bool)

(declare-fun e!691747 () Bool)

(assert (=> b!1218393 (= e!691748 e!691747)))

(declare-fun res!809195 () Bool)

(assert (=> b!1218393 (=> res!809195 e!691747)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218393 (= res!809195 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!46403 0))(
  ( (V!46404 (val!15535 Int)) )
))
(declare-fun zeroValue!944 () V!46403)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19984 0))(
  ( (tuple2!19985 (_1!10003 (_ BitVec 64)) (_2!10003 V!46403)) )
))
(declare-datatypes ((List!26786 0))(
  ( (Nil!26783) (Cons!26782 (h!27991 tuple2!19984) (t!40019 List!26786)) )
))
(declare-datatypes ((ListLongMap!17953 0))(
  ( (ListLongMap!17954 (toList!8992 List!26786)) )
))
(declare-fun lt!553866 () ListLongMap!17953)

(declare-datatypes ((ValueCell!14769 0))(
  ( (ValueCellFull!14769 (v!18190 V!46403)) (EmptyCell!14769) )
))
(declare-datatypes ((array!78691 0))(
  ( (array!78692 (arr!37978 (Array (_ BitVec 32) ValueCell!14769)) (size!38514 (_ BitVec 32))) )
))
(declare-fun lt!553869 () array!78691)

(declare-fun minValue!944 () V!46403)

(declare-fun lt!553864 () array!78689)

(declare-fun getCurrentListMapNoExtraKeys!5418 (array!78689 array!78691 (_ BitVec 32) (_ BitVec 32) V!46403 V!46403 (_ BitVec 32) Int) ListLongMap!17953)

(assert (=> b!1218393 (= lt!553866 (getCurrentListMapNoExtraKeys!5418 lt!553864 lt!553869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553872 () V!46403)

(declare-fun _values!996 () array!78691)

(assert (=> b!1218393 (= lt!553869 (array!78692 (store (arr!37978 _values!996) i!673 (ValueCellFull!14769 lt!553872)) (size!38514 _values!996)))))

(declare-fun dynLambda!3301 (Int (_ BitVec 64)) V!46403)

(assert (=> b!1218393 (= lt!553872 (dynLambda!3301 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!553863 () ListLongMap!17953)

(assert (=> b!1218393 (= lt!553863 (getCurrentListMapNoExtraKeys!5418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1218394 () Bool)

(declare-fun e!691744 () Bool)

(assert (=> b!1218394 (= e!691744 true)))

(declare-fun e!691751 () Bool)

(assert (=> b!1218394 e!691751))

(declare-fun res!809200 () Bool)

(assert (=> b!1218394 (=> (not res!809200) (not e!691751))))

(declare-fun lt!553868 () ListLongMap!17953)

(declare-fun +!4061 (ListLongMap!17953 tuple2!19984) ListLongMap!17953)

(declare-fun get!19356 (ValueCell!14769 V!46403) V!46403)

(assert (=> b!1218394 (= res!809200 (= lt!553866 (+!4061 lt!553868 (tuple2!19985 (select (arr!37977 _keys!1208) from!1455) (get!19356 (select (arr!37978 _values!996) from!1455) lt!553872)))))))

(declare-fun b!1218395 () Bool)

(declare-fun res!809199 () Bool)

(assert (=> b!1218395 (=> (not res!809199) (not e!691746))))

(declare-datatypes ((List!26787 0))(
  ( (Nil!26784) (Cons!26783 (h!27992 (_ BitVec 64)) (t!40020 List!26787)) )
))
(declare-fun arrayNoDuplicates!0 (array!78689 (_ BitVec 32) List!26787) Bool)

(assert (=> b!1218395 (= res!809199 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26784))))

(declare-fun b!1218397 () Bool)

(declare-fun e!691742 () Bool)

(declare-fun arrayContainsKey!0 (array!78689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218397 (= e!691742 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218398 () Bool)

(declare-fun res!809191 () Bool)

(declare-fun e!691743 () Bool)

(assert (=> b!1218398 (=> (not res!809191) (not e!691743))))

(assert (=> b!1218398 (= res!809191 (arrayNoDuplicates!0 lt!553864 #b00000000000000000000000000000000 Nil!26784))))

(declare-fun b!1218399 () Bool)

(declare-fun res!809188 () Bool)

(assert (=> b!1218399 (=> (not res!809188) (not e!691746))))

(assert (=> b!1218399 (= res!809188 (= (select (arr!37977 _keys!1208) i!673) k0!934))))

(declare-fun b!1218400 () Bool)

(declare-fun res!809198 () Bool)

(assert (=> b!1218400 (=> (not res!809198) (not e!691746))))

(assert (=> b!1218400 (= res!809198 (and (= (size!38514 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38513 _keys!1208) (size!38514 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218401 () Bool)

(declare-fun res!809192 () Bool)

(assert (=> b!1218401 (=> (not res!809192) (not e!691746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1218401 (= res!809192 (validMask!0 mask!1564))))

(declare-fun res!809201 () Bool)

(assert (=> start!101382 (=> (not res!809201) (not e!691746))))

(assert (=> start!101382 (= res!809201 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38513 _keys!1208))))))

(assert (=> start!101382 e!691746))

(declare-fun tp_is_empty!30957 () Bool)

(assert (=> start!101382 tp_is_empty!30957))

(declare-fun array_inv!28902 (array!78689) Bool)

(assert (=> start!101382 (array_inv!28902 _keys!1208)))

(assert (=> start!101382 true))

(assert (=> start!101382 tp!91787))

(declare-fun e!691749 () Bool)

(declare-fun array_inv!28903 (array!78691) Bool)

(assert (=> start!101382 (and (array_inv!28903 _values!996) e!691749)))

(declare-fun b!1218396 () Bool)

(declare-fun e!691745 () Bool)

(assert (=> b!1218396 (= e!691745 tp_is_empty!30957)))

(declare-fun b!1218402 () Bool)

(declare-fun e!691750 () Bool)

(assert (=> b!1218402 (= e!691750 tp_is_empty!30957)))

(declare-fun mapNonEmpty!48316 () Bool)

(declare-fun mapRes!48316 () Bool)

(declare-fun tp!91786 () Bool)

(assert (=> mapNonEmpty!48316 (= mapRes!48316 (and tp!91786 e!691745))))

(declare-fun mapKey!48316 () (_ BitVec 32))

(declare-fun mapRest!48316 () (Array (_ BitVec 32) ValueCell!14769))

(declare-fun mapValue!48316 () ValueCell!14769)

(assert (=> mapNonEmpty!48316 (= (arr!37978 _values!996) (store mapRest!48316 mapKey!48316 mapValue!48316))))

(declare-fun b!1218403 () Bool)

(assert (=> b!1218403 (= e!691747 e!691744)))

(declare-fun res!809187 () Bool)

(assert (=> b!1218403 (=> res!809187 e!691744)))

(assert (=> b!1218403 (= res!809187 (not (validKeyInArray!0 (select (arr!37977 _keys!1208) from!1455))))))

(declare-fun lt!553871 () ListLongMap!17953)

(assert (=> b!1218403 (= lt!553871 lt!553868)))

(declare-fun lt!553867 () ListLongMap!17953)

(declare-fun -!1907 (ListLongMap!17953 (_ BitVec 64)) ListLongMap!17953)

(assert (=> b!1218403 (= lt!553868 (-!1907 lt!553867 k0!934))))

(assert (=> b!1218403 (= lt!553871 (getCurrentListMapNoExtraKeys!5418 lt!553864 lt!553869 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1218403 (= lt!553867 (getCurrentListMapNoExtraKeys!5418 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40388 0))(
  ( (Unit!40389) )
))
(declare-fun lt!553865 () Unit!40388)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1114 (array!78689 array!78691 (_ BitVec 32) (_ BitVec 32) V!46403 V!46403 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40388)

(assert (=> b!1218403 (= lt!553865 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1114 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1218404 () Bool)

(assert (=> b!1218404 (= e!691749 (and e!691750 mapRes!48316))))

(declare-fun condMapEmpty!48316 () Bool)

(declare-fun mapDefault!48316 () ValueCell!14769)

(assert (=> b!1218404 (= condMapEmpty!48316 (= (arr!37978 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14769)) mapDefault!48316)))))

(declare-fun b!1218405 () Bool)

(declare-fun res!809197 () Bool)

(assert (=> b!1218405 (=> (not res!809197) (not e!691746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78689 (_ BitVec 32)) Bool)

(assert (=> b!1218405 (= res!809197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!48316 () Bool)

(assert (=> mapIsEmpty!48316 mapRes!48316))

(declare-fun b!1218406 () Bool)

(assert (=> b!1218406 (= e!691746 e!691743)))

(declare-fun res!809189 () Bool)

(assert (=> b!1218406 (=> (not res!809189) (not e!691743))))

(assert (=> b!1218406 (= res!809189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553864 mask!1564))))

(assert (=> b!1218406 (= lt!553864 (array!78690 (store (arr!37977 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38513 _keys!1208)))))

(declare-fun b!1218407 () Bool)

(assert (=> b!1218407 (= e!691743 (not e!691748))))

(declare-fun res!809190 () Bool)

(assert (=> b!1218407 (=> res!809190 e!691748)))

(assert (=> b!1218407 (= res!809190 (bvsgt from!1455 i!673))))

(assert (=> b!1218407 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!553870 () Unit!40388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78689 (_ BitVec 64) (_ BitVec 32)) Unit!40388)

(assert (=> b!1218407 (= lt!553870 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1218408 () Bool)

(assert (=> b!1218408 (= e!691751 e!691742)))

(declare-fun res!809193 () Bool)

(assert (=> b!1218408 (=> res!809193 e!691742)))

(assert (=> b!1218408 (= res!809193 (not (= (select (arr!37977 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!101382 res!809201) b!1218401))

(assert (= (and b!1218401 res!809192) b!1218400))

(assert (= (and b!1218400 res!809198) b!1218405))

(assert (= (and b!1218405 res!809197) b!1218395))

(assert (= (and b!1218395 res!809199) b!1218391))

(assert (= (and b!1218391 res!809196) b!1218392))

(assert (= (and b!1218392 res!809194) b!1218399))

(assert (= (and b!1218399 res!809188) b!1218406))

(assert (= (and b!1218406 res!809189) b!1218398))

(assert (= (and b!1218398 res!809191) b!1218407))

(assert (= (and b!1218407 (not res!809190)) b!1218393))

(assert (= (and b!1218393 (not res!809195)) b!1218403))

(assert (= (and b!1218403 (not res!809187)) b!1218394))

(assert (= (and b!1218394 res!809200) b!1218408))

(assert (= (and b!1218408 (not res!809193)) b!1218397))

(assert (= (and b!1218404 condMapEmpty!48316) mapIsEmpty!48316))

(assert (= (and b!1218404 (not condMapEmpty!48316)) mapNonEmpty!48316))

(get-info :version)

(assert (= (and mapNonEmpty!48316 ((_ is ValueCellFull!14769) mapValue!48316)) b!1218396))

(assert (= (and b!1218404 ((_ is ValueCellFull!14769) mapDefault!48316)) b!1218402))

(assert (= start!101382 b!1218404))

(declare-fun b_lambda!22005 () Bool)

(assert (=> (not b_lambda!22005) (not b!1218393)))

(declare-fun t!40018 () Bool)

(declare-fun tb!11053 () Bool)

(assert (=> (and start!101382 (= defaultEntry!1004 defaultEntry!1004) t!40018) tb!11053))

(declare-fun result!22707 () Bool)

(assert (=> tb!11053 (= result!22707 tp_is_empty!30957)))

(assert (=> b!1218393 t!40018))

(declare-fun b_and!43661 () Bool)

(assert (= b_and!43659 (and (=> t!40018 result!22707) b_and!43661)))

(declare-fun m!1123135 () Bool)

(assert (=> b!1218408 m!1123135))

(declare-fun m!1123137 () Bool)

(assert (=> b!1218393 m!1123137))

(declare-fun m!1123139 () Bool)

(assert (=> b!1218393 m!1123139))

(declare-fun m!1123141 () Bool)

(assert (=> b!1218393 m!1123141))

(declare-fun m!1123143 () Bool)

(assert (=> b!1218393 m!1123143))

(declare-fun m!1123145 () Bool)

(assert (=> b!1218398 m!1123145))

(declare-fun m!1123147 () Bool)

(assert (=> b!1218392 m!1123147))

(assert (=> b!1218394 m!1123135))

(declare-fun m!1123149 () Bool)

(assert (=> b!1218394 m!1123149))

(assert (=> b!1218394 m!1123149))

(declare-fun m!1123151 () Bool)

(assert (=> b!1218394 m!1123151))

(declare-fun m!1123153 () Bool)

(assert (=> b!1218394 m!1123153))

(declare-fun m!1123155 () Bool)

(assert (=> b!1218407 m!1123155))

(declare-fun m!1123157 () Bool)

(assert (=> b!1218407 m!1123157))

(declare-fun m!1123159 () Bool)

(assert (=> b!1218403 m!1123159))

(declare-fun m!1123161 () Bool)

(assert (=> b!1218403 m!1123161))

(assert (=> b!1218403 m!1123135))

(declare-fun m!1123163 () Bool)

(assert (=> b!1218403 m!1123163))

(assert (=> b!1218403 m!1123135))

(declare-fun m!1123165 () Bool)

(assert (=> b!1218403 m!1123165))

(declare-fun m!1123167 () Bool)

(assert (=> b!1218403 m!1123167))

(declare-fun m!1123169 () Bool)

(assert (=> b!1218395 m!1123169))

(declare-fun m!1123171 () Bool)

(assert (=> b!1218406 m!1123171))

(declare-fun m!1123173 () Bool)

(assert (=> b!1218406 m!1123173))

(declare-fun m!1123175 () Bool)

(assert (=> b!1218399 m!1123175))

(declare-fun m!1123177 () Bool)

(assert (=> mapNonEmpty!48316 m!1123177))

(declare-fun m!1123179 () Bool)

(assert (=> b!1218397 m!1123179))

(declare-fun m!1123181 () Bool)

(assert (=> b!1218405 m!1123181))

(declare-fun m!1123183 () Bool)

(assert (=> b!1218401 m!1123183))

(declare-fun m!1123185 () Bool)

(assert (=> start!101382 m!1123185))

(declare-fun m!1123187 () Bool)

(assert (=> start!101382 m!1123187))

(check-sat (not b!1218397) (not start!101382) tp_is_empty!30957 (not b!1218406) (not b!1218407) (not b!1218401) (not mapNonEmpty!48316) (not b!1218392) (not b_next!26253) (not b!1218395) b_and!43661 (not b!1218394) (not b_lambda!22005) (not b!1218398) (not b!1218405) (not b!1218393) (not b!1218403))
(check-sat b_and!43661 (not b_next!26253))
