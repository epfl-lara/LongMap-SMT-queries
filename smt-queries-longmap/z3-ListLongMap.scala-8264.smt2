; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100768 () Bool)

(assert start!100768)

(declare-fun b_free!25855 () Bool)

(declare-fun b_next!25855 () Bool)

(assert (=> start!100768 (= b_free!25855 (not b_next!25855))))

(declare-fun tp!90554 () Bool)

(declare-fun b_and!42599 () Bool)

(assert (=> start!100768 (= tp!90554 b_and!42599)))

(declare-datatypes ((V!45873 0))(
  ( (V!45874 (val!15336 Int)) )
))
(declare-fun zeroValue!944 () V!45873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!57522 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77929 0))(
  ( (array!77930 (arr!37603 (Array (_ BitVec 32) (_ BitVec 64))) (size!38140 (_ BitVec 32))) )
))
(declare-fun lt!544983 () array!77929)

(declare-datatypes ((tuple2!19660 0))(
  ( (tuple2!19661 (_1!9841 (_ BitVec 64)) (_2!9841 V!45873)) )
))
(declare-datatypes ((List!26475 0))(
  ( (Nil!26472) (Cons!26471 (h!27689 tuple2!19660) (t!39302 List!26475)) )
))
(declare-datatypes ((ListLongMap!17637 0))(
  ( (ListLongMap!17638 (toList!8834 List!26475)) )
))
(declare-fun call!57529 () ListLongMap!17637)

(declare-fun minValue!944 () V!45873)

(declare-datatypes ((ValueCell!14570 0))(
  ( (ValueCellFull!14570 (v!17970 V!45873)) (EmptyCell!14570) )
))
(declare-datatypes ((array!77931 0))(
  ( (array!77932 (arr!37604 (Array (_ BitVec 32) ValueCell!14570)) (size!38141 (_ BitVec 32))) )
))
(declare-fun lt!544984 () array!77931)

(declare-fun getCurrentListMapNoExtraKeys!5301 (array!77929 array!77931 (_ BitVec 32) (_ BitVec 32) V!45873 V!45873 (_ BitVec 32) Int) ListLongMap!17637)

