; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73324 () Bool)

(assert start!73324)

(declare-fun b_free!14257 () Bool)

(declare-fun b_next!14257 () Bool)

(assert (=> start!73324 (= b_free!14257 (not b_next!14257))))

(declare-fun tp!50276 () Bool)

(declare-fun b_and!23587 () Bool)

(assert (=> start!73324 (= tp!50276 b_and!23587)))

(declare-fun b!855527 () Bool)

(declare-fun e!476924 () Bool)

(assert (=> b!855527 (= e!476924 false)))

(declare-datatypes ((V!26905 0))(
  ( (V!26906 (val!8244 Int)) )
))
(declare-fun v!557 () V!26905)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10876 0))(
  ( (tuple2!10877 (_1!5449 (_ BitVec 64)) (_2!5449 V!26905)) )
))
(declare-datatypes ((List!16685 0))(
  ( (Nil!16682) (Cons!16681 (h!17812 tuple2!10876) (t!23317 List!16685)) )
))
(declare-datatypes ((ListLongMap!9635 0))(
  ( (ListLongMap!9636 (toList!4833 List!16685)) )
))
(declare-fun lt!385522 () ListLongMap!9635)

(declare-datatypes ((array!48969 0))(
  ( (array!48970 (arr!23516 (Array (_ BitVec 32) (_ BitVec 64))) (size!23958 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48969)

(declare-datatypes ((ValueCell!7757 0))(
  ( (ValueCellFull!7757 (v!10663 V!26905)) (EmptyCell!7757) )
))
(declare-datatypes ((array!48971 0))(
  ( (array!48972 (arr!23517 (Array (_ BitVec 32) ValueCell!7757)) (size!23959 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48971)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26905)

(declare-fun zeroValue!654 () V!26905)

(declare-fun getCurrentListMapNoExtraKeys!2840 (array!48969 array!48971 (_ BitVec 32) (_ BitVec 32) V!26905 V!26905 (_ BitVec 32) Int) ListLongMap!9635)

(assert (=> b!855527 (= lt!385522 (getCurrentListMapNoExtraKeys!2840 _keys!868 (array!48972 (store (arr!23517 _values!688) i!612 (ValueCellFull!7757 v!557)) (size!23959 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385523 () ListLongMap!9635)

(assert (=> b!855527 (= lt!385523 (getCurrentListMapNoExtraKeys!2840 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855528 () Bool)

(declare-fun res!581087 () Bool)

(assert (=> b!855528 (=> (not res!581087) (not e!476924))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855528 (= res!581087 (validKeyInArray!0 k0!854))))

(declare-fun b!855529 () Bool)

(declare-fun res!581089 () Bool)

(assert (=> b!855529 (=> (not res!581089) (not e!476924))))

(declare-datatypes ((List!16686 0))(
  ( (Nil!16683) (Cons!16682 (h!17813 (_ BitVec 64)) (t!23318 List!16686)) )
))
(declare-fun arrayNoDuplicates!0 (array!48969 (_ BitVec 32) List!16686) Bool)

(assert (=> b!855529 (= res!581089 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16683))))

(declare-fun b!855530 () Bool)

(declare-fun res!581084 () Bool)

(assert (=> b!855530 (=> (not res!581084) (not e!476924))))

(assert (=> b!855530 (= res!581084 (and (= (size!23959 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23958 _keys!868) (size!23959 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855531 () Bool)

(declare-fun res!581091 () Bool)

(assert (=> b!855531 (=> (not res!581091) (not e!476924))))

(assert (=> b!855531 (= res!581091 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23958 _keys!868))))))

(declare-fun b!855532 () Bool)

(declare-fun res!581085 () Bool)

(assert (=> b!855532 (=> (not res!581085) (not e!476924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48969 (_ BitVec 32)) Bool)

(assert (=> b!855532 (= res!581085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855533 () Bool)

(declare-fun res!581088 () Bool)

(assert (=> b!855533 (=> (not res!581088) (not e!476924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855533 (= res!581088 (validMask!0 mask!1196))))

(declare-fun res!581086 () Bool)

(assert (=> start!73324 (=> (not res!581086) (not e!476924))))

(assert (=> start!73324 (= res!581086 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23958 _keys!868))))))

(assert (=> start!73324 e!476924))

(declare-fun tp_is_empty!16393 () Bool)

(assert (=> start!73324 tp_is_empty!16393))

(assert (=> start!73324 true))

(assert (=> start!73324 tp!50276))

(declare-fun array_inv!18704 (array!48969) Bool)

(assert (=> start!73324 (array_inv!18704 _keys!868)))

(declare-fun e!476922 () Bool)

(declare-fun array_inv!18705 (array!48971) Bool)

(assert (=> start!73324 (and (array_inv!18705 _values!688) e!476922)))

(declare-fun mapIsEmpty!26189 () Bool)

(declare-fun mapRes!26189 () Bool)

(assert (=> mapIsEmpty!26189 mapRes!26189))

(declare-fun b!855534 () Bool)

(declare-fun e!476923 () Bool)

(assert (=> b!855534 (= e!476923 tp_is_empty!16393)))

(declare-fun mapNonEmpty!26189 () Bool)

(declare-fun tp!50275 () Bool)

(assert (=> mapNonEmpty!26189 (= mapRes!26189 (and tp!50275 e!476923))))

(declare-fun mapValue!26189 () ValueCell!7757)

(declare-fun mapKey!26189 () (_ BitVec 32))

(declare-fun mapRest!26189 () (Array (_ BitVec 32) ValueCell!7757))

(assert (=> mapNonEmpty!26189 (= (arr!23517 _values!688) (store mapRest!26189 mapKey!26189 mapValue!26189))))

(declare-fun b!855535 () Bool)

(declare-fun e!476925 () Bool)

(assert (=> b!855535 (= e!476925 tp_is_empty!16393)))

(declare-fun b!855536 () Bool)

(assert (=> b!855536 (= e!476922 (and e!476925 mapRes!26189))))

(declare-fun condMapEmpty!26189 () Bool)

(declare-fun mapDefault!26189 () ValueCell!7757)

(assert (=> b!855536 (= condMapEmpty!26189 (= (arr!23517 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7757)) mapDefault!26189)))))

(declare-fun b!855537 () Bool)

(declare-fun res!581090 () Bool)

(assert (=> b!855537 (=> (not res!581090) (not e!476924))))

(assert (=> b!855537 (= res!581090 (and (= (select (arr!23516 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73324 res!581086) b!855533))

(assert (= (and b!855533 res!581088) b!855530))

(assert (= (and b!855530 res!581084) b!855532))

(assert (= (and b!855532 res!581085) b!855529))

(assert (= (and b!855529 res!581089) b!855531))

(assert (= (and b!855531 res!581091) b!855528))

(assert (= (and b!855528 res!581087) b!855537))

(assert (= (and b!855537 res!581090) b!855527))

(assert (= (and b!855536 condMapEmpty!26189) mapIsEmpty!26189))

(assert (= (and b!855536 (not condMapEmpty!26189)) mapNonEmpty!26189))

(get-info :version)

(assert (= (and mapNonEmpty!26189 ((_ is ValueCellFull!7757) mapValue!26189)) b!855534))

(assert (= (and b!855536 ((_ is ValueCellFull!7757) mapDefault!26189)) b!855535))

(assert (= start!73324 b!855536))

(declare-fun m!796101 () Bool)

(assert (=> b!855527 m!796101))

(declare-fun m!796103 () Bool)

(assert (=> b!855527 m!796103))

(declare-fun m!796105 () Bool)

(assert (=> b!855527 m!796105))

(declare-fun m!796107 () Bool)

(assert (=> start!73324 m!796107))

(declare-fun m!796109 () Bool)

(assert (=> start!73324 m!796109))

(declare-fun m!796111 () Bool)

(assert (=> b!855537 m!796111))

(declare-fun m!796113 () Bool)

(assert (=> b!855528 m!796113))

(declare-fun m!796115 () Bool)

(assert (=> b!855529 m!796115))

(declare-fun m!796117 () Bool)

(assert (=> b!855533 m!796117))

(declare-fun m!796119 () Bool)

(assert (=> mapNonEmpty!26189 m!796119))

(declare-fun m!796121 () Bool)

(assert (=> b!855532 m!796121))

(check-sat (not b!855527) (not b!855533) tp_is_empty!16393 (not b!855528) (not b!855532) (not b!855529) b_and!23587 (not mapNonEmpty!26189) (not start!73324) (not b_next!14257))
(check-sat b_and!23587 (not b_next!14257))
