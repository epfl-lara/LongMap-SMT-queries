; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7416 () Bool)

(assert start!7416)

(declare-fun b!47525 () Bool)

(declare-fun res!27654 () Bool)

(declare-fun e!30454 () Bool)

(assert (=> b!47525 (=> (not res!27654) (not e!30454))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2463 0))(
  ( (V!2464 (val!1062 Int)) )
))
(declare-datatypes ((ValueCell!734 0))(
  ( (ValueCellFull!734 (v!2124 V!2463)) (EmptyCell!734) )
))
(declare-datatypes ((array!3146 0))(
  ( (array!3147 (arr!1507 (Array (_ BitVec 32) ValueCell!734)) (size!1729 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3146)

(declare-datatypes ((array!3148 0))(
  ( (array!3149 (arr!1508 (Array (_ BitVec 32) (_ BitVec 64))) (size!1730 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3148)

(assert (=> b!47525 (= res!27654 (and (= (size!1729 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1730 _keys!1940) (size!1729 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47526 () Bool)

(assert (=> b!47526 (= e!30454 (not (= (size!1730 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458))))))

(declare-fun mapIsEmpty!2114 () Bool)

(declare-fun mapRes!2114 () Bool)

(assert (=> mapIsEmpty!2114 mapRes!2114))

(declare-fun b!47527 () Bool)

(declare-fun res!27655 () Bool)

(assert (=> b!47527 (=> (not res!27655) (not e!30454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3148 (_ BitVec 32)) Bool)

(assert (=> b!47527 (= res!27655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47528 () Bool)

(declare-fun e!30452 () Bool)

(declare-fun e!30456 () Bool)

(assert (=> b!47528 (= e!30452 (and e!30456 mapRes!2114))))

(declare-fun condMapEmpty!2114 () Bool)

(declare-fun mapDefault!2114 () ValueCell!734)

(assert (=> b!47528 (= condMapEmpty!2114 (= (arr!1507 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!734)) mapDefault!2114)))))

(declare-fun res!27653 () Bool)

(assert (=> start!7416 (=> (not res!27653) (not e!30454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7416 (= res!27653 (validMask!0 mask!2458))))

(assert (=> start!7416 e!30454))

(assert (=> start!7416 true))

(declare-fun array_inv!900 (array!3148) Bool)

(assert (=> start!7416 (array_inv!900 _keys!1940)))

(declare-fun array_inv!901 (array!3146) Bool)

(assert (=> start!7416 (and (array_inv!901 _values!1550) e!30452)))

(declare-fun b!47529 () Bool)

(declare-fun e!30455 () Bool)

(declare-fun tp_is_empty!2047 () Bool)

(assert (=> b!47529 (= e!30455 tp_is_empty!2047)))

(declare-fun b!47530 () Bool)

(declare-fun res!27652 () Bool)

(assert (=> b!47530 (=> (not res!27652) (not e!30454))))

(declare-datatypes ((List!1249 0))(
  ( (Nil!1246) (Cons!1245 (h!1825 (_ BitVec 64)) (t!4277 List!1249)) )
))
(declare-fun arrayNoDuplicates!0 (array!3148 (_ BitVec 32) List!1249) Bool)

(assert (=> b!47530 (= res!27652 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1246))))

(declare-fun b!47531 () Bool)

(assert (=> b!47531 (= e!30456 tp_is_empty!2047)))

(declare-fun b!47532 () Bool)

(declare-fun res!27651 () Bool)

(assert (=> b!47532 (=> (not res!27651) (not e!30454))))

(declare-fun k0!1421 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47532 (= res!27651 (validKeyInArray!0 k0!1421))))

(declare-fun mapNonEmpty!2114 () Bool)

(declare-fun tp!6263 () Bool)

(assert (=> mapNonEmpty!2114 (= mapRes!2114 (and tp!6263 e!30455))))

(declare-fun mapKey!2114 () (_ BitVec 32))

(declare-fun mapRest!2114 () (Array (_ BitVec 32) ValueCell!734))

(declare-fun mapValue!2114 () ValueCell!734)

(assert (=> mapNonEmpty!2114 (= (arr!1507 _values!1550) (store mapRest!2114 mapKey!2114 mapValue!2114))))

(assert (= (and start!7416 res!27653) b!47525))

(assert (= (and b!47525 res!27654) b!47527))

(assert (= (and b!47527 res!27655) b!47530))

(assert (= (and b!47530 res!27652) b!47532))

(assert (= (and b!47532 res!27651) b!47526))

(assert (= (and b!47528 condMapEmpty!2114) mapIsEmpty!2114))

(assert (= (and b!47528 (not condMapEmpty!2114)) mapNonEmpty!2114))

(get-info :version)

(assert (= (and mapNonEmpty!2114 ((_ is ValueCellFull!734) mapValue!2114)) b!47529))

(assert (= (and b!47528 ((_ is ValueCellFull!734) mapDefault!2114)) b!47531))

(assert (= start!7416 b!47528))

(declare-fun m!41625 () Bool)

(assert (=> b!47532 m!41625))

(declare-fun m!41627 () Bool)

(assert (=> b!47527 m!41627))

(declare-fun m!41629 () Bool)

(assert (=> mapNonEmpty!2114 m!41629))

(declare-fun m!41631 () Bool)

(assert (=> b!47530 m!41631))

(declare-fun m!41633 () Bool)

(assert (=> start!7416 m!41633))

(declare-fun m!41635 () Bool)

(assert (=> start!7416 m!41635))

(declare-fun m!41637 () Bool)

(assert (=> start!7416 m!41637))

(check-sat (not b!47532) (not start!7416) tp_is_empty!2047 (not b!47527) (not mapNonEmpty!2114) (not b!47530))
(check-sat)
