; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107090 () Bool)

(assert start!107090)

(declare-fun b_free!27595 () Bool)

(declare-fun b_next!27595 () Bool)

(assert (=> start!107090 (= b_free!27595 (not b_next!27595))))

(declare-fun tp!97012 () Bool)

(declare-fun b_and!45609 () Bool)

(assert (=> start!107090 (= tp!97012 b_and!45609)))

(declare-fun mapNonEmpty!50749 () Bool)

(declare-fun mapRes!50749 () Bool)

(declare-fun tp!97013 () Bool)

(declare-fun e!723646 () Bool)

(assert (=> mapNonEmpty!50749 (= mapRes!50749 (and tp!97013 e!723646))))

(declare-datatypes ((V!48899 0))(
  ( (V!48900 (val!16464 Int)) )
))
(declare-datatypes ((ValueCell!15536 0))(
  ( (ValueCellFull!15536 (v!19100 V!48899)) (EmptyCell!15536) )
))
(declare-datatypes ((array!82739 0))(
  ( (array!82740 (arr!39907 (Array (_ BitVec 32) ValueCell!15536)) (size!40445 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82739)

(declare-fun mapValue!50749 () ValueCell!15536)

(declare-fun mapRest!50749 () (Array (_ BitVec 32) ValueCell!15536))

(declare-fun mapKey!50749 () (_ BitVec 32))

(assert (=> mapNonEmpty!50749 (= (arr!39907 _values!1134) (store mapRest!50749 mapKey!50749 mapValue!50749))))

(declare-fun mapIsEmpty!50749 () Bool)

(assert (=> mapIsEmpty!50749 mapRes!50749))

(declare-fun b!1269611 () Bool)

(declare-fun e!723649 () Bool)

(declare-fun e!723645 () Bool)

(assert (=> b!1269611 (= e!723649 (and e!723645 mapRes!50749))))

(declare-fun condMapEmpty!50749 () Bool)

(declare-fun mapDefault!50749 () ValueCell!15536)

(assert (=> b!1269611 (= condMapEmpty!50749 (= (arr!39907 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15536)) mapDefault!50749)))))

(declare-fun b!1269612 () Bool)

(declare-fun tp_is_empty!32779 () Bool)

(assert (=> b!1269612 (= e!723645 tp_is_empty!32779)))

(declare-fun res!844927 () Bool)

(declare-fun e!723647 () Bool)

(assert (=> start!107090 (=> (not res!844927) (not e!723647))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107090 (= res!844927 (validMask!0 mask!1730))))

(assert (=> start!107090 e!723647))

(declare-fun array_inv!30521 (array!82739) Bool)

(assert (=> start!107090 (and (array_inv!30521 _values!1134) e!723649)))

(assert (=> start!107090 true))

(declare-datatypes ((array!82741 0))(
  ( (array!82742 (arr!39908 (Array (_ BitVec 32) (_ BitVec 64))) (size!40446 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82741)

(declare-fun array_inv!30522 (array!82741) Bool)

(assert (=> start!107090 (array_inv!30522 _keys!1364)))

(assert (=> start!107090 tp_is_empty!32779))

(assert (=> start!107090 tp!97012))

(declare-fun b!1269613 () Bool)

(declare-fun res!844925 () Bool)

(assert (=> b!1269613 (=> (not res!844925) (not e!723647))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269613 (= res!844925 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40446 _keys!1364)) (bvslt from!1698 (size!40446 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269614 () Bool)

(declare-fun res!844926 () Bool)

(assert (=> b!1269614 (=> (not res!844926) (not e!723647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82741 (_ BitVec 32)) Bool)

(assert (=> b!1269614 (= res!844926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269615 () Bool)

(assert (=> b!1269615 (= e!723646 tp_is_empty!32779)))

(declare-fun b!1269616 () Bool)

(declare-fun res!844924 () Bool)

(assert (=> b!1269616 (=> (not res!844924) (not e!723647))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269616 (= res!844924 (and (= (size!40445 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40446 _keys!1364) (size!40445 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269617 () Bool)

(declare-fun res!844928 () Bool)

(assert (=> b!1269617 (=> (not res!844928) (not e!723647))))

(declare-datatypes ((List!28525 0))(
  ( (Nil!28522) (Cons!28521 (h!29730 (_ BitVec 64)) (t!42046 List!28525)) )
))
(declare-fun arrayNoDuplicates!0 (array!82741 (_ BitVec 32) List!28525) Bool)

(assert (=> b!1269617 (= res!844928 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28522))))

(declare-fun b!1269618 () Bool)

(assert (=> b!1269618 (= e!723647 (not true))))

(declare-fun minValueBefore!52 () V!48899)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48899)

(declare-fun zeroValueBefore!52 () V!48899)

(declare-fun minValueAfter!52 () V!48899)

(declare-datatypes ((tuple2!21410 0))(
  ( (tuple2!21411 (_1!10716 (_ BitVec 64)) (_2!10716 V!48899)) )
))
(declare-datatypes ((List!28526 0))(
  ( (Nil!28523) (Cons!28522 (h!29731 tuple2!21410) (t!42047 List!28526)) )
))
(declare-datatypes ((ListLongMap!19139 0))(
  ( (ListLongMap!19140 (toList!9585 List!28526)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5918 (array!82741 array!82739 (_ BitVec 32) (_ BitVec 32) V!48899 V!48899 (_ BitVec 32) Int) ListLongMap!19139)

(assert (=> b!1269618 (= (getCurrentListMapNoExtraKeys!5918 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5918 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42124 0))(
  ( (Unit!42125) )
))
(declare-fun lt!574427 () Unit!42124)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1218 (array!82741 array!82739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48899 V!48899 V!48899 V!48899 (_ BitVec 32) Int) Unit!42124)

(assert (=> b!1269618 (= lt!574427 (lemmaNoChangeToArrayThenSameMapNoExtras!1218 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(assert (= (and start!107090 res!844927) b!1269616))

(assert (= (and b!1269616 res!844924) b!1269614))

(assert (= (and b!1269614 res!844926) b!1269617))

(assert (= (and b!1269617 res!844928) b!1269613))

(assert (= (and b!1269613 res!844925) b!1269618))

(assert (= (and b!1269611 condMapEmpty!50749) mapIsEmpty!50749))

(assert (= (and b!1269611 (not condMapEmpty!50749)) mapNonEmpty!50749))

(get-info :version)

(assert (= (and mapNonEmpty!50749 ((_ is ValueCellFull!15536) mapValue!50749)) b!1269615))

(assert (= (and b!1269611 ((_ is ValueCellFull!15536) mapDefault!50749)) b!1269612))

(assert (= start!107090 b!1269611))

(declare-fun m!1167657 () Bool)

(assert (=> mapNonEmpty!50749 m!1167657))

(declare-fun m!1167659 () Bool)

(assert (=> b!1269617 m!1167659))

(declare-fun m!1167661 () Bool)

(assert (=> start!107090 m!1167661))

(declare-fun m!1167663 () Bool)

(assert (=> start!107090 m!1167663))

(declare-fun m!1167665 () Bool)

(assert (=> start!107090 m!1167665))

(declare-fun m!1167667 () Bool)

(assert (=> b!1269614 m!1167667))

(declare-fun m!1167669 () Bool)

(assert (=> b!1269618 m!1167669))

(declare-fun m!1167671 () Bool)

(assert (=> b!1269618 m!1167671))

(declare-fun m!1167673 () Bool)

(assert (=> b!1269618 m!1167673))

(check-sat (not b!1269618) tp_is_empty!32779 (not start!107090) (not b!1269614) (not b_next!27595) (not mapNonEmpty!50749) b_and!45609 (not b!1269617))
(check-sat b_and!45609 (not b_next!27595))
