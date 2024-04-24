; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105128 () Bool)

(assert start!105128)

(declare-fun b_free!26695 () Bool)

(declare-fun b_next!26695 () Bool)

(assert (=> start!105128 (= b_free!26695 (not b_next!26695))))

(declare-fun tp!93578 () Bool)

(declare-fun b_and!44473 () Bool)

(assert (=> start!105128 (= tp!93578 b_and!44473)))

(declare-fun b!1251680 () Bool)

(declare-fun res!834548 () Bool)

(declare-fun e!710675 () Bool)

(assert (=> b!1251680 (=> (not res!834548) (not e!710675))))

(declare-datatypes ((array!80911 0))(
  ( (array!80912 (arr!39017 (Array (_ BitVec 32) (_ BitVec 64))) (size!39554 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80911)

(declare-datatypes ((List!27721 0))(
  ( (Nil!27718) (Cons!27717 (h!28935 (_ BitVec 64)) (t!41186 List!27721)) )
))
(declare-fun arrayNoDuplicates!0 (array!80911 (_ BitVec 32) List!27721) Bool)

(assert (=> b!1251680 (= res!834548 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27718))))

(declare-fun b!1251681 () Bool)

(declare-fun e!710673 () Bool)

(declare-fun tp_is_empty!31597 () Bool)

(assert (=> b!1251681 (= e!710673 tp_is_empty!31597)))

(declare-fun mapNonEmpty!49159 () Bool)

(declare-fun mapRes!49159 () Bool)

(declare-fun tp!93577 () Bool)

(declare-fun e!710676 () Bool)

(assert (=> mapNonEmpty!49159 (= mapRes!49159 (and tp!93577 e!710676))))

(declare-fun mapKey!49159 () (_ BitVec 32))

(declare-datatypes ((V!47495 0))(
  ( (V!47496 (val!15861 Int)) )
))
(declare-datatypes ((ValueCell!15035 0))(
  ( (ValueCellFull!15035 (v!18553 V!47495)) (EmptyCell!15035) )
))
(declare-fun mapRest!49159 () (Array (_ BitVec 32) ValueCell!15035))

(declare-datatypes ((array!80913 0))(
  ( (array!80914 (arr!39018 (Array (_ BitVec 32) ValueCell!15035)) (size!39555 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80913)

(declare-fun mapValue!49159 () ValueCell!15035)

(assert (=> mapNonEmpty!49159 (= (arr!39018 _values!914) (store mapRest!49159 mapKey!49159 mapValue!49159))))

(declare-fun b!1251682 () Bool)

(declare-fun e!710678 () Bool)

(assert (=> b!1251682 (= e!710678 true)))

(declare-datatypes ((tuple2!20472 0))(
  ( (tuple2!20473 (_1!10247 (_ BitVec 64)) (_2!10247 V!47495)) )
))
(declare-datatypes ((List!27722 0))(
  ( (Nil!27719) (Cons!27718 (h!28936 tuple2!20472) (t!41187 List!27722)) )
))
(declare-datatypes ((ListLongMap!18353 0))(
  ( (ListLongMap!18354 (toList!9192 List!27722)) )
))
(declare-fun lt!564680 () ListLongMap!18353)

(declare-fun -!1981 (ListLongMap!18353 (_ BitVec 64)) ListLongMap!18353)

(assert (=> b!1251682 (= (-!1981 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564680)))

(declare-datatypes ((Unit!41522 0))(
  ( (Unit!41523) )
))
(declare-fun lt!564677 () Unit!41522)

(declare-fun removeNotPresentStillSame!91 (ListLongMap!18353 (_ BitVec 64)) Unit!41522)

(assert (=> b!1251682 (= lt!564677 (removeNotPresentStillSame!91 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1251683 () Bool)

(declare-fun res!834550 () Bool)

(assert (=> b!1251683 (=> (not res!834550) (not e!710675))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80911 (_ BitVec 32)) Bool)

(assert (=> b!1251683 (= res!834550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834551 () Bool)

(assert (=> start!105128 (=> (not res!834551) (not e!710675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105128 (= res!834551 (validMask!0 mask!1466))))

(assert (=> start!105128 e!710675))

(assert (=> start!105128 true))

(assert (=> start!105128 tp!93578))

(assert (=> start!105128 tp_is_empty!31597))

(declare-fun array_inv!29885 (array!80911) Bool)

(assert (=> start!105128 (array_inv!29885 _keys!1118)))

(declare-fun e!710674 () Bool)

(declare-fun array_inv!29886 (array!80913) Bool)

(assert (=> start!105128 (and (array_inv!29886 _values!914) e!710674)))

(declare-fun b!1251684 () Bool)

(assert (=> b!1251684 (= e!710674 (and e!710673 mapRes!49159))))

(declare-fun condMapEmpty!49159 () Bool)

(declare-fun mapDefault!49159 () ValueCell!15035)

(assert (=> b!1251684 (= condMapEmpty!49159 (= (arr!39018 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15035)) mapDefault!49159)))))

(declare-fun b!1251685 () Bool)

(declare-fun res!834549 () Bool)

(assert (=> b!1251685 (=> (not res!834549) (not e!710675))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1251685 (= res!834549 (and (= (size!39555 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39554 _keys!1118) (size!39555 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251686 () Bool)

(assert (=> b!1251686 (= e!710676 tp_is_empty!31597)))

(declare-fun b!1251687 () Bool)

(declare-fun e!710679 () Bool)

(assert (=> b!1251687 (= e!710675 (not e!710679))))

(declare-fun res!834547 () Bool)

(assert (=> b!1251687 (=> res!834547 e!710679)))

(assert (=> b!1251687 (= res!834547 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!564678 () ListLongMap!18353)

(declare-fun lt!564679 () ListLongMap!18353)

(assert (=> b!1251687 (= lt!564678 lt!564679)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47495)

(declare-fun lt!564681 () Unit!41522)

(declare-fun zeroValue!871 () V!47495)

(declare-fun minValueBefore!43 () V!47495)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!939 (array!80911 array!80913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47495 V!47495 V!47495 V!47495 (_ BitVec 32) Int) Unit!41522)

(assert (=> b!1251687 (= lt!564681 (lemmaNoChangeToArrayThenSameMapNoExtras!939 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5625 (array!80911 array!80913 (_ BitVec 32) (_ BitVec 32) V!47495 V!47495 (_ BitVec 32) Int) ListLongMap!18353)

(assert (=> b!1251687 (= lt!564679 (getCurrentListMapNoExtraKeys!5625 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251687 (= lt!564678 (getCurrentListMapNoExtraKeys!5625 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!49159 () Bool)

(assert (=> mapIsEmpty!49159 mapRes!49159))

(declare-fun b!1251688 () Bool)

(assert (=> b!1251688 (= e!710679 e!710678)))

(declare-fun res!834546 () Bool)

(assert (=> b!1251688 (=> res!834546 e!710678)))

(declare-fun contains!7518 (ListLongMap!18353 (_ BitVec 64)) Bool)

(assert (=> b!1251688 (= res!834546 (contains!7518 lt!564680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4455 (array!80911 array!80913 (_ BitVec 32) (_ BitVec 32) V!47495 V!47495 (_ BitVec 32) Int) ListLongMap!18353)

(assert (=> b!1251688 (= lt!564680 (getCurrentListMap!4455 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (= (and start!105128 res!834551) b!1251685))

(assert (= (and b!1251685 res!834549) b!1251683))

(assert (= (and b!1251683 res!834550) b!1251680))

(assert (= (and b!1251680 res!834548) b!1251687))

(assert (= (and b!1251687 (not res!834547)) b!1251688))

(assert (= (and b!1251688 (not res!834546)) b!1251682))

(assert (= (and b!1251684 condMapEmpty!49159) mapIsEmpty!49159))

(assert (= (and b!1251684 (not condMapEmpty!49159)) mapNonEmpty!49159))

(get-info :version)

(assert (= (and mapNonEmpty!49159 ((_ is ValueCellFull!15035) mapValue!49159)) b!1251686))

(assert (= (and b!1251684 ((_ is ValueCellFull!15035) mapDefault!49159)) b!1251681))

(assert (= start!105128 b!1251684))

(declare-fun m!1152819 () Bool)

(assert (=> b!1251682 m!1152819))

(declare-fun m!1152821 () Bool)

(assert (=> b!1251682 m!1152821))

(declare-fun m!1152823 () Bool)

(assert (=> b!1251683 m!1152823))

(declare-fun m!1152825 () Bool)

(assert (=> b!1251687 m!1152825))

(declare-fun m!1152827 () Bool)

(assert (=> b!1251687 m!1152827))

(declare-fun m!1152829 () Bool)

(assert (=> b!1251687 m!1152829))

(declare-fun m!1152831 () Bool)

(assert (=> start!105128 m!1152831))

(declare-fun m!1152833 () Bool)

(assert (=> start!105128 m!1152833))

(declare-fun m!1152835 () Bool)

(assert (=> start!105128 m!1152835))

(declare-fun m!1152837 () Bool)

(assert (=> mapNonEmpty!49159 m!1152837))

(declare-fun m!1152839 () Bool)

(assert (=> b!1251688 m!1152839))

(declare-fun m!1152841 () Bool)

(assert (=> b!1251688 m!1152841))

(declare-fun m!1152843 () Bool)

(assert (=> b!1251680 m!1152843))

(check-sat (not mapNonEmpty!49159) (not b!1251683) (not b!1251687) (not b_next!26695) (not b!1251680) (not start!105128) (not b!1251688) tp_is_empty!31597 (not b!1251682) b_and!44473)
(check-sat b_and!44473 (not b_next!26695))
