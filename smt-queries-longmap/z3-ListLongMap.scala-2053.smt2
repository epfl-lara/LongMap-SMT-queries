; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35472 () Bool)

(assert start!35472)

(declare-fun b!355371 () Bool)

(declare-fun e!217661 () Bool)

(declare-fun tp_is_empty!7939 () Bool)

(assert (=> b!355371 (= e!217661 tp_is_empty!7939)))

(declare-fun mapNonEmpty!13416 () Bool)

(declare-fun mapRes!13416 () Bool)

(declare-fun tp!27393 () Bool)

(declare-fun e!217664 () Bool)

(assert (=> mapNonEmpty!13416 (= mapRes!13416 (and tp!27393 e!217664))))

(declare-datatypes ((V!11563 0))(
  ( (V!11564 (val!4014 Int)) )
))
(declare-datatypes ((ValueCell!3626 0))(
  ( (ValueCellFull!3626 (v!6202 V!11563)) (EmptyCell!3626) )
))
(declare-datatypes ((array!19441 0))(
  ( (array!19442 (arr!9214 (Array (_ BitVec 32) ValueCell!3626)) (size!9567 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19441)

(declare-fun mapKey!13416 () (_ BitVec 32))

(declare-fun mapValue!13416 () ValueCell!3626)

(declare-fun mapRest!13416 () (Array (_ BitVec 32) ValueCell!3626))

(assert (=> mapNonEmpty!13416 (= (arr!9214 _values!1208) (store mapRest!13416 mapKey!13416 mapValue!13416))))

(declare-fun res!197196 () Bool)

(declare-fun e!217663 () Bool)

(assert (=> start!35472 (=> (not res!197196) (not e!217663))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35472 (= res!197196 (validMask!0 mask!1842))))

(assert (=> start!35472 e!217663))

(assert (=> start!35472 true))

(declare-fun e!217665 () Bool)

(declare-fun array_inv!6818 (array!19441) Bool)

(assert (=> start!35472 (and (array_inv!6818 _values!1208) e!217665)))

(declare-datatypes ((array!19443 0))(
  ( (array!19444 (arr!9215 (Array (_ BitVec 32) (_ BitVec 64))) (size!9568 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19443)

(declare-fun array_inv!6819 (array!19443) Bool)

(assert (=> start!35472 (array_inv!6819 _keys!1456)))

(declare-fun b!355372 () Bool)

(assert (=> b!355372 (= e!217664 tp_is_empty!7939)))

(declare-fun b!355373 () Bool)

(declare-fun res!197197 () Bool)

(assert (=> b!355373 (=> (not res!197197) (not e!217663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19443 (_ BitVec 32)) Bool)

(assert (=> b!355373 (= res!197197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!355374 () Bool)

(assert (=> b!355374 (= e!217665 (and e!217661 mapRes!13416))))

(declare-fun condMapEmpty!13416 () Bool)

(declare-fun mapDefault!13416 () ValueCell!3626)

(assert (=> b!355374 (= condMapEmpty!13416 (= (arr!9214 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3626)) mapDefault!13416)))))

(declare-fun b!355375 () Bool)

(declare-fun res!197195 () Bool)

(assert (=> b!355375 (=> (not res!197195) (not e!217663))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355375 (= res!197195 (and (= (size!9567 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9568 _keys!1456) (size!9567 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!355376 () Bool)

(assert (=> b!355376 (= e!217663 false)))

(declare-fun lt!165589 () Bool)

(declare-datatypes ((List!5313 0))(
  ( (Nil!5310) (Cons!5309 (h!6165 (_ BitVec 64)) (t!10454 List!5313)) )
))
(declare-fun arrayNoDuplicates!0 (array!19443 (_ BitVec 32) List!5313) Bool)

(assert (=> b!355376 (= lt!165589 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5310))))

(declare-fun mapIsEmpty!13416 () Bool)

(assert (=> mapIsEmpty!13416 mapRes!13416))

(assert (= (and start!35472 res!197196) b!355375))

(assert (= (and b!355375 res!197195) b!355373))

(assert (= (and b!355373 res!197197) b!355376))

(assert (= (and b!355374 condMapEmpty!13416) mapIsEmpty!13416))

(assert (= (and b!355374 (not condMapEmpty!13416)) mapNonEmpty!13416))

(get-info :version)

(assert (= (and mapNonEmpty!13416 ((_ is ValueCellFull!3626) mapValue!13416)) b!355372))

(assert (= (and b!355374 ((_ is ValueCellFull!3626) mapDefault!13416)) b!355371))

(assert (= start!35472 b!355374))

(declare-fun m!353583 () Bool)

(assert (=> mapNonEmpty!13416 m!353583))

(declare-fun m!353585 () Bool)

(assert (=> start!35472 m!353585))

(declare-fun m!353587 () Bool)

(assert (=> start!35472 m!353587))

(declare-fun m!353589 () Bool)

(assert (=> start!35472 m!353589))

(declare-fun m!353591 () Bool)

(assert (=> b!355373 m!353591))

(declare-fun m!353593 () Bool)

(assert (=> b!355376 m!353593))

(check-sat (not b!355376) (not start!35472) (not mapNonEmpty!13416) (not b!355373) tp_is_empty!7939)
(check-sat)
