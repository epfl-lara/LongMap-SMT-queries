; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112448 () Bool)

(assert start!112448)

(declare-fun b_free!30843 () Bool)

(declare-fun b_next!30843 () Bool)

(assert (=> start!112448 (= b_free!30843 (not b_next!30843))))

(declare-fun tp!108165 () Bool)

(declare-fun b_and!49687 () Bool)

(assert (=> start!112448 (= tp!108165 b_and!49687)))

(declare-fun b!1333228 () Bool)

(declare-fun res!884748 () Bool)

(declare-fun e!759522 () Bool)

(assert (=> b!1333228 (=> (not res!884748) (not e!759522))))

(declare-datatypes ((array!90380 0))(
  ( (array!90381 (arr!43656 (Array (_ BitVec 32) (_ BitVec 64))) (size!44206 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90380)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90380 (_ BitVec 32)) Bool)

(assert (=> b!1333228 (= res!884748 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333229 () Bool)

(declare-fun res!884740 () Bool)

(assert (=> b!1333229 (=> (not res!884740) (not e!759522))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1333229 (= res!884740 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1333230 () Bool)

(declare-fun e!759526 () Bool)

(declare-fun tp_is_empty!36753 () Bool)

(assert (=> b!1333230 (= e!759526 tp_is_empty!36753)))

(declare-fun res!884746 () Bool)

(assert (=> start!112448 (=> (not res!884746) (not e!759522))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112448 (= res!884746 (validMask!0 mask!1998))))

(assert (=> start!112448 e!759522))

(declare-datatypes ((V!54107 0))(
  ( (V!54108 (val!18451 Int)) )
))
(declare-datatypes ((ValueCell!17478 0))(
  ( (ValueCellFull!17478 (v!21088 V!54107)) (EmptyCell!17478) )
))
(declare-datatypes ((array!90382 0))(
  ( (array!90383 (arr!43657 (Array (_ BitVec 32) ValueCell!17478)) (size!44207 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90382)

(declare-fun e!759523 () Bool)

(declare-fun array_inv!32927 (array!90382) Bool)

(assert (=> start!112448 (and (array_inv!32927 _values!1320) e!759523)))

(assert (=> start!112448 true))

(declare-fun array_inv!32928 (array!90380) Bool)

(assert (=> start!112448 (array_inv!32928 _keys!1590)))

(assert (=> start!112448 tp!108165))

(assert (=> start!112448 tp_is_empty!36753))

(declare-fun b!1333231 () Bool)

(declare-fun res!884743 () Bool)

(assert (=> b!1333231 (=> (not res!884743) (not e!759522))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333231 (= res!884743 (validKeyInArray!0 (select (arr!43656 _keys!1590) from!1980)))))

(declare-fun mapNonEmpty!56803 () Bool)

(declare-fun mapRes!56803 () Bool)

(declare-fun tp!108166 () Bool)

(assert (=> mapNonEmpty!56803 (= mapRes!56803 (and tp!108166 e!759526))))

(declare-fun mapRest!56803 () (Array (_ BitVec 32) ValueCell!17478))

(declare-fun mapValue!56803 () ValueCell!17478)

(declare-fun mapKey!56803 () (_ BitVec 32))

(assert (=> mapNonEmpty!56803 (= (arr!43657 _values!1320) (store mapRest!56803 mapKey!56803 mapValue!56803))))

(declare-fun b!1333232 () Bool)

(assert (=> b!1333232 (= e!759522 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54107)

(declare-fun zeroValue!1262 () V!54107)

(declare-fun lt!592108 () Bool)

(declare-datatypes ((tuple2!23782 0))(
  ( (tuple2!23783 (_1!11902 (_ BitVec 64)) (_2!11902 V!54107)) )
))
(declare-datatypes ((List!30926 0))(
  ( (Nil!30923) (Cons!30922 (h!32131 tuple2!23782) (t!45128 List!30926)) )
))
(declare-datatypes ((ListLongMap!21439 0))(
  ( (ListLongMap!21440 (toList!10735 List!30926)) )
))
(declare-fun contains!8899 (ListLongMap!21439 (_ BitVec 64)) Bool)

(declare-fun +!4709 (ListLongMap!21439 tuple2!23782) ListLongMap!21439)

(declare-fun getCurrentListMapNoExtraKeys!6347 (array!90380 array!90382 (_ BitVec 32) (_ BitVec 32) V!54107 V!54107 (_ BitVec 32) Int) ListLongMap!21439)

(declare-fun get!22019 (ValueCell!17478 V!54107) V!54107)

(declare-fun dynLambda!3648 (Int (_ BitVec 64)) V!54107)

(assert (=> b!1333232 (= lt!592108 (contains!8899 (+!4709 (getCurrentListMapNoExtraKeys!6347 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23783 (select (arr!43656 _keys!1590) from!1980) (get!22019 (select (arr!43657 _values!1320) from!1980) (dynLambda!3648 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1153))))

(declare-fun b!1333233 () Bool)

(declare-fun e!759524 () Bool)

(assert (=> b!1333233 (= e!759523 (and e!759524 mapRes!56803))))

(declare-fun condMapEmpty!56803 () Bool)

(declare-fun mapDefault!56803 () ValueCell!17478)

(assert (=> b!1333233 (= condMapEmpty!56803 (= (arr!43657 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17478)) mapDefault!56803)))))

(declare-fun b!1333234 () Bool)

(declare-fun res!884741 () Bool)

(assert (=> b!1333234 (=> (not res!884741) (not e!759522))))

(declare-fun getCurrentListMap!5716 (array!90380 array!90382 (_ BitVec 32) (_ BitVec 32) V!54107 V!54107 (_ BitVec 32) Int) ListLongMap!21439)

(assert (=> b!1333234 (= res!884741 (contains!8899 (getCurrentListMap!5716 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333235 () Bool)

(assert (=> b!1333235 (= e!759524 tp_is_empty!36753)))

(declare-fun b!1333236 () Bool)

(declare-fun res!884742 () Bool)

(assert (=> b!1333236 (=> (not res!884742) (not e!759522))))

(assert (=> b!1333236 (= res!884742 (and (= (size!44207 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44206 _keys!1590) (size!44207 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333237 () Bool)

(declare-fun res!884745 () Bool)

(assert (=> b!1333237 (=> (not res!884745) (not e!759522))))

(assert (=> b!1333237 (= res!884745 (not (= (select (arr!43656 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1333238 () Bool)

(declare-fun res!884747 () Bool)

(assert (=> b!1333238 (=> (not res!884747) (not e!759522))))

(declare-datatypes ((List!30927 0))(
  ( (Nil!30924) (Cons!30923 (h!32132 (_ BitVec 64)) (t!45129 List!30927)) )
))
(declare-fun arrayNoDuplicates!0 (array!90380 (_ BitVec 32) List!30927) Bool)

(assert (=> b!1333238 (= res!884747 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30924))))

(declare-fun mapIsEmpty!56803 () Bool)

(assert (=> mapIsEmpty!56803 mapRes!56803))

(declare-fun b!1333239 () Bool)

(declare-fun res!884744 () Bool)

(assert (=> b!1333239 (=> (not res!884744) (not e!759522))))

(assert (=> b!1333239 (= res!884744 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44206 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112448 res!884746) b!1333236))

(assert (= (and b!1333236 res!884742) b!1333228))

(assert (= (and b!1333228 res!884748) b!1333238))

(assert (= (and b!1333238 res!884747) b!1333239))

(assert (= (and b!1333239 res!884744) b!1333234))

(assert (= (and b!1333234 res!884741) b!1333237))

(assert (= (and b!1333237 res!884745) b!1333231))

(assert (= (and b!1333231 res!884743) b!1333229))

(assert (= (and b!1333229 res!884740) b!1333232))

(assert (= (and b!1333233 condMapEmpty!56803) mapIsEmpty!56803))

(assert (= (and b!1333233 (not condMapEmpty!56803)) mapNonEmpty!56803))

(get-info :version)

(assert (= (and mapNonEmpty!56803 ((_ is ValueCellFull!17478) mapValue!56803)) b!1333230))

(assert (= (and b!1333233 ((_ is ValueCellFull!17478) mapDefault!56803)) b!1333235))

(assert (= start!112448 b!1333233))

(declare-fun b_lambda!24049 () Bool)

(assert (=> (not b_lambda!24049) (not b!1333232)))

(declare-fun t!45127 () Bool)

(declare-fun tb!12005 () Bool)

(assert (=> (and start!112448 (= defaultEntry!1323 defaultEntry!1323) t!45127) tb!12005))

(declare-fun result!25081 () Bool)

(assert (=> tb!12005 (= result!25081 tp_is_empty!36753)))

(assert (=> b!1333232 t!45127))

(declare-fun b_and!49689 () Bool)

(assert (= b_and!49687 (and (=> t!45127 result!25081) b_and!49689)))

(declare-fun m!1221815 () Bool)

(assert (=> b!1333231 m!1221815))

(assert (=> b!1333231 m!1221815))

(declare-fun m!1221817 () Bool)

(assert (=> b!1333231 m!1221817))

(declare-fun m!1221819 () Bool)

(assert (=> b!1333228 m!1221819))

(declare-fun m!1221821 () Bool)

(assert (=> b!1333232 m!1221821))

(declare-fun m!1221823 () Bool)

(assert (=> b!1333232 m!1221823))

(declare-fun m!1221825 () Bool)

(assert (=> b!1333232 m!1221825))

(declare-fun m!1221827 () Bool)

(assert (=> b!1333232 m!1221827))

(assert (=> b!1333232 m!1221821))

(declare-fun m!1221829 () Bool)

(assert (=> b!1333232 m!1221829))

(assert (=> b!1333232 m!1221825))

(declare-fun m!1221831 () Bool)

(assert (=> b!1333232 m!1221831))

(assert (=> b!1333232 m!1221823))

(assert (=> b!1333232 m!1221827))

(assert (=> b!1333232 m!1221815))

(declare-fun m!1221833 () Bool)

(assert (=> b!1333238 m!1221833))

(declare-fun m!1221835 () Bool)

(assert (=> start!112448 m!1221835))

(declare-fun m!1221837 () Bool)

(assert (=> start!112448 m!1221837))

(declare-fun m!1221839 () Bool)

(assert (=> start!112448 m!1221839))

(declare-fun m!1221841 () Bool)

(assert (=> b!1333234 m!1221841))

(assert (=> b!1333234 m!1221841))

(declare-fun m!1221843 () Bool)

(assert (=> b!1333234 m!1221843))

(assert (=> b!1333237 m!1221815))

(declare-fun m!1221845 () Bool)

(assert (=> mapNonEmpty!56803 m!1221845))

(check-sat (not b!1333238) (not b!1333232) (not b_lambda!24049) (not b!1333234) (not mapNonEmpty!56803) tp_is_empty!36753 (not b!1333231) (not start!112448) (not b_next!30843) (not b!1333228) b_and!49689)
(check-sat b_and!49689 (not b_next!30843))
