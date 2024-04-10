; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94594 () Bool)

(assert start!94594)

(declare-fun b_free!21877 () Bool)

(declare-fun b_next!21877 () Bool)

(assert (=> start!94594 (= b_free!21877 (not b_next!21877))))

(declare-fun tp!77083 () Bool)

(declare-fun b_and!34689 () Bool)

(assert (=> start!94594 (= tp!77083 b_and!34689)))

(declare-fun b!1069596 () Bool)

(declare-fun res!713642 () Bool)

(declare-fun e!610436 () Bool)

(assert (=> b!1069596 (=> (not res!713642) (not e!610436))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39385 0))(
  ( (V!39386 (val!12894 Int)) )
))
(declare-datatypes ((ValueCell!12140 0))(
  ( (ValueCellFull!12140 (v!15510 V!39385)) (EmptyCell!12140) )
))
(declare-datatypes ((array!68351 0))(
  ( (array!68352 (arr!32873 (Array (_ BitVec 32) ValueCell!12140)) (size!33409 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68351)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68353 0))(
  ( (array!68354 (arr!32874 (Array (_ BitVec 32) (_ BitVec 64))) (size!33410 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68353)

(assert (=> b!1069596 (= res!713642 (and (= (size!33409 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33410 _keys!1163) (size!33409 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1069597 () Bool)

(declare-fun e!610433 () Bool)

(declare-fun tp_is_empty!25687 () Bool)

(assert (=> b!1069597 (= e!610433 tp_is_empty!25687)))

(declare-fun b!1069598 () Bool)

(declare-fun res!713640 () Bool)

(assert (=> b!1069598 (=> (not res!713640) (not e!610436))))

(declare-datatypes ((List!22932 0))(
  ( (Nil!22929) (Cons!22928 (h!24137 (_ BitVec 64)) (t!32261 List!22932)) )
))
(declare-fun arrayNoDuplicates!0 (array!68353 (_ BitVec 32) List!22932) Bool)

(assert (=> b!1069598 (= res!713640 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22929))))

(declare-fun b!1069599 () Bool)

(declare-fun e!610437 () Bool)

(declare-fun mapRes!40231 () Bool)

(assert (=> b!1069599 (= e!610437 (and e!610433 mapRes!40231))))

(declare-fun condMapEmpty!40231 () Bool)

(declare-fun mapDefault!40231 () ValueCell!12140)

