; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35500 () Bool)

(assert start!35500)

(declare-fun b!355772 () Bool)

(declare-fun e!217942 () Bool)

(declare-fun e!217944 () Bool)

(declare-fun mapRes!13437 () Bool)

(assert (=> b!355772 (= e!217942 (and e!217944 mapRes!13437))))

(declare-fun condMapEmpty!13437 () Bool)

(declare-datatypes ((V!11581 0))(
  ( (V!11582 (val!4021 Int)) )
))
(declare-datatypes ((ValueCell!3633 0))(
  ( (ValueCellFull!3633 (v!6215 V!11581)) (EmptyCell!3633) )
))
(declare-datatypes ((array!19483 0))(
  ( (array!19484 (arr!9235 (Array (_ BitVec 32) ValueCell!3633)) (size!9587 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19483)

(declare-fun mapDefault!13437 () ValueCell!3633)

(assert (=> b!355772 (= condMapEmpty!13437 (= (arr!9235 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3633)) mapDefault!13437)))))

(declare-fun b!355773 () Bool)

(declare-fun tp_is_empty!7953 () Bool)

(assert (=> b!355773 (= e!217944 tp_is_empty!7953)))

(declare-fun mapNonEmpty!13437 () Bool)

(declare-fun tp!27414 () Bool)

(declare-fun e!217946 () Bool)

(assert (=> mapNonEmpty!13437 (= mapRes!13437 (and tp!27414 e!217946))))

(declare-fun mapValue!13437 () ValueCell!3633)

(declare-fun mapKey!13437 () (_ BitVec 32))

(declare-fun mapRest!13437 () (Array (_ BitVec 32) ValueCell!3633))

(assert (=> mapNonEmpty!13437 (= (arr!9235 _values!1208) (store mapRest!13437 mapKey!13437 mapValue!13437))))

(declare-fun b!355774 () Bool)

(assert (=> b!355774 (= e!217946 tp_is_empty!7953)))

(declare-fun b!355775 () Bool)

(declare-fun res!197389 () Bool)

(declare-fun e!217945 () Bool)

(assert (=> b!355775 (=> (not res!197389) (not e!217945))))

(declare-datatypes ((array!19485 0))(
  ( (array!19486 (arr!9236 (Array (_ BitVec 32) (_ BitVec 64))) (size!9588 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19485)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19485 (_ BitVec 32)) Bool)

(assert (=> b!355775 (= res!197389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355776 () Bool)

(declare-fun res!197387 () Bool)

(assert (=> b!355776 (=> (not res!197387) (not e!217945))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355776 (= res!197387 (and (= (size!9587 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9588 _keys!1456) (size!9587 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355777 () Bool)

(assert (=> b!355777 (= e!217945 false)))

(declare-fun lt!165845 () Bool)

(declare-datatypes ((List!5348 0))(
  ( (Nil!5345) (Cons!5344 (h!6200 (_ BitVec 64)) (t!10498 List!5348)) )
))
(declare-fun arrayNoDuplicates!0 (array!19485 (_ BitVec 32) List!5348) Bool)

(assert (=> b!355777 (= lt!165845 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5345))))

(declare-fun res!197388 () Bool)

(assert (=> start!35500 (=> (not res!197388) (not e!217945))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35500 (= res!197388 (validMask!0 mask!1842))))

(assert (=> start!35500 e!217945))

(assert (=> start!35500 true))

(declare-fun array_inv!6788 (array!19483) Bool)

(assert (=> start!35500 (and (array_inv!6788 _values!1208) e!217942)))

(declare-fun array_inv!6789 (array!19485) Bool)

(assert (=> start!35500 (array_inv!6789 _keys!1456)))

(declare-fun mapIsEmpty!13437 () Bool)

(assert (=> mapIsEmpty!13437 mapRes!13437))

(assert (= (and start!35500 res!197388) b!355776))

(assert (= (and b!355776 res!197387) b!355775))

(assert (= (and b!355775 res!197389) b!355777))

(assert (= (and b!355772 condMapEmpty!13437) mapIsEmpty!13437))

(assert (= (and b!355772 (not condMapEmpty!13437)) mapNonEmpty!13437))

(get-info :version)

(assert (= (and mapNonEmpty!13437 ((_ is ValueCellFull!3633) mapValue!13437)) b!355774))

(assert (= (and b!355772 ((_ is ValueCellFull!3633) mapDefault!13437)) b!355773))

(assert (= start!35500 b!355772))

(declare-fun m!354397 () Bool)

(assert (=> mapNonEmpty!13437 m!354397))

(declare-fun m!354399 () Bool)

(assert (=> b!355775 m!354399))

(declare-fun m!354401 () Bool)

(assert (=> b!355777 m!354401))

(declare-fun m!354403 () Bool)

(assert (=> start!35500 m!354403))

(declare-fun m!354405 () Bool)

(assert (=> start!35500 m!354405))

(declare-fun m!354407 () Bool)

(assert (=> start!35500 m!354407))

(check-sat (not mapNonEmpty!13437) tp_is_empty!7953 (not b!355777) (not b!355775) (not start!35500))
(check-sat)
