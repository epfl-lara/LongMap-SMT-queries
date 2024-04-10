; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100504 () Bool)

(assert start!100504)

(declare-fun b_free!25827 () Bool)

(declare-fun b_next!25827 () Bool)

(assert (=> start!100504 (= b_free!25827 (not b_next!25827))))

(declare-fun tp!90470 () Bool)

(declare-fun b_and!42541 () Bool)

(assert (=> start!100504 (= tp!90470 b_and!42541)))

(declare-fun b!1200644 () Bool)

(declare-fun e!681838 () Bool)

(declare-fun tp_is_empty!30531 () Bool)

(assert (=> b!1200644 (= e!681838 tp_is_empty!30531)))

(declare-datatypes ((V!45835 0))(
  ( (V!45836 (val!15322 Int)) )
))
(declare-datatypes ((tuple2!19616 0))(
  ( (tuple2!19617 (_1!9819 (_ BitVec 64)) (_2!9819 V!45835)) )
))
(declare-datatypes ((List!26436 0))(
  ( (Nil!26433) (Cons!26432 (h!27641 tuple2!19616) (t!39243 List!26436)) )
))
(declare-datatypes ((ListLongMap!17585 0))(
  ( (ListLongMap!17586 (toList!8808 List!26436)) )
))
(declare-fun call!57310 () ListLongMap!17585)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun call!57311 () ListLongMap!17585)

(declare-fun b!1200645 () Bool)

(declare-fun e!681832 () Bool)

(declare-fun -!1784 (ListLongMap!17585 (_ BitVec 64)) ListLongMap!17585)

(assert (=> b!1200645 (= e!681832 (= call!57310 (-!1784 call!57311 k0!934)))))

(declare-fun b!1200646 () Bool)

(declare-fun res!799250 () Bool)

(declare-fun e!681830 () Bool)

(assert (=> b!1200646 (=> (not res!799250) (not e!681830))))

