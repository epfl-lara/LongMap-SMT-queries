; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97364 () Bool)

(assert start!97364)

(declare-fun b_free!23341 () Bool)

(declare-fun b_next!23341 () Bool)

(assert (=> start!97364 (= b_free!23341 (not b_next!23341))))

(declare-fun tp!82322 () Bool)

(declare-fun b_and!37495 () Bool)

(assert (=> start!97364 (= tp!82322 b_and!37495)))

(declare-fun b!1109790 () Bool)

(declare-fun res!740628 () Bool)

(declare-fun e!632960 () Bool)

(assert (=> b!1109790 (=> (not res!740628) (not e!632960))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72012 0))(
  ( (array!72013 (arr!34659 (Array (_ BitVec 32) (_ BitVec 64))) (size!35197 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72012)

(assert (=> b!1109790 (= res!740628 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35197 _keys!1208))))))

(declare-fun mapNonEmpty!43219 () Bool)

(declare-fun mapRes!43219 () Bool)

(declare-fun tp!82321 () Bool)

(declare-fun e!632959 () Bool)

(assert (=> mapNonEmpty!43219 (= mapRes!43219 (and tp!82321 e!632959))))

(declare-fun mapKey!43219 () (_ BitVec 32))

(declare-datatypes ((V!41929 0))(
  ( (V!41930 (val!13857 Int)) )
))
(declare-datatypes ((ValueCell!13091 0))(
  ( (ValueCellFull!13091 (v!16489 V!41929)) (EmptyCell!13091) )
))
(declare-fun mapRest!43219 () (Array (_ BitVec 32) ValueCell!13091))

(declare-datatypes ((array!72014 0))(
  ( (array!72015 (arr!34660 (Array (_ BitVec 32) ValueCell!13091)) (size!35198 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72014)

(declare-fun mapValue!43219 () ValueCell!13091)

(assert (=> mapNonEmpty!43219 (= (arr!34660 _values!996) (store mapRest!43219 mapKey!43219 mapValue!43219))))

(declare-fun b!1109791 () Bool)

(declare-fun res!740625 () Bool)

(assert (=> b!1109791 (=> (not res!740625) (not e!632960))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1109791 (= res!740625 (= (select (arr!34659 _keys!1208) i!673) k0!934))))

(declare-fun b!1109792 () Bool)

(declare-fun e!632964 () Bool)

(declare-datatypes ((tuple2!17578 0))(
  ( (tuple2!17579 (_1!8800 (_ BitVec 64)) (_2!8800 V!41929)) )
))
(declare-datatypes ((List!24234 0))(
  ( (Nil!24231) (Cons!24230 (h!25439 tuple2!17578) (t!34612 List!24234)) )
))
(declare-datatypes ((ListLongMap!15547 0))(
  ( (ListLongMap!15548 (toList!7789 List!24234)) )
))
(declare-fun call!46697 () ListLongMap!15547)

(declare-fun call!46696 () ListLongMap!15547)

(assert (=> b!1109792 (= e!632964 (= call!46697 call!46696))))

(declare-fun b!1109793 () Bool)

(declare-fun -!1005 (ListLongMap!15547 (_ BitVec 64)) ListLongMap!15547)

(assert (=> b!1109793 (= e!632964 (= call!46697 (-!1005 call!46696 k0!934)))))

(declare-fun res!740631 () Bool)

(assert (=> start!97364 (=> (not res!740631) (not e!632960))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97364 (= res!740631 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35197 _keys!1208))))))

(assert (=> start!97364 e!632960))

(declare-fun tp_is_empty!27601 () Bool)

(assert (=> start!97364 tp_is_empty!27601))

(declare-fun array_inv!26718 (array!72012) Bool)

(assert (=> start!97364 (array_inv!26718 _keys!1208)))

(assert (=> start!97364 true))

(assert (=> start!97364 tp!82322))

(declare-fun e!632961 () Bool)

(declare-fun array_inv!26719 (array!72014) Bool)

(assert (=> start!97364 (and (array_inv!26719 _values!996) e!632961)))

(declare-fun b!1109794 () Bool)

(declare-fun e!632963 () Bool)

(assert (=> b!1109794 (= e!632963 tp_is_empty!27601)))

(declare-fun b!1109795 () Bool)

(declare-fun e!632958 () Bool)

(declare-fun e!632957 () Bool)

(assert (=> b!1109795 (= e!632958 (not e!632957))))

(declare-fun res!740622 () Bool)

(assert (=> b!1109795 (=> res!740622 e!632957)))

(assert (=> b!1109795 (= res!740622 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35197 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72012 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109795 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36231 0))(
  ( (Unit!36232) )
))
(declare-fun lt!495873 () Unit!36231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72012 (_ BitVec 64) (_ BitVec 32)) Unit!36231)

