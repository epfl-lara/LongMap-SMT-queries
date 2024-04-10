; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79248 () Bool)

(assert start!79248)

(declare-fun b_free!17461 () Bool)

(declare-fun b_next!17461 () Bool)

(assert (=> start!79248 (= b_free!17461 (not b_next!17461))))

(declare-fun tp!60823 () Bool)

(declare-fun b_and!28527 () Bool)

(assert (=> start!79248 (= tp!60823 b_and!28527)))

(declare-fun b!930600 () Bool)

(declare-fun e!522573 () Bool)

(declare-fun e!522577 () Bool)

(declare-fun mapRes!31710 () Bool)

(assert (=> b!930600 (= e!522573 (and e!522577 mapRes!31710))))

(declare-fun condMapEmpty!31710 () Bool)

(declare-datatypes ((V!31591 0))(
  ( (V!31592 (val!10035 Int)) )
))
(declare-datatypes ((ValueCell!9503 0))(
  ( (ValueCellFull!9503 (v!12553 V!31591)) (EmptyCell!9503) )
))
(declare-datatypes ((array!55884 0))(
  ( (array!55885 (arr!26887 (Array (_ BitVec 32) ValueCell!9503)) (size!27346 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55884)

(declare-fun mapDefault!31710 () ValueCell!9503)

