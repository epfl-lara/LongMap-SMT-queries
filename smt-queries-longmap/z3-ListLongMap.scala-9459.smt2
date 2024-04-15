; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112362 () Bool)

(assert start!112362)

(declare-fun b_free!30757 () Bool)

(declare-fun b_next!30757 () Bool)

(assert (=> start!112362 (= b_free!30757 (not b_next!30757))))

(declare-fun tp!107909 () Bool)

(declare-fun b_and!49551 () Bool)

(assert (=> start!112362 (= tp!107909 b_and!49551)))

(declare-fun b!1331875 () Bool)

(declare-fun e!758848 () Bool)

(declare-fun tp_is_empty!36667 () Bool)

(assert (=> b!1331875 (= e!758848 tp_is_empty!36667)))

(declare-fun b!1331876 () Bool)

(declare-fun e!758846 () Bool)

(assert (=> b!1331876 (= e!758846 (not true))))

(declare-datatypes ((V!53993 0))(
  ( (V!53994 (val!18408 Int)) )
))
(declare-datatypes ((tuple2!23788 0))(
  ( (tuple2!23789 (_1!11905 (_ BitVec 64)) (_2!11905 V!53993)) )
))
(declare-datatypes ((List!30925 0))(
  ( (Nil!30922) (Cons!30921 (h!32130 tuple2!23788) (t!45087 List!30925)) )
))
(declare-datatypes ((ListLongMap!21445 0))(
  ( (ListLongMap!21446 (toList!10738 List!30925)) )
))
(declare-fun lt!591592 () ListLongMap!21445)

(declare-fun minValue!1262 () V!53993)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8830 (ListLongMap!21445 (_ BitVec 64)) Bool)

(declare-fun +!4717 (ListLongMap!21445 tuple2!23788) ListLongMap!21445)

