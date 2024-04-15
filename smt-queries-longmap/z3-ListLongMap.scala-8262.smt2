; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100514 () Bool)

(assert start!100514)

(declare-fun b_free!25843 () Bool)

(declare-fun b_next!25843 () Bool)

(assert (=> start!100514 (= b_free!25843 (not b_next!25843))))

(declare-fun tp!90518 () Bool)

(declare-fun b_and!42551 () Bool)

(assert (=> start!100514 (= tp!90518 b_and!42551)))

(declare-fun b!1200985 () Bool)

(declare-fun res!799510 () Bool)

(declare-fun e!682009 () Bool)

(assert (=> b!1200985 (=> (not res!799510) (not e!682009))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1200985 (= res!799510 (validMask!0 mask!1564))))

(declare-fun res!799517 () Bool)

(assert (=> start!100514 (=> (not res!799517) (not e!682009))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77792 0))(
  ( (array!77793 (arr!37541 (Array (_ BitVec 32) (_ BitVec 64))) (size!38079 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77792)

(assert (=> start!100514 (= res!799517 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38079 _keys!1208))))))

(assert (=> start!100514 e!682009))

(declare-fun tp_is_empty!30547 () Bool)

(assert (=> start!100514 tp_is_empty!30547))

(declare-fun array_inv!28718 (array!77792) Bool)

(assert (=> start!100514 (array_inv!28718 _keys!1208)))

(assert (=> start!100514 true))

(assert (=> start!100514 tp!90518))

