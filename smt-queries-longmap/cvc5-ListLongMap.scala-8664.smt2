; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105346 () Bool)

(assert start!105346)

(declare-fun b_free!27019 () Bool)

(declare-fun b_next!27019 () Bool)

(assert (=> start!105346 (= b_free!27019 (not b_next!27019))))

(declare-fun tp!94567 () Bool)

(declare-fun b_and!44857 () Bool)

(assert (=> start!105346 (= tp!94567 b_and!44857)))

(declare-fun b!1255183 () Bool)

(declare-fun e!713337 () Bool)

(declare-fun e!713335 () Bool)

(declare-fun mapRes!49663 () Bool)

(assert (=> b!1255183 (= e!713337 (and e!713335 mapRes!49663))))

(declare-fun condMapEmpty!49663 () Bool)

(declare-datatypes ((V!47927 0))(
  ( (V!47928 (val!16023 Int)) )
))
(declare-datatypes ((ValueCell!15197 0))(
  ( (ValueCellFull!15197 (v!18723 V!47927)) (EmptyCell!15197) )
))
(declare-datatypes ((array!81490 0))(
  ( (array!81491 (arr!39305 (Array (_ BitVec 32) ValueCell!15197)) (size!39841 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81490)

(declare-fun mapDefault!49663 () ValueCell!15197)

