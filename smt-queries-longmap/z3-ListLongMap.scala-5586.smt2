; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73468 () Bool)

(assert start!73468)

(declare-fun b_free!14215 () Bool)

(declare-fun b_next!14215 () Bool)

(assert (=> start!73468 (= b_free!14215 (not b_next!14215))))

(declare-fun tp!50150 () Bool)

(declare-fun b_and!23581 () Bool)

(assert (=> start!73468 (= tp!50150 b_and!23581)))

(declare-fun mapIsEmpty!26126 () Bool)

(declare-fun mapRes!26126 () Bool)

(assert (=> mapIsEmpty!26126 mapRes!26126))

(declare-fun b!855976 () Bool)

(declare-fun res!581038 () Bool)

(declare-fun e!477338 () Bool)

(assert (=> b!855976 (=> (not res!581038) (not e!477338))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855976 (= res!581038 (validMask!0 mask!1196))))

(declare-fun b!855977 () Bool)

(declare-fun e!477337 () Bool)

(declare-fun tp_is_empty!16351 () Bool)

(assert (=> b!855977 (= e!477337 tp_is_empty!16351)))

(declare-fun b!855978 () Bool)

(declare-fun e!477340 () Bool)

(assert (=> b!855978 (= e!477340 tp_is_empty!16351)))

(declare-fun b!855979 () Bool)

(declare-fun res!581039 () Bool)

