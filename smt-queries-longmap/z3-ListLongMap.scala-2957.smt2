; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41964 () Bool)

(assert start!41964)

(declare-fun b_free!11551 () Bool)

(declare-fun b_next!11551 () Bool)

(assert (=> start!41964 (= b_free!11551 (not b_next!11551))))

(declare-fun tp!40669 () Bool)

(declare-fun b_and!19923 () Bool)

(assert (=> start!41964 (= tp!40669 b_and!19923)))

(declare-fun b!468395 () Bool)

(declare-fun e!274151 () Bool)

(declare-fun tp_is_empty!12979 () Bool)

(assert (=> b!468395 (= e!274151 tp_is_empty!12979)))

(declare-fun b!468396 () Bool)

(declare-fun res!279949 () Bool)

(declare-fun e!274149 () Bool)

(assert (=> b!468396 (=> (not res!279949) (not e!274149))))

(declare-datatypes ((array!29719 0))(
  ( (array!29720 (arr!14285 (Array (_ BitVec 32) (_ BitVec 64))) (size!14638 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29719)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29719 (_ BitVec 32)) Bool)

(assert (=> b!468396 (= res!279949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468397 () Bool)

(declare-fun e!274146 () Bool)

(assert (=> b!468397 (= e!274146 true)))

(declare-datatypes ((V!18411 0))(
  ( (V!18412 (val!6534 Int)) )
))
(declare-datatypes ((tuple2!8628 0))(
  ( (tuple2!8629 (_1!4325 (_ BitVec 64)) (_2!4325 V!18411)) )
))
(declare-datatypes ((List!8701 0))(
  ( (Nil!8698) (Cons!8697 (h!9553 tuple2!8628) (t!14650 List!8701)) )
))
(declare-datatypes ((ListLongMap!7531 0))(
  ( (ListLongMap!7532 (toList!3781 List!8701)) )
))
(declare-fun lt!211808 () ListLongMap!7531)

(declare-fun lt!211805 () tuple2!8628)

(declare-fun minValueBefore!38 () V!18411)

(declare-fun +!1713 (ListLongMap!7531 tuple2!8628) ListLongMap!7531)

(assert (=> b!468397 (= (+!1713 lt!211808 lt!211805) (+!1713 (+!1713 lt!211808 (tuple2!8629 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211805))))

(declare-fun minValueAfter!38 () V!18411)

(assert (=> b!468397 (= lt!211805 (tuple2!8629 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13659 0))(
  ( (Unit!13660) )
))
(declare-fun lt!211810 () Unit!13659)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!96 (ListLongMap!7531 (_ BitVec 64) V!18411 V!18411) Unit!13659)

(assert (=> b!468397 (= lt!211810 (addSameAsAddTwiceSameKeyDiffValues!96 lt!211808 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18411)

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!211807 () ListLongMap!7531)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6146 0))(
  ( (ValueCellFull!6146 (v!8817 V!18411)) (EmptyCell!6146) )
))
(declare-datatypes ((array!29721 0))(
  ( (array!29722 (arr!14286 (Array (_ BitVec 32) ValueCell!6146)) (size!14639 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29721)

(declare-fun getCurrentListMap!2149 (array!29719 array!29721 (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 (_ BitVec 32) Int) ListLongMap!7531)

(assert (=> b!468397 (= lt!211807 (getCurrentListMap!2149 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211806 () ListLongMap!7531)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468397 (= lt!211806 (getCurrentListMap!2149 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21163 () Bool)

(declare-fun mapRes!21163 () Bool)

(declare-fun tp!40668 () Bool)

(declare-fun e!274147 () Bool)

(assert (=> mapNonEmpty!21163 (= mapRes!21163 (and tp!40668 e!274147))))

(declare-fun mapValue!21163 () ValueCell!6146)

(declare-fun mapKey!21163 () (_ BitVec 32))

(declare-fun mapRest!21163 () (Array (_ BitVec 32) ValueCell!6146))

(assert (=> mapNonEmpty!21163 (= (arr!14286 _values!833) (store mapRest!21163 mapKey!21163 mapValue!21163))))

(declare-fun b!468398 () Bool)

(assert (=> b!468398 (= e!274147 tp_is_empty!12979)))

(declare-fun b!468400 () Bool)

(assert (=> b!468400 (= e!274149 (not e!274146))))

(declare-fun res!279948 () Bool)

(assert (=> b!468400 (=> res!279948 e!274146)))

(assert (=> b!468400 (= res!279948 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!211804 () ListLongMap!7531)

(assert (=> b!468400 (= lt!211808 lt!211804)))

(declare-fun lt!211809 () Unit!13659)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!118 (array!29719 array!29721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 V!18411 V!18411 (_ BitVec 32) Int) Unit!13659)

(assert (=> b!468400 (= lt!211809 (lemmaNoChangeToArrayThenSameMapNoExtras!118 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1961 (array!29719 array!29721 (_ BitVec 32) (_ BitVec 32) V!18411 V!18411 (_ BitVec 32) Int) ListLongMap!7531)

(assert (=> b!468400 (= lt!211804 (getCurrentListMapNoExtraKeys!1961 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468400 (= lt!211808 (getCurrentListMapNoExtraKeys!1961 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21163 () Bool)

(assert (=> mapIsEmpty!21163 mapRes!21163))

(declare-fun res!279947 () Bool)

(assert (=> start!41964 (=> (not res!279947) (not e!274149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41964 (= res!279947 (validMask!0 mask!1365))))

(assert (=> start!41964 e!274149))

(assert (=> start!41964 tp_is_empty!12979))

(assert (=> start!41964 tp!40669))

(assert (=> start!41964 true))

(declare-fun array_inv!10398 (array!29719) Bool)

(assert (=> start!41964 (array_inv!10398 _keys!1025)))

(declare-fun e!274150 () Bool)

(declare-fun array_inv!10399 (array!29721) Bool)

(assert (=> start!41964 (and (array_inv!10399 _values!833) e!274150)))

(declare-fun b!468399 () Bool)

(assert (=> b!468399 (= e!274150 (and e!274151 mapRes!21163))))

(declare-fun condMapEmpty!21163 () Bool)

(declare-fun mapDefault!21163 () ValueCell!6146)

(assert (=> b!468399 (= condMapEmpty!21163 (= (arr!14286 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6146)) mapDefault!21163)))))

(declare-fun b!468401 () Bool)

(declare-fun res!279950 () Bool)

(assert (=> b!468401 (=> (not res!279950) (not e!274149))))

(declare-datatypes ((List!8702 0))(
  ( (Nil!8699) (Cons!8698 (h!9554 (_ BitVec 64)) (t!14651 List!8702)) )
))
(declare-fun arrayNoDuplicates!0 (array!29719 (_ BitVec 32) List!8702) Bool)

(assert (=> b!468401 (= res!279950 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8699))))

(declare-fun b!468402 () Bool)

(declare-fun res!279946 () Bool)

(assert (=> b!468402 (=> (not res!279946) (not e!274149))))

(assert (=> b!468402 (= res!279946 (and (= (size!14639 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14638 _keys!1025) (size!14639 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41964 res!279947) b!468402))

(assert (= (and b!468402 res!279946) b!468396))

(assert (= (and b!468396 res!279949) b!468401))

(assert (= (and b!468401 res!279950) b!468400))

(assert (= (and b!468400 (not res!279948)) b!468397))

(assert (= (and b!468399 condMapEmpty!21163) mapIsEmpty!21163))

(assert (= (and b!468399 (not condMapEmpty!21163)) mapNonEmpty!21163))

(get-info :version)

(assert (= (and mapNonEmpty!21163 ((_ is ValueCellFull!6146) mapValue!21163)) b!468398))

(assert (= (and b!468399 ((_ is ValueCellFull!6146) mapDefault!21163)) b!468395))

(assert (= start!41964 b!468399))

(declare-fun m!449927 () Bool)

(assert (=> b!468401 m!449927))

(declare-fun m!449929 () Bool)

(assert (=> b!468396 m!449929))

(declare-fun m!449931 () Bool)

(assert (=> b!468397 m!449931))

(declare-fun m!449933 () Bool)

(assert (=> b!468397 m!449933))

(assert (=> b!468397 m!449933))

(declare-fun m!449935 () Bool)

(assert (=> b!468397 m!449935))

(declare-fun m!449937 () Bool)

(assert (=> b!468397 m!449937))

(declare-fun m!449939 () Bool)

(assert (=> b!468397 m!449939))

(declare-fun m!449941 () Bool)

(assert (=> b!468397 m!449941))

(declare-fun m!449943 () Bool)

(assert (=> b!468400 m!449943))

(declare-fun m!449945 () Bool)

(assert (=> b!468400 m!449945))

(declare-fun m!449947 () Bool)

(assert (=> b!468400 m!449947))

(declare-fun m!449949 () Bool)

(assert (=> mapNonEmpty!21163 m!449949))

(declare-fun m!449951 () Bool)

(assert (=> start!41964 m!449951))

(declare-fun m!449953 () Bool)

(assert (=> start!41964 m!449953))

(declare-fun m!449955 () Bool)

(assert (=> start!41964 m!449955))

(check-sat (not b!468396) (not b!468397) (not b!468401) b_and!19923 (not mapNonEmpty!21163) (not b!468400) (not b_next!11551) (not start!41964) tp_is_empty!12979)
(check-sat b_and!19923 (not b_next!11551))
