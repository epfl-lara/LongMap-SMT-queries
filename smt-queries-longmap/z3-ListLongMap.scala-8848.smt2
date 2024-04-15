; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107312 () Bool)

(assert start!107312)

(declare-fun b!1271767 () Bool)

(declare-fun e!725310 () Bool)

(declare-fun e!725314 () Bool)

(declare-fun mapRes!51082 () Bool)

(assert (=> b!1271767 (= e!725310 (and e!725314 mapRes!51082))))

(declare-fun condMapEmpty!51082 () Bool)

(declare-datatypes ((V!49195 0))(
  ( (V!49196 (val!16575 Int)) )
))
(declare-datatypes ((ValueCell!15647 0))(
  ( (ValueCellFull!15647 (v!19211 V!49195)) (EmptyCell!15647) )
))
(declare-datatypes ((array!83153 0))(
  ( (array!83154 (arr!40114 (Array (_ BitVec 32) ValueCell!15647)) (size!40652 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83153)

(declare-fun mapDefault!51082 () ValueCell!15647)

(assert (=> b!1271767 (= condMapEmpty!51082 (= (arr!40114 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15647)) mapDefault!51082)))))

(declare-fun b!1271768 () Bool)

(declare-fun e!725313 () Bool)

(declare-fun tp_is_empty!33001 () Bool)

(assert (=> b!1271768 (= e!725313 tp_is_empty!33001)))

(declare-fun b!1271769 () Bool)

(declare-fun res!846082 () Bool)

(declare-fun e!725311 () Bool)

(assert (=> b!1271769 (=> (not res!846082) (not e!725311))))

(declare-datatypes ((array!83155 0))(
  ( (array!83156 (arr!40115 (Array (_ BitVec 32) (_ BitVec 64))) (size!40653 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83155)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83155 (_ BitVec 32)) Bool)

(assert (=> b!1271769 (= res!846082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271770 () Bool)

(assert (=> b!1271770 (= e!725311 false)))

(declare-fun lt!574760 () Bool)

(declare-datatypes ((List!28616 0))(
  ( (Nil!28613) (Cons!28612 (h!29821 (_ BitVec 64)) (t!42137 List!28616)) )
))
(declare-fun arrayNoDuplicates!0 (array!83155 (_ BitVec 32) List!28616) Bool)

(assert (=> b!1271770 (= lt!574760 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28613))))

(declare-fun b!1271771 () Bool)

(assert (=> b!1271771 (= e!725314 tp_is_empty!33001)))

(declare-fun b!1271772 () Bool)

(declare-fun res!846083 () Bool)

(assert (=> b!1271772 (=> (not res!846083) (not e!725311))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271772 (= res!846083 (and (= (size!40652 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40653 _keys!1364) (size!40652 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51082 () Bool)

(assert (=> mapIsEmpty!51082 mapRes!51082))

(declare-fun res!846081 () Bool)

(assert (=> start!107312 (=> (not res!846081) (not e!725311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107312 (= res!846081 (validMask!0 mask!1730))))

(assert (=> start!107312 e!725311))

(declare-fun array_inv!30663 (array!83153) Bool)

(assert (=> start!107312 (and (array_inv!30663 _values!1134) e!725310)))

(assert (=> start!107312 true))

(declare-fun array_inv!30664 (array!83155) Bool)

(assert (=> start!107312 (array_inv!30664 _keys!1364)))

(declare-fun mapNonEmpty!51082 () Bool)

(declare-fun tp!97424 () Bool)

(assert (=> mapNonEmpty!51082 (= mapRes!51082 (and tp!97424 e!725313))))

(declare-fun mapValue!51082 () ValueCell!15647)

(declare-fun mapKey!51082 () (_ BitVec 32))

(declare-fun mapRest!51082 () (Array (_ BitVec 32) ValueCell!15647))

(assert (=> mapNonEmpty!51082 (= (arr!40114 _values!1134) (store mapRest!51082 mapKey!51082 mapValue!51082))))

(assert (= (and start!107312 res!846081) b!1271772))

(assert (= (and b!1271772 res!846083) b!1271769))

(assert (= (and b!1271769 res!846082) b!1271770))

(assert (= (and b!1271767 condMapEmpty!51082) mapIsEmpty!51082))

(assert (= (and b!1271767 (not condMapEmpty!51082)) mapNonEmpty!51082))

(get-info :version)

(assert (= (and mapNonEmpty!51082 ((_ is ValueCellFull!15647) mapValue!51082)) b!1271768))

(assert (= (and b!1271767 ((_ is ValueCellFull!15647) mapDefault!51082)) b!1271771))

(assert (= start!107312 b!1271767))

(declare-fun m!1169151 () Bool)

(assert (=> b!1271769 m!1169151))

(declare-fun m!1169153 () Bool)

(assert (=> b!1271770 m!1169153))

(declare-fun m!1169155 () Bool)

(assert (=> start!107312 m!1169155))

(declare-fun m!1169157 () Bool)

(assert (=> start!107312 m!1169157))

(declare-fun m!1169159 () Bool)

(assert (=> start!107312 m!1169159))

(declare-fun m!1169161 () Bool)

(assert (=> mapNonEmpty!51082 m!1169161))

(check-sat (not start!107312) (not b!1271769) (not b!1271770) (not mapNonEmpty!51082) tp_is_empty!33001)
(check-sat)
