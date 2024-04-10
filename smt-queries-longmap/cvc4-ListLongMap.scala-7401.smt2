; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94202 () Bool)

(assert start!94202)

(declare-fun b_free!21587 () Bool)

(declare-fun b_next!21587 () Bool)

(assert (=> start!94202 (= b_free!21587 (not b_next!21587))))

(declare-fun tp!76198 () Bool)

(declare-fun b_and!34347 () Bool)

(assert (=> start!94202 (= tp!76198 b_and!34347)))

(declare-fun res!711096 () Bool)

(declare-fun e!607281 () Bool)

(assert (=> start!94202 (=> (not res!711096) (not e!607281))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94202 (= res!711096 (validMask!0 mask!1515))))

(assert (=> start!94202 e!607281))

(assert (=> start!94202 true))

(declare-fun tp_is_empty!25397 () Bool)

(assert (=> start!94202 tp_is_empty!25397))

(declare-datatypes ((V!38997 0))(
  ( (V!38998 (val!12749 Int)) )
))
(declare-datatypes ((ValueCell!11995 0))(
  ( (ValueCellFull!11995 (v!15361 V!38997)) (EmptyCell!11995) )
))
(declare-datatypes ((array!67781 0))(
  ( (array!67782 (arr!32593 (Array (_ BitVec 32) ValueCell!11995)) (size!33129 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67781)

(declare-fun e!607278 () Bool)

(declare-fun array_inv!25238 (array!67781) Bool)

(assert (=> start!94202 (and (array_inv!25238 _values!955) e!607278)))

(assert (=> start!94202 tp!76198))

(declare-datatypes ((array!67783 0))(
  ( (array!67784 (arr!32594 (Array (_ BitVec 32) (_ BitVec 64))) (size!33130 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67783)

(declare-fun array_inv!25239 (array!67783) Bool)

(assert (=> start!94202 (array_inv!25239 _keys!1163)))

(declare-fun b!1065297 () Bool)

(declare-fun res!711098 () Bool)

(assert (=> b!1065297 (=> (not res!711098) (not e!607281))))

(declare-datatypes ((List!22725 0))(
  ( (Nil!22722) (Cons!22721 (h!23930 (_ BitVec 64)) (t!32044 List!22725)) )
))
(declare-fun arrayNoDuplicates!0 (array!67783 (_ BitVec 32) List!22725) Bool)

(assert (=> b!1065297 (= res!711098 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22722))))

(declare-fun b!1065298 () Bool)

(declare-fun res!711097 () Bool)

(assert (=> b!1065298 (=> (not res!711097) (not e!607281))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065298 (= res!711097 (and (= (size!33129 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33130 _keys!1163) (size!33129 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1065299 () Bool)

(declare-fun e!607279 () Bool)

(declare-fun mapRes!39781 () Bool)

(assert (=> b!1065299 (= e!607278 (and e!607279 mapRes!39781))))

(declare-fun condMapEmpty!39781 () Bool)

(declare-fun mapDefault!39781 () ValueCell!11995)

