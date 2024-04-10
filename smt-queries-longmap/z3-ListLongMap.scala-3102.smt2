; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43554 () Bool)

(assert start!43554)

(declare-fun b_free!12333 () Bool)

(declare-fun b_next!12333 () Bool)

(assert (=> start!43554 (= b_free!12333 (not b_next!12333))))

(declare-fun tp!43282 () Bool)

(declare-fun b_and!21093 () Bool)

(assert (=> start!43554 (= tp!43282 b_and!21093)))

(declare-fun b!482644 () Bool)

(declare-fun res!287697 () Bool)

(declare-fun e!284028 () Bool)

(assert (=> b!482644 (=> (not res!287697) (not e!284028))))

(declare-datatypes ((array!31347 0))(
  ( (array!31348 (arr!15076 (Array (_ BitVec 32) (_ BitVec 64))) (size!15434 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31347)

(declare-datatypes ((List!9230 0))(
  ( (Nil!9227) (Cons!9226 (h!10082 (_ BitVec 64)) (t!15444 List!9230)) )
))
(declare-fun arrayNoDuplicates!0 (array!31347 (_ BitVec 32) List!9230) Bool)

(assert (=> b!482644 (= res!287697 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9227))))

(declare-fun b!482645 () Bool)

(declare-fun mask!2352 () (_ BitVec 32))

(assert (=> b!482645 (= e!284028 (not (or (not (= (size!15434 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsle #b00000000000000000000000000000000 (size!15434 _keys!1874)))))))

(declare-fun lt!218760 () (_ BitVec 32))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31347 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482645 (= lt!218760 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!284026 () Bool)

(assert (=> b!482645 e!284026))

(declare-fun c!57972 () Bool)

(assert (=> b!482645 (= c!57972 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14152 0))(
  ( (Unit!14153) )
))
(declare-fun lt!218761 () Unit!14152)

(declare-datatypes ((V!19531 0))(
  ( (V!19532 (val!6970 Int)) )
))
(declare-fun minValue!1458 () V!19531)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19531)

(declare-datatypes ((ValueCell!6561 0))(
  ( (ValueCellFull!6561 (v!9263 V!19531)) (EmptyCell!6561) )
))
(declare-datatypes ((array!31349 0))(
  ( (array!31350 (arr!15077 (Array (_ BitVec 32) ValueCell!6561)) (size!15435 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31349)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!147 (array!31347 array!31349 (_ BitVec 32) (_ BitVec 32) V!19531 V!19531 (_ BitVec 64) Int) Unit!14152)

(assert (=> b!482645 (= lt!218761 (lemmaKeyInListMapIsInArray!147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun res!287700 () Bool)

(assert (=> start!43554 (=> (not res!287700) (not e!284028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43554 (= res!287700 (validMask!0 mask!2352))))

(assert (=> start!43554 e!284028))

(assert (=> start!43554 true))

(declare-fun tp_is_empty!13845 () Bool)

(assert (=> start!43554 tp_is_empty!13845))

(declare-fun e!284024 () Bool)

(declare-fun array_inv!10876 (array!31349) Bool)

(assert (=> start!43554 (and (array_inv!10876 _values!1516) e!284024)))

(assert (=> start!43554 tp!43282))

(declare-fun array_inv!10877 (array!31347) Bool)

(assert (=> start!43554 (array_inv!10877 _keys!1874)))

(declare-fun b!482646 () Bool)

(declare-fun e!284025 () Bool)

(assert (=> b!482646 (= e!284025 tp_is_empty!13845)))

(declare-fun b!482647 () Bool)

(declare-fun res!287699 () Bool)

(assert (=> b!482647 (=> (not res!287699) (not e!284028))))

(declare-datatypes ((tuple2!9150 0))(
  ( (tuple2!9151 (_1!4586 (_ BitVec 64)) (_2!4586 V!19531)) )
))
(declare-datatypes ((List!9231 0))(
  ( (Nil!9228) (Cons!9227 (h!10083 tuple2!9150) (t!15445 List!9231)) )
))
(declare-datatypes ((ListLongMap!8063 0))(
  ( (ListLongMap!8064 (toList!4047 List!9231)) )
))
(declare-fun contains!2661 (ListLongMap!8063 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2366 (array!31347 array!31349 (_ BitVec 32) (_ BitVec 32) V!19531 V!19531 (_ BitVec 32) Int) ListLongMap!8063)

(assert (=> b!482647 (= res!287699 (contains!2661 (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482648 () Bool)

(declare-fun e!284027 () Bool)

(declare-fun mapRes!22477 () Bool)

(assert (=> b!482648 (= e!284024 (and e!284027 mapRes!22477))))

(declare-fun condMapEmpty!22477 () Bool)

(declare-fun mapDefault!22477 () ValueCell!6561)

(assert (=> b!482648 (= condMapEmpty!22477 (= (arr!15077 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6561)) mapDefault!22477)))))

(declare-fun b!482649 () Bool)

(declare-fun res!287698 () Bool)

(assert (=> b!482649 (=> (not res!287698) (not e!284028))))

(assert (=> b!482649 (= res!287698 (and (= (size!15435 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15434 _keys!1874) (size!15435 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482650 () Bool)

(assert (=> b!482650 (= e!284026 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482651 () Bool)

(declare-fun arrayContainsKey!0 (array!31347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482651 (= e!284026 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482652 () Bool)

(declare-fun res!287701 () Bool)

(assert (=> b!482652 (=> (not res!287701) (not e!284028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482652 (= res!287701 (validKeyInArray!0 k0!1332))))

(declare-fun b!482653 () Bool)

(assert (=> b!482653 (= e!284027 tp_is_empty!13845)))

(declare-fun mapIsEmpty!22477 () Bool)

(assert (=> mapIsEmpty!22477 mapRes!22477))

(declare-fun b!482654 () Bool)

(declare-fun res!287696 () Bool)

(assert (=> b!482654 (=> (not res!287696) (not e!284028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31347 (_ BitVec 32)) Bool)

(assert (=> b!482654 (= res!287696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22477 () Bool)

(declare-fun tp!43281 () Bool)

(assert (=> mapNonEmpty!22477 (= mapRes!22477 (and tp!43281 e!284025))))

(declare-fun mapRest!22477 () (Array (_ BitVec 32) ValueCell!6561))

(declare-fun mapKey!22477 () (_ BitVec 32))

(declare-fun mapValue!22477 () ValueCell!6561)

(assert (=> mapNonEmpty!22477 (= (arr!15077 _values!1516) (store mapRest!22477 mapKey!22477 mapValue!22477))))

(assert (= (and start!43554 res!287700) b!482649))

(assert (= (and b!482649 res!287698) b!482654))

(assert (= (and b!482654 res!287696) b!482644))

(assert (= (and b!482644 res!287697) b!482647))

(assert (= (and b!482647 res!287699) b!482652))

(assert (= (and b!482652 res!287701) b!482645))

(assert (= (and b!482645 c!57972) b!482651))

(assert (= (and b!482645 (not c!57972)) b!482650))

(assert (= (and b!482648 condMapEmpty!22477) mapIsEmpty!22477))

(assert (= (and b!482648 (not condMapEmpty!22477)) mapNonEmpty!22477))

(get-info :version)

(assert (= (and mapNonEmpty!22477 ((_ is ValueCellFull!6561) mapValue!22477)) b!482646))

(assert (= (and b!482648 ((_ is ValueCellFull!6561) mapDefault!22477)) b!482653))

(assert (= start!43554 b!482648))

(declare-fun m!463835 () Bool)

(assert (=> start!43554 m!463835))

(declare-fun m!463837 () Bool)

(assert (=> start!43554 m!463837))

(declare-fun m!463839 () Bool)

(assert (=> start!43554 m!463839))

(declare-fun m!463841 () Bool)

(assert (=> mapNonEmpty!22477 m!463841))

(declare-fun m!463843 () Bool)

(assert (=> b!482647 m!463843))

(assert (=> b!482647 m!463843))

(declare-fun m!463845 () Bool)

(assert (=> b!482647 m!463845))

(declare-fun m!463847 () Bool)

(assert (=> b!482645 m!463847))

(declare-fun m!463849 () Bool)

(assert (=> b!482645 m!463849))

(declare-fun m!463851 () Bool)

(assert (=> b!482651 m!463851))

(declare-fun m!463853 () Bool)

(assert (=> b!482652 m!463853))

(declare-fun m!463855 () Bool)

(assert (=> b!482654 m!463855))

(declare-fun m!463857 () Bool)

(assert (=> b!482644 m!463857))

(check-sat (not b!482654) (not b!482645) (not b!482647) (not b!482644) tp_is_empty!13845 (not b_next!12333) b_and!21093 (not start!43554) (not b!482651) (not mapNonEmpty!22477) (not b!482652))
(check-sat b_and!21093 (not b_next!12333))
(get-model)

(declare-fun b!482698 () Bool)

(declare-fun e!284055 () Bool)

(declare-fun e!284056 () Bool)

(assert (=> b!482698 (= e!284055 e!284056)))

(declare-fun c!57978 () Bool)

(assert (=> b!482698 (= c!57978 (validKeyInArray!0 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482699 () Bool)

(declare-fun call!30960 () Bool)

(assert (=> b!482699 (= e!284056 call!30960)))

(declare-fun b!482700 () Bool)

(assert (=> b!482700 (= e!284056 call!30960)))

(declare-fun bm!30957 () Bool)

(assert (=> bm!30957 (= call!30960 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57978 (Cons!9226 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000) Nil!9227) Nil!9227)))))

(declare-fun d!76829 () Bool)

(declare-fun res!287727 () Bool)

(declare-fun e!284058 () Bool)

(assert (=> d!76829 (=> res!287727 e!284058)))

(assert (=> d!76829 (= res!287727 (bvsge #b00000000000000000000000000000000 (size!15434 _keys!1874)))))

(assert (=> d!76829 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9227) e!284058)))

(declare-fun b!482701 () Bool)

(assert (=> b!482701 (= e!284058 e!284055)))

(declare-fun res!287726 () Bool)

(assert (=> b!482701 (=> (not res!287726) (not e!284055))))

(declare-fun e!284057 () Bool)

(assert (=> b!482701 (= res!287726 (not e!284057))))

(declare-fun res!287728 () Bool)

(assert (=> b!482701 (=> (not res!287728) (not e!284057))))

(assert (=> b!482701 (= res!287728 (validKeyInArray!0 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482702 () Bool)

(declare-fun contains!2662 (List!9230 (_ BitVec 64)) Bool)

(assert (=> b!482702 (= e!284057 (contains!2662 Nil!9227 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76829 (not res!287727)) b!482701))

(assert (= (and b!482701 res!287728) b!482702))

(assert (= (and b!482701 res!287726) b!482698))

(assert (= (and b!482698 c!57978) b!482699))

(assert (= (and b!482698 (not c!57978)) b!482700))

(assert (= (or b!482699 b!482700) bm!30957))

(declare-fun m!463883 () Bool)

(assert (=> b!482698 m!463883))

(assert (=> b!482698 m!463883))

(declare-fun m!463885 () Bool)

(assert (=> b!482698 m!463885))

(assert (=> bm!30957 m!463883))

(declare-fun m!463887 () Bool)

(assert (=> bm!30957 m!463887))

(assert (=> b!482701 m!463883))

(assert (=> b!482701 m!463883))

(assert (=> b!482701 m!463885))

(assert (=> b!482702 m!463883))

(assert (=> b!482702 m!463883))

(declare-fun m!463889 () Bool)

(assert (=> b!482702 m!463889))

(assert (=> b!482644 d!76829))

(declare-fun b!482711 () Bool)

(declare-fun e!284066 () Bool)

(declare-fun e!284065 () Bool)

(assert (=> b!482711 (= e!284066 e!284065)))

(declare-fun c!57981 () Bool)

(assert (=> b!482711 (= c!57981 (validKeyInArray!0 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482712 () Bool)

(declare-fun call!30963 () Bool)

(assert (=> b!482712 (= e!284065 call!30963)))

(declare-fun b!482713 () Bool)

(declare-fun e!284067 () Bool)

(assert (=> b!482713 (= e!284065 e!284067)))

(declare-fun lt!218775 () (_ BitVec 64))

(assert (=> b!482713 (= lt!218775 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218776 () Unit!14152)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31347 (_ BitVec 64) (_ BitVec 32)) Unit!14152)

(assert (=> b!482713 (= lt!218776 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218775 #b00000000000000000000000000000000))))

(assert (=> b!482713 (arrayContainsKey!0 _keys!1874 lt!218775 #b00000000000000000000000000000000)))

(declare-fun lt!218774 () Unit!14152)

(assert (=> b!482713 (= lt!218774 lt!218776)))

(declare-fun res!287733 () Bool)

(declare-datatypes ((SeekEntryResult!3572 0))(
  ( (MissingZero!3572 (index!16467 (_ BitVec 32))) (Found!3572 (index!16468 (_ BitVec 32))) (Intermediate!3572 (undefined!4384 Bool) (index!16469 (_ BitVec 32)) (x!45342 (_ BitVec 32))) (Undefined!3572) (MissingVacant!3572 (index!16470 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31347 (_ BitVec 32)) SeekEntryResult!3572)

(assert (=> b!482713 (= res!287733 (= (seekEntryOrOpen!0 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3572 #b00000000000000000000000000000000)))))

(assert (=> b!482713 (=> (not res!287733) (not e!284067))))

(declare-fun b!482714 () Bool)

(assert (=> b!482714 (= e!284067 call!30963)))

(declare-fun d!76831 () Bool)

(declare-fun res!287734 () Bool)

(assert (=> d!76831 (=> res!287734 e!284066)))

(assert (=> d!76831 (= res!287734 (bvsge #b00000000000000000000000000000000 (size!15434 _keys!1874)))))

(assert (=> d!76831 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284066)))

(declare-fun bm!30960 () Bool)

(assert (=> bm!30960 (= call!30963 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(assert (= (and d!76831 (not res!287734)) b!482711))

(assert (= (and b!482711 c!57981) b!482713))

(assert (= (and b!482711 (not c!57981)) b!482712))

(assert (= (and b!482713 res!287733) b!482714))

(assert (= (or b!482714 b!482712) bm!30960))

(assert (=> b!482711 m!463883))

(assert (=> b!482711 m!463883))

(assert (=> b!482711 m!463885))

(assert (=> b!482713 m!463883))

(declare-fun m!463891 () Bool)

(assert (=> b!482713 m!463891))

(declare-fun m!463893 () Bool)

(assert (=> b!482713 m!463893))

(assert (=> b!482713 m!463883))

(declare-fun m!463895 () Bool)

(assert (=> b!482713 m!463895))

(declare-fun m!463897 () Bool)

(assert (=> bm!30960 m!463897))

(assert (=> b!482654 d!76831))

(declare-fun d!76833 () Bool)

(assert (=> d!76833 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43554 d!76833))

(declare-fun d!76835 () Bool)

(assert (=> d!76835 (= (array_inv!10876 _values!1516) (bvsge (size!15435 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43554 d!76835))

(declare-fun d!76837 () Bool)

(assert (=> d!76837 (= (array_inv!10877 _keys!1874) (bvsge (size!15434 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43554 d!76837))

(declare-fun d!76839 () Bool)

(assert (=> d!76839 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482652 d!76839))

(declare-fun d!76841 () Bool)

(declare-fun e!284072 () Bool)

(assert (=> d!76841 e!284072))

(declare-fun res!287737 () Bool)

(assert (=> d!76841 (=> res!287737 e!284072)))

(declare-fun lt!218786 () Bool)

(assert (=> d!76841 (= res!287737 (not lt!218786))))

(declare-fun lt!218785 () Bool)

(assert (=> d!76841 (= lt!218786 lt!218785)))

(declare-fun lt!218788 () Unit!14152)

(declare-fun e!284073 () Unit!14152)

(assert (=> d!76841 (= lt!218788 e!284073)))

(declare-fun c!57984 () Bool)

(assert (=> d!76841 (= c!57984 lt!218785)))

(declare-fun containsKey!358 (List!9231 (_ BitVec 64)) Bool)

(assert (=> d!76841 (= lt!218785 (containsKey!358 (toList!4047 (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76841 (= (contains!2661 (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218786)))

(declare-fun b!482721 () Bool)

(declare-fun lt!218787 () Unit!14152)

(assert (=> b!482721 (= e!284073 lt!218787)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!306 (List!9231 (_ BitVec 64)) Unit!14152)

(assert (=> b!482721 (= lt!218787 (lemmaContainsKeyImpliesGetValueByKeyDefined!306 (toList!4047 (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!402 0))(
  ( (Some!401 (v!9265 V!19531)) (None!400) )
))
(declare-fun isDefined!307 (Option!402) Bool)

(declare-fun getValueByKey!396 (List!9231 (_ BitVec 64)) Option!402)

(assert (=> b!482721 (isDefined!307 (getValueByKey!396 (toList!4047 (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!482722 () Bool)

(declare-fun Unit!14154 () Unit!14152)

(assert (=> b!482722 (= e!284073 Unit!14154)))

(declare-fun b!482723 () Bool)

(assert (=> b!482723 (= e!284072 (isDefined!307 (getValueByKey!396 (toList!4047 (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76841 c!57984) b!482721))

(assert (= (and d!76841 (not c!57984)) b!482722))

(assert (= (and d!76841 (not res!287737)) b!482723))

(declare-fun m!463899 () Bool)

(assert (=> d!76841 m!463899))

(declare-fun m!463901 () Bool)

(assert (=> b!482721 m!463901))

(declare-fun m!463903 () Bool)

(assert (=> b!482721 m!463903))

(assert (=> b!482721 m!463903))

(declare-fun m!463905 () Bool)

(assert (=> b!482721 m!463905))

(assert (=> b!482723 m!463903))

(assert (=> b!482723 m!463903))

(assert (=> b!482723 m!463905))

(assert (=> b!482647 d!76841))

(declare-fun b!482766 () Bool)

(declare-fun e!284106 () Bool)

(assert (=> b!482766 (= e!284106 (validKeyInArray!0 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!482767 () Bool)

(declare-fun res!287764 () Bool)

(declare-fun e!284111 () Bool)

(assert (=> b!482767 (=> (not res!287764) (not e!284111))))

(declare-fun e!284112 () Bool)

(assert (=> b!482767 (= res!287764 e!284112)))

(declare-fun c!58002 () Bool)

(assert (=> b!482767 (= c!58002 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!482768 () Bool)

(declare-fun c!57998 () Bool)

(assert (=> b!482768 (= c!57998 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!284102 () ListLongMap!8063)

(declare-fun e!284107 () ListLongMap!8063)

(assert (=> b!482768 (= e!284102 e!284107)))

(declare-fun b!482769 () Bool)

(declare-fun call!30982 () ListLongMap!8063)

(assert (=> b!482769 (= e!284102 call!30982)))

(declare-fun b!482770 () Bool)

(declare-fun e!284109 () Unit!14152)

(declare-fun lt!218835 () Unit!14152)

(assert (=> b!482770 (= e!284109 lt!218835)))

(declare-fun lt!218844 () ListLongMap!8063)

(declare-fun getCurrentListMapNoExtraKeys!2112 (array!31347 array!31349 (_ BitVec 32) (_ BitVec 32) V!19531 V!19531 (_ BitVec 32) Int) ListLongMap!8063)

(assert (=> b!482770 (= lt!218844 (getCurrentListMapNoExtraKeys!2112 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218837 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218837 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218836 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218836 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218839 () Unit!14152)

(declare-fun addStillContains!301 (ListLongMap!8063 (_ BitVec 64) V!19531 (_ BitVec 64)) Unit!14152)

(assert (=> b!482770 (= lt!218839 (addStillContains!301 lt!218844 lt!218837 zeroValue!1458 lt!218836))))

(declare-fun +!1775 (ListLongMap!8063 tuple2!9150) ListLongMap!8063)

(assert (=> b!482770 (contains!2661 (+!1775 lt!218844 (tuple2!9151 lt!218837 zeroValue!1458)) lt!218836)))

(declare-fun lt!218850 () Unit!14152)

(assert (=> b!482770 (= lt!218850 lt!218839)))

(declare-fun lt!218848 () ListLongMap!8063)

(assert (=> b!482770 (= lt!218848 (getCurrentListMapNoExtraKeys!2112 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218833 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218833 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218854 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218854 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218845 () Unit!14152)

(declare-fun addApplyDifferent!301 (ListLongMap!8063 (_ BitVec 64) V!19531 (_ BitVec 64)) Unit!14152)

(assert (=> b!482770 (= lt!218845 (addApplyDifferent!301 lt!218848 lt!218833 minValue!1458 lt!218854))))

(declare-fun apply!343 (ListLongMap!8063 (_ BitVec 64)) V!19531)

(assert (=> b!482770 (= (apply!343 (+!1775 lt!218848 (tuple2!9151 lt!218833 minValue!1458)) lt!218854) (apply!343 lt!218848 lt!218854))))

(declare-fun lt!218849 () Unit!14152)

(assert (=> b!482770 (= lt!218849 lt!218845)))

(declare-fun lt!218840 () ListLongMap!8063)

(assert (=> b!482770 (= lt!218840 (getCurrentListMapNoExtraKeys!2112 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218834 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218834 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218851 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218851 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218847 () Unit!14152)

(assert (=> b!482770 (= lt!218847 (addApplyDifferent!301 lt!218840 lt!218834 zeroValue!1458 lt!218851))))

(assert (=> b!482770 (= (apply!343 (+!1775 lt!218840 (tuple2!9151 lt!218834 zeroValue!1458)) lt!218851) (apply!343 lt!218840 lt!218851))))

(declare-fun lt!218842 () Unit!14152)

(assert (=> b!482770 (= lt!218842 lt!218847)))

(declare-fun lt!218843 () ListLongMap!8063)

(assert (=> b!482770 (= lt!218843 (getCurrentListMapNoExtraKeys!2112 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218852 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218852 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218838 () (_ BitVec 64))

(assert (=> b!482770 (= lt!218838 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!482770 (= lt!218835 (addApplyDifferent!301 lt!218843 lt!218852 minValue!1458 lt!218838))))

(assert (=> b!482770 (= (apply!343 (+!1775 lt!218843 (tuple2!9151 lt!218852 minValue!1458)) lt!218838) (apply!343 lt!218843 lt!218838))))

(declare-fun b!482771 () Bool)

(declare-fun Unit!14155 () Unit!14152)

(assert (=> b!482771 (= e!284109 Unit!14155)))

(declare-fun bm!30975 () Bool)

(declare-fun call!30983 () ListLongMap!8063)

(assert (=> bm!30975 (= call!30982 call!30983)))

(declare-fun b!482772 () Bool)

(declare-fun res!287760 () Bool)

(assert (=> b!482772 (=> (not res!287760) (not e!284111))))

(declare-fun e!284103 () Bool)

(assert (=> b!482772 (= res!287760 e!284103)))

(declare-fun res!287759 () Bool)

(assert (=> b!482772 (=> res!287759 e!284103)))

(declare-fun e!284108 () Bool)

(assert (=> b!482772 (= res!287759 (not e!284108))))

(declare-fun res!287758 () Bool)

(assert (=> b!482772 (=> (not res!287758) (not e!284108))))

(assert (=> b!482772 (= res!287758 (bvslt #b00000000000000000000000000000000 (size!15434 _keys!1874)))))

(declare-fun b!482773 () Bool)

(declare-fun e!284100 () Bool)

(declare-fun lt!218841 () ListLongMap!8063)

(assert (=> b!482773 (= e!284100 (= (apply!343 lt!218841 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun b!482774 () Bool)

(assert (=> b!482774 (= e!284107 call!30982)))

(declare-fun b!482776 () Bool)

(assert (=> b!482776 (= e!284112 e!284100)))

(declare-fun res!287761 () Bool)

(declare-fun call!30981 () Bool)

(assert (=> b!482776 (= res!287761 call!30981)))

(assert (=> b!482776 (=> (not res!287761) (not e!284100))))

(declare-fun e!284110 () Bool)

(declare-fun b!482777 () Bool)

(declare-fun get!7296 (ValueCell!6561 V!19531) V!19531)

(declare-fun dynLambda!954 (Int (_ BitVec 64)) V!19531)

(assert (=> b!482777 (= e!284110 (= (apply!343 lt!218841 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)) (get!7296 (select (arr!15077 _values!1516) #b00000000000000000000000000000000) (dynLambda!954 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15435 _values!1516)))))

(assert (=> b!482777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15434 _keys!1874)))))

(declare-fun b!482778 () Bool)

(declare-fun e!284104 () ListLongMap!8063)

(assert (=> b!482778 (= e!284104 (+!1775 call!30983 (tuple2!9151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun call!30984 () ListLongMap!8063)

(declare-fun bm!30976 () Bool)

(assert (=> bm!30976 (= call!30984 (getCurrentListMapNoExtraKeys!2112 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun b!482779 () Bool)

(assert (=> b!482779 (= e!284108 (validKeyInArray!0 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!30977 () Bool)

(assert (=> bm!30977 (= call!30981 (contains!2661 lt!218841 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482780 () Bool)

(declare-fun e!284101 () Bool)

(declare-fun call!30980 () Bool)

(assert (=> b!482780 (= e!284101 (not call!30980))))

(declare-fun b!482781 () Bool)

(assert (=> b!482781 (= e!284104 e!284102)))

(declare-fun c!57997 () Bool)

(assert (=> b!482781 (= c!57997 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!482782 () Bool)

(assert (=> b!482782 (= e!284112 (not call!30981))))

(declare-fun bm!30978 () Bool)

(declare-fun call!30979 () ListLongMap!8063)

(declare-fun call!30978 () ListLongMap!8063)

(assert (=> bm!30978 (= call!30979 call!30978)))

(declare-fun bm!30979 () Bool)

(declare-fun c!58001 () Bool)

(assert (=> bm!30979 (= call!30983 (+!1775 (ite c!58001 call!30984 (ite c!57997 call!30978 call!30979)) (ite (or c!58001 c!57997) (tuple2!9151 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9151 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun bm!30980 () Bool)

(assert (=> bm!30980 (= call!30980 (contains!2661 lt!218841 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!482783 () Bool)

(assert (=> b!482783 (= e!284107 call!30979)))

(declare-fun b!482784 () Bool)

(assert (=> b!482784 (= e!284103 e!284110)))

(declare-fun res!287756 () Bool)

(assert (=> b!482784 (=> (not res!287756) (not e!284110))))

(assert (=> b!482784 (= res!287756 (contains!2661 lt!218841 (select (arr!15076 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!482784 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15434 _keys!1874)))))

(declare-fun b!482785 () Bool)

(assert (=> b!482785 (= e!284111 e!284101)))

(declare-fun c!58000 () Bool)

(assert (=> b!482785 (= c!58000 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!30981 () Bool)

(assert (=> bm!30981 (= call!30978 call!30984)))

(declare-fun b!482786 () Bool)

(declare-fun e!284105 () Bool)

(assert (=> b!482786 (= e!284101 e!284105)))

(declare-fun res!287763 () Bool)

(assert (=> b!482786 (= res!287763 call!30980)))

(assert (=> b!482786 (=> (not res!287763) (not e!284105))))

(declare-fun d!76843 () Bool)

(assert (=> d!76843 e!284111))

(declare-fun res!287762 () Bool)

(assert (=> d!76843 (=> (not res!287762) (not e!284111))))

(assert (=> d!76843 (= res!287762 (or (bvsge #b00000000000000000000000000000000 (size!15434 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15434 _keys!1874)))))))

(declare-fun lt!218846 () ListLongMap!8063)

(assert (=> d!76843 (= lt!218841 lt!218846)))

(declare-fun lt!218853 () Unit!14152)

(assert (=> d!76843 (= lt!218853 e!284109)))

(declare-fun c!57999 () Bool)

(assert (=> d!76843 (= c!57999 e!284106)))

(declare-fun res!287757 () Bool)

(assert (=> d!76843 (=> (not res!287757) (not e!284106))))

(assert (=> d!76843 (= res!287757 (bvslt #b00000000000000000000000000000000 (size!15434 _keys!1874)))))

(assert (=> d!76843 (= lt!218846 e!284104)))

(assert (=> d!76843 (= c!58001 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76843 (validMask!0 mask!2352)))

(assert (=> d!76843 (= (getCurrentListMap!2366 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218841)))

(declare-fun b!482775 () Bool)

(assert (=> b!482775 (= e!284105 (= (apply!343 lt!218841 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(assert (= (and d!76843 c!58001) b!482778))

(assert (= (and d!76843 (not c!58001)) b!482781))

(assert (= (and b!482781 c!57997) b!482769))

(assert (= (and b!482781 (not c!57997)) b!482768))

(assert (= (and b!482768 c!57998) b!482774))

(assert (= (and b!482768 (not c!57998)) b!482783))

(assert (= (or b!482774 b!482783) bm!30978))

(assert (= (or b!482769 bm!30978) bm!30981))

(assert (= (or b!482769 b!482774) bm!30975))

(assert (= (or b!482778 bm!30981) bm!30976))

(assert (= (or b!482778 bm!30975) bm!30979))

(assert (= (and d!76843 res!287757) b!482766))

(assert (= (and d!76843 c!57999) b!482770))

(assert (= (and d!76843 (not c!57999)) b!482771))

(assert (= (and d!76843 res!287762) b!482772))

(assert (= (and b!482772 res!287758) b!482779))

(assert (= (and b!482772 (not res!287759)) b!482784))

(assert (= (and b!482784 res!287756) b!482777))

(assert (= (and b!482772 res!287760) b!482767))

(assert (= (and b!482767 c!58002) b!482776))

(assert (= (and b!482767 (not c!58002)) b!482782))

(assert (= (and b!482776 res!287761) b!482773))

(assert (= (or b!482776 b!482782) bm!30977))

(assert (= (and b!482767 res!287764) b!482785))

(assert (= (and b!482785 c!58000) b!482786))

(assert (= (and b!482785 (not c!58000)) b!482780))

(assert (= (and b!482786 res!287763) b!482775))

(assert (= (or b!482786 b!482780) bm!30980))

(declare-fun b_lambda!10807 () Bool)

(assert (=> (not b_lambda!10807) (not b!482777)))

(declare-fun t!15447 () Bool)

(declare-fun tb!4167 () Bool)

(assert (=> (and start!43554 (= defaultEntry!1519 defaultEntry!1519) t!15447) tb!4167))

(declare-fun result!7769 () Bool)

(assert (=> tb!4167 (= result!7769 tp_is_empty!13845)))

(assert (=> b!482777 t!15447))

(declare-fun b_and!21097 () Bool)

(assert (= b_and!21093 (and (=> t!15447 result!7769) b_and!21097)))

(declare-fun m!463907 () Bool)

(assert (=> bm!30980 m!463907))

(assert (=> b!482784 m!463883))

(assert (=> b!482784 m!463883))

(declare-fun m!463909 () Bool)

(assert (=> b!482784 m!463909))

(assert (=> b!482777 m!463883))

(declare-fun m!463911 () Bool)

(assert (=> b!482777 m!463911))

(declare-fun m!463913 () Bool)

(assert (=> b!482777 m!463913))

(declare-fun m!463915 () Bool)

(assert (=> b!482777 m!463915))

(assert (=> b!482777 m!463883))

(assert (=> b!482777 m!463915))

(assert (=> b!482777 m!463913))

(declare-fun m!463917 () Bool)

(assert (=> b!482777 m!463917))

(declare-fun m!463919 () Bool)

(assert (=> bm!30979 m!463919))

(declare-fun m!463921 () Bool)

(assert (=> bm!30977 m!463921))

(declare-fun m!463923 () Bool)

(assert (=> b!482775 m!463923))

(assert (=> b!482766 m!463883))

(assert (=> b!482766 m!463883))

(assert (=> b!482766 m!463885))

(assert (=> b!482779 m!463883))

(assert (=> b!482779 m!463883))

(assert (=> b!482779 m!463885))

(assert (=> d!76843 m!463835))

(declare-fun m!463925 () Bool)

(assert (=> b!482773 m!463925))

(declare-fun m!463927 () Bool)

(assert (=> b!482770 m!463927))

(declare-fun m!463929 () Bool)

(assert (=> b!482770 m!463929))

(declare-fun m!463931 () Bool)

(assert (=> b!482770 m!463931))

(declare-fun m!463933 () Bool)

(assert (=> b!482770 m!463933))

(declare-fun m!463935 () Bool)

(assert (=> b!482770 m!463935))

(declare-fun m!463937 () Bool)

(assert (=> b!482770 m!463937))

(declare-fun m!463939 () Bool)

(assert (=> b!482770 m!463939))

(assert (=> b!482770 m!463933))

(assert (=> b!482770 m!463883))

(declare-fun m!463941 () Bool)

(assert (=> b!482770 m!463941))

(declare-fun m!463943 () Bool)

(assert (=> b!482770 m!463943))

(assert (=> b!482770 m!463941))

(declare-fun m!463945 () Bool)

(assert (=> b!482770 m!463945))

(declare-fun m!463947 () Bool)

(assert (=> b!482770 m!463947))

(declare-fun m!463949 () Bool)

(assert (=> b!482770 m!463949))

(declare-fun m!463951 () Bool)

(assert (=> b!482770 m!463951))

(declare-fun m!463953 () Bool)

(assert (=> b!482770 m!463953))

(assert (=> b!482770 m!463937))

(declare-fun m!463955 () Bool)

(assert (=> b!482770 m!463955))

(assert (=> b!482770 m!463949))

(declare-fun m!463957 () Bool)

(assert (=> b!482770 m!463957))

(assert (=> bm!30976 m!463929))

(declare-fun m!463959 () Bool)

(assert (=> b!482778 m!463959))

(assert (=> b!482647 d!76843))

(declare-fun d!76845 () Bool)

(declare-fun res!287769 () Bool)

(declare-fun e!284117 () Bool)

(assert (=> d!76845 (=> res!287769 e!284117)))

(assert (=> d!76845 (= res!287769 (= (select (arr!15076 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76845 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284117)))

(declare-fun b!482793 () Bool)

(declare-fun e!284118 () Bool)

(assert (=> b!482793 (= e!284117 e!284118)))

(declare-fun res!287770 () Bool)

(assert (=> b!482793 (=> (not res!287770) (not e!284118))))

(assert (=> b!482793 (= res!287770 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15434 _keys!1874)))))

(declare-fun b!482794 () Bool)

(assert (=> b!482794 (= e!284118 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76845 (not res!287769)) b!482793))

(assert (= (and b!482793 res!287770) b!482794))

(assert (=> d!76845 m!463883))

(declare-fun m!463961 () Bool)

(assert (=> b!482794 m!463961))

(assert (=> b!482651 d!76845))

(declare-fun d!76847 () Bool)

(declare-fun lt!218857 () (_ BitVec 32))

(assert (=> d!76847 (and (or (bvslt lt!218857 #b00000000000000000000000000000000) (bvsge lt!218857 (size!15434 _keys!1874)) (and (bvsge lt!218857 #b00000000000000000000000000000000) (bvslt lt!218857 (size!15434 _keys!1874)))) (bvsge lt!218857 #b00000000000000000000000000000000) (bvslt lt!218857 (size!15434 _keys!1874)) (= (select (arr!15076 _keys!1874) lt!218857) k0!1332))))

(declare-fun e!284121 () (_ BitVec 32))

(assert (=> d!76847 (= lt!218857 e!284121)))

(declare-fun c!58005 () Bool)

(assert (=> d!76847 (= c!58005 (= (select (arr!15076 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76847 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15434 _keys!1874)) (bvslt (size!15434 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76847 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218857)))

(declare-fun b!482799 () Bool)

(assert (=> b!482799 (= e!284121 #b00000000000000000000000000000000)))

(declare-fun b!482800 () Bool)

(assert (=> b!482800 (= e!284121 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76847 c!58005) b!482799))

(assert (= (and d!76847 (not c!58005)) b!482800))

(declare-fun m!463963 () Bool)

(assert (=> d!76847 m!463963))

(assert (=> d!76847 m!463883))

(declare-fun m!463965 () Bool)

(assert (=> b!482800 m!463965))

(assert (=> b!482645 d!76847))

(declare-fun d!76849 () Bool)

(declare-fun e!284124 () Bool)

(assert (=> d!76849 e!284124))

(declare-fun c!58008 () Bool)

(assert (=> d!76849 (= c!58008 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218860 () Unit!14152)

(declare-fun choose!1378 (array!31347 array!31349 (_ BitVec 32) (_ BitVec 32) V!19531 V!19531 (_ BitVec 64) Int) Unit!14152)

(assert (=> d!76849 (= lt!218860 (choose!1378 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76849 (validMask!0 mask!2352)))

(assert (=> d!76849 (= (lemmaKeyInListMapIsInArray!147 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218860)))

(declare-fun b!482805 () Bool)

(assert (=> b!482805 (= e!284124 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482806 () Bool)

(assert (=> b!482806 (= e!284124 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76849 c!58008) b!482805))

(assert (= (and d!76849 (not c!58008)) b!482806))

(declare-fun m!463967 () Bool)

(assert (=> d!76849 m!463967))

(assert (=> d!76849 m!463835))

(assert (=> b!482805 m!463851))

(assert (=> b!482645 d!76849))

(declare-fun mapNonEmpty!22483 () Bool)

(declare-fun mapRes!22483 () Bool)

(declare-fun tp!43291 () Bool)

(declare-fun e!284129 () Bool)

(assert (=> mapNonEmpty!22483 (= mapRes!22483 (and tp!43291 e!284129))))

(declare-fun mapKey!22483 () (_ BitVec 32))

(declare-fun mapValue!22483 () ValueCell!6561)

(declare-fun mapRest!22483 () (Array (_ BitVec 32) ValueCell!6561))

(assert (=> mapNonEmpty!22483 (= mapRest!22477 (store mapRest!22483 mapKey!22483 mapValue!22483))))

(declare-fun condMapEmpty!22483 () Bool)

(declare-fun mapDefault!22483 () ValueCell!6561)

(assert (=> mapNonEmpty!22477 (= condMapEmpty!22483 (= mapRest!22477 ((as const (Array (_ BitVec 32) ValueCell!6561)) mapDefault!22483)))))

(declare-fun e!284130 () Bool)

(assert (=> mapNonEmpty!22477 (= tp!43281 (and e!284130 mapRes!22483))))

(declare-fun b!482814 () Bool)

(assert (=> b!482814 (= e!284130 tp_is_empty!13845)))

(declare-fun b!482813 () Bool)

(assert (=> b!482813 (= e!284129 tp_is_empty!13845)))

(declare-fun mapIsEmpty!22483 () Bool)

(assert (=> mapIsEmpty!22483 mapRes!22483))

(assert (= (and mapNonEmpty!22477 condMapEmpty!22483) mapIsEmpty!22483))

(assert (= (and mapNonEmpty!22477 (not condMapEmpty!22483)) mapNonEmpty!22483))

(assert (= (and mapNonEmpty!22483 ((_ is ValueCellFull!6561) mapValue!22483)) b!482813))

(assert (= (and mapNonEmpty!22477 ((_ is ValueCellFull!6561) mapDefault!22483)) b!482814))

(declare-fun m!463969 () Bool)

(assert (=> mapNonEmpty!22483 m!463969))

(declare-fun b_lambda!10809 () Bool)

(assert (= b_lambda!10807 (or (and start!43554 b_free!12333) b_lambda!10809)))

(check-sat (not mapNonEmpty!22483) (not b!482702) (not b!482778) (not b!482773) (not d!76843) (not b!482723) (not bm!30957) (not bm!30979) (not b!482770) (not d!76849) (not b!482698) (not bm!30960) (not b!482794) (not b!482713) (not b!482779) (not b!482711) (not d!76841) (not b!482784) (not bm!30980) tp_is_empty!13845 (not bm!30976) (not b!482775) (not b_next!12333) (not b!482721) (not b_lambda!10809) (not b!482701) (not bm!30977) (not b!482777) (not b!482805) b_and!21097 (not b!482766) (not b!482800))
(check-sat b_and!21097 (not b_next!12333))
