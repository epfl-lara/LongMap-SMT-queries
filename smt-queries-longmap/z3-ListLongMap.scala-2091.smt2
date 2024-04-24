; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35700 () Bool)

(assert start!35700)

(declare-fun b!358662 () Bool)

(declare-fun res!199366 () Bool)

(declare-fun e!219596 () Bool)

(assert (=> b!358662 (=> (not res!199366) (not e!219596))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19874 0))(
  ( (array!19875 (arr!9430 (Array (_ BitVec 32) (_ BitVec 64))) (size!9782 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19874)

(declare-datatypes ((V!11867 0))(
  ( (V!11868 (val!4128 Int)) )
))
(declare-datatypes ((ValueCell!3740 0))(
  ( (ValueCellFull!3740 (v!6323 V!11867)) (EmptyCell!3740) )
))
(declare-datatypes ((array!19876 0))(
  ( (array!19877 (arr!9431 (Array (_ BitVec 32) ValueCell!3740)) (size!9783 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19876)

(assert (=> b!358662 (= res!199366 (and (= (size!9783 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9782 _keys!1456) (size!9783 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13758 () Bool)

(declare-fun mapRes!13758 () Bool)

(assert (=> mapIsEmpty!13758 mapRes!13758))

(declare-fun b!358663 () Bool)

(assert (=> b!358663 (= e!219596 false)))

(declare-fun lt!166256 () Bool)

(declare-datatypes ((List!5350 0))(
  ( (Nil!5347) (Cons!5346 (h!6202 (_ BitVec 64)) (t!10492 List!5350)) )
))
(declare-fun arrayNoDuplicates!0 (array!19874 (_ BitVec 32) List!5350) Bool)

(assert (=> b!358663 (= lt!166256 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5347))))

(declare-fun b!358664 () Bool)

(declare-fun e!219597 () Bool)

(declare-fun tp_is_empty!8167 () Bool)

(assert (=> b!358664 (= e!219597 tp_is_empty!8167)))

(declare-fun b!358665 () Bool)

(declare-fun e!219598 () Bool)

(assert (=> b!358665 (= e!219598 (and e!219597 mapRes!13758))))

(declare-fun condMapEmpty!13758 () Bool)

(declare-fun mapDefault!13758 () ValueCell!3740)

(assert (=> b!358665 (= condMapEmpty!13758 (= (arr!9431 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3740)) mapDefault!13758)))))

(declare-fun res!199364 () Bool)

(assert (=> start!35700 (=> (not res!199364) (not e!219596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35700 (= res!199364 (validMask!0 mask!1842))))

(assert (=> start!35700 e!219596))

(assert (=> start!35700 true))

(declare-fun array_inv!6970 (array!19876) Bool)

(assert (=> start!35700 (and (array_inv!6970 _values!1208) e!219598)))

(declare-fun array_inv!6971 (array!19874) Bool)

(assert (=> start!35700 (array_inv!6971 _keys!1456)))

(declare-fun b!358666 () Bool)

(declare-fun e!219595 () Bool)

(assert (=> b!358666 (= e!219595 tp_is_empty!8167)))

(declare-fun mapNonEmpty!13758 () Bool)

(declare-fun tp!27816 () Bool)

(assert (=> mapNonEmpty!13758 (= mapRes!13758 (and tp!27816 e!219595))))

(declare-fun mapValue!13758 () ValueCell!3740)

(declare-fun mapRest!13758 () (Array (_ BitVec 32) ValueCell!3740))

(declare-fun mapKey!13758 () (_ BitVec 32))

(assert (=> mapNonEmpty!13758 (= (arr!9431 _values!1208) (store mapRest!13758 mapKey!13758 mapValue!13758))))

(declare-fun b!358667 () Bool)

(declare-fun res!199365 () Bool)

(assert (=> b!358667 (=> (not res!199365) (not e!219596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19874 (_ BitVec 32)) Bool)

(assert (=> b!358667 (= res!199365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35700 res!199364) b!358662))

(assert (= (and b!358662 res!199366) b!358667))

(assert (= (and b!358667 res!199365) b!358663))

(assert (= (and b!358665 condMapEmpty!13758) mapIsEmpty!13758))

(assert (= (and b!358665 (not condMapEmpty!13758)) mapNonEmpty!13758))

(get-info :version)

(assert (= (and mapNonEmpty!13758 ((_ is ValueCellFull!3740) mapValue!13758)) b!358666))

(assert (= (and b!358665 ((_ is ValueCellFull!3740) mapDefault!13758)) b!358664))

(assert (= start!35700 b!358665))

(declare-fun m!356679 () Bool)

(assert (=> b!358663 m!356679))

(declare-fun m!356681 () Bool)

(assert (=> start!35700 m!356681))

(declare-fun m!356683 () Bool)

(assert (=> start!35700 m!356683))

(declare-fun m!356685 () Bool)

(assert (=> start!35700 m!356685))

(declare-fun m!356687 () Bool)

(assert (=> mapNonEmpty!13758 m!356687))

(declare-fun m!356689 () Bool)

(assert (=> b!358667 m!356689))

(check-sat (not start!35700) tp_is_empty!8167 (not b!358663) (not mapNonEmpty!13758) (not b!358667))
(check-sat)
