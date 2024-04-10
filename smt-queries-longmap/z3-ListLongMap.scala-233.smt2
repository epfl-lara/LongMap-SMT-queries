; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4082 () Bool)

(assert start!4082)

(declare-fun b_free!987 () Bool)

(declare-fun b_next!987 () Bool)

(assert (=> start!4082 (= b_free!987 (not b_next!987))))

(declare-fun tp!4380 () Bool)

(declare-fun b_and!1797 () Bool)

(assert (=> start!4082 (= tp!4380 b_and!1797)))

(declare-fun b!30195 () Bool)

(declare-fun res!18174 () Bool)

(declare-fun e!19412 () Bool)

(assert (=> b!30195 (=> (not res!18174) (not e!19412))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30195 (= res!18174 (validKeyInArray!0 k0!1304))))

(declare-fun b!30197 () Bool)

(declare-fun res!18173 () Bool)

(assert (=> b!30197 (=> (not res!18173) (not e!19412))))

(declare-datatypes ((array!1911 0))(
  ( (array!1912 (arr!909 (Array (_ BitVec 32) (_ BitVec 64))) (size!1010 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1911)

(declare-datatypes ((List!749 0))(
  ( (Nil!746) (Cons!745 (h!1312 (_ BitVec 64)) (t!3442 List!749)) )
))
(declare-fun arrayNoDuplicates!0 (array!1911 (_ BitVec 32) List!749) Bool)

(assert (=> b!30197 (= res!18173 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!746))))

(declare-fun b!30198 () Bool)

(declare-fun res!18176 () Bool)

(assert (=> b!30198 (=> (not res!18176) (not e!19412))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1911 (_ BitVec 32)) Bool)

(assert (=> b!30198 (= res!18176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30199 () Bool)

(declare-fun res!18175 () Bool)

(assert (=> b!30199 (=> (not res!18175) (not e!19412))))

(declare-fun arrayContainsKey!0 (array!1911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30199 (= res!18175 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30200 () Bool)

(assert (=> b!30200 (= e!19412 false)))

(declare-datatypes ((SeekEntryResult!99 0))(
  ( (MissingZero!99 (index!2518 (_ BitVec 32))) (Found!99 (index!2519 (_ BitVec 32))) (Intermediate!99 (undefined!911 Bool) (index!2520 (_ BitVec 32)) (x!6505 (_ BitVec 32))) (Undefined!99) (MissingVacant!99 (index!2521 (_ BitVec 32))) )
))
(declare-fun lt!11396 () SeekEntryResult!99)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1911 (_ BitVec 32)) SeekEntryResult!99)

(assert (=> b!30200 (= lt!11396 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1540 () Bool)

(declare-fun mapRes!1540 () Bool)

(declare-fun tp!4381 () Bool)

(declare-fun e!19414 () Bool)

(assert (=> mapNonEmpty!1540 (= mapRes!1540 (and tp!4381 e!19414))))

(declare-datatypes ((V!1613 0))(
  ( (V!1614 (val!697 Int)) )
))
(declare-datatypes ((ValueCell!471 0))(
  ( (ValueCellFull!471 (v!1786 V!1613)) (EmptyCell!471) )
))
(declare-datatypes ((array!1913 0))(
  ( (array!1914 (arr!910 (Array (_ BitVec 32) ValueCell!471)) (size!1011 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1913)

(declare-fun mapRest!1540 () (Array (_ BitVec 32) ValueCell!471))

(declare-fun mapKey!1540 () (_ BitVec 32))

(declare-fun mapValue!1540 () ValueCell!471)

(assert (=> mapNonEmpty!1540 (= (arr!910 _values!1501) (store mapRest!1540 mapKey!1540 mapValue!1540))))

(declare-fun b!30201 () Bool)

(declare-fun res!18177 () Bool)

(assert (=> b!30201 (=> (not res!18177) (not e!19412))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1613)

(declare-fun minValue!1443 () V!1613)

(declare-datatypes ((tuple2!1154 0))(
  ( (tuple2!1155 (_1!588 (_ BitVec 64)) (_2!588 V!1613)) )
))
(declare-datatypes ((List!750 0))(
  ( (Nil!747) (Cons!746 (h!1313 tuple2!1154) (t!3443 List!750)) )
))
(declare-datatypes ((ListLongMap!731 0))(
  ( (ListLongMap!732 (toList!381 List!750)) )
))
(declare-fun contains!321 (ListLongMap!731 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!209 (array!1911 array!1913 (_ BitVec 32) (_ BitVec 32) V!1613 V!1613 (_ BitVec 32) Int) ListLongMap!731)

(assert (=> b!30201 (= res!18177 (not (contains!321 (getCurrentListMap!209 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30202 () Bool)

(declare-fun e!19411 () Bool)

(declare-fun tp_is_empty!1341 () Bool)

(assert (=> b!30202 (= e!19411 tp_is_empty!1341)))

(declare-fun b!30203 () Bool)

(declare-fun res!18172 () Bool)

(assert (=> b!30203 (=> (not res!18172) (not e!19412))))

(assert (=> b!30203 (= res!18172 (and (= (size!1011 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1010 _keys!1833) (size!1011 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1540 () Bool)

(assert (=> mapIsEmpty!1540 mapRes!1540))

(declare-fun b!30204 () Bool)

(assert (=> b!30204 (= e!19414 tp_is_empty!1341)))

(declare-fun b!30196 () Bool)

(declare-fun e!19413 () Bool)

(assert (=> b!30196 (= e!19413 (and e!19411 mapRes!1540))))

(declare-fun condMapEmpty!1540 () Bool)

(declare-fun mapDefault!1540 () ValueCell!471)

(assert (=> b!30196 (= condMapEmpty!1540 (= (arr!910 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!471)) mapDefault!1540)))))

(declare-fun res!18171 () Bool)

(assert (=> start!4082 (=> (not res!18171) (not e!19412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4082 (= res!18171 (validMask!0 mask!2294))))

(assert (=> start!4082 e!19412))

(assert (=> start!4082 true))

(assert (=> start!4082 tp!4380))

(declare-fun array_inv!637 (array!1913) Bool)

(assert (=> start!4082 (and (array_inv!637 _values!1501) e!19413)))

(declare-fun array_inv!638 (array!1911) Bool)

(assert (=> start!4082 (array_inv!638 _keys!1833)))

(assert (=> start!4082 tp_is_empty!1341))

(assert (= (and start!4082 res!18171) b!30203))

(assert (= (and b!30203 res!18172) b!30198))

(assert (= (and b!30198 res!18176) b!30197))

(assert (= (and b!30197 res!18173) b!30195))

(assert (= (and b!30195 res!18174) b!30201))

(assert (= (and b!30201 res!18177) b!30199))

(assert (= (and b!30199 res!18175) b!30200))

(assert (= (and b!30196 condMapEmpty!1540) mapIsEmpty!1540))

(assert (= (and b!30196 (not condMapEmpty!1540)) mapNonEmpty!1540))

(get-info :version)

(assert (= (and mapNonEmpty!1540 ((_ is ValueCellFull!471) mapValue!1540)) b!30204))

(assert (= (and b!30196 ((_ is ValueCellFull!471) mapDefault!1540)) b!30202))

(assert (= start!4082 b!30196))

(declare-fun m!24275 () Bool)

(assert (=> b!30200 m!24275))

(declare-fun m!24277 () Bool)

(assert (=> b!30199 m!24277))

(declare-fun m!24279 () Bool)

(assert (=> start!4082 m!24279))

(declare-fun m!24281 () Bool)

(assert (=> start!4082 m!24281))

(declare-fun m!24283 () Bool)

(assert (=> start!4082 m!24283))

(declare-fun m!24285 () Bool)

(assert (=> mapNonEmpty!1540 m!24285))

(declare-fun m!24287 () Bool)

(assert (=> b!30197 m!24287))

(declare-fun m!24289 () Bool)

(assert (=> b!30201 m!24289))

(assert (=> b!30201 m!24289))

(declare-fun m!24291 () Bool)

(assert (=> b!30201 m!24291))

(declare-fun m!24293 () Bool)

(assert (=> b!30195 m!24293))

(declare-fun m!24295 () Bool)

(assert (=> b!30198 m!24295))

(check-sat tp_is_empty!1341 (not b!30195) (not b_next!987) (not b!30198) (not start!4082) (not b!30201) (not b!30200) (not b!30199) (not mapNonEmpty!1540) b_and!1797 (not b!30197))
(check-sat b_and!1797 (not b_next!987))
