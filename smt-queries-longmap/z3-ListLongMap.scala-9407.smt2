; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111964 () Bool)

(assert start!111964)

(declare-fun b_free!30537 () Bool)

(declare-fun b_next!30537 () Bool)

(assert (=> start!111964 (= b_free!30537 (not b_next!30537))))

(declare-fun tp!107094 () Bool)

(declare-fun b_and!49175 () Bool)

(assert (=> start!111964 (= tp!107094 b_and!49175)))

(declare-fun res!880611 () Bool)

(declare-fun e!756253 () Bool)

(assert (=> start!111964 (=> (not res!880611) (not e!756253))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111964 (= res!880611 (validMask!0 mask!2019))))

(assert (=> start!111964 e!756253))

(declare-datatypes ((array!89622 0))(
  ( (array!89623 (arr!43283 (Array (_ BitVec 32) (_ BitVec 64))) (size!43833 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89622)

(declare-fun array_inv!32671 (array!89622) Bool)

(assert (=> start!111964 (array_inv!32671 _keys!1609)))

(assert (=> start!111964 true))

(declare-fun tp_is_empty!36357 () Bool)

(assert (=> start!111964 tp_is_empty!36357))

(declare-datatypes ((V!53579 0))(
  ( (V!53580 (val!18253 Int)) )
))
(declare-datatypes ((ValueCell!17280 0))(
  ( (ValueCellFull!17280 (v!20887 V!53579)) (EmptyCell!17280) )
))
(declare-datatypes ((array!89624 0))(
  ( (array!89625 (arr!43284 (Array (_ BitVec 32) ValueCell!17280)) (size!43834 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89624)

(declare-fun e!756251 () Bool)

(declare-fun array_inv!32672 (array!89624) Bool)

(assert (=> start!111964 (and (array_inv!32672 _values!1337) e!756251)))

(assert (=> start!111964 tp!107094))

(declare-fun b!1326877 () Bool)

(declare-fun res!880607 () Bool)

(assert (=> b!1326877 (=> (not res!880607) (not e!756253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89622 (_ BitVec 32)) Bool)

(assert (=> b!1326877 (= res!880607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326878 () Bool)

(declare-fun res!880608 () Bool)

(assert (=> b!1326878 (=> (not res!880608) (not e!756253))))

(declare-datatypes ((List!30688 0))(
  ( (Nil!30685) (Cons!30684 (h!31893 (_ BitVec 64)) (t!44692 List!30688)) )
))
(declare-fun arrayNoDuplicates!0 (array!89622 (_ BitVec 32) List!30688) Bool)

(assert (=> b!1326878 (= res!880608 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30685))))

(declare-fun b!1326879 () Bool)

(declare-fun res!880610 () Bool)

(assert (=> b!1326879 (=> (not res!880610) (not e!756253))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326879 (= res!880610 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326880 () Bool)

(declare-fun e!756254 () Bool)

(assert (=> b!1326880 (= e!756254 tp_is_empty!36357)))

(declare-fun zeroValue!1279 () V!53579)

(declare-fun minValue!1279 () V!53579)

(declare-fun defaultEntry!1340 () Int)

(declare-fun b!1326881 () Bool)

(declare-datatypes ((tuple2!23552 0))(
  ( (tuple2!23553 (_1!11787 (_ BitVec 64)) (_2!11787 V!53579)) )
))
(declare-datatypes ((List!30689 0))(
  ( (Nil!30686) (Cons!30685 (h!31894 tuple2!23552) (t!44693 List!30689)) )
))
(declare-datatypes ((ListLongMap!21209 0))(
  ( (ListLongMap!21210 (toList!10620 List!30689)) )
))
(declare-fun contains!8779 (ListLongMap!21209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5611 (array!89622 array!89624 (_ BitVec 32) (_ BitVec 32) V!53579 V!53579 (_ BitVec 32) Int) ListLongMap!21209)

(assert (=> b!1326881 (= e!756253 (not (contains!8779 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164)))))

(declare-fun b!1326882 () Bool)

(declare-fun e!756250 () Bool)

(assert (=> b!1326882 (= e!756250 tp_is_empty!36357)))

(declare-fun b!1326883 () Bool)

(declare-fun res!880605 () Bool)

(assert (=> b!1326883 (=> (not res!880605) (not e!756253))))

(assert (=> b!1326883 (= res!880605 (not (= (select (arr!43283 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1326884 () Bool)

(declare-fun res!880612 () Bool)

(assert (=> b!1326884 (=> (not res!880612) (not e!756253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326884 (= res!880612 (not (validKeyInArray!0 (select (arr!43283 _keys!1609) from!2000))))))

(declare-fun b!1326885 () Bool)

(declare-fun res!880609 () Bool)

(assert (=> b!1326885 (=> (not res!880609) (not e!756253))))

(assert (=> b!1326885 (= res!880609 (contains!8779 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326886 () Bool)

(declare-fun mapRes!56190 () Bool)

(assert (=> b!1326886 (= e!756251 (and e!756254 mapRes!56190))))

(declare-fun condMapEmpty!56190 () Bool)

(declare-fun mapDefault!56190 () ValueCell!17280)

(assert (=> b!1326886 (= condMapEmpty!56190 (= (arr!43284 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17280)) mapDefault!56190)))))

(declare-fun mapIsEmpty!56190 () Bool)

(assert (=> mapIsEmpty!56190 mapRes!56190))

(declare-fun b!1326887 () Bool)

(declare-fun res!880606 () Bool)

(assert (=> b!1326887 (=> (not res!880606) (not e!756253))))

(assert (=> b!1326887 (= res!880606 (and (= (size!43834 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43833 _keys!1609) (size!43834 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56190 () Bool)

(declare-fun tp!107093 () Bool)

(assert (=> mapNonEmpty!56190 (= mapRes!56190 (and tp!107093 e!756250))))

(declare-fun mapKey!56190 () (_ BitVec 32))

(declare-fun mapRest!56190 () (Array (_ BitVec 32) ValueCell!17280))

(declare-fun mapValue!56190 () ValueCell!17280)

(assert (=> mapNonEmpty!56190 (= (arr!43284 _values!1337) (store mapRest!56190 mapKey!56190 mapValue!56190))))

(assert (= (and start!111964 res!880611) b!1326887))

(assert (= (and b!1326887 res!880606) b!1326877))

(assert (= (and b!1326877 res!880607) b!1326878))

(assert (= (and b!1326878 res!880608) b!1326879))

(assert (= (and b!1326879 res!880610) b!1326885))

(assert (= (and b!1326885 res!880609) b!1326883))

(assert (= (and b!1326883 res!880605) b!1326884))

(assert (= (and b!1326884 res!880612) b!1326881))

(assert (= (and b!1326886 condMapEmpty!56190) mapIsEmpty!56190))

(assert (= (and b!1326886 (not condMapEmpty!56190)) mapNonEmpty!56190))

(get-info :version)

(assert (= (and mapNonEmpty!56190 ((_ is ValueCellFull!17280) mapValue!56190)) b!1326882))

(assert (= (and b!1326886 ((_ is ValueCellFull!17280) mapDefault!56190)) b!1326880))

(assert (= start!111964 b!1326886))

(declare-fun m!1216047 () Bool)

(assert (=> b!1326884 m!1216047))

(assert (=> b!1326884 m!1216047))

(declare-fun m!1216049 () Bool)

(assert (=> b!1326884 m!1216049))

(declare-fun m!1216051 () Bool)

(assert (=> b!1326881 m!1216051))

(assert (=> b!1326881 m!1216051))

(declare-fun m!1216053 () Bool)

(assert (=> b!1326881 m!1216053))

(declare-fun m!1216055 () Bool)

(assert (=> mapNonEmpty!56190 m!1216055))

(declare-fun m!1216057 () Bool)

(assert (=> b!1326877 m!1216057))

(declare-fun m!1216059 () Bool)

(assert (=> b!1326878 m!1216059))

(declare-fun m!1216061 () Bool)

(assert (=> b!1326885 m!1216061))

(assert (=> b!1326885 m!1216061))

(declare-fun m!1216063 () Bool)

(assert (=> b!1326885 m!1216063))

(assert (=> b!1326883 m!1216047))

(declare-fun m!1216065 () Bool)

(assert (=> start!111964 m!1216065))

(declare-fun m!1216067 () Bool)

(assert (=> start!111964 m!1216067))

(declare-fun m!1216069 () Bool)

(assert (=> start!111964 m!1216069))

(check-sat (not b!1326878) (not b!1326881) (not mapNonEmpty!56190) (not start!111964) tp_is_empty!36357 (not b!1326877) (not b!1326885) (not b!1326884) b_and!49175 (not b_next!30537))
(check-sat b_and!49175 (not b_next!30537))
(get-model)

(declare-fun b!1326931 () Bool)

(declare-fun e!756279 () Bool)

(declare-fun call!64773 () Bool)

(assert (=> b!1326931 (= e!756279 call!64773)))

(declare-fun b!1326932 () Bool)

(declare-fun e!756281 () Bool)

(declare-fun contains!8781 (List!30688 (_ BitVec 64)) Bool)

(assert (=> b!1326932 (= e!756281 (contains!8781 Nil!30685 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326933 () Bool)

(declare-fun e!756278 () Bool)

(assert (=> b!1326933 (= e!756278 e!756279)))

(declare-fun c!125811 () Bool)

(assert (=> b!1326933 (= c!125811 (validKeyInArray!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143143 () Bool)

(declare-fun res!880643 () Bool)

(declare-fun e!756280 () Bool)

(assert (=> d!143143 (=> res!880643 e!756280)))

(assert (=> d!143143 (= res!880643 (bvsge #b00000000000000000000000000000000 (size!43833 _keys!1609)))))

(assert (=> d!143143 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30685) e!756280)))

(declare-fun b!1326934 () Bool)

(assert (=> b!1326934 (= e!756280 e!756278)))

(declare-fun res!880645 () Bool)

(assert (=> b!1326934 (=> (not res!880645) (not e!756278))))

(assert (=> b!1326934 (= res!880645 (not e!756281))))

(declare-fun res!880644 () Bool)

(assert (=> b!1326934 (=> (not res!880644) (not e!756281))))

(assert (=> b!1326934 (= res!880644 (validKeyInArray!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1326935 () Bool)

(assert (=> b!1326935 (= e!756279 call!64773)))

(declare-fun bm!64770 () Bool)

(assert (=> bm!64770 (= call!64773 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125811 (Cons!30684 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) Nil!30685) Nil!30685)))))

(assert (= (and d!143143 (not res!880643)) b!1326934))

(assert (= (and b!1326934 res!880644) b!1326932))

(assert (= (and b!1326934 res!880645) b!1326933))

(assert (= (and b!1326933 c!125811) b!1326931))

(assert (= (and b!1326933 (not c!125811)) b!1326935))

(assert (= (or b!1326931 b!1326935) bm!64770))

(declare-fun m!1216095 () Bool)

(assert (=> b!1326932 m!1216095))

(assert (=> b!1326932 m!1216095))

(declare-fun m!1216097 () Bool)

(assert (=> b!1326932 m!1216097))

(assert (=> b!1326933 m!1216095))

(assert (=> b!1326933 m!1216095))

(declare-fun m!1216099 () Bool)

(assert (=> b!1326933 m!1216099))

(assert (=> b!1326934 m!1216095))

(assert (=> b!1326934 m!1216095))

(assert (=> b!1326934 m!1216099))

(assert (=> bm!64770 m!1216095))

(declare-fun m!1216101 () Bool)

(assert (=> bm!64770 m!1216101))

(assert (=> b!1326878 d!143143))

(declare-fun d!143145 () Bool)

(assert (=> d!143145 (= (validKeyInArray!0 (select (arr!43283 _keys!1609) from!2000)) (and (not (= (select (arr!43283 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43283 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326884 d!143145))

(declare-fun d!143147 () Bool)

(declare-fun e!756286 () Bool)

(assert (=> d!143147 e!756286))

(declare-fun res!880648 () Bool)

(assert (=> d!143147 (=> res!880648 e!756286)))

(declare-fun lt!590440 () Bool)

(assert (=> d!143147 (= res!880648 (not lt!590440))))

(declare-fun lt!590441 () Bool)

(assert (=> d!143147 (= lt!590440 lt!590441)))

(declare-datatypes ((Unit!43717 0))(
  ( (Unit!43718) )
))
(declare-fun lt!590443 () Unit!43717)

(declare-fun e!756287 () Unit!43717)

(assert (=> d!143147 (= lt!590443 e!756287)))

(declare-fun c!125814 () Bool)

(assert (=> d!143147 (= c!125814 lt!590441)))

(declare-fun containsKey!736 (List!30689 (_ BitVec 64)) Bool)

(assert (=> d!143147 (= lt!590441 (containsKey!736 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!143147 (= (contains!8779 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!590440)))

(declare-fun b!1326942 () Bool)

(declare-fun lt!590442 () Unit!43717)

(assert (=> b!1326942 (= e!756287 lt!590442)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!482 (List!30689 (_ BitVec 64)) Unit!43717)

(assert (=> b!1326942 (= lt!590442 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-datatypes ((Option!766 0))(
  ( (Some!765 (v!20889 V!53579)) (None!764) )
))
(declare-fun isDefined!521 (Option!766) Bool)

(declare-fun getValueByKey!714 (List!30689 (_ BitVec 64)) Option!766)

(assert (=> b!1326942 (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1326943 () Bool)

(declare-fun Unit!43719 () Unit!43717)

(assert (=> b!1326943 (= e!756287 Unit!43719)))

(declare-fun b!1326944 () Bool)

(assert (=> b!1326944 (= e!756286 (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143147 c!125814) b!1326942))

(assert (= (and d!143147 (not c!125814)) b!1326943))

(assert (= (and d!143147 (not res!880648)) b!1326944))

(declare-fun m!1216103 () Bool)

(assert (=> d!143147 m!1216103))

(declare-fun m!1216105 () Bool)

(assert (=> b!1326942 m!1216105))

(declare-fun m!1216107 () Bool)

(assert (=> b!1326942 m!1216107))

(assert (=> b!1326942 m!1216107))

(declare-fun m!1216109 () Bool)

(assert (=> b!1326942 m!1216109))

(assert (=> b!1326944 m!1216107))

(assert (=> b!1326944 m!1216107))

(assert (=> b!1326944 m!1216109))

(assert (=> b!1326885 d!143147))

(declare-fun bm!64785 () Bool)

(declare-fun call!64794 () Bool)

(declare-fun lt!590503 () ListLongMap!21209)

(assert (=> bm!64785 (= call!64794 (contains!8779 lt!590503 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1326988 () Bool)

(declare-fun e!756324 () Bool)

(assert (=> b!1326988 (= e!756324 (validKeyInArray!0 (select (arr!43283 _keys!1609) from!2000)))))

(declare-fun b!1326989 () Bool)

(declare-fun res!880675 () Bool)

(declare-fun e!756314 () Bool)

(assert (=> b!1326989 (=> (not res!880675) (not e!756314))))

(declare-fun e!756319 () Bool)

(assert (=> b!1326989 (= res!880675 e!756319)))

(declare-fun res!880674 () Bool)

(assert (=> b!1326989 (=> res!880674 e!756319)))

(declare-fun e!756322 () Bool)

(assert (=> b!1326989 (= res!880674 (not e!756322))))

(declare-fun res!880668 () Bool)

(assert (=> b!1326989 (=> (not res!880668) (not e!756322))))

(assert (=> b!1326989 (= res!880668 (bvslt from!2000 (size!43833 _keys!1609)))))

(declare-fun b!1326990 () Bool)

(declare-fun e!756325 () Bool)

(declare-fun apply!1031 (ListLongMap!21209 (_ BitVec 64)) V!53579)

(assert (=> b!1326990 (= e!756325 (= (apply!1031 lt!590503 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1326991 () Bool)

(declare-fun e!756326 () ListLongMap!21209)

(declare-fun call!64792 () ListLongMap!21209)

(assert (=> b!1326991 (= e!756326 call!64792)))

(declare-fun b!1326992 () Bool)

(declare-fun e!756318 () Bool)

(assert (=> b!1326992 (= e!756314 e!756318)))

(declare-fun c!125829 () Bool)

(assert (=> b!1326992 (= c!125829 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326993 () Bool)

(declare-fun e!756320 () ListLongMap!21209)

(assert (=> b!1326993 (= e!756320 e!756326)))

(declare-fun c!125830 () Bool)

(assert (=> b!1326993 (= c!125830 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1326994 () Bool)

(declare-fun e!756317 () ListLongMap!21209)

(declare-fun call!64793 () ListLongMap!21209)

(assert (=> b!1326994 (= e!756317 call!64793)))

(declare-fun call!64788 () ListLongMap!21209)

(declare-fun bm!64786 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!6278 (array!89622 array!89624 (_ BitVec 32) (_ BitVec 32) V!53579 V!53579 (_ BitVec 32) Int) ListLongMap!21209)

(assert (=> bm!64786 (= call!64788 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1326995 () Bool)

(declare-fun e!756315 () Bool)

(assert (=> b!1326995 (= e!756315 (= (apply!1031 lt!590503 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1326996 () Bool)

(declare-fun e!756321 () Unit!43717)

(declare-fun Unit!43720 () Unit!43717)

(assert (=> b!1326996 (= e!756321 Unit!43720)))

(declare-fun b!1326997 () Bool)

(assert (=> b!1326997 (= e!756318 e!756325)))

(declare-fun res!880672 () Bool)

(declare-fun call!64791 () Bool)

(assert (=> b!1326997 (= res!880672 call!64791)))

(assert (=> b!1326997 (=> (not res!880672) (not e!756325))))

(declare-fun c!125831 () Bool)

(declare-fun call!64790 () ListLongMap!21209)

(declare-fun bm!64787 () Bool)

(declare-fun call!64789 () ListLongMap!21209)

(declare-fun +!4640 (ListLongMap!21209 tuple2!23552) ListLongMap!21209)

(assert (=> bm!64787 (= call!64789 (+!4640 (ite c!125831 call!64788 (ite c!125830 call!64790 call!64793)) (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1326998 () Bool)

(declare-fun lt!590509 () Unit!43717)

(assert (=> b!1326998 (= e!756321 lt!590509)))

(declare-fun lt!590493 () ListLongMap!21209)

(assert (=> b!1326998 (= lt!590493 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590491 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590491 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590499 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590499 (select (arr!43283 _keys!1609) from!2000))))

(declare-fun lt!590508 () Unit!43717)

(declare-fun addStillContains!1164 (ListLongMap!21209 (_ BitVec 64) V!53579 (_ BitVec 64)) Unit!43717)

(assert (=> b!1326998 (= lt!590508 (addStillContains!1164 lt!590493 lt!590491 zeroValue!1279 lt!590499))))

(assert (=> b!1326998 (contains!8779 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279)) lt!590499)))

(declare-fun lt!590507 () Unit!43717)

(assert (=> b!1326998 (= lt!590507 lt!590508)))

(declare-fun lt!590500 () ListLongMap!21209)

(assert (=> b!1326998 (= lt!590500 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590496 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590496 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590505 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590505 (select (arr!43283 _keys!1609) from!2000))))

(declare-fun lt!590492 () Unit!43717)

(declare-fun addApplyDifferent!573 (ListLongMap!21209 (_ BitVec 64) V!53579 (_ BitVec 64)) Unit!43717)

(assert (=> b!1326998 (= lt!590492 (addApplyDifferent!573 lt!590500 lt!590496 minValue!1279 lt!590505))))

(assert (=> b!1326998 (= (apply!1031 (+!4640 lt!590500 (tuple2!23553 lt!590496 minValue!1279)) lt!590505) (apply!1031 lt!590500 lt!590505))))

(declare-fun lt!590495 () Unit!43717)

(assert (=> b!1326998 (= lt!590495 lt!590492)))

(declare-fun lt!590488 () ListLongMap!21209)

(assert (=> b!1326998 (= lt!590488 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590489 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590489 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590497 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590497 (select (arr!43283 _keys!1609) from!2000))))

(declare-fun lt!590498 () Unit!43717)

(assert (=> b!1326998 (= lt!590498 (addApplyDifferent!573 lt!590488 lt!590489 zeroValue!1279 lt!590497))))

(assert (=> b!1326998 (= (apply!1031 (+!4640 lt!590488 (tuple2!23553 lt!590489 zeroValue!1279)) lt!590497) (apply!1031 lt!590488 lt!590497))))

(declare-fun lt!590501 () Unit!43717)

(assert (=> b!1326998 (= lt!590501 lt!590498)))

(declare-fun lt!590490 () ListLongMap!21209)

(assert (=> b!1326998 (= lt!590490 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!590506 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590506 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590502 () (_ BitVec 64))

(assert (=> b!1326998 (= lt!590502 (select (arr!43283 _keys!1609) from!2000))))

(assert (=> b!1326998 (= lt!590509 (addApplyDifferent!573 lt!590490 lt!590506 minValue!1279 lt!590502))))

(assert (=> b!1326998 (= (apply!1031 (+!4640 lt!590490 (tuple2!23553 lt!590506 minValue!1279)) lt!590502) (apply!1031 lt!590490 lt!590502))))

(declare-fun d!143149 () Bool)

(assert (=> d!143149 e!756314))

(declare-fun res!880673 () Bool)

(assert (=> d!143149 (=> (not res!880673) (not e!756314))))

(assert (=> d!143149 (= res!880673 (or (bvsge from!2000 (size!43833 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)))))))

(declare-fun lt!590494 () ListLongMap!21209)

(assert (=> d!143149 (= lt!590503 lt!590494)))

(declare-fun lt!590504 () Unit!43717)

(assert (=> d!143149 (= lt!590504 e!756321)))

(declare-fun c!125828 () Bool)

(assert (=> d!143149 (= c!125828 e!756324)))

(declare-fun res!880670 () Bool)

(assert (=> d!143149 (=> (not res!880670) (not e!756324))))

(assert (=> d!143149 (= res!880670 (bvslt from!2000 (size!43833 _keys!1609)))))

(assert (=> d!143149 (= lt!590494 e!756320)))

(assert (=> d!143149 (= c!125831 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143149 (validMask!0 mask!2019)))

(assert (=> d!143149 (= (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590503)))

(declare-fun b!1326987 () Bool)

(declare-fun c!125832 () Bool)

(assert (=> b!1326987 (= c!125832 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1326987 (= e!756326 e!756317)))

(declare-fun b!1326999 () Bool)

(declare-fun e!756316 () Bool)

(declare-fun get!21815 (ValueCell!17280 V!53579) V!53579)

(declare-fun dynLambda!3579 (Int (_ BitVec 64)) V!53579)

(assert (=> b!1326999 (= e!756316 (= (apply!1031 lt!590503 (select (arr!43283 _keys!1609) from!2000)) (get!21815 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326999 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43834 _values!1337)))))

(assert (=> b!1326999 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)))))

(declare-fun bm!64788 () Bool)

(assert (=> bm!64788 (= call!64793 call!64790)))

(declare-fun bm!64789 () Bool)

(assert (=> bm!64789 (= call!64791 (contains!8779 lt!590503 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327000 () Bool)

(assert (=> b!1327000 (= e!756318 (not call!64791))))

(declare-fun b!1327001 () Bool)

(declare-fun e!756323 () Bool)

(assert (=> b!1327001 (= e!756323 (not call!64794))))

(declare-fun b!1327002 () Bool)

(declare-fun res!880669 () Bool)

(assert (=> b!1327002 (=> (not res!880669) (not e!756314))))

(assert (=> b!1327002 (= res!880669 e!756323)))

(declare-fun c!125827 () Bool)

(assert (=> b!1327002 (= c!125827 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1327003 () Bool)

(assert (=> b!1327003 (= e!756320 (+!4640 call!64789 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun bm!64790 () Bool)

(assert (=> bm!64790 (= call!64792 call!64789)))

(declare-fun b!1327004 () Bool)

(assert (=> b!1327004 (= e!756322 (validKeyInArray!0 (select (arr!43283 _keys!1609) from!2000)))))

(declare-fun bm!64791 () Bool)

(assert (=> bm!64791 (= call!64790 call!64788)))

(declare-fun b!1327005 () Bool)

(assert (=> b!1327005 (= e!756319 e!756316)))

(declare-fun res!880667 () Bool)

(assert (=> b!1327005 (=> (not res!880667) (not e!756316))))

(assert (=> b!1327005 (= res!880667 (contains!8779 lt!590503 (select (arr!43283 _keys!1609) from!2000)))))

(assert (=> b!1327005 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)))))

(declare-fun b!1327006 () Bool)

(assert (=> b!1327006 (= e!756323 e!756315)))

(declare-fun res!880671 () Bool)

(assert (=> b!1327006 (= res!880671 call!64794)))

(assert (=> b!1327006 (=> (not res!880671) (not e!756315))))

(declare-fun b!1327007 () Bool)

(assert (=> b!1327007 (= e!756317 call!64792)))

(assert (= (and d!143149 c!125831) b!1327003))

(assert (= (and d!143149 (not c!125831)) b!1326993))

(assert (= (and b!1326993 c!125830) b!1326991))

(assert (= (and b!1326993 (not c!125830)) b!1326987))

(assert (= (and b!1326987 c!125832) b!1327007))

(assert (= (and b!1326987 (not c!125832)) b!1326994))

(assert (= (or b!1327007 b!1326994) bm!64788))

(assert (= (or b!1326991 bm!64788) bm!64791))

(assert (= (or b!1326991 b!1327007) bm!64790))

(assert (= (or b!1327003 bm!64791) bm!64786))

(assert (= (or b!1327003 bm!64790) bm!64787))

(assert (= (and d!143149 res!880670) b!1326988))

(assert (= (and d!143149 c!125828) b!1326998))

(assert (= (and d!143149 (not c!125828)) b!1326996))

(assert (= (and d!143149 res!880673) b!1326989))

(assert (= (and b!1326989 res!880668) b!1327004))

(assert (= (and b!1326989 (not res!880674)) b!1327005))

(assert (= (and b!1327005 res!880667) b!1326999))

(assert (= (and b!1326989 res!880675) b!1327002))

(assert (= (and b!1327002 c!125827) b!1327006))

(assert (= (and b!1327002 (not c!125827)) b!1327001))

(assert (= (and b!1327006 res!880671) b!1326995))

(assert (= (or b!1327006 b!1327001) bm!64785))

(assert (= (and b!1327002 res!880669) b!1326992))

(assert (= (and b!1326992 c!125829) b!1326997))

(assert (= (and b!1326992 (not c!125829)) b!1327000))

(assert (= (and b!1326997 res!880672) b!1326990))

(assert (= (or b!1326997 b!1327000) bm!64789))

(declare-fun b_lambda!23831 () Bool)

(assert (=> (not b_lambda!23831) (not b!1326999)))

(declare-fun t!44696 () Bool)

(declare-fun tb!11809 () Bool)

(assert (=> (and start!111964 (= defaultEntry!1340 defaultEntry!1340) t!44696) tb!11809))

(declare-fun result!24677 () Bool)

(assert (=> tb!11809 (= result!24677 tp_is_empty!36357)))

(assert (=> b!1326999 t!44696))

(declare-fun b_and!49179 () Bool)

(assert (= b_and!49175 (and (=> t!44696 result!24677) b_and!49179)))

(assert (=> b!1326988 m!1216047))

(assert (=> b!1326988 m!1216047))

(assert (=> b!1326988 m!1216049))

(declare-fun m!1216111 () Bool)

(assert (=> b!1327003 m!1216111))

(assert (=> d!143149 m!1216065))

(declare-fun m!1216113 () Bool)

(assert (=> bm!64785 m!1216113))

(assert (=> b!1327005 m!1216047))

(assert (=> b!1327005 m!1216047))

(declare-fun m!1216115 () Bool)

(assert (=> b!1327005 m!1216115))

(declare-fun m!1216117 () Bool)

(assert (=> bm!64787 m!1216117))

(declare-fun m!1216119 () Bool)

(assert (=> b!1326995 m!1216119))

(declare-fun m!1216121 () Bool)

(assert (=> b!1326998 m!1216121))

(declare-fun m!1216123 () Bool)

(assert (=> b!1326998 m!1216123))

(assert (=> b!1326998 m!1216047))

(assert (=> b!1326998 m!1216121))

(declare-fun m!1216125 () Bool)

(assert (=> b!1326998 m!1216125))

(declare-fun m!1216127 () Bool)

(assert (=> b!1326998 m!1216127))

(declare-fun m!1216129 () Bool)

(assert (=> b!1326998 m!1216129))

(declare-fun m!1216131 () Bool)

(assert (=> b!1326998 m!1216131))

(declare-fun m!1216133 () Bool)

(assert (=> b!1326998 m!1216133))

(declare-fun m!1216135 () Bool)

(assert (=> b!1326998 m!1216135))

(declare-fun m!1216137 () Bool)

(assert (=> b!1326998 m!1216137))

(declare-fun m!1216139 () Bool)

(assert (=> b!1326998 m!1216139))

(declare-fun m!1216141 () Bool)

(assert (=> b!1326998 m!1216141))

(declare-fun m!1216143 () Bool)

(assert (=> b!1326998 m!1216143))

(assert (=> b!1326998 m!1216139))

(declare-fun m!1216145 () Bool)

(assert (=> b!1326998 m!1216145))

(assert (=> b!1326998 m!1216145))

(declare-fun m!1216147 () Bool)

(assert (=> b!1326998 m!1216147))

(assert (=> b!1326998 m!1216129))

(declare-fun m!1216149 () Bool)

(assert (=> b!1326998 m!1216149))

(declare-fun m!1216151 () Bool)

(assert (=> b!1326998 m!1216151))

(declare-fun m!1216153 () Bool)

(assert (=> b!1326990 m!1216153))

(assert (=> bm!64786 m!1216143))

(declare-fun m!1216155 () Bool)

(assert (=> b!1326999 m!1216155))

(assert (=> b!1326999 m!1216047))

(declare-fun m!1216157 () Bool)

(assert (=> b!1326999 m!1216157))

(assert (=> b!1326999 m!1216047))

(declare-fun m!1216159 () Bool)

(assert (=> b!1326999 m!1216159))

(assert (=> b!1326999 m!1216159))

(assert (=> b!1326999 m!1216155))

(declare-fun m!1216161 () Bool)

(assert (=> b!1326999 m!1216161))

(assert (=> b!1327004 m!1216047))

(assert (=> b!1327004 m!1216047))

(assert (=> b!1327004 m!1216049))

(declare-fun m!1216163 () Bool)

(assert (=> bm!64789 m!1216163))

(assert (=> b!1326885 d!143149))

(declare-fun d!143151 () Bool)

(assert (=> d!143151 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111964 d!143151))

(declare-fun d!143153 () Bool)

(assert (=> d!143153 (= (array_inv!32671 _keys!1609) (bvsge (size!43833 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111964 d!143153))

(declare-fun d!143155 () Bool)

(assert (=> d!143155 (= (array_inv!32672 _values!1337) (bvsge (size!43834 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111964 d!143155))

(declare-fun d!143157 () Bool)

(declare-fun e!756327 () Bool)

(assert (=> d!143157 e!756327))

(declare-fun res!880676 () Bool)

(assert (=> d!143157 (=> res!880676 e!756327)))

(declare-fun lt!590510 () Bool)

(assert (=> d!143157 (= res!880676 (not lt!590510))))

(declare-fun lt!590511 () Bool)

(assert (=> d!143157 (= lt!590510 lt!590511)))

(declare-fun lt!590513 () Unit!43717)

(declare-fun e!756328 () Unit!43717)

(assert (=> d!143157 (= lt!590513 e!756328)))

(declare-fun c!125833 () Bool)

(assert (=> d!143157 (= c!125833 lt!590511)))

(assert (=> d!143157 (= lt!590511 (containsKey!736 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> d!143157 (= (contains!8779 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) k0!1164) lt!590510)))

(declare-fun b!1327010 () Bool)

(declare-fun lt!590512 () Unit!43717)

(assert (=> b!1327010 (= e!756328 lt!590512)))

(assert (=> b!1327010 (= lt!590512 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (=> b!1327010 (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun b!1327011 () Bool)

(declare-fun Unit!43721 () Unit!43717)

(assert (=> b!1327011 (= e!756328 Unit!43721)))

(declare-fun b!1327012 () Bool)

(assert (=> b!1327012 (= e!756327 (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)))))

(assert (= (and d!143157 c!125833) b!1327010))

(assert (= (and d!143157 (not c!125833)) b!1327011))

(assert (= (and d!143157 (not res!880676)) b!1327012))

(declare-fun m!1216165 () Bool)

(assert (=> d!143157 m!1216165))

(declare-fun m!1216167 () Bool)

(assert (=> b!1327010 m!1216167))

(declare-fun m!1216169 () Bool)

(assert (=> b!1327010 m!1216169))

(assert (=> b!1327010 m!1216169))

(declare-fun m!1216171 () Bool)

(assert (=> b!1327010 m!1216171))

(assert (=> b!1327012 m!1216169))

(assert (=> b!1327012 m!1216169))

(assert (=> b!1327012 m!1216171))

(assert (=> b!1326881 d!143157))

(declare-fun bm!64792 () Bool)

(declare-fun call!64801 () Bool)

(declare-fun lt!590529 () ListLongMap!21209)

(assert (=> bm!64792 (= call!64801 (contains!8779 lt!590529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327014 () Bool)

(declare-fun e!756339 () Bool)

(assert (=> b!1327014 (= e!756339 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1327015 () Bool)

(declare-fun res!880685 () Bool)

(declare-fun e!756329 () Bool)

(assert (=> b!1327015 (=> (not res!880685) (not e!756329))))

(declare-fun e!756334 () Bool)

(assert (=> b!1327015 (= res!880685 e!756334)))

(declare-fun res!880684 () Bool)

(assert (=> b!1327015 (=> res!880684 e!756334)))

(declare-fun e!756337 () Bool)

(assert (=> b!1327015 (= res!880684 (not e!756337))))

(declare-fun res!880678 () Bool)

(assert (=> b!1327015 (=> (not res!880678) (not e!756337))))

(assert (=> b!1327015 (= res!880678 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(declare-fun b!1327016 () Bool)

(declare-fun e!756340 () Bool)

(assert (=> b!1327016 (= e!756340 (= (apply!1031 lt!590529 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1327017 () Bool)

(declare-fun e!756341 () ListLongMap!21209)

(declare-fun call!64799 () ListLongMap!21209)

(assert (=> b!1327017 (= e!756341 call!64799)))

(declare-fun b!1327018 () Bool)

(declare-fun e!756333 () Bool)

(assert (=> b!1327018 (= e!756329 e!756333)))

(declare-fun c!125836 () Bool)

(assert (=> b!1327018 (= c!125836 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1327019 () Bool)

(declare-fun e!756335 () ListLongMap!21209)

(assert (=> b!1327019 (= e!756335 e!756341)))

(declare-fun c!125837 () Bool)

(assert (=> b!1327019 (= c!125837 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1327020 () Bool)

(declare-fun e!756332 () ListLongMap!21209)

(declare-fun call!64800 () ListLongMap!21209)

(assert (=> b!1327020 (= e!756332 call!64800)))

(declare-fun bm!64793 () Bool)

(declare-fun call!64795 () ListLongMap!21209)

(assert (=> bm!64793 (= call!64795 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1327021 () Bool)

(declare-fun e!756330 () Bool)

(assert (=> b!1327021 (= e!756330 (= (apply!1031 lt!590529 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1327022 () Bool)

(declare-fun e!756336 () Unit!43717)

(declare-fun Unit!43722 () Unit!43717)

(assert (=> b!1327022 (= e!756336 Unit!43722)))

(declare-fun b!1327023 () Bool)

(assert (=> b!1327023 (= e!756333 e!756340)))

(declare-fun res!880682 () Bool)

(declare-fun call!64798 () Bool)

(assert (=> b!1327023 (= res!880682 call!64798)))

(assert (=> b!1327023 (=> (not res!880682) (not e!756340))))

(declare-fun c!125838 () Bool)

(declare-fun call!64797 () ListLongMap!21209)

(declare-fun bm!64794 () Bool)

(declare-fun call!64796 () ListLongMap!21209)

(assert (=> bm!64794 (= call!64796 (+!4640 (ite c!125838 call!64795 (ite c!125837 call!64797 call!64800)) (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1327024 () Bool)

(declare-fun lt!590535 () Unit!43717)

(assert (=> b!1327024 (= e!756336 lt!590535)))

(declare-fun lt!590519 () ListLongMap!21209)

(assert (=> b!1327024 (= lt!590519 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590517 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590517 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590525 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590525 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590534 () Unit!43717)

(assert (=> b!1327024 (= lt!590534 (addStillContains!1164 lt!590519 lt!590517 zeroValue!1279 lt!590525))))

(assert (=> b!1327024 (contains!8779 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279)) lt!590525)))

(declare-fun lt!590533 () Unit!43717)

(assert (=> b!1327024 (= lt!590533 lt!590534)))

(declare-fun lt!590526 () ListLongMap!21209)

(assert (=> b!1327024 (= lt!590526 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590522 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590522 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590531 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590531 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590518 () Unit!43717)

(assert (=> b!1327024 (= lt!590518 (addApplyDifferent!573 lt!590526 lt!590522 minValue!1279 lt!590531))))

(assert (=> b!1327024 (= (apply!1031 (+!4640 lt!590526 (tuple2!23553 lt!590522 minValue!1279)) lt!590531) (apply!1031 lt!590526 lt!590531))))

(declare-fun lt!590521 () Unit!43717)

(assert (=> b!1327024 (= lt!590521 lt!590518)))

(declare-fun lt!590514 () ListLongMap!21209)

(assert (=> b!1327024 (= lt!590514 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590515 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590515 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590523 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590523 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun lt!590524 () Unit!43717)

(assert (=> b!1327024 (= lt!590524 (addApplyDifferent!573 lt!590514 lt!590515 zeroValue!1279 lt!590523))))

(assert (=> b!1327024 (= (apply!1031 (+!4640 lt!590514 (tuple2!23553 lt!590515 zeroValue!1279)) lt!590523) (apply!1031 lt!590514 lt!590523))))

(declare-fun lt!590527 () Unit!43717)

(assert (=> b!1327024 (= lt!590527 lt!590524)))

(declare-fun lt!590516 () ListLongMap!21209)

(assert (=> b!1327024 (= lt!590516 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun lt!590532 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590532 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!590528 () (_ BitVec 64))

(assert (=> b!1327024 (= lt!590528 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1327024 (= lt!590535 (addApplyDifferent!573 lt!590516 lt!590532 minValue!1279 lt!590528))))

(assert (=> b!1327024 (= (apply!1031 (+!4640 lt!590516 (tuple2!23553 lt!590532 minValue!1279)) lt!590528) (apply!1031 lt!590516 lt!590528))))

(declare-fun d!143159 () Bool)

(assert (=> d!143159 e!756329))

(declare-fun res!880683 () Bool)

(assert (=> d!143159 (=> (not res!880683) (not e!756329))))

(assert (=> d!143159 (= res!880683 (or (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))))

(declare-fun lt!590520 () ListLongMap!21209)

(assert (=> d!143159 (= lt!590529 lt!590520)))

(declare-fun lt!590530 () Unit!43717)

(assert (=> d!143159 (= lt!590530 e!756336)))

(declare-fun c!125835 () Bool)

(assert (=> d!143159 (= c!125835 e!756339)))

(declare-fun res!880680 () Bool)

(assert (=> d!143159 (=> (not res!880680) (not e!756339))))

(assert (=> d!143159 (= res!880680 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(assert (=> d!143159 (= lt!590520 e!756335)))

(assert (=> d!143159 (= c!125838 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!143159 (validMask!0 mask!2019)))

(assert (=> d!143159 (= (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590529)))

(declare-fun b!1327013 () Bool)

(declare-fun c!125839 () Bool)

(assert (=> b!1327013 (= c!125839 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1327013 (= e!756341 e!756332)))

(declare-fun b!1327025 () Bool)

(declare-fun e!756331 () Bool)

(assert (=> b!1327025 (= e!756331 (= (apply!1031 lt!590529 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21815 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1327025 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43834 _values!1337)))))

(assert (=> b!1327025 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(declare-fun bm!64795 () Bool)

(assert (=> bm!64795 (= call!64800 call!64797)))

(declare-fun bm!64796 () Bool)

(assert (=> bm!64796 (= call!64798 (contains!8779 lt!590529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327026 () Bool)

(assert (=> b!1327026 (= e!756333 (not call!64798))))

(declare-fun b!1327027 () Bool)

(declare-fun e!756338 () Bool)

(assert (=> b!1327027 (= e!756338 (not call!64801))))

(declare-fun b!1327028 () Bool)

(declare-fun res!880679 () Bool)

(assert (=> b!1327028 (=> (not res!880679) (not e!756329))))

(assert (=> b!1327028 (= res!880679 e!756338)))

(declare-fun c!125834 () Bool)

(assert (=> b!1327028 (= c!125834 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1327029 () Bool)

(assert (=> b!1327029 (= e!756335 (+!4640 call!64796 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun bm!64797 () Bool)

(assert (=> bm!64797 (= call!64799 call!64796)))

(declare-fun b!1327030 () Bool)

(assert (=> b!1327030 (= e!756337 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun bm!64798 () Bool)

(assert (=> bm!64798 (= call!64797 call!64795)))

(declare-fun b!1327031 () Bool)

(assert (=> b!1327031 (= e!756334 e!756331)))

(declare-fun res!880677 () Bool)

(assert (=> b!1327031 (=> (not res!880677) (not e!756331))))

(assert (=> b!1327031 (= res!880677 (contains!8779 lt!590529 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327031 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(declare-fun b!1327032 () Bool)

(assert (=> b!1327032 (= e!756338 e!756330)))

(declare-fun res!880681 () Bool)

(assert (=> b!1327032 (= res!880681 call!64801)))

(assert (=> b!1327032 (=> (not res!880681) (not e!756330))))

(declare-fun b!1327033 () Bool)

(assert (=> b!1327033 (= e!756332 call!64799)))

(assert (= (and d!143159 c!125838) b!1327029))

(assert (= (and d!143159 (not c!125838)) b!1327019))

(assert (= (and b!1327019 c!125837) b!1327017))

(assert (= (and b!1327019 (not c!125837)) b!1327013))

(assert (= (and b!1327013 c!125839) b!1327033))

(assert (= (and b!1327013 (not c!125839)) b!1327020))

(assert (= (or b!1327033 b!1327020) bm!64795))

(assert (= (or b!1327017 bm!64795) bm!64798))

(assert (= (or b!1327017 b!1327033) bm!64797))

(assert (= (or b!1327029 bm!64798) bm!64793))

(assert (= (or b!1327029 bm!64797) bm!64794))

(assert (= (and d!143159 res!880680) b!1327014))

(assert (= (and d!143159 c!125835) b!1327024))

(assert (= (and d!143159 (not c!125835)) b!1327022))

(assert (= (and d!143159 res!880683) b!1327015))

(assert (= (and b!1327015 res!880678) b!1327030))

(assert (= (and b!1327015 (not res!880684)) b!1327031))

(assert (= (and b!1327031 res!880677) b!1327025))

(assert (= (and b!1327015 res!880685) b!1327028))

(assert (= (and b!1327028 c!125834) b!1327032))

(assert (= (and b!1327028 (not c!125834)) b!1327027))

(assert (= (and b!1327032 res!880681) b!1327021))

(assert (= (or b!1327032 b!1327027) bm!64792))

(assert (= (and b!1327028 res!880679) b!1327018))

(assert (= (and b!1327018 c!125836) b!1327023))

(assert (= (and b!1327018 (not c!125836)) b!1327026))

(assert (= (and b!1327023 res!880682) b!1327016))

(assert (= (or b!1327023 b!1327026) bm!64796))

(declare-fun b_lambda!23833 () Bool)

(assert (=> (not b_lambda!23833) (not b!1327025)))

(assert (=> b!1327025 t!44696))

(declare-fun b_and!49181 () Bool)

(assert (= b_and!49179 (and (=> t!44696 result!24677) b_and!49181)))

(declare-fun m!1216173 () Bool)

(assert (=> b!1327014 m!1216173))

(assert (=> b!1327014 m!1216173))

(declare-fun m!1216175 () Bool)

(assert (=> b!1327014 m!1216175))

(declare-fun m!1216177 () Bool)

(assert (=> b!1327029 m!1216177))

(assert (=> d!143159 m!1216065))

(declare-fun m!1216179 () Bool)

(assert (=> bm!64792 m!1216179))

(assert (=> b!1327031 m!1216173))

(assert (=> b!1327031 m!1216173))

(declare-fun m!1216181 () Bool)

(assert (=> b!1327031 m!1216181))

(declare-fun m!1216183 () Bool)

(assert (=> bm!64794 m!1216183))

(declare-fun m!1216185 () Bool)

(assert (=> b!1327021 m!1216185))

(declare-fun m!1216187 () Bool)

(assert (=> b!1327024 m!1216187))

(declare-fun m!1216189 () Bool)

(assert (=> b!1327024 m!1216189))

(assert (=> b!1327024 m!1216173))

(assert (=> b!1327024 m!1216187))

(declare-fun m!1216191 () Bool)

(assert (=> b!1327024 m!1216191))

(declare-fun m!1216193 () Bool)

(assert (=> b!1327024 m!1216193))

(declare-fun m!1216195 () Bool)

(assert (=> b!1327024 m!1216195))

(declare-fun m!1216197 () Bool)

(assert (=> b!1327024 m!1216197))

(declare-fun m!1216199 () Bool)

(assert (=> b!1327024 m!1216199))

(declare-fun m!1216201 () Bool)

(assert (=> b!1327024 m!1216201))

(declare-fun m!1216203 () Bool)

(assert (=> b!1327024 m!1216203))

(declare-fun m!1216205 () Bool)

(assert (=> b!1327024 m!1216205))

(declare-fun m!1216207 () Bool)

(assert (=> b!1327024 m!1216207))

(declare-fun m!1216209 () Bool)

(assert (=> b!1327024 m!1216209))

(assert (=> b!1327024 m!1216205))

(declare-fun m!1216211 () Bool)

(assert (=> b!1327024 m!1216211))

(assert (=> b!1327024 m!1216211))

(declare-fun m!1216213 () Bool)

(assert (=> b!1327024 m!1216213))

(assert (=> b!1327024 m!1216195))

(declare-fun m!1216215 () Bool)

(assert (=> b!1327024 m!1216215))

(declare-fun m!1216217 () Bool)

(assert (=> b!1327024 m!1216217))

(declare-fun m!1216219 () Bool)

(assert (=> b!1327016 m!1216219))

(assert (=> bm!64793 m!1216209))

(assert (=> b!1327025 m!1216155))

(assert (=> b!1327025 m!1216173))

(declare-fun m!1216221 () Bool)

(assert (=> b!1327025 m!1216221))

(assert (=> b!1327025 m!1216173))

(declare-fun m!1216223 () Bool)

(assert (=> b!1327025 m!1216223))

(assert (=> b!1327025 m!1216223))

(assert (=> b!1327025 m!1216155))

(declare-fun m!1216225 () Bool)

(assert (=> b!1327025 m!1216225))

(assert (=> b!1327030 m!1216173))

(assert (=> b!1327030 m!1216173))

(assert (=> b!1327030 m!1216175))

(declare-fun m!1216227 () Bool)

(assert (=> bm!64796 m!1216227))

(assert (=> b!1326881 d!143159))

(declare-fun b!1327042 () Bool)

(declare-fun e!756348 () Bool)

(declare-fun call!64804 () Bool)

(assert (=> b!1327042 (= e!756348 call!64804)))

(declare-fun b!1327043 () Bool)

(declare-fun e!756350 () Bool)

(declare-fun e!756349 () Bool)

(assert (=> b!1327043 (= e!756350 e!756349)))

(declare-fun c!125842 () Bool)

(assert (=> b!1327043 (= c!125842 (validKeyInArray!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327045 () Bool)

(assert (=> b!1327045 (= e!756349 e!756348)))

(declare-fun lt!590543 () (_ BitVec 64))

(assert (=> b!1327045 (= lt!590543 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000))))

(declare-fun lt!590544 () Unit!43717)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89622 (_ BitVec 64) (_ BitVec 32)) Unit!43717)

(assert (=> b!1327045 (= lt!590544 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590543 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327045 (arrayContainsKey!0 _keys!1609 lt!590543 #b00000000000000000000000000000000)))

(declare-fun lt!590542 () Unit!43717)

(assert (=> b!1327045 (= lt!590542 lt!590544)))

(declare-fun res!880690 () Bool)

(declare-datatypes ((SeekEntryResult!10042 0))(
  ( (MissingZero!10042 (index!42539 (_ BitVec 32))) (Found!10042 (index!42540 (_ BitVec 32))) (Intermediate!10042 (undefined!10854 Bool) (index!42541 (_ BitVec 32)) (x!118311 (_ BitVec 32))) (Undefined!10042) (MissingVacant!10042 (index!42542 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89622 (_ BitVec 32)) SeekEntryResult!10042)

(assert (=> b!1327045 (= res!880690 (= (seekEntryOrOpen!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10042 #b00000000000000000000000000000000)))))

(assert (=> b!1327045 (=> (not res!880690) (not e!756348))))

(declare-fun bm!64801 () Bool)

(assert (=> bm!64801 (= call!64804 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1327044 () Bool)

(assert (=> b!1327044 (= e!756349 call!64804)))

(declare-fun d!143161 () Bool)

(declare-fun res!880691 () Bool)

(assert (=> d!143161 (=> res!880691 e!756350)))

(assert (=> d!143161 (= res!880691 (bvsge #b00000000000000000000000000000000 (size!43833 _keys!1609)))))

(assert (=> d!143161 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!756350)))

(assert (= (and d!143161 (not res!880691)) b!1327043))

(assert (= (and b!1327043 c!125842) b!1327045))

(assert (= (and b!1327043 (not c!125842)) b!1327044))

(assert (= (and b!1327045 res!880690) b!1327042))

(assert (= (or b!1327042 b!1327044) bm!64801))

(assert (=> b!1327043 m!1216095))

(assert (=> b!1327043 m!1216095))

(assert (=> b!1327043 m!1216099))

(assert (=> b!1327045 m!1216095))

(declare-fun m!1216229 () Bool)

(assert (=> b!1327045 m!1216229))

(declare-fun m!1216231 () Bool)

(assert (=> b!1327045 m!1216231))

(assert (=> b!1327045 m!1216095))

(declare-fun m!1216233 () Bool)

(assert (=> b!1327045 m!1216233))

(declare-fun m!1216235 () Bool)

(assert (=> bm!64801 m!1216235))

(assert (=> b!1326877 d!143161))

(declare-fun condMapEmpty!56196 () Bool)

(declare-fun mapDefault!56196 () ValueCell!17280)

(assert (=> mapNonEmpty!56190 (= condMapEmpty!56196 (= mapRest!56190 ((as const (Array (_ BitVec 32) ValueCell!17280)) mapDefault!56196)))))

(declare-fun e!756355 () Bool)

(declare-fun mapRes!56196 () Bool)

(assert (=> mapNonEmpty!56190 (= tp!107093 (and e!756355 mapRes!56196))))

(declare-fun b!1327052 () Bool)

(declare-fun e!756356 () Bool)

(assert (=> b!1327052 (= e!756356 tp_is_empty!36357)))

(declare-fun mapIsEmpty!56196 () Bool)

(assert (=> mapIsEmpty!56196 mapRes!56196))

(declare-fun b!1327053 () Bool)

(assert (=> b!1327053 (= e!756355 tp_is_empty!36357)))

(declare-fun mapNonEmpty!56196 () Bool)

(declare-fun tp!107103 () Bool)

(assert (=> mapNonEmpty!56196 (= mapRes!56196 (and tp!107103 e!756356))))

(declare-fun mapKey!56196 () (_ BitVec 32))

(declare-fun mapValue!56196 () ValueCell!17280)

(declare-fun mapRest!56196 () (Array (_ BitVec 32) ValueCell!17280))

(assert (=> mapNonEmpty!56196 (= mapRest!56190 (store mapRest!56196 mapKey!56196 mapValue!56196))))

(assert (= (and mapNonEmpty!56190 condMapEmpty!56196) mapIsEmpty!56196))

(assert (= (and mapNonEmpty!56190 (not condMapEmpty!56196)) mapNonEmpty!56196))

(assert (= (and mapNonEmpty!56196 ((_ is ValueCellFull!17280) mapValue!56196)) b!1327052))

(assert (= (and mapNonEmpty!56190 ((_ is ValueCellFull!17280) mapDefault!56196)) b!1327053))

(declare-fun m!1216237 () Bool)

(assert (=> mapNonEmpty!56196 m!1216237))

(declare-fun b_lambda!23835 () Bool)

(assert (= b_lambda!23831 (or (and start!111964 b_free!30537) b_lambda!23835)))

(declare-fun b_lambda!23837 () Bool)

(assert (= b_lambda!23833 (or (and start!111964 b_free!30537) b_lambda!23837)))

(check-sat (not b!1326932) (not b!1326942) (not b!1326988) (not bm!64789) (not b!1327043) (not b!1327005) (not b!1327016) tp_is_empty!36357 (not b_lambda!23837) (not b!1327045) (not b!1327010) (not b!1327024) (not bm!64793) (not b!1326933) (not b!1326990) (not bm!64794) (not bm!64785) (not bm!64770) (not b_lambda!23835) (not b!1327031) (not b!1327021) (not d!143147) (not bm!64787) (not d!143149) (not b!1327003) (not b!1327030) (not b!1326999) (not b!1326944) (not b!1327004) (not b!1327029) (not b!1326934) (not bm!64786) (not bm!64801) (not b!1327012) (not mapNonEmpty!56196) (not b!1327025) b_and!49181 (not b!1326995) (not b_next!30537) (not bm!64792) (not b!1327014) (not bm!64796) (not d!143159) (not d!143157) (not b!1326998))
(check-sat b_and!49181 (not b_next!30537))
(get-model)

(declare-fun d!143163 () Bool)

(assert (=> d!143163 (= (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (and (not (= (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1327014 d!143163))

(assert (=> b!1327030 d!143163))

(assert (=> b!1326988 d!143145))

(declare-fun d!143165 () Bool)

(declare-fun e!756357 () Bool)

(assert (=> d!143165 e!756357))

(declare-fun res!880692 () Bool)

(assert (=> d!143165 (=> res!880692 e!756357)))

(declare-fun lt!590545 () Bool)

(assert (=> d!143165 (= res!880692 (not lt!590545))))

(declare-fun lt!590546 () Bool)

(assert (=> d!143165 (= lt!590545 lt!590546)))

(declare-fun lt!590548 () Unit!43717)

(declare-fun e!756358 () Unit!43717)

(assert (=> d!143165 (= lt!590548 e!756358)))

(declare-fun c!125843 () Bool)

(assert (=> d!143165 (= c!125843 lt!590546)))

(assert (=> d!143165 (= lt!590546 (containsKey!736 (toList!10620 lt!590529) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143165 (= (contains!8779 lt!590529 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590545)))

(declare-fun b!1327054 () Bool)

(declare-fun lt!590547 () Unit!43717)

(assert (=> b!1327054 (= e!756358 lt!590547)))

(assert (=> b!1327054 (= lt!590547 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 lt!590529) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327054 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590529) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327055 () Bool)

(declare-fun Unit!43723 () Unit!43717)

(assert (=> b!1327055 (= e!756358 Unit!43723)))

(declare-fun b!1327056 () Bool)

(assert (=> b!1327056 (= e!756357 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143165 c!125843) b!1327054))

(assert (= (and d!143165 (not c!125843)) b!1327055))

(assert (= (and d!143165 (not res!880692)) b!1327056))

(declare-fun m!1216239 () Bool)

(assert (=> d!143165 m!1216239))

(declare-fun m!1216241 () Bool)

(assert (=> b!1327054 m!1216241))

(declare-fun m!1216243 () Bool)

(assert (=> b!1327054 m!1216243))

(assert (=> b!1327054 m!1216243))

(declare-fun m!1216245 () Bool)

(assert (=> b!1327054 m!1216245))

(assert (=> b!1327056 m!1216243))

(assert (=> b!1327056 m!1216243))

(assert (=> b!1327056 m!1216245))

(assert (=> bm!64792 d!143165))

(assert (=> b!1327004 d!143145))

(declare-fun d!143167 () Bool)

(declare-fun e!756359 () Bool)

(assert (=> d!143167 e!756359))

(declare-fun res!880693 () Bool)

(assert (=> d!143167 (=> res!880693 e!756359)))

(declare-fun lt!590549 () Bool)

(assert (=> d!143167 (= res!880693 (not lt!590549))))

(declare-fun lt!590550 () Bool)

(assert (=> d!143167 (= lt!590549 lt!590550)))

(declare-fun lt!590552 () Unit!43717)

(declare-fun e!756360 () Unit!43717)

(assert (=> d!143167 (= lt!590552 e!756360)))

(declare-fun c!125844 () Bool)

(assert (=> d!143167 (= c!125844 lt!590550)))

(assert (=> d!143167 (= lt!590550 (containsKey!736 (toList!10620 lt!590503) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143167 (= (contains!8779 lt!590503 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590549)))

(declare-fun b!1327057 () Bool)

(declare-fun lt!590551 () Unit!43717)

(assert (=> b!1327057 (= e!756360 lt!590551)))

(assert (=> b!1327057 (= lt!590551 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 lt!590503) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327057 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590503) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327058 () Bool)

(declare-fun Unit!43724 () Unit!43717)

(assert (=> b!1327058 (= e!756360 Unit!43724)))

(declare-fun b!1327059 () Bool)

(assert (=> b!1327059 (= e!756359 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143167 c!125844) b!1327057))

(assert (= (and d!143167 (not c!125844)) b!1327058))

(assert (= (and d!143167 (not res!880693)) b!1327059))

(declare-fun m!1216247 () Bool)

(assert (=> d!143167 m!1216247))

(declare-fun m!1216249 () Bool)

(assert (=> b!1327057 m!1216249))

(declare-fun m!1216251 () Bool)

(assert (=> b!1327057 m!1216251))

(assert (=> b!1327057 m!1216251))

(declare-fun m!1216253 () Bool)

(assert (=> b!1327057 m!1216253))

(assert (=> b!1327059 m!1216251))

(assert (=> b!1327059 m!1216251))

(assert (=> b!1327059 m!1216253))

(assert (=> bm!64785 d!143167))

(declare-fun d!143169 () Bool)

(declare-fun e!756363 () Bool)

(assert (=> d!143169 e!756363))

(declare-fun res!880698 () Bool)

(assert (=> d!143169 (=> (not res!880698) (not e!756363))))

(declare-fun lt!590562 () ListLongMap!21209)

(assert (=> d!143169 (= res!880698 (contains!8779 lt!590562 (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590561 () List!30689)

(assert (=> d!143169 (= lt!590562 (ListLongMap!21210 lt!590561))))

(declare-fun lt!590563 () Unit!43717)

(declare-fun lt!590564 () Unit!43717)

(assert (=> d!143169 (= lt!590563 lt!590564)))

(assert (=> d!143169 (= (getValueByKey!714 lt!590561 (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lemmaContainsTupThenGetReturnValue!359 (List!30689 (_ BitVec 64) V!53579) Unit!43717)

(assert (=> d!143169 (= lt!590564 (lemmaContainsTupThenGetReturnValue!359 lt!590561 (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun insertStrictlySorted!488 (List!30689 (_ BitVec 64) V!53579) List!30689)

(assert (=> d!143169 (= lt!590561 (insertStrictlySorted!488 (toList!10620 call!64796) (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143169 (= (+!4640 call!64796 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590562)))

(declare-fun b!1327064 () Bool)

(declare-fun res!880699 () Bool)

(assert (=> b!1327064 (=> (not res!880699) (not e!756363))))

(assert (=> b!1327064 (= res!880699 (= (getValueByKey!714 (toList!10620 lt!590562) (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1327065 () Bool)

(declare-fun contains!8782 (List!30689 tuple2!23552) Bool)

(assert (=> b!1327065 (= e!756363 (contains!8782 (toList!10620 lt!590562) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143169 res!880698) b!1327064))

(assert (= (and b!1327064 res!880699) b!1327065))

(declare-fun m!1216255 () Bool)

(assert (=> d!143169 m!1216255))

(declare-fun m!1216257 () Bool)

(assert (=> d!143169 m!1216257))

(declare-fun m!1216259 () Bool)

(assert (=> d!143169 m!1216259))

(declare-fun m!1216261 () Bool)

(assert (=> d!143169 m!1216261))

(declare-fun m!1216263 () Bool)

(assert (=> b!1327064 m!1216263))

(declare-fun m!1216265 () Bool)

(assert (=> b!1327065 m!1216265))

(assert (=> b!1327029 d!143169))

(declare-fun d!143171 () Bool)

(declare-fun e!756364 () Bool)

(assert (=> d!143171 e!756364))

(declare-fun res!880700 () Bool)

(assert (=> d!143171 (=> (not res!880700) (not e!756364))))

(declare-fun lt!590566 () ListLongMap!21209)

(assert (=> d!143171 (= res!880700 (contains!8779 lt!590566 (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!590565 () List!30689)

(assert (=> d!143171 (= lt!590566 (ListLongMap!21210 lt!590565))))

(declare-fun lt!590567 () Unit!43717)

(declare-fun lt!590568 () Unit!43717)

(assert (=> d!143171 (= lt!590567 lt!590568)))

(assert (=> d!143171 (= (getValueByKey!714 lt!590565 (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143171 (= lt!590568 (lemmaContainsTupThenGetReturnValue!359 lt!590565 (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143171 (= lt!590565 (insertStrictlySorted!488 (toList!10620 call!64789) (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!143171 (= (+!4640 call!64789 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!590566)))

(declare-fun b!1327066 () Bool)

(declare-fun res!880701 () Bool)

(assert (=> b!1327066 (=> (not res!880701) (not e!756364))))

(assert (=> b!1327066 (= res!880701 (= (getValueByKey!714 (toList!10620 lt!590566) (_1!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1327067 () Bool)

(assert (=> b!1327067 (= e!756364 (contains!8782 (toList!10620 lt!590566) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!143171 res!880700) b!1327066))

(assert (= (and b!1327066 res!880701) b!1327067))

(declare-fun m!1216267 () Bool)

(assert (=> d!143171 m!1216267))

(declare-fun m!1216269 () Bool)

(assert (=> d!143171 m!1216269))

(declare-fun m!1216271 () Bool)

(assert (=> d!143171 m!1216271))

(declare-fun m!1216273 () Bool)

(assert (=> d!143171 m!1216273))

(declare-fun m!1216275 () Bool)

(assert (=> b!1327066 m!1216275))

(declare-fun m!1216277 () Bool)

(assert (=> b!1327067 m!1216277))

(assert (=> b!1327003 d!143171))

(declare-fun b!1327068 () Bool)

(declare-fun e!756366 () Bool)

(declare-fun call!64805 () Bool)

(assert (=> b!1327068 (= e!756366 call!64805)))

(declare-fun b!1327069 () Bool)

(declare-fun e!756368 () Bool)

(assert (=> b!1327069 (= e!756368 (contains!8781 (ite c!125811 (Cons!30684 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) Nil!30685) Nil!30685) (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1327070 () Bool)

(declare-fun e!756365 () Bool)

(assert (=> b!1327070 (= e!756365 e!756366)))

(declare-fun c!125845 () Bool)

(assert (=> b!1327070 (= c!125845 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!143173 () Bool)

(declare-fun res!880702 () Bool)

(declare-fun e!756367 () Bool)

(assert (=> d!143173 (=> res!880702 e!756367)))

(assert (=> d!143173 (= res!880702 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43833 _keys!1609)))))

(assert (=> d!143173 (= (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125811 (Cons!30684 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) Nil!30685) Nil!30685)) e!756367)))

(declare-fun b!1327071 () Bool)

(assert (=> b!1327071 (= e!756367 e!756365)))

(declare-fun res!880704 () Bool)

(assert (=> b!1327071 (=> (not res!880704) (not e!756365))))

(assert (=> b!1327071 (= res!880704 (not e!756368))))

(declare-fun res!880703 () Bool)

(assert (=> b!1327071 (=> (not res!880703) (not e!756368))))

(assert (=> b!1327071 (= res!880703 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1327072 () Bool)

(assert (=> b!1327072 (= e!756366 call!64805)))

(declare-fun bm!64802 () Bool)

(assert (=> bm!64802 (= call!64805 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125845 (Cons!30684 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125811 (Cons!30684 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) Nil!30685) Nil!30685)) (ite c!125811 (Cons!30684 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) Nil!30685) Nil!30685))))))

(assert (= (and d!143173 (not res!880702)) b!1327071))

(assert (= (and b!1327071 res!880703) b!1327069))

(assert (= (and b!1327071 res!880704) b!1327070))

(assert (= (and b!1327070 c!125845) b!1327068))

(assert (= (and b!1327070 (not c!125845)) b!1327072))

(assert (= (or b!1327068 b!1327072) bm!64802))

(declare-fun m!1216279 () Bool)

(assert (=> b!1327069 m!1216279))

(assert (=> b!1327069 m!1216279))

(declare-fun m!1216281 () Bool)

(assert (=> b!1327069 m!1216281))

(assert (=> b!1327070 m!1216279))

(assert (=> b!1327070 m!1216279))

(declare-fun m!1216283 () Bool)

(assert (=> b!1327070 m!1216283))

(assert (=> b!1327071 m!1216279))

(assert (=> b!1327071 m!1216279))

(assert (=> b!1327071 m!1216283))

(assert (=> bm!64802 m!1216279))

(declare-fun m!1216285 () Bool)

(assert (=> bm!64802 m!1216285))

(assert (=> bm!64770 d!143173))

(declare-fun d!143175 () Bool)

(declare-fun isEmpty!1079 (Option!766) Bool)

(assert (=> d!143175 (= (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164)) (not (isEmpty!1079 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37954 () Bool)

(assert (= bs!37954 d!143175))

(assert (=> bs!37954 m!1216169))

(declare-fun m!1216287 () Bool)

(assert (=> bs!37954 m!1216287))

(assert (=> b!1327012 d!143175))

(declare-fun b!1327084 () Bool)

(declare-fun e!756374 () Option!766)

(assert (=> b!1327084 (= e!756374 None!764)))

(declare-fun e!756373 () Option!766)

(declare-fun b!1327081 () Bool)

(assert (=> b!1327081 (= e!756373 (Some!765 (_2!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))))))

(declare-fun b!1327083 () Bool)

(assert (=> b!1327083 (= e!756374 (getValueByKey!714 (t!44693 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) k0!1164))))

(declare-fun c!125850 () Bool)

(declare-fun d!143177 () Bool)

(assert (=> d!143177 (= c!125850 (and ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143177 (= (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) e!756373)))

(declare-fun b!1327082 () Bool)

(assert (=> b!1327082 (= e!756373 e!756374)))

(declare-fun c!125851 () Bool)

(assert (=> b!1327082 (= c!125851 (and ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (not (= (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164))))))

(assert (= (and d!143177 c!125850) b!1327081))

(assert (= (and d!143177 (not c!125850)) b!1327082))

(assert (= (and b!1327082 c!125851) b!1327083))

(assert (= (and b!1327082 (not c!125851)) b!1327084))

(declare-fun m!1216289 () Bool)

(assert (=> b!1327083 m!1216289))

(assert (=> b!1327012 d!143177))

(declare-fun d!143179 () Bool)

(assert (=> d!143179 (= (validKeyInArray!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)) (and (not (= (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1326934 d!143179))

(assert (=> d!143149 d!143151))

(declare-fun d!143181 () Bool)

(declare-fun e!756375 () Bool)

(assert (=> d!143181 e!756375))

(declare-fun res!880705 () Bool)

(assert (=> d!143181 (=> res!880705 e!756375)))

(declare-fun lt!590569 () Bool)

(assert (=> d!143181 (= res!880705 (not lt!590569))))

(declare-fun lt!590570 () Bool)

(assert (=> d!143181 (= lt!590569 lt!590570)))

(declare-fun lt!590572 () Unit!43717)

(declare-fun e!756376 () Unit!43717)

(assert (=> d!143181 (= lt!590572 e!756376)))

(declare-fun c!125852 () Bool)

(assert (=> d!143181 (= c!125852 lt!590570)))

(assert (=> d!143181 (= lt!590570 (containsKey!736 (toList!10620 lt!590529) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143181 (= (contains!8779 lt!590529 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590569)))

(declare-fun b!1327085 () Bool)

(declare-fun lt!590571 () Unit!43717)

(assert (=> b!1327085 (= e!756376 lt!590571)))

(assert (=> b!1327085 (= lt!590571 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 lt!590529) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327085 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590529) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327086 () Bool)

(declare-fun Unit!43725 () Unit!43717)

(assert (=> b!1327086 (= e!756376 Unit!43725)))

(declare-fun b!1327087 () Bool)

(assert (=> b!1327087 (= e!756375 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143181 c!125852) b!1327085))

(assert (= (and d!143181 (not c!125852)) b!1327086))

(assert (= (and d!143181 (not res!880705)) b!1327087))

(declare-fun m!1216291 () Bool)

(assert (=> d!143181 m!1216291))

(declare-fun m!1216293 () Bool)

(assert (=> b!1327085 m!1216293))

(declare-fun m!1216295 () Bool)

(assert (=> b!1327085 m!1216295))

(assert (=> b!1327085 m!1216295))

(declare-fun m!1216297 () Bool)

(assert (=> b!1327085 m!1216297))

(assert (=> b!1327087 m!1216295))

(assert (=> b!1327087 m!1216295))

(assert (=> b!1327087 m!1216297))

(assert (=> bm!64796 d!143181))

(assert (=> b!1326933 d!143179))

(declare-fun d!143183 () Bool)

(declare-fun e!756377 () Bool)

(assert (=> d!143183 e!756377))

(declare-fun res!880706 () Bool)

(assert (=> d!143183 (=> res!880706 e!756377)))

(declare-fun lt!590573 () Bool)

(assert (=> d!143183 (= res!880706 (not lt!590573))))

(declare-fun lt!590574 () Bool)

(assert (=> d!143183 (= lt!590573 lt!590574)))

(declare-fun lt!590576 () Unit!43717)

(declare-fun e!756378 () Unit!43717)

(assert (=> d!143183 (= lt!590576 e!756378)))

(declare-fun c!125853 () Bool)

(assert (=> d!143183 (= c!125853 lt!590574)))

(assert (=> d!143183 (= lt!590574 (containsKey!736 (toList!10620 lt!590503) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!143183 (= (contains!8779 lt!590503 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590573)))

(declare-fun b!1327088 () Bool)

(declare-fun lt!590575 () Unit!43717)

(assert (=> b!1327088 (= e!756378 lt!590575)))

(assert (=> b!1327088 (= lt!590575 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 lt!590503) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327088 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590503) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327089 () Bool)

(declare-fun Unit!43726 () Unit!43717)

(assert (=> b!1327089 (= e!756378 Unit!43726)))

(declare-fun b!1327090 () Bool)

(assert (=> b!1327090 (= e!756377 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143183 c!125853) b!1327088))

(assert (= (and d!143183 (not c!125853)) b!1327089))

(assert (= (and d!143183 (not res!880706)) b!1327090))

(declare-fun m!1216299 () Bool)

(assert (=> d!143183 m!1216299))

(declare-fun m!1216301 () Bool)

(assert (=> b!1327088 m!1216301))

(declare-fun m!1216303 () Bool)

(assert (=> b!1327088 m!1216303))

(assert (=> b!1327088 m!1216303))

(declare-fun m!1216305 () Bool)

(assert (=> b!1327088 m!1216305))

(assert (=> b!1327090 m!1216303))

(assert (=> b!1327090 m!1216303))

(assert (=> b!1327090 m!1216305))

(assert (=> bm!64789 d!143183))

(declare-fun d!143185 () Bool)

(assert (=> d!143185 (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun lt!590579 () Unit!43717)

(declare-fun choose!1952 (List!30689 (_ BitVec 64)) Unit!43717)

(assert (=> d!143185 (= lt!590579 (choose!1952 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(declare-fun e!756381 () Bool)

(assert (=> d!143185 e!756381))

(declare-fun res!880709 () Bool)

(assert (=> d!143185 (=> (not res!880709) (not e!756381))))

(declare-fun isStrictlySorted!877 (List!30689) Bool)

(assert (=> d!143185 (= res!880709 (isStrictlySorted!877 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))))

(assert (=> d!143185 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) lt!590579)))

(declare-fun b!1327093 () Bool)

(assert (=> b!1327093 (= e!756381 (containsKey!736 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164))))

(assert (= (and d!143185 res!880709) b!1327093))

(assert (=> d!143185 m!1216169))

(assert (=> d!143185 m!1216169))

(assert (=> d!143185 m!1216171))

(declare-fun m!1216307 () Bool)

(assert (=> d!143185 m!1216307))

(declare-fun m!1216309 () Bool)

(assert (=> d!143185 m!1216309))

(assert (=> b!1327093 m!1216165))

(assert (=> b!1327010 d!143185))

(assert (=> b!1327010 d!143175))

(assert (=> b!1327010 d!143177))

(declare-fun d!143187 () Bool)

(declare-fun lt!590582 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!655 (List!30688) (InoxSet (_ BitVec 64)))

(assert (=> d!143187 (= lt!590582 (select (content!655 Nil!30685) (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun e!756386 () Bool)

(assert (=> d!143187 (= lt!590582 e!756386)))

(declare-fun res!880715 () Bool)

(assert (=> d!143187 (=> (not res!880715) (not e!756386))))

(assert (=> d!143187 (= res!880715 ((_ is Cons!30684) Nil!30685))))

(assert (=> d!143187 (= (contains!8781 Nil!30685 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)) lt!590582)))

(declare-fun b!1327098 () Bool)

(declare-fun e!756387 () Bool)

(assert (=> b!1327098 (= e!756386 e!756387)))

(declare-fun res!880714 () Bool)

(assert (=> b!1327098 (=> res!880714 e!756387)))

(assert (=> b!1327098 (= res!880714 (= (h!31893 Nil!30685) (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1327099 () Bool)

(assert (=> b!1327099 (= e!756387 (contains!8781 (t!44692 Nil!30685) (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!143187 res!880715) b!1327098))

(assert (= (and b!1327098 (not res!880714)) b!1327099))

(declare-fun m!1216311 () Bool)

(assert (=> d!143187 m!1216311))

(assert (=> d!143187 m!1216095))

(declare-fun m!1216313 () Bool)

(assert (=> d!143187 m!1216313))

(assert (=> b!1327099 m!1216095))

(declare-fun m!1216315 () Bool)

(assert (=> b!1327099 m!1216315))

(assert (=> b!1326932 d!143187))

(declare-fun d!143189 () Bool)

(declare-fun get!21816 (Option!766) V!53579)

(assert (=> d!143189 (= (apply!1031 lt!590529 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21816 (getValueByKey!714 (toList!10620 lt!590529) (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(declare-fun bs!37955 () Bool)

(assert (= bs!37955 d!143189))

(assert (=> bs!37955 m!1216173))

(declare-fun m!1216317 () Bool)

(assert (=> bs!37955 m!1216317))

(assert (=> bs!37955 m!1216317))

(declare-fun m!1216319 () Bool)

(assert (=> bs!37955 m!1216319))

(assert (=> b!1327025 d!143189))

(declare-fun d!143191 () Bool)

(declare-fun c!125856 () Bool)

(assert (=> d!143191 (= c!125856 ((_ is ValueCellFull!17280) (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun e!756390 () V!53579)

(assert (=> d!143191 (= (get!21815 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756390)))

(declare-fun b!1327104 () Bool)

(declare-fun get!21817 (ValueCell!17280 V!53579) V!53579)

(assert (=> b!1327104 (= e!756390 (get!21817 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327105 () Bool)

(declare-fun get!21818 (ValueCell!17280 V!53579) V!53579)

(assert (=> b!1327105 (= e!756390 (get!21818 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143191 c!125856) b!1327104))

(assert (= (and d!143191 (not c!125856)) b!1327105))

(assert (=> b!1327104 m!1216223))

(assert (=> b!1327104 m!1216155))

(declare-fun m!1216321 () Bool)

(assert (=> b!1327104 m!1216321))

(assert (=> b!1327105 m!1216223))

(assert (=> b!1327105 m!1216155))

(declare-fun m!1216323 () Bool)

(assert (=> b!1327105 m!1216323))

(assert (=> b!1327025 d!143191))

(declare-fun d!143193 () Bool)

(assert (=> d!143193 (= (apply!1031 lt!590503 (select (arr!43283 _keys!1609) from!2000)) (get!21816 (getValueByKey!714 (toList!10620 lt!590503) (select (arr!43283 _keys!1609) from!2000))))))

(declare-fun bs!37956 () Bool)

(assert (= bs!37956 d!143193))

(assert (=> bs!37956 m!1216047))

(declare-fun m!1216325 () Bool)

(assert (=> bs!37956 m!1216325))

(assert (=> bs!37956 m!1216325))

(declare-fun m!1216327 () Bool)

(assert (=> bs!37956 m!1216327))

(assert (=> b!1326999 d!143193))

(declare-fun d!143195 () Bool)

(declare-fun c!125857 () Bool)

(assert (=> d!143195 (= c!125857 ((_ is ValueCellFull!17280) (select (arr!43284 _values!1337) from!2000)))))

(declare-fun e!756391 () V!53579)

(assert (=> d!143195 (= (get!21815 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!756391)))

(declare-fun b!1327106 () Bool)

(assert (=> b!1327106 (= e!756391 (get!21817 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1327107 () Bool)

(assert (=> b!1327107 (= e!756391 (get!21818 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!143195 c!125857) b!1327106))

(assert (= (and d!143195 (not c!125857)) b!1327107))

(assert (=> b!1327106 m!1216159))

(assert (=> b!1327106 m!1216155))

(declare-fun m!1216329 () Bool)

(assert (=> b!1327106 m!1216329))

(assert (=> b!1327107 m!1216159))

(assert (=> b!1327107 m!1216155))

(declare-fun m!1216331 () Bool)

(assert (=> b!1327107 m!1216331))

(assert (=> b!1326999 d!143195))

(declare-fun d!143197 () Bool)

(declare-fun e!756392 () Bool)

(assert (=> d!143197 e!756392))

(declare-fun res!880716 () Bool)

(assert (=> d!143197 (=> (not res!880716) (not e!756392))))

(declare-fun lt!590584 () ListLongMap!21209)

(assert (=> d!143197 (= res!880716 (contains!8779 lt!590584 (_1!11787 (tuple2!23553 lt!590522 minValue!1279))))))

(declare-fun lt!590583 () List!30689)

(assert (=> d!143197 (= lt!590584 (ListLongMap!21210 lt!590583))))

(declare-fun lt!590585 () Unit!43717)

(declare-fun lt!590586 () Unit!43717)

(assert (=> d!143197 (= lt!590585 lt!590586)))

(assert (=> d!143197 (= (getValueByKey!714 lt!590583 (_1!11787 (tuple2!23553 lt!590522 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590522 minValue!1279))))))

(assert (=> d!143197 (= lt!590586 (lemmaContainsTupThenGetReturnValue!359 lt!590583 (_1!11787 (tuple2!23553 lt!590522 minValue!1279)) (_2!11787 (tuple2!23553 lt!590522 minValue!1279))))))

(assert (=> d!143197 (= lt!590583 (insertStrictlySorted!488 (toList!10620 lt!590526) (_1!11787 (tuple2!23553 lt!590522 minValue!1279)) (_2!11787 (tuple2!23553 lt!590522 minValue!1279))))))

(assert (=> d!143197 (= (+!4640 lt!590526 (tuple2!23553 lt!590522 minValue!1279)) lt!590584)))

(declare-fun b!1327108 () Bool)

(declare-fun res!880717 () Bool)

(assert (=> b!1327108 (=> (not res!880717) (not e!756392))))

(assert (=> b!1327108 (= res!880717 (= (getValueByKey!714 (toList!10620 lt!590584) (_1!11787 (tuple2!23553 lt!590522 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590522 minValue!1279)))))))

(declare-fun b!1327109 () Bool)

(assert (=> b!1327109 (= e!756392 (contains!8782 (toList!10620 lt!590584) (tuple2!23553 lt!590522 minValue!1279)))))

(assert (= (and d!143197 res!880716) b!1327108))

(assert (= (and b!1327108 res!880717) b!1327109))

(declare-fun m!1216333 () Bool)

(assert (=> d!143197 m!1216333))

(declare-fun m!1216335 () Bool)

(assert (=> d!143197 m!1216335))

(declare-fun m!1216337 () Bool)

(assert (=> d!143197 m!1216337))

(declare-fun m!1216339 () Bool)

(assert (=> d!143197 m!1216339))

(declare-fun m!1216341 () Bool)

(assert (=> b!1327108 m!1216341))

(declare-fun m!1216343 () Bool)

(assert (=> b!1327109 m!1216343))

(assert (=> b!1327024 d!143197))

(declare-fun d!143199 () Bool)

(declare-fun e!756393 () Bool)

(assert (=> d!143199 e!756393))

(declare-fun res!880718 () Bool)

(assert (=> d!143199 (=> res!880718 e!756393)))

(declare-fun lt!590587 () Bool)

(assert (=> d!143199 (= res!880718 (not lt!590587))))

(declare-fun lt!590588 () Bool)

(assert (=> d!143199 (= lt!590587 lt!590588)))

(declare-fun lt!590590 () Unit!43717)

(declare-fun e!756394 () Unit!43717)

(assert (=> d!143199 (= lt!590590 e!756394)))

(declare-fun c!125858 () Bool)

(assert (=> d!143199 (= c!125858 lt!590588)))

(assert (=> d!143199 (= lt!590588 (containsKey!736 (toList!10620 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279))) lt!590525))))

(assert (=> d!143199 (= (contains!8779 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279)) lt!590525) lt!590587)))

(declare-fun b!1327110 () Bool)

(declare-fun lt!590589 () Unit!43717)

(assert (=> b!1327110 (= e!756394 lt!590589)))

(assert (=> b!1327110 (= lt!590589 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279))) lt!590525))))

(assert (=> b!1327110 (isDefined!521 (getValueByKey!714 (toList!10620 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279))) lt!590525))))

(declare-fun b!1327111 () Bool)

(declare-fun Unit!43727 () Unit!43717)

(assert (=> b!1327111 (= e!756394 Unit!43727)))

(declare-fun b!1327112 () Bool)

(assert (=> b!1327112 (= e!756393 (isDefined!521 (getValueByKey!714 (toList!10620 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279))) lt!590525)))))

(assert (= (and d!143199 c!125858) b!1327110))

(assert (= (and d!143199 (not c!125858)) b!1327111))

(assert (= (and d!143199 (not res!880718)) b!1327112))

(declare-fun m!1216345 () Bool)

(assert (=> d!143199 m!1216345))

(declare-fun m!1216347 () Bool)

(assert (=> b!1327110 m!1216347))

(declare-fun m!1216349 () Bool)

(assert (=> b!1327110 m!1216349))

(assert (=> b!1327110 m!1216349))

(declare-fun m!1216351 () Bool)

(assert (=> b!1327110 m!1216351))

(assert (=> b!1327112 m!1216349))

(assert (=> b!1327112 m!1216349))

(assert (=> b!1327112 m!1216351))

(assert (=> b!1327024 d!143199))

(declare-fun d!143201 () Bool)

(assert (=> d!143201 (= (apply!1031 (+!4640 lt!590514 (tuple2!23553 lt!590515 zeroValue!1279)) lt!590523) (get!21816 (getValueByKey!714 (toList!10620 (+!4640 lt!590514 (tuple2!23553 lt!590515 zeroValue!1279))) lt!590523)))))

(declare-fun bs!37957 () Bool)

(assert (= bs!37957 d!143201))

(declare-fun m!1216353 () Bool)

(assert (=> bs!37957 m!1216353))

(assert (=> bs!37957 m!1216353))

(declare-fun m!1216355 () Bool)

(assert (=> bs!37957 m!1216355))

(assert (=> b!1327024 d!143201))

(declare-fun b!1327137 () Bool)

(declare-fun e!756411 () Bool)

(assert (=> b!1327137 (= e!756411 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327137 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun b!1327138 () Bool)

(declare-fun e!756415 () Bool)

(declare-fun e!756410 () Bool)

(assert (=> b!1327138 (= e!756415 e!756410)))

(assert (=> b!1327138 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(declare-fun lt!590605 () ListLongMap!21209)

(declare-fun res!880729 () Bool)

(assert (=> b!1327138 (= res!880729 (contains!8779 lt!590605 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327138 (=> (not res!880729) (not e!756410))))

(declare-fun b!1327139 () Bool)

(assert (=> b!1327139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(assert (=> b!1327139 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43834 _values!1337)))))

(assert (=> b!1327139 (= e!756410 (= (apply!1031 lt!590605 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21815 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327140 () Bool)

(declare-fun lt!590609 () Unit!43717)

(declare-fun lt!590607 () Unit!43717)

(assert (=> b!1327140 (= lt!590609 lt!590607)))

(declare-fun lt!590611 () (_ BitVec 64))

(declare-fun lt!590610 () V!53579)

(declare-fun lt!590608 () (_ BitVec 64))

(declare-fun lt!590606 () ListLongMap!21209)

(assert (=> b!1327140 (not (contains!8779 (+!4640 lt!590606 (tuple2!23553 lt!590608 lt!590610)) lt!590611))))

(declare-fun addStillNotContains!495 (ListLongMap!21209 (_ BitVec 64) V!53579 (_ BitVec 64)) Unit!43717)

(assert (=> b!1327140 (= lt!590607 (addStillNotContains!495 lt!590606 lt!590608 lt!590610 lt!590611))))

(assert (=> b!1327140 (= lt!590611 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1327140 (= lt!590610 (get!21815 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1327140 (= lt!590608 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(declare-fun call!64808 () ListLongMap!21209)

(assert (=> b!1327140 (= lt!590606 call!64808)))

(declare-fun e!756412 () ListLongMap!21209)

(assert (=> b!1327140 (= e!756412 (+!4640 call!64808 (tuple2!23553 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21815 (select (arr!43284 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1327142 () Bool)

(declare-fun e!756413 () ListLongMap!21209)

(assert (=> b!1327142 (= e!756413 e!756412)))

(declare-fun c!125867 () Bool)

(assert (=> b!1327142 (= c!125867 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1327143 () Bool)

(declare-fun e!756414 () Bool)

(assert (=> b!1327143 (= e!756415 e!756414)))

(declare-fun c!125868 () Bool)

(assert (=> b!1327143 (= c!125868 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(declare-fun bm!64805 () Bool)

(assert (=> bm!64805 (= call!64808 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1327144 () Bool)

(assert (=> b!1327144 (= e!756412 call!64808)))

(declare-fun b!1327145 () Bool)

(declare-fun e!756409 () Bool)

(assert (=> b!1327145 (= e!756409 e!756415)))

(declare-fun c!125870 () Bool)

(assert (=> b!1327145 (= c!125870 e!756411)))

(declare-fun res!880728 () Bool)

(assert (=> b!1327145 (=> (not res!880728) (not e!756411))))

(assert (=> b!1327145 (= res!880728 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(declare-fun b!1327146 () Bool)

(assert (=> b!1327146 (= e!756413 (ListLongMap!21210 Nil!30686))))

(declare-fun b!1327141 () Bool)

(declare-fun res!880727 () Bool)

(assert (=> b!1327141 (=> (not res!880727) (not e!756409))))

(assert (=> b!1327141 (= res!880727 (not (contains!8779 lt!590605 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!143203 () Bool)

(assert (=> d!143203 e!756409))

(declare-fun res!880730 () Bool)

(assert (=> d!143203 (=> (not res!880730) (not e!756409))))

(assert (=> d!143203 (= res!880730 (not (contains!8779 lt!590605 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143203 (= lt!590605 e!756413)))

(declare-fun c!125869 () Bool)

(assert (=> d!143203 (= c!125869 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43833 _keys!1609)))))

(assert (=> d!143203 (validMask!0 mask!2019)))

(assert (=> d!143203 (= (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!590605)))

(declare-fun b!1327147 () Bool)

(assert (=> b!1327147 (= e!756414 (= lt!590605 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1327148 () Bool)

(declare-fun isEmpty!1080 (ListLongMap!21209) Bool)

(assert (=> b!1327148 (= e!756414 (isEmpty!1080 lt!590605))))

(assert (= (and d!143203 c!125869) b!1327146))

(assert (= (and d!143203 (not c!125869)) b!1327142))

(assert (= (and b!1327142 c!125867) b!1327140))

(assert (= (and b!1327142 (not c!125867)) b!1327144))

(assert (= (or b!1327140 b!1327144) bm!64805))

(assert (= (and d!143203 res!880730) b!1327141))

(assert (= (and b!1327141 res!880727) b!1327145))

(assert (= (and b!1327145 res!880728) b!1327137))

(assert (= (and b!1327145 c!125870) b!1327138))

(assert (= (and b!1327145 (not c!125870)) b!1327143))

(assert (= (and b!1327138 res!880729) b!1327139))

(assert (= (and b!1327143 c!125868) b!1327147))

(assert (= (and b!1327143 (not c!125868)) b!1327148))

(declare-fun b_lambda!23839 () Bool)

(assert (=> (not b_lambda!23839) (not b!1327139)))

(assert (=> b!1327139 t!44696))

(declare-fun b_and!49183 () Bool)

(assert (= b_and!49181 (and (=> t!44696 result!24677) b_and!49183)))

(declare-fun b_lambda!23841 () Bool)

(assert (=> (not b_lambda!23841) (not b!1327140)))

(assert (=> b!1327140 t!44696))

(declare-fun b_and!49185 () Bool)

(assert (= b_and!49183 (and (=> t!44696 result!24677) b_and!49185)))

(declare-fun m!1216357 () Bool)

(assert (=> d!143203 m!1216357))

(assert (=> d!143203 m!1216065))

(assert (=> b!1327138 m!1216173))

(assert (=> b!1327138 m!1216173))

(declare-fun m!1216359 () Bool)

(assert (=> b!1327138 m!1216359))

(assert (=> b!1327137 m!1216173))

(assert (=> b!1327137 m!1216173))

(assert (=> b!1327137 m!1216175))

(declare-fun m!1216361 () Bool)

(assert (=> bm!64805 m!1216361))

(assert (=> b!1327140 m!1216223))

(assert (=> b!1327140 m!1216155))

(assert (=> b!1327140 m!1216225))

(assert (=> b!1327140 m!1216223))

(declare-fun m!1216363 () Bool)

(assert (=> b!1327140 m!1216363))

(declare-fun m!1216365 () Bool)

(assert (=> b!1327140 m!1216365))

(assert (=> b!1327140 m!1216155))

(declare-fun m!1216367 () Bool)

(assert (=> b!1327140 m!1216367))

(declare-fun m!1216369 () Bool)

(assert (=> b!1327140 m!1216369))

(assert (=> b!1327140 m!1216173))

(assert (=> b!1327140 m!1216367))

(assert (=> b!1327147 m!1216361))

(assert (=> b!1327142 m!1216173))

(assert (=> b!1327142 m!1216173))

(assert (=> b!1327142 m!1216175))

(declare-fun m!1216371 () Bool)

(assert (=> b!1327148 m!1216371))

(declare-fun m!1216373 () Bool)

(assert (=> b!1327141 m!1216373))

(assert (=> b!1327139 m!1216223))

(assert (=> b!1327139 m!1216155))

(assert (=> b!1327139 m!1216225))

(assert (=> b!1327139 m!1216223))

(assert (=> b!1327139 m!1216173))

(declare-fun m!1216375 () Bool)

(assert (=> b!1327139 m!1216375))

(assert (=> b!1327139 m!1216155))

(assert (=> b!1327139 m!1216173))

(assert (=> b!1327024 d!143203))

(declare-fun d!143205 () Bool)

(assert (=> d!143205 (= (apply!1031 lt!590514 lt!590523) (get!21816 (getValueByKey!714 (toList!10620 lt!590514) lt!590523)))))

(declare-fun bs!37958 () Bool)

(assert (= bs!37958 d!143205))

(declare-fun m!1216377 () Bool)

(assert (=> bs!37958 m!1216377))

(assert (=> bs!37958 m!1216377))

(declare-fun m!1216379 () Bool)

(assert (=> bs!37958 m!1216379))

(assert (=> b!1327024 d!143205))

(declare-fun d!143207 () Bool)

(declare-fun e!756416 () Bool)

(assert (=> d!143207 e!756416))

(declare-fun res!880731 () Bool)

(assert (=> d!143207 (=> (not res!880731) (not e!756416))))

(declare-fun lt!590613 () ListLongMap!21209)

(assert (=> d!143207 (= res!880731 (contains!8779 lt!590613 (_1!11787 (tuple2!23553 lt!590532 minValue!1279))))))

(declare-fun lt!590612 () List!30689)

(assert (=> d!143207 (= lt!590613 (ListLongMap!21210 lt!590612))))

(declare-fun lt!590614 () Unit!43717)

(declare-fun lt!590615 () Unit!43717)

(assert (=> d!143207 (= lt!590614 lt!590615)))

(assert (=> d!143207 (= (getValueByKey!714 lt!590612 (_1!11787 (tuple2!23553 lt!590532 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590532 minValue!1279))))))

(assert (=> d!143207 (= lt!590615 (lemmaContainsTupThenGetReturnValue!359 lt!590612 (_1!11787 (tuple2!23553 lt!590532 minValue!1279)) (_2!11787 (tuple2!23553 lt!590532 minValue!1279))))))

(assert (=> d!143207 (= lt!590612 (insertStrictlySorted!488 (toList!10620 lt!590516) (_1!11787 (tuple2!23553 lt!590532 minValue!1279)) (_2!11787 (tuple2!23553 lt!590532 minValue!1279))))))

(assert (=> d!143207 (= (+!4640 lt!590516 (tuple2!23553 lt!590532 minValue!1279)) lt!590613)))

(declare-fun b!1327149 () Bool)

(declare-fun res!880732 () Bool)

(assert (=> b!1327149 (=> (not res!880732) (not e!756416))))

(assert (=> b!1327149 (= res!880732 (= (getValueByKey!714 (toList!10620 lt!590613) (_1!11787 (tuple2!23553 lt!590532 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590532 minValue!1279)))))))

(declare-fun b!1327150 () Bool)

(assert (=> b!1327150 (= e!756416 (contains!8782 (toList!10620 lt!590613) (tuple2!23553 lt!590532 minValue!1279)))))

(assert (= (and d!143207 res!880731) b!1327149))

(assert (= (and b!1327149 res!880732) b!1327150))

(declare-fun m!1216381 () Bool)

(assert (=> d!143207 m!1216381))

(declare-fun m!1216383 () Bool)

(assert (=> d!143207 m!1216383))

(declare-fun m!1216385 () Bool)

(assert (=> d!143207 m!1216385))

(declare-fun m!1216387 () Bool)

(assert (=> d!143207 m!1216387))

(declare-fun m!1216389 () Bool)

(assert (=> b!1327149 m!1216389))

(declare-fun m!1216391 () Bool)

(assert (=> b!1327150 m!1216391))

(assert (=> b!1327024 d!143207))

(declare-fun d!143209 () Bool)

(assert (=> d!143209 (= (apply!1031 (+!4640 lt!590514 (tuple2!23553 lt!590515 zeroValue!1279)) lt!590523) (apply!1031 lt!590514 lt!590523))))

(declare-fun lt!590618 () Unit!43717)

(declare-fun choose!1953 (ListLongMap!21209 (_ BitVec 64) V!53579 (_ BitVec 64)) Unit!43717)

(assert (=> d!143209 (= lt!590618 (choose!1953 lt!590514 lt!590515 zeroValue!1279 lt!590523))))

(declare-fun e!756419 () Bool)

(assert (=> d!143209 e!756419))

(declare-fun res!880735 () Bool)

(assert (=> d!143209 (=> (not res!880735) (not e!756419))))

(assert (=> d!143209 (= res!880735 (contains!8779 lt!590514 lt!590523))))

(assert (=> d!143209 (= (addApplyDifferent!573 lt!590514 lt!590515 zeroValue!1279 lt!590523) lt!590618)))

(declare-fun b!1327154 () Bool)

(assert (=> b!1327154 (= e!756419 (not (= lt!590523 lt!590515)))))

(assert (= (and d!143209 res!880735) b!1327154))

(assert (=> d!143209 m!1216211))

(assert (=> d!143209 m!1216213))

(declare-fun m!1216393 () Bool)

(assert (=> d!143209 m!1216393))

(assert (=> d!143209 m!1216203))

(assert (=> d!143209 m!1216211))

(declare-fun m!1216395 () Bool)

(assert (=> d!143209 m!1216395))

(assert (=> b!1327024 d!143209))

(declare-fun d!143211 () Bool)

(assert (=> d!143211 (contains!8779 (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279)) lt!590525)))

(declare-fun lt!590621 () Unit!43717)

(declare-fun choose!1954 (ListLongMap!21209 (_ BitVec 64) V!53579 (_ BitVec 64)) Unit!43717)

(assert (=> d!143211 (= lt!590621 (choose!1954 lt!590519 lt!590517 zeroValue!1279 lt!590525))))

(assert (=> d!143211 (contains!8779 lt!590519 lt!590525)))

(assert (=> d!143211 (= (addStillContains!1164 lt!590519 lt!590517 zeroValue!1279 lt!590525) lt!590621)))

(declare-fun bs!37959 () Bool)

(assert (= bs!37959 d!143211))

(assert (=> bs!37959 m!1216187))

(assert (=> bs!37959 m!1216187))

(assert (=> bs!37959 m!1216189))

(declare-fun m!1216397 () Bool)

(assert (=> bs!37959 m!1216397))

(declare-fun m!1216399 () Bool)

(assert (=> bs!37959 m!1216399))

(assert (=> b!1327024 d!143211))

(declare-fun d!143213 () Bool)

(assert (=> d!143213 (= (apply!1031 (+!4640 lt!590516 (tuple2!23553 lt!590532 minValue!1279)) lt!590528) (get!21816 (getValueByKey!714 (toList!10620 (+!4640 lt!590516 (tuple2!23553 lt!590532 minValue!1279))) lt!590528)))))

(declare-fun bs!37960 () Bool)

(assert (= bs!37960 d!143213))

(declare-fun m!1216401 () Bool)

(assert (=> bs!37960 m!1216401))

(assert (=> bs!37960 m!1216401))

(declare-fun m!1216403 () Bool)

(assert (=> bs!37960 m!1216403))

(assert (=> b!1327024 d!143213))

(declare-fun d!143215 () Bool)

(assert (=> d!143215 (= (apply!1031 lt!590516 lt!590528) (get!21816 (getValueByKey!714 (toList!10620 lt!590516) lt!590528)))))

(declare-fun bs!37961 () Bool)

(assert (= bs!37961 d!143215))

(declare-fun m!1216405 () Bool)

(assert (=> bs!37961 m!1216405))

(assert (=> bs!37961 m!1216405))

(declare-fun m!1216407 () Bool)

(assert (=> bs!37961 m!1216407))

(assert (=> b!1327024 d!143215))

(declare-fun d!143217 () Bool)

(declare-fun e!756420 () Bool)

(assert (=> d!143217 e!756420))

(declare-fun res!880736 () Bool)

(assert (=> d!143217 (=> (not res!880736) (not e!756420))))

(declare-fun lt!590623 () ListLongMap!21209)

(assert (=> d!143217 (= res!880736 (contains!8779 lt!590623 (_1!11787 (tuple2!23553 lt!590515 zeroValue!1279))))))

(declare-fun lt!590622 () List!30689)

(assert (=> d!143217 (= lt!590623 (ListLongMap!21210 lt!590622))))

(declare-fun lt!590624 () Unit!43717)

(declare-fun lt!590625 () Unit!43717)

(assert (=> d!143217 (= lt!590624 lt!590625)))

(assert (=> d!143217 (= (getValueByKey!714 lt!590622 (_1!11787 (tuple2!23553 lt!590515 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590515 zeroValue!1279))))))

(assert (=> d!143217 (= lt!590625 (lemmaContainsTupThenGetReturnValue!359 lt!590622 (_1!11787 (tuple2!23553 lt!590515 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590515 zeroValue!1279))))))

(assert (=> d!143217 (= lt!590622 (insertStrictlySorted!488 (toList!10620 lt!590514) (_1!11787 (tuple2!23553 lt!590515 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590515 zeroValue!1279))))))

(assert (=> d!143217 (= (+!4640 lt!590514 (tuple2!23553 lt!590515 zeroValue!1279)) lt!590623)))

(declare-fun b!1327156 () Bool)

(declare-fun res!880737 () Bool)

(assert (=> b!1327156 (=> (not res!880737) (not e!756420))))

(assert (=> b!1327156 (= res!880737 (= (getValueByKey!714 (toList!10620 lt!590623) (_1!11787 (tuple2!23553 lt!590515 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590515 zeroValue!1279)))))))

(declare-fun b!1327157 () Bool)

(assert (=> b!1327157 (= e!756420 (contains!8782 (toList!10620 lt!590623) (tuple2!23553 lt!590515 zeroValue!1279)))))

(assert (= (and d!143217 res!880736) b!1327156))

(assert (= (and b!1327156 res!880737) b!1327157))

(declare-fun m!1216409 () Bool)

(assert (=> d!143217 m!1216409))

(declare-fun m!1216411 () Bool)

(assert (=> d!143217 m!1216411))

(declare-fun m!1216413 () Bool)

(assert (=> d!143217 m!1216413))

(declare-fun m!1216415 () Bool)

(assert (=> d!143217 m!1216415))

(declare-fun m!1216417 () Bool)

(assert (=> b!1327156 m!1216417))

(declare-fun m!1216419 () Bool)

(assert (=> b!1327157 m!1216419))

(assert (=> b!1327024 d!143217))

(declare-fun d!143219 () Bool)

(assert (=> d!143219 (= (apply!1031 (+!4640 lt!590516 (tuple2!23553 lt!590532 minValue!1279)) lt!590528) (apply!1031 lt!590516 lt!590528))))

(declare-fun lt!590626 () Unit!43717)

(assert (=> d!143219 (= lt!590626 (choose!1953 lt!590516 lt!590532 minValue!1279 lt!590528))))

(declare-fun e!756421 () Bool)

(assert (=> d!143219 e!756421))

(declare-fun res!880738 () Bool)

(assert (=> d!143219 (=> (not res!880738) (not e!756421))))

(assert (=> d!143219 (= res!880738 (contains!8779 lt!590516 lt!590528))))

(assert (=> d!143219 (= (addApplyDifferent!573 lt!590516 lt!590532 minValue!1279 lt!590528) lt!590626)))

(declare-fun b!1327158 () Bool)

(assert (=> b!1327158 (= e!756421 (not (= lt!590528 lt!590532)))))

(assert (= (and d!143219 res!880738) b!1327158))

(assert (=> d!143219 m!1216195))

(assert (=> d!143219 m!1216215))

(declare-fun m!1216421 () Bool)

(assert (=> d!143219 m!1216421))

(assert (=> d!143219 m!1216217))

(assert (=> d!143219 m!1216195))

(declare-fun m!1216423 () Bool)

(assert (=> d!143219 m!1216423))

(assert (=> b!1327024 d!143219))

(declare-fun d!143221 () Bool)

(assert (=> d!143221 (= (apply!1031 (+!4640 lt!590526 (tuple2!23553 lt!590522 minValue!1279)) lt!590531) (apply!1031 lt!590526 lt!590531))))

(declare-fun lt!590627 () Unit!43717)

(assert (=> d!143221 (= lt!590627 (choose!1953 lt!590526 lt!590522 minValue!1279 lt!590531))))

(declare-fun e!756422 () Bool)

(assert (=> d!143221 e!756422))

(declare-fun res!880739 () Bool)

(assert (=> d!143221 (=> (not res!880739) (not e!756422))))

(assert (=> d!143221 (= res!880739 (contains!8779 lt!590526 lt!590531))))

(assert (=> d!143221 (= (addApplyDifferent!573 lt!590526 lt!590522 minValue!1279 lt!590531) lt!590627)))

(declare-fun b!1327159 () Bool)

(assert (=> b!1327159 (= e!756422 (not (= lt!590531 lt!590522)))))

(assert (= (and d!143221 res!880739) b!1327159))

(assert (=> d!143221 m!1216205))

(assert (=> d!143221 m!1216207))

(declare-fun m!1216425 () Bool)

(assert (=> d!143221 m!1216425))

(assert (=> d!143221 m!1216191))

(assert (=> d!143221 m!1216205))

(declare-fun m!1216427 () Bool)

(assert (=> d!143221 m!1216427))

(assert (=> b!1327024 d!143221))

(declare-fun d!143223 () Bool)

(assert (=> d!143223 (= (apply!1031 (+!4640 lt!590526 (tuple2!23553 lt!590522 minValue!1279)) lt!590531) (get!21816 (getValueByKey!714 (toList!10620 (+!4640 lt!590526 (tuple2!23553 lt!590522 minValue!1279))) lt!590531)))))

(declare-fun bs!37962 () Bool)

(assert (= bs!37962 d!143223))

(declare-fun m!1216429 () Bool)

(assert (=> bs!37962 m!1216429))

(assert (=> bs!37962 m!1216429))

(declare-fun m!1216431 () Bool)

(assert (=> bs!37962 m!1216431))

(assert (=> b!1327024 d!143223))

(declare-fun d!143225 () Bool)

(assert (=> d!143225 (= (apply!1031 lt!590526 lt!590531) (get!21816 (getValueByKey!714 (toList!10620 lt!590526) lt!590531)))))

(declare-fun bs!37963 () Bool)

(assert (= bs!37963 d!143225))

(declare-fun m!1216433 () Bool)

(assert (=> bs!37963 m!1216433))

(assert (=> bs!37963 m!1216433))

(declare-fun m!1216435 () Bool)

(assert (=> bs!37963 m!1216435))

(assert (=> b!1327024 d!143225))

(declare-fun d!143227 () Bool)

(declare-fun e!756423 () Bool)

(assert (=> d!143227 e!756423))

(declare-fun res!880740 () Bool)

(assert (=> d!143227 (=> (not res!880740) (not e!756423))))

(declare-fun lt!590629 () ListLongMap!21209)

(assert (=> d!143227 (= res!880740 (contains!8779 lt!590629 (_1!11787 (tuple2!23553 lt!590517 zeroValue!1279))))))

(declare-fun lt!590628 () List!30689)

(assert (=> d!143227 (= lt!590629 (ListLongMap!21210 lt!590628))))

(declare-fun lt!590630 () Unit!43717)

(declare-fun lt!590631 () Unit!43717)

(assert (=> d!143227 (= lt!590630 lt!590631)))

(assert (=> d!143227 (= (getValueByKey!714 lt!590628 (_1!11787 (tuple2!23553 lt!590517 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590517 zeroValue!1279))))))

(assert (=> d!143227 (= lt!590631 (lemmaContainsTupThenGetReturnValue!359 lt!590628 (_1!11787 (tuple2!23553 lt!590517 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590517 zeroValue!1279))))))

(assert (=> d!143227 (= lt!590628 (insertStrictlySorted!488 (toList!10620 lt!590519) (_1!11787 (tuple2!23553 lt!590517 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590517 zeroValue!1279))))))

(assert (=> d!143227 (= (+!4640 lt!590519 (tuple2!23553 lt!590517 zeroValue!1279)) lt!590629)))

(declare-fun b!1327160 () Bool)

(declare-fun res!880741 () Bool)

(assert (=> b!1327160 (=> (not res!880741) (not e!756423))))

(assert (=> b!1327160 (= res!880741 (= (getValueByKey!714 (toList!10620 lt!590629) (_1!11787 (tuple2!23553 lt!590517 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590517 zeroValue!1279)))))))

(declare-fun b!1327161 () Bool)

(assert (=> b!1327161 (= e!756423 (contains!8782 (toList!10620 lt!590629) (tuple2!23553 lt!590517 zeroValue!1279)))))

(assert (= (and d!143227 res!880740) b!1327160))

(assert (= (and b!1327160 res!880741) b!1327161))

(declare-fun m!1216437 () Bool)

(assert (=> d!143227 m!1216437))

(declare-fun m!1216439 () Bool)

(assert (=> d!143227 m!1216439))

(declare-fun m!1216441 () Bool)

(assert (=> d!143227 m!1216441))

(declare-fun m!1216443 () Bool)

(assert (=> d!143227 m!1216443))

(declare-fun m!1216445 () Bool)

(assert (=> b!1327160 m!1216445))

(declare-fun m!1216447 () Bool)

(assert (=> b!1327161 m!1216447))

(assert (=> b!1327024 d!143227))

(declare-fun d!143229 () Bool)

(declare-fun e!756424 () Bool)

(assert (=> d!143229 e!756424))

(declare-fun res!880742 () Bool)

(assert (=> d!143229 (=> (not res!880742) (not e!756424))))

(declare-fun lt!590633 () ListLongMap!21209)

(assert (=> d!143229 (= res!880742 (contains!8779 lt!590633 (_1!11787 (tuple2!23553 lt!590506 minValue!1279))))))

(declare-fun lt!590632 () List!30689)

(assert (=> d!143229 (= lt!590633 (ListLongMap!21210 lt!590632))))

(declare-fun lt!590634 () Unit!43717)

(declare-fun lt!590635 () Unit!43717)

(assert (=> d!143229 (= lt!590634 lt!590635)))

(assert (=> d!143229 (= (getValueByKey!714 lt!590632 (_1!11787 (tuple2!23553 lt!590506 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590506 minValue!1279))))))

(assert (=> d!143229 (= lt!590635 (lemmaContainsTupThenGetReturnValue!359 lt!590632 (_1!11787 (tuple2!23553 lt!590506 minValue!1279)) (_2!11787 (tuple2!23553 lt!590506 minValue!1279))))))

(assert (=> d!143229 (= lt!590632 (insertStrictlySorted!488 (toList!10620 lt!590490) (_1!11787 (tuple2!23553 lt!590506 minValue!1279)) (_2!11787 (tuple2!23553 lt!590506 minValue!1279))))))

(assert (=> d!143229 (= (+!4640 lt!590490 (tuple2!23553 lt!590506 minValue!1279)) lt!590633)))

(declare-fun b!1327162 () Bool)

(declare-fun res!880743 () Bool)

(assert (=> b!1327162 (=> (not res!880743) (not e!756424))))

(assert (=> b!1327162 (= res!880743 (= (getValueByKey!714 (toList!10620 lt!590633) (_1!11787 (tuple2!23553 lt!590506 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590506 minValue!1279)))))))

(declare-fun b!1327163 () Bool)

(assert (=> b!1327163 (= e!756424 (contains!8782 (toList!10620 lt!590633) (tuple2!23553 lt!590506 minValue!1279)))))

(assert (= (and d!143229 res!880742) b!1327162))

(assert (= (and b!1327162 res!880743) b!1327163))

(declare-fun m!1216449 () Bool)

(assert (=> d!143229 m!1216449))

(declare-fun m!1216451 () Bool)

(assert (=> d!143229 m!1216451))

(declare-fun m!1216453 () Bool)

(assert (=> d!143229 m!1216453))

(declare-fun m!1216455 () Bool)

(assert (=> d!143229 m!1216455))

(declare-fun m!1216457 () Bool)

(assert (=> b!1327162 m!1216457))

(declare-fun m!1216459 () Bool)

(assert (=> b!1327163 m!1216459))

(assert (=> b!1326998 d!143229))

(declare-fun d!143231 () Bool)

(declare-fun e!756425 () Bool)

(assert (=> d!143231 e!756425))

(declare-fun res!880744 () Bool)

(assert (=> d!143231 (=> (not res!880744) (not e!756425))))

(declare-fun lt!590637 () ListLongMap!21209)

(assert (=> d!143231 (= res!880744 (contains!8779 lt!590637 (_1!11787 (tuple2!23553 lt!590491 zeroValue!1279))))))

(declare-fun lt!590636 () List!30689)

(assert (=> d!143231 (= lt!590637 (ListLongMap!21210 lt!590636))))

(declare-fun lt!590638 () Unit!43717)

(declare-fun lt!590639 () Unit!43717)

(assert (=> d!143231 (= lt!590638 lt!590639)))

(assert (=> d!143231 (= (getValueByKey!714 lt!590636 (_1!11787 (tuple2!23553 lt!590491 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590491 zeroValue!1279))))))

(assert (=> d!143231 (= lt!590639 (lemmaContainsTupThenGetReturnValue!359 lt!590636 (_1!11787 (tuple2!23553 lt!590491 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590491 zeroValue!1279))))))

(assert (=> d!143231 (= lt!590636 (insertStrictlySorted!488 (toList!10620 lt!590493) (_1!11787 (tuple2!23553 lt!590491 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590491 zeroValue!1279))))))

(assert (=> d!143231 (= (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279)) lt!590637)))

(declare-fun b!1327164 () Bool)

(declare-fun res!880745 () Bool)

(assert (=> b!1327164 (=> (not res!880745) (not e!756425))))

(assert (=> b!1327164 (= res!880745 (= (getValueByKey!714 (toList!10620 lt!590637) (_1!11787 (tuple2!23553 lt!590491 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590491 zeroValue!1279)))))))

(declare-fun b!1327165 () Bool)

(assert (=> b!1327165 (= e!756425 (contains!8782 (toList!10620 lt!590637) (tuple2!23553 lt!590491 zeroValue!1279)))))

(assert (= (and d!143231 res!880744) b!1327164))

(assert (= (and b!1327164 res!880745) b!1327165))

(declare-fun m!1216461 () Bool)

(assert (=> d!143231 m!1216461))

(declare-fun m!1216463 () Bool)

(assert (=> d!143231 m!1216463))

(declare-fun m!1216465 () Bool)

(assert (=> d!143231 m!1216465))

(declare-fun m!1216467 () Bool)

(assert (=> d!143231 m!1216467))

(declare-fun m!1216469 () Bool)

(assert (=> b!1327164 m!1216469))

(declare-fun m!1216471 () Bool)

(assert (=> b!1327165 m!1216471))

(assert (=> b!1326998 d!143231))

(declare-fun d!143233 () Bool)

(declare-fun e!756426 () Bool)

(assert (=> d!143233 e!756426))

(declare-fun res!880746 () Bool)

(assert (=> d!143233 (=> (not res!880746) (not e!756426))))

(declare-fun lt!590641 () ListLongMap!21209)

(assert (=> d!143233 (= res!880746 (contains!8779 lt!590641 (_1!11787 (tuple2!23553 lt!590489 zeroValue!1279))))))

(declare-fun lt!590640 () List!30689)

(assert (=> d!143233 (= lt!590641 (ListLongMap!21210 lt!590640))))

(declare-fun lt!590642 () Unit!43717)

(declare-fun lt!590643 () Unit!43717)

(assert (=> d!143233 (= lt!590642 lt!590643)))

(assert (=> d!143233 (= (getValueByKey!714 lt!590640 (_1!11787 (tuple2!23553 lt!590489 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590489 zeroValue!1279))))))

(assert (=> d!143233 (= lt!590643 (lemmaContainsTupThenGetReturnValue!359 lt!590640 (_1!11787 (tuple2!23553 lt!590489 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590489 zeroValue!1279))))))

(assert (=> d!143233 (= lt!590640 (insertStrictlySorted!488 (toList!10620 lt!590488) (_1!11787 (tuple2!23553 lt!590489 zeroValue!1279)) (_2!11787 (tuple2!23553 lt!590489 zeroValue!1279))))))

(assert (=> d!143233 (= (+!4640 lt!590488 (tuple2!23553 lt!590489 zeroValue!1279)) lt!590641)))

(declare-fun b!1327166 () Bool)

(declare-fun res!880747 () Bool)

(assert (=> b!1327166 (=> (not res!880747) (not e!756426))))

(assert (=> b!1327166 (= res!880747 (= (getValueByKey!714 (toList!10620 lt!590641) (_1!11787 (tuple2!23553 lt!590489 zeroValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590489 zeroValue!1279)))))))

(declare-fun b!1327167 () Bool)

(assert (=> b!1327167 (= e!756426 (contains!8782 (toList!10620 lt!590641) (tuple2!23553 lt!590489 zeroValue!1279)))))

(assert (= (and d!143233 res!880746) b!1327166))

(assert (= (and b!1327166 res!880747) b!1327167))

(declare-fun m!1216473 () Bool)

(assert (=> d!143233 m!1216473))

(declare-fun m!1216475 () Bool)

(assert (=> d!143233 m!1216475))

(declare-fun m!1216477 () Bool)

(assert (=> d!143233 m!1216477))

(declare-fun m!1216479 () Bool)

(assert (=> d!143233 m!1216479))

(declare-fun m!1216481 () Bool)

(assert (=> b!1327166 m!1216481))

(declare-fun m!1216483 () Bool)

(assert (=> b!1327167 m!1216483))

(assert (=> b!1326998 d!143233))

(declare-fun d!143235 () Bool)

(assert (=> d!143235 (= (apply!1031 (+!4640 lt!590488 (tuple2!23553 lt!590489 zeroValue!1279)) lt!590497) (apply!1031 lt!590488 lt!590497))))

(declare-fun lt!590644 () Unit!43717)

(assert (=> d!143235 (= lt!590644 (choose!1953 lt!590488 lt!590489 zeroValue!1279 lt!590497))))

(declare-fun e!756427 () Bool)

(assert (=> d!143235 e!756427))

(declare-fun res!880748 () Bool)

(assert (=> d!143235 (=> (not res!880748) (not e!756427))))

(assert (=> d!143235 (= res!880748 (contains!8779 lt!590488 lt!590497))))

(assert (=> d!143235 (= (addApplyDifferent!573 lt!590488 lt!590489 zeroValue!1279 lt!590497) lt!590644)))

(declare-fun b!1327168 () Bool)

(assert (=> b!1327168 (= e!756427 (not (= lt!590497 lt!590489)))))

(assert (= (and d!143235 res!880748) b!1327168))

(assert (=> d!143235 m!1216145))

(assert (=> d!143235 m!1216147))

(declare-fun m!1216485 () Bool)

(assert (=> d!143235 m!1216485))

(assert (=> d!143235 m!1216137))

(assert (=> d!143235 m!1216145))

(declare-fun m!1216487 () Bool)

(assert (=> d!143235 m!1216487))

(assert (=> b!1326998 d!143235))

(declare-fun d!143237 () Bool)

(assert (=> d!143237 (= (apply!1031 lt!590490 lt!590502) (get!21816 (getValueByKey!714 (toList!10620 lt!590490) lt!590502)))))

(declare-fun bs!37964 () Bool)

(assert (= bs!37964 d!143237))

(declare-fun m!1216489 () Bool)

(assert (=> bs!37964 m!1216489))

(assert (=> bs!37964 m!1216489))

(declare-fun m!1216491 () Bool)

(assert (=> bs!37964 m!1216491))

(assert (=> b!1326998 d!143237))

(declare-fun d!143239 () Bool)

(assert (=> d!143239 (= (apply!1031 (+!4640 lt!590500 (tuple2!23553 lt!590496 minValue!1279)) lt!590505) (apply!1031 lt!590500 lt!590505))))

(declare-fun lt!590645 () Unit!43717)

(assert (=> d!143239 (= lt!590645 (choose!1953 lt!590500 lt!590496 minValue!1279 lt!590505))))

(declare-fun e!756428 () Bool)

(assert (=> d!143239 e!756428))

(declare-fun res!880749 () Bool)

(assert (=> d!143239 (=> (not res!880749) (not e!756428))))

(assert (=> d!143239 (= res!880749 (contains!8779 lt!590500 lt!590505))))

(assert (=> d!143239 (= (addApplyDifferent!573 lt!590500 lt!590496 minValue!1279 lt!590505) lt!590645)))

(declare-fun b!1327169 () Bool)

(assert (=> b!1327169 (= e!756428 (not (= lt!590505 lt!590496)))))

(assert (= (and d!143239 res!880749) b!1327169))

(assert (=> d!143239 m!1216139))

(assert (=> d!143239 m!1216141))

(declare-fun m!1216493 () Bool)

(assert (=> d!143239 m!1216493))

(assert (=> d!143239 m!1216125))

(assert (=> d!143239 m!1216139))

(declare-fun m!1216495 () Bool)

(assert (=> d!143239 m!1216495))

(assert (=> b!1326998 d!143239))

(declare-fun d!143241 () Bool)

(assert (=> d!143241 (= (apply!1031 (+!4640 lt!590490 (tuple2!23553 lt!590506 minValue!1279)) lt!590502) (get!21816 (getValueByKey!714 (toList!10620 (+!4640 lt!590490 (tuple2!23553 lt!590506 minValue!1279))) lt!590502)))))

(declare-fun bs!37965 () Bool)

(assert (= bs!37965 d!143241))

(declare-fun m!1216497 () Bool)

(assert (=> bs!37965 m!1216497))

(assert (=> bs!37965 m!1216497))

(declare-fun m!1216499 () Bool)

(assert (=> bs!37965 m!1216499))

(assert (=> b!1326998 d!143241))

(declare-fun d!143243 () Bool)

(assert (=> d!143243 (contains!8779 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279)) lt!590499)))

(declare-fun lt!590646 () Unit!43717)

(assert (=> d!143243 (= lt!590646 (choose!1954 lt!590493 lt!590491 zeroValue!1279 lt!590499))))

(assert (=> d!143243 (contains!8779 lt!590493 lt!590499)))

(assert (=> d!143243 (= (addStillContains!1164 lt!590493 lt!590491 zeroValue!1279 lt!590499) lt!590646)))

(declare-fun bs!37966 () Bool)

(assert (= bs!37966 d!143243))

(assert (=> bs!37966 m!1216121))

(assert (=> bs!37966 m!1216121))

(assert (=> bs!37966 m!1216123))

(declare-fun m!1216501 () Bool)

(assert (=> bs!37966 m!1216501))

(declare-fun m!1216503 () Bool)

(assert (=> bs!37966 m!1216503))

(assert (=> b!1326998 d!143243))

(declare-fun d!143245 () Bool)

(assert (=> d!143245 (= (apply!1031 lt!590500 lt!590505) (get!21816 (getValueByKey!714 (toList!10620 lt!590500) lt!590505)))))

(declare-fun bs!37967 () Bool)

(assert (= bs!37967 d!143245))

(declare-fun m!1216505 () Bool)

(assert (=> bs!37967 m!1216505))

(assert (=> bs!37967 m!1216505))

(declare-fun m!1216507 () Bool)

(assert (=> bs!37967 m!1216507))

(assert (=> b!1326998 d!143245))

(declare-fun b!1327170 () Bool)

(declare-fun e!756431 () Bool)

(assert (=> b!1327170 (= e!756431 (validKeyInArray!0 (select (arr!43283 _keys!1609) from!2000)))))

(assert (=> b!1327170 (bvsge from!2000 #b00000000000000000000000000000000)))

(declare-fun b!1327171 () Bool)

(declare-fun e!756435 () Bool)

(declare-fun e!756430 () Bool)

(assert (=> b!1327171 (= e!756435 e!756430)))

(assert (=> b!1327171 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)))))

(declare-fun res!880752 () Bool)

(declare-fun lt!590647 () ListLongMap!21209)

(assert (=> b!1327171 (= res!880752 (contains!8779 lt!590647 (select (arr!43283 _keys!1609) from!2000)))))

(assert (=> b!1327171 (=> (not res!880752) (not e!756430))))

(declare-fun b!1327172 () Bool)

(assert (=> b!1327172 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)))))

(assert (=> b!1327172 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43834 _values!1337)))))

(assert (=> b!1327172 (= e!756430 (= (apply!1031 lt!590647 (select (arr!43283 _keys!1609) from!2000)) (get!21815 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1327173 () Bool)

(declare-fun lt!590651 () Unit!43717)

(declare-fun lt!590649 () Unit!43717)

(assert (=> b!1327173 (= lt!590651 lt!590649)))

(declare-fun lt!590650 () (_ BitVec 64))

(declare-fun lt!590648 () ListLongMap!21209)

(declare-fun lt!590652 () V!53579)

(declare-fun lt!590653 () (_ BitVec 64))

(assert (=> b!1327173 (not (contains!8779 (+!4640 lt!590648 (tuple2!23553 lt!590650 lt!590652)) lt!590653))))

(assert (=> b!1327173 (= lt!590649 (addStillNotContains!495 lt!590648 lt!590650 lt!590652 lt!590653))))

(assert (=> b!1327173 (= lt!590653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1327173 (= lt!590652 (get!21815 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1327173 (= lt!590650 (select (arr!43283 _keys!1609) from!2000))))

(declare-fun call!64809 () ListLongMap!21209)

(assert (=> b!1327173 (= lt!590648 call!64809)))

(declare-fun e!756432 () ListLongMap!21209)

(assert (=> b!1327173 (= e!756432 (+!4640 call!64809 (tuple2!23553 (select (arr!43283 _keys!1609) from!2000) (get!21815 (select (arr!43284 _values!1337) from!2000) (dynLambda!3579 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1327175 () Bool)

(declare-fun e!756433 () ListLongMap!21209)

(assert (=> b!1327175 (= e!756433 e!756432)))

(declare-fun c!125871 () Bool)

(assert (=> b!1327175 (= c!125871 (validKeyInArray!0 (select (arr!43283 _keys!1609) from!2000)))))

(declare-fun b!1327176 () Bool)

(declare-fun e!756434 () Bool)

(assert (=> b!1327176 (= e!756435 e!756434)))

(declare-fun c!125872 () Bool)

(assert (=> b!1327176 (= c!125872 (bvslt from!2000 (size!43833 _keys!1609)))))

(declare-fun bm!64806 () Bool)

(assert (=> bm!64806 (= call!64809 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1327177 () Bool)

(assert (=> b!1327177 (= e!756432 call!64809)))

(declare-fun b!1327178 () Bool)

(declare-fun e!756429 () Bool)

(assert (=> b!1327178 (= e!756429 e!756435)))

(declare-fun c!125874 () Bool)

(assert (=> b!1327178 (= c!125874 e!756431)))

(declare-fun res!880751 () Bool)

(assert (=> b!1327178 (=> (not res!880751) (not e!756431))))

(assert (=> b!1327178 (= res!880751 (bvslt from!2000 (size!43833 _keys!1609)))))

(declare-fun b!1327179 () Bool)

(assert (=> b!1327179 (= e!756433 (ListLongMap!21210 Nil!30686))))

(declare-fun b!1327174 () Bool)

(declare-fun res!880750 () Bool)

(assert (=> b!1327174 (=> (not res!880750) (not e!756429))))

(assert (=> b!1327174 (= res!880750 (not (contains!8779 lt!590647 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!143247 () Bool)

(assert (=> d!143247 e!756429))

(declare-fun res!880753 () Bool)

(assert (=> d!143247 (=> (not res!880753) (not e!756429))))

(assert (=> d!143247 (= res!880753 (not (contains!8779 lt!590647 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!143247 (= lt!590647 e!756433)))

(declare-fun c!125873 () Bool)

(assert (=> d!143247 (= c!125873 (bvsge from!2000 (size!43833 _keys!1609)))))

(assert (=> d!143247 (validMask!0 mask!2019)))

(assert (=> d!143247 (= (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!590647)))

(declare-fun b!1327180 () Bool)

(assert (=> b!1327180 (= e!756434 (= lt!590647 (getCurrentListMapNoExtraKeys!6278 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun b!1327181 () Bool)

(assert (=> b!1327181 (= e!756434 (isEmpty!1080 lt!590647))))

(assert (= (and d!143247 c!125873) b!1327179))

(assert (= (and d!143247 (not c!125873)) b!1327175))

(assert (= (and b!1327175 c!125871) b!1327173))

(assert (= (and b!1327175 (not c!125871)) b!1327177))

(assert (= (or b!1327173 b!1327177) bm!64806))

(assert (= (and d!143247 res!880753) b!1327174))

(assert (= (and b!1327174 res!880750) b!1327178))

(assert (= (and b!1327178 res!880751) b!1327170))

(assert (= (and b!1327178 c!125874) b!1327171))

(assert (= (and b!1327178 (not c!125874)) b!1327176))

(assert (= (and b!1327171 res!880752) b!1327172))

(assert (= (and b!1327176 c!125872) b!1327180))

(assert (= (and b!1327176 (not c!125872)) b!1327181))

(declare-fun b_lambda!23843 () Bool)

(assert (=> (not b_lambda!23843) (not b!1327172)))

(assert (=> b!1327172 t!44696))

(declare-fun b_and!49187 () Bool)

(assert (= b_and!49185 (and (=> t!44696 result!24677) b_and!49187)))

(declare-fun b_lambda!23845 () Bool)

(assert (=> (not b_lambda!23845) (not b!1327173)))

(assert (=> b!1327173 t!44696))

(declare-fun b_and!49189 () Bool)

(assert (= b_and!49187 (and (=> t!44696 result!24677) b_and!49189)))

(declare-fun m!1216509 () Bool)

(assert (=> d!143247 m!1216509))

(assert (=> d!143247 m!1216065))

(assert (=> b!1327171 m!1216047))

(assert (=> b!1327171 m!1216047))

(declare-fun m!1216511 () Bool)

(assert (=> b!1327171 m!1216511))

(assert (=> b!1327170 m!1216047))

(assert (=> b!1327170 m!1216047))

(assert (=> b!1327170 m!1216049))

(declare-fun m!1216513 () Bool)

(assert (=> bm!64806 m!1216513))

(assert (=> b!1327173 m!1216159))

(assert (=> b!1327173 m!1216155))

(assert (=> b!1327173 m!1216161))

(assert (=> b!1327173 m!1216159))

(declare-fun m!1216515 () Bool)

(assert (=> b!1327173 m!1216515))

(declare-fun m!1216517 () Bool)

(assert (=> b!1327173 m!1216517))

(assert (=> b!1327173 m!1216155))

(declare-fun m!1216519 () Bool)

(assert (=> b!1327173 m!1216519))

(declare-fun m!1216521 () Bool)

(assert (=> b!1327173 m!1216521))

(assert (=> b!1327173 m!1216047))

(assert (=> b!1327173 m!1216519))

(assert (=> b!1327180 m!1216513))

(assert (=> b!1327175 m!1216047))

(assert (=> b!1327175 m!1216047))

(assert (=> b!1327175 m!1216049))

(declare-fun m!1216523 () Bool)

(assert (=> b!1327181 m!1216523))

(declare-fun m!1216525 () Bool)

(assert (=> b!1327174 m!1216525))

(assert (=> b!1327172 m!1216159))

(assert (=> b!1327172 m!1216155))

(assert (=> b!1327172 m!1216161))

(assert (=> b!1327172 m!1216159))

(assert (=> b!1327172 m!1216047))

(declare-fun m!1216527 () Bool)

(assert (=> b!1327172 m!1216527))

(assert (=> b!1327172 m!1216155))

(assert (=> b!1327172 m!1216047))

(assert (=> b!1326998 d!143247))

(declare-fun d!143249 () Bool)

(assert (=> d!143249 (= (apply!1031 (+!4640 lt!590488 (tuple2!23553 lt!590489 zeroValue!1279)) lt!590497) (get!21816 (getValueByKey!714 (toList!10620 (+!4640 lt!590488 (tuple2!23553 lt!590489 zeroValue!1279))) lt!590497)))))

(declare-fun bs!37968 () Bool)

(assert (= bs!37968 d!143249))

(declare-fun m!1216529 () Bool)

(assert (=> bs!37968 m!1216529))

(assert (=> bs!37968 m!1216529))

(declare-fun m!1216531 () Bool)

(assert (=> bs!37968 m!1216531))

(assert (=> b!1326998 d!143249))

(declare-fun d!143251 () Bool)

(declare-fun e!756436 () Bool)

(assert (=> d!143251 e!756436))

(declare-fun res!880754 () Bool)

(assert (=> d!143251 (=> res!880754 e!756436)))

(declare-fun lt!590654 () Bool)

(assert (=> d!143251 (= res!880754 (not lt!590654))))

(declare-fun lt!590655 () Bool)

(assert (=> d!143251 (= lt!590654 lt!590655)))

(declare-fun lt!590657 () Unit!43717)

(declare-fun e!756437 () Unit!43717)

(assert (=> d!143251 (= lt!590657 e!756437)))

(declare-fun c!125875 () Bool)

(assert (=> d!143251 (= c!125875 lt!590655)))

(assert (=> d!143251 (= lt!590655 (containsKey!736 (toList!10620 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279))) lt!590499))))

(assert (=> d!143251 (= (contains!8779 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279)) lt!590499) lt!590654)))

(declare-fun b!1327182 () Bool)

(declare-fun lt!590656 () Unit!43717)

(assert (=> b!1327182 (= e!756437 lt!590656)))

(assert (=> b!1327182 (= lt!590656 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279))) lt!590499))))

(assert (=> b!1327182 (isDefined!521 (getValueByKey!714 (toList!10620 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279))) lt!590499))))

(declare-fun b!1327183 () Bool)

(declare-fun Unit!43728 () Unit!43717)

(assert (=> b!1327183 (= e!756437 Unit!43728)))

(declare-fun b!1327184 () Bool)

(assert (=> b!1327184 (= e!756436 (isDefined!521 (getValueByKey!714 (toList!10620 (+!4640 lt!590493 (tuple2!23553 lt!590491 zeroValue!1279))) lt!590499)))))

(assert (= (and d!143251 c!125875) b!1327182))

(assert (= (and d!143251 (not c!125875)) b!1327183))

(assert (= (and d!143251 (not res!880754)) b!1327184))

(declare-fun m!1216533 () Bool)

(assert (=> d!143251 m!1216533))

(declare-fun m!1216535 () Bool)

(assert (=> b!1327182 m!1216535))

(declare-fun m!1216537 () Bool)

(assert (=> b!1327182 m!1216537))

(assert (=> b!1327182 m!1216537))

(declare-fun m!1216539 () Bool)

(assert (=> b!1327182 m!1216539))

(assert (=> b!1327184 m!1216537))

(assert (=> b!1327184 m!1216537))

(assert (=> b!1327184 m!1216539))

(assert (=> b!1326998 d!143251))

(declare-fun d!143253 () Bool)

(assert (=> d!143253 (= (apply!1031 (+!4640 lt!590490 (tuple2!23553 lt!590506 minValue!1279)) lt!590502) (apply!1031 lt!590490 lt!590502))))

(declare-fun lt!590658 () Unit!43717)

(assert (=> d!143253 (= lt!590658 (choose!1953 lt!590490 lt!590506 minValue!1279 lt!590502))))

(declare-fun e!756438 () Bool)

(assert (=> d!143253 e!756438))

(declare-fun res!880755 () Bool)

(assert (=> d!143253 (=> (not res!880755) (not e!756438))))

(assert (=> d!143253 (= res!880755 (contains!8779 lt!590490 lt!590502))))

(assert (=> d!143253 (= (addApplyDifferent!573 lt!590490 lt!590506 minValue!1279 lt!590502) lt!590658)))

(declare-fun b!1327185 () Bool)

(assert (=> b!1327185 (= e!756438 (not (= lt!590502 lt!590506)))))

(assert (= (and d!143253 res!880755) b!1327185))

(assert (=> d!143253 m!1216129))

(assert (=> d!143253 m!1216149))

(declare-fun m!1216541 () Bool)

(assert (=> d!143253 m!1216541))

(assert (=> d!143253 m!1216151))

(assert (=> d!143253 m!1216129))

(declare-fun m!1216543 () Bool)

(assert (=> d!143253 m!1216543))

(assert (=> b!1326998 d!143253))

(declare-fun d!143255 () Bool)

(assert (=> d!143255 (= (apply!1031 lt!590488 lt!590497) (get!21816 (getValueByKey!714 (toList!10620 lt!590488) lt!590497)))))

(declare-fun bs!37969 () Bool)

(assert (= bs!37969 d!143255))

(declare-fun m!1216545 () Bool)

(assert (=> bs!37969 m!1216545))

(assert (=> bs!37969 m!1216545))

(declare-fun m!1216547 () Bool)

(assert (=> bs!37969 m!1216547))

(assert (=> b!1326998 d!143255))

(declare-fun d!143257 () Bool)

(assert (=> d!143257 (= (apply!1031 (+!4640 lt!590500 (tuple2!23553 lt!590496 minValue!1279)) lt!590505) (get!21816 (getValueByKey!714 (toList!10620 (+!4640 lt!590500 (tuple2!23553 lt!590496 minValue!1279))) lt!590505)))))

(declare-fun bs!37970 () Bool)

(assert (= bs!37970 d!143257))

(declare-fun m!1216549 () Bool)

(assert (=> bs!37970 m!1216549))

(assert (=> bs!37970 m!1216549))

(declare-fun m!1216551 () Bool)

(assert (=> bs!37970 m!1216551))

(assert (=> b!1326998 d!143257))

(declare-fun d!143259 () Bool)

(declare-fun e!756439 () Bool)

(assert (=> d!143259 e!756439))

(declare-fun res!880756 () Bool)

(assert (=> d!143259 (=> (not res!880756) (not e!756439))))

(declare-fun lt!590660 () ListLongMap!21209)

(assert (=> d!143259 (= res!880756 (contains!8779 lt!590660 (_1!11787 (tuple2!23553 lt!590496 minValue!1279))))))

(declare-fun lt!590659 () List!30689)

(assert (=> d!143259 (= lt!590660 (ListLongMap!21210 lt!590659))))

(declare-fun lt!590661 () Unit!43717)

(declare-fun lt!590662 () Unit!43717)

(assert (=> d!143259 (= lt!590661 lt!590662)))

(assert (=> d!143259 (= (getValueByKey!714 lt!590659 (_1!11787 (tuple2!23553 lt!590496 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590496 minValue!1279))))))

(assert (=> d!143259 (= lt!590662 (lemmaContainsTupThenGetReturnValue!359 lt!590659 (_1!11787 (tuple2!23553 lt!590496 minValue!1279)) (_2!11787 (tuple2!23553 lt!590496 minValue!1279))))))

(assert (=> d!143259 (= lt!590659 (insertStrictlySorted!488 (toList!10620 lt!590500) (_1!11787 (tuple2!23553 lt!590496 minValue!1279)) (_2!11787 (tuple2!23553 lt!590496 minValue!1279))))))

(assert (=> d!143259 (= (+!4640 lt!590500 (tuple2!23553 lt!590496 minValue!1279)) lt!590660)))

(declare-fun b!1327186 () Bool)

(declare-fun res!880757 () Bool)

(assert (=> b!1327186 (=> (not res!880757) (not e!756439))))

(assert (=> b!1327186 (= res!880757 (= (getValueByKey!714 (toList!10620 lt!590660) (_1!11787 (tuple2!23553 lt!590496 minValue!1279))) (Some!765 (_2!11787 (tuple2!23553 lt!590496 minValue!1279)))))))

(declare-fun b!1327187 () Bool)

(assert (=> b!1327187 (= e!756439 (contains!8782 (toList!10620 lt!590660) (tuple2!23553 lt!590496 minValue!1279)))))

(assert (= (and d!143259 res!880756) b!1327186))

(assert (= (and b!1327186 res!880757) b!1327187))

(declare-fun m!1216553 () Bool)

(assert (=> d!143259 m!1216553))

(declare-fun m!1216555 () Bool)

(assert (=> d!143259 m!1216555))

(declare-fun m!1216557 () Bool)

(assert (=> d!143259 m!1216557))

(declare-fun m!1216559 () Bool)

(assert (=> d!143259 m!1216559))

(declare-fun m!1216561 () Bool)

(assert (=> b!1327186 m!1216561))

(declare-fun m!1216563 () Bool)

(assert (=> b!1327187 m!1216563))

(assert (=> b!1326998 d!143259))

(declare-fun d!143261 () Bool)

(declare-fun e!756440 () Bool)

(assert (=> d!143261 e!756440))

(declare-fun res!880758 () Bool)

(assert (=> d!143261 (=> (not res!880758) (not e!756440))))

(declare-fun lt!590664 () ListLongMap!21209)

(assert (=> d!143261 (= res!880758 (contains!8779 lt!590664 (_1!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!590663 () List!30689)

(assert (=> d!143261 (= lt!590664 (ListLongMap!21210 lt!590663))))

(declare-fun lt!590665 () Unit!43717)

(declare-fun lt!590666 () Unit!43717)

(assert (=> d!143261 (= lt!590665 lt!590666)))

(assert (=> d!143261 (= (getValueByKey!714 lt!590663 (_1!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!765 (_2!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143261 (= lt!590666 (lemmaContainsTupThenGetReturnValue!359 lt!590663 (_1!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143261 (= lt!590663 (insertStrictlySorted!488 (toList!10620 (ite c!125838 call!64795 (ite c!125837 call!64797 call!64800))) (_1!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143261 (= (+!4640 (ite c!125838 call!64795 (ite c!125837 call!64797 call!64800)) (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590664)))

(declare-fun b!1327188 () Bool)

(declare-fun res!880759 () Bool)

(assert (=> b!1327188 (=> (not res!880759) (not e!756440))))

(assert (=> b!1327188 (= res!880759 (= (getValueByKey!714 (toList!10620 lt!590664) (_1!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!765 (_2!11787 (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1327189 () Bool)

(assert (=> b!1327189 (= e!756440 (contains!8782 (toList!10620 lt!590664) (ite (or c!125838 c!125837) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143261 res!880758) b!1327188))

(assert (= (and b!1327188 res!880759) b!1327189))

(declare-fun m!1216565 () Bool)

(assert (=> d!143261 m!1216565))

(declare-fun m!1216567 () Bool)

(assert (=> d!143261 m!1216567))

(declare-fun m!1216569 () Bool)

(assert (=> d!143261 m!1216569))

(declare-fun m!1216571 () Bool)

(assert (=> d!143261 m!1216571))

(declare-fun m!1216573 () Bool)

(assert (=> b!1327188 m!1216573))

(declare-fun m!1216575 () Bool)

(assert (=> b!1327189 m!1216575))

(assert (=> bm!64794 d!143261))

(declare-fun d!143263 () Bool)

(declare-fun res!880764 () Bool)

(declare-fun e!756445 () Bool)

(assert (=> d!143263 (=> res!880764 e!756445)))

(assert (=> d!143263 (= res!880764 (and ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143263 (= (containsKey!736 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!756445)))

(declare-fun b!1327194 () Bool)

(declare-fun e!756446 () Bool)

(assert (=> b!1327194 (= e!756445 e!756446)))

(declare-fun res!880765 () Bool)

(assert (=> b!1327194 (=> (not res!880765) (not e!756446))))

(assert (=> b!1327194 (= res!880765 (and (or (not ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) (bvsle (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)) ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (bvslt (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1327195 () Bool)

(assert (=> b!1327195 (= e!756446 (containsKey!736 (t!44693 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!143263 (not res!880764)) b!1327194))

(assert (= (and b!1327194 res!880765) b!1327195))

(declare-fun m!1216577 () Bool)

(assert (=> b!1327195 m!1216577))

(assert (=> d!143147 d!143263))

(declare-fun d!143265 () Bool)

(declare-fun e!756447 () Bool)

(assert (=> d!143265 e!756447))

(declare-fun res!880766 () Bool)

(assert (=> d!143265 (=> (not res!880766) (not e!756447))))

(declare-fun lt!590668 () ListLongMap!21209)

(assert (=> d!143265 (= res!880766 (contains!8779 lt!590668 (_1!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!590667 () List!30689)

(assert (=> d!143265 (= lt!590668 (ListLongMap!21210 lt!590667))))

(declare-fun lt!590669 () Unit!43717)

(declare-fun lt!590670 () Unit!43717)

(assert (=> d!143265 (= lt!590669 lt!590670)))

(assert (=> d!143265 (= (getValueByKey!714 lt!590667 (_1!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!765 (_2!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143265 (= lt!590670 (lemmaContainsTupThenGetReturnValue!359 lt!590667 (_1!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143265 (= lt!590667 (insertStrictlySorted!488 (toList!10620 (ite c!125831 call!64788 (ite c!125830 call!64790 call!64793))) (_1!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!143265 (= (+!4640 (ite c!125831 call!64788 (ite c!125830 call!64790 call!64793)) (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!590668)))

(declare-fun b!1327196 () Bool)

(declare-fun res!880767 () Bool)

(assert (=> b!1327196 (=> (not res!880767) (not e!756447))))

(assert (=> b!1327196 (= res!880767 (= (getValueByKey!714 (toList!10620 lt!590668) (_1!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!765 (_2!11787 (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1327197 () Bool)

(assert (=> b!1327197 (= e!756447 (contains!8782 (toList!10620 lt!590668) (ite (or c!125831 c!125830) (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23553 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!143265 res!880766) b!1327196))

(assert (= (and b!1327196 res!880767) b!1327197))

(declare-fun m!1216579 () Bool)

(assert (=> d!143265 m!1216579))

(declare-fun m!1216581 () Bool)

(assert (=> d!143265 m!1216581))

(declare-fun m!1216583 () Bool)

(assert (=> d!143265 m!1216583))

(declare-fun m!1216585 () Bool)

(assert (=> d!143265 m!1216585))

(declare-fun m!1216587 () Bool)

(assert (=> b!1327196 m!1216587))

(declare-fun m!1216589 () Bool)

(assert (=> b!1327197 m!1216589))

(assert (=> bm!64787 d!143265))

(declare-fun b!1327198 () Bool)

(declare-fun e!756448 () Bool)

(declare-fun call!64810 () Bool)

(assert (=> b!1327198 (= e!756448 call!64810)))

(declare-fun b!1327199 () Bool)

(declare-fun e!756450 () Bool)

(declare-fun e!756449 () Bool)

(assert (=> b!1327199 (= e!756450 e!756449)))

(declare-fun c!125876 () Bool)

(assert (=> b!1327199 (= c!125876 (validKeyInArray!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1327201 () Bool)

(assert (=> b!1327201 (= e!756449 e!756448)))

(declare-fun lt!590672 () (_ BitVec 64))

(assert (=> b!1327201 (= lt!590672 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!590673 () Unit!43717)

(assert (=> b!1327201 (= lt!590673 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590672 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1327201 (arrayContainsKey!0 _keys!1609 lt!590672 #b00000000000000000000000000000000)))

(declare-fun lt!590671 () Unit!43717)

(assert (=> b!1327201 (= lt!590671 lt!590673)))

(declare-fun res!880768 () Bool)

(assert (=> b!1327201 (= res!880768 (= (seekEntryOrOpen!0 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1609 mask!2019) (Found!10042 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1327201 (=> (not res!880768) (not e!756448))))

(declare-fun bm!64807 () Bool)

(assert (=> bm!64807 (= call!64810 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1327200 () Bool)

(assert (=> b!1327200 (= e!756449 call!64810)))

(declare-fun d!143267 () Bool)

(declare-fun res!880769 () Bool)

(assert (=> d!143267 (=> res!880769 e!756450)))

(assert (=> d!143267 (= res!880769 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43833 _keys!1609)))))

(assert (=> d!143267 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019) e!756450)))

(assert (= (and d!143267 (not res!880769)) b!1327199))

(assert (= (and b!1327199 c!125876) b!1327201))

(assert (= (and b!1327199 (not c!125876)) b!1327200))

(assert (= (and b!1327201 res!880768) b!1327198))

(assert (= (or b!1327198 b!1327200) bm!64807))

(assert (=> b!1327199 m!1216279))

(assert (=> b!1327199 m!1216279))

(assert (=> b!1327199 m!1216283))

(assert (=> b!1327201 m!1216279))

(declare-fun m!1216591 () Bool)

(assert (=> b!1327201 m!1216591))

(declare-fun m!1216593 () Bool)

(assert (=> b!1327201 m!1216593))

(assert (=> b!1327201 m!1216279))

(declare-fun m!1216595 () Bool)

(assert (=> b!1327201 m!1216595))

(declare-fun m!1216597 () Bool)

(assert (=> bm!64807 m!1216597))

(assert (=> bm!64801 d!143267))

(declare-fun d!143269 () Bool)

(assert (=> d!143269 (= (apply!1031 lt!590529 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21816 (getValueByKey!714 (toList!10620 lt!590529) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37971 () Bool)

(assert (= bs!37971 d!143269))

(assert (=> bs!37971 m!1216243))

(assert (=> bs!37971 m!1216243))

(declare-fun m!1216599 () Bool)

(assert (=> bs!37971 m!1216599))

(assert (=> b!1327021 d!143269))

(declare-fun d!143271 () Bool)

(assert (=> d!143271 (arrayContainsKey!0 _keys!1609 lt!590543 #b00000000000000000000000000000000)))

(declare-fun lt!590676 () Unit!43717)

(declare-fun choose!13 (array!89622 (_ BitVec 64) (_ BitVec 32)) Unit!43717)

(assert (=> d!143271 (= lt!590676 (choose!13 _keys!1609 lt!590543 #b00000000000000000000000000000000))))

(assert (=> d!143271 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!143271 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!590543 #b00000000000000000000000000000000) lt!590676)))

(declare-fun bs!37972 () Bool)

(assert (= bs!37972 d!143271))

(assert (=> bs!37972 m!1216231))

(declare-fun m!1216601 () Bool)

(assert (=> bs!37972 m!1216601))

(assert (=> b!1327045 d!143271))

(declare-fun d!143273 () Bool)

(declare-fun res!880774 () Bool)

(declare-fun e!756455 () Bool)

(assert (=> d!143273 (=> res!880774 e!756455)))

(assert (=> d!143273 (= res!880774 (= (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) lt!590543))))

(assert (=> d!143273 (= (arrayContainsKey!0 _keys!1609 lt!590543 #b00000000000000000000000000000000) e!756455)))

(declare-fun b!1327206 () Bool)

(declare-fun e!756456 () Bool)

(assert (=> b!1327206 (= e!756455 e!756456)))

(declare-fun res!880775 () Bool)

(assert (=> b!1327206 (=> (not res!880775) (not e!756456))))

(assert (=> b!1327206 (= res!880775 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43833 _keys!1609)))))

(declare-fun b!1327207 () Bool)

(assert (=> b!1327207 (= e!756456 (arrayContainsKey!0 _keys!1609 lt!590543 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!143273 (not res!880774)) b!1327206))

(assert (= (and b!1327206 res!880775) b!1327207))

(assert (=> d!143273 m!1216095))

(declare-fun m!1216603 () Bool)

(assert (=> b!1327207 m!1216603))

(assert (=> b!1327045 d!143273))

(declare-fun b!1327220 () Bool)

(declare-fun e!756464 () SeekEntryResult!10042)

(declare-fun lt!590683 () SeekEntryResult!10042)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89622 (_ BitVec 32)) SeekEntryResult!10042)

(assert (=> b!1327220 (= e!756464 (seekKeyOrZeroReturnVacant!0 (x!118311 lt!590683) (index!42541 lt!590683) (index!42541 lt!590683) (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(declare-fun b!1327221 () Bool)

(declare-fun e!756463 () SeekEntryResult!10042)

(declare-fun e!756465 () SeekEntryResult!10042)

(assert (=> b!1327221 (= e!756463 e!756465)))

(declare-fun lt!590685 () (_ BitVec 64))

(assert (=> b!1327221 (= lt!590685 (select (arr!43283 _keys!1609) (index!42541 lt!590683)))))

(declare-fun c!125885 () Bool)

(assert (=> b!1327221 (= c!125885 (= lt!590685 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!143275 () Bool)

(declare-fun lt!590684 () SeekEntryResult!10042)

(assert (=> d!143275 (and (or ((_ is Undefined!10042) lt!590684) (not ((_ is Found!10042) lt!590684)) (and (bvsge (index!42540 lt!590684) #b00000000000000000000000000000000) (bvslt (index!42540 lt!590684) (size!43833 _keys!1609)))) (or ((_ is Undefined!10042) lt!590684) ((_ is Found!10042) lt!590684) (not ((_ is MissingZero!10042) lt!590684)) (and (bvsge (index!42539 lt!590684) #b00000000000000000000000000000000) (bvslt (index!42539 lt!590684) (size!43833 _keys!1609)))) (or ((_ is Undefined!10042) lt!590684) ((_ is Found!10042) lt!590684) ((_ is MissingZero!10042) lt!590684) (not ((_ is MissingVacant!10042) lt!590684)) (and (bvsge (index!42542 lt!590684) #b00000000000000000000000000000000) (bvslt (index!42542 lt!590684) (size!43833 _keys!1609)))) (or ((_ is Undefined!10042) lt!590684) (ite ((_ is Found!10042) lt!590684) (= (select (arr!43283 _keys!1609) (index!42540 lt!590684)) (select (arr!43283 _keys!1609) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10042) lt!590684) (= (select (arr!43283 _keys!1609) (index!42539 lt!590684)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10042) lt!590684) (= (select (arr!43283 _keys!1609) (index!42542 lt!590684)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!143275 (= lt!590684 e!756463)))

(declare-fun c!125884 () Bool)

(assert (=> d!143275 (= c!125884 (and ((_ is Intermediate!10042) lt!590683) (undefined!10854 lt!590683)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89622 (_ BitVec 32)) SeekEntryResult!10042)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!143275 (= lt!590683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) mask!2019) (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(assert (=> d!143275 (validMask!0 mask!2019)))

(assert (=> d!143275 (= (seekEntryOrOpen!0 (select (arr!43283 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) lt!590684)))

(declare-fun b!1327222 () Bool)

(assert (=> b!1327222 (= e!756463 Undefined!10042)))

(declare-fun b!1327223 () Bool)

(assert (=> b!1327223 (= e!756465 (Found!10042 (index!42541 lt!590683)))))

(declare-fun b!1327224 () Bool)

(assert (=> b!1327224 (= e!756464 (MissingZero!10042 (index!42541 lt!590683)))))

(declare-fun b!1327225 () Bool)

(declare-fun c!125883 () Bool)

(assert (=> b!1327225 (= c!125883 (= lt!590685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1327225 (= e!756465 e!756464)))

(assert (= (and d!143275 c!125884) b!1327222))

(assert (= (and d!143275 (not c!125884)) b!1327221))

(assert (= (and b!1327221 c!125885) b!1327223))

(assert (= (and b!1327221 (not c!125885)) b!1327225))

(assert (= (and b!1327225 c!125883) b!1327224))

(assert (= (and b!1327225 (not c!125883)) b!1327220))

(assert (=> b!1327220 m!1216095))

(declare-fun m!1216605 () Bool)

(assert (=> b!1327220 m!1216605))

(declare-fun m!1216607 () Bool)

(assert (=> b!1327221 m!1216607))

(assert (=> d!143275 m!1216065))

(assert (=> d!143275 m!1216095))

(declare-fun m!1216609 () Bool)

(assert (=> d!143275 m!1216609))

(declare-fun m!1216611 () Bool)

(assert (=> d!143275 m!1216611))

(declare-fun m!1216613 () Bool)

(assert (=> d!143275 m!1216613))

(declare-fun m!1216615 () Bool)

(assert (=> d!143275 m!1216615))

(assert (=> d!143275 m!1216609))

(assert (=> d!143275 m!1216095))

(declare-fun m!1216617 () Bool)

(assert (=> d!143275 m!1216617))

(assert (=> b!1327045 d!143275))

(declare-fun d!143277 () Bool)

(assert (=> d!143277 (= (apply!1031 lt!590503 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21816 (getValueByKey!714 (toList!10620 lt!590503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37973 () Bool)

(assert (= bs!37973 d!143277))

(assert (=> bs!37973 m!1216251))

(assert (=> bs!37973 m!1216251))

(declare-fun m!1216619 () Bool)

(assert (=> bs!37973 m!1216619))

(assert (=> b!1326995 d!143277))

(assert (=> bm!64793 d!143203))

(assert (=> bm!64786 d!143247))

(assert (=> b!1327043 d!143179))

(declare-fun d!143279 () Bool)

(assert (=> d!143279 (= (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)) (not (isEmpty!1079 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37974 () Bool)

(assert (= bs!37974 d!143279))

(assert (=> bs!37974 m!1216107))

(declare-fun m!1216621 () Bool)

(assert (=> bs!37974 m!1216621))

(assert (=> b!1326944 d!143279))

(declare-fun b!1327229 () Bool)

(declare-fun e!756467 () Option!766)

(assert (=> b!1327229 (= e!756467 None!764)))

(declare-fun e!756466 () Option!766)

(declare-fun b!1327226 () Bool)

(assert (=> b!1327226 (= e!756466 (Some!765 (_2!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))))

(declare-fun b!1327228 () Bool)

(assert (=> b!1327228 (= e!756467 (getValueByKey!714 (t!44693 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(declare-fun d!143281 () Bool)

(declare-fun c!125886 () Bool)

(assert (=> d!143281 (= c!125886 (and ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143281 (= (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!756466)))

(declare-fun b!1327227 () Bool)

(assert (=> b!1327227 (= e!756466 e!756467)))

(declare-fun c!125887 () Bool)

(assert (=> b!1327227 (= c!125887 (and ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (not (= (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164))))))

(assert (= (and d!143281 c!125886) b!1327226))

(assert (= (and d!143281 (not c!125886)) b!1327227))

(assert (= (and b!1327227 c!125887) b!1327228))

(assert (= (and b!1327227 (not c!125887)) b!1327229))

(declare-fun m!1216623 () Bool)

(assert (=> b!1327228 m!1216623))

(assert (=> b!1326944 d!143281))

(declare-fun d!143283 () Bool)

(declare-fun res!880776 () Bool)

(declare-fun e!756468 () Bool)

(assert (=> d!143283 (=> res!880776 e!756468)))

(assert (=> d!143283 (= res!880776 (and ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(assert (=> d!143283 (= (containsKey!736 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) k0!1164) e!756468)))

(declare-fun b!1327230 () Bool)

(declare-fun e!756469 () Bool)

(assert (=> b!1327230 (= e!756468 e!756469)))

(declare-fun res!880777 () Bool)

(assert (=> b!1327230 (=> (not res!880777) (not e!756469))))

(assert (=> b!1327230 (= res!880777 (and (or (not ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (bvsle (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)) ((_ is Cons!30685) (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvslt (_1!11787 (h!31894 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1327231 () Bool)

(assert (=> b!1327231 (= e!756469 (containsKey!736 (t!44693 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) k0!1164))))

(assert (= (and d!143283 (not res!880776)) b!1327230))

(assert (= (and b!1327230 res!880777) b!1327231))

(declare-fun m!1216625 () Bool)

(assert (=> b!1327231 m!1216625))

(assert (=> d!143157 d!143283))

(assert (=> d!143159 d!143151))

(declare-fun d!143285 () Bool)

(assert (=> d!143285 (isDefined!521 (getValueByKey!714 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun lt!590686 () Unit!43717)

(assert (=> d!143285 (= lt!590686 (choose!1952 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun e!756470 () Bool)

(assert (=> d!143285 e!756470))

(declare-fun res!880778 () Bool)

(assert (=> d!143285 (=> (not res!880778) (not e!756470))))

(assert (=> d!143285 (= res!880778 (isStrictlySorted!877 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))

(assert (=> d!143285 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) lt!590686)))

(declare-fun b!1327232 () Bool)

(assert (=> b!1327232 (= e!756470 (containsKey!736 (toList!10620 (getCurrentListMap!5611 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (= (and d!143285 res!880778) b!1327232))

(assert (=> d!143285 m!1216107))

(assert (=> d!143285 m!1216107))

(assert (=> d!143285 m!1216109))

(declare-fun m!1216627 () Bool)

(assert (=> d!143285 m!1216627))

(declare-fun m!1216629 () Bool)

(assert (=> d!143285 m!1216629))

(assert (=> b!1327232 m!1216103))

(assert (=> b!1326942 d!143285))

(assert (=> b!1326942 d!143279))

(assert (=> b!1326942 d!143281))

(declare-fun d!143287 () Bool)

(assert (=> d!143287 (= (apply!1031 lt!590529 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21816 (getValueByKey!714 (toList!10620 lt!590529) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37975 () Bool)

(assert (= bs!37975 d!143287))

(assert (=> bs!37975 m!1216295))

(assert (=> bs!37975 m!1216295))

(declare-fun m!1216631 () Bool)

(assert (=> bs!37975 m!1216631))

(assert (=> b!1327016 d!143287))

(declare-fun d!143289 () Bool)

(declare-fun e!756471 () Bool)

(assert (=> d!143289 e!756471))

(declare-fun res!880779 () Bool)

(assert (=> d!143289 (=> res!880779 e!756471)))

(declare-fun lt!590687 () Bool)

(assert (=> d!143289 (= res!880779 (not lt!590687))))

(declare-fun lt!590688 () Bool)

(assert (=> d!143289 (= lt!590687 lt!590688)))

(declare-fun lt!590690 () Unit!43717)

(declare-fun e!756472 () Unit!43717)

(assert (=> d!143289 (= lt!590690 e!756472)))

(declare-fun c!125888 () Bool)

(assert (=> d!143289 (= c!125888 lt!590688)))

(assert (=> d!143289 (= lt!590688 (containsKey!736 (toList!10620 lt!590529) (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> d!143289 (= (contains!8779 lt!590529 (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) lt!590687)))

(declare-fun b!1327233 () Bool)

(declare-fun lt!590689 () Unit!43717)

(assert (=> b!1327233 (= e!756472 lt!590689)))

(assert (=> b!1327233 (= lt!590689 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 lt!590529) (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1327233 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590529) (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1327234 () Bool)

(declare-fun Unit!43729 () Unit!43717)

(assert (=> b!1327234 (= e!756472 Unit!43729)))

(declare-fun b!1327235 () Bool)

(assert (=> b!1327235 (= e!756471 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590529) (select (arr!43283 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(assert (= (and d!143289 c!125888) b!1327233))

(assert (= (and d!143289 (not c!125888)) b!1327234))

(assert (= (and d!143289 (not res!880779)) b!1327235))

(assert (=> d!143289 m!1216173))

(declare-fun m!1216633 () Bool)

(assert (=> d!143289 m!1216633))

(assert (=> b!1327233 m!1216173))

(declare-fun m!1216635 () Bool)

(assert (=> b!1327233 m!1216635))

(assert (=> b!1327233 m!1216173))

(assert (=> b!1327233 m!1216317))

(assert (=> b!1327233 m!1216317))

(declare-fun m!1216637 () Bool)

(assert (=> b!1327233 m!1216637))

(assert (=> b!1327235 m!1216173))

(assert (=> b!1327235 m!1216317))

(assert (=> b!1327235 m!1216317))

(assert (=> b!1327235 m!1216637))

(assert (=> b!1327031 d!143289))

(declare-fun d!143291 () Bool)

(assert (=> d!143291 (= (apply!1031 lt!590503 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21816 (getValueByKey!714 (toList!10620 lt!590503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37976 () Bool)

(assert (= bs!37976 d!143291))

(assert (=> bs!37976 m!1216303))

(assert (=> bs!37976 m!1216303))

(declare-fun m!1216639 () Bool)

(assert (=> bs!37976 m!1216639))

(assert (=> b!1326990 d!143291))

(declare-fun d!143293 () Bool)

(declare-fun e!756473 () Bool)

(assert (=> d!143293 e!756473))

(declare-fun res!880780 () Bool)

(assert (=> d!143293 (=> res!880780 e!756473)))

(declare-fun lt!590691 () Bool)

(assert (=> d!143293 (= res!880780 (not lt!590691))))

(declare-fun lt!590692 () Bool)

(assert (=> d!143293 (= lt!590691 lt!590692)))

(declare-fun lt!590694 () Unit!43717)

(declare-fun e!756474 () Unit!43717)

(assert (=> d!143293 (= lt!590694 e!756474)))

(declare-fun c!125889 () Bool)

(assert (=> d!143293 (= c!125889 lt!590692)))

(assert (=> d!143293 (= lt!590692 (containsKey!736 (toList!10620 lt!590503) (select (arr!43283 _keys!1609) from!2000)))))

(assert (=> d!143293 (= (contains!8779 lt!590503 (select (arr!43283 _keys!1609) from!2000)) lt!590691)))

(declare-fun b!1327236 () Bool)

(declare-fun lt!590693 () Unit!43717)

(assert (=> b!1327236 (= e!756474 lt!590693)))

(assert (=> b!1327236 (= lt!590693 (lemmaContainsKeyImpliesGetValueByKeyDefined!482 (toList!10620 lt!590503) (select (arr!43283 _keys!1609) from!2000)))))

(assert (=> b!1327236 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590503) (select (arr!43283 _keys!1609) from!2000)))))

(declare-fun b!1327237 () Bool)

(declare-fun Unit!43730 () Unit!43717)

(assert (=> b!1327237 (= e!756474 Unit!43730)))

(declare-fun b!1327238 () Bool)

(assert (=> b!1327238 (= e!756473 (isDefined!521 (getValueByKey!714 (toList!10620 lt!590503) (select (arr!43283 _keys!1609) from!2000))))))

(assert (= (and d!143293 c!125889) b!1327236))

(assert (= (and d!143293 (not c!125889)) b!1327237))

(assert (= (and d!143293 (not res!880780)) b!1327238))

(assert (=> d!143293 m!1216047))

(declare-fun m!1216641 () Bool)

(assert (=> d!143293 m!1216641))

(assert (=> b!1327236 m!1216047))

(declare-fun m!1216643 () Bool)

(assert (=> b!1327236 m!1216643))

(assert (=> b!1327236 m!1216047))

(assert (=> b!1327236 m!1216325))

(assert (=> b!1327236 m!1216325))

(declare-fun m!1216645 () Bool)

(assert (=> b!1327236 m!1216645))

(assert (=> b!1327238 m!1216047))

(assert (=> b!1327238 m!1216325))

(assert (=> b!1327238 m!1216325))

(assert (=> b!1327238 m!1216645))

(assert (=> b!1327005 d!143293))

(declare-fun condMapEmpty!56197 () Bool)

(declare-fun mapDefault!56197 () ValueCell!17280)

(assert (=> mapNonEmpty!56196 (= condMapEmpty!56197 (= mapRest!56196 ((as const (Array (_ BitVec 32) ValueCell!17280)) mapDefault!56197)))))

(declare-fun e!756475 () Bool)

(declare-fun mapRes!56197 () Bool)

(assert (=> mapNonEmpty!56196 (= tp!107103 (and e!756475 mapRes!56197))))

(declare-fun b!1327239 () Bool)

(declare-fun e!756476 () Bool)

(assert (=> b!1327239 (= e!756476 tp_is_empty!36357)))

(declare-fun mapIsEmpty!56197 () Bool)

(assert (=> mapIsEmpty!56197 mapRes!56197))

(declare-fun b!1327240 () Bool)

(assert (=> b!1327240 (= e!756475 tp_is_empty!36357)))

(declare-fun mapNonEmpty!56197 () Bool)

(declare-fun tp!107104 () Bool)

(assert (=> mapNonEmpty!56197 (= mapRes!56197 (and tp!107104 e!756476))))

(declare-fun mapKey!56197 () (_ BitVec 32))

(declare-fun mapValue!56197 () ValueCell!17280)

(declare-fun mapRest!56197 () (Array (_ BitVec 32) ValueCell!17280))

(assert (=> mapNonEmpty!56197 (= mapRest!56196 (store mapRest!56197 mapKey!56197 mapValue!56197))))

(assert (= (and mapNonEmpty!56196 condMapEmpty!56197) mapIsEmpty!56197))

(assert (= (and mapNonEmpty!56196 (not condMapEmpty!56197)) mapNonEmpty!56197))

(assert (= (and mapNonEmpty!56197 ((_ is ValueCellFull!17280) mapValue!56197)) b!1327239))

(assert (= (and mapNonEmpty!56196 ((_ is ValueCellFull!17280) mapDefault!56197)) b!1327240))

(declare-fun m!1216647 () Bool)

(assert (=> mapNonEmpty!56197 m!1216647))

(declare-fun b_lambda!23847 () Bool)

(assert (= b_lambda!23839 (or (and start!111964 b_free!30537) b_lambda!23847)))

(declare-fun b_lambda!23849 () Bool)

(assert (= b_lambda!23843 (or (and start!111964 b_free!30537) b_lambda!23849)))

(declare-fun b_lambda!23851 () Bool)

(assert (= b_lambda!23845 (or (and start!111964 b_free!30537) b_lambda!23851)))

(declare-fun b_lambda!23853 () Bool)

(assert (= b_lambda!23841 (or (and start!111964 b_free!30537) b_lambda!23853)))

(check-sat (not d!143235) (not d!143237) (not d!143245) (not b!1327069) (not d!143289) (not d!143207) (not b!1327147) (not d!143269) (not b!1327087) (not b_lambda!23851) (not b!1327090) (not b!1327174) (not b!1327057) (not b!1327054) (not b!1327195) (not d!143189) (not d!143243) (not d!143251) (not bm!64802) (not d!143259) (not b!1327093) (not b!1327187) (not b!1327163) (not d!143211) (not b!1327149) (not d!143169) (not b!1327139) (not d!143261) (not d!143223) (not d!143227) (not b!1327070) (not b!1327171) (not d!143171) (not b!1327238) (not d!143201) (not b!1327199) (not b!1327186) (not b!1327181) (not d!143293) (not b!1327140) (not b_lambda!23853) (not b!1327067) (not d!143291) (not bm!64806) (not b!1327150) (not b_lambda!23847) (not d!143253) (not b!1327165) (not b!1327148) (not d!143257) (not d!143225) (not b!1327105) (not b!1327085) (not b!1327138) (not d!143275) (not b!1327112) (not d!143215) (not b!1327104) (not b!1327099) (not b!1327156) (not b!1327142) (not d!143167) (not b!1327141) (not b!1327137) (not d!143205) (not d!143247) (not d!143209) (not b!1327188) (not b_lambda!23835) (not d!143241) (not b!1327064) (not d!143219) (not b!1327235) (not b!1327071) (not b!1327065) (not b!1327201) (not d!143183) (not b!1327083) (not d!143233) (not b_lambda!23849) (not b!1327109) (not b!1327236) (not d!143271) tp_is_empty!36357 (not b!1327059) (not b!1327173) (not d!143285) (not d!143185) (not b!1327106) (not mapNonEmpty!56197) (not b_lambda!23837) (not d!143213) (not d!143175) (not b!1327228) (not d!143249) (not b!1327088) (not b!1327172) (not d!143287) (not d!143181) (not d!143199) (not d!143255) (not d!143231) (not d!143221) (not b!1327164) (not d!143217) (not b!1327189) (not b!1327162) (not b!1327167) (not b!1327066) (not d!143277) b_and!49189 (not b!1327196) (not b!1327160) (not d!143265) (not b!1327197) (not b!1327161) (not b!1327108) (not b!1327175) (not b!1327056) (not b!1327231) (not b!1327233) (not d!143193) (not d!143203) (not d!143229) (not d!143197) (not b!1327184) (not d!143187) (not d!143165) (not d!143279) (not d!143239) (not bm!64807) (not b!1327107) (not b_next!30537) (not b!1327207) (not b!1327170) (not b!1327180) (not b!1327157) (not b!1327182) (not b!1327110) (not bm!64805) (not b!1327232) (not b!1327220) (not b!1327166))
(check-sat b_and!49189 (not b_next!30537))
