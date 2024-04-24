; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7410 () Bool)

(assert start!7410)

(declare-fun b!47467 () Bool)

(declare-fun e!30407 () Bool)

(declare-fun e!30411 () Bool)

(declare-fun mapRes!2105 () Bool)

(assert (=> b!47467 (= e!30407 (and e!30411 mapRes!2105))))

(declare-fun condMapEmpty!2105 () Bool)

(declare-datatypes ((V!2455 0))(
  ( (V!2456 (val!1059 Int)) )
))
(declare-datatypes ((ValueCell!731 0))(
  ( (ValueCellFull!731 (v!2121 V!2455)) (EmptyCell!731) )
))
(declare-datatypes ((array!3134 0))(
  ( (array!3135 (arr!1501 (Array (_ BitVec 32) ValueCell!731)) (size!1723 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3134)

(declare-fun mapDefault!2105 () ValueCell!731)

(assert (=> b!47467 (= condMapEmpty!2105 (= (arr!1501 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!731)) mapDefault!2105)))))

(declare-fun res!27621 () Bool)

(declare-fun e!30410 () Bool)

(assert (=> start!7410 (=> (not res!27621) (not e!30410))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7410 (= res!27621 (validMask!0 mask!2458))))

(assert (=> start!7410 e!30410))

(assert (=> start!7410 true))

(declare-fun array_inv!894 (array!3134) Bool)

(assert (=> start!7410 (and (array_inv!894 _values!1550) e!30407)))

(declare-datatypes ((array!3136 0))(
  ( (array!3137 (arr!1502 (Array (_ BitVec 32) (_ BitVec 64))) (size!1724 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3136)

(declare-fun array_inv!895 (array!3136) Bool)

(assert (=> start!7410 (array_inv!895 _keys!1940)))

(declare-fun b!47468 () Bool)

(declare-fun res!27622 () Bool)

(assert (=> b!47468 (=> (not res!27622) (not e!30410))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47468 (= res!27622 (and (= (size!1723 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1724 _keys!1940) (size!1723 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!2105 () Bool)

(assert (=> mapIsEmpty!2105 mapRes!2105))

(declare-fun b!47469 () Bool)

(declare-fun e!30408 () Bool)

(declare-fun tp_is_empty!2041 () Bool)

(assert (=> b!47469 (= e!30408 tp_is_empty!2041)))

(declare-fun b!47470 () Bool)

(declare-fun res!27620 () Bool)

(assert (=> b!47470 (=> (not res!27620) (not e!30410))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3136 (_ BitVec 32)) Bool)

(assert (=> b!47470 (= res!27620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47471 () Bool)

(assert (=> b!47471 (= e!30411 tp_is_empty!2041)))

(declare-fun b!47472 () Bool)

(assert (=> b!47472 (= e!30410 false)))

(declare-fun lt!20389 () Bool)

(declare-datatypes ((List!1247 0))(
  ( (Nil!1244) (Cons!1243 (h!1823 (_ BitVec 64)) (t!4275 List!1247)) )
))
(declare-fun arrayNoDuplicates!0 (array!3136 (_ BitVec 32) List!1247) Bool)

(assert (=> b!47472 (= lt!20389 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1244))))

(declare-fun mapNonEmpty!2105 () Bool)

(declare-fun tp!6254 () Bool)

(assert (=> mapNonEmpty!2105 (= mapRes!2105 (and tp!6254 e!30408))))

(declare-fun mapKey!2105 () (_ BitVec 32))

(declare-fun mapRest!2105 () (Array (_ BitVec 32) ValueCell!731))

(declare-fun mapValue!2105 () ValueCell!731)

(assert (=> mapNonEmpty!2105 (= (arr!1501 _values!1550) (store mapRest!2105 mapKey!2105 mapValue!2105))))

(assert (= (and start!7410 res!27621) b!47468))

(assert (= (and b!47468 res!27622) b!47470))

(assert (= (and b!47470 res!27620) b!47472))

(assert (= (and b!47467 condMapEmpty!2105) mapIsEmpty!2105))

(assert (= (and b!47467 (not condMapEmpty!2105)) mapNonEmpty!2105))

(get-info :version)

(assert (= (and mapNonEmpty!2105 ((_ is ValueCellFull!731) mapValue!2105)) b!47469))

(assert (= (and b!47467 ((_ is ValueCellFull!731) mapDefault!2105)) b!47471))

(assert (= start!7410 b!47467))

(declare-fun m!41589 () Bool)

(assert (=> start!7410 m!41589))

(declare-fun m!41591 () Bool)

(assert (=> start!7410 m!41591))

(declare-fun m!41593 () Bool)

(assert (=> start!7410 m!41593))

(declare-fun m!41595 () Bool)

(assert (=> b!47470 m!41595))

(declare-fun m!41597 () Bool)

(assert (=> b!47472 m!41597))

(declare-fun m!41599 () Bool)

(assert (=> mapNonEmpty!2105 m!41599))

(check-sat tp_is_empty!2041 (not start!7410) (not b!47470) (not mapNonEmpty!2105) (not b!47472))
(check-sat)
