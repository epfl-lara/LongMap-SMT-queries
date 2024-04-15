; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109766 () Bool)

(assert start!109766)

(declare-fun b_free!29179 () Bool)

(declare-fun b_next!29179 () Bool)

(assert (=> start!109766 (= b_free!29179 (not b_next!29179))))

(declare-fun tp!102668 () Bool)

(declare-fun b_and!47269 () Bool)

(assert (=> start!109766 (= tp!102668 b_and!47269)))

(declare-fun b!1300158 () Bool)

(declare-fun res!864018 () Bool)

(declare-fun e!741666 () Bool)

(assert (=> b!1300158 (=> (not res!864018) (not e!741666))))

(declare-datatypes ((V!51529 0))(
  ( (V!51530 (val!17484 Int)) )
))
(declare-fun minValue!1387 () V!51529)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16511 0))(
  ( (ValueCellFull!16511 (v!20090 V!51529)) (EmptyCell!16511) )
))
(declare-datatypes ((array!86547 0))(
  ( (array!86548 (arr!41771 (Array (_ BitVec 32) ValueCell!16511)) (size!42323 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86547)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86549 0))(
  ( (array!86550 (arr!41772 (Array (_ BitVec 32) (_ BitVec 64))) (size!42324 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86549)

(declare-fun zeroValue!1387 () V!51529)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22600 0))(
  ( (tuple2!22601 (_1!11311 (_ BitVec 64)) (_2!11311 V!51529)) )
))
(declare-datatypes ((List!29718 0))(
  ( (Nil!29715) (Cons!29714 (h!30923 tuple2!22600) (t!43282 List!29718)) )
))
(declare-datatypes ((ListLongMap!20257 0))(
  ( (ListLongMap!20258 (toList!10144 List!29718)) )
))
(declare-fun contains!8198 (ListLongMap!20257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5059 (array!86549 array!86547 (_ BitVec 32) (_ BitVec 32) V!51529 V!51529 (_ BitVec 32) Int) ListLongMap!20257)

(assert (=> b!1300158 (= res!864018 (contains!8198 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300159 () Bool)

(declare-fun res!864025 () Bool)

(assert (=> b!1300159 (=> (not res!864025) (not e!741666))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86549 (_ BitVec 32)) Bool)

(assert (=> b!1300159 (= res!864025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300160 () Bool)

(declare-fun res!864017 () Bool)

(assert (=> b!1300160 (=> (not res!864017) (not e!741666))))

(assert (=> b!1300160 (= res!864017 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741))))))

(declare-fun b!1300161 () Bool)

(declare-fun res!864022 () Bool)

(assert (=> b!1300161 (=> (not res!864022) (not e!741666))))

(assert (=> b!1300161 (= res!864022 (and (= (size!42323 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42324 _keys!1741) (size!42323 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53801 () Bool)

(declare-fun mapRes!53801 () Bool)

(declare-fun tp!102669 () Bool)

(declare-fun e!741670 () Bool)

(assert (=> mapNonEmpty!53801 (= mapRes!53801 (and tp!102669 e!741670))))

(declare-fun mapRest!53801 () (Array (_ BitVec 32) ValueCell!16511))

(declare-fun mapKey!53801 () (_ BitVec 32))

(declare-fun mapValue!53801 () ValueCell!16511)

(assert (=> mapNonEmpty!53801 (= (arr!41771 _values!1445) (store mapRest!53801 mapKey!53801 mapValue!53801))))

(declare-fun b!1300162 () Bool)

(declare-fun tp_is_empty!34819 () Bool)

(assert (=> b!1300162 (= e!741670 tp_is_empty!34819)))

(declare-fun b!1300163 () Bool)

(declare-fun res!864021 () Bool)

(assert (=> b!1300163 (=> (not res!864021) (not e!741666))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300163 (= res!864021 (validKeyInArray!0 (select (arr!41772 _keys!1741) from!2144)))))

(declare-fun b!1300164 () Bool)

(declare-fun res!864019 () Bool)

(assert (=> b!1300164 (=> (not res!864019) (not e!741666))))

(assert (=> b!1300164 (= res!864019 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300165 () Bool)

(declare-fun e!741667 () Bool)

(assert (=> b!1300165 (= e!741667 tp_is_empty!34819)))

(declare-fun b!1300166 () Bool)

(declare-fun e!741668 () Bool)

(assert (=> b!1300166 (= e!741668 (and e!741667 mapRes!53801))))

(declare-fun condMapEmpty!53801 () Bool)

(declare-fun mapDefault!53801 () ValueCell!16511)

(assert (=> b!1300166 (= condMapEmpty!53801 (= (arr!41771 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16511)) mapDefault!53801)))))

(declare-fun mapIsEmpty!53801 () Bool)

(assert (=> mapIsEmpty!53801 mapRes!53801))

(declare-fun b!1300167 () Bool)

(declare-fun res!864023 () Bool)

(assert (=> b!1300167 (=> (not res!864023) (not e!741666))))

(declare-datatypes ((List!29719 0))(
  ( (Nil!29716) (Cons!29715 (h!30924 (_ BitVec 64)) (t!43283 List!29719)) )
))
(declare-fun arrayNoDuplicates!0 (array!86549 (_ BitVec 32) List!29719) Bool)

(assert (=> b!1300167 (= res!864023 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29716))))

(declare-fun b!1300168 () Bool)

(declare-fun +!4487 (ListLongMap!20257 tuple2!22600) ListLongMap!20257)

(declare-fun getCurrentListMapNoExtraKeys!6118 (array!86549 array!86547 (_ BitVec 32) (_ BitVec 32) V!51529 V!51529 (_ BitVec 32) Int) ListLongMap!20257)

(assert (=> b!1300168 (= e!741666 (not (contains!8198 (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))))

(declare-fun res!864020 () Bool)

(assert (=> start!109766 (=> (not res!864020) (not e!741666))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109766 (= res!864020 (validMask!0 mask!2175))))

(assert (=> start!109766 e!741666))

(assert (=> start!109766 tp_is_empty!34819))

(assert (=> start!109766 true))

(declare-fun array_inv!31771 (array!86547) Bool)

(assert (=> start!109766 (and (array_inv!31771 _values!1445) e!741668)))

(declare-fun array_inv!31772 (array!86549) Bool)

(assert (=> start!109766 (array_inv!31772 _keys!1741)))

(assert (=> start!109766 tp!102668))

(declare-fun b!1300169 () Bool)

(declare-fun res!864024 () Bool)

(assert (=> b!1300169 (=> (not res!864024) (not e!741666))))

(assert (=> b!1300169 (= res!864024 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42324 _keys!1741))))))

(assert (= (and start!109766 res!864020) b!1300161))

(assert (= (and b!1300161 res!864022) b!1300159))

(assert (= (and b!1300159 res!864025) b!1300167))

(assert (= (and b!1300167 res!864023) b!1300160))

(assert (= (and b!1300160 res!864017) b!1300158))

(assert (= (and b!1300158 res!864018) b!1300169))

(assert (= (and b!1300169 res!864024) b!1300163))

(assert (= (and b!1300163 res!864021) b!1300164))

(assert (= (and b!1300164 res!864019) b!1300168))

(assert (= (and b!1300166 condMapEmpty!53801) mapIsEmpty!53801))

(assert (= (and b!1300166 (not condMapEmpty!53801)) mapNonEmpty!53801))

(get-info :version)

(assert (= (and mapNonEmpty!53801 ((_ is ValueCellFull!16511) mapValue!53801)) b!1300162))

(assert (= (and b!1300166 ((_ is ValueCellFull!16511) mapDefault!53801)) b!1300165))

(assert (= start!109766 b!1300166))

(declare-fun m!1190707 () Bool)

(assert (=> b!1300167 m!1190707))

(declare-fun m!1190709 () Bool)

(assert (=> b!1300158 m!1190709))

(assert (=> b!1300158 m!1190709))

(declare-fun m!1190711 () Bool)

(assert (=> b!1300158 m!1190711))

(declare-fun m!1190713 () Bool)

(assert (=> b!1300168 m!1190713))

(assert (=> b!1300168 m!1190713))

(declare-fun m!1190715 () Bool)

(assert (=> b!1300168 m!1190715))

(assert (=> b!1300168 m!1190715))

(declare-fun m!1190717 () Bool)

(assert (=> b!1300168 m!1190717))

(declare-fun m!1190719 () Bool)

(assert (=> b!1300159 m!1190719))

(declare-fun m!1190721 () Bool)

(assert (=> mapNonEmpty!53801 m!1190721))

(declare-fun m!1190723 () Bool)

(assert (=> b!1300163 m!1190723))

(assert (=> b!1300163 m!1190723))

(declare-fun m!1190725 () Bool)

(assert (=> b!1300163 m!1190725))

(declare-fun m!1190727 () Bool)

(assert (=> start!109766 m!1190727))

(declare-fun m!1190729 () Bool)

(assert (=> start!109766 m!1190729))

(declare-fun m!1190731 () Bool)

(assert (=> start!109766 m!1190731))

(check-sat (not b!1300158) b_and!47269 (not mapNonEmpty!53801) (not b!1300159) (not b!1300168) tp_is_empty!34819 (not b_next!29179) (not start!109766) (not b!1300167) (not b!1300163))
(check-sat b_and!47269 (not b_next!29179))
(get-model)

(declare-fun b!1300252 () Bool)

(declare-fun e!741710 () Bool)

(declare-fun contains!8201 (List!29719 (_ BitVec 64)) Bool)

(assert (=> b!1300252 (= e!741710 (contains!8201 Nil!29716 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300253 () Bool)

(declare-fun e!741711 () Bool)

(declare-fun call!63614 () Bool)

(assert (=> b!1300253 (= e!741711 call!63614)))

(declare-fun b!1300254 () Bool)

(declare-fun e!741712 () Bool)

(assert (=> b!1300254 (= e!741712 e!741711)))

(declare-fun c!124545 () Bool)

(assert (=> b!1300254 (= c!124545 (validKeyInArray!0 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63611 () Bool)

(assert (=> bm!63611 (= call!63614 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124545 (Cons!29715 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000) Nil!29716) Nil!29716)))))

(declare-fun d!141045 () Bool)

(declare-fun res!864087 () Bool)

(declare-fun e!741709 () Bool)

(assert (=> d!141045 (=> res!864087 e!741709)))

(assert (=> d!141045 (= res!864087 (bvsge #b00000000000000000000000000000000 (size!42324 _keys!1741)))))

(assert (=> d!141045 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29716) e!741709)))

(declare-fun b!1300255 () Bool)

(assert (=> b!1300255 (= e!741711 call!63614)))

(declare-fun b!1300256 () Bool)

(assert (=> b!1300256 (= e!741709 e!741712)))

(declare-fun res!864088 () Bool)

(assert (=> b!1300256 (=> (not res!864088) (not e!741712))))

(assert (=> b!1300256 (= res!864088 (not e!741710))))

(declare-fun res!864086 () Bool)

(assert (=> b!1300256 (=> (not res!864086) (not e!741710))))

(assert (=> b!1300256 (= res!864086 (validKeyInArray!0 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000)))))

(assert (= (and d!141045 (not res!864087)) b!1300256))

(assert (= (and b!1300256 res!864086) b!1300252))

(assert (= (and b!1300256 res!864088) b!1300254))

(assert (= (and b!1300254 c!124545) b!1300253))

(assert (= (and b!1300254 (not c!124545)) b!1300255))

(assert (= (or b!1300253 b!1300255) bm!63611))

(declare-fun m!1190785 () Bool)

(assert (=> b!1300252 m!1190785))

(assert (=> b!1300252 m!1190785))

(declare-fun m!1190787 () Bool)

(assert (=> b!1300252 m!1190787))

(assert (=> b!1300254 m!1190785))

(assert (=> b!1300254 m!1190785))

(declare-fun m!1190789 () Bool)

(assert (=> b!1300254 m!1190789))

(assert (=> bm!63611 m!1190785))

(declare-fun m!1190791 () Bool)

(assert (=> bm!63611 m!1190791))

(assert (=> b!1300256 m!1190785))

(assert (=> b!1300256 m!1190785))

(assert (=> b!1300256 m!1190789))

(assert (=> b!1300167 d!141045))

(declare-fun d!141047 () Bool)

(assert (=> d!141047 (= (validKeyInArray!0 (select (arr!41772 _keys!1741) from!2144)) (and (not (= (select (arr!41772 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41772 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300163 d!141047))

(declare-fun bm!63614 () Bool)

(declare-fun call!63617 () Bool)

(assert (=> bm!63614 (= call!63617 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1300265 () Bool)

(declare-fun e!741719 () Bool)

(declare-fun e!741721 () Bool)

(assert (=> b!1300265 (= e!741719 e!741721)))

(declare-fun c!124548 () Bool)

(assert (=> b!1300265 (= c!124548 (validKeyInArray!0 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun d!141049 () Bool)

(declare-fun res!864094 () Bool)

(assert (=> d!141049 (=> res!864094 e!741719)))

(assert (=> d!141049 (= res!864094 (bvsge #b00000000000000000000000000000000 (size!42324 _keys!1741)))))

(assert (=> d!141049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!741719)))

(declare-fun b!1300266 () Bool)

(declare-fun e!741720 () Bool)

(assert (=> b!1300266 (= e!741720 call!63617)))

(declare-fun b!1300267 () Bool)

(assert (=> b!1300267 (= e!741721 e!741720)))

(declare-fun lt!581100 () (_ BitVec 64))

(assert (=> b!1300267 (= lt!581100 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42872 0))(
  ( (Unit!42873) )
))
(declare-fun lt!581099 () Unit!42872)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86549 (_ BitVec 64) (_ BitVec 32)) Unit!42872)

(assert (=> b!1300267 (= lt!581099 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581100 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86549 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1300267 (arrayContainsKey!0 _keys!1741 lt!581100 #b00000000000000000000000000000000)))

(declare-fun lt!581098 () Unit!42872)

(assert (=> b!1300267 (= lt!581098 lt!581099)))

(declare-fun res!864093 () Bool)

(declare-datatypes ((SeekEntryResult!10018 0))(
  ( (MissingZero!10018 (index!42443 (_ BitVec 32))) (Found!10018 (index!42444 (_ BitVec 32))) (Intermediate!10018 (undefined!10830 Bool) (index!42445 (_ BitVec 32)) (x!115498 (_ BitVec 32))) (Undefined!10018) (MissingVacant!10018 (index!42446 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86549 (_ BitVec 32)) SeekEntryResult!10018)

(assert (=> b!1300267 (= res!864093 (= (seekEntryOrOpen!0 (select (arr!41772 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10018 #b00000000000000000000000000000000)))))

(assert (=> b!1300267 (=> (not res!864093) (not e!741720))))

(declare-fun b!1300268 () Bool)

(assert (=> b!1300268 (= e!741721 call!63617)))

(assert (= (and d!141049 (not res!864094)) b!1300265))

(assert (= (and b!1300265 c!124548) b!1300267))

(assert (= (and b!1300265 (not c!124548)) b!1300268))

(assert (= (and b!1300267 res!864093) b!1300266))

(assert (= (or b!1300266 b!1300268) bm!63614))

(declare-fun m!1190793 () Bool)

(assert (=> bm!63614 m!1190793))

(assert (=> b!1300265 m!1190785))

(assert (=> b!1300265 m!1190785))

(assert (=> b!1300265 m!1190789))

(assert (=> b!1300267 m!1190785))

(declare-fun m!1190795 () Bool)

(assert (=> b!1300267 m!1190795))

(declare-fun m!1190797 () Bool)

(assert (=> b!1300267 m!1190797))

(assert (=> b!1300267 m!1190785))

(declare-fun m!1190799 () Bool)

(assert (=> b!1300267 m!1190799))

(assert (=> b!1300159 d!141049))

(declare-fun d!141051 () Bool)

(declare-fun e!741726 () Bool)

(assert (=> d!141051 e!741726))

(declare-fun res!864097 () Bool)

(assert (=> d!141051 (=> res!864097 e!741726)))

(declare-fun lt!581111 () Bool)

(assert (=> d!141051 (= res!864097 (not lt!581111))))

(declare-fun lt!581109 () Bool)

(assert (=> d!141051 (= lt!581111 lt!581109)))

(declare-fun lt!581110 () Unit!42872)

(declare-fun e!741727 () Unit!42872)

(assert (=> d!141051 (= lt!581110 e!741727)))

(declare-fun c!124551 () Bool)

(assert (=> d!141051 (= c!124551 lt!581109)))

(declare-fun containsKey!719 (List!29718 (_ BitVec 64)) Bool)

(assert (=> d!141051 (= lt!581109 (containsKey!719 (toList!10144 (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141051 (= (contains!8198 (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!581111)))

(declare-fun b!1300275 () Bool)

(declare-fun lt!581112 () Unit!42872)

(assert (=> b!1300275 (= e!741727 lt!581112)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!466 (List!29718 (_ BitVec 64)) Unit!42872)

(assert (=> b!1300275 (= lt!581112 (lemmaContainsKeyImpliesGetValueByKeyDefined!466 (toList!10144 (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-datatypes ((Option!753 0))(
  ( (Some!752 (v!20093 V!51529)) (None!751) )
))
(declare-fun isDefined!509 (Option!753) Bool)

(declare-fun getValueByKey!702 (List!29718 (_ BitVec 64)) Option!753)

(assert (=> b!1300275 (isDefined!509 (getValueByKey!702 (toList!10144 (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1300276 () Bool)

(declare-fun Unit!42874 () Unit!42872)

(assert (=> b!1300276 (= e!741727 Unit!42874)))

(declare-fun b!1300277 () Bool)

(assert (=> b!1300277 (= e!741726 (isDefined!509 (getValueByKey!702 (toList!10144 (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141051 c!124551) b!1300275))

(assert (= (and d!141051 (not c!124551)) b!1300276))

(assert (= (and d!141051 (not res!864097)) b!1300277))

(declare-fun m!1190801 () Bool)

(assert (=> d!141051 m!1190801))

(declare-fun m!1190803 () Bool)

(assert (=> b!1300275 m!1190803))

(declare-fun m!1190805 () Bool)

(assert (=> b!1300275 m!1190805))

(assert (=> b!1300275 m!1190805))

(declare-fun m!1190807 () Bool)

(assert (=> b!1300275 m!1190807))

(assert (=> b!1300277 m!1190805))

(assert (=> b!1300277 m!1190805))

(assert (=> b!1300277 m!1190807))

(assert (=> b!1300168 d!141051))

(declare-fun d!141053 () Bool)

(declare-fun e!741730 () Bool)

(assert (=> d!141053 e!741730))

(declare-fun res!864103 () Bool)

(assert (=> d!141053 (=> (not res!864103) (not e!741730))))

(declare-fun lt!581123 () ListLongMap!20257)

(assert (=> d!141053 (= res!864103 (contains!8198 lt!581123 (_1!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!581122 () List!29718)

(assert (=> d!141053 (= lt!581123 (ListLongMap!20258 lt!581122))))

(declare-fun lt!581124 () Unit!42872)

(declare-fun lt!581121 () Unit!42872)

(assert (=> d!141053 (= lt!581124 lt!581121)))

(assert (=> d!141053 (= (getValueByKey!702 lt!581122 (_1!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!752 (_2!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!346 (List!29718 (_ BitVec 64) V!51529) Unit!42872)

(assert (=> d!141053 (= lt!581121 (lemmaContainsTupThenGetReturnValue!346 lt!581122 (_1!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!475 (List!29718 (_ BitVec 64) V!51529) List!29718)

(assert (=> d!141053 (= lt!581122 (insertStrictlySorted!475 (toList!10144 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141053 (= (+!4487 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!581123)))

(declare-fun b!1300282 () Bool)

(declare-fun res!864102 () Bool)

(assert (=> b!1300282 (=> (not res!864102) (not e!741730))))

(assert (=> b!1300282 (= res!864102 (= (getValueByKey!702 (toList!10144 lt!581123) (_1!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!752 (_2!11311 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1300283 () Bool)

(declare-fun contains!8202 (List!29718 tuple2!22600) Bool)

(assert (=> b!1300283 (= e!741730 (contains!8202 (toList!10144 lt!581123) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141053 res!864103) b!1300282))

(assert (= (and b!1300282 res!864102) b!1300283))

(declare-fun m!1190809 () Bool)

(assert (=> d!141053 m!1190809))

(declare-fun m!1190811 () Bool)

(assert (=> d!141053 m!1190811))

(declare-fun m!1190813 () Bool)

(assert (=> d!141053 m!1190813))

(declare-fun m!1190815 () Bool)

(assert (=> d!141053 m!1190815))

(declare-fun m!1190817 () Bool)

(assert (=> b!1300282 m!1190817))

(declare-fun m!1190819 () Bool)

(assert (=> b!1300283 m!1190819))

(assert (=> b!1300168 d!141053))

(declare-fun b!1300308 () Bool)

(declare-fun res!864114 () Bool)

(declare-fun e!741751 () Bool)

(assert (=> b!1300308 (=> (not res!864114) (not e!741751))))

(declare-fun lt!581141 () ListLongMap!20257)

(assert (=> b!1300308 (= res!864114 (not (contains!8198 lt!581141 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1300309 () Bool)

(declare-fun e!741748 () Bool)

(declare-fun e!741749 () Bool)

(assert (=> b!1300309 (= e!741748 e!741749)))

(declare-fun c!124561 () Bool)

(assert (=> b!1300309 (= c!124561 (bvslt from!2144 (size!42324 _keys!1741)))))

(declare-fun b!1300310 () Bool)

(assert (=> b!1300310 (= e!741751 e!741748)))

(declare-fun c!124560 () Bool)

(declare-fun e!741750 () Bool)

(assert (=> b!1300310 (= c!124560 e!741750)))

(declare-fun res!864115 () Bool)

(assert (=> b!1300310 (=> (not res!864115) (not e!741750))))

(assert (=> b!1300310 (= res!864115 (bvslt from!2144 (size!42324 _keys!1741)))))

(declare-fun b!1300311 () Bool)

(declare-fun e!741746 () ListLongMap!20257)

(assert (=> b!1300311 (= e!741746 (ListLongMap!20258 Nil!29715))))

(declare-fun b!1300312 () Bool)

(declare-fun e!741747 () ListLongMap!20257)

(declare-fun call!63620 () ListLongMap!20257)

(assert (=> b!1300312 (= e!741747 call!63620)))

(declare-fun b!1300313 () Bool)

(assert (=> b!1300313 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741)))))

(assert (=> b!1300313 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42323 _values!1445)))))

(declare-fun e!741745 () Bool)

(declare-fun apply!1009 (ListLongMap!20257 (_ BitVec 64)) V!51529)

(declare-fun get!21121 (ValueCell!16511 V!51529) V!51529)

(declare-fun dynLambda!3444 (Int (_ BitVec 64)) V!51529)

(assert (=> b!1300313 (= e!741745 (= (apply!1009 lt!581141 (select (arr!41772 _keys!1741) from!2144)) (get!21121 (select (arr!41771 _values!1445) from!2144) (dynLambda!3444 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1300314 () Bool)

(assert (=> b!1300314 (= e!741748 e!741745)))

(assert (=> b!1300314 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741)))))

(declare-fun res!864113 () Bool)

(assert (=> b!1300314 (= res!864113 (contains!8198 lt!581141 (select (arr!41772 _keys!1741) from!2144)))))

(assert (=> b!1300314 (=> (not res!864113) (not e!741745))))

(declare-fun b!1300315 () Bool)

(assert (=> b!1300315 (= e!741746 e!741747)))

(declare-fun c!124562 () Bool)

(assert (=> b!1300315 (= c!124562 (validKeyInArray!0 (select (arr!41772 _keys!1741) from!2144)))))

(declare-fun b!1300317 () Bool)

(assert (=> b!1300317 (= e!741749 (= lt!581141 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1300318 () Bool)

(assert (=> b!1300318 (= e!741750 (validKeyInArray!0 (select (arr!41772 _keys!1741) from!2144)))))

(assert (=> b!1300318 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1300319 () Bool)

(declare-fun lt!581143 () Unit!42872)

(declare-fun lt!581144 () Unit!42872)

(assert (=> b!1300319 (= lt!581143 lt!581144)))

(declare-fun lt!581139 () V!51529)

(declare-fun lt!581142 () ListLongMap!20257)

(declare-fun lt!581140 () (_ BitVec 64))

(declare-fun lt!581145 () (_ BitVec 64))

(assert (=> b!1300319 (not (contains!8198 (+!4487 lt!581142 (tuple2!22601 lt!581145 lt!581139)) lt!581140))))

(declare-fun addStillNotContains!452 (ListLongMap!20257 (_ BitVec 64) V!51529 (_ BitVec 64)) Unit!42872)

(assert (=> b!1300319 (= lt!581144 (addStillNotContains!452 lt!581142 lt!581145 lt!581139 lt!581140))))

(assert (=> b!1300319 (= lt!581140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1300319 (= lt!581139 (get!21121 (select (arr!41771 _values!1445) from!2144) (dynLambda!3444 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1300319 (= lt!581145 (select (arr!41772 _keys!1741) from!2144))))

(assert (=> b!1300319 (= lt!581142 call!63620)))

(assert (=> b!1300319 (= e!741747 (+!4487 call!63620 (tuple2!22601 (select (arr!41772 _keys!1741) from!2144) (get!21121 (select (arr!41771 _values!1445) from!2144) (dynLambda!3444 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!63617 () Bool)

(assert (=> bm!63617 (= call!63620 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun b!1300316 () Bool)

(declare-fun isEmpty!1058 (ListLongMap!20257) Bool)

(assert (=> b!1300316 (= e!741749 (isEmpty!1058 lt!581141))))

(declare-fun d!141055 () Bool)

(assert (=> d!141055 e!741751))

(declare-fun res!864112 () Bool)

(assert (=> d!141055 (=> (not res!864112) (not e!741751))))

(assert (=> d!141055 (= res!864112 (not (contains!8198 lt!581141 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!141055 (= lt!581141 e!741746)))

(declare-fun c!124563 () Bool)

(assert (=> d!141055 (= c!124563 (bvsge from!2144 (size!42324 _keys!1741)))))

(assert (=> d!141055 (validMask!0 mask!2175)))

(assert (=> d!141055 (= (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581141)))

(assert (= (and d!141055 c!124563) b!1300311))

(assert (= (and d!141055 (not c!124563)) b!1300315))

(assert (= (and b!1300315 c!124562) b!1300319))

(assert (= (and b!1300315 (not c!124562)) b!1300312))

(assert (= (or b!1300319 b!1300312) bm!63617))

(assert (= (and d!141055 res!864112) b!1300308))

(assert (= (and b!1300308 res!864114) b!1300310))

(assert (= (and b!1300310 res!864115) b!1300318))

(assert (= (and b!1300310 c!124560) b!1300314))

(assert (= (and b!1300310 (not c!124560)) b!1300309))

(assert (= (and b!1300314 res!864113) b!1300313))

(assert (= (and b!1300309 c!124561) b!1300317))

(assert (= (and b!1300309 (not c!124561)) b!1300316))

(declare-fun b_lambda!23163 () Bool)

(assert (=> (not b_lambda!23163) (not b!1300313)))

(declare-fun t!43289 () Bool)

(declare-fun tb!11369 () Bool)

(assert (=> (and start!109766 (= defaultEntry!1448 defaultEntry!1448) t!43289) tb!11369))

(declare-fun result!23755 () Bool)

(assert (=> tb!11369 (= result!23755 tp_is_empty!34819)))

(assert (=> b!1300313 t!43289))

(declare-fun b_and!47275 () Bool)

(assert (= b_and!47269 (and (=> t!43289 result!23755) b_and!47275)))

(declare-fun b_lambda!23165 () Bool)

(assert (=> (not b_lambda!23165) (not b!1300319)))

(assert (=> b!1300319 t!43289))

(declare-fun b_and!47277 () Bool)

(assert (= b_and!47275 (and (=> t!43289 result!23755) b_and!47277)))

(assert (=> b!1300315 m!1190723))

(assert (=> b!1300315 m!1190723))

(assert (=> b!1300315 m!1190725))

(assert (=> b!1300313 m!1190723))

(declare-fun m!1190821 () Bool)

(assert (=> b!1300313 m!1190821))

(declare-fun m!1190823 () Bool)

(assert (=> b!1300313 m!1190823))

(declare-fun m!1190825 () Bool)

(assert (=> b!1300313 m!1190825))

(assert (=> b!1300313 m!1190723))

(assert (=> b!1300313 m!1190825))

(assert (=> b!1300313 m!1190823))

(declare-fun m!1190827 () Bool)

(assert (=> b!1300313 m!1190827))

(declare-fun m!1190829 () Bool)

(assert (=> b!1300308 m!1190829))

(declare-fun m!1190831 () Bool)

(assert (=> d!141055 m!1190831))

(assert (=> d!141055 m!1190727))

(assert (=> b!1300318 m!1190723))

(assert (=> b!1300318 m!1190723))

(assert (=> b!1300318 m!1190725))

(declare-fun m!1190833 () Bool)

(assert (=> bm!63617 m!1190833))

(declare-fun m!1190835 () Bool)

(assert (=> b!1300319 m!1190835))

(assert (=> b!1300319 m!1190823))

(declare-fun m!1190837 () Bool)

(assert (=> b!1300319 m!1190837))

(declare-fun m!1190839 () Bool)

(assert (=> b!1300319 m!1190839))

(assert (=> b!1300319 m!1190723))

(assert (=> b!1300319 m!1190825))

(assert (=> b!1300319 m!1190823))

(assert (=> b!1300319 m!1190827))

(assert (=> b!1300319 m!1190837))

(declare-fun m!1190841 () Bool)

(assert (=> b!1300319 m!1190841))

(assert (=> b!1300319 m!1190825))

(assert (=> b!1300314 m!1190723))

(assert (=> b!1300314 m!1190723))

(declare-fun m!1190843 () Bool)

(assert (=> b!1300314 m!1190843))

(declare-fun m!1190845 () Bool)

(assert (=> b!1300316 m!1190845))

(assert (=> b!1300317 m!1190833))

(assert (=> b!1300168 d!141055))

(declare-fun d!141057 () Bool)

(assert (=> d!141057 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109766 d!141057))

(declare-fun d!141059 () Bool)

(assert (=> d!141059 (= (array_inv!31771 _values!1445) (bvsge (size!42323 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109766 d!141059))

(declare-fun d!141061 () Bool)

(assert (=> d!141061 (= (array_inv!31772 _keys!1741) (bvsge (size!42324 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109766 d!141061))

(declare-fun d!141063 () Bool)

(declare-fun e!741752 () Bool)

(assert (=> d!141063 e!741752))

(declare-fun res!864116 () Bool)

(assert (=> d!141063 (=> res!864116 e!741752)))

(declare-fun lt!581148 () Bool)

(assert (=> d!141063 (= res!864116 (not lt!581148))))

(declare-fun lt!581146 () Bool)

(assert (=> d!141063 (= lt!581148 lt!581146)))

(declare-fun lt!581147 () Unit!42872)

(declare-fun e!741753 () Unit!42872)

(assert (=> d!141063 (= lt!581147 e!741753)))

(declare-fun c!124564 () Bool)

(assert (=> d!141063 (= c!124564 lt!581146)))

(assert (=> d!141063 (= lt!581146 (containsKey!719 (toList!10144 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141063 (= (contains!8198 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581148)))

(declare-fun b!1300322 () Bool)

(declare-fun lt!581149 () Unit!42872)

(assert (=> b!1300322 (= e!741753 lt!581149)))

(assert (=> b!1300322 (= lt!581149 (lemmaContainsKeyImpliesGetValueByKeyDefined!466 (toList!10144 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1300322 (isDefined!509 (getValueByKey!702 (toList!10144 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1300323 () Bool)

(declare-fun Unit!42875 () Unit!42872)

(assert (=> b!1300323 (= e!741753 Unit!42875)))

(declare-fun b!1300324 () Bool)

(assert (=> b!1300324 (= e!741752 (isDefined!509 (getValueByKey!702 (toList!10144 (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141063 c!124564) b!1300322))

(assert (= (and d!141063 (not c!124564)) b!1300323))

(assert (= (and d!141063 (not res!864116)) b!1300324))

(declare-fun m!1190847 () Bool)

(assert (=> d!141063 m!1190847))

(declare-fun m!1190849 () Bool)

(assert (=> b!1300322 m!1190849))

(declare-fun m!1190851 () Bool)

(assert (=> b!1300322 m!1190851))

(assert (=> b!1300322 m!1190851))

(declare-fun m!1190853 () Bool)

(assert (=> b!1300322 m!1190853))

(assert (=> b!1300324 m!1190851))

(assert (=> b!1300324 m!1190851))

(assert (=> b!1300324 m!1190853))

(assert (=> b!1300158 d!141063))

(declare-fun bm!63633 () Bool)

(declare-fun call!63638 () Bool)

(declare-fun lt!581212 () ListLongMap!20257)

(assert (=> bm!63633 (= call!63638 (contains!8198 lt!581212 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300367 () Bool)

(declare-fun e!741792 () ListLongMap!20257)

(declare-fun call!63639 () ListLongMap!20257)

(assert (=> b!1300367 (= e!741792 call!63639)))

(declare-fun b!1300368 () Bool)

(declare-fun e!741785 () Bool)

(declare-fun e!741789 () Bool)

(assert (=> b!1300368 (= e!741785 e!741789)))

(declare-fun c!124578 () Bool)

(assert (=> b!1300368 (= c!124578 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300369 () Bool)

(declare-fun c!124577 () Bool)

(assert (=> b!1300369 (= c!124577 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!741780 () ListLongMap!20257)

(assert (=> b!1300369 (= e!741780 e!741792)))

(declare-fun b!1300370 () Bool)

(declare-fun e!741783 () ListLongMap!20257)

(assert (=> b!1300370 (= e!741783 e!741780)))

(declare-fun c!124580 () Bool)

(assert (=> b!1300370 (= c!124580 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300371 () Bool)

(declare-fun e!741786 () Bool)

(assert (=> b!1300371 (= e!741786 (= (apply!1009 lt!581212 (select (arr!41772 _keys!1741) from!2144)) (get!21121 (select (arr!41771 _values!1445) from!2144) (dynLambda!3444 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300371 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42323 _values!1445)))))

(assert (=> b!1300371 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741)))))

(declare-fun bm!63634 () Bool)

(declare-fun call!63637 () ListLongMap!20257)

(declare-fun call!63641 () ListLongMap!20257)

(assert (=> bm!63634 (= call!63637 call!63641)))

(declare-fun b!1300372 () Bool)

(declare-fun res!864136 () Bool)

(assert (=> b!1300372 (=> (not res!864136) (not e!741785))))

(declare-fun e!741790 () Bool)

(assert (=> b!1300372 (= res!864136 e!741790)))

(declare-fun c!124582 () Bool)

(assert (=> b!1300372 (= c!124582 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!63635 () Bool)

(declare-fun call!63636 () Bool)

(assert (=> bm!63635 (= call!63636 (contains!8198 lt!581212 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300373 () Bool)

(declare-fun e!741781 () Bool)

(assert (=> b!1300373 (= e!741781 (= (apply!1009 lt!581212 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1300374 () Bool)

(declare-fun e!741784 () Bool)

(assert (=> b!1300374 (= e!741784 (validKeyInArray!0 (select (arr!41772 _keys!1741) from!2144)))))

(declare-fun call!63635 () ListLongMap!20257)

(declare-fun bm!63632 () Bool)

(assert (=> bm!63632 (= call!63635 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun d!141065 () Bool)

(assert (=> d!141065 e!741785))

(declare-fun res!864142 () Bool)

(assert (=> d!141065 (=> (not res!864142) (not e!741785))))

(assert (=> d!141065 (= res!864142 (or (bvsge from!2144 (size!42324 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741)))))))

(declare-fun lt!581195 () ListLongMap!20257)

(assert (=> d!141065 (= lt!581212 lt!581195)))

(declare-fun lt!581207 () Unit!42872)

(declare-fun e!741782 () Unit!42872)

(assert (=> d!141065 (= lt!581207 e!741782)))

(declare-fun c!124579 () Bool)

(declare-fun e!741787 () Bool)

(assert (=> d!141065 (= c!124579 e!741787)))

(declare-fun res!864135 () Bool)

(assert (=> d!141065 (=> (not res!864135) (not e!741787))))

(assert (=> d!141065 (= res!864135 (bvslt from!2144 (size!42324 _keys!1741)))))

(assert (=> d!141065 (= lt!581195 e!741783)))

(declare-fun c!124581 () Bool)

(assert (=> d!141065 (= c!124581 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141065 (validMask!0 mask!2175)))

(assert (=> d!141065 (= (getCurrentListMap!5059 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581212)))

(declare-fun bm!63636 () Bool)

(assert (=> bm!63636 (= call!63641 call!63635)))

(declare-fun b!1300375 () Bool)

(assert (=> b!1300375 (= e!741790 (not call!63636))))

(declare-fun b!1300376 () Bool)

(declare-fun Unit!42876 () Unit!42872)

(assert (=> b!1300376 (= e!741782 Unit!42876)))

(declare-fun b!1300377 () Bool)

(assert (=> b!1300377 (= e!741789 (not call!63638))))

(declare-fun b!1300378 () Bool)

(assert (=> b!1300378 (= e!741790 e!741781)))

(declare-fun res!864137 () Bool)

(assert (=> b!1300378 (= res!864137 call!63636)))

(assert (=> b!1300378 (=> (not res!864137) (not e!741781))))

(declare-fun b!1300379 () Bool)

(assert (=> b!1300379 (= e!741780 call!63639)))

(declare-fun b!1300380 () Bool)

(assert (=> b!1300380 (= e!741792 call!63637)))

(declare-fun b!1300381 () Bool)

(declare-fun lt!581200 () Unit!42872)

(assert (=> b!1300381 (= e!741782 lt!581200)))

(declare-fun lt!581215 () ListLongMap!20257)

(assert (=> b!1300381 (= lt!581215 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581201 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581214 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581214 (select (arr!41772 _keys!1741) from!2144))))

(declare-fun lt!581199 () Unit!42872)

(declare-fun addStillContains!1104 (ListLongMap!20257 (_ BitVec 64) V!51529 (_ BitVec 64)) Unit!42872)

(assert (=> b!1300381 (= lt!581199 (addStillContains!1104 lt!581215 lt!581201 zeroValue!1387 lt!581214))))

(assert (=> b!1300381 (contains!8198 (+!4487 lt!581215 (tuple2!22601 lt!581201 zeroValue!1387)) lt!581214)))

(declare-fun lt!581208 () Unit!42872)

(assert (=> b!1300381 (= lt!581208 lt!581199)))

(declare-fun lt!581198 () ListLongMap!20257)

(assert (=> b!1300381 (= lt!581198 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581194 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581194 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581196 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581196 (select (arr!41772 _keys!1741) from!2144))))

(declare-fun lt!581211 () Unit!42872)

(declare-fun addApplyDifferent!547 (ListLongMap!20257 (_ BitVec 64) V!51529 (_ BitVec 64)) Unit!42872)

(assert (=> b!1300381 (= lt!581211 (addApplyDifferent!547 lt!581198 lt!581194 minValue!1387 lt!581196))))

(assert (=> b!1300381 (= (apply!1009 (+!4487 lt!581198 (tuple2!22601 lt!581194 minValue!1387)) lt!581196) (apply!1009 lt!581198 lt!581196))))

(declare-fun lt!581205 () Unit!42872)

(assert (=> b!1300381 (= lt!581205 lt!581211)))

(declare-fun lt!581204 () ListLongMap!20257)

(assert (=> b!1300381 (= lt!581204 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581210 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581202 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581202 (select (arr!41772 _keys!1741) from!2144))))

(declare-fun lt!581209 () Unit!42872)

(assert (=> b!1300381 (= lt!581209 (addApplyDifferent!547 lt!581204 lt!581210 zeroValue!1387 lt!581202))))

(assert (=> b!1300381 (= (apply!1009 (+!4487 lt!581204 (tuple2!22601 lt!581210 zeroValue!1387)) lt!581202) (apply!1009 lt!581204 lt!581202))))

(declare-fun lt!581213 () Unit!42872)

(assert (=> b!1300381 (= lt!581213 lt!581209)))

(declare-fun lt!581203 () ListLongMap!20257)

(assert (=> b!1300381 (= lt!581203 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581197 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581197 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581206 () (_ BitVec 64))

(assert (=> b!1300381 (= lt!581206 (select (arr!41772 _keys!1741) from!2144))))

(assert (=> b!1300381 (= lt!581200 (addApplyDifferent!547 lt!581203 lt!581197 minValue!1387 lt!581206))))

(assert (=> b!1300381 (= (apply!1009 (+!4487 lt!581203 (tuple2!22601 lt!581197 minValue!1387)) lt!581206) (apply!1009 lt!581203 lt!581206))))

(declare-fun bm!63637 () Bool)

(declare-fun call!63640 () ListLongMap!20257)

(assert (=> bm!63637 (= call!63639 call!63640)))

(declare-fun bm!63638 () Bool)

(assert (=> bm!63638 (= call!63640 (+!4487 (ite c!124581 call!63635 (ite c!124580 call!63641 call!63637)) (ite (or c!124581 c!124580) (tuple2!22601 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1300382 () Bool)

(assert (=> b!1300382 (= e!741787 (validKeyInArray!0 (select (arr!41772 _keys!1741) from!2144)))))

(declare-fun b!1300383 () Bool)

(declare-fun e!741788 () Bool)

(assert (=> b!1300383 (= e!741788 (= (apply!1009 lt!581212 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300384 () Bool)

(declare-fun res!864140 () Bool)

(assert (=> b!1300384 (=> (not res!864140) (not e!741785))))

(declare-fun e!741791 () Bool)

(assert (=> b!1300384 (= res!864140 e!741791)))

(declare-fun res!864143 () Bool)

(assert (=> b!1300384 (=> res!864143 e!741791)))

(assert (=> b!1300384 (= res!864143 (not e!741784))))

(declare-fun res!864139 () Bool)

(assert (=> b!1300384 (=> (not res!864139) (not e!741784))))

(assert (=> b!1300384 (= res!864139 (bvslt from!2144 (size!42324 _keys!1741)))))

(declare-fun b!1300385 () Bool)

(assert (=> b!1300385 (= e!741783 (+!4487 call!63640 (tuple2!22601 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1300386 () Bool)

(assert (=> b!1300386 (= e!741789 e!741788)))

(declare-fun res!864141 () Bool)

(assert (=> b!1300386 (= res!864141 call!63638)))

(assert (=> b!1300386 (=> (not res!864141) (not e!741788))))

(declare-fun b!1300387 () Bool)

(assert (=> b!1300387 (= e!741791 e!741786)))

(declare-fun res!864138 () Bool)

(assert (=> b!1300387 (=> (not res!864138) (not e!741786))))

(assert (=> b!1300387 (= res!864138 (contains!8198 lt!581212 (select (arr!41772 _keys!1741) from!2144)))))

(assert (=> b!1300387 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42324 _keys!1741)))))

(assert (= (and d!141065 c!124581) b!1300385))

(assert (= (and d!141065 (not c!124581)) b!1300370))

(assert (= (and b!1300370 c!124580) b!1300379))

(assert (= (and b!1300370 (not c!124580)) b!1300369))

(assert (= (and b!1300369 c!124577) b!1300367))

(assert (= (and b!1300369 (not c!124577)) b!1300380))

(assert (= (or b!1300367 b!1300380) bm!63634))

(assert (= (or b!1300379 bm!63634) bm!63636))

(assert (= (or b!1300379 b!1300367) bm!63637))

(assert (= (or b!1300385 bm!63636) bm!63632))

(assert (= (or b!1300385 bm!63637) bm!63638))

(assert (= (and d!141065 res!864135) b!1300382))

(assert (= (and d!141065 c!124579) b!1300381))

(assert (= (and d!141065 (not c!124579)) b!1300376))

(assert (= (and d!141065 res!864142) b!1300384))

(assert (= (and b!1300384 res!864139) b!1300374))

(assert (= (and b!1300384 (not res!864143)) b!1300387))

(assert (= (and b!1300387 res!864138) b!1300371))

(assert (= (and b!1300384 res!864140) b!1300372))

(assert (= (and b!1300372 c!124582) b!1300378))

(assert (= (and b!1300372 (not c!124582)) b!1300375))

(assert (= (and b!1300378 res!864137) b!1300373))

(assert (= (or b!1300378 b!1300375) bm!63635))

(assert (= (and b!1300372 res!864136) b!1300368))

(assert (= (and b!1300368 c!124578) b!1300386))

(assert (= (and b!1300368 (not c!124578)) b!1300377))

(assert (= (and b!1300386 res!864141) b!1300383))

(assert (= (or b!1300386 b!1300377) bm!63633))

(declare-fun b_lambda!23167 () Bool)

(assert (=> (not b_lambda!23167) (not b!1300371)))

(assert (=> b!1300371 t!43289))

(declare-fun b_and!47279 () Bool)

(assert (= b_and!47277 (and (=> t!43289 result!23755) b_and!47279)))

(declare-fun m!1190855 () Bool)

(assert (=> b!1300373 m!1190855))

(declare-fun m!1190857 () Bool)

(assert (=> b!1300383 m!1190857))

(assert (=> b!1300387 m!1190723))

(assert (=> b!1300387 m!1190723))

(declare-fun m!1190859 () Bool)

(assert (=> b!1300387 m!1190859))

(assert (=> b!1300371 m!1190823))

(assert (=> b!1300371 m!1190723))

(declare-fun m!1190861 () Bool)

(assert (=> b!1300371 m!1190861))

(assert (=> b!1300371 m!1190825))

(assert (=> b!1300371 m!1190823))

(assert (=> b!1300371 m!1190827))

(assert (=> b!1300371 m!1190825))

(assert (=> b!1300371 m!1190723))

(declare-fun m!1190863 () Bool)

(assert (=> bm!63635 m!1190863))

(assert (=> b!1300382 m!1190723))

(assert (=> b!1300382 m!1190723))

(assert (=> b!1300382 m!1190725))

(declare-fun m!1190865 () Bool)

(assert (=> b!1300385 m!1190865))

(assert (=> bm!63632 m!1190713))

(assert (=> b!1300374 m!1190723))

(assert (=> b!1300374 m!1190723))

(assert (=> b!1300374 m!1190725))

(declare-fun m!1190867 () Bool)

(assert (=> b!1300381 m!1190867))

(declare-fun m!1190869 () Bool)

(assert (=> b!1300381 m!1190869))

(declare-fun m!1190871 () Bool)

(assert (=> b!1300381 m!1190871))

(declare-fun m!1190873 () Bool)

(assert (=> b!1300381 m!1190873))

(declare-fun m!1190875 () Bool)

(assert (=> b!1300381 m!1190875))

(declare-fun m!1190877 () Bool)

(assert (=> b!1300381 m!1190877))

(declare-fun m!1190879 () Bool)

(assert (=> b!1300381 m!1190879))

(declare-fun m!1190881 () Bool)

(assert (=> b!1300381 m!1190881))

(assert (=> b!1300381 m!1190723))

(declare-fun m!1190883 () Bool)

(assert (=> b!1300381 m!1190883))

(assert (=> b!1300381 m!1190713))

(declare-fun m!1190885 () Bool)

(assert (=> b!1300381 m!1190885))

(assert (=> b!1300381 m!1190877))

(declare-fun m!1190887 () Bool)

(assert (=> b!1300381 m!1190887))

(declare-fun m!1190889 () Bool)

(assert (=> b!1300381 m!1190889))

(assert (=> b!1300381 m!1190869))

(declare-fun m!1190891 () Bool)

(assert (=> b!1300381 m!1190891))

(assert (=> b!1300381 m!1190873))

(declare-fun m!1190893 () Bool)

(assert (=> b!1300381 m!1190893))

(assert (=> b!1300381 m!1190883))

(declare-fun m!1190895 () Bool)

(assert (=> b!1300381 m!1190895))

(declare-fun m!1190897 () Bool)

(assert (=> bm!63633 m!1190897))

(declare-fun m!1190899 () Bool)

(assert (=> bm!63638 m!1190899))

(assert (=> d!141065 m!1190727))

(assert (=> b!1300158 d!141065))

(declare-fun b!1300395 () Bool)

(declare-fun e!741798 () Bool)

(assert (=> b!1300395 (= e!741798 tp_is_empty!34819)))

(declare-fun condMapEmpty!53810 () Bool)

(declare-fun mapDefault!53810 () ValueCell!16511)

(assert (=> mapNonEmpty!53801 (= condMapEmpty!53810 (= mapRest!53801 ((as const (Array (_ BitVec 32) ValueCell!16511)) mapDefault!53810)))))

(declare-fun mapRes!53810 () Bool)

(assert (=> mapNonEmpty!53801 (= tp!102669 (and e!741798 mapRes!53810))))

(declare-fun b!1300394 () Bool)

(declare-fun e!741797 () Bool)

(assert (=> b!1300394 (= e!741797 tp_is_empty!34819)))

(declare-fun mapNonEmpty!53810 () Bool)

(declare-fun tp!102684 () Bool)

(assert (=> mapNonEmpty!53810 (= mapRes!53810 (and tp!102684 e!741797))))

(declare-fun mapValue!53810 () ValueCell!16511)

(declare-fun mapRest!53810 () (Array (_ BitVec 32) ValueCell!16511))

(declare-fun mapKey!53810 () (_ BitVec 32))

(assert (=> mapNonEmpty!53810 (= mapRest!53801 (store mapRest!53810 mapKey!53810 mapValue!53810))))

(declare-fun mapIsEmpty!53810 () Bool)

(assert (=> mapIsEmpty!53810 mapRes!53810))

(assert (= (and mapNonEmpty!53801 condMapEmpty!53810) mapIsEmpty!53810))

(assert (= (and mapNonEmpty!53801 (not condMapEmpty!53810)) mapNonEmpty!53810))

(assert (= (and mapNonEmpty!53810 ((_ is ValueCellFull!16511) mapValue!53810)) b!1300394))

(assert (= (and mapNonEmpty!53801 ((_ is ValueCellFull!16511) mapDefault!53810)) b!1300395))

(declare-fun m!1190901 () Bool)

(assert (=> mapNonEmpty!53810 m!1190901))

(declare-fun b_lambda!23169 () Bool)

(assert (= b_lambda!23165 (or (and start!109766 b_free!29179) b_lambda!23169)))

(declare-fun b_lambda!23171 () Bool)

(assert (= b_lambda!23163 (or (and start!109766 b_free!29179) b_lambda!23171)))

(declare-fun b_lambda!23173 () Bool)

(assert (= b_lambda!23167 (or (and start!109766 b_free!29179) b_lambda!23173)))

(check-sat (not b_lambda!23171) (not b_lambda!23173) (not bm!63632) (not b!1300317) (not b!1300387) (not b!1300381) (not b!1300256) (not b_next!29179) (not b!1300265) (not bm!63611) (not mapNonEmpty!53810) (not b!1300252) (not b!1300275) b_and!47279 (not b!1300383) (not b!1300267) (not b!1300315) (not b!1300254) (not b_lambda!23169) (not bm!63638) (not b!1300283) (not d!141055) (not bm!63617) (not bm!63614) (not bm!63635) (not b!1300308) (not bm!63633) (not b!1300314) (not d!141063) (not b!1300324) (not b!1300385) (not b!1300313) (not b!1300371) (not b!1300374) (not b!1300316) (not d!141053) tp_is_empty!34819 (not d!141051) (not b!1300382) (not b!1300282) (not b!1300318) (not b!1300277) (not b!1300322) (not b!1300373) (not d!141065) (not b!1300319))
(check-sat b_and!47279 (not b_next!29179))
