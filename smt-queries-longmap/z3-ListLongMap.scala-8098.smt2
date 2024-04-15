; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99448 () Bool)

(assert start!99448)

(declare-fun b_free!25033 () Bool)

(declare-fun b_next!25033 () Bool)

(assert (=> start!99448 (= b_free!25033 (not b_next!25033))))

(declare-fun tp!87813 () Bool)

(declare-fun b_and!40911 () Bool)

(assert (=> start!99448 (= tp!87813 b_and!40911)))

(declare-fun mapNonEmpty!46172 () Bool)

(declare-fun mapRes!46172 () Bool)

(declare-fun tp!87812 () Bool)

(declare-fun e!667797 () Bool)

(assert (=> mapNonEmpty!46172 (= mapRes!46172 (and tp!87812 e!667797))))

(declare-datatypes ((V!44545 0))(
  ( (V!44546 (val!14838 Int)) )
))
(declare-datatypes ((ValueCell!14072 0))(
  ( (ValueCellFull!14072 (v!17475 V!44545)) (EmptyCell!14072) )
))
(declare-fun mapValue!46172 () ValueCell!14072)

(declare-fun mapKey!46172 () (_ BitVec 32))

(declare-fun mapRest!46172 () (Array (_ BitVec 32) ValueCell!14072))

