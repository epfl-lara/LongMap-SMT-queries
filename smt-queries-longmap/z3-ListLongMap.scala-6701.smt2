; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84160 () Bool)

(assert start!84160)

(declare-fun b_free!19879 () Bool)

(declare-fun b_next!19879 () Bool)

(assert (=> start!84160 (= b_free!19879 (not b_next!19879))))

(declare-fun tp!69241 () Bool)

(declare-fun b_and!31809 () Bool)

(assert (=> start!84160 (= tp!69241 b_and!31809)))

(declare-fun b!984183 () Bool)

(declare-fun e!554806 () Bool)

(declare-fun tp_is_empty!22981 () Bool)

(assert (=> b!984183 (= e!554806 tp_is_empty!22981)))

(declare-fun b!984184 () Bool)

(declare-fun e!554808 () Bool)

(declare-fun e!554805 () Bool)

(assert (=> b!984184 (= e!554808 e!554805)))

(declare-fun res!658616 () Bool)

(assert (=> b!984184 (=> (not res!658616) (not e!554805))))

(declare-datatypes ((array!61870 0))(
  ( (array!61871 (arr!29793 (Array (_ BitVec 32) (_ BitVec 64))) (size!30274 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61870)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!984184 (= res!658616 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29793 _keys!1544) from!1932))))))

