; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98362 () Bool)

(assert start!98362)

(declare-fun b_free!23967 () Bool)

(declare-fun b_next!23967 () Bool)

(assert (=> start!98362 (= b_free!23967 (not b_next!23967))))

(declare-fun tp!84611 () Bool)

(declare-fun b_and!38783 () Bool)

(assert (=> start!98362 (= tp!84611 b_and!38783)))

(declare-fun b!1133691 () Bool)

(declare-fun e!645210 () Bool)

(declare-fun e!645213 () Bool)

(assert (=> b!1133691 (= e!645210 e!645213)))

(declare-fun res!756933 () Bool)

(assert (=> b!1133691 (=> res!756933 e!645213)))

(declare-datatypes ((V!43123 0))(
  ( (V!43124 (val!14305 Int)) )
))
(declare-datatypes ((tuple2!18042 0))(
  ( (tuple2!18043 (_1!9032 (_ BitVec 64)) (_2!9032 V!43123)) )
))
(declare-datatypes ((List!24803 0))(
  ( (Nil!24800) (Cons!24799 (h!26008 tuple2!18042) (t!35762 List!24803)) )
))
(declare-datatypes ((ListLongMap!16011 0))(
  ( (ListLongMap!16012 (toList!8021 List!24803)) )
))
(declare-fun lt!503816 () ListLongMap!16011)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6546 (ListLongMap!16011 (_ BitVec 64)) Bool)

(assert (=> b!1133691 (= res!756933 (not (contains!6546 lt!503816 k0!934)))))

(declare-fun zeroValue!944 () V!43123)

