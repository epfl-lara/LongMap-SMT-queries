; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100134 () Bool)

(assert start!100134)

(declare-fun b_free!25477 () Bool)

(declare-fun b_next!25477 () Bool)

(assert (=> start!100134 (= b_free!25477 (not b_next!25477))))

(declare-fun tp!89145 () Bool)

(declare-fun b_and!41823 () Bool)

(assert (=> start!100134 (= tp!89145 b_and!41823)))

(declare-fun b!1190172 () Bool)

(declare-fun e!676797 () Bool)

(declare-fun tp_is_empty!30007 () Bool)

(assert (=> b!1190172 (= e!676797 tp_is_empty!30007)))

(declare-fun mapIsEmpty!46838 () Bool)

(declare-fun mapRes!46838 () Bool)

(assert (=> mapIsEmpty!46838 mapRes!46838))

(declare-fun b!1190173 () Bool)

(declare-fun res!791034 () Bool)

(declare-fun e!676798 () Bool)

(assert (=> b!1190173 (=> (not res!791034) (not e!676798))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76853 0))(
  ( (array!76854 (arr!37070 (Array (_ BitVec 32) (_ BitVec 64))) (size!37607 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76853)

(assert (=> b!1190173 (= res!791034 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37607 _keys!1208))))))

(declare-fun b!1190174 () Bool)

(declare-fun e!676802 () Bool)

(declare-fun e!676801 () Bool)

(assert (=> b!1190174 (= e!676802 e!676801)))

(declare-fun res!791029 () Bool)

(assert (=> b!1190174 (=> res!791029 e!676801)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1190174 (= res!791029 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45137 0))(
  ( (V!45138 (val!15060 Int)) )
))
(declare-fun zeroValue!944 () V!45137)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541338 () array!76853)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19376 0))(
  ( (tuple2!19377 (_1!9699 (_ BitVec 64)) (_2!9699 V!45137)) )
))
(declare-datatypes ((List!26118 0))(
  ( (Nil!26115) (Cons!26114 (h!27332 tuple2!19376) (t!38579 List!26118)) )
))
(declare-datatypes ((ListLongMap!17353 0))(
  ( (ListLongMap!17354 (toList!8692 List!26118)) )
))
(declare-fun lt!541340 () ListLongMap!17353)

(declare-datatypes ((ValueCell!14294 0))(
  ( (ValueCellFull!14294 (v!17694 V!45137)) (EmptyCell!14294) )
))
(declare-datatypes ((array!76855 0))(
  ( (array!76856 (arr!37071 (Array (_ BitVec 32) ValueCell!14294)) (size!37608 (_ BitVec 32))) )
))
(declare-fun lt!541337 () array!76855)

(declare-fun minValue!944 () V!45137)

(declare-fun getCurrentListMapNoExtraKeys!5160 (array!76853 array!76855 (_ BitVec 32) (_ BitVec 32) V!45137 V!45137 (_ BitVec 32) Int) ListLongMap!17353)

