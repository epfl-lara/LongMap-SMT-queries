; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72382 () Bool)

(assert start!72382)

(declare-fun b_free!13585 () Bool)

(declare-fun b_next!13585 () Bool)

(assert (=> start!72382 (= b_free!13585 (not b_next!13585))))

(declare-fun tp!47854 () Bool)

(declare-fun b_and!22645 () Bool)

(assert (=> start!72382 (= tp!47854 b_and!22645)))

(declare-fun b!838980 () Bool)

(declare-fun res!570502 () Bool)

(declare-fun e!468231 () Bool)

(assert (=> b!838980 (=> (not res!570502) (not e!468231))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!838980 (= res!570502 (validKeyInArray!0 k0!854))))

(declare-fun bm!36959 () Bool)

(declare-datatypes ((V!25649 0))(
  ( (V!25650 (val!7773 Int)) )
))
(declare-fun v!557 () V!25649)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10302 0))(
  ( (tuple2!10303 (_1!5162 (_ BitVec 64)) (_2!5162 V!25649)) )
))
(declare-datatypes ((List!16092 0))(
  ( (Nil!16089) (Cons!16088 (h!17219 tuple2!10302) (t!22454 List!16092)) )
))
(declare-datatypes ((ListLongMap!9061 0))(
  ( (ListLongMap!9062 (toList!4546 List!16092)) )
))
(declare-fun call!36962 () ListLongMap!9061)

