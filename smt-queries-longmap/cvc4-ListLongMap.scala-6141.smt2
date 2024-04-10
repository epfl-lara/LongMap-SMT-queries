; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78958 () Bool)

(assert start!78958)

(declare-fun b_free!17171 () Bool)

(declare-fun b_next!17171 () Bool)

(assert (=> start!78958 (= b_free!17171 (not b_next!17171))))

(declare-fun tp!59953 () Bool)

(declare-fun b_and!28079 () Bool)

(assert (=> start!78958 (= tp!59953 b_and!28079)))

(declare-fun b!923845 () Bool)

(declare-fun e!518382 () Bool)

(declare-fun e!518389 () Bool)

(declare-fun mapRes!31275 () Bool)

(assert (=> b!923845 (= e!518382 (and e!518389 mapRes!31275))))

(declare-fun condMapEmpty!31275 () Bool)

(declare-datatypes ((V!31203 0))(
  ( (V!31204 (val!9890 Int)) )
))
(declare-datatypes ((ValueCell!9358 0))(
  ( (ValueCellFull!9358 (v!12408 V!31203)) (EmptyCell!9358) )
))
(declare-datatypes ((array!55332 0))(
  ( (array!55333 (arr!26611 (Array (_ BitVec 32) ValueCell!9358)) (size!27070 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55332)

(declare-fun mapDefault!31275 () ValueCell!9358)

