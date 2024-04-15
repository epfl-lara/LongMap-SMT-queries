; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99382 () Bool)

(assert start!99382)

(declare-fun b_free!24967 () Bool)

(declare-fun b_next!24967 () Bool)

(assert (=> start!99382 (= b_free!24967 (not b_next!24967))))

(declare-fun tp!87615 () Bool)

(declare-fun b_and!40779 () Bool)

(assert (=> start!99382 (= tp!87615 b_and!40779)))

(declare-fun b!1172797 () Bool)

(declare-fun res!778755 () Bool)

(declare-fun e!666612 () Bool)

(assert (=> b!1172797 (=> (not res!778755) (not e!666612))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172797 (= res!778755 (validKeyInArray!0 k0!934))))

(declare-fun b!1172798 () Bool)

(declare-fun e!666614 () Bool)

(declare-fun tp_is_empty!29497 () Bool)

(assert (=> b!1172798 (= e!666614 tp_is_empty!29497)))

(declare-fun b!1172799 () Bool)

(declare-fun e!666608 () Bool)

(declare-fun e!666616 () Bool)

(assert (=> b!1172799 (= e!666608 e!666616)))

(declare-fun res!778763 () Bool)

(assert (=> b!1172799 (=> res!778763 e!666616)))

(declare-datatypes ((array!75736 0))(
  ( (array!75737 (arr!36518 (Array (_ BitVec 32) (_ BitVec 64))) (size!37056 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75736)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1172799 (= res!778763 (not (validKeyInArray!0 (select (arr!36518 _keys!1208) from!1455))))))

(declare-datatypes ((V!44457 0))(
  ( (V!44458 (val!14805 Int)) )
))
(declare-datatypes ((tuple2!19010 0))(
  ( (tuple2!19011 (_1!9516 (_ BitVec 64)) (_2!9516 V!44457)) )
))
(declare-datatypes ((List!25726 0))(
  ( (Nil!25723) (Cons!25722 (h!26931 tuple2!19010) (t!37676 List!25726)) )
))
(declare-datatypes ((ListLongMap!16979 0))(
  ( (ListLongMap!16980 (toList!8505 List!25726)) )
))
(declare-fun lt!528385 () ListLongMap!16979)

(declare-fun lt!528389 () ListLongMap!16979)

(assert (=> b!1172799 (= lt!528385 lt!528389)))

(declare-fun lt!528392 () ListLongMap!16979)

(declare-fun -!1494 (ListLongMap!16979 (_ BitVec 64)) ListLongMap!16979)

(assert (=> b!1172799 (= lt!528389 (-!1494 lt!528392 k0!934))))

(declare-fun zeroValue!944 () V!44457)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14039 0))(
  ( (ValueCellFull!14039 (v!17442 V!44457)) (EmptyCell!14039) )
))
(declare-datatypes ((array!75738 0))(
  ( (array!75739 (arr!36519 (Array (_ BitVec 32) ValueCell!14039)) (size!37057 (_ BitVec 32))) )
))
(declare-fun lt!528393 () array!75738)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!528387 () array!75736)

(declare-fun minValue!944 () V!44457)

(declare-fun getCurrentListMapNoExtraKeys!4979 (array!75736 array!75738 (_ BitVec 32) (_ BitVec 32) V!44457 V!44457 (_ BitVec 32) Int) ListLongMap!16979)

