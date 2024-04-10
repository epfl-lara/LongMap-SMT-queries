; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74680 () Bool)

(assert start!74680)

(declare-fun b_free!15329 () Bool)

(declare-fun b_next!15329 () Bool)

(assert (=> start!74680 (= b_free!15329 (not b_next!15329))))

(declare-fun tp!53675 () Bool)

(declare-fun b_and!25277 () Bool)

(assert (=> start!74680 (= tp!53675 b_and!25277)))

(declare-fun b!880251 () Bool)

(declare-fun res!598039 () Bool)

(declare-fun e!489858 () Bool)

(assert (=> b!880251 (=> (not res!598039) (not e!489858))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880251 (= res!598039 (validMask!0 mask!1196))))

(declare-fun b!880252 () Bool)

(declare-fun res!598035 () Bool)

(assert (=> b!880252 (=> (not res!598035) (not e!489858))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880252 (= res!598035 (validKeyInArray!0 k!854))))

(declare-fun b!880253 () Bool)

(declare-fun e!489855 () Bool)

(declare-fun e!489853 () Bool)

(declare-fun mapRes!27981 () Bool)

(assert (=> b!880253 (= e!489855 (and e!489853 mapRes!27981))))

(declare-fun condMapEmpty!27981 () Bool)

(declare-datatypes ((V!28477 0))(
  ( (V!28478 (val!8834 Int)) )
))
(declare-datatypes ((ValueCell!8347 0))(
  ( (ValueCellFull!8347 (v!11282 V!28477)) (EmptyCell!8347) )
))
(declare-datatypes ((array!51276 0))(
  ( (array!51277 (arr!24662 (Array (_ BitVec 32) ValueCell!8347)) (size!25102 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51276)

(declare-fun mapDefault!27981 () ValueCell!8347)

