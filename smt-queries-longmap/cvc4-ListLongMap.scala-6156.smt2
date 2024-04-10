; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79048 () Bool)

(assert start!79048)

(declare-fun b_free!17261 () Bool)

(declare-fun b_next!17261 () Bool)

(assert (=> start!79048 (= b_free!17261 (not b_next!17261))))

(declare-fun tp!60223 () Bool)

(declare-fun b_and!28259 () Bool)

(assert (=> start!79048 (= tp!60223 b_and!28259)))

(declare-fun b!926507 () Bool)

(declare-fun e!520081 () Bool)

(declare-fun e!520079 () Bool)

(declare-fun mapRes!31410 () Bool)

(assert (=> b!926507 (= e!520081 (and e!520079 mapRes!31410))))

(declare-fun condMapEmpty!31410 () Bool)

(declare-datatypes ((V!31323 0))(
  ( (V!31324 (val!9935 Int)) )
))
(declare-datatypes ((ValueCell!9403 0))(
  ( (ValueCellFull!9403 (v!12453 V!31323)) (EmptyCell!9403) )
))
(declare-datatypes ((array!55504 0))(
  ( (array!55505 (arr!26697 (Array (_ BitVec 32) ValueCell!9403)) (size!27156 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55504)

(declare-fun mapDefault!31410 () ValueCell!9403)