(declare-datatypes ((array!47163 0))(
  ( (array!47164 (arr!22613 (Array (_ BitVec 32) (_ BitVec 64))) (size!23055 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47163)

(declare-datatypes ((ValueCell!7286 0))(
  ( (ValueCellFull!7286 (v!10192 V!25649)) (EmptyCell!7286) )
))
(declare-datatypes ((array!47165 0))(
  ( (array!47166 (arr!22614 (Array (_ BitVec 32) ValueCell!7286)) (size!23056 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47165)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25649)

(declare-fun zeroValue!654 () V!25649)

(declare-fun getCurrentListMapNoExtraKeys!2566 (array!47163 array!47165 (_ BitVec 32) (_ BitVec 32) V!25649 V!25649 (_ BitVec 32) Int) ListLongMap!9061)

(assert (=> bm!36959 (= call!36962 (getCurrentListMapNoExtraKeys!2566 _keys!868 (array!47166 (store (arr!22614 _values!688) i!612 (ValueCellFull!7286 v!557)) (size!23056 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838981 () Bool)

(declare-fun res!570503 () Bool)

(assert (=> b!838981 (=> (not res!570503) (not e!468231))))

(assert (=> b!838981 (= res!570503 (and (= (size!23056 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23055 _keys!868) (size!23056 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838982 () Bool)

(assert (=> b!838982 (= e!468231 (not true))))

(declare-fun e!468229 () Bool)

(assert (=> b!838982 e!468229))

(declare-fun c!91172 () Bool)

(assert (=> b!838982 (= c!91172 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28765 0))(
  ( (Unit!28766) )
))
(declare-fun lt!380507 () Unit!28765)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!257 (array!47163 array!47165 (_ BitVec 32) (_ BitVec 32) V!25649 V!25649 (_ BitVec 32) (_ BitVec 64) V!25649 (_ BitVec 32) Int) Unit!28765)

(assert (=> b!838982 (= lt!380507 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!257 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!36963 () ListLongMap!9061)

(declare-fun bm!36960 () Bool)

(assert (=> bm!36960 (= call!36963 (getCurrentListMapNoExtraKeys!2566 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!838983 () Bool)

(declare-fun e!468230 () Bool)

(declare-fun tp_is_empty!15451 () Bool)

(assert (=> b!838983 (= e!468230 tp_is_empty!15451)))

(declare-fun b!838984 () Bool)

(assert (=> b!838984 (= e!468229 (= call!36962 call!36963))))

(declare-fun b!838985 () Bool)

(declare-fun res!570501 () Bool)

(assert (=> b!838985 (=> (not res!570501) (not e!468231))))

(declare-datatypes ((List!16093 0))(
  ( (Nil!16090) (Cons!16089 (h!17220 (_ BitVec 64)) (t!22455 List!16093)) )
))
(declare-fun arrayNoDuplicates!0 (array!47163 (_ BitVec 32) List!16093) Bool)

(assert (=> b!838985 (= res!570501 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16090))))

(declare-fun res!570504 () Bool)

(assert (=> start!72382 (=> (not res!570504) (not e!468231))))

(assert (=> start!72382 (= res!570504 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23055 _keys!868))))))

(assert (=> start!72382 e!468231))

(assert (=> start!72382 tp_is_empty!15451))

(assert (=> start!72382 true))

(assert (=> start!72382 tp!47854))

(declare-fun array_inv!18082 (array!47163) Bool)

(assert (=> start!72382 (array_inv!18082 _keys!868)))

(declare-fun e!468234 () Bool)

(declare-fun array_inv!18083 (array!47165) Bool)

(assert (=> start!72382 (and (array_inv!18083 _values!688) e!468234)))

(declare-fun b!838986 () Bool)

(declare-fun mapRes!24776 () Bool)

(assert (=> b!838986 (= e!468234 (and e!468230 mapRes!24776))))

(declare-fun condMapEmpty!24776 () Bool)

(declare-fun mapDefault!24776 () ValueCell!7286)

(assert (=> b!838986 (= condMapEmpty!24776 (= (arr!22614 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7286)) mapDefault!24776)))))

(declare-fun b!838987 () Bool)

(declare-fun res!570505 () Bool)

(assert (=> b!838987 (=> (not res!570505) (not e!468231))))

(assert (=> b!838987 (= res!570505 (and (= (select (arr!22613 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23055 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!24776 () Bool)

(declare-fun tp!47855 () Bool)

(declare-fun e!468232 () Bool)

(assert (=> mapNonEmpty!24776 (= mapRes!24776 (and tp!47855 e!468232))))

(declare-fun mapValue!24776 () ValueCell!7286)

(declare-fun mapKey!24776 () (_ BitVec 32))

(declare-fun mapRest!24776 () (Array (_ BitVec 32) ValueCell!7286))

(assert (=> mapNonEmpty!24776 (= (arr!22614 _values!688) (store mapRest!24776 mapKey!24776 mapValue!24776))))

(declare-fun mapIsEmpty!24776 () Bool)

(assert (=> mapIsEmpty!24776 mapRes!24776))

(declare-fun b!838988 () Bool)

(declare-fun res!570507 () Bool)

(assert (=> b!838988 (=> (not res!570507) (not e!468231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47163 (_ BitVec 32)) Bool)

(assert (=> b!838988 (= res!570507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838989 () Bool)

(assert (=> b!838989 (= e!468232 tp_is_empty!15451)))

(declare-fun b!838990 () Bool)

(declare-fun +!2041 (ListLongMap!9061 tuple2!10302) ListLongMap!9061)

(assert (=> b!838990 (= e!468229 (= call!36962 (+!2041 call!36963 (tuple2!10303 k0!854 v!557))))))

(declare-fun b!838991 () Bool)

(declare-fun res!570506 () Bool)

(assert (=> b!838991 (=> (not res!570506) (not e!468231))))

(assert (=> b!838991 (= res!570506 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23055 _keys!868))))))

(declare-fun b!838992 () Bool)

(declare-fun res!570500 () Bool)

(assert (=> b!838992 (=> (not res!570500) (not e!468231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838992 (= res!570500 (validMask!0 mask!1196))))

(assert (= (and start!72382 res!570504) b!838992))

(assert (= (and b!838992 res!570500) b!838981))

(assert (= (and b!838981 res!570503) b!838988))

(assert (= (and b!838988 res!570507) b!838985))

(assert (= (and b!838985 res!570501) b!838991))

(assert (= (and b!838991 res!570506) b!838980))

(assert (= (and b!838980 res!570502) b!838987))

(assert (= (and b!838987 res!570505) b!838982))

(assert (= (and b!838982 c!91172) b!838990))

(assert (= (and b!838982 (not c!91172)) b!838984))

(assert (= (or b!838990 b!838984) bm!36959))

(assert (= (or b!838990 b!838984) bm!36960))

(assert (= (and b!838986 condMapEmpty!24776) mapIsEmpty!24776))

(assert (= (and b!838986 (not condMapEmpty!24776)) mapNonEmpty!24776))

(get-info :version)

(assert (= (and mapNonEmpty!24776 ((_ is ValueCellFull!7286) mapValue!24776)) b!838989))

(assert (= (and b!838986 ((_ is ValueCellFull!7286) mapDefault!24776)) b!838983))

(assert (= start!72382 b!838986))

(declare-fun m!782645 () Bool)

(assert (=> start!72382 m!782645))

(declare-fun m!782647 () Bool)

(assert (=> start!72382 m!782647))

(declare-fun m!782649 () Bool)

(assert (=> bm!36960 m!782649))

(declare-fun m!782651 () Bool)

(assert (=> b!838982 m!782651))

(declare-fun m!782653 () Bool)

(assert (=> b!838988 m!782653))

(declare-fun m!782655 () Bool)

(assert (=> mapNonEmpty!24776 m!782655))

(declare-fun m!782657 () Bool)

(assert (=> b!838990 m!782657))

(declare-fun m!782659 () Bool)

(assert (=> b!838992 m!782659))

(declare-fun m!782661 () Bool)

(assert (=> b!838985 m!782661))

(declare-fun m!782663 () Bool)

(assert (=> bm!36959 m!782663))

(declare-fun m!782665 () Bool)

(assert (=> bm!36959 m!782665))

(declare-fun m!782667 () Bool)

(assert (=> b!838987 m!782667))

(declare-fun m!782669 () Bool)

(assert (=> b!838980 m!782669))

(check-sat (not mapNonEmpty!24776) (not b!838988) (not b!838992) b_and!22645 (not b!838985) (not b_next!13585) (not b!838990) (not b!838982) tp_is_empty!15451 (not b!838980) (not start!72382) (not bm!36959) (not bm!36960))
(check-sat b_and!22645 (not b_next!13585))
