; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113606 () Bool)

(assert start!113606)

(declare-fun b_free!31573 () Bool)

(declare-fun b_next!31573 () Bool)

(assert (=> start!113606 (= b_free!31573 (not b_next!31573))))

(declare-fun tp!110532 () Bool)

(declare-fun b_and!50913 () Bool)

(assert (=> start!113606 (= tp!110532 b_and!50913)))

(declare-fun b!1348593 () Bool)

(declare-fun e!767186 () Bool)

(declare-fun e!767188 () Bool)

(declare-fun mapRes!58073 () Bool)

(assert (=> b!1348593 (= e!767186 (and e!767188 mapRes!58073))))

(declare-fun condMapEmpty!58073 () Bool)

(declare-datatypes ((V!55201 0))(
  ( (V!55202 (val!18861 Int)) )
))
(declare-datatypes ((ValueCell!17888 0))(
  ( (ValueCellFull!17888 (v!21512 V!55201)) (EmptyCell!17888) )
))
(declare-datatypes ((array!91925 0))(
  ( (array!91926 (arr!44417 (Array (_ BitVec 32) ValueCell!17888)) (size!44969 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91925)

(declare-fun mapDefault!58073 () ValueCell!17888)

(assert (=> b!1348593 (= condMapEmpty!58073 (= (arr!44417 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17888)) mapDefault!58073)))))

(declare-fun res!894793 () Bool)

(declare-fun e!767190 () Bool)

(assert (=> start!113606 (=> (not res!894793) (not e!767190))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113606 (= res!894793 (validMask!0 mask!1977))))

(assert (=> start!113606 e!767190))

(declare-fun tp_is_empty!37573 () Bool)

(assert (=> start!113606 tp_is_empty!37573))

(assert (=> start!113606 true))

(declare-datatypes ((array!91927 0))(
  ( (array!91928 (arr!44418 (Array (_ BitVec 32) (_ BitVec 64))) (size!44970 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91927)

(declare-fun array_inv!33655 (array!91927) Bool)

(assert (=> start!113606 (array_inv!33655 _keys!1571)))

(declare-fun array_inv!33656 (array!91925) Bool)

(assert (=> start!113606 (and (array_inv!33656 _values!1303) e!767186)))

(assert (=> start!113606 tp!110532))

(declare-fun mapNonEmpty!58073 () Bool)

(declare-fun tp!110531 () Bool)

(declare-fun e!767189 () Bool)

(assert (=> mapNonEmpty!58073 (= mapRes!58073 (and tp!110531 e!767189))))

(declare-fun mapKey!58073 () (_ BitVec 32))

(declare-fun mapRest!58073 () (Array (_ BitVec 32) ValueCell!17888))

(declare-fun mapValue!58073 () ValueCell!17888)

(assert (=> mapNonEmpty!58073 (= (arr!44417 _values!1303) (store mapRest!58073 mapKey!58073 mapValue!58073))))

(declare-fun b!1348594 () Bool)

(declare-fun res!894795 () Bool)

(assert (=> b!1348594 (=> (not res!894795) (not e!767190))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348594 (= res!894795 (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)))))

(declare-fun b!1348595 () Bool)

(assert (=> b!1348595 (= e!767189 tp_is_empty!37573)))

(declare-fun b!1348596 () Bool)

(declare-fun res!894798 () Bool)

(assert (=> b!1348596 (=> (not res!894798) (not e!767190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91927 (_ BitVec 32)) Bool)

(assert (=> b!1348596 (= res!894798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!58073 () Bool)

(assert (=> mapIsEmpty!58073 mapRes!58073))

(declare-fun minValue!1245 () V!55201)

(declare-fun zeroValue!1245 () V!55201)

(declare-fun b!1348597 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24394 0))(
  ( (tuple2!24395 (_1!12208 (_ BitVec 64)) (_2!12208 V!55201)) )
))
(declare-datatypes ((List!31527 0))(
  ( (Nil!31524) (Cons!31523 (h!32732 tuple2!24394) (t!46159 List!31527)) )
))
(declare-datatypes ((ListLongMap!22051 0))(
  ( (ListLongMap!22052 (toList!11041 List!31527)) )
))
(declare-fun contains!9148 (ListLongMap!22051 (_ BitVec 64)) Bool)

(declare-fun +!4884 (ListLongMap!22051 tuple2!24394) ListLongMap!22051)

(declare-fun getCurrentListMapNoExtraKeys!6532 (array!91927 array!91925 (_ BitVec 32) (_ BitVec 32) V!55201 V!55201 (_ BitVec 32) Int) ListLongMap!22051)

(declare-fun get!22453 (ValueCell!17888 V!55201) V!55201)

(declare-fun dynLambda!3814 (Int (_ BitVec 64)) V!55201)

(assert (=> b!1348597 (= e!767190 (not (contains!9148 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142)))))

(declare-fun b!1348598 () Bool)

(declare-fun res!894799 () Bool)

(assert (=> b!1348598 (=> (not res!894799) (not e!767190))))

(assert (=> b!1348598 (= res!894799 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44970 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348599 () Bool)

(declare-fun res!894800 () Bool)

(assert (=> b!1348599 (=> (not res!894800) (not e!767190))))

(assert (=> b!1348599 (= res!894800 (not (= (select (arr!44418 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348600 () Bool)

(declare-fun res!894794 () Bool)

(assert (=> b!1348600 (=> (not res!894794) (not e!767190))))

(declare-datatypes ((List!31528 0))(
  ( (Nil!31525) (Cons!31524 (h!32733 (_ BitVec 64)) (t!46160 List!31528)) )
))
(declare-fun arrayNoDuplicates!0 (array!91927 (_ BitVec 32) List!31528) Bool)

(assert (=> b!1348600 (= res!894794 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31525))))

(declare-fun b!1348601 () Bool)

(declare-fun res!894796 () Bool)

(assert (=> b!1348601 (=> (not res!894796) (not e!767190))))

(declare-fun getCurrentListMap!5873 (array!91927 array!91925 (_ BitVec 32) (_ BitVec 32) V!55201 V!55201 (_ BitVec 32) Int) ListLongMap!22051)

(assert (=> b!1348601 (= res!894796 (contains!9148 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348602 () Bool)

(declare-fun res!894801 () Bool)

(assert (=> b!1348602 (=> (not res!894801) (not e!767190))))

(assert (=> b!1348602 (= res!894801 (and (= (size!44969 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44970 _keys!1571) (size!44969 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348603 () Bool)

(declare-fun res!894797 () Bool)

(assert (=> b!1348603 (=> (not res!894797) (not e!767190))))

(assert (=> b!1348603 (= res!894797 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1348604 () Bool)

(assert (=> b!1348604 (= e!767188 tp_is_empty!37573)))

(assert (= (and start!113606 res!894793) b!1348602))

(assert (= (and b!1348602 res!894801) b!1348596))

(assert (= (and b!1348596 res!894798) b!1348600))

(assert (= (and b!1348600 res!894794) b!1348598))

(assert (= (and b!1348598 res!894799) b!1348601))

(assert (= (and b!1348601 res!894796) b!1348599))

(assert (= (and b!1348599 res!894800) b!1348594))

(assert (= (and b!1348594 res!894795) b!1348603))

(assert (= (and b!1348603 res!894797) b!1348597))

(assert (= (and b!1348593 condMapEmpty!58073) mapIsEmpty!58073))

(assert (= (and b!1348593 (not condMapEmpty!58073)) mapNonEmpty!58073))

(get-info :version)

(assert (= (and mapNonEmpty!58073 ((_ is ValueCellFull!17888) mapValue!58073)) b!1348595))

(assert (= (and b!1348593 ((_ is ValueCellFull!17888) mapDefault!58073)) b!1348604))

(assert (= start!113606 b!1348593))

(declare-fun b_lambda!24643 () Bool)

(assert (=> (not b_lambda!24643) (not b!1348597)))

(declare-fun t!46158 () Bool)

(declare-fun tb!12435 () Bool)

(assert (=> (and start!113606 (= defaultEntry!1306 defaultEntry!1306) t!46158) tb!12435))

(declare-fun result!25973 () Bool)

(assert (=> tb!12435 (= result!25973 tp_is_empty!37573)))

(assert (=> b!1348597 t!46158))

(declare-fun b_and!50915 () Bool)

(assert (= b_and!50913 (and (=> t!46158 result!25973) b_and!50915)))

(declare-fun m!1235163 () Bool)

(assert (=> b!1348600 m!1235163))

(declare-fun m!1235165 () Bool)

(assert (=> b!1348597 m!1235165))

(declare-fun m!1235167 () Bool)

(assert (=> b!1348597 m!1235167))

(declare-fun m!1235169 () Bool)

(assert (=> b!1348597 m!1235169))

(declare-fun m!1235171 () Bool)

(assert (=> b!1348597 m!1235171))

(assert (=> b!1348597 m!1235165))

(declare-fun m!1235173 () Bool)

(assert (=> b!1348597 m!1235173))

(assert (=> b!1348597 m!1235167))

(assert (=> b!1348597 m!1235169))

(assert (=> b!1348597 m!1235173))

(declare-fun m!1235175 () Bool)

(assert (=> b!1348597 m!1235175))

(declare-fun m!1235177 () Bool)

(assert (=> b!1348597 m!1235177))

(assert (=> b!1348599 m!1235177))

(declare-fun m!1235179 () Bool)

(assert (=> mapNonEmpty!58073 m!1235179))

(declare-fun m!1235181 () Bool)

(assert (=> b!1348596 m!1235181))

(assert (=> b!1348594 m!1235177))

(assert (=> b!1348594 m!1235177))

(declare-fun m!1235183 () Bool)

(assert (=> b!1348594 m!1235183))

(declare-fun m!1235185 () Bool)

(assert (=> start!113606 m!1235185))

(declare-fun m!1235187 () Bool)

(assert (=> start!113606 m!1235187))

(declare-fun m!1235189 () Bool)

(assert (=> start!113606 m!1235189))

(declare-fun m!1235191 () Bool)

(assert (=> b!1348601 m!1235191))

(assert (=> b!1348601 m!1235191))

(declare-fun m!1235193 () Bool)

(assert (=> b!1348601 m!1235193))

(check-sat (not b!1348594) (not b_lambda!24643) b_and!50915 tp_is_empty!37573 (not mapNonEmpty!58073) (not b!1348601) (not b!1348597) (not start!113606) (not b_next!31573) (not b!1348600) (not b!1348596))
(check-sat b_and!50915 (not b_next!31573))
(get-model)

(declare-fun b_lambda!24649 () Bool)

(assert (= b_lambda!24643 (or (and start!113606 b_free!31573) b_lambda!24649)))

(check-sat (not b!1348594) b_and!50915 tp_is_empty!37573 (not mapNonEmpty!58073) (not b!1348601) (not b!1348597) (not b_lambda!24649) (not start!113606) (not b_next!31573) (not b!1348600) (not b!1348596))
(check-sat b_and!50915 (not b_next!31573))
(get-model)

(declare-fun b!1348691 () Bool)

(declare-fun e!767227 () Bool)

(declare-fun call!65104 () Bool)

(assert (=> b!1348691 (= e!767227 call!65104)))

(declare-fun d!144395 () Bool)

(declare-fun res!894860 () Bool)

(declare-fun e!767228 () Bool)

(assert (=> d!144395 (=> res!894860 e!767228)))

(assert (=> d!144395 (= res!894860 (bvsge #b00000000000000000000000000000000 (size!44970 _keys!1571)))))

(assert (=> d!144395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!767228)))

(declare-fun b!1348692 () Bool)

(declare-fun e!767229 () Bool)

(assert (=> b!1348692 (= e!767229 call!65104)))

(declare-fun b!1348693 () Bool)

(assert (=> b!1348693 (= e!767227 e!767229)))

(declare-fun lt!595998 () (_ BitVec 64))

(assert (=> b!1348693 (= lt!595998 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!44020 0))(
  ( (Unit!44021) )
))
(declare-fun lt!596000 () Unit!44020)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!91927 (_ BitVec 64) (_ BitVec 32)) Unit!44020)

(assert (=> b!1348693 (= lt!596000 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595998 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!91927 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1348693 (arrayContainsKey!0 _keys!1571 lt!595998 #b00000000000000000000000000000000)))

(declare-fun lt!595999 () Unit!44020)

(assert (=> b!1348693 (= lt!595999 lt!596000)))

(declare-fun res!894861 () Bool)

(declare-datatypes ((SeekEntryResult!10057 0))(
  ( (MissingZero!10057 (index!42599 (_ BitVec 32))) (Found!10057 (index!42600 (_ BitVec 32))) (Intermediate!10057 (undefined!10869 Bool) (index!42601 (_ BitVec 32)) (x!120712 (_ BitVec 32))) (Undefined!10057) (MissingVacant!10057 (index!42602 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!91927 (_ BitVec 32)) SeekEntryResult!10057)

(assert (=> b!1348693 (= res!894861 (= (seekEntryOrOpen!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10057 #b00000000000000000000000000000000)))))

(assert (=> b!1348693 (=> (not res!894861) (not e!767229))))

(declare-fun bm!65101 () Bool)

(assert (=> bm!65101 (= call!65104 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1348694 () Bool)

(assert (=> b!1348694 (= e!767228 e!767227)))

(declare-fun c!126440 () Bool)

(assert (=> b!1348694 (= c!126440 (validKeyInArray!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144395 (not res!894860)) b!1348694))

(assert (= (and b!1348694 c!126440) b!1348693))

(assert (= (and b!1348694 (not c!126440)) b!1348691))

(assert (= (and b!1348693 res!894861) b!1348692))

(assert (= (or b!1348692 b!1348691) bm!65101))

(declare-fun m!1235259 () Bool)

(assert (=> b!1348693 m!1235259))

(declare-fun m!1235261 () Bool)

(assert (=> b!1348693 m!1235261))

(declare-fun m!1235263 () Bool)

(assert (=> b!1348693 m!1235263))

(assert (=> b!1348693 m!1235259))

(declare-fun m!1235265 () Bool)

(assert (=> b!1348693 m!1235265))

(declare-fun m!1235267 () Bool)

(assert (=> bm!65101 m!1235267))

(assert (=> b!1348694 m!1235259))

(assert (=> b!1348694 m!1235259))

(declare-fun m!1235269 () Bool)

(assert (=> b!1348694 m!1235269))

(assert (=> b!1348596 d!144395))

(declare-fun d!144397 () Bool)

(declare-fun res!894870 () Bool)

(declare-fun e!767241 () Bool)

(assert (=> d!144397 (=> res!894870 e!767241)))

(assert (=> d!144397 (= res!894870 (bvsge #b00000000000000000000000000000000 (size!44970 _keys!1571)))))

(assert (=> d!144397 (= (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31525) e!767241)))

(declare-fun b!1348705 () Bool)

(declare-fun e!767240 () Bool)

(declare-fun call!65107 () Bool)

(assert (=> b!1348705 (= e!767240 call!65107)))

(declare-fun b!1348706 () Bool)

(declare-fun e!767239 () Bool)

(assert (=> b!1348706 (= e!767241 e!767239)))

(declare-fun res!894868 () Bool)

(assert (=> b!1348706 (=> (not res!894868) (not e!767239))))

(declare-fun e!767238 () Bool)

(assert (=> b!1348706 (= res!894868 (not e!767238))))

(declare-fun res!894869 () Bool)

(assert (=> b!1348706 (=> (not res!894869) (not e!767238))))

(assert (=> b!1348706 (= res!894869 (validKeyInArray!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348707 () Bool)

(assert (=> b!1348707 (= e!767240 call!65107)))

(declare-fun bm!65104 () Bool)

(declare-fun c!126443 () Bool)

(assert (=> bm!65104 (= call!65107 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126443 (Cons!31524 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525)))))

(declare-fun b!1348708 () Bool)

(assert (=> b!1348708 (= e!767239 e!767240)))

(assert (=> b!1348708 (= c!126443 (validKeyInArray!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348709 () Bool)

(declare-fun contains!9150 (List!31528 (_ BitVec 64)) Bool)

(assert (=> b!1348709 (= e!767238 (contains!9150 Nil!31525 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144397 (not res!894870)) b!1348706))

(assert (= (and b!1348706 res!894869) b!1348709))

(assert (= (and b!1348706 res!894868) b!1348708))

(assert (= (and b!1348708 c!126443) b!1348707))

(assert (= (and b!1348708 (not c!126443)) b!1348705))

(assert (= (or b!1348707 b!1348705) bm!65104))

(assert (=> b!1348706 m!1235259))

(assert (=> b!1348706 m!1235259))

(assert (=> b!1348706 m!1235269))

(assert (=> bm!65104 m!1235259))

(declare-fun m!1235271 () Bool)

(assert (=> bm!65104 m!1235271))

(assert (=> b!1348708 m!1235259))

(assert (=> b!1348708 m!1235259))

(assert (=> b!1348708 m!1235269))

(assert (=> b!1348709 m!1235259))

(assert (=> b!1348709 m!1235259))

(declare-fun m!1235273 () Bool)

(assert (=> b!1348709 m!1235273))

(assert (=> b!1348600 d!144397))

(declare-fun d!144399 () Bool)

(declare-fun e!767247 () Bool)

(assert (=> d!144399 e!767247))

(declare-fun res!894873 () Bool)

(assert (=> d!144399 (=> res!894873 e!767247)))

(declare-fun lt!596010 () Bool)

(assert (=> d!144399 (= res!894873 (not lt!596010))))

(declare-fun lt!596009 () Bool)

(assert (=> d!144399 (= lt!596010 lt!596009)))

(declare-fun lt!596011 () Unit!44020)

(declare-fun e!767246 () Unit!44020)

(assert (=> d!144399 (= lt!596011 e!767246)))

(declare-fun c!126446 () Bool)

(assert (=> d!144399 (= c!126446 lt!596009)))

(declare-fun containsKey!742 (List!31527 (_ BitVec 64)) Bool)

(assert (=> d!144399 (= lt!596009 (containsKey!742 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (=> d!144399 (= (contains!9148 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142) lt!596010)))

(declare-fun b!1348716 () Bool)

(declare-fun lt!596012 () Unit!44020)

(assert (=> b!1348716 (= e!767246 lt!596012)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!489 (List!31527 (_ BitVec 64)) Unit!44020)

(assert (=> b!1348716 (= lt!596012 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-datatypes ((Option!776 0))(
  ( (Some!775 (v!21515 V!55201)) (None!774) )
))
(declare-fun isDefined!532 (Option!776) Bool)

(declare-fun getValueByKey!725 (List!31527 (_ BitVec 64)) Option!776)

(assert (=> b!1348716 (isDefined!532 (getValueByKey!725 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun b!1348717 () Bool)

(declare-fun Unit!44022 () Unit!44020)

(assert (=> b!1348717 (= e!767246 Unit!44022)))

(declare-fun b!1348718 () Bool)

(assert (=> b!1348718 (= e!767247 (isDefined!532 (getValueByKey!725 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)))))

(assert (= (and d!144399 c!126446) b!1348716))

(assert (= (and d!144399 (not c!126446)) b!1348717))

(assert (= (and d!144399 (not res!894873)) b!1348718))

(declare-fun m!1235275 () Bool)

(assert (=> d!144399 m!1235275))

(declare-fun m!1235277 () Bool)

(assert (=> b!1348716 m!1235277))

(declare-fun m!1235279 () Bool)

(assert (=> b!1348716 m!1235279))

(assert (=> b!1348716 m!1235279))

(declare-fun m!1235281 () Bool)

(assert (=> b!1348716 m!1235281))

(assert (=> b!1348718 m!1235279))

(assert (=> b!1348718 m!1235279))

(assert (=> b!1348718 m!1235281))

(assert (=> b!1348601 d!144399))

(declare-fun bm!65119 () Bool)

(declare-fun call!65125 () ListLongMap!22051)

(declare-fun call!65124 () ListLongMap!22051)

(assert (=> bm!65119 (= call!65125 call!65124)))

(declare-fun b!1348761 () Bool)

(declare-fun e!767282 () Bool)

(assert (=> b!1348761 (= e!767282 (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)))))

(declare-fun b!1348762 () Bool)

(declare-fun e!767281 () ListLongMap!22051)

(assert (=> b!1348762 (= e!767281 call!65125)))

(declare-fun b!1348763 () Bool)

(declare-fun e!767276 () Bool)

(declare-fun e!767278 () Bool)

(assert (=> b!1348763 (= e!767276 e!767278)))

(declare-fun c!126461 () Bool)

(assert (=> b!1348763 (= c!126461 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348764 () Bool)

(declare-fun e!767279 () Unit!44020)

(declare-fun Unit!44023 () Unit!44020)

(assert (=> b!1348764 (= e!767279 Unit!44023)))

(declare-fun b!1348765 () Bool)

(declare-fun e!767275 () Bool)

(declare-fun e!767285 () Bool)

(assert (=> b!1348765 (= e!767275 e!767285)))

(declare-fun res!894893 () Bool)

(declare-fun call!65122 () Bool)

(assert (=> b!1348765 (= res!894893 call!65122)))

(assert (=> b!1348765 (=> (not res!894893) (not e!767285))))

(declare-fun b!1348766 () Bool)

(declare-fun call!65123 () Bool)

(assert (=> b!1348766 (= e!767278 (not call!65123))))

(declare-fun e!767283 () Bool)

(declare-fun b!1348767 () Bool)

(declare-fun lt!596059 () ListLongMap!22051)

(declare-fun apply!1032 (ListLongMap!22051 (_ BitVec 64)) V!55201)

(assert (=> b!1348767 (= e!767283 (= (apply!1032 lt!596059 (select (arr!44418 _keys!1571) from!1960)) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348767 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44969 _values!1303)))))

(assert (=> b!1348767 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44970 _keys!1571)))))

(declare-fun b!1348768 () Bool)

(declare-fun e!767284 () Bool)

(assert (=> b!1348768 (= e!767278 e!767284)))

(declare-fun res!894895 () Bool)

(assert (=> b!1348768 (= res!894895 call!65123)))

(assert (=> b!1348768 (=> (not res!894895) (not e!767284))))

(declare-fun c!126460 () Bool)

(declare-fun call!65128 () ListLongMap!22051)

(declare-fun c!126459 () Bool)

(declare-fun call!65126 () ListLongMap!22051)

(declare-fun bm!65120 () Bool)

(declare-fun call!65127 () ListLongMap!22051)

(assert (=> bm!65120 (= call!65124 (+!4884 (ite c!126460 call!65127 (ite c!126459 call!65126 call!65128)) (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun b!1348769 () Bool)

(declare-fun e!767277 () Bool)

(assert (=> b!1348769 (= e!767277 (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)))))

(declare-fun b!1348770 () Bool)

(declare-fun e!767286 () ListLongMap!22051)

(assert (=> b!1348770 (= e!767286 (+!4884 call!65124 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(declare-fun b!1348771 () Bool)

(assert (=> b!1348771 (= e!767281 call!65128)))

(declare-fun b!1348772 () Bool)

(declare-fun e!767280 () ListLongMap!22051)

(assert (=> b!1348772 (= e!767286 e!767280)))

(assert (=> b!1348772 (= c!126459 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1348773 () Bool)

(assert (=> b!1348773 (= e!767280 call!65125)))

(declare-fun bm!65121 () Bool)

(assert (=> bm!65121 (= call!65128 call!65126)))

(declare-fun b!1348774 () Bool)

(declare-fun res!894898 () Bool)

(assert (=> b!1348774 (=> (not res!894898) (not e!767276))))

(declare-fun e!767274 () Bool)

(assert (=> b!1348774 (= res!894898 e!767274)))

(declare-fun res!894897 () Bool)

(assert (=> b!1348774 (=> res!894897 e!767274)))

(assert (=> b!1348774 (= res!894897 (not e!767282))))

(declare-fun res!894896 () Bool)

(assert (=> b!1348774 (=> (not res!894896) (not e!767282))))

(assert (=> b!1348774 (= res!894896 (bvslt from!1960 (size!44970 _keys!1571)))))

(declare-fun bm!65122 () Bool)

(assert (=> bm!65122 (= call!65123 (contains!9148 lt!596059 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!144401 () Bool)

(assert (=> d!144401 e!767276))

(declare-fun res!894894 () Bool)

(assert (=> d!144401 (=> (not res!894894) (not e!767276))))

(assert (=> d!144401 (= res!894894 (or (bvsge from!1960 (size!44970 _keys!1571)) (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44970 _keys!1571)))))))

(declare-fun lt!596069 () ListLongMap!22051)

(assert (=> d!144401 (= lt!596059 lt!596069)))

(declare-fun lt!596072 () Unit!44020)

(assert (=> d!144401 (= lt!596072 e!767279)))

(declare-fun c!126462 () Bool)

(assert (=> d!144401 (= c!126462 e!767277)))

(declare-fun res!894900 () Bool)

(assert (=> d!144401 (=> (not res!894900) (not e!767277))))

(assert (=> d!144401 (= res!894900 (bvslt from!1960 (size!44970 _keys!1571)))))

(assert (=> d!144401 (= lt!596069 e!767286)))

(assert (=> d!144401 (= c!126460 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!144401 (validMask!0 mask!1977)))

(assert (=> d!144401 (= (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596059)))

(declare-fun bm!65123 () Bool)

(assert (=> bm!65123 (= call!65126 call!65127)))

(declare-fun b!1348775 () Bool)

(declare-fun lt!596075 () Unit!44020)

(assert (=> b!1348775 (= e!767279 lt!596075)))

(declare-fun lt!596057 () ListLongMap!22051)

(assert (=> b!1348775 (= lt!596057 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596077 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596077 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596058 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596058 (select (arr!44418 _keys!1571) from!1960))))

(declare-fun lt!596078 () Unit!44020)

(declare-fun addStillContains!1209 (ListLongMap!22051 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44020)

(assert (=> b!1348775 (= lt!596078 (addStillContains!1209 lt!596057 lt!596077 zeroValue!1245 lt!596058))))

(assert (=> b!1348775 (contains!9148 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245)) lt!596058)))

(declare-fun lt!596060 () Unit!44020)

(assert (=> b!1348775 (= lt!596060 lt!596078)))

(declare-fun lt!596061 () ListLongMap!22051)

(assert (=> b!1348775 (= lt!596061 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596076 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596076 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596073 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596073 (select (arr!44418 _keys!1571) from!1960))))

(declare-fun lt!596071 () Unit!44020)

(declare-fun addApplyDifferent!570 (ListLongMap!22051 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44020)

(assert (=> b!1348775 (= lt!596071 (addApplyDifferent!570 lt!596061 lt!596076 minValue!1245 lt!596073))))

(assert (=> b!1348775 (= (apply!1032 (+!4884 lt!596061 (tuple2!24395 lt!596076 minValue!1245)) lt!596073) (apply!1032 lt!596061 lt!596073))))

(declare-fun lt!596066 () Unit!44020)

(assert (=> b!1348775 (= lt!596066 lt!596071)))

(declare-fun lt!596067 () ListLongMap!22051)

(assert (=> b!1348775 (= lt!596067 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596070 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596070 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596062 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596062 (select (arr!44418 _keys!1571) from!1960))))

(declare-fun lt!596063 () Unit!44020)

(assert (=> b!1348775 (= lt!596063 (addApplyDifferent!570 lt!596067 lt!596070 zeroValue!1245 lt!596062))))

(assert (=> b!1348775 (= (apply!1032 (+!4884 lt!596067 (tuple2!24395 lt!596070 zeroValue!1245)) lt!596062) (apply!1032 lt!596067 lt!596062))))

(declare-fun lt!596065 () Unit!44020)

(assert (=> b!1348775 (= lt!596065 lt!596063)))

(declare-fun lt!596064 () ListLongMap!22051)

(assert (=> b!1348775 (= lt!596064 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun lt!596074 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596074 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!596068 () (_ BitVec 64))

(assert (=> b!1348775 (= lt!596068 (select (arr!44418 _keys!1571) from!1960))))

(assert (=> b!1348775 (= lt!596075 (addApplyDifferent!570 lt!596064 lt!596074 minValue!1245 lt!596068))))

(assert (=> b!1348775 (= (apply!1032 (+!4884 lt!596064 (tuple2!24395 lt!596074 minValue!1245)) lt!596068) (apply!1032 lt!596064 lt!596068))))

(declare-fun b!1348776 () Bool)

(declare-fun res!894892 () Bool)

(assert (=> b!1348776 (=> (not res!894892) (not e!767276))))

(assert (=> b!1348776 (= res!894892 e!767275)))

(declare-fun c!126464 () Bool)

(assert (=> b!1348776 (= c!126464 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!65124 () Bool)

(assert (=> bm!65124 (= call!65127 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))

(declare-fun bm!65125 () Bool)

(assert (=> bm!65125 (= call!65122 (contains!9148 lt!596059 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348777 () Bool)

(assert (=> b!1348777 (= e!767275 (not call!65122))))

(declare-fun b!1348778 () Bool)

(declare-fun c!126463 () Bool)

(assert (=> b!1348778 (= c!126463 (and (not (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1348778 (= e!767280 e!767281)))

(declare-fun b!1348779 () Bool)

(assert (=> b!1348779 (= e!767284 (= (apply!1032 lt!596059 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1245))))

(declare-fun b!1348780 () Bool)

(assert (=> b!1348780 (= e!767274 e!767283)))

(declare-fun res!894899 () Bool)

(assert (=> b!1348780 (=> (not res!894899) (not e!767283))))

(assert (=> b!1348780 (= res!894899 (contains!9148 lt!596059 (select (arr!44418 _keys!1571) from!1960)))))

(assert (=> b!1348780 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44970 _keys!1571)))))

(declare-fun b!1348781 () Bool)

(assert (=> b!1348781 (= e!767285 (= (apply!1032 lt!596059 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1245))))

(assert (= (and d!144401 c!126460) b!1348770))

(assert (= (and d!144401 (not c!126460)) b!1348772))

(assert (= (and b!1348772 c!126459) b!1348773))

(assert (= (and b!1348772 (not c!126459)) b!1348778))

(assert (= (and b!1348778 c!126463) b!1348762))

(assert (= (and b!1348778 (not c!126463)) b!1348771))

(assert (= (or b!1348762 b!1348771) bm!65121))

(assert (= (or b!1348773 bm!65121) bm!65123))

(assert (= (or b!1348773 b!1348762) bm!65119))

(assert (= (or b!1348770 bm!65123) bm!65124))

(assert (= (or b!1348770 bm!65119) bm!65120))

(assert (= (and d!144401 res!894900) b!1348769))

(assert (= (and d!144401 c!126462) b!1348775))

(assert (= (and d!144401 (not c!126462)) b!1348764))

(assert (= (and d!144401 res!894894) b!1348774))

(assert (= (and b!1348774 res!894896) b!1348761))

(assert (= (and b!1348774 (not res!894897)) b!1348780))

(assert (= (and b!1348780 res!894899) b!1348767))

(assert (= (and b!1348774 res!894898) b!1348776))

(assert (= (and b!1348776 c!126464) b!1348765))

(assert (= (and b!1348776 (not c!126464)) b!1348777))

(assert (= (and b!1348765 res!894893) b!1348781))

(assert (= (or b!1348765 b!1348777) bm!65125))

(assert (= (and b!1348776 res!894892) b!1348763))

(assert (= (and b!1348763 c!126461) b!1348768))

(assert (= (and b!1348763 (not c!126461)) b!1348766))

(assert (= (and b!1348768 res!894895) b!1348779))

(assert (= (or b!1348768 b!1348766) bm!65122))

(declare-fun b_lambda!24651 () Bool)

(assert (=> (not b_lambda!24651) (not b!1348767)))

(assert (=> b!1348767 t!46158))

(declare-fun b_and!50925 () Bool)

(assert (= b_and!50915 (and (=> t!46158 result!25973) b_and!50925)))

(declare-fun m!1235283 () Bool)

(assert (=> b!1348770 m!1235283))

(assert (=> b!1348767 m!1235169))

(assert (=> b!1348767 m!1235167))

(assert (=> b!1348767 m!1235169))

(assert (=> b!1348767 m!1235171))

(assert (=> b!1348767 m!1235177))

(assert (=> b!1348767 m!1235177))

(declare-fun m!1235285 () Bool)

(assert (=> b!1348767 m!1235285))

(assert (=> b!1348767 m!1235167))

(declare-fun m!1235287 () Bool)

(assert (=> b!1348775 m!1235287))

(declare-fun m!1235289 () Bool)

(assert (=> b!1348775 m!1235289))

(declare-fun m!1235291 () Bool)

(assert (=> b!1348775 m!1235291))

(declare-fun m!1235293 () Bool)

(assert (=> b!1348775 m!1235293))

(declare-fun m!1235295 () Bool)

(assert (=> b!1348775 m!1235295))

(declare-fun m!1235297 () Bool)

(assert (=> b!1348775 m!1235297))

(declare-fun m!1235299 () Bool)

(assert (=> b!1348775 m!1235299))

(declare-fun m!1235301 () Bool)

(assert (=> b!1348775 m!1235301))

(declare-fun m!1235303 () Bool)

(assert (=> b!1348775 m!1235303))

(declare-fun m!1235305 () Bool)

(assert (=> b!1348775 m!1235305))

(assert (=> b!1348775 m!1235295))

(declare-fun m!1235307 () Bool)

(assert (=> b!1348775 m!1235307))

(assert (=> b!1348775 m!1235301))

(declare-fun m!1235309 () Bool)

(assert (=> b!1348775 m!1235309))

(declare-fun m!1235311 () Bool)

(assert (=> b!1348775 m!1235311))

(assert (=> b!1348775 m!1235289))

(declare-fun m!1235313 () Bool)

(assert (=> b!1348775 m!1235313))

(declare-fun m!1235315 () Bool)

(assert (=> b!1348775 m!1235315))

(declare-fun m!1235317 () Bool)

(assert (=> b!1348775 m!1235317))

(assert (=> b!1348775 m!1235177))

(assert (=> b!1348775 m!1235315))

(declare-fun m!1235319 () Bool)

(assert (=> b!1348779 m!1235319))

(declare-fun m!1235321 () Bool)

(assert (=> b!1348781 m!1235321))

(declare-fun m!1235323 () Bool)

(assert (=> bm!65125 m!1235323))

(declare-fun m!1235325 () Bool)

(assert (=> bm!65122 m!1235325))

(assert (=> bm!65124 m!1235307))

(assert (=> b!1348780 m!1235177))

(assert (=> b!1348780 m!1235177))

(declare-fun m!1235327 () Bool)

(assert (=> b!1348780 m!1235327))

(assert (=> b!1348769 m!1235177))

(assert (=> b!1348769 m!1235177))

(assert (=> b!1348769 m!1235183))

(declare-fun m!1235329 () Bool)

(assert (=> bm!65120 m!1235329))

(assert (=> b!1348761 m!1235177))

(assert (=> b!1348761 m!1235177))

(assert (=> b!1348761 m!1235183))

(assert (=> d!144401 m!1235185))

(assert (=> b!1348601 d!144401))

(declare-fun d!144403 () Bool)

(assert (=> d!144403 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!113606 d!144403))

(declare-fun d!144405 () Bool)

(assert (=> d!144405 (= (array_inv!33655 _keys!1571) (bvsge (size!44970 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!113606 d!144405))

(declare-fun d!144407 () Bool)

(assert (=> d!144407 (= (array_inv!33656 _values!1303) (bvsge (size!44969 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!113606 d!144407))

(declare-fun d!144409 () Bool)

(declare-fun e!767288 () Bool)

(assert (=> d!144409 e!767288))

(declare-fun res!894901 () Bool)

(assert (=> d!144409 (=> res!894901 e!767288)))

(declare-fun lt!596080 () Bool)

(assert (=> d!144409 (= res!894901 (not lt!596080))))

(declare-fun lt!596079 () Bool)

(assert (=> d!144409 (= lt!596080 lt!596079)))

(declare-fun lt!596081 () Unit!44020)

(declare-fun e!767287 () Unit!44020)

(assert (=> d!144409 (= lt!596081 e!767287)))

(declare-fun c!126465 () Bool)

(assert (=> d!144409 (= c!126465 lt!596079)))

(assert (=> d!144409 (= lt!596079 (containsKey!742 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (=> d!144409 (= (contains!9148 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142) lt!596080)))

(declare-fun b!1348782 () Bool)

(declare-fun lt!596082 () Unit!44020)

(assert (=> b!1348782 (= e!767287 lt!596082)))

(assert (=> b!1348782 (= lt!596082 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (=> b!1348782 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun b!1348783 () Bool)

(declare-fun Unit!44024 () Unit!44020)

(assert (=> b!1348783 (= e!767287 Unit!44024)))

(declare-fun b!1348784 () Bool)

(assert (=> b!1348784 (= e!767288 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142)))))

(assert (= (and d!144409 c!126465) b!1348782))

(assert (= (and d!144409 (not c!126465)) b!1348783))

(assert (= (and d!144409 (not res!894901)) b!1348784))

(declare-fun m!1235331 () Bool)

(assert (=> d!144409 m!1235331))

(declare-fun m!1235333 () Bool)

(assert (=> b!1348782 m!1235333))

(declare-fun m!1235335 () Bool)

(assert (=> b!1348782 m!1235335))

(assert (=> b!1348782 m!1235335))

(declare-fun m!1235337 () Bool)

(assert (=> b!1348782 m!1235337))

(assert (=> b!1348784 m!1235335))

(assert (=> b!1348784 m!1235335))

(assert (=> b!1348784 m!1235337))

(assert (=> b!1348597 d!144409))

(declare-fun d!144411 () Bool)

(declare-fun e!767291 () Bool)

(assert (=> d!144411 e!767291))

(declare-fun res!894906 () Bool)

(assert (=> d!144411 (=> (not res!894906) (not e!767291))))

(declare-fun lt!596094 () ListLongMap!22051)

(assert (=> d!144411 (= res!894906 (contains!9148 lt!596094 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596091 () List!31527)

(assert (=> d!144411 (= lt!596094 (ListLongMap!22052 lt!596091))))

(declare-fun lt!596093 () Unit!44020)

(declare-fun lt!596092 () Unit!44020)

(assert (=> d!144411 (= lt!596093 lt!596092)))

(assert (=> d!144411 (= (getValueByKey!725 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!775 (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!368 (List!31527 (_ BitVec 64) V!55201) Unit!44020)

(assert (=> d!144411 (= lt!596092 (lemmaContainsTupThenGetReturnValue!368 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!497 (List!31527 (_ BitVec 64) V!55201) List!31527)

(assert (=> d!144411 (= lt!596091 (insertStrictlySorted!497 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144411 (= (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596094)))

(declare-fun b!1348789 () Bool)

(declare-fun res!894907 () Bool)

(assert (=> b!1348789 (=> (not res!894907) (not e!767291))))

(assert (=> b!1348789 (= res!894907 (= (getValueByKey!725 (toList!11041 lt!596094) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!775 (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1348790 () Bool)

(declare-fun contains!9151 (List!31527 tuple2!24394) Bool)

(assert (=> b!1348790 (= e!767291 (contains!9151 (toList!11041 lt!596094) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144411 res!894906) b!1348789))

(assert (= (and b!1348789 res!894907) b!1348790))

(declare-fun m!1235339 () Bool)

(assert (=> d!144411 m!1235339))

(declare-fun m!1235341 () Bool)

(assert (=> d!144411 m!1235341))

(declare-fun m!1235343 () Bool)

(assert (=> d!144411 m!1235343))

(declare-fun m!1235345 () Bool)

(assert (=> d!144411 m!1235345))

(declare-fun m!1235347 () Bool)

(assert (=> b!1348789 m!1235347))

(declare-fun m!1235349 () Bool)

(assert (=> b!1348790 m!1235349))

(assert (=> b!1348597 d!144411))

(declare-fun b!1348815 () Bool)

(declare-fun lt!596115 () Unit!44020)

(declare-fun lt!596114 () Unit!44020)

(assert (=> b!1348815 (= lt!596115 lt!596114)))

(declare-fun lt!596111 () V!55201)

(declare-fun lt!596112 () ListLongMap!22051)

(declare-fun lt!596110 () (_ BitVec 64))

(declare-fun lt!596109 () (_ BitVec 64))

(assert (=> b!1348815 (not (contains!9148 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111)) lt!596109))))

(declare-fun addStillNotContains!491 (ListLongMap!22051 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44020)

(assert (=> b!1348815 (= lt!596114 (addStillNotContains!491 lt!596112 lt!596110 lt!596111 lt!596109))))

(assert (=> b!1348815 (= lt!596109 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348815 (= lt!596111 (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348815 (= lt!596110 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))

(declare-fun call!65131 () ListLongMap!22051)

(assert (=> b!1348815 (= lt!596112 call!65131)))

(declare-fun e!767307 () ListLongMap!22051)

(assert (=> b!1348815 (= e!767307 (+!4884 call!65131 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348816 () Bool)

(declare-fun e!767310 () Bool)

(declare-fun e!767309 () Bool)

(assert (=> b!1348816 (= e!767310 e!767309)))

(declare-fun c!126475 () Bool)

(assert (=> b!1348816 (= c!126475 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44970 _keys!1571)))))

(declare-fun d!144413 () Bool)

(declare-fun e!767306 () Bool)

(assert (=> d!144413 e!767306))

(declare-fun res!894917 () Bool)

(assert (=> d!144413 (=> (not res!894917) (not e!767306))))

(declare-fun lt!596113 () ListLongMap!22051)

(assert (=> d!144413 (= res!894917 (not (contains!9148 lt!596113 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!767311 () ListLongMap!22051)

(assert (=> d!144413 (= lt!596113 e!767311)))

(declare-fun c!126474 () Bool)

(assert (=> d!144413 (= c!126474 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) (size!44970 _keys!1571)))))

(assert (=> d!144413 (validMask!0 mask!1977)))

(assert (=> d!144413 (= (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) lt!596113)))

(declare-fun b!1348817 () Bool)

(assert (=> b!1348817 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44970 _keys!1571)))))

(assert (=> b!1348817 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44969 _values!1303)))))

(declare-fun e!767308 () Bool)

(assert (=> b!1348817 (= e!767308 (= (apply!1032 lt!596113 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348818 () Bool)

(declare-fun res!894918 () Bool)

(assert (=> b!1348818 (=> (not res!894918) (not e!767306))))

(assert (=> b!1348818 (= res!894918 (not (contains!9148 lt!596113 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348819 () Bool)

(declare-fun isEmpty!1101 (ListLongMap!22051) Bool)

(assert (=> b!1348819 (= e!767309 (isEmpty!1101 lt!596113))))

(declare-fun b!1348820 () Bool)

(assert (=> b!1348820 (= e!767306 e!767310)))

(declare-fun c!126476 () Bool)

(declare-fun e!767312 () Bool)

(assert (=> b!1348820 (= c!126476 e!767312)))

(declare-fun res!894916 () Bool)

(assert (=> b!1348820 (=> (not res!894916) (not e!767312))))

(assert (=> b!1348820 (= res!894916 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44970 _keys!1571)))))

(declare-fun b!1348821 () Bool)

(assert (=> b!1348821 (= e!767307 call!65131)))

(declare-fun b!1348822 () Bool)

(assert (=> b!1348822 (= e!767312 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348822 (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))

(declare-fun b!1348823 () Bool)

(assert (=> b!1348823 (= e!767309 (= lt!596113 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1348824 () Bool)

(assert (=> b!1348824 (= e!767311 (ListLongMap!22052 Nil!31524))))

(declare-fun bm!65128 () Bool)

(assert (=> bm!65128 (= call!65131 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348825 () Bool)

(assert (=> b!1348825 (= e!767310 e!767308)))

(assert (=> b!1348825 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960) (size!44970 _keys!1571)))))

(declare-fun res!894919 () Bool)

(assert (=> b!1348825 (= res!894919 (contains!9148 lt!596113 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348825 (=> (not res!894919) (not e!767308))))

(declare-fun b!1348826 () Bool)

(assert (=> b!1348826 (= e!767311 e!767307)))

(declare-fun c!126477 () Bool)

(assert (=> b!1348826 (= c!126477 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (= (and d!144413 c!126474) b!1348824))

(assert (= (and d!144413 (not c!126474)) b!1348826))

(assert (= (and b!1348826 c!126477) b!1348815))

(assert (= (and b!1348826 (not c!126477)) b!1348821))

(assert (= (or b!1348815 b!1348821) bm!65128))

(assert (= (and d!144413 res!894917) b!1348818))

(assert (= (and b!1348818 res!894918) b!1348820))

(assert (= (and b!1348820 res!894916) b!1348822))

(assert (= (and b!1348820 c!126476) b!1348825))

(assert (= (and b!1348820 (not c!126476)) b!1348816))

(assert (= (and b!1348825 res!894919) b!1348817))

(assert (= (and b!1348816 c!126475) b!1348823))

(assert (= (and b!1348816 (not c!126475)) b!1348819))

(declare-fun b_lambda!24653 () Bool)

(assert (=> (not b_lambda!24653) (not b!1348815)))

(assert (=> b!1348815 t!46158))

(declare-fun b_and!50927 () Bool)

(assert (= b_and!50925 (and (=> t!46158 result!25973) b_and!50927)))

(declare-fun b_lambda!24655 () Bool)

(assert (=> (not b_lambda!24655) (not b!1348817)))

(assert (=> b!1348817 t!46158))

(declare-fun b_and!50929 () Bool)

(assert (= b_and!50927 (and (=> t!46158 result!25973) b_and!50929)))

(declare-fun m!1235351 () Bool)

(assert (=> bm!65128 m!1235351))

(assert (=> b!1348823 m!1235351))

(declare-fun m!1235353 () Bool)

(assert (=> d!144413 m!1235353))

(assert (=> d!144413 m!1235185))

(declare-fun m!1235355 () Bool)

(assert (=> b!1348815 m!1235355))

(declare-fun m!1235357 () Bool)

(assert (=> b!1348815 m!1235357))

(assert (=> b!1348815 m!1235169))

(declare-fun m!1235359 () Bool)

(assert (=> b!1348815 m!1235359))

(declare-fun m!1235361 () Bool)

(assert (=> b!1348815 m!1235361))

(assert (=> b!1348815 m!1235361))

(declare-fun m!1235363 () Bool)

(assert (=> b!1348815 m!1235363))

(declare-fun m!1235365 () Bool)

(assert (=> b!1348815 m!1235365))

(assert (=> b!1348815 m!1235357))

(assert (=> b!1348815 m!1235169))

(declare-fun m!1235367 () Bool)

(assert (=> b!1348815 m!1235367))

(assert (=> b!1348817 m!1235355))

(assert (=> b!1348817 m!1235355))

(declare-fun m!1235369 () Bool)

(assert (=> b!1348817 m!1235369))

(assert (=> b!1348817 m!1235357))

(assert (=> b!1348817 m!1235169))

(assert (=> b!1348817 m!1235359))

(assert (=> b!1348817 m!1235169))

(assert (=> b!1348817 m!1235357))

(declare-fun m!1235371 () Bool)

(assert (=> b!1348818 m!1235371))

(assert (=> b!1348822 m!1235355))

(assert (=> b!1348822 m!1235355))

(declare-fun m!1235373 () Bool)

(assert (=> b!1348822 m!1235373))

(declare-fun m!1235375 () Bool)

(assert (=> b!1348819 m!1235375))

(assert (=> b!1348826 m!1235355))

(assert (=> b!1348826 m!1235355))

(assert (=> b!1348826 m!1235373))

(assert (=> b!1348825 m!1235355))

(assert (=> b!1348825 m!1235355))

(declare-fun m!1235377 () Bool)

(assert (=> b!1348825 m!1235377))

(assert (=> b!1348597 d!144413))

(declare-fun d!144415 () Bool)

(declare-fun c!126480 () Bool)

(assert (=> d!144415 (= c!126480 ((_ is ValueCellFull!17888) (select (arr!44417 _values!1303) from!1960)))))

(declare-fun e!767315 () V!55201)

(assert (=> d!144415 (= (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767315)))

(declare-fun b!1348831 () Bool)

(declare-fun get!22454 (ValueCell!17888 V!55201) V!55201)

(assert (=> b!1348831 (= e!767315 (get!22454 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348832 () Bool)

(declare-fun get!22455 (ValueCell!17888 V!55201) V!55201)

(assert (=> b!1348832 (= e!767315 (get!22455 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144415 c!126480) b!1348831))

(assert (= (and d!144415 (not c!126480)) b!1348832))

(assert (=> b!1348831 m!1235167))

(assert (=> b!1348831 m!1235169))

(declare-fun m!1235379 () Bool)

(assert (=> b!1348831 m!1235379))

(assert (=> b!1348832 m!1235167))

(assert (=> b!1348832 m!1235169))

(declare-fun m!1235381 () Bool)

(assert (=> b!1348832 m!1235381))

(assert (=> b!1348597 d!144415))

(declare-fun d!144417 () Bool)

(assert (=> d!144417 (= (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)) (and (not (= (select (arr!44418 _keys!1571) from!1960) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44418 _keys!1571) from!1960) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348594 d!144417))

(declare-fun b!1348840 () Bool)

(declare-fun e!767320 () Bool)

(assert (=> b!1348840 (= e!767320 tp_is_empty!37573)))

(declare-fun mapNonEmpty!58082 () Bool)

(declare-fun mapRes!58082 () Bool)

(declare-fun tp!110547 () Bool)

(declare-fun e!767321 () Bool)

(assert (=> mapNonEmpty!58082 (= mapRes!58082 (and tp!110547 e!767321))))

(declare-fun mapRest!58082 () (Array (_ BitVec 32) ValueCell!17888))

(declare-fun mapKey!58082 () (_ BitVec 32))

(declare-fun mapValue!58082 () ValueCell!17888)

(assert (=> mapNonEmpty!58082 (= mapRest!58073 (store mapRest!58082 mapKey!58082 mapValue!58082))))

(declare-fun b!1348839 () Bool)

(assert (=> b!1348839 (= e!767321 tp_is_empty!37573)))

(declare-fun mapIsEmpty!58082 () Bool)

(assert (=> mapIsEmpty!58082 mapRes!58082))

(declare-fun condMapEmpty!58082 () Bool)

(declare-fun mapDefault!58082 () ValueCell!17888)

(assert (=> mapNonEmpty!58073 (= condMapEmpty!58082 (= mapRest!58073 ((as const (Array (_ BitVec 32) ValueCell!17888)) mapDefault!58082)))))

(assert (=> mapNonEmpty!58073 (= tp!110531 (and e!767320 mapRes!58082))))

(assert (= (and mapNonEmpty!58073 condMapEmpty!58082) mapIsEmpty!58082))

(assert (= (and mapNonEmpty!58073 (not condMapEmpty!58082)) mapNonEmpty!58082))

(assert (= (and mapNonEmpty!58082 ((_ is ValueCellFull!17888) mapValue!58082)) b!1348839))

(assert (= (and mapNonEmpty!58073 ((_ is ValueCellFull!17888) mapDefault!58082)) b!1348840))

(declare-fun m!1235383 () Bool)

(assert (=> mapNonEmpty!58082 m!1235383))

(declare-fun b_lambda!24657 () Bool)

(assert (= b_lambda!24655 (or (and start!113606 b_free!31573) b_lambda!24657)))

(declare-fun b_lambda!24659 () Bool)

(assert (= b_lambda!24653 (or (and start!113606 b_free!31573) b_lambda!24659)))

(declare-fun b_lambda!24661 () Bool)

(assert (= b_lambda!24651 (or (and start!113606 b_free!31573) b_lambda!24661)))

(check-sat (not bm!65122) (not d!144409) (not b!1348817) (not b!1348818) (not b!1348831) (not b!1348784) (not b!1348775) (not b!1348779) (not b!1348819) (not b_lambda!24657) (not b_lambda!24649) (not b!1348767) (not b!1348769) (not b_next!31573) (not b!1348716) (not b!1348770) (not mapNonEmpty!58082) b_and!50929 (not b!1348790) (not b!1348815) (not b_lambda!24661) (not b!1348789) (not bm!65124) (not b_lambda!24659) (not b!1348826) (not b!1348822) (not b!1348761) (not d!144413) (not b!1348780) (not b!1348832) (not b!1348709) (not d!144401) (not b!1348693) (not b!1348706) (not b!1348825) (not bm!65125) tp_is_empty!37573 (not bm!65128) (not bm!65120) (not b!1348823) (not bm!65104) (not bm!65101) (not b!1348782) (not d!144411) (not d!144399) (not b!1348718) (not b!1348694) (not b!1348708) (not b!1348781))
(check-sat b_and!50929 (not b_next!31573))
(get-model)

(declare-fun d!144419 () Bool)

(declare-fun get!22456 (Option!776) V!55201)

(assert (=> d!144419 (= (apply!1032 lt!596061 lt!596073) (get!22456 (getValueByKey!725 (toList!11041 lt!596061) lt!596073)))))

(declare-fun bs!38634 () Bool)

(assert (= bs!38634 d!144419))

(declare-fun m!1235385 () Bool)

(assert (=> bs!38634 m!1235385))

(assert (=> bs!38634 m!1235385))

(declare-fun m!1235387 () Bool)

(assert (=> bs!38634 m!1235387))

(assert (=> b!1348775 d!144419))

(declare-fun d!144421 () Bool)

(assert (=> d!144421 (= (apply!1032 (+!4884 lt!596061 (tuple2!24395 lt!596076 minValue!1245)) lt!596073) (apply!1032 lt!596061 lt!596073))))

(declare-fun lt!596118 () Unit!44020)

(declare-fun choose!1987 (ListLongMap!22051 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44020)

(assert (=> d!144421 (= lt!596118 (choose!1987 lt!596061 lt!596076 minValue!1245 lt!596073))))

(declare-fun e!767324 () Bool)

(assert (=> d!144421 e!767324))

(declare-fun res!894922 () Bool)

(assert (=> d!144421 (=> (not res!894922) (not e!767324))))

(assert (=> d!144421 (= res!894922 (contains!9148 lt!596061 lt!596073))))

(assert (=> d!144421 (= (addApplyDifferent!570 lt!596061 lt!596076 minValue!1245 lt!596073) lt!596118)))

(declare-fun b!1348844 () Bool)

(assert (=> b!1348844 (= e!767324 (not (= lt!596073 lt!596076)))))

(assert (= (and d!144421 res!894922) b!1348844))

(declare-fun m!1235389 () Bool)

(assert (=> d!144421 m!1235389))

(assert (=> d!144421 m!1235295))

(declare-fun m!1235391 () Bool)

(assert (=> d!144421 m!1235391))

(assert (=> d!144421 m!1235295))

(assert (=> d!144421 m!1235297))

(assert (=> d!144421 m!1235287))

(assert (=> b!1348775 d!144421))

(declare-fun d!144423 () Bool)

(assert (=> d!144423 (= (apply!1032 (+!4884 lt!596067 (tuple2!24395 lt!596070 zeroValue!1245)) lt!596062) (apply!1032 lt!596067 lt!596062))))

(declare-fun lt!596119 () Unit!44020)

(assert (=> d!144423 (= lt!596119 (choose!1987 lt!596067 lt!596070 zeroValue!1245 lt!596062))))

(declare-fun e!767325 () Bool)

(assert (=> d!144423 e!767325))

(declare-fun res!894923 () Bool)

(assert (=> d!144423 (=> (not res!894923) (not e!767325))))

(assert (=> d!144423 (= res!894923 (contains!9148 lt!596067 lt!596062))))

(assert (=> d!144423 (= (addApplyDifferent!570 lt!596067 lt!596070 zeroValue!1245 lt!596062) lt!596119)))

(declare-fun b!1348845 () Bool)

(assert (=> b!1348845 (= e!767325 (not (= lt!596062 lt!596070)))))

(assert (= (and d!144423 res!894923) b!1348845))

(declare-fun m!1235393 () Bool)

(assert (=> d!144423 m!1235393))

(assert (=> d!144423 m!1235301))

(declare-fun m!1235395 () Bool)

(assert (=> d!144423 m!1235395))

(assert (=> d!144423 m!1235301))

(assert (=> d!144423 m!1235309))

(assert (=> d!144423 m!1235303))

(assert (=> b!1348775 d!144423))

(declare-fun d!144425 () Bool)

(assert (=> d!144425 (= (apply!1032 (+!4884 lt!596064 (tuple2!24395 lt!596074 minValue!1245)) lt!596068) (apply!1032 lt!596064 lt!596068))))

(declare-fun lt!596120 () Unit!44020)

(assert (=> d!144425 (= lt!596120 (choose!1987 lt!596064 lt!596074 minValue!1245 lt!596068))))

(declare-fun e!767326 () Bool)

(assert (=> d!144425 e!767326))

(declare-fun res!894924 () Bool)

(assert (=> d!144425 (=> (not res!894924) (not e!767326))))

(assert (=> d!144425 (= res!894924 (contains!9148 lt!596064 lt!596068))))

(assert (=> d!144425 (= (addApplyDifferent!570 lt!596064 lt!596074 minValue!1245 lt!596068) lt!596120)))

(declare-fun b!1348846 () Bool)

(assert (=> b!1348846 (= e!767326 (not (= lt!596068 lt!596074)))))

(assert (= (and d!144425 res!894924) b!1348846))

(declare-fun m!1235397 () Bool)

(assert (=> d!144425 m!1235397))

(assert (=> d!144425 m!1235289))

(declare-fun m!1235399 () Bool)

(assert (=> d!144425 m!1235399))

(assert (=> d!144425 m!1235289))

(assert (=> d!144425 m!1235291))

(assert (=> d!144425 m!1235313))

(assert (=> b!1348775 d!144425))

(declare-fun d!144427 () Bool)

(declare-fun e!767327 () Bool)

(assert (=> d!144427 e!767327))

(declare-fun res!894925 () Bool)

(assert (=> d!144427 (=> (not res!894925) (not e!767327))))

(declare-fun lt!596124 () ListLongMap!22051)

(assert (=> d!144427 (= res!894925 (contains!9148 lt!596124 (_1!12208 (tuple2!24395 lt!596076 minValue!1245))))))

(declare-fun lt!596121 () List!31527)

(assert (=> d!144427 (= lt!596124 (ListLongMap!22052 lt!596121))))

(declare-fun lt!596123 () Unit!44020)

(declare-fun lt!596122 () Unit!44020)

(assert (=> d!144427 (= lt!596123 lt!596122)))

(assert (=> d!144427 (= (getValueByKey!725 lt!596121 (_1!12208 (tuple2!24395 lt!596076 minValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596076 minValue!1245))))))

(assert (=> d!144427 (= lt!596122 (lemmaContainsTupThenGetReturnValue!368 lt!596121 (_1!12208 (tuple2!24395 lt!596076 minValue!1245)) (_2!12208 (tuple2!24395 lt!596076 minValue!1245))))))

(assert (=> d!144427 (= lt!596121 (insertStrictlySorted!497 (toList!11041 lt!596061) (_1!12208 (tuple2!24395 lt!596076 minValue!1245)) (_2!12208 (tuple2!24395 lt!596076 minValue!1245))))))

(assert (=> d!144427 (= (+!4884 lt!596061 (tuple2!24395 lt!596076 minValue!1245)) lt!596124)))

(declare-fun b!1348847 () Bool)

(declare-fun res!894926 () Bool)

(assert (=> b!1348847 (=> (not res!894926) (not e!767327))))

(assert (=> b!1348847 (= res!894926 (= (getValueByKey!725 (toList!11041 lt!596124) (_1!12208 (tuple2!24395 lt!596076 minValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596076 minValue!1245)))))))

(declare-fun b!1348848 () Bool)

(assert (=> b!1348848 (= e!767327 (contains!9151 (toList!11041 lt!596124) (tuple2!24395 lt!596076 minValue!1245)))))

(assert (= (and d!144427 res!894925) b!1348847))

(assert (= (and b!1348847 res!894926) b!1348848))

(declare-fun m!1235401 () Bool)

(assert (=> d!144427 m!1235401))

(declare-fun m!1235403 () Bool)

(assert (=> d!144427 m!1235403))

(declare-fun m!1235405 () Bool)

(assert (=> d!144427 m!1235405))

(declare-fun m!1235407 () Bool)

(assert (=> d!144427 m!1235407))

(declare-fun m!1235409 () Bool)

(assert (=> b!1348847 m!1235409))

(declare-fun m!1235411 () Bool)

(assert (=> b!1348848 m!1235411))

(assert (=> b!1348775 d!144427))

(declare-fun d!144429 () Bool)

(assert (=> d!144429 (contains!9148 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245)) lt!596058)))

(declare-fun lt!596127 () Unit!44020)

(declare-fun choose!1988 (ListLongMap!22051 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44020)

(assert (=> d!144429 (= lt!596127 (choose!1988 lt!596057 lt!596077 zeroValue!1245 lt!596058))))

(assert (=> d!144429 (contains!9148 lt!596057 lt!596058)))

(assert (=> d!144429 (= (addStillContains!1209 lt!596057 lt!596077 zeroValue!1245 lt!596058) lt!596127)))

(declare-fun bs!38635 () Bool)

(assert (= bs!38635 d!144429))

(assert (=> bs!38635 m!1235315))

(assert (=> bs!38635 m!1235315))

(assert (=> bs!38635 m!1235317))

(declare-fun m!1235413 () Bool)

(assert (=> bs!38635 m!1235413))

(declare-fun m!1235415 () Bool)

(assert (=> bs!38635 m!1235415))

(assert (=> b!1348775 d!144429))

(declare-fun d!144431 () Bool)

(declare-fun e!767328 () Bool)

(assert (=> d!144431 e!767328))

(declare-fun res!894927 () Bool)

(assert (=> d!144431 (=> (not res!894927) (not e!767328))))

(declare-fun lt!596131 () ListLongMap!22051)

(assert (=> d!144431 (= res!894927 (contains!9148 lt!596131 (_1!12208 (tuple2!24395 lt!596077 zeroValue!1245))))))

(declare-fun lt!596128 () List!31527)

(assert (=> d!144431 (= lt!596131 (ListLongMap!22052 lt!596128))))

(declare-fun lt!596130 () Unit!44020)

(declare-fun lt!596129 () Unit!44020)

(assert (=> d!144431 (= lt!596130 lt!596129)))

(assert (=> d!144431 (= (getValueByKey!725 lt!596128 (_1!12208 (tuple2!24395 lt!596077 zeroValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596077 zeroValue!1245))))))

(assert (=> d!144431 (= lt!596129 (lemmaContainsTupThenGetReturnValue!368 lt!596128 (_1!12208 (tuple2!24395 lt!596077 zeroValue!1245)) (_2!12208 (tuple2!24395 lt!596077 zeroValue!1245))))))

(assert (=> d!144431 (= lt!596128 (insertStrictlySorted!497 (toList!11041 lt!596057) (_1!12208 (tuple2!24395 lt!596077 zeroValue!1245)) (_2!12208 (tuple2!24395 lt!596077 zeroValue!1245))))))

(assert (=> d!144431 (= (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245)) lt!596131)))

(declare-fun b!1348850 () Bool)

(declare-fun res!894928 () Bool)

(assert (=> b!1348850 (=> (not res!894928) (not e!767328))))

(assert (=> b!1348850 (= res!894928 (= (getValueByKey!725 (toList!11041 lt!596131) (_1!12208 (tuple2!24395 lt!596077 zeroValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596077 zeroValue!1245)))))))

(declare-fun b!1348851 () Bool)

(assert (=> b!1348851 (= e!767328 (contains!9151 (toList!11041 lt!596131) (tuple2!24395 lt!596077 zeroValue!1245)))))

(assert (= (and d!144431 res!894927) b!1348850))

(assert (= (and b!1348850 res!894928) b!1348851))

(declare-fun m!1235417 () Bool)

(assert (=> d!144431 m!1235417))

(declare-fun m!1235419 () Bool)

(assert (=> d!144431 m!1235419))

(declare-fun m!1235421 () Bool)

(assert (=> d!144431 m!1235421))

(declare-fun m!1235423 () Bool)

(assert (=> d!144431 m!1235423))

(declare-fun m!1235425 () Bool)

(assert (=> b!1348850 m!1235425))

(declare-fun m!1235427 () Bool)

(assert (=> b!1348851 m!1235427))

(assert (=> b!1348775 d!144431))

(declare-fun d!144433 () Bool)

(declare-fun e!767329 () Bool)

(assert (=> d!144433 e!767329))

(declare-fun res!894929 () Bool)

(assert (=> d!144433 (=> (not res!894929) (not e!767329))))

(declare-fun lt!596135 () ListLongMap!22051)

(assert (=> d!144433 (= res!894929 (contains!9148 lt!596135 (_1!12208 (tuple2!24395 lt!596070 zeroValue!1245))))))

(declare-fun lt!596132 () List!31527)

(assert (=> d!144433 (= lt!596135 (ListLongMap!22052 lt!596132))))

(declare-fun lt!596134 () Unit!44020)

(declare-fun lt!596133 () Unit!44020)

(assert (=> d!144433 (= lt!596134 lt!596133)))

(assert (=> d!144433 (= (getValueByKey!725 lt!596132 (_1!12208 (tuple2!24395 lt!596070 zeroValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596070 zeroValue!1245))))))

(assert (=> d!144433 (= lt!596133 (lemmaContainsTupThenGetReturnValue!368 lt!596132 (_1!12208 (tuple2!24395 lt!596070 zeroValue!1245)) (_2!12208 (tuple2!24395 lt!596070 zeroValue!1245))))))

(assert (=> d!144433 (= lt!596132 (insertStrictlySorted!497 (toList!11041 lt!596067) (_1!12208 (tuple2!24395 lt!596070 zeroValue!1245)) (_2!12208 (tuple2!24395 lt!596070 zeroValue!1245))))))

(assert (=> d!144433 (= (+!4884 lt!596067 (tuple2!24395 lt!596070 zeroValue!1245)) lt!596135)))

(declare-fun b!1348852 () Bool)

(declare-fun res!894930 () Bool)

(assert (=> b!1348852 (=> (not res!894930) (not e!767329))))

(assert (=> b!1348852 (= res!894930 (= (getValueByKey!725 (toList!11041 lt!596135) (_1!12208 (tuple2!24395 lt!596070 zeroValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596070 zeroValue!1245)))))))

(declare-fun b!1348853 () Bool)

(assert (=> b!1348853 (= e!767329 (contains!9151 (toList!11041 lt!596135) (tuple2!24395 lt!596070 zeroValue!1245)))))

(assert (= (and d!144433 res!894929) b!1348852))

(assert (= (and b!1348852 res!894930) b!1348853))

(declare-fun m!1235429 () Bool)

(assert (=> d!144433 m!1235429))

(declare-fun m!1235431 () Bool)

(assert (=> d!144433 m!1235431))

(declare-fun m!1235433 () Bool)

(assert (=> d!144433 m!1235433))

(declare-fun m!1235435 () Bool)

(assert (=> d!144433 m!1235435))

(declare-fun m!1235437 () Bool)

(assert (=> b!1348852 m!1235437))

(declare-fun m!1235439 () Bool)

(assert (=> b!1348853 m!1235439))

(assert (=> b!1348775 d!144433))

(declare-fun d!144435 () Bool)

(declare-fun e!767331 () Bool)

(assert (=> d!144435 e!767331))

(declare-fun res!894931 () Bool)

(assert (=> d!144435 (=> res!894931 e!767331)))

(declare-fun lt!596137 () Bool)

(assert (=> d!144435 (= res!894931 (not lt!596137))))

(declare-fun lt!596136 () Bool)

(assert (=> d!144435 (= lt!596137 lt!596136)))

(declare-fun lt!596138 () Unit!44020)

(declare-fun e!767330 () Unit!44020)

(assert (=> d!144435 (= lt!596138 e!767330)))

(declare-fun c!126481 () Bool)

(assert (=> d!144435 (= c!126481 lt!596136)))

(assert (=> d!144435 (= lt!596136 (containsKey!742 (toList!11041 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245))) lt!596058))))

(assert (=> d!144435 (= (contains!9148 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245)) lt!596058) lt!596137)))

(declare-fun b!1348854 () Bool)

(declare-fun lt!596139 () Unit!44020)

(assert (=> b!1348854 (= e!767330 lt!596139)))

(assert (=> b!1348854 (= lt!596139 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245))) lt!596058))))

(assert (=> b!1348854 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245))) lt!596058))))

(declare-fun b!1348855 () Bool)

(declare-fun Unit!44025 () Unit!44020)

(assert (=> b!1348855 (= e!767330 Unit!44025)))

(declare-fun b!1348856 () Bool)

(assert (=> b!1348856 (= e!767331 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 lt!596057 (tuple2!24395 lt!596077 zeroValue!1245))) lt!596058)))))

(assert (= (and d!144435 c!126481) b!1348854))

(assert (= (and d!144435 (not c!126481)) b!1348855))

(assert (= (and d!144435 (not res!894931)) b!1348856))

(declare-fun m!1235441 () Bool)

(assert (=> d!144435 m!1235441))

(declare-fun m!1235443 () Bool)

(assert (=> b!1348854 m!1235443))

(declare-fun m!1235445 () Bool)

(assert (=> b!1348854 m!1235445))

(assert (=> b!1348854 m!1235445))

(declare-fun m!1235447 () Bool)

(assert (=> b!1348854 m!1235447))

(assert (=> b!1348856 m!1235445))

(assert (=> b!1348856 m!1235445))

(assert (=> b!1348856 m!1235447))

(assert (=> b!1348775 d!144435))

(declare-fun b!1348857 () Bool)

(declare-fun lt!596146 () Unit!44020)

(declare-fun lt!596145 () Unit!44020)

(assert (=> b!1348857 (= lt!596146 lt!596145)))

(declare-fun lt!596140 () (_ BitVec 64))

(declare-fun lt!596142 () V!55201)

(declare-fun lt!596143 () ListLongMap!22051)

(declare-fun lt!596141 () (_ BitVec 64))

(assert (=> b!1348857 (not (contains!9148 (+!4884 lt!596143 (tuple2!24395 lt!596141 lt!596142)) lt!596140))))

(assert (=> b!1348857 (= lt!596145 (addStillNotContains!491 lt!596143 lt!596141 lt!596142 lt!596140))))

(assert (=> b!1348857 (= lt!596140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348857 (= lt!596142 (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348857 (= lt!596141 (select (arr!44418 _keys!1571) from!1960))))

(declare-fun call!65132 () ListLongMap!22051)

(assert (=> b!1348857 (= lt!596143 call!65132)))

(declare-fun e!767333 () ListLongMap!22051)

(assert (=> b!1348857 (= e!767333 (+!4884 call!65132 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348858 () Bool)

(declare-fun e!767336 () Bool)

(declare-fun e!767335 () Bool)

(assert (=> b!1348858 (= e!767336 e!767335)))

(declare-fun c!126483 () Bool)

(assert (=> b!1348858 (= c!126483 (bvslt from!1960 (size!44970 _keys!1571)))))

(declare-fun d!144437 () Bool)

(declare-fun e!767332 () Bool)

(assert (=> d!144437 e!767332))

(declare-fun res!894933 () Bool)

(assert (=> d!144437 (=> (not res!894933) (not e!767332))))

(declare-fun lt!596144 () ListLongMap!22051)

(assert (=> d!144437 (= res!894933 (not (contains!9148 lt!596144 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!767337 () ListLongMap!22051)

(assert (=> d!144437 (= lt!596144 e!767337)))

(declare-fun c!126482 () Bool)

(assert (=> d!144437 (= c!126482 (bvsge from!1960 (size!44970 _keys!1571)))))

(assert (=> d!144437 (validMask!0 mask!1977)))

(assert (=> d!144437 (= (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) lt!596144)))

(declare-fun b!1348859 () Bool)

(assert (=> b!1348859 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44970 _keys!1571)))))

(assert (=> b!1348859 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44969 _values!1303)))))

(declare-fun e!767334 () Bool)

(assert (=> b!1348859 (= e!767334 (= (apply!1032 lt!596144 (select (arr!44418 _keys!1571) from!1960)) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348860 () Bool)

(declare-fun res!894934 () Bool)

(assert (=> b!1348860 (=> (not res!894934) (not e!767332))))

(assert (=> b!1348860 (= res!894934 (not (contains!9148 lt!596144 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348861 () Bool)

(assert (=> b!1348861 (= e!767335 (isEmpty!1101 lt!596144))))

(declare-fun b!1348862 () Bool)

(assert (=> b!1348862 (= e!767332 e!767336)))

(declare-fun c!126484 () Bool)

(declare-fun e!767338 () Bool)

(assert (=> b!1348862 (= c!126484 e!767338)))

(declare-fun res!894932 () Bool)

(assert (=> b!1348862 (=> (not res!894932) (not e!767338))))

(assert (=> b!1348862 (= res!894932 (bvslt from!1960 (size!44970 _keys!1571)))))

(declare-fun b!1348863 () Bool)

(assert (=> b!1348863 (= e!767333 call!65132)))

(declare-fun b!1348864 () Bool)

(assert (=> b!1348864 (= e!767338 (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)))))

(assert (=> b!1348864 (bvsge from!1960 #b00000000000000000000000000000000)))

(declare-fun b!1348865 () Bool)

(assert (=> b!1348865 (= e!767335 (= lt!596144 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1348866 () Bool)

(assert (=> b!1348866 (= e!767337 (ListLongMap!22052 Nil!31524))))

(declare-fun bm!65129 () Bool)

(assert (=> bm!65129 (= call!65132 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd from!1960 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348867 () Bool)

(assert (=> b!1348867 (= e!767336 e!767334)))

(assert (=> b!1348867 (and (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44970 _keys!1571)))))

(declare-fun res!894935 () Bool)

(assert (=> b!1348867 (= res!894935 (contains!9148 lt!596144 (select (arr!44418 _keys!1571) from!1960)))))

(assert (=> b!1348867 (=> (not res!894935) (not e!767334))))

(declare-fun b!1348868 () Bool)

(assert (=> b!1348868 (= e!767337 e!767333)))

(declare-fun c!126485 () Bool)

(assert (=> b!1348868 (= c!126485 (validKeyInArray!0 (select (arr!44418 _keys!1571) from!1960)))))

(assert (= (and d!144437 c!126482) b!1348866))

(assert (= (and d!144437 (not c!126482)) b!1348868))

(assert (= (and b!1348868 c!126485) b!1348857))

(assert (= (and b!1348868 (not c!126485)) b!1348863))

(assert (= (or b!1348857 b!1348863) bm!65129))

(assert (= (and d!144437 res!894933) b!1348860))

(assert (= (and b!1348860 res!894934) b!1348862))

(assert (= (and b!1348862 res!894932) b!1348864))

(assert (= (and b!1348862 c!126484) b!1348867))

(assert (= (and b!1348862 (not c!126484)) b!1348858))

(assert (= (and b!1348867 res!894935) b!1348859))

(assert (= (and b!1348858 c!126483) b!1348865))

(assert (= (and b!1348858 (not c!126483)) b!1348861))

(declare-fun b_lambda!24663 () Bool)

(assert (=> (not b_lambda!24663) (not b!1348857)))

(assert (=> b!1348857 t!46158))

(declare-fun b_and!50931 () Bool)

(assert (= b_and!50929 (and (=> t!46158 result!25973) b_and!50931)))

(declare-fun b_lambda!24665 () Bool)

(assert (=> (not b_lambda!24665) (not b!1348859)))

(assert (=> b!1348859 t!46158))

(declare-fun b_and!50933 () Bool)

(assert (= b_and!50931 (and (=> t!46158 result!25973) b_and!50933)))

(declare-fun m!1235449 () Bool)

(assert (=> bm!65129 m!1235449))

(assert (=> b!1348865 m!1235449))

(declare-fun m!1235451 () Bool)

(assert (=> d!144437 m!1235451))

(assert (=> d!144437 m!1235185))

(assert (=> b!1348857 m!1235177))

(assert (=> b!1348857 m!1235167))

(assert (=> b!1348857 m!1235169))

(assert (=> b!1348857 m!1235171))

(declare-fun m!1235453 () Bool)

(assert (=> b!1348857 m!1235453))

(assert (=> b!1348857 m!1235453))

(declare-fun m!1235455 () Bool)

(assert (=> b!1348857 m!1235455))

(declare-fun m!1235457 () Bool)

(assert (=> b!1348857 m!1235457))

(assert (=> b!1348857 m!1235167))

(assert (=> b!1348857 m!1235169))

(declare-fun m!1235459 () Bool)

(assert (=> b!1348857 m!1235459))

(assert (=> b!1348859 m!1235177))

(assert (=> b!1348859 m!1235177))

(declare-fun m!1235461 () Bool)

(assert (=> b!1348859 m!1235461))

(assert (=> b!1348859 m!1235167))

(assert (=> b!1348859 m!1235169))

(assert (=> b!1348859 m!1235171))

(assert (=> b!1348859 m!1235169))

(assert (=> b!1348859 m!1235167))

(declare-fun m!1235463 () Bool)

(assert (=> b!1348860 m!1235463))

(assert (=> b!1348864 m!1235177))

(assert (=> b!1348864 m!1235177))

(assert (=> b!1348864 m!1235183))

(declare-fun m!1235465 () Bool)

(assert (=> b!1348861 m!1235465))

(assert (=> b!1348868 m!1235177))

(assert (=> b!1348868 m!1235177))

(assert (=> b!1348868 m!1235183))

(assert (=> b!1348867 m!1235177))

(assert (=> b!1348867 m!1235177))

(declare-fun m!1235467 () Bool)

(assert (=> b!1348867 m!1235467))

(assert (=> b!1348775 d!144437))

(declare-fun d!144439 () Bool)

(assert (=> d!144439 (= (apply!1032 (+!4884 lt!596067 (tuple2!24395 lt!596070 zeroValue!1245)) lt!596062) (get!22456 (getValueByKey!725 (toList!11041 (+!4884 lt!596067 (tuple2!24395 lt!596070 zeroValue!1245))) lt!596062)))))

(declare-fun bs!38636 () Bool)

(assert (= bs!38636 d!144439))

(declare-fun m!1235469 () Bool)

(assert (=> bs!38636 m!1235469))

(assert (=> bs!38636 m!1235469))

(declare-fun m!1235471 () Bool)

(assert (=> bs!38636 m!1235471))

(assert (=> b!1348775 d!144439))

(declare-fun d!144441 () Bool)

(assert (=> d!144441 (= (apply!1032 lt!596067 lt!596062) (get!22456 (getValueByKey!725 (toList!11041 lt!596067) lt!596062)))))

(declare-fun bs!38637 () Bool)

(assert (= bs!38637 d!144441))

(declare-fun m!1235473 () Bool)

(assert (=> bs!38637 m!1235473))

(assert (=> bs!38637 m!1235473))

(declare-fun m!1235475 () Bool)

(assert (=> bs!38637 m!1235475))

(assert (=> b!1348775 d!144441))

(declare-fun d!144443 () Bool)

(assert (=> d!144443 (= (apply!1032 (+!4884 lt!596064 (tuple2!24395 lt!596074 minValue!1245)) lt!596068) (get!22456 (getValueByKey!725 (toList!11041 (+!4884 lt!596064 (tuple2!24395 lt!596074 minValue!1245))) lt!596068)))))

(declare-fun bs!38638 () Bool)

(assert (= bs!38638 d!144443))

(declare-fun m!1235477 () Bool)

(assert (=> bs!38638 m!1235477))

(assert (=> bs!38638 m!1235477))

(declare-fun m!1235479 () Bool)

(assert (=> bs!38638 m!1235479))

(assert (=> b!1348775 d!144443))

(declare-fun d!144445 () Bool)

(declare-fun e!767339 () Bool)

(assert (=> d!144445 e!767339))

(declare-fun res!894936 () Bool)

(assert (=> d!144445 (=> (not res!894936) (not e!767339))))

(declare-fun lt!596150 () ListLongMap!22051)

(assert (=> d!144445 (= res!894936 (contains!9148 lt!596150 (_1!12208 (tuple2!24395 lt!596074 minValue!1245))))))

(declare-fun lt!596147 () List!31527)

(assert (=> d!144445 (= lt!596150 (ListLongMap!22052 lt!596147))))

(declare-fun lt!596149 () Unit!44020)

(declare-fun lt!596148 () Unit!44020)

(assert (=> d!144445 (= lt!596149 lt!596148)))

(assert (=> d!144445 (= (getValueByKey!725 lt!596147 (_1!12208 (tuple2!24395 lt!596074 minValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596074 minValue!1245))))))

(assert (=> d!144445 (= lt!596148 (lemmaContainsTupThenGetReturnValue!368 lt!596147 (_1!12208 (tuple2!24395 lt!596074 minValue!1245)) (_2!12208 (tuple2!24395 lt!596074 minValue!1245))))))

(assert (=> d!144445 (= lt!596147 (insertStrictlySorted!497 (toList!11041 lt!596064) (_1!12208 (tuple2!24395 lt!596074 minValue!1245)) (_2!12208 (tuple2!24395 lt!596074 minValue!1245))))))

(assert (=> d!144445 (= (+!4884 lt!596064 (tuple2!24395 lt!596074 minValue!1245)) lt!596150)))

(declare-fun b!1348869 () Bool)

(declare-fun res!894937 () Bool)

(assert (=> b!1348869 (=> (not res!894937) (not e!767339))))

(assert (=> b!1348869 (= res!894937 (= (getValueByKey!725 (toList!11041 lt!596150) (_1!12208 (tuple2!24395 lt!596074 minValue!1245))) (Some!775 (_2!12208 (tuple2!24395 lt!596074 minValue!1245)))))))

(declare-fun b!1348870 () Bool)

(assert (=> b!1348870 (= e!767339 (contains!9151 (toList!11041 lt!596150) (tuple2!24395 lt!596074 minValue!1245)))))

(assert (= (and d!144445 res!894936) b!1348869))

(assert (= (and b!1348869 res!894937) b!1348870))

(declare-fun m!1235481 () Bool)

(assert (=> d!144445 m!1235481))

(declare-fun m!1235483 () Bool)

(assert (=> d!144445 m!1235483))

(declare-fun m!1235485 () Bool)

(assert (=> d!144445 m!1235485))

(declare-fun m!1235487 () Bool)

(assert (=> d!144445 m!1235487))

(declare-fun m!1235489 () Bool)

(assert (=> b!1348869 m!1235489))

(declare-fun m!1235491 () Bool)

(assert (=> b!1348870 m!1235491))

(assert (=> b!1348775 d!144445))

(declare-fun d!144447 () Bool)

(assert (=> d!144447 (= (apply!1032 lt!596064 lt!596068) (get!22456 (getValueByKey!725 (toList!11041 lt!596064) lt!596068)))))

(declare-fun bs!38639 () Bool)

(assert (= bs!38639 d!144447))

(declare-fun m!1235493 () Bool)

(assert (=> bs!38639 m!1235493))

(assert (=> bs!38639 m!1235493))

(declare-fun m!1235495 () Bool)

(assert (=> bs!38639 m!1235495))

(assert (=> b!1348775 d!144447))

(declare-fun d!144449 () Bool)

(assert (=> d!144449 (= (apply!1032 (+!4884 lt!596061 (tuple2!24395 lt!596076 minValue!1245)) lt!596073) (get!22456 (getValueByKey!725 (toList!11041 (+!4884 lt!596061 (tuple2!24395 lt!596076 minValue!1245))) lt!596073)))))

(declare-fun bs!38640 () Bool)

(assert (= bs!38640 d!144449))

(declare-fun m!1235497 () Bool)

(assert (=> bs!38640 m!1235497))

(assert (=> bs!38640 m!1235497))

(declare-fun m!1235499 () Bool)

(assert (=> bs!38640 m!1235499))

(assert (=> b!1348775 d!144449))

(declare-fun b!1348882 () Bool)

(declare-fun e!767345 () Option!776)

(assert (=> b!1348882 (= e!767345 None!774)))

(declare-fun c!126490 () Bool)

(declare-fun d!144451 () Bool)

(assert (=> d!144451 (= c!126490 (and ((_ is Cons!31523) (toList!11041 lt!596094)) (= (_1!12208 (h!32732 (toList!11041 lt!596094))) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!767344 () Option!776)

(assert (=> d!144451 (= (getValueByKey!725 (toList!11041 lt!596094) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!767344)))

(declare-fun b!1348880 () Bool)

(assert (=> b!1348880 (= e!767344 e!767345)))

(declare-fun c!126491 () Bool)

(assert (=> b!1348880 (= c!126491 (and ((_ is Cons!31523) (toList!11041 lt!596094)) (not (= (_1!12208 (h!32732 (toList!11041 lt!596094))) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1348879 () Bool)

(assert (=> b!1348879 (= e!767344 (Some!775 (_2!12208 (h!32732 (toList!11041 lt!596094)))))))

(declare-fun b!1348881 () Bool)

(assert (=> b!1348881 (= e!767345 (getValueByKey!725 (t!46159 (toList!11041 lt!596094)) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!144451 c!126490) b!1348879))

(assert (= (and d!144451 (not c!126490)) b!1348880))

(assert (= (and b!1348880 c!126491) b!1348881))

(assert (= (and b!1348880 (not c!126491)) b!1348882))

(declare-fun m!1235501 () Bool)

(assert (=> b!1348881 m!1235501))

(assert (=> b!1348789 d!144451))

(assert (=> d!144401 d!144403))

(declare-fun lt!596153 () Bool)

(declare-fun d!144453 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!663 (List!31527) (InoxSet tuple2!24394))

(assert (=> d!144453 (= lt!596153 (select (content!663 (toList!11041 lt!596094)) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!767351 () Bool)

(assert (=> d!144453 (= lt!596153 e!767351)))

(declare-fun res!894942 () Bool)

(assert (=> d!144453 (=> (not res!894942) (not e!767351))))

(assert (=> d!144453 (= res!894942 ((_ is Cons!31523) (toList!11041 lt!596094)))))

(assert (=> d!144453 (= (contains!9151 (toList!11041 lt!596094) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596153)))

(declare-fun b!1348887 () Bool)

(declare-fun e!767350 () Bool)

(assert (=> b!1348887 (= e!767351 e!767350)))

(declare-fun res!894943 () Bool)

(assert (=> b!1348887 (=> res!894943 e!767350)))

(assert (=> b!1348887 (= res!894943 (= (h!32732 (toList!11041 lt!596094)) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348888 () Bool)

(assert (=> b!1348888 (= e!767350 (contains!9151 (t!46159 (toList!11041 lt!596094)) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144453 res!894942) b!1348887))

(assert (= (and b!1348887 (not res!894943)) b!1348888))

(declare-fun m!1235503 () Bool)

(assert (=> d!144453 m!1235503))

(declare-fun m!1235505 () Bool)

(assert (=> d!144453 m!1235505))

(declare-fun m!1235507 () Bool)

(assert (=> b!1348888 m!1235507))

(assert (=> b!1348790 d!144453))

(declare-fun d!144455 () Bool)

(assert (=> d!144455 (= (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (and (not (= (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348822 d!144455))

(declare-fun d!144457 () Bool)

(assert (=> d!144457 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun lt!596156 () Unit!44020)

(declare-fun choose!1989 (List!31527 (_ BitVec 64)) Unit!44020)

(assert (=> d!144457 (= lt!596156 (choose!1989 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(declare-fun e!767354 () Bool)

(assert (=> d!144457 e!767354))

(declare-fun res!894946 () Bool)

(assert (=> d!144457 (=> (not res!894946) (not e!767354))))

(declare-fun isStrictlySorted!879 (List!31527) Bool)

(assert (=> d!144457 (= res!894946 (isStrictlySorted!879 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144457 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) lt!596156)))

(declare-fun b!1348891 () Bool)

(assert (=> b!1348891 (= e!767354 (containsKey!742 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))

(assert (= (and d!144457 res!894946) b!1348891))

(assert (=> d!144457 m!1235335))

(assert (=> d!144457 m!1235335))

(assert (=> d!144457 m!1235337))

(declare-fun m!1235509 () Bool)

(assert (=> d!144457 m!1235509))

(declare-fun m!1235511 () Bool)

(assert (=> d!144457 m!1235511))

(assert (=> b!1348891 m!1235331))

(assert (=> b!1348782 d!144457))

(declare-fun d!144459 () Bool)

(declare-fun isEmpty!1102 (Option!776) Bool)

(assert (=> d!144459 (= (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142)) (not (isEmpty!1102 (getValueByKey!725 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142))))))

(declare-fun bs!38641 () Bool)

(assert (= bs!38641 d!144459))

(assert (=> bs!38641 m!1235335))

(declare-fun m!1235513 () Bool)

(assert (=> bs!38641 m!1235513))

(assert (=> b!1348782 d!144459))

(declare-fun b!1348895 () Bool)

(declare-fun e!767356 () Option!776)

(assert (=> b!1348895 (= e!767356 None!774)))

(declare-fun c!126492 () Bool)

(declare-fun d!144461 () Bool)

(assert (=> d!144461 (= c!126492 (and ((_ is Cons!31523) (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12208 (h!32732 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(declare-fun e!767355 () Option!776)

(assert (=> d!144461 (= (getValueByKey!725 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) e!767355)))

(declare-fun b!1348893 () Bool)

(assert (=> b!1348893 (= e!767355 e!767356)))

(declare-fun c!126493 () Bool)

(assert (=> b!1348893 (= c!126493 (and ((_ is Cons!31523) (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (not (= (_1!12208 (h!32732 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142))))))

(declare-fun b!1348892 () Bool)

(assert (=> b!1348892 (= e!767355 (Some!775 (_2!12208 (h!32732 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))))

(declare-fun b!1348894 () Bool)

(assert (=> b!1348894 (= e!767356 (getValueByKey!725 (t!46159 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1142))))

(assert (= (and d!144461 c!126492) b!1348892))

(assert (= (and d!144461 (not c!126492)) b!1348893))

(assert (= (and b!1348893 c!126493) b!1348894))

(assert (= (and b!1348893 (not c!126493)) b!1348895))

(declare-fun m!1235515 () Bool)

(assert (=> b!1348894 m!1235515))

(assert (=> b!1348782 d!144461))

(assert (=> b!1348784 d!144459))

(assert (=> b!1348784 d!144461))

(assert (=> bm!65124 d!144437))

(declare-fun b!1348896 () Bool)

(declare-fun lt!596163 () Unit!44020)

(declare-fun lt!596162 () Unit!44020)

(assert (=> b!1348896 (= lt!596163 lt!596162)))

(declare-fun lt!596160 () ListLongMap!22051)

(declare-fun lt!596159 () V!55201)

(declare-fun lt!596157 () (_ BitVec 64))

(declare-fun lt!596158 () (_ BitVec 64))

(assert (=> b!1348896 (not (contains!9148 (+!4884 lt!596160 (tuple2!24395 lt!596158 lt!596159)) lt!596157))))

(assert (=> b!1348896 (= lt!596162 (addStillNotContains!491 lt!596160 lt!596158 lt!596159 lt!596157))))

(assert (=> b!1348896 (= lt!596157 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1348896 (= lt!596159 (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1348896 (= lt!596158 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)))))

(declare-fun call!65133 () ListLongMap!22051)

(assert (=> b!1348896 (= lt!596160 call!65133)))

(declare-fun e!767358 () ListLongMap!22051)

(assert (=> b!1348896 (= e!767358 (+!4884 call!65133 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348897 () Bool)

(declare-fun e!767361 () Bool)

(declare-fun e!767360 () Bool)

(assert (=> b!1348897 (= e!767361 e!767360)))

(declare-fun c!126495 () Bool)

(assert (=> b!1348897 (= c!126495 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(declare-fun d!144463 () Bool)

(declare-fun e!767357 () Bool)

(assert (=> d!144463 e!767357))

(declare-fun res!894948 () Bool)

(assert (=> d!144463 (=> (not res!894948) (not e!767357))))

(declare-fun lt!596161 () ListLongMap!22051)

(assert (=> d!144463 (= res!894948 (not (contains!9148 lt!596161 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!767362 () ListLongMap!22051)

(assert (=> d!144463 (= lt!596161 e!767362)))

(declare-fun c!126494 () Bool)

(assert (=> d!144463 (= c!126494 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(assert (=> d!144463 (validMask!0 mask!1977)))

(assert (=> d!144463 (= (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) defaultEntry!1306) lt!596161)))

(declare-fun b!1348898 () Bool)

(assert (=> b!1348898 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(assert (=> b!1348898 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44969 _values!1303)))))

(declare-fun e!767359 () Bool)

(assert (=> b!1348898 (= e!767359 (= (apply!1032 lt!596161 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348899 () Bool)

(declare-fun res!894949 () Bool)

(assert (=> b!1348899 (=> (not res!894949) (not e!767357))))

(assert (=> b!1348899 (= res!894949 (not (contains!9148 lt!596161 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348900 () Bool)

(assert (=> b!1348900 (= e!767360 (isEmpty!1101 lt!596161))))

(declare-fun b!1348901 () Bool)

(assert (=> b!1348901 (= e!767357 e!767361)))

(declare-fun c!126496 () Bool)

(declare-fun e!767363 () Bool)

(assert (=> b!1348901 (= c!126496 e!767363)))

(declare-fun res!894947 () Bool)

(assert (=> b!1348901 (=> (not res!894947) (not e!767363))))

(assert (=> b!1348901 (= res!894947 (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(declare-fun b!1348902 () Bool)

(assert (=> b!1348902 (= e!767358 call!65133)))

(declare-fun b!1348903 () Bool)

(assert (=> b!1348903 (= e!767363 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1348903 (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1348904 () Bool)

(assert (=> b!1348904 (= e!767360 (= lt!596161 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306)))))

(declare-fun b!1348905 () Bool)

(assert (=> b!1348905 (= e!767362 (ListLongMap!22052 Nil!31524))))

(declare-fun bm!65130 () Bool)

(assert (=> bm!65130 (= call!65133 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1306))))

(declare-fun b!1348906 () Bool)

(assert (=> b!1348906 (= e!767361 e!767359)))

(assert (=> b!1348906 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(declare-fun res!894950 () Bool)

(assert (=> b!1348906 (= res!894950 (contains!9148 lt!596161 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (=> b!1348906 (=> (not res!894950) (not e!767359))))

(declare-fun b!1348907 () Bool)

(assert (=> b!1348907 (= e!767362 e!767358)))

(declare-fun c!126497 () Bool)

(assert (=> b!1348907 (= c!126497 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960 #b00000000000000000000000000000001))))))

(assert (= (and d!144463 c!126494) b!1348905))

(assert (= (and d!144463 (not c!126494)) b!1348907))

(assert (= (and b!1348907 c!126497) b!1348896))

(assert (= (and b!1348907 (not c!126497)) b!1348902))

(assert (= (or b!1348896 b!1348902) bm!65130))

(assert (= (and d!144463 res!894948) b!1348899))

(assert (= (and b!1348899 res!894949) b!1348901))

(assert (= (and b!1348901 res!894947) b!1348903))

(assert (= (and b!1348901 c!126496) b!1348906))

(assert (= (and b!1348901 (not c!126496)) b!1348897))

(assert (= (and b!1348906 res!894950) b!1348898))

(assert (= (and b!1348897 c!126495) b!1348904))

(assert (= (and b!1348897 (not c!126495)) b!1348900))

(declare-fun b_lambda!24667 () Bool)

(assert (=> (not b_lambda!24667) (not b!1348896)))

(assert (=> b!1348896 t!46158))

(declare-fun b_and!50935 () Bool)

(assert (= b_and!50933 (and (=> t!46158 result!25973) b_and!50935)))

(declare-fun b_lambda!24669 () Bool)

(assert (=> (not b_lambda!24669) (not b!1348898)))

(assert (=> b!1348898 t!46158))

(declare-fun b_and!50937 () Bool)

(assert (= b_and!50935 (and (=> t!46158 result!25973) b_and!50937)))

(declare-fun m!1235517 () Bool)

(assert (=> bm!65130 m!1235517))

(assert (=> b!1348904 m!1235517))

(declare-fun m!1235519 () Bool)

(assert (=> d!144463 m!1235519))

(assert (=> d!144463 m!1235185))

(declare-fun m!1235521 () Bool)

(assert (=> b!1348896 m!1235521))

(declare-fun m!1235523 () Bool)

(assert (=> b!1348896 m!1235523))

(assert (=> b!1348896 m!1235169))

(declare-fun m!1235525 () Bool)

(assert (=> b!1348896 m!1235525))

(declare-fun m!1235527 () Bool)

(assert (=> b!1348896 m!1235527))

(assert (=> b!1348896 m!1235527))

(declare-fun m!1235529 () Bool)

(assert (=> b!1348896 m!1235529))

(declare-fun m!1235531 () Bool)

(assert (=> b!1348896 m!1235531))

(assert (=> b!1348896 m!1235523))

(assert (=> b!1348896 m!1235169))

(declare-fun m!1235533 () Bool)

(assert (=> b!1348896 m!1235533))

(assert (=> b!1348898 m!1235521))

(assert (=> b!1348898 m!1235521))

(declare-fun m!1235535 () Bool)

(assert (=> b!1348898 m!1235535))

(assert (=> b!1348898 m!1235523))

(assert (=> b!1348898 m!1235169))

(assert (=> b!1348898 m!1235525))

(assert (=> b!1348898 m!1235169))

(assert (=> b!1348898 m!1235523))

(declare-fun m!1235537 () Bool)

(assert (=> b!1348899 m!1235537))

(assert (=> b!1348903 m!1235521))

(assert (=> b!1348903 m!1235521))

(declare-fun m!1235539 () Bool)

(assert (=> b!1348903 m!1235539))

(declare-fun m!1235541 () Bool)

(assert (=> b!1348900 m!1235541))

(assert (=> b!1348907 m!1235521))

(assert (=> b!1348907 m!1235521))

(assert (=> b!1348907 m!1235539))

(assert (=> b!1348906 m!1235521))

(assert (=> b!1348906 m!1235521))

(declare-fun m!1235543 () Bool)

(assert (=> b!1348906 m!1235543))

(assert (=> b!1348823 d!144463))

(assert (=> bm!65128 d!144463))

(declare-fun d!144465 () Bool)

(declare-fun e!767365 () Bool)

(assert (=> d!144465 e!767365))

(declare-fun res!894951 () Bool)

(assert (=> d!144465 (=> res!894951 e!767365)))

(declare-fun lt!596165 () Bool)

(assert (=> d!144465 (= res!894951 (not lt!596165))))

(declare-fun lt!596164 () Bool)

(assert (=> d!144465 (= lt!596165 lt!596164)))

(declare-fun lt!596166 () Unit!44020)

(declare-fun e!767364 () Unit!44020)

(assert (=> d!144465 (= lt!596166 e!767364)))

(declare-fun c!126498 () Bool)

(assert (=> d!144465 (= c!126498 lt!596164)))

(assert (=> d!144465 (= lt!596164 (containsKey!742 (toList!11041 lt!596059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144465 (= (contains!9148 lt!596059 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596165)))

(declare-fun b!1348908 () Bool)

(declare-fun lt!596167 () Unit!44020)

(assert (=> b!1348908 (= e!767364 lt!596167)))

(assert (=> b!1348908 (= lt!596167 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348908 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596059) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348909 () Bool)

(declare-fun Unit!44026 () Unit!44020)

(assert (=> b!1348909 (= e!767364 Unit!44026)))

(declare-fun b!1348910 () Bool)

(assert (=> b!1348910 (= e!767365 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596059) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144465 c!126498) b!1348908))

(assert (= (and d!144465 (not c!126498)) b!1348909))

(assert (= (and d!144465 (not res!894951)) b!1348910))

(declare-fun m!1235545 () Bool)

(assert (=> d!144465 m!1235545))

(declare-fun m!1235547 () Bool)

(assert (=> b!1348908 m!1235547))

(declare-fun m!1235549 () Bool)

(assert (=> b!1348908 m!1235549))

(assert (=> b!1348908 m!1235549))

(declare-fun m!1235551 () Bool)

(assert (=> b!1348908 m!1235551))

(assert (=> b!1348910 m!1235549))

(assert (=> b!1348910 m!1235549))

(assert (=> b!1348910 m!1235551))

(assert (=> bm!65125 d!144465))

(assert (=> b!1348761 d!144417))

(declare-fun d!144467 () Bool)

(declare-fun res!894956 () Bool)

(declare-fun e!767370 () Bool)

(assert (=> d!144467 (=> res!894956 e!767370)))

(assert (=> d!144467 (= res!894956 (and ((_ is Cons!31523) (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12208 (h!32732 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(assert (=> d!144467 (= (containsKey!742 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767370)))

(declare-fun b!1348915 () Bool)

(declare-fun e!767371 () Bool)

(assert (=> b!1348915 (= e!767370 e!767371)))

(declare-fun res!894957 () Bool)

(assert (=> b!1348915 (=> (not res!894957) (not e!767371))))

(assert (=> b!1348915 (= res!894957 (and (or (not ((_ is Cons!31523) (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) (bvsle (_1!12208 (h!32732 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)) ((_ is Cons!31523) (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (bvslt (_1!12208 (h!32732 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun b!1348916 () Bool)

(assert (=> b!1348916 (= e!767371 (containsKey!742 (t!46159 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144467 (not res!894956)) b!1348915))

(assert (= (and b!1348915 res!894957) b!1348916))

(declare-fun m!1235553 () Bool)

(assert (=> b!1348916 m!1235553))

(assert (=> d!144399 d!144467))

(declare-fun d!144469 () Bool)

(declare-fun e!767373 () Bool)

(assert (=> d!144469 e!767373))

(declare-fun res!894958 () Bool)

(assert (=> d!144469 (=> res!894958 e!767373)))

(declare-fun lt!596169 () Bool)

(assert (=> d!144469 (= res!894958 (not lt!596169))))

(declare-fun lt!596168 () Bool)

(assert (=> d!144469 (= lt!596169 lt!596168)))

(declare-fun lt!596170 () Unit!44020)

(declare-fun e!767372 () Unit!44020)

(assert (=> d!144469 (= lt!596170 e!767372)))

(declare-fun c!126499 () Bool)

(assert (=> d!144469 (= c!126499 lt!596168)))

(assert (=> d!144469 (= lt!596168 (containsKey!742 (toList!11041 lt!596113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144469 (= (contains!9148 lt!596113 #b0000000000000000000000000000000000000000000000000000000000000000) lt!596169)))

(declare-fun b!1348917 () Bool)

(declare-fun lt!596171 () Unit!44020)

(assert (=> b!1348917 (= e!767372 lt!596171)))

(assert (=> b!1348917 (= lt!596171 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348917 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596113) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348918 () Bool)

(declare-fun Unit!44027 () Unit!44020)

(assert (=> b!1348918 (= e!767372 Unit!44027)))

(declare-fun b!1348919 () Bool)

(assert (=> b!1348919 (= e!767373 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596113) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144469 c!126499) b!1348917))

(assert (= (and d!144469 (not c!126499)) b!1348918))

(assert (= (and d!144469 (not res!894958)) b!1348919))

(declare-fun m!1235555 () Bool)

(assert (=> d!144469 m!1235555))

(declare-fun m!1235557 () Bool)

(assert (=> b!1348917 m!1235557))

(declare-fun m!1235559 () Bool)

(assert (=> b!1348917 m!1235559))

(assert (=> b!1348917 m!1235559))

(declare-fun m!1235561 () Bool)

(assert (=> b!1348917 m!1235561))

(assert (=> b!1348919 m!1235559))

(assert (=> b!1348919 m!1235559))

(assert (=> b!1348919 m!1235561))

(assert (=> d!144413 d!144469))

(assert (=> d!144413 d!144403))

(declare-fun d!144471 () Bool)

(declare-fun c!126500 () Bool)

(assert (=> d!144471 (= c!126500 ((_ is ValueCellFull!17888) (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun e!767374 () V!55201)

(assert (=> d!144471 (= (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) e!767374)))

(declare-fun b!1348920 () Bool)

(assert (=> b!1348920 (= e!767374 (get!22454 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1348921 () Bool)

(assert (=> b!1348921 (= e!767374 (get!22455 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144471 c!126500) b!1348920))

(assert (= (and d!144471 (not c!126500)) b!1348921))

(assert (=> b!1348920 m!1235357))

(assert (=> b!1348920 m!1235169))

(declare-fun m!1235563 () Bool)

(assert (=> b!1348920 m!1235563))

(assert (=> b!1348921 m!1235357))

(assert (=> b!1348921 m!1235169))

(declare-fun m!1235565 () Bool)

(assert (=> b!1348921 m!1235565))

(assert (=> b!1348815 d!144471))

(declare-fun d!144473 () Bool)

(assert (=> d!144473 (not (contains!9148 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111)) lt!596109))))

(declare-fun lt!596174 () Unit!44020)

(declare-fun choose!1990 (ListLongMap!22051 (_ BitVec 64) V!55201 (_ BitVec 64)) Unit!44020)

(assert (=> d!144473 (= lt!596174 (choose!1990 lt!596112 lt!596110 lt!596111 lt!596109))))

(declare-fun e!767377 () Bool)

(assert (=> d!144473 e!767377))

(declare-fun res!894961 () Bool)

(assert (=> d!144473 (=> (not res!894961) (not e!767377))))

(assert (=> d!144473 (= res!894961 (not (contains!9148 lt!596112 lt!596109)))))

(assert (=> d!144473 (= (addStillNotContains!491 lt!596112 lt!596110 lt!596111 lt!596109) lt!596174)))

(declare-fun b!1348925 () Bool)

(assert (=> b!1348925 (= e!767377 (not (= lt!596110 lt!596109)))))

(assert (= (and d!144473 res!894961) b!1348925))

(assert (=> d!144473 m!1235361))

(assert (=> d!144473 m!1235361))

(assert (=> d!144473 m!1235363))

(declare-fun m!1235567 () Bool)

(assert (=> d!144473 m!1235567))

(declare-fun m!1235569 () Bool)

(assert (=> d!144473 m!1235569))

(assert (=> b!1348815 d!144473))

(declare-fun d!144475 () Bool)

(declare-fun e!767378 () Bool)

(assert (=> d!144475 e!767378))

(declare-fun res!894962 () Bool)

(assert (=> d!144475 (=> (not res!894962) (not e!767378))))

(declare-fun lt!596178 () ListLongMap!22051)

(assert (=> d!144475 (= res!894962 (contains!9148 lt!596178 (_1!12208 (tuple2!24395 lt!596110 lt!596111))))))

(declare-fun lt!596175 () List!31527)

(assert (=> d!144475 (= lt!596178 (ListLongMap!22052 lt!596175))))

(declare-fun lt!596177 () Unit!44020)

(declare-fun lt!596176 () Unit!44020)

(assert (=> d!144475 (= lt!596177 lt!596176)))

(assert (=> d!144475 (= (getValueByKey!725 lt!596175 (_1!12208 (tuple2!24395 lt!596110 lt!596111))) (Some!775 (_2!12208 (tuple2!24395 lt!596110 lt!596111))))))

(assert (=> d!144475 (= lt!596176 (lemmaContainsTupThenGetReturnValue!368 lt!596175 (_1!12208 (tuple2!24395 lt!596110 lt!596111)) (_2!12208 (tuple2!24395 lt!596110 lt!596111))))))

(assert (=> d!144475 (= lt!596175 (insertStrictlySorted!497 (toList!11041 lt!596112) (_1!12208 (tuple2!24395 lt!596110 lt!596111)) (_2!12208 (tuple2!24395 lt!596110 lt!596111))))))

(assert (=> d!144475 (= (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111)) lt!596178)))

(declare-fun b!1348926 () Bool)

(declare-fun res!894963 () Bool)

(assert (=> b!1348926 (=> (not res!894963) (not e!767378))))

(assert (=> b!1348926 (= res!894963 (= (getValueByKey!725 (toList!11041 lt!596178) (_1!12208 (tuple2!24395 lt!596110 lt!596111))) (Some!775 (_2!12208 (tuple2!24395 lt!596110 lt!596111)))))))

(declare-fun b!1348927 () Bool)

(assert (=> b!1348927 (= e!767378 (contains!9151 (toList!11041 lt!596178) (tuple2!24395 lt!596110 lt!596111)))))

(assert (= (and d!144475 res!894962) b!1348926))

(assert (= (and b!1348926 res!894963) b!1348927))

(declare-fun m!1235571 () Bool)

(assert (=> d!144475 m!1235571))

(declare-fun m!1235573 () Bool)

(assert (=> d!144475 m!1235573))

(declare-fun m!1235575 () Bool)

(assert (=> d!144475 m!1235575))

(declare-fun m!1235577 () Bool)

(assert (=> d!144475 m!1235577))

(declare-fun m!1235579 () Bool)

(assert (=> b!1348926 m!1235579))

(declare-fun m!1235581 () Bool)

(assert (=> b!1348927 m!1235581))

(assert (=> b!1348815 d!144475))

(declare-fun d!144477 () Bool)

(declare-fun e!767380 () Bool)

(assert (=> d!144477 e!767380))

(declare-fun res!894964 () Bool)

(assert (=> d!144477 (=> res!894964 e!767380)))

(declare-fun lt!596180 () Bool)

(assert (=> d!144477 (= res!894964 (not lt!596180))))

(declare-fun lt!596179 () Bool)

(assert (=> d!144477 (= lt!596180 lt!596179)))

(declare-fun lt!596181 () Unit!44020)

(declare-fun e!767379 () Unit!44020)

(assert (=> d!144477 (= lt!596181 e!767379)))

(declare-fun c!126501 () Bool)

(assert (=> d!144477 (= c!126501 lt!596179)))

(assert (=> d!144477 (= lt!596179 (containsKey!742 (toList!11041 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111))) lt!596109))))

(assert (=> d!144477 (= (contains!9148 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111)) lt!596109) lt!596180)))

(declare-fun b!1348928 () Bool)

(declare-fun lt!596182 () Unit!44020)

(assert (=> b!1348928 (= e!767379 lt!596182)))

(assert (=> b!1348928 (= lt!596182 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111))) lt!596109))))

(assert (=> b!1348928 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111))) lt!596109))))

(declare-fun b!1348929 () Bool)

(declare-fun Unit!44028 () Unit!44020)

(assert (=> b!1348929 (= e!767379 Unit!44028)))

(declare-fun b!1348930 () Bool)

(assert (=> b!1348930 (= e!767380 (isDefined!532 (getValueByKey!725 (toList!11041 (+!4884 lt!596112 (tuple2!24395 lt!596110 lt!596111))) lt!596109)))))

(assert (= (and d!144477 c!126501) b!1348928))

(assert (= (and d!144477 (not c!126501)) b!1348929))

(assert (= (and d!144477 (not res!894964)) b!1348930))

(declare-fun m!1235583 () Bool)

(assert (=> d!144477 m!1235583))

(declare-fun m!1235585 () Bool)

(assert (=> b!1348928 m!1235585))

(declare-fun m!1235587 () Bool)

(assert (=> b!1348928 m!1235587))

(assert (=> b!1348928 m!1235587))

(declare-fun m!1235589 () Bool)

(assert (=> b!1348928 m!1235589))

(assert (=> b!1348930 m!1235587))

(assert (=> b!1348930 m!1235587))

(assert (=> b!1348930 m!1235589))

(assert (=> b!1348815 d!144477))

(declare-fun d!144479 () Bool)

(declare-fun e!767381 () Bool)

(assert (=> d!144479 e!767381))

(declare-fun res!894965 () Bool)

(assert (=> d!144479 (=> (not res!894965) (not e!767381))))

(declare-fun lt!596186 () ListLongMap!22051)

(assert (=> d!144479 (= res!894965 (contains!9148 lt!596186 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596183 () List!31527)

(assert (=> d!144479 (= lt!596186 (ListLongMap!22052 lt!596183))))

(declare-fun lt!596185 () Unit!44020)

(declare-fun lt!596184 () Unit!44020)

(assert (=> d!144479 (= lt!596185 lt!596184)))

(assert (=> d!144479 (= (getValueByKey!725 lt!596183 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!775 (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144479 (= lt!596184 (lemmaContainsTupThenGetReturnValue!368 lt!596183 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144479 (= lt!596183 (insertStrictlySorted!497 (toList!11041 call!65131) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144479 (= (+!4884 call!65131 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!596186)))

(declare-fun b!1348931 () Bool)

(declare-fun res!894966 () Bool)

(assert (=> b!1348931 (=> (not res!894966) (not e!767381))))

(assert (=> b!1348931 (= res!894966 (= (getValueByKey!725 (toList!11041 lt!596186) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!775 (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1348932 () Bool)

(assert (=> b!1348932 (= e!767381 (contains!9151 (toList!11041 lt!596186) (tuple2!24395 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)) (get!22453 (select (arr!44417 _values!1303) (bvadd #b00000000000000000000000000000001 from!1960)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!144479 res!894965) b!1348931))

(assert (= (and b!1348931 res!894966) b!1348932))

(declare-fun m!1235591 () Bool)

(assert (=> d!144479 m!1235591))

(declare-fun m!1235593 () Bool)

(assert (=> d!144479 m!1235593))

(declare-fun m!1235595 () Bool)

(assert (=> d!144479 m!1235595))

(declare-fun m!1235597 () Bool)

(assert (=> d!144479 m!1235597))

(declare-fun m!1235599 () Bool)

(assert (=> b!1348931 m!1235599))

(declare-fun m!1235601 () Bool)

(assert (=> b!1348932 m!1235601))

(assert (=> b!1348815 d!144479))

(declare-fun d!144481 () Bool)

(assert (=> d!144481 (= (apply!1032 lt!596113 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) (get!22456 (getValueByKey!725 (toList!11041 lt!596113) (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(declare-fun bs!38642 () Bool)

(assert (= bs!38642 d!144481))

(assert (=> bs!38642 m!1235355))

(declare-fun m!1235603 () Bool)

(assert (=> bs!38642 m!1235603))

(assert (=> bs!38642 m!1235603))

(declare-fun m!1235605 () Bool)

(assert (=> bs!38642 m!1235605))

(assert (=> b!1348817 d!144481))

(assert (=> b!1348817 d!144471))

(declare-fun d!144483 () Bool)

(assert (=> d!144483 (= (get!22455 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348832 d!144483))

(declare-fun d!144485 () Bool)

(assert (=> d!144485 (= (get!22454 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!21512 (select (arr!44417 _values!1303) from!1960)))))

(assert (=> b!1348831 d!144485))

(declare-fun d!144487 () Bool)

(declare-fun e!767383 () Bool)

(assert (=> d!144487 e!767383))

(declare-fun res!894967 () Bool)

(assert (=> d!144487 (=> res!894967 e!767383)))

(declare-fun lt!596188 () Bool)

(assert (=> d!144487 (= res!894967 (not lt!596188))))

(declare-fun lt!596187 () Bool)

(assert (=> d!144487 (= lt!596188 lt!596187)))

(declare-fun lt!596189 () Unit!44020)

(declare-fun e!767382 () Unit!44020)

(assert (=> d!144487 (= lt!596189 e!767382)))

(declare-fun c!126502 () Bool)

(assert (=> d!144487 (= c!126502 lt!596187)))

(assert (=> d!144487 (= lt!596187 (containsKey!742 (toList!11041 lt!596113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144487 (= (contains!9148 lt!596113 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596188)))

(declare-fun b!1348933 () Bool)

(declare-fun lt!596190 () Unit!44020)

(assert (=> b!1348933 (= e!767382 lt!596190)))

(assert (=> b!1348933 (= lt!596190 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348933 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596113) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348934 () Bool)

(declare-fun Unit!44029 () Unit!44020)

(assert (=> b!1348934 (= e!767382 Unit!44029)))

(declare-fun b!1348935 () Bool)

(assert (=> b!1348935 (= e!767383 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596113) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144487 c!126502) b!1348933))

(assert (= (and d!144487 (not c!126502)) b!1348934))

(assert (= (and d!144487 (not res!894967)) b!1348935))

(declare-fun m!1235607 () Bool)

(assert (=> d!144487 m!1235607))

(declare-fun m!1235609 () Bool)

(assert (=> b!1348933 m!1235609))

(declare-fun m!1235611 () Bool)

(assert (=> b!1348933 m!1235611))

(assert (=> b!1348933 m!1235611))

(declare-fun m!1235613 () Bool)

(assert (=> b!1348933 m!1235613))

(assert (=> b!1348935 m!1235611))

(assert (=> b!1348935 m!1235611))

(assert (=> b!1348935 m!1235613))

(assert (=> b!1348818 d!144487))

(declare-fun d!144489 () Bool)

(declare-fun e!767385 () Bool)

(assert (=> d!144489 e!767385))

(declare-fun res!894968 () Bool)

(assert (=> d!144489 (=> res!894968 e!767385)))

(declare-fun lt!596192 () Bool)

(assert (=> d!144489 (= res!894968 (not lt!596192))))

(declare-fun lt!596191 () Bool)

(assert (=> d!144489 (= lt!596192 lt!596191)))

(declare-fun lt!596193 () Unit!44020)

(declare-fun e!767384 () Unit!44020)

(assert (=> d!144489 (= lt!596193 e!767384)))

(declare-fun c!126503 () Bool)

(assert (=> d!144489 (= c!126503 lt!596191)))

(assert (=> d!144489 (= lt!596191 (containsKey!742 (toList!11041 lt!596059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!144489 (= (contains!9148 lt!596059 #b1000000000000000000000000000000000000000000000000000000000000000) lt!596192)))

(declare-fun b!1348936 () Bool)

(declare-fun lt!596194 () Unit!44020)

(assert (=> b!1348936 (= e!767384 lt!596194)))

(assert (=> b!1348936 (= lt!596194 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1348936 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596059) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1348937 () Bool)

(declare-fun Unit!44030 () Unit!44020)

(assert (=> b!1348937 (= e!767384 Unit!44030)))

(declare-fun b!1348938 () Bool)

(assert (=> b!1348938 (= e!767385 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!144489 c!126503) b!1348936))

(assert (= (and d!144489 (not c!126503)) b!1348937))

(assert (= (and d!144489 (not res!894968)) b!1348938))

(declare-fun m!1235615 () Bool)

(assert (=> d!144489 m!1235615))

(declare-fun m!1235617 () Bool)

(assert (=> b!1348936 m!1235617))

(declare-fun m!1235619 () Bool)

(assert (=> b!1348936 m!1235619))

(assert (=> b!1348936 m!1235619))

(declare-fun m!1235621 () Bool)

(assert (=> b!1348936 m!1235621))

(assert (=> b!1348938 m!1235619))

(assert (=> b!1348938 m!1235619))

(assert (=> b!1348938 m!1235621))

(assert (=> bm!65122 d!144489))

(declare-fun d!144491 () Bool)

(declare-fun isEmpty!1103 (List!31527) Bool)

(assert (=> d!144491 (= (isEmpty!1101 lt!596113) (isEmpty!1103 (toList!11041 lt!596113)))))

(declare-fun bs!38643 () Bool)

(assert (= bs!38643 d!144491))

(declare-fun m!1235623 () Bool)

(assert (=> bs!38643 m!1235623))

(assert (=> b!1348819 d!144491))

(declare-fun d!144493 () Bool)

(assert (=> d!144493 (= (isDefined!532 (getValueByKey!725 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142)) (not (isEmpty!1102 (getValueByKey!725 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))))

(declare-fun bs!38644 () Bool)

(assert (= bs!38644 d!144493))

(assert (=> bs!38644 m!1235279))

(declare-fun m!1235625 () Bool)

(assert (=> bs!38644 m!1235625))

(assert (=> b!1348718 d!144493))

(declare-fun b!1348942 () Bool)

(declare-fun e!767387 () Option!776)

(assert (=> b!1348942 (= e!767387 None!774)))

(declare-fun c!126504 () Bool)

(declare-fun d!144495 () Bool)

(assert (=> d!144495 (= c!126504 (and ((_ is Cons!31523) (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (= (_1!12208 (h!32732 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142)))))

(declare-fun e!767386 () Option!776)

(assert (=> d!144495 (= (getValueByKey!725 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) e!767386)))

(declare-fun b!1348940 () Bool)

(assert (=> b!1348940 (= e!767386 e!767387)))

(declare-fun c!126505 () Bool)

(assert (=> b!1348940 (= c!126505 (and ((_ is Cons!31523) (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) (not (= (_1!12208 (h!32732 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)))) k0!1142))))))

(declare-fun b!1348939 () Bool)

(assert (=> b!1348939 (= e!767386 (Some!775 (_2!12208 (h!32732 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))))

(declare-fun b!1348941 () Bool)

(assert (=> b!1348941 (= e!767387 (getValueByKey!725 (t!46159 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))) k0!1142))))

(assert (= (and d!144495 c!126504) b!1348939))

(assert (= (and d!144495 (not c!126504)) b!1348940))

(assert (= (and b!1348940 c!126505) b!1348941))

(assert (= (and b!1348940 (not c!126505)) b!1348942))

(declare-fun m!1235627 () Bool)

(assert (=> b!1348941 m!1235627))

(assert (=> b!1348718 d!144495))

(declare-fun d!144497 () Bool)

(assert (=> d!144497 (= (validKeyInArray!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)) (and (not (= (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1348694 d!144497))

(declare-fun d!144499 () Bool)

(declare-fun lt!596197 () Bool)

(declare-fun content!664 (List!31528) (InoxSet (_ BitVec 64)))

(assert (=> d!144499 (= lt!596197 (select (content!664 Nil!31525) (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun e!767392 () Bool)

(assert (=> d!144499 (= lt!596197 e!767392)))

(declare-fun res!894973 () Bool)

(assert (=> d!144499 (=> (not res!894973) (not e!767392))))

(assert (=> d!144499 (= res!894973 ((_ is Cons!31524) Nil!31525))))

(assert (=> d!144499 (= (contains!9150 Nil!31525 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)) lt!596197)))

(declare-fun b!1348947 () Bool)

(declare-fun e!767393 () Bool)

(assert (=> b!1348947 (= e!767392 e!767393)))

(declare-fun res!894974 () Bool)

(assert (=> b!1348947 (=> res!894974 e!767393)))

(assert (=> b!1348947 (= res!894974 (= (h!32733 Nil!31525) (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1348948 () Bool)

(assert (=> b!1348948 (= e!767393 (contains!9150 (t!46160 Nil!31525) (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(assert (= (and d!144499 res!894973) b!1348947))

(assert (= (and b!1348947 (not res!894974)) b!1348948))

(declare-fun m!1235629 () Bool)

(assert (=> d!144499 m!1235629))

(assert (=> d!144499 m!1235259))

(declare-fun m!1235631 () Bool)

(assert (=> d!144499 m!1235631))

(assert (=> b!1348948 m!1235259))

(declare-fun m!1235633 () Bool)

(assert (=> b!1348948 m!1235633))

(assert (=> b!1348709 d!144499))

(declare-fun d!144501 () Bool)

(declare-fun e!767394 () Bool)

(assert (=> d!144501 e!767394))

(declare-fun res!894975 () Bool)

(assert (=> d!144501 (=> (not res!894975) (not e!767394))))

(declare-fun lt!596201 () ListLongMap!22051)

(assert (=> d!144501 (= res!894975 (contains!9148 lt!596201 (_1!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun lt!596198 () List!31527)

(assert (=> d!144501 (= lt!596201 (ListLongMap!22052 lt!596198))))

(declare-fun lt!596200 () Unit!44020)

(declare-fun lt!596199 () Unit!44020)

(assert (=> d!144501 (= lt!596200 lt!596199)))

(assert (=> d!144501 (= (getValueByKey!725 lt!596198 (_1!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!775 (_2!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144501 (= lt!596199 (lemmaContainsTupThenGetReturnValue!368 lt!596198 (_1!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144501 (= lt!596198 (insertStrictlySorted!497 (toList!11041 (ite c!126460 call!65127 (ite c!126459 call!65126 call!65128))) (_1!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (_2!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(assert (=> d!144501 (= (+!4884 (ite c!126460 call!65127 (ite c!126459 call!65126 call!65128)) (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) lt!596201)))

(declare-fun b!1348949 () Bool)

(declare-fun res!894976 () Bool)

(assert (=> b!1348949 (=> (not res!894976) (not e!767394))))

(assert (=> b!1348949 (= res!894976 (= (getValueByKey!725 (toList!11041 lt!596201) (_1!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))) (Some!775 (_2!12208 (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))))

(declare-fun b!1348950 () Bool)

(assert (=> b!1348950 (= e!767394 (contains!9151 (toList!11041 lt!596201) (ite (or c!126460 c!126459) (tuple2!24395 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (= (and d!144501 res!894975) b!1348949))

(assert (= (and b!1348949 res!894976) b!1348950))

(declare-fun m!1235635 () Bool)

(assert (=> d!144501 m!1235635))

(declare-fun m!1235637 () Bool)

(assert (=> d!144501 m!1235637))

(declare-fun m!1235639 () Bool)

(assert (=> d!144501 m!1235639))

(declare-fun m!1235641 () Bool)

(assert (=> d!144501 m!1235641))

(declare-fun m!1235643 () Bool)

(assert (=> b!1348949 m!1235643))

(declare-fun m!1235645 () Bool)

(assert (=> b!1348950 m!1235645))

(assert (=> bm!65120 d!144501))

(declare-fun d!144503 () Bool)

(declare-fun res!894977 () Bool)

(declare-fun e!767395 () Bool)

(assert (=> d!144503 (=> res!894977 e!767395)))

(assert (=> d!144503 (= res!894977 (and ((_ is Cons!31523) (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!12208 (h!32732 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(assert (=> d!144503 (= (containsKey!742 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) k0!1142) e!767395)))

(declare-fun b!1348951 () Bool)

(declare-fun e!767396 () Bool)

(assert (=> b!1348951 (= e!767395 e!767396)))

(declare-fun res!894978 () Bool)

(assert (=> b!1348951 (=> (not res!894978) (not e!767396))))

(assert (=> b!1348951 (= res!894978 (and (or (not ((_ is Cons!31523) (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (bvsle (_1!12208 (h!32732 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)) ((_ is Cons!31523) (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!12208 (h!32732 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))) k0!1142)))))

(declare-fun b!1348952 () Bool)

(assert (=> b!1348952 (= e!767396 (containsKey!742 (t!46159 (toList!11041 (+!4884 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))) k0!1142))))

(assert (= (and d!144503 (not res!894977)) b!1348951))

(assert (= (and b!1348951 res!894978) b!1348952))

(declare-fun m!1235647 () Bool)

(assert (=> b!1348952 m!1235647))

(assert (=> d!144409 d!144503))

(declare-fun d!144505 () Bool)

(declare-fun e!767397 () Bool)

(assert (=> d!144505 e!767397))

(declare-fun res!894979 () Bool)

(assert (=> d!144505 (=> (not res!894979) (not e!767397))))

(declare-fun lt!596205 () ListLongMap!22051)

(assert (=> d!144505 (= res!894979 (contains!9148 lt!596205 (_1!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(declare-fun lt!596202 () List!31527)

(assert (=> d!144505 (= lt!596205 (ListLongMap!22052 lt!596202))))

(declare-fun lt!596204 () Unit!44020)

(declare-fun lt!596203 () Unit!44020)

(assert (=> d!144505 (= lt!596204 lt!596203)))

(assert (=> d!144505 (= (getValueByKey!725 lt!596202 (_1!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!775 (_2!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144505 (= lt!596203 (lemmaContainsTupThenGetReturnValue!368 lt!596202 (_1!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144505 (= lt!596202 (insertStrictlySorted!497 (toList!11041 call!65124) (_1!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) (_2!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))))))

(assert (=> d!144505 (= (+!4884 call!65124 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)) lt!596205)))

(declare-fun b!1348953 () Bool)

(declare-fun res!894980 () Bool)

(assert (=> b!1348953 (=> (not res!894980) (not e!767397))))

(assert (=> b!1348953 (= res!894980 (= (getValueByKey!725 (toList!11041 lt!596205) (_1!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245))) (Some!775 (_2!12208 (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))))

(declare-fun b!1348954 () Bool)

(assert (=> b!1348954 (= e!767397 (contains!9151 (toList!11041 lt!596205) (tuple2!24395 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1245)))))

(assert (= (and d!144505 res!894979) b!1348953))

(assert (= (and b!1348953 res!894980) b!1348954))

(declare-fun m!1235649 () Bool)

(assert (=> d!144505 m!1235649))

(declare-fun m!1235651 () Bool)

(assert (=> d!144505 m!1235651))

(declare-fun m!1235653 () Bool)

(assert (=> d!144505 m!1235653))

(declare-fun m!1235655 () Bool)

(assert (=> d!144505 m!1235655))

(declare-fun m!1235657 () Bool)

(assert (=> b!1348953 m!1235657))

(declare-fun m!1235659 () Bool)

(assert (=> b!1348954 m!1235659))

(assert (=> b!1348770 d!144505))

(assert (=> b!1348769 d!144417))

(declare-fun d!144507 () Bool)

(declare-fun e!767399 () Bool)

(assert (=> d!144507 e!767399))

(declare-fun res!894981 () Bool)

(assert (=> d!144507 (=> res!894981 e!767399)))

(declare-fun lt!596207 () Bool)

(assert (=> d!144507 (= res!894981 (not lt!596207))))

(declare-fun lt!596206 () Bool)

(assert (=> d!144507 (= lt!596207 lt!596206)))

(declare-fun lt!596208 () Unit!44020)

(declare-fun e!767398 () Unit!44020)

(assert (=> d!144507 (= lt!596208 e!767398)))

(declare-fun c!126506 () Bool)

(assert (=> d!144507 (= c!126506 lt!596206)))

(assert (=> d!144507 (= lt!596206 (containsKey!742 (toList!11041 lt!596094) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144507 (= (contains!9148 lt!596094 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596207)))

(declare-fun b!1348955 () Bool)

(declare-fun lt!596209 () Unit!44020)

(assert (=> b!1348955 (= e!767398 lt!596209)))

(assert (=> b!1348955 (= lt!596209 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596094) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1348955 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596094) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348956 () Bool)

(declare-fun Unit!44031 () Unit!44020)

(assert (=> b!1348956 (= e!767398 Unit!44031)))

(declare-fun b!1348957 () Bool)

(assert (=> b!1348957 (= e!767399 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596094) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144507 c!126506) b!1348955))

(assert (= (and d!144507 (not c!126506)) b!1348956))

(assert (= (and d!144507 (not res!894981)) b!1348957))

(declare-fun m!1235661 () Bool)

(assert (=> d!144507 m!1235661))

(declare-fun m!1235663 () Bool)

(assert (=> b!1348955 m!1235663))

(assert (=> b!1348955 m!1235347))

(assert (=> b!1348955 m!1235347))

(declare-fun m!1235665 () Bool)

(assert (=> b!1348955 m!1235665))

(assert (=> b!1348957 m!1235347))

(assert (=> b!1348957 m!1235347))

(assert (=> b!1348957 m!1235665))

(assert (=> d!144411 d!144507))

(declare-fun b!1348961 () Bool)

(declare-fun e!767401 () Option!776)

(assert (=> b!1348961 (= e!767401 None!774)))

(declare-fun d!144509 () Bool)

(declare-fun c!126507 () Bool)

(assert (=> d!144509 (= c!126507 (and ((_ is Cons!31523) lt!596091) (= (_1!12208 (h!32732 lt!596091)) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!767400 () Option!776)

(assert (=> d!144509 (= (getValueByKey!725 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!767400)))

(declare-fun b!1348959 () Bool)

(assert (=> b!1348959 (= e!767400 e!767401)))

(declare-fun c!126508 () Bool)

(assert (=> b!1348959 (= c!126508 (and ((_ is Cons!31523) lt!596091) (not (= (_1!12208 (h!32732 lt!596091)) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1348958 () Bool)

(assert (=> b!1348958 (= e!767400 (Some!775 (_2!12208 (h!32732 lt!596091))))))

(declare-fun b!1348960 () Bool)

(assert (=> b!1348960 (= e!767401 (getValueByKey!725 (t!46159 lt!596091) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!144509 c!126507) b!1348958))

(assert (= (and d!144509 (not c!126507)) b!1348959))

(assert (= (and b!1348959 c!126508) b!1348960))

(assert (= (and b!1348959 (not c!126508)) b!1348961))

(declare-fun m!1235667 () Bool)

(assert (=> b!1348960 m!1235667))

(assert (=> d!144411 d!144509))

(declare-fun d!144511 () Bool)

(assert (=> d!144511 (= (getValueByKey!725 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!775 (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!596212 () Unit!44020)

(declare-fun choose!1991 (List!31527 (_ BitVec 64) V!55201) Unit!44020)

(assert (=> d!144511 (= lt!596212 (choose!1991 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!767404 () Bool)

(assert (=> d!144511 e!767404))

(declare-fun res!894986 () Bool)

(assert (=> d!144511 (=> (not res!894986) (not e!767404))))

(assert (=> d!144511 (= res!894986 (isStrictlySorted!879 lt!596091))))

(assert (=> d!144511 (= (lemmaContainsTupThenGetReturnValue!368 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596212)))

(declare-fun b!1348966 () Bool)

(declare-fun res!894987 () Bool)

(assert (=> b!1348966 (=> (not res!894987) (not e!767404))))

(assert (=> b!1348966 (= res!894987 (containsKey!742 lt!596091 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348967 () Bool)

(assert (=> b!1348967 (= e!767404 (contains!9151 lt!596091 (tuple2!24395 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!144511 res!894986) b!1348966))

(assert (= (and b!1348966 res!894987) b!1348967))

(assert (=> d!144511 m!1235341))

(declare-fun m!1235669 () Bool)

(assert (=> d!144511 m!1235669))

(declare-fun m!1235671 () Bool)

(assert (=> d!144511 m!1235671))

(declare-fun m!1235673 () Bool)

(assert (=> b!1348966 m!1235673))

(declare-fun m!1235675 () Bool)

(assert (=> b!1348967 m!1235675))

(assert (=> d!144411 d!144511))

(declare-fun b!1348988 () Bool)

(declare-fun lt!596215 () List!31527)

(declare-fun e!767418 () Bool)

(assert (=> b!1348988 (= e!767418 (contains!9151 lt!596215 (tuple2!24395 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!144513 () Bool)

(assert (=> d!144513 e!767418))

(declare-fun res!894993 () Bool)

(assert (=> d!144513 (=> (not res!894993) (not e!767418))))

(assert (=> d!144513 (= res!894993 (isStrictlySorted!879 lt!596215))))

(declare-fun e!767419 () List!31527)

(assert (=> d!144513 (= lt!596215 e!767419)))

(declare-fun c!126518 () Bool)

(assert (=> d!144513 (= c!126518 (and ((_ is Cons!31523) (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvslt (_1!12208 (h!32732 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!144513 (isStrictlySorted!879 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))))

(assert (=> d!144513 (= (insertStrictlySorted!497 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!596215)))

(declare-fun b!1348989 () Bool)

(declare-fun c!126520 () Bool)

(assert (=> b!1348989 (= c!126520 (and ((_ is Cons!31523) (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (bvsgt (_1!12208 (h!32732 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!767417 () List!31527)

(declare-fun e!767415 () List!31527)

(assert (=> b!1348989 (= e!767417 e!767415)))

(declare-fun b!1348990 () Bool)

(assert (=> b!1348990 (= e!767419 e!767417)))

(declare-fun c!126517 () Bool)

(assert (=> b!1348990 (= c!126517 (and ((_ is Cons!31523) (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (= (_1!12208 (h!32732 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun bm!65137 () Bool)

(declare-fun call!65140 () List!31527)

(declare-fun call!65141 () List!31527)

(assert (=> bm!65137 (= call!65140 call!65141)))

(declare-fun b!1348991 () Bool)

(declare-fun e!767416 () List!31527)

(assert (=> b!1348991 (= e!767416 (insertStrictlySorted!497 (t!46159 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun bm!65138 () Bool)

(declare-fun call!65142 () List!31527)

(assert (=> bm!65138 (= call!65142 call!65140)))

(declare-fun b!1348992 () Bool)

(assert (=> b!1348992 (= e!767419 call!65141)))

(declare-fun bm!65139 () Bool)

(declare-fun $colon$colon!675 (List!31527 tuple2!24394) List!31527)

(assert (=> bm!65139 (= call!65141 ($colon$colon!675 e!767416 (ite c!126518 (h!32732 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (tuple2!24395 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126519 () Bool)

(assert (=> bm!65139 (= c!126519 c!126518)))

(declare-fun b!1348993 () Bool)

(assert (=> b!1348993 (= e!767415 call!65142)))

(declare-fun b!1348994 () Bool)

(assert (=> b!1348994 (= e!767415 call!65142)))

(declare-fun b!1348995 () Bool)

(assert (=> b!1348995 (= e!767416 (ite c!126517 (t!46159 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (ite c!126520 (Cons!31523 (h!32732 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))) (t!46159 (toList!11041 (getCurrentListMapNoExtraKeys!6532 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306)))) Nil!31524)))))

(declare-fun b!1348996 () Bool)

(declare-fun res!894992 () Bool)

(assert (=> b!1348996 (=> (not res!894992) (not e!767418))))

(assert (=> b!1348996 (= res!894992 (containsKey!742 lt!596215 (_1!12208 (tuple2!24395 (select (arr!44418 _keys!1571) from!1960) (get!22453 (select (arr!44417 _values!1303) from!1960) (dynLambda!3814 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1348997 () Bool)

(assert (=> b!1348997 (= e!767417 call!65140)))

(assert (= (and d!144513 c!126518) b!1348992))

(assert (= (and d!144513 (not c!126518)) b!1348990))

(assert (= (and b!1348990 c!126517) b!1348997))

(assert (= (and b!1348990 (not c!126517)) b!1348989))

(assert (= (and b!1348989 c!126520) b!1348993))

(assert (= (and b!1348989 (not c!126520)) b!1348994))

(assert (= (or b!1348993 b!1348994) bm!65138))

(assert (= (or b!1348997 bm!65138) bm!65137))

(assert (= (or b!1348992 bm!65137) bm!65139))

(assert (= (and bm!65139 c!126519) b!1348991))

(assert (= (and bm!65139 (not c!126519)) b!1348995))

(assert (= (and d!144513 res!894993) b!1348996))

(assert (= (and b!1348996 res!894992) b!1348988))

(declare-fun m!1235677 () Bool)

(assert (=> b!1348991 m!1235677))

(declare-fun m!1235679 () Bool)

(assert (=> d!144513 m!1235679))

(declare-fun m!1235681 () Bool)

(assert (=> d!144513 m!1235681))

(declare-fun m!1235683 () Bool)

(assert (=> bm!65139 m!1235683))

(declare-fun m!1235685 () Bool)

(assert (=> b!1348988 m!1235685))

(declare-fun m!1235687 () Bool)

(assert (=> b!1348996 m!1235687))

(assert (=> d!144411 d!144513))

(declare-fun d!144515 () Bool)

(declare-fun e!767421 () Bool)

(assert (=> d!144515 e!767421))

(declare-fun res!894994 () Bool)

(assert (=> d!144515 (=> res!894994 e!767421)))

(declare-fun lt!596217 () Bool)

(assert (=> d!144515 (= res!894994 (not lt!596217))))

(declare-fun lt!596216 () Bool)

(assert (=> d!144515 (= lt!596217 lt!596216)))

(declare-fun lt!596218 () Unit!44020)

(declare-fun e!767420 () Unit!44020)

(assert (=> d!144515 (= lt!596218 e!767420)))

(declare-fun c!126521 () Bool)

(assert (=> d!144515 (= c!126521 lt!596216)))

(assert (=> d!144515 (= lt!596216 (containsKey!742 (toList!11041 lt!596113) (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> d!144515 (= (contains!9148 lt!596113 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))) lt!596217)))

(declare-fun b!1348998 () Bool)

(declare-fun lt!596219 () Unit!44020)

(assert (=> b!1348998 (= e!767420 lt!596219)))

(assert (=> b!1348998 (= lt!596219 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596113) (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(assert (=> b!1348998 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596113) (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960))))))

(declare-fun b!1348999 () Bool)

(declare-fun Unit!44032 () Unit!44020)

(assert (=> b!1348999 (= e!767420 Unit!44032)))

(declare-fun b!1349000 () Bool)

(assert (=> b!1349000 (= e!767421 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596113) (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000001 from!1960)))))))

(assert (= (and d!144515 c!126521) b!1348998))

(assert (= (and d!144515 (not c!126521)) b!1348999))

(assert (= (and d!144515 (not res!894994)) b!1349000))

(assert (=> d!144515 m!1235355))

(declare-fun m!1235689 () Bool)

(assert (=> d!144515 m!1235689))

(assert (=> b!1348998 m!1235355))

(declare-fun m!1235691 () Bool)

(assert (=> b!1348998 m!1235691))

(assert (=> b!1348998 m!1235355))

(assert (=> b!1348998 m!1235603))

(assert (=> b!1348998 m!1235603))

(declare-fun m!1235693 () Bool)

(assert (=> b!1348998 m!1235693))

(assert (=> b!1349000 m!1235355))

(assert (=> b!1349000 m!1235603))

(assert (=> b!1349000 m!1235603))

(assert (=> b!1349000 m!1235693))

(assert (=> b!1348825 d!144515))

(assert (=> b!1348706 d!144497))

(declare-fun d!144517 () Bool)

(assert (=> d!144517 (= (apply!1032 lt!596059 #b1000000000000000000000000000000000000000000000000000000000000000) (get!22456 (getValueByKey!725 (toList!11041 lt!596059) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38645 () Bool)

(assert (= bs!38645 d!144517))

(assert (=> bs!38645 m!1235619))

(assert (=> bs!38645 m!1235619))

(declare-fun m!1235695 () Bool)

(assert (=> bs!38645 m!1235695))

(assert (=> b!1348779 d!144517))

(assert (=> b!1348826 d!144455))

(declare-fun d!144519 () Bool)

(assert (=> d!144519 (arrayContainsKey!0 _keys!1571 lt!595998 #b00000000000000000000000000000000)))

(declare-fun lt!596222 () Unit!44020)

(declare-fun choose!13 (array!91927 (_ BitVec 64) (_ BitVec 32)) Unit!44020)

(assert (=> d!144519 (= lt!596222 (choose!13 _keys!1571 lt!595998 #b00000000000000000000000000000000))))

(assert (=> d!144519 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!144519 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!595998 #b00000000000000000000000000000000) lt!596222)))

(declare-fun bs!38646 () Bool)

(assert (= bs!38646 d!144519))

(assert (=> bs!38646 m!1235263))

(declare-fun m!1235697 () Bool)

(assert (=> bs!38646 m!1235697))

(assert (=> b!1348693 d!144519))

(declare-fun d!144521 () Bool)

(declare-fun res!894999 () Bool)

(declare-fun e!767426 () Bool)

(assert (=> d!144521 (=> res!894999 e!767426)))

(assert (=> d!144521 (= res!894999 (= (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) lt!595998))))

(assert (=> d!144521 (= (arrayContainsKey!0 _keys!1571 lt!595998 #b00000000000000000000000000000000) e!767426)))

(declare-fun b!1349005 () Bool)

(declare-fun e!767427 () Bool)

(assert (=> b!1349005 (= e!767426 e!767427)))

(declare-fun res!895000 () Bool)

(assert (=> b!1349005 (=> (not res!895000) (not e!767427))))

(assert (=> b!1349005 (= res!895000 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(declare-fun b!1349006 () Bool)

(assert (=> b!1349006 (= e!767427 (arrayContainsKey!0 _keys!1571 lt!595998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!144521 (not res!894999)) b!1349005))

(assert (= (and b!1349005 res!895000) b!1349006))

(assert (=> d!144521 m!1235259))

(declare-fun m!1235699 () Bool)

(assert (=> b!1349006 m!1235699))

(assert (=> b!1348693 d!144521))

(declare-fun b!1349019 () Bool)

(declare-fun c!126529 () Bool)

(declare-fun lt!596229 () (_ BitVec 64))

(assert (=> b!1349019 (= c!126529 (= lt!596229 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!767434 () SeekEntryResult!10057)

(declare-fun e!767435 () SeekEntryResult!10057)

(assert (=> b!1349019 (= e!767434 e!767435)))

(declare-fun b!1349020 () Bool)

(declare-fun e!767436 () SeekEntryResult!10057)

(assert (=> b!1349020 (= e!767436 Undefined!10057)))

(declare-fun b!1349021 () Bool)

(declare-fun lt!596230 () SeekEntryResult!10057)

(assert (=> b!1349021 (= e!767434 (Found!10057 (index!42601 lt!596230)))))

(declare-fun b!1349022 () Bool)

(assert (=> b!1349022 (= e!767436 e!767434)))

(assert (=> b!1349022 (= lt!596229 (select (arr!44418 _keys!1571) (index!42601 lt!596230)))))

(declare-fun c!126530 () Bool)

(assert (=> b!1349022 (= c!126530 (= lt!596229 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun b!1349023 () Bool)

(assert (=> b!1349023 (= e!767435 (MissingZero!10057 (index!42601 lt!596230)))))

(declare-fun d!144523 () Bool)

(declare-fun lt!596231 () SeekEntryResult!10057)

(assert (=> d!144523 (and (or ((_ is Undefined!10057) lt!596231) (not ((_ is Found!10057) lt!596231)) (and (bvsge (index!42600 lt!596231) #b00000000000000000000000000000000) (bvslt (index!42600 lt!596231) (size!44970 _keys!1571)))) (or ((_ is Undefined!10057) lt!596231) ((_ is Found!10057) lt!596231) (not ((_ is MissingZero!10057) lt!596231)) (and (bvsge (index!42599 lt!596231) #b00000000000000000000000000000000) (bvslt (index!42599 lt!596231) (size!44970 _keys!1571)))) (or ((_ is Undefined!10057) lt!596231) ((_ is Found!10057) lt!596231) ((_ is MissingZero!10057) lt!596231) (not ((_ is MissingVacant!10057) lt!596231)) (and (bvsge (index!42602 lt!596231) #b00000000000000000000000000000000) (bvslt (index!42602 lt!596231) (size!44970 _keys!1571)))) (or ((_ is Undefined!10057) lt!596231) (ite ((_ is Found!10057) lt!596231) (= (select (arr!44418 _keys!1571) (index!42600 lt!596231)) (select (arr!44418 _keys!1571) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10057) lt!596231) (= (select (arr!44418 _keys!1571) (index!42599 lt!596231)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10057) lt!596231) (= (select (arr!44418 _keys!1571) (index!42602 lt!596231)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!144523 (= lt!596231 e!767436)))

(declare-fun c!126528 () Bool)

(assert (=> d!144523 (= c!126528 (and ((_ is Intermediate!10057) lt!596230) (undefined!10869 lt!596230)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91927 (_ BitVec 32)) SeekEntryResult!10057)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!144523 (= lt!596230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) mask!1977) (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (=> d!144523 (validMask!0 mask!1977)))

(assert (=> d!144523 (= (seekEntryOrOpen!0 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) lt!596231)))

(declare-fun b!1349024 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!91927 (_ BitVec 32)) SeekEntryResult!10057)

(assert (=> b!1349024 (= e!767435 (seekKeyOrZeroReturnVacant!0 (x!120712 lt!596230) (index!42601 lt!596230) (index!42601 lt!596230) (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977))))

(assert (= (and d!144523 c!126528) b!1349020))

(assert (= (and d!144523 (not c!126528)) b!1349022))

(assert (= (and b!1349022 c!126530) b!1349021))

(assert (= (and b!1349022 (not c!126530)) b!1349019))

(assert (= (and b!1349019 c!126529) b!1349023))

(assert (= (and b!1349019 (not c!126529)) b!1349024))

(declare-fun m!1235701 () Bool)

(assert (=> b!1349022 m!1235701))

(declare-fun m!1235703 () Bool)

(assert (=> d!144523 m!1235703))

(declare-fun m!1235705 () Bool)

(assert (=> d!144523 m!1235705))

(declare-fun m!1235707 () Bool)

(assert (=> d!144523 m!1235707))

(assert (=> d!144523 m!1235185))

(declare-fun m!1235709 () Bool)

(assert (=> d!144523 m!1235709))

(assert (=> d!144523 m!1235259))

(declare-fun m!1235711 () Bool)

(assert (=> d!144523 m!1235711))

(assert (=> d!144523 m!1235259))

(assert (=> d!144523 m!1235709))

(assert (=> b!1349024 m!1235259))

(declare-fun m!1235713 () Bool)

(assert (=> b!1349024 m!1235713))

(assert (=> b!1348693 d!144523))

(declare-fun d!144525 () Bool)

(declare-fun res!895003 () Bool)

(declare-fun e!767440 () Bool)

(assert (=> d!144525 (=> res!895003 e!767440)))

(assert (=> d!144525 (= res!895003 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(assert (=> d!144525 (= (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126443 (Cons!31524 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525)) e!767440)))

(declare-fun b!1349025 () Bool)

(declare-fun e!767439 () Bool)

(declare-fun call!65143 () Bool)

(assert (=> b!1349025 (= e!767439 call!65143)))

(declare-fun b!1349026 () Bool)

(declare-fun e!767438 () Bool)

(assert (=> b!1349026 (= e!767440 e!767438)))

(declare-fun res!895001 () Bool)

(assert (=> b!1349026 (=> (not res!895001) (not e!767438))))

(declare-fun e!767437 () Bool)

(assert (=> b!1349026 (= res!895001 (not e!767437))))

(declare-fun res!895002 () Bool)

(assert (=> b!1349026 (=> (not res!895002) (not e!767437))))

(assert (=> b!1349026 (= res!895002 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349027 () Bool)

(assert (=> b!1349027 (= e!767439 call!65143)))

(declare-fun c!126531 () Bool)

(declare-fun bm!65140 () Bool)

(assert (=> bm!65140 (= call!65143 (arrayNoDuplicates!0 _keys!1571 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126531 (Cons!31524 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126443 (Cons!31524 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525)) (ite c!126443 (Cons!31524 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525))))))

(declare-fun b!1349028 () Bool)

(assert (=> b!1349028 (= e!767438 e!767439)))

(assert (=> b!1349028 (= c!126531 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1349029 () Bool)

(assert (=> b!1349029 (= e!767437 (contains!9150 (ite c!126443 (Cons!31524 (select (arr!44418 _keys!1571) #b00000000000000000000000000000000) Nil!31525) Nil!31525) (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144525 (not res!895003)) b!1349026))

(assert (= (and b!1349026 res!895002) b!1349029))

(assert (= (and b!1349026 res!895001) b!1349028))

(assert (= (and b!1349028 c!126531) b!1349027))

(assert (= (and b!1349028 (not c!126531)) b!1349025))

(assert (= (or b!1349027 b!1349025) bm!65140))

(declare-fun m!1235715 () Bool)

(assert (=> b!1349026 m!1235715))

(assert (=> b!1349026 m!1235715))

(declare-fun m!1235717 () Bool)

(assert (=> b!1349026 m!1235717))

(assert (=> bm!65140 m!1235715))

(declare-fun m!1235719 () Bool)

(assert (=> bm!65140 m!1235719))

(assert (=> b!1349028 m!1235715))

(assert (=> b!1349028 m!1235715))

(assert (=> b!1349028 m!1235717))

(assert (=> b!1349029 m!1235715))

(assert (=> b!1349029 m!1235715))

(declare-fun m!1235721 () Bool)

(assert (=> b!1349029 m!1235721))

(assert (=> bm!65104 d!144525))

(declare-fun d!144527 () Bool)

(assert (=> d!144527 (= (apply!1032 lt!596059 #b0000000000000000000000000000000000000000000000000000000000000000) (get!22456 (getValueByKey!725 (toList!11041 lt!596059) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!38647 () Bool)

(assert (= bs!38647 d!144527))

(assert (=> bs!38647 m!1235549))

(assert (=> bs!38647 m!1235549))

(declare-fun m!1235723 () Bool)

(assert (=> bs!38647 m!1235723))

(assert (=> b!1348781 d!144527))

(declare-fun d!144529 () Bool)

(declare-fun e!767442 () Bool)

(assert (=> d!144529 e!767442))

(declare-fun res!895004 () Bool)

(assert (=> d!144529 (=> res!895004 e!767442)))

(declare-fun lt!596233 () Bool)

(assert (=> d!144529 (= res!895004 (not lt!596233))))

(declare-fun lt!596232 () Bool)

(assert (=> d!144529 (= lt!596233 lt!596232)))

(declare-fun lt!596234 () Unit!44020)

(declare-fun e!767441 () Unit!44020)

(assert (=> d!144529 (= lt!596234 e!767441)))

(declare-fun c!126532 () Bool)

(assert (=> d!144529 (= c!126532 lt!596232)))

(assert (=> d!144529 (= lt!596232 (containsKey!742 (toList!11041 lt!596059) (select (arr!44418 _keys!1571) from!1960)))))

(assert (=> d!144529 (= (contains!9148 lt!596059 (select (arr!44418 _keys!1571) from!1960)) lt!596233)))

(declare-fun b!1349030 () Bool)

(declare-fun lt!596235 () Unit!44020)

(assert (=> b!1349030 (= e!767441 lt!596235)))

(assert (=> b!1349030 (= lt!596235 (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 lt!596059) (select (arr!44418 _keys!1571) from!1960)))))

(assert (=> b!1349030 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596059) (select (arr!44418 _keys!1571) from!1960)))))

(declare-fun b!1349031 () Bool)

(declare-fun Unit!44033 () Unit!44020)

(assert (=> b!1349031 (= e!767441 Unit!44033)))

(declare-fun b!1349032 () Bool)

(assert (=> b!1349032 (= e!767442 (isDefined!532 (getValueByKey!725 (toList!11041 lt!596059) (select (arr!44418 _keys!1571) from!1960))))))

(assert (= (and d!144529 c!126532) b!1349030))

(assert (= (and d!144529 (not c!126532)) b!1349031))

(assert (= (and d!144529 (not res!895004)) b!1349032))

(assert (=> d!144529 m!1235177))

(declare-fun m!1235725 () Bool)

(assert (=> d!144529 m!1235725))

(assert (=> b!1349030 m!1235177))

(declare-fun m!1235727 () Bool)

(assert (=> b!1349030 m!1235727))

(assert (=> b!1349030 m!1235177))

(declare-fun m!1235729 () Bool)

(assert (=> b!1349030 m!1235729))

(assert (=> b!1349030 m!1235729))

(declare-fun m!1235731 () Bool)

(assert (=> b!1349030 m!1235731))

(assert (=> b!1349032 m!1235177))

(assert (=> b!1349032 m!1235729))

(assert (=> b!1349032 m!1235729))

(assert (=> b!1349032 m!1235731))

(assert (=> b!1348780 d!144529))

(declare-fun b!1349033 () Bool)

(declare-fun e!767443 () Bool)

(declare-fun call!65144 () Bool)

(assert (=> b!1349033 (= e!767443 call!65144)))

(declare-fun d!144531 () Bool)

(declare-fun res!895005 () Bool)

(declare-fun e!767444 () Bool)

(assert (=> d!144531 (=> res!895005 e!767444)))

(assert (=> d!144531 (= res!895005 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!44970 _keys!1571)))))

(assert (=> d!144531 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977) e!767444)))

(declare-fun b!1349034 () Bool)

(declare-fun e!767445 () Bool)

(assert (=> b!1349034 (= e!767445 call!65144)))

(declare-fun b!1349035 () Bool)

(assert (=> b!1349035 (= e!767443 e!767445)))

(declare-fun lt!596236 () (_ BitVec 64))

(assert (=> b!1349035 (= lt!596236 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!596238 () Unit!44020)

(assert (=> b!1349035 (= lt!596238 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!596236 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1349035 (arrayContainsKey!0 _keys!1571 lt!596236 #b00000000000000000000000000000000)))

(declare-fun lt!596237 () Unit!44020)

(assert (=> b!1349035 (= lt!596237 lt!596238)))

(declare-fun res!895006 () Bool)

(assert (=> b!1349035 (= res!895006 (= (seekEntryOrOpen!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1571 mask!1977) (Found!10057 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1349035 (=> (not res!895006) (not e!767445))))

(declare-fun bm!65141 () Bool)

(assert (=> bm!65141 (= call!65144 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1349036 () Bool)

(assert (=> b!1349036 (= e!767444 e!767443)))

(declare-fun c!126533 () Bool)

(assert (=> b!1349036 (= c!126533 (validKeyInArray!0 (select (arr!44418 _keys!1571) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!144531 (not res!895005)) b!1349036))

(assert (= (and b!1349036 c!126533) b!1349035))

(assert (= (and b!1349036 (not c!126533)) b!1349033))

(assert (= (and b!1349035 res!895006) b!1349034))

(assert (= (or b!1349034 b!1349033) bm!65141))

(assert (=> b!1349035 m!1235715))

(declare-fun m!1235733 () Bool)

(assert (=> b!1349035 m!1235733))

(declare-fun m!1235735 () Bool)

(assert (=> b!1349035 m!1235735))

(assert (=> b!1349035 m!1235715))

(declare-fun m!1235737 () Bool)

(assert (=> b!1349035 m!1235737))

(declare-fun m!1235739 () Bool)

(assert (=> bm!65141 m!1235739))

(assert (=> b!1349036 m!1235715))

(assert (=> b!1349036 m!1235715))

(assert (=> b!1349036 m!1235717))

(assert (=> bm!65101 d!144531))

(assert (=> b!1348708 d!144497))

(declare-fun d!144533 () Bool)

(assert (=> d!144533 (= (apply!1032 lt!596059 (select (arr!44418 _keys!1571) from!1960)) (get!22456 (getValueByKey!725 (toList!11041 lt!596059) (select (arr!44418 _keys!1571) from!1960))))))

(declare-fun bs!38648 () Bool)

(assert (= bs!38648 d!144533))

(assert (=> bs!38648 m!1235177))

(assert (=> bs!38648 m!1235729))

(assert (=> bs!38648 m!1235729))

(declare-fun m!1235741 () Bool)

(assert (=> bs!38648 m!1235741))

(assert (=> b!1348767 d!144533))

(assert (=> b!1348767 d!144415))

(declare-fun d!144535 () Bool)

(assert (=> d!144535 (isDefined!532 (getValueByKey!725 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun lt!596239 () Unit!44020)

(assert (=> d!144535 (= lt!596239 (choose!1989 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(declare-fun e!767446 () Bool)

(assert (=> d!144535 e!767446))

(declare-fun res!895007 () Bool)

(assert (=> d!144535 (=> (not res!895007) (not e!767446))))

(assert (=> d!144535 (= res!895007 (isStrictlySorted!879 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306))))))

(assert (=> d!144535 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!489 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142) lt!596239)))

(declare-fun b!1349037 () Bool)

(assert (=> b!1349037 (= e!767446 (containsKey!742 (toList!11041 (getCurrentListMap!5873 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306)) k0!1142))))

(assert (= (and d!144535 res!895007) b!1349037))

(assert (=> d!144535 m!1235279))

(assert (=> d!144535 m!1235279))

(assert (=> d!144535 m!1235281))

(declare-fun m!1235743 () Bool)

(assert (=> d!144535 m!1235743))

(declare-fun m!1235745 () Bool)

(assert (=> d!144535 m!1235745))

(assert (=> b!1349037 m!1235275))

(assert (=> b!1348716 d!144535))

(assert (=> b!1348716 d!144493))

(assert (=> b!1348716 d!144495))

(declare-fun b!1349039 () Bool)

(declare-fun e!767447 () Bool)

(assert (=> b!1349039 (= e!767447 tp_is_empty!37573)))

(declare-fun mapNonEmpty!58083 () Bool)

(declare-fun mapRes!58083 () Bool)

(declare-fun tp!110548 () Bool)

(declare-fun e!767448 () Bool)

(assert (=> mapNonEmpty!58083 (= mapRes!58083 (and tp!110548 e!767448))))

(declare-fun mapRest!58083 () (Array (_ BitVec 32) ValueCell!17888))

(declare-fun mapValue!58083 () ValueCell!17888)

(declare-fun mapKey!58083 () (_ BitVec 32))

(assert (=> mapNonEmpty!58083 (= mapRest!58082 (store mapRest!58083 mapKey!58083 mapValue!58083))))

(declare-fun b!1349038 () Bool)

(assert (=> b!1349038 (= e!767448 tp_is_empty!37573)))

(declare-fun mapIsEmpty!58083 () Bool)

(assert (=> mapIsEmpty!58083 mapRes!58083))

(declare-fun condMapEmpty!58083 () Bool)

(declare-fun mapDefault!58083 () ValueCell!17888)

(assert (=> mapNonEmpty!58082 (= condMapEmpty!58083 (= mapRest!58082 ((as const (Array (_ BitVec 32) ValueCell!17888)) mapDefault!58083)))))

(assert (=> mapNonEmpty!58082 (= tp!110547 (and e!767447 mapRes!58083))))

(assert (= (and mapNonEmpty!58082 condMapEmpty!58083) mapIsEmpty!58083))

(assert (= (and mapNonEmpty!58082 (not condMapEmpty!58083)) mapNonEmpty!58083))

(assert (= (and mapNonEmpty!58083 ((_ is ValueCellFull!17888) mapValue!58083)) b!1349038))

(assert (= (and mapNonEmpty!58082 ((_ is ValueCellFull!17888) mapDefault!58083)) b!1349039))

(declare-fun m!1235747 () Bool)

(assert (=> mapNonEmpty!58083 m!1235747))

(declare-fun b_lambda!24671 () Bool)

(assert (= b_lambda!24669 (or (and start!113606 b_free!31573) b_lambda!24671)))

(declare-fun b_lambda!24673 () Bool)

(assert (= b_lambda!24663 (or (and start!113606 b_free!31573) b_lambda!24673)))

(declare-fun b_lambda!24675 () Bool)

(assert (= b_lambda!24667 (or (and start!113606 b_free!31573) b_lambda!24675)))

(declare-fun b_lambda!24677 () Bool)

(assert (= b_lambda!24665 (or (and start!113606 b_free!31573) b_lambda!24677)))

(check-sat (not b_lambda!24661) (not d!144437) (not b!1348870) (not d!144489) (not b!1348931) (not d!144481) (not b!1348894) (not b!1348930) (not b!1349035) (not d!144477) (not bm!65140) (not d!144479) (not d!144459) (not b!1348949) (not b!1348948) (not b!1348952) (not b_lambda!24673) (not b!1348936) (not d!144427) (not b!1349028) (not b!1348988) (not d!144507) (not d!144457) (not b!1348917) (not d!144423) (not d!144499) (not b!1348860) (not b!1348865) (not d!144441) (not d!144443) (not d!144431) (not b_lambda!24659) (not b!1348967) (not d!144511) (not b!1348898) (not b!1349036) (not d!144519) (not b!1348935) (not b!1348847) (not b!1348926) (not b!1348908) (not d!144533) (not d!144493) (not bm!65141) (not b!1348854) (not b!1349037) (not mapNonEmpty!58083) (not b!1348881) (not d!144473) (not d!144439) (not d!144491) (not d!144523) tp_is_empty!37573 (not b!1348850) (not b_lambda!24671) (not b!1348996) (not b!1348955) (not b!1348916) (not b!1348938) (not b!1348920) (not b!1348954) (not b!1348966) (not b!1348950) (not b!1348941) (not b!1348953) (not d!144501) (not b!1348998) b_and!50937 (not b!1349032) (not b!1348991) (not b!1348907) (not b!1348933) (not d!144465) (not d!144421) (not d!144447) (not d!144453) (not b!1349000) (not b!1348927) (not b!1348869) (not b!1349026) (not d!144425) (not b!1348932) (not d!144529) (not b!1348899) (not b!1348903) (not b!1348904) (not d!144469) (not b!1348896) (not b!1348853) (not d!144433) (not b!1348868) (not d!144463) (not d!144487) (not b!1348861) (not d!144429) (not b!1348900) (not b!1348891) (not d!144517) (not b!1348851) (not b!1348910) (not b!1348867) (not d!144535) (not b!1348919) (not b!1348852) (not d!144449) (not bm!65139) (not d!144419) (not b_lambda!24657) (not b!1349029) (not d!144445) (not d!144475) (not b_lambda!24649) (not b!1348856) (not d!144515) (not b!1348960) (not d!144435) (not b!1348921) (not bm!65130) (not b!1348888) (not b!1349030) (not b_lambda!24677) (not b!1348848) (not b!1348857) (not bm!65129) (not b!1348957) (not b!1348906) (not d!144513) (not b!1348864) (not d!144527) (not b!1349006) (not b_lambda!24675) (not d!144505) (not b!1348859) (not b!1348928) (not b_next!31573) (not b!1349024))
(check-sat b_and!50937 (not b_next!31573))
