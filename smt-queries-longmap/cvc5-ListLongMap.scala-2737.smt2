; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40240 () Bool)

(assert start!40240)

(declare-fun b_free!10507 () Bool)

(declare-fun b_next!10507 () Bool)

(assert (=> start!40240 (= b_free!10507 (not b_next!10507))))

(declare-fun tp!37050 () Bool)

(declare-fun b_and!18475 () Bool)

(assert (=> start!40240 (= tp!37050 b_and!18475)))

(declare-fun b!441524 () Bool)

(declare-fun res!261380 () Bool)

(declare-fun e!259965 () Bool)

(assert (=> b!441524 (=> (not res!261380) (not e!259965))))

(declare-datatypes ((array!27131 0))(
  ( (array!27132 (arr!13015 (Array (_ BitVec 32) (_ BitVec 64))) (size!13367 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27131)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441524 (= res!261380 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441525 () Bool)

(declare-fun e!259966 () Bool)

(declare-fun tp_is_empty!11659 () Bool)

(assert (=> b!441525 (= e!259966 tp_is_empty!11659)))

(declare-fun b!441526 () Bool)

(declare-fun res!261385 () Bool)

(assert (=> b!441526 (=> (not res!261385) (not e!259965))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441526 (= res!261385 (validMask!0 mask!1025))))

(declare-fun b!441527 () Bool)

(declare-fun res!261390 () Bool)

(declare-fun e!259970 () Bool)

(assert (=> b!441527 (=> (not res!261390) (not e!259970))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441527 (= res!261390 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19110 () Bool)

(declare-fun mapRes!19110 () Bool)

(declare-fun tp!37049 () Bool)

(assert (=> mapNonEmpty!19110 (= mapRes!19110 (and tp!37049 e!259966))))

(declare-datatypes ((V!16651 0))(
  ( (V!16652 (val!5874 Int)) )
))
(declare-datatypes ((ValueCell!5486 0))(
  ( (ValueCellFull!5486 (v!8121 V!16651)) (EmptyCell!5486) )
))
(declare-datatypes ((array!27133 0))(
  ( (array!27134 (arr!13016 (Array (_ BitVec 32) ValueCell!5486)) (size!13368 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27133)

(declare-fun mapValue!19110 () ValueCell!5486)

(declare-fun mapRest!19110 () (Array (_ BitVec 32) ValueCell!5486))

(declare-fun mapKey!19110 () (_ BitVec 32))

(assert (=> mapNonEmpty!19110 (= (arr!13016 _values!549) (store mapRest!19110 mapKey!19110 mapValue!19110))))

(declare-fun b!441528 () Bool)

(declare-fun e!259971 () Bool)

(declare-fun e!259967 () Bool)

(assert (=> b!441528 (= e!259971 (and e!259967 mapRes!19110))))

(declare-fun condMapEmpty!19110 () Bool)

(declare-fun mapDefault!19110 () ValueCell!5486)

