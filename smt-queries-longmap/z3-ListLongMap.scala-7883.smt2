; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98044 () Bool)

(assert start!98044)

(declare-fun b_free!23745 () Bool)

(declare-fun b_next!23745 () Bool)

(assert (=> start!98044 (= b_free!23745 (not b_next!23745))))

(declare-fun tp!83939 () Bool)

(declare-fun b_and!38273 () Bool)

(assert (=> start!98044 (= tp!83939 b_and!38273)))

(declare-fun mapNonEmpty!44230 () Bool)

(declare-fun mapRes!44230 () Bool)

(declare-fun tp!83938 () Bool)

(declare-fun e!640643 () Bool)

(assert (=> mapNonEmpty!44230 (= mapRes!44230 (and tp!83938 e!640643))))

(declare-datatypes ((V!42827 0))(
  ( (V!42828 (val!14194 Int)) )
))
(declare-datatypes ((ValueCell!13428 0))(
  ( (ValueCellFull!13428 (v!16827 V!42827)) (EmptyCell!13428) )
))
(declare-fun mapRest!44230 () (Array (_ BitVec 32) ValueCell!13428))

(declare-fun mapKey!44230 () (_ BitVec 32))

(declare-datatypes ((array!73413 0))(
  ( (array!73414 (arr!35359 (Array (_ BitVec 32) ValueCell!13428)) (size!35895 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73413)

(declare-fun mapValue!44230 () ValueCell!13428)

(assert (=> mapNonEmpty!44230 (= (arr!35359 _values!996) (store mapRest!44230 mapKey!44230 mapValue!44230))))

(declare-fun b!1125442 () Bool)

(declare-fun e!640644 () Bool)

(declare-datatypes ((tuple2!17836 0))(
  ( (tuple2!17837 (_1!8929 (_ BitVec 64)) (_2!8929 V!42827)) )
))
(declare-datatypes ((List!24615 0))(
  ( (Nil!24612) (Cons!24611 (h!25820 tuple2!17836) (t!35352 List!24615)) )
))
(declare-datatypes ((ListLongMap!15805 0))(
  ( (ListLongMap!15806 (toList!7918 List!24615)) )
))
(declare-fun call!47518 () ListLongMap!15805)

(declare-fun call!47517 () ListLongMap!15805)

(assert (=> b!1125442 (= e!640644 (= call!47518 call!47517))))

(declare-fun b!1125443 () Bool)

(declare-fun res!752031 () Bool)

(declare-fun e!640638 () Bool)

(assert (=> b!1125443 (=> (not res!752031) (not e!640638))))

(declare-datatypes ((array!73415 0))(
  ( (array!73416 (arr!35360 (Array (_ BitVec 32) (_ BitVec 64))) (size!35896 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73415)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73415 (_ BitVec 32)) Bool)

(assert (=> b!1125443 (= res!752031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1125444 () Bool)

(declare-fun e!640636 () Bool)

(declare-fun e!640640 () Bool)

(assert (=> b!1125444 (= e!640636 e!640640)))

(declare-fun res!752025 () Bool)

(assert (=> b!1125444 (=> res!752025 e!640640)))

(declare-fun lt!499849 () ListLongMap!15805)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun contains!6455 (ListLongMap!15805 (_ BitVec 64)) Bool)

(assert (=> b!1125444 (= res!752025 (not (contains!6455 lt!499849 k0!934)))))

(declare-fun zeroValue!944 () V!42827)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42827)

(declare-fun getCurrentListMapNoExtraKeys!4406 (array!73415 array!73413 (_ BitVec 32) (_ BitVec 32) V!42827 V!42827 (_ BitVec 32) Int) ListLongMap!15805)

(assert (=> b!1125444 (= lt!499849 (getCurrentListMapNoExtraKeys!4406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125445 () Bool)

(declare-fun res!752030 () Bool)

(declare-fun e!640637 () Bool)

(assert (=> b!1125445 (=> (not res!752030) (not e!640637))))

(declare-fun lt!499852 () array!73415)

(declare-datatypes ((List!24616 0))(
  ( (Nil!24613) (Cons!24612 (h!25821 (_ BitVec 64)) (t!35353 List!24616)) )
))
(declare-fun arrayNoDuplicates!0 (array!73415 (_ BitVec 32) List!24616) Bool)

(assert (=> b!1125445 (= res!752030 (arrayNoDuplicates!0 lt!499852 #b00000000000000000000000000000000 Nil!24613))))

(declare-fun b!1125446 () Bool)

(assert (=> b!1125446 (= e!640638 e!640637)))

(declare-fun res!752023 () Bool)

(assert (=> b!1125446 (=> (not res!752023) (not e!640637))))

(assert (=> b!1125446 (= res!752023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!499852 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1125446 (= lt!499852 (array!73416 (store (arr!35360 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35896 _keys!1208)))))

(declare-fun b!1125447 () Bool)

(declare-fun res!752034 () Bool)

(assert (=> b!1125447 (=> (not res!752034) (not e!640638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1125447 (= res!752034 (validKeyInArray!0 k0!934))))

(declare-fun b!1125448 () Bool)

(declare-fun res!752035 () Bool)

(assert (=> b!1125448 (=> (not res!752035) (not e!640638))))

(assert (=> b!1125448 (= res!752035 (= (select (arr!35360 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!44230 () Bool)

(assert (=> mapIsEmpty!44230 mapRes!44230))

(declare-fun b!1125449 () Bool)

(declare-fun e!640641 () Bool)

(declare-fun e!640639 () Bool)

(assert (=> b!1125449 (= e!640641 e!640639)))

(declare-fun res!752032 () Bool)

(assert (=> b!1125449 (=> res!752032 e!640639)))

(assert (=> b!1125449 (= res!752032 (not (= from!1455 i!673)))))

(declare-fun lt!499855 () ListLongMap!15805)

(declare-fun lt!499854 () array!73413)

(assert (=> b!1125449 (= lt!499855 (getCurrentListMapNoExtraKeys!4406 lt!499852 lt!499854 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2497 (Int (_ BitVec 64)) V!42827)

(assert (=> b!1125449 (= lt!499854 (array!73414 (store (arr!35359 _values!996) i!673 (ValueCellFull!13428 (dynLambda!2497 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35895 _values!996)))))

(declare-fun lt!499853 () ListLongMap!15805)

(assert (=> b!1125449 (= lt!499853 (getCurrentListMapNoExtraKeys!4406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1125450 () Bool)

(declare-fun tp_is_empty!28275 () Bool)

(assert (=> b!1125450 (= e!640643 tp_is_empty!28275)))

(declare-fun bm!47514 () Bool)

(assert (=> bm!47514 (= call!47518 (getCurrentListMapNoExtraKeys!4406 lt!499852 lt!499854 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125451 () Bool)

(assert (=> b!1125451 (= e!640639 e!640636)))

(declare-fun res!752026 () Bool)

(assert (=> b!1125451 (=> res!752026 e!640636)))

(assert (=> b!1125451 (= res!752026 (not (= (select (arr!35360 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1125451 e!640644))

(declare-fun c!109608 () Bool)

(assert (=> b!1125451 (= c!109608 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36886 0))(
  ( (Unit!36887) )
))
(declare-fun lt!499851 () Unit!36886)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!365 (array!73415 array!73413 (_ BitVec 32) (_ BitVec 32) V!42827 V!42827 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36886)

(assert (=> b!1125451 (= lt!499851 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!365 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1125452 () Bool)

(declare-fun res!752033 () Bool)

(assert (=> b!1125452 (=> (not res!752033) (not e!640638))))

(assert (=> b!1125452 (= res!752033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24613))))

(declare-fun b!1125453 () Bool)

(assert (=> b!1125453 (= e!640637 (not e!640641))))

(declare-fun res!752021 () Bool)

(assert (=> b!1125453 (=> res!752021 e!640641)))

(assert (=> b!1125453 (= res!752021 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1125453 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!499856 () Unit!36886)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73415 (_ BitVec 64) (_ BitVec 32)) Unit!36886)

(assert (=> b!1125453 (= lt!499856 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1125454 () Bool)

(declare-fun e!640642 () Bool)

(assert (=> b!1125454 (= e!640642 tp_is_empty!28275)))

(declare-fun b!1125455 () Bool)

(declare-fun res!752027 () Bool)

(assert (=> b!1125455 (=> res!752027 e!640640)))

(assert (=> b!1125455 (= res!752027 (or (= (bvand extraKeys!923 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!923 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1125456 () Bool)

(declare-fun e!640634 () Bool)

(assert (=> b!1125456 (= e!640634 (and e!640642 mapRes!44230))))

(declare-fun condMapEmpty!44230 () Bool)

(declare-fun mapDefault!44230 () ValueCell!13428)

(assert (=> b!1125456 (= condMapEmpty!44230 (= (arr!35359 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13428)) mapDefault!44230)))))

(declare-fun b!1125457 () Bool)

(declare-fun res!752022 () Bool)

(assert (=> b!1125457 (=> (not res!752022) (not e!640638))))

(assert (=> b!1125457 (= res!752022 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35896 _keys!1208))))))

(declare-fun b!1125458 () Bool)

(declare-fun res!752028 () Bool)

(assert (=> b!1125458 (=> (not res!752028) (not e!640638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1125458 (= res!752028 (validMask!0 mask!1564))))

(declare-fun b!1125459 () Bool)

(assert (=> b!1125459 (= e!640640 true)))

(declare-fun +!3425 (ListLongMap!15805 tuple2!17836) ListLongMap!15805)

(assert (=> b!1125459 (contains!6455 (+!3425 lt!499849 (tuple2!17837 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944)) k0!934)))

(declare-fun lt!499850 () Unit!36886)

(declare-fun addStillContains!687 (ListLongMap!15805 (_ BitVec 64) V!42827 (_ BitVec 64)) Unit!36886)

(assert (=> b!1125459 (= lt!499850 (addStillContains!687 lt!499849 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!944 k0!934))))

(declare-fun b!1125460 () Bool)

(declare-fun res!752024 () Bool)

(assert (=> b!1125460 (=> (not res!752024) (not e!640638))))

(assert (=> b!1125460 (= res!752024 (and (= (size!35895 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35896 _keys!1208) (size!35895 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1125461 () Bool)

(declare-fun -!1119 (ListLongMap!15805 (_ BitVec 64)) ListLongMap!15805)

(assert (=> b!1125461 (= e!640644 (= call!47518 (-!1119 call!47517 k0!934)))))

(declare-fun res!752029 () Bool)

(assert (=> start!98044 (=> (not res!752029) (not e!640638))))

(assert (=> start!98044 (= res!752029 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35896 _keys!1208))))))

(assert (=> start!98044 e!640638))

(assert (=> start!98044 tp_is_empty!28275))

(declare-fun array_inv!27144 (array!73415) Bool)

(assert (=> start!98044 (array_inv!27144 _keys!1208)))

(assert (=> start!98044 true))

(assert (=> start!98044 tp!83939))

(declare-fun array_inv!27145 (array!73413) Bool)

(assert (=> start!98044 (and (array_inv!27145 _values!996) e!640634)))

(declare-fun bm!47515 () Bool)

(assert (=> bm!47515 (= call!47517 (getCurrentListMapNoExtraKeys!4406 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98044 res!752029) b!1125458))

(assert (= (and b!1125458 res!752028) b!1125460))

(assert (= (and b!1125460 res!752024) b!1125443))

(assert (= (and b!1125443 res!752031) b!1125452))

(assert (= (and b!1125452 res!752033) b!1125457))

(assert (= (and b!1125457 res!752022) b!1125447))

(assert (= (and b!1125447 res!752034) b!1125448))

(assert (= (and b!1125448 res!752035) b!1125446))

(assert (= (and b!1125446 res!752023) b!1125445))

(assert (= (and b!1125445 res!752030) b!1125453))

(assert (= (and b!1125453 (not res!752021)) b!1125449))

(assert (= (and b!1125449 (not res!752032)) b!1125451))

(assert (= (and b!1125451 c!109608) b!1125461))

(assert (= (and b!1125451 (not c!109608)) b!1125442))

(assert (= (or b!1125461 b!1125442) bm!47514))

(assert (= (or b!1125461 b!1125442) bm!47515))

(assert (= (and b!1125451 (not res!752026)) b!1125444))

(assert (= (and b!1125444 (not res!752025)) b!1125455))

(assert (= (and b!1125455 (not res!752027)) b!1125459))

(assert (= (and b!1125456 condMapEmpty!44230) mapIsEmpty!44230))

(assert (= (and b!1125456 (not condMapEmpty!44230)) mapNonEmpty!44230))

(get-info :version)

(assert (= (and mapNonEmpty!44230 ((_ is ValueCellFull!13428) mapValue!44230)) b!1125450))

(assert (= (and b!1125456 ((_ is ValueCellFull!13428) mapDefault!44230)) b!1125454))

(assert (= start!98044 b!1125456))

(declare-fun b_lambda!18715 () Bool)

(assert (=> (not b_lambda!18715) (not b!1125449)))

(declare-fun t!35351 () Bool)

(declare-fun tb!8557 () Bool)

(assert (=> (and start!98044 (= defaultEntry!1004 defaultEntry!1004) t!35351) tb!8557))

(declare-fun result!17675 () Bool)

(assert (=> tb!8557 (= result!17675 tp_is_empty!28275)))

(assert (=> b!1125449 t!35351))

(declare-fun b_and!38275 () Bool)

(assert (= b_and!38273 (and (=> t!35351 result!17675) b_and!38275)))

(declare-fun m!1039579 () Bool)

(assert (=> b!1125452 m!1039579))

(declare-fun m!1039581 () Bool)

(assert (=> b!1125451 m!1039581))

(declare-fun m!1039583 () Bool)

(assert (=> b!1125451 m!1039583))

(declare-fun m!1039585 () Bool)

(assert (=> b!1125447 m!1039585))

(declare-fun m!1039587 () Bool)

(assert (=> b!1125444 m!1039587))

(declare-fun m!1039589 () Bool)

(assert (=> b!1125444 m!1039589))

(declare-fun m!1039591 () Bool)

(assert (=> mapNonEmpty!44230 m!1039591))

(assert (=> bm!47515 m!1039589))

(declare-fun m!1039593 () Bool)

(assert (=> start!98044 m!1039593))

(declare-fun m!1039595 () Bool)

(assert (=> start!98044 m!1039595))

(declare-fun m!1039597 () Bool)

(assert (=> b!1125449 m!1039597))

(declare-fun m!1039599 () Bool)

(assert (=> b!1125449 m!1039599))

(declare-fun m!1039601 () Bool)

(assert (=> b!1125449 m!1039601))

(declare-fun m!1039603 () Bool)

(assert (=> b!1125449 m!1039603))

(declare-fun m!1039605 () Bool)

(assert (=> b!1125458 m!1039605))

(declare-fun m!1039607 () Bool)

(assert (=> b!1125443 m!1039607))

(declare-fun m!1039609 () Bool)

(assert (=> b!1125453 m!1039609))

(declare-fun m!1039611 () Bool)

(assert (=> b!1125453 m!1039611))

(declare-fun m!1039613 () Bool)

(assert (=> b!1125459 m!1039613))

(assert (=> b!1125459 m!1039613))

(declare-fun m!1039615 () Bool)

(assert (=> b!1125459 m!1039615))

(declare-fun m!1039617 () Bool)

(assert (=> b!1125459 m!1039617))

(declare-fun m!1039619 () Bool)

(assert (=> b!1125445 m!1039619))

(declare-fun m!1039621 () Bool)

(assert (=> bm!47514 m!1039621))

(declare-fun m!1039623 () Bool)

(assert (=> b!1125461 m!1039623))

(declare-fun m!1039625 () Bool)

(assert (=> b!1125446 m!1039625))

(declare-fun m!1039627 () Bool)

(assert (=> b!1125446 m!1039627))

(declare-fun m!1039629 () Bool)

(assert (=> b!1125448 m!1039629))

(check-sat (not b!1125444) tp_is_empty!28275 (not b_lambda!18715) (not b!1125452) (not b!1125447) (not b!1125443) (not bm!47514) (not start!98044) b_and!38275 (not b!1125453) (not b!1125445) (not b!1125461) (not b_next!23745) (not b!1125446) (not mapNonEmpty!44230) (not b!1125449) (not b!1125458) (not b!1125451) (not b!1125459) (not bm!47515))
(check-sat b_and!38275 (not b_next!23745))
