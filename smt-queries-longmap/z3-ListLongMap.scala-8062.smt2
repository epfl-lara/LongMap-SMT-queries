; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99448 () Bool)

(assert start!99448)

(declare-fun b_free!24817 () Bool)

(declare-fun b_next!24817 () Bool)

(assert (=> start!99448 (= b_free!24817 (not b_next!24817))))

(declare-fun tp!87161 () Bool)

(declare-fun b_and!40485 () Bool)

(assert (=> start!99448 (= tp!87161 b_and!40485)))

(declare-fun res!775592 () Bool)

(declare-fun e!664801 () Bool)

(assert (=> start!99448 (=> (not res!775592) (not e!664801))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!75565 0))(
  ( (array!75566 (arr!36427 (Array (_ BitVec 32) (_ BitVec 64))) (size!36964 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75565)

(assert (=> start!99448 (= res!775592 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36964 _keys!1208))))))

(assert (=> start!99448 e!664801))

(declare-fun tp_is_empty!29347 () Bool)

(assert (=> start!99448 tp_is_empty!29347))

(declare-fun array_inv!27920 (array!75565) Bool)

(assert (=> start!99448 (array_inv!27920 _keys!1208)))

(assert (=> start!99448 true))

(assert (=> start!99448 tp!87161))

(declare-datatypes ((V!44257 0))(
  ( (V!44258 (val!14730 Int)) )
))
(declare-datatypes ((ValueCell!13964 0))(
  ( (ValueCellFull!13964 (v!17363 V!44257)) (EmptyCell!13964) )
))
(declare-datatypes ((array!75567 0))(
  ( (array!75568 (arr!36428 (Array (_ BitVec 32) ValueCell!13964)) (size!36965 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75567)

(declare-fun e!664804 () Bool)

(declare-fun array_inv!27921 (array!75567) Bool)

(assert (=> start!99448 (and (array_inv!27921 _values!996) e!664804)))

(declare-fun b!1169544 () Bool)

(declare-fun e!664799 () Bool)

(assert (=> b!1169544 (= e!664799 tp_is_empty!29347)))

(declare-fun mapNonEmpty!45845 () Bool)

(declare-fun mapRes!45845 () Bool)

(declare-fun tp!87162 () Bool)

(declare-fun e!664800 () Bool)

(assert (=> mapNonEmpty!45845 (= mapRes!45845 (and tp!87162 e!664800))))

(declare-fun mapValue!45845 () ValueCell!13964)

(declare-fun mapRest!45845 () (Array (_ BitVec 32) ValueCell!13964))

(declare-fun mapKey!45845 () (_ BitVec 32))

(assert (=> mapNonEmpty!45845 (= (arr!36428 _values!996) (store mapRest!45845 mapKey!45845 mapValue!45845))))

(declare-fun b!1169545 () Bool)

(declare-fun e!664796 () Bool)

(declare-fun e!664802 () Bool)

(assert (=> b!1169545 (= e!664796 (not e!664802))))

(declare-fun res!775596 () Bool)

(assert (=> b!1169545 (=> res!775596 e!664802)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169545 (= res!775596 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169545 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38529 0))(
  ( (Unit!38530) )
))
(declare-fun lt!526435 () Unit!38529)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75565 (_ BitVec 64) (_ BitVec 32)) Unit!38529)

(assert (=> b!1169545 (= lt!526435 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169546 () Bool)

(declare-fun res!775600 () Bool)

(assert (=> b!1169546 (=> (not res!775600) (not e!664801))))

(declare-datatypes ((List!25569 0))(
  ( (Nil!25566) (Cons!25565 (h!26783 (_ BitVec 64)) (t!37370 List!25569)) )
))
(declare-fun arrayNoDuplicates!0 (array!75565 (_ BitVec 32) List!25569) Bool)

(assert (=> b!1169546 (= res!775600 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25566))))

(declare-fun b!1169547 () Bool)

(declare-fun res!775594 () Bool)

(assert (=> b!1169547 (=> (not res!775594) (not e!664801))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75565 (_ BitVec 32)) Bool)

(assert (=> b!1169547 (= res!775594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!45845 () Bool)

(assert (=> mapIsEmpty!45845 mapRes!45845))

(declare-fun b!1169548 () Bool)

(declare-fun res!775601 () Bool)

(assert (=> b!1169548 (=> (not res!775601) (not e!664801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169548 (= res!775601 (validMask!0 mask!1564))))

(declare-fun b!1169549 () Bool)

(declare-fun res!775591 () Bool)

(assert (=> b!1169549 (=> (not res!775591) (not e!664801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169549 (= res!775591 (validKeyInArray!0 k0!934))))

(declare-fun b!1169550 () Bool)

(declare-fun e!664798 () Bool)

(assert (=> b!1169550 (= e!664798 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!36964 _keys!1208))))))

(declare-fun b!1169551 () Bool)

(declare-fun res!775597 () Bool)

(assert (=> b!1169551 (=> (not res!775597) (not e!664801))))

(assert (=> b!1169551 (= res!775597 (= (select (arr!36427 _keys!1208) i!673) k0!934))))

(declare-fun b!1169552 () Bool)

(assert (=> b!1169552 (= e!664804 (and e!664799 mapRes!45845))))

(declare-fun condMapEmpty!45845 () Bool)

(declare-fun mapDefault!45845 () ValueCell!13964)

(assert (=> b!1169552 (= condMapEmpty!45845 (= (arr!36428 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13964)) mapDefault!45845)))))

(declare-fun b!1169553 () Bool)

(declare-fun res!775598 () Bool)

(assert (=> b!1169553 (=> (not res!775598) (not e!664801))))

(assert (=> b!1169553 (= res!775598 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36964 _keys!1208))))))

(declare-fun b!1169554 () Bool)

(declare-fun res!775593 () Bool)

(assert (=> b!1169554 (=> (not res!775593) (not e!664796))))

(declare-fun lt!526431 () array!75565)

(assert (=> b!1169554 (= res!775593 (arrayNoDuplicates!0 lt!526431 #b00000000000000000000000000000000 Nil!25566))))

(declare-fun b!1169555 () Bool)

(declare-fun res!775599 () Bool)

(assert (=> b!1169555 (=> (not res!775599) (not e!664801))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1169555 (= res!775599 (and (= (size!36965 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36964 _keys!1208) (size!36965 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1169556 () Bool)

(assert (=> b!1169556 (= e!664801 e!664796)))

(declare-fun res!775602 () Bool)

(assert (=> b!1169556 (=> (not res!775602) (not e!664796))))

(assert (=> b!1169556 (= res!775602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526431 mask!1564))))

(assert (=> b!1169556 (= lt!526431 (array!75566 (store (arr!36427 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36964 _keys!1208)))))

(declare-fun b!1169557 () Bool)

(assert (=> b!1169557 (= e!664800 tp_is_empty!29347)))

(declare-fun b!1169558 () Bool)

(declare-fun e!664797 () Bool)

(assert (=> b!1169558 (= e!664802 e!664797)))

(declare-fun res!775590 () Bool)

(assert (=> b!1169558 (=> res!775590 e!664797)))

(assert (=> b!1169558 (= res!775590 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44257)

(declare-datatypes ((tuple2!18828 0))(
  ( (tuple2!18829 (_1!9425 (_ BitVec 64)) (_2!9425 V!44257)) )
))
(declare-datatypes ((List!25570 0))(
  ( (Nil!25567) (Cons!25566 (h!26784 tuple2!18828) (t!37371 List!25570)) )
))
(declare-datatypes ((ListLongMap!16805 0))(
  ( (ListLongMap!16806 (toList!8418 List!25570)) )
))
(declare-fun lt!526434 () ListLongMap!16805)

(declare-fun lt!526430 () array!75567)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44257)

(declare-fun getCurrentListMapNoExtraKeys!4909 (array!75565 array!75567 (_ BitVec 32) (_ BitVec 32) V!44257 V!44257 (_ BitVec 32) Int) ListLongMap!16805)

(assert (=> b!1169558 (= lt!526434 (getCurrentListMapNoExtraKeys!4909 lt!526431 lt!526430 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2896 (Int (_ BitVec 64)) V!44257)

(assert (=> b!1169558 (= lt!526430 (array!75568 (store (arr!36428 _values!996) i!673 (ValueCellFull!13964 (dynLambda!2896 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36965 _values!996)))))

(declare-fun lt!526433 () ListLongMap!16805)

(assert (=> b!1169558 (= lt!526433 (getCurrentListMapNoExtraKeys!4909 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169559 () Bool)

(assert (=> b!1169559 (= e!664797 e!664798)))

(declare-fun res!775595 () Bool)

(assert (=> b!1169559 (=> res!775595 e!664798)))

(assert (=> b!1169559 (= res!775595 (not (validKeyInArray!0 (select (arr!36427 _keys!1208) from!1455))))))

(declare-fun -!1479 (ListLongMap!16805 (_ BitVec 64)) ListLongMap!16805)

(assert (=> b!1169559 (= (getCurrentListMapNoExtraKeys!4909 lt!526431 lt!526430 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1479 (getCurrentListMapNoExtraKeys!4909 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!526432 () Unit!38529)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!704 (array!75565 array!75567 (_ BitVec 32) (_ BitVec 32) V!44257 V!44257 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38529)

(assert (=> b!1169559 (= lt!526432 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!704 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99448 res!775592) b!1169548))

(assert (= (and b!1169548 res!775601) b!1169555))

(assert (= (and b!1169555 res!775599) b!1169547))

(assert (= (and b!1169547 res!775594) b!1169546))

(assert (= (and b!1169546 res!775600) b!1169553))

(assert (= (and b!1169553 res!775598) b!1169549))

(assert (= (and b!1169549 res!775591) b!1169551))

(assert (= (and b!1169551 res!775597) b!1169556))

(assert (= (and b!1169556 res!775602) b!1169554))

(assert (= (and b!1169554 res!775593) b!1169545))

(assert (= (and b!1169545 (not res!775596)) b!1169558))

(assert (= (and b!1169558 (not res!775590)) b!1169559))

(assert (= (and b!1169559 (not res!775595)) b!1169550))

(assert (= (and b!1169552 condMapEmpty!45845) mapIsEmpty!45845))

(assert (= (and b!1169552 (not condMapEmpty!45845)) mapNonEmpty!45845))

(get-info :version)

(assert (= (and mapNonEmpty!45845 ((_ is ValueCellFull!13964) mapValue!45845)) b!1169557))

(assert (= (and b!1169552 ((_ is ValueCellFull!13964) mapDefault!45845)) b!1169544))

(assert (= start!99448 b!1169552))

(declare-fun b_lambda!19917 () Bool)

(assert (=> (not b_lambda!19917) (not b!1169558)))

(declare-fun t!37369 () Bool)

(declare-fun tb!9621 () Bool)

(assert (=> (and start!99448 (= defaultEntry!1004 defaultEntry!1004) t!37369) tb!9621))

(declare-fun result!19815 () Bool)

(assert (=> tb!9621 (= result!19815 tp_is_empty!29347)))

(assert (=> b!1169558 t!37369))

(declare-fun b_and!40487 () Bool)

(assert (= b_and!40485 (and (=> t!37369 result!19815) b_and!40487)))

(declare-fun m!1077671 () Bool)

(assert (=> b!1169549 m!1077671))

(declare-fun m!1077673 () Bool)

(assert (=> b!1169547 m!1077673))

(declare-fun m!1077675 () Bool)

(assert (=> b!1169551 m!1077675))

(declare-fun m!1077677 () Bool)

(assert (=> start!99448 m!1077677))

(declare-fun m!1077679 () Bool)

(assert (=> start!99448 m!1077679))

(declare-fun m!1077681 () Bool)

(assert (=> b!1169554 m!1077681))

(declare-fun m!1077683 () Bool)

(assert (=> b!1169548 m!1077683))

(declare-fun m!1077685 () Bool)

(assert (=> b!1169556 m!1077685))

(declare-fun m!1077687 () Bool)

(assert (=> b!1169556 m!1077687))

(declare-fun m!1077689 () Bool)

(assert (=> mapNonEmpty!45845 m!1077689))

(declare-fun m!1077691 () Bool)

(assert (=> b!1169559 m!1077691))

(declare-fun m!1077693 () Bool)

(assert (=> b!1169559 m!1077693))

(declare-fun m!1077695 () Bool)

(assert (=> b!1169559 m!1077695))

(assert (=> b!1169559 m!1077691))

(declare-fun m!1077697 () Bool)

(assert (=> b!1169559 m!1077697))

(declare-fun m!1077699 () Bool)

(assert (=> b!1169559 m!1077699))

(declare-fun m!1077701 () Bool)

(assert (=> b!1169559 m!1077701))

(assert (=> b!1169559 m!1077699))

(declare-fun m!1077703 () Bool)

(assert (=> b!1169546 m!1077703))

(declare-fun m!1077705 () Bool)

(assert (=> b!1169558 m!1077705))

(declare-fun m!1077707 () Bool)

(assert (=> b!1169558 m!1077707))

(declare-fun m!1077709 () Bool)

(assert (=> b!1169558 m!1077709))

(declare-fun m!1077711 () Bool)

(assert (=> b!1169558 m!1077711))

(declare-fun m!1077713 () Bool)

(assert (=> b!1169545 m!1077713))

(declare-fun m!1077715 () Bool)

(assert (=> b!1169545 m!1077715))

(check-sat (not b!1169545) (not b!1169546) (not b!1169549) b_and!40487 (not b!1169559) (not mapNonEmpty!45845) (not start!99448) (not b!1169547) (not b!1169556) (not b!1169548) (not b!1169558) tp_is_empty!29347 (not b_next!24817) (not b_lambda!19917) (not b!1169554))
(check-sat b_and!40487 (not b_next!24817))
