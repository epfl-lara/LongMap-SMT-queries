; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99852 () Bool)

(assert start!99852)

(declare-fun b_free!25195 () Bool)

(declare-fun b_next!25195 () Bool)

(assert (=> start!99852 (= b_free!25195 (not b_next!25195))))

(declare-fun tp!88299 () Bool)

(declare-fun b_and!41259 () Bool)

(assert (=> start!99852 (= tp!88299 b_and!41259)))

(declare-fun b!1181498 () Bool)

(declare-fun res!784684 () Bool)

(declare-fun e!671815 () Bool)

(assert (=> b!1181498 (=> (not res!784684) (not e!671815))))

(declare-datatypes ((array!76303 0))(
  ( (array!76304 (arr!36795 (Array (_ BitVec 32) (_ BitVec 64))) (size!37332 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76303)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44761 0))(
  ( (V!44762 (val!14919 Int)) )
))
(declare-datatypes ((ValueCell!14153 0))(
  ( (ValueCellFull!14153 (v!17553 V!44761)) (EmptyCell!14153) )
))
(declare-datatypes ((array!76305 0))(
  ( (array!76306 (arr!36796 (Array (_ BitVec 32) ValueCell!14153)) (size!37333 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76305)

(assert (=> b!1181498 (= res!784684 (and (= (size!37333 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37332 _keys!1208) (size!37333 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181499 () Bool)

(declare-fun e!671810 () Bool)

(declare-fun e!671813 () Bool)

(assert (=> b!1181499 (= e!671810 e!671813)))

(declare-fun res!784677 () Bool)

(assert (=> b!1181499 (=> res!784677 e!671813)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181499 (= res!784677 (not (validKeyInArray!0 (select (arr!36795 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19152 0))(
  ( (tuple2!19153 (_1!9587 (_ BitVec 64)) (_2!9587 V!44761)) )
))
(declare-datatypes ((List!25882 0))(
  ( (Nil!25879) (Cons!25878 (h!27096 tuple2!19152) (t!38061 List!25882)) )
))
(declare-datatypes ((ListLongMap!17129 0))(
  ( (ListLongMap!17130 (toList!8580 List!25882)) )
))
(declare-fun lt!534045 () ListLongMap!17129)

(declare-fun lt!534039 () ListLongMap!17129)

(assert (=> b!1181499 (= lt!534045 lt!534039)))

(declare-fun lt!534046 () ListLongMap!17129)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1609 (ListLongMap!17129 (_ BitVec 64)) ListLongMap!17129)

(assert (=> b!1181499 (= lt!534039 (-!1609 lt!534046 k0!934))))

(declare-fun zeroValue!944 () V!44761)

(declare-fun lt!534050 () array!76305)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44761)

(declare-fun lt!534048 () array!76303)

(declare-fun getCurrentListMapNoExtraKeys!5058 (array!76303 array!76305 (_ BitVec 32) (_ BitVec 32) V!44761 V!44761 (_ BitVec 32) Int) ListLongMap!17129)

(assert (=> b!1181499 (= lt!534045 (getCurrentListMapNoExtraKeys!5058 lt!534048 lt!534050 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181499 (= lt!534046 (getCurrentListMapNoExtraKeys!5058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39013 0))(
  ( (Unit!39014) )
))
(declare-fun lt!534049 () Unit!39013)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!834 (array!76303 array!76305 (_ BitVec 32) (_ BitVec 32) V!44761 V!44761 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39013)

(assert (=> b!1181499 (= lt!534049 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!834 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181500 () Bool)

(assert (=> b!1181500 (= e!671813 true)))

(declare-fun e!671811 () Bool)

(assert (=> b!1181500 e!671811))

(declare-fun res!784679 () Bool)

(assert (=> b!1181500 (=> (not res!784679) (not e!671811))))

(assert (=> b!1181500 (= res!784679 (not (= (select (arr!36795 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534041 () Unit!39013)

(declare-fun e!671818 () Unit!39013)

(assert (=> b!1181500 (= lt!534041 e!671818)))

(declare-fun c!117314 () Bool)

(assert (=> b!1181500 (= c!117314 (= (select (arr!36795 _keys!1208) from!1455) k0!934))))

(declare-fun e!671814 () Bool)

(assert (=> b!1181500 e!671814))

(declare-fun res!784685 () Bool)

(assert (=> b!1181500 (=> (not res!784685) (not e!671814))))

(declare-fun lt!534052 () tuple2!19152)

(declare-fun lt!534044 () ListLongMap!17129)

(declare-fun +!3903 (ListLongMap!17129 tuple2!19152) ListLongMap!17129)

(assert (=> b!1181500 (= res!784685 (= lt!534044 (+!3903 lt!534039 lt!534052)))))

(declare-fun lt!534042 () V!44761)

(declare-fun get!18847 (ValueCell!14153 V!44761) V!44761)

(assert (=> b!1181500 (= lt!534052 (tuple2!19153 (select (arr!36795 _keys!1208) from!1455) (get!18847 (select (arr!36796 _values!996) from!1455) lt!534042)))))

(declare-fun b!1181501 () Bool)

(declare-fun e!671822 () Bool)

(declare-fun e!671820 () Bool)

(assert (=> b!1181501 (= e!671822 (not e!671820))))

(declare-fun res!784678 () Bool)

(assert (=> b!1181501 (=> res!784678 e!671820)))

(assert (=> b!1181501 (= res!784678 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181501 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534051 () Unit!39013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76303 (_ BitVec 64) (_ BitVec 32)) Unit!39013)

(assert (=> b!1181501 (= lt!534051 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!784687 () Bool)

(assert (=> start!99852 (=> (not res!784687) (not e!671815))))

(assert (=> start!99852 (= res!784687 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37332 _keys!1208))))))

(assert (=> start!99852 e!671815))

(declare-fun tp_is_empty!29725 () Bool)

(assert (=> start!99852 tp_is_empty!29725))

(declare-fun array_inv!28174 (array!76303) Bool)

(assert (=> start!99852 (array_inv!28174 _keys!1208)))

(assert (=> start!99852 true))

(assert (=> start!99852 tp!88299))

(declare-fun e!671817 () Bool)

(declare-fun array_inv!28175 (array!76305) Bool)

(assert (=> start!99852 (and (array_inv!28175 _values!996) e!671817)))

(declare-fun b!1181502 () Bool)

(assert (=> b!1181502 (= e!671811 (= lt!534039 lt!534045))))

(declare-fun mapIsEmpty!46415 () Bool)

(declare-fun mapRes!46415 () Bool)

(assert (=> mapIsEmpty!46415 mapRes!46415))

(declare-fun b!1181503 () Bool)

(declare-fun res!784690 () Bool)

(assert (=> b!1181503 (=> (not res!784690) (not e!671815))))

(assert (=> b!1181503 (= res!784690 (validKeyInArray!0 k0!934))))

(declare-fun e!671821 () Bool)

(declare-fun b!1181504 () Bool)

(assert (=> b!1181504 (= e!671821 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181505 () Bool)

(assert (=> b!1181505 (= e!671820 e!671810)))

(declare-fun res!784676 () Bool)

(assert (=> b!1181505 (=> res!784676 e!671810)))

(assert (=> b!1181505 (= res!784676 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1181505 (= lt!534044 (getCurrentListMapNoExtraKeys!5058 lt!534048 lt!534050 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1181505 (= lt!534050 (array!76306 (store (arr!36796 _values!996) i!673 (ValueCellFull!14153 lt!534042)) (size!37333 _values!996)))))

(declare-fun dynLambda!3025 (Int (_ BitVec 64)) V!44761)

(assert (=> b!1181505 (= lt!534042 (dynLambda!3025 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!534043 () ListLongMap!17129)

(assert (=> b!1181505 (= lt!534043 (getCurrentListMapNoExtraKeys!5058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181506 () Bool)

(declare-fun e!671816 () Bool)

(assert (=> b!1181506 (= e!671816 tp_is_empty!29725)))

(declare-fun b!1181507 () Bool)

(declare-fun Unit!39015 () Unit!39013)

(assert (=> b!1181507 (= e!671818 Unit!39015)))

(declare-fun mapNonEmpty!46415 () Bool)

(declare-fun tp!88298 () Bool)

(declare-fun e!671819 () Bool)

(assert (=> mapNonEmpty!46415 (= mapRes!46415 (and tp!88298 e!671819))))

(declare-fun mapRest!46415 () (Array (_ BitVec 32) ValueCell!14153))

(declare-fun mapValue!46415 () ValueCell!14153)

(declare-fun mapKey!46415 () (_ BitVec 32))

(assert (=> mapNonEmpty!46415 (= (arr!36796 _values!996) (store mapRest!46415 mapKey!46415 mapValue!46415))))

(declare-fun b!1181508 () Bool)

(declare-fun res!784682 () Bool)

(assert (=> b!1181508 (=> (not res!784682) (not e!671815))))

(assert (=> b!1181508 (= res!784682 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37332 _keys!1208))))))

(declare-fun b!1181509 () Bool)

(declare-fun res!784683 () Bool)

(assert (=> b!1181509 (=> (not res!784683) (not e!671815))))

(assert (=> b!1181509 (= res!784683 (= (select (arr!36795 _keys!1208) i!673) k0!934))))

(declare-fun b!1181510 () Bool)

(declare-fun res!784691 () Bool)

(assert (=> b!1181510 (=> (not res!784691) (not e!671815))))

(declare-datatypes ((List!25883 0))(
  ( (Nil!25880) (Cons!25879 (h!27097 (_ BitVec 64)) (t!38062 List!25883)) )
))
(declare-fun arrayNoDuplicates!0 (array!76303 (_ BitVec 32) List!25883) Bool)

(assert (=> b!1181510 (= res!784691 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25880))))

(declare-fun b!1181511 () Bool)

(declare-fun Unit!39016 () Unit!39013)

(assert (=> b!1181511 (= e!671818 Unit!39016)))

(declare-fun lt!534047 () Unit!39013)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76303 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39013)

(assert (=> b!1181511 (= lt!534047 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181511 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534040 () Unit!39013)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76303 (_ BitVec 32) (_ BitVec 32)) Unit!39013)

(assert (=> b!1181511 (= lt!534040 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181511 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25880)))

(declare-fun lt!534038 () Unit!39013)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76303 (_ BitVec 64) (_ BitVec 32) List!25883) Unit!39013)

(assert (=> b!1181511 (= lt!534038 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25880))))

(assert (=> b!1181511 false))

(declare-fun b!1181512 () Bool)

(declare-fun res!784680 () Bool)

(assert (=> b!1181512 (=> (not res!784680) (not e!671815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181512 (= res!784680 (validMask!0 mask!1564))))

(declare-fun b!1181513 () Bool)

(assert (=> b!1181513 (= e!671817 (and e!671816 mapRes!46415))))

(declare-fun condMapEmpty!46415 () Bool)

(declare-fun mapDefault!46415 () ValueCell!14153)

(assert (=> b!1181513 (= condMapEmpty!46415 (= (arr!36796 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14153)) mapDefault!46415)))))

(declare-fun b!1181514 () Bool)

(declare-fun res!784689 () Bool)

(assert (=> b!1181514 (=> (not res!784689) (not e!671811))))

(assert (=> b!1181514 (= res!784689 (= lt!534043 (+!3903 lt!534046 lt!534052)))))

(declare-fun b!1181515 () Bool)

(declare-fun res!784688 () Bool)

(assert (=> b!1181515 (=> (not res!784688) (not e!671822))))

(assert (=> b!1181515 (= res!784688 (arrayNoDuplicates!0 lt!534048 #b00000000000000000000000000000000 Nil!25880))))

(declare-fun b!1181516 () Bool)

(assert (=> b!1181516 (= e!671814 e!671821)))

(declare-fun res!784681 () Bool)

(assert (=> b!1181516 (=> res!784681 e!671821)))

(assert (=> b!1181516 (= res!784681 (not (= (select (arr!36795 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181517 () Bool)

(assert (=> b!1181517 (= e!671819 tp_is_empty!29725)))

(declare-fun b!1181518 () Bool)

(declare-fun res!784686 () Bool)

(assert (=> b!1181518 (=> (not res!784686) (not e!671815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76303 (_ BitVec 32)) Bool)

(assert (=> b!1181518 (= res!784686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181519 () Bool)

(assert (=> b!1181519 (= e!671815 e!671822)))

(declare-fun res!784675 () Bool)

(assert (=> b!1181519 (=> (not res!784675) (not e!671822))))

(assert (=> b!1181519 (= res!784675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534048 mask!1564))))

(assert (=> b!1181519 (= lt!534048 (array!76304 (store (arr!36795 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37332 _keys!1208)))))

(assert (= (and start!99852 res!784687) b!1181512))

(assert (= (and b!1181512 res!784680) b!1181498))

(assert (= (and b!1181498 res!784684) b!1181518))

(assert (= (and b!1181518 res!784686) b!1181510))

(assert (= (and b!1181510 res!784691) b!1181508))

(assert (= (and b!1181508 res!784682) b!1181503))

(assert (= (and b!1181503 res!784690) b!1181509))

(assert (= (and b!1181509 res!784683) b!1181519))

(assert (= (and b!1181519 res!784675) b!1181515))

(assert (= (and b!1181515 res!784688) b!1181501))

(assert (= (and b!1181501 (not res!784678)) b!1181505))

(assert (= (and b!1181505 (not res!784676)) b!1181499))

(assert (= (and b!1181499 (not res!784677)) b!1181500))

(assert (= (and b!1181500 res!784685) b!1181516))

(assert (= (and b!1181516 (not res!784681)) b!1181504))

(assert (= (and b!1181500 c!117314) b!1181511))

(assert (= (and b!1181500 (not c!117314)) b!1181507))

(assert (= (and b!1181500 res!784679) b!1181514))

(assert (= (and b!1181514 res!784689) b!1181502))

(assert (= (and b!1181513 condMapEmpty!46415) mapIsEmpty!46415))

(assert (= (and b!1181513 (not condMapEmpty!46415)) mapNonEmpty!46415))

(get-info :version)

(assert (= (and mapNonEmpty!46415 ((_ is ValueCellFull!14153) mapValue!46415)) b!1181517))

(assert (= (and b!1181513 ((_ is ValueCellFull!14153) mapDefault!46415)) b!1181506))

(assert (= start!99852 b!1181513))

(declare-fun b_lambda!20333 () Bool)

(assert (=> (not b_lambda!20333) (not b!1181505)))

(declare-fun t!38060 () Bool)

(declare-fun tb!9999 () Bool)

(assert (=> (and start!99852 (= defaultEntry!1004 defaultEntry!1004) t!38060) tb!9999))

(declare-fun result!20573 () Bool)

(assert (=> tb!9999 (= result!20573 tp_is_empty!29725)))

(assert (=> b!1181505 t!38060))

(declare-fun b_and!41261 () Bool)

(assert (= b_and!41259 (and (=> t!38060 result!20573) b_and!41261)))

(declare-fun m!1089741 () Bool)

(assert (=> b!1181518 m!1089741))

(declare-fun m!1089743 () Bool)

(assert (=> b!1181514 m!1089743))

(declare-fun m!1089745 () Bool)

(assert (=> b!1181503 m!1089745))

(declare-fun m!1089747 () Bool)

(assert (=> b!1181501 m!1089747))

(declare-fun m!1089749 () Bool)

(assert (=> b!1181501 m!1089749))

(declare-fun m!1089751 () Bool)

(assert (=> b!1181511 m!1089751))

(declare-fun m!1089753 () Bool)

(assert (=> b!1181511 m!1089753))

(declare-fun m!1089755 () Bool)

(assert (=> b!1181511 m!1089755))

(declare-fun m!1089757 () Bool)

(assert (=> b!1181511 m!1089757))

(declare-fun m!1089759 () Bool)

(assert (=> b!1181511 m!1089759))

(declare-fun m!1089761 () Bool)

(assert (=> b!1181515 m!1089761))

(declare-fun m!1089763 () Bool)

(assert (=> b!1181505 m!1089763))

(declare-fun m!1089765 () Bool)

(assert (=> b!1181505 m!1089765))

(declare-fun m!1089767 () Bool)

(assert (=> b!1181505 m!1089767))

(declare-fun m!1089769 () Bool)

(assert (=> b!1181505 m!1089769))

(declare-fun m!1089771 () Bool)

(assert (=> b!1181516 m!1089771))

(declare-fun m!1089773 () Bool)

(assert (=> start!99852 m!1089773))

(declare-fun m!1089775 () Bool)

(assert (=> start!99852 m!1089775))

(declare-fun m!1089777 () Bool)

(assert (=> b!1181499 m!1089777))

(declare-fun m!1089779 () Bool)

(assert (=> b!1181499 m!1089779))

(declare-fun m!1089781 () Bool)

(assert (=> b!1181499 m!1089781))

(declare-fun m!1089783 () Bool)

(assert (=> b!1181499 m!1089783))

(assert (=> b!1181499 m!1089771))

(declare-fun m!1089785 () Bool)

(assert (=> b!1181499 m!1089785))

(assert (=> b!1181499 m!1089771))

(declare-fun m!1089787 () Bool)

(assert (=> b!1181509 m!1089787))

(declare-fun m!1089789 () Bool)

(assert (=> b!1181512 m!1089789))

(declare-fun m!1089791 () Bool)

(assert (=> b!1181504 m!1089791))

(declare-fun m!1089793 () Bool)

(assert (=> b!1181519 m!1089793))

(declare-fun m!1089795 () Bool)

(assert (=> b!1181519 m!1089795))

(declare-fun m!1089797 () Bool)

(assert (=> b!1181510 m!1089797))

(declare-fun m!1089799 () Bool)

(assert (=> mapNonEmpty!46415 m!1089799))

(assert (=> b!1181500 m!1089771))

(declare-fun m!1089801 () Bool)

(assert (=> b!1181500 m!1089801))

(declare-fun m!1089803 () Bool)

(assert (=> b!1181500 m!1089803))

(assert (=> b!1181500 m!1089803))

(declare-fun m!1089805 () Bool)

(assert (=> b!1181500 m!1089805))

(check-sat (not b!1181510) (not b!1181500) (not b!1181519) tp_is_empty!29725 (not b!1181505) (not b!1181503) (not b!1181512) (not start!99852) (not b_next!25195) (not b!1181518) (not b!1181501) (not mapNonEmpty!46415) b_and!41261 (not b!1181504) (not b_lambda!20333) (not b!1181499) (not b!1181511) (not b!1181514) (not b!1181515))
(check-sat b_and!41261 (not b_next!25195))
