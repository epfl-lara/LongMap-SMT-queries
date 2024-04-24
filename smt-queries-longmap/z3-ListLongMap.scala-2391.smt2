; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37816 () Bool)

(assert start!37816)

(declare-fun b_free!8911 () Bool)

(declare-fun b_next!8911 () Bool)

(assert (=> start!37816 (= b_free!8911 (not b_next!8911))))

(declare-fun tp!31487 () Bool)

(declare-fun b_and!16179 () Bool)

(assert (=> start!37816 (= tp!31487 b_and!16179)))

(declare-fun b!388634 () Bool)

(declare-fun res!222274 () Bool)

(declare-fun e!235478 () Bool)

(assert (=> b!388634 (=> (not res!222274) (not e!235478))))

(declare-datatypes ((array!23044 0))(
  ( (array!23045 (arr!10989 (Array (_ BitVec 32) (_ BitVec 64))) (size!11341 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23044)

(declare-datatypes ((List!6214 0))(
  ( (Nil!6211) (Cons!6210 (h!7066 (_ BitVec 64)) (t!11358 List!6214)) )
))
(declare-fun arrayNoDuplicates!0 (array!23044 (_ BitVec 32) List!6214) Bool)

(assert (=> b!388634 (= res!222274 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6211))))

(declare-fun b!388635 () Bool)

(declare-fun res!222276 () Bool)

(assert (=> b!388635 (=> (not res!222276) (not e!235478))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388635 (= res!222276 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15942 () Bool)

(declare-fun mapRes!15942 () Bool)

(declare-fun tp!31488 () Bool)

(declare-fun e!235480 () Bool)

(assert (=> mapNonEmpty!15942 (= mapRes!15942 (and tp!31488 e!235480))))

(declare-datatypes ((V!13883 0))(
  ( (V!13884 (val!4836 Int)) )
))
(declare-datatypes ((ValueCell!4448 0))(
  ( (ValueCellFull!4448 (v!7038 V!13883)) (EmptyCell!4448) )
))
(declare-fun mapValue!15942 () ValueCell!4448)

(declare-fun mapKey!15942 () (_ BitVec 32))

(declare-datatypes ((array!23046 0))(
  ( (array!23047 (arr!10990 (Array (_ BitVec 32) ValueCell!4448)) (size!11342 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23046)

(declare-fun mapRest!15942 () (Array (_ BitVec 32) ValueCell!4448))

(assert (=> mapNonEmpty!15942 (= (arr!10990 _values!506) (store mapRest!15942 mapKey!15942 mapValue!15942))))

(declare-fun b!388636 () Bool)

(declare-fun res!222269 () Bool)

(assert (=> b!388636 (=> (not res!222269) (not e!235478))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388636 (= res!222269 (or (= (select (arr!10989 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10989 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6362 0))(
  ( (tuple2!6363 (_1!3192 (_ BitVec 64)) (_2!3192 V!13883)) )
))
(declare-fun lt!182567 () tuple2!6362)

(declare-datatypes ((List!6215 0))(
  ( (Nil!6212) (Cons!6211 (h!7067 tuple2!6362) (t!11359 List!6215)) )
))
(declare-datatypes ((ListLongMap!5277 0))(
  ( (ListLongMap!5278 (toList!2654 List!6215)) )
))
(declare-fun lt!182560 () ListLongMap!5277)

(declare-fun b!388637 () Bool)

(declare-fun lt!182565 () tuple2!6362)

(declare-fun lt!182566 () ListLongMap!5277)

(declare-fun e!235476 () Bool)

(declare-fun +!1008 (ListLongMap!5277 tuple2!6362) ListLongMap!5277)

(assert (=> b!388637 (= e!235476 (= lt!182566 (+!1008 (+!1008 lt!182560 lt!182567) lt!182565)))))

(declare-fun lt!182558 () ListLongMap!5277)

(declare-fun lt!182562 () ListLongMap!5277)

(assert (=> b!388637 (= lt!182558 (+!1008 (+!1008 lt!182562 lt!182567) lt!182565))))

(declare-fun minValue!472 () V!13883)

(assert (=> b!388637 (= lt!182565 (tuple2!6363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!13883)

(assert (=> b!388637 (= lt!182567 (tuple2!6363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!388638 () Bool)

(declare-fun tp_is_empty!9583 () Bool)

(assert (=> b!388638 (= e!235480 tp_is_empty!9583)))

(declare-fun b!388639 () Bool)

(declare-fun e!235481 () Bool)

(assert (=> b!388639 (= e!235481 tp_is_empty!9583)))

(declare-fun b!388640 () Bool)

(declare-fun res!222266 () Bool)

(assert (=> b!388640 (=> (not res!222266) (not e!235478))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!388640 (= res!222266 (and (= (size!11342 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11341 _keys!658) (size!11342 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!388641 () Bool)

(declare-fun res!222275 () Bool)

(declare-fun e!235477 () Bool)

(assert (=> b!388641 (=> (not res!222275) (not e!235477))))

(declare-fun lt!182563 () array!23044)

(assert (=> b!388641 (= res!222275 (arrayNoDuplicates!0 lt!182563 #b00000000000000000000000000000000 Nil!6211))))

(declare-fun b!388642 () Bool)

(declare-fun e!235475 () Bool)

(assert (=> b!388642 (= e!235475 (and e!235481 mapRes!15942))))

(declare-fun condMapEmpty!15942 () Bool)

(declare-fun mapDefault!15942 () ValueCell!4448)

(assert (=> b!388642 (= condMapEmpty!15942 (= (arr!10990 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4448)) mapDefault!15942)))))

(declare-fun res!222272 () Bool)

(assert (=> start!37816 (=> (not res!222272) (not e!235478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37816 (= res!222272 (validMask!0 mask!970))))

(assert (=> start!37816 e!235478))

(declare-fun array_inv!8120 (array!23046) Bool)

(assert (=> start!37816 (and (array_inv!8120 _values!506) e!235475)))

(assert (=> start!37816 tp!31487))

(assert (=> start!37816 true))

(assert (=> start!37816 tp_is_empty!9583))

(declare-fun array_inv!8121 (array!23044) Bool)

(assert (=> start!37816 (array_inv!8121 _keys!658)))

(declare-fun b!388643 () Bool)

(assert (=> b!388643 (= e!235477 (not e!235476))))

(declare-fun res!222273 () Bool)

(assert (=> b!388643 (=> res!222273 e!235476)))

(assert (=> b!388643 (= res!222273 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2040 (array!23044 array!23046 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) Int) ListLongMap!5277)

(assert (=> b!388643 (= lt!182566 (getCurrentListMap!2040 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182564 () array!23046)

(assert (=> b!388643 (= lt!182558 (getCurrentListMap!2040 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182561 () ListLongMap!5277)

(assert (=> b!388643 (and (= lt!182562 lt!182561) (= lt!182561 lt!182562))))

(declare-fun v!373 () V!13883)

(assert (=> b!388643 (= lt!182561 (+!1008 lt!182560 (tuple2!6363 k0!778 v!373)))))

(declare-datatypes ((Unit!11885 0))(
  ( (Unit!11886) )
))
(declare-fun lt!182559 () Unit!11885)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 (array!23044 array!23046 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) (_ BitVec 64) V!13883 (_ BitVec 32) Int) Unit!11885)

(assert (=> b!388643 (= lt!182559 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!929 (array!23044 array!23046 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) Int) ListLongMap!5277)

(assert (=> b!388643 (= lt!182562 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388643 (= lt!182564 (array!23047 (store (arr!10990 _values!506) i!548 (ValueCellFull!4448 v!373)) (size!11342 _values!506)))))

(assert (=> b!388643 (= lt!182560 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15942 () Bool)

(assert (=> mapIsEmpty!15942 mapRes!15942))

(declare-fun b!388644 () Bool)

(declare-fun res!222267 () Bool)

(assert (=> b!388644 (=> (not res!222267) (not e!235478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388644 (= res!222267 (validKeyInArray!0 k0!778))))

(declare-fun b!388645 () Bool)

(declare-fun res!222270 () Bool)

(assert (=> b!388645 (=> (not res!222270) (not e!235478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23044 (_ BitVec 32)) Bool)

(assert (=> b!388645 (= res!222270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388646 () Bool)

(declare-fun res!222271 () Bool)

(assert (=> b!388646 (=> (not res!222271) (not e!235478))))

(assert (=> b!388646 (= res!222271 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11341 _keys!658))))))

(declare-fun b!388647 () Bool)

(assert (=> b!388647 (= e!235478 e!235477)))

(declare-fun res!222268 () Bool)

(assert (=> b!388647 (=> (not res!222268) (not e!235477))))

(assert (=> b!388647 (= res!222268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182563 mask!970))))

(assert (=> b!388647 (= lt!182563 (array!23045 (store (arr!10989 _keys!658) i!548 k0!778) (size!11341 _keys!658)))))

(assert (= (and start!37816 res!222272) b!388640))

(assert (= (and b!388640 res!222266) b!388645))

(assert (= (and b!388645 res!222270) b!388634))

(assert (= (and b!388634 res!222274) b!388646))

(assert (= (and b!388646 res!222271) b!388644))

(assert (= (and b!388644 res!222267) b!388636))

(assert (= (and b!388636 res!222269) b!388635))

(assert (= (and b!388635 res!222276) b!388647))

(assert (= (and b!388647 res!222268) b!388641))

(assert (= (and b!388641 res!222275) b!388643))

(assert (= (and b!388643 (not res!222273)) b!388637))

(assert (= (and b!388642 condMapEmpty!15942) mapIsEmpty!15942))

(assert (= (and b!388642 (not condMapEmpty!15942)) mapNonEmpty!15942))

(get-info :version)

(assert (= (and mapNonEmpty!15942 ((_ is ValueCellFull!4448) mapValue!15942)) b!388638))

(assert (= (and b!388642 ((_ is ValueCellFull!4448) mapDefault!15942)) b!388639))

(assert (= start!37816 b!388642))

(declare-fun m!384867 () Bool)

(assert (=> b!388636 m!384867))

(declare-fun m!384869 () Bool)

(assert (=> b!388643 m!384869))

(declare-fun m!384871 () Bool)

(assert (=> b!388643 m!384871))

(declare-fun m!384873 () Bool)

(assert (=> b!388643 m!384873))

(declare-fun m!384875 () Bool)

(assert (=> b!388643 m!384875))

(declare-fun m!384877 () Bool)

(assert (=> b!388643 m!384877))

(declare-fun m!384879 () Bool)

(assert (=> b!388643 m!384879))

(declare-fun m!384881 () Bool)

(assert (=> b!388643 m!384881))

(declare-fun m!384883 () Bool)

(assert (=> b!388634 m!384883))

(declare-fun m!384885 () Bool)

(assert (=> b!388644 m!384885))

(declare-fun m!384887 () Bool)

(assert (=> start!37816 m!384887))

(declare-fun m!384889 () Bool)

(assert (=> start!37816 m!384889))

(declare-fun m!384891 () Bool)

(assert (=> start!37816 m!384891))

(declare-fun m!384893 () Bool)

(assert (=> mapNonEmpty!15942 m!384893))

(declare-fun m!384895 () Bool)

(assert (=> b!388637 m!384895))

(assert (=> b!388637 m!384895))

(declare-fun m!384897 () Bool)

(assert (=> b!388637 m!384897))

(declare-fun m!384899 () Bool)

(assert (=> b!388637 m!384899))

(assert (=> b!388637 m!384899))

(declare-fun m!384901 () Bool)

(assert (=> b!388637 m!384901))

(declare-fun m!384903 () Bool)

(assert (=> b!388645 m!384903))

(declare-fun m!384905 () Bool)

(assert (=> b!388641 m!384905))

(declare-fun m!384907 () Bool)

(assert (=> b!388647 m!384907))

(declare-fun m!384909 () Bool)

(assert (=> b!388647 m!384909))

(declare-fun m!384911 () Bool)

(assert (=> b!388635 m!384911))

(check-sat (not b!388641) tp_is_empty!9583 (not b!388644) (not b!388645) (not b!388635) (not mapNonEmpty!15942) (not b!388647) (not b!388643) b_and!16179 (not b_next!8911) (not start!37816) (not b!388634) (not b!388637))
(check-sat b_and!16179 (not b_next!8911))
(get-model)

(declare-fun b!388742 () Bool)

(declare-fun e!235535 () Bool)

(declare-fun call!27344 () Bool)

(assert (=> b!388742 (= e!235535 call!27344)))

(declare-fun b!388743 () Bool)

(declare-fun e!235533 () Bool)

(declare-fun contains!2422 (List!6214 (_ BitVec 64)) Bool)

(assert (=> b!388743 (= e!235533 (contains!2422 Nil!6211 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(declare-fun b!388744 () Bool)

(declare-fun e!235532 () Bool)

(declare-fun e!235534 () Bool)

(assert (=> b!388744 (= e!235532 e!235534)))

(declare-fun res!222349 () Bool)

(assert (=> b!388744 (=> (not res!222349) (not e!235534))))

(assert (=> b!388744 (= res!222349 (not e!235533))))

(declare-fun res!222350 () Bool)

(assert (=> b!388744 (=> (not res!222350) (not e!235533))))

(assert (=> b!388744 (= res!222350 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(declare-fun b!388745 () Bool)

(assert (=> b!388745 (= e!235535 call!27344)))

(declare-fun bm!27341 () Bool)

(declare-fun c!53955 () Bool)

(assert (=> bm!27341 (= call!27344 (arrayNoDuplicates!0 lt!182563 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53955 (Cons!6210 (select (arr!10989 lt!182563) #b00000000000000000000000000000000) Nil!6211) Nil!6211)))))

(declare-fun d!72865 () Bool)

(declare-fun res!222351 () Bool)

(assert (=> d!72865 (=> res!222351 e!235532)))

(assert (=> d!72865 (= res!222351 (bvsge #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(assert (=> d!72865 (= (arrayNoDuplicates!0 lt!182563 #b00000000000000000000000000000000 Nil!6211) e!235532)))

(declare-fun b!388746 () Bool)

(assert (=> b!388746 (= e!235534 e!235535)))

(assert (=> b!388746 (= c!53955 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(assert (= (and d!72865 (not res!222351)) b!388744))

(assert (= (and b!388744 res!222350) b!388743))

(assert (= (and b!388744 res!222349) b!388746))

(assert (= (and b!388746 c!53955) b!388742))

(assert (= (and b!388746 (not c!53955)) b!388745))

(assert (= (or b!388742 b!388745) bm!27341))

(declare-fun m!385005 () Bool)

(assert (=> b!388743 m!385005))

(assert (=> b!388743 m!385005))

(declare-fun m!385007 () Bool)

(assert (=> b!388743 m!385007))

(assert (=> b!388744 m!385005))

(assert (=> b!388744 m!385005))

(declare-fun m!385009 () Bool)

(assert (=> b!388744 m!385009))

(assert (=> bm!27341 m!385005))

(declare-fun m!385011 () Bool)

(assert (=> bm!27341 m!385011))

(assert (=> b!388746 m!385005))

(assert (=> b!388746 m!385005))

(assert (=> b!388746 m!385009))

(assert (=> b!388641 d!72865))

(declare-fun b!388755 () Bool)

(declare-fun e!235543 () Bool)

(declare-fun e!235544 () Bool)

(assert (=> b!388755 (= e!235543 e!235544)))

(declare-fun lt!182636 () (_ BitVec 64))

(assert (=> b!388755 (= lt!182636 (select (arr!10989 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182635 () Unit!11885)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23044 (_ BitVec 64) (_ BitVec 32)) Unit!11885)

(assert (=> b!388755 (= lt!182635 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182636 #b00000000000000000000000000000000))))

(assert (=> b!388755 (arrayContainsKey!0 _keys!658 lt!182636 #b00000000000000000000000000000000)))

(declare-fun lt!182634 () Unit!11885)

(assert (=> b!388755 (= lt!182634 lt!182635)))

(declare-fun res!222356 () Bool)

(declare-datatypes ((SeekEntryResult!3458 0))(
  ( (MissingZero!3458 (index!16011 (_ BitVec 32))) (Found!3458 (index!16012 (_ BitVec 32))) (Intermediate!3458 (undefined!4270 Bool) (index!16013 (_ BitVec 32)) (x!38147 (_ BitVec 32))) (Undefined!3458) (MissingVacant!3458 (index!16014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23044 (_ BitVec 32)) SeekEntryResult!3458)

(assert (=> b!388755 (= res!222356 (= (seekEntryOrOpen!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3458 #b00000000000000000000000000000000)))))

(assert (=> b!388755 (=> (not res!222356) (not e!235544))))

(declare-fun d!72867 () Bool)

(declare-fun res!222357 () Bool)

(declare-fun e!235542 () Bool)

(assert (=> d!72867 (=> res!222357 e!235542)))

(assert (=> d!72867 (= res!222357 (bvsge #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(assert (=> d!72867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235542)))

(declare-fun b!388756 () Bool)

(declare-fun call!27347 () Bool)

(assert (=> b!388756 (= e!235543 call!27347)))

(declare-fun b!388757 () Bool)

(assert (=> b!388757 (= e!235544 call!27347)))

(declare-fun b!388758 () Bool)

(assert (=> b!388758 (= e!235542 e!235543)))

(declare-fun c!53958 () Bool)

(assert (=> b!388758 (= c!53958 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27344 () Bool)

(assert (=> bm!27344 (= call!27347 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!72867 (not res!222357)) b!388758))

(assert (= (and b!388758 c!53958) b!388755))

(assert (= (and b!388758 (not c!53958)) b!388756))

(assert (= (and b!388755 res!222356) b!388757))

(assert (= (or b!388757 b!388756) bm!27344))

(declare-fun m!385013 () Bool)

(assert (=> b!388755 m!385013))

(declare-fun m!385015 () Bool)

(assert (=> b!388755 m!385015))

(declare-fun m!385017 () Bool)

(assert (=> b!388755 m!385017))

(assert (=> b!388755 m!385013))

(declare-fun m!385019 () Bool)

(assert (=> b!388755 m!385019))

(assert (=> b!388758 m!385013))

(assert (=> b!388758 m!385013))

(declare-fun m!385021 () Bool)

(assert (=> b!388758 m!385021))

(declare-fun m!385023 () Bool)

(assert (=> bm!27344 m!385023))

(assert (=> b!388645 d!72867))

(declare-fun d!72869 () Bool)

(assert (=> d!72869 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388644 d!72869))

(declare-fun d!72871 () Bool)

(declare-fun res!222362 () Bool)

(declare-fun e!235549 () Bool)

(assert (=> d!72871 (=> res!222362 e!235549)))

(assert (=> d!72871 (= res!222362 (= (select (arr!10989 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72871 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235549)))

(declare-fun b!388763 () Bool)

(declare-fun e!235550 () Bool)

(assert (=> b!388763 (= e!235549 e!235550)))

(declare-fun res!222363 () Bool)

(assert (=> b!388763 (=> (not res!222363) (not e!235550))))

(assert (=> b!388763 (= res!222363 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11341 _keys!658)))))

(declare-fun b!388764 () Bool)

(assert (=> b!388764 (= e!235550 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72871 (not res!222362)) b!388763))

(assert (= (and b!388763 res!222363) b!388764))

(assert (=> d!72871 m!385013))

(declare-fun m!385025 () Bool)

(assert (=> b!388764 m!385025))

(assert (=> b!388635 d!72871))

(declare-fun d!72873 () Bool)

(assert (=> d!72873 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37816 d!72873))

(declare-fun d!72875 () Bool)

(assert (=> d!72875 (= (array_inv!8120 _values!506) (bvsge (size!11342 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37816 d!72875))

(declare-fun d!72877 () Bool)

(assert (=> d!72877 (= (array_inv!8121 _keys!658) (bvsge (size!11341 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37816 d!72877))

(declare-fun b!388765 () Bool)

(declare-fun e!235554 () Bool)

(declare-fun call!27348 () Bool)

(assert (=> b!388765 (= e!235554 call!27348)))

(declare-fun b!388766 () Bool)

(declare-fun e!235552 () Bool)

(assert (=> b!388766 (= e!235552 (contains!2422 Nil!6211 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388767 () Bool)

(declare-fun e!235551 () Bool)

(declare-fun e!235553 () Bool)

(assert (=> b!388767 (= e!235551 e!235553)))

(declare-fun res!222364 () Bool)

(assert (=> b!388767 (=> (not res!222364) (not e!235553))))

(assert (=> b!388767 (= res!222364 (not e!235552))))

(declare-fun res!222365 () Bool)

(assert (=> b!388767 (=> (not res!222365) (not e!235552))))

(assert (=> b!388767 (= res!222365 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388768 () Bool)

(assert (=> b!388768 (= e!235554 call!27348)))

(declare-fun bm!27345 () Bool)

(declare-fun c!53959 () Bool)

(assert (=> bm!27345 (= call!27348 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53959 (Cons!6210 (select (arr!10989 _keys!658) #b00000000000000000000000000000000) Nil!6211) Nil!6211)))))

(declare-fun d!72879 () Bool)

(declare-fun res!222366 () Bool)

(assert (=> d!72879 (=> res!222366 e!235551)))

(assert (=> d!72879 (= res!222366 (bvsge #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(assert (=> d!72879 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6211) e!235551)))

(declare-fun b!388769 () Bool)

(assert (=> b!388769 (= e!235553 e!235554)))

(assert (=> b!388769 (= c!53959 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72879 (not res!222366)) b!388767))

(assert (= (and b!388767 res!222365) b!388766))

(assert (= (and b!388767 res!222364) b!388769))

(assert (= (and b!388769 c!53959) b!388765))

(assert (= (and b!388769 (not c!53959)) b!388768))

(assert (= (or b!388765 b!388768) bm!27345))

(assert (=> b!388766 m!385013))

(assert (=> b!388766 m!385013))

(declare-fun m!385027 () Bool)

(assert (=> b!388766 m!385027))

(assert (=> b!388767 m!385013))

(assert (=> b!388767 m!385013))

(assert (=> b!388767 m!385021))

(assert (=> bm!27345 m!385013))

(declare-fun m!385029 () Bool)

(assert (=> bm!27345 m!385029))

(assert (=> b!388769 m!385013))

(assert (=> b!388769 m!385013))

(assert (=> b!388769 m!385021))

(assert (=> b!388634 d!72879))

(declare-fun d!72881 () Bool)

(declare-fun e!235557 () Bool)

(assert (=> d!72881 e!235557))

(declare-fun res!222371 () Bool)

(assert (=> d!72881 (=> (not res!222371) (not e!235557))))

(declare-fun lt!182648 () ListLongMap!5277)

(declare-fun contains!2423 (ListLongMap!5277 (_ BitVec 64)) Bool)

(assert (=> d!72881 (= res!222371 (contains!2423 lt!182648 (_1!3192 (tuple2!6363 k0!778 v!373))))))

(declare-fun lt!182646 () List!6215)

(assert (=> d!72881 (= lt!182648 (ListLongMap!5278 lt!182646))))

(declare-fun lt!182645 () Unit!11885)

(declare-fun lt!182647 () Unit!11885)

(assert (=> d!72881 (= lt!182645 lt!182647)))

(declare-datatypes ((Option!363 0))(
  ( (Some!362 (v!7044 V!13883)) (None!361) )
))
(declare-fun getValueByKey!357 (List!6215 (_ BitVec 64)) Option!363)

(assert (=> d!72881 (= (getValueByKey!357 lt!182646 (_1!3192 (tuple2!6363 k0!778 v!373))) (Some!362 (_2!3192 (tuple2!6363 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!179 (List!6215 (_ BitVec 64) V!13883) Unit!11885)

(assert (=> d!72881 (= lt!182647 (lemmaContainsTupThenGetReturnValue!179 lt!182646 (_1!3192 (tuple2!6363 k0!778 v!373)) (_2!3192 (tuple2!6363 k0!778 v!373))))))

(declare-fun insertStrictlySorted!182 (List!6215 (_ BitVec 64) V!13883) List!6215)

(assert (=> d!72881 (= lt!182646 (insertStrictlySorted!182 (toList!2654 lt!182560) (_1!3192 (tuple2!6363 k0!778 v!373)) (_2!3192 (tuple2!6363 k0!778 v!373))))))

(assert (=> d!72881 (= (+!1008 lt!182560 (tuple2!6363 k0!778 v!373)) lt!182648)))

(declare-fun b!388774 () Bool)

(declare-fun res!222372 () Bool)

(assert (=> b!388774 (=> (not res!222372) (not e!235557))))

(assert (=> b!388774 (= res!222372 (= (getValueByKey!357 (toList!2654 lt!182648) (_1!3192 (tuple2!6363 k0!778 v!373))) (Some!362 (_2!3192 (tuple2!6363 k0!778 v!373)))))))

(declare-fun b!388775 () Bool)

(declare-fun contains!2424 (List!6215 tuple2!6362) Bool)

(assert (=> b!388775 (= e!235557 (contains!2424 (toList!2654 lt!182648) (tuple2!6363 k0!778 v!373)))))

(assert (= (and d!72881 res!222371) b!388774))

(assert (= (and b!388774 res!222372) b!388775))

(declare-fun m!385031 () Bool)

(assert (=> d!72881 m!385031))

(declare-fun m!385033 () Bool)

(assert (=> d!72881 m!385033))

(declare-fun m!385035 () Bool)

(assert (=> d!72881 m!385035))

(declare-fun m!385037 () Bool)

(assert (=> d!72881 m!385037))

(declare-fun m!385039 () Bool)

(assert (=> b!388774 m!385039))

(declare-fun m!385041 () Bool)

(assert (=> b!388775 m!385041))

(assert (=> b!388643 d!72881))

(declare-fun b!388800 () Bool)

(declare-fun e!235578 () Bool)

(declare-fun e!235577 () Bool)

(assert (=> b!388800 (= e!235578 e!235577)))

(assert (=> b!388800 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun res!222382 () Bool)

(declare-fun lt!182665 () ListLongMap!5277)

(assert (=> b!388800 (= res!222382 (contains!2423 lt!182665 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388800 (=> (not res!222382) (not e!235577))))

(declare-fun b!388801 () Bool)

(declare-fun e!235576 () ListLongMap!5277)

(declare-fun e!235575 () ListLongMap!5277)

(assert (=> b!388801 (= e!235576 e!235575)))

(declare-fun c!53969 () Bool)

(assert (=> b!388801 (= c!53969 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388802 () Bool)

(declare-fun e!235573 () Bool)

(assert (=> b!388802 (= e!235573 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388802 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388803 () Bool)

(assert (=> b!388803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(assert (=> b!388803 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11342 _values!506)))))

(declare-fun apply!298 (ListLongMap!5277 (_ BitVec 64)) V!13883)

(declare-fun get!5572 (ValueCell!4448 V!13883) V!13883)

(declare-fun dynLambda!641 (Int (_ BitVec 64)) V!13883)

(assert (=> b!388803 (= e!235577 (= (apply!298 lt!182665 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)) (get!5572 (select (arr!10990 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!388804 () Bool)

(declare-fun e!235574 () Bool)

(assert (=> b!388804 (= e!235574 e!235578)))

(declare-fun c!53968 () Bool)

(assert (=> b!388804 (= c!53968 e!235573)))

(declare-fun res!222383 () Bool)

(assert (=> b!388804 (=> (not res!222383) (not e!235573))))

(assert (=> b!388804 (= res!222383 (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun d!72883 () Bool)

(assert (=> d!72883 e!235574))

(declare-fun res!222384 () Bool)

(assert (=> d!72883 (=> (not res!222384) (not e!235574))))

(assert (=> d!72883 (= res!222384 (not (contains!2423 lt!182665 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72883 (= lt!182665 e!235576)))

(declare-fun c!53970 () Bool)

(assert (=> d!72883 (= c!53970 (bvsge #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(assert (=> d!72883 (validMask!0 mask!970)))

(assert (=> d!72883 (= (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182665)))

(declare-fun b!388805 () Bool)

(declare-fun lt!182669 () Unit!11885)

(declare-fun lt!182667 () Unit!11885)

(assert (=> b!388805 (= lt!182669 lt!182667)))

(declare-fun lt!182668 () ListLongMap!5277)

(declare-fun lt!182663 () V!13883)

(declare-fun lt!182666 () (_ BitVec 64))

(declare-fun lt!182664 () (_ BitVec 64))

(assert (=> b!388805 (not (contains!2423 (+!1008 lt!182668 (tuple2!6363 lt!182664 lt!182663)) lt!182666))))

(declare-fun addStillNotContains!133 (ListLongMap!5277 (_ BitVec 64) V!13883 (_ BitVec 64)) Unit!11885)

(assert (=> b!388805 (= lt!182667 (addStillNotContains!133 lt!182668 lt!182664 lt!182663 lt!182666))))

(assert (=> b!388805 (= lt!182666 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388805 (= lt!182663 (get!5572 (select (arr!10990 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388805 (= lt!182664 (select (arr!10989 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27351 () ListLongMap!5277)

(assert (=> b!388805 (= lt!182668 call!27351)))

(assert (=> b!388805 (= e!235575 (+!1008 call!27351 (tuple2!6363 (select (arr!10989 _keys!658) #b00000000000000000000000000000000) (get!5572 (select (arr!10990 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27348 () Bool)

(assert (=> bm!27348 (= call!27351 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388806 () Bool)

(assert (=> b!388806 (= e!235576 (ListLongMap!5278 Nil!6212))))

(declare-fun b!388807 () Bool)

(declare-fun e!235572 () Bool)

(declare-fun isEmpty!550 (ListLongMap!5277) Bool)

(assert (=> b!388807 (= e!235572 (isEmpty!550 lt!182665))))

(declare-fun b!388808 () Bool)

(assert (=> b!388808 (= e!235578 e!235572)))

(declare-fun c!53971 () Bool)

(assert (=> b!388808 (= c!53971 (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun b!388809 () Bool)

(declare-fun res!222381 () Bool)

(assert (=> b!388809 (=> (not res!222381) (not e!235574))))

(assert (=> b!388809 (= res!222381 (not (contains!2423 lt!182665 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388810 () Bool)

(assert (=> b!388810 (= e!235575 call!27351)))

(declare-fun b!388811 () Bool)

(assert (=> b!388811 (= e!235572 (= lt!182665 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!72883 c!53970) b!388806))

(assert (= (and d!72883 (not c!53970)) b!388801))

(assert (= (and b!388801 c!53969) b!388805))

(assert (= (and b!388801 (not c!53969)) b!388810))

(assert (= (or b!388805 b!388810) bm!27348))

(assert (= (and d!72883 res!222384) b!388809))

(assert (= (and b!388809 res!222381) b!388804))

(assert (= (and b!388804 res!222383) b!388802))

(assert (= (and b!388804 c!53968) b!388800))

(assert (= (and b!388804 (not c!53968)) b!388808))

(assert (= (and b!388800 res!222382) b!388803))

(assert (= (and b!388808 c!53971) b!388811))

(assert (= (and b!388808 (not c!53971)) b!388807))

(declare-fun b_lambda!8573 () Bool)

(assert (=> (not b_lambda!8573) (not b!388803)))

(declare-fun t!11365 () Bool)

(declare-fun tb!3103 () Bool)

(assert (=> (and start!37816 (= defaultEntry!514 defaultEntry!514) t!11365) tb!3103))

(declare-fun result!5705 () Bool)

(assert (=> tb!3103 (= result!5705 tp_is_empty!9583)))

(assert (=> b!388803 t!11365))

(declare-fun b_and!16185 () Bool)

(assert (= b_and!16179 (and (=> t!11365 result!5705) b_and!16185)))

(declare-fun b_lambda!8575 () Bool)

(assert (=> (not b_lambda!8575) (not b!388805)))

(assert (=> b!388805 t!11365))

(declare-fun b_and!16187 () Bool)

(assert (= b_and!16185 (and (=> t!11365 result!5705) b_and!16187)))

(declare-fun m!385043 () Bool)

(assert (=> b!388807 m!385043))

(declare-fun m!385045 () Bool)

(assert (=> bm!27348 m!385045))

(declare-fun m!385047 () Bool)

(assert (=> d!72883 m!385047))

(assert (=> d!72883 m!384887))

(assert (=> b!388811 m!385045))

(assert (=> b!388802 m!385013))

(assert (=> b!388802 m!385013))

(assert (=> b!388802 m!385021))

(assert (=> b!388801 m!385013))

(assert (=> b!388801 m!385013))

(assert (=> b!388801 m!385021))

(declare-fun m!385049 () Bool)

(assert (=> b!388809 m!385049))

(declare-fun m!385051 () Bool)

(assert (=> b!388803 m!385051))

(declare-fun m!385053 () Bool)

(assert (=> b!388803 m!385053))

(declare-fun m!385055 () Bool)

(assert (=> b!388803 m!385055))

(assert (=> b!388803 m!385053))

(assert (=> b!388803 m!385051))

(assert (=> b!388803 m!385013))

(declare-fun m!385057 () Bool)

(assert (=> b!388803 m!385057))

(assert (=> b!388803 m!385013))

(assert (=> b!388800 m!385013))

(assert (=> b!388800 m!385013))

(declare-fun m!385059 () Bool)

(assert (=> b!388800 m!385059))

(assert (=> b!388805 m!385013))

(declare-fun m!385061 () Bool)

(assert (=> b!388805 m!385061))

(assert (=> b!388805 m!385051))

(assert (=> b!388805 m!385053))

(assert (=> b!388805 m!385055))

(assert (=> b!388805 m!385053))

(assert (=> b!388805 m!385051))

(assert (=> b!388805 m!385061))

(declare-fun m!385063 () Bool)

(assert (=> b!388805 m!385063))

(declare-fun m!385065 () Bool)

(assert (=> b!388805 m!385065))

(declare-fun m!385067 () Bool)

(assert (=> b!388805 m!385067))

(assert (=> b!388643 d!72883))

(declare-fun bm!27363 () Bool)

(declare-fun call!27370 () Bool)

(declare-fun lt!182725 () ListLongMap!5277)

(assert (=> bm!27363 (= call!27370 (contains!2423 lt!182725 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388856 () Bool)

(declare-fun res!222407 () Bool)

(declare-fun e!235616 () Bool)

(assert (=> b!388856 (=> (not res!222407) (not e!235616))))

(declare-fun e!235613 () Bool)

(assert (=> b!388856 (= res!222407 e!235613)))

(declare-fun res!222406 () Bool)

(assert (=> b!388856 (=> res!222406 e!235613)))

(declare-fun e!235607 () Bool)

(assert (=> b!388856 (= res!222406 (not e!235607))))

(declare-fun res!222411 () Bool)

(assert (=> b!388856 (=> (not res!222411) (not e!235607))))

(assert (=> b!388856 (= res!222411 (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun bm!27364 () Bool)

(declare-fun call!27372 () Bool)

(assert (=> bm!27364 (= call!27372 (contains!2423 lt!182725 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388857 () Bool)

(declare-fun c!53989 () Bool)

(assert (=> b!388857 (= c!53989 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235610 () ListLongMap!5277)

(declare-fun e!235614 () ListLongMap!5277)

(assert (=> b!388857 (= e!235610 e!235614)))

(declare-fun b!388858 () Bool)

(declare-fun e!235617 () Bool)

(assert (=> b!388858 (= e!235617 (not call!27372))))

(declare-fun b!388859 () Bool)

(declare-fun e!235615 () Bool)

(assert (=> b!388859 (= e!235615 (not call!27370))))

(declare-fun b!388860 () Bool)

(declare-fun e!235612 () Bool)

(assert (=> b!388860 (= e!235615 e!235612)))

(declare-fun res!222405 () Bool)

(assert (=> b!388860 (= res!222405 call!27370)))

(assert (=> b!388860 (=> (not res!222405) (not e!235612))))

(declare-fun bm!27365 () Bool)

(declare-fun call!27371 () ListLongMap!5277)

(declare-fun call!27368 () ListLongMap!5277)

(assert (=> bm!27365 (= call!27371 call!27368)))

(declare-fun d!72885 () Bool)

(assert (=> d!72885 e!235616))

(declare-fun res!222410 () Bool)

(assert (=> d!72885 (=> (not res!222410) (not e!235616))))

(assert (=> d!72885 (= res!222410 (or (bvsge #b00000000000000000000000000000000 (size!11341 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))))

(declare-fun lt!182727 () ListLongMap!5277)

(assert (=> d!72885 (= lt!182725 lt!182727)))

(declare-fun lt!182719 () Unit!11885)

(declare-fun e!235608 () Unit!11885)

(assert (=> d!72885 (= lt!182719 e!235608)))

(declare-fun c!53986 () Bool)

(declare-fun e!235611 () Bool)

(assert (=> d!72885 (= c!53986 e!235611)))

(declare-fun res!222408 () Bool)

(assert (=> d!72885 (=> (not res!222408) (not e!235611))))

(assert (=> d!72885 (= res!222408 (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun e!235605 () ListLongMap!5277)

(assert (=> d!72885 (= lt!182727 e!235605)))

(declare-fun c!53988 () Bool)

(assert (=> d!72885 (= c!53988 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72885 (validMask!0 mask!970)))

(assert (=> d!72885 (= (getCurrentListMap!2040 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182725)))

(declare-fun b!388861 () Bool)

(assert (=> b!388861 (= e!235611 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388862 () Bool)

(declare-fun call!27367 () ListLongMap!5277)

(assert (=> b!388862 (= e!235610 call!27367)))

(declare-fun bm!27366 () Bool)

(declare-fun call!27366 () ListLongMap!5277)

(assert (=> bm!27366 (= call!27367 call!27366)))

(declare-fun b!388863 () Bool)

(assert (=> b!388863 (= e!235605 e!235610)))

(declare-fun c!53987 () Bool)

(assert (=> b!388863 (= c!53987 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388864 () Bool)

(assert (=> b!388864 (= e!235614 call!27371)))

(declare-fun b!388865 () Bool)

(assert (=> b!388865 (= e!235614 call!27367)))

(declare-fun b!388866 () Bool)

(declare-fun lt!182734 () Unit!11885)

(assert (=> b!388866 (= e!235608 lt!182734)))

(declare-fun lt!182720 () ListLongMap!5277)

(assert (=> b!388866 (= lt!182720 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182723 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182723 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182731 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182731 (select (arr!10989 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182724 () Unit!11885)

(declare-fun addStillContains!274 (ListLongMap!5277 (_ BitVec 64) V!13883 (_ BitVec 64)) Unit!11885)

(assert (=> b!388866 (= lt!182724 (addStillContains!274 lt!182720 lt!182723 zeroValue!472 lt!182731))))

(assert (=> b!388866 (contains!2423 (+!1008 lt!182720 (tuple2!6363 lt!182723 zeroValue!472)) lt!182731)))

(declare-fun lt!182730 () Unit!11885)

(assert (=> b!388866 (= lt!182730 lt!182724)))

(declare-fun lt!182715 () ListLongMap!5277)

(assert (=> b!388866 (= lt!182715 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182722 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182722 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182733 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182733 (select (arr!10989 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182716 () Unit!11885)

(declare-fun addApplyDifferent!274 (ListLongMap!5277 (_ BitVec 64) V!13883 (_ BitVec 64)) Unit!11885)

(assert (=> b!388866 (= lt!182716 (addApplyDifferent!274 lt!182715 lt!182722 minValue!472 lt!182733))))

(assert (=> b!388866 (= (apply!298 (+!1008 lt!182715 (tuple2!6363 lt!182722 minValue!472)) lt!182733) (apply!298 lt!182715 lt!182733))))

(declare-fun lt!182726 () Unit!11885)

(assert (=> b!388866 (= lt!182726 lt!182716)))

(declare-fun lt!182714 () ListLongMap!5277)

(assert (=> b!388866 (= lt!182714 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182729 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182729 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182721 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182721 (select (arr!10989 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182728 () Unit!11885)

(assert (=> b!388866 (= lt!182728 (addApplyDifferent!274 lt!182714 lt!182729 zeroValue!472 lt!182721))))

(assert (=> b!388866 (= (apply!298 (+!1008 lt!182714 (tuple2!6363 lt!182729 zeroValue!472)) lt!182721) (apply!298 lt!182714 lt!182721))))

(declare-fun lt!182718 () Unit!11885)

(assert (=> b!388866 (= lt!182718 lt!182728)))

(declare-fun lt!182717 () ListLongMap!5277)

(assert (=> b!388866 (= lt!182717 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182732 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182732 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182735 () (_ BitVec 64))

(assert (=> b!388866 (= lt!182735 (select (arr!10989 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388866 (= lt!182734 (addApplyDifferent!274 lt!182717 lt!182732 minValue!472 lt!182735))))

(assert (=> b!388866 (= (apply!298 (+!1008 lt!182717 (tuple2!6363 lt!182732 minValue!472)) lt!182735) (apply!298 lt!182717 lt!182735))))

(declare-fun b!388867 () Bool)

(declare-fun e!235606 () Bool)

(assert (=> b!388867 (= e!235613 e!235606)))

(declare-fun res!222403 () Bool)

(assert (=> b!388867 (=> (not res!222403) (not e!235606))))

(assert (=> b!388867 (= res!222403 (contains!2423 lt!182725 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388867 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun b!388868 () Bool)

(declare-fun res!222404 () Bool)

(assert (=> b!388868 (=> (not res!222404) (not e!235616))))

(assert (=> b!388868 (= res!222404 e!235617)))

(declare-fun c!53984 () Bool)

(assert (=> b!388868 (= c!53984 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27367 () Bool)

(declare-fun call!27369 () ListLongMap!5277)

(assert (=> bm!27367 (= call!27368 call!27369)))

(declare-fun b!388869 () Bool)

(declare-fun e!235609 () Bool)

(assert (=> b!388869 (= e!235617 e!235609)))

(declare-fun res!222409 () Bool)

(assert (=> b!388869 (= res!222409 call!27372)))

(assert (=> b!388869 (=> (not res!222409) (not e!235609))))

(declare-fun bm!27368 () Bool)

(assert (=> bm!27368 (= call!27366 (+!1008 (ite c!53988 call!27369 (ite c!53987 call!27368 call!27371)) (ite (or c!53988 c!53987) (tuple2!6363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388870 () Bool)

(assert (=> b!388870 (= e!235609 (= (apply!298 lt!182725 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388871 () Bool)

(assert (=> b!388871 (= e!235612 (= (apply!298 lt!182725 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!388872 () Bool)

(assert (=> b!388872 (= e!235607 (validKeyInArray!0 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388873 () Bool)

(assert (=> b!388873 (= e!235606 (= (apply!298 lt!182725 (select (arr!10989 _keys!658) #b00000000000000000000000000000000)) (get!5572 (select (arr!10990 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11342 _values!506)))))

(assert (=> b!388873 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(declare-fun b!388874 () Bool)

(assert (=> b!388874 (= e!235616 e!235615)))

(declare-fun c!53985 () Bool)

(assert (=> b!388874 (= c!53985 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27369 () Bool)

(assert (=> bm!27369 (= call!27369 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388875 () Bool)

(declare-fun Unit!11889 () Unit!11885)

(assert (=> b!388875 (= e!235608 Unit!11889)))

(declare-fun b!388876 () Bool)

(assert (=> b!388876 (= e!235605 (+!1008 call!27366 (tuple2!6363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72885 c!53988) b!388876))

(assert (= (and d!72885 (not c!53988)) b!388863))

(assert (= (and b!388863 c!53987) b!388862))

(assert (= (and b!388863 (not c!53987)) b!388857))

(assert (= (and b!388857 c!53989) b!388865))

(assert (= (and b!388857 (not c!53989)) b!388864))

(assert (= (or b!388865 b!388864) bm!27365))

(assert (= (or b!388862 bm!27365) bm!27367))

(assert (= (or b!388862 b!388865) bm!27366))

(assert (= (or b!388876 bm!27367) bm!27369))

(assert (= (or b!388876 bm!27366) bm!27368))

(assert (= (and d!72885 res!222408) b!388861))

(assert (= (and d!72885 c!53986) b!388866))

(assert (= (and d!72885 (not c!53986)) b!388875))

(assert (= (and d!72885 res!222410) b!388856))

(assert (= (and b!388856 res!222411) b!388872))

(assert (= (and b!388856 (not res!222406)) b!388867))

(assert (= (and b!388867 res!222403) b!388873))

(assert (= (and b!388856 res!222407) b!388868))

(assert (= (and b!388868 c!53984) b!388869))

(assert (= (and b!388868 (not c!53984)) b!388858))

(assert (= (and b!388869 res!222409) b!388870))

(assert (= (or b!388869 b!388858) bm!27364))

(assert (= (and b!388868 res!222404) b!388874))

(assert (= (and b!388874 c!53985) b!388860))

(assert (= (and b!388874 (not c!53985)) b!388859))

(assert (= (and b!388860 res!222405) b!388871))

(assert (= (or b!388860 b!388859) bm!27363))

(declare-fun b_lambda!8577 () Bool)

(assert (=> (not b_lambda!8577) (not b!388873)))

(assert (=> b!388873 t!11365))

(declare-fun b_and!16189 () Bool)

(assert (= b_and!16187 (and (=> t!11365 result!5705) b_and!16189)))

(assert (=> b!388867 m!385013))

(assert (=> b!388867 m!385013))

(declare-fun m!385069 () Bool)

(assert (=> b!388867 m!385069))

(assert (=> b!388872 m!385013))

(assert (=> b!388872 m!385013))

(assert (=> b!388872 m!385021))

(declare-fun m!385071 () Bool)

(assert (=> bm!27363 m!385071))

(assert (=> b!388861 m!385013))

(assert (=> b!388861 m!385013))

(assert (=> b!388861 m!385021))

(declare-fun m!385073 () Bool)

(assert (=> b!388866 m!385073))

(declare-fun m!385075 () Bool)

(assert (=> b!388866 m!385075))

(declare-fun m!385077 () Bool)

(assert (=> b!388866 m!385077))

(declare-fun m!385079 () Bool)

(assert (=> b!388866 m!385079))

(declare-fun m!385081 () Bool)

(assert (=> b!388866 m!385081))

(assert (=> b!388866 m!385013))

(assert (=> b!388866 m!385081))

(declare-fun m!385083 () Bool)

(assert (=> b!388866 m!385083))

(declare-fun m!385085 () Bool)

(assert (=> b!388866 m!385085))

(declare-fun m!385087 () Bool)

(assert (=> b!388866 m!385087))

(declare-fun m!385089 () Bool)

(assert (=> b!388866 m!385089))

(declare-fun m!385091 () Bool)

(assert (=> b!388866 m!385091))

(assert (=> b!388866 m!385085))

(assert (=> b!388866 m!384879))

(declare-fun m!385093 () Bool)

(assert (=> b!388866 m!385093))

(declare-fun m!385095 () Bool)

(assert (=> b!388866 m!385095))

(assert (=> b!388866 m!385075))

(declare-fun m!385097 () Bool)

(assert (=> b!388866 m!385097))

(assert (=> b!388866 m!385091))

(declare-fun m!385099 () Bool)

(assert (=> b!388866 m!385099))

(declare-fun m!385101 () Bool)

(assert (=> b!388866 m!385101))

(assert (=> bm!27369 m!384879))

(assert (=> d!72885 m!384887))

(declare-fun m!385103 () Bool)

(assert (=> b!388870 m!385103))

(declare-fun m!385105 () Bool)

(assert (=> bm!27368 m!385105))

(assert (=> b!388873 m!385053))

(assert (=> b!388873 m!385013))

(declare-fun m!385107 () Bool)

(assert (=> b!388873 m!385107))

(assert (=> b!388873 m!385013))

(assert (=> b!388873 m!385051))

(assert (=> b!388873 m!385051))

(assert (=> b!388873 m!385053))

(assert (=> b!388873 m!385055))

(declare-fun m!385109 () Bool)

(assert (=> b!388871 m!385109))

(declare-fun m!385111 () Bool)

(assert (=> b!388876 m!385111))

(declare-fun m!385113 () Bool)

(assert (=> bm!27364 m!385113))

(assert (=> b!388643 d!72885))

(declare-fun bm!27370 () Bool)

(declare-fun call!27377 () Bool)

(declare-fun lt!182747 () ListLongMap!5277)

(assert (=> bm!27370 (= call!27377 (contains!2423 lt!182747 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388877 () Bool)

(declare-fun res!222416 () Bool)

(declare-fun e!235629 () Bool)

(assert (=> b!388877 (=> (not res!222416) (not e!235629))))

(declare-fun e!235626 () Bool)

(assert (=> b!388877 (= res!222416 e!235626)))

(declare-fun res!222415 () Bool)

(assert (=> b!388877 (=> res!222415 e!235626)))

(declare-fun e!235620 () Bool)

(assert (=> b!388877 (= res!222415 (not e!235620))))

(declare-fun res!222420 () Bool)

(assert (=> b!388877 (=> (not res!222420) (not e!235620))))

(assert (=> b!388877 (= res!222420 (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun bm!27371 () Bool)

(declare-fun call!27379 () Bool)

(assert (=> bm!27371 (= call!27379 (contains!2423 lt!182747 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388878 () Bool)

(declare-fun c!53995 () Bool)

(assert (=> b!388878 (= c!53995 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235623 () ListLongMap!5277)

(declare-fun e!235627 () ListLongMap!5277)

(assert (=> b!388878 (= e!235623 e!235627)))

(declare-fun b!388879 () Bool)

(declare-fun e!235630 () Bool)

(assert (=> b!388879 (= e!235630 (not call!27379))))

(declare-fun b!388880 () Bool)

(declare-fun e!235628 () Bool)

(assert (=> b!388880 (= e!235628 (not call!27377))))

(declare-fun b!388881 () Bool)

(declare-fun e!235625 () Bool)

(assert (=> b!388881 (= e!235628 e!235625)))

(declare-fun res!222414 () Bool)

(assert (=> b!388881 (= res!222414 call!27377)))

(assert (=> b!388881 (=> (not res!222414) (not e!235625))))

(declare-fun bm!27372 () Bool)

(declare-fun call!27378 () ListLongMap!5277)

(declare-fun call!27375 () ListLongMap!5277)

(assert (=> bm!27372 (= call!27378 call!27375)))

(declare-fun d!72887 () Bool)

(assert (=> d!72887 e!235629))

(declare-fun res!222419 () Bool)

(assert (=> d!72887 (=> (not res!222419) (not e!235629))))

(assert (=> d!72887 (= res!222419 (or (bvsge #b00000000000000000000000000000000 (size!11341 lt!182563)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))))

(declare-fun lt!182749 () ListLongMap!5277)

(assert (=> d!72887 (= lt!182747 lt!182749)))

(declare-fun lt!182741 () Unit!11885)

(declare-fun e!235621 () Unit!11885)

(assert (=> d!72887 (= lt!182741 e!235621)))

(declare-fun c!53992 () Bool)

(declare-fun e!235624 () Bool)

(assert (=> d!72887 (= c!53992 e!235624)))

(declare-fun res!222417 () Bool)

(assert (=> d!72887 (=> (not res!222417) (not e!235624))))

(assert (=> d!72887 (= res!222417 (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun e!235618 () ListLongMap!5277)

(assert (=> d!72887 (= lt!182749 e!235618)))

(declare-fun c!53994 () Bool)

(assert (=> d!72887 (= c!53994 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72887 (validMask!0 mask!970)))

(assert (=> d!72887 (= (getCurrentListMap!2040 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182747)))

(declare-fun b!388882 () Bool)

(assert (=> b!388882 (= e!235624 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(declare-fun b!388883 () Bool)

(declare-fun call!27374 () ListLongMap!5277)

(assert (=> b!388883 (= e!235623 call!27374)))

(declare-fun bm!27373 () Bool)

(declare-fun call!27373 () ListLongMap!5277)

(assert (=> bm!27373 (= call!27374 call!27373)))

(declare-fun b!388884 () Bool)

(assert (=> b!388884 (= e!235618 e!235623)))

(declare-fun c!53993 () Bool)

(assert (=> b!388884 (= c!53993 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388885 () Bool)

(assert (=> b!388885 (= e!235627 call!27378)))

(declare-fun b!388886 () Bool)

(assert (=> b!388886 (= e!235627 call!27374)))

(declare-fun b!388887 () Bool)

(declare-fun lt!182756 () Unit!11885)

(assert (=> b!388887 (= e!235621 lt!182756)))

(declare-fun lt!182742 () ListLongMap!5277)

(assert (=> b!388887 (= lt!182742 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182745 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182745 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182753 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182753 (select (arr!10989 lt!182563) #b00000000000000000000000000000000))))

(declare-fun lt!182746 () Unit!11885)

(assert (=> b!388887 (= lt!182746 (addStillContains!274 lt!182742 lt!182745 zeroValue!472 lt!182753))))

(assert (=> b!388887 (contains!2423 (+!1008 lt!182742 (tuple2!6363 lt!182745 zeroValue!472)) lt!182753)))

(declare-fun lt!182752 () Unit!11885)

(assert (=> b!388887 (= lt!182752 lt!182746)))

(declare-fun lt!182737 () ListLongMap!5277)

(assert (=> b!388887 (= lt!182737 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182744 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182755 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182755 (select (arr!10989 lt!182563) #b00000000000000000000000000000000))))

(declare-fun lt!182738 () Unit!11885)

(assert (=> b!388887 (= lt!182738 (addApplyDifferent!274 lt!182737 lt!182744 minValue!472 lt!182755))))

(assert (=> b!388887 (= (apply!298 (+!1008 lt!182737 (tuple2!6363 lt!182744 minValue!472)) lt!182755) (apply!298 lt!182737 lt!182755))))

(declare-fun lt!182748 () Unit!11885)

(assert (=> b!388887 (= lt!182748 lt!182738)))

(declare-fun lt!182736 () ListLongMap!5277)

(assert (=> b!388887 (= lt!182736 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182751 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182743 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182743 (select (arr!10989 lt!182563) #b00000000000000000000000000000000))))

(declare-fun lt!182750 () Unit!11885)

(assert (=> b!388887 (= lt!182750 (addApplyDifferent!274 lt!182736 lt!182751 zeroValue!472 lt!182743))))

(assert (=> b!388887 (= (apply!298 (+!1008 lt!182736 (tuple2!6363 lt!182751 zeroValue!472)) lt!182743) (apply!298 lt!182736 lt!182743))))

(declare-fun lt!182740 () Unit!11885)

(assert (=> b!388887 (= lt!182740 lt!182750)))

(declare-fun lt!182739 () ListLongMap!5277)

(assert (=> b!388887 (= lt!182739 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182754 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182754 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182757 () (_ BitVec 64))

(assert (=> b!388887 (= lt!182757 (select (arr!10989 lt!182563) #b00000000000000000000000000000000))))

(assert (=> b!388887 (= lt!182756 (addApplyDifferent!274 lt!182739 lt!182754 minValue!472 lt!182757))))

(assert (=> b!388887 (= (apply!298 (+!1008 lt!182739 (tuple2!6363 lt!182754 minValue!472)) lt!182757) (apply!298 lt!182739 lt!182757))))

(declare-fun b!388888 () Bool)

(declare-fun e!235619 () Bool)

(assert (=> b!388888 (= e!235626 e!235619)))

(declare-fun res!222412 () Bool)

(assert (=> b!388888 (=> (not res!222412) (not e!235619))))

(assert (=> b!388888 (= res!222412 (contains!2423 lt!182747 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(assert (=> b!388888 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun b!388889 () Bool)

(declare-fun res!222413 () Bool)

(assert (=> b!388889 (=> (not res!222413) (not e!235629))))

(assert (=> b!388889 (= res!222413 e!235630)))

(declare-fun c!53990 () Bool)

(assert (=> b!388889 (= c!53990 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!27374 () Bool)

(declare-fun call!27376 () ListLongMap!5277)

(assert (=> bm!27374 (= call!27375 call!27376)))

(declare-fun b!388890 () Bool)

(declare-fun e!235622 () Bool)

(assert (=> b!388890 (= e!235630 e!235622)))

(declare-fun res!222418 () Bool)

(assert (=> b!388890 (= res!222418 call!27379)))

(assert (=> b!388890 (=> (not res!222418) (not e!235622))))

(declare-fun bm!27375 () Bool)

(assert (=> bm!27375 (= call!27373 (+!1008 (ite c!53994 call!27376 (ite c!53993 call!27375 call!27378)) (ite (or c!53994 c!53993) (tuple2!6363 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388891 () Bool)

(assert (=> b!388891 (= e!235622 (= (apply!298 lt!182747 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388892 () Bool)

(assert (=> b!388892 (= e!235625 (= (apply!298 lt!182747 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!388893 () Bool)

(assert (=> b!388893 (= e!235620 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(declare-fun b!388894 () Bool)

(assert (=> b!388894 (= e!235619 (= (apply!298 lt!182747 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)) (get!5572 (select (arr!10990 lt!182564) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388894 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11342 lt!182564)))))

(assert (=> b!388894 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun b!388895 () Bool)

(assert (=> b!388895 (= e!235629 e!235628)))

(declare-fun c!53991 () Bool)

(assert (=> b!388895 (= c!53991 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27376 () Bool)

(assert (=> bm!27376 (= call!27376 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388896 () Bool)

(declare-fun Unit!11890 () Unit!11885)

(assert (=> b!388896 (= e!235621 Unit!11890)))

(declare-fun b!388897 () Bool)

(assert (=> b!388897 (= e!235618 (+!1008 call!27373 (tuple2!6363 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(assert (= (and d!72887 c!53994) b!388897))

(assert (= (and d!72887 (not c!53994)) b!388884))

(assert (= (and b!388884 c!53993) b!388883))

(assert (= (and b!388884 (not c!53993)) b!388878))

(assert (= (and b!388878 c!53995) b!388886))

(assert (= (and b!388878 (not c!53995)) b!388885))

(assert (= (or b!388886 b!388885) bm!27372))

(assert (= (or b!388883 bm!27372) bm!27374))

(assert (= (or b!388883 b!388886) bm!27373))

(assert (= (or b!388897 bm!27374) bm!27376))

(assert (= (or b!388897 bm!27373) bm!27375))

(assert (= (and d!72887 res!222417) b!388882))

(assert (= (and d!72887 c!53992) b!388887))

(assert (= (and d!72887 (not c!53992)) b!388896))

(assert (= (and d!72887 res!222419) b!388877))

(assert (= (and b!388877 res!222420) b!388893))

(assert (= (and b!388877 (not res!222415)) b!388888))

(assert (= (and b!388888 res!222412) b!388894))

(assert (= (and b!388877 res!222416) b!388889))

(assert (= (and b!388889 c!53990) b!388890))

(assert (= (and b!388889 (not c!53990)) b!388879))

(assert (= (and b!388890 res!222418) b!388891))

(assert (= (or b!388890 b!388879) bm!27371))

(assert (= (and b!388889 res!222413) b!388895))

(assert (= (and b!388895 c!53991) b!388881))

(assert (= (and b!388895 (not c!53991)) b!388880))

(assert (= (and b!388881 res!222414) b!388892))

(assert (= (or b!388881 b!388880) bm!27370))

(declare-fun b_lambda!8579 () Bool)

(assert (=> (not b_lambda!8579) (not b!388894)))

(assert (=> b!388894 t!11365))

(declare-fun b_and!16191 () Bool)

(assert (= b_and!16189 (and (=> t!11365 result!5705) b_and!16191)))

(assert (=> b!388888 m!385005))

(assert (=> b!388888 m!385005))

(declare-fun m!385115 () Bool)

(assert (=> b!388888 m!385115))

(assert (=> b!388893 m!385005))

(assert (=> b!388893 m!385005))

(assert (=> b!388893 m!385009))

(declare-fun m!385117 () Bool)

(assert (=> bm!27370 m!385117))

(assert (=> b!388882 m!385005))

(assert (=> b!388882 m!385005))

(assert (=> b!388882 m!385009))

(declare-fun m!385119 () Bool)

(assert (=> b!388887 m!385119))

(declare-fun m!385121 () Bool)

(assert (=> b!388887 m!385121))

(declare-fun m!385123 () Bool)

(assert (=> b!388887 m!385123))

(declare-fun m!385125 () Bool)

(assert (=> b!388887 m!385125))

(declare-fun m!385127 () Bool)

(assert (=> b!388887 m!385127))

(assert (=> b!388887 m!385005))

(assert (=> b!388887 m!385127))

(declare-fun m!385129 () Bool)

(assert (=> b!388887 m!385129))

(declare-fun m!385131 () Bool)

(assert (=> b!388887 m!385131))

(declare-fun m!385133 () Bool)

(assert (=> b!388887 m!385133))

(declare-fun m!385135 () Bool)

(assert (=> b!388887 m!385135))

(declare-fun m!385137 () Bool)

(assert (=> b!388887 m!385137))

(assert (=> b!388887 m!385131))

(assert (=> b!388887 m!384869))

(declare-fun m!385139 () Bool)

(assert (=> b!388887 m!385139))

(declare-fun m!385141 () Bool)

(assert (=> b!388887 m!385141))

(assert (=> b!388887 m!385121))

(declare-fun m!385143 () Bool)

(assert (=> b!388887 m!385143))

(assert (=> b!388887 m!385137))

(declare-fun m!385145 () Bool)

(assert (=> b!388887 m!385145))

(declare-fun m!385147 () Bool)

(assert (=> b!388887 m!385147))

(assert (=> bm!27376 m!384869))

(assert (=> d!72887 m!384887))

(declare-fun m!385149 () Bool)

(assert (=> b!388891 m!385149))

(declare-fun m!385151 () Bool)

(assert (=> bm!27375 m!385151))

(assert (=> b!388894 m!385053))

(assert (=> b!388894 m!385005))

(declare-fun m!385153 () Bool)

(assert (=> b!388894 m!385153))

(assert (=> b!388894 m!385005))

(declare-fun m!385155 () Bool)

(assert (=> b!388894 m!385155))

(assert (=> b!388894 m!385155))

(assert (=> b!388894 m!385053))

(declare-fun m!385157 () Bool)

(assert (=> b!388894 m!385157))

(declare-fun m!385159 () Bool)

(assert (=> b!388892 m!385159))

(declare-fun m!385161 () Bool)

(assert (=> b!388897 m!385161))

(declare-fun m!385163 () Bool)

(assert (=> bm!27371 m!385163))

(assert (=> b!388643 d!72887))

(declare-fun b!388904 () Bool)

(declare-fun e!235636 () Bool)

(declare-fun call!27385 () ListLongMap!5277)

(declare-fun call!27384 () ListLongMap!5277)

(assert (=> b!388904 (= e!235636 (= call!27385 call!27384))))

(declare-fun d!72889 () Bool)

(declare-fun e!235635 () Bool)

(assert (=> d!72889 e!235635))

(declare-fun res!222423 () Bool)

(assert (=> d!72889 (=> (not res!222423) (not e!235635))))

(assert (=> d!72889 (= res!222423 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11341 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11342 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11341 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11342 _values!506))))))))

(declare-fun lt!182760 () Unit!11885)

(declare-fun choose!1319 (array!23044 array!23046 (_ BitVec 32) (_ BitVec 32) V!13883 V!13883 (_ BitVec 32) (_ BitVec 64) V!13883 (_ BitVec 32) Int) Unit!11885)

(assert (=> d!72889 (= lt!182760 (choose!1319 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72889 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11341 _keys!658)))))

(assert (=> d!72889 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!231 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182760)))

(declare-fun bm!27381 () Bool)

(assert (=> bm!27381 (= call!27385 (getCurrentListMapNoExtraKeys!929 (array!23045 (store (arr!10989 _keys!658) i!548 k0!778) (size!11341 _keys!658)) (array!23047 (store (arr!10990 _values!506) i!548 (ValueCellFull!4448 v!373)) (size!11342 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27382 () Bool)

(assert (=> bm!27382 (= call!27384 (getCurrentListMapNoExtraKeys!929 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388905 () Bool)

(assert (=> b!388905 (= e!235636 (= call!27385 (+!1008 call!27384 (tuple2!6363 k0!778 v!373))))))

(declare-fun b!388906 () Bool)

(assert (=> b!388906 (= e!235635 e!235636)))

(declare-fun c!53998 () Bool)

(assert (=> b!388906 (= c!53998 (bvsle #b00000000000000000000000000000000 i!548))))

(assert (= (and d!72889 res!222423) b!388906))

(assert (= (and b!388906 c!53998) b!388905))

(assert (= (and b!388906 (not c!53998)) b!388904))

(assert (= (or b!388905 b!388904) bm!27382))

(assert (= (or b!388905 b!388904) bm!27381))

(declare-fun m!385165 () Bool)

(assert (=> d!72889 m!385165))

(assert (=> bm!27381 m!384909))

(assert (=> bm!27381 m!384877))

(declare-fun m!385167 () Bool)

(assert (=> bm!27381 m!385167))

(assert (=> bm!27382 m!384879))

(declare-fun m!385169 () Bool)

(assert (=> b!388905 m!385169))

(assert (=> b!388643 d!72889))

(declare-fun b!388907 () Bool)

(declare-fun e!235643 () Bool)

(declare-fun e!235642 () Bool)

(assert (=> b!388907 (= e!235643 e!235642)))

(assert (=> b!388907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun res!222425 () Bool)

(declare-fun lt!182763 () ListLongMap!5277)

(assert (=> b!388907 (= res!222425 (contains!2423 lt!182763 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(assert (=> b!388907 (=> (not res!222425) (not e!235642))))

(declare-fun b!388908 () Bool)

(declare-fun e!235641 () ListLongMap!5277)

(declare-fun e!235640 () ListLongMap!5277)

(assert (=> b!388908 (= e!235641 e!235640)))

(declare-fun c!54000 () Bool)

(assert (=> b!388908 (= c!54000 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(declare-fun b!388909 () Bool)

(declare-fun e!235638 () Bool)

(assert (=> b!388909 (= e!235638 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(assert (=> b!388909 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388910 () Bool)

(assert (=> b!388910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(assert (=> b!388910 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11342 lt!182564)))))

(assert (=> b!388910 (= e!235642 (= (apply!298 lt!182763 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)) (get!5572 (select (arr!10990 lt!182564) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!388911 () Bool)

(declare-fun e!235639 () Bool)

(assert (=> b!388911 (= e!235639 e!235643)))

(declare-fun c!53999 () Bool)

(assert (=> b!388911 (= c!53999 e!235638)))

(declare-fun res!222426 () Bool)

(assert (=> b!388911 (=> (not res!222426) (not e!235638))))

(assert (=> b!388911 (= res!222426 (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun d!72891 () Bool)

(assert (=> d!72891 e!235639))

(declare-fun res!222427 () Bool)

(assert (=> d!72891 (=> (not res!222427) (not e!235639))))

(assert (=> d!72891 (= res!222427 (not (contains!2423 lt!182763 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72891 (= lt!182763 e!235641)))

(declare-fun c!54001 () Bool)

(assert (=> d!72891 (= c!54001 (bvsge #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(assert (=> d!72891 (validMask!0 mask!970)))

(assert (=> d!72891 (= (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182763)))

(declare-fun b!388912 () Bool)

(declare-fun lt!182767 () Unit!11885)

(declare-fun lt!182765 () Unit!11885)

(assert (=> b!388912 (= lt!182767 lt!182765)))

(declare-fun lt!182766 () ListLongMap!5277)

(declare-fun lt!182764 () (_ BitVec 64))

(declare-fun lt!182762 () (_ BitVec 64))

(declare-fun lt!182761 () V!13883)

(assert (=> b!388912 (not (contains!2423 (+!1008 lt!182766 (tuple2!6363 lt!182762 lt!182761)) lt!182764))))

(assert (=> b!388912 (= lt!182765 (addStillNotContains!133 lt!182766 lt!182762 lt!182761 lt!182764))))

(assert (=> b!388912 (= lt!182764 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388912 (= lt!182761 (get!5572 (select (arr!10990 lt!182564) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388912 (= lt!182762 (select (arr!10989 lt!182563) #b00000000000000000000000000000000))))

(declare-fun call!27386 () ListLongMap!5277)

(assert (=> b!388912 (= lt!182766 call!27386)))

(assert (=> b!388912 (= e!235640 (+!1008 call!27386 (tuple2!6363 (select (arr!10989 lt!182563) #b00000000000000000000000000000000) (get!5572 (select (arr!10990 lt!182564) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27383 () Bool)

(assert (=> bm!27383 (= call!27386 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388913 () Bool)

(assert (=> b!388913 (= e!235641 (ListLongMap!5278 Nil!6212))))

(declare-fun b!388914 () Bool)

(declare-fun e!235637 () Bool)

(assert (=> b!388914 (= e!235637 (isEmpty!550 lt!182763))))

(declare-fun b!388915 () Bool)

(assert (=> b!388915 (= e!235643 e!235637)))

(declare-fun c!54002 () Bool)

(assert (=> b!388915 (= c!54002 (bvslt #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(declare-fun b!388916 () Bool)

(declare-fun res!222424 () Bool)

(assert (=> b!388916 (=> (not res!222424) (not e!235639))))

(assert (=> b!388916 (= res!222424 (not (contains!2423 lt!182763 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388917 () Bool)

(assert (=> b!388917 (= e!235640 call!27386)))

(declare-fun b!388918 () Bool)

(assert (=> b!388918 (= e!235637 (= lt!182763 (getCurrentListMapNoExtraKeys!929 lt!182563 lt!182564 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!72891 c!54001) b!388913))

(assert (= (and d!72891 (not c!54001)) b!388908))

(assert (= (and b!388908 c!54000) b!388912))

(assert (= (and b!388908 (not c!54000)) b!388917))

(assert (= (or b!388912 b!388917) bm!27383))

(assert (= (and d!72891 res!222427) b!388916))

(assert (= (and b!388916 res!222424) b!388911))

(assert (= (and b!388911 res!222426) b!388909))

(assert (= (and b!388911 c!53999) b!388907))

(assert (= (and b!388911 (not c!53999)) b!388915))

(assert (= (and b!388907 res!222425) b!388910))

(assert (= (and b!388915 c!54002) b!388918))

(assert (= (and b!388915 (not c!54002)) b!388914))

(declare-fun b_lambda!8581 () Bool)

(assert (=> (not b_lambda!8581) (not b!388910)))

(assert (=> b!388910 t!11365))

(declare-fun b_and!16193 () Bool)

(assert (= b_and!16191 (and (=> t!11365 result!5705) b_and!16193)))

(declare-fun b_lambda!8583 () Bool)

(assert (=> (not b_lambda!8583) (not b!388912)))

(assert (=> b!388912 t!11365))

(declare-fun b_and!16195 () Bool)

(assert (= b_and!16193 (and (=> t!11365 result!5705) b_and!16195)))

(declare-fun m!385171 () Bool)

(assert (=> b!388914 m!385171))

(declare-fun m!385173 () Bool)

(assert (=> bm!27383 m!385173))

(declare-fun m!385175 () Bool)

(assert (=> d!72891 m!385175))

(assert (=> d!72891 m!384887))

(assert (=> b!388918 m!385173))

(assert (=> b!388909 m!385005))

(assert (=> b!388909 m!385005))

(assert (=> b!388909 m!385009))

(assert (=> b!388908 m!385005))

(assert (=> b!388908 m!385005))

(assert (=> b!388908 m!385009))

(declare-fun m!385177 () Bool)

(assert (=> b!388916 m!385177))

(assert (=> b!388910 m!385155))

(assert (=> b!388910 m!385053))

(assert (=> b!388910 m!385157))

(assert (=> b!388910 m!385053))

(assert (=> b!388910 m!385155))

(assert (=> b!388910 m!385005))

(declare-fun m!385179 () Bool)

(assert (=> b!388910 m!385179))

(assert (=> b!388910 m!385005))

(assert (=> b!388907 m!385005))

(assert (=> b!388907 m!385005))

(declare-fun m!385181 () Bool)

(assert (=> b!388907 m!385181))

(assert (=> b!388912 m!385005))

(declare-fun m!385183 () Bool)

(assert (=> b!388912 m!385183))

(assert (=> b!388912 m!385155))

(assert (=> b!388912 m!385053))

(assert (=> b!388912 m!385157))

(assert (=> b!388912 m!385053))

(assert (=> b!388912 m!385155))

(assert (=> b!388912 m!385183))

(declare-fun m!385185 () Bool)

(assert (=> b!388912 m!385185))

(declare-fun m!385187 () Bool)

(assert (=> b!388912 m!385187))

(declare-fun m!385189 () Bool)

(assert (=> b!388912 m!385189))

(assert (=> b!388643 d!72891))

(declare-fun b!388919 () Bool)

(declare-fun e!235645 () Bool)

(declare-fun e!235646 () Bool)

(assert (=> b!388919 (= e!235645 e!235646)))

(declare-fun lt!182770 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182770 (select (arr!10989 lt!182563) #b00000000000000000000000000000000))))

(declare-fun lt!182769 () Unit!11885)

(assert (=> b!388919 (= lt!182769 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182563 lt!182770 #b00000000000000000000000000000000))))

(assert (=> b!388919 (arrayContainsKey!0 lt!182563 lt!182770 #b00000000000000000000000000000000)))

(declare-fun lt!182768 () Unit!11885)

(assert (=> b!388919 (= lt!182768 lt!182769)))

(declare-fun res!222428 () Bool)

(assert (=> b!388919 (= res!222428 (= (seekEntryOrOpen!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000) lt!182563 mask!970) (Found!3458 #b00000000000000000000000000000000)))))

(assert (=> b!388919 (=> (not res!222428) (not e!235646))))

(declare-fun d!72893 () Bool)

(declare-fun res!222429 () Bool)

(declare-fun e!235644 () Bool)

(assert (=> d!72893 (=> res!222429 e!235644)))

(assert (=> d!72893 (= res!222429 (bvsge #b00000000000000000000000000000000 (size!11341 lt!182563)))))

(assert (=> d!72893 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182563 mask!970) e!235644)))

(declare-fun b!388920 () Bool)

(declare-fun call!27387 () Bool)

(assert (=> b!388920 (= e!235645 call!27387)))

(declare-fun b!388921 () Bool)

(assert (=> b!388921 (= e!235646 call!27387)))

(declare-fun b!388922 () Bool)

(assert (=> b!388922 (= e!235644 e!235645)))

(declare-fun c!54003 () Bool)

(assert (=> b!388922 (= c!54003 (validKeyInArray!0 (select (arr!10989 lt!182563) #b00000000000000000000000000000000)))))

(declare-fun bm!27384 () Bool)

(assert (=> bm!27384 (= call!27387 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182563 mask!970))))

(assert (= (and d!72893 (not res!222429)) b!388922))

(assert (= (and b!388922 c!54003) b!388919))

(assert (= (and b!388922 (not c!54003)) b!388920))

(assert (= (and b!388919 res!222428) b!388921))

(assert (= (or b!388921 b!388920) bm!27384))

(assert (=> b!388919 m!385005))

(declare-fun m!385191 () Bool)

(assert (=> b!388919 m!385191))

(declare-fun m!385193 () Bool)

(assert (=> b!388919 m!385193))

(assert (=> b!388919 m!385005))

(declare-fun m!385195 () Bool)

(assert (=> b!388919 m!385195))

(assert (=> b!388922 m!385005))

(assert (=> b!388922 m!385005))

(assert (=> b!388922 m!385009))

(declare-fun m!385197 () Bool)

(assert (=> bm!27384 m!385197))

(assert (=> b!388647 d!72893))

(declare-fun d!72895 () Bool)

(declare-fun e!235647 () Bool)

(assert (=> d!72895 e!235647))

(declare-fun res!222430 () Bool)

(assert (=> d!72895 (=> (not res!222430) (not e!235647))))

(declare-fun lt!182774 () ListLongMap!5277)

(assert (=> d!72895 (= res!222430 (contains!2423 lt!182774 (_1!3192 lt!182565)))))

(declare-fun lt!182772 () List!6215)

(assert (=> d!72895 (= lt!182774 (ListLongMap!5278 lt!182772))))

(declare-fun lt!182771 () Unit!11885)

(declare-fun lt!182773 () Unit!11885)

(assert (=> d!72895 (= lt!182771 lt!182773)))

(assert (=> d!72895 (= (getValueByKey!357 lt!182772 (_1!3192 lt!182565)) (Some!362 (_2!3192 lt!182565)))))

(assert (=> d!72895 (= lt!182773 (lemmaContainsTupThenGetReturnValue!179 lt!182772 (_1!3192 lt!182565) (_2!3192 lt!182565)))))

(assert (=> d!72895 (= lt!182772 (insertStrictlySorted!182 (toList!2654 (+!1008 lt!182560 lt!182567)) (_1!3192 lt!182565) (_2!3192 lt!182565)))))

(assert (=> d!72895 (= (+!1008 (+!1008 lt!182560 lt!182567) lt!182565) lt!182774)))

(declare-fun b!388923 () Bool)

(declare-fun res!222431 () Bool)

(assert (=> b!388923 (=> (not res!222431) (not e!235647))))

(assert (=> b!388923 (= res!222431 (= (getValueByKey!357 (toList!2654 lt!182774) (_1!3192 lt!182565)) (Some!362 (_2!3192 lt!182565))))))

(declare-fun b!388924 () Bool)

(assert (=> b!388924 (= e!235647 (contains!2424 (toList!2654 lt!182774) lt!182565))))

(assert (= (and d!72895 res!222430) b!388923))

(assert (= (and b!388923 res!222431) b!388924))

(declare-fun m!385199 () Bool)

(assert (=> d!72895 m!385199))

(declare-fun m!385201 () Bool)

(assert (=> d!72895 m!385201))

(declare-fun m!385203 () Bool)

(assert (=> d!72895 m!385203))

(declare-fun m!385205 () Bool)

(assert (=> d!72895 m!385205))

(declare-fun m!385207 () Bool)

(assert (=> b!388923 m!385207))

(declare-fun m!385209 () Bool)

(assert (=> b!388924 m!385209))

(assert (=> b!388637 d!72895))

(declare-fun d!72897 () Bool)

(declare-fun e!235648 () Bool)

(assert (=> d!72897 e!235648))

(declare-fun res!222432 () Bool)

(assert (=> d!72897 (=> (not res!222432) (not e!235648))))

(declare-fun lt!182778 () ListLongMap!5277)

(assert (=> d!72897 (= res!222432 (contains!2423 lt!182778 (_1!3192 lt!182567)))))

(declare-fun lt!182776 () List!6215)

(assert (=> d!72897 (= lt!182778 (ListLongMap!5278 lt!182776))))

(declare-fun lt!182775 () Unit!11885)

(declare-fun lt!182777 () Unit!11885)

(assert (=> d!72897 (= lt!182775 lt!182777)))

(assert (=> d!72897 (= (getValueByKey!357 lt!182776 (_1!3192 lt!182567)) (Some!362 (_2!3192 lt!182567)))))

(assert (=> d!72897 (= lt!182777 (lemmaContainsTupThenGetReturnValue!179 lt!182776 (_1!3192 lt!182567) (_2!3192 lt!182567)))))

(assert (=> d!72897 (= lt!182776 (insertStrictlySorted!182 (toList!2654 lt!182560) (_1!3192 lt!182567) (_2!3192 lt!182567)))))

(assert (=> d!72897 (= (+!1008 lt!182560 lt!182567) lt!182778)))

(declare-fun b!388925 () Bool)

(declare-fun res!222433 () Bool)

(assert (=> b!388925 (=> (not res!222433) (not e!235648))))

(assert (=> b!388925 (= res!222433 (= (getValueByKey!357 (toList!2654 lt!182778) (_1!3192 lt!182567)) (Some!362 (_2!3192 lt!182567))))))

(declare-fun b!388926 () Bool)

(assert (=> b!388926 (= e!235648 (contains!2424 (toList!2654 lt!182778) lt!182567))))

(assert (= (and d!72897 res!222432) b!388925))

(assert (= (and b!388925 res!222433) b!388926))

(declare-fun m!385211 () Bool)

(assert (=> d!72897 m!385211))

(declare-fun m!385213 () Bool)

(assert (=> d!72897 m!385213))

(declare-fun m!385215 () Bool)

(assert (=> d!72897 m!385215))

(declare-fun m!385217 () Bool)

(assert (=> d!72897 m!385217))

(declare-fun m!385219 () Bool)

(assert (=> b!388925 m!385219))

(declare-fun m!385221 () Bool)

(assert (=> b!388926 m!385221))

(assert (=> b!388637 d!72897))

(declare-fun d!72899 () Bool)

(declare-fun e!235649 () Bool)

(assert (=> d!72899 e!235649))

(declare-fun res!222434 () Bool)

(assert (=> d!72899 (=> (not res!222434) (not e!235649))))

(declare-fun lt!182782 () ListLongMap!5277)

(assert (=> d!72899 (= res!222434 (contains!2423 lt!182782 (_1!3192 lt!182565)))))

(declare-fun lt!182780 () List!6215)

(assert (=> d!72899 (= lt!182782 (ListLongMap!5278 lt!182780))))

(declare-fun lt!182779 () Unit!11885)

(declare-fun lt!182781 () Unit!11885)

(assert (=> d!72899 (= lt!182779 lt!182781)))

(assert (=> d!72899 (= (getValueByKey!357 lt!182780 (_1!3192 lt!182565)) (Some!362 (_2!3192 lt!182565)))))

(assert (=> d!72899 (= lt!182781 (lemmaContainsTupThenGetReturnValue!179 lt!182780 (_1!3192 lt!182565) (_2!3192 lt!182565)))))

(assert (=> d!72899 (= lt!182780 (insertStrictlySorted!182 (toList!2654 (+!1008 lt!182562 lt!182567)) (_1!3192 lt!182565) (_2!3192 lt!182565)))))

(assert (=> d!72899 (= (+!1008 (+!1008 lt!182562 lt!182567) lt!182565) lt!182782)))

(declare-fun b!388927 () Bool)

(declare-fun res!222435 () Bool)

(assert (=> b!388927 (=> (not res!222435) (not e!235649))))

(assert (=> b!388927 (= res!222435 (= (getValueByKey!357 (toList!2654 lt!182782) (_1!3192 lt!182565)) (Some!362 (_2!3192 lt!182565))))))

(declare-fun b!388928 () Bool)

(assert (=> b!388928 (= e!235649 (contains!2424 (toList!2654 lt!182782) lt!182565))))

(assert (= (and d!72899 res!222434) b!388927))

(assert (= (and b!388927 res!222435) b!388928))

(declare-fun m!385223 () Bool)

(assert (=> d!72899 m!385223))

(declare-fun m!385225 () Bool)

(assert (=> d!72899 m!385225))

(declare-fun m!385227 () Bool)

(assert (=> d!72899 m!385227))

(declare-fun m!385229 () Bool)

(assert (=> d!72899 m!385229))

(declare-fun m!385231 () Bool)

(assert (=> b!388927 m!385231))

(declare-fun m!385233 () Bool)

(assert (=> b!388928 m!385233))

(assert (=> b!388637 d!72899))

(declare-fun d!72901 () Bool)

(declare-fun e!235650 () Bool)

(assert (=> d!72901 e!235650))

(declare-fun res!222436 () Bool)

(assert (=> d!72901 (=> (not res!222436) (not e!235650))))

(declare-fun lt!182786 () ListLongMap!5277)

(assert (=> d!72901 (= res!222436 (contains!2423 lt!182786 (_1!3192 lt!182567)))))

(declare-fun lt!182784 () List!6215)

(assert (=> d!72901 (= lt!182786 (ListLongMap!5278 lt!182784))))

(declare-fun lt!182783 () Unit!11885)

(declare-fun lt!182785 () Unit!11885)

(assert (=> d!72901 (= lt!182783 lt!182785)))

(assert (=> d!72901 (= (getValueByKey!357 lt!182784 (_1!3192 lt!182567)) (Some!362 (_2!3192 lt!182567)))))

(assert (=> d!72901 (= lt!182785 (lemmaContainsTupThenGetReturnValue!179 lt!182784 (_1!3192 lt!182567) (_2!3192 lt!182567)))))

(assert (=> d!72901 (= lt!182784 (insertStrictlySorted!182 (toList!2654 lt!182562) (_1!3192 lt!182567) (_2!3192 lt!182567)))))

(assert (=> d!72901 (= (+!1008 lt!182562 lt!182567) lt!182786)))

(declare-fun b!388929 () Bool)

(declare-fun res!222437 () Bool)

(assert (=> b!388929 (=> (not res!222437) (not e!235650))))

(assert (=> b!388929 (= res!222437 (= (getValueByKey!357 (toList!2654 lt!182786) (_1!3192 lt!182567)) (Some!362 (_2!3192 lt!182567))))))

(declare-fun b!388930 () Bool)

(assert (=> b!388930 (= e!235650 (contains!2424 (toList!2654 lt!182786) lt!182567))))

(assert (= (and d!72901 res!222436) b!388929))

(assert (= (and b!388929 res!222437) b!388930))

(declare-fun m!385235 () Bool)

(assert (=> d!72901 m!385235))

(declare-fun m!385237 () Bool)

(assert (=> d!72901 m!385237))

(declare-fun m!385239 () Bool)

(assert (=> d!72901 m!385239))

(declare-fun m!385241 () Bool)

(assert (=> d!72901 m!385241))

(declare-fun m!385243 () Bool)

(assert (=> b!388929 m!385243))

(declare-fun m!385245 () Bool)

(assert (=> b!388930 m!385245))

(assert (=> b!388637 d!72901))

(declare-fun b!388937 () Bool)

(declare-fun e!235656 () Bool)

(assert (=> b!388937 (= e!235656 tp_is_empty!9583)))

(declare-fun mapNonEmpty!15951 () Bool)

(declare-fun mapRes!15951 () Bool)

(declare-fun tp!31503 () Bool)

(assert (=> mapNonEmpty!15951 (= mapRes!15951 (and tp!31503 e!235656))))

(declare-fun mapValue!15951 () ValueCell!4448)

(declare-fun mapRest!15951 () (Array (_ BitVec 32) ValueCell!4448))

(declare-fun mapKey!15951 () (_ BitVec 32))

(assert (=> mapNonEmpty!15951 (= mapRest!15942 (store mapRest!15951 mapKey!15951 mapValue!15951))))

(declare-fun condMapEmpty!15951 () Bool)

(declare-fun mapDefault!15951 () ValueCell!4448)

(assert (=> mapNonEmpty!15942 (= condMapEmpty!15951 (= mapRest!15942 ((as const (Array (_ BitVec 32) ValueCell!4448)) mapDefault!15951)))))

(declare-fun e!235655 () Bool)

(assert (=> mapNonEmpty!15942 (= tp!31488 (and e!235655 mapRes!15951))))

(declare-fun b!388938 () Bool)

(assert (=> b!388938 (= e!235655 tp_is_empty!9583)))

(declare-fun mapIsEmpty!15951 () Bool)

(assert (=> mapIsEmpty!15951 mapRes!15951))

(assert (= (and mapNonEmpty!15942 condMapEmpty!15951) mapIsEmpty!15951))

(assert (= (and mapNonEmpty!15942 (not condMapEmpty!15951)) mapNonEmpty!15951))

(assert (= (and mapNonEmpty!15951 ((_ is ValueCellFull!4448) mapValue!15951)) b!388937))

(assert (= (and mapNonEmpty!15942 ((_ is ValueCellFull!4448) mapDefault!15951)) b!388938))

(declare-fun m!385247 () Bool)

(assert (=> mapNonEmpty!15951 m!385247))

(declare-fun b_lambda!8585 () Bool)

(assert (= b_lambda!8579 (or (and start!37816 b_free!8911) b_lambda!8585)))

(declare-fun b_lambda!8587 () Bool)

(assert (= b_lambda!8575 (or (and start!37816 b_free!8911) b_lambda!8587)))

(declare-fun b_lambda!8589 () Bool)

(assert (= b_lambda!8577 (or (and start!37816 b_free!8911) b_lambda!8589)))

(declare-fun b_lambda!8591 () Bool)

(assert (= b_lambda!8583 (or (and start!37816 b_free!8911) b_lambda!8591)))

(declare-fun b_lambda!8593 () Bool)

(assert (= b_lambda!8573 (or (and start!37816 b_free!8911) b_lambda!8593)))

(declare-fun b_lambda!8595 () Bool)

(assert (= b_lambda!8581 (or (and start!37816 b_free!8911) b_lambda!8595)))

(check-sat (not d!72887) (not b!388882) (not mapNonEmpty!15951) (not b!388769) (not d!72899) (not b!388866) (not d!72901) (not bm!27383) (not b_lambda!8593) (not b!388926) (not b!388758) (not b!388861) (not b_lambda!8587) (not b!388767) (not b!388888) (not b!388907) (not b!388919) (not b!388892) tp_is_empty!9583 (not b_next!8911) (not d!72889) (not bm!27381) (not bm!27376) (not b!388803) (not b!388894) (not b!388923) (not b!388775) (not b!388887) (not b!388916) (not b_lambda!8591) (not bm!27344) (not d!72891) (not b!388891) (not b!388876) (not b!388925) (not b!388897) (not b!388918) (not b!388764) (not b!388744) (not b!388746) (not bm!27368) (not b!388871) (not bm!27345) (not b_lambda!8585) (not b!388912) (not b!388893) (not b!388867) (not b!388743) (not b!388909) (not bm!27375) (not b!388924) (not b_lambda!8595) (not b!388928) (not b!388755) (not b!388809) (not b!388766) (not b!388800) (not b!388801) (not d!72883) (not b!388807) (not b!388905) (not b!388929) (not bm!27384) (not bm!27364) (not bm!27341) (not bm!27370) (not b!388873) (not b!388802) (not b!388872) (not b!388811) (not b!388922) (not bm!27382) (not b!388870) (not bm!27348) (not bm!27363) (not b!388914) (not b!388910) (not d!72885) (not bm!27371) (not b!388774) (not b!388908) (not d!72895) (not b!388930) (not b!388805) (not d!72897) (not b!388927) b_and!16195 (not d!72881) (not bm!27369) (not b_lambda!8589))
(check-sat b_and!16195 (not b_next!8911))
