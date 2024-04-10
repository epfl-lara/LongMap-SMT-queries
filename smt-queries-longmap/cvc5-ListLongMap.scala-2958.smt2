; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41984 () Bool)

(assert start!41984)

(declare-fun b_free!11557 () Bool)

(declare-fun b_next!11557 () Bool)

(assert (=> start!41984 (= b_free!11557 (not b_next!11557))))

(declare-fun tp!40686 () Bool)

(declare-fun b_and!19955 () Bool)

(assert (=> start!41984 (= tp!40686 b_and!19955)))

(declare-fun b!468738 () Bool)

(declare-fun res!280121 () Bool)

(declare-fun e!274379 () Bool)

(assert (=> b!468738 (=> (not res!280121) (not e!274379))))

(declare-datatypes ((array!29745 0))(
  ( (array!29746 (arr!14298 (Array (_ BitVec 32) (_ BitVec 64))) (size!14650 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29745)

(declare-datatypes ((List!8680 0))(
  ( (Nil!8677) (Cons!8676 (h!9532 (_ BitVec 64)) (t!14638 List!8680)) )
))
(declare-fun arrayNoDuplicates!0 (array!29745 (_ BitVec 32) List!8680) Bool)

(assert (=> b!468738 (= res!280121 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8677))))

(declare-fun mapNonEmpty!21172 () Bool)

(declare-fun mapRes!21172 () Bool)

(declare-fun tp!40687 () Bool)

(declare-fun e!274377 () Bool)

(assert (=> mapNonEmpty!21172 (= mapRes!21172 (and tp!40687 e!274377))))

(declare-datatypes ((V!18419 0))(
  ( (V!18420 (val!6537 Int)) )
))
(declare-datatypes ((ValueCell!6149 0))(
  ( (ValueCellFull!6149 (v!8826 V!18419)) (EmptyCell!6149) )
))
(declare-fun mapValue!21172 () ValueCell!6149)

(declare-datatypes ((array!29747 0))(
  ( (array!29748 (arr!14299 (Array (_ BitVec 32) ValueCell!6149)) (size!14651 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29747)

(declare-fun mapKey!21172 () (_ BitVec 32))

(declare-fun mapRest!21172 () (Array (_ BitVec 32) ValueCell!6149))

(assert (=> mapNonEmpty!21172 (= (arr!14299 _values!833) (store mapRest!21172 mapKey!21172 mapValue!21172))))

(declare-fun b!468739 () Bool)

(declare-fun e!274376 () Bool)

(declare-fun tp_is_empty!12985 () Bool)

(assert (=> b!468739 (= e!274376 tp_is_empty!12985)))

(declare-fun mapIsEmpty!21172 () Bool)

(assert (=> mapIsEmpty!21172 mapRes!21172))

(declare-fun b!468740 () Bool)

(declare-fun res!280122 () Bool)

(assert (=> b!468740 (=> (not res!280122) (not e!274379))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!468740 (= res!280122 (and (= (size!14651 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14650 _keys!1025) (size!14651 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468741 () Bool)

(declare-fun e!274378 () Bool)

(assert (=> b!468741 (= e!274379 (not e!274378))))

(declare-fun res!280124 () Bool)

(assert (=> b!468741 (=> res!280124 e!274378)))

(assert (=> b!468741 (= res!280124 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8596 0))(
  ( (tuple2!8597 (_1!4309 (_ BitVec 64)) (_2!4309 V!18419)) )
))
(declare-datatypes ((List!8681 0))(
  ( (Nil!8678) (Cons!8677 (h!9533 tuple2!8596) (t!14639 List!8681)) )
))
(declare-datatypes ((ListLongMap!7509 0))(
  ( (ListLongMap!7510 (toList!3770 List!8681)) )
))
(declare-fun lt!212107 () ListLongMap!7509)

(declare-fun lt!212102 () ListLongMap!7509)

(assert (=> b!468741 (= lt!212107 lt!212102)))

(declare-fun zeroValue!794 () V!18419)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13695 0))(
  ( (Unit!13696) )
))
(declare-fun lt!212105 () Unit!13695)

(declare-fun minValueBefore!38 () V!18419)

(declare-fun minValueAfter!38 () V!18419)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!120 (array!29745 array!29747 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 V!18419 V!18419 (_ BitVec 32) Int) Unit!13695)

(assert (=> b!468741 (= lt!212105 (lemmaNoChangeToArrayThenSameMapNoExtras!120 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1940 (array!29745 array!29747 (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 (_ BitVec 32) Int) ListLongMap!7509)

(assert (=> b!468741 (= lt!212102 (getCurrentListMapNoExtraKeys!1940 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468741 (= lt!212107 (getCurrentListMapNoExtraKeys!1940 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468742 () Bool)

(assert (=> b!468742 (= e!274378 true)))

(declare-fun lt!212104 () tuple2!8596)

(declare-fun +!1681 (ListLongMap!7509 tuple2!8596) ListLongMap!7509)

(assert (=> b!468742 (= (+!1681 lt!212107 lt!212104) (+!1681 (+!1681 lt!212107 (tuple2!8597 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!212104))))

(assert (=> b!468742 (= lt!212104 (tuple2!8597 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!212101 () Unit!13695)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!94 (ListLongMap!7509 (_ BitVec 64) V!18419 V!18419) Unit!13695)

(assert (=> b!468742 (= lt!212101 (addSameAsAddTwiceSameKeyDiffValues!94 lt!212107 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!212106 () ListLongMap!7509)

(declare-fun getCurrentListMap!2195 (array!29745 array!29747 (_ BitVec 32) (_ BitVec 32) V!18419 V!18419 (_ BitVec 32) Int) ListLongMap!7509)

(assert (=> b!468742 (= lt!212106 (getCurrentListMap!2195 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!212103 () ListLongMap!7509)

(assert (=> b!468742 (= lt!212103 (getCurrentListMap!2195 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468744 () Bool)

(declare-fun res!280123 () Bool)

(assert (=> b!468744 (=> (not res!280123) (not e!274379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29745 (_ BitVec 32)) Bool)

(assert (=> b!468744 (= res!280123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468745 () Bool)

(assert (=> b!468745 (= e!274377 tp_is_empty!12985)))

(declare-fun b!468743 () Bool)

(declare-fun e!274375 () Bool)

(assert (=> b!468743 (= e!274375 (and e!274376 mapRes!21172))))

(declare-fun condMapEmpty!21172 () Bool)

(declare-fun mapDefault!21172 () ValueCell!6149)

