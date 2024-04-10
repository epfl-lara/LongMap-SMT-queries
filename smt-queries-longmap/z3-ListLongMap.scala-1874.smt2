; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33680 () Bool)

(assert start!33680)

(declare-fun b_free!6915 () Bool)

(declare-fun b_next!6915 () Bool)

(assert (=> start!33680 (= b_free!6915 (not b_next!6915))))

(declare-fun tp!24248 () Bool)

(declare-fun b_and!14095 () Bool)

(assert (=> start!33680 (= tp!24248 b_and!14095)))

(declare-fun res!184499 () Bool)

(declare-fun e!205384 () Bool)

(assert (=> start!33680 (=> (not res!184499) (not e!205384))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33680 (= res!184499 (validMask!0 mask!2385))))

(assert (=> start!33680 e!205384))

(assert (=> start!33680 true))

(declare-fun tp_is_empty!6867 () Bool)

(assert (=> start!33680 tp_is_empty!6867))

(assert (=> start!33680 tp!24248))

(declare-datatypes ((V!10133 0))(
  ( (V!10134 (val!3478 Int)) )
))
(declare-datatypes ((ValueCell!3090 0))(
  ( (ValueCellFull!3090 (v!5640 V!10133)) (EmptyCell!3090) )
))
(declare-datatypes ((array!17327 0))(
  ( (array!17328 (arr!8194 (Array (_ BitVec 32) ValueCell!3090)) (size!8546 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17327)

(declare-fun e!205386 () Bool)

(declare-fun array_inv!6090 (array!17327) Bool)

(assert (=> start!33680 (and (array_inv!6090 _values!1525) e!205386)))

(declare-datatypes ((array!17329 0))(
  ( (array!17330 (arr!8195 (Array (_ BitVec 32) (_ BitVec 64))) (size!8547 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17329)

(declare-fun array_inv!6091 (array!17329) Bool)

(assert (=> start!33680 (array_inv!6091 _keys!1895)))

(declare-fun b!334602 () Bool)

(declare-fun res!184493 () Bool)

(assert (=> b!334602 (=> (not res!184493) (not e!205384))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10133)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10133)

(declare-datatypes ((tuple2!5048 0))(
  ( (tuple2!5049 (_1!2535 (_ BitVec 64)) (_2!2535 V!10133)) )
))
(declare-datatypes ((List!4673 0))(
  ( (Nil!4670) (Cons!4669 (h!5525 tuple2!5048) (t!9761 List!4673)) )
))
(declare-datatypes ((ListLongMap!3961 0))(
  ( (ListLongMap!3962 (toList!1996 List!4673)) )
))
(declare-fun contains!2040 (ListLongMap!3961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1524 (array!17329 array!17327 (_ BitVec 32) (_ BitVec 32) V!10133 V!10133 (_ BitVec 32) Int) ListLongMap!3961)

(assert (=> b!334602 (= res!184493 (not (contains!2040 (getCurrentListMap!1524 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!334603 () Bool)

(declare-fun e!205389 () Bool)

(assert (=> b!334603 (= e!205389 (not true))))

(declare-fun arrayContainsKey!0 (array!17329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334603 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3167 0))(
  ( (MissingZero!3167 (index!14847 (_ BitVec 32))) (Found!3167 (index!14848 (_ BitVec 32))) (Intermediate!3167 (undefined!3979 Bool) (index!14849 (_ BitVec 32)) (x!33341 (_ BitVec 32))) (Undefined!3167) (MissingVacant!3167 (index!14850 (_ BitVec 32))) )
))
(declare-fun lt!159553 () SeekEntryResult!3167)

(declare-datatypes ((Unit!10407 0))(
  ( (Unit!10408) )
))
(declare-fun lt!159552 () Unit!10407)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17329 (_ BitVec 64) (_ BitVec 32)) Unit!10407)

(assert (=> b!334603 (= lt!159552 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14848 lt!159553)))))

(declare-fun b!334604 () Bool)

(declare-fun res!184492 () Bool)

(assert (=> b!334604 (=> (not res!184492) (not e!205384))))

(declare-datatypes ((List!4674 0))(
  ( (Nil!4671) (Cons!4670 (h!5526 (_ BitVec 64)) (t!9762 List!4674)) )
))
(declare-fun arrayNoDuplicates!0 (array!17329 (_ BitVec 32) List!4674) Bool)

(assert (=> b!334604 (= res!184492 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4671))))

(declare-fun b!334605 () Bool)

(declare-fun e!205385 () Bool)

(declare-fun mapRes!11697 () Bool)

(assert (=> b!334605 (= e!205386 (and e!205385 mapRes!11697))))

(declare-fun condMapEmpty!11697 () Bool)

(declare-fun mapDefault!11697 () ValueCell!3090)

(assert (=> b!334605 (= condMapEmpty!11697 (= (arr!8194 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3090)) mapDefault!11697)))))

(declare-fun b!334606 () Bool)

(declare-fun e!205387 () Bool)

(assert (=> b!334606 (= e!205387 tp_is_empty!6867)))

(declare-fun b!334607 () Bool)

(declare-fun res!184498 () Bool)

(assert (=> b!334607 (=> (not res!184498) (not e!205389))))

(assert (=> b!334607 (= res!184498 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14848 lt!159553)))))

(declare-fun b!334608 () Bool)

(assert (=> b!334608 (= e!205384 e!205389)))

(declare-fun res!184497 () Bool)

(assert (=> b!334608 (=> (not res!184497) (not e!205389))))

(get-info :version)

(assert (=> b!334608 (= res!184497 (and ((_ is Found!3167) lt!159553) (= (select (arr!8195 _keys!1895) (index!14848 lt!159553)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17329 (_ BitVec 32)) SeekEntryResult!3167)

(assert (=> b!334608 (= lt!159553 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334609 () Bool)

(declare-fun res!184496 () Bool)

(assert (=> b!334609 (=> (not res!184496) (not e!205384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334609 (= res!184496 (validKeyInArray!0 k0!1348))))

(declare-fun b!334610 () Bool)

(declare-fun res!184495 () Bool)

(assert (=> b!334610 (=> (not res!184495) (not e!205384))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17329 (_ BitVec 32)) Bool)

(assert (=> b!334610 (= res!184495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11697 () Bool)

(assert (=> mapIsEmpty!11697 mapRes!11697))

(declare-fun b!334611 () Bool)

(declare-fun res!184494 () Bool)

(assert (=> b!334611 (=> (not res!184494) (not e!205384))))

(assert (=> b!334611 (= res!184494 (and (= (size!8546 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8547 _keys!1895) (size!8546 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334612 () Bool)

(assert (=> b!334612 (= e!205385 tp_is_empty!6867)))

(declare-fun mapNonEmpty!11697 () Bool)

(declare-fun tp!24249 () Bool)

(assert (=> mapNonEmpty!11697 (= mapRes!11697 (and tp!24249 e!205387))))

(declare-fun mapRest!11697 () (Array (_ BitVec 32) ValueCell!3090))

(declare-fun mapValue!11697 () ValueCell!3090)

(declare-fun mapKey!11697 () (_ BitVec 32))

(assert (=> mapNonEmpty!11697 (= (arr!8194 _values!1525) (store mapRest!11697 mapKey!11697 mapValue!11697))))

(assert (= (and start!33680 res!184499) b!334611))

(assert (= (and b!334611 res!184494) b!334610))

(assert (= (and b!334610 res!184495) b!334604))

(assert (= (and b!334604 res!184492) b!334609))

(assert (= (and b!334609 res!184496) b!334602))

(assert (= (and b!334602 res!184493) b!334608))

(assert (= (and b!334608 res!184497) b!334607))

(assert (= (and b!334607 res!184498) b!334603))

(assert (= (and b!334605 condMapEmpty!11697) mapIsEmpty!11697))

(assert (= (and b!334605 (not condMapEmpty!11697)) mapNonEmpty!11697))

(assert (= (and mapNonEmpty!11697 ((_ is ValueCellFull!3090) mapValue!11697)) b!334606))

(assert (= (and b!334605 ((_ is ValueCellFull!3090) mapDefault!11697)) b!334612))

(assert (= start!33680 b!334605))

(declare-fun m!338641 () Bool)

(assert (=> start!33680 m!338641))

(declare-fun m!338643 () Bool)

(assert (=> start!33680 m!338643))

(declare-fun m!338645 () Bool)

(assert (=> start!33680 m!338645))

(declare-fun m!338647 () Bool)

(assert (=> mapNonEmpty!11697 m!338647))

(declare-fun m!338649 () Bool)

(assert (=> b!334610 m!338649))

(declare-fun m!338651 () Bool)

(assert (=> b!334608 m!338651))

(declare-fun m!338653 () Bool)

(assert (=> b!334608 m!338653))

(declare-fun m!338655 () Bool)

(assert (=> b!334604 m!338655))

(declare-fun m!338657 () Bool)

(assert (=> b!334602 m!338657))

(assert (=> b!334602 m!338657))

(declare-fun m!338659 () Bool)

(assert (=> b!334602 m!338659))

(declare-fun m!338661 () Bool)

(assert (=> b!334607 m!338661))

(declare-fun m!338663 () Bool)

(assert (=> b!334609 m!338663))

(declare-fun m!338665 () Bool)

(assert (=> b!334603 m!338665))

(declare-fun m!338667 () Bool)

(assert (=> b!334603 m!338667))

(check-sat (not b!334603) (not b!334609) (not b!334608) (not mapNonEmpty!11697) (not b_next!6915) (not b!334602) (not start!33680) (not b!334610) tp_is_empty!6867 (not b!334604) b_and!14095 (not b!334607))
(check-sat b_and!14095 (not b_next!6915))
