; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35676 () Bool)

(assert start!35676)

(declare-fun b!358446 () Bool)

(declare-fun e!219415 () Bool)

(assert (=> b!358446 (= e!219415 false)))

(declare-fun lt!166220 () Bool)

(declare-datatypes ((array!19832 0))(
  ( (array!19833 (arr!9409 (Array (_ BitVec 32) (_ BitVec 64))) (size!9761 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19832)

(declare-datatypes ((List!5342 0))(
  ( (Nil!5339) (Cons!5338 (h!6194 (_ BitVec 64)) (t!10484 List!5342)) )
))
(declare-fun arrayNoDuplicates!0 (array!19832 (_ BitVec 32) List!5342) Bool)

(assert (=> b!358446 (= lt!166220 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5339))))

(declare-fun mapNonEmpty!13722 () Bool)

(declare-fun mapRes!13722 () Bool)

(declare-fun tp!27780 () Bool)

(declare-fun e!219416 () Bool)

(assert (=> mapNonEmpty!13722 (= mapRes!13722 (and tp!27780 e!219416))))

(declare-fun mapKey!13722 () (_ BitVec 32))

(declare-datatypes ((V!11835 0))(
  ( (V!11836 (val!4116 Int)) )
))
(declare-datatypes ((ValueCell!3728 0))(
  ( (ValueCellFull!3728 (v!6311 V!11835)) (EmptyCell!3728) )
))
(declare-fun mapValue!13722 () ValueCell!3728)

(declare-fun mapRest!13722 () (Array (_ BitVec 32) ValueCell!3728))

(declare-datatypes ((array!19834 0))(
  ( (array!19835 (arr!9410 (Array (_ BitVec 32) ValueCell!3728)) (size!9762 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19834)

(assert (=> mapNonEmpty!13722 (= (arr!9410 _values!1208) (store mapRest!13722 mapKey!13722 mapValue!13722))))

(declare-fun b!358447 () Bool)

(declare-fun e!219418 () Bool)

(declare-fun tp_is_empty!8143 () Bool)

(assert (=> b!358447 (= e!219418 tp_is_empty!8143)))

(declare-fun b!358448 () Bool)

(declare-fun res!199256 () Bool)

(assert (=> b!358448 (=> (not res!199256) (not e!219415))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19832 (_ BitVec 32)) Bool)

(assert (=> b!358448 (= res!199256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapIsEmpty!13722 () Bool)

(assert (=> mapIsEmpty!13722 mapRes!13722))

(declare-fun b!358449 () Bool)

(declare-fun res!199258 () Bool)

(assert (=> b!358449 (=> (not res!199258) (not e!219415))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358449 (= res!199258 (and (= (size!9762 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9761 _keys!1456) (size!9762 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!199257 () Bool)

(assert (=> start!35676 (=> (not res!199257) (not e!219415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35676 (= res!199257 (validMask!0 mask!1842))))

(assert (=> start!35676 e!219415))

(assert (=> start!35676 true))

(declare-fun e!219414 () Bool)

(declare-fun array_inv!6954 (array!19834) Bool)

(assert (=> start!35676 (and (array_inv!6954 _values!1208) e!219414)))

(declare-fun array_inv!6955 (array!19832) Bool)

(assert (=> start!35676 (array_inv!6955 _keys!1456)))

(declare-fun b!358450 () Bool)

(assert (=> b!358450 (= e!219416 tp_is_empty!8143)))

(declare-fun b!358451 () Bool)

(assert (=> b!358451 (= e!219414 (and e!219418 mapRes!13722))))

(declare-fun condMapEmpty!13722 () Bool)

(declare-fun mapDefault!13722 () ValueCell!3728)

(assert (=> b!358451 (= condMapEmpty!13722 (= (arr!9410 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3728)) mapDefault!13722)))))

(assert (= (and start!35676 res!199257) b!358449))

(assert (= (and b!358449 res!199258) b!358448))

(assert (= (and b!358448 res!199256) b!358446))

(assert (= (and b!358451 condMapEmpty!13722) mapIsEmpty!13722))

(assert (= (and b!358451 (not condMapEmpty!13722)) mapNonEmpty!13722))

(get-info :version)

(assert (= (and mapNonEmpty!13722 ((_ is ValueCellFull!3728) mapValue!13722)) b!358450))

(assert (= (and b!358451 ((_ is ValueCellFull!3728) mapDefault!13722)) b!358447))

(assert (= start!35676 b!358451))

(declare-fun m!356535 () Bool)

(assert (=> b!358446 m!356535))

(declare-fun m!356537 () Bool)

(assert (=> mapNonEmpty!13722 m!356537))

(declare-fun m!356539 () Bool)

(assert (=> b!358448 m!356539))

(declare-fun m!356541 () Bool)

(assert (=> start!35676 m!356541))

(declare-fun m!356543 () Bool)

(assert (=> start!35676 m!356543))

(declare-fun m!356545 () Bool)

(assert (=> start!35676 m!356545))

(check-sat (not b!358446) (not mapNonEmpty!13722) (not b!358448) tp_is_empty!8143 (not start!35676))
(check-sat)
