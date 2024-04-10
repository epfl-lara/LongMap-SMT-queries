; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105074 () Bool)

(assert start!105074)

(declare-fun b_free!26821 () Bool)

(declare-fun b_next!26821 () Bool)

(assert (=> start!105074 (= b_free!26821 (not b_next!26821))))

(declare-fun tp!93961 () Bool)

(declare-fun b_and!44617 () Bool)

(assert (=> start!105074 (= tp!93961 b_and!44617)))

(declare-fun b!1252242 () Bool)

(declare-fun res!835137 () Bool)

(declare-fun e!711204 () Bool)

(assert (=> b!1252242 (=> (not res!835137) (not e!711204))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81106 0))(
  ( (array!81107 (arr!39117 (Array (_ BitVec 32) (_ BitVec 64))) (size!39653 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81106)

(declare-datatypes ((V!47663 0))(
  ( (V!47664 (val!15924 Int)) )
))
(declare-datatypes ((ValueCell!15098 0))(
  ( (ValueCellFull!15098 (v!18622 V!47663)) (EmptyCell!15098) )
))
(declare-datatypes ((array!81108 0))(
  ( (array!81109 (arr!39118 (Array (_ BitVec 32) ValueCell!15098)) (size!39654 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81108)

(assert (=> b!1252242 (= res!835137 (and (= (size!39654 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39653 _keys!1118) (size!39654 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1252243 () Bool)

(declare-fun e!711201 () Bool)

(declare-fun tp_is_empty!31723 () Bool)

(assert (=> b!1252243 (= e!711201 tp_is_empty!31723)))

(declare-fun b!1252244 () Bool)

(declare-fun e!711202 () Bool)

(declare-fun e!711205 () Bool)

(declare-fun mapRes!49354 () Bool)

(assert (=> b!1252244 (= e!711202 (and e!711205 mapRes!49354))))

(declare-fun condMapEmpty!49354 () Bool)

(declare-fun mapDefault!49354 () ValueCell!15098)

