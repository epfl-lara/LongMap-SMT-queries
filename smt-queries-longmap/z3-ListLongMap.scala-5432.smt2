; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72378 () Bool)

(assert start!72378)

(declare-fun b_free!13563 () Bool)

(declare-fun b_next!13563 () Bool)

(assert (=> start!72378 (= b_free!13563 (not b_next!13563))))

(declare-fun tp!47787 () Bool)

(declare-fun b_and!22649 () Bool)

(assert (=> start!72378 (= tp!47787 b_and!22649)))

(declare-fun b!838790 () Bool)

(declare-fun e!468183 () Bool)

(declare-fun tp_is_empty!15429 () Bool)

(assert (=> b!838790 (= e!468183 tp_is_empty!15429)))

(declare-fun b!838791 () Bool)

(declare-fun e!468184 () Bool)

(assert (=> b!838791 (= e!468184 (not true))))

(declare-fun e!468182 () Bool)

(assert (=> b!838791 e!468182))

(declare-fun c!91204 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!838791 (= c!91204 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28805 0))(
  ( (Unit!28806) )
))
(declare-fun lt!380710 () Unit!28805)

(declare-datatypes ((V!25619 0))(
  ( (V!25620 (val!7762 Int)) )
))
(declare-fun v!557 () V!25619)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47144 0))(
  ( (array!47145 (arr!22603 (Array (_ BitVec 32) (_ BitVec 64))) (size!23043 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47144)

(declare-datatypes ((ValueCell!7275 0))(
  ( (ValueCellFull!7275 (v!10187 V!25619)) (EmptyCell!7275) )
))
(declare-datatypes ((array!47146 0))(
  ( (array!47147 (arr!22604 (Array (_ BitVec 32) ValueCell!7275)) (size!23044 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47146)

(declare-fun minValue!654 () V!25619)

(declare-fun zeroValue!654 () V!25619)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!248 (array!47144 array!47146 (_ BitVec 32) (_ BitVec 32) V!25619 V!25619 (_ BitVec 32) (_ BitVec 64) V!25619 (_ BitVec 32) Int) Unit!28805)

(assert (=> b!838791 (= lt!380710 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!248 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838792 () Bool)

(declare-fun e!468180 () Bool)

(declare-fun e!468179 () Bool)

(declare-fun mapRes!24743 () Bool)

(assert (=> b!838792 (= e!468180 (and e!468179 mapRes!24743))))

(declare-fun condMapEmpty!24743 () Bool)

(declare-fun mapDefault!24743 () ValueCell!7275)

(assert (=> b!838792 (= condMapEmpty!24743 (= (arr!22604 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7275)) mapDefault!24743)))))

(declare-fun b!838793 () Bool)

(declare-datatypes ((tuple2!10270 0))(
  ( (tuple2!10271 (_1!5146 (_ BitVec 64)) (_2!5146 V!25619)) )
))
(declare-datatypes ((List!16070 0))(
  ( (Nil!16067) (Cons!16066 (h!17197 tuple2!10270) (t!22441 List!16070)) )
))
(declare-datatypes ((ListLongMap!9039 0))(
  ( (ListLongMap!9040 (toList!4535 List!16070)) )
))
(declare-fun call!36922 () ListLongMap!9039)

(declare-fun call!36923 () ListLongMap!9039)

(assert (=> b!838793 (= e!468182 (= call!36922 call!36923))))

(declare-fun b!838794 () Bool)

(declare-fun res!570351 () Bool)

(assert (=> b!838794 (=> (not res!570351) (not e!468184))))

(assert (=> b!838794 (= res!570351 (and (= (select (arr!22603 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23043 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun bm!36919 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2527 (array!47144 array!47146 (_ BitVec 32) (_ BitVec 32) V!25619 V!25619 (_ BitVec 32) Int) ListLongMap!9039)

(assert (=> bm!36919 (= call!36923 (getCurrentListMapNoExtraKeys!2527 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!36920 () Bool)

(assert (=> bm!36920 (= call!36922 (getCurrentListMapNoExtraKeys!2527 _keys!868 (array!47147 (store (arr!22604 _values!688) i!612 (ValueCellFull!7275 v!557)) (size!23044 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!24743 () Bool)

(declare-fun tp!47788 () Bool)

(assert (=> mapNonEmpty!24743 (= mapRes!24743 (and tp!47788 e!468183))))

(declare-fun mapKey!24743 () (_ BitVec 32))

(declare-fun mapRest!24743 () (Array (_ BitVec 32) ValueCell!7275))

(declare-fun mapValue!24743 () ValueCell!7275)

(assert (=> mapNonEmpty!24743 (= (arr!22604 _values!688) (store mapRest!24743 mapKey!24743 mapValue!24743))))

(declare-fun b!838795 () Bool)

(declare-fun res!570350 () Bool)

(assert (=> b!838795 (=> (not res!570350) (not e!468184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838795 (= res!570350 (validKeyInArray!0 k0!854))))

(declare-fun b!838796 () Bool)

(assert (=> b!838796 (= e!468179 tp_is_empty!15429)))

(declare-fun mapIsEmpty!24743 () Bool)

(assert (=> mapIsEmpty!24743 mapRes!24743))

(declare-fun b!838798 () Bool)

(declare-fun res!570349 () Bool)

(assert (=> b!838798 (=> (not res!570349) (not e!468184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838798 (= res!570349 (validMask!0 mask!1196))))

(declare-fun b!838799 () Bool)

(declare-fun res!570353 () Bool)

(assert (=> b!838799 (=> (not res!570353) (not e!468184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47144 (_ BitVec 32)) Bool)

(assert (=> b!838799 (= res!570353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838800 () Bool)

(declare-fun +!2008 (ListLongMap!9039 tuple2!10270) ListLongMap!9039)

(assert (=> b!838800 (= e!468182 (= call!36922 (+!2008 call!36923 (tuple2!10271 k0!854 v!557))))))

(declare-fun b!838801 () Bool)

(declare-fun res!570352 () Bool)

(assert (=> b!838801 (=> (not res!570352) (not e!468184))))

(declare-datatypes ((List!16071 0))(
  ( (Nil!16068) (Cons!16067 (h!17198 (_ BitVec 64)) (t!22442 List!16071)) )
))
(declare-fun arrayNoDuplicates!0 (array!47144 (_ BitVec 32) List!16071) Bool)

(assert (=> b!838801 (= res!570352 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16068))))

(declare-fun b!838802 () Bool)

(declare-fun res!570347 () Bool)

(assert (=> b!838802 (=> (not res!570347) (not e!468184))))

(assert (=> b!838802 (= res!570347 (and (= (size!23044 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23043 _keys!868) (size!23044 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838797 () Bool)

(declare-fun res!570346 () Bool)

(assert (=> b!838797 (=> (not res!570346) (not e!468184))))

(assert (=> b!838797 (= res!570346 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23043 _keys!868))))))

(declare-fun res!570348 () Bool)

(assert (=> start!72378 (=> (not res!570348) (not e!468184))))

(assert (=> start!72378 (= res!570348 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23043 _keys!868))))))

(assert (=> start!72378 e!468184))

(assert (=> start!72378 tp_is_empty!15429))

(assert (=> start!72378 true))

(assert (=> start!72378 tp!47787))

(declare-fun array_inv!18006 (array!47144) Bool)

(assert (=> start!72378 (array_inv!18006 _keys!868)))

(declare-fun array_inv!18007 (array!47146) Bool)

(assert (=> start!72378 (and (array_inv!18007 _values!688) e!468180)))

(assert (= (and start!72378 res!570348) b!838798))

(assert (= (and b!838798 res!570349) b!838802))

(assert (= (and b!838802 res!570347) b!838799))

(assert (= (and b!838799 res!570353) b!838801))

(assert (= (and b!838801 res!570352) b!838797))

(assert (= (and b!838797 res!570346) b!838795))

(assert (= (and b!838795 res!570350) b!838794))

(assert (= (and b!838794 res!570351) b!838791))

(assert (= (and b!838791 c!91204) b!838800))

(assert (= (and b!838791 (not c!91204)) b!838793))

(assert (= (or b!838800 b!838793) bm!36920))

(assert (= (or b!838800 b!838793) bm!36919))

(assert (= (and b!838792 condMapEmpty!24743) mapIsEmpty!24743))

(assert (= (and b!838792 (not condMapEmpty!24743)) mapNonEmpty!24743))

(get-info :version)

(assert (= (and mapNonEmpty!24743 ((_ is ValueCellFull!7275) mapValue!24743)) b!838790))

(assert (= (and b!838792 ((_ is ValueCellFull!7275) mapDefault!24743)) b!838796))

(assert (= start!72378 b!838792))

(declare-fun m!783113 () Bool)

(assert (=> bm!36919 m!783113))

(declare-fun m!783115 () Bool)

(assert (=> b!838794 m!783115))

(declare-fun m!783117 () Bool)

(assert (=> b!838799 m!783117))

(declare-fun m!783119 () Bool)

(assert (=> b!838791 m!783119))

(declare-fun m!783121 () Bool)

(assert (=> bm!36920 m!783121))

(declare-fun m!783123 () Bool)

(assert (=> bm!36920 m!783123))

(declare-fun m!783125 () Bool)

(assert (=> b!838800 m!783125))

(declare-fun m!783127 () Bool)

(assert (=> mapNonEmpty!24743 m!783127))

(declare-fun m!783129 () Bool)

(assert (=> b!838801 m!783129))

(declare-fun m!783131 () Bool)

(assert (=> b!838795 m!783131))

(declare-fun m!783133 () Bool)

(assert (=> b!838798 m!783133))

(declare-fun m!783135 () Bool)

(assert (=> start!72378 m!783135))

(declare-fun m!783137 () Bool)

(assert (=> start!72378 m!783137))

(check-sat b_and!22649 (not bm!36919) (not b!838801) tp_is_empty!15429 (not b!838791) (not b_next!13563) (not bm!36920) (not start!72378) (not b!838795) (not b!838799) (not mapNonEmpty!24743) (not b!838798) (not b!838800))
(check-sat b_and!22649 (not b_next!13563))
