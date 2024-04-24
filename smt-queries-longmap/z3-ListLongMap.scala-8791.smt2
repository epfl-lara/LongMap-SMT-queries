; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107194 () Bool)

(assert start!107194)

(declare-fun mapIsEmpty!50569 () Bool)

(declare-fun mapRes!50569 () Bool)

(assert (=> mapIsEmpty!50569 mapRes!50569))

(declare-fun b!1269734 () Bool)

(declare-fun e!723622 () Bool)

(declare-fun tp_is_empty!32659 () Bool)

(assert (=> b!1269734 (= e!723622 tp_is_empty!32659)))

(declare-fun b!1269735 () Bool)

(declare-fun res!844766 () Bool)

(declare-fun e!723621 () Bool)

(assert (=> b!1269735 (=> (not res!844766) (not e!723621))))

(declare-datatypes ((array!82637 0))(
  ( (array!82638 (arr!39851 (Array (_ BitVec 32) (_ BitVec 64))) (size!40388 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82637)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82637 (_ BitVec 32)) Bool)

(assert (=> b!1269735 (= res!844766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50569 () Bool)

(declare-fun tp!96748 () Bool)

(assert (=> mapNonEmpty!50569 (= mapRes!50569 (and tp!96748 e!723622))))

(declare-datatypes ((V!48739 0))(
  ( (V!48740 (val!16404 Int)) )
))
(declare-datatypes ((ValueCell!15476 0))(
  ( (ValueCellFull!15476 (v!19036 V!48739)) (EmptyCell!15476) )
))
(declare-fun mapValue!50569 () ValueCell!15476)

(declare-fun mapRest!50569 () (Array (_ BitVec 32) ValueCell!15476))

(declare-fun mapKey!50569 () (_ BitVec 32))

(declare-datatypes ((array!82639 0))(
  ( (array!82640 (arr!39852 (Array (_ BitVec 32) ValueCell!15476)) (size!40389 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82639)

(assert (=> mapNonEmpty!50569 (= (arr!39852 _values!1134) (store mapRest!50569 mapKey!50569 mapValue!50569))))

(declare-fun b!1269737 () Bool)

(declare-fun e!723625 () Bool)

(assert (=> b!1269737 (= e!723625 tp_is_empty!32659)))

(declare-fun b!1269738 () Bool)

(declare-fun res!844765 () Bool)

(assert (=> b!1269738 (=> (not res!844765) (not e!723621))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1269738 (= res!844765 (and (= (size!40389 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40388 _keys!1364) (size!40389 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269739 () Bool)

(declare-fun e!723623 () Bool)

(assert (=> b!1269739 (= e!723623 (and e!723625 mapRes!50569))))

(declare-fun condMapEmpty!50569 () Bool)

(declare-fun mapDefault!50569 () ValueCell!15476)

(assert (=> b!1269739 (= condMapEmpty!50569 (= (arr!39852 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15476)) mapDefault!50569)))))

(declare-fun res!844767 () Bool)

(assert (=> start!107194 (=> (not res!844767) (not e!723621))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107194 (= res!844767 (validMask!0 mask!1730))))

(assert (=> start!107194 e!723621))

(declare-fun array_inv!30493 (array!82639) Bool)

(assert (=> start!107194 (and (array_inv!30493 _values!1134) e!723623)))

(assert (=> start!107194 true))

(declare-fun array_inv!30494 (array!82637) Bool)

(assert (=> start!107194 (array_inv!30494 _keys!1364)))

(declare-fun b!1269736 () Bool)

(assert (=> b!1269736 (= e!723621 false)))

(declare-fun lt!574909 () Bool)

(declare-datatypes ((List!28416 0))(
  ( (Nil!28413) (Cons!28412 (h!29630 (_ BitVec 64)) (t!41937 List!28416)) )
))
(declare-fun arrayNoDuplicates!0 (array!82637 (_ BitVec 32) List!28416) Bool)

(assert (=> b!1269736 (= lt!574909 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28413))))

(assert (= (and start!107194 res!844767) b!1269738))

(assert (= (and b!1269738 res!844765) b!1269735))

(assert (= (and b!1269735 res!844766) b!1269736))

(assert (= (and b!1269739 condMapEmpty!50569) mapIsEmpty!50569))

(assert (= (and b!1269739 (not condMapEmpty!50569)) mapNonEmpty!50569))

(get-info :version)

(assert (= (and mapNonEmpty!50569 ((_ is ValueCellFull!15476) mapValue!50569)) b!1269734))

(assert (= (and b!1269739 ((_ is ValueCellFull!15476) mapDefault!50569)) b!1269737))

(assert (= start!107194 b!1269739))

(declare-fun m!1168887 () Bool)

(assert (=> b!1269735 m!1168887))

(declare-fun m!1168889 () Bool)

(assert (=> mapNonEmpty!50569 m!1168889))

(declare-fun m!1168891 () Bool)

(assert (=> start!107194 m!1168891))

(declare-fun m!1168893 () Bool)

(assert (=> start!107194 m!1168893))

(declare-fun m!1168895 () Bool)

(assert (=> start!107194 m!1168895))

(declare-fun m!1168897 () Bool)

(assert (=> b!1269736 m!1168897))

(check-sat (not mapNonEmpty!50569) tp_is_empty!32659 (not start!107194) (not b!1269736) (not b!1269735))
(check-sat)
