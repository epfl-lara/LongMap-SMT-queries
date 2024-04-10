; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99540 () Bool)

(assert start!99540)

(declare-fun b_free!25119 () Bool)

(declare-fun b_next!25119 () Bool)

(assert (=> start!99540 (= b_free!25119 (not b_next!25119))))

(declare-fun tp!88070 () Bool)

(declare-fun b_and!41105 () Bool)

(assert (=> start!99540 (= tp!88070 b_and!41105)))

(declare-fun b!1177710 () Bool)

(declare-fun res!782327 () Bool)

(declare-fun e!669504 () Bool)

(assert (=> b!1177710 (=> (not res!782327) (not e!669504))))

(declare-datatypes ((array!76105 0))(
  ( (array!76106 (arr!36702 (Array (_ BitVec 32) (_ BitVec 64))) (size!37238 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76105)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44659 0))(
  ( (V!44660 (val!14881 Int)) )
))
(declare-datatypes ((ValueCell!14115 0))(
  ( (ValueCellFull!14115 (v!17519 V!44659)) (EmptyCell!14115) )
))
(declare-datatypes ((array!76107 0))(
  ( (array!76108 (arr!36703 (Array (_ BitVec 32) ValueCell!14115)) (size!37239 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76107)

(assert (=> b!1177710 (= res!782327 (and (= (size!37239 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37238 _keys!1208) (size!37239 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177711 () Bool)

(declare-fun e!669501 () Bool)

(declare-fun e!669505 () Bool)

(assert (=> b!1177711 (= e!669501 e!669505)))

(declare-fun res!782323 () Bool)

(assert (=> b!1177711 (=> res!782323 e!669505)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177711 (= res!782323 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531844 () array!76107)

(declare-fun minValue!944 () V!44659)

(declare-datatypes ((tuple2!19040 0))(
  ( (tuple2!19041 (_1!9531 (_ BitVec 64)) (_2!9531 V!44659)) )
))
(declare-datatypes ((List!25777 0))(
  ( (Nil!25774) (Cons!25773 (h!26982 tuple2!19040) (t!37888 List!25777)) )
))
(declare-datatypes ((ListLongMap!17009 0))(
  ( (ListLongMap!17010 (toList!8520 List!25777)) )
))
(declare-fun lt!531857 () ListLongMap!17009)

(declare-fun zeroValue!944 () V!44659)

(declare-fun lt!531856 () array!76105)

(declare-fun getCurrentListMapNoExtraKeys!4977 (array!76105 array!76107 (_ BitVec 32) (_ BitVec 32) V!44659 V!44659 (_ BitVec 32) Int) ListLongMap!17009)

(assert (=> b!1177711 (= lt!531857 (getCurrentListMapNoExtraKeys!4977 lt!531856 lt!531844 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531853 () V!44659)

(assert (=> b!1177711 (= lt!531844 (array!76108 (store (arr!36703 _values!996) i!673 (ValueCellFull!14115 lt!531853)) (size!37239 _values!996)))))

(declare-fun dynLambda!2939 (Int (_ BitVec 64)) V!44659)

(assert (=> b!1177711 (= lt!531853 (dynLambda!2939 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531858 () ListLongMap!17009)

(assert (=> b!1177711 (= lt!531858 (getCurrentListMapNoExtraKeys!4977 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177712 () Bool)

(declare-fun res!782325 () Bool)

(assert (=> b!1177712 (=> (not res!782325) (not e!669504))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177712 (= res!782325 (validKeyInArray!0 k0!934))))

(declare-fun b!1177713 () Bool)

(declare-fun e!669506 () Bool)

(assert (=> b!1177713 (= e!669504 e!669506)))

(declare-fun res!782317 () Bool)

(assert (=> b!1177713 (=> (not res!782317) (not e!669506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76105 (_ BitVec 32)) Bool)

(assert (=> b!1177713 (= res!782317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531856 mask!1564))))

(assert (=> b!1177713 (= lt!531856 (array!76106 (store (arr!36702 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37238 _keys!1208)))))

(declare-fun lt!531851 () ListLongMap!17009)

(declare-fun e!669507 () Bool)

(declare-fun lt!531850 () tuple2!19040)

(declare-fun b!1177714 () Bool)

(declare-fun +!3835 (ListLongMap!17009 tuple2!19040) ListLongMap!17009)

(assert (=> b!1177714 (= e!669507 (= lt!531858 (+!3835 lt!531851 lt!531850)))))

(declare-fun b!1177715 () Bool)

(declare-fun res!782318 () Bool)

(assert (=> b!1177715 (=> (not res!782318) (not e!669504))))

(assert (=> b!1177715 (= res!782318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177716 () Bool)

(assert (=> b!1177716 (= e!669506 (not e!669501))))

(declare-fun res!782316 () Bool)

(assert (=> b!1177716 (=> res!782316 e!669501)))

(assert (=> b!1177716 (= res!782316 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177716 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38896 0))(
  ( (Unit!38897) )
))
(declare-fun lt!531855 () Unit!38896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76105 (_ BitVec 64) (_ BitVec 32)) Unit!38896)

(assert (=> b!1177716 (= lt!531855 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177717 () Bool)

(declare-fun res!782321 () Bool)

(assert (=> b!1177717 (=> (not res!782321) (not e!669506))))

(declare-datatypes ((List!25778 0))(
  ( (Nil!25775) (Cons!25774 (h!26983 (_ BitVec 64)) (t!37889 List!25778)) )
))
(declare-fun arrayNoDuplicates!0 (array!76105 (_ BitVec 32) List!25778) Bool)

(assert (=> b!1177717 (= res!782321 (arrayNoDuplicates!0 lt!531856 #b00000000000000000000000000000000 Nil!25775))))

(declare-fun b!1177718 () Bool)

(declare-fun e!669502 () Bool)

(assert (=> b!1177718 (= e!669505 e!669502)))

(declare-fun res!782324 () Bool)

(assert (=> b!1177718 (=> res!782324 e!669502)))

(assert (=> b!1177718 (= res!782324 (not (validKeyInArray!0 (select (arr!36702 _keys!1208) from!1455))))))

(declare-fun lt!531852 () ListLongMap!17009)

(declare-fun lt!531849 () ListLongMap!17009)

(assert (=> b!1177718 (= lt!531852 lt!531849)))

(declare-fun -!1569 (ListLongMap!17009 (_ BitVec 64)) ListLongMap!17009)

(assert (=> b!1177718 (= lt!531849 (-!1569 lt!531851 k0!934))))

(assert (=> b!1177718 (= lt!531852 (getCurrentListMapNoExtraKeys!4977 lt!531856 lt!531844 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177718 (= lt!531851 (getCurrentListMapNoExtraKeys!4977 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531846 () Unit!38896)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!796 (array!76105 array!76107 (_ BitVec 32) (_ BitVec 32) V!44659 V!44659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38896)

(assert (=> b!1177718 (= lt!531846 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!796 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177719 () Bool)

(declare-fun e!669496 () Unit!38896)

(declare-fun Unit!38898 () Unit!38896)

(assert (=> b!1177719 (= e!669496 Unit!38898)))

(declare-fun lt!531845 () Unit!38896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76105 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38896)

(assert (=> b!1177719 (= lt!531845 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177719 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531847 () Unit!38896)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76105 (_ BitVec 32) (_ BitVec 32)) Unit!38896)

(assert (=> b!1177719 (= lt!531847 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177719 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25775)))

(declare-fun lt!531848 () Unit!38896)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76105 (_ BitVec 64) (_ BitVec 32) List!25778) Unit!38896)

(assert (=> b!1177719 (= lt!531848 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25775))))

(assert (=> b!1177719 false))

(declare-fun b!1177720 () Bool)

(declare-fun res!782320 () Bool)

(assert (=> b!1177720 (=> (not res!782320) (not e!669504))))

(assert (=> b!1177720 (= res!782320 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37238 _keys!1208))))))

(declare-fun mapNonEmpty!46301 () Bool)

(declare-fun mapRes!46301 () Bool)

(declare-fun tp!88071 () Bool)

(declare-fun e!669498 () Bool)

(assert (=> mapNonEmpty!46301 (= mapRes!46301 (and tp!88071 e!669498))))

(declare-fun mapRest!46301 () (Array (_ BitVec 32) ValueCell!14115))

(declare-fun mapValue!46301 () ValueCell!14115)

(declare-fun mapKey!46301 () (_ BitVec 32))

(assert (=> mapNonEmpty!46301 (= (arr!36703 _values!996) (store mapRest!46301 mapKey!46301 mapValue!46301))))

(declare-fun b!1177721 () Bool)

(assert (=> b!1177721 (= e!669502 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37238 _keys!1208))))))

(assert (=> b!1177721 e!669507))

(declare-fun res!782328 () Bool)

(assert (=> b!1177721 (=> (not res!782328) (not e!669507))))

(assert (=> b!1177721 (= res!782328 (not (= (select (arr!36702 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531854 () Unit!38896)

(assert (=> b!1177721 (= lt!531854 e!669496)))

(declare-fun c!116802 () Bool)

(assert (=> b!1177721 (= c!116802 (= (select (arr!36702 _keys!1208) from!1455) k0!934))))

(declare-fun e!669497 () Bool)

(assert (=> b!1177721 e!669497))

(declare-fun res!782329 () Bool)

(assert (=> b!1177721 (=> (not res!782329) (not e!669497))))

(assert (=> b!1177721 (= res!782329 (= lt!531857 (+!3835 lt!531849 lt!531850)))))

(declare-fun get!18755 (ValueCell!14115 V!44659) V!44659)

(assert (=> b!1177721 (= lt!531850 (tuple2!19041 (select (arr!36702 _keys!1208) from!1455) (get!18755 (select (arr!36703 _values!996) from!1455) lt!531853)))))

(declare-fun mapIsEmpty!46301 () Bool)

(assert (=> mapIsEmpty!46301 mapRes!46301))

(declare-fun b!1177722 () Bool)

(declare-fun e!669503 () Bool)

(declare-fun tp_is_empty!29649 () Bool)

(assert (=> b!1177722 (= e!669503 tp_is_empty!29649)))

(declare-fun b!1177723 () Bool)

(declare-fun res!782319 () Bool)

(assert (=> b!1177723 (=> (not res!782319) (not e!669504))))

(assert (=> b!1177723 (= res!782319 (= (select (arr!36702 _keys!1208) i!673) k0!934))))

(declare-fun res!782326 () Bool)

(assert (=> start!99540 (=> (not res!782326) (not e!669504))))

(assert (=> start!99540 (= res!782326 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37238 _keys!1208))))))

(assert (=> start!99540 e!669504))

(assert (=> start!99540 tp_is_empty!29649))

(declare-fun array_inv!28028 (array!76105) Bool)

(assert (=> start!99540 (array_inv!28028 _keys!1208)))

(assert (=> start!99540 true))

(assert (=> start!99540 tp!88070))

(declare-fun e!669499 () Bool)

(declare-fun array_inv!28029 (array!76107) Bool)

(assert (=> start!99540 (and (array_inv!28029 _values!996) e!669499)))

(declare-fun b!1177724 () Bool)

(assert (=> b!1177724 (= e!669498 tp_is_empty!29649)))

(declare-fun b!1177725 () Bool)

(declare-fun Unit!38899 () Unit!38896)

(assert (=> b!1177725 (= e!669496 Unit!38899)))

(declare-fun b!1177726 () Bool)

(declare-fun res!782314 () Bool)

(assert (=> b!1177726 (=> (not res!782314) (not e!669504))))

(assert (=> b!1177726 (= res!782314 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25775))))

(declare-fun b!1177727 () Bool)

(assert (=> b!1177727 (= e!669499 (and e!669503 mapRes!46301))))

(declare-fun condMapEmpty!46301 () Bool)

(declare-fun mapDefault!46301 () ValueCell!14115)

(assert (=> b!1177727 (= condMapEmpty!46301 (= (arr!36703 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14115)) mapDefault!46301)))))

(declare-fun b!1177728 () Bool)

(declare-fun e!669508 () Bool)

(assert (=> b!1177728 (= e!669497 e!669508)))

(declare-fun res!782315 () Bool)

(assert (=> b!1177728 (=> res!782315 e!669508)))

(assert (=> b!1177728 (= res!782315 (not (= (select (arr!36702 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177729 () Bool)

(assert (=> b!1177729 (= e!669508 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177730 () Bool)

(declare-fun res!782322 () Bool)

(assert (=> b!1177730 (=> (not res!782322) (not e!669504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177730 (= res!782322 (validMask!0 mask!1564))))

(assert (= (and start!99540 res!782326) b!1177730))

(assert (= (and b!1177730 res!782322) b!1177710))

(assert (= (and b!1177710 res!782327) b!1177715))

(assert (= (and b!1177715 res!782318) b!1177726))

(assert (= (and b!1177726 res!782314) b!1177720))

(assert (= (and b!1177720 res!782320) b!1177712))

(assert (= (and b!1177712 res!782325) b!1177723))

(assert (= (and b!1177723 res!782319) b!1177713))

(assert (= (and b!1177713 res!782317) b!1177717))

(assert (= (and b!1177717 res!782321) b!1177716))

(assert (= (and b!1177716 (not res!782316)) b!1177711))

(assert (= (and b!1177711 (not res!782323)) b!1177718))

(assert (= (and b!1177718 (not res!782324)) b!1177721))

(assert (= (and b!1177721 res!782329) b!1177728))

(assert (= (and b!1177728 (not res!782315)) b!1177729))

(assert (= (and b!1177721 c!116802) b!1177719))

(assert (= (and b!1177721 (not c!116802)) b!1177725))

(assert (= (and b!1177721 res!782328) b!1177714))

(assert (= (and b!1177727 condMapEmpty!46301) mapIsEmpty!46301))

(assert (= (and b!1177727 (not condMapEmpty!46301)) mapNonEmpty!46301))

(get-info :version)

(assert (= (and mapNonEmpty!46301 ((_ is ValueCellFull!14115) mapValue!46301)) b!1177724))

(assert (= (and b!1177727 ((_ is ValueCellFull!14115) mapDefault!46301)) b!1177722))

(assert (= start!99540 b!1177727))

(declare-fun b_lambda!20263 () Bool)

(assert (=> (not b_lambda!20263) (not b!1177711)))

(declare-fun t!37887 () Bool)

(declare-fun tb!9931 () Bool)

(assert (=> (and start!99540 (= defaultEntry!1004 defaultEntry!1004) t!37887) tb!9931))

(declare-fun result!20429 () Bool)

(assert (=> tb!9931 (= result!20429 tp_is_empty!29649)))

(assert (=> b!1177711 t!37887))

(declare-fun b_and!41107 () Bool)

(assert (= b_and!41105 (and (=> t!37887 result!20429) b_and!41107)))

(declare-fun m!1085661 () Bool)

(assert (=> b!1177717 m!1085661))

(declare-fun m!1085663 () Bool)

(assert (=> mapNonEmpty!46301 m!1085663))

(declare-fun m!1085665 () Bool)

(assert (=> b!1177715 m!1085665))

(declare-fun m!1085667 () Bool)

(assert (=> b!1177714 m!1085667))

(declare-fun m!1085669 () Bool)

(assert (=> b!1177729 m!1085669))

(declare-fun m!1085671 () Bool)

(assert (=> b!1177719 m!1085671))

(declare-fun m!1085673 () Bool)

(assert (=> b!1177719 m!1085673))

(declare-fun m!1085675 () Bool)

(assert (=> b!1177719 m!1085675))

(declare-fun m!1085677 () Bool)

(assert (=> b!1177719 m!1085677))

(declare-fun m!1085679 () Bool)

(assert (=> b!1177719 m!1085679))

(declare-fun m!1085681 () Bool)

(assert (=> b!1177728 m!1085681))

(declare-fun m!1085683 () Bool)

(assert (=> b!1177718 m!1085683))

(declare-fun m!1085685 () Bool)

(assert (=> b!1177718 m!1085685))

(declare-fun m!1085687 () Bool)

(assert (=> b!1177718 m!1085687))

(assert (=> b!1177718 m!1085681))

(declare-fun m!1085689 () Bool)

(assert (=> b!1177718 m!1085689))

(declare-fun m!1085691 () Bool)

(assert (=> b!1177718 m!1085691))

(assert (=> b!1177718 m!1085681))

(declare-fun m!1085693 () Bool)

(assert (=> b!1177716 m!1085693))

(declare-fun m!1085695 () Bool)

(assert (=> b!1177716 m!1085695))

(declare-fun m!1085697 () Bool)

(assert (=> b!1177712 m!1085697))

(declare-fun m!1085699 () Bool)

(assert (=> b!1177730 m!1085699))

(declare-fun m!1085701 () Bool)

(assert (=> start!99540 m!1085701))

(declare-fun m!1085703 () Bool)

(assert (=> start!99540 m!1085703))

(declare-fun m!1085705 () Bool)

(assert (=> b!1177726 m!1085705))

(declare-fun m!1085707 () Bool)

(assert (=> b!1177723 m!1085707))

(declare-fun m!1085709 () Bool)

(assert (=> b!1177713 m!1085709))

(declare-fun m!1085711 () Bool)

(assert (=> b!1177713 m!1085711))

(declare-fun m!1085713 () Bool)

(assert (=> b!1177711 m!1085713))

(declare-fun m!1085715 () Bool)

(assert (=> b!1177711 m!1085715))

(declare-fun m!1085717 () Bool)

(assert (=> b!1177711 m!1085717))

(declare-fun m!1085719 () Bool)

(assert (=> b!1177711 m!1085719))

(assert (=> b!1177721 m!1085681))

(declare-fun m!1085721 () Bool)

(assert (=> b!1177721 m!1085721))

(declare-fun m!1085723 () Bool)

(assert (=> b!1177721 m!1085723))

(assert (=> b!1177721 m!1085723))

(declare-fun m!1085725 () Bool)

(assert (=> b!1177721 m!1085725))

(check-sat (not b_next!25119) (not b!1177713) (not b!1177730) (not start!99540) tp_is_empty!29649 (not b!1177715) (not b!1177711) (not b!1177729) (not b!1177712) (not b!1177717) (not b!1177714) (not b!1177719) (not b!1177716) (not b_lambda!20263) (not b!1177718) (not b!1177726) (not mapNonEmpty!46301) (not b!1177721) b_and!41107)
(check-sat b_and!41107 (not b_next!25119))
