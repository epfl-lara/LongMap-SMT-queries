; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34862 () Bool)

(assert start!34862)

(declare-fun b_free!7639 () Bool)

(declare-fun b_next!7639 () Bool)

(assert (=> start!34862 (= b_free!7639 (not b_next!7639))))

(declare-fun tp!26487 () Bool)

(declare-fun b_and!14877 () Bool)

(assert (=> start!34862 (= tp!26487 b_and!14877)))

(declare-fun b!349191 () Bool)

(declare-fun res!193553 () Bool)

(declare-fun e!213904 () Bool)

(assert (=> b!349191 (=> (not res!193553) (not e!213904))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!349191 (= res!193553 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12849 () Bool)

(declare-fun mapRes!12849 () Bool)

(assert (=> mapIsEmpty!12849 mapRes!12849))

(declare-fun b!349192 () Bool)

(declare-fun res!193549 () Bool)

(assert (=> b!349192 (=> (not res!193549) (not e!213904))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11099 0))(
  ( (V!11100 (val!3840 Int)) )
))
(declare-datatypes ((ValueCell!3452 0))(
  ( (ValueCellFull!3452 (v!6025 V!11099)) (EmptyCell!3452) )
))
(declare-datatypes ((array!18754 0))(
  ( (array!18755 (arr!8885 (Array (_ BitVec 32) ValueCell!3452)) (size!9237 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18754)

(declare-datatypes ((array!18756 0))(
  ( (array!18757 (arr!8886 (Array (_ BitVec 32) (_ BitVec 64))) (size!9238 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18756)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!349192 (= res!193549 (and (= (size!9237 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9238 _keys!1895) (size!9237 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!349193 () Bool)

(declare-fun e!213905 () Bool)

(declare-fun e!213907 () Bool)

(assert (=> b!349193 (= e!213905 e!213907)))

(declare-fun res!193554 () Bool)

(assert (=> b!349193 (=> (not res!193554) (not e!213907))))

(declare-fun lt!164115 () (_ BitVec 32))

(assert (=> b!349193 (= res!193554 (and (bvsge lt!164115 #b00000000000000000000000000000000) (bvslt lt!164115 (size!9238 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18756 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349193 (= lt!164115 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349194 () Bool)

(declare-fun e!213906 () Bool)

(declare-fun tp_is_empty!7591 () Bool)

(assert (=> b!349194 (= e!213906 tp_is_empty!7591)))

(declare-fun b!349195 () Bool)

(declare-fun res!193551 () Bool)

(assert (=> b!349195 (=> (not res!193551) (not e!213904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18756 (_ BitVec 32)) Bool)

(assert (=> b!349195 (= res!193551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349196 () Bool)

(assert (=> b!349196 (= e!213904 e!213905)))

(declare-fun res!193552 () Bool)

(assert (=> b!349196 (=> (not res!193552) (not e!213905))))

(declare-datatypes ((SeekEntryResult!3378 0))(
  ( (MissingZero!3378 (index!15691 (_ BitVec 32))) (Found!3378 (index!15692 (_ BitVec 32))) (Intermediate!3378 (undefined!4190 Bool) (index!15693 (_ BitVec 32)) (x!34737 (_ BitVec 32))) (Undefined!3378) (MissingVacant!3378 (index!15694 (_ BitVec 32))) )
))
(declare-fun lt!164116 () SeekEntryResult!3378)

(get-info :version)

(assert (=> b!349196 (= res!193552 (and (not ((_ is Found!3378) lt!164116)) ((_ is MissingZero!3378) lt!164116)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18756 (_ BitVec 32)) SeekEntryResult!3378)

(assert (=> b!349196 (= lt!164116 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!193550 () Bool)

(assert (=> start!34862 (=> (not res!193550) (not e!213904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34862 (= res!193550 (validMask!0 mask!2385))))

(assert (=> start!34862 e!213904))

(assert (=> start!34862 true))

(assert (=> start!34862 tp_is_empty!7591))

(assert (=> start!34862 tp!26487))

(declare-fun e!213901 () Bool)

(declare-fun array_inv!6564 (array!18754) Bool)

(assert (=> start!34862 (and (array_inv!6564 _values!1525) e!213901)))

(declare-fun array_inv!6565 (array!18756) Bool)

(assert (=> start!34862 (array_inv!6565 _keys!1895)))

(declare-fun mapNonEmpty!12849 () Bool)

(declare-fun tp!26486 () Bool)

(assert (=> mapNonEmpty!12849 (= mapRes!12849 (and tp!26486 e!213906))))

(declare-fun mapRest!12849 () (Array (_ BitVec 32) ValueCell!3452))

(declare-fun mapValue!12849 () ValueCell!3452)

(declare-fun mapKey!12849 () (_ BitVec 32))

(assert (=> mapNonEmpty!12849 (= (arr!8885 _values!1525) (store mapRest!12849 mapKey!12849 mapValue!12849))))

(declare-fun b!349197 () Bool)

(declare-fun res!193547 () Bool)

(assert (=> b!349197 (=> (not res!193547) (not e!213904))))

(declare-datatypes ((List!5069 0))(
  ( (Nil!5066) (Cons!5065 (h!5921 (_ BitVec 64)) (t!10193 List!5069)) )
))
(declare-fun arrayNoDuplicates!0 (array!18756 (_ BitVec 32) List!5069) Bool)

(assert (=> b!349197 (= res!193547 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5066))))

(declare-fun b!349198 () Bool)

(declare-fun e!213903 () Bool)

(assert (=> b!349198 (= e!213903 tp_is_empty!7591)))

(declare-fun b!349199 () Bool)

(declare-fun arrayContainsKey!0 (array!18756 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!349199 (= e!213907 (not (arrayContainsKey!0 _keys!1895 k0!1348 lt!164115)))))

(declare-fun b!349200 () Bool)

(declare-fun res!193555 () Bool)

(assert (=> b!349200 (=> (not res!193555) (not e!213905))))

(assert (=> b!349200 (= res!193555 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!349201 () Bool)

(declare-fun res!193548 () Bool)

(assert (=> b!349201 (=> (not res!193548) (not e!213904))))

(declare-fun zeroValue!1467 () V!11099)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11099)

(declare-datatypes ((tuple2!5462 0))(
  ( (tuple2!5463 (_1!2742 (_ BitVec 64)) (_2!2742 V!11099)) )
))
(declare-datatypes ((List!5070 0))(
  ( (Nil!5067) (Cons!5066 (h!5922 tuple2!5462) (t!10194 List!5070)) )
))
(declare-datatypes ((ListLongMap!4377 0))(
  ( (ListLongMap!4378 (toList!2204 List!5070)) )
))
(declare-fun contains!2289 (ListLongMap!4377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1732 (array!18756 array!18754 (_ BitVec 32) (_ BitVec 32) V!11099 V!11099 (_ BitVec 32) Int) ListLongMap!4377)

(assert (=> b!349201 (= res!193548 (not (contains!2289 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!349202 () Bool)

(assert (=> b!349202 (= e!213901 (and e!213903 mapRes!12849))))

(declare-fun condMapEmpty!12849 () Bool)

(declare-fun mapDefault!12849 () ValueCell!3452)

(assert (=> b!349202 (= condMapEmpty!12849 (= (arr!8885 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3452)) mapDefault!12849)))))

(assert (= (and start!34862 res!193550) b!349192))

(assert (= (and b!349192 res!193549) b!349195))

(assert (= (and b!349195 res!193551) b!349197))

(assert (= (and b!349197 res!193547) b!349191))

(assert (= (and b!349191 res!193553) b!349201))

(assert (= (and b!349201 res!193548) b!349196))

(assert (= (and b!349196 res!193552) b!349200))

(assert (= (and b!349200 res!193555) b!349193))

(assert (= (and b!349193 res!193554) b!349199))

(assert (= (and b!349202 condMapEmpty!12849) mapIsEmpty!12849))

(assert (= (and b!349202 (not condMapEmpty!12849)) mapNonEmpty!12849))

(assert (= (and mapNonEmpty!12849 ((_ is ValueCellFull!3452) mapValue!12849)) b!349194))

(assert (= (and b!349202 ((_ is ValueCellFull!3452) mapDefault!12849)) b!349198))

(assert (= start!34862 b!349202))

(declare-fun m!350017 () Bool)

(assert (=> b!349199 m!350017))

(declare-fun m!350019 () Bool)

(assert (=> b!349195 m!350019))

(declare-fun m!350021 () Bool)

(assert (=> start!34862 m!350021))

(declare-fun m!350023 () Bool)

(assert (=> start!34862 m!350023))

(declare-fun m!350025 () Bool)

(assert (=> start!34862 m!350025))

(declare-fun m!350027 () Bool)

(assert (=> b!349196 m!350027))

(declare-fun m!350029 () Bool)

(assert (=> b!349197 m!350029))

(declare-fun m!350031 () Bool)

(assert (=> b!349193 m!350031))

(declare-fun m!350033 () Bool)

(assert (=> b!349200 m!350033))

(declare-fun m!350035 () Bool)

(assert (=> mapNonEmpty!12849 m!350035))

(declare-fun m!350037 () Bool)

(assert (=> b!349191 m!350037))

(declare-fun m!350039 () Bool)

(assert (=> b!349201 m!350039))

(assert (=> b!349201 m!350039))

(declare-fun m!350041 () Bool)

(assert (=> b!349201 m!350041))

(check-sat (not mapNonEmpty!12849) (not b!349193) (not b!349199) (not b!349195) (not b!349196) (not start!34862) b_and!14877 (not b!349197) (not b!349200) (not b!349191) (not b!349201) (not b_next!7639) tp_is_empty!7591)
(check-sat b_and!14877 (not b_next!7639))
(get-model)

(declare-fun d!71371 () Bool)

(declare-fun e!213955 () Bool)

(assert (=> d!71371 e!213955))

(declare-fun res!193612 () Bool)

(assert (=> d!71371 (=> res!193612 e!213955)))

(declare-fun lt!164139 () Bool)

(assert (=> d!71371 (= res!193612 (not lt!164139))))

(declare-fun lt!164137 () Bool)

(assert (=> d!71371 (= lt!164139 lt!164137)))

(declare-datatypes ((Unit!10781 0))(
  ( (Unit!10782) )
))
(declare-fun lt!164140 () Unit!10781)

(declare-fun e!213954 () Unit!10781)

(assert (=> d!71371 (= lt!164140 e!213954)))

(declare-fun c!53225 () Bool)

(assert (=> d!71371 (= c!53225 lt!164137)))

(declare-fun containsKey!338 (List!5070 (_ BitVec 64)) Bool)

(assert (=> d!71371 (= lt!164137 (containsKey!338 (toList!2204 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71371 (= (contains!2289 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164139)))

(declare-fun b!349281 () Bool)

(declare-fun lt!164138 () Unit!10781)

(assert (=> b!349281 (= e!213954 lt!164138)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!286 (List!5070 (_ BitVec 64)) Unit!10781)

(assert (=> b!349281 (= lt!164138 (lemmaContainsKeyImpliesGetValueByKeyDefined!286 (toList!2204 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!353 0))(
  ( (Some!352 (v!6028 V!11099)) (None!351) )
))
(declare-fun isDefined!287 (Option!353) Bool)

(declare-fun getValueByKey!347 (List!5070 (_ BitVec 64)) Option!353)

(assert (=> b!349281 (isDefined!287 (getValueByKey!347 (toList!2204 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!349282 () Bool)

(declare-fun Unit!10783 () Unit!10781)

(assert (=> b!349282 (= e!213954 Unit!10783)))

(declare-fun b!349283 () Bool)

(assert (=> b!349283 (= e!213955 (isDefined!287 (getValueByKey!347 (toList!2204 (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71371 c!53225) b!349281))

(assert (= (and d!71371 (not c!53225)) b!349282))

(assert (= (and d!71371 (not res!193612)) b!349283))

(declare-fun m!350095 () Bool)

(assert (=> d!71371 m!350095))

(declare-fun m!350097 () Bool)

(assert (=> b!349281 m!350097))

(declare-fun m!350099 () Bool)

(assert (=> b!349281 m!350099))

(assert (=> b!349281 m!350099))

(declare-fun m!350101 () Bool)

(assert (=> b!349281 m!350101))

(assert (=> b!349283 m!350099))

(assert (=> b!349283 m!350099))

(assert (=> b!349283 m!350101))

(assert (=> b!349201 d!71371))

(declare-fun b!349326 () Bool)

(declare-fun e!213984 () Bool)

(declare-fun lt!164200 () ListLongMap!4377)

(declare-fun apply!288 (ListLongMap!4377 (_ BitVec 64)) V!11099)

(assert (=> b!349326 (= e!213984 (= (apply!288 lt!164200 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun call!26896 () ListLongMap!4377)

(declare-fun bm!26888 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!604 (array!18756 array!18754 (_ BitVec 32) (_ BitVec 32) V!11099 V!11099 (_ BitVec 32) Int) ListLongMap!4377)

(assert (=> bm!26888 (= call!26896 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun d!71373 () Bool)

(declare-fun e!213983 () Bool)

(assert (=> d!71373 e!213983))

(declare-fun res!193636 () Bool)

(assert (=> d!71373 (=> (not res!193636) (not e!213983))))

(assert (=> d!71373 (= res!193636 (or (bvsge #b00000000000000000000000000000000 (size!9238 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9238 _keys!1895)))))))

(declare-fun lt!164197 () ListLongMap!4377)

(assert (=> d!71373 (= lt!164200 lt!164197)))

(declare-fun lt!164206 () Unit!10781)

(declare-fun e!213986 () Unit!10781)

(assert (=> d!71373 (= lt!164206 e!213986)))

(declare-fun c!53241 () Bool)

(declare-fun e!213991 () Bool)

(assert (=> d!71373 (= c!53241 e!213991)))

(declare-fun res!193635 () Bool)

(assert (=> d!71373 (=> (not res!193635) (not e!213991))))

(assert (=> d!71373 (= res!193635 (bvslt #b00000000000000000000000000000000 (size!9238 _keys!1895)))))

(declare-fun e!213988 () ListLongMap!4377)

(assert (=> d!71373 (= lt!164197 e!213988)))

(declare-fun c!53239 () Bool)

(assert (=> d!71373 (= c!53239 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71373 (validMask!0 mask!2385)))

(assert (=> d!71373 (= (getCurrentListMap!1732 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164200)))

(declare-fun bm!26889 () Bool)

(declare-fun call!26893 () ListLongMap!4377)

(declare-fun call!26892 () ListLongMap!4377)

(assert (=> bm!26889 (= call!26893 call!26892)))

(declare-fun b!349327 () Bool)

(declare-fun e!213987 () Bool)

(assert (=> b!349327 (= e!213987 (= (apply!288 lt!164200 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!349328 () Bool)

(declare-fun Unit!10784 () Unit!10781)

(assert (=> b!349328 (= e!213986 Unit!10784)))

(declare-fun b!349329 () Bool)

(declare-fun e!213989 () ListLongMap!4377)

(assert (=> b!349329 (= e!213989 call!26893)))

(declare-fun b!349330 () Bool)

(declare-fun e!213993 () Bool)

(declare-fun call!26894 () Bool)

(assert (=> b!349330 (= e!213993 (not call!26894))))

(declare-fun b!349331 () Bool)

(declare-fun e!213985 () Bool)

(declare-fun call!26891 () Bool)

(assert (=> b!349331 (= e!213985 (not call!26891))))

(declare-fun b!349332 () Bool)

(assert (=> b!349332 (= e!213985 e!213987)))

(declare-fun res!193639 () Bool)

(assert (=> b!349332 (= res!193639 call!26891)))

(assert (=> b!349332 (=> (not res!193639) (not e!213987))))

(declare-fun b!349333 () Bool)

(declare-fun e!213982 () Bool)

(assert (=> b!349333 (= e!213982 (validKeyInArray!0 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349334 () Bool)

(declare-fun e!213990 () ListLongMap!4377)

(assert (=> b!349334 (= e!213988 e!213990)))

(declare-fun c!53238 () Bool)

(assert (=> b!349334 (= c!53238 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349335 () Bool)

(declare-fun c!53243 () Bool)

(assert (=> b!349335 (= c!53243 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!349335 (= e!213990 e!213989)))

(declare-fun b!349336 () Bool)

(declare-fun +!739 (ListLongMap!4377 tuple2!5462) ListLongMap!4377)

(assert (=> b!349336 (= e!213988 (+!739 call!26892 (tuple2!5463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!349337 () Bool)

(declare-fun call!26895 () ListLongMap!4377)

(assert (=> b!349337 (= e!213989 call!26895)))

(declare-fun bm!26890 () Bool)

(declare-fun call!26897 () ListLongMap!4377)

(assert (=> bm!26890 (= call!26895 call!26897)))

(declare-fun b!349338 () Bool)

(assert (=> b!349338 (= e!213991 (validKeyInArray!0 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349339 () Bool)

(assert (=> b!349339 (= e!213983 e!213985)))

(declare-fun c!53242 () Bool)

(assert (=> b!349339 (= c!53242 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!349340 () Bool)

(declare-fun lt!164192 () Unit!10781)

(assert (=> b!349340 (= e!213986 lt!164192)))

(declare-fun lt!164185 () ListLongMap!4377)

(assert (=> b!349340 (= lt!164185 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164199 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164199 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164190 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164190 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164205 () Unit!10781)

(declare-fun addStillContains!264 (ListLongMap!4377 (_ BitVec 64) V!11099 (_ BitVec 64)) Unit!10781)

(assert (=> b!349340 (= lt!164205 (addStillContains!264 lt!164185 lt!164199 zeroValue!1467 lt!164190))))

(assert (=> b!349340 (contains!2289 (+!739 lt!164185 (tuple2!5463 lt!164199 zeroValue!1467)) lt!164190)))

(declare-fun lt!164189 () Unit!10781)

(assert (=> b!349340 (= lt!164189 lt!164205)))

(declare-fun lt!164188 () ListLongMap!4377)

(assert (=> b!349340 (= lt!164188 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164193 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164193 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164202 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164202 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164186 () Unit!10781)

(declare-fun addApplyDifferent!264 (ListLongMap!4377 (_ BitVec 64) V!11099 (_ BitVec 64)) Unit!10781)

(assert (=> b!349340 (= lt!164186 (addApplyDifferent!264 lt!164188 lt!164193 minValue!1467 lt!164202))))

(assert (=> b!349340 (= (apply!288 (+!739 lt!164188 (tuple2!5463 lt!164193 minValue!1467)) lt!164202) (apply!288 lt!164188 lt!164202))))

(declare-fun lt!164195 () Unit!10781)

(assert (=> b!349340 (= lt!164195 lt!164186)))

(declare-fun lt!164196 () ListLongMap!4377)

(assert (=> b!349340 (= lt!164196 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164203 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164203 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164194 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164194 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164198 () Unit!10781)

(assert (=> b!349340 (= lt!164198 (addApplyDifferent!264 lt!164196 lt!164203 zeroValue!1467 lt!164194))))

(assert (=> b!349340 (= (apply!288 (+!739 lt!164196 (tuple2!5463 lt!164203 zeroValue!1467)) lt!164194) (apply!288 lt!164196 lt!164194))))

(declare-fun lt!164204 () Unit!10781)

(assert (=> b!349340 (= lt!164204 lt!164198)))

(declare-fun lt!164191 () ListLongMap!4377)

(assert (=> b!349340 (= lt!164191 (getCurrentListMapNoExtraKeys!604 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164187 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164187 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164201 () (_ BitVec 64))

(assert (=> b!349340 (= lt!164201 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!349340 (= lt!164192 (addApplyDifferent!264 lt!164191 lt!164187 minValue!1467 lt!164201))))

(assert (=> b!349340 (= (apply!288 (+!739 lt!164191 (tuple2!5463 lt!164187 minValue!1467)) lt!164201) (apply!288 lt!164191 lt!164201))))

(declare-fun b!349341 () Bool)

(declare-fun res!193633 () Bool)

(assert (=> b!349341 (=> (not res!193633) (not e!213983))))

(declare-fun e!213994 () Bool)

(assert (=> b!349341 (= res!193633 e!213994)))

(declare-fun res!193637 () Bool)

(assert (=> b!349341 (=> res!193637 e!213994)))

(assert (=> b!349341 (= res!193637 (not e!213982))))

(declare-fun res!193634 () Bool)

(assert (=> b!349341 (=> (not res!193634) (not e!213982))))

(assert (=> b!349341 (= res!193634 (bvslt #b00000000000000000000000000000000 (size!9238 _keys!1895)))))

(declare-fun bm!26891 () Bool)

(assert (=> bm!26891 (= call!26894 (contains!2289 lt!164200 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!349342 () Bool)

(declare-fun res!193632 () Bool)

(assert (=> b!349342 (=> (not res!193632) (not e!213983))))

(assert (=> b!349342 (= res!193632 e!213993)))

(declare-fun c!53240 () Bool)

(assert (=> b!349342 (= c!53240 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!349343 () Bool)

(declare-fun e!213992 () Bool)

(assert (=> b!349343 (= e!213994 e!213992)))

(declare-fun res!193631 () Bool)

(assert (=> b!349343 (=> (not res!193631) (not e!213992))))

(assert (=> b!349343 (= res!193631 (contains!2289 lt!164200 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!349343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9238 _keys!1895)))))

(declare-fun bm!26892 () Bool)

(assert (=> bm!26892 (= call!26897 call!26896)))

(declare-fun b!349344 () Bool)

(declare-fun get!4770 (ValueCell!3452 V!11099) V!11099)

(declare-fun dynLambda!631 (Int (_ BitVec 64)) V!11099)

(assert (=> b!349344 (= e!213992 (= (apply!288 lt!164200 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)) (get!4770 (select (arr!8885 _values!1525) #b00000000000000000000000000000000) (dynLambda!631 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9237 _values!1525)))))

(assert (=> b!349344 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9238 _keys!1895)))))

(declare-fun b!349345 () Bool)

(assert (=> b!349345 (= e!213993 e!213984)))

(declare-fun res!193638 () Bool)

(assert (=> b!349345 (= res!193638 call!26894)))

(assert (=> b!349345 (=> (not res!193638) (not e!213984))))

(declare-fun b!349346 () Bool)

(assert (=> b!349346 (= e!213990 call!26893)))

(declare-fun bm!26893 () Bool)

(assert (=> bm!26893 (= call!26892 (+!739 (ite c!53239 call!26896 (ite c!53238 call!26897 call!26895)) (ite (or c!53239 c!53238) (tuple2!5463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5463 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun bm!26894 () Bool)

(assert (=> bm!26894 (= call!26891 (contains!2289 lt!164200 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!71373 c!53239) b!349336))

(assert (= (and d!71373 (not c!53239)) b!349334))

(assert (= (and b!349334 c!53238) b!349346))

(assert (= (and b!349334 (not c!53238)) b!349335))

(assert (= (and b!349335 c!53243) b!349329))

(assert (= (and b!349335 (not c!53243)) b!349337))

(assert (= (or b!349329 b!349337) bm!26890))

(assert (= (or b!349346 bm!26890) bm!26892))

(assert (= (or b!349346 b!349329) bm!26889))

(assert (= (or b!349336 bm!26892) bm!26888))

(assert (= (or b!349336 bm!26889) bm!26893))

(assert (= (and d!71373 res!193635) b!349338))

(assert (= (and d!71373 c!53241) b!349340))

(assert (= (and d!71373 (not c!53241)) b!349328))

(assert (= (and d!71373 res!193636) b!349341))

(assert (= (and b!349341 res!193634) b!349333))

(assert (= (and b!349341 (not res!193637)) b!349343))

(assert (= (and b!349343 res!193631) b!349344))

(assert (= (and b!349341 res!193633) b!349342))

(assert (= (and b!349342 c!53240) b!349345))

(assert (= (and b!349342 (not c!53240)) b!349330))

(assert (= (and b!349345 res!193638) b!349326))

(assert (= (or b!349345 b!349330) bm!26891))

(assert (= (and b!349342 res!193632) b!349339))

(assert (= (and b!349339 c!53242) b!349332))

(assert (= (and b!349339 (not c!53242)) b!349331))

(assert (= (and b!349332 res!193639) b!349327))

(assert (= (or b!349332 b!349331) bm!26894))

(declare-fun b_lambda!8513 () Bool)

(assert (=> (not b_lambda!8513) (not b!349344)))

(declare-fun t!10199 () Bool)

(declare-fun tb!3083 () Bool)

(assert (=> (and start!34862 (= defaultEntry!1528 defaultEntry!1528) t!10199) tb!3083))

(declare-fun result!5595 () Bool)

(assert (=> tb!3083 (= result!5595 tp_is_empty!7591)))

(assert (=> b!349344 t!10199))

(declare-fun b_and!14883 () Bool)

(assert (= b_and!14877 (and (=> t!10199 result!5595) b_and!14883)))

(declare-fun m!350103 () Bool)

(assert (=> bm!26894 m!350103))

(declare-fun m!350105 () Bool)

(assert (=> b!349333 m!350105))

(assert (=> b!349333 m!350105))

(declare-fun m!350107 () Bool)

(assert (=> b!349333 m!350107))

(declare-fun m!350109 () Bool)

(assert (=> b!349327 m!350109))

(declare-fun m!350111 () Bool)

(assert (=> bm!26888 m!350111))

(assert (=> d!71373 m!350021))

(declare-fun m!350113 () Bool)

(assert (=> b!349336 m!350113))

(declare-fun m!350115 () Bool)

(assert (=> bm!26893 m!350115))

(declare-fun m!350117 () Bool)

(assert (=> b!349340 m!350117))

(assert (=> b!349340 m!350105))

(declare-fun m!350119 () Bool)

(assert (=> b!349340 m!350119))

(declare-fun m!350121 () Bool)

(assert (=> b!349340 m!350121))

(declare-fun m!350123 () Bool)

(assert (=> b!349340 m!350123))

(declare-fun m!350125 () Bool)

(assert (=> b!349340 m!350125))

(declare-fun m!350127 () Bool)

(assert (=> b!349340 m!350127))

(declare-fun m!350129 () Bool)

(assert (=> b!349340 m!350129))

(declare-fun m!350131 () Bool)

(assert (=> b!349340 m!350131))

(declare-fun m!350133 () Bool)

(assert (=> b!349340 m!350133))

(declare-fun m!350135 () Bool)

(assert (=> b!349340 m!350135))

(assert (=> b!349340 m!350129))

(declare-fun m!350137 () Bool)

(assert (=> b!349340 m!350137))

(assert (=> b!349340 m!350135))

(declare-fun m!350139 () Bool)

(assert (=> b!349340 m!350139))

(declare-fun m!350141 () Bool)

(assert (=> b!349340 m!350141))

(declare-fun m!350143 () Bool)

(assert (=> b!349340 m!350143))

(assert (=> b!349340 m!350125))

(assert (=> b!349340 m!350111))

(assert (=> b!349340 m!350143))

(declare-fun m!350145 () Bool)

(assert (=> b!349340 m!350145))

(declare-fun m!350147 () Bool)

(assert (=> b!349326 m!350147))

(assert (=> b!349338 m!350105))

(assert (=> b!349338 m!350105))

(assert (=> b!349338 m!350107))

(assert (=> b!349344 m!350105))

(declare-fun m!350149 () Bool)

(assert (=> b!349344 m!350149))

(declare-fun m!350151 () Bool)

(assert (=> b!349344 m!350151))

(declare-fun m!350153 () Bool)

(assert (=> b!349344 m!350153))

(assert (=> b!349344 m!350149))

(assert (=> b!349344 m!350151))

(assert (=> b!349344 m!350105))

(declare-fun m!350155 () Bool)

(assert (=> b!349344 m!350155))

(declare-fun m!350157 () Bool)

(assert (=> bm!26891 m!350157))

(assert (=> b!349343 m!350105))

(assert (=> b!349343 m!350105))

(declare-fun m!350159 () Bool)

(assert (=> b!349343 m!350159))

(assert (=> b!349201 d!71373))

(declare-fun b!349361 () Bool)

(declare-fun e!214003 () SeekEntryResult!3378)

(declare-fun e!214001 () SeekEntryResult!3378)

(assert (=> b!349361 (= e!214003 e!214001)))

(declare-fun lt!164213 () (_ BitVec 64))

(declare-fun lt!164214 () SeekEntryResult!3378)

(assert (=> b!349361 (= lt!164213 (select (arr!8886 _keys!1895) (index!15693 lt!164214)))))

(declare-fun c!53252 () Bool)

(assert (=> b!349361 (= c!53252 (= lt!164213 k0!1348))))

(declare-fun b!349362 () Bool)

(declare-fun c!53251 () Bool)

(assert (=> b!349362 (= c!53251 (= lt!164213 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!214002 () SeekEntryResult!3378)

(assert (=> b!349362 (= e!214001 e!214002)))

(declare-fun b!349363 () Bool)

(assert (=> b!349363 (= e!214001 (Found!3378 (index!15693 lt!164214)))))

(declare-fun b!349364 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18756 (_ BitVec 32)) SeekEntryResult!3378)

(assert (=> b!349364 (= e!214002 (seekKeyOrZeroReturnVacant!0 (x!34737 lt!164214) (index!15693 lt!164214) (index!15693 lt!164214) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!349365 () Bool)

(assert (=> b!349365 (= e!214003 Undefined!3378)))

(declare-fun b!349366 () Bool)

(assert (=> b!349366 (= e!214002 (MissingZero!3378 (index!15693 lt!164214)))))

(declare-fun d!71375 () Bool)

(declare-fun lt!164215 () SeekEntryResult!3378)

(assert (=> d!71375 (and (or ((_ is Undefined!3378) lt!164215) (not ((_ is Found!3378) lt!164215)) (and (bvsge (index!15692 lt!164215) #b00000000000000000000000000000000) (bvslt (index!15692 lt!164215) (size!9238 _keys!1895)))) (or ((_ is Undefined!3378) lt!164215) ((_ is Found!3378) lt!164215) (not ((_ is MissingZero!3378) lt!164215)) (and (bvsge (index!15691 lt!164215) #b00000000000000000000000000000000) (bvslt (index!15691 lt!164215) (size!9238 _keys!1895)))) (or ((_ is Undefined!3378) lt!164215) ((_ is Found!3378) lt!164215) ((_ is MissingZero!3378) lt!164215) (not ((_ is MissingVacant!3378) lt!164215)) (and (bvsge (index!15694 lt!164215) #b00000000000000000000000000000000) (bvslt (index!15694 lt!164215) (size!9238 _keys!1895)))) (or ((_ is Undefined!3378) lt!164215) (ite ((_ is Found!3378) lt!164215) (= (select (arr!8886 _keys!1895) (index!15692 lt!164215)) k0!1348) (ite ((_ is MissingZero!3378) lt!164215) (= (select (arr!8886 _keys!1895) (index!15691 lt!164215)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3378) lt!164215) (= (select (arr!8886 _keys!1895) (index!15694 lt!164215)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71375 (= lt!164215 e!214003)))

(declare-fun c!53250 () Bool)

(assert (=> d!71375 (= c!53250 (and ((_ is Intermediate!3378) lt!164214) (undefined!4190 lt!164214)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18756 (_ BitVec 32)) SeekEntryResult!3378)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71375 (= lt!164214 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71375 (validMask!0 mask!2385)))

(assert (=> d!71375 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164215)))

(assert (= (and d!71375 c!53250) b!349365))

(assert (= (and d!71375 (not c!53250)) b!349361))

(assert (= (and b!349361 c!53252) b!349363))

(assert (= (and b!349361 (not c!53252)) b!349362))

(assert (= (and b!349362 c!53251) b!349366))

(assert (= (and b!349362 (not c!53251)) b!349364))

(declare-fun m!350161 () Bool)

(assert (=> b!349361 m!350161))

(declare-fun m!350163 () Bool)

(assert (=> b!349364 m!350163))

(declare-fun m!350165 () Bool)

(assert (=> d!71375 m!350165))

(declare-fun m!350167 () Bool)

(assert (=> d!71375 m!350167))

(declare-fun m!350169 () Bool)

(assert (=> d!71375 m!350169))

(assert (=> d!71375 m!350021))

(declare-fun m!350171 () Bool)

(assert (=> d!71375 m!350171))

(assert (=> d!71375 m!350165))

(declare-fun m!350173 () Bool)

(assert (=> d!71375 m!350173))

(assert (=> b!349196 d!71375))

(declare-fun d!71377 () Bool)

(declare-fun lt!164218 () (_ BitVec 32))

(assert (=> d!71377 (and (or (bvslt lt!164218 #b00000000000000000000000000000000) (bvsge lt!164218 (size!9238 _keys!1895)) (and (bvsge lt!164218 #b00000000000000000000000000000000) (bvslt lt!164218 (size!9238 _keys!1895)))) (bvsge lt!164218 #b00000000000000000000000000000000) (bvslt lt!164218 (size!9238 _keys!1895)) (= (select (arr!8886 _keys!1895) lt!164218) k0!1348))))

(declare-fun e!214006 () (_ BitVec 32))

(assert (=> d!71377 (= lt!164218 e!214006)))

(declare-fun c!53255 () Bool)

(assert (=> d!71377 (= c!53255 (= (select (arr!8886 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71377 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9238 _keys!1895)) (bvslt (size!9238 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71377 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164218)))

(declare-fun b!349371 () Bool)

(assert (=> b!349371 (= e!214006 #b00000000000000000000000000000000)))

(declare-fun b!349372 () Bool)

(assert (=> b!349372 (= e!214006 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71377 c!53255) b!349371))

(assert (= (and d!71377 (not c!53255)) b!349372))

(declare-fun m!350175 () Bool)

(assert (=> d!71377 m!350175))

(assert (=> d!71377 m!350105))

(declare-fun m!350177 () Bool)

(assert (=> b!349372 m!350177))

(assert (=> b!349193 d!71377))

(declare-fun d!71379 () Bool)

(assert (=> d!71379 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34862 d!71379))

(declare-fun d!71381 () Bool)

(assert (=> d!71381 (= (array_inv!6564 _values!1525) (bvsge (size!9237 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34862 d!71381))

(declare-fun d!71383 () Bool)

(assert (=> d!71383 (= (array_inv!6565 _keys!1895) (bvsge (size!9238 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34862 d!71383))

(declare-fun b!349383 () Bool)

(declare-fun e!214016 () Bool)

(declare-fun contains!2292 (List!5069 (_ BitVec 64)) Bool)

(assert (=> b!349383 (= e!214016 (contains!2292 Nil!5066 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349384 () Bool)

(declare-fun e!214017 () Bool)

(declare-fun call!26900 () Bool)

(assert (=> b!349384 (= e!214017 call!26900)))

(declare-fun bm!26897 () Bool)

(declare-fun c!53258 () Bool)

(assert (=> bm!26897 (= call!26900 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53258 (Cons!5065 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000) Nil!5066) Nil!5066)))))

(declare-fun b!349385 () Bool)

(assert (=> b!349385 (= e!214017 call!26900)))

(declare-fun d!71385 () Bool)

(declare-fun res!193647 () Bool)

(declare-fun e!214015 () Bool)

(assert (=> d!71385 (=> res!193647 e!214015)))

(assert (=> d!71385 (= res!193647 (bvsge #b00000000000000000000000000000000 (size!9238 _keys!1895)))))

(assert (=> d!71385 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5066) e!214015)))

(declare-fun b!349386 () Bool)

(declare-fun e!214018 () Bool)

(assert (=> b!349386 (= e!214018 e!214017)))

(assert (=> b!349386 (= c!53258 (validKeyInArray!0 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!349387 () Bool)

(assert (=> b!349387 (= e!214015 e!214018)))

(declare-fun res!193648 () Bool)

(assert (=> b!349387 (=> (not res!193648) (not e!214018))))

(assert (=> b!349387 (= res!193648 (not e!214016))))

(declare-fun res!193646 () Bool)

(assert (=> b!349387 (=> (not res!193646) (not e!214016))))

(assert (=> b!349387 (= res!193646 (validKeyInArray!0 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71385 (not res!193647)) b!349387))

(assert (= (and b!349387 res!193646) b!349383))

(assert (= (and b!349387 res!193648) b!349386))

(assert (= (and b!349386 c!53258) b!349385))

(assert (= (and b!349386 (not c!53258)) b!349384))

(assert (= (or b!349385 b!349384) bm!26897))

(assert (=> b!349383 m!350105))

(assert (=> b!349383 m!350105))

(declare-fun m!350179 () Bool)

(assert (=> b!349383 m!350179))

(assert (=> bm!26897 m!350105))

(declare-fun m!350181 () Bool)

(assert (=> bm!26897 m!350181))

(assert (=> b!349386 m!350105))

(assert (=> b!349386 m!350105))

(assert (=> b!349386 m!350107))

(assert (=> b!349387 m!350105))

(assert (=> b!349387 m!350105))

(assert (=> b!349387 m!350107))

(assert (=> b!349197 d!71385))

(declare-fun d!71387 () Bool)

(declare-fun res!193653 () Bool)

(declare-fun e!214023 () Bool)

(assert (=> d!71387 (=> res!193653 e!214023)))

(assert (=> d!71387 (= res!193653 (= (select (arr!8886 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71387 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214023)))

(declare-fun b!349392 () Bool)

(declare-fun e!214024 () Bool)

(assert (=> b!349392 (= e!214023 e!214024)))

(declare-fun res!193654 () Bool)

(assert (=> b!349392 (=> (not res!193654) (not e!214024))))

(assert (=> b!349392 (= res!193654 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9238 _keys!1895)))))

(declare-fun b!349393 () Bool)

(assert (=> b!349393 (= e!214024 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71387 (not res!193653)) b!349392))

(assert (= (and b!349392 res!193654) b!349393))

(assert (=> d!71387 m!350105))

(declare-fun m!350183 () Bool)

(assert (=> b!349393 m!350183))

(assert (=> b!349200 d!71387))

(declare-fun d!71389 () Bool)

(assert (=> d!71389 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!349191 d!71389))

(declare-fun d!71391 () Bool)

(declare-fun res!193660 () Bool)

(declare-fun e!214031 () Bool)

(assert (=> d!71391 (=> res!193660 e!214031)))

(assert (=> d!71391 (= res!193660 (bvsge #b00000000000000000000000000000000 (size!9238 _keys!1895)))))

(assert (=> d!71391 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214031)))

(declare-fun b!349402 () Bool)

(declare-fun e!214032 () Bool)

(assert (=> b!349402 (= e!214031 e!214032)))

(declare-fun c!53261 () Bool)

(assert (=> b!349402 (= c!53261 (validKeyInArray!0 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26900 () Bool)

(declare-fun call!26903 () Bool)

(assert (=> bm!26900 (= call!26903 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!349403 () Bool)

(declare-fun e!214033 () Bool)

(assert (=> b!349403 (= e!214032 e!214033)))

(declare-fun lt!164226 () (_ BitVec 64))

(assert (=> b!349403 (= lt!164226 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164225 () Unit!10781)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18756 (_ BitVec 64) (_ BitVec 32)) Unit!10781)

(assert (=> b!349403 (= lt!164225 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164226 #b00000000000000000000000000000000))))

(assert (=> b!349403 (arrayContainsKey!0 _keys!1895 lt!164226 #b00000000000000000000000000000000)))

(declare-fun lt!164227 () Unit!10781)

(assert (=> b!349403 (= lt!164227 lt!164225)))

(declare-fun res!193659 () Bool)

(assert (=> b!349403 (= res!193659 (= (seekEntryOrOpen!0 (select (arr!8886 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3378 #b00000000000000000000000000000000)))))

(assert (=> b!349403 (=> (not res!193659) (not e!214033))))

(declare-fun b!349404 () Bool)

(assert (=> b!349404 (= e!214032 call!26903)))

(declare-fun b!349405 () Bool)

(assert (=> b!349405 (= e!214033 call!26903)))

(assert (= (and d!71391 (not res!193660)) b!349402))

(assert (= (and b!349402 c!53261) b!349403))

(assert (= (and b!349402 (not c!53261)) b!349404))

(assert (= (and b!349403 res!193659) b!349405))

(assert (= (or b!349405 b!349404) bm!26900))

(assert (=> b!349402 m!350105))

(assert (=> b!349402 m!350105))

(assert (=> b!349402 m!350107))

(declare-fun m!350185 () Bool)

(assert (=> bm!26900 m!350185))

(assert (=> b!349403 m!350105))

(declare-fun m!350187 () Bool)

(assert (=> b!349403 m!350187))

(declare-fun m!350189 () Bool)

(assert (=> b!349403 m!350189))

(assert (=> b!349403 m!350105))

(declare-fun m!350191 () Bool)

(assert (=> b!349403 m!350191))

(assert (=> b!349195 d!71391))

(declare-fun d!71393 () Bool)

(declare-fun res!193661 () Bool)

(declare-fun e!214034 () Bool)

(assert (=> d!71393 (=> res!193661 e!214034)))

(assert (=> d!71393 (= res!193661 (= (select (arr!8886 _keys!1895) lt!164115) k0!1348))))

(assert (=> d!71393 (= (arrayContainsKey!0 _keys!1895 k0!1348 lt!164115) e!214034)))

(declare-fun b!349406 () Bool)

(declare-fun e!214035 () Bool)

(assert (=> b!349406 (= e!214034 e!214035)))

(declare-fun res!193662 () Bool)

(assert (=> b!349406 (=> (not res!193662) (not e!214035))))

(assert (=> b!349406 (= res!193662 (bvslt (bvadd lt!164115 #b00000000000000000000000000000001) (size!9238 _keys!1895)))))

(declare-fun b!349407 () Bool)

(assert (=> b!349407 (= e!214035 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd lt!164115 #b00000000000000000000000000000001)))))

(assert (= (and d!71393 (not res!193661)) b!349406))

(assert (= (and b!349406 res!193662) b!349407))

(declare-fun m!350193 () Bool)

(assert (=> d!71393 m!350193))

(declare-fun m!350195 () Bool)

(assert (=> b!349407 m!350195))

(assert (=> b!349199 d!71393))

(declare-fun condMapEmpty!12858 () Bool)

(declare-fun mapDefault!12858 () ValueCell!3452)

(assert (=> mapNonEmpty!12849 (= condMapEmpty!12858 (= mapRest!12849 ((as const (Array (_ BitVec 32) ValueCell!3452)) mapDefault!12858)))))

(declare-fun e!214040 () Bool)

(declare-fun mapRes!12858 () Bool)

(assert (=> mapNonEmpty!12849 (= tp!26486 (and e!214040 mapRes!12858))))

(declare-fun mapNonEmpty!12858 () Bool)

(declare-fun tp!26502 () Bool)

(declare-fun e!214041 () Bool)

(assert (=> mapNonEmpty!12858 (= mapRes!12858 (and tp!26502 e!214041))))

(declare-fun mapValue!12858 () ValueCell!3452)

(declare-fun mapRest!12858 () (Array (_ BitVec 32) ValueCell!3452))

(declare-fun mapKey!12858 () (_ BitVec 32))

(assert (=> mapNonEmpty!12858 (= mapRest!12849 (store mapRest!12858 mapKey!12858 mapValue!12858))))

(declare-fun b!349415 () Bool)

(assert (=> b!349415 (= e!214040 tp_is_empty!7591)))

(declare-fun b!349414 () Bool)

(assert (=> b!349414 (= e!214041 tp_is_empty!7591)))

(declare-fun mapIsEmpty!12858 () Bool)

(assert (=> mapIsEmpty!12858 mapRes!12858))

(assert (= (and mapNonEmpty!12849 condMapEmpty!12858) mapIsEmpty!12858))

(assert (= (and mapNonEmpty!12849 (not condMapEmpty!12858)) mapNonEmpty!12858))

(assert (= (and mapNonEmpty!12858 ((_ is ValueCellFull!3452) mapValue!12858)) b!349414))

(assert (= (and mapNonEmpty!12849 ((_ is ValueCellFull!3452) mapDefault!12858)) b!349415))

(declare-fun m!350197 () Bool)

(assert (=> mapNonEmpty!12858 m!350197))

(declare-fun b_lambda!8515 () Bool)

(assert (= b_lambda!8513 (or (and start!34862 b_free!7639) b_lambda!8515)))

(check-sat (not d!71375) (not bm!26897) (not b!349326) (not mapNonEmpty!12858) (not bm!26891) (not b!349387) (not b!349403) (not b_next!7639) (not b!349393) (not b!349402) b_and!14883 (not b!349333) (not b!349327) (not bm!26894) (not d!71371) (not b!349386) (not b!349343) (not b!349372) (not b!349281) (not bm!26888) (not b!349340) (not b!349338) (not b!349344) (not bm!26893) (not b!349407) (not d!71373) (not b!349383) (not bm!26900) (not b!349283) (not b!349336) (not b!349364) tp_is_empty!7591 (not b_lambda!8515))
(check-sat b_and!14883 (not b_next!7639))
