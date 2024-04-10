; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7412 () Bool)

(assert start!7412)

(declare-fun mapNonEmpty!2117 () Bool)

(declare-fun mapRes!2117 () Bool)

(declare-fun tp!6266 () Bool)

(declare-fun e!30507 () Bool)

(assert (=> mapNonEmpty!2117 (= mapRes!2117 (and tp!6266 e!30507))))

(declare-datatypes ((V!2465 0))(
  ( (V!2466 (val!1063 Int)) )
))
(declare-datatypes ((ValueCell!735 0))(
  ( (ValueCellFull!735 (v!2124 V!2465)) (EmptyCell!735) )
))
(declare-fun mapValue!2117 () ValueCell!735)

(declare-fun mapRest!2117 () (Array (_ BitVec 32) ValueCell!735))

(declare-fun mapKey!2117 () (_ BitVec 32))

(declare-datatypes ((array!3161 0))(
  ( (array!3162 (arr!1515 (Array (_ BitVec 32) ValueCell!735)) (size!1737 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3161)

(assert (=> mapNonEmpty!2117 (= (arr!1515 _values!1550) (store mapRest!2117 mapKey!2117 mapValue!2117))))

(declare-fun b!47606 () Bool)

(declare-fun e!30508 () Bool)

(declare-fun e!30504 () Bool)

(assert (=> b!47606 (= e!30508 (and e!30504 mapRes!2117))))

(declare-fun condMapEmpty!2117 () Bool)

(declare-fun mapDefault!2117 () ValueCell!735)

(assert (=> b!47606 (= condMapEmpty!2117 (= (arr!1515 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!735)) mapDefault!2117)))))

(declare-fun b!47607 () Bool)

(declare-fun res!27691 () Bool)

(declare-fun e!30506 () Bool)

(assert (=> b!47607 (=> (not res!27691) (not e!30506))))

(declare-datatypes ((array!3163 0))(
  ( (array!3164 (arr!1516 (Array (_ BitVec 32) (_ BitVec 64))) (size!1738 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3163)

(declare-datatypes ((List!1265 0))(
  ( (Nil!1262) (Cons!1261 (h!1841 (_ BitVec 64)) (t!4293 List!1265)) )
))
(declare-fun arrayNoDuplicates!0 (array!3163 (_ BitVec 32) List!1265) Bool)

(assert (=> b!47607 (= res!27691 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1262))))

(declare-fun b!47608 () Bool)

(declare-fun tp_is_empty!2049 () Bool)

(assert (=> b!47608 (= e!30507 tp_is_empty!2049)))

(declare-fun b!47609 () Bool)

(declare-fun res!27694 () Bool)

(assert (=> b!47609 (=> (not res!27694) (not e!30506))))

(declare-fun k0!1421 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47609 (= res!27694 (validKeyInArray!0 k0!1421))))

(declare-fun res!27692 () Bool)

(assert (=> start!7412 (=> (not res!27692) (not e!30506))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7412 (= res!27692 (validMask!0 mask!2458))))

(assert (=> start!7412 e!30506))

(assert (=> start!7412 true))

(declare-fun array_inv!914 (array!3163) Bool)

(assert (=> start!7412 (array_inv!914 _keys!1940)))

(declare-fun array_inv!915 (array!3161) Bool)

(assert (=> start!7412 (and (array_inv!915 _values!1550) e!30508)))

(declare-fun b!47610 () Bool)

(declare-fun res!27695 () Bool)

(assert (=> b!47610 (=> (not res!27695) (not e!30506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3163 (_ BitVec 32)) Bool)

(assert (=> b!47610 (= res!27695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47611 () Bool)

(declare-fun res!27693 () Bool)

(assert (=> b!47611 (=> (not res!27693) (not e!30506))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47611 (= res!27693 (and (= (size!1737 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1738 _keys!1940) (size!1737 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47612 () Bool)

(assert (=> b!47612 (= e!30506 (not (= (size!1738 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458))))))

(declare-fun b!47613 () Bool)

(assert (=> b!47613 (= e!30504 tp_is_empty!2049)))

(declare-fun mapIsEmpty!2117 () Bool)

(assert (=> mapIsEmpty!2117 mapRes!2117))

(assert (= (and start!7412 res!27692) b!47611))

(assert (= (and b!47611 res!27693) b!47610))

(assert (= (and b!47610 res!27695) b!47607))

(assert (= (and b!47607 res!27691) b!47609))

(assert (= (and b!47609 res!27694) b!47612))

(assert (= (and b!47606 condMapEmpty!2117) mapIsEmpty!2117))

(assert (= (and b!47606 (not condMapEmpty!2117)) mapNonEmpty!2117))

(get-info :version)

(assert (= (and mapNonEmpty!2117 ((_ is ValueCellFull!735) mapValue!2117)) b!47608))

(assert (= (and b!47606 ((_ is ValueCellFull!735) mapDefault!2117)) b!47613))

(assert (= start!7412 b!47606))

(declare-fun m!41763 () Bool)

(assert (=> mapNonEmpty!2117 m!41763))

(declare-fun m!41765 () Bool)

(assert (=> start!7412 m!41765))

(declare-fun m!41767 () Bool)

(assert (=> start!7412 m!41767))

(declare-fun m!41769 () Bool)

(assert (=> start!7412 m!41769))

(declare-fun m!41771 () Bool)

(assert (=> b!47610 m!41771))

(declare-fun m!41773 () Bool)

(assert (=> b!47607 m!41773))

(declare-fun m!41775 () Bool)

(assert (=> b!47609 m!41775))

(check-sat (not b!47607) (not b!47609) (not mapNonEmpty!2117) tp_is_empty!2049 (not b!47610) (not start!7412))
(check-sat)
