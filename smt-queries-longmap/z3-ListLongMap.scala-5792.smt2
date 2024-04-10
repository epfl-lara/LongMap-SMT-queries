; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74696 () Bool)

(assert start!74696)

(declare-fun b_free!15345 () Bool)

(declare-fun b_next!15345 () Bool)

(assert (=> start!74696 (= b_free!15345 (not b_next!15345))))

(declare-fun tp!53722 () Bool)

(declare-fun b_and!25309 () Bool)

(assert (=> start!74696 (= tp!53722 b_and!25309)))

(declare-fun b!880602 () Bool)

(declare-fun res!598304 () Bool)

(declare-fun e!490050 () Bool)

(assert (=> b!880602 (=> (not res!598304) (not e!490050))))

(declare-datatypes ((array!51304 0))(
  ( (array!51305 (arr!24676 (Array (_ BitVec 32) (_ BitVec 64))) (size!25116 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51304)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51304 (_ BitVec 32)) Bool)

(assert (=> b!880602 (= res!598304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!880603 () Bool)

(declare-fun e!490046 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!880603 (= e!490046 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000))))

(declare-datatypes ((List!17517 0))(
  ( (Nil!17514) (Cons!17513 (h!18644 (_ BitVec 64)) (t!24664 List!17517)) )
))
(declare-fun arrayNoDuplicates!0 (array!51304 (_ BitVec 32) List!17517) Bool)

(assert (=> b!880603 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17514)))

(declare-datatypes ((Unit!30062 0))(
  ( (Unit!30063) )
))
(declare-fun lt!398214 () Unit!30062)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51304 (_ BitVec 32) (_ BitVec 32)) Unit!30062)

