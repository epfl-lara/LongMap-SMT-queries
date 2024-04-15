; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112206 () Bool)

(assert start!112206)

(declare-fun b_free!30601 () Bool)

(declare-fun b_next!30601 () Bool)

(assert (=> start!112206 (= b_free!30601 (not b_next!30601))))

(declare-fun tp!107441 () Bool)

(declare-fun b_and!49239 () Bool)

(assert (=> start!112206 (= tp!107441 b_and!49239)))

(declare-fun b!1328911 () Bool)

(declare-fun e!757676 () Bool)

(assert (=> b!1328911 (= e!757676 false)))

(declare-datatypes ((V!53785 0))(
  ( (V!53786 (val!18330 Int)) )
))
(declare-datatypes ((ValueCell!17357 0))(
  ( (ValueCellFull!17357 (v!20966 V!53785)) (EmptyCell!17357) )
))
(declare-datatypes ((array!89849 0))(
  ( (array!89850 (arr!43391 (Array (_ BitVec 32) ValueCell!17357)) (size!43943 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89849)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89851 0))(
  ( (array!89852 (arr!43392 (Array (_ BitVec 32) (_ BitVec 64))) (size!43944 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89851)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53785)

(declare-fun zeroValue!1262 () V!53785)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!590704 () Bool)

(declare-datatypes ((tuple2!23656 0))(
  ( (tuple2!23657 (_1!11839 (_ BitVec 64)) (_2!11839 V!53785)) )
))
(declare-datatypes ((List!30808 0))(
  ( (Nil!30805) (Cons!30804 (h!32013 tuple2!23656) (t!44814 List!30808)) )
))
(declare-datatypes ((ListLongMap!21313 0))(
  ( (ListLongMap!21314 (toList!10672 List!30808)) )
))
(declare-fun contains!8764 (ListLongMap!21313 (_ BitVec 64)) Bool)

(declare-fun +!4659 (ListLongMap!21313 tuple2!23656) ListLongMap!21313)

(declare-fun getCurrentListMapNoExtraKeys!6297 (array!89851 array!89849 (_ BitVec 32) (_ BitVec 32) V!53785 V!53785 (_ BitVec 32) Int) ListLongMap!21313)

(declare-fun get!21856 (ValueCell!17357 V!53785) V!53785)

(declare-fun dynLambda!3589 (Int (_ BitVec 64)) V!53785)

(assert (=> b!1328911 (= lt!590704 (contains!8764 (+!4659 (+!4659 (getCurrentListMapNoExtraKeys!6297 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23657 (select (arr!43392 _keys!1590) from!1980) (get!21856 (select (arr!43391 _values!1320) from!1980) (dynLambda!3589 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23657 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1328912 () Bool)

(declare-fun res!881748 () Bool)

(assert (=> b!1328912 (=> (not res!881748) (not e!757676))))

(assert (=> b!1328912 (= res!881748 (not (= (select (arr!43392 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1328913 () Bool)

(declare-fun res!881749 () Bool)

(assert (=> b!1328913 (=> (not res!881749) (not e!757676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328913 (= res!881749 (validKeyInArray!0 (select (arr!43392 _keys!1590) from!1980)))))

(declare-fun b!1328914 () Bool)

(declare-fun res!881743 () Bool)

(assert (=> b!1328914 (=> (not res!881743) (not e!757676))))

(assert (=> b!1328914 (= res!881743 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1328915 () Bool)

(declare-fun e!757674 () Bool)

(declare-fun tp_is_empty!36511 () Bool)

(assert (=> b!1328915 (= e!757674 tp_is_empty!36511)))

(declare-fun mapIsEmpty!56440 () Bool)

(declare-fun mapRes!56440 () Bool)

(assert (=> mapIsEmpty!56440 mapRes!56440))

(declare-fun b!1328916 () Bool)

(declare-fun res!881745 () Bool)

(assert (=> b!1328916 (=> (not res!881745) (not e!757676))))

(declare-fun getCurrentListMap!5543 (array!89851 array!89849 (_ BitVec 32) (_ BitVec 32) V!53785 V!53785 (_ BitVec 32) Int) ListLongMap!21313)

(assert (=> b!1328916 (= res!881745 (contains!8764 (getCurrentListMap!5543 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328917 () Bool)

(declare-fun e!757677 () Bool)

(assert (=> b!1328917 (= e!757677 (and e!757674 mapRes!56440))))

(declare-fun condMapEmpty!56440 () Bool)

(declare-fun mapDefault!56440 () ValueCell!17357)

(assert (=> b!1328917 (= condMapEmpty!56440 (= (arr!43391 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17357)) mapDefault!56440)))))

(declare-fun b!1328918 () Bool)

(declare-fun res!881746 () Bool)

(assert (=> b!1328918 (=> (not res!881746) (not e!757676))))

(assert (=> b!1328918 (= res!881746 (and (= (size!43943 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43944 _keys!1590) (size!43943 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun res!881747 () Bool)

(assert (=> start!112206 (=> (not res!881747) (not e!757676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112206 (= res!881747 (validMask!0 mask!1998))))

(assert (=> start!112206 e!757676))

(declare-fun array_inv!32917 (array!89849) Bool)

(assert (=> start!112206 (and (array_inv!32917 _values!1320) e!757677)))

(assert (=> start!112206 true))

(declare-fun array_inv!32918 (array!89851) Bool)

(assert (=> start!112206 (array_inv!32918 _keys!1590)))

(assert (=> start!112206 tp!107441))

(assert (=> start!112206 tp_is_empty!36511))

(declare-fun b!1328919 () Bool)

(declare-fun res!881744 () Bool)

(assert (=> b!1328919 (=> (not res!881744) (not e!757676))))

(declare-datatypes ((List!30809 0))(
  ( (Nil!30806) (Cons!30805 (h!32014 (_ BitVec 64)) (t!44815 List!30809)) )
))
(declare-fun arrayNoDuplicates!0 (array!89851 (_ BitVec 32) List!30809) Bool)

(assert (=> b!1328919 (= res!881744 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30806))))

(declare-fun mapNonEmpty!56440 () Bool)

(declare-fun tp!107440 () Bool)

(declare-fun e!757675 () Bool)

(assert (=> mapNonEmpty!56440 (= mapRes!56440 (and tp!107440 e!757675))))

(declare-fun mapRest!56440 () (Array (_ BitVec 32) ValueCell!17357))

(declare-fun mapValue!56440 () ValueCell!17357)

(declare-fun mapKey!56440 () (_ BitVec 32))

(assert (=> mapNonEmpty!56440 (= (arr!43391 _values!1320) (store mapRest!56440 mapKey!56440 mapValue!56440))))

(declare-fun b!1328920 () Bool)

(declare-fun res!881742 () Bool)

(assert (=> b!1328920 (=> (not res!881742) (not e!757676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89851 (_ BitVec 32)) Bool)

(assert (=> b!1328920 (= res!881742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328921 () Bool)

(assert (=> b!1328921 (= e!757675 tp_is_empty!36511)))

(declare-fun b!1328922 () Bool)

(declare-fun res!881741 () Bool)

(assert (=> b!1328922 (=> (not res!881741) (not e!757676))))

(assert (=> b!1328922 (= res!881741 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43944 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112206 res!881747) b!1328918))

(assert (= (and b!1328918 res!881746) b!1328920))

(assert (= (and b!1328920 res!881742) b!1328919))

(assert (= (and b!1328919 res!881744) b!1328922))

(assert (= (and b!1328922 res!881741) b!1328916))

(assert (= (and b!1328916 res!881745) b!1328912))

(assert (= (and b!1328912 res!881748) b!1328913))

(assert (= (and b!1328913 res!881749) b!1328914))

(assert (= (and b!1328914 res!881743) b!1328911))

(assert (= (and b!1328917 condMapEmpty!56440) mapIsEmpty!56440))

(assert (= (and b!1328917 (not condMapEmpty!56440)) mapNonEmpty!56440))

(get-info :version)

(assert (= (and mapNonEmpty!56440 ((_ is ValueCellFull!17357) mapValue!56440)) b!1328921))

(assert (= (and b!1328917 ((_ is ValueCellFull!17357) mapDefault!56440)) b!1328915))

(assert (= start!112206 b!1328917))

(declare-fun b_lambda!23851 () Bool)

(assert (=> (not b_lambda!23851) (not b!1328911)))

(declare-fun t!44813 () Bool)

(declare-fun tb!11809 () Bool)

(assert (=> (and start!112206 (= defaultEntry!1323 defaultEntry!1323) t!44813) tb!11809))

(declare-fun result!24697 () Bool)

(assert (=> tb!11809 (= result!24697 tp_is_empty!36511)))

(assert (=> b!1328911 t!44813))

(declare-fun b_and!49241 () Bool)

(assert (= b_and!49239 (and (=> t!44813 result!24697) b_and!49241)))

(declare-fun m!1217271 () Bool)

(assert (=> b!1328916 m!1217271))

(assert (=> b!1328916 m!1217271))

(declare-fun m!1217273 () Bool)

(assert (=> b!1328916 m!1217273))

(declare-fun m!1217275 () Bool)

(assert (=> b!1328919 m!1217275))

(declare-fun m!1217277 () Bool)

(assert (=> b!1328912 m!1217277))

(declare-fun m!1217279 () Bool)

(assert (=> start!112206 m!1217279))

(declare-fun m!1217281 () Bool)

(assert (=> start!112206 m!1217281))

(declare-fun m!1217283 () Bool)

(assert (=> start!112206 m!1217283))

(assert (=> b!1328913 m!1217277))

(assert (=> b!1328913 m!1217277))

(declare-fun m!1217285 () Bool)

(assert (=> b!1328913 m!1217285))

(declare-fun m!1217287 () Bool)

(assert (=> b!1328920 m!1217287))

(declare-fun m!1217289 () Bool)

(assert (=> b!1328911 m!1217289))

(declare-fun m!1217291 () Bool)

(assert (=> b!1328911 m!1217291))

(declare-fun m!1217293 () Bool)

(assert (=> b!1328911 m!1217293))

(declare-fun m!1217295 () Bool)

(assert (=> b!1328911 m!1217295))

(declare-fun m!1217297 () Bool)

(assert (=> b!1328911 m!1217297))

(assert (=> b!1328911 m!1217291))

(declare-fun m!1217299 () Bool)

(assert (=> b!1328911 m!1217299))

(assert (=> b!1328911 m!1217289))

(assert (=> b!1328911 m!1217293))

(assert (=> b!1328911 m!1217277))

(assert (=> b!1328911 m!1217295))

(assert (=> b!1328911 m!1217299))

(declare-fun m!1217301 () Bool)

(assert (=> b!1328911 m!1217301))

(declare-fun m!1217303 () Bool)

(assert (=> mapNonEmpty!56440 m!1217303))

(check-sat b_and!49241 (not start!112206) (not mapNonEmpty!56440) (not b!1328913) tp_is_empty!36511 (not b_lambda!23851) (not b!1328919) (not b!1328916) (not b!1328911) (not b!1328920) (not b_next!30601))
(check-sat b_and!49241 (not b_next!30601))
