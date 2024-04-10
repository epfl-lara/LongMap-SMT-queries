; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35746 () Bool)

(assert start!35746)

(declare-fun mapNonEmpty!13806 () Bool)

(declare-fun mapRes!13806 () Bool)

(declare-fun tp!27873 () Bool)

(declare-fun e!219871 () Bool)

(assert (=> mapNonEmpty!13806 (= mapRes!13806 (and tp!27873 e!219871))))

(declare-datatypes ((V!11909 0))(
  ( (V!11910 (val!4144 Int)) )
))
(declare-datatypes ((ValueCell!3756 0))(
  ( (ValueCellFull!3756 (v!6338 V!11909)) (EmptyCell!3756) )
))
(declare-fun mapRest!13806 () (Array (_ BitVec 32) ValueCell!3756))

(declare-fun mapKey!13806 () (_ BitVec 32))

(declare-fun mapValue!13806 () ValueCell!3756)

(declare-datatypes ((array!19957 0))(
  ( (array!19958 (arr!9472 (Array (_ BitVec 32) ValueCell!3756)) (size!9824 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19957)

(assert (=> mapNonEmpty!13806 (= (arr!9472 _values!1208) (store mapRest!13806 mapKey!13806 mapValue!13806))))

(declare-fun b!359102 () Bool)

(declare-fun tp_is_empty!8199 () Bool)

(assert (=> b!359102 (= e!219871 tp_is_empty!8199)))

(declare-fun b!359103 () Bool)

(declare-fun e!219869 () Bool)

(assert (=> b!359103 (= e!219869 tp_is_empty!8199)))

(declare-fun res!199610 () Bool)

(declare-fun e!219870 () Bool)

(assert (=> start!35746 (=> (not res!199610) (not e!219870))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35746 (= res!199610 (validMask!0 mask!1842))))

(assert (=> start!35746 e!219870))

(assert (=> start!35746 true))

(declare-fun e!219872 () Bool)

(declare-fun array_inv!6970 (array!19957) Bool)

(assert (=> start!35746 (and (array_inv!6970 _values!1208) e!219872)))

(declare-datatypes ((array!19959 0))(
  ( (array!19960 (arr!9473 (Array (_ BitVec 32) (_ BitVec 64))) (size!9825 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19959)

(declare-fun array_inv!6971 (array!19959) Bool)

(assert (=> start!35746 (array_inv!6971 _keys!1456)))

(declare-fun mapIsEmpty!13806 () Bool)

(assert (=> mapIsEmpty!13806 mapRes!13806))

(declare-fun b!359104 () Bool)

(declare-fun res!199611 () Bool)

(assert (=> b!359104 (=> (not res!199611) (not e!219870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19959 (_ BitVec 32)) Bool)

(assert (=> b!359104 (= res!199611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359105 () Bool)

(assert (=> b!359105 (= e!219870 false)))

(declare-fun lt!166286 () Bool)

(declare-datatypes ((List!5455 0))(
  ( (Nil!5452) (Cons!5451 (h!6307 (_ BitVec 64)) (t!10605 List!5455)) )
))
(declare-fun arrayNoDuplicates!0 (array!19959 (_ BitVec 32) List!5455) Bool)

(assert (=> b!359105 (= lt!166286 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5452))))

(declare-fun b!359106 () Bool)

(declare-fun res!199612 () Bool)

(assert (=> b!359106 (=> (not res!199612) (not e!219870))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!359106 (= res!199612 (and (= (size!9824 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9825 _keys!1456) (size!9824 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359107 () Bool)

(assert (=> b!359107 (= e!219872 (and e!219869 mapRes!13806))))

(declare-fun condMapEmpty!13806 () Bool)

(declare-fun mapDefault!13806 () ValueCell!3756)

(assert (=> b!359107 (= condMapEmpty!13806 (= (arr!9472 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3756)) mapDefault!13806)))))

(assert (= (and start!35746 res!199610) b!359106))

(assert (= (and b!359106 res!199612) b!359104))

(assert (= (and b!359104 res!199611) b!359105))

(assert (= (and b!359107 condMapEmpty!13806) mapIsEmpty!13806))

(assert (= (and b!359107 (not condMapEmpty!13806)) mapNonEmpty!13806))

(get-info :version)

(assert (= (and mapNonEmpty!13806 ((_ is ValueCellFull!3756) mapValue!13806)) b!359102))

(assert (= (and b!359107 ((_ is ValueCellFull!3756) mapDefault!13806)) b!359103))

(assert (= start!35746 b!359107))

(declare-fun m!356719 () Bool)

(assert (=> mapNonEmpty!13806 m!356719))

(declare-fun m!356721 () Bool)

(assert (=> start!35746 m!356721))

(declare-fun m!356723 () Bool)

(assert (=> start!35746 m!356723))

(declare-fun m!356725 () Bool)

(assert (=> start!35746 m!356725))

(declare-fun m!356727 () Bool)

(assert (=> b!359104 m!356727))

(declare-fun m!356729 () Bool)

(assert (=> b!359105 m!356729))

(check-sat (not b!359105) (not mapNonEmpty!13806) (not start!35746) tp_is_empty!8199 (not b!359104))
(check-sat)
