; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35688 () Bool)

(assert start!35688)

(declare-fun b!358332 () Bool)

(declare-fun res!199186 () Bool)

(declare-fun e!219363 () Bool)

(assert (=> b!358332 (=> (not res!199186) (not e!219363))))

(declare-datatypes ((array!19857 0))(
  ( (array!19858 (arr!9422 (Array (_ BitVec 32) (_ BitVec 64))) (size!9775 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19857)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19857 (_ BitVec 32)) Bool)

(assert (=> b!358332 (= res!199186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13740 () Bool)

(declare-fun mapRes!13740 () Bool)

(declare-fun tp!27798 () Bool)

(declare-fun e!219362 () Bool)

(assert (=> mapNonEmpty!13740 (= mapRes!13740 (and tp!27798 e!219362))))

(declare-datatypes ((V!11851 0))(
  ( (V!11852 (val!4122 Int)) )
))
(declare-datatypes ((ValueCell!3734 0))(
  ( (ValueCellFull!3734 (v!6310 V!11851)) (EmptyCell!3734) )
))
(declare-fun mapValue!13740 () ValueCell!3734)

(declare-fun mapKey!13740 () (_ BitVec 32))

(declare-fun mapRest!13740 () (Array (_ BitVec 32) ValueCell!3734))

(declare-datatypes ((array!19859 0))(
  ( (array!19860 (arr!9423 (Array (_ BitVec 32) ValueCell!3734)) (size!9776 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19859)

(assert (=> mapNonEmpty!13740 (= (arr!9423 _values!1208) (store mapRest!13740 mapKey!13740 mapValue!13740))))

(declare-fun mapIsEmpty!13740 () Bool)

(assert (=> mapIsEmpty!13740 mapRes!13740))

(declare-fun b!358333 () Bool)

(assert (=> b!358333 (= e!219363 false)))

(declare-fun lt!165985 () Bool)

(declare-datatypes ((List!5402 0))(
  ( (Nil!5399) (Cons!5398 (h!6254 (_ BitVec 64)) (t!10543 List!5402)) )
))
(declare-fun arrayNoDuplicates!0 (array!19857 (_ BitVec 32) List!5402) Bool)

(assert (=> b!358333 (= lt!165985 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5399))))

(declare-fun b!358334 () Bool)

(declare-fun e!219365 () Bool)

(declare-fun e!219366 () Bool)

(assert (=> b!358334 (= e!219365 (and e!219366 mapRes!13740))))

(declare-fun condMapEmpty!13740 () Bool)

(declare-fun mapDefault!13740 () ValueCell!3734)

(assert (=> b!358334 (= condMapEmpty!13740 (= (arr!9423 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3734)) mapDefault!13740)))))

(declare-fun b!358335 () Bool)

(declare-fun tp_is_empty!8155 () Bool)

(assert (=> b!358335 (= e!219366 tp_is_empty!8155)))

(declare-fun b!358336 () Bool)

(assert (=> b!358336 (= e!219362 tp_is_empty!8155)))

(declare-fun b!358337 () Bool)

(declare-fun res!199185 () Bool)

(assert (=> b!358337 (=> (not res!199185) (not e!219363))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358337 (= res!199185 (and (= (size!9776 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9775 _keys!1456) (size!9776 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199184 () Bool)

(assert (=> start!35688 (=> (not res!199184) (not e!219363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35688 (= res!199184 (validMask!0 mask!1842))))

(assert (=> start!35688 e!219363))

(assert (=> start!35688 true))

(declare-fun array_inv!6954 (array!19859) Bool)

(assert (=> start!35688 (and (array_inv!6954 _values!1208) e!219365)))

(declare-fun array_inv!6955 (array!19857) Bool)

(assert (=> start!35688 (array_inv!6955 _keys!1456)))

(assert (= (and start!35688 res!199184) b!358337))

(assert (= (and b!358337 res!199185) b!358332))

(assert (= (and b!358332 res!199186) b!358333))

(assert (= (and b!358334 condMapEmpty!13740) mapIsEmpty!13740))

(assert (= (and b!358334 (not condMapEmpty!13740)) mapNonEmpty!13740))

(get-info :version)

(assert (= (and mapNonEmpty!13740 ((_ is ValueCellFull!3734) mapValue!13740)) b!358336))

(assert (= (and b!358334 ((_ is ValueCellFull!3734) mapDefault!13740)) b!358335))

(assert (= start!35688 b!358334))

(declare-fun m!355653 () Bool)

(assert (=> b!358332 m!355653))

(declare-fun m!355655 () Bool)

(assert (=> mapNonEmpty!13740 m!355655))

(declare-fun m!355657 () Bool)

(assert (=> b!358333 m!355657))

(declare-fun m!355659 () Bool)

(assert (=> start!35688 m!355659))

(declare-fun m!355661 () Bool)

(assert (=> start!35688 m!355661))

(declare-fun m!355663 () Bool)

(assert (=> start!35688 m!355663))

(check-sat (not start!35688) tp_is_empty!8155 (not mapNonEmpty!13740) (not b!358333) (not b!358332))
(check-sat)
