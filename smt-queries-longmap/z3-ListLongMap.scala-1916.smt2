; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34072 () Bool)

(assert start!34072)

(declare-fun b_free!7165 () Bool)

(declare-fun b_next!7165 () Bool)

(assert (=> start!34072 (= b_free!7165 (not b_next!7165))))

(declare-fun tp!25019 () Bool)

(declare-fun b_and!14373 () Bool)

(assert (=> start!34072 (= tp!25019 b_and!14373)))

(declare-fun mapNonEmpty!12093 () Bool)

(declare-fun mapRes!12093 () Bool)

(declare-fun tp!25020 () Bool)

(declare-fun e!208387 () Bool)

(assert (=> mapNonEmpty!12093 (= mapRes!12093 (and tp!25020 e!208387))))

(declare-fun mapKey!12093 () (_ BitVec 32))

(declare-datatypes ((V!10467 0))(
  ( (V!10468 (val!3603 Int)) )
))
(declare-datatypes ((ValueCell!3215 0))(
  ( (ValueCellFull!3215 (v!5773 V!10467)) (EmptyCell!3215) )
))
(declare-fun mapValue!12093 () ValueCell!3215)

(declare-datatypes ((array!17816 0))(
  ( (array!17817 (arr!8431 (Array (_ BitVec 32) ValueCell!3215)) (size!8783 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17816)

(declare-fun mapRest!12093 () (Array (_ BitVec 32) ValueCell!3215))

(assert (=> mapNonEmpty!12093 (= (arr!8431 _values!1525) (store mapRest!12093 mapKey!12093 mapValue!12093))))

(declare-fun b!339676 () Bool)

(declare-fun e!208390 () Bool)

(declare-fun tp_is_empty!7117 () Bool)

(assert (=> b!339676 (= e!208390 tp_is_empty!7117)))

(declare-fun mapIsEmpty!12093 () Bool)

(assert (=> mapIsEmpty!12093 mapRes!12093))

(declare-fun res!187662 () Bool)

(declare-fun e!208391 () Bool)

(assert (=> start!34072 (=> (not res!187662) (not e!208391))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34072 (= res!187662 (validMask!0 mask!2385))))

(assert (=> start!34072 e!208391))

(assert (=> start!34072 true))

(assert (=> start!34072 tp_is_empty!7117))

(assert (=> start!34072 tp!25019))

(declare-fun e!208389 () Bool)

(declare-fun array_inv!6250 (array!17816) Bool)

(assert (=> start!34072 (and (array_inv!6250 _values!1525) e!208389)))

(declare-datatypes ((array!17818 0))(
  ( (array!17819 (arr!8432 (Array (_ BitVec 32) (_ BitVec 64))) (size!8784 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17818)

(declare-fun array_inv!6251 (array!17818) Bool)

(assert (=> start!34072 (array_inv!6251 _keys!1895)))

(declare-fun b!339677 () Bool)

(assert (=> b!339677 (= e!208387 tp_is_empty!7117)))

(declare-fun b!339678 () Bool)

(declare-fun res!187661 () Bool)

(assert (=> b!339678 (=> (not res!187661) (not e!208391))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339678 (= res!187661 (validKeyInArray!0 k0!1348))))

(declare-fun b!339679 () Bool)

(declare-datatypes ((SeekEntryResult!3215 0))(
  ( (MissingZero!3215 (index!15039 (_ BitVec 32))) (Found!3215 (index!15040 (_ BitVec 32))) (Intermediate!3215 (undefined!4027 Bool) (index!15041 (_ BitVec 32)) (x!33792 (_ BitVec 32))) (Undefined!3215) (MissingVacant!3215 (index!15042 (_ BitVec 32))) )
))
(declare-fun lt!161284 () SeekEntryResult!3215)

(get-info :version)

(assert (=> b!339679 (= e!208391 (and (not ((_ is Found!3215) lt!161284)) (not ((_ is MissingZero!3215) lt!161284)) ((_ is MissingVacant!3215) lt!161284) (bvsge #b00000000000000000000000000000000 (size!8784 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17818 (_ BitVec 32)) SeekEntryResult!3215)

(assert (=> b!339679 (= lt!161284 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339680 () Bool)

(assert (=> b!339680 (= e!208389 (and e!208390 mapRes!12093))))

(declare-fun condMapEmpty!12093 () Bool)

(declare-fun mapDefault!12093 () ValueCell!3215)

(assert (=> b!339680 (= condMapEmpty!12093 (= (arr!8431 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3215)) mapDefault!12093)))))

(declare-fun b!339681 () Bool)

(declare-fun res!187663 () Bool)

(assert (=> b!339681 (=> (not res!187663) (not e!208391))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339681 (= res!187663 (and (= (size!8783 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8784 _keys!1895) (size!8783 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339682 () Bool)

(declare-fun res!187664 () Bool)

(assert (=> b!339682 (=> (not res!187664) (not e!208391))))

(declare-datatypes ((List!4750 0))(
  ( (Nil!4747) (Cons!4746 (h!5602 (_ BitVec 64)) (t!9844 List!4750)) )
))
(declare-fun arrayNoDuplicates!0 (array!17818 (_ BitVec 32) List!4750) Bool)

(assert (=> b!339682 (= res!187664 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4747))))

(declare-fun b!339683 () Bool)

(declare-fun res!187659 () Bool)

(assert (=> b!339683 (=> (not res!187659) (not e!208391))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10467)

(declare-fun zeroValue!1467 () V!10467)

(declare-datatypes ((tuple2!5142 0))(
  ( (tuple2!5143 (_1!2582 (_ BitVec 64)) (_2!2582 V!10467)) )
))
(declare-datatypes ((List!4751 0))(
  ( (Nil!4748) (Cons!4747 (h!5603 tuple2!5142) (t!9845 List!4751)) )
))
(declare-datatypes ((ListLongMap!4057 0))(
  ( (ListLongMap!4058 (toList!2044 List!4751)) )
))
(declare-fun contains!2114 (ListLongMap!4057 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1573 (array!17818 array!17816 (_ BitVec 32) (_ BitVec 32) V!10467 V!10467 (_ BitVec 32) Int) ListLongMap!4057)

(assert (=> b!339683 (= res!187659 (not (contains!2114 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339684 () Bool)

(declare-fun res!187660 () Bool)

(assert (=> b!339684 (=> (not res!187660) (not e!208391))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17818 (_ BitVec 32)) Bool)

(assert (=> b!339684 (= res!187660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34072 res!187662) b!339681))

(assert (= (and b!339681 res!187663) b!339684))

(assert (= (and b!339684 res!187660) b!339682))

(assert (= (and b!339682 res!187664) b!339678))

(assert (= (and b!339678 res!187661) b!339683))

(assert (= (and b!339683 res!187659) b!339679))

(assert (= (and b!339680 condMapEmpty!12093) mapIsEmpty!12093))

(assert (= (and b!339680 (not condMapEmpty!12093)) mapNonEmpty!12093))

(assert (= (and mapNonEmpty!12093 ((_ is ValueCellFull!3215) mapValue!12093)) b!339677))

(assert (= (and b!339680 ((_ is ValueCellFull!3215) mapDefault!12093)) b!339676))

(assert (= start!34072 b!339680))

(declare-fun m!342853 () Bool)

(assert (=> b!339682 m!342853))

(declare-fun m!342855 () Bool)

(assert (=> start!34072 m!342855))

(declare-fun m!342857 () Bool)

(assert (=> start!34072 m!342857))

(declare-fun m!342859 () Bool)

(assert (=> start!34072 m!342859))

(declare-fun m!342861 () Bool)

(assert (=> b!339684 m!342861))

(declare-fun m!342863 () Bool)

(assert (=> b!339683 m!342863))

(assert (=> b!339683 m!342863))

(declare-fun m!342865 () Bool)

(assert (=> b!339683 m!342865))

(declare-fun m!342867 () Bool)

(assert (=> b!339678 m!342867))

(declare-fun m!342869 () Bool)

(assert (=> mapNonEmpty!12093 m!342869))

(declare-fun m!342871 () Bool)

(assert (=> b!339679 m!342871))

(check-sat (not b!339679) (not b!339683) (not b!339684) (not b!339678) (not b!339682) tp_is_empty!7117 b_and!14373 (not mapNonEmpty!12093) (not b_next!7165) (not start!34072))
(check-sat b_and!14373 (not b_next!7165))
(get-model)

(declare-fun d!70895 () Bool)

(declare-fun e!208426 () Bool)

(assert (=> d!70895 e!208426))

(declare-fun res!187703 () Bool)

(assert (=> d!70895 (=> res!187703 e!208426)))

(declare-fun lt!161300 () Bool)

(assert (=> d!70895 (= res!187703 (not lt!161300))))

(declare-fun lt!161301 () Bool)

(assert (=> d!70895 (= lt!161300 lt!161301)))

(declare-datatypes ((Unit!10560 0))(
  ( (Unit!10561) )
))
(declare-fun lt!161299 () Unit!10560)

(declare-fun e!208427 () Unit!10560)

(assert (=> d!70895 (= lt!161299 e!208427)))

(declare-fun c!52553 () Bool)

(assert (=> d!70895 (= c!52553 lt!161301)))

(declare-fun containsKey!323 (List!4751 (_ BitVec 64)) Bool)

(assert (=> d!70895 (= lt!161301 (containsKey!323 (toList!2044 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70895 (= (contains!2114 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161300)))

(declare-fun b!339745 () Bool)

(declare-fun lt!161302 () Unit!10560)

(assert (=> b!339745 (= e!208427 lt!161302)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!271 (List!4751 (_ BitVec 64)) Unit!10560)

(assert (=> b!339745 (= lt!161302 (lemmaContainsKeyImpliesGetValueByKeyDefined!271 (toList!2044 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!338 0))(
  ( (Some!337 (v!5776 V!10467)) (None!336) )
))
(declare-fun isDefined!272 (Option!338) Bool)

(declare-fun getValueByKey!332 (List!4751 (_ BitVec 64)) Option!338)

(assert (=> b!339745 (isDefined!272 (getValueByKey!332 (toList!2044 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339746 () Bool)

(declare-fun Unit!10562 () Unit!10560)

(assert (=> b!339746 (= e!208427 Unit!10562)))

(declare-fun b!339747 () Bool)

(assert (=> b!339747 (= e!208426 (isDefined!272 (getValueByKey!332 (toList!2044 (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70895 c!52553) b!339745))

(assert (= (and d!70895 (not c!52553)) b!339746))

(assert (= (and d!70895 (not res!187703)) b!339747))

(declare-fun m!342913 () Bool)

(assert (=> d!70895 m!342913))

(declare-fun m!342915 () Bool)

(assert (=> b!339745 m!342915))

(declare-fun m!342917 () Bool)

(assert (=> b!339745 m!342917))

(assert (=> b!339745 m!342917))

(declare-fun m!342919 () Bool)

(assert (=> b!339745 m!342919))

(assert (=> b!339747 m!342917))

(assert (=> b!339747 m!342917))

(assert (=> b!339747 m!342919))

(assert (=> b!339683 d!70895))

(declare-fun bm!26483 () Bool)

(declare-fun call!26490 () ListLongMap!4057)

(declare-fun getCurrentListMapNoExtraKeys!589 (array!17818 array!17816 (_ BitVec 32) (_ BitVec 32) V!10467 V!10467 (_ BitVec 32) Int) ListLongMap!4057)

(assert (=> bm!26483 (= call!26490 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun d!70897 () Bool)

(declare-fun e!208463 () Bool)

(assert (=> d!70897 e!208463))

(declare-fun res!187729 () Bool)

(assert (=> d!70897 (=> (not res!187729) (not e!208463))))

(assert (=> d!70897 (= res!187729 (or (bvsge #b00000000000000000000000000000000 (size!8784 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8784 _keys!1895)))))))

(declare-fun lt!161355 () ListLongMap!4057)

(declare-fun lt!161350 () ListLongMap!4057)

(assert (=> d!70897 (= lt!161355 lt!161350)))

(declare-fun lt!161362 () Unit!10560)

(declare-fun e!208460 () Unit!10560)

(assert (=> d!70897 (= lt!161362 e!208460)))

(declare-fun c!52571 () Bool)

(declare-fun e!208465 () Bool)

(assert (=> d!70897 (= c!52571 e!208465)))

(declare-fun res!187727 () Bool)

(assert (=> d!70897 (=> (not res!187727) (not e!208465))))

(assert (=> d!70897 (= res!187727 (bvslt #b00000000000000000000000000000000 (size!8784 _keys!1895)))))

(declare-fun e!208457 () ListLongMap!4057)

(assert (=> d!70897 (= lt!161350 e!208457)))

(declare-fun c!52568 () Bool)

(assert (=> d!70897 (= c!52568 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70897 (validMask!0 mask!2385)))

(assert (=> d!70897 (= (getCurrentListMap!1573 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161355)))

(declare-fun b!339790 () Bool)

(declare-fun e!208461 () Bool)

(declare-fun call!26488 () Bool)

(assert (=> b!339790 (= e!208461 (not call!26488))))

(declare-fun bm!26484 () Bool)

(declare-fun call!26486 () ListLongMap!4057)

(declare-fun call!26489 () ListLongMap!4057)

(assert (=> bm!26484 (= call!26486 call!26489)))

(declare-fun b!339791 () Bool)

(declare-fun res!187722 () Bool)

(assert (=> b!339791 (=> (not res!187722) (not e!208463))))

(declare-fun e!208456 () Bool)

(assert (=> b!339791 (= res!187722 e!208456)))

(declare-fun res!187728 () Bool)

(assert (=> b!339791 (=> res!187728 e!208456)))

(declare-fun e!208466 () Bool)

(assert (=> b!339791 (= res!187728 (not e!208466))))

(declare-fun res!187726 () Bool)

(assert (=> b!339791 (=> (not res!187726) (not e!208466))))

(assert (=> b!339791 (= res!187726 (bvslt #b00000000000000000000000000000000 (size!8784 _keys!1895)))))

(declare-fun b!339792 () Bool)

(declare-fun e!208462 () Bool)

(declare-fun apply!273 (ListLongMap!4057 (_ BitVec 64)) V!10467)

(assert (=> b!339792 (= e!208462 (= (apply!273 lt!161355 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!339793 () Bool)

(declare-fun e!208455 () Bool)

(assert (=> b!339793 (= e!208456 e!208455)))

(declare-fun res!187730 () Bool)

(assert (=> b!339793 (=> (not res!187730) (not e!208455))))

(assert (=> b!339793 (= res!187730 (contains!2114 lt!161355 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8784 _keys!1895)))))

(declare-fun bm!26485 () Bool)

(assert (=> bm!26485 (= call!26489 call!26490)))

(declare-fun b!339794 () Bool)

(declare-fun call!26492 () ListLongMap!4057)

(declare-fun +!724 (ListLongMap!4057 tuple2!5142) ListLongMap!4057)

(assert (=> b!339794 (= e!208457 (+!724 call!26492 (tuple2!5143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!339795 () Bool)

(assert (=> b!339795 (= e!208465 (validKeyInArray!0 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26486 () Bool)

(declare-fun call!26491 () Bool)

(assert (=> bm!26486 (= call!26491 (contains!2114 lt!161355 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26487 () Bool)

(declare-fun call!26487 () ListLongMap!4057)

(assert (=> bm!26487 (= call!26487 call!26492)))

(declare-fun b!339796 () Bool)

(declare-fun e!208458 () Bool)

(assert (=> b!339796 (= e!208458 (not call!26491))))

(declare-fun b!339797 () Bool)

(declare-fun e!208459 () ListLongMap!4057)

(assert (=> b!339797 (= e!208459 call!26486)))

(declare-fun b!339798 () Bool)

(declare-fun e!208454 () ListLongMap!4057)

(assert (=> b!339798 (= e!208457 e!208454)))

(declare-fun c!52570 () Bool)

(assert (=> b!339798 (= c!52570 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339799 () Bool)

(declare-fun Unit!10563 () Unit!10560)

(assert (=> b!339799 (= e!208460 Unit!10563)))

(declare-fun b!339800 () Bool)

(declare-fun e!208464 () Bool)

(assert (=> b!339800 (= e!208458 e!208464)))

(declare-fun res!187724 () Bool)

(assert (=> b!339800 (= res!187724 call!26491)))

(assert (=> b!339800 (=> (not res!187724) (not e!208464))))

(declare-fun b!339801 () Bool)

(assert (=> b!339801 (= e!208459 call!26487)))

(declare-fun b!339802 () Bool)

(declare-fun get!4597 (ValueCell!3215 V!10467) V!10467)

(declare-fun dynLambda!616 (Int (_ BitVec 64)) V!10467)

(assert (=> b!339802 (= e!208455 (= (apply!273 lt!161355 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)) (get!4597 (select (arr!8431 _values!1525) #b00000000000000000000000000000000) (dynLambda!616 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8783 _values!1525)))))

(assert (=> b!339802 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8784 _keys!1895)))))

(declare-fun b!339803 () Bool)

(declare-fun lt!161363 () Unit!10560)

(assert (=> b!339803 (= e!208460 lt!161363)))

(declare-fun lt!161349 () ListLongMap!4057)

(assert (=> b!339803 (= lt!161349 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161365 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161365 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161353 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161353 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161358 () Unit!10560)

(declare-fun addStillContains!249 (ListLongMap!4057 (_ BitVec 64) V!10467 (_ BitVec 64)) Unit!10560)

(assert (=> b!339803 (= lt!161358 (addStillContains!249 lt!161349 lt!161365 zeroValue!1467 lt!161353))))

(assert (=> b!339803 (contains!2114 (+!724 lt!161349 (tuple2!5143 lt!161365 zeroValue!1467)) lt!161353)))

(declare-fun lt!161364 () Unit!10560)

(assert (=> b!339803 (= lt!161364 lt!161358)))

(declare-fun lt!161368 () ListLongMap!4057)

(assert (=> b!339803 (= lt!161368 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161356 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161356 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161360 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161360 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161367 () Unit!10560)

(declare-fun addApplyDifferent!249 (ListLongMap!4057 (_ BitVec 64) V!10467 (_ BitVec 64)) Unit!10560)

(assert (=> b!339803 (= lt!161367 (addApplyDifferent!249 lt!161368 lt!161356 minValue!1467 lt!161360))))

(assert (=> b!339803 (= (apply!273 (+!724 lt!161368 (tuple2!5143 lt!161356 minValue!1467)) lt!161360) (apply!273 lt!161368 lt!161360))))

(declare-fun lt!161359 () Unit!10560)

(assert (=> b!339803 (= lt!161359 lt!161367)))

(declare-fun lt!161347 () ListLongMap!4057)

(assert (=> b!339803 (= lt!161347 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161361 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161361 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161366 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161366 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161352 () Unit!10560)

(assert (=> b!339803 (= lt!161352 (addApplyDifferent!249 lt!161347 lt!161361 zeroValue!1467 lt!161366))))

(assert (=> b!339803 (= (apply!273 (+!724 lt!161347 (tuple2!5143 lt!161361 zeroValue!1467)) lt!161366) (apply!273 lt!161347 lt!161366))))

(declare-fun lt!161357 () Unit!10560)

(assert (=> b!339803 (= lt!161357 lt!161352)))

(declare-fun lt!161351 () ListLongMap!4057)

(assert (=> b!339803 (= lt!161351 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161354 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161354 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161348 () (_ BitVec 64))

(assert (=> b!339803 (= lt!161348 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339803 (= lt!161363 (addApplyDifferent!249 lt!161351 lt!161354 minValue!1467 lt!161348))))

(assert (=> b!339803 (= (apply!273 (+!724 lt!161351 (tuple2!5143 lt!161354 minValue!1467)) lt!161348) (apply!273 lt!161351 lt!161348))))

(declare-fun b!339804 () Bool)

(assert (=> b!339804 (= e!208454 call!26487)))

(declare-fun b!339805 () Bool)

(assert (=> b!339805 (= e!208464 (= (apply!273 lt!161355 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!339806 () Bool)

(assert (=> b!339806 (= e!208461 e!208462)))

(declare-fun res!187725 () Bool)

(assert (=> b!339806 (= res!187725 call!26488)))

(assert (=> b!339806 (=> (not res!187725) (not e!208462))))

(declare-fun b!339807 () Bool)

(declare-fun res!187723 () Bool)

(assert (=> b!339807 (=> (not res!187723) (not e!208463))))

(assert (=> b!339807 (= res!187723 e!208461)))

(declare-fun c!52569 () Bool)

(assert (=> b!339807 (= c!52569 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!339808 () Bool)

(assert (=> b!339808 (= e!208463 e!208458)))

(declare-fun c!52566 () Bool)

(assert (=> b!339808 (= c!52566 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26488 () Bool)

(assert (=> bm!26488 (= call!26488 (contains!2114 lt!161355 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339809 () Bool)

(assert (=> b!339809 (= e!208466 (validKeyInArray!0 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26489 () Bool)

(assert (=> bm!26489 (= call!26492 (+!724 (ite c!52568 call!26490 (ite c!52570 call!26489 call!26486)) (ite (or c!52568 c!52570) (tuple2!5143 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5143 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!339810 () Bool)

(declare-fun c!52567 () Bool)

(assert (=> b!339810 (= c!52567 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!339810 (= e!208454 e!208459)))

(assert (= (and d!70897 c!52568) b!339794))

(assert (= (and d!70897 (not c!52568)) b!339798))

(assert (= (and b!339798 c!52570) b!339804))

(assert (= (and b!339798 (not c!52570)) b!339810))

(assert (= (and b!339810 c!52567) b!339801))

(assert (= (and b!339810 (not c!52567)) b!339797))

(assert (= (or b!339801 b!339797) bm!26484))

(assert (= (or b!339804 bm!26484) bm!26485))

(assert (= (or b!339804 b!339801) bm!26487))

(assert (= (or b!339794 bm!26485) bm!26483))

(assert (= (or b!339794 bm!26487) bm!26489))

(assert (= (and d!70897 res!187727) b!339795))

(assert (= (and d!70897 c!52571) b!339803))

(assert (= (and d!70897 (not c!52571)) b!339799))

(assert (= (and d!70897 res!187729) b!339791))

(assert (= (and b!339791 res!187726) b!339809))

(assert (= (and b!339791 (not res!187728)) b!339793))

(assert (= (and b!339793 res!187730) b!339802))

(assert (= (and b!339791 res!187722) b!339807))

(assert (= (and b!339807 c!52569) b!339806))

(assert (= (and b!339807 (not c!52569)) b!339790))

(assert (= (and b!339806 res!187725) b!339792))

(assert (= (or b!339806 b!339790) bm!26488))

(assert (= (and b!339807 res!187723) b!339808))

(assert (= (and b!339808 c!52566) b!339800))

(assert (= (and b!339808 (not c!52566)) b!339796))

(assert (= (and b!339800 res!187724) b!339805))

(assert (= (or b!339800 b!339796) bm!26486))

(declare-fun b_lambda!8453 () Bool)

(assert (=> (not b_lambda!8453) (not b!339802)))

(declare-fun t!9847 () Bool)

(declare-fun tb!3053 () Bool)

(assert (=> (and start!34072 (= defaultEntry!1528 defaultEntry!1528) t!9847) tb!3053))

(declare-fun result!5505 () Bool)

(assert (=> tb!3053 (= result!5505 tp_is_empty!7117)))

(assert (=> b!339802 t!9847))

(declare-fun b_and!14379 () Bool)

(assert (= b_and!14373 (and (=> t!9847 result!5505) b_and!14379)))

(declare-fun m!342921 () Bool)

(assert (=> bm!26486 m!342921))

(declare-fun m!342923 () Bool)

(assert (=> bm!26488 m!342923))

(assert (=> d!70897 m!342855))

(declare-fun m!342925 () Bool)

(assert (=> b!339795 m!342925))

(assert (=> b!339795 m!342925))

(declare-fun m!342927 () Bool)

(assert (=> b!339795 m!342927))

(assert (=> b!339802 m!342925))

(declare-fun m!342929 () Bool)

(assert (=> b!339802 m!342929))

(declare-fun m!342931 () Bool)

(assert (=> b!339802 m!342931))

(declare-fun m!342933 () Bool)

(assert (=> b!339802 m!342933))

(assert (=> b!339802 m!342931))

(declare-fun m!342935 () Bool)

(assert (=> b!339802 m!342935))

(assert (=> b!339802 m!342933))

(assert (=> b!339802 m!342925))

(declare-fun m!342937 () Bool)

(assert (=> b!339792 m!342937))

(declare-fun m!342939 () Bool)

(assert (=> bm!26489 m!342939))

(declare-fun m!342941 () Bool)

(assert (=> b!339794 m!342941))

(declare-fun m!342943 () Bool)

(assert (=> b!339803 m!342943))

(declare-fun m!342945 () Bool)

(assert (=> b!339803 m!342945))

(declare-fun m!342947 () Bool)

(assert (=> b!339803 m!342947))

(declare-fun m!342949 () Bool)

(assert (=> b!339803 m!342949))

(declare-fun m!342951 () Bool)

(assert (=> b!339803 m!342951))

(declare-fun m!342953 () Bool)

(assert (=> b!339803 m!342953))

(declare-fun m!342955 () Bool)

(assert (=> b!339803 m!342955))

(declare-fun m!342957 () Bool)

(assert (=> b!339803 m!342957))

(assert (=> b!339803 m!342925))

(declare-fun m!342959 () Bool)

(assert (=> b!339803 m!342959))

(declare-fun m!342961 () Bool)

(assert (=> b!339803 m!342961))

(declare-fun m!342963 () Bool)

(assert (=> b!339803 m!342963))

(assert (=> b!339803 m!342949))

(assert (=> b!339803 m!342953))

(declare-fun m!342965 () Bool)

(assert (=> b!339803 m!342965))

(declare-fun m!342967 () Bool)

(assert (=> b!339803 m!342967))

(declare-fun m!342969 () Bool)

(assert (=> b!339803 m!342969))

(declare-fun m!342971 () Bool)

(assert (=> b!339803 m!342971))

(assert (=> b!339803 m!342967))

(assert (=> b!339803 m!342947))

(declare-fun m!342973 () Bool)

(assert (=> b!339803 m!342973))

(assert (=> bm!26483 m!342963))

(declare-fun m!342975 () Bool)

(assert (=> b!339805 m!342975))

(assert (=> b!339809 m!342925))

(assert (=> b!339809 m!342925))

(assert (=> b!339809 m!342927))

(assert (=> b!339793 m!342925))

(assert (=> b!339793 m!342925))

(declare-fun m!342977 () Bool)

(assert (=> b!339793 m!342977))

(assert (=> b!339683 d!70897))

(declare-fun bm!26492 () Bool)

(declare-fun call!26495 () Bool)

(declare-fun c!52574 () Bool)

(assert (=> bm!26492 (= call!26495 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52574 (Cons!4746 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000) Nil!4747) Nil!4747)))))

(declare-fun b!339823 () Bool)

(declare-fun e!208475 () Bool)

(declare-fun e!208478 () Bool)

(assert (=> b!339823 (= e!208475 e!208478)))

(assert (=> b!339823 (= c!52574 (validKeyInArray!0 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339824 () Bool)

(declare-fun e!208476 () Bool)

(declare-fun contains!2115 (List!4750 (_ BitVec 64)) Bool)

(assert (=> b!339824 (= e!208476 (contains!2115 Nil!4747 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339825 () Bool)

(assert (=> b!339825 (= e!208478 call!26495)))

(declare-fun b!339826 () Bool)

(declare-fun e!208477 () Bool)

(assert (=> b!339826 (= e!208477 e!208475)))

(declare-fun res!187739 () Bool)

(assert (=> b!339826 (=> (not res!187739) (not e!208475))))

(assert (=> b!339826 (= res!187739 (not e!208476))))

(declare-fun res!187737 () Bool)

(assert (=> b!339826 (=> (not res!187737) (not e!208476))))

(assert (=> b!339826 (= res!187737 (validKeyInArray!0 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70899 () Bool)

(declare-fun res!187738 () Bool)

(assert (=> d!70899 (=> res!187738 e!208477)))

(assert (=> d!70899 (= res!187738 (bvsge #b00000000000000000000000000000000 (size!8784 _keys!1895)))))

(assert (=> d!70899 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4747) e!208477)))

(declare-fun b!339827 () Bool)

(assert (=> b!339827 (= e!208478 call!26495)))

(assert (= (and d!70899 (not res!187738)) b!339826))

(assert (= (and b!339826 res!187737) b!339824))

(assert (= (and b!339826 res!187739) b!339823))

(assert (= (and b!339823 c!52574) b!339825))

(assert (= (and b!339823 (not c!52574)) b!339827))

(assert (= (or b!339825 b!339827) bm!26492))

(assert (=> bm!26492 m!342925))

(declare-fun m!342979 () Bool)

(assert (=> bm!26492 m!342979))

(assert (=> b!339823 m!342925))

(assert (=> b!339823 m!342925))

(assert (=> b!339823 m!342927))

(assert (=> b!339824 m!342925))

(assert (=> b!339824 m!342925))

(declare-fun m!342981 () Bool)

(assert (=> b!339824 m!342981))

(assert (=> b!339826 m!342925))

(assert (=> b!339826 m!342925))

(assert (=> b!339826 m!342927))

(assert (=> b!339682 d!70899))

(declare-fun d!70901 () Bool)

(assert (=> d!70901 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34072 d!70901))

(declare-fun d!70903 () Bool)

(assert (=> d!70903 (= (array_inv!6250 _values!1525) (bvsge (size!8783 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34072 d!70903))

(declare-fun d!70905 () Bool)

(assert (=> d!70905 (= (array_inv!6251 _keys!1895) (bvsge (size!8784 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34072 d!70905))

(declare-fun b!339840 () Bool)

(declare-fun e!208487 () SeekEntryResult!3215)

(declare-fun lt!161375 () SeekEntryResult!3215)

(assert (=> b!339840 (= e!208487 (MissingZero!3215 (index!15041 lt!161375)))))

(declare-fun b!339841 () Bool)

(declare-fun e!208485 () SeekEntryResult!3215)

(assert (=> b!339841 (= e!208485 (Found!3215 (index!15041 lt!161375)))))

(declare-fun b!339842 () Bool)

(declare-fun e!208486 () SeekEntryResult!3215)

(assert (=> b!339842 (= e!208486 e!208485)))

(declare-fun lt!161377 () (_ BitVec 64))

(assert (=> b!339842 (= lt!161377 (select (arr!8432 _keys!1895) (index!15041 lt!161375)))))

(declare-fun c!52581 () Bool)

(assert (=> b!339842 (= c!52581 (= lt!161377 k0!1348))))

(declare-fun b!339843 () Bool)

(assert (=> b!339843 (= e!208486 Undefined!3215)))

(declare-fun b!339844 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17818 (_ BitVec 32)) SeekEntryResult!3215)

(assert (=> b!339844 (= e!208487 (seekKeyOrZeroReturnVacant!0 (x!33792 lt!161375) (index!15041 lt!161375) (index!15041 lt!161375) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339845 () Bool)

(declare-fun c!52583 () Bool)

(assert (=> b!339845 (= c!52583 (= lt!161377 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!339845 (= e!208485 e!208487)))

(declare-fun d!70907 () Bool)

(declare-fun lt!161376 () SeekEntryResult!3215)

(assert (=> d!70907 (and (or ((_ is Undefined!3215) lt!161376) (not ((_ is Found!3215) lt!161376)) (and (bvsge (index!15040 lt!161376) #b00000000000000000000000000000000) (bvslt (index!15040 lt!161376) (size!8784 _keys!1895)))) (or ((_ is Undefined!3215) lt!161376) ((_ is Found!3215) lt!161376) (not ((_ is MissingZero!3215) lt!161376)) (and (bvsge (index!15039 lt!161376) #b00000000000000000000000000000000) (bvslt (index!15039 lt!161376) (size!8784 _keys!1895)))) (or ((_ is Undefined!3215) lt!161376) ((_ is Found!3215) lt!161376) ((_ is MissingZero!3215) lt!161376) (not ((_ is MissingVacant!3215) lt!161376)) (and (bvsge (index!15042 lt!161376) #b00000000000000000000000000000000) (bvslt (index!15042 lt!161376) (size!8784 _keys!1895)))) (or ((_ is Undefined!3215) lt!161376) (ite ((_ is Found!3215) lt!161376) (= (select (arr!8432 _keys!1895) (index!15040 lt!161376)) k0!1348) (ite ((_ is MissingZero!3215) lt!161376) (= (select (arr!8432 _keys!1895) (index!15039 lt!161376)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3215) lt!161376) (= (select (arr!8432 _keys!1895) (index!15042 lt!161376)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70907 (= lt!161376 e!208486)))

(declare-fun c!52582 () Bool)

(assert (=> d!70907 (= c!52582 (and ((_ is Intermediate!3215) lt!161375) (undefined!4027 lt!161375)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17818 (_ BitVec 32)) SeekEntryResult!3215)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70907 (= lt!161375 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70907 (validMask!0 mask!2385)))

(assert (=> d!70907 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161376)))

(assert (= (and d!70907 c!52582) b!339843))

(assert (= (and d!70907 (not c!52582)) b!339842))

(assert (= (and b!339842 c!52581) b!339841))

(assert (= (and b!339842 (not c!52581)) b!339845))

(assert (= (and b!339845 c!52583) b!339840))

(assert (= (and b!339845 (not c!52583)) b!339844))

(declare-fun m!342983 () Bool)

(assert (=> b!339842 m!342983))

(declare-fun m!342985 () Bool)

(assert (=> b!339844 m!342985))

(declare-fun m!342987 () Bool)

(assert (=> d!70907 m!342987))

(declare-fun m!342989 () Bool)

(assert (=> d!70907 m!342989))

(declare-fun m!342991 () Bool)

(assert (=> d!70907 m!342991))

(assert (=> d!70907 m!342855))

(assert (=> d!70907 m!342989))

(declare-fun m!342993 () Bool)

(assert (=> d!70907 m!342993))

(declare-fun m!342995 () Bool)

(assert (=> d!70907 m!342995))

(assert (=> b!339679 d!70907))

(declare-fun b!339854 () Bool)

(declare-fun e!208496 () Bool)

(declare-fun call!26498 () Bool)

(assert (=> b!339854 (= e!208496 call!26498)))

(declare-fun d!70909 () Bool)

(declare-fun res!187744 () Bool)

(declare-fun e!208495 () Bool)

(assert (=> d!70909 (=> res!187744 e!208495)))

(assert (=> d!70909 (= res!187744 (bvsge #b00000000000000000000000000000000 (size!8784 _keys!1895)))))

(assert (=> d!70909 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208495)))

(declare-fun bm!26495 () Bool)

(assert (=> bm!26495 (= call!26498 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!339855 () Bool)

(declare-fun e!208494 () Bool)

(assert (=> b!339855 (= e!208495 e!208494)))

(declare-fun c!52586 () Bool)

(assert (=> b!339855 (= c!52586 (validKeyInArray!0 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339856 () Bool)

(assert (=> b!339856 (= e!208494 e!208496)))

(declare-fun lt!161384 () (_ BitVec 64))

(assert (=> b!339856 (= lt!161384 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161385 () Unit!10560)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17818 (_ BitVec 64) (_ BitVec 32)) Unit!10560)

(assert (=> b!339856 (= lt!161385 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161384 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339856 (arrayContainsKey!0 _keys!1895 lt!161384 #b00000000000000000000000000000000)))

(declare-fun lt!161386 () Unit!10560)

(assert (=> b!339856 (= lt!161386 lt!161385)))

(declare-fun res!187745 () Bool)

(assert (=> b!339856 (= res!187745 (= (seekEntryOrOpen!0 (select (arr!8432 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3215 #b00000000000000000000000000000000)))))

(assert (=> b!339856 (=> (not res!187745) (not e!208496))))

(declare-fun b!339857 () Bool)

(assert (=> b!339857 (= e!208494 call!26498)))

(assert (= (and d!70909 (not res!187744)) b!339855))

(assert (= (and b!339855 c!52586) b!339856))

(assert (= (and b!339855 (not c!52586)) b!339857))

(assert (= (and b!339856 res!187745) b!339854))

(assert (= (or b!339854 b!339857) bm!26495))

(declare-fun m!342997 () Bool)

(assert (=> bm!26495 m!342997))

(assert (=> b!339855 m!342925))

(assert (=> b!339855 m!342925))

(assert (=> b!339855 m!342927))

(assert (=> b!339856 m!342925))

(declare-fun m!342999 () Bool)

(assert (=> b!339856 m!342999))

(declare-fun m!343001 () Bool)

(assert (=> b!339856 m!343001))

(assert (=> b!339856 m!342925))

(declare-fun m!343003 () Bool)

(assert (=> b!339856 m!343003))

(assert (=> b!339684 d!70909))

(declare-fun d!70911 () Bool)

(assert (=> d!70911 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339678 d!70911))

(declare-fun mapNonEmpty!12102 () Bool)

(declare-fun mapRes!12102 () Bool)

(declare-fun tp!25035 () Bool)

(declare-fun e!208501 () Bool)

(assert (=> mapNonEmpty!12102 (= mapRes!12102 (and tp!25035 e!208501))))

(declare-fun mapValue!12102 () ValueCell!3215)

(declare-fun mapRest!12102 () (Array (_ BitVec 32) ValueCell!3215))

(declare-fun mapKey!12102 () (_ BitVec 32))

(assert (=> mapNonEmpty!12102 (= mapRest!12093 (store mapRest!12102 mapKey!12102 mapValue!12102))))

(declare-fun b!339864 () Bool)

(assert (=> b!339864 (= e!208501 tp_is_empty!7117)))

(declare-fun mapIsEmpty!12102 () Bool)

(assert (=> mapIsEmpty!12102 mapRes!12102))

(declare-fun condMapEmpty!12102 () Bool)

(declare-fun mapDefault!12102 () ValueCell!3215)

(assert (=> mapNonEmpty!12093 (= condMapEmpty!12102 (= mapRest!12093 ((as const (Array (_ BitVec 32) ValueCell!3215)) mapDefault!12102)))))

(declare-fun e!208502 () Bool)

(assert (=> mapNonEmpty!12093 (= tp!25020 (and e!208502 mapRes!12102))))

(declare-fun b!339865 () Bool)

(assert (=> b!339865 (= e!208502 tp_is_empty!7117)))

(assert (= (and mapNonEmpty!12093 condMapEmpty!12102) mapIsEmpty!12102))

(assert (= (and mapNonEmpty!12093 (not condMapEmpty!12102)) mapNonEmpty!12102))

(assert (= (and mapNonEmpty!12102 ((_ is ValueCellFull!3215) mapValue!12102)) b!339864))

(assert (= (and mapNonEmpty!12093 ((_ is ValueCellFull!3215) mapDefault!12102)) b!339865))

(declare-fun m!343005 () Bool)

(assert (=> mapNonEmpty!12102 m!343005))

(declare-fun b_lambda!8455 () Bool)

(assert (= b_lambda!8453 (or (and start!34072 b_free!7165) b_lambda!8455)))

(check-sat (not b!339794) (not b!339805) (not b!339803) (not b!339747) (not b!339826) (not b!339809) (not bm!26483) (not b_next!7165) (not b!339823) (not b!339795) (not b!339856) (not bm!26495) (not b_lambda!8455) (not b!339745) tp_is_empty!7117 (not bm!26492) (not d!70907) (not d!70895) (not b!339824) (not bm!26489) (not d!70897) (not b!339855) (not b!339802) (not bm!26486) (not b!339793) (not b!339844) (not bm!26488) b_and!14379 (not b!339792) (not mapNonEmpty!12102))
(check-sat b_and!14379 (not b_next!7165))
