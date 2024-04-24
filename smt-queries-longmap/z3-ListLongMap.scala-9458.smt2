; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112580 () Bool)

(assert start!112580)

(declare-fun b_free!30751 () Bool)

(declare-fun b_next!30751 () Bool)

(assert (=> start!112580 (= b_free!30751 (not b_next!30751))))

(declare-fun tp!107890 () Bool)

(declare-fun b_and!49559 () Bool)

(assert (=> start!112580 (= tp!107890 b_and!49559)))

(declare-fun b!1333130 () Bool)

(declare-fun res!884317 () Bool)

(declare-fun e!759679 () Bool)

(assert (=> b!1333130 (=> (not res!884317) (not e!759679))))

(declare-datatypes ((array!90307 0))(
  ( (array!90308 (arr!43615 (Array (_ BitVec 32) (_ BitVec 64))) (size!44166 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90307)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333130 (= res!884317 (validKeyInArray!0 (select (arr!43615 _keys!1590) from!1980)))))

(declare-fun b!1333131 () Bool)

(declare-fun e!759677 () Bool)

(declare-fun tp_is_empty!36661 () Bool)

(assert (=> b!1333131 (= e!759677 tp_is_empty!36661)))

(declare-fun res!884313 () Bool)

(assert (=> start!112580 (=> (not res!884313) (not e!759679))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112580 (= res!884313 (validMask!0 mask!1998))))

(assert (=> start!112580 e!759679))

(declare-datatypes ((V!53985 0))(
  ( (V!53986 (val!18405 Int)) )
))
(declare-datatypes ((ValueCell!17432 0))(
  ( (ValueCellFull!17432 (v!21037 V!53985)) (EmptyCell!17432) )
))
(declare-datatypes ((array!90309 0))(
  ( (array!90310 (arr!43616 (Array (_ BitVec 32) ValueCell!17432)) (size!44167 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90309)

(declare-fun e!759678 () Bool)

(declare-fun array_inv!33177 (array!90309) Bool)

(assert (=> start!112580 (and (array_inv!33177 _values!1320) e!759678)))

(assert (=> start!112580 true))

(declare-fun array_inv!33178 (array!90307) Bool)

(assert (=> start!112580 (array_inv!33178 _keys!1590)))

(assert (=> start!112580 tp!107890))

(assert (=> start!112580 tp_is_empty!36661))

(declare-fun b!1333132 () Bool)

(declare-fun res!884320 () Bool)

(assert (=> b!1333132 (=> (not res!884320) (not e!759679))))

(declare-datatypes ((List!30906 0))(
  ( (Nil!30903) (Cons!30902 (h!32120 (_ BitVec 64)) (t!45062 List!30906)) )
))
(declare-fun arrayNoDuplicates!0 (array!90307 (_ BitVec 32) List!30906) Bool)

(assert (=> b!1333132 (= res!884320 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30903))))

(declare-fun b!1333133 () Bool)

(declare-fun res!884321 () Bool)

(assert (=> b!1333133 (=> (not res!884321) (not e!759679))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333133 (= res!884321 (and (= (size!44167 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44166 _keys!1590) (size!44167 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333134 () Bool)

(assert (=> b!1333134 (= e!759679 (not true))))

(declare-datatypes ((tuple2!23744 0))(
  ( (tuple2!23745 (_1!11883 (_ BitVec 64)) (_2!11883 V!53985)) )
))
(declare-datatypes ((List!30907 0))(
  ( (Nil!30904) (Cons!30903 (h!32121 tuple2!23744) (t!45063 List!30907)) )
))
(declare-datatypes ((ListLongMap!21409 0))(
  ( (ListLongMap!21410 (toList!10720 List!30907)) )
))
(declare-fun lt!592197 () ListLongMap!21409)

(declare-fun minValue!1262 () V!53985)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8896 (ListLongMap!21409 (_ BitVec 64)) Bool)

(declare-fun +!4731 (ListLongMap!21409 tuple2!23744) ListLongMap!21409)

(assert (=> b!1333134 (contains!8896 (+!4731 lt!592197 (tuple2!23745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43772 0))(
  ( (Unit!43773) )
))
(declare-fun lt!592196 () Unit!43772)

(declare-fun addStillContains!1177 (ListLongMap!21409 (_ BitVec 64) V!53985 (_ BitVec 64)) Unit!43772)

(assert (=> b!1333134 (= lt!592196 (addStillContains!1177 lt!592197 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333134 (contains!8896 lt!592197 k0!1153)))

(declare-fun lt!592199 () V!53985)

(declare-fun lt!592200 () Unit!43772)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!274 ((_ BitVec 64) (_ BitVec 64) V!53985 ListLongMap!21409) Unit!43772)

(assert (=> b!1333134 (= lt!592200 (lemmaInListMapAfterAddingDiffThenInBefore!274 k0!1153 (select (arr!43615 _keys!1590) from!1980) lt!592199 lt!592197))))

(declare-fun lt!592198 () ListLongMap!21409)

(assert (=> b!1333134 (contains!8896 lt!592198 k0!1153)))

(declare-fun lt!592195 () Unit!43772)

(assert (=> b!1333134 (= lt!592195 (lemmaInListMapAfterAddingDiffThenInBefore!274 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592198))))

(assert (=> b!1333134 (= lt!592198 (+!4731 lt!592197 (tuple2!23745 (select (arr!43615 _keys!1590) from!1980) lt!592199)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!22014 (ValueCell!17432 V!53985) V!53985)

(declare-fun dynLambda!3685 (Int (_ BitVec 64)) V!53985)

(assert (=> b!1333134 (= lt!592199 (get!22014 (select (arr!43616 _values!1320) from!1980) (dynLambda!3685 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53985)

(declare-fun getCurrentListMapNoExtraKeys!6375 (array!90307 array!90309 (_ BitVec 32) (_ BitVec 32) V!53985 V!53985 (_ BitVec 32) Int) ListLongMap!21409)

(assert (=> b!1333134 (= lt!592197 (getCurrentListMapNoExtraKeys!6375 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1333135 () Bool)

(declare-fun res!884319 () Bool)

(assert (=> b!1333135 (=> (not res!884319) (not e!759679))))

(assert (=> b!1333135 (= res!884319 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44166 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!56665 () Bool)

(declare-fun mapRes!56665 () Bool)

(assert (=> mapIsEmpty!56665 mapRes!56665))

(declare-fun b!1333136 () Bool)

(declare-fun res!884316 () Bool)

(assert (=> b!1333136 (=> (not res!884316) (not e!759679))))

(assert (=> b!1333136 (= res!884316 (not (= (select (arr!43615 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333137 () Bool)

(declare-fun res!884314 () Bool)

(assert (=> b!1333137 (=> (not res!884314) (not e!759679))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90307 (_ BitVec 32)) Bool)

(assert (=> b!1333137 (= res!884314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56665 () Bool)

(declare-fun tp!107889 () Bool)

(assert (=> mapNonEmpty!56665 (= mapRes!56665 (and tp!107889 e!759677))))

(declare-fun mapRest!56665 () (Array (_ BitVec 32) ValueCell!17432))

(declare-fun mapKey!56665 () (_ BitVec 32))

(declare-fun mapValue!56665 () ValueCell!17432)

(assert (=> mapNonEmpty!56665 (= (arr!43616 _values!1320) (store mapRest!56665 mapKey!56665 mapValue!56665))))

(declare-fun b!1333138 () Bool)

(declare-fun e!759675 () Bool)

(assert (=> b!1333138 (= e!759678 (and e!759675 mapRes!56665))))

(declare-fun condMapEmpty!56665 () Bool)

(declare-fun mapDefault!56665 () ValueCell!17432)

(assert (=> b!1333138 (= condMapEmpty!56665 (= (arr!43616 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17432)) mapDefault!56665)))))

(declare-fun b!1333139 () Bool)

(declare-fun res!884318 () Bool)

(assert (=> b!1333139 (=> (not res!884318) (not e!759679))))

(assert (=> b!1333139 (= res!884318 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1333140 () Bool)

(assert (=> b!1333140 (= e!759675 tp_is_empty!36661)))

(declare-fun b!1333141 () Bool)

(declare-fun res!884315 () Bool)

(assert (=> b!1333141 (=> (not res!884315) (not e!759679))))

(declare-fun getCurrentListMap!5689 (array!90307 array!90309 (_ BitVec 32) (_ BitVec 32) V!53985 V!53985 (_ BitVec 32) Int) ListLongMap!21409)

(assert (=> b!1333141 (= res!884315 (contains!8896 (getCurrentListMap!5689 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(assert (= (and start!112580 res!884313) b!1333133))

(assert (= (and b!1333133 res!884321) b!1333137))

(assert (= (and b!1333137 res!884314) b!1333132))

(assert (= (and b!1333132 res!884320) b!1333135))

(assert (= (and b!1333135 res!884319) b!1333141))

(assert (= (and b!1333141 res!884315) b!1333136))

(assert (= (and b!1333136 res!884316) b!1333130))

(assert (= (and b!1333130 res!884317) b!1333139))

(assert (= (and b!1333139 res!884318) b!1333134))

(assert (= (and b!1333138 condMapEmpty!56665) mapIsEmpty!56665))

(assert (= (and b!1333138 (not condMapEmpty!56665)) mapNonEmpty!56665))

(get-info :version)

(assert (= (and mapNonEmpty!56665 ((_ is ValueCellFull!17432) mapValue!56665)) b!1333131))

(assert (= (and b!1333138 ((_ is ValueCellFull!17432) mapDefault!56665)) b!1333140))

(assert (= start!112580 b!1333138))

(declare-fun b_lambda!24005 () Bool)

(assert (=> (not b_lambda!24005) (not b!1333134)))

(declare-fun t!45061 () Bool)

(declare-fun tb!11959 () Bool)

(assert (=> (and start!112580 (= defaultEntry!1323 defaultEntry!1323) t!45061) tb!11959))

(declare-fun result!24997 () Bool)

(assert (=> tb!11959 (= result!24997 tp_is_empty!36661)))

(assert (=> b!1333134 t!45061))

(declare-fun b_and!49561 () Bool)

(assert (= b_and!49559 (and (=> t!45061 result!24997) b_and!49561)))

(declare-fun m!1222145 () Bool)

(assert (=> b!1333130 m!1222145))

(assert (=> b!1333130 m!1222145))

(declare-fun m!1222147 () Bool)

(assert (=> b!1333130 m!1222147))

(assert (=> b!1333136 m!1222145))

(declare-fun m!1222149 () Bool)

(assert (=> start!112580 m!1222149))

(declare-fun m!1222151 () Bool)

(assert (=> start!112580 m!1222151))

(declare-fun m!1222153 () Bool)

(assert (=> start!112580 m!1222153))

(assert (=> b!1333134 m!1222145))

(declare-fun m!1222155 () Bool)

(assert (=> b!1333134 m!1222155))

(declare-fun m!1222157 () Bool)

(assert (=> b!1333134 m!1222157))

(declare-fun m!1222159 () Bool)

(assert (=> b!1333134 m!1222159))

(declare-fun m!1222161 () Bool)

(assert (=> b!1333134 m!1222161))

(assert (=> b!1333134 m!1222159))

(declare-fun m!1222163 () Bool)

(assert (=> b!1333134 m!1222163))

(declare-fun m!1222165 () Bool)

(assert (=> b!1333134 m!1222165))

(declare-fun m!1222167 () Bool)

(assert (=> b!1333134 m!1222167))

(assert (=> b!1333134 m!1222167))

(declare-fun m!1222169 () Bool)

(assert (=> b!1333134 m!1222169))

(assert (=> b!1333134 m!1222161))

(declare-fun m!1222171 () Bool)

(assert (=> b!1333134 m!1222171))

(declare-fun m!1222173 () Bool)

(assert (=> b!1333134 m!1222173))

(assert (=> b!1333134 m!1222145))

(declare-fun m!1222175 () Bool)

(assert (=> b!1333134 m!1222175))

(declare-fun m!1222177 () Bool)

(assert (=> b!1333134 m!1222177))

(declare-fun m!1222179 () Bool)

(assert (=> b!1333137 m!1222179))

(declare-fun m!1222181 () Bool)

(assert (=> b!1333141 m!1222181))

(assert (=> b!1333141 m!1222181))

(declare-fun m!1222183 () Bool)

(assert (=> b!1333141 m!1222183))

(declare-fun m!1222185 () Bool)

(assert (=> mapNonEmpty!56665 m!1222185))

(declare-fun m!1222187 () Bool)

(assert (=> b!1333132 m!1222187))

(check-sat (not b!1333130) (not b!1333132) (not start!112580) (not mapNonEmpty!56665) (not b!1333137) b_and!49561 tp_is_empty!36661 (not b!1333141) (not b_next!30751) (not b!1333134) (not b_lambda!24005))
(check-sat b_and!49561 (not b_next!30751))
