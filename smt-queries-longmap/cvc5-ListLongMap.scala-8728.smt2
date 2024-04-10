; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105862 () Bool)

(assert start!105862)

(declare-fun b_free!27403 () Bool)

(declare-fun b_next!27403 () Bool)

(assert (=> start!105862 (= b_free!27403 (not b_next!27403))))

(declare-fun tp!95741 () Bool)

(declare-fun b_and!45311 () Bool)

(assert (=> start!105862 (= tp!95741 b_and!45311)))

(declare-fun b!1260979 () Bool)

(declare-fun e!717617 () Bool)

(declare-fun tp_is_empty!32305 () Bool)

(assert (=> b!1260979 (= e!717617 tp_is_empty!32305)))

(declare-fun b!1260980 () Bool)

(declare-fun e!717620 () Bool)

(declare-fun e!717618 () Bool)

(declare-fun mapRes!50260 () Bool)

(assert (=> b!1260980 (= e!717620 (and e!717618 mapRes!50260))))

(declare-fun condMapEmpty!50260 () Bool)

(declare-datatypes ((V!48439 0))(
  ( (V!48440 (val!16215 Int)) )
))
(declare-datatypes ((ValueCell!15389 0))(
  ( (ValueCellFull!15389 (v!18919 V!48439)) (EmptyCell!15389) )
))
(declare-datatypes ((array!82226 0))(
  ( (array!82227 (arr!39666 (Array (_ BitVec 32) ValueCell!15389)) (size!40202 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82226)

(declare-fun mapDefault!50260 () ValueCell!15389)

