; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73020 () Bool)

(assert start!73020)

(declare-fun b_free!13935 () Bool)

(declare-fun b_next!13935 () Bool)

(assert (=> start!73020 (= b_free!13935 (not b_next!13935))))

(declare-fun tp!49309 () Bool)

(declare-fun b_and!23029 () Bool)

(assert (=> start!73020 (= tp!49309 b_and!23029)))

(declare-fun b!848627 () Bool)

(declare-fun e!473487 () Bool)

(declare-datatypes ((V!26475 0))(
  ( (V!26476 (val!8083 Int)) )
))
(declare-datatypes ((tuple2!10572 0))(
  ( (tuple2!10573 (_1!5297 (_ BitVec 64)) (_2!5297 V!26475)) )
))
(declare-datatypes ((List!16427 0))(
  ( (Nil!16424) (Cons!16423 (h!17554 tuple2!10572) (t!22808 List!16427)) )
))
(declare-datatypes ((ListLongMap!9341 0))(
  ( (ListLongMap!9342 (toList!4686 List!16427)) )
))
(declare-fun call!37660 () ListLongMap!9341)

(declare-fun call!37661 () ListLongMap!9341)

(assert (=> b!848627 (= e!473487 (= call!37660 call!37661))))

(declare-fun b!848628 () Bool)

(declare-fun res!576553 () Bool)

(declare-fun e!473486 () Bool)

(assert (=> b!848628 (=> (not res!576553) (not e!473486))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848628 (= res!576553 (validKeyInArray!0 k0!854))))

(declare-fun b!848629 () Bool)

(declare-fun e!473482 () Bool)

(declare-fun e!473484 () Bool)

(assert (=> b!848629 (= e!473482 (not e!473484))))

(declare-fun res!576552 () Bool)

(assert (=> b!848629 (=> res!576552 e!473484)))

