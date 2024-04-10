; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7418 () Bool)

(assert start!7418)

(declare-fun mapIsEmpty!2126 () Bool)

(declare-fun mapRes!2126 () Bool)

(assert (=> mapIsEmpty!2126 mapRes!2126))

(declare-fun b!47668 () Bool)

(declare-fun e!30550 () Bool)

(declare-fun e!30549 () Bool)

(assert (=> b!47668 (= e!30550 (and e!30549 mapRes!2126))))

(declare-fun condMapEmpty!2126 () Bool)

(declare-datatypes ((V!2473 0))(
  ( (V!2474 (val!1066 Int)) )
))
(declare-datatypes ((ValueCell!738 0))(
  ( (ValueCellFull!738 (v!2127 V!2473)) (EmptyCell!738) )
))
(declare-datatypes ((array!3173 0))(
  ( (array!3174 (arr!1521 (Array (_ BitVec 32) ValueCell!738)) (size!1743 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3173)

(declare-fun mapDefault!2126 () ValueCell!738)

(assert (=> b!47668 (= condMapEmpty!2126 (= (arr!1521 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!738)) mapDefault!2126)))))

(declare-fun b!47669 () Bool)

(declare-fun e!30553 () Bool)

(declare-fun tp_is_empty!2055 () Bool)

(assert (=> b!47669 (= e!30553 tp_is_empty!2055)))

(declare-fun b!47670 () Bool)

(declare-fun e!30552 () Bool)

(assert (=> b!47670 (= e!30552 false)))

(declare-fun lt!20444 () Bool)

(declare-datatypes ((array!3175 0))(
  ( (array!3176 (arr!1522 (Array (_ BitVec 32) (_ BitVec 64))) (size!1744 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3175)

(declare-datatypes ((List!1266 0))(
  ( (Nil!1263) (Cons!1262 (h!1842 (_ BitVec 64)) (t!4294 List!1266)) )
))
(declare-fun arrayNoDuplicates!0 (array!3175 (_ BitVec 32) List!1266) Bool)

(assert (=> b!47670 (= lt!20444 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1263))))

(declare-fun b!47671 () Bool)

(declare-fun res!27726 () Bool)

(assert (=> b!47671 (=> (not res!27726) (not e!30552))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!3175 (_ BitVec 32)) Bool)

(assert (=> b!47671 (= res!27726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1940 mask!2458))))

(declare-fun b!47672 () Bool)

(assert (=> b!47672 (= e!30549 tp_is_empty!2055)))

(declare-fun res!27728 () Bool)

(assert (=> start!7418 (=> (not res!27728) (not e!30552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7418 (= res!27728 (validMask!0 mask!2458))))

(assert (=> start!7418 e!30552))

(assert (=> start!7418 true))

(declare-fun array_inv!918 (array!3173) Bool)

(assert (=> start!7418 (and (array_inv!918 _values!1550) e!30550)))

(declare-fun array_inv!919 (array!3175) Bool)

(assert (=> start!7418 (array_inv!919 _keys!1940)))

(declare-fun b!47673 () Bool)

(declare-fun res!27727 () Bool)

(assert (=> b!47673 (=> (not res!27727) (not e!30552))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47673 (= res!27727 (and (= (size!1743 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1744 _keys!1940) (size!1743 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!2126 () Bool)

(declare-fun tp!6275 () Bool)

(assert (=> mapNonEmpty!2126 (= mapRes!2126 (and tp!6275 e!30553))))

(declare-fun mapKey!2126 () (_ BitVec 32))

(declare-fun mapValue!2126 () ValueCell!738)

(declare-fun mapRest!2126 () (Array (_ BitVec 32) ValueCell!738))

(assert (=> mapNonEmpty!2126 (= (arr!1521 _values!1550) (store mapRest!2126 mapKey!2126 mapValue!2126))))

(assert (= (and start!7418 res!27728) b!47673))

(assert (= (and b!47673 res!27727) b!47671))

(assert (= (and b!47671 res!27726) b!47670))

(assert (= (and b!47668 condMapEmpty!2126) mapIsEmpty!2126))

(assert (= (and b!47668 (not condMapEmpty!2126)) mapNonEmpty!2126))

(get-info :version)

(assert (= (and mapNonEmpty!2126 ((_ is ValueCellFull!738) mapValue!2126)) b!47669))

(assert (= (and b!47668 ((_ is ValueCellFull!738) mapDefault!2126)) b!47672))

(assert (= start!7418 b!47668))

(declare-fun m!41803 () Bool)

(assert (=> b!47670 m!41803))

(declare-fun m!41805 () Bool)

(assert (=> b!47671 m!41805))

(declare-fun m!41807 () Bool)

(assert (=> start!7418 m!41807))

(declare-fun m!41809 () Bool)

(assert (=> start!7418 m!41809))

(declare-fun m!41811 () Bool)

(assert (=> start!7418 m!41811))

(declare-fun m!41813 () Bool)

(assert (=> mapNonEmpty!2126 m!41813))

(check-sat (not start!7418) (not mapNonEmpty!2126) (not b!47671) tp_is_empty!2055 (not b!47670))
(check-sat)
