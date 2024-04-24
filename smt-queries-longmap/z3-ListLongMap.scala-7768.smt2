; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97588 () Bool)

(assert start!97588)

(declare-fun b_free!23323 () Bool)

(declare-fun b_next!23323 () Bool)

(assert (=> start!97588 (= b_free!23323 (not b_next!23323))))

(declare-fun tp!82267 () Bool)

(declare-fun b_and!37489 () Bool)

(assert (=> start!97588 (= tp!82267 b_and!37489)))

(declare-fun b!1110784 () Bool)

(declare-fun e!633673 () Bool)

(declare-fun tp_is_empty!27583 () Bool)

(assert (=> b!1110784 (= e!633673 tp_is_empty!27583)))

(declare-fun b!1110785 () Bool)

(declare-fun res!740922 () Bool)

(declare-fun e!633674 () Bool)

(assert (=> b!1110785 (=> (not res!740922) (not e!633674))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110785 (= res!740922 (validMask!0 mask!1564))))

(declare-fun res!740924 () Bool)

(assert (=> start!97588 (=> (not res!740924) (not e!633674))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72117 0))(
  ( (array!72118 (arr!34705 (Array (_ BitVec 32) (_ BitVec 64))) (size!35242 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72117)

(assert (=> start!97588 (= res!740924 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35242 _keys!1208))))))

(assert (=> start!97588 e!633674))

(assert (=> start!97588 tp_is_empty!27583))

(declare-fun array_inv!26740 (array!72117) Bool)

(assert (=> start!97588 (array_inv!26740 _keys!1208)))

(assert (=> start!97588 true))

(assert (=> start!97588 tp!82267))

