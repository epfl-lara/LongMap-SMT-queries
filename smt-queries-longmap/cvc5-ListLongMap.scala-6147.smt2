; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78990 () Bool)

(assert start!78990)

(declare-fun b_free!17203 () Bool)

(declare-fun b_next!17203 () Bool)

(assert (=> start!78990 (= b_free!17203 (not b_next!17203))))

(declare-fun tp!60049 () Bool)

(declare-fun b_and!28143 () Bool)

(assert (=> start!78990 (= tp!60049 b_and!28143)))

(declare-fun b!924741 () Bool)

(declare-fun e!518959 () Bool)

(declare-fun e!518967 () Bool)

(declare-fun mapRes!31323 () Bool)

(assert (=> b!924741 (= e!518959 (and e!518967 mapRes!31323))))

(declare-fun condMapEmpty!31323 () Bool)

(declare-datatypes ((V!31247 0))(
  ( (V!31248 (val!9906 Int)) )
))
(declare-datatypes ((ValueCell!9374 0))(
  ( (ValueCellFull!9374 (v!12424 V!31247)) (EmptyCell!9374) )
))
(declare-datatypes ((array!55392 0))(
  ( (array!55393 (arr!26641 (Array (_ BitVec 32) ValueCell!9374)) (size!27100 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55392)

(declare-fun mapDefault!31323 () ValueCell!9374)