(assert (=> b!1172799 (= lt!528385 (getCurrentListMapNoExtraKeys!4979 lt!528387 lt!528393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!75738)

(assert (=> b!1172799 (= lt!528392 (getCurrentListMapNoExtraKeys!4979 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38497 0))(
  ( (Unit!38498) )
))
(declare-fun lt!528394 () Unit!38497)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!758 (array!75736 array!75738 (_ BitVec 32) (_ BitVec 32) V!44457 V!44457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38497)

(assert (=> b!1172799 (= lt!528394 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172800 () Bool)

(declare-fun res!778765 () Bool)

(assert (=> b!1172800 (=> (not res!778765) (not e!666612))))

(assert (=> b!1172800 (= res!778765 (= (select (arr!36518 _keys!1208) i!673) k0!934))))

(declare-fun b!1172801 () Bool)

(declare-fun res!778751 () Bool)

(assert (=> b!1172801 (=> (not res!778751) (not e!666612))))

(assert (=> b!1172801 (= res!778751 (and (= (size!37057 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37056 _keys!1208) (size!37057 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172802 () Bool)

(declare-fun e!666609 () Bool)

(declare-fun arrayContainsKey!0 (array!75736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172802 (= e!666609 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172803 () Bool)

(declare-fun res!778764 () Bool)

(assert (=> b!1172803 (=> (not res!778764) (not e!666612))))

(declare-datatypes ((List!25727 0))(
  ( (Nil!25724) (Cons!25723 (h!26932 (_ BitVec 64)) (t!37677 List!25727)) )
))
(declare-fun arrayNoDuplicates!0 (array!75736 (_ BitVec 32) List!25727) Bool)

(assert (=> b!1172803 (= res!778764 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25724))))

(declare-fun b!1172804 () Bool)

(declare-fun e!666613 () Bool)

(declare-fun mapRes!46073 () Bool)

(assert (=> b!1172804 (= e!666613 (and e!666614 mapRes!46073))))

(declare-fun condMapEmpty!46073 () Bool)

(declare-fun mapDefault!46073 () ValueCell!14039)

(assert (=> b!1172804 (= condMapEmpty!46073 (= (arr!36519 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14039)) mapDefault!46073)))))

(declare-fun mapNonEmpty!46073 () Bool)

(declare-fun tp!87614 () Bool)

(declare-fun e!666607 () Bool)

(assert (=> mapNonEmpty!46073 (= mapRes!46073 (and tp!87614 e!666607))))

(declare-fun mapValue!46073 () ValueCell!14039)

(declare-fun mapRest!46073 () (Array (_ BitVec 32) ValueCell!14039))

(declare-fun mapKey!46073 () (_ BitVec 32))

(assert (=> mapNonEmpty!46073 (= (arr!36519 _values!996) (store mapRest!46073 mapKey!46073 mapValue!46073))))

(declare-fun b!1172806 () Bool)

(declare-fun res!778761 () Bool)

(declare-fun e!666605 () Bool)

(assert (=> b!1172806 (=> (not res!778761) (not e!666605))))

(assert (=> b!1172806 (= res!778761 (arrayNoDuplicates!0 lt!528387 #b00000000000000000000000000000000 Nil!25724))))

(declare-fun mapIsEmpty!46073 () Bool)

(assert (=> mapIsEmpty!46073 mapRes!46073))

(declare-fun b!1172807 () Bool)

(declare-fun e!666606 () Bool)

(assert (=> b!1172807 (= e!666606 e!666609)))

(declare-fun res!778756 () Bool)

(assert (=> b!1172807 (=> res!778756 e!666609)))

(assert (=> b!1172807 (= res!778756 (not (= (select (arr!36518 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1172808 () Bool)

(declare-fun e!666611 () Unit!38497)

(declare-fun Unit!38499 () Unit!38497)

(assert (=> b!1172808 (= e!666611 Unit!38499)))

(declare-fun lt!528390 () Unit!38497)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75736 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38497)

(assert (=> b!1172808 (= lt!528390 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1172808 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528386 () Unit!38497)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75736 (_ BitVec 32) (_ BitVec 32)) Unit!38497)

(assert (=> b!1172808 (= lt!528386 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172808 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25724)))

(declare-fun lt!528384 () Unit!38497)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75736 (_ BitVec 64) (_ BitVec 32) List!25727) Unit!38497)

(assert (=> b!1172808 (= lt!528384 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25724))))

(assert (=> b!1172808 false))

(declare-fun b!1172809 () Bool)

(declare-fun res!778762 () Bool)

(assert (=> b!1172809 (=> (not res!778762) (not e!666612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172809 (= res!778762 (validMask!0 mask!1564))))

(declare-fun b!1172810 () Bool)

(declare-fun e!666610 () Bool)

(assert (=> b!1172810 (= e!666605 (not e!666610))))

(declare-fun res!778754 () Bool)

(assert (=> b!1172810 (=> res!778754 e!666610)))

(assert (=> b!1172810 (= res!778754 (bvsgt from!1455 i!673))))

(assert (=> b!1172810 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!528383 () Unit!38497)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75736 (_ BitVec 64) (_ BitVec 32)) Unit!38497)

(assert (=> b!1172810 (= lt!528383 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1172811 () Bool)

(assert (=> b!1172811 (= e!666616 true)))

(assert (=> b!1172811 (not (= (select (arr!36518 _keys!1208) from!1455) k0!934))))

(declare-fun lt!528395 () Unit!38497)

(assert (=> b!1172811 (= lt!528395 e!666611)))

(declare-fun c!116548 () Bool)

(assert (=> b!1172811 (= c!116548 (= (select (arr!36518 _keys!1208) from!1455) k0!934))))

(assert (=> b!1172811 e!666606))

(declare-fun res!778758 () Bool)

(assert (=> b!1172811 (=> (not res!778758) (not e!666606))))

(declare-fun lt!528396 () V!44457)

(declare-fun lt!528388 () ListLongMap!16979)

(declare-fun +!3820 (ListLongMap!16979 tuple2!19010) ListLongMap!16979)

(declare-fun get!18642 (ValueCell!14039 V!44457) V!44457)

(assert (=> b!1172811 (= res!778758 (= lt!528388 (+!3820 lt!528389 (tuple2!19011 (select (arr!36518 _keys!1208) from!1455) (get!18642 (select (arr!36519 _values!996) from!1455) lt!528396)))))))

(declare-fun b!1172812 () Bool)

(assert (=> b!1172812 (= e!666607 tp_is_empty!29497)))

(declare-fun b!1172813 () Bool)

(assert (=> b!1172813 (= e!666610 e!666608)))

(declare-fun res!778759 () Bool)

(assert (=> b!1172813 (=> res!778759 e!666608)))

(assert (=> b!1172813 (= res!778759 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1172813 (= lt!528388 (getCurrentListMapNoExtraKeys!4979 lt!528387 lt!528393 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1172813 (= lt!528393 (array!75739 (store (arr!36519 _values!996) i!673 (ValueCellFull!14039 lt!528396)) (size!37057 _values!996)))))

(declare-fun dynLambda!2903 (Int (_ BitVec 64)) V!44457)

(assert (=> b!1172813 (= lt!528396 (dynLambda!2903 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528391 () ListLongMap!16979)

(assert (=> b!1172813 (= lt!528391 (getCurrentListMapNoExtraKeys!4979 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172814 () Bool)

(declare-fun res!778760 () Bool)

(assert (=> b!1172814 (=> (not res!778760) (not e!666612))))

(assert (=> b!1172814 (= res!778760 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37056 _keys!1208))))))

(declare-fun b!1172815 () Bool)

(declare-fun Unit!38500 () Unit!38497)

(assert (=> b!1172815 (= e!666611 Unit!38500)))

(declare-fun b!1172816 () Bool)

(assert (=> b!1172816 (= e!666612 e!666605)))

(declare-fun res!778757 () Bool)

(assert (=> b!1172816 (=> (not res!778757) (not e!666605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75736 (_ BitVec 32)) Bool)

(assert (=> b!1172816 (= res!778757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528387 mask!1564))))

(assert (=> b!1172816 (= lt!528387 (array!75737 (store (arr!36518 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37056 _keys!1208)))))

(declare-fun b!1172805 () Bool)

(declare-fun res!778753 () Bool)

(assert (=> b!1172805 (=> (not res!778753) (not e!666612))))

(assert (=> b!1172805 (= res!778753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!778752 () Bool)

(assert (=> start!99382 (=> (not res!778752) (not e!666612))))

(assert (=> start!99382 (= res!778752 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37056 _keys!1208))))))

(assert (=> start!99382 e!666612))

(assert (=> start!99382 tp_is_empty!29497))

(declare-fun array_inv!28006 (array!75736) Bool)

(assert (=> start!99382 (array_inv!28006 _keys!1208)))

(assert (=> start!99382 true))

(assert (=> start!99382 tp!87615))

(declare-fun array_inv!28007 (array!75738) Bool)

(assert (=> start!99382 (and (array_inv!28007 _values!996) e!666613)))

(assert (= (and start!99382 res!778752) b!1172809))

(assert (= (and b!1172809 res!778762) b!1172801))

(assert (= (and b!1172801 res!778751) b!1172805))

(assert (= (and b!1172805 res!778753) b!1172803))

(assert (= (and b!1172803 res!778764) b!1172814))

(assert (= (and b!1172814 res!778760) b!1172797))

(assert (= (and b!1172797 res!778755) b!1172800))

(assert (= (and b!1172800 res!778765) b!1172816))

(assert (= (and b!1172816 res!778757) b!1172806))

(assert (= (and b!1172806 res!778761) b!1172810))

(assert (= (and b!1172810 (not res!778754)) b!1172813))

(assert (= (and b!1172813 (not res!778759)) b!1172799))

(assert (= (and b!1172799 (not res!778763)) b!1172811))

(assert (= (and b!1172811 res!778758) b!1172807))

(assert (= (and b!1172807 (not res!778756)) b!1172802))

(assert (= (and b!1172811 c!116548) b!1172808))

(assert (= (and b!1172811 (not c!116548)) b!1172815))

(assert (= (and b!1172804 condMapEmpty!46073) mapIsEmpty!46073))

(assert (= (and b!1172804 (not condMapEmpty!46073)) mapNonEmpty!46073))

(get-info :version)

(assert (= (and mapNonEmpty!46073 ((_ is ValueCellFull!14039) mapValue!46073)) b!1172812))

(assert (= (and b!1172804 ((_ is ValueCellFull!14039) mapDefault!46073)) b!1172798))

(assert (= start!99382 b!1172804))

(declare-fun b_lambda!20093 () Bool)

(assert (=> (not b_lambda!20093) (not b!1172813)))

(declare-fun t!37675 () Bool)

(declare-fun tb!9771 () Bool)

(assert (=> (and start!99382 (= defaultEntry!1004 defaultEntry!1004) t!37675) tb!9771))

(declare-fun result!20117 () Bool)

(assert (=> tb!9771 (= result!20117 tp_is_empty!29497)))

(assert (=> b!1172813 t!37675))

(declare-fun b_and!40781 () Bool)

(assert (= b_and!40779 (and (=> t!37675 result!20117) b_and!40781)))

(declare-fun m!1080137 () Bool)

(assert (=> b!1172813 m!1080137))

(declare-fun m!1080139 () Bool)

(assert (=> b!1172813 m!1080139))

(declare-fun m!1080141 () Bool)

(assert (=> b!1172813 m!1080141))

(declare-fun m!1080143 () Bool)

(assert (=> b!1172813 m!1080143))

(declare-fun m!1080145 () Bool)

(assert (=> b!1172808 m!1080145))

(declare-fun m!1080147 () Bool)

(assert (=> b!1172808 m!1080147))

(declare-fun m!1080149 () Bool)

(assert (=> b!1172808 m!1080149))

(declare-fun m!1080151 () Bool)

(assert (=> b!1172808 m!1080151))

(declare-fun m!1080153 () Bool)

(assert (=> b!1172808 m!1080153))

(declare-fun m!1080155 () Bool)

(assert (=> b!1172803 m!1080155))

(declare-fun m!1080157 () Bool)

(assert (=> start!99382 m!1080157))

(declare-fun m!1080159 () Bool)

(assert (=> start!99382 m!1080159))

(declare-fun m!1080161 () Bool)

(assert (=> b!1172811 m!1080161))

(declare-fun m!1080163 () Bool)

(assert (=> b!1172811 m!1080163))

(assert (=> b!1172811 m!1080163))

(declare-fun m!1080165 () Bool)

(assert (=> b!1172811 m!1080165))

(declare-fun m!1080167 () Bool)

(assert (=> b!1172811 m!1080167))

(declare-fun m!1080169 () Bool)

(assert (=> b!1172810 m!1080169))

(declare-fun m!1080171 () Bool)

(assert (=> b!1172810 m!1080171))

(declare-fun m!1080173 () Bool)

(assert (=> b!1172806 m!1080173))

(assert (=> b!1172807 m!1080161))

(declare-fun m!1080175 () Bool)

(assert (=> b!1172800 m!1080175))

(declare-fun m!1080177 () Bool)

(assert (=> b!1172797 m!1080177))

(declare-fun m!1080179 () Bool)

(assert (=> b!1172809 m!1080179))

(declare-fun m!1080181 () Bool)

(assert (=> b!1172802 m!1080181))

(declare-fun m!1080183 () Bool)

(assert (=> mapNonEmpty!46073 m!1080183))

(declare-fun m!1080185 () Bool)

(assert (=> b!1172816 m!1080185))

(declare-fun m!1080187 () Bool)

(assert (=> b!1172816 m!1080187))

(declare-fun m!1080189 () Bool)

(assert (=> b!1172805 m!1080189))

(declare-fun m!1080191 () Bool)

(assert (=> b!1172799 m!1080191))

(declare-fun m!1080193 () Bool)

(assert (=> b!1172799 m!1080193))

(declare-fun m!1080195 () Bool)

(assert (=> b!1172799 m!1080195))

(declare-fun m!1080197 () Bool)

(assert (=> b!1172799 m!1080197))

(assert (=> b!1172799 m!1080161))

(declare-fun m!1080199 () Bool)

(assert (=> b!1172799 m!1080199))

(assert (=> b!1172799 m!1080161))

(check-sat (not b!1172811) (not b!1172797) (not b!1172802) (not b!1172799) (not b!1172806) tp_is_empty!29497 (not b!1172809) (not b!1172816) (not b_next!24967) (not b!1172813) (not b_lambda!20093) (not mapNonEmpty!46073) b_and!40781 (not start!99382) (not b!1172808) (not b!1172810) (not b!1172803) (not b!1172805))
(check-sat b_and!40781 (not b_next!24967))
