; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35700 () Bool)

(assert start!35700)

(declare-fun b!358440 () Bool)

(declare-fun e!219452 () Bool)

(declare-fun e!219456 () Bool)

(declare-fun mapRes!13758 () Bool)

(assert (=> b!358440 (= e!219452 (and e!219456 mapRes!13758))))

(declare-fun condMapEmpty!13758 () Bool)

(declare-datatypes ((V!11867 0))(
  ( (V!11868 (val!4128 Int)) )
))
(declare-datatypes ((ValueCell!3740 0))(
  ( (ValueCellFull!3740 (v!6316 V!11867)) (EmptyCell!3740) )
))
(declare-datatypes ((array!19879 0))(
  ( (array!19880 (arr!9433 (Array (_ BitVec 32) ValueCell!3740)) (size!9786 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19879)

(declare-fun mapDefault!13758 () ValueCell!3740)

(assert (=> b!358440 (= condMapEmpty!13758 (= (arr!9433 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3740)) mapDefault!13758)))))

(declare-fun b!358441 () Bool)

(declare-fun tp_is_empty!8167 () Bool)

(assert (=> b!358441 (= e!219456 tp_is_empty!8167)))

(declare-fun b!358442 () Bool)

(declare-fun res!199238 () Bool)

(declare-fun e!219454 () Bool)

(assert (=> b!358442 (=> (not res!199238) (not e!219454))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19881 0))(
  ( (array!19882 (arr!9434 (Array (_ BitVec 32) (_ BitVec 64))) (size!9787 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19881)

(assert (=> b!358442 (= res!199238 (and (= (size!9786 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9787 _keys!1456) (size!9786 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358443 () Bool)

(assert (=> b!358443 (= e!219454 false)))

(declare-fun lt!166003 () Bool)

(declare-datatypes ((List!5407 0))(
  ( (Nil!5404) (Cons!5403 (h!6259 (_ BitVec 64)) (t!10548 List!5407)) )
))
(declare-fun arrayNoDuplicates!0 (array!19881 (_ BitVec 32) List!5407) Bool)

(assert (=> b!358443 (= lt!166003 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5404))))

(declare-fun b!358444 () Bool)

(declare-fun e!219455 () Bool)

(assert (=> b!358444 (= e!219455 tp_is_empty!8167)))

(declare-fun res!199239 () Bool)

(assert (=> start!35700 (=> (not res!199239) (not e!219454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35700 (= res!199239 (validMask!0 mask!1842))))

(assert (=> start!35700 e!219454))

(assert (=> start!35700 true))

(declare-fun array_inv!6964 (array!19879) Bool)

(assert (=> start!35700 (and (array_inv!6964 _values!1208) e!219452)))

(declare-fun array_inv!6965 (array!19881) Bool)

(assert (=> start!35700 (array_inv!6965 _keys!1456)))

(declare-fun mapNonEmpty!13758 () Bool)

(declare-fun tp!27816 () Bool)

(assert (=> mapNonEmpty!13758 (= mapRes!13758 (and tp!27816 e!219455))))

(declare-fun mapKey!13758 () (_ BitVec 32))

(declare-fun mapValue!13758 () ValueCell!3740)

(declare-fun mapRest!13758 () (Array (_ BitVec 32) ValueCell!3740))

(assert (=> mapNonEmpty!13758 (= (arr!9433 _values!1208) (store mapRest!13758 mapKey!13758 mapValue!13758))))

(declare-fun b!358445 () Bool)

(declare-fun res!199240 () Bool)

(assert (=> b!358445 (=> (not res!199240) (not e!219454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19881 (_ BitVec 32)) Bool)

(assert (=> b!358445 (= res!199240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13758 () Bool)

(assert (=> mapIsEmpty!13758 mapRes!13758))

(assert (= (and start!35700 res!199239) b!358442))

(assert (= (and b!358442 res!199238) b!358445))

(assert (= (and b!358445 res!199240) b!358443))

(assert (= (and b!358440 condMapEmpty!13758) mapIsEmpty!13758))

(assert (= (and b!358440 (not condMapEmpty!13758)) mapNonEmpty!13758))

(get-info :version)

(assert (= (and mapNonEmpty!13758 ((_ is ValueCellFull!3740) mapValue!13758)) b!358444))

(assert (= (and b!358440 ((_ is ValueCellFull!3740) mapDefault!13758)) b!358441))

(assert (= start!35700 b!358440))

(declare-fun m!355725 () Bool)

(assert (=> b!358443 m!355725))

(declare-fun m!355727 () Bool)

(assert (=> start!35700 m!355727))

(declare-fun m!355729 () Bool)

(assert (=> start!35700 m!355729))

(declare-fun m!355731 () Bool)

(assert (=> start!35700 m!355731))

(declare-fun m!355733 () Bool)

(assert (=> mapNonEmpty!13758 m!355733))

(declare-fun m!355735 () Bool)

(assert (=> b!358445 m!355735))

(check-sat (not b!358443) (not start!35700) (not b!358445) (not mapNonEmpty!13758) tp_is_empty!8167)
(check-sat)
