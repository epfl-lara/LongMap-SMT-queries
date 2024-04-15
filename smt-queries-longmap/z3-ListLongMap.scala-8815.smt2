; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107114 () Bool)

(assert start!107114)

(declare-fun b_free!27619 () Bool)

(declare-fun b_next!27619 () Bool)

(assert (=> start!107114 (= b_free!27619 (not b_next!27619))))

(declare-fun tp!97084 () Bool)

(declare-fun b_and!45633 () Bool)

(assert (=> start!107114 (= tp!97084 b_and!45633)))

(declare-fun res!845104 () Bool)

(declare-fun e!723827 () Bool)

(assert (=> start!107114 (=> (not res!845104) (not e!723827))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107114 (= res!845104 (validMask!0 mask!1730))))

(assert (=> start!107114 e!723827))

(declare-datatypes ((V!48931 0))(
  ( (V!48932 (val!16476 Int)) )
))
(declare-datatypes ((ValueCell!15548 0))(
  ( (ValueCellFull!15548 (v!19112 V!48931)) (EmptyCell!15548) )
))
(declare-datatypes ((array!82781 0))(
  ( (array!82782 (arr!39928 (Array (_ BitVec 32) ValueCell!15548)) (size!40466 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82781)

(declare-fun e!723829 () Bool)

(declare-fun array_inv!30535 (array!82781) Bool)

(assert (=> start!107114 (and (array_inv!30535 _values!1134) e!723829)))

(assert (=> start!107114 true))

(declare-datatypes ((array!82783 0))(
  ( (array!82784 (arr!39929 (Array (_ BitVec 32) (_ BitVec 64))) (size!40467 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82783)

(declare-fun array_inv!30536 (array!82783) Bool)

(assert (=> start!107114 (array_inv!30536 _keys!1364)))

(declare-fun tp_is_empty!32803 () Bool)

(assert (=> start!107114 tp_is_empty!32803))

(assert (=> start!107114 tp!97084))

(declare-fun b!1269899 () Bool)

(assert (=> b!1269899 (= e!723827 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48931)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48931)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48931)

(declare-fun zeroValueBefore!52 () V!48931)

(declare-datatypes ((tuple2!21422 0))(
  ( (tuple2!21423 (_1!10722 (_ BitVec 64)) (_2!10722 V!48931)) )
))
(declare-datatypes ((List!28536 0))(
  ( (Nil!28533) (Cons!28532 (h!29741 tuple2!21422) (t!42057 List!28536)) )
))
(declare-datatypes ((ListLongMap!19151 0))(
  ( (ListLongMap!19152 (toList!9591 List!28536)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5924 (array!82783 array!82781 (_ BitVec 32) (_ BitVec 32) V!48931 V!48931 (_ BitVec 32) Int) ListLongMap!19151)

(assert (=> b!1269899 (= (getCurrentListMapNoExtraKeys!5924 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5924 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42136 0))(
  ( (Unit!42137) )
))
(declare-fun lt!574463 () Unit!42136)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1224 (array!82783 array!82781 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48931 V!48931 V!48931 V!48931 (_ BitVec 32) Int) Unit!42136)

(assert (=> b!1269899 (= lt!574463 (lemmaNoChangeToArrayThenSameMapNoExtras!1224 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269900 () Bool)

(declare-fun res!845105 () Bool)

(assert (=> b!1269900 (=> (not res!845105) (not e!723827))))

(assert (=> b!1269900 (= res!845105 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40467 _keys!1364)) (bvslt from!1698 (size!40467 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269901 () Bool)

(declare-fun res!845106 () Bool)

(assert (=> b!1269901 (=> (not res!845106) (not e!723827))))

(assert (=> b!1269901 (= res!845106 (and (= (size!40466 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40467 _keys!1364) (size!40466 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50785 () Bool)

(declare-fun mapRes!50785 () Bool)

(declare-fun tp!97085 () Bool)

(declare-fun e!723825 () Bool)

(assert (=> mapNonEmpty!50785 (= mapRes!50785 (and tp!97085 e!723825))))

(declare-fun mapValue!50785 () ValueCell!15548)

(declare-fun mapRest!50785 () (Array (_ BitVec 32) ValueCell!15548))

(declare-fun mapKey!50785 () (_ BitVec 32))

(assert (=> mapNonEmpty!50785 (= (arr!39928 _values!1134) (store mapRest!50785 mapKey!50785 mapValue!50785))))

(declare-fun mapIsEmpty!50785 () Bool)

(assert (=> mapIsEmpty!50785 mapRes!50785))

(declare-fun b!1269902 () Bool)

(declare-fun res!845107 () Bool)

(assert (=> b!1269902 (=> (not res!845107) (not e!723827))))

(declare-datatypes ((List!28537 0))(
  ( (Nil!28534) (Cons!28533 (h!29742 (_ BitVec 64)) (t!42058 List!28537)) )
))
(declare-fun arrayNoDuplicates!0 (array!82783 (_ BitVec 32) List!28537) Bool)

(assert (=> b!1269902 (= res!845107 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28534))))

(declare-fun b!1269903 () Bool)

(declare-fun e!723826 () Bool)

(assert (=> b!1269903 (= e!723826 tp_is_empty!32803)))

(declare-fun b!1269904 () Bool)

(assert (=> b!1269904 (= e!723829 (and e!723826 mapRes!50785))))

(declare-fun condMapEmpty!50785 () Bool)

(declare-fun mapDefault!50785 () ValueCell!15548)

(assert (=> b!1269904 (= condMapEmpty!50785 (= (arr!39928 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15548)) mapDefault!50785)))))

(declare-fun b!1269905 () Bool)

(declare-fun res!845108 () Bool)

(assert (=> b!1269905 (=> (not res!845108) (not e!723827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82783 (_ BitVec 32)) Bool)

(assert (=> b!1269905 (= res!845108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269906 () Bool)

(assert (=> b!1269906 (= e!723825 tp_is_empty!32803)))

(assert (= (and start!107114 res!845104) b!1269901))

(assert (= (and b!1269901 res!845106) b!1269905))

(assert (= (and b!1269905 res!845108) b!1269902))

(assert (= (and b!1269902 res!845107) b!1269900))

(assert (= (and b!1269900 res!845105) b!1269899))

(assert (= (and b!1269904 condMapEmpty!50785) mapIsEmpty!50785))

(assert (= (and b!1269904 (not condMapEmpty!50785)) mapNonEmpty!50785))

(get-info :version)

(assert (= (and mapNonEmpty!50785 ((_ is ValueCellFull!15548) mapValue!50785)) b!1269906))

(assert (= (and b!1269904 ((_ is ValueCellFull!15548) mapDefault!50785)) b!1269903))

(assert (= start!107114 b!1269904))

(declare-fun m!1167873 () Bool)

(assert (=> b!1269905 m!1167873))

(declare-fun m!1167875 () Bool)

(assert (=> start!107114 m!1167875))

(declare-fun m!1167877 () Bool)

(assert (=> start!107114 m!1167877))

(declare-fun m!1167879 () Bool)

(assert (=> start!107114 m!1167879))

(declare-fun m!1167881 () Bool)

(assert (=> b!1269902 m!1167881))

(declare-fun m!1167883 () Bool)

(assert (=> b!1269899 m!1167883))

(declare-fun m!1167885 () Bool)

(assert (=> b!1269899 m!1167885))

(declare-fun m!1167887 () Bool)

(assert (=> b!1269899 m!1167887))

(declare-fun m!1167889 () Bool)

(assert (=> mapNonEmpty!50785 m!1167889))

(check-sat (not b!1269899) (not mapNonEmpty!50785) tp_is_empty!32803 (not b!1269902) (not b_next!27619) (not start!107114) (not b!1269905) b_and!45633)
(check-sat b_and!45633 (not b_next!27619))
