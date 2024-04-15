; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35322 () Bool)

(assert start!35322)

(declare-fun mapIsEmpty!13206 () Bool)

(declare-fun mapRes!13206 () Bool)

(assert (=> mapIsEmpty!13206 mapRes!13206))

(declare-fun b!353590 () Bool)

(declare-fun e!216601 () Bool)

(declare-fun tp_is_empty!7801 () Bool)

(assert (=> b!353590 (= e!216601 tp_is_empty!7801)))

(declare-fun b!353591 () Bool)

(declare-fun res!196056 () Bool)

(declare-fun e!216603 () Bool)

(assert (=> b!353591 (=> (not res!196056) (not e!216603))))

(declare-datatypes ((array!19177 0))(
  ( (array!19178 (arr!9083 (Array (_ BitVec 32) (_ BitVec 64))) (size!9436 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19177)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19177 (_ BitVec 32)) Bool)

(assert (=> b!353591 (= res!196056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!196055 () Bool)

(assert (=> start!35322 (=> (not res!196055) (not e!216603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35322 (= res!196055 (validMask!0 mask!1842))))

(assert (=> start!35322 e!216603))

(assert (=> start!35322 true))

(declare-datatypes ((V!11379 0))(
  ( (V!11380 (val!3945 Int)) )
))
(declare-datatypes ((ValueCell!3557 0))(
  ( (ValueCellFull!3557 (v!6133 V!11379)) (EmptyCell!3557) )
))
(declare-datatypes ((array!19179 0))(
  ( (array!19180 (arr!9084 (Array (_ BitVec 32) ValueCell!3557)) (size!9437 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19179)

(declare-fun e!216602 () Bool)

(declare-fun array_inv!6724 (array!19179) Bool)

(assert (=> start!35322 (and (array_inv!6724 _values!1208) e!216602)))

(declare-fun array_inv!6725 (array!19177) Bool)

(assert (=> start!35322 (array_inv!6725 _keys!1456)))

(declare-fun mapNonEmpty!13206 () Bool)

(declare-fun tp!27102 () Bool)

(assert (=> mapNonEmpty!13206 (= mapRes!13206 (and tp!27102 e!216601))))

(declare-fun mapRest!13206 () (Array (_ BitVec 32) ValueCell!3557))

(declare-fun mapKey!13206 () (_ BitVec 32))

(declare-fun mapValue!13206 () ValueCell!3557)

(assert (=> mapNonEmpty!13206 (= (arr!9084 _values!1208) (store mapRest!13206 mapKey!13206 mapValue!13206))))

(declare-fun b!353592 () Bool)

(declare-fun e!216599 () Bool)

(assert (=> b!353592 (= e!216599 tp_is_empty!7801)))

(declare-fun b!353593 () Bool)

(declare-fun res!196057 () Bool)

(assert (=> b!353593 (=> (not res!196057) (not e!216603))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!353593 (= res!196057 (and (= (size!9437 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9436 _keys!1456) (size!9437 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353594 () Bool)

(assert (=> b!353594 (= e!216602 (and e!216599 mapRes!13206))))

(declare-fun condMapEmpty!13206 () Bool)

(declare-fun mapDefault!13206 () ValueCell!3557)

(assert (=> b!353594 (= condMapEmpty!13206 (= (arr!9084 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3557)) mapDefault!13206)))))

(declare-fun b!353595 () Bool)

(assert (=> b!353595 (= e!216603 false)))

(declare-fun lt!165382 () Bool)

(declare-datatypes ((List!5251 0))(
  ( (Nil!5248) (Cons!5247 (h!6103 (_ BitVec 64)) (t!10392 List!5251)) )
))
(declare-fun arrayNoDuplicates!0 (array!19177 (_ BitVec 32) List!5251) Bool)

(assert (=> b!353595 (= lt!165382 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5248))))

(assert (= (and start!35322 res!196055) b!353593))

(assert (= (and b!353593 res!196057) b!353591))

(assert (= (and b!353591 res!196056) b!353595))

(assert (= (and b!353594 condMapEmpty!13206) mapIsEmpty!13206))

(assert (= (and b!353594 (not condMapEmpty!13206)) mapNonEmpty!13206))

(get-info :version)

(assert (= (and mapNonEmpty!13206 ((_ is ValueCellFull!3557) mapValue!13206)) b!353590))

(assert (= (and b!353594 ((_ is ValueCellFull!3557) mapDefault!13206)) b!353592))

(assert (= start!35322 b!353594))

(declare-fun m!352353 () Bool)

(assert (=> b!353591 m!352353))

(declare-fun m!352355 () Bool)

(assert (=> start!35322 m!352355))

(declare-fun m!352357 () Bool)

(assert (=> start!35322 m!352357))

(declare-fun m!352359 () Bool)

(assert (=> start!35322 m!352359))

(declare-fun m!352361 () Bool)

(assert (=> mapNonEmpty!13206 m!352361))

(declare-fun m!352363 () Bool)

(assert (=> b!353595 m!352363))

(check-sat tp_is_empty!7801 (not start!35322) (not b!353595) (not mapNonEmpty!13206) (not b!353591))
(check-sat)
