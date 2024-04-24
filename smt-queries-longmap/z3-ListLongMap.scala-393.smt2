; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7404 () Bool)

(assert start!7404)

(declare-fun mapNonEmpty!2096 () Bool)

(declare-fun mapRes!2096 () Bool)

(declare-fun tp!6245 () Bool)

(declare-fun e!30364 () Bool)

(assert (=> mapNonEmpty!2096 (= mapRes!2096 (and tp!6245 e!30364))))

(declare-fun mapKey!2096 () (_ BitVec 32))

(declare-datatypes ((V!2447 0))(
  ( (V!2448 (val!1056 Int)) )
))
(declare-datatypes ((ValueCell!728 0))(
  ( (ValueCellFull!728 (v!2118 V!2447)) (EmptyCell!728) )
))
(declare-fun mapValue!2096 () ValueCell!728)

(declare-datatypes ((array!3124 0))(
  ( (array!3125 (arr!1496 (Array (_ BitVec 32) ValueCell!728)) (size!1718 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3124)

(declare-fun mapRest!2096 () (Array (_ BitVec 32) ValueCell!728))

(assert (=> mapNonEmpty!2096 (= (arr!1496 _values!1550) (store mapRest!2096 mapKey!2096 mapValue!2096))))

(declare-fun b!47413 () Bool)

(declare-fun res!27595 () Bool)

(declare-fun e!30363 () Bool)

(assert (=> b!47413 (=> (not res!27595) (not e!30363))))

(declare-datatypes ((array!3126 0))(
  ( (array!3127 (arr!1497 (Array (_ BitVec 32) (_ BitVec 64))) (size!1719 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3126)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3126 (_ BitVec 32)) Bool)

(assert (=> b!47413 (= res!27595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47414 () Bool)

(declare-fun tp_is_empty!2035 () Bool)

(assert (=> b!47414 (= e!30364 tp_is_empty!2035)))

(declare-fun b!47415 () Bool)

(declare-fun res!27594 () Bool)

(assert (=> b!47415 (=> (not res!27594) (not e!30363))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47415 (= res!27594 (and (= (size!1718 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1719 _keys!1940) (size!1718 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47416 () Bool)

(assert (=> b!47416 (= e!30363 false)))

(declare-fun lt!20380 () Bool)

(declare-datatypes ((List!1246 0))(
  ( (Nil!1243) (Cons!1242 (h!1822 (_ BitVec 64)) (t!4274 List!1246)) )
))
(declare-fun arrayNoDuplicates!0 (array!3126 (_ BitVec 32) List!1246) Bool)

(assert (=> b!47416 (= lt!20380 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1243))))

(declare-fun b!47418 () Bool)

(declare-fun e!30365 () Bool)

(declare-fun e!30362 () Bool)

(assert (=> b!47418 (= e!30365 (and e!30362 mapRes!2096))))

(declare-fun condMapEmpty!2096 () Bool)

(declare-fun mapDefault!2096 () ValueCell!728)

(assert (=> b!47418 (= condMapEmpty!2096 (= (arr!1496 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!728)) mapDefault!2096)))))

(declare-fun mapIsEmpty!2096 () Bool)

(assert (=> mapIsEmpty!2096 mapRes!2096))

(declare-fun res!27593 () Bool)

(assert (=> start!7404 (=> (not res!27593) (not e!30363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7404 (= res!27593 (validMask!0 mask!2458))))

(assert (=> start!7404 e!30363))

(assert (=> start!7404 true))

(declare-fun array_inv!892 (array!3124) Bool)

(assert (=> start!7404 (and (array_inv!892 _values!1550) e!30365)))

(declare-fun array_inv!893 (array!3126) Bool)

(assert (=> start!7404 (array_inv!893 _keys!1940)))

(declare-fun b!47417 () Bool)

(assert (=> b!47417 (= e!30362 tp_is_empty!2035)))

(assert (= (and start!7404 res!27593) b!47415))

(assert (= (and b!47415 res!27594) b!47413))

(assert (= (and b!47413 res!27595) b!47416))

(assert (= (and b!47418 condMapEmpty!2096) mapIsEmpty!2096))

(assert (= (and b!47418 (not condMapEmpty!2096)) mapNonEmpty!2096))

(get-info :version)

(assert (= (and mapNonEmpty!2096 ((_ is ValueCellFull!728) mapValue!2096)) b!47414))

(assert (= (and b!47418 ((_ is ValueCellFull!728) mapDefault!2096)) b!47417))

(assert (= start!7404 b!47418))

(declare-fun m!41553 () Bool)

(assert (=> mapNonEmpty!2096 m!41553))

(declare-fun m!41555 () Bool)

(assert (=> b!47413 m!41555))

(declare-fun m!41557 () Bool)

(assert (=> b!47416 m!41557))

(declare-fun m!41559 () Bool)

(assert (=> start!7404 m!41559))

(declare-fun m!41561 () Bool)

(assert (=> start!7404 m!41561))

(declare-fun m!41563 () Bool)

(assert (=> start!7404 m!41563))

(check-sat (not b!47416) (not mapNonEmpty!2096) (not start!7404) tp_is_empty!2035 (not b!47413))
(check-sat)
