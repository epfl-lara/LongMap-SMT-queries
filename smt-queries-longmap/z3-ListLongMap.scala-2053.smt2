; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35472 () Bool)

(assert start!35472)

(declare-fun b!355593 () Bool)

(declare-fun e!217806 () Bool)

(assert (=> b!355593 (= e!217806 false)))

(declare-fun lt!165842 () Bool)

(declare-datatypes ((array!19446 0))(
  ( (array!19447 (arr!9216 (Array (_ BitVec 32) (_ BitVec 64))) (size!9568 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19446)

(declare-datatypes ((List!5252 0))(
  ( (Nil!5249) (Cons!5248 (h!6104 (_ BitVec 64)) (t!10394 List!5252)) )
))
(declare-fun arrayNoDuplicates!0 (array!19446 (_ BitVec 32) List!5252) Bool)

(assert (=> b!355593 (= lt!165842 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5249))))

(declare-fun mapIsEmpty!13416 () Bool)

(declare-fun mapRes!13416 () Bool)

(assert (=> mapIsEmpty!13416 mapRes!13416))

(declare-fun mapNonEmpty!13416 () Bool)

(declare-fun tp!27393 () Bool)

(declare-fun e!217805 () Bool)

(assert (=> mapNonEmpty!13416 (= mapRes!13416 (and tp!27393 e!217805))))

(declare-fun mapKey!13416 () (_ BitVec 32))

(declare-datatypes ((V!11563 0))(
  ( (V!11564 (val!4014 Int)) )
))
(declare-datatypes ((ValueCell!3626 0))(
  ( (ValueCellFull!3626 (v!6209 V!11563)) (EmptyCell!3626) )
))
(declare-fun mapRest!13416 () (Array (_ BitVec 32) ValueCell!3626))

(declare-fun mapValue!13416 () ValueCell!3626)

(declare-datatypes ((array!19448 0))(
  ( (array!19449 (arr!9217 (Array (_ BitVec 32) ValueCell!3626)) (size!9569 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19448)

(assert (=> mapNonEmpty!13416 (= (arr!9217 _values!1208) (store mapRest!13416 mapKey!13416 mapValue!13416))))

(declare-fun b!355594 () Bool)

(declare-fun e!217803 () Bool)

(declare-fun tp_is_empty!7939 () Bool)

(assert (=> b!355594 (= e!217803 tp_is_empty!7939)))

(declare-fun b!355595 () Bool)

(declare-fun res!197323 () Bool)

(assert (=> b!355595 (=> (not res!197323) (not e!217806))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!355595 (= res!197323 (and (= (size!9569 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9568 _keys!1456) (size!9569 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!197321 () Bool)

(assert (=> start!35472 (=> (not res!197321) (not e!217806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35472 (= res!197321 (validMask!0 mask!1842))))

(assert (=> start!35472 e!217806))

(assert (=> start!35472 true))

(declare-fun e!217804 () Bool)

(declare-fun array_inv!6812 (array!19448) Bool)

(assert (=> start!35472 (and (array_inv!6812 _values!1208) e!217804)))

(declare-fun array_inv!6813 (array!19446) Bool)

(assert (=> start!35472 (array_inv!6813 _keys!1456)))

(declare-fun b!355596 () Bool)

(assert (=> b!355596 (= e!217804 (and e!217803 mapRes!13416))))

(declare-fun condMapEmpty!13416 () Bool)

(declare-fun mapDefault!13416 () ValueCell!3626)

(assert (=> b!355596 (= condMapEmpty!13416 (= (arr!9217 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3626)) mapDefault!13416)))))

(declare-fun b!355597 () Bool)

(assert (=> b!355597 (= e!217805 tp_is_empty!7939)))

(declare-fun b!355598 () Bool)

(declare-fun res!197322 () Bool)

(assert (=> b!355598 (=> (not res!197322) (not e!217806))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19446 (_ BitVec 32)) Bool)

(assert (=> b!355598 (= res!197322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(assert (= (and start!35472 res!197321) b!355595))

(assert (= (and b!355595 res!197323) b!355598))

(assert (= (and b!355598 res!197322) b!355593))

(assert (= (and b!355596 condMapEmpty!13416) mapIsEmpty!13416))

(assert (= (and b!355596 (not condMapEmpty!13416)) mapNonEmpty!13416))

(get-info :version)

(assert (= (and mapNonEmpty!13416 ((_ is ValueCellFull!3626) mapValue!13416)) b!355597))

(assert (= (and b!355596 ((_ is ValueCellFull!3626) mapDefault!13416)) b!355594))

(assert (= start!35472 b!355596))

(declare-fun m!354537 () Bool)

(assert (=> b!355593 m!354537))

(declare-fun m!354539 () Bool)

(assert (=> mapNonEmpty!13416 m!354539))

(declare-fun m!354541 () Bool)

(assert (=> start!35472 m!354541))

(declare-fun m!354543 () Bool)

(assert (=> start!35472 m!354543))

(declare-fun m!354545 () Bool)

(assert (=> start!35472 m!354545))

(declare-fun m!354547 () Bool)

(assert (=> b!355598 m!354547))

(check-sat (not mapNonEmpty!13416) tp_is_empty!7939 (not b!355598) (not b!355593) (not start!35472))
(check-sat)
