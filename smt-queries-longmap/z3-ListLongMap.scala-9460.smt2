; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112370 () Bool)

(assert start!112370)

(declare-fun b_free!30765 () Bool)

(declare-fun b_next!30765 () Bool)

(assert (=> start!112370 (= b_free!30765 (not b_next!30765))))

(declare-fun tp!107931 () Bool)

(declare-fun b_and!49585 () Bool)

(assert (=> start!112370 (= tp!107931 b_and!49585)))

(declare-fun b!1332097 () Bool)

(declare-fun res!883988 () Bool)

(declare-fun e!758939 () Bool)

(assert (=> b!1332097 (=> (not res!883988) (not e!758939))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90230 0))(
  ( (array!90231 (arr!43581 (Array (_ BitVec 32) (_ BitVec 64))) (size!44131 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90230)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1332097 (= res!883988 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44131 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332098 () Bool)

(declare-fun e!758937 () Bool)

(declare-fun tp_is_empty!36675 () Bool)

(assert (=> b!1332098 (= e!758937 tp_is_empty!36675)))

(declare-fun b!1332100 () Bool)

(assert (=> b!1332100 (= e!758939 (not true))))

(declare-datatypes ((V!54003 0))(
  ( (V!54004 (val!18412 Int)) )
))
(declare-datatypes ((tuple2!23726 0))(
  ( (tuple2!23727 (_1!11874 (_ BitVec 64)) (_2!11874 V!54003)) )
))
(declare-datatypes ((List!30871 0))(
  ( (Nil!30868) (Cons!30867 (h!32076 tuple2!23726) (t!45049 List!30871)) )
))
(declare-datatypes ((ListLongMap!21383 0))(
  ( (ListLongMap!21384 (toList!10707 List!30871)) )
))
(declare-fun lt!591849 () ListLongMap!21383)

(declare-fun minValue!1262 () V!54003)

(declare-fun contains!8871 (ListLongMap!21383 (_ BitVec 64)) Bool)

(declare-fun +!4701 (ListLongMap!21383 tuple2!23726) ListLongMap!21383)

(assert (=> b!1332100 (contains!8871 (+!4701 lt!591849 (tuple2!23727 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43851 0))(
  ( (Unit!43852) )
))
(declare-fun lt!591847 () Unit!43851)

(declare-fun addStillContains!1180 (ListLongMap!21383 (_ BitVec 64) V!54003 (_ BitVec 64)) Unit!43851)

(assert (=> b!1332100 (= lt!591847 (addStillContains!1180 lt!591849 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332100 (contains!8871 lt!591849 k0!1153)))

(declare-fun lt!591845 () V!54003)

(declare-fun lt!591850 () Unit!43851)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!288 ((_ BitVec 64) (_ BitVec 64) V!54003 ListLongMap!21383) Unit!43851)

(assert (=> b!1332100 (= lt!591850 (lemmaInListMapAfterAddingDiffThenInBefore!288 k0!1153 (select (arr!43581 _keys!1590) from!1980) lt!591845 lt!591849))))

(declare-fun lt!591848 () ListLongMap!21383)

(assert (=> b!1332100 (contains!8871 lt!591848 k0!1153)))

(declare-fun lt!591846 () Unit!43851)

(assert (=> b!1332100 (= lt!591846 (lemmaInListMapAfterAddingDiffThenInBefore!288 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591848))))

(assert (=> b!1332100 (= lt!591848 (+!4701 lt!591849 (tuple2!23727 (select (arr!43581 _keys!1590) from!1980) lt!591845)))))

(declare-datatypes ((ValueCell!17439 0))(
  ( (ValueCellFull!17439 (v!21049 V!54003)) (EmptyCell!17439) )
))
(declare-datatypes ((array!90232 0))(
  ( (array!90233 (arr!43582 (Array (_ BitVec 32) ValueCell!17439)) (size!44132 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90232)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21985 (ValueCell!17439 V!54003) V!54003)

(declare-fun dynLambda!3640 (Int (_ BitVec 64)) V!54003)

(assert (=> b!1332100 (= lt!591845 (get!21985 (select (arr!43582 _values!1320) from!1980) (dynLambda!3640 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54003)

(declare-fun getCurrentListMapNoExtraKeys!6339 (array!90230 array!90232 (_ BitVec 32) (_ BitVec 32) V!54003 V!54003 (_ BitVec 32) Int) ListLongMap!21383)

(assert (=> b!1332100 (= lt!591849 (getCurrentListMapNoExtraKeys!6339 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332101 () Bool)

(declare-fun e!758938 () Bool)

(assert (=> b!1332101 (= e!758938 tp_is_empty!36675)))

(declare-fun b!1332102 () Bool)

(declare-fun e!758941 () Bool)

(declare-fun mapRes!56686 () Bool)

(assert (=> b!1332102 (= e!758941 (and e!758938 mapRes!56686))))

(declare-fun condMapEmpty!56686 () Bool)

(declare-fun mapDefault!56686 () ValueCell!17439)

(assert (=> b!1332102 (= condMapEmpty!56686 (= (arr!43582 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17439)) mapDefault!56686)))))

(declare-fun b!1332103 () Bool)

(declare-fun res!883985 () Bool)

(assert (=> b!1332103 (=> (not res!883985) (not e!758939))))

(declare-fun getCurrentListMap!5688 (array!90230 array!90232 (_ BitVec 32) (_ BitVec 32) V!54003 V!54003 (_ BitVec 32) Int) ListLongMap!21383)

(assert (=> b!1332103 (= res!883985 (contains!8871 (getCurrentListMap!5688 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun mapNonEmpty!56686 () Bool)

(declare-fun tp!107932 () Bool)

(assert (=> mapNonEmpty!56686 (= mapRes!56686 (and tp!107932 e!758937))))

(declare-fun mapRest!56686 () (Array (_ BitVec 32) ValueCell!17439))

(declare-fun mapKey!56686 () (_ BitVec 32))

(declare-fun mapValue!56686 () ValueCell!17439)

(assert (=> mapNonEmpty!56686 (= (arr!43582 _values!1320) (store mapRest!56686 mapKey!56686 mapValue!56686))))

(declare-fun b!1332104 () Bool)

(declare-fun res!883987 () Bool)

(assert (=> b!1332104 (=> (not res!883987) (not e!758939))))

(assert (=> b!1332104 (= res!883987 (and (= (size!44132 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44131 _keys!1590) (size!44132 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332105 () Bool)

(declare-fun res!883991 () Bool)

(assert (=> b!1332105 (=> (not res!883991) (not e!758939))))

(declare-datatypes ((List!30872 0))(
  ( (Nil!30869) (Cons!30868 (h!32077 (_ BitVec 64)) (t!45050 List!30872)) )
))
(declare-fun arrayNoDuplicates!0 (array!90230 (_ BitVec 32) List!30872) Bool)

(assert (=> b!1332105 (= res!883991 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30869))))

(declare-fun b!1332106 () Bool)

(declare-fun res!883990 () Bool)

(assert (=> b!1332106 (=> (not res!883990) (not e!758939))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90230 (_ BitVec 32)) Bool)

(assert (=> b!1332106 (= res!883990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332099 () Bool)

(declare-fun res!883986 () Bool)

(assert (=> b!1332099 (=> (not res!883986) (not e!758939))))

(assert (=> b!1332099 (= res!883986 (not (= (select (arr!43581 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!883989 () Bool)

(assert (=> start!112370 (=> (not res!883989) (not e!758939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112370 (= res!883989 (validMask!0 mask!1998))))

(assert (=> start!112370 e!758939))

(declare-fun array_inv!32871 (array!90232) Bool)

(assert (=> start!112370 (and (array_inv!32871 _values!1320) e!758941)))

(assert (=> start!112370 true))

(declare-fun array_inv!32872 (array!90230) Bool)

(assert (=> start!112370 (array_inv!32872 _keys!1590)))

(assert (=> start!112370 tp!107931))

(assert (=> start!112370 tp_is_empty!36675))

(declare-fun mapIsEmpty!56686 () Bool)

(assert (=> mapIsEmpty!56686 mapRes!56686))

(declare-fun b!1332107 () Bool)

(declare-fun res!883992 () Bool)

(assert (=> b!1332107 (=> (not res!883992) (not e!758939))))

(assert (=> b!1332107 (= res!883992 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332108 () Bool)

(declare-fun res!883984 () Bool)

(assert (=> b!1332108 (=> (not res!883984) (not e!758939))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332108 (= res!883984 (validKeyInArray!0 (select (arr!43581 _keys!1590) from!1980)))))

(assert (= (and start!112370 res!883989) b!1332104))

(assert (= (and b!1332104 res!883987) b!1332106))

(assert (= (and b!1332106 res!883990) b!1332105))

(assert (= (and b!1332105 res!883991) b!1332097))

(assert (= (and b!1332097 res!883988) b!1332103))

(assert (= (and b!1332103 res!883985) b!1332099))

(assert (= (and b!1332099 res!883986) b!1332108))

(assert (= (and b!1332108 res!883984) b!1332107))

(assert (= (and b!1332107 res!883992) b!1332100))

(assert (= (and b!1332102 condMapEmpty!56686) mapIsEmpty!56686))

(assert (= (and b!1332102 (not condMapEmpty!56686)) mapNonEmpty!56686))

(get-info :version)

(assert (= (and mapNonEmpty!56686 ((_ is ValueCellFull!17439) mapValue!56686)) b!1332098))

(assert (= (and b!1332102 ((_ is ValueCellFull!17439) mapDefault!56686)) b!1332101))

(assert (= start!112370 b!1332102))

(declare-fun b_lambda!24025 () Bool)

(assert (=> (not b_lambda!24025) (not b!1332100)))

(declare-fun t!45048 () Bool)

(declare-fun tb!11981 () Bool)

(assert (=> (and start!112370 (= defaultEntry!1323 defaultEntry!1323) t!45048) tb!11981))

(declare-fun result!25033 () Bool)

(assert (=> tb!11981 (= result!25033 tp_is_empty!36675)))

(assert (=> b!1332100 t!45048))

(declare-fun b_and!49587 () Bool)

(assert (= b_and!49585 (and (=> t!45048 result!25033) b_and!49587)))

(declare-fun m!1220855 () Bool)

(assert (=> b!1332103 m!1220855))

(assert (=> b!1332103 m!1220855))

(declare-fun m!1220857 () Bool)

(assert (=> b!1332103 m!1220857))

(declare-fun m!1220859 () Bool)

(assert (=> b!1332108 m!1220859))

(assert (=> b!1332108 m!1220859))

(declare-fun m!1220861 () Bool)

(assert (=> b!1332108 m!1220861))

(declare-fun m!1220863 () Bool)

(assert (=> b!1332106 m!1220863))

(declare-fun m!1220865 () Bool)

(assert (=> mapNonEmpty!56686 m!1220865))

(declare-fun m!1220867 () Bool)

(assert (=> b!1332105 m!1220867))

(declare-fun m!1220869 () Bool)

(assert (=> b!1332100 m!1220869))

(declare-fun m!1220871 () Bool)

(assert (=> b!1332100 m!1220871))

(declare-fun m!1220873 () Bool)

(assert (=> b!1332100 m!1220873))

(declare-fun m!1220875 () Bool)

(assert (=> b!1332100 m!1220875))

(declare-fun m!1220877 () Bool)

(assert (=> b!1332100 m!1220877))

(declare-fun m!1220879 () Bool)

(assert (=> b!1332100 m!1220879))

(declare-fun m!1220881 () Bool)

(assert (=> b!1332100 m!1220881))

(assert (=> b!1332100 m!1220879))

(assert (=> b!1332100 m!1220869))

(declare-fun m!1220883 () Bool)

(assert (=> b!1332100 m!1220883))

(declare-fun m!1220885 () Bool)

(assert (=> b!1332100 m!1220885))

(assert (=> b!1332100 m!1220859))

(declare-fun m!1220887 () Bool)

(assert (=> b!1332100 m!1220887))

(declare-fun m!1220889 () Bool)

(assert (=> b!1332100 m!1220889))

(declare-fun m!1220891 () Bool)

(assert (=> b!1332100 m!1220891))

(assert (=> b!1332100 m!1220871))

(assert (=> b!1332100 m!1220859))

(declare-fun m!1220893 () Bool)

(assert (=> start!112370 m!1220893))

(declare-fun m!1220895 () Bool)

(assert (=> start!112370 m!1220895))

(declare-fun m!1220897 () Bool)

(assert (=> start!112370 m!1220897))

(assert (=> b!1332099 m!1220859))

(check-sat (not b!1332100) (not b!1332103) b_and!49587 tp_is_empty!36675 (not start!112370) (not mapNonEmpty!56686) (not b!1332105) (not b_next!30765) (not b_lambda!24025) (not b!1332108) (not b!1332106))
(check-sat b_and!49587 (not b_next!30765))
