; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43314 () Bool)

(assert start!43314)

(declare-fun b_free!12175 () Bool)

(declare-fun b_next!12175 () Bool)

(assert (=> start!43314 (= b_free!12175 (not b_next!12175))))

(declare-fun tp!42798 () Bool)

(declare-fun b_and!20903 () Bool)

(assert (=> start!43314 (= tp!42798 b_and!20903)))

(declare-fun b!479700 () Bool)

(declare-fun res!286148 () Bool)

(declare-fun e!282247 () Bool)

(assert (=> b!479700 (=> (not res!286148) (not e!282247))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19321 0))(
  ( (V!19322 (val!6891 Int)) )
))
(declare-fun minValue!1458 () V!19321)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19321)

(declare-datatypes ((ValueCell!6482 0))(
  ( (ValueCellFull!6482 (v!9175 V!19321)) (EmptyCell!6482) )
))
(declare-datatypes ((array!31037 0))(
  ( (array!31038 (arr!14924 (Array (_ BitVec 32) ValueCell!6482)) (size!15283 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31037)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31039 0))(
  ( (array!31040 (arr!14925 (Array (_ BitVec 32) (_ BitVec 64))) (size!15284 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31039)

(declare-datatypes ((tuple2!9096 0))(
  ( (tuple2!9097 (_1!4559 (_ BitVec 64)) (_2!4559 V!19321)) )
))
(declare-datatypes ((List!9159 0))(
  ( (Nil!9156) (Cons!9155 (h!10011 tuple2!9096) (t!15358 List!9159)) )
))
(declare-datatypes ((ListLongMap!7999 0))(
  ( (ListLongMap!8000 (toList!4015 List!9159)) )
))
(declare-fun contains!2591 (ListLongMap!7999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2268 (array!31039 array!31037 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 32) Int) ListLongMap!7999)

(assert (=> b!479700 (= res!286148 (contains!2591 (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479701 () Bool)

(declare-fun res!286147 () Bool)

(assert (=> b!479701 (=> (not res!286147) (not e!282247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!479701 (= res!286147 (validKeyInArray!0 k0!1332))))

(declare-fun res!286149 () Bool)

(assert (=> start!43314 (=> (not res!286149) (not e!282247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43314 (= res!286149 (validMask!0 mask!2352))))

(assert (=> start!43314 e!282247))

(assert (=> start!43314 true))

(declare-fun tp_is_empty!13687 () Bool)

(assert (=> start!43314 tp_is_empty!13687))

(declare-fun e!282250 () Bool)

(declare-fun array_inv!10860 (array!31037) Bool)

(assert (=> start!43314 (and (array_inv!10860 _values!1516) e!282250)))

(assert (=> start!43314 tp!42798))

(declare-fun array_inv!10861 (array!31039) Bool)

(assert (=> start!43314 (array_inv!10861 _keys!1874)))

(declare-fun b!479702 () Bool)

(declare-fun e!282248 () Bool)

(declare-fun arrayContainsKey!0 (array!31039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!479702 (= e!282248 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479703 () Bool)

(declare-fun res!286146 () Bool)

(assert (=> b!479703 (=> (not res!286146) (not e!282247))))

(declare-datatypes ((List!9160 0))(
  ( (Nil!9157) (Cons!9156 (h!10012 (_ BitVec 64)) (t!15359 List!9160)) )
))
(declare-fun arrayNoDuplicates!0 (array!31039 (_ BitVec 32) List!9160) Bool)

(assert (=> b!479703 (= res!286146 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9157))))

(declare-fun b!479704 () Bool)

(declare-fun e!282249 () Bool)

(assert (=> b!479704 (= e!282249 tp_is_empty!13687)))

(declare-fun b!479705 () Bool)

(declare-fun e!282251 () Bool)

(assert (=> b!479705 (= e!282251 tp_is_empty!13687)))

(declare-fun b!479706 () Bool)

(declare-fun res!286143 () Bool)

(assert (=> b!479706 (=> (not res!286143) (not e!282247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31039 (_ BitVec 32)) Bool)

(assert (=> b!479706 (= res!286143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22231 () Bool)

(declare-fun mapRes!22231 () Bool)

(declare-fun tp!42799 () Bool)

(assert (=> mapNonEmpty!22231 (= mapRes!22231 (and tp!42799 e!282251))))

(declare-fun mapKey!22231 () (_ BitVec 32))

(declare-fun mapRest!22231 () (Array (_ BitVec 32) ValueCell!6482))

(declare-fun mapValue!22231 () ValueCell!6482)

(assert (=> mapNonEmpty!22231 (= (arr!14924 _values!1516) (store mapRest!22231 mapKey!22231 mapValue!22231))))

(declare-fun b!479707 () Bool)

(assert (=> b!479707 (= e!282250 (and e!282249 mapRes!22231))))

(declare-fun condMapEmpty!22231 () Bool)

(declare-fun mapDefault!22231 () ValueCell!6482)

(assert (=> b!479707 (= condMapEmpty!22231 (= (arr!14924 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6482)) mapDefault!22231)))))

(declare-fun b!479708 () Bool)

(declare-fun e!282252 () Bool)

(assert (=> b!479708 (= e!282252 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479709 () Bool)

(assert (=> b!479709 (= e!282252 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!479710 () Bool)

(declare-fun res!286145 () Bool)

(assert (=> b!479710 (=> (not res!286145) (not e!282247))))

(assert (=> b!479710 (= res!286145 (and (= (size!15283 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15284 _keys!1874) (size!15283 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22231 () Bool)

(assert (=> mapIsEmpty!22231 mapRes!22231))

(declare-fun b!479711 () Bool)

(assert (=> b!479711 (= e!282247 (not e!282248))))

(declare-fun res!286144 () Bool)

(assert (=> b!479711 (=> res!286144 e!282248)))

(assert (=> b!479711 (= res!286144 (or (bvsge #b00000000000000000000000000000000 (size!15284 _keys!1874)) (bvsge (size!15284 _keys!1874) #b01111111111111111111111111111111)))))

(assert (=> b!479711 e!282252))

(declare-fun c!57647 () Bool)

(assert (=> b!479711 (= c!57647 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14052 0))(
  ( (Unit!14053) )
))
(declare-fun lt!217771 () Unit!14052)

(declare-fun lemmaKeyInListMapIsInArray!116 (array!31039 array!31037 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 64) Int) Unit!14052)

(assert (=> b!479711 (= lt!217771 (lemmaKeyInListMapIsInArray!116 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43314 res!286149) b!479710))

(assert (= (and b!479710 res!286145) b!479706))

(assert (= (and b!479706 res!286143) b!479703))

(assert (= (and b!479703 res!286146) b!479700))

(assert (= (and b!479700 res!286148) b!479701))

(assert (= (and b!479701 res!286147) b!479711))

(assert (= (and b!479711 c!57647) b!479708))

(assert (= (and b!479711 (not c!57647)) b!479709))

(assert (= (and b!479711 (not res!286144)) b!479702))

(assert (= (and b!479707 condMapEmpty!22231) mapIsEmpty!22231))

(assert (= (and b!479707 (not condMapEmpty!22231)) mapNonEmpty!22231))

(get-info :version)

(assert (= (and mapNonEmpty!22231 ((_ is ValueCellFull!6482) mapValue!22231)) b!479705))

(assert (= (and b!479707 ((_ is ValueCellFull!6482) mapDefault!22231)) b!479704))

(assert (= start!43314 b!479707))

(declare-fun m!461031 () Bool)

(assert (=> b!479706 m!461031))

(declare-fun m!461033 () Bool)

(assert (=> b!479701 m!461033))

(declare-fun m!461035 () Bool)

(assert (=> start!43314 m!461035))

(declare-fun m!461037 () Bool)

(assert (=> start!43314 m!461037))

(declare-fun m!461039 () Bool)

(assert (=> start!43314 m!461039))

(declare-fun m!461041 () Bool)

(assert (=> b!479702 m!461041))

(assert (=> b!479708 m!461041))

(declare-fun m!461043 () Bool)

(assert (=> mapNonEmpty!22231 m!461043))

(declare-fun m!461045 () Bool)

(assert (=> b!479700 m!461045))

(assert (=> b!479700 m!461045))

(declare-fun m!461047 () Bool)

(assert (=> b!479700 m!461047))

(declare-fun m!461049 () Bool)

(assert (=> b!479711 m!461049))

(declare-fun m!461051 () Bool)

(assert (=> b!479703 m!461051))

(check-sat (not start!43314) (not b!479706) (not b!479702) (not mapNonEmpty!22231) (not b!479703) (not b!479711) (not b!479701) (not b_next!12175) (not b!479708) tp_is_empty!13687 (not b!479700) b_and!20903)
(check-sat b_and!20903 (not b_next!12175))
(get-model)

(declare-fun d!76501 () Bool)

(declare-fun e!282300 () Bool)

(assert (=> d!76501 e!282300))

(declare-fun res!286194 () Bool)

(assert (=> d!76501 (=> res!286194 e!282300)))

(declare-fun lt!217786 () Bool)

(assert (=> d!76501 (= res!286194 (not lt!217786))))

(declare-fun lt!217789 () Bool)

(assert (=> d!76501 (= lt!217786 lt!217789)))

(declare-fun lt!217788 () Unit!14052)

(declare-fun e!282299 () Unit!14052)

(assert (=> d!76501 (= lt!217788 e!282299)))

(declare-fun c!57656 () Bool)

(assert (=> d!76501 (= c!57656 lt!217789)))

(declare-fun containsKey!353 (List!9159 (_ BitVec 64)) Bool)

(assert (=> d!76501 (= lt!217789 (containsKey!353 (toList!4015 (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76501 (= (contains!2591 (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!217786)))

(declare-fun b!479790 () Bool)

(declare-fun lt!217787 () Unit!14052)

(assert (=> b!479790 (= e!282299 lt!217787)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!302 (List!9159 (_ BitVec 64)) Unit!14052)

(assert (=> b!479790 (= lt!217787 (lemmaContainsKeyImpliesGetValueByKeyDefined!302 (toList!4015 (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!397 0))(
  ( (Some!396 (v!9178 V!19321)) (None!395) )
))
(declare-fun isDefined!303 (Option!397) Bool)

(declare-fun getValueByKey!391 (List!9159 (_ BitVec 64)) Option!397)

(assert (=> b!479790 (isDefined!303 (getValueByKey!391 (toList!4015 (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!479791 () Bool)

(declare-fun Unit!14056 () Unit!14052)

(assert (=> b!479791 (= e!282299 Unit!14056)))

(declare-fun b!479792 () Bool)

(assert (=> b!479792 (= e!282300 (isDefined!303 (getValueByKey!391 (toList!4015 (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76501 c!57656) b!479790))

(assert (= (and d!76501 (not c!57656)) b!479791))

(assert (= (and d!76501 (not res!286194)) b!479792))

(declare-fun m!461097 () Bool)

(assert (=> d!76501 m!461097))

(declare-fun m!461099 () Bool)

(assert (=> b!479790 m!461099))

(declare-fun m!461101 () Bool)

(assert (=> b!479790 m!461101))

(assert (=> b!479790 m!461101))

(declare-fun m!461103 () Bool)

(assert (=> b!479790 m!461103))

(assert (=> b!479792 m!461101))

(assert (=> b!479792 m!461101))

(assert (=> b!479792 m!461103))

(assert (=> b!479700 d!76501))

(declare-fun b!479835 () Bool)

(declare-fun e!282338 () Bool)

(assert (=> b!479835 (= e!282338 (validKeyInArray!0 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479836 () Bool)

(declare-fun e!282333 () Bool)

(assert (=> b!479836 (= e!282333 (validKeyInArray!0 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479837 () Bool)

(declare-fun e!282332 () ListLongMap!7999)

(declare-fun e!282339 () ListLongMap!7999)

(assert (=> b!479837 (= e!282332 e!282339)))

(declare-fun c!57671 () Bool)

(assert (=> b!479837 (= c!57671 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!479838 () Bool)

(declare-fun e!282329 () Bool)

(declare-fun lt!217851 () ListLongMap!7999)

(declare-fun apply!340 (ListLongMap!7999 (_ BitVec 64)) V!19321)

(assert (=> b!479838 (= e!282329 (= (apply!340 lt!217851 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun bm!30861 () Bool)

(declare-fun call!30870 () ListLongMap!7999)

(declare-fun call!30864 () ListLongMap!7999)

(assert (=> bm!30861 (= call!30870 call!30864)))

(declare-fun b!479839 () Bool)

(declare-fun e!282328 () ListLongMap!7999)

(assert (=> b!479839 (= e!282328 call!30870)))

(declare-fun b!479840 () Bool)

(assert (=> b!479840 (= e!282339 call!30870)))

(declare-fun bm!30862 () Bool)

(declare-fun call!30867 () ListLongMap!7999)

(declare-fun call!30865 () ListLongMap!7999)

(assert (=> bm!30862 (= call!30867 call!30865)))

(declare-fun b!479841 () Bool)

(declare-fun e!282331 () Bool)

(declare-fun e!282336 () Bool)

(assert (=> b!479841 (= e!282331 e!282336)))

(declare-fun c!57670 () Bool)

(assert (=> b!479841 (= c!57670 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!479842 () Bool)

(declare-fun res!286217 () Bool)

(assert (=> b!479842 (=> (not res!286217) (not e!282331))))

(declare-fun e!282337 () Bool)

(assert (=> b!479842 (= res!286217 e!282337)))

(declare-fun c!57669 () Bool)

(assert (=> b!479842 (= c!57669 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!30863 () Bool)

(declare-fun call!30866 () Bool)

(assert (=> bm!30863 (= call!30866 (contains!2591 lt!217851 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!479843 () Bool)

(assert (=> b!479843 (= e!282336 (not call!30866))))

(declare-fun b!479844 () Bool)

(declare-fun e!282330 () Bool)

(declare-fun e!282327 () Bool)

(assert (=> b!479844 (= e!282330 e!282327)))

(declare-fun res!286218 () Bool)

(assert (=> b!479844 (=> (not res!286218) (not e!282327))))

(assert (=> b!479844 (= res!286218 (contains!2591 lt!217851 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!479844 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15284 _keys!1874)))))

(declare-fun b!479845 () Bool)

(declare-fun e!282334 () Bool)

(assert (=> b!479845 (= e!282336 e!282334)))

(declare-fun res!286219 () Bool)

(assert (=> b!479845 (= res!286219 call!30866)))

(assert (=> b!479845 (=> (not res!286219) (not e!282334))))

(declare-fun b!479846 () Bool)

(declare-fun e!282335 () Unit!14052)

(declare-fun lt!217854 () Unit!14052)

(assert (=> b!479846 (= e!282335 lt!217854)))

(declare-fun lt!217842 () ListLongMap!7999)

(declare-fun getCurrentListMapNoExtraKeys!2144 (array!31039 array!31037 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 32) Int) ListLongMap!7999)

(assert (=> b!479846 (= lt!217842 (getCurrentListMapNoExtraKeys!2144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217846 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217846 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217838 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217838 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217844 () Unit!14052)

(declare-fun addStillContains!298 (ListLongMap!7999 (_ BitVec 64) V!19321 (_ BitVec 64)) Unit!14052)

(assert (=> b!479846 (= lt!217844 (addStillContains!298 lt!217842 lt!217846 zeroValue!1458 lt!217838))))

(declare-fun +!1808 (ListLongMap!7999 tuple2!9096) ListLongMap!7999)

(assert (=> b!479846 (contains!2591 (+!1808 lt!217842 (tuple2!9097 lt!217846 zeroValue!1458)) lt!217838)))

(declare-fun lt!217834 () Unit!14052)

(assert (=> b!479846 (= lt!217834 lt!217844)))

(declare-fun lt!217836 () ListLongMap!7999)

(assert (=> b!479846 (= lt!217836 (getCurrentListMapNoExtraKeys!2144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217843 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217843 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217847 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217847 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217835 () Unit!14052)

(declare-fun addApplyDifferent!298 (ListLongMap!7999 (_ BitVec 64) V!19321 (_ BitVec 64)) Unit!14052)

(assert (=> b!479846 (= lt!217835 (addApplyDifferent!298 lt!217836 lt!217843 minValue!1458 lt!217847))))

(assert (=> b!479846 (= (apply!340 (+!1808 lt!217836 (tuple2!9097 lt!217843 minValue!1458)) lt!217847) (apply!340 lt!217836 lt!217847))))

(declare-fun lt!217840 () Unit!14052)

(assert (=> b!479846 (= lt!217840 lt!217835)))

(declare-fun lt!217839 () ListLongMap!7999)

(assert (=> b!479846 (= lt!217839 (getCurrentListMapNoExtraKeys!2144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217855 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217855 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217848 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217848 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217850 () Unit!14052)

(assert (=> b!479846 (= lt!217850 (addApplyDifferent!298 lt!217839 lt!217855 zeroValue!1458 lt!217848))))

(assert (=> b!479846 (= (apply!340 (+!1808 lt!217839 (tuple2!9097 lt!217855 zeroValue!1458)) lt!217848) (apply!340 lt!217839 lt!217848))))

(declare-fun lt!217849 () Unit!14052)

(assert (=> b!479846 (= lt!217849 lt!217850)))

(declare-fun lt!217852 () ListLongMap!7999)

(assert (=> b!479846 (= lt!217852 (getCurrentListMapNoExtraKeys!2144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!217845 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217845 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217853 () (_ BitVec 64))

(assert (=> b!479846 (= lt!217853 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!479846 (= lt!217854 (addApplyDifferent!298 lt!217852 lt!217845 minValue!1458 lt!217853))))

(assert (=> b!479846 (= (apply!340 (+!1808 lt!217852 (tuple2!9097 lt!217845 minValue!1458)) lt!217853) (apply!340 lt!217852 lt!217853))))

(declare-fun bm!30864 () Bool)

(declare-fun call!30868 () Bool)

(assert (=> bm!30864 (= call!30868 (contains!2591 lt!217851 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!479847 () Bool)

(assert (=> b!479847 (= e!282337 (not call!30868))))

(declare-fun call!30869 () ListLongMap!7999)

(declare-fun bm!30865 () Bool)

(assert (=> bm!30865 (= call!30869 (getCurrentListMapNoExtraKeys!2144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!479848 () Bool)

(declare-fun res!286215 () Bool)

(assert (=> b!479848 (=> (not res!286215) (not e!282331))))

(assert (=> b!479848 (= res!286215 e!282330)))

(declare-fun res!286213 () Bool)

(assert (=> b!479848 (=> res!286213 e!282330)))

(assert (=> b!479848 (= res!286213 (not e!282338))))

(declare-fun res!286214 () Bool)

(assert (=> b!479848 (=> (not res!286214) (not e!282338))))

(assert (=> b!479848 (= res!286214 (bvslt #b00000000000000000000000000000000 (size!15284 _keys!1874)))))

(declare-fun d!76503 () Bool)

(assert (=> d!76503 e!282331))

(declare-fun res!286220 () Bool)

(assert (=> d!76503 (=> (not res!286220) (not e!282331))))

(assert (=> d!76503 (= res!286220 (or (bvsge #b00000000000000000000000000000000 (size!15284 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15284 _keys!1874)))))))

(declare-fun lt!217837 () ListLongMap!7999)

(assert (=> d!76503 (= lt!217851 lt!217837)))

(declare-fun lt!217841 () Unit!14052)

(assert (=> d!76503 (= lt!217841 e!282335)))

(declare-fun c!57673 () Bool)

(assert (=> d!76503 (= c!57673 e!282333)))

(declare-fun res!286216 () Bool)

(assert (=> d!76503 (=> (not res!286216) (not e!282333))))

(assert (=> d!76503 (= res!286216 (bvslt #b00000000000000000000000000000000 (size!15284 _keys!1874)))))

(assert (=> d!76503 (= lt!217837 e!282332)))

(declare-fun c!57672 () Bool)

(assert (=> d!76503 (= c!57672 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76503 (validMask!0 mask!2352)))

(assert (=> d!76503 (= (getCurrentListMap!2268 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!217851)))

(declare-fun b!479849 () Bool)

(assert (=> b!479849 (= e!282334 (= (apply!340 lt!217851 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun bm!30866 () Bool)

(assert (=> bm!30866 (= call!30865 call!30869)))

(declare-fun b!479850 () Bool)

(assert (=> b!479850 (= e!282332 (+!1808 call!30864 (tuple2!9097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!479851 () Bool)

(assert (=> b!479851 (= e!282337 e!282329)))

(declare-fun res!286221 () Bool)

(assert (=> b!479851 (= res!286221 call!30868)))

(assert (=> b!479851 (=> (not res!286221) (not e!282329))))

(declare-fun bm!30867 () Bool)

(assert (=> bm!30867 (= call!30864 (+!1808 (ite c!57672 call!30869 (ite c!57671 call!30865 call!30867)) (ite (or c!57672 c!57671) (tuple2!9097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!479852 () Bool)

(declare-fun c!57674 () Bool)

(assert (=> b!479852 (= c!57674 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!479852 (= e!282339 e!282328)))

(declare-fun b!479853 () Bool)

(assert (=> b!479853 (= e!282328 call!30867)))

(declare-fun b!479854 () Bool)

(declare-fun Unit!14057 () Unit!14052)

(assert (=> b!479854 (= e!282335 Unit!14057)))

(declare-fun b!479855 () Bool)

(declare-fun get!7247 (ValueCell!6482 V!19321) V!19321)

(declare-fun dynLambda!954 (Int (_ BitVec 64)) V!19321)

(assert (=> b!479855 (= e!282327 (= (apply!340 lt!217851 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)) (get!7247 (select (arr!14924 _values!1516) #b00000000000000000000000000000000) (dynLambda!954 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479855 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15283 _values!1516)))))

(assert (=> b!479855 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15284 _keys!1874)))))

(assert (= (and d!76503 c!57672) b!479850))

(assert (= (and d!76503 (not c!57672)) b!479837))

(assert (= (and b!479837 c!57671) b!479840))

(assert (= (and b!479837 (not c!57671)) b!479852))

(assert (= (and b!479852 c!57674) b!479839))

(assert (= (and b!479852 (not c!57674)) b!479853))

(assert (= (or b!479839 b!479853) bm!30862))

(assert (= (or b!479840 bm!30862) bm!30866))

(assert (= (or b!479840 b!479839) bm!30861))

(assert (= (or b!479850 bm!30866) bm!30865))

(assert (= (or b!479850 bm!30861) bm!30867))

(assert (= (and d!76503 res!286216) b!479836))

(assert (= (and d!76503 c!57673) b!479846))

(assert (= (and d!76503 (not c!57673)) b!479854))

(assert (= (and d!76503 res!286220) b!479848))

(assert (= (and b!479848 res!286214) b!479835))

(assert (= (and b!479848 (not res!286213)) b!479844))

(assert (= (and b!479844 res!286218) b!479855))

(assert (= (and b!479848 res!286215) b!479842))

(assert (= (and b!479842 c!57669) b!479851))

(assert (= (and b!479842 (not c!57669)) b!479847))

(assert (= (and b!479851 res!286221) b!479838))

(assert (= (or b!479851 b!479847) bm!30864))

(assert (= (and b!479842 res!286217) b!479841))

(assert (= (and b!479841 c!57670) b!479845))

(assert (= (and b!479841 (not c!57670)) b!479843))

(assert (= (and b!479845 res!286219) b!479849))

(assert (= (or b!479845 b!479843) bm!30863))

(declare-fun b_lambda!10777 () Bool)

(assert (=> (not b_lambda!10777) (not b!479855)))

(declare-fun t!15362 () Bool)

(declare-fun tb!4153 () Bool)

(assert (=> (and start!43314 (= defaultEntry!1519 defaultEntry!1519) t!15362) tb!4153))

(declare-fun result!7743 () Bool)

(assert (=> tb!4153 (= result!7743 tp_is_empty!13687)))

(assert (=> b!479855 t!15362))

(declare-fun b_and!20909 () Bool)

(assert (= b_and!20903 (and (=> t!15362 result!7743) b_and!20909)))

(declare-fun m!461105 () Bool)

(assert (=> b!479838 m!461105))

(declare-fun m!461107 () Bool)

(assert (=> bm!30864 m!461107))

(declare-fun m!461109 () Bool)

(assert (=> b!479844 m!461109))

(assert (=> b!479844 m!461109))

(declare-fun m!461111 () Bool)

(assert (=> b!479844 m!461111))

(assert (=> b!479855 m!461109))

(declare-fun m!461113 () Bool)

(assert (=> b!479855 m!461113))

(declare-fun m!461115 () Bool)

(assert (=> b!479855 m!461115))

(declare-fun m!461117 () Bool)

(assert (=> b!479855 m!461117))

(declare-fun m!461119 () Bool)

(assert (=> b!479855 m!461119))

(assert (=> b!479855 m!461115))

(assert (=> b!479855 m!461117))

(assert (=> b!479855 m!461109))

(declare-fun m!461121 () Bool)

(assert (=> b!479850 m!461121))

(assert (=> b!479836 m!461109))

(assert (=> b!479836 m!461109))

(declare-fun m!461123 () Bool)

(assert (=> b!479836 m!461123))

(declare-fun m!461125 () Bool)

(assert (=> b!479846 m!461125))

(declare-fun m!461127 () Bool)

(assert (=> b!479846 m!461127))

(declare-fun m!461129 () Bool)

(assert (=> b!479846 m!461129))

(declare-fun m!461131 () Bool)

(assert (=> b!479846 m!461131))

(declare-fun m!461133 () Bool)

(assert (=> b!479846 m!461133))

(declare-fun m!461135 () Bool)

(assert (=> b!479846 m!461135))

(assert (=> b!479846 m!461125))

(declare-fun m!461137 () Bool)

(assert (=> b!479846 m!461137))

(declare-fun m!461139 () Bool)

(assert (=> b!479846 m!461139))

(declare-fun m!461141 () Bool)

(assert (=> b!479846 m!461141))

(assert (=> b!479846 m!461133))

(declare-fun m!461143 () Bool)

(assert (=> b!479846 m!461143))

(declare-fun m!461145 () Bool)

(assert (=> b!479846 m!461145))

(assert (=> b!479846 m!461109))

(declare-fun m!461147 () Bool)

(assert (=> b!479846 m!461147))

(declare-fun m!461149 () Bool)

(assert (=> b!479846 m!461149))

(declare-fun m!461151 () Bool)

(assert (=> b!479846 m!461151))

(declare-fun m!461153 () Bool)

(assert (=> b!479846 m!461153))

(assert (=> b!479846 m!461147))

(assert (=> b!479846 m!461129))

(declare-fun m!461155 () Bool)

(assert (=> b!479846 m!461155))

(declare-fun m!461157 () Bool)

(assert (=> bm!30863 m!461157))

(declare-fun m!461159 () Bool)

(assert (=> b!479849 m!461159))

(declare-fun m!461161 () Bool)

(assert (=> bm!30867 m!461161))

(assert (=> bm!30865 m!461143))

(assert (=> b!479835 m!461109))

(assert (=> b!479835 m!461109))

(assert (=> b!479835 m!461123))

(assert (=> d!76503 m!461035))

(assert (=> b!479700 d!76503))

(declare-fun d!76505 () Bool)

(declare-fun res!286226 () Bool)

(declare-fun e!282348 () Bool)

(assert (=> d!76505 (=> res!286226 e!282348)))

(assert (=> d!76505 (= res!286226 (bvsge #b00000000000000000000000000000000 (size!15284 _keys!1874)))))

(assert (=> d!76505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!282348)))

(declare-fun b!479866 () Bool)

(declare-fun e!282347 () Bool)

(assert (=> b!479866 (= e!282348 e!282347)))

(declare-fun c!57677 () Bool)

(assert (=> b!479866 (= c!57677 (validKeyInArray!0 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479867 () Bool)

(declare-fun e!282346 () Bool)

(assert (=> b!479867 (= e!282347 e!282346)))

(declare-fun lt!217862 () (_ BitVec 64))

(assert (=> b!479867 (= lt!217862 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!217863 () Unit!14052)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31039 (_ BitVec 64) (_ BitVec 32)) Unit!14052)

(assert (=> b!479867 (= lt!217863 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!217862 #b00000000000000000000000000000000))))

(assert (=> b!479867 (arrayContainsKey!0 _keys!1874 lt!217862 #b00000000000000000000000000000000)))

(declare-fun lt!217864 () Unit!14052)

(assert (=> b!479867 (= lt!217864 lt!217863)))

(declare-fun res!286227 () Bool)

(declare-datatypes ((SeekEntryResult!3564 0))(
  ( (MissingZero!3564 (index!16435 (_ BitVec 32))) (Found!3564 (index!16436 (_ BitVec 32))) (Intermediate!3564 (undefined!4376 Bool) (index!16437 (_ BitVec 32)) (x!45091 (_ BitVec 32))) (Undefined!3564) (MissingVacant!3564 (index!16438 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31039 (_ BitVec 32)) SeekEntryResult!3564)

(assert (=> b!479867 (= res!286227 (= (seekEntryOrOpen!0 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3564 #b00000000000000000000000000000000)))))

(assert (=> b!479867 (=> (not res!286227) (not e!282346))))

(declare-fun b!479868 () Bool)

(declare-fun call!30873 () Bool)

(assert (=> b!479868 (= e!282347 call!30873)))

(declare-fun b!479869 () Bool)

(assert (=> b!479869 (= e!282346 call!30873)))

(declare-fun bm!30870 () Bool)

(assert (=> bm!30870 (= call!30873 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76505 (not res!286226)) b!479866))

(assert (= (and b!479866 c!57677) b!479867))

(assert (= (and b!479866 (not c!57677)) b!479868))

(assert (= (and b!479867 res!286227) b!479869))

(assert (= (or b!479869 b!479868) bm!30870))

(assert (=> b!479866 m!461109))

(assert (=> b!479866 m!461109))

(assert (=> b!479866 m!461123))

(assert (=> b!479867 m!461109))

(declare-fun m!461163 () Bool)

(assert (=> b!479867 m!461163))

(declare-fun m!461165 () Bool)

(assert (=> b!479867 m!461165))

(assert (=> b!479867 m!461109))

(declare-fun m!461167 () Bool)

(assert (=> b!479867 m!461167))

(declare-fun m!461169 () Bool)

(assert (=> bm!30870 m!461169))

(assert (=> b!479706 d!76505))

(declare-fun d!76507 () Bool)

(assert (=> d!76507 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!479701 d!76507))

(declare-fun d!76509 () Bool)

(declare-fun res!286232 () Bool)

(declare-fun e!282353 () Bool)

(assert (=> d!76509 (=> res!286232 e!282353)))

(assert (=> d!76509 (= res!286232 (= (select (arr!14925 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76509 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!282353)))

(declare-fun b!479874 () Bool)

(declare-fun e!282354 () Bool)

(assert (=> b!479874 (= e!282353 e!282354)))

(declare-fun res!286233 () Bool)

(assert (=> b!479874 (=> (not res!286233) (not e!282354))))

(assert (=> b!479874 (= res!286233 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15284 _keys!1874)))))

(declare-fun b!479875 () Bool)

(assert (=> b!479875 (= e!282354 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76509 (not res!286232)) b!479874))

(assert (= (and b!479874 res!286233) b!479875))

(assert (=> d!76509 m!461109))

(declare-fun m!461171 () Bool)

(assert (=> b!479875 m!461171))

(assert (=> b!479702 d!76509))

(declare-fun d!76511 () Bool)

(declare-fun e!282357 () Bool)

(assert (=> d!76511 e!282357))

(declare-fun c!57680 () Bool)

(assert (=> d!76511 (= c!57680 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!217867 () Unit!14052)

(declare-fun choose!1383 (array!31039 array!31037 (_ BitVec 32) (_ BitVec 32) V!19321 V!19321 (_ BitVec 64) Int) Unit!14052)

(assert (=> d!76511 (= lt!217867 (choose!1383 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76511 (validMask!0 mask!2352)))

(assert (=> d!76511 (= (lemmaKeyInListMapIsInArray!116 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!217867)))

(declare-fun b!479880 () Bool)

(assert (=> b!479880 (= e!282357 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!479881 () Bool)

(assert (=> b!479881 (= e!282357 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76511 c!57680) b!479880))

(assert (= (and d!76511 (not c!57680)) b!479881))

(declare-fun m!461173 () Bool)

(assert (=> d!76511 m!461173))

(assert (=> d!76511 m!461035))

(assert (=> b!479880 m!461041))

(assert (=> b!479711 d!76511))

(declare-fun b!479892 () Bool)

(declare-fun e!282366 () Bool)

(declare-fun call!30876 () Bool)

(assert (=> b!479892 (= e!282366 call!30876)))

(declare-fun d!76513 () Bool)

(declare-fun res!286241 () Bool)

(declare-fun e!282369 () Bool)

(assert (=> d!76513 (=> res!286241 e!282369)))

(assert (=> d!76513 (= res!286241 (bvsge #b00000000000000000000000000000000 (size!15284 _keys!1874)))))

(assert (=> d!76513 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9157) e!282369)))

(declare-fun b!479893 () Bool)

(declare-fun e!282367 () Bool)

(assert (=> b!479893 (= e!282367 e!282366)))

(declare-fun c!57683 () Bool)

(assert (=> b!479893 (= c!57683 (validKeyInArray!0 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479894 () Bool)

(declare-fun e!282368 () Bool)

(declare-fun contains!2592 (List!9160 (_ BitVec 64)) Bool)

(assert (=> b!479894 (= e!282368 (contains!2592 Nil!9157 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479895 () Bool)

(assert (=> b!479895 (= e!282369 e!282367)))

(declare-fun res!286240 () Bool)

(assert (=> b!479895 (=> (not res!286240) (not e!282367))))

(assert (=> b!479895 (= res!286240 (not e!282368))))

(declare-fun res!286242 () Bool)

(assert (=> b!479895 (=> (not res!286242) (not e!282368))))

(assert (=> b!479895 (= res!286242 (validKeyInArray!0 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!479896 () Bool)

(assert (=> b!479896 (= e!282366 call!30876)))

(declare-fun bm!30873 () Bool)

(assert (=> bm!30873 (= call!30876 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57683 (Cons!9156 (select (arr!14925 _keys!1874) #b00000000000000000000000000000000) Nil!9157) Nil!9157)))))

(assert (= (and d!76513 (not res!286241)) b!479895))

(assert (= (and b!479895 res!286242) b!479894))

(assert (= (and b!479895 res!286240) b!479893))

(assert (= (and b!479893 c!57683) b!479892))

(assert (= (and b!479893 (not c!57683)) b!479896))

(assert (= (or b!479892 b!479896) bm!30873))

(assert (=> b!479893 m!461109))

(assert (=> b!479893 m!461109))

(assert (=> b!479893 m!461123))

(assert (=> b!479894 m!461109))

(assert (=> b!479894 m!461109))

(declare-fun m!461175 () Bool)

(assert (=> b!479894 m!461175))

(assert (=> b!479895 m!461109))

(assert (=> b!479895 m!461109))

(assert (=> b!479895 m!461123))

(assert (=> bm!30873 m!461109))

(declare-fun m!461177 () Bool)

(assert (=> bm!30873 m!461177))

(assert (=> b!479703 d!76513))

(assert (=> b!479708 d!76509))

(declare-fun d!76515 () Bool)

(assert (=> d!76515 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43314 d!76515))

(declare-fun d!76517 () Bool)

(assert (=> d!76517 (= (array_inv!10860 _values!1516) (bvsge (size!15283 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43314 d!76517))

(declare-fun d!76519 () Bool)

(assert (=> d!76519 (= (array_inv!10861 _keys!1874) (bvsge (size!15284 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43314 d!76519))

(declare-fun mapIsEmpty!22240 () Bool)

(declare-fun mapRes!22240 () Bool)

(assert (=> mapIsEmpty!22240 mapRes!22240))

(declare-fun mapNonEmpty!22240 () Bool)

(declare-fun tp!42814 () Bool)

(declare-fun e!282374 () Bool)

(assert (=> mapNonEmpty!22240 (= mapRes!22240 (and tp!42814 e!282374))))

(declare-fun mapValue!22240 () ValueCell!6482)

(declare-fun mapKey!22240 () (_ BitVec 32))

(declare-fun mapRest!22240 () (Array (_ BitVec 32) ValueCell!6482))

(assert (=> mapNonEmpty!22240 (= mapRest!22231 (store mapRest!22240 mapKey!22240 mapValue!22240))))

(declare-fun condMapEmpty!22240 () Bool)

(declare-fun mapDefault!22240 () ValueCell!6482)

(assert (=> mapNonEmpty!22231 (= condMapEmpty!22240 (= mapRest!22231 ((as const (Array (_ BitVec 32) ValueCell!6482)) mapDefault!22240)))))

(declare-fun e!282375 () Bool)

(assert (=> mapNonEmpty!22231 (= tp!42799 (and e!282375 mapRes!22240))))

(declare-fun b!479904 () Bool)

(assert (=> b!479904 (= e!282375 tp_is_empty!13687)))

(declare-fun b!479903 () Bool)

(assert (=> b!479903 (= e!282374 tp_is_empty!13687)))

(assert (= (and mapNonEmpty!22231 condMapEmpty!22240) mapIsEmpty!22240))

(assert (= (and mapNonEmpty!22231 (not condMapEmpty!22240)) mapNonEmpty!22240))

(assert (= (and mapNonEmpty!22240 ((_ is ValueCellFull!6482) mapValue!22240)) b!479903))

(assert (= (and mapNonEmpty!22231 ((_ is ValueCellFull!6482) mapDefault!22240)) b!479904))

(declare-fun m!461179 () Bool)

(assert (=> mapNonEmpty!22240 m!461179))

(declare-fun b_lambda!10779 () Bool)

(assert (= b_lambda!10777 (or (and start!43314 b_free!12175) b_lambda!10779)))

(check-sat (not b_lambda!10779) (not b!479790) (not bm!30865) tp_is_empty!13687 (not b!479835) (not d!76511) (not b!479846) (not b_next!12175) (not b!479844) (not bm!30873) (not b!479867) (not b!479850) (not bm!30864) (not b!479880) (not b!479855) (not bm!30867) (not bm!30863) (not b!479792) (not b!479836) (not bm!30870) b_and!20909 (not b!479849) (not b!479838) (not b!479894) (not d!76501) (not mapNonEmpty!22240) (not b!479866) (not b!479895) (not d!76503) (not b!479875) (not b!479893))
(check-sat b_and!20909 (not b_next!12175))
