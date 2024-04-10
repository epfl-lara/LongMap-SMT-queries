; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94528 () Bool)

(assert start!94528)

(declare-fun b_free!21833 () Bool)

(declare-fun b_next!21833 () Bool)

(assert (=> start!94528 (= b_free!21833 (not b_next!21833))))

(declare-fun tp!76949 () Bool)

(declare-fun b_and!34635 () Bool)

(assert (=> start!94528 (= tp!76949 b_and!34635)))

(declare-fun b!1068903 () Bool)

(declare-fun res!713240 () Bool)

(declare-fun e!609932 () Bool)

(assert (=> b!1068903 (=> (not res!713240) (not e!609932))))

(declare-datatypes ((array!68263 0))(
  ( (array!68264 (arr!32830 (Array (_ BitVec 32) (_ BitVec 64))) (size!33366 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68263)

(declare-datatypes ((List!22903 0))(
  ( (Nil!22900) (Cons!22899 (h!24108 (_ BitVec 64)) (t!32230 List!22903)) )
))
(declare-fun arrayNoDuplicates!0 (array!68263 (_ BitVec 32) List!22903) Bool)

(assert (=> b!1068903 (= res!713240 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22900))))

(declare-fun b!1068904 () Bool)

(declare-fun res!713241 () Bool)

(assert (=> b!1068904 (=> (not res!713241) (not e!609932))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39325 0))(
  ( (V!39326 (val!12872 Int)) )
))
(declare-datatypes ((ValueCell!12118 0))(
  ( (ValueCellFull!12118 (v!15487 V!39325)) (EmptyCell!12118) )
))
(declare-datatypes ((array!68265 0))(
  ( (array!68266 (arr!32831 (Array (_ BitVec 32) ValueCell!12118)) (size!33367 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68265)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1068904 (= res!713241 (and (= (size!33367 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33366 _keys!1163) (size!33367 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1068905 () Bool)

(declare-fun e!609929 () Bool)

(declare-fun e!609931 () Bool)

(declare-fun mapRes!40162 () Bool)

(assert (=> b!1068905 (= e!609929 (and e!609931 mapRes!40162))))

(declare-fun condMapEmpty!40162 () Bool)

(declare-fun mapDefault!40162 () ValueCell!12118)

