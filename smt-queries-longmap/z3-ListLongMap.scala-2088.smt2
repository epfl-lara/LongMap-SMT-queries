; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35698 () Bool)

(assert start!35698)

(declare-fun b!358571 () Bool)

(declare-fun e!219510 () Bool)

(assert (=> b!358571 (= e!219510 false)))

(declare-fun lt!166214 () Bool)

(declare-datatypes ((array!19867 0))(
  ( (array!19868 (arr!9427 (Array (_ BitVec 32) (_ BitVec 64))) (size!9779 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19867)

(declare-datatypes ((List!5436 0))(
  ( (Nil!5433) (Cons!5432 (h!6288 (_ BitVec 64)) (t!10586 List!5436)) )
))
(declare-fun arrayNoDuplicates!0 (array!19867 (_ BitVec 32) List!5436) Bool)

(assert (=> b!358571 (= lt!166214 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5433))))

(declare-fun b!358572 () Bool)

(declare-fun res!199295 () Bool)

(assert (=> b!358572 (=> (not res!199295) (not e!219510))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19867 (_ BitVec 32)) Bool)

(assert (=> b!358572 (= res!199295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358573 () Bool)

(declare-fun e!219512 () Bool)

(declare-fun e!219508 () Bool)

(declare-fun mapRes!13734 () Bool)

(assert (=> b!358573 (= e!219512 (and e!219508 mapRes!13734))))

(declare-fun condMapEmpty!13734 () Bool)

(declare-datatypes ((V!11845 0))(
  ( (V!11846 (val!4120 Int)) )
))
(declare-datatypes ((ValueCell!3732 0))(
  ( (ValueCellFull!3732 (v!6314 V!11845)) (EmptyCell!3732) )
))
(declare-datatypes ((array!19869 0))(
  ( (array!19870 (arr!9428 (Array (_ BitVec 32) ValueCell!3732)) (size!9780 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19869)

(declare-fun mapDefault!13734 () ValueCell!3732)

(assert (=> b!358573 (= condMapEmpty!13734 (= (arr!9428 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3732)) mapDefault!13734)))))

(declare-fun b!358574 () Bool)

(declare-fun tp_is_empty!8151 () Bool)

(assert (=> b!358574 (= e!219508 tp_is_empty!8151)))

(declare-fun res!199297 () Bool)

(assert (=> start!35698 (=> (not res!199297) (not e!219510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35698 (= res!199297 (validMask!0 mask!1842))))

(assert (=> start!35698 e!219510))

(assert (=> start!35698 true))

(declare-fun array_inv!6932 (array!19869) Bool)

(assert (=> start!35698 (and (array_inv!6932 _values!1208) e!219512)))

(declare-fun array_inv!6933 (array!19867) Bool)

(assert (=> start!35698 (array_inv!6933 _keys!1456)))

(declare-fun mapIsEmpty!13734 () Bool)

(assert (=> mapIsEmpty!13734 mapRes!13734))

(declare-fun b!358575 () Bool)

(declare-fun e!219511 () Bool)

(assert (=> b!358575 (= e!219511 tp_is_empty!8151)))

(declare-fun mapNonEmpty!13734 () Bool)

(declare-fun tp!27792 () Bool)

(assert (=> mapNonEmpty!13734 (= mapRes!13734 (and tp!27792 e!219511))))

(declare-fun mapValue!13734 () ValueCell!3732)

(declare-fun mapKey!13734 () (_ BitVec 32))

(declare-fun mapRest!13734 () (Array (_ BitVec 32) ValueCell!3732))

(assert (=> mapNonEmpty!13734 (= (arr!9428 _values!1208) (store mapRest!13734 mapKey!13734 mapValue!13734))))

(declare-fun b!358576 () Bool)

(declare-fun res!199296 () Bool)

(assert (=> b!358576 (=> (not res!199296) (not e!219510))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358576 (= res!199296 (and (= (size!9780 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9779 _keys!1456) (size!9780 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35698 res!199297) b!358576))

(assert (= (and b!358576 res!199296) b!358572))

(assert (= (and b!358572 res!199295) b!358571))

(assert (= (and b!358573 condMapEmpty!13734) mapIsEmpty!13734))

(assert (= (and b!358573 (not condMapEmpty!13734)) mapNonEmpty!13734))

(get-info :version)

(assert (= (and mapNonEmpty!13734 ((_ is ValueCellFull!3732) mapValue!13734)) b!358575))

(assert (= (and b!358573 ((_ is ValueCellFull!3732) mapDefault!13734)) b!358574))

(assert (= start!35698 b!358573))

(declare-fun m!356359 () Bool)

(assert (=> b!358571 m!356359))

(declare-fun m!356361 () Bool)

(assert (=> b!358572 m!356361))

(declare-fun m!356363 () Bool)

(assert (=> start!35698 m!356363))

(declare-fun m!356365 () Bool)

(assert (=> start!35698 m!356365))

(declare-fun m!356367 () Bool)

(assert (=> start!35698 m!356367))

(declare-fun m!356369 () Bool)

(assert (=> mapNonEmpty!13734 m!356369))

(check-sat (not b!358572) tp_is_empty!8151 (not b!358571) (not start!35698) (not mapNonEmpty!13734))
(check-sat)
