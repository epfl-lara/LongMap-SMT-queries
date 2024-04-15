; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7400 () Bool)

(assert start!7400)

(declare-fun b!47404 () Bool)

(declare-fun res!27599 () Bool)

(declare-fun e!30358 () Bool)

(assert (=> b!47404 (=> (not res!27599) (not e!30358))))

(declare-datatypes ((array!3112 0))(
  ( (array!3113 (arr!1490 (Array (_ BitVec 32) (_ BitVec 64))) (size!1713 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3112)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2447 0))(
  ( (V!2448 (val!1056 Int)) )
))
(declare-datatypes ((ValueCell!728 0))(
  ( (ValueCellFull!728 (v!2115 V!2447)) (EmptyCell!728) )
))
(declare-datatypes ((array!3114 0))(
  ( (array!3115 (arr!1491 (Array (_ BitVec 32) ValueCell!728)) (size!1714 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3114)

(assert (=> b!47404 (= res!27599 (and (= (size!1714 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1713 _keys!1940) (size!1714 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47405 () Bool)

(declare-fun e!30359 () Bool)

(declare-fun tp_is_empty!2035 () Bool)

(assert (=> b!47405 (= e!30359 tp_is_empty!2035)))

(declare-fun b!47406 () Bool)

(declare-fun e!30360 () Bool)

(assert (=> b!47406 (= e!30360 tp_is_empty!2035)))

(declare-fun mapIsEmpty!2096 () Bool)

(declare-fun mapRes!2096 () Bool)

(assert (=> mapIsEmpty!2096 mapRes!2096))

(declare-fun mapNonEmpty!2096 () Bool)

(declare-fun tp!6245 () Bool)

(assert (=> mapNonEmpty!2096 (= mapRes!2096 (and tp!6245 e!30360))))

(declare-fun mapValue!2096 () ValueCell!728)

(declare-fun mapKey!2096 () (_ BitVec 32))

(declare-fun mapRest!2096 () (Array (_ BitVec 32) ValueCell!728))

(assert (=> mapNonEmpty!2096 (= (arr!1491 _values!1550) (store mapRest!2096 mapKey!2096 mapValue!2096))))

(declare-fun res!27598 () Bool)

(assert (=> start!7400 (=> (not res!27598) (not e!30358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7400 (= res!27598 (validMask!0 mask!2458))))

(assert (=> start!7400 e!30358))

(assert (=> start!7400 true))

(declare-fun e!30356 () Bool)

(declare-fun array_inv!900 (array!3114) Bool)

(assert (=> start!7400 (and (array_inv!900 _values!1550) e!30356)))

(declare-fun array_inv!901 (array!3112) Bool)

(assert (=> start!7400 (array_inv!901 _keys!1940)))

(declare-fun b!47407 () Bool)

(assert (=> b!47407 (= e!30358 false)))

(declare-fun lt!20407 () Bool)

(declare-datatypes ((List!1254 0))(
  ( (Nil!1251) (Cons!1250 (h!1830 (_ BitVec 64)) (t!4281 List!1254)) )
))
(declare-fun arrayNoDuplicates!0 (array!3112 (_ BitVec 32) List!1254) Bool)

(assert (=> b!47407 (= lt!20407 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1251))))

(declare-fun b!47408 () Bool)

(assert (=> b!47408 (= e!30356 (and e!30359 mapRes!2096))))

(declare-fun condMapEmpty!2096 () Bool)

(declare-fun mapDefault!2096 () ValueCell!728)

(assert (=> b!47408 (= condMapEmpty!2096 (= (arr!1491 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!728)) mapDefault!2096)))))

(declare-fun b!47409 () Bool)

(declare-fun res!27600 () Bool)

(assert (=> b!47409 (=> (not res!27600) (not e!30358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3112 (_ BitVec 32)) Bool)

(assert (=> b!47409 (= res!27600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(assert (= (and start!7400 res!27598) b!47404))

(assert (= (and b!47404 res!27599) b!47409))

(assert (= (and b!47409 res!27600) b!47407))

(assert (= (and b!47408 condMapEmpty!2096) mapIsEmpty!2096))

(assert (= (and b!47408 (not condMapEmpty!2096)) mapNonEmpty!2096))

(get-info :version)

(assert (= (and mapNonEmpty!2096 ((_ is ValueCellFull!728) mapValue!2096)) b!47406))

(assert (= (and b!47408 ((_ is ValueCellFull!728) mapDefault!2096)) b!47405))

(assert (= start!7400 b!47408))

(declare-fun m!41595 () Bool)

(assert (=> mapNonEmpty!2096 m!41595))

(declare-fun m!41597 () Bool)

(assert (=> start!7400 m!41597))

(declare-fun m!41599 () Bool)

(assert (=> start!7400 m!41599))

(declare-fun m!41601 () Bool)

(assert (=> start!7400 m!41601))

(declare-fun m!41603 () Bool)

(assert (=> b!47407 m!41603))

(declare-fun m!41605 () Bool)

(assert (=> b!47409 m!41605))

(check-sat (not start!7400) tp_is_empty!2035 (not b!47407) (not mapNonEmpty!2096) (not b!47409))
(check-sat)
