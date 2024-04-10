; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38004 () Bool)

(assert start!38004)

(declare-fun b_free!8973 () Bool)

(declare-fun b_next!8973 () Bool)

(assert (=> start!38004 (= b_free!8973 (not b_next!8973))))

(declare-fun tp!31689 () Bool)

(declare-fun b_and!16287 () Bool)

(assert (=> start!38004 (= tp!31689 b_and!16287)))

(declare-fun mapIsEmpty!16050 () Bool)

(declare-fun mapRes!16050 () Bool)

(assert (=> mapIsEmpty!16050 mapRes!16050))

(declare-fun b!391093 () Bool)

(declare-fun e!236889 () Bool)

(declare-fun tp_is_empty!9645 () Bool)

(assert (=> b!391093 (= e!236889 tp_is_empty!9645)))

(declare-fun b!391094 () Bool)

(declare-fun e!236882 () Bool)

(assert (=> b!391094 (= e!236882 (and e!236889 mapRes!16050))))

(declare-fun condMapEmpty!16050 () Bool)

(declare-datatypes ((V!13965 0))(
  ( (V!13966 (val!4867 Int)) )
))
(declare-datatypes ((ValueCell!4479 0))(
  ( (ValueCellFull!4479 (v!7088 V!13965)) (EmptyCell!4479) )
))
(declare-datatypes ((array!23191 0))(
  ( (array!23192 (arr!11058 (Array (_ BitVec 32) ValueCell!4479)) (size!11410 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23191)

(declare-fun mapDefault!16050 () ValueCell!4479)

(assert (=> b!391094 (= condMapEmpty!16050 (= (arr!11058 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4479)) mapDefault!16050)))))

(declare-fun mapNonEmpty!16050 () Bool)

(declare-fun tp!31688 () Bool)

(declare-fun e!236887 () Bool)

(assert (=> mapNonEmpty!16050 (= mapRes!16050 (and tp!31688 e!236887))))

(declare-fun mapValue!16050 () ValueCell!4479)

(declare-fun mapRest!16050 () (Array (_ BitVec 32) ValueCell!4479))

(declare-fun mapKey!16050 () (_ BitVec 32))

(assert (=> mapNonEmpty!16050 (= (arr!11058 _values!506) (store mapRest!16050 mapKey!16050 mapValue!16050))))

(declare-datatypes ((tuple2!6554 0))(
  ( (tuple2!6555 (_1!3288 (_ BitVec 64)) (_2!3288 V!13965)) )
))
(declare-datatypes ((List!6409 0))(
  ( (Nil!6406) (Cons!6405 (h!7261 tuple2!6554) (t!11571 List!6409)) )
))
(declare-datatypes ((ListLongMap!5467 0))(
  ( (ListLongMap!5468 (toList!2749 List!6409)) )
))
(declare-fun lt!184456 () ListLongMap!5467)

(declare-fun lt!184451 () ListLongMap!5467)

(declare-fun e!236886 () Bool)

(declare-fun lt!184459 () tuple2!6554)

(declare-fun b!391095 () Bool)

(declare-fun +!1044 (ListLongMap!5467 tuple2!6554) ListLongMap!5467)

(assert (=> b!391095 (= e!236886 (= lt!184456 (+!1044 lt!184451 lt!184459)))))

(declare-fun b!391096 () Bool)

(declare-fun res!223847 () Bool)

(declare-fun e!236884 () Bool)

(assert (=> b!391096 (=> (not res!223847) (not e!236884))))

(declare-datatypes ((array!23193 0))(
  ( (array!23194 (arr!11059 (Array (_ BitVec 32) (_ BitVec 64))) (size!11411 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23193)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391096 (= res!223847 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391097 () Bool)

(declare-fun res!223851 () Bool)

(assert (=> b!391097 (=> (not res!223851) (not e!236884))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391097 (= res!223851 (or (= (select (arr!11059 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11059 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391098 () Bool)

(declare-fun e!236883 () Bool)

(assert (=> b!391098 (= e!236883 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391098 e!236886))

(declare-fun res!223845 () Bool)

(assert (=> b!391098 (=> (not res!223845) (not e!236886))))

(declare-fun lt!184453 () ListLongMap!5467)

(assert (=> b!391098 (= res!223845 (= lt!184456 (+!1044 lt!184453 lt!184459)))))

(declare-fun zeroValue!472 () V!13965)

(assert (=> b!391098 (= lt!184459 (tuple2!6555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391100 () Bool)

(declare-fun res!223848 () Bool)

(assert (=> b!391100 (=> (not res!223848) (not e!236886))))

(declare-fun lt!184457 () ListLongMap!5467)

(declare-fun lt!184452 () ListLongMap!5467)

(assert (=> b!391100 (= res!223848 (= lt!184457 (+!1044 lt!184452 lt!184459)))))

(declare-fun b!391101 () Bool)

(declare-fun res!223852 () Bool)

(assert (=> b!391101 (=> (not res!223852) (not e!236884))))

(declare-datatypes ((List!6410 0))(
  ( (Nil!6407) (Cons!6406 (h!7262 (_ BitVec 64)) (t!11572 List!6410)) )
))
(declare-fun arrayNoDuplicates!0 (array!23193 (_ BitVec 32) List!6410) Bool)

(assert (=> b!391101 (= res!223852 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6407))))

(declare-fun b!391102 () Bool)

(assert (=> b!391102 (= e!236887 tp_is_empty!9645)))

(declare-fun b!391103 () Bool)

(declare-fun e!236885 () Bool)

(assert (=> b!391103 (= e!236885 (not e!236883))))

(declare-fun res!223843 () Bool)

(assert (=> b!391103 (=> res!223843 e!236883)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391103 (= res!223843 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13965)

(declare-fun getCurrentListMap!2094 (array!23193 array!23191 (_ BitVec 32) (_ BitVec 32) V!13965 V!13965 (_ BitVec 32) Int) ListLongMap!5467)

(assert (=> b!391103 (= lt!184457 (getCurrentListMap!2094 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184455 () array!23193)

(declare-fun lt!184458 () array!23191)

(assert (=> b!391103 (= lt!184456 (getCurrentListMap!2094 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391103 (and (= lt!184453 lt!184451) (= lt!184451 lt!184453))))

(declare-fun v!373 () V!13965)

(assert (=> b!391103 (= lt!184451 (+!1044 lt!184452 (tuple2!6555 k0!778 v!373)))))

(declare-datatypes ((Unit!11970 0))(
  ( (Unit!11971) )
))
(declare-fun lt!184454 () Unit!11970)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!258 (array!23193 array!23191 (_ BitVec 32) (_ BitVec 32) V!13965 V!13965 (_ BitVec 32) (_ BitVec 64) V!13965 (_ BitVec 32) Int) Unit!11970)

(assert (=> b!391103 (= lt!184454 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!258 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!974 (array!23193 array!23191 (_ BitVec 32) (_ BitVec 32) V!13965 V!13965 (_ BitVec 32) Int) ListLongMap!5467)

(assert (=> b!391103 (= lt!184453 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391103 (= lt!184458 (array!23192 (store (arr!11058 _values!506) i!548 (ValueCellFull!4479 v!373)) (size!11410 _values!506)))))

(assert (=> b!391103 (= lt!184452 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!223850 () Bool)

(assert (=> start!38004 (=> (not res!223850) (not e!236884))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38004 (= res!223850 (validMask!0 mask!970))))

(assert (=> start!38004 e!236884))

(declare-fun array_inv!8122 (array!23191) Bool)

(assert (=> start!38004 (and (array_inv!8122 _values!506) e!236882)))

(assert (=> start!38004 tp!31689))

(assert (=> start!38004 true))

(assert (=> start!38004 tp_is_empty!9645))

(declare-fun array_inv!8123 (array!23193) Bool)

(assert (=> start!38004 (array_inv!8123 _keys!658)))

(declare-fun b!391099 () Bool)

(declare-fun res!223841 () Bool)

(assert (=> b!391099 (=> (not res!223841) (not e!236884))))

(assert (=> b!391099 (= res!223841 (and (= (size!11410 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11411 _keys!658) (size!11410 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391104 () Bool)

(declare-fun res!223842 () Bool)

(assert (=> b!391104 (=> (not res!223842) (not e!236884))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391104 (= res!223842 (validKeyInArray!0 k0!778))))

(declare-fun b!391105 () Bool)

(declare-fun res!223849 () Bool)

(assert (=> b!391105 (=> (not res!223849) (not e!236885))))

(assert (=> b!391105 (= res!223849 (arrayNoDuplicates!0 lt!184455 #b00000000000000000000000000000000 Nil!6407))))

(declare-fun b!391106 () Bool)

(declare-fun res!223844 () Bool)

(assert (=> b!391106 (=> (not res!223844) (not e!236884))))

(assert (=> b!391106 (= res!223844 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11411 _keys!658))))))

(declare-fun b!391107 () Bool)

(declare-fun res!223846 () Bool)

(assert (=> b!391107 (=> (not res!223846) (not e!236884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23193 (_ BitVec 32)) Bool)

(assert (=> b!391107 (= res!223846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391108 () Bool)

(assert (=> b!391108 (= e!236884 e!236885)))

(declare-fun res!223840 () Bool)

(assert (=> b!391108 (=> (not res!223840) (not e!236885))))

(assert (=> b!391108 (= res!223840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184455 mask!970))))

(assert (=> b!391108 (= lt!184455 (array!23194 (store (arr!11059 _keys!658) i!548 k0!778) (size!11411 _keys!658)))))

(assert (= (and start!38004 res!223850) b!391099))

(assert (= (and b!391099 res!223841) b!391107))

(assert (= (and b!391107 res!223846) b!391101))

(assert (= (and b!391101 res!223852) b!391106))

(assert (= (and b!391106 res!223844) b!391104))

(assert (= (and b!391104 res!223842) b!391097))

(assert (= (and b!391097 res!223851) b!391096))

(assert (= (and b!391096 res!223847) b!391108))

(assert (= (and b!391108 res!223840) b!391105))

(assert (= (and b!391105 res!223849) b!391103))

(assert (= (and b!391103 (not res!223843)) b!391098))

(assert (= (and b!391098 res!223845) b!391100))

(assert (= (and b!391100 res!223848) b!391095))

(assert (= (and b!391094 condMapEmpty!16050) mapIsEmpty!16050))

(assert (= (and b!391094 (not condMapEmpty!16050)) mapNonEmpty!16050))

(get-info :version)

(assert (= (and mapNonEmpty!16050 ((_ is ValueCellFull!4479) mapValue!16050)) b!391102))

(assert (= (and b!391094 ((_ is ValueCellFull!4479) mapDefault!16050)) b!391093))

(assert (= start!38004 b!391094))

(declare-fun m!387435 () Bool)

(assert (=> mapNonEmpty!16050 m!387435))

(declare-fun m!387437 () Bool)

(assert (=> b!391108 m!387437))

(declare-fun m!387439 () Bool)

(assert (=> b!391108 m!387439))

(declare-fun m!387441 () Bool)

(assert (=> b!391104 m!387441))

(declare-fun m!387443 () Bool)

(assert (=> b!391097 m!387443))

(declare-fun m!387445 () Bool)

(assert (=> b!391096 m!387445))

(declare-fun m!387447 () Bool)

(assert (=> b!391100 m!387447))

(declare-fun m!387449 () Bool)

(assert (=> b!391098 m!387449))

(declare-fun m!387451 () Bool)

(assert (=> b!391095 m!387451))

(declare-fun m!387453 () Bool)

(assert (=> start!38004 m!387453))

(declare-fun m!387455 () Bool)

(assert (=> start!38004 m!387455))

(declare-fun m!387457 () Bool)

(assert (=> start!38004 m!387457))

(declare-fun m!387459 () Bool)

(assert (=> b!391107 m!387459))

(declare-fun m!387461 () Bool)

(assert (=> b!391105 m!387461))

(declare-fun m!387463 () Bool)

(assert (=> b!391101 m!387463))

(declare-fun m!387465 () Bool)

(assert (=> b!391103 m!387465))

(declare-fun m!387467 () Bool)

(assert (=> b!391103 m!387467))

(declare-fun m!387469 () Bool)

(assert (=> b!391103 m!387469))

(declare-fun m!387471 () Bool)

(assert (=> b!391103 m!387471))

(declare-fun m!387473 () Bool)

(assert (=> b!391103 m!387473))

(declare-fun m!387475 () Bool)

(assert (=> b!391103 m!387475))

(declare-fun m!387477 () Bool)

(assert (=> b!391103 m!387477))

(check-sat (not b!391108) (not b!391101) b_and!16287 (not b!391107) (not mapNonEmpty!16050) (not b!391104) (not b!391098) (not b!391103) (not b!391096) tp_is_empty!9645 (not b!391095) (not b_next!8973) (not b!391100) (not b!391105) (not start!38004))
(check-sat b_and!16287 (not b_next!8973))
(get-model)

(declare-fun b!391167 () Bool)

(declare-fun e!236924 () Bool)

(declare-fun call!27587 () Bool)

(assert (=> b!391167 (= e!236924 call!27587)))

(declare-fun b!391168 () Bool)

(declare-fun e!236923 () Bool)

(declare-fun e!236922 () Bool)

(assert (=> b!391168 (= e!236923 e!236922)))

(declare-fun res!223899 () Bool)

(assert (=> b!391168 (=> (not res!223899) (not e!236922))))

(declare-fun e!236925 () Bool)

(assert (=> b!391168 (= res!223899 (not e!236925))))

(declare-fun res!223898 () Bool)

(assert (=> b!391168 (=> (not res!223898) (not e!236925))))

(assert (=> b!391168 (= res!223898 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391170 () Bool)

(declare-fun contains!2458 (List!6410 (_ BitVec 64)) Bool)

(assert (=> b!391170 (= e!236925 (contains!2458 Nil!6407 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391171 () Bool)

(assert (=> b!391171 (= e!236922 e!236924)))

(declare-fun c!54233 () Bool)

(assert (=> b!391171 (= c!54233 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27584 () Bool)

(assert (=> bm!27584 (= call!27587 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54233 (Cons!6406 (select (arr!11059 _keys!658) #b00000000000000000000000000000000) Nil!6407) Nil!6407)))))

(declare-fun b!391169 () Bool)

(assert (=> b!391169 (= e!236924 call!27587)))

(declare-fun d!73047 () Bool)

(declare-fun res!223900 () Bool)

(assert (=> d!73047 (=> res!223900 e!236923)))

(assert (=> d!73047 (= res!223900 (bvsge #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(assert (=> d!73047 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6407) e!236923)))

(assert (= (and d!73047 (not res!223900)) b!391168))

(assert (= (and b!391168 res!223898) b!391170))

(assert (= (and b!391168 res!223899) b!391171))

(assert (= (and b!391171 c!54233) b!391167))

(assert (= (and b!391171 (not c!54233)) b!391169))

(assert (= (or b!391167 b!391169) bm!27584))

(declare-fun m!387523 () Bool)

(assert (=> b!391168 m!387523))

(assert (=> b!391168 m!387523))

(declare-fun m!387525 () Bool)

(assert (=> b!391168 m!387525))

(assert (=> b!391170 m!387523))

(assert (=> b!391170 m!387523))

(declare-fun m!387527 () Bool)

(assert (=> b!391170 m!387527))

(assert (=> b!391171 m!387523))

(assert (=> b!391171 m!387523))

(assert (=> b!391171 m!387525))

(assert (=> bm!27584 m!387523))

(declare-fun m!387529 () Bool)

(assert (=> bm!27584 m!387529))

(assert (=> b!391101 d!73047))

(declare-fun d!73049 () Bool)

(declare-fun e!236928 () Bool)

(assert (=> d!73049 e!236928))

(declare-fun res!223905 () Bool)

(assert (=> d!73049 (=> (not res!223905) (not e!236928))))

(declare-fun lt!184496 () ListLongMap!5467)

(declare-fun contains!2459 (ListLongMap!5467 (_ BitVec 64)) Bool)

(assert (=> d!73049 (= res!223905 (contains!2459 lt!184496 (_1!3288 lt!184459)))))

(declare-fun lt!184497 () List!6409)

(assert (=> d!73049 (= lt!184496 (ListLongMap!5468 lt!184497))))

(declare-fun lt!184498 () Unit!11970)

(declare-fun lt!184495 () Unit!11970)

(assert (=> d!73049 (= lt!184498 lt!184495)))

(declare-datatypes ((Option!367 0))(
  ( (Some!366 (v!7093 V!13965)) (None!365) )
))
(declare-fun getValueByKey!361 (List!6409 (_ BitVec 64)) Option!367)

(assert (=> d!73049 (= (getValueByKey!361 lt!184497 (_1!3288 lt!184459)) (Some!366 (_2!3288 lt!184459)))))

(declare-fun lemmaContainsTupThenGetReturnValue!183 (List!6409 (_ BitVec 64) V!13965) Unit!11970)

(assert (=> d!73049 (= lt!184495 (lemmaContainsTupThenGetReturnValue!183 lt!184497 (_1!3288 lt!184459) (_2!3288 lt!184459)))))

(declare-fun insertStrictlySorted!186 (List!6409 (_ BitVec 64) V!13965) List!6409)

(assert (=> d!73049 (= lt!184497 (insertStrictlySorted!186 (toList!2749 lt!184452) (_1!3288 lt!184459) (_2!3288 lt!184459)))))

(assert (=> d!73049 (= (+!1044 lt!184452 lt!184459) lt!184496)))

(declare-fun b!391176 () Bool)

(declare-fun res!223906 () Bool)

(assert (=> b!391176 (=> (not res!223906) (not e!236928))))

(assert (=> b!391176 (= res!223906 (= (getValueByKey!361 (toList!2749 lt!184496) (_1!3288 lt!184459)) (Some!366 (_2!3288 lt!184459))))))

(declare-fun b!391177 () Bool)

(declare-fun contains!2460 (List!6409 tuple2!6554) Bool)

(assert (=> b!391177 (= e!236928 (contains!2460 (toList!2749 lt!184496) lt!184459))))

(assert (= (and d!73049 res!223905) b!391176))

(assert (= (and b!391176 res!223906) b!391177))

(declare-fun m!387531 () Bool)

(assert (=> d!73049 m!387531))

(declare-fun m!387533 () Bool)

(assert (=> d!73049 m!387533))

(declare-fun m!387535 () Bool)

(assert (=> d!73049 m!387535))

(declare-fun m!387537 () Bool)

(assert (=> d!73049 m!387537))

(declare-fun m!387539 () Bool)

(assert (=> b!391176 m!387539))

(declare-fun m!387541 () Bool)

(assert (=> b!391177 m!387541))

(assert (=> b!391100 d!73049))

(declare-fun d!73051 () Bool)

(declare-fun e!236929 () Bool)

(assert (=> d!73051 e!236929))

(declare-fun res!223907 () Bool)

(assert (=> d!73051 (=> (not res!223907) (not e!236929))))

(declare-fun lt!184500 () ListLongMap!5467)

(assert (=> d!73051 (= res!223907 (contains!2459 lt!184500 (_1!3288 lt!184459)))))

(declare-fun lt!184501 () List!6409)

(assert (=> d!73051 (= lt!184500 (ListLongMap!5468 lt!184501))))

(declare-fun lt!184502 () Unit!11970)

(declare-fun lt!184499 () Unit!11970)

(assert (=> d!73051 (= lt!184502 lt!184499)))

(assert (=> d!73051 (= (getValueByKey!361 lt!184501 (_1!3288 lt!184459)) (Some!366 (_2!3288 lt!184459)))))

(assert (=> d!73051 (= lt!184499 (lemmaContainsTupThenGetReturnValue!183 lt!184501 (_1!3288 lt!184459) (_2!3288 lt!184459)))))

(assert (=> d!73051 (= lt!184501 (insertStrictlySorted!186 (toList!2749 lt!184453) (_1!3288 lt!184459) (_2!3288 lt!184459)))))

(assert (=> d!73051 (= (+!1044 lt!184453 lt!184459) lt!184500)))

(declare-fun b!391178 () Bool)

(declare-fun res!223908 () Bool)

(assert (=> b!391178 (=> (not res!223908) (not e!236929))))

(assert (=> b!391178 (= res!223908 (= (getValueByKey!361 (toList!2749 lt!184500) (_1!3288 lt!184459)) (Some!366 (_2!3288 lt!184459))))))

(declare-fun b!391179 () Bool)

(assert (=> b!391179 (= e!236929 (contains!2460 (toList!2749 lt!184500) lt!184459))))

(assert (= (and d!73051 res!223907) b!391178))

(assert (= (and b!391178 res!223908) b!391179))

(declare-fun m!387543 () Bool)

(assert (=> d!73051 m!387543))

(declare-fun m!387545 () Bool)

(assert (=> d!73051 m!387545))

(declare-fun m!387547 () Bool)

(assert (=> d!73051 m!387547))

(declare-fun m!387549 () Bool)

(assert (=> d!73051 m!387549))

(declare-fun m!387551 () Bool)

(assert (=> b!391178 m!387551))

(declare-fun m!387553 () Bool)

(assert (=> b!391179 m!387553))

(assert (=> b!391098 d!73051))

(declare-fun d!73053 () Bool)

(assert (=> d!73053 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38004 d!73053))

(declare-fun d!73055 () Bool)

(assert (=> d!73055 (= (array_inv!8122 _values!506) (bvsge (size!11410 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38004 d!73055))

(declare-fun d!73057 () Bool)

(assert (=> d!73057 (= (array_inv!8123 _keys!658) (bvsge (size!11411 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38004 d!73057))

(declare-fun b!391189 () Bool)

(declare-fun e!236938 () Bool)

(declare-fun e!236937 () Bool)

(assert (=> b!391189 (= e!236938 e!236937)))

(declare-fun lt!184509 () (_ BitVec 64))

(assert (=> b!391189 (= lt!184509 (select (arr!11059 lt!184455) #b00000000000000000000000000000000))))

(declare-fun lt!184510 () Unit!11970)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23193 (_ BitVec 64) (_ BitVec 32)) Unit!11970)

(assert (=> b!391189 (= lt!184510 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!184455 lt!184509 #b00000000000000000000000000000000))))

(assert (=> b!391189 (arrayContainsKey!0 lt!184455 lt!184509 #b00000000000000000000000000000000)))

(declare-fun lt!184511 () Unit!11970)

(assert (=> b!391189 (= lt!184511 lt!184510)))

(declare-fun res!223913 () Bool)

(declare-datatypes ((SeekEntryResult!3514 0))(
  ( (MissingZero!3514 (index!16235 (_ BitVec 32))) (Found!3514 (index!16236 (_ BitVec 32))) (Intermediate!3514 (undefined!4326 Bool) (index!16237 (_ BitVec 32)) (x!38341 (_ BitVec 32))) (Undefined!3514) (MissingVacant!3514 (index!16238 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23193 (_ BitVec 32)) SeekEntryResult!3514)

(assert (=> b!391189 (= res!223913 (= (seekEntryOrOpen!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000) lt!184455 mask!970) (Found!3514 #b00000000000000000000000000000000)))))

(assert (=> b!391189 (=> (not res!223913) (not e!236937))))

(declare-fun bm!27587 () Bool)

(declare-fun call!27590 () Bool)

(assert (=> bm!27587 (= call!27590 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!184455 mask!970))))

(declare-fun b!391190 () Bool)

(assert (=> b!391190 (= e!236938 call!27590)))

(declare-fun b!391191 () Bool)

(assert (=> b!391191 (= e!236937 call!27590)))

(declare-fun d!73059 () Bool)

(declare-fun res!223914 () Bool)

(declare-fun e!236936 () Bool)

(assert (=> d!73059 (=> res!223914 e!236936)))

(assert (=> d!73059 (= res!223914 (bvsge #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(assert (=> d!73059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184455 mask!970) e!236936)))

(declare-fun b!391188 () Bool)

(assert (=> b!391188 (= e!236936 e!236938)))

(declare-fun c!54236 () Bool)

(assert (=> b!391188 (= c!54236 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(assert (= (and d!73059 (not res!223914)) b!391188))

(assert (= (and b!391188 c!54236) b!391189))

(assert (= (and b!391188 (not c!54236)) b!391190))

(assert (= (and b!391189 res!223913) b!391191))

(assert (= (or b!391191 b!391190) bm!27587))

(declare-fun m!387555 () Bool)

(assert (=> b!391189 m!387555))

(declare-fun m!387557 () Bool)

(assert (=> b!391189 m!387557))

(declare-fun m!387559 () Bool)

(assert (=> b!391189 m!387559))

(assert (=> b!391189 m!387555))

(declare-fun m!387561 () Bool)

(assert (=> b!391189 m!387561))

(declare-fun m!387563 () Bool)

(assert (=> bm!27587 m!387563))

(assert (=> b!391188 m!387555))

(assert (=> b!391188 m!387555))

(declare-fun m!387565 () Bool)

(assert (=> b!391188 m!387565))

(assert (=> b!391108 d!73059))

(declare-fun b!391193 () Bool)

(declare-fun e!236941 () Bool)

(declare-fun e!236940 () Bool)

(assert (=> b!391193 (= e!236941 e!236940)))

(declare-fun lt!184512 () (_ BitVec 64))

(assert (=> b!391193 (= lt!184512 (select (arr!11059 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184513 () Unit!11970)

(assert (=> b!391193 (= lt!184513 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184512 #b00000000000000000000000000000000))))

(assert (=> b!391193 (arrayContainsKey!0 _keys!658 lt!184512 #b00000000000000000000000000000000)))

(declare-fun lt!184514 () Unit!11970)

(assert (=> b!391193 (= lt!184514 lt!184513)))

(declare-fun res!223915 () Bool)

(assert (=> b!391193 (= res!223915 (= (seekEntryOrOpen!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3514 #b00000000000000000000000000000000)))))

(assert (=> b!391193 (=> (not res!223915) (not e!236940))))

(declare-fun bm!27588 () Bool)

(declare-fun call!27591 () Bool)

(assert (=> bm!27588 (= call!27591 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!391194 () Bool)

(assert (=> b!391194 (= e!236941 call!27591)))

(declare-fun b!391195 () Bool)

(assert (=> b!391195 (= e!236940 call!27591)))

(declare-fun d!73061 () Bool)

(declare-fun res!223916 () Bool)

(declare-fun e!236939 () Bool)

(assert (=> d!73061 (=> res!223916 e!236939)))

(assert (=> d!73061 (= res!223916 (bvsge #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(assert (=> d!73061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236939)))

(declare-fun b!391192 () Bool)

(assert (=> b!391192 (= e!236939 e!236941)))

(declare-fun c!54237 () Bool)

(assert (=> b!391192 (= c!54237 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73061 (not res!223916)) b!391192))

(assert (= (and b!391192 c!54237) b!391193))

(assert (= (and b!391192 (not c!54237)) b!391194))

(assert (= (and b!391193 res!223915) b!391195))

(assert (= (or b!391195 b!391194) bm!27588))

(assert (=> b!391193 m!387523))

(declare-fun m!387567 () Bool)

(assert (=> b!391193 m!387567))

(declare-fun m!387569 () Bool)

(assert (=> b!391193 m!387569))

(assert (=> b!391193 m!387523))

(declare-fun m!387571 () Bool)

(assert (=> b!391193 m!387571))

(declare-fun m!387573 () Bool)

(assert (=> bm!27588 m!387573))

(assert (=> b!391192 m!387523))

(assert (=> b!391192 m!387523))

(assert (=> b!391192 m!387525))

(assert (=> b!391107 d!73061))

(declare-fun d!73063 () Bool)

(declare-fun res!223921 () Bool)

(declare-fun e!236946 () Bool)

(assert (=> d!73063 (=> res!223921 e!236946)))

(assert (=> d!73063 (= res!223921 (= (select (arr!11059 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73063 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236946)))

(declare-fun b!391200 () Bool)

(declare-fun e!236947 () Bool)

(assert (=> b!391200 (= e!236946 e!236947)))

(declare-fun res!223922 () Bool)

(assert (=> b!391200 (=> (not res!223922) (not e!236947))))

(assert (=> b!391200 (= res!223922 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11411 _keys!658)))))

(declare-fun b!391201 () Bool)

(assert (=> b!391201 (= e!236947 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73063 (not res!223921)) b!391200))

(assert (= (and b!391200 res!223922) b!391201))

(assert (=> d!73063 m!387523))

(declare-fun m!387575 () Bool)

(assert (=> b!391201 m!387575))

(assert (=> b!391096 d!73063))

(declare-fun d!73065 () Bool)

(declare-fun e!236948 () Bool)

(assert (=> d!73065 e!236948))

(declare-fun res!223923 () Bool)

(assert (=> d!73065 (=> (not res!223923) (not e!236948))))

(declare-fun lt!184516 () ListLongMap!5467)

(assert (=> d!73065 (= res!223923 (contains!2459 lt!184516 (_1!3288 lt!184459)))))

(declare-fun lt!184517 () List!6409)

(assert (=> d!73065 (= lt!184516 (ListLongMap!5468 lt!184517))))

(declare-fun lt!184518 () Unit!11970)

(declare-fun lt!184515 () Unit!11970)

(assert (=> d!73065 (= lt!184518 lt!184515)))

(assert (=> d!73065 (= (getValueByKey!361 lt!184517 (_1!3288 lt!184459)) (Some!366 (_2!3288 lt!184459)))))

(assert (=> d!73065 (= lt!184515 (lemmaContainsTupThenGetReturnValue!183 lt!184517 (_1!3288 lt!184459) (_2!3288 lt!184459)))))

(assert (=> d!73065 (= lt!184517 (insertStrictlySorted!186 (toList!2749 lt!184451) (_1!3288 lt!184459) (_2!3288 lt!184459)))))

(assert (=> d!73065 (= (+!1044 lt!184451 lt!184459) lt!184516)))

(declare-fun b!391202 () Bool)

(declare-fun res!223924 () Bool)

(assert (=> b!391202 (=> (not res!223924) (not e!236948))))

(assert (=> b!391202 (= res!223924 (= (getValueByKey!361 (toList!2749 lt!184516) (_1!3288 lt!184459)) (Some!366 (_2!3288 lt!184459))))))

(declare-fun b!391203 () Bool)

(assert (=> b!391203 (= e!236948 (contains!2460 (toList!2749 lt!184516) lt!184459))))

(assert (= (and d!73065 res!223923) b!391202))

(assert (= (and b!391202 res!223924) b!391203))

(declare-fun m!387577 () Bool)

(assert (=> d!73065 m!387577))

(declare-fun m!387579 () Bool)

(assert (=> d!73065 m!387579))

(declare-fun m!387581 () Bool)

(assert (=> d!73065 m!387581))

(declare-fun m!387583 () Bool)

(assert (=> d!73065 m!387583))

(declare-fun m!387585 () Bool)

(assert (=> b!391202 m!387585))

(declare-fun m!387587 () Bool)

(assert (=> b!391203 m!387587))

(assert (=> b!391095 d!73065))

(declare-fun b!391204 () Bool)

(declare-fun e!236951 () Bool)

(declare-fun call!27592 () Bool)

(assert (=> b!391204 (= e!236951 call!27592)))

(declare-fun b!391205 () Bool)

(declare-fun e!236950 () Bool)

(declare-fun e!236949 () Bool)

(assert (=> b!391205 (= e!236950 e!236949)))

(declare-fun res!223926 () Bool)

(assert (=> b!391205 (=> (not res!223926) (not e!236949))))

(declare-fun e!236952 () Bool)

(assert (=> b!391205 (= res!223926 (not e!236952))))

(declare-fun res!223925 () Bool)

(assert (=> b!391205 (=> (not res!223925) (not e!236952))))

(assert (=> b!391205 (= res!223925 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(declare-fun b!391207 () Bool)

(assert (=> b!391207 (= e!236952 (contains!2458 Nil!6407 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(declare-fun b!391208 () Bool)

(assert (=> b!391208 (= e!236949 e!236951)))

(declare-fun c!54238 () Bool)

(assert (=> b!391208 (= c!54238 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(declare-fun bm!27589 () Bool)

(assert (=> bm!27589 (= call!27592 (arrayNoDuplicates!0 lt!184455 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54238 (Cons!6406 (select (arr!11059 lt!184455) #b00000000000000000000000000000000) Nil!6407) Nil!6407)))))

(declare-fun b!391206 () Bool)

(assert (=> b!391206 (= e!236951 call!27592)))

(declare-fun d!73067 () Bool)

(declare-fun res!223927 () Bool)

(assert (=> d!73067 (=> res!223927 e!236950)))

(assert (=> d!73067 (= res!223927 (bvsge #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(assert (=> d!73067 (= (arrayNoDuplicates!0 lt!184455 #b00000000000000000000000000000000 Nil!6407) e!236950)))

(assert (= (and d!73067 (not res!223927)) b!391205))

(assert (= (and b!391205 res!223925) b!391207))

(assert (= (and b!391205 res!223926) b!391208))

(assert (= (and b!391208 c!54238) b!391204))

(assert (= (and b!391208 (not c!54238)) b!391206))

(assert (= (or b!391204 b!391206) bm!27589))

(assert (=> b!391205 m!387555))

(assert (=> b!391205 m!387555))

(assert (=> b!391205 m!387565))

(assert (=> b!391207 m!387555))

(assert (=> b!391207 m!387555))

(declare-fun m!387589 () Bool)

(assert (=> b!391207 m!387589))

(assert (=> b!391208 m!387555))

(assert (=> b!391208 m!387555))

(assert (=> b!391208 m!387565))

(assert (=> bm!27589 m!387555))

(declare-fun m!387591 () Bool)

(assert (=> bm!27589 m!387591))

(assert (=> b!391105 d!73067))

(declare-fun d!73069 () Bool)

(assert (=> d!73069 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391104 d!73069))

(declare-fun lt!184537 () ListLongMap!5467)

(declare-fun e!236972 () Bool)

(declare-fun b!391233 () Bool)

(assert (=> b!391233 (= e!236972 (= lt!184537 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391234 () Bool)

(declare-fun e!236971 () ListLongMap!5467)

(assert (=> b!391234 (= e!236971 (ListLongMap!5468 Nil!6406))))

(declare-fun bm!27592 () Bool)

(declare-fun call!27595 () ListLongMap!5467)

(assert (=> bm!27592 (= call!27595 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391235 () Bool)

(declare-fun e!236969 () Bool)

(declare-fun e!236970 () Bool)

(assert (=> b!391235 (= e!236969 e!236970)))

(assert (=> b!391235 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(declare-fun res!223936 () Bool)

(assert (=> b!391235 (= res!223936 (contains!2459 lt!184537 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391235 (=> (not res!223936) (not e!236970))))

(declare-fun b!391236 () Bool)

(declare-fun e!236973 () Bool)

(assert (=> b!391236 (= e!236973 e!236969)))

(declare-fun c!54250 () Bool)

(declare-fun e!236967 () Bool)

(assert (=> b!391236 (= c!54250 e!236967)))

(declare-fun res!223939 () Bool)

(assert (=> b!391236 (=> (not res!223939) (not e!236967))))

(assert (=> b!391236 (= res!223939 (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(declare-fun b!391237 () Bool)

(assert (=> b!391237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(assert (=> b!391237 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11410 _values!506)))))

(declare-fun apply!303 (ListLongMap!5467 (_ BitVec 64)) V!13965)

(declare-fun get!5591 (ValueCell!4479 V!13965) V!13965)

(declare-fun dynLambda!646 (Int (_ BitVec 64)) V!13965)

(assert (=> b!391237 (= e!236970 (= (apply!303 lt!184537 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)) (get!5591 (select (arr!11058 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!73071 () Bool)

(assert (=> d!73071 e!236973))

(declare-fun res!223937 () Bool)

(assert (=> d!73071 (=> (not res!223937) (not e!236973))))

(assert (=> d!73071 (= res!223937 (not (contains!2459 lt!184537 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73071 (= lt!184537 e!236971)))

(declare-fun c!54247 () Bool)

(assert (=> d!73071 (= c!54247 (bvsge #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(assert (=> d!73071 (validMask!0 mask!970)))

(assert (=> d!73071 (= (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184537)))

(declare-fun b!391238 () Bool)

(declare-fun e!236968 () ListLongMap!5467)

(assert (=> b!391238 (= e!236968 call!27595)))

(declare-fun b!391239 () Bool)

(declare-fun lt!184538 () Unit!11970)

(declare-fun lt!184533 () Unit!11970)

(assert (=> b!391239 (= lt!184538 lt!184533)))

(declare-fun lt!184539 () ListLongMap!5467)

(declare-fun lt!184535 () (_ BitVec 64))

(declare-fun lt!184536 () V!13965)

(declare-fun lt!184534 () (_ BitVec 64))

(assert (=> b!391239 (not (contains!2459 (+!1044 lt!184539 (tuple2!6555 lt!184534 lt!184536)) lt!184535))))

(declare-fun addStillNotContains!136 (ListLongMap!5467 (_ BitVec 64) V!13965 (_ BitVec 64)) Unit!11970)

(assert (=> b!391239 (= lt!184533 (addStillNotContains!136 lt!184539 lt!184534 lt!184536 lt!184535))))

(assert (=> b!391239 (= lt!184535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391239 (= lt!184536 (get!5591 (select (arr!11058 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391239 (= lt!184534 (select (arr!11059 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391239 (= lt!184539 call!27595)))

(assert (=> b!391239 (= e!236968 (+!1044 call!27595 (tuple2!6555 (select (arr!11059 _keys!658) #b00000000000000000000000000000000) (get!5591 (select (arr!11058 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391240 () Bool)

(assert (=> b!391240 (= e!236971 e!236968)))

(declare-fun c!54248 () Bool)

(assert (=> b!391240 (= c!54248 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391241 () Bool)

(assert (=> b!391241 (= e!236969 e!236972)))

(declare-fun c!54249 () Bool)

(assert (=> b!391241 (= c!54249 (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(declare-fun b!391242 () Bool)

(declare-fun isEmpty!549 (ListLongMap!5467) Bool)

(assert (=> b!391242 (= e!236972 (isEmpty!549 lt!184537))))

(declare-fun b!391243 () Bool)

(assert (=> b!391243 (= e!236967 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391243 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391244 () Bool)

(declare-fun res!223938 () Bool)

(assert (=> b!391244 (=> (not res!223938) (not e!236973))))

(assert (=> b!391244 (= res!223938 (not (contains!2459 lt!184537 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!73071 c!54247) b!391234))

(assert (= (and d!73071 (not c!54247)) b!391240))

(assert (= (and b!391240 c!54248) b!391239))

(assert (= (and b!391240 (not c!54248)) b!391238))

(assert (= (or b!391239 b!391238) bm!27592))

(assert (= (and d!73071 res!223937) b!391244))

(assert (= (and b!391244 res!223938) b!391236))

(assert (= (and b!391236 res!223939) b!391243))

(assert (= (and b!391236 c!54250) b!391235))

(assert (= (and b!391236 (not c!54250)) b!391241))

(assert (= (and b!391235 res!223936) b!391237))

(assert (= (and b!391241 c!54249) b!391233))

(assert (= (and b!391241 (not c!54249)) b!391242))

(declare-fun b_lambda!8671 () Bool)

(assert (=> (not b_lambda!8671) (not b!391237)))

(declare-fun t!11576 () Bool)

(declare-fun tb!3121 () Bool)

(assert (=> (and start!38004 (= defaultEntry!514 defaultEntry!514) t!11576) tb!3121))

(declare-fun result!5743 () Bool)

(assert (=> tb!3121 (= result!5743 tp_is_empty!9645)))

(assert (=> b!391237 t!11576))

(declare-fun b_and!16291 () Bool)

(assert (= b_and!16287 (and (=> t!11576 result!5743) b_and!16291)))

(declare-fun b_lambda!8673 () Bool)

(assert (=> (not b_lambda!8673) (not b!391239)))

(assert (=> b!391239 t!11576))

(declare-fun b_and!16293 () Bool)

(assert (= b_and!16291 (and (=> t!11576 result!5743) b_and!16293)))

(declare-fun m!387593 () Bool)

(assert (=> b!391233 m!387593))

(declare-fun m!387595 () Bool)

(assert (=> d!73071 m!387595))

(assert (=> d!73071 m!387453))

(assert (=> b!391240 m!387523))

(assert (=> b!391240 m!387523))

(assert (=> b!391240 m!387525))

(declare-fun m!387597 () Bool)

(assert (=> b!391244 m!387597))

(assert (=> b!391243 m!387523))

(assert (=> b!391243 m!387523))

(assert (=> b!391243 m!387525))

(declare-fun m!387599 () Bool)

(assert (=> b!391242 m!387599))

(assert (=> b!391237 m!387523))

(declare-fun m!387601 () Bool)

(assert (=> b!391237 m!387601))

(declare-fun m!387603 () Bool)

(assert (=> b!391237 m!387603))

(declare-fun m!387605 () Bool)

(assert (=> b!391237 m!387605))

(assert (=> b!391237 m!387605))

(assert (=> b!391237 m!387603))

(declare-fun m!387607 () Bool)

(assert (=> b!391237 m!387607))

(assert (=> b!391237 m!387523))

(assert (=> bm!27592 m!387593))

(declare-fun m!387609 () Bool)

(assert (=> b!391239 m!387609))

(declare-fun m!387611 () Bool)

(assert (=> b!391239 m!387611))

(assert (=> b!391239 m!387603))

(assert (=> b!391239 m!387605))

(declare-fun m!387613 () Bool)

(assert (=> b!391239 m!387613))

(assert (=> b!391239 m!387609))

(declare-fun m!387615 () Bool)

(assert (=> b!391239 m!387615))

(assert (=> b!391239 m!387605))

(assert (=> b!391239 m!387603))

(assert (=> b!391239 m!387607))

(assert (=> b!391239 m!387523))

(assert (=> b!391235 m!387523))

(assert (=> b!391235 m!387523))

(declare-fun m!387617 () Bool)

(assert (=> b!391235 m!387617))

(assert (=> b!391103 d!73071))

(declare-fun b!391289 () Bool)

(declare-fun e!237010 () ListLongMap!5467)

(declare-fun call!27615 () ListLongMap!5467)

(assert (=> b!391289 (= e!237010 call!27615)))

(declare-fun bm!27607 () Bool)

(declare-fun call!27613 () ListLongMap!5467)

(declare-fun call!27614 () ListLongMap!5467)

(assert (=> bm!27607 (= call!27613 call!27614)))

(declare-fun bm!27608 () Bool)

(declare-fun call!27616 () Bool)

(declare-fun lt!184595 () ListLongMap!5467)

(assert (=> bm!27608 (= call!27616 (contains!2459 lt!184595 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391290 () Bool)

(declare-fun e!237008 () Bool)

(declare-fun e!237012 () Bool)

(assert (=> b!391290 (= e!237008 e!237012)))

(declare-fun res!223961 () Bool)

(declare-fun call!27611 () Bool)

(assert (=> b!391290 (= res!223961 call!27611)))

(assert (=> b!391290 (=> (not res!223961) (not e!237012))))

(declare-fun b!391291 () Bool)

(declare-fun e!237011 () ListLongMap!5467)

(declare-fun call!27612 () ListLongMap!5467)

(assert (=> b!391291 (= e!237011 (+!1044 call!27612 (tuple2!6555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!391292 () Bool)

(declare-fun e!237001 () Bool)

(declare-fun e!237000 () Bool)

(assert (=> b!391292 (= e!237001 e!237000)))

(declare-fun c!54264 () Bool)

(assert (=> b!391292 (= c!54264 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391293 () Bool)

(declare-fun e!237004 () Bool)

(assert (=> b!391293 (= e!237004 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391294 () Bool)

(declare-fun e!237005 () ListLongMap!5467)

(assert (=> b!391294 (= e!237011 e!237005)))

(declare-fun c!54267 () Bool)

(assert (=> b!391294 (= c!54267 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391295 () Bool)

(assert (=> b!391295 (= e!237005 call!27615)))

(declare-fun e!237002 () Bool)

(declare-fun b!391296 () Bool)

(assert (=> b!391296 (= e!237002 (= (apply!303 lt!184595 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)) (get!5591 (select (arr!11058 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11410 _values!506)))))

(assert (=> b!391296 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(declare-fun bm!27610 () Bool)

(assert (=> bm!27610 (= call!27611 (contains!2459 lt!184595 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391297 () Bool)

(declare-fun e!237007 () Unit!11970)

(declare-fun lt!184592 () Unit!11970)

(assert (=> b!391297 (= e!237007 lt!184592)))

(declare-fun lt!184601 () ListLongMap!5467)

(assert (=> b!391297 (= lt!184601 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184600 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184600 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184585 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184585 (select (arr!11059 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184590 () Unit!11970)

(declare-fun addStillContains!279 (ListLongMap!5467 (_ BitVec 64) V!13965 (_ BitVec 64)) Unit!11970)

(assert (=> b!391297 (= lt!184590 (addStillContains!279 lt!184601 lt!184600 zeroValue!472 lt!184585))))

(assert (=> b!391297 (contains!2459 (+!1044 lt!184601 (tuple2!6555 lt!184600 zeroValue!472)) lt!184585)))

(declare-fun lt!184604 () Unit!11970)

(assert (=> b!391297 (= lt!184604 lt!184590)))

(declare-fun lt!184594 () ListLongMap!5467)

(assert (=> b!391297 (= lt!184594 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184589 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184589 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184587 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184587 (select (arr!11059 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184603 () Unit!11970)

(declare-fun addApplyDifferent!279 (ListLongMap!5467 (_ BitVec 64) V!13965 (_ BitVec 64)) Unit!11970)

(assert (=> b!391297 (= lt!184603 (addApplyDifferent!279 lt!184594 lt!184589 minValue!472 lt!184587))))

(assert (=> b!391297 (= (apply!303 (+!1044 lt!184594 (tuple2!6555 lt!184589 minValue!472)) lt!184587) (apply!303 lt!184594 lt!184587))))

(declare-fun lt!184591 () Unit!11970)

(assert (=> b!391297 (= lt!184591 lt!184603)))

(declare-fun lt!184605 () ListLongMap!5467)

(assert (=> b!391297 (= lt!184605 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184596 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184596 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184593 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184593 (select (arr!11059 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184602 () Unit!11970)

(assert (=> b!391297 (= lt!184602 (addApplyDifferent!279 lt!184605 lt!184596 zeroValue!472 lt!184593))))

(assert (=> b!391297 (= (apply!303 (+!1044 lt!184605 (tuple2!6555 lt!184596 zeroValue!472)) lt!184593) (apply!303 lt!184605 lt!184593))))

(declare-fun lt!184586 () Unit!11970)

(assert (=> b!391297 (= lt!184586 lt!184602)))

(declare-fun lt!184588 () ListLongMap!5467)

(assert (=> b!391297 (= lt!184588 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184584 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184584 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184599 () (_ BitVec 64))

(assert (=> b!391297 (= lt!184599 (select (arr!11059 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391297 (= lt!184592 (addApplyDifferent!279 lt!184588 lt!184584 minValue!472 lt!184599))))

(assert (=> b!391297 (= (apply!303 (+!1044 lt!184588 (tuple2!6555 lt!184584 minValue!472)) lt!184599) (apply!303 lt!184588 lt!184599))))

(declare-fun b!391298 () Bool)

(declare-fun Unit!11972 () Unit!11970)

(assert (=> b!391298 (= e!237007 Unit!11972)))

(declare-fun b!391299 () Bool)

(assert (=> b!391299 (= e!237000 (not call!27616))))

(declare-fun b!391300 () Bool)

(declare-fun call!27610 () ListLongMap!5467)

(assert (=> b!391300 (= e!237010 call!27610)))

(declare-fun c!54265 () Bool)

(declare-fun bm!27611 () Bool)

(assert (=> bm!27611 (= call!27612 (+!1044 (ite c!54265 call!27614 (ite c!54267 call!27613 call!27610)) (ite (or c!54265 c!54267) (tuple2!6555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27612 () Bool)

(assert (=> bm!27612 (= call!27614 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391301 () Bool)

(declare-fun e!237006 () Bool)

(assert (=> b!391301 (= e!237006 e!237002)))

(declare-fun res!223960 () Bool)

(assert (=> b!391301 (=> (not res!223960) (not e!237002))))

(assert (=> b!391301 (= res!223960 (contains!2459 lt!184595 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391301 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(declare-fun b!391302 () Bool)

(declare-fun c!54268 () Bool)

(assert (=> b!391302 (= c!54268 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!391302 (= e!237005 e!237010)))

(declare-fun b!391303 () Bool)

(declare-fun e!237003 () Bool)

(assert (=> b!391303 (= e!237003 (validKeyInArray!0 (select (arr!11059 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391304 () Bool)

(assert (=> b!391304 (= e!237012 (= (apply!303 lt!184595 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!391305 () Bool)

(declare-fun res!223965 () Bool)

(assert (=> b!391305 (=> (not res!223965) (not e!237001))))

(assert (=> b!391305 (= res!223965 e!237006)))

(declare-fun res!223964 () Bool)

(assert (=> b!391305 (=> res!223964 e!237006)))

(assert (=> b!391305 (= res!223964 (not e!237003))))

(declare-fun res!223958 () Bool)

(assert (=> b!391305 (=> (not res!223958) (not e!237003))))

(assert (=> b!391305 (= res!223958 (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(declare-fun b!391306 () Bool)

(declare-fun e!237009 () Bool)

(assert (=> b!391306 (= e!237000 e!237009)))

(declare-fun res!223963 () Bool)

(assert (=> b!391306 (= res!223963 call!27616)))

(assert (=> b!391306 (=> (not res!223963) (not e!237009))))

(declare-fun b!391307 () Bool)

(assert (=> b!391307 (= e!237009 (= (apply!303 lt!184595 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun d!73073 () Bool)

(assert (=> d!73073 e!237001))

(declare-fun res!223966 () Bool)

(assert (=> d!73073 (=> (not res!223966) (not e!237001))))

(assert (=> d!73073 (= res!223966 (or (bvsge #b00000000000000000000000000000000 (size!11411 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))))

(declare-fun lt!184597 () ListLongMap!5467)

(assert (=> d!73073 (= lt!184595 lt!184597)))

(declare-fun lt!184598 () Unit!11970)

(assert (=> d!73073 (= lt!184598 e!237007)))

(declare-fun c!54263 () Bool)

(assert (=> d!73073 (= c!54263 e!237004)))

(declare-fun res!223959 () Bool)

(assert (=> d!73073 (=> (not res!223959) (not e!237004))))

(assert (=> d!73073 (= res!223959 (bvslt #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(assert (=> d!73073 (= lt!184597 e!237011)))

(assert (=> d!73073 (= c!54265 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73073 (validMask!0 mask!970)))

(assert (=> d!73073 (= (getCurrentListMap!2094 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184595)))

(declare-fun bm!27609 () Bool)

(assert (=> bm!27609 (= call!27610 call!27613)))

(declare-fun b!391308 () Bool)

(declare-fun res!223962 () Bool)

(assert (=> b!391308 (=> (not res!223962) (not e!237001))))

(assert (=> b!391308 (= res!223962 e!237008)))

(declare-fun c!54266 () Bool)

(assert (=> b!391308 (= c!54266 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391309 () Bool)

(assert (=> b!391309 (= e!237008 (not call!27611))))

(declare-fun bm!27613 () Bool)

(assert (=> bm!27613 (= call!27615 call!27612)))

(assert (= (and d!73073 c!54265) b!391291))

(assert (= (and d!73073 (not c!54265)) b!391294))

(assert (= (and b!391294 c!54267) b!391295))

(assert (= (and b!391294 (not c!54267)) b!391302))

(assert (= (and b!391302 c!54268) b!391289))

(assert (= (and b!391302 (not c!54268)) b!391300))

(assert (= (or b!391289 b!391300) bm!27609))

(assert (= (or b!391295 bm!27609) bm!27607))

(assert (= (or b!391295 b!391289) bm!27613))

(assert (= (or b!391291 bm!27607) bm!27612))

(assert (= (or b!391291 bm!27613) bm!27611))

(assert (= (and d!73073 res!223959) b!391293))

(assert (= (and d!73073 c!54263) b!391297))

(assert (= (and d!73073 (not c!54263)) b!391298))

(assert (= (and d!73073 res!223966) b!391305))

(assert (= (and b!391305 res!223958) b!391303))

(assert (= (and b!391305 (not res!223964)) b!391301))

(assert (= (and b!391301 res!223960) b!391296))

(assert (= (and b!391305 res!223965) b!391308))

(assert (= (and b!391308 c!54266) b!391290))

(assert (= (and b!391308 (not c!54266)) b!391309))

(assert (= (and b!391290 res!223961) b!391304))

(assert (= (or b!391290 b!391309) bm!27610))

(assert (= (and b!391308 res!223962) b!391292))

(assert (= (and b!391292 c!54264) b!391306))

(assert (= (and b!391292 (not c!54264)) b!391299))

(assert (= (and b!391306 res!223963) b!391307))

(assert (= (or b!391306 b!391299) bm!27608))

(declare-fun b_lambda!8675 () Bool)

(assert (=> (not b_lambda!8675) (not b!391296)))

(assert (=> b!391296 t!11576))

(declare-fun b_and!16295 () Bool)

(assert (= b_and!16293 (and (=> t!11576 result!5743) b_and!16295)))

(declare-fun m!387619 () Bool)

(assert (=> b!391291 m!387619))

(declare-fun m!387621 () Bool)

(assert (=> b!391307 m!387621))

(declare-fun m!387623 () Bool)

(assert (=> bm!27610 m!387623))

(assert (=> b!391296 m!387605))

(assert (=> b!391296 m!387523))

(assert (=> b!391296 m!387523))

(declare-fun m!387625 () Bool)

(assert (=> b!391296 m!387625))

(assert (=> b!391296 m!387605))

(assert (=> b!391296 m!387603))

(assert (=> b!391296 m!387607))

(assert (=> b!391296 m!387603))

(assert (=> b!391301 m!387523))

(assert (=> b!391301 m!387523))

(declare-fun m!387627 () Bool)

(assert (=> b!391301 m!387627))

(declare-fun m!387629 () Bool)

(assert (=> bm!27608 m!387629))

(assert (=> d!73073 m!387453))

(assert (=> b!391303 m!387523))

(assert (=> b!391303 m!387523))

(assert (=> b!391303 m!387525))

(declare-fun m!387631 () Bool)

(assert (=> bm!27611 m!387631))

(assert (=> b!391293 m!387523))

(assert (=> b!391293 m!387523))

(assert (=> b!391293 m!387525))

(assert (=> bm!27612 m!387467))

(declare-fun m!387633 () Bool)

(assert (=> b!391304 m!387633))

(declare-fun m!387635 () Bool)

(assert (=> b!391297 m!387635))

(declare-fun m!387637 () Bool)

(assert (=> b!391297 m!387637))

(declare-fun m!387639 () Bool)

(assert (=> b!391297 m!387639))

(declare-fun m!387641 () Bool)

(assert (=> b!391297 m!387641))

(declare-fun m!387643 () Bool)

(assert (=> b!391297 m!387643))

(declare-fun m!387645 () Bool)

(assert (=> b!391297 m!387645))

(assert (=> b!391297 m!387467))

(declare-fun m!387647 () Bool)

(assert (=> b!391297 m!387647))

(assert (=> b!391297 m!387641))

(declare-fun m!387649 () Bool)

(assert (=> b!391297 m!387649))

(declare-fun m!387651 () Bool)

(assert (=> b!391297 m!387651))

(declare-fun m!387653 () Bool)

(assert (=> b!391297 m!387653))

(assert (=> b!391297 m!387647))

(declare-fun m!387655 () Bool)

(assert (=> b!391297 m!387655))

(assert (=> b!391297 m!387653))

(declare-fun m!387657 () Bool)

(assert (=> b!391297 m!387657))

(declare-fun m!387659 () Bool)

(assert (=> b!391297 m!387659))

(declare-fun m!387661 () Bool)

(assert (=> b!391297 m!387661))

(assert (=> b!391297 m!387659))

(declare-fun m!387663 () Bool)

(assert (=> b!391297 m!387663))

(assert (=> b!391297 m!387523))

(assert (=> b!391103 d!73073))

(declare-fun lt!184610 () ListLongMap!5467)

(declare-fun e!237018 () Bool)

(declare-fun b!391310 () Bool)

(assert (=> b!391310 (= e!237018 (= lt!184610 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391311 () Bool)

(declare-fun e!237017 () ListLongMap!5467)

(assert (=> b!391311 (= e!237017 (ListLongMap!5468 Nil!6406))))

(declare-fun bm!27614 () Bool)

(declare-fun call!27617 () ListLongMap!5467)

(assert (=> bm!27614 (= call!27617 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391312 () Bool)

(declare-fun e!237015 () Bool)

(declare-fun e!237016 () Bool)

(assert (=> b!391312 (= e!237015 e!237016)))

(assert (=> b!391312 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(declare-fun res!223967 () Bool)

(assert (=> b!391312 (= res!223967 (contains!2459 lt!184610 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(assert (=> b!391312 (=> (not res!223967) (not e!237016))))

(declare-fun b!391313 () Bool)

(declare-fun e!237019 () Bool)

(assert (=> b!391313 (= e!237019 e!237015)))

(declare-fun c!54272 () Bool)

(declare-fun e!237013 () Bool)

(assert (=> b!391313 (= c!54272 e!237013)))

(declare-fun res!223970 () Bool)

(assert (=> b!391313 (=> (not res!223970) (not e!237013))))

(assert (=> b!391313 (= res!223970 (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(declare-fun b!391314 () Bool)

(assert (=> b!391314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(assert (=> b!391314 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11410 lt!184458)))))

(assert (=> b!391314 (= e!237016 (= (apply!303 lt!184610 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)) (get!5591 (select (arr!11058 lt!184458) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!73075 () Bool)

(assert (=> d!73075 e!237019))

(declare-fun res!223968 () Bool)

(assert (=> d!73075 (=> (not res!223968) (not e!237019))))

(assert (=> d!73075 (= res!223968 (not (contains!2459 lt!184610 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73075 (= lt!184610 e!237017)))

(declare-fun c!54269 () Bool)

(assert (=> d!73075 (= c!54269 (bvsge #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(assert (=> d!73075 (validMask!0 mask!970)))

(assert (=> d!73075 (= (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184610)))

(declare-fun b!391315 () Bool)

(declare-fun e!237014 () ListLongMap!5467)

(assert (=> b!391315 (= e!237014 call!27617)))

(declare-fun b!391316 () Bool)

(declare-fun lt!184611 () Unit!11970)

(declare-fun lt!184606 () Unit!11970)

(assert (=> b!391316 (= lt!184611 lt!184606)))

(declare-fun lt!184608 () (_ BitVec 64))

(declare-fun lt!184607 () (_ BitVec 64))

(declare-fun lt!184609 () V!13965)

(declare-fun lt!184612 () ListLongMap!5467)

(assert (=> b!391316 (not (contains!2459 (+!1044 lt!184612 (tuple2!6555 lt!184607 lt!184609)) lt!184608))))

(assert (=> b!391316 (= lt!184606 (addStillNotContains!136 lt!184612 lt!184607 lt!184609 lt!184608))))

(assert (=> b!391316 (= lt!184608 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391316 (= lt!184609 (get!5591 (select (arr!11058 lt!184458) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391316 (= lt!184607 (select (arr!11059 lt!184455) #b00000000000000000000000000000000))))

(assert (=> b!391316 (= lt!184612 call!27617)))

(assert (=> b!391316 (= e!237014 (+!1044 call!27617 (tuple2!6555 (select (arr!11059 lt!184455) #b00000000000000000000000000000000) (get!5591 (select (arr!11058 lt!184458) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391317 () Bool)

(assert (=> b!391317 (= e!237017 e!237014)))

(declare-fun c!54270 () Bool)

(assert (=> b!391317 (= c!54270 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(declare-fun b!391318 () Bool)

(assert (=> b!391318 (= e!237015 e!237018)))

(declare-fun c!54271 () Bool)

(assert (=> b!391318 (= c!54271 (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(declare-fun b!391319 () Bool)

(assert (=> b!391319 (= e!237018 (isEmpty!549 lt!184610))))

(declare-fun b!391320 () Bool)

(assert (=> b!391320 (= e!237013 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(assert (=> b!391320 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391321 () Bool)

(declare-fun res!223969 () Bool)

(assert (=> b!391321 (=> (not res!223969) (not e!237019))))

(assert (=> b!391321 (= res!223969 (not (contains!2459 lt!184610 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!73075 c!54269) b!391311))

(assert (= (and d!73075 (not c!54269)) b!391317))

(assert (= (and b!391317 c!54270) b!391316))

(assert (= (and b!391317 (not c!54270)) b!391315))

(assert (= (or b!391316 b!391315) bm!27614))

(assert (= (and d!73075 res!223968) b!391321))

(assert (= (and b!391321 res!223969) b!391313))

(assert (= (and b!391313 res!223970) b!391320))

(assert (= (and b!391313 c!54272) b!391312))

(assert (= (and b!391313 (not c!54272)) b!391318))

(assert (= (and b!391312 res!223967) b!391314))

(assert (= (and b!391318 c!54271) b!391310))

(assert (= (and b!391318 (not c!54271)) b!391319))

(declare-fun b_lambda!8677 () Bool)

(assert (=> (not b_lambda!8677) (not b!391314)))

(assert (=> b!391314 t!11576))

(declare-fun b_and!16297 () Bool)

(assert (= b_and!16295 (and (=> t!11576 result!5743) b_and!16297)))

(declare-fun b_lambda!8679 () Bool)

(assert (=> (not b_lambda!8679) (not b!391316)))

(assert (=> b!391316 t!11576))

(declare-fun b_and!16299 () Bool)

(assert (= b_and!16297 (and (=> t!11576 result!5743) b_and!16299)))

(declare-fun m!387665 () Bool)

(assert (=> b!391310 m!387665))

(declare-fun m!387667 () Bool)

(assert (=> d!73075 m!387667))

(assert (=> d!73075 m!387453))

(assert (=> b!391317 m!387555))

(assert (=> b!391317 m!387555))

(assert (=> b!391317 m!387565))

(declare-fun m!387669 () Bool)

(assert (=> b!391321 m!387669))

(assert (=> b!391320 m!387555))

(assert (=> b!391320 m!387555))

(assert (=> b!391320 m!387565))

(declare-fun m!387671 () Bool)

(assert (=> b!391319 m!387671))

(assert (=> b!391314 m!387555))

(declare-fun m!387673 () Bool)

(assert (=> b!391314 m!387673))

(assert (=> b!391314 m!387603))

(declare-fun m!387675 () Bool)

(assert (=> b!391314 m!387675))

(assert (=> b!391314 m!387675))

(assert (=> b!391314 m!387603))

(declare-fun m!387677 () Bool)

(assert (=> b!391314 m!387677))

(assert (=> b!391314 m!387555))

(assert (=> bm!27614 m!387665))

(declare-fun m!387679 () Bool)

(assert (=> b!391316 m!387679))

(declare-fun m!387681 () Bool)

(assert (=> b!391316 m!387681))

(assert (=> b!391316 m!387603))

(assert (=> b!391316 m!387675))

(declare-fun m!387683 () Bool)

(assert (=> b!391316 m!387683))

(assert (=> b!391316 m!387679))

(declare-fun m!387685 () Bool)

(assert (=> b!391316 m!387685))

(assert (=> b!391316 m!387675))

(assert (=> b!391316 m!387603))

(assert (=> b!391316 m!387677))

(assert (=> b!391316 m!387555))

(assert (=> b!391312 m!387555))

(assert (=> b!391312 m!387555))

(declare-fun m!387687 () Bool)

(assert (=> b!391312 m!387687))

(assert (=> b!391103 d!73075))

(declare-fun b!391328 () Bool)

(declare-fun e!237024 () Bool)

(declare-fun e!237025 () Bool)

(assert (=> b!391328 (= e!237024 e!237025)))

(declare-fun c!54275 () Bool)

(assert (=> b!391328 (= c!54275 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!391329 () Bool)

(declare-fun call!27622 () ListLongMap!5467)

(declare-fun call!27623 () ListLongMap!5467)

(assert (=> b!391329 (= e!237025 (= call!27622 call!27623))))

(declare-fun b!391330 () Bool)

(assert (=> b!391330 (= e!237025 (= call!27622 (+!1044 call!27623 (tuple2!6555 k0!778 v!373))))))

(declare-fun bm!27620 () Bool)

(assert (=> bm!27620 (= call!27623 (getCurrentListMapNoExtraKeys!974 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27619 () Bool)

(assert (=> bm!27619 (= call!27622 (getCurrentListMapNoExtraKeys!974 (array!23194 (store (arr!11059 _keys!658) i!548 k0!778) (size!11411 _keys!658)) (array!23192 (store (arr!11058 _values!506) i!548 (ValueCellFull!4479 v!373)) (size!11410 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!73077 () Bool)

(assert (=> d!73077 e!237024))

(declare-fun res!223973 () Bool)

(assert (=> d!73077 (=> (not res!223973) (not e!237024))))

(assert (=> d!73077 (= res!223973 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11411 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11410 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11411 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11410 _values!506))))))))

(declare-fun lt!184615 () Unit!11970)

(declare-fun choose!1318 (array!23193 array!23191 (_ BitVec 32) (_ BitVec 32) V!13965 V!13965 (_ BitVec 32) (_ BitVec 64) V!13965 (_ BitVec 32) Int) Unit!11970)

(assert (=> d!73077 (= lt!184615 (choose!1318 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73077 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11411 _keys!658)))))

(assert (=> d!73077 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!258 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184615)))

(assert (= (and d!73077 res!223973) b!391328))

(assert (= (and b!391328 c!54275) b!391330))

(assert (= (and b!391328 (not c!54275)) b!391329))

(assert (= (or b!391330 b!391329) bm!27620))

(assert (= (or b!391330 b!391329) bm!27619))

(declare-fun m!387689 () Bool)

(assert (=> b!391330 m!387689))

(assert (=> bm!27620 m!387467))

(assert (=> bm!27619 m!387439))

(assert (=> bm!27619 m!387475))

(declare-fun m!387691 () Bool)

(assert (=> bm!27619 m!387691))

(declare-fun m!387693 () Bool)

(assert (=> d!73077 m!387693))

(assert (=> b!391103 d!73077))

(declare-fun b!391331 () Bool)

(declare-fun e!237036 () ListLongMap!5467)

(declare-fun call!27629 () ListLongMap!5467)

(assert (=> b!391331 (= e!237036 call!27629)))

(declare-fun bm!27621 () Bool)

(declare-fun call!27627 () ListLongMap!5467)

(declare-fun call!27628 () ListLongMap!5467)

(assert (=> bm!27621 (= call!27627 call!27628)))

(declare-fun bm!27622 () Bool)

(declare-fun call!27630 () Bool)

(declare-fun lt!184627 () ListLongMap!5467)

(assert (=> bm!27622 (= call!27630 (contains!2459 lt!184627 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391332 () Bool)

(declare-fun e!237034 () Bool)

(declare-fun e!237038 () Bool)

(assert (=> b!391332 (= e!237034 e!237038)))

(declare-fun res!223977 () Bool)

(declare-fun call!27625 () Bool)

(assert (=> b!391332 (= res!223977 call!27625)))

(assert (=> b!391332 (=> (not res!223977) (not e!237038))))

(declare-fun b!391333 () Bool)

(declare-fun e!237037 () ListLongMap!5467)

(declare-fun call!27626 () ListLongMap!5467)

(assert (=> b!391333 (= e!237037 (+!1044 call!27626 (tuple2!6555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!391334 () Bool)

(declare-fun e!237027 () Bool)

(declare-fun e!237026 () Bool)

(assert (=> b!391334 (= e!237027 e!237026)))

(declare-fun c!54277 () Bool)

(assert (=> b!391334 (= c!54277 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391335 () Bool)

(declare-fun e!237030 () Bool)

(assert (=> b!391335 (= e!237030 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(declare-fun b!391336 () Bool)

(declare-fun e!237031 () ListLongMap!5467)

(assert (=> b!391336 (= e!237037 e!237031)))

(declare-fun c!54280 () Bool)

(assert (=> b!391336 (= c!54280 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391337 () Bool)

(assert (=> b!391337 (= e!237031 call!27629)))

(declare-fun b!391338 () Bool)

(declare-fun e!237028 () Bool)

(assert (=> b!391338 (= e!237028 (= (apply!303 lt!184627 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)) (get!5591 (select (arr!11058 lt!184458) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11410 lt!184458)))))

(assert (=> b!391338 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(declare-fun bm!27624 () Bool)

(assert (=> bm!27624 (= call!27625 (contains!2459 lt!184627 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391339 () Bool)

(declare-fun e!237033 () Unit!11970)

(declare-fun lt!184624 () Unit!11970)

(assert (=> b!391339 (= e!237033 lt!184624)))

(declare-fun lt!184633 () ListLongMap!5467)

(assert (=> b!391339 (= lt!184633 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184632 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184632 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184617 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184617 (select (arr!11059 lt!184455) #b00000000000000000000000000000000))))

(declare-fun lt!184622 () Unit!11970)

(assert (=> b!391339 (= lt!184622 (addStillContains!279 lt!184633 lt!184632 zeroValue!472 lt!184617))))

(assert (=> b!391339 (contains!2459 (+!1044 lt!184633 (tuple2!6555 lt!184632 zeroValue!472)) lt!184617)))

(declare-fun lt!184636 () Unit!11970)

(assert (=> b!391339 (= lt!184636 lt!184622)))

(declare-fun lt!184626 () ListLongMap!5467)

(assert (=> b!391339 (= lt!184626 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184621 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184621 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184619 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184619 (select (arr!11059 lt!184455) #b00000000000000000000000000000000))))

(declare-fun lt!184635 () Unit!11970)

(assert (=> b!391339 (= lt!184635 (addApplyDifferent!279 lt!184626 lt!184621 minValue!472 lt!184619))))

(assert (=> b!391339 (= (apply!303 (+!1044 lt!184626 (tuple2!6555 lt!184621 minValue!472)) lt!184619) (apply!303 lt!184626 lt!184619))))

(declare-fun lt!184623 () Unit!11970)

(assert (=> b!391339 (= lt!184623 lt!184635)))

(declare-fun lt!184637 () ListLongMap!5467)

(assert (=> b!391339 (= lt!184637 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184628 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184625 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184625 (select (arr!11059 lt!184455) #b00000000000000000000000000000000))))

(declare-fun lt!184634 () Unit!11970)

(assert (=> b!391339 (= lt!184634 (addApplyDifferent!279 lt!184637 lt!184628 zeroValue!472 lt!184625))))

(assert (=> b!391339 (= (apply!303 (+!1044 lt!184637 (tuple2!6555 lt!184628 zeroValue!472)) lt!184625) (apply!303 lt!184637 lt!184625))))

(declare-fun lt!184618 () Unit!11970)

(assert (=> b!391339 (= lt!184618 lt!184634)))

(declare-fun lt!184620 () ListLongMap!5467)

(assert (=> b!391339 (= lt!184620 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184616 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184616 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184631 () (_ BitVec 64))

(assert (=> b!391339 (= lt!184631 (select (arr!11059 lt!184455) #b00000000000000000000000000000000))))

(assert (=> b!391339 (= lt!184624 (addApplyDifferent!279 lt!184620 lt!184616 minValue!472 lt!184631))))

(assert (=> b!391339 (= (apply!303 (+!1044 lt!184620 (tuple2!6555 lt!184616 minValue!472)) lt!184631) (apply!303 lt!184620 lt!184631))))

(declare-fun b!391340 () Bool)

(declare-fun Unit!11973 () Unit!11970)

(assert (=> b!391340 (= e!237033 Unit!11973)))

(declare-fun b!391341 () Bool)

(assert (=> b!391341 (= e!237026 (not call!27630))))

(declare-fun b!391342 () Bool)

(declare-fun call!27624 () ListLongMap!5467)

(assert (=> b!391342 (= e!237036 call!27624)))

(declare-fun bm!27625 () Bool)

(declare-fun c!54278 () Bool)

(assert (=> bm!27625 (= call!27626 (+!1044 (ite c!54278 call!27628 (ite c!54280 call!27627 call!27624)) (ite (or c!54278 c!54280) (tuple2!6555 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6555 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun bm!27626 () Bool)

(assert (=> bm!27626 (= call!27628 (getCurrentListMapNoExtraKeys!974 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391343 () Bool)

(declare-fun e!237032 () Bool)

(assert (=> b!391343 (= e!237032 e!237028)))

(declare-fun res!223976 () Bool)

(assert (=> b!391343 (=> (not res!223976) (not e!237028))))

(assert (=> b!391343 (= res!223976 (contains!2459 lt!184627 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(assert (=> b!391343 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(declare-fun b!391344 () Bool)

(declare-fun c!54281 () Bool)

(assert (=> b!391344 (= c!54281 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!391344 (= e!237031 e!237036)))

(declare-fun b!391345 () Bool)

(declare-fun e!237029 () Bool)

(assert (=> b!391345 (= e!237029 (validKeyInArray!0 (select (arr!11059 lt!184455) #b00000000000000000000000000000000)))))

(declare-fun b!391346 () Bool)

(assert (=> b!391346 (= e!237038 (= (apply!303 lt!184627 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!391347 () Bool)

(declare-fun res!223981 () Bool)

(assert (=> b!391347 (=> (not res!223981) (not e!237027))))

(assert (=> b!391347 (= res!223981 e!237032)))

(declare-fun res!223980 () Bool)

(assert (=> b!391347 (=> res!223980 e!237032)))

(assert (=> b!391347 (= res!223980 (not e!237029))))

(declare-fun res!223974 () Bool)

(assert (=> b!391347 (=> (not res!223974) (not e!237029))))

(assert (=> b!391347 (= res!223974 (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(declare-fun b!391348 () Bool)

(declare-fun e!237035 () Bool)

(assert (=> b!391348 (= e!237026 e!237035)))

(declare-fun res!223979 () Bool)

(assert (=> b!391348 (= res!223979 call!27630)))

(assert (=> b!391348 (=> (not res!223979) (not e!237035))))

(declare-fun b!391349 () Bool)

(assert (=> b!391349 (= e!237035 (= (apply!303 lt!184627 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun d!73079 () Bool)

(assert (=> d!73079 e!237027))

(declare-fun res!223982 () Bool)

(assert (=> d!73079 (=> (not res!223982) (not e!237027))))

(assert (=> d!73079 (= res!223982 (or (bvsge #b00000000000000000000000000000000 (size!11411 lt!184455)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))))

(declare-fun lt!184629 () ListLongMap!5467)

(assert (=> d!73079 (= lt!184627 lt!184629)))

(declare-fun lt!184630 () Unit!11970)

(assert (=> d!73079 (= lt!184630 e!237033)))

(declare-fun c!54276 () Bool)

(assert (=> d!73079 (= c!54276 e!237030)))

(declare-fun res!223975 () Bool)

(assert (=> d!73079 (=> (not res!223975) (not e!237030))))

(assert (=> d!73079 (= res!223975 (bvslt #b00000000000000000000000000000000 (size!11411 lt!184455)))))

(assert (=> d!73079 (= lt!184629 e!237037)))

(assert (=> d!73079 (= c!54278 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73079 (validMask!0 mask!970)))

(assert (=> d!73079 (= (getCurrentListMap!2094 lt!184455 lt!184458 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184627)))

(declare-fun bm!27623 () Bool)

(assert (=> bm!27623 (= call!27624 call!27627)))

(declare-fun b!391350 () Bool)

(declare-fun res!223978 () Bool)

(assert (=> b!391350 (=> (not res!223978) (not e!237027))))

(assert (=> b!391350 (= res!223978 e!237034)))

(declare-fun c!54279 () Bool)

(assert (=> b!391350 (= c!54279 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391351 () Bool)

(assert (=> b!391351 (= e!237034 (not call!27625))))

(declare-fun bm!27627 () Bool)

(assert (=> bm!27627 (= call!27629 call!27626)))

(assert (= (and d!73079 c!54278) b!391333))

(assert (= (and d!73079 (not c!54278)) b!391336))

(assert (= (and b!391336 c!54280) b!391337))

(assert (= (and b!391336 (not c!54280)) b!391344))

(assert (= (and b!391344 c!54281) b!391331))

(assert (= (and b!391344 (not c!54281)) b!391342))

(assert (= (or b!391331 b!391342) bm!27623))

(assert (= (or b!391337 bm!27623) bm!27621))

(assert (= (or b!391337 b!391331) bm!27627))

(assert (= (or b!391333 bm!27621) bm!27626))

(assert (= (or b!391333 bm!27627) bm!27625))

(assert (= (and d!73079 res!223975) b!391335))

(assert (= (and d!73079 c!54276) b!391339))

(assert (= (and d!73079 (not c!54276)) b!391340))

(assert (= (and d!73079 res!223982) b!391347))

(assert (= (and b!391347 res!223974) b!391345))

(assert (= (and b!391347 (not res!223980)) b!391343))

(assert (= (and b!391343 res!223976) b!391338))

(assert (= (and b!391347 res!223981) b!391350))

(assert (= (and b!391350 c!54279) b!391332))

(assert (= (and b!391350 (not c!54279)) b!391351))

(assert (= (and b!391332 res!223977) b!391346))

(assert (= (or b!391332 b!391351) bm!27624))

(assert (= (and b!391350 res!223978) b!391334))

(assert (= (and b!391334 c!54277) b!391348))

(assert (= (and b!391334 (not c!54277)) b!391341))

(assert (= (and b!391348 res!223979) b!391349))

(assert (= (or b!391348 b!391341) bm!27622))

(declare-fun b_lambda!8681 () Bool)

(assert (=> (not b_lambda!8681) (not b!391338)))

(assert (=> b!391338 t!11576))

(declare-fun b_and!16301 () Bool)

(assert (= b_and!16299 (and (=> t!11576 result!5743) b_and!16301)))

(declare-fun m!387695 () Bool)

(assert (=> b!391333 m!387695))

(declare-fun m!387697 () Bool)

(assert (=> b!391349 m!387697))

(declare-fun m!387699 () Bool)

(assert (=> bm!27624 m!387699))

(assert (=> b!391338 m!387675))

(assert (=> b!391338 m!387555))

(assert (=> b!391338 m!387555))

(declare-fun m!387701 () Bool)

(assert (=> b!391338 m!387701))

(assert (=> b!391338 m!387675))

(assert (=> b!391338 m!387603))

(assert (=> b!391338 m!387677))

(assert (=> b!391338 m!387603))

(assert (=> b!391343 m!387555))

(assert (=> b!391343 m!387555))

(declare-fun m!387703 () Bool)

(assert (=> b!391343 m!387703))

(declare-fun m!387705 () Bool)

(assert (=> bm!27622 m!387705))

(assert (=> d!73079 m!387453))

(assert (=> b!391345 m!387555))

(assert (=> b!391345 m!387555))

(assert (=> b!391345 m!387565))

(declare-fun m!387707 () Bool)

(assert (=> bm!27625 m!387707))

(assert (=> b!391335 m!387555))

(assert (=> b!391335 m!387555))

(assert (=> b!391335 m!387565))

(assert (=> bm!27626 m!387471))

(declare-fun m!387709 () Bool)

(assert (=> b!391346 m!387709))

(declare-fun m!387711 () Bool)

(assert (=> b!391339 m!387711))

(declare-fun m!387713 () Bool)

(assert (=> b!391339 m!387713))

(declare-fun m!387715 () Bool)

(assert (=> b!391339 m!387715))

(declare-fun m!387717 () Bool)

(assert (=> b!391339 m!387717))

(declare-fun m!387719 () Bool)

(assert (=> b!391339 m!387719))

(declare-fun m!387721 () Bool)

(assert (=> b!391339 m!387721))

(assert (=> b!391339 m!387471))

(declare-fun m!387723 () Bool)

(assert (=> b!391339 m!387723))

(assert (=> b!391339 m!387717))

(declare-fun m!387725 () Bool)

(assert (=> b!391339 m!387725))

(declare-fun m!387727 () Bool)

(assert (=> b!391339 m!387727))

(declare-fun m!387729 () Bool)

(assert (=> b!391339 m!387729))

(assert (=> b!391339 m!387723))

(declare-fun m!387731 () Bool)

(assert (=> b!391339 m!387731))

(assert (=> b!391339 m!387729))

(declare-fun m!387733 () Bool)

(assert (=> b!391339 m!387733))

(declare-fun m!387735 () Bool)

(assert (=> b!391339 m!387735))

(declare-fun m!387737 () Bool)

(assert (=> b!391339 m!387737))

(assert (=> b!391339 m!387735))

(declare-fun m!387739 () Bool)

(assert (=> b!391339 m!387739))

(assert (=> b!391339 m!387555))

(assert (=> b!391103 d!73079))

(declare-fun d!73081 () Bool)

(declare-fun e!237039 () Bool)

(assert (=> d!73081 e!237039))

(declare-fun res!223983 () Bool)

(assert (=> d!73081 (=> (not res!223983) (not e!237039))))

(declare-fun lt!184639 () ListLongMap!5467)

(assert (=> d!73081 (= res!223983 (contains!2459 lt!184639 (_1!3288 (tuple2!6555 k0!778 v!373))))))

(declare-fun lt!184640 () List!6409)

(assert (=> d!73081 (= lt!184639 (ListLongMap!5468 lt!184640))))

(declare-fun lt!184641 () Unit!11970)

(declare-fun lt!184638 () Unit!11970)

(assert (=> d!73081 (= lt!184641 lt!184638)))

(assert (=> d!73081 (= (getValueByKey!361 lt!184640 (_1!3288 (tuple2!6555 k0!778 v!373))) (Some!366 (_2!3288 (tuple2!6555 k0!778 v!373))))))

(assert (=> d!73081 (= lt!184638 (lemmaContainsTupThenGetReturnValue!183 lt!184640 (_1!3288 (tuple2!6555 k0!778 v!373)) (_2!3288 (tuple2!6555 k0!778 v!373))))))

(assert (=> d!73081 (= lt!184640 (insertStrictlySorted!186 (toList!2749 lt!184452) (_1!3288 (tuple2!6555 k0!778 v!373)) (_2!3288 (tuple2!6555 k0!778 v!373))))))

(assert (=> d!73081 (= (+!1044 lt!184452 (tuple2!6555 k0!778 v!373)) lt!184639)))

(declare-fun b!391352 () Bool)

(declare-fun res!223984 () Bool)

(assert (=> b!391352 (=> (not res!223984) (not e!237039))))

(assert (=> b!391352 (= res!223984 (= (getValueByKey!361 (toList!2749 lt!184639) (_1!3288 (tuple2!6555 k0!778 v!373))) (Some!366 (_2!3288 (tuple2!6555 k0!778 v!373)))))))

(declare-fun b!391353 () Bool)

(assert (=> b!391353 (= e!237039 (contains!2460 (toList!2749 lt!184639) (tuple2!6555 k0!778 v!373)))))

(assert (= (and d!73081 res!223983) b!391352))

(assert (= (and b!391352 res!223984) b!391353))

(declare-fun m!387741 () Bool)

(assert (=> d!73081 m!387741))

(declare-fun m!387743 () Bool)

(assert (=> d!73081 m!387743))

(declare-fun m!387745 () Bool)

(assert (=> d!73081 m!387745))

(declare-fun m!387747 () Bool)

(assert (=> d!73081 m!387747))

(declare-fun m!387749 () Bool)

(assert (=> b!391352 m!387749))

(declare-fun m!387751 () Bool)

(assert (=> b!391353 m!387751))

(assert (=> b!391103 d!73081))

(declare-fun mapNonEmpty!16056 () Bool)

(declare-fun mapRes!16056 () Bool)

(declare-fun tp!31698 () Bool)

(declare-fun e!237045 () Bool)

(assert (=> mapNonEmpty!16056 (= mapRes!16056 (and tp!31698 e!237045))))

(declare-fun mapValue!16056 () ValueCell!4479)

(declare-fun mapKey!16056 () (_ BitVec 32))

(declare-fun mapRest!16056 () (Array (_ BitVec 32) ValueCell!4479))

(assert (=> mapNonEmpty!16056 (= mapRest!16050 (store mapRest!16056 mapKey!16056 mapValue!16056))))

(declare-fun condMapEmpty!16056 () Bool)

(declare-fun mapDefault!16056 () ValueCell!4479)

(assert (=> mapNonEmpty!16050 (= condMapEmpty!16056 (= mapRest!16050 ((as const (Array (_ BitVec 32) ValueCell!4479)) mapDefault!16056)))))

(declare-fun e!237044 () Bool)

(assert (=> mapNonEmpty!16050 (= tp!31688 (and e!237044 mapRes!16056))))

(declare-fun b!391360 () Bool)

(assert (=> b!391360 (= e!237045 tp_is_empty!9645)))

(declare-fun b!391361 () Bool)

(assert (=> b!391361 (= e!237044 tp_is_empty!9645)))

(declare-fun mapIsEmpty!16056 () Bool)

(assert (=> mapIsEmpty!16056 mapRes!16056))

(assert (= (and mapNonEmpty!16050 condMapEmpty!16056) mapIsEmpty!16056))

(assert (= (and mapNonEmpty!16050 (not condMapEmpty!16056)) mapNonEmpty!16056))

(assert (= (and mapNonEmpty!16056 ((_ is ValueCellFull!4479) mapValue!16056)) b!391360))

(assert (= (and mapNonEmpty!16050 ((_ is ValueCellFull!4479) mapDefault!16056)) b!391361))

(declare-fun m!387753 () Bool)

(assert (=> mapNonEmpty!16056 m!387753))

(declare-fun b_lambda!8683 () Bool)

(assert (= b_lambda!8679 (or (and start!38004 b_free!8973) b_lambda!8683)))

(declare-fun b_lambda!8685 () Bool)

(assert (= b_lambda!8671 (or (and start!38004 b_free!8973) b_lambda!8685)))

(declare-fun b_lambda!8687 () Bool)

(assert (= b_lambda!8681 (or (and start!38004 b_free!8973) b_lambda!8687)))

(declare-fun b_lambda!8689 () Bool)

(assert (= b_lambda!8673 (or (and start!38004 b_free!8973) b_lambda!8689)))

(declare-fun b_lambda!8691 () Bool)

(assert (= b_lambda!8675 (or (and start!38004 b_free!8973) b_lambda!8691)))

(declare-fun b_lambda!8693 () Bool)

(assert (= b_lambda!8677 (or (and start!38004 b_free!8973) b_lambda!8693)))

(check-sat b_and!16301 (not b!391304) (not b!391192) (not b!391189) (not b_lambda!8683) (not d!73049) (not mapNonEmpty!16056) (not b!391317) (not b_lambda!8685) (not b!391203) (not b_lambda!8689) (not d!73051) (not b!391320) (not b!391239) (not b!391339) (not b!391207) (not b!391293) (not b!391176) (not b!391312) (not bm!27608) (not b!391291) (not bm!27620) (not bm!27626) (not b!391240) (not b!391202) (not b!391177) (not b!391338) (not b!391319) (not bm!27587) (not b!391333) (not b!391243) (not bm!27622) (not d!73071) (not b!391307) (not b!391349) (not b!391188) (not bm!27610) (not bm!27624) (not d!73073) (not b!391310) (not d!73079) (not bm!27589) (not bm!27612) (not bm!27625) (not b!391352) (not b!391296) (not b!391316) (not bm!27614) (not b!391242) (not d!73075) (not b!391237) (not b!391201) (not b_lambda!8687) (not bm!27588) (not b!391235) (not b!391303) (not d!73081) (not b!391345) (not bm!27611) (not b_lambda!8691) (not b!391314) (not d!73065) (not b!391297) (not b!391335) (not b!391346) (not bm!27592) (not b_lambda!8693) (not bm!27619) (not b!391353) (not b!391168) (not b_next!8973) (not b!391205) (not b!391193) (not b!391170) (not b!391171) (not b!391208) (not b!391233) tp_is_empty!9645 (not b!391301) (not b!391178) (not bm!27584) (not b!391321) (not b!391343) (not b!391330) (not d!73077) (not b!391244) (not b!391179))
(check-sat b_and!16301 (not b_next!8973))
