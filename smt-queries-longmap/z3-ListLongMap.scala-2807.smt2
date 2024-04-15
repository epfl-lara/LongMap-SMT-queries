; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40716 () Bool)

(assert start!40716)

(declare-fun b_free!10741 () Bool)

(declare-fun b_next!10741 () Bool)

(assert (=> start!40716 (= b_free!10741 (not b_next!10741))))

(declare-fun tp!38043 () Bool)

(declare-fun b_and!18723 () Bool)

(assert (=> start!40716 (= tp!38043 b_and!18723)))

(declare-datatypes ((V!17211 0))(
  ( (V!17212 (val!6084 Int)) )
))
(declare-fun minValue!515 () V!17211)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun e!264083 () Bool)

(declare-fun zeroValue!515 () V!17211)

(declare-datatypes ((array!27957 0))(
  ( (array!27958 (arr!13424 (Array (_ BitVec 32) (_ BitVec 64))) (size!13777 (_ BitVec 32))) )
))
(declare-fun lt!204560 () array!27957)

(declare-datatypes ((tuple2!8008 0))(
  ( (tuple2!8009 (_1!4015 (_ BitVec 64)) (_2!4015 V!17211)) )
))
(declare-datatypes ((List!8071 0))(
  ( (Nil!8068) (Cons!8067 (h!8923 tuple2!8008) (t!13826 List!8071)) )
))
(declare-datatypes ((ListLongMap!6911 0))(
  ( (ListLongMap!6912 (toList!3471 List!8071)) )
))
(declare-fun lt!204564 () ListLongMap!6911)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5696 0))(
  ( (ValueCellFull!5696 (v!8333 V!17211)) (EmptyCell!5696) )
))
(declare-datatypes ((array!27959 0))(
  ( (array!27960 (arr!13425 (Array (_ BitVec 32) ValueCell!5696)) (size!13778 (_ BitVec 32))) )
))
(declare-fun lt!204563 () array!27959)

(declare-fun b!450804 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun +!1572 (ListLongMap!6911 tuple2!8008) ListLongMap!6911)

(declare-fun getCurrentListMapNoExtraKeys!1668 (array!27957 array!27959 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) Int) ListLongMap!6911)

(declare-fun get!6610 (ValueCell!5696 V!17211) V!17211)

(declare-fun dynLambda!850 (Int (_ BitVec 64)) V!17211)

