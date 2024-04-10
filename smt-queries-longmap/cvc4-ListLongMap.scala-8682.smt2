; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105494 () Bool)

(assert start!105494)

(declare-fun b_free!27131 () Bool)

(declare-fun b_next!27131 () Bool)

(assert (=> start!105494 (= b_free!27131 (not b_next!27131))))

(declare-fun tp!94909 () Bool)

(declare-fun b_and!44987 () Bool)

(assert (=> start!105494 (= tp!94909 b_and!44987)))

(declare-fun b!1256842 () Bool)

(declare-fun res!837842 () Bool)

(declare-fun e!714573 () Bool)

(assert (=> b!1256842 (=> (not res!837842) (not e!714573))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81704 0))(
  ( (array!81705 (arr!39410 (Array (_ BitVec 32) (_ BitVec 64))) (size!39946 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81704)

(declare-datatypes ((V!48075 0))(
  ( (V!48076 (val!16079 Int)) )
))
(declare-datatypes ((ValueCell!15253 0))(
  ( (ValueCellFull!15253 (v!18780 V!48075)) (EmptyCell!15253) )
))
(declare-datatypes ((array!81706 0))(
  ( (array!81707 (arr!39411 (Array (_ BitVec 32) ValueCell!15253)) (size!39947 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81706)

(assert (=> b!1256842 (= res!837842 (and (= (size!39947 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39946 _keys!1118) (size!39947 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1256843 () Bool)

(declare-fun e!714574 () Bool)

(declare-fun e!714576 () Bool)

(declare-fun mapRes!49837 () Bool)

(assert (=> b!1256843 (= e!714574 (and e!714576 mapRes!49837))))

(declare-fun condMapEmpty!49837 () Bool)

(declare-fun mapDefault!49837 () ValueCell!15253)

