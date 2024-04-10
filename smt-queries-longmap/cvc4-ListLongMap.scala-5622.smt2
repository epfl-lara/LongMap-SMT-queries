; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73520 () Bool)

(assert start!73520)

(declare-fun b_free!14435 () Bool)

(declare-fun b_next!14435 () Bool)

(assert (=> start!73520 (= b_free!14435 (not b_next!14435))))

(declare-fun tp!50808 () Bool)

(declare-fun b_and!23849 () Bool)

(assert (=> start!73520 (= tp!50808 b_and!23849)))

(declare-fun b!859154 () Bool)

(declare-fun res!583732 () Bool)

(declare-fun e!478799 () Bool)

(assert (=> b!859154 (=> (not res!583732) (not e!478799))))

(declare-datatypes ((array!49322 0))(
  ( (array!49323 (arr!23692 (Array (_ BitVec 32) (_ BitVec 64))) (size!24132 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49322)

(declare-datatypes ((List!16811 0))(
  ( (Nil!16808) (Cons!16807 (h!17938 (_ BitVec 64)) (t!23512 List!16811)) )
))
(declare-fun arrayNoDuplicates!0 (array!49322 (_ BitVec 32) List!16811) Bool)

(assert (=> b!859154 (= res!583732 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16808))))

(declare-fun b!859155 () Bool)

(declare-fun res!583725 () Bool)

(assert (=> b!859155 (=> (not res!583725) (not e!478799))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!859155 (= res!583725 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24132 _keys!868))))))

(declare-fun mapIsEmpty!26456 () Bool)

(declare-fun mapRes!26456 () Bool)

(assert (=> mapIsEmpty!26456 mapRes!26456))

(declare-fun mapNonEmpty!26456 () Bool)

(declare-fun tp!50809 () Bool)

(declare-fun e!478798 () Bool)

(assert (=> mapNonEmpty!26456 (= mapRes!26456 (and tp!50809 e!478798))))

(declare-fun mapKey!26456 () (_ BitVec 32))

(declare-datatypes ((V!27141 0))(
  ( (V!27142 (val!8333 Int)) )
))
(declare-datatypes ((ValueCell!7846 0))(
  ( (ValueCellFull!7846 (v!10758 V!27141)) (EmptyCell!7846) )
))
(declare-fun mapValue!26456 () ValueCell!7846)

(declare-fun mapRest!26456 () (Array (_ BitVec 32) ValueCell!7846))

(declare-datatypes ((array!49324 0))(
  ( (array!49325 (arr!23693 (Array (_ BitVec 32) ValueCell!7846)) (size!24133 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49324)

(assert (=> mapNonEmpty!26456 (= (arr!23693 _values!688) (store mapRest!26456 mapKey!26456 mapValue!26456))))

(declare-fun b!859156 () Bool)

(declare-fun e!478803 () Bool)

(assert (=> b!859156 (= e!478799 e!478803)))

(declare-fun res!583728 () Bool)

(assert (=> b!859156 (=> (not res!583728) (not e!478803))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!859156 (= res!583728 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387112 () array!49324)

(declare-datatypes ((tuple2!11002 0))(
  ( (tuple2!11003 (_1!5512 (_ BitVec 64)) (_2!5512 V!27141)) )
))
(declare-datatypes ((List!16812 0))(
  ( (Nil!16809) (Cons!16808 (h!17939 tuple2!11002) (t!23513 List!16812)) )
))
(declare-datatypes ((ListLongMap!9771 0))(
  ( (ListLongMap!9772 (toList!4901 List!16812)) )
))
(declare-fun lt!387105 () ListLongMap!9771)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!27141)

(declare-fun zeroValue!654 () V!27141)

(declare-fun getCurrentListMapNoExtraKeys!2880 (array!49322 array!49324 (_ BitVec 32) (_ BitVec 32) V!27141 V!27141 (_ BitVec 32) Int) ListLongMap!9771)

(assert (=> b!859156 (= lt!387105 (getCurrentListMapNoExtraKeys!2880 _keys!868 lt!387112 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27141)

(assert (=> b!859156 (= lt!387112 (array!49325 (store (arr!23693 _values!688) i!612 (ValueCellFull!7846 v!557)) (size!24133 _values!688)))))

(declare-fun lt!387109 () ListLongMap!9771)

(assert (=> b!859156 (= lt!387109 (getCurrentListMapNoExtraKeys!2880 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!859157 () Bool)

(declare-fun e!478800 () Bool)

(assert (=> b!859157 (= e!478800 true)))

(assert (=> b!859157 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16808)))

(declare-datatypes ((Unit!29293 0))(
  ( (Unit!29294) )
))
(declare-fun lt!387107 () Unit!29293)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49322 (_ BitVec 32) (_ BitVec 32)) Unit!29293)

(assert (=> b!859157 (= lt!387107 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!859158 () Bool)

(declare-fun res!583724 () Bool)

(assert (=> b!859158 (=> (not res!583724) (not e!478799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49322 (_ BitVec 32)) Bool)

(assert (=> b!859158 (= res!583724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!859159 () Bool)

(declare-fun e!478804 () Bool)

(assert (=> b!859159 (= e!478803 (not e!478804))))

(declare-fun res!583729 () Bool)

(assert (=> b!859159 (=> res!583729 e!478804)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859159 (= res!583729 (not (validKeyInArray!0 (select (arr!23692 _keys!868) from!1053))))))

(declare-fun lt!387111 () ListLongMap!9771)

(declare-fun lt!387108 () ListLongMap!9771)

(assert (=> b!859159 (= lt!387111 lt!387108)))

(declare-fun lt!387106 () ListLongMap!9771)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2254 (ListLongMap!9771 tuple2!11002) ListLongMap!9771)

(assert (=> b!859159 (= lt!387108 (+!2254 lt!387106 (tuple2!11003 k!854 v!557)))))

(assert (=> b!859159 (= lt!387111 (getCurrentListMapNoExtraKeys!2880 _keys!868 lt!387112 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!859159 (= lt!387106 (getCurrentListMapNoExtraKeys!2880 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!387110 () Unit!29293)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!470 (array!49322 array!49324 (_ BitVec 32) (_ BitVec 32) V!27141 V!27141 (_ BitVec 32) (_ BitVec 64) V!27141 (_ BitVec 32) Int) Unit!29293)

(assert (=> b!859159 (= lt!387110 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!470 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!859160 () Bool)

(declare-fun res!583726 () Bool)

(assert (=> b!859160 (=> (not res!583726) (not e!478799))))

(assert (=> b!859160 (= res!583726 (and (= (size!24133 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24132 _keys!868) (size!24133 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!859161 () Bool)

(declare-fun res!583723 () Bool)

(assert (=> b!859161 (=> (not res!583723) (not e!478799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!859161 (= res!583723 (validMask!0 mask!1196))))

(declare-fun b!859162 () Bool)

(declare-fun e!478797 () Bool)

(declare-fun e!478802 () Bool)

(assert (=> b!859162 (= e!478797 (and e!478802 mapRes!26456))))

(declare-fun condMapEmpty!26456 () Bool)

(declare-fun mapDefault!26456 () ValueCell!7846)

