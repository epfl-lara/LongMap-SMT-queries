; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100822 () Bool)

(assert start!100822)

(declare-fun b_free!25961 () Bool)

(declare-fun b_next!25961 () Bool)

(assert (=> start!100822 (= b_free!25961 (not b_next!25961))))

(declare-fun tp!90889 () Bool)

(declare-fun b_and!42923 () Bool)

(assert (=> start!100822 (= tp!90889 b_and!42923)))

(declare-fun b!1207065 () Bool)

(declare-fun e!685485 () Bool)

(declare-fun e!685487 () Bool)

(declare-fun mapRes!47856 () Bool)

(assert (=> b!1207065 (= e!685485 (and e!685487 mapRes!47856))))

(declare-fun condMapEmpty!47856 () Bool)

(declare-datatypes ((V!46013 0))(
  ( (V!46014 (val!15389 Int)) )
))
(declare-datatypes ((ValueCell!14623 0))(
  ( (ValueCellFull!14623 (v!18034 V!46013)) (EmptyCell!14623) )
))
(declare-datatypes ((array!78113 0))(
  ( (array!78114 (arr!37696 (Array (_ BitVec 32) ValueCell!14623)) (size!38232 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78113)

(declare-fun mapDefault!47856 () ValueCell!14623)

