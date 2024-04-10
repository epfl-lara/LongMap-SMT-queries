; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4112 () Bool)

(assert start!4112)

(declare-fun b_free!1017 () Bool)

(declare-fun b_next!1017 () Bool)

(assert (=> start!4112 (= b_free!1017 (not b_next!1017))))

(declare-fun tp!4471 () Bool)

(declare-fun b_and!1827 () Bool)

(assert (=> start!4112 (= tp!4471 b_and!1827)))

(declare-fun b!30645 () Bool)

(declare-fun e!19638 () Bool)

(declare-fun tp_is_empty!1371 () Bool)

(assert (=> b!30645 (= e!19638 tp_is_empty!1371)))

(declare-fun mapNonEmpty!1585 () Bool)

(declare-fun mapRes!1585 () Bool)

(declare-fun tp!4470 () Bool)

(assert (=> mapNonEmpty!1585 (= mapRes!1585 (and tp!4470 e!19638))))

(declare-datatypes ((V!1653 0))(
  ( (V!1654 (val!712 Int)) )
))
(declare-datatypes ((ValueCell!486 0))(
  ( (ValueCellFull!486 (v!1801 V!1653)) (EmptyCell!486) )
))
(declare-fun mapValue!1585 () ValueCell!486)

(declare-datatypes ((array!1969 0))(
  ( (array!1970 (arr!938 (Array (_ BitVec 32) ValueCell!486)) (size!1039 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1969)

(declare-fun mapKey!1585 () (_ BitVec 32))

(declare-fun mapRest!1585 () (Array (_ BitVec 32) ValueCell!486))

(assert (=> mapNonEmpty!1585 (= (arr!938 _values!1501) (store mapRest!1585 mapKey!1585 mapValue!1585))))

(declare-fun res!18492 () Bool)

(declare-fun e!19636 () Bool)

(assert (=> start!4112 (=> (not res!18492) (not e!19636))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4112 (= res!18492 (validMask!0 mask!2294))))

(assert (=> start!4112 e!19636))

(assert (=> start!4112 true))

(assert (=> start!4112 tp!4471))

(declare-fun e!19640 () Bool)

(declare-fun array_inv!655 (array!1969) Bool)

(assert (=> start!4112 (and (array_inv!655 _values!1501) e!19640)))

(declare-datatypes ((array!1971 0))(
  ( (array!1972 (arr!939 (Array (_ BitVec 32) (_ BitVec 64))) (size!1040 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1971)

(declare-fun array_inv!656 (array!1971) Bool)

(assert (=> start!4112 (array_inv!656 _keys!1833)))

(assert (=> start!4112 tp_is_empty!1371))

(declare-fun b!30646 () Bool)

(declare-fun res!18490 () Bool)

(assert (=> b!30646 (=> (not res!18490) (not e!19636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1971 (_ BitVec 32)) Bool)

(assert (=> b!30646 (= res!18490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30647 () Bool)

(declare-fun res!18487 () Bool)

(assert (=> b!30647 (=> (not res!18487) (not e!19636))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30647 (= res!18487 (validKeyInArray!0 k0!1304))))

(declare-fun b!30648 () Bool)

(declare-fun res!18491 () Bool)

(assert (=> b!30648 (=> (not res!18491) (not e!19636))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30648 (= res!18491 (and (= (size!1039 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1040 _keys!1833) (size!1039 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30649 () Bool)

(declare-fun res!18489 () Bool)

(assert (=> b!30649 (=> (not res!18489) (not e!19636))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1653)

(declare-fun minValue!1443 () V!1653)

(declare-datatypes ((tuple2!1172 0))(
  ( (tuple2!1173 (_1!597 (_ BitVec 64)) (_2!597 V!1653)) )
))
(declare-datatypes ((List!766 0))(
  ( (Nil!763) (Cons!762 (h!1329 tuple2!1172) (t!3459 List!766)) )
))
(declare-datatypes ((ListLongMap!749 0))(
  ( (ListLongMap!750 (toList!390 List!766)) )
))
(declare-fun contains!330 (ListLongMap!749 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!218 (array!1971 array!1969 (_ BitVec 32) (_ BitVec 32) V!1653 V!1653 (_ BitVec 32) Int) ListLongMap!749)

(assert (=> b!30649 (= res!18489 (not (contains!330 (getCurrentListMap!218 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!30650 () Bool)

(declare-fun res!18486 () Bool)

(assert (=> b!30650 (=> (not res!18486) (not e!19636))))

(declare-fun arrayContainsKey!0 (array!1971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30650 (= res!18486 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30651 () Bool)

(assert (=> b!30651 (= e!19636 false)))

(declare-datatypes ((SeekEntryResult!107 0))(
  ( (MissingZero!107 (index!2550 (_ BitVec 32))) (Found!107 (index!2551 (_ BitVec 32))) (Intermediate!107 (undefined!919 Bool) (index!2552 (_ BitVec 32)) (x!6553 (_ BitVec 32))) (Undefined!107) (MissingVacant!107 (index!2553 (_ BitVec 32))) )
))
(declare-fun lt!11441 () SeekEntryResult!107)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1971 (_ BitVec 32)) SeekEntryResult!107)

(assert (=> b!30651 (= lt!11441 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!30652 () Bool)

(declare-fun e!19639 () Bool)

(assert (=> b!30652 (= e!19639 tp_is_empty!1371)))

(declare-fun mapIsEmpty!1585 () Bool)

(assert (=> mapIsEmpty!1585 mapRes!1585))

(declare-fun b!30653 () Bool)

(declare-fun res!18488 () Bool)

(assert (=> b!30653 (=> (not res!18488) (not e!19636))))

(declare-datatypes ((List!767 0))(
  ( (Nil!764) (Cons!763 (h!1330 (_ BitVec 64)) (t!3460 List!767)) )
))
(declare-fun arrayNoDuplicates!0 (array!1971 (_ BitVec 32) List!767) Bool)

(assert (=> b!30653 (= res!18488 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!764))))

(declare-fun b!30654 () Bool)

(assert (=> b!30654 (= e!19640 (and e!19639 mapRes!1585))))

(declare-fun condMapEmpty!1585 () Bool)

(declare-fun mapDefault!1585 () ValueCell!486)

(assert (=> b!30654 (= condMapEmpty!1585 (= (arr!938 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!486)) mapDefault!1585)))))

(assert (= (and start!4112 res!18492) b!30648))

(assert (= (and b!30648 res!18491) b!30646))

(assert (= (and b!30646 res!18490) b!30653))

(assert (= (and b!30653 res!18488) b!30647))

(assert (= (and b!30647 res!18487) b!30649))

(assert (= (and b!30649 res!18489) b!30650))

(assert (= (and b!30650 res!18486) b!30651))

(assert (= (and b!30654 condMapEmpty!1585) mapIsEmpty!1585))

(assert (= (and b!30654 (not condMapEmpty!1585)) mapNonEmpty!1585))

(get-info :version)

(assert (= (and mapNonEmpty!1585 ((_ is ValueCellFull!486) mapValue!1585)) b!30645))

(assert (= (and b!30654 ((_ is ValueCellFull!486) mapDefault!1585)) b!30652))

(assert (= start!4112 b!30654))

(declare-fun m!24605 () Bool)

(assert (=> b!30650 m!24605))

(declare-fun m!24607 () Bool)

(assert (=> b!30647 m!24607))

(declare-fun m!24609 () Bool)

(assert (=> start!4112 m!24609))

(declare-fun m!24611 () Bool)

(assert (=> start!4112 m!24611))

(declare-fun m!24613 () Bool)

(assert (=> start!4112 m!24613))

(declare-fun m!24615 () Bool)

(assert (=> mapNonEmpty!1585 m!24615))

(declare-fun m!24617 () Bool)

(assert (=> b!30653 m!24617))

(declare-fun m!24619 () Bool)

(assert (=> b!30646 m!24619))

(declare-fun m!24621 () Bool)

(assert (=> b!30651 m!24621))

(declare-fun m!24623 () Bool)

(assert (=> b!30649 m!24623))

(assert (=> b!30649 m!24623))

(declare-fun m!24625 () Bool)

(assert (=> b!30649 m!24625))

(check-sat (not b!30646) (not b!30650) (not b!30647) b_and!1827 (not b!30651) (not start!4112) (not b_next!1017) (not b!30649) (not mapNonEmpty!1585) (not b!30653) tp_is_empty!1371)
(check-sat b_and!1827 (not b_next!1017))
