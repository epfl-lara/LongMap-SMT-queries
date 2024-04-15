; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35694 () Bool)

(assert start!35694)

(declare-fun b!358386 () Bool)

(declare-fun res!199213 () Bool)

(declare-fun e!219411 () Bool)

(assert (=> b!358386 (=> (not res!199213) (not e!219411))))

(declare-datatypes ((array!19867 0))(
  ( (array!19868 (arr!9427 (Array (_ BitVec 32) (_ BitVec 64))) (size!9780 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19867)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19867 (_ BitVec 32)) Bool)

(assert (=> b!358386 (= res!199213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358387 () Bool)

(declare-fun res!199212 () Bool)

(assert (=> b!358387 (=> (not res!199212) (not e!219411))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11859 0))(
  ( (V!11860 (val!4125 Int)) )
))
(declare-datatypes ((ValueCell!3737 0))(
  ( (ValueCellFull!3737 (v!6313 V!11859)) (EmptyCell!3737) )
))
(declare-datatypes ((array!19869 0))(
  ( (array!19870 (arr!9428 (Array (_ BitVec 32) ValueCell!3737)) (size!9781 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19869)

(assert (=> b!358387 (= res!199212 (and (= (size!9781 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9780 _keys!1456) (size!9781 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358388 () Bool)

(declare-fun e!219408 () Bool)

(declare-fun tp_is_empty!8161 () Bool)

(assert (=> b!358388 (= e!219408 tp_is_empty!8161)))

(declare-fun b!358389 () Bool)

(declare-fun e!219407 () Bool)

(declare-fun mapRes!13749 () Bool)

(assert (=> b!358389 (= e!219407 (and e!219408 mapRes!13749))))

(declare-fun condMapEmpty!13749 () Bool)

(declare-fun mapDefault!13749 () ValueCell!3737)

(assert (=> b!358389 (= condMapEmpty!13749 (= (arr!9428 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3737)) mapDefault!13749)))))

(declare-fun res!199211 () Bool)

(assert (=> start!35694 (=> (not res!199211) (not e!219411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35694 (= res!199211 (validMask!0 mask!1842))))

(assert (=> start!35694 e!219411))

(assert (=> start!35694 true))

(declare-fun array_inv!6958 (array!19869) Bool)

(assert (=> start!35694 (and (array_inv!6958 _values!1208) e!219407)))

(declare-fun array_inv!6959 (array!19867) Bool)

(assert (=> start!35694 (array_inv!6959 _keys!1456)))

(declare-fun mapIsEmpty!13749 () Bool)

(assert (=> mapIsEmpty!13749 mapRes!13749))

(declare-fun mapNonEmpty!13749 () Bool)

(declare-fun tp!27807 () Bool)

(declare-fun e!219410 () Bool)

(assert (=> mapNonEmpty!13749 (= mapRes!13749 (and tp!27807 e!219410))))

(declare-fun mapRest!13749 () (Array (_ BitVec 32) ValueCell!3737))

(declare-fun mapKey!13749 () (_ BitVec 32))

(declare-fun mapValue!13749 () ValueCell!3737)

(assert (=> mapNonEmpty!13749 (= (arr!9428 _values!1208) (store mapRest!13749 mapKey!13749 mapValue!13749))))

(declare-fun b!358390 () Bool)

(assert (=> b!358390 (= e!219411 false)))

(declare-fun lt!165994 () Bool)

(declare-datatypes ((List!5404 0))(
  ( (Nil!5401) (Cons!5400 (h!6256 (_ BitVec 64)) (t!10545 List!5404)) )
))
(declare-fun arrayNoDuplicates!0 (array!19867 (_ BitVec 32) List!5404) Bool)

(assert (=> b!358390 (= lt!165994 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5401))))

(declare-fun b!358391 () Bool)

(assert (=> b!358391 (= e!219410 tp_is_empty!8161)))

(assert (= (and start!35694 res!199211) b!358387))

(assert (= (and b!358387 res!199212) b!358386))

(assert (= (and b!358386 res!199213) b!358390))

(assert (= (and b!358389 condMapEmpty!13749) mapIsEmpty!13749))

(assert (= (and b!358389 (not condMapEmpty!13749)) mapNonEmpty!13749))

(get-info :version)

(assert (= (and mapNonEmpty!13749 ((_ is ValueCellFull!3737) mapValue!13749)) b!358391))

(assert (= (and b!358389 ((_ is ValueCellFull!3737) mapDefault!13749)) b!358388))

(assert (= start!35694 b!358389))

(declare-fun m!355689 () Bool)

(assert (=> b!358386 m!355689))

(declare-fun m!355691 () Bool)

(assert (=> start!35694 m!355691))

(declare-fun m!355693 () Bool)

(assert (=> start!35694 m!355693))

(declare-fun m!355695 () Bool)

(assert (=> start!35694 m!355695))

(declare-fun m!355697 () Bool)

(assert (=> mapNonEmpty!13749 m!355697))

(declare-fun m!355699 () Bool)

(assert (=> b!358390 m!355699))

(check-sat (not start!35694) tp_is_empty!8161 (not b!358386) (not b!358390) (not mapNonEmpty!13749))
(check-sat)
