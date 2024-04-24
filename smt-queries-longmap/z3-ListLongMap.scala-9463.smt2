; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112610 () Bool)

(assert start!112610)

(declare-fun b_free!30781 () Bool)

(declare-fun b_next!30781 () Bool)

(assert (=> start!112610 (= b_free!30781 (not b_next!30781))))

(declare-fun tp!107980 () Bool)

(declare-fun b_and!49619 () Bool)

(assert (=> start!112610 (= tp!107980 b_and!49619)))

(declare-fun b!1333700 () Bool)

(declare-fun res!884724 () Bool)

(declare-fun e!759904 () Bool)

(assert (=> b!1333700 (=> (not res!884724) (not e!759904))))

(declare-datatypes ((array!90367 0))(
  ( (array!90368 (arr!43645 (Array (_ BitVec 32) (_ BitVec 64))) (size!44196 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90367)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90367 (_ BitVec 32)) Bool)

(assert (=> b!1333700 (= res!884724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333701 () Bool)

(declare-fun e!759900 () Bool)

(declare-fun tp_is_empty!36691 () Bool)

(assert (=> b!1333701 (= e!759900 tp_is_empty!36691)))

(declare-fun b!1333702 () Bool)

(declare-fun res!884718 () Bool)

(assert (=> b!1333702 (=> (not res!884718) (not e!759904))))

(declare-datatypes ((List!30929 0))(
  ( (Nil!30926) (Cons!30925 (h!32143 (_ BitVec 64)) (t!45115 List!30929)) )
))
(declare-fun arrayNoDuplicates!0 (array!90367 (_ BitVec 32) List!30929) Bool)

(assert (=> b!1333702 (= res!884718 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30926))))

(declare-fun b!1333703 () Bool)

(declare-fun e!759903 () Bool)

(declare-fun e!759902 () Bool)

(declare-fun mapRes!56710 () Bool)

(assert (=> b!1333703 (= e!759903 (and e!759902 mapRes!56710))))

(declare-fun condMapEmpty!56710 () Bool)

(declare-datatypes ((V!54025 0))(
  ( (V!54026 (val!18420 Int)) )
))
(declare-datatypes ((ValueCell!17447 0))(
  ( (ValueCellFull!17447 (v!21052 V!54025)) (EmptyCell!17447) )
))
(declare-datatypes ((array!90369 0))(
  ( (array!90370 (arr!43646 (Array (_ BitVec 32) ValueCell!17447)) (size!44197 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90369)

(declare-fun mapDefault!56710 () ValueCell!17447)

(assert (=> b!1333703 (= condMapEmpty!56710 (= (arr!43646 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17447)) mapDefault!56710)))))

(declare-fun mapIsEmpty!56710 () Bool)

(assert (=> mapIsEmpty!56710 mapRes!56710))

(declare-fun b!1333704 () Bool)

(declare-fun res!884720 () Bool)

(assert (=> b!1333704 (=> (not res!884720) (not e!759904))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333704 (= res!884720 (validKeyInArray!0 (select (arr!43645 _keys!1590) from!1980)))))

(declare-fun b!1333705 () Bool)

(declare-fun res!884723 () Bool)

(assert (=> b!1333705 (=> (not res!884723) (not e!759904))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1333705 (= res!884723 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44196 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!884726 () Bool)

(assert (=> start!112610 (=> (not res!884726) (not e!759904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112610 (= res!884726 (validMask!0 mask!1998))))

(assert (=> start!112610 e!759904))

(declare-fun array_inv!33195 (array!90369) Bool)

(assert (=> start!112610 (and (array_inv!33195 _values!1320) e!759903)))

(assert (=> start!112610 true))

(declare-fun array_inv!33196 (array!90367) Bool)

(assert (=> start!112610 (array_inv!33196 _keys!1590)))

(assert (=> start!112610 tp!107980))

(assert (=> start!112610 tp_is_empty!36691))

(declare-fun mapNonEmpty!56710 () Bool)

(declare-fun tp!107979 () Bool)

(assert (=> mapNonEmpty!56710 (= mapRes!56710 (and tp!107979 e!759900))))

(declare-fun mapValue!56710 () ValueCell!17447)

(declare-fun mapKey!56710 () (_ BitVec 32))

(declare-fun mapRest!56710 () (Array (_ BitVec 32) ValueCell!17447))

(assert (=> mapNonEmpty!56710 (= (arr!43646 _values!1320) (store mapRest!56710 mapKey!56710 mapValue!56710))))

(declare-fun b!1333706 () Bool)

(declare-fun res!884725 () Bool)

(assert (=> b!1333706 (=> (not res!884725) (not e!759904))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54025)

(declare-fun zeroValue!1262 () V!54025)

(declare-datatypes ((tuple2!23772 0))(
  ( (tuple2!23773 (_1!11897 (_ BitVec 64)) (_2!11897 V!54025)) )
))
(declare-datatypes ((List!30930 0))(
  ( (Nil!30927) (Cons!30926 (h!32144 tuple2!23772) (t!45116 List!30930)) )
))
(declare-datatypes ((ListLongMap!21437 0))(
  ( (ListLongMap!21438 (toList!10734 List!30930)) )
))
(declare-fun contains!8910 (ListLongMap!21437 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5699 (array!90367 array!90369 (_ BitVec 32) (_ BitVec 32) V!54025 V!54025 (_ BitVec 32) Int) ListLongMap!21437)

(assert (=> b!1333706 (= res!884725 (contains!8910 (getCurrentListMap!5699 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333707 () Bool)

(assert (=> b!1333707 (= e!759904 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun lt!592468 () ListLongMap!21437)

(declare-fun +!4742 (ListLongMap!21437 tuple2!23772) ListLongMap!21437)

(assert (=> b!1333707 (contains!8910 (+!4742 lt!592468 (tuple2!23773 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43794 0))(
  ( (Unit!43795) )
))
(declare-fun lt!592467 () Unit!43794)

(declare-fun addStillContains!1188 (ListLongMap!21437 (_ BitVec 64) V!54025 (_ BitVec 64)) Unit!43794)

(assert (=> b!1333707 (= lt!592467 (addStillContains!1188 lt!592468 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333707 (contains!8910 lt!592468 k0!1153)))

(declare-fun lt!592465 () Unit!43794)

(declare-fun lt!592466 () V!54025)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!285 ((_ BitVec 64) (_ BitVec 64) V!54025 ListLongMap!21437) Unit!43794)

(assert (=> b!1333707 (= lt!592465 (lemmaInListMapAfterAddingDiffThenInBefore!285 k0!1153 (select (arr!43645 _keys!1590) from!1980) lt!592466 lt!592468))))

(declare-fun lt!592470 () ListLongMap!21437)

(assert (=> b!1333707 (contains!8910 lt!592470 k0!1153)))

(declare-fun lt!592469 () Unit!43794)

(assert (=> b!1333707 (= lt!592469 (lemmaInListMapAfterAddingDiffThenInBefore!285 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592470))))

(assert (=> b!1333707 (= lt!592470 (+!4742 lt!592468 (tuple2!23773 (select (arr!43645 _keys!1590) from!1980) lt!592466)))))

(declare-fun get!22035 (ValueCell!17447 V!54025) V!54025)

(declare-fun dynLambda!3696 (Int (_ BitVec 64)) V!54025)

(assert (=> b!1333707 (= lt!592466 (get!22035 (select (arr!43646 _values!1320) from!1980) (dynLambda!3696 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6386 (array!90367 array!90369 (_ BitVec 32) (_ BitVec 32) V!54025 V!54025 (_ BitVec 32) Int) ListLongMap!21437)

(assert (=> b!1333707 (= lt!592468 (getCurrentListMapNoExtraKeys!6386 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1333708 () Bool)

(assert (=> b!1333708 (= e!759902 tp_is_empty!36691)))

(declare-fun b!1333709 () Bool)

(declare-fun res!884719 () Bool)

(assert (=> b!1333709 (=> (not res!884719) (not e!759904))))

(assert (=> b!1333709 (= res!884719 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1333710 () Bool)

(declare-fun res!884721 () Bool)

(assert (=> b!1333710 (=> (not res!884721) (not e!759904))))

(assert (=> b!1333710 (= res!884721 (not (= (select (arr!43645 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333711 () Bool)

(declare-fun res!884722 () Bool)

(assert (=> b!1333711 (=> (not res!884722) (not e!759904))))

(assert (=> b!1333711 (= res!884722 (and (= (size!44197 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44196 _keys!1590) (size!44197 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112610 res!884726) b!1333711))

(assert (= (and b!1333711 res!884722) b!1333700))

(assert (= (and b!1333700 res!884724) b!1333702))

(assert (= (and b!1333702 res!884718) b!1333705))

(assert (= (and b!1333705 res!884723) b!1333706))

(assert (= (and b!1333706 res!884725) b!1333710))

(assert (= (and b!1333710 res!884721) b!1333704))

(assert (= (and b!1333704 res!884720) b!1333709))

(assert (= (and b!1333709 res!884719) b!1333707))

(assert (= (and b!1333703 condMapEmpty!56710) mapIsEmpty!56710))

(assert (= (and b!1333703 (not condMapEmpty!56710)) mapNonEmpty!56710))

(get-info :version)

(assert (= (and mapNonEmpty!56710 ((_ is ValueCellFull!17447) mapValue!56710)) b!1333701))

(assert (= (and b!1333703 ((_ is ValueCellFull!17447) mapDefault!56710)) b!1333708))

(assert (= start!112610 b!1333703))

(declare-fun b_lambda!24035 () Bool)

(assert (=> (not b_lambda!24035) (not b!1333707)))

(declare-fun t!45114 () Bool)

(declare-fun tb!11989 () Bool)

(assert (=> (and start!112610 (= defaultEntry!1323 defaultEntry!1323) t!45114) tb!11989))

(declare-fun result!25057 () Bool)

(assert (=> tb!11989 (= result!25057 tp_is_empty!36691)))

(assert (=> b!1333707 t!45114))

(declare-fun b_and!49621 () Bool)

(assert (= b_and!49619 (and (=> t!45114 result!25057) b_and!49621)))

(declare-fun m!1222805 () Bool)

(assert (=> b!1333710 m!1222805))

(declare-fun m!1222807 () Bool)

(assert (=> start!112610 m!1222807))

(declare-fun m!1222809 () Bool)

(assert (=> start!112610 m!1222809))

(declare-fun m!1222811 () Bool)

(assert (=> start!112610 m!1222811))

(declare-fun m!1222813 () Bool)

(assert (=> mapNonEmpty!56710 m!1222813))

(declare-fun m!1222815 () Bool)

(assert (=> b!1333706 m!1222815))

(assert (=> b!1333706 m!1222815))

(declare-fun m!1222817 () Bool)

(assert (=> b!1333706 m!1222817))

(declare-fun m!1222819 () Bool)

(assert (=> b!1333700 m!1222819))

(declare-fun m!1222821 () Bool)

(assert (=> b!1333702 m!1222821))

(declare-fun m!1222823 () Bool)

(assert (=> b!1333707 m!1222823))

(declare-fun m!1222825 () Bool)

(assert (=> b!1333707 m!1222825))

(declare-fun m!1222827 () Bool)

(assert (=> b!1333707 m!1222827))

(declare-fun m!1222829 () Bool)

(assert (=> b!1333707 m!1222829))

(declare-fun m!1222831 () Bool)

(assert (=> b!1333707 m!1222831))

(assert (=> b!1333707 m!1222805))

(declare-fun m!1222833 () Bool)

(assert (=> b!1333707 m!1222833))

(declare-fun m!1222835 () Bool)

(assert (=> b!1333707 m!1222835))

(declare-fun m!1222837 () Bool)

(assert (=> b!1333707 m!1222837))

(declare-fun m!1222839 () Bool)

(assert (=> b!1333707 m!1222839))

(assert (=> b!1333707 m!1222825))

(assert (=> b!1333707 m!1222805))

(assert (=> b!1333707 m!1222827))

(declare-fun m!1222841 () Bool)

(assert (=> b!1333707 m!1222841))

(declare-fun m!1222843 () Bool)

(assert (=> b!1333707 m!1222843))

(assert (=> b!1333707 m!1222841))

(declare-fun m!1222845 () Bool)

(assert (=> b!1333707 m!1222845))

(assert (=> b!1333704 m!1222805))

(assert (=> b!1333704 m!1222805))

(declare-fun m!1222847 () Bool)

(assert (=> b!1333704 m!1222847))

(check-sat tp_is_empty!36691 (not b_lambda!24035) (not b!1333706) (not b!1333707) (not mapNonEmpty!56710) (not start!112610) (not b!1333702) (not b!1333704) (not b_next!30781) (not b!1333700) b_and!49621)
(check-sat b_and!49621 (not b_next!30781))
