; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97984 () Bool)

(assert start!97984)

(declare-fun b_free!23685 () Bool)

(declare-fun b_next!23685 () Bool)

(assert (=> start!97984 (= b_free!23685 (not b_next!23685))))

(declare-fun tp!83759 () Bool)

(declare-fun b_and!38153 () Bool)

(assert (=> start!97984 (= tp!83759 b_and!38153)))

(declare-datatypes ((V!42747 0))(
  ( (V!42748 (val!14164 Int)) )
))
(declare-fun zeroValue!944 () V!42747)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!47334 () Bool)

(declare-datatypes ((tuple2!17786 0))(
  ( (tuple2!17787 (_1!8904 (_ BitVec 64)) (_2!8904 V!42747)) )
))
(declare-datatypes ((List!24565 0))(
  ( (Nil!24562) (Cons!24561 (h!25770 tuple2!17786) (t!35242 List!24565)) )
))
(declare-datatypes ((ListLongMap!15755 0))(
  ( (ListLongMap!15756 (toList!7893 List!24565)) )
))
(declare-fun call!47337 () ListLongMap!15755)

(declare-datatypes ((ValueCell!13398 0))(
  ( (ValueCellFull!13398 (v!16797 V!42747)) (EmptyCell!13398) )
))
(declare-datatypes ((array!73299 0))(
  ( (array!73300 (arr!35302 (Array (_ BitVec 32) ValueCell!13398)) (size!35838 (_ BitVec 32))) )
))
(declare-fun lt!499137 () array!73299)

(declare-fun minValue!944 () V!42747)

(declare-datatypes ((array!73301 0))(
  ( (array!73302 (arr!35303 (Array (_ BitVec 32) (_ BitVec 64))) (size!35839 (_ BitVec 32))) )
))
(declare-fun lt!499135 () array!73301)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4381 (array!73301 array!73299 (_ BitVec 32) (_ BitVec 32) V!42747 V!42747 (_ BitVec 32) Int) ListLongMap!15755)

(assert (=> bm!47334 (= call!47337 (getCurrentListMapNoExtraKeys!4381 lt!499135 lt!499137 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!750684 () Bool)

(declare-fun e!639648 () Bool)

(assert (=> start!97984 (=> (not res!750684) (not e!639648))))

(declare-fun _keys!1208 () array!73301)

(assert (=> start!97984 (= res!750684 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35839 _keys!1208))))))

(assert (=> start!97984 e!639648))

(declare-fun tp_is_empty!28215 () Bool)

(assert (=> start!97984 tp_is_empty!28215))

(declare-fun array_inv!27102 (array!73301) Bool)

(assert (=> start!97984 (array_inv!27102 _keys!1208)))

(assert (=> start!97984 true))

(assert (=> start!97984 tp!83759))

(declare-fun _values!996 () array!73299)

(declare-fun e!639651 () Bool)

(declare-fun array_inv!27103 (array!73299) Bool)

(assert (=> start!97984 (and (array_inv!27103 _values!996) e!639651)))

(declare-fun b!1123590 () Bool)

(declare-fun res!750679 () Bool)

(assert (=> b!1123590 (=> (not res!750679) (not e!639648))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123590 (= res!750679 (validMask!0 mask!1564))))

(declare-fun b!1123591 () Bool)

(declare-fun e!639654 () Bool)

