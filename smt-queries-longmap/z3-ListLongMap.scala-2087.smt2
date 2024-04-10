; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35692 () Bool)

(assert start!35692)

(declare-fun b!358517 () Bool)

(declare-fun res!199269 () Bool)

(declare-fun e!219463 () Bool)

(assert (=> b!358517 (=> (not res!199269) (not e!219463))))

(declare-datatypes ((array!19855 0))(
  ( (array!19856 (arr!9421 (Array (_ BitVec 32) (_ BitVec 64))) (size!9773 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19855)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19855 (_ BitVec 32)) Bool)

(assert (=> b!358517 (= res!199269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13725 () Bool)

(declare-fun mapRes!13725 () Bool)

(declare-fun tp!27783 () Bool)

(declare-fun e!219465 () Bool)

(assert (=> mapNonEmpty!13725 (= mapRes!13725 (and tp!27783 e!219465))))

(declare-datatypes ((V!11837 0))(
  ( (V!11838 (val!4117 Int)) )
))
(declare-datatypes ((ValueCell!3729 0))(
  ( (ValueCellFull!3729 (v!6311 V!11837)) (EmptyCell!3729) )
))
(declare-datatypes ((array!19857 0))(
  ( (array!19858 (arr!9422 (Array (_ BitVec 32) ValueCell!3729)) (size!9774 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19857)

(declare-fun mapRest!13725 () (Array (_ BitVec 32) ValueCell!3729))

(declare-fun mapKey!13725 () (_ BitVec 32))

(declare-fun mapValue!13725 () ValueCell!3729)

(assert (=> mapNonEmpty!13725 (= (arr!9422 _values!1208) (store mapRest!13725 mapKey!13725 mapValue!13725))))

(declare-fun res!199268 () Bool)

(assert (=> start!35692 (=> (not res!199268) (not e!219463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35692 (= res!199268 (validMask!0 mask!1842))))

(assert (=> start!35692 e!219463))

(assert (=> start!35692 true))

(declare-fun e!219466 () Bool)

(declare-fun array_inv!6926 (array!19857) Bool)

(assert (=> start!35692 (and (array_inv!6926 _values!1208) e!219466)))

(declare-fun array_inv!6927 (array!19855) Bool)

(assert (=> start!35692 (array_inv!6927 _keys!1456)))

(declare-fun b!358518 () Bool)

(assert (=> b!358518 (= e!219463 false)))

(declare-fun lt!166205 () Bool)

(declare-datatypes ((List!5434 0))(
  ( (Nil!5431) (Cons!5430 (h!6286 (_ BitVec 64)) (t!10584 List!5434)) )
))
(declare-fun arrayNoDuplicates!0 (array!19855 (_ BitVec 32) List!5434) Bool)

(assert (=> b!358518 (= lt!166205 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5431))))

(declare-fun mapIsEmpty!13725 () Bool)

(assert (=> mapIsEmpty!13725 mapRes!13725))

(declare-fun b!358519 () Bool)

(declare-fun tp_is_empty!8145 () Bool)

(assert (=> b!358519 (= e!219465 tp_is_empty!8145)))

(declare-fun b!358520 () Bool)

(declare-fun e!219467 () Bool)

(assert (=> b!358520 (= e!219467 tp_is_empty!8145)))

(declare-fun b!358521 () Bool)

(assert (=> b!358521 (= e!219466 (and e!219467 mapRes!13725))))

(declare-fun condMapEmpty!13725 () Bool)

(declare-fun mapDefault!13725 () ValueCell!3729)

(assert (=> b!358521 (= condMapEmpty!13725 (= (arr!9422 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3729)) mapDefault!13725)))))

(declare-fun b!358522 () Bool)

(declare-fun res!199270 () Bool)

(assert (=> b!358522 (=> (not res!199270) (not e!219463))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358522 (= res!199270 (and (= (size!9774 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9773 _keys!1456) (size!9774 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35692 res!199268) b!358522))

(assert (= (and b!358522 res!199270) b!358517))

(assert (= (and b!358517 res!199269) b!358518))

(assert (= (and b!358521 condMapEmpty!13725) mapIsEmpty!13725))

(assert (= (and b!358521 (not condMapEmpty!13725)) mapNonEmpty!13725))

(get-info :version)

(assert (= (and mapNonEmpty!13725 ((_ is ValueCellFull!3729) mapValue!13725)) b!358519))

(assert (= (and b!358521 ((_ is ValueCellFull!3729) mapDefault!13725)) b!358520))

(assert (= start!35692 b!358521))

(declare-fun m!356323 () Bool)

(assert (=> b!358517 m!356323))

(declare-fun m!356325 () Bool)

(assert (=> mapNonEmpty!13725 m!356325))

(declare-fun m!356327 () Bool)

(assert (=> start!35692 m!356327))

(declare-fun m!356329 () Bool)

(assert (=> start!35692 m!356329))

(declare-fun m!356331 () Bool)

(assert (=> start!35692 m!356331))

(declare-fun m!356333 () Bool)

(assert (=> b!358518 m!356333))

(check-sat (not b!358518) (not b!358517) (not start!35692) (not mapNonEmpty!13725) tp_is_empty!8145)
(check-sat)