(assert (=> b!1109795 (= lt!495873 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun zeroValue!944 () V!41929)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun bm!46693 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!495872 () array!72012)

(declare-fun minValue!944 () V!41929)

(declare-fun getCurrentListMapNoExtraKeys!4304 (array!72012 array!72014 (_ BitVec 32) (_ BitVec 32) V!41929 V!41929 (_ BitVec 32) Int) ListLongMap!15547)

(declare-fun dynLambda!2370 (Int (_ BitVec 64)) V!41929)

(assert (=> bm!46693 (= call!46697 (getCurrentListMapNoExtraKeys!4304 lt!495872 (array!72015 (store (arr!34660 _values!996) i!673 (ValueCellFull!13091 (dynLambda!2370 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35198 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109796 () Bool)

(assert (=> b!1109796 (= e!632959 tp_is_empty!27601)))

(declare-fun b!1109797 () Bool)

(declare-fun res!740629 () Bool)

(assert (=> b!1109797 (=> (not res!740629) (not e!632960))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109797 (= res!740629 (validMask!0 mask!1564))))

(declare-fun bm!46694 () Bool)

(assert (=> bm!46694 (= call!46696 (getCurrentListMapNoExtraKeys!4304 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109798 () Bool)

(assert (=> b!1109798 (= e!632957 true)))

(assert (=> b!1109798 e!632964))

(declare-fun c!109176 () Bool)

(assert (=> b!1109798 (= c!109176 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495871 () Unit!36231)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!277 (array!72012 array!72014 (_ BitVec 32) (_ BitVec 32) V!41929 V!41929 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36231)

(assert (=> b!1109798 (= lt!495871 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!277 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109799 () Bool)

(declare-fun res!740632 () Bool)

(assert (=> b!1109799 (=> (not res!740632) (not e!632960))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109799 (= res!740632 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!43219 () Bool)

(assert (=> mapIsEmpty!43219 mapRes!43219))

(declare-fun b!1109800 () Bool)

(declare-fun res!740623 () Bool)

(assert (=> b!1109800 (=> (not res!740623) (not e!632960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72012 (_ BitVec 32)) Bool)

(assert (=> b!1109800 (= res!740623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109801 () Bool)

(declare-fun res!740626 () Bool)

(assert (=> b!1109801 (=> (not res!740626) (not e!632960))))

(assert (=> b!1109801 (= res!740626 (and (= (size!35198 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35197 _keys!1208) (size!35198 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109802 () Bool)

(declare-fun res!740624 () Bool)

(assert (=> b!1109802 (=> (not res!740624) (not e!632958))))

(declare-datatypes ((List!24235 0))(
  ( (Nil!24232) (Cons!24231 (h!25440 (_ BitVec 64)) (t!34613 List!24235)) )
))
(declare-fun arrayNoDuplicates!0 (array!72012 (_ BitVec 32) List!24235) Bool)

(assert (=> b!1109802 (= res!740624 (arrayNoDuplicates!0 lt!495872 #b00000000000000000000000000000000 Nil!24232))))

(declare-fun b!1109803 () Bool)

(assert (=> b!1109803 (= e!632961 (and e!632963 mapRes!43219))))

(declare-fun condMapEmpty!43219 () Bool)

(declare-fun mapDefault!43219 () ValueCell!13091)

(assert (=> b!1109803 (= condMapEmpty!43219 (= (arr!34660 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13091)) mapDefault!43219)))))

(declare-fun b!1109804 () Bool)

(assert (=> b!1109804 (= e!632960 e!632958)))

(declare-fun res!740627 () Bool)

(assert (=> b!1109804 (=> (not res!740627) (not e!632958))))

(assert (=> b!1109804 (= res!740627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495872 mask!1564))))

(assert (=> b!1109804 (= lt!495872 (array!72013 (store (arr!34659 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35197 _keys!1208)))))

(declare-fun b!1109805 () Bool)

(declare-fun res!740630 () Bool)

(assert (=> b!1109805 (=> (not res!740630) (not e!632960))))

(assert (=> b!1109805 (= res!740630 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24232))))

(assert (= (and start!97364 res!740631) b!1109797))

(assert (= (and b!1109797 res!740629) b!1109801))

(assert (= (and b!1109801 res!740626) b!1109800))

(assert (= (and b!1109800 res!740623) b!1109805))

(assert (= (and b!1109805 res!740630) b!1109790))

(assert (= (and b!1109790 res!740628) b!1109799))

(assert (= (and b!1109799 res!740632) b!1109791))

(assert (= (and b!1109791 res!740625) b!1109804))

(assert (= (and b!1109804 res!740627) b!1109802))

(assert (= (and b!1109802 res!740624) b!1109795))

(assert (= (and b!1109795 (not res!740622)) b!1109798))

(assert (= (and b!1109798 c!109176) b!1109793))

(assert (= (and b!1109798 (not c!109176)) b!1109792))

(assert (= (or b!1109793 b!1109792) bm!46693))

(assert (= (or b!1109793 b!1109792) bm!46694))

(assert (= (and b!1109803 condMapEmpty!43219) mapIsEmpty!43219))

(assert (= (and b!1109803 (not condMapEmpty!43219)) mapNonEmpty!43219))

(get-info :version)

(assert (= (and mapNonEmpty!43219 ((_ is ValueCellFull!13091) mapValue!43219)) b!1109796))

(assert (= (and b!1109803 ((_ is ValueCellFull!13091) mapDefault!43219)) b!1109794))

(assert (= start!97364 b!1109803))

(declare-fun b_lambda!18345 () Bool)

(assert (=> (not b_lambda!18345) (not bm!46693)))

(declare-fun t!34611 () Bool)

(declare-fun tb!8199 () Bool)

(assert (=> (and start!97364 (= defaultEntry!1004 defaultEntry!1004) t!34611) tb!8199))

(declare-fun result!16967 () Bool)

(assert (=> tb!8199 (= result!16967 tp_is_empty!27601)))

(assert (=> bm!46693 t!34611))

(declare-fun b_and!37497 () Bool)

(assert (= b_and!37495 (and (=> t!34611 result!16967) b_and!37497)))

(declare-fun m!1027455 () Bool)

(assert (=> b!1109805 m!1027455))

(declare-fun m!1027457 () Bool)

(assert (=> b!1109799 m!1027457))

(declare-fun m!1027459 () Bool)

(assert (=> start!97364 m!1027459))

(declare-fun m!1027461 () Bool)

(assert (=> start!97364 m!1027461))

(declare-fun m!1027463 () Bool)

(assert (=> b!1109798 m!1027463))

(declare-fun m!1027465 () Bool)

(assert (=> b!1109797 m!1027465))

(declare-fun m!1027467 () Bool)

(assert (=> mapNonEmpty!43219 m!1027467))

(declare-fun m!1027469 () Bool)

(assert (=> bm!46694 m!1027469))

(declare-fun m!1027471 () Bool)

(assert (=> b!1109804 m!1027471))

(declare-fun m!1027473 () Bool)

(assert (=> b!1109804 m!1027473))

(declare-fun m!1027475 () Bool)

(assert (=> bm!46693 m!1027475))

(declare-fun m!1027477 () Bool)

(assert (=> bm!46693 m!1027477))

(declare-fun m!1027479 () Bool)

(assert (=> bm!46693 m!1027479))

(declare-fun m!1027481 () Bool)

(assert (=> b!1109793 m!1027481))

(declare-fun m!1027483 () Bool)

(assert (=> b!1109800 m!1027483))

(declare-fun m!1027485 () Bool)

(assert (=> b!1109791 m!1027485))

(declare-fun m!1027487 () Bool)

(assert (=> b!1109795 m!1027487))

(declare-fun m!1027489 () Bool)

(assert (=> b!1109795 m!1027489))

(declare-fun m!1027491 () Bool)

(assert (=> b!1109802 m!1027491))

(check-sat (not start!97364) (not b!1109804) b_and!37497 (not b!1109800) (not b!1109798) (not b!1109802) (not mapNonEmpty!43219) tp_is_empty!27601 (not b!1109805) (not b!1109797) (not bm!46693) (not bm!46694) (not b_next!23341) (not b!1109795) (not b_lambda!18345) (not b!1109799) (not b!1109793))
(check-sat b_and!37497 (not b_next!23341))
