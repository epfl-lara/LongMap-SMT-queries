; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!836 () Bool)

(assert start!836)

(declare-fun b_free!229 () Bool)

(declare-fun b_next!229 () Bool)

(assert (=> start!836 (= b_free!229 (not b_next!229))))

(declare-fun tp!917 () Bool)

(declare-fun b_and!375 () Bool)

(assert (=> start!836 (= tp!917 b_and!375)))

(declare-fun b!6626 () Bool)

(declare-fun res!6937 () Bool)

(declare-fun e!3654 () Bool)

(assert (=> b!6626 (=> (not res!6937) (not e!3654))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!587 0))(
  ( (V!588 (val!159 Int)) )
))
(declare-datatypes ((ValueCell!137 0))(
  ( (ValueCellFull!137 (v!1250 V!587)) (EmptyCell!137) )
))
(declare-datatypes ((array!547 0))(
  ( (array!548 (arr!262 (Array (_ BitVec 32) ValueCell!137)) (size!324 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!547)

(declare-fun minValue!1434 () V!587)

(declare-datatypes ((array!549 0))(
  ( (array!550 (arr!263 (Array (_ BitVec 32) (_ BitVec 64))) (size!325 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!549)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!587)

(declare-datatypes ((tuple2!166 0))(
  ( (tuple2!167 (_1!83 (_ BitVec 64)) (_2!83 V!587)) )
))
(declare-datatypes ((List!176 0))(
  ( (Nil!173) (Cons!172 (h!738 tuple2!166) (t!2311 List!176)) )
))
(declare-datatypes ((ListLongMap!171 0))(
  ( (ListLongMap!172 (toList!101 List!176)) )
))
(declare-fun contains!75 (ListLongMap!171 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!60 (array!549 array!547 (_ BitVec 32) (_ BitVec 32) V!587 V!587 (_ BitVec 32) Int) ListLongMap!171)

(assert (=> b!6626 (= res!6937 (contains!75 (getCurrentListMap!60 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6627 () Bool)

(declare-fun e!3659 () Bool)

(declare-fun e!3657 () Bool)

(declare-fun mapRes!431 () Bool)

(assert (=> b!6627 (= e!3659 (and e!3657 mapRes!431))))

(declare-fun condMapEmpty!431 () Bool)

(declare-fun mapDefault!431 () ValueCell!137)

