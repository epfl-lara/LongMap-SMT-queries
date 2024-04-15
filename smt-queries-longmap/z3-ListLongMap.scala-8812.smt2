; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107096 () Bool)

(assert start!107096)

(declare-fun b_free!27601 () Bool)

(declare-fun b_next!27601 () Bool)

(assert (=> start!107096 (= b_free!27601 (not b_next!27601))))

(declare-fun tp!97030 () Bool)

(declare-fun b_and!45615 () Bool)

(assert (=> start!107096 (= tp!97030 b_and!45615)))

(declare-fun b!1269683 () Bool)

(declare-fun e!723691 () Bool)

(assert (=> b!1269683 (= e!723691 (not true))))

(declare-datatypes ((V!48907 0))(
  ( (V!48908 (val!16467 Int)) )
))
(declare-datatypes ((ValueCell!15539 0))(
  ( (ValueCellFull!15539 (v!19103 V!48907)) (EmptyCell!15539) )
))
(declare-datatypes ((array!82749 0))(
  ( (array!82750 (arr!39912 (Array (_ BitVec 32) ValueCell!15539)) (size!40450 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82749)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82751 0))(
  ( (array!82752 (arr!39913 (Array (_ BitVec 32) (_ BitVec 64))) (size!40451 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82751)

(declare-fun minValueAfter!52 () V!48907)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48907)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48907)

(declare-fun zeroValueBefore!52 () V!48907)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21414 0))(
  ( (tuple2!21415 (_1!10718 (_ BitVec 64)) (_2!10718 V!48907)) )
))
(declare-datatypes ((List!28529 0))(
  ( (Nil!28526) (Cons!28525 (h!29734 tuple2!21414) (t!42050 List!28529)) )
))
(declare-datatypes ((ListLongMap!19143 0))(
  ( (ListLongMap!19144 (toList!9587 List!28529)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5920 (array!82751 array!82749 (_ BitVec 32) (_ BitVec 32) V!48907 V!48907 (_ BitVec 32) Int) ListLongMap!19143)

(assert (=> b!1269683 (= (getCurrentListMapNoExtraKeys!5920 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5920 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42128 0))(
  ( (Unit!42129) )
))
(declare-fun lt!574436 () Unit!42128)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1220 (array!82751 array!82749 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48907 V!48907 V!48907 V!48907 (_ BitVec 32) Int) Unit!42128)

(assert (=> b!1269683 (= lt!574436 (lemmaNoChangeToArrayThenSameMapNoExtras!1220 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269684 () Bool)

(declare-fun res!844969 () Bool)

(assert (=> b!1269684 (=> (not res!844969) (not e!723691))))

(declare-datatypes ((List!28530 0))(
  ( (Nil!28527) (Cons!28526 (h!29735 (_ BitVec 64)) (t!42051 List!28530)) )
))
(declare-fun arrayNoDuplicates!0 (array!82751 (_ BitVec 32) List!28530) Bool)

(assert (=> b!1269684 (= res!844969 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28527))))

(declare-fun b!1269685 () Bool)

(declare-fun e!723694 () Bool)

(declare-fun e!723690 () Bool)

(declare-fun mapRes!50758 () Bool)

(assert (=> b!1269685 (= e!723694 (and e!723690 mapRes!50758))))

(declare-fun condMapEmpty!50758 () Bool)

(declare-fun mapDefault!50758 () ValueCell!15539)

(assert (=> b!1269685 (= condMapEmpty!50758 (= (arr!39912 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15539)) mapDefault!50758)))))

(declare-fun b!1269686 () Bool)

(declare-fun res!844973 () Bool)

(assert (=> b!1269686 (=> (not res!844973) (not e!723691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82751 (_ BitVec 32)) Bool)

(assert (=> b!1269686 (= res!844973 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269687 () Bool)

(declare-fun e!723692 () Bool)

(declare-fun tp_is_empty!32785 () Bool)

(assert (=> b!1269687 (= e!723692 tp_is_empty!32785)))

(declare-fun b!1269688 () Bool)

(declare-fun res!844970 () Bool)

(assert (=> b!1269688 (=> (not res!844970) (not e!723691))))

(assert (=> b!1269688 (= res!844970 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40451 _keys!1364)) (bvslt from!1698 (size!40451 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50758 () Bool)

(declare-fun tp!97031 () Bool)

(assert (=> mapNonEmpty!50758 (= mapRes!50758 (and tp!97031 e!723692))))

(declare-fun mapRest!50758 () (Array (_ BitVec 32) ValueCell!15539))

(declare-fun mapKey!50758 () (_ BitVec 32))

(declare-fun mapValue!50758 () ValueCell!15539)

(assert (=> mapNonEmpty!50758 (= (arr!39912 _values!1134) (store mapRest!50758 mapKey!50758 mapValue!50758))))

(declare-fun b!1269689 () Bool)

(declare-fun res!844972 () Bool)

(assert (=> b!1269689 (=> (not res!844972) (not e!723691))))

(assert (=> b!1269689 (= res!844972 (and (= (size!40450 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40451 _keys!1364) (size!40450 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844971 () Bool)

(assert (=> start!107096 (=> (not res!844971) (not e!723691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107096 (= res!844971 (validMask!0 mask!1730))))

(assert (=> start!107096 e!723691))

(declare-fun array_inv!30525 (array!82749) Bool)

(assert (=> start!107096 (and (array_inv!30525 _values!1134) e!723694)))

(assert (=> start!107096 true))

(declare-fun array_inv!30526 (array!82751) Bool)

(assert (=> start!107096 (array_inv!30526 _keys!1364)))

(assert (=> start!107096 tp_is_empty!32785))

(assert (=> start!107096 tp!97030))

(declare-fun b!1269690 () Bool)

(assert (=> b!1269690 (= e!723690 tp_is_empty!32785)))

(declare-fun mapIsEmpty!50758 () Bool)

(assert (=> mapIsEmpty!50758 mapRes!50758))

(assert (= (and start!107096 res!844971) b!1269689))

(assert (= (and b!1269689 res!844972) b!1269686))

(assert (= (and b!1269686 res!844973) b!1269684))

(assert (= (and b!1269684 res!844969) b!1269688))

(assert (= (and b!1269688 res!844970) b!1269683))

(assert (= (and b!1269685 condMapEmpty!50758) mapIsEmpty!50758))

(assert (= (and b!1269685 (not condMapEmpty!50758)) mapNonEmpty!50758))

(get-info :version)

(assert (= (and mapNonEmpty!50758 ((_ is ValueCellFull!15539) mapValue!50758)) b!1269687))

(assert (= (and b!1269685 ((_ is ValueCellFull!15539) mapDefault!50758)) b!1269690))

(assert (= start!107096 b!1269685))

(declare-fun m!1167711 () Bool)

(assert (=> b!1269683 m!1167711))

(declare-fun m!1167713 () Bool)

(assert (=> b!1269683 m!1167713))

(declare-fun m!1167715 () Bool)

(assert (=> b!1269683 m!1167715))

(declare-fun m!1167717 () Bool)

(assert (=> b!1269684 m!1167717))

(declare-fun m!1167719 () Bool)

(assert (=> start!107096 m!1167719))

(declare-fun m!1167721 () Bool)

(assert (=> start!107096 m!1167721))

(declare-fun m!1167723 () Bool)

(assert (=> start!107096 m!1167723))

(declare-fun m!1167725 () Bool)

(assert (=> mapNonEmpty!50758 m!1167725))

(declare-fun m!1167727 () Bool)

(assert (=> b!1269686 m!1167727))

(check-sat (not b_next!27601) (not b!1269686) (not b!1269684) b_and!45615 tp_is_empty!32785 (not mapNonEmpty!50758) (not start!107096) (not b!1269683))
(check-sat b_and!45615 (not b_next!27601))
