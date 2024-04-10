; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105656 () Bool)

(assert start!105656)

(declare-fun b_free!27257 () Bool)

(declare-fun b_next!27257 () Bool)

(assert (=> start!105656 (= b_free!27257 (not b_next!27257))))

(declare-fun tp!95294 () Bool)

(declare-fun b_and!45131 () Bool)

(assert (=> start!105656 (= tp!95294 b_and!45131)))

(declare-fun b!1258561 () Bool)

(declare-fun res!838846 () Bool)

(declare-fun e!715828 () Bool)

(assert (=> b!1258561 (=> (not res!838846) (not e!715828))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81938 0))(
  ( (array!81939 (arr!39525 (Array (_ BitVec 32) (_ BitVec 64))) (size!40061 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81938)

(declare-datatypes ((V!48243 0))(
  ( (V!48244 (val!16142 Int)) )
))
(declare-datatypes ((ValueCell!15316 0))(
  ( (ValueCellFull!15316 (v!18844 V!48243)) (EmptyCell!15316) )
))
(declare-datatypes ((array!81940 0))(
  ( (array!81941 (arr!39526 (Array (_ BitVec 32) ValueCell!15316)) (size!40062 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81940)

(assert (=> b!1258561 (= res!838846 (and (= (size!40062 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40061 _keys!1118) (size!40062 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258562 () Bool)

(declare-fun res!838843 () Bool)

(assert (=> b!1258562 (=> (not res!838843) (not e!715828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81938 (_ BitVec 32)) Bool)

(assert (=> b!1258562 (= res!838843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258563 () Bool)

(declare-fun e!715829 () Bool)

(declare-fun tp_is_empty!32159 () Bool)

(assert (=> b!1258563 (= e!715829 tp_is_empty!32159)))

(declare-fun b!1258564 () Bool)

(declare-fun e!715826 () Bool)

(assert (=> b!1258564 (= e!715828 (not e!715826))))

(declare-fun res!838844 () Bool)

(assert (=> b!1258564 (=> res!838844 e!715826)))

(assert (=> b!1258564 (= res!838844 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20852 0))(
  ( (tuple2!20853 (_1!10437 (_ BitVec 64)) (_2!10437 V!48243)) )
))
(declare-datatypes ((List!28066 0))(
  ( (Nil!28063) (Cons!28062 (h!29271 tuple2!20852) (t!41559 List!28066)) )
))
(declare-datatypes ((ListLongMap!18725 0))(
  ( (ListLongMap!18726 (toList!9378 List!28066)) )
))
(declare-fun lt!569266 () ListLongMap!18725)

(declare-fun lt!569264 () ListLongMap!18725)

(assert (=> b!1258564 (= lt!569266 lt!569264)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41938 0))(
  ( (Unit!41939) )
))
(declare-fun lt!569265 () Unit!41938)

(declare-fun minValueAfter!43 () V!48243)

(declare-fun zeroValue!871 () V!48243)

(declare-fun minValueBefore!43 () V!48243)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1119 (array!81938 array!81940 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48243 V!48243 V!48243 V!48243 (_ BitVec 32) Int) Unit!41938)

(assert (=> b!1258564 (= lt!569265 (lemmaNoChangeToArrayThenSameMapNoExtras!1119 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5755 (array!81938 array!81940 (_ BitVec 32) (_ BitVec 32) V!48243 V!48243 (_ BitVec 32) Int) ListLongMap!18725)

(assert (=> b!1258564 (= lt!569264 (getCurrentListMapNoExtraKeys!5755 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258564 (= lt!569266 (getCurrentListMapNoExtraKeys!5755 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258565 () Bool)

(declare-fun e!715824 () Bool)

(declare-fun e!715827 () Bool)

(declare-fun mapRes!50032 () Bool)

(assert (=> b!1258565 (= e!715824 (and e!715827 mapRes!50032))))

(declare-fun condMapEmpty!50032 () Bool)

(declare-fun mapDefault!50032 () ValueCell!15316)

