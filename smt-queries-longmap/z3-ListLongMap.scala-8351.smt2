; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101650 () Bool)

(assert start!101650)

(declare-fun b_free!26377 () Bool)

(declare-fun b_next!26377 () Bool)

(assert (=> start!101650 (= b_free!26377 (not b_next!26377))))

(declare-fun tp!92174 () Bool)

(declare-fun b_and!43979 () Bool)

(assert (=> start!101650 (= tp!92174 b_and!43979)))

(declare-fun b!1222805 () Bool)

(declare-fun e!694454 () Bool)

(declare-fun e!694447 () Bool)

(assert (=> b!1222805 (= e!694454 (not e!694447))))

(declare-fun res!812488 () Bool)

(assert (=> b!1222805 (=> res!812488 e!694447)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1222805 (= res!812488 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78866 0))(
  ( (array!78867 (arr!38061 (Array (_ BitVec 32) (_ BitVec 64))) (size!38599 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78866)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1222805 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40354 0))(
  ( (Unit!40355) )
))
(declare-fun lt!556312 () Unit!40354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78866 (_ BitVec 64) (_ BitVec 32)) Unit!40354)

(assert (=> b!1222805 (= lt!556312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222806 () Bool)

(declare-fun e!694450 () Bool)

(declare-fun e!694451 () Bool)

(declare-fun mapRes!48517 () Bool)

(assert (=> b!1222806 (= e!694450 (and e!694451 mapRes!48517))))

(declare-fun condMapEmpty!48517 () Bool)

(declare-datatypes ((V!46569 0))(
  ( (V!46570 (val!15597 Int)) )
))
(declare-datatypes ((ValueCell!14831 0))(
  ( (ValueCellFull!14831 (v!18257 V!46569)) (EmptyCell!14831) )
))
(declare-datatypes ((array!78868 0))(
  ( (array!78869 (arr!38062 (Array (_ BitVec 32) ValueCell!14831)) (size!38600 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78868)

(declare-fun mapDefault!48517 () ValueCell!14831)

(assert (=> b!1222806 (= condMapEmpty!48517 (= (arr!38062 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14831)) mapDefault!48517)))))

(declare-fun b!1222807 () Bool)

(declare-fun res!812497 () Bool)

(declare-fun e!694456 () Bool)

(assert (=> b!1222807 (=> (not res!812497) (not e!694456))))

(assert (=> b!1222807 (= res!812497 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38599 _keys!1208))))))

(declare-fun b!1222808 () Bool)

(declare-fun res!812489 () Bool)

(assert (=> b!1222808 (=> (not res!812489) (not e!694456))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78866 (_ BitVec 32)) Bool)

(assert (=> b!1222808 (= res!812489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1222809 () Bool)

(declare-fun res!812494 () Bool)

(assert (=> b!1222809 (=> (not res!812494) (not e!694456))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1222809 (= res!812494 (validKeyInArray!0 k0!934))))

(declare-fun b!1222810 () Bool)

(declare-fun res!812492 () Bool)

(assert (=> b!1222810 (=> (not res!812492) (not e!694456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1222810 (= res!812492 (validMask!0 mask!1564))))

(declare-fun b!1222811 () Bool)

(declare-fun e!694448 () Unit!40354)

(declare-fun Unit!40356 () Unit!40354)

(assert (=> b!1222811 (= e!694448 Unit!40356)))

(declare-fun lt!556317 () Unit!40354)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78866 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40354)

(assert (=> b!1222811 (= lt!556317 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1222811 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!556322 () Unit!40354)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78866 (_ BitVec 32) (_ BitVec 32)) Unit!40354)

(assert (=> b!1222811 (= lt!556322 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!26953 0))(
  ( (Nil!26950) (Cons!26949 (h!28158 (_ BitVec 64)) (t!40301 List!26953)) )
))
(declare-fun arrayNoDuplicates!0 (array!78866 (_ BitVec 32) List!26953) Bool)

(assert (=> b!1222811 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26950)))

(declare-fun lt!556319 () Unit!40354)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!78866 (_ BitVec 64) (_ BitVec 32) List!26953) Unit!40354)

(assert (=> b!1222811 (= lt!556319 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26950))))

(assert (=> b!1222811 false))

(declare-fun mapIsEmpty!48517 () Bool)

(assert (=> mapIsEmpty!48517 mapRes!48517))

(declare-fun b!1222812 () Bool)

(declare-fun e!694455 () Bool)

(declare-fun e!694458 () Bool)

(assert (=> b!1222812 (= e!694455 e!694458)))

