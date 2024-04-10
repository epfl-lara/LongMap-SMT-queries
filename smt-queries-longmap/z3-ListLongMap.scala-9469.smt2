; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112424 () Bool)

(assert start!112424)

(declare-fun b_free!30819 () Bool)

(declare-fun b_next!30819 () Bool)

(assert (=> start!112424 (= b_free!30819 (not b_next!30819))))

(declare-fun tp!108093 () Bool)

(declare-fun b_and!49661 () Bool)

(assert (=> start!112424 (= tp!108093 b_and!49661)))

(declare-fun b!1332891 () Bool)

(declare-fun e!759345 () Bool)

(assert (=> b!1332891 (= e!759345 false)))

(declare-datatypes ((V!54075 0))(
  ( (V!54076 (val!18439 Int)) )
))
(declare-datatypes ((ValueCell!17466 0))(
  ( (ValueCellFull!17466 (v!21076 V!54075)) (EmptyCell!17466) )
))
(declare-datatypes ((array!90334 0))(
  ( (array!90335 (arr!43633 (Array (_ BitVec 32) ValueCell!17466)) (size!44183 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90334)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90336 0))(
  ( (array!90337 (arr!43634 (Array (_ BitVec 32) (_ BitVec 64))) (size!44184 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90336)

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun lt!592081 () Bool)

(declare-fun minValue!1262 () V!54075)

(declare-fun zeroValue!1262 () V!54075)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23764 0))(
  ( (tuple2!23765 (_1!11893 (_ BitVec 64)) (_2!11893 V!54075)) )
))
(declare-datatypes ((List!30909 0))(
  ( (Nil!30906) (Cons!30905 (h!32114 tuple2!23764) (t!45107 List!30909)) )
))
(declare-datatypes ((ListLongMap!21421 0))(
  ( (ListLongMap!21422 (toList!10726 List!30909)) )
))
(declare-fun contains!8890 (ListLongMap!21421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5707 (array!90336 array!90334 (_ BitVec 32) (_ BitVec 32) V!54075 V!54075 (_ BitVec 32) Int) ListLongMap!21421)

(assert (=> b!1332891 (= lt!592081 (contains!8890 (getCurrentListMap!5707 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332892 () Bool)

(declare-fun res!884517 () Bool)

(assert (=> b!1332892 (=> (not res!884517) (not e!759345))))

(declare-datatypes ((List!30910 0))(
  ( (Nil!30907) (Cons!30906 (h!32115 (_ BitVec 64)) (t!45108 List!30910)) )
))
(declare-fun arrayNoDuplicates!0 (array!90336 (_ BitVec 32) List!30910) Bool)

(assert (=> b!1332892 (= res!884517 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30907))))

(declare-fun mapIsEmpty!56767 () Bool)

(declare-fun mapRes!56767 () Bool)

(assert (=> mapIsEmpty!56767 mapRes!56767))

(declare-fun b!1332893 () Bool)

(declare-fun res!884515 () Bool)

(assert (=> b!1332893 (=> (not res!884515) (not e!759345))))

(assert (=> b!1332893 (= res!884515 (and (= (size!44183 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44184 _keys!1590) (size!44183 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332894 () Bool)

(declare-fun e!759346 () Bool)

(declare-fun tp_is_empty!36729 () Bool)

(assert (=> b!1332894 (= e!759346 tp_is_empty!36729)))

(declare-fun b!1332895 () Bool)

(declare-fun e!759344 () Bool)

(assert (=> b!1332895 (= e!759344 (and e!759346 mapRes!56767))))

(declare-fun condMapEmpty!56767 () Bool)

(declare-fun mapDefault!56767 () ValueCell!17466)

(assert (=> b!1332895 (= condMapEmpty!56767 (= (arr!43633 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17466)) mapDefault!56767)))))

(declare-fun res!884516 () Bool)

(assert (=> start!112424 (=> (not res!884516) (not e!759345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112424 (= res!884516 (validMask!0 mask!1998))))

(assert (=> start!112424 e!759345))

(declare-fun array_inv!32911 (array!90334) Bool)

(assert (=> start!112424 (and (array_inv!32911 _values!1320) e!759344)))

(assert (=> start!112424 true))

(declare-fun array_inv!32912 (array!90336) Bool)

(assert (=> start!112424 (array_inv!32912 _keys!1590)))

(assert (=> start!112424 tp!108093))

(assert (=> start!112424 tp_is_empty!36729))

(declare-fun b!1332896 () Bool)

(declare-fun res!884514 () Bool)

(assert (=> b!1332896 (=> (not res!884514) (not e!759345))))

(assert (=> b!1332896 (= res!884514 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44184 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56767 () Bool)

(declare-fun tp!108094 () Bool)

(declare-fun e!759343 () Bool)

(assert (=> mapNonEmpty!56767 (= mapRes!56767 (and tp!108094 e!759343))))

(declare-fun mapRest!56767 () (Array (_ BitVec 32) ValueCell!17466))

(declare-fun mapValue!56767 () ValueCell!17466)

(declare-fun mapKey!56767 () (_ BitVec 32))

(assert (=> mapNonEmpty!56767 (= (arr!43633 _values!1320) (store mapRest!56767 mapKey!56767 mapValue!56767))))

(declare-fun b!1332897 () Bool)

(assert (=> b!1332897 (= e!759343 tp_is_empty!36729)))

(declare-fun b!1332898 () Bool)

(declare-fun res!884513 () Bool)

(assert (=> b!1332898 (=> (not res!884513) (not e!759345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90336 (_ BitVec 32)) Bool)

(assert (=> b!1332898 (= res!884513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112424 res!884516) b!1332893))

(assert (= (and b!1332893 res!884515) b!1332898))

(assert (= (and b!1332898 res!884513) b!1332892))

(assert (= (and b!1332892 res!884517) b!1332896))

(assert (= (and b!1332896 res!884514) b!1332891))

(assert (= (and b!1332895 condMapEmpty!56767) mapIsEmpty!56767))

(assert (= (and b!1332895 (not condMapEmpty!56767)) mapNonEmpty!56767))

(get-info :version)

(assert (= (and mapNonEmpty!56767 ((_ is ValueCellFull!17466) mapValue!56767)) b!1332897))

(assert (= (and b!1332895 ((_ is ValueCellFull!17466) mapDefault!56767)) b!1332894))

(assert (= start!112424 b!1332895))

(declare-fun m!1221595 () Bool)

(assert (=> b!1332898 m!1221595))

(declare-fun m!1221597 () Bool)

(assert (=> b!1332892 m!1221597))

(declare-fun m!1221599 () Bool)

(assert (=> b!1332891 m!1221599))

(assert (=> b!1332891 m!1221599))

(declare-fun m!1221601 () Bool)

(assert (=> b!1332891 m!1221601))

(declare-fun m!1221603 () Bool)

(assert (=> mapNonEmpty!56767 m!1221603))

(declare-fun m!1221605 () Bool)

(assert (=> start!112424 m!1221605))

(declare-fun m!1221607 () Bool)

(assert (=> start!112424 m!1221607))

(declare-fun m!1221609 () Bool)

(assert (=> start!112424 m!1221609))

(check-sat b_and!49661 (not mapNonEmpty!56767) (not b_next!30819) (not b!1332898) tp_is_empty!36729 (not start!112424) (not b!1332891) (not b!1332892))
(check-sat b_and!49661 (not b_next!30819))
