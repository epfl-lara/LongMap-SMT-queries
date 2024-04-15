; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74884 () Bool)

(assert start!74884)

(declare-fun b_free!15421 () Bool)

(declare-fun b_next!15421 () Bool)

(assert (=> start!74884 (= b_free!15421 (not b_next!15421))))

(declare-fun tp!53966 () Bool)

(declare-fun b_and!25515 () Bool)

(assert (=> start!74884 (= tp!53966 b_and!25515)))

(declare-fun b!882853 () Bool)

(declare-fun res!599849 () Bool)

(declare-fun e!491342 () Bool)

(assert (=> b!882853 (=> (not res!599849) (not e!491342))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!51443 0))(
  ( (array!51444 (arr!24741 (Array (_ BitVec 32) (_ BitVec 64))) (size!25183 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51443)

(declare-datatypes ((V!28601 0))(
  ( (V!28602 (val!8880 Int)) )
))
(declare-datatypes ((ValueCell!8393 0))(
  ( (ValueCellFull!8393 (v!11343 V!28601)) (EmptyCell!8393) )
))
(declare-datatypes ((array!51445 0))(
  ( (array!51446 (arr!24742 (Array (_ BitVec 32) ValueCell!8393)) (size!25184 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51445)

(assert (=> b!882853 (= res!599849 (and (= (size!25184 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25183 _keys!868) (size!25184 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28134 () Bool)

(declare-fun mapRes!28134 () Bool)

(declare-fun tp!53967 () Bool)

(declare-fun e!491336 () Bool)

(assert (=> mapNonEmpty!28134 (= mapRes!28134 (and tp!53967 e!491336))))

(declare-fun mapValue!28134 () ValueCell!8393)

(declare-fun mapRest!28134 () (Array (_ BitVec 32) ValueCell!8393))

(declare-fun mapKey!28134 () (_ BitVec 32))

(assert (=> mapNonEmpty!28134 (= (arr!24742 _values!688) (store mapRest!28134 mapKey!28134 mapValue!28134))))

(declare-fun b!882854 () Bool)

(declare-fun res!599848 () Bool)

(assert (=> b!882854 (=> (not res!599848) (not e!491342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51443 (_ BitVec 32)) Bool)

(assert (=> b!882854 (= res!599848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!882855 () Bool)

(declare-fun res!599854 () Bool)

(assert (=> b!882855 (=> (not res!599854) (not e!491342))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!882855 (= res!599854 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25183 _keys!868))))))

(declare-fun res!599847 () Bool)

(assert (=> start!74884 (=> (not res!599847) (not e!491342))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74884 (= res!599847 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25183 _keys!868))))))

(assert (=> start!74884 e!491342))

(declare-fun tp_is_empty!17665 () Bool)

(assert (=> start!74884 tp_is_empty!17665))

(assert (=> start!74884 true))

(assert (=> start!74884 tp!53966))

(declare-fun array_inv!19530 (array!51443) Bool)

(assert (=> start!74884 (array_inv!19530 _keys!868)))

(declare-fun e!491339 () Bool)

(declare-fun array_inv!19531 (array!51445) Bool)

(assert (=> start!74884 (and (array_inv!19531 _values!688) e!491339)))

(declare-fun b!882856 () Bool)

(declare-fun res!599850 () Bool)

(assert (=> b!882856 (=> (not res!599850) (not e!491342))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!882856 (= res!599850 (and (= (select (arr!24741 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!882857 () Bool)

(declare-fun e!491341 () Bool)

(declare-fun e!491337 () Bool)

(assert (=> b!882857 (= e!491341 e!491337)))

(declare-fun res!599853 () Bool)

(assert (=> b!882857 (=> res!599853 e!491337)))

(assert (=> b!882857 (= res!599853 (not (= (select (arr!24741 _keys!868) from!1053) k0!854)))))

(declare-datatypes ((tuple2!11782 0))(
  ( (tuple2!11783 (_1!5902 (_ BitVec 64)) (_2!5902 V!28601)) )
))
(declare-datatypes ((List!17578 0))(
  ( (Nil!17575) (Cons!17574 (h!18705 tuple2!11782) (t!24792 List!17578)) )
))
(declare-datatypes ((ListLongMap!10541 0))(
  ( (ListLongMap!10542 (toList!5286 List!17578)) )
))
(declare-fun lt!399366 () ListLongMap!10541)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!399375 () ListLongMap!10541)

(declare-fun +!2578 (ListLongMap!10541 tuple2!11782) ListLongMap!10541)

(declare-fun get!13042 (ValueCell!8393 V!28601) V!28601)

(declare-fun dynLambda!1266 (Int (_ BitVec 64)) V!28601)

(assert (=> b!882857 (= lt!399375 (+!2578 lt!399366 (tuple2!11783 (select (arr!24741 _keys!868) from!1053) (get!13042 (select (arr!24742 _values!688) from!1053) (dynLambda!1266 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!882858 () Bool)

(declare-fun res!599856 () Bool)

(assert (=> b!882858 (=> (not res!599856) (not e!491342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!882858 (= res!599856 (validKeyInArray!0 k0!854))))

(declare-fun b!882859 () Bool)

(declare-fun res!599852 () Bool)

(assert (=> b!882859 (=> (not res!599852) (not e!491342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!882859 (= res!599852 (validMask!0 mask!1196))))

(declare-fun b!882860 () Bool)

(assert (=> b!882860 (= e!491337 true)))

(assert (=> b!882860 false))

(declare-datatypes ((Unit!30067 0))(
  ( (Unit!30068) )
))
(declare-fun lt!399373 () Unit!30067)

(declare-datatypes ((List!17579 0))(
  ( (Nil!17576) (Cons!17575 (h!18706 (_ BitVec 64)) (t!24793 List!17579)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51443 (_ BitVec 64) (_ BitVec 32) List!17579) Unit!30067)

(assert (=> b!882860 (= lt!399373 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!17576))))

(declare-fun arrayContainsKey!0 (array!51443 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!882860 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399372 () Unit!30067)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51443 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30067)

(assert (=> b!882860 (= lt!399372 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayNoDuplicates!0 (array!51443 (_ BitVec 32) List!17579) Bool)

(assert (=> b!882860 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17576)))

(declare-fun lt!399371 () Unit!30067)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51443 (_ BitVec 32) (_ BitVec 32)) Unit!30067)

(assert (=> b!882860 (= lt!399371 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!882861 () Bool)

(declare-fun res!599855 () Bool)

(assert (=> b!882861 (=> (not res!599855) (not e!491342))))

(assert (=> b!882861 (= res!599855 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17576))))

(declare-fun b!882862 () Bool)

(assert (=> b!882862 (= e!491336 tp_is_empty!17665)))

(declare-fun mapIsEmpty!28134 () Bool)

(assert (=> mapIsEmpty!28134 mapRes!28134))

(declare-fun b!882863 () Bool)

(declare-fun e!491340 () Bool)

(assert (=> b!882863 (= e!491339 (and e!491340 mapRes!28134))))

(declare-fun condMapEmpty!28134 () Bool)

(declare-fun mapDefault!28134 () ValueCell!8393)

(assert (=> b!882863 (= condMapEmpty!28134 (= (arr!24742 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8393)) mapDefault!28134)))))

(declare-fun b!882864 () Bool)

(declare-fun e!491338 () Bool)

(assert (=> b!882864 (= e!491342 e!491338)))

(declare-fun res!599851 () Bool)

(assert (=> b!882864 (=> (not res!599851) (not e!491338))))

(assert (=> b!882864 (= res!599851 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399374 () array!51445)

(declare-fun minValue!654 () V!28601)

(declare-fun zeroValue!654 () V!28601)

(declare-fun getCurrentListMapNoExtraKeys!3277 (array!51443 array!51445 (_ BitVec 32) (_ BitVec 32) V!28601 V!28601 (_ BitVec 32) Int) ListLongMap!10541)

(assert (=> b!882864 (= lt!399375 (getCurrentListMapNoExtraKeys!3277 _keys!868 lt!399374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28601)

(assert (=> b!882864 (= lt!399374 (array!51446 (store (arr!24742 _values!688) i!612 (ValueCellFull!8393 v!557)) (size!25184 _values!688)))))

(declare-fun lt!399368 () ListLongMap!10541)

(assert (=> b!882864 (= lt!399368 (getCurrentListMapNoExtraKeys!3277 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!882865 () Bool)

(assert (=> b!882865 (= e!491338 (not e!491341))))

(declare-fun res!599857 () Bool)

(assert (=> b!882865 (=> res!599857 e!491341)))

(assert (=> b!882865 (= res!599857 (not (validKeyInArray!0 (select (arr!24741 _keys!868) from!1053))))))

(declare-fun lt!399370 () ListLongMap!10541)

(assert (=> b!882865 (= lt!399370 lt!399366)))

(declare-fun lt!399367 () ListLongMap!10541)

(assert (=> b!882865 (= lt!399366 (+!2578 lt!399367 (tuple2!11783 k0!854 v!557)))))

(assert (=> b!882865 (= lt!399370 (getCurrentListMapNoExtraKeys!3277 _keys!868 lt!399374 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!882865 (= lt!399367 (getCurrentListMapNoExtraKeys!3277 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399369 () Unit!30067)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!742 (array!51443 array!51445 (_ BitVec 32) (_ BitVec 32) V!28601 V!28601 (_ BitVec 32) (_ BitVec 64) V!28601 (_ BitVec 32) Int) Unit!30067)

(assert (=> b!882865 (= lt!399369 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!742 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!882866 () Bool)

(assert (=> b!882866 (= e!491340 tp_is_empty!17665)))

(assert (= (and start!74884 res!599847) b!882859))

(assert (= (and b!882859 res!599852) b!882853))

(assert (= (and b!882853 res!599849) b!882854))

(assert (= (and b!882854 res!599848) b!882861))

(assert (= (and b!882861 res!599855) b!882855))

(assert (= (and b!882855 res!599854) b!882858))

(assert (= (and b!882858 res!599856) b!882856))

(assert (= (and b!882856 res!599850) b!882864))

(assert (= (and b!882864 res!599851) b!882865))

(assert (= (and b!882865 (not res!599857)) b!882857))

(assert (= (and b!882857 (not res!599853)) b!882860))

(assert (= (and b!882863 condMapEmpty!28134) mapIsEmpty!28134))

(assert (= (and b!882863 (not condMapEmpty!28134)) mapNonEmpty!28134))

(get-info :version)

(assert (= (and mapNonEmpty!28134 ((_ is ValueCellFull!8393) mapValue!28134)) b!882862))

(assert (= (and b!882863 ((_ is ValueCellFull!8393) mapDefault!28134)) b!882866))

(assert (= start!74884 b!882863))

(declare-fun b_lambda!12681 () Bool)

(assert (=> (not b_lambda!12681) (not b!882857)))

(declare-fun t!24791 () Bool)

(declare-fun tb!5071 () Bool)

(assert (=> (and start!74884 (= defaultEntry!696 defaultEntry!696) t!24791) tb!5071))

(declare-fun result!9785 () Bool)

(assert (=> tb!5071 (= result!9785 tp_is_empty!17665)))

(assert (=> b!882857 t!24791))

(declare-fun b_and!25517 () Bool)

(assert (= b_and!25515 (and (=> t!24791 result!9785) b_and!25517)))

(declare-fun m!822351 () Bool)

(assert (=> b!882864 m!822351))

(declare-fun m!822353 () Bool)

(assert (=> b!882864 m!822353))

(declare-fun m!822355 () Bool)

(assert (=> b!882864 m!822355))

(declare-fun m!822357 () Bool)

(assert (=> b!882860 m!822357))

(declare-fun m!822359 () Bool)

(assert (=> b!882860 m!822359))

(declare-fun m!822361 () Bool)

(assert (=> b!882860 m!822361))

(declare-fun m!822363 () Bool)

(assert (=> b!882860 m!822363))

(declare-fun m!822365 () Bool)

(assert (=> b!882860 m!822365))

(declare-fun m!822367 () Bool)

(assert (=> b!882856 m!822367))

(declare-fun m!822369 () Bool)

(assert (=> b!882854 m!822369))

(declare-fun m!822371 () Bool)

(assert (=> b!882861 m!822371))

(declare-fun m!822373 () Bool)

(assert (=> mapNonEmpty!28134 m!822373))

(declare-fun m!822375 () Bool)

(assert (=> b!882859 m!822375))

(declare-fun m!822377 () Bool)

(assert (=> b!882858 m!822377))

(declare-fun m!822379 () Bool)

(assert (=> b!882857 m!822379))

(declare-fun m!822381 () Bool)

(assert (=> b!882857 m!822381))

(declare-fun m!822383 () Bool)

(assert (=> b!882857 m!822383))

(assert (=> b!882857 m!822379))

(declare-fun m!822385 () Bool)

(assert (=> b!882857 m!822385))

(declare-fun m!822387 () Bool)

(assert (=> b!882857 m!822387))

(assert (=> b!882857 m!822381))

(declare-fun m!822389 () Bool)

(assert (=> start!74884 m!822389))

(declare-fun m!822391 () Bool)

(assert (=> start!74884 m!822391))

(declare-fun m!822393 () Bool)

(assert (=> b!882865 m!822393))

(assert (=> b!882865 m!822387))

(declare-fun m!822395 () Bool)

(assert (=> b!882865 m!822395))

(assert (=> b!882865 m!822387))

(declare-fun m!822397 () Bool)

(assert (=> b!882865 m!822397))

(declare-fun m!822399 () Bool)

(assert (=> b!882865 m!822399))

(declare-fun m!822401 () Bool)

(assert (=> b!882865 m!822401))

(check-sat (not b!882859) (not b!882861) (not start!74884) (not b_lambda!12681) (not b!882865) (not b!882858) (not b!882857) (not b!882864) (not b_next!15421) b_and!25517 (not b!882854) (not mapNonEmpty!28134) (not b!882860) tp_is_empty!17665)
(check-sat b_and!25517 (not b_next!15421))
