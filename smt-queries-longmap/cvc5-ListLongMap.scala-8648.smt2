; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105206 () Bool)

(assert start!105206)

(declare-fun b_free!26923 () Bool)

(declare-fun b_next!26923 () Bool)

(assert (=> start!105206 (= b_free!26923 (not b_next!26923))))

(declare-fun tp!94273 () Bool)

(declare-fun b_and!44737 () Bool)

(assert (=> start!105206 (= tp!94273 b_and!44737)))

(declare-fun b!1253701 () Bool)

(declare-fun e!712274 () Bool)

(declare-fun tp_is_empty!31825 () Bool)

(assert (=> b!1253701 (= e!712274 tp_is_empty!31825)))

(declare-fun b!1253702 () Bool)

(declare-fun res!835992 () Bool)

(declare-fun e!712271 () Bool)

(assert (=> b!1253702 (=> (not res!835992) (not e!712271))))

(declare-datatypes ((array!81308 0))(
  ( (array!81309 (arr!39216 (Array (_ BitVec 32) (_ BitVec 64))) (size!39752 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81308)

(declare-datatypes ((List!27847 0))(
  ( (Nil!27844) (Cons!27843 (h!29052 (_ BitVec 64)) (t!41328 List!27847)) )
))
(declare-fun arrayNoDuplicates!0 (array!81308 (_ BitVec 32) List!27847) Bool)

(assert (=> b!1253702 (= res!835992 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27844))))

(declare-fun b!1253703 () Bool)

(declare-fun e!712272 () Bool)

(assert (=> b!1253703 (= e!712272 true)))

(declare-datatypes ((V!47799 0))(
  ( (V!47800 (val!15975 Int)) )
))
(declare-datatypes ((tuple2!20618 0))(
  ( (tuple2!20619 (_1!10320 (_ BitVec 64)) (_2!10320 V!47799)) )
))
(declare-datatypes ((List!27848 0))(
  ( (Nil!27845) (Cons!27844 (h!29053 tuple2!20618) (t!41329 List!27848)) )
))
(declare-datatypes ((ListLongMap!18491 0))(
  ( (ListLongMap!18492 (toList!9261 List!27848)) )
))
(declare-fun lt!566238 () ListLongMap!18491)

(declare-fun lt!566231 () ListLongMap!18491)

(declare-fun -!2034 (ListLongMap!18491 (_ BitVec 64)) ListLongMap!18491)

(assert (=> b!1253703 (= lt!566238 (-!2034 lt!566231 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!566237 () ListLongMap!18491)

(declare-fun lt!566233 () ListLongMap!18491)

(assert (=> b!1253703 (= (-!2034 lt!566237 #b1000000000000000000000000000000000000000000000000000000000000000) lt!566233)))

(declare-datatypes ((Unit!41704 0))(
  ( (Unit!41705) )
))
(declare-fun lt!566234 () Unit!41704)

(declare-fun minValueBefore!43 () V!47799)

(declare-fun addThenRemoveForNewKeyIsSame!304 (ListLongMap!18491 (_ BitVec 64) V!47799) Unit!41704)

(assert (=> b!1253703 (= lt!566234 (addThenRemoveForNewKeyIsSame!304 lt!566233 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))

(declare-fun lt!566232 () ListLongMap!18491)

(declare-fun lt!566235 () ListLongMap!18491)

(assert (=> b!1253703 (and (= lt!566231 lt!566237) (= lt!566235 lt!566232))))

(declare-fun +!4157 (ListLongMap!18491 tuple2!20618) ListLongMap!18491)

(assert (=> b!1253703 (= lt!566237 (+!4157 lt!566233 (tuple2!20619 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47799)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47799)

(declare-datatypes ((ValueCell!15149 0))(
  ( (ValueCellFull!15149 (v!18673 V!47799)) (EmptyCell!15149) )
))
(declare-datatypes ((array!81310 0))(
  ( (array!81311 (arr!39217 (Array (_ BitVec 32) ValueCell!15149)) (size!39753 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81310)

(declare-fun getCurrentListMap!4505 (array!81308 array!81310 (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 (_ BitVec 32) Int) ListLongMap!18491)

(assert (=> b!1253703 (= lt!566235 (getCurrentListMap!4505 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1253703 (= lt!566231 (getCurrentListMap!4505 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253704 () Bool)

(declare-fun res!835990 () Bool)

(assert (=> b!1253704 (=> (not res!835990) (not e!712271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81308 (_ BitVec 32)) Bool)

(assert (=> b!1253704 (= res!835990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49513 () Bool)

(declare-fun mapRes!49513 () Bool)

(declare-fun tp!94274 () Bool)

(declare-fun e!712275 () Bool)

(assert (=> mapNonEmpty!49513 (= mapRes!49513 (and tp!94274 e!712275))))

(declare-fun mapKey!49513 () (_ BitVec 32))

(declare-fun mapValue!49513 () ValueCell!15149)

(declare-fun mapRest!49513 () (Array (_ BitVec 32) ValueCell!15149))

(assert (=> mapNonEmpty!49513 (= (arr!39217 _values!914) (store mapRest!49513 mapKey!49513 mapValue!49513))))

(declare-fun b!1253705 () Bool)

(assert (=> b!1253705 (= e!712275 tp_is_empty!31825)))

(declare-fun res!835993 () Bool)

(assert (=> start!105206 (=> (not res!835993) (not e!712271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105206 (= res!835993 (validMask!0 mask!1466))))

(assert (=> start!105206 e!712271))

(assert (=> start!105206 true))

(assert (=> start!105206 tp!94273))

(assert (=> start!105206 tp_is_empty!31825))

(declare-fun array_inv!29895 (array!81308) Bool)

(assert (=> start!105206 (array_inv!29895 _keys!1118)))

(declare-fun e!712273 () Bool)

(declare-fun array_inv!29896 (array!81310) Bool)

(assert (=> start!105206 (and (array_inv!29896 _values!914) e!712273)))

(declare-fun b!1253706 () Bool)

(assert (=> b!1253706 (= e!712271 (not e!712272))))

(declare-fun res!835994 () Bool)

(assert (=> b!1253706 (=> res!835994 e!712272)))

(assert (=> b!1253706 (= res!835994 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1253706 (= lt!566233 lt!566232)))

(declare-fun lt!566236 () Unit!41704)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1015 (array!81308 array!81310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 V!47799 V!47799 (_ BitVec 32) Int) Unit!41704)

(assert (=> b!1253706 (= lt!566236 (lemmaNoChangeToArrayThenSameMapNoExtras!1015 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5651 (array!81308 array!81310 (_ BitVec 32) (_ BitVec 32) V!47799 V!47799 (_ BitVec 32) Int) ListLongMap!18491)

(assert (=> b!1253706 (= lt!566232 (getCurrentListMapNoExtraKeys!5651 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1253706 (= lt!566233 (getCurrentListMapNoExtraKeys!5651 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1253707 () Bool)

(assert (=> b!1253707 (= e!712273 (and e!712274 mapRes!49513))))

(declare-fun condMapEmpty!49513 () Bool)

(declare-fun mapDefault!49513 () ValueCell!15149)

