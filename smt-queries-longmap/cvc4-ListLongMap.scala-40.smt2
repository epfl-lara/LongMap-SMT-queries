; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!716 () Bool)

(assert start!716)

(declare-fun b_free!149 () Bool)

(declare-fun b_next!149 () Bool)

(assert (=> start!716 (= b_free!149 (not b_next!149))))

(declare-fun tp!670 () Bool)

(declare-fun b_and!291 () Bool)

(assert (=> start!716 (= tp!670 b_and!291)))

(declare-fun b!4924 () Bool)

(declare-fun res!5971 () Bool)

(declare-fun e!2636 () Bool)

(assert (=> b!4924 (=> (not res!5971) (not e!2636))))

(declare-datatypes ((array!387 0))(
  ( (array!388 (arr!184 (Array (_ BitVec 32) (_ BitVec 64))) (size!246 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!387)

(declare-datatypes ((List!121 0))(
  ( (Nil!118) (Cons!117 (h!683 (_ BitVec 64)) (t!2252 List!121)) )
))
(declare-fun arrayNoDuplicates!0 (array!387 (_ BitVec 32) List!121) Bool)

(assert (=> b!4924 (= res!5971 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!118))))

(declare-fun mapIsEmpty!305 () Bool)

(declare-fun mapRes!305 () Bool)

(assert (=> mapIsEmpty!305 mapRes!305))

(declare-fun b!4925 () Bool)

(declare-fun e!2633 () Bool)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!387 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4925 (= e!2633 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!4926 () Bool)

(declare-fun res!5973 () Bool)

(assert (=> b!4926 (=> (not res!5973) (not e!2636))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!479 0))(
  ( (V!480 (val!119 Int)) )
))
(declare-datatypes ((ValueCell!97 0))(
  ( (ValueCellFull!97 (v!1208 V!479)) (EmptyCell!97) )
))
(declare-datatypes ((array!389 0))(
  ( (array!390 (arr!185 (Array (_ BitVec 32) ValueCell!97)) (size!247 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!389)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!4926 (= res!5973 (and (= (size!247 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!246 _keys!1806) (size!247 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4927 () Bool)

(declare-fun e!2634 () Bool)

(declare-fun e!2630 () Bool)

(assert (=> b!4927 (= e!2634 (and e!2630 mapRes!305))))

(declare-fun condMapEmpty!305 () Bool)

(declare-fun mapDefault!305 () ValueCell!97)

