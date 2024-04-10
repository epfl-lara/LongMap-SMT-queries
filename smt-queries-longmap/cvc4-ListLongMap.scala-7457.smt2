; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94654 () Bool)

(assert start!94654)

(declare-fun b_free!21923 () Bool)

(declare-fun b_next!21923 () Bool)

(assert (=> start!94654 (= b_free!21923 (not b_next!21923))))

(declare-fun tp!77224 () Bool)

(declare-fun b_and!34743 () Bool)

(assert (=> start!94654 (= tp!77224 b_and!34743)))

(declare-fun b!1070181 () Bool)

(declare-fun res!713965 () Bool)

(declare-fun e!610852 () Bool)

(assert (=> b!1070181 (=> (not res!713965) (not e!610852))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39445 0))(
  ( (V!39446 (val!12917 Int)) )
))
(declare-datatypes ((ValueCell!12163 0))(
  ( (ValueCellFull!12163 (v!15533 V!39445)) (EmptyCell!12163) )
))
(declare-datatypes ((array!68443 0))(
  ( (array!68444 (arr!32918 (Array (_ BitVec 32) ValueCell!12163)) (size!33454 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68443)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68445 0))(
  ( (array!68446 (arr!32919 (Array (_ BitVec 32) (_ BitVec 64))) (size!33455 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68445)

(assert (=> b!1070181 (= res!713965 (and (= (size!33454 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33455 _keys!1163) (size!33454 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1070182 () Bool)

(declare-fun res!713964 () Bool)

(assert (=> b!1070182 (=> (not res!713964) (not e!610852))))

(declare-datatypes ((List!22966 0))(
  ( (Nil!22963) (Cons!22962 (h!24171 (_ BitVec 64)) (t!32297 List!22966)) )
))
(declare-fun arrayNoDuplicates!0 (array!68445 (_ BitVec 32) List!22966) Bool)

(assert (=> b!1070182 (= res!713964 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22963))))

(declare-fun b!1070183 () Bool)

(declare-fun e!610851 () Bool)

(declare-fun e!610854 () Bool)

(declare-fun mapRes!40303 () Bool)

(assert (=> b!1070183 (= e!610851 (and e!610854 mapRes!40303))))

(declare-fun condMapEmpty!40303 () Bool)

(declare-fun mapDefault!40303 () ValueCell!12163)

