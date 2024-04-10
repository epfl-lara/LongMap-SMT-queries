; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73448 () Bool)

(assert start!73448)

(declare-fun b_free!14363 () Bool)

(declare-fun b_next!14363 () Bool)

(assert (=> start!73448 (= b_free!14363 (not b_next!14363))))

(declare-fun tp!50592 () Bool)

(declare-fun b_and!23719 () Bool)

(assert (=> start!73448 (= tp!50592 b_and!23719)))

(declare-fun b!857658 () Bool)

(declare-fun e!478008 () Bool)

(declare-fun tp_is_empty!16499 () Bool)

(assert (=> b!857658 (= e!478008 tp_is_empty!16499)))

(declare-fun b!857659 () Bool)

(declare-fun e!478011 () Bool)

(assert (=> b!857659 (= e!478011 tp_is_empty!16499)))

(declare-fun b!857660 () Bool)

(declare-fun res!582610 () Bool)

(declare-fun e!478007 () Bool)

(assert (=> b!857660 (=> (not res!582610) (not e!478007))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49188 0))(
  ( (array!49189 (arr!23625 (Array (_ BitVec 32) (_ BitVec 64))) (size!24065 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49188)

(assert (=> b!857660 (= res!582610 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24065 _keys!868))))))

(declare-fun mapIsEmpty!26348 () Bool)

(declare-fun mapRes!26348 () Bool)

(assert (=> mapIsEmpty!26348 mapRes!26348))

(declare-fun res!582611 () Bool)

(assert (=> start!73448 (=> (not res!582611) (not e!478007))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73448 (= res!582611 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24065 _keys!868))))))

(assert (=> start!73448 e!478007))

(assert (=> start!73448 tp_is_empty!16499))

(assert (=> start!73448 true))

(assert (=> start!73448 tp!50592))

(declare-fun array_inv!18710 (array!49188) Bool)

(assert (=> start!73448 (array_inv!18710 _keys!868)))

(declare-datatypes ((V!27045 0))(
  ( (V!27046 (val!8297 Int)) )
))
(declare-datatypes ((ValueCell!7810 0))(
  ( (ValueCellFull!7810 (v!10722 V!27045)) (EmptyCell!7810) )
))
(declare-datatypes ((array!49190 0))(
  ( (array!49191 (arr!23626 (Array (_ BitVec 32) ValueCell!7810)) (size!24066 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49190)

(declare-fun e!478010 () Bool)

(declare-fun array_inv!18711 (array!49190) Bool)

(assert (=> start!73448 (and (array_inv!18711 _values!688) e!478010)))

(declare-fun b!857661 () Bool)

(declare-fun e!478012 () Bool)

(assert (=> b!857661 (= e!478007 e!478012)))

(declare-fun res!582614 () Bool)

(assert (=> b!857661 (=> (not res!582614) (not e!478012))))

(assert (=> b!857661 (= res!582614 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!386365 () array!49190)

(declare-datatypes ((tuple2!10946 0))(
  ( (tuple2!10947 (_1!5484 (_ BitVec 64)) (_2!5484 V!27045)) )
))
(declare-datatypes ((List!16754 0))(
  ( (Nil!16751) (Cons!16750 (h!17881 tuple2!10946) (t!23395 List!16754)) )
))
(declare-datatypes ((ListLongMap!9715 0))(
  ( (ListLongMap!9716 (toList!4873 List!16754)) )
))
(declare-fun lt!386362 () ListLongMap!9715)

(declare-fun minValue!654 () V!27045)

(declare-fun zeroValue!654 () V!27045)

(declare-fun getCurrentListMapNoExtraKeys!2854 (array!49188 array!49190 (_ BitVec 32) (_ BitVec 32) V!27045 V!27045 (_ BitVec 32) Int) ListLongMap!9715)

(assert (=> b!857661 (= lt!386362 (getCurrentListMapNoExtraKeys!2854 _keys!868 lt!386365 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27045)

(assert (=> b!857661 (= lt!386365 (array!49191 (store (arr!23626 _values!688) i!612 (ValueCellFull!7810 v!557)) (size!24066 _values!688)))))

(declare-fun lt!386363 () ListLongMap!9715)

(assert (=> b!857661 (= lt!386363 (getCurrentListMapNoExtraKeys!2854 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!857662 () Bool)

(declare-fun res!582616 () Bool)

(assert (=> b!857662 (=> (not res!582616) (not e!478007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49188 (_ BitVec 32)) Bool)

(assert (=> b!857662 (= res!582616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857663 () Bool)

(declare-fun res!582612 () Bool)

(assert (=> b!857663 (=> (not res!582612) (not e!478007))))

(assert (=> b!857663 (= res!582612 (and (= (size!24066 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24065 _keys!868) (size!24066 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857664 () Bool)

(assert (=> b!857664 (= e!478012 (not true))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun +!2227 (ListLongMap!9715 tuple2!10946) ListLongMap!9715)

(assert (=> b!857664 (= (getCurrentListMapNoExtraKeys!2854 _keys!868 lt!386365 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2227 (getCurrentListMapNoExtraKeys!2854 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10947 k!854 v!557)))))

(declare-datatypes ((Unit!29241 0))(
  ( (Unit!29242) )
))
(declare-fun lt!386364 () Unit!29241)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!448 (array!49188 array!49190 (_ BitVec 32) (_ BitVec 32) V!27045 V!27045 (_ BitVec 32) (_ BitVec 64) V!27045 (_ BitVec 32) Int) Unit!29241)

(assert (=> b!857664 (= lt!386364 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!448 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!857665 () Bool)

(declare-fun res!582615 () Bool)

(assert (=> b!857665 (=> (not res!582615) (not e!478007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857665 (= res!582615 (validMask!0 mask!1196))))

(declare-fun b!857666 () Bool)

(declare-fun res!582609 () Bool)

(assert (=> b!857666 (=> (not res!582609) (not e!478007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857666 (= res!582609 (validKeyInArray!0 k!854))))

(declare-fun b!857667 () Bool)

(declare-fun res!582617 () Bool)

(assert (=> b!857667 (=> (not res!582617) (not e!478007))))

(declare-datatypes ((List!16755 0))(
  ( (Nil!16752) (Cons!16751 (h!17882 (_ BitVec 64)) (t!23396 List!16755)) )
))
(declare-fun arrayNoDuplicates!0 (array!49188 (_ BitVec 32) List!16755) Bool)

(assert (=> b!857667 (= res!582617 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16752))))

(declare-fun mapNonEmpty!26348 () Bool)

(declare-fun tp!50593 () Bool)

(assert (=> mapNonEmpty!26348 (= mapRes!26348 (and tp!50593 e!478008))))

(declare-fun mapRest!26348 () (Array (_ BitVec 32) ValueCell!7810))

(declare-fun mapValue!26348 () ValueCell!7810)

(declare-fun mapKey!26348 () (_ BitVec 32))

(assert (=> mapNonEmpty!26348 (= (arr!23626 _values!688) (store mapRest!26348 mapKey!26348 mapValue!26348))))

(declare-fun b!857668 () Bool)

(declare-fun res!582613 () Bool)

(assert (=> b!857668 (=> (not res!582613) (not e!478007))))

(assert (=> b!857668 (= res!582613 (and (= (select (arr!23625 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!857669 () Bool)

(assert (=> b!857669 (= e!478010 (and e!478011 mapRes!26348))))

(declare-fun condMapEmpty!26348 () Bool)

(declare-fun mapDefault!26348 () ValueCell!7810)

