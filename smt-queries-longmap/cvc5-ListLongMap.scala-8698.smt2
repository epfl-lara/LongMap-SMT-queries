; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105622 () Bool)

(assert start!105622)

(declare-fun b_free!27223 () Bool)

(declare-fun b_next!27223 () Bool)

(assert (=> start!105622 (= b_free!27223 (not b_next!27223))))

(declare-fun tp!95192 () Bool)

(declare-fun b_and!45097 () Bool)

(assert (=> start!105622 (= tp!95192 b_and!45097)))

(declare-fun b!1258153 () Bool)

(declare-fun e!715522 () Bool)

(declare-fun e!715518 () Bool)

(declare-fun mapRes!49981 () Bool)

(assert (=> b!1258153 (= e!715522 (and e!715518 mapRes!49981))))

(declare-fun condMapEmpty!49981 () Bool)

(declare-datatypes ((V!48199 0))(
  ( (V!48200 (val!16125 Int)) )
))
(declare-datatypes ((ValueCell!15299 0))(
  ( (ValueCellFull!15299 (v!18827 V!48199)) (EmptyCell!15299) )
))
(declare-datatypes ((array!81878 0))(
  ( (array!81879 (arr!39495 (Array (_ BitVec 32) ValueCell!15299)) (size!40031 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81878)

(declare-fun mapDefault!49981 () ValueCell!15299)

