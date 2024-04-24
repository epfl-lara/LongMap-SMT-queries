; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4106 () Bool)

(assert start!4106)

(declare-fun b_free!1015 () Bool)

(declare-fun b_next!1015 () Bool)

(assert (=> start!4106 (= b_free!1015 (not b_next!1015))))

(declare-fun tp!4465 () Bool)

(declare-fun b_and!1815 () Bool)

(assert (=> start!4106 (= tp!4465 b_and!1815)))

(declare-fun b!30543 () Bool)

(declare-fun e!19573 () Bool)

(declare-fun tp_is_empty!1369 () Bool)

(assert (=> b!30543 (= e!19573 tp_is_empty!1369)))

(declare-fun b!30544 () Bool)

(declare-fun res!18428 () Bool)

(declare-fun e!19571 () Bool)

(assert (=> b!30544 (=> (not res!18428) (not e!19571))))

(declare-datatypes ((array!1943 0))(
  ( (array!1944 (arr!925 (Array (_ BitVec 32) (_ BitVec 64))) (size!1026 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1943)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1943 (_ BitVec 32)) Bool)

(assert (=> b!30544 (= res!18428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30545 () Bool)

(declare-fun res!18427 () Bool)

(assert (=> b!30545 (=> (not res!18427) (not e!19571))))

(declare-datatypes ((List!759 0))(
  ( (Nil!756) (Cons!755 (h!1322 (_ BitVec 64)) (t!3446 List!759)) )
))
(declare-fun arrayNoDuplicates!0 (array!1943 (_ BitVec 32) List!759) Bool)

(assert (=> b!30545 (= res!18427 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!756))))

(declare-fun b!30546 () Bool)

(declare-fun res!18429 () Bool)

(assert (=> b!30546 (=> (not res!18429) (not e!19571))))

(declare-datatypes ((V!1651 0))(
  ( (V!1652 (val!711 Int)) )
))
(declare-datatypes ((ValueCell!485 0))(
  ( (ValueCellFull!485 (v!1800 V!1651)) (EmptyCell!485) )
))
(declare-datatypes ((array!1945 0))(
  ( (array!1946 (arr!926 (Array (_ BitVec 32) ValueCell!485)) (size!1027 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1945)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30546 (= res!18429 (and (= (size!1027 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1026 _keys!1833) (size!1027 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1582 () Bool)

(declare-fun mapRes!1582 () Bool)

(declare-fun tp!4464 () Bool)

(declare-fun e!19572 () Bool)

(assert (=> mapNonEmpty!1582 (= mapRes!1582 (and tp!4464 e!19572))))

(declare-fun mapKey!1582 () (_ BitVec 32))

(declare-fun mapValue!1582 () ValueCell!485)

(declare-fun mapRest!1582 () (Array (_ BitVec 32) ValueCell!485))

(assert (=> mapNonEmpty!1582 (= (arr!926 _values!1501) (store mapRest!1582 mapKey!1582 mapValue!1582))))

(declare-fun b!30547 () Bool)

(assert (=> b!30547 (= e!19571 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!106 0))(
  ( (MissingZero!106 (index!2546 (_ BitVec 32))) (Found!106 (index!2547 (_ BitVec 32))) (Intermediate!106 (undefined!918 Bool) (index!2548 (_ BitVec 32)) (x!6552 (_ BitVec 32))) (Undefined!106) (MissingVacant!106 (index!2549 (_ BitVec 32))) )
))
(declare-fun lt!11394 () SeekEntryResult!106)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1943 (_ BitVec 32)) SeekEntryResult!106)

(assert (=> b!30547 (= lt!11394 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!18430 () Bool)

(assert (=> start!4106 (=> (not res!18430) (not e!19571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4106 (= res!18430 (validMask!0 mask!2294))))

(assert (=> start!4106 e!19571))

(assert (=> start!4106 true))

(assert (=> start!4106 tp!4465))

(declare-fun e!19570 () Bool)

(declare-fun array_inv!639 (array!1945) Bool)

(assert (=> start!4106 (and (array_inv!639 _values!1501) e!19570)))

(declare-fun array_inv!640 (array!1943) Bool)

(assert (=> start!4106 (array_inv!640 _keys!1833)))

(assert (=> start!4106 tp_is_empty!1369))

(declare-fun b!30548 () Bool)

(assert (=> b!30548 (= e!19570 (and e!19573 mapRes!1582))))

(declare-fun condMapEmpty!1582 () Bool)

(declare-fun mapDefault!1582 () ValueCell!485)

(assert (=> b!30548 (= condMapEmpty!1582 (= (arr!926 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!485)) mapDefault!1582)))))

(declare-fun b!30549 () Bool)

(assert (=> b!30549 (= e!19572 tp_is_empty!1369)))

(declare-fun b!30550 () Bool)

(declare-fun res!18431 () Bool)

(assert (=> b!30550 (=> (not res!18431) (not e!19571))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1651)

(declare-fun minValue!1443 () V!1651)

(declare-datatypes ((tuple2!1166 0))(
  ( (tuple2!1167 (_1!594 (_ BitVec 64)) (_2!594 V!1651)) )
))
(declare-datatypes ((List!760 0))(
  ( (Nil!757) (Cons!756 (h!1323 tuple2!1166) (t!3447 List!760)) )
))
(declare-datatypes ((ListLongMap!737 0))(
  ( (ListLongMap!738 (toList!384 List!760)) )
))
(declare-fun contains!326 (ListLongMap!737 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!209 (array!1943 array!1945 (_ BitVec 32) (_ BitVec 32) V!1651 V!1651 (_ BitVec 32) Int) ListLongMap!737)

(assert (=> b!30550 (= res!18431 (not (contains!326 (getCurrentListMap!209 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30551 () Bool)

(declare-fun res!18425 () Bool)

(assert (=> b!30551 (=> (not res!18425) (not e!19571))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30551 (= res!18425 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1582 () Bool)

(assert (=> mapIsEmpty!1582 mapRes!1582))

(declare-fun b!30552 () Bool)

(declare-fun res!18426 () Bool)

(assert (=> b!30552 (=> (not res!18426) (not e!19571))))

(declare-fun arrayContainsKey!0 (array!1943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30552 (= res!18426 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(assert (= (and start!4106 res!18430) b!30546))

(assert (= (and b!30546 res!18429) b!30544))

(assert (= (and b!30544 res!18428) b!30545))

(assert (= (and b!30545 res!18427) b!30551))

(assert (= (and b!30551 res!18425) b!30550))

(assert (= (and b!30550 res!18431) b!30552))

(assert (= (and b!30552 res!18426) b!30547))

(assert (= (and b!30548 condMapEmpty!1582) mapIsEmpty!1582))

(assert (= (and b!30548 (not condMapEmpty!1582)) mapNonEmpty!1582))

(get-info :version)

(assert (= (and mapNonEmpty!1582 ((_ is ValueCellFull!485) mapValue!1582)) b!30549))

(assert (= (and b!30548 ((_ is ValueCellFull!485) mapDefault!1582)) b!30543))

(assert (= start!4106 b!30548))

(declare-fun m!24431 () Bool)

(assert (=> b!30551 m!24431))

(declare-fun m!24433 () Bool)

(assert (=> b!30547 m!24433))

(declare-fun m!24435 () Bool)

(assert (=> b!30544 m!24435))

(declare-fun m!24437 () Bool)

(assert (=> b!30545 m!24437))

(declare-fun m!24439 () Bool)

(assert (=> b!30552 m!24439))

(declare-fun m!24441 () Bool)

(assert (=> mapNonEmpty!1582 m!24441))

(declare-fun m!24443 () Bool)

(assert (=> start!4106 m!24443))

(declare-fun m!24445 () Bool)

(assert (=> start!4106 m!24445))

(declare-fun m!24447 () Bool)

(assert (=> start!4106 m!24447))

(declare-fun m!24449 () Bool)

(assert (=> b!30550 m!24449))

(assert (=> b!30550 m!24449))

(declare-fun m!24451 () Bool)

(assert (=> b!30550 m!24451))

(check-sat (not mapNonEmpty!1582) (not b!30550) (not start!4106) (not b_next!1015) (not b!30545) (not b!30547) (not b!30551) b_and!1815 tp_is_empty!1369 (not b!30544) (not b!30552))
(check-sat b_and!1815 (not b_next!1015))
