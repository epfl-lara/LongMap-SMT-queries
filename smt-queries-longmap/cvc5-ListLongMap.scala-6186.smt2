; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79224 () Bool)

(assert start!79224)

(declare-fun b_free!17437 () Bool)

(declare-fun b_next!17437 () Bool)

(assert (=> start!79224 (= b_free!17437 (not b_next!17437))))

(declare-fun tp!60751 () Bool)

(declare-fun b_and!28503 () Bool)

(assert (=> start!79224 (= tp!60751 b_and!28503)))

(declare-fun b!930235 () Bool)

(declare-fun e!522356 () Bool)

(declare-fun e!522359 () Bool)

(declare-fun mapRes!31674 () Bool)

(assert (=> b!930235 (= e!522356 (and e!522359 mapRes!31674))))

(declare-fun condMapEmpty!31674 () Bool)

(declare-datatypes ((V!31559 0))(
  ( (V!31560 (val!10023 Int)) )
))
(declare-datatypes ((ValueCell!9491 0))(
  ( (ValueCellFull!9491 (v!12541 V!31559)) (EmptyCell!9491) )
))
(declare-datatypes ((array!55838 0))(
  ( (array!55839 (arr!26864 (Array (_ BitVec 32) ValueCell!9491)) (size!27323 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55838)

(declare-fun mapDefault!31674 () ValueCell!9491)

