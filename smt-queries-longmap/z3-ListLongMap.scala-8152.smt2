; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99780 () Bool)

(assert start!99780)

(declare-fun b_free!25359 () Bool)

(declare-fun b_next!25359 () Bool)

(assert (=> start!99780 (= b_free!25359 (not b_next!25359))))

(declare-fun tp!88790 () Bool)

(declare-fun b_and!41585 () Bool)

(assert (=> start!99780 (= tp!88790 b_and!41585)))

(declare-fun res!787990 () Bool)

(declare-fun e!673994 () Bool)

(assert (=> start!99780 (=> (not res!787990) (not e!673994))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76575 0))(
  ( (array!76576 (arr!36937 (Array (_ BitVec 32) (_ BitVec 64))) (size!37473 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76575)

(assert (=> start!99780 (= res!787990 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37473 _keys!1208))))))

(assert (=> start!99780 e!673994))

(declare-fun tp_is_empty!29889 () Bool)

(assert (=> start!99780 tp_is_empty!29889))

(declare-fun array_inv!28190 (array!76575) Bool)

(assert (=> start!99780 (array_inv!28190 _keys!1208)))

(assert (=> start!99780 true))

(assert (=> start!99780 tp!88790))

(declare-datatypes ((V!44979 0))(
  ( (V!44980 (val!15001 Int)) )
))
(declare-datatypes ((ValueCell!14235 0))(
  ( (ValueCellFull!14235 (v!17639 V!44979)) (EmptyCell!14235) )
))
(declare-datatypes ((array!76577 0))(
  ( (array!76578 (arr!36938 (Array (_ BitVec 32) ValueCell!14235)) (size!37474 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76577)

(declare-fun e!674001 () Bool)

(declare-fun array_inv!28191 (array!76577) Bool)

(assert (=> start!99780 (and (array_inv!28191 _values!996) e!674001)))

(declare-fun b!1185415 () Bool)

(declare-fun res!787979 () Bool)

(assert (=> b!1185415 (=> (not res!787979) (not e!673994))))

(declare-datatypes ((List!25982 0))(
  ( (Nil!25979) (Cons!25978 (h!27187 (_ BitVec 64)) (t!38333 List!25982)) )
))
(declare-fun arrayNoDuplicates!0 (array!76575 (_ BitVec 32) List!25982) Bool)

(assert (=> b!1185415 (= res!787979 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25979))))

(declare-fun b!1185416 () Bool)

(declare-fun res!787987 () Bool)

(assert (=> b!1185416 (=> (not res!787987) (not e!673994))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185416 (= res!787987 (validMask!0 mask!1564))))

(declare-fun b!1185417 () Bool)

(declare-fun res!787982 () Bool)

(assert (=> b!1185417 (=> (not res!787982) (not e!673994))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185417 (= res!787982 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!46661 () Bool)

(declare-fun mapRes!46661 () Bool)

(assert (=> mapIsEmpty!46661 mapRes!46661))

(declare-fun b!1185418 () Bool)

(declare-fun res!787988 () Bool)

(declare-fun e!673996 () Bool)

(assert (=> b!1185418 (=> (not res!787988) (not e!673996))))

(declare-fun lt!537994 () array!76575)

(assert (=> b!1185418 (= res!787988 (arrayNoDuplicates!0 lt!537994 #b00000000000000000000000000000000 Nil!25979))))

(declare-fun e!673991 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun b!1185419 () Bool)

(declare-fun arrayContainsKey!0 (array!76575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185419 (= e!673991 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185420 () Bool)

(declare-fun e!673993 () Bool)

(declare-fun e!673995 () Bool)

(assert (=> b!1185420 (= e!673993 e!673995)))

(declare-fun res!787984 () Bool)

(assert (=> b!1185420 (=> res!787984 e!673995)))

(assert (=> b!1185420 (= res!787984 (not (validKeyInArray!0 (select (arr!36937 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19242 0))(
  ( (tuple2!19243 (_1!9632 (_ BitVec 64)) (_2!9632 V!44979)) )
))
(declare-datatypes ((List!25983 0))(
  ( (Nil!25980) (Cons!25979 (h!27188 tuple2!19242) (t!38334 List!25983)) )
))
(declare-datatypes ((ListLongMap!17211 0))(
  ( (ListLongMap!17212 (toList!8621 List!25983)) )
))
(declare-fun lt!537997 () ListLongMap!17211)

(declare-fun lt!537984 () ListLongMap!17211)

(assert (=> b!1185420 (= lt!537997 lt!537984)))

(declare-fun lt!537986 () ListLongMap!17211)

(declare-fun -!1656 (ListLongMap!17211 (_ BitVec 64)) ListLongMap!17211)

(assert (=> b!1185420 (= lt!537984 (-!1656 lt!537986 k0!934))))

(declare-fun zeroValue!944 () V!44979)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44979)

(declare-fun lt!537985 () array!76577)

(declare-fun getCurrentListMapNoExtraKeys!5067 (array!76575 array!76577 (_ BitVec 32) (_ BitVec 32) V!44979 V!44979 (_ BitVec 32) Int) ListLongMap!17211)

(assert (=> b!1185420 (= lt!537997 (getCurrentListMapNoExtraKeys!5067 lt!537994 lt!537985 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185420 (= lt!537986 (getCurrentListMapNoExtraKeys!5067 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39268 0))(
  ( (Unit!39269) )
))
(declare-fun lt!537995 () Unit!39268)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!872 (array!76575 array!76577 (_ BitVec 32) (_ BitVec 32) V!44979 V!44979 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39268)

(assert (=> b!1185420 (= lt!537995 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185421 () Bool)

(assert (=> b!1185421 (= e!673994 e!673996)))

(declare-fun res!787993 () Bool)

(assert (=> b!1185421 (=> (not res!787993) (not e!673996))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76575 (_ BitVec 32)) Bool)

(assert (=> b!1185421 (= res!787993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!537994 mask!1564))))

(assert (=> b!1185421 (= lt!537994 (array!76576 (store (arr!36937 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37473 _keys!1208)))))

(declare-fun b!1185422 () Bool)

(declare-fun e!674002 () Bool)

(assert (=> b!1185422 (= e!674001 (and e!674002 mapRes!46661))))

(declare-fun condMapEmpty!46661 () Bool)

(declare-fun mapDefault!46661 () ValueCell!14235)

(assert (=> b!1185422 (= condMapEmpty!46661 (= (arr!36938 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14235)) mapDefault!46661)))))

(declare-fun b!1185423 () Bool)

(declare-fun e!674000 () Unit!39268)

(declare-fun Unit!39270 () Unit!39268)

(assert (=> b!1185423 (= e!674000 Unit!39270)))

(declare-fun mapNonEmpty!46661 () Bool)

(declare-fun tp!88791 () Bool)

(declare-fun e!673999 () Bool)

(assert (=> mapNonEmpty!46661 (= mapRes!46661 (and tp!88791 e!673999))))

(declare-fun mapKey!46661 () (_ BitVec 32))

(declare-fun mapRest!46661 () (Array (_ BitVec 32) ValueCell!14235))

(declare-fun mapValue!46661 () ValueCell!14235)

(assert (=> mapNonEmpty!46661 (= (arr!36938 _values!996) (store mapRest!46661 mapKey!46661 mapValue!46661))))

(declare-fun b!1185424 () Bool)

(declare-fun res!787989 () Bool)

(assert (=> b!1185424 (=> (not res!787989) (not e!673994))))

(assert (=> b!1185424 (= res!787989 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37473 _keys!1208))))))

(declare-fun b!1185425 () Bool)

(declare-fun res!787981 () Bool)

(assert (=> b!1185425 (=> (not res!787981) (not e!673994))))

(assert (=> b!1185425 (= res!787981 (and (= (size!37474 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37473 _keys!1208) (size!37474 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1185426 () Bool)

(declare-fun res!787985 () Bool)

(assert (=> b!1185426 (=> (not res!787985) (not e!673994))))

(assert (=> b!1185426 (= res!787985 (= (select (arr!36937 _keys!1208) i!673) k0!934))))

(declare-fun b!1185427 () Bool)

(declare-fun res!787991 () Bool)

(assert (=> b!1185427 (=> (not res!787991) (not e!673994))))

(assert (=> b!1185427 (= res!787991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185428 () Bool)

(assert (=> b!1185428 (= e!673995 true)))

(declare-fun lt!537990 () ListLongMap!17211)

(declare-fun lt!537992 () ListLongMap!17211)

(assert (=> b!1185428 (= (-!1656 lt!537990 k0!934) lt!537992)))

(declare-fun lt!538002 () V!44979)

(declare-fun lt!537988 () Unit!39268)

(declare-fun addRemoveCommutativeForDiffKeys!181 (ListLongMap!17211 (_ BitVec 64) V!44979 (_ BitVec 64)) Unit!39268)

(assert (=> b!1185428 (= lt!537988 (addRemoveCommutativeForDiffKeys!181 lt!537986 (select (arr!36937 _keys!1208) from!1455) lt!538002 k0!934))))

(declare-fun lt!537999 () ListLongMap!17211)

(assert (=> b!1185428 (and (= lt!537999 lt!537990) (= lt!537984 lt!537997))))

(declare-fun lt!537991 () tuple2!19242)

(declare-fun +!3918 (ListLongMap!17211 tuple2!19242) ListLongMap!17211)

(assert (=> b!1185428 (= lt!537990 (+!3918 lt!537986 lt!537991))))

(assert (=> b!1185428 (not (= (select (arr!36937 _keys!1208) from!1455) k0!934))))

(declare-fun lt!537993 () Unit!39268)

(assert (=> b!1185428 (= lt!537993 e!674000)))

(declare-fun c!117162 () Bool)

(assert (=> b!1185428 (= c!117162 (= (select (arr!36937 _keys!1208) from!1455) k0!934))))

(declare-fun e!673992 () Bool)

(assert (=> b!1185428 e!673992))

(declare-fun res!787992 () Bool)

(assert (=> b!1185428 (=> (not res!787992) (not e!673992))))

(declare-fun lt!537996 () ListLongMap!17211)

(assert (=> b!1185428 (= res!787992 (= lt!537996 lt!537992))))

(assert (=> b!1185428 (= lt!537992 (+!3918 lt!537984 lt!537991))))

(assert (=> b!1185428 (= lt!537991 (tuple2!19243 (select (arr!36937 _keys!1208) from!1455) lt!538002))))

(declare-fun lt!537998 () V!44979)

(declare-fun get!18911 (ValueCell!14235 V!44979) V!44979)

(assert (=> b!1185428 (= lt!538002 (get!18911 (select (arr!36938 _values!996) from!1455) lt!537998))))

(declare-fun b!1185429 () Bool)

(assert (=> b!1185429 (= e!674002 tp_is_empty!29889)))

(declare-fun b!1185430 () Bool)

(declare-fun Unit!39271 () Unit!39268)

(assert (=> b!1185430 (= e!674000 Unit!39271)))

(declare-fun lt!538001 () Unit!39268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76575 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39268)

(assert (=> b!1185430 (= lt!538001 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185430 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!537987 () Unit!39268)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76575 (_ BitVec 32) (_ BitVec 32)) Unit!39268)

(assert (=> b!1185430 (= lt!537987 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185430 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25979)))

(declare-fun lt!538000 () Unit!39268)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76575 (_ BitVec 64) (_ BitVec 32) List!25982) Unit!39268)

(assert (=> b!1185430 (= lt!538000 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25979))))

(assert (=> b!1185430 false))

(declare-fun b!1185431 () Bool)

(declare-fun e!673998 () Bool)

(assert (=> b!1185431 (= e!673998 e!673993)))

(declare-fun res!787980 () Bool)

(assert (=> b!1185431 (=> res!787980 e!673993)))

(assert (=> b!1185431 (= res!787980 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1185431 (= lt!537996 (getCurrentListMapNoExtraKeys!5067 lt!537994 lt!537985 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1185431 (= lt!537985 (array!76578 (store (arr!36938 _values!996) i!673 (ValueCellFull!14235 lt!537998)) (size!37474 _values!996)))))

(declare-fun dynLambda!3018 (Int (_ BitVec 64)) V!44979)

(assert (=> b!1185431 (= lt!537998 (dynLambda!3018 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1185431 (= lt!537999 (getCurrentListMapNoExtraKeys!5067 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185432 () Bool)

(assert (=> b!1185432 (= e!673992 e!673991)))

(declare-fun res!787983 () Bool)

(assert (=> b!1185432 (=> res!787983 e!673991)))

(assert (=> b!1185432 (= res!787983 (not (= (select (arr!36937 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185433 () Bool)

(assert (=> b!1185433 (= e!673999 tp_is_empty!29889)))

(declare-fun b!1185434 () Bool)

(assert (=> b!1185434 (= e!673996 (not e!673998))))

(declare-fun res!787986 () Bool)

(assert (=> b!1185434 (=> res!787986 e!673998)))

(assert (=> b!1185434 (= res!787986 (bvsgt from!1455 i!673))))

(assert (=> b!1185434 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!537989 () Unit!39268)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76575 (_ BitVec 64) (_ BitVec 32)) Unit!39268)

(assert (=> b!1185434 (= lt!537989 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99780 res!787990) b!1185416))

(assert (= (and b!1185416 res!787987) b!1185425))

(assert (= (and b!1185425 res!787981) b!1185427))

(assert (= (and b!1185427 res!787991) b!1185415))

(assert (= (and b!1185415 res!787979) b!1185424))

(assert (= (and b!1185424 res!787989) b!1185417))

(assert (= (and b!1185417 res!787982) b!1185426))

(assert (= (and b!1185426 res!787985) b!1185421))

(assert (= (and b!1185421 res!787993) b!1185418))

(assert (= (and b!1185418 res!787988) b!1185434))

(assert (= (and b!1185434 (not res!787986)) b!1185431))

(assert (= (and b!1185431 (not res!787980)) b!1185420))

(assert (= (and b!1185420 (not res!787984)) b!1185428))

(assert (= (and b!1185428 res!787992) b!1185432))

(assert (= (and b!1185432 (not res!787983)) b!1185419))

(assert (= (and b!1185428 c!117162) b!1185430))

(assert (= (and b!1185428 (not c!117162)) b!1185423))

(assert (= (and b!1185422 condMapEmpty!46661) mapIsEmpty!46661))

(assert (= (and b!1185422 (not condMapEmpty!46661)) mapNonEmpty!46661))

(get-info :version)

(assert (= (and mapNonEmpty!46661 ((_ is ValueCellFull!14235) mapValue!46661)) b!1185433))

(assert (= (and b!1185422 ((_ is ValueCellFull!14235) mapDefault!46661)) b!1185429))

(assert (= start!99780 b!1185422))

(declare-fun b_lambda!20503 () Bool)

(assert (=> (not b_lambda!20503) (not b!1185431)))

(declare-fun t!38332 () Bool)

(declare-fun tb!10171 () Bool)

(assert (=> (and start!99780 (= defaultEntry!1004 defaultEntry!1004) t!38332) tb!10171))

(declare-fun result!20909 () Bool)

(assert (=> tb!10171 (= result!20909 tp_is_empty!29889)))

(assert (=> b!1185431 t!38332))

(declare-fun b_and!41587 () Bool)

(assert (= b_and!41585 (and (=> t!38332 result!20909) b_and!41587)))

(declare-fun m!1093825 () Bool)

(assert (=> b!1185417 m!1093825))

(declare-fun m!1093827 () Bool)

(assert (=> b!1185416 m!1093827))

(declare-fun m!1093829 () Bool)

(assert (=> b!1185428 m!1093829))

(declare-fun m!1093831 () Bool)

(assert (=> b!1185428 m!1093831))

(assert (=> b!1185428 m!1093829))

(declare-fun m!1093833 () Bool)

(assert (=> b!1185428 m!1093833))

(declare-fun m!1093835 () Bool)

(assert (=> b!1185428 m!1093835))

(declare-fun m!1093837 () Bool)

(assert (=> b!1185428 m!1093837))

(declare-fun m!1093839 () Bool)

(assert (=> b!1185428 m!1093839))

(declare-fun m!1093841 () Bool)

(assert (=> b!1185428 m!1093841))

(assert (=> b!1185428 m!1093839))

(declare-fun m!1093843 () Bool)

(assert (=> b!1185419 m!1093843))

(declare-fun m!1093845 () Bool)

(assert (=> start!99780 m!1093845))

(declare-fun m!1093847 () Bool)

(assert (=> start!99780 m!1093847))

(declare-fun m!1093849 () Bool)

(assert (=> b!1185434 m!1093849))

(declare-fun m!1093851 () Bool)

(assert (=> b!1185434 m!1093851))

(declare-fun m!1093853 () Bool)

(assert (=> b!1185420 m!1093853))

(declare-fun m!1093855 () Bool)

(assert (=> b!1185420 m!1093855))

(declare-fun m!1093857 () Bool)

(assert (=> b!1185420 m!1093857))

(declare-fun m!1093859 () Bool)

(assert (=> b!1185420 m!1093859))

(assert (=> b!1185420 m!1093839))

(declare-fun m!1093861 () Bool)

(assert (=> b!1185420 m!1093861))

(assert (=> b!1185420 m!1093839))

(declare-fun m!1093863 () Bool)

(assert (=> b!1185427 m!1093863))

(declare-fun m!1093865 () Bool)

(assert (=> mapNonEmpty!46661 m!1093865))

(declare-fun m!1093867 () Bool)

(assert (=> b!1185421 m!1093867))

(declare-fun m!1093869 () Bool)

(assert (=> b!1185421 m!1093869))

(declare-fun m!1093871 () Bool)

(assert (=> b!1185426 m!1093871))

(assert (=> b!1185432 m!1093839))

(declare-fun m!1093873 () Bool)

(assert (=> b!1185430 m!1093873))

(declare-fun m!1093875 () Bool)

(assert (=> b!1185430 m!1093875))

(declare-fun m!1093877 () Bool)

(assert (=> b!1185430 m!1093877))

(declare-fun m!1093879 () Bool)

(assert (=> b!1185430 m!1093879))

(declare-fun m!1093881 () Bool)

(assert (=> b!1185430 m!1093881))

(declare-fun m!1093883 () Bool)

(assert (=> b!1185415 m!1093883))

(declare-fun m!1093885 () Bool)

(assert (=> b!1185431 m!1093885))

(declare-fun m!1093887 () Bool)

(assert (=> b!1185431 m!1093887))

(declare-fun m!1093889 () Bool)

(assert (=> b!1185431 m!1093889))

(declare-fun m!1093891 () Bool)

(assert (=> b!1185431 m!1093891))

(declare-fun m!1093893 () Bool)

(assert (=> b!1185418 m!1093893))

(check-sat (not b!1185430) (not b!1185420) (not b!1185428) (not mapNonEmpty!46661) (not b!1185431) (not b_next!25359) (not b!1185434) (not b!1185419) b_and!41587 (not b!1185418) (not b!1185417) (not start!99780) (not b!1185416) (not b!1185427) tp_is_empty!29889 (not b!1185421) (not b_lambda!20503) (not b!1185415))
(check-sat b_and!41587 (not b_next!25359))
