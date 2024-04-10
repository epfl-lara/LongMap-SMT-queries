; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105572 () Bool)

(assert start!105572)

(declare-fun b_free!27187 () Bool)

(declare-fun b_next!27187 () Bool)

(assert (=> start!105572 (= b_free!27187 (not b_next!27187))))

(declare-fun tp!95080 () Bool)

(declare-fun b_and!45053 () Bool)

(assert (=> start!105572 (= tp!95080 b_and!45053)))

(declare-fun res!838331 () Bool)

(declare-fun e!715185 () Bool)

(assert (=> start!105572 (=> (not res!838331) (not e!715185))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105572 (= res!838331 (validMask!0 mask!1466))))

(assert (=> start!105572 e!715185))

(assert (=> start!105572 true))

(assert (=> start!105572 tp!95080))

(declare-fun tp_is_empty!32089 () Bool)

(assert (=> start!105572 tp_is_empty!32089))

(declare-datatypes ((array!81810 0))(
  ( (array!81811 (arr!39462 (Array (_ BitVec 32) (_ BitVec 64))) (size!39998 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81810)

(declare-fun array_inv!30057 (array!81810) Bool)

(assert (=> start!105572 (array_inv!30057 _keys!1118)))

(declare-datatypes ((V!48151 0))(
  ( (V!48152 (val!16107 Int)) )
))
(declare-datatypes ((ValueCell!15281 0))(
  ( (ValueCellFull!15281 (v!18809 V!48151)) (EmptyCell!15281) )
))
(declare-datatypes ((array!81812 0))(
  ( (array!81813 (arr!39463 (Array (_ BitVec 32) ValueCell!15281)) (size!39999 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81812)

(declare-fun e!715183 () Bool)

(declare-fun array_inv!30058 (array!81812) Bool)

(assert (=> start!105572 (and (array_inv!30058 _values!914) e!715183)))

(declare-fun b!1257679 () Bool)

(declare-fun res!838330 () Bool)

(assert (=> b!1257679 (=> (not res!838330) (not e!715185))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257679 (= res!838330 (and (= (size!39999 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39998 _keys!1118) (size!39999 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257680 () Bool)

(declare-fun e!715186 () Bool)

(declare-fun mapRes!49924 () Bool)

(assert (=> b!1257680 (= e!715183 (and e!715186 mapRes!49924))))

(declare-fun condMapEmpty!49924 () Bool)

(declare-fun mapDefault!49924 () ValueCell!15281)

