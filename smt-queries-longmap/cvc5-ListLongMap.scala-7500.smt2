; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95042 () Bool)

(assert start!95042)

(declare-fun b_free!22177 () Bool)

(declare-fun b_next!22177 () Bool)

(assert (=> start!95042 (= b_free!22177 (not b_next!22177))))

(declare-fun tp!78008 () Bool)

(declare-fun b_and!35073 () Bool)

(assert (=> start!95042 (= tp!78008 b_and!35073)))

(declare-fun mapNonEmpty!40705 () Bool)

(declare-fun mapRes!40705 () Bool)

(declare-fun tp!78007 () Bool)

(declare-fun e!613945 () Bool)

(assert (=> mapNonEmpty!40705 (= mapRes!40705 (and tp!78007 e!613945))))

(declare-fun mapKey!40705 () (_ BitVec 32))

(declare-datatypes ((V!39785 0))(
  ( (V!39786 (val!13044 Int)) )
))
(declare-datatypes ((ValueCell!12290 0))(
  ( (ValueCellFull!12290 (v!15665 V!39785)) (EmptyCell!12290) )
))
(declare-fun mapRest!40705 () (Array (_ BitVec 32) ValueCell!12290))

(declare-datatypes ((array!68941 0))(
  ( (array!68942 (arr!33160 (Array (_ BitVec 32) ValueCell!12290)) (size!33696 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68941)

(declare-fun mapValue!40705 () ValueCell!12290)

(assert (=> mapNonEmpty!40705 (= (arr!33160 _values!955) (store mapRest!40705 mapKey!40705 mapValue!40705))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!39785)

(declare-fun b!1074441 () Bool)

(declare-datatypes ((tuple2!16616 0))(
  ( (tuple2!16617 (_1!8319 (_ BitVec 64)) (_2!8319 V!39785)) )
))
(declare-datatypes ((List!23152 0))(
  ( (Nil!23149) (Cons!23148 (h!24357 tuple2!16616) (t!32497 List!23152)) )
))
(declare-datatypes ((ListLongMap!14585 0))(
  ( (ListLongMap!14586 (toList!7308 List!23152)) )
))
(declare-fun lt!476657 () ListLongMap!14585)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!39785)

(declare-fun e!613943 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68943 0))(
  ( (array!68944 (arr!33161 (Array (_ BitVec 32) (_ BitVec 64))) (size!33697 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68943)

(declare-fun getCurrentListMap!4178 (array!68943 array!68941 (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 (_ BitVec 32) Int) ListLongMap!14585)

(declare-fun +!3217 (ListLongMap!14585 tuple2!16616) ListLongMap!14585)

(assert (=> b!1074441 (= e!613943 (= (getCurrentListMap!4178 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) (+!3217 lt!476657 (tuple2!16617 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))))

(declare-fun b!1074442 () Bool)

(declare-fun e!613940 () Bool)

(declare-fun e!613941 () Bool)

(assert (=> b!1074442 (= e!613940 (not e!613941))))

(declare-fun res!716432 () Bool)

(assert (=> b!1074442 (=> res!716432 e!613941)))

(assert (=> b!1074442 (= res!716432 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!613946 () Bool)

(assert (=> b!1074442 e!613946))

(declare-fun res!716427 () Bool)

(assert (=> b!1074442 (=> (not res!716427) (not e!613946))))

(declare-fun lt!476658 () ListLongMap!14585)

(assert (=> b!1074442 (= res!716427 (= lt!476657 lt!476658))))

(declare-datatypes ((Unit!35379 0))(
  ( (Unit!35380) )
))
(declare-fun lt!476659 () Unit!35379)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun zeroValueAfter!47 () V!39785)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!887 (array!68943 array!68941 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 V!39785 V!39785 (_ BitVec 32) Int) Unit!35379)

(assert (=> b!1074442 (= lt!476659 (lemmaNoChangeToArrayThenSameMapNoExtras!887 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3871 (array!68943 array!68941 (_ BitVec 32) (_ BitVec 32) V!39785 V!39785 (_ BitVec 32) Int) ListLongMap!14585)

(assert (=> b!1074442 (= lt!476658 (getCurrentListMapNoExtraKeys!3871 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1074442 (= lt!476657 (getCurrentListMapNoExtraKeys!3871 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1074443 () Bool)

(declare-fun e!613939 () Bool)

(declare-fun tp_is_empty!25987 () Bool)

(assert (=> b!1074443 (= e!613939 tp_is_empty!25987)))

(declare-fun b!1074444 () Bool)

(declare-fun res!716426 () Bool)

(assert (=> b!1074444 (=> (not res!716426) (not e!613940))))

(declare-datatypes ((List!23153 0))(
  ( (Nil!23150) (Cons!23149 (h!24358 (_ BitVec 64)) (t!32498 List!23153)) )
))
(declare-fun arrayNoDuplicates!0 (array!68943 (_ BitVec 32) List!23153) Bool)

(assert (=> b!1074444 (= res!716426 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23150))))

(declare-fun res!716431 () Bool)

(assert (=> start!95042 (=> (not res!716431) (not e!613940))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95042 (= res!716431 (validMask!0 mask!1515))))

(assert (=> start!95042 e!613940))

(assert (=> start!95042 true))

(assert (=> start!95042 tp_is_empty!25987))

(declare-fun e!613942 () Bool)

(declare-fun array_inv!25628 (array!68941) Bool)

(assert (=> start!95042 (and (array_inv!25628 _values!955) e!613942)))

(assert (=> start!95042 tp!78008))

(declare-fun array_inv!25629 (array!68943) Bool)

(assert (=> start!95042 (array_inv!25629 _keys!1163)))

(declare-fun b!1074445 () Bool)

(assert (=> b!1074445 (= e!613941 (= (getCurrentListMap!4178 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963) lt!476658))))

(declare-fun b!1074446 () Bool)

(assert (=> b!1074446 (= e!613942 (and e!613939 mapRes!40705))))

(declare-fun condMapEmpty!40705 () Bool)

(declare-fun mapDefault!40705 () ValueCell!12290)

