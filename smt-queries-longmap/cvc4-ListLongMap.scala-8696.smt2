; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105600 () Bool)

(assert start!105600)

(declare-fun b_free!27215 () Bool)

(declare-fun b_next!27215 () Bool)

(assert (=> start!105600 (= b_free!27215 (not b_next!27215))))

(declare-fun tp!95164 () Bool)

(declare-fun b_and!45081 () Bool)

(assert (=> start!105600 (= tp!95164 b_and!45081)))

(declare-fun mapIsEmpty!49966 () Bool)

(declare-fun mapRes!49966 () Bool)

(assert (=> mapIsEmpty!49966 mapRes!49966))

(declare-fun mapNonEmpty!49966 () Bool)

(declare-fun tp!95165 () Bool)

(declare-fun e!715394 () Bool)

(assert (=> mapNonEmpty!49966 (= mapRes!49966 (and tp!95165 e!715394))))

(declare-datatypes ((V!48187 0))(
  ( (V!48188 (val!16121 Int)) )
))
(declare-datatypes ((ValueCell!15295 0))(
  ( (ValueCellFull!15295 (v!18823 V!48187)) (EmptyCell!15295) )
))
(declare-fun mapValue!49966 () ValueCell!15295)

(declare-datatypes ((array!81862 0))(
  ( (array!81863 (arr!39488 (Array (_ BitVec 32) ValueCell!15295)) (size!40024 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81862)

(declare-fun mapRest!49966 () (Array (_ BitVec 32) ValueCell!15295))

(declare-fun mapKey!49966 () (_ BitVec 32))

(assert (=> mapNonEmpty!49966 (= (arr!39488 _values!914) (store mapRest!49966 mapKey!49966 mapValue!49966))))

(declare-fun b!1257973 () Bool)

(declare-fun res!838500 () Bool)

(declare-fun e!715393 () Bool)

(assert (=> b!1257973 (=> (not res!838500) (not e!715393))))

(declare-datatypes ((array!81864 0))(
  ( (array!81865 (arr!39489 (Array (_ BitVec 32) (_ BitVec 64))) (size!40025 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81864)

(declare-datatypes ((List!28041 0))(
  ( (Nil!28038) (Cons!28037 (h!29246 (_ BitVec 64)) (t!41532 List!28041)) )
))
(declare-fun arrayNoDuplicates!0 (array!81864 (_ BitVec 32) List!28041) Bool)

(assert (=> b!1257973 (= res!838500 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28038))))

(declare-fun res!838499 () Bool)

(assert (=> start!105600 (=> (not res!838499) (not e!715393))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105600 (= res!838499 (validMask!0 mask!1466))))

(assert (=> start!105600 e!715393))

(assert (=> start!105600 true))

(assert (=> start!105600 tp!95164))

(declare-fun tp_is_empty!32117 () Bool)

(assert (=> start!105600 tp_is_empty!32117))

(declare-fun array_inv!30079 (array!81864) Bool)

(assert (=> start!105600 (array_inv!30079 _keys!1118)))

(declare-fun e!715396 () Bool)

(declare-fun array_inv!30080 (array!81862) Bool)

(assert (=> start!105600 (and (array_inv!30080 _values!914) e!715396)))

(declare-fun b!1257974 () Bool)

(assert (=> b!1257974 (= e!715394 tp_is_empty!32117)))

(declare-fun b!1257975 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1257975 (= e!715393 (not (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!40025 _keys!1118)))))))

(declare-datatypes ((tuple2!20826 0))(
  ( (tuple2!20827 (_1!10424 (_ BitVec 64)) (_2!10424 V!48187)) )
))
(declare-datatypes ((List!28042 0))(
  ( (Nil!28039) (Cons!28038 (h!29247 tuple2!20826) (t!41533 List!28042)) )
))
(declare-datatypes ((ListLongMap!18699 0))(
  ( (ListLongMap!18700 (toList!9365 List!28042)) )
))
(declare-fun lt!568973 () ListLongMap!18699)

(declare-fun lt!568972 () ListLongMap!18699)

(assert (=> b!1257975 (= lt!568973 lt!568972)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!41914 0))(
  ( (Unit!41915) )
))
(declare-fun lt!568974 () Unit!41914)

(declare-fun minValueAfter!43 () V!48187)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48187)

(declare-fun minValueBefore!43 () V!48187)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1107 (array!81864 array!81862 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48187 V!48187 V!48187 V!48187 (_ BitVec 32) Int) Unit!41914)

(assert (=> b!1257975 (= lt!568974 (lemmaNoChangeToArrayThenSameMapNoExtras!1107 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5743 (array!81864 array!81862 (_ BitVec 32) (_ BitVec 32) V!48187 V!48187 (_ BitVec 32) Int) ListLongMap!18699)

(assert (=> b!1257975 (= lt!568972 (getCurrentListMapNoExtraKeys!5743 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257975 (= lt!568973 (getCurrentListMapNoExtraKeys!5743 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257976 () Bool)

(declare-fun res!838501 () Bool)

(assert (=> b!1257976 (=> (not res!838501) (not e!715393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81864 (_ BitVec 32)) Bool)

(assert (=> b!1257976 (= res!838501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257977 () Bool)

(declare-fun res!838498 () Bool)

(assert (=> b!1257977 (=> (not res!838498) (not e!715393))))

(assert (=> b!1257977 (= res!838498 (and (= (size!40024 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40025 _keys!1118) (size!40024 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257978 () Bool)

(declare-fun e!715395 () Bool)

(assert (=> b!1257978 (= e!715395 tp_is_empty!32117)))

(declare-fun b!1257979 () Bool)

(assert (=> b!1257979 (= e!715396 (and e!715395 mapRes!49966))))

(declare-fun condMapEmpty!49966 () Bool)

(declare-fun mapDefault!49966 () ValueCell!15295)

