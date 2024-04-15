; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35352 () Bool)

(assert start!35352)

(declare-fun mapNonEmpty!13236 () Bool)

(declare-fun mapRes!13236 () Bool)

(declare-fun tp!27132 () Bool)

(declare-fun e!216761 () Bool)

(assert (=> mapNonEmpty!13236 (= mapRes!13236 (and tp!27132 e!216761))))

(declare-fun mapKey!13236 () (_ BitVec 32))

(declare-datatypes ((V!11403 0))(
  ( (V!11404 (val!3954 Int)) )
))
(declare-datatypes ((ValueCell!3566 0))(
  ( (ValueCellFull!3566 (v!6142 V!11403)) (EmptyCell!3566) )
))
(declare-fun mapValue!13236 () ValueCell!3566)

(declare-fun mapRest!13236 () (Array (_ BitVec 32) ValueCell!3566))

(declare-datatypes ((array!19211 0))(
  ( (array!19212 (arr!9099 (Array (_ BitVec 32) ValueCell!3566)) (size!9452 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19211)

(assert (=> mapNonEmpty!13236 (= (arr!9099 _values!1208) (store mapRest!13236 mapKey!13236 mapValue!13236))))

(declare-fun mapIsEmpty!13236 () Bool)

(assert (=> mapIsEmpty!13236 mapRes!13236))

(declare-fun b!353805 () Bool)

(declare-fun tp_is_empty!7819 () Bool)

(assert (=> b!353805 (= e!216761 tp_is_empty!7819)))

(declare-fun b!353806 () Bool)

(declare-fun res!196169 () Bool)

(declare-fun e!216763 () Bool)

(assert (=> b!353806 (=> (not res!196169) (not e!216763))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19213 0))(
  ( (array!19214 (arr!9100 (Array (_ BitVec 32) (_ BitVec 64))) (size!9453 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19213)

(assert (=> b!353806 (= res!196169 (and (= (size!9452 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9453 _keys!1456) (size!9452 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353807 () Bool)

(declare-fun res!196171 () Bool)

(assert (=> b!353807 (=> (not res!196171) (not e!216763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19213 (_ BitVec 32)) Bool)

(assert (=> b!353807 (= res!196171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353808 () Bool)

(assert (=> b!353808 (= e!216763 false)))

(declare-fun lt!165409 () Bool)

(declare-datatypes ((List!5258 0))(
  ( (Nil!5255) (Cons!5254 (h!6110 (_ BitVec 64)) (t!10399 List!5258)) )
))
(declare-fun arrayNoDuplicates!0 (array!19213 (_ BitVec 32) List!5258) Bool)

(assert (=> b!353808 (= lt!165409 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5255))))

(declare-fun res!196170 () Bool)

(assert (=> start!35352 (=> (not res!196170) (not e!216763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35352 (= res!196170 (validMask!0 mask!1842))))

(assert (=> start!35352 e!216763))

(assert (=> start!35352 true))

(declare-fun e!216762 () Bool)

(declare-fun array_inv!6738 (array!19211) Bool)

(assert (=> start!35352 (and (array_inv!6738 _values!1208) e!216762)))

(declare-fun array_inv!6739 (array!19213) Bool)

(assert (=> start!35352 (array_inv!6739 _keys!1456)))

(declare-fun b!353809 () Bool)

(declare-fun e!216765 () Bool)

(assert (=> b!353809 (= e!216762 (and e!216765 mapRes!13236))))

(declare-fun condMapEmpty!13236 () Bool)

(declare-fun mapDefault!13236 () ValueCell!3566)

(assert (=> b!353809 (= condMapEmpty!13236 (= (arr!9099 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3566)) mapDefault!13236)))))

(declare-fun b!353810 () Bool)

(assert (=> b!353810 (= e!216765 tp_is_empty!7819)))

(assert (= (and start!35352 res!196170) b!353806))

(assert (= (and b!353806 res!196169) b!353807))

(assert (= (and b!353807 res!196171) b!353808))

(assert (= (and b!353809 condMapEmpty!13236) mapIsEmpty!13236))

(assert (= (and b!353809 (not condMapEmpty!13236)) mapNonEmpty!13236))

(get-info :version)

(assert (= (and mapNonEmpty!13236 ((_ is ValueCellFull!3566) mapValue!13236)) b!353805))

(assert (= (and b!353809 ((_ is ValueCellFull!3566) mapDefault!13236)) b!353810))

(assert (= start!35352 b!353809))

(declare-fun m!352485 () Bool)

(assert (=> mapNonEmpty!13236 m!352485))

(declare-fun m!352487 () Bool)

(assert (=> b!353807 m!352487))

(declare-fun m!352489 () Bool)

(assert (=> b!353808 m!352489))

(declare-fun m!352491 () Bool)

(assert (=> start!35352 m!352491))

(declare-fun m!352493 () Bool)

(assert (=> start!35352 m!352493))

(declare-fun m!352495 () Bool)

(assert (=> start!35352 m!352495))

(check-sat tp_is_empty!7819 (not b!353808) (not start!35352) (not mapNonEmpty!13236) (not b!353807))
(check-sat)
