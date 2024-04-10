; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41902 () Bool)

(assert start!41902)

(declare-fun b_free!11491 () Bool)

(declare-fun b_next!11491 () Bool)

(assert (=> start!41902 (= b_free!11491 (not b_next!11491))))

(declare-fun tp!40486 () Bool)

(declare-fun b_and!19879 () Bool)

(assert (=> start!41902 (= tp!40486 b_and!19879)))

(declare-fun b!467798 () Bool)

(declare-fun res!279568 () Bool)

(declare-fun e!273690 () Bool)

(assert (=> b!467798 (=> (not res!279568) (not e!273690))))

(declare-datatypes ((array!29615 0))(
  ( (array!29616 (arr!14234 (Array (_ BitVec 32) (_ BitVec 64))) (size!14586 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29615)

(declare-datatypes ((List!8625 0))(
  ( (Nil!8622) (Cons!8621 (h!9477 (_ BitVec 64)) (t!14581 List!8625)) )
))
(declare-fun arrayNoDuplicates!0 (array!29615 (_ BitVec 32) List!8625) Bool)

(assert (=> b!467798 (= res!279568 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8622))))

(declare-fun b!467799 () Bool)

(declare-fun res!279567 () Bool)

(assert (=> b!467799 (=> (not res!279567) (not e!273690))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29615 (_ BitVec 32)) Bool)

(assert (=> b!467799 (= res!279567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21070 () Bool)

(declare-fun mapRes!21070 () Bool)

(assert (=> mapIsEmpty!21070 mapRes!21070))

(declare-fun b!467801 () Bool)

(declare-fun res!279569 () Bool)

(assert (=> b!467801 (=> (not res!279569) (not e!273690))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18331 0))(
  ( (V!18332 (val!6504 Int)) )
))
(declare-datatypes ((ValueCell!6116 0))(
  ( (ValueCellFull!6116 (v!8793 V!18331)) (EmptyCell!6116) )
))
(declare-datatypes ((array!29617 0))(
  ( (array!29618 (arr!14235 (Array (_ BitVec 32) ValueCell!6116)) (size!14587 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29617)

(assert (=> b!467801 (= res!279569 (and (= (size!14587 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14586 _keys!1025) (size!14587 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21070 () Bool)

(declare-fun tp!40485 () Bool)

(declare-fun e!273687 () Bool)

(assert (=> mapNonEmpty!21070 (= mapRes!21070 (and tp!40485 e!273687))))

(declare-fun mapValue!21070 () ValueCell!6116)

(declare-fun mapRest!21070 () (Array (_ BitVec 32) ValueCell!6116))

(declare-fun mapKey!21070 () (_ BitVec 32))

(assert (=> mapNonEmpty!21070 (= (arr!14235 _values!833) (store mapRest!21070 mapKey!21070 mapValue!21070))))

(declare-fun b!467800 () Bool)

(declare-fun e!273691 () Bool)

(assert (=> b!467800 (= e!273690 (not e!273691))))

(declare-fun res!279570 () Bool)

(assert (=> b!467800 (=> res!279570 e!273691)))

(assert (=> b!467800 (= res!279570 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8538 0))(
  ( (tuple2!8539 (_1!4280 (_ BitVec 64)) (_2!4280 V!18331)) )
))
(declare-datatypes ((List!8626 0))(
  ( (Nil!8623) (Cons!8622 (h!9478 tuple2!8538) (t!14582 List!8626)) )
))
(declare-datatypes ((ListLongMap!7451 0))(
  ( (ListLongMap!7452 (toList!3741 List!8626)) )
))
(declare-fun lt!211513 () ListLongMap!7451)

(declare-fun lt!211515 () ListLongMap!7451)

(assert (=> b!467800 (= lt!211513 lt!211515)))

(declare-datatypes ((Unit!13642 0))(
  ( (Unit!13643) )
))
(declare-fun lt!211514 () Unit!13642)

(declare-fun minValueBefore!38 () V!18331)

(declare-fun zeroValue!794 () V!18331)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18331)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!95 (array!29615 array!29617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 V!18331 V!18331 (_ BitVec 32) Int) Unit!13642)

(assert (=> b!467800 (= lt!211514 (lemmaNoChangeToArrayThenSameMapNoExtras!95 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1915 (array!29615 array!29617 (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 (_ BitVec 32) Int) ListLongMap!7451)

(assert (=> b!467800 (= lt!211515 (getCurrentListMapNoExtraKeys!1915 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!467800 (= lt!211513 (getCurrentListMapNoExtraKeys!1915 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279571 () Bool)

(assert (=> start!41902 (=> (not res!279571) (not e!273690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41902 (= res!279571 (validMask!0 mask!1365))))

(assert (=> start!41902 e!273690))

(declare-fun tp_is_empty!12919 () Bool)

(assert (=> start!41902 tp_is_empty!12919))

(assert (=> start!41902 tp!40486))

(assert (=> start!41902 true))

(declare-fun array_inv!10274 (array!29615) Bool)

(assert (=> start!41902 (array_inv!10274 _keys!1025)))

(declare-fun e!273686 () Bool)

(declare-fun array_inv!10275 (array!29617) Bool)

(assert (=> start!41902 (and (array_inv!10275 _values!833) e!273686)))

(declare-fun b!467802 () Bool)

(assert (=> b!467802 (= e!273691 true)))

(declare-fun lt!211512 () ListLongMap!7451)

(declare-fun getCurrentListMap!2170 (array!29615 array!29617 (_ BitVec 32) (_ BitVec 32) V!18331 V!18331 (_ BitVec 32) Int) ListLongMap!7451)

(assert (=> b!467802 (= lt!211512 (getCurrentListMap!2170 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!467803 () Bool)

(declare-fun e!273688 () Bool)

(assert (=> b!467803 (= e!273686 (and e!273688 mapRes!21070))))

(declare-fun condMapEmpty!21070 () Bool)

(declare-fun mapDefault!21070 () ValueCell!6116)

