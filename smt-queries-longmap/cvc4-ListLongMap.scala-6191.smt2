; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79258 () Bool)

(assert start!79258)

(declare-fun b_free!17471 () Bool)

(declare-fun b_next!17471 () Bool)

(assert (=> start!79258 (= b_free!17471 (not b_next!17471))))

(declare-fun tp!60853 () Bool)

(declare-fun b_and!28537 () Bool)

(assert (=> start!79258 (= tp!60853 b_and!28537)))

(declare-fun b!930735 () Bool)

(declare-fun e!522665 () Bool)

(declare-fun e!522664 () Bool)

(declare-fun mapRes!31725 () Bool)

(assert (=> b!930735 (= e!522665 (and e!522664 mapRes!31725))))

(declare-fun condMapEmpty!31725 () Bool)

(declare-datatypes ((V!31603 0))(
  ( (V!31604 (val!10040 Int)) )
))
(declare-datatypes ((ValueCell!9508 0))(
  ( (ValueCellFull!9508 (v!12558 V!31603)) (EmptyCell!9508) )
))
(declare-datatypes ((array!55902 0))(
  ( (array!55903 (arr!26896 (Array (_ BitVec 32) ValueCell!9508)) (size!27355 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55902)

(declare-fun mapDefault!31725 () ValueCell!9508)

