; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35206 () Bool)

(assert start!35206)

(declare-fun b_free!7795 () Bool)

(declare-fun b_next!7795 () Bool)

(assert (=> start!35206 (= b_free!7795 (not b_next!7795))))

(declare-fun tp!26979 () Bool)

(declare-fun b_and!15049 () Bool)

(assert (=> start!35206 (= tp!26979 b_and!15049)))

(declare-fun res!195776 () Bool)

(declare-fun e!216164 () Bool)

(assert (=> start!35206 (=> (not res!195776) (not e!216164))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35206 (= res!195776 (validMask!0 mask!2385))))

(assert (=> start!35206 e!216164))

(assert (=> start!35206 true))

(declare-fun tp_is_empty!7747 () Bool)

(assert (=> start!35206 tp_is_empty!7747))

(assert (=> start!35206 tp!26979))

(declare-datatypes ((V!11307 0))(
  ( (V!11308 (val!3918 Int)) )
))
(declare-datatypes ((ValueCell!3530 0))(
  ( (ValueCellFull!3530 (v!6111 V!11307)) (EmptyCell!3530) )
))
(declare-datatypes ((array!19076 0))(
  ( (array!19077 (arr!9038 (Array (_ BitVec 32) ValueCell!3530)) (size!9390 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19076)

(declare-fun e!216162 () Bool)

(declare-fun array_inv!6676 (array!19076) Bool)

(assert (=> start!35206 (and (array_inv!6676 _values!1525) e!216162)))

(declare-datatypes ((array!19078 0))(
  ( (array!19079 (arr!9039 (Array (_ BitVec 32) (_ BitVec 64))) (size!9391 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19078)

(declare-fun array_inv!6677 (array!19078) Bool)

(assert (=> start!35206 (array_inv!6677 _keys!1895)))

(declare-fun b!353016 () Bool)

(declare-fun res!195774 () Bool)

(assert (=> b!353016 (=> (not res!195774) (not e!216164))))

(declare-datatypes ((List!5169 0))(
  ( (Nil!5166) (Cons!5165 (h!6021 (_ BitVec 64)) (t!10309 List!5169)) )
))
(declare-fun arrayNoDuplicates!0 (array!19078 (_ BitVec 32) List!5169) Bool)

(assert (=> b!353016 (= res!195774 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5166))))

(declare-fun b!353017 () Bool)

(declare-fun e!216160 () Bool)

(declare-fun mapRes!13107 () Bool)

(assert (=> b!353017 (= e!216162 (and e!216160 mapRes!13107))))

(declare-fun condMapEmpty!13107 () Bool)

(declare-fun mapDefault!13107 () ValueCell!3530)

(assert (=> b!353017 (= condMapEmpty!13107 (= (arr!9038 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3530)) mapDefault!13107)))))

(declare-fun b!353018 () Bool)

(assert (=> b!353018 (= e!216160 tp_is_empty!7747)))

(declare-fun b!353019 () Bool)

(declare-fun res!195778 () Bool)

(assert (=> b!353019 (=> (not res!195778) (not e!216164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19078 (_ BitVec 32)) Bool)

(assert (=> b!353019 (= res!195778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!353020 () Bool)

(assert (=> b!353020 (= e!216164 false)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3430 0))(
  ( (MissingZero!3430 (index!15899 (_ BitVec 32))) (Found!3430 (index!15900 (_ BitVec 32))) (Intermediate!3430 (undefined!4242 Bool) (index!15901 (_ BitVec 32)) (x!35077 (_ BitVec 32))) (Undefined!3430) (MissingVacant!3430 (index!15902 (_ BitVec 32))) )
))
(declare-fun lt!165472 () SeekEntryResult!3430)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19078 (_ BitVec 32)) SeekEntryResult!3430)

(assert (=> b!353020 (= lt!165472 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!353021 () Bool)

(declare-fun e!216163 () Bool)

(assert (=> b!353021 (= e!216163 tp_is_empty!7747)))

(declare-fun mapIsEmpty!13107 () Bool)

(assert (=> mapIsEmpty!13107 mapRes!13107))

(declare-fun b!353022 () Bool)

(declare-fun res!195775 () Bool)

(assert (=> b!353022 (=> (not res!195775) (not e!216164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!353022 (= res!195775 (validKeyInArray!0 k0!1348))))

(declare-fun mapNonEmpty!13107 () Bool)

(declare-fun tp!26978 () Bool)

(assert (=> mapNonEmpty!13107 (= mapRes!13107 (and tp!26978 e!216163))))

(declare-fun mapRest!13107 () (Array (_ BitVec 32) ValueCell!3530))

(declare-fun mapKey!13107 () (_ BitVec 32))

(declare-fun mapValue!13107 () ValueCell!3530)

(assert (=> mapNonEmpty!13107 (= (arr!9038 _values!1525) (store mapRest!13107 mapKey!13107 mapValue!13107))))

(declare-fun b!353023 () Bool)

(declare-fun res!195777 () Bool)

(assert (=> b!353023 (=> (not res!195777) (not e!216164))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!353023 (= res!195777 (and (= (size!9390 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9391 _keys!1895) (size!9390 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!353024 () Bool)

(declare-fun res!195779 () Bool)

(assert (=> b!353024 (=> (not res!195779) (not e!216164))))

(declare-fun zeroValue!1467 () V!11307)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11307)

(declare-datatypes ((tuple2!5562 0))(
  ( (tuple2!5563 (_1!2792 (_ BitVec 64)) (_2!2792 V!11307)) )
))
(declare-datatypes ((List!5170 0))(
  ( (Nil!5167) (Cons!5166 (h!6022 tuple2!5562) (t!10310 List!5170)) )
))
(declare-datatypes ((ListLongMap!4477 0))(
  ( (ListLongMap!4478 (toList!2254 List!5170)) )
))
(declare-fun contains!2347 (ListLongMap!4477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1782 (array!19078 array!19076 (_ BitVec 32) (_ BitVec 32) V!11307 V!11307 (_ BitVec 32) Int) ListLongMap!4477)

(assert (=> b!353024 (= res!195779 (not (contains!2347 (getCurrentListMap!1782 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!35206 res!195776) b!353023))

(assert (= (and b!353023 res!195777) b!353019))

(assert (= (and b!353019 res!195778) b!353016))

(assert (= (and b!353016 res!195774) b!353022))

(assert (= (and b!353022 res!195775) b!353024))

(assert (= (and b!353024 res!195779) b!353020))

(assert (= (and b!353017 condMapEmpty!13107) mapIsEmpty!13107))

(assert (= (and b!353017 (not condMapEmpty!13107)) mapNonEmpty!13107))

(get-info :version)

(assert (= (and mapNonEmpty!13107 ((_ is ValueCellFull!3530) mapValue!13107)) b!353021))

(assert (= (and b!353017 ((_ is ValueCellFull!3530) mapDefault!13107)) b!353018))

(assert (= start!35206 b!353017))

(declare-fun m!352765 () Bool)

(assert (=> b!353020 m!352765))

(declare-fun m!352767 () Bool)

(assert (=> mapNonEmpty!13107 m!352767))

(declare-fun m!352769 () Bool)

(assert (=> b!353022 m!352769))

(declare-fun m!352771 () Bool)

(assert (=> b!353019 m!352771))

(declare-fun m!352773 () Bool)

(assert (=> start!35206 m!352773))

(declare-fun m!352775 () Bool)

(assert (=> start!35206 m!352775))

(declare-fun m!352777 () Bool)

(assert (=> start!35206 m!352777))

(declare-fun m!352779 () Bool)

(assert (=> b!353024 m!352779))

(assert (=> b!353024 m!352779))

(declare-fun m!352781 () Bool)

(assert (=> b!353024 m!352781))

(declare-fun m!352783 () Bool)

(assert (=> b!353016 m!352783))

(check-sat (not b!353020) (not b!353024) b_and!15049 (not b_next!7795) (not start!35206) (not b!353022) (not mapNonEmpty!13107) tp_is_empty!7747 (not b!353016) (not b!353019))
(check-sat b_and!15049 (not b_next!7795))
