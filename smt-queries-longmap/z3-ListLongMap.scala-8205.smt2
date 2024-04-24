; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100332 () Bool)

(assert start!100332)

(declare-fun b_free!25669 () Bool)

(declare-fun b_next!25669 () Bool)

(assert (=> start!100332 (= b_free!25669 (not b_next!25669))))

(declare-fun tp!89730 () Bool)

(declare-fun b_and!42207 () Bool)

(assert (=> start!100332 (= tp!89730 b_and!42207)))

(declare-fun b!1194805 () Bool)

(declare-fun res!794579 () Bool)

(declare-fun e!679157 () Bool)

(assert (=> b!1194805 (=> (not res!794579) (not e!679157))))

(declare-datatypes ((array!77231 0))(
  ( (array!77232 (arr!37259 (Array (_ BitVec 32) (_ BitVec 64))) (size!37796 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77231)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45401 0))(
  ( (V!45402 (val!15159 Int)) )
))
(declare-datatypes ((ValueCell!14393 0))(
  ( (ValueCellFull!14393 (v!17793 V!45401)) (EmptyCell!14393) )
))
(declare-datatypes ((array!77233 0))(
  ( (array!77234 (arr!37260 (Array (_ BitVec 32) ValueCell!14393)) (size!37797 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77233)

(assert (=> b!1194805 (= res!794579 (and (= (size!37797 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37796 _keys!1208) (size!37797 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194806 () Bool)

(declare-fun res!794580 () Bool)

(assert (=> b!1194806 (=> (not res!794580) (not e!679157))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1194806 (= res!794580 (= (select (arr!37259 _keys!1208) i!673) k0!934))))

(declare-fun b!1194807 () Bool)

(declare-fun res!794581 () Bool)

(assert (=> b!1194807 (=> (not res!794581) (not e!679157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77231 (_ BitVec 32)) Bool)

(assert (=> b!1194807 (= res!794581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45401)

(declare-fun bm!57184 () Bool)

(declare-datatypes ((tuple2!19524 0))(
  ( (tuple2!19525 (_1!9773 (_ BitVec 64)) (_2!9773 V!45401)) )
))
(declare-datatypes ((List!26266 0))(
  ( (Nil!26263) (Cons!26262 (h!27480 tuple2!19524) (t!38919 List!26266)) )
))
(declare-datatypes ((ListLongMap!17501 0))(
  ( (ListLongMap!17502 (toList!8766 List!26266)) )
))
(declare-fun call!57188 () ListLongMap!17501)

(declare-fun zeroValue!944 () V!45401)

(declare-fun getCurrentListMapNoExtraKeys!5234 (array!77231 array!77233 (_ BitVec 32) (_ BitVec 32) V!45401 V!45401 (_ BitVec 32) Int) ListLongMap!17501)

(assert (=> bm!57184 (= call!57188 (getCurrentListMapNoExtraKeys!5234 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1194808 () Bool)

(declare-fun e!679158 () Bool)

(declare-fun e!679163 () Bool)

(assert (=> b!1194808 (= e!679158 e!679163)))

(declare-fun res!794582 () Bool)

(assert (=> b!1194808 (=> res!794582 e!679163)))

(assert (=> b!1194808 (= res!794582 (not (= from!1455 i!673)))))

(declare-fun lt!543087 () array!77231)

(declare-fun lt!543086 () ListLongMap!17501)

(declare-fun lt!543088 () array!77233)

(assert (=> b!1194808 (= lt!543086 (getCurrentListMapNoExtraKeys!5234 lt!543087 lt!543088 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3182 (Int (_ BitVec 64)) V!45401)

(assert (=> b!1194808 (= lt!543088 (array!77234 (store (arr!37260 _values!996) i!673 (ValueCellFull!14393 (dynLambda!3182 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37797 _values!996)))))

(declare-fun lt!543084 () ListLongMap!17501)

(assert (=> b!1194808 (= lt!543084 (getCurrentListMapNoExtraKeys!5234 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1194809 () Bool)

(declare-fun res!794583 () Bool)

(assert (=> b!1194809 (=> (not res!794583) (not e!679157))))

(declare-datatypes ((List!26267 0))(
  ( (Nil!26264) (Cons!26263 (h!27481 (_ BitVec 64)) (t!38920 List!26267)) )
))
(declare-fun arrayNoDuplicates!0 (array!77231 (_ BitVec 32) List!26267) Bool)

(assert (=> b!1194809 (= res!794583 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26264))))

(declare-fun res!794574 () Bool)

(assert (=> start!100332 (=> (not res!794574) (not e!679157))))

(assert (=> start!100332 (= res!794574 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37796 _keys!1208))))))

(assert (=> start!100332 e!679157))

(declare-fun tp_is_empty!30205 () Bool)

(assert (=> start!100332 tp_is_empty!30205))

(declare-fun array_inv!28474 (array!77231) Bool)

(assert (=> start!100332 (array_inv!28474 _keys!1208)))

(assert (=> start!100332 true))

(assert (=> start!100332 tp!89730))

(declare-fun e!679161 () Bool)

(declare-fun array_inv!28475 (array!77233) Bool)

(assert (=> start!100332 (and (array_inv!28475 _values!996) e!679161)))

(declare-fun b!1194810 () Bool)

(declare-fun res!794577 () Bool)

(declare-fun e!679159 () Bool)

(assert (=> b!1194810 (=> (not res!794577) (not e!679159))))

(assert (=> b!1194810 (= res!794577 (arrayNoDuplicates!0 lt!543087 #b00000000000000000000000000000000 Nil!26264))))

(declare-fun b!1194811 () Bool)

(assert (=> b!1194811 (= e!679163 (= (select (arr!37259 _keys!1208) from!1455) k0!934))))

(declare-fun e!679162 () Bool)

(assert (=> b!1194811 e!679162))

(declare-fun c!117701 () Bool)

(assert (=> b!1194811 (= c!117701 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!39573 0))(
  ( (Unit!39574) )
))
(declare-fun lt!543083 () Unit!39573)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!984 (array!77231 array!77233 (_ BitVec 32) (_ BitVec 32) V!45401 V!45401 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39573)

(assert (=> b!1194811 (= lt!543083 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1194812 () Bool)

(declare-fun e!679156 () Bool)

(declare-fun mapRes!47135 () Bool)

(assert (=> b!1194812 (= e!679161 (and e!679156 mapRes!47135))))

(declare-fun condMapEmpty!47135 () Bool)

(declare-fun mapDefault!47135 () ValueCell!14393)

(assert (=> b!1194812 (= condMapEmpty!47135 (= (arr!37260 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14393)) mapDefault!47135)))))

(declare-fun mapNonEmpty!47135 () Bool)

(declare-fun tp!89729 () Bool)

(declare-fun e!679160 () Bool)

(assert (=> mapNonEmpty!47135 (= mapRes!47135 (and tp!89729 e!679160))))

(declare-fun mapValue!47135 () ValueCell!14393)

(declare-fun mapKey!47135 () (_ BitVec 32))

(declare-fun mapRest!47135 () (Array (_ BitVec 32) ValueCell!14393))

(assert (=> mapNonEmpty!47135 (= (arr!37260 _values!996) (store mapRest!47135 mapKey!47135 mapValue!47135))))

(declare-fun b!1194813 () Bool)

(declare-fun call!57187 () ListLongMap!17501)

(assert (=> b!1194813 (= e!679162 (= call!57187 call!57188))))

(declare-fun b!1194814 () Bool)

(assert (=> b!1194814 (= e!679156 tp_is_empty!30205)))

(declare-fun b!1194815 () Bool)

(assert (=> b!1194815 (= e!679160 tp_is_empty!30205)))

(declare-fun b!1194816 () Bool)

(declare-fun res!794576 () Bool)

(assert (=> b!1194816 (=> (not res!794576) (not e!679157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194816 (= res!794576 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47135 () Bool)

(assert (=> mapIsEmpty!47135 mapRes!47135))

(declare-fun bm!57185 () Bool)

(assert (=> bm!57185 (= call!57187 (getCurrentListMapNoExtraKeys!5234 lt!543087 lt!543088 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1194817 () Bool)

(declare-fun res!794578 () Bool)

(assert (=> b!1194817 (=> (not res!794578) (not e!679157))))

(assert (=> b!1194817 (= res!794578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37796 _keys!1208))))))

(declare-fun b!1194818 () Bool)

(assert (=> b!1194818 (= e!679159 (not e!679158))))

(declare-fun res!794584 () Bool)

(assert (=> b!1194818 (=> res!794584 e!679158)))

(assert (=> b!1194818 (= res!794584 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1194818 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543085 () Unit!39573)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77231 (_ BitVec 64) (_ BitVec 32)) Unit!39573)

(assert (=> b!1194818 (= lt!543085 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1194819 () Bool)

(declare-fun -!1769 (ListLongMap!17501 (_ BitVec 64)) ListLongMap!17501)

(assert (=> b!1194819 (= e!679162 (= call!57187 (-!1769 call!57188 k0!934)))))

(declare-fun b!1194820 () Bool)

(assert (=> b!1194820 (= e!679157 e!679159)))

(declare-fun res!794575 () Bool)

(assert (=> b!1194820 (=> (not res!794575) (not e!679159))))

(assert (=> b!1194820 (= res!794575 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543087 mask!1564))))

(assert (=> b!1194820 (= lt!543087 (array!77232 (store (arr!37259 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37796 _keys!1208)))))

(declare-fun b!1194821 () Bool)

(declare-fun res!794585 () Bool)

(assert (=> b!1194821 (=> (not res!794585) (not e!679157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194821 (= res!794585 (validKeyInArray!0 k0!934))))

(assert (= (and start!100332 res!794574) b!1194816))

(assert (= (and b!1194816 res!794576) b!1194805))

(assert (= (and b!1194805 res!794579) b!1194807))

(assert (= (and b!1194807 res!794581) b!1194809))

(assert (= (and b!1194809 res!794583) b!1194817))

(assert (= (and b!1194817 res!794578) b!1194821))

(assert (= (and b!1194821 res!794585) b!1194806))

(assert (= (and b!1194806 res!794580) b!1194820))

(assert (= (and b!1194820 res!794575) b!1194810))

(assert (= (and b!1194810 res!794577) b!1194818))

(assert (= (and b!1194818 (not res!794584)) b!1194808))

(assert (= (and b!1194808 (not res!794582)) b!1194811))

(assert (= (and b!1194811 c!117701) b!1194819))

(assert (= (and b!1194811 (not c!117701)) b!1194813))

(assert (= (or b!1194819 b!1194813) bm!57184))

(assert (= (or b!1194819 b!1194813) bm!57185))

(assert (= (and b!1194812 condMapEmpty!47135) mapIsEmpty!47135))

(assert (= (and b!1194812 (not condMapEmpty!47135)) mapNonEmpty!47135))

(get-info :version)

(assert (= (and mapNonEmpty!47135 ((_ is ValueCellFull!14393) mapValue!47135)) b!1194815))

(assert (= (and b!1194812 ((_ is ValueCellFull!14393) mapDefault!47135)) b!1194814))

(assert (= start!100332 b!1194812))

(declare-fun b_lambda!20807 () Bool)

(assert (=> (not b_lambda!20807) (not b!1194808)))

(declare-fun t!38918 () Bool)

(declare-fun tb!10473 () Bool)

(assert (=> (and start!100332 (= defaultEntry!1004 defaultEntry!1004) t!38918) tb!10473))

(declare-fun result!21521 () Bool)

(assert (=> tb!10473 (= result!21521 tp_is_empty!30205)))

(assert (=> b!1194808 t!38918))

(declare-fun b_and!42209 () Bool)

(assert (= b_and!42207 (and (=> t!38918 result!21521) b_and!42209)))

(declare-fun m!1103301 () Bool)

(assert (=> b!1194816 m!1103301))

(declare-fun m!1103303 () Bool)

(assert (=> b!1194806 m!1103303))

(declare-fun m!1103305 () Bool)

(assert (=> b!1194818 m!1103305))

(declare-fun m!1103307 () Bool)

(assert (=> b!1194818 m!1103307))

(declare-fun m!1103309 () Bool)

(assert (=> b!1194819 m!1103309))

(declare-fun m!1103311 () Bool)

(assert (=> b!1194808 m!1103311))

(declare-fun m!1103313 () Bool)

(assert (=> b!1194808 m!1103313))

(declare-fun m!1103315 () Bool)

(assert (=> b!1194808 m!1103315))

(declare-fun m!1103317 () Bool)

(assert (=> b!1194808 m!1103317))

(declare-fun m!1103319 () Bool)

(assert (=> mapNonEmpty!47135 m!1103319))

(declare-fun m!1103321 () Bool)

(assert (=> b!1194820 m!1103321))

(declare-fun m!1103323 () Bool)

(assert (=> b!1194820 m!1103323))

(declare-fun m!1103325 () Bool)

(assert (=> start!100332 m!1103325))

(declare-fun m!1103327 () Bool)

(assert (=> start!100332 m!1103327))

(declare-fun m!1103329 () Bool)

(assert (=> b!1194810 m!1103329))

(declare-fun m!1103331 () Bool)

(assert (=> bm!57185 m!1103331))

(declare-fun m!1103333 () Bool)

(assert (=> bm!57184 m!1103333))

(declare-fun m!1103335 () Bool)

(assert (=> b!1194809 m!1103335))

(declare-fun m!1103337 () Bool)

(assert (=> b!1194807 m!1103337))

(declare-fun m!1103339 () Bool)

(assert (=> b!1194821 m!1103339))

(declare-fun m!1103341 () Bool)

(assert (=> b!1194811 m!1103341))

(declare-fun m!1103343 () Bool)

(assert (=> b!1194811 m!1103343))

(check-sat (not b!1194821) (not b!1194808) (not mapNonEmpty!47135) (not b_lambda!20807) (not b!1194810) (not b!1194818) (not b!1194819) (not b!1194820) (not bm!57184) (not b!1194816) (not b!1194809) (not bm!57185) (not start!100332) (not b!1194811) (not b_next!25669) (not b!1194807) b_and!42209 tp_is_empty!30205)
(check-sat b_and!42209 (not b_next!25669))
