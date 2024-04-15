; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112386 () Bool)

(assert start!112386)

(declare-fun b_free!30781 () Bool)

(declare-fun b_next!30781 () Bool)

(assert (=> start!112386 (= b_free!30781 (not b_next!30781))))

(declare-fun tp!107981 () Bool)

(declare-fun b_and!49599 () Bool)

(assert (=> start!112386 (= tp!107981 b_and!49599)))

(declare-fun b!1332331 () Bool)

(declare-fun res!884174 () Bool)

(declare-fun e!759026 () Bool)

(assert (=> b!1332331 (=> (not res!884174) (not e!759026))))

(declare-datatypes ((array!90201 0))(
  ( (array!90202 (arr!43567 (Array (_ BitVec 32) (_ BitVec 64))) (size!44119 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90201)

(declare-datatypes ((List!30942 0))(
  ( (Nil!30939) (Cons!30938 (h!32147 (_ BitVec 64)) (t!45128 List!30942)) )
))
(declare-fun arrayNoDuplicates!0 (array!90201 (_ BitVec 32) List!30942) Bool)

(assert (=> b!1332331 (= res!884174 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30939))))

(declare-fun b!1332332 () Bool)

(declare-fun res!884178 () Bool)

(assert (=> b!1332332 (=> (not res!884178) (not e!759026))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90201 (_ BitVec 32)) Bool)

(assert (=> b!1332332 (= res!884178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!884171 () Bool)

(assert (=> start!112386 (=> (not res!884171) (not e!759026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112386 (= res!884171 (validMask!0 mask!1998))))

(assert (=> start!112386 e!759026))

(declare-datatypes ((V!54025 0))(
  ( (V!54026 (val!18420 Int)) )
))
(declare-datatypes ((ValueCell!17447 0))(
  ( (ValueCellFull!17447 (v!21056 V!54025)) (EmptyCell!17447) )
))
(declare-datatypes ((array!90203 0))(
  ( (array!90204 (arr!43568 (Array (_ BitVec 32) ValueCell!17447)) (size!44120 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90203)

(declare-fun e!759024 () Bool)

(declare-fun array_inv!33047 (array!90203) Bool)

(assert (=> start!112386 (and (array_inv!33047 _values!1320) e!759024)))

(assert (=> start!112386 true))

(declare-fun array_inv!33048 (array!90201) Bool)

(assert (=> start!112386 (array_inv!33048 _keys!1590)))

(assert (=> start!112386 tp!107981))

(declare-fun tp_is_empty!36691 () Bool)

(assert (=> start!112386 tp_is_empty!36691))

(declare-fun b!1332333 () Bool)

(declare-fun res!884177 () Bool)

(assert (=> b!1332333 (=> (not res!884177) (not e!759026))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332333 (= res!884177 (not (= (select (arr!43567 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332334 () Bool)

(assert (=> b!1332334 (= e!759026 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23808 0))(
  ( (tuple2!23809 (_1!11915 (_ BitVec 64)) (_2!11915 V!54025)) )
))
(declare-datatypes ((List!30943 0))(
  ( (Nil!30940) (Cons!30939 (h!32148 tuple2!23808) (t!45129 List!30943)) )
))
(declare-datatypes ((ListLongMap!21465 0))(
  ( (ListLongMap!21466 (toList!10748 List!30943)) )
))
(declare-fun lt!591806 () ListLongMap!21465)

(declare-fun minValue!1262 () V!54025)

(declare-fun contains!8840 (ListLongMap!21465 (_ BitVec 64)) Bool)

(declare-fun +!4727 (ListLongMap!21465 tuple2!23808) ListLongMap!21465)

(assert (=> b!1332334 (contains!8840 (+!4727 lt!591806 (tuple2!23809 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43666 0))(
  ( (Unit!43667) )
))
(declare-fun lt!591807 () Unit!43666)

(declare-fun addStillContains!1181 (ListLongMap!21465 (_ BitVec 64) V!54025 (_ BitVec 64)) Unit!43666)

(assert (=> b!1332334 (= lt!591807 (addStillContains!1181 lt!591806 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332334 (contains!8840 lt!591806 k0!1153)))

(declare-fun lt!591808 () Unit!43666)

(declare-fun lt!591803 () V!54025)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!283 ((_ BitVec 64) (_ BitVec 64) V!54025 ListLongMap!21465) Unit!43666)

(assert (=> b!1332334 (= lt!591808 (lemmaInListMapAfterAddingDiffThenInBefore!283 k0!1153 (select (arr!43567 _keys!1590) from!1980) lt!591803 lt!591806))))

(declare-fun lt!591804 () ListLongMap!21465)

(assert (=> b!1332334 (contains!8840 lt!591804 k0!1153)))

(declare-fun lt!591805 () Unit!43666)

(assert (=> b!1332334 (= lt!591805 (lemmaInListMapAfterAddingDiffThenInBefore!283 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591804))))

(assert (=> b!1332334 (= lt!591804 (+!4727 lt!591806 (tuple2!23809 (select (arr!43567 _keys!1590) from!1980) lt!591803)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21984 (ValueCell!17447 V!54025) V!54025)

(declare-fun dynLambda!3657 (Int (_ BitVec 64)) V!54025)

(assert (=> b!1332334 (= lt!591803 (get!21984 (select (arr!43568 _values!1320) from!1980) (dynLambda!3657 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54025)

(declare-fun getCurrentListMapNoExtraKeys!6365 (array!90201 array!90203 (_ BitVec 32) (_ BitVec 32) V!54025 V!54025 (_ BitVec 32) Int) ListLongMap!21465)

(assert (=> b!1332334 (= lt!591806 (getCurrentListMapNoExtraKeys!6365 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332335 () Bool)

(declare-fun res!884176 () Bool)

(assert (=> b!1332335 (=> (not res!884176) (not e!759026))))

(declare-fun getCurrentListMap!5608 (array!90201 array!90203 (_ BitVec 32) (_ BitVec 32) V!54025 V!54025 (_ BitVec 32) Int) ListLongMap!21465)

(assert (=> b!1332335 (= res!884176 (contains!8840 (getCurrentListMap!5608 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332336 () Bool)

(declare-fun res!884172 () Bool)

(assert (=> b!1332336 (=> (not res!884172) (not e!759026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332336 (= res!884172 (validKeyInArray!0 (select (arr!43567 _keys!1590) from!1980)))))

(declare-fun b!1332337 () Bool)

(declare-fun e!759025 () Bool)

(declare-fun mapRes!56710 () Bool)

(assert (=> b!1332337 (= e!759024 (and e!759025 mapRes!56710))))

(declare-fun condMapEmpty!56710 () Bool)

(declare-fun mapDefault!56710 () ValueCell!17447)

(assert (=> b!1332337 (= condMapEmpty!56710 (= (arr!43568 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17447)) mapDefault!56710)))))

(declare-fun b!1332338 () Bool)

(declare-fun res!884179 () Bool)

(assert (=> b!1332338 (=> (not res!884179) (not e!759026))))

(assert (=> b!1332338 (= res!884179 (and (= (size!44120 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44119 _keys!1590) (size!44120 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332339 () Bool)

(declare-fun res!884175 () Bool)

(assert (=> b!1332339 (=> (not res!884175) (not e!759026))))

(assert (=> b!1332339 (= res!884175 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56710 () Bool)

(assert (=> mapIsEmpty!56710 mapRes!56710))

(declare-fun b!1332340 () Bool)

(assert (=> b!1332340 (= e!759025 tp_is_empty!36691)))

(declare-fun mapNonEmpty!56710 () Bool)

(declare-fun tp!107980 () Bool)

(declare-fun e!759028 () Bool)

(assert (=> mapNonEmpty!56710 (= mapRes!56710 (and tp!107980 e!759028))))

(declare-fun mapValue!56710 () ValueCell!17447)

(declare-fun mapRest!56710 () (Array (_ BitVec 32) ValueCell!17447))

(declare-fun mapKey!56710 () (_ BitVec 32))

(assert (=> mapNonEmpty!56710 (= (arr!43568 _values!1320) (store mapRest!56710 mapKey!56710 mapValue!56710))))

(declare-fun b!1332341 () Bool)

(assert (=> b!1332341 (= e!759028 tp_is_empty!36691)))

(declare-fun b!1332342 () Bool)

(declare-fun res!884173 () Bool)

(assert (=> b!1332342 (=> (not res!884173) (not e!759026))))

(assert (=> b!1332342 (= res!884173 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44119 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112386 res!884171) b!1332338))

(assert (= (and b!1332338 res!884179) b!1332332))

(assert (= (and b!1332332 res!884178) b!1332331))

(assert (= (and b!1332331 res!884174) b!1332342))

(assert (= (and b!1332342 res!884173) b!1332335))

(assert (= (and b!1332335 res!884176) b!1332333))

(assert (= (and b!1332333 res!884177) b!1332336))

(assert (= (and b!1332336 res!884172) b!1332339))

(assert (= (and b!1332339 res!884175) b!1332334))

(assert (= (and b!1332337 condMapEmpty!56710) mapIsEmpty!56710))

(assert (= (and b!1332337 (not condMapEmpty!56710)) mapNonEmpty!56710))

(get-info :version)

(assert (= (and mapNonEmpty!56710 ((_ is ValueCellFull!17447) mapValue!56710)) b!1332341))

(assert (= (and b!1332337 ((_ is ValueCellFull!17447) mapDefault!56710)) b!1332340))

(assert (= start!112386 b!1332337))

(declare-fun b_lambda!24031 () Bool)

(assert (=> (not b_lambda!24031) (not b!1332334)))

(declare-fun t!45127 () Bool)

(declare-fun tb!11989 () Bool)

(assert (=> (and start!112386 (= defaultEntry!1323 defaultEntry!1323) t!45127) tb!11989))

(declare-fun result!25057 () Bool)

(assert (=> tb!11989 (= result!25057 tp_is_empty!36691)))

(assert (=> b!1332334 t!45127))

(declare-fun b_and!49601 () Bool)

(assert (= b_and!49599 (and (=> t!45127 result!25057) b_and!49601)))

(declare-fun m!1220691 () Bool)

(assert (=> b!1332335 m!1220691))

(assert (=> b!1332335 m!1220691))

(declare-fun m!1220693 () Bool)

(assert (=> b!1332335 m!1220693))

(declare-fun m!1220695 () Bool)

(assert (=> b!1332334 m!1220695))

(declare-fun m!1220697 () Bool)

(assert (=> b!1332334 m!1220697))

(declare-fun m!1220699 () Bool)

(assert (=> b!1332334 m!1220699))

(declare-fun m!1220701 () Bool)

(assert (=> b!1332334 m!1220701))

(declare-fun m!1220703 () Bool)

(assert (=> b!1332334 m!1220703))

(assert (=> b!1332334 m!1220699))

(declare-fun m!1220705 () Bool)

(assert (=> b!1332334 m!1220705))

(declare-fun m!1220707 () Bool)

(assert (=> b!1332334 m!1220707))

(declare-fun m!1220709 () Bool)

(assert (=> b!1332334 m!1220709))

(declare-fun m!1220711 () Bool)

(assert (=> b!1332334 m!1220711))

(declare-fun m!1220713 () Bool)

(assert (=> b!1332334 m!1220713))

(declare-fun m!1220715 () Bool)

(assert (=> b!1332334 m!1220715))

(declare-fun m!1220717 () Bool)

(assert (=> b!1332334 m!1220717))

(assert (=> b!1332334 m!1220703))

(assert (=> b!1332334 m!1220701))

(declare-fun m!1220719 () Bool)

(assert (=> b!1332334 m!1220719))

(assert (=> b!1332334 m!1220707))

(assert (=> b!1332333 m!1220707))

(assert (=> b!1332336 m!1220707))

(assert (=> b!1332336 m!1220707))

(declare-fun m!1220721 () Bool)

(assert (=> b!1332336 m!1220721))

(declare-fun m!1220723 () Bool)

(assert (=> b!1332331 m!1220723))

(declare-fun m!1220725 () Bool)

(assert (=> mapNonEmpty!56710 m!1220725))

(declare-fun m!1220727 () Bool)

(assert (=> b!1332332 m!1220727))

(declare-fun m!1220729 () Bool)

(assert (=> start!112386 m!1220729))

(declare-fun m!1220731 () Bool)

(assert (=> start!112386 m!1220731))

(declare-fun m!1220733 () Bool)

(assert (=> start!112386 m!1220733))

(check-sat (not start!112386) (not b_next!30781) tp_is_empty!36691 (not mapNonEmpty!56710) (not b_lambda!24031) (not b!1332331) (not b!1332335) (not b!1332334) (not b!1332332) (not b!1332336) b_and!49601)
(check-sat b_and!49601 (not b_next!30781))