(declare-datatypes ((V!45857 0))(
  ( (V!45858 (val!15330 Int)) )
))
(declare-datatypes ((ValueCell!14564 0))(
  ( (ValueCellFull!14564 (v!17967 V!45857)) (EmptyCell!14564) )
))
(declare-datatypes ((array!77794 0))(
  ( (array!77795 (arr!37542 (Array (_ BitVec 32) ValueCell!14564)) (size!38080 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77794)

(declare-fun e!682006 () Bool)

(declare-fun array_inv!28719 (array!77794) Bool)

(assert (=> start!100514 (and (array_inv!28719 _values!996) e!682006)))

(declare-fun b!1200986 () Bool)

(declare-fun e!682004 () Bool)

(declare-fun e!682000 () Bool)

(assert (=> b!1200986 (= e!682004 e!682000)))

(declare-fun res!799514 () Bool)

(assert (=> b!1200986 (=> res!799514 e!682000)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200986 (= res!799514 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!544106 () array!77794)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19718 0))(
  ( (tuple2!19719 (_1!9870 (_ BitVec 64)) (_2!9870 V!45857)) )
))
(declare-datatypes ((List!26507 0))(
  ( (Nil!26504) (Cons!26503 (h!27712 tuple2!19718) (t!39321 List!26507)) )
))
(declare-datatypes ((ListLongMap!17687 0))(
  ( (ListLongMap!17688 (toList!8859 List!26507)) )
))
(declare-fun lt!544105 () ListLongMap!17687)

(declare-fun minValue!944 () V!45857)

(declare-fun lt!544103 () array!77792)

(declare-fun getCurrentListMapNoExtraKeys!5307 (array!77792 array!77794 (_ BitVec 32) (_ BitVec 32) V!45857 V!45857 (_ BitVec 32) Int) ListLongMap!17687)

(assert (=> b!1200986 (= lt!544105 (getCurrentListMapNoExtraKeys!5307 lt!544103 lt!544106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3185 (Int (_ BitVec 64)) V!45857)

(assert (=> b!1200986 (= lt!544106 (array!77795 (store (arr!37542 _values!996) i!673 (ValueCellFull!14564 (dynLambda!3185 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38080 _values!996)))))

(declare-fun lt!544108 () ListLongMap!17687)

(assert (=> b!1200986 (= lt!544108 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1200987 () Bool)

(declare-fun e!682008 () Bool)

(assert (=> b!1200987 (= e!682008 (not e!682004))))

(declare-fun res!799508 () Bool)

(assert (=> b!1200987 (=> res!799508 e!682004)))

(assert (=> b!1200987 (= res!799508 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1200987 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39677 0))(
  ( (Unit!39678) )
))
(declare-fun lt!544102 () Unit!39677)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77792 (_ BitVec 64) (_ BitVec 32)) Unit!39677)

(assert (=> b!1200987 (= lt!544102 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1200988 () Bool)

(declare-fun res!799509 () Bool)

(assert (=> b!1200988 (=> (not res!799509) (not e!682009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77792 (_ BitVec 32)) Bool)

(assert (=> b!1200988 (= res!799509 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200989 () Bool)

(assert (=> b!1200989 (= e!682009 e!682008)))

(declare-fun res!799511 () Bool)

(assert (=> b!1200989 (=> (not res!799511) (not e!682008))))

(assert (=> b!1200989 (= res!799511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544103 mask!1564))))

(assert (=> b!1200989 (= lt!544103 (array!77793 (store (arr!37541 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38079 _keys!1208)))))

(declare-fun b!1200990 () Bool)

(declare-fun e!682001 () Bool)

(assert (=> b!1200990 (= e!682000 e!682001)))

(declare-fun res!799513 () Bool)

(assert (=> b!1200990 (=> res!799513 e!682001)))

(assert (=> b!1200990 (= res!799513 (not (= (select (arr!37541 _keys!1208) from!1455) k0!934)))))

(declare-fun e!682005 () Bool)

(assert (=> b!1200990 e!682005))

(declare-fun c!117450 () Bool)

(assert (=> b!1200990 (= c!117450 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!544104 () Unit!39677)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1008 (array!77792 array!77794 (_ BitVec 32) (_ BitVec 32) V!45857 V!45857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39677)

(assert (=> b!1200990 (= lt!544104 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1008 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1200991 () Bool)

(declare-fun call!57336 () ListLongMap!17687)

(declare-fun call!57335 () ListLongMap!17687)

(assert (=> b!1200991 (= e!682005 (= call!57336 call!57335))))

(declare-fun b!1200992 () Bool)

(declare-fun res!799507 () Bool)

(assert (=> b!1200992 (=> (not res!799507) (not e!682009))))

(assert (=> b!1200992 (= res!799507 (and (= (size!38080 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38079 _keys!1208) (size!38080 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200993 () Bool)

(declare-fun e!682003 () Bool)

(declare-fun mapRes!47663 () Bool)

(assert (=> b!1200993 (= e!682006 (and e!682003 mapRes!47663))))

(declare-fun condMapEmpty!47663 () Bool)

(declare-fun mapDefault!47663 () ValueCell!14564)

(assert (=> b!1200993 (= condMapEmpty!47663 (= (arr!37542 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14564)) mapDefault!47663)))))

(declare-fun b!1200994 () Bool)

(declare-fun res!799518 () Bool)

(assert (=> b!1200994 (=> (not res!799518) (not e!682009))))

(declare-datatypes ((List!26508 0))(
  ( (Nil!26505) (Cons!26504 (h!27713 (_ BitVec 64)) (t!39322 List!26508)) )
))
(declare-fun arrayNoDuplicates!0 (array!77792 (_ BitVec 32) List!26508) Bool)

(assert (=> b!1200994 (= res!799518 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26505))))

(declare-fun mapNonEmpty!47663 () Bool)

(declare-fun tp!90519 () Bool)

(declare-fun e!682002 () Bool)

(assert (=> mapNonEmpty!47663 (= mapRes!47663 (and tp!90519 e!682002))))

(declare-fun mapRest!47663 () (Array (_ BitVec 32) ValueCell!14564))

(declare-fun mapKey!47663 () (_ BitVec 32))

(declare-fun mapValue!47663 () ValueCell!14564)

(assert (=> mapNonEmpty!47663 (= (arr!37542 _values!996) (store mapRest!47663 mapKey!47663 mapValue!47663))))

(declare-fun bm!57332 () Bool)

(assert (=> bm!57332 (= call!57335 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!47663 () Bool)

(assert (=> mapIsEmpty!47663 mapRes!47663))

(declare-fun b!1200995 () Bool)

(declare-fun res!799506 () Bool)

(assert (=> b!1200995 (=> (not res!799506) (not e!682009))))

(assert (=> b!1200995 (= res!799506 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38079 _keys!1208))))))

(declare-fun b!1200996 () Bool)

(assert (=> b!1200996 (= e!682003 tp_is_empty!30547)))

(declare-fun b!1200997 () Bool)

(declare-fun -!1757 (ListLongMap!17687 (_ BitVec 64)) ListLongMap!17687)

(assert (=> b!1200997 (= e!682005 (= call!57336 (-!1757 call!57335 k0!934)))))

(declare-fun b!1200998 () Bool)

(declare-fun res!799516 () Bool)

(assert (=> b!1200998 (=> (not res!799516) (not e!682009))))

(assert (=> b!1200998 (= res!799516 (= (select (arr!37541 _keys!1208) i!673) k0!934))))

(declare-fun b!1200999 () Bool)

(assert (=> b!1200999 (= e!682002 tp_is_empty!30547)))

(declare-fun bm!57333 () Bool)

(assert (=> bm!57333 (= call!57336 (getCurrentListMapNoExtraKeys!5307 lt!544103 lt!544106 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1201000 () Bool)

(declare-fun res!799512 () Bool)

(assert (=> b!1201000 (=> (not res!799512) (not e!682009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1201000 (= res!799512 (validKeyInArray!0 k0!934))))

(declare-fun b!1201001 () Bool)

(declare-fun res!799515 () Bool)

(assert (=> b!1201001 (=> (not res!799515) (not e!682008))))

(assert (=> b!1201001 (= res!799515 (arrayNoDuplicates!0 lt!544103 #b00000000000000000000000000000000 Nil!26505))))

(declare-fun b!1201002 () Bool)

(assert (=> b!1201002 (= e!682001 true)))

(declare-fun lt!544107 () Bool)

(declare-fun contains!6854 (ListLongMap!17687 (_ BitVec 64)) Bool)

(assert (=> b!1201002 (= lt!544107 (contains!6854 (getCurrentListMapNoExtraKeys!5307 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(assert (= (and start!100514 res!799517) b!1200985))

(assert (= (and b!1200985 res!799510) b!1200992))

(assert (= (and b!1200992 res!799507) b!1200988))

(assert (= (and b!1200988 res!799509) b!1200994))

(assert (= (and b!1200994 res!799518) b!1200995))

(assert (= (and b!1200995 res!799506) b!1201000))

(assert (= (and b!1201000 res!799512) b!1200998))

(assert (= (and b!1200998 res!799516) b!1200989))

(assert (= (and b!1200989 res!799511) b!1201001))

(assert (= (and b!1201001 res!799515) b!1200987))

(assert (= (and b!1200987 (not res!799508)) b!1200986))

(assert (= (and b!1200986 (not res!799514)) b!1200990))

(assert (= (and b!1200990 c!117450) b!1200997))

(assert (= (and b!1200990 (not c!117450)) b!1200991))

(assert (= (or b!1200997 b!1200991) bm!57333))

(assert (= (or b!1200997 b!1200991) bm!57332))

(assert (= (and b!1200990 (not res!799513)) b!1201002))

(assert (= (and b!1200993 condMapEmpty!47663) mapIsEmpty!47663))

(assert (= (and b!1200993 (not condMapEmpty!47663)) mapNonEmpty!47663))

(get-info :version)

(assert (= (and mapNonEmpty!47663 ((_ is ValueCellFull!14564) mapValue!47663)) b!1200999))

(assert (= (and b!1200993 ((_ is ValueCellFull!14564) mapDefault!47663)) b!1200996))

(assert (= start!100514 b!1200993))

(declare-fun b_lambda!21021 () Bool)

(assert (=> (not b_lambda!21021) (not b!1200986)))

(declare-fun t!39320 () Bool)

(declare-fun tb!10635 () Bool)

(assert (=> (and start!100514 (= defaultEntry!1004 defaultEntry!1004) t!39320) tb!10635))

(declare-fun result!21855 () Bool)

(assert (=> tb!10635 (= result!21855 tp_is_empty!30547)))

(assert (=> b!1200986 t!39320))

(declare-fun b_and!42553 () Bool)

(assert (= b_and!42551 (and (=> t!39320 result!21855) b_and!42553)))

(declare-fun m!1106685 () Bool)

(assert (=> b!1200989 m!1106685))

(declare-fun m!1106687 () Bool)

(assert (=> b!1200989 m!1106687))

(declare-fun m!1106689 () Bool)

(assert (=> b!1201000 m!1106689))

(declare-fun m!1106691 () Bool)

(assert (=> b!1200985 m!1106691))

(declare-fun m!1106693 () Bool)

(assert (=> bm!57333 m!1106693))

(declare-fun m!1106695 () Bool)

(assert (=> b!1200997 m!1106695))

(declare-fun m!1106697 () Bool)

(assert (=> start!100514 m!1106697))

(declare-fun m!1106699 () Bool)

(assert (=> start!100514 m!1106699))

(declare-fun m!1106701 () Bool)

(assert (=> b!1201001 m!1106701))

(declare-fun m!1106703 () Bool)

(assert (=> b!1201002 m!1106703))

(assert (=> b!1201002 m!1106703))

(declare-fun m!1106705 () Bool)

(assert (=> b!1201002 m!1106705))

(declare-fun m!1106707 () Bool)

(assert (=> mapNonEmpty!47663 m!1106707))

(declare-fun m!1106709 () Bool)

(assert (=> b!1200986 m!1106709))

(declare-fun m!1106711 () Bool)

(assert (=> b!1200986 m!1106711))

(declare-fun m!1106713 () Bool)

(assert (=> b!1200986 m!1106713))

(declare-fun m!1106715 () Bool)

(assert (=> b!1200986 m!1106715))

(declare-fun m!1106717 () Bool)

(assert (=> b!1200987 m!1106717))

(declare-fun m!1106719 () Bool)

(assert (=> b!1200987 m!1106719))

(declare-fun m!1106721 () Bool)

(assert (=> b!1200998 m!1106721))

(declare-fun m!1106723 () Bool)

(assert (=> b!1200994 m!1106723))

(declare-fun m!1106725 () Bool)

(assert (=> b!1200990 m!1106725))

(declare-fun m!1106727 () Bool)

(assert (=> b!1200990 m!1106727))

(assert (=> bm!57332 m!1106703))

(declare-fun m!1106729 () Bool)

(assert (=> b!1200988 m!1106729))

(check-sat (not b!1201001) (not bm!57333) (not bm!57332) (not b!1200994) (not b!1201002) (not b!1200985) (not b!1200988) (not b_lambda!21021) (not b!1200990) (not b_next!25843) (not b!1200987) (not mapNonEmpty!47663) (not b!1200986) b_and!42553 (not b!1200997) (not b!1200989) tp_is_empty!30547 (not start!100514) (not b!1201000))
(check-sat b_and!42553 (not b_next!25843))
