; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35694 () Bool)

(assert start!35694)

(declare-fun b!358608 () Bool)

(declare-fun e!219553 () Bool)

(declare-fun e!219551 () Bool)

(declare-fun mapRes!13749 () Bool)

(assert (=> b!358608 (= e!219553 (and e!219551 mapRes!13749))))

(declare-fun condMapEmpty!13749 () Bool)

(declare-datatypes ((V!11859 0))(
  ( (V!11860 (val!4125 Int)) )
))
(declare-datatypes ((ValueCell!3737 0))(
  ( (ValueCellFull!3737 (v!6320 V!11859)) (EmptyCell!3737) )
))
(declare-datatypes ((array!19862 0))(
  ( (array!19863 (arr!9424 (Array (_ BitVec 32) ValueCell!3737)) (size!9776 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19862)

(declare-fun mapDefault!13749 () ValueCell!3737)

(assert (=> b!358608 (= condMapEmpty!13749 (= (arr!9424 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3737)) mapDefault!13749)))))

(declare-fun b!358609 () Bool)

(declare-fun res!199338 () Bool)

(declare-fun e!219550 () Bool)

(assert (=> b!358609 (=> (not res!199338) (not e!219550))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19864 0))(
  ( (array!19865 (arr!9425 (Array (_ BitVec 32) (_ BitVec 64))) (size!9777 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19864)

(assert (=> b!358609 (= res!199338 (and (= (size!9776 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9777 _keys!1456) (size!9776 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13749 () Bool)

(declare-fun tp!27807 () Bool)

(declare-fun e!219549 () Bool)

(assert (=> mapNonEmpty!13749 (= mapRes!13749 (and tp!27807 e!219549))))

(declare-fun mapRest!13749 () (Array (_ BitVec 32) ValueCell!3737))

(declare-fun mapValue!13749 () ValueCell!3737)

(declare-fun mapKey!13749 () (_ BitVec 32))

(assert (=> mapNonEmpty!13749 (= (arr!9424 _values!1208) (store mapRest!13749 mapKey!13749 mapValue!13749))))

(declare-fun mapIsEmpty!13749 () Bool)

(assert (=> mapIsEmpty!13749 mapRes!13749))

(declare-fun b!358610 () Bool)

(declare-fun res!199339 () Bool)

(assert (=> b!358610 (=> (not res!199339) (not e!219550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19864 (_ BitVec 32)) Bool)

(assert (=> b!358610 (= res!199339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199337 () Bool)

(assert (=> start!35694 (=> (not res!199337) (not e!219550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35694 (= res!199337 (validMask!0 mask!1842))))

(assert (=> start!35694 e!219550))

(assert (=> start!35694 true))

(declare-fun array_inv!6964 (array!19862) Bool)

(assert (=> start!35694 (and (array_inv!6964 _values!1208) e!219553)))

(declare-fun array_inv!6965 (array!19864) Bool)

(assert (=> start!35694 (array_inv!6965 _keys!1456)))

(declare-fun b!358611 () Bool)

(declare-fun tp_is_empty!8161 () Bool)

(assert (=> b!358611 (= e!219551 tp_is_empty!8161)))

(declare-fun b!358612 () Bool)

(assert (=> b!358612 (= e!219549 tp_is_empty!8161)))

(declare-fun b!358613 () Bool)

(assert (=> b!358613 (= e!219550 false)))

(declare-fun lt!166247 () Bool)

(declare-datatypes ((List!5347 0))(
  ( (Nil!5344) (Cons!5343 (h!6199 (_ BitVec 64)) (t!10489 List!5347)) )
))
(declare-fun arrayNoDuplicates!0 (array!19864 (_ BitVec 32) List!5347) Bool)

(assert (=> b!358613 (= lt!166247 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5344))))

(assert (= (and start!35694 res!199337) b!358609))

(assert (= (and b!358609 res!199338) b!358610))

(assert (= (and b!358610 res!199339) b!358613))

(assert (= (and b!358608 condMapEmpty!13749) mapIsEmpty!13749))

(assert (= (and b!358608 (not condMapEmpty!13749)) mapNonEmpty!13749))

(get-info :version)

(assert (= (and mapNonEmpty!13749 ((_ is ValueCellFull!3737) mapValue!13749)) b!358612))

(assert (= (and b!358608 ((_ is ValueCellFull!3737) mapDefault!13749)) b!358611))

(assert (= start!35694 b!358608))

(declare-fun m!356643 () Bool)

(assert (=> mapNonEmpty!13749 m!356643))

(declare-fun m!356645 () Bool)

(assert (=> b!358610 m!356645))

(declare-fun m!356647 () Bool)

(assert (=> start!35694 m!356647))

(declare-fun m!356649 () Bool)

(assert (=> start!35694 m!356649))

(declare-fun m!356651 () Bool)

(assert (=> start!35694 m!356651))

(declare-fun m!356653 () Bool)

(assert (=> b!358613 m!356653))

(check-sat (not b!358610) (not start!35694) tp_is_empty!8161 (not b!358613) (not mapNonEmpty!13749))
(check-sat)