(assert (=> b!450804 (= e!264083 (= lt!204564 (+!1572 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!450805 () Bool)

(declare-fun res!268436 () Bool)

(declare-fun e!264082 () Bool)

(assert (=> b!450805 (=> (not res!268436) (not e!264082))))

(declare-fun _keys!709 () array!27957)

(declare-fun _values!549 () array!27959)

(assert (=> b!450805 (= res!268436 (and (= (size!13778 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13777 _keys!709) (size!13778 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!450806 () Bool)

(declare-fun res!268440 () Bool)

(declare-fun e!264088 () Bool)

(assert (=> b!450806 (=> (not res!268440) (not e!264088))))

(declare-datatypes ((List!8072 0))(
  ( (Nil!8069) (Cons!8068 (h!8924 (_ BitVec 64)) (t!13827 List!8072)) )
))
(declare-fun arrayNoDuplicates!0 (array!27957 (_ BitVec 32) List!8072) Bool)

(assert (=> b!450806 (= res!268440 (arrayNoDuplicates!0 lt!204560 #b00000000000000000000000000000000 Nil!8069))))

(declare-fun b!450807 () Bool)

(declare-fun res!268430 () Bool)

(assert (=> b!450807 (=> (not res!268430) (not e!264082))))

(assert (=> b!450807 (= res!268430 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8069))))

(declare-fun b!450808 () Bool)

(declare-fun res!268431 () Bool)

(assert (=> b!450808 (=> (not res!268431) (not e!264082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27957 (_ BitVec 32)) Bool)

(assert (=> b!450808 (= res!268431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450809 () Bool)

(declare-fun e!264087 () Bool)

(declare-fun call!29791 () ListLongMap!6911)

(declare-fun call!29790 () ListLongMap!6911)

(assert (=> b!450809 (= e!264087 (= call!29791 call!29790))))

(declare-fun b!450810 () Bool)

(assert (=> b!450810 (= e!264082 e!264088)))

(declare-fun res!268437 () Bool)

(assert (=> b!450810 (=> (not res!268437) (not e!264088))))

(assert (=> b!450810 (= res!268437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204560 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450810 (= lt!204560 (array!27958 (store (arr!13424 _keys!709) i!563 k0!794) (size!13777 _keys!709)))))

(declare-fun b!450811 () Bool)

(declare-fun res!268443 () Bool)

(assert (=> b!450811 (=> (not res!268443) (not e!264082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450811 (= res!268443 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19752 () Bool)

(declare-fun mapRes!19752 () Bool)

(declare-fun tp!38042 () Bool)

(declare-fun e!264081 () Bool)

(assert (=> mapNonEmpty!19752 (= mapRes!19752 (and tp!38042 e!264081))))

(declare-fun mapRest!19752 () (Array (_ BitVec 32) ValueCell!5696))

(declare-fun mapKey!19752 () (_ BitVec 32))

(declare-fun mapValue!19752 () ValueCell!5696)

(assert (=> mapNonEmpty!19752 (= (arr!13425 _values!549) (store mapRest!19752 mapKey!19752 mapValue!19752))))

(declare-fun b!450812 () Bool)

(declare-fun res!268438 () Bool)

(assert (=> b!450812 (=> (not res!268438) (not e!264082))))

(assert (=> b!450812 (= res!268438 (or (= (select (arr!13424 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13424 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450813 () Bool)

(declare-fun e!264084 () Bool)

(assert (=> b!450813 (= e!264084 (not e!264083))))

(declare-fun res!268434 () Bool)

(assert (=> b!450813 (=> res!268434 e!264083)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450813 (= res!268434 (validKeyInArray!0 (select (arr!13424 _keys!709) from!863)))))

(assert (=> b!450813 e!264087))

(declare-fun c!55947 () Bool)

(assert (=> b!450813 (= c!55947 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13163 0))(
  ( (Unit!13164) )
))
(declare-fun lt!204562 () Unit!13163)

(declare-fun v!412 () V!17211)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 (array!27957 array!27959 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) (_ BitVec 64) V!17211 (_ BitVec 32) Int) Unit!13163)

(assert (=> b!450813 (= lt!204562 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450814 () Bool)

(declare-fun res!268441 () Bool)

(assert (=> b!450814 (=> (not res!268441) (not e!264088))))

(assert (=> b!450814 (= res!268441 (bvsle from!863 i!563))))

(declare-fun b!450815 () Bool)

(declare-fun e!264086 () Bool)

(declare-fun tp_is_empty!12079 () Bool)

(assert (=> b!450815 (= e!264086 tp_is_empty!12079)))

(declare-fun b!450816 () Bool)

(declare-fun e!264089 () Bool)

(assert (=> b!450816 (= e!264089 (and e!264086 mapRes!19752))))

(declare-fun condMapEmpty!19752 () Bool)

(declare-fun mapDefault!19752 () ValueCell!5696)

(assert (=> b!450816 (= condMapEmpty!19752 (= (arr!13425 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5696)) mapDefault!19752)))))

(declare-fun b!450817 () Bool)

(assert (=> b!450817 (= e!264088 e!264084)))

(declare-fun res!268442 () Bool)

(assert (=> b!450817 (=> (not res!268442) (not e!264084))))

(assert (=> b!450817 (= res!268442 (= from!863 i!563))))

(assert (=> b!450817 (= lt!204564 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450817 (= lt!204563 (array!27960 (store (arr!13425 _values!549) i!563 (ValueCellFull!5696 v!412)) (size!13778 _values!549)))))

(declare-fun lt!204561 () ListLongMap!6911)

(assert (=> b!450817 (= lt!204561 (getCurrentListMapNoExtraKeys!1668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450818 () Bool)

(assert (=> b!450818 (= e!264087 (= call!29790 (+!1572 call!29791 (tuple2!8009 k0!794 v!412))))))

(declare-fun b!450819 () Bool)

(assert (=> b!450819 (= e!264081 tp_is_empty!12079)))

(declare-fun b!450820 () Bool)

(declare-fun res!268433 () Bool)

(assert (=> b!450820 (=> (not res!268433) (not e!264082))))

(assert (=> b!450820 (= res!268433 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13777 _keys!709))))))

(declare-fun bm!29788 () Bool)

(assert (=> bm!29788 (= call!29790 (getCurrentListMapNoExtraKeys!1668 (ite c!55947 lt!204560 _keys!709) (ite c!55947 lt!204563 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29787 () Bool)

(assert (=> bm!29787 (= call!29791 (getCurrentListMapNoExtraKeys!1668 (ite c!55947 _keys!709 lt!204560) (ite c!55947 _values!549 lt!204563) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!268439 () Bool)

(assert (=> start!40716 (=> (not res!268439) (not e!264082))))

(assert (=> start!40716 (= res!268439 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13777 _keys!709))))))

(assert (=> start!40716 e!264082))

(assert (=> start!40716 tp_is_empty!12079))

(assert (=> start!40716 tp!38043))

(assert (=> start!40716 true))

(declare-fun array_inv!9784 (array!27959) Bool)

(assert (=> start!40716 (and (array_inv!9784 _values!549) e!264089)))

(declare-fun array_inv!9785 (array!27957) Bool)

(assert (=> start!40716 (array_inv!9785 _keys!709)))

(declare-fun b!450821 () Bool)

(declare-fun res!268435 () Bool)

(assert (=> b!450821 (=> (not res!268435) (not e!264082))))

(assert (=> b!450821 (= res!268435 (validKeyInArray!0 k0!794))))

(declare-fun b!450822 () Bool)

(declare-fun res!268432 () Bool)

(assert (=> b!450822 (=> (not res!268432) (not e!264082))))

(declare-fun arrayContainsKey!0 (array!27957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450822 (= res!268432 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19752 () Bool)

(assert (=> mapIsEmpty!19752 mapRes!19752))

(assert (= (and start!40716 res!268439) b!450811))

(assert (= (and b!450811 res!268443) b!450805))

(assert (= (and b!450805 res!268436) b!450808))

(assert (= (and b!450808 res!268431) b!450807))

(assert (= (and b!450807 res!268430) b!450820))

(assert (= (and b!450820 res!268433) b!450821))

(assert (= (and b!450821 res!268435) b!450812))

(assert (= (and b!450812 res!268438) b!450822))

(assert (= (and b!450822 res!268432) b!450810))

(assert (= (and b!450810 res!268437) b!450806))

(assert (= (and b!450806 res!268440) b!450814))

(assert (= (and b!450814 res!268441) b!450817))

(assert (= (and b!450817 res!268442) b!450813))

(assert (= (and b!450813 c!55947) b!450818))

(assert (= (and b!450813 (not c!55947)) b!450809))

(assert (= (or b!450818 b!450809) bm!29788))

(assert (= (or b!450818 b!450809) bm!29787))

(assert (= (and b!450813 (not res!268434)) b!450804))

(assert (= (and b!450816 condMapEmpty!19752) mapIsEmpty!19752))

(assert (= (and b!450816 (not condMapEmpty!19752)) mapNonEmpty!19752))

(get-info :version)

(assert (= (and mapNonEmpty!19752 ((_ is ValueCellFull!5696) mapValue!19752)) b!450819))

(assert (= (and b!450816 ((_ is ValueCellFull!5696) mapDefault!19752)) b!450815))

(assert (= start!40716 b!450816))

(declare-fun b_lambda!9459 () Bool)

(assert (=> (not b_lambda!9459) (not b!450804)))

(declare-fun t!13825 () Bool)

(declare-fun tb!3713 () Bool)

(assert (=> (and start!40716 (= defaultEntry!557 defaultEntry!557) t!13825) tb!3713))

(declare-fun result!6969 () Bool)

(assert (=> tb!3713 (= result!6969 tp_is_empty!12079)))

(assert (=> b!450804 t!13825))

(declare-fun b_and!18725 () Bool)

(assert (= b_and!18723 (and (=> t!13825 result!6969) b_and!18725)))

(declare-fun m!434089 () Bool)

(assert (=> b!450817 m!434089))

(declare-fun m!434091 () Bool)

(assert (=> b!450817 m!434091))

(declare-fun m!434093 () Bool)

(assert (=> b!450817 m!434093))

(declare-fun m!434095 () Bool)

(assert (=> b!450808 m!434095))

(declare-fun m!434097 () Bool)

(assert (=> b!450806 m!434097))

(declare-fun m!434099 () Bool)

(assert (=> b!450822 m!434099))

(declare-fun m!434101 () Bool)

(assert (=> b!450810 m!434101))

(declare-fun m!434103 () Bool)

(assert (=> b!450810 m!434103))

(declare-fun m!434105 () Bool)

(assert (=> b!450818 m!434105))

(declare-fun m!434107 () Bool)

(assert (=> b!450821 m!434107))

(declare-fun m!434109 () Bool)

(assert (=> bm!29787 m!434109))

(declare-fun m!434111 () Bool)

(assert (=> bm!29788 m!434111))

(declare-fun m!434113 () Bool)

(assert (=> b!450811 m!434113))

(declare-fun m!434115 () Bool)

(assert (=> b!450813 m!434115))

(assert (=> b!450813 m!434115))

(declare-fun m!434117 () Bool)

(assert (=> b!450813 m!434117))

(declare-fun m!434119 () Bool)

(assert (=> b!450813 m!434119))

(declare-fun m!434121 () Bool)

(assert (=> b!450812 m!434121))

(declare-fun m!434123 () Bool)

(assert (=> mapNonEmpty!19752 m!434123))

(declare-fun m!434125 () Bool)

(assert (=> start!40716 m!434125))

(declare-fun m!434127 () Bool)

(assert (=> start!40716 m!434127))

(declare-fun m!434129 () Bool)

(assert (=> b!450807 m!434129))

(declare-fun m!434131 () Bool)

(assert (=> b!450804 m!434131))

(declare-fun m!434133 () Bool)

(assert (=> b!450804 m!434133))

(declare-fun m!434135 () Bool)

(assert (=> b!450804 m!434135))

(assert (=> b!450804 m!434131))

(assert (=> b!450804 m!434135))

(declare-fun m!434137 () Bool)

(assert (=> b!450804 m!434137))

(declare-fun m!434139 () Bool)

(assert (=> b!450804 m!434139))

(assert (=> b!450804 m!434139))

(declare-fun m!434141 () Bool)

(assert (=> b!450804 m!434141))

(check-sat (not b!450808) (not mapNonEmpty!19752) (not b!450807) (not bm!29787) (not b!450804) (not b!450822) (not b!450806) tp_is_empty!12079 (not bm!29788) b_and!18725 (not b_lambda!9459) (not b!450817) (not b_next!10741) (not b!450818) (not b!450811) (not b!450813) (not b!450821) (not start!40716) (not b!450810))
(check-sat b_and!18725 (not b_next!10741))
(get-model)

(declare-fun b_lambda!9465 () Bool)

(assert (= b_lambda!9459 (or (and start!40716 b_free!10741) b_lambda!9465)))

(check-sat (not b!450817) (not b!450808) (not mapNonEmpty!19752) (not b!450807) (not bm!29787) (not b!450804) (not b!450822) (not b!450806) tp_is_empty!12079 (not bm!29788) b_and!18725 (not b_lambda!9465) (not b_next!10741) (not b!450818) (not b!450811) (not b!450813) (not b!450821) (not start!40716) (not b!450810))
(check-sat b_and!18725 (not b_next!10741))
(get-model)

(declare-fun d!74059 () Bool)

(assert (=> d!74059 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!450811 d!74059))

(declare-fun d!74061 () Bool)

(declare-fun e!264159 () Bool)

(assert (=> d!74061 e!264159))

(declare-fun res!268537 () Bool)

(assert (=> d!74061 (=> (not res!268537) (not e!264159))))

(declare-fun lt!204609 () ListLongMap!6911)

(declare-fun contains!2483 (ListLongMap!6911 (_ BitVec 64)) Bool)

(assert (=> d!74061 (= res!268537 (not (contains!2483 lt!204609 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264163 () ListLongMap!6911)

(assert (=> d!74061 (= lt!204609 e!264163)))

(declare-fun c!55965 () Bool)

(assert (=> d!74061 (= c!55965 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 lt!204560 _keys!709))))))

(assert (=> d!74061 (validMask!0 mask!1025)))

(assert (=> d!74061 (= (getCurrentListMapNoExtraKeys!1668 (ite c!55947 lt!204560 _keys!709) (ite c!55947 lt!204563 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204609)))

(declare-fun b!450967 () Bool)

(declare-fun e!264160 () Bool)

(assert (=> b!450967 (= e!264159 e!264160)))

(declare-fun c!55962 () Bool)

(declare-fun e!264158 () Bool)

(assert (=> b!450967 (= c!55962 e!264158)))

(declare-fun res!268536 () Bool)

(assert (=> b!450967 (=> (not res!268536) (not e!264158))))

(assert (=> b!450967 (= res!268536 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 lt!204560 _keys!709))))))

(declare-fun b!450968 () Bool)

(declare-fun e!264164 () ListLongMap!6911)

(declare-fun call!29806 () ListLongMap!6911)

(assert (=> b!450968 (= e!264164 call!29806)))

(declare-fun b!450969 () Bool)

(assert (=> b!450969 (= e!264158 (validKeyInArray!0 (select (arr!13424 (ite c!55947 lt!204560 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!450969 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!450970 () Bool)

(declare-fun e!264161 () Bool)

(assert (=> b!450970 (= e!264160 e!264161)))

(declare-fun c!55963 () Bool)

(assert (=> b!450970 (= c!55963 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 lt!204560 _keys!709))))))

(declare-fun bm!29803 () Bool)

(assert (=> bm!29803 (= call!29806 (getCurrentListMapNoExtraKeys!1668 (ite c!55947 lt!204560 _keys!709) (ite c!55947 lt!204563 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!450971 () Bool)

(declare-fun e!264162 () Bool)

(assert (=> b!450971 (= e!264160 e!264162)))

(assert (=> b!450971 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 lt!204560 _keys!709))))))

(declare-fun res!268539 () Bool)

(assert (=> b!450971 (= res!268539 (contains!2483 lt!204609 (select (arr!13424 (ite c!55947 lt!204560 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!450971 (=> (not res!268539) (not e!264162))))

(declare-fun b!450972 () Bool)

(declare-fun isEmpty!562 (ListLongMap!6911) Bool)

(assert (=> b!450972 (= e!264161 (isEmpty!562 lt!204609))))

(declare-fun b!450973 () Bool)

(declare-fun lt!204613 () Unit!13163)

(declare-fun lt!204614 () Unit!13163)

(assert (=> b!450973 (= lt!204613 lt!204614)))

(declare-fun lt!204610 () (_ BitVec 64))

(declare-fun lt!204611 () V!17211)

(declare-fun lt!204612 () ListLongMap!6911)

(declare-fun lt!204615 () (_ BitVec 64))

(assert (=> b!450973 (not (contains!2483 (+!1572 lt!204612 (tuple2!8009 lt!204615 lt!204611)) lt!204610))))

(declare-fun addStillNotContains!146 (ListLongMap!6911 (_ BitVec 64) V!17211 (_ BitVec 64)) Unit!13163)

(assert (=> b!450973 (= lt!204614 (addStillNotContains!146 lt!204612 lt!204615 lt!204611 lt!204610))))

(assert (=> b!450973 (= lt!204610 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!450973 (= lt!204611 (get!6610 (select (arr!13425 (ite c!55947 lt!204563 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!450973 (= lt!204615 (select (arr!13424 (ite c!55947 lt!204560 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!450973 (= lt!204612 call!29806)))

(assert (=> b!450973 (= e!264164 (+!1572 call!29806 (tuple2!8009 (select (arr!13424 (ite c!55947 lt!204560 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6610 (select (arr!13425 (ite c!55947 lt!204563 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!450974 () Bool)

(assert (=> b!450974 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 lt!204560 _keys!709))))))

(assert (=> b!450974 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13778 (ite c!55947 lt!204563 _values!549))))))

(declare-fun apply!312 (ListLongMap!6911 (_ BitVec 64)) V!17211)

(assert (=> b!450974 (= e!264162 (= (apply!312 lt!204609 (select (arr!13424 (ite c!55947 lt!204560 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6610 (select (arr!13425 (ite c!55947 lt!204563 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!450975 () Bool)

(assert (=> b!450975 (= e!264163 e!264164)))

(declare-fun c!55964 () Bool)

(assert (=> b!450975 (= c!55964 (validKeyInArray!0 (select (arr!13424 (ite c!55947 lt!204560 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!450976 () Bool)

(assert (=> b!450976 (= e!264161 (= lt!204609 (getCurrentListMapNoExtraKeys!1668 (ite c!55947 lt!204560 _keys!709) (ite c!55947 lt!204563 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!450977 () Bool)

(declare-fun res!268538 () Bool)

(assert (=> b!450977 (=> (not res!268538) (not e!264159))))

(assert (=> b!450977 (= res!268538 (not (contains!2483 lt!204609 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!450978 () Bool)

(assert (=> b!450978 (= e!264163 (ListLongMap!6912 Nil!8068))))

(assert (= (and d!74061 c!55965) b!450978))

(assert (= (and d!74061 (not c!55965)) b!450975))

(assert (= (and b!450975 c!55964) b!450973))

(assert (= (and b!450975 (not c!55964)) b!450968))

(assert (= (or b!450973 b!450968) bm!29803))

(assert (= (and d!74061 res!268537) b!450977))

(assert (= (and b!450977 res!268538) b!450967))

(assert (= (and b!450967 res!268536) b!450969))

(assert (= (and b!450967 c!55962) b!450971))

(assert (= (and b!450967 (not c!55962)) b!450970))

(assert (= (and b!450971 res!268539) b!450974))

(assert (= (and b!450970 c!55963) b!450976))

(assert (= (and b!450970 (not c!55963)) b!450972))

(declare-fun b_lambda!9467 () Bool)

(assert (=> (not b_lambda!9467) (not b!450973)))

(assert (=> b!450973 t!13825))

(declare-fun b_and!18735 () Bool)

(assert (= b_and!18725 (and (=> t!13825 result!6969) b_and!18735)))

(declare-fun b_lambda!9469 () Bool)

(assert (=> (not b_lambda!9469) (not b!450974)))

(assert (=> b!450974 t!13825))

(declare-fun b_and!18737 () Bool)

(assert (= b_and!18735 (and (=> t!13825 result!6969) b_and!18737)))

(declare-fun m!434251 () Bool)

(assert (=> b!450975 m!434251))

(assert (=> b!450975 m!434251))

(declare-fun m!434253 () Bool)

(assert (=> b!450975 m!434253))

(assert (=> b!450974 m!434251))

(declare-fun m!434255 () Bool)

(assert (=> b!450974 m!434255))

(declare-fun m!434257 () Bool)

(assert (=> b!450974 m!434257))

(assert (=> b!450974 m!434135))

(assert (=> b!450974 m!434257))

(assert (=> b!450974 m!434135))

(declare-fun m!434259 () Bool)

(assert (=> b!450974 m!434259))

(assert (=> b!450974 m!434251))

(declare-fun m!434261 () Bool)

(assert (=> b!450976 m!434261))

(declare-fun m!434263 () Bool)

(assert (=> d!74061 m!434263))

(assert (=> d!74061 m!434113))

(assert (=> b!450969 m!434251))

(assert (=> b!450969 m!434251))

(assert (=> b!450969 m!434253))

(assert (=> b!450971 m!434251))

(assert (=> b!450971 m!434251))

(declare-fun m!434265 () Bool)

(assert (=> b!450971 m!434265))

(declare-fun m!434267 () Bool)

(assert (=> b!450973 m!434267))

(assert (=> b!450973 m!434257))

(assert (=> b!450973 m!434135))

(assert (=> b!450973 m!434259))

(assert (=> b!450973 m!434251))

(declare-fun m!434269 () Bool)

(assert (=> b!450973 m!434269))

(declare-fun m!434271 () Bool)

(assert (=> b!450973 m!434271))

(assert (=> b!450973 m!434269))

(assert (=> b!450973 m!434257))

(declare-fun m!434273 () Bool)

(assert (=> b!450973 m!434273))

(assert (=> b!450973 m!434135))

(declare-fun m!434275 () Bool)

(assert (=> b!450977 m!434275))

(declare-fun m!434277 () Bool)

(assert (=> b!450972 m!434277))

(assert (=> bm!29803 m!434261))

(assert (=> bm!29788 d!74061))

(declare-fun b!450987 () Bool)

(declare-fun e!264171 () Bool)

(declare-fun call!29809 () Bool)

(assert (=> b!450987 (= e!264171 call!29809)))

(declare-fun b!450988 () Bool)

(declare-fun e!264172 () Bool)

(assert (=> b!450988 (= e!264171 e!264172)))

(declare-fun lt!204622 () (_ BitVec 64))

(assert (=> b!450988 (= lt!204622 (select (arr!13424 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!204623 () Unit!13163)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!27957 (_ BitVec 64) (_ BitVec 32)) Unit!13163)

(assert (=> b!450988 (= lt!204623 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!204622 #b00000000000000000000000000000000))))

(assert (=> b!450988 (arrayContainsKey!0 _keys!709 lt!204622 #b00000000000000000000000000000000)))

(declare-fun lt!204624 () Unit!13163)

(assert (=> b!450988 (= lt!204624 lt!204623)))

(declare-fun res!268544 () Bool)

(declare-datatypes ((SeekEntryResult!3526 0))(
  ( (MissingZero!3526 (index!16283 (_ BitVec 32))) (Found!3526 (index!16284 (_ BitVec 32))) (Intermediate!3526 (undefined!4338 Bool) (index!16285 (_ BitVec 32)) (x!42299 (_ BitVec 32))) (Undefined!3526) (MissingVacant!3526 (index!16286 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!27957 (_ BitVec 32)) SeekEntryResult!3526)

(assert (=> b!450988 (= res!268544 (= (seekEntryOrOpen!0 (select (arr!13424 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3526 #b00000000000000000000000000000000)))))

(assert (=> b!450988 (=> (not res!268544) (not e!264172))))

(declare-fun b!450989 () Bool)

(declare-fun e!264173 () Bool)

(assert (=> b!450989 (= e!264173 e!264171)))

(declare-fun c!55968 () Bool)

(assert (=> b!450989 (= c!55968 (validKeyInArray!0 (select (arr!13424 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29806 () Bool)

(assert (=> bm!29806 (= call!29809 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!450990 () Bool)

(assert (=> b!450990 (= e!264172 call!29809)))

(declare-fun d!74063 () Bool)

(declare-fun res!268545 () Bool)

(assert (=> d!74063 (=> res!268545 e!264173)))

(assert (=> d!74063 (= res!268545 (bvsge #b00000000000000000000000000000000 (size!13777 _keys!709)))))

(assert (=> d!74063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!264173)))

(assert (= (and d!74063 (not res!268545)) b!450989))

(assert (= (and b!450989 c!55968) b!450988))

(assert (= (and b!450989 (not c!55968)) b!450987))

(assert (= (and b!450988 res!268544) b!450990))

(assert (= (or b!450990 b!450987) bm!29806))

(declare-fun m!434279 () Bool)

(assert (=> b!450988 m!434279))

(declare-fun m!434281 () Bool)

(assert (=> b!450988 m!434281))

(declare-fun m!434283 () Bool)

(assert (=> b!450988 m!434283))

(assert (=> b!450988 m!434279))

(declare-fun m!434285 () Bool)

(assert (=> b!450988 m!434285))

(assert (=> b!450989 m!434279))

(assert (=> b!450989 m!434279))

(declare-fun m!434287 () Bool)

(assert (=> b!450989 m!434287))

(declare-fun m!434289 () Bool)

(assert (=> bm!29806 m!434289))

(assert (=> b!450808 d!74063))

(declare-fun d!74065 () Bool)

(declare-fun e!264175 () Bool)

(assert (=> d!74065 e!264175))

(declare-fun res!268547 () Bool)

(assert (=> d!74065 (=> (not res!268547) (not e!264175))))

(declare-fun lt!204625 () ListLongMap!6911)

(assert (=> d!74065 (= res!268547 (not (contains!2483 lt!204625 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264179 () ListLongMap!6911)

(assert (=> d!74065 (= lt!204625 e!264179)))

(declare-fun c!55972 () Bool)

(assert (=> d!74065 (= c!55972 (bvsge from!863 (size!13777 lt!204560)))))

(assert (=> d!74065 (validMask!0 mask!1025)))

(assert (=> d!74065 (= (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!204625)))

(declare-fun b!450991 () Bool)

(declare-fun e!264176 () Bool)

(assert (=> b!450991 (= e!264175 e!264176)))

(declare-fun c!55969 () Bool)

(declare-fun e!264174 () Bool)

(assert (=> b!450991 (= c!55969 e!264174)))

(declare-fun res!268546 () Bool)

(assert (=> b!450991 (=> (not res!268546) (not e!264174))))

(assert (=> b!450991 (= res!268546 (bvslt from!863 (size!13777 lt!204560)))))

(declare-fun b!450992 () Bool)

(declare-fun e!264180 () ListLongMap!6911)

(declare-fun call!29810 () ListLongMap!6911)

(assert (=> b!450992 (= e!264180 call!29810)))

(declare-fun b!450993 () Bool)

(assert (=> b!450993 (= e!264174 (validKeyInArray!0 (select (arr!13424 lt!204560) from!863)))))

(assert (=> b!450993 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!450994 () Bool)

(declare-fun e!264177 () Bool)

(assert (=> b!450994 (= e!264176 e!264177)))

(declare-fun c!55970 () Bool)

(assert (=> b!450994 (= c!55970 (bvslt from!863 (size!13777 lt!204560)))))

(declare-fun bm!29807 () Bool)

(assert (=> bm!29807 (= call!29810 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!450995 () Bool)

(declare-fun e!264178 () Bool)

(assert (=> b!450995 (= e!264176 e!264178)))

(assert (=> b!450995 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13777 lt!204560)))))

(declare-fun res!268549 () Bool)

(assert (=> b!450995 (= res!268549 (contains!2483 lt!204625 (select (arr!13424 lt!204560) from!863)))))

(assert (=> b!450995 (=> (not res!268549) (not e!264178))))

(declare-fun b!450996 () Bool)

(assert (=> b!450996 (= e!264177 (isEmpty!562 lt!204625))))

(declare-fun b!450997 () Bool)

(declare-fun lt!204629 () Unit!13163)

(declare-fun lt!204630 () Unit!13163)

(assert (=> b!450997 (= lt!204629 lt!204630)))

(declare-fun lt!204626 () (_ BitVec 64))

(declare-fun lt!204631 () (_ BitVec 64))

(declare-fun lt!204627 () V!17211)

(declare-fun lt!204628 () ListLongMap!6911)

(assert (=> b!450997 (not (contains!2483 (+!1572 lt!204628 (tuple2!8009 lt!204631 lt!204627)) lt!204626))))

(assert (=> b!450997 (= lt!204630 (addStillNotContains!146 lt!204628 lt!204631 lt!204627 lt!204626))))

(assert (=> b!450997 (= lt!204626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!450997 (= lt!204627 (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!450997 (= lt!204631 (select (arr!13424 lt!204560) from!863))))

(assert (=> b!450997 (= lt!204628 call!29810)))

(assert (=> b!450997 (= e!264180 (+!1572 call!29810 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!450998 () Bool)

(assert (=> b!450998 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13777 lt!204560)))))

(assert (=> b!450998 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13778 lt!204563)))))

(assert (=> b!450998 (= e!264178 (= (apply!312 lt!204625 (select (arr!13424 lt!204560) from!863)) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!450999 () Bool)

(assert (=> b!450999 (= e!264179 e!264180)))

(declare-fun c!55971 () Bool)

(assert (=> b!450999 (= c!55971 (validKeyInArray!0 (select (arr!13424 lt!204560) from!863)))))

(declare-fun b!451000 () Bool)

(assert (=> b!451000 (= e!264177 (= lt!204625 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451001 () Bool)

(declare-fun res!268548 () Bool)

(assert (=> b!451001 (=> (not res!268548) (not e!264175))))

(assert (=> b!451001 (= res!268548 (not (contains!2483 lt!204625 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451002 () Bool)

(assert (=> b!451002 (= e!264179 (ListLongMap!6912 Nil!8068))))

(assert (= (and d!74065 c!55972) b!451002))

(assert (= (and d!74065 (not c!55972)) b!450999))

(assert (= (and b!450999 c!55971) b!450997))

(assert (= (and b!450999 (not c!55971)) b!450992))

(assert (= (or b!450997 b!450992) bm!29807))

(assert (= (and d!74065 res!268547) b!451001))

(assert (= (and b!451001 res!268548) b!450991))

(assert (= (and b!450991 res!268546) b!450993))

(assert (= (and b!450991 c!55969) b!450995))

(assert (= (and b!450991 (not c!55969)) b!450994))

(assert (= (and b!450995 res!268549) b!450998))

(assert (= (and b!450994 c!55970) b!451000))

(assert (= (and b!450994 (not c!55970)) b!450996))

(declare-fun b_lambda!9471 () Bool)

(assert (=> (not b_lambda!9471) (not b!450997)))

(assert (=> b!450997 t!13825))

(declare-fun b_and!18739 () Bool)

(assert (= b_and!18737 (and (=> t!13825 result!6969) b_and!18739)))

(declare-fun b_lambda!9473 () Bool)

(assert (=> (not b_lambda!9473) (not b!450998)))

(assert (=> b!450998 t!13825))

(declare-fun b_and!18741 () Bool)

(assert (= b_and!18739 (and (=> t!13825 result!6969) b_and!18741)))

(assert (=> b!450999 m!434133))

(assert (=> b!450999 m!434133))

(declare-fun m!434291 () Bool)

(assert (=> b!450999 m!434291))

(assert (=> b!450998 m!434133))

(declare-fun m!434293 () Bool)

(assert (=> b!450998 m!434293))

(assert (=> b!450998 m!434131))

(assert (=> b!450998 m!434135))

(assert (=> b!450998 m!434131))

(assert (=> b!450998 m!434135))

(assert (=> b!450998 m!434137))

(assert (=> b!450998 m!434133))

(declare-fun m!434295 () Bool)

(assert (=> b!451000 m!434295))

(declare-fun m!434297 () Bool)

(assert (=> d!74065 m!434297))

(assert (=> d!74065 m!434113))

(assert (=> b!450993 m!434133))

(assert (=> b!450993 m!434133))

(assert (=> b!450993 m!434291))

(assert (=> b!450995 m!434133))

(assert (=> b!450995 m!434133))

(declare-fun m!434299 () Bool)

(assert (=> b!450995 m!434299))

(declare-fun m!434301 () Bool)

(assert (=> b!450997 m!434301))

(assert (=> b!450997 m!434131))

(assert (=> b!450997 m!434135))

(assert (=> b!450997 m!434137))

(assert (=> b!450997 m!434133))

(declare-fun m!434303 () Bool)

(assert (=> b!450997 m!434303))

(declare-fun m!434305 () Bool)

(assert (=> b!450997 m!434305))

(assert (=> b!450997 m!434303))

(assert (=> b!450997 m!434131))

(declare-fun m!434307 () Bool)

(assert (=> b!450997 m!434307))

(assert (=> b!450997 m!434135))

(declare-fun m!434309 () Bool)

(assert (=> b!451001 m!434309))

(declare-fun m!434311 () Bool)

(assert (=> b!450996 m!434311))

(assert (=> bm!29807 m!434295))

(assert (=> b!450817 d!74065))

(declare-fun d!74067 () Bool)

(declare-fun e!264182 () Bool)

(assert (=> d!74067 e!264182))

(declare-fun res!268551 () Bool)

(assert (=> d!74067 (=> (not res!268551) (not e!264182))))

(declare-fun lt!204632 () ListLongMap!6911)

(assert (=> d!74067 (= res!268551 (not (contains!2483 lt!204632 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264186 () ListLongMap!6911)

(assert (=> d!74067 (= lt!204632 e!264186)))

(declare-fun c!55976 () Bool)

(assert (=> d!74067 (= c!55976 (bvsge from!863 (size!13777 _keys!709)))))

(assert (=> d!74067 (validMask!0 mask!1025)))

(assert (=> d!74067 (= (getCurrentListMapNoExtraKeys!1668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!204632)))

(declare-fun b!451003 () Bool)

(declare-fun e!264183 () Bool)

(assert (=> b!451003 (= e!264182 e!264183)))

(declare-fun c!55973 () Bool)

(declare-fun e!264181 () Bool)

(assert (=> b!451003 (= c!55973 e!264181)))

(declare-fun res!268550 () Bool)

(assert (=> b!451003 (=> (not res!268550) (not e!264181))))

(assert (=> b!451003 (= res!268550 (bvslt from!863 (size!13777 _keys!709)))))

(declare-fun b!451004 () Bool)

(declare-fun e!264187 () ListLongMap!6911)

(declare-fun call!29811 () ListLongMap!6911)

(assert (=> b!451004 (= e!264187 call!29811)))

(declare-fun b!451005 () Bool)

(assert (=> b!451005 (= e!264181 (validKeyInArray!0 (select (arr!13424 _keys!709) from!863)))))

(assert (=> b!451005 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!451006 () Bool)

(declare-fun e!264184 () Bool)

(assert (=> b!451006 (= e!264183 e!264184)))

(declare-fun c!55974 () Bool)

(assert (=> b!451006 (= c!55974 (bvslt from!863 (size!13777 _keys!709)))))

(declare-fun bm!29808 () Bool)

(assert (=> bm!29808 (= call!29811 (getCurrentListMapNoExtraKeys!1668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451007 () Bool)

(declare-fun e!264185 () Bool)

(assert (=> b!451007 (= e!264183 e!264185)))

(assert (=> b!451007 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13777 _keys!709)))))

(declare-fun res!268553 () Bool)

(assert (=> b!451007 (= res!268553 (contains!2483 lt!204632 (select (arr!13424 _keys!709) from!863)))))

(assert (=> b!451007 (=> (not res!268553) (not e!264185))))

(declare-fun b!451008 () Bool)

(assert (=> b!451008 (= e!264184 (isEmpty!562 lt!204632))))

(declare-fun b!451009 () Bool)

(declare-fun lt!204636 () Unit!13163)

(declare-fun lt!204637 () Unit!13163)

(assert (=> b!451009 (= lt!204636 lt!204637)))

(declare-fun lt!204635 () ListLongMap!6911)

(declare-fun lt!204638 () (_ BitVec 64))

(declare-fun lt!204633 () (_ BitVec 64))

(declare-fun lt!204634 () V!17211)

(assert (=> b!451009 (not (contains!2483 (+!1572 lt!204635 (tuple2!8009 lt!204638 lt!204634)) lt!204633))))

(assert (=> b!451009 (= lt!204637 (addStillNotContains!146 lt!204635 lt!204638 lt!204634 lt!204633))))

(assert (=> b!451009 (= lt!204633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451009 (= lt!204634 (get!6610 (select (arr!13425 _values!549) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451009 (= lt!204638 (select (arr!13424 _keys!709) from!863))))

(assert (=> b!451009 (= lt!204635 call!29811)))

(assert (=> b!451009 (= e!264187 (+!1572 call!29811 (tuple2!8009 (select (arr!13424 _keys!709) from!863) (get!6610 (select (arr!13425 _values!549) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451010 () Bool)

(assert (=> b!451010 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13777 _keys!709)))))

(assert (=> b!451010 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13778 _values!549)))))

(assert (=> b!451010 (= e!264185 (= (apply!312 lt!204632 (select (arr!13424 _keys!709) from!863)) (get!6610 (select (arr!13425 _values!549) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451011 () Bool)

(assert (=> b!451011 (= e!264186 e!264187)))

(declare-fun c!55975 () Bool)

(assert (=> b!451011 (= c!55975 (validKeyInArray!0 (select (arr!13424 _keys!709) from!863)))))

(declare-fun b!451012 () Bool)

(assert (=> b!451012 (= e!264184 (= lt!204632 (getCurrentListMapNoExtraKeys!1668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451013 () Bool)

(declare-fun res!268552 () Bool)

(assert (=> b!451013 (=> (not res!268552) (not e!264182))))

(assert (=> b!451013 (= res!268552 (not (contains!2483 lt!204632 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451014 () Bool)

(assert (=> b!451014 (= e!264186 (ListLongMap!6912 Nil!8068))))

(assert (= (and d!74067 c!55976) b!451014))

(assert (= (and d!74067 (not c!55976)) b!451011))

(assert (= (and b!451011 c!55975) b!451009))

(assert (= (and b!451011 (not c!55975)) b!451004))

(assert (= (or b!451009 b!451004) bm!29808))

(assert (= (and d!74067 res!268551) b!451013))

(assert (= (and b!451013 res!268552) b!451003))

(assert (= (and b!451003 res!268550) b!451005))

(assert (= (and b!451003 c!55973) b!451007))

(assert (= (and b!451003 (not c!55973)) b!451006))

(assert (= (and b!451007 res!268553) b!451010))

(assert (= (and b!451006 c!55974) b!451012))

(assert (= (and b!451006 (not c!55974)) b!451008))

(declare-fun b_lambda!9475 () Bool)

(assert (=> (not b_lambda!9475) (not b!451009)))

(assert (=> b!451009 t!13825))

(declare-fun b_and!18743 () Bool)

(assert (= b_and!18741 (and (=> t!13825 result!6969) b_and!18743)))

(declare-fun b_lambda!9477 () Bool)

(assert (=> (not b_lambda!9477) (not b!451010)))

(assert (=> b!451010 t!13825))

(declare-fun b_and!18745 () Bool)

(assert (= b_and!18743 (and (=> t!13825 result!6969) b_and!18745)))

(assert (=> b!451011 m!434115))

(assert (=> b!451011 m!434115))

(assert (=> b!451011 m!434117))

(assert (=> b!451010 m!434115))

(declare-fun m!434313 () Bool)

(assert (=> b!451010 m!434313))

(declare-fun m!434315 () Bool)

(assert (=> b!451010 m!434315))

(assert (=> b!451010 m!434135))

(assert (=> b!451010 m!434315))

(assert (=> b!451010 m!434135))

(declare-fun m!434317 () Bool)

(assert (=> b!451010 m!434317))

(assert (=> b!451010 m!434115))

(declare-fun m!434319 () Bool)

(assert (=> b!451012 m!434319))

(declare-fun m!434321 () Bool)

(assert (=> d!74067 m!434321))

(assert (=> d!74067 m!434113))

(assert (=> b!451005 m!434115))

(assert (=> b!451005 m!434115))

(assert (=> b!451005 m!434117))

(assert (=> b!451007 m!434115))

(assert (=> b!451007 m!434115))

(declare-fun m!434323 () Bool)

(assert (=> b!451007 m!434323))

(declare-fun m!434325 () Bool)

(assert (=> b!451009 m!434325))

(assert (=> b!451009 m!434315))

(assert (=> b!451009 m!434135))

(assert (=> b!451009 m!434317))

(assert (=> b!451009 m!434115))

(declare-fun m!434327 () Bool)

(assert (=> b!451009 m!434327))

(declare-fun m!434329 () Bool)

(assert (=> b!451009 m!434329))

(assert (=> b!451009 m!434327))

(assert (=> b!451009 m!434315))

(declare-fun m!434331 () Bool)

(assert (=> b!451009 m!434331))

(assert (=> b!451009 m!434135))

(declare-fun m!434333 () Bool)

(assert (=> b!451013 m!434333))

(declare-fun m!434335 () Bool)

(assert (=> b!451008 m!434335))

(assert (=> bm!29808 m!434319))

(assert (=> b!450817 d!74067))

(declare-fun d!74069 () Bool)

(assert (=> d!74069 (= (array_inv!9784 _values!549) (bvsge (size!13778 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40716 d!74069))

(declare-fun d!74071 () Bool)

(assert (=> d!74071 (= (array_inv!9785 _keys!709) (bvsge (size!13777 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40716 d!74071))

(declare-fun d!74073 () Bool)

(declare-fun e!264190 () Bool)

(assert (=> d!74073 e!264190))

(declare-fun res!268558 () Bool)

(assert (=> d!74073 (=> (not res!268558) (not e!264190))))

(declare-fun lt!204649 () ListLongMap!6911)

(assert (=> d!74073 (= res!268558 (contains!2483 lt!204649 (_1!4015 (tuple2!8009 k0!794 v!412))))))

(declare-fun lt!204647 () List!8071)

(assert (=> d!74073 (= lt!204649 (ListLongMap!6912 lt!204647))))

(declare-fun lt!204650 () Unit!13163)

(declare-fun lt!204648 () Unit!13163)

(assert (=> d!74073 (= lt!204650 lt!204648)))

(declare-datatypes ((Option!373 0))(
  ( (Some!372 (v!8339 V!17211)) (None!371) )
))
(declare-fun getValueByKey!367 (List!8071 (_ BitVec 64)) Option!373)

(assert (=> d!74073 (= (getValueByKey!367 lt!204647 (_1!4015 (tuple2!8009 k0!794 v!412))) (Some!372 (_2!4015 (tuple2!8009 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!192 (List!8071 (_ BitVec 64) V!17211) Unit!13163)

(assert (=> d!74073 (= lt!204648 (lemmaContainsTupThenGetReturnValue!192 lt!204647 (_1!4015 (tuple2!8009 k0!794 v!412)) (_2!4015 (tuple2!8009 k0!794 v!412))))))

(declare-fun insertStrictlySorted!195 (List!8071 (_ BitVec 64) V!17211) List!8071)

(assert (=> d!74073 (= lt!204647 (insertStrictlySorted!195 (toList!3471 call!29791) (_1!4015 (tuple2!8009 k0!794 v!412)) (_2!4015 (tuple2!8009 k0!794 v!412))))))

(assert (=> d!74073 (= (+!1572 call!29791 (tuple2!8009 k0!794 v!412)) lt!204649)))

(declare-fun b!451019 () Bool)

(declare-fun res!268559 () Bool)

(assert (=> b!451019 (=> (not res!268559) (not e!264190))))

(assert (=> b!451019 (= res!268559 (= (getValueByKey!367 (toList!3471 lt!204649) (_1!4015 (tuple2!8009 k0!794 v!412))) (Some!372 (_2!4015 (tuple2!8009 k0!794 v!412)))))))

(declare-fun b!451020 () Bool)

(declare-fun contains!2484 (List!8071 tuple2!8008) Bool)

(assert (=> b!451020 (= e!264190 (contains!2484 (toList!3471 lt!204649) (tuple2!8009 k0!794 v!412)))))

(assert (= (and d!74073 res!268558) b!451019))

(assert (= (and b!451019 res!268559) b!451020))

(declare-fun m!434337 () Bool)

(assert (=> d!74073 m!434337))

(declare-fun m!434339 () Bool)

(assert (=> d!74073 m!434339))

(declare-fun m!434341 () Bool)

(assert (=> d!74073 m!434341))

(declare-fun m!434343 () Bool)

(assert (=> d!74073 m!434343))

(declare-fun m!434345 () Bool)

(assert (=> b!451019 m!434345))

(declare-fun m!434347 () Bool)

(assert (=> b!451020 m!434347))

(assert (=> b!450818 d!74073))

(declare-fun b!451021 () Bool)

(declare-fun e!264191 () Bool)

(declare-fun call!29812 () Bool)

(assert (=> b!451021 (= e!264191 call!29812)))

(declare-fun b!451022 () Bool)

(declare-fun e!264192 () Bool)

(assert (=> b!451022 (= e!264191 e!264192)))

(declare-fun lt!204651 () (_ BitVec 64))

(assert (=> b!451022 (= lt!204651 (select (arr!13424 lt!204560) #b00000000000000000000000000000000))))

(declare-fun lt!204652 () Unit!13163)

(assert (=> b!451022 (= lt!204652 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!204560 lt!204651 #b00000000000000000000000000000000))))

(assert (=> b!451022 (arrayContainsKey!0 lt!204560 lt!204651 #b00000000000000000000000000000000)))

(declare-fun lt!204653 () Unit!13163)

(assert (=> b!451022 (= lt!204653 lt!204652)))

(declare-fun res!268560 () Bool)

(assert (=> b!451022 (= res!268560 (= (seekEntryOrOpen!0 (select (arr!13424 lt!204560) #b00000000000000000000000000000000) lt!204560 mask!1025) (Found!3526 #b00000000000000000000000000000000)))))

(assert (=> b!451022 (=> (not res!268560) (not e!264192))))

(declare-fun b!451023 () Bool)

(declare-fun e!264193 () Bool)

(assert (=> b!451023 (= e!264193 e!264191)))

(declare-fun c!55977 () Bool)

(assert (=> b!451023 (= c!55977 (validKeyInArray!0 (select (arr!13424 lt!204560) #b00000000000000000000000000000000)))))

(declare-fun bm!29809 () Bool)

(assert (=> bm!29809 (= call!29812 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!204560 mask!1025))))

(declare-fun b!451024 () Bool)

(assert (=> b!451024 (= e!264192 call!29812)))

(declare-fun d!74075 () Bool)

(declare-fun res!268561 () Bool)

(assert (=> d!74075 (=> res!268561 e!264193)))

(assert (=> d!74075 (= res!268561 (bvsge #b00000000000000000000000000000000 (size!13777 lt!204560)))))

(assert (=> d!74075 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204560 mask!1025) e!264193)))

(assert (= (and d!74075 (not res!268561)) b!451023))

(assert (= (and b!451023 c!55977) b!451022))

(assert (= (and b!451023 (not c!55977)) b!451021))

(assert (= (and b!451022 res!268560) b!451024))

(assert (= (or b!451024 b!451021) bm!29809))

(declare-fun m!434349 () Bool)

(assert (=> b!451022 m!434349))

(declare-fun m!434351 () Bool)

(assert (=> b!451022 m!434351))

(declare-fun m!434353 () Bool)

(assert (=> b!451022 m!434353))

(assert (=> b!451022 m!434349))

(declare-fun m!434355 () Bool)

(assert (=> b!451022 m!434355))

(assert (=> b!451023 m!434349))

(assert (=> b!451023 m!434349))

(declare-fun m!434357 () Bool)

(assert (=> b!451023 m!434357))

(declare-fun m!434359 () Bool)

(assert (=> bm!29809 m!434359))

(assert (=> b!450810 d!74075))

(declare-fun d!74077 () Bool)

(declare-fun res!268570 () Bool)

(declare-fun e!264204 () Bool)

(assert (=> d!74077 (=> res!268570 e!264204)))

(assert (=> d!74077 (= res!268570 (bvsge #b00000000000000000000000000000000 (size!13777 lt!204560)))))

(assert (=> d!74077 (= (arrayNoDuplicates!0 lt!204560 #b00000000000000000000000000000000 Nil!8069) e!264204)))

(declare-fun b!451035 () Bool)

(declare-fun e!264205 () Bool)

(declare-fun call!29815 () Bool)

(assert (=> b!451035 (= e!264205 call!29815)))

(declare-fun b!451036 () Bool)

(declare-fun e!264202 () Bool)

(declare-fun contains!2485 (List!8072 (_ BitVec 64)) Bool)

(assert (=> b!451036 (= e!264202 (contains!2485 Nil!8069 (select (arr!13424 lt!204560) #b00000000000000000000000000000000)))))

(declare-fun b!451037 () Bool)

(assert (=> b!451037 (= e!264205 call!29815)))

(declare-fun b!451038 () Bool)

(declare-fun e!264203 () Bool)

(assert (=> b!451038 (= e!264203 e!264205)))

(declare-fun c!55980 () Bool)

(assert (=> b!451038 (= c!55980 (validKeyInArray!0 (select (arr!13424 lt!204560) #b00000000000000000000000000000000)))))

(declare-fun bm!29812 () Bool)

(assert (=> bm!29812 (= call!29815 (arrayNoDuplicates!0 lt!204560 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55980 (Cons!8068 (select (arr!13424 lt!204560) #b00000000000000000000000000000000) Nil!8069) Nil!8069)))))

(declare-fun b!451039 () Bool)

(assert (=> b!451039 (= e!264204 e!264203)))

(declare-fun res!268568 () Bool)

(assert (=> b!451039 (=> (not res!268568) (not e!264203))))

(assert (=> b!451039 (= res!268568 (not e!264202))))

(declare-fun res!268569 () Bool)

(assert (=> b!451039 (=> (not res!268569) (not e!264202))))

(assert (=> b!451039 (= res!268569 (validKeyInArray!0 (select (arr!13424 lt!204560) #b00000000000000000000000000000000)))))

(assert (= (and d!74077 (not res!268570)) b!451039))

(assert (= (and b!451039 res!268569) b!451036))

(assert (= (and b!451039 res!268568) b!451038))

(assert (= (and b!451038 c!55980) b!451035))

(assert (= (and b!451038 (not c!55980)) b!451037))

(assert (= (or b!451035 b!451037) bm!29812))

(assert (=> b!451036 m!434349))

(assert (=> b!451036 m!434349))

(declare-fun m!434361 () Bool)

(assert (=> b!451036 m!434361))

(assert (=> b!451038 m!434349))

(assert (=> b!451038 m!434349))

(assert (=> b!451038 m!434357))

(assert (=> bm!29812 m!434349))

(declare-fun m!434363 () Bool)

(assert (=> bm!29812 m!434363))

(assert (=> b!451039 m!434349))

(assert (=> b!451039 m!434349))

(assert (=> b!451039 m!434357))

(assert (=> b!450806 d!74077))

(declare-fun d!74079 () Bool)

(declare-fun res!268573 () Bool)

(declare-fun e!264208 () Bool)

(assert (=> d!74079 (=> res!268573 e!264208)))

(assert (=> d!74079 (= res!268573 (bvsge #b00000000000000000000000000000000 (size!13777 _keys!709)))))

(assert (=> d!74079 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8069) e!264208)))

(declare-fun b!451040 () Bool)

(declare-fun e!264209 () Bool)

(declare-fun call!29816 () Bool)

(assert (=> b!451040 (= e!264209 call!29816)))

(declare-fun b!451041 () Bool)

(declare-fun e!264206 () Bool)

(assert (=> b!451041 (= e!264206 (contains!2485 Nil!8069 (select (arr!13424 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!451042 () Bool)

(assert (=> b!451042 (= e!264209 call!29816)))

(declare-fun b!451043 () Bool)

(declare-fun e!264207 () Bool)

(assert (=> b!451043 (= e!264207 e!264209)))

(declare-fun c!55981 () Bool)

(assert (=> b!451043 (= c!55981 (validKeyInArray!0 (select (arr!13424 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!29813 () Bool)

(assert (=> bm!29813 (= call!29816 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!55981 (Cons!8068 (select (arr!13424 _keys!709) #b00000000000000000000000000000000) Nil!8069) Nil!8069)))))

(declare-fun b!451044 () Bool)

(assert (=> b!451044 (= e!264208 e!264207)))

(declare-fun res!268571 () Bool)

(assert (=> b!451044 (=> (not res!268571) (not e!264207))))

(assert (=> b!451044 (= res!268571 (not e!264206))))

(declare-fun res!268572 () Bool)

(assert (=> b!451044 (=> (not res!268572) (not e!264206))))

(assert (=> b!451044 (= res!268572 (validKeyInArray!0 (select (arr!13424 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74079 (not res!268573)) b!451044))

(assert (= (and b!451044 res!268572) b!451041))

(assert (= (and b!451044 res!268571) b!451043))

(assert (= (and b!451043 c!55981) b!451040))

(assert (= (and b!451043 (not c!55981)) b!451042))

(assert (= (or b!451040 b!451042) bm!29813))

(assert (=> b!451041 m!434279))

(assert (=> b!451041 m!434279))

(declare-fun m!434365 () Bool)

(assert (=> b!451041 m!434365))

(assert (=> b!451043 m!434279))

(assert (=> b!451043 m!434279))

(assert (=> b!451043 m!434287))

(assert (=> bm!29813 m!434279))

(declare-fun m!434367 () Bool)

(assert (=> bm!29813 m!434367))

(assert (=> b!451044 m!434279))

(assert (=> b!451044 m!434279))

(assert (=> b!451044 m!434287))

(assert (=> b!450807 d!74079))

(declare-fun d!74081 () Bool)

(assert (=> d!74081 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!450821 d!74081))

(declare-fun d!74083 () Bool)

(declare-fun e!264211 () Bool)

(assert (=> d!74083 e!264211))

(declare-fun res!268575 () Bool)

(assert (=> d!74083 (=> (not res!268575) (not e!264211))))

(declare-fun lt!204654 () ListLongMap!6911)

(assert (=> d!74083 (= res!268575 (not (contains!2483 lt!204654 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264215 () ListLongMap!6911)

(assert (=> d!74083 (= lt!204654 e!264215)))

(declare-fun c!55985 () Bool)

(assert (=> d!74083 (= c!55985 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 _keys!709 lt!204560))))))

(assert (=> d!74083 (validMask!0 mask!1025)))

(assert (=> d!74083 (= (getCurrentListMapNoExtraKeys!1668 (ite c!55947 _keys!709 lt!204560) (ite c!55947 _values!549 lt!204563) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204654)))

(declare-fun b!451045 () Bool)

(declare-fun e!264212 () Bool)

(assert (=> b!451045 (= e!264211 e!264212)))

(declare-fun c!55982 () Bool)

(declare-fun e!264210 () Bool)

(assert (=> b!451045 (= c!55982 e!264210)))

(declare-fun res!268574 () Bool)

(assert (=> b!451045 (=> (not res!268574) (not e!264210))))

(assert (=> b!451045 (= res!268574 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 _keys!709 lt!204560))))))

(declare-fun b!451046 () Bool)

(declare-fun e!264216 () ListLongMap!6911)

(declare-fun call!29817 () ListLongMap!6911)

(assert (=> b!451046 (= e!264216 call!29817)))

(declare-fun b!451047 () Bool)

(assert (=> b!451047 (= e!264210 (validKeyInArray!0 (select (arr!13424 (ite c!55947 _keys!709 lt!204560)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451047 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!451048 () Bool)

(declare-fun e!264213 () Bool)

(assert (=> b!451048 (= e!264212 e!264213)))

(declare-fun c!55983 () Bool)

(assert (=> b!451048 (= c!55983 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 _keys!709 lt!204560))))))

(declare-fun bm!29814 () Bool)

(assert (=> bm!29814 (= call!29817 (getCurrentListMapNoExtraKeys!1668 (ite c!55947 _keys!709 lt!204560) (ite c!55947 _values!549 lt!204563) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451049 () Bool)

(declare-fun e!264214 () Bool)

(assert (=> b!451049 (= e!264212 e!264214)))

(assert (=> b!451049 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 _keys!709 lt!204560))))))

(declare-fun res!268577 () Bool)

(assert (=> b!451049 (= res!268577 (contains!2483 lt!204654 (select (arr!13424 (ite c!55947 _keys!709 lt!204560)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451049 (=> (not res!268577) (not e!264214))))

(declare-fun b!451050 () Bool)

(assert (=> b!451050 (= e!264213 (isEmpty!562 lt!204654))))

(declare-fun b!451051 () Bool)

(declare-fun lt!204658 () Unit!13163)

(declare-fun lt!204659 () Unit!13163)

(assert (=> b!451051 (= lt!204658 lt!204659)))

(declare-fun lt!204655 () (_ BitVec 64))

(declare-fun lt!204657 () ListLongMap!6911)

(declare-fun lt!204656 () V!17211)

(declare-fun lt!204660 () (_ BitVec 64))

(assert (=> b!451051 (not (contains!2483 (+!1572 lt!204657 (tuple2!8009 lt!204660 lt!204656)) lt!204655))))

(assert (=> b!451051 (= lt!204659 (addStillNotContains!146 lt!204657 lt!204660 lt!204656 lt!204655))))

(assert (=> b!451051 (= lt!204655 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451051 (= lt!204656 (get!6610 (select (arr!13425 (ite c!55947 _values!549 lt!204563)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451051 (= lt!204660 (select (arr!13424 (ite c!55947 _keys!709 lt!204560)) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451051 (= lt!204657 call!29817)))

(assert (=> b!451051 (= e!264216 (+!1572 call!29817 (tuple2!8009 (select (arr!13424 (ite c!55947 _keys!709 lt!204560)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6610 (select (arr!13425 (ite c!55947 _values!549 lt!204563)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451052 () Bool)

(assert (=> b!451052 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 (ite c!55947 _keys!709 lt!204560))))))

(assert (=> b!451052 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13778 (ite c!55947 _values!549 lt!204563))))))

(assert (=> b!451052 (= e!264214 (= (apply!312 lt!204654 (select (arr!13424 (ite c!55947 _keys!709 lt!204560)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6610 (select (arr!13425 (ite c!55947 _values!549 lt!204563)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451053 () Bool)

(assert (=> b!451053 (= e!264215 e!264216)))

(declare-fun c!55984 () Bool)

(assert (=> b!451053 (= c!55984 (validKeyInArray!0 (select (arr!13424 (ite c!55947 _keys!709 lt!204560)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!451054 () Bool)

(assert (=> b!451054 (= e!264213 (= lt!204654 (getCurrentListMapNoExtraKeys!1668 (ite c!55947 _keys!709 lt!204560) (ite c!55947 _values!549 lt!204563) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451055 () Bool)

(declare-fun res!268576 () Bool)

(assert (=> b!451055 (=> (not res!268576) (not e!264211))))

(assert (=> b!451055 (= res!268576 (not (contains!2483 lt!204654 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451056 () Bool)

(assert (=> b!451056 (= e!264215 (ListLongMap!6912 Nil!8068))))

(assert (= (and d!74083 c!55985) b!451056))

(assert (= (and d!74083 (not c!55985)) b!451053))

(assert (= (and b!451053 c!55984) b!451051))

(assert (= (and b!451053 (not c!55984)) b!451046))

(assert (= (or b!451051 b!451046) bm!29814))

(assert (= (and d!74083 res!268575) b!451055))

(assert (= (and b!451055 res!268576) b!451045))

(assert (= (and b!451045 res!268574) b!451047))

(assert (= (and b!451045 c!55982) b!451049))

(assert (= (and b!451045 (not c!55982)) b!451048))

(assert (= (and b!451049 res!268577) b!451052))

(assert (= (and b!451048 c!55983) b!451054))

(assert (= (and b!451048 (not c!55983)) b!451050))

(declare-fun b_lambda!9479 () Bool)

(assert (=> (not b_lambda!9479) (not b!451051)))

(assert (=> b!451051 t!13825))

(declare-fun b_and!18747 () Bool)

(assert (= b_and!18745 (and (=> t!13825 result!6969) b_and!18747)))

(declare-fun b_lambda!9481 () Bool)

(assert (=> (not b_lambda!9481) (not b!451052)))

(assert (=> b!451052 t!13825))

(declare-fun b_and!18749 () Bool)

(assert (= b_and!18747 (and (=> t!13825 result!6969) b_and!18749)))

(declare-fun m!434369 () Bool)

(assert (=> b!451053 m!434369))

(assert (=> b!451053 m!434369))

(declare-fun m!434371 () Bool)

(assert (=> b!451053 m!434371))

(assert (=> b!451052 m!434369))

(declare-fun m!434373 () Bool)

(assert (=> b!451052 m!434373))

(declare-fun m!434375 () Bool)

(assert (=> b!451052 m!434375))

(assert (=> b!451052 m!434135))

(assert (=> b!451052 m!434375))

(assert (=> b!451052 m!434135))

(declare-fun m!434377 () Bool)

(assert (=> b!451052 m!434377))

(assert (=> b!451052 m!434369))

(declare-fun m!434379 () Bool)

(assert (=> b!451054 m!434379))

(declare-fun m!434381 () Bool)

(assert (=> d!74083 m!434381))

(assert (=> d!74083 m!434113))

(assert (=> b!451047 m!434369))

(assert (=> b!451047 m!434369))

(assert (=> b!451047 m!434371))

(assert (=> b!451049 m!434369))

(assert (=> b!451049 m!434369))

(declare-fun m!434383 () Bool)

(assert (=> b!451049 m!434383))

(declare-fun m!434385 () Bool)

(assert (=> b!451051 m!434385))

(assert (=> b!451051 m!434375))

(assert (=> b!451051 m!434135))

(assert (=> b!451051 m!434377))

(assert (=> b!451051 m!434369))

(declare-fun m!434387 () Bool)

(assert (=> b!451051 m!434387))

(declare-fun m!434389 () Bool)

(assert (=> b!451051 m!434389))

(assert (=> b!451051 m!434387))

(assert (=> b!451051 m!434375))

(declare-fun m!434391 () Bool)

(assert (=> b!451051 m!434391))

(assert (=> b!451051 m!434135))

(declare-fun m!434393 () Bool)

(assert (=> b!451055 m!434393))

(declare-fun m!434395 () Bool)

(assert (=> b!451050 m!434395))

(assert (=> bm!29814 m!434379))

(assert (=> bm!29787 d!74083))

(declare-fun d!74085 () Bool)

(declare-fun res!268582 () Bool)

(declare-fun e!264221 () Bool)

(assert (=> d!74085 (=> res!268582 e!264221)))

(assert (=> d!74085 (= res!268582 (= (select (arr!13424 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74085 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!264221)))

(declare-fun b!451061 () Bool)

(declare-fun e!264222 () Bool)

(assert (=> b!451061 (= e!264221 e!264222)))

(declare-fun res!268583 () Bool)

(assert (=> b!451061 (=> (not res!268583) (not e!264222))))

(assert (=> b!451061 (= res!268583 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13777 _keys!709)))))

(declare-fun b!451062 () Bool)

(assert (=> b!451062 (= e!264222 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74085 (not res!268582)) b!451061))

(assert (= (and b!451061 res!268583) b!451062))

(assert (=> d!74085 m!434279))

(declare-fun m!434397 () Bool)

(assert (=> b!451062 m!434397))

(assert (=> b!450822 d!74085))

(declare-fun d!74087 () Bool)

(declare-fun e!264223 () Bool)

(assert (=> d!74087 e!264223))

(declare-fun res!268584 () Bool)

(assert (=> d!74087 (=> (not res!268584) (not e!264223))))

(declare-fun lt!204663 () ListLongMap!6911)

(assert (=> d!74087 (= res!268584 (contains!2483 lt!204663 (_1!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!204661 () List!8071)

(assert (=> d!74087 (= lt!204663 (ListLongMap!6912 lt!204661))))

(declare-fun lt!204664 () Unit!13163)

(declare-fun lt!204662 () Unit!13163)

(assert (=> d!74087 (= lt!204664 lt!204662)))

(assert (=> d!74087 (= (getValueByKey!367 lt!204661 (_1!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!372 (_2!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74087 (= lt!204662 (lemmaContainsTupThenGetReturnValue!192 lt!204661 (_1!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74087 (= lt!204661 (insertStrictlySorted!195 (toList!3471 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557)) (_1!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74087 (= (+!1572 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!204663)))

(declare-fun b!451063 () Bool)

(declare-fun res!268585 () Bool)

(assert (=> b!451063 (=> (not res!268585) (not e!264223))))

(assert (=> b!451063 (= res!268585 (= (getValueByKey!367 (toList!3471 lt!204663) (_1!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!372 (_2!4015 (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!451064 () Bool)

(assert (=> b!451064 (= e!264223 (contains!2484 (toList!3471 lt!204663) (tuple2!8009 (select (arr!13424 lt!204560) from!863) (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74087 res!268584) b!451063))

(assert (= (and b!451063 res!268585) b!451064))

(declare-fun m!434399 () Bool)

(assert (=> d!74087 m!434399))

(declare-fun m!434401 () Bool)

(assert (=> d!74087 m!434401))

(declare-fun m!434403 () Bool)

(assert (=> d!74087 m!434403))

(declare-fun m!434405 () Bool)

(assert (=> d!74087 m!434405))

(declare-fun m!434407 () Bool)

(assert (=> b!451063 m!434407))

(declare-fun m!434409 () Bool)

(assert (=> b!451064 m!434409))

(assert (=> b!450804 d!74087))

(declare-fun d!74089 () Bool)

(declare-fun e!264225 () Bool)

(assert (=> d!74089 e!264225))

(declare-fun res!268587 () Bool)

(assert (=> d!74089 (=> (not res!268587) (not e!264225))))

(declare-fun lt!204665 () ListLongMap!6911)

(assert (=> d!74089 (= res!268587 (not (contains!2483 lt!204665 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!264229 () ListLongMap!6911)

(assert (=> d!74089 (= lt!204665 e!264229)))

(declare-fun c!55989 () Bool)

(assert (=> d!74089 (= c!55989 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13777 lt!204560)))))

(assert (=> d!74089 (validMask!0 mask!1025)))

(assert (=> d!74089 (= (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204665)))

(declare-fun b!451065 () Bool)

(declare-fun e!264226 () Bool)

(assert (=> b!451065 (= e!264225 e!264226)))

(declare-fun c!55986 () Bool)

(declare-fun e!264224 () Bool)

(assert (=> b!451065 (= c!55986 e!264224)))

(declare-fun res!268586 () Bool)

(assert (=> b!451065 (=> (not res!268586) (not e!264224))))

(assert (=> b!451065 (= res!268586 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 lt!204560)))))

(declare-fun b!451066 () Bool)

(declare-fun e!264230 () ListLongMap!6911)

(declare-fun call!29818 () ListLongMap!6911)

(assert (=> b!451066 (= e!264230 call!29818)))

(declare-fun b!451067 () Bool)

(assert (=> b!451067 (= e!264224 (validKeyInArray!0 (select (arr!13424 lt!204560) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451067 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!451068 () Bool)

(declare-fun e!264227 () Bool)

(assert (=> b!451068 (= e!264226 e!264227)))

(declare-fun c!55987 () Bool)

(assert (=> b!451068 (= c!55987 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 lt!204560)))))

(declare-fun bm!29815 () Bool)

(assert (=> bm!29815 (= call!29818 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!451069 () Bool)

(declare-fun e!264228 () Bool)

(assert (=> b!451069 (= e!264226 e!264228)))

(assert (=> b!451069 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 lt!204560)))))

(declare-fun res!268589 () Bool)

(assert (=> b!451069 (= res!268589 (contains!2483 lt!204665 (select (arr!13424 lt!204560) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!451069 (=> (not res!268589) (not e!264228))))

(declare-fun b!451070 () Bool)

(assert (=> b!451070 (= e!264227 (isEmpty!562 lt!204665))))

(declare-fun b!451071 () Bool)

(declare-fun lt!204669 () Unit!13163)

(declare-fun lt!204670 () Unit!13163)

(assert (=> b!451071 (= lt!204669 lt!204670)))

(declare-fun lt!204667 () V!17211)

(declare-fun lt!204671 () (_ BitVec 64))

(declare-fun lt!204666 () (_ BitVec 64))

(declare-fun lt!204668 () ListLongMap!6911)

(assert (=> b!451071 (not (contains!2483 (+!1572 lt!204668 (tuple2!8009 lt!204671 lt!204667)) lt!204666))))

(assert (=> b!451071 (= lt!204670 (addStillNotContains!146 lt!204668 lt!204671 lt!204667 lt!204666))))

(assert (=> b!451071 (= lt!204666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!451071 (= lt!204667 (get!6610 (select (arr!13425 lt!204563) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!451071 (= lt!204671 (select (arr!13424 lt!204560) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!451071 (= lt!204668 call!29818)))

(assert (=> b!451071 (= e!264230 (+!1572 call!29818 (tuple2!8009 (select (arr!13424 lt!204560) (bvadd #b00000000000000000000000000000001 from!863)) (get!6610 (select (arr!13425 lt!204563) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451072 () Bool)

(assert (=> b!451072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13777 lt!204560)))))

(assert (=> b!451072 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13778 lt!204563)))))

(assert (=> b!451072 (= e!264228 (= (apply!312 lt!204665 (select (arr!13424 lt!204560) (bvadd #b00000000000000000000000000000001 from!863))) (get!6610 (select (arr!13425 lt!204563) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!451073 () Bool)

(assert (=> b!451073 (= e!264229 e!264230)))

(declare-fun c!55988 () Bool)

(assert (=> b!451073 (= c!55988 (validKeyInArray!0 (select (arr!13424 lt!204560) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!451074 () Bool)

(assert (=> b!451074 (= e!264227 (= lt!204665 (getCurrentListMapNoExtraKeys!1668 lt!204560 lt!204563 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!451075 () Bool)

(declare-fun res!268588 () Bool)

(assert (=> b!451075 (=> (not res!268588) (not e!264225))))

(assert (=> b!451075 (= res!268588 (not (contains!2483 lt!204665 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451076 () Bool)

(assert (=> b!451076 (= e!264229 (ListLongMap!6912 Nil!8068))))

(assert (= (and d!74089 c!55989) b!451076))

(assert (= (and d!74089 (not c!55989)) b!451073))

(assert (= (and b!451073 c!55988) b!451071))

(assert (= (and b!451073 (not c!55988)) b!451066))

(assert (= (or b!451071 b!451066) bm!29815))

(assert (= (and d!74089 res!268587) b!451075))

(assert (= (and b!451075 res!268588) b!451065))

(assert (= (and b!451065 res!268586) b!451067))

(assert (= (and b!451065 c!55986) b!451069))

(assert (= (and b!451065 (not c!55986)) b!451068))

(assert (= (and b!451069 res!268589) b!451072))

(assert (= (and b!451068 c!55987) b!451074))

(assert (= (and b!451068 (not c!55987)) b!451070))

(declare-fun b_lambda!9483 () Bool)

(assert (=> (not b_lambda!9483) (not b!451071)))

(assert (=> b!451071 t!13825))

(declare-fun b_and!18751 () Bool)

(assert (= b_and!18749 (and (=> t!13825 result!6969) b_and!18751)))

(declare-fun b_lambda!9485 () Bool)

(assert (=> (not b_lambda!9485) (not b!451072)))

(assert (=> b!451072 t!13825))

(declare-fun b_and!18753 () Bool)

(assert (= b_and!18751 (and (=> t!13825 result!6969) b_and!18753)))

(declare-fun m!434411 () Bool)

(assert (=> b!451073 m!434411))

(assert (=> b!451073 m!434411))

(declare-fun m!434413 () Bool)

(assert (=> b!451073 m!434413))

(assert (=> b!451072 m!434411))

(declare-fun m!434415 () Bool)

(assert (=> b!451072 m!434415))

(declare-fun m!434417 () Bool)

(assert (=> b!451072 m!434417))

(assert (=> b!451072 m!434135))

(assert (=> b!451072 m!434417))

(assert (=> b!451072 m!434135))

(declare-fun m!434419 () Bool)

(assert (=> b!451072 m!434419))

(assert (=> b!451072 m!434411))

(declare-fun m!434421 () Bool)

(assert (=> b!451074 m!434421))

(declare-fun m!434423 () Bool)

(assert (=> d!74089 m!434423))

(assert (=> d!74089 m!434113))

(assert (=> b!451067 m!434411))

(assert (=> b!451067 m!434411))

(assert (=> b!451067 m!434413))

(assert (=> b!451069 m!434411))

(assert (=> b!451069 m!434411))

(declare-fun m!434425 () Bool)

(assert (=> b!451069 m!434425))

(declare-fun m!434427 () Bool)

(assert (=> b!451071 m!434427))

(assert (=> b!451071 m!434417))

(assert (=> b!451071 m!434135))

(assert (=> b!451071 m!434419))

(assert (=> b!451071 m!434411))

(declare-fun m!434429 () Bool)

(assert (=> b!451071 m!434429))

(declare-fun m!434431 () Bool)

(assert (=> b!451071 m!434431))

(assert (=> b!451071 m!434429))

(assert (=> b!451071 m!434417))

(declare-fun m!434433 () Bool)

(assert (=> b!451071 m!434433))

(assert (=> b!451071 m!434135))

(declare-fun m!434435 () Bool)

(assert (=> b!451075 m!434435))

(declare-fun m!434437 () Bool)

(assert (=> b!451070 m!434437))

(assert (=> bm!29815 m!434421))

(assert (=> b!450804 d!74089))

(declare-fun d!74091 () Bool)

(declare-fun c!55992 () Bool)

(assert (=> d!74091 (= c!55992 ((_ is ValueCellFull!5696) (select (arr!13425 lt!204563) from!863)))))

(declare-fun e!264233 () V!17211)

(assert (=> d!74091 (= (get!6610 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!264233)))

(declare-fun b!451081 () Bool)

(declare-fun get!6611 (ValueCell!5696 V!17211) V!17211)

(assert (=> b!451081 (= e!264233 (get!6611 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451082 () Bool)

(declare-fun get!6612 (ValueCell!5696 V!17211) V!17211)

(assert (=> b!451082 (= e!264233 (get!6612 (select (arr!13425 lt!204563) from!863) (dynLambda!850 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74091 c!55992) b!451081))

(assert (= (and d!74091 (not c!55992)) b!451082))

(assert (=> b!451081 m!434131))

(assert (=> b!451081 m!434135))

(declare-fun m!434439 () Bool)

(assert (=> b!451081 m!434439))

(assert (=> b!451082 m!434131))

(assert (=> b!451082 m!434135))

(declare-fun m!434441 () Bool)

(assert (=> b!451082 m!434441))

(assert (=> b!450804 d!74091))

(declare-fun d!74093 () Bool)

(assert (=> d!74093 (= (validKeyInArray!0 (select (arr!13424 _keys!709) from!863)) (and (not (= (select (arr!13424 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13424 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!450813 d!74093))

(declare-fun b!451089 () Bool)

(declare-fun e!264238 () Bool)

(declare-fun call!29823 () ListLongMap!6911)

(declare-fun call!29824 () ListLongMap!6911)

(assert (=> b!451089 (= e!264238 (= call!29823 call!29824))))

(declare-fun b!451090 () Bool)

(declare-fun e!264239 () Bool)

(assert (=> b!451090 (= e!264239 e!264238)))

(declare-fun c!55995 () Bool)

(assert (=> b!451090 (= c!55995 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!29820 () Bool)

(assert (=> bm!29820 (= call!29824 (getCurrentListMapNoExtraKeys!1668 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29821 () Bool)

(assert (=> bm!29821 (= call!29823 (getCurrentListMapNoExtraKeys!1668 (array!27958 (store (arr!13424 _keys!709) i!563 k0!794) (size!13777 _keys!709)) (array!27960 (store (arr!13425 _values!549) i!563 (ValueCellFull!5696 v!412)) (size!13778 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun d!74095 () Bool)

(assert (=> d!74095 e!264239))

(declare-fun res!268592 () Bool)

(assert (=> d!74095 (=> (not res!268592) (not e!264239))))

(assert (=> d!74095 (= res!268592 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13777 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13778 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13777 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13778 _values!549))))))))

(declare-fun lt!204674 () Unit!13163)

(declare-fun choose!1333 (array!27957 array!27959 (_ BitVec 32) (_ BitVec 32) V!17211 V!17211 (_ BitVec 32) (_ BitVec 64) V!17211 (_ BitVec 32) Int) Unit!13163)

(assert (=> d!74095 (= lt!204674 (choose!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74095 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13777 _keys!709)))))

(assert (=> d!74095 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!709 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!204674)))

(declare-fun b!451091 () Bool)

(assert (=> b!451091 (= e!264238 (= call!29823 (+!1572 call!29824 (tuple2!8009 k0!794 v!412))))))

(assert (= (and d!74095 res!268592) b!451090))

(assert (= (and b!451090 c!55995) b!451091))

(assert (= (and b!451090 (not c!55995)) b!451089))

(assert (= (or b!451091 b!451089) bm!29820))

(assert (= (or b!451091 b!451089) bm!29821))

(declare-fun m!434443 () Bool)

(assert (=> bm!29820 m!434443))

(assert (=> bm!29821 m!434103))

(assert (=> bm!29821 m!434091))

(declare-fun m!434445 () Bool)

(assert (=> bm!29821 m!434445))

(declare-fun m!434447 () Bool)

(assert (=> d!74095 m!434447))

(declare-fun m!434449 () Bool)

(assert (=> b!451091 m!434449))

(assert (=> b!450813 d!74095))

(declare-fun condMapEmpty!19761 () Bool)

(declare-fun mapDefault!19761 () ValueCell!5696)

(assert (=> mapNonEmpty!19752 (= condMapEmpty!19761 (= mapRest!19752 ((as const (Array (_ BitVec 32) ValueCell!5696)) mapDefault!19761)))))

(declare-fun e!264245 () Bool)

(declare-fun mapRes!19761 () Bool)

(assert (=> mapNonEmpty!19752 (= tp!38042 (and e!264245 mapRes!19761))))

(declare-fun b!451098 () Bool)

(declare-fun e!264244 () Bool)

(assert (=> b!451098 (= e!264244 tp_is_empty!12079)))

(declare-fun mapIsEmpty!19761 () Bool)

(assert (=> mapIsEmpty!19761 mapRes!19761))

(declare-fun b!451099 () Bool)

(assert (=> b!451099 (= e!264245 tp_is_empty!12079)))

(declare-fun mapNonEmpty!19761 () Bool)

(declare-fun tp!38058 () Bool)

(assert (=> mapNonEmpty!19761 (= mapRes!19761 (and tp!38058 e!264244))))

(declare-fun mapKey!19761 () (_ BitVec 32))

(declare-fun mapRest!19761 () (Array (_ BitVec 32) ValueCell!5696))

(declare-fun mapValue!19761 () ValueCell!5696)

(assert (=> mapNonEmpty!19761 (= mapRest!19752 (store mapRest!19761 mapKey!19761 mapValue!19761))))

(assert (= (and mapNonEmpty!19752 condMapEmpty!19761) mapIsEmpty!19761))

(assert (= (and mapNonEmpty!19752 (not condMapEmpty!19761)) mapNonEmpty!19761))

(assert (= (and mapNonEmpty!19761 ((_ is ValueCellFull!5696) mapValue!19761)) b!451098))

(assert (= (and mapNonEmpty!19752 ((_ is ValueCellFull!5696) mapDefault!19761)) b!451099))

(declare-fun m!434451 () Bool)

(assert (=> mapNonEmpty!19761 m!434451))

(declare-fun b_lambda!9487 () Bool)

(assert (= b_lambda!9483 (or (and start!40716 b_free!10741) b_lambda!9487)))

(declare-fun b_lambda!9489 () Bool)

(assert (= b_lambda!9471 (or (and start!40716 b_free!10741) b_lambda!9489)))

(declare-fun b_lambda!9491 () Bool)

(assert (= b_lambda!9467 (or (and start!40716 b_free!10741) b_lambda!9491)))

(declare-fun b_lambda!9493 () Bool)

(assert (= b_lambda!9485 (or (and start!40716 b_free!10741) b_lambda!9493)))

(declare-fun b_lambda!9495 () Bool)

(assert (= b_lambda!9477 (or (and start!40716 b_free!10741) b_lambda!9495)))

(declare-fun b_lambda!9497 () Bool)

(assert (= b_lambda!9469 (or (and start!40716 b_free!10741) b_lambda!9497)))

(declare-fun b_lambda!9499 () Bool)

(assert (= b_lambda!9481 (or (and start!40716 b_free!10741) b_lambda!9499)))

(declare-fun b_lambda!9501 () Bool)

(assert (= b_lambda!9479 (or (and start!40716 b_free!10741) b_lambda!9501)))

(declare-fun b_lambda!9503 () Bool)

(assert (= b_lambda!9473 (or (and start!40716 b_free!10741) b_lambda!9503)))

(declare-fun b_lambda!9505 () Bool)

(assert (= b_lambda!9475 (or (and start!40716 b_free!10741) b_lambda!9505)))

(check-sat (not b!450972) (not b!450995) (not bm!29809) (not b_lambda!9505) (not b!450969) b_and!18753 (not b!451005) (not d!74095) (not b!451019) (not bm!29806) (not b!451010) (not b_lambda!9489) (not b_next!10741) (not b!451069) (not b!451041) (not d!74061) (not b!451011) (not b!451073) (not b_lambda!9493) (not b!451022) (not b!450971) (not bm!29814) (not b!451067) (not b!451036) (not b!450993) (not b!451013) (not b!451009) (not b!451072) (not b!451064) (not b!451050) (not d!74073) (not b!451091) (not d!74087) (not b!451071) (not b!451001) (not b!451082) (not b!451074) (not b!451055) (not b!451052) (not b!450973) (not b!451062) (not b_lambda!9495) (not b!450976) (not d!74067) (not b!450996) (not b!450975) (not b!451007) (not b!450974) (not bm!29803) (not b_lambda!9487) (not b!450999) (not b!451039) (not bm!29807) (not b!451044) (not b!451012) (not bm!29808) (not b!451000) (not b!451020) (not b!451038) (not bm!29813) (not b_lambda!9499) (not d!74089) (not b!450988) (not b!451023) (not b!451008) (not b!451075) (not b!451051) (not b!450997) (not bm!29820) (not b!451047) (not b!451043) (not b!451063) (not b!450989) (not b_lambda!9491) tp_is_empty!12079 (not b!451081) (not d!74065) (not b_lambda!9503) (not b!451054) (not d!74083) (not b!450998) (not b!451049) (not mapNonEmpty!19761) (not bm!29821) (not bm!29812) (not bm!29815) (not b!450977) (not b!451070) (not b_lambda!9465) (not b_lambda!9497) (not b_lambda!9501) (not b!451053))
(check-sat b_and!18753 (not b_next!10741))
