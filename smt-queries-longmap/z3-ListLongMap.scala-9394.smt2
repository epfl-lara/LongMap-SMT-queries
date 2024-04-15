; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111800 () Bool)

(assert start!111800)

(declare-fun b_free!30457 () Bool)

(declare-fun b_next!30457 () Bool)

(assert (=> start!111800 (= b_free!30457 (not b_next!30457))))

(declare-fun tp!106847 () Bool)

(declare-fun b_and!48977 () Bool)

(assert (=> start!111800 (= tp!106847 b_and!48977)))

(declare-fun b!1324797 () Bool)

(declare-fun res!879363 () Bool)

(declare-fun e!755236 () Bool)

(assert (=> b!1324797 (=> (not res!879363) (not e!755236))))

(declare-datatypes ((array!89397 0))(
  ( (array!89398 (arr!43173 (Array (_ BitVec 32) (_ BitVec 64))) (size!43725 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89397)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324797 (= res!879363 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1324798 () Bool)

(declare-fun e!755234 () Bool)

(declare-fun e!755235 () Bool)

(declare-fun mapRes!56063 () Bool)

(assert (=> b!1324798 (= e!755234 (and e!755235 mapRes!56063))))

(declare-fun condMapEmpty!56063 () Bool)

(declare-datatypes ((V!53473 0))(
  ( (V!53474 (val!18213 Int)) )
))
(declare-datatypes ((ValueCell!17240 0))(
  ( (ValueCellFull!17240 (v!20842 V!53473)) (EmptyCell!17240) )
))
(declare-datatypes ((array!89399 0))(
  ( (array!89400 (arr!43174 (Array (_ BitVec 32) ValueCell!17240)) (size!43726 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89399)

(declare-fun mapDefault!56063 () ValueCell!17240)

(assert (=> b!1324798 (= condMapEmpty!56063 (= (arr!43174 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17240)) mapDefault!56063)))))

(declare-fun b!1324799 () Bool)

(declare-fun tp_is_empty!36277 () Bool)

(assert (=> b!1324799 (= e!755235 tp_is_empty!36277)))

(declare-fun b!1324800 () Bool)

(declare-fun zeroValue!1279 () V!53473)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun minValue!1279 () V!53473)

(declare-datatypes ((tuple2!23556 0))(
  ( (tuple2!23557 (_1!11789 (_ BitVec 64)) (_2!11789 V!53473)) )
))
(declare-datatypes ((List!30685 0))(
  ( (Nil!30682) (Cons!30681 (h!31890 tuple2!23556) (t!44605 List!30685)) )
))
(declare-datatypes ((ListLongMap!21213 0))(
  ( (ListLongMap!21214 (toList!10622 List!30685)) )
))
(declare-fun contains!8704 (ListLongMap!21213 (_ BitVec 64)) Bool)

(declare-fun +!4630 (ListLongMap!21213 tuple2!23556) ListLongMap!21213)

(declare-fun getCurrentListMapNoExtraKeys!6268 (array!89397 array!89399 (_ BitVec 32) (_ BitVec 32) V!53473 V!53473 (_ BitVec 32) Int) ListLongMap!21213)

(declare-fun get!21741 (ValueCell!17240 V!53473) V!53473)

(declare-fun dynLambda!3560 (Int (_ BitVec 64)) V!53473)

(assert (=> b!1324800 (= e!755236 (not (contains!8704 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))))

(declare-fun b!1324801 () Bool)

(declare-fun res!879364 () Bool)

(assert (=> b!1324801 (=> (not res!879364) (not e!755236))))

(declare-datatypes ((List!30686 0))(
  ( (Nil!30683) (Cons!30682 (h!31891 (_ BitVec 64)) (t!44606 List!30686)) )
))
(declare-fun arrayNoDuplicates!0 (array!89397 (_ BitVec 32) List!30686) Bool)

(assert (=> b!1324801 (= res!879364 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30683))))

(declare-fun b!1324802 () Bool)

(declare-fun res!879367 () Bool)

(assert (=> b!1324802 (=> (not res!879367) (not e!755236))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89397 (_ BitVec 32)) Bool)

(assert (=> b!1324802 (= res!879367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!56063 () Bool)

(declare-fun tp!106848 () Bool)

(declare-fun e!755232 () Bool)

(assert (=> mapNonEmpty!56063 (= mapRes!56063 (and tp!106848 e!755232))))

(declare-fun mapKey!56063 () (_ BitVec 32))

(declare-fun mapRest!56063 () (Array (_ BitVec 32) ValueCell!17240))

(declare-fun mapValue!56063 () ValueCell!17240)

(assert (=> mapNonEmpty!56063 (= (arr!43174 _values!1337) (store mapRest!56063 mapKey!56063 mapValue!56063))))

(declare-fun b!1324804 () Bool)

(assert (=> b!1324804 (= e!755232 tp_is_empty!36277)))

(declare-fun b!1324805 () Bool)

(declare-fun res!879362 () Bool)

(assert (=> b!1324805 (=> (not res!879362) (not e!755236))))

(declare-fun getCurrentListMap!5500 (array!89397 array!89399 (_ BitVec 32) (_ BitVec 32) V!53473 V!53473 (_ BitVec 32) Int) ListLongMap!21213)

(assert (=> b!1324805 (= res!879362 (contains!8704 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324806 () Bool)

(declare-fun res!879368 () Bool)

(assert (=> b!1324806 (=> (not res!879368) (not e!755236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324806 (= res!879368 (validKeyInArray!0 (select (arr!43173 _keys!1609) from!2000)))))

(declare-fun b!1324807 () Bool)

(declare-fun res!879365 () Bool)

(assert (=> b!1324807 (=> (not res!879365) (not e!755236))))

(assert (=> b!1324807 (= res!879365 (not (= (select (arr!43173 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!56063 () Bool)

(assert (=> mapIsEmpty!56063 mapRes!56063))

(declare-fun res!879369 () Bool)

(assert (=> start!111800 (=> (not res!879369) (not e!755236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111800 (= res!879369 (validMask!0 mask!2019))))

(assert (=> start!111800 e!755236))

(declare-fun array_inv!32775 (array!89397) Bool)

(assert (=> start!111800 (array_inv!32775 _keys!1609)))

(assert (=> start!111800 true))

(assert (=> start!111800 tp_is_empty!36277))

(declare-fun array_inv!32776 (array!89399) Bool)

(assert (=> start!111800 (and (array_inv!32776 _values!1337) e!755234)))

(assert (=> start!111800 tp!106847))

(declare-fun b!1324803 () Bool)

(declare-fun res!879366 () Bool)

(assert (=> b!1324803 (=> (not res!879366) (not e!755236))))

(assert (=> b!1324803 (= res!879366 (and (= (size!43726 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43725 _keys!1609) (size!43726 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111800 res!879369) b!1324803))

(assert (= (and b!1324803 res!879366) b!1324802))

(assert (= (and b!1324802 res!879367) b!1324801))

(assert (= (and b!1324801 res!879364) b!1324797))

(assert (= (and b!1324797 res!879363) b!1324805))

(assert (= (and b!1324805 res!879362) b!1324807))

(assert (= (and b!1324807 res!879365) b!1324806))

(assert (= (and b!1324806 res!879368) b!1324800))

(assert (= (and b!1324798 condMapEmpty!56063) mapIsEmpty!56063))

(assert (= (and b!1324798 (not condMapEmpty!56063)) mapNonEmpty!56063))

(get-info :version)

(assert (= (and mapNonEmpty!56063 ((_ is ValueCellFull!17240) mapValue!56063)) b!1324804))

(assert (= (and b!1324798 ((_ is ValueCellFull!17240) mapDefault!56063)) b!1324799))

(assert (= start!111800 b!1324798))

(declare-fun b_lambda!23695 () Bool)

(assert (=> (not b_lambda!23695) (not b!1324800)))

(declare-fun t!44604 () Bool)

(declare-fun tb!11723 () Bool)

(assert (=> (and start!111800 (= defaultEntry!1340 defaultEntry!1340) t!44604) tb!11723))

(declare-fun result!24509 () Bool)

(assert (=> tb!11723 (= result!24509 tp_is_empty!36277)))

(assert (=> b!1324800 t!44604))

(declare-fun b_and!48979 () Bool)

(assert (= b_and!48977 (and (=> t!44604 result!24509) b_and!48979)))

(declare-fun m!1213059 () Bool)

(assert (=> b!1324802 m!1213059))

(declare-fun m!1213061 () Bool)

(assert (=> start!111800 m!1213061))

(declare-fun m!1213063 () Bool)

(assert (=> start!111800 m!1213063))

(declare-fun m!1213065 () Bool)

(assert (=> start!111800 m!1213065))

(declare-fun m!1213067 () Bool)

(assert (=> b!1324807 m!1213067))

(declare-fun m!1213069 () Bool)

(assert (=> mapNonEmpty!56063 m!1213069))

(declare-fun m!1213071 () Bool)

(assert (=> b!1324805 m!1213071))

(assert (=> b!1324805 m!1213071))

(declare-fun m!1213073 () Bool)

(assert (=> b!1324805 m!1213073))

(declare-fun m!1213075 () Bool)

(assert (=> b!1324801 m!1213075))

(declare-fun m!1213077 () Bool)

(assert (=> b!1324800 m!1213077))

(declare-fun m!1213079 () Bool)

(assert (=> b!1324800 m!1213079))

(assert (=> b!1324800 m!1213077))

(declare-fun m!1213081 () Bool)

(assert (=> b!1324800 m!1213081))

(declare-fun m!1213083 () Bool)

(assert (=> b!1324800 m!1213083))

(declare-fun m!1213085 () Bool)

(assert (=> b!1324800 m!1213085))

(declare-fun m!1213087 () Bool)

(assert (=> b!1324800 m!1213087))

(assert (=> b!1324800 m!1213081))

(declare-fun m!1213089 () Bool)

(assert (=> b!1324800 m!1213089))

(assert (=> b!1324800 m!1213067))

(assert (=> b!1324800 m!1213089))

(assert (=> b!1324800 m!1213083))

(assert (=> b!1324800 m!1213087))

(assert (=> b!1324800 m!1213079))

(declare-fun m!1213091 () Bool)

(assert (=> b!1324800 m!1213091))

(assert (=> b!1324806 m!1213067))

(assert (=> b!1324806 m!1213067))

(declare-fun m!1213093 () Bool)

(assert (=> b!1324806 m!1213093))

(check-sat (not b!1324805) (not b_lambda!23695) (not b!1324800) (not b!1324806) (not b_next!30457) b_and!48979 tp_is_empty!36277 (not b!1324801) (not b!1324802) (not mapNonEmpty!56063) (not start!111800))
(check-sat b_and!48979 (not b_next!30457))
(get-model)

(declare-fun b_lambda!23701 () Bool)

(assert (= b_lambda!23695 (or (and start!111800 b_free!30457) b_lambda!23701)))

(check-sat (not b!1324805) (not b_lambda!23701) (not b!1324800) (not b!1324806) (not b_next!30457) b_and!48979 tp_is_empty!36277 (not b!1324801) (not b!1324802) (not mapNonEmpty!56063) (not start!111800))
(check-sat b_and!48979 (not b_next!30457))
(get-model)

(declare-fun b!1324888 () Bool)

(declare-fun e!755274 () Bool)

(declare-fun call!64668 () Bool)

(assert (=> b!1324888 (= e!755274 call!64668)))

(declare-fun b!1324889 () Bool)

(declare-fun e!755275 () Bool)

(assert (=> b!1324889 (= e!755275 e!755274)))

(declare-fun lt!589328 () (_ BitVec 64))

(assert (=> b!1324889 (= lt!589328 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43443 0))(
  ( (Unit!43444) )
))
(declare-fun lt!589329 () Unit!43443)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89397 (_ BitVec 64) (_ BitVec 32)) Unit!43443)

(assert (=> b!1324889 (= lt!589329 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!589328 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1324889 (arrayContainsKey!0 _keys!1609 lt!589328 #b00000000000000000000000000000000)))

(declare-fun lt!589327 () Unit!43443)

(assert (=> b!1324889 (= lt!589327 lt!589329)))

(declare-fun res!879423 () Bool)

(declare-datatypes ((SeekEntryResult!10039 0))(
  ( (MissingZero!10039 (index!42527 (_ BitVec 32))) (Found!10039 (index!42528 (_ BitVec 32))) (Intermediate!10039 (undefined!10851 Bool) (index!42529 (_ BitVec 32)) (x!118104 (_ BitVec 32))) (Undefined!10039) (MissingVacant!10039 (index!42530 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89397 (_ BitVec 32)) SeekEntryResult!10039)

(assert (=> b!1324889 (= res!879423 (= (seekEntryOrOpen!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10039 #b00000000000000000000000000000000)))))

(assert (=> b!1324889 (=> (not res!879423) (not e!755274))))

(declare-fun b!1324890 () Bool)

(declare-fun e!755273 () Bool)

(assert (=> b!1324890 (= e!755273 e!755275)))

(declare-fun c!125625 () Bool)

(assert (=> b!1324890 (= c!125625 (validKeyInArray!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!142779 () Bool)

(declare-fun res!879422 () Bool)

(assert (=> d!142779 (=> res!879422 e!755273)))

(assert (=> d!142779 (= res!879422 (bvsge #b00000000000000000000000000000000 (size!43725 _keys!1609)))))

(assert (=> d!142779 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!755273)))

(declare-fun b!1324891 () Bool)

(assert (=> b!1324891 (= e!755275 call!64668)))

(declare-fun bm!64665 () Bool)

(assert (=> bm!64665 (= call!64668 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(assert (= (and d!142779 (not res!879422)) b!1324890))

(assert (= (and b!1324890 c!125625) b!1324889))

(assert (= (and b!1324890 (not c!125625)) b!1324891))

(assert (= (and b!1324889 res!879423) b!1324888))

(assert (= (or b!1324888 b!1324891) bm!64665))

(declare-fun m!1213167 () Bool)

(assert (=> b!1324889 m!1213167))

(declare-fun m!1213169 () Bool)

(assert (=> b!1324889 m!1213169))

(declare-fun m!1213171 () Bool)

(assert (=> b!1324889 m!1213171))

(assert (=> b!1324889 m!1213167))

(declare-fun m!1213173 () Bool)

(assert (=> b!1324889 m!1213173))

(assert (=> b!1324890 m!1213167))

(assert (=> b!1324890 m!1213167))

(declare-fun m!1213175 () Bool)

(assert (=> b!1324890 m!1213175))

(declare-fun m!1213177 () Bool)

(assert (=> bm!64665 m!1213177))

(assert (=> b!1324802 d!142779))

(declare-fun d!142781 () Bool)

(assert (=> d!142781 (= (validKeyInArray!0 (select (arr!43173 _keys!1609) from!2000)) (and (not (= (select (arr!43173 _keys!1609) from!2000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43173 _keys!1609) from!2000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1324806 d!142781))

(declare-fun d!142783 () Bool)

(declare-fun e!755280 () Bool)

(assert (=> d!142783 e!755280))

(declare-fun res!879426 () Bool)

(assert (=> d!142783 (=> res!879426 e!755280)))

(declare-fun lt!589339 () Bool)

(assert (=> d!142783 (= res!879426 (not lt!589339))))

(declare-fun lt!589341 () Bool)

(assert (=> d!142783 (= lt!589339 lt!589341)))

(declare-fun lt!589338 () Unit!43443)

(declare-fun e!755281 () Unit!43443)

(assert (=> d!142783 (= lt!589338 e!755281)))

(declare-fun c!125628 () Bool)

(assert (=> d!142783 (= c!125628 lt!589341)))

(declare-fun containsKey!732 (List!30685 (_ BitVec 64)) Bool)

(assert (=> d!142783 (= lt!589341 (containsKey!732 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (=> d!142783 (= (contains!8704 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164) lt!589339)))

(declare-fun b!1324898 () Bool)

(declare-fun lt!589340 () Unit!43443)

(assert (=> b!1324898 (= e!755281 lt!589340)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!479 (List!30685 (_ BitVec 64)) Unit!43443)

(assert (=> b!1324898 (= lt!589340 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-datatypes ((Option!766 0))(
  ( (Some!765 (v!20845 V!53473)) (None!764) )
))
(declare-fun isDefined!522 (Option!766) Bool)

(declare-fun getValueByKey!715 (List!30685 (_ BitVec 64)) Option!766)

(assert (=> b!1324898 (isDefined!522 (getValueByKey!715 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun b!1324899 () Bool)

(declare-fun Unit!43445 () Unit!43443)

(assert (=> b!1324899 (= e!755281 Unit!43445)))

(declare-fun b!1324900 () Bool)

(assert (=> b!1324900 (= e!755280 (isDefined!522 (getValueByKey!715 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)))))

(assert (= (and d!142783 c!125628) b!1324898))

(assert (= (and d!142783 (not c!125628)) b!1324899))

(assert (= (and d!142783 (not res!879426)) b!1324900))

(declare-fun m!1213179 () Bool)

(assert (=> d!142783 m!1213179))

(declare-fun m!1213181 () Bool)

(assert (=> b!1324898 m!1213181))

(declare-fun m!1213183 () Bool)

(assert (=> b!1324898 m!1213183))

(assert (=> b!1324898 m!1213183))

(declare-fun m!1213185 () Bool)

(assert (=> b!1324898 m!1213185))

(assert (=> b!1324900 m!1213183))

(assert (=> b!1324900 m!1213183))

(assert (=> b!1324900 m!1213185))

(assert (=> b!1324805 d!142783))

(declare-fun b!1324943 () Bool)

(declare-fun e!755317 () ListLongMap!21213)

(declare-fun call!64683 () ListLongMap!21213)

(assert (=> b!1324943 (= e!755317 (+!4630 call!64683 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun call!64684 () ListLongMap!21213)

(declare-fun bm!64680 () Bool)

(assert (=> bm!64680 (= call!64684 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun b!1324944 () Bool)

(declare-fun res!879453 () Bool)

(declare-fun e!755320 () Bool)

(assert (=> b!1324944 (=> (not res!879453) (not e!755320))))

(declare-fun e!755314 () Bool)

(assert (=> b!1324944 (= res!879453 e!755314)))

(declare-fun c!125644 () Bool)

(assert (=> b!1324944 (= c!125644 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1324945 () Bool)

(declare-fun e!755313 () ListLongMap!21213)

(declare-fun call!64685 () ListLongMap!21213)

(assert (=> b!1324945 (= e!755313 call!64685)))

(declare-fun lt!589407 () ListLongMap!21213)

(declare-fun e!755315 () Bool)

(declare-fun b!1324946 () Bool)

(declare-fun apply!1022 (ListLongMap!21213 (_ BitVec 64)) V!53473)

(assert (=> b!1324946 (= e!755315 (= (apply!1022 lt!589407 (select (arr!43173 _keys!1609) from!2000)) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1324946 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43726 _values!1337)))))

(assert (=> b!1324946 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)))))

(declare-fun bm!64681 () Bool)

(declare-fun call!64689 () ListLongMap!21213)

(assert (=> bm!64681 (= call!64689 call!64684)))

(declare-fun b!1324947 () Bool)

(declare-fun e!755319 () Bool)

(assert (=> b!1324947 (= e!755319 (validKeyInArray!0 (select (arr!43173 _keys!1609) from!2000)))))

(declare-fun d!142785 () Bool)

(assert (=> d!142785 e!755320))

(declare-fun res!879450 () Bool)

(assert (=> d!142785 (=> (not res!879450) (not e!755320))))

(assert (=> d!142785 (= res!879450 (or (bvsge from!2000 (size!43725 _keys!1609)) (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)))))))

(declare-fun lt!589388 () ListLongMap!21213)

(assert (=> d!142785 (= lt!589407 lt!589388)))

(declare-fun lt!589393 () Unit!43443)

(declare-fun e!755316 () Unit!43443)

(assert (=> d!142785 (= lt!589393 e!755316)))

(declare-fun c!125642 () Bool)

(declare-fun e!755318 () Bool)

(assert (=> d!142785 (= c!125642 e!755318)))

(declare-fun res!879445 () Bool)

(assert (=> d!142785 (=> (not res!879445) (not e!755318))))

(assert (=> d!142785 (= res!879445 (bvslt from!2000 (size!43725 _keys!1609)))))

(assert (=> d!142785 (= lt!589388 e!755317)))

(declare-fun c!125643 () Bool)

(assert (=> d!142785 (= c!125643 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!142785 (validMask!0 mask!2019)))

(assert (=> d!142785 (= (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!589407)))

(declare-fun b!1324948 () Bool)

(declare-fun e!755308 () Bool)

(declare-fun call!64688 () Bool)

(assert (=> b!1324948 (= e!755308 (not call!64688))))

(declare-fun b!1324949 () Bool)

(declare-fun res!879448 () Bool)

(assert (=> b!1324949 (=> (not res!879448) (not e!755320))))

(declare-fun e!755312 () Bool)

(assert (=> b!1324949 (= res!879448 e!755312)))

(declare-fun res!879446 () Bool)

(assert (=> b!1324949 (=> res!879446 e!755312)))

(assert (=> b!1324949 (= res!879446 (not e!755319))))

(declare-fun res!879451 () Bool)

(assert (=> b!1324949 (=> (not res!879451) (not e!755319))))

(assert (=> b!1324949 (= res!879451 (bvslt from!2000 (size!43725 _keys!1609)))))

(declare-fun b!1324950 () Bool)

(declare-fun e!755311 () Bool)

(assert (=> b!1324950 (= e!755314 e!755311)))

(declare-fun res!879452 () Bool)

(declare-fun call!64687 () Bool)

(assert (=> b!1324950 (= res!879452 call!64687)))

(assert (=> b!1324950 (=> (not res!879452) (not e!755311))))

(declare-fun b!1324951 () Bool)

(assert (=> b!1324951 (= e!755320 e!755308)))

(declare-fun c!125646 () Bool)

(assert (=> b!1324951 (= c!125646 (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!64682 () Bool)

(declare-fun c!125641 () Bool)

(assert (=> bm!64682 (= call!64683 (+!4630 (ite c!125643 call!64684 (ite c!125641 call!64689 call!64685)) (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1324952 () Bool)

(declare-fun e!755309 () ListLongMap!21213)

(assert (=> b!1324952 (= e!755317 e!755309)))

(assert (=> b!1324952 (= c!125641 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1324953 () Bool)

(declare-fun e!755310 () Bool)

(assert (=> b!1324953 (= e!755310 (= (apply!1022 lt!589407 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1279))))

(declare-fun b!1324954 () Bool)

(assert (=> b!1324954 (= e!755312 e!755315)))

(declare-fun res!879447 () Bool)

(assert (=> b!1324954 (=> (not res!879447) (not e!755315))))

(assert (=> b!1324954 (= res!879447 (contains!8704 lt!589407 (select (arr!43173 _keys!1609) from!2000)))))

(assert (=> b!1324954 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)))))

(declare-fun b!1324955 () Bool)

(assert (=> b!1324955 (= e!755308 e!755310)))

(declare-fun res!879449 () Bool)

(assert (=> b!1324955 (= res!879449 call!64688)))

(assert (=> b!1324955 (=> (not res!879449) (not e!755310))))

(declare-fun bm!64683 () Bool)

(assert (=> bm!64683 (= call!64687 (contains!8704 lt!589407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1324956 () Bool)

(declare-fun c!125645 () Bool)

(assert (=> b!1324956 (= c!125645 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1324956 (= e!755309 e!755313)))

(declare-fun b!1324957 () Bool)

(assert (=> b!1324957 (= e!755311 (= (apply!1022 lt!589407 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1279))))

(declare-fun b!1324958 () Bool)

(assert (=> b!1324958 (= e!755314 (not call!64687))))

(declare-fun bm!64684 () Bool)

(assert (=> bm!64684 (= call!64688 (contains!8704 lt!589407 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1324959 () Bool)

(declare-fun call!64686 () ListLongMap!21213)

(assert (=> b!1324959 (= e!755309 call!64686)))

(declare-fun b!1324960 () Bool)

(assert (=> b!1324960 (= e!755318 (validKeyInArray!0 (select (arr!43173 _keys!1609) from!2000)))))

(declare-fun b!1324961 () Bool)

(declare-fun lt!589386 () Unit!43443)

(assert (=> b!1324961 (= e!755316 lt!589386)))

(declare-fun lt!589394 () ListLongMap!21213)

(assert (=> b!1324961 (= lt!589394 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589397 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589397 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589390 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589390 (select (arr!43173 _keys!1609) from!2000))))

(declare-fun lt!589401 () Unit!43443)

(declare-fun addStillContains!1154 (ListLongMap!21213 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43443)

(assert (=> b!1324961 (= lt!589401 (addStillContains!1154 lt!589394 lt!589397 zeroValue!1279 lt!589390))))

(assert (=> b!1324961 (contains!8704 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279)) lt!589390)))

(declare-fun lt!589406 () Unit!43443)

(assert (=> b!1324961 (= lt!589406 lt!589401)))

(declare-fun lt!589392 () ListLongMap!21213)

(assert (=> b!1324961 (= lt!589392 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589402 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589402 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589400 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589400 (select (arr!43173 _keys!1609) from!2000))))

(declare-fun lt!589403 () Unit!43443)

(declare-fun addApplyDifferent!560 (ListLongMap!21213 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43443)

(assert (=> b!1324961 (= lt!589403 (addApplyDifferent!560 lt!589392 lt!589402 minValue!1279 lt!589400))))

(assert (=> b!1324961 (= (apply!1022 (+!4630 lt!589392 (tuple2!23557 lt!589402 minValue!1279)) lt!589400) (apply!1022 lt!589392 lt!589400))))

(declare-fun lt!589405 () Unit!43443)

(assert (=> b!1324961 (= lt!589405 lt!589403)))

(declare-fun lt!589389 () ListLongMap!21213)

(assert (=> b!1324961 (= lt!589389 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589395 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589395 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589398 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589398 (select (arr!43173 _keys!1609) from!2000))))

(declare-fun lt!589396 () Unit!43443)

(assert (=> b!1324961 (= lt!589396 (addApplyDifferent!560 lt!589389 lt!589395 zeroValue!1279 lt!589398))))

(assert (=> b!1324961 (= (apply!1022 (+!4630 lt!589389 (tuple2!23557 lt!589395 zeroValue!1279)) lt!589398) (apply!1022 lt!589389 lt!589398))))

(declare-fun lt!589387 () Unit!43443)

(assert (=> b!1324961 (= lt!589387 lt!589396)))

(declare-fun lt!589391 () ListLongMap!21213)

(assert (=> b!1324961 (= lt!589391 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))

(declare-fun lt!589404 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589404 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!589399 () (_ BitVec 64))

(assert (=> b!1324961 (= lt!589399 (select (arr!43173 _keys!1609) from!2000))))

(assert (=> b!1324961 (= lt!589386 (addApplyDifferent!560 lt!589391 lt!589404 minValue!1279 lt!589399))))

(assert (=> b!1324961 (= (apply!1022 (+!4630 lt!589391 (tuple2!23557 lt!589404 minValue!1279)) lt!589399) (apply!1022 lt!589391 lt!589399))))

(declare-fun bm!64685 () Bool)

(assert (=> bm!64685 (= call!64686 call!64683)))

(declare-fun bm!64686 () Bool)

(assert (=> bm!64686 (= call!64685 call!64689)))

(declare-fun b!1324962 () Bool)

(assert (=> b!1324962 (= e!755313 call!64686)))

(declare-fun b!1324963 () Bool)

(declare-fun Unit!43446 () Unit!43443)

(assert (=> b!1324963 (= e!755316 Unit!43446)))

(assert (= (and d!142785 c!125643) b!1324943))

(assert (= (and d!142785 (not c!125643)) b!1324952))

(assert (= (and b!1324952 c!125641) b!1324959))

(assert (= (and b!1324952 (not c!125641)) b!1324956))

(assert (= (and b!1324956 c!125645) b!1324962))

(assert (= (and b!1324956 (not c!125645)) b!1324945))

(assert (= (or b!1324962 b!1324945) bm!64686))

(assert (= (or b!1324959 bm!64686) bm!64681))

(assert (= (or b!1324959 b!1324962) bm!64685))

(assert (= (or b!1324943 bm!64681) bm!64680))

(assert (= (or b!1324943 bm!64685) bm!64682))

(assert (= (and d!142785 res!879445) b!1324960))

(assert (= (and d!142785 c!125642) b!1324961))

(assert (= (and d!142785 (not c!125642)) b!1324963))

(assert (= (and d!142785 res!879450) b!1324949))

(assert (= (and b!1324949 res!879451) b!1324947))

(assert (= (and b!1324949 (not res!879446)) b!1324954))

(assert (= (and b!1324954 res!879447) b!1324946))

(assert (= (and b!1324949 res!879448) b!1324944))

(assert (= (and b!1324944 c!125644) b!1324950))

(assert (= (and b!1324944 (not c!125644)) b!1324958))

(assert (= (and b!1324950 res!879452) b!1324957))

(assert (= (or b!1324950 b!1324958) bm!64683))

(assert (= (and b!1324944 res!879453) b!1324951))

(assert (= (and b!1324951 c!125646) b!1324955))

(assert (= (and b!1324951 (not c!125646)) b!1324948))

(assert (= (and b!1324955 res!879449) b!1324953))

(assert (= (or b!1324955 b!1324948) bm!64684))

(declare-fun b_lambda!23703 () Bool)

(assert (=> (not b_lambda!23703) (not b!1324946)))

(assert (=> b!1324946 t!44604))

(declare-fun b_and!48989 () Bool)

(assert (= b_and!48979 (and (=> t!44604 result!24509) b_and!48989)))

(assert (=> d!142785 m!1213061))

(assert (=> b!1324946 m!1213067))

(declare-fun m!1213187 () Bool)

(assert (=> b!1324946 m!1213187))

(assert (=> b!1324946 m!1213087))

(assert (=> b!1324946 m!1213079))

(assert (=> b!1324946 m!1213091))

(assert (=> b!1324946 m!1213087))

(assert (=> b!1324946 m!1213067))

(assert (=> b!1324946 m!1213079))

(declare-fun m!1213189 () Bool)

(assert (=> b!1324957 m!1213189))

(declare-fun m!1213191 () Bool)

(assert (=> b!1324953 m!1213191))

(declare-fun m!1213193 () Bool)

(assert (=> bm!64680 m!1213193))

(assert (=> b!1324947 m!1213067))

(assert (=> b!1324947 m!1213067))

(assert (=> b!1324947 m!1213093))

(declare-fun m!1213195 () Bool)

(assert (=> bm!64683 m!1213195))

(declare-fun m!1213197 () Bool)

(assert (=> bm!64682 m!1213197))

(declare-fun m!1213199 () Bool)

(assert (=> bm!64684 m!1213199))

(assert (=> b!1324954 m!1213067))

(assert (=> b!1324954 m!1213067))

(declare-fun m!1213201 () Bool)

(assert (=> b!1324954 m!1213201))

(declare-fun m!1213203 () Bool)

(assert (=> b!1324943 m!1213203))

(declare-fun m!1213205 () Bool)

(assert (=> b!1324961 m!1213205))

(declare-fun m!1213207 () Bool)

(assert (=> b!1324961 m!1213207))

(declare-fun m!1213209 () Bool)

(assert (=> b!1324961 m!1213209))

(declare-fun m!1213211 () Bool)

(assert (=> b!1324961 m!1213211))

(declare-fun m!1213213 () Bool)

(assert (=> b!1324961 m!1213213))

(assert (=> b!1324961 m!1213209))

(declare-fun m!1213215 () Bool)

(assert (=> b!1324961 m!1213215))

(declare-fun m!1213217 () Bool)

(assert (=> b!1324961 m!1213217))

(assert (=> b!1324961 m!1213211))

(declare-fun m!1213219 () Bool)

(assert (=> b!1324961 m!1213219))

(declare-fun m!1213221 () Bool)

(assert (=> b!1324961 m!1213221))

(assert (=> b!1324961 m!1213193))

(assert (=> b!1324961 m!1213205))

(assert (=> b!1324961 m!1213067))

(declare-fun m!1213223 () Bool)

(assert (=> b!1324961 m!1213223))

(declare-fun m!1213225 () Bool)

(assert (=> b!1324961 m!1213225))

(assert (=> b!1324961 m!1213217))

(declare-fun m!1213227 () Bool)

(assert (=> b!1324961 m!1213227))

(declare-fun m!1213229 () Bool)

(assert (=> b!1324961 m!1213229))

(declare-fun m!1213231 () Bool)

(assert (=> b!1324961 m!1213231))

(declare-fun m!1213233 () Bool)

(assert (=> b!1324961 m!1213233))

(assert (=> b!1324960 m!1213067))

(assert (=> b!1324960 m!1213067))

(assert (=> b!1324960 m!1213093))

(assert (=> b!1324805 d!142785))

(declare-fun d!142787 () Bool)

(assert (=> d!142787 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111800 d!142787))

(declare-fun d!142789 () Bool)

(assert (=> d!142789 (= (array_inv!32775 _keys!1609) (bvsge (size!43725 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111800 d!142789))

(declare-fun d!142791 () Bool)

(assert (=> d!142791 (= (array_inv!32776 _values!1337) (bvsge (size!43726 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111800 d!142791))

(declare-fun b!1324974 () Bool)

(declare-fun e!755332 () Bool)

(declare-fun contains!8706 (List!30686 (_ BitVec 64)) Bool)

(assert (=> b!1324974 (= e!755332 (contains!8706 Nil!30683 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1324975 () Bool)

(declare-fun e!755329 () Bool)

(declare-fun call!64692 () Bool)

(assert (=> b!1324975 (= e!755329 call!64692)))

(declare-fun b!1324976 () Bool)

(declare-fun e!755330 () Bool)

(declare-fun e!755331 () Bool)

(assert (=> b!1324976 (= e!755330 e!755331)))

(declare-fun res!879460 () Bool)

(assert (=> b!1324976 (=> (not res!879460) (not e!755331))))

(assert (=> b!1324976 (= res!879460 (not e!755332))))

(declare-fun res!879462 () Bool)

(assert (=> b!1324976 (=> (not res!879462) (not e!755332))))

(assert (=> b!1324976 (= res!879462 (validKeyInArray!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun d!142793 () Bool)

(declare-fun res!879461 () Bool)

(assert (=> d!142793 (=> res!879461 e!755330)))

(assert (=> d!142793 (= res!879461 (bvsge #b00000000000000000000000000000000 (size!43725 _keys!1609)))))

(assert (=> d!142793 (= (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30683) e!755330)))

(declare-fun b!1324977 () Bool)

(assert (=> b!1324977 (= e!755329 call!64692)))

(declare-fun bm!64689 () Bool)

(declare-fun c!125649 () Bool)

(assert (=> bm!64689 (= call!64692 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125649 (Cons!30682 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) Nil!30683) Nil!30683)))))

(declare-fun b!1324978 () Bool)

(assert (=> b!1324978 (= e!755331 e!755329)))

(assert (=> b!1324978 (= c!125649 (validKeyInArray!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142793 (not res!879461)) b!1324976))

(assert (= (and b!1324976 res!879462) b!1324974))

(assert (= (and b!1324976 res!879460) b!1324978))

(assert (= (and b!1324978 c!125649) b!1324977))

(assert (= (and b!1324978 (not c!125649)) b!1324975))

(assert (= (or b!1324977 b!1324975) bm!64689))

(assert (=> b!1324974 m!1213167))

(assert (=> b!1324974 m!1213167))

(declare-fun m!1213235 () Bool)

(assert (=> b!1324974 m!1213235))

(assert (=> b!1324976 m!1213167))

(assert (=> b!1324976 m!1213167))

(assert (=> b!1324976 m!1213175))

(assert (=> bm!64689 m!1213167))

(declare-fun m!1213237 () Bool)

(assert (=> bm!64689 m!1213237))

(assert (=> b!1324978 m!1213167))

(assert (=> b!1324978 m!1213167))

(assert (=> b!1324978 m!1213175))

(assert (=> b!1324801 d!142793))

(declare-fun d!142795 () Bool)

(declare-fun e!755333 () Bool)

(assert (=> d!142795 e!755333))

(declare-fun res!879463 () Bool)

(assert (=> d!142795 (=> res!879463 e!755333)))

(declare-fun lt!589409 () Bool)

(assert (=> d!142795 (= res!879463 (not lt!589409))))

(declare-fun lt!589411 () Bool)

(assert (=> d!142795 (= lt!589409 lt!589411)))

(declare-fun lt!589408 () Unit!43443)

(declare-fun e!755334 () Unit!43443)

(assert (=> d!142795 (= lt!589408 e!755334)))

(declare-fun c!125650 () Bool)

(assert (=> d!142795 (= c!125650 lt!589411)))

(assert (=> d!142795 (= lt!589411 (containsKey!732 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> d!142795 (= (contains!8704 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164) lt!589409)))

(declare-fun b!1324979 () Bool)

(declare-fun lt!589410 () Unit!43443)

(assert (=> b!1324979 (= e!755334 lt!589410)))

(assert (=> b!1324979 (= lt!589410 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (=> b!1324979 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun b!1324980 () Bool)

(declare-fun Unit!43447 () Unit!43443)

(assert (=> b!1324980 (= e!755334 Unit!43447)))

(declare-fun b!1324981 () Bool)

(assert (=> b!1324981 (= e!755333 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)))))

(assert (= (and d!142795 c!125650) b!1324979))

(assert (= (and d!142795 (not c!125650)) b!1324980))

(assert (= (and d!142795 (not res!879463)) b!1324981))

(declare-fun m!1213239 () Bool)

(assert (=> d!142795 m!1213239))

(declare-fun m!1213241 () Bool)

(assert (=> b!1324979 m!1213241))

(declare-fun m!1213243 () Bool)

(assert (=> b!1324979 m!1213243))

(assert (=> b!1324979 m!1213243))

(declare-fun m!1213245 () Bool)

(assert (=> b!1324979 m!1213245))

(assert (=> b!1324981 m!1213243))

(assert (=> b!1324981 m!1213243))

(assert (=> b!1324981 m!1213245))

(assert (=> b!1324800 d!142795))

(declare-fun d!142797 () Bool)

(declare-fun e!755337 () Bool)

(assert (=> d!142797 e!755337))

(declare-fun res!879469 () Bool)

(assert (=> d!142797 (=> (not res!879469) (not e!755337))))

(declare-fun lt!589421 () ListLongMap!21213)

(assert (=> d!142797 (= res!879469 (contains!8704 lt!589421 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!589423 () List!30685)

(assert (=> d!142797 (= lt!589421 (ListLongMap!21214 lt!589423))))

(declare-fun lt!589422 () Unit!43443)

(declare-fun lt!589420 () Unit!43443)

(assert (=> d!142797 (= lt!589422 lt!589420)))

(assert (=> d!142797 (= (getValueByKey!715 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!765 (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!358 (List!30685 (_ BitVec 64) V!53473) Unit!43443)

(assert (=> d!142797 (= lt!589420 (lemmaContainsTupThenGetReturnValue!358 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!487 (List!30685 (_ BitVec 64) V!53473) List!30685)

(assert (=> d!142797 (= lt!589423 (insertStrictlySorted!487 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142797 (= (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!589421)))

(declare-fun b!1324986 () Bool)

(declare-fun res!879468 () Bool)

(assert (=> b!1324986 (=> (not res!879468) (not e!755337))))

(assert (=> b!1324986 (= res!879468 (= (getValueByKey!715 (toList!10622 lt!589421) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!765 (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1324987 () Bool)

(declare-fun contains!8707 (List!30685 tuple2!23556) Bool)

(assert (=> b!1324987 (= e!755337 (contains!8707 (toList!10622 lt!589421) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142797 res!879469) b!1324986))

(assert (= (and b!1324986 res!879468) b!1324987))

(declare-fun m!1213247 () Bool)

(assert (=> d!142797 m!1213247))

(declare-fun m!1213249 () Bool)

(assert (=> d!142797 m!1213249))

(declare-fun m!1213251 () Bool)

(assert (=> d!142797 m!1213251))

(declare-fun m!1213253 () Bool)

(assert (=> d!142797 m!1213253))

(declare-fun m!1213255 () Bool)

(assert (=> b!1324986 m!1213255))

(declare-fun m!1213257 () Bool)

(assert (=> b!1324987 m!1213257))

(assert (=> b!1324800 d!142797))

(declare-fun d!142799 () Bool)

(declare-fun c!125653 () Bool)

(assert (=> d!142799 (= c!125653 ((_ is ValueCellFull!17240) (select (arr!43174 _values!1337) from!2000)))))

(declare-fun e!755340 () V!53473)

(assert (=> d!142799 (= (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!755340)))

(declare-fun b!1324992 () Bool)

(declare-fun get!21743 (ValueCell!17240 V!53473) V!53473)

(assert (=> b!1324992 (= e!755340 (get!21743 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1324993 () Bool)

(declare-fun get!21744 (ValueCell!17240 V!53473) V!53473)

(assert (=> b!1324993 (= e!755340 (get!21744 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142799 c!125653) b!1324992))

(assert (= (and d!142799 (not c!125653)) b!1324993))

(assert (=> b!1324992 m!1213087))

(assert (=> b!1324992 m!1213079))

(declare-fun m!1213259 () Bool)

(assert (=> b!1324992 m!1213259))

(assert (=> b!1324993 m!1213087))

(assert (=> b!1324993 m!1213079))

(declare-fun m!1213261 () Bool)

(assert (=> b!1324993 m!1213261))

(assert (=> b!1324800 d!142799))

(declare-fun b!1325018 () Bool)

(declare-fun e!755357 () Bool)

(declare-fun e!755358 () Bool)

(assert (=> b!1325018 (= e!755357 e!755358)))

(declare-fun c!125664 () Bool)

(declare-fun e!755359 () Bool)

(assert (=> b!1325018 (= c!125664 e!755359)))

(declare-fun res!879481 () Bool)

(assert (=> b!1325018 (=> (not res!879481) (not e!755359))))

(assert (=> b!1325018 (= res!879481 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43725 _keys!1609)))))

(declare-fun b!1325019 () Bool)

(declare-fun e!755360 () Bool)

(assert (=> b!1325019 (= e!755358 e!755360)))

(assert (=> b!1325019 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43725 _keys!1609)))))

(declare-fun res!879480 () Bool)

(declare-fun lt!589439 () ListLongMap!21213)

(assert (=> b!1325019 (= res!879480 (contains!8704 lt!589439 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1325019 (=> (not res!879480) (not e!755360))))

(declare-fun b!1325020 () Bool)

(declare-fun e!755361 () Bool)

(assert (=> b!1325020 (= e!755361 (= lt!589439 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun d!142801 () Bool)

(assert (=> d!142801 e!755357))

(declare-fun res!879478 () Bool)

(assert (=> d!142801 (=> (not res!879478) (not e!755357))))

(assert (=> d!142801 (= res!879478 (not (contains!8704 lt!589439 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!755356 () ListLongMap!21213)

(assert (=> d!142801 (= lt!589439 e!755356)))

(declare-fun c!125662 () Bool)

(assert (=> d!142801 (= c!125662 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) (size!43725 _keys!1609)))))

(assert (=> d!142801 (validMask!0 mask!2019)))

(assert (=> d!142801 (= (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) lt!589439)))

(declare-fun b!1325021 () Bool)

(declare-fun e!755355 () ListLongMap!21213)

(assert (=> b!1325021 (= e!755356 e!755355)))

(declare-fun c!125663 () Bool)

(assert (=> b!1325021 (= c!125663 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1325022 () Bool)

(declare-fun res!879479 () Bool)

(assert (=> b!1325022 (=> (not res!879479) (not e!755357))))

(assert (=> b!1325022 (= res!879479 (not (contains!8704 lt!589439 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325023 () Bool)

(assert (=> b!1325023 (= e!755358 e!755361)))

(declare-fun c!125665 () Bool)

(assert (=> b!1325023 (= c!125665 (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43725 _keys!1609)))))

(declare-fun b!1325024 () Bool)

(assert (=> b!1325024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43725 _keys!1609)))))

(assert (=> b!1325024 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000) (size!43726 _values!1337)))))

(assert (=> b!1325024 (= e!755360 (= (apply!1022 lt!589439 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325025 () Bool)

(assert (=> b!1325025 (= e!755356 (ListLongMap!21214 Nil!30682))))

(declare-fun b!1325026 () Bool)

(declare-fun isEmpty!1081 (ListLongMap!21213) Bool)

(assert (=> b!1325026 (= e!755361 (isEmpty!1081 lt!589439))))

(declare-fun bm!64692 () Bool)

(declare-fun call!64695 () ListLongMap!21213)

(assert (=> bm!64692 (= call!64695 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1325027 () Bool)

(assert (=> b!1325027 (= e!755355 call!64695)))

(declare-fun b!1325028 () Bool)

(assert (=> b!1325028 (= e!755359 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1325028 (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))

(declare-fun b!1325029 () Bool)

(declare-fun lt!589440 () Unit!43443)

(declare-fun lt!589438 () Unit!43443)

(assert (=> b!1325029 (= lt!589440 lt!589438)))

(declare-fun lt!589443 () (_ BitVec 64))

(declare-fun lt!589442 () V!53473)

(declare-fun lt!589444 () ListLongMap!21213)

(declare-fun lt!589441 () (_ BitVec 64))

(assert (=> b!1325029 (not (contains!8704 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442)) lt!589441))))

(declare-fun addStillNotContains!481 (ListLongMap!21213 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43443)

(assert (=> b!1325029 (= lt!589438 (addStillNotContains!481 lt!589444 lt!589443 lt!589442 lt!589441))))

(assert (=> b!1325029 (= lt!589441 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1325029 (= lt!589442 (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1325029 (= lt!589443 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))

(assert (=> b!1325029 (= lt!589444 call!64695)))

(assert (=> b!1325029 (= e!755355 (+!4630 call!64695 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142801 c!125662) b!1325025))

(assert (= (and d!142801 (not c!125662)) b!1325021))

(assert (= (and b!1325021 c!125663) b!1325029))

(assert (= (and b!1325021 (not c!125663)) b!1325027))

(assert (= (or b!1325029 b!1325027) bm!64692))

(assert (= (and d!142801 res!879478) b!1325022))

(assert (= (and b!1325022 res!879479) b!1325018))

(assert (= (and b!1325018 res!879481) b!1325028))

(assert (= (and b!1325018 c!125664) b!1325019))

(assert (= (and b!1325018 (not c!125664)) b!1325023))

(assert (= (and b!1325019 res!879480) b!1325024))

(assert (= (and b!1325023 c!125665) b!1325020))

(assert (= (and b!1325023 (not c!125665)) b!1325026))

(declare-fun b_lambda!23705 () Bool)

(assert (=> (not b_lambda!23705) (not b!1325024)))

(assert (=> b!1325024 t!44604))

(declare-fun b_and!48991 () Bool)

(assert (= b_and!48989 (and (=> t!44604 result!24509) b_and!48991)))

(declare-fun b_lambda!23707 () Bool)

(assert (=> (not b_lambda!23707) (not b!1325029)))

(assert (=> b!1325029 t!44604))

(declare-fun b_and!48993 () Bool)

(assert (= b_and!48991 (and (=> t!44604 result!24509) b_and!48993)))

(declare-fun m!1213263 () Bool)

(assert (=> b!1325026 m!1213263))

(declare-fun m!1213265 () Bool)

(assert (=> bm!64692 m!1213265))

(declare-fun m!1213267 () Bool)

(assert (=> b!1325019 m!1213267))

(assert (=> b!1325019 m!1213267))

(declare-fun m!1213269 () Bool)

(assert (=> b!1325019 m!1213269))

(assert (=> b!1325024 m!1213267))

(declare-fun m!1213271 () Bool)

(assert (=> b!1325024 m!1213271))

(assert (=> b!1325024 m!1213079))

(declare-fun m!1213273 () Bool)

(assert (=> b!1325024 m!1213273))

(assert (=> b!1325024 m!1213079))

(assert (=> b!1325024 m!1213271))

(assert (=> b!1325024 m!1213267))

(declare-fun m!1213275 () Bool)

(assert (=> b!1325024 m!1213275))

(assert (=> b!1325029 m!1213267))

(declare-fun m!1213277 () Bool)

(assert (=> b!1325029 m!1213277))

(assert (=> b!1325029 m!1213271))

(assert (=> b!1325029 m!1213079))

(assert (=> b!1325029 m!1213273))

(assert (=> b!1325029 m!1213079))

(assert (=> b!1325029 m!1213271))

(declare-fun m!1213279 () Bool)

(assert (=> b!1325029 m!1213279))

(declare-fun m!1213281 () Bool)

(assert (=> b!1325029 m!1213281))

(declare-fun m!1213283 () Bool)

(assert (=> b!1325029 m!1213283))

(assert (=> b!1325029 m!1213281))

(declare-fun m!1213285 () Bool)

(assert (=> d!142801 m!1213285))

(assert (=> d!142801 m!1213061))

(assert (=> b!1325028 m!1213267))

(assert (=> b!1325028 m!1213267))

(declare-fun m!1213287 () Bool)

(assert (=> b!1325028 m!1213287))

(declare-fun m!1213289 () Bool)

(assert (=> b!1325022 m!1213289))

(assert (=> b!1325020 m!1213265))

(assert (=> b!1325021 m!1213267))

(assert (=> b!1325021 m!1213267))

(assert (=> b!1325021 m!1213287))

(assert (=> b!1324800 d!142801))

(declare-fun d!142803 () Bool)

(declare-fun e!755362 () Bool)

(assert (=> d!142803 e!755362))

(declare-fun res!879483 () Bool)

(assert (=> d!142803 (=> (not res!879483) (not e!755362))))

(declare-fun lt!589446 () ListLongMap!21213)

(assert (=> d!142803 (= res!879483 (contains!8704 lt!589446 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!589448 () List!30685)

(assert (=> d!142803 (= lt!589446 (ListLongMap!21214 lt!589448))))

(declare-fun lt!589447 () Unit!43443)

(declare-fun lt!589445 () Unit!43443)

(assert (=> d!142803 (= lt!589447 lt!589445)))

(assert (=> d!142803 (= (getValueByKey!715 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142803 (= lt!589445 (lemmaContainsTupThenGetReturnValue!358 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142803 (= lt!589448 (insertStrictlySorted!487 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142803 (= (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!589446)))

(declare-fun b!1325030 () Bool)

(declare-fun res!879482 () Bool)

(assert (=> b!1325030 (=> (not res!879482) (not e!755362))))

(assert (=> b!1325030 (= res!879482 (= (getValueByKey!715 (toList!10622 lt!589446) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1325031 () Bool)

(assert (=> b!1325031 (= e!755362 (contains!8707 (toList!10622 lt!589446) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142803 res!879483) b!1325030))

(assert (= (and b!1325030 res!879482) b!1325031))

(declare-fun m!1213291 () Bool)

(assert (=> d!142803 m!1213291))

(declare-fun m!1213293 () Bool)

(assert (=> d!142803 m!1213293))

(declare-fun m!1213295 () Bool)

(assert (=> d!142803 m!1213295))

(declare-fun m!1213297 () Bool)

(assert (=> d!142803 m!1213297))

(declare-fun m!1213299 () Bool)

(assert (=> b!1325030 m!1213299))

(declare-fun m!1213301 () Bool)

(assert (=> b!1325031 m!1213301))

(assert (=> b!1324800 d!142803))

(declare-fun d!142805 () Bool)

(declare-fun e!755363 () Bool)

(assert (=> d!142805 e!755363))

(declare-fun res!879485 () Bool)

(assert (=> d!142805 (=> (not res!879485) (not e!755363))))

(declare-fun lt!589450 () ListLongMap!21213)

(assert (=> d!142805 (= res!879485 (contains!8704 lt!589450 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun lt!589452 () List!30685)

(assert (=> d!142805 (= lt!589450 (ListLongMap!21214 lt!589452))))

(declare-fun lt!589451 () Unit!43443)

(declare-fun lt!589449 () Unit!43443)

(assert (=> d!142805 (= lt!589451 lt!589449)))

(assert (=> d!142805 (= (getValueByKey!715 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142805 (= lt!589449 (lemmaContainsTupThenGetReturnValue!358 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142805 (= lt!589452 (insertStrictlySorted!487 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142805 (= (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) lt!589450)))

(declare-fun b!1325032 () Bool)

(declare-fun res!879484 () Bool)

(assert (=> b!1325032 (=> (not res!879484) (not e!755363))))

(assert (=> b!1325032 (= res!879484 (= (getValueByKey!715 (toList!10622 lt!589450) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun b!1325033 () Bool)

(assert (=> b!1325033 (= e!755363 (contains!8707 (toList!10622 lt!589450) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and d!142805 res!879485) b!1325032))

(assert (= (and b!1325032 res!879484) b!1325033))

(declare-fun m!1213303 () Bool)

(assert (=> d!142805 m!1213303))

(declare-fun m!1213305 () Bool)

(assert (=> d!142805 m!1213305))

(declare-fun m!1213307 () Bool)

(assert (=> d!142805 m!1213307))

(declare-fun m!1213309 () Bool)

(assert (=> d!142805 m!1213309))

(declare-fun m!1213311 () Bool)

(assert (=> b!1325032 m!1213311))

(declare-fun m!1213313 () Bool)

(assert (=> b!1325033 m!1213313))

(assert (=> b!1324800 d!142805))

(declare-fun b!1325040 () Bool)

(declare-fun e!755368 () Bool)

(assert (=> b!1325040 (= e!755368 tp_is_empty!36277)))

(declare-fun mapNonEmpty!56072 () Bool)

(declare-fun mapRes!56072 () Bool)

(declare-fun tp!106863 () Bool)

(assert (=> mapNonEmpty!56072 (= mapRes!56072 (and tp!106863 e!755368))))

(declare-fun mapRest!56072 () (Array (_ BitVec 32) ValueCell!17240))

(declare-fun mapKey!56072 () (_ BitVec 32))

(declare-fun mapValue!56072 () ValueCell!17240)

(assert (=> mapNonEmpty!56072 (= mapRest!56063 (store mapRest!56072 mapKey!56072 mapValue!56072))))

(declare-fun condMapEmpty!56072 () Bool)

(declare-fun mapDefault!56072 () ValueCell!17240)

(assert (=> mapNonEmpty!56063 (= condMapEmpty!56072 (= mapRest!56063 ((as const (Array (_ BitVec 32) ValueCell!17240)) mapDefault!56072)))))

(declare-fun e!755369 () Bool)

(assert (=> mapNonEmpty!56063 (= tp!106848 (and e!755369 mapRes!56072))))

(declare-fun b!1325041 () Bool)

(assert (=> b!1325041 (= e!755369 tp_is_empty!36277)))

(declare-fun mapIsEmpty!56072 () Bool)

(assert (=> mapIsEmpty!56072 mapRes!56072))

(assert (= (and mapNonEmpty!56063 condMapEmpty!56072) mapIsEmpty!56072))

(assert (= (and mapNonEmpty!56063 (not condMapEmpty!56072)) mapNonEmpty!56072))

(assert (= (and mapNonEmpty!56072 ((_ is ValueCellFull!17240) mapValue!56072)) b!1325040))

(assert (= (and mapNonEmpty!56063 ((_ is ValueCellFull!17240) mapDefault!56072)) b!1325041))

(declare-fun m!1213315 () Bool)

(assert (=> mapNonEmpty!56072 m!1213315))

(declare-fun b_lambda!23709 () Bool)

(assert (= b_lambda!23703 (or (and start!111800 b_free!30457) b_lambda!23709)))

(declare-fun b_lambda!23711 () Bool)

(assert (= b_lambda!23707 (or (and start!111800 b_free!30457) b_lambda!23711)))

(declare-fun b_lambda!23713 () Bool)

(assert (= b_lambda!23705 (or (and start!111800 b_free!30457) b_lambda!23713)))

(check-sat (not mapNonEmpty!56072) (not b!1324946) (not b!1324957) (not bm!64689) (not d!142785) (not b!1324981) (not b!1325031) (not bm!64665) (not d!142805) (not b_next!30457) (not b!1325026) (not b!1324947) (not d!142803) (not b!1324987) (not bm!64680) (not b!1324961) (not b_lambda!23709) (not d!142783) b_and!48993 (not b!1325030) (not b!1325029) (not b!1325024) (not b!1324943) (not b!1324992) (not b!1324979) (not b!1324960) (not b_lambda!23711) (not b!1325022) (not b!1324898) (not b!1324986) (not b!1325019) (not b!1324954) (not b_lambda!23701) (not b!1324900) (not b!1325028) (not d!142795) (not b!1324978) (not bm!64684) (not d!142801) (not bm!64682) (not b!1325033) (not b!1324890) (not b!1325020) (not b!1324974) (not d!142797) (not b!1325021) (not b!1324953) tp_is_empty!36277 (not b_lambda!23713) (not b!1324889) (not b!1324993) (not b!1325032) (not b!1324976) (not bm!64692) (not bm!64683))
(check-sat b_and!48993 (not b_next!30457))
(get-model)

(declare-fun d!142807 () Bool)

(assert (=> d!142807 (isDefined!522 (getValueByKey!715 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun lt!589455 () Unit!43443)

(declare-fun choose!1954 (List!30685 (_ BitVec 64)) Unit!43443)

(assert (=> d!142807 (= lt!589455 (choose!1954 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(declare-fun e!755372 () Bool)

(assert (=> d!142807 e!755372))

(declare-fun res!879488 () Bool)

(assert (=> d!142807 (=> (not res!879488) (not e!755372))))

(declare-fun isStrictlySorted!873 (List!30685) Bool)

(assert (=> d!142807 (= res!879488 (isStrictlySorted!873 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))

(assert (=> d!142807 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) lt!589455)))

(declare-fun b!1325044 () Bool)

(assert (=> b!1325044 (= e!755372 (containsKey!732 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))

(assert (= (and d!142807 res!879488) b!1325044))

(assert (=> d!142807 m!1213183))

(assert (=> d!142807 m!1213183))

(assert (=> d!142807 m!1213185))

(declare-fun m!1213317 () Bool)

(assert (=> d!142807 m!1213317))

(declare-fun m!1213319 () Bool)

(assert (=> d!142807 m!1213319))

(assert (=> b!1325044 m!1213179))

(assert (=> b!1324898 d!142807))

(declare-fun d!142809 () Bool)

(declare-fun isEmpty!1082 (Option!766) Bool)

(assert (=> d!142809 (= (isDefined!522 (getValueByKey!715 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164)) (not (isEmpty!1082 (getValueByKey!715 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164))))))

(declare-fun bs!37868 () Bool)

(assert (= bs!37868 d!142809))

(assert (=> bs!37868 m!1213183))

(declare-fun m!1213321 () Bool)

(assert (=> bs!37868 m!1213321))

(assert (=> b!1324898 d!142809))

(declare-fun b!1325056 () Bool)

(declare-fun e!755378 () Option!766)

(assert (=> b!1325056 (= e!755378 None!764)))

(declare-fun b!1325055 () Bool)

(assert (=> b!1325055 (= e!755378 (getValueByKey!715 (t!44605 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(declare-fun e!755377 () Option!766)

(declare-fun b!1325053 () Bool)

(assert (=> b!1325053 (= e!755377 (Some!765 (_2!11789 (h!31890 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))))))))

(declare-fun b!1325054 () Bool)

(assert (=> b!1325054 (= e!755377 e!755378)))

(declare-fun c!125671 () Bool)

(assert (=> b!1325054 (= c!125671 (and ((_ is Cons!30681) (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (not (= (_1!11789 (h!31890 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164))))))

(declare-fun c!125670 () Bool)

(declare-fun d!142811 () Bool)

(assert (=> d!142811 (= c!125670 (and ((_ is Cons!30681) (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11789 (h!31890 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!142811 (= (getValueByKey!715 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!755377)))

(assert (= (and d!142811 c!125670) b!1325053))

(assert (= (and d!142811 (not c!125670)) b!1325054))

(assert (= (and b!1325054 c!125671) b!1325055))

(assert (= (and b!1325054 (not c!125671)) b!1325056))

(declare-fun m!1213323 () Bool)

(assert (=> b!1325055 m!1213323))

(assert (=> b!1324898 d!142811))

(assert (=> b!1324947 d!142781))

(declare-fun d!142813 () Bool)

(declare-fun e!755379 () Bool)

(assert (=> d!142813 e!755379))

(declare-fun res!879489 () Bool)

(assert (=> d!142813 (=> res!879489 e!755379)))

(declare-fun lt!589457 () Bool)

(assert (=> d!142813 (= res!879489 (not lt!589457))))

(declare-fun lt!589459 () Bool)

(assert (=> d!142813 (= lt!589457 lt!589459)))

(declare-fun lt!589456 () Unit!43443)

(declare-fun e!755380 () Unit!43443)

(assert (=> d!142813 (= lt!589456 e!755380)))

(declare-fun c!125672 () Bool)

(assert (=> d!142813 (= c!125672 lt!589459)))

(assert (=> d!142813 (= lt!589459 (containsKey!732 (toList!10622 lt!589439) (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> d!142813 (= (contains!8704 lt!589439 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) lt!589457)))

(declare-fun b!1325057 () Bool)

(declare-fun lt!589458 () Unit!43443)

(assert (=> b!1325057 (= e!755380 lt!589458)))

(assert (=> b!1325057 (= lt!589458 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589439) (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(assert (=> b!1325057 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589439) (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun b!1325058 () Bool)

(declare-fun Unit!43448 () Unit!43443)

(assert (=> b!1325058 (= e!755380 Unit!43448)))

(declare-fun b!1325059 () Bool)

(assert (=> b!1325059 (= e!755379 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589439) (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(assert (= (and d!142813 c!125672) b!1325057))

(assert (= (and d!142813 (not c!125672)) b!1325058))

(assert (= (and d!142813 (not res!879489)) b!1325059))

(assert (=> d!142813 m!1213267))

(declare-fun m!1213325 () Bool)

(assert (=> d!142813 m!1213325))

(assert (=> b!1325057 m!1213267))

(declare-fun m!1213327 () Bool)

(assert (=> b!1325057 m!1213327))

(assert (=> b!1325057 m!1213267))

(declare-fun m!1213329 () Bool)

(assert (=> b!1325057 m!1213329))

(assert (=> b!1325057 m!1213329))

(declare-fun m!1213331 () Bool)

(assert (=> b!1325057 m!1213331))

(assert (=> b!1325059 m!1213267))

(assert (=> b!1325059 m!1213329))

(assert (=> b!1325059 m!1213329))

(assert (=> b!1325059 m!1213331))

(assert (=> b!1325019 d!142813))

(declare-fun d!142815 () Bool)

(declare-fun e!755381 () Bool)

(assert (=> d!142815 e!755381))

(declare-fun res!879490 () Bool)

(assert (=> d!142815 (=> res!879490 e!755381)))

(declare-fun lt!589461 () Bool)

(assert (=> d!142815 (= res!879490 (not lt!589461))))

(declare-fun lt!589463 () Bool)

(assert (=> d!142815 (= lt!589461 lt!589463)))

(declare-fun lt!589460 () Unit!43443)

(declare-fun e!755382 () Unit!43443)

(assert (=> d!142815 (= lt!589460 e!755382)))

(declare-fun c!125673 () Bool)

(assert (=> d!142815 (= c!125673 lt!589463)))

(assert (=> d!142815 (= lt!589463 (containsKey!732 (toList!10622 lt!589439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142815 (= (contains!8704 lt!589439 #b0000000000000000000000000000000000000000000000000000000000000000) lt!589461)))

(declare-fun b!1325060 () Bool)

(declare-fun lt!589462 () Unit!43443)

(assert (=> b!1325060 (= e!755382 lt!589462)))

(assert (=> b!1325060 (= lt!589462 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325060 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589439) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325061 () Bool)

(declare-fun Unit!43449 () Unit!43443)

(assert (=> b!1325061 (= e!755382 Unit!43449)))

(declare-fun b!1325062 () Bool)

(assert (=> b!1325062 (= e!755381 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589439) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142815 c!125673) b!1325060))

(assert (= (and d!142815 (not c!125673)) b!1325061))

(assert (= (and d!142815 (not res!879490)) b!1325062))

(declare-fun m!1213333 () Bool)

(assert (=> d!142815 m!1213333))

(declare-fun m!1213335 () Bool)

(assert (=> b!1325060 m!1213335))

(declare-fun m!1213337 () Bool)

(assert (=> b!1325060 m!1213337))

(assert (=> b!1325060 m!1213337))

(declare-fun m!1213339 () Bool)

(assert (=> b!1325060 m!1213339))

(assert (=> b!1325062 m!1213337))

(assert (=> b!1325062 m!1213337))

(assert (=> b!1325062 m!1213339))

(assert (=> d!142801 d!142815))

(assert (=> d!142801 d!142787))

(declare-fun d!142817 () Bool)

(declare-fun get!21745 (Option!766) V!53473)

(assert (=> d!142817 (= (apply!1022 lt!589407 (select (arr!43173 _keys!1609) from!2000)) (get!21745 (getValueByKey!715 (toList!10622 lt!589407) (select (arr!43173 _keys!1609) from!2000))))))

(declare-fun bs!37869 () Bool)

(assert (= bs!37869 d!142817))

(assert (=> bs!37869 m!1213067))

(declare-fun m!1213341 () Bool)

(assert (=> bs!37869 m!1213341))

(assert (=> bs!37869 m!1213341))

(declare-fun m!1213343 () Bool)

(assert (=> bs!37869 m!1213343))

(assert (=> b!1324946 d!142817))

(assert (=> b!1324946 d!142799))

(declare-fun d!142819 () Bool)

(declare-fun e!755383 () Bool)

(assert (=> d!142819 e!755383))

(declare-fun res!879491 () Bool)

(assert (=> d!142819 (=> res!879491 e!755383)))

(declare-fun lt!589465 () Bool)

(assert (=> d!142819 (= res!879491 (not lt!589465))))

(declare-fun lt!589467 () Bool)

(assert (=> d!142819 (= lt!589465 lt!589467)))

(declare-fun lt!589464 () Unit!43443)

(declare-fun e!755384 () Unit!43443)

(assert (=> d!142819 (= lt!589464 e!755384)))

(declare-fun c!125674 () Bool)

(assert (=> d!142819 (= c!125674 lt!589467)))

(assert (=> d!142819 (= lt!589467 (containsKey!732 (toList!10622 lt!589421) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142819 (= (contains!8704 lt!589421 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!589465)))

(declare-fun b!1325063 () Bool)

(declare-fun lt!589466 () Unit!43443)

(assert (=> b!1325063 (= e!755384 lt!589466)))

(assert (=> b!1325063 (= lt!589466 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589421) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!1325063 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589421) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325064 () Bool)

(declare-fun Unit!43450 () Unit!43443)

(assert (=> b!1325064 (= e!755384 Unit!43450)))

(declare-fun b!1325065 () Bool)

(assert (=> b!1325065 (= e!755383 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589421) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!142819 c!125674) b!1325063))

(assert (= (and d!142819 (not c!125674)) b!1325064))

(assert (= (and d!142819 (not res!879491)) b!1325065))

(declare-fun m!1213345 () Bool)

(assert (=> d!142819 m!1213345))

(declare-fun m!1213347 () Bool)

(assert (=> b!1325063 m!1213347))

(assert (=> b!1325063 m!1213255))

(assert (=> b!1325063 m!1213255))

(declare-fun m!1213349 () Bool)

(assert (=> b!1325063 m!1213349))

(assert (=> b!1325065 m!1213255))

(assert (=> b!1325065 m!1213255))

(assert (=> b!1325065 m!1213349))

(assert (=> d!142797 d!142819))

(declare-fun b!1325069 () Bool)

(declare-fun e!755386 () Option!766)

(assert (=> b!1325069 (= e!755386 None!764)))

(declare-fun b!1325068 () Bool)

(assert (=> b!1325068 (= e!755386 (getValueByKey!715 (t!44605 lt!589423) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325066 () Bool)

(declare-fun e!755385 () Option!766)

(assert (=> b!1325066 (= e!755385 (Some!765 (_2!11789 (h!31890 lt!589423))))))

(declare-fun b!1325067 () Bool)

(assert (=> b!1325067 (= e!755385 e!755386)))

(declare-fun c!125676 () Bool)

(assert (=> b!1325067 (= c!125676 (and ((_ is Cons!30681) lt!589423) (not (= (_1!11789 (h!31890 lt!589423)) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun d!142821 () Bool)

(declare-fun c!125675 () Bool)

(assert (=> d!142821 (= c!125675 (and ((_ is Cons!30681) lt!589423) (= (_1!11789 (h!31890 lt!589423)) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!142821 (= (getValueByKey!715 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!755385)))

(assert (= (and d!142821 c!125675) b!1325066))

(assert (= (and d!142821 (not c!125675)) b!1325067))

(assert (= (and b!1325067 c!125676) b!1325068))

(assert (= (and b!1325067 (not c!125676)) b!1325069))

(declare-fun m!1213351 () Bool)

(assert (=> b!1325068 m!1213351))

(assert (=> d!142797 d!142821))

(declare-fun d!142823 () Bool)

(assert (=> d!142823 (= (getValueByKey!715 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!765 (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!589470 () Unit!43443)

(declare-fun choose!1955 (List!30685 (_ BitVec 64) V!53473) Unit!43443)

(assert (=> d!142823 (= lt!589470 (choose!1955 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!755389 () Bool)

(assert (=> d!142823 e!755389))

(declare-fun res!879496 () Bool)

(assert (=> d!142823 (=> (not res!879496) (not e!755389))))

(assert (=> d!142823 (= res!879496 (isStrictlySorted!873 lt!589423))))

(assert (=> d!142823 (= (lemmaContainsTupThenGetReturnValue!358 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!589470)))

(declare-fun b!1325074 () Bool)

(declare-fun res!879497 () Bool)

(assert (=> b!1325074 (=> (not res!879497) (not e!755389))))

(assert (=> b!1325074 (= res!879497 (containsKey!732 lt!589423 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325075 () Bool)

(assert (=> b!1325075 (= e!755389 (contains!8707 lt!589423 (tuple2!23557 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!142823 res!879496) b!1325074))

(assert (= (and b!1325074 res!879497) b!1325075))

(assert (=> d!142823 m!1213249))

(declare-fun m!1213353 () Bool)

(assert (=> d!142823 m!1213353))

(declare-fun m!1213355 () Bool)

(assert (=> d!142823 m!1213355))

(declare-fun m!1213357 () Bool)

(assert (=> b!1325074 m!1213357))

(declare-fun m!1213359 () Bool)

(assert (=> b!1325075 m!1213359))

(assert (=> d!142797 d!142823))

(declare-fun b!1325096 () Bool)

(declare-fun e!755404 () List!30685)

(declare-fun e!755402 () List!30685)

(assert (=> b!1325096 (= e!755404 e!755402)))

(declare-fun c!125688 () Bool)

(assert (=> b!1325096 (= c!125688 (and ((_ is Cons!30681) (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (= (_1!11789 (h!31890 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun d!142825 () Bool)

(declare-fun e!755400 () Bool)

(assert (=> d!142825 e!755400))

(declare-fun res!879502 () Bool)

(assert (=> d!142825 (=> (not res!879502) (not e!755400))))

(declare-fun lt!589473 () List!30685)

(assert (=> d!142825 (= res!879502 (isStrictlySorted!873 lt!589473))))

(assert (=> d!142825 (= lt!589473 e!755404)))

(declare-fun c!125686 () Bool)

(assert (=> d!142825 (= c!125686 (and ((_ is Cons!30681) (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvslt (_1!11789 (h!31890 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!142825 (isStrictlySorted!873 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))))

(assert (=> d!142825 (= (insertStrictlySorted!487 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!589473)))

(declare-fun bm!64699 () Bool)

(declare-fun call!64704 () List!30685)

(declare-fun call!64702 () List!30685)

(assert (=> bm!64699 (= call!64704 call!64702)))

(declare-fun b!1325097 () Bool)

(declare-fun res!879503 () Bool)

(assert (=> b!1325097 (=> (not res!879503) (not e!755400))))

(assert (=> b!1325097 (= res!879503 (containsKey!732 lt!589473 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325098 () Bool)

(assert (=> b!1325098 (= e!755402 call!64702)))

(declare-fun b!1325099 () Bool)

(declare-fun e!755403 () List!30685)

(assert (=> b!1325099 (= e!755403 call!64704)))

(declare-fun b!1325100 () Bool)

(assert (=> b!1325100 (= e!755403 call!64704)))

(declare-fun b!1325101 () Bool)

(declare-fun c!125685 () Bool)

(assert (=> b!1325101 (= c!125685 (and ((_ is Cons!30681) (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (bvsgt (_1!11789 (h!31890 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!1325101 (= e!755402 e!755403)))

(declare-fun b!1325102 () Bool)

(assert (=> b!1325102 (= e!755400 (contains!8707 lt!589473 (tuple2!23557 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun e!755401 () List!30685)

(declare-fun b!1325103 () Bool)

(assert (=> b!1325103 (= e!755401 (ite c!125688 (t!44605 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (ite c!125685 (Cons!30681 (h!31890 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (t!44605 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340)))) Nil!30682)))))

(declare-fun bm!64700 () Bool)

(declare-fun call!64703 () List!30685)

(assert (=> bm!64700 (= call!64702 call!64703)))

(declare-fun b!1325104 () Bool)

(assert (=> b!1325104 (= e!755401 (insertStrictlySorted!487 (t!44605 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325105 () Bool)

(assert (=> b!1325105 (= e!755404 call!64703)))

(declare-fun bm!64701 () Bool)

(declare-fun $colon$colon!671 (List!30685 tuple2!23556) List!30685)

(assert (=> bm!64701 (= call!64703 ($colon$colon!671 e!755401 (ite c!125686 (h!31890 (toList!10622 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))) (tuple2!23557 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125687 () Bool)

(assert (=> bm!64701 (= c!125687 c!125686)))

(assert (= (and d!142825 c!125686) b!1325105))

(assert (= (and d!142825 (not c!125686)) b!1325096))

(assert (= (and b!1325096 c!125688) b!1325098))

(assert (= (and b!1325096 (not c!125688)) b!1325101))

(assert (= (and b!1325101 c!125685) b!1325100))

(assert (= (and b!1325101 (not c!125685)) b!1325099))

(assert (= (or b!1325100 b!1325099) bm!64699))

(assert (= (or b!1325098 bm!64699) bm!64700))

(assert (= (or b!1325105 bm!64700) bm!64701))

(assert (= (and bm!64701 c!125687) b!1325104))

(assert (= (and bm!64701 (not c!125687)) b!1325103))

(assert (= (and d!142825 res!879502) b!1325097))

(assert (= (and b!1325097 res!879503) b!1325102))

(declare-fun m!1213361 () Bool)

(assert (=> b!1325104 m!1213361))

(declare-fun m!1213363 () Bool)

(assert (=> d!142825 m!1213363))

(declare-fun m!1213365 () Bool)

(assert (=> d!142825 m!1213365))

(declare-fun m!1213367 () Bool)

(assert (=> b!1325102 m!1213367))

(declare-fun m!1213369 () Bool)

(assert (=> b!1325097 m!1213369))

(declare-fun m!1213371 () Bool)

(assert (=> bm!64701 m!1213371))

(assert (=> d!142797 d!142825))

(declare-fun d!142827 () Bool)

(declare-fun lt!589476 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!651 (List!30685) (InoxSet tuple2!23556))

(assert (=> d!142827 (= lt!589476 (select (content!651 (toList!10622 lt!589450)) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun e!755409 () Bool)

(assert (=> d!142827 (= lt!589476 e!755409)))

(declare-fun res!879508 () Bool)

(assert (=> d!142827 (=> (not res!879508) (not e!755409))))

(assert (=> d!142827 (= res!879508 ((_ is Cons!30681) (toList!10622 lt!589450)))))

(assert (=> d!142827 (= (contains!8707 (toList!10622 lt!589450) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) lt!589476)))

(declare-fun b!1325110 () Bool)

(declare-fun e!755410 () Bool)

(assert (=> b!1325110 (= e!755409 e!755410)))

(declare-fun res!879509 () Bool)

(assert (=> b!1325110 (=> res!879509 e!755410)))

(assert (=> b!1325110 (= res!879509 (= (h!31890 (toList!10622 lt!589450)) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325111 () Bool)

(assert (=> b!1325111 (= e!755410 (contains!8707 (t!44605 (toList!10622 lt!589450)) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (= (and d!142827 res!879508) b!1325110))

(assert (= (and b!1325110 (not res!879509)) b!1325111))

(declare-fun m!1213373 () Bool)

(assert (=> d!142827 m!1213373))

(declare-fun m!1213375 () Bool)

(assert (=> d!142827 m!1213375))

(declare-fun m!1213377 () Bool)

(assert (=> b!1325111 m!1213377))

(assert (=> b!1325033 d!142827))

(declare-fun d!142829 () Bool)

(declare-fun res!879514 () Bool)

(declare-fun e!755415 () Bool)

(assert (=> d!142829 (=> res!879514 e!755415)))

(assert (=> d!142829 (= res!879514 (and ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (= (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(assert (=> d!142829 (= (containsKey!732 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) e!755415)))

(declare-fun b!1325116 () Bool)

(declare-fun e!755416 () Bool)

(assert (=> b!1325116 (= e!755415 e!755416)))

(declare-fun res!879515 () Bool)

(assert (=> b!1325116 (=> (not res!879515) (not e!755416))))

(assert (=> b!1325116 (= res!879515 (and (or (not ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) (bvsle (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)) ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (bvslt (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(declare-fun b!1325117 () Bool)

(assert (=> b!1325117 (= e!755416 (containsKey!732 (t!44605 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) k0!1164))))

(assert (= (and d!142829 (not res!879514)) b!1325116))

(assert (= (and b!1325116 res!879515) b!1325117))

(declare-fun m!1213379 () Bool)

(assert (=> b!1325117 m!1213379))

(assert (=> d!142795 d!142829))

(declare-fun d!142831 () Bool)

(assert (=> d!142831 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun lt!589477 () Unit!43443)

(assert (=> d!142831 (= lt!589477 (choose!1954 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(declare-fun e!755417 () Bool)

(assert (=> d!142831 e!755417))

(declare-fun res!879516 () Bool)

(assert (=> d!142831 (=> (not res!879516) (not e!755417))))

(assert (=> d!142831 (= res!879516 (isStrictlySorted!873 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142831 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) lt!589477)))

(declare-fun b!1325118 () Bool)

(assert (=> b!1325118 (= e!755417 (containsKey!732 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))

(assert (= (and d!142831 res!879516) b!1325118))

(assert (=> d!142831 m!1213243))

(assert (=> d!142831 m!1213243))

(assert (=> d!142831 m!1213245))

(declare-fun m!1213381 () Bool)

(assert (=> d!142831 m!1213381))

(declare-fun m!1213383 () Bool)

(assert (=> d!142831 m!1213383))

(assert (=> b!1325118 m!1213239))

(assert (=> b!1324979 d!142831))

(declare-fun d!142833 () Bool)

(assert (=> d!142833 (= (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164)) (not (isEmpty!1082 (getValueByKey!715 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164))))))

(declare-fun bs!37870 () Bool)

(assert (= bs!37870 d!142833))

(assert (=> bs!37870 m!1213243))

(declare-fun m!1213385 () Bool)

(assert (=> bs!37870 m!1213385))

(assert (=> b!1324979 d!142833))

(declare-fun b!1325122 () Bool)

(declare-fun e!755419 () Option!766)

(assert (=> b!1325122 (= e!755419 None!764)))

(declare-fun b!1325121 () Bool)

(assert (=> b!1325121 (= e!755419 (getValueByKey!715 (t!44605 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) k0!1164))))

(declare-fun e!755418 () Option!766)

(declare-fun b!1325119 () Bool)

(assert (=> b!1325119 (= e!755418 (Some!765 (_2!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))))

(declare-fun b!1325120 () Bool)

(assert (=> b!1325120 (= e!755418 e!755419)))

(declare-fun c!125690 () Bool)

(assert (=> b!1325120 (= c!125690 (and ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (not (= (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164))))))

(declare-fun c!125689 () Bool)

(declare-fun d!142835 () Bool)

(assert (=> d!142835 (= c!125689 (and ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (= (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))) k0!1164)))))

(assert (=> d!142835 (= (getValueByKey!715 (toList!10622 (+!4630 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) k0!1164) e!755418)))

(assert (= (and d!142835 c!125689) b!1325119))

(assert (= (and d!142835 (not c!125689)) b!1325120))

(assert (= (and b!1325120 c!125690) b!1325121))

(assert (= (and b!1325120 (not c!125690)) b!1325122))

(declare-fun m!1213387 () Bool)

(assert (=> b!1325121 m!1213387))

(assert (=> b!1324979 d!142835))

(declare-fun d!142837 () Bool)

(assert (=> d!142837 (= (apply!1022 lt!589439 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (get!21745 (getValueByKey!715 (toList!10622 lt!589439) (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)))))))

(declare-fun bs!37871 () Bool)

(assert (= bs!37871 d!142837))

(assert (=> bs!37871 m!1213267))

(assert (=> bs!37871 m!1213329))

(assert (=> bs!37871 m!1213329))

(declare-fun m!1213389 () Bool)

(assert (=> bs!37871 m!1213389))

(assert (=> b!1325024 d!142837))

(declare-fun d!142839 () Bool)

(declare-fun c!125691 () Bool)

(assert (=> d!142839 (= c!125691 ((_ is ValueCellFull!17240) (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000))))))

(declare-fun e!755420 () V!53473)

(assert (=> d!142839 (= (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) e!755420)))

(declare-fun b!1325123 () Bool)

(assert (=> b!1325123 (= e!755420 (get!21743 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325124 () Bool)

(assert (=> b!1325124 (= e!755420 (get!21744 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142839 c!125691) b!1325123))

(assert (= (and d!142839 (not c!125691)) b!1325124))

(assert (=> b!1325123 m!1213271))

(assert (=> b!1325123 m!1213079))

(declare-fun m!1213391 () Bool)

(assert (=> b!1325123 m!1213391))

(assert (=> b!1325124 m!1213271))

(assert (=> b!1325124 m!1213079))

(declare-fun m!1213393 () Bool)

(assert (=> b!1325124 m!1213393))

(assert (=> b!1325024 d!142839))

(declare-fun lt!589478 () Bool)

(declare-fun d!142841 () Bool)

(assert (=> d!142841 (= lt!589478 (select (content!651 (toList!10622 lt!589421)) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!755421 () Bool)

(assert (=> d!142841 (= lt!589478 e!755421)))

(declare-fun res!879517 () Bool)

(assert (=> d!142841 (=> (not res!879517) (not e!755421))))

(assert (=> d!142841 (= res!879517 ((_ is Cons!30681) (toList!10622 lt!589421)))))

(assert (=> d!142841 (= (contains!8707 (toList!10622 lt!589421) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!589478)))

(declare-fun b!1325125 () Bool)

(declare-fun e!755422 () Bool)

(assert (=> b!1325125 (= e!755421 e!755422)))

(declare-fun res!879518 () Bool)

(assert (=> b!1325125 (=> res!879518 e!755422)))

(assert (=> b!1325125 (= res!879518 (= (h!31890 (toList!10622 lt!589421)) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325126 () Bool)

(assert (=> b!1325126 (= e!755422 (contains!8707 (t!44605 (toList!10622 lt!589421)) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142841 res!879517) b!1325125))

(assert (= (and b!1325125 (not res!879518)) b!1325126))

(declare-fun m!1213395 () Bool)

(assert (=> d!142841 m!1213395))

(declare-fun m!1213397 () Bool)

(assert (=> d!142841 m!1213397))

(declare-fun m!1213399 () Bool)

(assert (=> b!1325126 m!1213399))

(assert (=> b!1324987 d!142841))

(declare-fun d!142843 () Bool)

(declare-fun e!755423 () Bool)

(assert (=> d!142843 e!755423))

(declare-fun res!879520 () Bool)

(assert (=> d!142843 (=> (not res!879520) (not e!755423))))

(declare-fun lt!589480 () ListLongMap!21213)

(assert (=> d!142843 (= res!879520 (contains!8704 lt!589480 (_1!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun lt!589482 () List!30685)

(assert (=> d!142843 (= lt!589480 (ListLongMap!21214 lt!589482))))

(declare-fun lt!589481 () Unit!43443)

(declare-fun lt!589479 () Unit!43443)

(assert (=> d!142843 (= lt!589481 lt!589479)))

(assert (=> d!142843 (= (getValueByKey!715 lt!589482 (_1!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!765 (_2!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142843 (= lt!589479 (lemmaContainsTupThenGetReturnValue!358 lt!589482 (_1!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142843 (= lt!589482 (insertStrictlySorted!487 (toList!10622 (ite c!125643 call!64684 (ite c!125641 call!64689 call!64685))) (_1!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (_2!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142843 (= (+!4630 (ite c!125643 call!64684 (ite c!125641 call!64689 call!64685)) (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589480)))

(declare-fun b!1325127 () Bool)

(declare-fun res!879519 () Bool)

(assert (=> b!1325127 (=> (not res!879519) (not e!755423))))

(assert (=> b!1325127 (= res!879519 (= (getValueByKey!715 (toList!10622 lt!589480) (_1!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))) (Some!765 (_2!11789 (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun b!1325128 () Bool)

(assert (=> b!1325128 (= e!755423 (contains!8707 (toList!10622 lt!589480) (ite (or c!125643 c!125641) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (= (and d!142843 res!879520) b!1325127))

(assert (= (and b!1325127 res!879519) b!1325128))

(declare-fun m!1213401 () Bool)

(assert (=> d!142843 m!1213401))

(declare-fun m!1213403 () Bool)

(assert (=> d!142843 m!1213403))

(declare-fun m!1213405 () Bool)

(assert (=> d!142843 m!1213405))

(declare-fun m!1213407 () Bool)

(assert (=> d!142843 m!1213407))

(declare-fun m!1213409 () Bool)

(assert (=> b!1325127 m!1213409))

(declare-fun m!1213411 () Bool)

(assert (=> b!1325128 m!1213411))

(assert (=> bm!64682 d!142843))

(declare-fun b!1325132 () Bool)

(declare-fun e!755425 () Option!766)

(assert (=> b!1325132 (= e!755425 None!764)))

(declare-fun b!1325131 () Bool)

(assert (=> b!1325131 (= e!755425 (getValueByKey!715 (t!44605 (toList!10622 lt!589421)) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1325129 () Bool)

(declare-fun e!755424 () Option!766)

(assert (=> b!1325129 (= e!755424 (Some!765 (_2!11789 (h!31890 (toList!10622 lt!589421)))))))

(declare-fun b!1325130 () Bool)

(assert (=> b!1325130 (= e!755424 e!755425)))

(declare-fun c!125693 () Bool)

(assert (=> b!1325130 (= c!125693 (and ((_ is Cons!30681) (toList!10622 lt!589421)) (not (= (_1!11789 (h!31890 (toList!10622 lt!589421))) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!125692 () Bool)

(declare-fun d!142845 () Bool)

(assert (=> d!142845 (= c!125692 (and ((_ is Cons!30681) (toList!10622 lt!589421)) (= (_1!11789 (h!31890 (toList!10622 lt!589421))) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!142845 (= (getValueByKey!715 (toList!10622 lt!589421) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!755424)))

(assert (= (and d!142845 c!125692) b!1325129))

(assert (= (and d!142845 (not c!125692)) b!1325130))

(assert (= (and b!1325130 c!125693) b!1325131))

(assert (= (and b!1325130 (not c!125693)) b!1325132))

(declare-fun m!1213413 () Bool)

(assert (=> b!1325131 m!1213413))

(assert (=> b!1324986 d!142845))

(declare-fun d!142847 () Bool)

(assert (=> d!142847 (= (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000))) (and (not (= (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1325021 d!142847))

(declare-fun d!142849 () Bool)

(declare-fun e!755426 () Bool)

(assert (=> d!142849 e!755426))

(declare-fun res!879521 () Bool)

(assert (=> d!142849 (=> res!879521 e!755426)))

(declare-fun lt!589484 () Bool)

(assert (=> d!142849 (= res!879521 (not lt!589484))))

(declare-fun lt!589486 () Bool)

(assert (=> d!142849 (= lt!589484 lt!589486)))

(declare-fun lt!589483 () Unit!43443)

(declare-fun e!755427 () Unit!43443)

(assert (=> d!142849 (= lt!589483 e!755427)))

(declare-fun c!125694 () Bool)

(assert (=> d!142849 (= c!125694 lt!589486)))

(assert (=> d!142849 (= lt!589486 (containsKey!732 (toList!10622 lt!589439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142849 (= (contains!8704 lt!589439 #b1000000000000000000000000000000000000000000000000000000000000000) lt!589484)))

(declare-fun b!1325133 () Bool)

(declare-fun lt!589485 () Unit!43443)

(assert (=> b!1325133 (= e!755427 lt!589485)))

(assert (=> b!1325133 (= lt!589485 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325133 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589439) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325134 () Bool)

(declare-fun Unit!43451 () Unit!43443)

(assert (=> b!1325134 (= e!755427 Unit!43451)))

(declare-fun b!1325135 () Bool)

(assert (=> b!1325135 (= e!755426 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142849 c!125694) b!1325133))

(assert (= (and d!142849 (not c!125694)) b!1325134))

(assert (= (and d!142849 (not res!879521)) b!1325135))

(declare-fun m!1213415 () Bool)

(assert (=> d!142849 m!1213415))

(declare-fun m!1213417 () Bool)

(assert (=> b!1325133 m!1213417))

(declare-fun m!1213419 () Bool)

(assert (=> b!1325133 m!1213419))

(assert (=> b!1325133 m!1213419))

(declare-fun m!1213421 () Bool)

(assert (=> b!1325133 m!1213421))

(assert (=> b!1325135 m!1213419))

(assert (=> b!1325135 m!1213419))

(assert (=> b!1325135 m!1213421))

(assert (=> b!1325022 d!142849))

(declare-fun b!1325136 () Bool)

(declare-fun e!755430 () Bool)

(declare-fun e!755431 () Bool)

(assert (=> b!1325136 (= e!755430 e!755431)))

(declare-fun c!125697 () Bool)

(declare-fun e!755432 () Bool)

(assert (=> b!1325136 (= c!125697 e!755432)))

(declare-fun res!879525 () Bool)

(assert (=> b!1325136 (=> (not res!879525) (not e!755432))))

(assert (=> b!1325136 (= res!879525 (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(declare-fun b!1325137 () Bool)

(declare-fun e!755433 () Bool)

(assert (=> b!1325137 (= e!755431 e!755433)))

(assert (=> b!1325137 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(declare-fun lt!589488 () ListLongMap!21213)

(declare-fun res!879524 () Bool)

(assert (=> b!1325137 (= res!879524 (contains!8704 lt!589488 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(assert (=> b!1325137 (=> (not res!879524) (not e!755433))))

(declare-fun e!755434 () Bool)

(declare-fun b!1325138 () Bool)

(assert (=> b!1325138 (= e!755434 (= lt!589488 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun d!142851 () Bool)

(assert (=> d!142851 e!755430))

(declare-fun res!879522 () Bool)

(assert (=> d!142851 (=> (not res!879522) (not e!755430))))

(assert (=> d!142851 (= res!879522 (not (contains!8704 lt!589488 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!755429 () ListLongMap!21213)

(assert (=> d!142851 (= lt!589488 e!755429)))

(declare-fun c!125695 () Bool)

(assert (=> d!142851 (= c!125695 (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(assert (=> d!142851 (validMask!0 mask!2019)))

(assert (=> d!142851 (= (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) defaultEntry!1340) lt!589488)))

(declare-fun b!1325139 () Bool)

(declare-fun e!755428 () ListLongMap!21213)

(assert (=> b!1325139 (= e!755429 e!755428)))

(declare-fun c!125696 () Bool)

(assert (=> b!1325139 (= c!125696 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(declare-fun b!1325140 () Bool)

(declare-fun res!879523 () Bool)

(assert (=> b!1325140 (=> (not res!879523) (not e!755430))))

(assert (=> b!1325140 (= res!879523 (not (contains!8704 lt!589488 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325141 () Bool)

(assert (=> b!1325141 (= e!755431 e!755434)))

(declare-fun c!125698 () Bool)

(assert (=> b!1325141 (= c!125698 (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(declare-fun b!1325142 () Bool)

(assert (=> b!1325142 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(assert (=> b!1325142 (and (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) (size!43726 _values!1337)))))

(assert (=> b!1325142 (= e!755433 (= (apply!1022 lt!589488 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325143 () Bool)

(assert (=> b!1325143 (= e!755429 (ListLongMap!21214 Nil!30682))))

(declare-fun b!1325144 () Bool)

(assert (=> b!1325144 (= e!755434 (isEmpty!1081 lt!589488))))

(declare-fun bm!64702 () Bool)

(declare-fun call!64705 () ListLongMap!21213)

(assert (=> bm!64702 (= call!64705 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1325145 () Bool)

(assert (=> b!1325145 (= e!755428 call!64705)))

(declare-fun b!1325146 () Bool)

(assert (=> b!1325146 (= e!755432 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001))))))

(assert (=> b!1325146 (bvsge (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!1325147 () Bool)

(declare-fun lt!589489 () Unit!43443)

(declare-fun lt!589487 () Unit!43443)

(assert (=> b!1325147 (= lt!589489 lt!589487)))

(declare-fun lt!589491 () V!53473)

(declare-fun lt!589490 () (_ BitVec 64))

(declare-fun lt!589492 () (_ BitVec 64))

(declare-fun lt!589493 () ListLongMap!21213)

(assert (=> b!1325147 (not (contains!8704 (+!4630 lt!589493 (tuple2!23557 lt!589492 lt!589491)) lt!589490))))

(assert (=> b!1325147 (= lt!589487 (addStillNotContains!481 lt!589493 lt!589492 lt!589491 lt!589490))))

(assert (=> b!1325147 (= lt!589490 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1325147 (= lt!589491 (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1325147 (= lt!589492 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)))))

(assert (=> b!1325147 (= lt!589493 call!64705)))

(assert (=> b!1325147 (= e!755428 (+!4630 call!64705 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000 #b00000000000000000000000000000001)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142851 c!125695) b!1325143))

(assert (= (and d!142851 (not c!125695)) b!1325139))

(assert (= (and b!1325139 c!125696) b!1325147))

(assert (= (and b!1325139 (not c!125696)) b!1325145))

(assert (= (or b!1325147 b!1325145) bm!64702))

(assert (= (and d!142851 res!879522) b!1325140))

(assert (= (and b!1325140 res!879523) b!1325136))

(assert (= (and b!1325136 res!879525) b!1325146))

(assert (= (and b!1325136 c!125697) b!1325137))

(assert (= (and b!1325136 (not c!125697)) b!1325141))

(assert (= (and b!1325137 res!879524) b!1325142))

(assert (= (and b!1325141 c!125698) b!1325138))

(assert (= (and b!1325141 (not c!125698)) b!1325144))

(declare-fun b_lambda!23715 () Bool)

(assert (=> (not b_lambda!23715) (not b!1325142)))

(assert (=> b!1325142 t!44604))

(declare-fun b_and!48995 () Bool)

(assert (= b_and!48993 (and (=> t!44604 result!24509) b_and!48995)))

(declare-fun b_lambda!23717 () Bool)

(assert (=> (not b_lambda!23717) (not b!1325147)))

(assert (=> b!1325147 t!44604))

(declare-fun b_and!48997 () Bool)

(assert (= b_and!48995 (and (=> t!44604 result!24509) b_and!48997)))

(declare-fun m!1213423 () Bool)

(assert (=> b!1325144 m!1213423))

(declare-fun m!1213425 () Bool)

(assert (=> bm!64702 m!1213425))

(declare-fun m!1213427 () Bool)

(assert (=> b!1325137 m!1213427))

(assert (=> b!1325137 m!1213427))

(declare-fun m!1213429 () Bool)

(assert (=> b!1325137 m!1213429))

(assert (=> b!1325142 m!1213427))

(declare-fun m!1213431 () Bool)

(assert (=> b!1325142 m!1213431))

(assert (=> b!1325142 m!1213079))

(declare-fun m!1213433 () Bool)

(assert (=> b!1325142 m!1213433))

(assert (=> b!1325142 m!1213079))

(assert (=> b!1325142 m!1213431))

(assert (=> b!1325142 m!1213427))

(declare-fun m!1213435 () Bool)

(assert (=> b!1325142 m!1213435))

(assert (=> b!1325147 m!1213427))

(declare-fun m!1213437 () Bool)

(assert (=> b!1325147 m!1213437))

(assert (=> b!1325147 m!1213431))

(assert (=> b!1325147 m!1213079))

(assert (=> b!1325147 m!1213433))

(assert (=> b!1325147 m!1213079))

(assert (=> b!1325147 m!1213431))

(declare-fun m!1213439 () Bool)

(assert (=> b!1325147 m!1213439))

(declare-fun m!1213441 () Bool)

(assert (=> b!1325147 m!1213441))

(declare-fun m!1213443 () Bool)

(assert (=> b!1325147 m!1213443))

(assert (=> b!1325147 m!1213441))

(declare-fun m!1213445 () Bool)

(assert (=> d!142851 m!1213445))

(assert (=> d!142851 m!1213061))

(assert (=> b!1325146 m!1213427))

(assert (=> b!1325146 m!1213427))

(declare-fun m!1213447 () Bool)

(assert (=> b!1325146 m!1213447))

(declare-fun m!1213449 () Bool)

(assert (=> b!1325140 m!1213449))

(assert (=> b!1325138 m!1213425))

(assert (=> b!1325139 m!1213427))

(assert (=> b!1325139 m!1213427))

(assert (=> b!1325139 m!1213447))

(assert (=> b!1325020 d!142851))

(assert (=> b!1324900 d!142809))

(assert (=> b!1324900 d!142811))

(declare-fun b!1325148 () Bool)

(declare-fun e!755438 () Bool)

(assert (=> b!1325148 (= e!755438 (contains!8706 (ite c!125649 (Cons!30682 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) Nil!30683) Nil!30683) (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!1325149 () Bool)

(declare-fun e!755435 () Bool)

(declare-fun call!64706 () Bool)

(assert (=> b!1325149 (= e!755435 call!64706)))

(declare-fun b!1325150 () Bool)

(declare-fun e!755436 () Bool)

(declare-fun e!755437 () Bool)

(assert (=> b!1325150 (= e!755436 e!755437)))

(declare-fun res!879526 () Bool)

(assert (=> b!1325150 (=> (not res!879526) (not e!755437))))

(assert (=> b!1325150 (= res!879526 (not e!755438))))

(declare-fun res!879528 () Bool)

(assert (=> b!1325150 (=> (not res!879528) (not e!755438))))

(assert (=> b!1325150 (= res!879528 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142853 () Bool)

(declare-fun res!879527 () Bool)

(assert (=> d!142853 (=> res!879527 e!755436)))

(assert (=> d!142853 (= res!879527 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(assert (=> d!142853 (= (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!125649 (Cons!30682 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) Nil!30683) Nil!30683)) e!755436)))

(declare-fun b!1325151 () Bool)

(assert (=> b!1325151 (= e!755435 call!64706)))

(declare-fun c!125699 () Bool)

(declare-fun bm!64703 () Bool)

(assert (=> bm!64703 (= call!64706 (arrayNoDuplicates!0 _keys!1609 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!125699 (Cons!30682 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!125649 (Cons!30682 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) Nil!30683) Nil!30683)) (ite c!125649 (Cons!30682 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) Nil!30683) Nil!30683))))))

(declare-fun b!1325152 () Bool)

(assert (=> b!1325152 (= e!755437 e!755435)))

(assert (=> b!1325152 (= c!125699 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!142853 (not res!879527)) b!1325150))

(assert (= (and b!1325150 res!879528) b!1325148))

(assert (= (and b!1325150 res!879526) b!1325152))

(assert (= (and b!1325152 c!125699) b!1325151))

(assert (= (and b!1325152 (not c!125699)) b!1325149))

(assert (= (or b!1325151 b!1325149) bm!64703))

(declare-fun m!1213451 () Bool)

(assert (=> b!1325148 m!1213451))

(assert (=> b!1325148 m!1213451))

(declare-fun m!1213453 () Bool)

(assert (=> b!1325148 m!1213453))

(assert (=> b!1325150 m!1213451))

(assert (=> b!1325150 m!1213451))

(declare-fun m!1213455 () Bool)

(assert (=> b!1325150 m!1213455))

(assert (=> bm!64703 m!1213451))

(declare-fun m!1213457 () Bool)

(assert (=> bm!64703 m!1213457))

(assert (=> b!1325152 m!1213451))

(assert (=> b!1325152 m!1213451))

(assert (=> b!1325152 m!1213455))

(assert (=> bm!64689 d!142853))

(assert (=> b!1325028 d!142847))

(declare-fun d!142855 () Bool)

(declare-fun e!755439 () Bool)

(assert (=> d!142855 e!755439))

(declare-fun res!879530 () Bool)

(assert (=> d!142855 (=> (not res!879530) (not e!755439))))

(declare-fun lt!589495 () ListLongMap!21213)

(assert (=> d!142855 (= res!879530 (contains!8704 lt!589495 (_1!11789 (tuple2!23557 lt!589443 lt!589442))))))

(declare-fun lt!589497 () List!30685)

(assert (=> d!142855 (= lt!589495 (ListLongMap!21214 lt!589497))))

(declare-fun lt!589496 () Unit!43443)

(declare-fun lt!589494 () Unit!43443)

(assert (=> d!142855 (= lt!589496 lt!589494)))

(assert (=> d!142855 (= (getValueByKey!715 lt!589497 (_1!11789 (tuple2!23557 lt!589443 lt!589442))) (Some!765 (_2!11789 (tuple2!23557 lt!589443 lt!589442))))))

(assert (=> d!142855 (= lt!589494 (lemmaContainsTupThenGetReturnValue!358 lt!589497 (_1!11789 (tuple2!23557 lt!589443 lt!589442)) (_2!11789 (tuple2!23557 lt!589443 lt!589442))))))

(assert (=> d!142855 (= lt!589497 (insertStrictlySorted!487 (toList!10622 lt!589444) (_1!11789 (tuple2!23557 lt!589443 lt!589442)) (_2!11789 (tuple2!23557 lt!589443 lt!589442))))))

(assert (=> d!142855 (= (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442)) lt!589495)))

(declare-fun b!1325153 () Bool)

(declare-fun res!879529 () Bool)

(assert (=> b!1325153 (=> (not res!879529) (not e!755439))))

(assert (=> b!1325153 (= res!879529 (= (getValueByKey!715 (toList!10622 lt!589495) (_1!11789 (tuple2!23557 lt!589443 lt!589442))) (Some!765 (_2!11789 (tuple2!23557 lt!589443 lt!589442)))))))

(declare-fun b!1325154 () Bool)

(assert (=> b!1325154 (= e!755439 (contains!8707 (toList!10622 lt!589495) (tuple2!23557 lt!589443 lt!589442)))))

(assert (= (and d!142855 res!879530) b!1325153))

(assert (= (and b!1325153 res!879529) b!1325154))

(declare-fun m!1213459 () Bool)

(assert (=> d!142855 m!1213459))

(declare-fun m!1213461 () Bool)

(assert (=> d!142855 m!1213461))

(declare-fun m!1213463 () Bool)

(assert (=> d!142855 m!1213463))

(declare-fun m!1213465 () Bool)

(assert (=> d!142855 m!1213465))

(declare-fun m!1213467 () Bool)

(assert (=> b!1325153 m!1213467))

(declare-fun m!1213469 () Bool)

(assert (=> b!1325154 m!1213469))

(assert (=> b!1325029 d!142855))

(declare-fun d!142857 () Bool)

(assert (=> d!142857 (not (contains!8704 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442)) lt!589441))))

(declare-fun lt!589500 () Unit!43443)

(declare-fun choose!1956 (ListLongMap!21213 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43443)

(assert (=> d!142857 (= lt!589500 (choose!1956 lt!589444 lt!589443 lt!589442 lt!589441))))

(declare-fun e!755442 () Bool)

(assert (=> d!142857 e!755442))

(declare-fun res!879533 () Bool)

(assert (=> d!142857 (=> (not res!879533) (not e!755442))))

(assert (=> d!142857 (= res!879533 (not (contains!8704 lt!589444 lt!589441)))))

(assert (=> d!142857 (= (addStillNotContains!481 lt!589444 lt!589443 lt!589442 lt!589441) lt!589500)))

(declare-fun b!1325158 () Bool)

(assert (=> b!1325158 (= e!755442 (not (= lt!589443 lt!589441)))))

(assert (= (and d!142857 res!879533) b!1325158))

(assert (=> d!142857 m!1213281))

(assert (=> d!142857 m!1213281))

(assert (=> d!142857 m!1213283))

(declare-fun m!1213471 () Bool)

(assert (=> d!142857 m!1213471))

(declare-fun m!1213473 () Bool)

(assert (=> d!142857 m!1213473))

(assert (=> b!1325029 d!142857))

(assert (=> b!1325029 d!142839))

(declare-fun d!142859 () Bool)

(declare-fun e!755443 () Bool)

(assert (=> d!142859 e!755443))

(declare-fun res!879535 () Bool)

(assert (=> d!142859 (=> (not res!879535) (not e!755443))))

(declare-fun lt!589502 () ListLongMap!21213)

(assert (=> d!142859 (= res!879535 (contains!8704 lt!589502 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!589504 () List!30685)

(assert (=> d!142859 (= lt!589502 (ListLongMap!21214 lt!589504))))

(declare-fun lt!589503 () Unit!43443)

(declare-fun lt!589501 () Unit!43443)

(assert (=> d!142859 (= lt!589503 lt!589501)))

(assert (=> d!142859 (= (getValueByKey!715 lt!589504 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!765 (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142859 (= lt!589501 (lemmaContainsTupThenGetReturnValue!358 lt!589504 (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142859 (= lt!589504 (insertStrictlySorted!487 (toList!10622 call!64695) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142859 (= (+!4630 call!64695 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!589502)))

(declare-fun b!1325159 () Bool)

(declare-fun res!879534 () Bool)

(assert (=> b!1325159 (=> (not res!879534) (not e!755443))))

(assert (=> b!1325159 (= res!879534 (= (getValueByKey!715 (toList!10622 lt!589502) (_1!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!765 (_2!11789 (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!1325160 () Bool)

(assert (=> b!1325160 (= e!755443 (contains!8707 (toList!10622 lt!589502) (tuple2!23557 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000001 from!2000)) (get!21741 (select (arr!43174 _values!1337) (bvadd #b00000000000000000000000000000001 from!2000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142859 res!879535) b!1325159))

(assert (= (and b!1325159 res!879534) b!1325160))

(declare-fun m!1213475 () Bool)

(assert (=> d!142859 m!1213475))

(declare-fun m!1213477 () Bool)

(assert (=> d!142859 m!1213477))

(declare-fun m!1213479 () Bool)

(assert (=> d!142859 m!1213479))

(declare-fun m!1213481 () Bool)

(assert (=> d!142859 m!1213481))

(declare-fun m!1213483 () Bool)

(assert (=> b!1325159 m!1213483))

(declare-fun m!1213485 () Bool)

(assert (=> b!1325160 m!1213485))

(assert (=> b!1325029 d!142859))

(declare-fun d!142861 () Bool)

(declare-fun e!755444 () Bool)

(assert (=> d!142861 e!755444))

(declare-fun res!879536 () Bool)

(assert (=> d!142861 (=> res!879536 e!755444)))

(declare-fun lt!589506 () Bool)

(assert (=> d!142861 (= res!879536 (not lt!589506))))

(declare-fun lt!589508 () Bool)

(assert (=> d!142861 (= lt!589506 lt!589508)))

(declare-fun lt!589505 () Unit!43443)

(declare-fun e!755445 () Unit!43443)

(assert (=> d!142861 (= lt!589505 e!755445)))

(declare-fun c!125700 () Bool)

(assert (=> d!142861 (= c!125700 lt!589508)))

(assert (=> d!142861 (= lt!589508 (containsKey!732 (toList!10622 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442))) lt!589441))))

(assert (=> d!142861 (= (contains!8704 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442)) lt!589441) lt!589506)))

(declare-fun b!1325161 () Bool)

(declare-fun lt!589507 () Unit!43443)

(assert (=> b!1325161 (= e!755445 lt!589507)))

(assert (=> b!1325161 (= lt!589507 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442))) lt!589441))))

(assert (=> b!1325161 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442))) lt!589441))))

(declare-fun b!1325162 () Bool)

(declare-fun Unit!43452 () Unit!43443)

(assert (=> b!1325162 (= e!755445 Unit!43452)))

(declare-fun b!1325163 () Bool)

(assert (=> b!1325163 (= e!755444 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 lt!589444 (tuple2!23557 lt!589443 lt!589442))) lt!589441)))))

(assert (= (and d!142861 c!125700) b!1325161))

(assert (= (and d!142861 (not c!125700)) b!1325162))

(assert (= (and d!142861 (not res!879536)) b!1325163))

(declare-fun m!1213487 () Bool)

(assert (=> d!142861 m!1213487))

(declare-fun m!1213489 () Bool)

(assert (=> b!1325161 m!1213489))

(declare-fun m!1213491 () Bool)

(assert (=> b!1325161 m!1213491))

(assert (=> b!1325161 m!1213491))

(declare-fun m!1213493 () Bool)

(assert (=> b!1325161 m!1213493))

(assert (=> b!1325163 m!1213491))

(assert (=> b!1325163 m!1213491))

(assert (=> b!1325163 m!1213493))

(assert (=> b!1325029 d!142861))

(declare-fun b!1325164 () Bool)

(declare-fun e!755447 () Bool)

(declare-fun call!64707 () Bool)

(assert (=> b!1325164 (= e!755447 call!64707)))

(declare-fun b!1325165 () Bool)

(declare-fun e!755448 () Bool)

(assert (=> b!1325165 (= e!755448 e!755447)))

(declare-fun lt!589510 () (_ BitVec 64))

(assert (=> b!1325165 (= lt!589510 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!589511 () Unit!43443)

(assert (=> b!1325165 (= lt!589511 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!589510 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1325165 (arrayContainsKey!0 _keys!1609 lt!589510 #b00000000000000000000000000000000)))

(declare-fun lt!589509 () Unit!43443)

(assert (=> b!1325165 (= lt!589509 lt!589511)))

(declare-fun res!879538 () Bool)

(assert (=> b!1325165 (= res!879538 (= (seekEntryOrOpen!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!1609 mask!2019) (Found!10039 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1325165 (=> (not res!879538) (not e!755447))))

(declare-fun b!1325166 () Bool)

(declare-fun e!755446 () Bool)

(assert (=> b!1325166 (= e!755446 e!755448)))

(declare-fun c!125701 () Bool)

(assert (=> b!1325166 (= c!125701 (validKeyInArray!0 (select (arr!43173 _keys!1609) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!142863 () Bool)

(declare-fun res!879537 () Bool)

(assert (=> d!142863 (=> res!879537 e!755446)))

(assert (=> d!142863 (= res!879537 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(assert (=> d!142863 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019) e!755446)))

(declare-fun b!1325167 () Bool)

(assert (=> b!1325167 (= e!755448 call!64707)))

(declare-fun bm!64704 () Bool)

(assert (=> bm!64704 (= call!64707 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(assert (= (and d!142863 (not res!879537)) b!1325166))

(assert (= (and b!1325166 c!125701) b!1325165))

(assert (= (and b!1325166 (not c!125701)) b!1325167))

(assert (= (and b!1325165 res!879538) b!1325164))

(assert (= (or b!1325164 b!1325167) bm!64704))

(assert (=> b!1325165 m!1213451))

(declare-fun m!1213495 () Bool)

(assert (=> b!1325165 m!1213495))

(declare-fun m!1213497 () Bool)

(assert (=> b!1325165 m!1213497))

(assert (=> b!1325165 m!1213451))

(declare-fun m!1213499 () Bool)

(assert (=> b!1325165 m!1213499))

(assert (=> b!1325166 m!1213451))

(assert (=> b!1325166 m!1213451))

(assert (=> b!1325166 m!1213455))

(declare-fun m!1213501 () Bool)

(assert (=> bm!64704 m!1213501))

(assert (=> bm!64665 d!142863))

(declare-fun d!142865 () Bool)

(declare-fun e!755449 () Bool)

(assert (=> d!142865 e!755449))

(declare-fun res!879539 () Bool)

(assert (=> d!142865 (=> res!879539 e!755449)))

(declare-fun lt!589513 () Bool)

(assert (=> d!142865 (= res!879539 (not lt!589513))))

(declare-fun lt!589515 () Bool)

(assert (=> d!142865 (= lt!589513 lt!589515)))

(declare-fun lt!589512 () Unit!43443)

(declare-fun e!755450 () Unit!43443)

(assert (=> d!142865 (= lt!589512 e!755450)))

(declare-fun c!125702 () Bool)

(assert (=> d!142865 (= c!125702 lt!589515)))

(assert (=> d!142865 (= lt!589515 (containsKey!732 (toList!10622 lt!589407) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142865 (= (contains!8704 lt!589407 #b0000000000000000000000000000000000000000000000000000000000000000) lt!589513)))

(declare-fun b!1325168 () Bool)

(declare-fun lt!589514 () Unit!43443)

(assert (=> b!1325168 (= e!755450 lt!589514)))

(assert (=> b!1325168 (= lt!589514 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589407) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325168 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589407) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325169 () Bool)

(declare-fun Unit!43453 () Unit!43443)

(assert (=> b!1325169 (= e!755450 Unit!43453)))

(declare-fun b!1325170 () Bool)

(assert (=> b!1325170 (= e!755449 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589407) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142865 c!125702) b!1325168))

(assert (= (and d!142865 (not c!125702)) b!1325169))

(assert (= (and d!142865 (not res!879539)) b!1325170))

(declare-fun m!1213503 () Bool)

(assert (=> d!142865 m!1213503))

(declare-fun m!1213505 () Bool)

(assert (=> b!1325168 m!1213505))

(declare-fun m!1213507 () Bool)

(assert (=> b!1325168 m!1213507))

(assert (=> b!1325168 m!1213507))

(declare-fun m!1213509 () Bool)

(assert (=> b!1325168 m!1213509))

(assert (=> b!1325170 m!1213507))

(assert (=> b!1325170 m!1213507))

(assert (=> b!1325170 m!1213509))

(assert (=> bm!64683 d!142865))

(declare-fun d!142867 () Bool)

(assert (=> d!142867 (= (validKeyInArray!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)) (and (not (= (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1324890 d!142867))

(declare-fun d!142869 () Bool)

(declare-fun e!755451 () Bool)

(assert (=> d!142869 e!755451))

(declare-fun res!879540 () Bool)

(assert (=> d!142869 (=> res!879540 e!755451)))

(declare-fun lt!589517 () Bool)

(assert (=> d!142869 (= res!879540 (not lt!589517))))

(declare-fun lt!589519 () Bool)

(assert (=> d!142869 (= lt!589517 lt!589519)))

(declare-fun lt!589516 () Unit!43443)

(declare-fun e!755452 () Unit!43443)

(assert (=> d!142869 (= lt!589516 e!755452)))

(declare-fun c!125703 () Bool)

(assert (=> d!142869 (= c!125703 lt!589519)))

(assert (=> d!142869 (= lt!589519 (containsKey!732 (toList!10622 lt!589407) (select (arr!43173 _keys!1609) from!2000)))))

(assert (=> d!142869 (= (contains!8704 lt!589407 (select (arr!43173 _keys!1609) from!2000)) lt!589517)))

(declare-fun b!1325171 () Bool)

(declare-fun lt!589518 () Unit!43443)

(assert (=> b!1325171 (= e!755452 lt!589518)))

(assert (=> b!1325171 (= lt!589518 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589407) (select (arr!43173 _keys!1609) from!2000)))))

(assert (=> b!1325171 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589407) (select (arr!43173 _keys!1609) from!2000)))))

(declare-fun b!1325172 () Bool)

(declare-fun Unit!43454 () Unit!43443)

(assert (=> b!1325172 (= e!755452 Unit!43454)))

(declare-fun b!1325173 () Bool)

(assert (=> b!1325173 (= e!755451 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589407) (select (arr!43173 _keys!1609) from!2000))))))

(assert (= (and d!142869 c!125703) b!1325171))

(assert (= (and d!142869 (not c!125703)) b!1325172))

(assert (= (and d!142869 (not res!879540)) b!1325173))

(assert (=> d!142869 m!1213067))

(declare-fun m!1213511 () Bool)

(assert (=> d!142869 m!1213511))

(assert (=> b!1325171 m!1213067))

(declare-fun m!1213513 () Bool)

(assert (=> b!1325171 m!1213513))

(assert (=> b!1325171 m!1213067))

(assert (=> b!1325171 m!1213341))

(assert (=> b!1325171 m!1213341))

(declare-fun m!1213515 () Bool)

(assert (=> b!1325171 m!1213515))

(assert (=> b!1325173 m!1213067))

(assert (=> b!1325173 m!1213341))

(assert (=> b!1325173 m!1213341))

(assert (=> b!1325173 m!1213515))

(assert (=> b!1324954 d!142869))

(assert (=> b!1324976 d!142867))

(declare-fun d!142871 () Bool)

(declare-fun e!755453 () Bool)

(assert (=> d!142871 e!755453))

(declare-fun res!879541 () Bool)

(assert (=> d!142871 (=> res!879541 e!755453)))

(declare-fun lt!589521 () Bool)

(assert (=> d!142871 (= res!879541 (not lt!589521))))

(declare-fun lt!589523 () Bool)

(assert (=> d!142871 (= lt!589521 lt!589523)))

(declare-fun lt!589520 () Unit!43443)

(declare-fun e!755454 () Unit!43443)

(assert (=> d!142871 (= lt!589520 e!755454)))

(declare-fun c!125704 () Bool)

(assert (=> d!142871 (= c!125704 lt!589523)))

(assert (=> d!142871 (= lt!589523 (containsKey!732 (toList!10622 lt!589450) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142871 (= (contains!8704 lt!589450 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!589521)))

(declare-fun b!1325174 () Bool)

(declare-fun lt!589522 () Unit!43443)

(assert (=> b!1325174 (= e!755454 lt!589522)))

(assert (=> b!1325174 (= lt!589522 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589450) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> b!1325174 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589450) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325175 () Bool)

(declare-fun Unit!43455 () Unit!43443)

(assert (=> b!1325175 (= e!755454 Unit!43455)))

(declare-fun b!1325176 () Bool)

(assert (=> b!1325176 (= e!755453 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589450) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (= (and d!142871 c!125704) b!1325174))

(assert (= (and d!142871 (not c!125704)) b!1325175))

(assert (= (and d!142871 (not res!879541)) b!1325176))

(declare-fun m!1213517 () Bool)

(assert (=> d!142871 m!1213517))

(declare-fun m!1213519 () Bool)

(assert (=> b!1325174 m!1213519))

(assert (=> b!1325174 m!1213311))

(assert (=> b!1325174 m!1213311))

(declare-fun m!1213521 () Bool)

(assert (=> b!1325174 m!1213521))

(assert (=> b!1325176 m!1213311))

(assert (=> b!1325176 m!1213311))

(assert (=> b!1325176 m!1213521))

(assert (=> d!142805 d!142871))

(declare-fun b!1325180 () Bool)

(declare-fun e!755456 () Option!766)

(assert (=> b!1325180 (= e!755456 None!764)))

(declare-fun b!1325179 () Bool)

(assert (=> b!1325179 (= e!755456 (getValueByKey!715 (t!44605 lt!589452) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325177 () Bool)

(declare-fun e!755455 () Option!766)

(assert (=> b!1325177 (= e!755455 (Some!765 (_2!11789 (h!31890 lt!589452))))))

(declare-fun b!1325178 () Bool)

(assert (=> b!1325178 (= e!755455 e!755456)))

(declare-fun c!125706 () Bool)

(assert (=> b!1325178 (= c!125706 (and ((_ is Cons!30681) lt!589452) (not (= (_1!11789 (h!31890 lt!589452)) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun d!142873 () Bool)

(declare-fun c!125705 () Bool)

(assert (=> d!142873 (= c!125705 (and ((_ is Cons!30681) lt!589452) (= (_1!11789 (h!31890 lt!589452)) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!142873 (= (getValueByKey!715 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) e!755455)))

(assert (= (and d!142873 c!125705) b!1325177))

(assert (= (and d!142873 (not c!125705)) b!1325178))

(assert (= (and b!1325178 c!125706) b!1325179))

(assert (= (and b!1325178 (not c!125706)) b!1325180))

(declare-fun m!1213523 () Bool)

(assert (=> b!1325179 m!1213523))

(assert (=> d!142805 d!142873))

(declare-fun d!142875 () Bool)

(assert (=> d!142875 (= (getValueByKey!715 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun lt!589524 () Unit!43443)

(assert (=> d!142875 (= lt!589524 (choose!1955 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun e!755457 () Bool)

(assert (=> d!142875 e!755457))

(declare-fun res!879542 () Bool)

(assert (=> d!142875 (=> (not res!879542) (not e!755457))))

(assert (=> d!142875 (= res!879542 (isStrictlySorted!873 lt!589452))))

(assert (=> d!142875 (= (lemmaContainsTupThenGetReturnValue!358 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!589524)))

(declare-fun b!1325181 () Bool)

(declare-fun res!879543 () Bool)

(assert (=> b!1325181 (=> (not res!879543) (not e!755457))))

(assert (=> b!1325181 (= res!879543 (containsKey!732 lt!589452 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325182 () Bool)

(assert (=> b!1325182 (= e!755457 (contains!8707 lt!589452 (tuple2!23557 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (= (and d!142875 res!879542) b!1325181))

(assert (= (and b!1325181 res!879543) b!1325182))

(assert (=> d!142875 m!1213305))

(declare-fun m!1213525 () Bool)

(assert (=> d!142875 m!1213525))

(declare-fun m!1213527 () Bool)

(assert (=> d!142875 m!1213527))

(declare-fun m!1213529 () Bool)

(assert (=> b!1325181 m!1213529))

(declare-fun m!1213531 () Bool)

(assert (=> b!1325182 m!1213531))

(assert (=> d!142805 d!142875))

(declare-fun b!1325183 () Bool)

(declare-fun e!755462 () List!30685)

(declare-fun e!755460 () List!30685)

(assert (=> b!1325183 (= e!755462 e!755460)))

(declare-fun c!125710 () Bool)

(assert (=> b!1325183 (= c!125710 (and ((_ is Cons!30681) (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (= (_1!11789 (h!31890 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun d!142877 () Bool)

(declare-fun e!755458 () Bool)

(assert (=> d!142877 e!755458))

(declare-fun res!879544 () Bool)

(assert (=> d!142877 (=> (not res!879544) (not e!755458))))

(declare-fun lt!589525 () List!30685)

(assert (=> d!142877 (= res!879544 (isStrictlySorted!873 lt!589525))))

(assert (=> d!142877 (= lt!589525 e!755462)))

(declare-fun c!125708 () Bool)

(assert (=> d!142877 (= c!125708 (and ((_ is Cons!30681) (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvslt (_1!11789 (h!31890 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!142877 (isStrictlySorted!873 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!142877 (= (insertStrictlySorted!487 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) lt!589525)))

(declare-fun bm!64705 () Bool)

(declare-fun call!64710 () List!30685)

(declare-fun call!64708 () List!30685)

(assert (=> bm!64705 (= call!64710 call!64708)))

(declare-fun b!1325184 () Bool)

(declare-fun res!879545 () Bool)

(assert (=> b!1325184 (=> (not res!879545) (not e!755458))))

(assert (=> b!1325184 (= res!879545 (containsKey!732 lt!589525 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325185 () Bool)

(assert (=> b!1325185 (= e!755460 call!64708)))

(declare-fun b!1325186 () Bool)

(declare-fun e!755461 () List!30685)

(assert (=> b!1325186 (= e!755461 call!64710)))

(declare-fun b!1325187 () Bool)

(assert (=> b!1325187 (= e!755461 call!64710)))

(declare-fun b!1325188 () Bool)

(declare-fun c!125707 () Bool)

(assert (=> b!1325188 (= c!125707 (and ((_ is Cons!30681) (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (bvsgt (_1!11789 (h!31890 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> b!1325188 (= e!755460 e!755461)))

(declare-fun b!1325189 () Bool)

(assert (=> b!1325189 (= e!755458 (contains!8707 lt!589525 (tuple2!23557 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(declare-fun e!755459 () List!30685)

(declare-fun b!1325190 () Bool)

(assert (=> b!1325190 (= e!755459 (ite c!125710 (t!44605 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (ite c!125707 (Cons!30681 (h!31890 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (t!44605 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))) Nil!30682)))))

(declare-fun bm!64706 () Bool)

(declare-fun call!64709 () List!30685)

(assert (=> bm!64706 (= call!64708 call!64709)))

(declare-fun b!1325191 () Bool)

(assert (=> b!1325191 (= e!755459 (insertStrictlySorted!487 (t!44605 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325192 () Bool)

(assert (=> b!1325192 (= e!755462 call!64709)))

(declare-fun bm!64707 () Bool)

(assert (=> bm!64707 (= call!64709 ($colon$colon!671 e!755459 (ite c!125708 (h!31890 (toList!10622 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))) (tuple2!23557 (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)) (_2!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun c!125709 () Bool)

(assert (=> bm!64707 (= c!125709 c!125708)))

(assert (= (and d!142877 c!125708) b!1325192))

(assert (= (and d!142877 (not c!125708)) b!1325183))

(assert (= (and b!1325183 c!125710) b!1325185))

(assert (= (and b!1325183 (not c!125710)) b!1325188))

(assert (= (and b!1325188 c!125707) b!1325187))

(assert (= (and b!1325188 (not c!125707)) b!1325186))

(assert (= (or b!1325187 b!1325186) bm!64705))

(assert (= (or b!1325185 bm!64705) bm!64706))

(assert (= (or b!1325192 bm!64706) bm!64707))

(assert (= (and bm!64707 c!125709) b!1325191))

(assert (= (and bm!64707 (not c!125709)) b!1325190))

(assert (= (and d!142877 res!879544) b!1325184))

(assert (= (and b!1325184 res!879545) b!1325189))

(declare-fun m!1213533 () Bool)

(assert (=> b!1325191 m!1213533))

(declare-fun m!1213535 () Bool)

(assert (=> d!142877 m!1213535))

(declare-fun m!1213537 () Bool)

(assert (=> d!142877 m!1213537))

(declare-fun m!1213539 () Bool)

(assert (=> b!1325189 m!1213539))

(declare-fun m!1213541 () Bool)

(assert (=> b!1325184 m!1213541))

(declare-fun m!1213543 () Bool)

(assert (=> bm!64707 m!1213543))

(assert (=> d!142805 d!142877))

(assert (=> bm!64692 d!142851))

(declare-fun d!142879 () Bool)

(assert (=> d!142879 (arrayContainsKey!0 _keys!1609 lt!589328 #b00000000000000000000000000000000)))

(declare-fun lt!589528 () Unit!43443)

(declare-fun choose!13 (array!89397 (_ BitVec 64) (_ BitVec 32)) Unit!43443)

(assert (=> d!142879 (= lt!589528 (choose!13 _keys!1609 lt!589328 #b00000000000000000000000000000000))))

(assert (=> d!142879 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!142879 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!589328 #b00000000000000000000000000000000) lt!589528)))

(declare-fun bs!37872 () Bool)

(assert (= bs!37872 d!142879))

(assert (=> bs!37872 m!1213171))

(declare-fun m!1213545 () Bool)

(assert (=> bs!37872 m!1213545))

(assert (=> b!1324889 d!142879))

(declare-fun d!142881 () Bool)

(declare-fun res!879550 () Bool)

(declare-fun e!755467 () Bool)

(assert (=> d!142881 (=> res!879550 e!755467)))

(assert (=> d!142881 (= res!879550 (= (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) lt!589328))))

(assert (=> d!142881 (= (arrayContainsKey!0 _keys!1609 lt!589328 #b00000000000000000000000000000000) e!755467)))

(declare-fun b!1325197 () Bool)

(declare-fun e!755468 () Bool)

(assert (=> b!1325197 (= e!755467 e!755468)))

(declare-fun res!879551 () Bool)

(assert (=> b!1325197 (=> (not res!879551) (not e!755468))))

(assert (=> b!1325197 (= res!879551 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!43725 _keys!1609)))))

(declare-fun b!1325198 () Bool)

(assert (=> b!1325198 (= e!755468 (arrayContainsKey!0 _keys!1609 lt!589328 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!142881 (not res!879550)) b!1325197))

(assert (= (and b!1325197 res!879551) b!1325198))

(assert (=> d!142881 m!1213167))

(declare-fun m!1213547 () Bool)

(assert (=> b!1325198 m!1213547))

(assert (=> b!1324889 d!142881))

(declare-fun d!142883 () Bool)

(declare-fun lt!589536 () SeekEntryResult!10039)

(assert (=> d!142883 (and (or ((_ is Undefined!10039) lt!589536) (not ((_ is Found!10039) lt!589536)) (and (bvsge (index!42528 lt!589536) #b00000000000000000000000000000000) (bvslt (index!42528 lt!589536) (size!43725 _keys!1609)))) (or ((_ is Undefined!10039) lt!589536) ((_ is Found!10039) lt!589536) (not ((_ is MissingZero!10039) lt!589536)) (and (bvsge (index!42527 lt!589536) #b00000000000000000000000000000000) (bvslt (index!42527 lt!589536) (size!43725 _keys!1609)))) (or ((_ is Undefined!10039) lt!589536) ((_ is Found!10039) lt!589536) ((_ is MissingZero!10039) lt!589536) (not ((_ is MissingVacant!10039) lt!589536)) (and (bvsge (index!42530 lt!589536) #b00000000000000000000000000000000) (bvslt (index!42530 lt!589536) (size!43725 _keys!1609)))) (or ((_ is Undefined!10039) lt!589536) (ite ((_ is Found!10039) lt!589536) (= (select (arr!43173 _keys!1609) (index!42528 lt!589536)) (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!10039) lt!589536) (= (select (arr!43173 _keys!1609) (index!42527 lt!589536)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!10039) lt!589536) (= (select (arr!43173 _keys!1609) (index!42530 lt!589536)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!755476 () SeekEntryResult!10039)

(assert (=> d!142883 (= lt!589536 e!755476)))

(declare-fun c!125717 () Bool)

(declare-fun lt!589535 () SeekEntryResult!10039)

(assert (=> d!142883 (= c!125717 (and ((_ is Intermediate!10039) lt!589535) (undefined!10851 lt!589535)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89397 (_ BitVec 32)) SeekEntryResult!10039)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!142883 (= lt!589535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) mask!2019) (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(assert (=> d!142883 (validMask!0 mask!2019)))

(assert (=> d!142883 (= (seekEntryOrOpen!0 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) lt!589536)))

(declare-fun b!1325211 () Bool)

(declare-fun c!125719 () Bool)

(declare-fun lt!589537 () (_ BitVec 64))

(assert (=> b!1325211 (= c!125719 (= lt!589537 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!755475 () SeekEntryResult!10039)

(declare-fun e!755477 () SeekEntryResult!10039)

(assert (=> b!1325211 (= e!755475 e!755477)))

(declare-fun b!1325212 () Bool)

(assert (=> b!1325212 (= e!755476 e!755475)))

(assert (=> b!1325212 (= lt!589537 (select (arr!43173 _keys!1609) (index!42529 lt!589535)))))

(declare-fun c!125718 () Bool)

(assert (=> b!1325212 (= c!125718 (= lt!589537 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1325213 () Bool)

(assert (=> b!1325213 (= e!755476 Undefined!10039)))

(declare-fun b!1325214 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!89397 (_ BitVec 32)) SeekEntryResult!10039)

(assert (=> b!1325214 (= e!755477 (seekKeyOrZeroReturnVacant!0 (x!118104 lt!589535) (index!42529 lt!589535) (index!42529 lt!589535) (select (arr!43173 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019))))

(declare-fun b!1325215 () Bool)

(assert (=> b!1325215 (= e!755477 (MissingZero!10039 (index!42529 lt!589535)))))

(declare-fun b!1325216 () Bool)

(assert (=> b!1325216 (= e!755475 (Found!10039 (index!42529 lt!589535)))))

(assert (= (and d!142883 c!125717) b!1325213))

(assert (= (and d!142883 (not c!125717)) b!1325212))

(assert (= (and b!1325212 c!125718) b!1325216))

(assert (= (and b!1325212 (not c!125718)) b!1325211))

(assert (= (and b!1325211 c!125719) b!1325215))

(assert (= (and b!1325211 (not c!125719)) b!1325214))

(assert (=> d!142883 m!1213061))

(declare-fun m!1213549 () Bool)

(assert (=> d!142883 m!1213549))

(declare-fun m!1213551 () Bool)

(assert (=> d!142883 m!1213551))

(assert (=> d!142883 m!1213167))

(declare-fun m!1213553 () Bool)

(assert (=> d!142883 m!1213553))

(declare-fun m!1213555 () Bool)

(assert (=> d!142883 m!1213555))

(declare-fun m!1213557 () Bool)

(assert (=> d!142883 m!1213557))

(assert (=> d!142883 m!1213167))

(assert (=> d!142883 m!1213551))

(declare-fun m!1213559 () Bool)

(assert (=> b!1325212 m!1213559))

(assert (=> b!1325214 m!1213167))

(declare-fun m!1213561 () Bool)

(assert (=> b!1325214 m!1213561))

(assert (=> b!1324889 d!142883))

(declare-fun d!142885 () Bool)

(assert (=> d!142885 (= (apply!1022 lt!589407 #b1000000000000000000000000000000000000000000000000000000000000000) (get!21745 (getValueByKey!715 (toList!10622 lt!589407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37873 () Bool)

(assert (= bs!37873 d!142885))

(declare-fun m!1213563 () Bool)

(assert (=> bs!37873 m!1213563))

(assert (=> bs!37873 m!1213563))

(declare-fun m!1213565 () Bool)

(assert (=> bs!37873 m!1213565))

(assert (=> b!1324953 d!142885))

(declare-fun d!142887 () Bool)

(declare-fun lt!589540 () Bool)

(declare-fun content!652 (List!30686) (InoxSet (_ BitVec 64)))

(assert (=> d!142887 (= lt!589540 (select (content!652 Nil!30683) (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun e!755482 () Bool)

(assert (=> d!142887 (= lt!589540 e!755482)))

(declare-fun res!879556 () Bool)

(assert (=> d!142887 (=> (not res!879556) (not e!755482))))

(assert (=> d!142887 (= res!879556 ((_ is Cons!30682) Nil!30683))))

(assert (=> d!142887 (= (contains!8706 Nil!30683 (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)) lt!589540)))

(declare-fun b!1325221 () Bool)

(declare-fun e!755483 () Bool)

(assert (=> b!1325221 (= e!755482 e!755483)))

(declare-fun res!879557 () Bool)

(assert (=> b!1325221 (=> res!879557 e!755483)))

(assert (=> b!1325221 (= res!879557 (= (h!31891 Nil!30683) (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun b!1325222 () Bool)

(assert (=> b!1325222 (= e!755483 (contains!8706 (t!44606 Nil!30683) (select (arr!43173 _keys!1609) #b00000000000000000000000000000000)))))

(assert (= (and d!142887 res!879556) b!1325221))

(assert (= (and b!1325221 (not res!879557)) b!1325222))

(declare-fun m!1213567 () Bool)

(assert (=> d!142887 m!1213567))

(assert (=> d!142887 m!1213167))

(declare-fun m!1213569 () Bool)

(assert (=> d!142887 m!1213569))

(assert (=> b!1325222 m!1213167))

(declare-fun m!1213571 () Bool)

(assert (=> b!1325222 m!1213571))

(assert (=> b!1324974 d!142887))

(declare-fun d!142889 () Bool)

(declare-fun e!755484 () Bool)

(assert (=> d!142889 e!755484))

(declare-fun res!879558 () Bool)

(assert (=> d!142889 (=> res!879558 e!755484)))

(declare-fun lt!589542 () Bool)

(assert (=> d!142889 (= res!879558 (not lt!589542))))

(declare-fun lt!589544 () Bool)

(assert (=> d!142889 (= lt!589542 lt!589544)))

(declare-fun lt!589541 () Unit!43443)

(declare-fun e!755485 () Unit!43443)

(assert (=> d!142889 (= lt!589541 e!755485)))

(declare-fun c!125720 () Bool)

(assert (=> d!142889 (= c!125720 lt!589544)))

(assert (=> d!142889 (= lt!589544 (containsKey!732 (toList!10622 lt!589446) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142889 (= (contains!8704 lt!589446 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589542)))

(declare-fun b!1325223 () Bool)

(declare-fun lt!589543 () Unit!43443)

(assert (=> b!1325223 (= e!755485 lt!589543)))

(assert (=> b!1325223 (= lt!589543 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589446) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> b!1325223 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589446) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325224 () Bool)

(declare-fun Unit!43456 () Unit!43443)

(assert (=> b!1325224 (= e!755485 Unit!43456)))

(declare-fun b!1325225 () Bool)

(assert (=> b!1325225 (= e!755484 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589446) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (= (and d!142889 c!125720) b!1325223))

(assert (= (and d!142889 (not c!125720)) b!1325224))

(assert (= (and d!142889 (not res!879558)) b!1325225))

(declare-fun m!1213573 () Bool)

(assert (=> d!142889 m!1213573))

(declare-fun m!1213575 () Bool)

(assert (=> b!1325223 m!1213575))

(assert (=> b!1325223 m!1213299))

(assert (=> b!1325223 m!1213299))

(declare-fun m!1213577 () Bool)

(assert (=> b!1325223 m!1213577))

(assert (=> b!1325225 m!1213299))

(assert (=> b!1325225 m!1213299))

(assert (=> b!1325225 m!1213577))

(assert (=> d!142803 d!142889))

(declare-fun b!1325229 () Bool)

(declare-fun e!755487 () Option!766)

(assert (=> b!1325229 (= e!755487 None!764)))

(declare-fun b!1325228 () Bool)

(assert (=> b!1325228 (= e!755487 (getValueByKey!715 (t!44605 lt!589448) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325226 () Bool)

(declare-fun e!755486 () Option!766)

(assert (=> b!1325226 (= e!755486 (Some!765 (_2!11789 (h!31890 lt!589448))))))

(declare-fun b!1325227 () Bool)

(assert (=> b!1325227 (= e!755486 e!755487)))

(declare-fun c!125722 () Bool)

(assert (=> b!1325227 (= c!125722 (and ((_ is Cons!30681) lt!589448) (not (= (_1!11789 (h!31890 lt!589448)) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun d!142891 () Bool)

(declare-fun c!125721 () Bool)

(assert (=> d!142891 (= c!125721 (and ((_ is Cons!30681) lt!589448) (= (_1!11789 (h!31890 lt!589448)) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142891 (= (getValueByKey!715 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) e!755486)))

(assert (= (and d!142891 c!125721) b!1325226))

(assert (= (and d!142891 (not c!125721)) b!1325227))

(assert (= (and b!1325227 c!125722) b!1325228))

(assert (= (and b!1325227 (not c!125722)) b!1325229))

(declare-fun m!1213579 () Bool)

(assert (=> b!1325228 m!1213579))

(assert (=> d!142803 d!142891))

(declare-fun d!142893 () Bool)

(assert (=> d!142893 (= (getValueByKey!715 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!589545 () Unit!43443)

(assert (=> d!142893 (= lt!589545 (choose!1955 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun e!755488 () Bool)

(assert (=> d!142893 e!755488))

(declare-fun res!879559 () Bool)

(assert (=> d!142893 (=> (not res!879559) (not e!755488))))

(assert (=> d!142893 (= res!879559 (isStrictlySorted!873 lt!589448))))

(assert (=> d!142893 (= (lemmaContainsTupThenGetReturnValue!358 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589545)))

(declare-fun b!1325230 () Bool)

(declare-fun res!879560 () Bool)

(assert (=> b!1325230 (=> (not res!879560) (not e!755488))))

(assert (=> b!1325230 (= res!879560 (containsKey!732 lt!589448 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325231 () Bool)

(assert (=> b!1325231 (= e!755488 (contains!8707 lt!589448 (tuple2!23557 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (= (and d!142893 res!879559) b!1325230))

(assert (= (and b!1325230 res!879560) b!1325231))

(assert (=> d!142893 m!1213293))

(declare-fun m!1213581 () Bool)

(assert (=> d!142893 m!1213581))

(declare-fun m!1213583 () Bool)

(assert (=> d!142893 m!1213583))

(declare-fun m!1213585 () Bool)

(assert (=> b!1325230 m!1213585))

(declare-fun m!1213587 () Bool)

(assert (=> b!1325231 m!1213587))

(assert (=> d!142803 d!142893))

(declare-fun b!1325232 () Bool)

(declare-fun e!755493 () List!30685)

(declare-fun e!755491 () List!30685)

(assert (=> b!1325232 (= e!755493 e!755491)))

(declare-fun c!125726 () Bool)

(assert (=> b!1325232 (= c!125726 (and ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (= (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun d!142895 () Bool)

(declare-fun e!755489 () Bool)

(assert (=> d!142895 e!755489))

(declare-fun res!879561 () Bool)

(assert (=> d!142895 (=> (not res!879561) (not e!755489))))

(declare-fun lt!589546 () List!30685)

(assert (=> d!142895 (= res!879561 (isStrictlySorted!873 lt!589546))))

(assert (=> d!142895 (= lt!589546 e!755493)))

(declare-fun c!125724 () Bool)

(assert (=> d!142895 (= c!125724 (and ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (bvslt (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142895 (isStrictlySorted!873 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(assert (=> d!142895 (= (insertStrictlySorted!487 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) lt!589546)))

(declare-fun bm!64708 () Bool)

(declare-fun call!64713 () List!30685)

(declare-fun call!64711 () List!30685)

(assert (=> bm!64708 (= call!64713 call!64711)))

(declare-fun b!1325233 () Bool)

(declare-fun res!879562 () Bool)

(assert (=> b!1325233 (=> (not res!879562) (not e!755489))))

(assert (=> b!1325233 (= res!879562 (containsKey!732 lt!589546 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325234 () Bool)

(assert (=> b!1325234 (= e!755491 call!64711)))

(declare-fun b!1325235 () Bool)

(declare-fun e!755492 () List!30685)

(assert (=> b!1325235 (= e!755492 call!64713)))

(declare-fun b!1325236 () Bool)

(assert (=> b!1325236 (= e!755492 call!64713)))

(declare-fun c!125723 () Bool)

(declare-fun b!1325237 () Bool)

(assert (=> b!1325237 (= c!125723 (and ((_ is Cons!30681) (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (bvsgt (_1!11789 (h!31890 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> b!1325237 (= e!755491 e!755492)))

(declare-fun b!1325238 () Bool)

(assert (=> b!1325238 (= e!755489 (contains!8707 lt!589546 (tuple2!23557 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1325239 () Bool)

(declare-fun e!755490 () List!30685)

(assert (=> b!1325239 (= e!755490 (ite c!125726 (t!44605 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (ite c!125723 (Cons!30681 (h!31890 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (t!44605 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))) Nil!30682)))))

(declare-fun bm!64709 () Bool)

(declare-fun call!64712 () List!30685)

(assert (=> bm!64709 (= call!64711 call!64712)))

(declare-fun b!1325240 () Bool)

(assert (=> b!1325240 (= e!755490 (insertStrictlySorted!487 (t!44605 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325241 () Bool)

(assert (=> b!1325241 (= e!755493 call!64712)))

(declare-fun bm!64710 () Bool)

(assert (=> bm!64710 (= call!64712 ($colon$colon!671 e!755490 (ite c!125724 (h!31890 (toList!10622 (+!4630 (+!4630 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))) (tuple2!23557 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun c!125725 () Bool)

(assert (=> bm!64710 (= c!125725 c!125724)))

(assert (= (and d!142895 c!125724) b!1325241))

(assert (= (and d!142895 (not c!125724)) b!1325232))

(assert (= (and b!1325232 c!125726) b!1325234))

(assert (= (and b!1325232 (not c!125726)) b!1325237))

(assert (= (and b!1325237 c!125723) b!1325236))

(assert (= (and b!1325237 (not c!125723)) b!1325235))

(assert (= (or b!1325236 b!1325235) bm!64708))

(assert (= (or b!1325234 bm!64708) bm!64709))

(assert (= (or b!1325241 bm!64709) bm!64710))

(assert (= (and bm!64710 c!125725) b!1325240))

(assert (= (and bm!64710 (not c!125725)) b!1325239))

(assert (= (and d!142895 res!879561) b!1325233))

(assert (= (and b!1325233 res!879562) b!1325238))

(declare-fun m!1213589 () Bool)

(assert (=> b!1325240 m!1213589))

(declare-fun m!1213591 () Bool)

(assert (=> d!142895 m!1213591))

(declare-fun m!1213593 () Bool)

(assert (=> d!142895 m!1213593))

(declare-fun m!1213595 () Bool)

(assert (=> b!1325238 m!1213595))

(declare-fun m!1213597 () Bool)

(assert (=> b!1325233 m!1213597))

(declare-fun m!1213599 () Bool)

(assert (=> bm!64710 m!1213599))

(assert (=> d!142803 d!142895))

(declare-fun d!142897 () Bool)

(declare-fun res!879563 () Bool)

(declare-fun e!755494 () Bool)

(assert (=> d!142897 (=> res!879563 e!755494)))

(assert (=> d!142897 (= res!879563 (and ((_ is Cons!30681) (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (= (_1!11789 (h!31890 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(assert (=> d!142897 (= (containsKey!732 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)) k0!1164) e!755494)))

(declare-fun b!1325242 () Bool)

(declare-fun e!755495 () Bool)

(assert (=> b!1325242 (= e!755494 e!755495)))

(declare-fun res!879564 () Bool)

(assert (=> b!1325242 (=> (not res!879564) (not e!755495))))

(assert (=> b!1325242 (= res!879564 (and (or (not ((_ is Cons!30681) (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) (bvsle (_1!11789 (h!31890 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)) ((_ is Cons!30681) (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) (bvslt (_1!11789 (h!31890 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340)))) k0!1164)))))

(declare-fun b!1325243 () Bool)

(assert (=> b!1325243 (= e!755495 (containsKey!732 (t!44605 (toList!10622 (getCurrentListMap!5500 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340))) k0!1164))))

(assert (= (and d!142897 (not res!879563)) b!1325242))

(assert (= (and b!1325242 res!879564) b!1325243))

(declare-fun m!1213601 () Bool)

(assert (=> b!1325243 m!1213601))

(assert (=> d!142783 d!142897))

(assert (=> b!1324981 d!142833))

(assert (=> b!1324981 d!142835))

(declare-fun d!142899 () Bool)

(declare-fun isEmpty!1083 (List!30685) Bool)

(assert (=> d!142899 (= (isEmpty!1081 lt!589439) (isEmpty!1083 (toList!10622 lt!589439)))))

(declare-fun bs!37874 () Bool)

(assert (= bs!37874 d!142899))

(declare-fun m!1213603 () Bool)

(assert (=> bs!37874 m!1213603))

(assert (=> b!1325026 d!142899))

(declare-fun b!1325244 () Bool)

(declare-fun e!755498 () Bool)

(declare-fun e!755499 () Bool)

(assert (=> b!1325244 (= e!755498 e!755499)))

(declare-fun c!125729 () Bool)

(declare-fun e!755500 () Bool)

(assert (=> b!1325244 (= c!125729 e!755500)))

(declare-fun res!879568 () Bool)

(assert (=> b!1325244 (=> (not res!879568) (not e!755500))))

(assert (=> b!1325244 (= res!879568 (bvslt from!2000 (size!43725 _keys!1609)))))

(declare-fun b!1325245 () Bool)

(declare-fun e!755501 () Bool)

(assert (=> b!1325245 (= e!755499 e!755501)))

(assert (=> b!1325245 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)))))

(declare-fun res!879567 () Bool)

(declare-fun lt!589548 () ListLongMap!21213)

(assert (=> b!1325245 (= res!879567 (contains!8704 lt!589548 (select (arr!43173 _keys!1609) from!2000)))))

(assert (=> b!1325245 (=> (not res!879567) (not e!755501))))

(declare-fun b!1325246 () Bool)

(declare-fun e!755502 () Bool)

(assert (=> b!1325246 (= e!755502 (= lt!589548 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340)))))

(declare-fun d!142901 () Bool)

(assert (=> d!142901 e!755498))

(declare-fun res!879565 () Bool)

(assert (=> d!142901 (=> (not res!879565) (not e!755498))))

(assert (=> d!142901 (= res!879565 (not (contains!8704 lt!589548 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!755497 () ListLongMap!21213)

(assert (=> d!142901 (= lt!589548 e!755497)))

(declare-fun c!125727 () Bool)

(assert (=> d!142901 (= c!125727 (bvsge from!2000 (size!43725 _keys!1609)))))

(assert (=> d!142901 (validMask!0 mask!2019)))

(assert (=> d!142901 (= (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) lt!589548)))

(declare-fun b!1325247 () Bool)

(declare-fun e!755496 () ListLongMap!21213)

(assert (=> b!1325247 (= e!755497 e!755496)))

(declare-fun c!125728 () Bool)

(assert (=> b!1325247 (= c!125728 (validKeyInArray!0 (select (arr!43173 _keys!1609) from!2000)))))

(declare-fun b!1325248 () Bool)

(declare-fun res!879566 () Bool)

(assert (=> b!1325248 (=> (not res!879566) (not e!755498))))

(assert (=> b!1325248 (= res!879566 (not (contains!8704 lt!589548 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1325249 () Bool)

(assert (=> b!1325249 (= e!755499 e!755502)))

(declare-fun c!125730 () Bool)

(assert (=> b!1325249 (= c!125730 (bvslt from!2000 (size!43725 _keys!1609)))))

(declare-fun b!1325250 () Bool)

(assert (=> b!1325250 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43725 _keys!1609)))))

(assert (=> b!1325250 (and (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43726 _values!1337)))))

(assert (=> b!1325250 (= e!755501 (= (apply!1022 lt!589548 (select (arr!43173 _keys!1609) from!2000)) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325251 () Bool)

(assert (=> b!1325251 (= e!755497 (ListLongMap!21214 Nil!30682))))

(declare-fun b!1325252 () Bool)

(assert (=> b!1325252 (= e!755502 (isEmpty!1081 lt!589548))))

(declare-fun call!64714 () ListLongMap!21213)

(declare-fun bm!64711 () Bool)

(assert (=> bm!64711 (= call!64714 (getCurrentListMapNoExtraKeys!6268 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd from!2000 #b00000000000000000000000000000001) defaultEntry!1340))))

(declare-fun b!1325253 () Bool)

(assert (=> b!1325253 (= e!755496 call!64714)))

(declare-fun b!1325254 () Bool)

(assert (=> b!1325254 (= e!755500 (validKeyInArray!0 (select (arr!43173 _keys!1609) from!2000)))))

(assert (=> b!1325254 (bvsge from!2000 #b00000000000000000000000000000000)))

(declare-fun b!1325255 () Bool)

(declare-fun lt!589549 () Unit!43443)

(declare-fun lt!589547 () Unit!43443)

(assert (=> b!1325255 (= lt!589549 lt!589547)))

(declare-fun lt!589550 () (_ BitVec 64))

(declare-fun lt!589553 () ListLongMap!21213)

(declare-fun lt!589552 () (_ BitVec 64))

(declare-fun lt!589551 () V!53473)

(assert (=> b!1325255 (not (contains!8704 (+!4630 lt!589553 (tuple2!23557 lt!589552 lt!589551)) lt!589550))))

(assert (=> b!1325255 (= lt!589547 (addStillNotContains!481 lt!589553 lt!589552 lt!589551 lt!589550))))

(assert (=> b!1325255 (= lt!589550 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1325255 (= lt!589551 (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1325255 (= lt!589552 (select (arr!43173 _keys!1609) from!2000))))

(assert (=> b!1325255 (= lt!589553 call!64714)))

(assert (=> b!1325255 (= e!755496 (+!4630 call!64714 (tuple2!23557 (select (arr!43173 _keys!1609) from!2000) (get!21741 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!142901 c!125727) b!1325251))

(assert (= (and d!142901 (not c!125727)) b!1325247))

(assert (= (and b!1325247 c!125728) b!1325255))

(assert (= (and b!1325247 (not c!125728)) b!1325253))

(assert (= (or b!1325255 b!1325253) bm!64711))

(assert (= (and d!142901 res!879565) b!1325248))

(assert (= (and b!1325248 res!879566) b!1325244))

(assert (= (and b!1325244 res!879568) b!1325254))

(assert (= (and b!1325244 c!125729) b!1325245))

(assert (= (and b!1325244 (not c!125729)) b!1325249))

(assert (= (and b!1325245 res!879567) b!1325250))

(assert (= (and b!1325249 c!125730) b!1325246))

(assert (= (and b!1325249 (not c!125730)) b!1325252))

(declare-fun b_lambda!23719 () Bool)

(assert (=> (not b_lambda!23719) (not b!1325250)))

(assert (=> b!1325250 t!44604))

(declare-fun b_and!48999 () Bool)

(assert (= b_and!48997 (and (=> t!44604 result!24509) b_and!48999)))

(declare-fun b_lambda!23721 () Bool)

(assert (=> (not b_lambda!23721) (not b!1325255)))

(assert (=> b!1325255 t!44604))

(declare-fun b_and!49001 () Bool)

(assert (= b_and!48999 (and (=> t!44604 result!24509) b_and!49001)))

(declare-fun m!1213605 () Bool)

(assert (=> b!1325252 m!1213605))

(declare-fun m!1213607 () Bool)

(assert (=> bm!64711 m!1213607))

(assert (=> b!1325245 m!1213067))

(assert (=> b!1325245 m!1213067))

(declare-fun m!1213609 () Bool)

(assert (=> b!1325245 m!1213609))

(assert (=> b!1325250 m!1213067))

(assert (=> b!1325250 m!1213087))

(assert (=> b!1325250 m!1213079))

(assert (=> b!1325250 m!1213091))

(assert (=> b!1325250 m!1213079))

(assert (=> b!1325250 m!1213087))

(assert (=> b!1325250 m!1213067))

(declare-fun m!1213611 () Bool)

(assert (=> b!1325250 m!1213611))

(assert (=> b!1325255 m!1213067))

(declare-fun m!1213613 () Bool)

(assert (=> b!1325255 m!1213613))

(assert (=> b!1325255 m!1213087))

(assert (=> b!1325255 m!1213079))

(assert (=> b!1325255 m!1213091))

(assert (=> b!1325255 m!1213079))

(assert (=> b!1325255 m!1213087))

(declare-fun m!1213615 () Bool)

(assert (=> b!1325255 m!1213615))

(declare-fun m!1213617 () Bool)

(assert (=> b!1325255 m!1213617))

(declare-fun m!1213619 () Bool)

(assert (=> b!1325255 m!1213619))

(assert (=> b!1325255 m!1213617))

(declare-fun m!1213621 () Bool)

(assert (=> d!142901 m!1213621))

(assert (=> d!142901 m!1213061))

(assert (=> b!1325254 m!1213067))

(assert (=> b!1325254 m!1213067))

(assert (=> b!1325254 m!1213093))

(declare-fun m!1213623 () Bool)

(assert (=> b!1325248 m!1213623))

(assert (=> b!1325246 m!1213607))

(assert (=> b!1325247 m!1213067))

(assert (=> b!1325247 m!1213067))

(assert (=> b!1325247 m!1213093))

(assert (=> bm!64680 d!142901))

(declare-fun d!142903 () Bool)

(declare-fun lt!589554 () Bool)

(assert (=> d!142903 (= lt!589554 (select (content!651 (toList!10622 lt!589446)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun e!755503 () Bool)

(assert (=> d!142903 (= lt!589554 e!755503)))

(declare-fun res!879569 () Bool)

(assert (=> d!142903 (=> (not res!879569) (not e!755503))))

(assert (=> d!142903 (= res!879569 ((_ is Cons!30681) (toList!10622 lt!589446)))))

(assert (=> d!142903 (= (contains!8707 (toList!10622 lt!589446) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!589554)))

(declare-fun b!1325256 () Bool)

(declare-fun e!755504 () Bool)

(assert (=> b!1325256 (= e!755503 e!755504)))

(declare-fun res!879570 () Bool)

(assert (=> b!1325256 (=> res!879570 e!755504)))

(assert (=> b!1325256 (= res!879570 (= (h!31890 (toList!10622 lt!589446)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(declare-fun b!1325257 () Bool)

(assert (=> b!1325257 (= e!755504 (contains!8707 (t!44605 (toList!10622 lt!589446)) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142903 res!879569) b!1325256))

(assert (= (and b!1325256 (not res!879570)) b!1325257))

(declare-fun m!1213625 () Bool)

(assert (=> d!142903 m!1213625))

(declare-fun m!1213627 () Bool)

(assert (=> d!142903 m!1213627))

(declare-fun m!1213629 () Bool)

(assert (=> b!1325257 m!1213629))

(assert (=> b!1325031 d!142903))

(assert (=> b!1324960 d!142781))

(declare-fun d!142905 () Bool)

(declare-fun e!755505 () Bool)

(assert (=> d!142905 e!755505))

(declare-fun res!879572 () Bool)

(assert (=> d!142905 (=> (not res!879572) (not e!755505))))

(declare-fun lt!589556 () ListLongMap!21213)

(assert (=> d!142905 (= res!879572 (contains!8704 lt!589556 (_1!11789 (tuple2!23557 lt!589395 zeroValue!1279))))))

(declare-fun lt!589558 () List!30685)

(assert (=> d!142905 (= lt!589556 (ListLongMap!21214 lt!589558))))

(declare-fun lt!589557 () Unit!43443)

(declare-fun lt!589555 () Unit!43443)

(assert (=> d!142905 (= lt!589557 lt!589555)))

(assert (=> d!142905 (= (getValueByKey!715 lt!589558 (_1!11789 (tuple2!23557 lt!589395 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589395 zeroValue!1279))))))

(assert (=> d!142905 (= lt!589555 (lemmaContainsTupThenGetReturnValue!358 lt!589558 (_1!11789 (tuple2!23557 lt!589395 zeroValue!1279)) (_2!11789 (tuple2!23557 lt!589395 zeroValue!1279))))))

(assert (=> d!142905 (= lt!589558 (insertStrictlySorted!487 (toList!10622 lt!589389) (_1!11789 (tuple2!23557 lt!589395 zeroValue!1279)) (_2!11789 (tuple2!23557 lt!589395 zeroValue!1279))))))

(assert (=> d!142905 (= (+!4630 lt!589389 (tuple2!23557 lt!589395 zeroValue!1279)) lt!589556)))

(declare-fun b!1325258 () Bool)

(declare-fun res!879571 () Bool)

(assert (=> b!1325258 (=> (not res!879571) (not e!755505))))

(assert (=> b!1325258 (= res!879571 (= (getValueByKey!715 (toList!10622 lt!589556) (_1!11789 (tuple2!23557 lt!589395 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589395 zeroValue!1279)))))))

(declare-fun b!1325259 () Bool)

(assert (=> b!1325259 (= e!755505 (contains!8707 (toList!10622 lt!589556) (tuple2!23557 lt!589395 zeroValue!1279)))))

(assert (= (and d!142905 res!879572) b!1325258))

(assert (= (and b!1325258 res!879571) b!1325259))

(declare-fun m!1213631 () Bool)

(assert (=> d!142905 m!1213631))

(declare-fun m!1213633 () Bool)

(assert (=> d!142905 m!1213633))

(declare-fun m!1213635 () Bool)

(assert (=> d!142905 m!1213635))

(declare-fun m!1213637 () Bool)

(assert (=> d!142905 m!1213637))

(declare-fun m!1213639 () Bool)

(assert (=> b!1325258 m!1213639))

(declare-fun m!1213641 () Bool)

(assert (=> b!1325259 m!1213641))

(assert (=> b!1324961 d!142905))

(declare-fun d!142907 () Bool)

(assert (=> d!142907 (= (apply!1022 (+!4630 lt!589391 (tuple2!23557 lt!589404 minValue!1279)) lt!589399) (apply!1022 lt!589391 lt!589399))))

(declare-fun lt!589561 () Unit!43443)

(declare-fun choose!1957 (ListLongMap!21213 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43443)

(assert (=> d!142907 (= lt!589561 (choose!1957 lt!589391 lt!589404 minValue!1279 lt!589399))))

(declare-fun e!755508 () Bool)

(assert (=> d!142907 e!755508))

(declare-fun res!879575 () Bool)

(assert (=> d!142907 (=> (not res!879575) (not e!755508))))

(assert (=> d!142907 (= res!879575 (contains!8704 lt!589391 lt!589399))))

(assert (=> d!142907 (= (addApplyDifferent!560 lt!589391 lt!589404 minValue!1279 lt!589399) lt!589561)))

(declare-fun b!1325263 () Bool)

(assert (=> b!1325263 (= e!755508 (not (= lt!589399 lt!589404)))))

(assert (= (and d!142907 res!879575) b!1325263))

(assert (=> d!142907 m!1213209))

(assert (=> d!142907 m!1213215))

(declare-fun m!1213643 () Bool)

(assert (=> d!142907 m!1213643))

(assert (=> d!142907 m!1213209))

(assert (=> d!142907 m!1213221))

(declare-fun m!1213645 () Bool)

(assert (=> d!142907 m!1213645))

(assert (=> b!1324961 d!142907))

(declare-fun d!142909 () Bool)

(assert (=> d!142909 (= (apply!1022 (+!4630 lt!589389 (tuple2!23557 lt!589395 zeroValue!1279)) lt!589398) (apply!1022 lt!589389 lt!589398))))

(declare-fun lt!589562 () Unit!43443)

(assert (=> d!142909 (= lt!589562 (choose!1957 lt!589389 lt!589395 zeroValue!1279 lt!589398))))

(declare-fun e!755509 () Bool)

(assert (=> d!142909 e!755509))

(declare-fun res!879576 () Bool)

(assert (=> d!142909 (=> (not res!879576) (not e!755509))))

(assert (=> d!142909 (= res!879576 (contains!8704 lt!589389 lt!589398))))

(assert (=> d!142909 (= (addApplyDifferent!560 lt!589389 lt!589395 zeroValue!1279 lt!589398) lt!589562)))

(declare-fun b!1325264 () Bool)

(assert (=> b!1325264 (= e!755509 (not (= lt!589398 lt!589395)))))

(assert (= (and d!142909 res!879576) b!1325264))

(assert (=> d!142909 m!1213217))

(assert (=> d!142909 m!1213227))

(declare-fun m!1213647 () Bool)

(assert (=> d!142909 m!1213647))

(assert (=> d!142909 m!1213217))

(assert (=> d!142909 m!1213231))

(declare-fun m!1213649 () Bool)

(assert (=> d!142909 m!1213649))

(assert (=> b!1324961 d!142909))

(declare-fun d!142911 () Bool)

(declare-fun e!755510 () Bool)

(assert (=> d!142911 e!755510))

(declare-fun res!879577 () Bool)

(assert (=> d!142911 (=> res!879577 e!755510)))

(declare-fun lt!589564 () Bool)

(assert (=> d!142911 (= res!879577 (not lt!589564))))

(declare-fun lt!589566 () Bool)

(assert (=> d!142911 (= lt!589564 lt!589566)))

(declare-fun lt!589563 () Unit!43443)

(declare-fun e!755511 () Unit!43443)

(assert (=> d!142911 (= lt!589563 e!755511)))

(declare-fun c!125731 () Bool)

(assert (=> d!142911 (= c!125731 lt!589566)))

(assert (=> d!142911 (= lt!589566 (containsKey!732 (toList!10622 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279))) lt!589390))))

(assert (=> d!142911 (= (contains!8704 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279)) lt!589390) lt!589564)))

(declare-fun b!1325265 () Bool)

(declare-fun lt!589565 () Unit!43443)

(assert (=> b!1325265 (= e!755511 lt!589565)))

(assert (=> b!1325265 (= lt!589565 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279))) lt!589390))))

(assert (=> b!1325265 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279))) lt!589390))))

(declare-fun b!1325266 () Bool)

(declare-fun Unit!43457 () Unit!43443)

(assert (=> b!1325266 (= e!755511 Unit!43457)))

(declare-fun b!1325267 () Bool)

(assert (=> b!1325267 (= e!755510 (isDefined!522 (getValueByKey!715 (toList!10622 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279))) lt!589390)))))

(assert (= (and d!142911 c!125731) b!1325265))

(assert (= (and d!142911 (not c!125731)) b!1325266))

(assert (= (and d!142911 (not res!879577)) b!1325267))

(declare-fun m!1213651 () Bool)

(assert (=> d!142911 m!1213651))

(declare-fun m!1213653 () Bool)

(assert (=> b!1325265 m!1213653))

(declare-fun m!1213655 () Bool)

(assert (=> b!1325265 m!1213655))

(assert (=> b!1325265 m!1213655))

(declare-fun m!1213657 () Bool)

(assert (=> b!1325265 m!1213657))

(assert (=> b!1325267 m!1213655))

(assert (=> b!1325267 m!1213655))

(assert (=> b!1325267 m!1213657))

(assert (=> b!1324961 d!142911))

(declare-fun d!142913 () Bool)

(assert (=> d!142913 (= (apply!1022 (+!4630 lt!589392 (tuple2!23557 lt!589402 minValue!1279)) lt!589400) (get!21745 (getValueByKey!715 (toList!10622 (+!4630 lt!589392 (tuple2!23557 lt!589402 minValue!1279))) lt!589400)))))

(declare-fun bs!37875 () Bool)

(assert (= bs!37875 d!142913))

(declare-fun m!1213659 () Bool)

(assert (=> bs!37875 m!1213659))

(assert (=> bs!37875 m!1213659))

(declare-fun m!1213661 () Bool)

(assert (=> bs!37875 m!1213661))

(assert (=> b!1324961 d!142913))

(declare-fun d!142915 () Bool)

(assert (=> d!142915 (contains!8704 (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279)) lt!589390)))

(declare-fun lt!589569 () Unit!43443)

(declare-fun choose!1958 (ListLongMap!21213 (_ BitVec 64) V!53473 (_ BitVec 64)) Unit!43443)

(assert (=> d!142915 (= lt!589569 (choose!1958 lt!589394 lt!589397 zeroValue!1279 lt!589390))))

(assert (=> d!142915 (contains!8704 lt!589394 lt!589390)))

(assert (=> d!142915 (= (addStillContains!1154 lt!589394 lt!589397 zeroValue!1279 lt!589390) lt!589569)))

(declare-fun bs!37876 () Bool)

(assert (= bs!37876 d!142915))

(assert (=> bs!37876 m!1213211))

(assert (=> bs!37876 m!1213211))

(assert (=> bs!37876 m!1213213))

(declare-fun m!1213663 () Bool)

(assert (=> bs!37876 m!1213663))

(declare-fun m!1213665 () Bool)

(assert (=> bs!37876 m!1213665))

(assert (=> b!1324961 d!142915))

(assert (=> b!1324961 d!142901))

(declare-fun d!142917 () Bool)

(assert (=> d!142917 (= (apply!1022 (+!4630 lt!589389 (tuple2!23557 lt!589395 zeroValue!1279)) lt!589398) (get!21745 (getValueByKey!715 (toList!10622 (+!4630 lt!589389 (tuple2!23557 lt!589395 zeroValue!1279))) lt!589398)))))

(declare-fun bs!37877 () Bool)

(assert (= bs!37877 d!142917))

(declare-fun m!1213667 () Bool)

(assert (=> bs!37877 m!1213667))

(assert (=> bs!37877 m!1213667))

(declare-fun m!1213669 () Bool)

(assert (=> bs!37877 m!1213669))

(assert (=> b!1324961 d!142917))

(declare-fun d!142919 () Bool)

(assert (=> d!142919 (= (apply!1022 lt!589392 lt!589400) (get!21745 (getValueByKey!715 (toList!10622 lt!589392) lt!589400)))))

(declare-fun bs!37878 () Bool)

(assert (= bs!37878 d!142919))

(declare-fun m!1213671 () Bool)

(assert (=> bs!37878 m!1213671))

(assert (=> bs!37878 m!1213671))

(declare-fun m!1213673 () Bool)

(assert (=> bs!37878 m!1213673))

(assert (=> b!1324961 d!142919))

(declare-fun d!142921 () Bool)

(declare-fun e!755512 () Bool)

(assert (=> d!142921 e!755512))

(declare-fun res!879579 () Bool)

(assert (=> d!142921 (=> (not res!879579) (not e!755512))))

(declare-fun lt!589571 () ListLongMap!21213)

(assert (=> d!142921 (= res!879579 (contains!8704 lt!589571 (_1!11789 (tuple2!23557 lt!589397 zeroValue!1279))))))

(declare-fun lt!589573 () List!30685)

(assert (=> d!142921 (= lt!589571 (ListLongMap!21214 lt!589573))))

(declare-fun lt!589572 () Unit!43443)

(declare-fun lt!589570 () Unit!43443)

(assert (=> d!142921 (= lt!589572 lt!589570)))

(assert (=> d!142921 (= (getValueByKey!715 lt!589573 (_1!11789 (tuple2!23557 lt!589397 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589397 zeroValue!1279))))))

(assert (=> d!142921 (= lt!589570 (lemmaContainsTupThenGetReturnValue!358 lt!589573 (_1!11789 (tuple2!23557 lt!589397 zeroValue!1279)) (_2!11789 (tuple2!23557 lt!589397 zeroValue!1279))))))

(assert (=> d!142921 (= lt!589573 (insertStrictlySorted!487 (toList!10622 lt!589394) (_1!11789 (tuple2!23557 lt!589397 zeroValue!1279)) (_2!11789 (tuple2!23557 lt!589397 zeroValue!1279))))))

(assert (=> d!142921 (= (+!4630 lt!589394 (tuple2!23557 lt!589397 zeroValue!1279)) lt!589571)))

(declare-fun b!1325269 () Bool)

(declare-fun res!879578 () Bool)

(assert (=> b!1325269 (=> (not res!879578) (not e!755512))))

(assert (=> b!1325269 (= res!879578 (= (getValueByKey!715 (toList!10622 lt!589571) (_1!11789 (tuple2!23557 lt!589397 zeroValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589397 zeroValue!1279)))))))

(declare-fun b!1325270 () Bool)

(assert (=> b!1325270 (= e!755512 (contains!8707 (toList!10622 lt!589571) (tuple2!23557 lt!589397 zeroValue!1279)))))

(assert (= (and d!142921 res!879579) b!1325269))

(assert (= (and b!1325269 res!879578) b!1325270))

(declare-fun m!1213675 () Bool)

(assert (=> d!142921 m!1213675))

(declare-fun m!1213677 () Bool)

(assert (=> d!142921 m!1213677))

(declare-fun m!1213679 () Bool)

(assert (=> d!142921 m!1213679))

(declare-fun m!1213681 () Bool)

(assert (=> d!142921 m!1213681))

(declare-fun m!1213683 () Bool)

(assert (=> b!1325269 m!1213683))

(declare-fun m!1213685 () Bool)

(assert (=> b!1325270 m!1213685))

(assert (=> b!1324961 d!142921))

(declare-fun d!142923 () Bool)

(assert (=> d!142923 (= (apply!1022 lt!589389 lt!589398) (get!21745 (getValueByKey!715 (toList!10622 lt!589389) lt!589398)))))

(declare-fun bs!37879 () Bool)

(assert (= bs!37879 d!142923))

(declare-fun m!1213687 () Bool)

(assert (=> bs!37879 m!1213687))

(assert (=> bs!37879 m!1213687))

(declare-fun m!1213689 () Bool)

(assert (=> bs!37879 m!1213689))

(assert (=> b!1324961 d!142923))

(declare-fun d!142925 () Bool)

(declare-fun e!755513 () Bool)

(assert (=> d!142925 e!755513))

(declare-fun res!879581 () Bool)

(assert (=> d!142925 (=> (not res!879581) (not e!755513))))

(declare-fun lt!589575 () ListLongMap!21213)

(assert (=> d!142925 (= res!879581 (contains!8704 lt!589575 (_1!11789 (tuple2!23557 lt!589404 minValue!1279))))))

(declare-fun lt!589577 () List!30685)

(assert (=> d!142925 (= lt!589575 (ListLongMap!21214 lt!589577))))

(declare-fun lt!589576 () Unit!43443)

(declare-fun lt!589574 () Unit!43443)

(assert (=> d!142925 (= lt!589576 lt!589574)))

(assert (=> d!142925 (= (getValueByKey!715 lt!589577 (_1!11789 (tuple2!23557 lt!589404 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589404 minValue!1279))))))

(assert (=> d!142925 (= lt!589574 (lemmaContainsTupThenGetReturnValue!358 lt!589577 (_1!11789 (tuple2!23557 lt!589404 minValue!1279)) (_2!11789 (tuple2!23557 lt!589404 minValue!1279))))))

(assert (=> d!142925 (= lt!589577 (insertStrictlySorted!487 (toList!10622 lt!589391) (_1!11789 (tuple2!23557 lt!589404 minValue!1279)) (_2!11789 (tuple2!23557 lt!589404 minValue!1279))))))

(assert (=> d!142925 (= (+!4630 lt!589391 (tuple2!23557 lt!589404 minValue!1279)) lt!589575)))

(declare-fun b!1325271 () Bool)

(declare-fun res!879580 () Bool)

(assert (=> b!1325271 (=> (not res!879580) (not e!755513))))

(assert (=> b!1325271 (= res!879580 (= (getValueByKey!715 (toList!10622 lt!589575) (_1!11789 (tuple2!23557 lt!589404 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589404 minValue!1279)))))))

(declare-fun b!1325272 () Bool)

(assert (=> b!1325272 (= e!755513 (contains!8707 (toList!10622 lt!589575) (tuple2!23557 lt!589404 minValue!1279)))))

(assert (= (and d!142925 res!879581) b!1325271))

(assert (= (and b!1325271 res!879580) b!1325272))

(declare-fun m!1213691 () Bool)

(assert (=> d!142925 m!1213691))

(declare-fun m!1213693 () Bool)

(assert (=> d!142925 m!1213693))

(declare-fun m!1213695 () Bool)

(assert (=> d!142925 m!1213695))

(declare-fun m!1213697 () Bool)

(assert (=> d!142925 m!1213697))

(declare-fun m!1213699 () Bool)

(assert (=> b!1325271 m!1213699))

(declare-fun m!1213701 () Bool)

(assert (=> b!1325272 m!1213701))

(assert (=> b!1324961 d!142925))

(declare-fun d!142927 () Bool)

(assert (=> d!142927 (= (apply!1022 lt!589391 lt!589399) (get!21745 (getValueByKey!715 (toList!10622 lt!589391) lt!589399)))))

(declare-fun bs!37880 () Bool)

(assert (= bs!37880 d!142927))

(declare-fun m!1213703 () Bool)

(assert (=> bs!37880 m!1213703))

(assert (=> bs!37880 m!1213703))

(declare-fun m!1213705 () Bool)

(assert (=> bs!37880 m!1213705))

(assert (=> b!1324961 d!142927))

(declare-fun d!142929 () Bool)

(assert (=> d!142929 (= (apply!1022 (+!4630 lt!589391 (tuple2!23557 lt!589404 minValue!1279)) lt!589399) (get!21745 (getValueByKey!715 (toList!10622 (+!4630 lt!589391 (tuple2!23557 lt!589404 minValue!1279))) lt!589399)))))

(declare-fun bs!37881 () Bool)

(assert (= bs!37881 d!142929))

(declare-fun m!1213707 () Bool)

(assert (=> bs!37881 m!1213707))

(assert (=> bs!37881 m!1213707))

(declare-fun m!1213709 () Bool)

(assert (=> bs!37881 m!1213709))

(assert (=> b!1324961 d!142929))

(declare-fun d!142931 () Bool)

(assert (=> d!142931 (= (apply!1022 (+!4630 lt!589392 (tuple2!23557 lt!589402 minValue!1279)) lt!589400) (apply!1022 lt!589392 lt!589400))))

(declare-fun lt!589578 () Unit!43443)

(assert (=> d!142931 (= lt!589578 (choose!1957 lt!589392 lt!589402 minValue!1279 lt!589400))))

(declare-fun e!755514 () Bool)

(assert (=> d!142931 e!755514))

(declare-fun res!879582 () Bool)

(assert (=> d!142931 (=> (not res!879582) (not e!755514))))

(assert (=> d!142931 (= res!879582 (contains!8704 lt!589392 lt!589400))))

(assert (=> d!142931 (= (addApplyDifferent!560 lt!589392 lt!589402 minValue!1279 lt!589400) lt!589578)))

(declare-fun b!1325273 () Bool)

(assert (=> b!1325273 (= e!755514 (not (= lt!589400 lt!589402)))))

(assert (= (and d!142931 res!879582) b!1325273))

(assert (=> d!142931 m!1213205))

(assert (=> d!142931 m!1213207))

(declare-fun m!1213711 () Bool)

(assert (=> d!142931 m!1213711))

(assert (=> d!142931 m!1213205))

(assert (=> d!142931 m!1213223))

(declare-fun m!1213713 () Bool)

(assert (=> d!142931 m!1213713))

(assert (=> b!1324961 d!142931))

(declare-fun d!142933 () Bool)

(declare-fun e!755515 () Bool)

(assert (=> d!142933 e!755515))

(declare-fun res!879584 () Bool)

(assert (=> d!142933 (=> (not res!879584) (not e!755515))))

(declare-fun lt!589580 () ListLongMap!21213)

(assert (=> d!142933 (= res!879584 (contains!8704 lt!589580 (_1!11789 (tuple2!23557 lt!589402 minValue!1279))))))

(declare-fun lt!589582 () List!30685)

(assert (=> d!142933 (= lt!589580 (ListLongMap!21214 lt!589582))))

(declare-fun lt!589581 () Unit!43443)

(declare-fun lt!589579 () Unit!43443)

(assert (=> d!142933 (= lt!589581 lt!589579)))

(assert (=> d!142933 (= (getValueByKey!715 lt!589582 (_1!11789 (tuple2!23557 lt!589402 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589402 minValue!1279))))))

(assert (=> d!142933 (= lt!589579 (lemmaContainsTupThenGetReturnValue!358 lt!589582 (_1!11789 (tuple2!23557 lt!589402 minValue!1279)) (_2!11789 (tuple2!23557 lt!589402 minValue!1279))))))

(assert (=> d!142933 (= lt!589582 (insertStrictlySorted!487 (toList!10622 lt!589392) (_1!11789 (tuple2!23557 lt!589402 minValue!1279)) (_2!11789 (tuple2!23557 lt!589402 minValue!1279))))))

(assert (=> d!142933 (= (+!4630 lt!589392 (tuple2!23557 lt!589402 minValue!1279)) lt!589580)))

(declare-fun b!1325274 () Bool)

(declare-fun res!879583 () Bool)

(assert (=> b!1325274 (=> (not res!879583) (not e!755515))))

(assert (=> b!1325274 (= res!879583 (= (getValueByKey!715 (toList!10622 lt!589580) (_1!11789 (tuple2!23557 lt!589402 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 lt!589402 minValue!1279)))))))

(declare-fun b!1325275 () Bool)

(assert (=> b!1325275 (= e!755515 (contains!8707 (toList!10622 lt!589580) (tuple2!23557 lt!589402 minValue!1279)))))

(assert (= (and d!142933 res!879584) b!1325274))

(assert (= (and b!1325274 res!879583) b!1325275))

(declare-fun m!1213715 () Bool)

(assert (=> d!142933 m!1213715))

(declare-fun m!1213717 () Bool)

(assert (=> d!142933 m!1213717))

(declare-fun m!1213719 () Bool)

(assert (=> d!142933 m!1213719))

(declare-fun m!1213721 () Bool)

(assert (=> d!142933 m!1213721))

(declare-fun m!1213723 () Bool)

(assert (=> b!1325274 m!1213723))

(declare-fun m!1213725 () Bool)

(assert (=> b!1325275 m!1213725))

(assert (=> b!1324961 d!142933))

(declare-fun b!1325279 () Bool)

(declare-fun e!755517 () Option!766)

(assert (=> b!1325279 (= e!755517 None!764)))

(declare-fun b!1325278 () Bool)

(assert (=> b!1325278 (= e!755517 (getValueByKey!715 (t!44605 (toList!10622 lt!589450)) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))

(declare-fun b!1325276 () Bool)

(declare-fun e!755516 () Option!766)

(assert (=> b!1325276 (= e!755516 (Some!765 (_2!11789 (h!31890 (toList!10622 lt!589450)))))))

(declare-fun b!1325277 () Bool)

(assert (=> b!1325277 (= e!755516 e!755517)))

(declare-fun c!125733 () Bool)

(assert (=> b!1325277 (= c!125733 (and ((_ is Cons!30681) (toList!10622 lt!589450)) (not (= (_1!11789 (h!31890 (toList!10622 lt!589450))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))))))

(declare-fun d!142935 () Bool)

(declare-fun c!125732 () Bool)

(assert (=> d!142935 (= c!125732 (and ((_ is Cons!30681) (toList!10622 lt!589450)) (= (_1!11789 (h!31890 (toList!10622 lt!589450))) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))))

(assert (=> d!142935 (= (getValueByKey!715 (toList!10622 lt!589450) (_1!11789 (tuple2!23557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))) e!755516)))

(assert (= (and d!142935 c!125732) b!1325276))

(assert (= (and d!142935 (not c!125732)) b!1325277))

(assert (= (and b!1325277 c!125733) b!1325278))

(assert (= (and b!1325277 (not c!125733)) b!1325279))

(declare-fun m!1213727 () Bool)

(assert (=> b!1325278 m!1213727))

(assert (=> b!1325032 d!142935))

(declare-fun d!142937 () Bool)

(assert (=> d!142937 (= (get!21744 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1324993 d!142937))

(declare-fun b!1325283 () Bool)

(declare-fun e!755519 () Option!766)

(assert (=> b!1325283 (= e!755519 None!764)))

(declare-fun b!1325282 () Bool)

(assert (=> b!1325282 (= e!755519 (getValueByKey!715 (t!44605 (toList!10622 lt!589446)) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun b!1325280 () Bool)

(declare-fun e!755518 () Option!766)

(assert (=> b!1325280 (= e!755518 (Some!765 (_2!11789 (h!31890 (toList!10622 lt!589446)))))))

(declare-fun b!1325281 () Bool)

(assert (=> b!1325281 (= e!755518 e!755519)))

(declare-fun c!125735 () Bool)

(assert (=> b!1325281 (= c!125735 (and ((_ is Cons!30681) (toList!10622 lt!589446)) (not (= (_1!11789 (h!31890 (toList!10622 lt!589446))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))))

(declare-fun d!142939 () Bool)

(declare-fun c!125734 () Bool)

(assert (=> d!142939 (= c!125734 (and ((_ is Cons!30681) (toList!10622 lt!589446)) (= (_1!11789 (h!31890 (toList!10622 lt!589446))) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(assert (=> d!142939 (= (getValueByKey!715 (toList!10622 lt!589446) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) e!755518)))

(assert (= (and d!142939 c!125734) b!1325280))

(assert (= (and d!142939 (not c!125734)) b!1325281))

(assert (= (and b!1325281 c!125735) b!1325282))

(assert (= (and b!1325281 (not c!125735)) b!1325283))

(declare-fun m!1213729 () Bool)

(assert (=> b!1325282 m!1213729))

(assert (=> b!1325030 d!142939))

(declare-fun d!142941 () Bool)

(declare-fun e!755520 () Bool)

(assert (=> d!142941 e!755520))

(declare-fun res!879586 () Bool)

(assert (=> d!142941 (=> (not res!879586) (not e!755520))))

(declare-fun lt!589584 () ListLongMap!21213)

(assert (=> d!142941 (= res!879586 (contains!8704 lt!589584 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(declare-fun lt!589586 () List!30685)

(assert (=> d!142941 (= lt!589584 (ListLongMap!21214 lt!589586))))

(declare-fun lt!589585 () Unit!43443)

(declare-fun lt!589583 () Unit!43443)

(assert (=> d!142941 (= lt!589585 lt!589583)))

(assert (=> d!142941 (= (getValueByKey!715 lt!589586 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142941 (= lt!589583 (lemmaContainsTupThenGetReturnValue!358 lt!589586 (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142941 (= lt!589586 (insertStrictlySorted!487 (toList!10622 call!64683) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))))))

(assert (=> d!142941 (= (+!4630 call!64683 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) lt!589584)))

(declare-fun b!1325284 () Bool)

(declare-fun res!879585 () Bool)

(assert (=> b!1325284 (=> (not res!879585) (not e!755520))))

(assert (=> b!1325284 (= res!879585 (= (getValueByKey!715 (toList!10622 lt!589584) (_1!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279))) (Some!765 (_2!11789 (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))))

(declare-fun b!1325285 () Bool)

(assert (=> b!1325285 (= e!755520 (contains!8707 (toList!10622 lt!589584) (tuple2!23557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)))))

(assert (= (and d!142941 res!879586) b!1325284))

(assert (= (and b!1325284 res!879585) b!1325285))

(declare-fun m!1213731 () Bool)

(assert (=> d!142941 m!1213731))

(declare-fun m!1213733 () Bool)

(assert (=> d!142941 m!1213733))

(declare-fun m!1213735 () Bool)

(assert (=> d!142941 m!1213735))

(declare-fun m!1213737 () Bool)

(assert (=> d!142941 m!1213737))

(declare-fun m!1213739 () Bool)

(assert (=> b!1325284 m!1213739))

(declare-fun m!1213741 () Bool)

(assert (=> b!1325285 m!1213741))

(assert (=> b!1324943 d!142941))

(declare-fun d!142943 () Bool)

(assert (=> d!142943 (= (get!21743 (select (arr!43174 _values!1337) from!2000) (dynLambda!3560 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!20842 (select (arr!43174 _values!1337) from!2000)))))

(assert (=> b!1324992 d!142943))

(declare-fun d!142945 () Bool)

(declare-fun e!755521 () Bool)

(assert (=> d!142945 e!755521))

(declare-fun res!879587 () Bool)

(assert (=> d!142945 (=> res!879587 e!755521)))

(declare-fun lt!589588 () Bool)

(assert (=> d!142945 (= res!879587 (not lt!589588))))

(declare-fun lt!589590 () Bool)

(assert (=> d!142945 (= lt!589588 lt!589590)))

(declare-fun lt!589587 () Unit!43443)

(declare-fun e!755522 () Unit!43443)

(assert (=> d!142945 (= lt!589587 e!755522)))

(declare-fun c!125736 () Bool)

(assert (=> d!142945 (= c!125736 lt!589590)))

(assert (=> d!142945 (= lt!589590 (containsKey!732 (toList!10622 lt!589407) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!142945 (= (contains!8704 lt!589407 #b1000000000000000000000000000000000000000000000000000000000000000) lt!589588)))

(declare-fun b!1325286 () Bool)

(declare-fun lt!589589 () Unit!43443)

(assert (=> b!1325286 (= e!755522 lt!589589)))

(assert (=> b!1325286 (= lt!589589 (lemmaContainsKeyImpliesGetValueByKeyDefined!479 (toList!10622 lt!589407) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1325286 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589407) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1325287 () Bool)

(declare-fun Unit!43458 () Unit!43443)

(assert (=> b!1325287 (= e!755522 Unit!43458)))

(declare-fun b!1325288 () Bool)

(assert (=> b!1325288 (= e!755521 (isDefined!522 (getValueByKey!715 (toList!10622 lt!589407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!142945 c!125736) b!1325286))

(assert (= (and d!142945 (not c!125736)) b!1325287))

(assert (= (and d!142945 (not res!879587)) b!1325288))

(declare-fun m!1213743 () Bool)

(assert (=> d!142945 m!1213743))

(declare-fun m!1213745 () Bool)

(assert (=> b!1325286 m!1213745))

(assert (=> b!1325286 m!1213563))

(assert (=> b!1325286 m!1213563))

(declare-fun m!1213747 () Bool)

(assert (=> b!1325286 m!1213747))

(assert (=> b!1325288 m!1213563))

(assert (=> b!1325288 m!1213563))

(assert (=> b!1325288 m!1213747))

(assert (=> bm!64684 d!142945))

(assert (=> d!142785 d!142787))

(declare-fun d!142947 () Bool)

(assert (=> d!142947 (= (apply!1022 lt!589407 #b0000000000000000000000000000000000000000000000000000000000000000) (get!21745 (getValueByKey!715 (toList!10622 lt!589407) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!37882 () Bool)

(assert (= bs!37882 d!142947))

(assert (=> bs!37882 m!1213507))

(assert (=> bs!37882 m!1213507))

(declare-fun m!1213749 () Bool)

(assert (=> bs!37882 m!1213749))

(assert (=> b!1324957 d!142947))

(assert (=> b!1324978 d!142867))

(declare-fun b!1325289 () Bool)

(declare-fun e!755523 () Bool)

(assert (=> b!1325289 (= e!755523 tp_is_empty!36277)))

(declare-fun mapNonEmpty!56073 () Bool)

(declare-fun mapRes!56073 () Bool)

(declare-fun tp!106864 () Bool)

(assert (=> mapNonEmpty!56073 (= mapRes!56073 (and tp!106864 e!755523))))

(declare-fun mapKey!56073 () (_ BitVec 32))

(declare-fun mapRest!56073 () (Array (_ BitVec 32) ValueCell!17240))

(declare-fun mapValue!56073 () ValueCell!17240)

(assert (=> mapNonEmpty!56073 (= mapRest!56072 (store mapRest!56073 mapKey!56073 mapValue!56073))))

(declare-fun condMapEmpty!56073 () Bool)

(declare-fun mapDefault!56073 () ValueCell!17240)

(assert (=> mapNonEmpty!56072 (= condMapEmpty!56073 (= mapRest!56072 ((as const (Array (_ BitVec 32) ValueCell!17240)) mapDefault!56073)))))

(declare-fun e!755524 () Bool)

(assert (=> mapNonEmpty!56072 (= tp!106863 (and e!755524 mapRes!56073))))

(declare-fun b!1325290 () Bool)

(assert (=> b!1325290 (= e!755524 tp_is_empty!36277)))

(declare-fun mapIsEmpty!56073 () Bool)

(assert (=> mapIsEmpty!56073 mapRes!56073))

(assert (= (and mapNonEmpty!56072 condMapEmpty!56073) mapIsEmpty!56073))

(assert (= (and mapNonEmpty!56072 (not condMapEmpty!56073)) mapNonEmpty!56073))

(assert (= (and mapNonEmpty!56073 ((_ is ValueCellFull!17240) mapValue!56073)) b!1325289))

(assert (= (and mapNonEmpty!56072 ((_ is ValueCellFull!17240) mapDefault!56073)) b!1325290))

(declare-fun m!1213751 () Bool)

(assert (=> mapNonEmpty!56073 m!1213751))

(declare-fun b_lambda!23723 () Bool)

(assert (= b_lambda!23719 (or (and start!111800 b_free!30457) b_lambda!23723)))

(declare-fun b_lambda!23725 () Bool)

(assert (= b_lambda!23715 (or (and start!111800 b_free!30457) b_lambda!23725)))

(declare-fun b_lambda!23727 () Bool)

(assert (= b_lambda!23721 (or (and start!111800 b_free!30457) b_lambda!23727)))

(declare-fun b_lambda!23729 () Bool)

(assert (= b_lambda!23717 (or (and start!111800 b_free!30457) b_lambda!23729)))

(check-sat (not b!1325166) (not bm!64702) (not b!1325123) (not b!1325258) (not b!1325247) (not b!1325126) (not b!1325127) (not b_lambda!23725) (not b!1325198) (not b!1325137) (not d!142883) (not b!1325246) (not b!1325104) (not bm!64707) (not d!142841) (not d!142859) (not b!1325124) (not b!1325272) (not b!1325117) (not b!1325271) (not b!1325146) (not d!142825) (not d!142921) (not b!1325233) (not d!142915) (not b_lambda!23727) (not d!142809) (not b!1325138) (not d!142913) (not b_lambda!23709) (not d!142889) (not d!142815) (not d!142855) (not b!1325223) (not b!1325055) (not b!1325173) (not d!142919) (not bm!64710) (not b!1325152) (not b!1325257) (not d!142869) (not d!142941) (not b!1325097) (not b!1325147) (not d!142833) (not b!1325168) (not b!1325160) (not d!142895) (not b!1325063) (not d!142947) (not b!1325057) (not bm!64703) (not d!142851) (not d!142837) (not d!142843) (not b!1325269) (not d!142899) (not b!1325267) (not d!142817) (not b!1325182) (not b_lambda!23711) (not d!142933) (not b!1325274) (not b!1325150) (not bm!64701) (not b!1325285) (not b!1325230) (not b!1325282) (not d!142925) (not d!142923) (not mapNonEmpty!56073) (not d!142861) (not b!1325191) (not b!1325142) (not b_lambda!23701) (not b!1325286) (not b!1325111) (not b!1325118) (not b_lambda!23729) (not d!142927) (not b!1325240) (not b!1325135) (not b!1325245) (not b!1325189) (not bm!64704) (not d!142903) (not d!142819) (not d!142905) (not b!1325170) (not b!1325252) (not b!1325154) (not b!1325159) (not d!142907) (not b!1325068) (not b!1325161) (not d!142887) (not d!142827) (not b!1325102) (not d!142871) (not b!1325171) (not d!142857) (not b!1325075) (not d!142911) (not b!1325265) (not b!1325275) (not b!1325144) (not b!1325231) (not b!1325284) (not b!1325278) (not b!1325062) (not b!1325133) (not b!1325181) (not b!1325225) (not b!1325176) (not b!1325059) (not d!142917) (not b!1325254) (not d!142877) (not d!142885) (not b!1325163) (not d!142849) (not b!1325139) (not b_next!30457) (not d!142807) (not b!1325259) (not b!1325222) (not b!1325288) (not b!1325179) (not d!142893) (not b!1325174) (not d!142931) (not b!1325255) (not d!142929) (not b!1325214) (not b!1325148) (not b!1325184) (not b!1325238) (not b!1325074) (not d!142865) (not b_lambda!23713) tp_is_empty!36277 (not b!1325121) b_and!49001 (not b!1325131) (not b!1325153) (not d!142879) (not b!1325270) (not b_lambda!23723) (not b!1325128) (not d!142823) (not d!142875) (not d!142831) (not d!142901) (not b!1325060) (not b!1325165) (not b!1325228) (not b!1325250) (not d!142813) (not b!1325044) (not d!142945) (not b!1325140) (not b!1325243) (not b!1325248) (not d!142909) (not b!1325065) (not bm!64711))
(check-sat b_and!49001 (not b_next!30457))
