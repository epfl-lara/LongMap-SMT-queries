; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83212 () Bool)

(assert start!83212)

(declare-fun b_free!19205 () Bool)

(declare-fun b_next!19205 () Bool)

(assert (=> start!83212 (= b_free!19205 (not b_next!19205))))

(declare-fun tp!66894 () Bool)

(declare-fun b_and!30693 () Bool)

(assert (=> start!83212 (= tp!66894 b_and!30693)))

(declare-fun b!970879 () Bool)

(declare-fun e!547339 () Bool)

(declare-fun e!547338 () Bool)

(declare-fun mapRes!35164 () Bool)

(assert (=> b!970879 (= e!547339 (and e!547338 mapRes!35164))))

(declare-fun condMapEmpty!35164 () Bool)

(declare-datatypes ((V!34453 0))(
  ( (V!34454 (val!11102 Int)) )
))
(declare-datatypes ((ValueCell!10570 0))(
  ( (ValueCellFull!10570 (v!13661 V!34453)) (EmptyCell!10570) )
))
(declare-datatypes ((array!60261 0))(
  ( (array!60262 (arr!28994 (Array (_ BitVec 32) ValueCell!10570)) (size!29473 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60261)

(declare-fun mapDefault!35164 () ValueCell!10570)

