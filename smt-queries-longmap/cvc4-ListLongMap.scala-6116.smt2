; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78808 () Bool)

(assert start!78808)

(declare-fun b_free!17021 () Bool)

(declare-fun b_next!17021 () Bool)

(assert (=> start!78808 (= b_free!17021 (not b_next!17021))))

(declare-fun tp!59503 () Bool)

(declare-fun b_and!27779 () Bool)

(assert (=> start!78808 (= tp!59503 b_and!27779)))

(declare-fun b!920010 () Bool)

(declare-fun e!516385 () Bool)

(declare-fun e!516384 () Bool)

(declare-fun mapRes!31050 () Bool)

(assert (=> b!920010 (= e!516385 (and e!516384 mapRes!31050))))

(declare-fun condMapEmpty!31050 () Bool)

(declare-datatypes ((V!31003 0))(
  ( (V!31004 (val!9815 Int)) )
))
(declare-datatypes ((ValueCell!9283 0))(
  ( (ValueCellFull!9283 (v!12333 V!31003)) (EmptyCell!9283) )
))
(declare-datatypes ((array!55040 0))(
  ( (array!55041 (arr!26465 (Array (_ BitVec 32) ValueCell!9283)) (size!26924 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55040)

(declare-fun mapDefault!31050 () ValueCell!9283)

