; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35418 () Bool)

(assert start!35418)

(declare-fun b!354548 () Bool)

(declare-fun e!217329 () Bool)

(declare-fun e!217330 () Bool)

(declare-fun mapRes!13314 () Bool)

(assert (=> b!354548 (= e!217329 (and e!217330 mapRes!13314))))

(declare-fun condMapEmpty!13314 () Bool)

(declare-datatypes ((V!11471 0))(
  ( (V!11472 (val!3980 Int)) )
))
(declare-datatypes ((ValueCell!3592 0))(
  ( (ValueCellFull!3592 (v!6174 V!11471)) (EmptyCell!3592) )
))
(declare-datatypes ((array!19325 0))(
  ( (array!19326 (arr!9156 (Array (_ BitVec 32) ValueCell!3592)) (size!9508 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19325)

(declare-fun mapDefault!13314 () ValueCell!3592)

