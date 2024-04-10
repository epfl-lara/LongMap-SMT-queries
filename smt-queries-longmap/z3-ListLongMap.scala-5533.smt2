; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72984 () Bool)

(assert start!72984)

(declare-fun b_free!13899 () Bool)

(declare-fun b_next!13899 () Bool)

(assert (=> start!72984 (= b_free!13899 (not b_next!13899))))

(declare-fun tp!49201 () Bool)

(declare-fun b_and!22985 () Bool)

(assert (=> start!72984 (= tp!49201 b_and!22985)))

(declare-fun b!847840 () Bool)

(declare-fun e!473084 () Bool)

(declare-datatypes ((V!26427 0))(
  ( (V!26428 (val!8065 Int)) )
))
(declare-datatypes ((tuple2!10540 0))(
  ( (tuple2!10541 (_1!5281 (_ BitVec 64)) (_2!5281 V!26427)) )
))
(declare-datatypes ((List!16398 0))(
  ( (Nil!16395) (Cons!16394 (h!17525 tuple2!10540) (t!22769 List!16398)) )
))
(declare-datatypes ((ListLongMap!9309 0))(
  ( (ListLongMap!9310 (toList!4670 List!16398)) )
))
(declare-fun call!37553 () ListLongMap!9309)

(declare-fun call!37552 () ListLongMap!9309)

(assert (=> b!847840 (= e!473084 (= call!37553 call!37552))))

(declare-fun b!847841 () Bool)

(declare-fun e!473080 () Bool)

(declare-fun e!473083 () Bool)

(declare-fun mapRes!25652 () Bool)

(assert (=> b!847841 (= e!473080 (and e!473083 mapRes!25652))))

(declare-fun condMapEmpty!25652 () Bool)

