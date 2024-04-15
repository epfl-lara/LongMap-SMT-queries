; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35712 () Bool)

(assert start!35712)

(declare-fun res!199293 () Bool)

(declare-fun e!219545 () Bool)

(assert (=> start!35712 (=> (not res!199293) (not e!219545))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35712 (= res!199293 (validMask!0 mask!1842))))

(assert (=> start!35712 e!219545))

(assert (=> start!35712 true))

(declare-datatypes ((V!11883 0))(
  ( (V!11884 (val!4134 Int)) )
))
(declare-datatypes ((ValueCell!3746 0))(
  ( (ValueCellFull!3746 (v!6322 V!11883)) (EmptyCell!3746) )
))
(declare-datatypes ((array!19901 0))(
  ( (array!19902 (arr!9444 (Array (_ BitVec 32) ValueCell!3746)) (size!9797 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19901)

(declare-fun e!219542 () Bool)

(declare-fun array_inv!6970 (array!19901) Bool)

(assert (=> start!35712 (and (array_inv!6970 _values!1208) e!219542)))

(declare-datatypes ((array!19903 0))(
  ( (array!19904 (arr!9445 (Array (_ BitVec 32) (_ BitVec 64))) (size!9798 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19903)

(declare-fun array_inv!6971 (array!19903) Bool)

(assert (=> start!35712 (array_inv!6971 _keys!1456)))

(declare-fun mapIsEmpty!13776 () Bool)

(declare-fun mapRes!13776 () Bool)

(assert (=> mapIsEmpty!13776 mapRes!13776))

(declare-fun b!358548 () Bool)

(declare-fun res!199294 () Bool)

(assert (=> b!358548 (=> (not res!199294) (not e!219545))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358548 (= res!199294 (and (= (size!9797 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9798 _keys!1456) (size!9797 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358549 () Bool)

(declare-fun e!219544 () Bool)

(assert (=> b!358549 (= e!219542 (and e!219544 mapRes!13776))))

(declare-fun condMapEmpty!13776 () Bool)

(declare-fun mapDefault!13776 () ValueCell!3746)

(assert (=> b!358549 (= condMapEmpty!13776 (= (arr!9444 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3746)) mapDefault!13776)))))

(declare-fun mapNonEmpty!13776 () Bool)

(declare-fun tp!27834 () Bool)

(declare-fun e!219546 () Bool)

(assert (=> mapNonEmpty!13776 (= mapRes!13776 (and tp!27834 e!219546))))

(declare-fun mapValue!13776 () ValueCell!3746)

(declare-fun mapKey!13776 () (_ BitVec 32))

(declare-fun mapRest!13776 () (Array (_ BitVec 32) ValueCell!3746))

(assert (=> mapNonEmpty!13776 (= (arr!9444 _values!1208) (store mapRest!13776 mapKey!13776 mapValue!13776))))

(declare-fun b!358550 () Bool)

(declare-fun tp_is_empty!8179 () Bool)

(assert (=> b!358550 (= e!219544 tp_is_empty!8179)))

(declare-fun b!358551 () Bool)

(assert (=> b!358551 (= e!219545 false)))

(declare-fun lt!166021 () Bool)

(declare-datatypes ((List!5410 0))(
  ( (Nil!5407) (Cons!5406 (h!6262 (_ BitVec 64)) (t!10551 List!5410)) )
))
(declare-fun arrayNoDuplicates!0 (array!19903 (_ BitVec 32) List!5410) Bool)

(assert (=> b!358551 (= lt!166021 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5407))))

(declare-fun b!358552 () Bool)

(declare-fun res!199292 () Bool)

(assert (=> b!358552 (=> (not res!199292) (not e!219545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19903 (_ BitVec 32)) Bool)

(assert (=> b!358552 (= res!199292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358553 () Bool)

(assert (=> b!358553 (= e!219546 tp_is_empty!8179)))

(assert (= (and start!35712 res!199293) b!358548))

(assert (= (and b!358548 res!199294) b!358552))

(assert (= (and b!358552 res!199292) b!358551))

(assert (= (and b!358549 condMapEmpty!13776) mapIsEmpty!13776))

(assert (= (and b!358549 (not condMapEmpty!13776)) mapNonEmpty!13776))

(get-info :version)

(assert (= (and mapNonEmpty!13776 ((_ is ValueCellFull!3746) mapValue!13776)) b!358553))

(assert (= (and b!358549 ((_ is ValueCellFull!3746) mapDefault!13776)) b!358550))

(assert (= start!35712 b!358549))

(declare-fun m!355797 () Bool)

(assert (=> start!35712 m!355797))

(declare-fun m!355799 () Bool)

(assert (=> start!35712 m!355799))

(declare-fun m!355801 () Bool)

(assert (=> start!35712 m!355801))

(declare-fun m!355803 () Bool)

(assert (=> mapNonEmpty!13776 m!355803))

(declare-fun m!355805 () Bool)

(assert (=> b!358551 m!355805))

(declare-fun m!355807 () Bool)

(assert (=> b!358552 m!355807))

(check-sat tp_is_empty!8179 (not start!35712) (not mapNonEmpty!13776) (not b!358551) (not b!358552))
(check-sat)
