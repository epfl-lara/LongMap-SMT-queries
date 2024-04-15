; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107006 () Bool)

(assert start!107006)

(declare-fun res!844381 () Bool)

(declare-fun e!723019 () Bool)

(assert (=> start!107006 (=> (not res!844381) (not e!723019))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107006 (= res!844381 (validMask!0 mask!1730))))

(assert (=> start!107006 e!723019))

(declare-datatypes ((V!48787 0))(
  ( (V!48788 (val!16422 Int)) )
))
(declare-datatypes ((ValueCell!15494 0))(
  ( (ValueCellFull!15494 (v!19058 V!48787)) (EmptyCell!15494) )
))
(declare-datatypes ((array!82579 0))(
  ( (array!82580 (arr!39827 (Array (_ BitVec 32) ValueCell!15494)) (size!40365 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82579)

(declare-fun e!723016 () Bool)

(declare-fun array_inv!30471 (array!82579) Bool)

(assert (=> start!107006 (and (array_inv!30471 _values!1134) e!723016)))

(assert (=> start!107006 true))

(declare-datatypes ((array!82581 0))(
  ( (array!82582 (arr!39828 (Array (_ BitVec 32) (_ BitVec 64))) (size!40366 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82581)

(declare-fun array_inv!30472 (array!82581) Bool)

(assert (=> start!107006 (array_inv!30472 _keys!1364)))

(declare-fun mapIsEmpty!50623 () Bool)

(declare-fun mapRes!50623 () Bool)

(assert (=> mapIsEmpty!50623 mapRes!50623))

(declare-fun b!1268689 () Bool)

(declare-fun res!844382 () Bool)

(assert (=> b!1268689 (=> (not res!844382) (not e!723019))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82581 (_ BitVec 32)) Bool)

(assert (=> b!1268689 (= res!844382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268690 () Bool)

(declare-fun e!723017 () Bool)

(declare-fun tp_is_empty!32695 () Bool)

(assert (=> b!1268690 (= e!723017 tp_is_empty!32695)))

(declare-fun b!1268691 () Bool)

(assert (=> b!1268691 (= e!723019 false)))

(declare-fun lt!574301 () Bool)

(declare-datatypes ((List!28478 0))(
  ( (Nil!28475) (Cons!28474 (h!29683 (_ BitVec 64)) (t!41999 List!28478)) )
))
(declare-fun arrayNoDuplicates!0 (array!82581 (_ BitVec 32) List!28478) Bool)

(assert (=> b!1268691 (= lt!574301 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28475))))

(declare-fun mapNonEmpty!50623 () Bool)

(declare-fun tp!96803 () Bool)

(assert (=> mapNonEmpty!50623 (= mapRes!50623 (and tp!96803 e!723017))))

(declare-fun mapKey!50623 () (_ BitVec 32))

(declare-fun mapValue!50623 () ValueCell!15494)

(declare-fun mapRest!50623 () (Array (_ BitVec 32) ValueCell!15494))

(assert (=> mapNonEmpty!50623 (= (arr!39827 _values!1134) (store mapRest!50623 mapKey!50623 mapValue!50623))))

(declare-fun b!1268692 () Bool)

(declare-fun res!844380 () Bool)

(assert (=> b!1268692 (=> (not res!844380) (not e!723019))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268692 (= res!844380 (and (= (size!40365 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40366 _keys!1364) (size!40365 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268693 () Bool)

(declare-fun e!723015 () Bool)

(assert (=> b!1268693 (= e!723015 tp_is_empty!32695)))

(declare-fun b!1268694 () Bool)

(assert (=> b!1268694 (= e!723016 (and e!723015 mapRes!50623))))

(declare-fun condMapEmpty!50623 () Bool)

(declare-fun mapDefault!50623 () ValueCell!15494)

(assert (=> b!1268694 (= condMapEmpty!50623 (= (arr!39827 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15494)) mapDefault!50623)))))

(assert (= (and start!107006 res!844381) b!1268692))

(assert (= (and b!1268692 res!844380) b!1268689))

(assert (= (and b!1268689 res!844382) b!1268691))

(assert (= (and b!1268694 condMapEmpty!50623) mapIsEmpty!50623))

(assert (= (and b!1268694 (not condMapEmpty!50623)) mapNonEmpty!50623))

(get-info :version)

(assert (= (and mapNonEmpty!50623 ((_ is ValueCellFull!15494) mapValue!50623)) b!1268690))

(assert (= (and b!1268694 ((_ is ValueCellFull!15494) mapDefault!50623)) b!1268693))

(assert (= start!107006 b!1268694))

(declare-fun m!1166991 () Bool)

(assert (=> start!107006 m!1166991))

(declare-fun m!1166993 () Bool)

(assert (=> start!107006 m!1166993))

(declare-fun m!1166995 () Bool)

(assert (=> start!107006 m!1166995))

(declare-fun m!1166997 () Bool)

(assert (=> b!1268689 m!1166997))

(declare-fun m!1166999 () Bool)

(assert (=> b!1268691 m!1166999))

(declare-fun m!1167001 () Bool)

(assert (=> mapNonEmpty!50623 m!1167001))

(check-sat (not b!1268689) tp_is_empty!32695 (not start!107006) (not b!1268691) (not mapNonEmpty!50623))
(check-sat)