(assert (=> b!1331876 (contains!8830 (+!4717 lt!591592 (tuple2!23789 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43646 0))(
  ( (Unit!43647) )
))
(declare-fun lt!591587 () Unit!43646)

(declare-fun addStillContains!1171 (ListLongMap!21445 (_ BitVec 64) V!53993 (_ BitVec 64)) Unit!43646)

(assert (=> b!1331876 (= lt!591587 (addStillContains!1171 lt!591592 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1331876 (contains!8830 lt!591592 k0!1153)))

(declare-fun lt!591588 () Unit!43646)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90153 0))(
  ( (array!90154 (arr!43543 (Array (_ BitVec 32) (_ BitVec 64))) (size!44095 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90153)

(declare-fun lt!591591 () V!53993)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!273 ((_ BitVec 64) (_ BitVec 64) V!53993 ListLongMap!21445) Unit!43646)

(assert (=> b!1331876 (= lt!591588 (lemmaInListMapAfterAddingDiffThenInBefore!273 k0!1153 (select (arr!43543 _keys!1590) from!1980) lt!591591 lt!591592))))

(declare-fun lt!591590 () ListLongMap!21445)

(assert (=> b!1331876 (contains!8830 lt!591590 k0!1153)))

(declare-fun lt!591589 () Unit!43646)

(assert (=> b!1331876 (= lt!591589 (lemmaInListMapAfterAddingDiffThenInBefore!273 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591590))))

(assert (=> b!1331876 (= lt!591590 (+!4717 lt!591592 (tuple2!23789 (select (arr!43543 _keys!1590) from!1980) lt!591591)))))

(declare-datatypes ((ValueCell!17435 0))(
  ( (ValueCellFull!17435 (v!21044 V!53993)) (EmptyCell!17435) )
))
(declare-datatypes ((array!90155 0))(
  ( (array!90156 (arr!43544 (Array (_ BitVec 32) ValueCell!17435)) (size!44096 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90155)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21966 (ValueCell!17435 V!53993) V!53993)

(declare-fun dynLambda!3647 (Int (_ BitVec 64)) V!53993)

(assert (=> b!1331876 (= lt!591591 (get!21966 (select (arr!43544 _values!1320) from!1980) (dynLambda!3647 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53993)

(declare-fun getCurrentListMapNoExtraKeys!6355 (array!90153 array!90155 (_ BitVec 32) (_ BitVec 32) V!53993 V!53993 (_ BitVec 32) Int) ListLongMap!21445)

(assert (=> b!1331876 (= lt!591592 (getCurrentListMapNoExtraKeys!6355 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331877 () Bool)

(declare-fun res!883851 () Bool)

(assert (=> b!1331877 (=> (not res!883851) (not e!758846))))

(assert (=> b!1331877 (= res!883851 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56674 () Bool)

(declare-fun mapRes!56674 () Bool)

(assert (=> mapIsEmpty!56674 mapRes!56674))

(declare-fun b!1331878 () Bool)

(declare-fun e!758847 () Bool)

(assert (=> b!1331878 (= e!758847 tp_is_empty!36667)))

(declare-fun b!1331879 () Bool)

(declare-fun res!883847 () Bool)

(assert (=> b!1331879 (=> (not res!883847) (not e!758846))))

(declare-datatypes ((List!30926 0))(
  ( (Nil!30923) (Cons!30922 (h!32131 (_ BitVec 64)) (t!45088 List!30926)) )
))
(declare-fun arrayNoDuplicates!0 (array!90153 (_ BitVec 32) List!30926) Bool)

(assert (=> b!1331879 (= res!883847 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30923))))

(declare-fun b!1331880 () Bool)

(declare-fun res!883853 () Bool)

(assert (=> b!1331880 (=> (not res!883853) (not e!758846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90153 (_ BitVec 32)) Bool)

(assert (=> b!1331880 (= res!883853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1331881 () Bool)

(declare-fun res!883855 () Bool)

(assert (=> b!1331881 (=> (not res!883855) (not e!758846))))

(assert (=> b!1331881 (= res!883855 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44095 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331882 () Bool)

(declare-fun res!883849 () Bool)

(assert (=> b!1331882 (=> (not res!883849) (not e!758846))))

(assert (=> b!1331882 (= res!883849 (and (= (size!44096 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44095 _keys!1590) (size!44096 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331883 () Bool)

(declare-fun res!883850 () Bool)

(assert (=> b!1331883 (=> (not res!883850) (not e!758846))))

(declare-fun getCurrentListMap!5598 (array!90153 array!90155 (_ BitVec 32) (_ BitVec 32) V!53993 V!53993 (_ BitVec 32) Int) ListLongMap!21445)

(assert (=> b!1331883 (= res!883850 (contains!8830 (getCurrentListMap!5598 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1331884 () Bool)

(declare-fun res!883852 () Bool)

(assert (=> b!1331884 (=> (not res!883852) (not e!758846))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1331884 (= res!883852 (validKeyInArray!0 (select (arr!43543 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56674 () Bool)

(declare-fun tp!107908 () Bool)

(assert (=> mapNonEmpty!56674 (= mapRes!56674 (and tp!107908 e!758847))))

(declare-fun mapRest!56674 () (Array (_ BitVec 32) ValueCell!17435))

(declare-fun mapKey!56674 () (_ BitVec 32))

(declare-fun mapValue!56674 () ValueCell!17435)

(assert (=> mapNonEmpty!56674 (= (arr!43544 _values!1320) (store mapRest!56674 mapKey!56674 mapValue!56674))))

(declare-fun b!1331885 () Bool)

(declare-fun e!758845 () Bool)

(assert (=> b!1331885 (= e!758845 (and e!758848 mapRes!56674))))

(declare-fun condMapEmpty!56674 () Bool)

(declare-fun mapDefault!56674 () ValueCell!17435)

(assert (=> b!1331885 (= condMapEmpty!56674 (= (arr!43544 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17435)) mapDefault!56674)))))

(declare-fun b!1331886 () Bool)

(declare-fun res!883848 () Bool)

(assert (=> b!1331886 (=> (not res!883848) (not e!758846))))

(assert (=> b!1331886 (= res!883848 (not (= (select (arr!43543 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!883854 () Bool)

(assert (=> start!112362 (=> (not res!883854) (not e!758846))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112362 (= res!883854 (validMask!0 mask!1998))))

(assert (=> start!112362 e!758846))

(declare-fun array_inv!33025 (array!90155) Bool)

(assert (=> start!112362 (and (array_inv!33025 _values!1320) e!758845)))

(assert (=> start!112362 true))

(declare-fun array_inv!33026 (array!90153) Bool)

(assert (=> start!112362 (array_inv!33026 _keys!1590)))

(assert (=> start!112362 tp!107909))

(assert (=> start!112362 tp_is_empty!36667))

(assert (= (and start!112362 res!883854) b!1331882))

(assert (= (and b!1331882 res!883849) b!1331880))

(assert (= (and b!1331880 res!883853) b!1331879))

(assert (= (and b!1331879 res!883847) b!1331881))

(assert (= (and b!1331881 res!883855) b!1331883))

(assert (= (and b!1331883 res!883850) b!1331886))

(assert (= (and b!1331886 res!883848) b!1331884))

(assert (= (and b!1331884 res!883852) b!1331877))

(assert (= (and b!1331877 res!883851) b!1331876))

(assert (= (and b!1331885 condMapEmpty!56674) mapIsEmpty!56674))

(assert (= (and b!1331885 (not condMapEmpty!56674)) mapNonEmpty!56674))

(get-info :version)

(assert (= (and mapNonEmpty!56674 ((_ is ValueCellFull!17435) mapValue!56674)) b!1331878))

(assert (= (and b!1331885 ((_ is ValueCellFull!17435) mapDefault!56674)) b!1331875))

(assert (= start!112362 b!1331885))

(declare-fun b_lambda!24007 () Bool)

(assert (=> (not b_lambda!24007) (not b!1331876)))

(declare-fun t!45086 () Bool)

(declare-fun tb!11965 () Bool)

(assert (=> (and start!112362 (= defaultEntry!1323 defaultEntry!1323) t!45086) tb!11965))

(declare-fun result!25009 () Bool)

(assert (=> tb!11965 (= result!25009 tp_is_empty!36667)))

(assert (=> b!1331876 t!45086))

(declare-fun b_and!49553 () Bool)

(assert (= b_and!49551 (and (=> t!45086 result!25009) b_and!49553)))

(declare-fun m!1220163 () Bool)

(assert (=> b!1331883 m!1220163))

(assert (=> b!1331883 m!1220163))

(declare-fun m!1220165 () Bool)

(assert (=> b!1331883 m!1220165))

(declare-fun m!1220167 () Bool)

(assert (=> b!1331880 m!1220167))

(declare-fun m!1220169 () Bool)

(assert (=> b!1331879 m!1220169))

(declare-fun m!1220171 () Bool)

(assert (=> start!112362 m!1220171))

(declare-fun m!1220173 () Bool)

(assert (=> start!112362 m!1220173))

(declare-fun m!1220175 () Bool)

(assert (=> start!112362 m!1220175))

(declare-fun m!1220177 () Bool)

(assert (=> b!1331876 m!1220177))

(declare-fun m!1220179 () Bool)

(assert (=> b!1331876 m!1220179))

(declare-fun m!1220181 () Bool)

(assert (=> b!1331876 m!1220181))

(declare-fun m!1220183 () Bool)

(assert (=> b!1331876 m!1220183))

(declare-fun m!1220185 () Bool)

(assert (=> b!1331876 m!1220185))

(declare-fun m!1220187 () Bool)

(assert (=> b!1331876 m!1220187))

(assert (=> b!1331876 m!1220185))

(declare-fun m!1220189 () Bool)

(assert (=> b!1331876 m!1220189))

(declare-fun m!1220191 () Bool)

(assert (=> b!1331876 m!1220191))

(declare-fun m!1220193 () Bool)

(assert (=> b!1331876 m!1220193))

(assert (=> b!1331876 m!1220193))

(declare-fun m!1220195 () Bool)

(assert (=> b!1331876 m!1220195))

(declare-fun m!1220197 () Bool)

(assert (=> b!1331876 m!1220197))

(declare-fun m!1220199 () Bool)

(assert (=> b!1331876 m!1220199))

(assert (=> b!1331876 m!1220187))

(assert (=> b!1331876 m!1220197))

(declare-fun m!1220201 () Bool)

(assert (=> b!1331876 m!1220201))

(declare-fun m!1220203 () Bool)

(assert (=> mapNonEmpty!56674 m!1220203))

(assert (=> b!1331886 m!1220193))

(assert (=> b!1331884 m!1220193))

(assert (=> b!1331884 m!1220193))

(declare-fun m!1220205 () Bool)

(assert (=> b!1331884 m!1220205))

(check-sat (not b!1331884) (not b!1331883) (not b_next!30757) (not b!1331879) b_and!49553 (not mapNonEmpty!56674) (not start!112362) (not b!1331876) (not b!1331880) tp_is_empty!36667 (not b_lambda!24007))
(check-sat b_and!49553 (not b_next!30757))
