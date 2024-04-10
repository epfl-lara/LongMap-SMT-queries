; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74944 () Bool)

(assert start!74944)

(declare-fun b_free!15463 () Bool)

(declare-fun b_next!15463 () Bool)

(assert (=> start!74944 (= b_free!15463 (not b_next!15463))))

(declare-fun tp!54092 () Bool)

(declare-fun b_and!25625 () Bool)

(assert (=> start!74944 (= tp!54092 b_and!25625)))

(declare-fun b!884083 () Bool)

(declare-fun res!600614 () Bool)

(declare-fun e!492000 () Bool)

(assert (=> b!884083 (=> (not res!600614) (not e!492000))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!51540 0))(
  ( (array!51541 (arr!24789 (Array (_ BitVec 32) (_ BitVec 64))) (size!25229 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51540)

(assert (=> b!884083 (= res!600614 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25229 _keys!868))))))

(declare-fun b!884084 () Bool)

(declare-datatypes ((Unit!30183 0))(
  ( (Unit!30184) )
))
(declare-fun e!491998 () Unit!30183)

(declare-fun Unit!30185 () Unit!30183)

(assert (=> b!884084 (= e!491998 Unit!30185)))

(declare-fun b!884085 () Bool)

(declare-fun res!600607 () Bool)

(assert (=> b!884085 (=> (not res!600607) (not e!492000))))

(declare-datatypes ((List!17608 0))(
  ( (Nil!17605) (Cons!17604 (h!18735 (_ BitVec 64)) (t!24873 List!17608)) )
))
(declare-fun arrayNoDuplicates!0 (array!51540 (_ BitVec 32) List!17608) Bool)

(assert (=> b!884085 (= res!600607 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17605))))

(declare-fun mapNonEmpty!28197 () Bool)

(declare-fun mapRes!28197 () Bool)

(declare-fun tp!54091 () Bool)

(declare-fun e!492004 () Bool)

(assert (=> mapNonEmpty!28197 (= mapRes!28197 (and tp!54091 e!492004))))

(declare-datatypes ((V!28657 0))(
  ( (V!28658 (val!8901 Int)) )
))
(declare-datatypes ((ValueCell!8414 0))(
  ( (ValueCellFull!8414 (v!11370 V!28657)) (EmptyCell!8414) )
))
(declare-fun mapRest!28197 () (Array (_ BitVec 32) ValueCell!8414))

(declare-fun mapValue!28197 () ValueCell!8414)

(declare-fun mapKey!28197 () (_ BitVec 32))

(declare-datatypes ((array!51542 0))(
  ( (array!51543 (arr!24790 (Array (_ BitVec 32) ValueCell!8414)) (size!25230 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51542)

(assert (=> mapNonEmpty!28197 (= (arr!24790 _values!688) (store mapRest!28197 mapKey!28197 mapValue!28197))))

(declare-fun b!884086 () Bool)

(declare-fun e!492006 () Bool)

(declare-fun e!491999 () Bool)

(assert (=> b!884086 (= e!492006 (and e!491999 mapRes!28197))))

(declare-fun condMapEmpty!28197 () Bool)

(declare-fun mapDefault!28197 () ValueCell!8414)

