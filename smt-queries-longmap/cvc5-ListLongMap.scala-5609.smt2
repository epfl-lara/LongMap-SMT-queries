; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73438 () Bool)

(assert start!73438)

(declare-fun b_free!14353 () Bool)

(declare-fun b_next!14353 () Bool)

(assert (=> start!73438 (= b_free!14353 (not b_next!14353))))

(declare-fun tp!50562 () Bool)

(declare-fun b_and!23709 () Bool)

(assert (=> start!73438 (= tp!50562 b_and!23709)))

(declare-fun b!857478 () Bool)

(declare-fun e!477918 () Bool)

(declare-fun tp_is_empty!16489 () Bool)

(assert (=> b!857478 (= e!477918 tp_is_empty!16489)))

(declare-fun b!857479 () Bool)

(declare-fun res!582476 () Bool)

(declare-fun e!477919 () Bool)

(assert (=> b!857479 (=> (not res!582476) (not e!477919))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!49168 0))(
  ( (array!49169 (arr!23615 (Array (_ BitVec 32) (_ BitVec 64))) (size!24055 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49168)

(declare-datatypes ((V!27033 0))(
  ( (V!27034 (val!8292 Int)) )
))
(declare-datatypes ((ValueCell!7805 0))(
  ( (ValueCellFull!7805 (v!10717 V!27033)) (EmptyCell!7805) )
))
(declare-datatypes ((array!49170 0))(
  ( (array!49171 (arr!23616 (Array (_ BitVec 32) ValueCell!7805)) (size!24056 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49170)

(assert (=> b!857479 (= res!582476 (and (= (size!24056 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24055 _keys!868) (size!24056 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857480 () Bool)

(declare-fun res!582477 () Bool)

(assert (=> b!857480 (=> (not res!582477) (not e!477919))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857480 (= res!582477 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24055 _keys!868))))))

(declare-fun b!857481 () Bool)

(declare-fun res!582479 () Bool)

(assert (=> b!857481 (=> (not res!582479) (not e!477919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857481 (= res!582479 (validMask!0 mask!1196))))

(declare-fun b!857482 () Bool)

(declare-fun res!582474 () Bool)

(assert (=> b!857482 (=> (not res!582474) (not e!477919))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857482 (= res!582474 (validKeyInArray!0 k!854))))

(declare-fun b!857483 () Bool)

(declare-fun e!477921 () Bool)

(declare-fun e!477917 () Bool)

(declare-fun mapRes!26333 () Bool)

(assert (=> b!857483 (= e!477921 (and e!477917 mapRes!26333))))

(declare-fun condMapEmpty!26333 () Bool)

(declare-fun mapDefault!26333 () ValueCell!7805)

