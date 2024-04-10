; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105646 () Bool)

(assert start!105646)

(declare-fun b_free!27247 () Bool)

(declare-fun b_next!27247 () Bool)

(assert (=> start!105646 (= b_free!27247 (not b_next!27247))))

(declare-fun tp!95264 () Bool)

(declare-fun b_and!45121 () Bool)

(assert (=> start!105646 (= tp!95264 b_and!45121)))

(declare-fun b!1258441 () Bool)

(declare-fun res!838770 () Bool)

(declare-fun e!715734 () Bool)

(assert (=> b!1258441 (=> (not res!838770) (not e!715734))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81918 0))(
  ( (array!81919 (arr!39515 (Array (_ BitVec 32) (_ BitVec 64))) (size!40051 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81918)

(declare-datatypes ((V!48231 0))(
  ( (V!48232 (val!16137 Int)) )
))
(declare-datatypes ((ValueCell!15311 0))(
  ( (ValueCellFull!15311 (v!18839 V!48231)) (EmptyCell!15311) )
))
(declare-datatypes ((array!81920 0))(
  ( (array!81921 (arr!39516 (Array (_ BitVec 32) ValueCell!15311)) (size!40052 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81920)

(assert (=> b!1258441 (= res!838770 (and (= (size!40052 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40051 _keys!1118) (size!40052 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258442 () Bool)

(declare-fun e!715739 () Bool)

(declare-fun e!715738 () Bool)

(declare-fun mapRes!50017 () Bool)

(assert (=> b!1258442 (= e!715739 (and e!715738 mapRes!50017))))

(declare-fun condMapEmpty!50017 () Bool)

(declare-fun mapDefault!50017 () ValueCell!15311)

