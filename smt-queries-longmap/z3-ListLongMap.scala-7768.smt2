; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97346 () Bool)

(assert start!97346)

(declare-fun b_free!23323 () Bool)

(declare-fun b_next!23323 () Bool)

(assert (=> start!97346 (= b_free!23323 (not b_next!23323))))

(declare-fun tp!82267 () Bool)

(declare-fun b_and!37457 () Bool)

(assert (=> start!97346 (= tp!82267 b_and!37457)))

(declare-fun b!1109328 () Bool)

(declare-fun e!632738 () Bool)

(declare-datatypes ((V!41905 0))(
  ( (V!41906 (val!13848 Int)) )
))
(declare-datatypes ((tuple2!17562 0))(
  ( (tuple2!17563 (_1!8792 (_ BitVec 64)) (_2!8792 V!41905)) )
))
(declare-datatypes ((List!24219 0))(
  ( (Nil!24216) (Cons!24215 (h!25424 tuple2!17562) (t!34579 List!24219)) )
))
(declare-datatypes ((ListLongMap!15531 0))(
  ( (ListLongMap!15532 (toList!7781 List!24219)) )
))
(declare-fun call!46643 () ListLongMap!15531)

(declare-fun call!46642 () ListLongMap!15531)

(assert (=> b!1109328 (= e!632738 (= call!46643 call!46642))))

(declare-fun mapIsEmpty!43192 () Bool)

(declare-fun mapRes!43192 () Bool)

(assert (=> mapIsEmpty!43192 mapRes!43192))

(declare-fun mapNonEmpty!43192 () Bool)

(declare-fun tp!82268 () Bool)

(declare-fun e!632737 () Bool)

(assert (=> mapNonEmpty!43192 (= mapRes!43192 (and tp!82268 e!632737))))

