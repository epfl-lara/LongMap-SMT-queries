; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79210 () Bool)

(assert start!79210)

(declare-fun b_free!17423 () Bool)

(declare-fun b_next!17423 () Bool)

(assert (=> start!79210 (= b_free!17423 (not b_next!17423))))

(declare-fun tp!60710 () Bool)

(declare-fun b_and!28489 () Bool)

(assert (=> start!79210 (= tp!60710 b_and!28489)))

(declare-fun b!929995 () Bool)

(declare-fun e!522231 () Bool)

(declare-fun e!522234 () Bool)

(declare-fun mapRes!31653 () Bool)

(assert (=> b!929995 (= e!522231 (and e!522234 mapRes!31653))))

(declare-fun condMapEmpty!31653 () Bool)

(declare-datatypes ((V!31539 0))(
  ( (V!31540 (val!10016 Int)) )
))
(declare-datatypes ((ValueCell!9484 0))(
  ( (ValueCellFull!9484 (v!12534 V!31539)) (EmptyCell!9484) )
))
(declare-datatypes ((array!55812 0))(
  ( (array!55813 (arr!26851 (Array (_ BitVec 32) ValueCell!9484)) (size!27310 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55812)

(declare-fun mapDefault!31653 () ValueCell!9484)

