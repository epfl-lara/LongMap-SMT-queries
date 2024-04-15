; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72964 () Bool)

(assert start!72964)

(declare-fun b_free!13897 () Bool)

(declare-fun b_next!13897 () Bool)

(assert (=> start!72964 (= b_free!13897 (not b_next!13897))))

(declare-fun tp!49195 () Bool)

(declare-fun b_and!22957 () Bool)

(assert (=> start!72964 (= tp!49195 b_and!22957)))

(declare-fun b!847559 () Bool)

(declare-fun e!472914 () Bool)

(declare-fun e!472911 () Bool)

(assert (=> b!847559 (= e!472914 e!472911)))

(declare-fun res!575903 () Bool)

(assert (=> b!847559 (=> (not res!575903) (not e!472911))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847559 (= res!575903 (= from!1053 i!612))))

(declare-datatypes ((V!26425 0))(
  ( (V!26426 (val!8064 Int)) )
))
(declare-datatypes ((ValueCell!7577 0))(
  ( (ValueCellFull!7577 (v!10483 V!26425)) (EmptyCell!7577) )
))
(declare-datatypes ((array!48275 0))(
  ( (array!48276 (arr!23169 (Array (_ BitVec 32) ValueCell!7577)) (size!23611 (_ BitVec 32))) )
))
(declare-fun lt!381605 () array!48275)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!10566 0))(
  ( (tuple2!10567 (_1!5294 (_ BitVec 64)) (_2!5294 V!26425)) )
))
(declare-datatypes ((List!16421 0))(
  ( (Nil!16418) (Cons!16417 (h!17548 tuple2!10566) (t!22783 List!16421)) )
))
(declare-datatypes ((ListLongMap!9325 0))(
  ( (ListLongMap!9326 (toList!4678 List!16421)) )
))
(declare-fun lt!381603 () ListLongMap!9325)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48277 0))(
  ( (array!48278 (arr!23170 (Array (_ BitVec 32) (_ BitVec 64))) (size!23612 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48277)

(declare-fun minValue!654 () V!26425)

(declare-fun zeroValue!654 () V!26425)

(declare-fun getCurrentListMapNoExtraKeys!2691 (array!48277 array!48275 (_ BitVec 32) (_ BitVec 32) V!26425 V!26425 (_ BitVec 32) Int) ListLongMap!9325)

(assert (=> b!847559 (= lt!381603 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!381605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun _values!688 () array!48275)

(declare-fun v!557 () V!26425)

(assert (=> b!847559 (= lt!381605 (array!48276 (store (arr!23169 _values!688) i!612 (ValueCellFull!7577 v!557)) (size!23611 _values!688)))))

(declare-fun lt!381604 () ListLongMap!9325)

(assert (=> b!847559 (= lt!381604 (getCurrentListMapNoExtraKeys!2691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!847560 () Bool)

(declare-fun res!575910 () Bool)

(assert (=> b!847560 (=> (not res!575910) (not e!472914))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!847560 (= res!575910 (and (= (select (arr!23170 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!847561 () Bool)

(declare-fun res!575906 () Bool)

(assert (=> b!847561 (=> (not res!575906) (not e!472914))))

(assert (=> b!847561 (= res!575906 (and (= (size!23611 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23612 _keys!868) (size!23611 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun call!37520 () ListLongMap!9325)

(declare-fun b!847562 () Bool)

(declare-fun e!472913 () Bool)

(declare-fun call!37521 () ListLongMap!9325)

(declare-fun +!2109 (ListLongMap!9325 tuple2!10566) ListLongMap!9325)

(assert (=> b!847562 (= e!472913 (= call!37520 (+!2109 call!37521 (tuple2!10567 k0!854 v!557))))))

(declare-fun b!847563 () Bool)

(assert (=> b!847563 (= e!472911 (not true))))

(assert (=> b!847563 e!472913))

(declare-fun c!91451 () Bool)

(assert (=> b!847563 (= c!91451 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28895 0))(
  ( (Unit!28896) )
))
(declare-fun lt!381602 () Unit!28895)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!322 (array!48277 array!48275 (_ BitVec 32) (_ BitVec 32) V!26425 V!26425 (_ BitVec 32) (_ BitVec 64) V!26425 (_ BitVec 32) Int) Unit!28895)

(assert (=> b!847563 (= lt!381602 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!322 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847564 () Bool)

(declare-fun e!472915 () Bool)

(declare-fun e!472917 () Bool)

(declare-fun mapRes!25649 () Bool)

(assert (=> b!847564 (= e!472915 (and e!472917 mapRes!25649))))

(declare-fun condMapEmpty!25649 () Bool)

(declare-fun mapDefault!25649 () ValueCell!7577)

(assert (=> b!847564 (= condMapEmpty!25649 (= (arr!23169 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7577)) mapDefault!25649)))))

(declare-fun b!847565 () Bool)

(declare-fun res!575907 () Bool)

(assert (=> b!847565 (=> (not res!575907) (not e!472914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!847565 (= res!575907 (validMask!0 mask!1196))))

(declare-fun b!847566 () Bool)

(declare-fun tp_is_empty!16033 () Bool)

(assert (=> b!847566 (= e!472917 tp_is_empty!16033)))

(declare-fun mapIsEmpty!25649 () Bool)

(assert (=> mapIsEmpty!25649 mapRes!25649))

(declare-fun b!847568 () Bool)

(declare-fun res!575909 () Bool)

(assert (=> b!847568 (=> (not res!575909) (not e!472914))))

(assert (=> b!847568 (= res!575909 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23612 _keys!868))))))

(declare-fun b!847569 () Bool)

(declare-fun res!575905 () Bool)

(assert (=> b!847569 (=> (not res!575905) (not e!472914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48277 (_ BitVec 32)) Bool)

(assert (=> b!847569 (= res!575905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!847570 () Bool)

(declare-fun e!472912 () Bool)

(assert (=> b!847570 (= e!472912 tp_is_empty!16033)))

(declare-fun b!847571 () Bool)

(declare-fun res!575908 () Bool)

(assert (=> b!847571 (=> (not res!575908) (not e!472914))))

(declare-datatypes ((List!16422 0))(
  ( (Nil!16419) (Cons!16418 (h!17549 (_ BitVec 64)) (t!22784 List!16422)) )
))
(declare-fun arrayNoDuplicates!0 (array!48277 (_ BitVec 32) List!16422) Bool)

(assert (=> b!847571 (= res!575908 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16419))))

(declare-fun bm!37517 () Bool)

(assert (=> bm!37517 (= call!37520 (getCurrentListMapNoExtraKeys!2691 _keys!868 lt!381605 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847572 () Bool)

(assert (=> b!847572 (= e!472913 (= call!37520 call!37521))))

(declare-fun b!847567 () Bool)

(declare-fun res!575904 () Bool)

(assert (=> b!847567 (=> (not res!575904) (not e!472914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!847567 (= res!575904 (validKeyInArray!0 k0!854))))

(declare-fun res!575902 () Bool)

(assert (=> start!72964 (=> (not res!575902) (not e!472914))))

(assert (=> start!72964 (= res!575902 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23612 _keys!868))))))

(assert (=> start!72964 e!472914))

(assert (=> start!72964 tp_is_empty!16033))

(assert (=> start!72964 true))

(assert (=> start!72964 tp!49195))

(declare-fun array_inv!18476 (array!48277) Bool)

(assert (=> start!72964 (array_inv!18476 _keys!868)))

(declare-fun array_inv!18477 (array!48275) Bool)

(assert (=> start!72964 (and (array_inv!18477 _values!688) e!472915)))

(declare-fun mapNonEmpty!25649 () Bool)

(declare-fun tp!49196 () Bool)

(assert (=> mapNonEmpty!25649 (= mapRes!25649 (and tp!49196 e!472912))))

(declare-fun mapKey!25649 () (_ BitVec 32))

(declare-fun mapValue!25649 () ValueCell!7577)

(declare-fun mapRest!25649 () (Array (_ BitVec 32) ValueCell!7577))

(assert (=> mapNonEmpty!25649 (= (arr!23169 _values!688) (store mapRest!25649 mapKey!25649 mapValue!25649))))

(declare-fun bm!37518 () Bool)

(assert (=> bm!37518 (= call!37521 (getCurrentListMapNoExtraKeys!2691 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72964 res!575902) b!847565))

(assert (= (and b!847565 res!575907) b!847561))

(assert (= (and b!847561 res!575906) b!847569))

(assert (= (and b!847569 res!575905) b!847571))

(assert (= (and b!847571 res!575908) b!847568))

(assert (= (and b!847568 res!575909) b!847567))

(assert (= (and b!847567 res!575904) b!847560))

(assert (= (and b!847560 res!575910) b!847559))

(assert (= (and b!847559 res!575903) b!847563))

(assert (= (and b!847563 c!91451) b!847562))

(assert (= (and b!847563 (not c!91451)) b!847572))

(assert (= (or b!847562 b!847572) bm!37517))

(assert (= (or b!847562 b!847572) bm!37518))

(assert (= (and b!847564 condMapEmpty!25649) mapIsEmpty!25649))

(assert (= (and b!847564 (not condMapEmpty!25649)) mapNonEmpty!25649))

(get-info :version)

(assert (= (and mapNonEmpty!25649 ((_ is ValueCellFull!7577) mapValue!25649)) b!847570))

(assert (= (and b!847564 ((_ is ValueCellFull!7577) mapDefault!25649)) b!847566))

(assert (= start!72964 b!847564))

(declare-fun m!788009 () Bool)

(assert (=> b!847560 m!788009))

(declare-fun m!788011 () Bool)

(assert (=> b!847562 m!788011))

(declare-fun m!788013 () Bool)

(assert (=> b!847563 m!788013))

(declare-fun m!788015 () Bool)

(assert (=> bm!37517 m!788015))

(declare-fun m!788017 () Bool)

(assert (=> b!847571 m!788017))

(declare-fun m!788019 () Bool)

(assert (=> b!847569 m!788019))

(declare-fun m!788021 () Bool)

(assert (=> b!847565 m!788021))

(declare-fun m!788023 () Bool)

(assert (=> bm!37518 m!788023))

(declare-fun m!788025 () Bool)

(assert (=> start!72964 m!788025))

(declare-fun m!788027 () Bool)

(assert (=> start!72964 m!788027))

(declare-fun m!788029 () Bool)

(assert (=> mapNonEmpty!25649 m!788029))

(declare-fun m!788031 () Bool)

(assert (=> b!847559 m!788031))

(declare-fun m!788033 () Bool)

(assert (=> b!847559 m!788033))

(declare-fun m!788035 () Bool)

(assert (=> b!847559 m!788035))

(declare-fun m!788037 () Bool)

(assert (=> b!847567 m!788037))

(check-sat (not mapNonEmpty!25649) (not start!72964) tp_is_empty!16033 b_and!22957 (not b!847565) (not b!847563) (not b_next!13897) (not b!847562) (not b!847559) (not b!847571) (not bm!37518) (not bm!37517) (not b!847567) (not b!847569))
(check-sat b_and!22957 (not b_next!13897))
