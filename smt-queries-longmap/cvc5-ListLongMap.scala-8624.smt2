; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105032 () Bool)

(assert start!105032)

(declare-fun b_free!26779 () Bool)

(declare-fun b_next!26779 () Bool)

(assert (=> start!105032 (= b_free!26779 (not b_next!26779))))

(declare-fun tp!93835 () Bool)

(declare-fun b_and!44575 () Bool)

(assert (=> start!105032 (= tp!93835 b_and!44575)))

(declare-fun mapNonEmpty!49291 () Bool)

(declare-fun mapRes!49291 () Bool)

(declare-fun tp!93836 () Bool)

(declare-fun e!710888 () Bool)

(assert (=> mapNonEmpty!49291 (= mapRes!49291 (and tp!93836 e!710888))))

(declare-datatypes ((V!47607 0))(
  ( (V!47608 (val!15903 Int)) )
))
(declare-datatypes ((ValueCell!15077 0))(
  ( (ValueCellFull!15077 (v!18601 V!47607)) (EmptyCell!15077) )
))
(declare-fun mapRest!49291 () (Array (_ BitVec 32) ValueCell!15077))

(declare-fun mapValue!49291 () ValueCell!15077)

(declare-fun mapKey!49291 () (_ BitVec 32))

(declare-datatypes ((array!81028 0))(
  ( (array!81029 (arr!39078 (Array (_ BitVec 32) ValueCell!15077)) (size!39614 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81028)

(assert (=> mapNonEmpty!49291 (= (arr!39078 _values!914) (store mapRest!49291 mapKey!49291 mapValue!49291))))

(declare-fun mapIsEmpty!49291 () Bool)

(assert (=> mapIsEmpty!49291 mapRes!49291))

(declare-fun b!1251801 () Bool)

(declare-fun res!834882 () Bool)

(declare-fun e!710890 () Bool)

(assert (=> b!1251801 (=> (not res!834882) (not e!710890))))

(declare-datatypes ((array!81030 0))(
  ( (array!81031 (arr!39079 (Array (_ BitVec 32) (_ BitVec 64))) (size!39615 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81030)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81030 (_ BitVec 32)) Bool)

(assert (=> b!1251801 (= res!834882 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!834883 () Bool)

(assert (=> start!105032 (=> (not res!834883) (not e!710890))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105032 (= res!834883 (validMask!0 mask!1466))))

(assert (=> start!105032 e!710890))

(assert (=> start!105032 true))

(assert (=> start!105032 tp!93835))

(declare-fun tp_is_empty!31681 () Bool)

(assert (=> start!105032 tp_is_empty!31681))

(declare-fun array_inv!29807 (array!81030) Bool)

(assert (=> start!105032 (array_inv!29807 _keys!1118)))

(declare-fun e!710887 () Bool)

(declare-fun array_inv!29808 (array!81028) Bool)

(assert (=> start!105032 (and (array_inv!29808 _values!914) e!710887)))

(declare-fun b!1251802 () Bool)

(assert (=> b!1251802 (= e!710888 tp_is_empty!31681)))

(declare-fun b!1251803 () Bool)

(assert (=> b!1251803 (= e!710890 (not true))))

(declare-datatypes ((tuple2!20508 0))(
  ( (tuple2!20509 (_1!10265 (_ BitVec 64)) (_2!10265 V!47607)) )
))
(declare-datatypes ((List!27740 0))(
  ( (Nil!27737) (Cons!27736 (h!28945 tuple2!20508) (t!41217 List!27740)) )
))
(declare-datatypes ((ListLongMap!18381 0))(
  ( (ListLongMap!18382 (toList!9206 List!27740)) )
))
(declare-fun lt!565050 () ListLongMap!18381)

(declare-fun lt!565049 () ListLongMap!18381)

(assert (=> b!1251803 (= lt!565050 lt!565049)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47607)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47607)

(declare-datatypes ((Unit!41601 0))(
  ( (Unit!41602) )
))
(declare-fun lt!565051 () Unit!41601)

(declare-fun minValueBefore!43 () V!47607)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!966 (array!81030 array!81028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47607 V!47607 V!47607 V!47607 (_ BitVec 32) Int) Unit!41601)

(assert (=> b!1251803 (= lt!565051 (lemmaNoChangeToArrayThenSameMapNoExtras!966 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5602 (array!81030 array!81028 (_ BitVec 32) (_ BitVec 32) V!47607 V!47607 (_ BitVec 32) Int) ListLongMap!18381)

(assert (=> b!1251803 (= lt!565049 (getCurrentListMapNoExtraKeys!5602 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1251803 (= lt!565050 (getCurrentListMapNoExtraKeys!5602 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251804 () Bool)

(declare-fun e!710886 () Bool)

(assert (=> b!1251804 (= e!710886 tp_is_empty!31681)))

(declare-fun b!1251805 () Bool)

(declare-fun res!834885 () Bool)

(assert (=> b!1251805 (=> (not res!834885) (not e!710890))))

(assert (=> b!1251805 (= res!834885 (and (= (size!39614 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39615 _keys!1118) (size!39614 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251806 () Bool)

(assert (=> b!1251806 (= e!710887 (and e!710886 mapRes!49291))))

(declare-fun condMapEmpty!49291 () Bool)

(declare-fun mapDefault!49291 () ValueCell!15077)