(declare-fun res!812483 () Bool)

(assert (=> b!1222812 (=> res!812483 e!694458)))

(assert (=> b!1222812 (= res!812483 (not (= (select (arr!38061 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1222813 () Bool)

(assert (=> b!1222813 (= e!694458 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1222814 () Bool)

(declare-fun res!812491 () Bool)

(assert (=> b!1222814 (=> (not res!812491) (not e!694456))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1222814 (= res!812491 (and (= (size!38600 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38599 _keys!1208) (size!38600 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1222815 () Bool)

(declare-fun e!694452 () Bool)

(assert (=> b!1222815 (= e!694452 (bvslt from!1455 (size!38600 _values!996)))))

(assert (=> b!1222815 (not (= (select (arr!38061 _keys!1208) from!1455) k0!934))))

(declare-fun lt!556315 () Unit!40354)

(assert (=> b!1222815 (= lt!556315 e!694448)))

(declare-fun c!120326 () Bool)

(assert (=> b!1222815 (= c!120326 (= (select (arr!38061 _keys!1208) from!1455) k0!934))))

(assert (=> b!1222815 e!694455))

(declare-fun res!812484 () Bool)

(assert (=> b!1222815 (=> (not res!812484) (not e!694455))))

(declare-datatypes ((tuple2!20174 0))(
  ( (tuple2!20175 (_1!10098 (_ BitVec 64)) (_2!10098 V!46569)) )
))
(declare-datatypes ((List!26954 0))(
  ( (Nil!26951) (Cons!26950 (h!28159 tuple2!20174) (t!40302 List!26954)) )
))
(declare-datatypes ((ListLongMap!18143 0))(
  ( (ListLongMap!18144 (toList!9087 List!26954)) )
))
(declare-fun lt!556321 () ListLongMap!18143)

(declare-fun lt!556316 () ListLongMap!18143)

(declare-fun lt!556323 () V!46569)

(declare-fun +!4149 (ListLongMap!18143 tuple2!20174) ListLongMap!18143)

(declare-fun get!19448 (ValueCell!14831 V!46569) V!46569)

(assert (=> b!1222815 (= res!812484 (= lt!556321 (+!4149 lt!556316 (tuple2!20175 (select (arr!38061 _keys!1208) from!1455) (get!19448 (select (arr!38062 _values!996) from!1455) lt!556323)))))))

(declare-fun b!1222816 () Bool)

(declare-fun tp_is_empty!31081 () Bool)

(assert (=> b!1222816 (= e!694451 tp_is_empty!31081)))

(declare-fun b!1222817 () Bool)

(declare-fun res!812490 () Bool)

(assert (=> b!1222817 (=> (not res!812490) (not e!694456))))

(assert (=> b!1222817 (= res!812490 (= (select (arr!38061 _keys!1208) i!673) k0!934))))

(declare-fun b!1222818 () Bool)

(declare-fun res!812496 () Bool)

(assert (=> b!1222818 (=> (not res!812496) (not e!694456))))

(assert (=> b!1222818 (= res!812496 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26950))))

(declare-fun res!812486 () Bool)

(assert (=> start!101650 (=> (not res!812486) (not e!694456))))

(assert (=> start!101650 (= res!812486 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38599 _keys!1208))))))

(assert (=> start!101650 e!694456))

(assert (=> start!101650 tp_is_empty!31081))

(declare-fun array_inv!29086 (array!78866) Bool)

(assert (=> start!101650 (array_inv!29086 _keys!1208)))

(assert (=> start!101650 true))

(assert (=> start!101650 tp!92174))

(declare-fun array_inv!29087 (array!78868) Bool)

(assert (=> start!101650 (and (array_inv!29087 _values!996) e!694450)))

(declare-fun b!1222819 () Bool)

(assert (=> b!1222819 (= e!694456 e!694454)))

(declare-fun res!812493 () Bool)

(assert (=> b!1222819 (=> (not res!812493) (not e!694454))))

(declare-fun lt!556313 () array!78866)

(assert (=> b!1222819 (= res!812493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556313 mask!1564))))

(assert (=> b!1222819 (= lt!556313 (array!78867 (store (arr!38061 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38599 _keys!1208)))))

(declare-fun b!1222820 () Bool)

(declare-fun e!694453 () Bool)

(assert (=> b!1222820 (= e!694447 e!694453)))

(declare-fun res!812495 () Bool)

(assert (=> b!1222820 (=> res!812495 e!694453)))

(assert (=> b!1222820 (= res!812495 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46569)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!46569)

(declare-fun lt!556311 () array!78868)

(declare-fun getCurrentListMapNoExtraKeys!5519 (array!78866 array!78868 (_ BitVec 32) (_ BitVec 32) V!46569 V!46569 (_ BitVec 32) Int) ListLongMap!18143)

(assert (=> b!1222820 (= lt!556321 (getCurrentListMapNoExtraKeys!5519 lt!556313 lt!556311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1222820 (= lt!556311 (array!78869 (store (arr!38062 _values!996) i!673 (ValueCellFull!14831 lt!556323)) (size!38600 _values!996)))))

(declare-fun dynLambda!3367 (Int (_ BitVec 64)) V!46569)

(assert (=> b!1222820 (= lt!556323 (dynLambda!3367 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!556314 () ListLongMap!18143)

(assert (=> b!1222820 (= lt!556314 (getCurrentListMapNoExtraKeys!5519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48517 () Bool)

(declare-fun tp!92173 () Bool)

(declare-fun e!694457 () Bool)

(assert (=> mapNonEmpty!48517 (= mapRes!48517 (and tp!92173 e!694457))))

(declare-fun mapKey!48517 () (_ BitVec 32))

(declare-fun mapValue!48517 () ValueCell!14831)

(declare-fun mapRest!48517 () (Array (_ BitVec 32) ValueCell!14831))

(assert (=> mapNonEmpty!48517 (= (arr!38062 _values!996) (store mapRest!48517 mapKey!48517 mapValue!48517))))

(declare-fun b!1222821 () Bool)

(assert (=> b!1222821 (= e!694453 e!694452)))

(declare-fun res!812485 () Bool)

(assert (=> b!1222821 (=> res!812485 e!694452)))

(assert (=> b!1222821 (= res!812485 (not (validKeyInArray!0 (select (arr!38061 _keys!1208) from!1455))))))

(declare-fun lt!556318 () ListLongMap!18143)

(assert (=> b!1222821 (= lt!556318 lt!556316)))

(declare-fun lt!556320 () ListLongMap!18143)

(declare-fun -!1910 (ListLongMap!18143 (_ BitVec 64)) ListLongMap!18143)

(assert (=> b!1222821 (= lt!556316 (-!1910 lt!556320 k0!934))))

(assert (=> b!1222821 (= lt!556318 (getCurrentListMapNoExtraKeys!5519 lt!556313 lt!556311 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1222821 (= lt!556320 (getCurrentListMapNoExtraKeys!5519 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!556310 () Unit!40354)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1145 (array!78866 array!78868 (_ BitVec 32) (_ BitVec 32) V!46569 V!46569 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40354)

(assert (=> b!1222821 (= lt!556310 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1145 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1222822 () Bool)

(declare-fun Unit!40357 () Unit!40354)

(assert (=> b!1222822 (= e!694448 Unit!40357)))

(declare-fun b!1222823 () Bool)

(declare-fun res!812487 () Bool)

(assert (=> b!1222823 (=> (not res!812487) (not e!694454))))

(assert (=> b!1222823 (= res!812487 (arrayNoDuplicates!0 lt!556313 #b00000000000000000000000000000000 Nil!26950))))

(declare-fun b!1222824 () Bool)

(assert (=> b!1222824 (= e!694457 tp_is_empty!31081)))

(assert (= (and start!101650 res!812486) b!1222810))

(assert (= (and b!1222810 res!812492) b!1222814))

(assert (= (and b!1222814 res!812491) b!1222808))

(assert (= (and b!1222808 res!812489) b!1222818))

(assert (= (and b!1222818 res!812496) b!1222807))

(assert (= (and b!1222807 res!812497) b!1222809))

(assert (= (and b!1222809 res!812494) b!1222817))

(assert (= (and b!1222817 res!812490) b!1222819))

(assert (= (and b!1222819 res!812493) b!1222823))

(assert (= (and b!1222823 res!812487) b!1222805))

(assert (= (and b!1222805 (not res!812488)) b!1222820))

(assert (= (and b!1222820 (not res!812495)) b!1222821))

(assert (= (and b!1222821 (not res!812485)) b!1222815))

(assert (= (and b!1222815 res!812484) b!1222812))

(assert (= (and b!1222812 (not res!812483)) b!1222813))

(assert (= (and b!1222815 c!120326) b!1222811))

(assert (= (and b!1222815 (not c!120326)) b!1222822))

(assert (= (and b!1222806 condMapEmpty!48517) mapIsEmpty!48517))

(assert (= (and b!1222806 (not condMapEmpty!48517)) mapNonEmpty!48517))

(get-info :version)

(assert (= (and mapNonEmpty!48517 ((_ is ValueCellFull!14831) mapValue!48517)) b!1222824))

(assert (= (and b!1222806 ((_ is ValueCellFull!14831) mapDefault!48517)) b!1222816))

(assert (= start!101650 b!1222806))

(declare-fun b_lambda!22309 () Bool)

(assert (=> (not b_lambda!22309) (not b!1222820)))

(declare-fun t!40300 () Bool)

(declare-fun tb!11169 () Bool)

(assert (=> (and start!101650 (= defaultEntry!1004 defaultEntry!1004) t!40300) tb!11169))

(declare-fun result!22957 () Bool)

(assert (=> tb!11169 (= result!22957 tp_is_empty!31081)))

(assert (=> b!1222820 t!40300))

(declare-fun b_and!43981 () Bool)

(assert (= b_and!43979 (and (=> t!40300 result!22957) b_and!43981)))

(declare-fun m!1127297 () Bool)

(assert (=> b!1222813 m!1127297))

(declare-fun m!1127299 () Bool)

(assert (=> b!1222821 m!1127299))

(declare-fun m!1127301 () Bool)

(assert (=> b!1222821 m!1127301))

(declare-fun m!1127303 () Bool)

(assert (=> b!1222821 m!1127303))

(declare-fun m!1127305 () Bool)

(assert (=> b!1222821 m!1127305))

(declare-fun m!1127307 () Bool)

(assert (=> b!1222821 m!1127307))

(declare-fun m!1127309 () Bool)

(assert (=> b!1222821 m!1127309))

(assert (=> b!1222821 m!1127307))

(declare-fun m!1127311 () Bool)

(assert (=> b!1222810 m!1127311))

(assert (=> b!1222815 m!1127307))

(declare-fun m!1127313 () Bool)

(assert (=> b!1222815 m!1127313))

(assert (=> b!1222815 m!1127313))

(declare-fun m!1127315 () Bool)

(assert (=> b!1222815 m!1127315))

(declare-fun m!1127317 () Bool)

(assert (=> b!1222815 m!1127317))

(declare-fun m!1127319 () Bool)

(assert (=> b!1222820 m!1127319))

(declare-fun m!1127321 () Bool)

(assert (=> b!1222820 m!1127321))

(declare-fun m!1127323 () Bool)

(assert (=> b!1222820 m!1127323))

(declare-fun m!1127325 () Bool)

(assert (=> b!1222820 m!1127325))

(declare-fun m!1127327 () Bool)

(assert (=> b!1222808 m!1127327))

(declare-fun m!1127329 () Bool)

(assert (=> mapNonEmpty!48517 m!1127329))

(declare-fun m!1127331 () Bool)

(assert (=> b!1222805 m!1127331))

(declare-fun m!1127333 () Bool)

(assert (=> b!1222805 m!1127333))

(declare-fun m!1127335 () Bool)

(assert (=> b!1222809 m!1127335))

(declare-fun m!1127337 () Bool)

(assert (=> b!1222811 m!1127337))

(declare-fun m!1127339 () Bool)

(assert (=> b!1222811 m!1127339))

(declare-fun m!1127341 () Bool)

(assert (=> b!1222811 m!1127341))

(declare-fun m!1127343 () Bool)

(assert (=> b!1222811 m!1127343))

(declare-fun m!1127345 () Bool)

(assert (=> b!1222811 m!1127345))

(declare-fun m!1127347 () Bool)

(assert (=> b!1222823 m!1127347))

(declare-fun m!1127349 () Bool)

(assert (=> b!1222818 m!1127349))

(assert (=> b!1222812 m!1127307))

(declare-fun m!1127351 () Bool)

(assert (=> b!1222817 m!1127351))

(declare-fun m!1127353 () Bool)

(assert (=> b!1222819 m!1127353))

(declare-fun m!1127355 () Bool)

(assert (=> b!1222819 m!1127355))

(declare-fun m!1127357 () Bool)

(assert (=> start!101650 m!1127357))

(declare-fun m!1127359 () Bool)

(assert (=> start!101650 m!1127359))

(check-sat (not b!1222809) (not b!1222821) (not mapNonEmpty!48517) (not b!1222813) (not b!1222810) (not b!1222819) (not b!1222815) (not b!1222811) (not b!1222805) (not b_lambda!22309) (not b!1222808) (not b!1222823) (not b_next!26377) (not b!1222820) (not b!1222818) tp_is_empty!31081 (not start!101650) b_and!43981)
(check-sat b_and!43981 (not b_next!26377))
