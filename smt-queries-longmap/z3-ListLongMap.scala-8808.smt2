; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107074 () Bool)

(assert start!107074)

(declare-fun b_free!27579 () Bool)

(declare-fun b_next!27579 () Bool)

(assert (=> start!107074 (= b_free!27579 (not b_next!27579))))

(declare-fun tp!96963 () Bool)

(declare-fun b_and!45611 () Bool)

(assert (=> start!107074 (= tp!96963 b_and!45611)))

(declare-fun b!1269483 () Bool)

(declare-fun e!723554 () Bool)

(declare-fun tp_is_empty!32763 () Bool)

(assert (=> b!1269483 (= e!723554 tp_is_empty!32763)))

(declare-fun b!1269484 () Bool)

(declare-fun e!723555 () Bool)

(assert (=> b!1269484 (= e!723555 tp_is_empty!32763)))

(declare-fun b!1269485 () Bool)

(declare-fun res!844834 () Bool)

(declare-fun e!723557 () Bool)

(assert (=> b!1269485 (=> (not res!844834) (not e!723557))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82788 0))(
  ( (array!82789 (arr!39931 (Array (_ BitVec 32) (_ BitVec 64))) (size!40467 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82788)

(assert (=> b!1269485 (= res!844834 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40467 _keys!1364)) (bvslt from!1698 (size!40467 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun res!844835 () Bool)

(assert (=> start!107074 (=> (not res!844835) (not e!723557))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107074 (= res!844835 (validMask!0 mask!1730))))

(assert (=> start!107074 e!723557))

(declare-datatypes ((V!48877 0))(
  ( (V!48878 (val!16456 Int)) )
))
(declare-datatypes ((ValueCell!15528 0))(
  ( (ValueCellFull!15528 (v!19093 V!48877)) (EmptyCell!15528) )
))
(declare-datatypes ((array!82790 0))(
  ( (array!82791 (arr!39932 (Array (_ BitVec 32) ValueCell!15528)) (size!40468 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82790)

(declare-fun e!723558 () Bool)

(declare-fun array_inv!30375 (array!82790) Bool)

(assert (=> start!107074 (and (array_inv!30375 _values!1134) e!723558)))

(assert (=> start!107074 true))

(declare-fun array_inv!30376 (array!82788) Bool)

(assert (=> start!107074 (array_inv!30376 _keys!1364)))

(assert (=> start!107074 tp_is_empty!32763))

(assert (=> start!107074 tp!96963))

(declare-fun b!1269486 () Bool)

(declare-fun res!844832 () Bool)

(assert (=> b!1269486 (=> (not res!844832) (not e!723557))))

(declare-datatypes ((List!28427 0))(
  ( (Nil!28424) (Cons!28423 (h!29632 (_ BitVec 64)) (t!41956 List!28427)) )
))
(declare-fun arrayNoDuplicates!0 (array!82788 (_ BitVec 32) List!28427) Bool)

(assert (=> b!1269486 (= res!844832 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28424))))

(declare-fun mapNonEmpty!50725 () Bool)

(declare-fun mapRes!50725 () Bool)

(declare-fun tp!96964 () Bool)

(assert (=> mapNonEmpty!50725 (= mapRes!50725 (and tp!96964 e!723555))))

(declare-fun mapRest!50725 () (Array (_ BitVec 32) ValueCell!15528))

(declare-fun mapValue!50725 () ValueCell!15528)

(declare-fun mapKey!50725 () (_ BitVec 32))

(assert (=> mapNonEmpty!50725 (= (arr!39932 _values!1134) (store mapRest!50725 mapKey!50725 mapValue!50725))))

(declare-fun b!1269487 () Bool)

(declare-fun res!844833 () Bool)

(assert (=> b!1269487 (=> (not res!844833) (not e!723557))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269487 (= res!844833 (and (= (size!40468 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40467 _keys!1364) (size!40468 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269488 () Bool)

(assert (=> b!1269488 (= e!723558 (and e!723554 mapRes!50725))))

(declare-fun condMapEmpty!50725 () Bool)

(declare-fun mapDefault!50725 () ValueCell!15528)

(assert (=> b!1269488 (= condMapEmpty!50725 (= (arr!39932 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15528)) mapDefault!50725)))))

(declare-fun b!1269489 () Bool)

(assert (=> b!1269489 (= e!723557 (not true))))

(declare-fun minValueAfter!52 () V!48877)

(declare-fun minValueBefore!52 () V!48877)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48877)

(declare-fun zeroValueBefore!52 () V!48877)

(declare-datatypes ((tuple2!21314 0))(
  ( (tuple2!21315 (_1!10668 (_ BitVec 64)) (_2!10668 V!48877)) )
))
(declare-datatypes ((List!28428 0))(
  ( (Nil!28425) (Cons!28424 (h!29633 tuple2!21314) (t!41957 List!28428)) )
))
(declare-datatypes ((ListLongMap!19043 0))(
  ( (ListLongMap!19044 (toList!9537 List!28428)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5869 (array!82788 array!82790 (_ BitVec 32) (_ BitVec 32) V!48877 V!48877 (_ BitVec 32) Int) ListLongMap!19043)

(assert (=> b!1269489 (= (getCurrentListMapNoExtraKeys!5869 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5869 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42260 0))(
  ( (Unit!42261) )
))
(declare-fun lt!574581 () Unit!42260)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1211 (array!82788 array!82790 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48877 V!48877 V!48877 V!48877 (_ BitVec 32) Int) Unit!42260)

(assert (=> b!1269489 (= lt!574581 (lemmaNoChangeToArrayThenSameMapNoExtras!1211 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50725 () Bool)

(assert (=> mapIsEmpty!50725 mapRes!50725))

(declare-fun b!1269490 () Bool)

(declare-fun res!844831 () Bool)

(assert (=> b!1269490 (=> (not res!844831) (not e!723557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82788 (_ BitVec 32)) Bool)

(assert (=> b!1269490 (= res!844831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107074 res!844835) b!1269487))

(assert (= (and b!1269487 res!844833) b!1269490))

(assert (= (and b!1269490 res!844831) b!1269486))

(assert (= (and b!1269486 res!844832) b!1269485))

(assert (= (and b!1269485 res!844834) b!1269489))

(assert (= (and b!1269488 condMapEmpty!50725) mapIsEmpty!50725))

(assert (= (and b!1269488 (not condMapEmpty!50725)) mapNonEmpty!50725))

(get-info :version)

(assert (= (and mapNonEmpty!50725 ((_ is ValueCellFull!15528) mapValue!50725)) b!1269484))

(assert (= (and b!1269488 ((_ is ValueCellFull!15528) mapDefault!50725)) b!1269483))

(assert (= start!107074 b!1269488))

(declare-fun m!1168013 () Bool)

(assert (=> mapNonEmpty!50725 m!1168013))

(declare-fun m!1168015 () Bool)

(assert (=> b!1269486 m!1168015))

(declare-fun m!1168017 () Bool)

(assert (=> start!107074 m!1168017))

(declare-fun m!1168019 () Bool)

(assert (=> start!107074 m!1168019))

(declare-fun m!1168021 () Bool)

(assert (=> start!107074 m!1168021))

(declare-fun m!1168023 () Bool)

(assert (=> b!1269489 m!1168023))

(declare-fun m!1168025 () Bool)

(assert (=> b!1269489 m!1168025))

(declare-fun m!1168027 () Bool)

(assert (=> b!1269489 m!1168027))

(declare-fun m!1168029 () Bool)

(assert (=> b!1269490 m!1168029))

(check-sat (not mapNonEmpty!50725) (not start!107074) (not b!1269490) tp_is_empty!32763 (not b!1269486) b_and!45611 (not b_next!27579) (not b!1269489))
(check-sat b_and!45611 (not b_next!27579))
