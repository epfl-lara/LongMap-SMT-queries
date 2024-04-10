; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99806 () Bool)

(assert start!99806)

(declare-fun b_free!25385 () Bool)

(declare-fun b_next!25385 () Bool)

(assert (=> start!99806 (= b_free!25385 (not b_next!25385))))

(declare-fun tp!88869 () Bool)

(declare-fun b_and!41637 () Bool)

(assert (=> start!99806 (= tp!88869 b_and!41637)))

(declare-fun mapIsEmpty!46700 () Bool)

(declare-fun mapRes!46700 () Bool)

(assert (=> mapIsEmpty!46700 mapRes!46700))

(declare-fun b!1186221 () Bool)

(declare-fun e!674459 () Bool)

(declare-fun e!674469 () Bool)

(assert (=> b!1186221 (= e!674459 (and e!674469 mapRes!46700))))

(declare-fun condMapEmpty!46700 () Bool)

(declare-datatypes ((V!45013 0))(
  ( (V!45014 (val!15014 Int)) )
))
(declare-datatypes ((ValueCell!14248 0))(
  ( (ValueCellFull!14248 (v!17652 V!45013)) (EmptyCell!14248) )
))
(declare-datatypes ((array!76627 0))(
  ( (array!76628 (arr!36963 (Array (_ BitVec 32) ValueCell!14248)) (size!37499 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76627)

(declare-fun mapDefault!46700 () ValueCell!14248)

