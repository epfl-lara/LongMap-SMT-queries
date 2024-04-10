; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79080 () Bool)

(assert start!79080)

(declare-fun b_free!17293 () Bool)

(declare-fun b_next!17293 () Bool)

(assert (=> start!79080 (= b_free!17293 (not b_next!17293))))

(declare-fun tp!60319 () Bool)

(declare-fun b_and!28323 () Bool)

(assert (=> start!79080 (= tp!60319 b_and!28323)))

(declare-fun b!927499 () Bool)

(declare-datatypes ((Unit!31371 0))(
  ( (Unit!31372) )
))
(declare-fun e!520707 () Unit!31371)

(declare-fun Unit!31373 () Unit!31371)

(assert (=> b!927499 (= e!520707 Unit!31373)))

(declare-fun b!927500 () Bool)

(declare-fun e!520700 () Bool)

(declare-fun e!520701 () Bool)

(declare-fun mapRes!31458 () Bool)

(assert (=> b!927500 (= e!520700 (and e!520701 mapRes!31458))))

(declare-fun condMapEmpty!31458 () Bool)

(declare-datatypes ((V!31367 0))(
  ( (V!31368 (val!9951 Int)) )
))
(declare-datatypes ((ValueCell!9419 0))(
  ( (ValueCellFull!9419 (v!12469 V!31367)) (EmptyCell!9419) )
))
(declare-datatypes ((array!55564 0))(
  ( (array!55565 (arr!26727 (Array (_ BitVec 32) ValueCell!9419)) (size!27186 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55564)

(declare-fun mapDefault!31458 () ValueCell!9419)

