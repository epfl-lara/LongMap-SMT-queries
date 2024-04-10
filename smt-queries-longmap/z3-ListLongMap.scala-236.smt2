; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4100 () Bool)

(assert start!4100)

(declare-fun b_free!1005 () Bool)

(declare-fun b_next!1005 () Bool)

(assert (=> start!4100 (= b_free!1005 (not b_next!1005))))

(declare-fun tp!4434 () Bool)

(declare-fun b_and!1815 () Bool)

(assert (=> start!4100 (= tp!4434 b_and!1815)))

(declare-fun b!30465 () Bool)

(declare-fun e!19548 () Bool)

(assert (=> b!30465 (= e!19548 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!103 0))(
  ( (MissingZero!103 (index!2534 (_ BitVec 32))) (Found!103 (index!2535 (_ BitVec 32))) (Intermediate!103 (undefined!915 Bool) (index!2536 (_ BitVec 32)) (x!6533 (_ BitVec 32))) (Undefined!103) (MissingVacant!103 (index!2537 (_ BitVec 32))) )
))
(declare-fun lt!11423 () SeekEntryResult!103)

(declare-datatypes ((array!1947 0))(
  ( (array!1948 (arr!927 (Array (_ BitVec 32) (_ BitVec 64))) (size!1028 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1947)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1947 (_ BitVec 32)) SeekEntryResult!103)

(assert (=> b!30465 (= lt!11423 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1567 () Bool)

(declare-fun mapRes!1567 () Bool)

(declare-fun tp!4435 () Bool)

(declare-fun e!19550 () Bool)

(assert (=> mapNonEmpty!1567 (= mapRes!1567 (and tp!4435 e!19550))))

(declare-datatypes ((V!1637 0))(
  ( (V!1638 (val!706 Int)) )
))
(declare-datatypes ((ValueCell!480 0))(
  ( (ValueCellFull!480 (v!1795 V!1637)) (EmptyCell!480) )
))
(declare-datatypes ((array!1949 0))(
  ( (array!1950 (arr!928 (Array (_ BitVec 32) ValueCell!480)) (size!1029 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1949)

(declare-fun mapKey!1567 () (_ BitVec 32))

(declare-fun mapValue!1567 () ValueCell!480)

(declare-fun mapRest!1567 () (Array (_ BitVec 32) ValueCell!480))

(assert (=> mapNonEmpty!1567 (= (arr!928 _values!1501) (store mapRest!1567 mapKey!1567 mapValue!1567))))

(declare-fun b!30466 () Bool)

(declare-fun res!18364 () Bool)

(assert (=> b!30466 (=> (not res!18364) (not e!19548))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30466 (= res!18364 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1567 () Bool)

(assert (=> mapIsEmpty!1567 mapRes!1567))

(declare-fun b!30467 () Bool)

(declare-fun res!18360 () Bool)

(assert (=> b!30467 (=> (not res!18360) (not e!19548))))

(declare-fun arrayContainsKey!0 (array!1947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30467 (= res!18360 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun res!18366 () Bool)

(assert (=> start!4100 (=> (not res!18366) (not e!19548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4100 (= res!18366 (validMask!0 mask!2294))))

(assert (=> start!4100 e!19548))

(assert (=> start!4100 true))

(assert (=> start!4100 tp!4434))

(declare-fun e!19546 () Bool)

(declare-fun array_inv!647 (array!1949) Bool)

(assert (=> start!4100 (and (array_inv!647 _values!1501) e!19546)))

(declare-fun array_inv!648 (array!1947) Bool)

(assert (=> start!4100 (array_inv!648 _keys!1833)))

(declare-fun tp_is_empty!1359 () Bool)

(assert (=> start!4100 tp_is_empty!1359))

(declare-fun b!30468 () Bool)

(declare-fun res!18361 () Bool)

(assert (=> b!30468 (=> (not res!18361) (not e!19548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1947 (_ BitVec 32)) Bool)

(assert (=> b!30468 (= res!18361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30469 () Bool)

(assert (=> b!30469 (= e!19550 tp_is_empty!1359)))

(declare-fun b!30470 () Bool)

(declare-fun res!18362 () Bool)

(assert (=> b!30470 (=> (not res!18362) (not e!19548))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30470 (= res!18362 (and (= (size!1029 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1028 _keys!1833) (size!1029 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30471 () Bool)

(declare-fun res!18365 () Bool)

(assert (=> b!30471 (=> (not res!18365) (not e!19548))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1637)

(declare-fun minValue!1443 () V!1637)

(declare-datatypes ((tuple2!1166 0))(
  ( (tuple2!1167 (_1!594 (_ BitVec 64)) (_2!594 V!1637)) )
))
(declare-datatypes ((List!760 0))(
  ( (Nil!757) (Cons!756 (h!1323 tuple2!1166) (t!3453 List!760)) )
))
(declare-datatypes ((ListLongMap!743 0))(
  ( (ListLongMap!744 (toList!387 List!760)) )
))
(declare-fun contains!327 (ListLongMap!743 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!215 (array!1947 array!1949 (_ BitVec 32) (_ BitVec 32) V!1637 V!1637 (_ BitVec 32) Int) ListLongMap!743)

(assert (=> b!30471 (= res!18365 (not (contains!327 (getCurrentListMap!215 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30472 () Bool)

(declare-fun e!19549 () Bool)

(assert (=> b!30472 (= e!19549 tp_is_empty!1359)))

(declare-fun b!30473 () Bool)

(declare-fun res!18363 () Bool)

(assert (=> b!30473 (=> (not res!18363) (not e!19548))))

(declare-datatypes ((List!761 0))(
  ( (Nil!758) (Cons!757 (h!1324 (_ BitVec 64)) (t!3454 List!761)) )
))
(declare-fun arrayNoDuplicates!0 (array!1947 (_ BitVec 32) List!761) Bool)

(assert (=> b!30473 (= res!18363 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!758))))

(declare-fun b!30474 () Bool)

(assert (=> b!30474 (= e!19546 (and e!19549 mapRes!1567))))

(declare-fun condMapEmpty!1567 () Bool)

(declare-fun mapDefault!1567 () ValueCell!480)

(assert (=> b!30474 (= condMapEmpty!1567 (= (arr!928 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!480)) mapDefault!1567)))))

(assert (= (and start!4100 res!18366) b!30470))

(assert (= (and b!30470 res!18362) b!30468))

(assert (= (and b!30468 res!18361) b!30473))

(assert (= (and b!30473 res!18363) b!30466))

(assert (= (and b!30466 res!18364) b!30471))

(assert (= (and b!30471 res!18365) b!30467))

(assert (= (and b!30467 res!18360) b!30465))

(assert (= (and b!30474 condMapEmpty!1567) mapIsEmpty!1567))

(assert (= (and b!30474 (not condMapEmpty!1567)) mapNonEmpty!1567))

(get-info :version)

(assert (= (and mapNonEmpty!1567 ((_ is ValueCellFull!480) mapValue!1567)) b!30469))

(assert (= (and b!30474 ((_ is ValueCellFull!480) mapDefault!1567)) b!30472))

(assert (= start!4100 b!30474))

(declare-fun m!24473 () Bool)

(assert (=> b!30466 m!24473))

(declare-fun m!24475 () Bool)

(assert (=> b!30465 m!24475))

(declare-fun m!24477 () Bool)

(assert (=> mapNonEmpty!1567 m!24477))

(declare-fun m!24479 () Bool)

(assert (=> b!30471 m!24479))

(assert (=> b!30471 m!24479))

(declare-fun m!24481 () Bool)

(assert (=> b!30471 m!24481))

(declare-fun m!24483 () Bool)

(assert (=> start!4100 m!24483))

(declare-fun m!24485 () Bool)

(assert (=> start!4100 m!24485))

(declare-fun m!24487 () Bool)

(assert (=> start!4100 m!24487))

(declare-fun m!24489 () Bool)

(assert (=> b!30467 m!24489))

(declare-fun m!24491 () Bool)

(assert (=> b!30473 m!24491))

(declare-fun m!24493 () Bool)

(assert (=> b!30468 m!24493))

(check-sat (not b!30467) (not b!30471) (not b!30466) (not b!30465) b_and!1815 (not start!4100) (not b!30473) (not mapNonEmpty!1567) tp_is_empty!1359 (not b_next!1005) (not b!30468))
(check-sat b_and!1815 (not b_next!1005))