(declare-datatypes ((ValueCell!7578 0))(
  ( (ValueCellFull!7578 (v!10490 V!26427)) (EmptyCell!7578) )
))
(declare-datatypes ((array!48280 0))(
  ( (array!48281 (arr!23171 (Array (_ BitVec 32) ValueCell!7578)) (size!23611 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48280)

(declare-fun mapDefault!25652 () ValueCell!7578)

(assert (=> b!847841 (= condMapEmpty!25652 (= (arr!23171 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7578)) mapDefault!25652)))))

(declare-fun b!847842 () Bool)

(declare-fun res!576047 () Bool)

(declare-fun e!473085 () Bool)

(assert (=> b!847842 (=> (not res!576047) (not e!473085))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48282 0))(
  ( (array!48283 (arr!23172 (Array (_ BitVec 32) (_ BitVec 64))) (size!23612 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48282)

(assert (=> b!847842 (= res!576047 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23612 _keys!868))))))

(declare-fun mapIsEmpty!25652 () Bool)

(assert (=> mapIsEmpty!25652 mapRes!25652))

(declare-fun b!847843 () Bool)

(declare-fun e!473086 () Bool)

(declare-fun tp_is_empty!16035 () Bool)

(assert (=> b!847843 (= e!473086 tp_is_empty!16035)))

(declare-fun defaultEntry!696 () Int)

(declare-fun bm!37549 () Bool)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26427)

(declare-fun zeroValue!654 () V!26427)

(declare-fun getCurrentListMapNoExtraKeys!2654 (array!48282 array!48280 (_ BitVec 32) (_ BitVec 32) V!26427 V!26427 (_ BitVec 32) Int) ListLongMap!9309)

(assert (=> bm!37549 (= call!37552 (getCurrentListMapNoExtraKeys!2654 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847844 () Bool)

(declare-fun res!576040 () Bool)

(assert (=> b!847844 (=> (not res!576040) (not e!473085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48282 (_ BitVec 32)) Bool)

(assert (=> b!847844 (= res!576040 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847845 () Bool)

(declare-fun res!576044 () Bool)

(assert (=> b!847845 (=> (not res!576044) (not e!473085))))

(assert (=> b!847845 (= res!576044 (and (= (size!23611 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23612 _keys!868) (size!23611 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!847847 () Bool)

(declare-fun e!473081 () Bool)

(assert (=> b!847847 (= e!473081 (not true))))

(assert (=> b!847847 e!473084))

(declare-fun c!91519 () Bool)

(assert (=> b!847847 (= c!91519 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26427)

(declare-datatypes ((Unit!28955 0))(
  ( (Unit!28956) )
))
(declare-fun lt!381851 () Unit!28955)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!323 (array!48282 array!48280 (_ BitVec 32) (_ BitVec 32) V!26427 V!26427 (_ BitVec 32) (_ BitVec 64) V!26427 (_ BitVec 32) Int) Unit!28955)

(assert (=> b!847847 (= lt!381851 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!323 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847848 () Bool)

(declare-fun res!576039 () Bool)

(assert (=> b!847848 (=> (not res!576039) (not e!473085))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847848 (= res!576039 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!25652 () Bool)

(declare-fun tp!49200 () Bool)

(assert (=> mapNonEmpty!25652 (= mapRes!25652 (and tp!49200 e!473086))))

(declare-fun mapRest!25652 () (Array (_ BitVec 32) ValueCell!7578))

(declare-fun mapKey!25652 () (_ BitVec 32))

(declare-fun mapValue!25652 () ValueCell!7578)

(assert (=> mapNonEmpty!25652 (= (arr!23171 _values!688) (store mapRest!25652 mapKey!25652 mapValue!25652))))

(declare-fun bm!37550 () Bool)

(declare-fun lt!381850 () array!48280)

(assert (=> bm!37550 (= call!37553 (getCurrentListMapNoExtraKeys!2654 _keys!868 lt!381850 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847849 () Bool)

(assert (=> b!847849 (= e!473085 e!473081)))

(declare-fun res!576045 () Bool)

(assert (=> b!847849 (=> (not res!576045) (not e!473081))))

(assert (=> b!847849 (= res!576045 (= from!1053 i!612))))

(declare-fun lt!381852 () ListLongMap!9309)

(assert (=> b!847849 (= lt!381852 (getCurrentListMapNoExtraKeys!2654 _keys!868 lt!381850 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!847849 (= lt!381850 (array!48281 (store (arr!23171 _values!688) i!612 (ValueCellFull!7578 v!557)) (size!23611 _values!688)))))

(declare-fun lt!381853 () ListLongMap!9309)

(assert (=> b!847849 (= lt!381853 (getCurrentListMapNoExtraKeys!2654 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847850 () Bool)

(declare-fun res!576041 () Bool)

(assert (=> b!847850 (=> (not res!576041) (not e!473085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847850 (= res!576041 (validMask!0 mask!1196))))

(declare-fun b!847851 () Bool)

(declare-fun res!576046 () Bool)

(assert (=> b!847851 (=> (not res!576046) (not e!473085))))

(declare-datatypes ((List!16399 0))(
  ( (Nil!16396) (Cons!16395 (h!17526 (_ BitVec 64)) (t!22770 List!16399)) )
))
(declare-fun arrayNoDuplicates!0 (array!48282 (_ BitVec 32) List!16399) Bool)

(assert (=> b!847851 (= res!576046 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16396))))

(declare-fun b!847852 () Bool)

(declare-fun +!2085 (ListLongMap!9309 tuple2!10540) ListLongMap!9309)

(assert (=> b!847852 (= e!473084 (= call!37553 (+!2085 call!37552 (tuple2!10541 k0!854 v!557))))))

(declare-fun b!847853 () Bool)

(assert (=> b!847853 (= e!473083 tp_is_empty!16035)))

(declare-fun b!847846 () Bool)

(declare-fun res!576043 () Bool)

(assert (=> b!847846 (=> (not res!576043) (not e!473085))))

(assert (=> b!847846 (= res!576043 (and (= (select (arr!23172 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!576042 () Bool)

(assert (=> start!72984 (=> (not res!576042) (not e!473085))))

(assert (=> start!72984 (= res!576042 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23612 _keys!868))))))

(assert (=> start!72984 e!473085))

(assert (=> start!72984 tp_is_empty!16035))

(assert (=> start!72984 true))

(assert (=> start!72984 tp!49201))

(declare-fun array_inv!18402 (array!48282) Bool)

(assert (=> start!72984 (array_inv!18402 _keys!868)))

(declare-fun array_inv!18403 (array!48280) Bool)

(assert (=> start!72984 (and (array_inv!18403 _values!688) e!473080)))

(assert (= (and start!72984 res!576042) b!847850))

(assert (= (and b!847850 res!576041) b!847845))

(assert (= (and b!847845 res!576044) b!847844))

(assert (= (and b!847844 res!576040) b!847851))

(assert (= (and b!847851 res!576046) b!847842))

(assert (= (and b!847842 res!576047) b!847848))

(assert (= (and b!847848 res!576039) b!847846))

(assert (= (and b!847846 res!576043) b!847849))

(assert (= (and b!847849 res!576045) b!847847))

(assert (= (and b!847847 c!91519) b!847852))

(assert (= (and b!847847 (not c!91519)) b!847840))

(assert (= (or b!847852 b!847840) bm!37550))

(assert (= (or b!847852 b!847840) bm!37549))

(assert (= (and b!847841 condMapEmpty!25652) mapIsEmpty!25652))

(assert (= (and b!847841 (not condMapEmpty!25652)) mapNonEmpty!25652))

(get-info :version)

(assert (= (and mapNonEmpty!25652 ((_ is ValueCellFull!7578) mapValue!25652)) b!847843))

(assert (= (and b!847841 ((_ is ValueCellFull!7578) mapDefault!25652)) b!847853))

(assert (= start!72984 b!847841))

(declare-fun m!788793 () Bool)

(assert (=> b!847849 m!788793))

(declare-fun m!788795 () Bool)

(assert (=> b!847849 m!788795))

(declare-fun m!788797 () Bool)

(assert (=> b!847849 m!788797))

(declare-fun m!788799 () Bool)

(assert (=> b!847846 m!788799))

(declare-fun m!788801 () Bool)

(assert (=> b!847850 m!788801))

(declare-fun m!788803 () Bool)

(assert (=> b!847848 m!788803))

(declare-fun m!788805 () Bool)

(assert (=> b!847847 m!788805))

(declare-fun m!788807 () Bool)

(assert (=> b!847844 m!788807))

(declare-fun m!788809 () Bool)

(assert (=> start!72984 m!788809))

(declare-fun m!788811 () Bool)

(assert (=> start!72984 m!788811))

(declare-fun m!788813 () Bool)

(assert (=> bm!37550 m!788813))

(declare-fun m!788815 () Bool)

(assert (=> bm!37549 m!788815))

(declare-fun m!788817 () Bool)

(assert (=> b!847851 m!788817))

(declare-fun m!788819 () Bool)

(assert (=> mapNonEmpty!25652 m!788819))

(declare-fun m!788821 () Bool)

(assert (=> b!847852 m!788821))

(check-sat (not b_next!13899) (not b!847844) (not b!847851) (not b!847847) (not b!847849) (not b!847848) (not bm!37549) (not b!847852) b_and!22985 (not bm!37550) tp_is_empty!16035 (not mapNonEmpty!25652) (not start!72984) (not b!847850))
(check-sat b_and!22985 (not b_next!13899))
