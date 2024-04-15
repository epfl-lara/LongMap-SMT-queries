; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99760 () Bool)

(assert start!99760)

(declare-fun b_free!25345 () Bool)

(declare-fun b_next!25345 () Bool)

(assert (=> start!99760 (= b_free!25345 (not b_next!25345))))

(declare-fun tp!88749 () Bool)

(declare-fun b_and!41535 () Bool)

(assert (=> start!99760 (= tp!88749 b_and!41535)))

(declare-fun b!1184857 () Bool)

(declare-fun e!673661 () Bool)

(declare-fun e!673666 () Bool)

(assert (=> b!1184857 (= e!673661 e!673666)))

(declare-fun res!787603 () Bool)

(assert (=> b!1184857 (=> (not res!787603) (not e!673666))))

(declare-datatypes ((array!76484 0))(
  ( (array!76485 (arr!36892 (Array (_ BitVec 32) (_ BitVec 64))) (size!37430 (_ BitVec 32))) )
))
(declare-fun lt!537405 () array!76484)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76484 (_ BitVec 32)) Bool)

(assert (=> b!1184857 (= res!787603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537405 mask!1564))))

(declare-fun _keys!1208 () array!76484)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1184857 (= lt!537405 (array!76485 (store (arr!36892 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37430 _keys!1208)))))

(declare-fun b!1184858 () Bool)

(declare-fun e!673667 () Bool)

(assert (=> b!1184858 (= e!673667 true)))

(declare-datatypes ((V!44961 0))(
  ( (V!44962 (val!14994 Int)) )
))
(declare-datatypes ((tuple2!19346 0))(
  ( (tuple2!19347 (_1!9684 (_ BitVec 64)) (_2!9684 V!44961)) )
))
(declare-datatypes ((List!26056 0))(
  ( (Nil!26053) (Cons!26052 (h!27261 tuple2!19346) (t!38384 List!26056)) )
))
(declare-datatypes ((ListLongMap!17315 0))(
  ( (ListLongMap!17316 (toList!8673 List!26056)) )
))
(declare-fun lt!537401 () ListLongMap!17315)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!537395 () ListLongMap!17315)

(declare-fun -!1627 (ListLongMap!17315 (_ BitVec 64)) ListLongMap!17315)

(assert (=> b!1184858 (= (-!1627 lt!537401 k0!934) lt!537395)))

(declare-datatypes ((Unit!39117 0))(
  ( (Unit!39118) )
))
(declare-fun lt!537410 () Unit!39117)

(declare-fun lt!537399 () V!44961)

(declare-fun lt!537408 () ListLongMap!17315)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun addRemoveCommutativeForDiffKeys!170 (ListLongMap!17315 (_ BitVec 64) V!44961 (_ BitVec 64)) Unit!39117)

(assert (=> b!1184858 (= lt!537410 (addRemoveCommutativeForDiffKeys!170 lt!537408 (select (arr!36892 _keys!1208) from!1455) lt!537399 k0!934))))

(declare-fun lt!537404 () ListLongMap!17315)

(declare-fun lt!537402 () ListLongMap!17315)

(declare-fun lt!537411 () ListLongMap!17315)

(assert (=> b!1184858 (and (= lt!537411 lt!537401) (= lt!537402 lt!537404))))

(declare-fun lt!537403 () tuple2!19346)

(declare-fun +!3956 (ListLongMap!17315 tuple2!19346) ListLongMap!17315)

(assert (=> b!1184858 (= lt!537401 (+!3956 lt!537408 lt!537403))))

