; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97348 () Bool)

(assert start!97348)

(declare-fun b_free!23319 () Bool)

(declare-fun b_next!23319 () Bool)

(assert (=> start!97348 (= b_free!23319 (not b_next!23319))))

(declare-fun tp!82256 () Bool)

(declare-fun b_and!37473 () Bool)

(assert (=> start!97348 (= tp!82256 b_and!37473)))

(declare-fun b!1109369 () Bool)

(declare-fun e!632778 () Bool)

(declare-fun e!632777 () Bool)

(assert (=> b!1109369 (= e!632778 (not e!632777))))

(declare-fun res!740335 () Bool)

(assert (=> b!1109369 (=> res!740335 e!632777)))

(declare-datatypes ((array!72075 0))(
  ( (array!72076 (arr!34690 (Array (_ BitVec 32) (_ BitVec 64))) (size!35226 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72075)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1109369 (= res!740335 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35226 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109369 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36410 0))(
  ( (Unit!36411) )
))
(declare-fun lt!495972 () Unit!36410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72075 (_ BitVec 64) (_ BitVec 32)) Unit!36410)

(assert (=> b!1109369 (= lt!495972 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109370 () Bool)

(declare-fun e!632776 () Bool)

(declare-datatypes ((V!41899 0))(
  ( (V!41900 (val!13846 Int)) )
))
(declare-datatypes ((tuple2!17504 0))(
  ( (tuple2!17505 (_1!8763 (_ BitVec 64)) (_2!8763 V!41899)) )
))
(declare-datatypes ((List!24186 0))(
  ( (Nil!24183) (Cons!24182 (h!25391 tuple2!17504) (t!34551 List!24186)) )
))
(declare-datatypes ((ListLongMap!15473 0))(
  ( (ListLongMap!15474 (toList!7752 List!24186)) )
))
(declare-fun call!46653 () ListLongMap!15473)

(declare-fun call!46654 () ListLongMap!15473)

(declare-fun -!1028 (ListLongMap!15473 (_ BitVec 64)) ListLongMap!15473)

(assert (=> b!1109370 (= e!632776 (= call!46654 (-!1028 call!46653 k0!934)))))

(declare-fun b!1109371 () Bool)

(assert (=> b!1109371 (= e!632776 (= call!46654 call!46653))))

(declare-fun b!1109372 () Bool)

(declare-fun e!632774 () Bool)

(declare-fun tp_is_empty!27579 () Bool)

(assert (=> b!1109372 (= e!632774 tp_is_empty!27579)))

(declare-fun b!1109373 () Bool)

(declare-fun res!740336 () Bool)

(declare-fun e!632779 () Bool)

(assert (=> b!1109373 (=> (not res!740336) (not e!632779))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109373 (= res!740336 (validMask!0 mask!1564))))

(declare-fun b!1109374 () Bool)

(declare-fun res!740338 () Bool)

(assert (=> b!1109374 (=> (not res!740338) (not e!632779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109374 (= res!740338 (validKeyInArray!0 k0!934))))

(declare-fun b!1109375 () Bool)

(declare-fun res!740331 () Bool)

(assert (=> b!1109375 (=> (not res!740331) (not e!632779))))

(declare-datatypes ((List!24187 0))(
  ( (Nil!24184) (Cons!24183 (h!25392 (_ BitVec 64)) (t!34552 List!24187)) )
))
(declare-fun arrayNoDuplicates!0 (array!72075 (_ BitVec 32) List!24187) Bool)

(assert (=> b!1109375 (= res!740331 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24184))))

(declare-fun zeroValue!944 () V!41899)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!46650 () Bool)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!495974 () array!72075)

(declare-datatypes ((ValueCell!13080 0))(
  ( (ValueCellFull!13080 (v!16479 V!41899)) (EmptyCell!13080) )
))
(declare-datatypes ((array!72077 0))(
  ( (array!72078 (arr!34691 (Array (_ BitVec 32) ValueCell!13080)) (size!35227 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72077)

(declare-fun minValue!944 () V!41899)

(declare-fun getCurrentListMapNoExtraKeys!4246 (array!72075 array!72077 (_ BitVec 32) (_ BitVec 32) V!41899 V!41899 (_ BitVec 32) Int) ListLongMap!15473)

(declare-fun dynLambda!2376 (Int (_ BitVec 64)) V!41899)

(assert (=> bm!46650 (= call!46654 (getCurrentListMapNoExtraKeys!4246 lt!495974 (array!72078 (store (arr!34691 _values!996) i!673 (ValueCellFull!13080 (dynLambda!2376 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35227 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109376 () Bool)

(assert (=> b!1109376 (= e!632777 true)))

(assert (=> b!1109376 e!632776))

(declare-fun c!109170 () Bool)

(assert (=> b!1109376 (= c!109170 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495973 () Unit!36410)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!274 (array!72075 array!72077 (_ BitVec 32) (_ BitVec 32) V!41899 V!41899 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36410)

(assert (=> b!1109376 (= lt!495973 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!274 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46651 () Bool)

(assert (=> bm!46651 (= call!46653 (getCurrentListMapNoExtraKeys!4246 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109377 () Bool)

(declare-fun res!740330 () Bool)

(assert (=> b!1109377 (=> (not res!740330) (not e!632779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72075 (_ BitVec 32)) Bool)

(assert (=> b!1109377 (= res!740330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43186 () Bool)

(declare-fun mapRes!43186 () Bool)

(declare-fun tp!82255 () Bool)

(assert (=> mapNonEmpty!43186 (= mapRes!43186 (and tp!82255 e!632774))))

(declare-fun mapValue!43186 () ValueCell!13080)

(declare-fun mapRest!43186 () (Array (_ BitVec 32) ValueCell!13080))

(declare-fun mapKey!43186 () (_ BitVec 32))

(assert (=> mapNonEmpty!43186 (= (arr!34691 _values!996) (store mapRest!43186 mapKey!43186 mapValue!43186))))

(declare-fun res!740332 () Bool)

(assert (=> start!97348 (=> (not res!740332) (not e!632779))))

(assert (=> start!97348 (= res!740332 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35226 _keys!1208))))))

(assert (=> start!97348 e!632779))

(assert (=> start!97348 tp_is_empty!27579))

(declare-fun array_inv!26696 (array!72075) Bool)

(assert (=> start!97348 (array_inv!26696 _keys!1208)))

(assert (=> start!97348 true))

(assert (=> start!97348 tp!82256))

(declare-fun e!632775 () Bool)

(declare-fun array_inv!26697 (array!72077) Bool)

(assert (=> start!97348 (and (array_inv!26697 _values!996) e!632775)))

(declare-fun b!1109378 () Bool)

(declare-fun res!740334 () Bool)

(assert (=> b!1109378 (=> (not res!740334) (not e!632779))))

(assert (=> b!1109378 (= res!740334 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35226 _keys!1208))))))

(declare-fun b!1109379 () Bool)

(declare-fun res!740329 () Bool)

(assert (=> b!1109379 (=> (not res!740329) (not e!632779))))

(assert (=> b!1109379 (= res!740329 (and (= (size!35227 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35226 _keys!1208) (size!35227 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109380 () Bool)

(declare-fun res!740333 () Bool)

(assert (=> b!1109380 (=> (not res!740333) (not e!632778))))

(assert (=> b!1109380 (= res!740333 (arrayNoDuplicates!0 lt!495974 #b00000000000000000000000000000000 Nil!24184))))

(declare-fun b!1109381 () Bool)

(assert (=> b!1109381 (= e!632779 e!632778)))

(declare-fun res!740328 () Bool)

(assert (=> b!1109381 (=> (not res!740328) (not e!632778))))

(assert (=> b!1109381 (= res!740328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495974 mask!1564))))

(assert (=> b!1109381 (= lt!495974 (array!72076 (store (arr!34690 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35226 _keys!1208)))))

(declare-fun b!1109382 () Bool)

(declare-fun e!632780 () Bool)

(assert (=> b!1109382 (= e!632775 (and e!632780 mapRes!43186))))

(declare-fun condMapEmpty!43186 () Bool)

(declare-fun mapDefault!43186 () ValueCell!13080)

(assert (=> b!1109382 (= condMapEmpty!43186 (= (arr!34691 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13080)) mapDefault!43186)))))

(declare-fun mapIsEmpty!43186 () Bool)

(assert (=> mapIsEmpty!43186 mapRes!43186))

(declare-fun b!1109383 () Bool)

(declare-fun res!740337 () Bool)

(assert (=> b!1109383 (=> (not res!740337) (not e!632779))))

(assert (=> b!1109383 (= res!740337 (= (select (arr!34690 _keys!1208) i!673) k0!934))))

(declare-fun b!1109384 () Bool)

(assert (=> b!1109384 (= e!632780 tp_is_empty!27579)))

(assert (= (and start!97348 res!740332) b!1109373))

(assert (= (and b!1109373 res!740336) b!1109379))

(assert (= (and b!1109379 res!740329) b!1109377))

(assert (= (and b!1109377 res!740330) b!1109375))

(assert (= (and b!1109375 res!740331) b!1109378))

(assert (= (and b!1109378 res!740334) b!1109374))

(assert (= (and b!1109374 res!740338) b!1109383))

(assert (= (and b!1109383 res!740337) b!1109381))

(assert (= (and b!1109381 res!740328) b!1109380))

(assert (= (and b!1109380 res!740333) b!1109369))

(assert (= (and b!1109369 (not res!740335)) b!1109376))

(assert (= (and b!1109376 c!109170) b!1109370))

(assert (= (and b!1109376 (not c!109170)) b!1109371))

(assert (= (or b!1109370 b!1109371) bm!46650))

(assert (= (or b!1109370 b!1109371) bm!46651))

(assert (= (and b!1109382 condMapEmpty!43186) mapIsEmpty!43186))

(assert (= (and b!1109382 (not condMapEmpty!43186)) mapNonEmpty!43186))

(get-info :version)

(assert (= (and mapNonEmpty!43186 ((_ is ValueCellFull!13080) mapValue!43186)) b!1109372))

(assert (= (and b!1109382 ((_ is ValueCellFull!13080) mapDefault!43186)) b!1109384))

(assert (= start!97348 b!1109382))

(declare-fun b_lambda!18341 () Bool)

(assert (=> (not b_lambda!18341) (not bm!46650)))

(declare-fun t!34550 () Bool)

(declare-fun tb!8185 () Bool)

(assert (=> (and start!97348 (= defaultEntry!1004 defaultEntry!1004) t!34550) tb!8185))

(declare-fun result!16931 () Bool)

(assert (=> tb!8185 (= result!16931 tp_is_empty!27579)))

(assert (=> bm!46650 t!34550))

(declare-fun b_and!37475 () Bool)

(assert (= b_and!37473 (and (=> t!34550 result!16931) b_and!37475)))

(declare-fun m!1027663 () Bool)

(assert (=> b!1109369 m!1027663))

(declare-fun m!1027665 () Bool)

(assert (=> b!1109369 m!1027665))

(declare-fun m!1027667 () Bool)

(assert (=> b!1109375 m!1027667))

(declare-fun m!1027669 () Bool)

(assert (=> b!1109380 m!1027669))

(declare-fun m!1027671 () Bool)

(assert (=> b!1109370 m!1027671))

(declare-fun m!1027673 () Bool)

(assert (=> b!1109374 m!1027673))

(declare-fun m!1027675 () Bool)

(assert (=> b!1109381 m!1027675))

(declare-fun m!1027677 () Bool)

(assert (=> b!1109381 m!1027677))

(declare-fun m!1027679 () Bool)

(assert (=> start!97348 m!1027679))

(declare-fun m!1027681 () Bool)

(assert (=> start!97348 m!1027681))

(declare-fun m!1027683 () Bool)

(assert (=> mapNonEmpty!43186 m!1027683))

(declare-fun m!1027685 () Bool)

(assert (=> b!1109377 m!1027685))

(declare-fun m!1027687 () Bool)

(assert (=> b!1109383 m!1027687))

(declare-fun m!1027689 () Bool)

(assert (=> b!1109373 m!1027689))

(declare-fun m!1027691 () Bool)

(assert (=> b!1109376 m!1027691))

(declare-fun m!1027693 () Bool)

(assert (=> bm!46651 m!1027693))

(declare-fun m!1027695 () Bool)

(assert (=> bm!46650 m!1027695))

(declare-fun m!1027697 () Bool)

(assert (=> bm!46650 m!1027697))

(declare-fun m!1027699 () Bool)

(assert (=> bm!46650 m!1027699))

(check-sat (not b!1109369) (not start!97348) b_and!37475 (not b_next!23319) (not b!1109377) tp_is_empty!27579 (not b!1109374) (not b!1109376) (not b_lambda!18341) (not bm!46650) (not b!1109373) (not mapNonEmpty!43186) (not b!1109375) (not bm!46651) (not b!1109370) (not b!1109380) (not b!1109381))
(check-sat b_and!37475 (not b_next!23319))
