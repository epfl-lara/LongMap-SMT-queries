; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111770 () Bool)

(assert start!111770)

(declare-fun b_free!30427 () Bool)

(declare-fun b_next!30427 () Bool)

(assert (=> start!111770 (= b_free!30427 (not b_next!30427))))

(declare-fun tp!106756 () Bool)

(declare-fun b_and!48965 () Bool)

(assert (=> start!111770 (= tp!106756 b_and!48965)))

(declare-fun b!1324426 () Bool)

(declare-fun e!755040 () Bool)

(declare-fun e!755041 () Bool)

(declare-fun mapRes!56018 () Bool)

(assert (=> b!1324426 (= e!755040 (and e!755041 mapRes!56018))))

(declare-fun condMapEmpty!56018 () Bool)

(declare-datatypes ((V!53433 0))(
  ( (V!53434 (val!18198 Int)) )
))
(declare-datatypes ((ValueCell!17225 0))(
  ( (ValueCellFull!17225 (v!20828 V!53433)) (EmptyCell!17225) )
))
(declare-datatypes ((array!89410 0))(
  ( (array!89411 (arr!43179 (Array (_ BitVec 32) ValueCell!17225)) (size!43729 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89410)

(declare-fun mapDefault!56018 () ValueCell!17225)

