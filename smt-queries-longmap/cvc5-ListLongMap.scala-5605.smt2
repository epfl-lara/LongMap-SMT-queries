; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73414 () Bool)

(assert start!73414)

(declare-fun b_free!14329 () Bool)

(declare-fun b_next!14329 () Bool)

(assert (=> start!73414 (= b_free!14329 (not b_next!14329))))

(declare-fun tp!50491 () Bool)

(declare-fun b_and!23685 () Bool)

(assert (=> start!73414 (= tp!50491 b_and!23685)))

(declare-fun b!857046 () Bool)

(declare-fun res!582152 () Bool)

(declare-fun e!477706 () Bool)

(assert (=> b!857046 (=> (not res!582152) (not e!477706))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857046 (= res!582152 (validMask!0 mask!1196))))

(declare-fun b!857047 () Bool)

(declare-fun res!582155 () Bool)

(assert (=> b!857047 (=> (not res!582155) (not e!477706))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857047 (= res!582155 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26297 () Bool)

(declare-fun mapRes!26297 () Bool)

(assert (=> mapIsEmpty!26297 mapRes!26297))

(declare-fun res!582156 () Bool)

(assert (=> start!73414 (=> (not res!582156) (not e!477706))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!49122 0))(
  ( (array!49123 (arr!23592 (Array (_ BitVec 32) (_ BitVec 64))) (size!24032 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49122)

(assert (=> start!73414 (= res!582156 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24032 _keys!868))))))

(assert (=> start!73414 e!477706))

(declare-fun tp_is_empty!16465 () Bool)

(assert (=> start!73414 tp_is_empty!16465))

(assert (=> start!73414 true))

(assert (=> start!73414 tp!50491))

(declare-fun array_inv!18684 (array!49122) Bool)

(assert (=> start!73414 (array_inv!18684 _keys!868)))

(declare-datatypes ((V!27001 0))(
  ( (V!27002 (val!8280 Int)) )
))
(declare-datatypes ((ValueCell!7793 0))(
  ( (ValueCellFull!7793 (v!10705 V!27001)) (EmptyCell!7793) )
))
(declare-datatypes ((array!49124 0))(
  ( (array!49125 (arr!23593 (Array (_ BitVec 32) ValueCell!7793)) (size!24033 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49124)

(declare-fun e!477702 () Bool)

(declare-fun array_inv!18685 (array!49124) Bool)

(assert (=> start!73414 (and (array_inv!18685 _values!688) e!477702)))

(declare-fun b!857048 () Bool)

(declare-fun res!582157 () Bool)

(assert (=> b!857048 (=> (not res!582157) (not e!477706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49122 (_ BitVec 32)) Bool)

(assert (=> b!857048 (= res!582157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857049 () Bool)

(declare-fun res!582154 () Bool)

(assert (=> b!857049 (=> (not res!582154) (not e!477706))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!857049 (= res!582154 (and (= (size!24033 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24032 _keys!868) (size!24033 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!857050 () Bool)

(declare-fun e!477703 () Bool)

(assert (=> b!857050 (= e!477703 tp_is_empty!16465)))

(declare-fun b!857051 () Bool)

(declare-fun e!477705 () Bool)

(assert (=> b!857051 (= e!477705 (not true))))

(declare-fun v!557 () V!27001)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!386161 () array!49124)

(declare-fun minValue!654 () V!27001)

(declare-fun zeroValue!654 () V!27001)

(declare-datatypes ((tuple2!10922 0))(
  ( (tuple2!10923 (_1!5472 (_ BitVec 64)) (_2!5472 V!27001)) )
))
(declare-datatypes ((List!16731 0))(
  ( (Nil!16728) (Cons!16727 (h!17858 tuple2!10922) (t!23372 List!16731)) )
))
(declare-datatypes ((ListLongMap!9691 0))(
  ( (ListLongMap!9692 (toList!4861 List!16731)) )
))
(declare-fun getCurrentListMapNoExtraKeys!2842 (array!49122 array!49124 (_ BitVec 32) (_ BitVec 32) V!27001 V!27001 (_ BitVec 32) Int) ListLongMap!9691)

(declare-fun +!2215 (ListLongMap!9691 tuple2!10922) ListLongMap!9691)

(assert (=> b!857051 (= (getCurrentListMapNoExtraKeys!2842 _keys!868 lt!386161 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2215 (getCurrentListMapNoExtraKeys!2842 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10923 k!854 v!557)))))

(declare-datatypes ((Unit!29217 0))(
  ( (Unit!29218) )
))
(declare-fun lt!386158 () Unit!29217)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!436 (array!49122 array!49124 (_ BitVec 32) (_ BitVec 32) V!27001 V!27001 (_ BitVec 32) (_ BitVec 64) V!27001 (_ BitVec 32) Int) Unit!29217)

(assert (=> b!857051 (= lt!386158 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!436 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!26297 () Bool)

(declare-fun tp!50490 () Bool)

(declare-fun e!477701 () Bool)

(assert (=> mapNonEmpty!26297 (= mapRes!26297 (and tp!50490 e!477701))))

(declare-fun mapKey!26297 () (_ BitVec 32))

(declare-fun mapRest!26297 () (Array (_ BitVec 32) ValueCell!7793))

(declare-fun mapValue!26297 () ValueCell!7793)

(assert (=> mapNonEmpty!26297 (= (arr!23593 _values!688) (store mapRest!26297 mapKey!26297 mapValue!26297))))

(declare-fun b!857052 () Bool)

(assert (=> b!857052 (= e!477702 (and e!477703 mapRes!26297))))

(declare-fun condMapEmpty!26297 () Bool)

(declare-fun mapDefault!26297 () ValueCell!7793)