(declare-datatypes ((array!77835 0))(
  ( (array!77836 (arr!37562 (Array (_ BitVec 32) (_ BitVec 64))) (size!38098 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77835)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77835 (_ BitVec 32)) Bool)

(assert (=> b!1200646 (= res!799250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200647 () Bool)

(declare-fun e!681836 () Bool)

(assert (=> b!1200647 (= e!681830 e!681836)))

(declare-fun res!799246 () Bool)

(assert (=> b!1200647 (=> (not res!799246) (not e!681836))))

(declare-fun lt!544118 () array!77835)

(assert (=> b!1200647 (= res!799246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544118 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200647 (= lt!544118 (array!77836 (store (arr!37562 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38098 _keys!1208)))))

(declare-fun b!1200648 () Bool)

(declare-fun res!799251 () Bool)

(assert (=> b!1200648 (=> (not res!799251) (not e!681830))))

(declare-datatypes ((List!26437 0))(
  ( (Nil!26434) (Cons!26433 (h!27642 (_ BitVec 64)) (t!39244 List!26437)) )
))
(declare-fun arrayNoDuplicates!0 (array!77835 (_ BitVec 32) List!26437) Bool)

(assert (=> b!1200648 (= res!799251 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26434))))

(declare-fun b!1200649 () Bool)

(declare-fun res!799242 () Bool)

(assert (=> b!1200649 (=> (not res!799242) (not e!681830))))

(assert (=> b!1200649 (= res!799242 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38098 _keys!1208))))))

(declare-fun mapNonEmpty!47639 () Bool)

(declare-fun mapRes!47639 () Bool)

(declare-fun tp!90471 () Bool)

(declare-fun e!681829 () Bool)

(assert (=> mapNonEmpty!47639 (= mapRes!47639 (and tp!90471 e!681829))))

(declare-datatypes ((ValueCell!14556 0))(
  ( (ValueCellFull!14556 (v!17960 V!45835)) (EmptyCell!14556) )
))
(declare-fun mapValue!47639 () ValueCell!14556)

(declare-fun mapKey!47639 () (_ BitVec 32))

(declare-fun mapRest!47639 () (Array (_ BitVec 32) ValueCell!14556))

(declare-datatypes ((array!77837 0))(
  ( (array!77838 (arr!37563 (Array (_ BitVec 32) ValueCell!14556)) (size!38099 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77837)

(assert (=> mapNonEmpty!47639 (= (arr!37563 _values!996) (store mapRest!47639 mapKey!47639 mapValue!47639))))

(declare-fun zeroValue!944 () V!45835)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!57307 () Bool)

(declare-fun minValue!944 () V!45835)

(declare-fun getCurrentListMapNoExtraKeys!5247 (array!77835 array!77837 (_ BitVec 32) (_ BitVec 32) V!45835 V!45835 (_ BitVec 32) Int) ListLongMap!17585)

(assert (=> bm!57307 (= call!57311 (getCurrentListMapNoExtraKeys!5247 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200650 () Bool)

(declare-fun res!799245 () Bool)

(assert (=> b!1200650 (=> (not res!799245) (not e!681830))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1200650 (= res!799245 (validKeyInArray!0 k0!934))))

(declare-fun b!1200651 () Bool)

(declare-fun e!681834 () Bool)

(declare-fun e!681837 () Bool)

(assert (=> b!1200651 (= e!681834 e!681837)))

(declare-fun res!799243 () Bool)

(assert (=> b!1200651 (=> res!799243 e!681837)))

(assert (=> b!1200651 (= res!799243 (not (= (select (arr!37562 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1200651 e!681832))

(declare-fun c!117452 () Bool)

(assert (=> b!1200651 (= c!117452 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39808 0))(
  ( (Unit!39809) )
))
(declare-fun lt!544117 () Unit!39808)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!991 (array!77835 array!77837 (_ BitVec 32) (_ BitVec 32) V!45835 V!45835 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39808)

(assert (=> b!1200651 (= lt!544117 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!991 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200652 () Bool)

(declare-fun res!799252 () Bool)

(assert (=> b!1200652 (=> (not res!799252) (not e!681830))))

(assert (=> b!1200652 (= res!799252 (= (select (arr!37562 _keys!1208) i!673) k0!934))))

(declare-fun b!1200653 () Bool)

(declare-fun res!799247 () Bool)

(assert (=> b!1200653 (=> (not res!799247) (not e!681830))))

(assert (=> b!1200653 (= res!799247 (and (= (size!38099 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38098 _keys!1208) (size!38099 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun lt!544120 () array!77837)

(declare-fun bm!57308 () Bool)

(assert (=> bm!57308 (= call!57310 (getCurrentListMapNoExtraKeys!5247 lt!544118 lt!544120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200654 () Bool)

(assert (=> b!1200654 (= e!681837 true)))

(declare-fun lt!544119 () Bool)

(declare-fun contains!6869 (ListLongMap!17585 (_ BitVec 64)) Bool)

(assert (=> b!1200654 (= lt!544119 (contains!6869 (getCurrentListMapNoExtraKeys!5247 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1200655 () Bool)

(declare-fun e!681835 () Bool)

(assert (=> b!1200655 (= e!681835 e!681834)))

(declare-fun res!799253 () Bool)

(assert (=> b!1200655 (=> res!799253 e!681834)))

(assert (=> b!1200655 (= res!799253 (not (= from!1455 i!673)))))

(declare-fun lt!544121 () ListLongMap!17585)

(assert (=> b!1200655 (= lt!544121 (getCurrentListMapNoExtraKeys!5247 lt!544118 lt!544120 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3167 (Int (_ BitVec 64)) V!45835)

(assert (=> b!1200655 (= lt!544120 (array!77838 (store (arr!37563 _values!996) i!673 (ValueCellFull!14556 (dynLambda!3167 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38099 _values!996)))))

(declare-fun lt!544122 () ListLongMap!17585)

(assert (=> b!1200655 (= lt!544122 (getCurrentListMapNoExtraKeys!5247 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200656 () Bool)

(assert (=> b!1200656 (= e!681829 tp_is_empty!30531)))

(declare-fun mapIsEmpty!47639 () Bool)

(assert (=> mapIsEmpty!47639 mapRes!47639))

(declare-fun res!799248 () Bool)

(assert (=> start!100504 (=> (not res!799248) (not e!681830))))

(assert (=> start!100504 (= res!799248 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38098 _keys!1208))))))

(assert (=> start!100504 e!681830))

(assert (=> start!100504 tp_is_empty!30531))

(declare-fun array_inv!28628 (array!77835) Bool)

(assert (=> start!100504 (array_inv!28628 _keys!1208)))

(assert (=> start!100504 true))

(assert (=> start!100504 tp!90470))

(declare-fun e!681833 () Bool)

(declare-fun array_inv!28629 (array!77837) Bool)

(assert (=> start!100504 (and (array_inv!28629 _values!996) e!681833)))

(declare-fun b!1200643 () Bool)

(declare-fun res!799249 () Bool)

(assert (=> b!1200643 (=> (not res!799249) (not e!681830))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200643 (= res!799249 (validMask!0 mask!1564))))

(declare-fun b!1200657 () Bool)

(declare-fun res!799254 () Bool)

(assert (=> b!1200657 (=> (not res!799254) (not e!681836))))

(assert (=> b!1200657 (= res!799254 (arrayNoDuplicates!0 lt!544118 #b00000000000000000000000000000000 Nil!26434))))

(declare-fun b!1200658 () Bool)

(assert (=> b!1200658 (= e!681832 (= call!57310 call!57311))))

(declare-fun b!1200659 () Bool)

(assert (=> b!1200659 (= e!681833 (and e!681838 mapRes!47639))))

(declare-fun condMapEmpty!47639 () Bool)

(declare-fun mapDefault!47639 () ValueCell!14556)

(assert (=> b!1200659 (= condMapEmpty!47639 (= (arr!37563 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14556)) mapDefault!47639)))))

(declare-fun b!1200660 () Bool)

(assert (=> b!1200660 (= e!681836 (not e!681835))))

(declare-fun res!799244 () Bool)

(assert (=> b!1200660 (=> res!799244 e!681835)))

(assert (=> b!1200660 (= res!799244 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200660 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!544123 () Unit!39808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77835 (_ BitVec 64) (_ BitVec 32)) Unit!39808)

(assert (=> b!1200660 (= lt!544123 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!100504 res!799248) b!1200643))

(assert (= (and b!1200643 res!799249) b!1200653))

(assert (= (and b!1200653 res!799247) b!1200646))

(assert (= (and b!1200646 res!799250) b!1200648))

(assert (= (and b!1200648 res!799251) b!1200649))

(assert (= (and b!1200649 res!799242) b!1200650))

(assert (= (and b!1200650 res!799245) b!1200652))

(assert (= (and b!1200652 res!799252) b!1200647))

(assert (= (and b!1200647 res!799246) b!1200657))

(assert (= (and b!1200657 res!799254) b!1200660))

(assert (= (and b!1200660 (not res!799244)) b!1200655))

(assert (= (and b!1200655 (not res!799253)) b!1200651))

(assert (= (and b!1200651 c!117452) b!1200645))

(assert (= (and b!1200651 (not c!117452)) b!1200658))

(assert (= (or b!1200645 b!1200658) bm!57308))

(assert (= (or b!1200645 b!1200658) bm!57307))

(assert (= (and b!1200651 (not res!799243)) b!1200654))

(assert (= (and b!1200659 condMapEmpty!47639) mapIsEmpty!47639))

(assert (= (and b!1200659 (not condMapEmpty!47639)) mapNonEmpty!47639))

(get-info :version)

(assert (= (and mapNonEmpty!47639 ((_ is ValueCellFull!14556) mapValue!47639)) b!1200656))

(assert (= (and b!1200659 ((_ is ValueCellFull!14556) mapDefault!47639)) b!1200644))

(assert (= start!100504 b!1200659))

(declare-fun b_lambda!21023 () Bool)

(assert (=> (not b_lambda!21023) (not b!1200655)))

(declare-fun t!39242 () Bool)

(declare-fun tb!10627 () Bool)

(assert (=> (and start!100504 (= defaultEntry!1004 defaultEntry!1004) t!39242) tb!10627))

(declare-fun result!21831 () Bool)

(assert (=> tb!10627 (= result!21831 tp_is_empty!30531)))

(assert (=> b!1200655 t!39242))

(declare-fun b_and!42543 () Bool)

(assert (= b_and!42541 (and (=> t!39242 result!21831) b_and!42543)))

(declare-fun m!1106907 () Bool)

(assert (=> mapNonEmpty!47639 m!1106907))

(declare-fun m!1106909 () Bool)

(assert (=> b!1200657 m!1106909))

(declare-fun m!1106911 () Bool)

(assert (=> b!1200647 m!1106911))

(declare-fun m!1106913 () Bool)

(assert (=> b!1200647 m!1106913))

(declare-fun m!1106915 () Bool)

(assert (=> b!1200650 m!1106915))

(declare-fun m!1106917 () Bool)

(assert (=> b!1200643 m!1106917))

(declare-fun m!1106919 () Bool)

(assert (=> b!1200645 m!1106919))

(declare-fun m!1106921 () Bool)

(assert (=> start!100504 m!1106921))

(declare-fun m!1106923 () Bool)

(assert (=> start!100504 m!1106923))

(declare-fun m!1106925 () Bool)

(assert (=> b!1200655 m!1106925))

(declare-fun m!1106927 () Bool)

(assert (=> b!1200655 m!1106927))

(declare-fun m!1106929 () Bool)

(assert (=> b!1200655 m!1106929))

(declare-fun m!1106931 () Bool)

(assert (=> b!1200655 m!1106931))

(declare-fun m!1106933 () Bool)

(assert (=> b!1200646 m!1106933))

(declare-fun m!1106935 () Bool)

(assert (=> b!1200654 m!1106935))

(assert (=> b!1200654 m!1106935))

(declare-fun m!1106937 () Bool)

(assert (=> b!1200654 m!1106937))

(declare-fun m!1106939 () Bool)

(assert (=> bm!57308 m!1106939))

(declare-fun m!1106941 () Bool)

(assert (=> b!1200660 m!1106941))

(declare-fun m!1106943 () Bool)

(assert (=> b!1200660 m!1106943))

(declare-fun m!1106945 () Bool)

(assert (=> b!1200651 m!1106945))

(declare-fun m!1106947 () Bool)

(assert (=> b!1200651 m!1106947))

(assert (=> bm!57307 m!1106935))

(declare-fun m!1106949 () Bool)

(assert (=> b!1200652 m!1106949))

(declare-fun m!1106951 () Bool)

(assert (=> b!1200648 m!1106951))

(check-sat (not b!1200660) (not b_next!25827) (not b!1200657) tp_is_empty!30531 (not b!1200645) (not b!1200650) (not b_lambda!21023) (not b!1200647) (not start!100504) (not bm!57307) (not b!1200655) (not b!1200643) b_and!42543 (not b!1200648) (not b!1200651) (not bm!57308) (not b!1200654) (not b!1200646) (not mapNonEmpty!47639))
(check-sat b_and!42543 (not b_next!25827))
