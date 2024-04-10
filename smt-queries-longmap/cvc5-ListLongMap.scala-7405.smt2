; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94222 () Bool)

(assert start!94222)

(declare-fun b_free!21607 () Bool)

(declare-fun b_next!21607 () Bool)

(assert (=> start!94222 (= b_free!21607 (not b_next!21607))))

(declare-fun tp!76258 () Bool)

(declare-fun b_and!34367 () Bool)

(assert (=> start!94222 (= tp!76258 b_and!34367)))

(declare-fun b!1065537 () Bool)

(declare-fun e!607462 () Bool)

(assert (=> b!1065537 (= e!607462 true)))

(declare-datatypes ((V!39025 0))(
  ( (V!39026 (val!12759 Int)) )
))
(declare-datatypes ((tuple2!16172 0))(
  ( (tuple2!16173 (_1!8097 (_ BitVec 64)) (_2!8097 V!39025)) )
))
(declare-datatypes ((List!22739 0))(
  ( (Nil!22736) (Cons!22735 (h!23944 tuple2!16172) (t!32058 List!22739)) )
))
(declare-datatypes ((ListLongMap!14141 0))(
  ( (ListLongMap!14142 (toList!7086 List!22739)) )
))
(declare-fun lt!469949 () ListLongMap!14141)

(declare-fun lt!469952 () ListLongMap!14141)

(declare-fun -!601 (ListLongMap!14141 (_ BitVec 64)) ListLongMap!14141)

(assert (=> b!1065537 (= lt!469949 (-!601 lt!469952 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469950 () ListLongMap!14141)

(declare-fun lt!469951 () ListLongMap!14141)

(assert (=> b!1065537 (= (-!601 lt!469950 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469951)))

(declare-datatypes ((Unit!34965 0))(
  ( (Unit!34966) )
))
(declare-fun lt!469947 () Unit!34965)

(declare-fun zeroValueBefore!47 () V!39025)

(declare-fun addThenRemoveForNewKeyIsSame!10 (ListLongMap!14141 (_ BitVec 64) V!39025) Unit!34965)

(assert (=> b!1065537 (= lt!469947 (addThenRemoveForNewKeyIsSame!10 lt!469951 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469946 () ListLongMap!14141)

(declare-fun lt!469948 () ListLongMap!14141)

(assert (=> b!1065537 (and (= lt!469952 lt!469950) (= lt!469946 lt!469948))))

(declare-fun +!3132 (ListLongMap!14141 tuple2!16172) ListLongMap!14141)

(assert (=> b!1065537 (= lt!469950 (+!3132 lt!469951 (tuple2!16173 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12005 0))(
  ( (ValueCellFull!12005 (v!15371 V!39025)) (EmptyCell!12005) )
))
(declare-datatypes ((array!67821 0))(
  ( (array!67822 (arr!32613 (Array (_ BitVec 32) ValueCell!12005)) (size!33149 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67821)

(declare-fun minValue!907 () V!39025)

(declare-datatypes ((array!67823 0))(
  ( (array!67824 (arr!32614 (Array (_ BitVec 32) (_ BitVec 64))) (size!33150 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67823)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39025)

(declare-fun getCurrentListMap!4045 (array!67823 array!67821 (_ BitVec 32) (_ BitVec 32) V!39025 V!39025 (_ BitVec 32) Int) ListLongMap!14141)

(assert (=> b!1065537 (= lt!469946 (getCurrentListMap!4045 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065537 (= lt!469952 (getCurrentListMap!4045 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065538 () Bool)

(declare-fun e!607463 () Bool)

(declare-fun tp_is_empty!25417 () Bool)

(assert (=> b!1065538 (= e!607463 tp_is_empty!25417)))

(declare-fun b!1065539 () Bool)

(declare-fun res!711245 () Bool)

(declare-fun e!607461 () Bool)

(assert (=> b!1065539 (=> (not res!711245) (not e!607461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67823 (_ BitVec 32)) Bool)

(assert (=> b!1065539 (= res!711245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1065540 () Bool)

(declare-fun e!607460 () Bool)

(declare-fun mapRes!39811 () Bool)

(assert (=> b!1065540 (= e!607460 (and e!607463 mapRes!39811))))

(declare-fun condMapEmpty!39811 () Bool)

(declare-fun mapDefault!39811 () ValueCell!12005)

