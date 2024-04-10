; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78798 () Bool)

(assert start!78798)

(declare-fun b_free!17011 () Bool)

(declare-fun b_next!17011 () Bool)

(assert (=> start!78798 (= b_free!17011 (not b_next!17011))))

(declare-fun tp!59474 () Bool)

(declare-fun b_and!27759 () Bool)

(assert (=> start!78798 (= tp!59474 b_and!27759)))

(declare-fun b!919805 () Bool)

(declare-fun res!620230 () Bool)

(declare-fun e!516275 () Bool)

(assert (=> b!919805 (=> (not res!620230) (not e!516275))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55020 0))(
  ( (array!55021 (arr!26455 (Array (_ BitVec 32) (_ BitVec 64))) (size!26914 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55020)

(assert (=> b!919805 (= res!620230 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26914 _keys!1487))))))

(declare-fun b!919806 () Bool)

(declare-fun e!516278 () Bool)

(declare-fun e!516279 () Bool)

(declare-fun mapRes!31035 () Bool)

(assert (=> b!919806 (= e!516278 (and e!516279 mapRes!31035))))

(declare-fun condMapEmpty!31035 () Bool)

(declare-datatypes ((V!30991 0))(
  ( (V!30992 (val!9810 Int)) )
))
(declare-datatypes ((ValueCell!9278 0))(
  ( (ValueCellFull!9278 (v!12328 V!30991)) (EmptyCell!9278) )
))
(declare-datatypes ((array!55022 0))(
  ( (array!55023 (arr!26456 (Array (_ BitVec 32) ValueCell!9278)) (size!26915 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55022)

(declare-fun mapDefault!31035 () ValueCell!9278)

