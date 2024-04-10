; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73172 () Bool)

(assert start!73172)

(declare-fun b_free!14087 () Bool)

(declare-fun b_next!14087 () Bool)

(assert (=> start!73172 (= b_free!14087 (not b_next!14087))))

(declare-fun tp!49764 () Bool)

(declare-fun b_and!23333 () Bool)

(assert (=> start!73172 (= tp!49764 b_and!23333)))

(declare-fun res!578832 () Bool)

(declare-fun e!475308 () Bool)

(assert (=> start!73172 (=> (not res!578832) (not e!475308))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48644 0))(
  ( (array!48645 (arr!23353 (Array (_ BitVec 32) (_ BitVec 64))) (size!23793 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48644)

(assert (=> start!73172 (= res!578832 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23793 _keys!868))))))

(assert (=> start!73172 e!475308))

(declare-fun tp_is_empty!16223 () Bool)

(assert (=> start!73172 tp_is_empty!16223))

(assert (=> start!73172 true))

(assert (=> start!73172 tp!49764))

(declare-fun array_inv!18522 (array!48644) Bool)

(assert (=> start!73172 (array_inv!18522 _keys!868)))

(declare-datatypes ((V!26677 0))(
  ( (V!26678 (val!8159 Int)) )
))
(declare-datatypes ((ValueCell!7672 0))(
  ( (ValueCellFull!7672 (v!10584 V!26677)) (EmptyCell!7672) )
))
(declare-datatypes ((array!48646 0))(
  ( (array!48647 (arr!23354 (Array (_ BitVec 32) ValueCell!7672)) (size!23794 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48646)

(declare-fun e!475309 () Bool)

(declare-fun array_inv!18523 (array!48646) Bool)

(assert (=> start!73172 (and (array_inv!18523 _values!688) e!475309)))

(declare-fun b!852199 () Bool)

(declare-fun e!475307 () Bool)

(assert (=> b!852199 (= e!475308 e!475307)))

(declare-fun res!578837 () Bool)

(assert (=> b!852199 (=> (not res!578837) (not e!475307))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852199 (= res!578837 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10712 0))(
  ( (tuple2!10713 (_1!5367 (_ BitVec 64)) (_2!5367 V!26677)) )
))
(declare-datatypes ((List!16547 0))(
  ( (Nil!16544) (Cons!16543 (h!17674 tuple2!10712) (t!23080 List!16547)) )
))
(declare-datatypes ((ListLongMap!9481 0))(
  ( (ListLongMap!9482 (toList!4756 List!16547)) )
))
(declare-fun lt!383951 () ListLongMap!9481)

(declare-fun minValue!654 () V!26677)

(declare-fun zeroValue!654 () V!26677)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383950 () array!48646)

(declare-fun getCurrentListMapNoExtraKeys!2738 (array!48644 array!48646 (_ BitVec 32) (_ BitVec 32) V!26677 V!26677 (_ BitVec 32) Int) ListLongMap!9481)

(assert (=> b!852199 (= lt!383951 (getCurrentListMapNoExtraKeys!2738 _keys!868 lt!383950 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26677)

(assert (=> b!852199 (= lt!383950 (array!48647 (store (arr!23354 _values!688) i!612 (ValueCellFull!7672 v!557)) (size!23794 _values!688)))))

(declare-fun lt!383944 () ListLongMap!9481)

(assert (=> b!852199 (= lt!383944 (getCurrentListMapNoExtraKeys!2738 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852200 () Bool)

(declare-fun res!578835 () Bool)

(assert (=> b!852200 (=> (not res!578835) (not e!475308))))

(assert (=> b!852200 (= res!578835 (and (= (size!23794 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23793 _keys!868) (size!23794 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!852201 () Bool)

(declare-fun res!578833 () Bool)

(assert (=> b!852201 (=> (not res!578833) (not e!475308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852201 (= res!578833 (validMask!0 mask!1196))))

(declare-fun bm!38113 () Bool)

(declare-fun call!38116 () ListLongMap!9481)

(assert (=> bm!38113 (= call!38116 (getCurrentListMapNoExtraKeys!2738 _keys!868 lt!383950 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852202 () Bool)

(declare-fun res!578831 () Bool)

(assert (=> b!852202 (=> (not res!578831) (not e!475308))))

(declare-fun k!854 () (_ BitVec 64))

(assert (=> b!852202 (= res!578831 (and (= (select (arr!23353 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25934 () Bool)

(declare-fun mapRes!25934 () Bool)

(assert (=> mapIsEmpty!25934 mapRes!25934))

(declare-fun e!475310 () Bool)

(declare-fun call!38117 () ListLongMap!9481)

(declare-fun b!852203 () Bool)

(declare-fun +!2154 (ListLongMap!9481 tuple2!10712) ListLongMap!9481)

(assert (=> b!852203 (= e!475310 (= call!38116 (+!2154 call!38117 (tuple2!10713 k!854 v!557))))))

(declare-fun b!852204 () Bool)

(declare-fun e!475305 () Bool)

(assert (=> b!852204 (= e!475305 tp_is_empty!16223)))

(declare-fun b!852205 () Bool)

(declare-fun res!578828 () Bool)

(assert (=> b!852205 (=> (not res!578828) (not e!475308))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48644 (_ BitVec 32)) Bool)

(assert (=> b!852205 (= res!578828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852206 () Bool)

(declare-fun res!578829 () Bool)

(assert (=> b!852206 (=> (not res!578829) (not e!475308))))

(declare-datatypes ((List!16548 0))(
  ( (Nil!16545) (Cons!16544 (h!17675 (_ BitVec 64)) (t!23081 List!16548)) )
))
(declare-fun arrayNoDuplicates!0 (array!48644 (_ BitVec 32) List!16548) Bool)

(assert (=> b!852206 (= res!578829 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16545))))

(declare-fun b!852207 () Bool)

(declare-fun e!475306 () Bool)

(assert (=> b!852207 (= e!475309 (and e!475306 mapRes!25934))))

(declare-fun condMapEmpty!25934 () Bool)

(declare-fun mapDefault!25934 () ValueCell!7672)

