; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40760 () Bool)

(assert start!40760)

(declare-fun b_free!10749 () Bool)

(declare-fun b_next!10749 () Bool)

(assert (=> start!40760 (= b_free!10749 (not b_next!10749))))

(declare-fun tp!38069 () Bool)

(declare-fun b_and!18785 () Bool)

(assert (=> start!40760 (= tp!38069 b_and!18785)))

(declare-fun b!451468 () Bool)

(declare-fun res!268805 () Bool)

(declare-fun e!264470 () Bool)

(assert (=> b!451468 (=> (not res!268805) (not e!264470))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451468 (= res!268805 (validMask!0 mask!1025))))

(declare-fun b!451469 () Bool)

(declare-fun res!268793 () Bool)

(assert (=> b!451469 (=> (not res!268793) (not e!264470))))

(declare-datatypes ((array!27981 0))(
  ( (array!27982 (arr!13435 (Array (_ BitVec 32) (_ BitVec 64))) (size!13787 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27981)

(declare-datatypes ((List!8066 0))(
  ( (Nil!8063) (Cons!8062 (h!8918 (_ BitVec 64)) (t!13838 List!8066)) )
))
(declare-fun arrayNoDuplicates!0 (array!27981 (_ BitVec 32) List!8066) Bool)

(assert (=> b!451469 (= res!268793 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8063))))

(declare-fun b!451470 () Bool)

(declare-fun e!264466 () Bool)

(assert (=> b!451470 (= e!264470 e!264466)))

(declare-fun res!268796 () Bool)

(assert (=> b!451470 (=> (not res!268796) (not e!264466))))

(declare-fun lt!204936 () array!27981)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27981 (_ BitVec 32)) Bool)

(assert (=> b!451470 (= res!268796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204936 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451470 (= lt!204936 (array!27982 (store (arr!13435 _keys!709) i!563 k0!794) (size!13787 _keys!709)))))

(declare-fun b!451471 () Bool)

(declare-fun res!268799 () Bool)

(assert (=> b!451471 (=> (not res!268799) (not e!264470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451471 (= res!268799 (validKeyInArray!0 k0!794))))

(declare-fun b!451472 () Bool)

(declare-fun e!264471 () Bool)

(assert (=> b!451472 (= e!264466 e!264471)))

(declare-fun res!268798 () Bool)

(assert (=> b!451472 (=> (not res!268798) (not e!264471))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!451472 (= res!268798 (= from!863 i!563))))

(declare-datatypes ((V!17221 0))(
  ( (V!17222 (val!6088 Int)) )
))
(declare-fun minValue!515 () V!17221)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8004 0))(
  ( (tuple2!8005 (_1!4013 (_ BitVec 64)) (_2!4013 V!17221)) )
))
(declare-datatypes ((List!8067 0))(
  ( (Nil!8064) (Cons!8063 (h!8919 tuple2!8004) (t!13839 List!8067)) )
))
(declare-datatypes ((ListLongMap!6917 0))(
  ( (ListLongMap!6918 (toList!3474 List!8067)) )
))
(declare-fun lt!204934 () ListLongMap!6917)

(declare-fun zeroValue!515 () V!17221)

(declare-datatypes ((ValueCell!5700 0))(
  ( (ValueCellFull!5700 (v!8347 V!17221)) (EmptyCell!5700) )
))
(declare-datatypes ((array!27983 0))(
  ( (array!27984 (arr!13436 (Array (_ BitVec 32) ValueCell!5700)) (size!13788 (_ BitVec 32))) )
))
(declare-fun lt!204937 () array!27983)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1658 (array!27981 array!27983 (_ BitVec 32) (_ BitVec 32) V!17221 V!17221 (_ BitVec 32) Int) ListLongMap!6917)

