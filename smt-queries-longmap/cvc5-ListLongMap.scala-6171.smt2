; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79134 () Bool)

(assert start!79134)

(declare-fun b_free!17347 () Bool)

(declare-fun b_next!17347 () Bool)

(assert (=> start!79134 (= b_free!17347 (not b_next!17347))))

(declare-fun tp!60482 () Bool)

(declare-fun b_and!28413 () Bool)

(assert (=> start!79134 (= tp!60482 b_and!28413)))

(declare-fun b!928836 () Bool)

(declare-fun e!521549 () Bool)

(assert (=> b!928836 (= e!521549 false)))

(declare-datatypes ((V!31439 0))(
  ( (V!31440 (val!9978 Int)) )
))
(declare-fun lt!418947 () V!31439)

(declare-datatypes ((tuple2!13038 0))(
  ( (tuple2!13039 (_1!6530 (_ BitVec 64)) (_2!6530 V!31439)) )
))
(declare-datatypes ((List!18836 0))(
  ( (Nil!18833) (Cons!18832 (h!19978 tuple2!13038) (t!26893 List!18836)) )
))
(declare-datatypes ((ListLongMap!11735 0))(
  ( (ListLongMap!11736 (toList!5883 List!18836)) )
))
(declare-fun lt!418948 () ListLongMap!11735)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!712 (ListLongMap!11735 (_ BitVec 64)) V!31439)

(assert (=> b!928836 (= lt!418947 (apply!712 lt!418948 k!1099))))

(declare-fun b!928837 () Bool)

(declare-fun res!625473 () Bool)

(declare-fun e!521551 () Bool)

(assert (=> b!928837 (=> (not res!625473) (not e!521551))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55664 0))(
  ( (array!55665 (arr!26777 (Array (_ BitVec 32) (_ BitVec 64))) (size!27236 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55664)

(assert (=> b!928837 (= res!625473 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27236 _keys!1487))))))

(declare-fun b!928839 () Bool)

(declare-fun e!521548 () Bool)

(declare-fun e!521550 () Bool)

(declare-fun mapRes!31539 () Bool)

(assert (=> b!928839 (= e!521548 (and e!521550 mapRes!31539))))

(declare-fun condMapEmpty!31539 () Bool)

(declare-datatypes ((ValueCell!9446 0))(
  ( (ValueCellFull!9446 (v!12496 V!31439)) (EmptyCell!9446) )
))
(declare-datatypes ((array!55666 0))(
  ( (array!55667 (arr!26778 (Array (_ BitVec 32) ValueCell!9446)) (size!27237 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55666)

(declare-fun mapDefault!31539 () ValueCell!9446)

