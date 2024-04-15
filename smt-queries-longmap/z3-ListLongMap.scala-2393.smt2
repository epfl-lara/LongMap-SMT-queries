; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37850 () Bool)

(assert start!37850)

(declare-fun b_free!8923 () Bool)

(declare-fun b_next!8923 () Bool)

(assert (=> start!37850 (= b_free!8923 (not b_next!8923))))

(declare-fun tp!31526 () Bool)

(declare-fun b_and!16163 () Bool)

(assert (=> start!37850 (= tp!31526 b_and!16163)))

(declare-fun b!388884 () Bool)

(declare-fun res!222458 () Bool)

(declare-fun e!235606 () Bool)

(assert (=> b!388884 (=> (not res!222458) (not e!235606))))

(declare-datatypes ((array!23073 0))(
  ( (array!23074 (arr!11003 (Array (_ BitVec 32) (_ BitVec 64))) (size!11356 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23073)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!388884 (= res!222458 (or (= (select (arr!11003 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11003 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15963 () Bool)

(declare-fun mapRes!15963 () Bool)

(assert (=> mapIsEmpty!15963 mapRes!15963))

(declare-fun b!388885 () Bool)

(declare-fun e!235610 () Bool)

(declare-fun e!235604 () Bool)

(assert (=> b!388885 (= e!235610 (not e!235604))))

(declare-fun res!222457 () Bool)

(assert (=> b!388885 (=> res!222457 e!235604)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388885 (= res!222457 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13899 0))(
  ( (V!13900 (val!4842 Int)) )
))
(declare-datatypes ((ValueCell!4454 0))(
  ( (ValueCellFull!4454 (v!7041 V!13899)) (EmptyCell!4454) )
))
(declare-datatypes ((array!23075 0))(
  ( (array!23076 (arr!11004 (Array (_ BitVec 32) ValueCell!4454)) (size!11357 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23075)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6488 0))(
  ( (tuple2!6489 (_1!3255 (_ BitVec 64)) (_2!3255 V!13899)) )
))
(declare-datatypes ((List!6333 0))(
  ( (Nil!6330) (Cons!6329 (h!7185 tuple2!6488) (t!11478 List!6333)) )
))
(declare-datatypes ((ListLongMap!5391 0))(
  ( (ListLongMap!5392 (toList!2711 List!6333)) )
))
(declare-fun lt!182652 () ListLongMap!5391)

(declare-fun zeroValue!472 () V!13899)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13899)

(declare-fun getCurrentListMap!2039 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) Int) ListLongMap!5391)

(assert (=> b!388885 (= lt!182652 (getCurrentListMap!2039 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182650 () ListLongMap!5391)

(declare-fun lt!182647 () array!23073)

(declare-fun lt!182648 () array!23075)

(assert (=> b!388885 (= lt!182650 (getCurrentListMap!2039 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182653 () ListLongMap!5391)

(declare-fun lt!182649 () ListLongMap!5391)

(assert (=> b!388885 (and (= lt!182653 lt!182649) (= lt!182649 lt!182653))))

(declare-fun v!373 () V!13899)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!182645 () ListLongMap!5391)

(declare-fun +!1031 (ListLongMap!5391 tuple2!6488) ListLongMap!5391)

(assert (=> b!388885 (= lt!182649 (+!1031 lt!182645 (tuple2!6489 k0!778 v!373)))))

(declare-datatypes ((Unit!11904 0))(
  ( (Unit!11905) )
))
(declare-fun lt!182646 () Unit!11904)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!240 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) (_ BitVec 64) V!13899 (_ BitVec 32) Int) Unit!11904)

(assert (=> b!388885 (= lt!182646 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!240 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!949 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) Int) ListLongMap!5391)

(assert (=> b!388885 (= lt!182653 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388885 (= lt!182648 (array!23076 (store (arr!11004 _values!506) i!548 (ValueCellFull!4454 v!373)) (size!11357 _values!506)))))

(assert (=> b!388885 (= lt!182645 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388886 () Bool)

(declare-fun e!235608 () Bool)

(declare-fun tp_is_empty!9595 () Bool)

(assert (=> b!388886 (= e!235608 tp_is_empty!9595)))

(declare-fun b!388887 () Bool)

(declare-fun res!222452 () Bool)

(assert (=> b!388887 (=> (not res!222452) (not e!235606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23073 (_ BitVec 32)) Bool)

(assert (=> b!388887 (= res!222452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!388888 () Bool)

(declare-fun e!235609 () Bool)

(assert (=> b!388888 (= e!235609 tp_is_empty!9595)))

(declare-fun lt!182644 () tuple2!6488)

(declare-fun lt!182651 () tuple2!6488)

(declare-fun b!388889 () Bool)

(declare-fun e!235603 () Bool)

(assert (=> b!388889 (= e!235603 (= lt!182650 (+!1031 (+!1031 lt!182649 lt!182644) lt!182651)))))

(declare-fun b!388890 () Bool)

(declare-fun res!222449 () Bool)

(assert (=> b!388890 (=> (not res!222449) (not e!235606))))

(declare-fun arrayContainsKey!0 (array!23073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388890 (= res!222449 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388891 () Bool)

(declare-fun e!235607 () Bool)

(assert (=> b!388891 (= e!235607 (and e!235609 mapRes!15963))))

(declare-fun condMapEmpty!15963 () Bool)

(declare-fun mapDefault!15963 () ValueCell!4454)

(assert (=> b!388891 (= condMapEmpty!15963 (= (arr!11004 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4454)) mapDefault!15963)))))

(declare-fun b!388892 () Bool)

(declare-fun res!222455 () Bool)

(assert (=> b!388892 (=> (not res!222455) (not e!235606))))

(assert (=> b!388892 (= res!222455 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11356 _keys!658))))))

(declare-fun b!388893 () Bool)

(declare-fun res!222447 () Bool)

(assert (=> b!388893 (=> (not res!222447) (not e!235606))))

(declare-datatypes ((List!6334 0))(
  ( (Nil!6331) (Cons!6330 (h!7186 (_ BitVec 64)) (t!11479 List!6334)) )
))
(declare-fun arrayNoDuplicates!0 (array!23073 (_ BitVec 32) List!6334) Bool)

(assert (=> b!388893 (= res!222447 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6331))))

(declare-fun b!388894 () Bool)

(declare-fun res!222456 () Bool)

(assert (=> b!388894 (=> (not res!222456) (not e!235603))))

(assert (=> b!388894 (= res!222456 (= lt!182652 (+!1031 (+!1031 lt!182645 lt!182644) lt!182651)))))

(declare-fun mapNonEmpty!15963 () Bool)

(declare-fun tp!31527 () Bool)

(assert (=> mapNonEmpty!15963 (= mapRes!15963 (and tp!31527 e!235608))))

(declare-fun mapKey!15963 () (_ BitVec 32))

(declare-fun mapValue!15963 () ValueCell!4454)

(declare-fun mapRest!15963 () (Array (_ BitVec 32) ValueCell!4454))

(assert (=> mapNonEmpty!15963 (= (arr!11004 _values!506) (store mapRest!15963 mapKey!15963 mapValue!15963))))

(declare-fun res!222448 () Bool)

(assert (=> start!37850 (=> (not res!222448) (not e!235606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37850 (= res!222448 (validMask!0 mask!970))))

(assert (=> start!37850 e!235606))

(declare-fun array_inv!8090 (array!23075) Bool)

(assert (=> start!37850 (and (array_inv!8090 _values!506) e!235607)))

(assert (=> start!37850 tp!31526))

(assert (=> start!37850 true))

(assert (=> start!37850 tp_is_empty!9595))

(declare-fun array_inv!8091 (array!23073) Bool)

(assert (=> start!37850 (array_inv!8091 _keys!658)))

(declare-fun b!388895 () Bool)

(declare-fun res!222451 () Bool)

(assert (=> b!388895 (=> (not res!222451) (not e!235610))))

(assert (=> b!388895 (= res!222451 (arrayNoDuplicates!0 lt!182647 #b00000000000000000000000000000000 Nil!6331))))

(declare-fun b!388896 () Bool)

(declare-fun res!222446 () Bool)

(assert (=> b!388896 (=> (not res!222446) (not e!235606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388896 (= res!222446 (validKeyInArray!0 k0!778))))

(declare-fun b!388897 () Bool)

(assert (=> b!388897 (= e!235606 e!235610)))

(declare-fun res!222450 () Bool)

(assert (=> b!388897 (=> (not res!222450) (not e!235610))))

(assert (=> b!388897 (= res!222450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182647 mask!970))))

(assert (=> b!388897 (= lt!182647 (array!23074 (store (arr!11003 _keys!658) i!548 k0!778) (size!11356 _keys!658)))))

(declare-fun b!388898 () Bool)

(assert (=> b!388898 (= e!235604 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388898 e!235603))

(declare-fun res!222453 () Bool)

(assert (=> b!388898 (=> (not res!222453) (not e!235603))))

(assert (=> b!388898 (= res!222453 (= lt!182650 (+!1031 (+!1031 lt!182653 lt!182644) lt!182651)))))

(assert (=> b!388898 (= lt!182651 (tuple2!6489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!388898 (= lt!182644 (tuple2!6489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!388899 () Bool)

(declare-fun res!222454 () Bool)

(assert (=> b!388899 (=> (not res!222454) (not e!235606))))

(assert (=> b!388899 (= res!222454 (and (= (size!11357 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11356 _keys!658) (size!11357 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37850 res!222448) b!388899))

(assert (= (and b!388899 res!222454) b!388887))

(assert (= (and b!388887 res!222452) b!388893))

(assert (= (and b!388893 res!222447) b!388892))

(assert (= (and b!388892 res!222455) b!388896))

(assert (= (and b!388896 res!222446) b!388884))

(assert (= (and b!388884 res!222458) b!388890))

(assert (= (and b!388890 res!222449) b!388897))

(assert (= (and b!388897 res!222450) b!388895))

(assert (= (and b!388895 res!222451) b!388885))

(assert (= (and b!388885 (not res!222457)) b!388898))

(assert (= (and b!388898 res!222453) b!388894))

(assert (= (and b!388894 res!222456) b!388889))

(assert (= (and b!388891 condMapEmpty!15963) mapIsEmpty!15963))

(assert (= (and b!388891 (not condMapEmpty!15963)) mapNonEmpty!15963))

(get-info :version)

(assert (= (and mapNonEmpty!15963 ((_ is ValueCellFull!4454) mapValue!15963)) b!388886))

(assert (= (and b!388891 ((_ is ValueCellFull!4454) mapDefault!15963)) b!388888))

(assert (= start!37850 b!388891))

(declare-fun m!384445 () Bool)

(assert (=> b!388884 m!384445))

(declare-fun m!384447 () Bool)

(assert (=> b!388898 m!384447))

(assert (=> b!388898 m!384447))

(declare-fun m!384449 () Bool)

(assert (=> b!388898 m!384449))

(declare-fun m!384451 () Bool)

(assert (=> b!388890 m!384451))

(declare-fun m!384453 () Bool)

(assert (=> b!388889 m!384453))

(assert (=> b!388889 m!384453))

(declare-fun m!384455 () Bool)

(assert (=> b!388889 m!384455))

(declare-fun m!384457 () Bool)

(assert (=> b!388896 m!384457))

(declare-fun m!384459 () Bool)

(assert (=> b!388897 m!384459))

(declare-fun m!384461 () Bool)

(assert (=> b!388897 m!384461))

(declare-fun m!384463 () Bool)

(assert (=> b!388885 m!384463))

(declare-fun m!384465 () Bool)

(assert (=> b!388885 m!384465))

(declare-fun m!384467 () Bool)

(assert (=> b!388885 m!384467))

(declare-fun m!384469 () Bool)

(assert (=> b!388885 m!384469))

(declare-fun m!384471 () Bool)

(assert (=> b!388885 m!384471))

(declare-fun m!384473 () Bool)

(assert (=> b!388885 m!384473))

(declare-fun m!384475 () Bool)

(assert (=> b!388885 m!384475))

(declare-fun m!384477 () Bool)

(assert (=> b!388894 m!384477))

(assert (=> b!388894 m!384477))

(declare-fun m!384479 () Bool)

(assert (=> b!388894 m!384479))

(declare-fun m!384481 () Bool)

(assert (=> b!388893 m!384481))

(declare-fun m!384483 () Bool)

(assert (=> b!388887 m!384483))

(declare-fun m!384485 () Bool)

(assert (=> mapNonEmpty!15963 m!384485))

(declare-fun m!384487 () Bool)

(assert (=> b!388895 m!384487))

(declare-fun m!384489 () Bool)

(assert (=> start!37850 m!384489))

(declare-fun m!384491 () Bool)

(assert (=> start!37850 m!384491))

(declare-fun m!384493 () Bool)

(assert (=> start!37850 m!384493))

(check-sat (not b!388887) (not b!388895) (not b!388894) (not b!388885) (not b!388896) tp_is_empty!9595 (not start!37850) (not b!388897) b_and!16163 (not b!388889) (not b!388890) (not b_next!8923) (not mapNonEmpty!15963) (not b!388898) (not b!388893))
(check-sat b_and!16163 (not b_next!8923))
(get-model)

(declare-fun b!389020 () Bool)

(declare-fun e!235677 () Bool)

(declare-fun e!235676 () Bool)

(assert (=> b!389020 (= e!235677 e!235676)))

(declare-fun c!53965 () Bool)

(assert (=> b!389020 (= c!53965 (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun d!72673 () Bool)

(declare-fun e!235678 () Bool)

(assert (=> d!72673 e!235678))

(declare-fun res!222547 () Bool)

(assert (=> d!72673 (=> (not res!222547) (not e!235678))))

(declare-fun lt!182733 () ListLongMap!5391)

(declare-fun contains!2436 (ListLongMap!5391 (_ BitVec 64)) Bool)

(assert (=> d!72673 (= res!222547 (not (contains!2436 lt!182733 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235674 () ListLongMap!5391)

(assert (=> d!72673 (= lt!182733 e!235674)))

(declare-fun c!53964 () Bool)

(assert (=> d!72673 (= c!53964 (bvsge #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(assert (=> d!72673 (validMask!0 mask!970)))

(assert (=> d!72673 (= (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182733)))

(declare-fun b!389021 () Bool)

(declare-fun res!222546 () Bool)

(assert (=> b!389021 (=> (not res!222546) (not e!235678))))

(assert (=> b!389021 (= res!222546 (not (contains!2436 lt!182733 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389022 () Bool)

(assert (=> b!389022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(assert (=> b!389022 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11357 _values!506)))))

(declare-fun e!235679 () Bool)

(declare-fun apply!299 (ListLongMap!5391 (_ BitVec 64)) V!13899)

(declare-fun get!5565 (ValueCell!4454 V!13899) V!13899)

(declare-fun dynLambda!633 (Int (_ BitVec 64)) V!13899)

(assert (=> b!389022 (= e!235679 (= (apply!299 lt!182733 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)) (get!5565 (select (arr!11004 _values!506) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389023 () Bool)

(declare-fun lt!182730 () Unit!11904)

(declare-fun lt!182729 () Unit!11904)

(assert (=> b!389023 (= lt!182730 lt!182729)))

(declare-fun lt!182734 () (_ BitVec 64))

(declare-fun lt!182731 () V!13899)

(declare-fun lt!182732 () ListLongMap!5391)

(declare-fun lt!182728 () (_ BitVec 64))

(assert (=> b!389023 (not (contains!2436 (+!1031 lt!182732 (tuple2!6489 lt!182734 lt!182731)) lt!182728))))

(declare-fun addStillNotContains!133 (ListLongMap!5391 (_ BitVec 64) V!13899 (_ BitVec 64)) Unit!11904)

(assert (=> b!389023 (= lt!182729 (addStillNotContains!133 lt!182732 lt!182734 lt!182731 lt!182728))))

(assert (=> b!389023 (= lt!182728 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389023 (= lt!182731 (get!5565 (select (arr!11004 _values!506) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389023 (= lt!182734 (select (arr!11003 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27378 () ListLongMap!5391)

(assert (=> b!389023 (= lt!182732 call!27378)))

(declare-fun e!235673 () ListLongMap!5391)

(assert (=> b!389023 (= e!235673 (+!1031 call!27378 (tuple2!6489 (select (arr!11003 _keys!658) #b00000000000000000000000000000000) (get!5565 (select (arr!11004 _values!506) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27375 () Bool)

(assert (=> bm!27375 (= call!27378 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389024 () Bool)

(assert (=> b!389024 (= e!235676 (= lt!182733 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!389025 () Bool)

(assert (=> b!389025 (= e!235674 (ListLongMap!5392 Nil!6330))))

(declare-fun b!389026 () Bool)

(assert (=> b!389026 (= e!235677 e!235679)))

(assert (=> b!389026 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun res!222548 () Bool)

(assert (=> b!389026 (= res!222548 (contains!2436 lt!182733 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389026 (=> (not res!222548) (not e!235679))))

(declare-fun b!389027 () Bool)

(assert (=> b!389027 (= e!235674 e!235673)))

(declare-fun c!53966 () Bool)

(assert (=> b!389027 (= c!53966 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389028 () Bool)

(assert (=> b!389028 (= e!235678 e!235677)))

(declare-fun c!53967 () Bool)

(declare-fun e!235675 () Bool)

(assert (=> b!389028 (= c!53967 e!235675)))

(declare-fun res!222545 () Bool)

(assert (=> b!389028 (=> (not res!222545) (not e!235675))))

(assert (=> b!389028 (= res!222545 (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun b!389029 () Bool)

(assert (=> b!389029 (= e!235673 call!27378)))

(declare-fun b!389030 () Bool)

(assert (=> b!389030 (= e!235675 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389030 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389031 () Bool)

(declare-fun isEmpty!549 (ListLongMap!5391) Bool)

(assert (=> b!389031 (= e!235676 (isEmpty!549 lt!182733))))

(assert (= (and d!72673 c!53964) b!389025))

(assert (= (and d!72673 (not c!53964)) b!389027))

(assert (= (and b!389027 c!53966) b!389023))

(assert (= (and b!389027 (not c!53966)) b!389029))

(assert (= (or b!389023 b!389029) bm!27375))

(assert (= (and d!72673 res!222547) b!389021))

(assert (= (and b!389021 res!222546) b!389028))

(assert (= (and b!389028 res!222545) b!389030))

(assert (= (and b!389028 c!53967) b!389026))

(assert (= (and b!389028 (not c!53967)) b!389020))

(assert (= (and b!389026 res!222548) b!389022))

(assert (= (and b!389020 c!53965) b!389024))

(assert (= (and b!389020 (not c!53965)) b!389031))

(declare-fun b_lambda!8557 () Bool)

(assert (=> (not b_lambda!8557) (not b!389022)))

(declare-fun t!11484 () Bool)

(declare-fun tb!3105 () Bool)

(assert (=> (and start!37850 (= defaultEntry!514 defaultEntry!514) t!11484) tb!3105))

(declare-fun result!5711 () Bool)

(assert (=> tb!3105 (= result!5711 tp_is_empty!9595)))

(assert (=> b!389022 t!11484))

(declare-fun b_and!16169 () Bool)

(assert (= b_and!16163 (and (=> t!11484 result!5711) b_and!16169)))

(declare-fun b_lambda!8559 () Bool)

(assert (=> (not b_lambda!8559) (not b!389023)))

(assert (=> b!389023 t!11484))

(declare-fun b_and!16171 () Bool)

(assert (= b_and!16169 (and (=> t!11484 result!5711) b_and!16171)))

(declare-fun m!384595 () Bool)

(assert (=> b!389024 m!384595))

(declare-fun m!384597 () Bool)

(assert (=> b!389022 m!384597))

(declare-fun m!384599 () Bool)

(assert (=> b!389022 m!384599))

(assert (=> b!389022 m!384597))

(declare-fun m!384601 () Bool)

(assert (=> b!389022 m!384601))

(declare-fun m!384603 () Bool)

(assert (=> b!389022 m!384603))

(assert (=> b!389022 m!384599))

(declare-fun m!384605 () Bool)

(assert (=> b!389022 m!384605))

(assert (=> b!389022 m!384601))

(assert (=> bm!27375 m!384595))

(declare-fun m!384607 () Bool)

(assert (=> b!389023 m!384607))

(assert (=> b!389023 m!384597))

(assert (=> b!389023 m!384601))

(assert (=> b!389023 m!384603))

(assert (=> b!389023 m!384601))

(declare-fun m!384609 () Bool)

(assert (=> b!389023 m!384609))

(declare-fun m!384611 () Bool)

(assert (=> b!389023 m!384611))

(assert (=> b!389023 m!384597))

(assert (=> b!389023 m!384607))

(declare-fun m!384613 () Bool)

(assert (=> b!389023 m!384613))

(assert (=> b!389023 m!384599))

(assert (=> b!389030 m!384599))

(assert (=> b!389030 m!384599))

(declare-fun m!384615 () Bool)

(assert (=> b!389030 m!384615))

(declare-fun m!384617 () Bool)

(assert (=> b!389021 m!384617))

(declare-fun m!384619 () Bool)

(assert (=> b!389031 m!384619))

(assert (=> b!389026 m!384599))

(assert (=> b!389026 m!384599))

(declare-fun m!384621 () Bool)

(assert (=> b!389026 m!384621))

(assert (=> b!389027 m!384599))

(assert (=> b!389027 m!384599))

(assert (=> b!389027 m!384615))

(declare-fun m!384623 () Bool)

(assert (=> d!72673 m!384623))

(assert (=> d!72673 m!384489))

(assert (=> b!388885 d!72673))

(declare-fun call!27399 () ListLongMap!5391)

(declare-fun bm!27390 () Bool)

(declare-fun call!27396 () ListLongMap!5391)

(declare-fun c!53980 () Bool)

(declare-fun call!27393 () ListLongMap!5391)

(declare-fun call!27395 () ListLongMap!5391)

(declare-fun c!53983 () Bool)

(assert (=> bm!27390 (= call!27393 (+!1031 (ite c!53983 call!27395 (ite c!53980 call!27399 call!27396)) (ite (or c!53983 c!53980) (tuple2!6489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389076 () Bool)

(declare-fun e!235709 () Bool)

(declare-fun e!235716 () Bool)

(assert (=> b!389076 (= e!235709 e!235716)))

(declare-fun res!222569 () Bool)

(declare-fun call!27398 () Bool)

(assert (=> b!389076 (= res!222569 call!27398)))

(assert (=> b!389076 (=> (not res!222569) (not e!235716))))

(declare-fun b!389077 () Bool)

(declare-fun c!53985 () Bool)

(assert (=> b!389077 (= c!53985 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235711 () ListLongMap!5391)

(declare-fun e!235717 () ListLongMap!5391)

(assert (=> b!389077 (= e!235711 e!235717)))

(declare-fun b!389078 () Bool)

(declare-fun e!235706 () Bool)

(declare-fun e!235708 () Bool)

(assert (=> b!389078 (= e!235706 e!235708)))

(declare-fun res!222568 () Bool)

(assert (=> b!389078 (=> (not res!222568) (not e!235708))))

(declare-fun lt!182779 () ListLongMap!5391)

(assert (=> b!389078 (= res!222568 (contains!2436 lt!182779 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389078 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun bm!27391 () Bool)

(assert (=> bm!27391 (= call!27396 call!27399)))

(declare-fun b!389079 () Bool)

(declare-fun e!235713 () Unit!11904)

(declare-fun lt!182794 () Unit!11904)

(assert (=> b!389079 (= e!235713 lt!182794)))

(declare-fun lt!182797 () ListLongMap!5391)

(assert (=> b!389079 (= lt!182797 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182783 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182783 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182800 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182800 (select (arr!11003 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182796 () Unit!11904)

(declare-fun addStillContains!275 (ListLongMap!5391 (_ BitVec 64) V!13899 (_ BitVec 64)) Unit!11904)

(assert (=> b!389079 (= lt!182796 (addStillContains!275 lt!182797 lt!182783 zeroValue!472 lt!182800))))

(assert (=> b!389079 (contains!2436 (+!1031 lt!182797 (tuple2!6489 lt!182783 zeroValue!472)) lt!182800)))

(declare-fun lt!182782 () Unit!11904)

(assert (=> b!389079 (= lt!182782 lt!182796)))

(declare-fun lt!182781 () ListLongMap!5391)

(assert (=> b!389079 (= lt!182781 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182798 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182798 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182792 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182792 (select (arr!11003 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182786 () Unit!11904)

(declare-fun addApplyDifferent!275 (ListLongMap!5391 (_ BitVec 64) V!13899 (_ BitVec 64)) Unit!11904)

(assert (=> b!389079 (= lt!182786 (addApplyDifferent!275 lt!182781 lt!182798 minValue!472 lt!182792))))

(assert (=> b!389079 (= (apply!299 (+!1031 lt!182781 (tuple2!6489 lt!182798 minValue!472)) lt!182792) (apply!299 lt!182781 lt!182792))))

(declare-fun lt!182787 () Unit!11904)

(assert (=> b!389079 (= lt!182787 lt!182786)))

(declare-fun lt!182795 () ListLongMap!5391)

(assert (=> b!389079 (= lt!182795 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182788 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182790 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182790 (select (arr!11003 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182784 () Unit!11904)

(assert (=> b!389079 (= lt!182784 (addApplyDifferent!275 lt!182795 lt!182788 zeroValue!472 lt!182790))))

(assert (=> b!389079 (= (apply!299 (+!1031 lt!182795 (tuple2!6489 lt!182788 zeroValue!472)) lt!182790) (apply!299 lt!182795 lt!182790))))

(declare-fun lt!182780 () Unit!11904)

(assert (=> b!389079 (= lt!182780 lt!182784)))

(declare-fun lt!182789 () ListLongMap!5391)

(assert (=> b!389079 (= lt!182789 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182799 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182799 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182793 () (_ BitVec 64))

(assert (=> b!389079 (= lt!182793 (select (arr!11003 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389079 (= lt!182794 (addApplyDifferent!275 lt!182789 lt!182799 minValue!472 lt!182793))))

(assert (=> b!389079 (= (apply!299 (+!1031 lt!182789 (tuple2!6489 lt!182799 minValue!472)) lt!182793) (apply!299 lt!182789 lt!182793))))

(declare-fun b!389080 () Bool)

(assert (=> b!389080 (= e!235716 (= (apply!299 lt!182779 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27392 () Bool)

(assert (=> bm!27392 (= call!27399 call!27395)))

(declare-fun b!389081 () Bool)

(declare-fun e!235710 () Bool)

(declare-fun e!235712 () Bool)

(assert (=> b!389081 (= e!235710 e!235712)))

(declare-fun res!222574 () Bool)

(declare-fun call!27394 () Bool)

(assert (=> b!389081 (= res!222574 call!27394)))

(assert (=> b!389081 (=> (not res!222574) (not e!235712))))

(declare-fun b!389082 () Bool)

(declare-fun call!27397 () ListLongMap!5391)

(assert (=> b!389082 (= e!235717 call!27397)))

(declare-fun b!389083 () Bool)

(assert (=> b!389083 (= e!235708 (= (apply!299 lt!182779 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)) (get!5565 (select (arr!11004 _values!506) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11357 _values!506)))))

(assert (=> b!389083 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun b!389084 () Bool)

(declare-fun e!235707 () Bool)

(assert (=> b!389084 (= e!235707 e!235710)))

(declare-fun c!53984 () Bool)

(assert (=> b!389084 (= c!53984 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389085 () Bool)

(assert (=> b!389085 (= e!235709 (not call!27398))))

(declare-fun d!72675 () Bool)

(assert (=> d!72675 e!235707))

(declare-fun res!222572 () Bool)

(assert (=> d!72675 (=> (not res!222572) (not e!235707))))

(assert (=> d!72675 (= res!222572 (or (bvsge #b00000000000000000000000000000000 (size!11356 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))))

(declare-fun lt!182785 () ListLongMap!5391)

(assert (=> d!72675 (= lt!182779 lt!182785)))

(declare-fun lt!182791 () Unit!11904)

(assert (=> d!72675 (= lt!182791 e!235713)))

(declare-fun c!53981 () Bool)

(declare-fun e!235715 () Bool)

(assert (=> d!72675 (= c!53981 e!235715)))

(declare-fun res!222573 () Bool)

(assert (=> d!72675 (=> (not res!222573) (not e!235715))))

(assert (=> d!72675 (= res!222573 (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun e!235714 () ListLongMap!5391)

(assert (=> d!72675 (= lt!182785 e!235714)))

(assert (=> d!72675 (= c!53983 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72675 (validMask!0 mask!970)))

(assert (=> d!72675 (= (getCurrentListMap!2039 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182779)))

(declare-fun b!389086 () Bool)

(declare-fun e!235718 () Bool)

(assert (=> b!389086 (= e!235718 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389087 () Bool)

(assert (=> b!389087 (= e!235714 (+!1031 call!27393 (tuple2!6489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!389088 () Bool)

(declare-fun res!222571 () Bool)

(assert (=> b!389088 (=> (not res!222571) (not e!235707))))

(assert (=> b!389088 (= res!222571 e!235706)))

(declare-fun res!222570 () Bool)

(assert (=> b!389088 (=> res!222570 e!235706)))

(assert (=> b!389088 (= res!222570 (not e!235718))))

(declare-fun res!222567 () Bool)

(assert (=> b!389088 (=> (not res!222567) (not e!235718))))

(assert (=> b!389088 (= res!222567 (bvslt #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(declare-fun b!389089 () Bool)

(assert (=> b!389089 (= e!235711 call!27397)))

(declare-fun b!389090 () Bool)

(assert (=> b!389090 (= e!235715 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389091 () Bool)

(declare-fun res!222575 () Bool)

(assert (=> b!389091 (=> (not res!222575) (not e!235707))))

(assert (=> b!389091 (= res!222575 e!235709)))

(declare-fun c!53982 () Bool)

(assert (=> b!389091 (= c!53982 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389092 () Bool)

(assert (=> b!389092 (= e!235712 (= (apply!299 lt!182779 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27393 () Bool)

(assert (=> bm!27393 (= call!27395 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27394 () Bool)

(assert (=> bm!27394 (= call!27398 (contains!2436 lt!182779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389093 () Bool)

(assert (=> b!389093 (= e!235714 e!235711)))

(assert (=> b!389093 (= c!53980 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389094 () Bool)

(declare-fun Unit!11908 () Unit!11904)

(assert (=> b!389094 (= e!235713 Unit!11908)))

(declare-fun bm!27395 () Bool)

(assert (=> bm!27395 (= call!27397 call!27393)))

(declare-fun b!389095 () Bool)

(assert (=> b!389095 (= e!235710 (not call!27394))))

(declare-fun b!389096 () Bool)

(assert (=> b!389096 (= e!235717 call!27396)))

(declare-fun bm!27396 () Bool)

(assert (=> bm!27396 (= call!27394 (contains!2436 lt!182779 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72675 c!53983) b!389087))

(assert (= (and d!72675 (not c!53983)) b!389093))

(assert (= (and b!389093 c!53980) b!389089))

(assert (= (and b!389093 (not c!53980)) b!389077))

(assert (= (and b!389077 c!53985) b!389082))

(assert (= (and b!389077 (not c!53985)) b!389096))

(assert (= (or b!389082 b!389096) bm!27391))

(assert (= (or b!389089 bm!27391) bm!27392))

(assert (= (or b!389089 b!389082) bm!27395))

(assert (= (or b!389087 bm!27392) bm!27393))

(assert (= (or b!389087 bm!27395) bm!27390))

(assert (= (and d!72675 res!222573) b!389090))

(assert (= (and d!72675 c!53981) b!389079))

(assert (= (and d!72675 (not c!53981)) b!389094))

(assert (= (and d!72675 res!222572) b!389088))

(assert (= (and b!389088 res!222567) b!389086))

(assert (= (and b!389088 (not res!222570)) b!389078))

(assert (= (and b!389078 res!222568) b!389083))

(assert (= (and b!389088 res!222571) b!389091))

(assert (= (and b!389091 c!53982) b!389076))

(assert (= (and b!389091 (not c!53982)) b!389085))

(assert (= (and b!389076 res!222569) b!389080))

(assert (= (or b!389076 b!389085) bm!27394))

(assert (= (and b!389091 res!222575) b!389084))

(assert (= (and b!389084 c!53984) b!389081))

(assert (= (and b!389084 (not c!53984)) b!389095))

(assert (= (and b!389081 res!222574) b!389092))

(assert (= (or b!389081 b!389095) bm!27396))

(declare-fun b_lambda!8561 () Bool)

(assert (=> (not b_lambda!8561) (not b!389083)))

(assert (=> b!389083 t!11484))

(declare-fun b_and!16173 () Bool)

(assert (= b_and!16171 (and (=> t!11484 result!5711) b_and!16173)))

(assert (=> b!389078 m!384599))

(assert (=> b!389078 m!384599))

(declare-fun m!384625 () Bool)

(assert (=> b!389078 m!384625))

(assert (=> b!389086 m!384599))

(assert (=> b!389086 m!384599))

(assert (=> b!389086 m!384615))

(assert (=> d!72675 m!384489))

(assert (=> b!389083 m!384597))

(assert (=> b!389083 m!384599))

(assert (=> b!389083 m!384601))

(assert (=> b!389083 m!384597))

(assert (=> b!389083 m!384601))

(assert (=> b!389083 m!384603))

(assert (=> b!389083 m!384599))

(declare-fun m!384627 () Bool)

(assert (=> b!389083 m!384627))

(declare-fun m!384629 () Bool)

(assert (=> b!389087 m!384629))

(declare-fun m!384631 () Bool)

(assert (=> b!389080 m!384631))

(declare-fun m!384633 () Bool)

(assert (=> bm!27396 m!384633))

(declare-fun m!384635 () Bool)

(assert (=> bm!27390 m!384635))

(declare-fun m!384637 () Bool)

(assert (=> b!389092 m!384637))

(assert (=> bm!27393 m!384463))

(declare-fun m!384639 () Bool)

(assert (=> bm!27394 m!384639))

(declare-fun m!384641 () Bool)

(assert (=> b!389079 m!384641))

(declare-fun m!384643 () Bool)

(assert (=> b!389079 m!384643))

(declare-fun m!384645 () Bool)

(assert (=> b!389079 m!384645))

(declare-fun m!384647 () Bool)

(assert (=> b!389079 m!384647))

(declare-fun m!384649 () Bool)

(assert (=> b!389079 m!384649))

(declare-fun m!384651 () Bool)

(assert (=> b!389079 m!384651))

(declare-fun m!384653 () Bool)

(assert (=> b!389079 m!384653))

(declare-fun m!384655 () Bool)

(assert (=> b!389079 m!384655))

(assert (=> b!389079 m!384463))

(assert (=> b!389079 m!384653))

(declare-fun m!384657 () Bool)

(assert (=> b!389079 m!384657))

(declare-fun m!384659 () Bool)

(assert (=> b!389079 m!384659))

(declare-fun m!384661 () Bool)

(assert (=> b!389079 m!384661))

(assert (=> b!389079 m!384657))

(declare-fun m!384663 () Bool)

(assert (=> b!389079 m!384663))

(declare-fun m!384665 () Bool)

(assert (=> b!389079 m!384665))

(assert (=> b!389079 m!384649))

(assert (=> b!389079 m!384599))

(declare-fun m!384667 () Bool)

(assert (=> b!389079 m!384667))

(assert (=> b!389079 m!384643))

(declare-fun m!384669 () Bool)

(assert (=> b!389079 m!384669))

(assert (=> b!389090 m!384599))

(assert (=> b!389090 m!384599))

(assert (=> b!389090 m!384615))

(assert (=> b!388885 d!72675))

(declare-fun c!53989 () Bool)

(declare-fun call!27403 () ListLongMap!5391)

(declare-fun call!27406 () ListLongMap!5391)

(declare-fun bm!27397 () Bool)

(declare-fun call!27402 () ListLongMap!5391)

(declare-fun c!53986 () Bool)

(declare-fun call!27400 () ListLongMap!5391)

(assert (=> bm!27397 (= call!27400 (+!1031 (ite c!53989 call!27402 (ite c!53986 call!27406 call!27403)) (ite (or c!53989 c!53986) (tuple2!6489 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389097 () Bool)

(declare-fun e!235722 () Bool)

(declare-fun e!235729 () Bool)

(assert (=> b!389097 (= e!235722 e!235729)))

(declare-fun res!222578 () Bool)

(declare-fun call!27405 () Bool)

(assert (=> b!389097 (= res!222578 call!27405)))

(assert (=> b!389097 (=> (not res!222578) (not e!235729))))

(declare-fun b!389098 () Bool)

(declare-fun c!53991 () Bool)

(assert (=> b!389098 (= c!53991 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235724 () ListLongMap!5391)

(declare-fun e!235730 () ListLongMap!5391)

(assert (=> b!389098 (= e!235724 e!235730)))

(declare-fun b!389099 () Bool)

(declare-fun e!235719 () Bool)

(declare-fun e!235721 () Bool)

(assert (=> b!389099 (= e!235719 e!235721)))

(declare-fun res!222577 () Bool)

(assert (=> b!389099 (=> (not res!222577) (not e!235721))))

(declare-fun lt!182801 () ListLongMap!5391)

(assert (=> b!389099 (= res!222577 (contains!2436 lt!182801 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(assert (=> b!389099 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun bm!27398 () Bool)

(assert (=> bm!27398 (= call!27403 call!27406)))

(declare-fun b!389100 () Bool)

(declare-fun e!235726 () Unit!11904)

(declare-fun lt!182816 () Unit!11904)

(assert (=> b!389100 (= e!235726 lt!182816)))

(declare-fun lt!182819 () ListLongMap!5391)

(assert (=> b!389100 (= lt!182819 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182805 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182805 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182822 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182822 (select (arr!11003 lt!182647) #b00000000000000000000000000000000))))

(declare-fun lt!182818 () Unit!11904)

(assert (=> b!389100 (= lt!182818 (addStillContains!275 lt!182819 lt!182805 zeroValue!472 lt!182822))))

(assert (=> b!389100 (contains!2436 (+!1031 lt!182819 (tuple2!6489 lt!182805 zeroValue!472)) lt!182822)))

(declare-fun lt!182804 () Unit!11904)

(assert (=> b!389100 (= lt!182804 lt!182818)))

(declare-fun lt!182803 () ListLongMap!5391)

(assert (=> b!389100 (= lt!182803 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182820 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182820 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182814 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182814 (select (arr!11003 lt!182647) #b00000000000000000000000000000000))))

(declare-fun lt!182808 () Unit!11904)

(assert (=> b!389100 (= lt!182808 (addApplyDifferent!275 lt!182803 lt!182820 minValue!472 lt!182814))))

(assert (=> b!389100 (= (apply!299 (+!1031 lt!182803 (tuple2!6489 lt!182820 minValue!472)) lt!182814) (apply!299 lt!182803 lt!182814))))

(declare-fun lt!182809 () Unit!11904)

(assert (=> b!389100 (= lt!182809 lt!182808)))

(declare-fun lt!182817 () ListLongMap!5391)

(assert (=> b!389100 (= lt!182817 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182810 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182812 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182812 (select (arr!11003 lt!182647) #b00000000000000000000000000000000))))

(declare-fun lt!182806 () Unit!11904)

(assert (=> b!389100 (= lt!182806 (addApplyDifferent!275 lt!182817 lt!182810 zeroValue!472 lt!182812))))

(assert (=> b!389100 (= (apply!299 (+!1031 lt!182817 (tuple2!6489 lt!182810 zeroValue!472)) lt!182812) (apply!299 lt!182817 lt!182812))))

(declare-fun lt!182802 () Unit!11904)

(assert (=> b!389100 (= lt!182802 lt!182806)))

(declare-fun lt!182811 () ListLongMap!5391)

(assert (=> b!389100 (= lt!182811 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182821 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182821 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182815 () (_ BitVec 64))

(assert (=> b!389100 (= lt!182815 (select (arr!11003 lt!182647) #b00000000000000000000000000000000))))

(assert (=> b!389100 (= lt!182816 (addApplyDifferent!275 lt!182811 lt!182821 minValue!472 lt!182815))))

(assert (=> b!389100 (= (apply!299 (+!1031 lt!182811 (tuple2!6489 lt!182821 minValue!472)) lt!182815) (apply!299 lt!182811 lt!182815))))

(declare-fun b!389101 () Bool)

(assert (=> b!389101 (= e!235729 (= (apply!299 lt!182801 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27399 () Bool)

(assert (=> bm!27399 (= call!27406 call!27402)))

(declare-fun b!389102 () Bool)

(declare-fun e!235723 () Bool)

(declare-fun e!235725 () Bool)

(assert (=> b!389102 (= e!235723 e!235725)))

(declare-fun res!222583 () Bool)

(declare-fun call!27401 () Bool)

(assert (=> b!389102 (= res!222583 call!27401)))

(assert (=> b!389102 (=> (not res!222583) (not e!235725))))

(declare-fun b!389103 () Bool)

(declare-fun call!27404 () ListLongMap!5391)

(assert (=> b!389103 (= e!235730 call!27404)))

(declare-fun b!389104 () Bool)

(assert (=> b!389104 (= e!235721 (= (apply!299 lt!182801 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)) (get!5565 (select (arr!11004 lt!182648) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11357 lt!182648)))))

(assert (=> b!389104 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun b!389105 () Bool)

(declare-fun e!235720 () Bool)

(assert (=> b!389105 (= e!235720 e!235723)))

(declare-fun c!53990 () Bool)

(assert (=> b!389105 (= c!53990 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389106 () Bool)

(assert (=> b!389106 (= e!235722 (not call!27405))))

(declare-fun d!72677 () Bool)

(assert (=> d!72677 e!235720))

(declare-fun res!222581 () Bool)

(assert (=> d!72677 (=> (not res!222581) (not e!235720))))

(assert (=> d!72677 (= res!222581 (or (bvsge #b00000000000000000000000000000000 (size!11356 lt!182647)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))))

(declare-fun lt!182807 () ListLongMap!5391)

(assert (=> d!72677 (= lt!182801 lt!182807)))

(declare-fun lt!182813 () Unit!11904)

(assert (=> d!72677 (= lt!182813 e!235726)))

(declare-fun c!53987 () Bool)

(declare-fun e!235728 () Bool)

(assert (=> d!72677 (= c!53987 e!235728)))

(declare-fun res!222582 () Bool)

(assert (=> d!72677 (=> (not res!222582) (not e!235728))))

(assert (=> d!72677 (= res!222582 (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun e!235727 () ListLongMap!5391)

(assert (=> d!72677 (= lt!182807 e!235727)))

(assert (=> d!72677 (= c!53989 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72677 (validMask!0 mask!970)))

(assert (=> d!72677 (= (getCurrentListMap!2039 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182801)))

(declare-fun b!389107 () Bool)

(declare-fun e!235731 () Bool)

(assert (=> b!389107 (= e!235731 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(declare-fun b!389108 () Bool)

(assert (=> b!389108 (= e!235727 (+!1031 call!27400 (tuple2!6489 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!389109 () Bool)

(declare-fun res!222580 () Bool)

(assert (=> b!389109 (=> (not res!222580) (not e!235720))))

(assert (=> b!389109 (= res!222580 e!235719)))

(declare-fun res!222579 () Bool)

(assert (=> b!389109 (=> res!222579 e!235719)))

(assert (=> b!389109 (= res!222579 (not e!235731))))

(declare-fun res!222576 () Bool)

(assert (=> b!389109 (=> (not res!222576) (not e!235731))))

(assert (=> b!389109 (= res!222576 (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun b!389110 () Bool)

(assert (=> b!389110 (= e!235724 call!27404)))

(declare-fun b!389111 () Bool)

(assert (=> b!389111 (= e!235728 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(declare-fun b!389112 () Bool)

(declare-fun res!222584 () Bool)

(assert (=> b!389112 (=> (not res!222584) (not e!235720))))

(assert (=> b!389112 (= res!222584 e!235722)))

(declare-fun c!53988 () Bool)

(assert (=> b!389112 (= c!53988 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389113 () Bool)

(assert (=> b!389113 (= e!235725 (= (apply!299 lt!182801 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27400 () Bool)

(assert (=> bm!27400 (= call!27402 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27401 () Bool)

(assert (=> bm!27401 (= call!27405 (contains!2436 lt!182801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389114 () Bool)

(assert (=> b!389114 (= e!235727 e!235724)))

(assert (=> b!389114 (= c!53986 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389115 () Bool)

(declare-fun Unit!11909 () Unit!11904)

(assert (=> b!389115 (= e!235726 Unit!11909)))

(declare-fun bm!27402 () Bool)

(assert (=> bm!27402 (= call!27404 call!27400)))

(declare-fun b!389116 () Bool)

(assert (=> b!389116 (= e!235723 (not call!27401))))

(declare-fun b!389117 () Bool)

(assert (=> b!389117 (= e!235730 call!27403)))

(declare-fun bm!27403 () Bool)

(assert (=> bm!27403 (= call!27401 (contains!2436 lt!182801 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72677 c!53989) b!389108))

(assert (= (and d!72677 (not c!53989)) b!389114))

(assert (= (and b!389114 c!53986) b!389110))

(assert (= (and b!389114 (not c!53986)) b!389098))

(assert (= (and b!389098 c!53991) b!389103))

(assert (= (and b!389098 (not c!53991)) b!389117))

(assert (= (or b!389103 b!389117) bm!27398))

(assert (= (or b!389110 bm!27398) bm!27399))

(assert (= (or b!389110 b!389103) bm!27402))

(assert (= (or b!389108 bm!27399) bm!27400))

(assert (= (or b!389108 bm!27402) bm!27397))

(assert (= (and d!72677 res!222582) b!389111))

(assert (= (and d!72677 c!53987) b!389100))

(assert (= (and d!72677 (not c!53987)) b!389115))

(assert (= (and d!72677 res!222581) b!389109))

(assert (= (and b!389109 res!222576) b!389107))

(assert (= (and b!389109 (not res!222579)) b!389099))

(assert (= (and b!389099 res!222577) b!389104))

(assert (= (and b!389109 res!222580) b!389112))

(assert (= (and b!389112 c!53988) b!389097))

(assert (= (and b!389112 (not c!53988)) b!389106))

(assert (= (and b!389097 res!222578) b!389101))

(assert (= (or b!389097 b!389106) bm!27401))

(assert (= (and b!389112 res!222584) b!389105))

(assert (= (and b!389105 c!53990) b!389102))

(assert (= (and b!389105 (not c!53990)) b!389116))

(assert (= (and b!389102 res!222583) b!389113))

(assert (= (or b!389102 b!389116) bm!27403))

(declare-fun b_lambda!8563 () Bool)

(assert (=> (not b_lambda!8563) (not b!389104)))

(assert (=> b!389104 t!11484))

(declare-fun b_and!16175 () Bool)

(assert (= b_and!16173 (and (=> t!11484 result!5711) b_and!16175)))

(declare-fun m!384671 () Bool)

(assert (=> b!389099 m!384671))

(assert (=> b!389099 m!384671))

(declare-fun m!384673 () Bool)

(assert (=> b!389099 m!384673))

(assert (=> b!389107 m!384671))

(assert (=> b!389107 m!384671))

(declare-fun m!384675 () Bool)

(assert (=> b!389107 m!384675))

(assert (=> d!72677 m!384489))

(declare-fun m!384677 () Bool)

(assert (=> b!389104 m!384677))

(assert (=> b!389104 m!384671))

(assert (=> b!389104 m!384601))

(assert (=> b!389104 m!384677))

(assert (=> b!389104 m!384601))

(declare-fun m!384679 () Bool)

(assert (=> b!389104 m!384679))

(assert (=> b!389104 m!384671))

(declare-fun m!384681 () Bool)

(assert (=> b!389104 m!384681))

(declare-fun m!384683 () Bool)

(assert (=> b!389108 m!384683))

(declare-fun m!384685 () Bool)

(assert (=> b!389101 m!384685))

(declare-fun m!384687 () Bool)

(assert (=> bm!27403 m!384687))

(declare-fun m!384689 () Bool)

(assert (=> bm!27397 m!384689))

(declare-fun m!384691 () Bool)

(assert (=> b!389113 m!384691))

(assert (=> bm!27400 m!384467))

(declare-fun m!384693 () Bool)

(assert (=> bm!27401 m!384693))

(declare-fun m!384695 () Bool)

(assert (=> b!389100 m!384695))

(declare-fun m!384697 () Bool)

(assert (=> b!389100 m!384697))

(declare-fun m!384699 () Bool)

(assert (=> b!389100 m!384699))

(declare-fun m!384701 () Bool)

(assert (=> b!389100 m!384701))

(declare-fun m!384703 () Bool)

(assert (=> b!389100 m!384703))

(declare-fun m!384705 () Bool)

(assert (=> b!389100 m!384705))

(declare-fun m!384707 () Bool)

(assert (=> b!389100 m!384707))

(declare-fun m!384709 () Bool)

(assert (=> b!389100 m!384709))

(assert (=> b!389100 m!384467))

(assert (=> b!389100 m!384707))

(declare-fun m!384711 () Bool)

(assert (=> b!389100 m!384711))

(declare-fun m!384713 () Bool)

(assert (=> b!389100 m!384713))

(declare-fun m!384715 () Bool)

(assert (=> b!389100 m!384715))

(assert (=> b!389100 m!384711))

(declare-fun m!384717 () Bool)

(assert (=> b!389100 m!384717))

(declare-fun m!384719 () Bool)

(assert (=> b!389100 m!384719))

(assert (=> b!389100 m!384703))

(assert (=> b!389100 m!384671))

(declare-fun m!384721 () Bool)

(assert (=> b!389100 m!384721))

(assert (=> b!389100 m!384697))

(declare-fun m!384723 () Bool)

(assert (=> b!389100 m!384723))

(assert (=> b!389111 m!384671))

(assert (=> b!389111 m!384671))

(assert (=> b!389111 m!384675))

(assert (=> b!388885 d!72677))

(declare-fun b!389118 () Bool)

(declare-fun e!235736 () Bool)

(declare-fun e!235735 () Bool)

(assert (=> b!389118 (= e!235736 e!235735)))

(declare-fun c!53993 () Bool)

(assert (=> b!389118 (= c!53993 (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun d!72679 () Bool)

(declare-fun e!235737 () Bool)

(assert (=> d!72679 e!235737))

(declare-fun res!222587 () Bool)

(assert (=> d!72679 (=> (not res!222587) (not e!235737))))

(declare-fun lt!182828 () ListLongMap!5391)

(assert (=> d!72679 (= res!222587 (not (contains!2436 lt!182828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!235733 () ListLongMap!5391)

(assert (=> d!72679 (= lt!182828 e!235733)))

(declare-fun c!53992 () Bool)

(assert (=> d!72679 (= c!53992 (bvsge #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(assert (=> d!72679 (validMask!0 mask!970)))

(assert (=> d!72679 (= (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182828)))

(declare-fun b!389119 () Bool)

(declare-fun res!222586 () Bool)

(assert (=> b!389119 (=> (not res!222586) (not e!235737))))

(assert (=> b!389119 (= res!222586 (not (contains!2436 lt!182828 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389120 () Bool)

(assert (=> b!389120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(assert (=> b!389120 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11357 lt!182648)))))

(declare-fun e!235738 () Bool)

(assert (=> b!389120 (= e!235738 (= (apply!299 lt!182828 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)) (get!5565 (select (arr!11004 lt!182648) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389121 () Bool)

(declare-fun lt!182825 () Unit!11904)

(declare-fun lt!182824 () Unit!11904)

(assert (=> b!389121 (= lt!182825 lt!182824)))

(declare-fun lt!182826 () V!13899)

(declare-fun lt!182827 () ListLongMap!5391)

(declare-fun lt!182823 () (_ BitVec 64))

(declare-fun lt!182829 () (_ BitVec 64))

(assert (=> b!389121 (not (contains!2436 (+!1031 lt!182827 (tuple2!6489 lt!182829 lt!182826)) lt!182823))))

(assert (=> b!389121 (= lt!182824 (addStillNotContains!133 lt!182827 lt!182829 lt!182826 lt!182823))))

(assert (=> b!389121 (= lt!182823 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389121 (= lt!182826 (get!5565 (select (arr!11004 lt!182648) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389121 (= lt!182829 (select (arr!11003 lt!182647) #b00000000000000000000000000000000))))

(declare-fun call!27407 () ListLongMap!5391)

(assert (=> b!389121 (= lt!182827 call!27407)))

(declare-fun e!235732 () ListLongMap!5391)

(assert (=> b!389121 (= e!235732 (+!1031 call!27407 (tuple2!6489 (select (arr!11003 lt!182647) #b00000000000000000000000000000000) (get!5565 (select (arr!11004 lt!182648) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!27404 () Bool)

(assert (=> bm!27404 (= call!27407 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389122 () Bool)

(assert (=> b!389122 (= e!235735 (= lt!182828 (getCurrentListMapNoExtraKeys!949 lt!182647 lt!182648 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!389123 () Bool)

(assert (=> b!389123 (= e!235733 (ListLongMap!5392 Nil!6330))))

(declare-fun b!389124 () Bool)

(assert (=> b!389124 (= e!235736 e!235738)))

(assert (=> b!389124 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun res!222588 () Bool)

(assert (=> b!389124 (= res!222588 (contains!2436 lt!182828 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(assert (=> b!389124 (=> (not res!222588) (not e!235738))))

(declare-fun b!389125 () Bool)

(assert (=> b!389125 (= e!235733 e!235732)))

(declare-fun c!53994 () Bool)

(assert (=> b!389125 (= c!53994 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(declare-fun b!389126 () Bool)

(assert (=> b!389126 (= e!235737 e!235736)))

(declare-fun c!53995 () Bool)

(declare-fun e!235734 () Bool)

(assert (=> b!389126 (= c!53995 e!235734)))

(declare-fun res!222585 () Bool)

(assert (=> b!389126 (=> (not res!222585) (not e!235734))))

(assert (=> b!389126 (= res!222585 (bvslt #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(declare-fun b!389127 () Bool)

(assert (=> b!389127 (= e!235732 call!27407)))

(declare-fun b!389128 () Bool)

(assert (=> b!389128 (= e!235734 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(assert (=> b!389128 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389129 () Bool)

(assert (=> b!389129 (= e!235735 (isEmpty!549 lt!182828))))

(assert (= (and d!72679 c!53992) b!389123))

(assert (= (and d!72679 (not c!53992)) b!389125))

(assert (= (and b!389125 c!53994) b!389121))

(assert (= (and b!389125 (not c!53994)) b!389127))

(assert (= (or b!389121 b!389127) bm!27404))

(assert (= (and d!72679 res!222587) b!389119))

(assert (= (and b!389119 res!222586) b!389126))

(assert (= (and b!389126 res!222585) b!389128))

(assert (= (and b!389126 c!53995) b!389124))

(assert (= (and b!389126 (not c!53995)) b!389118))

(assert (= (and b!389124 res!222588) b!389120))

(assert (= (and b!389118 c!53993) b!389122))

(assert (= (and b!389118 (not c!53993)) b!389129))

(declare-fun b_lambda!8565 () Bool)

(assert (=> (not b_lambda!8565) (not b!389120)))

(assert (=> b!389120 t!11484))

(declare-fun b_and!16177 () Bool)

(assert (= b_and!16175 (and (=> t!11484 result!5711) b_and!16177)))

(declare-fun b_lambda!8567 () Bool)

(assert (=> (not b_lambda!8567) (not b!389121)))

(assert (=> b!389121 t!11484))

(declare-fun b_and!16179 () Bool)

(assert (= b_and!16177 (and (=> t!11484 result!5711) b_and!16179)))

(declare-fun m!384725 () Bool)

(assert (=> b!389122 m!384725))

(assert (=> b!389120 m!384677))

(assert (=> b!389120 m!384671))

(assert (=> b!389120 m!384677))

(assert (=> b!389120 m!384601))

(assert (=> b!389120 m!384679))

(assert (=> b!389120 m!384671))

(declare-fun m!384727 () Bool)

(assert (=> b!389120 m!384727))

(assert (=> b!389120 m!384601))

(assert (=> bm!27404 m!384725))

(declare-fun m!384729 () Bool)

(assert (=> b!389121 m!384729))

(assert (=> b!389121 m!384677))

(assert (=> b!389121 m!384601))

(assert (=> b!389121 m!384679))

(assert (=> b!389121 m!384601))

(declare-fun m!384731 () Bool)

(assert (=> b!389121 m!384731))

(declare-fun m!384733 () Bool)

(assert (=> b!389121 m!384733))

(assert (=> b!389121 m!384677))

(assert (=> b!389121 m!384729))

(declare-fun m!384735 () Bool)

(assert (=> b!389121 m!384735))

(assert (=> b!389121 m!384671))

(assert (=> b!389128 m!384671))

(assert (=> b!389128 m!384671))

(assert (=> b!389128 m!384675))

(declare-fun m!384737 () Bool)

(assert (=> b!389119 m!384737))

(declare-fun m!384739 () Bool)

(assert (=> b!389129 m!384739))

(assert (=> b!389124 m!384671))

(assert (=> b!389124 m!384671))

(declare-fun m!384741 () Bool)

(assert (=> b!389124 m!384741))

(assert (=> b!389125 m!384671))

(assert (=> b!389125 m!384671))

(assert (=> b!389125 m!384675))

(declare-fun m!384743 () Bool)

(assert (=> d!72679 m!384743))

(assert (=> d!72679 m!384489))

(assert (=> b!388885 d!72679))

(declare-fun d!72681 () Bool)

(declare-fun e!235741 () Bool)

(assert (=> d!72681 e!235741))

(declare-fun res!222594 () Bool)

(assert (=> d!72681 (=> (not res!222594) (not e!235741))))

(declare-fun lt!182841 () ListLongMap!5391)

(assert (=> d!72681 (= res!222594 (contains!2436 lt!182841 (_1!3255 (tuple2!6489 k0!778 v!373))))))

(declare-fun lt!182838 () List!6333)

(assert (=> d!72681 (= lt!182841 (ListLongMap!5392 lt!182838))))

(declare-fun lt!182839 () Unit!11904)

(declare-fun lt!182840 () Unit!11904)

(assert (=> d!72681 (= lt!182839 lt!182840)))

(declare-datatypes ((Option!361 0))(
  ( (Some!360 (v!7047 V!13899)) (None!359) )
))
(declare-fun getValueByKey!355 (List!6333 (_ BitVec 64)) Option!361)

(assert (=> d!72681 (= (getValueByKey!355 lt!182838 (_1!3255 (tuple2!6489 k0!778 v!373))) (Some!360 (_2!3255 (tuple2!6489 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!180 (List!6333 (_ BitVec 64) V!13899) Unit!11904)

(assert (=> d!72681 (= lt!182840 (lemmaContainsTupThenGetReturnValue!180 lt!182838 (_1!3255 (tuple2!6489 k0!778 v!373)) (_2!3255 (tuple2!6489 k0!778 v!373))))))

(declare-fun insertStrictlySorted!183 (List!6333 (_ BitVec 64) V!13899) List!6333)

(assert (=> d!72681 (= lt!182838 (insertStrictlySorted!183 (toList!2711 lt!182645) (_1!3255 (tuple2!6489 k0!778 v!373)) (_2!3255 (tuple2!6489 k0!778 v!373))))))

(assert (=> d!72681 (= (+!1031 lt!182645 (tuple2!6489 k0!778 v!373)) lt!182841)))

(declare-fun b!389134 () Bool)

(declare-fun res!222593 () Bool)

(assert (=> b!389134 (=> (not res!222593) (not e!235741))))

(assert (=> b!389134 (= res!222593 (= (getValueByKey!355 (toList!2711 lt!182841) (_1!3255 (tuple2!6489 k0!778 v!373))) (Some!360 (_2!3255 (tuple2!6489 k0!778 v!373)))))))

(declare-fun b!389135 () Bool)

(declare-fun contains!2437 (List!6333 tuple2!6488) Bool)

(assert (=> b!389135 (= e!235741 (contains!2437 (toList!2711 lt!182841) (tuple2!6489 k0!778 v!373)))))

(assert (= (and d!72681 res!222594) b!389134))

(assert (= (and b!389134 res!222593) b!389135))

(declare-fun m!384745 () Bool)

(assert (=> d!72681 m!384745))

(declare-fun m!384747 () Bool)

(assert (=> d!72681 m!384747))

(declare-fun m!384749 () Bool)

(assert (=> d!72681 m!384749))

(declare-fun m!384751 () Bool)

(assert (=> d!72681 m!384751))

(declare-fun m!384753 () Bool)

(assert (=> b!389134 m!384753))

(declare-fun m!384755 () Bool)

(assert (=> b!389135 m!384755))

(assert (=> b!388885 d!72681))

(declare-fun call!27412 () ListLongMap!5391)

(declare-fun bm!27409 () Bool)

(assert (=> bm!27409 (= call!27412 (getCurrentListMapNoExtraKeys!949 (array!23074 (store (arr!11003 _keys!658) i!548 k0!778) (size!11356 _keys!658)) (array!23076 (store (arr!11004 _values!506) i!548 (ValueCellFull!4454 v!373)) (size!11357 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun e!235747 () Bool)

(declare-fun b!389142 () Bool)

(declare-fun call!27413 () ListLongMap!5391)

(assert (=> b!389142 (= e!235747 (= call!27412 (+!1031 call!27413 (tuple2!6489 k0!778 v!373))))))

(declare-fun b!389143 () Bool)

(declare-fun e!235746 () Bool)

(assert (=> b!389143 (= e!235746 e!235747)))

(declare-fun c!53998 () Bool)

(assert (=> b!389143 (= c!53998 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!72683 () Bool)

(assert (=> d!72683 e!235746))

(declare-fun res!222597 () Bool)

(assert (=> d!72683 (=> (not res!222597) (not e!235746))))

(assert (=> d!72683 (= res!222597 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11356 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11357 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11356 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11357 _values!506))))))))

(declare-fun lt!182844 () Unit!11904)

(declare-fun choose!1320 (array!23073 array!23075 (_ BitVec 32) (_ BitVec 32) V!13899 V!13899 (_ BitVec 32) (_ BitVec 64) V!13899 (_ BitVec 32) Int) Unit!11904)

(assert (=> d!72683 (= lt!182844 (choose!1320 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72683 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(assert (=> d!72683 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!240 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182844)))

(declare-fun b!389144 () Bool)

(assert (=> b!389144 (= e!235747 (= call!27412 call!27413))))

(declare-fun bm!27410 () Bool)

(assert (=> bm!27410 (= call!27413 (getCurrentListMapNoExtraKeys!949 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72683 res!222597) b!389143))

(assert (= (and b!389143 c!53998) b!389142))

(assert (= (and b!389143 (not c!53998)) b!389144))

(assert (= (or b!389142 b!389144) bm!27410))

(assert (= (or b!389142 b!389144) bm!27409))

(assert (=> bm!27409 m!384461))

(assert (=> bm!27409 m!384471))

(declare-fun m!384757 () Bool)

(assert (=> bm!27409 m!384757))

(declare-fun m!384759 () Bool)

(assert (=> b!389142 m!384759))

(declare-fun m!384761 () Bool)

(assert (=> d!72683 m!384761))

(assert (=> bm!27410 m!384463))

(assert (=> b!388885 d!72683))

(declare-fun b!389155 () Bool)

(declare-fun e!235756 () Bool)

(declare-fun call!27416 () Bool)

(assert (=> b!389155 (= e!235756 call!27416)))

(declare-fun b!389156 () Bool)

(assert (=> b!389156 (= e!235756 call!27416)))

(declare-fun b!389157 () Bool)

(declare-fun e!235759 () Bool)

(declare-fun contains!2438 (List!6334 (_ BitVec 64)) Bool)

(assert (=> b!389157 (= e!235759 (contains!2438 Nil!6331 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(declare-fun b!389158 () Bool)

(declare-fun e!235757 () Bool)

(assert (=> b!389158 (= e!235757 e!235756)))

(declare-fun c!54001 () Bool)

(assert (=> b!389158 (= c!54001 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(declare-fun d!72685 () Bool)

(declare-fun res!222606 () Bool)

(declare-fun e!235758 () Bool)

(assert (=> d!72685 (=> res!222606 e!235758)))

(assert (=> d!72685 (= res!222606 (bvsge #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(assert (=> d!72685 (= (arrayNoDuplicates!0 lt!182647 #b00000000000000000000000000000000 Nil!6331) e!235758)))

(declare-fun bm!27413 () Bool)

(assert (=> bm!27413 (= call!27416 (arrayNoDuplicates!0 lt!182647 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54001 (Cons!6330 (select (arr!11003 lt!182647) #b00000000000000000000000000000000) Nil!6331) Nil!6331)))))

(declare-fun b!389159 () Bool)

(assert (=> b!389159 (= e!235758 e!235757)))

(declare-fun res!222605 () Bool)

(assert (=> b!389159 (=> (not res!222605) (not e!235757))))

(assert (=> b!389159 (= res!222605 (not e!235759))))

(declare-fun res!222604 () Bool)

(assert (=> b!389159 (=> (not res!222604) (not e!235759))))

(assert (=> b!389159 (= res!222604 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(assert (= (and d!72685 (not res!222606)) b!389159))

(assert (= (and b!389159 res!222604) b!389157))

(assert (= (and b!389159 res!222605) b!389158))

(assert (= (and b!389158 c!54001) b!389156))

(assert (= (and b!389158 (not c!54001)) b!389155))

(assert (= (or b!389156 b!389155) bm!27413))

(assert (=> b!389157 m!384671))

(assert (=> b!389157 m!384671))

(declare-fun m!384763 () Bool)

(assert (=> b!389157 m!384763))

(assert (=> b!389158 m!384671))

(assert (=> b!389158 m!384671))

(assert (=> b!389158 m!384675))

(assert (=> bm!27413 m!384671))

(declare-fun m!384765 () Bool)

(assert (=> bm!27413 m!384765))

(assert (=> b!389159 m!384671))

(assert (=> b!389159 m!384671))

(assert (=> b!389159 m!384675))

(assert (=> b!388895 d!72685))

(declare-fun d!72687 () Bool)

(declare-fun res!222611 () Bool)

(declare-fun e!235764 () Bool)

(assert (=> d!72687 (=> res!222611 e!235764)))

(assert (=> d!72687 (= res!222611 (= (select (arr!11003 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72687 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235764)))

(declare-fun b!389164 () Bool)

(declare-fun e!235765 () Bool)

(assert (=> b!389164 (= e!235764 e!235765)))

(declare-fun res!222612 () Bool)

(assert (=> b!389164 (=> (not res!222612) (not e!235765))))

(assert (=> b!389164 (= res!222612 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11356 _keys!658)))))

(declare-fun b!389165 () Bool)

(assert (=> b!389165 (= e!235765 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72687 (not res!222611)) b!389164))

(assert (= (and b!389164 res!222612) b!389165))

(assert (=> d!72687 m!384599))

(declare-fun m!384767 () Bool)

(assert (=> b!389165 m!384767))

(assert (=> b!388890 d!72687))

(declare-fun d!72689 () Bool)

(declare-fun e!235766 () Bool)

(assert (=> d!72689 e!235766))

(declare-fun res!222614 () Bool)

(assert (=> d!72689 (=> (not res!222614) (not e!235766))))

(declare-fun lt!182848 () ListLongMap!5391)

(assert (=> d!72689 (= res!222614 (contains!2436 lt!182848 (_1!3255 lt!182651)))))

(declare-fun lt!182845 () List!6333)

(assert (=> d!72689 (= lt!182848 (ListLongMap!5392 lt!182845))))

(declare-fun lt!182846 () Unit!11904)

(declare-fun lt!182847 () Unit!11904)

(assert (=> d!72689 (= lt!182846 lt!182847)))

(assert (=> d!72689 (= (getValueByKey!355 lt!182845 (_1!3255 lt!182651)) (Some!360 (_2!3255 lt!182651)))))

(assert (=> d!72689 (= lt!182847 (lemmaContainsTupThenGetReturnValue!180 lt!182845 (_1!3255 lt!182651) (_2!3255 lt!182651)))))

(assert (=> d!72689 (= lt!182845 (insertStrictlySorted!183 (toList!2711 (+!1031 lt!182649 lt!182644)) (_1!3255 lt!182651) (_2!3255 lt!182651)))))

(assert (=> d!72689 (= (+!1031 (+!1031 lt!182649 lt!182644) lt!182651) lt!182848)))

(declare-fun b!389166 () Bool)

(declare-fun res!222613 () Bool)

(assert (=> b!389166 (=> (not res!222613) (not e!235766))))

(assert (=> b!389166 (= res!222613 (= (getValueByKey!355 (toList!2711 lt!182848) (_1!3255 lt!182651)) (Some!360 (_2!3255 lt!182651))))))

(declare-fun b!389167 () Bool)

(assert (=> b!389167 (= e!235766 (contains!2437 (toList!2711 lt!182848) lt!182651))))

(assert (= (and d!72689 res!222614) b!389166))

(assert (= (and b!389166 res!222613) b!389167))

(declare-fun m!384769 () Bool)

(assert (=> d!72689 m!384769))

(declare-fun m!384771 () Bool)

(assert (=> d!72689 m!384771))

(declare-fun m!384773 () Bool)

(assert (=> d!72689 m!384773))

(declare-fun m!384775 () Bool)

(assert (=> d!72689 m!384775))

(declare-fun m!384777 () Bool)

(assert (=> b!389166 m!384777))

(declare-fun m!384779 () Bool)

(assert (=> b!389167 m!384779))

(assert (=> b!388889 d!72689))

(declare-fun d!72691 () Bool)

(declare-fun e!235767 () Bool)

(assert (=> d!72691 e!235767))

(declare-fun res!222616 () Bool)

(assert (=> d!72691 (=> (not res!222616) (not e!235767))))

(declare-fun lt!182852 () ListLongMap!5391)

(assert (=> d!72691 (= res!222616 (contains!2436 lt!182852 (_1!3255 lt!182644)))))

(declare-fun lt!182849 () List!6333)

(assert (=> d!72691 (= lt!182852 (ListLongMap!5392 lt!182849))))

(declare-fun lt!182850 () Unit!11904)

(declare-fun lt!182851 () Unit!11904)

(assert (=> d!72691 (= lt!182850 lt!182851)))

(assert (=> d!72691 (= (getValueByKey!355 lt!182849 (_1!3255 lt!182644)) (Some!360 (_2!3255 lt!182644)))))

(assert (=> d!72691 (= lt!182851 (lemmaContainsTupThenGetReturnValue!180 lt!182849 (_1!3255 lt!182644) (_2!3255 lt!182644)))))

(assert (=> d!72691 (= lt!182849 (insertStrictlySorted!183 (toList!2711 lt!182649) (_1!3255 lt!182644) (_2!3255 lt!182644)))))

(assert (=> d!72691 (= (+!1031 lt!182649 lt!182644) lt!182852)))

(declare-fun b!389168 () Bool)

(declare-fun res!222615 () Bool)

(assert (=> b!389168 (=> (not res!222615) (not e!235767))))

(assert (=> b!389168 (= res!222615 (= (getValueByKey!355 (toList!2711 lt!182852) (_1!3255 lt!182644)) (Some!360 (_2!3255 lt!182644))))))

(declare-fun b!389169 () Bool)

(assert (=> b!389169 (= e!235767 (contains!2437 (toList!2711 lt!182852) lt!182644))))

(assert (= (and d!72691 res!222616) b!389168))

(assert (= (and b!389168 res!222615) b!389169))

(declare-fun m!384781 () Bool)

(assert (=> d!72691 m!384781))

(declare-fun m!384783 () Bool)

(assert (=> d!72691 m!384783))

(declare-fun m!384785 () Bool)

(assert (=> d!72691 m!384785))

(declare-fun m!384787 () Bool)

(assert (=> d!72691 m!384787))

(declare-fun m!384789 () Bool)

(assert (=> b!389168 m!384789))

(declare-fun m!384791 () Bool)

(assert (=> b!389169 m!384791))

(assert (=> b!388889 d!72691))

(declare-fun d!72693 () Bool)

(declare-fun e!235768 () Bool)

(assert (=> d!72693 e!235768))

(declare-fun res!222618 () Bool)

(assert (=> d!72693 (=> (not res!222618) (not e!235768))))

(declare-fun lt!182856 () ListLongMap!5391)

(assert (=> d!72693 (= res!222618 (contains!2436 lt!182856 (_1!3255 lt!182651)))))

(declare-fun lt!182853 () List!6333)

(assert (=> d!72693 (= lt!182856 (ListLongMap!5392 lt!182853))))

(declare-fun lt!182854 () Unit!11904)

(declare-fun lt!182855 () Unit!11904)

(assert (=> d!72693 (= lt!182854 lt!182855)))

(assert (=> d!72693 (= (getValueByKey!355 lt!182853 (_1!3255 lt!182651)) (Some!360 (_2!3255 lt!182651)))))

(assert (=> d!72693 (= lt!182855 (lemmaContainsTupThenGetReturnValue!180 lt!182853 (_1!3255 lt!182651) (_2!3255 lt!182651)))))

(assert (=> d!72693 (= lt!182853 (insertStrictlySorted!183 (toList!2711 (+!1031 lt!182645 lt!182644)) (_1!3255 lt!182651) (_2!3255 lt!182651)))))

(assert (=> d!72693 (= (+!1031 (+!1031 lt!182645 lt!182644) lt!182651) lt!182856)))

(declare-fun b!389170 () Bool)

(declare-fun res!222617 () Bool)

(assert (=> b!389170 (=> (not res!222617) (not e!235768))))

(assert (=> b!389170 (= res!222617 (= (getValueByKey!355 (toList!2711 lt!182856) (_1!3255 lt!182651)) (Some!360 (_2!3255 lt!182651))))))

(declare-fun b!389171 () Bool)

(assert (=> b!389171 (= e!235768 (contains!2437 (toList!2711 lt!182856) lt!182651))))

(assert (= (and d!72693 res!222618) b!389170))

(assert (= (and b!389170 res!222617) b!389171))

(declare-fun m!384793 () Bool)

(assert (=> d!72693 m!384793))

(declare-fun m!384795 () Bool)

(assert (=> d!72693 m!384795))

(declare-fun m!384797 () Bool)

(assert (=> d!72693 m!384797))

(declare-fun m!384799 () Bool)

(assert (=> d!72693 m!384799))

(declare-fun m!384801 () Bool)

(assert (=> b!389170 m!384801))

(declare-fun m!384803 () Bool)

(assert (=> b!389171 m!384803))

(assert (=> b!388894 d!72693))

(declare-fun d!72695 () Bool)

(declare-fun e!235769 () Bool)

(assert (=> d!72695 e!235769))

(declare-fun res!222620 () Bool)

(assert (=> d!72695 (=> (not res!222620) (not e!235769))))

(declare-fun lt!182860 () ListLongMap!5391)

(assert (=> d!72695 (= res!222620 (contains!2436 lt!182860 (_1!3255 lt!182644)))))

(declare-fun lt!182857 () List!6333)

(assert (=> d!72695 (= lt!182860 (ListLongMap!5392 lt!182857))))

(declare-fun lt!182858 () Unit!11904)

(declare-fun lt!182859 () Unit!11904)

(assert (=> d!72695 (= lt!182858 lt!182859)))

(assert (=> d!72695 (= (getValueByKey!355 lt!182857 (_1!3255 lt!182644)) (Some!360 (_2!3255 lt!182644)))))

(assert (=> d!72695 (= lt!182859 (lemmaContainsTupThenGetReturnValue!180 lt!182857 (_1!3255 lt!182644) (_2!3255 lt!182644)))))

(assert (=> d!72695 (= lt!182857 (insertStrictlySorted!183 (toList!2711 lt!182645) (_1!3255 lt!182644) (_2!3255 lt!182644)))))

(assert (=> d!72695 (= (+!1031 lt!182645 lt!182644) lt!182860)))

(declare-fun b!389172 () Bool)

(declare-fun res!222619 () Bool)

(assert (=> b!389172 (=> (not res!222619) (not e!235769))))

(assert (=> b!389172 (= res!222619 (= (getValueByKey!355 (toList!2711 lt!182860) (_1!3255 lt!182644)) (Some!360 (_2!3255 lt!182644))))))

(declare-fun b!389173 () Bool)

(assert (=> b!389173 (= e!235769 (contains!2437 (toList!2711 lt!182860) lt!182644))))

(assert (= (and d!72695 res!222620) b!389172))

(assert (= (and b!389172 res!222619) b!389173))

(declare-fun m!384805 () Bool)

(assert (=> d!72695 m!384805))

(declare-fun m!384807 () Bool)

(assert (=> d!72695 m!384807))

(declare-fun m!384809 () Bool)

(assert (=> d!72695 m!384809))

(declare-fun m!384811 () Bool)

(assert (=> d!72695 m!384811))

(declare-fun m!384813 () Bool)

(assert (=> b!389172 m!384813))

(declare-fun m!384815 () Bool)

(assert (=> b!389173 m!384815))

(assert (=> b!388894 d!72695))

(declare-fun d!72697 () Bool)

(declare-fun e!235770 () Bool)

(assert (=> d!72697 e!235770))

(declare-fun res!222622 () Bool)

(assert (=> d!72697 (=> (not res!222622) (not e!235770))))

(declare-fun lt!182864 () ListLongMap!5391)

(assert (=> d!72697 (= res!222622 (contains!2436 lt!182864 (_1!3255 lt!182651)))))

(declare-fun lt!182861 () List!6333)

(assert (=> d!72697 (= lt!182864 (ListLongMap!5392 lt!182861))))

(declare-fun lt!182862 () Unit!11904)

(declare-fun lt!182863 () Unit!11904)

(assert (=> d!72697 (= lt!182862 lt!182863)))

(assert (=> d!72697 (= (getValueByKey!355 lt!182861 (_1!3255 lt!182651)) (Some!360 (_2!3255 lt!182651)))))

(assert (=> d!72697 (= lt!182863 (lemmaContainsTupThenGetReturnValue!180 lt!182861 (_1!3255 lt!182651) (_2!3255 lt!182651)))))

(assert (=> d!72697 (= lt!182861 (insertStrictlySorted!183 (toList!2711 (+!1031 lt!182653 lt!182644)) (_1!3255 lt!182651) (_2!3255 lt!182651)))))

(assert (=> d!72697 (= (+!1031 (+!1031 lt!182653 lt!182644) lt!182651) lt!182864)))

(declare-fun b!389174 () Bool)

(declare-fun res!222621 () Bool)

(assert (=> b!389174 (=> (not res!222621) (not e!235770))))

(assert (=> b!389174 (= res!222621 (= (getValueByKey!355 (toList!2711 lt!182864) (_1!3255 lt!182651)) (Some!360 (_2!3255 lt!182651))))))

(declare-fun b!389175 () Bool)

(assert (=> b!389175 (= e!235770 (contains!2437 (toList!2711 lt!182864) lt!182651))))

(assert (= (and d!72697 res!222622) b!389174))

(assert (= (and b!389174 res!222621) b!389175))

(declare-fun m!384817 () Bool)

(assert (=> d!72697 m!384817))

(declare-fun m!384819 () Bool)

(assert (=> d!72697 m!384819))

(declare-fun m!384821 () Bool)

(assert (=> d!72697 m!384821))

(declare-fun m!384823 () Bool)

(assert (=> d!72697 m!384823))

(declare-fun m!384825 () Bool)

(assert (=> b!389174 m!384825))

(declare-fun m!384827 () Bool)

(assert (=> b!389175 m!384827))

(assert (=> b!388898 d!72697))

(declare-fun d!72699 () Bool)

(declare-fun e!235771 () Bool)

(assert (=> d!72699 e!235771))

(declare-fun res!222624 () Bool)

(assert (=> d!72699 (=> (not res!222624) (not e!235771))))

(declare-fun lt!182868 () ListLongMap!5391)

(assert (=> d!72699 (= res!222624 (contains!2436 lt!182868 (_1!3255 lt!182644)))))

(declare-fun lt!182865 () List!6333)

(assert (=> d!72699 (= lt!182868 (ListLongMap!5392 lt!182865))))

(declare-fun lt!182866 () Unit!11904)

(declare-fun lt!182867 () Unit!11904)

(assert (=> d!72699 (= lt!182866 lt!182867)))

(assert (=> d!72699 (= (getValueByKey!355 lt!182865 (_1!3255 lt!182644)) (Some!360 (_2!3255 lt!182644)))))

(assert (=> d!72699 (= lt!182867 (lemmaContainsTupThenGetReturnValue!180 lt!182865 (_1!3255 lt!182644) (_2!3255 lt!182644)))))

(assert (=> d!72699 (= lt!182865 (insertStrictlySorted!183 (toList!2711 lt!182653) (_1!3255 lt!182644) (_2!3255 lt!182644)))))

(assert (=> d!72699 (= (+!1031 lt!182653 lt!182644) lt!182868)))

(declare-fun b!389176 () Bool)

(declare-fun res!222623 () Bool)

(assert (=> b!389176 (=> (not res!222623) (not e!235771))))

(assert (=> b!389176 (= res!222623 (= (getValueByKey!355 (toList!2711 lt!182868) (_1!3255 lt!182644)) (Some!360 (_2!3255 lt!182644))))))

(declare-fun b!389177 () Bool)

(assert (=> b!389177 (= e!235771 (contains!2437 (toList!2711 lt!182868) lt!182644))))

(assert (= (and d!72699 res!222624) b!389176))

(assert (= (and b!389176 res!222623) b!389177))

(declare-fun m!384829 () Bool)

(assert (=> d!72699 m!384829))

(declare-fun m!384831 () Bool)

(assert (=> d!72699 m!384831))

(declare-fun m!384833 () Bool)

(assert (=> d!72699 m!384833))

(declare-fun m!384835 () Bool)

(assert (=> d!72699 m!384835))

(declare-fun m!384837 () Bool)

(assert (=> b!389176 m!384837))

(declare-fun m!384839 () Bool)

(assert (=> b!389177 m!384839))

(assert (=> b!388898 d!72699))

(declare-fun b!389178 () Bool)

(declare-fun e!235772 () Bool)

(declare-fun call!27417 () Bool)

(assert (=> b!389178 (= e!235772 call!27417)))

(declare-fun b!389179 () Bool)

(assert (=> b!389179 (= e!235772 call!27417)))

(declare-fun b!389180 () Bool)

(declare-fun e!235775 () Bool)

(assert (=> b!389180 (= e!235775 (contains!2438 Nil!6331 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389181 () Bool)

(declare-fun e!235773 () Bool)

(assert (=> b!389181 (= e!235773 e!235772)))

(declare-fun c!54002 () Bool)

(assert (=> b!389181 (= c!54002 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72701 () Bool)

(declare-fun res!222627 () Bool)

(declare-fun e!235774 () Bool)

(assert (=> d!72701 (=> res!222627 e!235774)))

(assert (=> d!72701 (= res!222627 (bvsge #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(assert (=> d!72701 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6331) e!235774)))

(declare-fun bm!27414 () Bool)

(assert (=> bm!27414 (= call!27417 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54002 (Cons!6330 (select (arr!11003 _keys!658) #b00000000000000000000000000000000) Nil!6331) Nil!6331)))))

(declare-fun b!389182 () Bool)

(assert (=> b!389182 (= e!235774 e!235773)))

(declare-fun res!222626 () Bool)

(assert (=> b!389182 (=> (not res!222626) (not e!235773))))

(assert (=> b!389182 (= res!222626 (not e!235775))))

(declare-fun res!222625 () Bool)

(assert (=> b!389182 (=> (not res!222625) (not e!235775))))

(assert (=> b!389182 (= res!222625 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72701 (not res!222627)) b!389182))

(assert (= (and b!389182 res!222625) b!389180))

(assert (= (and b!389182 res!222626) b!389181))

(assert (= (and b!389181 c!54002) b!389179))

(assert (= (and b!389181 (not c!54002)) b!389178))

(assert (= (or b!389179 b!389178) bm!27414))

(assert (=> b!389180 m!384599))

(assert (=> b!389180 m!384599))

(declare-fun m!384841 () Bool)

(assert (=> b!389180 m!384841))

(assert (=> b!389181 m!384599))

(assert (=> b!389181 m!384599))

(assert (=> b!389181 m!384615))

(assert (=> bm!27414 m!384599))

(declare-fun m!384843 () Bool)

(assert (=> bm!27414 m!384843))

(assert (=> b!389182 m!384599))

(assert (=> b!389182 m!384599))

(assert (=> b!389182 m!384615))

(assert (=> b!388893 d!72701))

(declare-fun d!72703 () Bool)

(assert (=> d!72703 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388896 d!72703))

(declare-fun b!389191 () Bool)

(declare-fun e!235784 () Bool)

(declare-fun e!235782 () Bool)

(assert (=> b!389191 (= e!235784 e!235782)))

(declare-fun c!54005 () Bool)

(assert (=> b!389191 (= c!54005 (validKeyInArray!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389192 () Bool)

(declare-fun call!27420 () Bool)

(assert (=> b!389192 (= e!235782 call!27420)))

(declare-fun b!389193 () Bool)

(declare-fun e!235783 () Bool)

(assert (=> b!389193 (= e!235782 e!235783)))

(declare-fun lt!182876 () (_ BitVec 64))

(assert (=> b!389193 (= lt!182876 (select (arr!11003 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182875 () Unit!11904)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23073 (_ BitVec 64) (_ BitVec 32)) Unit!11904)

(assert (=> b!389193 (= lt!182875 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182876 #b00000000000000000000000000000000))))

(assert (=> b!389193 (arrayContainsKey!0 _keys!658 lt!182876 #b00000000000000000000000000000000)))

(declare-fun lt!182877 () Unit!11904)

(assert (=> b!389193 (= lt!182877 lt!182875)))

(declare-fun res!222633 () Bool)

(declare-datatypes ((SeekEntryResult!3505 0))(
  ( (MissingZero!3505 (index!16199 (_ BitVec 32))) (Found!3505 (index!16200 (_ BitVec 32))) (Intermediate!3505 (undefined!4317 Bool) (index!16201 (_ BitVec 32)) (x!38219 (_ BitVec 32))) (Undefined!3505) (MissingVacant!3505 (index!16202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23073 (_ BitVec 32)) SeekEntryResult!3505)

(assert (=> b!389193 (= res!222633 (= (seekEntryOrOpen!0 (select (arr!11003 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3505 #b00000000000000000000000000000000)))))

(assert (=> b!389193 (=> (not res!222633) (not e!235783))))

(declare-fun d!72705 () Bool)

(declare-fun res!222632 () Bool)

(assert (=> d!72705 (=> res!222632 e!235784)))

(assert (=> d!72705 (= res!222632 (bvsge #b00000000000000000000000000000000 (size!11356 _keys!658)))))

(assert (=> d!72705 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235784)))

(declare-fun bm!27417 () Bool)

(assert (=> bm!27417 (= call!27420 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!389194 () Bool)

(assert (=> b!389194 (= e!235783 call!27420)))

(assert (= (and d!72705 (not res!222632)) b!389191))

(assert (= (and b!389191 c!54005) b!389193))

(assert (= (and b!389191 (not c!54005)) b!389192))

(assert (= (and b!389193 res!222633) b!389194))

(assert (= (or b!389194 b!389192) bm!27417))

(assert (=> b!389191 m!384599))

(assert (=> b!389191 m!384599))

(assert (=> b!389191 m!384615))

(assert (=> b!389193 m!384599))

(declare-fun m!384845 () Bool)

(assert (=> b!389193 m!384845))

(declare-fun m!384847 () Bool)

(assert (=> b!389193 m!384847))

(assert (=> b!389193 m!384599))

(declare-fun m!384849 () Bool)

(assert (=> b!389193 m!384849))

(declare-fun m!384851 () Bool)

(assert (=> bm!27417 m!384851))

(assert (=> b!388887 d!72705))

(declare-fun d!72707 () Bool)

(assert (=> d!72707 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37850 d!72707))

(declare-fun d!72709 () Bool)

(assert (=> d!72709 (= (array_inv!8090 _values!506) (bvsge (size!11357 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37850 d!72709))

(declare-fun d!72711 () Bool)

(assert (=> d!72711 (= (array_inv!8091 _keys!658) (bvsge (size!11356 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37850 d!72711))

(declare-fun b!389195 () Bool)

(declare-fun e!235787 () Bool)

(declare-fun e!235785 () Bool)

(assert (=> b!389195 (= e!235787 e!235785)))

(declare-fun c!54006 () Bool)

(assert (=> b!389195 (= c!54006 (validKeyInArray!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000)))))

(declare-fun b!389196 () Bool)

(declare-fun call!27421 () Bool)

(assert (=> b!389196 (= e!235785 call!27421)))

(declare-fun b!389197 () Bool)

(declare-fun e!235786 () Bool)

(assert (=> b!389197 (= e!235785 e!235786)))

(declare-fun lt!182879 () (_ BitVec 64))

(assert (=> b!389197 (= lt!182879 (select (arr!11003 lt!182647) #b00000000000000000000000000000000))))

(declare-fun lt!182878 () Unit!11904)

(assert (=> b!389197 (= lt!182878 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182647 lt!182879 #b00000000000000000000000000000000))))

(assert (=> b!389197 (arrayContainsKey!0 lt!182647 lt!182879 #b00000000000000000000000000000000)))

(declare-fun lt!182880 () Unit!11904)

(assert (=> b!389197 (= lt!182880 lt!182878)))

(declare-fun res!222635 () Bool)

(assert (=> b!389197 (= res!222635 (= (seekEntryOrOpen!0 (select (arr!11003 lt!182647) #b00000000000000000000000000000000) lt!182647 mask!970) (Found!3505 #b00000000000000000000000000000000)))))

(assert (=> b!389197 (=> (not res!222635) (not e!235786))))

(declare-fun d!72713 () Bool)

(declare-fun res!222634 () Bool)

(assert (=> d!72713 (=> res!222634 e!235787)))

(assert (=> d!72713 (= res!222634 (bvsge #b00000000000000000000000000000000 (size!11356 lt!182647)))))

(assert (=> d!72713 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182647 mask!970) e!235787)))

(declare-fun bm!27418 () Bool)

(assert (=> bm!27418 (= call!27421 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182647 mask!970))))

(declare-fun b!389198 () Bool)

(assert (=> b!389198 (= e!235786 call!27421)))

(assert (= (and d!72713 (not res!222634)) b!389195))

(assert (= (and b!389195 c!54006) b!389197))

(assert (= (and b!389195 (not c!54006)) b!389196))

(assert (= (and b!389197 res!222635) b!389198))

(assert (= (or b!389198 b!389196) bm!27418))

(assert (=> b!389195 m!384671))

(assert (=> b!389195 m!384671))

(assert (=> b!389195 m!384675))

(assert (=> b!389197 m!384671))

(declare-fun m!384853 () Bool)

(assert (=> b!389197 m!384853))

(declare-fun m!384855 () Bool)

(assert (=> b!389197 m!384855))

(assert (=> b!389197 m!384671))

(declare-fun m!384857 () Bool)

(assert (=> b!389197 m!384857))

(declare-fun m!384859 () Bool)

(assert (=> bm!27418 m!384859))

(assert (=> b!388897 d!72713))

(declare-fun condMapEmpty!15972 () Bool)

(declare-fun mapDefault!15972 () ValueCell!4454)

(assert (=> mapNonEmpty!15963 (= condMapEmpty!15972 (= mapRest!15963 ((as const (Array (_ BitVec 32) ValueCell!4454)) mapDefault!15972)))))

(declare-fun e!235792 () Bool)

(declare-fun mapRes!15972 () Bool)

(assert (=> mapNonEmpty!15963 (= tp!31527 (and e!235792 mapRes!15972))))

(declare-fun mapIsEmpty!15972 () Bool)

(assert (=> mapIsEmpty!15972 mapRes!15972))

(declare-fun b!389206 () Bool)

(assert (=> b!389206 (= e!235792 tp_is_empty!9595)))

(declare-fun mapNonEmpty!15972 () Bool)

(declare-fun tp!31542 () Bool)

(declare-fun e!235793 () Bool)

(assert (=> mapNonEmpty!15972 (= mapRes!15972 (and tp!31542 e!235793))))

(declare-fun mapKey!15972 () (_ BitVec 32))

(declare-fun mapValue!15972 () ValueCell!4454)

(declare-fun mapRest!15972 () (Array (_ BitVec 32) ValueCell!4454))

(assert (=> mapNonEmpty!15972 (= mapRest!15963 (store mapRest!15972 mapKey!15972 mapValue!15972))))

(declare-fun b!389205 () Bool)

(assert (=> b!389205 (= e!235793 tp_is_empty!9595)))

(assert (= (and mapNonEmpty!15963 condMapEmpty!15972) mapIsEmpty!15972))

(assert (= (and mapNonEmpty!15963 (not condMapEmpty!15972)) mapNonEmpty!15972))

(assert (= (and mapNonEmpty!15972 ((_ is ValueCellFull!4454) mapValue!15972)) b!389205))

(assert (= (and mapNonEmpty!15963 ((_ is ValueCellFull!4454) mapDefault!15972)) b!389206))

(declare-fun m!384861 () Bool)

(assert (=> mapNonEmpty!15972 m!384861))

(declare-fun b_lambda!8569 () Bool)

(assert (= b_lambda!8557 (or (and start!37850 b_free!8923) b_lambda!8569)))

(declare-fun b_lambda!8571 () Bool)

(assert (= b_lambda!8567 (or (and start!37850 b_free!8923) b_lambda!8571)))

(declare-fun b_lambda!8573 () Bool)

(assert (= b_lambda!8559 (or (and start!37850 b_free!8923) b_lambda!8573)))

(declare-fun b_lambda!8575 () Bool)

(assert (= b_lambda!8563 (or (and start!37850 b_free!8923) b_lambda!8575)))

(declare-fun b_lambda!8577 () Bool)

(assert (= b_lambda!8561 (or (and start!37850 b_free!8923) b_lambda!8577)))

(declare-fun b_lambda!8579 () Bool)

(assert (= b_lambda!8565 (or (and start!37850 b_free!8923) b_lambda!8579)))

(check-sat (not bm!27409) (not bm!27414) (not d!72673) (not bm!27400) (not b!389191) (not b_lambda!8575) (not b!389172) (not b!389177) (not b!389157) (not d!72697) (not b!389124) (not b_lambda!8579) b_and!16179 (not b!389120) (not d!72699) (not b!389026) (not b!389090) (not b!389182) (not b!389119) (not b!389030) (not b!389024) (not b!389100) (not bm!27413) (not b!389176) (not b!389173) (not b!389169) (not bm!27418) (not bm!27375) (not d!72693) (not b!389107) (not b!389113) (not b!389104) (not b!389099) (not b!389121) (not b!389108) (not d!72679) (not b!389128) (not b!389022) (not bm!27393) (not d!72675) (not b!389092) (not b_lambda!8569) (not b_lambda!8573) (not b!389195) (not bm!27404) (not b!389023) (not b!389111) (not b!389122) (not b!389158) (not b!389174) (not bm!27396) (not bm!27390) (not b!389167) tp_is_empty!9595 (not b!389135) (not bm!27410) (not bm!27401) (not b!389129) (not b!389087) (not d!72691) (not b!389134) (not b_lambda!8571) (not b!389031) (not b!389166) (not b!389159) (not b!389165) (not b!389180) (not b!389175) (not d!72677) (not d!72683) (not b_next!8923) (not b!389101) (not b!389080) (not bm!27417) (not mapNonEmpty!15972) (not b!389078) (not bm!27403) (not b!389171) (not b_lambda!8577) (not b!389193) (not b!389142) (not b!389168) (not b!389083) (not b!389021) (not b!389197) (not d!72695) (not b!389079) (not d!72681) (not d!72689) (not b!389181) (not b!389170) (not b!389086) (not bm!27397) (not bm!27394) (not b!389027) (not b!389125))
(check-sat b_and!16179 (not b_next!8923))
