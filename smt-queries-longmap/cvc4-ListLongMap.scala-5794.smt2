; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74710 () Bool)

(assert start!74710)

(declare-fun b_free!15359 () Bool)

(declare-fun b_next!15359 () Bool)

(assert (=> start!74710 (= b_free!15359 (not b_next!15359))))

(declare-fun tp!53764 () Bool)

(declare-fun b_and!25337 () Bool)

(assert (=> start!74710 (= tp!53764 b_and!25337)))

(declare-fun mapIsEmpty!28026 () Bool)

(declare-fun mapRes!28026 () Bool)

(assert (=> mapIsEmpty!28026 mapRes!28026))

(declare-fun b!880910 () Bool)

(declare-fun res!598529 () Bool)

(declare-fun e!490218 () Bool)

(assert (=> b!880910 (=> (not res!598529) (not e!490218))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880910 (= res!598529 (validKeyInArray!0 k!854))))

(declare-fun mapNonEmpty!28026 () Bool)

(declare-fun tp!53765 () Bool)

(declare-fun e!490211 () Bool)

(assert (=> mapNonEmpty!28026 (= mapRes!28026 (and tp!53765 e!490211))))

(declare-datatypes ((V!28517 0))(
  ( (V!28518 (val!8849 Int)) )
))
(declare-datatypes ((ValueCell!8362 0))(
  ( (ValueCellFull!8362 (v!11297 V!28517)) (EmptyCell!8362) )
))
(declare-fun mapRest!28026 () (Array (_ BitVec 32) ValueCell!8362))

(declare-datatypes ((array!51332 0))(
  ( (array!51333 (arr!24690 (Array (_ BitVec 32) ValueCell!8362)) (size!25130 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51332)

(declare-fun mapValue!28026 () ValueCell!8362)

(declare-fun mapKey!28026 () (_ BitVec 32))

(assert (=> mapNonEmpty!28026 (= (arr!24690 _values!688) (store mapRest!28026 mapKey!28026 mapValue!28026))))

(declare-fun b!880911 () Bool)

(declare-fun e!490213 () Bool)

(declare-fun e!490214 () Bool)

(assert (=> b!880911 (= e!490213 (and e!490214 mapRes!28026))))

(declare-fun condMapEmpty!28026 () Bool)

(declare-fun mapDefault!28026 () ValueCell!8362)

