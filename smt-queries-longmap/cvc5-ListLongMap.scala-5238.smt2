; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70508 () Bool)

(assert start!70508)

(declare-fun b_free!12835 () Bool)

(declare-fun b_next!12835 () Bool)

(assert (=> start!70508 (= b_free!12835 (not b_next!12835))))

(declare-fun tp!45238 () Bool)

(declare-fun b_and!21665 () Bool)

(assert (=> start!70508 (= tp!45238 b_and!21665)))

(declare-fun b!819030 () Bool)

(declare-fun e!454763 () Bool)

(assert (=> b!819030 (= e!454763 true)))

(declare-datatypes ((V!24395 0))(
  ( (V!24396 (val!7320 Int)) )
))
(declare-datatypes ((tuple2!9626 0))(
  ( (tuple2!9627 (_1!4824 (_ BitVec 64)) (_2!4824 V!24395)) )
))
(declare-fun lt!367314 () tuple2!9626)

(declare-datatypes ((List!15456 0))(
  ( (Nil!15453) (Cons!15452 (h!16581 tuple2!9626) (t!21785 List!15456)) )
))
(declare-datatypes ((ListLongMap!8449 0))(
  ( (ListLongMap!8450 (toList!4240 List!15456)) )
))
(declare-fun lt!367317 () ListLongMap!8449)

(declare-fun lt!367322 () tuple2!9626)

(declare-fun lt!367318 () ListLongMap!8449)

(declare-fun +!1837 (ListLongMap!8449 tuple2!9626) ListLongMap!8449)

(assert (=> b!819030 (= lt!367317 (+!1837 (+!1837 lt!367318 lt!367314) lt!367322))))

(declare-fun lt!367316 () ListLongMap!8449)

(declare-fun lt!367319 () ListLongMap!8449)

(assert (=> b!819030 (= (+!1837 lt!367316 lt!367322) (+!1837 lt!367319 lt!367322))))

(declare-fun zeroValueBefore!34 () V!24395)

(declare-fun zeroValueAfter!34 () V!24395)

(declare-datatypes ((Unit!27959 0))(
  ( (Unit!27960) )
))
(declare-fun lt!367315 () Unit!27959)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!177 (ListLongMap!8449 (_ BitVec 64) V!24395 V!24395) Unit!27959)

(assert (=> b!819030 (= lt!367315 (addSameAsAddTwiceSameKeyDiffValues!177 lt!367316 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819030 (= lt!367322 (tuple2!9627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454762 () Bool)

(assert (=> b!819030 e!454762))

(declare-fun res!558922 () Bool)

(assert (=> b!819030 (=> (not res!558922) (not e!454762))))

(declare-fun lt!367313 () ListLongMap!8449)

(assert (=> b!819030 (= res!558922 (= lt!367313 lt!367319))))

(assert (=> b!819030 (= lt!367319 (+!1837 lt!367316 lt!367314))))

(assert (=> b!819030 (= lt!367314 (tuple2!9627 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-datatypes ((array!45286 0))(
  ( (array!45287 (arr!21697 (Array (_ BitVec 32) (_ BitVec 64))) (size!22118 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45286)

(declare-fun minValue!754 () V!24395)

(declare-datatypes ((ValueCell!6857 0))(
  ( (ValueCellFull!6857 (v!9749 V!24395)) (EmptyCell!6857) )
))
(declare-datatypes ((array!45288 0))(
  ( (array!45289 (arr!21698 (Array (_ BitVec 32) ValueCell!6857)) (size!22119 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45288)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lt!367321 () ListLongMap!8449)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2443 (array!45286 array!45288 (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 (_ BitVec 32) Int) ListLongMap!8449)

(assert (=> b!819030 (= lt!367321 (getCurrentListMap!2443 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819030 (= lt!367313 (getCurrentListMap!2443 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819031 () Bool)

(declare-fun e!454764 () Bool)

(assert (=> b!819031 (= e!454764 (not e!454763))))

(declare-fun res!558923 () Bool)

(assert (=> b!819031 (=> res!558923 e!454763)))

(assert (=> b!819031 (= res!558923 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!819031 (= lt!367316 lt!367318)))

(declare-fun lt!367320 () Unit!27959)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!384 (array!45286 array!45288 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 V!24395 V!24395 (_ BitVec 32) Int) Unit!27959)

(assert (=> b!819031 (= lt!367320 (lemmaNoChangeToArrayThenSameMapNoExtras!384 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2274 (array!45286 array!45288 (_ BitVec 32) (_ BitVec 32) V!24395 V!24395 (_ BitVec 32) Int) ListLongMap!8449)

(assert (=> b!819031 (= lt!367318 (getCurrentListMapNoExtraKeys!2274 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819031 (= lt!367316 (getCurrentListMapNoExtraKeys!2274 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819032 () Bool)

(declare-fun e!454765 () Bool)

(declare-fun e!454760 () Bool)

(declare-fun mapRes!23416 () Bool)

(assert (=> b!819032 (= e!454765 (and e!454760 mapRes!23416))))

(declare-fun condMapEmpty!23416 () Bool)

(declare-fun mapDefault!23416 () ValueCell!6857)

