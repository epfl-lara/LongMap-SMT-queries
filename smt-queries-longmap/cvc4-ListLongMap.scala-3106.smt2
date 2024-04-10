; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43652 () Bool)

(assert start!43652)

(declare-fun b_free!12359 () Bool)

(declare-fun b_next!12359 () Bool)

(assert (=> start!43652 (= b_free!12359 (not b_next!12359))))

(declare-fun tp!43368 () Bool)

(declare-fun b_and!21125 () Bool)

(assert (=> start!43652 (= tp!43368 b_and!21125)))

(declare-fun b!483510 () Bool)

(declare-fun e!284543 () Bool)

(declare-fun e!284542 () Bool)

(declare-fun mapRes!22525 () Bool)

(assert (=> b!483510 (= e!284543 (and e!284542 mapRes!22525))))

(declare-fun condMapEmpty!22525 () Bool)

(declare-datatypes ((V!19565 0))(
  ( (V!19566 (val!6983 Int)) )
))
(declare-datatypes ((ValueCell!6574 0))(
  ( (ValueCellFull!6574 (v!9279 V!19565)) (EmptyCell!6574) )
))
(declare-datatypes ((array!31403 0))(
  ( (array!31404 (arr!15101 (Array (_ BitVec 32) ValueCell!6574)) (size!15459 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31403)

(declare-fun mapDefault!22525 () ValueCell!6574)