(assert (=> b!880603 (= lt!398214 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!880604 () Bool)

(declare-fun res!598305 () Bool)

(assert (=> b!880604 (=> (not res!598305) (not e!490050))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!880604 (= res!598305 (and (= (select (arr!24676 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!880605 () Bool)

(declare-fun res!598297 () Bool)

(assert (=> b!880605 (=> (not res!598297) (not e!490050))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28499 0))(
  ( (V!28500 (val!8842 Int)) )
))
(declare-datatypes ((ValueCell!8355 0))(
  ( (ValueCellFull!8355 (v!11290 V!28499)) (EmptyCell!8355) )
))
(declare-datatypes ((array!51306 0))(
  ( (array!51307 (arr!24677 (Array (_ BitVec 32) ValueCell!8355)) (size!25117 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51306)

(assert (=> b!880605 (= res!598297 (and (= (size!25117 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25116 _keys!868) (size!25117 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28005 () Bool)

(declare-fun mapRes!28005 () Bool)

(declare-fun tp!53723 () Bool)

(declare-fun e!490048 () Bool)

(assert (=> mapNonEmpty!28005 (= mapRes!28005 (and tp!53723 e!490048))))

(declare-fun mapKey!28005 () (_ BitVec 32))

(declare-fun mapValue!28005 () ValueCell!8355)

(declare-fun mapRest!28005 () (Array (_ BitVec 32) ValueCell!8355))

(assert (=> mapNonEmpty!28005 (= (arr!24677 _values!688) (store mapRest!28005 mapKey!28005 mapValue!28005))))

(declare-fun b!880606 () Bool)

(declare-fun e!490044 () Bool)

(declare-fun e!490049 () Bool)

(assert (=> b!880606 (= e!490044 (and e!490049 mapRes!28005))))

(declare-fun condMapEmpty!28005 () Bool)

(declare-fun mapDefault!28005 () ValueCell!8355)

(assert (=> b!880606 (= condMapEmpty!28005 (= (arr!24677 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8355)) mapDefault!28005)))))

(declare-fun b!880607 () Bool)

(declare-fun tp_is_empty!17589 () Bool)

(assert (=> b!880607 (= e!490048 tp_is_empty!17589)))

(declare-fun b!880608 () Bool)

(declare-fun res!598300 () Bool)

(assert (=> b!880608 (=> (not res!598300) (not e!490050))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!880608 (= res!598300 (validKeyInArray!0 k0!854))))

(declare-fun b!880609 () Bool)

(declare-fun res!598303 () Bool)

(assert (=> b!880609 (=> (not res!598303) (not e!490050))))

(assert (=> b!880609 (= res!598303 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25116 _keys!868))))))

(declare-fun res!598301 () Bool)

(assert (=> start!74696 (=> (not res!598301) (not e!490050))))

(assert (=> start!74696 (= res!598301 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25116 _keys!868))))))

(assert (=> start!74696 e!490050))

(assert (=> start!74696 tp_is_empty!17589))

(assert (=> start!74696 true))

(assert (=> start!74696 tp!53722))

(declare-fun array_inv!19434 (array!51304) Bool)

(assert (=> start!74696 (array_inv!19434 _keys!868)))

(declare-fun array_inv!19435 (array!51306) Bool)

(assert (=> start!74696 (and (array_inv!19435 _values!688) e!490044)))

(declare-fun b!880610 () Bool)

(assert (=> b!880610 (= e!490049 tp_is_empty!17589)))

(declare-fun b!880611 () Bool)

(declare-fun e!490045 () Bool)

(assert (=> b!880611 (= e!490050 e!490045)))

(declare-fun res!598296 () Bool)

(assert (=> b!880611 (=> (not res!598296) (not e!490045))))

(assert (=> b!880611 (= res!598296 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!398213 () array!51306)

(declare-datatypes ((tuple2!11704 0))(
  ( (tuple2!11705 (_1!5863 (_ BitVec 64)) (_2!5863 V!28499)) )
))
(declare-datatypes ((List!17518 0))(
  ( (Nil!17515) (Cons!17514 (h!18645 tuple2!11704) (t!24665 List!17518)) )
))
(declare-datatypes ((ListLongMap!10473 0))(
  ( (ListLongMap!10474 (toList!5252 List!17518)) )
))
(declare-fun lt!398216 () ListLongMap!10473)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28499)

(declare-fun zeroValue!654 () V!28499)

(declare-fun getCurrentListMapNoExtraKeys!3215 (array!51304 array!51306 (_ BitVec 32) (_ BitVec 32) V!28499 V!28499 (_ BitVec 32) Int) ListLongMap!10473)

(assert (=> b!880611 (= lt!398216 (getCurrentListMapNoExtraKeys!3215 _keys!868 lt!398213 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28499)

(assert (=> b!880611 (= lt!398213 (array!51307 (store (arr!24677 _values!688) i!612 (ValueCellFull!8355 v!557)) (size!25117 _values!688)))))

(declare-fun lt!398211 () ListLongMap!10473)

(assert (=> b!880611 (= lt!398211 (getCurrentListMapNoExtraKeys!3215 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!880612 () Bool)

(declare-fun res!598299 () Bool)

(assert (=> b!880612 (=> (not res!598299) (not e!490050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!880612 (= res!598299 (validMask!0 mask!1196))))

(declare-fun b!880613 () Bool)

(declare-fun res!598298 () Bool)

(assert (=> b!880613 (=> (not res!598298) (not e!490050))))

(assert (=> b!880613 (= res!598298 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17514))))

(declare-fun b!880614 () Bool)

(declare-fun e!490043 () Bool)

(assert (=> b!880614 (= e!490043 e!490046)))

(declare-fun res!598295 () Bool)

(assert (=> b!880614 (=> res!598295 e!490046)))

(assert (=> b!880614 (= res!598295 (not (= (select (arr!24676 _keys!868) from!1053) k0!854)))))

(declare-fun lt!398210 () ListLongMap!10473)

(declare-fun +!2524 (ListLongMap!10473 tuple2!11704) ListLongMap!10473)

(declare-fun get!12977 (ValueCell!8355 V!28499) V!28499)

(declare-fun dynLambda!1240 (Int (_ BitVec 64)) V!28499)

(assert (=> b!880614 (= lt!398216 (+!2524 lt!398210 (tuple2!11705 (select (arr!24676 _keys!868) from!1053) (get!12977 (select (arr!24677 _values!688) from!1053) (dynLambda!1240 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!28005 () Bool)

(assert (=> mapIsEmpty!28005 mapRes!28005))

(declare-fun b!880615 () Bool)

(assert (=> b!880615 (= e!490045 (not e!490043))))

(declare-fun res!598302 () Bool)

(assert (=> b!880615 (=> res!598302 e!490043)))

(assert (=> b!880615 (= res!598302 (not (validKeyInArray!0 (select (arr!24676 _keys!868) from!1053))))))

(declare-fun lt!398209 () ListLongMap!10473)

(assert (=> b!880615 (= lt!398209 lt!398210)))

(declare-fun lt!398215 () ListLongMap!10473)

(assert (=> b!880615 (= lt!398210 (+!2524 lt!398215 (tuple2!11705 k0!854 v!557)))))

(assert (=> b!880615 (= lt!398209 (getCurrentListMapNoExtraKeys!3215 _keys!868 lt!398213 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!880615 (= lt!398215 (getCurrentListMapNoExtraKeys!3215 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!398212 () Unit!30062)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!713 (array!51304 array!51306 (_ BitVec 32) (_ BitVec 32) V!28499 V!28499 (_ BitVec 32) (_ BitVec 64) V!28499 (_ BitVec 32) Int) Unit!30062)

(assert (=> b!880615 (= lt!398212 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!713 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74696 res!598301) b!880612))

(assert (= (and b!880612 res!598299) b!880605))

(assert (= (and b!880605 res!598297) b!880602))

(assert (= (and b!880602 res!598304) b!880613))

(assert (= (and b!880613 res!598298) b!880609))

(assert (= (and b!880609 res!598303) b!880608))

(assert (= (and b!880608 res!598300) b!880604))

(assert (= (and b!880604 res!598305) b!880611))

(assert (= (and b!880611 res!598296) b!880615))

(assert (= (and b!880615 (not res!598302)) b!880614))

(assert (= (and b!880614 (not res!598295)) b!880603))

(assert (= (and b!880606 condMapEmpty!28005) mapIsEmpty!28005))

(assert (= (and b!880606 (not condMapEmpty!28005)) mapNonEmpty!28005))

(get-info :version)

(assert (= (and mapNonEmpty!28005 ((_ is ValueCellFull!8355) mapValue!28005)) b!880607))

(assert (= (and b!880606 ((_ is ValueCellFull!8355) mapDefault!28005)) b!880610))

(assert (= start!74696 b!880606))

(declare-fun b_lambda!12453 () Bool)

(assert (=> (not b_lambda!12453) (not b!880614)))

(declare-fun t!24663 () Bool)

(declare-fun tb!5003 () Bool)

(assert (=> (and start!74696 (= defaultEntry!696 defaultEntry!696) t!24663) tb!5003))

(declare-fun result!9631 () Bool)

(assert (=> tb!5003 (= result!9631 tp_is_empty!17589)))

(assert (=> b!880614 t!24663))

(declare-fun b_and!25311 () Bool)

(assert (= b_and!25309 (and (=> t!24663 result!9631) b_and!25311)))

(declare-fun m!820385 () Bool)

(assert (=> b!880611 m!820385))

(declare-fun m!820387 () Bool)

(assert (=> b!880611 m!820387))

(declare-fun m!820389 () Bool)

(assert (=> b!880611 m!820389))

(declare-fun m!820391 () Bool)

(assert (=> b!880604 m!820391))

(declare-fun m!820393 () Bool)

(assert (=> b!880602 m!820393))

(declare-fun m!820395 () Bool)

(assert (=> b!880612 m!820395))

(declare-fun m!820397 () Bool)

(assert (=> start!74696 m!820397))

(declare-fun m!820399 () Bool)

(assert (=> start!74696 m!820399))

(declare-fun m!820401 () Bool)

(assert (=> b!880608 m!820401))

(declare-fun m!820403 () Bool)

(assert (=> b!880613 m!820403))

(declare-fun m!820405 () Bool)

(assert (=> b!880615 m!820405))

(declare-fun m!820407 () Bool)

(assert (=> b!880615 m!820407))

(declare-fun m!820409 () Bool)

(assert (=> b!880615 m!820409))

(assert (=> b!880615 m!820407))

(declare-fun m!820411 () Bool)

(assert (=> b!880615 m!820411))

(declare-fun m!820413 () Bool)

(assert (=> b!880615 m!820413))

(declare-fun m!820415 () Bool)

(assert (=> b!880615 m!820415))

(declare-fun m!820417 () Bool)

(assert (=> mapNonEmpty!28005 m!820417))

(declare-fun m!820419 () Bool)

(assert (=> b!880614 m!820419))

(declare-fun m!820421 () Bool)

(assert (=> b!880614 m!820421))

(declare-fun m!820423 () Bool)

(assert (=> b!880614 m!820423))

(declare-fun m!820425 () Bool)

(assert (=> b!880614 m!820425))

(assert (=> b!880614 m!820421))

(assert (=> b!880614 m!820407))

(assert (=> b!880614 m!820423))

(declare-fun m!820427 () Bool)

(assert (=> b!880603 m!820427))

(declare-fun m!820429 () Bool)

(assert (=> b!880603 m!820429))

(check-sat (not mapNonEmpty!28005) (not b!880602) (not b!880608) (not b!880613) (not start!74696) (not b!880612) b_and!25311 tp_is_empty!17589 (not b!880614) (not b_next!15345) (not b!880603) (not b!880615) (not b!880611) (not b_lambda!12453))
(check-sat b_and!25311 (not b_next!15345))
