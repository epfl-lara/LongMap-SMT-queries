; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112024 () Bool)

(assert start!112024)

(declare-fun b_free!30457 () Bool)

(declare-fun b_next!30457 () Bool)

(assert (=> start!112024 (= b_free!30457 (not b_next!30457))))

(declare-fun tp!106847 () Bool)

(declare-fun b_and!48997 () Bool)

(assert (=> start!112024 (= tp!106847 b_and!48997)))

(declare-fun res!879909 () Bool)

(declare-fun e!756110 () Bool)

(assert (=> start!112024 (=> (not res!879909) (not e!756110))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112024 (= res!879909 (validMask!0 mask!2019))))

(assert (=> start!112024 e!756110))

(declare-datatypes ((array!89553 0))(
  ( (array!89554 (arr!43246 (Array (_ BitVec 32) (_ BitVec 64))) (size!43797 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89553)

(declare-fun array_inv!32913 (array!89553) Bool)

(assert (=> start!112024 (array_inv!32913 _keys!1609)))

(assert (=> start!112024 true))

(declare-fun tp_is_empty!36277 () Bool)

(assert (=> start!112024 tp_is_empty!36277))

(declare-datatypes ((V!53473 0))(
  ( (V!53474 (val!18213 Int)) )
))
(declare-datatypes ((ValueCell!17240 0))(
  ( (ValueCellFull!17240 (v!20838 V!53473)) (EmptyCell!17240) )
))
(declare-datatypes ((array!89555 0))(
  ( (array!89556 (arr!43247 (Array (_ BitVec 32) ValueCell!17240)) (size!43798 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89555)

(declare-fun e!756112 () Bool)

(declare-fun array_inv!32914 (array!89555) Bool)

(assert (=> start!112024 (and (array_inv!32914 _values!1337) e!756112)))

(assert (=> start!112024 tp!106847))

(declare-fun b!1326166 () Bool)

(declare-fun res!879916 () Bool)

(assert (=> b!1326166 (=> (not res!879916) (not e!756110))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53473)

(declare-fun minValue!1279 () V!53473)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23522 0))(
  ( (tuple2!23523 (_1!11772 (_ BitVec 64)) (_2!11772 V!53473)) )
))
(declare-datatypes ((List!30673 0))(
  ( (Nil!30670) (Cons!30669 (h!31887 tuple2!23522) (t!44593 List!30673)) )
))
(declare-datatypes ((ListLongMap!21187 0))(
  ( (ListLongMap!21188 (toList!10609 List!30673)) )
))
(declare-fun contains!8775 (ListLongMap!21187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5591 (array!89553 array!89555 (_ BitVec 32) (_ BitVec 32) V!53473 V!53473 (_ BitVec 32) Int) ListLongMap!21187)

(assert (=> b!1326166 (= res!879916 (contains!8775 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!56063 () Bool)

(declare-fun mapRes!56063 () Bool)

(declare-fun tp!106846 () Bool)

(declare-fun e!756108 () Bool)

(assert (=> mapNonEmpty!56063 (= mapRes!56063 (and tp!106846 e!756108))))

(declare-fun mapRest!56063 () (Array (_ BitVec 32) ValueCell!17240))

(declare-fun mapKey!56063 () (_ BitVec 32))

(declare-fun mapValue!56063 () ValueCell!17240)

(assert (=> mapNonEmpty!56063 (= (arr!43247 _values!1337) (store mapRest!56063 mapKey!56063 mapValue!56063))))

(declare-fun b!1326167 () Bool)

(declare-fun e!756109 () Bool)

(assert (=> b!1326167 (= e!756112 (and e!756109 mapRes!56063))))

(declare-fun condMapEmpty!56063 () Bool)

(declare-fun mapDefault!56063 () ValueCell!17240)

(assert (=> b!1326167 (= condMapEmpty!56063 (= (arr!43247 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17240)) mapDefault!56063)))))

(declare-fun b!1326168 () Bool)

(assert (=> b!1326168 (= e!756109 tp_is_empty!36277)))

(declare-fun b!1326169 () Bool)

(declare-fun res!879915 () Bool)

(assert (=> b!1326169 (=> (not res!879915) (not e!756110))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326169 (= res!879915 (validKeyInArray!0 (select (arr!43246 _keys!1609) from!2000)))))

(declare-fun b!1326170 () Bool)

(declare-fun res!879910 () Bool)

(assert (=> b!1326170 (=> (not res!879910) (not e!756110))))

(assert (=> b!1326170 (= res!879910 (not (= (select (arr!43246 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326171 () Bool)

(declare-fun res!879911 () Bool)

(assert (=> b!1326171 (=> (not res!879911) (not e!756110))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89553 (_ BitVec 32)) Bool)

(assert (=> b!1326171 (= res!879911 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326172 () Bool)

(declare-fun +!4655 (ListLongMap!21187 tuple2!23522) ListLongMap!21187)

(declare-fun getCurrentListMapNoExtraKeys!6299 (array!89553 array!89555 (_ BitVec 32) (_ BitVec 32) V!53473 V!53473 (_ BitVec 32) Int) ListLongMap!21187)

(declare-fun get!21802 (ValueCell!17240 V!53473) V!53473)

(declare-fun dynLambda!3609 (Int (_ BitVec 64)) V!53473)

(assert (=> b!1326172 (= e!756110 (not (contains!8775 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))))

(declare-fun b!1326173 () Bool)

(declare-fun res!879914 () Bool)

(assert (=> b!1326173 (=> (not res!879914) (not e!756110))))

(declare-datatypes ((List!30674 0))(
  ( (Nil!30671) (Cons!30670 (h!31888 (_ BitVec 64)) (t!44594 List!30674)) )
))
(declare-fun arrayNoDuplicates!0 (array!89553 (_ BitVec 32) List!30674) Bool)

(assert (=> b!1326173 (= res!879914 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30671))))

(declare-fun b!1326174 () Bool)

(declare-fun res!879912 () Bool)

(assert (=> b!1326174 (=> (not res!879912) (not e!756110))))

(assert (=> b!1326174 (= res!879912 (and (= (size!43798 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43797 _keys!1609) (size!43798 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326175 () Bool)

(assert (=> b!1326175 (= e!756108 tp_is_empty!36277)))

(declare-fun mapIsEmpty!56063 () Bool)

(assert (=> mapIsEmpty!56063 mapRes!56063))

(declare-fun b!1326176 () Bool)

(declare-fun res!879913 () Bool)

(assert (=> b!1326176 (=> (not res!879913) (not e!756110))))

(assert (=> b!1326176 (= res!879913 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112024 res!879909) b!1326174))

(assert (= (and b!1326174 res!879912) b!1326171))

(assert (= (and b!1326171 res!879911) b!1326173))

(assert (= (and b!1326173 res!879914) b!1326176))

(assert (= (and b!1326176 res!879913) b!1326166))

(assert (= (and b!1326166 res!879916) b!1326170))

(assert (= (and b!1326170 res!879910) b!1326169))

(assert (= (and b!1326169 res!879915) b!1326172))

(assert (= (and b!1326167 condMapEmpty!56063) mapIsEmpty!56063))

(assert (= (and b!1326167 (not condMapEmpty!56063)) mapNonEmpty!56063))

(get-info :version)

(assert (= (and mapNonEmpty!56063 ((_ is ValueCellFull!17240) mapValue!56063)) b!1326175))

(assert (= (and b!1326167 ((_ is ValueCellFull!17240) mapDefault!56063)) b!1326168))

(assert (= start!112024 b!1326167))

(declare-fun b_lambda!23699 () Bool)

(assert (=> (not b_lambda!23699) (not b!1326172)))

(declare-fun t!44592 () Bool)

(declare-fun tb!11723 () Bool)

(assert (=> (and start!112024 (= defaultEntry!1340 defaultEntry!1340) t!44592) tb!11723))

(declare-fun result!24509 () Bool)

(assert (=> tb!11723 (= result!24509 tp_is_empty!36277)))

(assert (=> b!1326172 t!44592))

(declare-fun b_and!48999 () Bool)

(assert (= b_and!48997 (and (=> t!44592 result!24509) b_and!48999)))

(declare-fun m!1215173 () Bool)

(assert (=> start!112024 m!1215173))

(declare-fun m!1215175 () Bool)

(assert (=> start!112024 m!1215175))

(declare-fun m!1215177 () Bool)

(assert (=> start!112024 m!1215177))

(declare-fun m!1215179 () Bool)

(assert (=> mapNonEmpty!56063 m!1215179))

(declare-fun m!1215181 () Bool)

(assert (=> b!1326172 m!1215181))

(declare-fun m!1215183 () Bool)

(assert (=> b!1326172 m!1215183))

(assert (=> b!1326172 m!1215181))

(declare-fun m!1215185 () Bool)

(assert (=> b!1326172 m!1215185))

(declare-fun m!1215187 () Bool)

(assert (=> b!1326172 m!1215187))

(declare-fun m!1215189 () Bool)

(assert (=> b!1326172 m!1215189))

(declare-fun m!1215191 () Bool)

(assert (=> b!1326172 m!1215191))

(assert (=> b!1326172 m!1215185))

(declare-fun m!1215193 () Bool)

(assert (=> b!1326172 m!1215193))

(declare-fun m!1215195 () Bool)

(assert (=> b!1326172 m!1215195))

(assert (=> b!1326172 m!1215193))

(assert (=> b!1326172 m!1215187))

(assert (=> b!1326172 m!1215191))

(assert (=> b!1326172 m!1215183))

(declare-fun m!1215197 () Bool)

(assert (=> b!1326172 m!1215197))

(declare-fun m!1215199 () Bool)

(assert (=> b!1326166 m!1215199))

(assert (=> b!1326166 m!1215199))

(declare-fun m!1215201 () Bool)

(assert (=> b!1326166 m!1215201))

(assert (=> b!1326170 m!1215195))

(declare-fun m!1215203 () Bool)

(assert (=> b!1326173 m!1215203))

(assert (=> b!1326169 m!1215195))

(assert (=> b!1326169 m!1215195))

(declare-fun m!1215205 () Bool)

(assert (=> b!1326169 m!1215205))

(declare-fun m!1215207 () Bool)

(assert (=> b!1326171 m!1215207))

(check-sat (not start!112024) (not b_next!30457) (not b!1326169) tp_is_empty!36277 b_and!48999 (not b_lambda!23699) (not mapNonEmpty!56063) (not b!1326166) (not b!1326173) (not b!1326171) (not b!1326172))
(check-sat b_and!48999 (not b_next!30457))
(get-model)

(declare-fun b_lambda!23705 () Bool)

(assert (= b_lambda!23699 (or (and start!112024 b_free!30457) b_lambda!23705)))

(check-sat (not start!112024) (not b_next!30457) (not b!1326169) tp_is_empty!36277 b_and!48999 (not b_lambda!23705) (not mapNonEmpty!56063) (not b!1326166) (not b!1326173) (not b!1326171) (not b!1326172))
(check-sat b_and!48999 (not b_next!30457))
(get-model)

(declare-fun d!143339 () Bool)

(declare-fun e!756147 () Bool)

(assert (=> d!143339 e!756147))

(declare-fun res!879967 () Bool)

(assert (=> d!143339 (=> res!879967 e!756147)))

(declare-fun lt!589994 () Bool)

(assert (=> d!143339 (= res!879967 (not lt!589994))))

(declare-fun lt!589993 () Bool)

(assert (=> d!143339 (= lt!589994 lt!589993)))

(declare-datatypes ((Unit!43597 0))(
  ( (Unit!43598) )
))
(declare-fun lt!589992 () Unit!43597)

(declare-fun e!756148 () Unit!43597)

(assert (=> d!143339 (= lt!589992 e!756148)))

(declare-fun c!126041 () Bool)

(assert (=> d!143339 (= c!126041 lt!589993)))

(declare-fun containsKey!734 (List!30673 (_ BitVec 64)) Bool)

(assert (=> d!143339 (= lt!589993 (containsKey!734 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> d!143339 (= (contains!8775 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164) lt!589994)))

(declare-fun b!1326255 () Bool)

(declare-fun lt!589991 () Unit!43597)

(assert (=> b!1326255 (= e!756148 lt!589991)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!480 (List!30673 (_ BitVec 64)) Unit!43597)

(assert (=> b!1326255 (= lt!589991 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-datatypes ((Option!759 0))(
  ( (Some!758 (v!20841 V!53473)) (None!757) )
))
(declare-fun isDefined!517 (Option!759) Bool)

(declare-fun getValueByKey!708 (List!30673 (_ BitVec 64)) Option!759)

(assert (=> b!1326255 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun b!1326256 () Bool)

(declare-fun Unit!43599 () Unit!43597)

(assert (=> b!1326256 (= e!756148 Unit!43599)))

(declare-fun b!1326257 () Bool)

(assert (=> b!1326257 (= e!756147 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)))))

(assert (= (and d!143339 c!126041) b!1326255))

(assert (= (and d!143339 (not c!126041)) b!1326256))

(assert (= (and d!143339 (not res!879967)) b!1326257))

(declare-fun m!1215281 () Bool)

(assert (=> d!143339 m!1215281))

(declare-fun m!1215283 () Bool)

(assert (=> b!1326255 m!1215283))

(declare-fun m!1215285 () Bool)

(assert (=> b!1326255 m!1215285))

(assert (=> b!1326255 m!1215285))

(declare-fun m!1215287 () Bool)

(assert (=> b!1326255 m!1215287))

(assert (=> b!1326257 m!1215285))

(assert (=> b!1326257 m!1215285))

(assert (=> b!1326257 m!1215287))

(assert (=> b!1326172 d!143339))

(declare-fun d!143341 () Bool)

(declare-fun e!756151 () Bool)

(assert (=> d!143341 e!756151))

(declare-fun res!879972 () Bool)

(assert (=> d!143341 (=> (not res!879972) (not e!756151))))

(declare-fun lt!590005 () ListLongMap!21187)

(assert (=> d!143341 (= res!879972 (contains!8775 lt!590005 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!590004 () List!30673)

(assert (=> d!143341 (= lt!590005 (ListLongMap!21188 lt!590004))))

(declare-fun lt!590003 () Unit!43597)

(declare-fun lt!590006 () Unit!43597)

(assert (=> d!143341 (= lt!590003 lt!590006)))

(assert (=> d!143341 (= (getValueByKey!708 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!358 (List!30673 (_ BitVec 64) V!53473) Unit!43597)

(assert (=> d!143341 (= lt!590006 (lemmaContainsTupThenGetReturnValue!358 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!487 (List!30673 (_ BitVec 64) V!53473) List!30673)

(assert (=> d!143341 (= lt!590004 (insertStrictlySorted!487 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143341 (= (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!590005)))

(declare-fun b!1326262 () Bool)

(declare-fun res!879973 () Bool)

(assert (=> b!1326262 (=> (not res!879973) (not e!756151))))

(assert (=> b!1326262 (= res!879973 (= (getValueByKey!708 (toList!10609 lt!590005) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1326263 () Bool)

(declare-fun contains!8778 (List!30673 tuple2!23522) Bool)

(assert (=> b!1326263 (= e!756151 (contains!8778 (toList!10609 lt!590005) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143341 res!879972) b!1326262))

(assert (= (and b!1326262 res!879973) b!1326263))

(declare-fun m!1215289 () Bool)

(assert (=> d!143341 m!1215289))

(declare-fun m!1215291 () Bool)

(assert (=> d!143341 m!1215291))

(declare-fun m!1215293 () Bool)

(assert (=> d!143341 m!1215293))

(declare-fun m!1215295 () Bool)

(assert (=> d!143341 m!1215295))

(declare-fun m!1215297 () Bool)

(assert (=> b!1326262 m!1215297))

(declare-fun m!1215299 () Bool)

(assert (=> b!1326263 m!1215299))

(assert (=> b!1326172 d!143341))

(declare-fun d!143343 () Bool)

(declare-fun c!126044 () Bool)

(assert (=> d!143343 (= c!126044 ((_ is ValueCellFull!17240) (select (arr!43247 _values!1337) from!2000)))))

(declare-fun e!756154 () V!53473)

(assert (=> d!143343 (= (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756154)))

(declare-fun b!1326268 () Bool)

(declare-fun get!21805 (ValueCell!17240 V!53473) V!53473)

(assert (=> b!1326268 (= e!756154 (get!21805 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326269 () Bool)

(declare-fun get!21806 (ValueCell!17240 V!53473) V!53473)

(assert (=> b!1326269 (= e!756154 (get!21806 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143343 c!126044) b!1326268))

(assert (= (and d!143343 (not c!126044)) b!1326269))

(assert (=> b!1326268 m!1215191))

(assert (=> b!1326268 m!1215183))

(declare-fun m!1215301 () Bool)

(assert (=> b!1326268 m!1215301))

(assert (=> b!1326269 m!1215191))

(assert (=> b!1326269 m!1215183))

(declare-fun m!1215303 () Bool)

(assert (=> b!1326269 m!1215303))

(assert (=> b!1326172 d!143343))

(declare-fun b!1326294 () Bool)

(declare-fun e!756174 () ListLongMap!21187)

(declare-fun e!756169 () ListLongMap!21187)

(assert (=> b!1326294 (= e!756174 e!756169)))

(declare-fun c!126054 () Bool)

(assert (=> b!1326294 (= c!126054 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1326295 () Bool)

(declare-fun e!756170 () Bool)

(declare-fun lt!590027 () ListLongMap!21187)

(assert (=> b!1326295 (= e!756170 (= lt!590027 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun call!64752 () ListLongMap!21187)

(declare-fun bm!64749 () Bool)

(assert (=> bm!64749 (= call!64752 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1326296 () Bool)

(declare-fun lt!590026 () Unit!43597)

(declare-fun lt!590024 () Unit!43597)

(assert (=> b!1326296 (= lt!590026 lt!590024)))

(declare-fun lt!590022 () (_ BitVec 64))

(declare-fun lt!590025 () ListLongMap!21187)

(declare-fun lt!590023 () V!53473)

(declare-fun lt!590021 () (_ BitVec 64))

(assert (=> b!1326296 (not (contains!8775 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023)) lt!590021))))

(declare-fun addStillNotContains!494 (ListLongMap!21187 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43597)

(assert (=> b!1326296 (= lt!590024 (addStillNotContains!494 lt!590025 lt!590022 lt!590023 lt!590021))))

(assert (=> b!1326296 (= lt!590021 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1326296 (= lt!590023 (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1326296 (= lt!590022 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1326296 (= lt!590025 call!64752)))

(assert (=> b!1326296 (= e!756169 (+!4655 call!64752 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326297 () Bool)

(declare-fun isEmpty!1079 (ListLongMap!21187) Bool)

(assert (=> b!1326297 (= e!756170 (isEmpty!1079 lt!590027))))

(declare-fun b!1326298 () Bool)

(assert (=> b!1326298 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43797 _keys!1609)))))

(assert (=> b!1326298 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43798 _values!1337)))))

(declare-fun e!756172 () Bool)

(declare-fun apply!1038 (ListLongMap!21187 (_ BitVec 64)) V!53473)

(assert (=> b!1326298 (= e!756172 (= (apply!1038 lt!590027 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326299 () Bool)

(declare-fun e!756171 () Bool)

(declare-fun e!756173 () Bool)

(assert (=> b!1326299 (= e!756171 e!756173)))

(declare-fun c!126053 () Bool)

(declare-fun e!756175 () Bool)

(assert (=> b!1326299 (= c!126053 e!756175)))

(declare-fun res!879982 () Bool)

(assert (=> b!1326299 (=> (not res!879982) (not e!756175))))

(assert (=> b!1326299 (= res!879982 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43797 _keys!1609)))))

(declare-fun d!143345 () Bool)

(assert (=> d!143345 e!756171))

(declare-fun res!879984 () Bool)

(assert (=> d!143345 (=> (not res!879984) (not e!756171))))

(assert (=> d!143345 (= res!879984 (not (contains!8775 lt!590027 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143345 (= lt!590027 e!756174)))

(declare-fun c!126055 () Bool)

(assert (=> d!143345 (= c!126055 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43797 _keys!1609)))))

(assert (=> d!143345 (validMask!0 mask!2019)))

(assert (=> d!143345 (= (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590027)))

(declare-fun b!1326300 () Bool)

(assert (=> b!1326300 (= e!756173 e!756172)))

(assert (=> b!1326300 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43797 _keys!1609)))))

(declare-fun res!879983 () Bool)

(assert (=> b!1326300 (= res!879983 (contains!8775 lt!590027 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326300 (=> (not res!879983) (not e!756172))))

(declare-fun b!1326301 () Bool)

(assert (=> b!1326301 (= e!756173 e!756170)))

(declare-fun c!126056 () Bool)

(assert (=> b!1326301 (= c!126056 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43797 _keys!1609)))))

(declare-fun b!1326302 () Bool)

(assert (=> b!1326302 (= e!756169 call!64752)))

(declare-fun b!1326303 () Bool)

(assert (=> b!1326303 (= e!756174 (ListLongMap!21188 Nil!30670))))

(declare-fun b!1326304 () Bool)

(declare-fun res!879985 () Bool)

(assert (=> b!1326304 (=> (not res!879985) (not e!756171))))

(assert (=> b!1326304 (= res!879985 (not (contains!8775 lt!590027 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326305 () Bool)

(assert (=> b!1326305 (= e!756175 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326305 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(assert (= (and d!143345 c!126055) b!1326303))

(assert (= (and d!143345 (not c!126055)) b!1326294))

(assert (= (and b!1326294 c!126054) b!1326296))

(assert (= (and b!1326294 (not c!126054)) b!1326302))

(assert (= (or b!1326296 b!1326302) bm!64749))

(assert (= (and d!143345 res!879984) b!1326304))

(assert (= (and b!1326304 res!879985) b!1326299))

(assert (= (and b!1326299 res!879982) b!1326305))

(assert (= (and b!1326299 c!126053) b!1326300))

(assert (= (and b!1326299 (not c!126053)) b!1326301))

(assert (= (and b!1326300 res!879983) b!1326298))

(assert (= (and b!1326301 c!126056) b!1326295))

(assert (= (and b!1326301 (not c!126056)) b!1326297))

(declare-fun b_lambda!23707 () Bool)

(assert (=> (not b_lambda!23707) (not b!1326296)))

(assert (=> b!1326296 t!44592))

(declare-fun b_and!49009 () Bool)

(assert (= b_and!48999 (and (=> t!44592 result!24509) b_and!49009)))

(declare-fun b_lambda!23709 () Bool)

(assert (=> (not b_lambda!23709) (not b!1326298)))

(assert (=> b!1326298 t!44592))

(declare-fun b_and!49011 () Bool)

(assert (= b_and!49009 (and (=> t!44592 result!24509) b_and!49011)))

(declare-fun m!1215305 () Bool)

(assert (=> b!1326294 m!1215305))

(assert (=> b!1326294 m!1215305))

(declare-fun m!1215307 () Bool)

(assert (=> b!1326294 m!1215307))

(assert (=> b!1326305 m!1215305))

(assert (=> b!1326305 m!1215305))

(assert (=> b!1326305 m!1215307))

(declare-fun m!1215309 () Bool)

(assert (=> bm!64749 m!1215309))

(declare-fun m!1215311 () Bool)

(assert (=> b!1326297 m!1215311))

(assert (=> b!1326300 m!1215305))

(assert (=> b!1326300 m!1215305))

(declare-fun m!1215313 () Bool)

(assert (=> b!1326300 m!1215313))

(declare-fun m!1215315 () Bool)

(assert (=> b!1326304 m!1215315))

(declare-fun m!1215317 () Bool)

(assert (=> b!1326296 m!1215317))

(assert (=> b!1326296 m!1215183))

(declare-fun m!1215319 () Bool)

(assert (=> b!1326296 m!1215319))

(assert (=> b!1326296 m!1215317))

(assert (=> b!1326296 m!1215305))

(declare-fun m!1215321 () Bool)

(assert (=> b!1326296 m!1215321))

(declare-fun m!1215323 () Bool)

(assert (=> b!1326296 m!1215323))

(declare-fun m!1215325 () Bool)

(assert (=> b!1326296 m!1215325))

(assert (=> b!1326296 m!1215321))

(assert (=> b!1326296 m!1215183))

(declare-fun m!1215327 () Bool)

(assert (=> b!1326296 m!1215327))

(assert (=> b!1326298 m!1215317))

(assert (=> b!1326298 m!1215183))

(assert (=> b!1326298 m!1215319))

(assert (=> b!1326298 m!1215317))

(assert (=> b!1326298 m!1215305))

(declare-fun m!1215329 () Bool)

(assert (=> b!1326298 m!1215329))

(assert (=> b!1326298 m!1215183))

(assert (=> b!1326298 m!1215305))

(assert (=> b!1326295 m!1215309))

(declare-fun m!1215331 () Bool)

(assert (=> d!143345 m!1215331))

(assert (=> d!143345 m!1215173))

(assert (=> b!1326172 d!143345))

(declare-fun d!143347 () Bool)

(declare-fun e!756176 () Bool)

(assert (=> d!143347 e!756176))

(declare-fun res!879986 () Bool)

(assert (=> d!143347 (=> (not res!879986) (not e!756176))))

(declare-fun lt!590030 () ListLongMap!21187)

(assert (=> d!143347 (= res!879986 (contains!8775 lt!590030 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590029 () List!30673)

(assert (=> d!143347 (= lt!590030 (ListLongMap!21188 lt!590029))))

(declare-fun lt!590028 () Unit!43597)

(declare-fun lt!590031 () Unit!43597)

(assert (=> d!143347 (= lt!590028 lt!590031)))

(assert (=> d!143347 (= (getValueByKey!708 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143347 (= lt!590031 (lemmaContainsTupThenGetReturnValue!358 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143347 (= lt!590029 (insertStrictlySorted!487 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143347 (= (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590030)))

(declare-fun b!1326306 () Bool)

(declare-fun res!879987 () Bool)

(assert (=> b!1326306 (=> (not res!879987) (not e!756176))))

(assert (=> b!1326306 (= res!879987 (= (getValueByKey!708 (toList!10609 lt!590030) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1326307 () Bool)

(assert (=> b!1326307 (= e!756176 (contains!8778 (toList!10609 lt!590030) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143347 res!879986) b!1326306))

(assert (= (and b!1326306 res!879987) b!1326307))

(declare-fun m!1215333 () Bool)

(assert (=> d!143347 m!1215333))

(declare-fun m!1215335 () Bool)

(assert (=> d!143347 m!1215335))

(declare-fun m!1215337 () Bool)

(assert (=> d!143347 m!1215337))

(declare-fun m!1215339 () Bool)

(assert (=> d!143347 m!1215339))

(declare-fun m!1215341 () Bool)

(assert (=> b!1326306 m!1215341))

(declare-fun m!1215343 () Bool)

(assert (=> b!1326307 m!1215343))

(assert (=> b!1326172 d!143347))

(declare-fun d!143349 () Bool)

(declare-fun e!756177 () Bool)

(assert (=> d!143349 e!756177))

(declare-fun res!879988 () Bool)

(assert (=> d!143349 (=> (not res!879988) (not e!756177))))

(declare-fun lt!590034 () ListLongMap!21187)

(assert (=> d!143349 (= res!879988 (contains!8775 lt!590034 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun lt!590033 () List!30673)

(assert (=> d!143349 (= lt!590034 (ListLongMap!21188 lt!590033))))

(declare-fun lt!590032 () Unit!43597)

(declare-fun lt!590035 () Unit!43597)

(assert (=> d!143349 (= lt!590032 lt!590035)))

(assert (=> d!143349 (= (getValueByKey!708 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!143349 (= lt!590035 (lemmaContainsTupThenGetReturnValue!358 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!143349 (= lt!590033 (insertStrictlySorted!487 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!143349 (= (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) lt!590034)))

(declare-fun b!1326308 () Bool)

(declare-fun res!879989 () Bool)

(assert (=> b!1326308 (=> (not res!879989) (not e!756177))))

(assert (=> b!1326308 (= res!879989 (= (getValueByKey!708 (toList!10609 lt!590034) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun b!1326309 () Bool)

(assert (=> b!1326309 (= e!756177 (contains!8778 (toList!10609 lt!590034) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and d!143349 res!879988) b!1326308))

(assert (= (and b!1326308 res!879989) b!1326309))

(declare-fun m!1215345 () Bool)

(assert (=> d!143349 m!1215345))

(declare-fun m!1215347 () Bool)

(assert (=> d!143349 m!1215347))

(declare-fun m!1215349 () Bool)

(assert (=> d!143349 m!1215349))

(declare-fun m!1215351 () Bool)

(assert (=> d!143349 m!1215351))

(declare-fun m!1215353 () Bool)

(assert (=> b!1326308 m!1215353))

(declare-fun m!1215355 () Bool)

(assert (=> b!1326309 m!1215355))

(assert (=> b!1326172 d!143349))

(declare-fun bm!64752 () Bool)

(declare-fun call!64755 () Bool)

(assert (=> bm!64752 (= call!64755 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!143351 () Bool)

(declare-fun res!879994 () Bool)

(declare-fun e!756186 () Bool)

(assert (=> d!143351 (=> res!879994 e!756186)))

(assert (=> d!143351 (= res!879994 (bvsge #b00000000000000000000000000000000 (size!43797 _keys!1609)))))

(assert (=> d!143351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!756186)))

(declare-fun b!1326318 () Bool)

(declare-fun e!756185 () Bool)

(assert (=> b!1326318 (= e!756185 call!64755)))

(declare-fun b!1326319 () Bool)

(declare-fun e!756184 () Bool)

(assert (=> b!1326319 (= e!756186 e!756184)))

(declare-fun c!126059 () Bool)

(assert (=> b!1326319 (= c!126059 (validKeyInArray!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326320 () Bool)

(assert (=> b!1326320 (= e!756184 call!64755)))

(declare-fun b!1326321 () Bool)

(assert (=> b!1326321 (= e!756184 e!756185)))

(declare-fun lt!590044 () (_ BitVec 64))

(assert (=> b!1326321 (= lt!590044 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590043 () Unit!43597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89553 (_ BitVec 64) (_ BitVec 32)) Unit!43597)

(assert (=> b!1326321 (= lt!590043 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590044 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89553 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1326321 (arrayContainsKey!0 _keys!1609 lt!590044 #b00000000000000000000000000000000)))

(declare-fun lt!590042 () Unit!43597)

(assert (=> b!1326321 (= lt!590042 lt!590043)))

(declare-fun res!879995 () Bool)

(declare-datatypes ((SeekEntryResult!9996 0))(
  ( (MissingZero!9996 (index!42355 (_ BitVec 32))) (Found!9996 (index!42356 (_ BitVec 32))) (Intermediate!9996 (undefined!10808 Bool) (index!42357 (_ BitVec 32)) (x!118086 (_ BitVec 32))) (Undefined!9996) (MissingVacant!9996 (index!42358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89553 (_ BitVec 32)) SeekEntryResult!9996)

(assert (=> b!1326321 (= res!879995 (= (seekEntryOrOpen!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9996 #b00000000000000000000000000000000)))))

(assert (=> b!1326321 (=> (not res!879995) (not e!756185))))

(assert (= (and d!143351 (not res!879994)) b!1326319))

(assert (= (and b!1326319 c!126059) b!1326321))

(assert (= (and b!1326319 (not c!126059)) b!1326320))

(assert (= (and b!1326321 res!879995) b!1326318))

(assert (= (or b!1326318 b!1326320) bm!64752))

(declare-fun m!1215357 () Bool)

(assert (=> bm!64752 m!1215357))

(declare-fun m!1215359 () Bool)

(assert (=> b!1326319 m!1215359))

(assert (=> b!1326319 m!1215359))

(declare-fun m!1215361 () Bool)

(assert (=> b!1326319 m!1215361))

(assert (=> b!1326321 m!1215359))

(declare-fun m!1215363 () Bool)

(assert (=> b!1326321 m!1215363))

(declare-fun m!1215365 () Bool)

(assert (=> b!1326321 m!1215365))

(assert (=> b!1326321 m!1215359))

(declare-fun m!1215367 () Bool)

(assert (=> b!1326321 m!1215367))

(assert (=> b!1326171 d!143351))

(declare-fun d!143353 () Bool)

(declare-fun e!756187 () Bool)

(assert (=> d!143353 e!756187))

(declare-fun res!879996 () Bool)

(assert (=> d!143353 (=> res!879996 e!756187)))

(declare-fun lt!590048 () Bool)

(assert (=> d!143353 (= res!879996 (not lt!590048))))

(declare-fun lt!590047 () Bool)

(assert (=> d!143353 (= lt!590048 lt!590047)))

(declare-fun lt!590046 () Unit!43597)

(declare-fun e!756188 () Unit!43597)

(assert (=> d!143353 (= lt!590046 e!756188)))

(declare-fun c!126060 () Bool)

(assert (=> d!143353 (= c!126060 lt!590047)))

(assert (=> d!143353 (= lt!590047 (containsKey!734 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143353 (= (contains!8775 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590048)))

(declare-fun b!1326322 () Bool)

(declare-fun lt!590045 () Unit!43597)

(assert (=> b!1326322 (= e!756188 lt!590045)))

(assert (=> b!1326322 (= lt!590045 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> b!1326322 (isDefined!517 (getValueByKey!708 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1326323 () Bool)

(declare-fun Unit!43600 () Unit!43597)

(assert (=> b!1326323 (= e!756188 Unit!43600)))

(declare-fun b!1326324 () Bool)

(assert (=> b!1326324 (= e!756187 (isDefined!517 (getValueByKey!708 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143353 c!126060) b!1326322))

(assert (= (and d!143353 (not c!126060)) b!1326323))

(assert (= (and d!143353 (not res!879996)) b!1326324))

(declare-fun m!1215369 () Bool)

(assert (=> d!143353 m!1215369))

(declare-fun m!1215371 () Bool)

(assert (=> b!1326322 m!1215371))

(declare-fun m!1215373 () Bool)

(assert (=> b!1326322 m!1215373))

(assert (=> b!1326322 m!1215373))

(declare-fun m!1215375 () Bool)

(assert (=> b!1326322 m!1215375))

(assert (=> b!1326324 m!1215373))

(assert (=> b!1326324 m!1215373))

(assert (=> b!1326324 m!1215375))

(assert (=> b!1326166 d!143353))

(declare-fun bm!64767 () Bool)

(declare-fun call!64772 () ListLongMap!21187)

(declare-fun call!64775 () ListLongMap!21187)

(declare-fun c!126077 () Bool)

(declare-fun c!126075 () Bool)

(declare-fun call!64773 () ListLongMap!21187)

(declare-fun call!64771 () ListLongMap!21187)

(assert (=> bm!64767 (= call!64773 (+!4655 (ite c!126075 call!64775 (ite c!126077 call!64772 call!64771)) (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326367 () Bool)

(declare-fun e!756218 () Bool)

(declare-fun call!64770 () Bool)

(assert (=> b!1326367 (= e!756218 (not call!64770))))

(declare-fun b!1326368 () Bool)

(declare-fun e!756216 () Bool)

(assert (=> b!1326368 (= e!756216 (validKeyInArray!0 (select (arr!43246 _keys!1609) from!2000)))))

(declare-fun b!1326369 () Bool)

(declare-fun e!756225 () ListLongMap!21187)

(assert (=> b!1326369 (= e!756225 (+!4655 call!64773 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun bm!64768 () Bool)

(declare-fun lt!590101 () ListLongMap!21187)

(assert (=> bm!64768 (= call!64770 (contains!8775 lt!590101 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326370 () Bool)

(declare-fun e!756226 () ListLongMap!21187)

(assert (=> b!1326370 (= e!756225 e!756226)))

(assert (=> b!1326370 (= c!126077 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64769 () Bool)

(declare-fun call!64774 () Bool)

(assert (=> bm!64769 (= call!64774 (contains!8775 lt!590101 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326371 () Bool)

(declare-fun e!756217 () Bool)

(assert (=> b!1326371 (= e!756217 (not call!64774))))

(declare-fun b!1326372 () Bool)

(declare-fun e!756224 () Bool)

(assert (=> b!1326372 (= e!756224 (validKeyInArray!0 (select (arr!43246 _keys!1609) from!2000)))))

(declare-fun bm!64770 () Bool)

(assert (=> bm!64770 (= call!64772 call!64775)))

(declare-fun b!1326374 () Bool)

(declare-fun call!64776 () ListLongMap!21187)

(assert (=> b!1326374 (= e!756226 call!64776)))

(declare-fun b!1326375 () Bool)

(declare-fun e!756222 () Bool)

(assert (=> b!1326375 (= e!756222 (= (apply!1038 lt!590101 (select (arr!43246 _keys!1609) from!2000)) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326375 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43798 _values!1337)))))

(assert (=> b!1326375 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)))))

(declare-fun b!1326376 () Bool)

(declare-fun e!756227 () ListLongMap!21187)

(assert (=> b!1326376 (= e!756227 call!64771)))

(declare-fun b!1326377 () Bool)

(declare-fun e!756221 () Bool)

(assert (=> b!1326377 (= e!756218 e!756221)))

(declare-fun res!880019 () Bool)

(assert (=> b!1326377 (= res!880019 call!64770)))

(assert (=> b!1326377 (=> (not res!880019) (not e!756221))))

(declare-fun b!1326378 () Bool)

(declare-fun e!756215 () Bool)

(assert (=> b!1326378 (= e!756215 e!756217)))

(declare-fun c!126074 () Bool)

(assert (=> b!1326378 (= c!126074 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326379 () Bool)

(declare-fun e!756219 () Bool)

(assert (=> b!1326379 (= e!756217 e!756219)))

(declare-fun res!880021 () Bool)

(assert (=> b!1326379 (= res!880021 call!64774)))

(assert (=> b!1326379 (=> (not res!880021) (not e!756219))))

(declare-fun b!1326380 () Bool)

(declare-fun e!756220 () Unit!43597)

(declare-fun Unit!43601 () Unit!43597)

(assert (=> b!1326380 (= e!756220 Unit!43601)))

(declare-fun bm!64771 () Bool)

(assert (=> bm!64771 (= call!64775 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun d!143355 () Bool)

(assert (=> d!143355 e!756215))

(declare-fun res!880017 () Bool)

(assert (=> d!143355 (=> (not res!880017) (not e!756215))))

(assert (=> d!143355 (= res!880017 (or (bvsge from!2000 (size!43797 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)))))))

(declare-fun lt!590102 () ListLongMap!21187)

(assert (=> d!143355 (= lt!590101 lt!590102)))

(declare-fun lt!590113 () Unit!43597)

(assert (=> d!143355 (= lt!590113 e!756220)))

(declare-fun c!126073 () Bool)

(assert (=> d!143355 (= c!126073 e!756216)))

(declare-fun res!880015 () Bool)

(assert (=> d!143355 (=> (not res!880015) (not e!756216))))

(assert (=> d!143355 (= res!880015 (bvslt from!2000 (size!43797 _keys!1609)))))

(assert (=> d!143355 (= lt!590102 e!756225)))

(assert (=> d!143355 (= c!126075 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143355 (validMask!0 mask!2019)))

(assert (=> d!143355 (= (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590101)))

(declare-fun b!1326373 () Bool)

(declare-fun c!126078 () Bool)

(assert (=> b!1326373 (= c!126078 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1326373 (= e!756226 e!756227)))

(declare-fun bm!64772 () Bool)

(assert (=> bm!64772 (= call!64776 call!64773)))

(declare-fun b!1326381 () Bool)

(assert (=> b!1326381 (= e!756221 (= (apply!1038 lt!590101 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326382 () Bool)

(declare-fun res!880018 () Bool)

(assert (=> b!1326382 (=> (not res!880018) (not e!756215))))

(declare-fun e!756223 () Bool)

(assert (=> b!1326382 (= res!880018 e!756223)))

(declare-fun res!880016 () Bool)

(assert (=> b!1326382 (=> res!880016 e!756223)))

(assert (=> b!1326382 (= res!880016 (not e!756224))))

(declare-fun res!880020 () Bool)

(assert (=> b!1326382 (=> (not res!880020) (not e!756224))))

(assert (=> b!1326382 (= res!880020 (bvslt from!2000 (size!43797 _keys!1609)))))

(declare-fun b!1326383 () Bool)

(assert (=> b!1326383 (= e!756227 call!64776)))

(declare-fun b!1326384 () Bool)

(assert (=> b!1326384 (= e!756223 e!756222)))

(declare-fun res!880022 () Bool)

(assert (=> b!1326384 (=> (not res!880022) (not e!756222))))

(assert (=> b!1326384 (= res!880022 (contains!8775 lt!590101 (select (arr!43246 _keys!1609) from!2000)))))

(assert (=> b!1326384 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)))))

(declare-fun b!1326385 () Bool)

(assert (=> b!1326385 (= e!756219 (= (apply!1038 lt!590101 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326386 () Bool)

(declare-fun res!880023 () Bool)

(assert (=> b!1326386 (=> (not res!880023) (not e!756215))))

(assert (=> b!1326386 (= res!880023 e!756218)))

(declare-fun c!126076 () Bool)

(assert (=> b!1326386 (= c!126076 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1326387 () Bool)

(declare-fun lt!590107 () Unit!43597)

(assert (=> b!1326387 (= e!756220 lt!590107)))

(declare-fun lt!590111 () ListLongMap!21187)

(assert (=> b!1326387 (= lt!590111 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590097 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590097 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590108 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590108 (select (arr!43246 _keys!1609) from!2000))))

(declare-fun lt!590093 () Unit!43597)

(declare-fun addStillContains!1167 (ListLongMap!21187 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43597)

(assert (=> b!1326387 (= lt!590093 (addStillContains!1167 lt!590111 lt!590097 zeroValue!1279 lt!590108))))

(assert (=> b!1326387 (contains!8775 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279)) lt!590108)))

(declare-fun lt!590106 () Unit!43597)

(assert (=> b!1326387 (= lt!590106 lt!590093)))

(declare-fun lt!590096 () ListLongMap!21187)

(assert (=> b!1326387 (= lt!590096 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590095 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590095 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590100 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590100 (select (arr!43246 _keys!1609) from!2000))))

(declare-fun lt!590099 () Unit!43597)

(declare-fun addApplyDifferent!567 (ListLongMap!21187 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43597)

(assert (=> b!1326387 (= lt!590099 (addApplyDifferent!567 lt!590096 lt!590095 minValue!1279 lt!590100))))

(assert (=> b!1326387 (= (apply!1038 (+!4655 lt!590096 (tuple2!23523 lt!590095 minValue!1279)) lt!590100) (apply!1038 lt!590096 lt!590100))))

(declare-fun lt!590098 () Unit!43597)

(assert (=> b!1326387 (= lt!590098 lt!590099)))

(declare-fun lt!590103 () ListLongMap!21187)

(assert (=> b!1326387 (= lt!590103 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590114 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590094 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590094 (select (arr!43246 _keys!1609) from!2000))))

(declare-fun lt!590109 () Unit!43597)

(assert (=> b!1326387 (= lt!590109 (addApplyDifferent!567 lt!590103 lt!590114 zeroValue!1279 lt!590094))))

(assert (=> b!1326387 (= (apply!1038 (+!4655 lt!590103 (tuple2!23523 lt!590114 zeroValue!1279)) lt!590094) (apply!1038 lt!590103 lt!590094))))

(declare-fun lt!590112 () Unit!43597)

(assert (=> b!1326387 (= lt!590112 lt!590109)))

(declare-fun lt!590105 () ListLongMap!21187)

(assert (=> b!1326387 (= lt!590105 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590110 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590110 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590104 () (_ BitVec 64))

(assert (=> b!1326387 (= lt!590104 (select (arr!43246 _keys!1609) from!2000))))

(assert (=> b!1326387 (= lt!590107 (addApplyDifferent!567 lt!590105 lt!590110 minValue!1279 lt!590104))))

(assert (=> b!1326387 (= (apply!1038 (+!4655 lt!590105 (tuple2!23523 lt!590110 minValue!1279)) lt!590104) (apply!1038 lt!590105 lt!590104))))

(declare-fun bm!64773 () Bool)

(assert (=> bm!64773 (= call!64771 call!64772)))

(assert (= (and d!143355 c!126075) b!1326369))

(assert (= (and d!143355 (not c!126075)) b!1326370))

(assert (= (and b!1326370 c!126077) b!1326374))

(assert (= (and b!1326370 (not c!126077)) b!1326373))

(assert (= (and b!1326373 c!126078) b!1326383))

(assert (= (and b!1326373 (not c!126078)) b!1326376))

(assert (= (or b!1326383 b!1326376) bm!64773))

(assert (= (or b!1326374 bm!64773) bm!64770))

(assert (= (or b!1326374 b!1326383) bm!64772))

(assert (= (or b!1326369 bm!64770) bm!64771))

(assert (= (or b!1326369 bm!64772) bm!64767))

(assert (= (and d!143355 res!880015) b!1326368))

(assert (= (and d!143355 c!126073) b!1326387))

(assert (= (and d!143355 (not c!126073)) b!1326380))

(assert (= (and d!143355 res!880017) b!1326382))

(assert (= (and b!1326382 res!880020) b!1326372))

(assert (= (and b!1326382 (not res!880016)) b!1326384))

(assert (= (and b!1326384 res!880022) b!1326375))

(assert (= (and b!1326382 res!880018) b!1326386))

(assert (= (and b!1326386 c!126076) b!1326377))

(assert (= (and b!1326386 (not c!126076)) b!1326367))

(assert (= (and b!1326377 res!880019) b!1326381))

(assert (= (or b!1326377 b!1326367) bm!64768))

(assert (= (and b!1326386 res!880023) b!1326378))

(assert (= (and b!1326378 c!126074) b!1326379))

(assert (= (and b!1326378 (not c!126074)) b!1326371))

(assert (= (and b!1326379 res!880021) b!1326385))

(assert (= (or b!1326379 b!1326371) bm!64769))

(declare-fun b_lambda!23711 () Bool)

(assert (=> (not b_lambda!23711) (not b!1326375)))

(assert (=> b!1326375 t!44592))

(declare-fun b_and!49013 () Bool)

(assert (= b_and!49011 (and (=> t!44592 result!24509) b_and!49013)))

(declare-fun m!1215377 () Bool)

(assert (=> b!1326387 m!1215377))

(declare-fun m!1215379 () Bool)

(assert (=> b!1326387 m!1215379))

(assert (=> b!1326387 m!1215379))

(declare-fun m!1215381 () Bool)

(assert (=> b!1326387 m!1215381))

(declare-fun m!1215383 () Bool)

(assert (=> b!1326387 m!1215383))

(declare-fun m!1215385 () Bool)

(assert (=> b!1326387 m!1215385))

(declare-fun m!1215387 () Bool)

(assert (=> b!1326387 m!1215387))

(declare-fun m!1215389 () Bool)

(assert (=> b!1326387 m!1215389))

(assert (=> b!1326387 m!1215387))

(assert (=> b!1326387 m!1215195))

(declare-fun m!1215391 () Bool)

(assert (=> b!1326387 m!1215391))

(declare-fun m!1215393 () Bool)

(assert (=> b!1326387 m!1215393))

(declare-fun m!1215395 () Bool)

(assert (=> b!1326387 m!1215395))

(declare-fun m!1215397 () Bool)

(assert (=> b!1326387 m!1215397))

(declare-fun m!1215399 () Bool)

(assert (=> b!1326387 m!1215399))

(declare-fun m!1215401 () Bool)

(assert (=> b!1326387 m!1215401))

(assert (=> b!1326387 m!1215391))

(declare-fun m!1215403 () Bool)

(assert (=> b!1326387 m!1215403))

(declare-fun m!1215405 () Bool)

(assert (=> b!1326387 m!1215405))

(assert (=> b!1326387 m!1215397))

(declare-fun m!1215407 () Bool)

(assert (=> b!1326387 m!1215407))

(declare-fun m!1215409 () Bool)

(assert (=> b!1326385 m!1215409))

(declare-fun m!1215411 () Bool)

(assert (=> bm!64768 m!1215411))

(declare-fun m!1215413 () Bool)

(assert (=> bm!64769 m!1215413))

(assert (=> d!143355 m!1215173))

(assert (=> b!1326375 m!1215191))

(assert (=> b!1326375 m!1215183))

(assert (=> b!1326375 m!1215197))

(assert (=> b!1326375 m!1215195))

(declare-fun m!1215415 () Bool)

(assert (=> b!1326375 m!1215415))

(assert (=> b!1326375 m!1215183))

(assert (=> b!1326375 m!1215191))

(assert (=> b!1326375 m!1215195))

(assert (=> bm!64771 m!1215393))

(declare-fun m!1215417 () Bool)

(assert (=> bm!64767 m!1215417))

(declare-fun m!1215419 () Bool)

(assert (=> b!1326369 m!1215419))

(declare-fun m!1215421 () Bool)

(assert (=> b!1326381 m!1215421))

(assert (=> b!1326372 m!1215195))

(assert (=> b!1326372 m!1215195))

(assert (=> b!1326372 m!1215205))

(assert (=> b!1326368 m!1215195))

(assert (=> b!1326368 m!1215195))

(assert (=> b!1326368 m!1215205))

(assert (=> b!1326384 m!1215195))

(assert (=> b!1326384 m!1215195))

(declare-fun m!1215423 () Bool)

(assert (=> b!1326384 m!1215423))

(assert (=> b!1326166 d!143355))

(declare-fun d!143357 () Bool)

(assert (=> d!143357 (= (validKeyInArray!0 (select (arr!43246 _keys!1609) from!2000)) (and (not (= (select (arr!43246 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43246 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326169 d!143357))

(declare-fun d!143359 () Bool)

(assert (=> d!143359 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!112024 d!143359))

(declare-fun d!143361 () Bool)

(assert (=> d!143361 (= (array_inv!32913 _keys!1609) (bvsge (size!43797 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!112024 d!143361))

(declare-fun d!143363 () Bool)

(assert (=> d!143363 (= (array_inv!32914 _values!1337) (bvsge (size!43798 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!112024 d!143363))

(declare-fun b!1326398 () Bool)

(declare-fun e!756239 () Bool)

(declare-fun call!64779 () Bool)

(assert (=> b!1326398 (= e!756239 call!64779)))

(declare-fun b!1326399 () Bool)

(assert (=> b!1326399 (= e!756239 call!64779)))

(declare-fun b!1326400 () Bool)

(declare-fun e!756236 () Bool)

(assert (=> b!1326400 (= e!756236 e!756239)))

(declare-fun c!126081 () Bool)

(assert (=> b!1326400 (= c!126081 (validKeyInArray!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64776 () Bool)

(assert (=> bm!64776 (= call!64779 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126081 (Cons!30670 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) Nil!30671) Nil!30671)))))

(declare-fun b!1326401 () Bool)

(declare-fun e!756238 () Bool)

(assert (=> b!1326401 (= e!756238 e!756236)))

(declare-fun res!880031 () Bool)

(assert (=> b!1326401 (=> (not res!880031) (not e!756236))))

(declare-fun e!756237 () Bool)

(assert (=> b!1326401 (= res!880031 (not e!756237))))

(declare-fun res!880030 () Bool)

(assert (=> b!1326401 (=> (not res!880030) (not e!756237))))

(assert (=> b!1326401 (= res!880030 (validKeyInArray!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326402 () Bool)

(declare-fun contains!8779 (List!30674 (_ BitVec 64)) Bool)

(assert (=> b!1326402 (= e!756237 (contains!8779 Nil!30671 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143365 () Bool)

(declare-fun res!880032 () Bool)

(assert (=> d!143365 (=> res!880032 e!756238)))

(assert (=> d!143365 (= res!880032 (bvsge #b00000000000000000000000000000000 (size!43797 _keys!1609)))))

(assert (=> d!143365 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30671) e!756238)))

(assert (= (and d!143365 (not res!880032)) b!1326401))

(assert (= (and b!1326401 res!880030) b!1326402))

(assert (= (and b!1326401 res!880031) b!1326400))

(assert (= (and b!1326400 c!126081) b!1326399))

(assert (= (and b!1326400 (not c!126081)) b!1326398))

(assert (= (or b!1326399 b!1326398) bm!64776))

(assert (=> b!1326400 m!1215359))

(assert (=> b!1326400 m!1215359))

(assert (=> b!1326400 m!1215361))

(assert (=> bm!64776 m!1215359))

(declare-fun m!1215425 () Bool)

(assert (=> bm!64776 m!1215425))

(assert (=> b!1326401 m!1215359))

(assert (=> b!1326401 m!1215359))

(assert (=> b!1326401 m!1215361))

(assert (=> b!1326402 m!1215359))

(assert (=> b!1326402 m!1215359))

(declare-fun m!1215427 () Bool)

(assert (=> b!1326402 m!1215427))

(assert (=> b!1326173 d!143365))

(declare-fun b!1326410 () Bool)

(declare-fun e!756245 () Bool)

(assert (=> b!1326410 (= e!756245 tp_is_empty!36277)))

(declare-fun condMapEmpty!56072 () Bool)

(declare-fun mapDefault!56072 () ValueCell!17240)

(assert (=> mapNonEmpty!56063 (= condMapEmpty!56072 (= mapRest!56063 ((as const (Array (_ BitVec 32) ValueCell!17240)) mapDefault!56072)))))

(declare-fun mapRes!56072 () Bool)

(assert (=> mapNonEmpty!56063 (= tp!106846 (and e!756245 mapRes!56072))))

(declare-fun mapIsEmpty!56072 () Bool)

(assert (=> mapIsEmpty!56072 mapRes!56072))

(declare-fun b!1326409 () Bool)

(declare-fun e!756244 () Bool)

(assert (=> b!1326409 (= e!756244 tp_is_empty!36277)))

(declare-fun mapNonEmpty!56072 () Bool)

(declare-fun tp!106862 () Bool)

(assert (=> mapNonEmpty!56072 (= mapRes!56072 (and tp!106862 e!756244))))

(declare-fun mapValue!56072 () ValueCell!17240)

(declare-fun mapKey!56072 () (_ BitVec 32))

(declare-fun mapRest!56072 () (Array (_ BitVec 32) ValueCell!17240))

(assert (=> mapNonEmpty!56072 (= mapRest!56063 (store mapRest!56072 mapKey!56072 mapValue!56072))))

(assert (= (and mapNonEmpty!56063 condMapEmpty!56072) mapIsEmpty!56072))

(assert (= (and mapNonEmpty!56063 (not condMapEmpty!56072)) mapNonEmpty!56072))

(assert (= (and mapNonEmpty!56072 ((_ is ValueCellFull!17240) mapValue!56072)) b!1326409))

(assert (= (and mapNonEmpty!56063 ((_ is ValueCellFull!17240) mapDefault!56072)) b!1326410))

(declare-fun m!1215429 () Bool)

(assert (=> mapNonEmpty!56072 m!1215429))

(declare-fun b_lambda!23713 () Bool)

(assert (= b_lambda!23707 (or (and start!112024 b_free!30457) b_lambda!23713)))

(declare-fun b_lambda!23715 () Bool)

(assert (= b_lambda!23709 (or (and start!112024 b_free!30457) b_lambda!23715)))

(declare-fun b_lambda!23717 () Bool)

(assert (= b_lambda!23711 (or (and start!112024 b_free!30457) b_lambda!23717)))

(check-sat (not b!1326262) (not b!1326295) (not b_next!30457) (not b!1326307) (not b!1326385) (not d!143355) (not b!1326387) (not b!1326294) (not b!1326369) (not b!1326368) (not b!1326375) (not d!143353) (not bm!64767) (not bm!64749) (not b!1326300) (not b_lambda!23713) (not b!1326319) (not b!1326309) (not b!1326372) (not d!143339) (not mapNonEmpty!56072) (not bm!64771) tp_is_empty!36277 (not b!1326324) (not b!1326269) (not b!1326297) (not b_lambda!23717) (not d!143349) (not b!1326400) (not b!1326304) (not b!1326298) (not bm!64752) (not b!1326268) (not d!143347) b_and!49013 (not bm!64768) (not b!1326402) (not b!1326263) (not bm!64769) (not d!143345) (not b_lambda!23705) (not b!1326296) (not b!1326306) (not b!1326305) (not b!1326255) (not b!1326257) (not d!143341) (not b_lambda!23715) (not b!1326308) (not b!1326322) (not b!1326321) (not b!1326384) (not bm!64776) (not b!1326381) (not b!1326401))
(check-sat b_and!49013 (not b_next!30457))
(get-model)

(declare-fun d!143367 () Bool)

(declare-fun get!21807 (Option!759) V!53473)

(assert (=> d!143367 (= (apply!1038 lt!590101 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21807 (getValueByKey!708 (toList!10609 lt!590101) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37911 () Bool)

(assert (= bs!37911 d!143367))

(declare-fun m!1215431 () Bool)

(assert (=> bs!37911 m!1215431))

(assert (=> bs!37911 m!1215431))

(declare-fun m!1215433 () Bool)

(assert (=> bs!37911 m!1215433))

(assert (=> b!1326381 d!143367))

(declare-fun d!143369 () Bool)

(assert (=> d!143369 (= (validKeyInArray!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)) (and (not (= (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326400 d!143369))

(declare-fun b!1326411 () Bool)

(declare-fun e!756249 () Bool)

(declare-fun call!64780 () Bool)

(assert (=> b!1326411 (= e!756249 call!64780)))

(declare-fun b!1326412 () Bool)

(assert (=> b!1326412 (= e!756249 call!64780)))

(declare-fun b!1326413 () Bool)

(declare-fun e!756246 () Bool)

(assert (=> b!1326413 (= e!756246 e!756249)))

(declare-fun c!126082 () Bool)

(assert (=> b!1326413 (= c!126082 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64777 () Bool)

(assert (=> bm!64777 (= call!64780 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126082 (Cons!30670 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126081 (Cons!30670 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) Nil!30671) Nil!30671)) (ite c!126081 (Cons!30670 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) Nil!30671) Nil!30671))))))

(declare-fun b!1326414 () Bool)

(declare-fun e!756248 () Bool)

(assert (=> b!1326414 (= e!756248 e!756246)))

(declare-fun res!880034 () Bool)

(assert (=> b!1326414 (=> (not res!880034) (not e!756246))))

(declare-fun e!756247 () Bool)

(assert (=> b!1326414 (= res!880034 (not e!756247))))

(declare-fun res!880033 () Bool)

(assert (=> b!1326414 (=> (not res!880033) (not e!756247))))

(assert (=> b!1326414 (= res!880033 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1326415 () Bool)

(assert (=> b!1326415 (= e!756247 (contains!8779 (ite c!126081 (Cons!30670 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) Nil!30671) Nil!30671) (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143371 () Bool)

(declare-fun res!880035 () Bool)

(assert (=> d!143371 (=> res!880035 e!756248)))

(assert (=> d!143371 (= res!880035 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(assert (=> d!143371 (= (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126081 (Cons!30670 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) Nil!30671) Nil!30671)) e!756248)))

(assert (= (and d!143371 (not res!880035)) b!1326414))

(assert (= (and b!1326414 res!880033) b!1326415))

(assert (= (and b!1326414 res!880034) b!1326413))

(assert (= (and b!1326413 c!126082) b!1326412))

(assert (= (and b!1326413 (not c!126082)) b!1326411))

(assert (= (or b!1326412 b!1326411) bm!64777))

(declare-fun m!1215435 () Bool)

(assert (=> b!1326413 m!1215435))

(assert (=> b!1326413 m!1215435))

(declare-fun m!1215437 () Bool)

(assert (=> b!1326413 m!1215437))

(assert (=> bm!64777 m!1215435))

(declare-fun m!1215439 () Bool)

(assert (=> bm!64777 m!1215439))

(assert (=> b!1326414 m!1215435))

(assert (=> b!1326414 m!1215435))

(assert (=> b!1326414 m!1215437))

(assert (=> b!1326415 m!1215435))

(assert (=> b!1326415 m!1215435))

(declare-fun m!1215441 () Bool)

(assert (=> b!1326415 m!1215441))

(assert (=> bm!64776 d!143371))

(declare-fun d!143373 () Bool)

(assert (=> d!143373 (= (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (and (not (= (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326305 d!143373))

(declare-fun d!143375 () Bool)

(declare-fun e!756250 () Bool)

(assert (=> d!143375 e!756250))

(declare-fun res!880036 () Bool)

(assert (=> d!143375 (=> res!880036 e!756250)))

(declare-fun lt!590118 () Bool)

(assert (=> d!143375 (= res!880036 (not lt!590118))))

(declare-fun lt!590117 () Bool)

(assert (=> d!143375 (= lt!590118 lt!590117)))

(declare-fun lt!590116 () Unit!43597)

(declare-fun e!756251 () Unit!43597)

(assert (=> d!143375 (= lt!590116 e!756251)))

(declare-fun c!126083 () Bool)

(assert (=> d!143375 (= c!126083 lt!590117)))

(assert (=> d!143375 (= lt!590117 (containsKey!734 (toList!10609 lt!590027) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143375 (= (contains!8775 lt!590027 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590118)))

(declare-fun b!1326416 () Bool)

(declare-fun lt!590115 () Unit!43597)

(assert (=> b!1326416 (= e!756251 lt!590115)))

(assert (=> b!1326416 (= lt!590115 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590027) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1326416 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590027) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326417 () Bool)

(declare-fun Unit!43602 () Unit!43597)

(assert (=> b!1326417 (= e!756251 Unit!43602)))

(declare-fun b!1326418 () Bool)

(assert (=> b!1326418 (= e!756250 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590027) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143375 c!126083) b!1326416))

(assert (= (and d!143375 (not c!126083)) b!1326417))

(assert (= (and d!143375 (not res!880036)) b!1326418))

(declare-fun m!1215443 () Bool)

(assert (=> d!143375 m!1215443))

(declare-fun m!1215445 () Bool)

(assert (=> b!1326416 m!1215445))

(declare-fun m!1215447 () Bool)

(assert (=> b!1326416 m!1215447))

(assert (=> b!1326416 m!1215447))

(declare-fun m!1215449 () Bool)

(assert (=> b!1326416 m!1215449))

(assert (=> b!1326418 m!1215447))

(assert (=> b!1326418 m!1215447))

(assert (=> b!1326418 m!1215449))

(assert (=> b!1326304 d!143375))

(declare-fun d!143377 () Bool)

(declare-fun e!756252 () Bool)

(assert (=> d!143377 e!756252))

(declare-fun res!880037 () Bool)

(assert (=> d!143377 (=> res!880037 e!756252)))

(declare-fun lt!590122 () Bool)

(assert (=> d!143377 (= res!880037 (not lt!590122))))

(declare-fun lt!590121 () Bool)

(assert (=> d!143377 (= lt!590122 lt!590121)))

(declare-fun lt!590120 () Unit!43597)

(declare-fun e!756253 () Unit!43597)

(assert (=> d!143377 (= lt!590120 e!756253)))

(declare-fun c!126084 () Bool)

(assert (=> d!143377 (= c!126084 lt!590121)))

(assert (=> d!143377 (= lt!590121 (containsKey!734 (toList!10609 lt!590101) (select (arr!43246 _keys!1609) from!2000)))))

(assert (=> d!143377 (= (contains!8775 lt!590101 (select (arr!43246 _keys!1609) from!2000)) lt!590122)))

(declare-fun b!1326419 () Bool)

(declare-fun lt!590119 () Unit!43597)

(assert (=> b!1326419 (= e!756253 lt!590119)))

(assert (=> b!1326419 (= lt!590119 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590101) (select (arr!43246 _keys!1609) from!2000)))))

(assert (=> b!1326419 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590101) (select (arr!43246 _keys!1609) from!2000)))))

(declare-fun b!1326420 () Bool)

(declare-fun Unit!43603 () Unit!43597)

(assert (=> b!1326420 (= e!756253 Unit!43603)))

(declare-fun b!1326421 () Bool)

(assert (=> b!1326421 (= e!756252 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590101) (select (arr!43246 _keys!1609) from!2000))))))

(assert (= (and d!143377 c!126084) b!1326419))

(assert (= (and d!143377 (not c!126084)) b!1326420))

(assert (= (and d!143377 (not res!880037)) b!1326421))

(assert (=> d!143377 m!1215195))

(declare-fun m!1215451 () Bool)

(assert (=> d!143377 m!1215451))

(assert (=> b!1326419 m!1215195))

(declare-fun m!1215453 () Bool)

(assert (=> b!1326419 m!1215453))

(assert (=> b!1326419 m!1215195))

(declare-fun m!1215455 () Bool)

(assert (=> b!1326419 m!1215455))

(assert (=> b!1326419 m!1215455))

(declare-fun m!1215457 () Bool)

(assert (=> b!1326419 m!1215457))

(assert (=> b!1326421 m!1215195))

(assert (=> b!1326421 m!1215455))

(assert (=> b!1326421 m!1215455))

(assert (=> b!1326421 m!1215457))

(assert (=> b!1326384 d!143377))

(declare-fun d!143379 () Bool)

(declare-fun lt!590125 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!652 (List!30674) (InoxSet (_ BitVec 64)))

(assert (=> d!143379 (= lt!590125 (select (content!652 Nil!30671) (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun e!756259 () Bool)

(assert (=> d!143379 (= lt!590125 e!756259)))

(declare-fun res!880043 () Bool)

(assert (=> d!143379 (=> (not res!880043) (not e!756259))))

(assert (=> d!143379 (= res!880043 ((_ is Cons!30670) Nil!30671))))

(assert (=> d!143379 (= (contains!8779 Nil!30671 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)) lt!590125)))

(declare-fun b!1326426 () Bool)

(declare-fun e!756258 () Bool)

(assert (=> b!1326426 (= e!756259 e!756258)))

(declare-fun res!880042 () Bool)

(assert (=> b!1326426 (=> res!880042 e!756258)))

(assert (=> b!1326426 (= res!880042 (= (h!31888 Nil!30671) (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326427 () Bool)

(assert (=> b!1326427 (= e!756258 (contains!8779 (t!44594 Nil!30671) (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143379 res!880043) b!1326426))

(assert (= (and b!1326426 (not res!880042)) b!1326427))

(declare-fun m!1215459 () Bool)

(assert (=> d!143379 m!1215459))

(assert (=> d!143379 m!1215359))

(declare-fun m!1215461 () Bool)

(assert (=> d!143379 m!1215461))

(assert (=> b!1326427 m!1215359))

(declare-fun m!1215463 () Bool)

(assert (=> b!1326427 m!1215463))

(assert (=> b!1326402 d!143379))

(assert (=> b!1326319 d!143369))

(declare-fun d!143381 () Bool)

(assert (=> d!143381 (= (get!21806 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1326269 d!143381))

(declare-fun d!143383 () Bool)

(declare-fun c!126089 () Bool)

(assert (=> d!143383 (= c!126089 (and ((_ is Cons!30669) (toList!10609 lt!590030)) (= (_1!11772 (h!31887 (toList!10609 lt!590030))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun e!756264 () Option!759)

(assert (=> d!143383 (= (getValueByKey!708 (toList!10609 lt!590030) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) e!756264)))

(declare-fun b!1326437 () Bool)

(declare-fun e!756265 () Option!759)

(assert (=> b!1326437 (= e!756264 e!756265)))

(declare-fun c!126090 () Bool)

(assert (=> b!1326437 (= c!126090 (and ((_ is Cons!30669) (toList!10609 lt!590030)) (not (= (_1!11772 (h!31887 (toList!10609 lt!590030))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1326436 () Bool)

(assert (=> b!1326436 (= e!756264 (Some!758 (_2!11772 (h!31887 (toList!10609 lt!590030)))))))

(declare-fun b!1326439 () Bool)

(assert (=> b!1326439 (= e!756265 None!757)))

(declare-fun b!1326438 () Bool)

(assert (=> b!1326438 (= e!756265 (getValueByKey!708 (t!44593 (toList!10609 lt!590030)) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143383 c!126089) b!1326436))

(assert (= (and d!143383 (not c!126089)) b!1326437))

(assert (= (and b!1326437 c!126090) b!1326438))

(assert (= (and b!1326437 (not c!126090)) b!1326439))

(declare-fun m!1215465 () Bool)

(assert (=> b!1326438 m!1215465))

(assert (=> b!1326306 d!143383))

(assert (=> b!1326368 d!143357))

(declare-fun d!143385 () Bool)

(declare-fun e!756266 () Bool)

(assert (=> d!143385 e!756266))

(declare-fun res!880044 () Bool)

(assert (=> d!143385 (=> (not res!880044) (not e!756266))))

(declare-fun lt!590128 () ListLongMap!21187)

(assert (=> d!143385 (= res!880044 (contains!8775 lt!590128 (_1!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!590127 () List!30673)

(assert (=> d!143385 (= lt!590128 (ListLongMap!21188 lt!590127))))

(declare-fun lt!590126 () Unit!43597)

(declare-fun lt!590129 () Unit!43597)

(assert (=> d!143385 (= lt!590126 lt!590129)))

(assert (=> d!143385 (= (getValueByKey!708 lt!590127 (_1!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!758 (_2!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143385 (= lt!590129 (lemmaContainsTupThenGetReturnValue!358 lt!590127 (_1!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143385 (= lt!590127 (insertStrictlySorted!487 (toList!10609 (ite c!126075 call!64775 (ite c!126077 call!64772 call!64771))) (_1!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143385 (= (+!4655 (ite c!126075 call!64775 (ite c!126077 call!64772 call!64771)) (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590128)))

(declare-fun b!1326440 () Bool)

(declare-fun res!880045 () Bool)

(assert (=> b!1326440 (=> (not res!880045) (not e!756266))))

(assert (=> b!1326440 (= res!880045 (= (getValueByKey!708 (toList!10609 lt!590128) (_1!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!758 (_2!11772 (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1326441 () Bool)

(assert (=> b!1326441 (= e!756266 (contains!8778 (toList!10609 lt!590128) (ite (or c!126075 c!126077) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143385 res!880044) b!1326440))

(assert (= (and b!1326440 res!880045) b!1326441))

(declare-fun m!1215467 () Bool)

(assert (=> d!143385 m!1215467))

(declare-fun m!1215469 () Bool)

(assert (=> d!143385 m!1215469))

(declare-fun m!1215471 () Bool)

(assert (=> d!143385 m!1215471))

(declare-fun m!1215473 () Bool)

(assert (=> d!143385 m!1215473))

(declare-fun m!1215475 () Bool)

(assert (=> b!1326440 m!1215475))

(declare-fun m!1215477 () Bool)

(assert (=> b!1326441 m!1215477))

(assert (=> bm!64767 d!143385))

(declare-fun d!143387 () Bool)

(declare-fun res!880050 () Bool)

(declare-fun e!756271 () Bool)

(assert (=> d!143387 (=> res!880050 e!756271)))

(assert (=> d!143387 (= res!880050 (and ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (= (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(assert (=> d!143387 (= (containsKey!734 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) e!756271)))

(declare-fun b!1326446 () Bool)

(declare-fun e!756272 () Bool)

(assert (=> b!1326446 (= e!756271 e!756272)))

(declare-fun res!880051 () Bool)

(assert (=> b!1326446 (=> (not res!880051) (not e!756272))))

(assert (=> b!1326446 (= res!880051 (and (or (not ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) (bvsle (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)) ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (bvslt (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(declare-fun b!1326447 () Bool)

(assert (=> b!1326447 (= e!756272 (containsKey!734 (t!44593 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) k0!1164))))

(assert (= (and d!143387 (not res!880050)) b!1326446))

(assert (= (and b!1326446 res!880051) b!1326447))

(declare-fun m!1215479 () Bool)

(assert (=> b!1326447 m!1215479))

(assert (=> d!143339 d!143387))

(declare-fun d!143389 () Bool)

(assert (=> d!143389 (= (get!21805 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!20838 (select (arr!43247 _values!1337) from!2000)))))

(assert (=> b!1326268 d!143389))

(declare-fun bm!64778 () Bool)

(declare-fun call!64781 () Bool)

(assert (=> bm!64778 (= call!64781 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun d!143391 () Bool)

(declare-fun res!880052 () Bool)

(declare-fun e!756275 () Bool)

(assert (=> d!143391 (=> res!880052 e!756275)))

(assert (=> d!143391 (= res!880052 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(assert (=> d!143391 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019) e!756275)))

(declare-fun b!1326448 () Bool)

(declare-fun e!756274 () Bool)

(assert (=> b!1326448 (= e!756274 call!64781)))

(declare-fun b!1326449 () Bool)

(declare-fun e!756273 () Bool)

(assert (=> b!1326449 (= e!756275 e!756273)))

(declare-fun c!126091 () Bool)

(assert (=> b!1326449 (= c!126091 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1326450 () Bool)

(assert (=> b!1326450 (= e!756273 call!64781)))

(declare-fun b!1326451 () Bool)

(assert (=> b!1326451 (= e!756273 e!756274)))

(declare-fun lt!590132 () (_ BitVec 64))

(assert (=> b!1326451 (= lt!590132 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!590131 () Unit!43597)

(assert (=> b!1326451 (= lt!590131 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590132 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1326451 (arrayContainsKey!0 _keys!1609 lt!590132 #b00000000000000000000000000000000)))

(declare-fun lt!590130 () Unit!43597)

(assert (=> b!1326451 (= lt!590130 lt!590131)))

(declare-fun res!880053 () Bool)

(assert (=> b!1326451 (= res!880053 (= (seekEntryOrOpen!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1609 mask!2019) (Found!9996 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1326451 (=> (not res!880053) (not e!756274))))

(assert (= (and d!143391 (not res!880052)) b!1326449))

(assert (= (and b!1326449 c!126091) b!1326451))

(assert (= (and b!1326449 (not c!126091)) b!1326450))

(assert (= (and b!1326451 res!880053) b!1326448))

(assert (= (or b!1326448 b!1326450) bm!64778))

(declare-fun m!1215481 () Bool)

(assert (=> bm!64778 m!1215481))

(assert (=> b!1326449 m!1215435))

(assert (=> b!1326449 m!1215435))

(assert (=> b!1326449 m!1215437))

(assert (=> b!1326451 m!1215435))

(declare-fun m!1215483 () Bool)

(assert (=> b!1326451 m!1215483))

(declare-fun m!1215485 () Bool)

(assert (=> b!1326451 m!1215485))

(assert (=> b!1326451 m!1215435))

(declare-fun m!1215487 () Bool)

(assert (=> b!1326451 m!1215487))

(assert (=> bm!64752 d!143391))

(assert (=> b!1326401 d!143369))

(declare-fun d!143393 () Bool)

(declare-fun e!756276 () Bool)

(assert (=> d!143393 e!756276))

(declare-fun res!880054 () Bool)

(assert (=> d!143393 (=> res!880054 e!756276)))

(declare-fun lt!590136 () Bool)

(assert (=> d!143393 (= res!880054 (not lt!590136))))

(declare-fun lt!590135 () Bool)

(assert (=> d!143393 (= lt!590136 lt!590135)))

(declare-fun lt!590134 () Unit!43597)

(declare-fun e!756277 () Unit!43597)

(assert (=> d!143393 (= lt!590134 e!756277)))

(declare-fun c!126092 () Bool)

(assert (=> d!143393 (= c!126092 lt!590135)))

(assert (=> d!143393 (= lt!590135 (containsKey!734 (toList!10609 lt!590101) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143393 (= (contains!8775 lt!590101 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590136)))

(declare-fun b!1326452 () Bool)

(declare-fun lt!590133 () Unit!43597)

(assert (=> b!1326452 (= e!756277 lt!590133)))

(assert (=> b!1326452 (= lt!590133 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590101) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1326452 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590101) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326453 () Bool)

(declare-fun Unit!43604 () Unit!43597)

(assert (=> b!1326453 (= e!756277 Unit!43604)))

(declare-fun b!1326454 () Bool)

(assert (=> b!1326454 (= e!756276 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590101) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143393 c!126092) b!1326452))

(assert (= (and d!143393 (not c!126092)) b!1326453))

(assert (= (and d!143393 (not res!880054)) b!1326454))

(declare-fun m!1215489 () Bool)

(assert (=> d!143393 m!1215489))

(declare-fun m!1215491 () Bool)

(assert (=> b!1326452 m!1215491))

(assert (=> b!1326452 m!1215431))

(assert (=> b!1326452 m!1215431))

(declare-fun m!1215493 () Bool)

(assert (=> b!1326452 m!1215493))

(assert (=> b!1326454 m!1215431))

(assert (=> b!1326454 m!1215431))

(assert (=> b!1326454 m!1215493))

(assert (=> bm!64768 d!143393))

(declare-fun d!143395 () Bool)

(declare-fun e!756278 () Bool)

(assert (=> d!143395 e!756278))

(declare-fun res!880055 () Bool)

(assert (=> d!143395 (=> res!880055 e!756278)))

(declare-fun lt!590140 () Bool)

(assert (=> d!143395 (= res!880055 (not lt!590140))))

(declare-fun lt!590139 () Bool)

(assert (=> d!143395 (= lt!590140 lt!590139)))

(declare-fun lt!590138 () Unit!43597)

(declare-fun e!756279 () Unit!43597)

(assert (=> d!143395 (= lt!590138 e!756279)))

(declare-fun c!126093 () Bool)

(assert (=> d!143395 (= c!126093 lt!590139)))

(assert (=> d!143395 (= lt!590139 (containsKey!734 (toList!10609 lt!590005) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143395 (= (contains!8775 lt!590005 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!590140)))

(declare-fun b!1326455 () Bool)

(declare-fun lt!590137 () Unit!43597)

(assert (=> b!1326455 (= e!756279 lt!590137)))

(assert (=> b!1326455 (= lt!590137 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590005) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1326455 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590005) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1326456 () Bool)

(declare-fun Unit!43605 () Unit!43597)

(assert (=> b!1326456 (= e!756279 Unit!43605)))

(declare-fun b!1326457 () Bool)

(assert (=> b!1326457 (= e!756278 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590005) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143395 c!126093) b!1326455))

(assert (= (and d!143395 (not c!126093)) b!1326456))

(assert (= (and d!143395 (not res!880055)) b!1326457))

(declare-fun m!1215495 () Bool)

(assert (=> d!143395 m!1215495))

(declare-fun m!1215497 () Bool)

(assert (=> b!1326455 m!1215497))

(assert (=> b!1326455 m!1215297))

(assert (=> b!1326455 m!1215297))

(declare-fun m!1215499 () Bool)

(assert (=> b!1326455 m!1215499))

(assert (=> b!1326457 m!1215297))

(assert (=> b!1326457 m!1215297))

(assert (=> b!1326457 m!1215499))

(assert (=> d!143341 d!143395))

(declare-fun c!126094 () Bool)

(declare-fun d!143397 () Bool)

(assert (=> d!143397 (= c!126094 (and ((_ is Cons!30669) lt!590004) (= (_1!11772 (h!31887 lt!590004)) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!756280 () Option!759)

(assert (=> d!143397 (= (getValueByKey!708 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!756280)))

(declare-fun b!1326459 () Bool)

(declare-fun e!756281 () Option!759)

(assert (=> b!1326459 (= e!756280 e!756281)))

(declare-fun c!126095 () Bool)

(assert (=> b!1326459 (= c!126095 (and ((_ is Cons!30669) lt!590004) (not (= (_1!11772 (h!31887 lt!590004)) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1326458 () Bool)

(assert (=> b!1326458 (= e!756280 (Some!758 (_2!11772 (h!31887 lt!590004))))))

(declare-fun b!1326461 () Bool)

(assert (=> b!1326461 (= e!756281 None!757)))

(declare-fun b!1326460 () Bool)

(assert (=> b!1326460 (= e!756281 (getValueByKey!708 (t!44593 lt!590004) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!143397 c!126094) b!1326458))

(assert (= (and d!143397 (not c!126094)) b!1326459))

(assert (= (and b!1326459 c!126095) b!1326460))

(assert (= (and b!1326459 (not c!126095)) b!1326461))

(declare-fun m!1215501 () Bool)

(assert (=> b!1326460 m!1215501))

(assert (=> d!143341 d!143397))

(declare-fun d!143399 () Bool)

(assert (=> d!143399 (= (getValueByKey!708 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!590143 () Unit!43597)

(declare-fun choose!1948 (List!30673 (_ BitVec 64) V!53473) Unit!43597)

(assert (=> d!143399 (= lt!590143 (choose!1948 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!756284 () Bool)

(assert (=> d!143399 e!756284))

(declare-fun res!880060 () Bool)

(assert (=> d!143399 (=> (not res!880060) (not e!756284))))

(declare-fun isStrictlySorted!865 (List!30673) Bool)

(assert (=> d!143399 (= res!880060 (isStrictlySorted!865 lt!590004))))

(assert (=> d!143399 (= (lemmaContainsTupThenGetReturnValue!358 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!590143)))

(declare-fun b!1326466 () Bool)

(declare-fun res!880061 () Bool)

(assert (=> b!1326466 (=> (not res!880061) (not e!756284))))

(assert (=> b!1326466 (= res!880061 (containsKey!734 lt!590004 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1326467 () Bool)

(assert (=> b!1326467 (= e!756284 (contains!8778 lt!590004 (tuple2!23523 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!143399 res!880060) b!1326466))

(assert (= (and b!1326466 res!880061) b!1326467))

(assert (=> d!143399 m!1215291))

(declare-fun m!1215503 () Bool)

(assert (=> d!143399 m!1215503))

(declare-fun m!1215505 () Bool)

(assert (=> d!143399 m!1215505))

(declare-fun m!1215507 () Bool)

(assert (=> b!1326466 m!1215507))

(declare-fun m!1215509 () Bool)

(assert (=> b!1326467 m!1215509))

(assert (=> d!143341 d!143399))

(declare-fun e!756298 () List!30673)

(declare-fun b!1326488 () Bool)

(assert (=> b!1326488 (= e!756298 (insertStrictlySorted!487 (t!44593 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1326489 () Bool)

(declare-fun res!880067 () Bool)

(declare-fun e!756296 () Bool)

(assert (=> b!1326489 (=> (not res!880067) (not e!756296))))

(declare-fun lt!590146 () List!30673)

(assert (=> b!1326489 (= res!880067 (containsKey!734 lt!590146 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1326490 () Bool)

(declare-fun c!126104 () Bool)

(assert (=> b!1326490 (= c!126104 (and ((_ is Cons!30669) (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvsgt (_1!11772 (h!31887 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!756297 () List!30673)

(declare-fun e!756295 () List!30673)

(assert (=> b!1326490 (= e!756297 e!756295)))

(declare-fun bm!64785 () Bool)

(declare-fun call!64789 () List!30673)

(declare-fun call!64788 () List!30673)

(assert (=> bm!64785 (= call!64789 call!64788)))

(declare-fun b!1326491 () Bool)

(declare-fun call!64790 () List!30673)

(assert (=> b!1326491 (= e!756295 call!64790)))

(declare-fun b!1326492 () Bool)

(assert (=> b!1326492 (= e!756297 call!64789)))

(declare-fun b!1326493 () Bool)

(assert (=> b!1326493 (= e!756295 call!64790)))

(declare-fun c!126107 () Bool)

(declare-fun bm!64786 () Bool)

(declare-fun $colon$colon!668 (List!30673 tuple2!23522) List!30673)

(assert (=> bm!64786 (= call!64788 ($colon$colon!668 e!756298 (ite c!126107 (h!31887 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (tuple2!23523 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!126105 () Bool)

(assert (=> bm!64786 (= c!126105 c!126107)))

(declare-fun bm!64787 () Bool)

(assert (=> bm!64787 (= call!64790 call!64789)))

(declare-fun c!126106 () Bool)

(declare-fun b!1326495 () Bool)

(assert (=> b!1326495 (= e!756298 (ite c!126106 (t!44593 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (ite c!126104 (Cons!30669 (h!31887 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (t!44593 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) Nil!30670)))))

(declare-fun b!1326496 () Bool)

(declare-fun e!756299 () List!30673)

(assert (=> b!1326496 (= e!756299 call!64788)))

(declare-fun b!1326497 () Bool)

(assert (=> b!1326497 (= e!756296 (contains!8778 lt!590146 (tuple2!23523 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1326494 () Bool)

(assert (=> b!1326494 (= e!756299 e!756297)))

(assert (=> b!1326494 (= c!126106 (and ((_ is Cons!30669) (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11772 (h!31887 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!143401 () Bool)

(assert (=> d!143401 e!756296))

(declare-fun res!880066 () Bool)

(assert (=> d!143401 (=> (not res!880066) (not e!756296))))

(assert (=> d!143401 (= res!880066 (isStrictlySorted!865 lt!590146))))

(assert (=> d!143401 (= lt!590146 e!756299)))

(assert (=> d!143401 (= c!126107 (and ((_ is Cons!30669) (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvslt (_1!11772 (h!31887 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!143401 (isStrictlySorted!865 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))))

(assert (=> d!143401 (= (insertStrictlySorted!487 (toList!10609 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!590146)))

(assert (= (and d!143401 c!126107) b!1326496))

(assert (= (and d!143401 (not c!126107)) b!1326494))

(assert (= (and b!1326494 c!126106) b!1326492))

(assert (= (and b!1326494 (not c!126106)) b!1326490))

(assert (= (and b!1326490 c!126104) b!1326491))

(assert (= (and b!1326490 (not c!126104)) b!1326493))

(assert (= (or b!1326491 b!1326493) bm!64787))

(assert (= (or b!1326492 bm!64787) bm!64785))

(assert (= (or b!1326496 bm!64785) bm!64786))

(assert (= (and bm!64786 c!126105) b!1326488))

(assert (= (and bm!64786 (not c!126105)) b!1326495))

(assert (= (and d!143401 res!880066) b!1326489))

(assert (= (and b!1326489 res!880067) b!1326497))

(declare-fun m!1215511 () Bool)

(assert (=> bm!64786 m!1215511))

(declare-fun m!1215513 () Bool)

(assert (=> b!1326488 m!1215513))

(declare-fun m!1215515 () Bool)

(assert (=> d!143401 m!1215515))

(declare-fun m!1215517 () Bool)

(assert (=> d!143401 m!1215517))

(declare-fun m!1215519 () Bool)

(assert (=> b!1326489 m!1215519))

(declare-fun m!1215521 () Bool)

(assert (=> b!1326497 m!1215521))

(assert (=> d!143341 d!143401))

(declare-fun d!143403 () Bool)

(declare-fun lt!590149 () Bool)

(declare-fun content!653 (List!30673) (InoxSet tuple2!23522))

(assert (=> d!143403 (= lt!590149 (select (content!653 (toList!10609 lt!590034)) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun e!756305 () Bool)

(assert (=> d!143403 (= lt!590149 e!756305)))

(declare-fun res!880072 () Bool)

(assert (=> d!143403 (=> (not res!880072) (not e!756305))))

(assert (=> d!143403 (= res!880072 ((_ is Cons!30669) (toList!10609 lt!590034)))))

(assert (=> d!143403 (= (contains!8778 (toList!10609 lt!590034) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) lt!590149)))

(declare-fun b!1326502 () Bool)

(declare-fun e!756304 () Bool)

(assert (=> b!1326502 (= e!756305 e!756304)))

(declare-fun res!880073 () Bool)

(assert (=> b!1326502 (=> res!880073 e!756304)))

(assert (=> b!1326502 (= res!880073 (= (h!31887 (toList!10609 lt!590034)) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1326503 () Bool)

(assert (=> b!1326503 (= e!756304 (contains!8778 (t!44593 (toList!10609 lt!590034)) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and d!143403 res!880072) b!1326502))

(assert (= (and b!1326502 (not res!880073)) b!1326503))

(declare-fun m!1215523 () Bool)

(assert (=> d!143403 m!1215523))

(declare-fun m!1215525 () Bool)

(assert (=> d!143403 m!1215525))

(declare-fun m!1215527 () Bool)

(assert (=> b!1326503 m!1215527))

(assert (=> b!1326309 d!143403))

(declare-fun d!143405 () Bool)

(assert (=> d!143405 (arrayContainsKey!0 _keys!1609 lt!590044 #b00000000000000000000000000000000)))

(declare-fun lt!590152 () Unit!43597)

(declare-fun choose!13 (array!89553 (_ BitVec 64) (_ BitVec 32)) Unit!43597)

(assert (=> d!143405 (= lt!590152 (choose!13 _keys!1609 lt!590044 #b00000000000000000000000000000000))))

(assert (=> d!143405 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143405 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590044 #b00000000000000000000000000000000) lt!590152)))

(declare-fun bs!37912 () Bool)

(assert (= bs!37912 d!143405))

(assert (=> bs!37912 m!1215365))

(declare-fun m!1215529 () Bool)

(assert (=> bs!37912 m!1215529))

(assert (=> b!1326321 d!143405))

(declare-fun d!143407 () Bool)

(declare-fun res!880078 () Bool)

(declare-fun e!756310 () Bool)

(assert (=> d!143407 (=> res!880078 e!756310)))

(assert (=> d!143407 (= res!880078 (= (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) lt!590044))))

(assert (=> d!143407 (= (arrayContainsKey!0 _keys!1609 lt!590044 #b00000000000000000000000000000000) e!756310)))

(declare-fun b!1326508 () Bool)

(declare-fun e!756311 () Bool)

(assert (=> b!1326508 (= e!756310 e!756311)))

(declare-fun res!880079 () Bool)

(assert (=> b!1326508 (=> (not res!880079) (not e!756311))))

(assert (=> b!1326508 (= res!880079 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(declare-fun b!1326509 () Bool)

(assert (=> b!1326509 (= e!756311 (arrayContainsKey!0 _keys!1609 lt!590044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143407 (not res!880078)) b!1326508))

(assert (= (and b!1326508 res!880079) b!1326509))

(assert (=> d!143407 m!1215359))

(declare-fun m!1215531 () Bool)

(assert (=> b!1326509 m!1215531))

(assert (=> b!1326321 d!143407))

(declare-fun b!1326522 () Bool)

(declare-fun c!126115 () Bool)

(declare-fun lt!590159 () (_ BitVec 64))

(assert (=> b!1326522 (= c!126115 (= lt!590159 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!756319 () SeekEntryResult!9996)

(declare-fun e!756320 () SeekEntryResult!9996)

(assert (=> b!1326522 (= e!756319 e!756320)))

(declare-fun d!143409 () Bool)

(declare-fun lt!590160 () SeekEntryResult!9996)

(assert (=> d!143409 (and (or ((_ is Undefined!9996) lt!590160) (not ((_ is Found!9996) lt!590160)) (and (bvsge (index!42356 lt!590160) #b00000000000000000000000000000000) (bvslt (index!42356 lt!590160) (size!43797 _keys!1609)))) (or ((_ is Undefined!9996) lt!590160) ((_ is Found!9996) lt!590160) (not ((_ is MissingZero!9996) lt!590160)) (and (bvsge (index!42355 lt!590160) #b00000000000000000000000000000000) (bvslt (index!42355 lt!590160) (size!43797 _keys!1609)))) (or ((_ is Undefined!9996) lt!590160) ((_ is Found!9996) lt!590160) ((_ is MissingZero!9996) lt!590160) (not ((_ is MissingVacant!9996) lt!590160)) (and (bvsge (index!42358 lt!590160) #b00000000000000000000000000000000) (bvslt (index!42358 lt!590160) (size!43797 _keys!1609)))) (or ((_ is Undefined!9996) lt!590160) (ite ((_ is Found!9996) lt!590160) (= (select (arr!43246 _keys!1609) (index!42356 lt!590160)) (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9996) lt!590160) (= (select (arr!43246 _keys!1609) (index!42355 lt!590160)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9996) lt!590160) (= (select (arr!43246 _keys!1609) (index!42358 lt!590160)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!756318 () SeekEntryResult!9996)

(assert (=> d!143409 (= lt!590160 e!756318)))

(declare-fun c!126116 () Bool)

(declare-fun lt!590161 () SeekEntryResult!9996)

(assert (=> d!143409 (= c!126116 (and ((_ is Intermediate!9996) lt!590161) (undefined!10808 lt!590161)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89553 (_ BitVec 32)) SeekEntryResult!9996)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143409 (= lt!590161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) mask!2019) (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(assert (=> d!143409 (validMask!0 mask!2019)))

(assert (=> d!143409 (= (seekEntryOrOpen!0 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) lt!590160)))

(declare-fun b!1326523 () Bool)

(assert (=> b!1326523 (= e!756320 (MissingZero!9996 (index!42357 lt!590161)))))

(declare-fun b!1326524 () Bool)

(assert (=> b!1326524 (= e!756318 e!756319)))

(assert (=> b!1326524 (= lt!590159 (select (arr!43246 _keys!1609) (index!42357 lt!590161)))))

(declare-fun c!126114 () Bool)

(assert (=> b!1326524 (= c!126114 (= lt!590159 (select (arr!43246 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326525 () Bool)

(assert (=> b!1326525 (= e!756319 (Found!9996 (index!42357 lt!590161)))))

(declare-fun b!1326526 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89553 (_ BitVec 32)) SeekEntryResult!9996)

(assert (=> b!1326526 (= e!756320 (seekKeyOrZeroReturnVacant!0 (x!118086 lt!590161) (index!42357 lt!590161) (index!42357 lt!590161) (select (arr!43246 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(declare-fun b!1326527 () Bool)

(assert (=> b!1326527 (= e!756318 Undefined!9996)))

(assert (= (and d!143409 c!126116) b!1326527))

(assert (= (and d!143409 (not c!126116)) b!1326524))

(assert (= (and b!1326524 c!126114) b!1326525))

(assert (= (and b!1326524 (not c!126114)) b!1326522))

(assert (= (and b!1326522 c!126115) b!1326523))

(assert (= (and b!1326522 (not c!126115)) b!1326526))

(assert (=> d!143409 m!1215359))

(declare-fun m!1215533 () Bool)

(assert (=> d!143409 m!1215533))

(declare-fun m!1215535 () Bool)

(assert (=> d!143409 m!1215535))

(assert (=> d!143409 m!1215173))

(declare-fun m!1215537 () Bool)

(assert (=> d!143409 m!1215537))

(assert (=> d!143409 m!1215533))

(assert (=> d!143409 m!1215359))

(declare-fun m!1215539 () Bool)

(assert (=> d!143409 m!1215539))

(declare-fun m!1215541 () Bool)

(assert (=> d!143409 m!1215541))

(declare-fun m!1215543 () Bool)

(assert (=> b!1326524 m!1215543))

(assert (=> b!1326526 m!1215359))

(declare-fun m!1215545 () Bool)

(assert (=> b!1326526 m!1215545))

(assert (=> b!1326321 d!143409))

(declare-fun d!143411 () Bool)

(assert (=> d!143411 (= (apply!1038 lt!590105 lt!590104) (get!21807 (getValueByKey!708 (toList!10609 lt!590105) lt!590104)))))

(declare-fun bs!37913 () Bool)

(assert (= bs!37913 d!143411))

(declare-fun m!1215547 () Bool)

(assert (=> bs!37913 m!1215547))

(assert (=> bs!37913 m!1215547))

(declare-fun m!1215549 () Bool)

(assert (=> bs!37913 m!1215549))

(assert (=> b!1326387 d!143411))

(declare-fun d!143413 () Bool)

(assert (=> d!143413 (= (apply!1038 lt!590103 lt!590094) (get!21807 (getValueByKey!708 (toList!10609 lt!590103) lt!590094)))))

(declare-fun bs!37914 () Bool)

(assert (= bs!37914 d!143413))

(declare-fun m!1215551 () Bool)

(assert (=> bs!37914 m!1215551))

(assert (=> bs!37914 m!1215551))

(declare-fun m!1215553 () Bool)

(assert (=> bs!37914 m!1215553))

(assert (=> b!1326387 d!143413))

(declare-fun d!143415 () Bool)

(assert (=> d!143415 (= (apply!1038 (+!4655 lt!590096 (tuple2!23523 lt!590095 minValue!1279)) lt!590100) (apply!1038 lt!590096 lt!590100))))

(declare-fun lt!590164 () Unit!43597)

(declare-fun choose!1949 (ListLongMap!21187 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43597)

(assert (=> d!143415 (= lt!590164 (choose!1949 lt!590096 lt!590095 minValue!1279 lt!590100))))

(declare-fun e!756323 () Bool)

(assert (=> d!143415 e!756323))

(declare-fun res!880082 () Bool)

(assert (=> d!143415 (=> (not res!880082) (not e!756323))))

(assert (=> d!143415 (= res!880082 (contains!8775 lt!590096 lt!590100))))

(assert (=> d!143415 (= (addApplyDifferent!567 lt!590096 lt!590095 minValue!1279 lt!590100) lt!590164)))

(declare-fun b!1326531 () Bool)

(assert (=> b!1326531 (= e!756323 (not (= lt!590100 lt!590095)))))

(assert (= (and d!143415 res!880082) b!1326531))

(declare-fun m!1215555 () Bool)

(assert (=> d!143415 m!1215555))

(declare-fun m!1215557 () Bool)

(assert (=> d!143415 m!1215557))

(assert (=> d!143415 m!1215385))

(assert (=> d!143415 m!1215379))

(assert (=> d!143415 m!1215381))

(assert (=> d!143415 m!1215379))

(assert (=> b!1326387 d!143415))

(declare-fun d!143417 () Bool)

(declare-fun e!756324 () Bool)

(assert (=> d!143417 e!756324))

(declare-fun res!880083 () Bool)

(assert (=> d!143417 (=> (not res!880083) (not e!756324))))

(declare-fun lt!590167 () ListLongMap!21187)

(assert (=> d!143417 (= res!880083 (contains!8775 lt!590167 (_1!11772 (tuple2!23523 lt!590097 zeroValue!1279))))))

(declare-fun lt!590166 () List!30673)

(assert (=> d!143417 (= lt!590167 (ListLongMap!21188 lt!590166))))

(declare-fun lt!590165 () Unit!43597)

(declare-fun lt!590168 () Unit!43597)

(assert (=> d!143417 (= lt!590165 lt!590168)))

(assert (=> d!143417 (= (getValueByKey!708 lt!590166 (_1!11772 (tuple2!23523 lt!590097 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590097 zeroValue!1279))))))

(assert (=> d!143417 (= lt!590168 (lemmaContainsTupThenGetReturnValue!358 lt!590166 (_1!11772 (tuple2!23523 lt!590097 zeroValue!1279)) (_2!11772 (tuple2!23523 lt!590097 zeroValue!1279))))))

(assert (=> d!143417 (= lt!590166 (insertStrictlySorted!487 (toList!10609 lt!590111) (_1!11772 (tuple2!23523 lt!590097 zeroValue!1279)) (_2!11772 (tuple2!23523 lt!590097 zeroValue!1279))))))

(assert (=> d!143417 (= (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279)) lt!590167)))

(declare-fun b!1326532 () Bool)

(declare-fun res!880084 () Bool)

(assert (=> b!1326532 (=> (not res!880084) (not e!756324))))

(assert (=> b!1326532 (= res!880084 (= (getValueByKey!708 (toList!10609 lt!590167) (_1!11772 (tuple2!23523 lt!590097 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590097 zeroValue!1279)))))))

(declare-fun b!1326533 () Bool)

(assert (=> b!1326533 (= e!756324 (contains!8778 (toList!10609 lt!590167) (tuple2!23523 lt!590097 zeroValue!1279)))))

(assert (= (and d!143417 res!880083) b!1326532))

(assert (= (and b!1326532 res!880084) b!1326533))

(declare-fun m!1215559 () Bool)

(assert (=> d!143417 m!1215559))

(declare-fun m!1215561 () Bool)

(assert (=> d!143417 m!1215561))

(declare-fun m!1215563 () Bool)

(assert (=> d!143417 m!1215563))

(declare-fun m!1215565 () Bool)

(assert (=> d!143417 m!1215565))

(declare-fun m!1215567 () Bool)

(assert (=> b!1326532 m!1215567))

(declare-fun m!1215569 () Bool)

(assert (=> b!1326533 m!1215569))

(assert (=> b!1326387 d!143417))

(declare-fun d!143419 () Bool)

(declare-fun e!756325 () Bool)

(assert (=> d!143419 e!756325))

(declare-fun res!880085 () Bool)

(assert (=> d!143419 (=> (not res!880085) (not e!756325))))

(declare-fun lt!590171 () ListLongMap!21187)

(assert (=> d!143419 (= res!880085 (contains!8775 lt!590171 (_1!11772 (tuple2!23523 lt!590110 minValue!1279))))))

(declare-fun lt!590170 () List!30673)

(assert (=> d!143419 (= lt!590171 (ListLongMap!21188 lt!590170))))

(declare-fun lt!590169 () Unit!43597)

(declare-fun lt!590172 () Unit!43597)

(assert (=> d!143419 (= lt!590169 lt!590172)))

(assert (=> d!143419 (= (getValueByKey!708 lt!590170 (_1!11772 (tuple2!23523 lt!590110 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590110 minValue!1279))))))

(assert (=> d!143419 (= lt!590172 (lemmaContainsTupThenGetReturnValue!358 lt!590170 (_1!11772 (tuple2!23523 lt!590110 minValue!1279)) (_2!11772 (tuple2!23523 lt!590110 minValue!1279))))))

(assert (=> d!143419 (= lt!590170 (insertStrictlySorted!487 (toList!10609 lt!590105) (_1!11772 (tuple2!23523 lt!590110 minValue!1279)) (_2!11772 (tuple2!23523 lt!590110 minValue!1279))))))

(assert (=> d!143419 (= (+!4655 lt!590105 (tuple2!23523 lt!590110 minValue!1279)) lt!590171)))

(declare-fun b!1326534 () Bool)

(declare-fun res!880086 () Bool)

(assert (=> b!1326534 (=> (not res!880086) (not e!756325))))

(assert (=> b!1326534 (= res!880086 (= (getValueByKey!708 (toList!10609 lt!590171) (_1!11772 (tuple2!23523 lt!590110 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590110 minValue!1279)))))))

(declare-fun b!1326535 () Bool)

(assert (=> b!1326535 (= e!756325 (contains!8778 (toList!10609 lt!590171) (tuple2!23523 lt!590110 minValue!1279)))))

(assert (= (and d!143419 res!880085) b!1326534))

(assert (= (and b!1326534 res!880086) b!1326535))

(declare-fun m!1215571 () Bool)

(assert (=> d!143419 m!1215571))

(declare-fun m!1215573 () Bool)

(assert (=> d!143419 m!1215573))

(declare-fun m!1215575 () Bool)

(assert (=> d!143419 m!1215575))

(declare-fun m!1215577 () Bool)

(assert (=> d!143419 m!1215577))

(declare-fun m!1215579 () Bool)

(assert (=> b!1326534 m!1215579))

(declare-fun m!1215581 () Bool)

(assert (=> b!1326535 m!1215581))

(assert (=> b!1326387 d!143419))

(declare-fun d!143421 () Bool)

(assert (=> d!143421 (= (apply!1038 (+!4655 lt!590103 (tuple2!23523 lt!590114 zeroValue!1279)) lt!590094) (get!21807 (getValueByKey!708 (toList!10609 (+!4655 lt!590103 (tuple2!23523 lt!590114 zeroValue!1279))) lt!590094)))))

(declare-fun bs!37915 () Bool)

(assert (= bs!37915 d!143421))

(declare-fun m!1215583 () Bool)

(assert (=> bs!37915 m!1215583))

(assert (=> bs!37915 m!1215583))

(declare-fun m!1215585 () Bool)

(assert (=> bs!37915 m!1215585))

(assert (=> b!1326387 d!143421))

(declare-fun b!1326536 () Bool)

(declare-fun e!756331 () ListLongMap!21187)

(declare-fun e!756326 () ListLongMap!21187)

(assert (=> b!1326536 (= e!756331 e!756326)))

(declare-fun c!126118 () Bool)

(assert (=> b!1326536 (= c!126118 (validKeyInArray!0 (select (arr!43246 _keys!1609) from!2000)))))

(declare-fun b!1326537 () Bool)

(declare-fun lt!590179 () ListLongMap!21187)

(declare-fun e!756327 () Bool)

(assert (=> b!1326537 (= e!756327 (= lt!590179 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun bm!64788 () Bool)

(declare-fun call!64791 () ListLongMap!21187)

(assert (=> bm!64788 (= call!64791 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1326538 () Bool)

(declare-fun lt!590178 () Unit!43597)

(declare-fun lt!590176 () Unit!43597)

(assert (=> b!1326538 (= lt!590178 lt!590176)))

(declare-fun lt!590174 () (_ BitVec 64))

(declare-fun lt!590177 () ListLongMap!21187)

(declare-fun lt!590173 () (_ BitVec 64))

(declare-fun lt!590175 () V!53473)

(assert (=> b!1326538 (not (contains!8775 (+!4655 lt!590177 (tuple2!23523 lt!590174 lt!590175)) lt!590173))))

(assert (=> b!1326538 (= lt!590176 (addStillNotContains!494 lt!590177 lt!590174 lt!590175 lt!590173))))

(assert (=> b!1326538 (= lt!590173 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1326538 (= lt!590175 (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1326538 (= lt!590174 (select (arr!43246 _keys!1609) from!2000))))

(assert (=> b!1326538 (= lt!590177 call!64791)))

(assert (=> b!1326538 (= e!756326 (+!4655 call!64791 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326539 () Bool)

(assert (=> b!1326539 (= e!756327 (isEmpty!1079 lt!590179))))

(declare-fun b!1326540 () Bool)

(assert (=> b!1326540 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)))))

(assert (=> b!1326540 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43798 _values!1337)))))

(declare-fun e!756329 () Bool)

(assert (=> b!1326540 (= e!756329 (= (apply!1038 lt!590179 (select (arr!43246 _keys!1609) from!2000)) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326541 () Bool)

(declare-fun e!756328 () Bool)

(declare-fun e!756330 () Bool)

(assert (=> b!1326541 (= e!756328 e!756330)))

(declare-fun c!126117 () Bool)

(declare-fun e!756332 () Bool)

(assert (=> b!1326541 (= c!126117 e!756332)))

(declare-fun res!880087 () Bool)

(assert (=> b!1326541 (=> (not res!880087) (not e!756332))))

(assert (=> b!1326541 (= res!880087 (bvslt from!2000 (size!43797 _keys!1609)))))

(declare-fun d!143423 () Bool)

(assert (=> d!143423 e!756328))

(declare-fun res!880089 () Bool)

(assert (=> d!143423 (=> (not res!880089) (not e!756328))))

(assert (=> d!143423 (= res!880089 (not (contains!8775 lt!590179 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143423 (= lt!590179 e!756331)))

(declare-fun c!126119 () Bool)

(assert (=> d!143423 (= c!126119 (bvsge from!2000 (size!43797 _keys!1609)))))

(assert (=> d!143423 (validMask!0 mask!2019)))

(assert (=> d!143423 (= (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590179)))

(declare-fun b!1326542 () Bool)

(assert (=> b!1326542 (= e!756330 e!756329)))

(assert (=> b!1326542 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43797 _keys!1609)))))

(declare-fun res!880088 () Bool)

(assert (=> b!1326542 (= res!880088 (contains!8775 lt!590179 (select (arr!43246 _keys!1609) from!2000)))))

(assert (=> b!1326542 (=> (not res!880088) (not e!756329))))

(declare-fun b!1326543 () Bool)

(assert (=> b!1326543 (= e!756330 e!756327)))

(declare-fun c!126120 () Bool)

(assert (=> b!1326543 (= c!126120 (bvslt from!2000 (size!43797 _keys!1609)))))

(declare-fun b!1326544 () Bool)

(assert (=> b!1326544 (= e!756326 call!64791)))

(declare-fun b!1326545 () Bool)

(assert (=> b!1326545 (= e!756331 (ListLongMap!21188 Nil!30670))))

(declare-fun b!1326546 () Bool)

(declare-fun res!880090 () Bool)

(assert (=> b!1326546 (=> (not res!880090) (not e!756328))))

(assert (=> b!1326546 (= res!880090 (not (contains!8775 lt!590179 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326547 () Bool)

(assert (=> b!1326547 (= e!756332 (validKeyInArray!0 (select (arr!43246 _keys!1609) from!2000)))))

(assert (=> b!1326547 (bvsge from!2000 #b00000000000000000000000000000000)))

(assert (= (and d!143423 c!126119) b!1326545))

(assert (= (and d!143423 (not c!126119)) b!1326536))

(assert (= (and b!1326536 c!126118) b!1326538))

(assert (= (and b!1326536 (not c!126118)) b!1326544))

(assert (= (or b!1326538 b!1326544) bm!64788))

(assert (= (and d!143423 res!880089) b!1326546))

(assert (= (and b!1326546 res!880090) b!1326541))

(assert (= (and b!1326541 res!880087) b!1326547))

(assert (= (and b!1326541 c!126117) b!1326542))

(assert (= (and b!1326541 (not c!126117)) b!1326543))

(assert (= (and b!1326542 res!880088) b!1326540))

(assert (= (and b!1326543 c!126120) b!1326537))

(assert (= (and b!1326543 (not c!126120)) b!1326539))

(declare-fun b_lambda!23719 () Bool)

(assert (=> (not b_lambda!23719) (not b!1326538)))

(assert (=> b!1326538 t!44592))

(declare-fun b_and!49015 () Bool)

(assert (= b_and!49013 (and (=> t!44592 result!24509) b_and!49015)))

(declare-fun b_lambda!23721 () Bool)

(assert (=> (not b_lambda!23721) (not b!1326540)))

(assert (=> b!1326540 t!44592))

(declare-fun b_and!49017 () Bool)

(assert (= b_and!49015 (and (=> t!44592 result!24509) b_and!49017)))

(assert (=> b!1326536 m!1215195))

(assert (=> b!1326536 m!1215195))

(assert (=> b!1326536 m!1215205))

(assert (=> b!1326547 m!1215195))

(assert (=> b!1326547 m!1215195))

(assert (=> b!1326547 m!1215205))

(declare-fun m!1215587 () Bool)

(assert (=> bm!64788 m!1215587))

(declare-fun m!1215589 () Bool)

(assert (=> b!1326539 m!1215589))

(assert (=> b!1326542 m!1215195))

(assert (=> b!1326542 m!1215195))

(declare-fun m!1215591 () Bool)

(assert (=> b!1326542 m!1215591))

(declare-fun m!1215593 () Bool)

(assert (=> b!1326546 m!1215593))

(assert (=> b!1326538 m!1215191))

(assert (=> b!1326538 m!1215183))

(assert (=> b!1326538 m!1215197))

(assert (=> b!1326538 m!1215191))

(assert (=> b!1326538 m!1215195))

(declare-fun m!1215595 () Bool)

(assert (=> b!1326538 m!1215595))

(declare-fun m!1215597 () Bool)

(assert (=> b!1326538 m!1215597))

(declare-fun m!1215599 () Bool)

(assert (=> b!1326538 m!1215599))

(assert (=> b!1326538 m!1215595))

(assert (=> b!1326538 m!1215183))

(declare-fun m!1215601 () Bool)

(assert (=> b!1326538 m!1215601))

(assert (=> b!1326540 m!1215191))

(assert (=> b!1326540 m!1215183))

(assert (=> b!1326540 m!1215197))

(assert (=> b!1326540 m!1215191))

(assert (=> b!1326540 m!1215195))

(declare-fun m!1215603 () Bool)

(assert (=> b!1326540 m!1215603))

(assert (=> b!1326540 m!1215183))

(assert (=> b!1326540 m!1215195))

(assert (=> b!1326537 m!1215587))

(declare-fun m!1215605 () Bool)

(assert (=> d!143423 m!1215605))

(assert (=> d!143423 m!1215173))

(assert (=> b!1326387 d!143423))

(declare-fun d!143425 () Bool)

(declare-fun e!756333 () Bool)

(assert (=> d!143425 e!756333))

(declare-fun res!880091 () Bool)

(assert (=> d!143425 (=> res!880091 e!756333)))

(declare-fun lt!590183 () Bool)

(assert (=> d!143425 (= res!880091 (not lt!590183))))

(declare-fun lt!590182 () Bool)

(assert (=> d!143425 (= lt!590183 lt!590182)))

(declare-fun lt!590181 () Unit!43597)

(declare-fun e!756334 () Unit!43597)

(assert (=> d!143425 (= lt!590181 e!756334)))

(declare-fun c!126121 () Bool)

(assert (=> d!143425 (= c!126121 lt!590182)))

(assert (=> d!143425 (= lt!590182 (containsKey!734 (toList!10609 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279))) lt!590108))))

(assert (=> d!143425 (= (contains!8775 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279)) lt!590108) lt!590183)))

(declare-fun b!1326548 () Bool)

(declare-fun lt!590180 () Unit!43597)

(assert (=> b!1326548 (= e!756334 lt!590180)))

(assert (=> b!1326548 (= lt!590180 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279))) lt!590108))))

(assert (=> b!1326548 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279))) lt!590108))))

(declare-fun b!1326549 () Bool)

(declare-fun Unit!43606 () Unit!43597)

(assert (=> b!1326549 (= e!756334 Unit!43606)))

(declare-fun b!1326550 () Bool)

(assert (=> b!1326550 (= e!756333 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279))) lt!590108)))))

(assert (= (and d!143425 c!126121) b!1326548))

(assert (= (and d!143425 (not c!126121)) b!1326549))

(assert (= (and d!143425 (not res!880091)) b!1326550))

(declare-fun m!1215607 () Bool)

(assert (=> d!143425 m!1215607))

(declare-fun m!1215609 () Bool)

(assert (=> b!1326548 m!1215609))

(declare-fun m!1215611 () Bool)

(assert (=> b!1326548 m!1215611))

(assert (=> b!1326548 m!1215611))

(declare-fun m!1215613 () Bool)

(assert (=> b!1326548 m!1215613))

(assert (=> b!1326550 m!1215611))

(assert (=> b!1326550 m!1215611))

(assert (=> b!1326550 m!1215613))

(assert (=> b!1326387 d!143425))

(declare-fun d!143427 () Bool)

(declare-fun e!756335 () Bool)

(assert (=> d!143427 e!756335))

(declare-fun res!880092 () Bool)

(assert (=> d!143427 (=> (not res!880092) (not e!756335))))

(declare-fun lt!590186 () ListLongMap!21187)

(assert (=> d!143427 (= res!880092 (contains!8775 lt!590186 (_1!11772 (tuple2!23523 lt!590114 zeroValue!1279))))))

(declare-fun lt!590185 () List!30673)

(assert (=> d!143427 (= lt!590186 (ListLongMap!21188 lt!590185))))

(declare-fun lt!590184 () Unit!43597)

(declare-fun lt!590187 () Unit!43597)

(assert (=> d!143427 (= lt!590184 lt!590187)))

(assert (=> d!143427 (= (getValueByKey!708 lt!590185 (_1!11772 (tuple2!23523 lt!590114 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590114 zeroValue!1279))))))

(assert (=> d!143427 (= lt!590187 (lemmaContainsTupThenGetReturnValue!358 lt!590185 (_1!11772 (tuple2!23523 lt!590114 zeroValue!1279)) (_2!11772 (tuple2!23523 lt!590114 zeroValue!1279))))))

(assert (=> d!143427 (= lt!590185 (insertStrictlySorted!487 (toList!10609 lt!590103) (_1!11772 (tuple2!23523 lt!590114 zeroValue!1279)) (_2!11772 (tuple2!23523 lt!590114 zeroValue!1279))))))

(assert (=> d!143427 (= (+!4655 lt!590103 (tuple2!23523 lt!590114 zeroValue!1279)) lt!590186)))

(declare-fun b!1326551 () Bool)

(declare-fun res!880093 () Bool)

(assert (=> b!1326551 (=> (not res!880093) (not e!756335))))

(assert (=> b!1326551 (= res!880093 (= (getValueByKey!708 (toList!10609 lt!590186) (_1!11772 (tuple2!23523 lt!590114 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590114 zeroValue!1279)))))))

(declare-fun b!1326552 () Bool)

(assert (=> b!1326552 (= e!756335 (contains!8778 (toList!10609 lt!590186) (tuple2!23523 lt!590114 zeroValue!1279)))))

(assert (= (and d!143427 res!880092) b!1326551))

(assert (= (and b!1326551 res!880093) b!1326552))

(declare-fun m!1215615 () Bool)

(assert (=> d!143427 m!1215615))

(declare-fun m!1215617 () Bool)

(assert (=> d!143427 m!1215617))

(declare-fun m!1215619 () Bool)

(assert (=> d!143427 m!1215619))

(declare-fun m!1215621 () Bool)

(assert (=> d!143427 m!1215621))

(declare-fun m!1215623 () Bool)

(assert (=> b!1326551 m!1215623))

(declare-fun m!1215625 () Bool)

(assert (=> b!1326552 m!1215625))

(assert (=> b!1326387 d!143427))

(declare-fun d!143429 () Bool)

(assert (=> d!143429 (= (apply!1038 (+!4655 lt!590096 (tuple2!23523 lt!590095 minValue!1279)) lt!590100) (get!21807 (getValueByKey!708 (toList!10609 (+!4655 lt!590096 (tuple2!23523 lt!590095 minValue!1279))) lt!590100)))))

(declare-fun bs!37916 () Bool)

(assert (= bs!37916 d!143429))

(declare-fun m!1215627 () Bool)

(assert (=> bs!37916 m!1215627))

(assert (=> bs!37916 m!1215627))

(declare-fun m!1215629 () Bool)

(assert (=> bs!37916 m!1215629))

(assert (=> b!1326387 d!143429))

(declare-fun d!143431 () Bool)

(assert (=> d!143431 (contains!8775 (+!4655 lt!590111 (tuple2!23523 lt!590097 zeroValue!1279)) lt!590108)))

(declare-fun lt!590190 () Unit!43597)

(declare-fun choose!1950 (ListLongMap!21187 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43597)

(assert (=> d!143431 (= lt!590190 (choose!1950 lt!590111 lt!590097 zeroValue!1279 lt!590108))))

(assert (=> d!143431 (contains!8775 lt!590111 lt!590108)))

(assert (=> d!143431 (= (addStillContains!1167 lt!590111 lt!590097 zeroValue!1279 lt!590108) lt!590190)))

(declare-fun bs!37917 () Bool)

(assert (= bs!37917 d!143431))

(assert (=> bs!37917 m!1215387))

(assert (=> bs!37917 m!1215387))

(assert (=> bs!37917 m!1215389))

(declare-fun m!1215631 () Bool)

(assert (=> bs!37917 m!1215631))

(declare-fun m!1215633 () Bool)

(assert (=> bs!37917 m!1215633))

(assert (=> b!1326387 d!143431))

(declare-fun d!143433 () Bool)

(assert (=> d!143433 (= (apply!1038 lt!590096 lt!590100) (get!21807 (getValueByKey!708 (toList!10609 lt!590096) lt!590100)))))

(declare-fun bs!37918 () Bool)

(assert (= bs!37918 d!143433))

(declare-fun m!1215635 () Bool)

(assert (=> bs!37918 m!1215635))

(assert (=> bs!37918 m!1215635))

(declare-fun m!1215637 () Bool)

(assert (=> bs!37918 m!1215637))

(assert (=> b!1326387 d!143433))

(declare-fun d!143435 () Bool)

(assert (=> d!143435 (= (apply!1038 (+!4655 lt!590105 (tuple2!23523 lt!590110 minValue!1279)) lt!590104) (apply!1038 lt!590105 lt!590104))))

(declare-fun lt!590191 () Unit!43597)

(assert (=> d!143435 (= lt!590191 (choose!1949 lt!590105 lt!590110 minValue!1279 lt!590104))))

(declare-fun e!756336 () Bool)

(assert (=> d!143435 e!756336))

(declare-fun res!880094 () Bool)

(assert (=> d!143435 (=> (not res!880094) (not e!756336))))

(assert (=> d!143435 (= res!880094 (contains!8775 lt!590105 lt!590104))))

(assert (=> d!143435 (= (addApplyDifferent!567 lt!590105 lt!590110 minValue!1279 lt!590104) lt!590191)))

(declare-fun b!1326554 () Bool)

(assert (=> b!1326554 (= e!756336 (not (= lt!590104 lt!590110)))))

(assert (= (and d!143435 res!880094) b!1326554))

(declare-fun m!1215639 () Bool)

(assert (=> d!143435 m!1215639))

(declare-fun m!1215641 () Bool)

(assert (=> d!143435 m!1215641))

(assert (=> d!143435 m!1215405))

(assert (=> d!143435 m!1215397))

(assert (=> d!143435 m!1215407))

(assert (=> d!143435 m!1215397))

(assert (=> b!1326387 d!143435))

(declare-fun d!143437 () Bool)

(declare-fun e!756337 () Bool)

(assert (=> d!143437 e!756337))

(declare-fun res!880095 () Bool)

(assert (=> d!143437 (=> (not res!880095) (not e!756337))))

(declare-fun lt!590194 () ListLongMap!21187)

(assert (=> d!143437 (= res!880095 (contains!8775 lt!590194 (_1!11772 (tuple2!23523 lt!590095 minValue!1279))))))

(declare-fun lt!590193 () List!30673)

(assert (=> d!143437 (= lt!590194 (ListLongMap!21188 lt!590193))))

(declare-fun lt!590192 () Unit!43597)

(declare-fun lt!590195 () Unit!43597)

(assert (=> d!143437 (= lt!590192 lt!590195)))

(assert (=> d!143437 (= (getValueByKey!708 lt!590193 (_1!11772 (tuple2!23523 lt!590095 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590095 minValue!1279))))))

(assert (=> d!143437 (= lt!590195 (lemmaContainsTupThenGetReturnValue!358 lt!590193 (_1!11772 (tuple2!23523 lt!590095 minValue!1279)) (_2!11772 (tuple2!23523 lt!590095 minValue!1279))))))

(assert (=> d!143437 (= lt!590193 (insertStrictlySorted!487 (toList!10609 lt!590096) (_1!11772 (tuple2!23523 lt!590095 minValue!1279)) (_2!11772 (tuple2!23523 lt!590095 minValue!1279))))))

(assert (=> d!143437 (= (+!4655 lt!590096 (tuple2!23523 lt!590095 minValue!1279)) lt!590194)))

(declare-fun b!1326555 () Bool)

(declare-fun res!880096 () Bool)

(assert (=> b!1326555 (=> (not res!880096) (not e!756337))))

(assert (=> b!1326555 (= res!880096 (= (getValueByKey!708 (toList!10609 lt!590194) (_1!11772 (tuple2!23523 lt!590095 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 lt!590095 minValue!1279)))))))

(declare-fun b!1326556 () Bool)

(assert (=> b!1326556 (= e!756337 (contains!8778 (toList!10609 lt!590194) (tuple2!23523 lt!590095 minValue!1279)))))

(assert (= (and d!143437 res!880095) b!1326555))

(assert (= (and b!1326555 res!880096) b!1326556))

(declare-fun m!1215643 () Bool)

(assert (=> d!143437 m!1215643))

(declare-fun m!1215645 () Bool)

(assert (=> d!143437 m!1215645))

(declare-fun m!1215647 () Bool)

(assert (=> d!143437 m!1215647))

(declare-fun m!1215649 () Bool)

(assert (=> d!143437 m!1215649))

(declare-fun m!1215651 () Bool)

(assert (=> b!1326555 m!1215651))

(declare-fun m!1215653 () Bool)

(assert (=> b!1326556 m!1215653))

(assert (=> b!1326387 d!143437))

(declare-fun d!143439 () Bool)

(assert (=> d!143439 (= (apply!1038 (+!4655 lt!590105 (tuple2!23523 lt!590110 minValue!1279)) lt!590104) (get!21807 (getValueByKey!708 (toList!10609 (+!4655 lt!590105 (tuple2!23523 lt!590110 minValue!1279))) lt!590104)))))

(declare-fun bs!37919 () Bool)

(assert (= bs!37919 d!143439))

(declare-fun m!1215655 () Bool)

(assert (=> bs!37919 m!1215655))

(assert (=> bs!37919 m!1215655))

(declare-fun m!1215657 () Bool)

(assert (=> bs!37919 m!1215657))

(assert (=> b!1326387 d!143439))

(declare-fun d!143441 () Bool)

(assert (=> d!143441 (= (apply!1038 (+!4655 lt!590103 (tuple2!23523 lt!590114 zeroValue!1279)) lt!590094) (apply!1038 lt!590103 lt!590094))))

(declare-fun lt!590196 () Unit!43597)

(assert (=> d!143441 (= lt!590196 (choose!1949 lt!590103 lt!590114 zeroValue!1279 lt!590094))))

(declare-fun e!756338 () Bool)

(assert (=> d!143441 e!756338))

(declare-fun res!880097 () Bool)

(assert (=> d!143441 (=> (not res!880097) (not e!756338))))

(assert (=> d!143441 (= res!880097 (contains!8775 lt!590103 lt!590094))))

(assert (=> d!143441 (= (addApplyDifferent!567 lt!590103 lt!590114 zeroValue!1279 lt!590094) lt!590196)))

(declare-fun b!1326557 () Bool)

(assert (=> b!1326557 (= e!756338 (not (= lt!590094 lt!590114)))))

(assert (= (and d!143441 res!880097) b!1326557))

(declare-fun m!1215659 () Bool)

(assert (=> d!143441 m!1215659))

(declare-fun m!1215661 () Bool)

(assert (=> d!143441 m!1215661))

(assert (=> d!143441 m!1215395))

(assert (=> d!143441 m!1215391))

(assert (=> d!143441 m!1215403))

(assert (=> d!143441 m!1215391))

(assert (=> b!1326387 d!143441))

(declare-fun d!143443 () Bool)

(declare-fun c!126122 () Bool)

(assert (=> d!143443 (= c!126122 (and ((_ is Cons!30669) (toList!10609 lt!590034)) (= (_1!11772 (h!31887 (toList!10609 lt!590034))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun e!756339 () Option!759)

(assert (=> d!143443 (= (getValueByKey!708 (toList!10609 lt!590034) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) e!756339)))

(declare-fun b!1326559 () Bool)

(declare-fun e!756340 () Option!759)

(assert (=> b!1326559 (= e!756339 e!756340)))

(declare-fun c!126123 () Bool)

(assert (=> b!1326559 (= c!126123 (and ((_ is Cons!30669) (toList!10609 lt!590034)) (not (= (_1!11772 (h!31887 (toList!10609 lt!590034))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun b!1326558 () Bool)

(assert (=> b!1326558 (= e!756339 (Some!758 (_2!11772 (h!31887 (toList!10609 lt!590034)))))))

(declare-fun b!1326561 () Bool)

(assert (=> b!1326561 (= e!756340 None!757)))

(declare-fun b!1326560 () Bool)

(assert (=> b!1326560 (= e!756340 (getValueByKey!708 (t!44593 (toList!10609 lt!590034)) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (= (and d!143443 c!126122) b!1326558))

(assert (= (and d!143443 (not c!126122)) b!1326559))

(assert (= (and b!1326559 c!126123) b!1326560))

(assert (= (and b!1326559 (not c!126123)) b!1326561))

(declare-fun m!1215663 () Bool)

(assert (=> b!1326560 m!1215663))

(assert (=> b!1326308 d!143443))

(declare-fun d!143445 () Bool)

(declare-fun e!756341 () Bool)

(assert (=> d!143445 e!756341))

(declare-fun res!880098 () Bool)

(assert (=> d!143445 (=> (not res!880098) (not e!756341))))

(declare-fun lt!590199 () ListLongMap!21187)

(assert (=> d!143445 (= res!880098 (contains!8775 lt!590199 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590198 () List!30673)

(assert (=> d!143445 (= lt!590199 (ListLongMap!21188 lt!590198))))

(declare-fun lt!590197 () Unit!43597)

(declare-fun lt!590200 () Unit!43597)

(assert (=> d!143445 (= lt!590197 lt!590200)))

(assert (=> d!143445 (= (getValueByKey!708 lt!590198 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143445 (= lt!590200 (lemmaContainsTupThenGetReturnValue!358 lt!590198 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143445 (= lt!590198 (insertStrictlySorted!487 (toList!10609 call!64773) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143445 (= (+!4655 call!64773 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590199)))

(declare-fun b!1326562 () Bool)

(declare-fun res!880099 () Bool)

(assert (=> b!1326562 (=> (not res!880099) (not e!756341))))

(assert (=> b!1326562 (= res!880099 (= (getValueByKey!708 (toList!10609 lt!590199) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1326563 () Bool)

(assert (=> b!1326563 (= e!756341 (contains!8778 (toList!10609 lt!590199) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143445 res!880098) b!1326562))

(assert (= (and b!1326562 res!880099) b!1326563))

(declare-fun m!1215665 () Bool)

(assert (=> d!143445 m!1215665))

(declare-fun m!1215667 () Bool)

(assert (=> d!143445 m!1215667))

(declare-fun m!1215669 () Bool)

(assert (=> d!143445 m!1215669))

(declare-fun m!1215671 () Bool)

(assert (=> d!143445 m!1215671))

(declare-fun m!1215673 () Bool)

(assert (=> b!1326562 m!1215673))

(declare-fun m!1215675 () Bool)

(assert (=> b!1326563 m!1215675))

(assert (=> b!1326369 d!143445))

(declare-fun d!143447 () Bool)

(assert (=> d!143447 (= (apply!1038 lt!590101 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21807 (getValueByKey!708 (toList!10609 lt!590101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37920 () Bool)

(assert (= bs!37920 d!143447))

(declare-fun m!1215677 () Bool)

(assert (=> bs!37920 m!1215677))

(assert (=> bs!37920 m!1215677))

(declare-fun m!1215679 () Bool)

(assert (=> bs!37920 m!1215679))

(assert (=> b!1326385 d!143447))

(declare-fun d!143449 () Bool)

(declare-fun lt!590201 () Bool)

(assert (=> d!143449 (= lt!590201 (select (content!653 (toList!10609 lt!590030)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun e!756343 () Bool)

(assert (=> d!143449 (= lt!590201 e!756343)))

(declare-fun res!880100 () Bool)

(assert (=> d!143449 (=> (not res!880100) (not e!756343))))

(assert (=> d!143449 (= res!880100 ((_ is Cons!30669) (toList!10609 lt!590030)))))

(assert (=> d!143449 (= (contains!8778 (toList!10609 lt!590030) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590201)))

(declare-fun b!1326564 () Bool)

(declare-fun e!756342 () Bool)

(assert (=> b!1326564 (= e!756343 e!756342)))

(declare-fun res!880101 () Bool)

(assert (=> b!1326564 (=> res!880101 e!756342)))

(assert (=> b!1326564 (= res!880101 (= (h!31887 (toList!10609 lt!590030)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1326565 () Bool)

(assert (=> b!1326565 (= e!756342 (contains!8778 (t!44593 (toList!10609 lt!590030)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143449 res!880100) b!1326564))

(assert (= (and b!1326564 (not res!880101)) b!1326565))

(declare-fun m!1215681 () Bool)

(assert (=> d!143449 m!1215681))

(declare-fun m!1215683 () Bool)

(assert (=> d!143449 m!1215683))

(declare-fun m!1215685 () Bool)

(assert (=> b!1326565 m!1215685))

(assert (=> b!1326307 d!143449))

(declare-fun d!143451 () Bool)

(declare-fun e!756344 () Bool)

(assert (=> d!143451 e!756344))

(declare-fun res!880102 () Bool)

(assert (=> d!143451 (=> res!880102 e!756344)))

(declare-fun lt!590205 () Bool)

(assert (=> d!143451 (= res!880102 (not lt!590205))))

(declare-fun lt!590204 () Bool)

(assert (=> d!143451 (= lt!590205 lt!590204)))

(declare-fun lt!590203 () Unit!43597)

(declare-fun e!756345 () Unit!43597)

(assert (=> d!143451 (= lt!590203 e!756345)))

(declare-fun c!126124 () Bool)

(assert (=> d!143451 (= c!126124 lt!590204)))

(assert (=> d!143451 (= lt!590204 (containsKey!734 (toList!10609 lt!590027) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143451 (= (contains!8775 lt!590027 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590205)))

(declare-fun b!1326566 () Bool)

(declare-fun lt!590202 () Unit!43597)

(assert (=> b!1326566 (= e!756345 lt!590202)))

(assert (=> b!1326566 (= lt!590202 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590027) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1326566 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590027) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326567 () Bool)

(declare-fun Unit!43607 () Unit!43597)

(assert (=> b!1326567 (= e!756345 Unit!43607)))

(declare-fun b!1326568 () Bool)

(assert (=> b!1326568 (= e!756344 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590027) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143451 c!126124) b!1326566))

(assert (= (and d!143451 (not c!126124)) b!1326567))

(assert (= (and d!143451 (not res!880102)) b!1326568))

(declare-fun m!1215687 () Bool)

(assert (=> d!143451 m!1215687))

(declare-fun m!1215689 () Bool)

(assert (=> b!1326566 m!1215689))

(declare-fun m!1215691 () Bool)

(assert (=> b!1326566 m!1215691))

(assert (=> b!1326566 m!1215691))

(declare-fun m!1215693 () Bool)

(assert (=> b!1326566 m!1215693))

(assert (=> b!1326568 m!1215691))

(assert (=> b!1326568 m!1215691))

(assert (=> b!1326568 m!1215693))

(assert (=> d!143345 d!143451))

(assert (=> d!143345 d!143359))

(assert (=> b!1326294 d!143373))

(declare-fun d!143453 () Bool)

(assert (=> d!143453 (isDefined!517 (getValueByKey!708 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun lt!590208 () Unit!43597)

(declare-fun choose!1951 (List!30673 (_ BitVec 64)) Unit!43597)

(assert (=> d!143453 (= lt!590208 (choose!1951 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun e!756348 () Bool)

(assert (=> d!143453 e!756348))

(declare-fun res!880105 () Bool)

(assert (=> d!143453 (=> (not res!880105) (not e!756348))))

(assert (=> d!143453 (= res!880105 (isStrictlySorted!865 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))

(assert (=> d!143453 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) lt!590208)))

(declare-fun b!1326571 () Bool)

(assert (=> b!1326571 (= e!756348 (containsKey!734 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (= (and d!143453 res!880105) b!1326571))

(assert (=> d!143453 m!1215373))

(assert (=> d!143453 m!1215373))

(assert (=> d!143453 m!1215375))

(declare-fun m!1215695 () Bool)

(assert (=> d!143453 m!1215695))

(declare-fun m!1215697 () Bool)

(assert (=> d!143453 m!1215697))

(assert (=> b!1326571 m!1215369))

(assert (=> b!1326322 d!143453))

(declare-fun d!143455 () Bool)

(declare-fun isEmpty!1080 (Option!759) Bool)

(assert (=> d!143455 (= (isDefined!517 (getValueByKey!708 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)) (not (isEmpty!1080 (getValueByKey!708 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37921 () Bool)

(assert (= bs!37921 d!143455))

(assert (=> bs!37921 m!1215373))

(declare-fun m!1215699 () Bool)

(assert (=> bs!37921 m!1215699))

(assert (=> b!1326322 d!143455))

(declare-fun d!143457 () Bool)

(declare-fun c!126125 () Bool)

(assert (=> d!143457 (= c!126125 (and ((_ is Cons!30669) (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11772 (h!31887 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun e!756349 () Option!759)

(assert (=> d!143457 (= (getValueByKey!708 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!756349)))

(declare-fun b!1326573 () Bool)

(declare-fun e!756350 () Option!759)

(assert (=> b!1326573 (= e!756349 e!756350)))

(declare-fun c!126126 () Bool)

(assert (=> b!1326573 (= c!126126 (and ((_ is Cons!30669) (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (not (= (_1!11772 (h!31887 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164))))))

(declare-fun b!1326572 () Bool)

(assert (=> b!1326572 (= e!756349 (Some!758 (_2!11772 (h!31887 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))))

(declare-fun b!1326575 () Bool)

(assert (=> b!1326575 (= e!756350 None!757)))

(declare-fun b!1326574 () Bool)

(assert (=> b!1326574 (= e!756350 (getValueByKey!708 (t!44593 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!143457 c!126125) b!1326572))

(assert (= (and d!143457 (not c!126125)) b!1326573))

(assert (= (and b!1326573 c!126126) b!1326574))

(assert (= (and b!1326573 (not c!126126)) b!1326575))

(declare-fun m!1215701 () Bool)

(assert (=> b!1326574 m!1215701))

(assert (=> b!1326322 d!143457))

(declare-fun d!143459 () Bool)

(declare-fun e!756351 () Bool)

(assert (=> d!143459 e!756351))

(declare-fun res!880106 () Bool)

(assert (=> d!143459 (=> res!880106 e!756351)))

(declare-fun lt!590212 () Bool)

(assert (=> d!143459 (= res!880106 (not lt!590212))))

(declare-fun lt!590211 () Bool)

(assert (=> d!143459 (= lt!590212 lt!590211)))

(declare-fun lt!590210 () Unit!43597)

(declare-fun e!756352 () Unit!43597)

(assert (=> d!143459 (= lt!590210 e!756352)))

(declare-fun c!126127 () Bool)

(assert (=> d!143459 (= c!126127 lt!590211)))

(assert (=> d!143459 (= lt!590211 (containsKey!734 (toList!10609 lt!590101) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143459 (= (contains!8775 lt!590101 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590212)))

(declare-fun b!1326576 () Bool)

(declare-fun lt!590209 () Unit!43597)

(assert (=> b!1326576 (= e!756352 lt!590209)))

(assert (=> b!1326576 (= lt!590209 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590101) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1326576 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590101) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326577 () Bool)

(declare-fun Unit!43608 () Unit!43597)

(assert (=> b!1326577 (= e!756352 Unit!43608)))

(declare-fun b!1326578 () Bool)

(assert (=> b!1326578 (= e!756351 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590101) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143459 c!126127) b!1326576))

(assert (= (and d!143459 (not c!126127)) b!1326577))

(assert (= (and d!143459 (not res!880106)) b!1326578))

(declare-fun m!1215703 () Bool)

(assert (=> d!143459 m!1215703))

(declare-fun m!1215705 () Bool)

(assert (=> b!1326576 m!1215705))

(assert (=> b!1326576 m!1215677))

(assert (=> b!1326576 m!1215677))

(declare-fun m!1215707 () Bool)

(assert (=> b!1326576 m!1215707))

(assert (=> b!1326578 m!1215677))

(assert (=> b!1326578 m!1215677))

(assert (=> b!1326578 m!1215707))

(assert (=> bm!64769 d!143459))

(declare-fun b!1326579 () Bool)

(declare-fun e!756358 () ListLongMap!21187)

(declare-fun e!756353 () ListLongMap!21187)

(assert (=> b!1326579 (= e!756358 e!756353)))

(declare-fun c!126129 () Bool)

(assert (=> b!1326579 (= c!126129 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(declare-fun e!756354 () Bool)

(declare-fun b!1326580 () Bool)

(declare-fun lt!590219 () ListLongMap!21187)

(assert (=> b!1326580 (= e!756354 (= lt!590219 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun bm!64789 () Bool)

(declare-fun call!64792 () ListLongMap!21187)

(assert (=> bm!64789 (= call!64792 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1326581 () Bool)

(declare-fun lt!590218 () Unit!43597)

(declare-fun lt!590216 () Unit!43597)

(assert (=> b!1326581 (= lt!590218 lt!590216)))

(declare-fun lt!590214 () (_ BitVec 64))

(declare-fun lt!590213 () (_ BitVec 64))

(declare-fun lt!590215 () V!53473)

(declare-fun lt!590217 () ListLongMap!21187)

(assert (=> b!1326581 (not (contains!8775 (+!4655 lt!590217 (tuple2!23523 lt!590214 lt!590215)) lt!590213))))

(assert (=> b!1326581 (= lt!590216 (addStillNotContains!494 lt!590217 lt!590214 lt!590215 lt!590213))))

(assert (=> b!1326581 (= lt!590213 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1326581 (= lt!590215 (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1326581 (= lt!590214 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)))))

(assert (=> b!1326581 (= lt!590217 call!64792)))

(assert (=> b!1326581 (= e!756353 (+!4655 call!64792 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326582 () Bool)

(assert (=> b!1326582 (= e!756354 (isEmpty!1079 lt!590219))))

(declare-fun b!1326583 () Bool)

(assert (=> b!1326583 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(assert (=> b!1326583 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43798 _values!1337)))))

(declare-fun e!756356 () Bool)

(assert (=> b!1326583 (= e!756356 (= (apply!1038 lt!590219 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326584 () Bool)

(declare-fun e!756355 () Bool)

(declare-fun e!756357 () Bool)

(assert (=> b!1326584 (= e!756355 e!756357)))

(declare-fun c!126128 () Bool)

(declare-fun e!756359 () Bool)

(assert (=> b!1326584 (= c!126128 e!756359)))

(declare-fun res!880107 () Bool)

(assert (=> b!1326584 (=> (not res!880107) (not e!756359))))

(assert (=> b!1326584 (= res!880107 (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(declare-fun d!143461 () Bool)

(assert (=> d!143461 e!756355))

(declare-fun res!880109 () Bool)

(assert (=> d!143461 (=> (not res!880109) (not e!756355))))

(assert (=> d!143461 (= res!880109 (not (contains!8775 lt!590219 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143461 (= lt!590219 e!756358)))

(declare-fun c!126130 () Bool)

(assert (=> d!143461 (= c!126130 (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(assert (=> d!143461 (validMask!0 mask!2019)))

(assert (=> d!143461 (= (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340) lt!590219)))

(declare-fun b!1326585 () Bool)

(assert (=> b!1326585 (= e!756357 e!756356)))

(assert (=> b!1326585 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(declare-fun res!880108 () Bool)

(assert (=> b!1326585 (= res!880108 (contains!8775 lt!590219 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(assert (=> b!1326585 (=> (not res!880108) (not e!756356))))

(declare-fun b!1326586 () Bool)

(assert (=> b!1326586 (= e!756357 e!756354)))

(declare-fun c!126131 () Bool)

(assert (=> b!1326586 (= c!126131 (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43797 _keys!1609)))))

(declare-fun b!1326587 () Bool)

(assert (=> b!1326587 (= e!756353 call!64792)))

(declare-fun b!1326588 () Bool)

(assert (=> b!1326588 (= e!756358 (ListLongMap!21188 Nil!30670))))

(declare-fun b!1326589 () Bool)

(declare-fun res!880110 () Bool)

(assert (=> b!1326589 (=> (not res!880110) (not e!756355))))

(assert (=> b!1326589 (= res!880110 (not (contains!8775 lt!590219 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326590 () Bool)

(assert (=> b!1326590 (= e!756359 (validKeyInArray!0 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(assert (=> b!1326590 (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (= (and d!143461 c!126130) b!1326588))

(assert (= (and d!143461 (not c!126130)) b!1326579))

(assert (= (and b!1326579 c!126129) b!1326581))

(assert (= (and b!1326579 (not c!126129)) b!1326587))

(assert (= (or b!1326581 b!1326587) bm!64789))

(assert (= (and d!143461 res!880109) b!1326589))

(assert (= (and b!1326589 res!880110) b!1326584))

(assert (= (and b!1326584 res!880107) b!1326590))

(assert (= (and b!1326584 c!126128) b!1326585))

(assert (= (and b!1326584 (not c!126128)) b!1326586))

(assert (= (and b!1326585 res!880108) b!1326583))

(assert (= (and b!1326586 c!126131) b!1326580))

(assert (= (and b!1326586 (not c!126131)) b!1326582))

(declare-fun b_lambda!23723 () Bool)

(assert (=> (not b_lambda!23723) (not b!1326581)))

(assert (=> b!1326581 t!44592))

(declare-fun b_and!49019 () Bool)

(assert (= b_and!49017 (and (=> t!44592 result!24509) b_and!49019)))

(declare-fun b_lambda!23725 () Bool)

(assert (=> (not b_lambda!23725) (not b!1326583)))

(assert (=> b!1326583 t!44592))

(declare-fun b_and!49021 () Bool)

(assert (= b_and!49019 (and (=> t!44592 result!24509) b_and!49021)))

(declare-fun m!1215709 () Bool)

(assert (=> b!1326579 m!1215709))

(assert (=> b!1326579 m!1215709))

(declare-fun m!1215711 () Bool)

(assert (=> b!1326579 m!1215711))

(assert (=> b!1326590 m!1215709))

(assert (=> b!1326590 m!1215709))

(assert (=> b!1326590 m!1215711))

(declare-fun m!1215713 () Bool)

(assert (=> bm!64789 m!1215713))

(declare-fun m!1215715 () Bool)

(assert (=> b!1326582 m!1215715))

(assert (=> b!1326585 m!1215709))

(assert (=> b!1326585 m!1215709))

(declare-fun m!1215717 () Bool)

(assert (=> b!1326585 m!1215717))

(declare-fun m!1215719 () Bool)

(assert (=> b!1326589 m!1215719))

(declare-fun m!1215721 () Bool)

(assert (=> b!1326581 m!1215721))

(assert (=> b!1326581 m!1215183))

(declare-fun m!1215723 () Bool)

(assert (=> b!1326581 m!1215723))

(assert (=> b!1326581 m!1215721))

(assert (=> b!1326581 m!1215709))

(declare-fun m!1215725 () Bool)

(assert (=> b!1326581 m!1215725))

(declare-fun m!1215727 () Bool)

(assert (=> b!1326581 m!1215727))

(declare-fun m!1215729 () Bool)

(assert (=> b!1326581 m!1215729))

(assert (=> b!1326581 m!1215725))

(assert (=> b!1326581 m!1215183))

(declare-fun m!1215731 () Bool)

(assert (=> b!1326581 m!1215731))

(assert (=> b!1326583 m!1215721))

(assert (=> b!1326583 m!1215183))

(assert (=> b!1326583 m!1215723))

(assert (=> b!1326583 m!1215721))

(assert (=> b!1326583 m!1215709))

(declare-fun m!1215733 () Bool)

(assert (=> b!1326583 m!1215733))

(assert (=> b!1326583 m!1215183))

(assert (=> b!1326583 m!1215709))

(assert (=> b!1326580 m!1215713))

(declare-fun m!1215735 () Bool)

(assert (=> d!143461 m!1215735))

(assert (=> d!143461 m!1215173))

(assert (=> bm!64749 d!143461))

(assert (=> b!1326295 d!143461))

(assert (=> b!1326372 d!143357))

(assert (=> b!1326324 d!143455))

(assert (=> b!1326324 d!143457))

(declare-fun d!143463 () Bool)

(assert (=> d!143463 (= (apply!1038 lt!590027 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21807 (getValueByKey!708 (toList!10609 lt!590027) (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(declare-fun bs!37922 () Bool)

(assert (= bs!37922 d!143463))

(assert (=> bs!37922 m!1215305))

(declare-fun m!1215737 () Bool)

(assert (=> bs!37922 m!1215737))

(assert (=> bs!37922 m!1215737))

(declare-fun m!1215739 () Bool)

(assert (=> bs!37922 m!1215739))

(assert (=> b!1326298 d!143463))

(declare-fun d!143465 () Bool)

(declare-fun c!126132 () Bool)

(assert (=> d!143465 (= c!126132 ((_ is ValueCellFull!17240) (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun e!756360 () V!53473)

(assert (=> d!143465 (= (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756360)))

(declare-fun b!1326591 () Bool)

(assert (=> b!1326591 (= e!756360 (get!21805 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1326592 () Bool)

(assert (=> b!1326592 (= e!756360 (get!21806 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143465 c!126132) b!1326591))

(assert (= (and d!143465 (not c!126132)) b!1326592))

(assert (=> b!1326591 m!1215317))

(assert (=> b!1326591 m!1215183))

(declare-fun m!1215741 () Bool)

(assert (=> b!1326591 m!1215741))

(assert (=> b!1326592 m!1215317))

(assert (=> b!1326592 m!1215183))

(declare-fun m!1215743 () Bool)

(assert (=> b!1326592 m!1215743))

(assert (=> b!1326298 d!143465))

(declare-fun d!143467 () Bool)

(declare-fun c!126133 () Bool)

(assert (=> d!143467 (= c!126133 (and ((_ is Cons!30669) (toList!10609 lt!590005)) (= (_1!11772 (h!31887 (toList!10609 lt!590005))) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!756361 () Option!759)

(assert (=> d!143467 (= (getValueByKey!708 (toList!10609 lt!590005) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!756361)))

(declare-fun b!1326594 () Bool)

(declare-fun e!756362 () Option!759)

(assert (=> b!1326594 (= e!756361 e!756362)))

(declare-fun c!126134 () Bool)

(assert (=> b!1326594 (= c!126134 (and ((_ is Cons!30669) (toList!10609 lt!590005)) (not (= (_1!11772 (h!31887 (toList!10609 lt!590005))) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!1326593 () Bool)

(assert (=> b!1326593 (= e!756361 (Some!758 (_2!11772 (h!31887 (toList!10609 lt!590005)))))))

(declare-fun b!1326596 () Bool)

(assert (=> b!1326596 (= e!756362 None!757)))

(declare-fun b!1326595 () Bool)

(assert (=> b!1326595 (= e!756362 (getValueByKey!708 (t!44593 (toList!10609 lt!590005)) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (= (and d!143467 c!126133) b!1326593))

(assert (= (and d!143467 (not c!126133)) b!1326594))

(assert (= (and b!1326594 c!126134) b!1326595))

(assert (= (and b!1326594 (not c!126134)) b!1326596))

(declare-fun m!1215745 () Bool)

(assert (=> b!1326595 m!1215745))

(assert (=> b!1326262 d!143467))

(declare-fun d!143469 () Bool)

(assert (=> d!143469 (= (apply!1038 lt!590101 (select (arr!43246 _keys!1609) from!2000)) (get!21807 (getValueByKey!708 (toList!10609 lt!590101) (select (arr!43246 _keys!1609) from!2000))))))

(declare-fun bs!37923 () Bool)

(assert (= bs!37923 d!143469))

(assert (=> bs!37923 m!1215195))

(assert (=> bs!37923 m!1215455))

(assert (=> bs!37923 m!1215455))

(declare-fun m!1215747 () Bool)

(assert (=> bs!37923 m!1215747))

(assert (=> b!1326375 d!143469))

(assert (=> b!1326375 d!143343))

(declare-fun d!143471 () Bool)

(declare-fun isEmpty!1081 (List!30673) Bool)

(assert (=> d!143471 (= (isEmpty!1079 lt!590027) (isEmpty!1081 (toList!10609 lt!590027)))))

(declare-fun bs!37924 () Bool)

(assert (= bs!37924 d!143471))

(declare-fun m!1215749 () Bool)

(assert (=> bs!37924 m!1215749))

(assert (=> b!1326297 d!143471))

(declare-fun d!143473 () Bool)

(declare-fun e!756363 () Bool)

(assert (=> d!143473 e!756363))

(declare-fun res!880111 () Bool)

(assert (=> d!143473 (=> res!880111 e!756363)))

(declare-fun lt!590223 () Bool)

(assert (=> d!143473 (= res!880111 (not lt!590223))))

(declare-fun lt!590222 () Bool)

(assert (=> d!143473 (= lt!590223 lt!590222)))

(declare-fun lt!590221 () Unit!43597)

(declare-fun e!756364 () Unit!43597)

(assert (=> d!143473 (= lt!590221 e!756364)))

(declare-fun c!126135 () Bool)

(assert (=> d!143473 (= c!126135 lt!590222)))

(assert (=> d!143473 (= lt!590222 (containsKey!734 (toList!10609 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023))) lt!590021))))

(assert (=> d!143473 (= (contains!8775 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023)) lt!590021) lt!590223)))

(declare-fun b!1326597 () Bool)

(declare-fun lt!590220 () Unit!43597)

(assert (=> b!1326597 (= e!756364 lt!590220)))

(assert (=> b!1326597 (= lt!590220 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023))) lt!590021))))

(assert (=> b!1326597 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023))) lt!590021))))

(declare-fun b!1326598 () Bool)

(declare-fun Unit!43609 () Unit!43597)

(assert (=> b!1326598 (= e!756364 Unit!43609)))

(declare-fun b!1326599 () Bool)

(assert (=> b!1326599 (= e!756363 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023))) lt!590021)))))

(assert (= (and d!143473 c!126135) b!1326597))

(assert (= (and d!143473 (not c!126135)) b!1326598))

(assert (= (and d!143473 (not res!880111)) b!1326599))

(declare-fun m!1215751 () Bool)

(assert (=> d!143473 m!1215751))

(declare-fun m!1215753 () Bool)

(assert (=> b!1326597 m!1215753))

(declare-fun m!1215755 () Bool)

(assert (=> b!1326597 m!1215755))

(assert (=> b!1326597 m!1215755))

(declare-fun m!1215757 () Bool)

(assert (=> b!1326597 m!1215757))

(assert (=> b!1326599 m!1215755))

(assert (=> b!1326599 m!1215755))

(assert (=> b!1326599 m!1215757))

(assert (=> b!1326296 d!143473))

(declare-fun d!143475 () Bool)

(declare-fun e!756365 () Bool)

(assert (=> d!143475 e!756365))

(declare-fun res!880112 () Bool)

(assert (=> d!143475 (=> (not res!880112) (not e!756365))))

(declare-fun lt!590226 () ListLongMap!21187)

(assert (=> d!143475 (= res!880112 (contains!8775 lt!590226 (_1!11772 (tuple2!23523 lt!590022 lt!590023))))))

(declare-fun lt!590225 () List!30673)

(assert (=> d!143475 (= lt!590226 (ListLongMap!21188 lt!590225))))

(declare-fun lt!590224 () Unit!43597)

(declare-fun lt!590227 () Unit!43597)

(assert (=> d!143475 (= lt!590224 lt!590227)))

(assert (=> d!143475 (= (getValueByKey!708 lt!590225 (_1!11772 (tuple2!23523 lt!590022 lt!590023))) (Some!758 (_2!11772 (tuple2!23523 lt!590022 lt!590023))))))

(assert (=> d!143475 (= lt!590227 (lemmaContainsTupThenGetReturnValue!358 lt!590225 (_1!11772 (tuple2!23523 lt!590022 lt!590023)) (_2!11772 (tuple2!23523 lt!590022 lt!590023))))))

(assert (=> d!143475 (= lt!590225 (insertStrictlySorted!487 (toList!10609 lt!590025) (_1!11772 (tuple2!23523 lt!590022 lt!590023)) (_2!11772 (tuple2!23523 lt!590022 lt!590023))))))

(assert (=> d!143475 (= (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023)) lt!590226)))

(declare-fun b!1326600 () Bool)

(declare-fun res!880113 () Bool)

(assert (=> b!1326600 (=> (not res!880113) (not e!756365))))

(assert (=> b!1326600 (= res!880113 (= (getValueByKey!708 (toList!10609 lt!590226) (_1!11772 (tuple2!23523 lt!590022 lt!590023))) (Some!758 (_2!11772 (tuple2!23523 lt!590022 lt!590023)))))))

(declare-fun b!1326601 () Bool)

(assert (=> b!1326601 (= e!756365 (contains!8778 (toList!10609 lt!590226) (tuple2!23523 lt!590022 lt!590023)))))

(assert (= (and d!143475 res!880112) b!1326600))

(assert (= (and b!1326600 res!880113) b!1326601))

(declare-fun m!1215759 () Bool)

(assert (=> d!143475 m!1215759))

(declare-fun m!1215761 () Bool)

(assert (=> d!143475 m!1215761))

(declare-fun m!1215763 () Bool)

(assert (=> d!143475 m!1215763))

(declare-fun m!1215765 () Bool)

(assert (=> d!143475 m!1215765))

(declare-fun m!1215767 () Bool)

(assert (=> b!1326600 m!1215767))

(declare-fun m!1215769 () Bool)

(assert (=> b!1326601 m!1215769))

(assert (=> b!1326296 d!143475))

(declare-fun d!143477 () Bool)

(assert (=> d!143477 (not (contains!8775 (+!4655 lt!590025 (tuple2!23523 lt!590022 lt!590023)) lt!590021))))

(declare-fun lt!590230 () Unit!43597)

(declare-fun choose!1952 (ListLongMap!21187 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43597)

(assert (=> d!143477 (= lt!590230 (choose!1952 lt!590025 lt!590022 lt!590023 lt!590021))))

(declare-fun e!756368 () Bool)

(assert (=> d!143477 e!756368))

(declare-fun res!880116 () Bool)

(assert (=> d!143477 (=> (not res!880116) (not e!756368))))

(assert (=> d!143477 (= res!880116 (not (contains!8775 lt!590025 lt!590021)))))

(assert (=> d!143477 (= (addStillNotContains!494 lt!590025 lt!590022 lt!590023 lt!590021) lt!590230)))

(declare-fun b!1326605 () Bool)

(assert (=> b!1326605 (= e!756368 (not (= lt!590022 lt!590021)))))

(assert (= (and d!143477 res!880116) b!1326605))

(assert (=> d!143477 m!1215321))

(assert (=> d!143477 m!1215321))

(assert (=> d!143477 m!1215323))

(declare-fun m!1215771 () Bool)

(assert (=> d!143477 m!1215771))

(declare-fun m!1215773 () Bool)

(assert (=> d!143477 m!1215773))

(assert (=> b!1326296 d!143477))

(declare-fun d!143479 () Bool)

(declare-fun e!756369 () Bool)

(assert (=> d!143479 e!756369))

(declare-fun res!880117 () Bool)

(assert (=> d!143479 (=> (not res!880117) (not e!756369))))

(declare-fun lt!590233 () ListLongMap!21187)

(assert (=> d!143479 (= res!880117 (contains!8775 lt!590233 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!590232 () List!30673)

(assert (=> d!143479 (= lt!590233 (ListLongMap!21188 lt!590232))))

(declare-fun lt!590231 () Unit!43597)

(declare-fun lt!590234 () Unit!43597)

(assert (=> d!143479 (= lt!590231 lt!590234)))

(assert (=> d!143479 (= (getValueByKey!708 lt!590232 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143479 (= lt!590234 (lemmaContainsTupThenGetReturnValue!358 lt!590232 (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143479 (= lt!590232 (insertStrictlySorted!487 (toList!10609 call!64752) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143479 (= (+!4655 call!64752 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!590233)))

(declare-fun b!1326606 () Bool)

(declare-fun res!880118 () Bool)

(assert (=> b!1326606 (=> (not res!880118) (not e!756369))))

(assert (=> b!1326606 (= res!880118 (= (getValueByKey!708 (toList!10609 lt!590233) (_1!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!758 (_2!11772 (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1326607 () Bool)

(assert (=> b!1326607 (= e!756369 (contains!8778 (toList!10609 lt!590233) (tuple2!23523 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21802 (select (arr!43247 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143479 res!880117) b!1326606))

(assert (= (and b!1326606 res!880118) b!1326607))

(declare-fun m!1215775 () Bool)

(assert (=> d!143479 m!1215775))

(declare-fun m!1215777 () Bool)

(assert (=> d!143479 m!1215777))

(declare-fun m!1215779 () Bool)

(assert (=> d!143479 m!1215779))

(declare-fun m!1215781 () Bool)

(assert (=> d!143479 m!1215781))

(declare-fun m!1215783 () Bool)

(assert (=> b!1326606 m!1215783))

(declare-fun m!1215785 () Bool)

(assert (=> b!1326607 m!1215785))

(assert (=> b!1326296 d!143479))

(assert (=> b!1326296 d!143465))

(declare-fun d!143481 () Bool)

(assert (=> d!143481 (= (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)) (not (isEmpty!1080 (getValueByKey!708 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))))

(declare-fun bs!37925 () Bool)

(assert (= bs!37925 d!143481))

(assert (=> bs!37925 m!1215285))

(declare-fun m!1215787 () Bool)

(assert (=> bs!37925 m!1215787))

(assert (=> b!1326257 d!143481))

(declare-fun d!143483 () Bool)

(declare-fun c!126136 () Bool)

(assert (=> d!143483 (= c!126136 (and ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (= (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(declare-fun e!756370 () Option!759)

(assert (=> d!143483 (= (getValueByKey!708 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) e!756370)))

(declare-fun b!1326609 () Bool)

(declare-fun e!756371 () Option!759)

(assert (=> b!1326609 (= e!756370 e!756371)))

(declare-fun c!126137 () Bool)

(assert (=> b!1326609 (= c!126137 (and ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (not (= (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164))))))

(declare-fun b!1326608 () Bool)

(assert (=> b!1326608 (= e!756370 (Some!758 (_2!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))))

(declare-fun b!1326611 () Bool)

(assert (=> b!1326611 (= e!756371 None!757)))

(declare-fun b!1326610 () Bool)

(assert (=> b!1326610 (= e!756371 (getValueByKey!708 (t!44593 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) k0!1164))))

(assert (= (and d!143483 c!126136) b!1326608))

(assert (= (and d!143483 (not c!126136)) b!1326609))

(assert (= (and b!1326609 c!126137) b!1326610))

(assert (= (and b!1326609 (not c!126137)) b!1326611))

(declare-fun m!1215789 () Bool)

(assert (=> b!1326610 m!1215789))

(assert (=> b!1326257 d!143483))

(declare-fun d!143485 () Bool)

(declare-fun e!756372 () Bool)

(assert (=> d!143485 e!756372))

(declare-fun res!880119 () Bool)

(assert (=> d!143485 (=> res!880119 e!756372)))

(declare-fun lt!590238 () Bool)

(assert (=> d!143485 (= res!880119 (not lt!590238))))

(declare-fun lt!590237 () Bool)

(assert (=> d!143485 (= lt!590238 lt!590237)))

(declare-fun lt!590236 () Unit!43597)

(declare-fun e!756373 () Unit!43597)

(assert (=> d!143485 (= lt!590236 e!756373)))

(declare-fun c!126138 () Bool)

(assert (=> d!143485 (= c!126138 lt!590237)))

(assert (=> d!143485 (= lt!590237 (containsKey!734 (toList!10609 lt!590027) (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> d!143485 (= (contains!8775 lt!590027 (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) lt!590238)))

(declare-fun b!1326612 () Bool)

(declare-fun lt!590235 () Unit!43597)

(assert (=> b!1326612 (= e!756373 lt!590235)))

(assert (=> b!1326612 (= lt!590235 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590027) (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1326612 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590027) (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1326613 () Bool)

(declare-fun Unit!43610 () Unit!43597)

(assert (=> b!1326613 (= e!756373 Unit!43610)))

(declare-fun b!1326614 () Bool)

(assert (=> b!1326614 (= e!756372 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590027) (select (arr!43246 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(assert (= (and d!143485 c!126138) b!1326612))

(assert (= (and d!143485 (not c!126138)) b!1326613))

(assert (= (and d!143485 (not res!880119)) b!1326614))

(assert (=> d!143485 m!1215305))

(declare-fun m!1215791 () Bool)

(assert (=> d!143485 m!1215791))

(assert (=> b!1326612 m!1215305))

(declare-fun m!1215793 () Bool)

(assert (=> b!1326612 m!1215793))

(assert (=> b!1326612 m!1215305))

(assert (=> b!1326612 m!1215737))

(assert (=> b!1326612 m!1215737))

(declare-fun m!1215795 () Bool)

(assert (=> b!1326612 m!1215795))

(assert (=> b!1326614 m!1215305))

(assert (=> b!1326614 m!1215737))

(assert (=> b!1326614 m!1215737))

(assert (=> b!1326614 m!1215795))

(assert (=> b!1326300 d!143485))

(declare-fun d!143487 () Bool)

(declare-fun e!756374 () Bool)

(assert (=> d!143487 e!756374))

(declare-fun res!880120 () Bool)

(assert (=> d!143487 (=> res!880120 e!756374)))

(declare-fun lt!590242 () Bool)

(assert (=> d!143487 (= res!880120 (not lt!590242))))

(declare-fun lt!590241 () Bool)

(assert (=> d!143487 (= lt!590242 lt!590241)))

(declare-fun lt!590240 () Unit!43597)

(declare-fun e!756375 () Unit!43597)

(assert (=> d!143487 (= lt!590240 e!756375)))

(declare-fun c!126139 () Bool)

(assert (=> d!143487 (= c!126139 lt!590241)))

(assert (=> d!143487 (= lt!590241 (containsKey!734 (toList!10609 lt!590030) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143487 (= (contains!8775 lt!590030 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590242)))

(declare-fun b!1326615 () Bool)

(declare-fun lt!590239 () Unit!43597)

(assert (=> b!1326615 (= e!756375 lt!590239)))

(assert (=> b!1326615 (= lt!590239 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590030) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> b!1326615 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590030) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326616 () Bool)

(declare-fun Unit!43611 () Unit!43597)

(assert (=> b!1326616 (= e!756375 Unit!43611)))

(declare-fun b!1326617 () Bool)

(assert (=> b!1326617 (= e!756374 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590030) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (= (and d!143487 c!126139) b!1326615))

(assert (= (and d!143487 (not c!126139)) b!1326616))

(assert (= (and d!143487 (not res!880120)) b!1326617))

(declare-fun m!1215797 () Bool)

(assert (=> d!143487 m!1215797))

(declare-fun m!1215799 () Bool)

(assert (=> b!1326615 m!1215799))

(assert (=> b!1326615 m!1215341))

(assert (=> b!1326615 m!1215341))

(declare-fun m!1215801 () Bool)

(assert (=> b!1326615 m!1215801))

(assert (=> b!1326617 m!1215341))

(assert (=> b!1326617 m!1215341))

(assert (=> b!1326617 m!1215801))

(assert (=> d!143347 d!143487))

(declare-fun d!143489 () Bool)

(declare-fun c!126140 () Bool)

(assert (=> d!143489 (= c!126140 (and ((_ is Cons!30669) lt!590029) (= (_1!11772 (h!31887 lt!590029)) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun e!756376 () Option!759)

(assert (=> d!143489 (= (getValueByKey!708 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) e!756376)))

(declare-fun b!1326619 () Bool)

(declare-fun e!756377 () Option!759)

(assert (=> b!1326619 (= e!756376 e!756377)))

(declare-fun c!126141 () Bool)

(assert (=> b!1326619 (= c!126141 (and ((_ is Cons!30669) lt!590029) (not (= (_1!11772 (h!31887 lt!590029)) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1326618 () Bool)

(assert (=> b!1326618 (= e!756376 (Some!758 (_2!11772 (h!31887 lt!590029))))))

(declare-fun b!1326621 () Bool)

(assert (=> b!1326621 (= e!756377 None!757)))

(declare-fun b!1326620 () Bool)

(assert (=> b!1326620 (= e!756377 (getValueByKey!708 (t!44593 lt!590029) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143489 c!126140) b!1326618))

(assert (= (and d!143489 (not c!126140)) b!1326619))

(assert (= (and b!1326619 c!126141) b!1326620))

(assert (= (and b!1326619 (not c!126141)) b!1326621))

(declare-fun m!1215803 () Bool)

(assert (=> b!1326620 m!1215803))

(assert (=> d!143347 d!143489))

(declare-fun d!143491 () Bool)

(assert (=> d!143491 (= (getValueByKey!708 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590243 () Unit!43597)

(assert (=> d!143491 (= lt!590243 (choose!1948 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun e!756378 () Bool)

(assert (=> d!143491 e!756378))

(declare-fun res!880121 () Bool)

(assert (=> d!143491 (=> (not res!880121) (not e!756378))))

(assert (=> d!143491 (= res!880121 (isStrictlySorted!865 lt!590029))))

(assert (=> d!143491 (= (lemmaContainsTupThenGetReturnValue!358 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590243)))

(declare-fun b!1326622 () Bool)

(declare-fun res!880122 () Bool)

(assert (=> b!1326622 (=> (not res!880122) (not e!756378))))

(assert (=> b!1326622 (= res!880122 (containsKey!734 lt!590029 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326623 () Bool)

(assert (=> b!1326623 (= e!756378 (contains!8778 lt!590029 (tuple2!23523 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (= (and d!143491 res!880121) b!1326622))

(assert (= (and b!1326622 res!880122) b!1326623))

(assert (=> d!143491 m!1215335))

(declare-fun m!1215805 () Bool)

(assert (=> d!143491 m!1215805))

(declare-fun m!1215807 () Bool)

(assert (=> d!143491 m!1215807))

(declare-fun m!1215809 () Bool)

(assert (=> b!1326622 m!1215809))

(declare-fun m!1215811 () Bool)

(assert (=> b!1326623 m!1215811))

(assert (=> d!143347 d!143491))

(declare-fun b!1326624 () Bool)

(declare-fun e!756382 () List!30673)

(assert (=> b!1326624 (= e!756382 (insertStrictlySorted!487 (t!44593 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326625 () Bool)

(declare-fun res!880124 () Bool)

(declare-fun e!756380 () Bool)

(assert (=> b!1326625 (=> (not res!880124) (not e!756380))))

(declare-fun lt!590244 () List!30673)

(assert (=> b!1326625 (= res!880124 (containsKey!734 lt!590244 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun c!126142 () Bool)

(declare-fun b!1326626 () Bool)

(assert (=> b!1326626 (= c!126142 (and ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (bvsgt (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun e!756381 () List!30673)

(declare-fun e!756379 () List!30673)

(assert (=> b!1326626 (= e!756381 e!756379)))

(declare-fun bm!64790 () Bool)

(declare-fun call!64794 () List!30673)

(declare-fun call!64793 () List!30673)

(assert (=> bm!64790 (= call!64794 call!64793)))

(declare-fun b!1326627 () Bool)

(declare-fun call!64795 () List!30673)

(assert (=> b!1326627 (= e!756379 call!64795)))

(declare-fun b!1326628 () Bool)

(assert (=> b!1326628 (= e!756381 call!64794)))

(declare-fun b!1326629 () Bool)

(assert (=> b!1326629 (= e!756379 call!64795)))

(declare-fun c!126145 () Bool)

(declare-fun bm!64791 () Bool)

(assert (=> bm!64791 (= call!64793 ($colon$colon!668 e!756382 (ite c!126145 (h!31887 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (tuple2!23523 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun c!126143 () Bool)

(assert (=> bm!64791 (= c!126143 c!126145)))

(declare-fun bm!64792 () Bool)

(assert (=> bm!64792 (= call!64795 call!64794)))

(declare-fun c!126144 () Bool)

(declare-fun b!1326631 () Bool)

(assert (=> b!1326631 (= e!756382 (ite c!126144 (t!44593 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (ite c!126142 (Cons!30669 (h!31887 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (t!44593 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) Nil!30670)))))

(declare-fun b!1326632 () Bool)

(declare-fun e!756383 () List!30673)

(assert (=> b!1326632 (= e!756383 call!64793)))

(declare-fun b!1326633 () Bool)

(assert (=> b!1326633 (= e!756380 (contains!8778 lt!590244 (tuple2!23523 (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1326630 () Bool)

(assert (=> b!1326630 (= e!756383 e!756381)))

(assert (=> b!1326630 (= c!126144 (and ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (= (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun d!143493 () Bool)

(assert (=> d!143493 e!756380))

(declare-fun res!880123 () Bool)

(assert (=> d!143493 (=> (not res!880123) (not e!756380))))

(assert (=> d!143493 (= res!880123 (isStrictlySorted!865 lt!590244))))

(assert (=> d!143493 (= lt!590244 e!756383)))

(assert (=> d!143493 (= c!126145 (and ((_ is Cons!30669) (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (bvslt (_1!11772 (h!31887 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143493 (isStrictlySorted!865 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!143493 (= (insertStrictlySorted!487 (toList!10609 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (_1!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11772 (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590244)))

(assert (= (and d!143493 c!126145) b!1326632))

(assert (= (and d!143493 (not c!126145)) b!1326630))

(assert (= (and b!1326630 c!126144) b!1326628))

(assert (= (and b!1326630 (not c!126144)) b!1326626))

(assert (= (and b!1326626 c!126142) b!1326627))

(assert (= (and b!1326626 (not c!126142)) b!1326629))

(assert (= (or b!1326627 b!1326629) bm!64792))

(assert (= (or b!1326628 bm!64792) bm!64790))

(assert (= (or b!1326632 bm!64790) bm!64791))

(assert (= (and bm!64791 c!126143) b!1326624))

(assert (= (and bm!64791 (not c!126143)) b!1326631))

(assert (= (and d!143493 res!880123) b!1326625))

(assert (= (and b!1326625 res!880124) b!1326633))

(declare-fun m!1215813 () Bool)

(assert (=> bm!64791 m!1215813))

(declare-fun m!1215815 () Bool)

(assert (=> b!1326624 m!1215815))

(declare-fun m!1215817 () Bool)

(assert (=> d!143493 m!1215817))

(declare-fun m!1215819 () Bool)

(assert (=> d!143493 m!1215819))

(declare-fun m!1215821 () Bool)

(assert (=> b!1326625 m!1215821))

(declare-fun m!1215823 () Bool)

(assert (=> b!1326633 m!1215823))

(assert (=> d!143347 d!143493))

(declare-fun lt!590245 () Bool)

(declare-fun d!143495 () Bool)

(assert (=> d!143495 (= lt!590245 (select (content!653 (toList!10609 lt!590005)) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!756385 () Bool)

(assert (=> d!143495 (= lt!590245 e!756385)))

(declare-fun res!880125 () Bool)

(assert (=> d!143495 (=> (not res!880125) (not e!756385))))

(assert (=> d!143495 (= res!880125 ((_ is Cons!30669) (toList!10609 lt!590005)))))

(assert (=> d!143495 (= (contains!8778 (toList!10609 lt!590005) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!590245)))

(declare-fun b!1326634 () Bool)

(declare-fun e!756384 () Bool)

(assert (=> b!1326634 (= e!756385 e!756384)))

(declare-fun res!880126 () Bool)

(assert (=> b!1326634 (=> res!880126 e!756384)))

(assert (=> b!1326634 (= res!880126 (= (h!31887 (toList!10609 lt!590005)) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326635 () Bool)

(assert (=> b!1326635 (= e!756384 (contains!8778 (t!44593 (toList!10609 lt!590005)) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!143495 res!880125) b!1326634))

(assert (= (and b!1326634 (not res!880126)) b!1326635))

(declare-fun m!1215825 () Bool)

(assert (=> d!143495 m!1215825))

(declare-fun m!1215827 () Bool)

(assert (=> d!143495 m!1215827))

(declare-fun m!1215829 () Bool)

(assert (=> b!1326635 m!1215829))

(assert (=> b!1326263 d!143495))

(declare-fun d!143497 () Bool)

(assert (=> d!143497 (isDefined!517 (getValueByKey!708 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun lt!590246 () Unit!43597)

(assert (=> d!143497 (= lt!590246 (choose!1951 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun e!756386 () Bool)

(assert (=> d!143497 e!756386))

(declare-fun res!880127 () Bool)

(assert (=> d!143497 (=> (not res!880127) (not e!756386))))

(assert (=> d!143497 (= res!880127 (isStrictlySorted!865 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143497 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) lt!590246)))

(declare-fun b!1326636 () Bool)

(assert (=> b!1326636 (= e!756386 (containsKey!734 (toList!10609 (+!4655 (+!4655 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23523 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (= (and d!143497 res!880127) b!1326636))

(assert (=> d!143497 m!1215285))

(assert (=> d!143497 m!1215285))

(assert (=> d!143497 m!1215287))

(declare-fun m!1215831 () Bool)

(assert (=> d!143497 m!1215831))

(declare-fun m!1215833 () Bool)

(assert (=> d!143497 m!1215833))

(assert (=> b!1326636 m!1215281))

(assert (=> b!1326255 d!143497))

(assert (=> b!1326255 d!143481))

(assert (=> b!1326255 d!143483))

(assert (=> d!143355 d!143359))

(declare-fun d!143499 () Bool)

(declare-fun res!880128 () Bool)

(declare-fun e!756387 () Bool)

(assert (=> d!143499 (=> res!880128 e!756387)))

(assert (=> d!143499 (= res!880128 (and ((_ is Cons!30669) (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11772 (h!31887 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143499 (= (containsKey!734 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!756387)))

(declare-fun b!1326637 () Bool)

(declare-fun e!756388 () Bool)

(assert (=> b!1326637 (= e!756387 e!756388)))

(declare-fun res!880129 () Bool)

(assert (=> b!1326637 (=> (not res!880129) (not e!756388))))

(assert (=> b!1326637 (= res!880129 (and (or (not ((_ is Cons!30669) (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) (bvsle (_1!11772 (h!31887 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)) ((_ is Cons!30669) (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (bvslt (_1!11772 (h!31887 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1326638 () Bool)

(assert (=> b!1326638 (= e!756388 (containsKey!734 (t!44593 (toList!10609 (getCurrentListMap!5591 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!143499 (not res!880128)) b!1326637))

(assert (= (and b!1326637 res!880129) b!1326638))

(declare-fun m!1215835 () Bool)

(assert (=> b!1326638 m!1215835))

(assert (=> d!143353 d!143499))

(assert (=> bm!64771 d!143423))

(declare-fun d!143501 () Bool)

(declare-fun e!756389 () Bool)

(assert (=> d!143501 e!756389))

(declare-fun res!880130 () Bool)

(assert (=> d!143501 (=> res!880130 e!756389)))

(declare-fun lt!590250 () Bool)

(assert (=> d!143501 (= res!880130 (not lt!590250))))

(declare-fun lt!590249 () Bool)

(assert (=> d!143501 (= lt!590250 lt!590249)))

(declare-fun lt!590248 () Unit!43597)

(declare-fun e!756390 () Unit!43597)

(assert (=> d!143501 (= lt!590248 e!756390)))

(declare-fun c!126146 () Bool)

(assert (=> d!143501 (= c!126146 lt!590249)))

(assert (=> d!143501 (= lt!590249 (containsKey!734 (toList!10609 lt!590034) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!143501 (= (contains!8775 lt!590034 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!590250)))

(declare-fun b!1326639 () Bool)

(declare-fun lt!590247 () Unit!43597)

(assert (=> b!1326639 (= e!756390 lt!590247)))

(assert (=> b!1326639 (= lt!590247 (lemmaContainsKeyImpliesGetValueByKeyDefined!480 (toList!10609 lt!590034) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> b!1326639 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590034) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1326640 () Bool)

(declare-fun Unit!43612 () Unit!43597)

(assert (=> b!1326640 (= e!756390 Unit!43612)))

(declare-fun b!1326641 () Bool)

(assert (=> b!1326641 (= e!756389 (isDefined!517 (getValueByKey!708 (toList!10609 lt!590034) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (= (and d!143501 c!126146) b!1326639))

(assert (= (and d!143501 (not c!126146)) b!1326640))

(assert (= (and d!143501 (not res!880130)) b!1326641))

(declare-fun m!1215837 () Bool)

(assert (=> d!143501 m!1215837))

(declare-fun m!1215839 () Bool)

(assert (=> b!1326639 m!1215839))

(assert (=> b!1326639 m!1215353))

(assert (=> b!1326639 m!1215353))

(declare-fun m!1215841 () Bool)

(assert (=> b!1326639 m!1215841))

(assert (=> b!1326641 m!1215353))

(assert (=> b!1326641 m!1215353))

(assert (=> b!1326641 m!1215841))

(assert (=> d!143349 d!143501))

(declare-fun d!143503 () Bool)

(declare-fun c!126147 () Bool)

(assert (=> d!143503 (= c!126147 (and ((_ is Cons!30669) lt!590033) (= (_1!11772 (h!31887 lt!590033)) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun e!756391 () Option!759)

(assert (=> d!143503 (= (getValueByKey!708 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) e!756391)))

(declare-fun b!1326643 () Bool)

(declare-fun e!756392 () Option!759)

(assert (=> b!1326643 (= e!756391 e!756392)))

(declare-fun c!126148 () Bool)

(assert (=> b!1326643 (= c!126148 (and ((_ is Cons!30669) lt!590033) (not (= (_1!11772 (h!31887 lt!590033)) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun b!1326642 () Bool)

(assert (=> b!1326642 (= e!756391 (Some!758 (_2!11772 (h!31887 lt!590033))))))

(declare-fun b!1326645 () Bool)

(assert (=> b!1326645 (= e!756392 None!757)))

(declare-fun b!1326644 () Bool)

(assert (=> b!1326644 (= e!756392 (getValueByKey!708 (t!44593 lt!590033) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (= (and d!143503 c!126147) b!1326642))

(assert (= (and d!143503 (not c!126147)) b!1326643))

(assert (= (and b!1326643 c!126148) b!1326644))

(assert (= (and b!1326643 (not c!126148)) b!1326645))

(declare-fun m!1215843 () Bool)

(assert (=> b!1326644 m!1215843))

(assert (=> d!143349 d!143503))

(declare-fun d!143505 () Bool)

(assert (=> d!143505 (= (getValueByKey!708 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!758 (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun lt!590251 () Unit!43597)

(assert (=> d!143505 (= lt!590251 (choose!1948 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun e!756393 () Bool)

(assert (=> d!143505 e!756393))

(declare-fun res!880131 () Bool)

(assert (=> d!143505 (=> (not res!880131) (not e!756393))))

(assert (=> d!143505 (= res!880131 (isStrictlySorted!865 lt!590033))))

(assert (=> d!143505 (= (lemmaContainsTupThenGetReturnValue!358 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!590251)))

(declare-fun b!1326646 () Bool)

(declare-fun res!880132 () Bool)

(assert (=> b!1326646 (=> (not res!880132) (not e!756393))))

(assert (=> b!1326646 (= res!880132 (containsKey!734 lt!590033 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1326647 () Bool)

(assert (=> b!1326647 (= e!756393 (contains!8778 lt!590033 (tuple2!23523 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (= (and d!143505 res!880131) b!1326646))

(assert (= (and b!1326646 res!880132) b!1326647))

(assert (=> d!143505 m!1215347))

(declare-fun m!1215845 () Bool)

(assert (=> d!143505 m!1215845))

(declare-fun m!1215847 () Bool)

(assert (=> d!143505 m!1215847))

(declare-fun m!1215849 () Bool)

(assert (=> b!1326646 m!1215849))

(declare-fun m!1215851 () Bool)

(assert (=> b!1326647 m!1215851))

(assert (=> d!143349 d!143505))

(declare-fun e!756397 () List!30673)

(declare-fun b!1326648 () Bool)

(assert (=> b!1326648 (= e!756397 (insertStrictlySorted!487 (t!44593 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1326649 () Bool)

(declare-fun res!880134 () Bool)

(declare-fun e!756395 () Bool)

(assert (=> b!1326649 (=> (not res!880134) (not e!756395))))

(declare-fun lt!590252 () List!30673)

(assert (=> b!1326649 (= res!880134 (containsKey!734 lt!590252 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun c!126149 () Bool)

(declare-fun b!1326650 () Bool)

(assert (=> b!1326650 (= c!126149 (and ((_ is Cons!30669) (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!11772 (h!31887 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun e!756396 () List!30673)

(declare-fun e!756394 () List!30673)

(assert (=> b!1326650 (= e!756396 e!756394)))

(declare-fun bm!64793 () Bool)

(declare-fun call!64797 () List!30673)

(declare-fun call!64796 () List!30673)

(assert (=> bm!64793 (= call!64797 call!64796)))

(declare-fun b!1326651 () Bool)

(declare-fun call!64798 () List!30673)

(assert (=> b!1326651 (= e!756394 call!64798)))

(declare-fun b!1326652 () Bool)

(assert (=> b!1326652 (= e!756396 call!64797)))

(declare-fun b!1326653 () Bool)

(assert (=> b!1326653 (= e!756394 call!64798)))

(declare-fun bm!64794 () Bool)

(declare-fun c!126152 () Bool)

(assert (=> bm!64794 (= call!64796 ($colon$colon!668 e!756397 (ite c!126152 (h!31887 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!23523 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun c!126150 () Bool)

(assert (=> bm!64794 (= c!126150 c!126152)))

(declare-fun bm!64795 () Bool)

(assert (=> bm!64795 (= call!64798 call!64797)))

(declare-fun c!126151 () Bool)

(declare-fun b!1326655 () Bool)

(assert (=> b!1326655 (= e!756397 (ite c!126151 (t!44593 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!126149 (Cons!30669 (h!31887 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!44593 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!30670)))))

(declare-fun b!1326656 () Bool)

(declare-fun e!756398 () List!30673)

(assert (=> b!1326656 (= e!756398 call!64796)))

(declare-fun b!1326657 () Bool)

(assert (=> b!1326657 (= e!756395 (contains!8778 lt!590252 (tuple2!23523 (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun b!1326654 () Bool)

(assert (=> b!1326654 (= e!756398 e!756396)))

(assert (=> b!1326654 (= c!126151 (and ((_ is Cons!30669) (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11772 (h!31887 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun d!143507 () Bool)

(assert (=> d!143507 e!756395))

(declare-fun res!880133 () Bool)

(assert (=> d!143507 (=> (not res!880133) (not e!756395))))

(assert (=> d!143507 (= res!880133 (isStrictlySorted!865 lt!590252))))

(assert (=> d!143507 (= lt!590252 e!756398)))

(assert (=> d!143507 (= c!126152 (and ((_ is Cons!30669) (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11772 (h!31887 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!143507 (isStrictlySorted!865 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143507 (= (insertStrictlySorted!487 (toList!10609 (+!4655 (getCurrentListMapNoExtraKeys!6299 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23523 (select (arr!43246 _keys!1609) from!2000) (get!21802 (select (arr!43247 _values!1337) from!2000) (dynLambda!3609 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11772 (tuple2!23523 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!590252)))

(assert (= (and d!143507 c!126152) b!1326656))

(assert (= (and d!143507 (not c!126152)) b!1326654))

(assert (= (and b!1326654 c!126151) b!1326652))

(assert (= (and b!1326654 (not c!126151)) b!1326650))

(assert (= (and b!1326650 c!126149) b!1326651))

(assert (= (and b!1326650 (not c!126149)) b!1326653))

(assert (= (or b!1326651 b!1326653) bm!64795))

(assert (= (or b!1326652 bm!64795) bm!64793))

(assert (= (or b!1326656 bm!64793) bm!64794))

(assert (= (and bm!64794 c!126150) b!1326648))

(assert (= (and bm!64794 (not c!126150)) b!1326655))

(assert (= (and d!143507 res!880133) b!1326649))

(assert (= (and b!1326649 res!880134) b!1326657))

(declare-fun m!1215853 () Bool)

(assert (=> bm!64794 m!1215853))

(declare-fun m!1215855 () Bool)

(assert (=> b!1326648 m!1215855))

(declare-fun m!1215857 () Bool)

(assert (=> d!143507 m!1215857))

(declare-fun m!1215859 () Bool)

(assert (=> d!143507 m!1215859))

(declare-fun m!1215861 () Bool)

(assert (=> b!1326649 m!1215861))

(declare-fun m!1215863 () Bool)

(assert (=> b!1326657 m!1215863))

(assert (=> d!143349 d!143507))

(declare-fun b!1326659 () Bool)

(declare-fun e!756400 () Bool)

(assert (=> b!1326659 (= e!756400 tp_is_empty!36277)))

(declare-fun condMapEmpty!56073 () Bool)

(declare-fun mapDefault!56073 () ValueCell!17240)

(assert (=> mapNonEmpty!56072 (= condMapEmpty!56073 (= mapRest!56072 ((as const (Array (_ BitVec 32) ValueCell!17240)) mapDefault!56073)))))

(declare-fun mapRes!56073 () Bool)

(assert (=> mapNonEmpty!56072 (= tp!106862 (and e!756400 mapRes!56073))))

(declare-fun mapIsEmpty!56073 () Bool)

(assert (=> mapIsEmpty!56073 mapRes!56073))

(declare-fun b!1326658 () Bool)

(declare-fun e!756399 () Bool)

(assert (=> b!1326658 (= e!756399 tp_is_empty!36277)))

(declare-fun mapNonEmpty!56073 () Bool)

(declare-fun tp!106863 () Bool)

(assert (=> mapNonEmpty!56073 (= mapRes!56073 (and tp!106863 e!756399))))

(declare-fun mapValue!56073 () ValueCell!17240)

(declare-fun mapKey!56073 () (_ BitVec 32))

(declare-fun mapRest!56073 () (Array (_ BitVec 32) ValueCell!17240))

(assert (=> mapNonEmpty!56073 (= mapRest!56072 (store mapRest!56073 mapKey!56073 mapValue!56073))))

(assert (= (and mapNonEmpty!56072 condMapEmpty!56073) mapIsEmpty!56073))

(assert (= (and mapNonEmpty!56072 (not condMapEmpty!56073)) mapNonEmpty!56073))

(assert (= (and mapNonEmpty!56073 ((_ is ValueCellFull!17240) mapValue!56073)) b!1326658))

(assert (= (and mapNonEmpty!56072 ((_ is ValueCellFull!17240) mapDefault!56073)) b!1326659))

(declare-fun m!1215865 () Bool)

(assert (=> mapNonEmpty!56073 m!1215865))

(declare-fun b_lambda!23727 () Bool)

(assert (= b_lambda!23719 (or (and start!112024 b_free!30457) b_lambda!23727)))

(declare-fun b_lambda!23729 () Bool)

(assert (= b_lambda!23725 (or (and start!112024 b_free!30457) b_lambda!23729)))

(declare-fun b_lambda!23731 () Bool)

(assert (= b_lambda!23723 (or (and start!112024 b_free!30457) b_lambda!23731)))

(declare-fun b_lambda!23733 () Bool)

(assert (= b_lambda!23721 (or (and start!112024 b_free!30457) b_lambda!23733)))

(check-sat (not b!1326488) (not d!143447) (not b_lambda!23733) (not b!1326416) (not b!1326438) (not b!1326452) (not b!1326595) (not d!143393) (not b!1326625) (not d!143497) (not b!1326582) (not b!1326610) (not d!143459) (not b!1326599) (not d!143411) (not d!143399) (not b!1326649) (not b!1326614) (not d!143475) (not b!1326537) (not b!1326542) (not b!1326565) (not d!143367) (not b!1326467) (not d!143463) (not d!143437) (not b!1326617) (not b!1326568) (not b!1326579) (not b!1326419) (not b!1326581) (not d!143413) (not b!1326644) (not b!1326535) (not b!1326427) (not b!1326503) (not b!1326600) (not d!143375) b_and!49021 (not b_lambda!23713) (not b!1326607) (not b!1326556) (not b!1326590) (not b!1326636) (not b!1326555) (not b_next!30457) (not b!1326536) (not b!1326421) (not d!143455) (not d!143445) (not d!143385) (not d!143425) (not b!1326533) (not b!1326647) (not d!143485) (not b!1326449) (not b!1326620) (not b!1326562) (not d!143423) (not b!1326547) (not b!1326489) (not d!143493) (not d!143415) (not b!1326580) (not d!143401) (not b!1326440) (not d!143477) tp_is_empty!36277 (not b!1326657) (not b!1326574) (not mapNonEmpty!56073) (not b!1326606) (not b!1326591) (not b_lambda!23729) (not b!1326635) (not b!1326571) (not b!1326589) (not b!1326639) (not b_lambda!23717) (not b!1326466) (not b!1326447) (not d!143449) (not d!143421) (not b!1326552) (not d!143479) (not b!1326415) (not d!143433) (not b!1326583) (not d!143417) (not b!1326538) (not b!1326624) (not b!1326539) (not b!1326526) (not d!143491) (not b!1326534) (not bm!64788) (not b!1326455) (not b!1326633) (not d!143429) (not b!1326563) (not d!143469) (not b!1326457) (not b!1326540) (not d!143435) (not b!1326597) (not b!1326578) (not b!1326566) (not d!143461) (not b!1326460) (not d!143495) (not b!1326532) (not b!1326601) (not d!143395) (not b!1326413) (not b!1326585) (not d!143379) (not b!1326576) (not b!1326418) (not b!1326646) (not d!143431) (not bm!64789) (not d!143427) (not d!143441) (not b!1326560) (not b!1326551) (not d!143403) (not b!1326509) (not b!1326454) (not bm!64786) (not b!1326441) (not b_lambda!23705) (not b!1326648) (not b!1326615) (not b!1326546) (not b_lambda!23727) (not d!143471) (not d!143439) (not b!1326641) (not d!143419) (not b!1326497) (not d!143481) (not d!143409) (not b!1326550) (not b!1326414) (not d!143505) (not d!143453) (not b!1326592) (not bm!64777) (not d!143487) (not b!1326622) (not b_lambda!23715) (not bm!64791) (not bm!64794) (not b!1326612) (not b!1326548) (not d!143473) (not b!1326638) (not d!143507) (not d!143405) (not b!1326623) (not d!143451) (not d!143377) (not d!143501) (not b_lambda!23731) (not b!1326451) (not bm!64778))
(check-sat b_and!49021 (not b_next!30457))
