; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98120 () Bool)

(assert start!98120)

(declare-fun b_free!23827 () Bool)

(declare-fun b_next!23827 () Bool)

(assert (=> start!98120 (= b_free!23827 (not b_next!23827))))

(declare-fun tp!84185 () Bool)

(declare-fun b_and!38415 () Bool)

(assert (=> start!98120 (= tp!84185 b_and!38415)))

(declare-fun b!1127626 () Bool)

(declare-fun e!641796 () Bool)

(declare-fun tp_is_empty!28357 () Bool)

(assert (=> b!1127626 (= e!641796 tp_is_empty!28357)))

(declare-fun b!1127627 () Bool)

(declare-fun e!641795 () Bool)

(declare-fun mapRes!44353 () Bool)

(assert (=> b!1127627 (= e!641795 (and e!641796 mapRes!44353))))

(declare-fun condMapEmpty!44353 () Bool)

(declare-datatypes ((V!42937 0))(
  ( (V!42938 (val!14235 Int)) )
))
(declare-datatypes ((ValueCell!13469 0))(
  ( (ValueCellFull!13469 (v!16867 V!42937)) (EmptyCell!13469) )
))
(declare-datatypes ((array!73500 0))(
  ( (array!73501 (arr!35403 (Array (_ BitVec 32) ValueCell!13469)) (size!35941 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73500)

(declare-fun mapDefault!44353 () ValueCell!13469)

(assert (=> b!1127627 (= condMapEmpty!44353 (= (arr!35403 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13469)) mapDefault!44353)))))

(declare-fun b!1127628 () Bool)

(declare-fun res!753571 () Bool)

(declare-fun e!641793 () Bool)

(assert (=> b!1127628 (=> (not res!753571) (not e!641793))))

(declare-datatypes ((array!73502 0))(
  ( (array!73503 (arr!35404 (Array (_ BitVec 32) (_ BitVec 64))) (size!35942 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73502)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1127628 (= res!753571 (and (= (size!35941 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35942 _keys!1208) (size!35941 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44353 () Bool)

(assert (=> mapIsEmpty!44353 mapRes!44353))

(declare-fun b!1127629 () Bool)

(declare-fun e!641791 () Bool)

(declare-fun e!641790 () Bool)

(assert (=> b!1127629 (= e!641791 e!641790)))

(declare-fun res!753568 () Bool)

(assert (=> b!1127629 (=> res!753568 e!641790)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1127629 (= res!753568 (not (= (select (arr!35404 _keys!1208) from!1455) k0!934)))))

(declare-fun e!641792 () Bool)

(assert (=> b!1127629 e!641792))

(declare-fun c!109704 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127629 (= c!109704 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun zeroValue!944 () V!42937)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42937)

(declare-datatypes ((Unit!36801 0))(
  ( (Unit!36802) )
))
(declare-fun lt!500509 () Unit!36801)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!405 (array!73502 array!73500 (_ BitVec 32) (_ BitVec 32) V!42937 V!42937 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36801)

(assert (=> b!1127629 (= lt!500509 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127630 () Bool)

(declare-fun res!753569 () Bool)

(declare-fun e!641787 () Bool)

(assert (=> b!1127630 (=> (not res!753569) (not e!641787))))

(declare-fun lt!500505 () array!73502)

(declare-datatypes ((List!24759 0))(
  ( (Nil!24756) (Cons!24755 (h!25964 (_ BitVec 64)) (t!35569 List!24759)) )
))
(declare-fun arrayNoDuplicates!0 (array!73502 (_ BitVec 32) List!24759) Bool)

(assert (=> b!1127630 (= res!753569 (arrayNoDuplicates!0 lt!500505 #b00000000000000000000000000000000 Nil!24756))))

(declare-fun b!1127631 () Bool)

(assert (=> b!1127631 (= e!641793 e!641787)))

(declare-fun res!753577 () Bool)

(assert (=> b!1127631 (=> (not res!753577) (not e!641787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73502 (_ BitVec 32)) Bool)

(assert (=> b!1127631 (= res!753577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500505 mask!1564))))

(assert (=> b!1127631 (= lt!500505 (array!73503 (store (arr!35404 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35942 _keys!1208)))))

(declare-fun b!1127632 () Bool)

(declare-datatypes ((tuple2!18004 0))(
  ( (tuple2!18005 (_1!9013 (_ BitVec 64)) (_2!9013 V!42937)) )
))
(declare-datatypes ((List!24760 0))(
  ( (Nil!24757) (Cons!24756 (h!25965 tuple2!18004) (t!35570 List!24760)) )
))
(declare-datatypes ((ListLongMap!15973 0))(
  ( (ListLongMap!15974 (toList!8002 List!24760)) )
))
(declare-fun call!47741 () ListLongMap!15973)

(declare-fun call!47740 () ListLongMap!15973)

(assert (=> b!1127632 (= e!641792 (= call!47741 call!47740))))

(declare-fun b!1127633 () Bool)

(declare-fun res!753578 () Bool)

(assert (=> b!1127633 (=> (not res!753578) (not e!641793))))

(assert (=> b!1127633 (= res!753578 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35942 _keys!1208))))))

(declare-fun b!1127634 () Bool)

(declare-fun e!641788 () Bool)

(assert (=> b!1127634 (= e!641787 (not e!641788))))

(declare-fun res!753572 () Bool)

(assert (=> b!1127634 (=> res!753572 e!641788)))

(assert (=> b!1127634 (= res!753572 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127634 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500510 () Unit!36801)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73502 (_ BitVec 64) (_ BitVec 32)) Unit!36801)

(assert (=> b!1127634 (= lt!500510 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127635 () Bool)

(assert (=> b!1127635 (= e!641788 e!641791)))

(declare-fun res!753580 () Bool)

(assert (=> b!1127635 (=> res!753580 e!641791)))

(assert (=> b!1127635 (= res!753580 (not (= from!1455 i!673)))))

(declare-fun lt!500508 () array!73500)

(declare-fun lt!500507 () ListLongMap!15973)

(declare-fun getCurrentListMapNoExtraKeys!4502 (array!73502 array!73500 (_ BitVec 32) (_ BitVec 32) V!42937 V!42937 (_ BitVec 32) Int) ListLongMap!15973)

(assert (=> b!1127635 (= lt!500507 (getCurrentListMapNoExtraKeys!4502 lt!500505 lt!500508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2514 (Int (_ BitVec 64)) V!42937)

(assert (=> b!1127635 (= lt!500508 (array!73501 (store (arr!35403 _values!996) i!673 (ValueCellFull!13469 (dynLambda!2514 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35941 _values!996)))))

(declare-fun lt!500506 () ListLongMap!15973)

(assert (=> b!1127635 (= lt!500506 (getCurrentListMapNoExtraKeys!4502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1127636 () Bool)

(assert (=> b!1127636 (= e!641790 true)))

(declare-fun lt!500511 () Bool)

(declare-fun contains!6459 (ListLongMap!15973 (_ BitVec 64)) Bool)

(assert (=> b!1127636 (= lt!500511 (contains!6459 (getCurrentListMapNoExtraKeys!4502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127637 () Bool)

(declare-fun res!753574 () Bool)

(assert (=> b!1127637 (=> (not res!753574) (not e!641793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127637 (= res!753574 (validMask!0 mask!1564))))

(declare-fun bm!47737 () Bool)

(assert (=> bm!47737 (= call!47740 (getCurrentListMapNoExtraKeys!4502 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!753573 () Bool)

(assert (=> start!98120 (=> (not res!753573) (not e!641793))))

(assert (=> start!98120 (= res!753573 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35942 _keys!1208))))))

(assert (=> start!98120 e!641793))

(assert (=> start!98120 tp_is_empty!28357))

(declare-fun array_inv!27248 (array!73502) Bool)

(assert (=> start!98120 (array_inv!27248 _keys!1208)))

(assert (=> start!98120 true))

(assert (=> start!98120 tp!84185))

(declare-fun array_inv!27249 (array!73500) Bool)

(assert (=> start!98120 (and (array_inv!27249 _values!996) e!641795)))

(declare-fun b!1127638 () Bool)

(declare-fun e!641789 () Bool)

(assert (=> b!1127638 (= e!641789 tp_is_empty!28357)))

(declare-fun b!1127639 () Bool)

(declare-fun res!753575 () Bool)

(assert (=> b!1127639 (=> (not res!753575) (not e!641793))))

(assert (=> b!1127639 (= res!753575 (= (select (arr!35404 _keys!1208) i!673) k0!934))))

(declare-fun bm!47738 () Bool)

(assert (=> bm!47738 (= call!47741 (getCurrentListMapNoExtraKeys!4502 lt!500505 lt!500508 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!44353 () Bool)

(declare-fun tp!84184 () Bool)

(assert (=> mapNonEmpty!44353 (= mapRes!44353 (and tp!84184 e!641789))))

(declare-fun mapRest!44353 () (Array (_ BitVec 32) ValueCell!13469))

(declare-fun mapKey!44353 () (_ BitVec 32))

(declare-fun mapValue!44353 () ValueCell!13469)

(assert (=> mapNonEmpty!44353 (= (arr!35403 _values!996) (store mapRest!44353 mapKey!44353 mapValue!44353))))

(declare-fun b!1127640 () Bool)

(declare-fun -!1125 (ListLongMap!15973 (_ BitVec 64)) ListLongMap!15973)

(assert (=> b!1127640 (= e!641792 (= call!47741 (-!1125 call!47740 k0!934)))))

(declare-fun b!1127641 () Bool)

(declare-fun res!753576 () Bool)

(assert (=> b!1127641 (=> (not res!753576) (not e!641793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127641 (= res!753576 (validKeyInArray!0 k0!934))))

(declare-fun b!1127642 () Bool)

(declare-fun res!753579 () Bool)

(assert (=> b!1127642 (=> (not res!753579) (not e!641793))))

(assert (=> b!1127642 (= res!753579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127643 () Bool)

(declare-fun res!753570 () Bool)

(assert (=> b!1127643 (=> (not res!753570) (not e!641793))))

(assert (=> b!1127643 (= res!753570 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24756))))

(assert (= (and start!98120 res!753573) b!1127637))

(assert (= (and b!1127637 res!753574) b!1127628))

(assert (= (and b!1127628 res!753571) b!1127642))

(assert (= (and b!1127642 res!753579) b!1127643))

(assert (= (and b!1127643 res!753570) b!1127633))

(assert (= (and b!1127633 res!753578) b!1127641))

(assert (= (and b!1127641 res!753576) b!1127639))

(assert (= (and b!1127639 res!753575) b!1127631))

(assert (= (and b!1127631 res!753577) b!1127630))

(assert (= (and b!1127630 res!753569) b!1127634))

(assert (= (and b!1127634 (not res!753572)) b!1127635))

(assert (= (and b!1127635 (not res!753580)) b!1127629))

(assert (= (and b!1127629 c!109704) b!1127640))

(assert (= (and b!1127629 (not c!109704)) b!1127632))

(assert (= (or b!1127640 b!1127632) bm!47738))

(assert (= (or b!1127640 b!1127632) bm!47737))

(assert (= (and b!1127629 (not res!753568)) b!1127636))

(assert (= (and b!1127627 condMapEmpty!44353) mapIsEmpty!44353))

(assert (= (and b!1127627 (not condMapEmpty!44353)) mapNonEmpty!44353))

(get-info :version)

(assert (= (and mapNonEmpty!44353 ((_ is ValueCellFull!13469) mapValue!44353)) b!1127638))

(assert (= (and b!1127627 ((_ is ValueCellFull!13469) mapDefault!44353)) b!1127626))

(assert (= start!98120 b!1127627))

(declare-fun b_lambda!18779 () Bool)

(assert (=> (not b_lambda!18779) (not b!1127635)))

(declare-fun t!35568 () Bool)

(declare-fun tb!8631 () Bool)

(assert (=> (and start!98120 (= defaultEntry!1004 defaultEntry!1004) t!35568) tb!8631))

(declare-fun result!17831 () Bool)

(assert (=> tb!8631 (= result!17831 tp_is_empty!28357)))

(assert (=> b!1127635 t!35568))

(declare-fun b_and!38417 () Bool)

(assert (= b_and!38415 (and (=> t!35568 result!17831) b_and!38417)))

(declare-fun m!1040847 () Bool)

(assert (=> b!1127639 m!1040847))

(declare-fun m!1040849 () Bool)

(assert (=> b!1127640 m!1040849))

(declare-fun m!1040851 () Bool)

(assert (=> b!1127643 m!1040851))

(declare-fun m!1040853 () Bool)

(assert (=> start!98120 m!1040853))

(declare-fun m!1040855 () Bool)

(assert (=> start!98120 m!1040855))

(declare-fun m!1040857 () Bool)

(assert (=> b!1127636 m!1040857))

(assert (=> b!1127636 m!1040857))

(declare-fun m!1040859 () Bool)

(assert (=> b!1127636 m!1040859))

(declare-fun m!1040861 () Bool)

(assert (=> b!1127637 m!1040861))

(declare-fun m!1040863 () Bool)

(assert (=> bm!47738 m!1040863))

(declare-fun m!1040865 () Bool)

(assert (=> b!1127631 m!1040865))

(declare-fun m!1040867 () Bool)

(assert (=> b!1127631 m!1040867))

(declare-fun m!1040869 () Bool)

(assert (=> b!1127634 m!1040869))

(declare-fun m!1040871 () Bool)

(assert (=> b!1127634 m!1040871))

(declare-fun m!1040873 () Bool)

(assert (=> b!1127629 m!1040873))

(declare-fun m!1040875 () Bool)

(assert (=> b!1127629 m!1040875))

(declare-fun m!1040877 () Bool)

(assert (=> mapNonEmpty!44353 m!1040877))

(declare-fun m!1040879 () Bool)

(assert (=> b!1127630 m!1040879))

(declare-fun m!1040881 () Bool)

(assert (=> b!1127635 m!1040881))

(declare-fun m!1040883 () Bool)

(assert (=> b!1127635 m!1040883))

(declare-fun m!1040885 () Bool)

(assert (=> b!1127635 m!1040885))

(declare-fun m!1040887 () Bool)

(assert (=> b!1127635 m!1040887))

(declare-fun m!1040889 () Bool)

(assert (=> b!1127642 m!1040889))

(assert (=> bm!47737 m!1040857))

(declare-fun m!1040891 () Bool)

(assert (=> b!1127641 m!1040891))

(check-sat (not mapNonEmpty!44353) (not bm!47738) (not b!1127637) (not b_lambda!18779) b_and!38417 (not b!1127636) (not bm!47737) (not b!1127641) (not b!1127631) (not b!1127635) tp_is_empty!28357 (not b!1127634) (not b!1127643) (not b!1127629) (not b!1127630) (not b_next!23827) (not b!1127640) (not start!98120) (not b!1127642))
(check-sat b_and!38417 (not b_next!23827))
