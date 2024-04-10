; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94714 () Bool)

(assert start!94714)

(declare-fun b_free!21967 () Bool)

(declare-fun b_next!21967 () Bool)

(assert (=> start!94714 (= b_free!21967 (not b_next!21967))))

(declare-fun tp!77359 () Bool)

(declare-fun b_and!34797 () Bool)

(assert (=> start!94714 (= tp!77359 b_and!34797)))

(declare-fun b!1070859 () Bool)

(declare-fun e!611347 () Bool)

(declare-fun tp_is_empty!25777 () Bool)

(assert (=> b!1070859 (= e!611347 tp_is_empty!25777)))

(declare-fun b!1070860 () Bool)

(declare-fun res!714357 () Bool)

(declare-fun e!611345 () Bool)

(assert (=> b!1070860 (=> (not res!714357) (not e!611345))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39505 0))(
  ( (V!39506 (val!12939 Int)) )
))
(declare-datatypes ((ValueCell!12185 0))(
  ( (ValueCellFull!12185 (v!15555 V!39505)) (EmptyCell!12185) )
))
(declare-datatypes ((array!68531 0))(
  ( (array!68532 (arr!32961 (Array (_ BitVec 32) ValueCell!12185)) (size!33497 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68531)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68533 0))(
  ( (array!68534 (arr!32962 (Array (_ BitVec 32) (_ BitVec 64))) (size!33498 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68533)

(assert (=> b!1070860 (= res!714357 (and (= (size!33497 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33498 _keys!1163) (size!33497 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070861 () Bool)

(declare-fun e!611343 () Bool)

(declare-fun e!611342 () Bool)

(declare-fun mapRes!40372 () Bool)

(assert (=> b!1070861 (= e!611343 (and e!611342 mapRes!40372))))

(declare-fun condMapEmpty!40372 () Bool)

(declare-fun mapDefault!40372 () ValueCell!12185)

