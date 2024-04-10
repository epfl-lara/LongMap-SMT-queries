; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74022 () Bool)

(assert start!74022)

(declare-fun b_free!14937 () Bool)

(declare-fun b_next!14937 () Bool)

(assert (=> start!74022 (= b_free!14937 (not b_next!14937))))

(declare-fun tp!52315 () Bool)

(declare-fun b_and!24689 () Bool)

(assert (=> start!74022 (= tp!52315 b_and!24689)))

(declare-fun b!870519 () Bool)

(declare-fun e!484732 () Bool)

(declare-fun e!484733 () Bool)

(assert (=> b!870519 (= e!484732 e!484733)))

(declare-fun res!591665 () Bool)

(assert (=> b!870519 (=> (not res!591665) (not e!484733))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!870519 (= res!591665 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!27811 0))(
  ( (V!27812 (val!8584 Int)) )
))
(declare-datatypes ((tuple2!11404 0))(
  ( (tuple2!11405 (_1!5713 (_ BitVec 64)) (_2!5713 V!27811)) )
))
(declare-datatypes ((List!17195 0))(
  ( (Nil!17192) (Cons!17191 (h!18322 tuple2!11404) (t!24232 List!17195)) )
))
(declare-datatypes ((ListLongMap!10173 0))(
  ( (ListLongMap!10174 (toList!5102 List!17195)) )
))
(declare-fun lt!395162 () ListLongMap!10173)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50290 0))(
  ( (array!50291 (arr!24176 (Array (_ BitVec 32) (_ BitVec 64))) (size!24616 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50290)

(declare-fun minValue!654 () V!27811)

(declare-fun zeroValue!654 () V!27811)

(declare-datatypes ((ValueCell!8097 0))(
  ( (ValueCellFull!8097 (v!11009 V!27811)) (EmptyCell!8097) )
))
(declare-datatypes ((array!50292 0))(
  ( (array!50293 (arr!24177 (Array (_ BitVec 32) ValueCell!8097)) (size!24617 (_ BitVec 32))) )
))
(declare-fun lt!395163 () array!50292)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3071 (array!50290 array!50292 (_ BitVec 32) (_ BitVec 32) V!27811 V!27811 (_ BitVec 32) Int) ListLongMap!10173)

(assert (=> b!870519 (= lt!395162 (getCurrentListMapNoExtraKeys!3071 _keys!868 lt!395163 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27811)

(declare-fun _values!688 () array!50292)

(assert (=> b!870519 (= lt!395163 (array!50293 (store (arr!24177 _values!688) i!612 (ValueCellFull!8097 v!557)) (size!24617 _values!688)))))

(declare-fun lt!395161 () ListLongMap!10173)

(assert (=> b!870519 (= lt!395161 (getCurrentListMapNoExtraKeys!3071 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!27209 () Bool)

(declare-fun mapRes!27209 () Bool)

(assert (=> mapIsEmpty!27209 mapRes!27209))

(declare-fun b!870520 () Bool)

(declare-fun res!591666 () Bool)

(assert (=> b!870520 (=> (not res!591666) (not e!484732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!870520 (= res!591666 (validMask!0 mask!1196))))

(declare-fun b!870521 () Bool)

(declare-fun res!591664 () Bool)

(assert (=> b!870521 (=> (not res!591664) (not e!484732))))

(assert (=> b!870521 (= res!591664 (and (= (size!24617 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24616 _keys!868) (size!24617 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!870522 () Bool)

(declare-fun res!591671 () Bool)

(assert (=> b!870522 (=> (not res!591671) (not e!484732))))

(assert (=> b!870522 (= res!591671 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24616 _keys!868))))))

(declare-fun mapNonEmpty!27209 () Bool)

(declare-fun tp!52314 () Bool)

(declare-fun e!484735 () Bool)

(assert (=> mapNonEmpty!27209 (= mapRes!27209 (and tp!52314 e!484735))))

(declare-fun mapValue!27209 () ValueCell!8097)

(declare-fun mapRest!27209 () (Array (_ BitVec 32) ValueCell!8097))

(declare-fun mapKey!27209 () (_ BitVec 32))

(assert (=> mapNonEmpty!27209 (= (arr!24177 _values!688) (store mapRest!27209 mapKey!27209 mapValue!27209))))

(declare-fun res!591663 () Bool)

(assert (=> start!74022 (=> (not res!591663) (not e!484732))))

(assert (=> start!74022 (= res!591663 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24616 _keys!868))))))

(assert (=> start!74022 e!484732))

(declare-fun tp_is_empty!17073 () Bool)

(assert (=> start!74022 tp_is_empty!17073))

(assert (=> start!74022 true))

(assert (=> start!74022 tp!52315))

(declare-fun array_inv!19090 (array!50290) Bool)

(assert (=> start!74022 (array_inv!19090 _keys!868)))

(declare-fun e!484731 () Bool)

(declare-fun array_inv!19091 (array!50292) Bool)

(assert (=> start!74022 (and (array_inv!19091 _values!688) e!484731)))

(declare-fun b!870523 () Bool)

(assert (=> b!870523 (= e!484735 tp_is_empty!17073)))

(declare-fun b!870524 () Bool)

(declare-fun res!591669 () Bool)

(assert (=> b!870524 (=> (not res!591669) (not e!484732))))

(declare-datatypes ((List!17196 0))(
  ( (Nil!17193) (Cons!17192 (h!18323 (_ BitVec 64)) (t!24233 List!17196)) )
))
(declare-fun arrayNoDuplicates!0 (array!50290 (_ BitVec 32) List!17196) Bool)

(assert (=> b!870524 (= res!591669 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17193))))

(declare-fun b!870525 () Bool)

(declare-fun e!484734 () Bool)

(assert (=> b!870525 (= e!484734 tp_is_empty!17073)))

(declare-fun b!870526 () Bool)

(declare-fun res!591667 () Bool)

(assert (=> b!870526 (=> (not res!591667) (not e!484732))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!870526 (= res!591667 (validKeyInArray!0 k0!854))))

(declare-fun b!870527 () Bool)

(declare-fun res!591670 () Bool)

(assert (=> b!870527 (=> (not res!591670) (not e!484732))))

(assert (=> b!870527 (= res!591670 (and (= (select (arr!24176 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!870528 () Bool)

(assert (=> b!870528 (= e!484731 (and e!484734 mapRes!27209))))

(declare-fun condMapEmpty!27209 () Bool)

(declare-fun mapDefault!27209 () ValueCell!8097)

(assert (=> b!870528 (= condMapEmpty!27209 (= (arr!24177 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8097)) mapDefault!27209)))))

(declare-fun b!870529 () Bool)

(assert (=> b!870529 (= e!484733 (not true))))

(declare-fun +!2439 (ListLongMap!10173 tuple2!11404) ListLongMap!10173)

(assert (=> b!870529 (= (getCurrentListMapNoExtraKeys!3071 _keys!868 lt!395163 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (+!2439 (getCurrentListMapNoExtraKeys!3071 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11405 k0!854 v!557)))))

(declare-datatypes ((Unit!29876 0))(
  ( (Unit!29877) )
))
(declare-fun lt!395164 () Unit!29876)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!633 (array!50290 array!50292 (_ BitVec 32) (_ BitVec 32) V!27811 V!27811 (_ BitVec 32) (_ BitVec 64) V!27811 (_ BitVec 32) Int) Unit!29876)

(assert (=> b!870529 (= lt!395164 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!633 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!870530 () Bool)

(declare-fun res!591668 () Bool)

(assert (=> b!870530 (=> (not res!591668) (not e!484732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50290 (_ BitVec 32)) Bool)

(assert (=> b!870530 (= res!591668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74022 res!591663) b!870520))

(assert (= (and b!870520 res!591666) b!870521))

(assert (= (and b!870521 res!591664) b!870530))

(assert (= (and b!870530 res!591668) b!870524))

(assert (= (and b!870524 res!591669) b!870522))

(assert (= (and b!870522 res!591671) b!870526))

(assert (= (and b!870526 res!591667) b!870527))

(assert (= (and b!870527 res!591670) b!870519))

(assert (= (and b!870519 res!591665) b!870529))

(assert (= (and b!870528 condMapEmpty!27209) mapIsEmpty!27209))

(assert (= (and b!870528 (not condMapEmpty!27209)) mapNonEmpty!27209))

(get-info :version)

(assert (= (and mapNonEmpty!27209 ((_ is ValueCellFull!8097) mapValue!27209)) b!870523))

(assert (= (and b!870528 ((_ is ValueCellFull!8097) mapDefault!27209)) b!870525))

(assert (= start!74022 b!870528))

(declare-fun m!811877 () Bool)

(assert (=> b!870527 m!811877))

(declare-fun m!811879 () Bool)

(assert (=> b!870519 m!811879))

(declare-fun m!811881 () Bool)

(assert (=> b!870519 m!811881))

(declare-fun m!811883 () Bool)

(assert (=> b!870519 m!811883))

(declare-fun m!811885 () Bool)

(assert (=> mapNonEmpty!27209 m!811885))

(declare-fun m!811887 () Bool)

(assert (=> b!870524 m!811887))

(declare-fun m!811889 () Bool)

(assert (=> b!870530 m!811889))

(declare-fun m!811891 () Bool)

(assert (=> start!74022 m!811891))

(declare-fun m!811893 () Bool)

(assert (=> start!74022 m!811893))

(declare-fun m!811895 () Bool)

(assert (=> b!870529 m!811895))

(declare-fun m!811897 () Bool)

(assert (=> b!870529 m!811897))

(assert (=> b!870529 m!811897))

(declare-fun m!811899 () Bool)

(assert (=> b!870529 m!811899))

(declare-fun m!811901 () Bool)

(assert (=> b!870529 m!811901))

(declare-fun m!811903 () Bool)

(assert (=> b!870526 m!811903))

(declare-fun m!811905 () Bool)

(assert (=> b!870520 m!811905))

(check-sat (not b!870519) (not b!870529) (not start!74022) (not b!870530) (not b!870524) (not b!870526) (not mapNonEmpty!27209) tp_is_empty!17073 (not b_next!14937) b_and!24689 (not b!870520))
(check-sat b_and!24689 (not b_next!14937))
