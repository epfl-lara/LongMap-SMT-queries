; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112706 () Bool)

(assert start!112706)

(declare-fun b_free!30877 () Bool)

(declare-fun b_next!30877 () Bool)

(assert (=> start!112706 (= b_free!30877 (not b_next!30877))))

(declare-fun tp!108267 () Bool)

(declare-fun b_and!49757 () Bool)

(assert (=> start!112706 (= tp!108267 b_and!49757)))

(declare-fun b!1335249 () Bool)

(declare-fun res!885797 () Bool)

(declare-fun e!760663 () Bool)

(assert (=> b!1335249 (=> (not res!885797) (not e!760663))))

(declare-datatypes ((V!54153 0))(
  ( (V!54154 (val!18468 Int)) )
))
(declare-datatypes ((ValueCell!17495 0))(
  ( (ValueCellFull!17495 (v!21100 V!54153)) (EmptyCell!17495) )
))
(declare-datatypes ((array!90547 0))(
  ( (array!90548 (arr!43735 (Array (_ BitVec 32) ValueCell!17495)) (size!44286 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90547)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90549 0))(
  ( (array!90550 (arr!43736 (Array (_ BitVec 32) (_ BitVec 64))) (size!44287 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90549)

(assert (=> b!1335249 (= res!885797 (and (= (size!44286 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44287 _keys!1590) (size!44286 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335250 () Bool)

(declare-fun res!885803 () Bool)

(assert (=> b!1335250 (=> (not res!885803) (not e!760663))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335250 (= res!885803 (not (= (select (arr!43736 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335251 () Bool)

(declare-fun e!760660 () Bool)

(declare-fun tp_is_empty!36787 () Bool)

(assert (=> b!1335251 (= e!760660 tp_is_empty!36787)))

(declare-fun b!1335252 () Bool)

(declare-fun res!885802 () Bool)

(assert (=> b!1335252 (=> (not res!885802) (not e!760663))))

(declare-datatypes ((List!30986 0))(
  ( (Nil!30983) (Cons!30982 (h!32200 (_ BitVec 64)) (t!45214 List!30986)) )
))
(declare-fun arrayNoDuplicates!0 (array!90549 (_ BitVec 32) List!30986) Bool)

(assert (=> b!1335252 (= res!885802 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30983))))

(declare-fun b!1335253 () Bool)

(declare-fun res!885796 () Bool)

(assert (=> b!1335253 (=> (not res!885796) (not e!760663))))

(assert (=> b!1335253 (= res!885796 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1335254 () Bool)

(declare-fun e!760658 () Bool)

(assert (=> b!1335254 (= e!760663 e!760658)))

(declare-fun res!885794 () Bool)

(assert (=> b!1335254 (=> (not res!885794) (not e!760658))))

(declare-fun lt!592713 () V!54153)

(declare-datatypes ((tuple2!23834 0))(
  ( (tuple2!23835 (_1!11928 (_ BitVec 64)) (_2!11928 V!54153)) )
))
(declare-datatypes ((List!30987 0))(
  ( (Nil!30984) (Cons!30983 (h!32201 tuple2!23834) (t!45215 List!30987)) )
))
(declare-datatypes ((ListLongMap!21499 0))(
  ( (ListLongMap!21500 (toList!10765 List!30987)) )
))
(declare-fun lt!592711 () ListLongMap!21499)

(declare-fun contains!8941 (ListLongMap!21499 (_ BitVec 64)) Bool)

(declare-fun +!4755 (ListLongMap!21499 tuple2!23834) ListLongMap!21499)

(assert (=> b!1335254 (= res!885794 (contains!8941 (+!4755 lt!592711 (tuple2!23835 (select (arr!43736 _keys!1590) from!1980) lt!592713)) k0!1153))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54153)

(declare-fun zeroValue!1262 () V!54153)

(declare-fun getCurrentListMapNoExtraKeys!6399 (array!90549 array!90547 (_ BitVec 32) (_ BitVec 32) V!54153 V!54153 (_ BitVec 32) Int) ListLongMap!21499)

(assert (=> b!1335254 (= lt!592711 (getCurrentListMapNoExtraKeys!6399 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22080 (ValueCell!17495 V!54153) V!54153)

(declare-fun dynLambda!3709 (Int (_ BitVec 64)) V!54153)

(assert (=> b!1335254 (= lt!592713 (get!22080 (select (arr!43735 _values!1320) from!1980) (dynLambda!3709 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335255 () Bool)

(assert (=> b!1335255 (= e!760658 (not true))))

(assert (=> b!1335255 (contains!8941 lt!592711 k0!1153)))

(declare-datatypes ((Unit!43812 0))(
  ( (Unit!43813) )
))
(declare-fun lt!592712 () Unit!43812)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!294 ((_ BitVec 64) (_ BitVec 64) V!54153 ListLongMap!21499) Unit!43812)

(assert (=> b!1335255 (= lt!592712 (lemmaInListMapAfterAddingDiffThenInBefore!294 k0!1153 (select (arr!43736 _keys!1590) from!1980) lt!592713 lt!592711))))

(declare-fun res!885798 () Bool)

(assert (=> start!112706 (=> (not res!885798) (not e!760663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112706 (= res!885798 (validMask!0 mask!1998))))

(assert (=> start!112706 e!760663))

(declare-fun e!760659 () Bool)

(declare-fun array_inv!33257 (array!90547) Bool)

(assert (=> start!112706 (and (array_inv!33257 _values!1320) e!760659)))

(assert (=> start!112706 true))

(declare-fun array_inv!33258 (array!90549) Bool)

(assert (=> start!112706 (array_inv!33258 _keys!1590)))

(assert (=> start!112706 tp!108267))

(assert (=> start!112706 tp_is_empty!36787))

(declare-fun b!1335256 () Bool)

(declare-fun res!885795 () Bool)

(assert (=> b!1335256 (=> (not res!885795) (not e!760663))))

(assert (=> b!1335256 (= res!885795 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44287 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335257 () Bool)

(declare-fun e!760661 () Bool)

(declare-fun mapRes!56854 () Bool)

(assert (=> b!1335257 (= e!760659 (and e!760661 mapRes!56854))))

(declare-fun condMapEmpty!56854 () Bool)

(declare-fun mapDefault!56854 () ValueCell!17495)

(assert (=> b!1335257 (= condMapEmpty!56854 (= (arr!43735 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17495)) mapDefault!56854)))))

(declare-fun b!1335258 () Bool)

(declare-fun res!885800 () Bool)

(assert (=> b!1335258 (=> (not res!885800) (not e!760663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335258 (= res!885800 (validKeyInArray!0 (select (arr!43736 _keys!1590) from!1980)))))

(declare-fun b!1335259 () Bool)

(declare-fun res!885799 () Bool)

(assert (=> b!1335259 (=> (not res!885799) (not e!760663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90549 (_ BitVec 32)) Bool)

(assert (=> b!1335259 (= res!885799 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56854 () Bool)

(assert (=> mapIsEmpty!56854 mapRes!56854))

(declare-fun b!1335260 () Bool)

(declare-fun res!885801 () Bool)

(assert (=> b!1335260 (=> (not res!885801) (not e!760658))))

(assert (=> b!1335260 (= res!885801 (not (= k0!1153 (select (arr!43736 _keys!1590) from!1980))))))

(declare-fun b!1335261 () Bool)

(declare-fun res!885793 () Bool)

(assert (=> b!1335261 (=> (not res!885793) (not e!760663))))

(declare-fun getCurrentListMap!5727 (array!90549 array!90547 (_ BitVec 32) (_ BitVec 32) V!54153 V!54153 (_ BitVec 32) Int) ListLongMap!21499)

(assert (=> b!1335261 (= res!885793 (contains!8941 (getCurrentListMap!5727 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335262 () Bool)

(assert (=> b!1335262 (= e!760661 tp_is_empty!36787)))

(declare-fun mapNonEmpty!56854 () Bool)

(declare-fun tp!108268 () Bool)

(assert (=> mapNonEmpty!56854 (= mapRes!56854 (and tp!108268 e!760660))))

(declare-fun mapKey!56854 () (_ BitVec 32))

(declare-fun mapValue!56854 () ValueCell!17495)

(declare-fun mapRest!56854 () (Array (_ BitVec 32) ValueCell!17495))

(assert (=> mapNonEmpty!56854 (= (arr!43735 _values!1320) (store mapRest!56854 mapKey!56854 mapValue!56854))))

(assert (= (and start!112706 res!885798) b!1335249))

(assert (= (and b!1335249 res!885797) b!1335259))

(assert (= (and b!1335259 res!885799) b!1335252))

(assert (= (and b!1335252 res!885802) b!1335256))

(assert (= (and b!1335256 res!885795) b!1335261))

(assert (= (and b!1335261 res!885793) b!1335250))

(assert (= (and b!1335250 res!885803) b!1335258))

(assert (= (and b!1335258 res!885800) b!1335253))

(assert (= (and b!1335253 res!885796) b!1335254))

(assert (= (and b!1335254 res!885794) b!1335260))

(assert (= (and b!1335260 res!885801) b!1335255))

(assert (= (and b!1335257 condMapEmpty!56854) mapIsEmpty!56854))

(assert (= (and b!1335257 (not condMapEmpty!56854)) mapNonEmpty!56854))

(get-info :version)

(assert (= (and mapNonEmpty!56854 ((_ is ValueCellFull!17495) mapValue!56854)) b!1335251))

(assert (= (and b!1335257 ((_ is ValueCellFull!17495) mapDefault!56854)) b!1335262))

(assert (= start!112706 b!1335257))

(declare-fun b_lambda!24077 () Bool)

(assert (=> (not b_lambda!24077) (not b!1335254)))

(declare-fun t!45213 () Bool)

(declare-fun tb!12031 () Bool)

(assert (=> (and start!112706 (= defaultEntry!1323 defaultEntry!1323) t!45213) tb!12031))

(declare-fun result!25141 () Bool)

(assert (=> tb!12031 (= result!25141 tp_is_empty!36787)))

(assert (=> b!1335254 t!45213))

(declare-fun b_and!49759 () Bool)

(assert (= b_and!49757 (and (=> t!45213 result!25141) b_and!49759)))

(declare-fun m!1224005 () Bool)

(assert (=> b!1335261 m!1224005))

(assert (=> b!1335261 m!1224005))

(declare-fun m!1224007 () Bool)

(assert (=> b!1335261 m!1224007))

(declare-fun m!1224009 () Bool)

(assert (=> b!1335258 m!1224009))

(assert (=> b!1335258 m!1224009))

(declare-fun m!1224011 () Bool)

(assert (=> b!1335258 m!1224011))

(assert (=> b!1335260 m!1224009))

(declare-fun m!1224013 () Bool)

(assert (=> start!112706 m!1224013))

(declare-fun m!1224015 () Bool)

(assert (=> start!112706 m!1224015))

(declare-fun m!1224017 () Bool)

(assert (=> start!112706 m!1224017))

(assert (=> b!1335250 m!1224009))

(declare-fun m!1224019 () Bool)

(assert (=> b!1335252 m!1224019))

(declare-fun m!1224021 () Bool)

(assert (=> b!1335254 m!1224021))

(declare-fun m!1224023 () Bool)

(assert (=> b!1335254 m!1224023))

(declare-fun m!1224025 () Bool)

(assert (=> b!1335254 m!1224025))

(assert (=> b!1335254 m!1224023))

(declare-fun m!1224027 () Bool)

(assert (=> b!1335254 m!1224027))

(declare-fun m!1224029 () Bool)

(assert (=> b!1335254 m!1224029))

(assert (=> b!1335254 m!1224025))

(assert (=> b!1335254 m!1224021))

(declare-fun m!1224031 () Bool)

(assert (=> b!1335254 m!1224031))

(assert (=> b!1335254 m!1224009))

(declare-fun m!1224033 () Bool)

(assert (=> b!1335259 m!1224033))

(declare-fun m!1224035 () Bool)

(assert (=> b!1335255 m!1224035))

(assert (=> b!1335255 m!1224009))

(assert (=> b!1335255 m!1224009))

(declare-fun m!1224037 () Bool)

(assert (=> b!1335255 m!1224037))

(declare-fun m!1224039 () Bool)

(assert (=> mapNonEmpty!56854 m!1224039))

(check-sat b_and!49759 (not b_lambda!24077) (not b!1335252) (not b!1335254) (not b_next!30877) tp_is_empty!36787 (not start!112706) (not b!1335259) (not mapNonEmpty!56854) (not b!1335261) (not b!1335258) (not b!1335255))
(check-sat b_and!49759 (not b_next!30877))
