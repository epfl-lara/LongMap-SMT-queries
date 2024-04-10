; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79056 () Bool)

(assert start!79056)

(declare-fun b_free!17269 () Bool)

(declare-fun b_next!17269 () Bool)

(assert (=> start!79056 (= b_free!17269 (not b_next!17269))))

(declare-fun tp!60247 () Bool)

(declare-fun b_and!28275 () Bool)

(assert (=> start!79056 (= tp!60247 b_and!28275)))

(declare-fun b!926755 () Bool)

(declare-fun e!520235 () Bool)

(declare-fun e!520234 () Bool)

(declare-fun mapRes!31422 () Bool)

(assert (=> b!926755 (= e!520235 (and e!520234 mapRes!31422))))

(declare-fun condMapEmpty!31422 () Bool)

(declare-datatypes ((V!31335 0))(
  ( (V!31336 (val!9939 Int)) )
))
(declare-datatypes ((ValueCell!9407 0))(
  ( (ValueCellFull!9407 (v!12457 V!31335)) (EmptyCell!9407) )
))
(declare-datatypes ((array!55518 0))(
  ( (array!55519 (arr!26704 (Array (_ BitVec 32) ValueCell!9407)) (size!27163 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55518)

(declare-fun mapDefault!31422 () ValueCell!9407)

