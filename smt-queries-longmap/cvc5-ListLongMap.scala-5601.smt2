; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73390 () Bool)

(assert start!73390)

(declare-fun b_free!14305 () Bool)

(declare-fun b_next!14305 () Bool)

(assert (=> start!73390 (= b_free!14305 (not b_next!14305))))

(declare-fun tp!50419 () Bool)

(declare-fun b_and!23661 () Bool)

(assert (=> start!73390 (= tp!50419 b_and!23661)))

(declare-fun b!856614 () Bool)

(declare-fun e!477488 () Bool)

(assert (=> b!856614 (= e!477488 (not true))))

(declare-datatypes ((V!26969 0))(
  ( (V!26970 (val!8268 Int)) )
))
(declare-datatypes ((ValueCell!7781 0))(
  ( (ValueCellFull!7781 (v!10693 V!26969)) (EmptyCell!7781) )
))
(declare-datatypes ((array!49074 0))(
  ( (array!49075 (arr!23568 (Array (_ BitVec 32) ValueCell!7781)) (size!24008 (_ BitVec 32))) )
))
(declare-fun lt!386017 () array!49074)

(declare-fun v!557 () V!26969)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49076 0))(
  ( (array!49077 (arr!23569 (Array (_ BitVec 32) (_ BitVec 64))) (size!24009 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49076)

(declare-fun _values!688 () array!49074)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26969)

(declare-fun zeroValue!654 () V!26969)

(declare-datatypes ((tuple2!10904 0))(
  ( (tuple2!10905 (_1!5463 (_ BitVec 64)) (_2!5463 V!26969)) )
))
(declare-datatypes ((List!16713 0))(
  ( (Nil!16710) (Cons!16709 (h!17840 tuple2!10904) (t!23354 List!16713)) )
))
(declare-datatypes ((ListLongMap!9673 0))(
  ( (ListLongMap!9674 (toList!4852 List!16713)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2833 (array!49076 array!49074 (_ BitVec 32) (_ BitVec 32) V!26969 V!26969 (_ BitVec 32) Int) ListLongMap!9673)

(declare-fun +!2208 (ListLongMap!9673 tuple2!10904) ListLongMap!9673)

(assert (=> b!856614 (= (getCurrentListMapNoExtraKeys!2833 _keys!868 lt!386017 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2208 (getCurrentListMapNoExtraKeys!2833 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10905 k!854 v!557)))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29203 0))(
  ( (Unit!29204) )
))
(declare-fun lt!386014 () Unit!29203)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!429 (array!49076 array!49074 (_ BitVec 32) (_ BitVec 32) V!26969 V!26969 (_ BitVec 32) (_ BitVec 64) V!26969 (_ BitVec 32) Int) Unit!29203)

(assert (=> b!856614 (= lt!386014 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!429 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!856615 () Bool)

(declare-fun res!581833 () Bool)

(declare-fun e!477490 () Bool)

(assert (=> b!856615 (=> (not res!581833) (not e!477490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49076 (_ BitVec 32)) Bool)

(assert (=> b!856615 (= res!581833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856616 () Bool)

(declare-fun res!581828 () Bool)

(assert (=> b!856616 (=> (not res!581828) (not e!477490))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856616 (= res!581828 (validKeyInArray!0 k!854))))

(declare-fun b!856617 () Bool)

(declare-fun res!581829 () Bool)

(assert (=> b!856617 (=> (not res!581829) (not e!477490))))

(assert (=> b!856617 (= res!581829 (and (= (select (arr!23569 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!856618 () Bool)

(declare-fun e!477487 () Bool)

(declare-fun tp_is_empty!16441 () Bool)

(assert (=> b!856618 (= e!477487 tp_is_empty!16441)))

(declare-fun mapNonEmpty!26261 () Bool)

(declare-fun mapRes!26261 () Bool)

(declare-fun tp!50418 () Bool)

(declare-fun e!477489 () Bool)

(assert (=> mapNonEmpty!26261 (= mapRes!26261 (and tp!50418 e!477489))))

(declare-fun mapKey!26261 () (_ BitVec 32))

(declare-fun mapRest!26261 () (Array (_ BitVec 32) ValueCell!7781))

(declare-fun mapValue!26261 () ValueCell!7781)

(assert (=> mapNonEmpty!26261 (= (arr!23568 _values!688) (store mapRest!26261 mapKey!26261 mapValue!26261))))

(declare-fun mapIsEmpty!26261 () Bool)

(assert (=> mapIsEmpty!26261 mapRes!26261))

(declare-fun b!856620 () Bool)

(declare-fun res!581832 () Bool)

(assert (=> b!856620 (=> (not res!581832) (not e!477490))))

(assert (=> b!856620 (= res!581832 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24009 _keys!868))))))

(declare-fun b!856621 () Bool)

(declare-fun res!581826 () Bool)

(assert (=> b!856621 (=> (not res!581826) (not e!477490))))

(assert (=> b!856621 (= res!581826 (and (= (size!24008 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24009 _keys!868) (size!24008 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!856622 () Bool)

(declare-fun res!581827 () Bool)

(assert (=> b!856622 (=> (not res!581827) (not e!477490))))

(declare-datatypes ((List!16714 0))(
  ( (Nil!16711) (Cons!16710 (h!17841 (_ BitVec 64)) (t!23355 List!16714)) )
))
(declare-fun arrayNoDuplicates!0 (array!49076 (_ BitVec 32) List!16714) Bool)

(assert (=> b!856622 (= res!581827 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16711))))

(declare-fun b!856623 () Bool)

(declare-fun res!581834 () Bool)

(assert (=> b!856623 (=> (not res!581834) (not e!477490))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856623 (= res!581834 (validMask!0 mask!1196))))

(declare-fun b!856624 () Bool)

(declare-fun e!477485 () Bool)

(assert (=> b!856624 (= e!477485 (and e!477487 mapRes!26261))))

(declare-fun condMapEmpty!26261 () Bool)

(declare-fun mapDefault!26261 () ValueCell!7781)

