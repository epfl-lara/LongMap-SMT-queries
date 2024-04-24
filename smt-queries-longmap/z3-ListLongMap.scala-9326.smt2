; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111616 () Bool)

(assert start!111616)

(declare-fun b_free!30049 () Bool)

(declare-fun b_next!30049 () Bool)

(assert (=> start!111616 (= b_free!30049 (not b_next!30049))))

(declare-fun tp!105622 () Bool)

(declare-fun b_and!48271 () Bool)

(assert (=> start!111616 (= tp!105622 b_and!48271)))

(declare-fun b!1319407 () Bool)

(declare-fun res!875308 () Bool)

(declare-fun e!753050 () Bool)

(assert (=> b!1319407 (=> (not res!875308) (not e!753050))))

(declare-datatypes ((array!88757 0))(
  ( (array!88758 (arr!42848 (Array (_ BitVec 32) (_ BitVec 64))) (size!43399 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88757)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88757 (_ BitVec 32)) Bool)

(assert (=> b!1319407 (= res!875308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319408 () Bool)

(declare-fun res!875305 () Bool)

(assert (=> b!1319408 (=> (not res!875305) (not e!753050))))

(declare-datatypes ((List!30369 0))(
  ( (Nil!30366) (Cons!30365 (h!31583 (_ BitVec 64)) (t!43969 List!30369)) )
))
(declare-fun arrayNoDuplicates!0 (array!88757 (_ BitVec 32) List!30369) Bool)

(assert (=> b!1319408 (= res!875305 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30366))))

(declare-fun b!1319409 () Bool)

(declare-fun e!753048 () Bool)

(declare-fun tp_is_empty!35869 () Bool)

(assert (=> b!1319409 (= e!753048 tp_is_empty!35869)))

(declare-fun b!1319410 () Bool)

(declare-fun e!753051 () Bool)

(declare-fun mapRes!55451 () Bool)

(assert (=> b!1319410 (= e!753051 (and e!753048 mapRes!55451))))

(declare-fun condMapEmpty!55451 () Bool)

(declare-datatypes ((V!52929 0))(
  ( (V!52930 (val!18009 Int)) )
))
(declare-datatypes ((ValueCell!17036 0))(
  ( (ValueCellFull!17036 (v!20634 V!52929)) (EmptyCell!17036) )
))
(declare-datatypes ((array!88759 0))(
  ( (array!88760 (arr!42849 (Array (_ BitVec 32) ValueCell!17036)) (size!43400 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88759)

(declare-fun mapDefault!55451 () ValueCell!17036)

(assert (=> b!1319410 (= condMapEmpty!55451 (= (arr!42849 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17036)) mapDefault!55451)))))

(declare-fun b!1319411 () Bool)

(assert (=> b!1319411 (= e!753050 false)))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun minValue!1279 () V!52929)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun lt!586925 () Bool)

(declare-fun defaultEntry!1340 () Int)

(declare-fun zeroValue!1279 () V!52929)

(declare-datatypes ((tuple2!23204 0))(
  ( (tuple2!23205 (_1!11613 (_ BitVec 64)) (_2!11613 V!52929)) )
))
(declare-datatypes ((List!30370 0))(
  ( (Nil!30367) (Cons!30366 (h!31584 tuple2!23204) (t!43970 List!30370)) )
))
(declare-datatypes ((ListLongMap!20869 0))(
  ( (ListLongMap!20870 (toList!10450 List!30370)) )
))
(declare-fun contains!8617 (ListLongMap!20869 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5454 (array!88757 array!88759 (_ BitVec 32) (_ BitVec 32) V!52929 V!52929 (_ BitVec 32) Int) ListLongMap!20869)

(assert (=> b!1319411 (= lt!586925 (contains!8617 (getCurrentListMap!5454 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319412 () Bool)

(declare-fun res!875307 () Bool)

(assert (=> b!1319412 (=> (not res!875307) (not e!753050))))

(assert (=> b!1319412 (= res!875307 (and (= (size!43400 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43399 _keys!1609) (size!43400 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun res!875304 () Bool)

(assert (=> start!111616 (=> (not res!875304) (not e!753050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111616 (= res!875304 (validMask!0 mask!2019))))

(assert (=> start!111616 e!753050))

(declare-fun array_inv!32627 (array!88757) Bool)

(assert (=> start!111616 (array_inv!32627 _keys!1609)))

(assert (=> start!111616 true))

(assert (=> start!111616 tp_is_empty!35869))

(declare-fun array_inv!32628 (array!88759) Bool)

(assert (=> start!111616 (and (array_inv!32628 _values!1337) e!753051)))

(assert (=> start!111616 tp!105622))

(declare-fun mapIsEmpty!55451 () Bool)

(assert (=> mapIsEmpty!55451 mapRes!55451))

(declare-fun mapNonEmpty!55451 () Bool)

(declare-fun tp!105623 () Bool)

(declare-fun e!753049 () Bool)

(assert (=> mapNonEmpty!55451 (= mapRes!55451 (and tp!105623 e!753049))))

(declare-fun mapValue!55451 () ValueCell!17036)

(declare-fun mapRest!55451 () (Array (_ BitVec 32) ValueCell!17036))

(declare-fun mapKey!55451 () (_ BitVec 32))

(assert (=> mapNonEmpty!55451 (= (arr!42849 _values!1337) (store mapRest!55451 mapKey!55451 mapValue!55451))))

(declare-fun b!1319413 () Bool)

(assert (=> b!1319413 (= e!753049 tp_is_empty!35869)))

(declare-fun b!1319414 () Bool)

(declare-fun res!875306 () Bool)

(assert (=> b!1319414 (=> (not res!875306) (not e!753050))))

(assert (=> b!1319414 (= res!875306 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43399 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111616 res!875304) b!1319412))

(assert (= (and b!1319412 res!875307) b!1319407))

(assert (= (and b!1319407 res!875308) b!1319408))

(assert (= (and b!1319408 res!875305) b!1319414))

(assert (= (and b!1319414 res!875306) b!1319411))

(assert (= (and b!1319410 condMapEmpty!55451) mapIsEmpty!55451))

(assert (= (and b!1319410 (not condMapEmpty!55451)) mapNonEmpty!55451))

(get-info :version)

(assert (= (and mapNonEmpty!55451 ((_ is ValueCellFull!17036) mapValue!55451)) b!1319413))

(assert (= (and b!1319410 ((_ is ValueCellFull!17036) mapDefault!55451)) b!1319409))

(assert (= start!111616 b!1319410))

(declare-fun m!1207337 () Bool)

(assert (=> b!1319408 m!1207337))

(declare-fun m!1207339 () Bool)

(assert (=> b!1319407 m!1207339))

(declare-fun m!1207341 () Bool)

(assert (=> b!1319411 m!1207341))

(assert (=> b!1319411 m!1207341))

(declare-fun m!1207343 () Bool)

(assert (=> b!1319411 m!1207343))

(declare-fun m!1207345 () Bool)

(assert (=> mapNonEmpty!55451 m!1207345))

(declare-fun m!1207347 () Bool)

(assert (=> start!111616 m!1207347))

(declare-fun m!1207349 () Bool)

(assert (=> start!111616 m!1207349))

(declare-fun m!1207351 () Bool)

(assert (=> start!111616 m!1207351))

(check-sat tp_is_empty!35869 (not b!1319411) (not start!111616) (not b!1319408) b_and!48271 (not mapNonEmpty!55451) (not b_next!30049) (not b!1319407))
(check-sat b_and!48271 (not b_next!30049))
