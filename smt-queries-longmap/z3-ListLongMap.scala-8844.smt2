; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107290 () Bool)

(assert start!107290)

(declare-fun mapIsEmpty!51049 () Bool)

(declare-fun mapRes!51049 () Bool)

(assert (=> mapIsEmpty!51049 mapRes!51049))

(declare-fun b!1271633 () Bool)

(declare-fun e!725174 () Bool)

(assert (=> b!1271633 (= e!725174 false)))

(declare-fun lt!574905 () Bool)

(declare-datatypes ((array!83206 0))(
  ( (array!83207 (arr!40140 (Array (_ BitVec 32) (_ BitVec 64))) (size!40676 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83206)

(declare-datatypes ((List!28534 0))(
  ( (Nil!28531) (Cons!28530 (h!29739 (_ BitVec 64)) (t!42063 List!28534)) )
))
(declare-fun arrayNoDuplicates!0 (array!83206 (_ BitVec 32) List!28534) Bool)

(assert (=> b!1271633 (= lt!574905 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28531))))

(declare-fun b!1271634 () Bool)

(declare-fun res!846011 () Bool)

(assert (=> b!1271634 (=> (not res!846011) (not e!725174))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83206 (_ BitVec 32)) Bool)

(assert (=> b!1271634 (= res!846011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846009 () Bool)

(assert (=> start!107290 (=> (not res!846009) (not e!725174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107290 (= res!846009 (validMask!0 mask!1730))))

(assert (=> start!107290 e!725174))

(declare-datatypes ((V!49165 0))(
  ( (V!49166 (val!16564 Int)) )
))
(declare-datatypes ((ValueCell!15636 0))(
  ( (ValueCellFull!15636 (v!19201 V!49165)) (EmptyCell!15636) )
))
(declare-datatypes ((array!83208 0))(
  ( (array!83209 (arr!40141 (Array (_ BitVec 32) ValueCell!15636)) (size!40677 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83208)

(declare-fun e!725176 () Bool)

(declare-fun array_inv!30531 (array!83208) Bool)

(assert (=> start!107290 (and (array_inv!30531 _values!1134) e!725176)))

(assert (=> start!107290 true))

(declare-fun array_inv!30532 (array!83206) Bool)

(assert (=> start!107290 (array_inv!30532 _keys!1364)))

(declare-fun b!1271635 () Bool)

(declare-fun e!725178 () Bool)

(declare-fun tp_is_empty!32979 () Bool)

(assert (=> b!1271635 (= e!725178 tp_is_empty!32979)))

(declare-fun b!1271636 () Bool)

(declare-fun e!725175 () Bool)

(assert (=> b!1271636 (= e!725176 (and e!725175 mapRes!51049))))

(declare-fun condMapEmpty!51049 () Bool)

(declare-fun mapDefault!51049 () ValueCell!15636)

(assert (=> b!1271636 (= condMapEmpty!51049 (= (arr!40141 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15636)) mapDefault!51049)))))

(declare-fun b!1271637 () Bool)

(declare-fun res!846010 () Bool)

(assert (=> b!1271637 (=> (not res!846010) (not e!725174))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271637 (= res!846010 (and (= (size!40677 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40676 _keys!1364) (size!40677 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51049 () Bool)

(declare-fun tp!97390 () Bool)

(assert (=> mapNonEmpty!51049 (= mapRes!51049 (and tp!97390 e!725178))))

(declare-fun mapKey!51049 () (_ BitVec 32))

(declare-fun mapRest!51049 () (Array (_ BitVec 32) ValueCell!15636))

(declare-fun mapValue!51049 () ValueCell!15636)

(assert (=> mapNonEmpty!51049 (= (arr!40141 _values!1134) (store mapRest!51049 mapKey!51049 mapValue!51049))))

(declare-fun b!1271638 () Bool)

(assert (=> b!1271638 (= e!725175 tp_is_empty!32979)))

(assert (= (and start!107290 res!846009) b!1271637))

(assert (= (and b!1271637 res!846010) b!1271634))

(assert (= (and b!1271634 res!846011) b!1271633))

(assert (= (and b!1271636 condMapEmpty!51049) mapIsEmpty!51049))

(assert (= (and b!1271636 (not condMapEmpty!51049)) mapNonEmpty!51049))

(get-info :version)

(assert (= (and mapNonEmpty!51049 ((_ is ValueCellFull!15636) mapValue!51049)) b!1271635))

(assert (= (and b!1271636 ((_ is ValueCellFull!15636) mapDefault!51049)) b!1271638))

(assert (= start!107290 b!1271636))

(declare-fun m!1169519 () Bool)

(assert (=> b!1271633 m!1169519))

(declare-fun m!1169521 () Bool)

(assert (=> b!1271634 m!1169521))

(declare-fun m!1169523 () Bool)

(assert (=> start!107290 m!1169523))

(declare-fun m!1169525 () Bool)

(assert (=> start!107290 m!1169525))

(declare-fun m!1169527 () Bool)

(assert (=> start!107290 m!1169527))

(declare-fun m!1169529 () Bool)

(assert (=> mapNonEmpty!51049 m!1169529))

(check-sat (not start!107290) (not b!1271634) (not b!1271633) (not mapNonEmpty!51049) tp_is_empty!32979)
(check-sat)
