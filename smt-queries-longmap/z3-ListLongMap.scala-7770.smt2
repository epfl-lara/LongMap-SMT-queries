; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97358 () Bool)

(assert start!97358)

(declare-fun b_free!23335 () Bool)

(declare-fun b_next!23335 () Bool)

(assert (=> start!97358 (= b_free!23335 (not b_next!23335))))

(declare-fun tp!82303 () Bool)

(declare-fun b_and!37483 () Bool)

(assert (=> start!97358 (= tp!82303 b_and!37483)))

(declare-fun b!1109640 () Bool)

(declare-fun res!740524 () Bool)

(declare-fun e!632888 () Bool)

(assert (=> b!1109640 (=> (not res!740524) (not e!632888))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72002 0))(
  ( (array!72003 (arr!34654 (Array (_ BitVec 32) (_ BitVec 64))) (size!35192 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72002)

(assert (=> b!1109640 (= res!740524 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35192 _keys!1208))))))

(declare-fun b!1109641 () Bool)

(declare-fun e!632892 () Bool)

(declare-fun e!632887 () Bool)

(declare-fun mapRes!43210 () Bool)

(assert (=> b!1109641 (= e!632892 (and e!632887 mapRes!43210))))

(declare-fun condMapEmpty!43210 () Bool)

(declare-datatypes ((V!41921 0))(
  ( (V!41922 (val!13854 Int)) )
))
(declare-datatypes ((ValueCell!13088 0))(
  ( (ValueCellFull!13088 (v!16486 V!41921)) (EmptyCell!13088) )
))
(declare-datatypes ((array!72004 0))(
  ( (array!72005 (arr!34655 (Array (_ BitVec 32) ValueCell!13088)) (size!35193 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72004)

(declare-fun mapDefault!43210 () ValueCell!13088)

(assert (=> b!1109641 (= condMapEmpty!43210 (= (arr!34655 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13088)) mapDefault!43210)))))

(declare-fun b!1109642 () Bool)

(declare-fun tp_is_empty!27595 () Bool)

(assert (=> b!1109642 (= e!632887 tp_is_empty!27595)))

(declare-fun b!1109643 () Bool)

(declare-fun e!632889 () Bool)

(assert (=> b!1109643 (= e!632888 e!632889)))

(declare-fun res!740533 () Bool)

(assert (=> b!1109643 (=> (not res!740533) (not e!632889))))

(declare-fun lt!495844 () array!72002)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72002 (_ BitVec 32)) Bool)

(assert (=> b!1109643 (= res!740533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495844 mask!1564))))

(assert (=> b!1109643 (= lt!495844 (array!72003 (store (arr!34654 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35192 _keys!1208)))))

(declare-fun e!632891 () Bool)

(declare-datatypes ((tuple2!17574 0))(
  ( (tuple2!17575 (_1!8798 (_ BitVec 64)) (_2!8798 V!41921)) )
))
(declare-datatypes ((List!24230 0))(
  ( (Nil!24227) (Cons!24226 (h!25435 tuple2!17574) (t!34602 List!24230)) )
))
(declare-datatypes ((ListLongMap!15543 0))(
  ( (ListLongMap!15544 (toList!7787 List!24230)) )
))
(declare-fun call!46679 () ListLongMap!15543)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1109644 () Bool)

(declare-fun call!46678 () ListLongMap!15543)

(declare-fun -!1003 (ListLongMap!15543 (_ BitVec 64)) ListLongMap!15543)

(assert (=> b!1109644 (= e!632891 (= call!46679 (-!1003 call!46678 k0!934)))))

(declare-fun b!1109645 () Bool)

(declare-fun res!740523 () Bool)

