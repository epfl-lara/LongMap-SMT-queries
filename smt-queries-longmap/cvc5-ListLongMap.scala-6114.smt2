; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78792 () Bool)

(assert start!78792)

(declare-fun b_free!17005 () Bool)

(declare-fun b_next!17005 () Bool)

(assert (=> start!78792 (= b_free!17005 (not b_next!17005))))

(declare-fun tp!59456 () Bool)

(declare-fun b_and!27747 () Bool)

(assert (=> start!78792 (= tp!59456 b_and!27747)))

(declare-fun b!919682 () Bool)

(declare-fun e!516215 () Bool)

(declare-fun e!516217 () Bool)

(declare-fun mapRes!31026 () Bool)

(assert (=> b!919682 (= e!516215 (and e!516217 mapRes!31026))))

(declare-fun condMapEmpty!31026 () Bool)

(declare-datatypes ((V!30983 0))(
  ( (V!30984 (val!9807 Int)) )
))
(declare-datatypes ((ValueCell!9275 0))(
  ( (ValueCellFull!9275 (v!12325 V!30983)) (EmptyCell!9275) )
))
(declare-datatypes ((array!55010 0))(
  ( (array!55011 (arr!26450 (Array (_ BitVec 32) ValueCell!9275)) (size!26909 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55010)

(declare-fun mapDefault!31026 () ValueCell!9275)

