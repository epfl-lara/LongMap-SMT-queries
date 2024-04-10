; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73338 () Bool)

(assert start!73338)

(declare-fun b_free!14253 () Bool)

(declare-fun b_next!14253 () Bool)

(assert (=> start!73338 (= b_free!14253 (not b_next!14253))))

(declare-fun tp!50262 () Bool)

(declare-fun b_and!23609 () Bool)

(assert (=> start!73338 (= tp!50262 b_and!23609)))

(declare-fun b!855700 () Bool)

(declare-fun res!581148 () Bool)

(declare-fun e!477043 () Bool)

(assert (=> b!855700 (=> (not res!581148) (not e!477043))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48974 0))(
  ( (array!48975 (arr!23518 (Array (_ BitVec 32) (_ BitVec 64))) (size!23958 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48974)

(assert (=> b!855700 (= res!581148 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23958 _keys!868))))))

(declare-fun b!855701 () Bool)

(declare-fun res!581146 () Bool)

(assert (=> b!855701 (=> (not res!581146) (not e!477043))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855701 (= res!581146 (validMask!0 mask!1196))))

(declare-fun b!855702 () Bool)

(declare-fun res!581150 () Bool)

(assert (=> b!855702 (=> (not res!581150) (not e!477043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48974 (_ BitVec 32)) Bool)

(assert (=> b!855702 (= res!581150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!855703 () Bool)

(assert (=> b!855703 (= e!477043 false)))

(declare-datatypes ((V!26899 0))(
  ( (V!26900 (val!8242 Int)) )
))
(declare-fun v!557 () V!26899)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!10864 0))(
  ( (tuple2!10865 (_1!5443 (_ BitVec 64)) (_2!5443 V!26899)) )
))
(declare-datatypes ((List!16677 0))(
  ( (Nil!16674) (Cons!16673 (h!17804 tuple2!10864) (t!23318 List!16677)) )
))
(declare-datatypes ((ListLongMap!9633 0))(
  ( (ListLongMap!9634 (toList!4832 List!16677)) )
))
(declare-fun lt!385747 () ListLongMap!9633)

(declare-datatypes ((ValueCell!7755 0))(
  ( (ValueCellFull!7755 (v!10667 V!26899)) (EmptyCell!7755) )
))
(declare-datatypes ((array!48976 0))(
  ( (array!48977 (arr!23519 (Array (_ BitVec 32) ValueCell!7755)) (size!23959 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48976)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26899)

(declare-fun zeroValue!654 () V!26899)

(declare-fun getCurrentListMapNoExtraKeys!2813 (array!48974 array!48976 (_ BitVec 32) (_ BitVec 32) V!26899 V!26899 (_ BitVec 32) Int) ListLongMap!9633)

(assert (=> b!855703 (= lt!385747 (getCurrentListMapNoExtraKeys!2813 _keys!868 (array!48977 (store (arr!23519 _values!688) i!612 (ValueCellFull!7755 v!557)) (size!23959 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385746 () ListLongMap!9633)

(assert (=> b!855703 (= lt!385746 (getCurrentListMapNoExtraKeys!2813 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26183 () Bool)

(declare-fun mapRes!26183 () Bool)

(declare-fun tp!50263 () Bool)

(declare-fun e!477041 () Bool)

(assert (=> mapNonEmpty!26183 (= mapRes!26183 (and tp!50263 e!477041))))

(declare-fun mapRest!26183 () (Array (_ BitVec 32) ValueCell!7755))

(declare-fun mapKey!26183 () (_ BitVec 32))

(declare-fun mapValue!26183 () ValueCell!7755)

(assert (=> mapNonEmpty!26183 (= (arr!23519 _values!688) (store mapRest!26183 mapKey!26183 mapValue!26183))))

(declare-fun b!855704 () Bool)

(declare-fun res!581152 () Bool)

(assert (=> b!855704 (=> (not res!581152) (not e!477043))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!855704 (= res!581152 (and (= (select (arr!23518 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!855705 () Bool)

(declare-fun e!477039 () Bool)

(declare-fun e!477042 () Bool)

(assert (=> b!855705 (= e!477039 (and e!477042 mapRes!26183))))

(declare-fun condMapEmpty!26183 () Bool)

(declare-fun mapDefault!26183 () ValueCell!7755)

(assert (=> b!855705 (= condMapEmpty!26183 (= (arr!23519 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7755)) mapDefault!26183)))))

(declare-fun b!855706 () Bool)

(declare-fun res!581153 () Bool)

(assert (=> b!855706 (=> (not res!581153) (not e!477043))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!855706 (= res!581153 (validKeyInArray!0 k0!854))))

(declare-fun res!581147 () Bool)

(assert (=> start!73338 (=> (not res!581147) (not e!477043))))

(assert (=> start!73338 (= res!581147 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23958 _keys!868))))))

(assert (=> start!73338 e!477043))

(declare-fun tp_is_empty!16389 () Bool)

(assert (=> start!73338 tp_is_empty!16389))

(assert (=> start!73338 true))

(assert (=> start!73338 tp!50262))

(declare-fun array_inv!18636 (array!48974) Bool)

(assert (=> start!73338 (array_inv!18636 _keys!868)))

(declare-fun array_inv!18637 (array!48976) Bool)

(assert (=> start!73338 (and (array_inv!18637 _values!688) e!477039)))

(declare-fun b!855707 () Bool)

(declare-fun res!581149 () Bool)

(assert (=> b!855707 (=> (not res!581149) (not e!477043))))

(assert (=> b!855707 (= res!581149 (and (= (size!23959 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23958 _keys!868) (size!23959 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855708 () Bool)

(declare-fun res!581151 () Bool)

(assert (=> b!855708 (=> (not res!581151) (not e!477043))))

(declare-datatypes ((List!16678 0))(
  ( (Nil!16675) (Cons!16674 (h!17805 (_ BitVec 64)) (t!23319 List!16678)) )
))
(declare-fun arrayNoDuplicates!0 (array!48974 (_ BitVec 32) List!16678) Bool)

(assert (=> b!855708 (= res!581151 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16675))))

(declare-fun b!855709 () Bool)

(assert (=> b!855709 (= e!477041 tp_is_empty!16389)))

(declare-fun mapIsEmpty!26183 () Bool)

(assert (=> mapIsEmpty!26183 mapRes!26183))

(declare-fun b!855710 () Bool)

(assert (=> b!855710 (= e!477042 tp_is_empty!16389)))

(assert (= (and start!73338 res!581147) b!855701))

(assert (= (and b!855701 res!581146) b!855707))

(assert (= (and b!855707 res!581149) b!855702))

(assert (= (and b!855702 res!581150) b!855708))

(assert (= (and b!855708 res!581151) b!855700))

(assert (= (and b!855700 res!581148) b!855706))

(assert (= (and b!855706 res!581153) b!855704))

(assert (= (and b!855704 res!581152) b!855703))

(assert (= (and b!855705 condMapEmpty!26183) mapIsEmpty!26183))

(assert (= (and b!855705 (not condMapEmpty!26183)) mapNonEmpty!26183))

(get-info :version)

(assert (= (and mapNonEmpty!26183 ((_ is ValueCellFull!7755) mapValue!26183)) b!855709))

(assert (= (and b!855705 ((_ is ValueCellFull!7755) mapDefault!26183)) b!855710))

(assert (= start!73338 b!855705))

(declare-fun m!796815 () Bool)

(assert (=> mapNonEmpty!26183 m!796815))

(declare-fun m!796817 () Bool)

(assert (=> start!73338 m!796817))

(declare-fun m!796819 () Bool)

(assert (=> start!73338 m!796819))

(declare-fun m!796821 () Bool)

(assert (=> b!855704 m!796821))

(declare-fun m!796823 () Bool)

(assert (=> b!855706 m!796823))

(declare-fun m!796825 () Bool)

(assert (=> b!855701 m!796825))

(declare-fun m!796827 () Bool)

(assert (=> b!855708 m!796827))

(declare-fun m!796829 () Bool)

(assert (=> b!855703 m!796829))

(declare-fun m!796831 () Bool)

(assert (=> b!855703 m!796831))

(declare-fun m!796833 () Bool)

(assert (=> b!855703 m!796833))

(declare-fun m!796835 () Bool)

(assert (=> b!855702 m!796835))

(check-sat (not b!855706) (not mapNonEmpty!26183) (not b!855708) (not b!855701) (not b_next!14253) (not b!855703) (not b!855702) b_and!23609 tp_is_empty!16389 (not start!73338))
(check-sat b_and!23609 (not b_next!14253))
