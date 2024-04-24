; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98338 () Bool)

(assert start!98338)

(declare-fun b_free!23803 () Bool)

(declare-fun b_next!23803 () Bool)

(assert (=> start!98338 (= b_free!23803 (not b_next!23803))))

(declare-fun tp!84113 () Bool)

(declare-fun b_and!38399 () Bool)

(assert (=> start!98338 (= tp!84113 b_and!38399)))

(declare-fun b!1128410 () Bool)

(declare-fun e!642370 () Bool)

(assert (=> b!1128410 (= e!642370 true)))

(declare-datatypes ((V!42905 0))(
  ( (V!42906 (val!14223 Int)) )
))
(declare-fun zeroValue!944 () V!42905)

(declare-datatypes ((array!73571 0))(
  ( (array!73572 (arr!35432 (Array (_ BitVec 32) (_ BitVec 64))) (size!35969 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73571)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13457 0))(
  ( (ValueCellFull!13457 (v!16852 V!42905)) (EmptyCell!13457) )
))
(declare-datatypes ((array!73573 0))(
  ( (array!73574 (arr!35433 (Array (_ BitVec 32) ValueCell!13457)) (size!35970 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73573)

(declare-fun minValue!944 () V!42905)

(declare-fun lt!500968 () Bool)

(declare-datatypes ((tuple2!17902 0))(
  ( (tuple2!17903 (_1!8962 (_ BitVec 64)) (_2!8962 V!42905)) )
))
(declare-datatypes ((List!24686 0))(
  ( (Nil!24683) (Cons!24682 (h!25900 tuple2!17902) (t!35473 List!24686)) )
))
(declare-datatypes ((ListLongMap!15879 0))(
  ( (ListLongMap!15880 (toList!7955 List!24686)) )
))
(declare-fun contains!6498 (ListLongMap!15879 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4476 (array!73571 array!73573 (_ BitVec 32) (_ BitVec 32) V!42905 V!42905 (_ BitVec 32) Int) ListLongMap!15879)

(assert (=> b!1128410 (= lt!500968 (contains!6498 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1128411 () Bool)

(declare-fun e!642368 () Bool)

(declare-fun tp_is_empty!28333 () Bool)

(assert (=> b!1128411 (= e!642368 tp_is_empty!28333)))

(declare-fun call!47758 () ListLongMap!15879)

(declare-fun bm!47755 () Bool)

(declare-fun lt!500973 () array!73571)

(declare-fun lt!500971 () array!73573)

(assert (=> bm!47755 (= call!47758 (getCurrentListMapNoExtraKeys!4476 lt!500973 lt!500971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128412 () Bool)

(declare-fun e!642365 () Bool)

(assert (=> b!1128412 (= e!642365 tp_is_empty!28333)))

(declare-fun b!1128413 () Bool)

(declare-fun res!753699 () Bool)

(declare-fun e!642372 () Bool)

(assert (=> b!1128413 (=> (not res!753699) (not e!642372))))

(declare-datatypes ((List!24687 0))(
  ( (Nil!24684) (Cons!24683 (h!25901 (_ BitVec 64)) (t!35474 List!24687)) )
))
(declare-fun arrayNoDuplicates!0 (array!73571 (_ BitVec 32) List!24687) Bool)

(assert (=> b!1128413 (= res!753699 (arrayNoDuplicates!0 lt!500973 #b00000000000000000000000000000000 Nil!24684))))

(declare-fun res!753697 () Bool)

(declare-fun e!642364 () Bool)

(assert (=> start!98338 (=> (not res!753697) (not e!642364))))

(assert (=> start!98338 (= res!753697 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35969 _keys!1208))))))

(assert (=> start!98338 e!642364))

(assert (=> start!98338 tp_is_empty!28333))

(declare-fun array_inv!27242 (array!73571) Bool)

(assert (=> start!98338 (array_inv!27242 _keys!1208)))

(assert (=> start!98338 true))

(assert (=> start!98338 tp!84113))

(declare-fun e!642371 () Bool)

(declare-fun array_inv!27243 (array!73573) Bool)

(assert (=> start!98338 (and (array_inv!27243 _values!996) e!642371)))

(declare-fun b!1128414 () Bool)

(declare-fun res!753696 () Bool)

(assert (=> b!1128414 (=> (not res!753696) (not e!642364))))

(assert (=> b!1128414 (= res!753696 (and (= (size!35970 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35969 _keys!1208) (size!35970 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun call!47759 () ListLongMap!15879)

(declare-fun e!642369 () Bool)

(declare-fun b!1128415 () Bool)

(declare-fun -!1129 (ListLongMap!15879 (_ BitVec 64)) ListLongMap!15879)

(assert (=> b!1128415 (= e!642369 (= call!47758 (-!1129 call!47759 k0!934)))))

(declare-fun b!1128416 () Bool)

(declare-fun res!753700 () Bool)

(assert (=> b!1128416 (=> (not res!753700) (not e!642364))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1128416 (= res!753700 (= (select (arr!35432 _keys!1208) i!673) k0!934))))

(declare-fun b!1128417 () Bool)

(declare-fun mapRes!44317 () Bool)

(assert (=> b!1128417 (= e!642371 (and e!642365 mapRes!44317))))

(declare-fun condMapEmpty!44317 () Bool)

(declare-fun mapDefault!44317 () ValueCell!13457)

(assert (=> b!1128417 (= condMapEmpty!44317 (= (arr!35433 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13457)) mapDefault!44317)))))

(declare-fun b!1128418 () Bool)

(declare-fun e!642363 () Bool)

(declare-fun e!642367 () Bool)

(assert (=> b!1128418 (= e!642363 e!642367)))

(declare-fun res!753695 () Bool)

(assert (=> b!1128418 (=> res!753695 e!642367)))

(assert (=> b!1128418 (= res!753695 (not (= from!1455 i!673)))))

(declare-fun lt!500974 () ListLongMap!15879)

(assert (=> b!1128418 (= lt!500974 (getCurrentListMapNoExtraKeys!4476 lt!500973 lt!500971 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2545 (Int (_ BitVec 64)) V!42905)

(assert (=> b!1128418 (= lt!500971 (array!73574 (store (arr!35433 _values!996) i!673 (ValueCellFull!13457 (dynLambda!2545 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35970 _values!996)))))

(declare-fun lt!500972 () ListLongMap!15879)

(assert (=> b!1128418 (= lt!500972 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44317 () Bool)

(declare-fun tp!84112 () Bool)

(assert (=> mapNonEmpty!44317 (= mapRes!44317 (and tp!84112 e!642368))))

(declare-fun mapKey!44317 () (_ BitVec 32))

(declare-fun mapValue!44317 () ValueCell!13457)

(declare-fun mapRest!44317 () (Array (_ BitVec 32) ValueCell!13457))

(assert (=> mapNonEmpty!44317 (= (arr!35433 _values!996) (store mapRest!44317 mapKey!44317 mapValue!44317))))

(declare-fun b!1128419 () Bool)

(assert (=> b!1128419 (= e!642367 e!642370)))

(declare-fun res!753701 () Bool)

(assert (=> b!1128419 (=> res!753701 e!642370)))

(assert (=> b!1128419 (= res!753701 (not (= (select (arr!35432 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1128419 e!642369))

(declare-fun c!110105 () Bool)

(assert (=> b!1128419 (= c!110105 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36917 0))(
  ( (Unit!36918) )
))
(declare-fun lt!500969 () Unit!36917)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!390 (array!73571 array!73573 (_ BitVec 32) (_ BitVec 32) V!42905 V!42905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36917)

(assert (=> b!1128419 (= lt!500969 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!390 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128420 () Bool)

(assert (=> b!1128420 (= e!642364 e!642372)))

(declare-fun res!753698 () Bool)

(assert (=> b!1128420 (=> (not res!753698) (not e!642372))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73571 (_ BitVec 32)) Bool)

(assert (=> b!1128420 (= res!753698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500973 mask!1564))))

(assert (=> b!1128420 (= lt!500973 (array!73572 (store (arr!35432 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35969 _keys!1208)))))

(declare-fun b!1128421 () Bool)

(declare-fun res!753694 () Bool)

(assert (=> b!1128421 (=> (not res!753694) (not e!642364))))

(assert (=> b!1128421 (= res!753694 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24684))))

(declare-fun bm!47756 () Bool)

(assert (=> bm!47756 (= call!47759 (getCurrentListMapNoExtraKeys!4476 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1128422 () Bool)

(assert (=> b!1128422 (= e!642372 (not e!642363))))

(declare-fun res!753692 () Bool)

(assert (=> b!1128422 (=> res!753692 e!642363)))

(assert (=> b!1128422 (= res!753692 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1128422 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500970 () Unit!36917)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73571 (_ BitVec 64) (_ BitVec 32)) Unit!36917)

(assert (=> b!1128422 (= lt!500970 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1128423 () Bool)

(declare-fun res!753691 () Bool)

(assert (=> b!1128423 (=> (not res!753691) (not e!642364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1128423 (= res!753691 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44317 () Bool)

(assert (=> mapIsEmpty!44317 mapRes!44317))

(declare-fun b!1128424 () Bool)

(declare-fun res!753693 () Bool)

(assert (=> b!1128424 (=> (not res!753693) (not e!642364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1128424 (= res!753693 (validMask!0 mask!1564))))

(declare-fun b!1128425 () Bool)

(assert (=> b!1128425 (= e!642369 (= call!47758 call!47759))))

(declare-fun b!1128426 () Bool)

(declare-fun res!753702 () Bool)

(assert (=> b!1128426 (=> (not res!753702) (not e!642364))))

(assert (=> b!1128426 (= res!753702 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35969 _keys!1208))))))

(declare-fun b!1128427 () Bool)

(declare-fun res!753703 () Bool)

(assert (=> b!1128427 (=> (not res!753703) (not e!642364))))

(assert (=> b!1128427 (= res!753703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98338 res!753697) b!1128424))

(assert (= (and b!1128424 res!753693) b!1128414))

(assert (= (and b!1128414 res!753696) b!1128427))

(assert (= (and b!1128427 res!753703) b!1128421))

(assert (= (and b!1128421 res!753694) b!1128426))

(assert (= (and b!1128426 res!753702) b!1128423))

(assert (= (and b!1128423 res!753691) b!1128416))

(assert (= (and b!1128416 res!753700) b!1128420))

(assert (= (and b!1128420 res!753698) b!1128413))

(assert (= (and b!1128413 res!753699) b!1128422))

(assert (= (and b!1128422 (not res!753692)) b!1128418))

(assert (= (and b!1128418 (not res!753695)) b!1128419))

(assert (= (and b!1128419 c!110105) b!1128415))

(assert (= (and b!1128419 (not c!110105)) b!1128425))

(assert (= (or b!1128415 b!1128425) bm!47755))

(assert (= (or b!1128415 b!1128425) bm!47756))

(assert (= (and b!1128419 (not res!753701)) b!1128410))

(assert (= (and b!1128417 condMapEmpty!44317) mapIsEmpty!44317))

(assert (= (and b!1128417 (not condMapEmpty!44317)) mapNonEmpty!44317))

(get-info :version)

(assert (= (and mapNonEmpty!44317 ((_ is ValueCellFull!13457) mapValue!44317)) b!1128411))

(assert (= (and b!1128417 ((_ is ValueCellFull!13457) mapDefault!44317)) b!1128412))

(assert (= start!98338 b!1128417))

(declare-fun b_lambda!18783 () Bool)

(assert (=> (not b_lambda!18783) (not b!1128418)))

(declare-fun t!35472 () Bool)

(declare-fun tb!8607 () Bool)

(assert (=> (and start!98338 (= defaultEntry!1004 defaultEntry!1004) t!35472) tb!8607))

(declare-fun result!17783 () Bool)

(assert (=> tb!8607 (= result!17783 tp_is_empty!28333)))

(assert (=> b!1128418 t!35472))

(declare-fun b_and!38401 () Bool)

(assert (= b_and!38399 (and (=> t!35472 result!17783) b_and!38401)))

(declare-fun m!1042599 () Bool)

(assert (=> b!1128423 m!1042599))

(declare-fun m!1042601 () Bool)

(assert (=> b!1128424 m!1042601))

(declare-fun m!1042603 () Bool)

(assert (=> b!1128413 m!1042603))

(declare-fun m!1042605 () Bool)

(assert (=> b!1128416 m!1042605))

(declare-fun m!1042607 () Bool)

(assert (=> b!1128418 m!1042607))

(declare-fun m!1042609 () Bool)

(assert (=> b!1128418 m!1042609))

(declare-fun m!1042611 () Bool)

(assert (=> b!1128418 m!1042611))

(declare-fun m!1042613 () Bool)

(assert (=> b!1128418 m!1042613))

(declare-fun m!1042615 () Bool)

(assert (=> mapNonEmpty!44317 m!1042615))

(declare-fun m!1042617 () Bool)

(assert (=> b!1128419 m!1042617))

(declare-fun m!1042619 () Bool)

(assert (=> b!1128419 m!1042619))

(declare-fun m!1042621 () Bool)

(assert (=> start!98338 m!1042621))

(declare-fun m!1042623 () Bool)

(assert (=> start!98338 m!1042623))

(declare-fun m!1042625 () Bool)

(assert (=> bm!47755 m!1042625))

(declare-fun m!1042627 () Bool)

(assert (=> b!1128410 m!1042627))

(assert (=> b!1128410 m!1042627))

(declare-fun m!1042629 () Bool)

(assert (=> b!1128410 m!1042629))

(declare-fun m!1042631 () Bool)

(assert (=> b!1128422 m!1042631))

(declare-fun m!1042633 () Bool)

(assert (=> b!1128422 m!1042633))

(declare-fun m!1042635 () Bool)

(assert (=> b!1128421 m!1042635))

(assert (=> bm!47756 m!1042627))

(declare-fun m!1042637 () Bool)

(assert (=> b!1128420 m!1042637))

(declare-fun m!1042639 () Bool)

(assert (=> b!1128420 m!1042639))

(declare-fun m!1042641 () Bool)

(assert (=> b!1128415 m!1042641))

(declare-fun m!1042643 () Bool)

(assert (=> b!1128427 m!1042643))

(check-sat (not b!1128424) (not b!1128420) (not bm!47756) (not b!1128423) (not b!1128427) (not bm!47755) (not b!1128419) tp_is_empty!28333 (not b!1128421) (not b_next!23803) (not b!1128422) (not b!1128418) b_and!38401 (not b!1128415) (not mapNonEmpty!44317) (not b_lambda!18783) (not b!1128413) (not start!98338) (not b!1128410))
(check-sat b_and!38401 (not b_next!23803))
