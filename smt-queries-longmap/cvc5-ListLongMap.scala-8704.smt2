; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105658 () Bool)

(assert start!105658)

(declare-fun b_free!27259 () Bool)

(declare-fun b_next!27259 () Bool)

(assert (=> start!105658 (= b_free!27259 (not b_next!27259))))

(declare-fun tp!95299 () Bool)

(declare-fun b_and!45133 () Bool)

(assert (=> start!105658 (= tp!95299 b_and!45133)))

(declare-fun b!1258585 () Bool)

(declare-fun e!715846 () Bool)

(declare-fun e!715843 () Bool)

(assert (=> b!1258585 (= e!715846 (not e!715843))))

(declare-fun res!838862 () Bool)

(assert (=> b!1258585 (=> res!838862 e!715843)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258585 (= res!838862 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48247 0))(
  ( (V!48248 (val!16143 Int)) )
))
(declare-datatypes ((tuple2!20854 0))(
  ( (tuple2!20855 (_1!10438 (_ BitVec 64)) (_2!10438 V!48247)) )
))
(declare-datatypes ((List!28067 0))(
  ( (Nil!28064) (Cons!28063 (h!29272 tuple2!20854) (t!41560 List!28067)) )
))
(declare-datatypes ((ListLongMap!18727 0))(
  ( (ListLongMap!18728 (toList!9379 List!28067)) )
))
(declare-fun lt!569275 () ListLongMap!18727)

(declare-fun lt!569276 () ListLongMap!18727)

(assert (=> b!1258585 (= lt!569275 lt!569276)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48247)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48247)

(declare-datatypes ((array!81942 0))(
  ( (array!81943 (arr!39527 (Array (_ BitVec 32) (_ BitVec 64))) (size!40063 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81942)

(declare-datatypes ((ValueCell!15317 0))(
  ( (ValueCellFull!15317 (v!18845 V!48247)) (EmptyCell!15317) )
))
(declare-datatypes ((array!81944 0))(
  ( (array!81945 (arr!39528 (Array (_ BitVec 32) ValueCell!15317)) (size!40064 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81944)

(declare-datatypes ((Unit!41940 0))(
  ( (Unit!41941) )
))
(declare-fun lt!569277 () Unit!41940)

(declare-fun minValueBefore!43 () V!48247)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1120 (array!81942 array!81944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 V!48247 V!48247 (_ BitVec 32) Int) Unit!41940)

(assert (=> b!1258585 (= lt!569277 (lemmaNoChangeToArrayThenSameMapNoExtras!1120 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5756 (array!81942 array!81944 (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 (_ BitVec 32) Int) ListLongMap!18727)

(assert (=> b!1258585 (= lt!569276 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258585 (= lt!569275 (getCurrentListMapNoExtraKeys!5756 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258586 () Bool)

(assert (=> b!1258586 (= e!715843 true)))

(declare-fun lt!569278 () ListLongMap!18727)

(declare-fun getCurrentListMap!4581 (array!81942 array!81944 (_ BitVec 32) (_ BitVec 32) V!48247 V!48247 (_ BitVec 32) Int) ListLongMap!18727)

(assert (=> b!1258586 (= lt!569278 (getCurrentListMap!4581 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!50035 () Bool)

(declare-fun mapRes!50035 () Bool)

(declare-fun tp!95300 () Bool)

(declare-fun e!715842 () Bool)

(assert (=> mapNonEmpty!50035 (= mapRes!50035 (and tp!95300 e!715842))))

(declare-fun mapValue!50035 () ValueCell!15317)

(declare-fun mapRest!50035 () (Array (_ BitVec 32) ValueCell!15317))

(declare-fun mapKey!50035 () (_ BitVec 32))

(assert (=> mapNonEmpty!50035 (= (arr!39528 _values!914) (store mapRest!50035 mapKey!50035 mapValue!50035))))

(declare-fun b!1258587 () Bool)

(declare-fun res!838860 () Bool)

(assert (=> b!1258587 (=> (not res!838860) (not e!715846))))

(declare-datatypes ((List!28068 0))(
  ( (Nil!28065) (Cons!28064 (h!29273 (_ BitVec 64)) (t!41561 List!28068)) )
))
(declare-fun arrayNoDuplicates!0 (array!81942 (_ BitVec 32) List!28068) Bool)

(assert (=> b!1258587 (= res!838860 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28065))))

(declare-fun b!1258588 () Bool)

(declare-fun res!838861 () Bool)

(assert (=> b!1258588 (=> (not res!838861) (not e!715846))))

(assert (=> b!1258588 (= res!838861 (and (= (size!40064 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40063 _keys!1118) (size!40064 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258590 () Bool)

(declare-fun res!838858 () Bool)

(assert (=> b!1258590 (=> (not res!838858) (not e!715846))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81942 (_ BitVec 32)) Bool)

(assert (=> b!1258590 (= res!838858 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258591 () Bool)

(declare-fun e!715845 () Bool)

(declare-fun e!715844 () Bool)

(assert (=> b!1258591 (= e!715845 (and e!715844 mapRes!50035))))

(declare-fun condMapEmpty!50035 () Bool)

(declare-fun mapDefault!50035 () ValueCell!15317)

