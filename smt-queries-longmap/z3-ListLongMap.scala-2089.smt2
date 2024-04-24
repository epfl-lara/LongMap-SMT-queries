; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35688 () Bool)

(assert start!35688)

(declare-fun res!199310 () Bool)

(declare-fun e!219506 () Bool)

(assert (=> start!35688 (=> (not res!199310) (not e!219506))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35688 (= res!199310 (validMask!0 mask!1842))))

(assert (=> start!35688 e!219506))

(assert (=> start!35688 true))

(declare-datatypes ((V!11851 0))(
  ( (V!11852 (val!4122 Int)) )
))
(declare-datatypes ((ValueCell!3734 0))(
  ( (ValueCellFull!3734 (v!6317 V!11851)) (EmptyCell!3734) )
))
(declare-datatypes ((array!19852 0))(
  ( (array!19853 (arr!9419 (Array (_ BitVec 32) ValueCell!3734)) (size!9771 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19852)

(declare-fun e!219505 () Bool)

(declare-fun array_inv!6960 (array!19852) Bool)

(assert (=> start!35688 (and (array_inv!6960 _values!1208) e!219505)))

(declare-datatypes ((array!19854 0))(
  ( (array!19855 (arr!9420 (Array (_ BitVec 32) (_ BitVec 64))) (size!9772 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19854)

(declare-fun array_inv!6961 (array!19854) Bool)

(assert (=> start!35688 (array_inv!6961 _keys!1456)))

(declare-fun b!358554 () Bool)

(declare-fun e!219507 () Bool)

(declare-fun mapRes!13740 () Bool)

(assert (=> b!358554 (= e!219505 (and e!219507 mapRes!13740))))

(declare-fun condMapEmpty!13740 () Bool)

(declare-fun mapDefault!13740 () ValueCell!3734)

(assert (=> b!358554 (= condMapEmpty!13740 (= (arr!9419 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3734)) mapDefault!13740)))))

(declare-fun b!358555 () Bool)

(assert (=> b!358555 (= e!219506 false)))

(declare-fun lt!166238 () Bool)

(declare-datatypes ((List!5346 0))(
  ( (Nil!5343) (Cons!5342 (h!6198 (_ BitVec 64)) (t!10488 List!5346)) )
))
(declare-fun arrayNoDuplicates!0 (array!19854 (_ BitVec 32) List!5346) Bool)

(assert (=> b!358555 (= lt!166238 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5343))))

(declare-fun b!358556 () Bool)

(declare-fun res!199311 () Bool)

(assert (=> b!358556 (=> (not res!199311) (not e!219506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19854 (_ BitVec 32)) Bool)

(assert (=> b!358556 (= res!199311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13740 () Bool)

(assert (=> mapIsEmpty!13740 mapRes!13740))

(declare-fun b!358557 () Bool)

(declare-fun tp_is_empty!8155 () Bool)

(assert (=> b!358557 (= e!219507 tp_is_empty!8155)))

(declare-fun b!358558 () Bool)

(declare-fun res!199312 () Bool)

(assert (=> b!358558 (=> (not res!199312) (not e!219506))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358558 (= res!199312 (and (= (size!9771 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9772 _keys!1456) (size!9771 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358559 () Bool)

(declare-fun e!219504 () Bool)

(assert (=> b!358559 (= e!219504 tp_is_empty!8155)))

(declare-fun mapNonEmpty!13740 () Bool)

(declare-fun tp!27798 () Bool)

(assert (=> mapNonEmpty!13740 (= mapRes!13740 (and tp!27798 e!219504))))

(declare-fun mapValue!13740 () ValueCell!3734)

(declare-fun mapRest!13740 () (Array (_ BitVec 32) ValueCell!3734))

(declare-fun mapKey!13740 () (_ BitVec 32))

(assert (=> mapNonEmpty!13740 (= (arr!9419 _values!1208) (store mapRest!13740 mapKey!13740 mapValue!13740))))

(assert (= (and start!35688 res!199310) b!358558))

(assert (= (and b!358558 res!199312) b!358556))

(assert (= (and b!358556 res!199311) b!358555))

(assert (= (and b!358554 condMapEmpty!13740) mapIsEmpty!13740))

(assert (= (and b!358554 (not condMapEmpty!13740)) mapNonEmpty!13740))

(get-info :version)

(assert (= (and mapNonEmpty!13740 ((_ is ValueCellFull!3734) mapValue!13740)) b!358559))

(assert (= (and b!358554 ((_ is ValueCellFull!3734) mapDefault!13740)) b!358557))

(assert (= start!35688 b!358554))

(declare-fun m!356607 () Bool)

(assert (=> start!35688 m!356607))

(declare-fun m!356609 () Bool)

(assert (=> start!35688 m!356609))

(declare-fun m!356611 () Bool)

(assert (=> start!35688 m!356611))

(declare-fun m!356613 () Bool)

(assert (=> b!358555 m!356613))

(declare-fun m!356615 () Bool)

(assert (=> b!358556 m!356615))

(declare-fun m!356617 () Bool)

(assert (=> mapNonEmpty!13740 m!356617))

(check-sat (not mapNonEmpty!13740) (not start!35688) (not b!358556) tp_is_empty!8155 (not b!358555))
(check-sat)
