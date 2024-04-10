; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107086 () Bool)

(assert start!107086)

(declare-fun b_free!27591 () Bool)

(declare-fun b_next!27591 () Bool)

(assert (=> start!107086 (= b_free!27591 (not b_next!27591))))

(declare-fun tp!96999 () Bool)

(declare-fun b_and!45623 () Bool)

(assert (=> start!107086 (= tp!96999 b_and!45623)))

(declare-fun b!1269627 () Bool)

(declare-fun e!723646 () Bool)

(declare-fun tp_is_empty!32775 () Bool)

(assert (=> b!1269627 (= e!723646 tp_is_empty!32775)))

(declare-fun b!1269628 () Bool)

(declare-fun res!844923 () Bool)

(declare-fun e!723647 () Bool)

(assert (=> b!1269628 (=> (not res!844923) (not e!723647))))

(declare-datatypes ((array!82812 0))(
  ( (array!82813 (arr!39943 (Array (_ BitVec 32) (_ BitVec 64))) (size!40479 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82812)

(declare-datatypes ((List!28437 0))(
  ( (Nil!28434) (Cons!28433 (h!29642 (_ BitVec 64)) (t!41966 List!28437)) )
))
(declare-fun arrayNoDuplicates!0 (array!82812 (_ BitVec 32) List!28437) Bool)

(assert (=> b!1269628 (= res!844923 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28434))))

(declare-fun b!1269629 () Bool)

(declare-fun e!723645 () Bool)

(assert (=> b!1269629 (= e!723645 tp_is_empty!32775)))

(declare-fun b!1269630 () Bool)

(declare-fun e!723648 () Bool)

(declare-fun mapRes!50743 () Bool)

(assert (=> b!1269630 (= e!723648 (and e!723645 mapRes!50743))))

(declare-fun condMapEmpty!50743 () Bool)

(declare-datatypes ((V!48893 0))(
  ( (V!48894 (val!16462 Int)) )
))
(declare-datatypes ((ValueCell!15534 0))(
  ( (ValueCellFull!15534 (v!19099 V!48893)) (EmptyCell!15534) )
))
(declare-datatypes ((array!82814 0))(
  ( (array!82815 (arr!39944 (Array (_ BitVec 32) ValueCell!15534)) (size!40480 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82814)

(declare-fun mapDefault!50743 () ValueCell!15534)

(assert (=> b!1269630 (= condMapEmpty!50743 (= (arr!39944 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15534)) mapDefault!50743)))))

(declare-fun res!844925 () Bool)

(assert (=> start!107086 (=> (not res!844925) (not e!723647))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107086 (= res!844925 (validMask!0 mask!1730))))

(assert (=> start!107086 e!723647))

(declare-fun array_inv!30385 (array!82814) Bool)

(assert (=> start!107086 (and (array_inv!30385 _values!1134) e!723648)))

(assert (=> start!107086 true))

(declare-fun array_inv!30386 (array!82812) Bool)

(assert (=> start!107086 (array_inv!30386 _keys!1364)))

(assert (=> start!107086 tp_is_empty!32775))

(assert (=> start!107086 tp!96999))

(declare-fun b!1269631 () Bool)

(assert (=> b!1269631 (= e!723647 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48893)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48893)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48893)

(declare-fun zeroValueBefore!52 () V!48893)

(declare-datatypes ((tuple2!21324 0))(
  ( (tuple2!21325 (_1!10673 (_ BitVec 64)) (_2!10673 V!48893)) )
))
(declare-datatypes ((List!28438 0))(
  ( (Nil!28435) (Cons!28434 (h!29643 tuple2!21324) (t!41967 List!28438)) )
))
(declare-datatypes ((ListLongMap!19053 0))(
  ( (ListLongMap!19054 (toList!9542 List!28438)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5874 (array!82812 array!82814 (_ BitVec 32) (_ BitVec 32) V!48893 V!48893 (_ BitVec 32) Int) ListLongMap!19053)

(assert (=> b!1269631 (= (getCurrentListMapNoExtraKeys!5874 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5874 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42270 0))(
  ( (Unit!42271) )
))
(declare-fun lt!574599 () Unit!42270)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1216 (array!82812 array!82814 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48893 V!48893 V!48893 V!48893 (_ BitVec 32) Int) Unit!42270)

(assert (=> b!1269631 (= lt!574599 (lemmaNoChangeToArrayThenSameMapNoExtras!1216 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50743 () Bool)

(declare-fun tp!97000 () Bool)

(assert (=> mapNonEmpty!50743 (= mapRes!50743 (and tp!97000 e!723646))))

(declare-fun mapKey!50743 () (_ BitVec 32))

(declare-fun mapValue!50743 () ValueCell!15534)

(declare-fun mapRest!50743 () (Array (_ BitVec 32) ValueCell!15534))

(assert (=> mapNonEmpty!50743 (= (arr!39944 _values!1134) (store mapRest!50743 mapKey!50743 mapValue!50743))))

(declare-fun b!1269632 () Bool)

(declare-fun res!844921 () Bool)

(assert (=> b!1269632 (=> (not res!844921) (not e!723647))))

(assert (=> b!1269632 (= res!844921 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40479 _keys!1364)) (bvslt from!1698 (size!40479 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269633 () Bool)

(declare-fun res!844924 () Bool)

(assert (=> b!1269633 (=> (not res!844924) (not e!723647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82812 (_ BitVec 32)) Bool)

(assert (=> b!1269633 (= res!844924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269634 () Bool)

(declare-fun res!844922 () Bool)

(assert (=> b!1269634 (=> (not res!844922) (not e!723647))))

(assert (=> b!1269634 (= res!844922 (and (= (size!40480 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40479 _keys!1364) (size!40480 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50743 () Bool)

(assert (=> mapIsEmpty!50743 mapRes!50743))

(assert (= (and start!107086 res!844925) b!1269634))

(assert (= (and b!1269634 res!844922) b!1269633))

(assert (= (and b!1269633 res!844924) b!1269628))

(assert (= (and b!1269628 res!844923) b!1269632))

(assert (= (and b!1269632 res!844921) b!1269631))

(assert (= (and b!1269630 condMapEmpty!50743) mapIsEmpty!50743))

(assert (= (and b!1269630 (not condMapEmpty!50743)) mapNonEmpty!50743))

(get-info :version)

(assert (= (and mapNonEmpty!50743 ((_ is ValueCellFull!15534) mapValue!50743)) b!1269627))

(assert (= (and b!1269630 ((_ is ValueCellFull!15534) mapDefault!50743)) b!1269629))

(assert (= start!107086 b!1269630))

(declare-fun m!1168121 () Bool)

(assert (=> start!107086 m!1168121))

(declare-fun m!1168123 () Bool)

(assert (=> start!107086 m!1168123))

(declare-fun m!1168125 () Bool)

(assert (=> start!107086 m!1168125))

(declare-fun m!1168127 () Bool)

(assert (=> b!1269628 m!1168127))

(declare-fun m!1168129 () Bool)

(assert (=> b!1269631 m!1168129))

(declare-fun m!1168131 () Bool)

(assert (=> b!1269631 m!1168131))

(declare-fun m!1168133 () Bool)

(assert (=> b!1269631 m!1168133))

(declare-fun m!1168135 () Bool)

(assert (=> b!1269633 m!1168135))

(declare-fun m!1168137 () Bool)

(assert (=> mapNonEmpty!50743 m!1168137))

(check-sat (not mapNonEmpty!50743) (not b_next!27591) tp_is_empty!32775 (not start!107086) (not b!1269633) (not b!1269628) b_and!45623 (not b!1269631))
(check-sat b_and!45623 (not b_next!27591))
