; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35712 () Bool)

(assert start!35712)

(declare-fun mapIsEmpty!13776 () Bool)

(declare-fun mapRes!13776 () Bool)

(assert (=> mapIsEmpty!13776 mapRes!13776))

(declare-fun b!358770 () Bool)

(declare-fun res!199418 () Bool)

(declare-fun e!219684 () Bool)

(assert (=> b!358770 (=> (not res!199418) (not e!219684))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19896 0))(
  ( (array!19897 (arr!9441 (Array (_ BitVec 32) (_ BitVec 64))) (size!9793 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19896)

(declare-datatypes ((V!11883 0))(
  ( (V!11884 (val!4134 Int)) )
))
(declare-datatypes ((ValueCell!3746 0))(
  ( (ValueCellFull!3746 (v!6329 V!11883)) (EmptyCell!3746) )
))
(declare-datatypes ((array!19898 0))(
  ( (array!19899 (arr!9442 (Array (_ BitVec 32) ValueCell!3746)) (size!9794 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19898)

(assert (=> b!358770 (= res!199418 (and (= (size!9794 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9793 _keys!1456) (size!9794 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13776 () Bool)

(declare-fun tp!27834 () Bool)

(declare-fun e!219685 () Bool)

(assert (=> mapNonEmpty!13776 (= mapRes!13776 (and tp!27834 e!219685))))

(declare-fun mapValue!13776 () ValueCell!3746)

(declare-fun mapKey!13776 () (_ BitVec 32))

(declare-fun mapRest!13776 () (Array (_ BitVec 32) ValueCell!3746))

(assert (=> mapNonEmpty!13776 (= (arr!9442 _values!1208) (store mapRest!13776 mapKey!13776 mapValue!13776))))

(declare-fun b!358771 () Bool)

(assert (=> b!358771 (= e!219684 false)))

(declare-fun lt!166274 () Bool)

(declare-datatypes ((List!5355 0))(
  ( (Nil!5352) (Cons!5351 (h!6207 (_ BitVec 64)) (t!10497 List!5355)) )
))
(declare-fun arrayNoDuplicates!0 (array!19896 (_ BitVec 32) List!5355) Bool)

(assert (=> b!358771 (= lt!166274 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5352))))

(declare-fun b!358772 () Bool)

(declare-fun tp_is_empty!8179 () Bool)

(assert (=> b!358772 (= e!219685 tp_is_empty!8179)))

(declare-fun b!358773 () Bool)

(declare-fun e!219686 () Bool)

(declare-fun e!219688 () Bool)

(assert (=> b!358773 (= e!219686 (and e!219688 mapRes!13776))))

(declare-fun condMapEmpty!13776 () Bool)

(declare-fun mapDefault!13776 () ValueCell!3746)

(assert (=> b!358773 (= condMapEmpty!13776 (= (arr!9442 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3746)) mapDefault!13776)))))

(declare-fun b!358775 () Bool)

(declare-fun res!199419 () Bool)

(assert (=> b!358775 (=> (not res!199419) (not e!219684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19896 (_ BitVec 32)) Bool)

(assert (=> b!358775 (= res!199419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199420 () Bool)

(assert (=> start!35712 (=> (not res!199420) (not e!219684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35712 (= res!199420 (validMask!0 mask!1842))))

(assert (=> start!35712 e!219684))

(assert (=> start!35712 true))

(declare-fun array_inv!6980 (array!19898) Bool)

(assert (=> start!35712 (and (array_inv!6980 _values!1208) e!219686)))

(declare-fun array_inv!6981 (array!19896) Bool)

(assert (=> start!35712 (array_inv!6981 _keys!1456)))

(declare-fun b!358774 () Bool)

(assert (=> b!358774 (= e!219688 tp_is_empty!8179)))

(assert (= (and start!35712 res!199420) b!358770))

(assert (= (and b!358770 res!199418) b!358775))

(assert (= (and b!358775 res!199419) b!358771))

(assert (= (and b!358773 condMapEmpty!13776) mapIsEmpty!13776))

(assert (= (and b!358773 (not condMapEmpty!13776)) mapNonEmpty!13776))

(get-info :version)

(assert (= (and mapNonEmpty!13776 ((_ is ValueCellFull!3746) mapValue!13776)) b!358772))

(assert (= (and b!358773 ((_ is ValueCellFull!3746) mapDefault!13776)) b!358774))

(assert (= start!35712 b!358773))

(declare-fun m!356751 () Bool)

(assert (=> mapNonEmpty!13776 m!356751))

(declare-fun m!356753 () Bool)

(assert (=> b!358771 m!356753))

(declare-fun m!356755 () Bool)

(assert (=> b!358775 m!356755))

(declare-fun m!356757 () Bool)

(assert (=> start!35712 m!356757))

(declare-fun m!356759 () Bool)

(assert (=> start!35712 m!356759))

(declare-fun m!356761 () Bool)

(assert (=> start!35712 m!356761))

(check-sat (not mapNonEmpty!13776) (not b!358775) (not b!358771) (not start!35712) tp_is_empty!8179)
(check-sat)
