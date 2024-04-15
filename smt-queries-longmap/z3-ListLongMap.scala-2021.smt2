; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35206 () Bool)

(assert start!35206)

(declare-fun b_free!7795 () Bool)

(declare-fun b_next!7795 () Bool)

(assert (=> start!35206 (= b_free!7795 (not b_next!7795))))

(declare-fun tp!26979 () Bool)

(declare-fun b_and!15009 () Bool)

(assert (=> start!35206 (= tp!26979 b_and!15009)))

(declare-fun b!352794 () Bool)

(declare-fun res!195649 () Bool)

(declare-fun e!216020 () Bool)

(assert (=> b!352794 (=> (not res!195649) (not e!216020))))

(declare-datatypes ((array!19063 0))(
  ( (array!19064 (arr!9032 (Array (_ BitVec 32) (_ BitVec 64))) (size!9385 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19063)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19063 (_ BitVec 32)) Bool)

(assert (=> b!352794 (= res!195649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!13107 () Bool)

(declare-fun mapRes!13107 () Bool)

(declare-fun tp!26978 () Bool)

(declare-fun e!216021 () Bool)

(assert (=> mapNonEmpty!13107 (= mapRes!13107 (and tp!26978 e!216021))))

(declare-datatypes ((V!11307 0))(
  ( (V!11308 (val!3918 Int)) )
))
(declare-datatypes ((ValueCell!3530 0))(
  ( (ValueCellFull!3530 (v!6104 V!11307)) (EmptyCell!3530) )
))
(declare-fun mapRest!13107 () (Array (_ BitVec 32) ValueCell!3530))

(declare-fun mapValue!13107 () ValueCell!3530)

(declare-fun mapKey!13107 () (_ BitVec 32))

(declare-datatypes ((array!19065 0))(
  ( (array!19066 (arr!9033 (Array (_ BitVec 32) ValueCell!3530)) (size!9386 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19065)

(assert (=> mapNonEmpty!13107 (= (arr!9033 _values!1525) (store mapRest!13107 mapKey!13107 mapValue!13107))))

(declare-fun b!352795 () Bool)

(declare-fun res!195651 () Bool)

(assert (=> b!352795 (=> (not res!195651) (not e!216020))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!352795 (= res!195651 (and (= (size!9386 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9385 _keys!1895) (size!9386 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!352796 () Bool)

(declare-fun e!216018 () Bool)

(declare-fun tp_is_empty!7747 () Bool)

(assert (=> b!352796 (= e!216018 tp_is_empty!7747)))

(declare-fun b!352797 () Bool)

(declare-fun res!195650 () Bool)

(assert (=> b!352797 (=> (not res!195650) (not e!216020))))

(declare-datatypes ((List!5239 0))(
  ( (Nil!5236) (Cons!5235 (h!6091 (_ BitVec 64)) (t!10378 List!5239)) )
))
(declare-fun arrayNoDuplicates!0 (array!19063 (_ BitVec 32) List!5239) Bool)

(assert (=> b!352797 (= res!195650 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5236))))

(declare-fun b!352798 () Bool)

(declare-fun res!195652 () Bool)

(assert (=> b!352798 (=> (not res!195652) (not e!216020))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11307)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11307)

(declare-datatypes ((tuple2!5626 0))(
  ( (tuple2!5627 (_1!2824 (_ BitVec 64)) (_2!2824 V!11307)) )
))
(declare-datatypes ((List!5240 0))(
  ( (Nil!5237) (Cons!5236 (h!6092 tuple2!5626) (t!10379 List!5240)) )
))
(declare-datatypes ((ListLongMap!4529 0))(
  ( (ListLongMap!4530 (toList!2280 List!5240)) )
))
(declare-fun contains!2365 (ListLongMap!4529 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1785 (array!19063 array!19065 (_ BitVec 32) (_ BitVec 32) V!11307 V!11307 (_ BitVec 32) Int) ListLongMap!4529)

(assert (=> b!352798 (= res!195652 (not (contains!2365 (getCurrentListMap!1785 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!352799 () Bool)

(assert (=> b!352799 (= e!216021 tp_is_empty!7747)))

(declare-fun b!352800 () Bool)

(declare-fun res!195653 () Bool)

(assert (=> b!352800 (=> (not res!195653) (not e!216020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!352800 (= res!195653 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!13107 () Bool)

(assert (=> mapIsEmpty!13107 mapRes!13107))

(declare-fun res!195648 () Bool)

(assert (=> start!35206 (=> (not res!195648) (not e!216020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35206 (= res!195648 (validMask!0 mask!2385))))

(assert (=> start!35206 e!216020))

(assert (=> start!35206 true))

(assert (=> start!35206 tp_is_empty!7747))

(assert (=> start!35206 tp!26979))

(declare-fun e!216022 () Bool)

(declare-fun array_inv!6688 (array!19065) Bool)

(assert (=> start!35206 (and (array_inv!6688 _values!1525) e!216022)))

(declare-fun array_inv!6689 (array!19063) Bool)

(assert (=> start!35206 (array_inv!6689 _keys!1895)))

(declare-fun b!352801 () Bool)

(assert (=> b!352801 (= e!216020 false)))

(declare-datatypes ((SeekEntryResult!3475 0))(
  ( (MissingZero!3475 (index!16079 (_ BitVec 32))) (Found!3475 (index!16080 (_ BitVec 32))) (Intermediate!3475 (undefined!4287 Bool) (index!16081 (_ BitVec 32)) (x!35120 (_ BitVec 32))) (Undefined!3475) (MissingVacant!3475 (index!16082 (_ BitVec 32))) )
))
(declare-fun lt!165219 () SeekEntryResult!3475)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!19063 (_ BitVec 32)) SeekEntryResult!3475)

(assert (=> b!352801 (= lt!165219 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!352802 () Bool)

(assert (=> b!352802 (= e!216022 (and e!216018 mapRes!13107))))

(declare-fun condMapEmpty!13107 () Bool)

(declare-fun mapDefault!13107 () ValueCell!3530)

(assert (=> b!352802 (= condMapEmpty!13107 (= (arr!9033 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3530)) mapDefault!13107)))))

(assert (= (and start!35206 res!195648) b!352795))

(assert (= (and b!352795 res!195651) b!352794))

(assert (= (and b!352794 res!195649) b!352797))

(assert (= (and b!352797 res!195650) b!352800))

(assert (= (and b!352800 res!195653) b!352798))

(assert (= (and b!352798 res!195652) b!352801))

(assert (= (and b!352802 condMapEmpty!13107) mapIsEmpty!13107))

(assert (= (and b!352802 (not condMapEmpty!13107)) mapNonEmpty!13107))

(get-info :version)

(assert (= (and mapNonEmpty!13107 ((_ is ValueCellFull!3530) mapValue!13107)) b!352799))

(assert (= (and b!352802 ((_ is ValueCellFull!3530) mapDefault!13107)) b!352796))

(assert (= start!35206 b!352802))

(declare-fun m!351811 () Bool)

(assert (=> b!352801 m!351811))

(declare-fun m!351813 () Bool)

(assert (=> b!352797 m!351813))

(declare-fun m!351815 () Bool)

(assert (=> start!35206 m!351815))

(declare-fun m!351817 () Bool)

(assert (=> start!35206 m!351817))

(declare-fun m!351819 () Bool)

(assert (=> start!35206 m!351819))

(declare-fun m!351821 () Bool)

(assert (=> mapNonEmpty!13107 m!351821))

(declare-fun m!351823 () Bool)

(assert (=> b!352800 m!351823))

(declare-fun m!351825 () Bool)

(assert (=> b!352798 m!351825))

(assert (=> b!352798 m!351825))

(declare-fun m!351827 () Bool)

(assert (=> b!352798 m!351827))

(declare-fun m!351829 () Bool)

(assert (=> b!352794 m!351829))

(check-sat b_and!15009 (not b!352801) (not b!352797) (not b!352798) (not b!352800) tp_is_empty!7747 (not b_next!7795) (not b!352794) (not start!35206) (not mapNonEmpty!13107))
(check-sat b_and!15009 (not b_next!7795))
