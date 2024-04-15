; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35664 () Bool)

(assert start!35664)

(declare-fun b!358116 () Bool)

(declare-fun e!219183 () Bool)

(declare-fun tp_is_empty!8131 () Bool)

(assert (=> b!358116 (= e!219183 tp_is_empty!8131)))

(declare-fun b!358117 () Bool)

(declare-fun e!219182 () Bool)

(declare-fun e!219186 () Bool)

(declare-fun mapRes!13704 () Bool)

(assert (=> b!358117 (= e!219182 (and e!219186 mapRes!13704))))

(declare-fun condMapEmpty!13704 () Bool)

(declare-datatypes ((V!11819 0))(
  ( (V!11820 (val!4110 Int)) )
))
(declare-datatypes ((ValueCell!3722 0))(
  ( (ValueCellFull!3722 (v!6298 V!11819)) (EmptyCell!3722) )
))
(declare-datatypes ((array!19813 0))(
  ( (array!19814 (arr!9400 (Array (_ BitVec 32) ValueCell!3722)) (size!9753 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19813)

(declare-fun mapDefault!13704 () ValueCell!3722)

(assert (=> b!358117 (= condMapEmpty!13704 (= (arr!9400 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3722)) mapDefault!13704)))))

(declare-fun mapNonEmpty!13704 () Bool)

(declare-fun tp!27762 () Bool)

(assert (=> mapNonEmpty!13704 (= mapRes!13704 (and tp!27762 e!219183))))

(declare-fun mapRest!13704 () (Array (_ BitVec 32) ValueCell!3722))

(declare-fun mapValue!13704 () ValueCell!3722)

(declare-fun mapKey!13704 () (_ BitVec 32))

(assert (=> mapNonEmpty!13704 (= (arr!9400 _values!1208) (store mapRest!13704 mapKey!13704 mapValue!13704))))

(declare-fun b!358118 () Bool)

(assert (=> b!358118 (= e!219186 tp_is_empty!8131)))

(declare-fun res!199078 () Bool)

(declare-fun e!219184 () Bool)

(assert (=> start!35664 (=> (not res!199078) (not e!219184))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35664 (= res!199078 (validMask!0 mask!1842))))

(assert (=> start!35664 e!219184))

(assert (=> start!35664 true))

(declare-fun array_inv!6934 (array!19813) Bool)

(assert (=> start!35664 (and (array_inv!6934 _values!1208) e!219182)))

(declare-datatypes ((array!19815 0))(
  ( (array!19816 (arr!9401 (Array (_ BitVec 32) (_ BitVec 64))) (size!9754 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19815)

(declare-fun array_inv!6935 (array!19815) Bool)

(assert (=> start!35664 (array_inv!6935 _keys!1456)))

(declare-fun mapIsEmpty!13704 () Bool)

(assert (=> mapIsEmpty!13704 mapRes!13704))

(declare-fun b!358119 () Bool)

(assert (=> b!358119 (= e!219184 false)))

(declare-fun lt!165949 () Bool)

(declare-datatypes ((List!5396 0))(
  ( (Nil!5393) (Cons!5392 (h!6248 (_ BitVec 64)) (t!10537 List!5396)) )
))
(declare-fun arrayNoDuplicates!0 (array!19815 (_ BitVec 32) List!5396) Bool)

(assert (=> b!358119 (= lt!165949 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5393))))

(declare-fun b!358120 () Bool)

(declare-fun res!199076 () Bool)

(assert (=> b!358120 (=> (not res!199076) (not e!219184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19815 (_ BitVec 32)) Bool)

(assert (=> b!358120 (= res!199076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358121 () Bool)

(declare-fun res!199077 () Bool)

(assert (=> b!358121 (=> (not res!199077) (not e!219184))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358121 (= res!199077 (and (= (size!9753 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9754 _keys!1456) (size!9753 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35664 res!199078) b!358121))

(assert (= (and b!358121 res!199077) b!358120))

(assert (= (and b!358120 res!199076) b!358119))

(assert (= (and b!358117 condMapEmpty!13704) mapIsEmpty!13704))

(assert (= (and b!358117 (not condMapEmpty!13704)) mapNonEmpty!13704))

(get-info :version)

(assert (= (and mapNonEmpty!13704 ((_ is ValueCellFull!3722) mapValue!13704)) b!358116))

(assert (= (and b!358117 ((_ is ValueCellFull!3722) mapDefault!13704)) b!358118))

(assert (= start!35664 b!358117))

(declare-fun m!355509 () Bool)

(assert (=> mapNonEmpty!13704 m!355509))

(declare-fun m!355511 () Bool)

(assert (=> start!35664 m!355511))

(declare-fun m!355513 () Bool)

(assert (=> start!35664 m!355513))

(declare-fun m!355515 () Bool)

(assert (=> start!35664 m!355515))

(declare-fun m!355517 () Bool)

(assert (=> b!358119 m!355517))

(declare-fun m!355519 () Bool)

(assert (=> b!358120 m!355519))

(check-sat (not b!358119) (not mapNonEmpty!13704) (not start!35664) tp_is_empty!8131 (not b!358120))
(check-sat)