(declare-datatypes ((V!41905 0))(
  ( (V!41906 (val!13848 Int)) )
))
(declare-datatypes ((ValueCell!13082 0))(
  ( (ValueCellFull!13082 (v!16477 V!41905)) (EmptyCell!13082) )
))
(declare-datatypes ((array!72119 0))(
  ( (array!72120 (arr!34706 (Array (_ BitVec 32) ValueCell!13082)) (size!35243 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72119)

(declare-fun e!633675 () Bool)

(declare-fun array_inv!26741 (array!72119) Bool)

(assert (=> start!97588 (and (array_inv!26741 _values!996) e!633675)))

(declare-fun b!1110786 () Bool)

(declare-fun e!633677 () Bool)

(assert (=> b!1110786 (= e!633674 e!633677)))

(declare-fun res!740921 () Bool)

(assert (=> b!1110786 (=> (not res!740921) (not e!633677))))

(declare-fun lt!496505 () array!72117)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72117 (_ BitVec 32)) Bool)

(assert (=> b!1110786 (= res!740921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496505 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110786 (= lt!496505 (array!72118 (store (arr!34705 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35242 _keys!1208)))))

(declare-fun mapIsEmpty!43192 () Bool)

(declare-fun mapRes!43192 () Bool)

(assert (=> mapIsEmpty!43192 mapRes!43192))

(declare-fun mapNonEmpty!43192 () Bool)

(declare-fun tp!82268 () Bool)

(declare-fun e!633676 () Bool)

(assert (=> mapNonEmpty!43192 (= mapRes!43192 (and tp!82268 e!633676))))

(declare-fun mapRest!43192 () (Array (_ BitVec 32) ValueCell!13082))

(declare-fun mapValue!43192 () ValueCell!13082)

(declare-fun mapKey!43192 () (_ BitVec 32))

(assert (=> mapNonEmpty!43192 (= (arr!34706 _values!996) (store mapRest!43192 mapKey!43192 mapValue!43192))))

(declare-fun b!1110787 () Bool)

(declare-fun e!633678 () Bool)

(assert (=> b!1110787 (= e!633677 (not e!633678))))

(declare-fun res!740917 () Bool)

(assert (=> b!1110787 (=> res!740917 e!633678)))

(assert (=> b!1110787 (= res!740917 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35242 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110787 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36387 0))(
  ( (Unit!36388) )
))
(declare-fun lt!496507 () Unit!36387)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72117 (_ BitVec 64) (_ BitVec 32)) Unit!36387)

(assert (=> b!1110787 (= lt!496507 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110788 () Bool)

(declare-datatypes ((tuple2!17518 0))(
  ( (tuple2!17519 (_1!8770 (_ BitVec 64)) (_2!8770 V!41905)) )
))
(declare-datatypes ((List!24204 0))(
  ( (Nil!24201) (Cons!24200 (h!25418 tuple2!17518) (t!34565 List!24204)) )
))
(declare-datatypes ((ListLongMap!15495 0))(
  ( (ListLongMap!15496 (toList!7763 List!24204)) )
))
(declare-fun call!46732 () ListLongMap!15495)

(declare-fun call!46733 () ListLongMap!15495)

(declare-fun e!633672 () Bool)

(declare-fun -!1017 (ListLongMap!15495 (_ BitVec 64)) ListLongMap!15495)

(assert (=> b!1110788 (= e!633672 (= call!46733 (-!1017 call!46732 k0!934)))))

(declare-fun b!1110789 () Bool)

(declare-fun res!740925 () Bool)

(assert (=> b!1110789 (=> (not res!740925) (not e!633674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110789 (= res!740925 (validKeyInArray!0 k0!934))))

(declare-fun b!1110790 () Bool)

(declare-fun res!740918 () Bool)

(assert (=> b!1110790 (=> (not res!740918) (not e!633674))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1110790 (= res!740918 (and (= (size!35243 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35242 _keys!1208) (size!35243 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1110791 () Bool)

(declare-fun res!740923 () Bool)

(assert (=> b!1110791 (=> (not res!740923) (not e!633674))))

(assert (=> b!1110791 (= res!740923 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35242 _keys!1208))))))

(declare-fun zeroValue!944 () V!41905)

(declare-fun bm!46729 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!41905)

(declare-fun getCurrentListMapNoExtraKeys!4297 (array!72117 array!72119 (_ BitVec 32) (_ BitVec 32) V!41905 V!41905 (_ BitVec 32) Int) ListLongMap!15495)

(declare-fun dynLambda!2409 (Int (_ BitVec 64)) V!41905)

(assert (=> bm!46729 (= call!46733 (getCurrentListMapNoExtraKeys!4297 lt!496505 (array!72120 (store (arr!34706 _values!996) i!673 (ValueCellFull!13082 (dynLambda!2409 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35243 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110792 () Bool)

(assert (=> b!1110792 (= e!633672 (= call!46733 call!46732))))

(declare-fun b!1110793 () Bool)

(declare-fun res!740919 () Bool)

(assert (=> b!1110793 (=> (not res!740919) (not e!633674))))

(declare-datatypes ((List!24205 0))(
  ( (Nil!24202) (Cons!24201 (h!25419 (_ BitVec 64)) (t!34566 List!24205)) )
))
(declare-fun arrayNoDuplicates!0 (array!72117 (_ BitVec 32) List!24205) Bool)

(assert (=> b!1110793 (= res!740919 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24202))))

(declare-fun b!1110794 () Bool)

(declare-fun res!740920 () Bool)

(assert (=> b!1110794 (=> (not res!740920) (not e!633674))))

(assert (=> b!1110794 (= res!740920 (= (select (arr!34705 _keys!1208) i!673) k0!934))))

(declare-fun b!1110795 () Bool)

(assert (=> b!1110795 (= e!633676 tp_is_empty!27583)))

(declare-fun b!1110796 () Bool)

(assert (=> b!1110796 (= e!633678 true)))

(assert (=> b!1110796 e!633672))

(declare-fun c!109580 () Bool)

(assert (=> b!1110796 (= c!109580 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496506 () Unit!36387)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!288 (array!72117 array!72119 (_ BitVec 32) (_ BitVec 32) V!41905 V!41905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36387)

(assert (=> b!1110796 (= lt!496506 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!288 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46730 () Bool)

(assert (=> bm!46730 (= call!46732 (getCurrentListMapNoExtraKeys!4297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1110797 () Bool)

(assert (=> b!1110797 (= e!633675 (and e!633673 mapRes!43192))))

(declare-fun condMapEmpty!43192 () Bool)

(declare-fun mapDefault!43192 () ValueCell!13082)

(assert (=> b!1110797 (= condMapEmpty!43192 (= (arr!34706 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13082)) mapDefault!43192)))))

(declare-fun b!1110798 () Bool)

(declare-fun res!740916 () Bool)

(assert (=> b!1110798 (=> (not res!740916) (not e!633677))))

(assert (=> b!1110798 (= res!740916 (arrayNoDuplicates!0 lt!496505 #b00000000000000000000000000000000 Nil!24202))))

(declare-fun b!1110799 () Bool)

(declare-fun res!740926 () Bool)

(assert (=> b!1110799 (=> (not res!740926) (not e!633674))))

(assert (=> b!1110799 (= res!740926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!97588 res!740924) b!1110785))

(assert (= (and b!1110785 res!740922) b!1110790))

(assert (= (and b!1110790 res!740918) b!1110799))

(assert (= (and b!1110799 res!740926) b!1110793))

(assert (= (and b!1110793 res!740919) b!1110791))

(assert (= (and b!1110791 res!740923) b!1110789))

(assert (= (and b!1110789 res!740925) b!1110794))

(assert (= (and b!1110794 res!740920) b!1110786))

(assert (= (and b!1110786 res!740921) b!1110798))

(assert (= (and b!1110798 res!740916) b!1110787))

(assert (= (and b!1110787 (not res!740917)) b!1110796))

(assert (= (and b!1110796 c!109580) b!1110788))

(assert (= (and b!1110796 (not c!109580)) b!1110792))

(assert (= (or b!1110788 b!1110792) bm!46729))

(assert (= (or b!1110788 b!1110792) bm!46730))

(assert (= (and b!1110797 condMapEmpty!43192) mapIsEmpty!43192))

(assert (= (and b!1110797 (not condMapEmpty!43192)) mapNonEmpty!43192))

(get-info :version)

(assert (= (and mapNonEmpty!43192 ((_ is ValueCellFull!13082) mapValue!43192)) b!1110795))

(assert (= (and b!1110797 ((_ is ValueCellFull!13082) mapDefault!43192)) b!1110784))

(assert (= start!97588 b!1110797))

(declare-fun b_lambda!18353 () Bool)

(assert (=> (not b_lambda!18353) (not bm!46729)))

(declare-fun t!34564 () Bool)

(declare-fun tb!8181 () Bool)

(assert (=> (and start!97588 (= defaultEntry!1004 defaultEntry!1004) t!34564) tb!8181))

(declare-fun result!16931 () Bool)

(assert (=> tb!8181 (= result!16931 tp_is_empty!27583)))

(assert (=> bm!46729 t!34564))

(declare-fun b_and!37491 () Bool)

(assert (= b_and!37489 (and (=> t!34564 result!16931) b_and!37491)))

(declare-fun m!1029411 () Bool)

(assert (=> b!1110799 m!1029411))

(declare-fun m!1029413 () Bool)

(assert (=> b!1110793 m!1029413))

(declare-fun m!1029415 () Bool)

(assert (=> bm!46729 m!1029415))

(declare-fun m!1029417 () Bool)

(assert (=> bm!46729 m!1029417))

(declare-fun m!1029419 () Bool)

(assert (=> bm!46729 m!1029419))

(declare-fun m!1029421 () Bool)

(assert (=> b!1110789 m!1029421))

(declare-fun m!1029423 () Bool)

(assert (=> bm!46730 m!1029423))

(declare-fun m!1029425 () Bool)

(assert (=> b!1110787 m!1029425))

(declare-fun m!1029427 () Bool)

(assert (=> b!1110787 m!1029427))

(declare-fun m!1029429 () Bool)

(assert (=> start!97588 m!1029429))

(declare-fun m!1029431 () Bool)

(assert (=> start!97588 m!1029431))

(declare-fun m!1029433 () Bool)

(assert (=> mapNonEmpty!43192 m!1029433))

(declare-fun m!1029435 () Bool)

(assert (=> b!1110785 m!1029435))

(declare-fun m!1029437 () Bool)

(assert (=> b!1110786 m!1029437))

(declare-fun m!1029439 () Bool)

(assert (=> b!1110786 m!1029439))

(declare-fun m!1029441 () Bool)

(assert (=> b!1110788 m!1029441))

(declare-fun m!1029443 () Bool)

(assert (=> b!1110794 m!1029443))

(declare-fun m!1029445 () Bool)

(assert (=> b!1110798 m!1029445))

(declare-fun m!1029447 () Bool)

(assert (=> b!1110796 m!1029447))

(check-sat (not b!1110786) (not b!1110793) (not b!1110789) (not bm!46730) (not start!97588) (not b!1110788) b_and!37491 (not b_lambda!18353) (not b!1110798) (not b!1110787) (not b_next!23323) (not b!1110785) (not bm!46729) (not b!1110799) (not mapNonEmpty!43192) (not b!1110796) tp_is_empty!27583)
(check-sat b_and!37491 (not b_next!23323))
