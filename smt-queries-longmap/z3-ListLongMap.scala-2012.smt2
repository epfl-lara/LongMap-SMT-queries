; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35098 () Bool)

(assert start!35098)

(declare-fun b_free!7743 () Bool)

(declare-fun b_next!7743 () Bool)

(assert (=> start!35098 (= b_free!7743 (not b_next!7743))))

(declare-fun tp!26813 () Bool)

(declare-fun b_and!14977 () Bool)

(assert (=> start!35098 (= tp!26813 b_and!14977)))

(declare-fun b!351792 () Bool)

(declare-fun e!215434 () Bool)

(declare-fun tp_is_empty!7695 () Bool)

(assert (=> b!351792 (= e!215434 tp_is_empty!7695)))

(declare-fun b!351793 () Bool)

(declare-fun res!195088 () Bool)

(declare-fun e!215431 () Bool)

(assert (=> b!351793 (=> (not res!195088) (not e!215431))))

(declare-datatypes ((array!18979 0))(
  ( (array!18980 (arr!8993 (Array (_ BitVec 32) (_ BitVec 64))) (size!9345 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18979)

(declare-datatypes ((List!5232 0))(
  ( (Nil!5229) (Cons!5228 (h!6084 (_ BitVec 64)) (t!10374 List!5232)) )
))
(declare-fun arrayNoDuplicates!0 (array!18979 (_ BitVec 32) List!5232) Bool)

(assert (=> b!351793 (= res!195088 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5229))))

(declare-fun b!351794 () Bool)

(declare-fun e!215436 () Bool)

(assert (=> b!351794 (= e!215436 (not true))))

(assert (=> b!351794 false))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((Unit!10870 0))(
  ( (Unit!10871) )
))
(declare-fun lt!164974 () Unit!10870)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11237 0))(
  ( (V!11238 (val!3892 Int)) )
))
(declare-fun zeroValue!1467 () V!11237)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3504 0))(
  ( (ValueCellFull!3504 (v!6081 V!11237)) (EmptyCell!3504) )
))
(declare-datatypes ((array!18981 0))(
  ( (array!18982 (arr!8994 (Array (_ BitVec 32) ValueCell!3504)) (size!9346 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18981)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11237)

(declare-fun lemmaArrayContainsKeyThenInListMap!328 (array!18979 array!18981 (_ BitVec 32) (_ BitVec 32) V!11237 V!11237 (_ BitVec 64) (_ BitVec 32) Int) Unit!10870)

(declare-fun arrayScanForKey!0 (array!18979 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351794 (= lt!164974 (lemmaArrayContainsKeyThenInListMap!328 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun mapIsEmpty!13020 () Bool)

(declare-fun mapRes!13020 () Bool)

(assert (=> mapIsEmpty!13020 mapRes!13020))

(declare-fun b!351795 () Bool)

(declare-fun res!195084 () Bool)

(assert (=> b!351795 (=> (not res!195084) (not e!215431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351795 (= res!195084 (validKeyInArray!0 k0!1348))))

(declare-fun b!351796 () Bool)

(declare-fun res!195089 () Bool)

(assert (=> b!351796 (=> (not res!195089) (not e!215431))))

(declare-datatypes ((tuple2!5612 0))(
  ( (tuple2!5613 (_1!2817 (_ BitVec 64)) (_2!2817 V!11237)) )
))
(declare-datatypes ((List!5233 0))(
  ( (Nil!5230) (Cons!5229 (h!6085 tuple2!5612) (t!10375 List!5233)) )
))
(declare-datatypes ((ListLongMap!4525 0))(
  ( (ListLongMap!4526 (toList!2278 List!5233)) )
))
(declare-fun contains!2349 (ListLongMap!4525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1799 (array!18979 array!18981 (_ BitVec 32) (_ BitVec 32) V!11237 V!11237 (_ BitVec 32) Int) ListLongMap!4525)

(assert (=> b!351796 (= res!195089 (not (contains!2349 (getCurrentListMap!1799 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351797 () Bool)

(assert (=> b!351797 (= e!215431 e!215436)))

(declare-fun res!195083 () Bool)

(assert (=> b!351797 (=> (not res!195083) (not e!215436))))

(declare-datatypes ((SeekEntryResult!3460 0))(
  ( (MissingZero!3460 (index!16019 (_ BitVec 32))) (Found!3460 (index!16020 (_ BitVec 32))) (Intermediate!3460 (undefined!4272 Bool) (index!16021 (_ BitVec 32)) (x!35008 (_ BitVec 32))) (Undefined!3460) (MissingVacant!3460 (index!16022 (_ BitVec 32))) )
))
(declare-fun lt!164973 () SeekEntryResult!3460)

(get-info :version)

(assert (=> b!351797 (= res!195083 (and (not ((_ is Found!3460) lt!164973)) (not ((_ is MissingZero!3460) lt!164973)) ((_ is MissingVacant!3460) lt!164973)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18979 (_ BitVec 32)) SeekEntryResult!3460)

(assert (=> b!351797 (= lt!164973 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351798 () Bool)

(declare-fun res!195085 () Bool)

(assert (=> b!351798 (=> (not res!195085) (not e!215431))))

(assert (=> b!351798 (= res!195085 (and (= (size!9346 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9345 _keys!1895) (size!9346 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351799 () Bool)

(declare-fun res!195086 () Bool)

(assert (=> b!351799 (=> (not res!195086) (not e!215431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18979 (_ BitVec 32)) Bool)

(assert (=> b!351799 (= res!195086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351800 () Bool)

(declare-fun res!195082 () Bool)

(assert (=> b!351800 (=> (not res!195082) (not e!215436))))

(declare-fun arrayContainsKey!0 (array!18979 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351800 (= res!195082 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351801 () Bool)

(declare-fun e!215433 () Bool)

(assert (=> b!351801 (= e!215433 (and e!215434 mapRes!13020))))

(declare-fun condMapEmpty!13020 () Bool)

(declare-fun mapDefault!13020 () ValueCell!3504)

(assert (=> b!351801 (= condMapEmpty!13020 (= (arr!8994 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3504)) mapDefault!13020)))))

(declare-fun b!351802 () Bool)

(declare-fun e!215435 () Bool)

(assert (=> b!351802 (= e!215435 tp_is_empty!7695)))

(declare-fun mapNonEmpty!13020 () Bool)

(declare-fun tp!26814 () Bool)

(assert (=> mapNonEmpty!13020 (= mapRes!13020 (and tp!26814 e!215435))))

(declare-fun mapRest!13020 () (Array (_ BitVec 32) ValueCell!3504))

(declare-fun mapKey!13020 () (_ BitVec 32))

(declare-fun mapValue!13020 () ValueCell!3504)

(assert (=> mapNonEmpty!13020 (= (arr!8994 _values!1525) (store mapRest!13020 mapKey!13020 mapValue!13020))))

(declare-fun res!195087 () Bool)

(assert (=> start!35098 (=> (not res!195087) (not e!215431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35098 (= res!195087 (validMask!0 mask!2385))))

(assert (=> start!35098 e!215431))

(assert (=> start!35098 true))

(assert (=> start!35098 tp_is_empty!7695))

(assert (=> start!35098 tp!26813))

(declare-fun array_inv!6634 (array!18981) Bool)

(assert (=> start!35098 (and (array_inv!6634 _values!1525) e!215433)))

(declare-fun array_inv!6635 (array!18979) Bool)

(assert (=> start!35098 (array_inv!6635 _keys!1895)))

(assert (= (and start!35098 res!195087) b!351798))

(assert (= (and b!351798 res!195085) b!351799))

(assert (= (and b!351799 res!195086) b!351793))

(assert (= (and b!351793 res!195088) b!351795))

(assert (= (and b!351795 res!195084) b!351796))

(assert (= (and b!351796 res!195089) b!351797))

(assert (= (and b!351797 res!195083) b!351800))

(assert (= (and b!351800 res!195082) b!351794))

(assert (= (and b!351801 condMapEmpty!13020) mapIsEmpty!13020))

(assert (= (and b!351801 (not condMapEmpty!13020)) mapNonEmpty!13020))

(assert (= (and mapNonEmpty!13020 ((_ is ValueCellFull!3504) mapValue!13020)) b!351802))

(assert (= (and b!351801 ((_ is ValueCellFull!3504) mapDefault!13020)) b!351792))

(assert (= start!35098 b!351801))

(declare-fun m!351621 () Bool)

(assert (=> start!35098 m!351621))

(declare-fun m!351623 () Bool)

(assert (=> start!35098 m!351623))

(declare-fun m!351625 () Bool)

(assert (=> start!35098 m!351625))

(declare-fun m!351627 () Bool)

(assert (=> b!351796 m!351627))

(assert (=> b!351796 m!351627))

(declare-fun m!351629 () Bool)

(assert (=> b!351796 m!351629))

(declare-fun m!351631 () Bool)

(assert (=> b!351795 m!351631))

(declare-fun m!351633 () Bool)

(assert (=> b!351797 m!351633))

(declare-fun m!351635 () Bool)

(assert (=> b!351794 m!351635))

(assert (=> b!351794 m!351635))

(declare-fun m!351637 () Bool)

(assert (=> b!351794 m!351637))

(declare-fun m!351639 () Bool)

(assert (=> mapNonEmpty!13020 m!351639))

(declare-fun m!351641 () Bool)

(assert (=> b!351800 m!351641))

(declare-fun m!351643 () Bool)

(assert (=> b!351799 m!351643))

(declare-fun m!351645 () Bool)

(assert (=> b!351793 m!351645))

(check-sat (not start!35098) (not b_next!7743) (not b!351796) (not b!351799) (not b!351793) b_and!14977 (not b!351794) (not mapNonEmpty!13020) tp_is_empty!7695 (not b!351797) (not b!351800) (not b!351795))
(check-sat b_and!14977 (not b_next!7743))
