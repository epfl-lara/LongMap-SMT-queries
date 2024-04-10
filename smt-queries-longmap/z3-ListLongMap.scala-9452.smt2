; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112322 () Bool)

(assert start!112322)

(declare-fun b_free!30717 () Bool)

(declare-fun b_next!30717 () Bool)

(assert (=> start!112322 (= b_free!30717 (not b_next!30717))))

(declare-fun tp!107787 () Bool)

(declare-fun b_and!49489 () Bool)

(assert (=> start!112322 (= tp!107787 b_and!49489)))

(declare-fun b!1331185 () Bool)

(declare-fun res!883343 () Bool)

(declare-fun e!758577 () Bool)

(assert (=> b!1331185 (=> (not res!883343) (not e!758577))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90134 0))(
  ( (array!90135 (arr!43533 (Array (_ BitVec 32) (_ BitVec 64))) (size!44083 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90134)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1331185 (= res!883343 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44083 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!883339 () Bool)

(assert (=> start!112322 (=> (not res!883339) (not e!758577))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112322 (= res!883339 (validMask!0 mask!1998))))

(assert (=> start!112322 e!758577))

(declare-datatypes ((V!53939 0))(
  ( (V!53940 (val!18388 Int)) )
))
(declare-datatypes ((ValueCell!17415 0))(
  ( (ValueCellFull!17415 (v!21025 V!53939)) (EmptyCell!17415) )
))
(declare-datatypes ((array!90136 0))(
  ( (array!90137 (arr!43534 (Array (_ BitVec 32) ValueCell!17415)) (size!44084 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90136)

(declare-fun e!758580 () Bool)

(declare-fun array_inv!32833 (array!90136) Bool)

(assert (=> start!112322 (and (array_inv!32833 _values!1320) e!758580)))

(assert (=> start!112322 true))

(declare-fun array_inv!32834 (array!90134) Bool)

(assert (=> start!112322 (array_inv!32834 _keys!1590)))

(assert (=> start!112322 tp!107787))

(declare-fun tp_is_empty!36627 () Bool)

(assert (=> start!112322 tp_is_empty!36627))

(declare-fun b!1331186 () Bool)

(declare-fun res!883340 () Bool)

(assert (=> b!1331186 (=> (not res!883340) (not e!758577))))

(assert (=> b!1331186 (= res!883340 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1331187 () Bool)

(declare-fun e!758581 () Bool)

(assert (=> b!1331187 (= e!758581 tp_is_empty!36627)))

(declare-fun mapIsEmpty!56614 () Bool)

(declare-fun mapRes!56614 () Bool)

(assert (=> mapIsEmpty!56614 mapRes!56614))

(declare-fun b!1331188 () Bool)

(declare-fun res!883338 () Bool)

(assert (=> b!1331188 (=> (not res!883338) (not e!758577))))

(declare-datatypes ((List!30832 0))(
  ( (Nil!30829) (Cons!30828 (h!32037 (_ BitVec 64)) (t!44962 List!30832)) )
))
(declare-fun arrayNoDuplicates!0 (array!90134 (_ BitVec 32) List!30832) Bool)

(assert (=> b!1331188 (= res!883338 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30829))))

(declare-fun b!1331189 () Bool)

(declare-fun res!883336 () Bool)

(assert (=> b!1331189 (=> (not res!883336) (not e!758577))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53939)

(declare-fun zeroValue!1262 () V!53939)

(declare-datatypes ((tuple2!23682 0))(
  ( (tuple2!23683 (_1!11852 (_ BitVec 64)) (_2!11852 V!53939)) )
))
(declare-datatypes ((List!30833 0))(
  ( (Nil!30830) (Cons!30829 (h!32038 tuple2!23682) (t!44963 List!30833)) )
))
(declare-datatypes ((ListLongMap!21339 0))(
  ( (ListLongMap!21340 (toList!10685 List!30833)) )
))
(declare-fun contains!8849 (ListLongMap!21339 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5670 (array!90134 array!90136 (_ BitVec 32) (_ BitVec 32) V!53939 V!53939 (_ BitVec 32) Int) ListLongMap!21339)

(assert (=> b!1331189 (= res!883336 (contains!8849 (getCurrentListMap!5670 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331190 () Bool)

(declare-fun res!883337 () Bool)

(assert (=> b!1331190 (=> (not res!883337) (not e!758577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331190 (= res!883337 (validKeyInArray!0 (select (arr!43533 _keys!1590) from!1980)))))

(declare-fun b!1331191 () Bool)

(declare-fun e!758579 () Bool)

(assert (=> b!1331191 (= e!758579 tp_is_empty!36627)))

(declare-fun mapNonEmpty!56614 () Bool)

(declare-fun tp!107788 () Bool)

(assert (=> mapNonEmpty!56614 (= mapRes!56614 (and tp!107788 e!758579))))

(declare-fun mapKey!56614 () (_ BitVec 32))

(declare-fun mapRest!56614 () (Array (_ BitVec 32) ValueCell!17415))

(declare-fun mapValue!56614 () ValueCell!17415)

(assert (=> mapNonEmpty!56614 (= (arr!43534 _values!1320) (store mapRest!56614 mapKey!56614 mapValue!56614))))

(declare-fun b!1331192 () Bool)

(declare-fun res!883342 () Bool)

(assert (=> b!1331192 (=> (not res!883342) (not e!758577))))

(assert (=> b!1331192 (= res!883342 (not (= (select (arr!43533 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1331193 () Bool)

(declare-fun res!883341 () Bool)

(assert (=> b!1331193 (=> (not res!883341) (not e!758577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90134 (_ BitVec 32)) Bool)

(assert (=> b!1331193 (= res!883341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331194 () Bool)

(declare-fun res!883344 () Bool)

(assert (=> b!1331194 (=> (not res!883344) (not e!758577))))

(assert (=> b!1331194 (= res!883344 (and (= (size!44084 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44083 _keys!1590) (size!44084 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331195 () Bool)

(assert (=> b!1331195 (= e!758580 (and e!758581 mapRes!56614))))

(declare-fun condMapEmpty!56614 () Bool)

(declare-fun mapDefault!56614 () ValueCell!17415)

(assert (=> b!1331195 (= condMapEmpty!56614 (= (arr!43534 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17415)) mapDefault!56614)))))

(declare-fun b!1331196 () Bool)

(assert (=> b!1331196 (= e!758577 (not true))))

(declare-fun lt!591437 () ListLongMap!21339)

(assert (=> b!1331196 (contains!8849 lt!591437 k0!1153)))

(declare-datatypes ((Unit!43811 0))(
  ( (Unit!43812) )
))
(declare-fun lt!591436 () Unit!43811)

(declare-fun lt!591435 () V!53939)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!268 ((_ BitVec 64) (_ BitVec 64) V!53939 ListLongMap!21339) Unit!43811)

(assert (=> b!1331196 (= lt!591436 (lemmaInListMapAfterAddingDiffThenInBefore!268 k0!1153 (select (arr!43533 _keys!1590) from!1980) lt!591435 lt!591437))))

(declare-fun lt!591439 () ListLongMap!21339)

(assert (=> b!1331196 (contains!8849 lt!591439 k0!1153)))

(declare-fun lt!591438 () Unit!43811)

(assert (=> b!1331196 (= lt!591438 (lemmaInListMapAfterAddingDiffThenInBefore!268 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591439))))

(declare-fun +!4681 (ListLongMap!21339 tuple2!23682) ListLongMap!21339)

(assert (=> b!1331196 (= lt!591439 (+!4681 lt!591437 (tuple2!23683 (select (arr!43533 _keys!1590) from!1980) lt!591435)))))

(declare-fun get!21949 (ValueCell!17415 V!53939) V!53939)

(declare-fun dynLambda!3620 (Int (_ BitVec 64)) V!53939)

(assert (=> b!1331196 (= lt!591435 (get!21949 (select (arr!43534 _values!1320) from!1980) (dynLambda!3620 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6319 (array!90134 array!90136 (_ BitVec 32) (_ BitVec 32) V!53939 V!53939 (_ BitVec 32) Int) ListLongMap!21339)

(assert (=> b!1331196 (= lt!591437 (getCurrentListMapNoExtraKeys!6319 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(assert (= (and start!112322 res!883339) b!1331194))

(assert (= (and b!1331194 res!883344) b!1331193))

(assert (= (and b!1331193 res!883341) b!1331188))

(assert (= (and b!1331188 res!883338) b!1331185))

(assert (= (and b!1331185 res!883343) b!1331189))

(assert (= (and b!1331189 res!883336) b!1331192))

(assert (= (and b!1331192 res!883342) b!1331190))

(assert (= (and b!1331190 res!883337) b!1331186))

(assert (= (and b!1331186 res!883340) b!1331196))

(assert (= (and b!1331195 condMapEmpty!56614) mapIsEmpty!56614))

(assert (= (and b!1331195 (not condMapEmpty!56614)) mapNonEmpty!56614))

(get-info :version)

(assert (= (and mapNonEmpty!56614 ((_ is ValueCellFull!17415) mapValue!56614)) b!1331191))

(assert (= (and b!1331195 ((_ is ValueCellFull!17415) mapDefault!56614)) b!1331187))

(assert (= start!112322 b!1331195))

(declare-fun b_lambda!23977 () Bool)

(assert (=> (not b_lambda!23977) (not b!1331196)))

(declare-fun t!44961 () Bool)

(declare-fun tb!11933 () Bool)

(assert (=> (and start!112322 (= defaultEntry!1323 defaultEntry!1323) t!44961) tb!11933))

(declare-fun result!24937 () Bool)

(assert (=> tb!11933 (= result!24937 tp_is_empty!36627)))

(assert (=> b!1331196 t!44961))

(declare-fun b_and!49491 () Bool)

(assert (= b_and!49489 (and (=> t!44961 result!24937) b_and!49491)))

(declare-fun m!1219847 () Bool)

(assert (=> b!1331188 m!1219847))

(declare-fun m!1219849 () Bool)

(assert (=> b!1331189 m!1219849))

(assert (=> b!1331189 m!1219849))

(declare-fun m!1219851 () Bool)

(assert (=> b!1331189 m!1219851))

(declare-fun m!1219853 () Bool)

(assert (=> b!1331196 m!1219853))

(declare-fun m!1219855 () Bool)

(assert (=> b!1331196 m!1219855))

(assert (=> b!1331196 m!1219853))

(declare-fun m!1219857 () Bool)

(assert (=> b!1331196 m!1219857))

(declare-fun m!1219859 () Bool)

(assert (=> b!1331196 m!1219859))

(assert (=> b!1331196 m!1219855))

(declare-fun m!1219861 () Bool)

(assert (=> b!1331196 m!1219861))

(declare-fun m!1219863 () Bool)

(assert (=> b!1331196 m!1219863))

(declare-fun m!1219865 () Bool)

(assert (=> b!1331196 m!1219865))

(assert (=> b!1331196 m!1219863))

(declare-fun m!1219867 () Bool)

(assert (=> b!1331196 m!1219867))

(declare-fun m!1219869 () Bool)

(assert (=> b!1331196 m!1219869))

(declare-fun m!1219871 () Bool)

(assert (=> b!1331196 m!1219871))

(declare-fun m!1219873 () Bool)

(assert (=> mapNonEmpty!56614 m!1219873))

(declare-fun m!1219875 () Bool)

(assert (=> b!1331193 m!1219875))

(declare-fun m!1219877 () Bool)

(assert (=> start!112322 m!1219877))

(declare-fun m!1219879 () Bool)

(assert (=> start!112322 m!1219879))

(declare-fun m!1219881 () Bool)

(assert (=> start!112322 m!1219881))

(assert (=> b!1331190 m!1219863))

(assert (=> b!1331190 m!1219863))

(declare-fun m!1219883 () Bool)

(assert (=> b!1331190 m!1219883))

(assert (=> b!1331192 m!1219863))

(check-sat (not b!1331193) (not b!1331190) (not b!1331196) (not b!1331188) (not mapNonEmpty!56614) (not b!1331189) tp_is_empty!36627 (not start!112322) (not b_next!30717) b_and!49491 (not b_lambda!23977))
(check-sat b_and!49491 (not b_next!30717))
