; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73786 () Bool)

(assert start!73786)

(declare-fun b_free!14701 () Bool)

(declare-fun b_next!14701 () Bool)

(assert (=> start!73786 (= b_free!14701 (not b_next!14701))))

(declare-fun tp!51606 () Bool)

(declare-fun b_and!24381 () Bool)

(assert (=> start!73786 (= tp!51606 b_and!24381)))

(declare-fun b!865775 () Bool)

(declare-fun res!588275 () Bool)

(declare-fun e!482290 () Bool)

(assert (=> b!865775 (=> (not res!588275) (not e!482290))))

(declare-datatypes ((array!49834 0))(
  ( (array!49835 (arr!23948 (Array (_ BitVec 32) (_ BitVec 64))) (size!24388 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49834)

(declare-datatypes ((List!17025 0))(
  ( (Nil!17022) (Cons!17021 (h!18152 (_ BitVec 64)) (t!23992 List!17025)) )
))
(declare-fun arrayNoDuplicates!0 (array!49834 (_ BitVec 32) List!17025) Bool)

(assert (=> b!865775 (= res!588275 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17022))))

(declare-fun b!865776 () Bool)

(declare-datatypes ((Unit!29661 0))(
  ( (Unit!29662) )
))
(declare-fun e!482292 () Unit!29661)

(declare-fun Unit!29663 () Unit!29661)

(assert (=> b!865776 (= e!482292 Unit!29663)))

(declare-fun b!865777 () Bool)

(declare-fun res!588266 () Bool)

(assert (=> b!865777 (=> (not res!588266) (not e!482290))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!865777 (= res!588266 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!26855 () Bool)

(declare-fun mapRes!26855 () Bool)

(assert (=> mapIsEmpty!26855 mapRes!26855))

(declare-fun b!865778 () Bool)

(declare-fun e!482294 () Bool)

(declare-fun tp_is_empty!16837 () Bool)

(assert (=> b!865778 (= e!482294 tp_is_empty!16837)))

(declare-fun b!865779 () Bool)

(declare-fun res!588270 () Bool)

(assert (=> b!865779 (=> (not res!588270) (not e!482290))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!865779 (= res!588270 (validMask!0 mask!1196))))

(declare-fun b!865780 () Bool)

(declare-fun e!482291 () Bool)

(assert (=> b!865780 (= e!482291 true)))

(declare-datatypes ((V!27497 0))(
  ( (V!27498 (val!8466 Int)) )
))
(declare-datatypes ((tuple2!11222 0))(
  ( (tuple2!11223 (_1!5622 (_ BitVec 64)) (_2!5622 V!27497)) )
))
(declare-datatypes ((List!17026 0))(
  ( (Nil!17023) (Cons!17022 (h!18153 tuple2!11222) (t!23993 List!17026)) )
))
(declare-datatypes ((ListLongMap!9991 0))(
  ( (ListLongMap!9992 (toList!5011 List!17026)) )
))
(declare-fun lt!392482 () ListLongMap!9991)

(declare-fun lt!392479 () ListLongMap!9991)

(declare-fun lt!392474 () tuple2!11222)

(declare-fun lt!392477 () tuple2!11222)

(declare-fun +!2360 (ListLongMap!9991 tuple2!11222) ListLongMap!9991)

(assert (=> b!865780 (= lt!392479 (+!2360 (+!2360 lt!392482 lt!392474) lt!392477))))

(declare-fun lt!392485 () Unit!29661)

(declare-fun v!557 () V!27497)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun lt!392483 () V!27497)

(declare-fun addCommutativeForDiffKeys!529 (ListLongMap!9991 (_ BitVec 64) V!27497 (_ BitVec 64) V!27497) Unit!29661)

(assert (=> b!865780 (= lt!392485 (addCommutativeForDiffKeys!529 lt!392482 k!854 v!557 (select (arr!23948 _keys!868) from!1053) lt!392483))))

(declare-fun b!865781 () Bool)

(declare-fun res!588273 () Bool)

(assert (=> b!865781 (=> (not res!588273) (not e!482290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49834 (_ BitVec 32)) Bool)

(assert (=> b!865781 (= res!588273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!865782 () Bool)

(declare-fun e!482295 () Bool)

(assert (=> b!865782 (= e!482295 tp_is_empty!16837)))

(declare-fun b!865783 () Bool)

(declare-fun e!482288 () Bool)

(assert (=> b!865783 (= e!482290 e!482288)))

(declare-fun res!588267 () Bool)

(assert (=> b!865783 (=> (not res!588267) (not e!482288))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!865783 (= res!588267 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7979 0))(
  ( (ValueCellFull!7979 (v!10891 V!27497)) (EmptyCell!7979) )
))
(declare-datatypes ((array!49836 0))(
  ( (array!49837 (arr!23949 (Array (_ BitVec 32) ValueCell!7979)) (size!24389 (_ BitVec 32))) )
))
(declare-fun lt!392473 () array!49836)

(declare-fun lt!392475 () ListLongMap!9991)

(declare-fun minValue!654 () V!27497)

(declare-fun zeroValue!654 () V!27497)

(declare-fun getCurrentListMapNoExtraKeys!2982 (array!49834 array!49836 (_ BitVec 32) (_ BitVec 32) V!27497 V!27497 (_ BitVec 32) Int) ListLongMap!9991)

(assert (=> b!865783 (= lt!392475 (getCurrentListMapNoExtraKeys!2982 _keys!868 lt!392473 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!49836)

(assert (=> b!865783 (= lt!392473 (array!49837 (store (arr!23949 _values!688) i!612 (ValueCellFull!7979 v!557)) (size!24389 _values!688)))))

(declare-fun lt!392480 () ListLongMap!9991)

(assert (=> b!865783 (= lt!392480 (getCurrentListMapNoExtraKeys!2982 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!865784 () Bool)

(declare-fun res!588274 () Bool)

(assert (=> b!865784 (=> (not res!588274) (not e!482290))))

(assert (=> b!865784 (= res!588274 (and (= (size!24389 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24388 _keys!868) (size!24389 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26855 () Bool)

(declare-fun tp!51607 () Bool)

(assert (=> mapNonEmpty!26855 (= mapRes!26855 (and tp!51607 e!482294))))

(declare-fun mapRest!26855 () (Array (_ BitVec 32) ValueCell!7979))

(declare-fun mapValue!26855 () ValueCell!7979)

(declare-fun mapKey!26855 () (_ BitVec 32))

(assert (=> mapNonEmpty!26855 (= (arr!23949 _values!688) (store mapRest!26855 mapKey!26855 mapValue!26855))))

(declare-fun res!588271 () Bool)

(assert (=> start!73786 (=> (not res!588271) (not e!482290))))

(assert (=> start!73786 (= res!588271 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24388 _keys!868))))))

(assert (=> start!73786 e!482290))

(assert (=> start!73786 tp_is_empty!16837))

(assert (=> start!73786 true))

(assert (=> start!73786 tp!51606))

(declare-fun array_inv!18932 (array!49834) Bool)

(assert (=> start!73786 (array_inv!18932 _keys!868)))

(declare-fun e!482289 () Bool)

(declare-fun array_inv!18933 (array!49836) Bool)

(assert (=> start!73786 (and (array_inv!18933 _values!688) e!482289)))

(declare-fun b!865785 () Bool)

(assert (=> b!865785 (= e!482289 (and e!482295 mapRes!26855))))

(declare-fun condMapEmpty!26855 () Bool)

(declare-fun mapDefault!26855 () ValueCell!7979)

