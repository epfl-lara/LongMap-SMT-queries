; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72592 () Bool)

(assert start!72592)

(declare-fun b_free!13609 () Bool)

(declare-fun b_next!13609 () Bool)

(assert (=> start!72592 (= b_free!13609 (not b_next!13609))))

(declare-fun tp!47927 () Bool)

(declare-fun b_and!22705 () Bool)

(assert (=> start!72592 (= tp!47927 b_and!22705)))

(declare-fun b!840590 () Bool)

(declare-fun e!469178 () Bool)

(declare-fun tp_is_empty!15475 () Bool)

(assert (=> b!840590 (= e!469178 tp_is_empty!15475)))

(declare-fun bm!37102 () Bool)

(declare-datatypes ((V!25681 0))(
  ( (V!25682 (val!7785 Int)) )
))
(declare-fun v!557 () V!25681)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47245 0))(
  ( (array!47246 (arr!22649 (Array (_ BitVec 32) (_ BitVec 64))) (size!23090 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47245)

(declare-datatypes ((ValueCell!7298 0))(
  ( (ValueCellFull!7298 (v!10210 V!25681)) (EmptyCell!7298) )
))
(declare-datatypes ((array!47247 0))(
  ( (array!47248 (arr!22650 (Array (_ BitVec 32) ValueCell!7298)) (size!23091 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47247)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25681)

(declare-fun zeroValue!654 () V!25681)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10240 0))(
  ( (tuple2!10241 (_1!5131 (_ BitVec 64)) (_2!5131 V!25681)) )
))
(declare-datatypes ((List!16017 0))(
  ( (Nil!16014) (Cons!16013 (h!17150 tuple2!10240) (t!22380 List!16017)) )
))
(declare-datatypes ((ListLongMap!9011 0))(
  ( (ListLongMap!9012 (toList!4521 List!16017)) )
))
(declare-fun call!37105 () ListLongMap!9011)

(declare-fun getCurrentListMapNoExtraKeys!2583 (array!47245 array!47247 (_ BitVec 32) (_ BitVec 32) V!25681 V!25681 (_ BitVec 32) Int) ListLongMap!9011)

(assert (=> bm!37102 (= call!37105 (getCurrentListMapNoExtraKeys!2583 _keys!868 (array!47248 (store (arr!22650 _values!688) i!612 (ValueCellFull!7298 v!557)) (size!23091 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840592 () Bool)

(declare-fun res!571243 () Bool)

(declare-fun e!469180 () Bool)

(assert (=> b!840592 (=> (not res!571243) (not e!469180))))

(declare-datatypes ((List!16018 0))(
  ( (Nil!16015) (Cons!16014 (h!17151 (_ BitVec 64)) (t!22381 List!16018)) )
))
(declare-fun arrayNoDuplicates!0 (array!47245 (_ BitVec 32) List!16018) Bool)

(assert (=> b!840592 (= res!571243 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16015))))

(declare-fun b!840593 () Bool)

(declare-fun res!571248 () Bool)

(assert (=> b!840593 (=> (not res!571248) (not e!469180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47245 (_ BitVec 32)) Bool)

(assert (=> b!840593 (= res!571248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!24812 () Bool)

(declare-fun mapRes!24812 () Bool)

(assert (=> mapIsEmpty!24812 mapRes!24812))

(declare-fun b!840594 () Bool)

(assert (=> b!840594 (= e!469180 (not true))))

(declare-fun e!469176 () Bool)

(assert (=> b!840594 e!469176))

(declare-fun c!91555 () Bool)

(assert (=> b!840594 (= c!91555 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28852 0))(
  ( (Unit!28853) )
))
(declare-fun lt!381140 () Unit!28852)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!262 (array!47245 array!47247 (_ BitVec 32) (_ BitVec 32) V!25681 V!25681 (_ BitVec 32) (_ BitVec 64) V!25681 (_ BitVec 32) Int) Unit!28852)

(assert (=> b!840594 (= lt!381140 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!262 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840591 () Bool)

(declare-fun call!37106 () ListLongMap!9011)

(declare-fun +!2033 (ListLongMap!9011 tuple2!10240) ListLongMap!9011)

(assert (=> b!840591 (= e!469176 (= call!37105 (+!2033 call!37106 (tuple2!10241 k0!854 v!557))))))

(declare-fun res!571249 () Bool)

(assert (=> start!72592 (=> (not res!571249) (not e!469180))))

(assert (=> start!72592 (= res!571249 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23090 _keys!868))))))

(assert (=> start!72592 e!469180))

(assert (=> start!72592 tp_is_empty!15475))

(assert (=> start!72592 true))

(assert (=> start!72592 tp!47927))

(declare-fun array_inv!18078 (array!47245) Bool)

(assert (=> start!72592 (array_inv!18078 _keys!868)))

(declare-fun e!469177 () Bool)

(declare-fun array_inv!18079 (array!47247) Bool)

(assert (=> start!72592 (and (array_inv!18079 _values!688) e!469177)))

(declare-fun mapNonEmpty!24812 () Bool)

(declare-fun tp!47926 () Bool)

(assert (=> mapNonEmpty!24812 (= mapRes!24812 (and tp!47926 e!469178))))

(declare-fun mapKey!24812 () (_ BitVec 32))

(declare-fun mapValue!24812 () ValueCell!7298)

(declare-fun mapRest!24812 () (Array (_ BitVec 32) ValueCell!7298))

(assert (=> mapNonEmpty!24812 (= (arr!22650 _values!688) (store mapRest!24812 mapKey!24812 mapValue!24812))))

(declare-fun b!840595 () Bool)

(declare-fun e!469175 () Bool)

(assert (=> b!840595 (= e!469175 tp_is_empty!15475)))

(declare-fun b!840596 () Bool)

(assert (=> b!840596 (= e!469176 (= call!37105 call!37106))))

(declare-fun bm!37103 () Bool)

(assert (=> bm!37103 (= call!37106 (getCurrentListMapNoExtraKeys!2583 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840597 () Bool)

(assert (=> b!840597 (= e!469177 (and e!469175 mapRes!24812))))

(declare-fun condMapEmpty!24812 () Bool)

(declare-fun mapDefault!24812 () ValueCell!7298)

(assert (=> b!840597 (= condMapEmpty!24812 (= (arr!22650 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7298)) mapDefault!24812)))))

(declare-fun b!840598 () Bool)

(declare-fun res!571246 () Bool)

(assert (=> b!840598 (=> (not res!571246) (not e!469180))))

(assert (=> b!840598 (= res!571246 (and (= (select (arr!22649 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23090 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840599 () Bool)

(declare-fun res!571245 () Bool)

(assert (=> b!840599 (=> (not res!571245) (not e!469180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840599 (= res!571245 (validMask!0 mask!1196))))

(declare-fun b!840600 () Bool)

(declare-fun res!571247 () Bool)

(assert (=> b!840600 (=> (not res!571247) (not e!469180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840600 (= res!571247 (validKeyInArray!0 k0!854))))

(declare-fun b!840601 () Bool)

(declare-fun res!571244 () Bool)

(assert (=> b!840601 (=> (not res!571244) (not e!469180))))

(assert (=> b!840601 (= res!571244 (and (= (size!23091 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23090 _keys!868) (size!23091 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840602 () Bool)

(declare-fun res!571242 () Bool)

(assert (=> b!840602 (=> (not res!571242) (not e!469180))))

(assert (=> b!840602 (= res!571242 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23090 _keys!868))))))

(assert (= (and start!72592 res!571249) b!840599))

(assert (= (and b!840599 res!571245) b!840601))

(assert (= (and b!840601 res!571244) b!840593))

(assert (= (and b!840593 res!571248) b!840592))

(assert (= (and b!840592 res!571243) b!840602))

(assert (= (and b!840602 res!571242) b!840600))

(assert (= (and b!840600 res!571247) b!840598))

(assert (= (and b!840598 res!571246) b!840594))

(assert (= (and b!840594 c!91555) b!840591))

(assert (= (and b!840594 (not c!91555)) b!840596))

(assert (= (or b!840591 b!840596) bm!37102))

(assert (= (or b!840591 b!840596) bm!37103))

(assert (= (and b!840597 condMapEmpty!24812) mapIsEmpty!24812))

(assert (= (and b!840597 (not condMapEmpty!24812)) mapNonEmpty!24812))

(get-info :version)

(assert (= (and mapNonEmpty!24812 ((_ is ValueCellFull!7298) mapValue!24812)) b!840590))

(assert (= (and b!840597 ((_ is ValueCellFull!7298) mapDefault!24812)) b!840595))

(assert (= start!72592 b!840597))

(declare-fun m!785003 () Bool)

(assert (=> mapNonEmpty!24812 m!785003))

(declare-fun m!785005 () Bool)

(assert (=> b!840594 m!785005))

(declare-fun m!785007 () Bool)

(assert (=> b!840593 m!785007))

(declare-fun m!785009 () Bool)

(assert (=> b!840600 m!785009))

(declare-fun m!785011 () Bool)

(assert (=> start!72592 m!785011))

(declare-fun m!785013 () Bool)

(assert (=> start!72592 m!785013))

(declare-fun m!785015 () Bool)

(assert (=> b!840592 m!785015))

(declare-fun m!785017 () Bool)

(assert (=> bm!37102 m!785017))

(declare-fun m!785019 () Bool)

(assert (=> bm!37102 m!785019))

(declare-fun m!785021 () Bool)

(assert (=> b!840591 m!785021))

(declare-fun m!785023 () Bool)

(assert (=> b!840599 m!785023))

(declare-fun m!785025 () Bool)

(assert (=> bm!37103 m!785025))

(declare-fun m!785027 () Bool)

(assert (=> b!840598 m!785027))

(check-sat (not bm!37103) (not bm!37102) (not b!840592) (not b!840600) (not b!840591) tp_is_empty!15475 b_and!22705 (not b_next!13609) (not b!840594) (not start!72592) (not b!840599) (not mapNonEmpty!24812) (not b!840593))
(check-sat b_and!22705 (not b_next!13609))