(declare-datatypes ((array!48348 0))(
  ( (array!48349 (arr!23205 (Array (_ BitVec 32) (_ BitVec 64))) (size!23645 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48348)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!848629 (= res!576552 (not (validKeyInArray!0 (select (arr!23205 _keys!868) from!1053))))))

(assert (=> b!848629 e!473487))

(declare-fun c!91573 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!848629 (= c!91573 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26475)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28983 0))(
  ( (Unit!28984) )
))
(declare-fun lt!382069 () Unit!28983)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7596 0))(
  ( (ValueCellFull!7596 (v!10508 V!26475)) (EmptyCell!7596) )
))
(declare-datatypes ((array!48350 0))(
  ( (array!48351 (arr!23206 (Array (_ BitVec 32) ValueCell!7596)) (size!23646 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48350)

(declare-fun minValue!654 () V!26475)

(declare-fun zeroValue!654 () V!26475)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!337 (array!48348 array!48350 (_ BitVec 32) (_ BitVec 32) V!26475 V!26475 (_ BitVec 32) (_ BitVec 64) V!26475 (_ BitVec 32) Int) Unit!28983)

(assert (=> b!848629 (= lt!382069 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!337 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37657 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2668 (array!48348 array!48350 (_ BitVec 32) (_ BitVec 32) V!26475 V!26475 (_ BitVec 32) Int) ListLongMap!9341)

(assert (=> bm!37657 (= call!37661 (getCurrentListMapNoExtraKeys!2668 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!25706 () Bool)

(declare-fun mapRes!25706 () Bool)

(assert (=> mapIsEmpty!25706 mapRes!25706))

(declare-fun b!848630 () Bool)

(declare-fun +!2095 (ListLongMap!9341 tuple2!10572) ListLongMap!9341)

(assert (=> b!848630 (= e!473487 (= call!37660 (+!2095 call!37661 (tuple2!10573 k0!854 v!557))))))

(declare-fun b!848631 () Bool)

(declare-fun e!473481 () Bool)

(declare-fun e!473485 () Bool)

(assert (=> b!848631 (= e!473481 (and e!473485 mapRes!25706))))

(declare-fun condMapEmpty!25706 () Bool)

(declare-fun mapDefault!25706 () ValueCell!7596)

(assert (=> b!848631 (= condMapEmpty!25706 (= (arr!23206 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7596)) mapDefault!25706)))))

(declare-fun b!848632 () Bool)

(declare-fun e!473483 () Bool)

(declare-fun tp_is_empty!16071 () Bool)

(assert (=> b!848632 (= e!473483 tp_is_empty!16071)))

(declare-fun b!848633 () Bool)

(assert (=> b!848633 (= e!473484 true)))

(declare-fun lt!382066 () ListLongMap!9341)

(declare-fun lt!382068 () array!48350)

(declare-fun get!12208 (ValueCell!7596 V!26475) V!26475)

(declare-fun dynLambda!986 (Int (_ BitVec 64)) V!26475)

(assert (=> b!848633 (= lt!382066 (+!2095 (getCurrentListMapNoExtraKeys!2668 _keys!868 lt!382068 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10573 (select (arr!23205 _keys!868) from!1053) (get!12208 (select (arr!23206 lt!382068) from!1053) (dynLambda!986 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!37658 () Bool)

(assert (=> bm!37658 (= call!37660 (getCurrentListMapNoExtraKeys!2668 _keys!868 lt!382068 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!25706 () Bool)

(declare-fun tp!49308 () Bool)

(assert (=> mapNonEmpty!25706 (= mapRes!25706 (and tp!49308 e!473483))))

(declare-fun mapKey!25706 () (_ BitVec 32))

(declare-fun mapValue!25706 () ValueCell!7596)

(declare-fun mapRest!25706 () (Array (_ BitVec 32) ValueCell!7596))

(assert (=> mapNonEmpty!25706 (= (arr!23206 _values!688) (store mapRest!25706 mapKey!25706 mapValue!25706))))

(declare-fun b!848635 () Bool)

(assert (=> b!848635 (= e!473485 tp_is_empty!16071)))

(declare-fun b!848636 () Bool)

(declare-fun res!576557 () Bool)

(assert (=> b!848636 (=> (not res!576557) (not e!473486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48348 (_ BitVec 32)) Bool)

(assert (=> b!848636 (= res!576557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848637 () Bool)

(declare-fun res!576550 () Bool)

(assert (=> b!848637 (=> (not res!576550) (not e!473486))))

(assert (=> b!848637 (= res!576550 (and (= (select (arr!23205 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848638 () Bool)

(declare-fun res!576555 () Bool)

(assert (=> b!848638 (=> (not res!576555) (not e!473486))))

(assert (=> b!848638 (= res!576555 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23645 _keys!868))))))

(declare-fun b!848639 () Bool)

(declare-fun res!576554 () Bool)

(assert (=> b!848639 (=> (not res!576554) (not e!473486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848639 (= res!576554 (validMask!0 mask!1196))))

(declare-fun b!848640 () Bool)

(declare-fun res!576548 () Bool)

(assert (=> b!848640 (=> (not res!576548) (not e!473486))))

(assert (=> b!848640 (= res!576548 (and (= (size!23646 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23645 _keys!868) (size!23646 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!848641 () Bool)

(assert (=> b!848641 (= e!473486 e!473482)))

(declare-fun res!576556 () Bool)

(assert (=> b!848641 (=> (not res!576556) (not e!473482))))

(assert (=> b!848641 (= res!576556 (= from!1053 i!612))))

(assert (=> b!848641 (= lt!382066 (getCurrentListMapNoExtraKeys!2668 _keys!868 lt!382068 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848641 (= lt!382068 (array!48351 (store (arr!23206 _values!688) i!612 (ValueCellFull!7596 v!557)) (size!23646 _values!688)))))

(declare-fun lt!382067 () ListLongMap!9341)

(assert (=> b!848641 (= lt!382067 (getCurrentListMapNoExtraKeys!2668 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848634 () Bool)

(declare-fun res!576549 () Bool)

(assert (=> b!848634 (=> (not res!576549) (not e!473486))))

(declare-datatypes ((List!16428 0))(
  ( (Nil!16425) (Cons!16424 (h!17555 (_ BitVec 64)) (t!22809 List!16428)) )
))
(declare-fun arrayNoDuplicates!0 (array!48348 (_ BitVec 32) List!16428) Bool)

(assert (=> b!848634 (= res!576549 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16425))))

(declare-fun res!576551 () Bool)

(assert (=> start!73020 (=> (not res!576551) (not e!473486))))

(assert (=> start!73020 (= res!576551 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23645 _keys!868))))))

(assert (=> start!73020 e!473486))

(assert (=> start!73020 tp_is_empty!16071))

(assert (=> start!73020 true))

(assert (=> start!73020 tp!49309))

(declare-fun array_inv!18420 (array!48348) Bool)

(assert (=> start!73020 (array_inv!18420 _keys!868)))

(declare-fun array_inv!18421 (array!48350) Bool)

(assert (=> start!73020 (and (array_inv!18421 _values!688) e!473481)))

(assert (= (and start!73020 res!576551) b!848639))

(assert (= (and b!848639 res!576554) b!848640))

(assert (= (and b!848640 res!576548) b!848636))

(assert (= (and b!848636 res!576557) b!848634))

(assert (= (and b!848634 res!576549) b!848638))

(assert (= (and b!848638 res!576555) b!848628))

(assert (= (and b!848628 res!576553) b!848637))

(assert (= (and b!848637 res!576550) b!848641))

(assert (= (and b!848641 res!576556) b!848629))

(assert (= (and b!848629 c!91573) b!848630))

(assert (= (and b!848629 (not c!91573)) b!848627))

(assert (= (or b!848630 b!848627) bm!37658))

(assert (= (or b!848630 b!848627) bm!37657))

(assert (= (and b!848629 (not res!576552)) b!848633))

(assert (= (and b!848631 condMapEmpty!25706) mapIsEmpty!25706))

(assert (= (and b!848631 (not condMapEmpty!25706)) mapNonEmpty!25706))

(get-info :version)

(assert (= (and mapNonEmpty!25706 ((_ is ValueCellFull!7596) mapValue!25706)) b!848632))

(assert (= (and b!848631 ((_ is ValueCellFull!7596) mapDefault!25706)) b!848635))

(assert (= start!73020 b!848631))

(declare-fun b_lambda!11467 () Bool)

(assert (=> (not b_lambda!11467) (not b!848633)))

(declare-fun t!22807 () Bool)

(declare-fun tb!4237 () Bool)

(assert (=> (and start!73020 (= defaultEntry!696 defaultEntry!696) t!22807) tb!4237))

(declare-fun result!8085 () Bool)

(assert (=> tb!4237 (= result!8085 tp_is_empty!16071)))

(assert (=> b!848633 t!22807))

(declare-fun b_and!23031 () Bool)

(assert (= b_and!23029 (and (=> t!22807 result!8085) b_and!23031)))

(declare-fun m!789393 () Bool)

(assert (=> b!848628 m!789393))

(declare-fun m!789395 () Bool)

(assert (=> bm!37658 m!789395))

(declare-fun m!789397 () Bool)

(assert (=> mapNonEmpty!25706 m!789397))

(declare-fun m!789399 () Bool)

(assert (=> b!848636 m!789399))

(declare-fun m!789401 () Bool)

(assert (=> b!848633 m!789401))

(declare-fun m!789403 () Bool)

(assert (=> b!848633 m!789403))

(declare-fun m!789405 () Bool)

(assert (=> b!848633 m!789405))

(assert (=> b!848633 m!789395))

(declare-fun m!789407 () Bool)

(assert (=> b!848633 m!789407))

(assert (=> b!848633 m!789395))

(assert (=> b!848633 m!789401))

(declare-fun m!789409 () Bool)

(assert (=> b!848633 m!789409))

(assert (=> b!848633 m!789403))

(declare-fun m!789411 () Bool)

(assert (=> b!848637 m!789411))

(declare-fun m!789413 () Bool)

(assert (=> b!848641 m!789413))

(declare-fun m!789415 () Bool)

(assert (=> b!848641 m!789415))

(declare-fun m!789417 () Bool)

(assert (=> b!848641 m!789417))

(declare-fun m!789419 () Bool)

(assert (=> b!848639 m!789419))

(declare-fun m!789421 () Bool)

(assert (=> b!848634 m!789421))

(declare-fun m!789423 () Bool)

(assert (=> b!848630 m!789423))

(declare-fun m!789425 () Bool)

(assert (=> bm!37657 m!789425))

(declare-fun m!789427 () Bool)

(assert (=> start!73020 m!789427))

(declare-fun m!789429 () Bool)

(assert (=> start!73020 m!789429))

(assert (=> b!848629 m!789409))

(assert (=> b!848629 m!789409))

(declare-fun m!789431 () Bool)

(assert (=> b!848629 m!789431))

(declare-fun m!789433 () Bool)

(assert (=> b!848629 m!789433))

(check-sat (not mapNonEmpty!25706) (not b!848639) (not b!848628) b_and!23031 (not bm!37658) (not bm!37657) (not start!73020) (not b_next!13935) (not b!848636) (not b!848633) (not b!848630) (not b_lambda!11467) (not b!848641) (not b!848629) (not b!848634) tp_is_empty!16071)
(check-sat b_and!23031 (not b_next!13935))
