; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74268 () Bool)

(assert start!74268)

(declare-fun b_free!15031 () Bool)

(declare-fun b_next!15031 () Bool)

(assert (=> start!74268 (= b_free!15031 (not b_next!15031))))

(declare-fun tp!52767 () Bool)

(declare-fun b_and!24807 () Bool)

(assert (=> start!74268 (= tp!52767 b_and!24807)))

(declare-fun b!873686 () Bool)

(declare-fun res!593699 () Bool)

(declare-fun e!486526 () Bool)

(assert (=> b!873686 (=> (not res!593699) (not e!486526))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873686 (= res!593699 (validKeyInArray!0 k!854))))

(declare-fun b!873687 () Bool)

(declare-fun res!593705 () Bool)

(assert (=> b!873687 (=> (not res!593705) (not e!486526))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50678 0))(
  ( (array!50679 (arr!24367 (Array (_ BitVec 32) (_ BitVec 64))) (size!24807 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50678)

(assert (=> b!873687 (= res!593705 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24807 _keys!868))))))

(declare-fun b!873688 () Bool)

(declare-fun e!486530 () Bool)

(declare-fun tp_is_empty!17275 () Bool)

(assert (=> b!873688 (= e!486530 tp_is_empty!17275)))

(declare-fun b!873690 () Bool)

(declare-fun res!593701 () Bool)

(assert (=> b!873690 (=> (not res!593701) (not e!486526))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28081 0))(
  ( (V!28082 (val!8685 Int)) )
))
(declare-datatypes ((ValueCell!8198 0))(
  ( (ValueCellFull!8198 (v!11114 V!28081)) (EmptyCell!8198) )
))
(declare-datatypes ((array!50680 0))(
  ( (array!50681 (arr!24368 (Array (_ BitVec 32) ValueCell!8198)) (size!24808 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50680)

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873690 (= res!593701 (and (= (size!24808 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24807 _keys!868) (size!24808 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873691 () Bool)

(declare-fun e!486527 () Bool)

(assert (=> b!873691 (= e!486527 tp_is_empty!17275)))

(declare-fun mapNonEmpty!27521 () Bool)

(declare-fun mapRes!27521 () Bool)

(declare-fun tp!52768 () Bool)

(assert (=> mapNonEmpty!27521 (= mapRes!27521 (and tp!52768 e!486530))))

(declare-fun mapValue!27521 () ValueCell!8198)

(declare-fun mapRest!27521 () (Array (_ BitVec 32) ValueCell!8198))

(declare-fun mapKey!27521 () (_ BitVec 32))

(assert (=> mapNonEmpty!27521 (= (arr!24368 _values!688) (store mapRest!27521 mapKey!27521 mapValue!27521))))

(declare-fun b!873692 () Bool)

(declare-fun res!593702 () Bool)

(assert (=> b!873692 (=> (not res!593702) (not e!486526))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873692 (= res!593702 (and (= (select (arr!24367 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!873693 () Bool)

(declare-fun e!486528 () Bool)

(assert (=> b!873693 (= e!486528 (and e!486527 mapRes!27521))))

(declare-fun condMapEmpty!27521 () Bool)

(declare-fun mapDefault!27521 () ValueCell!8198)

