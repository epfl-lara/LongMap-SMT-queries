; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33876 () Bool)

(assert start!33876)

(declare-fun b_free!7069 () Bool)

(declare-fun b_next!7069 () Bool)

(assert (=> start!33876 (= b_free!7069 (not b_next!7069))))

(declare-fun tp!24720 () Bool)

(declare-fun b_and!14269 () Bool)

(assert (=> start!33876 (= tp!24720 b_and!14269)))

(declare-fun b!337405 () Bool)

(declare-fun e!207039 () Bool)

(declare-fun tp_is_empty!7021 () Bool)

(assert (=> b!337405 (= e!207039 tp_is_empty!7021)))

(declare-fun b!337406 () Bool)

(declare-fun res!186412 () Bool)

(declare-fun e!207043 () Bool)

(assert (=> b!337406 (=> (not res!186412) (not e!207043))))

(declare-datatypes ((array!17622 0))(
  ( (array!17623 (arr!8338 (Array (_ BitVec 32) (_ BitVec 64))) (size!8690 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17622)

(declare-datatypes ((List!4688 0))(
  ( (Nil!4685) (Cons!4684 (h!5540 (_ BitVec 64)) (t!9774 List!4688)) )
))
(declare-fun arrayNoDuplicates!0 (array!17622 (_ BitVec 32) List!4688) Bool)

(assert (=> b!337406 (= res!186412 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4685))))

(declare-fun b!337407 () Bool)

(declare-fun e!207040 () Bool)

(assert (=> b!337407 (= e!207040 tp_is_empty!7021)))

(declare-fun res!186413 () Bool)

(assert (=> start!33876 (=> (not res!186413) (not e!207043))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33876 (= res!186413 (validMask!0 mask!2385))))

(assert (=> start!33876 e!207043))

(assert (=> start!33876 true))

(assert (=> start!33876 tp_is_empty!7021))

(assert (=> start!33876 tp!24720))

(declare-datatypes ((V!10339 0))(
  ( (V!10340 (val!3555 Int)) )
))
(declare-datatypes ((ValueCell!3167 0))(
  ( (ValueCellFull!3167 (v!5721 V!10339)) (EmptyCell!3167) )
))
(declare-datatypes ((array!17624 0))(
  ( (array!17625 (arr!8339 (Array (_ BitVec 32) ValueCell!3167)) (size!8691 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17624)

(declare-fun e!207042 () Bool)

(declare-fun array_inv!6198 (array!17624) Bool)

(assert (=> start!33876 (and (array_inv!6198 _values!1525) e!207042)))

(declare-fun array_inv!6199 (array!17622) Bool)

(assert (=> start!33876 (array_inv!6199 _keys!1895)))

(declare-fun b!337408 () Bool)

(declare-fun res!186409 () Bool)

(assert (=> b!337408 (=> (not res!186409) (not e!207043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17622 (_ BitVec 32)) Bool)

(assert (=> b!337408 (= res!186409 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11937 () Bool)

(declare-fun mapRes!11937 () Bool)

(assert (=> mapIsEmpty!11937 mapRes!11937))

(declare-fun b!337409 () Bool)

(declare-fun e!207044 () Bool)

(assert (=> b!337409 (= e!207044 false)))

(declare-fun lt!160455 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17622 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337409 (= lt!160455 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337410 () Bool)

(declare-fun res!186410 () Bool)

(assert (=> b!337410 (=> (not res!186410) (not e!207043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337410 (= res!186410 (validKeyInArray!0 k0!1348))))

(declare-fun b!337411 () Bool)

(assert (=> b!337411 (= e!207042 (and e!207040 mapRes!11937))))

(declare-fun condMapEmpty!11937 () Bool)

(declare-fun mapDefault!11937 () ValueCell!3167)

(assert (=> b!337411 (= condMapEmpty!11937 (= (arr!8339 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3167)) mapDefault!11937)))))

(declare-fun mapNonEmpty!11937 () Bool)

(declare-fun tp!24719 () Bool)

(assert (=> mapNonEmpty!11937 (= mapRes!11937 (and tp!24719 e!207039))))

(declare-fun mapKey!11937 () (_ BitVec 32))

(declare-fun mapValue!11937 () ValueCell!3167)

(declare-fun mapRest!11937 () (Array (_ BitVec 32) ValueCell!3167))

(assert (=> mapNonEmpty!11937 (= (arr!8339 _values!1525) (store mapRest!11937 mapKey!11937 mapValue!11937))))

(declare-fun b!337412 () Bool)

(declare-fun res!186407 () Bool)

(assert (=> b!337412 (=> (not res!186407) (not e!207044))))

(declare-fun arrayContainsKey!0 (array!17622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337412 (= res!186407 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337413 () Bool)

(declare-fun res!186411 () Bool)

(assert (=> b!337413 (=> (not res!186411) (not e!207043))))

(declare-fun zeroValue!1467 () V!10339)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10339)

(declare-datatypes ((tuple2!5076 0))(
  ( (tuple2!5077 (_1!2549 (_ BitVec 64)) (_2!2549 V!10339)) )
))
(declare-datatypes ((List!4689 0))(
  ( (Nil!4686) (Cons!4685 (h!5541 tuple2!5076) (t!9775 List!4689)) )
))
(declare-datatypes ((ListLongMap!3991 0))(
  ( (ListLongMap!3992 (toList!2011 List!4689)) )
))
(declare-fun contains!2077 (ListLongMap!3991 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1540 (array!17622 array!17624 (_ BitVec 32) (_ BitVec 32) V!10339 V!10339 (_ BitVec 32) Int) ListLongMap!3991)

(assert (=> b!337413 (= res!186411 (not (contains!2077 (getCurrentListMap!1540 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337414 () Bool)

(declare-fun res!186406 () Bool)

(assert (=> b!337414 (=> (not res!186406) (not e!207043))))

(assert (=> b!337414 (= res!186406 (and (= (size!8691 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8690 _keys!1895) (size!8691 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337415 () Bool)

(assert (=> b!337415 (= e!207043 e!207044)))

(declare-fun res!186408 () Bool)

(assert (=> b!337415 (=> (not res!186408) (not e!207044))))

(declare-datatypes ((SeekEntryResult!3182 0))(
  ( (MissingZero!3182 (index!14907 (_ BitVec 32))) (Found!3182 (index!14908 (_ BitVec 32))) (Intermediate!3182 (undefined!3994 Bool) (index!14909 (_ BitVec 32)) (x!33591 (_ BitVec 32))) (Undefined!3182) (MissingVacant!3182 (index!14910 (_ BitVec 32))) )
))
(declare-fun lt!160456 () SeekEntryResult!3182)

(get-info :version)

(assert (=> b!337415 (= res!186408 (and (not ((_ is Found!3182) lt!160456)) ((_ is MissingZero!3182) lt!160456)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17622 (_ BitVec 32)) SeekEntryResult!3182)

(assert (=> b!337415 (= lt!160456 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(assert (= (and start!33876 res!186413) b!337414))

(assert (= (and b!337414 res!186406) b!337408))

(assert (= (and b!337408 res!186409) b!337406))

(assert (= (and b!337406 res!186412) b!337410))

(assert (= (and b!337410 res!186410) b!337413))

(assert (= (and b!337413 res!186411) b!337415))

(assert (= (and b!337415 res!186408) b!337412))

(assert (= (and b!337412 res!186407) b!337409))

(assert (= (and b!337411 condMapEmpty!11937) mapIsEmpty!11937))

(assert (= (and b!337411 (not condMapEmpty!11937)) mapNonEmpty!11937))

(assert (= (and mapNonEmpty!11937 ((_ is ValueCellFull!3167) mapValue!11937)) b!337405))

(assert (= (and b!337411 ((_ is ValueCellFull!3167) mapDefault!11937)) b!337407))

(assert (= start!33876 b!337411))

(declare-fun m!341203 () Bool)

(assert (=> mapNonEmpty!11937 m!341203))

(declare-fun m!341205 () Bool)

(assert (=> start!33876 m!341205))

(declare-fun m!341207 () Bool)

(assert (=> start!33876 m!341207))

(declare-fun m!341209 () Bool)

(assert (=> start!33876 m!341209))

(declare-fun m!341211 () Bool)

(assert (=> b!337410 m!341211))

(declare-fun m!341213 () Bool)

(assert (=> b!337408 m!341213))

(declare-fun m!341215 () Bool)

(assert (=> b!337412 m!341215))

(declare-fun m!341217 () Bool)

(assert (=> b!337415 m!341217))

(declare-fun m!341219 () Bool)

(assert (=> b!337406 m!341219))

(declare-fun m!341221 () Bool)

(assert (=> b!337409 m!341221))

(declare-fun m!341223 () Bool)

(assert (=> b!337413 m!341223))

(assert (=> b!337413 m!341223))

(declare-fun m!341225 () Bool)

(assert (=> b!337413 m!341225))

(check-sat (not b!337410) (not b_next!7069) tp_is_empty!7021 (not b!337406) (not b!337409) (not start!33876) (not b!337413) b_and!14269 (not b!337412) (not mapNonEmpty!11937) (not b!337415) (not b!337408))
(check-sat b_and!14269 (not b_next!7069))
