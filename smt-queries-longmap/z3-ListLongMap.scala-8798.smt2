; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107012 () Bool)

(assert start!107012)

(declare-fun mapIsEmpty!50632 () Bool)

(declare-fun mapRes!50632 () Bool)

(assert (=> mapIsEmpty!50632 mapRes!50632))

(declare-fun b!1268743 () Bool)

(declare-fun e!723062 () Bool)

(declare-fun e!723061 () Bool)

(assert (=> b!1268743 (= e!723062 (and e!723061 mapRes!50632))))

(declare-fun condMapEmpty!50632 () Bool)

(declare-datatypes ((V!48795 0))(
  ( (V!48796 (val!16425 Int)) )
))
(declare-datatypes ((ValueCell!15497 0))(
  ( (ValueCellFull!15497 (v!19061 V!48795)) (EmptyCell!15497) )
))
(declare-datatypes ((array!82591 0))(
  ( (array!82592 (arr!39833 (Array (_ BitVec 32) ValueCell!15497)) (size!40371 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82591)

(declare-fun mapDefault!50632 () ValueCell!15497)

(assert (=> b!1268743 (= condMapEmpty!50632 (= (arr!39833 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15497)) mapDefault!50632)))))

(declare-fun b!1268744 () Bool)

(declare-fun tp_is_empty!32701 () Bool)

(assert (=> b!1268744 (= e!723061 tp_is_empty!32701)))

(declare-fun b!1268745 () Bool)

(declare-fun res!844408 () Bool)

(declare-fun e!723060 () Bool)

(assert (=> b!1268745 (=> (not res!844408) (not e!723060))))

(declare-datatypes ((array!82593 0))(
  ( (array!82594 (arr!39834 (Array (_ BitVec 32) (_ BitVec 64))) (size!40372 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82593)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82593 (_ BitVec 32)) Bool)

(assert (=> b!1268745 (= res!844408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!844409 () Bool)

(assert (=> start!107012 (=> (not res!844409) (not e!723060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107012 (= res!844409 (validMask!0 mask!1730))))

(assert (=> start!107012 e!723060))

(declare-fun array_inv!30477 (array!82591) Bool)

(assert (=> start!107012 (and (array_inv!30477 _values!1134) e!723062)))

(assert (=> start!107012 true))

(declare-fun array_inv!30478 (array!82593) Bool)

(assert (=> start!107012 (array_inv!30478 _keys!1364)))

(declare-fun b!1268746 () Bool)

(assert (=> b!1268746 (= e!723060 false)))

(declare-fun lt!574310 () Bool)

(declare-datatypes ((List!28481 0))(
  ( (Nil!28478) (Cons!28477 (h!29686 (_ BitVec 64)) (t!42002 List!28481)) )
))
(declare-fun arrayNoDuplicates!0 (array!82593 (_ BitVec 32) List!28481) Bool)

(assert (=> b!1268746 (= lt!574310 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28478))))

(declare-fun b!1268747 () Bool)

(declare-fun e!723063 () Bool)

(assert (=> b!1268747 (= e!723063 tp_is_empty!32701)))

(declare-fun b!1268748 () Bool)

(declare-fun res!844407 () Bool)

(assert (=> b!1268748 (=> (not res!844407) (not e!723060))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268748 (= res!844407 (and (= (size!40371 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40372 _keys!1364) (size!40371 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50632 () Bool)

(declare-fun tp!96812 () Bool)

(assert (=> mapNonEmpty!50632 (= mapRes!50632 (and tp!96812 e!723063))))

(declare-fun mapRest!50632 () (Array (_ BitVec 32) ValueCell!15497))

(declare-fun mapKey!50632 () (_ BitVec 32))

(declare-fun mapValue!50632 () ValueCell!15497)

(assert (=> mapNonEmpty!50632 (= (arr!39833 _values!1134) (store mapRest!50632 mapKey!50632 mapValue!50632))))

(assert (= (and start!107012 res!844409) b!1268748))

(assert (= (and b!1268748 res!844407) b!1268745))

(assert (= (and b!1268745 res!844408) b!1268746))

(assert (= (and b!1268743 condMapEmpty!50632) mapIsEmpty!50632))

(assert (= (and b!1268743 (not condMapEmpty!50632)) mapNonEmpty!50632))

(get-info :version)

(assert (= (and mapNonEmpty!50632 ((_ is ValueCellFull!15497) mapValue!50632)) b!1268747))

(assert (= (and b!1268743 ((_ is ValueCellFull!15497) mapDefault!50632)) b!1268744))

(assert (= start!107012 b!1268743))

(declare-fun m!1167027 () Bool)

(assert (=> b!1268745 m!1167027))

(declare-fun m!1167029 () Bool)

(assert (=> start!107012 m!1167029))

(declare-fun m!1167031 () Bool)

(assert (=> start!107012 m!1167031))

(declare-fun m!1167033 () Bool)

(assert (=> start!107012 m!1167033))

(declare-fun m!1167035 () Bool)

(assert (=> b!1268746 m!1167035))

(declare-fun m!1167037 () Bool)

(assert (=> mapNonEmpty!50632 m!1167037))

(check-sat (not start!107012) (not mapNonEmpty!50632) (not b!1268746) tp_is_empty!32701 (not b!1268745))
(check-sat)