(declare-datatypes ((array!73855 0))(
  ( (array!73856 (arr!35578 (Array (_ BitVec 32) (_ BitVec 64))) (size!36114 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73855)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13539 0))(
  ( (ValueCellFull!13539 (v!16942 V!43123)) (EmptyCell!13539) )
))
(declare-datatypes ((array!73857 0))(
  ( (array!73858 (arr!35579 (Array (_ BitVec 32) ValueCell!13539)) (size!36115 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73857)

(declare-fun minValue!944 () V!43123)

(declare-fun getCurrentListMapNoExtraKeys!4508 (array!73855 array!73857 (_ BitVec 32) (_ BitVec 32) V!43123 V!43123 (_ BitVec 32) Int) ListLongMap!16011)

(assert (=> b!1133691 (= lt!503816 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133692 () Bool)

(declare-fun e!645216 () Bool)

(declare-fun e!645214 () Bool)

(assert (=> b!1133692 (= e!645216 e!645214)))

(declare-fun res!756944 () Bool)

(assert (=> b!1133692 (=> (not res!756944) (not e!645214))))

(declare-fun lt!503821 () array!73855)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73855 (_ BitVec 32)) Bool)

(assert (=> b!1133692 (= res!756944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!503821 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1133692 (= lt!503821 (array!73856 (store (arr!35578 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36114 _keys!1208)))))

(declare-fun bm!49143 () Bool)

(declare-fun call!49147 () ListLongMap!16011)

(declare-fun call!49146 () ListLongMap!16011)

(assert (=> bm!49143 (= call!49147 call!49146)))

(declare-fun b!1133694 () Bool)

(declare-datatypes ((Unit!37148 0))(
  ( (Unit!37149) )
))
(declare-fun e!645207 () Unit!37148)

(declare-fun Unit!37150 () Unit!37148)

(assert (=> b!1133694 (= e!645207 Unit!37150)))

(declare-fun b!1133695 () Bool)

(declare-fun e!645217 () Unit!37148)

(declare-fun e!645219 () Unit!37148)

(assert (=> b!1133695 (= e!645217 e!645219)))

(declare-fun c!110655 () Bool)

(declare-fun lt!503827 () Bool)

(assert (=> b!1133695 (= c!110655 (and (not lt!503827) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1133696 () Bool)

(declare-fun e!645221 () Bool)

(declare-fun call!49149 () ListLongMap!16011)

(declare-fun call!49152 () ListLongMap!16011)

(assert (=> b!1133696 (= e!645221 (= call!49149 call!49152))))

(declare-fun b!1133697 () Bool)

(declare-fun res!756937 () Bool)

(assert (=> b!1133697 (=> (not res!756937) (not e!645214))))

(declare-datatypes ((List!24804 0))(
  ( (Nil!24801) (Cons!24800 (h!26009 (_ BitVec 64)) (t!35763 List!24804)) )
))
(declare-fun arrayNoDuplicates!0 (array!73855 (_ BitVec 32) List!24804) Bool)

(assert (=> b!1133697 (= res!756937 (arrayNoDuplicates!0 lt!503821 #b00000000000000000000000000000000 Nil!24801))))

(declare-fun b!1133698 () Bool)

(declare-fun lt!503822 () Unit!37148)

(assert (=> b!1133698 (= e!645217 lt!503822)))

(declare-fun lt!503825 () Unit!37148)

(declare-fun call!49153 () Unit!37148)

(assert (=> b!1133698 (= lt!503825 call!49153)))

(declare-fun lt!503824 () ListLongMap!16011)

(declare-fun +!3463 (ListLongMap!16011 tuple2!18042) ListLongMap!16011)

(assert (=> b!1133698 (= lt!503824 (+!3463 lt!503816 (tuple2!18043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)))))

(declare-fun call!49148 () Bool)

(assert (=> b!1133698 call!49148))

(declare-fun addStillContains!726 (ListLongMap!16011 (_ BitVec 64) V!43123 (_ BitVec 64)) Unit!37148)

(assert (=> b!1133698 (= lt!503822 (addStillContains!726 lt!503824 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944 k0!934))))

(assert (=> b!1133698 (contains!6546 call!49146 k0!934)))

(declare-fun bm!49144 () Bool)

(declare-fun c!110657 () Bool)

(assert (=> bm!49144 (= call!49148 (contains!6546 (ite c!110657 lt!503824 call!49147) k0!934))))

(declare-fun b!1133699 () Bool)

(declare-fun e!645209 () Bool)

(declare-fun arrayContainsKey!0 (array!73855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1133699 (= e!645209 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun bm!49145 () Bool)

(assert (=> bm!49145 (= call!49152 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133700 () Bool)

(declare-fun -!1188 (ListLongMap!16011 (_ BitVec 64)) ListLongMap!16011)

(assert (=> b!1133700 (= e!645221 (= call!49149 (-!1188 call!49152 k0!934)))))

(declare-fun b!1133701 () Bool)

(declare-fun res!756940 () Bool)

(assert (=> b!1133701 (=> (not res!756940) (not e!645216))))

(assert (=> b!1133701 (= res!756940 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36114 _keys!1208))))))

(declare-fun bm!49146 () Bool)

(assert (=> bm!49146 (= call!49146 (+!3463 (ite c!110657 lt!503824 lt!503816) (ite c!110657 (tuple2!18043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944) (ite c!110655 (tuple2!18043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944) (tuple2!18043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!944)))))))

(declare-fun b!1133702 () Bool)

(declare-fun res!756934 () Bool)

(assert (=> b!1133702 (=> (not res!756934) (not e!645216))))

(assert (=> b!1133702 (= res!756934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!645222 () Bool)

(declare-fun b!1133703 () Bool)

(assert (=> b!1133703 (= e!645222 (ite (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000) (not lt!503827) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1133704 () Bool)

(declare-fun call!49150 () Bool)

(assert (=> b!1133704 call!49150))

(declare-fun lt!503820 () Unit!37148)

(declare-fun call!49151 () Unit!37148)

(assert (=> b!1133704 (= lt!503820 call!49151)))

(assert (=> b!1133704 (= e!645219 lt!503820)))

(declare-fun b!1133705 () Bool)

(declare-fun e!645220 () Bool)

(declare-fun tp_is_empty!28497 () Bool)

(assert (=> b!1133705 (= e!645220 tp_is_empty!28497)))

(declare-fun b!1133706 () Bool)

(declare-fun res!756935 () Bool)

(assert (=> b!1133706 (=> (not res!756935) (not e!645216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1133706 (= res!756935 (validKeyInArray!0 k0!934))))

(declare-fun bm!49147 () Bool)

(assert (=> bm!49147 (= call!49150 call!49148)))

(declare-fun bm!49148 () Bool)

(assert (=> bm!49148 (= call!49151 call!49153)))

(declare-fun mapNonEmpty!44570 () Bool)

(declare-fun mapRes!44570 () Bool)

(declare-fun tp!84612 () Bool)

(declare-fun e!645208 () Bool)

(assert (=> mapNonEmpty!44570 (= mapRes!44570 (and tp!84612 e!645208))))

(declare-fun mapKey!44570 () (_ BitVec 32))

(declare-fun mapRest!44570 () (Array (_ BitVec 32) ValueCell!13539))

(declare-fun mapValue!44570 () ValueCell!13539)

(assert (=> mapNonEmpty!44570 (= (arr!35579 _values!996) (store mapRest!44570 mapKey!44570 mapValue!44570))))

(declare-fun b!1133707 () Bool)

(declare-fun res!756941 () Bool)

(assert (=> b!1133707 (=> (not res!756941) (not e!645216))))

(assert (=> b!1133707 (= res!756941 (= (select (arr!35578 _keys!1208) i!673) k0!934))))

(declare-fun res!756938 () Bool)

(assert (=> start!98362 (=> (not res!756938) (not e!645216))))

(assert (=> start!98362 (= res!756938 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36114 _keys!1208))))))

(assert (=> start!98362 e!645216))

(assert (=> start!98362 tp_is_empty!28497))

(declare-fun array_inv!27288 (array!73855) Bool)

(assert (=> start!98362 (array_inv!27288 _keys!1208)))

(assert (=> start!98362 true))

(assert (=> start!98362 tp!84611))

(declare-fun e!645218 () Bool)

(declare-fun array_inv!27289 (array!73857) Bool)

(assert (=> start!98362 (and (array_inv!27289 _values!996) e!645218)))

(declare-fun b!1133693 () Bool)

(assert (=> b!1133693 (= e!645208 tp_is_empty!28497)))

(declare-fun bm!49149 () Bool)

(assert (=> bm!49149 (= call!49153 (addStillContains!726 lt!503816 (ite (or c!110657 c!110655) #b0000000000000000000000000000000000000000000000000000000000000000 #b1000000000000000000000000000000000000000000000000000000000000000) (ite (or c!110657 c!110655) zeroValue!944 minValue!944) k0!934))))

(declare-fun b!1133708 () Bool)

(declare-fun res!756943 () Bool)

(assert (=> b!1133708 (=> (not res!756943) (not e!645216))))

(assert (=> b!1133708 (= res!756943 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24801))))

(declare-fun b!1133709 () Bool)

(declare-fun e!645215 () Bool)

(assert (=> b!1133709 (= e!645214 (not e!645215))))

(declare-fun res!756947 () Bool)

(assert (=> b!1133709 (=> res!756947 e!645215)))

(assert (=> b!1133709 (= res!756947 (bvsgt from!1455 i!673))))

(assert (=> b!1133709 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!503826 () Unit!37148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73855 (_ BitVec 64) (_ BitVec 32)) Unit!37148)

(assert (=> b!1133709 (= lt!503826 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1133710 () Bool)

(declare-fun e!645212 () Bool)

(assert (=> b!1133710 (= e!645215 e!645212)))

(declare-fun res!756939 () Bool)

(assert (=> b!1133710 (=> res!756939 e!645212)))

(assert (=> b!1133710 (= res!756939 (not (= from!1455 i!673)))))

(declare-fun lt!503817 () ListLongMap!16011)

(declare-fun lt!503823 () array!73857)

(assert (=> b!1133710 (= lt!503817 (getCurrentListMapNoExtraKeys!4508 lt!503821 lt!503823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2576 (Int (_ BitVec 64)) V!43123)

(assert (=> b!1133710 (= lt!503823 (array!73858 (store (arr!35579 _values!996) i!673 (ValueCellFull!13539 (dynLambda!2576 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36115 _values!996)))))

(declare-fun lt!503815 () ListLongMap!16011)

(assert (=> b!1133710 (= lt!503815 (getCurrentListMapNoExtraKeys!4508 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1133711 () Bool)

(assert (=> b!1133711 (= e!645212 e!645210)))

(declare-fun res!756942 () Bool)

(assert (=> b!1133711 (=> res!756942 e!645210)))

(assert (=> b!1133711 (= res!756942 (not (= (select (arr!35578 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1133711 e!645221))

(declare-fun c!110659 () Bool)

(assert (=> b!1133711 (= c!110659 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!503818 () Unit!37148)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!441 (array!73855 array!73857 (_ BitVec 32) (_ BitVec 32) V!43123 V!43123 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!37148)

(assert (=> b!1133711 (= lt!503818 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!441 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44570 () Bool)

(assert (=> mapIsEmpty!44570 mapRes!44570))

(declare-fun b!1133712 () Bool)

(declare-fun res!756945 () Bool)

(assert (=> b!1133712 (=> (not res!756945) (not e!645216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1133712 (= res!756945 (validMask!0 mask!1564))))

(declare-fun b!1133713 () Bool)

(assert (=> b!1133713 (= e!645222 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1133714 () Bool)

(assert (=> b!1133714 (= e!645213 true)))

(assert (=> b!1133714 e!645209))

(declare-fun res!756946 () Bool)

(assert (=> b!1133714 (=> (not res!756946) (not e!645209))))

(assert (=> b!1133714 (= res!756946 e!645222)))

(declare-fun c!110658 () Bool)

(assert (=> b!1133714 (= c!110658 (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!503829 () Unit!37148)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!333 (array!73855 array!73857 (_ BitVec 32) (_ BitVec 32) V!43123 V!43123 (_ BitVec 64) (_ BitVec 32) Int) Unit!37148)

(assert (=> b!1133714 (= lt!503829 (lemmaListMapContainsThenArrayContainsFrom!333 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!503819 () Unit!37148)

(assert (=> b!1133714 (= lt!503819 e!645217)))

(assert (=> b!1133714 (= c!110657 (and (not lt!503827) (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1133714 (= lt!503827 (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1133715 () Bool)

(declare-fun res!756936 () Bool)

(assert (=> b!1133715 (=> (not res!756936) (not e!645216))))

(assert (=> b!1133715 (= res!756936 (and (= (size!36115 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36114 _keys!1208) (size!36115 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!49150 () Bool)

(assert (=> bm!49150 (= call!49149 (getCurrentListMapNoExtraKeys!4508 lt!503821 lt!503823 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1133716 () Bool)

(declare-fun c!110656 () Bool)

(assert (=> b!1133716 (= c!110656 (and (not (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!503827))))

(assert (=> b!1133716 (= e!645219 e!645207)))

(declare-fun b!1133717 () Bool)

(declare-fun lt!503828 () Unit!37148)

(assert (=> b!1133717 (= e!645207 lt!503828)))

(assert (=> b!1133717 (= lt!503828 call!49151)))

(assert (=> b!1133717 call!49150))

(declare-fun b!1133718 () Bool)

(assert (=> b!1133718 (= e!645218 (and e!645220 mapRes!44570))))

(declare-fun condMapEmpty!44570 () Bool)

(declare-fun mapDefault!44570 () ValueCell!13539)

(assert (=> b!1133718 (= condMapEmpty!44570 (= (arr!35579 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13539)) mapDefault!44570)))))

(assert (= (and start!98362 res!756938) b!1133712))

(assert (= (and b!1133712 res!756945) b!1133715))

(assert (= (and b!1133715 res!756936) b!1133702))

(assert (= (and b!1133702 res!756934) b!1133708))

(assert (= (and b!1133708 res!756943) b!1133701))

(assert (= (and b!1133701 res!756940) b!1133706))

(assert (= (and b!1133706 res!756935) b!1133707))

(assert (= (and b!1133707 res!756941) b!1133692))

(assert (= (and b!1133692 res!756944) b!1133697))

(assert (= (and b!1133697 res!756937) b!1133709))

(assert (= (and b!1133709 (not res!756947)) b!1133710))

(assert (= (and b!1133710 (not res!756939)) b!1133711))

(assert (= (and b!1133711 c!110659) b!1133700))

(assert (= (and b!1133711 (not c!110659)) b!1133696))

(assert (= (or b!1133700 b!1133696) bm!49150))

(assert (= (or b!1133700 b!1133696) bm!49145))

(assert (= (and b!1133711 (not res!756942)) b!1133691))

(assert (= (and b!1133691 (not res!756933)) b!1133714))

(assert (= (and b!1133714 c!110657) b!1133698))

(assert (= (and b!1133714 (not c!110657)) b!1133695))

(assert (= (and b!1133695 c!110655) b!1133704))

(assert (= (and b!1133695 (not c!110655)) b!1133716))

(assert (= (and b!1133716 c!110656) b!1133717))

(assert (= (and b!1133716 (not c!110656)) b!1133694))

(assert (= (or b!1133704 b!1133717) bm!49148))

(assert (= (or b!1133704 b!1133717) bm!49143))

(assert (= (or b!1133704 b!1133717) bm!49147))

(assert (= (or b!1133698 bm!49147) bm!49144))

(assert (= (or b!1133698 bm!49148) bm!49149))

(assert (= (or b!1133698 bm!49143) bm!49146))

(assert (= (and b!1133714 c!110658) b!1133713))

(assert (= (and b!1133714 (not c!110658)) b!1133703))

(assert (= (and b!1133714 res!756946) b!1133699))

(assert (= (and b!1133718 condMapEmpty!44570) mapIsEmpty!44570))

(assert (= (and b!1133718 (not condMapEmpty!44570)) mapNonEmpty!44570))

(get-info :version)

(assert (= (and mapNonEmpty!44570 ((_ is ValueCellFull!13539) mapValue!44570)) b!1133693))

(assert (= (and b!1133718 ((_ is ValueCellFull!13539) mapDefault!44570)) b!1133705))

(assert (= start!98362 b!1133718))

(declare-fun b_lambda!19073 () Bool)

(assert (=> (not b_lambda!19073) (not b!1133710)))

(declare-fun t!35761 () Bool)

(declare-fun tb!8779 () Bool)

(assert (=> (and start!98362 (= defaultEntry!1004 defaultEntry!1004) t!35761) tb!8779))

(declare-fun result!18123 () Bool)

(assert (=> tb!8779 (= result!18123 tp_is_empty!28497)))

(assert (=> b!1133710 t!35761))

(declare-fun b_and!38785 () Bool)

(assert (= b_and!38783 (and (=> t!35761 result!18123) b_and!38785)))

(declare-fun m!1046699 () Bool)

(assert (=> b!1133698 m!1046699))

(declare-fun m!1046701 () Bool)

(assert (=> b!1133698 m!1046701))

(declare-fun m!1046703 () Bool)

(assert (=> b!1133698 m!1046703))

(declare-fun m!1046705 () Bool)

(assert (=> b!1133711 m!1046705))

(declare-fun m!1046707 () Bool)

(assert (=> b!1133711 m!1046707))

(declare-fun m!1046709 () Bool)

(assert (=> mapNonEmpty!44570 m!1046709))

(declare-fun m!1046711 () Bool)

(assert (=> b!1133713 m!1046711))

(declare-fun m!1046713 () Bool)

(assert (=> b!1133702 m!1046713))

(assert (=> b!1133699 m!1046711))

(declare-fun m!1046715 () Bool)

(assert (=> bm!49144 m!1046715))

(declare-fun m!1046717 () Bool)

(assert (=> b!1133692 m!1046717))

(declare-fun m!1046719 () Bool)

(assert (=> b!1133692 m!1046719))

(declare-fun m!1046721 () Bool)

(assert (=> start!98362 m!1046721))

(declare-fun m!1046723 () Bool)

(assert (=> start!98362 m!1046723))

(declare-fun m!1046725 () Bool)

(assert (=> bm!49146 m!1046725))

(declare-fun m!1046727 () Bool)

(assert (=> b!1133691 m!1046727))

(declare-fun m!1046729 () Bool)

(assert (=> b!1133691 m!1046729))

(declare-fun m!1046731 () Bool)

(assert (=> bm!49149 m!1046731))

(declare-fun m!1046733 () Bool)

(assert (=> bm!49150 m!1046733))

(declare-fun m!1046735 () Bool)

(assert (=> b!1133707 m!1046735))

(declare-fun m!1046737 () Bool)

(assert (=> b!1133700 m!1046737))

(declare-fun m!1046739 () Bool)

(assert (=> b!1133710 m!1046739))

(declare-fun m!1046741 () Bool)

(assert (=> b!1133710 m!1046741))

(declare-fun m!1046743 () Bool)

(assert (=> b!1133710 m!1046743))

(declare-fun m!1046745 () Bool)

(assert (=> b!1133710 m!1046745))

(declare-fun m!1046747 () Bool)

(assert (=> b!1133712 m!1046747))

(declare-fun m!1046749 () Bool)

(assert (=> b!1133697 m!1046749))

(assert (=> bm!49145 m!1046729))

(declare-fun m!1046751 () Bool)

(assert (=> b!1133714 m!1046751))

(declare-fun m!1046753 () Bool)

(assert (=> b!1133709 m!1046753))

(declare-fun m!1046755 () Bool)

(assert (=> b!1133709 m!1046755))

(declare-fun m!1046757 () Bool)

(assert (=> b!1133706 m!1046757))

(declare-fun m!1046759 () Bool)

(assert (=> b!1133708 m!1046759))

(check-sat b_and!38785 (not b!1133691) (not bm!49149) (not b!1133700) (not b!1133708) (not b!1133714) tp_is_empty!28497 (not b!1133697) (not b!1133706) (not b!1133709) (not b!1133710) (not b_lambda!19073) (not mapNonEmpty!44570) (not b!1133711) (not b!1133702) (not start!98362) (not bm!49144) (not b!1133712) (not b!1133699) (not b!1133713) (not bm!49146) (not b!1133698) (not b_next!23967) (not b!1133692) (not bm!49150) (not bm!49145))
(check-sat b_and!38785 (not b_next!23967))
