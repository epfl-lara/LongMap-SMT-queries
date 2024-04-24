; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99732 () Bool)

(assert start!99732)

(declare-fun b_free!25075 () Bool)

(declare-fun b_next!25075 () Bool)

(assert (=> start!99732 (= b_free!25075 (not b_next!25075))))

(declare-fun tp!87939 () Bool)

(declare-fun b_and!41019 () Bool)

(assert (=> start!99732 (= tp!87939 b_and!41019)))

(declare-fun b!1177569 () Bool)

(declare-fun res!781778 () Bool)

(declare-fun e!669473 () Bool)

(assert (=> b!1177569 (=> (not res!781778) (not e!669473))))

(declare-datatypes ((array!76067 0))(
  ( (array!76068 (arr!36677 (Array (_ BitVec 32) (_ BitVec 64))) (size!37214 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76067)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44601 0))(
  ( (V!44602 (val!14859 Int)) )
))
(declare-datatypes ((ValueCell!14093 0))(
  ( (ValueCellFull!14093 (v!17493 V!44601)) (EmptyCell!14093) )
))
(declare-datatypes ((array!76069 0))(
  ( (array!76070 (arr!36678 (Array (_ BitVec 32) ValueCell!14093)) (size!37215 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76069)

(assert (=> b!1177569 (= res!781778 (and (= (size!37215 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37214 _keys!1208) (size!37215 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177570 () Bool)

(declare-fun res!781771 () Bool)

(assert (=> b!1177570 (=> (not res!781771) (not e!669473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177570 (= res!781771 (validMask!0 mask!1564))))

(declare-fun b!1177571 () Bool)

(declare-fun e!669478 () Bool)

(declare-fun tp_is_empty!29605 () Bool)

(assert (=> b!1177571 (= e!669478 tp_is_empty!29605)))

(declare-datatypes ((tuple2!19048 0))(
  ( (tuple2!19049 (_1!9535 (_ BitVec 64)) (_2!9535 V!44601)) )
))
(declare-datatypes ((List!25780 0))(
  ( (Nil!25777) (Cons!25776 (h!26994 tuple2!19048) (t!37839 List!25780)) )
))
(declare-datatypes ((ListLongMap!17025 0))(
  ( (ListLongMap!17026 (toList!8528 List!25780)) )
))
(declare-fun lt!531344 () ListLongMap!17025)

(declare-fun lt!531338 () tuple2!19048)

(declare-fun b!1177572 () Bool)

(declare-fun lt!531351 () ListLongMap!17025)

(declare-fun e!669477 () Bool)

(declare-fun +!3857 (ListLongMap!17025 tuple2!19048) ListLongMap!17025)

(assert (=> b!1177572 (= e!669477 (= lt!531344 (+!3857 lt!531351 lt!531338)))))

(declare-fun b!1177573 () Bool)

(declare-fun e!669474 () Bool)

(declare-fun e!669471 () Bool)

(assert (=> b!1177573 (= e!669474 e!669471)))

(declare-fun res!781773 () Bool)

(assert (=> b!1177573 (=> res!781773 e!669471)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177573 (= res!781773 (not (= (select (arr!36677 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177574 () Bool)

(declare-fun res!781768 () Bool)

(assert (=> b!1177574 (=> (not res!781768) (not e!669473))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177574 (= res!781768 (= (select (arr!36677 _keys!1208) i!673) k0!934))))

(declare-fun res!781767 () Bool)

(assert (=> start!99732 (=> (not res!781767) (not e!669473))))

(assert (=> start!99732 (= res!781767 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37214 _keys!1208))))))

(assert (=> start!99732 e!669473))

(assert (=> start!99732 tp_is_empty!29605))

(declare-fun array_inv!28090 (array!76067) Bool)

(assert (=> start!99732 (array_inv!28090 _keys!1208)))

(assert (=> start!99732 true))

(assert (=> start!99732 tp!87939))

(declare-fun e!669479 () Bool)

(declare-fun array_inv!28091 (array!76069) Bool)

(assert (=> start!99732 (and (array_inv!28091 _values!996) e!669479)))

(declare-fun b!1177575 () Bool)

(declare-fun e!669475 () Bool)

(declare-fun mapRes!46235 () Bool)

(assert (=> b!1177575 (= e!669479 (and e!669475 mapRes!46235))))

(declare-fun condMapEmpty!46235 () Bool)

(declare-fun mapDefault!46235 () ValueCell!14093)

(assert (=> b!1177575 (= condMapEmpty!46235 (= (arr!36678 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14093)) mapDefault!46235)))))

(declare-fun b!1177576 () Bool)

(declare-fun res!781774 () Bool)

(assert (=> b!1177576 (=> (not res!781774) (not e!669473))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177576 (= res!781774 (validKeyInArray!0 k0!934))))

(declare-fun b!1177577 () Bool)

(declare-fun e!669480 () Bool)

(declare-fun e!669482 () Bool)

(assert (=> b!1177577 (= e!669480 e!669482)))

(declare-fun res!781766 () Bool)

(assert (=> b!1177577 (=> res!781766 e!669482)))

(assert (=> b!1177577 (= res!781766 (not (validKeyInArray!0 (select (arr!36677 _keys!1208) from!1455))))))

(declare-fun lt!531348 () ListLongMap!17025)

(declare-fun lt!531342 () ListLongMap!17025)

(assert (=> b!1177577 (= lt!531348 lt!531342)))

(declare-fun -!1568 (ListLongMap!17025 (_ BitVec 64)) ListLongMap!17025)

(assert (=> b!1177577 (= lt!531342 (-!1568 lt!531351 k0!934))))

(declare-fun zeroValue!944 () V!44601)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531350 () array!76067)

(declare-fun minValue!944 () V!44601)

(declare-fun lt!531349 () array!76069)

(declare-fun getCurrentListMapNoExtraKeys!5010 (array!76067 array!76069 (_ BitVec 32) (_ BitVec 32) V!44601 V!44601 (_ BitVec 32) Int) ListLongMap!17025)

(assert (=> b!1177577 (= lt!531348 (getCurrentListMapNoExtraKeys!5010 lt!531350 lt!531349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177577 (= lt!531351 (getCurrentListMapNoExtraKeys!5010 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38826 0))(
  ( (Unit!38827) )
))
(declare-fun lt!531339 () Unit!38826)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!793 (array!76067 array!76069 (_ BitVec 32) (_ BitVec 32) V!44601 V!44601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38826)

(assert (=> b!1177577 (= lt!531339 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!793 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177578 () Bool)

(declare-fun res!781777 () Bool)

(declare-fun e!669472 () Bool)

(assert (=> b!1177578 (=> (not res!781777) (not e!669472))))

(declare-datatypes ((List!25781 0))(
  ( (Nil!25778) (Cons!25777 (h!26995 (_ BitVec 64)) (t!37840 List!25781)) )
))
(declare-fun arrayNoDuplicates!0 (array!76067 (_ BitVec 32) List!25781) Bool)

(assert (=> b!1177578 (= res!781777 (arrayNoDuplicates!0 lt!531350 #b00000000000000000000000000000000 Nil!25778))))

(declare-fun b!1177579 () Bool)

(declare-fun e!669481 () Unit!38826)

(declare-fun Unit!38828 () Unit!38826)

(assert (=> b!1177579 (= e!669481 Unit!38828)))

(declare-fun b!1177580 () Bool)

(declare-fun e!669476 () Bool)

(assert (=> b!1177580 (= e!669476 e!669480)))

(declare-fun res!781779 () Bool)

(assert (=> b!1177580 (=> res!781779 e!669480)))

(assert (=> b!1177580 (= res!781779 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!531345 () ListLongMap!17025)

(assert (=> b!1177580 (= lt!531345 (getCurrentListMapNoExtraKeys!5010 lt!531350 lt!531349 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531343 () V!44601)

(assert (=> b!1177580 (= lt!531349 (array!76070 (store (arr!36678 _values!996) i!673 (ValueCellFull!14093 lt!531343)) (size!37215 _values!996)))))

(declare-fun dynLambda!2985 (Int (_ BitVec 64)) V!44601)

(assert (=> b!1177580 (= lt!531343 (dynLambda!2985 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177580 (= lt!531344 (getCurrentListMapNoExtraKeys!5010 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177581 () Bool)

(assert (=> b!1177581 (= e!669473 e!669472)))

(declare-fun res!781776 () Bool)

(assert (=> b!1177581 (=> (not res!781776) (not e!669472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76067 (_ BitVec 32)) Bool)

(assert (=> b!1177581 (= res!781776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531350 mask!1564))))

(assert (=> b!1177581 (= lt!531350 (array!76068 (store (arr!36677 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37214 _keys!1208)))))

(declare-fun b!1177582 () Bool)

(declare-fun res!781775 () Bool)

(assert (=> b!1177582 (=> (not res!781775) (not e!669473))))

(assert (=> b!1177582 (= res!781775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177583 () Bool)

(declare-fun Unit!38829 () Unit!38826)

(assert (=> b!1177583 (= e!669481 Unit!38829)))

(declare-fun lt!531347 () Unit!38826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76067 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38826)

(assert (=> b!1177583 (= lt!531347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177583 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531341 () Unit!38826)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76067 (_ BitVec 32) (_ BitVec 32)) Unit!38826)

(assert (=> b!1177583 (= lt!531341 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177583 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25778)))

(declare-fun lt!531340 () Unit!38826)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76067 (_ BitVec 64) (_ BitVec 32) List!25781) Unit!38826)

(assert (=> b!1177583 (= lt!531340 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25778))))

(assert (=> b!1177583 false))

(declare-fun mapNonEmpty!46235 () Bool)

(declare-fun tp!87938 () Bool)

(assert (=> mapNonEmpty!46235 (= mapRes!46235 (and tp!87938 e!669478))))

(declare-fun mapValue!46235 () ValueCell!14093)

(declare-fun mapKey!46235 () (_ BitVec 32))

(declare-fun mapRest!46235 () (Array (_ BitVec 32) ValueCell!14093))

(assert (=> mapNonEmpty!46235 (= (arr!36678 _values!996) (store mapRest!46235 mapKey!46235 mapValue!46235))))

(declare-fun b!1177584 () Bool)

(assert (=> b!1177584 (= e!669471 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177585 () Bool)

(declare-fun res!781780 () Bool)

(assert (=> b!1177585 (=> (not res!781780) (not e!669473))))

(assert (=> b!1177585 (= res!781780 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25778))))

(declare-fun b!1177586 () Bool)

(assert (=> b!1177586 (= e!669475 tp_is_empty!29605)))

(declare-fun b!1177587 () Bool)

(assert (=> b!1177587 (= e!669472 (not e!669476))))

(declare-fun res!781781 () Bool)

(assert (=> b!1177587 (=> res!781781 e!669476)))

(assert (=> b!1177587 (= res!781781 (bvsgt from!1455 i!673))))

(assert (=> b!1177587 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531346 () Unit!38826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76067 (_ BitVec 64) (_ BitVec 32)) Unit!38826)

(assert (=> b!1177587 (= lt!531346 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46235 () Bool)

(assert (=> mapIsEmpty!46235 mapRes!46235))

(declare-fun b!1177588 () Bool)

(declare-fun res!781772 () Bool)

(assert (=> b!1177588 (=> (not res!781772) (not e!669473))))

(assert (=> b!1177588 (= res!781772 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37214 _keys!1208))))))

(declare-fun b!1177589 () Bool)

(assert (=> b!1177589 (= e!669482 true)))

(assert (=> b!1177589 e!669477))

(declare-fun res!781769 () Bool)

(assert (=> b!1177589 (=> (not res!781769) (not e!669477))))

(assert (=> b!1177589 (= res!781769 (not (= (select (arr!36677 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531352 () Unit!38826)

(assert (=> b!1177589 (= lt!531352 e!669481)))

(declare-fun c!117134 () Bool)

(assert (=> b!1177589 (= c!117134 (= (select (arr!36677 _keys!1208) from!1455) k0!934))))

(assert (=> b!1177589 e!669474))

(declare-fun res!781770 () Bool)

(assert (=> b!1177589 (=> (not res!781770) (not e!669474))))

(assert (=> b!1177589 (= res!781770 (= lt!531345 (+!3857 lt!531342 lt!531338)))))

(declare-fun get!18767 (ValueCell!14093 V!44601) V!44601)

(assert (=> b!1177589 (= lt!531338 (tuple2!19049 (select (arr!36677 _keys!1208) from!1455) (get!18767 (select (arr!36678 _values!996) from!1455) lt!531343)))))

(assert (= (and start!99732 res!781767) b!1177570))

(assert (= (and b!1177570 res!781771) b!1177569))

(assert (= (and b!1177569 res!781778) b!1177582))

(assert (= (and b!1177582 res!781775) b!1177585))

(assert (= (and b!1177585 res!781780) b!1177588))

(assert (= (and b!1177588 res!781772) b!1177576))

(assert (= (and b!1177576 res!781774) b!1177574))

(assert (= (and b!1177574 res!781768) b!1177581))

(assert (= (and b!1177581 res!781776) b!1177578))

(assert (= (and b!1177578 res!781777) b!1177587))

(assert (= (and b!1177587 (not res!781781)) b!1177580))

(assert (= (and b!1177580 (not res!781779)) b!1177577))

(assert (= (and b!1177577 (not res!781766)) b!1177589))

(assert (= (and b!1177589 res!781770) b!1177573))

(assert (= (and b!1177573 (not res!781773)) b!1177584))

(assert (= (and b!1177589 c!117134) b!1177583))

(assert (= (and b!1177589 (not c!117134)) b!1177579))

(assert (= (and b!1177589 res!781769) b!1177572))

(assert (= (and b!1177575 condMapEmpty!46235) mapIsEmpty!46235))

(assert (= (and b!1177575 (not condMapEmpty!46235)) mapNonEmpty!46235))

(get-info :version)

(assert (= (and mapNonEmpty!46235 ((_ is ValueCellFull!14093) mapValue!46235)) b!1177571))

(assert (= (and b!1177575 ((_ is ValueCellFull!14093) mapDefault!46235)) b!1177586))

(assert (= start!99732 b!1177575))

(declare-fun b_lambda!20213 () Bool)

(assert (=> (not b_lambda!20213) (not b!1177580)))

(declare-fun t!37838 () Bool)

(declare-fun tb!9879 () Bool)

(assert (=> (and start!99732 (= defaultEntry!1004 defaultEntry!1004) t!37838) tb!9879))

(declare-fun result!20333 () Bool)

(assert (=> tb!9879 (= result!20333 tp_is_empty!29605)))

(assert (=> b!1177580 t!37838))

(declare-fun b_and!41021 () Bool)

(assert (= b_and!41019 (and (=> t!37838 result!20333) b_and!41021)))

(declare-fun m!1085781 () Bool)

(assert (=> b!1177583 m!1085781))

(declare-fun m!1085783 () Bool)

(assert (=> b!1177583 m!1085783))

(declare-fun m!1085785 () Bool)

(assert (=> b!1177583 m!1085785))

(declare-fun m!1085787 () Bool)

(assert (=> b!1177583 m!1085787))

(declare-fun m!1085789 () Bool)

(assert (=> b!1177583 m!1085789))

(declare-fun m!1085791 () Bool)

(assert (=> mapNonEmpty!46235 m!1085791))

(declare-fun m!1085793 () Bool)

(assert (=> b!1177581 m!1085793))

(declare-fun m!1085795 () Bool)

(assert (=> b!1177581 m!1085795))

(declare-fun m!1085797 () Bool)

(assert (=> b!1177573 m!1085797))

(declare-fun m!1085799 () Bool)

(assert (=> b!1177585 m!1085799))

(declare-fun m!1085801 () Bool)

(assert (=> start!99732 m!1085801))

(declare-fun m!1085803 () Bool)

(assert (=> start!99732 m!1085803))

(declare-fun m!1085805 () Bool)

(assert (=> b!1177582 m!1085805))

(declare-fun m!1085807 () Bool)

(assert (=> b!1177570 m!1085807))

(declare-fun m!1085809 () Bool)

(assert (=> b!1177577 m!1085809))

(declare-fun m!1085811 () Bool)

(assert (=> b!1177577 m!1085811))

(declare-fun m!1085813 () Bool)

(assert (=> b!1177577 m!1085813))

(declare-fun m!1085815 () Bool)

(assert (=> b!1177577 m!1085815))

(assert (=> b!1177577 m!1085797))

(declare-fun m!1085817 () Bool)

(assert (=> b!1177577 m!1085817))

(assert (=> b!1177577 m!1085797))

(assert (=> b!1177589 m!1085797))

(declare-fun m!1085819 () Bool)

(assert (=> b!1177589 m!1085819))

(declare-fun m!1085821 () Bool)

(assert (=> b!1177589 m!1085821))

(assert (=> b!1177589 m!1085821))

(declare-fun m!1085823 () Bool)

(assert (=> b!1177589 m!1085823))

(declare-fun m!1085825 () Bool)

(assert (=> b!1177574 m!1085825))

(declare-fun m!1085827 () Bool)

(assert (=> b!1177584 m!1085827))

(declare-fun m!1085829 () Bool)

(assert (=> b!1177580 m!1085829))

(declare-fun m!1085831 () Bool)

(assert (=> b!1177580 m!1085831))

(declare-fun m!1085833 () Bool)

(assert (=> b!1177580 m!1085833))

(declare-fun m!1085835 () Bool)

(assert (=> b!1177580 m!1085835))

(declare-fun m!1085837 () Bool)

(assert (=> b!1177576 m!1085837))

(declare-fun m!1085839 () Bool)

(assert (=> b!1177572 m!1085839))

(declare-fun m!1085841 () Bool)

(assert (=> b!1177578 m!1085841))

(declare-fun m!1085843 () Bool)

(assert (=> b!1177587 m!1085843))

(declare-fun m!1085845 () Bool)

(assert (=> b!1177587 m!1085845))

(check-sat (not b!1177576) (not b!1177572) (not b!1177578) (not b!1177584) (not b!1177589) (not b!1177585) (not b!1177577) (not b!1177582) (not b!1177587) (not b_next!25075) (not mapNonEmpty!46235) (not b!1177570) (not b!1177583) (not b!1177580) (not b!1177581) tp_is_empty!29605 (not start!99732) b_and!41021 (not b_lambda!20213))
(check-sat b_and!41021 (not b_next!25075))
