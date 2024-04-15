; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101470 () Bool)

(assert start!101470)

(declare-fun b_free!26293 () Bool)

(declare-fun b_next!26293 () Bool)

(assert (=> start!101470 (= b_free!26293 (not b_next!26293))))

(declare-fun tp!91913 () Bool)

(declare-fun b_and!43757 () Bool)

(assert (=> start!101470 (= tp!91913 b_and!43757)))

(declare-fun b!1219732 () Bool)

(declare-fun e!692570 () Bool)

(declare-fun tp_is_empty!30997 () Bool)

(assert (=> b!1219732 (= e!692570 tp_is_empty!30997)))

(declare-fun b!1219733 () Bool)

(declare-fun res!810195 () Bool)

(declare-fun e!692565 () Bool)

(assert (=> b!1219733 (=> (not res!810195) (not e!692565))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1219733 (= res!810195 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!48382 () Bool)

(declare-fun mapRes!48382 () Bool)

(declare-fun tp!91912 () Bool)

(assert (=> mapNonEmpty!48382 (= mapRes!48382 (and tp!91912 e!692570))))

(declare-datatypes ((V!46457 0))(
  ( (V!46458 (val!15555 Int)) )
))
(declare-datatypes ((ValueCell!14789 0))(
  ( (ValueCellFull!14789 (v!18211 V!46457)) (EmptyCell!14789) )
))
(declare-fun mapValue!48382 () ValueCell!14789)

(declare-fun mapKey!48382 () (_ BitVec 32))

(declare-datatypes ((array!78692 0))(
  ( (array!78693 (arr!37977 (Array (_ BitVec 32) ValueCell!14789)) (size!38515 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78692)

(declare-fun mapRest!48382 () (Array (_ BitVec 32) ValueCell!14789))

(assert (=> mapNonEmpty!48382 (= (arr!37977 _values!996) (store mapRest!48382 mapKey!48382 mapValue!48382))))

(declare-fun b!1219734 () Bool)

(declare-fun e!692572 () Bool)

(declare-fun e!692575 () Bool)

(assert (=> b!1219734 (= e!692572 e!692575)))

(declare-fun res!810203 () Bool)

(assert (=> b!1219734 (=> res!810203 e!692575)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1219734 (= res!810203 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46457)

(declare-fun lt!554479 () array!78692)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!78694 0))(
  ( (array!78695 (arr!37978 (Array (_ BitVec 32) (_ BitVec 64))) (size!38516 (_ BitVec 32))) )
))
(declare-fun lt!554475 () array!78694)

(declare-datatypes ((tuple2!20102 0))(
  ( (tuple2!20103 (_1!10062 (_ BitVec 64)) (_2!10062 V!46457)) )
))
(declare-datatypes ((List!26883 0))(
  ( (Nil!26880) (Cons!26879 (h!28088 tuple2!20102) (t!40147 List!26883)) )
))
(declare-datatypes ((ListLongMap!18071 0))(
  ( (ListLongMap!18072 (toList!9051 List!26883)) )
))
(declare-fun lt!554478 () ListLongMap!18071)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46457)

(declare-fun getCurrentListMapNoExtraKeys!5488 (array!78694 array!78692 (_ BitVec 32) (_ BitVec 32) V!46457 V!46457 (_ BitVec 32) Int) ListLongMap!18071)

(assert (=> b!1219734 (= lt!554478 (getCurrentListMapNoExtraKeys!5488 lt!554475 lt!554479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!554482 () V!46457)

(assert (=> b!1219734 (= lt!554479 (array!78693 (store (arr!37977 _values!996) i!673 (ValueCellFull!14789 lt!554482)) (size!38515 _values!996)))))

(declare-fun dynLambda!3338 (Int (_ BitVec 64)) V!46457)

(assert (=> b!1219734 (= lt!554482 (dynLambda!3338 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun _keys!1208 () array!78694)

(declare-fun lt!554474 () ListLongMap!18071)

(assert (=> b!1219734 (= lt!554474 (getCurrentListMapNoExtraKeys!5488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!810196 () Bool)

(assert (=> start!101470 (=> (not res!810196) (not e!692565))))

(assert (=> start!101470 (= res!810196 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38516 _keys!1208))))))

(assert (=> start!101470 e!692565))

(assert (=> start!101470 tp_is_empty!30997))

(declare-fun array_inv!29024 (array!78694) Bool)

(assert (=> start!101470 (array_inv!29024 _keys!1208)))

(assert (=> start!101470 true))

(assert (=> start!101470 tp!91913))

(declare-fun e!692573 () Bool)

(declare-fun array_inv!29025 (array!78692) Bool)

(assert (=> start!101470 (and (array_inv!29025 _values!996) e!692573)))

(declare-fun b!1219735 () Bool)

(declare-fun e!692564 () Bool)

(declare-fun arrayContainsKey!0 (array!78694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1219735 (= e!692564 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219736 () Bool)

(declare-fun e!692567 () Bool)

(declare-fun e!692568 () Bool)

(assert (=> b!1219736 (= e!692567 e!692568)))

(declare-fun res!810197 () Bool)

(assert (=> b!1219736 (=> res!810197 e!692568)))

(assert (=> b!1219736 (= res!810197 (not (= (select (arr!37978 _keys!1208) from!1455) k0!934)))))

(declare-fun e!692571 () Bool)

(assert (=> b!1219736 e!692571))

(declare-fun res!810194 () Bool)

(assert (=> b!1219736 (=> (not res!810194) (not e!692571))))

(declare-fun lt!554481 () ListLongMap!18071)

(declare-fun +!4118 (ListLongMap!18071 tuple2!20102) ListLongMap!18071)

(declare-fun get!19383 (ValueCell!14789 V!46457) V!46457)

(assert (=> b!1219736 (= res!810194 (= lt!554478 (+!4118 lt!554481 (tuple2!20103 (select (arr!37978 _keys!1208) from!1455) (get!19383 (select (arr!37977 _values!996) from!1455) lt!554482)))))))

(declare-fun b!1219737 () Bool)

(assert (=> b!1219737 (= e!692571 e!692564)))

(declare-fun res!810193 () Bool)

(assert (=> b!1219737 (=> res!810193 e!692564)))

(assert (=> b!1219737 (= res!810193 (not (= (select (arr!37978 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1219738 () Bool)

(declare-fun e!692569 () Bool)

(assert (=> b!1219738 (= e!692565 e!692569)))

(declare-fun res!810191 () Bool)

(assert (=> b!1219738 (=> (not res!810191) (not e!692569))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78694 (_ BitVec 32)) Bool)

(assert (=> b!1219738 (= res!810191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!554475 mask!1564))))

(assert (=> b!1219738 (= lt!554475 (array!78695 (store (arr!37978 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38516 _keys!1208)))))

(declare-fun b!1219739 () Bool)

(assert (=> b!1219739 (= e!692569 (not e!692572))))

(declare-fun res!810200 () Bool)

(assert (=> b!1219739 (=> res!810200 e!692572)))

(assert (=> b!1219739 (= res!810200 (bvsgt from!1455 i!673))))

(assert (=> b!1219739 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40275 0))(
  ( (Unit!40276) )
))
(declare-fun lt!554476 () Unit!40275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78694 (_ BitVec 64) (_ BitVec 32)) Unit!40275)

(assert (=> b!1219739 (= lt!554476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1219740 () Bool)

(declare-fun e!692574 () Bool)

(assert (=> b!1219740 (= e!692573 (and e!692574 mapRes!48382))))

(declare-fun condMapEmpty!48382 () Bool)

(declare-fun mapDefault!48382 () ValueCell!14789)

(assert (=> b!1219740 (= condMapEmpty!48382 (= (arr!37977 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14789)) mapDefault!48382)))))

(declare-fun b!1219741 () Bool)

(declare-fun res!810198 () Bool)

(assert (=> b!1219741 (=> (not res!810198) (not e!692565))))

(assert (=> b!1219741 (= res!810198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1219742 () Bool)

(assert (=> b!1219742 (= e!692575 e!692567)))

(declare-fun res!810201 () Bool)

(assert (=> b!1219742 (=> res!810201 e!692567)))

(assert (=> b!1219742 (= res!810201 (not (validKeyInArray!0 (select (arr!37978 _keys!1208) from!1455))))))

(declare-fun lt!554483 () ListLongMap!18071)

(assert (=> b!1219742 (= lt!554483 lt!554481)))

(declare-fun lt!554477 () ListLongMap!18071)

(declare-fun -!1882 (ListLongMap!18071 (_ BitVec 64)) ListLongMap!18071)

(assert (=> b!1219742 (= lt!554481 (-!1882 lt!554477 k0!934))))

(assert (=> b!1219742 (= lt!554483 (getCurrentListMapNoExtraKeys!5488 lt!554475 lt!554479 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1219742 (= lt!554477 (getCurrentListMapNoExtraKeys!5488 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!554480 () Unit!40275)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1117 (array!78694 array!78692 (_ BitVec 32) (_ BitVec 32) V!46457 V!46457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40275)

(assert (=> b!1219742 (= lt!554480 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1117 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1219743 () Bool)

(declare-fun res!810192 () Bool)

(assert (=> b!1219743 (=> (not res!810192) (not e!692569))))

(declare-datatypes ((List!26884 0))(
  ( (Nil!26881) (Cons!26880 (h!28089 (_ BitVec 64)) (t!40148 List!26884)) )
))
(declare-fun arrayNoDuplicates!0 (array!78694 (_ BitVec 32) List!26884) Bool)

(assert (=> b!1219743 (= res!810192 (arrayNoDuplicates!0 lt!554475 #b00000000000000000000000000000000 Nil!26881))))

(declare-fun b!1219744 () Bool)

(declare-fun res!810189 () Bool)

(assert (=> b!1219744 (=> (not res!810189) (not e!692565))))

(assert (=> b!1219744 (= res!810189 (and (= (size!38515 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38516 _keys!1208) (size!38515 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1219745 () Bool)

(declare-fun res!810202 () Bool)

(assert (=> b!1219745 (=> (not res!810202) (not e!692565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1219745 (= res!810202 (validMask!0 mask!1564))))

(declare-fun b!1219746 () Bool)

(assert (=> b!1219746 (= e!692574 tp_is_empty!30997)))

(declare-fun b!1219747 () Bool)

(declare-fun res!810199 () Bool)

(assert (=> b!1219747 (=> (not res!810199) (not e!692565))))

(assert (=> b!1219747 (= res!810199 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38516 _keys!1208))))))

(declare-fun mapIsEmpty!48382 () Bool)

(assert (=> mapIsEmpty!48382 mapRes!48382))

(declare-fun b!1219748 () Bool)

(declare-fun res!810188 () Bool)

(assert (=> b!1219748 (=> (not res!810188) (not e!692565))))

(assert (=> b!1219748 (= res!810188 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26881))))

(declare-fun b!1219749 () Bool)

(assert (=> b!1219749 (= e!692568 true)))

(assert (=> b!1219749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!554473 () Unit!40275)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78694 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40275)

(assert (=> b!1219749 (= lt!554473 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1219750 () Bool)

(declare-fun res!810190 () Bool)

(assert (=> b!1219750 (=> (not res!810190) (not e!692565))))

(assert (=> b!1219750 (= res!810190 (= (select (arr!37978 _keys!1208) i!673) k0!934))))

(assert (= (and start!101470 res!810196) b!1219745))

(assert (= (and b!1219745 res!810202) b!1219744))

(assert (= (and b!1219744 res!810189) b!1219741))

(assert (= (and b!1219741 res!810198) b!1219748))

(assert (= (and b!1219748 res!810188) b!1219747))

(assert (= (and b!1219747 res!810199) b!1219733))

(assert (= (and b!1219733 res!810195) b!1219750))

(assert (= (and b!1219750 res!810190) b!1219738))

(assert (= (and b!1219738 res!810191) b!1219743))

(assert (= (and b!1219743 res!810192) b!1219739))

(assert (= (and b!1219739 (not res!810200)) b!1219734))

(assert (= (and b!1219734 (not res!810203)) b!1219742))

(assert (= (and b!1219742 (not res!810201)) b!1219736))

(assert (= (and b!1219736 res!810194) b!1219737))

(assert (= (and b!1219737 (not res!810193)) b!1219735))

(assert (= (and b!1219736 (not res!810197)) b!1219749))

(assert (= (and b!1219740 condMapEmpty!48382) mapIsEmpty!48382))

(assert (= (and b!1219740 (not condMapEmpty!48382)) mapNonEmpty!48382))

(get-info :version)

(assert (= (and mapNonEmpty!48382 ((_ is ValueCellFull!14789) mapValue!48382)) b!1219732))

(assert (= (and b!1219740 ((_ is ValueCellFull!14789) mapDefault!48382)) b!1219746))

(assert (= start!101470 b!1219740))

(declare-fun b_lambda!22111 () Bool)

(assert (=> (not b_lambda!22111) (not b!1219734)))

(declare-fun t!40146 () Bool)

(declare-fun tb!11085 () Bool)

(assert (=> (and start!101470 (= defaultEntry!1004 defaultEntry!1004) t!40146) tb!11085))

(declare-fun result!22783 () Bool)

(assert (=> tb!11085 (= result!22783 tp_is_empty!30997)))

(assert (=> b!1219734 t!40146))

(declare-fun b_and!43759 () Bool)

(assert (= b_and!43757 (and (=> t!40146 result!22783) b_and!43759)))

(declare-fun m!1124051 () Bool)

(assert (=> b!1219733 m!1124051))

(declare-fun m!1124053 () Bool)

(assert (=> b!1219736 m!1124053))

(declare-fun m!1124055 () Bool)

(assert (=> b!1219736 m!1124055))

(assert (=> b!1219736 m!1124055))

(declare-fun m!1124057 () Bool)

(assert (=> b!1219736 m!1124057))

(declare-fun m!1124059 () Bool)

(assert (=> b!1219736 m!1124059))

(declare-fun m!1124061 () Bool)

(assert (=> b!1219734 m!1124061))

(declare-fun m!1124063 () Bool)

(assert (=> b!1219734 m!1124063))

(declare-fun m!1124065 () Bool)

(assert (=> b!1219734 m!1124065))

(declare-fun m!1124067 () Bool)

(assert (=> b!1219734 m!1124067))

(declare-fun m!1124069 () Bool)

(assert (=> b!1219749 m!1124069))

(declare-fun m!1124071 () Bool)

(assert (=> b!1219749 m!1124071))

(declare-fun m!1124073 () Bool)

(assert (=> b!1219750 m!1124073))

(declare-fun m!1124075 () Bool)

(assert (=> b!1219748 m!1124075))

(declare-fun m!1124077 () Bool)

(assert (=> b!1219745 m!1124077))

(declare-fun m!1124079 () Bool)

(assert (=> b!1219735 m!1124079))

(assert (=> b!1219737 m!1124053))

(declare-fun m!1124081 () Bool)

(assert (=> b!1219743 m!1124081))

(declare-fun m!1124083 () Bool)

(assert (=> b!1219739 m!1124083))

(declare-fun m!1124085 () Bool)

(assert (=> b!1219739 m!1124085))

(declare-fun m!1124087 () Bool)

(assert (=> b!1219738 m!1124087))

(declare-fun m!1124089 () Bool)

(assert (=> b!1219738 m!1124089))

(declare-fun m!1124091 () Bool)

(assert (=> b!1219741 m!1124091))

(declare-fun m!1124093 () Bool)

(assert (=> start!101470 m!1124093))

(declare-fun m!1124095 () Bool)

(assert (=> start!101470 m!1124095))

(declare-fun m!1124097 () Bool)

(assert (=> b!1219742 m!1124097))

(declare-fun m!1124099 () Bool)

(assert (=> b!1219742 m!1124099))

(declare-fun m!1124101 () Bool)

(assert (=> b!1219742 m!1124101))

(declare-fun m!1124103 () Bool)

(assert (=> b!1219742 m!1124103))

(assert (=> b!1219742 m!1124053))

(declare-fun m!1124105 () Bool)

(assert (=> b!1219742 m!1124105))

(assert (=> b!1219742 m!1124053))

(declare-fun m!1124107 () Bool)

(assert (=> mapNonEmpty!48382 m!1124107))

(check-sat b_and!43759 (not start!101470) (not b!1219742) (not b!1219736) (not b!1219734) (not b!1219749) (not b!1219733) (not mapNonEmpty!48382) (not b!1219745) tp_is_empty!30997 (not b!1219743) (not b!1219735) (not b_next!26293) (not b!1219741) (not b!1219739) (not b!1219748) (not b!1219738) (not b_lambda!22111))
(check-sat b_and!43759 (not b_next!26293))
