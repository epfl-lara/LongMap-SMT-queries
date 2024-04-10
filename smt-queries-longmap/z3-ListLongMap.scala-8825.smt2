; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107176 () Bool)

(assert start!107176)

(declare-fun b!1270607 () Bool)

(declare-fun e!724319 () Bool)

(declare-fun e!724322 () Bool)

(declare-fun mapRes!50878 () Bool)

(assert (=> b!1270607 (= e!724319 (and e!724322 mapRes!50878))))

(declare-fun condMapEmpty!50878 () Bool)

(declare-datatypes ((V!49013 0))(
  ( (V!49014 (val!16507 Int)) )
))
(declare-datatypes ((ValueCell!15579 0))(
  ( (ValueCellFull!15579 (v!19144 V!49013)) (EmptyCell!15579) )
))
(declare-datatypes ((array!82990 0))(
  ( (array!82991 (arr!40032 (Array (_ BitVec 32) ValueCell!15579)) (size!40568 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82990)

(declare-fun mapDefault!50878 () ValueCell!15579)

(assert (=> b!1270607 (= condMapEmpty!50878 (= (arr!40032 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15579)) mapDefault!50878)))))

(declare-fun res!845498 () Bool)

(declare-fun e!724323 () Bool)

(assert (=> start!107176 (=> (not res!845498) (not e!724323))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107176 (= res!845498 (validMask!0 mask!1730))))

(assert (=> start!107176 e!724323))

(declare-fun array_inv!30451 (array!82990) Bool)

(assert (=> start!107176 (and (array_inv!30451 _values!1134) e!724319)))

(assert (=> start!107176 true))

(declare-datatypes ((array!82992 0))(
  ( (array!82993 (arr!40033 (Array (_ BitVec 32) (_ BitVec 64))) (size!40569 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82992)

(declare-fun array_inv!30452 (array!82992) Bool)

(assert (=> start!107176 (array_inv!30452 _keys!1364)))

(declare-fun b!1270608 () Bool)

(declare-fun res!845496 () Bool)

(assert (=> b!1270608 (=> (not res!845496) (not e!724323))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82992 (_ BitVec 32)) Bool)

(assert (=> b!1270608 (= res!845496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50878 () Bool)

(assert (=> mapIsEmpty!50878 mapRes!50878))

(declare-fun b!1270609 () Bool)

(assert (=> b!1270609 (= e!724323 false)))

(declare-fun lt!574734 () Bool)

(declare-datatypes ((List!28495 0))(
  ( (Nil!28492) (Cons!28491 (h!29700 (_ BitVec 64)) (t!42024 List!28495)) )
))
(declare-fun arrayNoDuplicates!0 (array!82992 (_ BitVec 32) List!28495) Bool)

(assert (=> b!1270609 (= lt!574734 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28492))))

(declare-fun b!1270610 () Bool)

(declare-fun e!724320 () Bool)

(declare-fun tp_is_empty!32865 () Bool)

(assert (=> b!1270610 (= e!724320 tp_is_empty!32865)))

(declare-fun b!1270611 () Bool)

(assert (=> b!1270611 (= e!724322 tp_is_empty!32865)))

(declare-fun mapNonEmpty!50878 () Bool)

(declare-fun tp!97219 () Bool)

(assert (=> mapNonEmpty!50878 (= mapRes!50878 (and tp!97219 e!724320))))

(declare-fun mapKey!50878 () (_ BitVec 32))

(declare-fun mapValue!50878 () ValueCell!15579)

(declare-fun mapRest!50878 () (Array (_ BitVec 32) ValueCell!15579))

(assert (=> mapNonEmpty!50878 (= (arr!40032 _values!1134) (store mapRest!50878 mapKey!50878 mapValue!50878))))

(declare-fun b!1270612 () Bool)

(declare-fun res!845497 () Bool)

(assert (=> b!1270612 (=> (not res!845497) (not e!724323))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270612 (= res!845497 (and (= (size!40568 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40569 _keys!1364) (size!40568 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107176 res!845498) b!1270612))

(assert (= (and b!1270612 res!845497) b!1270608))

(assert (= (and b!1270608 res!845496) b!1270609))

(assert (= (and b!1270607 condMapEmpty!50878) mapIsEmpty!50878))

(assert (= (and b!1270607 (not condMapEmpty!50878)) mapNonEmpty!50878))

(get-info :version)

(assert (= (and mapNonEmpty!50878 ((_ is ValueCellFull!15579) mapValue!50878)) b!1270610))

(assert (= (and b!1270607 ((_ is ValueCellFull!15579) mapDefault!50878)) b!1270611))

(assert (= start!107176 b!1270607))

(declare-fun m!1168835 () Bool)

(assert (=> start!107176 m!1168835))

(declare-fun m!1168837 () Bool)

(assert (=> start!107176 m!1168837))

(declare-fun m!1168839 () Bool)

(assert (=> start!107176 m!1168839))

(declare-fun m!1168841 () Bool)

(assert (=> b!1270608 m!1168841))

(declare-fun m!1168843 () Bool)

(assert (=> b!1270609 m!1168843))

(declare-fun m!1168845 () Bool)

(assert (=> mapNonEmpty!50878 m!1168845))

(check-sat tp_is_empty!32865 (not b!1270609) (not mapNonEmpty!50878) (not start!107176) (not b!1270608))
(check-sat)
