; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79120 () Bool)

(assert start!79120)

(declare-fun b_free!17333 () Bool)

(declare-fun b_next!17333 () Bool)

(assert (=> start!79120 (= b_free!17333 (not b_next!17333))))

(declare-fun tp!60439 () Bool)

(declare-fun b_and!28399 () Bool)

(assert (=> start!79120 (= tp!60439 b_and!28399)))

(declare-fun b!928647 () Bool)

(declare-fun e!521425 () Bool)

(declare-fun e!521421 () Bool)

(declare-fun mapRes!31518 () Bool)

(assert (=> b!928647 (= e!521425 (and e!521421 mapRes!31518))))

(declare-fun condMapEmpty!31518 () Bool)

(declare-datatypes ((V!31419 0))(
  ( (V!31420 (val!9971 Int)) )
))
(declare-datatypes ((ValueCell!9439 0))(
  ( (ValueCellFull!9439 (v!12489 V!31419)) (EmptyCell!9439) )
))
(declare-datatypes ((array!55642 0))(
  ( (array!55643 (arr!26766 (Array (_ BitVec 32) ValueCell!9439)) (size!27225 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55642)

(declare-fun mapDefault!31518 () ValueCell!9439)

