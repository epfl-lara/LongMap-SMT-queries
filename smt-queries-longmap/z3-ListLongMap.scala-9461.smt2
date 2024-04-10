; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112376 () Bool)

(assert start!112376)

(declare-fun b_free!30771 () Bool)

(declare-fun b_next!30771 () Bool)

(assert (=> start!112376 (= b_free!30771 (not b_next!30771))))

(declare-fun tp!107949 () Bool)

(declare-fun b_and!49597 () Bool)

(assert (=> start!112376 (= tp!107949 b_and!49597)))

(declare-fun b!1332211 () Bool)

(declare-fun res!884073 () Bool)

(declare-fun e!758984 () Bool)

(assert (=> b!1332211 (=> (not res!884073) (not e!758984))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332211 (= res!884073 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56695 () Bool)

(declare-fun mapRes!56695 () Bool)

(assert (=> mapIsEmpty!56695 mapRes!56695))

(declare-fun b!1332212 () Bool)

(assert (=> b!1332212 (= e!758984 (not true))))

(declare-datatypes ((V!54011 0))(
  ( (V!54012 (val!18415 Int)) )
))
(declare-datatypes ((tuple2!23732 0))(
  ( (tuple2!23733 (_1!11877 (_ BitVec 64)) (_2!11877 V!54011)) )
))
(declare-datatypes ((List!30875 0))(
  ( (Nil!30872) (Cons!30871 (h!32080 tuple2!23732) (t!45059 List!30875)) )
))
(declare-datatypes ((ListLongMap!21389 0))(
  ( (ListLongMap!21390 (toList!10710 List!30875)) )
))
(declare-fun lt!591904 () ListLongMap!21389)

(declare-fun minValue!1262 () V!54011)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8874 (ListLongMap!21389 (_ BitVec 64)) Bool)

(declare-fun +!4703 (ListLongMap!21389 tuple2!23732) ListLongMap!21389)

(assert (=> b!1332212 (contains!8874 (+!4703 lt!591904 (tuple2!23733 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43855 0))(
  ( (Unit!43856) )
))
(declare-fun lt!591899 () Unit!43855)

(declare-fun addStillContains!1182 (ListLongMap!21389 (_ BitVec 64) V!54011 (_ BitVec 64)) Unit!43855)

(assert (=> b!1332212 (= lt!591899 (addStillContains!1182 lt!591904 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332212 (contains!8874 lt!591904 k0!1153)))

(declare-fun lt!591903 () V!54011)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((array!90242 0))(
  ( (array!90243 (arr!43587 (Array (_ BitVec 32) (_ BitVec 64))) (size!44137 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90242)

(declare-fun lt!591900 () Unit!43855)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!290 ((_ BitVec 64) (_ BitVec 64) V!54011 ListLongMap!21389) Unit!43855)

(assert (=> b!1332212 (= lt!591900 (lemmaInListMapAfterAddingDiffThenInBefore!290 k0!1153 (select (arr!43587 _keys!1590) from!1980) lt!591903 lt!591904))))

(declare-fun lt!591901 () ListLongMap!21389)

(assert (=> b!1332212 (contains!8874 lt!591901 k0!1153)))

(declare-fun lt!591902 () Unit!43855)

(assert (=> b!1332212 (= lt!591902 (lemmaInListMapAfterAddingDiffThenInBefore!290 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591901))))

(assert (=> b!1332212 (= lt!591901 (+!4703 lt!591904 (tuple2!23733 (select (arr!43587 _keys!1590) from!1980) lt!591903)))))

(declare-datatypes ((ValueCell!17442 0))(
  ( (ValueCellFull!17442 (v!21052 V!54011)) (EmptyCell!17442) )
))
(declare-datatypes ((array!90244 0))(
  ( (array!90245 (arr!43588 (Array (_ BitVec 32) ValueCell!17442)) (size!44138 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90244)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21989 (ValueCell!17442 V!54011) V!54011)

(declare-fun dynLambda!3642 (Int (_ BitVec 64)) V!54011)

(assert (=> b!1332212 (= lt!591903 (get!21989 (select (arr!43588 _values!1320) from!1980) (dynLambda!3642 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!54011)

(declare-fun getCurrentListMapNoExtraKeys!6341 (array!90242 array!90244 (_ BitVec 32) (_ BitVec 32) V!54011 V!54011 (_ BitVec 32) Int) ListLongMap!21389)

(assert (=> b!1332212 (= lt!591904 (getCurrentListMapNoExtraKeys!6341 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332213 () Bool)

(declare-fun res!884067 () Bool)

(assert (=> b!1332213 (=> (not res!884067) (not e!758984))))

(assert (=> b!1332213 (= res!884067 (and (= (size!44138 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44137 _keys!1590) (size!44138 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!884069 () Bool)

(assert (=> start!112376 (=> (not res!884069) (not e!758984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112376 (= res!884069 (validMask!0 mask!1998))))

(assert (=> start!112376 e!758984))

(declare-fun e!758985 () Bool)

(declare-fun array_inv!32875 (array!90244) Bool)

(assert (=> start!112376 (and (array_inv!32875 _values!1320) e!758985)))

(assert (=> start!112376 true))

(declare-fun array_inv!32876 (array!90242) Bool)

(assert (=> start!112376 (array_inv!32876 _keys!1590)))

(assert (=> start!112376 tp!107949))

(declare-fun tp_is_empty!36681 () Bool)

(assert (=> start!112376 tp_is_empty!36681))

(declare-fun b!1332214 () Bool)

(declare-fun res!884068 () Bool)

(assert (=> b!1332214 (=> (not res!884068) (not e!758984))))

(declare-fun getCurrentListMap!5691 (array!90242 array!90244 (_ BitVec 32) (_ BitVec 32) V!54011 V!54011 (_ BitVec 32) Int) ListLongMap!21389)

(assert (=> b!1332214 (= res!884068 (contains!8874 (getCurrentListMap!5691 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332215 () Bool)

(declare-fun res!884065 () Bool)

(assert (=> b!1332215 (=> (not res!884065) (not e!758984))))

(declare-datatypes ((List!30876 0))(
  ( (Nil!30873) (Cons!30872 (h!32081 (_ BitVec 64)) (t!45060 List!30876)) )
))
(declare-fun arrayNoDuplicates!0 (array!90242 (_ BitVec 32) List!30876) Bool)

(assert (=> b!1332215 (= res!884065 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30873))))

(declare-fun b!1332216 () Bool)

(declare-fun e!758986 () Bool)

(assert (=> b!1332216 (= e!758986 tp_is_empty!36681)))

(declare-fun mapNonEmpty!56695 () Bool)

(declare-fun tp!107950 () Bool)

(declare-fun e!758983 () Bool)

(assert (=> mapNonEmpty!56695 (= mapRes!56695 (and tp!107950 e!758983))))

(declare-fun mapKey!56695 () (_ BitVec 32))

(declare-fun mapRest!56695 () (Array (_ BitVec 32) ValueCell!17442))

(declare-fun mapValue!56695 () ValueCell!17442)

(assert (=> mapNonEmpty!56695 (= (arr!43588 _values!1320) (store mapRest!56695 mapKey!56695 mapValue!56695))))

(declare-fun b!1332217 () Bool)

(declare-fun res!884070 () Bool)

(assert (=> b!1332217 (=> (not res!884070) (not e!758984))))

(assert (=> b!1332217 (= res!884070 (not (= (select (arr!43587 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332218 () Bool)

(assert (=> b!1332218 (= e!758983 tp_is_empty!36681)))

(declare-fun b!1332219 () Bool)

(assert (=> b!1332219 (= e!758985 (and e!758986 mapRes!56695))))

(declare-fun condMapEmpty!56695 () Bool)

(declare-fun mapDefault!56695 () ValueCell!17442)

(assert (=> b!1332219 (= condMapEmpty!56695 (= (arr!43588 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17442)) mapDefault!56695)))))

(declare-fun b!1332220 () Bool)

(declare-fun res!884071 () Bool)

(assert (=> b!1332220 (=> (not res!884071) (not e!758984))))

(assert (=> b!1332220 (= res!884071 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44137 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332221 () Bool)

(declare-fun res!884072 () Bool)

(assert (=> b!1332221 (=> (not res!884072) (not e!758984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332221 (= res!884072 (validKeyInArray!0 (select (arr!43587 _keys!1590) from!1980)))))

(declare-fun b!1332222 () Bool)

(declare-fun res!884066 () Bool)

(assert (=> b!1332222 (=> (not res!884066) (not e!758984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90242 (_ BitVec 32)) Bool)

(assert (=> b!1332222 (= res!884066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112376 res!884069) b!1332213))

(assert (= (and b!1332213 res!884067) b!1332222))

(assert (= (and b!1332222 res!884066) b!1332215))

(assert (= (and b!1332215 res!884065) b!1332220))

(assert (= (and b!1332220 res!884071) b!1332214))

(assert (= (and b!1332214 res!884068) b!1332217))

(assert (= (and b!1332217 res!884070) b!1332221))

(assert (= (and b!1332221 res!884072) b!1332211))

(assert (= (and b!1332211 res!884073) b!1332212))

(assert (= (and b!1332219 condMapEmpty!56695) mapIsEmpty!56695))

(assert (= (and b!1332219 (not condMapEmpty!56695)) mapNonEmpty!56695))

(get-info :version)

(assert (= (and mapNonEmpty!56695 ((_ is ValueCellFull!17442) mapValue!56695)) b!1332218))

(assert (= (and b!1332219 ((_ is ValueCellFull!17442) mapDefault!56695)) b!1332216))

(assert (= start!112376 b!1332219))

(declare-fun b_lambda!24031 () Bool)

(assert (=> (not b_lambda!24031) (not b!1332212)))

(declare-fun t!45058 () Bool)

(declare-fun tb!11987 () Bool)

(assert (=> (and start!112376 (= defaultEntry!1323 defaultEntry!1323) t!45058) tb!11987))

(declare-fun result!25045 () Bool)

(assert (=> tb!11987 (= result!25045 tp_is_empty!36681)))

(assert (=> b!1332212 t!45058))

(declare-fun b_and!49599 () Bool)

(assert (= b_and!49597 (and (=> t!45058 result!25045) b_and!49599)))

(declare-fun m!1220987 () Bool)

(assert (=> b!1332215 m!1220987))

(declare-fun m!1220989 () Bool)

(assert (=> b!1332217 m!1220989))

(declare-fun m!1220991 () Bool)

(assert (=> mapNonEmpty!56695 m!1220991))

(declare-fun m!1220993 () Bool)

(assert (=> start!112376 m!1220993))

(declare-fun m!1220995 () Bool)

(assert (=> start!112376 m!1220995))

(declare-fun m!1220997 () Bool)

(assert (=> start!112376 m!1220997))

(declare-fun m!1220999 () Bool)

(assert (=> b!1332212 m!1220999))

(declare-fun m!1221001 () Bool)

(assert (=> b!1332212 m!1221001))

(declare-fun m!1221003 () Bool)

(assert (=> b!1332212 m!1221003))

(declare-fun m!1221005 () Bool)

(assert (=> b!1332212 m!1221005))

(assert (=> b!1332212 m!1221001))

(declare-fun m!1221007 () Bool)

(assert (=> b!1332212 m!1221007))

(assert (=> b!1332212 m!1220999))

(declare-fun m!1221009 () Bool)

(assert (=> b!1332212 m!1221009))

(declare-fun m!1221011 () Bool)

(assert (=> b!1332212 m!1221011))

(declare-fun m!1221013 () Bool)

(assert (=> b!1332212 m!1221013))

(declare-fun m!1221015 () Bool)

(assert (=> b!1332212 m!1221015))

(declare-fun m!1221017 () Bool)

(assert (=> b!1332212 m!1221017))

(declare-fun m!1221019 () Bool)

(assert (=> b!1332212 m!1221019))

(assert (=> b!1332212 m!1221005))

(assert (=> b!1332212 m!1220989))

(declare-fun m!1221021 () Bool)

(assert (=> b!1332212 m!1221021))

(assert (=> b!1332212 m!1220989))

(declare-fun m!1221023 () Bool)

(assert (=> b!1332214 m!1221023))

(assert (=> b!1332214 m!1221023))

(declare-fun m!1221025 () Bool)

(assert (=> b!1332214 m!1221025))

(declare-fun m!1221027 () Bool)

(assert (=> b!1332222 m!1221027))

(assert (=> b!1332221 m!1220989))

(assert (=> b!1332221 m!1220989))

(declare-fun m!1221029 () Bool)

(assert (=> b!1332221 m!1221029))

(check-sat (not start!112376) b_and!49599 tp_is_empty!36681 (not b!1332222) (not mapNonEmpty!56695) (not b_next!30771) (not b_lambda!24031) (not b!1332221) (not b!1332214) (not b!1332215) (not b!1332212))
(check-sat b_and!49599 (not b_next!30771))
