; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112568 () Bool)

(assert start!112568)

(declare-fun b_free!30963 () Bool)

(declare-fun b_next!30963 () Bool)

(assert (=> start!112568 (= b_free!30963 (not b_next!30963))))

(declare-fun tp!108526 () Bool)

(declare-fun b_and!49871 () Bool)

(assert (=> start!112568 (= tp!108526 b_and!49871)))

(declare-fun mapIsEmpty!56983 () Bool)

(declare-fun mapRes!56983 () Bool)

(assert (=> mapIsEmpty!56983 mapRes!56983))

(declare-fun res!886206 () Bool)

(declare-fun e!760506 () Bool)

(assert (=> start!112568 (=> (not res!886206) (not e!760506))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112568 (= res!886206 (validMask!0 mask!1998))))

(assert (=> start!112568 e!760506))

(declare-datatypes ((V!54267 0))(
  ( (V!54268 (val!18511 Int)) )
))
(declare-datatypes ((ValueCell!17538 0))(
  ( (ValueCellFull!17538 (v!21148 V!54267)) (EmptyCell!17538) )
))
(declare-datatypes ((array!90606 0))(
  ( (array!90607 (arr!43769 (Array (_ BitVec 32) ValueCell!17538)) (size!44319 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90606)

(declare-fun e!760507 () Bool)

(declare-fun array_inv!33007 (array!90606) Bool)

(assert (=> start!112568 (and (array_inv!33007 _values!1320) e!760507)))

(assert (=> start!112568 true))

(declare-datatypes ((array!90608 0))(
  ( (array!90609 (arr!43770 (Array (_ BitVec 32) (_ BitVec 64))) (size!44320 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90608)

(declare-fun array_inv!33008 (array!90608) Bool)

(assert (=> start!112568 (array_inv!33008 _keys!1590)))

(assert (=> start!112568 tp!108526))

(declare-fun tp_is_empty!36873 () Bool)

(assert (=> start!112568 tp_is_empty!36873))

(declare-fun b!1335297 () Bool)

(declare-fun res!886205 () Bool)

(assert (=> b!1335297 (=> (not res!886205) (not e!760506))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335297 (= res!886205 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44320 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335298 () Bool)

(declare-fun e!760504 () Bool)

(assert (=> b!1335298 (= e!760507 (and e!760504 mapRes!56983))))

(declare-fun condMapEmpty!56983 () Bool)

(declare-fun mapDefault!56983 () ValueCell!17538)

(assert (=> b!1335298 (= condMapEmpty!56983 (= (arr!43769 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17538)) mapDefault!56983)))))

(declare-fun b!1335299 () Bool)

(assert (=> b!1335299 (= e!760506 false)))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54267)

(declare-fun zeroValue!1262 () V!54267)

(declare-fun lt!592441 () Bool)

(declare-datatypes ((tuple2!23870 0))(
  ( (tuple2!23871 (_1!11946 (_ BitVec 64)) (_2!11946 V!54267)) )
))
(declare-datatypes ((List!31011 0))(
  ( (Nil!31008) (Cons!31007 (h!32216 tuple2!23870) (t!45275 List!31011)) )
))
(declare-datatypes ((ListLongMap!21527 0))(
  ( (ListLongMap!21528 (toList!10779 List!31011)) )
))
(declare-fun contains!8943 (ListLongMap!21527 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5753 (array!90608 array!90606 (_ BitVec 32) (_ BitVec 32) V!54267 V!54267 (_ BitVec 32) Int) ListLongMap!21527)

(assert (=> b!1335299 (= lt!592441 (contains!8943 (getCurrentListMap!5753 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335300 () Bool)

(assert (=> b!1335300 (= e!760504 tp_is_empty!36873)))

(declare-fun b!1335301 () Bool)

(declare-fun res!886208 () Bool)

(assert (=> b!1335301 (=> (not res!886208) (not e!760506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90608 (_ BitVec 32)) Bool)

(assert (=> b!1335301 (= res!886208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335302 () Bool)

(declare-fun e!760505 () Bool)

(assert (=> b!1335302 (= e!760505 tp_is_empty!36873)))

(declare-fun b!1335303 () Bool)

(declare-fun res!886209 () Bool)

(assert (=> b!1335303 (=> (not res!886209) (not e!760506))))

(declare-datatypes ((List!31012 0))(
  ( (Nil!31009) (Cons!31008 (h!32217 (_ BitVec 64)) (t!45276 List!31012)) )
))
(declare-fun arrayNoDuplicates!0 (array!90608 (_ BitVec 32) List!31012) Bool)

(assert (=> b!1335303 (= res!886209 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31009))))

(declare-fun mapNonEmpty!56983 () Bool)

(declare-fun tp!108525 () Bool)

(assert (=> mapNonEmpty!56983 (= mapRes!56983 (and tp!108525 e!760505))))

(declare-fun mapValue!56983 () ValueCell!17538)

(declare-fun mapKey!56983 () (_ BitVec 32))

(declare-fun mapRest!56983 () (Array (_ BitVec 32) ValueCell!17538))

(assert (=> mapNonEmpty!56983 (= (arr!43769 _values!1320) (store mapRest!56983 mapKey!56983 mapValue!56983))))

(declare-fun b!1335304 () Bool)

(declare-fun res!886207 () Bool)

(assert (=> b!1335304 (=> (not res!886207) (not e!760506))))

(assert (=> b!1335304 (= res!886207 (and (= (size!44319 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44320 _keys!1590) (size!44319 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112568 res!886206) b!1335304))

(assert (= (and b!1335304 res!886207) b!1335301))

(assert (= (and b!1335301 res!886208) b!1335303))

(assert (= (and b!1335303 res!886209) b!1335297))

(assert (= (and b!1335297 res!886205) b!1335299))

(assert (= (and b!1335298 condMapEmpty!56983) mapIsEmpty!56983))

(assert (= (and b!1335298 (not condMapEmpty!56983)) mapNonEmpty!56983))

(get-info :version)

(assert (= (and mapNonEmpty!56983 ((_ is ValueCellFull!17538) mapValue!56983)) b!1335302))

(assert (= (and b!1335298 ((_ is ValueCellFull!17538) mapDefault!56983)) b!1335300))

(assert (= start!112568 b!1335298))

(declare-fun m!1223407 () Bool)

(assert (=> start!112568 m!1223407))

(declare-fun m!1223409 () Bool)

(assert (=> start!112568 m!1223409))

(declare-fun m!1223411 () Bool)

(assert (=> start!112568 m!1223411))

(declare-fun m!1223413 () Bool)

(assert (=> mapNonEmpty!56983 m!1223413))

(declare-fun m!1223415 () Bool)

(assert (=> b!1335301 m!1223415))

(declare-fun m!1223417 () Bool)

(assert (=> b!1335303 m!1223417))

(declare-fun m!1223419 () Bool)

(assert (=> b!1335299 m!1223419))

(assert (=> b!1335299 m!1223419))

(declare-fun m!1223421 () Bool)

(assert (=> b!1335299 m!1223421))

(check-sat (not b_next!30963) b_and!49871 (not mapNonEmpty!56983) tp_is_empty!36873 (not b!1335301) (not b!1335303) (not b!1335299) (not start!112568))
(check-sat b_and!49871 (not b_next!30963))
