; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3774 () Bool)

(assert start!3774)

(declare-fun b!26324 () Bool)

(declare-fun e!17136 () Bool)

(declare-fun tp_is_empty!1099 () Bool)

(assert (=> b!26324 (= e!17136 tp_is_empty!1099)))

(declare-fun b!26325 () Bool)

(declare-fun res!15634 () Bool)

(declare-fun e!17135 () Bool)

(assert (=> b!26325 (=> (not res!15634) (not e!17135))))

(declare-datatypes ((array!1419 0))(
  ( (array!1420 (arr!667 (Array (_ BitVec 32) (_ BitVec 64))) (size!768 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1419)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1419 (_ BitVec 32)) Bool)

(assert (=> b!26325 (= res!15634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1165 () Bool)

(declare-fun mapRes!1165 () Bool)

(assert (=> mapIsEmpty!1165 mapRes!1165))

(declare-fun mapNonEmpty!1165 () Bool)

(declare-fun tp!3685 () Bool)

(declare-fun e!17137 () Bool)

(assert (=> mapNonEmpty!1165 (= mapRes!1165 (and tp!3685 e!17137))))

(declare-datatypes ((V!1291 0))(
  ( (V!1292 (val!576 Int)) )
))
(declare-datatypes ((ValueCell!350 0))(
  ( (ValueCellFull!350 (v!1662 V!1291)) (EmptyCell!350) )
))
(declare-datatypes ((array!1421 0))(
  ( (array!1422 (arr!668 (Array (_ BitVec 32) ValueCell!350)) (size!769 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1421)

(declare-fun mapKey!1165 () (_ BitVec 32))

(declare-fun mapRest!1165 () (Array (_ BitVec 32) ValueCell!350))

(declare-fun mapValue!1165 () ValueCell!350)

(assert (=> mapNonEmpty!1165 (= (arr!668 _values!1501) (store mapRest!1165 mapKey!1165 mapValue!1165))))

(declare-fun b!26326 () Bool)

(declare-fun res!15633 () Bool)

(assert (=> b!26326 (=> (not res!15633) (not e!17135))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26326 (= res!15633 (and (= (size!769 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!768 _keys!1833) (size!769 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26327 () Bool)

(assert (=> b!26327 (= e!17135 false)))

(declare-fun lt!10314 () Bool)

(declare-datatypes ((List!582 0))(
  ( (Nil!579) (Cons!578 (h!1145 (_ BitVec 64)) (t!3263 List!582)) )
))
(declare-fun arrayNoDuplicates!0 (array!1419 (_ BitVec 32) List!582) Bool)

(assert (=> b!26327 (= lt!10314 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!579))))

(declare-fun res!15635 () Bool)

(assert (=> start!3774 (=> (not res!15635) (not e!17135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3774 (= res!15635 (validMask!0 mask!2294))))

(assert (=> start!3774 e!17135))

(assert (=> start!3774 true))

(declare-fun e!17134 () Bool)

(declare-fun array_inv!467 (array!1421) Bool)

(assert (=> start!3774 (and (array_inv!467 _values!1501) e!17134)))

(declare-fun array_inv!468 (array!1419) Bool)

(assert (=> start!3774 (array_inv!468 _keys!1833)))

(declare-fun b!26328 () Bool)

(assert (=> b!26328 (= e!17137 tp_is_empty!1099)))

(declare-fun b!26329 () Bool)

(assert (=> b!26329 (= e!17134 (and e!17136 mapRes!1165))))

(declare-fun condMapEmpty!1165 () Bool)

(declare-fun mapDefault!1165 () ValueCell!350)

(assert (=> b!26329 (= condMapEmpty!1165 (= (arr!668 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!350)) mapDefault!1165)))))

(assert (= (and start!3774 res!15635) b!26326))

(assert (= (and b!26326 res!15633) b!26325))

(assert (= (and b!26325 res!15634) b!26327))

(assert (= (and b!26329 condMapEmpty!1165) mapIsEmpty!1165))

(assert (= (and b!26329 (not condMapEmpty!1165)) mapNonEmpty!1165))

(get-info :version)

(assert (= (and mapNonEmpty!1165 ((_ is ValueCellFull!350) mapValue!1165)) b!26328))

(assert (= (and b!26329 ((_ is ValueCellFull!350) mapDefault!1165)) b!26324))

(assert (= start!3774 b!26329))

(declare-fun m!21033 () Bool)

(assert (=> b!26325 m!21033))

(declare-fun m!21035 () Bool)

(assert (=> mapNonEmpty!1165 m!21035))

(declare-fun m!21037 () Bool)

(assert (=> b!26327 m!21037))

(declare-fun m!21039 () Bool)

(assert (=> start!3774 m!21039))

(declare-fun m!21041 () Bool)

(assert (=> start!3774 m!21041))

(declare-fun m!21043 () Bool)

(assert (=> start!3774 m!21043))

(check-sat (not start!3774) (not b!26327) (not b!26325) tp_is_empty!1099 (not mapNonEmpty!1165))
(check-sat)