(declare-datatypes ((array!75866 0))(
  ( (array!75867 (arr!36583 (Array (_ BitVec 32) ValueCell!14072)) (size!37121 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75866)

(assert (=> mapNonEmpty!46172 (= (arr!36583 _values!996) (store mapRest!46172 mapKey!46172 mapValue!46172))))

(declare-fun b!1174843 () Bool)

(declare-datatypes ((Unit!38596 0))(
  ( (Unit!38597) )
))
(declare-fun e!667799 () Unit!38596)

(declare-fun Unit!38598 () Unit!38596)

(assert (=> b!1174843 (= e!667799 Unit!38598)))

(declare-fun b!1174844 () Bool)

(declare-fun res!780241 () Bool)

(declare-fun e!667802 () Bool)

(assert (=> b!1174844 (=> (not res!780241) (not e!667802))))

(declare-datatypes ((array!75868 0))(
  ( (array!75869 (arr!36584 (Array (_ BitVec 32) (_ BitVec 64))) (size!37122 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75868)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1174844 (= res!780241 (and (= (size!37121 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37122 _keys!1208) (size!37121 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174845 () Bool)

(declare-fun e!667804 () Bool)

(assert (=> b!1174845 (= e!667802 e!667804)))

(declare-fun res!780248 () Bool)

(assert (=> b!1174845 (=> (not res!780248) (not e!667804))))

(declare-fun lt!529775 () array!75868)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75868 (_ BitVec 32)) Bool)

(assert (=> b!1174845 (= res!780248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529775 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174845 (= lt!529775 (array!75869 (store (arr!36584 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37122 _keys!1208)))))

(declare-fun res!780238 () Bool)

(assert (=> start!99448 (=> (not res!780238) (not e!667802))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99448 (= res!780238 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37122 _keys!1208))))))

(assert (=> start!99448 e!667802))

(declare-fun tp_is_empty!29563 () Bool)

(assert (=> start!99448 tp_is_empty!29563))

(declare-fun array_inv!28056 (array!75868) Bool)

(assert (=> start!99448 (array_inv!28056 _keys!1208)))

(assert (=> start!99448 true))

(assert (=> start!99448 tp!87813))

(declare-fun e!667793 () Bool)

(declare-fun array_inv!28057 (array!75866) Bool)

(assert (=> start!99448 (and (array_inv!28057 _values!996) e!667793)))

(declare-fun b!1174846 () Bool)

(declare-fun e!667795 () Bool)

(declare-fun e!667803 () Bool)

(assert (=> b!1174846 (= e!667795 e!667803)))

(declare-fun res!780246 () Bool)

(assert (=> b!1174846 (=> res!780246 e!667803)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174846 (= res!780246 (not (validKeyInArray!0 (select (arr!36584 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19070 0))(
  ( (tuple2!19071 (_1!9546 (_ BitVec 64)) (_2!9546 V!44545)) )
))
(declare-datatypes ((List!25782 0))(
  ( (Nil!25779) (Cons!25778 (h!26987 tuple2!19070) (t!37798 List!25782)) )
))
(declare-datatypes ((ListLongMap!17039 0))(
  ( (ListLongMap!17040 (toList!8535 List!25782)) )
))
(declare-fun lt!529772 () ListLongMap!17039)

(declare-fun lt!529777 () ListLongMap!17039)

(assert (=> b!1174846 (= lt!529772 lt!529777)))

(declare-fun lt!529781 () ListLongMap!17039)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1519 (ListLongMap!17039 (_ BitVec 64)) ListLongMap!17039)

(assert (=> b!1174846 (= lt!529777 (-!1519 lt!529781 k0!934))))

(declare-fun zeroValue!944 () V!44545)

(declare-fun lt!529779 () array!75866)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44545)

(declare-fun getCurrentListMapNoExtraKeys!5005 (array!75868 array!75866 (_ BitVec 32) (_ BitVec 32) V!44545 V!44545 (_ BitVec 32) Int) ListLongMap!17039)

(assert (=> b!1174846 (= lt!529772 (getCurrentListMapNoExtraKeys!5005 lt!529775 lt!529779 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174846 (= lt!529781 (getCurrentListMapNoExtraKeys!5005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529782 () Unit!38596)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!783 (array!75868 array!75866 (_ BitVec 32) (_ BitVec 32) V!44545 V!44545 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38596)

(assert (=> b!1174846 (= lt!529782 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174847 () Bool)

(declare-fun Unit!38599 () Unit!38596)

(assert (=> b!1174847 (= e!667799 Unit!38599)))

(declare-fun lt!529774 () Unit!38596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75868 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38596)

(assert (=> b!1174847 (= lt!529774 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75868 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174847 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529778 () Unit!38596)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75868 (_ BitVec 32) (_ BitVec 32)) Unit!38596)

(assert (=> b!1174847 (= lt!529778 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25783 0))(
  ( (Nil!25780) (Cons!25779 (h!26988 (_ BitVec 64)) (t!37799 List!25783)) )
))
(declare-fun arrayNoDuplicates!0 (array!75868 (_ BitVec 32) List!25783) Bool)

(assert (=> b!1174847 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25780)))

(declare-fun lt!529773 () Unit!38596)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75868 (_ BitVec 64) (_ BitVec 32) List!25783) Unit!38596)

(assert (=> b!1174847 (= lt!529773 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25780))))

(assert (=> b!1174847 false))

(declare-fun b!1174848 () Bool)

(declare-fun res!780243 () Bool)

(assert (=> b!1174848 (=> (not res!780243) (not e!667804))))

(assert (=> b!1174848 (= res!780243 (arrayNoDuplicates!0 lt!529775 #b00000000000000000000000000000000 Nil!25780))))

(declare-fun b!1174849 () Bool)

(declare-fun e!667801 () Bool)

(assert (=> b!1174849 (= e!667801 e!667795)))

(declare-fun res!780237 () Bool)

(assert (=> b!1174849 (=> res!780237 e!667795)))

(assert (=> b!1174849 (= res!780237 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529769 () ListLongMap!17039)

(assert (=> b!1174849 (= lt!529769 (getCurrentListMapNoExtraKeys!5005 lt!529775 lt!529779 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529771 () V!44545)

(assert (=> b!1174849 (= lt!529779 (array!75867 (store (arr!36583 _values!996) i!673 (ValueCellFull!14072 lt!529771)) (size!37121 _values!996)))))

(declare-fun dynLambda!2922 (Int (_ BitVec 64)) V!44545)

(assert (=> b!1174849 (= lt!529771 (dynLambda!2922 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529776 () ListLongMap!17039)

(assert (=> b!1174849 (= lt!529776 (getCurrentListMapNoExtraKeys!5005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46172 () Bool)

(assert (=> mapIsEmpty!46172 mapRes!46172))

(declare-fun b!1174850 () Bool)

(declare-fun e!667798 () Bool)

(assert (=> b!1174850 (= e!667798 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174851 () Bool)

(declare-fun res!780240 () Bool)

(assert (=> b!1174851 (=> (not res!780240) (not e!667802))))

(assert (=> b!1174851 (= res!780240 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37122 _keys!1208))))))

(declare-fun b!1174852 () Bool)

(declare-fun res!780250 () Bool)

(assert (=> b!1174852 (=> (not res!780250) (not e!667802))))

(assert (=> b!1174852 (= res!780250 (validKeyInArray!0 k0!934))))

(declare-fun b!1174853 () Bool)

(declare-fun res!780244 () Bool)

(assert (=> b!1174853 (=> (not res!780244) (not e!667802))))

(assert (=> b!1174853 (= res!780244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174854 () Bool)

(declare-fun res!780239 () Bool)

(assert (=> b!1174854 (=> (not res!780239) (not e!667802))))

(assert (=> b!1174854 (= res!780239 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25780))))

(declare-fun b!1174855 () Bool)

(declare-fun res!780242 () Bool)

(assert (=> b!1174855 (=> (not res!780242) (not e!667802))))

(assert (=> b!1174855 (= res!780242 (= (select (arr!36584 _keys!1208) i!673) k0!934))))

(declare-fun b!1174856 () Bool)

(declare-fun e!667800 () Bool)

(assert (=> b!1174856 (= e!667800 tp_is_empty!29563)))

(declare-fun b!1174857 () Bool)

(assert (=> b!1174857 (= e!667804 (not e!667801))))

(declare-fun res!780247 () Bool)

(assert (=> b!1174857 (=> res!780247 e!667801)))

(assert (=> b!1174857 (= res!780247 (bvsgt from!1455 i!673))))

(assert (=> b!1174857 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529770 () Unit!38596)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75868 (_ BitVec 64) (_ BitVec 32)) Unit!38596)

(assert (=> b!1174857 (= lt!529770 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174858 () Bool)

(assert (=> b!1174858 (= e!667793 (and e!667800 mapRes!46172))))

(declare-fun condMapEmpty!46172 () Bool)

(declare-fun mapDefault!46172 () ValueCell!14072)

(assert (=> b!1174858 (= condMapEmpty!46172 (= (arr!36583 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14072)) mapDefault!46172)))))

(declare-fun b!1174859 () Bool)

(declare-fun e!667796 () Bool)

(assert (=> b!1174859 (= e!667796 e!667798)))

(declare-fun res!780245 () Bool)

(assert (=> b!1174859 (=> res!780245 e!667798)))

(assert (=> b!1174859 (= res!780245 (not (= (select (arr!36584 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174860 () Bool)

(assert (=> b!1174860 (= e!667797 tp_is_empty!29563)))

(declare-fun b!1174861 () Bool)

(assert (=> b!1174861 (= e!667803 true)))

(assert (=> b!1174861 (not (= (select (arr!36584 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529780 () Unit!38596)

(assert (=> b!1174861 (= lt!529780 e!667799)))

(declare-fun c!116647 () Bool)

(assert (=> b!1174861 (= c!116647 (= (select (arr!36584 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174861 e!667796))

(declare-fun res!780249 () Bool)

(assert (=> b!1174861 (=> (not res!780249) (not e!667796))))

(declare-fun +!3842 (ListLongMap!17039 tuple2!19070) ListLongMap!17039)

(declare-fun get!18686 (ValueCell!14072 V!44545) V!44545)

(assert (=> b!1174861 (= res!780249 (= lt!529769 (+!3842 lt!529777 (tuple2!19071 (select (arr!36584 _keys!1208) from!1455) (get!18686 (select (arr!36583 _values!996) from!1455) lt!529771)))))))

(declare-fun b!1174862 () Bool)

(declare-fun res!780236 () Bool)

(assert (=> b!1174862 (=> (not res!780236) (not e!667802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174862 (= res!780236 (validMask!0 mask!1564))))

(assert (= (and start!99448 res!780238) b!1174862))

(assert (= (and b!1174862 res!780236) b!1174844))

(assert (= (and b!1174844 res!780241) b!1174853))

(assert (= (and b!1174853 res!780244) b!1174854))

(assert (= (and b!1174854 res!780239) b!1174851))

(assert (= (and b!1174851 res!780240) b!1174852))

(assert (= (and b!1174852 res!780250) b!1174855))

(assert (= (and b!1174855 res!780242) b!1174845))

(assert (= (and b!1174845 res!780248) b!1174848))

(assert (= (and b!1174848 res!780243) b!1174857))

(assert (= (and b!1174857 (not res!780247)) b!1174849))

(assert (= (and b!1174849 (not res!780237)) b!1174846))

(assert (= (and b!1174846 (not res!780246)) b!1174861))

(assert (= (and b!1174861 res!780249) b!1174859))

(assert (= (and b!1174859 (not res!780245)) b!1174850))

(assert (= (and b!1174861 c!116647) b!1174847))

(assert (= (and b!1174861 (not c!116647)) b!1174843))

(assert (= (and b!1174858 condMapEmpty!46172) mapIsEmpty!46172))

(assert (= (and b!1174858 (not condMapEmpty!46172)) mapNonEmpty!46172))

(get-info :version)

(assert (= (and mapNonEmpty!46172 ((_ is ValueCellFull!14072) mapValue!46172)) b!1174860))

(assert (= (and b!1174858 ((_ is ValueCellFull!14072) mapDefault!46172)) b!1174856))

(assert (= start!99448 b!1174858))

(declare-fun b_lambda!20159 () Bool)

(assert (=> (not b_lambda!20159) (not b!1174849)))

(declare-fun t!37797 () Bool)

(declare-fun tb!9837 () Bool)

(assert (=> (and start!99448 (= defaultEntry!1004 defaultEntry!1004) t!37797) tb!9837))

(declare-fun result!20249 () Bool)

(assert (=> tb!9837 (= result!20249 tp_is_empty!29563)))

(assert (=> b!1174849 t!37797))

(declare-fun b_and!40913 () Bool)

(assert (= b_and!40911 (and (=> t!37797 result!20249) b_and!40913)))

(declare-fun m!1082249 () Bool)

(assert (=> b!1174853 m!1082249))

(declare-fun m!1082251 () Bool)

(assert (=> start!99448 m!1082251))

(declare-fun m!1082253 () Bool)

(assert (=> start!99448 m!1082253))

(declare-fun m!1082255 () Bool)

(assert (=> b!1174859 m!1082255))

(declare-fun m!1082257 () Bool)

(assert (=> b!1174855 m!1082257))

(declare-fun m!1082259 () Bool)

(assert (=> b!1174852 m!1082259))

(declare-fun m!1082261 () Bool)

(assert (=> mapNonEmpty!46172 m!1082261))

(declare-fun m!1082263 () Bool)

(assert (=> b!1174849 m!1082263))

(declare-fun m!1082265 () Bool)

(assert (=> b!1174849 m!1082265))

(declare-fun m!1082267 () Bool)

(assert (=> b!1174849 m!1082267))

(declare-fun m!1082269 () Bool)

(assert (=> b!1174849 m!1082269))

(declare-fun m!1082271 () Bool)

(assert (=> b!1174845 m!1082271))

(declare-fun m!1082273 () Bool)

(assert (=> b!1174845 m!1082273))

(declare-fun m!1082275 () Bool)

(assert (=> b!1174862 m!1082275))

(assert (=> b!1174861 m!1082255))

(declare-fun m!1082277 () Bool)

(assert (=> b!1174861 m!1082277))

(assert (=> b!1174861 m!1082277))

(declare-fun m!1082279 () Bool)

(assert (=> b!1174861 m!1082279))

(declare-fun m!1082281 () Bool)

(assert (=> b!1174861 m!1082281))

(declare-fun m!1082283 () Bool)

(assert (=> b!1174857 m!1082283))

(declare-fun m!1082285 () Bool)

(assert (=> b!1174857 m!1082285))

(declare-fun m!1082287 () Bool)

(assert (=> b!1174846 m!1082287))

(declare-fun m!1082289 () Bool)

(assert (=> b!1174846 m!1082289))

(declare-fun m!1082291 () Bool)

(assert (=> b!1174846 m!1082291))

(declare-fun m!1082293 () Bool)

(assert (=> b!1174846 m!1082293))

(assert (=> b!1174846 m!1082255))

(declare-fun m!1082295 () Bool)

(assert (=> b!1174846 m!1082295))

(assert (=> b!1174846 m!1082255))

(declare-fun m!1082297 () Bool)

(assert (=> b!1174850 m!1082297))

(declare-fun m!1082299 () Bool)

(assert (=> b!1174848 m!1082299))

(declare-fun m!1082301 () Bool)

(assert (=> b!1174847 m!1082301))

(declare-fun m!1082303 () Bool)

(assert (=> b!1174847 m!1082303))

(declare-fun m!1082305 () Bool)

(assert (=> b!1174847 m!1082305))

(declare-fun m!1082307 () Bool)

(assert (=> b!1174847 m!1082307))

(declare-fun m!1082309 () Bool)

(assert (=> b!1174847 m!1082309))

(declare-fun m!1082311 () Bool)

(assert (=> b!1174854 m!1082311))

(check-sat (not b!1174848) (not start!99448) (not b!1174862) (not b!1174854) (not b!1174861) tp_is_empty!29563 (not b!1174845) (not b!1174857) b_and!40913 (not b_lambda!20159) (not b!1174849) (not b!1174852) (not b_next!25033) (not b!1174850) (not b!1174853) (not mapNonEmpty!46172) (not b!1174847) (not b!1174846))
(check-sat b_and!40913 (not b_next!25033))