(assert (=> b!1190174 (= lt!541340 (getCurrentListMapNoExtraKeys!5160 lt!541338 lt!541337 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!76855)

(declare-fun dynLambda!3118 (Int (_ BitVec 64)) V!45137)

(assert (=> b!1190174 (= lt!541337 (array!76856 (store (arr!37071 _values!996) i!673 (ValueCellFull!14294 (dynLambda!3118 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37608 _values!996)))))

(declare-fun lt!541342 () ListLongMap!17353)

(assert (=> b!1190174 (= lt!541342 (getCurrentListMapNoExtraKeys!5160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190175 () Bool)

(declare-fun res!791038 () Bool)

(assert (=> b!1190175 (=> (not res!791038) (not e!676798))))

(declare-datatypes ((List!26119 0))(
  ( (Nil!26116) (Cons!26115 (h!27333 (_ BitVec 64)) (t!38580 List!26119)) )
))
(declare-fun arrayNoDuplicates!0 (array!76853 (_ BitVec 32) List!26119) Bool)

(assert (=> b!1190175 (= res!791038 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26116))))

(declare-fun b!1190176 () Bool)

(declare-fun res!791030 () Bool)

(assert (=> b!1190176 (=> (not res!791030) (not e!676798))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1190176 (= res!791030 (= (select (arr!37070 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46838 () Bool)

(declare-fun tp!89144 () Bool)

(assert (=> mapNonEmpty!46838 (= mapRes!46838 (and tp!89144 e!676797))))

(declare-fun mapKey!46838 () (_ BitVec 32))

(declare-fun mapRest!46838 () (Array (_ BitVec 32) ValueCell!14294))

(declare-fun mapValue!46838 () ValueCell!14294)

(assert (=> mapNonEmpty!46838 (= (arr!37071 _values!996) (store mapRest!46838 mapKey!46838 mapValue!46838))))

(declare-fun b!1190177 () Bool)

(declare-fun e!676795 () Bool)

(assert (=> b!1190177 (= e!676798 e!676795)))

(declare-fun res!791036 () Bool)

(assert (=> b!1190177 (=> (not res!791036) (not e!676795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76853 (_ BitVec 32)) Bool)

(assert (=> b!1190177 (= res!791036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541338 mask!1564))))

(assert (=> b!1190177 (= lt!541338 (array!76854 (store (arr!37070 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37607 _keys!1208)))))

(declare-fun b!1190179 () Bool)

(assert (=> b!1190179 (= e!676795 (not e!676802))))

(declare-fun res!791037 () Bool)

(assert (=> b!1190179 (=> res!791037 e!676802)))

(assert (=> b!1190179 (= res!791037 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190179 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39423 0))(
  ( (Unit!39424) )
))
(declare-fun lt!541339 () Unit!39423)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76853 (_ BitVec 64) (_ BitVec 32)) Unit!39423)

(assert (=> b!1190179 (= lt!541339 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190180 () Bool)

(declare-fun e!676799 () Bool)

(declare-fun e!676796 () Bool)

(assert (=> b!1190180 (= e!676799 (and e!676796 mapRes!46838))))

(declare-fun condMapEmpty!46838 () Bool)

(declare-fun mapDefault!46838 () ValueCell!14294)

(assert (=> b!1190180 (= condMapEmpty!46838 (= (arr!37071 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14294)) mapDefault!46838)))))

(declare-fun b!1190181 () Bool)

(assert (=> b!1190181 (= e!676801 true)))

(declare-fun -!1708 (ListLongMap!17353 (_ BitVec 64)) ListLongMap!17353)

(assert (=> b!1190181 (= (getCurrentListMapNoExtraKeys!5160 lt!541338 lt!541337 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1708 (getCurrentListMapNoExtraKeys!5160 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541341 () Unit!39423)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!923 (array!76853 array!76855 (_ BitVec 32) (_ BitVec 32) V!45137 V!45137 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39423)

(assert (=> b!1190181 (= lt!541341 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!923 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190182 () Bool)

(assert (=> b!1190182 (= e!676796 tp_is_empty!30007)))

(declare-fun b!1190183 () Bool)

(declare-fun res!791028 () Bool)

(assert (=> b!1190183 (=> (not res!791028) (not e!676798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190183 (= res!791028 (validMask!0 mask!1564))))

(declare-fun b!1190184 () Bool)

(declare-fun res!791032 () Bool)

(assert (=> b!1190184 (=> (not res!791032) (not e!676798))))

(assert (=> b!1190184 (= res!791032 (and (= (size!37608 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37607 _keys!1208) (size!37608 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1190185 () Bool)

(declare-fun res!791031 () Bool)

(assert (=> b!1190185 (=> (not res!791031) (not e!676795))))

(assert (=> b!1190185 (= res!791031 (arrayNoDuplicates!0 lt!541338 #b00000000000000000000000000000000 Nil!26116))))

(declare-fun b!1190186 () Bool)

(declare-fun res!791035 () Bool)

(assert (=> b!1190186 (=> (not res!791035) (not e!676798))))

(assert (=> b!1190186 (= res!791035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1190178 () Bool)

(declare-fun res!791039 () Bool)

(assert (=> b!1190178 (=> (not res!791039) (not e!676798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190178 (= res!791039 (validKeyInArray!0 k0!934))))

(declare-fun res!791033 () Bool)

(assert (=> start!100134 (=> (not res!791033) (not e!676798))))

(assert (=> start!100134 (= res!791033 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37607 _keys!1208))))))

(assert (=> start!100134 e!676798))

(assert (=> start!100134 tp_is_empty!30007))

(declare-fun array_inv!28346 (array!76853) Bool)

(assert (=> start!100134 (array_inv!28346 _keys!1208)))

(assert (=> start!100134 true))

(assert (=> start!100134 tp!89145))

(declare-fun array_inv!28347 (array!76855) Bool)

(assert (=> start!100134 (and (array_inv!28347 _values!996) e!676799)))

(assert (= (and start!100134 res!791033) b!1190183))

(assert (= (and b!1190183 res!791028) b!1190184))

(assert (= (and b!1190184 res!791032) b!1190186))

(assert (= (and b!1190186 res!791035) b!1190175))

(assert (= (and b!1190175 res!791038) b!1190173))

(assert (= (and b!1190173 res!791034) b!1190178))

(assert (= (and b!1190178 res!791039) b!1190176))

(assert (= (and b!1190176 res!791030) b!1190177))

(assert (= (and b!1190177 res!791036) b!1190185))

(assert (= (and b!1190185 res!791031) b!1190179))

(assert (= (and b!1190179 (not res!791037)) b!1190174))

(assert (= (and b!1190174 (not res!791029)) b!1190181))

(assert (= (and b!1190180 condMapEmpty!46838) mapIsEmpty!46838))

(assert (= (and b!1190180 (not condMapEmpty!46838)) mapNonEmpty!46838))

(get-info :version)

(assert (= (and mapNonEmpty!46838 ((_ is ValueCellFull!14294) mapValue!46838)) b!1190172))

(assert (= (and b!1190180 ((_ is ValueCellFull!14294) mapDefault!46838)) b!1190182))

(assert (= start!100134 b!1190180))

(declare-fun b_lambda!20615 () Bool)

(assert (=> (not b_lambda!20615) (not b!1190174)))

(declare-fun t!38578 () Bool)

(declare-fun tb!10281 () Bool)

(assert (=> (and start!100134 (= defaultEntry!1004 defaultEntry!1004) t!38578) tb!10281))

(declare-fun result!21137 () Bool)

(assert (=> tb!10281 (= result!21137 tp_is_empty!30007)))

(assert (=> b!1190174 t!38578))

(declare-fun b_and!41825 () Bool)

(assert (= b_and!41823 (and (=> t!38578 result!21137) b_and!41825)))

(declare-fun m!1099191 () Bool)

(assert (=> b!1190183 m!1099191))

(declare-fun m!1099193 () Bool)

(assert (=> b!1190177 m!1099193))

(declare-fun m!1099195 () Bool)

(assert (=> b!1190177 m!1099195))

(declare-fun m!1099197 () Bool)

(assert (=> b!1190185 m!1099197))

(declare-fun m!1099199 () Bool)

(assert (=> mapNonEmpty!46838 m!1099199))

(declare-fun m!1099201 () Bool)

(assert (=> b!1190178 m!1099201))

(declare-fun m!1099203 () Bool)

(assert (=> b!1190175 m!1099203))

(declare-fun m!1099205 () Bool)

(assert (=> start!100134 m!1099205))

(declare-fun m!1099207 () Bool)

(assert (=> start!100134 m!1099207))

(declare-fun m!1099209 () Bool)

(assert (=> b!1190179 m!1099209))

(declare-fun m!1099211 () Bool)

(assert (=> b!1190179 m!1099211))

(declare-fun m!1099213 () Bool)

(assert (=> b!1190181 m!1099213))

(declare-fun m!1099215 () Bool)

(assert (=> b!1190181 m!1099215))

(assert (=> b!1190181 m!1099215))

(declare-fun m!1099217 () Bool)

(assert (=> b!1190181 m!1099217))

(declare-fun m!1099219 () Bool)

(assert (=> b!1190181 m!1099219))

(declare-fun m!1099221 () Bool)

(assert (=> b!1190176 m!1099221))

(declare-fun m!1099223 () Bool)

(assert (=> b!1190174 m!1099223))

(declare-fun m!1099225 () Bool)

(assert (=> b!1190174 m!1099225))

(declare-fun m!1099227 () Bool)

(assert (=> b!1190174 m!1099227))

(declare-fun m!1099229 () Bool)

(assert (=> b!1190174 m!1099229))

(declare-fun m!1099231 () Bool)

(assert (=> b!1190186 m!1099231))

(check-sat (not mapNonEmpty!46838) b_and!41825 (not b!1190186) (not b_lambda!20615) (not b!1190185) (not b!1190177) (not b!1190181) (not b!1190174) (not b!1190178) (not b!1190179) (not b!1190175) (not b!1190183) (not start!100134) tp_is_empty!30007 (not b_next!25477))
(check-sat b_and!41825 (not b_next!25477))