(assert (=> b!1109645 (=> (not res!740523) (not e!632888))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1109645 (= res!740523 (and (= (size!35193 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35192 _keys!1208) (size!35193 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!740528 () Bool)

(assert (=> start!97358 (=> (not res!740528) (not e!632888))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97358 (= res!740528 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35192 _keys!1208))))))

(assert (=> start!97358 e!632888))

(assert (=> start!97358 tp_is_empty!27595))

(declare-fun array_inv!26714 (array!72002) Bool)

(assert (=> start!97358 (array_inv!26714 _keys!1208)))

(assert (=> start!97358 true))

(assert (=> start!97358 tp!82303))

(declare-fun array_inv!26715 (array!72004) Bool)

(assert (=> start!97358 (and (array_inv!26715 _values!996) e!632892)))

(declare-fun mapNonEmpty!43210 () Bool)

(declare-fun tp!82304 () Bool)

(declare-fun e!632886 () Bool)

(assert (=> mapNonEmpty!43210 (= mapRes!43210 (and tp!82304 e!632886))))

(declare-fun mapValue!43210 () ValueCell!13088)

(declare-fun mapKey!43210 () (_ BitVec 32))

(declare-fun mapRest!43210 () (Array (_ BitVec 32) ValueCell!13088))

(assert (=> mapNonEmpty!43210 (= (arr!34655 _values!996) (store mapRest!43210 mapKey!43210 mapValue!43210))))

(declare-fun zeroValue!944 () V!41921)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46675 () Bool)

(declare-fun minValue!944 () V!41921)

(declare-fun getCurrentListMapNoExtraKeys!4302 (array!72002 array!72004 (_ BitVec 32) (_ BitVec 32) V!41921 V!41921 (_ BitVec 32) Int) ListLongMap!15543)

(declare-fun dynLambda!2368 (Int (_ BitVec 64)) V!41921)

(assert (=> bm!46675 (= call!46679 (getCurrentListMapNoExtraKeys!4302 lt!495844 (array!72005 (store (arr!34655 _values!996) i!673 (ValueCellFull!13088 (dynLambda!2368 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35193 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109646 () Bool)

(declare-fun e!632890 () Bool)

(assert (=> b!1109646 (= e!632889 (not e!632890))))

(declare-fun res!740529 () Bool)

(assert (=> b!1109646 (=> res!740529 e!632890)))

(assert (=> b!1109646 (= res!740529 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35192 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72002 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109646 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36229 0))(
  ( (Unit!36230) )
))
(declare-fun lt!495845 () Unit!36229)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72002 (_ BitVec 64) (_ BitVec 32)) Unit!36229)

(assert (=> b!1109646 (= lt!495845 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109647 () Bool)

(declare-fun res!740532 () Bool)

(assert (=> b!1109647 (=> (not res!740532) (not e!632888))))

(assert (=> b!1109647 (= res!740532 (= (select (arr!34654 _keys!1208) i!673) k0!934))))

(declare-fun b!1109648 () Bool)

(declare-fun res!740526 () Bool)

(assert (=> b!1109648 (=> (not res!740526) (not e!632888))))

(assert (=> b!1109648 (= res!740526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109649 () Bool)

(assert (=> b!1109649 (= e!632886 tp_is_empty!27595)))

(declare-fun b!1109650 () Bool)

(declare-fun res!740531 () Bool)

(assert (=> b!1109650 (=> (not res!740531) (not e!632888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109650 (= res!740531 (validKeyInArray!0 k0!934))))

(declare-fun b!1109651 () Bool)

(assert (=> b!1109651 (= e!632891 (= call!46679 call!46678))))

(declare-fun mapIsEmpty!43210 () Bool)

(assert (=> mapIsEmpty!43210 mapRes!43210))

(declare-fun b!1109652 () Bool)

(assert (=> b!1109652 (= e!632890 true)))

(assert (=> b!1109652 e!632891))

(declare-fun c!109167 () Bool)

(assert (=> b!1109652 (= c!109167 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495846 () Unit!36229)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!276 (array!72002 array!72004 (_ BitVec 32) (_ BitVec 32) V!41921 V!41921 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36229)

(assert (=> b!1109652 (= lt!495846 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!46676 () Bool)

(assert (=> bm!46676 (= call!46678 (getCurrentListMapNoExtraKeys!4302 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109653 () Bool)

(declare-fun res!740525 () Bool)

(assert (=> b!1109653 (=> (not res!740525) (not e!632889))))

(declare-datatypes ((List!24231 0))(
  ( (Nil!24228) (Cons!24227 (h!25436 (_ BitVec 64)) (t!34603 List!24231)) )
))
(declare-fun arrayNoDuplicates!0 (array!72002 (_ BitVec 32) List!24231) Bool)

(assert (=> b!1109653 (= res!740525 (arrayNoDuplicates!0 lt!495844 #b00000000000000000000000000000000 Nil!24228))))

(declare-fun b!1109654 () Bool)

(declare-fun res!740527 () Bool)

(assert (=> b!1109654 (=> (not res!740527) (not e!632888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109654 (= res!740527 (validMask!0 mask!1564))))

(declare-fun b!1109655 () Bool)

(declare-fun res!740530 () Bool)

(assert (=> b!1109655 (=> (not res!740530) (not e!632888))))

(assert (=> b!1109655 (= res!740530 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24228))))

(assert (= (and start!97358 res!740528) b!1109654))

(assert (= (and b!1109654 res!740527) b!1109645))

(assert (= (and b!1109645 res!740523) b!1109648))

(assert (= (and b!1109648 res!740526) b!1109655))

(assert (= (and b!1109655 res!740530) b!1109640))

(assert (= (and b!1109640 res!740524) b!1109650))

(assert (= (and b!1109650 res!740531) b!1109647))

(assert (= (and b!1109647 res!740532) b!1109643))

(assert (= (and b!1109643 res!740533) b!1109653))

(assert (= (and b!1109653 res!740525) b!1109646))

(assert (= (and b!1109646 (not res!740529)) b!1109652))

(assert (= (and b!1109652 c!109167) b!1109644))

(assert (= (and b!1109652 (not c!109167)) b!1109651))

(assert (= (or b!1109644 b!1109651) bm!46675))

(assert (= (or b!1109644 b!1109651) bm!46676))

(assert (= (and b!1109641 condMapEmpty!43210) mapIsEmpty!43210))

(assert (= (and b!1109641 (not condMapEmpty!43210)) mapNonEmpty!43210))

(get-info :version)

(assert (= (and mapNonEmpty!43210 ((_ is ValueCellFull!13088) mapValue!43210)) b!1109649))

(assert (= (and b!1109641 ((_ is ValueCellFull!13088) mapDefault!43210)) b!1109642))

(assert (= start!97358 b!1109641))

(declare-fun b_lambda!18339 () Bool)

(assert (=> (not b_lambda!18339) (not bm!46675)))

(declare-fun t!34601 () Bool)

(declare-fun tb!8193 () Bool)

(assert (=> (and start!97358 (= defaultEntry!1004 defaultEntry!1004) t!34601) tb!8193))

(declare-fun result!16955 () Bool)

(assert (=> tb!8193 (= result!16955 tp_is_empty!27595)))

(assert (=> bm!46675 t!34601))

(declare-fun b_and!37485 () Bool)

(assert (= b_and!37483 (and (=> t!34601 result!16955) b_and!37485)))

(declare-fun m!1027341 () Bool)

(assert (=> b!1109654 m!1027341))

(declare-fun m!1027343 () Bool)

(assert (=> bm!46675 m!1027343))

(declare-fun m!1027345 () Bool)

(assert (=> bm!46675 m!1027345))

(declare-fun m!1027347 () Bool)

(assert (=> bm!46675 m!1027347))

(declare-fun m!1027349 () Bool)

(assert (=> b!1109644 m!1027349))

(declare-fun m!1027351 () Bool)

(assert (=> b!1109652 m!1027351))

(declare-fun m!1027353 () Bool)

(assert (=> b!1109647 m!1027353))

(declare-fun m!1027355 () Bool)

(assert (=> bm!46676 m!1027355))

(declare-fun m!1027357 () Bool)

(assert (=> b!1109648 m!1027357))

(declare-fun m!1027359 () Bool)

(assert (=> b!1109646 m!1027359))

(declare-fun m!1027361 () Bool)

(assert (=> b!1109646 m!1027361))

(declare-fun m!1027363 () Bool)

(assert (=> b!1109643 m!1027363))

(declare-fun m!1027365 () Bool)

(assert (=> b!1109643 m!1027365))

(declare-fun m!1027367 () Bool)

(assert (=> mapNonEmpty!43210 m!1027367))

(declare-fun m!1027369 () Bool)

(assert (=> b!1109655 m!1027369))

(declare-fun m!1027371 () Bool)

(assert (=> b!1109650 m!1027371))

(declare-fun m!1027373 () Bool)

(assert (=> start!97358 m!1027373))

(declare-fun m!1027375 () Bool)

(assert (=> start!97358 m!1027375))

(declare-fun m!1027377 () Bool)

(assert (=> b!1109653 m!1027377))

(check-sat (not b!1109654) (not b!1109652) (not b!1109648) (not b!1109655) (not b_next!23335) (not b!1109643) (not b!1109644) (not bm!46676) (not bm!46675) (not b_lambda!18339) b_and!37485 (not b!1109653) (not b!1109646) tp_is_empty!27595 (not mapNonEmpty!43210) (not b!1109650) (not start!97358))
(check-sat b_and!37485 (not b_next!23335))
