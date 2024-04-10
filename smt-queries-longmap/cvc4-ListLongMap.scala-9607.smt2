; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113566 () Bool)

(assert start!113566)

(declare-fun b_free!31559 () Bool)

(declare-fun b_next!31559 () Bool)

(assert (=> start!113566 (= b_free!31559 (not b_next!31559))))

(declare-fun tp!110485 () Bool)

(declare-fun b_and!50907 () Bool)

(assert (=> start!113566 (= tp!110485 b_and!50907)))

(declare-fun b!1348263 () Bool)

(declare-fun e!766994 () Bool)

(declare-fun e!766996 () Bool)

(declare-fun mapRes!58049 () Bool)

(assert (=> b!1348263 (= e!766994 (and e!766996 mapRes!58049))))

(declare-fun condMapEmpty!58049 () Bool)

(declare-datatypes ((V!55181 0))(
  ( (V!55182 (val!18854 Int)) )
))
(declare-datatypes ((ValueCell!17881 0))(
  ( (ValueCellFull!17881 (v!21505 V!55181)) (EmptyCell!17881) )
))
(declare-datatypes ((array!91946 0))(
  ( (array!91947 (arr!44428 (Array (_ BitVec 32) ValueCell!17881)) (size!44978 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91946)

(declare-fun mapDefault!58049 () ValueCell!17881)

