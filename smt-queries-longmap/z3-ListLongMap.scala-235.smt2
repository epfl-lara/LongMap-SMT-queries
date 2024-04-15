; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4082 () Bool)

(assert start!4082)

(declare-fun b_free!997 () Bool)

(declare-fun b_next!997 () Bool)

(assert (=> start!4082 (= b_free!997 (not b_next!997))))

(declare-fun tp!4410 () Bool)

(declare-fun b_and!1801 () Bool)

(assert (=> start!4082 (= tp!4410 b_and!1801)))

(declare-fun b!30291 () Bool)

(declare-fun e!19443 () Bool)

(declare-fun tp_is_empty!1351 () Bool)

(assert (=> b!30291 (= e!19443 tp_is_empty!1351)))

(declare-fun b!30292 () Bool)

(declare-fun e!19446 () Bool)

(declare-fun mapRes!1555 () Bool)

(assert (=> b!30292 (= e!19446 (and e!19443 mapRes!1555))))

(declare-fun condMapEmpty!1555 () Bool)

(declare-datatypes ((V!1627 0))(
  ( (V!1628 (val!702 Int)) )
))
(declare-datatypes ((ValueCell!476 0))(
  ( (ValueCellFull!476 (v!1790 V!1627)) (EmptyCell!476) )
))
(declare-datatypes ((array!1903 0))(
  ( (array!1904 (arr!905 (Array (_ BitVec 32) ValueCell!476)) (size!1006 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1903)

(declare-fun mapDefault!1555 () ValueCell!476)

(assert (=> b!30292 (= condMapEmpty!1555 (= (arr!905 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!476)) mapDefault!1555)))))

(declare-fun b!30293 () Bool)

(declare-fun res!18247 () Bool)

(declare-fun e!19445 () Bool)

(assert (=> b!30293 (=> (not res!18247) (not e!19445))))

(declare-datatypes ((array!1905 0))(
  ( (array!1906 (arr!906 (Array (_ BitVec 32) (_ BitVec 64))) (size!1007 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1905)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!1905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30293 (= res!18247 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30294 () Bool)

(declare-fun res!18245 () Bool)

(assert (=> b!30294 (=> (not res!18245) (not e!19445))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1627)

(declare-fun minValue!1443 () V!1627)

(declare-datatypes ((tuple2!1166 0))(
  ( (tuple2!1167 (_1!594 (_ BitVec 64)) (_2!594 V!1627)) )
))
(declare-datatypes ((List!749 0))(
  ( (Nil!746) (Cons!745 (h!1312 tuple2!1166) (t!3435 List!749)) )
))
(declare-datatypes ((ListLongMap!731 0))(
  ( (ListLongMap!732 (toList!381 List!749)) )
))
(declare-fun contains!322 (ListLongMap!731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!205 (array!1905 array!1903 (_ BitVec 32) (_ BitVec 32) V!1627 V!1627 (_ BitVec 32) Int) ListLongMap!731)

(assert (=> b!30294 (= res!18245 (not (contains!322 (getCurrentListMap!205 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1555 () Bool)

(declare-fun tp!4411 () Bool)

(declare-fun e!19444 () Bool)

(assert (=> mapNonEmpty!1555 (= mapRes!1555 (and tp!4411 e!19444))))

(declare-fun mapKey!1555 () (_ BitVec 32))

(declare-fun mapValue!1555 () ValueCell!476)

(declare-fun mapRest!1555 () (Array (_ BitVec 32) ValueCell!476))

(assert (=> mapNonEmpty!1555 (= (arr!905 _values!1501) (store mapRest!1555 mapKey!1555 mapValue!1555))))

(declare-fun b!30295 () Bool)

(declare-fun res!18246 () Bool)

(assert (=> b!30295 (=> (not res!18246) (not e!19445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30295 (= res!18246 (validKeyInArray!0 k0!1304))))

(declare-fun b!30296 () Bool)

(assert (=> b!30296 (= e!19445 false)))

(declare-datatypes ((SeekEntryResult!106 0))(
  ( (MissingZero!106 (index!2546 (_ BitVec 32))) (Found!106 (index!2547 (_ BitVec 32))) (Intermediate!106 (undefined!918 Bool) (index!2548 (_ BitVec 32)) (x!6528 (_ BitVec 32))) (Undefined!106) (MissingVacant!106 (index!2549 (_ BitVec 32))) )
))
(declare-fun lt!11407 () SeekEntryResult!106)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1905 (_ BitVec 32)) SeekEntryResult!106)

(assert (=> b!30296 (= lt!11407 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30297 () Bool)

(assert (=> b!30297 (= e!19444 tp_is_empty!1351)))

(declare-fun res!18248 () Bool)

(assert (=> start!4082 (=> (not res!18248) (not e!19445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4082 (= res!18248 (validMask!0 mask!2294))))

(assert (=> start!4082 e!19445))

(assert (=> start!4082 true))

(assert (=> start!4082 tp!4410))

(declare-fun array_inv!633 (array!1903) Bool)

(assert (=> start!4082 (and (array_inv!633 _values!1501) e!19446)))

(declare-fun array_inv!634 (array!1905) Bool)

(assert (=> start!4082 (array_inv!634 _keys!1833)))

(assert (=> start!4082 tp_is_empty!1351))

(declare-fun b!30298 () Bool)

(declare-fun res!18250 () Bool)

(assert (=> b!30298 (=> (not res!18250) (not e!19445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1905 (_ BitVec 32)) Bool)

(assert (=> b!30298 (= res!18250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1555 () Bool)

(assert (=> mapIsEmpty!1555 mapRes!1555))

(declare-fun b!30299 () Bool)

(declare-fun res!18244 () Bool)

(assert (=> b!30299 (=> (not res!18244) (not e!19445))))

(declare-datatypes ((List!750 0))(
  ( (Nil!747) (Cons!746 (h!1313 (_ BitVec 64)) (t!3436 List!750)) )
))
(declare-fun arrayNoDuplicates!0 (array!1905 (_ BitVec 32) List!750) Bool)

(assert (=> b!30299 (= res!18244 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!747))))

(declare-fun b!30300 () Bool)

(declare-fun res!18249 () Bool)

(assert (=> b!30300 (=> (not res!18249) (not e!19445))))

(assert (=> b!30300 (= res!18249 (and (= (size!1006 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1007 _keys!1833) (size!1006 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4082 res!18248) b!30300))

(assert (= (and b!30300 res!18249) b!30298))

(assert (= (and b!30298 res!18250) b!30299))

(assert (= (and b!30299 res!18244) b!30295))

(assert (= (and b!30295 res!18246) b!30294))

(assert (= (and b!30294 res!18245) b!30293))

(assert (= (and b!30293 res!18247) b!30296))

(assert (= (and b!30292 condMapEmpty!1555) mapIsEmpty!1555))

(assert (= (and b!30292 (not condMapEmpty!1555)) mapNonEmpty!1555))

(get-info :version)

(assert (= (and mapNonEmpty!1555 ((_ is ValueCellFull!476) mapValue!1555)) b!30297))

(assert (= (and b!30292 ((_ is ValueCellFull!476) mapDefault!1555)) b!30291))

(assert (= start!4082 b!30292))

(declare-fun m!24315 () Bool)

(assert (=> b!30293 m!24315))

(declare-fun m!24317 () Bool)

(assert (=> mapNonEmpty!1555 m!24317))

(declare-fun m!24319 () Bool)

(assert (=> b!30296 m!24319))

(declare-fun m!24321 () Bool)

(assert (=> b!30299 m!24321))

(declare-fun m!24323 () Bool)

(assert (=> start!4082 m!24323))

(declare-fun m!24325 () Bool)

(assert (=> start!4082 m!24325))

(declare-fun m!24327 () Bool)

(assert (=> start!4082 m!24327))

(declare-fun m!24329 () Bool)

(assert (=> b!30295 m!24329))

(declare-fun m!24331 () Bool)

(assert (=> b!30294 m!24331))

(assert (=> b!30294 m!24331))

(declare-fun m!24333 () Bool)

(assert (=> b!30294 m!24333))

(declare-fun m!24335 () Bool)

(assert (=> b!30298 m!24335))

(check-sat (not b!30295) b_and!1801 (not mapNonEmpty!1555) (not b!30296) (not b!30294) (not b_next!997) tp_is_empty!1351 (not b!30293) (not b!30298) (not b!30299) (not start!4082))
(check-sat b_and!1801 (not b_next!997))
