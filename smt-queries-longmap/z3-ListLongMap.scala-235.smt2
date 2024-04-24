; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4088 () Bool)

(assert start!4088)

(declare-fun b_free!997 () Bool)

(declare-fun b_next!997 () Bool)

(assert (=> start!4088 (= b_free!997 (not b_next!997))))

(declare-fun tp!4410 () Bool)

(declare-fun b_and!1797 () Bool)

(assert (=> start!4088 (= tp!4410 b_and!1797)))

(declare-fun b!30273 () Bool)

(declare-fun res!18238 () Bool)

(declare-fun e!19436 () Bool)

(assert (=> b!30273 (=> (not res!18238) (not e!19436))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1627 0))(
  ( (V!1628 (val!702 Int)) )
))
(declare-datatypes ((ValueCell!476 0))(
  ( (ValueCellFull!476 (v!1791 V!1627)) (EmptyCell!476) )
))
(declare-datatypes ((array!1911 0))(
  ( (array!1912 (arr!909 (Array (_ BitVec 32) ValueCell!476)) (size!1010 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1911)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1913 0))(
  ( (array!1914 (arr!910 (Array (_ BitVec 32) (_ BitVec 64))) (size!1011 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1913)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1627)

(declare-fun minValue!1443 () V!1627)

(declare-datatypes ((tuple2!1156 0))(
  ( (tuple2!1157 (_1!589 (_ BitVec 64)) (_2!589 V!1627)) )
))
(declare-datatypes ((List!748 0))(
  ( (Nil!745) (Cons!744 (h!1311 tuple2!1156) (t!3435 List!748)) )
))
(declare-datatypes ((ListLongMap!727 0))(
  ( (ListLongMap!728 (toList!379 List!748)) )
))
(declare-fun contains!321 (ListLongMap!727 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!204 (array!1913 array!1911 (_ BitVec 32) (_ BitVec 32) V!1627 V!1627 (_ BitVec 32) Int) ListLongMap!727)

(assert (=> b!30273 (= res!18238 (not (contains!321 (getCurrentListMap!204 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30274 () Bool)

(declare-fun res!18237 () Bool)

(assert (=> b!30274 (=> (not res!18237) (not e!19436))))

(declare-datatypes ((List!749 0))(
  ( (Nil!746) (Cons!745 (h!1312 (_ BitVec 64)) (t!3436 List!749)) )
))
(declare-fun arrayNoDuplicates!0 (array!1913 (_ BitVec 32) List!749) Bool)

(assert (=> b!30274 (= res!18237 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!746))))

(declare-fun b!30275 () Bool)

(declare-fun e!19435 () Bool)

(declare-fun tp_is_empty!1351 () Bool)

(assert (=> b!30275 (= e!19435 tp_is_empty!1351)))

(declare-fun b!30276 () Bool)

(declare-fun res!18241 () Bool)

(assert (=> b!30276 (=> (not res!18241) (not e!19436))))

(assert (=> b!30276 (= res!18241 (and (= (size!1010 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1011 _keys!1833) (size!1010 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30277 () Bool)

(assert (=> b!30277 (= e!19436 false)))

(declare-datatypes ((SeekEntryResult!101 0))(
  ( (MissingZero!101 (index!2526 (_ BitVec 32))) (Found!101 (index!2527 (_ BitVec 32))) (Intermediate!101 (undefined!913 Bool) (index!2528 (_ BitVec 32)) (x!6523 (_ BitVec 32))) (Undefined!101) (MissingVacant!101 (index!2529 (_ BitVec 32))) )
))
(declare-fun lt!11367 () SeekEntryResult!101)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1913 (_ BitVec 32)) SeekEntryResult!101)

(assert (=> b!30277 (= lt!11367 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!18240 () Bool)

(assert (=> start!4088 (=> (not res!18240) (not e!19436))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4088 (= res!18240 (validMask!0 mask!2294))))

(assert (=> start!4088 e!19436))

(assert (=> start!4088 true))

(assert (=> start!4088 tp!4410))

(declare-fun e!19437 () Bool)

(declare-fun array_inv!627 (array!1911) Bool)

(assert (=> start!4088 (and (array_inv!627 _values!1501) e!19437)))

(declare-fun array_inv!628 (array!1913) Bool)

(assert (=> start!4088 (array_inv!628 _keys!1833)))

(assert (=> start!4088 tp_is_empty!1351))

(declare-fun mapNonEmpty!1555 () Bool)

(declare-fun mapRes!1555 () Bool)

(declare-fun tp!4411 () Bool)

(declare-fun e!19438 () Bool)

(assert (=> mapNonEmpty!1555 (= mapRes!1555 (and tp!4411 e!19438))))

(declare-fun mapValue!1555 () ValueCell!476)

(declare-fun mapKey!1555 () (_ BitVec 32))

(declare-fun mapRest!1555 () (Array (_ BitVec 32) ValueCell!476))

(assert (=> mapNonEmpty!1555 (= (arr!909 _values!1501) (store mapRest!1555 mapKey!1555 mapValue!1555))))

(declare-fun b!30278 () Bool)

(declare-fun res!18239 () Bool)

(assert (=> b!30278 (=> (not res!18239) (not e!19436))))

(declare-fun arrayContainsKey!0 (array!1913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30278 (= res!18239 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30279 () Bool)

(assert (=> b!30279 (= e!19438 tp_is_empty!1351)))

(declare-fun mapIsEmpty!1555 () Bool)

(assert (=> mapIsEmpty!1555 mapRes!1555))

(declare-fun b!30280 () Bool)

(assert (=> b!30280 (= e!19437 (and e!19435 mapRes!1555))))

(declare-fun condMapEmpty!1555 () Bool)

(declare-fun mapDefault!1555 () ValueCell!476)

(assert (=> b!30280 (= condMapEmpty!1555 (= (arr!909 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!476)) mapDefault!1555)))))

(declare-fun b!30281 () Bool)

(declare-fun res!18236 () Bool)

(assert (=> b!30281 (=> (not res!18236) (not e!19436))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30281 (= res!18236 (validKeyInArray!0 k0!1304))))

(declare-fun b!30282 () Bool)

(declare-fun res!18242 () Bool)

(assert (=> b!30282 (=> (not res!18242) (not e!19436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1913 (_ BitVec 32)) Bool)

(assert (=> b!30282 (= res!18242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(assert (= (and start!4088 res!18240) b!30276))

(assert (= (and b!30276 res!18241) b!30282))

(assert (= (and b!30282 res!18242) b!30274))

(assert (= (and b!30274 res!18237) b!30281))

(assert (= (and b!30281 res!18236) b!30273))

(assert (= (and b!30273 res!18238) b!30278))

(assert (= (and b!30278 res!18239) b!30277))

(assert (= (and b!30280 condMapEmpty!1555) mapIsEmpty!1555))

(assert (= (and b!30280 (not condMapEmpty!1555)) mapNonEmpty!1555))

(get-info :version)

(assert (= (and mapNonEmpty!1555 ((_ is ValueCellFull!476) mapValue!1555)) b!30279))

(assert (= (and b!30280 ((_ is ValueCellFull!476) mapDefault!1555)) b!30275))

(assert (= start!4088 b!30280))

(declare-fun m!24233 () Bool)

(assert (=> mapNonEmpty!1555 m!24233))

(declare-fun m!24235 () Bool)

(assert (=> b!30281 m!24235))

(declare-fun m!24237 () Bool)

(assert (=> b!30278 m!24237))

(declare-fun m!24239 () Bool)

(assert (=> b!30273 m!24239))

(assert (=> b!30273 m!24239))

(declare-fun m!24241 () Bool)

(assert (=> b!30273 m!24241))

(declare-fun m!24243 () Bool)

(assert (=> b!30277 m!24243))

(declare-fun m!24245 () Bool)

(assert (=> start!4088 m!24245))

(declare-fun m!24247 () Bool)

(assert (=> start!4088 m!24247))

(declare-fun m!24249 () Bool)

(assert (=> start!4088 m!24249))

(declare-fun m!24251 () Bool)

(assert (=> b!30274 m!24251))

(declare-fun m!24253 () Bool)

(assert (=> b!30282 m!24253))

(check-sat (not b_next!997) (not b!30277) tp_is_empty!1351 (not b!30274) b_and!1797 (not b!30278) (not mapNonEmpty!1555) (not b!30281) (not b!30282) (not b!30273) (not start!4088))
(check-sat b_and!1797 (not b_next!997))