(assert (=> b!1123591 (= e!639654 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun lt!499138 () Bool)

(declare-fun contains!6433 (ListLongMap!15755 (_ BitVec 64)) Bool)

(assert (=> b!1123591 (= lt!499138 (contains!6433 (getCurrentListMapNoExtraKeys!4381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1123592 () Bool)

(declare-fun res!750681 () Bool)

(assert (=> b!1123592 (=> (not res!750681) (not e!639648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73301 (_ BitVec 32)) Bool)

(assert (=> b!1123592 (= res!750681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123593 () Bool)

(declare-fun res!750691 () Bool)

(assert (=> b!1123593 (=> (not res!750691) (not e!639648))))

(declare-datatypes ((List!24566 0))(
  ( (Nil!24563) (Cons!24562 (h!25771 (_ BitVec 64)) (t!35243 List!24566)) )
))
(declare-fun arrayNoDuplicates!0 (array!73301 (_ BitVec 32) List!24566) Bool)

(assert (=> b!1123593 (= res!750691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24563))))

(declare-fun mapIsEmpty!44140 () Bool)

(declare-fun mapRes!44140 () Bool)

(assert (=> mapIsEmpty!44140 mapRes!44140))

(declare-fun mapNonEmpty!44140 () Bool)

(declare-fun tp!83758 () Bool)

(declare-fun e!639655 () Bool)

(assert (=> mapNonEmpty!44140 (= mapRes!44140 (and tp!83758 e!639655))))

(declare-fun mapRest!44140 () (Array (_ BitVec 32) ValueCell!13398))

(declare-fun mapValue!44140 () ValueCell!13398)

(declare-fun mapKey!44140 () (_ BitVec 32))

(assert (=> mapNonEmpty!44140 (= (arr!35302 _values!996) (store mapRest!44140 mapKey!44140 mapValue!44140))))

(declare-fun call!47338 () ListLongMap!15755)

(declare-fun e!639652 () Bool)

(declare-fun b!1123594 () Bool)

(declare-fun -!1098 (ListLongMap!15755 (_ BitVec 64)) ListLongMap!15755)

(assert (=> b!1123594 (= e!639652 (= call!47337 (-!1098 call!47338 k0!934)))))

(declare-fun b!1123595 () Bool)

(declare-fun res!750688 () Bool)

(assert (=> b!1123595 (=> (not res!750688) (not e!639648))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123595 (= res!750688 (validKeyInArray!0 k0!934))))

(declare-fun bm!47335 () Bool)

(assert (=> bm!47335 (= call!47338 (getCurrentListMapNoExtraKeys!4381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123596 () Bool)

(assert (=> b!1123596 (= e!639655 tp_is_empty!28215)))

(declare-fun b!1123597 () Bool)

(declare-fun e!639649 () Bool)

(declare-fun e!639657 () Bool)

(assert (=> b!1123597 (= e!639649 e!639657)))

(declare-fun res!750680 () Bool)

(assert (=> b!1123597 (=> res!750680 e!639657)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123597 (= res!750680 (not (= from!1455 i!673)))))

(declare-fun lt!499139 () ListLongMap!15755)

(assert (=> b!1123597 (= lt!499139 (getCurrentListMapNoExtraKeys!4381 lt!499135 lt!499137 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2477 (Int (_ BitVec 64)) V!42747)

(assert (=> b!1123597 (= lt!499137 (array!73300 (store (arr!35302 _values!996) i!673 (ValueCellFull!13398 (dynLambda!2477 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35838 _values!996)))))

(declare-fun lt!499133 () ListLongMap!15755)

(assert (=> b!1123597 (= lt!499133 (getCurrentListMapNoExtraKeys!4381 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123598 () Bool)

(declare-fun e!639656 () Bool)

(assert (=> b!1123598 (= e!639648 e!639656)))

(declare-fun res!750689 () Bool)

(assert (=> b!1123598 (=> (not res!750689) (not e!639656))))

(assert (=> b!1123598 (= res!750689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499135 mask!1564))))

(assert (=> b!1123598 (= lt!499135 (array!73302 (store (arr!35303 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35839 _keys!1208)))))

(declare-fun b!1123599 () Bool)

(declare-fun res!750687 () Bool)

(assert (=> b!1123599 (=> (not res!750687) (not e!639648))))

(assert (=> b!1123599 (= res!750687 (and (= (size!35838 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35839 _keys!1208) (size!35838 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1123600 () Bool)

(declare-fun res!750685 () Bool)

(assert (=> b!1123600 (=> (not res!750685) (not e!639648))))

(assert (=> b!1123600 (= res!750685 (= (select (arr!35303 _keys!1208) i!673) k0!934))))

(declare-fun b!1123601 () Bool)

(declare-fun e!639653 () Bool)

(assert (=> b!1123601 (= e!639651 (and e!639653 mapRes!44140))))

(declare-fun condMapEmpty!44140 () Bool)

(declare-fun mapDefault!44140 () ValueCell!13398)

(assert (=> b!1123601 (= condMapEmpty!44140 (= (arr!35302 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13398)) mapDefault!44140)))))

(declare-fun b!1123602 () Bool)

(assert (=> b!1123602 (= e!639652 (= call!47337 call!47338))))

(declare-fun b!1123603 () Bool)

(declare-fun res!750690 () Bool)

(assert (=> b!1123603 (=> (not res!750690) (not e!639656))))

(assert (=> b!1123603 (= res!750690 (arrayNoDuplicates!0 lt!499135 #b00000000000000000000000000000000 Nil!24563))))

(declare-fun b!1123604 () Bool)

(assert (=> b!1123604 (= e!639656 (not e!639649))))

(declare-fun res!750682 () Bool)

(assert (=> b!1123604 (=> res!750682 e!639649)))

(assert (=> b!1123604 (= res!750682 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123604 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36842 0))(
  ( (Unit!36843) )
))
(declare-fun lt!499136 () Unit!36842)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73301 (_ BitVec 64) (_ BitVec 32)) Unit!36842)

(assert (=> b!1123604 (= lt!499136 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123605 () Bool)

(assert (=> b!1123605 (= e!639653 tp_is_empty!28215)))

(declare-fun b!1123606 () Bool)

(assert (=> b!1123606 (= e!639657 e!639654)))

(declare-fun res!750683 () Bool)

(assert (=> b!1123606 (=> res!750683 e!639654)))

(assert (=> b!1123606 (= res!750683 (not (= (select (arr!35303 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1123606 e!639652))

(declare-fun c!109518 () Bool)

(assert (=> b!1123606 (= c!109518 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!499134 () Unit!36842)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!346 (array!73301 array!73299 (_ BitVec 32) (_ BitVec 32) V!42747 V!42747 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36842)

(assert (=> b!1123606 (= lt!499134 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123607 () Bool)

(declare-fun res!750686 () Bool)

(assert (=> b!1123607 (=> (not res!750686) (not e!639648))))

(assert (=> b!1123607 (= res!750686 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35839 _keys!1208))))))

(assert (= (and start!97984 res!750684) b!1123590))

(assert (= (and b!1123590 res!750679) b!1123599))

(assert (= (and b!1123599 res!750687) b!1123592))

(assert (= (and b!1123592 res!750681) b!1123593))

(assert (= (and b!1123593 res!750691) b!1123607))

(assert (= (and b!1123607 res!750686) b!1123595))

(assert (= (and b!1123595 res!750688) b!1123600))

(assert (= (and b!1123600 res!750685) b!1123598))

(assert (= (and b!1123598 res!750689) b!1123603))

(assert (= (and b!1123603 res!750690) b!1123604))

(assert (= (and b!1123604 (not res!750682)) b!1123597))

(assert (= (and b!1123597 (not res!750680)) b!1123606))

(assert (= (and b!1123606 c!109518) b!1123594))

(assert (= (and b!1123606 (not c!109518)) b!1123602))

(assert (= (or b!1123594 b!1123602) bm!47334))

(assert (= (or b!1123594 b!1123602) bm!47335))

(assert (= (and b!1123606 (not res!750683)) b!1123591))

(assert (= (and b!1123601 condMapEmpty!44140) mapIsEmpty!44140))

(assert (= (and b!1123601 (not condMapEmpty!44140)) mapNonEmpty!44140))

(get-info :version)

(assert (= (and mapNonEmpty!44140 ((_ is ValueCellFull!13398) mapValue!44140)) b!1123596))

(assert (= (and b!1123601 ((_ is ValueCellFull!13398) mapDefault!44140)) b!1123605))

(assert (= start!97984 b!1123601))

(declare-fun b_lambda!18655 () Bool)

(assert (=> (not b_lambda!18655) (not b!1123597)))

(declare-fun t!35241 () Bool)

(declare-fun tb!8497 () Bool)

(assert (=> (and start!97984 (= defaultEntry!1004 defaultEntry!1004) t!35241) tb!8497))

(declare-fun result!17555 () Bool)

(assert (=> tb!8497 (= result!17555 tp_is_empty!28215)))

(assert (=> b!1123597 t!35241))

(declare-fun b_and!38155 () Bool)

(assert (= b_and!38153 (and (=> t!35241 result!17555) b_and!38155)))

(declare-fun m!1038029 () Bool)

(assert (=> b!1123593 m!1038029))

(declare-fun m!1038031 () Bool)

(assert (=> b!1123598 m!1038031))

(declare-fun m!1038033 () Bool)

(assert (=> b!1123598 m!1038033))

(declare-fun m!1038035 () Bool)

(assert (=> b!1123592 m!1038035))

(declare-fun m!1038037 () Bool)

(assert (=> b!1123603 m!1038037))

(declare-fun m!1038039 () Bool)

(assert (=> mapNonEmpty!44140 m!1038039))

(declare-fun m!1038041 () Bool)

(assert (=> b!1123595 m!1038041))

(declare-fun m!1038043 () Bool)

(assert (=> b!1123590 m!1038043))

(declare-fun m!1038045 () Bool)

(assert (=> b!1123606 m!1038045))

(declare-fun m!1038047 () Bool)

(assert (=> b!1123606 m!1038047))

(declare-fun m!1038049 () Bool)

(assert (=> b!1123600 m!1038049))

(declare-fun m!1038051 () Bool)

(assert (=> b!1123604 m!1038051))

(declare-fun m!1038053 () Bool)

(assert (=> b!1123604 m!1038053))

(declare-fun m!1038055 () Bool)

(assert (=> b!1123591 m!1038055))

(assert (=> b!1123591 m!1038055))

(declare-fun m!1038057 () Bool)

(assert (=> b!1123591 m!1038057))

(assert (=> bm!47335 m!1038055))

(declare-fun m!1038059 () Bool)

(assert (=> bm!47334 m!1038059))

(declare-fun m!1038061 () Bool)

(assert (=> start!97984 m!1038061))

(declare-fun m!1038063 () Bool)

(assert (=> start!97984 m!1038063))

(declare-fun m!1038065 () Bool)

(assert (=> b!1123594 m!1038065))

(declare-fun m!1038067 () Bool)

(assert (=> b!1123597 m!1038067))

(declare-fun m!1038069 () Bool)

(assert (=> b!1123597 m!1038069))

(declare-fun m!1038071 () Bool)

(assert (=> b!1123597 m!1038071))

(declare-fun m!1038073 () Bool)

(assert (=> b!1123597 m!1038073))

(check-sat (not b!1123597) (not b!1123594) tp_is_empty!28215 (not b!1123590) (not bm!47335) (not b!1123592) (not b!1123604) (not bm!47334) (not b_next!23685) (not b!1123606) (not b!1123603) (not b_lambda!18655) (not start!97984) (not b!1123595) (not b!1123591) (not b!1123598) (not b!1123593) b_and!38155 (not mapNonEmpty!44140))
(check-sat b_and!38155 (not b_next!23685))
