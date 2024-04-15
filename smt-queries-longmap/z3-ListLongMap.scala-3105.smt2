; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43600 () Bool)

(assert start!43600)

(declare-fun b_free!12349 () Bool)

(declare-fun b_next!12349 () Bool)

(assert (=> start!43600 (= b_free!12349 (not b_next!12349))))

(declare-fun tp!43335 () Bool)

(declare-fun b_and!21087 () Bool)

(assert (=> start!43600 (= tp!43335 b_and!21087)))

(declare-fun b!482895 () Bool)

(declare-fun res!287824 () Bool)

(declare-fun e!284165 () Bool)

(assert (=> b!482895 (=> (not res!287824) (not e!284165))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482895 (= res!287824 (validKeyInArray!0 k0!1332))))

(declare-fun res!287821 () Bool)

(assert (=> start!43600 (=> (not res!287821) (not e!284165))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43600 (= res!287821 (validMask!0 mask!2352))))

(assert (=> start!43600 e!284165))

(assert (=> start!43600 true))

(declare-fun tp_is_empty!13861 () Bool)

(assert (=> start!43600 tp_is_empty!13861))

(declare-datatypes ((V!19553 0))(
  ( (V!19554 (val!6978 Int)) )
))
(declare-datatypes ((ValueCell!6569 0))(
  ( (ValueCellFull!6569 (v!9267 V!19553)) (EmptyCell!6569) )
))
(declare-datatypes ((array!31377 0))(
  ( (array!31378 (arr!15089 (Array (_ BitVec 32) ValueCell!6569)) (size!15448 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31377)

(declare-fun e!284168 () Bool)

(declare-fun array_inv!10974 (array!31377) Bool)

(assert (=> start!43600 (and (array_inv!10974 _values!1516) e!284168)))

(assert (=> start!43600 tp!43335))

(declare-datatypes ((array!31379 0))(
  ( (array!31380 (arr!15090 (Array (_ BitVec 32) (_ BitVec 64))) (size!15449 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31379)

(declare-fun array_inv!10975 (array!31379) Bool)

(assert (=> start!43600 (array_inv!10975 _keys!1874)))

(declare-fun b!482896 () Bool)

(declare-fun res!287823 () Bool)

(assert (=> b!482896 (=> (not res!287823) (not e!284165))))

(declare-datatypes ((List!9276 0))(
  ( (Nil!9273) (Cons!9272 (h!10128 (_ BitVec 64)) (t!15485 List!9276)) )
))
(declare-fun arrayNoDuplicates!0 (array!31379 (_ BitVec 32) List!9276) Bool)

(assert (=> b!482896 (= res!287823 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9273))))

(declare-fun b!482897 () Bool)

(declare-fun e!284167 () Bool)

(assert (=> b!482897 (= e!284165 (not e!284167))))

(declare-fun res!287820 () Bool)

(assert (=> b!482897 (=> res!287820 e!284167)))

(declare-datatypes ((SeekEntryResult!3569 0))(
  ( (MissingZero!3569 (index!16455 (_ BitVec 32))) (Found!3569 (index!16456 (_ BitVec 32))) (Intermediate!3569 (undefined!4381 Bool) (index!16457 (_ BitVec 32)) (x!45368 (_ BitVec 32))) (Undefined!3569) (MissingVacant!3569 (index!16458 (_ BitVec 32))) )
))
(declare-fun lt!218764 () SeekEntryResult!3569)

(get-info :version)

(assert (=> b!482897 (= res!287820 (not ((_ is Found!3569) lt!218764)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31379 (_ BitVec 32)) SeekEntryResult!3569)

(assert (=> b!482897 (= lt!218764 (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352))))

(declare-fun lt!218767 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31379 (_ BitVec 32)) Bool)

(assert (=> b!482897 (arrayForallSeekEntryOrOpenFound!0 lt!218767 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14148 0))(
  ( (Unit!14149) )
))
(declare-fun lt!218766 () Unit!14148)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14148)

(assert (=> b!482897 (= lt!218766 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218767))))

(declare-fun arrayScanForKey!0 (array!31379 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482897 (= lt!218767 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!284169 () Bool)

(assert (=> b!482897 e!284169))

(declare-fun c!57991 () Bool)

(assert (=> b!482897 (= c!57991 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19553)

(declare-fun lt!218765 () Unit!14148)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19553)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!159 (array!31379 array!31377 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 64) Int) Unit!14148)

(assert (=> b!482897 (= lt!218765 (lemmaKeyInListMapIsInArray!159 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun mapIsEmpty!22507 () Bool)

(declare-fun mapRes!22507 () Bool)

(assert (=> mapIsEmpty!22507 mapRes!22507))

(declare-fun b!482898 () Bool)

(assert (=> b!482898 (= e!284169 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482899 () Bool)

(declare-fun arrayContainsKey!0 (array!31379 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482899 (= e!284169 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482900 () Bool)

(declare-fun res!287819 () Bool)

(assert (=> b!482900 (=> res!287819 e!284167)))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!482900 (= res!287819 (not (inRange!0 (index!16456 lt!218764) mask!2352)))))

(declare-fun b!482901 () Bool)

(declare-fun res!287822 () Bool)

(assert (=> b!482901 (=> (not res!287822) (not e!284165))))

(assert (=> b!482901 (= res!287822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482902 () Bool)

(declare-fun e!284163 () Bool)

(assert (=> b!482902 (= e!284163 tp_is_empty!13861)))

(declare-fun b!482903 () Bool)

(declare-fun res!287818 () Bool)

(assert (=> b!482903 (=> (not res!287818) (not e!284165))))

(assert (=> b!482903 (= res!287818 (and (= (size!15448 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15449 _keys!1874) (size!15448 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482904 () Bool)

(assert (=> b!482904 (= e!284167 (and (bvsge (index!16456 lt!218764) #b00000000000000000000000000000000) (bvslt (index!16456 lt!218764) (size!15449 _keys!1874))))))

(declare-fun mapNonEmpty!22507 () Bool)

(declare-fun tp!43336 () Bool)

(declare-fun e!284166 () Bool)

(assert (=> mapNonEmpty!22507 (= mapRes!22507 (and tp!43336 e!284166))))

(declare-fun mapValue!22507 () ValueCell!6569)

(declare-fun mapKey!22507 () (_ BitVec 32))

(declare-fun mapRest!22507 () (Array (_ BitVec 32) ValueCell!6569))

(assert (=> mapNonEmpty!22507 (= (arr!15089 _values!1516) (store mapRest!22507 mapKey!22507 mapValue!22507))))

(declare-fun b!482905 () Bool)

(declare-fun res!287817 () Bool)

(assert (=> b!482905 (=> (not res!287817) (not e!284165))))

(declare-datatypes ((tuple2!9212 0))(
  ( (tuple2!9213 (_1!4617 (_ BitVec 64)) (_2!4617 V!19553)) )
))
(declare-datatypes ((List!9277 0))(
  ( (Nil!9274) (Cons!9273 (h!10129 tuple2!9212) (t!15486 List!9277)) )
))
(declare-datatypes ((ListLongMap!8115 0))(
  ( (ListLongMap!8116 (toList!4073 List!9277)) )
))
(declare-fun contains!2654 (ListLongMap!8115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2326 (array!31379 array!31377 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 32) Int) ListLongMap!8115)

(assert (=> b!482905 (= res!287817 (contains!2654 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482906 () Bool)

(assert (=> b!482906 (= e!284168 (and e!284163 mapRes!22507))))

(declare-fun condMapEmpty!22507 () Bool)

(declare-fun mapDefault!22507 () ValueCell!6569)

(assert (=> b!482906 (= condMapEmpty!22507 (= (arr!15089 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6569)) mapDefault!22507)))))

(declare-fun b!482907 () Bool)

(assert (=> b!482907 (= e!284166 tp_is_empty!13861)))

(assert (= (and start!43600 res!287821) b!482903))

(assert (= (and b!482903 res!287818) b!482901))

(assert (= (and b!482901 res!287822) b!482896))

(assert (= (and b!482896 res!287823) b!482905))

(assert (= (and b!482905 res!287817) b!482895))

(assert (= (and b!482895 res!287824) b!482897))

(assert (= (and b!482897 c!57991) b!482899))

(assert (= (and b!482897 (not c!57991)) b!482898))

(assert (= (and b!482897 (not res!287820)) b!482900))

(assert (= (and b!482900 (not res!287819)) b!482904))

(assert (= (and b!482906 condMapEmpty!22507) mapIsEmpty!22507))

(assert (= (and b!482906 (not condMapEmpty!22507)) mapNonEmpty!22507))

(assert (= (and mapNonEmpty!22507 ((_ is ValueCellFull!6569) mapValue!22507)) b!482907))

(assert (= (and b!482906 ((_ is ValueCellFull!6569) mapDefault!22507)) b!482902))

(assert (= start!43600 b!482906))

(declare-fun m!463469 () Bool)

(assert (=> b!482899 m!463469))

(declare-fun m!463471 () Bool)

(assert (=> b!482895 m!463471))

(declare-fun m!463473 () Bool)

(assert (=> mapNonEmpty!22507 m!463473))

(declare-fun m!463475 () Bool)

(assert (=> b!482901 m!463475))

(declare-fun m!463477 () Bool)

(assert (=> b!482900 m!463477))

(declare-fun m!463479 () Bool)

(assert (=> b!482897 m!463479))

(declare-fun m!463481 () Bool)

(assert (=> b!482897 m!463481))

(declare-fun m!463483 () Bool)

(assert (=> b!482897 m!463483))

(declare-fun m!463485 () Bool)

(assert (=> b!482897 m!463485))

(declare-fun m!463487 () Bool)

(assert (=> b!482897 m!463487))

(declare-fun m!463489 () Bool)

(assert (=> start!43600 m!463489))

(declare-fun m!463491 () Bool)

(assert (=> start!43600 m!463491))

(declare-fun m!463493 () Bool)

(assert (=> start!43600 m!463493))

(declare-fun m!463495 () Bool)

(assert (=> b!482896 m!463495))

(declare-fun m!463497 () Bool)

(assert (=> b!482905 m!463497))

(assert (=> b!482905 m!463497))

(declare-fun m!463499 () Bool)

(assert (=> b!482905 m!463499))

(check-sat (not b!482905) (not start!43600) (not b!482899) b_and!21087 (not b_next!12349) (not b!482900) (not b!482896) (not mapNonEmpty!22507) (not b!482895) (not b!482897) (not b!482901) tp_is_empty!13861)
(check-sat b_and!21087 (not b_next!12349))
(get-model)

(declare-fun b!482994 () Bool)

(declare-fun e!284218 () Bool)

(declare-fun e!284220 () Bool)

(assert (=> b!482994 (= e!284218 e!284220)))

(declare-fun lt!218799 () (_ BitVec 64))

(assert (=> b!482994 (= lt!218799 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218800 () Unit!14148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31379 (_ BitVec 64) (_ BitVec 32)) Unit!14148)

(assert (=> b!482994 (= lt!218800 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218799 #b00000000000000000000000000000000))))

(assert (=> b!482994 (arrayContainsKey!0 _keys!1874 lt!218799 #b00000000000000000000000000000000)))

(declare-fun lt!218798 () Unit!14148)

(assert (=> b!482994 (= lt!218798 lt!218800)))

(declare-fun res!287878 () Bool)

(assert (=> b!482994 (= res!287878 (= (seekEntryOrOpen!0 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000) _keys!1874 mask!2352) (Found!3569 #b00000000000000000000000000000000)))))

(assert (=> b!482994 (=> (not res!287878) (not e!284220))))

(declare-fun d!76675 () Bool)

(declare-fun res!287877 () Bool)

(declare-fun e!284219 () Bool)

(assert (=> d!76675 (=> res!287877 e!284219)))

(assert (=> d!76675 (= res!287877 (bvsge #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (=> d!76675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352) e!284219)))

(declare-fun b!482995 () Bool)

(declare-fun call!30989 () Bool)

(assert (=> b!482995 (= e!284220 call!30989)))

(declare-fun bm!30986 () Bool)

(assert (=> bm!30986 (= call!30989 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!482996 () Bool)

(assert (=> b!482996 (= e!284218 call!30989)))

(declare-fun b!482997 () Bool)

(assert (=> b!482997 (= e!284219 e!284218)))

(declare-fun c!58000 () Bool)

(assert (=> b!482997 (= c!58000 (validKeyInArray!0 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(assert (= (and d!76675 (not res!287877)) b!482997))

(assert (= (and b!482997 c!58000) b!482994))

(assert (= (and b!482997 (not c!58000)) b!482996))

(assert (= (and b!482994 res!287878) b!482995))

(assert (= (or b!482995 b!482996) bm!30986))

(declare-fun m!463565 () Bool)

(assert (=> b!482994 m!463565))

(declare-fun m!463567 () Bool)

(assert (=> b!482994 m!463567))

(declare-fun m!463569 () Bool)

(assert (=> b!482994 m!463569))

(assert (=> b!482994 m!463565))

(declare-fun m!463571 () Bool)

(assert (=> b!482994 m!463571))

(declare-fun m!463573 () Bool)

(assert (=> bm!30986 m!463573))

(assert (=> b!482997 m!463565))

(assert (=> b!482997 m!463565))

(declare-fun m!463575 () Bool)

(assert (=> b!482997 m!463575))

(assert (=> b!482901 d!76675))

(declare-fun d!76677 () Bool)

(declare-fun e!284225 () Bool)

(assert (=> d!76677 e!284225))

(declare-fun res!287881 () Bool)

(assert (=> d!76677 (=> res!287881 e!284225)))

(declare-fun lt!218811 () Bool)

(assert (=> d!76677 (= res!287881 (not lt!218811))))

(declare-fun lt!218812 () Bool)

(assert (=> d!76677 (= lt!218811 lt!218812)))

(declare-fun lt!218810 () Unit!14148)

(declare-fun e!284226 () Unit!14148)

(assert (=> d!76677 (= lt!218810 e!284226)))

(declare-fun c!58003 () Bool)

(assert (=> d!76677 (= c!58003 lt!218812)))

(declare-fun containsKey!358 (List!9277 (_ BitVec 64)) Bool)

(assert (=> d!76677 (= lt!218812 (containsKey!358 (toList!4073 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(assert (=> d!76677 (= (contains!2654 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332) lt!218811)))

(declare-fun b!483004 () Bool)

(declare-fun lt!218809 () Unit!14148)

(assert (=> b!483004 (= e!284226 lt!218809)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!307 (List!9277 (_ BitVec 64)) Unit!14148)

(assert (=> b!483004 (= lt!218809 (lemmaContainsKeyImpliesGetValueByKeyDefined!307 (toList!4073 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-datatypes ((Option!402 0))(
  ( (Some!401 (v!9270 V!19553)) (None!400) )
))
(declare-fun isDefined!308 (Option!402) Bool)

(declare-fun getValueByKey!396 (List!9277 (_ BitVec 64)) Option!402)

(assert (=> b!483004 (isDefined!308 (getValueByKey!396 (toList!4073 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332))))

(declare-fun b!483005 () Bool)

(declare-fun Unit!14150 () Unit!14148)

(assert (=> b!483005 (= e!284226 Unit!14150)))

(declare-fun b!483006 () Bool)

(assert (=> b!483006 (= e!284225 (isDefined!308 (getValueByKey!396 (toList!4073 (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519)) k0!1332)))))

(assert (= (and d!76677 c!58003) b!483004))

(assert (= (and d!76677 (not c!58003)) b!483005))

(assert (= (and d!76677 (not res!287881)) b!483006))

(declare-fun m!463577 () Bool)

(assert (=> d!76677 m!463577))

(declare-fun m!463579 () Bool)

(assert (=> b!483004 m!463579))

(declare-fun m!463581 () Bool)

(assert (=> b!483004 m!463581))

(assert (=> b!483004 m!463581))

(declare-fun m!463583 () Bool)

(assert (=> b!483004 m!463583))

(assert (=> b!483006 m!463581))

(assert (=> b!483006 m!463581))

(assert (=> b!483006 m!463583))

(assert (=> b!482905 d!76677))

(declare-fun bm!31001 () Bool)

(declare-fun call!31007 () Bool)

(declare-fun lt!218871 () ListLongMap!8115)

(assert (=> bm!31001 (= call!31007 (contains!2654 lt!218871 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483049 () Bool)

(declare-fun e!284261 () ListLongMap!8115)

(declare-fun call!31009 () ListLongMap!8115)

(assert (=> b!483049 (= e!284261 call!31009)))

(declare-fun b!483051 () Bool)

(declare-fun e!284255 () ListLongMap!8115)

(declare-fun call!31010 () ListLongMap!8115)

(assert (=> b!483051 (= e!284255 call!31010)))

(declare-fun bm!31002 () Bool)

(declare-fun call!31008 () ListLongMap!8115)

(declare-fun call!31004 () ListLongMap!8115)

(declare-fun c!58016 () Bool)

(declare-fun call!31006 () ListLongMap!8115)

(declare-fun c!58020 () Bool)

(declare-fun +!1813 (ListLongMap!8115 tuple2!9212) ListLongMap!8115)

(assert (=> bm!31002 (= call!31006 (+!1813 (ite c!58020 call!31004 (ite c!58016 call!31008 call!31009)) (ite (or c!58020 c!58016) (tuple2!9213 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1458) (tuple2!9213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458))))))

(declare-fun b!483052 () Bool)

(declare-fun e!284263 () Bool)

(assert (=> b!483052 (= e!284263 (not call!31007))))

(declare-fun b!483053 () Bool)

(declare-fun e!284260 () Bool)

(declare-fun call!31005 () Bool)

(assert (=> b!483053 (= e!284260 (not call!31005))))

(declare-fun b!483054 () Bool)

(declare-fun e!284259 () ListLongMap!8115)

(assert (=> b!483054 (= e!284259 (+!1813 call!31006 (tuple2!9213 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1458)))))

(declare-fun b!483055 () Bool)

(declare-fun e!284253 () Bool)

(declare-fun e!284265 () Bool)

(assert (=> b!483055 (= e!284253 e!284265)))

(declare-fun res!287904 () Bool)

(assert (=> b!483055 (=> (not res!287904) (not e!284265))))

(assert (=> b!483055 (= res!287904 (contains!2654 lt!218871 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(assert (=> b!483055 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(declare-fun b!483056 () Bool)

(declare-fun e!284254 () Bool)

(assert (=> b!483056 (= e!284254 e!284263)))

(declare-fun c!58019 () Bool)

(assert (=> b!483056 (= c!58019 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483057 () Bool)

(declare-fun e!284262 () Unit!14148)

(declare-fun lt!218869 () Unit!14148)

(assert (=> b!483057 (= e!284262 lt!218869)))

(declare-fun lt!218860 () ListLongMap!8115)

(declare-fun getCurrentListMapNoExtraKeys!2149 (array!31379 array!31377 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 32) Int) ListLongMap!8115)

(assert (=> b!483057 (= lt!218860 (getCurrentListMapNoExtraKeys!2149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218866 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218866 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218877 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218877 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218862 () Unit!14148)

(declare-fun addStillContains!303 (ListLongMap!8115 (_ BitVec 64) V!19553 (_ BitVec 64)) Unit!14148)

(assert (=> b!483057 (= lt!218862 (addStillContains!303 lt!218860 lt!218866 zeroValue!1458 lt!218877))))

(assert (=> b!483057 (contains!2654 (+!1813 lt!218860 (tuple2!9213 lt!218866 zeroValue!1458)) lt!218877)))

(declare-fun lt!218858 () Unit!14148)

(assert (=> b!483057 (= lt!218858 lt!218862)))

(declare-fun lt!218859 () ListLongMap!8115)

(assert (=> b!483057 (= lt!218859 (getCurrentListMapNoExtraKeys!2149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218875 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218875 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218863 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218863 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218874 () Unit!14148)

(declare-fun addApplyDifferent!303 (ListLongMap!8115 (_ BitVec 64) V!19553 (_ BitVec 64)) Unit!14148)

(assert (=> b!483057 (= lt!218874 (addApplyDifferent!303 lt!218859 lt!218875 minValue!1458 lt!218863))))

(declare-fun apply!345 (ListLongMap!8115 (_ BitVec 64)) V!19553)

(assert (=> b!483057 (= (apply!345 (+!1813 lt!218859 (tuple2!9213 lt!218875 minValue!1458)) lt!218863) (apply!345 lt!218859 lt!218863))))

(declare-fun lt!218865 () Unit!14148)

(assert (=> b!483057 (= lt!218865 lt!218874)))

(declare-fun lt!218878 () ListLongMap!8115)

(assert (=> b!483057 (= lt!218878 (getCurrentListMapNoExtraKeys!2149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218870 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218870 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218876 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218876 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000))))

(declare-fun lt!218872 () Unit!14148)

(assert (=> b!483057 (= lt!218872 (addApplyDifferent!303 lt!218878 lt!218870 zeroValue!1458 lt!218876))))

(assert (=> b!483057 (= (apply!345 (+!1813 lt!218878 (tuple2!9213 lt!218870 zeroValue!1458)) lt!218876) (apply!345 lt!218878 lt!218876))))

(declare-fun lt!218873 () Unit!14148)

(assert (=> b!483057 (= lt!218873 lt!218872)))

(declare-fun lt!218857 () ListLongMap!8115)

(assert (=> b!483057 (= lt!218857 (getCurrentListMapNoExtraKeys!2149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun lt!218867 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218867 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218868 () (_ BitVec 64))

(assert (=> b!483057 (= lt!218868 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> b!483057 (= lt!218869 (addApplyDifferent!303 lt!218857 lt!218867 minValue!1458 lt!218868))))

(assert (=> b!483057 (= (apply!345 (+!1813 lt!218857 (tuple2!9213 lt!218867 minValue!1458)) lt!218868) (apply!345 lt!218857 lt!218868))))

(declare-fun b!483058 () Bool)

(assert (=> b!483058 (= e!284259 e!284255)))

(assert (=> b!483058 (= c!58016 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!483059 () Bool)

(declare-fun c!58018 () Bool)

(assert (=> b!483059 (= c!58018 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!483059 (= e!284255 e!284261)))

(declare-fun b!483060 () Bool)

(assert (=> b!483060 (= e!284261 call!31010)))

(declare-fun b!483061 () Bool)

(declare-fun res!287908 () Bool)

(assert (=> b!483061 (=> (not res!287908) (not e!284254))))

(assert (=> b!483061 (= res!287908 e!284260)))

(declare-fun c!58021 () Bool)

(assert (=> b!483061 (= c!58021 (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!483062 () Bool)

(declare-fun e!284257 () Bool)

(assert (=> b!483062 (= e!284257 (validKeyInArray!0 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!31003 () Bool)

(assert (=> bm!31003 (= call!31009 call!31008)))

(declare-fun b!483063 () Bool)

(declare-fun e!284258 () Bool)

(assert (=> b!483063 (= e!284260 e!284258)))

(declare-fun res!287903 () Bool)

(assert (=> b!483063 (= res!287903 call!31005)))

(assert (=> b!483063 (=> (not res!287903) (not e!284258))))

(declare-fun b!483050 () Bool)

(assert (=> b!483050 (= e!284258 (= (apply!345 lt!218871 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1458))))

(declare-fun d!76679 () Bool)

(assert (=> d!76679 e!284254))

(declare-fun res!287900 () Bool)

(assert (=> d!76679 (=> (not res!287900) (not e!284254))))

(assert (=> d!76679 (= res!287900 (or (bvsge #b00000000000000000000000000000000 (size!15449 _keys!1874)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))))

(declare-fun lt!218864 () ListLongMap!8115)

(assert (=> d!76679 (= lt!218871 lt!218864)))

(declare-fun lt!218861 () Unit!14148)

(assert (=> d!76679 (= lt!218861 e!284262)))

(declare-fun c!58017 () Bool)

(assert (=> d!76679 (= c!58017 e!284257)))

(declare-fun res!287901 () Bool)

(assert (=> d!76679 (=> (not res!287901) (not e!284257))))

(assert (=> d!76679 (= res!287901 (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (=> d!76679 (= lt!218864 e!284259)))

(assert (=> d!76679 (= c!58020 (and (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!76679 (validMask!0 mask!2352)))

(assert (=> d!76679 (= (getCurrentListMap!2326 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) lt!218871)))

(declare-fun b!483064 () Bool)

(declare-fun e!284264 () Bool)

(assert (=> b!483064 (= e!284263 e!284264)))

(declare-fun res!287907 () Bool)

(assert (=> b!483064 (= res!287907 call!31007)))

(assert (=> b!483064 (=> (not res!287907) (not e!284264))))

(declare-fun b!483065 () Bool)

(assert (=> b!483065 (= e!284264 (= (apply!345 lt!218871 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1458))))

(declare-fun bm!31004 () Bool)

(assert (=> bm!31004 (= call!31005 (contains!2654 lt!218871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!483066 () Bool)

(declare-fun e!284256 () Bool)

(assert (=> b!483066 (= e!284256 (validKeyInArray!0 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483067 () Bool)

(declare-fun Unit!14151 () Unit!14148)

(assert (=> b!483067 (= e!284262 Unit!14151)))

(declare-fun bm!31005 () Bool)

(assert (=> bm!31005 (= call!31004 (getCurrentListMapNoExtraKeys!2149 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519))))

(declare-fun bm!31006 () Bool)

(assert (=> bm!31006 (= call!31010 call!31006)))

(declare-fun b!483068 () Bool)

(declare-fun get!7310 (ValueCell!6569 V!19553) V!19553)

(declare-fun dynLambda!959 (Int (_ BitVec 64)) V!19553)

(assert (=> b!483068 (= e!284265 (= (apply!345 lt!218871 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)) (get!7310 (select (arr!15089 _values!1516) #b00000000000000000000000000000000) (dynLambda!959 defaultEntry!1519 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!483068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15448 _values!1516)))))

(assert (=> b!483068 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(declare-fun bm!31007 () Bool)

(assert (=> bm!31007 (= call!31008 call!31004)))

(declare-fun b!483069 () Bool)

(declare-fun res!287905 () Bool)

(assert (=> b!483069 (=> (not res!287905) (not e!284254))))

(assert (=> b!483069 (= res!287905 e!284253)))

(declare-fun res!287902 () Bool)

(assert (=> b!483069 (=> res!287902 e!284253)))

(assert (=> b!483069 (= res!287902 (not e!284256))))

(declare-fun res!287906 () Bool)

(assert (=> b!483069 (=> (not res!287906) (not e!284256))))

(assert (=> b!483069 (= res!287906 (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (= (and d!76679 c!58020) b!483054))

(assert (= (and d!76679 (not c!58020)) b!483058))

(assert (= (and b!483058 c!58016) b!483051))

(assert (= (and b!483058 (not c!58016)) b!483059))

(assert (= (and b!483059 c!58018) b!483060))

(assert (= (and b!483059 (not c!58018)) b!483049))

(assert (= (or b!483060 b!483049) bm!31003))

(assert (= (or b!483051 bm!31003) bm!31007))

(assert (= (or b!483051 b!483060) bm!31006))

(assert (= (or b!483054 bm!31007) bm!31005))

(assert (= (or b!483054 bm!31006) bm!31002))

(assert (= (and d!76679 res!287901) b!483062))

(assert (= (and d!76679 c!58017) b!483057))

(assert (= (and d!76679 (not c!58017)) b!483067))

(assert (= (and d!76679 res!287900) b!483069))

(assert (= (and b!483069 res!287906) b!483066))

(assert (= (and b!483069 (not res!287902)) b!483055))

(assert (= (and b!483055 res!287904) b!483068))

(assert (= (and b!483069 res!287905) b!483061))

(assert (= (and b!483061 c!58021) b!483063))

(assert (= (and b!483061 (not c!58021)) b!483053))

(assert (= (and b!483063 res!287903) b!483050))

(assert (= (or b!483063 b!483053) bm!31004))

(assert (= (and b!483061 res!287908) b!483056))

(assert (= (and b!483056 c!58019) b!483064))

(assert (= (and b!483056 (not c!58019)) b!483052))

(assert (= (and b!483064 res!287907) b!483065))

(assert (= (or b!483064 b!483052) bm!31001))

(declare-fun b_lambda!10797 () Bool)

(assert (=> (not b_lambda!10797) (not b!483068)))

(declare-fun t!15491 () Bool)

(declare-fun tb!4163 () Bool)

(assert (=> (and start!43600 (= defaultEntry!1519 defaultEntry!1519) t!15491) tb!4163))

(declare-fun result!7773 () Bool)

(assert (=> tb!4163 (= result!7773 tp_is_empty!13861)))

(assert (=> b!483068 t!15491))

(declare-fun b_and!21093 () Bool)

(assert (= b_and!21087 (and (=> t!15491 result!7773) b_and!21093)))

(assert (=> d!76679 m!463489))

(declare-fun m!463585 () Bool)

(assert (=> b!483065 m!463585))

(declare-fun m!463587 () Bool)

(assert (=> b!483068 m!463587))

(declare-fun m!463589 () Bool)

(assert (=> b!483068 m!463589))

(declare-fun m!463591 () Bool)

(assert (=> b!483068 m!463591))

(assert (=> b!483068 m!463565))

(assert (=> b!483068 m!463565))

(declare-fun m!463593 () Bool)

(assert (=> b!483068 m!463593))

(assert (=> b!483068 m!463587))

(assert (=> b!483068 m!463589))

(assert (=> b!483066 m!463565))

(assert (=> b!483066 m!463565))

(assert (=> b!483066 m!463575))

(assert (=> b!483055 m!463565))

(assert (=> b!483055 m!463565))

(declare-fun m!463595 () Bool)

(assert (=> b!483055 m!463595))

(declare-fun m!463597 () Bool)

(assert (=> b!483057 m!463597))

(declare-fun m!463599 () Bool)

(assert (=> b!483057 m!463599))

(declare-fun m!463601 () Bool)

(assert (=> b!483057 m!463601))

(declare-fun m!463603 () Bool)

(assert (=> b!483057 m!463603))

(declare-fun m!463605 () Bool)

(assert (=> b!483057 m!463605))

(declare-fun m!463607 () Bool)

(assert (=> b!483057 m!463607))

(declare-fun m!463609 () Bool)

(assert (=> b!483057 m!463609))

(assert (=> b!483057 m!463597))

(declare-fun m!463611 () Bool)

(assert (=> b!483057 m!463611))

(declare-fun m!463613 () Bool)

(assert (=> b!483057 m!463613))

(declare-fun m!463615 () Bool)

(assert (=> b!483057 m!463615))

(declare-fun m!463617 () Bool)

(assert (=> b!483057 m!463617))

(declare-fun m!463619 () Bool)

(assert (=> b!483057 m!463619))

(assert (=> b!483057 m!463609))

(declare-fun m!463621 () Bool)

(assert (=> b!483057 m!463621))

(assert (=> b!483057 m!463601))

(declare-fun m!463623 () Bool)

(assert (=> b!483057 m!463623))

(assert (=> b!483057 m!463565))

(assert (=> b!483057 m!463605))

(declare-fun m!463625 () Bool)

(assert (=> b!483057 m!463625))

(declare-fun m!463627 () Bool)

(assert (=> b!483057 m!463627))

(declare-fun m!463629 () Bool)

(assert (=> b!483054 m!463629))

(assert (=> bm!31005 m!463599))

(declare-fun m!463631 () Bool)

(assert (=> bm!31002 m!463631))

(declare-fun m!463633 () Bool)

(assert (=> b!483050 m!463633))

(declare-fun m!463635 () Bool)

(assert (=> bm!31004 m!463635))

(assert (=> b!483062 m!463565))

(assert (=> b!483062 m!463565))

(assert (=> b!483062 m!463575))

(declare-fun m!463637 () Bool)

(assert (=> bm!31001 m!463637))

(assert (=> b!482905 d!76679))

(declare-fun b!483072 () Bool)

(declare-fun e!284266 () Bool)

(declare-fun e!284268 () Bool)

(assert (=> b!483072 (= e!284266 e!284268)))

(declare-fun lt!218880 () (_ BitVec 64))

(assert (=> b!483072 (= lt!218880 (select (arr!15090 _keys!1874) lt!218767))))

(declare-fun lt!218881 () Unit!14148)

(assert (=> b!483072 (= lt!218881 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1874 lt!218880 lt!218767))))

(assert (=> b!483072 (arrayContainsKey!0 _keys!1874 lt!218880 #b00000000000000000000000000000000)))

(declare-fun lt!218879 () Unit!14148)

(assert (=> b!483072 (= lt!218879 lt!218881)))

(declare-fun res!287910 () Bool)

(assert (=> b!483072 (= res!287910 (= (seekEntryOrOpen!0 (select (arr!15090 _keys!1874) lt!218767) _keys!1874 mask!2352) (Found!3569 lt!218767)))))

(assert (=> b!483072 (=> (not res!287910) (not e!284268))))

(declare-fun d!76681 () Bool)

(declare-fun res!287909 () Bool)

(declare-fun e!284267 () Bool)

(assert (=> d!76681 (=> res!287909 e!284267)))

(assert (=> d!76681 (= res!287909 (bvsge lt!218767 (size!15449 _keys!1874)))))

(assert (=> d!76681 (= (arrayForallSeekEntryOrOpenFound!0 lt!218767 _keys!1874 mask!2352) e!284267)))

(declare-fun b!483073 () Bool)

(declare-fun call!31011 () Bool)

(assert (=> b!483073 (= e!284268 call!31011)))

(declare-fun bm!31008 () Bool)

(assert (=> bm!31008 (= call!31011 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!218767 #b00000000000000000000000000000001) _keys!1874 mask!2352))))

(declare-fun b!483074 () Bool)

(assert (=> b!483074 (= e!284266 call!31011)))

(declare-fun b!483075 () Bool)

(assert (=> b!483075 (= e!284267 e!284266)))

(declare-fun c!58022 () Bool)

(assert (=> b!483075 (= c!58022 (validKeyInArray!0 (select (arr!15090 _keys!1874) lt!218767)))))

(assert (= (and d!76681 (not res!287909)) b!483075))

(assert (= (and b!483075 c!58022) b!483072))

(assert (= (and b!483075 (not c!58022)) b!483074))

(assert (= (and b!483072 res!287910) b!483073))

(assert (= (or b!483073 b!483074) bm!31008))

(declare-fun m!463639 () Bool)

(assert (=> b!483072 m!463639))

(declare-fun m!463641 () Bool)

(assert (=> b!483072 m!463641))

(declare-fun m!463643 () Bool)

(assert (=> b!483072 m!463643))

(assert (=> b!483072 m!463639))

(declare-fun m!463645 () Bool)

(assert (=> b!483072 m!463645))

(declare-fun m!463647 () Bool)

(assert (=> bm!31008 m!463647))

(assert (=> b!483075 m!463639))

(assert (=> b!483075 m!463639))

(declare-fun m!463649 () Bool)

(assert (=> b!483075 m!463649))

(assert (=> b!482897 d!76681))

(declare-fun b!483088 () Bool)

(declare-fun e!284277 () SeekEntryResult!3569)

(declare-fun lt!218889 () SeekEntryResult!3569)

(assert (=> b!483088 (= e!284277 (MissingZero!3569 (index!16457 lt!218889)))))

(declare-fun b!483089 () Bool)

(declare-fun c!58030 () Bool)

(declare-fun lt!218890 () (_ BitVec 64))

(assert (=> b!483089 (= c!58030 (= lt!218890 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!284275 () SeekEntryResult!3569)

(assert (=> b!483089 (= e!284275 e!284277)))

(declare-fun b!483090 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31379 (_ BitVec 32)) SeekEntryResult!3569)

(assert (=> b!483090 (= e!284277 (seekKeyOrZeroReturnVacant!0 (x!45368 lt!218889) (index!16457 lt!218889) (index!16457 lt!218889) k0!1332 _keys!1874 mask!2352))))

(declare-fun d!76683 () Bool)

(declare-fun lt!218888 () SeekEntryResult!3569)

(assert (=> d!76683 (and (or ((_ is Undefined!3569) lt!218888) (not ((_ is Found!3569) lt!218888)) (and (bvsge (index!16456 lt!218888) #b00000000000000000000000000000000) (bvslt (index!16456 lt!218888) (size!15449 _keys!1874)))) (or ((_ is Undefined!3569) lt!218888) ((_ is Found!3569) lt!218888) (not ((_ is MissingZero!3569) lt!218888)) (and (bvsge (index!16455 lt!218888) #b00000000000000000000000000000000) (bvslt (index!16455 lt!218888) (size!15449 _keys!1874)))) (or ((_ is Undefined!3569) lt!218888) ((_ is Found!3569) lt!218888) ((_ is MissingZero!3569) lt!218888) (not ((_ is MissingVacant!3569) lt!218888)) (and (bvsge (index!16458 lt!218888) #b00000000000000000000000000000000) (bvslt (index!16458 lt!218888) (size!15449 _keys!1874)))) (or ((_ is Undefined!3569) lt!218888) (ite ((_ is Found!3569) lt!218888) (= (select (arr!15090 _keys!1874) (index!16456 lt!218888)) k0!1332) (ite ((_ is MissingZero!3569) lt!218888) (= (select (arr!15090 _keys!1874) (index!16455 lt!218888)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3569) lt!218888) (= (select (arr!15090 _keys!1874) (index!16458 lt!218888)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!284276 () SeekEntryResult!3569)

(assert (=> d!76683 (= lt!218888 e!284276)))

(declare-fun c!58029 () Bool)

(assert (=> d!76683 (= c!58029 (and ((_ is Intermediate!3569) lt!218889) (undefined!4381 lt!218889)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31379 (_ BitVec 32)) SeekEntryResult!3569)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!76683 (= lt!218889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1332 mask!2352) k0!1332 _keys!1874 mask!2352))))

(assert (=> d!76683 (validMask!0 mask!2352)))

(assert (=> d!76683 (= (seekEntryOrOpen!0 k0!1332 _keys!1874 mask!2352) lt!218888)))

(declare-fun b!483091 () Bool)

(assert (=> b!483091 (= e!284276 e!284275)))

(assert (=> b!483091 (= lt!218890 (select (arr!15090 _keys!1874) (index!16457 lt!218889)))))

(declare-fun c!58031 () Bool)

(assert (=> b!483091 (= c!58031 (= lt!218890 k0!1332))))

(declare-fun b!483092 () Bool)

(assert (=> b!483092 (= e!284275 (Found!3569 (index!16457 lt!218889)))))

(declare-fun b!483093 () Bool)

(assert (=> b!483093 (= e!284276 Undefined!3569)))

(assert (= (and d!76683 c!58029) b!483093))

(assert (= (and d!76683 (not c!58029)) b!483091))

(assert (= (and b!483091 c!58031) b!483092))

(assert (= (and b!483091 (not c!58031)) b!483089))

(assert (= (and b!483089 c!58030) b!483088))

(assert (= (and b!483089 (not c!58030)) b!483090))

(declare-fun m!463651 () Bool)

(assert (=> b!483090 m!463651))

(declare-fun m!463653 () Bool)

(assert (=> d!76683 m!463653))

(declare-fun m!463655 () Bool)

(assert (=> d!76683 m!463655))

(declare-fun m!463657 () Bool)

(assert (=> d!76683 m!463657))

(declare-fun m!463659 () Bool)

(assert (=> d!76683 m!463659))

(declare-fun m!463661 () Bool)

(assert (=> d!76683 m!463661))

(assert (=> d!76683 m!463489))

(assert (=> d!76683 m!463653))

(declare-fun m!463663 () Bool)

(assert (=> b!483091 m!463663))

(assert (=> b!482897 d!76683))

(declare-fun d!76685 () Bool)

(assert (=> d!76685 (arrayForallSeekEntryOrOpenFound!0 lt!218767 _keys!1874 mask!2352)))

(declare-fun lt!218893 () Unit!14148)

(declare-fun choose!38 (array!31379 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14148)

(assert (=> d!76685 (= lt!218893 (choose!38 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218767))))

(assert (=> d!76685 (validMask!0 mask!2352)))

(assert (=> d!76685 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218767) lt!218893)))

(declare-fun bs!15335 () Bool)

(assert (= bs!15335 d!76685))

(assert (=> bs!15335 m!463485))

(declare-fun m!463665 () Bool)

(assert (=> bs!15335 m!463665))

(assert (=> bs!15335 m!463489))

(assert (=> b!482897 d!76685))

(declare-fun d!76687 () Bool)

(declare-fun e!284280 () Bool)

(assert (=> d!76687 e!284280))

(declare-fun c!58034 () Bool)

(assert (=> d!76687 (= c!58034 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218896 () Unit!14148)

(declare-fun choose!1388 (array!31379 array!31377 (_ BitVec 32) (_ BitVec 32) V!19553 V!19553 (_ BitVec 64) Int) Unit!14148)

(assert (=> d!76687 (= lt!218896 (choose!1388 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (=> d!76687 (validMask!0 mask!2352)))

(assert (=> d!76687 (= (lemmaKeyInListMapIsInArray!159 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519) lt!218896)))

(declare-fun b!483098 () Bool)

(assert (=> b!483098 (= e!284280 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!483099 () Bool)

(assert (=> b!483099 (= e!284280 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!76687 c!58034) b!483098))

(assert (= (and d!76687 (not c!58034)) b!483099))

(declare-fun m!463667 () Bool)

(assert (=> d!76687 m!463667))

(assert (=> d!76687 m!463489))

(assert (=> b!483098 m!463469))

(assert (=> b!482897 d!76687))

(declare-fun d!76689 () Bool)

(declare-fun lt!218899 () (_ BitVec 32))

(assert (=> d!76689 (and (or (bvslt lt!218899 #b00000000000000000000000000000000) (bvsge lt!218899 (size!15449 _keys!1874)) (and (bvsge lt!218899 #b00000000000000000000000000000000) (bvslt lt!218899 (size!15449 _keys!1874)))) (bvsge lt!218899 #b00000000000000000000000000000000) (bvslt lt!218899 (size!15449 _keys!1874)) (= (select (arr!15090 _keys!1874) lt!218899) k0!1332))))

(declare-fun e!284283 () (_ BitVec 32))

(assert (=> d!76689 (= lt!218899 e!284283)))

(declare-fun c!58037 () Bool)

(assert (=> d!76689 (= c!58037 (= (select (arr!15090 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76689 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15449 _keys!1874)) (bvslt (size!15449 _keys!1874) #b01111111111111111111111111111111))))

(assert (=> d!76689 (= (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) lt!218899)))

(declare-fun b!483104 () Bool)

(assert (=> b!483104 (= e!284283 #b00000000000000000000000000000000)))

(declare-fun b!483105 () Bool)

(assert (=> b!483105 (= e!284283 (arrayScanForKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76689 c!58037) b!483104))

(assert (= (and d!76689 (not c!58037)) b!483105))

(declare-fun m!463669 () Bool)

(assert (=> d!76689 m!463669))

(assert (=> d!76689 m!463565))

(declare-fun m!463671 () Bool)

(assert (=> b!483105 m!463671))

(assert (=> b!482897 d!76689))

(declare-fun d!76691 () Bool)

(assert (=> d!76691 (= (validMask!0 mask!2352) (and (or (= mask!2352 #b00000000000000000000000000000111) (= mask!2352 #b00000000000000000000000000001111) (= mask!2352 #b00000000000000000000000000011111) (= mask!2352 #b00000000000000000000000000111111) (= mask!2352 #b00000000000000000000000001111111) (= mask!2352 #b00000000000000000000000011111111) (= mask!2352 #b00000000000000000000000111111111) (= mask!2352 #b00000000000000000000001111111111) (= mask!2352 #b00000000000000000000011111111111) (= mask!2352 #b00000000000000000000111111111111) (= mask!2352 #b00000000000000000001111111111111) (= mask!2352 #b00000000000000000011111111111111) (= mask!2352 #b00000000000000000111111111111111) (= mask!2352 #b00000000000000001111111111111111) (= mask!2352 #b00000000000000011111111111111111) (= mask!2352 #b00000000000000111111111111111111) (= mask!2352 #b00000000000001111111111111111111) (= mask!2352 #b00000000000011111111111111111111) (= mask!2352 #b00000000000111111111111111111111) (= mask!2352 #b00000000001111111111111111111111) (= mask!2352 #b00000000011111111111111111111111) (= mask!2352 #b00000000111111111111111111111111) (= mask!2352 #b00000001111111111111111111111111) (= mask!2352 #b00000011111111111111111111111111) (= mask!2352 #b00000111111111111111111111111111) (= mask!2352 #b00001111111111111111111111111111) (= mask!2352 #b00011111111111111111111111111111) (= mask!2352 #b00111111111111111111111111111111)) (bvsle mask!2352 #b00111111111111111111111111111111)))))

(assert (=> start!43600 d!76691))

(declare-fun d!76693 () Bool)

(assert (=> d!76693 (= (array_inv!10974 _values!1516) (bvsge (size!15448 _values!1516) #b00000000000000000000000000000000))))

(assert (=> start!43600 d!76693))

(declare-fun d!76695 () Bool)

(assert (=> d!76695 (= (array_inv!10975 _keys!1874) (bvsge (size!15449 _keys!1874) #b00000000000000000000000000000000))))

(assert (=> start!43600 d!76695))

(declare-fun d!76697 () Bool)

(assert (=> d!76697 (= (validKeyInArray!0 k0!1332) (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!482895 d!76697))

(declare-fun b!483116 () Bool)

(declare-fun e!284294 () Bool)

(declare-fun e!284293 () Bool)

(assert (=> b!483116 (= e!284294 e!284293)))

(declare-fun res!287918 () Bool)

(assert (=> b!483116 (=> (not res!287918) (not e!284293))))

(declare-fun e!284295 () Bool)

(assert (=> b!483116 (= res!287918 (not e!284295))))

(declare-fun res!287919 () Bool)

(assert (=> b!483116 (=> (not res!287919) (not e!284295))))

(assert (=> b!483116 (= res!287919 (validKeyInArray!0 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483117 () Bool)

(declare-fun e!284292 () Bool)

(assert (=> b!483117 (= e!284293 e!284292)))

(declare-fun c!58040 () Bool)

(assert (=> b!483117 (= c!58040 (validKeyInArray!0 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun b!483118 () Bool)

(declare-fun contains!2656 (List!9276 (_ BitVec 64)) Bool)

(assert (=> b!483118 (= e!284295 (contains!2656 Nil!9273 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000)))))

(declare-fun bm!31011 () Bool)

(declare-fun call!31014 () Bool)

(assert (=> bm!31011 (= call!31014 (arrayNoDuplicates!0 _keys!1874 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!58040 (Cons!9272 (select (arr!15090 _keys!1874) #b00000000000000000000000000000000) Nil!9273) Nil!9273)))))

(declare-fun d!76699 () Bool)

(declare-fun res!287917 () Bool)

(assert (=> d!76699 (=> res!287917 e!284294)))

(assert (=> d!76699 (= res!287917 (bvsge #b00000000000000000000000000000000 (size!15449 _keys!1874)))))

(assert (=> d!76699 (= (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9273) e!284294)))

(declare-fun b!483119 () Bool)

(assert (=> b!483119 (= e!284292 call!31014)))

(declare-fun b!483120 () Bool)

(assert (=> b!483120 (= e!284292 call!31014)))

(assert (= (and d!76699 (not res!287917)) b!483116))

(assert (= (and b!483116 res!287919) b!483118))

(assert (= (and b!483116 res!287918) b!483117))

(assert (= (and b!483117 c!58040) b!483120))

(assert (= (and b!483117 (not c!58040)) b!483119))

(assert (= (or b!483120 b!483119) bm!31011))

(assert (=> b!483116 m!463565))

(assert (=> b!483116 m!463565))

(assert (=> b!483116 m!463575))

(assert (=> b!483117 m!463565))

(assert (=> b!483117 m!463565))

(assert (=> b!483117 m!463575))

(assert (=> b!483118 m!463565))

(assert (=> b!483118 m!463565))

(declare-fun m!463673 () Bool)

(assert (=> b!483118 m!463673))

(assert (=> bm!31011 m!463565))

(declare-fun m!463675 () Bool)

(assert (=> bm!31011 m!463675))

(assert (=> b!482896 d!76699))

(declare-fun d!76701 () Bool)

(assert (=> d!76701 (= (inRange!0 (index!16456 lt!218764) mask!2352) (and (bvsge (index!16456 lt!218764) #b00000000000000000000000000000000) (bvslt (index!16456 lt!218764) (bvadd mask!2352 #b00000000000000000000000000000001))))))

(assert (=> b!482900 d!76701))

(declare-fun d!76703 () Bool)

(declare-fun res!287924 () Bool)

(declare-fun e!284300 () Bool)

(assert (=> d!76703 (=> res!287924 e!284300)))

(assert (=> d!76703 (= res!287924 (= (select (arr!15090 _keys!1874) #b00000000000000000000000000000000) k0!1332))))

(assert (=> d!76703 (= (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000) e!284300)))

(declare-fun b!483125 () Bool)

(declare-fun e!284301 () Bool)

(assert (=> b!483125 (= e!284300 e!284301)))

(declare-fun res!287925 () Bool)

(assert (=> b!483125 (=> (not res!287925) (not e!284301))))

(assert (=> b!483125 (= res!287925 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15449 _keys!1874)))))

(declare-fun b!483126 () Bool)

(assert (=> b!483126 (= e!284301 (arrayContainsKey!0 _keys!1874 k0!1332 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!76703 (not res!287924)) b!483125))

(assert (= (and b!483125 res!287925) b!483126))

(assert (=> d!76703 m!463565))

(declare-fun m!463677 () Bool)

(assert (=> b!483126 m!463677))

(assert (=> b!482899 d!76703))

(declare-fun condMapEmpty!22516 () Bool)

(declare-fun mapDefault!22516 () ValueCell!6569)

(assert (=> mapNonEmpty!22507 (= condMapEmpty!22516 (= mapRest!22507 ((as const (Array (_ BitVec 32) ValueCell!6569)) mapDefault!22516)))))

(declare-fun e!284307 () Bool)

(declare-fun mapRes!22516 () Bool)

(assert (=> mapNonEmpty!22507 (= tp!43336 (and e!284307 mapRes!22516))))

(declare-fun mapIsEmpty!22516 () Bool)

(assert (=> mapIsEmpty!22516 mapRes!22516))

(declare-fun mapNonEmpty!22516 () Bool)

(declare-fun tp!43351 () Bool)

(declare-fun e!284306 () Bool)

(assert (=> mapNonEmpty!22516 (= mapRes!22516 (and tp!43351 e!284306))))

(declare-fun mapRest!22516 () (Array (_ BitVec 32) ValueCell!6569))

(declare-fun mapKey!22516 () (_ BitVec 32))

(declare-fun mapValue!22516 () ValueCell!6569)

(assert (=> mapNonEmpty!22516 (= mapRest!22507 (store mapRest!22516 mapKey!22516 mapValue!22516))))

(declare-fun b!483133 () Bool)

(assert (=> b!483133 (= e!284306 tp_is_empty!13861)))

(declare-fun b!483134 () Bool)

(assert (=> b!483134 (= e!284307 tp_is_empty!13861)))

(assert (= (and mapNonEmpty!22507 condMapEmpty!22516) mapIsEmpty!22516))

(assert (= (and mapNonEmpty!22507 (not condMapEmpty!22516)) mapNonEmpty!22516))

(assert (= (and mapNonEmpty!22516 ((_ is ValueCellFull!6569) mapValue!22516)) b!483133))

(assert (= (and mapNonEmpty!22507 ((_ is ValueCellFull!6569) mapDefault!22516)) b!483134))

(declare-fun m!463679 () Bool)

(assert (=> mapNonEmpty!22516 m!463679))

(declare-fun b_lambda!10799 () Bool)

(assert (= b_lambda!10797 (or (and start!43600 b_free!12349) b_lambda!10799)))

(check-sat (not bm!31005) b_and!21093 (not b_lambda!10799) (not b!483065) (not d!76677) (not b!483075) (not b!483098) (not bm!31004) (not d!76685) (not b!482997) (not b!483116) (not b!483050) (not b!483055) (not b!482994) (not bm!31001) (not b!483068) (not b!483105) (not b!483072) (not b!483054) (not d!76683) (not bm!30986) (not d!76679) (not b!483117) (not b!483066) (not bm!31011) (not b!483006) (not b!483004) (not d!76687) (not mapNonEmpty!22516) (not b!483090) (not b!483118) (not b_next!12349) tp_is_empty!13861 (not b!483062) (not bm!31008) (not b!483057) (not b!483126) (not bm!31002))
(check-sat b_and!21093 (not b_next!12349))
