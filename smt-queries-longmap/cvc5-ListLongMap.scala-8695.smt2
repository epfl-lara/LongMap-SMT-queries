; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105590 () Bool)

(assert start!105590)

(declare-fun b_free!27205 () Bool)

(declare-fun b_next!27205 () Bool)

(assert (=> start!105590 (= b_free!27205 (not b_next!27205))))

(declare-fun tp!95134 () Bool)

(declare-fun b_and!45071 () Bool)

(assert (=> start!105590 (= tp!95134 b_and!45071)))

(declare-fun b!1257868 () Bool)

(declare-fun e!715318 () Bool)

(declare-fun e!715319 () Bool)

(declare-fun mapRes!49951 () Bool)

(assert (=> b!1257868 (= e!715318 (and e!715319 mapRes!49951))))

(declare-fun condMapEmpty!49951 () Bool)

(declare-datatypes ((V!48175 0))(
  ( (V!48176 (val!16116 Int)) )
))
(declare-datatypes ((ValueCell!15290 0))(
  ( (ValueCellFull!15290 (v!18818 V!48175)) (EmptyCell!15290) )
))
(declare-datatypes ((array!81844 0))(
  ( (array!81845 (arr!39479 (Array (_ BitVec 32) ValueCell!15290)) (size!40015 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81844)

(declare-fun mapDefault!49951 () ValueCell!15290)

