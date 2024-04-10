; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74240 () Bool)

(assert start!74240)

(declare-fun b!873371 () Bool)

(declare-fun res!593501 () Bool)

(declare-fun e!486368 () Bool)

(assert (=> b!873371 (=> (not res!593501) (not e!486368))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50648 0))(
  ( (array!50649 (arr!24353 (Array (_ BitVec 32) (_ BitVec 64))) (size!24793 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50648)

(declare-datatypes ((V!28061 0))(
  ( (V!28062 (val!8678 Int)) )
))
(declare-datatypes ((ValueCell!8191 0))(
  ( (ValueCellFull!8191 (v!11107 V!28061)) (EmptyCell!8191) )
))
(declare-datatypes ((array!50650 0))(
  ( (array!50651 (arr!24354 (Array (_ BitVec 32) ValueCell!8191)) (size!24794 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50650)

(assert (=> b!873371 (= res!593501 (and (= (size!24794 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24793 _keys!868) (size!24794 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873372 () Bool)

(declare-fun e!486370 () Bool)

(declare-fun e!486367 () Bool)

(declare-fun mapRes!27497 () Bool)

(assert (=> b!873372 (= e!486370 (and e!486367 mapRes!27497))))

(declare-fun condMapEmpty!27497 () Bool)

(declare-fun mapDefault!27497 () ValueCell!8191)

