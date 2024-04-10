; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4106 () Bool)

(assert start!4106)

(declare-fun b_free!1011 () Bool)

(declare-fun b_next!1011 () Bool)

(assert (=> start!4106 (= b_free!1011 (not b_next!1011))))

(declare-fun tp!4453 () Bool)

(declare-fun b_and!1821 () Bool)

(assert (=> start!4106 (= tp!4453 b_and!1821)))

(declare-fun mapIsEmpty!1576 () Bool)

(declare-fun mapRes!1576 () Bool)

(assert (=> mapIsEmpty!1576 mapRes!1576))

(declare-fun b!30555 () Bool)

(declare-fun e!19591 () Bool)

(assert (=> b!30555 (= e!19591 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!105 0))(
  ( (MissingZero!105 (index!2542 (_ BitVec 32))) (Found!105 (index!2543 (_ BitVec 32))) (Intermediate!105 (undefined!917 Bool) (index!2544 (_ BitVec 32)) (x!6543 (_ BitVec 32))) (Undefined!105) (MissingVacant!105 (index!2545 (_ BitVec 32))) )
))
(declare-fun lt!11432 () SeekEntryResult!105)

(declare-datatypes ((array!1959 0))(
  ( (array!1960 (arr!933 (Array (_ BitVec 32) (_ BitVec 64))) (size!1034 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1959)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1959 (_ BitVec 32)) SeekEntryResult!105)

(assert (=> b!30555 (= lt!11432 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun res!18429 () Bool)

(assert (=> start!4106 (=> (not res!18429) (not e!19591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4106 (= res!18429 (validMask!0 mask!2294))))

(assert (=> start!4106 e!19591))

(assert (=> start!4106 true))

(assert (=> start!4106 tp!4453))

(declare-datatypes ((V!1645 0))(
  ( (V!1646 (val!709 Int)) )
))
(declare-datatypes ((ValueCell!483 0))(
  ( (ValueCellFull!483 (v!1798 V!1645)) (EmptyCell!483) )
))
(declare-datatypes ((array!1961 0))(
  ( (array!1962 (arr!934 (Array (_ BitVec 32) ValueCell!483)) (size!1035 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1961)

(declare-fun e!19594 () Bool)

(declare-fun array_inv!653 (array!1961) Bool)

(assert (=> start!4106 (and (array_inv!653 _values!1501) e!19594)))

(declare-fun array_inv!654 (array!1959) Bool)

(assert (=> start!4106 (array_inv!654 _keys!1833)))

(declare-fun tp_is_empty!1365 () Bool)

(assert (=> start!4106 tp_is_empty!1365))

(declare-fun b!30556 () Bool)

(declare-fun res!18425 () Bool)

(assert (=> b!30556 (=> (not res!18425) (not e!19591))))

(declare-fun arrayContainsKey!0 (array!1959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30556 (= res!18425 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30557 () Bool)

(declare-fun e!19595 () Bool)

(assert (=> b!30557 (= e!19595 tp_is_empty!1365)))

(declare-fun b!30558 () Bool)

(declare-fun res!18424 () Bool)

(assert (=> b!30558 (=> (not res!18424) (not e!19591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30558 (= res!18424 (validKeyInArray!0 k0!1304))))

(declare-fun b!30559 () Bool)

(declare-fun res!18428 () Bool)

(assert (=> b!30559 (=> (not res!18428) (not e!19591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1959 (_ BitVec 32)) Bool)

(assert (=> b!30559 (= res!18428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30560 () Bool)

(declare-fun res!18426 () Bool)

(assert (=> b!30560 (=> (not res!18426) (not e!19591))))

(declare-datatypes ((List!763 0))(
  ( (Nil!760) (Cons!759 (h!1326 (_ BitVec 64)) (t!3456 List!763)) )
))
(declare-fun arrayNoDuplicates!0 (array!1959 (_ BitVec 32) List!763) Bool)

(assert (=> b!30560 (= res!18426 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!760))))

(declare-fun b!30561 () Bool)

(declare-fun res!18427 () Bool)

(assert (=> b!30561 (=> (not res!18427) (not e!19591))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30561 (= res!18427 (and (= (size!1035 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1034 _keys!1833) (size!1035 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30562 () Bool)

(declare-fun res!18423 () Bool)

(assert (=> b!30562 (=> (not res!18423) (not e!19591))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1645)

(declare-fun minValue!1443 () V!1645)

(declare-datatypes ((tuple2!1168 0))(
  ( (tuple2!1169 (_1!595 (_ BitVec 64)) (_2!595 V!1645)) )
))
(declare-datatypes ((List!764 0))(
  ( (Nil!761) (Cons!760 (h!1327 tuple2!1168) (t!3457 List!764)) )
))
(declare-datatypes ((ListLongMap!745 0))(
  ( (ListLongMap!746 (toList!388 List!764)) )
))
(declare-fun contains!328 (ListLongMap!745 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!216 (array!1959 array!1961 (_ BitVec 32) (_ BitVec 32) V!1645 V!1645 (_ BitVec 32) Int) ListLongMap!745)

(assert (=> b!30562 (= res!18423 (not (contains!328 (getCurrentListMap!216 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30563 () Bool)

(declare-fun e!19592 () Bool)

(assert (=> b!30563 (= e!19592 tp_is_empty!1365)))

(declare-fun mapNonEmpty!1576 () Bool)

(declare-fun tp!4452 () Bool)

(assert (=> mapNonEmpty!1576 (= mapRes!1576 (and tp!4452 e!19592))))

(declare-fun mapKey!1576 () (_ BitVec 32))

(declare-fun mapValue!1576 () ValueCell!483)

(declare-fun mapRest!1576 () (Array (_ BitVec 32) ValueCell!483))

(assert (=> mapNonEmpty!1576 (= (arr!934 _values!1501) (store mapRest!1576 mapKey!1576 mapValue!1576))))

(declare-fun b!30564 () Bool)

(assert (=> b!30564 (= e!19594 (and e!19595 mapRes!1576))))

(declare-fun condMapEmpty!1576 () Bool)

(declare-fun mapDefault!1576 () ValueCell!483)

(assert (=> b!30564 (= condMapEmpty!1576 (= (arr!934 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!483)) mapDefault!1576)))))

(assert (= (and start!4106 res!18429) b!30561))

(assert (= (and b!30561 res!18427) b!30559))

(assert (= (and b!30559 res!18428) b!30560))

(assert (= (and b!30560 res!18426) b!30558))

(assert (= (and b!30558 res!18424) b!30562))

(assert (= (and b!30562 res!18423) b!30556))

(assert (= (and b!30556 res!18425) b!30555))

(assert (= (and b!30564 condMapEmpty!1576) mapIsEmpty!1576))

(assert (= (and b!30564 (not condMapEmpty!1576)) mapNonEmpty!1576))

(get-info :version)

(assert (= (and mapNonEmpty!1576 ((_ is ValueCellFull!483) mapValue!1576)) b!30563))

(assert (= (and b!30564 ((_ is ValueCellFull!483) mapDefault!1576)) b!30557))

(assert (= start!4106 b!30564))

(declare-fun m!24539 () Bool)

(assert (=> b!30560 m!24539))

(declare-fun m!24541 () Bool)

(assert (=> mapNonEmpty!1576 m!24541))

(declare-fun m!24543 () Bool)

(assert (=> b!30559 m!24543))

(declare-fun m!24545 () Bool)

(assert (=> b!30562 m!24545))

(assert (=> b!30562 m!24545))

(declare-fun m!24547 () Bool)

(assert (=> b!30562 m!24547))

(declare-fun m!24549 () Bool)

(assert (=> b!30556 m!24549))

(declare-fun m!24551 () Bool)

(assert (=> b!30555 m!24551))

(declare-fun m!24553 () Bool)

(assert (=> b!30558 m!24553))

(declare-fun m!24555 () Bool)

(assert (=> start!4106 m!24555))

(declare-fun m!24557 () Bool)

(assert (=> start!4106 m!24557))

(declare-fun m!24559 () Bool)

(assert (=> start!4106 m!24559))

(check-sat (not start!4106) (not b!30558) (not mapNonEmpty!1576) tp_is_empty!1365 (not b!30560) (not b!30559) b_and!1821 (not b_next!1011) (not b!30562) (not b!30555) (not b!30556))
(check-sat b_and!1821 (not b_next!1011))
