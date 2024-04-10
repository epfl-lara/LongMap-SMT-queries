; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107092 () Bool)

(assert start!107092)

(declare-fun b_free!27597 () Bool)

(declare-fun b_next!27597 () Bool)

(assert (=> start!107092 (= b_free!27597 (not b_next!27597))))

(declare-fun tp!97017 () Bool)

(declare-fun b_and!45629 () Bool)

(assert (=> start!107092 (= tp!97017 b_and!45629)))

(declare-fun b!1269699 () Bool)

(declare-fun e!723691 () Bool)

(declare-fun tp_is_empty!32781 () Bool)

(assert (=> b!1269699 (= e!723691 tp_is_empty!32781)))

(declare-fun b!1269700 () Bool)

(declare-fun e!723690 () Bool)

(assert (=> b!1269700 (= e!723690 tp_is_empty!32781)))

(declare-fun b!1269701 () Bool)

(declare-fun res!844967 () Bool)

(declare-fun e!723693 () Bool)

(assert (=> b!1269701 (=> (not res!844967) (not e!723693))))

(declare-datatypes ((V!48901 0))(
  ( (V!48902 (val!16465 Int)) )
))
(declare-datatypes ((ValueCell!15537 0))(
  ( (ValueCellFull!15537 (v!19102 V!48901)) (EmptyCell!15537) )
))
(declare-datatypes ((array!82824 0))(
  ( (array!82825 (arr!39949 (Array (_ BitVec 32) ValueCell!15537)) (size!40485 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82824)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82826 0))(
  ( (array!82827 (arr!39950 (Array (_ BitVec 32) (_ BitVec 64))) (size!40486 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82826)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269701 (= res!844967 (and (= (size!40485 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40486 _keys!1364) (size!40485 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269702 () Bool)

(assert (=> b!1269702 (= e!723693 (not true))))

(declare-fun minValueAfter!52 () V!48901)

(declare-fun minValueBefore!52 () V!48901)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48901)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun zeroValueBefore!52 () V!48901)

(declare-datatypes ((tuple2!21328 0))(
  ( (tuple2!21329 (_1!10675 (_ BitVec 64)) (_2!10675 V!48901)) )
))
(declare-datatypes ((List!28442 0))(
  ( (Nil!28439) (Cons!28438 (h!29647 tuple2!21328) (t!41971 List!28442)) )
))
(declare-datatypes ((ListLongMap!19057 0))(
  ( (ListLongMap!19058 (toList!9544 List!28442)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5876 (array!82826 array!82824 (_ BitVec 32) (_ BitVec 32) V!48901 V!48901 (_ BitVec 32) Int) ListLongMap!19057)

(assert (=> b!1269702 (= (getCurrentListMapNoExtraKeys!5876 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5876 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42274 0))(
  ( (Unit!42275) )
))
(declare-fun lt!574608 () Unit!42274)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1218 (array!82826 array!82824 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48901 V!48901 V!48901 V!48901 (_ BitVec 32) Int) Unit!42274)

(assert (=> b!1269702 (= lt!574608 (lemmaNoChangeToArrayThenSameMapNoExtras!1218 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269704 () Bool)

(declare-fun res!844969 () Bool)

(assert (=> b!1269704 (=> (not res!844969) (not e!723693))))

(declare-datatypes ((List!28443 0))(
  ( (Nil!28440) (Cons!28439 (h!29648 (_ BitVec 64)) (t!41972 List!28443)) )
))
(declare-fun arrayNoDuplicates!0 (array!82826 (_ BitVec 32) List!28443) Bool)

(assert (=> b!1269704 (= res!844969 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28440))))

(declare-fun b!1269705 () Bool)

(declare-fun res!844968 () Bool)

(assert (=> b!1269705 (=> (not res!844968) (not e!723693))))

(assert (=> b!1269705 (= res!844968 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40486 _keys!1364)) (bvslt from!1698 (size!40486 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269706 () Bool)

(declare-fun res!844970 () Bool)

(assert (=> b!1269706 (=> (not res!844970) (not e!723693))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82826 (_ BitVec 32)) Bool)

(assert (=> b!1269706 (= res!844970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50752 () Bool)

(declare-fun mapRes!50752 () Bool)

(declare-fun tp!97018 () Bool)

(assert (=> mapNonEmpty!50752 (= mapRes!50752 (and tp!97018 e!723691))))

(declare-fun mapKey!50752 () (_ BitVec 32))

(declare-fun mapValue!50752 () ValueCell!15537)

(declare-fun mapRest!50752 () (Array (_ BitVec 32) ValueCell!15537))

(assert (=> mapNonEmpty!50752 (= (arr!39949 _values!1134) (store mapRest!50752 mapKey!50752 mapValue!50752))))

(declare-fun mapIsEmpty!50752 () Bool)

(assert (=> mapIsEmpty!50752 mapRes!50752))

(declare-fun b!1269703 () Bool)

(declare-fun e!723692 () Bool)

(assert (=> b!1269703 (= e!723692 (and e!723690 mapRes!50752))))

(declare-fun condMapEmpty!50752 () Bool)

(declare-fun mapDefault!50752 () ValueCell!15537)

(assert (=> b!1269703 (= condMapEmpty!50752 (= (arr!39949 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15537)) mapDefault!50752)))))

(declare-fun res!844966 () Bool)

(assert (=> start!107092 (=> (not res!844966) (not e!723693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107092 (= res!844966 (validMask!0 mask!1730))))

(assert (=> start!107092 e!723693))

(declare-fun array_inv!30387 (array!82824) Bool)

(assert (=> start!107092 (and (array_inv!30387 _values!1134) e!723692)))

(assert (=> start!107092 true))

(declare-fun array_inv!30388 (array!82826) Bool)

(assert (=> start!107092 (array_inv!30388 _keys!1364)))

(assert (=> start!107092 tp_is_empty!32781))

(assert (=> start!107092 tp!97017))

(assert (= (and start!107092 res!844966) b!1269701))

(assert (= (and b!1269701 res!844967) b!1269706))

(assert (= (and b!1269706 res!844970) b!1269704))

(assert (= (and b!1269704 res!844969) b!1269705))

(assert (= (and b!1269705 res!844968) b!1269702))

(assert (= (and b!1269703 condMapEmpty!50752) mapIsEmpty!50752))

(assert (= (and b!1269703 (not condMapEmpty!50752)) mapNonEmpty!50752))

(get-info :version)

(assert (= (and mapNonEmpty!50752 ((_ is ValueCellFull!15537) mapValue!50752)) b!1269699))

(assert (= (and b!1269703 ((_ is ValueCellFull!15537) mapDefault!50752)) b!1269700))

(assert (= start!107092 b!1269703))

(declare-fun m!1168175 () Bool)

(assert (=> b!1269702 m!1168175))

(declare-fun m!1168177 () Bool)

(assert (=> b!1269702 m!1168177))

(declare-fun m!1168179 () Bool)

(assert (=> b!1269702 m!1168179))

(declare-fun m!1168181 () Bool)

(assert (=> start!107092 m!1168181))

(declare-fun m!1168183 () Bool)

(assert (=> start!107092 m!1168183))

(declare-fun m!1168185 () Bool)

(assert (=> start!107092 m!1168185))

(declare-fun m!1168187 () Bool)

(assert (=> b!1269706 m!1168187))

(declare-fun m!1168189 () Bool)

(assert (=> mapNonEmpty!50752 m!1168189))

(declare-fun m!1168191 () Bool)

(assert (=> b!1269704 m!1168191))

(check-sat b_and!45629 (not start!107092) (not b_next!27597) tp_is_empty!32781 (not b!1269704) (not mapNonEmpty!50752) (not b!1269702) (not b!1269706))
(check-sat b_and!45629 (not b_next!27597))
