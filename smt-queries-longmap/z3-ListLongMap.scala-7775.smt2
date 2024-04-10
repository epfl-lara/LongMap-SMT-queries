; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97396 () Bool)

(assert start!97396)

(declare-fun b_free!23367 () Bool)

(declare-fun b_next!23367 () Bool)

(assert (=> start!97396 (= b_free!23367 (not b_next!23367))))

(declare-fun tp!82400 () Bool)

(declare-fun b_and!37569 () Bool)

(assert (=> start!97396 (= tp!82400 b_and!37569)))

(declare-fun b!1110569 () Bool)

(declare-fun res!741128 () Bool)

(declare-fun e!633351 () Bool)

(assert (=> b!1110569 (=> (not res!741128) (not e!633351))))

(declare-datatypes ((array!72171 0))(
  ( (array!72172 (arr!34738 (Array (_ BitVec 32) (_ BitVec 64))) (size!35274 (_ BitVec 32))) )
))
(declare-fun lt!496188 () array!72171)

(declare-datatypes ((List!24226 0))(
  ( (Nil!24223) (Cons!24222 (h!25431 (_ BitVec 64)) (t!34639 List!24226)) )
))
(declare-fun arrayNoDuplicates!0 (array!72171 (_ BitVec 32) List!24226) Bool)

(assert (=> b!1110569 (= res!741128 (arrayNoDuplicates!0 lt!496188 #b00000000000000000000000000000000 Nil!24223))))

(declare-fun b!1110570 () Bool)

(declare-fun e!633352 () Bool)

(declare-fun e!633355 () Bool)

(declare-fun mapRes!43258 () Bool)

(assert (=> b!1110570 (= e!633352 (and e!633355 mapRes!43258))))

(declare-fun condMapEmpty!43258 () Bool)

(declare-datatypes ((V!41963 0))(
  ( (V!41964 (val!13870 Int)) )
))
(declare-datatypes ((ValueCell!13104 0))(
  ( (ValueCellFull!13104 (v!16503 V!41963)) (EmptyCell!13104) )
))
(declare-datatypes ((array!72173 0))(
  ( (array!72174 (arr!34739 (Array (_ BitVec 32) ValueCell!13104)) (size!35275 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72173)

(declare-fun mapDefault!43258 () ValueCell!13104)

(assert (=> b!1110570 (= condMapEmpty!43258 (= (arr!34739 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13104)) mapDefault!43258)))))

(declare-fun b!1110571 () Bool)

(declare-fun tp_is_empty!27627 () Bool)

(assert (=> b!1110571 (= e!633355 tp_is_empty!27627)))

(declare-fun b!1110572 () Bool)

(declare-fun e!633357 () Bool)

(assert (=> b!1110572 (= e!633357 tp_is_empty!27627)))

(declare-fun b!1110573 () Bool)

(declare-fun e!633353 () Bool)

(assert (=> b!1110573 (= e!633353 e!633351)))

(declare-fun res!741124 () Bool)

(assert (=> b!1110573 (=> (not res!741124) (not e!633351))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72171 (_ BitVec 32)) Bool)

(assert (=> b!1110573 (= res!741124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496188 mask!1564))))

(declare-fun _keys!1208 () array!72171)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1110573 (= lt!496188 (array!72172 (store (arr!34738 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35274 _keys!1208)))))

(declare-fun b!1110574 () Bool)

(declare-fun res!741126 () Bool)

(assert (=> b!1110574 (=> (not res!741126) (not e!633353))))

(assert (=> b!1110574 (= res!741126 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24223))))

(declare-fun b!1110575 () Bool)

(declare-fun res!741123 () Bool)

(assert (=> b!1110575 (=> (not res!741123) (not e!633353))))

(assert (=> b!1110575 (= res!741123 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35274 _keys!1208))))))

(declare-fun b!1110576 () Bool)

(declare-fun e!633354 () Bool)

(declare-datatypes ((tuple2!17542 0))(
  ( (tuple2!17543 (_1!8782 (_ BitVec 64)) (_2!8782 V!41963)) )
))
(declare-datatypes ((List!24227 0))(
  ( (Nil!24224) (Cons!24223 (h!25432 tuple2!17542) (t!34640 List!24227)) )
))
(declare-datatypes ((ListLongMap!15511 0))(
  ( (ListLongMap!15512 (toList!7771 List!24227)) )
))
(declare-fun call!46797 () ListLongMap!15511)

