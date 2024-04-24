; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74538 () Bool)

(assert start!74538)

(declare-fun b_free!15133 () Bool)

(declare-fun b_next!15133 () Bool)

(assert (=> start!74538 (= b_free!15133 (not b_next!15133))))

(declare-fun tp!53075 () Bool)

(declare-fun b_and!24919 () Bool)

(assert (=> start!74538 (= tp!53075 b_and!24919)))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!28217 0))(
  ( (V!28218 (val!8736 Int)) )
))
(declare-datatypes ((tuple2!11478 0))(
  ( (tuple2!11479 (_1!5750 (_ BitVec 64)) (_2!5750 V!28217)) )
))
(declare-datatypes ((List!17320 0))(
  ( (Nil!17317) (Cons!17316 (h!18453 tuple2!11478) (t!24353 List!17320)) )
))
(declare-datatypes ((ListLongMap!10249 0))(
  ( (ListLongMap!10250 (toList!5140 List!17320)) )
))
(declare-fun call!38670 () ListLongMap!10249)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38666 () Bool)

(declare-datatypes ((array!50929 0))(
  ( (array!50930 (arr!24488 (Array (_ BitVec 32) (_ BitVec 64))) (size!24929 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50929)

(declare-datatypes ((ValueCell!8249 0))(
  ( (ValueCellFull!8249 (v!11165 V!28217)) (EmptyCell!8249) )
))
(declare-datatypes ((array!50931 0))(
  ( (array!50932 (arr!24489 (Array (_ BitVec 32) ValueCell!8249)) (size!24930 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50931)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28217)

(declare-fun zeroValue!654 () V!28217)

(declare-fun getCurrentListMapNoExtraKeys!3182 (array!50929 array!50931 (_ BitVec 32) (_ BitVec 32) V!28217 V!28217 (_ BitVec 32) Int) ListLongMap!10249)

(assert (=> bm!38666 (= call!38670 (getCurrentListMapNoExtraKeys!3182 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876415 () Bool)

(declare-fun res!595343 () Bool)

(declare-fun e!487980 () Bool)

(assert (=> b!876415 (=> (not res!595343) (not e!487980))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!876415 (= res!595343 (validKeyInArray!0 k0!854))))

(declare-fun b!876416 () Bool)

(declare-fun e!487984 () Bool)

(declare-fun e!487978 () Bool)

(declare-fun mapRes!27674 () Bool)

(assert (=> b!876416 (= e!487984 (and e!487978 mapRes!27674))))

(declare-fun condMapEmpty!27674 () Bool)

(declare-fun mapDefault!27674 () ValueCell!8249)

(assert (=> b!876416 (= condMapEmpty!27674 (= (arr!24489 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8249)) mapDefault!27674)))))

(declare-fun bm!38667 () Bool)

(declare-fun lt!396560 () array!50931)

(declare-fun call!38669 () ListLongMap!10249)

(assert (=> bm!38667 (= call!38669 (getCurrentListMapNoExtraKeys!3182 _keys!868 lt!396560 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27674 () Bool)

(declare-fun tp!53074 () Bool)

(declare-fun e!487985 () Bool)

(assert (=> mapNonEmpty!27674 (= mapRes!27674 (and tp!53074 e!487985))))

(declare-fun mapValue!27674 () ValueCell!8249)

(declare-fun mapKey!27674 () (_ BitVec 32))

(declare-fun mapRest!27674 () (Array (_ BitVec 32) ValueCell!8249))

(assert (=> mapNonEmpty!27674 (= (arr!24489 _values!688) (store mapRest!27674 mapKey!27674 mapValue!27674))))

(declare-fun b!876417 () Bool)

(declare-fun e!487979 () Bool)

(assert (=> b!876417 (= e!487979 (= call!38669 call!38670))))

(declare-fun b!876419 () Bool)

(declare-fun res!595334 () Bool)

(assert (=> b!876419 (=> (not res!595334) (not e!487980))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!876419 (= res!595334 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24929 _keys!868))))))

(declare-fun mapIsEmpty!27674 () Bool)

(assert (=> mapIsEmpty!27674 mapRes!27674))

(declare-fun b!876420 () Bool)

(declare-fun tp_is_empty!17377 () Bool)

(assert (=> b!876420 (= e!487985 tp_is_empty!17377)))

(declare-fun b!876421 () Bool)

(declare-fun res!595340 () Bool)

(assert (=> b!876421 (=> (not res!595340) (not e!487980))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50929 (_ BitVec 32)) Bool)

(assert (=> b!876421 (= res!595340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!876422 () Bool)

(declare-fun e!487982 () Bool)

(assert (=> b!876422 (= e!487980 e!487982)))

(declare-fun res!595341 () Bool)

(assert (=> b!876422 (=> (not res!595341) (not e!487982))))

(assert (=> b!876422 (= res!595341 (= from!1053 i!612))))

(declare-fun lt!396564 () ListLongMap!10249)

(assert (=> b!876422 (= lt!396564 (getCurrentListMapNoExtraKeys!3182 _keys!868 lt!396560 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28217)

(assert (=> b!876422 (= lt!396560 (array!50932 (store (arr!24489 _values!688) i!612 (ValueCellFull!8249 v!557)) (size!24930 _values!688)))))

(declare-fun lt!396562 () ListLongMap!10249)

(assert (=> b!876422 (= lt!396562 (getCurrentListMapNoExtraKeys!3182 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!876423 () Bool)

(declare-fun e!487983 () Bool)

(assert (=> b!876423 (= e!487982 (not e!487983))))

(declare-fun res!595338 () Bool)

(assert (=> b!876423 (=> res!595338 e!487983)))

(assert (=> b!876423 (= res!595338 (not (validKeyInArray!0 (select (arr!24488 _keys!868) from!1053))))))

(assert (=> b!876423 e!487979))

(declare-fun c!92795 () Bool)

(assert (=> b!876423 (= c!92795 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29926 0))(
  ( (Unit!29927) )
))
(declare-fun lt!396561 () Unit!29926)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!657 (array!50929 array!50931 (_ BitVec 32) (_ BitVec 32) V!28217 V!28217 (_ BitVec 32) (_ BitVec 64) V!28217 (_ BitVec 32) Int) Unit!29926)

(assert (=> b!876423 (= lt!396561 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!657 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876424 () Bool)

(assert (=> b!876424 (= e!487978 tp_is_empty!17377)))

(declare-fun b!876425 () Bool)

(declare-fun res!595339 () Bool)

(assert (=> b!876425 (=> (not res!595339) (not e!487980))))

(assert (=> b!876425 (= res!595339 (and (= (select (arr!24488 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!876426 () Bool)

(declare-fun +!2487 (ListLongMap!10249 tuple2!11478) ListLongMap!10249)

(assert (=> b!876426 (= e!487979 (= call!38669 (+!2487 call!38670 (tuple2!11479 k0!854 v!557))))))

(declare-fun b!876427 () Bool)

(declare-fun res!595342 () Bool)

(assert (=> b!876427 (=> (not res!595342) (not e!487980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!876427 (= res!595342 (validMask!0 mask!1196))))

(declare-fun b!876428 () Bool)

(declare-fun res!595337 () Bool)

(assert (=> b!876428 (=> (not res!595337) (not e!487980))))

(assert (=> b!876428 (= res!595337 (and (= (size!24930 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24929 _keys!868) (size!24930 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!876429 () Bool)

(assert (=> b!876429 (= e!487983 (bvslt from!1053 (size!24930 _values!688)))))

(declare-fun lt!396563 () ListLongMap!10249)

(assert (=> b!876429 (= lt!396563 (getCurrentListMapNoExtraKeys!3182 _keys!868 lt!396560 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!876418 () Bool)

(declare-fun res!595335 () Bool)

(assert (=> b!876418 (=> (not res!595335) (not e!487980))))

(declare-datatypes ((List!17321 0))(
  ( (Nil!17318) (Cons!17317 (h!18454 (_ BitVec 64)) (t!24354 List!17321)) )
))
(declare-fun arrayNoDuplicates!0 (array!50929 (_ BitVec 32) List!17321) Bool)

(assert (=> b!876418 (= res!595335 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17318))))

(declare-fun res!595336 () Bool)

(assert (=> start!74538 (=> (not res!595336) (not e!487980))))

(assert (=> start!74538 (= res!595336 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24929 _keys!868))))))

(assert (=> start!74538 e!487980))

(assert (=> start!74538 tp_is_empty!17377))

(assert (=> start!74538 true))

(assert (=> start!74538 tp!53075))

(declare-fun array_inv!19362 (array!50929) Bool)

(assert (=> start!74538 (array_inv!19362 _keys!868)))

(declare-fun array_inv!19363 (array!50931) Bool)

(assert (=> start!74538 (and (array_inv!19363 _values!688) e!487984)))

(assert (= (and start!74538 res!595336) b!876427))

(assert (= (and b!876427 res!595342) b!876428))

(assert (= (and b!876428 res!595337) b!876421))

(assert (= (and b!876421 res!595340) b!876418))

(assert (= (and b!876418 res!595335) b!876419))

(assert (= (and b!876419 res!595334) b!876415))

(assert (= (and b!876415 res!595343) b!876425))

(assert (= (and b!876425 res!595339) b!876422))

(assert (= (and b!876422 res!595341) b!876423))

(assert (= (and b!876423 c!92795) b!876426))

(assert (= (and b!876423 (not c!92795)) b!876417))

(assert (= (or b!876426 b!876417) bm!38667))

(assert (= (or b!876426 b!876417) bm!38666))

(assert (= (and b!876423 (not res!595338)) b!876429))

(assert (= (and b!876416 condMapEmpty!27674) mapIsEmpty!27674))

(assert (= (and b!876416 (not condMapEmpty!27674)) mapNonEmpty!27674))

(get-info :version)

(assert (= (and mapNonEmpty!27674 ((_ is ValueCellFull!8249) mapValue!27674)) b!876420))

(assert (= (and b!876416 ((_ is ValueCellFull!8249) mapDefault!27674)) b!876424))

(assert (= start!74538 b!876416))

(declare-fun m!816649 () Bool)

(assert (=> b!876427 m!816649))

(declare-fun m!816651 () Bool)

(assert (=> start!74538 m!816651))

(declare-fun m!816653 () Bool)

(assert (=> start!74538 m!816653))

(declare-fun m!816655 () Bool)

(assert (=> b!876421 m!816655))

(declare-fun m!816657 () Bool)

(assert (=> b!876423 m!816657))

(assert (=> b!876423 m!816657))

(declare-fun m!816659 () Bool)

(assert (=> b!876423 m!816659))

(declare-fun m!816661 () Bool)

(assert (=> b!876423 m!816661))

(declare-fun m!816663 () Bool)

(assert (=> bm!38667 m!816663))

(declare-fun m!816665 () Bool)

(assert (=> b!876426 m!816665))

(declare-fun m!816667 () Bool)

(assert (=> b!876415 m!816667))

(declare-fun m!816669 () Bool)

(assert (=> b!876422 m!816669))

(declare-fun m!816671 () Bool)

(assert (=> b!876422 m!816671))

(declare-fun m!816673 () Bool)

(assert (=> b!876422 m!816673))

(declare-fun m!816675 () Bool)

(assert (=> b!876418 m!816675))

(assert (=> b!876429 m!816663))

(declare-fun m!816677 () Bool)

(assert (=> bm!38666 m!816677))

(declare-fun m!816679 () Bool)

(assert (=> mapNonEmpty!27674 m!816679))

(declare-fun m!816681 () Bool)

(assert (=> b!876425 m!816681))

(check-sat (not b!876429) (not b_next!15133) (not bm!38667) (not b!876423) (not b!876426) (not mapNonEmpty!27674) (not bm!38666) (not b!876422) (not b!876421) tp_is_empty!17377 (not start!74538) b_and!24919 (not b!876418) (not b!876415) (not b!876427))
(check-sat b_and!24919 (not b_next!15133))
