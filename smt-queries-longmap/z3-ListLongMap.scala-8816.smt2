; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107120 () Bool)

(assert start!107120)

(declare-fun b_free!27625 () Bool)

(declare-fun b_next!27625 () Bool)

(assert (=> start!107120 (= b_free!27625 (not b_next!27625))))

(declare-fun tp!97103 () Bool)

(declare-fun b_and!45639 () Bool)

(assert (=> start!107120 (= tp!97103 b_and!45639)))

(declare-fun b!1269971 () Bool)

(declare-fun e!723873 () Bool)

(assert (=> b!1269971 (= e!723873 (not true))))

(declare-datatypes ((V!48939 0))(
  ( (V!48940 (val!16479 Int)) )
))
(declare-datatypes ((ValueCell!15551 0))(
  ( (ValueCellFull!15551 (v!19115 V!48939)) (EmptyCell!15551) )
))
(declare-datatypes ((array!82793 0))(
  ( (array!82794 (arr!39934 (Array (_ BitVec 32) ValueCell!15551)) (size!40472 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82793)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82795 0))(
  ( (array!82796 (arr!39935 (Array (_ BitVec 32) (_ BitVec 64))) (size!40473 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82795)

(declare-fun minValueAfter!52 () V!48939)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48939)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48939)

(declare-fun zeroValueBefore!52 () V!48939)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21428 0))(
  ( (tuple2!21429 (_1!10725 (_ BitVec 64)) (_2!10725 V!48939)) )
))
(declare-datatypes ((List!28542 0))(
  ( (Nil!28539) (Cons!28538 (h!29747 tuple2!21428) (t!42063 List!28542)) )
))
(declare-datatypes ((ListLongMap!19157 0))(
  ( (ListLongMap!19158 (toList!9594 List!28542)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5927 (array!82795 array!82793 (_ BitVec 32) (_ BitVec 32) V!48939 V!48939 (_ BitVec 32) Int) ListLongMap!19157)

(assert (=> b!1269971 (= (getCurrentListMapNoExtraKeys!5927 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5927 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42142 0))(
  ( (Unit!42143) )
))
(declare-fun lt!574472 () Unit!42142)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1227 (array!82795 array!82793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48939 V!48939 V!48939 V!48939 (_ BitVec 32) Int) Unit!42142)

(assert (=> b!1269971 (= lt!574472 (lemmaNoChangeToArrayThenSameMapNoExtras!1227 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50794 () Bool)

(declare-fun mapRes!50794 () Bool)

(assert (=> mapIsEmpty!50794 mapRes!50794))

(declare-fun b!1269972 () Bool)

(declare-fun res!845149 () Bool)

(assert (=> b!1269972 (=> (not res!845149) (not e!723873))))

(assert (=> b!1269972 (= res!845149 (and (= (size!40472 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40473 _keys!1364) (size!40472 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269973 () Bool)

(declare-fun e!723874 () Bool)

(declare-fun e!723870 () Bool)

(assert (=> b!1269973 (= e!723874 (and e!723870 mapRes!50794))))

(declare-fun condMapEmpty!50794 () Bool)

(declare-fun mapDefault!50794 () ValueCell!15551)

(assert (=> b!1269973 (= condMapEmpty!50794 (= (arr!39934 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15551)) mapDefault!50794)))))

(declare-fun b!1269974 () Bool)

(declare-fun tp_is_empty!32809 () Bool)

(assert (=> b!1269974 (= e!723870 tp_is_empty!32809)))

(declare-fun b!1269975 () Bool)

(declare-fun res!845152 () Bool)

(assert (=> b!1269975 (=> (not res!845152) (not e!723873))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82795 (_ BitVec 32)) Bool)

(assert (=> b!1269975 (= res!845152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269976 () Bool)

(declare-fun res!845151 () Bool)

(assert (=> b!1269976 (=> (not res!845151) (not e!723873))))

(assert (=> b!1269976 (= res!845151 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40473 _keys!1364)) (bvslt from!1698 (size!40473 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269977 () Bool)

(declare-fun e!723872 () Bool)

(assert (=> b!1269977 (= e!723872 tp_is_empty!32809)))

(declare-fun res!845153 () Bool)

(assert (=> start!107120 (=> (not res!845153) (not e!723873))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107120 (= res!845153 (validMask!0 mask!1730))))

(assert (=> start!107120 e!723873))

(declare-fun array_inv!30541 (array!82793) Bool)

(assert (=> start!107120 (and (array_inv!30541 _values!1134) e!723874)))

(assert (=> start!107120 true))

(declare-fun array_inv!30542 (array!82795) Bool)

(assert (=> start!107120 (array_inv!30542 _keys!1364)))

(assert (=> start!107120 tp_is_empty!32809))

(assert (=> start!107120 tp!97103))

(declare-fun mapNonEmpty!50794 () Bool)

(declare-fun tp!97102 () Bool)

(assert (=> mapNonEmpty!50794 (= mapRes!50794 (and tp!97102 e!723872))))

(declare-fun mapValue!50794 () ValueCell!15551)

(declare-fun mapRest!50794 () (Array (_ BitVec 32) ValueCell!15551))

(declare-fun mapKey!50794 () (_ BitVec 32))

(assert (=> mapNonEmpty!50794 (= (arr!39934 _values!1134) (store mapRest!50794 mapKey!50794 mapValue!50794))))

(declare-fun b!1269978 () Bool)

(declare-fun res!845150 () Bool)

(assert (=> b!1269978 (=> (not res!845150) (not e!723873))))

(declare-datatypes ((List!28543 0))(
  ( (Nil!28540) (Cons!28539 (h!29748 (_ BitVec 64)) (t!42064 List!28543)) )
))
(declare-fun arrayNoDuplicates!0 (array!82795 (_ BitVec 32) List!28543) Bool)

(assert (=> b!1269978 (= res!845150 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28540))))

(assert (= (and start!107120 res!845153) b!1269972))

(assert (= (and b!1269972 res!845149) b!1269975))

(assert (= (and b!1269975 res!845152) b!1269978))

(assert (= (and b!1269978 res!845150) b!1269976))

(assert (= (and b!1269976 res!845151) b!1269971))

(assert (= (and b!1269973 condMapEmpty!50794) mapIsEmpty!50794))

(assert (= (and b!1269973 (not condMapEmpty!50794)) mapNonEmpty!50794))

(get-info :version)

(assert (= (and mapNonEmpty!50794 ((_ is ValueCellFull!15551) mapValue!50794)) b!1269977))

(assert (= (and b!1269973 ((_ is ValueCellFull!15551) mapDefault!50794)) b!1269974))

(assert (= start!107120 b!1269973))

(declare-fun m!1167927 () Bool)

(assert (=> b!1269975 m!1167927))

(declare-fun m!1167929 () Bool)

(assert (=> b!1269971 m!1167929))

(declare-fun m!1167931 () Bool)

(assert (=> b!1269971 m!1167931))

(declare-fun m!1167933 () Bool)

(assert (=> b!1269971 m!1167933))

(declare-fun m!1167935 () Bool)

(assert (=> b!1269978 m!1167935))

(declare-fun m!1167937 () Bool)

(assert (=> mapNonEmpty!50794 m!1167937))

(declare-fun m!1167939 () Bool)

(assert (=> start!107120 m!1167939))

(declare-fun m!1167941 () Bool)

(assert (=> start!107120 m!1167941))

(declare-fun m!1167943 () Bool)

(assert (=> start!107120 m!1167943))

(check-sat (not mapNonEmpty!50794) tp_is_empty!32809 (not b!1269978) b_and!45639 (not b_next!27625) (not b!1269971) (not start!107120) (not b!1269975))
(check-sat b_and!45639 (not b_next!27625))
