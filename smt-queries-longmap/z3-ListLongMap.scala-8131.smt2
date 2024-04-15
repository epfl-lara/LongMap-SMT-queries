; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99646 () Bool)

(assert start!99646)

(declare-fun b_free!25231 () Bool)

(declare-fun b_next!25231 () Bool)

(assert (=> start!99646 (= b_free!25231 (not b_next!25231))))

(declare-fun tp!88406 () Bool)

(declare-fun b_and!41307 () Bool)

(assert (=> start!99646 (= tp!88406 b_and!41307)))

(declare-fun b!1181309 () Bool)

(declare-datatypes ((array!76256 0))(
  ( (array!76257 (arr!36778 (Array (_ BitVec 32) (_ BitVec 64))) (size!37316 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76256)

(declare-fun e!671613 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76256 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1181309 (= e!671613 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181310 () Bool)

(declare-fun res!785023 () Bool)

(declare-fun e!671609 () Bool)

(assert (=> b!1181310 (=> (not res!785023) (not e!671609))))

(assert (=> b!1181310 (= res!785023 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37316 _keys!1208))))))

(declare-fun b!1181311 () Bool)

(declare-fun res!785028 () Bool)

(assert (=> b!1181311 (=> (not res!785028) (not e!671609))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44809 0))(
  ( (V!44810 (val!14937 Int)) )
))
(declare-datatypes ((ValueCell!14171 0))(
  ( (ValueCellFull!14171 (v!17574 V!44809)) (EmptyCell!14171) )
))
(declare-datatypes ((array!76258 0))(
  ( (array!76259 (arr!36779 (Array (_ BitVec 32) ValueCell!14171)) (size!37317 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76258)

(assert (=> b!1181311 (= res!785028 (and (= (size!37317 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37316 _keys!1208) (size!37317 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1181312 () Bool)

(declare-fun res!785031 () Bool)

(assert (=> b!1181312 (=> (not res!785031) (not e!671609))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1181312 (= res!785031 (validKeyInArray!0 k0!934))))

(declare-fun b!1181313 () Bool)

(declare-fun res!785020 () Bool)

(declare-fun e!671614 () Bool)

(assert (=> b!1181313 (=> (not res!785020) (not e!671614))))

(declare-datatypes ((tuple2!19244 0))(
  ( (tuple2!19245 (_1!9633 (_ BitVec 64)) (_2!9633 V!44809)) )
))
(declare-fun lt!534176 () tuple2!19244)

(declare-datatypes ((List!25950 0))(
  ( (Nil!25947) (Cons!25946 (h!27155 tuple2!19244) (t!38164 List!25950)) )
))
(declare-datatypes ((ListLongMap!17213 0))(
  ( (ListLongMap!17214 (toList!8622 List!25950)) )
))
(declare-fun lt!534179 () ListLongMap!17213)

(declare-fun lt!534181 () ListLongMap!17213)

(declare-fun +!3919 (ListLongMap!17213 tuple2!19244) ListLongMap!17213)

(assert (=> b!1181313 (= res!785020 (= lt!534181 (+!3919 lt!534179 lt!534176)))))

(declare-fun mapIsEmpty!46469 () Bool)

(declare-fun mapRes!46469 () Bool)

(assert (=> mapIsEmpty!46469 mapRes!46469))

(declare-fun b!1181314 () Bool)

(declare-fun e!671612 () Bool)

(declare-fun tp_is_empty!29761 () Bool)

(assert (=> b!1181314 (= e!671612 tp_is_empty!29761)))

(declare-fun b!1181315 () Bool)

(declare-fun lt!534182 () ListLongMap!17213)

(declare-fun lt!534174 () ListLongMap!17213)

(assert (=> b!1181315 (= e!671614 (= lt!534182 lt!534174))))

(declare-fun b!1181316 () Bool)

(declare-fun e!671604 () Bool)

(declare-fun e!671607 () Bool)

(assert (=> b!1181316 (= e!671604 (and e!671607 mapRes!46469))))

(declare-fun condMapEmpty!46469 () Bool)

(declare-fun mapDefault!46469 () ValueCell!14171)

(assert (=> b!1181316 (= condMapEmpty!46469 (= (arr!36779 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14171)) mapDefault!46469)))))

(declare-fun b!1181317 () Bool)

(declare-fun e!671603 () Bool)

(declare-fun e!671608 () Bool)

(assert (=> b!1181317 (= e!671603 e!671608)))

(declare-fun res!785030 () Bool)

(assert (=> b!1181317 (=> res!785030 e!671608)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1181317 (= res!785030 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44809)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!534178 () array!76256)

(declare-fun minValue!944 () V!44809)

(declare-fun lt!534173 () ListLongMap!17213)

(declare-fun lt!534186 () array!76258)

(declare-fun getCurrentListMapNoExtraKeys!5077 (array!76256 array!76258 (_ BitVec 32) (_ BitVec 32) V!44809 V!44809 (_ BitVec 32) Int) ListLongMap!17213)

(assert (=> b!1181317 (= lt!534173 (getCurrentListMapNoExtraKeys!5077 lt!534178 lt!534186 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!534185 () V!44809)

(assert (=> b!1181317 (= lt!534186 (array!76259 (store (arr!36779 _values!996) i!673 (ValueCellFull!14171 lt!534185)) (size!37317 _values!996)))))

(declare-fun dynLambda!2986 (Int (_ BitVec 64)) V!44809)

(assert (=> b!1181317 (= lt!534185 (dynLambda!2986 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1181317 (= lt!534181 (getCurrentListMapNoExtraKeys!5077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1181318 () Bool)

(declare-datatypes ((Unit!38910 0))(
  ( (Unit!38911) )
))
(declare-fun e!671605 () Unit!38910)

(declare-fun Unit!38912 () Unit!38910)

(assert (=> b!1181318 (= e!671605 Unit!38912)))

(declare-fun b!1181319 () Bool)

(declare-fun e!671606 () Bool)

(assert (=> b!1181319 (= e!671609 e!671606)))

(declare-fun res!785032 () Bool)

(assert (=> b!1181319 (=> (not res!785032) (not e!671606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76256 (_ BitVec 32)) Bool)

(assert (=> b!1181319 (= res!785032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!534178 mask!1564))))

(assert (=> b!1181319 (= lt!534178 (array!76257 (store (arr!36778 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37316 _keys!1208)))))

(declare-fun b!1181320 () Bool)

(declare-fun res!785025 () Bool)

(assert (=> b!1181320 (=> (not res!785025) (not e!671609))))

(assert (=> b!1181320 (= res!785025 (= (select (arr!36778 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46469 () Bool)

(declare-fun tp!88407 () Bool)

(assert (=> mapNonEmpty!46469 (= mapRes!46469 (and tp!88407 e!671612))))

(declare-fun mapRest!46469 () (Array (_ BitVec 32) ValueCell!14171))

(declare-fun mapKey!46469 () (_ BitVec 32))

(declare-fun mapValue!46469 () ValueCell!14171)

(assert (=> mapNonEmpty!46469 (= (arr!36779 _values!996) (store mapRest!46469 mapKey!46469 mapValue!46469))))

(declare-fun res!785034 () Bool)

(assert (=> start!99646 (=> (not res!785034) (not e!671609))))

(assert (=> start!99646 (= res!785034 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37316 _keys!1208))))))

(assert (=> start!99646 e!671609))

(assert (=> start!99646 tp_is_empty!29761))

(declare-fun array_inv!28190 (array!76256) Bool)

(assert (=> start!99646 (array_inv!28190 _keys!1208)))

(assert (=> start!99646 true))

(assert (=> start!99646 tp!88406))

(declare-fun array_inv!28191 (array!76258) Bool)

(assert (=> start!99646 (and (array_inv!28191 _values!996) e!671604)))

(declare-fun b!1181321 () Bool)

(declare-fun res!785021 () Bool)

(assert (=> b!1181321 (=> (not res!785021) (not e!671606))))

(declare-datatypes ((List!25951 0))(
  ( (Nil!25948) (Cons!25947 (h!27156 (_ BitVec 64)) (t!38165 List!25951)) )
))
(declare-fun arrayNoDuplicates!0 (array!76256 (_ BitVec 32) List!25951) Bool)

(assert (=> b!1181321 (= res!785021 (arrayNoDuplicates!0 lt!534178 #b00000000000000000000000000000000 Nil!25948))))

(declare-fun b!1181322 () Bool)

(declare-fun Unit!38913 () Unit!38910)

(assert (=> b!1181322 (= e!671605 Unit!38913)))

(declare-fun lt!534180 () Unit!38910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76256 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38910)

(assert (=> b!1181322 (= lt!534180 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1181322 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!534183 () Unit!38910)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76256 (_ BitVec 32) (_ BitVec 32)) Unit!38910)

(assert (=> b!1181322 (= lt!534183 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1181322 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25948)))

(declare-fun lt!534175 () Unit!38910)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76256 (_ BitVec 64) (_ BitVec 32) List!25951) Unit!38910)

(assert (=> b!1181322 (= lt!534175 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25948))))

(assert (=> b!1181322 false))

(declare-fun b!1181323 () Bool)

(declare-fun res!785026 () Bool)

(assert (=> b!1181323 (=> (not res!785026) (not e!671609))))

(assert (=> b!1181323 (= res!785026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1181324 () Bool)

(declare-fun e!671602 () Bool)

(assert (=> b!1181324 (= e!671602 e!671613)))

(declare-fun res!785035 () Bool)

(assert (=> b!1181324 (=> res!785035 e!671613)))

(assert (=> b!1181324 (= res!785035 (not (= (select (arr!36778 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1181325 () Bool)

(assert (=> b!1181325 (= e!671607 tp_is_empty!29761)))

(declare-fun b!1181326 () Bool)

(assert (=> b!1181326 (= e!671606 (not e!671603))))

(declare-fun res!785024 () Bool)

(assert (=> b!1181326 (=> res!785024 e!671603)))

(assert (=> b!1181326 (= res!785024 (bvsgt from!1455 i!673))))

(assert (=> b!1181326 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!534172 () Unit!38910)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76256 (_ BitVec 64) (_ BitVec 32)) Unit!38910)

(assert (=> b!1181326 (= lt!534172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1181327 () Bool)

(declare-fun res!785029 () Bool)

(assert (=> b!1181327 (=> (not res!785029) (not e!671609))))

(assert (=> b!1181327 (= res!785029 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25948))))

(declare-fun b!1181328 () Bool)

(declare-fun e!671610 () Bool)

(assert (=> b!1181328 (= e!671610 true)))

(assert (=> b!1181328 e!671614))

(declare-fun res!785019 () Bool)

(assert (=> b!1181328 (=> (not res!785019) (not e!671614))))

(assert (=> b!1181328 (= res!785019 (not (= (select (arr!36778 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!534184 () Unit!38910)

(assert (=> b!1181328 (= lt!534184 e!671605)))

(declare-fun c!116944 () Bool)

(assert (=> b!1181328 (= c!116944 (= (select (arr!36778 _keys!1208) from!1455) k0!934))))

(assert (=> b!1181328 e!671602))

(declare-fun res!785027 () Bool)

(assert (=> b!1181328 (=> (not res!785027) (not e!671602))))

(assert (=> b!1181328 (= res!785027 (= lt!534173 (+!3919 lt!534182 lt!534176)))))

(declare-fun get!18819 (ValueCell!14171 V!44809) V!44809)

(assert (=> b!1181328 (= lt!534176 (tuple2!19245 (select (arr!36778 _keys!1208) from!1455) (get!18819 (select (arr!36779 _values!996) from!1455) lt!534185)))))

(declare-fun b!1181329 () Bool)

(assert (=> b!1181329 (= e!671608 e!671610)))

(declare-fun res!785022 () Bool)

(assert (=> b!1181329 (=> res!785022 e!671610)))

(assert (=> b!1181329 (= res!785022 (not (validKeyInArray!0 (select (arr!36778 _keys!1208) from!1455))))))

(assert (=> b!1181329 (= lt!534174 lt!534182)))

(declare-fun -!1581 (ListLongMap!17213 (_ BitVec 64)) ListLongMap!17213)

(assert (=> b!1181329 (= lt!534182 (-!1581 lt!534179 k0!934))))

(assert (=> b!1181329 (= lt!534174 (getCurrentListMapNoExtraKeys!5077 lt!534178 lt!534186 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1181329 (= lt!534179 (getCurrentListMapNoExtraKeys!5077 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!534177 () Unit!38910)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!845 (array!76256 array!76258 (_ BitVec 32) (_ BitVec 32) V!44809 V!44809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38910)

(assert (=> b!1181329 (= lt!534177 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!845 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1181330 () Bool)

(declare-fun res!785033 () Bool)

(assert (=> b!1181330 (=> (not res!785033) (not e!671609))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1181330 (= res!785033 (validMask!0 mask!1564))))

(assert (= (and start!99646 res!785034) b!1181330))

(assert (= (and b!1181330 res!785033) b!1181311))

(assert (= (and b!1181311 res!785028) b!1181323))

(assert (= (and b!1181323 res!785026) b!1181327))

(assert (= (and b!1181327 res!785029) b!1181310))

(assert (= (and b!1181310 res!785023) b!1181312))

(assert (= (and b!1181312 res!785031) b!1181320))

(assert (= (and b!1181320 res!785025) b!1181319))

(assert (= (and b!1181319 res!785032) b!1181321))

(assert (= (and b!1181321 res!785021) b!1181326))

(assert (= (and b!1181326 (not res!785024)) b!1181317))

(assert (= (and b!1181317 (not res!785030)) b!1181329))

(assert (= (and b!1181329 (not res!785022)) b!1181328))

(assert (= (and b!1181328 res!785027) b!1181324))

(assert (= (and b!1181324 (not res!785035)) b!1181309))

(assert (= (and b!1181328 c!116944) b!1181322))

(assert (= (and b!1181328 (not c!116944)) b!1181318))

(assert (= (and b!1181328 res!785019) b!1181313))

(assert (= (and b!1181313 res!785020) b!1181315))

(assert (= (and b!1181316 condMapEmpty!46469) mapIsEmpty!46469))

(assert (= (and b!1181316 (not condMapEmpty!46469)) mapNonEmpty!46469))

(get-info :version)

(assert (= (and mapNonEmpty!46469 ((_ is ValueCellFull!14171) mapValue!46469)) b!1181314))

(assert (= (and b!1181316 ((_ is ValueCellFull!14171) mapDefault!46469)) b!1181325))

(assert (= start!99646 b!1181316))

(declare-fun b_lambda!20357 () Bool)

(assert (=> (not b_lambda!20357) (not b!1181317)))

(declare-fun t!38163 () Bool)

(declare-fun tb!10035 () Bool)

(assert (=> (and start!99646 (= defaultEntry!1004 defaultEntry!1004) t!38163) tb!10035))

(declare-fun result!20645 () Bool)

(assert (=> tb!10035 (= result!20645 tp_is_empty!29761)))

(assert (=> b!1181317 t!38163))

(declare-fun b_and!41309 () Bool)

(assert (= b_and!41307 (and (=> t!38163 result!20645) b_and!41309)))

(declare-fun m!1088747 () Bool)

(assert (=> b!1181320 m!1088747))

(declare-fun m!1088749 () Bool)

(assert (=> b!1181324 m!1088749))

(declare-fun m!1088751 () Bool)

(assert (=> b!1181326 m!1088751))

(declare-fun m!1088753 () Bool)

(assert (=> b!1181326 m!1088753))

(declare-fun m!1088755 () Bool)

(assert (=> mapNonEmpty!46469 m!1088755))

(assert (=> b!1181328 m!1088749))

(declare-fun m!1088757 () Bool)

(assert (=> b!1181328 m!1088757))

(declare-fun m!1088759 () Bool)

(assert (=> b!1181328 m!1088759))

(assert (=> b!1181328 m!1088759))

(declare-fun m!1088761 () Bool)

(assert (=> b!1181328 m!1088761))

(declare-fun m!1088763 () Bool)

(assert (=> b!1181330 m!1088763))

(declare-fun m!1088765 () Bool)

(assert (=> b!1181321 m!1088765))

(declare-fun m!1088767 () Bool)

(assert (=> b!1181322 m!1088767))

(declare-fun m!1088769 () Bool)

(assert (=> b!1181322 m!1088769))

(declare-fun m!1088771 () Bool)

(assert (=> b!1181322 m!1088771))

(declare-fun m!1088773 () Bool)

(assert (=> b!1181322 m!1088773))

(declare-fun m!1088775 () Bool)

(assert (=> b!1181322 m!1088775))

(declare-fun m!1088777 () Bool)

(assert (=> b!1181313 m!1088777))

(declare-fun m!1088779 () Bool)

(assert (=> b!1181327 m!1088779))

(declare-fun m!1088781 () Bool)

(assert (=> start!99646 m!1088781))

(declare-fun m!1088783 () Bool)

(assert (=> start!99646 m!1088783))

(declare-fun m!1088785 () Bool)

(assert (=> b!1181309 m!1088785))

(declare-fun m!1088787 () Bool)

(assert (=> b!1181323 m!1088787))

(declare-fun m!1088789 () Bool)

(assert (=> b!1181319 m!1088789))

(declare-fun m!1088791 () Bool)

(assert (=> b!1181319 m!1088791))

(declare-fun m!1088793 () Bool)

(assert (=> b!1181312 m!1088793))

(declare-fun m!1088795 () Bool)

(assert (=> b!1181317 m!1088795))

(declare-fun m!1088797 () Bool)

(assert (=> b!1181317 m!1088797))

(declare-fun m!1088799 () Bool)

(assert (=> b!1181317 m!1088799))

(declare-fun m!1088801 () Bool)

(assert (=> b!1181317 m!1088801))

(declare-fun m!1088803 () Bool)

(assert (=> b!1181329 m!1088803))

(assert (=> b!1181329 m!1088749))

(declare-fun m!1088805 () Bool)

(assert (=> b!1181329 m!1088805))

(declare-fun m!1088807 () Bool)

(assert (=> b!1181329 m!1088807))

(assert (=> b!1181329 m!1088749))

(declare-fun m!1088809 () Bool)

(assert (=> b!1181329 m!1088809))

(declare-fun m!1088811 () Bool)

(assert (=> b!1181329 m!1088811))

(check-sat (not b_next!25231) (not b!1181313) (not b!1181312) b_and!41309 (not b_lambda!20357) (not start!99646) (not b!1181329) (not b!1181326) (not mapNonEmpty!46469) (not b!1181317) (not b!1181328) (not b!1181323) (not b!1181321) (not b!1181322) (not b!1181327) (not b!1181330) (not b!1181309) (not b!1181319) tp_is_empty!29761)
(check-sat b_and!41309 (not b_next!25231))
