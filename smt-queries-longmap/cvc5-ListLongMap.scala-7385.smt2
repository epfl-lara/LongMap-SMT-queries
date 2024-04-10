; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94072 () Bool)

(assert start!94072)

(declare-fun b_free!21487 () Bool)

(declare-fun b_next!21487 () Bool)

(assert (=> start!94072 (= b_free!21487 (not b_next!21487))))

(declare-fun tp!75892 () Bool)

(declare-fun b_and!34229 () Bool)

(assert (=> start!94072 (= tp!75892 b_and!34229)))

(declare-fun mapIsEmpty!39625 () Bool)

(declare-fun mapRes!39625 () Bool)

(assert (=> mapIsEmpty!39625 mapRes!39625))

(declare-fun res!710302 () Bool)

(declare-fun e!606276 () Bool)

(assert (=> start!94072 (=> (not res!710302) (not e!606276))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94072 (= res!710302 (validMask!0 mask!1515))))

(assert (=> start!94072 e!606276))

(assert (=> start!94072 true))

(declare-fun tp_is_empty!25297 () Bool)

(assert (=> start!94072 tp_is_empty!25297))

(declare-datatypes ((V!38865 0))(
  ( (V!38866 (val!12699 Int)) )
))
(declare-datatypes ((ValueCell!11945 0))(
  ( (ValueCellFull!11945 (v!15311 V!38865)) (EmptyCell!11945) )
))
(declare-datatypes ((array!67593 0))(
  ( (array!67594 (arr!32501 (Array (_ BitVec 32) ValueCell!11945)) (size!33037 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67593)

(declare-fun e!606275 () Bool)

(declare-fun array_inv!25172 (array!67593) Bool)

(assert (=> start!94072 (and (array_inv!25172 _values!955) e!606275)))

(assert (=> start!94072 tp!75892))

(declare-datatypes ((array!67595 0))(
  ( (array!67596 (arr!32502 (Array (_ BitVec 32) (_ BitVec 64))) (size!33038 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67595)

(declare-fun array_inv!25173 (array!67595) Bool)

(assert (=> start!94072 (array_inv!25173 _keys!1163)))

(declare-fun b!1063907 () Bool)

(declare-fun res!710300 () Bool)

(assert (=> b!1063907 (=> (not res!710300) (not e!606276))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063907 (= res!710300 (and (= (size!33037 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33038 _keys!1163) (size!33037 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063908 () Bool)

(declare-fun res!710301 () Bool)

(assert (=> b!1063908 (=> (not res!710301) (not e!606276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67595 (_ BitVec 32)) Bool)

(assert (=> b!1063908 (= res!710301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063909 () Bool)

(assert (=> b!1063909 (= e!606276 (not true))))

(declare-datatypes ((tuple2!16080 0))(
  ( (tuple2!16081 (_1!8051 (_ BitVec 64)) (_2!8051 V!38865)) )
))
(declare-datatypes ((List!22657 0))(
  ( (Nil!22654) (Cons!22653 (h!23862 tuple2!16080) (t!31972 List!22657)) )
))
(declare-datatypes ((ListLongMap!14049 0))(
  ( (ListLongMap!14050 (toList!7040 List!22657)) )
))
(declare-fun lt!468962 () ListLongMap!14049)

(declare-fun lt!468964 () ListLongMap!14049)

(assert (=> b!1063909 (= lt!468962 lt!468964)))

(declare-fun zeroValueBefore!47 () V!38865)

(declare-datatypes ((Unit!34880 0))(
  ( (Unit!34881) )
))
(declare-fun lt!468963 () Unit!34880)

(declare-fun minValue!907 () V!38865)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38865)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!669 (array!67595 array!67593 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38865 V!38865 V!38865 V!38865 (_ BitVec 32) Int) Unit!34880)

(assert (=> b!1063909 (= lt!468963 (lemmaNoChangeToArrayThenSameMapNoExtras!669 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3632 (array!67595 array!67593 (_ BitVec 32) (_ BitVec 32) V!38865 V!38865 (_ BitVec 32) Int) ListLongMap!14049)

(assert (=> b!1063909 (= lt!468964 (getCurrentListMapNoExtraKeys!3632 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063909 (= lt!468962 (getCurrentListMapNoExtraKeys!3632 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063910 () Bool)

(declare-fun e!606274 () Bool)

(assert (=> b!1063910 (= e!606274 tp_is_empty!25297)))

(declare-fun b!1063911 () Bool)

(assert (=> b!1063911 (= e!606275 (and e!606274 mapRes!39625))))

(declare-fun condMapEmpty!39625 () Bool)

(declare-fun mapDefault!39625 () ValueCell!11945)

