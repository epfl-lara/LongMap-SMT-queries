; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112186 () Bool)

(assert start!112186)

(declare-fun b_free!30535 () Bool)

(declare-fun b_next!30535 () Bool)

(assert (=> start!112186 (= b_free!30535 (not b_next!30535))))

(declare-fun tp!107088 () Bool)

(declare-fun b_and!49175 () Bool)

(assert (=> start!112186 (= tp!107088 b_and!49175)))

(declare-fun b!1328143 () Bool)

(declare-fun res!881105 () Bool)

(declare-fun e!757080 () Bool)

(assert (=> b!1328143 (=> (not res!881105) (not e!757080))))

(declare-datatypes ((array!89713 0))(
  ( (array!89714 (arr!43324 (Array (_ BitVec 32) (_ BitVec 64))) (size!43875 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89713)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53577 0))(
  ( (V!53578 (val!18252 Int)) )
))
(declare-datatypes ((ValueCell!17279 0))(
  ( (ValueCellFull!17279 (v!20881 V!53577)) (EmptyCell!17279) )
))
(declare-datatypes ((array!89715 0))(
  ( (array!89716 (arr!43325 (Array (_ BitVec 32) ValueCell!17279)) (size!43876 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89715)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1328143 (= res!881105 (and (= (size!43876 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43875 _keys!1609) (size!43876 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1328144 () Bool)

(declare-fun res!881102 () Bool)

(assert (=> b!1328144 (=> (not res!881102) (not e!757080))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1328144 (= res!881102 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43875 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56187 () Bool)

(declare-fun mapRes!56187 () Bool)

(assert (=> mapIsEmpty!56187 mapRes!56187))

(declare-fun b!1328145 () Bool)

(declare-fun res!881100 () Bool)

(assert (=> b!1328145 (=> (not res!881100) (not e!757080))))

(declare-datatypes ((List!30729 0))(
  ( (Nil!30726) (Cons!30725 (h!31943 (_ BitVec 64)) (t!44725 List!30729)) )
))
(declare-fun arrayNoDuplicates!0 (array!89713 (_ BitVec 32) List!30729) Bool)

(assert (=> b!1328145 (= res!881100 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30726))))

(declare-fun b!1328146 () Bool)

(declare-fun res!881103 () Bool)

(assert (=> b!1328146 (=> (not res!881103) (not e!757080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89713 (_ BitVec 32)) Bool)

(assert (=> b!1328146 (= res!881103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1328147 () Bool)

(declare-fun res!881104 () Bool)

(assert (=> b!1328147 (=> (not res!881104) (not e!757080))))

(assert (=> b!1328147 (= res!881104 (not (= (select (arr!43324 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1328149 () Bool)

(declare-fun e!757079 () Bool)

(declare-fun tp_is_empty!36355 () Bool)

(assert (=> b!1328149 (= e!757079 tp_is_empty!36355)))

(declare-fun mapNonEmpty!56187 () Bool)

(declare-fun tp!107087 () Bool)

(assert (=> mapNonEmpty!56187 (= mapRes!56187 (and tp!107087 e!757079))))

(declare-fun mapKey!56187 () (_ BitVec 32))

(declare-fun mapValue!56187 () ValueCell!17279)

(declare-fun mapRest!56187 () (Array (_ BitVec 32) ValueCell!17279))

(assert (=> mapNonEmpty!56187 (= (arr!43325 _values!1337) (store mapRest!56187 mapKey!56187 mapValue!56187))))

(declare-fun zeroValue!1279 () V!53577)

(declare-fun minValue!1279 () V!53577)

(declare-fun b!1328150 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23578 0))(
  ( (tuple2!23579 (_1!11800 (_ BitVec 64)) (_2!11800 V!53577)) )
))
(declare-datatypes ((List!30730 0))(
  ( (Nil!30727) (Cons!30726 (h!31944 tuple2!23578) (t!44726 List!30730)) )
))
(declare-datatypes ((ListLongMap!21243 0))(
  ( (ListLongMap!21244 (toList!10637 List!30730)) )
))
(declare-fun contains!8807 (ListLongMap!21243 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5614 (array!89713 array!89715 (_ BitVec 32) (_ BitVec 32) V!53577 V!53577 (_ BitVec 32) Int) ListLongMap!21243)

(assert (=> b!1328150 (= e!757080 (not (contains!8807 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164)))))

(declare-fun b!1328151 () Bool)

(declare-fun e!757082 () Bool)

(declare-fun e!757081 () Bool)

(assert (=> b!1328151 (= e!757082 (and e!757081 mapRes!56187))))

(declare-fun condMapEmpty!56187 () Bool)

(declare-fun mapDefault!56187 () ValueCell!17279)

(assert (=> b!1328151 (= condMapEmpty!56187 (= (arr!43325 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17279)) mapDefault!56187)))))

(declare-fun res!881101 () Bool)

(assert (=> start!112186 (=> (not res!881101) (not e!757080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112186 (= res!881101 (validMask!0 mask!2019))))

(assert (=> start!112186 e!757080))

(declare-fun array_inv!32963 (array!89713) Bool)

(assert (=> start!112186 (array_inv!32963 _keys!1609)))

(assert (=> start!112186 true))

(assert (=> start!112186 tp_is_empty!36355))

(declare-fun array_inv!32964 (array!89715) Bool)

(assert (=> start!112186 (and (array_inv!32964 _values!1337) e!757082)))

(assert (=> start!112186 tp!107088))

(declare-fun b!1328148 () Bool)

(declare-fun res!881099 () Bool)

(assert (=> b!1328148 (=> (not res!881099) (not e!757080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328148 (= res!881099 (not (validKeyInArray!0 (select (arr!43324 _keys!1609) from!2000))))))

(declare-fun b!1328152 () Bool)

(assert (=> b!1328152 (= e!757081 tp_is_empty!36355)))

(declare-fun b!1328153 () Bool)

(declare-fun res!881106 () Bool)

(assert (=> b!1328153 (=> (not res!881106) (not e!757080))))

(assert (=> b!1328153 (= res!881106 (contains!8807 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(assert (= (and start!112186 res!881101) b!1328143))

(assert (= (and b!1328143 res!881105) b!1328146))

(assert (= (and b!1328146 res!881103) b!1328145))

(assert (= (and b!1328145 res!881100) b!1328144))

(assert (= (and b!1328144 res!881102) b!1328153))

(assert (= (and b!1328153 res!881106) b!1328147))

(assert (= (and b!1328147 res!881104) b!1328148))

(assert (= (and b!1328148 res!881099) b!1328150))

(assert (= (and b!1328151 condMapEmpty!56187) mapIsEmpty!56187))

(assert (= (and b!1328151 (not condMapEmpty!56187)) mapNonEmpty!56187))

(get-info :version)

(assert (= (and mapNonEmpty!56187 ((_ is ValueCellFull!17279) mapValue!56187)) b!1328149))

(assert (= (and b!1328151 ((_ is ValueCellFull!17279) mapDefault!56187)) b!1328152))

(assert (= start!112186 b!1328151))

(declare-fun m!1217621 () Bool)

(assert (=> mapNonEmpty!56187 m!1217621))

(declare-fun m!1217623 () Bool)

(assert (=> b!1328153 m!1217623))

(assert (=> b!1328153 m!1217623))

(declare-fun m!1217625 () Bool)

(assert (=> b!1328153 m!1217625))

(declare-fun m!1217627 () Bool)

(assert (=> b!1328148 m!1217627))

(assert (=> b!1328148 m!1217627))

(declare-fun m!1217629 () Bool)

(assert (=> b!1328148 m!1217629))

(declare-fun m!1217631 () Bool)

(assert (=> b!1328150 m!1217631))

(assert (=> b!1328150 m!1217631))

(declare-fun m!1217633 () Bool)

(assert (=> b!1328150 m!1217633))

(declare-fun m!1217635 () Bool)

(assert (=> b!1328146 m!1217635))

(declare-fun m!1217637 () Bool)

(assert (=> start!112186 m!1217637))

(declare-fun m!1217639 () Bool)

(assert (=> start!112186 m!1217639))

(declare-fun m!1217641 () Bool)

(assert (=> start!112186 m!1217641))

(assert (=> b!1328147 m!1217627))

(declare-fun m!1217643 () Bool)

(assert (=> b!1328145 m!1217643))

(check-sat (not b!1328148) (not b!1328145) (not b_next!30535) (not b!1328150) b_and!49175 (not mapNonEmpty!56187) (not start!112186) tp_is_empty!36355 (not b!1328146) (not b!1328153))
(check-sat b_and!49175 (not b_next!30535))
(get-model)

(declare-fun d!143587 () Bool)

(declare-fun e!757118 () Bool)

(assert (=> d!143587 e!757118))

(declare-fun res!881157 () Bool)

(assert (=> d!143587 (=> res!881157 e!757118)))

(declare-fun lt!590916 () Bool)

(assert (=> d!143587 (= res!881157 (not lt!590916))))

(declare-fun lt!590917 () Bool)

(assert (=> d!143587 (= lt!590916 lt!590917)))

(declare-datatypes ((Unit!43660 0))(
  ( (Unit!43661) )
))
(declare-fun lt!590919 () Unit!43660)

(declare-fun e!757117 () Unit!43660)

(assert (=> d!143587 (= lt!590919 e!757117)))

(declare-fun c!126209 () Bool)

(assert (=> d!143587 (= c!126209 lt!590917)))

(declare-fun containsKey!736 (List!30730 (_ BitVec 64)) Bool)

(assert (=> d!143587 (= lt!590917 (containsKey!736 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> d!143587 (= (contains!8807 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164) lt!590916)))

(declare-fun b!1328226 () Bool)

(declare-fun lt!590918 () Unit!43660)

(assert (=> b!1328226 (= e!757117 lt!590918)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!482 (List!30730 (_ BitVec 64)) Unit!43660)

(assert (=> b!1328226 (= lt!590918 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-datatypes ((Option!761 0))(
  ( (Some!760 (v!20884 V!53577)) (None!759) )
))
(declare-fun isDefined!519 (Option!761) Bool)

(declare-fun getValueByKey!710 (List!30730 (_ BitVec 64)) Option!761)

(assert (=> b!1328226 (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun b!1328227 () Bool)

(declare-fun Unit!43662 () Unit!43660)

(assert (=> b!1328227 (= e!757117 Unit!43662)))

(declare-fun b!1328228 () Bool)

(assert (=> b!1328228 (= e!757118 (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143587 c!126209) b!1328226))

(assert (= (and d!143587 (not c!126209)) b!1328227))

(assert (= (and d!143587 (not res!881157)) b!1328228))

(declare-fun m!1217693 () Bool)

(assert (=> d!143587 m!1217693))

(declare-fun m!1217695 () Bool)

(assert (=> b!1328226 m!1217695))

(declare-fun m!1217697 () Bool)

(assert (=> b!1328226 m!1217697))

(assert (=> b!1328226 m!1217697))

(declare-fun m!1217699 () Bool)

(assert (=> b!1328226 m!1217699))

(assert (=> b!1328228 m!1217697))

(assert (=> b!1328228 m!1217697))

(assert (=> b!1328228 m!1217699))

(assert (=> b!1328150 d!143587))

(declare-fun b!1328271 () Bool)

(declare-fun e!757157 () ListLongMap!21243)

(declare-fun call!64855 () ListLongMap!21243)

(assert (=> b!1328271 (= e!757157 call!64855)))

(declare-fun bm!64847 () Bool)

(declare-fun call!64856 () Bool)

(declare-fun lt!590982 () ListLongMap!21243)

(assert (=> bm!64847 (= call!64856 (contains!8807 lt!590982 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328272 () Bool)

(declare-fun e!757152 () ListLongMap!21243)

(assert (=> b!1328272 (= e!757152 call!64855)))

(declare-fun b!1328273 () Bool)

(declare-fun e!757148 () Bool)

(declare-fun e!757145 () Bool)

(assert (=> b!1328273 (= e!757148 e!757145)))

(declare-fun res!881182 () Bool)

(declare-fun call!64851 () Bool)

(assert (=> b!1328273 (= res!881182 call!64851)))

(assert (=> b!1328273 (=> (not res!881182) (not e!757145))))

(declare-fun b!1328274 () Bool)

(declare-fun e!757149 () ListLongMap!21243)

(assert (=> b!1328274 (= e!757149 e!757152)))

(declare-fun c!126225 () Bool)

(assert (=> b!1328274 (= c!126225 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64848 () Bool)

(assert (=> bm!64848 (= call!64851 (contains!8807 lt!590982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328276 () Bool)

(declare-fun e!757155 () Bool)

(declare-fun e!757151 () Bool)

(assert (=> b!1328276 (= e!757155 e!757151)))

(declare-fun c!126222 () Bool)

(assert (=> b!1328276 (= c!126222 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!64850 () ListLongMap!21243)

(declare-fun call!64854 () ListLongMap!21243)

(declare-fun bm!64849 () Bool)

(declare-fun c!126224 () Bool)

(declare-fun call!64853 () ListLongMap!21243)

(declare-fun call!64852 () ListLongMap!21243)

(declare-fun +!4679 (ListLongMap!21243 tuple2!23578) ListLongMap!21243)

(assert (=> bm!64849 (= call!64852 (+!4679 (ite c!126224 call!64854 (ite c!126225 call!64853 call!64850)) (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1328277 () Bool)

(declare-fun e!757150 () Bool)

(assert (=> b!1328277 (= e!757150 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1328278 () Bool)

(declare-fun e!757147 () Bool)

(declare-fun apply!1040 (ListLongMap!21243 (_ BitVec 64)) V!53577)

(assert (=> b!1328278 (= e!757147 (= (apply!1040 lt!590982 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1328279 () Bool)

(assert (=> b!1328279 (= e!757145 (= (apply!1040 lt!590982 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1328280 () Bool)

(declare-fun res!881179 () Bool)

(assert (=> b!1328280 (=> (not res!881179) (not e!757155))))

(declare-fun e!757156 () Bool)

(assert (=> b!1328280 (= res!881179 e!757156)))

(declare-fun res!881180 () Bool)

(assert (=> b!1328280 (=> res!881180 e!757156)))

(assert (=> b!1328280 (= res!881180 (not e!757150))))

(declare-fun res!881178 () Bool)

(assert (=> b!1328280 (=> (not res!881178) (not e!757150))))

(assert (=> b!1328280 (= res!881178 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(declare-fun b!1328281 () Bool)

(declare-fun res!881181 () Bool)

(assert (=> b!1328281 (=> (not res!881181) (not e!757155))))

(assert (=> b!1328281 (= res!881181 e!757148)))

(declare-fun c!126226 () Bool)

(assert (=> b!1328281 (= c!126226 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1328282 () Bool)

(assert (=> b!1328282 (= e!757148 (not call!64851))))

(declare-fun bm!64850 () Bool)

(assert (=> bm!64850 (= call!64850 call!64853)))

(declare-fun bm!64851 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6323 (array!89713 array!89715 (_ BitVec 32) (_ BitVec 32) V!53577 V!53577 (_ BitVec 32) Int) ListLongMap!21243)

(assert (=> bm!64851 (= call!64854 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1328283 () Bool)

(declare-fun c!126227 () Bool)

(assert (=> b!1328283 (= c!126227 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1328283 (= e!757152 e!757157)))

(declare-fun b!1328284 () Bool)

(assert (=> b!1328284 (= e!757151 e!757147)))

(declare-fun res!881183 () Bool)

(assert (=> b!1328284 (= res!881183 call!64856)))

(assert (=> b!1328284 (=> (not res!881183) (not e!757147))))

(declare-fun e!757153 () Bool)

(declare-fun b!1328285 () Bool)

(declare-fun get!21857 (ValueCell!17279 V!53577) V!53577)

(declare-fun dynLambda!3633 (Int (_ BitVec 64)) V!53577)

(assert (=> b!1328285 (= e!757153 (= (apply!1040 lt!590982 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21857 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43876 _values!1337)))))

(assert (=> b!1328285 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(declare-fun bm!64852 () Bool)

(assert (=> bm!64852 (= call!64853 call!64854)))

(declare-fun b!1328286 () Bool)

(declare-fun e!757154 () Unit!43660)

(declare-fun Unit!43663 () Unit!43660)

(assert (=> b!1328286 (= e!757154 Unit!43663)))

(declare-fun b!1328287 () Bool)

(assert (=> b!1328287 (= e!757156 e!757153)))

(declare-fun res!881176 () Bool)

(assert (=> b!1328287 (=> (not res!881176) (not e!757153))))

(assert (=> b!1328287 (= res!881176 (contains!8807 lt!590982 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328287 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(declare-fun bm!64853 () Bool)

(assert (=> bm!64853 (= call!64855 call!64852)))

(declare-fun b!1328288 () Bool)

(assert (=> b!1328288 (= e!757157 call!64850)))

(declare-fun b!1328275 () Bool)

(assert (=> b!1328275 (= e!757151 (not call!64856))))

(declare-fun d!143589 () Bool)

(assert (=> d!143589 e!757155))

(declare-fun res!881184 () Bool)

(assert (=> d!143589 (=> (not res!881184) (not e!757155))))

(assert (=> d!143589 (= res!881184 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))))

(declare-fun lt!590972 () ListLongMap!21243)

(assert (=> d!143589 (= lt!590982 lt!590972)))

(declare-fun lt!590979 () Unit!43660)

(assert (=> d!143589 (= lt!590979 e!757154)))

(declare-fun c!126223 () Bool)

(declare-fun e!757146 () Bool)

(assert (=> d!143589 (= c!126223 e!757146)))

(declare-fun res!881177 () Bool)

(assert (=> d!143589 (=> (not res!881177) (not e!757146))))

(assert (=> d!143589 (= res!881177 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(assert (=> d!143589 (= lt!590972 e!757149)))

(assert (=> d!143589 (= c!126224 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143589 (validMask!0 mask!2019)))

(assert (=> d!143589 (= (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590982)))

(declare-fun b!1328289 () Bool)

(assert (=> b!1328289 (= e!757146 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1328290 () Bool)

(assert (=> b!1328290 (= e!757149 (+!4679 call!64852 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1328291 () Bool)

(declare-fun lt!590967 () Unit!43660)

(assert (=> b!1328291 (= e!757154 lt!590967)))

(declare-fun lt!590973 () ListLongMap!21243)

(assert (=> b!1328291 (= lt!590973 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590968 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590968 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590980 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590980 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590965 () Unit!43660)

(declare-fun addStillContains!1171 (ListLongMap!21243 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43660)

(assert (=> b!1328291 (= lt!590965 (addStillContains!1171 lt!590973 lt!590968 zeroValue!1279 lt!590980))))

(assert (=> b!1328291 (contains!8807 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279)) lt!590980)))

(declare-fun lt!590970 () Unit!43660)

(assert (=> b!1328291 (= lt!590970 lt!590965)))

(declare-fun lt!590975 () ListLongMap!21243)

(assert (=> b!1328291 (= lt!590975 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590964 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590964 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590974 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590974 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590969 () Unit!43660)

(declare-fun addApplyDifferent!569 (ListLongMap!21243 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43660)

(assert (=> b!1328291 (= lt!590969 (addApplyDifferent!569 lt!590975 lt!590964 minValue!1279 lt!590974))))

(assert (=> b!1328291 (= (apply!1040 (+!4679 lt!590975 (tuple2!23579 lt!590964 minValue!1279)) lt!590974) (apply!1040 lt!590975 lt!590974))))

(declare-fun lt!590966 () Unit!43660)

(assert (=> b!1328291 (= lt!590966 lt!590969)))

(declare-fun lt!590977 () ListLongMap!21243)

(assert (=> b!1328291 (= lt!590977 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590983 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590983 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590976 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590976 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590984 () Unit!43660)

(assert (=> b!1328291 (= lt!590984 (addApplyDifferent!569 lt!590977 lt!590983 zeroValue!1279 lt!590976))))

(assert (=> b!1328291 (= (apply!1040 (+!4679 lt!590977 (tuple2!23579 lt!590983 zeroValue!1279)) lt!590976) (apply!1040 lt!590977 lt!590976))))

(declare-fun lt!590981 () Unit!43660)

(assert (=> b!1328291 (= lt!590981 lt!590984)))

(declare-fun lt!590971 () ListLongMap!21243)

(assert (=> b!1328291 (= lt!590971 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590978 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590978 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590985 () (_ BitVec 64))

(assert (=> b!1328291 (= lt!590985 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1328291 (= lt!590967 (addApplyDifferent!569 lt!590971 lt!590978 minValue!1279 lt!590985))))

(assert (=> b!1328291 (= (apply!1040 (+!4679 lt!590971 (tuple2!23579 lt!590978 minValue!1279)) lt!590985) (apply!1040 lt!590971 lt!590985))))

(assert (= (and d!143589 c!126224) b!1328290))

(assert (= (and d!143589 (not c!126224)) b!1328274))

(assert (= (and b!1328274 c!126225) b!1328272))

(assert (= (and b!1328274 (not c!126225)) b!1328283))

(assert (= (and b!1328283 c!126227) b!1328271))

(assert (= (and b!1328283 (not c!126227)) b!1328288))

(assert (= (or b!1328271 b!1328288) bm!64850))

(assert (= (or b!1328272 bm!64850) bm!64852))

(assert (= (or b!1328272 b!1328271) bm!64853))

(assert (= (or b!1328290 bm!64852) bm!64851))

(assert (= (or b!1328290 bm!64853) bm!64849))

(assert (= (and d!143589 res!881177) b!1328289))

(assert (= (and d!143589 c!126223) b!1328291))

(assert (= (and d!143589 (not c!126223)) b!1328286))

(assert (= (and d!143589 res!881184) b!1328280))

(assert (= (and b!1328280 res!881178) b!1328277))

(assert (= (and b!1328280 (not res!881180)) b!1328287))

(assert (= (and b!1328287 res!881176) b!1328285))

(assert (= (and b!1328280 res!881179) b!1328281))

(assert (= (and b!1328281 c!126226) b!1328273))

(assert (= (and b!1328281 (not c!126226)) b!1328282))

(assert (= (and b!1328273 res!881182) b!1328279))

(assert (= (or b!1328273 b!1328282) bm!64848))

(assert (= (and b!1328281 res!881181) b!1328276))

(assert (= (and b!1328276 c!126222) b!1328284))

(assert (= (and b!1328276 (not c!126222)) b!1328275))

(assert (= (and b!1328284 res!881183) b!1328278))

(assert (= (or b!1328284 b!1328275) bm!64847))

(declare-fun b_lambda!23825 () Bool)

(assert (=> (not b_lambda!23825) (not b!1328285)))

(declare-fun t!44729 () Bool)

(declare-fun tb!11801 () Bool)

(assert (=> (and start!112186 (= defaultEntry!1340 defaultEntry!1340) t!44729) tb!11801))

(declare-fun result!24669 () Bool)

(assert (=> tb!11801 (= result!24669 tp_is_empty!36355)))

(assert (=> b!1328285 t!44729))

(declare-fun b_and!49181 () Bool)

(assert (= b_and!49175 (and (=> t!44729 result!24669) b_and!49181)))

(declare-fun m!1217701 () Bool)

(assert (=> bm!64849 m!1217701))

(assert (=> d!143589 m!1217637))

(declare-fun m!1217703 () Bool)

(assert (=> b!1328285 m!1217703))

(declare-fun m!1217705 () Bool)

(assert (=> b!1328285 m!1217705))

(assert (=> b!1328285 m!1217703))

(declare-fun m!1217707 () Bool)

(assert (=> b!1328285 m!1217707))

(declare-fun m!1217709 () Bool)

(assert (=> b!1328285 m!1217709))

(assert (=> b!1328285 m!1217707))

(assert (=> b!1328285 m!1217709))

(declare-fun m!1217711 () Bool)

(assert (=> b!1328285 m!1217711))

(assert (=> b!1328287 m!1217703))

(assert (=> b!1328287 m!1217703))

(declare-fun m!1217713 () Bool)

(assert (=> b!1328287 m!1217713))

(assert (=> b!1328289 m!1217703))

(assert (=> b!1328289 m!1217703))

(declare-fun m!1217715 () Bool)

(assert (=> b!1328289 m!1217715))

(declare-fun m!1217717 () Bool)

(assert (=> bm!64847 m!1217717))

(declare-fun m!1217719 () Bool)

(assert (=> bm!64848 m!1217719))

(declare-fun m!1217721 () Bool)

(assert (=> b!1328291 m!1217721))

(declare-fun m!1217723 () Bool)

(assert (=> b!1328291 m!1217723))

(declare-fun m!1217725 () Bool)

(assert (=> b!1328291 m!1217725))

(declare-fun m!1217727 () Bool)

(assert (=> b!1328291 m!1217727))

(declare-fun m!1217729 () Bool)

(assert (=> b!1328291 m!1217729))

(declare-fun m!1217731 () Bool)

(assert (=> b!1328291 m!1217731))

(assert (=> b!1328291 m!1217729))

(assert (=> b!1328291 m!1217703))

(declare-fun m!1217733 () Bool)

(assert (=> b!1328291 m!1217733))

(declare-fun m!1217735 () Bool)

(assert (=> b!1328291 m!1217735))

(assert (=> b!1328291 m!1217733))

(assert (=> b!1328291 m!1217721))

(declare-fun m!1217737 () Bool)

(assert (=> b!1328291 m!1217737))

(declare-fun m!1217739 () Bool)

(assert (=> b!1328291 m!1217739))

(declare-fun m!1217741 () Bool)

(assert (=> b!1328291 m!1217741))

(declare-fun m!1217743 () Bool)

(assert (=> b!1328291 m!1217743))

(assert (=> b!1328291 m!1217739))

(declare-fun m!1217745 () Bool)

(assert (=> b!1328291 m!1217745))

(declare-fun m!1217747 () Bool)

(assert (=> b!1328291 m!1217747))

(declare-fun m!1217749 () Bool)

(assert (=> b!1328291 m!1217749))

(declare-fun m!1217751 () Bool)

(assert (=> b!1328291 m!1217751))

(declare-fun m!1217753 () Bool)

(assert (=> b!1328290 m!1217753))

(declare-fun m!1217755 () Bool)

(assert (=> b!1328279 m!1217755))

(declare-fun m!1217757 () Bool)

(assert (=> b!1328278 m!1217757))

(assert (=> b!1328277 m!1217703))

(assert (=> b!1328277 m!1217703))

(assert (=> b!1328277 m!1217715))

(assert (=> bm!64851 m!1217723))

(assert (=> b!1328150 d!143589))

(declare-fun b!1328304 () Bool)

(declare-fun e!757166 () Bool)

(declare-fun contains!8808 (List!30729 (_ BitVec 64)) Bool)

(assert (=> b!1328304 (= e!757166 (contains!8808 Nil!30726 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143591 () Bool)

(declare-fun res!881192 () Bool)

(declare-fun e!757167 () Bool)

(assert (=> d!143591 (=> res!881192 e!757167)))

(assert (=> d!143591 (= res!881192 (bvsge #b00000000000000000000000000000000 (size!43875 _keys!1609)))))

(assert (=> d!143591 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30726) e!757167)))

(declare-fun b!1328305 () Bool)

(declare-fun e!757168 () Bool)

(declare-fun call!64859 () Bool)

(assert (=> b!1328305 (= e!757168 call!64859)))

(declare-fun b!1328306 () Bool)

(declare-fun e!757169 () Bool)

(assert (=> b!1328306 (= e!757167 e!757169)))

(declare-fun res!881191 () Bool)

(assert (=> b!1328306 (=> (not res!881191) (not e!757169))))

(assert (=> b!1328306 (= res!881191 (not e!757166))))

(declare-fun res!881193 () Bool)

(assert (=> b!1328306 (=> (not res!881193) (not e!757166))))

(assert (=> b!1328306 (= res!881193 (validKeyInArray!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64856 () Bool)

(declare-fun c!126230 () Bool)

(assert (=> bm!64856 (= call!64859 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126230 (Cons!30725 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) Nil!30726) Nil!30726)))))

(declare-fun b!1328307 () Bool)

(assert (=> b!1328307 (= e!757168 call!64859)))

(declare-fun b!1328308 () Bool)

(assert (=> b!1328308 (= e!757169 e!757168)))

(assert (=> b!1328308 (= c!126230 (validKeyInArray!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143591 (not res!881192)) b!1328306))

(assert (= (and b!1328306 res!881193) b!1328304))

(assert (= (and b!1328306 res!881191) b!1328308))

(assert (= (and b!1328308 c!126230) b!1328307))

(assert (= (and b!1328308 (not c!126230)) b!1328305))

(assert (= (or b!1328307 b!1328305) bm!64856))

(declare-fun m!1217759 () Bool)

(assert (=> b!1328304 m!1217759))

(assert (=> b!1328304 m!1217759))

(declare-fun m!1217761 () Bool)

(assert (=> b!1328304 m!1217761))

(assert (=> b!1328306 m!1217759))

(assert (=> b!1328306 m!1217759))

(declare-fun m!1217763 () Bool)

(assert (=> b!1328306 m!1217763))

(assert (=> bm!64856 m!1217759))

(declare-fun m!1217765 () Bool)

(assert (=> bm!64856 m!1217765))

(assert (=> b!1328308 m!1217759))

(assert (=> b!1328308 m!1217759))

(assert (=> b!1328308 m!1217763))

(assert (=> b!1328145 d!143591))

(declare-fun d!143593 () Bool)

(assert (=> d!143593 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!112186 d!143593))

(declare-fun d!143595 () Bool)

(assert (=> d!143595 (= (array_inv!32963 _keys!1609) (bvsge (size!43875 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!112186 d!143595))

(declare-fun d!143597 () Bool)

(assert (=> d!143597 (= (array_inv!32964 _values!1337) (bvsge (size!43876 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!112186 d!143597))

(declare-fun bm!64859 () Bool)

(declare-fun call!64862 () Bool)

(assert (=> bm!64859 (= call!64862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1328317 () Bool)

(declare-fun e!757177 () Bool)

(declare-fun e!757176 () Bool)

(assert (=> b!1328317 (= e!757177 e!757176)))

(declare-fun c!126233 () Bool)

(assert (=> b!1328317 (= c!126233 (validKeyInArray!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1328318 () Bool)

(assert (=> b!1328318 (= e!757176 call!64862)))

(declare-fun d!143599 () Bool)

(declare-fun res!881199 () Bool)

(assert (=> d!143599 (=> res!881199 e!757177)))

(assert (=> d!143599 (= res!881199 (bvsge #b00000000000000000000000000000000 (size!43875 _keys!1609)))))

(assert (=> d!143599 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!757177)))

(declare-fun b!1328319 () Bool)

(declare-fun e!757178 () Bool)

(assert (=> b!1328319 (= e!757178 call!64862)))

(declare-fun b!1328320 () Bool)

(assert (=> b!1328320 (= e!757176 e!757178)))

(declare-fun lt!590992 () (_ BitVec 64))

(assert (=> b!1328320 (= lt!590992 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590993 () Unit!43660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89713 (_ BitVec 64) (_ BitVec 32)) Unit!43660)

(assert (=> b!1328320 (= lt!590993 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590992 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1328320 (arrayContainsKey!0 _keys!1609 lt!590992 #b00000000000000000000000000000000)))

(declare-fun lt!590994 () Unit!43660)

(assert (=> b!1328320 (= lt!590994 lt!590993)))

(declare-fun res!881198 () Bool)

(declare-datatypes ((SeekEntryResult!9998 0))(
  ( (MissingZero!9998 (index!42363 (_ BitVec 32))) (Found!9998 (index!42364 (_ BitVec 32))) (Intermediate!9998 (undefined!10810 Bool) (index!42365 (_ BitVec 32)) (x!118289 (_ BitVec 32))) (Undefined!9998) (MissingVacant!9998 (index!42366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89713 (_ BitVec 32)) SeekEntryResult!9998)

(assert (=> b!1328320 (= res!881198 (= (seekEntryOrOpen!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!9998 #b00000000000000000000000000000000)))))

(assert (=> b!1328320 (=> (not res!881198) (not e!757178))))

(assert (= (and d!143599 (not res!881199)) b!1328317))

(assert (= (and b!1328317 c!126233) b!1328320))

(assert (= (and b!1328317 (not c!126233)) b!1328318))

(assert (= (and b!1328320 res!881198) b!1328319))

(assert (= (or b!1328319 b!1328318) bm!64859))

(declare-fun m!1217767 () Bool)

(assert (=> bm!64859 m!1217767))

(assert (=> b!1328317 m!1217759))

(assert (=> b!1328317 m!1217759))

(assert (=> b!1328317 m!1217763))

(assert (=> b!1328320 m!1217759))

(declare-fun m!1217769 () Bool)

(assert (=> b!1328320 m!1217769))

(declare-fun m!1217771 () Bool)

(assert (=> b!1328320 m!1217771))

(assert (=> b!1328320 m!1217759))

(declare-fun m!1217773 () Bool)

(assert (=> b!1328320 m!1217773))

(assert (=> b!1328146 d!143599))

(declare-fun d!143601 () Bool)

(assert (=> d!143601 (= (validKeyInArray!0 (select (arr!43324 _keys!1609) from!2000)) (and (not (= (select (arr!43324 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43324 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328148 d!143601))

(declare-fun d!143603 () Bool)

(declare-fun e!757180 () Bool)

(assert (=> d!143603 e!757180))

(declare-fun res!881200 () Bool)

(assert (=> d!143603 (=> res!881200 e!757180)))

(declare-fun lt!590995 () Bool)

(assert (=> d!143603 (= res!881200 (not lt!590995))))

(declare-fun lt!590996 () Bool)

(assert (=> d!143603 (= lt!590995 lt!590996)))

(declare-fun lt!590998 () Unit!43660)

(declare-fun e!757179 () Unit!43660)

(assert (=> d!143603 (= lt!590998 e!757179)))

(declare-fun c!126234 () Bool)

(assert (=> d!143603 (= c!126234 lt!590996)))

(assert (=> d!143603 (= lt!590996 (containsKey!736 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143603 (= (contains!8807 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590995)))

(declare-fun b!1328321 () Bool)

(declare-fun lt!590997 () Unit!43660)

(assert (=> b!1328321 (= e!757179 lt!590997)))

(assert (=> b!1328321 (= lt!590997 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> b!1328321 (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1328322 () Bool)

(declare-fun Unit!43664 () Unit!43660)

(assert (=> b!1328322 (= e!757179 Unit!43664)))

(declare-fun b!1328323 () Bool)

(assert (=> b!1328323 (= e!757180 (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143603 c!126234) b!1328321))

(assert (= (and d!143603 (not c!126234)) b!1328322))

(assert (= (and d!143603 (not res!881200)) b!1328323))

(declare-fun m!1217775 () Bool)

(assert (=> d!143603 m!1217775))

(declare-fun m!1217777 () Bool)

(assert (=> b!1328321 m!1217777))

(declare-fun m!1217779 () Bool)

(assert (=> b!1328321 m!1217779))

(assert (=> b!1328321 m!1217779))

(declare-fun m!1217781 () Bool)

(assert (=> b!1328321 m!1217781))

(assert (=> b!1328323 m!1217779))

(assert (=> b!1328323 m!1217779))

(assert (=> b!1328323 m!1217781))

(assert (=> b!1328153 d!143603))

(declare-fun b!1328324 () Bool)

(declare-fun e!757193 () ListLongMap!21243)

(declare-fun call!64868 () ListLongMap!21243)

(assert (=> b!1328324 (= e!757193 call!64868)))

(declare-fun bm!64860 () Bool)

(declare-fun call!64869 () Bool)

(declare-fun lt!591017 () ListLongMap!21243)

(assert (=> bm!64860 (= call!64869 (contains!8807 lt!591017 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328325 () Bool)

(declare-fun e!757188 () ListLongMap!21243)

(assert (=> b!1328325 (= e!757188 call!64868)))

(declare-fun b!1328326 () Bool)

(declare-fun e!757184 () Bool)

(declare-fun e!757181 () Bool)

(assert (=> b!1328326 (= e!757184 e!757181)))

(declare-fun res!881207 () Bool)

(declare-fun call!64864 () Bool)

(assert (=> b!1328326 (= res!881207 call!64864)))

(assert (=> b!1328326 (=> (not res!881207) (not e!757181))))

(declare-fun b!1328327 () Bool)

(declare-fun e!757185 () ListLongMap!21243)

(assert (=> b!1328327 (= e!757185 e!757188)))

(declare-fun c!126238 () Bool)

(assert (=> b!1328327 (= c!126238 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64861 () Bool)

(assert (=> bm!64861 (= call!64864 (contains!8807 lt!591017 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328329 () Bool)

(declare-fun e!757191 () Bool)

(declare-fun e!757187 () Bool)

(assert (=> b!1328329 (= e!757191 e!757187)))

(declare-fun c!126235 () Bool)

(assert (=> b!1328329 (= c!126235 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!64867 () ListLongMap!21243)

(declare-fun call!64865 () ListLongMap!21243)

(declare-fun call!64863 () ListLongMap!21243)

(declare-fun c!126237 () Bool)

(declare-fun bm!64862 () Bool)

(declare-fun call!64866 () ListLongMap!21243)

(assert (=> bm!64862 (= call!64865 (+!4679 (ite c!126237 call!64867 (ite c!126238 call!64866 call!64863)) (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1328330 () Bool)

(declare-fun e!757186 () Bool)

(assert (=> b!1328330 (= e!757186 (validKeyInArray!0 (select (arr!43324 _keys!1609) from!2000)))))

(declare-fun b!1328331 () Bool)

(declare-fun e!757183 () Bool)

(assert (=> b!1328331 (= e!757183 (= (apply!1040 lt!591017 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1328332 () Bool)

(assert (=> b!1328332 (= e!757181 (= (apply!1040 lt!591017 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1328333 () Bool)

(declare-fun res!881204 () Bool)

(assert (=> b!1328333 (=> (not res!881204) (not e!757191))))

(declare-fun e!757192 () Bool)

(assert (=> b!1328333 (= res!881204 e!757192)))

(declare-fun res!881205 () Bool)

(assert (=> b!1328333 (=> res!881205 e!757192)))

(assert (=> b!1328333 (= res!881205 (not e!757186))))

(declare-fun res!881203 () Bool)

(assert (=> b!1328333 (=> (not res!881203) (not e!757186))))

(assert (=> b!1328333 (= res!881203 (bvslt from!2000 (size!43875 _keys!1609)))))

(declare-fun b!1328334 () Bool)

(declare-fun res!881206 () Bool)

(assert (=> b!1328334 (=> (not res!881206) (not e!757191))))

(assert (=> b!1328334 (= res!881206 e!757184)))

(declare-fun c!126239 () Bool)

(assert (=> b!1328334 (= c!126239 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1328335 () Bool)

(assert (=> b!1328335 (= e!757184 (not call!64864))))

(declare-fun bm!64863 () Bool)

(assert (=> bm!64863 (= call!64863 call!64866)))

(declare-fun bm!64864 () Bool)

(assert (=> bm!64864 (= call!64867 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1328336 () Bool)

(declare-fun c!126240 () Bool)

(assert (=> b!1328336 (= c!126240 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1328336 (= e!757188 e!757193)))

(declare-fun b!1328337 () Bool)

(assert (=> b!1328337 (= e!757187 e!757183)))

(declare-fun res!881208 () Bool)

(assert (=> b!1328337 (= res!881208 call!64869)))

(assert (=> b!1328337 (=> (not res!881208) (not e!757183))))

(declare-fun e!757189 () Bool)

(declare-fun b!1328338 () Bool)

(assert (=> b!1328338 (= e!757189 (= (apply!1040 lt!591017 (select (arr!43324 _keys!1609) from!2000)) (get!21857 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328338 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43876 _values!1337)))))

(assert (=> b!1328338 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43875 _keys!1609)))))

(declare-fun bm!64865 () Bool)

(assert (=> bm!64865 (= call!64866 call!64867)))

(declare-fun b!1328339 () Bool)

(declare-fun e!757190 () Unit!43660)

(declare-fun Unit!43665 () Unit!43660)

(assert (=> b!1328339 (= e!757190 Unit!43665)))

(declare-fun b!1328340 () Bool)

(assert (=> b!1328340 (= e!757192 e!757189)))

(declare-fun res!881201 () Bool)

(assert (=> b!1328340 (=> (not res!881201) (not e!757189))))

(assert (=> b!1328340 (= res!881201 (contains!8807 lt!591017 (select (arr!43324 _keys!1609) from!2000)))))

(assert (=> b!1328340 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43875 _keys!1609)))))

(declare-fun bm!64866 () Bool)

(assert (=> bm!64866 (= call!64868 call!64865)))

(declare-fun b!1328341 () Bool)

(assert (=> b!1328341 (= e!757193 call!64863)))

(declare-fun b!1328328 () Bool)

(assert (=> b!1328328 (= e!757187 (not call!64869))))

(declare-fun d!143605 () Bool)

(assert (=> d!143605 e!757191))

(declare-fun res!881209 () Bool)

(assert (=> d!143605 (=> (not res!881209) (not e!757191))))

(assert (=> d!143605 (= res!881209 (or (bvsge from!2000 (size!43875 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43875 _keys!1609)))))))

(declare-fun lt!591007 () ListLongMap!21243)

(assert (=> d!143605 (= lt!591017 lt!591007)))

(declare-fun lt!591014 () Unit!43660)

(assert (=> d!143605 (= lt!591014 e!757190)))

(declare-fun c!126236 () Bool)

(declare-fun e!757182 () Bool)

(assert (=> d!143605 (= c!126236 e!757182)))

(declare-fun res!881202 () Bool)

(assert (=> d!143605 (=> (not res!881202) (not e!757182))))

(assert (=> d!143605 (= res!881202 (bvslt from!2000 (size!43875 _keys!1609)))))

(assert (=> d!143605 (= lt!591007 e!757185)))

(assert (=> d!143605 (= c!126237 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143605 (validMask!0 mask!2019)))

(assert (=> d!143605 (= (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!591017)))

(declare-fun b!1328342 () Bool)

(assert (=> b!1328342 (= e!757182 (validKeyInArray!0 (select (arr!43324 _keys!1609) from!2000)))))

(declare-fun b!1328343 () Bool)

(assert (=> b!1328343 (= e!757185 (+!4679 call!64865 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1328344 () Bool)

(declare-fun lt!591002 () Unit!43660)

(assert (=> b!1328344 (= e!757190 lt!591002)))

(declare-fun lt!591008 () ListLongMap!21243)

(assert (=> b!1328344 (= lt!591008 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!591003 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591003 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!591015 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591015 (select (arr!43324 _keys!1609) from!2000))))

(declare-fun lt!591000 () Unit!43660)

(assert (=> b!1328344 (= lt!591000 (addStillContains!1171 lt!591008 lt!591003 zeroValue!1279 lt!591015))))

(assert (=> b!1328344 (contains!8807 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279)) lt!591015)))

(declare-fun lt!591005 () Unit!43660)

(assert (=> b!1328344 (= lt!591005 lt!591000)))

(declare-fun lt!591010 () ListLongMap!21243)

(assert (=> b!1328344 (= lt!591010 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590999 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!590999 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!591009 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591009 (select (arr!43324 _keys!1609) from!2000))))

(declare-fun lt!591004 () Unit!43660)

(assert (=> b!1328344 (= lt!591004 (addApplyDifferent!569 lt!591010 lt!590999 minValue!1279 lt!591009))))

(assert (=> b!1328344 (= (apply!1040 (+!4679 lt!591010 (tuple2!23579 lt!590999 minValue!1279)) lt!591009) (apply!1040 lt!591010 lt!591009))))

(declare-fun lt!591001 () Unit!43660)

(assert (=> b!1328344 (= lt!591001 lt!591004)))

(declare-fun lt!591012 () ListLongMap!21243)

(assert (=> b!1328344 (= lt!591012 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!591018 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591018 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!591011 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591011 (select (arr!43324 _keys!1609) from!2000))))

(declare-fun lt!591019 () Unit!43660)

(assert (=> b!1328344 (= lt!591019 (addApplyDifferent!569 lt!591012 lt!591018 zeroValue!1279 lt!591011))))

(assert (=> b!1328344 (= (apply!1040 (+!4679 lt!591012 (tuple2!23579 lt!591018 zeroValue!1279)) lt!591011) (apply!1040 lt!591012 lt!591011))))

(declare-fun lt!591016 () Unit!43660)

(assert (=> b!1328344 (= lt!591016 lt!591019)))

(declare-fun lt!591006 () ListLongMap!21243)

(assert (=> b!1328344 (= lt!591006 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!591013 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591013 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!591020 () (_ BitVec 64))

(assert (=> b!1328344 (= lt!591020 (select (arr!43324 _keys!1609) from!2000))))

(assert (=> b!1328344 (= lt!591002 (addApplyDifferent!569 lt!591006 lt!591013 minValue!1279 lt!591020))))

(assert (=> b!1328344 (= (apply!1040 (+!4679 lt!591006 (tuple2!23579 lt!591013 minValue!1279)) lt!591020) (apply!1040 lt!591006 lt!591020))))

(assert (= (and d!143605 c!126237) b!1328343))

(assert (= (and d!143605 (not c!126237)) b!1328327))

(assert (= (and b!1328327 c!126238) b!1328325))

(assert (= (and b!1328327 (not c!126238)) b!1328336))

(assert (= (and b!1328336 c!126240) b!1328324))

(assert (= (and b!1328336 (not c!126240)) b!1328341))

(assert (= (or b!1328324 b!1328341) bm!64863))

(assert (= (or b!1328325 bm!64863) bm!64865))

(assert (= (or b!1328325 b!1328324) bm!64866))

(assert (= (or b!1328343 bm!64865) bm!64864))

(assert (= (or b!1328343 bm!64866) bm!64862))

(assert (= (and d!143605 res!881202) b!1328342))

(assert (= (and d!143605 c!126236) b!1328344))

(assert (= (and d!143605 (not c!126236)) b!1328339))

(assert (= (and d!143605 res!881209) b!1328333))

(assert (= (and b!1328333 res!881203) b!1328330))

(assert (= (and b!1328333 (not res!881205)) b!1328340))

(assert (= (and b!1328340 res!881201) b!1328338))

(assert (= (and b!1328333 res!881204) b!1328334))

(assert (= (and b!1328334 c!126239) b!1328326))

(assert (= (and b!1328334 (not c!126239)) b!1328335))

(assert (= (and b!1328326 res!881207) b!1328332))

(assert (= (or b!1328326 b!1328335) bm!64861))

(assert (= (and b!1328334 res!881206) b!1328329))

(assert (= (and b!1328329 c!126235) b!1328337))

(assert (= (and b!1328329 (not c!126235)) b!1328328))

(assert (= (and b!1328337 res!881208) b!1328331))

(assert (= (or b!1328337 b!1328328) bm!64860))

(declare-fun b_lambda!23827 () Bool)

(assert (=> (not b_lambda!23827) (not b!1328338)))

(assert (=> b!1328338 t!44729))

(declare-fun b_and!49183 () Bool)

(assert (= b_and!49181 (and (=> t!44729 result!24669) b_and!49183)))

(declare-fun m!1217783 () Bool)

(assert (=> bm!64862 m!1217783))

(assert (=> d!143605 m!1217637))

(assert (=> b!1328338 m!1217627))

(declare-fun m!1217785 () Bool)

(assert (=> b!1328338 m!1217785))

(assert (=> b!1328338 m!1217627))

(declare-fun m!1217787 () Bool)

(assert (=> b!1328338 m!1217787))

(assert (=> b!1328338 m!1217709))

(assert (=> b!1328338 m!1217787))

(assert (=> b!1328338 m!1217709))

(declare-fun m!1217789 () Bool)

(assert (=> b!1328338 m!1217789))

(assert (=> b!1328340 m!1217627))

(assert (=> b!1328340 m!1217627))

(declare-fun m!1217791 () Bool)

(assert (=> b!1328340 m!1217791))

(assert (=> b!1328342 m!1217627))

(assert (=> b!1328342 m!1217627))

(assert (=> b!1328342 m!1217629))

(declare-fun m!1217793 () Bool)

(assert (=> bm!64860 m!1217793))

(declare-fun m!1217795 () Bool)

(assert (=> bm!64861 m!1217795))

(declare-fun m!1217797 () Bool)

(assert (=> b!1328344 m!1217797))

(declare-fun m!1217799 () Bool)

(assert (=> b!1328344 m!1217799))

(declare-fun m!1217801 () Bool)

(assert (=> b!1328344 m!1217801))

(declare-fun m!1217803 () Bool)

(assert (=> b!1328344 m!1217803))

(declare-fun m!1217805 () Bool)

(assert (=> b!1328344 m!1217805))

(declare-fun m!1217807 () Bool)

(assert (=> b!1328344 m!1217807))

(assert (=> b!1328344 m!1217805))

(assert (=> b!1328344 m!1217627))

(declare-fun m!1217809 () Bool)

(assert (=> b!1328344 m!1217809))

(declare-fun m!1217811 () Bool)

(assert (=> b!1328344 m!1217811))

(assert (=> b!1328344 m!1217809))

(assert (=> b!1328344 m!1217797))

(declare-fun m!1217813 () Bool)

(assert (=> b!1328344 m!1217813))

(declare-fun m!1217815 () Bool)

(assert (=> b!1328344 m!1217815))

(declare-fun m!1217817 () Bool)

(assert (=> b!1328344 m!1217817))

(declare-fun m!1217819 () Bool)

(assert (=> b!1328344 m!1217819))

(assert (=> b!1328344 m!1217815))

(declare-fun m!1217821 () Bool)

(assert (=> b!1328344 m!1217821))

(declare-fun m!1217823 () Bool)

(assert (=> b!1328344 m!1217823))

(declare-fun m!1217825 () Bool)

(assert (=> b!1328344 m!1217825))

(declare-fun m!1217827 () Bool)

(assert (=> b!1328344 m!1217827))

(declare-fun m!1217829 () Bool)

(assert (=> b!1328343 m!1217829))

(declare-fun m!1217831 () Bool)

(assert (=> b!1328332 m!1217831))

(declare-fun m!1217833 () Bool)

(assert (=> b!1328331 m!1217833))

(assert (=> b!1328330 m!1217627))

(assert (=> b!1328330 m!1217627))

(assert (=> b!1328330 m!1217629))

(assert (=> bm!64864 m!1217799))

(assert (=> b!1328153 d!143605))

(declare-fun b!1328352 () Bool)

(declare-fun e!757199 () Bool)

(assert (=> b!1328352 (= e!757199 tp_is_empty!36355)))

(declare-fun condMapEmpty!56196 () Bool)

(declare-fun mapDefault!56196 () ValueCell!17279)

(assert (=> mapNonEmpty!56187 (= condMapEmpty!56196 (= mapRest!56187 ((as const (Array (_ BitVec 32) ValueCell!17279)) mapDefault!56196)))))

(declare-fun mapRes!56196 () Bool)

(assert (=> mapNonEmpty!56187 (= tp!107087 (and e!757199 mapRes!56196))))

(declare-fun mapIsEmpty!56196 () Bool)

(assert (=> mapIsEmpty!56196 mapRes!56196))

(declare-fun mapNonEmpty!56196 () Bool)

(declare-fun tp!107103 () Bool)

(declare-fun e!757198 () Bool)

(assert (=> mapNonEmpty!56196 (= mapRes!56196 (and tp!107103 e!757198))))

(declare-fun mapValue!56196 () ValueCell!17279)

(declare-fun mapRest!56196 () (Array (_ BitVec 32) ValueCell!17279))

(declare-fun mapKey!56196 () (_ BitVec 32))

(assert (=> mapNonEmpty!56196 (= mapRest!56187 (store mapRest!56196 mapKey!56196 mapValue!56196))))

(declare-fun b!1328351 () Bool)

(assert (=> b!1328351 (= e!757198 tp_is_empty!36355)))

(assert (= (and mapNonEmpty!56187 condMapEmpty!56196) mapIsEmpty!56196))

(assert (= (and mapNonEmpty!56187 (not condMapEmpty!56196)) mapNonEmpty!56196))

(assert (= (and mapNonEmpty!56196 ((_ is ValueCellFull!17279) mapValue!56196)) b!1328351))

(assert (= (and mapNonEmpty!56187 ((_ is ValueCellFull!17279) mapDefault!56196)) b!1328352))

(declare-fun m!1217835 () Bool)

(assert (=> mapNonEmpty!56196 m!1217835))

(declare-fun b_lambda!23829 () Bool)

(assert (= b_lambda!23827 (or (and start!112186 b_free!30535) b_lambda!23829)))

(declare-fun b_lambda!23831 () Bool)

(assert (= b_lambda!23825 (or (and start!112186 b_free!30535) b_lambda!23831)))

(check-sat (not b_lambda!23831) (not bm!64861) (not b!1328330) (not d!143587) (not b!1328285) (not mapNonEmpty!56196) (not b!1328291) (not b!1328332) (not b!1328340) (not b!1328287) (not b_next!30535) (not b!1328343) (not b!1328338) (not b!1328228) (not b!1328317) (not b!1328323) (not b!1328344) (not bm!64849) b_and!49183 (not d!143589) (not b!1328308) (not bm!64847) (not b!1328306) (not bm!64856) (not b!1328342) (not b!1328289) (not b!1328290) (not b!1328331) (not bm!64851) (not d!143605) (not b!1328279) (not d!143603) (not bm!64862) (not b!1328304) (not bm!64859) (not bm!64864) tp_is_empty!36355 (not b_lambda!23829) (not b!1328321) (not bm!64860) (not b!1328320) (not b!1328278) (not bm!64848) (not b!1328277) (not b!1328226))
(check-sat b_and!49183 (not b_next!30535))
(get-model)

(declare-fun d!143607 () Bool)

(assert (=> d!143607 (arrayContainsKey!0 _keys!1609 lt!590992 #b00000000000000000000000000000000)))

(declare-fun lt!591023 () Unit!43660)

(declare-fun choose!13 (array!89713 (_ BitVec 64) (_ BitVec 32)) Unit!43660)

(assert (=> d!143607 (= lt!591023 (choose!13 _keys!1609 lt!590992 #b00000000000000000000000000000000))))

(assert (=> d!143607 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143607 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590992 #b00000000000000000000000000000000) lt!591023)))

(declare-fun bs!37970 () Bool)

(assert (= bs!37970 d!143607))

(assert (=> bs!37970 m!1217771))

(declare-fun m!1217837 () Bool)

(assert (=> bs!37970 m!1217837))

(assert (=> b!1328320 d!143607))

(declare-fun d!143609 () Bool)

(declare-fun res!881214 () Bool)

(declare-fun e!757204 () Bool)

(assert (=> d!143609 (=> res!881214 e!757204)))

(assert (=> d!143609 (= res!881214 (= (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) lt!590992))))

(assert (=> d!143609 (= (arrayContainsKey!0 _keys!1609 lt!590992 #b00000000000000000000000000000000) e!757204)))

(declare-fun b!1328357 () Bool)

(declare-fun e!757205 () Bool)

(assert (=> b!1328357 (= e!757204 e!757205)))

(declare-fun res!881215 () Bool)

(assert (=> b!1328357 (=> (not res!881215) (not e!757205))))

(assert (=> b!1328357 (= res!881215 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43875 _keys!1609)))))

(declare-fun b!1328358 () Bool)

(assert (=> b!1328358 (= e!757205 (arrayContainsKey!0 _keys!1609 lt!590992 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143609 (not res!881214)) b!1328357))

(assert (= (and b!1328357 res!881215) b!1328358))

(assert (=> d!143609 m!1217759))

(declare-fun m!1217839 () Bool)

(assert (=> b!1328358 m!1217839))

(assert (=> b!1328320 d!143609))

(declare-fun b!1328371 () Bool)

(declare-fun e!757213 () SeekEntryResult!9998)

(assert (=> b!1328371 (= e!757213 Undefined!9998)))

(declare-fun lt!591032 () SeekEntryResult!9998)

(declare-fun e!757214 () SeekEntryResult!9998)

(declare-fun b!1328372 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89713 (_ BitVec 32)) SeekEntryResult!9998)

(assert (=> b!1328372 (= e!757214 (seekKeyOrZeroReturnVacant!0 (x!118289 lt!591032) (index!42365 lt!591032) (index!42365 lt!591032) (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(declare-fun b!1328373 () Bool)

(assert (=> b!1328373 (= e!757214 (MissingZero!9998 (index!42365 lt!591032)))))

(declare-fun b!1328374 () Bool)

(declare-fun e!757212 () SeekEntryResult!9998)

(assert (=> b!1328374 (= e!757212 (Found!9998 (index!42365 lt!591032)))))

(declare-fun b!1328375 () Bool)

(declare-fun c!126249 () Bool)

(declare-fun lt!591031 () (_ BitVec 64))

(assert (=> b!1328375 (= c!126249 (= lt!591031 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1328375 (= e!757212 e!757214)))

(declare-fun d!143611 () Bool)

(declare-fun lt!591030 () SeekEntryResult!9998)

(assert (=> d!143611 (and (or ((_ is Undefined!9998) lt!591030) (not ((_ is Found!9998) lt!591030)) (and (bvsge (index!42364 lt!591030) #b00000000000000000000000000000000) (bvslt (index!42364 lt!591030) (size!43875 _keys!1609)))) (or ((_ is Undefined!9998) lt!591030) ((_ is Found!9998) lt!591030) (not ((_ is MissingZero!9998) lt!591030)) (and (bvsge (index!42363 lt!591030) #b00000000000000000000000000000000) (bvslt (index!42363 lt!591030) (size!43875 _keys!1609)))) (or ((_ is Undefined!9998) lt!591030) ((_ is Found!9998) lt!591030) ((_ is MissingZero!9998) lt!591030) (not ((_ is MissingVacant!9998) lt!591030)) (and (bvsge (index!42366 lt!591030) #b00000000000000000000000000000000) (bvslt (index!42366 lt!591030) (size!43875 _keys!1609)))) (or ((_ is Undefined!9998) lt!591030) (ite ((_ is Found!9998) lt!591030) (= (select (arr!43324 _keys!1609) (index!42364 lt!591030)) (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!9998) lt!591030) (= (select (arr!43324 _keys!1609) (index!42363 lt!591030)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9998) lt!591030) (= (select (arr!43324 _keys!1609) (index!42366 lt!591030)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143611 (= lt!591030 e!757213)))

(declare-fun c!126248 () Bool)

(assert (=> d!143611 (= c!126248 (and ((_ is Intermediate!9998) lt!591032) (undefined!10810 lt!591032)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89713 (_ BitVec 32)) SeekEntryResult!9998)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143611 (= lt!591032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) mask!2019) (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(assert (=> d!143611 (validMask!0 mask!2019)))

(assert (=> d!143611 (= (seekEntryOrOpen!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) lt!591030)))

(declare-fun b!1328376 () Bool)

(assert (=> b!1328376 (= e!757213 e!757212)))

(assert (=> b!1328376 (= lt!591031 (select (arr!43324 _keys!1609) (index!42365 lt!591032)))))

(declare-fun c!126247 () Bool)

(assert (=> b!1328376 (= c!126247 (= lt!591031 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143611 c!126248) b!1328371))

(assert (= (and d!143611 (not c!126248)) b!1328376))

(assert (= (and b!1328376 c!126247) b!1328374))

(assert (= (and b!1328376 (not c!126247)) b!1328375))

(assert (= (and b!1328375 c!126249) b!1328373))

(assert (= (and b!1328375 (not c!126249)) b!1328372))

(assert (=> b!1328372 m!1217759))

(declare-fun m!1217841 () Bool)

(assert (=> b!1328372 m!1217841))

(assert (=> d!143611 m!1217637))

(declare-fun m!1217843 () Bool)

(assert (=> d!143611 m!1217843))

(declare-fun m!1217845 () Bool)

(assert (=> d!143611 m!1217845))

(assert (=> d!143611 m!1217759))

(declare-fun m!1217847 () Bool)

(assert (=> d!143611 m!1217847))

(assert (=> d!143611 m!1217847))

(assert (=> d!143611 m!1217759))

(declare-fun m!1217849 () Bool)

(assert (=> d!143611 m!1217849))

(declare-fun m!1217851 () Bool)

(assert (=> d!143611 m!1217851))

(declare-fun m!1217853 () Bool)

(assert (=> b!1328376 m!1217853))

(assert (=> b!1328320 d!143611))

(declare-fun b!1328402 () Bool)

(declare-fun lt!591051 () Unit!43660)

(declare-fun lt!591048 () Unit!43660)

(assert (=> b!1328402 (= lt!591051 lt!591048)))

(declare-fun lt!591053 () V!53577)

(declare-fun lt!591052 () (_ BitVec 64))

(declare-fun lt!591049 () (_ BitVec 64))

(declare-fun lt!591047 () ListLongMap!21243)

(assert (=> b!1328402 (not (contains!8807 (+!4679 lt!591047 (tuple2!23579 lt!591052 lt!591053)) lt!591049))))

(declare-fun addStillNotContains!496 (ListLongMap!21243 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43660)

(assert (=> b!1328402 (= lt!591048 (addStillNotContains!496 lt!591047 lt!591052 lt!591053 lt!591049))))

(assert (=> b!1328402 (= lt!591049 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1328402 (= lt!591053 (get!21857 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1328402 (= lt!591052 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun call!64872 () ListLongMap!21243)

(assert (=> b!1328402 (= lt!591047 call!64872)))

(declare-fun e!757229 () ListLongMap!21243)

(assert (=> b!1328402 (= e!757229 (+!4679 call!64872 (tuple2!23579 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21857 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1328403 () Bool)

(declare-fun e!757234 () Bool)

(declare-fun lt!591050 () ListLongMap!21243)

(declare-fun isEmpty!1083 (ListLongMap!21243) Bool)

(assert (=> b!1328403 (= e!757234 (isEmpty!1083 lt!591050))))

(declare-fun b!1328404 () Bool)

(declare-fun e!757232 () ListLongMap!21243)

(assert (=> b!1328404 (= e!757232 (ListLongMap!21244 Nil!30727))))

(declare-fun b!1328405 () Bool)

(declare-fun e!757231 () Bool)

(declare-fun e!757230 () Bool)

(assert (=> b!1328405 (= e!757231 e!757230)))

(assert (=> b!1328405 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(declare-fun res!881227 () Bool)

(assert (=> b!1328405 (= res!881227 (contains!8807 lt!591050 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328405 (=> (not res!881227) (not e!757230))))

(declare-fun b!1328406 () Bool)

(assert (=> b!1328406 (= e!757229 call!64872)))

(declare-fun b!1328407 () Bool)

(declare-fun e!757233 () Bool)

(assert (=> b!1328407 (= e!757233 e!757231)))

(declare-fun c!126259 () Bool)

(declare-fun e!757235 () Bool)

(assert (=> b!1328407 (= c!126259 e!757235)))

(declare-fun res!881225 () Bool)

(assert (=> b!1328407 (=> (not res!881225) (not e!757235))))

(assert (=> b!1328407 (= res!881225 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(declare-fun b!1328401 () Bool)

(assert (=> b!1328401 (= e!757235 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328401 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun d!143613 () Bool)

(assert (=> d!143613 e!757233))

(declare-fun res!881226 () Bool)

(assert (=> d!143613 (=> (not res!881226) (not e!757233))))

(assert (=> d!143613 (= res!881226 (not (contains!8807 lt!591050 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143613 (= lt!591050 e!757232)))

(declare-fun c!126261 () Bool)

(assert (=> d!143613 (= c!126261 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(assert (=> d!143613 (validMask!0 mask!2019)))

(assert (=> d!143613 (= (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!591050)))

(declare-fun bm!64869 () Bool)

(assert (=> bm!64869 (= call!64872 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1328408 () Bool)

(assert (=> b!1328408 (= e!757231 e!757234)))

(declare-fun c!126258 () Bool)

(assert (=> b!1328408 (= c!126258 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(declare-fun b!1328409 () Bool)

(assert (=> b!1328409 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43875 _keys!1609)))))

(assert (=> b!1328409 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43876 _values!1337)))))

(assert (=> b!1328409 (= e!757230 (= (apply!1040 lt!591050 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21857 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328410 () Bool)

(assert (=> b!1328410 (= e!757234 (= lt!591050 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1328411 () Bool)

(assert (=> b!1328411 (= e!757232 e!757229)))

(declare-fun c!126260 () Bool)

(assert (=> b!1328411 (= c!126260 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1328412 () Bool)

(declare-fun res!881224 () Bool)

(assert (=> b!1328412 (=> (not res!881224) (not e!757233))))

(assert (=> b!1328412 (= res!881224 (not (contains!8807 lt!591050 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143613 c!126261) b!1328404))

(assert (= (and d!143613 (not c!126261)) b!1328411))

(assert (= (and b!1328411 c!126260) b!1328402))

(assert (= (and b!1328411 (not c!126260)) b!1328406))

(assert (= (or b!1328402 b!1328406) bm!64869))

(assert (= (and d!143613 res!881226) b!1328412))

(assert (= (and b!1328412 res!881224) b!1328407))

(assert (= (and b!1328407 res!881225) b!1328401))

(assert (= (and b!1328407 c!126259) b!1328405))

(assert (= (and b!1328407 (not c!126259)) b!1328408))

(assert (= (and b!1328405 res!881227) b!1328409))

(assert (= (and b!1328408 c!126258) b!1328410))

(assert (= (and b!1328408 (not c!126258)) b!1328403))

(declare-fun b_lambda!23833 () Bool)

(assert (=> (not b_lambda!23833) (not b!1328402)))

(assert (=> b!1328402 t!44729))

(declare-fun b_and!49185 () Bool)

(assert (= b_and!49183 (and (=> t!44729 result!24669) b_and!49185)))

(declare-fun b_lambda!23835 () Bool)

(assert (=> (not b_lambda!23835) (not b!1328409)))

(assert (=> b!1328409 t!44729))

(declare-fun b_and!49187 () Bool)

(assert (= b_and!49185 (and (=> t!44729 result!24669) b_and!49187)))

(assert (=> b!1328409 m!1217703))

(assert (=> b!1328409 m!1217707))

(assert (=> b!1328409 m!1217709))

(assert (=> b!1328409 m!1217711))

(assert (=> b!1328409 m!1217707))

(assert (=> b!1328409 m!1217703))

(declare-fun m!1217855 () Bool)

(assert (=> b!1328409 m!1217855))

(assert (=> b!1328409 m!1217709))

(assert (=> b!1328411 m!1217703))

(assert (=> b!1328411 m!1217703))

(assert (=> b!1328411 m!1217715))

(declare-fun m!1217857 () Bool)

(assert (=> bm!64869 m!1217857))

(assert (=> b!1328405 m!1217703))

(assert (=> b!1328405 m!1217703))

(declare-fun m!1217859 () Bool)

(assert (=> b!1328405 m!1217859))

(declare-fun m!1217861 () Bool)

(assert (=> b!1328412 m!1217861))

(assert (=> b!1328401 m!1217703))

(assert (=> b!1328401 m!1217703))

(assert (=> b!1328401 m!1217715))

(declare-fun m!1217863 () Bool)

(assert (=> b!1328403 m!1217863))

(declare-fun m!1217865 () Bool)

(assert (=> d!143613 m!1217865))

(assert (=> d!143613 m!1217637))

(assert (=> b!1328410 m!1217857))

(declare-fun m!1217867 () Bool)

(assert (=> b!1328402 m!1217867))

(declare-fun m!1217869 () Bool)

(assert (=> b!1328402 m!1217869))

(assert (=> b!1328402 m!1217703))

(assert (=> b!1328402 m!1217707))

(assert (=> b!1328402 m!1217709))

(assert (=> b!1328402 m!1217711))

(assert (=> b!1328402 m!1217707))

(assert (=> b!1328402 m!1217869))

(declare-fun m!1217871 () Bool)

(assert (=> b!1328402 m!1217871))

(assert (=> b!1328402 m!1217709))

(declare-fun m!1217873 () Bool)

(assert (=> b!1328402 m!1217873))

(assert (=> bm!64851 d!143613))

(declare-fun d!143615 () Bool)

(declare-fun get!21858 (Option!761) V!53577)

(assert (=> d!143615 (= (apply!1040 lt!591017 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21858 (getValueByKey!710 (toList!10637 lt!591017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37971 () Bool)

(assert (= bs!37971 d!143615))

(declare-fun m!1217875 () Bool)

(assert (=> bs!37971 m!1217875))

(assert (=> bs!37971 m!1217875))

(declare-fun m!1217877 () Bool)

(assert (=> bs!37971 m!1217877))

(assert (=> b!1328331 d!143615))

(declare-fun d!143617 () Bool)

(assert (=> d!143617 (= (apply!1040 lt!591017 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21858 (getValueByKey!710 (toList!10637 lt!591017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37972 () Bool)

(assert (= bs!37972 d!143617))

(declare-fun m!1217879 () Bool)

(assert (=> bs!37972 m!1217879))

(assert (=> bs!37972 m!1217879))

(declare-fun m!1217881 () Bool)

(assert (=> bs!37972 m!1217881))

(assert (=> b!1328332 d!143617))

(declare-fun d!143619 () Bool)

(declare-fun res!881232 () Bool)

(declare-fun e!757240 () Bool)

(assert (=> d!143619 (=> res!881232 e!757240)))

(assert (=> d!143619 (= res!881232 (and ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143619 (= (containsKey!736 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) e!757240)))

(declare-fun b!1328417 () Bool)

(declare-fun e!757241 () Bool)

(assert (=> b!1328417 (= e!757240 e!757241)))

(declare-fun res!881233 () Bool)

(assert (=> b!1328417 (=> (not res!881233) (not e!757241))))

(assert (=> b!1328417 (= res!881233 (and (or (not ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (bvsle (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)) ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvslt (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1328418 () Bool)

(assert (=> b!1328418 (= e!757241 (containsKey!736 (t!44726 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) k0!1164))))

(assert (= (and d!143619 (not res!881232)) b!1328417))

(assert (= (and b!1328417 res!881233) b!1328418))

(declare-fun m!1217883 () Bool)

(assert (=> b!1328418 m!1217883))

(assert (=> d!143587 d!143619))

(declare-fun d!143621 () Bool)

(assert (=> d!143621 (= (apply!1040 lt!590982 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21858 (getValueByKey!710 (toList!10637 lt!590982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37973 () Bool)

(assert (= bs!37973 d!143621))

(declare-fun m!1217885 () Bool)

(assert (=> bs!37973 m!1217885))

(assert (=> bs!37973 m!1217885))

(declare-fun m!1217887 () Bool)

(assert (=> bs!37973 m!1217887))

(assert (=> b!1328278 d!143621))

(declare-fun d!143623 () Bool)

(declare-fun e!757244 () Bool)

(assert (=> d!143623 e!757244))

(declare-fun res!881239 () Bool)

(assert (=> d!143623 (=> (not res!881239) (not e!757244))))

(declare-fun lt!591062 () ListLongMap!21243)

(assert (=> d!143623 (= res!881239 (contains!8807 lt!591062 (_1!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!591065 () List!30730)

(assert (=> d!143623 (= lt!591062 (ListLongMap!21244 lt!591065))))

(declare-fun lt!591063 () Unit!43660)

(declare-fun lt!591064 () Unit!43660)

(assert (=> d!143623 (= lt!591063 lt!591064)))

(assert (=> d!143623 (= (getValueByKey!710 lt!591065 (_1!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!760 (_2!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!360 (List!30730 (_ BitVec 64) V!53577) Unit!43660)

(assert (=> d!143623 (= lt!591064 (lemmaContainsTupThenGetReturnValue!360 lt!591065 (_1!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun insertStrictlySorted!489 (List!30730 (_ BitVec 64) V!53577) List!30730)

(assert (=> d!143623 (= lt!591065 (insertStrictlySorted!489 (toList!10637 (ite c!126237 call!64867 (ite c!126238 call!64866 call!64863))) (_1!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143623 (= (+!4679 (ite c!126237 call!64867 (ite c!126238 call!64866 call!64863)) (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!591062)))

(declare-fun b!1328423 () Bool)

(declare-fun res!881238 () Bool)

(assert (=> b!1328423 (=> (not res!881238) (not e!757244))))

(assert (=> b!1328423 (= res!881238 (= (getValueByKey!710 (toList!10637 lt!591062) (_1!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!760 (_2!11800 (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1328424 () Bool)

(declare-fun contains!8809 (List!30730 tuple2!23578) Bool)

(assert (=> b!1328424 (= e!757244 (contains!8809 (toList!10637 lt!591062) (ite (or c!126237 c!126238) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143623 res!881239) b!1328423))

(assert (= (and b!1328423 res!881238) b!1328424))

(declare-fun m!1217889 () Bool)

(assert (=> d!143623 m!1217889))

(declare-fun m!1217891 () Bool)

(assert (=> d!143623 m!1217891))

(declare-fun m!1217893 () Bool)

(assert (=> d!143623 m!1217893))

(declare-fun m!1217895 () Bool)

(assert (=> d!143623 m!1217895))

(declare-fun m!1217897 () Bool)

(assert (=> b!1328423 m!1217897))

(declare-fun m!1217899 () Bool)

(assert (=> b!1328424 m!1217899))

(assert (=> bm!64862 d!143623))

(declare-fun d!143625 () Bool)

(assert (=> d!143625 (= (apply!1040 lt!590982 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21858 (getValueByKey!710 (toList!10637 lt!590982) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37974 () Bool)

(assert (= bs!37974 d!143625))

(declare-fun m!1217901 () Bool)

(assert (=> bs!37974 m!1217901))

(assert (=> bs!37974 m!1217901))

(declare-fun m!1217903 () Bool)

(assert (=> bs!37974 m!1217903))

(assert (=> b!1328279 d!143625))

(assert (=> b!1328330 d!143601))

(declare-fun bm!64870 () Bool)

(declare-fun call!64873 () Bool)

(assert (=> bm!64870 (= call!64873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1328425 () Bool)

(declare-fun e!757246 () Bool)

(declare-fun e!757245 () Bool)

(assert (=> b!1328425 (= e!757246 e!757245)))

(declare-fun c!126262 () Bool)

(assert (=> b!1328425 (= c!126262 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1328426 () Bool)

(assert (=> b!1328426 (= e!757245 call!64873)))

(declare-fun d!143627 () Bool)

(declare-fun res!881241 () Bool)

(assert (=> d!143627 (=> res!881241 e!757246)))

(assert (=> d!143627 (= res!881241 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43875 _keys!1609)))))

(assert (=> d!143627 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019) e!757246)))

(declare-fun b!1328427 () Bool)

(declare-fun e!757247 () Bool)

(assert (=> b!1328427 (= e!757247 call!64873)))

(declare-fun b!1328428 () Bool)

(assert (=> b!1328428 (= e!757245 e!757247)))

(declare-fun lt!591066 () (_ BitVec 64))

(assert (=> b!1328428 (= lt!591066 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!591067 () Unit!43660)

(assert (=> b!1328428 (= lt!591067 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!591066 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1328428 (arrayContainsKey!0 _keys!1609 lt!591066 #b00000000000000000000000000000000)))

(declare-fun lt!591068 () Unit!43660)

(assert (=> b!1328428 (= lt!591068 lt!591067)))

(declare-fun res!881240 () Bool)

(assert (=> b!1328428 (= res!881240 (= (seekEntryOrOpen!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1609 mask!2019) (Found!9998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1328428 (=> (not res!881240) (not e!757247))))

(assert (= (and d!143627 (not res!881241)) b!1328425))

(assert (= (and b!1328425 c!126262) b!1328428))

(assert (= (and b!1328425 (not c!126262)) b!1328426))

(assert (= (and b!1328428 res!881240) b!1328427))

(assert (= (or b!1328427 b!1328426) bm!64870))

(declare-fun m!1217905 () Bool)

(assert (=> bm!64870 m!1217905))

(declare-fun m!1217907 () Bool)

(assert (=> b!1328425 m!1217907))

(assert (=> b!1328425 m!1217907))

(declare-fun m!1217909 () Bool)

(assert (=> b!1328425 m!1217909))

(assert (=> b!1328428 m!1217907))

(declare-fun m!1217911 () Bool)

(assert (=> b!1328428 m!1217911))

(declare-fun m!1217913 () Bool)

(assert (=> b!1328428 m!1217913))

(assert (=> b!1328428 m!1217907))

(declare-fun m!1217915 () Bool)

(assert (=> b!1328428 m!1217915))

(assert (=> bm!64859 d!143627))

(declare-fun d!143629 () Bool)

(assert (=> d!143629 (= (validKeyInArray!0 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)) (and (not (= (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328317 d!143629))

(declare-fun d!143631 () Bool)

(declare-fun e!757248 () Bool)

(assert (=> d!143631 e!757248))

(declare-fun res!881243 () Bool)

(assert (=> d!143631 (=> (not res!881243) (not e!757248))))

(declare-fun lt!591069 () ListLongMap!21243)

(assert (=> d!143631 (= res!881243 (contains!8807 lt!591069 (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!591072 () List!30730)

(assert (=> d!143631 (= lt!591069 (ListLongMap!21244 lt!591072))))

(declare-fun lt!591070 () Unit!43660)

(declare-fun lt!591071 () Unit!43660)

(assert (=> d!143631 (= lt!591070 lt!591071)))

(assert (=> d!143631 (= (getValueByKey!710 lt!591072 (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143631 (= lt!591071 (lemmaContainsTupThenGetReturnValue!360 lt!591072 (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143631 (= lt!591072 (insertStrictlySorted!489 (toList!10637 call!64865) (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143631 (= (+!4679 call!64865 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!591069)))

(declare-fun b!1328429 () Bool)

(declare-fun res!881242 () Bool)

(assert (=> b!1328429 (=> (not res!881242) (not e!757248))))

(assert (=> b!1328429 (= res!881242 (= (getValueByKey!710 (toList!10637 lt!591069) (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1328430 () Bool)

(assert (=> b!1328430 (= e!757248 (contains!8809 (toList!10637 lt!591069) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143631 res!881243) b!1328429))

(assert (= (and b!1328429 res!881242) b!1328430))

(declare-fun m!1217917 () Bool)

(assert (=> d!143631 m!1217917))

(declare-fun m!1217919 () Bool)

(assert (=> d!143631 m!1217919))

(declare-fun m!1217921 () Bool)

(assert (=> d!143631 m!1217921))

(declare-fun m!1217923 () Bool)

(assert (=> d!143631 m!1217923))

(declare-fun m!1217925 () Bool)

(assert (=> b!1328429 m!1217925))

(declare-fun m!1217927 () Bool)

(assert (=> b!1328430 m!1217927))

(assert (=> b!1328343 d!143631))

(declare-fun d!143633 () Bool)

(declare-fun e!757249 () Bool)

(assert (=> d!143633 e!757249))

(declare-fun res!881245 () Bool)

(assert (=> d!143633 (=> (not res!881245) (not e!757249))))

(declare-fun lt!591073 () ListLongMap!21243)

(assert (=> d!143633 (= res!881245 (contains!8807 lt!591073 (_1!11800 (tuple2!23579 lt!591018 zeroValue!1279))))))

(declare-fun lt!591076 () List!30730)

(assert (=> d!143633 (= lt!591073 (ListLongMap!21244 lt!591076))))

(declare-fun lt!591074 () Unit!43660)

(declare-fun lt!591075 () Unit!43660)

(assert (=> d!143633 (= lt!591074 lt!591075)))

(assert (=> d!143633 (= (getValueByKey!710 lt!591076 (_1!11800 (tuple2!23579 lt!591018 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!591018 zeroValue!1279))))))

(assert (=> d!143633 (= lt!591075 (lemmaContainsTupThenGetReturnValue!360 lt!591076 (_1!11800 (tuple2!23579 lt!591018 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!591018 zeroValue!1279))))))

(assert (=> d!143633 (= lt!591076 (insertStrictlySorted!489 (toList!10637 lt!591012) (_1!11800 (tuple2!23579 lt!591018 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!591018 zeroValue!1279))))))

(assert (=> d!143633 (= (+!4679 lt!591012 (tuple2!23579 lt!591018 zeroValue!1279)) lt!591073)))

(declare-fun b!1328431 () Bool)

(declare-fun res!881244 () Bool)

(assert (=> b!1328431 (=> (not res!881244) (not e!757249))))

(assert (=> b!1328431 (= res!881244 (= (getValueByKey!710 (toList!10637 lt!591073) (_1!11800 (tuple2!23579 lt!591018 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!591018 zeroValue!1279)))))))

(declare-fun b!1328432 () Bool)

(assert (=> b!1328432 (= e!757249 (contains!8809 (toList!10637 lt!591073) (tuple2!23579 lt!591018 zeroValue!1279)))))

(assert (= (and d!143633 res!881245) b!1328431))

(assert (= (and b!1328431 res!881244) b!1328432))

(declare-fun m!1217929 () Bool)

(assert (=> d!143633 m!1217929))

(declare-fun m!1217931 () Bool)

(assert (=> d!143633 m!1217931))

(declare-fun m!1217933 () Bool)

(assert (=> d!143633 m!1217933))

(declare-fun m!1217935 () Bool)

(assert (=> d!143633 m!1217935))

(declare-fun m!1217937 () Bool)

(assert (=> b!1328431 m!1217937))

(declare-fun m!1217939 () Bool)

(assert (=> b!1328432 m!1217939))

(assert (=> b!1328344 d!143633))

(declare-fun d!143635 () Bool)

(declare-fun e!757250 () Bool)

(assert (=> d!143635 e!757250))

(declare-fun res!881247 () Bool)

(assert (=> d!143635 (=> (not res!881247) (not e!757250))))

(declare-fun lt!591077 () ListLongMap!21243)

(assert (=> d!143635 (= res!881247 (contains!8807 lt!591077 (_1!11800 (tuple2!23579 lt!591003 zeroValue!1279))))))

(declare-fun lt!591080 () List!30730)

(assert (=> d!143635 (= lt!591077 (ListLongMap!21244 lt!591080))))

(declare-fun lt!591078 () Unit!43660)

(declare-fun lt!591079 () Unit!43660)

(assert (=> d!143635 (= lt!591078 lt!591079)))

(assert (=> d!143635 (= (getValueByKey!710 lt!591080 (_1!11800 (tuple2!23579 lt!591003 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!591003 zeroValue!1279))))))

(assert (=> d!143635 (= lt!591079 (lemmaContainsTupThenGetReturnValue!360 lt!591080 (_1!11800 (tuple2!23579 lt!591003 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!591003 zeroValue!1279))))))

(assert (=> d!143635 (= lt!591080 (insertStrictlySorted!489 (toList!10637 lt!591008) (_1!11800 (tuple2!23579 lt!591003 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!591003 zeroValue!1279))))))

(assert (=> d!143635 (= (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279)) lt!591077)))

(declare-fun b!1328433 () Bool)

(declare-fun res!881246 () Bool)

(assert (=> b!1328433 (=> (not res!881246) (not e!757250))))

(assert (=> b!1328433 (= res!881246 (= (getValueByKey!710 (toList!10637 lt!591077) (_1!11800 (tuple2!23579 lt!591003 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!591003 zeroValue!1279)))))))

(declare-fun b!1328434 () Bool)

(assert (=> b!1328434 (= e!757250 (contains!8809 (toList!10637 lt!591077) (tuple2!23579 lt!591003 zeroValue!1279)))))

(assert (= (and d!143635 res!881247) b!1328433))

(assert (= (and b!1328433 res!881246) b!1328434))

(declare-fun m!1217941 () Bool)

(assert (=> d!143635 m!1217941))

(declare-fun m!1217943 () Bool)

(assert (=> d!143635 m!1217943))

(declare-fun m!1217945 () Bool)

(assert (=> d!143635 m!1217945))

(declare-fun m!1217947 () Bool)

(assert (=> d!143635 m!1217947))

(declare-fun m!1217949 () Bool)

(assert (=> b!1328433 m!1217949))

(declare-fun m!1217951 () Bool)

(assert (=> b!1328434 m!1217951))

(assert (=> b!1328344 d!143635))

(declare-fun d!143637 () Bool)

(assert (=> d!143637 (= (apply!1040 (+!4679 lt!591012 (tuple2!23579 lt!591018 zeroValue!1279)) lt!591011) (apply!1040 lt!591012 lt!591011))))

(declare-fun lt!591083 () Unit!43660)

(declare-fun choose!1955 (ListLongMap!21243 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43660)

(assert (=> d!143637 (= lt!591083 (choose!1955 lt!591012 lt!591018 zeroValue!1279 lt!591011))))

(declare-fun e!757253 () Bool)

(assert (=> d!143637 e!757253))

(declare-fun res!881250 () Bool)

(assert (=> d!143637 (=> (not res!881250) (not e!757253))))

(assert (=> d!143637 (= res!881250 (contains!8807 lt!591012 lt!591011))))

(assert (=> d!143637 (= (addApplyDifferent!569 lt!591012 lt!591018 zeroValue!1279 lt!591011) lt!591083)))

(declare-fun b!1328438 () Bool)

(assert (=> b!1328438 (= e!757253 (not (= lt!591011 lt!591018)))))

(assert (= (and d!143637 res!881250) b!1328438))

(declare-fun m!1217953 () Bool)

(assert (=> d!143637 m!1217953))

(declare-fun m!1217955 () Bool)

(assert (=> d!143637 m!1217955))

(assert (=> d!143637 m!1217809))

(assert (=> d!143637 m!1217801))

(assert (=> d!143637 m!1217809))

(assert (=> d!143637 m!1217811))

(assert (=> b!1328344 d!143637))

(declare-fun d!143639 () Bool)

(declare-fun e!757255 () Bool)

(assert (=> d!143639 e!757255))

(declare-fun res!881251 () Bool)

(assert (=> d!143639 (=> res!881251 e!757255)))

(declare-fun lt!591084 () Bool)

(assert (=> d!143639 (= res!881251 (not lt!591084))))

(declare-fun lt!591085 () Bool)

(assert (=> d!143639 (= lt!591084 lt!591085)))

(declare-fun lt!591087 () Unit!43660)

(declare-fun e!757254 () Unit!43660)

(assert (=> d!143639 (= lt!591087 e!757254)))

(declare-fun c!126263 () Bool)

(assert (=> d!143639 (= c!126263 lt!591085)))

(assert (=> d!143639 (= lt!591085 (containsKey!736 (toList!10637 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279))) lt!591015))))

(assert (=> d!143639 (= (contains!8807 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279)) lt!591015) lt!591084)))

(declare-fun b!1328439 () Bool)

(declare-fun lt!591086 () Unit!43660)

(assert (=> b!1328439 (= e!757254 lt!591086)))

(assert (=> b!1328439 (= lt!591086 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279))) lt!591015))))

(assert (=> b!1328439 (isDefined!519 (getValueByKey!710 (toList!10637 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279))) lt!591015))))

(declare-fun b!1328440 () Bool)

(declare-fun Unit!43666 () Unit!43660)

(assert (=> b!1328440 (= e!757254 Unit!43666)))

(declare-fun b!1328441 () Bool)

(assert (=> b!1328441 (= e!757255 (isDefined!519 (getValueByKey!710 (toList!10637 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279))) lt!591015)))))

(assert (= (and d!143639 c!126263) b!1328439))

(assert (= (and d!143639 (not c!126263)) b!1328440))

(assert (= (and d!143639 (not res!881251)) b!1328441))

(declare-fun m!1217957 () Bool)

(assert (=> d!143639 m!1217957))

(declare-fun m!1217959 () Bool)

(assert (=> b!1328439 m!1217959))

(declare-fun m!1217961 () Bool)

(assert (=> b!1328439 m!1217961))

(assert (=> b!1328439 m!1217961))

(declare-fun m!1217963 () Bool)

(assert (=> b!1328439 m!1217963))

(assert (=> b!1328441 m!1217961))

(assert (=> b!1328441 m!1217961))

(assert (=> b!1328441 m!1217963))

(assert (=> b!1328344 d!143639))

(declare-fun d!143641 () Bool)

(assert (=> d!143641 (= (apply!1040 (+!4679 lt!591010 (tuple2!23579 lt!590999 minValue!1279)) lt!591009) (apply!1040 lt!591010 lt!591009))))

(declare-fun lt!591088 () Unit!43660)

(assert (=> d!143641 (= lt!591088 (choose!1955 lt!591010 lt!590999 minValue!1279 lt!591009))))

(declare-fun e!757256 () Bool)

(assert (=> d!143641 e!757256))

(declare-fun res!881252 () Bool)

(assert (=> d!143641 (=> (not res!881252) (not e!757256))))

(assert (=> d!143641 (= res!881252 (contains!8807 lt!591010 lt!591009))))

(assert (=> d!143641 (= (addApplyDifferent!569 lt!591010 lt!590999 minValue!1279 lt!591009) lt!591088)))

(declare-fun b!1328442 () Bool)

(assert (=> b!1328442 (= e!757256 (not (= lt!591009 lt!590999)))))

(assert (= (and d!143641 res!881252) b!1328442))

(declare-fun m!1217965 () Bool)

(assert (=> d!143641 m!1217965))

(declare-fun m!1217967 () Bool)

(assert (=> d!143641 m!1217967))

(assert (=> d!143641 m!1217797))

(assert (=> d!143641 m!1217819))

(assert (=> d!143641 m!1217797))

(assert (=> d!143641 m!1217813))

(assert (=> b!1328344 d!143641))

(declare-fun d!143643 () Bool)

(assert (=> d!143643 (contains!8807 (+!4679 lt!591008 (tuple2!23579 lt!591003 zeroValue!1279)) lt!591015)))

(declare-fun lt!591091 () Unit!43660)

(declare-fun choose!1956 (ListLongMap!21243 (_ BitVec 64) V!53577 (_ BitVec 64)) Unit!43660)

(assert (=> d!143643 (= lt!591091 (choose!1956 lt!591008 lt!591003 zeroValue!1279 lt!591015))))

(assert (=> d!143643 (contains!8807 lt!591008 lt!591015)))

(assert (=> d!143643 (= (addStillContains!1171 lt!591008 lt!591003 zeroValue!1279 lt!591015) lt!591091)))

(declare-fun bs!37975 () Bool)

(assert (= bs!37975 d!143643))

(assert (=> bs!37975 m!1217805))

(assert (=> bs!37975 m!1217805))

(assert (=> bs!37975 m!1217807))

(declare-fun m!1217969 () Bool)

(assert (=> bs!37975 m!1217969))

(declare-fun m!1217971 () Bool)

(assert (=> bs!37975 m!1217971))

(assert (=> b!1328344 d!143643))

(declare-fun d!143645 () Bool)

(assert (=> d!143645 (= (apply!1040 (+!4679 lt!591006 (tuple2!23579 lt!591013 minValue!1279)) lt!591020) (apply!1040 lt!591006 lt!591020))))

(declare-fun lt!591092 () Unit!43660)

(assert (=> d!143645 (= lt!591092 (choose!1955 lt!591006 lt!591013 minValue!1279 lt!591020))))

(declare-fun e!757257 () Bool)

(assert (=> d!143645 e!757257))

(declare-fun res!881253 () Bool)

(assert (=> d!143645 (=> (not res!881253) (not e!757257))))

(assert (=> d!143645 (= res!881253 (contains!8807 lt!591006 lt!591020))))

(assert (=> d!143645 (= (addApplyDifferent!569 lt!591006 lt!591013 minValue!1279 lt!591020) lt!591092)))

(declare-fun b!1328444 () Bool)

(assert (=> b!1328444 (= e!757257 (not (= lt!591020 lt!591013)))))

(assert (= (and d!143645 res!881253) b!1328444))

(declare-fun m!1217973 () Bool)

(assert (=> d!143645 m!1217973))

(declare-fun m!1217975 () Bool)

(assert (=> d!143645 m!1217975))

(assert (=> d!143645 m!1217815))

(assert (=> d!143645 m!1217823))

(assert (=> d!143645 m!1217815))

(assert (=> d!143645 m!1217817))

(assert (=> b!1328344 d!143645))

(declare-fun d!143647 () Bool)

(assert (=> d!143647 (= (apply!1040 lt!591012 lt!591011) (get!21858 (getValueByKey!710 (toList!10637 lt!591012) lt!591011)))))

(declare-fun bs!37976 () Bool)

(assert (= bs!37976 d!143647))

(declare-fun m!1217977 () Bool)

(assert (=> bs!37976 m!1217977))

(assert (=> bs!37976 m!1217977))

(declare-fun m!1217979 () Bool)

(assert (=> bs!37976 m!1217979))

(assert (=> b!1328344 d!143647))

(declare-fun d!143649 () Bool)

(assert (=> d!143649 (= (apply!1040 (+!4679 lt!591010 (tuple2!23579 lt!590999 minValue!1279)) lt!591009) (get!21858 (getValueByKey!710 (toList!10637 (+!4679 lt!591010 (tuple2!23579 lt!590999 minValue!1279))) lt!591009)))))

(declare-fun bs!37977 () Bool)

(assert (= bs!37977 d!143649))

(declare-fun m!1217981 () Bool)

(assert (=> bs!37977 m!1217981))

(assert (=> bs!37977 m!1217981))

(declare-fun m!1217983 () Bool)

(assert (=> bs!37977 m!1217983))

(assert (=> b!1328344 d!143649))

(declare-fun d!143651 () Bool)

(declare-fun e!757258 () Bool)

(assert (=> d!143651 e!757258))

(declare-fun res!881255 () Bool)

(assert (=> d!143651 (=> (not res!881255) (not e!757258))))

(declare-fun lt!591093 () ListLongMap!21243)

(assert (=> d!143651 (= res!881255 (contains!8807 lt!591093 (_1!11800 (tuple2!23579 lt!591013 minValue!1279))))))

(declare-fun lt!591096 () List!30730)

(assert (=> d!143651 (= lt!591093 (ListLongMap!21244 lt!591096))))

(declare-fun lt!591094 () Unit!43660)

(declare-fun lt!591095 () Unit!43660)

(assert (=> d!143651 (= lt!591094 lt!591095)))

(assert (=> d!143651 (= (getValueByKey!710 lt!591096 (_1!11800 (tuple2!23579 lt!591013 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!591013 minValue!1279))))))

(assert (=> d!143651 (= lt!591095 (lemmaContainsTupThenGetReturnValue!360 lt!591096 (_1!11800 (tuple2!23579 lt!591013 minValue!1279)) (_2!11800 (tuple2!23579 lt!591013 minValue!1279))))))

(assert (=> d!143651 (= lt!591096 (insertStrictlySorted!489 (toList!10637 lt!591006) (_1!11800 (tuple2!23579 lt!591013 minValue!1279)) (_2!11800 (tuple2!23579 lt!591013 minValue!1279))))))

(assert (=> d!143651 (= (+!4679 lt!591006 (tuple2!23579 lt!591013 minValue!1279)) lt!591093)))

(declare-fun b!1328445 () Bool)

(declare-fun res!881254 () Bool)

(assert (=> b!1328445 (=> (not res!881254) (not e!757258))))

(assert (=> b!1328445 (= res!881254 (= (getValueByKey!710 (toList!10637 lt!591093) (_1!11800 (tuple2!23579 lt!591013 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!591013 minValue!1279)))))))

(declare-fun b!1328446 () Bool)

(assert (=> b!1328446 (= e!757258 (contains!8809 (toList!10637 lt!591093) (tuple2!23579 lt!591013 minValue!1279)))))

(assert (= (and d!143651 res!881255) b!1328445))

(assert (= (and b!1328445 res!881254) b!1328446))

(declare-fun m!1217985 () Bool)

(assert (=> d!143651 m!1217985))

(declare-fun m!1217987 () Bool)

(assert (=> d!143651 m!1217987))

(declare-fun m!1217989 () Bool)

(assert (=> d!143651 m!1217989))

(declare-fun m!1217991 () Bool)

(assert (=> d!143651 m!1217991))

(declare-fun m!1217993 () Bool)

(assert (=> b!1328445 m!1217993))

(declare-fun m!1217995 () Bool)

(assert (=> b!1328446 m!1217995))

(assert (=> b!1328344 d!143651))

(declare-fun d!143653 () Bool)

(assert (=> d!143653 (= (apply!1040 lt!591010 lt!591009) (get!21858 (getValueByKey!710 (toList!10637 lt!591010) lt!591009)))))

(declare-fun bs!37978 () Bool)

(assert (= bs!37978 d!143653))

(declare-fun m!1217997 () Bool)

(assert (=> bs!37978 m!1217997))

(assert (=> bs!37978 m!1217997))

(declare-fun m!1217999 () Bool)

(assert (=> bs!37978 m!1217999))

(assert (=> b!1328344 d!143653))

(declare-fun d!143655 () Bool)

(assert (=> d!143655 (= (apply!1040 (+!4679 lt!591006 (tuple2!23579 lt!591013 minValue!1279)) lt!591020) (get!21858 (getValueByKey!710 (toList!10637 (+!4679 lt!591006 (tuple2!23579 lt!591013 minValue!1279))) lt!591020)))))

(declare-fun bs!37979 () Bool)

(assert (= bs!37979 d!143655))

(declare-fun m!1218001 () Bool)

(assert (=> bs!37979 m!1218001))

(assert (=> bs!37979 m!1218001))

(declare-fun m!1218003 () Bool)

(assert (=> bs!37979 m!1218003))

(assert (=> b!1328344 d!143655))

(declare-fun d!143657 () Bool)

(assert (=> d!143657 (= (apply!1040 lt!591006 lt!591020) (get!21858 (getValueByKey!710 (toList!10637 lt!591006) lt!591020)))))

(declare-fun bs!37980 () Bool)

(assert (= bs!37980 d!143657))

(declare-fun m!1218005 () Bool)

(assert (=> bs!37980 m!1218005))

(assert (=> bs!37980 m!1218005))

(declare-fun m!1218007 () Bool)

(assert (=> bs!37980 m!1218007))

(assert (=> b!1328344 d!143657))

(declare-fun d!143659 () Bool)

(assert (=> d!143659 (= (apply!1040 (+!4679 lt!591012 (tuple2!23579 lt!591018 zeroValue!1279)) lt!591011) (get!21858 (getValueByKey!710 (toList!10637 (+!4679 lt!591012 (tuple2!23579 lt!591018 zeroValue!1279))) lt!591011)))))

(declare-fun bs!37981 () Bool)

(assert (= bs!37981 d!143659))

(declare-fun m!1218009 () Bool)

(assert (=> bs!37981 m!1218009))

(assert (=> bs!37981 m!1218009))

(declare-fun m!1218011 () Bool)

(assert (=> bs!37981 m!1218011))

(assert (=> b!1328344 d!143659))

(declare-fun d!143661 () Bool)

(declare-fun e!757259 () Bool)

(assert (=> d!143661 e!757259))

(declare-fun res!881257 () Bool)

(assert (=> d!143661 (=> (not res!881257) (not e!757259))))

(declare-fun lt!591097 () ListLongMap!21243)

(assert (=> d!143661 (= res!881257 (contains!8807 lt!591097 (_1!11800 (tuple2!23579 lt!590999 minValue!1279))))))

(declare-fun lt!591100 () List!30730)

(assert (=> d!143661 (= lt!591097 (ListLongMap!21244 lt!591100))))

(declare-fun lt!591098 () Unit!43660)

(declare-fun lt!591099 () Unit!43660)

(assert (=> d!143661 (= lt!591098 lt!591099)))

(assert (=> d!143661 (= (getValueByKey!710 lt!591100 (_1!11800 (tuple2!23579 lt!590999 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590999 minValue!1279))))))

(assert (=> d!143661 (= lt!591099 (lemmaContainsTupThenGetReturnValue!360 lt!591100 (_1!11800 (tuple2!23579 lt!590999 minValue!1279)) (_2!11800 (tuple2!23579 lt!590999 minValue!1279))))))

(assert (=> d!143661 (= lt!591100 (insertStrictlySorted!489 (toList!10637 lt!591010) (_1!11800 (tuple2!23579 lt!590999 minValue!1279)) (_2!11800 (tuple2!23579 lt!590999 minValue!1279))))))

(assert (=> d!143661 (= (+!4679 lt!591010 (tuple2!23579 lt!590999 minValue!1279)) lt!591097)))

(declare-fun b!1328447 () Bool)

(declare-fun res!881256 () Bool)

(assert (=> b!1328447 (=> (not res!881256) (not e!757259))))

(assert (=> b!1328447 (= res!881256 (= (getValueByKey!710 (toList!10637 lt!591097) (_1!11800 (tuple2!23579 lt!590999 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590999 minValue!1279)))))))

(declare-fun b!1328448 () Bool)

(assert (=> b!1328448 (= e!757259 (contains!8809 (toList!10637 lt!591097) (tuple2!23579 lt!590999 minValue!1279)))))

(assert (= (and d!143661 res!881257) b!1328447))

(assert (= (and b!1328447 res!881256) b!1328448))

(declare-fun m!1218013 () Bool)

(assert (=> d!143661 m!1218013))

(declare-fun m!1218015 () Bool)

(assert (=> d!143661 m!1218015))

(declare-fun m!1218017 () Bool)

(assert (=> d!143661 m!1218017))

(declare-fun m!1218019 () Bool)

(assert (=> d!143661 m!1218019))

(declare-fun m!1218021 () Bool)

(assert (=> b!1328447 m!1218021))

(declare-fun m!1218023 () Bool)

(assert (=> b!1328448 m!1218023))

(assert (=> b!1328344 d!143661))

(declare-fun b!1328450 () Bool)

(declare-fun lt!591105 () Unit!43660)

(declare-fun lt!591102 () Unit!43660)

(assert (=> b!1328450 (= lt!591105 lt!591102)))

(declare-fun lt!591106 () (_ BitVec 64))

(declare-fun lt!591103 () (_ BitVec 64))

(declare-fun lt!591101 () ListLongMap!21243)

(declare-fun lt!591107 () V!53577)

(assert (=> b!1328450 (not (contains!8807 (+!4679 lt!591101 (tuple2!23579 lt!591106 lt!591107)) lt!591103))))

(assert (=> b!1328450 (= lt!591102 (addStillNotContains!496 lt!591101 lt!591106 lt!591107 lt!591103))))

(assert (=> b!1328450 (= lt!591103 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1328450 (= lt!591107 (get!21857 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1328450 (= lt!591106 (select (arr!43324 _keys!1609) from!2000))))

(declare-fun call!64874 () ListLongMap!21243)

(assert (=> b!1328450 (= lt!591101 call!64874)))

(declare-fun e!757260 () ListLongMap!21243)

(assert (=> b!1328450 (= e!757260 (+!4679 call!64874 (tuple2!23579 (select (arr!43324 _keys!1609) from!2000) (get!21857 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1328451 () Bool)

(declare-fun e!757265 () Bool)

(declare-fun lt!591104 () ListLongMap!21243)

(assert (=> b!1328451 (= e!757265 (isEmpty!1083 lt!591104))))

(declare-fun b!1328452 () Bool)

(declare-fun e!757263 () ListLongMap!21243)

(assert (=> b!1328452 (= e!757263 (ListLongMap!21244 Nil!30727))))

(declare-fun b!1328453 () Bool)

(declare-fun e!757262 () Bool)

(declare-fun e!757261 () Bool)

(assert (=> b!1328453 (= e!757262 e!757261)))

(assert (=> b!1328453 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43875 _keys!1609)))))

(declare-fun res!881261 () Bool)

(assert (=> b!1328453 (= res!881261 (contains!8807 lt!591104 (select (arr!43324 _keys!1609) from!2000)))))

(assert (=> b!1328453 (=> (not res!881261) (not e!757261))))

(declare-fun b!1328454 () Bool)

(assert (=> b!1328454 (= e!757260 call!64874)))

(declare-fun b!1328455 () Bool)

(declare-fun e!757264 () Bool)

(assert (=> b!1328455 (= e!757264 e!757262)))

(declare-fun c!126265 () Bool)

(declare-fun e!757266 () Bool)

(assert (=> b!1328455 (= c!126265 e!757266)))

(declare-fun res!881259 () Bool)

(assert (=> b!1328455 (=> (not res!881259) (not e!757266))))

(assert (=> b!1328455 (= res!881259 (bvslt from!2000 (size!43875 _keys!1609)))))

(declare-fun b!1328449 () Bool)

(assert (=> b!1328449 (= e!757266 (validKeyInArray!0 (select (arr!43324 _keys!1609) from!2000)))))

(assert (=> b!1328449 (bvsge from!2000 #b00000000000000000000000000000000)))

(declare-fun d!143663 () Bool)

(assert (=> d!143663 e!757264))

(declare-fun res!881260 () Bool)

(assert (=> d!143663 (=> (not res!881260) (not e!757264))))

(assert (=> d!143663 (= res!881260 (not (contains!8807 lt!591104 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143663 (= lt!591104 e!757263)))

(declare-fun c!126267 () Bool)

(assert (=> d!143663 (= c!126267 (bvsge from!2000 (size!43875 _keys!1609)))))

(assert (=> d!143663 (validMask!0 mask!2019)))

(assert (=> d!143663 (= (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!591104)))

(declare-fun bm!64871 () Bool)

(assert (=> bm!64871 (= call!64874 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1328456 () Bool)

(assert (=> b!1328456 (= e!757262 e!757265)))

(declare-fun c!126264 () Bool)

(assert (=> b!1328456 (= c!126264 (bvslt from!2000 (size!43875 _keys!1609)))))

(declare-fun b!1328457 () Bool)

(assert (=> b!1328457 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43875 _keys!1609)))))

(assert (=> b!1328457 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43876 _values!1337)))))

(assert (=> b!1328457 (= e!757261 (= (apply!1040 lt!591104 (select (arr!43324 _keys!1609) from!2000)) (get!21857 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328458 () Bool)

(assert (=> b!1328458 (= e!757265 (= lt!591104 (getCurrentListMapNoExtraKeys!6323 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1328459 () Bool)

(assert (=> b!1328459 (= e!757263 e!757260)))

(declare-fun c!126266 () Bool)

(assert (=> b!1328459 (= c!126266 (validKeyInArray!0 (select (arr!43324 _keys!1609) from!2000)))))

(declare-fun b!1328460 () Bool)

(declare-fun res!881258 () Bool)

(assert (=> b!1328460 (=> (not res!881258) (not e!757264))))

(assert (=> b!1328460 (= res!881258 (not (contains!8807 lt!591104 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143663 c!126267) b!1328452))

(assert (= (and d!143663 (not c!126267)) b!1328459))

(assert (= (and b!1328459 c!126266) b!1328450))

(assert (= (and b!1328459 (not c!126266)) b!1328454))

(assert (= (or b!1328450 b!1328454) bm!64871))

(assert (= (and d!143663 res!881260) b!1328460))

(assert (= (and b!1328460 res!881258) b!1328455))

(assert (= (and b!1328455 res!881259) b!1328449))

(assert (= (and b!1328455 c!126265) b!1328453))

(assert (= (and b!1328455 (not c!126265)) b!1328456))

(assert (= (and b!1328453 res!881261) b!1328457))

(assert (= (and b!1328456 c!126264) b!1328458))

(assert (= (and b!1328456 (not c!126264)) b!1328451))

(declare-fun b_lambda!23837 () Bool)

(assert (=> (not b_lambda!23837) (not b!1328450)))

(assert (=> b!1328450 t!44729))

(declare-fun b_and!49189 () Bool)

(assert (= b_and!49187 (and (=> t!44729 result!24669) b_and!49189)))

(declare-fun b_lambda!23839 () Bool)

(assert (=> (not b_lambda!23839) (not b!1328457)))

(assert (=> b!1328457 t!44729))

(declare-fun b_and!49191 () Bool)

(assert (= b_and!49189 (and (=> t!44729 result!24669) b_and!49191)))

(assert (=> b!1328457 m!1217627))

(assert (=> b!1328457 m!1217787))

(assert (=> b!1328457 m!1217709))

(assert (=> b!1328457 m!1217789))

(assert (=> b!1328457 m!1217787))

(assert (=> b!1328457 m!1217627))

(declare-fun m!1218025 () Bool)

(assert (=> b!1328457 m!1218025))

(assert (=> b!1328457 m!1217709))

(assert (=> b!1328459 m!1217627))

(assert (=> b!1328459 m!1217627))

(assert (=> b!1328459 m!1217629))

(declare-fun m!1218027 () Bool)

(assert (=> bm!64871 m!1218027))

(assert (=> b!1328453 m!1217627))

(assert (=> b!1328453 m!1217627))

(declare-fun m!1218029 () Bool)

(assert (=> b!1328453 m!1218029))

(declare-fun m!1218031 () Bool)

(assert (=> b!1328460 m!1218031))

(assert (=> b!1328449 m!1217627))

(assert (=> b!1328449 m!1217627))

(assert (=> b!1328449 m!1217629))

(declare-fun m!1218033 () Bool)

(assert (=> b!1328451 m!1218033))

(declare-fun m!1218035 () Bool)

(assert (=> d!143663 m!1218035))

(assert (=> d!143663 m!1217637))

(assert (=> b!1328458 m!1218027))

(declare-fun m!1218037 () Bool)

(assert (=> b!1328450 m!1218037))

(declare-fun m!1218039 () Bool)

(assert (=> b!1328450 m!1218039))

(assert (=> b!1328450 m!1217627))

(assert (=> b!1328450 m!1217787))

(assert (=> b!1328450 m!1217709))

(assert (=> b!1328450 m!1217789))

(assert (=> b!1328450 m!1217787))

(assert (=> b!1328450 m!1218039))

(declare-fun m!1218041 () Bool)

(assert (=> b!1328450 m!1218041))

(assert (=> b!1328450 m!1217709))

(declare-fun m!1218043 () Bool)

(assert (=> b!1328450 m!1218043))

(assert (=> b!1328344 d!143663))

(declare-fun d!143665 () Bool)

(declare-fun res!881262 () Bool)

(declare-fun e!757267 () Bool)

(assert (=> d!143665 (=> res!881262 e!757267)))

(assert (=> d!143665 (= res!881262 (and ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143665 (= (containsKey!736 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!757267)))

(declare-fun b!1328461 () Bool)

(declare-fun e!757268 () Bool)

(assert (=> b!1328461 (= e!757267 e!757268)))

(declare-fun res!881263 () Bool)

(assert (=> b!1328461 (=> (not res!881263) (not e!757268))))

(assert (=> b!1328461 (= res!881263 (and (or (not ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) (bvsle (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)) ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (bvslt (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1328462 () Bool)

(assert (=> b!1328462 (= e!757268 (containsKey!736 (t!44726 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!143665 (not res!881262)) b!1328461))

(assert (= (and b!1328461 res!881263) b!1328462))

(declare-fun m!1218045 () Bool)

(assert (=> b!1328462 m!1218045))

(assert (=> d!143603 d!143665))

(declare-fun d!143667 () Bool)

(declare-fun isEmpty!1084 (Option!761) Bool)

(assert (=> d!143667 (= (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)) (not (isEmpty!1084 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37982 () Bool)

(assert (= bs!37982 d!143667))

(assert (=> bs!37982 m!1217697))

(declare-fun m!1218047 () Bool)

(assert (=> bs!37982 m!1218047))

(assert (=> b!1328228 d!143667))

(declare-fun b!1328474 () Bool)

(declare-fun e!757274 () Option!761)

(assert (=> b!1328474 (= e!757274 None!759)))

(declare-fun b!1328473 () Bool)

(assert (=> b!1328473 (= e!757274 (getValueByKey!710 (t!44726 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) k0!1164))))

(declare-fun c!126272 () Bool)

(declare-fun d!143669 () Bool)

(assert (=> d!143669 (= c!126272 (and ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(declare-fun e!757273 () Option!761)

(assert (=> d!143669 (= (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) e!757273)))

(declare-fun b!1328471 () Bool)

(assert (=> b!1328471 (= e!757273 (Some!760 (_2!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))))))

(declare-fun b!1328472 () Bool)

(assert (=> b!1328472 (= e!757273 e!757274)))

(declare-fun c!126273 () Bool)

(assert (=> b!1328472 (= c!126273 (and ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (not (= (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164))))))

(assert (= (and d!143669 c!126272) b!1328471))

(assert (= (and d!143669 (not c!126272)) b!1328472))

(assert (= (and b!1328472 c!126273) b!1328473))

(assert (= (and b!1328472 (not c!126273)) b!1328474))

(declare-fun m!1218049 () Bool)

(assert (=> b!1328473 m!1218049))

(assert (=> b!1328228 d!143669))

(declare-fun d!143671 () Bool)

(declare-fun e!757275 () Bool)

(assert (=> d!143671 e!757275))

(declare-fun res!881265 () Bool)

(assert (=> d!143671 (=> (not res!881265) (not e!757275))))

(declare-fun lt!591108 () ListLongMap!21243)

(assert (=> d!143671 (= res!881265 (contains!8807 lt!591108 (_1!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!591111 () List!30730)

(assert (=> d!143671 (= lt!591108 (ListLongMap!21244 lt!591111))))

(declare-fun lt!591109 () Unit!43660)

(declare-fun lt!591110 () Unit!43660)

(assert (=> d!143671 (= lt!591109 lt!591110)))

(assert (=> d!143671 (= (getValueByKey!710 lt!591111 (_1!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!760 (_2!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143671 (= lt!591110 (lemmaContainsTupThenGetReturnValue!360 lt!591111 (_1!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143671 (= lt!591111 (insertStrictlySorted!489 (toList!10637 (ite c!126224 call!64854 (ite c!126225 call!64853 call!64850))) (_1!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143671 (= (+!4679 (ite c!126224 call!64854 (ite c!126225 call!64853 call!64850)) (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!591108)))

(declare-fun b!1328475 () Bool)

(declare-fun res!881264 () Bool)

(assert (=> b!1328475 (=> (not res!881264) (not e!757275))))

(assert (=> b!1328475 (= res!881264 (= (getValueByKey!710 (toList!10637 lt!591108) (_1!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!760 (_2!11800 (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1328476 () Bool)

(assert (=> b!1328476 (= e!757275 (contains!8809 (toList!10637 lt!591108) (ite (or c!126224 c!126225) (tuple2!23579 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143671 res!881265) b!1328475))

(assert (= (and b!1328475 res!881264) b!1328476))

(declare-fun m!1218051 () Bool)

(assert (=> d!143671 m!1218051))

(declare-fun m!1218053 () Bool)

(assert (=> d!143671 m!1218053))

(declare-fun m!1218055 () Bool)

(assert (=> d!143671 m!1218055))

(declare-fun m!1218057 () Bool)

(assert (=> d!143671 m!1218057))

(declare-fun m!1218059 () Bool)

(assert (=> b!1328475 m!1218059))

(declare-fun m!1218061 () Bool)

(assert (=> b!1328476 m!1218061))

(assert (=> bm!64849 d!143671))

(assert (=> d!143605 d!143593))

(declare-fun d!143673 () Bool)

(declare-fun e!757277 () Bool)

(assert (=> d!143673 e!757277))

(declare-fun res!881266 () Bool)

(assert (=> d!143673 (=> res!881266 e!757277)))

(declare-fun lt!591112 () Bool)

(assert (=> d!143673 (= res!881266 (not lt!591112))))

(declare-fun lt!591113 () Bool)

(assert (=> d!143673 (= lt!591112 lt!591113)))

(declare-fun lt!591115 () Unit!43660)

(declare-fun e!757276 () Unit!43660)

(assert (=> d!143673 (= lt!591115 e!757276)))

(declare-fun c!126274 () Bool)

(assert (=> d!143673 (= c!126274 lt!591113)))

(assert (=> d!143673 (= lt!591113 (containsKey!736 (toList!10637 lt!591017) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143673 (= (contains!8807 lt!591017 #b0000000000000000000000000000000000000000000000000000000000000000) lt!591112)))

(declare-fun b!1328477 () Bool)

(declare-fun lt!591114 () Unit!43660)

(assert (=> b!1328477 (= e!757276 lt!591114)))

(assert (=> b!1328477 (= lt!591114 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 lt!591017) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1328477 (isDefined!519 (getValueByKey!710 (toList!10637 lt!591017) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328478 () Bool)

(declare-fun Unit!43667 () Unit!43660)

(assert (=> b!1328478 (= e!757276 Unit!43667)))

(declare-fun b!1328479 () Bool)

(assert (=> b!1328479 (= e!757277 (isDefined!519 (getValueByKey!710 (toList!10637 lt!591017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143673 c!126274) b!1328477))

(assert (= (and d!143673 (not c!126274)) b!1328478))

(assert (= (and d!143673 (not res!881266)) b!1328479))

(declare-fun m!1218063 () Bool)

(assert (=> d!143673 m!1218063))

(declare-fun m!1218065 () Bool)

(assert (=> b!1328477 m!1218065))

(assert (=> b!1328477 m!1217879))

(assert (=> b!1328477 m!1217879))

(declare-fun m!1218067 () Bool)

(assert (=> b!1328477 m!1218067))

(assert (=> b!1328479 m!1217879))

(assert (=> b!1328479 m!1217879))

(assert (=> b!1328479 m!1218067))

(assert (=> bm!64861 d!143673))

(declare-fun d!143675 () Bool)

(assert (=> d!143675 (= (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (and (not (= (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1328277 d!143675))

(declare-fun d!143677 () Bool)

(declare-fun e!757278 () Bool)

(assert (=> d!143677 e!757278))

(declare-fun res!881268 () Bool)

(assert (=> d!143677 (=> (not res!881268) (not e!757278))))

(declare-fun lt!591116 () ListLongMap!21243)

(assert (=> d!143677 (= res!881268 (contains!8807 lt!591116 (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!591119 () List!30730)

(assert (=> d!143677 (= lt!591116 (ListLongMap!21244 lt!591119))))

(declare-fun lt!591117 () Unit!43660)

(declare-fun lt!591118 () Unit!43660)

(assert (=> d!143677 (= lt!591117 lt!591118)))

(assert (=> d!143677 (= (getValueByKey!710 lt!591119 (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143677 (= lt!591118 (lemmaContainsTupThenGetReturnValue!360 lt!591119 (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143677 (= lt!591119 (insertStrictlySorted!489 (toList!10637 call!64852) (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143677 (= (+!4679 call!64852 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!591116)))

(declare-fun b!1328480 () Bool)

(declare-fun res!881267 () Bool)

(assert (=> b!1328480 (=> (not res!881267) (not e!757278))))

(assert (=> b!1328480 (= res!881267 (= (getValueByKey!710 (toList!10637 lt!591116) (_1!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1328481 () Bool)

(assert (=> b!1328481 (= e!757278 (contains!8809 (toList!10637 lt!591116) (tuple2!23579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143677 res!881268) b!1328480))

(assert (= (and b!1328480 res!881267) b!1328481))

(declare-fun m!1218069 () Bool)

(assert (=> d!143677 m!1218069))

(declare-fun m!1218071 () Bool)

(assert (=> d!143677 m!1218071))

(declare-fun m!1218073 () Bool)

(assert (=> d!143677 m!1218073))

(declare-fun m!1218075 () Bool)

(assert (=> d!143677 m!1218075))

(declare-fun m!1218077 () Bool)

(assert (=> b!1328480 m!1218077))

(declare-fun m!1218079 () Bool)

(assert (=> b!1328481 m!1218079))

(assert (=> b!1328290 d!143677))

(declare-fun d!143679 () Bool)

(assert (=> d!143679 (= (apply!1040 (+!4679 lt!590975 (tuple2!23579 lt!590964 minValue!1279)) lt!590974) (apply!1040 lt!590975 lt!590974))))

(declare-fun lt!591120 () Unit!43660)

(assert (=> d!143679 (= lt!591120 (choose!1955 lt!590975 lt!590964 minValue!1279 lt!590974))))

(declare-fun e!757279 () Bool)

(assert (=> d!143679 e!757279))

(declare-fun res!881269 () Bool)

(assert (=> d!143679 (=> (not res!881269) (not e!757279))))

(assert (=> d!143679 (= res!881269 (contains!8807 lt!590975 lt!590974))))

(assert (=> d!143679 (= (addApplyDifferent!569 lt!590975 lt!590964 minValue!1279 lt!590974) lt!591120)))

(declare-fun b!1328482 () Bool)

(assert (=> b!1328482 (= e!757279 (not (= lt!590974 lt!590964)))))

(assert (= (and d!143679 res!881269) b!1328482))

(declare-fun m!1218081 () Bool)

(assert (=> d!143679 m!1218081))

(declare-fun m!1218083 () Bool)

(assert (=> d!143679 m!1218083))

(assert (=> d!143679 m!1217721))

(assert (=> d!143679 m!1217743))

(assert (=> d!143679 m!1217721))

(assert (=> d!143679 m!1217737))

(assert (=> b!1328291 d!143679))

(declare-fun d!143681 () Bool)

(assert (=> d!143681 (= (apply!1040 (+!4679 lt!590971 (tuple2!23579 lt!590978 minValue!1279)) lt!590985) (get!21858 (getValueByKey!710 (toList!10637 (+!4679 lt!590971 (tuple2!23579 lt!590978 minValue!1279))) lt!590985)))))

(declare-fun bs!37983 () Bool)

(assert (= bs!37983 d!143681))

(declare-fun m!1218085 () Bool)

(assert (=> bs!37983 m!1218085))

(assert (=> bs!37983 m!1218085))

(declare-fun m!1218087 () Bool)

(assert (=> bs!37983 m!1218087))

(assert (=> b!1328291 d!143681))

(declare-fun d!143683 () Bool)

(declare-fun e!757280 () Bool)

(assert (=> d!143683 e!757280))

(declare-fun res!881271 () Bool)

(assert (=> d!143683 (=> (not res!881271) (not e!757280))))

(declare-fun lt!591121 () ListLongMap!21243)

(assert (=> d!143683 (= res!881271 (contains!8807 lt!591121 (_1!11800 (tuple2!23579 lt!590968 zeroValue!1279))))))

(declare-fun lt!591124 () List!30730)

(assert (=> d!143683 (= lt!591121 (ListLongMap!21244 lt!591124))))

(declare-fun lt!591122 () Unit!43660)

(declare-fun lt!591123 () Unit!43660)

(assert (=> d!143683 (= lt!591122 lt!591123)))

(assert (=> d!143683 (= (getValueByKey!710 lt!591124 (_1!11800 (tuple2!23579 lt!590968 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590968 zeroValue!1279))))))

(assert (=> d!143683 (= lt!591123 (lemmaContainsTupThenGetReturnValue!360 lt!591124 (_1!11800 (tuple2!23579 lt!590968 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!590968 zeroValue!1279))))))

(assert (=> d!143683 (= lt!591124 (insertStrictlySorted!489 (toList!10637 lt!590973) (_1!11800 (tuple2!23579 lt!590968 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!590968 zeroValue!1279))))))

(assert (=> d!143683 (= (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279)) lt!591121)))

(declare-fun b!1328483 () Bool)

(declare-fun res!881270 () Bool)

(assert (=> b!1328483 (=> (not res!881270) (not e!757280))))

(assert (=> b!1328483 (= res!881270 (= (getValueByKey!710 (toList!10637 lt!591121) (_1!11800 (tuple2!23579 lt!590968 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590968 zeroValue!1279)))))))

(declare-fun b!1328484 () Bool)

(assert (=> b!1328484 (= e!757280 (contains!8809 (toList!10637 lt!591121) (tuple2!23579 lt!590968 zeroValue!1279)))))

(assert (= (and d!143683 res!881271) b!1328483))

(assert (= (and b!1328483 res!881270) b!1328484))

(declare-fun m!1218089 () Bool)

(assert (=> d!143683 m!1218089))

(declare-fun m!1218091 () Bool)

(assert (=> d!143683 m!1218091))

(declare-fun m!1218093 () Bool)

(assert (=> d!143683 m!1218093))

(declare-fun m!1218095 () Bool)

(assert (=> d!143683 m!1218095))

(declare-fun m!1218097 () Bool)

(assert (=> b!1328483 m!1218097))

(declare-fun m!1218099 () Bool)

(assert (=> b!1328484 m!1218099))

(assert (=> b!1328291 d!143683))

(declare-fun d!143685 () Bool)

(declare-fun e!757281 () Bool)

(assert (=> d!143685 e!757281))

(declare-fun res!881273 () Bool)

(assert (=> d!143685 (=> (not res!881273) (not e!757281))))

(declare-fun lt!591125 () ListLongMap!21243)

(assert (=> d!143685 (= res!881273 (contains!8807 lt!591125 (_1!11800 (tuple2!23579 lt!590978 minValue!1279))))))

(declare-fun lt!591128 () List!30730)

(assert (=> d!143685 (= lt!591125 (ListLongMap!21244 lt!591128))))

(declare-fun lt!591126 () Unit!43660)

(declare-fun lt!591127 () Unit!43660)

(assert (=> d!143685 (= lt!591126 lt!591127)))

(assert (=> d!143685 (= (getValueByKey!710 lt!591128 (_1!11800 (tuple2!23579 lt!590978 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590978 minValue!1279))))))

(assert (=> d!143685 (= lt!591127 (lemmaContainsTupThenGetReturnValue!360 lt!591128 (_1!11800 (tuple2!23579 lt!590978 minValue!1279)) (_2!11800 (tuple2!23579 lt!590978 minValue!1279))))))

(assert (=> d!143685 (= lt!591128 (insertStrictlySorted!489 (toList!10637 lt!590971) (_1!11800 (tuple2!23579 lt!590978 minValue!1279)) (_2!11800 (tuple2!23579 lt!590978 minValue!1279))))))

(assert (=> d!143685 (= (+!4679 lt!590971 (tuple2!23579 lt!590978 minValue!1279)) lt!591125)))

(declare-fun b!1328485 () Bool)

(declare-fun res!881272 () Bool)

(assert (=> b!1328485 (=> (not res!881272) (not e!757281))))

(assert (=> b!1328485 (= res!881272 (= (getValueByKey!710 (toList!10637 lt!591125) (_1!11800 (tuple2!23579 lt!590978 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590978 minValue!1279)))))))

(declare-fun b!1328486 () Bool)

(assert (=> b!1328486 (= e!757281 (contains!8809 (toList!10637 lt!591125) (tuple2!23579 lt!590978 minValue!1279)))))

(assert (= (and d!143685 res!881273) b!1328485))

(assert (= (and b!1328485 res!881272) b!1328486))

(declare-fun m!1218101 () Bool)

(assert (=> d!143685 m!1218101))

(declare-fun m!1218103 () Bool)

(assert (=> d!143685 m!1218103))

(declare-fun m!1218105 () Bool)

(assert (=> d!143685 m!1218105))

(declare-fun m!1218107 () Bool)

(assert (=> d!143685 m!1218107))

(declare-fun m!1218109 () Bool)

(assert (=> b!1328485 m!1218109))

(declare-fun m!1218111 () Bool)

(assert (=> b!1328486 m!1218111))

(assert (=> b!1328291 d!143685))

(declare-fun d!143687 () Bool)

(assert (=> d!143687 (= (apply!1040 (+!4679 lt!590977 (tuple2!23579 lt!590983 zeroValue!1279)) lt!590976) (apply!1040 lt!590977 lt!590976))))

(declare-fun lt!591129 () Unit!43660)

(assert (=> d!143687 (= lt!591129 (choose!1955 lt!590977 lt!590983 zeroValue!1279 lt!590976))))

(declare-fun e!757282 () Bool)

(assert (=> d!143687 e!757282))

(declare-fun res!881274 () Bool)

(assert (=> d!143687 (=> (not res!881274) (not e!757282))))

(assert (=> d!143687 (= res!881274 (contains!8807 lt!590977 lt!590976))))

(assert (=> d!143687 (= (addApplyDifferent!569 lt!590977 lt!590983 zeroValue!1279 lt!590976) lt!591129)))

(declare-fun b!1328487 () Bool)

(assert (=> b!1328487 (= e!757282 (not (= lt!590976 lt!590983)))))

(assert (= (and d!143687 res!881274) b!1328487))

(declare-fun m!1218113 () Bool)

(assert (=> d!143687 m!1218113))

(declare-fun m!1218115 () Bool)

(assert (=> d!143687 m!1218115))

(assert (=> d!143687 m!1217733))

(assert (=> d!143687 m!1217725))

(assert (=> d!143687 m!1217733))

(assert (=> d!143687 m!1217735))

(assert (=> b!1328291 d!143687))

(declare-fun d!143689 () Bool)

(assert (=> d!143689 (= (apply!1040 lt!590971 lt!590985) (get!21858 (getValueByKey!710 (toList!10637 lt!590971) lt!590985)))))

(declare-fun bs!37984 () Bool)

(assert (= bs!37984 d!143689))

(declare-fun m!1218117 () Bool)

(assert (=> bs!37984 m!1218117))

(assert (=> bs!37984 m!1218117))

(declare-fun m!1218119 () Bool)

(assert (=> bs!37984 m!1218119))

(assert (=> b!1328291 d!143689))

(declare-fun d!143691 () Bool)

(assert (=> d!143691 (= (apply!1040 (+!4679 lt!590971 (tuple2!23579 lt!590978 minValue!1279)) lt!590985) (apply!1040 lt!590971 lt!590985))))

(declare-fun lt!591130 () Unit!43660)

(assert (=> d!143691 (= lt!591130 (choose!1955 lt!590971 lt!590978 minValue!1279 lt!590985))))

(declare-fun e!757283 () Bool)

(assert (=> d!143691 e!757283))

(declare-fun res!881275 () Bool)

(assert (=> d!143691 (=> (not res!881275) (not e!757283))))

(assert (=> d!143691 (= res!881275 (contains!8807 lt!590971 lt!590985))))

(assert (=> d!143691 (= (addApplyDifferent!569 lt!590971 lt!590978 minValue!1279 lt!590985) lt!591130)))

(declare-fun b!1328488 () Bool)

(assert (=> b!1328488 (= e!757283 (not (= lt!590985 lt!590978)))))

(assert (= (and d!143691 res!881275) b!1328488))

(declare-fun m!1218121 () Bool)

(assert (=> d!143691 m!1218121))

(declare-fun m!1218123 () Bool)

(assert (=> d!143691 m!1218123))

(assert (=> d!143691 m!1217739))

(assert (=> d!143691 m!1217747))

(assert (=> d!143691 m!1217739))

(assert (=> d!143691 m!1217741))

(assert (=> b!1328291 d!143691))

(declare-fun d!143693 () Bool)

(assert (=> d!143693 (contains!8807 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279)) lt!590980)))

(declare-fun lt!591131 () Unit!43660)

(assert (=> d!143693 (= lt!591131 (choose!1956 lt!590973 lt!590968 zeroValue!1279 lt!590980))))

(assert (=> d!143693 (contains!8807 lt!590973 lt!590980)))

(assert (=> d!143693 (= (addStillContains!1171 lt!590973 lt!590968 zeroValue!1279 lt!590980) lt!591131)))

(declare-fun bs!37985 () Bool)

(assert (= bs!37985 d!143693))

(assert (=> bs!37985 m!1217729))

(assert (=> bs!37985 m!1217729))

(assert (=> bs!37985 m!1217731))

(declare-fun m!1218125 () Bool)

(assert (=> bs!37985 m!1218125))

(declare-fun m!1218127 () Bool)

(assert (=> bs!37985 m!1218127))

(assert (=> b!1328291 d!143693))

(declare-fun d!143695 () Bool)

(declare-fun e!757284 () Bool)

(assert (=> d!143695 e!757284))

(declare-fun res!881277 () Bool)

(assert (=> d!143695 (=> (not res!881277) (not e!757284))))

(declare-fun lt!591132 () ListLongMap!21243)

(assert (=> d!143695 (= res!881277 (contains!8807 lt!591132 (_1!11800 (tuple2!23579 lt!590983 zeroValue!1279))))))

(declare-fun lt!591135 () List!30730)

(assert (=> d!143695 (= lt!591132 (ListLongMap!21244 lt!591135))))

(declare-fun lt!591133 () Unit!43660)

(declare-fun lt!591134 () Unit!43660)

(assert (=> d!143695 (= lt!591133 lt!591134)))

(assert (=> d!143695 (= (getValueByKey!710 lt!591135 (_1!11800 (tuple2!23579 lt!590983 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590983 zeroValue!1279))))))

(assert (=> d!143695 (= lt!591134 (lemmaContainsTupThenGetReturnValue!360 lt!591135 (_1!11800 (tuple2!23579 lt!590983 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!590983 zeroValue!1279))))))

(assert (=> d!143695 (= lt!591135 (insertStrictlySorted!489 (toList!10637 lt!590977) (_1!11800 (tuple2!23579 lt!590983 zeroValue!1279)) (_2!11800 (tuple2!23579 lt!590983 zeroValue!1279))))))

(assert (=> d!143695 (= (+!4679 lt!590977 (tuple2!23579 lt!590983 zeroValue!1279)) lt!591132)))

(declare-fun b!1328489 () Bool)

(declare-fun res!881276 () Bool)

(assert (=> b!1328489 (=> (not res!881276) (not e!757284))))

(assert (=> b!1328489 (= res!881276 (= (getValueByKey!710 (toList!10637 lt!591132) (_1!11800 (tuple2!23579 lt!590983 zeroValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590983 zeroValue!1279)))))))

(declare-fun b!1328490 () Bool)

(assert (=> b!1328490 (= e!757284 (contains!8809 (toList!10637 lt!591132) (tuple2!23579 lt!590983 zeroValue!1279)))))

(assert (= (and d!143695 res!881277) b!1328489))

(assert (= (and b!1328489 res!881276) b!1328490))

(declare-fun m!1218129 () Bool)

(assert (=> d!143695 m!1218129))

(declare-fun m!1218131 () Bool)

(assert (=> d!143695 m!1218131))

(declare-fun m!1218133 () Bool)

(assert (=> d!143695 m!1218133))

(declare-fun m!1218135 () Bool)

(assert (=> d!143695 m!1218135))

(declare-fun m!1218137 () Bool)

(assert (=> b!1328489 m!1218137))

(declare-fun m!1218139 () Bool)

(assert (=> b!1328490 m!1218139))

(assert (=> b!1328291 d!143695))

(declare-fun d!143697 () Bool)

(declare-fun e!757285 () Bool)

(assert (=> d!143697 e!757285))

(declare-fun res!881279 () Bool)

(assert (=> d!143697 (=> (not res!881279) (not e!757285))))

(declare-fun lt!591136 () ListLongMap!21243)

(assert (=> d!143697 (= res!881279 (contains!8807 lt!591136 (_1!11800 (tuple2!23579 lt!590964 minValue!1279))))))

(declare-fun lt!591139 () List!30730)

(assert (=> d!143697 (= lt!591136 (ListLongMap!21244 lt!591139))))

(declare-fun lt!591137 () Unit!43660)

(declare-fun lt!591138 () Unit!43660)

(assert (=> d!143697 (= lt!591137 lt!591138)))

(assert (=> d!143697 (= (getValueByKey!710 lt!591139 (_1!11800 (tuple2!23579 lt!590964 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590964 minValue!1279))))))

(assert (=> d!143697 (= lt!591138 (lemmaContainsTupThenGetReturnValue!360 lt!591139 (_1!11800 (tuple2!23579 lt!590964 minValue!1279)) (_2!11800 (tuple2!23579 lt!590964 minValue!1279))))))

(assert (=> d!143697 (= lt!591139 (insertStrictlySorted!489 (toList!10637 lt!590975) (_1!11800 (tuple2!23579 lt!590964 minValue!1279)) (_2!11800 (tuple2!23579 lt!590964 minValue!1279))))))

(assert (=> d!143697 (= (+!4679 lt!590975 (tuple2!23579 lt!590964 minValue!1279)) lt!591136)))

(declare-fun b!1328491 () Bool)

(declare-fun res!881278 () Bool)

(assert (=> b!1328491 (=> (not res!881278) (not e!757285))))

(assert (=> b!1328491 (= res!881278 (= (getValueByKey!710 (toList!10637 lt!591136) (_1!11800 (tuple2!23579 lt!590964 minValue!1279))) (Some!760 (_2!11800 (tuple2!23579 lt!590964 minValue!1279)))))))

(declare-fun b!1328492 () Bool)

(assert (=> b!1328492 (= e!757285 (contains!8809 (toList!10637 lt!591136) (tuple2!23579 lt!590964 minValue!1279)))))

(assert (= (and d!143697 res!881279) b!1328491))

(assert (= (and b!1328491 res!881278) b!1328492))

(declare-fun m!1218141 () Bool)

(assert (=> d!143697 m!1218141))

(declare-fun m!1218143 () Bool)

(assert (=> d!143697 m!1218143))

(declare-fun m!1218145 () Bool)

(assert (=> d!143697 m!1218145))

(declare-fun m!1218147 () Bool)

(assert (=> d!143697 m!1218147))

(declare-fun m!1218149 () Bool)

(assert (=> b!1328491 m!1218149))

(declare-fun m!1218151 () Bool)

(assert (=> b!1328492 m!1218151))

(assert (=> b!1328291 d!143697))

(declare-fun d!143699 () Bool)

(assert (=> d!143699 (= (apply!1040 lt!590975 lt!590974) (get!21858 (getValueByKey!710 (toList!10637 lt!590975) lt!590974)))))

(declare-fun bs!37986 () Bool)

(assert (= bs!37986 d!143699))

(declare-fun m!1218153 () Bool)

(assert (=> bs!37986 m!1218153))

(assert (=> bs!37986 m!1218153))

(declare-fun m!1218155 () Bool)

(assert (=> bs!37986 m!1218155))

(assert (=> b!1328291 d!143699))

(declare-fun d!143701 () Bool)

(declare-fun e!757287 () Bool)

(assert (=> d!143701 e!757287))

(declare-fun res!881280 () Bool)

(assert (=> d!143701 (=> res!881280 e!757287)))

(declare-fun lt!591140 () Bool)

(assert (=> d!143701 (= res!881280 (not lt!591140))))

(declare-fun lt!591141 () Bool)

(assert (=> d!143701 (= lt!591140 lt!591141)))

(declare-fun lt!591143 () Unit!43660)

(declare-fun e!757286 () Unit!43660)

(assert (=> d!143701 (= lt!591143 e!757286)))

(declare-fun c!126275 () Bool)

(assert (=> d!143701 (= c!126275 lt!591141)))

(assert (=> d!143701 (= lt!591141 (containsKey!736 (toList!10637 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279))) lt!590980))))

(assert (=> d!143701 (= (contains!8807 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279)) lt!590980) lt!591140)))

(declare-fun b!1328493 () Bool)

(declare-fun lt!591142 () Unit!43660)

(assert (=> b!1328493 (= e!757286 lt!591142)))

(assert (=> b!1328493 (= lt!591142 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279))) lt!590980))))

(assert (=> b!1328493 (isDefined!519 (getValueByKey!710 (toList!10637 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279))) lt!590980))))

(declare-fun b!1328494 () Bool)

(declare-fun Unit!43668 () Unit!43660)

(assert (=> b!1328494 (= e!757286 Unit!43668)))

(declare-fun b!1328495 () Bool)

(assert (=> b!1328495 (= e!757287 (isDefined!519 (getValueByKey!710 (toList!10637 (+!4679 lt!590973 (tuple2!23579 lt!590968 zeroValue!1279))) lt!590980)))))

(assert (= (and d!143701 c!126275) b!1328493))

(assert (= (and d!143701 (not c!126275)) b!1328494))

(assert (= (and d!143701 (not res!881280)) b!1328495))

(declare-fun m!1218157 () Bool)

(assert (=> d!143701 m!1218157))

(declare-fun m!1218159 () Bool)

(assert (=> b!1328493 m!1218159))

(declare-fun m!1218161 () Bool)

(assert (=> b!1328493 m!1218161))

(assert (=> b!1328493 m!1218161))

(declare-fun m!1218163 () Bool)

(assert (=> b!1328493 m!1218163))

(assert (=> b!1328495 m!1218161))

(assert (=> b!1328495 m!1218161))

(assert (=> b!1328495 m!1218163))

(assert (=> b!1328291 d!143701))

(declare-fun d!143703 () Bool)

(assert (=> d!143703 (= (apply!1040 (+!4679 lt!590975 (tuple2!23579 lt!590964 minValue!1279)) lt!590974) (get!21858 (getValueByKey!710 (toList!10637 (+!4679 lt!590975 (tuple2!23579 lt!590964 minValue!1279))) lt!590974)))))

(declare-fun bs!37987 () Bool)

(assert (= bs!37987 d!143703))

(declare-fun m!1218165 () Bool)

(assert (=> bs!37987 m!1218165))

(assert (=> bs!37987 m!1218165))

(declare-fun m!1218167 () Bool)

(assert (=> bs!37987 m!1218167))

(assert (=> b!1328291 d!143703))

(declare-fun d!143705 () Bool)

(assert (=> d!143705 (= (apply!1040 (+!4679 lt!590977 (tuple2!23579 lt!590983 zeroValue!1279)) lt!590976) (get!21858 (getValueByKey!710 (toList!10637 (+!4679 lt!590977 (tuple2!23579 lt!590983 zeroValue!1279))) lt!590976)))))

(declare-fun bs!37988 () Bool)

(assert (= bs!37988 d!143705))

(declare-fun m!1218169 () Bool)

(assert (=> bs!37988 m!1218169))

(assert (=> bs!37988 m!1218169))

(declare-fun m!1218171 () Bool)

(assert (=> bs!37988 m!1218171))

(assert (=> b!1328291 d!143705))

(declare-fun d!143707 () Bool)

(assert (=> d!143707 (= (apply!1040 lt!590977 lt!590976) (get!21858 (getValueByKey!710 (toList!10637 lt!590977) lt!590976)))))

(declare-fun bs!37989 () Bool)

(assert (= bs!37989 d!143707))

(declare-fun m!1218173 () Bool)

(assert (=> bs!37989 m!1218173))

(assert (=> bs!37989 m!1218173))

(declare-fun m!1218175 () Bool)

(assert (=> bs!37989 m!1218175))

(assert (=> b!1328291 d!143707))

(assert (=> b!1328291 d!143613))

(assert (=> b!1328342 d!143601))

(declare-fun d!143709 () Bool)

(assert (=> d!143709 (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun lt!591146 () Unit!43660)

(declare-fun choose!1957 (List!30730 (_ BitVec 64)) Unit!43660)

(assert (=> d!143709 (= lt!591146 (choose!1957 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun e!757290 () Bool)

(assert (=> d!143709 e!757290))

(declare-fun res!881283 () Bool)

(assert (=> d!143709 (=> (not res!881283) (not e!757290))))

(declare-fun isStrictlySorted!866 (List!30730) Bool)

(assert (=> d!143709 (= res!881283 (isStrictlySorted!866 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))))

(assert (=> d!143709 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) lt!591146)))

(declare-fun b!1328498 () Bool)

(assert (=> b!1328498 (= e!757290 (containsKey!736 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (= (and d!143709 res!881283) b!1328498))

(assert (=> d!143709 m!1217697))

(assert (=> d!143709 m!1217697))

(assert (=> d!143709 m!1217699))

(declare-fun m!1218177 () Bool)

(assert (=> d!143709 m!1218177))

(declare-fun m!1218179 () Bool)

(assert (=> d!143709 m!1218179))

(assert (=> b!1328498 m!1217693))

(assert (=> b!1328226 d!143709))

(assert (=> b!1328226 d!143667))

(assert (=> b!1328226 d!143669))

(declare-fun d!143711 () Bool)

(declare-fun e!757292 () Bool)

(assert (=> d!143711 e!757292))

(declare-fun res!881284 () Bool)

(assert (=> d!143711 (=> res!881284 e!757292)))

(declare-fun lt!591147 () Bool)

(assert (=> d!143711 (= res!881284 (not lt!591147))))

(declare-fun lt!591148 () Bool)

(assert (=> d!143711 (= lt!591147 lt!591148)))

(declare-fun lt!591150 () Unit!43660)

(declare-fun e!757291 () Unit!43660)

(assert (=> d!143711 (= lt!591150 e!757291)))

(declare-fun c!126276 () Bool)

(assert (=> d!143711 (= c!126276 lt!591148)))

(assert (=> d!143711 (= lt!591148 (containsKey!736 (toList!10637 lt!590982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143711 (= (contains!8807 lt!590982 #b0000000000000000000000000000000000000000000000000000000000000000) lt!591147)))

(declare-fun b!1328499 () Bool)

(declare-fun lt!591149 () Unit!43660)

(assert (=> b!1328499 (= e!757291 lt!591149)))

(assert (=> b!1328499 (= lt!591149 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 lt!590982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1328499 (isDefined!519 (getValueByKey!710 (toList!10637 lt!590982) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328500 () Bool)

(declare-fun Unit!43669 () Unit!43660)

(assert (=> b!1328500 (= e!757291 Unit!43669)))

(declare-fun b!1328501 () Bool)

(assert (=> b!1328501 (= e!757292 (isDefined!519 (getValueByKey!710 (toList!10637 lt!590982) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143711 c!126276) b!1328499))

(assert (= (and d!143711 (not c!126276)) b!1328500))

(assert (= (and d!143711 (not res!881284)) b!1328501))

(declare-fun m!1218181 () Bool)

(assert (=> d!143711 m!1218181))

(declare-fun m!1218183 () Bool)

(assert (=> b!1328499 m!1218183))

(assert (=> b!1328499 m!1217901))

(assert (=> b!1328499 m!1217901))

(declare-fun m!1218185 () Bool)

(assert (=> b!1328499 m!1218185))

(assert (=> b!1328501 m!1217901))

(assert (=> b!1328501 m!1217901))

(assert (=> b!1328501 m!1218185))

(assert (=> bm!64848 d!143711))

(declare-fun b!1328502 () Bool)

(declare-fun e!757293 () Bool)

(assert (=> b!1328502 (= e!757293 (contains!8808 (ite c!126230 (Cons!30725 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) Nil!30726) Nil!30726) (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143713 () Bool)

(declare-fun res!881286 () Bool)

(declare-fun e!757294 () Bool)

(assert (=> d!143713 (=> res!881286 e!757294)))

(assert (=> d!143713 (= res!881286 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43875 _keys!1609)))))

(assert (=> d!143713 (= (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!126230 (Cons!30725 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) Nil!30726) Nil!30726)) e!757294)))

(declare-fun b!1328503 () Bool)

(declare-fun e!757295 () Bool)

(declare-fun call!64875 () Bool)

(assert (=> b!1328503 (= e!757295 call!64875)))

(declare-fun b!1328504 () Bool)

(declare-fun e!757296 () Bool)

(assert (=> b!1328504 (= e!757294 e!757296)))

(declare-fun res!881285 () Bool)

(assert (=> b!1328504 (=> (not res!881285) (not e!757296))))

(assert (=> b!1328504 (= res!881285 (not e!757293))))

(declare-fun res!881287 () Bool)

(assert (=> b!1328504 (=> (not res!881287) (not e!757293))))

(assert (=> b!1328504 (= res!881287 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!64872 () Bool)

(declare-fun c!126277 () Bool)

(assert (=> bm!64872 (= call!64875 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!126277 (Cons!30725 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!126230 (Cons!30725 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) Nil!30726) Nil!30726)) (ite c!126230 (Cons!30725 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000) Nil!30726) Nil!30726))))))

(declare-fun b!1328505 () Bool)

(assert (=> b!1328505 (= e!757295 call!64875)))

(declare-fun b!1328506 () Bool)

(assert (=> b!1328506 (= e!757296 e!757295)))

(assert (=> b!1328506 (= c!126277 (validKeyInArray!0 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!143713 (not res!881286)) b!1328504))

(assert (= (and b!1328504 res!881287) b!1328502))

(assert (= (and b!1328504 res!881285) b!1328506))

(assert (= (and b!1328506 c!126277) b!1328505))

(assert (= (and b!1328506 (not c!126277)) b!1328503))

(assert (= (or b!1328505 b!1328503) bm!64872))

(assert (=> b!1328502 m!1217907))

(assert (=> b!1328502 m!1217907))

(declare-fun m!1218187 () Bool)

(assert (=> b!1328502 m!1218187))

(assert (=> b!1328504 m!1217907))

(assert (=> b!1328504 m!1217907))

(assert (=> b!1328504 m!1217909))

(assert (=> bm!64872 m!1217907))

(declare-fun m!1218189 () Bool)

(assert (=> bm!64872 m!1218189))

(assert (=> b!1328506 m!1217907))

(assert (=> b!1328506 m!1217907))

(assert (=> b!1328506 m!1217909))

(assert (=> bm!64856 d!143713))

(declare-fun d!143715 () Bool)

(declare-fun e!757298 () Bool)

(assert (=> d!143715 e!757298))

(declare-fun res!881288 () Bool)

(assert (=> d!143715 (=> res!881288 e!757298)))

(declare-fun lt!591151 () Bool)

(assert (=> d!143715 (= res!881288 (not lt!591151))))

(declare-fun lt!591152 () Bool)

(assert (=> d!143715 (= lt!591151 lt!591152)))

(declare-fun lt!591154 () Unit!43660)

(declare-fun e!757297 () Unit!43660)

(assert (=> d!143715 (= lt!591154 e!757297)))

(declare-fun c!126278 () Bool)

(assert (=> d!143715 (= c!126278 lt!591152)))

(assert (=> d!143715 (= lt!591152 (containsKey!736 (toList!10637 lt!591017) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143715 (= (contains!8807 lt!591017 #b1000000000000000000000000000000000000000000000000000000000000000) lt!591151)))

(declare-fun b!1328507 () Bool)

(declare-fun lt!591153 () Unit!43660)

(assert (=> b!1328507 (= e!757297 lt!591153)))

(assert (=> b!1328507 (= lt!591153 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 lt!591017) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1328507 (isDefined!519 (getValueByKey!710 (toList!10637 lt!591017) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328508 () Bool)

(declare-fun Unit!43670 () Unit!43660)

(assert (=> b!1328508 (= e!757297 Unit!43670)))

(declare-fun b!1328509 () Bool)

(assert (=> b!1328509 (= e!757298 (isDefined!519 (getValueByKey!710 (toList!10637 lt!591017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143715 c!126278) b!1328507))

(assert (= (and d!143715 (not c!126278)) b!1328508))

(assert (= (and d!143715 (not res!881288)) b!1328509))

(declare-fun m!1218191 () Bool)

(assert (=> d!143715 m!1218191))

(declare-fun m!1218193 () Bool)

(assert (=> b!1328507 m!1218193))

(assert (=> b!1328507 m!1217875))

(assert (=> b!1328507 m!1217875))

(declare-fun m!1218195 () Bool)

(assert (=> b!1328507 m!1218195))

(assert (=> b!1328509 m!1217875))

(assert (=> b!1328509 m!1217875))

(assert (=> b!1328509 m!1218195))

(assert (=> bm!64860 d!143715))

(declare-fun d!143717 () Bool)

(declare-fun e!757300 () Bool)

(assert (=> d!143717 e!757300))

(declare-fun res!881289 () Bool)

(assert (=> d!143717 (=> res!881289 e!757300)))

(declare-fun lt!591155 () Bool)

(assert (=> d!143717 (= res!881289 (not lt!591155))))

(declare-fun lt!591156 () Bool)

(assert (=> d!143717 (= lt!591155 lt!591156)))

(declare-fun lt!591158 () Unit!43660)

(declare-fun e!757299 () Unit!43660)

(assert (=> d!143717 (= lt!591158 e!757299)))

(declare-fun c!126279 () Bool)

(assert (=> d!143717 (= c!126279 lt!591156)))

(assert (=> d!143717 (= lt!591156 (containsKey!736 (toList!10637 lt!591017) (select (arr!43324 _keys!1609) from!2000)))))

(assert (=> d!143717 (= (contains!8807 lt!591017 (select (arr!43324 _keys!1609) from!2000)) lt!591155)))

(declare-fun b!1328510 () Bool)

(declare-fun lt!591157 () Unit!43660)

(assert (=> b!1328510 (= e!757299 lt!591157)))

(assert (=> b!1328510 (= lt!591157 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 lt!591017) (select (arr!43324 _keys!1609) from!2000)))))

(assert (=> b!1328510 (isDefined!519 (getValueByKey!710 (toList!10637 lt!591017) (select (arr!43324 _keys!1609) from!2000)))))

(declare-fun b!1328511 () Bool)

(declare-fun Unit!43671 () Unit!43660)

(assert (=> b!1328511 (= e!757299 Unit!43671)))

(declare-fun b!1328512 () Bool)

(assert (=> b!1328512 (= e!757300 (isDefined!519 (getValueByKey!710 (toList!10637 lt!591017) (select (arr!43324 _keys!1609) from!2000))))))

(assert (= (and d!143717 c!126279) b!1328510))

(assert (= (and d!143717 (not c!126279)) b!1328511))

(assert (= (and d!143717 (not res!881289)) b!1328512))

(assert (=> d!143717 m!1217627))

(declare-fun m!1218197 () Bool)

(assert (=> d!143717 m!1218197))

(assert (=> b!1328510 m!1217627))

(declare-fun m!1218199 () Bool)

(assert (=> b!1328510 m!1218199))

(assert (=> b!1328510 m!1217627))

(declare-fun m!1218201 () Bool)

(assert (=> b!1328510 m!1218201))

(assert (=> b!1328510 m!1218201))

(declare-fun m!1218203 () Bool)

(assert (=> b!1328510 m!1218203))

(assert (=> b!1328512 m!1217627))

(assert (=> b!1328512 m!1218201))

(assert (=> b!1328512 m!1218201))

(assert (=> b!1328512 m!1218203))

(assert (=> b!1328340 d!143717))

(assert (=> b!1328289 d!143675))

(assert (=> b!1328308 d!143629))

(declare-fun d!143719 () Bool)

(declare-fun lt!591161 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!654 (List!30729) (InoxSet (_ BitVec 64)))

(assert (=> d!143719 (= lt!591161 (select (content!654 Nil!30726) (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun e!757306 () Bool)

(assert (=> d!143719 (= lt!591161 e!757306)))

(declare-fun res!881295 () Bool)

(assert (=> d!143719 (=> (not res!881295) (not e!757306))))

(assert (=> d!143719 (= res!881295 ((_ is Cons!30725) Nil!30726))))

(assert (=> d!143719 (= (contains!8808 Nil!30726 (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)) lt!591161)))

(declare-fun b!1328517 () Bool)

(declare-fun e!757305 () Bool)

(assert (=> b!1328517 (= e!757306 e!757305)))

(declare-fun res!881294 () Bool)

(assert (=> b!1328517 (=> res!881294 e!757305)))

(assert (=> b!1328517 (= res!881294 (= (h!31943 Nil!30726) (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1328518 () Bool)

(assert (=> b!1328518 (= e!757305 (contains!8808 (t!44725 Nil!30726) (select (arr!43324 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143719 res!881295) b!1328517))

(assert (= (and b!1328517 (not res!881294)) b!1328518))

(declare-fun m!1218205 () Bool)

(assert (=> d!143719 m!1218205))

(assert (=> d!143719 m!1217759))

(declare-fun m!1218207 () Bool)

(assert (=> d!143719 m!1218207))

(assert (=> b!1328518 m!1217759))

(declare-fun m!1218209 () Bool)

(assert (=> b!1328518 m!1218209))

(assert (=> b!1328304 d!143719))

(declare-fun d!143721 () Bool)

(assert (=> d!143721 (= (apply!1040 lt!591017 (select (arr!43324 _keys!1609) from!2000)) (get!21858 (getValueByKey!710 (toList!10637 lt!591017) (select (arr!43324 _keys!1609) from!2000))))))

(declare-fun bs!37990 () Bool)

(assert (= bs!37990 d!143721))

(assert (=> bs!37990 m!1217627))

(assert (=> bs!37990 m!1218201))

(assert (=> bs!37990 m!1218201))

(declare-fun m!1218211 () Bool)

(assert (=> bs!37990 m!1218211))

(assert (=> b!1328338 d!143721))

(declare-fun d!143723 () Bool)

(declare-fun c!126282 () Bool)

(assert (=> d!143723 (= c!126282 ((_ is ValueCellFull!17279) (select (arr!43325 _values!1337) from!2000)))))

(declare-fun e!757309 () V!53577)

(assert (=> d!143723 (= (get!21857 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!757309)))

(declare-fun b!1328523 () Bool)

(declare-fun get!21859 (ValueCell!17279 V!53577) V!53577)

(assert (=> b!1328523 (= e!757309 (get!21859 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1328524 () Bool)

(declare-fun get!21860 (ValueCell!17279 V!53577) V!53577)

(assert (=> b!1328524 (= e!757309 (get!21860 (select (arr!43325 _values!1337) from!2000) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143723 c!126282) b!1328523))

(assert (= (and d!143723 (not c!126282)) b!1328524))

(assert (=> b!1328523 m!1217787))

(assert (=> b!1328523 m!1217709))

(declare-fun m!1218213 () Bool)

(assert (=> b!1328523 m!1218213))

(assert (=> b!1328524 m!1217787))

(assert (=> b!1328524 m!1217709))

(declare-fun m!1218215 () Bool)

(assert (=> b!1328524 m!1218215))

(assert (=> b!1328338 d!143723))

(declare-fun d!143725 () Bool)

(declare-fun e!757311 () Bool)

(assert (=> d!143725 e!757311))

(declare-fun res!881296 () Bool)

(assert (=> d!143725 (=> res!881296 e!757311)))

(declare-fun lt!591162 () Bool)

(assert (=> d!143725 (= res!881296 (not lt!591162))))

(declare-fun lt!591163 () Bool)

(assert (=> d!143725 (= lt!591162 lt!591163)))

(declare-fun lt!591165 () Unit!43660)

(declare-fun e!757310 () Unit!43660)

(assert (=> d!143725 (= lt!591165 e!757310)))

(declare-fun c!126283 () Bool)

(assert (=> d!143725 (= c!126283 lt!591163)))

(assert (=> d!143725 (= lt!591163 (containsKey!736 (toList!10637 lt!590982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143725 (= (contains!8807 lt!590982 #b1000000000000000000000000000000000000000000000000000000000000000) lt!591162)))

(declare-fun b!1328525 () Bool)

(declare-fun lt!591164 () Unit!43660)

(assert (=> b!1328525 (= e!757310 lt!591164)))

(assert (=> b!1328525 (= lt!591164 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 lt!590982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1328525 (isDefined!519 (getValueByKey!710 (toList!10637 lt!590982) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1328526 () Bool)

(declare-fun Unit!43672 () Unit!43660)

(assert (=> b!1328526 (= e!757310 Unit!43672)))

(declare-fun b!1328527 () Bool)

(assert (=> b!1328527 (= e!757311 (isDefined!519 (getValueByKey!710 (toList!10637 lt!590982) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143725 c!126283) b!1328525))

(assert (= (and d!143725 (not c!126283)) b!1328526))

(assert (= (and d!143725 (not res!881296)) b!1328527))

(declare-fun m!1218217 () Bool)

(assert (=> d!143725 m!1218217))

(declare-fun m!1218219 () Bool)

(assert (=> b!1328525 m!1218219))

(assert (=> b!1328525 m!1217885))

(assert (=> b!1328525 m!1217885))

(declare-fun m!1218221 () Bool)

(assert (=> b!1328525 m!1218221))

(assert (=> b!1328527 m!1217885))

(assert (=> b!1328527 m!1217885))

(assert (=> b!1328527 m!1218221))

(assert (=> bm!64847 d!143725))

(declare-fun d!143727 () Bool)

(declare-fun e!757313 () Bool)

(assert (=> d!143727 e!757313))

(declare-fun res!881297 () Bool)

(assert (=> d!143727 (=> res!881297 e!757313)))

(declare-fun lt!591166 () Bool)

(assert (=> d!143727 (= res!881297 (not lt!591166))))

(declare-fun lt!591167 () Bool)

(assert (=> d!143727 (= lt!591166 lt!591167)))

(declare-fun lt!591169 () Unit!43660)

(declare-fun e!757312 () Unit!43660)

(assert (=> d!143727 (= lt!591169 e!757312)))

(declare-fun c!126284 () Bool)

(assert (=> d!143727 (= c!126284 lt!591167)))

(assert (=> d!143727 (= lt!591167 (containsKey!736 (toList!10637 lt!590982) (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> d!143727 (= (contains!8807 lt!590982 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) lt!591166)))

(declare-fun b!1328528 () Bool)

(declare-fun lt!591168 () Unit!43660)

(assert (=> b!1328528 (= e!757312 lt!591168)))

(assert (=> b!1328528 (= lt!591168 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 lt!590982) (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1328528 (isDefined!519 (getValueByKey!710 (toList!10637 lt!590982) (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1328529 () Bool)

(declare-fun Unit!43673 () Unit!43660)

(assert (=> b!1328529 (= e!757312 Unit!43673)))

(declare-fun b!1328530 () Bool)

(assert (=> b!1328530 (= e!757313 (isDefined!519 (getValueByKey!710 (toList!10637 lt!590982) (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(assert (= (and d!143727 c!126284) b!1328528))

(assert (= (and d!143727 (not c!126284)) b!1328529))

(assert (= (and d!143727 (not res!881297)) b!1328530))

(assert (=> d!143727 m!1217703))

(declare-fun m!1218223 () Bool)

(assert (=> d!143727 m!1218223))

(assert (=> b!1328528 m!1217703))

(declare-fun m!1218225 () Bool)

(assert (=> b!1328528 m!1218225))

(assert (=> b!1328528 m!1217703))

(declare-fun m!1218227 () Bool)

(assert (=> b!1328528 m!1218227))

(assert (=> b!1328528 m!1218227))

(declare-fun m!1218229 () Bool)

(assert (=> b!1328528 m!1218229))

(assert (=> b!1328530 m!1217703))

(assert (=> b!1328530 m!1218227))

(assert (=> b!1328530 m!1218227))

(assert (=> b!1328530 m!1218229))

(assert (=> b!1328287 d!143727))

(assert (=> b!1328306 d!143629))

(declare-fun d!143729 () Bool)

(assert (=> d!143729 (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun lt!591170 () Unit!43660)

(assert (=> d!143729 (= lt!591170 (choose!1957 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun e!757314 () Bool)

(assert (=> d!143729 e!757314))

(declare-fun res!881298 () Bool)

(assert (=> d!143729 (=> (not res!881298) (not e!757314))))

(assert (=> d!143729 (= res!881298 (isStrictlySorted!866 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))

(assert (=> d!143729 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) lt!591170)))

(declare-fun b!1328531 () Bool)

(assert (=> b!1328531 (= e!757314 (containsKey!736 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (= (and d!143729 res!881298) b!1328531))

(assert (=> d!143729 m!1217779))

(assert (=> d!143729 m!1217779))

(assert (=> d!143729 m!1217781))

(declare-fun m!1218231 () Bool)

(assert (=> d!143729 m!1218231))

(declare-fun m!1218233 () Bool)

(assert (=> d!143729 m!1218233))

(assert (=> b!1328531 m!1217775))

(assert (=> b!1328321 d!143729))

(declare-fun d!143731 () Bool)

(assert (=> d!143731 (= (isDefined!519 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)) (not (isEmpty!1084 (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37991 () Bool)

(assert (= bs!37991 d!143731))

(assert (=> bs!37991 m!1217779))

(declare-fun m!1218235 () Bool)

(assert (=> bs!37991 m!1218235))

(assert (=> b!1328321 d!143731))

(declare-fun b!1328535 () Bool)

(declare-fun e!757316 () Option!761)

(assert (=> b!1328535 (= e!757316 None!759)))

(declare-fun b!1328534 () Bool)

(assert (=> b!1328534 (= e!757316 (getValueByKey!710 (t!44726 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(declare-fun d!143733 () Bool)

(declare-fun c!126285 () Bool)

(assert (=> d!143733 (= c!126285 (and ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun e!757315 () Option!761)

(assert (=> d!143733 (= (getValueByKey!710 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!757315)))

(declare-fun b!1328532 () Bool)

(assert (=> b!1328532 (= e!757315 (Some!760 (_2!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))))

(declare-fun b!1328533 () Bool)

(assert (=> b!1328533 (= e!757315 e!757316)))

(declare-fun c!126286 () Bool)

(assert (=> b!1328533 (= c!126286 (and ((_ is Cons!30726) (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (not (= (_1!11800 (h!31944 (toList!10637 (getCurrentListMap!5614 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164))))))

(assert (= (and d!143733 c!126285) b!1328532))

(assert (= (and d!143733 (not c!126285)) b!1328533))

(assert (= (and b!1328533 c!126286) b!1328534))

(assert (= (and b!1328533 (not c!126286)) b!1328535))

(declare-fun m!1218237 () Bool)

(assert (=> b!1328534 m!1218237))

(assert (=> b!1328321 d!143733))

(assert (=> d!143589 d!143593))

(assert (=> bm!64864 d!143663))

(declare-fun d!143735 () Bool)

(assert (=> d!143735 (= (apply!1040 lt!590982 (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21858 (getValueByKey!710 (toList!10637 lt!590982) (select (arr!43324 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(declare-fun bs!37992 () Bool)

(assert (= bs!37992 d!143735))

(assert (=> bs!37992 m!1217703))

(assert (=> bs!37992 m!1218227))

(assert (=> bs!37992 m!1218227))

(declare-fun m!1218239 () Bool)

(assert (=> bs!37992 m!1218239))

(assert (=> b!1328285 d!143735))

(declare-fun d!143737 () Bool)

(declare-fun c!126287 () Bool)

(assert (=> d!143737 (= c!126287 ((_ is ValueCellFull!17279) (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun e!757317 () V!53577)

(assert (=> d!143737 (= (get!21857 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!757317)))

(declare-fun b!1328536 () Bool)

(assert (=> b!1328536 (= e!757317 (get!21859 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1328537 () Bool)

(assert (=> b!1328537 (= e!757317 (get!21860 (select (arr!43325 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3633 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143737 c!126287) b!1328536))

(assert (= (and d!143737 (not c!126287)) b!1328537))

(assert (=> b!1328536 m!1217707))

(assert (=> b!1328536 m!1217709))

(declare-fun m!1218241 () Bool)

(assert (=> b!1328536 m!1218241))

(assert (=> b!1328537 m!1217707))

(assert (=> b!1328537 m!1217709))

(declare-fun m!1218243 () Bool)

(assert (=> b!1328537 m!1218243))

(assert (=> b!1328285 d!143737))

(assert (=> b!1328323 d!143731))

(assert (=> b!1328323 d!143733))

(declare-fun b!1328539 () Bool)

(declare-fun e!757319 () Bool)

(assert (=> b!1328539 (= e!757319 tp_is_empty!36355)))

(declare-fun condMapEmpty!56197 () Bool)

(declare-fun mapDefault!56197 () ValueCell!17279)

(assert (=> mapNonEmpty!56196 (= condMapEmpty!56197 (= mapRest!56196 ((as const (Array (_ BitVec 32) ValueCell!17279)) mapDefault!56197)))))

(declare-fun mapRes!56197 () Bool)

(assert (=> mapNonEmpty!56196 (= tp!107103 (and e!757319 mapRes!56197))))

(declare-fun mapIsEmpty!56197 () Bool)

(assert (=> mapIsEmpty!56197 mapRes!56197))

(declare-fun mapNonEmpty!56197 () Bool)

(declare-fun tp!107104 () Bool)

(declare-fun e!757318 () Bool)

(assert (=> mapNonEmpty!56197 (= mapRes!56197 (and tp!107104 e!757318))))

(declare-fun mapValue!56197 () ValueCell!17279)

(declare-fun mapKey!56197 () (_ BitVec 32))

(declare-fun mapRest!56197 () (Array (_ BitVec 32) ValueCell!17279))

(assert (=> mapNonEmpty!56197 (= mapRest!56196 (store mapRest!56197 mapKey!56197 mapValue!56197))))

(declare-fun b!1328538 () Bool)

(assert (=> b!1328538 (= e!757318 tp_is_empty!36355)))

(assert (= (and mapNonEmpty!56196 condMapEmpty!56197) mapIsEmpty!56197))

(assert (= (and mapNonEmpty!56196 (not condMapEmpty!56197)) mapNonEmpty!56197))

(assert (= (and mapNonEmpty!56197 ((_ is ValueCellFull!17279) mapValue!56197)) b!1328538))

(assert (= (and mapNonEmpty!56196 ((_ is ValueCellFull!17279) mapDefault!56197)) b!1328539))

(declare-fun m!1218245 () Bool)

(assert (=> mapNonEmpty!56197 m!1218245))

(declare-fun b_lambda!23841 () Bool)

(assert (= b_lambda!23839 (or (and start!112186 b_free!30535) b_lambda!23841)))

(declare-fun b_lambda!23843 () Bool)

(assert (= b_lambda!23835 (or (and start!112186 b_free!30535) b_lambda!23843)))

(declare-fun b_lambda!23845 () Bool)

(assert (= b_lambda!23833 (or (and start!112186 b_free!30535) b_lambda!23845)))

(declare-fun b_lambda!23847 () Bool)

(assert (= b_lambda!23837 (or (and start!112186 b_free!30535) b_lambda!23847)))

(check-sat (not b!1328423) (not d!143697) (not b!1328525) (not d!143663) (not b_lambda!23847) (not b!1328425) (not d!143639) (not b!1328418) (not b!1328490) (not d!143635) (not d!143699) (not b_lambda!23831) (not d!143685) (not b!1328403) (not b!1328502) (not b!1328475) (not d!143705) (not b!1328411) (not b!1328429) (not b!1328493) (not d!143655) (not d!143647) (not d!143717) (not b!1328450) (not b_next!30535) (not b!1328501) (not d!143661) (not d!143677) (not d!143657) (not d!143613) (not b!1328485) (not d!143687) (not b!1328458) (not b!1328492) (not b!1328434) (not b!1328430) (not b!1328449) (not b!1328424) (not b!1328402) (not b!1328462) (not b!1328489) (not d!143611) (not b!1328476) (not d!143727) (not d!143653) (not d!143673) (not b!1328428) (not b!1328460) (not b!1328518) b_and!49191 (not d!143729) (not b!1328446) (not d!143721) (not b!1328459) (not b_lambda!23843) (not b!1328523) (not b!1328524) (not d!143711) (not b!1328481) (not b!1328451) (not d!143709) (not bm!64870) (not d!143691) (not b!1328506) (not d!143643) (not b!1328445) (not mapNonEmpty!56197) (not b!1328372) (not b!1328495) (not b!1328509) (not b_lambda!23845) (not b!1328480) (not b!1328504) (not b!1328537) (not b!1328528) (not d!143641) (not d!143659) (not d!143637) (not b!1328510) (not b!1328410) (not b!1328358) (not d!143725) (not b!1328498) (not d!143621) (not b!1328439) (not d!143615) (not d!143649) (not bm!64872) (not b!1328477) (not d!143715) (not d!143707) (not d!143731) (not b!1328479) (not b!1328448) (not b!1328447) (not d!143719) (not d!143617) (not d!143679) (not d!143689) (not d!143693) (not d!143683) (not b!1328507) (not b!1328457) (not b!1328433) (not d!143703) (not b_lambda!23841) (not d!143625) (not b!1328431) (not b!1328483) (not b!1328441) (not b!1328405) (not b!1328453) (not b!1328499) (not d!143651) (not b!1328531) (not d!143633) (not b!1328512) (not b!1328412) (not bm!64869) (not b!1328484) tp_is_empty!36355 (not b_lambda!23829) (not b!1328527) (not b!1328491) (not b!1328401) (not d!143681) (not bm!64871) (not b!1328473) (not b!1328432) (not d!143667) (not d!143671) (not d!143701) (not b!1328534) (not b!1328530) (not d!143695) (not d!143607) (not b!1328409) (not d!143735) (not d!143631) (not d!143623) (not b!1328536) (not d!143645) (not b!1328486))
(check-sat b_and!49191 (not b_next!30535))
