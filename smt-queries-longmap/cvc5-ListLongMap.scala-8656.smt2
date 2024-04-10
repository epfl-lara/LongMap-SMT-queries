; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105276 () Bool)

(assert start!105276)

(declare-fun b_free!26971 () Bool)

(declare-fun b_next!26971 () Bool)

(assert (=> start!105276 (= b_free!26971 (not b_next!26971))))

(declare-fun tp!94420 () Bool)

(declare-fun b_and!44797 () Bool)

(assert (=> start!105276 (= tp!94420 b_and!44797)))

(declare-fun b!1254461 () Bool)

(declare-fun e!712822 () Bool)

(declare-fun tp_is_empty!31873 () Bool)

(assert (=> b!1254461 (= e!712822 tp_is_empty!31873)))

(declare-fun b!1254462 () Bool)

(declare-fun res!836434 () Bool)

(declare-fun e!712821 () Bool)

(assert (=> b!1254462 (=> (not res!836434) (not e!712821))))

(declare-datatypes ((array!81400 0))(
  ( (array!81401 (arr!39261 (Array (_ BitVec 32) (_ BitVec 64))) (size!39797 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81400)

(declare-datatypes ((List!27883 0))(
  ( (Nil!27880) (Cons!27879 (h!29088 (_ BitVec 64)) (t!41366 List!27883)) )
))
(declare-fun arrayNoDuplicates!0 (array!81400 (_ BitVec 32) List!27883) Bool)

(assert (=> b!1254462 (= res!836434 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27880))))

(declare-fun mapIsEmpty!49588 () Bool)

(declare-fun mapRes!49588 () Bool)

(assert (=> mapIsEmpty!49588 mapRes!49588))

(declare-fun b!1254463 () Bool)

(declare-fun res!836432 () Bool)

(assert (=> b!1254463 (=> (not res!836432) (not e!712821))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81400 (_ BitVec 32)) Bool)

(assert (=> b!1254463 (= res!836432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!836433 () Bool)

(assert (=> start!105276 (=> (not res!836433) (not e!712821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105276 (= res!836433 (validMask!0 mask!1466))))

(assert (=> start!105276 e!712821))

(assert (=> start!105276 true))

(assert (=> start!105276 tp!94420))

(assert (=> start!105276 tp_is_empty!31873))

(declare-fun array_inv!29929 (array!81400) Bool)

(assert (=> start!105276 (array_inv!29929 _keys!1118)))

(declare-datatypes ((V!47863 0))(
  ( (V!47864 (val!15999 Int)) )
))
(declare-datatypes ((ValueCell!15173 0))(
  ( (ValueCellFull!15173 (v!18698 V!47863)) (EmptyCell!15173) )
))
(declare-datatypes ((array!81402 0))(
  ( (array!81403 (arr!39262 (Array (_ BitVec 32) ValueCell!15173)) (size!39798 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81402)

(declare-fun e!712826 () Bool)

(declare-fun array_inv!29930 (array!81402) Bool)

(assert (=> start!105276 (and (array_inv!29930 _values!914) e!712826)))

(declare-fun b!1254464 () Bool)

(declare-fun e!712824 () Bool)

(assert (=> b!1254464 (= e!712821 (not e!712824))))

(declare-fun res!836436 () Bool)

(assert (=> b!1254464 (=> res!836436 e!712824)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1254464 (= res!836436 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!20658 0))(
  ( (tuple2!20659 (_1!10340 (_ BitVec 64)) (_2!10340 V!47863)) )
))
(declare-datatypes ((List!27884 0))(
  ( (Nil!27881) (Cons!27880 (h!29089 tuple2!20658) (t!41367 List!27884)) )
))
(declare-datatypes ((ListLongMap!18531 0))(
  ( (ListLongMap!18532 (toList!9281 List!27884)) )
))
(declare-fun lt!566946 () ListLongMap!18531)

(declare-fun lt!566945 () ListLongMap!18531)

(assert (=> b!1254464 (= lt!566946 lt!566945)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!47863)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47863)

(declare-fun minValueBefore!43 () V!47863)

(declare-datatypes ((Unit!41746 0))(
  ( (Unit!41747) )
))
(declare-fun lt!566948 () Unit!41746)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1032 (array!81400 array!81402 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 V!47863 V!47863 (_ BitVec 32) Int) Unit!41746)

(assert (=> b!1254464 (= lt!566948 (lemmaNoChangeToArrayThenSameMapNoExtras!1032 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5668 (array!81400 array!81402 (_ BitVec 32) (_ BitVec 32) V!47863 V!47863 (_ BitVec 32) Int) ListLongMap!18531)

(assert (=> b!1254464 (= lt!566945 (getCurrentListMapNoExtraKeys!5668 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1254464 (= lt!566946 (getCurrentListMapNoExtraKeys!5668 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1254465 () Bool)

(declare-fun e!712825 () Bool)

(assert (=> b!1254465 (= e!712825 tp_is_empty!31873)))

(declare-fun b!1254466 () Bool)

(declare-fun res!836435 () Bool)

(assert (=> b!1254466 (=> (not res!836435) (not e!712821))))

(assert (=> b!1254466 (= res!836435 (and (= (size!39798 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39797 _keys!1118) (size!39798 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254467 () Bool)

(assert (=> b!1254467 (= e!712826 (and e!712825 mapRes!49588))))

(declare-fun condMapEmpty!49588 () Bool)

(declare-fun mapDefault!49588 () ValueCell!15173)

