; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74188 () Bool)

(assert start!74188)

(declare-fun b_free!15013 () Bool)

(declare-fun b_next!15013 () Bool)

(assert (=> start!74188 (= b_free!15013 (not b_next!15013))))

(declare-fun tp!52690 () Bool)

(declare-fun b_and!24739 () Bool)

(assert (=> start!74188 (= tp!52690 b_and!24739)))

(declare-fun b!872774 () Bool)

(declare-fun res!593196 () Bool)

(declare-fun e!486014 () Bool)

(assert (=> b!872774 (=> (not res!593196) (not e!486014))))

(declare-datatypes ((array!50607 0))(
  ( (array!50608 (arr!24334 (Array (_ BitVec 32) (_ BitVec 64))) (size!24776 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50607)

(declare-datatypes ((List!17289 0))(
  ( (Nil!17286) (Cons!17285 (h!18416 (_ BitVec 64)) (t!24317 List!17289)) )
))
(declare-fun arrayNoDuplicates!0 (array!50607 (_ BitVec 32) List!17289) Bool)

(assert (=> b!872774 (= res!593196 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17286))))

(declare-fun b!872775 () Bool)

(declare-fun res!593199 () Bool)

(assert (=> b!872775 (=> (not res!593199) (not e!486014))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872775 (= res!593199 (validKeyInArray!0 k0!854))))

(declare-fun b!872776 () Bool)

(declare-fun res!593197 () Bool)

(assert (=> b!872776 (=> (not res!593197) (not e!486014))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872776 (= res!593197 (validMask!0 mask!1196))))

(declare-datatypes ((V!28041 0))(
  ( (V!28042 (val!8670 Int)) )
))
(declare-fun v!557 () V!28041)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun b!872777 () Bool)

(declare-datatypes ((ValueCell!8183 0))(
  ( (ValueCellFull!8183 (v!11089 V!28041)) (EmptyCell!8183) )
))
(declare-datatypes ((array!50609 0))(
  ( (array!50610 (arr!24335 (Array (_ BitVec 32) ValueCell!8183)) (size!24777 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50609)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!28041)

(declare-fun zeroValue!654 () V!28041)

(declare-datatypes ((tuple2!11480 0))(
  ( (tuple2!11481 (_1!5751 (_ BitVec 64)) (_2!5751 V!28041)) )
))
(declare-datatypes ((List!17290 0))(
  ( (Nil!17287) (Cons!17286 (h!18417 tuple2!11480) (t!24318 List!17290)) )
))
(declare-datatypes ((ListLongMap!10239 0))(
  ( (ListLongMap!10240 (toList!5135 List!17290)) )
))
(declare-fun getCurrentListMapNoExtraKeys!3128 (array!50607 array!50609 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) Int) ListLongMap!10239)

(assert (=> b!872777 (= e!486014 (not (= (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))))

(declare-fun e!486013 () Bool)

(assert (=> b!872777 e!486013))

(declare-fun c!92348 () Bool)

(assert (=> b!872777 (= c!92348 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29871 0))(
  ( (Unit!29872) )
))
(declare-fun lt!395438 () Unit!29871)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 (array!50607 array!50609 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) (_ BitVec 64) V!28041 (_ BitVec 32) Int) Unit!29871)

(assert (=> b!872777 (= lt!395438 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!27470 () Bool)

(declare-fun mapRes!27470 () Bool)

(assert (=> mapIsEmpty!27470 mapRes!27470))

(declare-fun b!872778 () Bool)

(declare-fun e!486017 () Bool)

(declare-fun tp_is_empty!17245 () Bool)

(assert (=> b!872778 (= e!486017 tp_is_empty!17245)))

(declare-fun res!593200 () Bool)

(assert (=> start!74188 (=> (not res!593200) (not e!486014))))

(assert (=> start!74188 (= res!593200 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24776 _keys!868))))))

(assert (=> start!74188 e!486014))

(assert (=> start!74188 tp_is_empty!17245))

(assert (=> start!74188 true))

(assert (=> start!74188 tp!52690))

(declare-fun array_inv!19262 (array!50607) Bool)

(assert (=> start!74188 (array_inv!19262 _keys!868)))

(declare-fun e!486018 () Bool)

(declare-fun array_inv!19263 (array!50609) Bool)

(assert (=> start!74188 (and (array_inv!19263 _values!688) e!486018)))

(declare-fun b!872779 () Bool)

(declare-fun call!38481 () ListLongMap!10239)

(declare-fun call!38480 () ListLongMap!10239)

(declare-fun +!2489 (ListLongMap!10239 tuple2!11480) ListLongMap!10239)

(assert (=> b!872779 (= e!486013 (= call!38481 (+!2489 call!38480 (tuple2!11481 k0!854 v!557))))))

(declare-fun b!872780 () Bool)

(declare-fun res!593202 () Bool)

(assert (=> b!872780 (=> (not res!593202) (not e!486014))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50607 (_ BitVec 32)) Bool)

(assert (=> b!872780 (= res!593202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872781 () Bool)

(declare-fun e!486016 () Bool)

(assert (=> b!872781 (= e!486016 tp_is_empty!17245)))

(declare-fun b!872782 () Bool)

(declare-fun res!593201 () Bool)

(assert (=> b!872782 (=> (not res!593201) (not e!486014))))

(assert (=> b!872782 (= res!593201 (and (= (select (arr!24334 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!27470 () Bool)

(declare-fun tp!52691 () Bool)

(assert (=> mapNonEmpty!27470 (= mapRes!27470 (and tp!52691 e!486016))))

(declare-fun mapValue!27470 () ValueCell!8183)

(declare-fun mapRest!27470 () (Array (_ BitVec 32) ValueCell!8183))

(declare-fun mapKey!27470 () (_ BitVec 32))

(assert (=> mapNonEmpty!27470 (= (arr!24335 _values!688) (store mapRest!27470 mapKey!27470 mapValue!27470))))

(declare-fun b!872783 () Bool)

(assert (=> b!872783 (= e!486013 (= call!38481 call!38480))))

(declare-fun bm!38477 () Bool)

(assert (=> bm!38477 (= call!38480 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872784 () Bool)

(declare-fun res!593198 () Bool)

(assert (=> b!872784 (=> (not res!593198) (not e!486014))))

(assert (=> b!872784 (= res!593198 (and (= (size!24777 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24776 _keys!868) (size!24777 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38478 () Bool)

(assert (=> bm!38478 (= call!38481 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872785 () Bool)

(assert (=> b!872785 (= e!486018 (and e!486017 mapRes!27470))))

(declare-fun condMapEmpty!27470 () Bool)

(declare-fun mapDefault!27470 () ValueCell!8183)

(assert (=> b!872785 (= condMapEmpty!27470 (= (arr!24335 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8183)) mapDefault!27470)))))

(declare-fun b!872786 () Bool)

(declare-fun res!593195 () Bool)

(assert (=> b!872786 (=> (not res!593195) (not e!486014))))

(assert (=> b!872786 (= res!593195 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24776 _keys!868))))))

(assert (= (and start!74188 res!593200) b!872776))

(assert (= (and b!872776 res!593197) b!872784))

(assert (= (and b!872784 res!593198) b!872780))

(assert (= (and b!872780 res!593202) b!872774))

(assert (= (and b!872774 res!593196) b!872786))

(assert (= (and b!872786 res!593195) b!872775))

(assert (= (and b!872775 res!593199) b!872782))

(assert (= (and b!872782 res!593201) b!872777))

(assert (= (and b!872777 c!92348) b!872779))

(assert (= (and b!872777 (not c!92348)) b!872783))

(assert (= (or b!872779 b!872783) bm!38478))

(assert (= (or b!872779 b!872783) bm!38477))

(assert (= (and b!872785 condMapEmpty!27470) mapIsEmpty!27470))

(assert (= (and b!872785 (not condMapEmpty!27470)) mapNonEmpty!27470))

(get-info :version)

(assert (= (and mapNonEmpty!27470 ((_ is ValueCellFull!8183) mapValue!27470)) b!872781))

(assert (= (and b!872785 ((_ is ValueCellFull!8183) mapDefault!27470)) b!872778))

(assert (= start!74188 b!872785))

(declare-fun m!812841 () Bool)

(assert (=> mapNonEmpty!27470 m!812841))

(declare-fun m!812843 () Bool)

(assert (=> b!872774 m!812843))

(declare-fun m!812845 () Bool)

(assert (=> bm!38477 m!812845))

(declare-fun m!812847 () Bool)

(assert (=> start!74188 m!812847))

(declare-fun m!812849 () Bool)

(assert (=> start!74188 m!812849))

(declare-fun m!812851 () Bool)

(assert (=> b!872777 m!812851))

(declare-fun m!812853 () Bool)

(assert (=> b!872777 m!812853))

(declare-fun m!812855 () Bool)

(assert (=> b!872777 m!812855))

(declare-fun m!812857 () Bool)

(assert (=> b!872777 m!812857))

(declare-fun m!812859 () Bool)

(assert (=> b!872782 m!812859))

(declare-fun m!812861 () Bool)

(assert (=> b!872776 m!812861))

(declare-fun m!812863 () Bool)

(assert (=> b!872775 m!812863))

(declare-fun m!812865 () Bool)

(assert (=> b!872779 m!812865))

(declare-fun m!812867 () Bool)

(assert (=> b!872780 m!812867))

(assert (=> bm!38478 m!812851))

(declare-fun m!812869 () Bool)

(assert (=> bm!38478 m!812869))

(check-sat (not b!872776) (not bm!38478) (not b!872779) (not start!74188) (not b!872780) (not bm!38477) tp_is_empty!17245 (not mapNonEmpty!27470) b_and!24739 (not b!872774) (not b!872777) (not b_next!15013) (not b!872775))
(check-sat b_and!24739 (not b_next!15013))
(get-model)

(declare-fun d!108293 () Bool)

(assert (=> d!108293 (= (array_inv!19262 _keys!868) (bvsge (size!24776 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!74188 d!108293))

(declare-fun d!108295 () Bool)

(assert (=> d!108295 (= (array_inv!19263 _values!688) (bvsge (size!24777 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!74188 d!108295))

(declare-fun d!108297 () Bool)

(assert (=> d!108297 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!872776 d!108297))

(declare-fun b!872873 () Bool)

(declare-fun e!486062 () Bool)

(declare-fun e!486063 () Bool)

(assert (=> b!872873 (= e!486062 e!486063)))

(declare-fun c!92357 () Bool)

(assert (=> b!872873 (= c!92357 (validKeyInArray!0 (select (arr!24334 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38493 () Bool)

(declare-fun call!38496 () Bool)

(assert (=> bm!38493 (= call!38496 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!872875 () Bool)

(assert (=> b!872875 (= e!486063 call!38496)))

(declare-fun b!872876 () Bool)

(declare-fun e!486061 () Bool)

(assert (=> b!872876 (= e!486063 e!486061)))

(declare-fun lt!395453 () (_ BitVec 64))

(assert (=> b!872876 (= lt!395453 (select (arr!24334 _keys!868) #b00000000000000000000000000000000))))

(declare-fun lt!395451 () Unit!29871)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!50607 (_ BitVec 64) (_ BitVec 32)) Unit!29871)

(assert (=> b!872876 (= lt!395451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!395453 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!50607 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!872876 (arrayContainsKey!0 _keys!868 lt!395453 #b00000000000000000000000000000000)))

(declare-fun lt!395452 () Unit!29871)

(assert (=> b!872876 (= lt!395452 lt!395451)))

(declare-fun res!593256 () Bool)

(declare-datatypes ((SeekEntryResult!8746 0))(
  ( (MissingZero!8746 (index!37355 (_ BitVec 32))) (Found!8746 (index!37356 (_ BitVec 32))) (Intermediate!8746 (undefined!9558 Bool) (index!37357 (_ BitVec 32)) (x!73973 (_ BitVec 32))) (Undefined!8746) (MissingVacant!8746 (index!37358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!50607 (_ BitVec 32)) SeekEntryResult!8746)

(assert (=> b!872876 (= res!593256 (= (seekEntryOrOpen!0 (select (arr!24334 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8746 #b00000000000000000000000000000000)))))

(assert (=> b!872876 (=> (not res!593256) (not e!486061))))

(declare-fun d!108299 () Bool)

(declare-fun res!593255 () Bool)

(assert (=> d!108299 (=> res!593255 e!486062)))

(assert (=> d!108299 (= res!593255 (bvsge #b00000000000000000000000000000000 (size!24776 _keys!868)))))

(assert (=> d!108299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!486062)))

(declare-fun b!872874 () Bool)

(assert (=> b!872874 (= e!486061 call!38496)))

(assert (= (and d!108299 (not res!593255)) b!872873))

(assert (= (and b!872873 c!92357) b!872876))

(assert (= (and b!872873 (not c!92357)) b!872875))

(assert (= (and b!872876 res!593256) b!872874))

(assert (= (or b!872874 b!872875) bm!38493))

(declare-fun m!812931 () Bool)

(assert (=> b!872873 m!812931))

(assert (=> b!872873 m!812931))

(declare-fun m!812933 () Bool)

(assert (=> b!872873 m!812933))

(declare-fun m!812935 () Bool)

(assert (=> bm!38493 m!812935))

(assert (=> b!872876 m!812931))

(declare-fun m!812937 () Bool)

(assert (=> b!872876 m!812937))

(declare-fun m!812939 () Bool)

(assert (=> b!872876 m!812939))

(assert (=> b!872876 m!812931))

(declare-fun m!812941 () Bool)

(assert (=> b!872876 m!812941))

(assert (=> b!872780 d!108299))

(declare-fun b!872901 () Bool)

(declare-fun e!486078 () ListLongMap!10239)

(declare-fun call!38499 () ListLongMap!10239)

(assert (=> b!872901 (= e!486078 call!38499)))

(declare-fun d!108301 () Bool)

(declare-fun e!486081 () Bool)

(assert (=> d!108301 e!486081))

(declare-fun res!593268 () Bool)

(assert (=> d!108301 (=> (not res!593268) (not e!486081))))

(declare-fun lt!395469 () ListLongMap!10239)

(declare-fun contains!4214 (ListLongMap!10239 (_ BitVec 64)) Bool)

(assert (=> d!108301 (= res!593268 (not (contains!4214 lt!395469 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486084 () ListLongMap!10239)

(assert (=> d!108301 (= lt!395469 e!486084)))

(declare-fun c!92369 () Bool)

(assert (=> d!108301 (= c!92369 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(assert (=> d!108301 (validMask!0 mask!1196)))

(assert (=> d!108301 (= (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!395469)))

(declare-fun b!872902 () Bool)

(assert (=> b!872902 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(assert (=> b!872902 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24777 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)))))))

(declare-fun e!486079 () Bool)

(declare-fun apply!374 (ListLongMap!10239 (_ BitVec 64)) V!28041)

(declare-fun get!12818 (ValueCell!8183 V!28041) V!28041)

(declare-fun dynLambda!1201 (Int (_ BitVec 64)) V!28041)

(assert (=> b!872902 (= e!486079 (= (apply!374 lt!395469 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12818 (select (arr!24335 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!872903 () Bool)

(declare-fun e!486082 () Bool)

(assert (=> b!872903 (= e!486082 (= lt!395469 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!872904 () Bool)

(declare-fun e!486083 () Bool)

(assert (=> b!872904 (= e!486083 e!486082)))

(declare-fun c!92367 () Bool)

(assert (=> b!872904 (= c!92367 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(declare-fun b!872905 () Bool)

(assert (=> b!872905 (= e!486081 e!486083)))

(declare-fun c!92366 () Bool)

(declare-fun e!486080 () Bool)

(assert (=> b!872905 (= c!92366 e!486080)))

(declare-fun res!593265 () Bool)

(assert (=> b!872905 (=> (not res!593265) (not e!486080))))

(assert (=> b!872905 (= res!593265 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(declare-fun b!872906 () Bool)

(declare-fun isEmpty!665 (ListLongMap!10239) Bool)

(assert (=> b!872906 (= e!486082 (isEmpty!665 lt!395469))))

(declare-fun b!872907 () Bool)

(assert (=> b!872907 (= e!486084 (ListLongMap!10240 Nil!17287))))

(declare-fun b!872908 () Bool)

(declare-fun lt!395474 () Unit!29871)

(declare-fun lt!395472 () Unit!29871)

(assert (=> b!872908 (= lt!395474 lt!395472)))

(declare-fun lt!395471 () ListLongMap!10239)

(declare-fun lt!395468 () (_ BitVec 64))

(declare-fun lt!395470 () V!28041)

(declare-fun lt!395473 () (_ BitVec 64))

(assert (=> b!872908 (not (contains!4214 (+!2489 lt!395471 (tuple2!11481 lt!395468 lt!395470)) lt!395473))))

(declare-fun addStillNotContains!200 (ListLongMap!10239 (_ BitVec 64) V!28041 (_ BitVec 64)) Unit!29871)

(assert (=> b!872908 (= lt!395472 (addStillNotContains!200 lt!395471 lt!395468 lt!395470 lt!395473))))

(assert (=> b!872908 (= lt!395473 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!872908 (= lt!395470 (get!12818 (select (arr!24335 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!872908 (= lt!395468 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!872908 (= lt!395471 call!38499)))

(assert (=> b!872908 (= e!486078 (+!2489 call!38499 (tuple2!11481 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12818 (select (arr!24335 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688))) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!872909 () Bool)

(assert (=> b!872909 (= e!486080 (validKeyInArray!0 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!872909 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!872910 () Bool)

(declare-fun res!593267 () Bool)

(assert (=> b!872910 (=> (not res!593267) (not e!486081))))

(assert (=> b!872910 (= res!593267 (not (contains!4214 lt!395469 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!872911 () Bool)

(assert (=> b!872911 (= e!486084 e!486078)))

(declare-fun c!92368 () Bool)

(assert (=> b!872911 (= c!92368 (validKeyInArray!0 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!872912 () Bool)

(assert (=> b!872912 (= e!486083 e!486079)))

(assert (=> b!872912 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(declare-fun res!593266 () Bool)

(assert (=> b!872912 (= res!593266 (contains!4214 lt!395469 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!872912 (=> (not res!593266) (not e!486079))))

(declare-fun bm!38496 () Bool)

(assert (=> bm!38496 (= call!38499 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108301 c!92369) b!872907))

(assert (= (and d!108301 (not c!92369)) b!872911))

(assert (= (and b!872911 c!92368) b!872908))

(assert (= (and b!872911 (not c!92368)) b!872901))

(assert (= (or b!872908 b!872901) bm!38496))

(assert (= (and d!108301 res!593268) b!872910))

(assert (= (and b!872910 res!593267) b!872905))

(assert (= (and b!872905 res!593265) b!872909))

(assert (= (and b!872905 c!92366) b!872912))

(assert (= (and b!872905 (not c!92366)) b!872904))

(assert (= (and b!872912 res!593266) b!872902))

(assert (= (and b!872904 c!92367) b!872903))

(assert (= (and b!872904 (not c!92367)) b!872906))

(declare-fun b_lambda!12107 () Bool)

(assert (=> (not b_lambda!12107) (not b!872902)))

(declare-fun t!24323 () Bool)

(declare-fun tb!4887 () Bool)

(assert (=> (and start!74188 (= defaultEntry!696 defaultEntry!696) t!24323) tb!4887))

(declare-fun result!9395 () Bool)

(assert (=> tb!4887 (= result!9395 tp_is_empty!17245)))

(assert (=> b!872902 t!24323))

(declare-fun b_and!24745 () Bool)

(assert (= b_and!24739 (and (=> t!24323 result!9395) b_and!24745)))

(declare-fun b_lambda!12109 () Bool)

(assert (=> (not b_lambda!12109) (not b!872908)))

(assert (=> b!872908 t!24323))

(declare-fun b_and!24747 () Bool)

(assert (= b_and!24745 (and (=> t!24323 result!9395) b_and!24747)))

(declare-fun m!812943 () Bool)

(assert (=> b!872912 m!812943))

(assert (=> b!872912 m!812943))

(declare-fun m!812945 () Bool)

(assert (=> b!872912 m!812945))

(declare-fun m!812947 () Bool)

(assert (=> b!872906 m!812947))

(declare-fun m!812949 () Bool)

(assert (=> b!872903 m!812949))

(declare-fun m!812951 () Bool)

(assert (=> b!872902 m!812951))

(declare-fun m!812953 () Bool)

(assert (=> b!872902 m!812953))

(declare-fun m!812955 () Bool)

(assert (=> b!872902 m!812955))

(assert (=> b!872902 m!812951))

(assert (=> b!872902 m!812943))

(assert (=> b!872902 m!812943))

(declare-fun m!812957 () Bool)

(assert (=> b!872902 m!812957))

(assert (=> b!872902 m!812953))

(assert (=> b!872908 m!812951))

(assert (=> b!872908 m!812953))

(assert (=> b!872908 m!812955))

(assert (=> b!872908 m!812951))

(assert (=> b!872908 m!812943))

(declare-fun m!812959 () Bool)

(assert (=> b!872908 m!812959))

(declare-fun m!812961 () Bool)

(assert (=> b!872908 m!812961))

(assert (=> b!872908 m!812953))

(declare-fun m!812963 () Bool)

(assert (=> b!872908 m!812963))

(assert (=> b!872908 m!812959))

(declare-fun m!812965 () Bool)

(assert (=> b!872908 m!812965))

(assert (=> b!872909 m!812943))

(assert (=> b!872909 m!812943))

(declare-fun m!812967 () Bool)

(assert (=> b!872909 m!812967))

(declare-fun m!812969 () Bool)

(assert (=> d!108301 m!812969))

(assert (=> d!108301 m!812861))

(declare-fun m!812971 () Bool)

(assert (=> b!872910 m!812971))

(assert (=> bm!38496 m!812949))

(assert (=> b!872911 m!812943))

(assert (=> b!872911 m!812943))

(assert (=> b!872911 m!812967))

(assert (=> bm!38478 d!108301))

(declare-fun b!872915 () Bool)

(declare-fun e!486085 () ListLongMap!10239)

(declare-fun call!38500 () ListLongMap!10239)

(assert (=> b!872915 (= e!486085 call!38500)))

(declare-fun d!108303 () Bool)

(declare-fun e!486088 () Bool)

(assert (=> d!108303 e!486088))

(declare-fun res!593272 () Bool)

(assert (=> d!108303 (=> (not res!593272) (not e!486088))))

(declare-fun lt!395476 () ListLongMap!10239)

(assert (=> d!108303 (= res!593272 (not (contains!4214 lt!395476 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486091 () ListLongMap!10239)

(assert (=> d!108303 (= lt!395476 e!486091)))

(declare-fun c!92373 () Bool)

(assert (=> d!108303 (= c!92373 (bvsge from!1053 (size!24776 _keys!868)))))

(assert (=> d!108303 (validMask!0 mask!1196)))

(assert (=> d!108303 (= (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395476)))

(declare-fun b!872916 () Bool)

(assert (=> b!872916 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24776 _keys!868)))))

(assert (=> b!872916 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24777 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)))))))

(declare-fun e!486086 () Bool)

(assert (=> b!872916 (= e!486086 (= (apply!374 lt!395476 (select (arr!24334 _keys!868) from!1053)) (get!12818 (select (arr!24335 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688))) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!486089 () Bool)

(declare-fun b!872917 () Bool)

(assert (=> b!872917 (= e!486089 (= lt!395476 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!872918 () Bool)

(declare-fun e!486090 () Bool)

(assert (=> b!872918 (= e!486090 e!486089)))

(declare-fun c!92371 () Bool)

(assert (=> b!872918 (= c!92371 (bvslt from!1053 (size!24776 _keys!868)))))

(declare-fun b!872919 () Bool)

(assert (=> b!872919 (= e!486088 e!486090)))

(declare-fun c!92370 () Bool)

(declare-fun e!486087 () Bool)

(assert (=> b!872919 (= c!92370 e!486087)))

(declare-fun res!593269 () Bool)

(assert (=> b!872919 (=> (not res!593269) (not e!486087))))

(assert (=> b!872919 (= res!593269 (bvslt from!1053 (size!24776 _keys!868)))))

(declare-fun b!872920 () Bool)

(assert (=> b!872920 (= e!486089 (isEmpty!665 lt!395476))))

(declare-fun b!872921 () Bool)

(assert (=> b!872921 (= e!486091 (ListLongMap!10240 Nil!17287))))

(declare-fun b!872922 () Bool)

(declare-fun lt!395481 () Unit!29871)

(declare-fun lt!395479 () Unit!29871)

(assert (=> b!872922 (= lt!395481 lt!395479)))

(declare-fun lt!395477 () V!28041)

(declare-fun lt!395478 () ListLongMap!10239)

(declare-fun lt!395475 () (_ BitVec 64))

(declare-fun lt!395480 () (_ BitVec 64))

(assert (=> b!872922 (not (contains!4214 (+!2489 lt!395478 (tuple2!11481 lt!395475 lt!395477)) lt!395480))))

(assert (=> b!872922 (= lt!395479 (addStillNotContains!200 lt!395478 lt!395475 lt!395477 lt!395480))))

(assert (=> b!872922 (= lt!395480 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!872922 (= lt!395477 (get!12818 (select (arr!24335 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688))) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!872922 (= lt!395475 (select (arr!24334 _keys!868) from!1053))))

(assert (=> b!872922 (= lt!395478 call!38500)))

(assert (=> b!872922 (= e!486085 (+!2489 call!38500 (tuple2!11481 (select (arr!24334 _keys!868) from!1053) (get!12818 (select (arr!24335 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688))) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!872923 () Bool)

(assert (=> b!872923 (= e!486087 (validKeyInArray!0 (select (arr!24334 _keys!868) from!1053)))))

(assert (=> b!872923 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!872924 () Bool)

(declare-fun res!593271 () Bool)

(assert (=> b!872924 (=> (not res!593271) (not e!486088))))

(assert (=> b!872924 (= res!593271 (not (contains!4214 lt!395476 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!872925 () Bool)

(assert (=> b!872925 (= e!486091 e!486085)))

(declare-fun c!92372 () Bool)

(assert (=> b!872925 (= c!92372 (validKeyInArray!0 (select (arr!24334 _keys!868) from!1053)))))

(declare-fun b!872926 () Bool)

(assert (=> b!872926 (= e!486090 e!486086)))

(assert (=> b!872926 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24776 _keys!868)))))

(declare-fun res!593270 () Bool)

(assert (=> b!872926 (= res!593270 (contains!4214 lt!395476 (select (arr!24334 _keys!868) from!1053)))))

(assert (=> b!872926 (=> (not res!593270) (not e!486086))))

(declare-fun bm!38497 () Bool)

(assert (=> bm!38497 (= call!38500 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108303 c!92373) b!872921))

(assert (= (and d!108303 (not c!92373)) b!872925))

(assert (= (and b!872925 c!92372) b!872922))

(assert (= (and b!872925 (not c!92372)) b!872915))

(assert (= (or b!872922 b!872915) bm!38497))

(assert (= (and d!108303 res!593272) b!872924))

(assert (= (and b!872924 res!593271) b!872919))

(assert (= (and b!872919 res!593269) b!872923))

(assert (= (and b!872919 c!92370) b!872926))

(assert (= (and b!872919 (not c!92370)) b!872918))

(assert (= (and b!872926 res!593270) b!872916))

(assert (= (and b!872918 c!92371) b!872917))

(assert (= (and b!872918 (not c!92371)) b!872920))

(declare-fun b_lambda!12111 () Bool)

(assert (=> (not b_lambda!12111) (not b!872916)))

(assert (=> b!872916 t!24323))

(declare-fun b_and!24749 () Bool)

(assert (= b_and!24747 (and (=> t!24323 result!9395) b_and!24749)))

(declare-fun b_lambda!12113 () Bool)

(assert (=> (not b_lambda!12113) (not b!872922)))

(assert (=> b!872922 t!24323))

(declare-fun b_and!24751 () Bool)

(assert (= b_and!24749 (and (=> t!24323 result!9395) b_and!24751)))

(declare-fun m!812973 () Bool)

(assert (=> b!872926 m!812973))

(assert (=> b!872926 m!812973))

(declare-fun m!812975 () Bool)

(assert (=> b!872926 m!812975))

(declare-fun m!812977 () Bool)

(assert (=> b!872920 m!812977))

(declare-fun m!812979 () Bool)

(assert (=> b!872917 m!812979))

(declare-fun m!812981 () Bool)

(assert (=> b!872916 m!812981))

(assert (=> b!872916 m!812953))

(declare-fun m!812983 () Bool)

(assert (=> b!872916 m!812983))

(assert (=> b!872916 m!812981))

(assert (=> b!872916 m!812973))

(assert (=> b!872916 m!812973))

(declare-fun m!812985 () Bool)

(assert (=> b!872916 m!812985))

(assert (=> b!872916 m!812953))

(assert (=> b!872922 m!812981))

(assert (=> b!872922 m!812953))

(assert (=> b!872922 m!812983))

(assert (=> b!872922 m!812981))

(assert (=> b!872922 m!812973))

(declare-fun m!812987 () Bool)

(assert (=> b!872922 m!812987))

(declare-fun m!812989 () Bool)

(assert (=> b!872922 m!812989))

(assert (=> b!872922 m!812953))

(declare-fun m!812991 () Bool)

(assert (=> b!872922 m!812991))

(assert (=> b!872922 m!812987))

(declare-fun m!812993 () Bool)

(assert (=> b!872922 m!812993))

(assert (=> b!872923 m!812973))

(assert (=> b!872923 m!812973))

(declare-fun m!812995 () Bool)

(assert (=> b!872923 m!812995))

(declare-fun m!812997 () Bool)

(assert (=> d!108303 m!812997))

(assert (=> d!108303 m!812861))

(declare-fun m!812999 () Bool)

(assert (=> b!872924 m!812999))

(assert (=> bm!38497 m!812979))

(assert (=> b!872925 m!812973))

(assert (=> b!872925 m!812973))

(assert (=> b!872925 m!812995))

(assert (=> b!872777 d!108303))

(declare-fun b!872927 () Bool)

(declare-fun e!486092 () ListLongMap!10239)

(declare-fun call!38501 () ListLongMap!10239)

(assert (=> b!872927 (= e!486092 call!38501)))

(declare-fun d!108305 () Bool)

(declare-fun e!486095 () Bool)

(assert (=> d!108305 e!486095))

(declare-fun res!593276 () Bool)

(assert (=> d!108305 (=> (not res!593276) (not e!486095))))

(declare-fun lt!395483 () ListLongMap!10239)

(assert (=> d!108305 (= res!593276 (not (contains!4214 lt!395483 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486098 () ListLongMap!10239)

(assert (=> d!108305 (= lt!395483 e!486098)))

(declare-fun c!92377 () Bool)

(assert (=> d!108305 (= c!92377 (bvsge from!1053 (size!24776 _keys!868)))))

(assert (=> d!108305 (validMask!0 mask!1196)))

(assert (=> d!108305 (= (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696) lt!395483)))

(declare-fun b!872928 () Bool)

(assert (=> b!872928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24776 _keys!868)))))

(assert (=> b!872928 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24777 _values!688)))))

(declare-fun e!486093 () Bool)

(assert (=> b!872928 (= e!486093 (= (apply!374 lt!395483 (select (arr!24334 _keys!868) from!1053)) (get!12818 (select (arr!24335 _values!688) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!872929 () Bool)

(declare-fun e!486096 () Bool)

(assert (=> b!872929 (= e!486096 (= lt!395483 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!872930 () Bool)

(declare-fun e!486097 () Bool)

(assert (=> b!872930 (= e!486097 e!486096)))

(declare-fun c!92375 () Bool)

(assert (=> b!872930 (= c!92375 (bvslt from!1053 (size!24776 _keys!868)))))

(declare-fun b!872931 () Bool)

(assert (=> b!872931 (= e!486095 e!486097)))

(declare-fun c!92374 () Bool)

(declare-fun e!486094 () Bool)

(assert (=> b!872931 (= c!92374 e!486094)))

(declare-fun res!593273 () Bool)

(assert (=> b!872931 (=> (not res!593273) (not e!486094))))

(assert (=> b!872931 (= res!593273 (bvslt from!1053 (size!24776 _keys!868)))))

(declare-fun b!872932 () Bool)

(assert (=> b!872932 (= e!486096 (isEmpty!665 lt!395483))))

(declare-fun b!872933 () Bool)

(assert (=> b!872933 (= e!486098 (ListLongMap!10240 Nil!17287))))

(declare-fun b!872934 () Bool)

(declare-fun lt!395488 () Unit!29871)

(declare-fun lt!395486 () Unit!29871)

(assert (=> b!872934 (= lt!395488 lt!395486)))

(declare-fun lt!395484 () V!28041)

(declare-fun lt!395487 () (_ BitVec 64))

(declare-fun lt!395485 () ListLongMap!10239)

(declare-fun lt!395482 () (_ BitVec 64))

(assert (=> b!872934 (not (contains!4214 (+!2489 lt!395485 (tuple2!11481 lt!395482 lt!395484)) lt!395487))))

(assert (=> b!872934 (= lt!395486 (addStillNotContains!200 lt!395485 lt!395482 lt!395484 lt!395487))))

(assert (=> b!872934 (= lt!395487 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!872934 (= lt!395484 (get!12818 (select (arr!24335 _values!688) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!872934 (= lt!395482 (select (arr!24334 _keys!868) from!1053))))

(assert (=> b!872934 (= lt!395485 call!38501)))

(assert (=> b!872934 (= e!486092 (+!2489 call!38501 (tuple2!11481 (select (arr!24334 _keys!868) from!1053) (get!12818 (select (arr!24335 _values!688) from!1053) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!872935 () Bool)

(assert (=> b!872935 (= e!486094 (validKeyInArray!0 (select (arr!24334 _keys!868) from!1053)))))

(assert (=> b!872935 (bvsge from!1053 #b00000000000000000000000000000000)))

(declare-fun b!872936 () Bool)

(declare-fun res!593275 () Bool)

(assert (=> b!872936 (=> (not res!593275) (not e!486095))))

(assert (=> b!872936 (= res!593275 (not (contains!4214 lt!395483 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!872937 () Bool)

(assert (=> b!872937 (= e!486098 e!486092)))

(declare-fun c!92376 () Bool)

(assert (=> b!872937 (= c!92376 (validKeyInArray!0 (select (arr!24334 _keys!868) from!1053)))))

(declare-fun b!872938 () Bool)

(assert (=> b!872938 (= e!486097 e!486093)))

(assert (=> b!872938 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvslt from!1053 (size!24776 _keys!868)))))

(declare-fun res!593274 () Bool)

(assert (=> b!872938 (= res!593274 (contains!4214 lt!395483 (select (arr!24334 _keys!868) from!1053)))))

(assert (=> b!872938 (=> (not res!593274) (not e!486093))))

(declare-fun bm!38498 () Bool)

(assert (=> bm!38498 (= call!38501 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108305 c!92377) b!872933))

(assert (= (and d!108305 (not c!92377)) b!872937))

(assert (= (and b!872937 c!92376) b!872934))

(assert (= (and b!872937 (not c!92376)) b!872927))

(assert (= (or b!872934 b!872927) bm!38498))

(assert (= (and d!108305 res!593276) b!872936))

(assert (= (and b!872936 res!593275) b!872931))

(assert (= (and b!872931 res!593273) b!872935))

(assert (= (and b!872931 c!92374) b!872938))

(assert (= (and b!872931 (not c!92374)) b!872930))

(assert (= (and b!872938 res!593274) b!872928))

(assert (= (and b!872930 c!92375) b!872929))

(assert (= (and b!872930 (not c!92375)) b!872932))

(declare-fun b_lambda!12115 () Bool)

(assert (=> (not b_lambda!12115) (not b!872928)))

(assert (=> b!872928 t!24323))

(declare-fun b_and!24753 () Bool)

(assert (= b_and!24751 (and (=> t!24323 result!9395) b_and!24753)))

(declare-fun b_lambda!12117 () Bool)

(assert (=> (not b_lambda!12117) (not b!872934)))

(assert (=> b!872934 t!24323))

(declare-fun b_and!24755 () Bool)

(assert (= b_and!24753 (and (=> t!24323 result!9395) b_and!24755)))

(assert (=> b!872938 m!812973))

(assert (=> b!872938 m!812973))

(declare-fun m!813001 () Bool)

(assert (=> b!872938 m!813001))

(declare-fun m!813003 () Bool)

(assert (=> b!872932 m!813003))

(declare-fun m!813005 () Bool)

(assert (=> b!872929 m!813005))

(declare-fun m!813007 () Bool)

(assert (=> b!872928 m!813007))

(assert (=> b!872928 m!812953))

(declare-fun m!813009 () Bool)

(assert (=> b!872928 m!813009))

(assert (=> b!872928 m!813007))

(assert (=> b!872928 m!812973))

(assert (=> b!872928 m!812973))

(declare-fun m!813011 () Bool)

(assert (=> b!872928 m!813011))

(assert (=> b!872928 m!812953))

(assert (=> b!872934 m!813007))

(assert (=> b!872934 m!812953))

(assert (=> b!872934 m!813009))

(assert (=> b!872934 m!813007))

(assert (=> b!872934 m!812973))

(declare-fun m!813013 () Bool)

(assert (=> b!872934 m!813013))

(declare-fun m!813015 () Bool)

(assert (=> b!872934 m!813015))

(assert (=> b!872934 m!812953))

(declare-fun m!813017 () Bool)

(assert (=> b!872934 m!813017))

(assert (=> b!872934 m!813013))

(declare-fun m!813019 () Bool)

(assert (=> b!872934 m!813019))

(assert (=> b!872935 m!812973))

(assert (=> b!872935 m!812973))

(assert (=> b!872935 m!812995))

(declare-fun m!813021 () Bool)

(assert (=> d!108305 m!813021))

(assert (=> d!108305 m!812861))

(declare-fun m!813023 () Bool)

(assert (=> b!872936 m!813023))

(assert (=> bm!38498 m!813005))

(assert (=> b!872937 m!812973))

(assert (=> b!872937 m!812973))

(assert (=> b!872937 m!812995))

(assert (=> b!872777 d!108305))

(declare-fun e!486104 () Bool)

(declare-fun call!38507 () ListLongMap!10239)

(declare-fun call!38506 () ListLongMap!10239)

(declare-fun b!872945 () Bool)

(assert (=> b!872945 (= e!486104 (= call!38506 (+!2489 call!38507 (tuple2!11481 k0!854 v!557))))))

(declare-fun bm!38503 () Bool)

(assert (=> bm!38503 (= call!38506 (getCurrentListMapNoExtraKeys!3128 _keys!868 (array!50610 (store (arr!24335 _values!688) i!612 (ValueCellFull!8183 v!557)) (size!24777 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872947 () Bool)

(declare-fun e!486103 () Bool)

(assert (=> b!872947 (= e!486103 e!486104)))

(declare-fun c!92380 () Bool)

(assert (=> b!872947 (= c!92380 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun bm!38504 () Bool)

(assert (=> bm!38504 (= call!38507 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!872946 () Bool)

(assert (=> b!872946 (= e!486104 (= call!38506 call!38507))))

(declare-fun d!108307 () Bool)

(assert (=> d!108307 e!486103))

(declare-fun res!593279 () Bool)

(assert (=> d!108307 (=> (not res!593279) (not e!486103))))

(assert (=> d!108307 (= res!593279 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612)) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24777 _values!688)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612) (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24777 _values!688))))))))

(declare-fun lt!395491 () Unit!29871)

(declare-fun choose!1437 (array!50607 array!50609 (_ BitVec 32) (_ BitVec 32) V!28041 V!28041 (_ BitVec 32) (_ BitVec 64) V!28041 (_ BitVec 32) Int) Unit!29871)

(assert (=> d!108307 (= lt!395491 (choose!1437 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> d!108307 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(assert (=> d!108307 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!659 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!395491)))

(assert (= (and d!108307 res!593279) b!872947))

(assert (= (and b!872947 c!92380) b!872945))

(assert (= (and b!872947 (not c!92380)) b!872946))

(assert (= (or b!872945 b!872946) bm!38504))

(assert (= (or b!872945 b!872946) bm!38503))

(declare-fun m!813025 () Bool)

(assert (=> b!872945 m!813025))

(assert (=> bm!38503 m!812851))

(assert (=> bm!38503 m!812869))

(assert (=> bm!38504 m!812845))

(declare-fun m!813027 () Bool)

(assert (=> d!108307 m!813027))

(assert (=> b!872777 d!108307))

(declare-fun b!872958 () Bool)

(declare-fun e!486114 () Bool)

(declare-fun call!38510 () Bool)

(assert (=> b!872958 (= e!486114 call!38510)))

(declare-fun b!872959 () Bool)

(declare-fun e!486115 () Bool)

(assert (=> b!872959 (= e!486115 e!486114)))

(declare-fun c!92383 () Bool)

(assert (=> b!872959 (= c!92383 (validKeyInArray!0 (select (arr!24334 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!872960 () Bool)

(declare-fun e!486113 () Bool)

(declare-fun contains!4215 (List!17289 (_ BitVec 64)) Bool)

(assert (=> b!872960 (= e!486113 (contains!4215 Nil!17286 (select (arr!24334 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!38507 () Bool)

(assert (=> bm!38507 (= call!38510 (arrayNoDuplicates!0 _keys!868 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!92383 (Cons!17285 (select (arr!24334 _keys!868) #b00000000000000000000000000000000) Nil!17286) Nil!17286)))))

(declare-fun d!108309 () Bool)

(declare-fun res!593286 () Bool)

(declare-fun e!486116 () Bool)

(assert (=> d!108309 (=> res!593286 e!486116)))

(assert (=> d!108309 (= res!593286 (bvsge #b00000000000000000000000000000000 (size!24776 _keys!868)))))

(assert (=> d!108309 (= (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17286) e!486116)))

(declare-fun b!872961 () Bool)

(assert (=> b!872961 (= e!486116 e!486115)))

(declare-fun res!593287 () Bool)

(assert (=> b!872961 (=> (not res!593287) (not e!486115))))

(assert (=> b!872961 (= res!593287 (not e!486113))))

(declare-fun res!593288 () Bool)

(assert (=> b!872961 (=> (not res!593288) (not e!486113))))

(assert (=> b!872961 (= res!593288 (validKeyInArray!0 (select (arr!24334 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun b!872962 () Bool)

(assert (=> b!872962 (= e!486114 call!38510)))

(assert (= (and d!108309 (not res!593286)) b!872961))

(assert (= (and b!872961 res!593288) b!872960))

(assert (= (and b!872961 res!593287) b!872959))

(assert (= (and b!872959 c!92383) b!872958))

(assert (= (and b!872959 (not c!92383)) b!872962))

(assert (= (or b!872958 b!872962) bm!38507))

(assert (=> b!872959 m!812931))

(assert (=> b!872959 m!812931))

(assert (=> b!872959 m!812933))

(assert (=> b!872960 m!812931))

(assert (=> b!872960 m!812931))

(declare-fun m!813029 () Bool)

(assert (=> b!872960 m!813029))

(assert (=> bm!38507 m!812931))

(declare-fun m!813031 () Bool)

(assert (=> bm!38507 m!813031))

(assert (=> b!872961 m!812931))

(assert (=> b!872961 m!812931))

(assert (=> b!872961 m!812933))

(assert (=> b!872774 d!108309))

(declare-fun b!872963 () Bool)

(declare-fun e!486117 () ListLongMap!10239)

(declare-fun call!38511 () ListLongMap!10239)

(assert (=> b!872963 (= e!486117 call!38511)))

(declare-fun d!108311 () Bool)

(declare-fun e!486120 () Bool)

(assert (=> d!108311 e!486120))

(declare-fun res!593292 () Bool)

(assert (=> d!108311 (=> (not res!593292) (not e!486120))))

(declare-fun lt!395493 () ListLongMap!10239)

(assert (=> d!108311 (= res!593292 (not (contains!4214 lt!395493 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!486123 () ListLongMap!10239)

(assert (=> d!108311 (= lt!395493 e!486123)))

(declare-fun c!92387 () Bool)

(assert (=> d!108311 (= c!92387 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(assert (=> d!108311 (validMask!0 mask!1196)))

(assert (=> d!108311 (= (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) lt!395493)))

(declare-fun b!872964 () Bool)

(assert (=> b!872964 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(assert (=> b!872964 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24777 _values!688)))))

(declare-fun e!486118 () Bool)

(assert (=> b!872964 (= e!486118 (= (apply!374 lt!395493 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))) (get!12818 (select (arr!24335 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!486121 () Bool)

(declare-fun b!872965 () Bool)

(assert (=> b!872965 (= e!486121 (= lt!395493 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696)))))

(declare-fun b!872966 () Bool)

(declare-fun e!486122 () Bool)

(assert (=> b!872966 (= e!486122 e!486121)))

(declare-fun c!92385 () Bool)

(assert (=> b!872966 (= c!92385 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(declare-fun b!872967 () Bool)

(assert (=> b!872967 (= e!486120 e!486122)))

(declare-fun c!92384 () Bool)

(declare-fun e!486119 () Bool)

(assert (=> b!872967 (= c!92384 e!486119)))

(declare-fun res!593289 () Bool)

(assert (=> b!872967 (=> (not res!593289) (not e!486119))))

(assert (=> b!872967 (= res!593289 (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(declare-fun b!872968 () Bool)

(assert (=> b!872968 (= e!486121 (isEmpty!665 lt!395493))))

(declare-fun b!872969 () Bool)

(assert (=> b!872969 (= e!486123 (ListLongMap!10240 Nil!17287))))

(declare-fun b!872970 () Bool)

(declare-fun lt!395498 () Unit!29871)

(declare-fun lt!395496 () Unit!29871)

(assert (=> b!872970 (= lt!395498 lt!395496)))

(declare-fun lt!395495 () ListLongMap!10239)

(declare-fun lt!395492 () (_ BitVec 64))

(declare-fun lt!395494 () V!28041)

(declare-fun lt!395497 () (_ BitVec 64))

(assert (=> b!872970 (not (contains!4214 (+!2489 lt!395495 (tuple2!11481 lt!395492 lt!395494)) lt!395497))))

(assert (=> b!872970 (= lt!395496 (addStillNotContains!200 lt!395495 lt!395492 lt!395494 lt!395497))))

(assert (=> b!872970 (= lt!395497 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!872970 (= lt!395494 (get!12818 (select (arr!24335 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!872970 (= lt!395492 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)))))

(assert (=> b!872970 (= lt!395495 call!38511)))

(assert (=> b!872970 (= e!486117 (+!2489 call!38511 (tuple2!11481 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053)) (get!12818 (select (arr!24335 _values!688) (bvadd #b00000000000000000000000000000001 from!1053)) (dynLambda!1201 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!872971 () Bool)

(assert (=> b!872971 (= e!486119 (validKeyInArray!0 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!872971 (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))

(declare-fun b!872972 () Bool)

(declare-fun res!593291 () Bool)

(assert (=> b!872972 (=> (not res!593291) (not e!486120))))

(assert (=> b!872972 (= res!593291 (not (contains!4214 lt!395493 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!872973 () Bool)

(assert (=> b!872973 (= e!486123 e!486117)))

(declare-fun c!92386 () Bool)

(assert (=> b!872973 (= c!92386 (validKeyInArray!0 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(declare-fun b!872974 () Bool)

(assert (=> b!872974 (= e!486122 e!486118)))

(assert (=> b!872974 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1053) (size!24776 _keys!868)))))

(declare-fun res!593290 () Bool)

(assert (=> b!872974 (= res!593290 (contains!4214 lt!395493 (select (arr!24334 _keys!868) (bvadd #b00000000000000000000000000000001 from!1053))))))

(assert (=> b!872974 (=> (not res!593290) (not e!486118))))

(declare-fun bm!38508 () Bool)

(assert (=> bm!38508 (= call!38511 (getCurrentListMapNoExtraKeys!3128 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053 #b00000000000000000000000000000001) defaultEntry!696))))

(assert (= (and d!108311 c!92387) b!872969))

(assert (= (and d!108311 (not c!92387)) b!872973))

(assert (= (and b!872973 c!92386) b!872970))

(assert (= (and b!872973 (not c!92386)) b!872963))

(assert (= (or b!872970 b!872963) bm!38508))

(assert (= (and d!108311 res!593292) b!872972))

(assert (= (and b!872972 res!593291) b!872967))

(assert (= (and b!872967 res!593289) b!872971))

(assert (= (and b!872967 c!92384) b!872974))

(assert (= (and b!872967 (not c!92384)) b!872966))

(assert (= (and b!872974 res!593290) b!872964))

(assert (= (and b!872966 c!92385) b!872965))

(assert (= (and b!872966 (not c!92385)) b!872968))

(declare-fun b_lambda!12119 () Bool)

(assert (=> (not b_lambda!12119) (not b!872964)))

(assert (=> b!872964 t!24323))

(declare-fun b_and!24757 () Bool)

(assert (= b_and!24755 (and (=> t!24323 result!9395) b_and!24757)))

(declare-fun b_lambda!12121 () Bool)

(assert (=> (not b_lambda!12121) (not b!872970)))

(assert (=> b!872970 t!24323))

(declare-fun b_and!24759 () Bool)

(assert (= b_and!24757 (and (=> t!24323 result!9395) b_and!24759)))

(assert (=> b!872974 m!812943))

(assert (=> b!872974 m!812943))

(declare-fun m!813033 () Bool)

(assert (=> b!872974 m!813033))

(declare-fun m!813035 () Bool)

(assert (=> b!872968 m!813035))

(declare-fun m!813037 () Bool)

(assert (=> b!872965 m!813037))

(declare-fun m!813039 () Bool)

(assert (=> b!872964 m!813039))

(assert (=> b!872964 m!812953))

(declare-fun m!813041 () Bool)

(assert (=> b!872964 m!813041))

(assert (=> b!872964 m!813039))

(assert (=> b!872964 m!812943))

(assert (=> b!872964 m!812943))

(declare-fun m!813043 () Bool)

(assert (=> b!872964 m!813043))

(assert (=> b!872964 m!812953))

(assert (=> b!872970 m!813039))

(assert (=> b!872970 m!812953))

(assert (=> b!872970 m!813041))

(assert (=> b!872970 m!813039))

(assert (=> b!872970 m!812943))

(declare-fun m!813045 () Bool)

(assert (=> b!872970 m!813045))

(declare-fun m!813047 () Bool)

(assert (=> b!872970 m!813047))

(assert (=> b!872970 m!812953))

(declare-fun m!813049 () Bool)

(assert (=> b!872970 m!813049))

(assert (=> b!872970 m!813045))

(declare-fun m!813051 () Bool)

(assert (=> b!872970 m!813051))

(assert (=> b!872971 m!812943))

(assert (=> b!872971 m!812943))

(assert (=> b!872971 m!812967))

(declare-fun m!813053 () Bool)

(assert (=> d!108311 m!813053))

(assert (=> d!108311 m!812861))

(declare-fun m!813055 () Bool)

(assert (=> b!872972 m!813055))

(assert (=> bm!38508 m!813037))

(assert (=> b!872973 m!812943))

(assert (=> b!872973 m!812943))

(assert (=> b!872973 m!812967))

(assert (=> bm!38477 d!108311))

(declare-fun d!108313 () Bool)

(assert (=> d!108313 (= (validKeyInArray!0 k0!854) (and (not (= k0!854 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!854 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!872775 d!108313))

(declare-fun d!108315 () Bool)

(declare-fun e!486126 () Bool)

(assert (=> d!108315 e!486126))

(declare-fun res!593297 () Bool)

(assert (=> d!108315 (=> (not res!593297) (not e!486126))))

(declare-fun lt!395510 () ListLongMap!10239)

(assert (=> d!108315 (= res!593297 (contains!4214 lt!395510 (_1!5751 (tuple2!11481 k0!854 v!557))))))

(declare-fun lt!395508 () List!17290)

(assert (=> d!108315 (= lt!395510 (ListLongMap!10240 lt!395508))))

(declare-fun lt!395507 () Unit!29871)

(declare-fun lt!395509 () Unit!29871)

(assert (=> d!108315 (= lt!395507 lt!395509)))

(declare-datatypes ((Option!421 0))(
  ( (Some!420 (v!11095 V!28041)) (None!419) )
))
(declare-fun getValueByKey!415 (List!17290 (_ BitVec 64)) Option!421)

(assert (=> d!108315 (= (getValueByKey!415 lt!395508 (_1!5751 (tuple2!11481 k0!854 v!557))) (Some!420 (_2!5751 (tuple2!11481 k0!854 v!557))))))

(declare-fun lemmaContainsTupThenGetReturnValue!232 (List!17290 (_ BitVec 64) V!28041) Unit!29871)

(assert (=> d!108315 (= lt!395509 (lemmaContainsTupThenGetReturnValue!232 lt!395508 (_1!5751 (tuple2!11481 k0!854 v!557)) (_2!5751 (tuple2!11481 k0!854 v!557))))))

(declare-fun insertStrictlySorted!271 (List!17290 (_ BitVec 64) V!28041) List!17290)

(assert (=> d!108315 (= lt!395508 (insertStrictlySorted!271 (toList!5135 call!38480) (_1!5751 (tuple2!11481 k0!854 v!557)) (_2!5751 (tuple2!11481 k0!854 v!557))))))

(assert (=> d!108315 (= (+!2489 call!38480 (tuple2!11481 k0!854 v!557)) lt!395510)))

(declare-fun b!872979 () Bool)

(declare-fun res!593298 () Bool)

(assert (=> b!872979 (=> (not res!593298) (not e!486126))))

(assert (=> b!872979 (= res!593298 (= (getValueByKey!415 (toList!5135 lt!395510) (_1!5751 (tuple2!11481 k0!854 v!557))) (Some!420 (_2!5751 (tuple2!11481 k0!854 v!557)))))))

(declare-fun b!872980 () Bool)

(declare-fun contains!4216 (List!17290 tuple2!11480) Bool)

(assert (=> b!872980 (= e!486126 (contains!4216 (toList!5135 lt!395510) (tuple2!11481 k0!854 v!557)))))

(assert (= (and d!108315 res!593297) b!872979))

(assert (= (and b!872979 res!593298) b!872980))

(declare-fun m!813057 () Bool)

(assert (=> d!108315 m!813057))

(declare-fun m!813059 () Bool)

(assert (=> d!108315 m!813059))

(declare-fun m!813061 () Bool)

(assert (=> d!108315 m!813061))

(declare-fun m!813063 () Bool)

(assert (=> d!108315 m!813063))

(declare-fun m!813065 () Bool)

(assert (=> b!872979 m!813065))

(declare-fun m!813067 () Bool)

(assert (=> b!872980 m!813067))

(assert (=> b!872779 d!108315))

(declare-fun b!872988 () Bool)

(declare-fun e!486131 () Bool)

(assert (=> b!872988 (= e!486131 tp_is_empty!17245)))

(declare-fun b!872987 () Bool)

(declare-fun e!486132 () Bool)

(assert (=> b!872987 (= e!486132 tp_is_empty!17245)))

(declare-fun condMapEmpty!27479 () Bool)

(declare-fun mapDefault!27479 () ValueCell!8183)

(assert (=> mapNonEmpty!27470 (= condMapEmpty!27479 (= mapRest!27470 ((as const (Array (_ BitVec 32) ValueCell!8183)) mapDefault!27479)))))

(declare-fun mapRes!27479 () Bool)

(assert (=> mapNonEmpty!27470 (= tp!52691 (and e!486131 mapRes!27479))))

(declare-fun mapIsEmpty!27479 () Bool)

(assert (=> mapIsEmpty!27479 mapRes!27479))

(declare-fun mapNonEmpty!27479 () Bool)

(declare-fun tp!52706 () Bool)

(assert (=> mapNonEmpty!27479 (= mapRes!27479 (and tp!52706 e!486132))))

(declare-fun mapValue!27479 () ValueCell!8183)

(declare-fun mapRest!27479 () (Array (_ BitVec 32) ValueCell!8183))

(declare-fun mapKey!27479 () (_ BitVec 32))

(assert (=> mapNonEmpty!27479 (= mapRest!27470 (store mapRest!27479 mapKey!27479 mapValue!27479))))

(assert (= (and mapNonEmpty!27470 condMapEmpty!27479) mapIsEmpty!27479))

(assert (= (and mapNonEmpty!27470 (not condMapEmpty!27479)) mapNonEmpty!27479))

(assert (= (and mapNonEmpty!27479 ((_ is ValueCellFull!8183) mapValue!27479)) b!872987))

(assert (= (and mapNonEmpty!27470 ((_ is ValueCellFull!8183) mapDefault!27479)) b!872988))

(declare-fun m!813069 () Bool)

(assert (=> mapNonEmpty!27479 m!813069))

(declare-fun b_lambda!12123 () Bool)

(assert (= b_lambda!12119 (or (and start!74188 b_free!15013) b_lambda!12123)))

(declare-fun b_lambda!12125 () Bool)

(assert (= b_lambda!12111 (or (and start!74188 b_free!15013) b_lambda!12125)))

(declare-fun b_lambda!12127 () Bool)

(assert (= b_lambda!12109 (or (and start!74188 b_free!15013) b_lambda!12127)))

(declare-fun b_lambda!12129 () Bool)

(assert (= b_lambda!12115 (or (and start!74188 b_free!15013) b_lambda!12129)))

(declare-fun b_lambda!12131 () Bool)

(assert (= b_lambda!12121 (or (and start!74188 b_free!15013) b_lambda!12131)))

(declare-fun b_lambda!12133 () Bool)

(assert (= b_lambda!12117 (or (and start!74188 b_free!15013) b_lambda!12133)))

(declare-fun b_lambda!12135 () Bool)

(assert (= b_lambda!12113 (or (and start!74188 b_free!15013) b_lambda!12135)))

(declare-fun b_lambda!12137 () Bool)

(assert (= b_lambda!12107 (or (and start!74188 b_free!15013) b_lambda!12137)))

(check-sat (not bm!38493) (not b!872910) (not b!872980) tp_is_empty!17245 (not d!108311) (not bm!38497) (not b!872917) (not b_lambda!12131) (not b!872902) (not bm!38508) (not mapNonEmpty!27479) (not b!872876) (not b!872961) (not b!872935) (not b!872979) (not b!872912) (not b_lambda!12137) (not b!872970) (not b_lambda!12135) (not b!872960) (not b!872873) (not bm!38503) (not b!872945) (not b!872922) (not b!872925) (not bm!38507) (not b!872932) (not b!872924) (not b!872909) (not b!872923) (not b!872959) (not bm!38498) (not b_lambda!12125) (not bm!38504) (not b!872964) (not b!872965) (not b!872934) (not d!108303) (not d!108305) (not b!872972) (not b!872906) (not b!872973) (not b!872908) (not d!108301) (not b!872911) (not bm!38496) (not b!872937) (not b!872929) (not b!872936) b_and!24759 (not b!872968) (not b_lambda!12129) (not b!872920) (not b!872926) (not b_lambda!12127) (not b!872928) (not b!872903) (not b_lambda!12133) (not b!872971) (not b!872974) (not b_lambda!12123) (not b!872938) (not b_next!15013) (not b!872916) (not d!108307) (not d!108315))
(check-sat b_and!24759 (not b_next!15013))
