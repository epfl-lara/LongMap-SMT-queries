; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112584 () Bool)

(assert start!112584)

(declare-fun b_free!30979 () Bool)

(declare-fun b_next!30979 () Bool)

(assert (=> start!112584 (= b_free!30979 (not b_next!30979))))

(declare-fun tp!108574 () Bool)

(declare-fun b_and!49869 () Bool)

(assert (=> start!112584 (= tp!108574 b_and!49869)))

(declare-fun res!886341 () Bool)

(declare-fun e!760593 () Bool)

(assert (=> start!112584 (=> (not res!886341) (not e!760593))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112584 (= res!886341 (validMask!0 mask!1998))))

(assert (=> start!112584 e!760593))

(declare-datatypes ((V!54289 0))(
  ( (V!54290 (val!18519 Int)) )
))
(declare-datatypes ((ValueCell!17546 0))(
  ( (ValueCellFull!17546 (v!21155 V!54289)) (EmptyCell!17546) )
))
(declare-datatypes ((array!90583 0))(
  ( (array!90584 (arr!43758 (Array (_ BitVec 32) ValueCell!17546)) (size!44310 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90583)

(declare-fun e!760591 () Bool)

(declare-fun array_inv!33195 (array!90583) Bool)

(assert (=> start!112584 (and (array_inv!33195 _values!1320) e!760591)))

(assert (=> start!112584 true))

(declare-datatypes ((array!90585 0))(
  ( (array!90586 (arr!43759 (Array (_ BitVec 32) (_ BitVec 64))) (size!44311 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90585)

(declare-fun array_inv!33196 (array!90585) Bool)

(assert (=> start!112584 (array_inv!33196 _keys!1590)))

(assert (=> start!112584 tp!108574))

(declare-fun tp_is_empty!36889 () Bool)

(assert (=> start!112584 tp_is_empty!36889))

(declare-fun b!1335463 () Bool)

(declare-fun res!886347 () Bool)

(assert (=> b!1335463 (=> (not res!886347) (not e!760593))))

(declare-datatypes ((List!31080 0))(
  ( (Nil!31077) (Cons!31076 (h!32285 (_ BitVec 64)) (t!45336 List!31080)) )
))
(declare-fun arrayNoDuplicates!0 (array!90585 (_ BitVec 32) List!31080) Bool)

(assert (=> b!1335463 (= res!886347 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31077))))

(declare-fun mapIsEmpty!57007 () Bool)

(declare-fun mapRes!57007 () Bool)

(assert (=> mapIsEmpty!57007 mapRes!57007))

(declare-fun b!1335464 () Bool)

(declare-fun res!886343 () Bool)

(assert (=> b!1335464 (=> (not res!886343) (not e!760593))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1335464 (= res!886343 (not (= (select (arr!43759 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335465 () Bool)

(declare-fun res!886348 () Bool)

(assert (=> b!1335465 (=> (not res!886348) (not e!760593))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54289)

(declare-fun zeroValue!1262 () V!54289)

(declare-datatypes ((tuple2!23946 0))(
  ( (tuple2!23947 (_1!11984 (_ BitVec 64)) (_2!11984 V!54289)) )
))
(declare-datatypes ((List!31081 0))(
  ( (Nil!31078) (Cons!31077 (h!32286 tuple2!23946) (t!45337 List!31081)) )
))
(declare-datatypes ((ListLongMap!21603 0))(
  ( (ListLongMap!21604 (toList!10817 List!31081)) )
))
(declare-fun contains!8909 (ListLongMap!21603 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5671 (array!90585 array!90583 (_ BitVec 32) (_ BitVec 32) V!54289 V!54289 (_ BitVec 32) Int) ListLongMap!21603)

(assert (=> b!1335465 (= res!886348 (contains!8909 (getCurrentListMap!5671 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335466 () Bool)

(assert (=> b!1335466 (= e!760593 (bvsge from!1980 (size!44310 _values!1320)))))

(declare-fun lt!592279 () ListLongMap!21603)

(declare-fun getCurrentListMapNoExtraKeys!6394 (array!90585 array!90583 (_ BitVec 32) (_ BitVec 32) V!54289 V!54289 (_ BitVec 32) Int) ListLongMap!21603)

(assert (=> b!1335466 (= lt!592279 (getCurrentListMapNoExtraKeys!6394 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1335467 () Bool)

(declare-fun res!886342 () Bool)

(assert (=> b!1335467 (=> (not res!886342) (not e!760593))))

(assert (=> b!1335467 (= res!886342 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1335468 () Bool)

(declare-fun e!760592 () Bool)

(assert (=> b!1335468 (= e!760591 (and e!760592 mapRes!57007))))

(declare-fun condMapEmpty!57007 () Bool)

(declare-fun mapDefault!57007 () ValueCell!17546)

(assert (=> b!1335468 (= condMapEmpty!57007 (= (arr!43758 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17546)) mapDefault!57007)))))

(declare-fun b!1335469 () Bool)

(declare-fun res!886346 () Bool)

(assert (=> b!1335469 (=> (not res!886346) (not e!760593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90585 (_ BitVec 32)) Bool)

(assert (=> b!1335469 (= res!886346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1335470 () Bool)

(assert (=> b!1335470 (= e!760592 tp_is_empty!36889)))

(declare-fun b!1335471 () Bool)

(declare-fun res!886345 () Bool)

(assert (=> b!1335471 (=> (not res!886345) (not e!760593))))

(assert (=> b!1335471 (= res!886345 (and (= (size!44310 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44311 _keys!1590) (size!44310 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335472 () Bool)

(declare-fun e!760590 () Bool)

(assert (=> b!1335472 (= e!760590 tp_is_empty!36889)))

(declare-fun mapNonEmpty!57007 () Bool)

(declare-fun tp!108575 () Bool)

(assert (=> mapNonEmpty!57007 (= mapRes!57007 (and tp!108575 e!760590))))

(declare-fun mapRest!57007 () (Array (_ BitVec 32) ValueCell!17546))

(declare-fun mapKey!57007 () (_ BitVec 32))

(declare-fun mapValue!57007 () ValueCell!17546)

(assert (=> mapNonEmpty!57007 (= (arr!43758 _values!1320) (store mapRest!57007 mapKey!57007 mapValue!57007))))

(declare-fun b!1335473 () Bool)

(declare-fun res!886344 () Bool)

(assert (=> b!1335473 (=> (not res!886344) (not e!760593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335473 (= res!886344 (validKeyInArray!0 (select (arr!43759 _keys!1590) from!1980)))))

(declare-fun b!1335474 () Bool)

(declare-fun res!886340 () Bool)

(assert (=> b!1335474 (=> (not res!886340) (not e!760593))))

(assert (=> b!1335474 (= res!886340 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44311 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112584 res!886341) b!1335471))

(assert (= (and b!1335471 res!886345) b!1335469))

(assert (= (and b!1335469 res!886346) b!1335463))

(assert (= (and b!1335463 res!886347) b!1335474))

(assert (= (and b!1335474 res!886340) b!1335465))

(assert (= (and b!1335465 res!886348) b!1335464))

(assert (= (and b!1335464 res!886343) b!1335473))

(assert (= (and b!1335473 res!886344) b!1335467))

(assert (= (and b!1335467 res!886342) b!1335466))

(assert (= (and b!1335468 condMapEmpty!57007) mapIsEmpty!57007))

(assert (= (and b!1335468 (not condMapEmpty!57007)) mapNonEmpty!57007))

(get-info :version)

(assert (= (and mapNonEmpty!57007 ((_ is ValueCellFull!17546) mapValue!57007)) b!1335472))

(assert (= (and b!1335468 ((_ is ValueCellFull!17546) mapDefault!57007)) b!1335470))

(assert (= start!112584 b!1335468))

(declare-fun m!1223037 () Bool)

(assert (=> start!112584 m!1223037))

(declare-fun m!1223039 () Bool)

(assert (=> start!112584 m!1223039))

(declare-fun m!1223041 () Bool)

(assert (=> start!112584 m!1223041))

(declare-fun m!1223043 () Bool)

(assert (=> b!1335465 m!1223043))

(assert (=> b!1335465 m!1223043))

(declare-fun m!1223045 () Bool)

(assert (=> b!1335465 m!1223045))

(declare-fun m!1223047 () Bool)

(assert (=> b!1335466 m!1223047))

(declare-fun m!1223049 () Bool)

(assert (=> b!1335463 m!1223049))

(declare-fun m!1223051 () Bool)

(assert (=> b!1335473 m!1223051))

(assert (=> b!1335473 m!1223051))

(declare-fun m!1223053 () Bool)

(assert (=> b!1335473 m!1223053))

(declare-fun m!1223055 () Bool)

(assert (=> b!1335469 m!1223055))

(assert (=> b!1335464 m!1223051))

(declare-fun m!1223057 () Bool)

(assert (=> mapNonEmpty!57007 m!1223057))

(check-sat (not b_next!30979) (not b!1335463) (not b!1335466) (not mapNonEmpty!57007) (not start!112584) (not b!1335465) (not b!1335473) tp_is_empty!36889 b_and!49869 (not b!1335469))
(check-sat b_and!49869 (not b_next!30979))
