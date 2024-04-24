; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98128 () Bool)

(assert start!98128)

(declare-fun b_free!23593 () Bool)

(declare-fun b_next!23593 () Bool)

(assert (=> start!98128 (= b_free!23593 (not b_next!23593))))

(declare-fun tp!83483 () Bool)

(declare-fun b_and!37979 () Bool)

(assert (=> start!98128 (= tp!83483 b_and!37979)))

(declare-fun b!1122384 () Bool)

(declare-fun e!639179 () Bool)

(assert (=> b!1122384 (= e!639179 true)))

(declare-fun e!639177 () Bool)

(assert (=> b!1122384 e!639177))

(declare-fun c!109790 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1122384 (= c!109790 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42625 0))(
  ( (V!42626 (val!14118 Int)) )
))
(declare-fun zeroValue!944 () V!42625)

(declare-datatypes ((array!73173 0))(
  ( (array!73174 (arr!35233 (Array (_ BitVec 32) (_ BitVec 64))) (size!35770 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73173)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-datatypes ((ValueCell!13352 0))(
  ( (ValueCellFull!13352 (v!16747 V!42625)) (EmptyCell!13352) )
))
(declare-datatypes ((array!73175 0))(
  ( (array!73176 (arr!35234 (Array (_ BitVec 32) ValueCell!13352)) (size!35771 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73175)

(declare-fun minValue!944 () V!42625)

(declare-datatypes ((Unit!36767 0))(
  ( (Unit!36768) )
))
(declare-fun lt!498745 () Unit!36767)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!332 (array!73173 array!73175 (_ BitVec 32) (_ BitVec 32) V!42625 V!42625 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36767)

(assert (=> b!1122384 (= lt!498745 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!332 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122385 () Bool)

(declare-fun res!749458 () Bool)

(declare-fun e!639175 () Bool)

(assert (=> b!1122385 (=> (not res!749458) (not e!639175))))

(declare-datatypes ((List!24524 0))(
  ( (Nil!24521) (Cons!24520 (h!25738 (_ BitVec 64)) (t!35101 List!24524)) )
))
(declare-fun arrayNoDuplicates!0 (array!73173 (_ BitVec 32) List!24524) Bool)

(assert (=> b!1122385 (= res!749458 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24521))))

(declare-fun b!1122386 () Bool)

(declare-fun res!749453 () Bool)

(assert (=> b!1122386 (=> (not res!749453) (not e!639175))))

(assert (=> b!1122386 (= res!749453 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35770 _keys!1208))))))

(declare-fun b!1122387 () Bool)

(declare-fun e!639180 () Bool)

(declare-fun tp_is_empty!28123 () Bool)

(assert (=> b!1122387 (= e!639180 tp_is_empty!28123)))

(declare-fun mapNonEmpty!44002 () Bool)

(declare-fun mapRes!44002 () Bool)

(declare-fun tp!83482 () Bool)

(assert (=> mapNonEmpty!44002 (= mapRes!44002 (and tp!83482 e!639180))))

(declare-fun mapKey!44002 () (_ BitVec 32))

(declare-fun mapValue!44002 () ValueCell!13352)

(declare-fun mapRest!44002 () (Array (_ BitVec 32) ValueCell!13352))

(assert (=> mapNonEmpty!44002 (= (arr!35234 _values!996) (store mapRest!44002 mapKey!44002 mapValue!44002))))

(declare-fun b!1122388 () Bool)

(declare-fun e!639178 () Bool)

(declare-fun e!639176 () Bool)

(assert (=> b!1122388 (= e!639178 (not e!639176))))

(declare-fun res!749457 () Bool)

(assert (=> b!1122388 (=> res!749457 e!639176)))

(assert (=> b!1122388 (= res!749457 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1122388 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498747 () Unit!36767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73173 (_ BitVec 64) (_ BitVec 32)) Unit!36767)

(assert (=> b!1122388 (= lt!498747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1122389 () Bool)

(declare-fun e!639182 () Bool)

(assert (=> b!1122389 (= e!639182 tp_is_empty!28123)))

(declare-datatypes ((tuple2!17728 0))(
  ( (tuple2!17729 (_1!8875 (_ BitVec 64)) (_2!8875 V!42625)) )
))
(declare-datatypes ((List!24525 0))(
  ( (Nil!24522) (Cons!24521 (h!25739 tuple2!17728) (t!35102 List!24525)) )
))
(declare-datatypes ((ListLongMap!15705 0))(
  ( (ListLongMap!15706 (toList!7868 List!24525)) )
))
(declare-fun call!47129 () ListLongMap!15705)

(declare-fun call!47128 () ListLongMap!15705)

(declare-fun b!1122390 () Bool)

(declare-fun -!1068 (ListLongMap!15705 (_ BitVec 64)) ListLongMap!15705)

(assert (=> b!1122390 (= e!639177 (= call!47128 (-!1068 call!47129 k0!934)))))

(declare-fun b!1122391 () Bool)

(assert (=> b!1122391 (= e!639175 e!639178)))

(declare-fun res!749451 () Bool)

(assert (=> b!1122391 (=> (not res!749451) (not e!639178))))

(declare-fun lt!498744 () array!73173)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73173 (_ BitVec 32)) Bool)

(assert (=> b!1122391 (= res!749451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498744 mask!1564))))

(assert (=> b!1122391 (= lt!498744 (array!73174 (store (arr!35233 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35770 _keys!1208)))))

(declare-fun b!1122392 () Bool)

(declare-fun res!749450 () Bool)

(assert (=> b!1122392 (=> (not res!749450) (not e!639175))))

(assert (=> b!1122392 (= res!749450 (= (select (arr!35233 _keys!1208) i!673) k0!934))))

(declare-fun b!1122393 () Bool)

(declare-fun res!749452 () Bool)

(assert (=> b!1122393 (=> (not res!749452) (not e!639178))))

(assert (=> b!1122393 (= res!749452 (arrayNoDuplicates!0 lt!498744 #b00000000000000000000000000000000 Nil!24521))))

(declare-fun res!749455 () Bool)

(assert (=> start!98128 (=> (not res!749455) (not e!639175))))

(assert (=> start!98128 (= res!749455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35770 _keys!1208))))))

(assert (=> start!98128 e!639175))

(assert (=> start!98128 tp_is_empty!28123))

(declare-fun array_inv!27126 (array!73173) Bool)

(assert (=> start!98128 (array_inv!27126 _keys!1208)))

(assert (=> start!98128 true))

(assert (=> start!98128 tp!83483))

(declare-fun e!639183 () Bool)

(declare-fun array_inv!27127 (array!73175) Bool)

(assert (=> start!98128 (and (array_inv!27127 _values!996) e!639183)))

(declare-fun b!1122394 () Bool)

(assert (=> b!1122394 (= e!639176 e!639179)))

(declare-fun res!749456 () Bool)

(assert (=> b!1122394 (=> res!749456 e!639179)))

(assert (=> b!1122394 (= res!749456 (not (= from!1455 i!673)))))

(declare-fun lt!498748 () ListLongMap!15705)

(declare-fun lt!498746 () array!73175)

(declare-fun getCurrentListMapNoExtraKeys!4398 (array!73173 array!73175 (_ BitVec 32) (_ BitVec 32) V!42625 V!42625 (_ BitVec 32) Int) ListLongMap!15705)

(assert (=> b!1122394 (= lt!498748 (getCurrentListMapNoExtraKeys!4398 lt!498744 lt!498746 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2485 (Int (_ BitVec 64)) V!42625)

(assert (=> b!1122394 (= lt!498746 (array!73176 (store (arr!35234 _values!996) i!673 (ValueCellFull!13352 (dynLambda!2485 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35771 _values!996)))))

(declare-fun lt!498743 () ListLongMap!15705)

(assert (=> b!1122394 (= lt!498743 (getCurrentListMapNoExtraKeys!4398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun bm!47125 () Bool)

(assert (=> bm!47125 (= call!47128 (getCurrentListMapNoExtraKeys!4398 lt!498744 lt!498746 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122395 () Bool)

(assert (=> b!1122395 (= e!639177 (= call!47128 call!47129))))

(declare-fun b!1122396 () Bool)

(declare-fun res!749460 () Bool)

(assert (=> b!1122396 (=> (not res!749460) (not e!639175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1122396 (= res!749460 (validMask!0 mask!1564))))

(declare-fun b!1122397 () Bool)

(declare-fun res!749454 () Bool)

(assert (=> b!1122397 (=> (not res!749454) (not e!639175))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1122397 (= res!749454 (validKeyInArray!0 k0!934))))

(declare-fun b!1122398 () Bool)

(assert (=> b!1122398 (= e!639183 (and e!639182 mapRes!44002))))

(declare-fun condMapEmpty!44002 () Bool)

(declare-fun mapDefault!44002 () ValueCell!13352)

(assert (=> b!1122398 (= condMapEmpty!44002 (= (arr!35234 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13352)) mapDefault!44002)))))

(declare-fun bm!47126 () Bool)

(assert (=> bm!47126 (= call!47129 (getCurrentListMapNoExtraKeys!4398 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1122399 () Bool)

(declare-fun res!749459 () Bool)

(assert (=> b!1122399 (=> (not res!749459) (not e!639175))))

(assert (=> b!1122399 (= res!749459 (and (= (size!35771 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35770 _keys!1208) (size!35771 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44002 () Bool)

(assert (=> mapIsEmpty!44002 mapRes!44002))

(declare-fun b!1122400 () Bool)

(declare-fun res!749461 () Bool)

(assert (=> b!1122400 (=> (not res!749461) (not e!639175))))

(assert (=> b!1122400 (= res!749461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98128 res!749455) b!1122396))

(assert (= (and b!1122396 res!749460) b!1122399))

(assert (= (and b!1122399 res!749459) b!1122400))

(assert (= (and b!1122400 res!749461) b!1122385))

(assert (= (and b!1122385 res!749458) b!1122386))

(assert (= (and b!1122386 res!749453) b!1122397))

(assert (= (and b!1122397 res!749454) b!1122392))

(assert (= (and b!1122392 res!749450) b!1122391))

(assert (= (and b!1122391 res!749451) b!1122393))

(assert (= (and b!1122393 res!749452) b!1122388))

(assert (= (and b!1122388 (not res!749457)) b!1122394))

(assert (= (and b!1122394 (not res!749456)) b!1122384))

(assert (= (and b!1122384 c!109790) b!1122390))

(assert (= (and b!1122384 (not c!109790)) b!1122395))

(assert (= (or b!1122390 b!1122395) bm!47125))

(assert (= (or b!1122390 b!1122395) bm!47126))

(assert (= (and b!1122398 condMapEmpty!44002) mapIsEmpty!44002))

(assert (= (and b!1122398 (not condMapEmpty!44002)) mapNonEmpty!44002))

(get-info :version)

(assert (= (and mapNonEmpty!44002 ((_ is ValueCellFull!13352) mapValue!44002)) b!1122387))

(assert (= (and b!1122398 ((_ is ValueCellFull!13352) mapDefault!44002)) b!1122389))

(assert (= start!98128 b!1122398))

(declare-fun b_lambda!18573 () Bool)

(assert (=> (not b_lambda!18573) (not b!1122394)))

(declare-fun t!35100 () Bool)

(declare-fun tb!8397 () Bool)

(assert (=> (and start!98128 (= defaultEntry!1004 defaultEntry!1004) t!35100) tb!8397))

(declare-fun result!17363 () Bool)

(assert (=> tb!8397 (= result!17363 tp_is_empty!28123)))

(assert (=> b!1122394 t!35100))

(declare-fun b_and!37981 () Bool)

(assert (= b_and!37979 (and (=> t!35100 result!17363) b_and!37981)))

(declare-fun m!1037649 () Bool)

(assert (=> bm!47126 m!1037649))

(declare-fun m!1037651 () Bool)

(assert (=> b!1122384 m!1037651))

(declare-fun m!1037653 () Bool)

(assert (=> b!1122396 m!1037653))

(declare-fun m!1037655 () Bool)

(assert (=> b!1122397 m!1037655))

(declare-fun m!1037657 () Bool)

(assert (=> start!98128 m!1037657))

(declare-fun m!1037659 () Bool)

(assert (=> start!98128 m!1037659))

(declare-fun m!1037661 () Bool)

(assert (=> b!1122385 m!1037661))

(declare-fun m!1037663 () Bool)

(assert (=> b!1122391 m!1037663))

(declare-fun m!1037665 () Bool)

(assert (=> b!1122391 m!1037665))

(declare-fun m!1037667 () Bool)

(assert (=> b!1122400 m!1037667))

(declare-fun m!1037669 () Bool)

(assert (=> bm!47125 m!1037669))

(declare-fun m!1037671 () Bool)

(assert (=> b!1122393 m!1037671))

(declare-fun m!1037673 () Bool)

(assert (=> b!1122392 m!1037673))

(declare-fun m!1037675 () Bool)

(assert (=> mapNonEmpty!44002 m!1037675))

(declare-fun m!1037677 () Bool)

(assert (=> b!1122394 m!1037677))

(declare-fun m!1037679 () Bool)

(assert (=> b!1122394 m!1037679))

(declare-fun m!1037681 () Bool)

(assert (=> b!1122394 m!1037681))

(declare-fun m!1037683 () Bool)

(assert (=> b!1122394 m!1037683))

(declare-fun m!1037685 () Bool)

(assert (=> b!1122388 m!1037685))

(declare-fun m!1037687 () Bool)

(assert (=> b!1122388 m!1037687))

(declare-fun m!1037689 () Bool)

(assert (=> b!1122390 m!1037689))

(check-sat (not b!1122393) (not b!1122388) (not b!1122396) (not bm!47126) b_and!37981 tp_is_empty!28123 (not b!1122397) (not b!1122390) (not b_next!23593) (not b!1122384) (not b!1122391) (not b!1122394) (not b_lambda!18573) (not mapNonEmpty!44002) (not b!1122400) (not b!1122385) (not bm!47125) (not start!98128))
(check-sat b_and!37981 (not b_next!23593))