(assert (=> bm!57522 (= call!57529 (getCurrentListMapNoExtraKeys!5301 lt!544983 lt!544984 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202811 () Bool)

(declare-fun e!683142 () Bool)

(declare-fun e!683144 () Bool)

(assert (=> b!1202811 (= e!683142 e!683144)))

(declare-fun res!800325 () Bool)

(assert (=> b!1202811 (=> (not res!800325) (not e!683144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77929 (_ BitVec 32)) Bool)

(assert (=> b!1202811 (= res!800325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544983 mask!1564))))

(declare-fun _keys!1208 () array!77929)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1202811 (= lt!544983 (array!77930 (store (arr!37603 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38140 _keys!1208)))))

(declare-fun b!1202812 () Bool)

(declare-fun e!683141 () Bool)

(declare-fun e!683138 () Bool)

(assert (=> b!1202812 (= e!683141 e!683138)))

(declare-fun res!800333 () Bool)

(assert (=> b!1202812 (=> res!800333 e!683138)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1202812 (= res!800333 (not (= (select (arr!37603 _keys!1208) from!1455) k0!934)))))

(declare-fun e!683134 () Bool)

(assert (=> b!1202812 e!683134))

(declare-fun c!117925 () Bool)

(assert (=> b!1202812 (= c!117925 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39795 0))(
  ( (Unit!39796) )
))
(declare-fun lt!544987 () Unit!39795)

(declare-fun _values!996 () array!77931)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1010 (array!77929 array!77931 (_ BitVec 32) (_ BitVec 32) V!45873 V!45873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39795)

(assert (=> b!1202812 (= lt!544987 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1010 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!57523 () Bool)

(declare-fun call!57531 () ListLongMap!17637)

(assert (=> bm!57523 (= call!57531 (getCurrentListMapNoExtraKeys!5301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202813 () Bool)

(declare-fun res!800336 () Bool)

(assert (=> b!1202813 (=> (not res!800336) (not e!683142))))

(assert (=> b!1202813 (= res!800336 (= (select (arr!37603 _keys!1208) i!673) k0!934))))

(declare-fun b!1202814 () Bool)

(declare-fun e!683136 () Bool)

(declare-fun tp_is_empty!30559 () Bool)

(assert (=> b!1202814 (= e!683136 tp_is_empty!30559)))

(declare-fun bm!57524 () Bool)

(declare-fun call!57526 () ListLongMap!17637)

(declare-fun call!57525 () ListLongMap!17637)

(assert (=> bm!57524 (= call!57526 call!57525)))

(declare-fun c!117927 () Bool)

(declare-fun call!57530 () Unit!39795)

(declare-fun c!117926 () Bool)

(declare-fun bm!57525 () Bool)

(declare-fun lt!544991 () ListLongMap!17637)

(declare-fun addStillContains!991 (ListLongMap!17637 (_ BitVec 64) V!45873 (_ BitVec 64)) Unit!39795)

(assert (=> bm!57525 (= call!57530 (addStillContains!991 lt!544991 (ite (or c!117927 c!117926) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!117927 c!117926) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1202815 () Bool)

(declare-fun e!683145 () Bool)

(assert (=> b!1202815 (= e!683144 (not e!683145))))

(declare-fun res!800326 () Bool)

(assert (=> b!1202815 (=> res!800326 e!683145)))

(assert (=> b!1202815 (= res!800326 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1202815 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544981 () Unit!39795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77929 (_ BitVec 64) (_ BitVec 32)) Unit!39795)

(assert (=> b!1202815 (= lt!544981 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1202816 () Bool)

(declare-fun e!683146 () Unit!39795)

(declare-fun e!683139 () Unit!39795)

(assert (=> b!1202816 (= e!683146 e!683139)))

(declare-fun lt!544988 () Bool)

(assert (=> b!1202816 (= c!117926 (and (not lt!544988) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1202817 () Bool)

(declare-fun res!800331 () Bool)

(assert (=> b!1202817 (=> (not res!800331) (not e!683142))))

(assert (=> b!1202817 (= res!800331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1202818 () Bool)

(declare-fun e!683135 () Bool)

(assert (=> b!1202818 (= e!683138 e!683135)))

(declare-fun res!800329 () Bool)

(assert (=> b!1202818 (=> res!800329 e!683135)))

(declare-fun contains!6913 (ListLongMap!17637 (_ BitVec 64)) Bool)

(assert (=> b!1202818 (= res!800329 (not (contains!6913 lt!544991 k0!934)))))

(assert (=> b!1202818 (= lt!544991 (getCurrentListMapNoExtraKeys!5301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1202819 () Bool)

(declare-fun call!57532 () Bool)

(assert (=> b!1202819 call!57532))

(declare-fun lt!544993 () Unit!39795)

(declare-fun call!57527 () Unit!39795)

(assert (=> b!1202819 (= lt!544993 call!57527)))

(assert (=> b!1202819 (= e!683139 lt!544993)))

(declare-fun mapIsEmpty!47681 () Bool)

(declare-fun mapRes!47681 () Bool)

(assert (=> mapIsEmpty!47681 mapRes!47681))

(declare-fun b!1202820 () Bool)

(declare-fun lt!544986 () Unit!39795)

(assert (=> b!1202820 (= e!683146 lt!544986)))

(declare-fun lt!544992 () Unit!39795)

(assert (=> b!1202820 (= lt!544992 call!57530)))

(declare-fun lt!544982 () ListLongMap!17637)

(declare-fun +!4004 (ListLongMap!17637 tuple2!19660) ListLongMap!17637)

(assert (=> b!1202820 (= lt!544982 (+!4004 lt!544991 (tuple2!19661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!57528 () Bool)

(assert (=> b!1202820 call!57528))

(assert (=> b!1202820 (= lt!544986 (addStillContains!991 lt!544982 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1202820 (contains!6913 call!57525 k0!934)))

(declare-fun b!1202821 () Bool)

(declare-fun e!683147 () Bool)

(assert (=> b!1202821 (= e!683147 tp_is_empty!30559)))

(declare-fun b!1202822 () Bool)

(assert (=> b!1202822 (= e!683135 true)))

(declare-fun lt!544994 () Unit!39795)

(assert (=> b!1202822 (= lt!544994 e!683146)))

(assert (=> b!1202822 (= c!117927 (and (not lt!544988) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1202822 (= lt!544988 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1202823 () Bool)

(declare-fun c!117928 () Bool)

(assert (=> b!1202823 (= c!117928 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!544988))))

(declare-fun e!683143 () Unit!39795)

(assert (=> b!1202823 (= e!683139 e!683143)))

(declare-fun b!1202824 () Bool)

(declare-fun lt!544990 () Unit!39795)

(assert (=> b!1202824 (= e!683143 lt!544990)))

(assert (=> b!1202824 (= lt!544990 call!57527)))

(assert (=> b!1202824 call!57532))

(declare-fun b!1202825 () Bool)

(declare-fun Unit!39797 () Unit!39795)

(assert (=> b!1202825 (= e!683143 Unit!39797)))

(declare-fun b!1202826 () Bool)

(declare-fun e!683140 () Bool)

(assert (=> b!1202826 (= e!683140 (and e!683147 mapRes!47681))))

(declare-fun condMapEmpty!47681 () Bool)

(declare-fun mapDefault!47681 () ValueCell!14570)

(assert (=> b!1202826 (= condMapEmpty!47681 (= (arr!37604 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14570)) mapDefault!47681)))))

(declare-fun b!1202827 () Bool)

(assert (=> b!1202827 (= e!683134 (= call!57529 call!57531))))

(declare-fun mapNonEmpty!47681 () Bool)

(declare-fun tp!90555 () Bool)

(assert (=> mapNonEmpty!47681 (= mapRes!47681 (and tp!90555 e!683136))))

(declare-fun mapValue!47681 () ValueCell!14570)

(declare-fun mapKey!47681 () (_ BitVec 32))

(declare-fun mapRest!47681 () (Array (_ BitVec 32) ValueCell!14570))

(assert (=> mapNonEmpty!47681 (= (arr!37604 _values!996) (store mapRest!47681 mapKey!47681 mapValue!47681))))

(declare-fun bm!57526 () Bool)

(assert (=> bm!57526 (= call!57532 call!57528)))

(declare-fun bm!57527 () Bool)

(assert (=> bm!57527 (= call!57528 (contains!6913 (ite c!117927 lt!544982 call!57526) k0!934))))

(declare-fun res!800327 () Bool)

(assert (=> start!100768 (=> (not res!800327) (not e!683142))))

(assert (=> start!100768 (= res!800327 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38140 _keys!1208))))))

(assert (=> start!100768 e!683142))

(assert (=> start!100768 tp_is_empty!30559))

(declare-fun array_inv!28722 (array!77929) Bool)

(assert (=> start!100768 (array_inv!28722 _keys!1208)))

(assert (=> start!100768 true))

(assert (=> start!100768 tp!90554))

(declare-fun array_inv!28723 (array!77931) Bool)

(assert (=> start!100768 (and (array_inv!28723 _values!996) e!683140)))

(declare-fun b!1202828 () Bool)

(declare-fun res!800335 () Bool)

(assert (=> b!1202828 (=> (not res!800335) (not e!683142))))

(declare-datatypes ((List!26476 0))(
  ( (Nil!26473) (Cons!26472 (h!27690 (_ BitVec 64)) (t!39303 List!26476)) )
))
(declare-fun arrayNoDuplicates!0 (array!77929 (_ BitVec 32) List!26476) Bool)

(assert (=> b!1202828 (= res!800335 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26473))))

(declare-fun bm!57528 () Bool)

(assert (=> bm!57528 (= call!57527 call!57530)))

(declare-fun b!1202829 () Bool)

(declare-fun res!800332 () Bool)

(assert (=> b!1202829 (=> (not res!800332) (not e!683142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1202829 (= res!800332 (validKeyInArray!0 k0!934))))

(declare-fun bm!57529 () Bool)

(assert (=> bm!57529 (= call!57525 (+!4004 (ite c!117927 lt!544982 lt!544991) (ite c!117927 (tuple2!19661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!117926 (tuple2!19661 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!19661 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1202830 () Bool)

(declare-fun res!800330 () Bool)

(assert (=> b!1202830 (=> (not res!800330) (not e!683142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1202830 (= res!800330 (validMask!0 mask!1564))))

(declare-fun b!1202831 () Bool)

(declare-fun -!1790 (ListLongMap!17637 (_ BitVec 64)) ListLongMap!17637)

(assert (=> b!1202831 (= e!683134 (= call!57529 (-!1790 call!57531 k0!934)))))

(declare-fun b!1202832 () Bool)

(declare-fun res!800334 () Bool)

(assert (=> b!1202832 (=> (not res!800334) (not e!683142))))

(assert (=> b!1202832 (= res!800334 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38140 _keys!1208))))))

(declare-fun b!1202833 () Bool)

(declare-fun res!800328 () Bool)

(assert (=> b!1202833 (=> (not res!800328) (not e!683144))))

(assert (=> b!1202833 (= res!800328 (arrayNoDuplicates!0 lt!544983 #b00000000000000000000000000000000 Nil!26473))))

(declare-fun b!1202834 () Bool)

(declare-fun res!800337 () Bool)

(assert (=> b!1202834 (=> (not res!800337) (not e!683142))))

(assert (=> b!1202834 (= res!800337 (and (= (size!38141 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38140 _keys!1208) (size!38141 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1202835 () Bool)

(assert (=> b!1202835 (= e!683145 e!683141)))

(declare-fun res!800338 () Bool)

(assert (=> b!1202835 (=> res!800338 e!683141)))

(assert (=> b!1202835 (= res!800338 (not (= from!1455 i!673)))))

(declare-fun lt!544985 () ListLongMap!17637)

(assert (=> b!1202835 (= lt!544985 (getCurrentListMapNoExtraKeys!5301 lt!544983 lt!544984 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3239 (Int (_ BitVec 64)) V!45873)

(assert (=> b!1202835 (= lt!544984 (array!77932 (store (arr!37604 _values!996) i!673 (ValueCellFull!14570 (dynLambda!3239 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38141 _values!996)))))

(declare-fun lt!544989 () ListLongMap!17637)

(assert (=> b!1202835 (= lt!544989 (getCurrentListMapNoExtraKeys!5301 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (= (and start!100768 res!800327) b!1202830))

(assert (= (and b!1202830 res!800330) b!1202834))

(assert (= (and b!1202834 res!800337) b!1202817))

(assert (= (and b!1202817 res!800331) b!1202828))

(assert (= (and b!1202828 res!800335) b!1202832))

(assert (= (and b!1202832 res!800334) b!1202829))

(assert (= (and b!1202829 res!800332) b!1202813))

(assert (= (and b!1202813 res!800336) b!1202811))

(assert (= (and b!1202811 res!800325) b!1202833))

(assert (= (and b!1202833 res!800328) b!1202815))

(assert (= (and b!1202815 (not res!800326)) b!1202835))

(assert (= (and b!1202835 (not res!800338)) b!1202812))

(assert (= (and b!1202812 c!117925) b!1202831))

(assert (= (and b!1202812 (not c!117925)) b!1202827))

(assert (= (or b!1202831 b!1202827) bm!57523))

(assert (= (or b!1202831 b!1202827) bm!57522))

(assert (= (and b!1202812 (not res!800333)) b!1202818))

(assert (= (and b!1202818 (not res!800329)) b!1202822))

(assert (= (and b!1202822 c!117927) b!1202820))

(assert (= (and b!1202822 (not c!117927)) b!1202816))

(assert (= (and b!1202816 c!117926) b!1202819))

(assert (= (and b!1202816 (not c!117926)) b!1202823))

(assert (= (and b!1202823 c!117928) b!1202824))

(assert (= (and b!1202823 (not c!117928)) b!1202825))

(assert (= (or b!1202819 b!1202824) bm!57528))

(assert (= (or b!1202819 b!1202824) bm!57524))

(assert (= (or b!1202819 b!1202824) bm!57526))

(assert (= (or b!1202820 bm!57526) bm!57527))

(assert (= (or b!1202820 bm!57528) bm!57525))

(assert (= (or b!1202820 bm!57524) bm!57529))

(assert (= (and b!1202826 condMapEmpty!47681) mapIsEmpty!47681))

(assert (= (and b!1202826 (not condMapEmpty!47681)) mapNonEmpty!47681))

(get-info :version)

(assert (= (and mapNonEmpty!47681 ((_ is ValueCellFull!14570) mapValue!47681)) b!1202814))

(assert (= (and b!1202826 ((_ is ValueCellFull!14570) mapDefault!47681)) b!1202821))

(assert (= start!100768 b!1202826))

(declare-fun b_lambda!21045 () Bool)

(assert (=> (not b_lambda!21045) (not b!1202835)))

(declare-fun t!39301 () Bool)

(declare-fun tb!10647 () Bool)

(assert (=> (and start!100768 (= defaultEntry!1004 defaultEntry!1004) t!39301) tb!10647))

(declare-fun result!21879 () Bool)

(assert (=> tb!10647 (= result!21879 tp_is_empty!30559)))

(assert (=> b!1202835 t!39301))

(declare-fun b_and!42601 () Bool)

(assert (= b_and!42599 (and (=> t!39301 result!21879) b_and!42601)))

(declare-fun m!1109177 () Bool)

(assert (=> mapNonEmpty!47681 m!1109177))

(declare-fun m!1109179 () Bool)

(assert (=> b!1202812 m!1109179))

(declare-fun m!1109181 () Bool)

(assert (=> b!1202812 m!1109181))

(declare-fun m!1109183 () Bool)

(assert (=> b!1202815 m!1109183))

(declare-fun m!1109185 () Bool)

(assert (=> b!1202815 m!1109185))

(declare-fun m!1109187 () Bool)

(assert (=> b!1202829 m!1109187))

(declare-fun m!1109189 () Bool)

(assert (=> bm!57529 m!1109189))

(declare-fun m!1109191 () Bool)

(assert (=> b!1202835 m!1109191))

(declare-fun m!1109193 () Bool)

(assert (=> b!1202835 m!1109193))

(declare-fun m!1109195 () Bool)

(assert (=> b!1202835 m!1109195))

(declare-fun m!1109197 () Bool)

(assert (=> b!1202835 m!1109197))

(declare-fun m!1109199 () Bool)

(assert (=> bm!57522 m!1109199))

(declare-fun m!1109201 () Bool)

(assert (=> bm!57523 m!1109201))

(declare-fun m!1109203 () Bool)

(assert (=> bm!57525 m!1109203))

(declare-fun m!1109205 () Bool)

(assert (=> b!1202813 m!1109205))

(declare-fun m!1109207 () Bool)

(assert (=> b!1202818 m!1109207))

(assert (=> b!1202818 m!1109201))

(declare-fun m!1109209 () Bool)

(assert (=> b!1202830 m!1109209))

(declare-fun m!1109211 () Bool)

(assert (=> b!1202833 m!1109211))

(declare-fun m!1109213 () Bool)

(assert (=> bm!57527 m!1109213))

(declare-fun m!1109215 () Bool)

(assert (=> b!1202828 m!1109215))

(declare-fun m!1109217 () Bool)

(assert (=> start!100768 m!1109217))

(declare-fun m!1109219 () Bool)

(assert (=> start!100768 m!1109219))

(declare-fun m!1109221 () Bool)

(assert (=> b!1202817 m!1109221))

(declare-fun m!1109223 () Bool)

(assert (=> b!1202820 m!1109223))

(declare-fun m!1109225 () Bool)

(assert (=> b!1202820 m!1109225))

(declare-fun m!1109227 () Bool)

(assert (=> b!1202820 m!1109227))

(declare-fun m!1109229 () Bool)

(assert (=> b!1202831 m!1109229))

(declare-fun m!1109231 () Bool)

(assert (=> b!1202811 m!1109231))

(declare-fun m!1109233 () Bool)

(assert (=> b!1202811 m!1109233))

(check-sat (not bm!57525) (not bm!57529) (not b!1202820) (not b_next!25855) (not b_lambda!21045) (not bm!57523) (not b!1202818) (not start!100768) (not b!1202815) (not b!1202829) (not mapNonEmpty!47681) (not bm!57527) (not bm!57522) (not b!1202811) (not b!1202828) (not b!1202835) b_and!42601 (not b!1202830) (not b!1202833) (not b!1202817) tp_is_empty!30559 (not b!1202831) (not b!1202812))
(check-sat b_and!42601 (not b_next!25855))
