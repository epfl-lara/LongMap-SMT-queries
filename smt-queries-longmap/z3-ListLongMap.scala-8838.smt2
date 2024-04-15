; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107252 () Bool)

(assert start!107252)

(declare-fun b!1271227 () Bool)

(declare-fun e!724863 () Bool)

(declare-fun tp_is_empty!32941 () Bool)

(assert (=> b!1271227 (= e!724863 tp_is_empty!32941)))

(declare-fun mapNonEmpty!50992 () Bool)

(declare-fun mapRes!50992 () Bool)

(declare-fun tp!97334 () Bool)

(assert (=> mapNonEmpty!50992 (= mapRes!50992 (and tp!97334 e!724863))))

(declare-datatypes ((V!49115 0))(
  ( (V!49116 (val!16545 Int)) )
))
(declare-datatypes ((ValueCell!15617 0))(
  ( (ValueCellFull!15617 (v!19181 V!49115)) (EmptyCell!15617) )
))
(declare-datatypes ((array!83047 0))(
  ( (array!83048 (arr!40061 (Array (_ BitVec 32) ValueCell!15617)) (size!40599 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83047)

(declare-fun mapValue!50992 () ValueCell!15617)

(declare-fun mapRest!50992 () (Array (_ BitVec 32) ValueCell!15617))

(declare-fun mapKey!50992 () (_ BitVec 32))

(assert (=> mapNonEmpty!50992 (= (arr!40061 _values!1134) (store mapRest!50992 mapKey!50992 mapValue!50992))))

(declare-fun mapIsEmpty!50992 () Bool)

(assert (=> mapIsEmpty!50992 mapRes!50992))

(declare-fun b!1271228 () Bool)

(declare-fun e!724861 () Bool)

(assert (=> b!1271228 (= e!724861 tp_is_empty!32941)))

(declare-fun b!1271229 () Bool)

(declare-fun e!724864 () Bool)

(assert (=> b!1271229 (= e!724864 false)))

(declare-fun lt!574670 () Bool)

(declare-datatypes ((array!83049 0))(
  ( (array!83050 (arr!40062 (Array (_ BitVec 32) (_ BitVec 64))) (size!40600 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83049)

(declare-datatypes ((List!28598 0))(
  ( (Nil!28595) (Cons!28594 (h!29803 (_ BitVec 64)) (t!42119 List!28598)) )
))
(declare-fun arrayNoDuplicates!0 (array!83049 (_ BitVec 32) List!28598) Bool)

(assert (=> b!1271229 (= lt!574670 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28595))))

(declare-fun res!845811 () Bool)

(assert (=> start!107252 (=> (not res!845811) (not e!724864))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107252 (= res!845811 (validMask!0 mask!1730))))

(assert (=> start!107252 e!724864))

(declare-fun e!724860 () Bool)

(declare-fun array_inv!30627 (array!83047) Bool)

(assert (=> start!107252 (and (array_inv!30627 _values!1134) e!724860)))

(assert (=> start!107252 true))

(declare-fun array_inv!30628 (array!83049) Bool)

(assert (=> start!107252 (array_inv!30628 _keys!1364)))

(declare-fun b!1271230 () Bool)

(declare-fun res!845812 () Bool)

(assert (=> b!1271230 (=> (not res!845812) (not e!724864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83049 (_ BitVec 32)) Bool)

(assert (=> b!1271230 (= res!845812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271231 () Bool)

(assert (=> b!1271231 (= e!724860 (and e!724861 mapRes!50992))))

(declare-fun condMapEmpty!50992 () Bool)

(declare-fun mapDefault!50992 () ValueCell!15617)

(assert (=> b!1271231 (= condMapEmpty!50992 (= (arr!40061 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15617)) mapDefault!50992)))))

(declare-fun b!1271232 () Bool)

(declare-fun res!845813 () Bool)

(assert (=> b!1271232 (=> (not res!845813) (not e!724864))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271232 (= res!845813 (and (= (size!40599 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40600 _keys!1364) (size!40599 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107252 res!845811) b!1271232))

(assert (= (and b!1271232 res!845813) b!1271230))

(assert (= (and b!1271230 res!845812) b!1271229))

(assert (= (and b!1271231 condMapEmpty!50992) mapIsEmpty!50992))

(assert (= (and b!1271231 (not condMapEmpty!50992)) mapNonEmpty!50992))

(get-info :version)

(assert (= (and mapNonEmpty!50992 ((_ is ValueCellFull!15617) mapValue!50992)) b!1271227))

(assert (= (and b!1271231 ((_ is ValueCellFull!15617) mapDefault!50992)) b!1271228))

(assert (= start!107252 b!1271231))

(declare-fun m!1168791 () Bool)

(assert (=> mapNonEmpty!50992 m!1168791))

(declare-fun m!1168793 () Bool)

(assert (=> b!1271229 m!1168793))

(declare-fun m!1168795 () Bool)

(assert (=> start!107252 m!1168795))

(declare-fun m!1168797 () Bool)

(assert (=> start!107252 m!1168797))

(declare-fun m!1168799 () Bool)

(assert (=> start!107252 m!1168799))

(declare-fun m!1168801 () Bool)

(assert (=> b!1271230 m!1168801))

(check-sat (not b!1271229) (not mapNonEmpty!50992) (not b!1271230) (not start!107252) tp_is_empty!32941)
(check-sat)
