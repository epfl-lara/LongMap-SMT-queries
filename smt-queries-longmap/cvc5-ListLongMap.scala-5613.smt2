; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73462 () Bool)

(assert start!73462)

(declare-fun b_free!14377 () Bool)

(declare-fun b_next!14377 () Bool)

(assert (=> start!73462 (= b_free!14377 (not b_next!14377))))

(declare-fun tp!50635 () Bool)

(declare-fun b_and!23733 () Bool)

(assert (=> start!73462 (= tp!50635 b_and!23733)))

(declare-fun res!582817 () Bool)

(declare-fun e!478149 () Bool)

(assert (=> start!73462 (=> (not res!582817) (not e!478149))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49214 0))(
  ( (array!49215 (arr!23638 (Array (_ BitVec 32) (_ BitVec 64))) (size!24078 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49214)

(assert (=> start!73462 (= res!582817 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24078 _keys!868))))))

(assert (=> start!73462 e!478149))

(declare-fun tp_is_empty!16513 () Bool)

(assert (=> start!73462 tp_is_empty!16513))

(assert (=> start!73462 true))

(assert (=> start!73462 tp!50635))

(declare-fun array_inv!18722 (array!49214) Bool)

(assert (=> start!73462 (array_inv!18722 _keys!868)))

(declare-datatypes ((V!27065 0))(
  ( (V!27066 (val!8304 Int)) )
))
(declare-datatypes ((ValueCell!7817 0))(
  ( (ValueCellFull!7817 (v!10729 V!27065)) (EmptyCell!7817) )
))
(declare-datatypes ((array!49216 0))(
  ( (array!49217 (arr!23639 (Array (_ BitVec 32) ValueCell!7817)) (size!24079 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49216)

(declare-fun e!478144 () Bool)

(declare-fun array_inv!18723 (array!49216) Bool)

(assert (=> start!73462 (and (array_inv!18723 _values!688) e!478144)))

(declare-fun b!857921 () Bool)

(declare-fun res!582814 () Bool)

(assert (=> b!857921 (=> (not res!582814) (not e!478149))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!857921 (= res!582814 (and (= (size!24079 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24078 _keys!868) (size!24079 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857922 () Bool)

(declare-fun e!478150 () Bool)

(assert (=> b!857922 (= e!478150 tp_is_empty!16513)))

(declare-fun mapIsEmpty!26369 () Bool)

(declare-fun mapRes!26369 () Bool)

(assert (=> mapIsEmpty!26369 mapRes!26369))

(declare-fun mapNonEmpty!26369 () Bool)

(declare-fun tp!50634 () Bool)

(declare-fun e!478147 () Bool)

(assert (=> mapNonEmpty!26369 (= mapRes!26369 (and tp!50634 e!478147))))

(declare-fun mapRest!26369 () (Array (_ BitVec 32) ValueCell!7817))

(declare-fun mapKey!26369 () (_ BitVec 32))

(declare-fun mapValue!26369 () ValueCell!7817)

(assert (=> mapNonEmpty!26369 (= (arr!23639 _values!688) (store mapRest!26369 mapKey!26369 mapValue!26369))))

(declare-fun b!857923 () Bool)

(declare-fun res!582813 () Bool)

(assert (=> b!857923 (=> (not res!582813) (not e!478149))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857923 (= res!582813 (validMask!0 mask!1196))))

(declare-fun b!857924 () Bool)

(declare-fun res!582818 () Bool)

(assert (=> b!857924 (=> (not res!582818) (not e!478149))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857924 (= res!582818 (validKeyInArray!0 k!854))))

(declare-fun b!857925 () Bool)

(declare-fun res!582810 () Bool)

(assert (=> b!857925 (=> (not res!582810) (not e!478149))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49214 (_ BitVec 32)) Bool)

(assert (=> b!857925 (= res!582810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857926 () Bool)

(declare-fun res!582816 () Bool)

(assert (=> b!857926 (=> (not res!582816) (not e!478149))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!857926 (= res!582816 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24078 _keys!868))))))

(declare-fun b!857927 () Bool)

(declare-fun e!478146 () Bool)

(assert (=> b!857927 (= e!478149 e!478146)))

(declare-fun res!582815 () Bool)

(assert (=> b!857927 (=> (not res!582815) (not e!478146))))

(assert (=> b!857927 (= res!582815 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386456 () array!49216)

(declare-datatypes ((tuple2!10958 0))(
  ( (tuple2!10959 (_1!5490 (_ BitVec 64)) (_2!5490 V!27065)) )
))
(declare-datatypes ((List!16765 0))(
  ( (Nil!16762) (Cons!16761 (h!17892 tuple2!10958) (t!23408 List!16765)) )
))
(declare-datatypes ((ListLongMap!9727 0))(
  ( (ListLongMap!9728 (toList!4879 List!16765)) )
))
(declare-fun lt!386454 () ListLongMap!9727)

(declare-fun minValue!654 () V!27065)

(declare-fun zeroValue!654 () V!27065)

(declare-fun getCurrentListMapNoExtraKeys!2860 (array!49214 array!49216 (_ BitVec 32) (_ BitVec 32) V!27065 V!27065 (_ BitVec 32) Int) ListLongMap!9727)

(assert (=> b!857927 (= lt!386454 (getCurrentListMapNoExtraKeys!2860 _keys!868 lt!386456 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27065)

(assert (=> b!857927 (= lt!386456 (array!49217 (store (arr!23639 _values!688) i!612 (ValueCellFull!7817 v!557)) (size!24079 _values!688)))))

(declare-fun lt!386457 () ListLongMap!9727)

(assert (=> b!857927 (= lt!386457 (getCurrentListMapNoExtraKeys!2860 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857928 () Bool)

(declare-fun res!582812 () Bool)

(assert (=> b!857928 (=> (not res!582812) (not e!478149))))

(declare-datatypes ((List!16766 0))(
  ( (Nil!16763) (Cons!16762 (h!17893 (_ BitVec 64)) (t!23409 List!16766)) )
))
(declare-fun arrayNoDuplicates!0 (array!49214 (_ BitVec 32) List!16766) Bool)

(assert (=> b!857928 (= res!582812 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16763))))

(declare-fun b!857929 () Bool)

(declare-fun e!478145 () Bool)

(assert (=> b!857929 (= e!478146 (not e!478145))))

(declare-fun res!582811 () Bool)

(assert (=> b!857929 (=> res!582811 e!478145)))

(assert (=> b!857929 (= res!582811 (not (validKeyInArray!0 (select (arr!23638 _keys!868) from!1053))))))

(declare-fun lt!386453 () ListLongMap!9727)

(declare-fun lt!386452 () ListLongMap!9727)

(assert (=> b!857929 (= lt!386453 lt!386452)))

(declare-fun lt!386455 () ListLongMap!9727)

(declare-fun +!2232 (ListLongMap!9727 tuple2!10958) ListLongMap!9727)

(assert (=> b!857929 (= lt!386452 (+!2232 lt!386455 (tuple2!10959 k!854 v!557)))))

(assert (=> b!857929 (= lt!386453 (getCurrentListMapNoExtraKeys!2860 _keys!868 lt!386456 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!857929 (= lt!386455 (getCurrentListMapNoExtraKeys!2860 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29251 0))(
  ( (Unit!29252) )
))
(declare-fun lt!386458 () Unit!29251)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!453 (array!49214 array!49216 (_ BitVec 32) (_ BitVec 32) V!27065 V!27065 (_ BitVec 32) (_ BitVec 64) V!27065 (_ BitVec 32) Int) Unit!29251)

(assert (=> b!857929 (= lt!386458 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!453 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857930 () Bool)

(assert (=> b!857930 (= e!478144 (and e!478150 mapRes!26369))))

(declare-fun condMapEmpty!26369 () Bool)

(declare-fun mapDefault!26369 () ValueCell!7817)