(assert (=> b!855979 (=> (not res!581039) (not e!477338))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48947 0))(
  ( (array!48948 (arr!23500 (Array (_ BitVec 32) (_ BitVec 64))) (size!23941 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48947)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!855979 (= res!581039 (and (= (select (arr!23500 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!581041 () Bool)

(assert (=> start!73468 (=> (not res!581041) (not e!477338))))

(assert (=> start!73468 (= res!581041 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23941 _keys!868))))))

(assert (=> start!73468 e!477338))

(assert (=> start!73468 tp_is_empty!16351))

(assert (=> start!73468 true))

(assert (=> start!73468 tp!50150))

(declare-fun array_inv!18672 (array!48947) Bool)

(assert (=> start!73468 (array_inv!18672 _keys!868)))

(declare-datatypes ((V!26849 0))(
  ( (V!26850 (val!8223 Int)) )
))
(declare-datatypes ((ValueCell!7736 0))(
  ( (ValueCellFull!7736 (v!10648 V!26849)) (EmptyCell!7736) )
))
(declare-datatypes ((array!48949 0))(
  ( (array!48950 (arr!23501 (Array (_ BitVec 32) ValueCell!7736)) (size!23942 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48949)

(declare-fun e!477336 () Bool)

(declare-fun array_inv!18673 (array!48949) Bool)

(assert (=> start!73468 (and (array_inv!18673 _values!688) e!477336)))

(declare-fun b!855980 () Bool)

(declare-fun res!581040 () Bool)

(assert (=> b!855980 (=> (not res!581040) (not e!477338))))

(assert (=> b!855980 (= res!581040 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23941 _keys!868))))))

(declare-fun b!855981 () Bool)

(declare-fun res!581034 () Bool)

(assert (=> b!855981 (=> (not res!581034) (not e!477338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855981 (= res!581034 (validKeyInArray!0 k0!854))))

(declare-fun b!855982 () Bool)

(assert (=> b!855982 (= e!477336 (and e!477337 mapRes!26126))))

(declare-fun condMapEmpty!26126 () Bool)

(declare-fun mapDefault!26126 () ValueCell!7736)

(assert (=> b!855982 (= condMapEmpty!26126 (= (arr!23501 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7736)) mapDefault!26126)))))

(declare-fun b!855983 () Bool)

(assert (=> b!855983 (= e!477338 false)))

(declare-datatypes ((tuple2!10756 0))(
  ( (tuple2!10757 (_1!5389 (_ BitVec 64)) (_2!5389 V!26849)) )
))
(declare-datatypes ((List!16600 0))(
  ( (Nil!16597) (Cons!16596 (h!17733 tuple2!10756) (t!23233 List!16600)) )
))
(declare-datatypes ((ListLongMap!9527 0))(
  ( (ListLongMap!9528 (toList!4779 List!16600)) )
))
(declare-fun lt!385993 () ListLongMap!9527)

(declare-fun v!557 () V!26849)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!26849)

(declare-fun zeroValue!654 () V!26849)

(declare-fun getCurrentListMapNoExtraKeys!2835 (array!48947 array!48949 (_ BitVec 32) (_ BitVec 32) V!26849 V!26849 (_ BitVec 32) Int) ListLongMap!9527)

(assert (=> b!855983 (= lt!385993 (getCurrentListMapNoExtraKeys!2835 _keys!868 (array!48950 (store (arr!23501 _values!688) i!612 (ValueCellFull!7736 v!557)) (size!23942 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385994 () ListLongMap!9527)

(assert (=> b!855983 (= lt!385994 (getCurrentListMapNoExtraKeys!2835 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!855984 () Bool)

(declare-fun res!581036 () Bool)

(assert (=> b!855984 (=> (not res!581036) (not e!477338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48947 (_ BitVec 32)) Bool)

(assert (=> b!855984 (= res!581036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855985 () Bool)

(declare-fun res!581037 () Bool)

(assert (=> b!855985 (=> (not res!581037) (not e!477338))))

(assert (=> b!855985 (= res!581037 (and (= (size!23942 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23941 _keys!868) (size!23942 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26126 () Bool)

(declare-fun tp!50149 () Bool)

(assert (=> mapNonEmpty!26126 (= mapRes!26126 (and tp!50149 e!477340))))

(declare-fun mapKey!26126 () (_ BitVec 32))

(declare-fun mapRest!26126 () (Array (_ BitVec 32) ValueCell!7736))

(declare-fun mapValue!26126 () ValueCell!7736)

(assert (=> mapNonEmpty!26126 (= (arr!23501 _values!688) (store mapRest!26126 mapKey!26126 mapValue!26126))))

(declare-fun b!855986 () Bool)

(declare-fun res!581035 () Bool)

(assert (=> b!855986 (=> (not res!581035) (not e!477338))))

(declare-datatypes ((List!16601 0))(
  ( (Nil!16598) (Cons!16597 (h!17734 (_ BitVec 64)) (t!23234 List!16601)) )
))
(declare-fun arrayNoDuplicates!0 (array!48947 (_ BitVec 32) List!16601) Bool)

(assert (=> b!855986 (= res!581035 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16598))))

(assert (= (and start!73468 res!581041) b!855976))

(assert (= (and b!855976 res!581038) b!855985))

(assert (= (and b!855985 res!581037) b!855984))

(assert (= (and b!855984 res!581036) b!855986))

(assert (= (and b!855986 res!581035) b!855980))

(assert (= (and b!855980 res!581040) b!855981))

(assert (= (and b!855981 res!581034) b!855979))

(assert (= (and b!855979 res!581039) b!855983))

(assert (= (and b!855982 condMapEmpty!26126) mapIsEmpty!26126))

(assert (= (and b!855982 (not condMapEmpty!26126)) mapNonEmpty!26126))

(get-info :version)

(assert (= (and mapNonEmpty!26126 ((_ is ValueCellFull!7736) mapValue!26126)) b!855978))

(assert (= (and b!855982 ((_ is ValueCellFull!7736) mapDefault!26126)) b!855977))

(assert (= start!73468 b!855982))

(declare-fun m!797687 () Bool)

(assert (=> b!855984 m!797687))

(declare-fun m!797689 () Bool)

(assert (=> b!855981 m!797689))

(declare-fun m!797691 () Bool)

(assert (=> mapNonEmpty!26126 m!797691))

(declare-fun m!797693 () Bool)

(assert (=> b!855986 m!797693))

(declare-fun m!797695 () Bool)

(assert (=> start!73468 m!797695))

(declare-fun m!797697 () Bool)

(assert (=> start!73468 m!797697))

(declare-fun m!797699 () Bool)

(assert (=> b!855979 m!797699))

(declare-fun m!797701 () Bool)

(assert (=> b!855983 m!797701))

(declare-fun m!797703 () Bool)

(assert (=> b!855983 m!797703))

(declare-fun m!797705 () Bool)

(assert (=> b!855983 m!797705))

(declare-fun m!797707 () Bool)

(assert (=> b!855976 m!797707))

(check-sat (not start!73468) b_and!23581 (not b!855986) (not b!855976) (not b_next!14215) (not b!855983) (not b!855984) tp_is_empty!16351 (not mapNonEmpty!26126) (not b!855981))
(check-sat b_and!23581 (not b_next!14215))
