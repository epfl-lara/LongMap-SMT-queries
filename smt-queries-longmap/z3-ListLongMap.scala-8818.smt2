; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107356 () Bool)

(assert start!107356)

(declare-fun b_free!27637 () Bool)

(declare-fun b_next!27637 () Bool)

(assert (=> start!107356 (= b_free!27637 (not b_next!27637))))

(declare-fun tp!97138 () Bool)

(declare-fun b_and!45671 () Bool)

(assert (=> start!107356 (= tp!97138 b_and!45671)))

(declare-fun res!845790 () Bool)

(declare-fun e!724840 () Bool)

(assert (=> start!107356 (=> (not res!845790) (not e!724840))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107356 (= res!845790 (validMask!0 mask!1730))))

(assert (=> start!107356 e!724840))

(declare-datatypes ((V!48955 0))(
  ( (V!48956 (val!16485 Int)) )
))
(declare-datatypes ((ValueCell!15557 0))(
  ( (ValueCellFull!15557 (v!19117 V!48955)) (EmptyCell!15557) )
))
(declare-datatypes ((array!82935 0))(
  ( (array!82936 (arr!40000 (Array (_ BitVec 32) ValueCell!15557)) (size!40537 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82935)

(declare-fun e!724839 () Bool)

(declare-fun array_inv!30603 (array!82935) Bool)

(assert (=> start!107356 (and (array_inv!30603 _values!1134) e!724839)))

(assert (=> start!107356 true))

(declare-datatypes ((array!82937 0))(
  ( (array!82938 (arr!40001 (Array (_ BitVec 32) (_ BitVec 64))) (size!40538 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82937)

(declare-fun array_inv!30604 (array!82937) Bool)

(assert (=> start!107356 (array_inv!30604 _keys!1364)))

(declare-fun tp_is_empty!32821 () Bool)

(assert (=> start!107356 tp_is_empty!32821))

(assert (=> start!107356 tp!97138))

(declare-fun mapIsEmpty!50812 () Bool)

(declare-fun mapRes!50812 () Bool)

(assert (=> mapIsEmpty!50812 mapRes!50812))

(declare-fun b!1271484 () Bool)

(assert (=> b!1271484 (= e!724840 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48955)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48955)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48955)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun zeroValueBefore!52 () V!48955)

(declare-datatypes ((tuple2!21362 0))(
  ( (tuple2!21363 (_1!10692 (_ BitVec 64)) (_2!10692 V!48955)) )
))
(declare-datatypes ((List!28506 0))(
  ( (Nil!28503) (Cons!28502 (h!29720 tuple2!21362) (t!42027 List!28506)) )
))
(declare-datatypes ((ListLongMap!19099 0))(
  ( (ListLongMap!19100 (toList!9565 List!28506)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5937 (array!82937 array!82935 (_ BitVec 32) (_ BitVec 32) V!48955 V!48955 (_ BitVec 32) Int) ListLongMap!19099)

(assert (=> b!1271484 (= (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5937 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42271 0))(
  ( (Unit!42272) )
))
(declare-fun lt!575152 () Unit!42271)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1227 (array!82937 array!82935 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48955 V!48955 V!48955 V!48955 (_ BitVec 32) Int) Unit!42271)

(assert (=> b!1271484 (= lt!575152 (lemmaNoChangeToArrayThenSameMapNoExtras!1227 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1271485 () Bool)

(declare-fun res!845788 () Bool)

(assert (=> b!1271485 (=> (not res!845788) (not e!724840))))

(assert (=> b!1271485 (= res!845788 (and (= (size!40537 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40538 _keys!1364) (size!40537 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50812 () Bool)

(declare-fun tp!97137 () Bool)

(declare-fun e!724837 () Bool)

(assert (=> mapNonEmpty!50812 (= mapRes!50812 (and tp!97137 e!724837))))

(declare-fun mapKey!50812 () (_ BitVec 32))

(declare-fun mapRest!50812 () (Array (_ BitVec 32) ValueCell!15557))

(declare-fun mapValue!50812 () ValueCell!15557)

(assert (=> mapNonEmpty!50812 (= (arr!40000 _values!1134) (store mapRest!50812 mapKey!50812 mapValue!50812))))

(declare-fun b!1271486 () Bool)

(declare-fun e!724836 () Bool)

(assert (=> b!1271486 (= e!724836 tp_is_empty!32821)))

(declare-fun b!1271487 () Bool)

(assert (=> b!1271487 (= e!724837 tp_is_empty!32821)))

(declare-fun b!1271488 () Bool)

(declare-fun res!845786 () Bool)

(assert (=> b!1271488 (=> (not res!845786) (not e!724840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82937 (_ BitVec 32)) Bool)

(assert (=> b!1271488 (= res!845786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271489 () Bool)

(declare-fun res!845789 () Bool)

(assert (=> b!1271489 (=> (not res!845789) (not e!724840))))

(declare-datatypes ((List!28507 0))(
  ( (Nil!28504) (Cons!28503 (h!29721 (_ BitVec 64)) (t!42028 List!28507)) )
))
(declare-fun arrayNoDuplicates!0 (array!82937 (_ BitVec 32) List!28507) Bool)

(assert (=> b!1271489 (= res!845789 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28504))))

(declare-fun b!1271490 () Bool)

(declare-fun res!845787 () Bool)

(assert (=> b!1271490 (=> (not res!845787) (not e!724840))))

(assert (=> b!1271490 (= res!845787 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40538 _keys!1364)) (bvslt from!1698 (size!40538 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271491 () Bool)

(assert (=> b!1271491 (= e!724839 (and e!724836 mapRes!50812))))

(declare-fun condMapEmpty!50812 () Bool)

(declare-fun mapDefault!50812 () ValueCell!15557)

(assert (=> b!1271491 (= condMapEmpty!50812 (= (arr!40000 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15557)) mapDefault!50812)))))

(assert (= (and start!107356 res!845790) b!1271485))

(assert (= (and b!1271485 res!845788) b!1271488))

(assert (= (and b!1271488 res!845786) b!1271489))

(assert (= (and b!1271489 res!845789) b!1271490))

(assert (= (and b!1271490 res!845787) b!1271484))

(assert (= (and b!1271491 condMapEmpty!50812) mapIsEmpty!50812))

(assert (= (and b!1271491 (not condMapEmpty!50812)) mapNonEmpty!50812))

(get-info :version)

(assert (= (and mapNonEmpty!50812 ((_ is ValueCellFull!15557) mapValue!50812)) b!1271487))

(assert (= (and b!1271491 ((_ is ValueCellFull!15557) mapDefault!50812)) b!1271486))

(assert (= start!107356 b!1271491))

(declare-fun m!1170147 () Bool)

(assert (=> start!107356 m!1170147))

(declare-fun m!1170149 () Bool)

(assert (=> start!107356 m!1170149))

(declare-fun m!1170151 () Bool)

(assert (=> start!107356 m!1170151))

(declare-fun m!1170153 () Bool)

(assert (=> b!1271488 m!1170153))

(declare-fun m!1170155 () Bool)

(assert (=> mapNonEmpty!50812 m!1170155))

(declare-fun m!1170157 () Bool)

(assert (=> b!1271484 m!1170157))

(declare-fun m!1170159 () Bool)

(assert (=> b!1271484 m!1170159))

(declare-fun m!1170161 () Bool)

(assert (=> b!1271484 m!1170161))

(declare-fun m!1170163 () Bool)

(assert (=> b!1271489 m!1170163))

(check-sat tp_is_empty!32821 b_and!45671 (not b!1271488) (not b!1271489) (not b!1271484) (not b_next!27637) (not mapNonEmpty!50812) (not start!107356))
(check-sat b_and!45671 (not b_next!27637))