(declare-fun call!46798 () ListLongMap!15511)

(assert (=> b!1110576 (= e!633354 (= call!46797 call!46798))))

(declare-fun b!1110577 () Bool)

(declare-fun res!741130 () Bool)

(assert (=> b!1110577 (=> (not res!741130) (not e!633353))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1110577 (= res!741130 (and (= (size!35275 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35274 _keys!1208) (size!35275 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!41963)

(declare-fun bm!46794 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41963)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4265 (array!72171 array!72173 (_ BitVec 32) (_ BitVec 32) V!41963 V!41963 (_ BitVec 32) Int) ListLongMap!15511)

(assert (=> bm!46794 (= call!46798 (getCurrentListMapNoExtraKeys!4265 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1110578 () Bool)

(declare-fun -!1042 (ListLongMap!15511 (_ BitVec 64)) ListLongMap!15511)

(assert (=> b!1110578 (= e!633354 (= call!46797 (-!1042 call!46798 k0!934)))))

(declare-fun b!1110579 () Bool)

(declare-fun e!633350 () Bool)

(assert (=> b!1110579 (= e!633351 (not e!633350))))

(declare-fun res!741125 () Bool)

(assert (=> b!1110579 (=> res!741125 e!633350)))

(assert (=> b!1110579 (= res!741125 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35274 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1110579 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36446 0))(
  ( (Unit!36447) )
))
(declare-fun lt!496190 () Unit!36446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72171 (_ BitVec 64) (_ BitVec 32)) Unit!36446)

(assert (=> b!1110579 (= lt!496190 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1110580 () Bool)

(declare-fun res!741120 () Bool)

(assert (=> b!1110580 (=> (not res!741120) (not e!633353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1110580 (= res!741120 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!43258 () Bool)

(declare-fun tp!82399 () Bool)

(assert (=> mapNonEmpty!43258 (= mapRes!43258 (and tp!82399 e!633357))))

(declare-fun mapRest!43258 () (Array (_ BitVec 32) ValueCell!13104))

(declare-fun mapValue!43258 () ValueCell!13104)

(declare-fun mapKey!43258 () (_ BitVec 32))

(assert (=> mapNonEmpty!43258 (= (arr!34739 _values!996) (store mapRest!43258 mapKey!43258 mapValue!43258))))

(declare-fun b!1110581 () Bool)

(declare-fun res!741129 () Bool)

(assert (=> b!1110581 (=> (not res!741129) (not e!633353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1110581 (= res!741129 (validMask!0 mask!1564))))

(declare-fun b!1110582 () Bool)

(declare-fun res!741122 () Bool)

(assert (=> b!1110582 (=> (not res!741122) (not e!633353))))

(assert (=> b!1110582 (= res!741122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43258 () Bool)

(assert (=> mapIsEmpty!43258 mapRes!43258))

(declare-fun bm!46795 () Bool)

(declare-fun dynLambda!2393 (Int (_ BitVec 64)) V!41963)

(assert (=> bm!46795 (= call!46797 (getCurrentListMapNoExtraKeys!4265 lt!496188 (array!72174 (store (arr!34739 _values!996) i!673 (ValueCellFull!13104 (dynLambda!2393 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35275 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!741121 () Bool)

(assert (=> start!97396 (=> (not res!741121) (not e!633353))))

(assert (=> start!97396 (= res!741121 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35274 _keys!1208))))))

(assert (=> start!97396 e!633353))

(assert (=> start!97396 tp_is_empty!27627))

(declare-fun array_inv!26726 (array!72171) Bool)

(assert (=> start!97396 (array_inv!26726 _keys!1208)))

(assert (=> start!97396 true))

(assert (=> start!97396 tp!82400))

(declare-fun array_inv!26727 (array!72173) Bool)

(assert (=> start!97396 (and (array_inv!26727 _values!996) e!633352)))

(declare-fun b!1110583 () Bool)

(declare-fun res!741127 () Bool)

(assert (=> b!1110583 (=> (not res!741127) (not e!633353))))

(assert (=> b!1110583 (= res!741127 (= (select (arr!34738 _keys!1208) i!673) k0!934))))

(declare-fun b!1110584 () Bool)

(assert (=> b!1110584 (= e!633350 true)))

(assert (=> b!1110584 e!633354))

(declare-fun c!109242 () Bool)

(assert (=> b!1110584 (= c!109242 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496189 () Unit!36446)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!292 (array!72171 array!72173 (_ BitVec 32) (_ BitVec 32) V!41963 V!41963 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36446)

(assert (=> b!1110584 (= lt!496189 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!292 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97396 res!741121) b!1110581))

(assert (= (and b!1110581 res!741129) b!1110577))

(assert (= (and b!1110577 res!741130) b!1110582))

(assert (= (and b!1110582 res!741122) b!1110574))

(assert (= (and b!1110574 res!741126) b!1110575))

(assert (= (and b!1110575 res!741123) b!1110580))

(assert (= (and b!1110580 res!741120) b!1110583))

(assert (= (and b!1110583 res!741127) b!1110573))

(assert (= (and b!1110573 res!741124) b!1110569))

(assert (= (and b!1110569 res!741128) b!1110579))

(assert (= (and b!1110579 (not res!741125)) b!1110584))

(assert (= (and b!1110584 c!109242) b!1110578))

(assert (= (and b!1110584 (not c!109242)) b!1110576))

(assert (= (or b!1110578 b!1110576) bm!46795))

(assert (= (or b!1110578 b!1110576) bm!46794))

(assert (= (and b!1110570 condMapEmpty!43258) mapIsEmpty!43258))

(assert (= (and b!1110570 (not condMapEmpty!43258)) mapNonEmpty!43258))

(get-info :version)

(assert (= (and mapNonEmpty!43258 ((_ is ValueCellFull!13104) mapValue!43258)) b!1110572))

(assert (= (and b!1110570 ((_ is ValueCellFull!13104) mapDefault!43258)) b!1110571))

(assert (= start!97396 b!1110570))

(declare-fun b_lambda!18389 () Bool)

(assert (=> (not b_lambda!18389) (not bm!46795)))

(declare-fun t!34638 () Bool)

(declare-fun tb!8233 () Bool)

(assert (=> (and start!97396 (= defaultEntry!1004 defaultEntry!1004) t!34638) tb!8233))

(declare-fun result!17027 () Bool)

(assert (=> tb!8233 (= result!17027 tp_is_empty!27627)))

(assert (=> bm!46795 t!34638))

(declare-fun b_and!37571 () Bool)

(assert (= b_and!37569 (and (=> t!34638 result!17027) b_and!37571)))

(declare-fun m!1028575 () Bool)

(assert (=> start!97396 m!1028575))

(declare-fun m!1028577 () Bool)

(assert (=> start!97396 m!1028577))

(declare-fun m!1028579 () Bool)

(assert (=> b!1110581 m!1028579))

(declare-fun m!1028581 () Bool)

(assert (=> mapNonEmpty!43258 m!1028581))

(declare-fun m!1028583 () Bool)

(assert (=> b!1110583 m!1028583))

(declare-fun m!1028585 () Bool)

(assert (=> bm!46795 m!1028585))

(declare-fun m!1028587 () Bool)

(assert (=> bm!46795 m!1028587))

(declare-fun m!1028589 () Bool)

(assert (=> bm!46795 m!1028589))

(declare-fun m!1028591 () Bool)

(assert (=> b!1110579 m!1028591))

(declare-fun m!1028593 () Bool)

(assert (=> b!1110579 m!1028593))

(declare-fun m!1028595 () Bool)

(assert (=> b!1110580 m!1028595))

(declare-fun m!1028597 () Bool)

(assert (=> b!1110584 m!1028597))

(declare-fun m!1028599 () Bool)

(assert (=> b!1110569 m!1028599))

(declare-fun m!1028601 () Bool)

(assert (=> b!1110578 m!1028601))

(declare-fun m!1028603 () Bool)

(assert (=> bm!46794 m!1028603))

(declare-fun m!1028605 () Bool)

(assert (=> b!1110574 m!1028605))

(declare-fun m!1028607 () Bool)

(assert (=> b!1110573 m!1028607))

(declare-fun m!1028609 () Bool)

(assert (=> b!1110573 m!1028609))

(declare-fun m!1028611 () Bool)

(assert (=> b!1110582 m!1028611))

(check-sat (not b!1110573) (not mapNonEmpty!43258) (not b!1110582) tp_is_empty!27627 (not b!1110580) (not bm!46795) (not b!1110581) b_and!37571 (not b_lambda!18389) (not b!1110579) (not bm!46794) (not b!1110569) (not b!1110578) (not b_next!23367) (not start!97396) (not b!1110574) (not b!1110584))
(check-sat b_and!37571 (not b_next!23367))
