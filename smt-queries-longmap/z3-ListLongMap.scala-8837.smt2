; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107470 () Bool)

(assert start!107470)

(declare-fun b!1272542 () Bool)

(declare-fun res!846333 () Bool)

(declare-fun e!725694 () Bool)

(assert (=> b!1272542 (=> (not res!846333) (not e!725694))))

(declare-datatypes ((V!49107 0))(
  ( (V!49108 (val!16542 Int)) )
))
(declare-datatypes ((ValueCell!15614 0))(
  ( (ValueCellFull!15614 (v!19174 V!49107)) (EmptyCell!15614) )
))
(declare-datatypes ((array!83149 0))(
  ( (array!83150 (arr!40107 (Array (_ BitVec 32) ValueCell!15614)) (size!40644 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83149)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83151 0))(
  ( (array!83152 (arr!40108 (Array (_ BitVec 32) (_ BitVec 64))) (size!40645 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83151)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272542 (= res!846333 (and (= (size!40644 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40645 _keys!1364) (size!40644 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272543 () Bool)

(declare-fun e!725693 () Bool)

(declare-fun e!725692 () Bool)

(declare-fun mapRes!50983 () Bool)

(assert (=> b!1272543 (= e!725693 (and e!725692 mapRes!50983))))

(declare-fun condMapEmpty!50983 () Bool)

(declare-fun mapDefault!50983 () ValueCell!15614)

(assert (=> b!1272543 (= condMapEmpty!50983 (= (arr!40107 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15614)) mapDefault!50983)))))

(declare-fun mapIsEmpty!50983 () Bool)

(assert (=> mapIsEmpty!50983 mapRes!50983))

(declare-fun b!1272544 () Bool)

(declare-fun tp_is_empty!32935 () Bool)

(assert (=> b!1272544 (= e!725692 tp_is_empty!32935)))

(declare-fun b!1272545 () Bool)

(declare-fun res!846332 () Bool)

(assert (=> b!1272545 (=> (not res!846332) (not e!725694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83151 (_ BitVec 32)) Bool)

(assert (=> b!1272545 (= res!846332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272546 () Bool)

(declare-fun e!725695 () Bool)

(assert (=> b!1272546 (= e!725695 tp_is_empty!32935)))

(declare-fun b!1272547 () Bool)

(assert (=> b!1272547 (= e!725694 false)))

(declare-fun lt!575323 () Bool)

(declare-datatypes ((List!28548 0))(
  ( (Nil!28545) (Cons!28544 (h!29762 (_ BitVec 64)) (t!42069 List!28548)) )
))
(declare-fun arrayNoDuplicates!0 (array!83151 (_ BitVec 32) List!28548) Bool)

(assert (=> b!1272547 (= lt!575323 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28545))))

(declare-fun mapNonEmpty!50983 () Bool)

(declare-fun tp!97324 () Bool)

(assert (=> mapNonEmpty!50983 (= mapRes!50983 (and tp!97324 e!725695))))

(declare-fun mapKey!50983 () (_ BitVec 32))

(declare-fun mapValue!50983 () ValueCell!15614)

(declare-fun mapRest!50983 () (Array (_ BitVec 32) ValueCell!15614))

(assert (=> mapNonEmpty!50983 (= (arr!40107 _values!1134) (store mapRest!50983 mapKey!50983 mapValue!50983))))

(declare-fun res!846331 () Bool)

(assert (=> start!107470 (=> (not res!846331) (not e!725694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107470 (= res!846331 (validMask!0 mask!1730))))

(assert (=> start!107470 e!725694))

(declare-fun array_inv!30671 (array!83149) Bool)

(assert (=> start!107470 (and (array_inv!30671 _values!1134) e!725693)))

(assert (=> start!107470 true))

(declare-fun array_inv!30672 (array!83151) Bool)

(assert (=> start!107470 (array_inv!30672 _keys!1364)))

(assert (= (and start!107470 res!846331) b!1272542))

(assert (= (and b!1272542 res!846333) b!1272545))

(assert (= (and b!1272545 res!846332) b!1272547))

(assert (= (and b!1272543 condMapEmpty!50983) mapIsEmpty!50983))

(assert (= (and b!1272543 (not condMapEmpty!50983)) mapNonEmpty!50983))

(get-info :version)

(assert (= (and mapNonEmpty!50983 ((_ is ValueCellFull!15614) mapValue!50983)) b!1272546))

(assert (= (and b!1272543 ((_ is ValueCellFull!15614) mapDefault!50983)) b!1272544))

(assert (= start!107470 b!1272543))

(declare-fun m!1170867 () Bool)

(assert (=> b!1272545 m!1170867))

(declare-fun m!1170869 () Bool)

(assert (=> b!1272547 m!1170869))

(declare-fun m!1170871 () Bool)

(assert (=> mapNonEmpty!50983 m!1170871))

(declare-fun m!1170873 () Bool)

(assert (=> start!107470 m!1170873))

(declare-fun m!1170875 () Bool)

(assert (=> start!107470 m!1170875))

(declare-fun m!1170877 () Bool)

(assert (=> start!107470 m!1170877))

(check-sat (not b!1272547) (not mapNonEmpty!50983) tp_is_empty!32935 (not start!107470) (not b!1272545))
(check-sat)