(declare-datatypes ((V!35625 0))(
  ( (V!35626 (val!11541 Int)) )
))
(declare-datatypes ((ValueCell!11009 0))(
  ( (ValueCellFull!11009 (v!14102 V!35625)) (EmptyCell!11009) )
))
(declare-datatypes ((array!61872 0))(
  ( (array!61873 (arr!29794 (Array (_ BitVec 32) ValueCell!11009)) (size!30275 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61872)

(declare-fun lt!436571 () V!35625)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15471 (ValueCell!11009 V!35625) V!35625)

(declare-fun dynLambda!1811 (Int (_ BitVec 64)) V!35625)

(assert (=> b!984184 (= lt!436571 (get!15471 (select (arr!29794 _values!1278) from!1932) (dynLambda!1811 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35625)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35625)

(declare-datatypes ((tuple2!14836 0))(
  ( (tuple2!14837 (_1!7429 (_ BitVec 64)) (_2!7429 V!35625)) )
))
(declare-datatypes ((List!20689 0))(
  ( (Nil!20686) (Cons!20685 (h!21847 tuple2!14836) (t!29503 List!20689)) )
))
(declare-datatypes ((ListLongMap!13523 0))(
  ( (ListLongMap!13524 (toList!6777 List!20689)) )
))
(declare-fun lt!436575 () ListLongMap!13523)

(declare-fun getCurrentListMapNoExtraKeys!3483 (array!61870 array!61872 (_ BitVec 32) (_ BitVec 32) V!35625 V!35625 (_ BitVec 32) Int) ListLongMap!13523)

(assert (=> b!984184 (= lt!436575 (getCurrentListMapNoExtraKeys!3483 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984185 () Bool)

(declare-fun e!554810 () Bool)

(declare-fun mapRes!36500 () Bool)

(assert (=> b!984185 (= e!554810 (and e!554806 mapRes!36500))))

(declare-fun condMapEmpty!36500 () Bool)

(declare-fun mapDefault!36500 () ValueCell!11009)

(assert (=> b!984185 (= condMapEmpty!36500 (= (arr!29794 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11009)) mapDefault!36500)))))

(declare-fun mapNonEmpty!36500 () Bool)

(declare-fun tp!69242 () Bool)

(declare-fun e!554807 () Bool)

(assert (=> mapNonEmpty!36500 (= mapRes!36500 (and tp!69242 e!554807))))

(declare-fun mapRest!36500 () (Array (_ BitVec 32) ValueCell!11009))

(declare-fun mapValue!36500 () ValueCell!11009)

(declare-fun mapKey!36500 () (_ BitVec 32))

(assert (=> mapNonEmpty!36500 (= (arr!29794 _values!1278) (store mapRest!36500 mapKey!36500 mapValue!36500))))

(declare-fun b!984186 () Bool)

(declare-fun res!658615 () Bool)

(assert (=> b!984186 (=> (not res!658615) (not e!554808))))

(assert (=> b!984186 (= res!658615 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30274 _keys!1544))))))

(declare-fun b!984187 () Bool)

(declare-fun res!658610 () Bool)

(assert (=> b!984187 (=> (not res!658610) (not e!554808))))

(declare-datatypes ((List!20690 0))(
  ( (Nil!20687) (Cons!20686 (h!21848 (_ BitVec 64)) (t!29504 List!20690)) )
))
(declare-fun arrayNoDuplicates!0 (array!61870 (_ BitVec 32) List!20690) Bool)

(assert (=> b!984187 (= res!658610 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20687))))

(declare-fun b!984188 () Bool)

(assert (=> b!984188 (= e!554807 tp_is_empty!22981)))

(declare-fun res!658614 () Bool)

(assert (=> start!84160 (=> (not res!658614) (not e!554808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84160 (= res!658614 (validMask!0 mask!1948))))

(assert (=> start!84160 e!554808))

(assert (=> start!84160 true))

(assert (=> start!84160 tp_is_empty!22981))

(declare-fun array_inv!23039 (array!61872) Bool)

(assert (=> start!84160 (and (array_inv!23039 _values!1278) e!554810)))

(assert (=> start!84160 tp!69241))

(declare-fun array_inv!23040 (array!61870) Bool)

(assert (=> start!84160 (array_inv!23040 _keys!1544)))

(declare-fun mapIsEmpty!36500 () Bool)

(assert (=> mapIsEmpty!36500 mapRes!36500))

(declare-fun b!984189 () Bool)

(declare-fun res!658612 () Bool)

(assert (=> b!984189 (=> (not res!658612) (not e!554808))))

(assert (=> b!984189 (= res!658612 (and (= (size!30275 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30274 _keys!1544) (size!30275 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984190 () Bool)

(declare-fun res!658613 () Bool)

(assert (=> b!984190 (=> (not res!658613) (not e!554808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984190 (= res!658613 (validKeyInArray!0 (select (arr!29793 _keys!1544) from!1932)))))

(declare-fun b!984191 () Bool)

(assert (=> b!984191 (= e!554805 (not true))))

(declare-fun lt!436572 () tuple2!14836)

(declare-fun lt!436574 () tuple2!14836)

(declare-fun +!3059 (ListLongMap!13523 tuple2!14836) ListLongMap!13523)

(assert (=> b!984191 (= (+!3059 (+!3059 lt!436575 lt!436572) lt!436574) (+!3059 (+!3059 lt!436575 lt!436574) lt!436572))))

(assert (=> b!984191 (= lt!436574 (tuple2!14837 (select (arr!29793 _keys!1544) from!1932) lt!436571))))

(assert (=> b!984191 (= lt!436572 (tuple2!14837 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32584 0))(
  ( (Unit!32585) )
))
(declare-fun lt!436573 () Unit!32584)

(declare-fun addCommutativeForDiffKeys!663 (ListLongMap!13523 (_ BitVec 64) V!35625 (_ BitVec 64) V!35625) Unit!32584)

(assert (=> b!984191 (= lt!436573 (addCommutativeForDiffKeys!663 lt!436575 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29793 _keys!1544) from!1932) lt!436571))))

(declare-fun b!984192 () Bool)

(declare-fun res!658611 () Bool)

(assert (=> b!984192 (=> (not res!658611) (not e!554808))))

(assert (=> b!984192 (= res!658611 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984193 () Bool)

(declare-fun res!658617 () Bool)

(assert (=> b!984193 (=> (not res!658617) (not e!554808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61870 (_ BitVec 32)) Bool)

(assert (=> b!984193 (= res!658617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84160 res!658614) b!984189))

(assert (= (and b!984189 res!658612) b!984193))

(assert (= (and b!984193 res!658617) b!984187))

(assert (= (and b!984187 res!658610) b!984186))

(assert (= (and b!984186 res!658615) b!984190))

(assert (= (and b!984190 res!658613) b!984192))

(assert (= (and b!984192 res!658611) b!984184))

(assert (= (and b!984184 res!658616) b!984191))

(assert (= (and b!984185 condMapEmpty!36500) mapIsEmpty!36500))

(assert (= (and b!984185 (not condMapEmpty!36500)) mapNonEmpty!36500))

(get-info :version)

(assert (= (and mapNonEmpty!36500 ((_ is ValueCellFull!11009) mapValue!36500)) b!984188))

(assert (= (and b!984185 ((_ is ValueCellFull!11009) mapDefault!36500)) b!984183))

(assert (= start!84160 b!984185))

(declare-fun b_lambda!14893 () Bool)

(assert (=> (not b_lambda!14893) (not b!984184)))

(declare-fun t!29502 () Bool)

(declare-fun tb!6665 () Bool)

(assert (=> (and start!84160 (= defaultEntry!1281 defaultEntry!1281) t!29502) tb!6665))

(declare-fun result!13327 () Bool)

(assert (=> tb!6665 (= result!13327 tp_is_empty!22981)))

(assert (=> b!984184 t!29502))

(declare-fun b_and!31811 () Bool)

(assert (= b_and!31809 (and (=> t!29502 result!13327) b_and!31811)))

(declare-fun m!910751 () Bool)

(assert (=> b!984184 m!910751))

(declare-fun m!910753 () Bool)

(assert (=> b!984184 m!910753))

(declare-fun m!910755 () Bool)

(assert (=> b!984184 m!910755))

(declare-fun m!910757 () Bool)

(assert (=> b!984184 m!910757))

(assert (=> b!984184 m!910753))

(assert (=> b!984184 m!910757))

(declare-fun m!910759 () Bool)

(assert (=> b!984184 m!910759))

(declare-fun m!910761 () Bool)

(assert (=> mapNonEmpty!36500 m!910761))

(declare-fun m!910763 () Bool)

(assert (=> b!984193 m!910763))

(declare-fun m!910765 () Bool)

(assert (=> start!84160 m!910765))

(declare-fun m!910767 () Bool)

(assert (=> start!84160 m!910767))

(declare-fun m!910769 () Bool)

(assert (=> start!84160 m!910769))

(assert (=> b!984190 m!910751))

(assert (=> b!984190 m!910751))

(declare-fun m!910771 () Bool)

(assert (=> b!984190 m!910771))

(assert (=> b!984191 m!910751))

(declare-fun m!910773 () Bool)

(assert (=> b!984191 m!910773))

(declare-fun m!910775 () Bool)

(assert (=> b!984191 m!910775))

(declare-fun m!910777 () Bool)

(assert (=> b!984191 m!910777))

(declare-fun m!910779 () Bool)

(assert (=> b!984191 m!910779))

(assert (=> b!984191 m!910773))

(assert (=> b!984191 m!910751))

(declare-fun m!910781 () Bool)

(assert (=> b!984191 m!910781))

(assert (=> b!984191 m!910777))

(declare-fun m!910783 () Bool)

(assert (=> b!984187 m!910783))

(check-sat tp_is_empty!22981 (not mapNonEmpty!36500) (not b_next!19879) (not b!984191) (not start!84160) b_and!31811 (not b!984193) (not b!984184) (not b!984190) (not b!984187) (not b_lambda!14893))
(check-sat b_and!31811 (not b_next!19879))