(assert (=> b!1184858 (not (= (select (arr!36892 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537396 () Unit!39117)

(declare-fun e!673663 () Unit!39117)

(assert (=> b!1184858 (= lt!537396 e!673663)))

(declare-fun c!117115 () Bool)

(assert (=> b!1184858 (= c!117115 (= (select (arr!36892 _keys!1208) from!1455) k0!934))))

(declare-fun e!673662 () Bool)

(assert (=> b!1184858 e!673662))

(declare-fun res!787606 () Bool)

(assert (=> b!1184858 (=> (not res!787606) (not e!673662))))

(declare-fun lt!537398 () ListLongMap!17315)

(assert (=> b!1184858 (= res!787606 (= lt!537398 lt!537395))))

(assert (=> b!1184858 (= lt!537395 (+!3956 lt!537402 lt!537403))))

(assert (=> b!1184858 (= lt!537403 (tuple2!19347 (select (arr!36892 _keys!1208) from!1455) lt!537399))))

(declare-datatypes ((ValueCell!14228 0))(
  ( (ValueCellFull!14228 (v!17631 V!44961)) (EmptyCell!14228) )
))
(declare-datatypes ((array!76486 0))(
  ( (array!76487 (arr!36893 (Array (_ BitVec 32) ValueCell!14228)) (size!37431 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76486)

(declare-fun lt!537393 () V!44961)

(declare-fun get!18893 (ValueCell!14228 V!44961) V!44961)

(assert (=> b!1184858 (= lt!537399 (get!18893 (select (arr!36893 _values!996) from!1455) lt!537393))))

(declare-fun res!787598 () Bool)

(assert (=> start!99760 (=> (not res!787598) (not e!673661))))

(assert (=> start!99760 (= res!787598 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37430 _keys!1208))))))

(assert (=> start!99760 e!673661))

(declare-fun tp_is_empty!29875 () Bool)

(assert (=> start!99760 tp_is_empty!29875))

(declare-fun array_inv!28270 (array!76484) Bool)

(assert (=> start!99760 (array_inv!28270 _keys!1208)))

(assert (=> start!99760 true))

(assert (=> start!99760 tp!88749))

(declare-fun e!673671 () Bool)

(declare-fun array_inv!28271 (array!76486) Bool)

(assert (=> start!99760 (and (array_inv!28271 _values!996) e!673671)))

(declare-fun b!1184859 () Bool)

(declare-fun res!787612 () Bool)

(assert (=> b!1184859 (=> (not res!787612) (not e!673661))))

(assert (=> b!1184859 (= res!787612 (= (select (arr!36892 _keys!1208) i!673) k0!934))))

(declare-fun b!1184860 () Bool)

(declare-fun res!787609 () Bool)

(assert (=> b!1184860 (=> (not res!787609) (not e!673661))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1184860 (= res!787609 (validKeyInArray!0 k0!934))))

(declare-fun b!1184861 () Bool)

(declare-fun res!787602 () Bool)

(assert (=> b!1184861 (=> (not res!787602) (not e!673661))))

(declare-datatypes ((List!26057 0))(
  ( (Nil!26054) (Cons!26053 (h!27262 (_ BitVec 64)) (t!38385 List!26057)) )
))
(declare-fun arrayNoDuplicates!0 (array!76484 (_ BitVec 32) List!26057) Bool)

(assert (=> b!1184861 (= res!787602 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26054))))

(declare-fun b!1184862 () Bool)

(declare-fun res!787605 () Bool)

(assert (=> b!1184862 (=> (not res!787605) (not e!673666))))

(assert (=> b!1184862 (= res!787605 (arrayNoDuplicates!0 lt!537405 #b00000000000000000000000000000000 Nil!26054))))

(declare-fun b!1184863 () Bool)

(declare-fun Unit!39119 () Unit!39117)

(assert (=> b!1184863 (= e!673663 Unit!39119)))

(declare-fun b!1184864 () Bool)

(declare-fun Unit!39120 () Unit!39117)

(assert (=> b!1184864 (= e!673663 Unit!39120)))

(declare-fun lt!537406 () Unit!39117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39117)

(assert (=> b!1184864 (= lt!537406 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1184864 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537394 () Unit!39117)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76484 (_ BitVec 32) (_ BitVec 32)) Unit!39117)

(assert (=> b!1184864 (= lt!537394 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1184864 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26054)))

(declare-fun lt!537409 () Unit!39117)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76484 (_ BitVec 64) (_ BitVec 32) List!26057) Unit!39117)

(assert (=> b!1184864 (= lt!537409 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26054))))

(assert (=> b!1184864 false))

(declare-fun b!1184865 () Bool)

(declare-fun res!787611 () Bool)

(assert (=> b!1184865 (=> (not res!787611) (not e!673661))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1184865 (= res!787611 (validMask!0 mask!1564))))

(declare-fun b!1184866 () Bool)

(declare-fun res!787607 () Bool)

(assert (=> b!1184866 (=> (not res!787607) (not e!673661))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1184866 (= res!787607 (and (= (size!37431 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37430 _keys!1208) (size!37431 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1184867 () Bool)

(declare-fun res!787601 () Bool)

(assert (=> b!1184867 (=> (not res!787601) (not e!673661))))

(assert (=> b!1184867 (= res!787601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1184868 () Bool)

(declare-fun e!673670 () Bool)

(assert (=> b!1184868 (= e!673670 tp_is_empty!29875)))

(declare-fun b!1184869 () Bool)

(declare-fun mapRes!46640 () Bool)

(assert (=> b!1184869 (= e!673671 (and e!673670 mapRes!46640))))

(declare-fun condMapEmpty!46640 () Bool)

(declare-fun mapDefault!46640 () ValueCell!14228)

(assert (=> b!1184869 (= condMapEmpty!46640 (= (arr!36893 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14228)) mapDefault!46640)))))

(declare-fun b!1184870 () Bool)

(declare-fun res!787599 () Bool)

(assert (=> b!1184870 (=> (not res!787599) (not e!673661))))

(assert (=> b!1184870 (= res!787599 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37430 _keys!1208))))))

(declare-fun mapIsEmpty!46640 () Bool)

(assert (=> mapIsEmpty!46640 mapRes!46640))

(declare-fun b!1184871 () Bool)

(declare-fun e!673669 () Bool)

(assert (=> b!1184871 (= e!673666 (not e!673669))))

(declare-fun res!787608 () Bool)

(assert (=> b!1184871 (=> res!787608 e!673669)))

(assert (=> b!1184871 (= res!787608 (bvsgt from!1455 i!673))))

(assert (=> b!1184871 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537397 () Unit!39117)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76484 (_ BitVec 64) (_ BitVec 32)) Unit!39117)

(assert (=> b!1184871 (= lt!537397 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46640 () Bool)

(declare-fun tp!88748 () Bool)

(declare-fun e!673664 () Bool)

(assert (=> mapNonEmpty!46640 (= mapRes!46640 (and tp!88748 e!673664))))

(declare-fun mapKey!46640 () (_ BitVec 32))

(declare-fun mapValue!46640 () ValueCell!14228)

(declare-fun mapRest!46640 () (Array (_ BitVec 32) ValueCell!14228))

(assert (=> mapNonEmpty!46640 (= (arr!36893 _values!996) (store mapRest!46640 mapKey!46640 mapValue!46640))))

(declare-fun b!1184872 () Bool)

(declare-fun e!673668 () Bool)

(assert (=> b!1184872 (= e!673662 e!673668)))

(declare-fun res!787610 () Bool)

(assert (=> b!1184872 (=> res!787610 e!673668)))

(assert (=> b!1184872 (= res!787610 (not (= (select (arr!36892 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1184873 () Bool)

(declare-fun e!673665 () Bool)

(assert (=> b!1184873 (= e!673665 e!673667)))

(declare-fun res!787604 () Bool)

(assert (=> b!1184873 (=> res!787604 e!673667)))

(assert (=> b!1184873 (= res!787604 (not (validKeyInArray!0 (select (arr!36892 _keys!1208) from!1455))))))

(assert (=> b!1184873 (= lt!537404 lt!537402)))

(assert (=> b!1184873 (= lt!537402 (-!1627 lt!537408 k0!934))))

(declare-fun zeroValue!944 () V!44961)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!537407 () array!76486)

(declare-fun minValue!944 () V!44961)

(declare-fun getCurrentListMapNoExtraKeys!5126 (array!76484 array!76486 (_ BitVec 32) (_ BitVec 32) V!44961 V!44961 (_ BitVec 32) Int) ListLongMap!17315)

(assert (=> b!1184873 (= lt!537404 (getCurrentListMapNoExtraKeys!5126 lt!537405 lt!537407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1184873 (= lt!537408 (getCurrentListMapNoExtraKeys!5126 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!537400 () Unit!39117)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!885 (array!76484 array!76486 (_ BitVec 32) (_ BitVec 32) V!44961 V!44961 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39117)

(assert (=> b!1184873 (= lt!537400 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!885 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1184874 () Bool)

(assert (=> b!1184874 (= e!673664 tp_is_empty!29875)))

(declare-fun b!1184875 () Bool)

(assert (=> b!1184875 (= e!673668 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1184876 () Bool)

(assert (=> b!1184876 (= e!673669 e!673665)))

(declare-fun res!787600 () Bool)

(assert (=> b!1184876 (=> res!787600 e!673665)))

(assert (=> b!1184876 (= res!787600 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1184876 (= lt!537398 (getCurrentListMapNoExtraKeys!5126 lt!537405 lt!537407 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1184876 (= lt!537407 (array!76487 (store (arr!36893 _values!996) i!673 (ValueCellFull!14228 lt!537393)) (size!37431 _values!996)))))

(declare-fun dynLambda!3027 (Int (_ BitVec 64)) V!44961)

(assert (=> b!1184876 (= lt!537393 (dynLambda!3027 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1184876 (= lt!537411 (getCurrentListMapNoExtraKeys!5126 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!99760 res!787598) b!1184865))

(assert (= (and b!1184865 res!787611) b!1184866))

(assert (= (and b!1184866 res!787607) b!1184867))

(assert (= (and b!1184867 res!787601) b!1184861))

(assert (= (and b!1184861 res!787602) b!1184870))

(assert (= (and b!1184870 res!787599) b!1184860))

(assert (= (and b!1184860 res!787609) b!1184859))

(assert (= (and b!1184859 res!787612) b!1184857))

(assert (= (and b!1184857 res!787603) b!1184862))

(assert (= (and b!1184862 res!787605) b!1184871))

(assert (= (and b!1184871 (not res!787608)) b!1184876))

(assert (= (and b!1184876 (not res!787600)) b!1184873))

(assert (= (and b!1184873 (not res!787604)) b!1184858))

(assert (= (and b!1184858 res!787606) b!1184872))

(assert (= (and b!1184872 (not res!787610)) b!1184875))

(assert (= (and b!1184858 c!117115) b!1184864))

(assert (= (and b!1184858 (not c!117115)) b!1184863))

(assert (= (and b!1184869 condMapEmpty!46640) mapIsEmpty!46640))

(assert (= (and b!1184869 (not condMapEmpty!46640)) mapNonEmpty!46640))

(get-info :version)

(assert (= (and mapNonEmpty!46640 ((_ is ValueCellFull!14228) mapValue!46640)) b!1184874))

(assert (= (and b!1184869 ((_ is ValueCellFull!14228) mapDefault!46640)) b!1184868))

(assert (= start!99760 b!1184869))

(declare-fun b_lambda!20471 () Bool)

(assert (=> (not b_lambda!20471) (not b!1184876)))

(declare-fun t!38383 () Bool)

(declare-fun tb!10149 () Bool)

(assert (=> (and start!99760 (= defaultEntry!1004 defaultEntry!1004) t!38383) tb!10149))

(declare-fun result!20873 () Bool)

(assert (=> tb!10149 (= result!20873 tp_is_empty!29875)))

(assert (=> b!1184876 t!38383))

(declare-fun b_and!41537 () Bool)

(assert (= b_and!41535 (and (=> t!38383 result!20873) b_and!41537)))

(declare-fun m!1092725 () Bool)

(assert (=> b!1184860 m!1092725))

(declare-fun m!1092727 () Bool)

(assert (=> b!1184867 m!1092727))

(declare-fun m!1092729 () Bool)

(assert (=> b!1184859 m!1092729))

(declare-fun m!1092731 () Bool)

(assert (=> b!1184871 m!1092731))

(declare-fun m!1092733 () Bool)

(assert (=> b!1184871 m!1092733))

(declare-fun m!1092735 () Bool)

(assert (=> b!1184873 m!1092735))

(declare-fun m!1092737 () Bool)

(assert (=> b!1184873 m!1092737))

(declare-fun m!1092739 () Bool)

(assert (=> b!1184873 m!1092739))

(declare-fun m!1092741 () Bool)

(assert (=> b!1184873 m!1092741))

(declare-fun m!1092743 () Bool)

(assert (=> b!1184873 m!1092743))

(declare-fun m!1092745 () Bool)

(assert (=> b!1184873 m!1092745))

(assert (=> b!1184873 m!1092743))

(declare-fun m!1092747 () Bool)

(assert (=> mapNonEmpty!46640 m!1092747))

(declare-fun m!1092749 () Bool)

(assert (=> b!1184858 m!1092749))

(assert (=> b!1184858 m!1092743))

(declare-fun m!1092751 () Bool)

(assert (=> b!1184858 m!1092751))

(declare-fun m!1092753 () Bool)

(assert (=> b!1184858 m!1092753))

(declare-fun m!1092755 () Bool)

(assert (=> b!1184858 m!1092755))

(assert (=> b!1184858 m!1092743))

(declare-fun m!1092757 () Bool)

(assert (=> b!1184858 m!1092757))

(assert (=> b!1184858 m!1092757))

(declare-fun m!1092759 () Bool)

(assert (=> b!1184858 m!1092759))

(assert (=> b!1184872 m!1092743))

(declare-fun m!1092761 () Bool)

(assert (=> b!1184876 m!1092761))

(declare-fun m!1092763 () Bool)

(assert (=> b!1184876 m!1092763))

(declare-fun m!1092765 () Bool)

(assert (=> b!1184876 m!1092765))

(declare-fun m!1092767 () Bool)

(assert (=> b!1184876 m!1092767))

(declare-fun m!1092769 () Bool)

(assert (=> b!1184865 m!1092769))

(declare-fun m!1092771 () Bool)

(assert (=> start!99760 m!1092771))

(declare-fun m!1092773 () Bool)

(assert (=> start!99760 m!1092773))

(declare-fun m!1092775 () Bool)

(assert (=> b!1184861 m!1092775))

(declare-fun m!1092777 () Bool)

(assert (=> b!1184857 m!1092777))

(declare-fun m!1092779 () Bool)

(assert (=> b!1184857 m!1092779))

(declare-fun m!1092781 () Bool)

(assert (=> b!1184875 m!1092781))

(declare-fun m!1092783 () Bool)

(assert (=> b!1184864 m!1092783))

(declare-fun m!1092785 () Bool)

(assert (=> b!1184864 m!1092785))

(declare-fun m!1092787 () Bool)

(assert (=> b!1184864 m!1092787))

(declare-fun m!1092789 () Bool)

(assert (=> b!1184864 m!1092789))

(declare-fun m!1092791 () Bool)

(assert (=> b!1184864 m!1092791))

(declare-fun m!1092793 () Bool)

(assert (=> b!1184862 m!1092793))

(check-sat (not b_next!25345) b_and!41537 (not b!1184876) (not b_lambda!20471) (not b!1184873) (not b!1184871) tp_is_empty!29875 (not b!1184862) (not b!1184861) (not b!1184867) (not b!1184875) (not mapNonEmpty!46640) (not b!1184858) (not b!1184865) (not start!99760) (not b!1184864) (not b!1184860) (not b!1184857))
(check-sat b_and!41537 (not b_next!25345))
