; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99790 () Bool)

(assert start!99790)

(declare-fun b_free!25375 () Bool)

(declare-fun b_next!25375 () Bool)

(assert (=> start!99790 (= b_free!25375 (not b_next!25375))))

(declare-fun tp!88838 () Bool)

(declare-fun b_and!41595 () Bool)

(assert (=> start!99790 (= tp!88838 b_and!41595)))

(declare-fun b!1185787 () Bool)

(declare-fun e!674201 () Bool)

(declare-fun e!674211 () Bool)

(assert (=> b!1185787 (= e!674201 e!674211)))

(declare-fun res!788286 () Bool)

(assert (=> b!1185787 (=> res!788286 e!674211)))

(declare-datatypes ((array!76544 0))(
  ( (array!76545 (arr!36922 (Array (_ BitVec 32) (_ BitVec 64))) (size!37460 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76544)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185787 (= res!788286 (not (= (select (arr!36922 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1185788 () Bool)

(declare-fun res!788275 () Bool)

(declare-fun e!674203 () Bool)

(assert (=> b!1185788 (=> (not res!788275) (not e!674203))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185788 (= res!788275 (validKeyInArray!0 k0!934))))

(declare-fun b!1185789 () Bool)

(declare-fun e!674206 () Bool)

(assert (=> b!1185789 (= e!674203 e!674206)))

(declare-fun res!788274 () Bool)

(assert (=> b!1185789 (=> (not res!788274) (not e!674206))))

(declare-fun lt!538261 () array!76544)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76544 (_ BitVec 32)) Bool)

(assert (=> b!1185789 (= res!788274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!538261 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185789 (= lt!538261 (array!76545 (store (arr!36922 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37460 _keys!1208)))))

(declare-fun b!1185790 () Bool)

(declare-fun res!788285 () Bool)

(assert (=> b!1185790 (=> (not res!788285) (not e!674203))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45001 0))(
  ( (V!45002 (val!15009 Int)) )
))
(declare-datatypes ((ValueCell!14243 0))(
  ( (ValueCellFull!14243 (v!17646 V!45001)) (EmptyCell!14243) )
))
(declare-datatypes ((array!76546 0))(
  ( (array!76547 (arr!36923 (Array (_ BitVec 32) ValueCell!14243)) (size!37461 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76546)

(assert (=> b!1185790 (= res!788285 (and (= (size!37461 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37460 _keys!1208) (size!37461 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!788281 () Bool)

(assert (=> start!99790 (=> (not res!788281) (not e!674203))))

(assert (=> start!99790 (= res!788281 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37460 _keys!1208))))))

(assert (=> start!99790 e!674203))

(declare-fun tp_is_empty!29905 () Bool)

(assert (=> start!99790 tp_is_empty!29905))

(declare-fun array_inv!28290 (array!76544) Bool)

(assert (=> start!99790 (array_inv!28290 _keys!1208)))

(assert (=> start!99790 true))

(assert (=> start!99790 tp!88838))

(declare-fun e!674208 () Bool)

(declare-fun array_inv!28291 (array!76546) Bool)

(assert (=> start!99790 (and (array_inv!28291 _values!996) e!674208)))

(declare-fun b!1185791 () Bool)

(declare-fun res!788283 () Bool)

(assert (=> b!1185791 (=> (not res!788283) (not e!674203))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185791 (= res!788283 (validMask!0 mask!1564))))

(declare-fun b!1185792 () Bool)

(declare-fun e!674205 () Bool)

(assert (=> b!1185792 (= e!674205 tp_is_empty!29905)))

(declare-fun b!1185793 () Bool)

(declare-fun res!788280 () Bool)

(assert (=> b!1185793 (=> (not res!788280) (not e!674203))))

(declare-datatypes ((List!26081 0))(
  ( (Nil!26078) (Cons!26077 (h!27286 (_ BitVec 64)) (t!38439 List!26081)) )
))
(declare-fun arrayNoDuplicates!0 (array!76544 (_ BitVec 32) List!26081) Bool)

(assert (=> b!1185793 (= res!788280 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26078))))

(declare-fun b!1185794 () Bool)

(declare-fun e!674204 () Bool)

(declare-fun e!674202 () Bool)

(assert (=> b!1185794 (= e!674204 e!674202)))

(declare-fun res!788287 () Bool)

(assert (=> b!1185794 (=> res!788287 e!674202)))

(assert (=> b!1185794 (= res!788287 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45001)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!538248 () array!76546)

(declare-datatypes ((tuple2!19368 0))(
  ( (tuple2!19369 (_1!9695 (_ BitVec 64)) (_2!9695 V!45001)) )
))
(declare-datatypes ((List!26082 0))(
  ( (Nil!26079) (Cons!26078 (h!27287 tuple2!19368) (t!38440 List!26082)) )
))
(declare-datatypes ((ListLongMap!17337 0))(
  ( (ListLongMap!17338 (toList!8684 List!26082)) )
))
(declare-fun lt!538258 () ListLongMap!17337)

(declare-fun minValue!944 () V!45001)

(declare-fun getCurrentListMapNoExtraKeys!5137 (array!76544 array!76546 (_ BitVec 32) (_ BitVec 32) V!45001 V!45001 (_ BitVec 32) Int) ListLongMap!17337)

(assert (=> b!1185794 (= lt!538258 (getCurrentListMapNoExtraKeys!5137 lt!538261 lt!538248 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!538255 () V!45001)

(assert (=> b!1185794 (= lt!538248 (array!76547 (store (arr!36923 _values!996) i!673 (ValueCellFull!14243 lt!538255)) (size!37461 _values!996)))))

(declare-fun dynLambda!3038 (Int (_ BitVec 64)) V!45001)

(assert (=> b!1185794 (= lt!538255 (dynLambda!3038 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!538264 () ListLongMap!17337)

(assert (=> b!1185794 (= lt!538264 (getCurrentListMapNoExtraKeys!5137 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1185795 () Bool)

(declare-fun res!788279 () Bool)

(assert (=> b!1185795 (=> (not res!788279) (not e!674203))))

(assert (=> b!1185795 (= res!788279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46685 () Bool)

(declare-fun mapRes!46685 () Bool)

(declare-fun tp!88839 () Bool)

(assert (=> mapNonEmpty!46685 (= mapRes!46685 (and tp!88839 e!674205))))

(declare-fun mapRest!46685 () (Array (_ BitVec 32) ValueCell!14243))

(declare-fun mapKey!46685 () (_ BitVec 32))

(declare-fun mapValue!46685 () ValueCell!14243)

(assert (=> mapNonEmpty!46685 (= (arr!36923 _values!996) (store mapRest!46685 mapKey!46685 mapValue!46685))))

(declare-fun b!1185796 () Bool)

(declare-fun res!788277 () Bool)

(assert (=> b!1185796 (=> (not res!788277) (not e!674203))))

(assert (=> b!1185796 (= res!788277 (= (select (arr!36922 _keys!1208) i!673) k0!934))))

(declare-fun b!1185797 () Bool)

(declare-datatypes ((Unit!39166 0))(
  ( (Unit!39167) )
))
(declare-fun e!674209 () Unit!39166)

(declare-fun Unit!39168 () Unit!39166)

(assert (=> b!1185797 (= e!674209 Unit!39168)))

(declare-fun b!1185798 () Bool)

(declare-fun Unit!39169 () Unit!39166)

(assert (=> b!1185798 (= e!674209 Unit!39169)))

(declare-fun lt!538257 () Unit!39166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76544 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39166)

(assert (=> b!1185798 (= lt!538257 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185798 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538265 () Unit!39166)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76544 (_ BitVec 32) (_ BitVec 32)) Unit!39166)

(assert (=> b!1185798 (= lt!538265 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185798 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26078)))

(declare-fun lt!538250 () Unit!39166)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76544 (_ BitVec 64) (_ BitVec 32) List!26081) Unit!39166)

(assert (=> b!1185798 (= lt!538250 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26078))))

(assert (=> b!1185798 false))

(declare-fun b!1185799 () Bool)

(declare-fun e!674210 () Bool)

(assert (=> b!1185799 (= e!674210 true)))

(declare-fun lt!538259 () ListLongMap!17337)

(declare-fun lt!538260 () ListLongMap!17337)

(declare-fun -!1636 (ListLongMap!17337 (_ BitVec 64)) ListLongMap!17337)

(assert (=> b!1185799 (= (-!1636 lt!538259 k0!934) lt!538260)))

(declare-fun lt!538266 () ListLongMap!17337)

(declare-fun lt!538249 () V!45001)

(declare-fun lt!538263 () Unit!39166)

(declare-fun addRemoveCommutativeForDiffKeys!179 (ListLongMap!17337 (_ BitVec 64) V!45001 (_ BitVec 64)) Unit!39166)

(assert (=> b!1185799 (= lt!538263 (addRemoveCommutativeForDiffKeys!179 lt!538266 (select (arr!36922 _keys!1208) from!1455) lt!538249 k0!934))))

(declare-fun lt!538254 () ListLongMap!17337)

(declare-fun lt!538256 () ListLongMap!17337)

(assert (=> b!1185799 (and (= lt!538264 lt!538259) (= lt!538256 lt!538254))))

(declare-fun lt!538262 () tuple2!19368)

(declare-fun +!3965 (ListLongMap!17337 tuple2!19368) ListLongMap!17337)

(assert (=> b!1185799 (= lt!538259 (+!3965 lt!538266 lt!538262))))

(assert (=> b!1185799 (not (= (select (arr!36922 _keys!1208) from!1455) k0!934))))

(declare-fun lt!538252 () Unit!39166)

(assert (=> b!1185799 (= lt!538252 e!674209)))

(declare-fun c!117160 () Bool)

(assert (=> b!1185799 (= c!117160 (= (select (arr!36922 _keys!1208) from!1455) k0!934))))

(assert (=> b!1185799 e!674201))

(declare-fun res!788282 () Bool)

(assert (=> b!1185799 (=> (not res!788282) (not e!674201))))

(assert (=> b!1185799 (= res!788282 (= lt!538258 lt!538260))))

(assert (=> b!1185799 (= lt!538260 (+!3965 lt!538256 lt!538262))))

(assert (=> b!1185799 (= lt!538262 (tuple2!19369 (select (arr!36922 _keys!1208) from!1455) lt!538249))))

(declare-fun get!18912 (ValueCell!14243 V!45001) V!45001)

(assert (=> b!1185799 (= lt!538249 (get!18912 (select (arr!36923 _values!996) from!1455) lt!538255))))

(declare-fun b!1185800 () Bool)

(declare-fun e!674212 () Bool)

(assert (=> b!1185800 (= e!674212 tp_is_empty!29905)))

(declare-fun b!1185801 () Bool)

(declare-fun res!788276 () Bool)

(assert (=> b!1185801 (=> (not res!788276) (not e!674203))))

(assert (=> b!1185801 (= res!788276 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37460 _keys!1208))))))

(declare-fun b!1185802 () Bool)

(assert (=> b!1185802 (= e!674202 e!674210)))

(declare-fun res!788278 () Bool)

(assert (=> b!1185802 (=> res!788278 e!674210)))

(assert (=> b!1185802 (= res!788278 (not (validKeyInArray!0 (select (arr!36922 _keys!1208) from!1455))))))

(assert (=> b!1185802 (= lt!538254 lt!538256)))

(assert (=> b!1185802 (= lt!538256 (-!1636 lt!538266 k0!934))))

(assert (=> b!1185802 (= lt!538254 (getCurrentListMapNoExtraKeys!5137 lt!538261 lt!538248 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1185802 (= lt!538266 (getCurrentListMapNoExtraKeys!5137 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!538253 () Unit!39166)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!894 (array!76544 array!76546 (_ BitVec 32) (_ BitVec 32) V!45001 V!45001 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39166)

(assert (=> b!1185802 (= lt!538253 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!894 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1185803 () Bool)

(assert (=> b!1185803 (= e!674211 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1185804 () Bool)

(assert (=> b!1185804 (= e!674206 (not e!674204))))

(declare-fun res!788284 () Bool)

(assert (=> b!1185804 (=> res!788284 e!674204)))

(assert (=> b!1185804 (= res!788284 (bvsgt from!1455 i!673))))

(assert (=> b!1185804 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!538251 () Unit!39166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76544 (_ BitVec 64) (_ BitVec 32)) Unit!39166)

(assert (=> b!1185804 (= lt!538251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!46685 () Bool)

(assert (=> mapIsEmpty!46685 mapRes!46685))

(declare-fun b!1185805 () Bool)

(assert (=> b!1185805 (= e!674208 (and e!674212 mapRes!46685))))

(declare-fun condMapEmpty!46685 () Bool)

(declare-fun mapDefault!46685 () ValueCell!14243)

(assert (=> b!1185805 (= condMapEmpty!46685 (= (arr!36923 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14243)) mapDefault!46685)))))

(declare-fun b!1185806 () Bool)

(declare-fun res!788273 () Bool)

(assert (=> b!1185806 (=> (not res!788273) (not e!674206))))

(assert (=> b!1185806 (= res!788273 (arrayNoDuplicates!0 lt!538261 #b00000000000000000000000000000000 Nil!26078))))

(assert (= (and start!99790 res!788281) b!1185791))

(assert (= (and b!1185791 res!788283) b!1185790))

(assert (= (and b!1185790 res!788285) b!1185795))

(assert (= (and b!1185795 res!788279) b!1185793))

(assert (= (and b!1185793 res!788280) b!1185801))

(assert (= (and b!1185801 res!788276) b!1185788))

(assert (= (and b!1185788 res!788275) b!1185796))

(assert (= (and b!1185796 res!788277) b!1185789))

(assert (= (and b!1185789 res!788274) b!1185806))

(assert (= (and b!1185806 res!788273) b!1185804))

(assert (= (and b!1185804 (not res!788284)) b!1185794))

(assert (= (and b!1185794 (not res!788287)) b!1185802))

(assert (= (and b!1185802 (not res!788278)) b!1185799))

(assert (= (and b!1185799 res!788282) b!1185787))

(assert (= (and b!1185787 (not res!788286)) b!1185803))

(assert (= (and b!1185799 c!117160) b!1185798))

(assert (= (and b!1185799 (not c!117160)) b!1185797))

(assert (= (and b!1185805 condMapEmpty!46685) mapIsEmpty!46685))

(assert (= (and b!1185805 (not condMapEmpty!46685)) mapNonEmpty!46685))

(get-info :version)

(assert (= (and mapNonEmpty!46685 ((_ is ValueCellFull!14243) mapValue!46685)) b!1185792))

(assert (= (and b!1185805 ((_ is ValueCellFull!14243) mapDefault!46685)) b!1185800))

(assert (= start!99790 b!1185805))

(declare-fun b_lambda!20501 () Bool)

(assert (=> (not b_lambda!20501) (not b!1185794)))

(declare-fun t!38438 () Bool)

(declare-fun tb!10179 () Bool)

(assert (=> (and start!99790 (= defaultEntry!1004 defaultEntry!1004) t!38438) tb!10179))

(declare-fun result!20933 () Bool)

(assert (=> tb!10179 (= result!20933 tp_is_empty!29905)))

(assert (=> b!1185794 t!38438))

(declare-fun b_and!41597 () Bool)

(assert (= b_and!41595 (and (=> t!38438 result!20933) b_and!41597)))

(declare-fun m!1093775 () Bool)

(assert (=> b!1185796 m!1093775))

(declare-fun m!1093777 () Bool)

(assert (=> b!1185793 m!1093777))

(declare-fun m!1093779 () Bool)

(assert (=> b!1185787 m!1093779))

(declare-fun m!1093781 () Bool)

(assert (=> b!1185799 m!1093781))

(declare-fun m!1093783 () Bool)

(assert (=> b!1185799 m!1093783))

(assert (=> b!1185799 m!1093779))

(declare-fun m!1093785 () Bool)

(assert (=> b!1185799 m!1093785))

(declare-fun m!1093787 () Bool)

(assert (=> b!1185799 m!1093787))

(assert (=> b!1185799 m!1093779))

(declare-fun m!1093789 () Bool)

(assert (=> b!1185799 m!1093789))

(assert (=> b!1185799 m!1093781))

(declare-fun m!1093791 () Bool)

(assert (=> b!1185799 m!1093791))

(declare-fun m!1093793 () Bool)

(assert (=> b!1185803 m!1093793))

(declare-fun m!1093795 () Bool)

(assert (=> b!1185798 m!1093795))

(declare-fun m!1093797 () Bool)

(assert (=> b!1185798 m!1093797))

(declare-fun m!1093799 () Bool)

(assert (=> b!1185798 m!1093799))

(declare-fun m!1093801 () Bool)

(assert (=> b!1185798 m!1093801))

(declare-fun m!1093803 () Bool)

(assert (=> b!1185798 m!1093803))

(declare-fun m!1093805 () Bool)

(assert (=> b!1185804 m!1093805))

(declare-fun m!1093807 () Bool)

(assert (=> b!1185804 m!1093807))

(declare-fun m!1093809 () Bool)

(assert (=> b!1185794 m!1093809))

(declare-fun m!1093811 () Bool)

(assert (=> b!1185794 m!1093811))

(declare-fun m!1093813 () Bool)

(assert (=> b!1185794 m!1093813))

(declare-fun m!1093815 () Bool)

(assert (=> b!1185794 m!1093815))

(declare-fun m!1093817 () Bool)

(assert (=> b!1185789 m!1093817))

(declare-fun m!1093819 () Bool)

(assert (=> b!1185789 m!1093819))

(declare-fun m!1093821 () Bool)

(assert (=> mapNonEmpty!46685 m!1093821))

(declare-fun m!1093823 () Bool)

(assert (=> b!1185788 m!1093823))

(declare-fun m!1093825 () Bool)

(assert (=> b!1185802 m!1093825))

(declare-fun m!1093827 () Bool)

(assert (=> b!1185802 m!1093827))

(declare-fun m!1093829 () Bool)

(assert (=> b!1185802 m!1093829))

(declare-fun m!1093831 () Bool)

(assert (=> b!1185802 m!1093831))

(assert (=> b!1185802 m!1093779))

(declare-fun m!1093833 () Bool)

(assert (=> b!1185802 m!1093833))

(assert (=> b!1185802 m!1093779))

(declare-fun m!1093835 () Bool)

(assert (=> b!1185791 m!1093835))

(declare-fun m!1093837 () Bool)

(assert (=> start!99790 m!1093837))

(declare-fun m!1093839 () Bool)

(assert (=> start!99790 m!1093839))

(declare-fun m!1093841 () Bool)

(assert (=> b!1185806 m!1093841))

(declare-fun m!1093843 () Bool)

(assert (=> b!1185795 m!1093843))

(check-sat (not b!1185793) (not start!99790) (not b_lambda!20501) (not b!1185791) (not b!1185798) (not b!1185795) (not b_next!25375) (not b!1185789) (not mapNonEmpty!46685) tp_is_empty!29905 (not b!1185803) (not b!1185788) (not b!1185806) (not b!1185799) (not b!1185794) b_and!41597 (not b!1185802) (not b!1185804))
(check-sat b_and!41597 (not b_next!25375))
