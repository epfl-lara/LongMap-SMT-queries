; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73420 () Bool)

(assert start!73420)

(declare-fun b_free!14335 () Bool)

(declare-fun b_next!14335 () Bool)

(assert (=> start!73420 (= b_free!14335 (not b_next!14335))))

(declare-fun tp!50509 () Bool)

(declare-fun b_and!23691 () Bool)

(assert (=> start!73420 (= tp!50509 b_and!23691)))

(declare-fun b!857154 () Bool)

(declare-fun res!582236 () Bool)

(declare-fun e!477755 () Bool)

(assert (=> b!857154 (=> (not res!582236) (not e!477755))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!49134 0))(
  ( (array!49135 (arr!23598 (Array (_ BitVec 32) (_ BitVec 64))) (size!24038 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49134)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!857154 (= res!582236 (and (= (select (arr!23598 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26306 () Bool)

(declare-fun mapRes!26306 () Bool)

(declare-fun tp!50508 () Bool)

(declare-fun e!477756 () Bool)

(assert (=> mapNonEmpty!26306 (= mapRes!26306 (and tp!50508 e!477756))))

(declare-datatypes ((V!27009 0))(
  ( (V!27010 (val!8283 Int)) )
))
(declare-datatypes ((ValueCell!7796 0))(
  ( (ValueCellFull!7796 (v!10708 V!27009)) (EmptyCell!7796) )
))
(declare-fun mapValue!26306 () ValueCell!7796)

(declare-fun mapRest!26306 () (Array (_ BitVec 32) ValueCell!7796))

(declare-fun mapKey!26306 () (_ BitVec 32))

(declare-datatypes ((array!49136 0))(
  ( (array!49137 (arr!23599 (Array (_ BitVec 32) ValueCell!7796)) (size!24039 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49136)

(assert (=> mapNonEmpty!26306 (= (arr!23599 _values!688) (store mapRest!26306 mapKey!26306 mapValue!26306))))

(declare-fun b!857156 () Bool)

(declare-fun e!477760 () Bool)

(declare-fun tp_is_empty!16471 () Bool)

(assert (=> b!857156 (= e!477760 tp_is_empty!16471)))

(declare-fun b!857157 () Bool)

(declare-fun res!582231 () Bool)

(assert (=> b!857157 (=> (not res!582231) (not e!477755))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857157 (= res!582231 (validKeyInArray!0 k!854))))

(declare-fun b!857158 () Bool)

(assert (=> b!857158 (= e!477756 tp_is_empty!16471)))

(declare-fun b!857159 () Bool)

(declare-fun res!582237 () Bool)

(assert (=> b!857159 (=> (not res!582237) (not e!477755))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!857159 (= res!582237 (and (= (size!24039 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24038 _keys!868) (size!24039 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857160 () Bool)

(declare-fun res!582239 () Bool)

(assert (=> b!857160 (=> (not res!582239) (not e!477755))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857160 (= res!582239 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26306 () Bool)

(assert (=> mapIsEmpty!26306 mapRes!26306))

(declare-fun b!857161 () Bool)

(declare-fun res!582238 () Bool)

(assert (=> b!857161 (=> (not res!582238) (not e!477755))))

(declare-datatypes ((List!16735 0))(
  ( (Nil!16732) (Cons!16731 (h!17862 (_ BitVec 64)) (t!23376 List!16735)) )
))
(declare-fun arrayNoDuplicates!0 (array!49134 (_ BitVec 32) List!16735) Bool)

(assert (=> b!857161 (= res!582238 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16732))))

(declare-fun b!857162 () Bool)

(declare-fun e!477757 () Bool)

(assert (=> b!857162 (= e!477757 (not true))))

(declare-fun v!557 () V!27009)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!27009)

(declare-fun zeroValue!654 () V!27009)

(declare-fun lt!386196 () array!49136)

(declare-datatypes ((tuple2!10928 0))(
  ( (tuple2!10929 (_1!5475 (_ BitVec 64)) (_2!5475 V!27009)) )
))
(declare-datatypes ((List!16736 0))(
  ( (Nil!16733) (Cons!16732 (h!17863 tuple2!10928) (t!23377 List!16736)) )
))
(declare-datatypes ((ListLongMap!9697 0))(
  ( (ListLongMap!9698 (toList!4864 List!16736)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2845 (array!49134 array!49136 (_ BitVec 32) (_ BitVec 32) V!27009 V!27009 (_ BitVec 32) Int) ListLongMap!9697)

(declare-fun +!2218 (ListLongMap!9697 tuple2!10928) ListLongMap!9697)

(assert (=> b!857162 (= (getCurrentListMapNoExtraKeys!2845 _keys!868 lt!386196 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2218 (getCurrentListMapNoExtraKeys!2845 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10929 k!854 v!557)))))

(declare-datatypes ((Unit!29223 0))(
  ( (Unit!29224) )
))
(declare-fun lt!386197 () Unit!29223)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!439 (array!49134 array!49136 (_ BitVec 32) (_ BitVec 32) V!27009 V!27009 (_ BitVec 32) (_ BitVec 64) V!27009 (_ BitVec 32) Int) Unit!29223)

(assert (=> b!857162 (= lt!386197 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!439 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857163 () Bool)

(assert (=> b!857163 (= e!477755 e!477757)))

(declare-fun res!582233 () Bool)

(assert (=> b!857163 (=> (not res!582233) (not e!477757))))

(assert (=> b!857163 (= res!582233 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!386195 () ListLongMap!9697)

(assert (=> b!857163 (= lt!386195 (getCurrentListMapNoExtraKeys!2845 _keys!868 lt!386196 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!857163 (= lt!386196 (array!49137 (store (arr!23599 _values!688) i!612 (ValueCellFull!7796 v!557)) (size!24039 _values!688)))))

(declare-fun lt!386194 () ListLongMap!9697)

(assert (=> b!857163 (= lt!386194 (getCurrentListMapNoExtraKeys!2845 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857164 () Bool)

(declare-fun res!582234 () Bool)

(assert (=> b!857164 (=> (not res!582234) (not e!477755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49134 (_ BitVec 32)) Bool)

(assert (=> b!857164 (= res!582234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857165 () Bool)

(declare-fun res!582235 () Bool)

(assert (=> b!857165 (=> (not res!582235) (not e!477755))))

(assert (=> b!857165 (= res!582235 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24038 _keys!868))))))

(declare-fun res!582232 () Bool)

(assert (=> start!73420 (=> (not res!582232) (not e!477755))))

(assert (=> start!73420 (= res!582232 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24038 _keys!868))))))

(assert (=> start!73420 e!477755))

(assert (=> start!73420 tp_is_empty!16471))

(assert (=> start!73420 true))

(assert (=> start!73420 tp!50509))

(declare-fun array_inv!18688 (array!49134) Bool)

(assert (=> start!73420 (array_inv!18688 _keys!868)))

(declare-fun e!477759 () Bool)

(declare-fun array_inv!18689 (array!49136) Bool)

(assert (=> start!73420 (and (array_inv!18689 _values!688) e!477759)))

(declare-fun b!857155 () Bool)

(assert (=> b!857155 (= e!477759 (and e!477760 mapRes!26306))))

(declare-fun condMapEmpty!26306 () Bool)

(declare-fun mapDefault!26306 () ValueCell!7796)