(declare-fun mapKey!43192 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13082 0))(
  ( (ValueCellFull!13082 (v!16480 V!41905)) (EmptyCell!13082) )
))
(declare-datatypes ((array!71978 0))(
  ( (array!71979 (arr!34642 (Array (_ BitVec 32) ValueCell!13082)) (size!35180 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71978)

(declare-fun mapRest!43192 () (Array (_ BitVec 32) ValueCell!13082))

(declare-fun mapValue!43192 () ValueCell!13082)

(assert (=> mapNonEmpty!43192 (= (arr!34642 _values!996) (store mapRest!43192 mapKey!43192 mapValue!43192))))

(declare-fun zeroValue!944 () V!41905)

(declare-datatypes ((array!71980 0))(
  ( (array!71981 (arr!34643 (Array (_ BitVec 32) (_ BitVec 64))) (size!35181 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71980)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun bm!46639 () Bool)

(declare-fun minValue!944 () V!41905)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4296 (array!71980 array!71978 (_ BitVec 32) (_ BitVec 32) V!41905 V!41905 (_ BitVec 32) Int) ListLongMap!15531)

(assert (=> bm!46639 (= call!46642 (getCurrentListMapNoExtraKeys!4296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109329 () Bool)

(declare-fun e!632741 () Bool)

(declare-fun tp_is_empty!27583 () Bool)

(assert (=> b!1109329 (= e!632741 tp_is_empty!27583)))

(declare-fun b!1109330 () Bool)

(declare-fun res!740326 () Bool)

(declare-fun e!632740 () Bool)

(assert (=> b!1109330 (=> (not res!740326) (not e!632740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71980 (_ BitVec 32)) Bool)

(assert (=> b!1109330 (= res!740326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109331 () Bool)

(declare-fun e!632736 () Bool)

(declare-fun e!632735 () Bool)

(assert (=> b!1109331 (= e!632736 (not e!632735))))

(declare-fun res!740334 () Bool)

(assert (=> b!1109331 (=> res!740334 e!632735)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109331 (= res!740334 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35181 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109331 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36219 0))(
  ( (Unit!36220) )
))
(declare-fun lt!495791 () Unit!36219)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71980 (_ BitVec 64) (_ BitVec 32)) Unit!36219)

(assert (=> b!1109331 (= lt!495791 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1109332 () Bool)

(declare-fun res!740333 () Bool)

(assert (=> b!1109332 (=> (not res!740333) (not e!632740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109332 (= res!740333 (validKeyInArray!0 k0!934))))

(declare-fun b!1109333 () Bool)

(declare-fun res!740331 () Bool)

(assert (=> b!1109333 (=> (not res!740331) (not e!632740))))

(assert (=> b!1109333 (= res!740331 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35181 _keys!1208))))))

(declare-fun b!1109334 () Bool)

(declare-fun e!632742 () Bool)

(assert (=> b!1109334 (= e!632742 (and e!632741 mapRes!43192))))

(declare-fun condMapEmpty!43192 () Bool)

(declare-fun mapDefault!43192 () ValueCell!13082)

(assert (=> b!1109334 (= condMapEmpty!43192 (= (arr!34642 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13082)) mapDefault!43192)))))

(declare-fun res!740330 () Bool)

(assert (=> start!97346 (=> (not res!740330) (not e!632740))))

(assert (=> start!97346 (= res!740330 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35181 _keys!1208))))))

(assert (=> start!97346 e!632740))

(assert (=> start!97346 tp_is_empty!27583))

(declare-fun array_inv!26708 (array!71980) Bool)

(assert (=> start!97346 (array_inv!26708 _keys!1208)))

(assert (=> start!97346 true))

(assert (=> start!97346 tp!82267))

(declare-fun array_inv!26709 (array!71978) Bool)

(assert (=> start!97346 (and (array_inv!26709 _values!996) e!632742)))

(declare-fun b!1109335 () Bool)

(declare-fun res!740329 () Bool)

(assert (=> b!1109335 (=> (not res!740329) (not e!632740))))

(assert (=> b!1109335 (= res!740329 (and (= (size!35180 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35181 _keys!1208) (size!35180 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1109336 () Bool)

(declare-fun res!740332 () Bool)

(assert (=> b!1109336 (=> (not res!740332) (not e!632740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109336 (= res!740332 (validMask!0 mask!1564))))

(declare-fun b!1109337 () Bool)

(declare-fun res!740335 () Bool)

(assert (=> b!1109337 (=> (not res!740335) (not e!632740))))

(declare-datatypes ((List!24220 0))(
  ( (Nil!24217) (Cons!24216 (h!25425 (_ BitVec 64)) (t!34580 List!24220)) )
))
(declare-fun arrayNoDuplicates!0 (array!71980 (_ BitVec 32) List!24220) Bool)

(assert (=> b!1109337 (= res!740335 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24217))))

(declare-fun b!1109338 () Bool)

(assert (=> b!1109338 (= e!632740 e!632736)))

(declare-fun res!740325 () Bool)

(assert (=> b!1109338 (=> (not res!740325) (not e!632736))))

(declare-fun lt!495792 () array!71980)

(assert (=> b!1109338 (= res!740325 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495792 mask!1564))))

(assert (=> b!1109338 (= lt!495792 (array!71981 (store (arr!34643 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35181 _keys!1208)))))

(declare-fun b!1109339 () Bool)

(assert (=> b!1109339 (= e!632737 tp_is_empty!27583)))

(declare-fun b!1109340 () Bool)

(assert (=> b!1109340 (= e!632735 true)))

(assert (=> b!1109340 e!632738))

(declare-fun c!109143 () Bool)

(assert (=> b!1109340 (= c!109143 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495790 () Unit!36219)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!271 (array!71980 array!71978 (_ BitVec 32) (_ BitVec 32) V!41905 V!41905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36219)

(assert (=> b!1109340 (= lt!495790 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!271 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109341 () Bool)

(declare-fun res!740328 () Bool)

(assert (=> b!1109341 (=> (not res!740328) (not e!632736))))

(assert (=> b!1109341 (= res!740328 (arrayNoDuplicates!0 lt!495792 #b00000000000000000000000000000000 Nil!24217))))

(declare-fun bm!46640 () Bool)

(declare-fun dynLambda!2362 (Int (_ BitVec 64)) V!41905)

(assert (=> bm!46640 (= call!46643 (getCurrentListMapNoExtraKeys!4296 lt!495792 (array!71979 (store (arr!34642 _values!996) i!673 (ValueCellFull!13082 (dynLambda!2362 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35180 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109342 () Bool)

(declare-fun -!1000 (ListLongMap!15531 (_ BitVec 64)) ListLongMap!15531)

(assert (=> b!1109342 (= e!632738 (= call!46643 (-!1000 call!46642 k0!934)))))

(declare-fun b!1109343 () Bool)

(declare-fun res!740327 () Bool)

(assert (=> b!1109343 (=> (not res!740327) (not e!632740))))

(assert (=> b!1109343 (= res!740327 (= (select (arr!34643 _keys!1208) i!673) k0!934))))

(assert (= (and start!97346 res!740330) b!1109336))

(assert (= (and b!1109336 res!740332) b!1109335))

(assert (= (and b!1109335 res!740329) b!1109330))

(assert (= (and b!1109330 res!740326) b!1109337))

(assert (= (and b!1109337 res!740335) b!1109333))

(assert (= (and b!1109333 res!740331) b!1109332))

(assert (= (and b!1109332 res!740333) b!1109343))

(assert (= (and b!1109343 res!740327) b!1109338))

(assert (= (and b!1109338 res!740325) b!1109341))

(assert (= (and b!1109341 res!740328) b!1109331))

(assert (= (and b!1109331 (not res!740334)) b!1109340))

(assert (= (and b!1109340 c!109143) b!1109342))

(assert (= (and b!1109340 (not c!109143)) b!1109328))

(assert (= (or b!1109342 b!1109328) bm!46640))

(assert (= (or b!1109342 b!1109328) bm!46639))

(assert (= (and b!1109334 condMapEmpty!43192) mapIsEmpty!43192))

(assert (= (and b!1109334 (not condMapEmpty!43192)) mapNonEmpty!43192))

(get-info :version)

(assert (= (and mapNonEmpty!43192 ((_ is ValueCellFull!13082) mapValue!43192)) b!1109339))

(assert (= (and b!1109334 ((_ is ValueCellFull!13082) mapDefault!43192)) b!1109329))

(assert (= start!97346 b!1109334))

(declare-fun b_lambda!18325 () Bool)

(assert (=> (not b_lambda!18325) (not bm!46640)))

(declare-fun t!34578 () Bool)

(declare-fun tb!8181 () Bool)

(assert (=> (and start!97346 (= defaultEntry!1004 defaultEntry!1004) t!34578) tb!8181))

(declare-fun result!16931 () Bool)

(assert (=> tb!8181 (= result!16931 tp_is_empty!27583)))

(assert (=> bm!46640 t!34578))

(declare-fun b_and!37459 () Bool)

(assert (= b_and!37457 (and (=> t!34578 result!16931) b_and!37459)))

(declare-fun m!1027113 () Bool)

(assert (=> b!1109331 m!1027113))

(declare-fun m!1027115 () Bool)

(assert (=> b!1109331 m!1027115))

(declare-fun m!1027117 () Bool)

(assert (=> b!1109341 m!1027117))

(declare-fun m!1027119 () Bool)

(assert (=> b!1109332 m!1027119))

(declare-fun m!1027121 () Bool)

(assert (=> b!1109337 m!1027121))

(declare-fun m!1027123 () Bool)

(assert (=> b!1109330 m!1027123))

(declare-fun m!1027125 () Bool)

(assert (=> start!97346 m!1027125))

(declare-fun m!1027127 () Bool)

(assert (=> start!97346 m!1027127))

(declare-fun m!1027129 () Bool)

(assert (=> b!1109342 m!1027129))

(declare-fun m!1027131 () Bool)

(assert (=> bm!46640 m!1027131))

(declare-fun m!1027133 () Bool)

(assert (=> bm!46640 m!1027133))

(declare-fun m!1027135 () Bool)

(assert (=> bm!46640 m!1027135))

(declare-fun m!1027137 () Bool)

(assert (=> b!1109338 m!1027137))

(declare-fun m!1027139 () Bool)

(assert (=> b!1109338 m!1027139))

(declare-fun m!1027141 () Bool)

(assert (=> b!1109343 m!1027141))

(declare-fun m!1027143 () Bool)

(assert (=> bm!46639 m!1027143))

(declare-fun m!1027145 () Bool)

(assert (=> b!1109340 m!1027145))

(declare-fun m!1027147 () Bool)

(assert (=> b!1109336 m!1027147))

(declare-fun m!1027149 () Bool)

(assert (=> mapNonEmpty!43192 m!1027149))

(check-sat (not b!1109340) (not b!1109331) (not bm!46639) (not bm!46640) (not b!1109336) (not b!1109330) (not mapNonEmpty!43192) (not b!1109338) (not b!1109337) tp_is_empty!27583 (not start!97346) (not b!1109341) b_and!37459 (not b_lambda!18325) (not b_next!23323) (not b!1109332) (not b!1109342))
(check-sat b_and!37459 (not b_next!23323))