(assert (=> b!451472 (= lt!204934 (getCurrentListMapNoExtraKeys!1658 lt!204936 lt!204937 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27983)

(declare-fun v!412 () V!17221)

(assert (=> b!451472 (= lt!204937 (array!27984 (store (arr!13436 _values!549) i!563 (ValueCellFull!5700 v!412)) (size!13788 _values!549)))))

(declare-fun lt!204938 () ListLongMap!6917)

(assert (=> b!451472 (= lt!204938 (getCurrentListMapNoExtraKeys!1658 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19767 () Bool)

(declare-fun mapRes!19767 () Bool)

(declare-fun tp!38070 () Bool)

(declare-fun e!264467 () Bool)

(assert (=> mapNonEmpty!19767 (= mapRes!19767 (and tp!38070 e!264467))))

(declare-fun mapValue!19767 () ValueCell!5700)

(declare-fun mapRest!19767 () (Array (_ BitVec 32) ValueCell!5700))

(declare-fun mapKey!19767 () (_ BitVec 32))

(assert (=> mapNonEmpty!19767 (= (arr!13436 _values!549) (store mapRest!19767 mapKey!19767 mapValue!19767))))

(declare-fun res!268803 () Bool)

(assert (=> start!40760 (=> (not res!268803) (not e!264470))))

(assert (=> start!40760 (= res!268803 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13787 _keys!709))))))

(assert (=> start!40760 e!264470))

(declare-fun tp_is_empty!12087 () Bool)

(assert (=> start!40760 tp_is_empty!12087))

(assert (=> start!40760 tp!38069))

(assert (=> start!40760 true))

(declare-fun e!264472 () Bool)

(declare-fun array_inv!9730 (array!27983) Bool)

(assert (=> start!40760 (and (array_inv!9730 _values!549) e!264472)))

(declare-fun array_inv!9731 (array!27981) Bool)

(assert (=> start!40760 (array_inv!9731 _keys!709)))

(declare-fun c!56072 () Bool)

(declare-fun call!29861 () ListLongMap!6917)

(declare-fun bm!29857 () Bool)

(assert (=> bm!29857 (= call!29861 (getCurrentListMapNoExtraKeys!1658 (ite c!56072 _keys!709 lt!204936) (ite c!56072 _values!549 lt!204937) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451473 () Bool)

(declare-fun e!264469 () Bool)

(assert (=> b!451473 (= e!264471 (not e!264469))))

(declare-fun res!268795 () Bool)

(assert (=> b!451473 (=> res!268795 e!264469)))

(assert (=> b!451473 (= res!268795 (validKeyInArray!0 (select (arr!13435 _keys!709) from!863)))))

(declare-fun e!264473 () Bool)

(assert (=> b!451473 e!264473))

(assert (=> b!451473 (= c!56072 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13210 0))(
  ( (Unit!13211) )
))
(declare-fun lt!204935 () Unit!13210)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!720 (array!27981 array!27983 (_ BitVec 32) (_ BitVec 32) V!17221 V!17221 (_ BitVec 32) (_ BitVec 64) V!17221 (_ BitVec 32) Int) Unit!13210)

(assert (=> b!451473 (= lt!204935 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!720 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451474 () Bool)

(declare-fun call!29860 () ListLongMap!6917)

(declare-fun +!1554 (ListLongMap!6917 tuple2!8004) ListLongMap!6917)

(assert (=> b!451474 (= e!264473 (= call!29860 (+!1554 call!29861 (tuple2!8005 k0!794 v!412))))))

(declare-fun mapIsEmpty!19767 () Bool)

(assert (=> mapIsEmpty!19767 mapRes!19767))

(declare-fun b!451475 () Bool)

(declare-fun res!268797 () Bool)

(assert (=> b!451475 (=> (not res!268797) (not e!264470))))

(assert (=> b!451475 (= res!268797 (or (= (select (arr!13435 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13435 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451476 () Bool)

(declare-fun res!268800 () Bool)

(assert (=> b!451476 (=> (not res!268800) (not e!264470))))

(assert (=> b!451476 (= res!268800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451477 () Bool)

(assert (=> b!451477 (= e!264469 (bvslt i!563 (size!13788 _values!549)))))

(declare-fun get!6615 (ValueCell!5700 V!17221) V!17221)

(declare-fun dynLambda!854 (Int (_ BitVec 64)) V!17221)

(assert (=> b!451477 (= lt!204934 (+!1554 (getCurrentListMapNoExtraKeys!1658 lt!204936 lt!204937 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8005 (select (arr!13435 lt!204936) from!863) (get!6615 (select (arr!13436 lt!204937) from!863) (dynLambda!854 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451478 () Bool)

(declare-fun res!268801 () Bool)

(assert (=> b!451478 (=> (not res!268801) (not e!264466))))

(assert (=> b!451478 (= res!268801 (arrayNoDuplicates!0 lt!204936 #b00000000000000000000000000000000 Nil!8063))))

(declare-fun b!451479 () Bool)

(declare-fun res!268802 () Bool)

(assert (=> b!451479 (=> (not res!268802) (not e!264466))))

(assert (=> b!451479 (= res!268802 (bvsle from!863 i!563))))

(declare-fun b!451480 () Bool)

(declare-fun res!268804 () Bool)

(assert (=> b!451480 (=> (not res!268804) (not e!264470))))

(declare-fun arrayContainsKey!0 (array!27981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451480 (= res!268804 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451481 () Bool)

(declare-fun res!268792 () Bool)

(assert (=> b!451481 (=> (not res!268792) (not e!264470))))

(assert (=> b!451481 (= res!268792 (and (= (size!13788 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13787 _keys!709) (size!13788 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451482 () Bool)

(declare-fun e!264468 () Bool)

(assert (=> b!451482 (= e!264468 tp_is_empty!12087)))

(declare-fun b!451483 () Bool)

(assert (=> b!451483 (= e!264472 (and e!264468 mapRes!19767))))

(declare-fun condMapEmpty!19767 () Bool)

(declare-fun mapDefault!19767 () ValueCell!5700)

(assert (=> b!451483 (= condMapEmpty!19767 (= (arr!13436 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5700)) mapDefault!19767)))))

(declare-fun b!451484 () Bool)

(declare-fun res!268794 () Bool)

(assert (=> b!451484 (=> (not res!268794) (not e!264470))))

(assert (=> b!451484 (= res!268794 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13787 _keys!709))))))

(declare-fun b!451485 () Bool)

(assert (=> b!451485 (= e!264467 tp_is_empty!12087)))

(declare-fun bm!29858 () Bool)

(assert (=> bm!29858 (= call!29860 (getCurrentListMapNoExtraKeys!1658 (ite c!56072 lt!204936 _keys!709) (ite c!56072 lt!204937 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451486 () Bool)

(assert (=> b!451486 (= e!264473 (= call!29861 call!29860))))

(assert (= (and start!40760 res!268803) b!451468))

(assert (= (and b!451468 res!268805) b!451481))

(assert (= (and b!451481 res!268792) b!451476))

(assert (= (and b!451476 res!268800) b!451469))

(assert (= (and b!451469 res!268793) b!451484))

(assert (= (and b!451484 res!268794) b!451471))

(assert (= (and b!451471 res!268799) b!451475))

(assert (= (and b!451475 res!268797) b!451480))

(assert (= (and b!451480 res!268804) b!451470))

(assert (= (and b!451470 res!268796) b!451478))

(assert (= (and b!451478 res!268801) b!451479))

(assert (= (and b!451479 res!268802) b!451472))

(assert (= (and b!451472 res!268798) b!451473))

(assert (= (and b!451473 c!56072) b!451474))

(assert (= (and b!451473 (not c!56072)) b!451486))

(assert (= (or b!451474 b!451486) bm!29858))

(assert (= (or b!451474 b!451486) bm!29857))

(assert (= (and b!451473 (not res!268795)) b!451477))

(assert (= (and b!451483 condMapEmpty!19767) mapIsEmpty!19767))

(assert (= (and b!451483 (not condMapEmpty!19767)) mapNonEmpty!19767))

(get-info :version)

(assert (= (and mapNonEmpty!19767 ((_ is ValueCellFull!5700) mapValue!19767)) b!451485))

(assert (= (and b!451483 ((_ is ValueCellFull!5700) mapDefault!19767)) b!451482))

(assert (= start!40760 b!451483))

(declare-fun b_lambda!9527 () Bool)

(assert (=> (not b_lambda!9527) (not b!451477)))

(declare-fun t!13837 () Bool)

(declare-fun tb!3729 () Bool)

(assert (=> (and start!40760 (= defaultEntry!557 defaultEntry!557) t!13837) tb!3729))

(declare-fun result!6995 () Bool)

(assert (=> tb!3729 (= result!6995 tp_is_empty!12087)))

(assert (=> b!451477 t!13837))

(declare-fun b_and!18787 () Bool)

(assert (= b_and!18785 (and (=> t!13837 result!6995) b_and!18787)))

(declare-fun m!435239 () Bool)

(assert (=> b!451477 m!435239))

(declare-fun m!435241 () Bool)

(assert (=> b!451477 m!435241))

(assert (=> b!451477 m!435239))

(declare-fun m!435243 () Bool)

(assert (=> b!451477 m!435243))

(declare-fun m!435245 () Bool)

(assert (=> b!451477 m!435245))

(declare-fun m!435247 () Bool)

(assert (=> b!451477 m!435247))

(declare-fun m!435249 () Bool)

(assert (=> b!451477 m!435249))

(assert (=> b!451477 m!435245))

(assert (=> b!451477 m!435241))

(declare-fun m!435251 () Bool)

(assert (=> b!451469 m!435251))

(declare-fun m!435253 () Bool)

(assert (=> bm!29858 m!435253))

(declare-fun m!435255 () Bool)

(assert (=> b!451468 m!435255))

(declare-fun m!435257 () Bool)

(assert (=> b!451476 m!435257))

(declare-fun m!435259 () Bool)

(assert (=> b!451471 m!435259))

(declare-fun m!435261 () Bool)

(assert (=> b!451478 m!435261))

(declare-fun m!435263 () Bool)

(assert (=> bm!29857 m!435263))

(declare-fun m!435265 () Bool)

(assert (=> b!451475 m!435265))

(declare-fun m!435267 () Bool)

(assert (=> b!451472 m!435267))

(declare-fun m!435269 () Bool)

(assert (=> b!451472 m!435269))

(declare-fun m!435271 () Bool)

(assert (=> b!451472 m!435271))

(declare-fun m!435273 () Bool)

(assert (=> b!451480 m!435273))

(declare-fun m!435275 () Bool)

(assert (=> b!451473 m!435275))

(assert (=> b!451473 m!435275))

(declare-fun m!435277 () Bool)

(assert (=> b!451473 m!435277))

(declare-fun m!435279 () Bool)

(assert (=> b!451473 m!435279))

(declare-fun m!435281 () Bool)

(assert (=> b!451474 m!435281))

(declare-fun m!435283 () Bool)

(assert (=> b!451470 m!435283))

(declare-fun m!435285 () Bool)

(assert (=> b!451470 m!435285))

(declare-fun m!435287 () Bool)

(assert (=> mapNonEmpty!19767 m!435287))

(declare-fun m!435289 () Bool)

(assert (=> start!40760 m!435289))

(declare-fun m!435291 () Bool)

(assert (=> start!40760 m!435291))

(check-sat (not b!451469) (not bm!29858) (not bm!29857) (not b!451470) (not b!451477) (not b!451478) (not b_next!10749) (not b!451468) (not b!451476) (not start!40760) b_and!18787 (not b!451472) (not mapNonEmpty!19767) tp_is_empty!12087 (not b!451480) (not b_lambda!9527) (not b!451471) (not b!451473) (not b!451474))
(check-sat b_and!18787 (not b_next!10749))
