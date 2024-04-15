; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74358 () Bool)

(assert start!74358)

(declare-fun b_free!15139 () Bool)

(declare-fun b_next!15139 () Bool)

(assert (=> start!74358 (= b_free!15139 (not b_next!15139))))

(declare-fun tp!53092 () Bool)

(declare-fun b_and!24889 () Bool)

(assert (=> start!74358 (= tp!53092 b_and!24889)))

(declare-fun b!875408 () Bool)

(declare-fun res!594978 () Bool)

(declare-fun e!487322 () Bool)

(assert (=> b!875408 (=> (not res!594978) (not e!487322))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875408 (= res!594978 (validMask!0 mask!1196))))

(declare-fun b!875409 () Bool)

(declare-fun res!594974 () Bool)

(assert (=> b!875409 (=> (not res!594974) (not e!487322))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!50869 0))(
  ( (array!50870 (arr!24463 (Array (_ BitVec 32) (_ BitVec 64))) (size!24905 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50869)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!875409 (= res!594974 (and (= (select (arr!24463 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!875411 () Bool)

(declare-fun e!487327 () Bool)

(assert (=> b!875411 (= e!487322 e!487327)))

(declare-fun res!594970 () Bool)

(assert (=> b!875411 (=> (not res!594970) (not e!487327))))

(assert (=> b!875411 (= res!594970 (= from!1053 i!612))))

(declare-datatypes ((V!28225 0))(
  ( (V!28226 (val!8739 Int)) )
))
(declare-datatypes ((tuple2!11554 0))(
  ( (tuple2!11555 (_1!5788 (_ BitVec 64)) (_2!5788 V!28225)) )
))
(declare-datatypes ((List!17364 0))(
  ( (Nil!17361) (Cons!17360 (h!18491 tuple2!11554) (t!24398 List!17364)) )
))
(declare-datatypes ((ListLongMap!10313 0))(
  ( (ListLongMap!10314 (toList!5172 List!17364)) )
))
(declare-fun lt!396007 () ListLongMap!10313)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8252 0))(
  ( (ValueCellFull!8252 (v!11162 V!28225)) (EmptyCell!8252) )
))
(declare-datatypes ((array!50871 0))(
  ( (array!50872 (arr!24464 (Array (_ BitVec 32) ValueCell!8252)) (size!24906 (_ BitVec 32))) )
))
(declare-fun lt!396009 () array!50871)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28225)

(declare-fun zeroValue!654 () V!28225)

(declare-fun getCurrentListMapNoExtraKeys!3165 (array!50869 array!50871 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) Int) ListLongMap!10313)

(assert (=> b!875411 (= lt!396007 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28225)

(declare-fun _values!688 () array!50871)

(assert (=> b!875411 (= lt!396009 (array!50872 (store (arr!24464 _values!688) i!612 (ValueCellFull!8252 v!557)) (size!24906 _values!688)))))

(declare-fun lt!396008 () ListLongMap!10313)

(assert (=> b!875411 (= lt!396008 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875412 () Bool)

(declare-fun res!594976 () Bool)

(assert (=> b!875412 (=> (not res!594976) (not e!487322))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875412 (= res!594976 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27683 () Bool)

(declare-fun mapRes!27683 () Bool)

(assert (=> mapIsEmpty!27683 mapRes!27683))

(declare-fun b!875413 () Bool)

(declare-fun res!594972 () Bool)

(assert (=> b!875413 (=> (not res!594972) (not e!487322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50869 (_ BitVec 32)) Bool)

(assert (=> b!875413 (= res!594972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875414 () Bool)

(declare-fun e!487320 () Bool)

(declare-fun tp_is_empty!17383 () Bool)

(assert (=> b!875414 (= e!487320 tp_is_empty!17383)))

(declare-fun b!875415 () Bool)

(declare-fun res!594973 () Bool)

(assert (=> b!875415 (=> (not res!594973) (not e!487322))))

(assert (=> b!875415 (= res!594973 (and (= (size!24906 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24905 _keys!868) (size!24906 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875416 () Bool)

(declare-fun e!487325 () Bool)

(declare-fun +!2499 (ListLongMap!10313 tuple2!11554) ListLongMap!10313)

(declare-fun get!12866 (ValueCell!8252 V!28225) V!28225)

(declare-fun dynLambda!1203 (Int (_ BitVec 64)) V!28225)

(assert (=> b!875416 (= e!487325 (= lt!396007 (+!2499 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!875417 () Bool)

(declare-fun res!594979 () Bool)

(assert (=> b!875417 (=> (not res!594979) (not e!487322))))

(declare-datatypes ((List!17365 0))(
  ( (Nil!17362) (Cons!17361 (h!18492 (_ BitVec 64)) (t!24399 List!17365)) )
))
(declare-fun arrayNoDuplicates!0 (array!50869 (_ BitVec 32) List!17365) Bool)

(assert (=> b!875417 (= res!594979 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17362))))

(declare-fun b!875410 () Bool)

(declare-fun e!487324 () Bool)

(declare-fun e!487326 () Bool)

(assert (=> b!875410 (= e!487324 (and e!487326 mapRes!27683))))

(declare-fun condMapEmpty!27683 () Bool)

(declare-fun mapDefault!27683 () ValueCell!8252)

(assert (=> b!875410 (= condMapEmpty!27683 (= (arr!24464 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8252)) mapDefault!27683)))))

(declare-fun res!594977 () Bool)

(assert (=> start!74358 (=> (not res!594977) (not e!487322))))

(assert (=> start!74358 (= res!594977 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24905 _keys!868))))))

(assert (=> start!74358 e!487322))

(assert (=> start!74358 tp_is_empty!17383))

(assert (=> start!74358 true))

(assert (=> start!74358 tp!53092))

(declare-fun array_inv!19334 (array!50869) Bool)

(assert (=> start!74358 (array_inv!19334 _keys!868)))

(declare-fun array_inv!19335 (array!50871) Bool)

(assert (=> start!74358 (and (array_inv!19335 _values!688) e!487324)))

(declare-fun b!875418 () Bool)

(declare-fun e!487321 () Bool)

(declare-fun call!38617 () ListLongMap!10313)

(declare-fun call!38616 () ListLongMap!10313)

(assert (=> b!875418 (= e!487321 (= call!38617 call!38616))))

(declare-fun b!875419 () Bool)

(assert (=> b!875419 (= e!487321 (= call!38617 (+!2499 call!38616 (tuple2!11555 k0!854 v!557))))))

(declare-fun b!875420 () Bool)

(assert (=> b!875420 (= e!487327 (not e!487325))))

(declare-fun res!594971 () Bool)

(assert (=> b!875420 (=> res!594971 e!487325)))

(assert (=> b!875420 (= res!594971 (not (validKeyInArray!0 (select (arr!24463 _keys!868) from!1053))))))

(assert (=> b!875420 e!487321))

(declare-fun c!92457 () Bool)

(assert (=> b!875420 (= c!92457 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29893 0))(
  ( (Unit!29894) )
))
(declare-fun lt!396006 () Unit!29893)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!669 (array!50869 array!50871 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) (_ BitVec 64) V!28225 (_ BitVec 32) Int) Unit!29893)

(assert (=> b!875420 (= lt!396006 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!669 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!875421 () Bool)

(assert (=> b!875421 (= e!487326 tp_is_empty!17383)))

(declare-fun b!875422 () Bool)

(declare-fun res!594975 () Bool)

(assert (=> b!875422 (=> (not res!594975) (not e!487322))))

(assert (=> b!875422 (= res!594975 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24905 _keys!868))))))

(declare-fun bm!38613 () Bool)

(assert (=> bm!38613 (= call!38616 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapNonEmpty!27683 () Bool)

(declare-fun tp!53093 () Bool)

(assert (=> mapNonEmpty!27683 (= mapRes!27683 (and tp!53093 e!487320))))

(declare-fun mapValue!27683 () ValueCell!8252)

(declare-fun mapKey!27683 () (_ BitVec 32))

(declare-fun mapRest!27683 () (Array (_ BitVec 32) ValueCell!8252))

(assert (=> mapNonEmpty!27683 (= (arr!24464 _values!688) (store mapRest!27683 mapKey!27683 mapValue!27683))))

(declare-fun bm!38614 () Bool)

(assert (=> bm!38614 (= call!38617 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!74358 res!594977) b!875408))

(assert (= (and b!875408 res!594978) b!875415))

(assert (= (and b!875415 res!594973) b!875413))

(assert (= (and b!875413 res!594972) b!875417))

(assert (= (and b!875417 res!594979) b!875422))

(assert (= (and b!875422 res!594975) b!875412))

(assert (= (and b!875412 res!594976) b!875409))

(assert (= (and b!875409 res!594974) b!875411))

(assert (= (and b!875411 res!594970) b!875420))

(assert (= (and b!875420 c!92457) b!875419))

(assert (= (and b!875420 (not c!92457)) b!875418))

(assert (= (or b!875419 b!875418) bm!38614))

(assert (= (or b!875419 b!875418) bm!38613))

(assert (= (and b!875420 (not res!594971)) b!875416))

(assert (= (and b!875410 condMapEmpty!27683) mapIsEmpty!27683))

(assert (= (and b!875410 (not condMapEmpty!27683)) mapNonEmpty!27683))

(get-info :version)

(assert (= (and mapNonEmpty!27683 ((_ is ValueCellFull!8252) mapValue!27683)) b!875414))

(assert (= (and b!875410 ((_ is ValueCellFull!8252) mapDefault!27683)) b!875421))

(assert (= start!74358 b!875410))

(declare-fun b_lambda!12155 () Bool)

(assert (=> (not b_lambda!12155) (not b!875416)))

(declare-fun t!24397 () Bool)

(declare-fun tb!4891 () Bool)

(assert (=> (and start!74358 (= defaultEntry!696 defaultEntry!696) t!24397) tb!4891))

(declare-fun result!9407 () Bool)

(assert (=> tb!4891 (= result!9407 tp_is_empty!17383)))

(assert (=> b!875416 t!24397))

(declare-fun b_and!24891 () Bool)

(assert (= b_and!24889 (and (=> t!24397 result!9407) b_and!24891)))

(declare-fun m!814703 () Bool)

(assert (=> b!875420 m!814703))

(assert (=> b!875420 m!814703))

(declare-fun m!814705 () Bool)

(assert (=> b!875420 m!814705))

(declare-fun m!814707 () Bool)

(assert (=> b!875420 m!814707))

(declare-fun m!814709 () Bool)

(assert (=> b!875411 m!814709))

(declare-fun m!814711 () Bool)

(assert (=> b!875411 m!814711))

(declare-fun m!814713 () Bool)

(assert (=> b!875411 m!814713))

(declare-fun m!814715 () Bool)

(assert (=> b!875419 m!814715))

(declare-fun m!814717 () Bool)

(assert (=> mapNonEmpty!27683 m!814717))

(declare-fun m!814719 () Bool)

(assert (=> b!875413 m!814719))

(declare-fun m!814721 () Bool)

(assert (=> b!875412 m!814721))

(declare-fun m!814723 () Bool)

(assert (=> b!875417 m!814723))

(declare-fun m!814725 () Bool)

(assert (=> start!74358 m!814725))

(declare-fun m!814727 () Bool)

(assert (=> start!74358 m!814727))

(declare-fun m!814729 () Bool)

(assert (=> b!875409 m!814729))

(declare-fun m!814731 () Bool)

(assert (=> b!875416 m!814731))

(declare-fun m!814733 () Bool)

(assert (=> b!875416 m!814733))

(assert (=> b!875416 m!814731))

(declare-fun m!814735 () Bool)

(assert (=> b!875416 m!814735))

(assert (=> b!875416 m!814733))

(declare-fun m!814737 () Bool)

(assert (=> b!875416 m!814737))

(declare-fun m!814739 () Bool)

(assert (=> b!875416 m!814739))

(assert (=> b!875416 m!814703))

(assert (=> b!875416 m!814737))

(assert (=> bm!38614 m!814731))

(declare-fun m!814741 () Bool)

(assert (=> b!875408 m!814741))

(declare-fun m!814743 () Bool)

(assert (=> bm!38613 m!814743))

(check-sat (not b_lambda!12155) (not b!875411) (not b!875417) tp_is_empty!17383 (not b!875420) (not bm!38613) (not bm!38614) (not mapNonEmpty!27683) (not b_next!15139) b_and!24891 (not b!875408) (not b!875416) (not start!74358) (not b!875419) (not b!875413) (not b!875412))
(check-sat b_and!24891 (not b_next!15139))
(get-model)

(declare-fun b_lambda!12161 () Bool)

(assert (= b_lambda!12155 (or (and start!74358 b_free!15139) b_lambda!12161)))

(check-sat (not b!875411) (not b!875417) (not b!875420) (not bm!38613) (not bm!38614) (not mapNonEmpty!27683) (not b_next!15139) (not b_lambda!12161) tp_is_empty!17383 b_and!24891 (not b!875408) (not b!875416) (not start!74358) (not b!875419) (not b!875413) (not b!875412))
(check-sat b_and!24891 (not b_next!15139))
(get-model)

(declare-fun b!875529 () Bool)

(declare-fun e!487386 () Bool)

(declare-fun call!38632 () Bool)

(assert (=> b!875529 (= e!487386 call!38632)))

(declare-fun b!875530 () Bool)

(declare-fun e!487384 () Bool)

(declare-fun contains!4219 (List!17365 (_ BitVec 64)) Bool)

(assert (=> b!875530 (= e!487384 (contains!4219 Nil!17362 (select (arr!24463 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!875531 () Bool)

(declare-fun e!487387 () Bool)

(assert (=> b!875531 (= e!487387 e!487386)))

(declare-fun c!92466 () Bool)

(assert (=> b!875531 (= c!92466 (validKeyInArray!0 (select (arr!24463 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun d!108379 () Bool)

(declare-fun res!595048 () Bool)

(declare-fun e!487385 () Bool)

(assert (=> d!108379 (=> res!595048 e!487385)))

(assert (=> d!108379 (= res!595048 (bvsge #b00000000000000000000000000000000 (size!24905 _keys!868)))))

(assert (=> d!108379 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17362) e!487385)))

(declare-fun bm!38629 () Bool)

(assert (=> bm!38629 (= call!38632 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92466 (Cons!17361 (select (arr!24463 _keys!868) #b00000000000000000000000000000000) Nil!17362) Nil!17362)))))

(declare-fun b!875532 () Bool)

(assert (=> b!875532 (= e!487386 call!38632)))

(declare-fun b!875533 () Bool)

(assert (=> b!875533 (= e!487385 e!487387)))

(declare-fun res!595047 () Bool)

(assert (=> b!875533 (=> (not res!595047) (not e!487387))))

(assert (=> b!875533 (= res!595047 (not e!487384))))

(declare-fun res!595046 () Bool)

(assert (=> b!875533 (=> (not res!595046) (not e!487384))))

(assert (=> b!875533 (= res!595046 (validKeyInArray!0 (select (arr!24463 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108379 (not res!595048)) b!875533))

(assert (= (and b!875533 res!595046) b!875530))

(assert (= (and b!875533 res!595047) b!875531))

(assert (= (and b!875531 c!92466) b!875532))

(assert (= (and b!875531 (not c!92466)) b!875529))

(assert (= (or b!875532 b!875529) bm!38629))

(declare-fun m!814829 () Bool)

(assert (=> b!875530 m!814829))

(assert (=> b!875530 m!814829))

(declare-fun m!814831 () Bool)

(assert (=> b!875530 m!814831))

(assert (=> b!875531 m!814829))

(assert (=> b!875531 m!814829))

(declare-fun m!814833 () Bool)

(assert (=> b!875531 m!814833))

(assert (=> bm!38629 m!814829))

(declare-fun m!814835 () Bool)

(assert (=> bm!38629 m!814835))

(assert (=> b!875533 m!814829))

(assert (=> b!875533 m!814829))

(assert (=> b!875533 m!814833))

(assert (=> b!875417 d!108379))

(declare-fun d!108381 () Bool)

(assert (=> d!108381 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!875408 d!108381))

(declare-fun b!875558 () Bool)

(declare-fun e!487408 () ListLongMap!10313)

(declare-fun e!487403 () ListLongMap!10313)

(assert (=> b!875558 (= e!487408 e!487403)))

(declare-fun c!92478 () Bool)

(assert (=> b!875558 (= c!92478 (validKeyInArray!0 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!875559 () Bool)

(declare-fun call!38635 () ListLongMap!10313)

(assert (=> b!875559 (= e!487403 call!38635)))

(declare-fun b!875560 () Bool)

(declare-fun e!487404 () Bool)

(assert (=> b!875560 (= e!487404 (validKeyInArray!0 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875560 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38632 () Bool)

(assert (=> bm!38632 (= call!38635 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875561 () Bool)

(declare-fun e!487402 () Bool)

(declare-fun e!487407 () Bool)

(assert (=> b!875561 (= e!487402 e!487407)))

(declare-fun c!92476 () Bool)

(assert (=> b!875561 (= c!92476 e!487404)))

(declare-fun res!595060 () Bool)

(assert (=> b!875561 (=> (not res!595060) (not e!487404))))

(assert (=> b!875561 (= res!595060 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(declare-fun b!875562 () Bool)

(declare-fun e!487405 () Bool)

(assert (=> b!875562 (= e!487407 e!487405)))

(assert (=> b!875562 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(declare-fun res!595058 () Bool)

(declare-fun lt!396049 () ListLongMap!10313)

(declare-fun contains!4220 (ListLongMap!10313 (_ BitVec 64)) Bool)

(assert (=> b!875562 (= res!595058 (contains!4220 lt!396049 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875562 (=> (not res!595058) (not e!487405))))

(declare-fun b!875563 () Bool)

(declare-fun lt!396054 () Unit!29893)

(declare-fun lt!396048 () Unit!29893)

(assert (=> b!875563 (= lt!396054 lt!396048)))

(declare-fun lt!396051 () ListLongMap!10313)

(declare-fun lt!396053 () (_ BitVec 64))

(declare-fun lt!396052 () (_ BitVec 64))

(declare-fun lt!396050 () V!28225)

(assert (=> b!875563 (not (contains!4220 (+!2499 lt!396051 (tuple2!11555 lt!396053 lt!396050)) lt!396052))))

(declare-fun addStillNotContains!202 (ListLongMap!10313 (_ BitVec 64) V!28225 (_ BitVec 64)) Unit!29893)

(assert (=> b!875563 (= lt!396048 (addStillNotContains!202 lt!396051 lt!396053 lt!396050 lt!396052))))

(assert (=> b!875563 (= lt!396052 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875563 (= lt!396050 (get!12866 (select (arr!24464 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875563 (= lt!396053 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!875563 (= lt!396051 call!38635)))

(assert (=> b!875563 (= e!487403 (+!2499 call!38635 (tuple2!11555 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12866 (select (arr!24464 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!108383 () Bool)

(assert (=> d!108383 e!487402))

(declare-fun res!595059 () Bool)

(assert (=> d!108383 (=> (not res!595059) (not e!487402))))

(assert (=> d!108383 (= res!595059 (not (contains!4220 lt!396049 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108383 (= lt!396049 e!487408)))

(declare-fun c!92477 () Bool)

(assert (=> d!108383 (= c!92477 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(assert (=> d!108383 (validMask!0 mask!1196)))

(assert (=> d!108383 (= (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396049)))

(declare-fun b!875564 () Bool)

(declare-fun e!487406 () Bool)

(assert (=> b!875564 (= e!487407 e!487406)))

(declare-fun c!92475 () Bool)

(assert (=> b!875564 (= c!92475 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(declare-fun b!875565 () Bool)

(assert (=> b!875565 (= e!487406 (= lt!396049 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875566 () Bool)

(declare-fun res!595057 () Bool)

(assert (=> b!875566 (=> (not res!595057) (not e!487402))))

(assert (=> b!875566 (= res!595057 (not (contains!4220 lt!396049 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875567 () Bool)

(declare-fun isEmpty!667 (ListLongMap!10313) Bool)

(assert (=> b!875567 (= e!487406 (isEmpty!667 lt!396049))))

(declare-fun b!875568 () Bool)

(assert (=> b!875568 (= e!487408 (ListLongMap!10314 Nil!17361))))

(declare-fun b!875569 () Bool)

(assert (=> b!875569 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(assert (=> b!875569 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24906 _values!688)))))

(declare-fun apply!376 (ListLongMap!10313 (_ BitVec 64)) V!28225)

(assert (=> b!875569 (= e!487405 (= (apply!376 lt!396049 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12866 (select (arr!24464 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108383 c!92477) b!875568))

(assert (= (and d!108383 (not c!92477)) b!875558))

(assert (= (and b!875558 c!92478) b!875563))

(assert (= (and b!875558 (not c!92478)) b!875559))

(assert (= (or b!875563 b!875559) bm!38632))

(assert (= (and d!108383 res!595059) b!875566))

(assert (= (and b!875566 res!595057) b!875561))

(assert (= (and b!875561 res!595060) b!875560))

(assert (= (and b!875561 c!92476) b!875562))

(assert (= (and b!875561 (not c!92476)) b!875564))

(assert (= (and b!875562 res!595058) b!875569))

(assert (= (and b!875564 c!92475) b!875565))

(assert (= (and b!875564 (not c!92475)) b!875567))

(declare-fun b_lambda!12163 () Bool)

(assert (=> (not b_lambda!12163) (not b!875563)))

(assert (=> b!875563 t!24397))

(declare-fun b_and!24901 () Bool)

(assert (= b_and!24891 (and (=> t!24397 result!9407) b_and!24901)))

(declare-fun b_lambda!12165 () Bool)

(assert (=> (not b_lambda!12165) (not b!875569)))

(assert (=> b!875569 t!24397))

(declare-fun b_and!24903 () Bool)

(assert (= b_and!24901 (and (=> t!24397 result!9407) b_and!24903)))

(declare-fun m!814837 () Bool)

(assert (=> b!875560 m!814837))

(assert (=> b!875560 m!814837))

(declare-fun m!814839 () Bool)

(assert (=> b!875560 m!814839))

(assert (=> b!875558 m!814837))

(assert (=> b!875558 m!814837))

(assert (=> b!875558 m!814839))

(declare-fun m!814841 () Bool)

(assert (=> b!875566 m!814841))

(declare-fun m!814843 () Bool)

(assert (=> bm!38632 m!814843))

(assert (=> b!875563 m!814837))

(declare-fun m!814845 () Bool)

(assert (=> b!875563 m!814845))

(declare-fun m!814847 () Bool)

(assert (=> b!875563 m!814847))

(assert (=> b!875563 m!814845))

(declare-fun m!814849 () Bool)

(assert (=> b!875563 m!814849))

(assert (=> b!875563 m!814847))

(assert (=> b!875563 m!814737))

(declare-fun m!814851 () Bool)

(assert (=> b!875563 m!814851))

(declare-fun m!814853 () Bool)

(assert (=> b!875563 m!814853))

(assert (=> b!875563 m!814737))

(declare-fun m!814855 () Bool)

(assert (=> b!875563 m!814855))

(assert (=> b!875565 m!814843))

(assert (=> b!875562 m!814837))

(assert (=> b!875562 m!814837))

(declare-fun m!814857 () Bool)

(assert (=> b!875562 m!814857))

(declare-fun m!814859 () Bool)

(assert (=> b!875567 m!814859))

(assert (=> b!875569 m!814837))

(assert (=> b!875569 m!814837))

(declare-fun m!814861 () Bool)

(assert (=> b!875569 m!814861))

(assert (=> b!875569 m!814847))

(assert (=> b!875569 m!814847))

(assert (=> b!875569 m!814737))

(assert (=> b!875569 m!814851))

(assert (=> b!875569 m!814737))

(declare-fun m!814863 () Bool)

(assert (=> d!108383 m!814863))

(assert (=> d!108383 m!814741))

(assert (=> bm!38613 d!108383))

(declare-fun b!875570 () Bool)

(declare-fun e!487415 () ListLongMap!10313)

(declare-fun e!487410 () ListLongMap!10313)

(assert (=> b!875570 (= e!487415 e!487410)))

(declare-fun c!92482 () Bool)

(assert (=> b!875570 (= c!92482 (validKeyInArray!0 (select (arr!24463 _keys!868) from!1053)))))

(declare-fun b!875571 () Bool)

(declare-fun call!38636 () ListLongMap!10313)

(assert (=> b!875571 (= e!487410 call!38636)))

(declare-fun b!875572 () Bool)

(declare-fun e!487411 () Bool)

(assert (=> b!875572 (= e!487411 (validKeyInArray!0 (select (arr!24463 _keys!868) from!1053)))))

(assert (=> b!875572 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun bm!38633 () Bool)

(assert (=> bm!38633 (= call!38636 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875573 () Bool)

(declare-fun e!487409 () Bool)

(declare-fun e!487414 () Bool)

(assert (=> b!875573 (= e!487409 e!487414)))

(declare-fun c!92480 () Bool)

(assert (=> b!875573 (= c!92480 e!487411)))

(declare-fun res!595064 () Bool)

(assert (=> b!875573 (=> (not res!595064) (not e!487411))))

(assert (=> b!875573 (= res!595064 (bvslt from!1053 (size!24905 _keys!868)))))

(declare-fun b!875574 () Bool)

(declare-fun e!487412 () Bool)

(assert (=> b!875574 (= e!487414 e!487412)))

(assert (=> b!875574 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24905 _keys!868)))))

(declare-fun lt!396056 () ListLongMap!10313)

(declare-fun res!595062 () Bool)

(assert (=> b!875574 (= res!595062 (contains!4220 lt!396056 (select (arr!24463 _keys!868) from!1053)))))

(assert (=> b!875574 (=> (not res!595062) (not e!487412))))

(declare-fun b!875575 () Bool)

(declare-fun lt!396061 () Unit!29893)

(declare-fun lt!396055 () Unit!29893)

(assert (=> b!875575 (= lt!396061 lt!396055)))

(declare-fun lt!396059 () (_ BitVec 64))

(declare-fun lt!396057 () V!28225)

(declare-fun lt!396058 () ListLongMap!10313)

(declare-fun lt!396060 () (_ BitVec 64))

(assert (=> b!875575 (not (contains!4220 (+!2499 lt!396058 (tuple2!11555 lt!396060 lt!396057)) lt!396059))))

(assert (=> b!875575 (= lt!396055 (addStillNotContains!202 lt!396058 lt!396060 lt!396057 lt!396059))))

(assert (=> b!875575 (= lt!396059 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875575 (= lt!396057 (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875575 (= lt!396060 (select (arr!24463 _keys!868) from!1053))))

(assert (=> b!875575 (= lt!396058 call!38636)))

(assert (=> b!875575 (= e!487410 (+!2499 call!38636 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!108385 () Bool)

(assert (=> d!108385 e!487409))

(declare-fun res!595063 () Bool)

(assert (=> d!108385 (=> (not res!595063) (not e!487409))))

(assert (=> d!108385 (= res!595063 (not (contains!4220 lt!396056 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108385 (= lt!396056 e!487415)))

(declare-fun c!92481 () Bool)

(assert (=> d!108385 (= c!92481 (bvsge from!1053 (size!24905 _keys!868)))))

(assert (=> d!108385 (validMask!0 mask!1196)))

(assert (=> d!108385 (= (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396056)))

(declare-fun b!875576 () Bool)

(declare-fun e!487413 () Bool)

(assert (=> b!875576 (= e!487414 e!487413)))

(declare-fun c!92479 () Bool)

(assert (=> b!875576 (= c!92479 (bvslt from!1053 (size!24905 _keys!868)))))

(declare-fun b!875577 () Bool)

(assert (=> b!875577 (= e!487413 (= lt!396056 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875578 () Bool)

(declare-fun res!595061 () Bool)

(assert (=> b!875578 (=> (not res!595061) (not e!487409))))

(assert (=> b!875578 (= res!595061 (not (contains!4220 lt!396056 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875579 () Bool)

(assert (=> b!875579 (= e!487413 (isEmpty!667 lt!396056))))

(declare-fun b!875580 () Bool)

(assert (=> b!875580 (= e!487415 (ListLongMap!10314 Nil!17361))))

(declare-fun b!875581 () Bool)

(assert (=> b!875581 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24905 _keys!868)))))

(assert (=> b!875581 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24906 lt!396009)))))

(assert (=> b!875581 (= e!487412 (= (apply!376 lt!396056 (select (arr!24463 _keys!868) from!1053)) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108385 c!92481) b!875580))

(assert (= (and d!108385 (not c!92481)) b!875570))

(assert (= (and b!875570 c!92482) b!875575))

(assert (= (and b!875570 (not c!92482)) b!875571))

(assert (= (or b!875575 b!875571) bm!38633))

(assert (= (and d!108385 res!595063) b!875578))

(assert (= (and b!875578 res!595061) b!875573))

(assert (= (and b!875573 res!595064) b!875572))

(assert (= (and b!875573 c!92480) b!875574))

(assert (= (and b!875573 (not c!92480)) b!875576))

(assert (= (and b!875574 res!595062) b!875581))

(assert (= (and b!875576 c!92479) b!875577))

(assert (= (and b!875576 (not c!92479)) b!875579))

(declare-fun b_lambda!12167 () Bool)

(assert (=> (not b_lambda!12167) (not b!875575)))

(assert (=> b!875575 t!24397))

(declare-fun b_and!24905 () Bool)

(assert (= b_and!24903 (and (=> t!24397 result!9407) b_and!24905)))

(declare-fun b_lambda!12169 () Bool)

(assert (=> (not b_lambda!12169) (not b!875581)))

(assert (=> b!875581 t!24397))

(declare-fun b_and!24907 () Bool)

(assert (= b_and!24905 (and (=> t!24397 result!9407) b_and!24907)))

(assert (=> b!875572 m!814703))

(assert (=> b!875572 m!814703))

(assert (=> b!875572 m!814705))

(assert (=> b!875570 m!814703))

(assert (=> b!875570 m!814703))

(assert (=> b!875570 m!814705))

(declare-fun m!814865 () Bool)

(assert (=> b!875578 m!814865))

(declare-fun m!814867 () Bool)

(assert (=> bm!38633 m!814867))

(assert (=> b!875575 m!814703))

(declare-fun m!814869 () Bool)

(assert (=> b!875575 m!814869))

(assert (=> b!875575 m!814733))

(assert (=> b!875575 m!814869))

(declare-fun m!814871 () Bool)

(assert (=> b!875575 m!814871))

(assert (=> b!875575 m!814733))

(assert (=> b!875575 m!814737))

(assert (=> b!875575 m!814739))

(declare-fun m!814873 () Bool)

(assert (=> b!875575 m!814873))

(assert (=> b!875575 m!814737))

(declare-fun m!814875 () Bool)

(assert (=> b!875575 m!814875))

(assert (=> b!875577 m!814867))

(assert (=> b!875574 m!814703))

(assert (=> b!875574 m!814703))

(declare-fun m!814877 () Bool)

(assert (=> b!875574 m!814877))

(declare-fun m!814879 () Bool)

(assert (=> b!875579 m!814879))

(assert (=> b!875581 m!814703))

(assert (=> b!875581 m!814703))

(declare-fun m!814881 () Bool)

(assert (=> b!875581 m!814881))

(assert (=> b!875581 m!814733))

(assert (=> b!875581 m!814733))

(assert (=> b!875581 m!814737))

(assert (=> b!875581 m!814739))

(assert (=> b!875581 m!814737))

(declare-fun m!814883 () Bool)

(assert (=> d!108385 m!814883))

(assert (=> d!108385 m!814741))

(assert (=> b!875411 d!108385))

(declare-fun b!875582 () Bool)

(declare-fun e!487422 () ListLongMap!10313)

(declare-fun e!487417 () ListLongMap!10313)

(assert (=> b!875582 (= e!487422 e!487417)))

(declare-fun c!92486 () Bool)

(assert (=> b!875582 (= c!92486 (validKeyInArray!0 (select (arr!24463 _keys!868) from!1053)))))

(declare-fun b!875583 () Bool)

(declare-fun call!38637 () ListLongMap!10313)

(assert (=> b!875583 (= e!487417 call!38637)))

(declare-fun b!875584 () Bool)

(declare-fun e!487418 () Bool)

(assert (=> b!875584 (= e!487418 (validKeyInArray!0 (select (arr!24463 _keys!868) from!1053)))))

(assert (=> b!875584 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun bm!38634 () Bool)

(assert (=> bm!38634 (= call!38637 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875585 () Bool)

(declare-fun e!487416 () Bool)

(declare-fun e!487421 () Bool)

(assert (=> b!875585 (= e!487416 e!487421)))

(declare-fun c!92484 () Bool)

(assert (=> b!875585 (= c!92484 e!487418)))

(declare-fun res!595068 () Bool)

(assert (=> b!875585 (=> (not res!595068) (not e!487418))))

(assert (=> b!875585 (= res!595068 (bvslt from!1053 (size!24905 _keys!868)))))

(declare-fun b!875586 () Bool)

(declare-fun e!487419 () Bool)

(assert (=> b!875586 (= e!487421 e!487419)))

(assert (=> b!875586 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24905 _keys!868)))))

(declare-fun lt!396063 () ListLongMap!10313)

(declare-fun res!595066 () Bool)

(assert (=> b!875586 (= res!595066 (contains!4220 lt!396063 (select (arr!24463 _keys!868) from!1053)))))

(assert (=> b!875586 (=> (not res!595066) (not e!487419))))

(declare-fun b!875587 () Bool)

(declare-fun lt!396068 () Unit!29893)

(declare-fun lt!396062 () Unit!29893)

(assert (=> b!875587 (= lt!396068 lt!396062)))

(declare-fun lt!396066 () (_ BitVec 64))

(declare-fun lt!396067 () (_ BitVec 64))

(declare-fun lt!396065 () ListLongMap!10313)

(declare-fun lt!396064 () V!28225)

(assert (=> b!875587 (not (contains!4220 (+!2499 lt!396065 (tuple2!11555 lt!396067 lt!396064)) lt!396066))))

(assert (=> b!875587 (= lt!396062 (addStillNotContains!202 lt!396065 lt!396067 lt!396064 lt!396066))))

(assert (=> b!875587 (= lt!396066 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875587 (= lt!396064 (get!12866 (select (arr!24464 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875587 (= lt!396067 (select (arr!24463 _keys!868) from!1053))))

(assert (=> b!875587 (= lt!396065 call!38637)))

(assert (=> b!875587 (= e!487417 (+!2499 call!38637 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!108387 () Bool)

(assert (=> d!108387 e!487416))

(declare-fun res!595067 () Bool)

(assert (=> d!108387 (=> (not res!595067) (not e!487416))))

(assert (=> d!108387 (= res!595067 (not (contains!4220 lt!396063 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108387 (= lt!396063 e!487422)))

(declare-fun c!92485 () Bool)

(assert (=> d!108387 (= c!92485 (bvsge from!1053 (size!24905 _keys!868)))))

(assert (=> d!108387 (validMask!0 mask!1196)))

(assert (=> d!108387 (= (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!396063)))

(declare-fun b!875588 () Bool)

(declare-fun e!487420 () Bool)

(assert (=> b!875588 (= e!487421 e!487420)))

(declare-fun c!92483 () Bool)

(assert (=> b!875588 (= c!92483 (bvslt from!1053 (size!24905 _keys!868)))))

(declare-fun b!875589 () Bool)

(assert (=> b!875589 (= e!487420 (= lt!396063 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875590 () Bool)

(declare-fun res!595065 () Bool)

(assert (=> b!875590 (=> (not res!595065) (not e!487416))))

(assert (=> b!875590 (= res!595065 (not (contains!4220 lt!396063 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875591 () Bool)

(assert (=> b!875591 (= e!487420 (isEmpty!667 lt!396063))))

(declare-fun b!875592 () Bool)

(assert (=> b!875592 (= e!487422 (ListLongMap!10314 Nil!17361))))

(declare-fun b!875593 () Bool)

(assert (=> b!875593 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24905 _keys!868)))))

(assert (=> b!875593 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24906 _values!688)))))

(assert (=> b!875593 (= e!487419 (= (apply!376 lt!396063 (select (arr!24463 _keys!868) from!1053)) (get!12866 (select (arr!24464 _values!688) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108387 c!92485) b!875592))

(assert (= (and d!108387 (not c!92485)) b!875582))

(assert (= (and b!875582 c!92486) b!875587))

(assert (= (and b!875582 (not c!92486)) b!875583))

(assert (= (or b!875587 b!875583) bm!38634))

(assert (= (and d!108387 res!595067) b!875590))

(assert (= (and b!875590 res!595065) b!875585))

(assert (= (and b!875585 res!595068) b!875584))

(assert (= (and b!875585 c!92484) b!875586))

(assert (= (and b!875585 (not c!92484)) b!875588))

(assert (= (and b!875586 res!595066) b!875593))

(assert (= (and b!875588 c!92483) b!875589))

(assert (= (and b!875588 (not c!92483)) b!875591))

(declare-fun b_lambda!12171 () Bool)

(assert (=> (not b_lambda!12171) (not b!875587)))

(assert (=> b!875587 t!24397))

(declare-fun b_and!24909 () Bool)

(assert (= b_and!24907 (and (=> t!24397 result!9407) b_and!24909)))

(declare-fun b_lambda!12173 () Bool)

(assert (=> (not b_lambda!12173) (not b!875593)))

(assert (=> b!875593 t!24397))

(declare-fun b_and!24911 () Bool)

(assert (= b_and!24909 (and (=> t!24397 result!9407) b_and!24911)))

(assert (=> b!875584 m!814703))

(assert (=> b!875584 m!814703))

(assert (=> b!875584 m!814705))

(assert (=> b!875582 m!814703))

(assert (=> b!875582 m!814703))

(assert (=> b!875582 m!814705))

(declare-fun m!814885 () Bool)

(assert (=> b!875590 m!814885))

(declare-fun m!814887 () Bool)

(assert (=> bm!38634 m!814887))

(assert (=> b!875587 m!814703))

(declare-fun m!814889 () Bool)

(assert (=> b!875587 m!814889))

(declare-fun m!814891 () Bool)

(assert (=> b!875587 m!814891))

(assert (=> b!875587 m!814889))

(declare-fun m!814893 () Bool)

(assert (=> b!875587 m!814893))

(assert (=> b!875587 m!814891))

(assert (=> b!875587 m!814737))

(declare-fun m!814895 () Bool)

(assert (=> b!875587 m!814895))

(declare-fun m!814897 () Bool)

(assert (=> b!875587 m!814897))

(assert (=> b!875587 m!814737))

(declare-fun m!814899 () Bool)

(assert (=> b!875587 m!814899))

(assert (=> b!875589 m!814887))

(assert (=> b!875586 m!814703))

(assert (=> b!875586 m!814703))

(declare-fun m!814901 () Bool)

(assert (=> b!875586 m!814901))

(declare-fun m!814903 () Bool)

(assert (=> b!875591 m!814903))

(assert (=> b!875593 m!814703))

(assert (=> b!875593 m!814703))

(declare-fun m!814905 () Bool)

(assert (=> b!875593 m!814905))

(assert (=> b!875593 m!814891))

(assert (=> b!875593 m!814891))

(assert (=> b!875593 m!814737))

(assert (=> b!875593 m!814895))

(assert (=> b!875593 m!814737))

(declare-fun m!814907 () Bool)

(assert (=> d!108387 m!814907))

(assert (=> d!108387 m!814741))

(assert (=> b!875411 d!108387))

(declare-fun d!108389 () Bool)

(declare-fun e!487425 () Bool)

(assert (=> d!108389 e!487425))

(declare-fun res!595073 () Bool)

(assert (=> d!108389 (=> (not res!595073) (not e!487425))))

(declare-fun lt!396077 () ListLongMap!10313)

(assert (=> d!108389 (= res!595073 (contains!4220 lt!396077 (_1!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!396080 () List!17364)

(assert (=> d!108389 (= lt!396077 (ListLongMap!10314 lt!396080))))

(declare-fun lt!396078 () Unit!29893)

(declare-fun lt!396079 () Unit!29893)

(assert (=> d!108389 (= lt!396078 lt!396079)))

(declare-datatypes ((Option!422 0))(
  ( (Some!421 (v!11168 V!28225)) (None!420) )
))
(declare-fun getValueByKey!416 (List!17364 (_ BitVec 64)) Option!422)

(assert (=> d!108389 (= (getValueByKey!416 lt!396080 (_1!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!233 (List!17364 (_ BitVec 64) V!28225) Unit!29893)

(assert (=> d!108389 (= lt!396079 (lemmaContainsTupThenGetReturnValue!233 lt!396080 (_1!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun insertStrictlySorted!272 (List!17364 (_ BitVec 64) V!28225) List!17364)

(assert (=> d!108389 (= lt!396080 (insertStrictlySorted!272 (toList!5172 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696)) (_1!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!108389 (= (+!2499 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!396077)))

(declare-fun b!875598 () Bool)

(declare-fun res!595074 () Bool)

(assert (=> b!875598 (=> (not res!595074) (not e!487425))))

(assert (=> b!875598 (= res!595074 (= (getValueByKey!416 (toList!5172 lt!396077) (_1!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5788 (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!875599 () Bool)

(declare-fun contains!4221 (List!17364 tuple2!11554) Bool)

(assert (=> b!875599 (= e!487425 (contains!4221 (toList!5172 lt!396077) (tuple2!11555 (select (arr!24463 _keys!868) from!1053) (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!108389 res!595073) b!875598))

(assert (= (and b!875598 res!595074) b!875599))

(declare-fun m!814909 () Bool)

(assert (=> d!108389 m!814909))

(declare-fun m!814911 () Bool)

(assert (=> d!108389 m!814911))

(declare-fun m!814913 () Bool)

(assert (=> d!108389 m!814913))

(declare-fun m!814915 () Bool)

(assert (=> d!108389 m!814915))

(declare-fun m!814917 () Bool)

(assert (=> b!875598 m!814917))

(declare-fun m!814919 () Bool)

(assert (=> b!875599 m!814919))

(assert (=> b!875416 d!108389))

(declare-fun b!875600 () Bool)

(declare-fun e!487432 () ListLongMap!10313)

(declare-fun e!487427 () ListLongMap!10313)

(assert (=> b!875600 (= e!487432 e!487427)))

(declare-fun c!92490 () Bool)

(assert (=> b!875600 (= c!92490 (validKeyInArray!0 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!875601 () Bool)

(declare-fun call!38638 () ListLongMap!10313)

(assert (=> b!875601 (= e!487427 call!38638)))

(declare-fun b!875602 () Bool)

(declare-fun e!487428 () Bool)

(assert (=> b!875602 (= e!487428 (validKeyInArray!0 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875602 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun bm!38635 () Bool)

(assert (=> bm!38635 (= call!38638 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(declare-fun b!875603 () Bool)

(declare-fun e!487426 () Bool)

(declare-fun e!487431 () Bool)

(assert (=> b!875603 (= e!487426 e!487431)))

(declare-fun c!92488 () Bool)

(assert (=> b!875603 (= c!92488 e!487428)))

(declare-fun res!595078 () Bool)

(assert (=> b!875603 (=> (not res!595078) (not e!487428))))

(assert (=> b!875603 (= res!595078 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(declare-fun b!875604 () Bool)

(declare-fun e!487429 () Bool)

(assert (=> b!875604 (= e!487431 e!487429)))

(assert (=> b!875604 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(declare-fun res!595076 () Bool)

(declare-fun lt!396082 () ListLongMap!10313)

(assert (=> b!875604 (= res!595076 (contains!4220 lt!396082 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!875604 (=> (not res!595076) (not e!487429))))

(declare-fun b!875605 () Bool)

(declare-fun lt!396087 () Unit!29893)

(declare-fun lt!396081 () Unit!29893)

(assert (=> b!875605 (= lt!396087 lt!396081)))

(declare-fun lt!396083 () V!28225)

(declare-fun lt!396085 () (_ BitVec 64))

(declare-fun lt!396086 () (_ BitVec 64))

(declare-fun lt!396084 () ListLongMap!10313)

(assert (=> b!875605 (not (contains!4220 (+!2499 lt!396084 (tuple2!11555 lt!396086 lt!396083)) lt!396085))))

(assert (=> b!875605 (= lt!396081 (addStillNotContains!202 lt!396084 lt!396086 lt!396083 lt!396085))))

(assert (=> b!875605 (= lt!396085 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!875605 (= lt!396083 (get!12866 (select (arr!24464 lt!396009) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!875605 (= lt!396086 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!875605 (= lt!396084 call!38638)))

(assert (=> b!875605 (= e!487427 (+!2499 call!38638 (tuple2!11555 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12866 (select (arr!24464 lt!396009) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!108391 () Bool)

(assert (=> d!108391 e!487426))

(declare-fun res!595077 () Bool)

(assert (=> d!108391 (=> (not res!595077) (not e!487426))))

(assert (=> d!108391 (= res!595077 (not (contains!4220 lt!396082 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!108391 (= lt!396082 e!487432)))

(declare-fun c!92489 () Bool)

(assert (=> d!108391 (= c!92489 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(assert (=> d!108391 (validMask!0 mask!1196)))

(assert (=> d!108391 (= (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396082)))

(declare-fun b!875606 () Bool)

(declare-fun e!487430 () Bool)

(assert (=> b!875606 (= e!487431 e!487430)))

(declare-fun c!92487 () Bool)

(assert (=> b!875606 (= c!92487 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(declare-fun b!875607 () Bool)

(assert (=> b!875607 (= e!487430 (= lt!396082 (getCurrentListMapNoExtraKeys!3165 _keys!868 lt!396009 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!875608 () Bool)

(declare-fun res!595075 () Bool)

(assert (=> b!875608 (=> (not res!595075) (not e!487426))))

(assert (=> b!875608 (= res!595075 (not (contains!4220 lt!396082 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875609 () Bool)

(assert (=> b!875609 (= e!487430 (isEmpty!667 lt!396082))))

(declare-fun b!875610 () Bool)

(assert (=> b!875610 (= e!487432 (ListLongMap!10314 Nil!17361))))

(declare-fun b!875611 () Bool)

(assert (=> b!875611 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(assert (=> b!875611 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24906 lt!396009)))))

(assert (=> b!875611 (= e!487429 (= (apply!376 lt!396082 (select (arr!24463 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12866 (select (arr!24464 lt!396009) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!108391 c!92489) b!875610))

(assert (= (and d!108391 (not c!92489)) b!875600))

(assert (= (and b!875600 c!92490) b!875605))

(assert (= (and b!875600 (not c!92490)) b!875601))

(assert (= (or b!875605 b!875601) bm!38635))

(assert (= (and d!108391 res!595077) b!875608))

(assert (= (and b!875608 res!595075) b!875603))

(assert (= (and b!875603 res!595078) b!875602))

(assert (= (and b!875603 c!92488) b!875604))

(assert (= (and b!875603 (not c!92488)) b!875606))

(assert (= (and b!875604 res!595076) b!875611))

(assert (= (and b!875606 c!92487) b!875607))

(assert (= (and b!875606 (not c!92487)) b!875609))

(declare-fun b_lambda!12175 () Bool)

(assert (=> (not b_lambda!12175) (not b!875605)))

(assert (=> b!875605 t!24397))

(declare-fun b_and!24913 () Bool)

(assert (= b_and!24911 (and (=> t!24397 result!9407) b_and!24913)))

(declare-fun b_lambda!12177 () Bool)

(assert (=> (not b_lambda!12177) (not b!875611)))

(assert (=> b!875611 t!24397))

(declare-fun b_and!24915 () Bool)

(assert (= b_and!24913 (and (=> t!24397 result!9407) b_and!24915)))

(assert (=> b!875602 m!814837))

(assert (=> b!875602 m!814837))

(assert (=> b!875602 m!814839))

(assert (=> b!875600 m!814837))

(assert (=> b!875600 m!814837))

(assert (=> b!875600 m!814839))

(declare-fun m!814921 () Bool)

(assert (=> b!875608 m!814921))

(declare-fun m!814923 () Bool)

(assert (=> bm!38635 m!814923))

(assert (=> b!875605 m!814837))

(declare-fun m!814925 () Bool)

(assert (=> b!875605 m!814925))

(declare-fun m!814927 () Bool)

(assert (=> b!875605 m!814927))

(assert (=> b!875605 m!814925))

(declare-fun m!814929 () Bool)

(assert (=> b!875605 m!814929))

(assert (=> b!875605 m!814927))

(assert (=> b!875605 m!814737))

(declare-fun m!814931 () Bool)

(assert (=> b!875605 m!814931))

(declare-fun m!814933 () Bool)

(assert (=> b!875605 m!814933))

(assert (=> b!875605 m!814737))

(declare-fun m!814935 () Bool)

(assert (=> b!875605 m!814935))

(assert (=> b!875607 m!814923))

(assert (=> b!875604 m!814837))

(assert (=> b!875604 m!814837))

(declare-fun m!814937 () Bool)

(assert (=> b!875604 m!814937))

(declare-fun m!814939 () Bool)

(assert (=> b!875609 m!814939))

(assert (=> b!875611 m!814837))

(assert (=> b!875611 m!814837))

(declare-fun m!814941 () Bool)

(assert (=> b!875611 m!814941))

(assert (=> b!875611 m!814927))

(assert (=> b!875611 m!814927))

(assert (=> b!875611 m!814737))

(assert (=> b!875611 m!814931))

(assert (=> b!875611 m!814737))

(declare-fun m!814943 () Bool)

(assert (=> d!108391 m!814943))

(assert (=> d!108391 m!814741))

(assert (=> b!875416 d!108391))

(declare-fun d!108393 () Bool)

(declare-fun c!92493 () Bool)

(assert (=> d!108393 (= c!92493 ((_ is ValueCellFull!8252) (select (arr!24464 lt!396009) from!1053)))))

(declare-fun e!487435 () V!28225)

(assert (=> d!108393 (= (get!12866 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)) e!487435)))

(declare-fun b!875616 () Bool)

(declare-fun get!12869 (ValueCell!8252 V!28225) V!28225)

(assert (=> b!875616 (= e!487435 (get!12869 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!875617 () Bool)

(declare-fun get!12870 (ValueCell!8252 V!28225) V!28225)

(assert (=> b!875617 (= e!487435 (get!12870 (select (arr!24464 lt!396009) from!1053) (dynLambda!1203 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!108393 c!92493) b!875616))

(assert (= (and d!108393 (not c!92493)) b!875617))

(assert (=> b!875616 m!814733))

(assert (=> b!875616 m!814737))

(declare-fun m!814945 () Bool)

(assert (=> b!875616 m!814945))

(assert (=> b!875617 m!814733))

(assert (=> b!875617 m!814737))

(declare-fun m!814947 () Bool)

(assert (=> b!875617 m!814947))

(assert (=> b!875416 d!108393))

(declare-fun d!108395 () Bool)

(assert (=> d!108395 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!875412 d!108395))

(declare-fun d!108397 () Bool)

(assert (=> d!108397 (= (array_inv!19334 _keys!868) (bvsge (size!24905 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74358 d!108397))

(declare-fun d!108399 () Bool)

(assert (=> d!108399 (= (array_inv!19335 _values!688) (bvsge (size!24906 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74358 d!108399))

(assert (=> bm!38614 d!108391))

(declare-fun d!108401 () Bool)

(assert (=> d!108401 (= (validKeyInArray!0 (select (arr!24463 _keys!868) from!1053)) (and (not (= (select (arr!24463 _keys!868) from!1053) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!24463 _keys!868) from!1053) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!875420 d!108401))

(declare-fun b!875624 () Bool)

(declare-fun e!487441 () Bool)

(declare-fun call!38643 () ListLongMap!10313)

(declare-fun call!38644 () ListLongMap!10313)

(assert (=> b!875624 (= e!487441 (= call!38643 call!38644))))

(declare-fun b!875625 () Bool)

(declare-fun e!487440 () Bool)

(assert (=> b!875625 (= e!487440 e!487441)))

(declare-fun c!92496 () Bool)

(assert (=> b!875625 (= c!92496 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun b!875626 () Bool)

(assert (=> b!875626 (= e!487441 (= call!38643 (+!2499 call!38644 (tuple2!11555 k0!854 v!557))))))

(declare-fun bm!38640 () Bool)

(assert (=> bm!38640 (= call!38644 (getCurrentListMapNoExtraKeys!3165 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38641 () Bool)

(assert (=> bm!38641 (= call!38643 (getCurrentListMapNoExtraKeys!3165 _keys!868 (array!50872 (store (arr!24464 _values!688) i!612 (ValueCellFull!8252 v!557)) (size!24906 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun d!108403 () Bool)

(assert (=> d!108403 e!487440))

(declare-fun res!595081 () Bool)

(assert (=> d!108403 (=> (not res!595081) (not e!487440))))

(assert (=> d!108403 (= res!595081 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24906 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24906 _values!688))))))))

(declare-fun lt!396090 () Unit!29893)

(declare-fun choose!1438 (array!50869 array!50871 (_ BitVec 32) (_ BitVec 32) V!28225 V!28225 (_ BitVec 32) (_ BitVec 64) V!28225 (_ BitVec 32) Int) Unit!29893)

(assert (=> d!108403 (= lt!396090 (choose!1438 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108403 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24905 _keys!868)))))

(assert (=> d!108403 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!669 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!396090)))

(assert (= (and d!108403 res!595081) b!875625))

(assert (= (and b!875625 c!92496) b!875626))

(assert (= (and b!875625 (not c!92496)) b!875624))

(assert (= (or b!875626 b!875624) bm!38640))

(assert (= (or b!875626 b!875624) bm!38641))

(declare-fun m!814949 () Bool)

(assert (=> b!875626 m!814949))

(assert (=> bm!38640 m!814743))

(assert (=> bm!38641 m!814711))

(declare-fun m!814951 () Bool)

(assert (=> bm!38641 m!814951))

(declare-fun m!814953 () Bool)

(assert (=> d!108403 m!814953))

(assert (=> b!875420 d!108403))

(declare-fun bm!38644 () Bool)

(declare-fun call!38647 () Bool)

(assert (=> bm!38644 (= call!38647 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!875635 () Bool)

(declare-fun e!487450 () Bool)

(assert (=> b!875635 (= e!487450 call!38647)))

(declare-fun b!875636 () Bool)

(declare-fun e!487448 () Bool)

(assert (=> b!875636 (= e!487448 call!38647)))

(declare-fun d!108405 () Bool)

(declare-fun res!595087 () Bool)

(declare-fun e!487449 () Bool)

(assert (=> d!108405 (=> res!595087 e!487449)))

(assert (=> d!108405 (= res!595087 (bvsge #b00000000000000000000000000000000 (size!24905 _keys!868)))))

(assert (=> d!108405 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!487449)))

(declare-fun b!875637 () Bool)

(assert (=> b!875637 (= e!487450 e!487448)))

(declare-fun lt!396098 () (_ BitVec 64))

(assert (=> b!875637 (= lt!396098 (select (arr!24463 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!396097 () Unit!29893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50869 (_ BitVec 64) (_ BitVec 32)) Unit!29893)

(assert (=> b!875637 (= lt!396097 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!396098 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!875637 (arrayContainsKey!0 _keys!868 lt!396098 #b00000000000000000000000000000000)))

(declare-fun lt!396099 () Unit!29893)

(assert (=> b!875637 (= lt!396099 lt!396097)))

(declare-fun res!595086 () Bool)

(declare-datatypes ((SeekEntryResult!8748 0))(
  ( (MissingZero!8748 (index!37363 (_ BitVec 32))) (Found!8748 (index!37364 (_ BitVec 32))) (Intermediate!8748 (undefined!9560 Bool) (index!37365 (_ BitVec 32)) (x!74187 (_ BitVec 32))) (Undefined!8748) (MissingVacant!8748 (index!37366 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50869 (_ BitVec 32)) SeekEntryResult!8748)

(assert (=> b!875637 (= res!595086 (= (seekEntryOrOpen!0 (select (arr!24463 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8748 #b00000000000000000000000000000000)))))

(assert (=> b!875637 (=> (not res!595086) (not e!487448))))

(declare-fun b!875638 () Bool)

(assert (=> b!875638 (= e!487449 e!487450)))

(declare-fun c!92499 () Bool)

(assert (=> b!875638 (= c!92499 (validKeyInArray!0 (select (arr!24463 _keys!868) #b00000000000000000000000000000000)))))

(assert (= (and d!108405 (not res!595087)) b!875638))

(assert (= (and b!875638 c!92499) b!875637))

(assert (= (and b!875638 (not c!92499)) b!875635))

(assert (= (and b!875637 res!595086) b!875636))

(assert (= (or b!875636 b!875635) bm!38644))

(declare-fun m!814955 () Bool)

(assert (=> bm!38644 m!814955))

(assert (=> b!875637 m!814829))

(declare-fun m!814957 () Bool)

(assert (=> b!875637 m!814957))

(declare-fun m!814959 () Bool)

(assert (=> b!875637 m!814959))

(assert (=> b!875637 m!814829))

(declare-fun m!814961 () Bool)

(assert (=> b!875637 m!814961))

(assert (=> b!875638 m!814829))

(assert (=> b!875638 m!814829))

(assert (=> b!875638 m!814833))

(assert (=> b!875413 d!108405))

(declare-fun d!108407 () Bool)

(declare-fun e!487451 () Bool)

(assert (=> d!108407 e!487451))

(declare-fun res!595088 () Bool)

(assert (=> d!108407 (=> (not res!595088) (not e!487451))))

(declare-fun lt!396100 () ListLongMap!10313)

(assert (=> d!108407 (= res!595088 (contains!4220 lt!396100 (_1!5788 (tuple2!11555 k0!854 v!557))))))

(declare-fun lt!396103 () List!17364)

(assert (=> d!108407 (= lt!396100 (ListLongMap!10314 lt!396103))))

(declare-fun lt!396101 () Unit!29893)

(declare-fun lt!396102 () Unit!29893)

(assert (=> d!108407 (= lt!396101 lt!396102)))

(assert (=> d!108407 (= (getValueByKey!416 lt!396103 (_1!5788 (tuple2!11555 k0!854 v!557))) (Some!421 (_2!5788 (tuple2!11555 k0!854 v!557))))))

(assert (=> d!108407 (= lt!396102 (lemmaContainsTupThenGetReturnValue!233 lt!396103 (_1!5788 (tuple2!11555 k0!854 v!557)) (_2!5788 (tuple2!11555 k0!854 v!557))))))

(assert (=> d!108407 (= lt!396103 (insertStrictlySorted!272 (toList!5172 call!38616) (_1!5788 (tuple2!11555 k0!854 v!557)) (_2!5788 (tuple2!11555 k0!854 v!557))))))

(assert (=> d!108407 (= (+!2499 call!38616 (tuple2!11555 k0!854 v!557)) lt!396100)))

(declare-fun b!875639 () Bool)

(declare-fun res!595089 () Bool)

(assert (=> b!875639 (=> (not res!595089) (not e!487451))))

(assert (=> b!875639 (= res!595089 (= (getValueByKey!416 (toList!5172 lt!396100) (_1!5788 (tuple2!11555 k0!854 v!557))) (Some!421 (_2!5788 (tuple2!11555 k0!854 v!557)))))))

(declare-fun b!875640 () Bool)

(assert (=> b!875640 (= e!487451 (contains!4221 (toList!5172 lt!396100) (tuple2!11555 k0!854 v!557)))))

(assert (= (and d!108407 res!595088) b!875639))

(assert (= (and b!875639 res!595089) b!875640))

(declare-fun m!814963 () Bool)

(assert (=> d!108407 m!814963))

(declare-fun m!814965 () Bool)

(assert (=> d!108407 m!814965))

(declare-fun m!814967 () Bool)

(assert (=> d!108407 m!814967))

(declare-fun m!814969 () Bool)

(assert (=> d!108407 m!814969))

(declare-fun m!814971 () Bool)

(assert (=> b!875639 m!814971))

(declare-fun m!814973 () Bool)

(assert (=> b!875640 m!814973))

(assert (=> b!875419 d!108407))

(declare-fun mapIsEmpty!27692 () Bool)

(declare-fun mapRes!27692 () Bool)

(assert (=> mapIsEmpty!27692 mapRes!27692))

(declare-fun b!875647 () Bool)

(declare-fun e!487456 () Bool)

(assert (=> b!875647 (= e!487456 tp_is_empty!17383)))

(declare-fun condMapEmpty!27692 () Bool)

(declare-fun mapDefault!27692 () ValueCell!8252)

(assert (=> mapNonEmpty!27683 (= condMapEmpty!27692 (= mapRest!27683 ((as const (Array (_ BitVec 32) ValueCell!8252)) mapDefault!27692)))))

(declare-fun e!487457 () Bool)

(assert (=> mapNonEmpty!27683 (= tp!53093 (and e!487457 mapRes!27692))))

(declare-fun b!875648 () Bool)

(assert (=> b!875648 (= e!487457 tp_is_empty!17383)))

(declare-fun mapNonEmpty!27692 () Bool)

(declare-fun tp!53108 () Bool)

(assert (=> mapNonEmpty!27692 (= mapRes!27692 (and tp!53108 e!487456))))

(declare-fun mapKey!27692 () (_ BitVec 32))

(declare-fun mapRest!27692 () (Array (_ BitVec 32) ValueCell!8252))

(declare-fun mapValue!27692 () ValueCell!8252)

(assert (=> mapNonEmpty!27692 (= mapRest!27683 (store mapRest!27692 mapKey!27692 mapValue!27692))))

(assert (= (and mapNonEmpty!27683 condMapEmpty!27692) mapIsEmpty!27692))

(assert (= (and mapNonEmpty!27683 (not condMapEmpty!27692)) mapNonEmpty!27692))

(assert (= (and mapNonEmpty!27692 ((_ is ValueCellFull!8252) mapValue!27692)) b!875647))

(assert (= (and mapNonEmpty!27683 ((_ is ValueCellFull!8252) mapDefault!27692)) b!875648))

(declare-fun m!814975 () Bool)

(assert (=> mapNonEmpty!27692 m!814975))

(declare-fun b_lambda!12179 () Bool)

(assert (= b_lambda!12167 (or (and start!74358 b_free!15139) b_lambda!12179)))

(declare-fun b_lambda!12181 () Bool)

(assert (= b_lambda!12163 (or (and start!74358 b_free!15139) b_lambda!12181)))

(declare-fun b_lambda!12183 () Bool)

(assert (= b_lambda!12175 (or (and start!74358 b_free!15139) b_lambda!12183)))

(declare-fun b_lambda!12185 () Bool)

(assert (= b_lambda!12177 (or (and start!74358 b_free!15139) b_lambda!12185)))

(declare-fun b_lambda!12187 () Bool)

(assert (= b_lambda!12165 (or (and start!74358 b_free!15139) b_lambda!12187)))

(declare-fun b_lambda!12189 () Bool)

(assert (= b_lambda!12173 (or (and start!74358 b_free!15139) b_lambda!12189)))

(declare-fun b_lambda!12191 () Bool)

(assert (= b_lambda!12169 (or (and start!74358 b_free!15139) b_lambda!12191)))

(declare-fun b_lambda!12193 () Bool)

(assert (= b_lambda!12171 (or (and start!74358 b_free!15139) b_lambda!12193)))

(check-sat (not b_lambda!12189) (not b!875609) (not b!875575) (not mapNonEmpty!27692) (not b!875611) (not b!875530) (not b!875602) (not d!108383) (not b_lambda!12181) (not d!108385) (not b!875582) (not b!875639) (not b!875607) (not b!875600) (not b!875599) (not b!875638) (not b!875531) (not b!875566) (not b_lambda!12191) (not b!875563) (not b!875590) (not b_lambda!12187) (not b!875616) (not bm!38644) (not b_lambda!12161) (not b!875589) (not d!108391) tp_is_empty!17383 (not b!875608) (not b!875593) (not b_lambda!12179) (not b!875560) (not b!875586) (not b!875578) (not b!875579) (not b!875598) (not b!875567) (not bm!38632) (not b!875570) (not b!875637) (not b!875577) (not b!875617) (not bm!38635) (not b!875587) (not bm!38633) (not b!875574) (not b!875640) (not b!875572) (not b!875604) (not bm!38634) (not d!108407) (not b!875569) (not bm!38629) (not b!875605) (not bm!38641) (not b_lambda!12185) (not b!875565) (not d!108403) (not b!875562) (not b!875558) (not b!875581) (not b_lambda!12193) (not b!875584) (not bm!38640) (not b!875591) (not b!875626) (not b!875533) b_and!24915 (not b_lambda!12183) (not d!108389) (not d!108387) (not b_next!15139))
(check-sat b_and!24915 (not b_next!15139))
