; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35488 () Bool)

(assert start!35488)

(declare-fun mapNonEmpty!13419 () Bool)

(declare-fun mapRes!13419 () Bool)

(declare-fun tp!27396 () Bool)

(declare-fun e!217856 () Bool)

(assert (=> mapNonEmpty!13419 (= mapRes!13419 (and tp!27396 e!217856))))

(declare-datatypes ((V!11565 0))(
  ( (V!11566 (val!4015 Int)) )
))
(declare-datatypes ((ValueCell!3627 0))(
  ( (ValueCellFull!3627 (v!6209 V!11565)) (EmptyCell!3627) )
))
(declare-fun mapRest!13419 () (Array (_ BitVec 32) ValueCell!3627))

(declare-fun mapKey!13419 () (_ BitVec 32))

(declare-datatypes ((array!19461 0))(
  ( (array!19462 (arr!9224 (Array (_ BitVec 32) ValueCell!3627)) (size!9576 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19461)

(declare-fun mapValue!13419 () ValueCell!3627)

(assert (=> mapNonEmpty!13419 (= (arr!9224 _values!1208) (store mapRest!13419 mapKey!13419 mapValue!13419))))

(declare-fun b!355665 () Bool)

(declare-fun res!197335 () Bool)

(declare-fun e!217852 () Bool)

(assert (=> b!355665 (=> (not res!197335) (not e!217852))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19463 0))(
  ( (array!19464 (arr!9225 (Array (_ BitVec 32) (_ BitVec 64))) (size!9577 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19463)

(assert (=> b!355665 (= res!197335 (and (= (size!9576 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9577 _keys!1456) (size!9576 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355666 () Bool)

(declare-fun e!217853 () Bool)

(declare-fun e!217854 () Bool)

(assert (=> b!355666 (= e!217853 (and e!217854 mapRes!13419))))

(declare-fun condMapEmpty!13419 () Bool)

(declare-fun mapDefault!13419 () ValueCell!3627)

(assert (=> b!355666 (= condMapEmpty!13419 (= (arr!9224 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3627)) mapDefault!13419)))))

(declare-fun b!355667 () Bool)

(assert (=> b!355667 (= e!217852 false)))

(declare-fun lt!165827 () Bool)

(declare-datatypes ((List!5344 0))(
  ( (Nil!5341) (Cons!5340 (h!6196 (_ BitVec 64)) (t!10494 List!5344)) )
))
(declare-fun arrayNoDuplicates!0 (array!19463 (_ BitVec 32) List!5344) Bool)

(assert (=> b!355667 (= lt!165827 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5341))))

(declare-fun b!355668 () Bool)

(declare-fun res!197334 () Bool)

(assert (=> b!355668 (=> (not res!197334) (not e!217852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19463 (_ BitVec 32)) Bool)

(assert (=> b!355668 (= res!197334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355669 () Bool)

(declare-fun tp_is_empty!7941 () Bool)

(assert (=> b!355669 (= e!217856 tp_is_empty!7941)))

(declare-fun mapIsEmpty!13419 () Bool)

(assert (=> mapIsEmpty!13419 mapRes!13419))

(declare-fun res!197333 () Bool)

(assert (=> start!35488 (=> (not res!197333) (not e!217852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35488 (= res!197333 (validMask!0 mask!1842))))

(assert (=> start!35488 e!217852))

(assert (=> start!35488 true))

(declare-fun array_inv!6778 (array!19461) Bool)

(assert (=> start!35488 (and (array_inv!6778 _values!1208) e!217853)))

(declare-fun array_inv!6779 (array!19463) Bool)

(assert (=> start!35488 (array_inv!6779 _keys!1456)))

(declare-fun b!355664 () Bool)

(assert (=> b!355664 (= e!217854 tp_is_empty!7941)))

(assert (= (and start!35488 res!197333) b!355665))

(assert (= (and b!355665 res!197335) b!355668))

(assert (= (and b!355668 res!197334) b!355667))

(assert (= (and b!355666 condMapEmpty!13419) mapIsEmpty!13419))

(assert (= (and b!355666 (not condMapEmpty!13419)) mapNonEmpty!13419))

(get-info :version)

(assert (= (and mapNonEmpty!13419 ((_ is ValueCellFull!3627) mapValue!13419)) b!355669))

(assert (= (and b!355666 ((_ is ValueCellFull!3627) mapDefault!13419)) b!355664))

(assert (= start!35488 b!355666))

(declare-fun m!354325 () Bool)

(assert (=> mapNonEmpty!13419 m!354325))

(declare-fun m!354327 () Bool)

(assert (=> b!355667 m!354327))

(declare-fun m!354329 () Bool)

(assert (=> b!355668 m!354329))

(declare-fun m!354331 () Bool)

(assert (=> start!35488 m!354331))

(declare-fun m!354333 () Bool)

(assert (=> start!35488 m!354333))

(declare-fun m!354335 () Bool)

(assert (=> start!35488 m!354335))

(check-sat (not mapNonEmpty!13419) (not b!355667) (not b!355668) (not start!35488) tp_is_empty!7941)
(check-sat)
