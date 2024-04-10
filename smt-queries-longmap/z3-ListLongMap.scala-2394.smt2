; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37894 () Bool)

(assert start!37894)

(declare-fun b_free!8931 () Bool)

(declare-fun b_next!8931 () Bool)

(assert (=> start!37894 (= b_free!8931 (not b_next!8931))))

(declare-fun tp!31554 () Bool)

(declare-fun b_and!16209 () Bool)

(assert (=> start!37894 (= tp!31554 b_and!16209)))

(declare-fun b!389548 () Bool)

(declare-fun e!236005 () Bool)

(declare-fun e!236004 () Bool)

(assert (=> b!389548 (= e!236005 e!236004)))

(declare-fun res!222827 () Bool)

(assert (=> b!389548 (=> (not res!222827) (not e!236004))))

(declare-datatypes ((array!23101 0))(
  ( (array!23102 (arr!11016 (Array (_ BitVec 32) (_ BitVec 64))) (size!11368 (_ BitVec 32))) )
))
(declare-fun lt!183186 () array!23101)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23101 (_ BitVec 32)) Bool)

(assert (=> b!389548 (= res!222827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183186 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23101)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!389548 (= lt!183186 (array!23102 (store (arr!11016 _keys!658) i!548 k0!778) (size!11368 _keys!658)))))

(declare-fun b!389549 () Bool)

(declare-fun e!236007 () Bool)

(declare-fun tp_is_empty!9603 () Bool)

(assert (=> b!389549 (= e!236007 tp_is_empty!9603)))

(declare-fun b!389550 () Bool)

(declare-fun e!236009 () Bool)

(declare-fun mapRes!15978 () Bool)

(assert (=> b!389550 (= e!236009 (and e!236007 mapRes!15978))))

(declare-fun condMapEmpty!15978 () Bool)

(declare-datatypes ((V!13909 0))(
  ( (V!13910 (val!4846 Int)) )
))
(declare-datatypes ((ValueCell!4458 0))(
  ( (ValueCellFull!4458 (v!7055 V!13909)) (EmptyCell!4458) )
))
(declare-datatypes ((array!23103 0))(
  ( (array!23104 (arr!11017 (Array (_ BitVec 32) ValueCell!4458)) (size!11369 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23103)

(declare-fun mapDefault!15978 () ValueCell!4458)

(assert (=> b!389550 (= condMapEmpty!15978 (= (arr!11017 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4458)) mapDefault!15978)))))

(declare-fun b!389551 () Bool)

(declare-fun res!222829 () Bool)

(assert (=> b!389551 (=> (not res!222829) (not e!236005))))

(assert (=> b!389551 (= res!222829 (or (= (select (arr!11016 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11016 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389552 () Bool)

(declare-fun res!222828 () Bool)

(assert (=> b!389552 (=> (not res!222828) (not e!236004))))

(declare-datatypes ((List!6370 0))(
  ( (Nil!6367) (Cons!6366 (h!7222 (_ BitVec 64)) (t!11526 List!6370)) )
))
(declare-fun arrayNoDuplicates!0 (array!23101 (_ BitVec 32) List!6370) Bool)

(assert (=> b!389552 (= res!222828 (arrayNoDuplicates!0 lt!183186 #b00000000000000000000000000000000 Nil!6367))))

(declare-fun b!389553 () Bool)

(declare-fun res!222826 () Bool)

(assert (=> b!389553 (=> (not res!222826) (not e!236005))))

(assert (=> b!389553 (= res!222826 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11368 _keys!658))))))

(declare-fun mapIsEmpty!15978 () Bool)

(assert (=> mapIsEmpty!15978 mapRes!15978))

(declare-fun b!389554 () Bool)

(declare-fun e!236008 () Bool)

(assert (=> b!389554 (= e!236008 tp_is_empty!9603)))

(declare-fun mapNonEmpty!15978 () Bool)

(declare-fun tp!31553 () Bool)

(assert (=> mapNonEmpty!15978 (= mapRes!15978 (and tp!31553 e!236008))))

(declare-fun mapValue!15978 () ValueCell!4458)

(declare-fun mapKey!15978 () (_ BitVec 32))

(declare-fun mapRest!15978 () (Array (_ BitVec 32) ValueCell!4458))

(assert (=> mapNonEmpty!15978 (= (arr!11017 _values!506) (store mapRest!15978 mapKey!15978 mapValue!15978))))

(declare-fun b!389555 () Bool)

(declare-fun res!222821 () Bool)

(assert (=> b!389555 (=> (not res!222821) (not e!236005))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!389555 (= res!222821 (and (= (size!11369 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11368 _keys!658) (size!11369 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!389556 () Bool)

(declare-fun res!222822 () Bool)

(assert (=> b!389556 (=> (not res!222822) (not e!236005))))

(assert (=> b!389556 (= res!222822 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6367))))

(declare-fun res!222823 () Bool)

(assert (=> start!37894 (=> (not res!222823) (not e!236005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37894 (= res!222823 (validMask!0 mask!970))))

(assert (=> start!37894 e!236005))

(declare-fun array_inv!8096 (array!23103) Bool)

(assert (=> start!37894 (and (array_inv!8096 _values!506) e!236009)))

(assert (=> start!37894 tp!31554))

(assert (=> start!37894 true))

(assert (=> start!37894 tp_is_empty!9603))

(declare-fun array_inv!8097 (array!23101) Bool)

(assert (=> start!37894 (array_inv!8097 _keys!658)))

(declare-fun b!389557 () Bool)

(declare-fun res!222824 () Bool)

(assert (=> b!389557 (=> (not res!222824) (not e!236005))))

(assert (=> b!389557 (= res!222824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!389558 () Bool)

(declare-fun e!236003 () Bool)

(assert (=> b!389558 (= e!236004 (not e!236003))))

(declare-fun res!222820 () Bool)

(assert (=> b!389558 (=> res!222820 e!236003)))

(assert (=> b!389558 (= res!222820 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6516 0))(
  ( (tuple2!6517 (_1!3269 (_ BitVec 64)) (_2!3269 V!13909)) )
))
(declare-datatypes ((List!6371 0))(
  ( (Nil!6368) (Cons!6367 (h!7223 tuple2!6516) (t!11527 List!6371)) )
))
(declare-datatypes ((ListLongMap!5429 0))(
  ( (ListLongMap!5430 (toList!2730 List!6371)) )
))
(declare-fun lt!183191 () ListLongMap!5429)

(declare-fun zeroValue!472 () V!13909)

(declare-fun minValue!472 () V!13909)

(declare-fun getCurrentListMap!2079 (array!23101 array!23103 (_ BitVec 32) (_ BitVec 32) V!13909 V!13909 (_ BitVec 32) Int) ListLongMap!5429)

(assert (=> b!389558 (= lt!183191 (getCurrentListMap!2079 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183187 () ListLongMap!5429)

(declare-fun lt!183192 () array!23103)

(assert (=> b!389558 (= lt!183187 (getCurrentListMap!2079 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183190 () ListLongMap!5429)

(declare-fun lt!183196 () ListLongMap!5429)

(assert (=> b!389558 (and (= lt!183190 lt!183196) (= lt!183196 lt!183190))))

(declare-fun lt!183198 () ListLongMap!5429)

(declare-fun lt!183194 () tuple2!6516)

(declare-fun +!1025 (ListLongMap!5429 tuple2!6516) ListLongMap!5429)

(assert (=> b!389558 (= lt!183196 (+!1025 lt!183198 lt!183194))))

(declare-fun v!373 () V!13909)

(assert (=> b!389558 (= lt!183194 (tuple2!6517 k0!778 v!373))))

(declare-datatypes ((Unit!11930 0))(
  ( (Unit!11931) )
))
(declare-fun lt!183193 () Unit!11930)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 (array!23101 array!23103 (_ BitVec 32) (_ BitVec 32) V!13909 V!13909 (_ BitVec 32) (_ BitVec 64) V!13909 (_ BitVec 32) Int) Unit!11930)

(assert (=> b!389558 (= lt!183193 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!959 (array!23101 array!23103 (_ BitVec 32) (_ BitVec 32) V!13909 V!13909 (_ BitVec 32) Int) ListLongMap!5429)

(assert (=> b!389558 (= lt!183190 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!389558 (= lt!183192 (array!23104 (store (arr!11017 _values!506) i!548 (ValueCellFull!4458 v!373)) (size!11369 _values!506)))))

(assert (=> b!389558 (= lt!183198 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389559 () Bool)

(assert (=> b!389559 (= e!236003 (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!183197 () ListLongMap!5429)

(declare-fun lt!183195 () ListLongMap!5429)

(assert (=> b!389559 (= lt!183197 (+!1025 lt!183195 lt!183194))))

(declare-fun lt!183188 () Unit!11930)

(declare-fun addCommutativeForDiffKeys!329 (ListLongMap!5429 (_ BitVec 64) V!13909 (_ BitVec 64) V!13909) Unit!11930)

(assert (=> b!389559 (= lt!183188 (addCommutativeForDiffKeys!329 lt!183198 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183185 () tuple2!6516)

(assert (=> b!389559 (= lt!183187 (+!1025 lt!183197 lt!183185))))

(declare-fun lt!183189 () tuple2!6516)

(assert (=> b!389559 (= lt!183197 (+!1025 lt!183196 lt!183189))))

(assert (=> b!389559 (= lt!183191 (+!1025 lt!183195 lt!183185))))

(assert (=> b!389559 (= lt!183195 (+!1025 lt!183198 lt!183189))))

(assert (=> b!389559 (= lt!183187 (+!1025 (+!1025 lt!183190 lt!183189) lt!183185))))

(assert (=> b!389559 (= lt!183185 (tuple2!6517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!389559 (= lt!183189 (tuple2!6517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!389560 () Bool)

(declare-fun res!222830 () Bool)

(assert (=> b!389560 (=> (not res!222830) (not e!236005))))

(declare-fun arrayContainsKey!0 (array!23101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!389560 (= res!222830 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!389561 () Bool)

(declare-fun res!222825 () Bool)

(assert (=> b!389561 (=> (not res!222825) (not e!236005))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!389561 (= res!222825 (validKeyInArray!0 k0!778))))

(assert (= (and start!37894 res!222823) b!389555))

(assert (= (and b!389555 res!222821) b!389557))

(assert (= (and b!389557 res!222824) b!389556))

(assert (= (and b!389556 res!222822) b!389553))

(assert (= (and b!389553 res!222826) b!389561))

(assert (= (and b!389561 res!222825) b!389551))

(assert (= (and b!389551 res!222829) b!389560))

(assert (= (and b!389560 res!222830) b!389548))

(assert (= (and b!389548 res!222827) b!389552))

(assert (= (and b!389552 res!222828) b!389558))

(assert (= (and b!389558 (not res!222820)) b!389559))

(assert (= (and b!389550 condMapEmpty!15978) mapIsEmpty!15978))

(assert (= (and b!389550 (not condMapEmpty!15978)) mapNonEmpty!15978))

(get-info :version)

(assert (= (and mapNonEmpty!15978 ((_ is ValueCellFull!4458) mapValue!15978)) b!389554))

(assert (= (and b!389550 ((_ is ValueCellFull!4458) mapDefault!15978)) b!389549))

(assert (= start!37894 b!389550))

(declare-fun m!385641 () Bool)

(assert (=> b!389560 m!385641))

(declare-fun m!385643 () Bool)

(assert (=> mapNonEmpty!15978 m!385643))

(declare-fun m!385645 () Bool)

(assert (=> b!389551 m!385645))

(declare-fun m!385647 () Bool)

(assert (=> b!389548 m!385647))

(declare-fun m!385649 () Bool)

(assert (=> b!389548 m!385649))

(declare-fun m!385651 () Bool)

(assert (=> start!37894 m!385651))

(declare-fun m!385653 () Bool)

(assert (=> start!37894 m!385653))

(declare-fun m!385655 () Bool)

(assert (=> start!37894 m!385655))

(declare-fun m!385657 () Bool)

(assert (=> b!389552 m!385657))

(declare-fun m!385659 () Bool)

(assert (=> b!389561 m!385659))

(declare-fun m!385661 () Bool)

(assert (=> b!389559 m!385661))

(declare-fun m!385663 () Bool)

(assert (=> b!389559 m!385663))

(declare-fun m!385665 () Bool)

(assert (=> b!389559 m!385665))

(declare-fun m!385667 () Bool)

(assert (=> b!389559 m!385667))

(declare-fun m!385669 () Bool)

(assert (=> b!389559 m!385669))

(declare-fun m!385671 () Bool)

(assert (=> b!389559 m!385671))

(assert (=> b!389559 m!385663))

(declare-fun m!385673 () Bool)

(assert (=> b!389559 m!385673))

(declare-fun m!385675 () Bool)

(assert (=> b!389559 m!385675))

(declare-fun m!385677 () Bool)

(assert (=> b!389558 m!385677))

(declare-fun m!385679 () Bool)

(assert (=> b!389558 m!385679))

(declare-fun m!385681 () Bool)

(assert (=> b!389558 m!385681))

(declare-fun m!385683 () Bool)

(assert (=> b!389558 m!385683))

(declare-fun m!385685 () Bool)

(assert (=> b!389558 m!385685))

(declare-fun m!385687 () Bool)

(assert (=> b!389558 m!385687))

(declare-fun m!385689 () Bool)

(assert (=> b!389558 m!385689))

(declare-fun m!385691 () Bool)

(assert (=> b!389556 m!385691))

(declare-fun m!385693 () Bool)

(assert (=> b!389557 m!385693))

(check-sat tp_is_empty!9603 (not b!389561) b_and!16209 (not mapNonEmpty!15978) (not b!389557) (not b!389552) (not b!389560) (not b!389558) (not b_next!8931) (not b!389556) (not b!389548) (not start!37894) (not b!389559))
(check-sat b_and!16209 (not b_next!8931))
(get-model)

(declare-fun b!389612 () Bool)

(declare-fun e!236039 () Bool)

(declare-fun call!27449 () Bool)

(assert (=> b!389612 (= e!236039 call!27449)))

(declare-fun b!389614 () Bool)

(declare-fun e!236037 () Bool)

(assert (=> b!389614 (= e!236037 e!236039)))

(declare-fun lt!183249 () (_ BitVec 64))

(assert (=> b!389614 (= lt!183249 (select (arr!11016 lt!183186) #b00000000000000000000000000000000))))

(declare-fun lt!183248 () Unit!11930)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23101 (_ BitVec 64) (_ BitVec 32)) Unit!11930)

(assert (=> b!389614 (= lt!183248 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!183186 lt!183249 #b00000000000000000000000000000000))))

(assert (=> b!389614 (arrayContainsKey!0 lt!183186 lt!183249 #b00000000000000000000000000000000)))

(declare-fun lt!183247 () Unit!11930)

(assert (=> b!389614 (= lt!183247 lt!183248)))

(declare-fun res!222869 () Bool)

(declare-datatypes ((SeekEntryResult!3511 0))(
  ( (MissingZero!3511 (index!16223 (_ BitVec 32))) (Found!3511 (index!16224 (_ BitVec 32))) (Intermediate!3511 (undefined!4323 Bool) (index!16225 (_ BitVec 32)) (x!38249 (_ BitVec 32))) (Undefined!3511) (MissingVacant!3511 (index!16226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23101 (_ BitVec 32)) SeekEntryResult!3511)

(assert (=> b!389614 (= res!222869 (= (seekEntryOrOpen!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000) lt!183186 mask!970) (Found!3511 #b00000000000000000000000000000000)))))

(assert (=> b!389614 (=> (not res!222869) (not e!236039))))

(declare-fun bm!27446 () Bool)

(assert (=> bm!27446 (= call!27449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!183186 mask!970))))

(declare-fun b!389615 () Bool)

(declare-fun e!236038 () Bool)

(assert (=> b!389615 (= e!236038 e!236037)))

(declare-fun c!54080 () Bool)

(assert (=> b!389615 (= c!54080 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(declare-fun d!72921 () Bool)

(declare-fun res!222868 () Bool)

(assert (=> d!72921 (=> res!222868 e!236038)))

(assert (=> d!72921 (= res!222868 (bvsge #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(assert (=> d!72921 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183186 mask!970) e!236038)))

(declare-fun b!389613 () Bool)

(assert (=> b!389613 (= e!236037 call!27449)))

(assert (= (and d!72921 (not res!222868)) b!389615))

(assert (= (and b!389615 c!54080) b!389614))

(assert (= (and b!389615 (not c!54080)) b!389613))

(assert (= (and b!389614 res!222869) b!389612))

(assert (= (or b!389612 b!389613) bm!27446))

(declare-fun m!385749 () Bool)

(assert (=> b!389614 m!385749))

(declare-fun m!385751 () Bool)

(assert (=> b!389614 m!385751))

(declare-fun m!385753 () Bool)

(assert (=> b!389614 m!385753))

(assert (=> b!389614 m!385749))

(declare-fun m!385755 () Bool)

(assert (=> b!389614 m!385755))

(declare-fun m!385757 () Bool)

(assert (=> bm!27446 m!385757))

(assert (=> b!389615 m!385749))

(assert (=> b!389615 m!385749))

(declare-fun m!385759 () Bool)

(assert (=> b!389615 m!385759))

(assert (=> b!389548 d!72921))

(declare-fun b!389616 () Bool)

(declare-fun e!236042 () Bool)

(declare-fun call!27450 () Bool)

(assert (=> b!389616 (= e!236042 call!27450)))

(declare-fun b!389618 () Bool)

(declare-fun e!236040 () Bool)

(assert (=> b!389618 (= e!236040 e!236042)))

(declare-fun lt!183252 () (_ BitVec 64))

(assert (=> b!389618 (= lt!183252 (select (arr!11016 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183251 () Unit!11930)

(assert (=> b!389618 (= lt!183251 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!183252 #b00000000000000000000000000000000))))

(assert (=> b!389618 (arrayContainsKey!0 _keys!658 lt!183252 #b00000000000000000000000000000000)))

(declare-fun lt!183250 () Unit!11930)

(assert (=> b!389618 (= lt!183250 lt!183251)))

(declare-fun res!222871 () Bool)

(assert (=> b!389618 (= res!222871 (= (seekEntryOrOpen!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3511 #b00000000000000000000000000000000)))))

(assert (=> b!389618 (=> (not res!222871) (not e!236042))))

(declare-fun bm!27447 () Bool)

(assert (=> bm!27447 (= call!27450 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!389619 () Bool)

(declare-fun e!236041 () Bool)

(assert (=> b!389619 (= e!236041 e!236040)))

(declare-fun c!54081 () Bool)

(assert (=> b!389619 (= c!54081 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72923 () Bool)

(declare-fun res!222870 () Bool)

(assert (=> d!72923 (=> res!222870 e!236041)))

(assert (=> d!72923 (= res!222870 (bvsge #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (=> d!72923 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236041)))

(declare-fun b!389617 () Bool)

(assert (=> b!389617 (= e!236040 call!27450)))

(assert (= (and d!72923 (not res!222870)) b!389619))

(assert (= (and b!389619 c!54081) b!389618))

(assert (= (and b!389619 (not c!54081)) b!389617))

(assert (= (and b!389618 res!222871) b!389616))

(assert (= (or b!389616 b!389617) bm!27447))

(declare-fun m!385761 () Bool)

(assert (=> b!389618 m!385761))

(declare-fun m!385763 () Bool)

(assert (=> b!389618 m!385763))

(declare-fun m!385765 () Bool)

(assert (=> b!389618 m!385765))

(assert (=> b!389618 m!385761))

(declare-fun m!385767 () Bool)

(assert (=> b!389618 m!385767))

(declare-fun m!385769 () Bool)

(assert (=> bm!27447 m!385769))

(assert (=> b!389619 m!385761))

(assert (=> b!389619 m!385761))

(declare-fun m!385771 () Bool)

(assert (=> b!389619 m!385771))

(assert (=> b!389557 d!72923))

(declare-fun b!389644 () Bool)

(declare-fun e!236058 () ListLongMap!5429)

(declare-fun e!236062 () ListLongMap!5429)

(assert (=> b!389644 (= e!236058 e!236062)))

(declare-fun c!54090 () Bool)

(assert (=> b!389644 (= c!54090 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389645 () Bool)

(declare-fun e!236063 () Bool)

(declare-fun lt!183271 () ListLongMap!5429)

(declare-fun isEmpty!546 (ListLongMap!5429) Bool)

(assert (=> b!389645 (= e!236063 (isEmpty!546 lt!183271))))

(declare-fun b!389646 () Bool)

(declare-fun e!236057 () Bool)

(assert (=> b!389646 (= e!236057 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389646 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389647 () Bool)

(declare-fun lt!183270 () Unit!11930)

(declare-fun lt!183268 () Unit!11930)

(assert (=> b!389647 (= lt!183270 lt!183268)))

(declare-fun lt!183267 () V!13909)

(declare-fun lt!183273 () (_ BitVec 64))

(declare-fun lt!183272 () (_ BitVec 64))

(declare-fun lt!183269 () ListLongMap!5429)

(declare-fun contains!2449 (ListLongMap!5429 (_ BitVec 64)) Bool)

(assert (=> b!389647 (not (contains!2449 (+!1025 lt!183269 (tuple2!6517 lt!183273 lt!183267)) lt!183272))))

(declare-fun addStillNotContains!133 (ListLongMap!5429 (_ BitVec 64) V!13909 (_ BitVec 64)) Unit!11930)

(assert (=> b!389647 (= lt!183268 (addStillNotContains!133 lt!183269 lt!183273 lt!183267 lt!183272))))

(assert (=> b!389647 (= lt!183272 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5574 (ValueCell!4458 V!13909) V!13909)

(declare-fun dynLambda!643 (Int (_ BitVec 64)) V!13909)

(assert (=> b!389647 (= lt!183267 (get!5574 (select (arr!11017 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389647 (= lt!183273 (select (arr!11016 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27453 () ListLongMap!5429)

(assert (=> b!389647 (= lt!183269 call!27453)))

(assert (=> b!389647 (= e!236062 (+!1025 call!27453 (tuple2!6517 (select (arr!11016 _keys!658) #b00000000000000000000000000000000) (get!5574 (select (arr!11017 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389648 () Bool)

(assert (=> b!389648 (= e!236058 (ListLongMap!5430 Nil!6368))))

(declare-fun b!389649 () Bool)

(assert (=> b!389649 (= e!236062 call!27453)))

(declare-fun bm!27450 () Bool)

(assert (=> bm!27450 (= call!27453 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389650 () Bool)

(declare-fun res!222883 () Bool)

(declare-fun e!236061 () Bool)

(assert (=> b!389650 (=> (not res!222883) (not e!236061))))

(assert (=> b!389650 (= res!222883 (not (contains!2449 lt!183271 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389651 () Bool)

(declare-fun e!236059 () Bool)

(declare-fun e!236060 () Bool)

(assert (=> b!389651 (= e!236059 e!236060)))

(assert (=> b!389651 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(declare-fun res!222881 () Bool)

(assert (=> b!389651 (= res!222881 (contains!2449 lt!183271 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389651 (=> (not res!222881) (not e!236060))))

(declare-fun d!72925 () Bool)

(assert (=> d!72925 e!236061))

(declare-fun res!222882 () Bool)

(assert (=> d!72925 (=> (not res!222882) (not e!236061))))

(assert (=> d!72925 (= res!222882 (not (contains!2449 lt!183271 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72925 (= lt!183271 e!236058)))

(declare-fun c!54091 () Bool)

(assert (=> d!72925 (= c!54091 (bvsge #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (=> d!72925 (validMask!0 mask!970)))

(assert (=> d!72925 (= (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183271)))

(declare-fun b!389652 () Bool)

(assert (=> b!389652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (=> b!389652 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11369 _values!506)))))

(declare-fun apply!300 (ListLongMap!5429 (_ BitVec 64)) V!13909)

(assert (=> b!389652 (= e!236060 (= (apply!300 lt!183271 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)) (get!5574 (select (arr!11017 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389653 () Bool)

(assert (=> b!389653 (= e!236063 (= lt!183271 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!389654 () Bool)

(assert (=> b!389654 (= e!236061 e!236059)))

(declare-fun c!54092 () Bool)

(assert (=> b!389654 (= c!54092 e!236057)))

(declare-fun res!222880 () Bool)

(assert (=> b!389654 (=> (not res!222880) (not e!236057))))

(assert (=> b!389654 (= res!222880 (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(declare-fun b!389655 () Bool)

(assert (=> b!389655 (= e!236059 e!236063)))

(declare-fun c!54093 () Bool)

(assert (=> b!389655 (= c!54093 (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (= (and d!72925 c!54091) b!389648))

(assert (= (and d!72925 (not c!54091)) b!389644))

(assert (= (and b!389644 c!54090) b!389647))

(assert (= (and b!389644 (not c!54090)) b!389649))

(assert (= (or b!389647 b!389649) bm!27450))

(assert (= (and d!72925 res!222882) b!389650))

(assert (= (and b!389650 res!222883) b!389654))

(assert (= (and b!389654 res!222880) b!389646))

(assert (= (and b!389654 c!54092) b!389651))

(assert (= (and b!389654 (not c!54092)) b!389655))

(assert (= (and b!389651 res!222881) b!389652))

(assert (= (and b!389655 c!54093) b!389653))

(assert (= (and b!389655 (not c!54093)) b!389645))

(declare-fun b_lambda!8599 () Bool)

(assert (=> (not b_lambda!8599) (not b!389647)))

(declare-fun t!11531 () Bool)

(declare-fun tb!3115 () Bool)

(assert (=> (and start!37894 (= defaultEntry!514 defaultEntry!514) t!11531) tb!3115))

(declare-fun result!5725 () Bool)

(assert (=> tb!3115 (= result!5725 tp_is_empty!9603)))

(assert (=> b!389647 t!11531))

(declare-fun b_and!16213 () Bool)

(assert (= b_and!16209 (and (=> t!11531 result!5725) b_and!16213)))

(declare-fun b_lambda!8601 () Bool)

(assert (=> (not b_lambda!8601) (not b!389652)))

(assert (=> b!389652 t!11531))

(declare-fun b_and!16215 () Bool)

(assert (= b_and!16213 (and (=> t!11531 result!5725) b_and!16215)))

(assert (=> b!389652 m!385761))

(assert (=> b!389652 m!385761))

(declare-fun m!385773 () Bool)

(assert (=> b!389652 m!385773))

(declare-fun m!385775 () Bool)

(assert (=> b!389652 m!385775))

(declare-fun m!385777 () Bool)

(assert (=> b!389652 m!385777))

(assert (=> b!389652 m!385775))

(declare-fun m!385779 () Bool)

(assert (=> b!389652 m!385779))

(assert (=> b!389652 m!385777))

(declare-fun m!385781 () Bool)

(assert (=> b!389647 m!385781))

(assert (=> b!389647 m!385761))

(declare-fun m!385783 () Bool)

(assert (=> b!389647 m!385783))

(declare-fun m!385785 () Bool)

(assert (=> b!389647 m!385785))

(assert (=> b!389647 m!385781))

(declare-fun m!385787 () Bool)

(assert (=> b!389647 m!385787))

(assert (=> b!389647 m!385775))

(assert (=> b!389647 m!385777))

(assert (=> b!389647 m!385775))

(assert (=> b!389647 m!385779))

(assert (=> b!389647 m!385777))

(assert (=> b!389646 m!385761))

(assert (=> b!389646 m!385761))

(assert (=> b!389646 m!385771))

(assert (=> b!389651 m!385761))

(assert (=> b!389651 m!385761))

(declare-fun m!385789 () Bool)

(assert (=> b!389651 m!385789))

(assert (=> b!389644 m!385761))

(assert (=> b!389644 m!385761))

(assert (=> b!389644 m!385771))

(declare-fun m!385791 () Bool)

(assert (=> b!389650 m!385791))

(declare-fun m!385793 () Bool)

(assert (=> b!389645 m!385793))

(declare-fun m!385795 () Bool)

(assert (=> bm!27450 m!385795))

(assert (=> b!389653 m!385795))

(declare-fun m!385797 () Bool)

(assert (=> d!72925 m!385797))

(assert (=> d!72925 m!385651))

(assert (=> b!389558 d!72925))

(declare-fun b!389700 () Bool)

(declare-fun e!236093 () Bool)

(declare-fun lt!183320 () ListLongMap!5429)

(assert (=> b!389700 (= e!236093 (= (apply!300 lt!183320 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)) (get!5574 (select (arr!11017 _values!506) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11369 _values!506)))))

(assert (=> b!389700 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(declare-fun b!389701 () Bool)

(declare-fun e!236092 () Bool)

(assert (=> b!389701 (= e!236092 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389702 () Bool)

(declare-fun e!236099 () Unit!11930)

(declare-fun lt!183337 () Unit!11930)

(assert (=> b!389702 (= e!236099 lt!183337)))

(declare-fun lt!183331 () ListLongMap!5429)

(assert (=> b!389702 (= lt!183331 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183335 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183335 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183334 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183334 (select (arr!11016 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183323 () Unit!11930)

(declare-fun addStillContains!276 (ListLongMap!5429 (_ BitVec 64) V!13909 (_ BitVec 64)) Unit!11930)

(assert (=> b!389702 (= lt!183323 (addStillContains!276 lt!183331 lt!183335 zeroValue!472 lt!183334))))

(assert (=> b!389702 (contains!2449 (+!1025 lt!183331 (tuple2!6517 lt!183335 zeroValue!472)) lt!183334)))

(declare-fun lt!183319 () Unit!11930)

(assert (=> b!389702 (= lt!183319 lt!183323)))

(declare-fun lt!183332 () ListLongMap!5429)

(assert (=> b!389702 (= lt!183332 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183329 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183329 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183339 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183339 (select (arr!11016 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183327 () Unit!11930)

(declare-fun addApplyDifferent!276 (ListLongMap!5429 (_ BitVec 64) V!13909 (_ BitVec 64)) Unit!11930)

(assert (=> b!389702 (= lt!183327 (addApplyDifferent!276 lt!183332 lt!183329 minValue!472 lt!183339))))

(assert (=> b!389702 (= (apply!300 (+!1025 lt!183332 (tuple2!6517 lt!183329 minValue!472)) lt!183339) (apply!300 lt!183332 lt!183339))))

(declare-fun lt!183318 () Unit!11930)

(assert (=> b!389702 (= lt!183318 lt!183327)))

(declare-fun lt!183326 () ListLongMap!5429)

(assert (=> b!389702 (= lt!183326 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183330 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183330 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183322 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183322 (select (arr!11016 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!183336 () Unit!11930)

(assert (=> b!389702 (= lt!183336 (addApplyDifferent!276 lt!183326 lt!183330 zeroValue!472 lt!183322))))

(assert (=> b!389702 (= (apply!300 (+!1025 lt!183326 (tuple2!6517 lt!183330 zeroValue!472)) lt!183322) (apply!300 lt!183326 lt!183322))))

(declare-fun lt!183324 () Unit!11930)

(assert (=> b!389702 (= lt!183324 lt!183336)))

(declare-fun lt!183338 () ListLongMap!5429)

(assert (=> b!389702 (= lt!183338 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183328 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183328 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183325 () (_ BitVec 64))

(assert (=> b!389702 (= lt!183325 (select (arr!11016 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!389702 (= lt!183337 (addApplyDifferent!276 lt!183338 lt!183328 minValue!472 lt!183325))))

(assert (=> b!389702 (= (apply!300 (+!1025 lt!183338 (tuple2!6517 lt!183328 minValue!472)) lt!183325) (apply!300 lt!183338 lt!183325))))

(declare-fun b!389703 () Bool)

(declare-fun e!236098 () Bool)

(declare-fun e!236090 () Bool)

(assert (=> b!389703 (= e!236098 e!236090)))

(declare-fun res!222910 () Bool)

(declare-fun call!27473 () Bool)

(assert (=> b!389703 (= res!222910 call!27473)))

(assert (=> b!389703 (=> (not res!222910) (not e!236090))))

(declare-fun b!389704 () Bool)

(declare-fun e!236094 () ListLongMap!5429)

(declare-fun call!27468 () ListLongMap!5429)

(assert (=> b!389704 (= e!236094 (+!1025 call!27468 (tuple2!6517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!389705 () Bool)

(declare-fun e!236095 () Bool)

(assert (=> b!389705 (= e!236095 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389706 () Bool)

(declare-fun e!236102 () Bool)

(declare-fun call!27474 () Bool)

(assert (=> b!389706 (= e!236102 (not call!27474))))

(declare-fun b!389707 () Bool)

(declare-fun res!222906 () Bool)

(declare-fun e!236101 () Bool)

(assert (=> b!389707 (=> (not res!222906) (not e!236101))))

(declare-fun e!236097 () Bool)

(assert (=> b!389707 (= res!222906 e!236097)))

(declare-fun res!222903 () Bool)

(assert (=> b!389707 (=> res!222903 e!236097)))

(assert (=> b!389707 (= res!222903 (not e!236092))))

(declare-fun res!222908 () Bool)

(assert (=> b!389707 (=> (not res!222908) (not e!236092))))

(assert (=> b!389707 (= res!222908 (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(declare-fun b!389708 () Bool)

(assert (=> b!389708 (= e!236097 e!236093)))

(declare-fun res!222909 () Bool)

(assert (=> b!389708 (=> (not res!222909) (not e!236093))))

(assert (=> b!389708 (= res!222909 (contains!2449 lt!183320 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!389708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(declare-fun b!389709 () Bool)

(declare-fun c!54108 () Bool)

(assert (=> b!389709 (= c!54108 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236096 () ListLongMap!5429)

(declare-fun e!236091 () ListLongMap!5429)

(assert (=> b!389709 (= e!236096 e!236091)))

(declare-fun b!389710 () Bool)

(declare-fun res!222902 () Bool)

(assert (=> b!389710 (=> (not res!222902) (not e!236101))))

(assert (=> b!389710 (= res!222902 e!236102)))

(declare-fun c!54110 () Bool)

(assert (=> b!389710 (= c!54110 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389711 () Bool)

(declare-fun call!27471 () ListLongMap!5429)

(assert (=> b!389711 (= e!236091 call!27471)))

(declare-fun b!389712 () Bool)

(assert (=> b!389712 (= e!236101 e!236098)))

(declare-fun c!54106 () Bool)

(assert (=> b!389712 (= c!54106 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!27465 () Bool)

(declare-fun call!27469 () ListLongMap!5429)

(assert (=> bm!27465 (= call!27469 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389713 () Bool)

(assert (=> b!389713 (= e!236090 (= (apply!300 lt!183320 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389714 () Bool)

(declare-fun Unit!11934 () Unit!11930)

(assert (=> b!389714 (= e!236099 Unit!11934)))

(declare-fun b!389715 () Bool)

(declare-fun e!236100 () Bool)

(assert (=> b!389715 (= e!236102 e!236100)))

(declare-fun res!222907 () Bool)

(assert (=> b!389715 (= res!222907 call!27474)))

(assert (=> b!389715 (=> (not res!222907) (not e!236100))))

(declare-fun bm!27466 () Bool)

(assert (=> bm!27466 (= call!27474 (contains!2449 lt!183320 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389716 () Bool)

(assert (=> b!389716 (= e!236094 e!236096)))

(declare-fun c!54109 () Bool)

(assert (=> b!389716 (= c!54109 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389717 () Bool)

(assert (=> b!389717 (= e!236098 (not call!27473))))

(declare-fun bm!27467 () Bool)

(declare-fun call!27472 () ListLongMap!5429)

(declare-fun call!27470 () ListLongMap!5429)

(assert (=> bm!27467 (= call!27472 call!27470)))

(declare-fun bm!27468 () Bool)

(assert (=> bm!27468 (= call!27470 call!27469)))

(declare-fun d!72927 () Bool)

(assert (=> d!72927 e!236101))

(declare-fun res!222905 () Bool)

(assert (=> d!72927 (=> (not res!222905) (not e!236101))))

(assert (=> d!72927 (= res!222905 (or (bvsge #b00000000000000000000000000000000 (size!11368 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))))

(declare-fun lt!183333 () ListLongMap!5429)

(assert (=> d!72927 (= lt!183320 lt!183333)))

(declare-fun lt!183321 () Unit!11930)

(assert (=> d!72927 (= lt!183321 e!236099)))

(declare-fun c!54107 () Bool)

(assert (=> d!72927 (= c!54107 e!236095)))

(declare-fun res!222904 () Bool)

(assert (=> d!72927 (=> (not res!222904) (not e!236095))))

(assert (=> d!72927 (= res!222904 (bvslt #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (=> d!72927 (= lt!183333 e!236094)))

(declare-fun c!54111 () Bool)

(assert (=> d!72927 (= c!54111 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72927 (validMask!0 mask!970)))

(assert (=> d!72927 (= (getCurrentListMap!2079 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183320)))

(declare-fun bm!27469 () Bool)

(assert (=> bm!27469 (= call!27473 (contains!2449 lt!183320 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27470 () Bool)

(assert (=> bm!27470 (= call!27471 call!27468)))

(declare-fun b!389718 () Bool)

(assert (=> b!389718 (= e!236096 call!27471)))

(declare-fun bm!27471 () Bool)

(assert (=> bm!27471 (= call!27468 (+!1025 (ite c!54111 call!27469 (ite c!54109 call!27470 call!27472)) (ite (or c!54111 c!54109) (tuple2!6517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389719 () Bool)

(assert (=> b!389719 (= e!236100 (= (apply!300 lt!183320 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389720 () Bool)

(assert (=> b!389720 (= e!236091 call!27472)))

(assert (= (and d!72927 c!54111) b!389704))

(assert (= (and d!72927 (not c!54111)) b!389716))

(assert (= (and b!389716 c!54109) b!389718))

(assert (= (and b!389716 (not c!54109)) b!389709))

(assert (= (and b!389709 c!54108) b!389711))

(assert (= (and b!389709 (not c!54108)) b!389720))

(assert (= (or b!389711 b!389720) bm!27467))

(assert (= (or b!389718 bm!27467) bm!27468))

(assert (= (or b!389718 b!389711) bm!27470))

(assert (= (or b!389704 bm!27468) bm!27465))

(assert (= (or b!389704 bm!27470) bm!27471))

(assert (= (and d!72927 res!222904) b!389705))

(assert (= (and d!72927 c!54107) b!389702))

(assert (= (and d!72927 (not c!54107)) b!389714))

(assert (= (and d!72927 res!222905) b!389707))

(assert (= (and b!389707 res!222908) b!389701))

(assert (= (and b!389707 (not res!222903)) b!389708))

(assert (= (and b!389708 res!222909) b!389700))

(assert (= (and b!389707 res!222906) b!389710))

(assert (= (and b!389710 c!54110) b!389715))

(assert (= (and b!389710 (not c!54110)) b!389706))

(assert (= (and b!389715 res!222907) b!389719))

(assert (= (or b!389715 b!389706) bm!27466))

(assert (= (and b!389710 res!222902) b!389712))

(assert (= (and b!389712 c!54106) b!389703))

(assert (= (and b!389712 (not c!54106)) b!389717))

(assert (= (and b!389703 res!222910) b!389713))

(assert (= (or b!389703 b!389717) bm!27469))

(declare-fun b_lambda!8603 () Bool)

(assert (=> (not b_lambda!8603) (not b!389700)))

(assert (=> b!389700 t!11531))

(declare-fun b_and!16217 () Bool)

(assert (= b_and!16215 (and (=> t!11531 result!5725) b_and!16217)))

(declare-fun m!385799 () Bool)

(assert (=> bm!27471 m!385799))

(declare-fun m!385801 () Bool)

(assert (=> b!389702 m!385801))

(declare-fun m!385803 () Bool)

(assert (=> b!389702 m!385803))

(assert (=> b!389702 m!385761))

(declare-fun m!385805 () Bool)

(assert (=> b!389702 m!385805))

(assert (=> b!389702 m!385679))

(declare-fun m!385807 () Bool)

(assert (=> b!389702 m!385807))

(declare-fun m!385809 () Bool)

(assert (=> b!389702 m!385809))

(assert (=> b!389702 m!385809))

(declare-fun m!385811 () Bool)

(assert (=> b!389702 m!385811))

(assert (=> b!389702 m!385801))

(declare-fun m!385813 () Bool)

(assert (=> b!389702 m!385813))

(declare-fun m!385815 () Bool)

(assert (=> b!389702 m!385815))

(declare-fun m!385817 () Bool)

(assert (=> b!389702 m!385817))

(declare-fun m!385819 () Bool)

(assert (=> b!389702 m!385819))

(declare-fun m!385821 () Bool)

(assert (=> b!389702 m!385821))

(declare-fun m!385823 () Bool)

(assert (=> b!389702 m!385823))

(assert (=> b!389702 m!385815))

(declare-fun m!385825 () Bool)

(assert (=> b!389702 m!385825))

(assert (=> b!389702 m!385819))

(declare-fun m!385827 () Bool)

(assert (=> b!389702 m!385827))

(declare-fun m!385829 () Bool)

(assert (=> b!389702 m!385829))

(declare-fun m!385831 () Bool)

(assert (=> b!389704 m!385831))

(assert (=> d!72927 m!385651))

(declare-fun m!385833 () Bool)

(assert (=> bm!27469 m!385833))

(declare-fun m!385835 () Bool)

(assert (=> b!389713 m!385835))

(assert (=> b!389700 m!385761))

(declare-fun m!385837 () Bool)

(assert (=> b!389700 m!385837))

(assert (=> b!389700 m!385777))

(assert (=> b!389700 m!385775))

(assert (=> b!389700 m!385777))

(assert (=> b!389700 m!385775))

(assert (=> b!389700 m!385779))

(assert (=> b!389700 m!385761))

(assert (=> b!389708 m!385761))

(assert (=> b!389708 m!385761))

(declare-fun m!385839 () Bool)

(assert (=> b!389708 m!385839))

(assert (=> bm!27465 m!385679))

(declare-fun m!385841 () Bool)

(assert (=> b!389719 m!385841))

(assert (=> b!389701 m!385761))

(assert (=> b!389701 m!385761))

(assert (=> b!389701 m!385771))

(assert (=> b!389705 m!385761))

(assert (=> b!389705 m!385761))

(assert (=> b!389705 m!385771))

(declare-fun m!385843 () Bool)

(assert (=> bm!27466 m!385843))

(assert (=> b!389558 d!72927))

(declare-fun b!389721 () Bool)

(declare-fun e!236106 () Bool)

(declare-fun lt!183342 () ListLongMap!5429)

(assert (=> b!389721 (= e!236106 (= (apply!300 lt!183342 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)) (get!5574 (select (arr!11017 lt!183192) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11369 lt!183192)))))

(assert (=> b!389721 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(declare-fun b!389722 () Bool)

(declare-fun e!236105 () Bool)

(assert (=> b!389722 (= e!236105 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(declare-fun b!389723 () Bool)

(declare-fun e!236112 () Unit!11930)

(declare-fun lt!183359 () Unit!11930)

(assert (=> b!389723 (= e!236112 lt!183359)))

(declare-fun lt!183353 () ListLongMap!5429)

(assert (=> b!389723 (= lt!183353 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183357 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183356 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183356 (select (arr!11016 lt!183186) #b00000000000000000000000000000000))))

(declare-fun lt!183345 () Unit!11930)

(assert (=> b!389723 (= lt!183345 (addStillContains!276 lt!183353 lt!183357 zeroValue!472 lt!183356))))

(assert (=> b!389723 (contains!2449 (+!1025 lt!183353 (tuple2!6517 lt!183357 zeroValue!472)) lt!183356)))

(declare-fun lt!183341 () Unit!11930)

(assert (=> b!389723 (= lt!183341 lt!183345)))

(declare-fun lt!183354 () ListLongMap!5429)

(assert (=> b!389723 (= lt!183354 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183351 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183351 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183361 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183361 (select (arr!11016 lt!183186) #b00000000000000000000000000000000))))

(declare-fun lt!183349 () Unit!11930)

(assert (=> b!389723 (= lt!183349 (addApplyDifferent!276 lt!183354 lt!183351 minValue!472 lt!183361))))

(assert (=> b!389723 (= (apply!300 (+!1025 lt!183354 (tuple2!6517 lt!183351 minValue!472)) lt!183361) (apply!300 lt!183354 lt!183361))))

(declare-fun lt!183340 () Unit!11930)

(assert (=> b!389723 (= lt!183340 lt!183349)))

(declare-fun lt!183348 () ListLongMap!5429)

(assert (=> b!389723 (= lt!183348 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183352 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183352 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183344 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183344 (select (arr!11016 lt!183186) #b00000000000000000000000000000000))))

(declare-fun lt!183358 () Unit!11930)

(assert (=> b!389723 (= lt!183358 (addApplyDifferent!276 lt!183348 lt!183352 zeroValue!472 lt!183344))))

(assert (=> b!389723 (= (apply!300 (+!1025 lt!183348 (tuple2!6517 lt!183352 zeroValue!472)) lt!183344) (apply!300 lt!183348 lt!183344))))

(declare-fun lt!183346 () Unit!11930)

(assert (=> b!389723 (= lt!183346 lt!183358)))

(declare-fun lt!183360 () ListLongMap!5429)

(assert (=> b!389723 (= lt!183360 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183350 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183350 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!183347 () (_ BitVec 64))

(assert (=> b!389723 (= lt!183347 (select (arr!11016 lt!183186) #b00000000000000000000000000000000))))

(assert (=> b!389723 (= lt!183359 (addApplyDifferent!276 lt!183360 lt!183350 minValue!472 lt!183347))))

(assert (=> b!389723 (= (apply!300 (+!1025 lt!183360 (tuple2!6517 lt!183350 minValue!472)) lt!183347) (apply!300 lt!183360 lt!183347))))

(declare-fun b!389724 () Bool)

(declare-fun e!236111 () Bool)

(declare-fun e!236103 () Bool)

(assert (=> b!389724 (= e!236111 e!236103)))

(declare-fun res!222919 () Bool)

(declare-fun call!27480 () Bool)

(assert (=> b!389724 (= res!222919 call!27480)))

(assert (=> b!389724 (=> (not res!222919) (not e!236103))))

(declare-fun b!389725 () Bool)

(declare-fun e!236107 () ListLongMap!5429)

(declare-fun call!27475 () ListLongMap!5429)

(assert (=> b!389725 (= e!236107 (+!1025 call!27475 (tuple2!6517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!389726 () Bool)

(declare-fun e!236108 () Bool)

(assert (=> b!389726 (= e!236108 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(declare-fun b!389727 () Bool)

(declare-fun e!236115 () Bool)

(declare-fun call!27481 () Bool)

(assert (=> b!389727 (= e!236115 (not call!27481))))

(declare-fun b!389728 () Bool)

(declare-fun res!222915 () Bool)

(declare-fun e!236114 () Bool)

(assert (=> b!389728 (=> (not res!222915) (not e!236114))))

(declare-fun e!236110 () Bool)

(assert (=> b!389728 (= res!222915 e!236110)))

(declare-fun res!222912 () Bool)

(assert (=> b!389728 (=> res!222912 e!236110)))

(assert (=> b!389728 (= res!222912 (not e!236105))))

(declare-fun res!222917 () Bool)

(assert (=> b!389728 (=> (not res!222917) (not e!236105))))

(assert (=> b!389728 (= res!222917 (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(declare-fun b!389729 () Bool)

(assert (=> b!389729 (= e!236110 e!236106)))

(declare-fun res!222918 () Bool)

(assert (=> b!389729 (=> (not res!222918) (not e!236106))))

(assert (=> b!389729 (= res!222918 (contains!2449 lt!183342 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(assert (=> b!389729 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(declare-fun b!389730 () Bool)

(declare-fun c!54114 () Bool)

(assert (=> b!389730 (= c!54114 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236109 () ListLongMap!5429)

(declare-fun e!236104 () ListLongMap!5429)

(assert (=> b!389730 (= e!236109 e!236104)))

(declare-fun b!389731 () Bool)

(declare-fun res!222911 () Bool)

(assert (=> b!389731 (=> (not res!222911) (not e!236114))))

(assert (=> b!389731 (= res!222911 e!236115)))

(declare-fun c!54116 () Bool)

(assert (=> b!389731 (= c!54116 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!389732 () Bool)

(declare-fun call!27478 () ListLongMap!5429)

(assert (=> b!389732 (= e!236104 call!27478)))

(declare-fun b!389733 () Bool)

(assert (=> b!389733 (= e!236114 e!236111)))

(declare-fun c!54112 () Bool)

(assert (=> b!389733 (= c!54112 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun call!27476 () ListLongMap!5429)

(declare-fun bm!27472 () Bool)

(assert (=> bm!27472 (= call!27476 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389734 () Bool)

(assert (=> b!389734 (= e!236103 (= (apply!300 lt!183342 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!389735 () Bool)

(declare-fun Unit!11935 () Unit!11930)

(assert (=> b!389735 (= e!236112 Unit!11935)))

(declare-fun b!389736 () Bool)

(declare-fun e!236113 () Bool)

(assert (=> b!389736 (= e!236115 e!236113)))

(declare-fun res!222916 () Bool)

(assert (=> b!389736 (= res!222916 call!27481)))

(assert (=> b!389736 (=> (not res!222916) (not e!236113))))

(declare-fun bm!27473 () Bool)

(assert (=> bm!27473 (= call!27481 (contains!2449 lt!183342 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!389737 () Bool)

(assert (=> b!389737 (= e!236107 e!236109)))

(declare-fun c!54115 () Bool)

(assert (=> b!389737 (= c!54115 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!389738 () Bool)

(assert (=> b!389738 (= e!236111 (not call!27480))))

(declare-fun bm!27474 () Bool)

(declare-fun call!27479 () ListLongMap!5429)

(declare-fun call!27477 () ListLongMap!5429)

(assert (=> bm!27474 (= call!27479 call!27477)))

(declare-fun bm!27475 () Bool)

(assert (=> bm!27475 (= call!27477 call!27476)))

(declare-fun d!72929 () Bool)

(assert (=> d!72929 e!236114))

(declare-fun res!222914 () Bool)

(assert (=> d!72929 (=> (not res!222914) (not e!236114))))

(assert (=> d!72929 (= res!222914 (or (bvsge #b00000000000000000000000000000000 (size!11368 lt!183186)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))))

(declare-fun lt!183355 () ListLongMap!5429)

(assert (=> d!72929 (= lt!183342 lt!183355)))

(declare-fun lt!183343 () Unit!11930)

(assert (=> d!72929 (= lt!183343 e!236112)))

(declare-fun c!54113 () Bool)

(assert (=> d!72929 (= c!54113 e!236108)))

(declare-fun res!222913 () Bool)

(assert (=> d!72929 (=> (not res!222913) (not e!236108))))

(assert (=> d!72929 (= res!222913 (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(assert (=> d!72929 (= lt!183355 e!236107)))

(declare-fun c!54117 () Bool)

(assert (=> d!72929 (= c!54117 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72929 (validMask!0 mask!970)))

(assert (=> d!72929 (= (getCurrentListMap!2079 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183342)))

(declare-fun bm!27476 () Bool)

(assert (=> bm!27476 (= call!27480 (contains!2449 lt!183342 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27477 () Bool)

(assert (=> bm!27477 (= call!27478 call!27475)))

(declare-fun b!389739 () Bool)

(assert (=> b!389739 (= e!236109 call!27478)))

(declare-fun bm!27478 () Bool)

(assert (=> bm!27478 (= call!27475 (+!1025 (ite c!54117 call!27476 (ite c!54115 call!27477 call!27479)) (ite (or c!54117 c!54115) (tuple2!6517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6517 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!389740 () Bool)

(assert (=> b!389740 (= e!236113 (= (apply!300 lt!183342 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!389741 () Bool)

(assert (=> b!389741 (= e!236104 call!27479)))

(assert (= (and d!72929 c!54117) b!389725))

(assert (= (and d!72929 (not c!54117)) b!389737))

(assert (= (and b!389737 c!54115) b!389739))

(assert (= (and b!389737 (not c!54115)) b!389730))

(assert (= (and b!389730 c!54114) b!389732))

(assert (= (and b!389730 (not c!54114)) b!389741))

(assert (= (or b!389732 b!389741) bm!27474))

(assert (= (or b!389739 bm!27474) bm!27475))

(assert (= (or b!389739 b!389732) bm!27477))

(assert (= (or b!389725 bm!27475) bm!27472))

(assert (= (or b!389725 bm!27477) bm!27478))

(assert (= (and d!72929 res!222913) b!389726))

(assert (= (and d!72929 c!54113) b!389723))

(assert (= (and d!72929 (not c!54113)) b!389735))

(assert (= (and d!72929 res!222914) b!389728))

(assert (= (and b!389728 res!222917) b!389722))

(assert (= (and b!389728 (not res!222912)) b!389729))

(assert (= (and b!389729 res!222918) b!389721))

(assert (= (and b!389728 res!222915) b!389731))

(assert (= (and b!389731 c!54116) b!389736))

(assert (= (and b!389731 (not c!54116)) b!389727))

(assert (= (and b!389736 res!222916) b!389740))

(assert (= (or b!389736 b!389727) bm!27473))

(assert (= (and b!389731 res!222911) b!389733))

(assert (= (and b!389733 c!54112) b!389724))

(assert (= (and b!389733 (not c!54112)) b!389738))

(assert (= (and b!389724 res!222919) b!389734))

(assert (= (or b!389724 b!389738) bm!27476))

(declare-fun b_lambda!8605 () Bool)

(assert (=> (not b_lambda!8605) (not b!389721)))

(assert (=> b!389721 t!11531))

(declare-fun b_and!16219 () Bool)

(assert (= b_and!16217 (and (=> t!11531 result!5725) b_and!16219)))

(declare-fun m!385845 () Bool)

(assert (=> bm!27478 m!385845))

(declare-fun m!385847 () Bool)

(assert (=> b!389723 m!385847))

(declare-fun m!385849 () Bool)

(assert (=> b!389723 m!385849))

(assert (=> b!389723 m!385749))

(declare-fun m!385851 () Bool)

(assert (=> b!389723 m!385851))

(assert (=> b!389723 m!385685))

(declare-fun m!385853 () Bool)

(assert (=> b!389723 m!385853))

(declare-fun m!385855 () Bool)

(assert (=> b!389723 m!385855))

(assert (=> b!389723 m!385855))

(declare-fun m!385857 () Bool)

(assert (=> b!389723 m!385857))

(assert (=> b!389723 m!385847))

(declare-fun m!385859 () Bool)

(assert (=> b!389723 m!385859))

(declare-fun m!385861 () Bool)

(assert (=> b!389723 m!385861))

(declare-fun m!385863 () Bool)

(assert (=> b!389723 m!385863))

(declare-fun m!385865 () Bool)

(assert (=> b!389723 m!385865))

(declare-fun m!385867 () Bool)

(assert (=> b!389723 m!385867))

(declare-fun m!385869 () Bool)

(assert (=> b!389723 m!385869))

(assert (=> b!389723 m!385861))

(declare-fun m!385871 () Bool)

(assert (=> b!389723 m!385871))

(assert (=> b!389723 m!385865))

(declare-fun m!385873 () Bool)

(assert (=> b!389723 m!385873))

(declare-fun m!385875 () Bool)

(assert (=> b!389723 m!385875))

(declare-fun m!385877 () Bool)

(assert (=> b!389725 m!385877))

(assert (=> d!72929 m!385651))

(declare-fun m!385879 () Bool)

(assert (=> bm!27476 m!385879))

(declare-fun m!385881 () Bool)

(assert (=> b!389734 m!385881))

(assert (=> b!389721 m!385749))

(declare-fun m!385883 () Bool)

(assert (=> b!389721 m!385883))

(declare-fun m!385885 () Bool)

(assert (=> b!389721 m!385885))

(assert (=> b!389721 m!385775))

(assert (=> b!389721 m!385885))

(assert (=> b!389721 m!385775))

(declare-fun m!385887 () Bool)

(assert (=> b!389721 m!385887))

(assert (=> b!389721 m!385749))

(assert (=> b!389729 m!385749))

(assert (=> b!389729 m!385749))

(declare-fun m!385889 () Bool)

(assert (=> b!389729 m!385889))

(assert (=> bm!27472 m!385685))

(declare-fun m!385891 () Bool)

(assert (=> b!389740 m!385891))

(assert (=> b!389722 m!385749))

(assert (=> b!389722 m!385749))

(assert (=> b!389722 m!385759))

(assert (=> b!389726 m!385749))

(assert (=> b!389726 m!385749))

(assert (=> b!389726 m!385759))

(declare-fun m!385893 () Bool)

(assert (=> bm!27473 m!385893))

(assert (=> b!389558 d!72929))

(declare-fun b!389748 () Bool)

(declare-fun e!236121 () Bool)

(declare-fun call!27487 () ListLongMap!5429)

(declare-fun call!27486 () ListLongMap!5429)

(assert (=> b!389748 (= e!236121 (= call!27487 call!27486))))

(declare-fun bm!27483 () Bool)

(assert (=> bm!27483 (= call!27486 (getCurrentListMapNoExtraKeys!959 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27484 () Bool)

(assert (=> bm!27484 (= call!27487 (getCurrentListMapNoExtraKeys!959 (array!23102 (store (arr!11016 _keys!658) i!548 k0!778) (size!11368 _keys!658)) (array!23104 (store (arr!11017 _values!506) i!548 (ValueCellFull!4458 v!373)) (size!11369 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!389749 () Bool)

(declare-fun e!236120 () Bool)

(assert (=> b!389749 (= e!236120 e!236121)))

(declare-fun c!54120 () Bool)

(assert (=> b!389749 (= c!54120 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!72931 () Bool)

(assert (=> d!72931 e!236120))

(declare-fun res!222922 () Bool)

(assert (=> d!72931 (=> (not res!222922) (not e!236120))))

(assert (=> d!72931 (= res!222922 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11368 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11369 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11368 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11369 _values!506))))))))

(declare-fun lt!183364 () Unit!11930)

(declare-fun choose!1314 (array!23101 array!23103 (_ BitVec 32) (_ BitVec 32) V!13909 V!13909 (_ BitVec 32) (_ BitVec 64) V!13909 (_ BitVec 32) Int) Unit!11930)

(assert (=> d!72931 (= lt!183364 (choose!1314 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72931 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (=> d!72931 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!243 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!183364)))

(declare-fun b!389750 () Bool)

(assert (=> b!389750 (= e!236121 (= call!27487 (+!1025 call!27486 (tuple2!6517 k0!778 v!373))))))

(assert (= (and d!72931 res!222922) b!389749))

(assert (= (and b!389749 c!54120) b!389750))

(assert (= (and b!389749 (not c!54120)) b!389748))

(assert (= (or b!389750 b!389748) bm!27483))

(assert (= (or b!389750 b!389748) bm!27484))

(assert (=> bm!27483 m!385679))

(assert (=> bm!27484 m!385649))

(assert (=> bm!27484 m!385689))

(declare-fun m!385895 () Bool)

(assert (=> bm!27484 m!385895))

(declare-fun m!385897 () Bool)

(assert (=> d!72931 m!385897))

(declare-fun m!385899 () Bool)

(assert (=> b!389750 m!385899))

(assert (=> b!389558 d!72931))

(declare-fun b!389751 () Bool)

(declare-fun e!236123 () ListLongMap!5429)

(declare-fun e!236127 () ListLongMap!5429)

(assert (=> b!389751 (= e!236123 e!236127)))

(declare-fun c!54121 () Bool)

(assert (=> b!389751 (= c!54121 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(declare-fun b!389752 () Bool)

(declare-fun e!236128 () Bool)

(declare-fun lt!183369 () ListLongMap!5429)

(assert (=> b!389752 (= e!236128 (isEmpty!546 lt!183369))))

(declare-fun b!389753 () Bool)

(declare-fun e!236122 () Bool)

(assert (=> b!389753 (= e!236122 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(assert (=> b!389753 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!389754 () Bool)

(declare-fun lt!183368 () Unit!11930)

(declare-fun lt!183366 () Unit!11930)

(assert (=> b!389754 (= lt!183368 lt!183366)))

(declare-fun lt!183367 () ListLongMap!5429)

(declare-fun lt!183365 () V!13909)

(declare-fun lt!183370 () (_ BitVec 64))

(declare-fun lt!183371 () (_ BitVec 64))

(assert (=> b!389754 (not (contains!2449 (+!1025 lt!183367 (tuple2!6517 lt!183371 lt!183365)) lt!183370))))

(assert (=> b!389754 (= lt!183366 (addStillNotContains!133 lt!183367 lt!183371 lt!183365 lt!183370))))

(assert (=> b!389754 (= lt!183370 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!389754 (= lt!183365 (get!5574 (select (arr!11017 lt!183192) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!389754 (= lt!183371 (select (arr!11016 lt!183186) #b00000000000000000000000000000000))))

(declare-fun call!27488 () ListLongMap!5429)

(assert (=> b!389754 (= lt!183367 call!27488)))

(assert (=> b!389754 (= e!236127 (+!1025 call!27488 (tuple2!6517 (select (arr!11016 lt!183186) #b00000000000000000000000000000000) (get!5574 (select (arr!11017 lt!183192) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!389755 () Bool)

(assert (=> b!389755 (= e!236123 (ListLongMap!5430 Nil!6368))))

(declare-fun b!389756 () Bool)

(assert (=> b!389756 (= e!236127 call!27488)))

(declare-fun bm!27485 () Bool)

(assert (=> bm!27485 (= call!27488 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!389757 () Bool)

(declare-fun res!222926 () Bool)

(declare-fun e!236126 () Bool)

(assert (=> b!389757 (=> (not res!222926) (not e!236126))))

(assert (=> b!389757 (= res!222926 (not (contains!2449 lt!183369 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!389758 () Bool)

(declare-fun e!236124 () Bool)

(declare-fun e!236125 () Bool)

(assert (=> b!389758 (= e!236124 e!236125)))

(assert (=> b!389758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(declare-fun res!222924 () Bool)

(assert (=> b!389758 (= res!222924 (contains!2449 lt!183369 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(assert (=> b!389758 (=> (not res!222924) (not e!236125))))

(declare-fun d!72933 () Bool)

(assert (=> d!72933 e!236126))

(declare-fun res!222925 () Bool)

(assert (=> d!72933 (=> (not res!222925) (not e!236126))))

(assert (=> d!72933 (= res!222925 (not (contains!2449 lt!183369 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72933 (= lt!183369 e!236123)))

(declare-fun c!54122 () Bool)

(assert (=> d!72933 (= c!54122 (bvsge #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(assert (=> d!72933 (validMask!0 mask!970)))

(assert (=> d!72933 (= (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!183369)))

(declare-fun b!389759 () Bool)

(assert (=> b!389759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(assert (=> b!389759 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11369 lt!183192)))))

(assert (=> b!389759 (= e!236125 (= (apply!300 lt!183369 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)) (get!5574 (select (arr!11017 lt!183192) #b00000000000000000000000000000000) (dynLambda!643 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!389760 () Bool)

(assert (=> b!389760 (= e!236128 (= lt!183369 (getCurrentListMapNoExtraKeys!959 lt!183186 lt!183192 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!389761 () Bool)

(assert (=> b!389761 (= e!236126 e!236124)))

(declare-fun c!54123 () Bool)

(assert (=> b!389761 (= c!54123 e!236122)))

(declare-fun res!222923 () Bool)

(assert (=> b!389761 (=> (not res!222923) (not e!236122))))

(assert (=> b!389761 (= res!222923 (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(declare-fun b!389762 () Bool)

(assert (=> b!389762 (= e!236124 e!236128)))

(declare-fun c!54124 () Bool)

(assert (=> b!389762 (= c!54124 (bvslt #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(assert (= (and d!72933 c!54122) b!389755))

(assert (= (and d!72933 (not c!54122)) b!389751))

(assert (= (and b!389751 c!54121) b!389754))

(assert (= (and b!389751 (not c!54121)) b!389756))

(assert (= (or b!389754 b!389756) bm!27485))

(assert (= (and d!72933 res!222925) b!389757))

(assert (= (and b!389757 res!222926) b!389761))

(assert (= (and b!389761 res!222923) b!389753))

(assert (= (and b!389761 c!54123) b!389758))

(assert (= (and b!389761 (not c!54123)) b!389762))

(assert (= (and b!389758 res!222924) b!389759))

(assert (= (and b!389762 c!54124) b!389760))

(assert (= (and b!389762 (not c!54124)) b!389752))

(declare-fun b_lambda!8607 () Bool)

(assert (=> (not b_lambda!8607) (not b!389754)))

(assert (=> b!389754 t!11531))

(declare-fun b_and!16221 () Bool)

(assert (= b_and!16219 (and (=> t!11531 result!5725) b_and!16221)))

(declare-fun b_lambda!8609 () Bool)

(assert (=> (not b_lambda!8609) (not b!389759)))

(assert (=> b!389759 t!11531))

(declare-fun b_and!16223 () Bool)

(assert (= b_and!16221 (and (=> t!11531 result!5725) b_and!16223)))

(assert (=> b!389759 m!385749))

(assert (=> b!389759 m!385749))

(declare-fun m!385901 () Bool)

(assert (=> b!389759 m!385901))

(assert (=> b!389759 m!385775))

(assert (=> b!389759 m!385885))

(assert (=> b!389759 m!385775))

(assert (=> b!389759 m!385887))

(assert (=> b!389759 m!385885))

(declare-fun m!385903 () Bool)

(assert (=> b!389754 m!385903))

(assert (=> b!389754 m!385749))

(declare-fun m!385905 () Bool)

(assert (=> b!389754 m!385905))

(declare-fun m!385907 () Bool)

(assert (=> b!389754 m!385907))

(assert (=> b!389754 m!385903))

(declare-fun m!385909 () Bool)

(assert (=> b!389754 m!385909))

(assert (=> b!389754 m!385775))

(assert (=> b!389754 m!385885))

(assert (=> b!389754 m!385775))

(assert (=> b!389754 m!385887))

(assert (=> b!389754 m!385885))

(assert (=> b!389753 m!385749))

(assert (=> b!389753 m!385749))

(assert (=> b!389753 m!385759))

(assert (=> b!389758 m!385749))

(assert (=> b!389758 m!385749))

(declare-fun m!385911 () Bool)

(assert (=> b!389758 m!385911))

(assert (=> b!389751 m!385749))

(assert (=> b!389751 m!385749))

(assert (=> b!389751 m!385759))

(declare-fun m!385913 () Bool)

(assert (=> b!389757 m!385913))

(declare-fun m!385915 () Bool)

(assert (=> b!389752 m!385915))

(declare-fun m!385917 () Bool)

(assert (=> bm!27485 m!385917))

(assert (=> b!389760 m!385917))

(declare-fun m!385919 () Bool)

(assert (=> d!72933 m!385919))

(assert (=> d!72933 m!385651))

(assert (=> b!389558 d!72933))

(declare-fun d!72935 () Bool)

(declare-fun e!236131 () Bool)

(assert (=> d!72935 e!236131))

(declare-fun res!222931 () Bool)

(assert (=> d!72935 (=> (not res!222931) (not e!236131))))

(declare-fun lt!183382 () ListLongMap!5429)

(assert (=> d!72935 (= res!222931 (contains!2449 lt!183382 (_1!3269 lt!183194)))))

(declare-fun lt!183380 () List!6371)

(assert (=> d!72935 (= lt!183382 (ListLongMap!5430 lt!183380))))

(declare-fun lt!183383 () Unit!11930)

(declare-fun lt!183381 () Unit!11930)

(assert (=> d!72935 (= lt!183383 lt!183381)))

(declare-datatypes ((Option!364 0))(
  ( (Some!363 (v!7060 V!13909)) (None!362) )
))
(declare-fun getValueByKey!358 (List!6371 (_ BitVec 64)) Option!364)

(assert (=> d!72935 (= (getValueByKey!358 lt!183380 (_1!3269 lt!183194)) (Some!363 (_2!3269 lt!183194)))))

(declare-fun lemmaContainsTupThenGetReturnValue!180 (List!6371 (_ BitVec 64) V!13909) Unit!11930)

(assert (=> d!72935 (= lt!183381 (lemmaContainsTupThenGetReturnValue!180 lt!183380 (_1!3269 lt!183194) (_2!3269 lt!183194)))))

(declare-fun insertStrictlySorted!183 (List!6371 (_ BitVec 64) V!13909) List!6371)

(assert (=> d!72935 (= lt!183380 (insertStrictlySorted!183 (toList!2730 lt!183198) (_1!3269 lt!183194) (_2!3269 lt!183194)))))

(assert (=> d!72935 (= (+!1025 lt!183198 lt!183194) lt!183382)))

(declare-fun b!389767 () Bool)

(declare-fun res!222932 () Bool)

(assert (=> b!389767 (=> (not res!222932) (not e!236131))))

(assert (=> b!389767 (= res!222932 (= (getValueByKey!358 (toList!2730 lt!183382) (_1!3269 lt!183194)) (Some!363 (_2!3269 lt!183194))))))

(declare-fun b!389768 () Bool)

(declare-fun contains!2450 (List!6371 tuple2!6516) Bool)

(assert (=> b!389768 (= e!236131 (contains!2450 (toList!2730 lt!183382) lt!183194))))

(assert (= (and d!72935 res!222931) b!389767))

(assert (= (and b!389767 res!222932) b!389768))

(declare-fun m!385921 () Bool)

(assert (=> d!72935 m!385921))

(declare-fun m!385923 () Bool)

(assert (=> d!72935 m!385923))

(declare-fun m!385925 () Bool)

(assert (=> d!72935 m!385925))

(declare-fun m!385927 () Bool)

(assert (=> d!72935 m!385927))

(declare-fun m!385929 () Bool)

(assert (=> b!389767 m!385929))

(declare-fun m!385931 () Bool)

(assert (=> b!389768 m!385931))

(assert (=> b!389558 d!72935))

(declare-fun d!72937 () Bool)

(declare-fun e!236132 () Bool)

(assert (=> d!72937 e!236132))

(declare-fun res!222933 () Bool)

(assert (=> d!72937 (=> (not res!222933) (not e!236132))))

(declare-fun lt!183386 () ListLongMap!5429)

(assert (=> d!72937 (= res!222933 (contains!2449 lt!183386 (_1!3269 lt!183189)))))

(declare-fun lt!183384 () List!6371)

(assert (=> d!72937 (= lt!183386 (ListLongMap!5430 lt!183384))))

(declare-fun lt!183387 () Unit!11930)

(declare-fun lt!183385 () Unit!11930)

(assert (=> d!72937 (= lt!183387 lt!183385)))

(assert (=> d!72937 (= (getValueByKey!358 lt!183384 (_1!3269 lt!183189)) (Some!363 (_2!3269 lt!183189)))))

(assert (=> d!72937 (= lt!183385 (lemmaContainsTupThenGetReturnValue!180 lt!183384 (_1!3269 lt!183189) (_2!3269 lt!183189)))))

(assert (=> d!72937 (= lt!183384 (insertStrictlySorted!183 (toList!2730 lt!183190) (_1!3269 lt!183189) (_2!3269 lt!183189)))))

(assert (=> d!72937 (= (+!1025 lt!183190 lt!183189) lt!183386)))

(declare-fun b!389769 () Bool)

(declare-fun res!222934 () Bool)

(assert (=> b!389769 (=> (not res!222934) (not e!236132))))

(assert (=> b!389769 (= res!222934 (= (getValueByKey!358 (toList!2730 lt!183386) (_1!3269 lt!183189)) (Some!363 (_2!3269 lt!183189))))))

(declare-fun b!389770 () Bool)

(assert (=> b!389770 (= e!236132 (contains!2450 (toList!2730 lt!183386) lt!183189))))

(assert (= (and d!72937 res!222933) b!389769))

(assert (= (and b!389769 res!222934) b!389770))

(declare-fun m!385933 () Bool)

(assert (=> d!72937 m!385933))

(declare-fun m!385935 () Bool)

(assert (=> d!72937 m!385935))

(declare-fun m!385937 () Bool)

(assert (=> d!72937 m!385937))

(declare-fun m!385939 () Bool)

(assert (=> d!72937 m!385939))

(declare-fun m!385941 () Bool)

(assert (=> b!389769 m!385941))

(declare-fun m!385943 () Bool)

(assert (=> b!389770 m!385943))

(assert (=> b!389559 d!72937))

(declare-fun d!72939 () Bool)

(declare-fun e!236133 () Bool)

(assert (=> d!72939 e!236133))

(declare-fun res!222935 () Bool)

(assert (=> d!72939 (=> (not res!222935) (not e!236133))))

(declare-fun lt!183390 () ListLongMap!5429)

(assert (=> d!72939 (= res!222935 (contains!2449 lt!183390 (_1!3269 lt!183185)))))

(declare-fun lt!183388 () List!6371)

(assert (=> d!72939 (= lt!183390 (ListLongMap!5430 lt!183388))))

(declare-fun lt!183391 () Unit!11930)

(declare-fun lt!183389 () Unit!11930)

(assert (=> d!72939 (= lt!183391 lt!183389)))

(assert (=> d!72939 (= (getValueByKey!358 lt!183388 (_1!3269 lt!183185)) (Some!363 (_2!3269 lt!183185)))))

(assert (=> d!72939 (= lt!183389 (lemmaContainsTupThenGetReturnValue!180 lt!183388 (_1!3269 lt!183185) (_2!3269 lt!183185)))))

(assert (=> d!72939 (= lt!183388 (insertStrictlySorted!183 (toList!2730 lt!183195) (_1!3269 lt!183185) (_2!3269 lt!183185)))))

(assert (=> d!72939 (= (+!1025 lt!183195 lt!183185) lt!183390)))

(declare-fun b!389771 () Bool)

(declare-fun res!222936 () Bool)

(assert (=> b!389771 (=> (not res!222936) (not e!236133))))

(assert (=> b!389771 (= res!222936 (= (getValueByKey!358 (toList!2730 lt!183390) (_1!3269 lt!183185)) (Some!363 (_2!3269 lt!183185))))))

(declare-fun b!389772 () Bool)

(assert (=> b!389772 (= e!236133 (contains!2450 (toList!2730 lt!183390) lt!183185))))

(assert (= (and d!72939 res!222935) b!389771))

(assert (= (and b!389771 res!222936) b!389772))

(declare-fun m!385945 () Bool)

(assert (=> d!72939 m!385945))

(declare-fun m!385947 () Bool)

(assert (=> d!72939 m!385947))

(declare-fun m!385949 () Bool)

(assert (=> d!72939 m!385949))

(declare-fun m!385951 () Bool)

(assert (=> d!72939 m!385951))

(declare-fun m!385953 () Bool)

(assert (=> b!389771 m!385953))

(declare-fun m!385955 () Bool)

(assert (=> b!389772 m!385955))

(assert (=> b!389559 d!72939))

(declare-fun d!72941 () Bool)

(declare-fun e!236134 () Bool)

(assert (=> d!72941 e!236134))

(declare-fun res!222937 () Bool)

(assert (=> d!72941 (=> (not res!222937) (not e!236134))))

(declare-fun lt!183394 () ListLongMap!5429)

(assert (=> d!72941 (= res!222937 (contains!2449 lt!183394 (_1!3269 lt!183185)))))

(declare-fun lt!183392 () List!6371)

(assert (=> d!72941 (= lt!183394 (ListLongMap!5430 lt!183392))))

(declare-fun lt!183395 () Unit!11930)

(declare-fun lt!183393 () Unit!11930)

(assert (=> d!72941 (= lt!183395 lt!183393)))

(assert (=> d!72941 (= (getValueByKey!358 lt!183392 (_1!3269 lt!183185)) (Some!363 (_2!3269 lt!183185)))))

(assert (=> d!72941 (= lt!183393 (lemmaContainsTupThenGetReturnValue!180 lt!183392 (_1!3269 lt!183185) (_2!3269 lt!183185)))))

(assert (=> d!72941 (= lt!183392 (insertStrictlySorted!183 (toList!2730 (+!1025 lt!183190 lt!183189)) (_1!3269 lt!183185) (_2!3269 lt!183185)))))

(assert (=> d!72941 (= (+!1025 (+!1025 lt!183190 lt!183189) lt!183185) lt!183394)))

(declare-fun b!389773 () Bool)

(declare-fun res!222938 () Bool)

(assert (=> b!389773 (=> (not res!222938) (not e!236134))))

(assert (=> b!389773 (= res!222938 (= (getValueByKey!358 (toList!2730 lt!183394) (_1!3269 lt!183185)) (Some!363 (_2!3269 lt!183185))))))

(declare-fun b!389774 () Bool)

(assert (=> b!389774 (= e!236134 (contains!2450 (toList!2730 lt!183394) lt!183185))))

(assert (= (and d!72941 res!222937) b!389773))

(assert (= (and b!389773 res!222938) b!389774))

(declare-fun m!385957 () Bool)

(assert (=> d!72941 m!385957))

(declare-fun m!385959 () Bool)

(assert (=> d!72941 m!385959))

(declare-fun m!385961 () Bool)

(assert (=> d!72941 m!385961))

(declare-fun m!385963 () Bool)

(assert (=> d!72941 m!385963))

(declare-fun m!385965 () Bool)

(assert (=> b!389773 m!385965))

(declare-fun m!385967 () Bool)

(assert (=> b!389774 m!385967))

(assert (=> b!389559 d!72941))

(declare-fun d!72943 () Bool)

(declare-fun e!236135 () Bool)

(assert (=> d!72943 e!236135))

(declare-fun res!222939 () Bool)

(assert (=> d!72943 (=> (not res!222939) (not e!236135))))

(declare-fun lt!183398 () ListLongMap!5429)

(assert (=> d!72943 (= res!222939 (contains!2449 lt!183398 (_1!3269 lt!183189)))))

(declare-fun lt!183396 () List!6371)

(assert (=> d!72943 (= lt!183398 (ListLongMap!5430 lt!183396))))

(declare-fun lt!183399 () Unit!11930)

(declare-fun lt!183397 () Unit!11930)

(assert (=> d!72943 (= lt!183399 lt!183397)))

(assert (=> d!72943 (= (getValueByKey!358 lt!183396 (_1!3269 lt!183189)) (Some!363 (_2!3269 lt!183189)))))

(assert (=> d!72943 (= lt!183397 (lemmaContainsTupThenGetReturnValue!180 lt!183396 (_1!3269 lt!183189) (_2!3269 lt!183189)))))

(assert (=> d!72943 (= lt!183396 (insertStrictlySorted!183 (toList!2730 lt!183196) (_1!3269 lt!183189) (_2!3269 lt!183189)))))

(assert (=> d!72943 (= (+!1025 lt!183196 lt!183189) lt!183398)))

(declare-fun b!389775 () Bool)

(declare-fun res!222940 () Bool)

(assert (=> b!389775 (=> (not res!222940) (not e!236135))))

(assert (=> b!389775 (= res!222940 (= (getValueByKey!358 (toList!2730 lt!183398) (_1!3269 lt!183189)) (Some!363 (_2!3269 lt!183189))))))

(declare-fun b!389776 () Bool)

(assert (=> b!389776 (= e!236135 (contains!2450 (toList!2730 lt!183398) lt!183189))))

(assert (= (and d!72943 res!222939) b!389775))

(assert (= (and b!389775 res!222940) b!389776))

(declare-fun m!385969 () Bool)

(assert (=> d!72943 m!385969))

(declare-fun m!385971 () Bool)

(assert (=> d!72943 m!385971))

(declare-fun m!385973 () Bool)

(assert (=> d!72943 m!385973))

(declare-fun m!385975 () Bool)

(assert (=> d!72943 m!385975))

(declare-fun m!385977 () Bool)

(assert (=> b!389775 m!385977))

(declare-fun m!385979 () Bool)

(assert (=> b!389776 m!385979))

(assert (=> b!389559 d!72943))

(declare-fun d!72945 () Bool)

(declare-fun e!236136 () Bool)

(assert (=> d!72945 e!236136))

(declare-fun res!222941 () Bool)

(assert (=> d!72945 (=> (not res!222941) (not e!236136))))

(declare-fun lt!183402 () ListLongMap!5429)

(assert (=> d!72945 (= res!222941 (contains!2449 lt!183402 (_1!3269 lt!183189)))))

(declare-fun lt!183400 () List!6371)

(assert (=> d!72945 (= lt!183402 (ListLongMap!5430 lt!183400))))

(declare-fun lt!183403 () Unit!11930)

(declare-fun lt!183401 () Unit!11930)

(assert (=> d!72945 (= lt!183403 lt!183401)))

(assert (=> d!72945 (= (getValueByKey!358 lt!183400 (_1!3269 lt!183189)) (Some!363 (_2!3269 lt!183189)))))

(assert (=> d!72945 (= lt!183401 (lemmaContainsTupThenGetReturnValue!180 lt!183400 (_1!3269 lt!183189) (_2!3269 lt!183189)))))

(assert (=> d!72945 (= lt!183400 (insertStrictlySorted!183 (toList!2730 lt!183198) (_1!3269 lt!183189) (_2!3269 lt!183189)))))

(assert (=> d!72945 (= (+!1025 lt!183198 lt!183189) lt!183402)))

(declare-fun b!389777 () Bool)

(declare-fun res!222942 () Bool)

(assert (=> b!389777 (=> (not res!222942) (not e!236136))))

(assert (=> b!389777 (= res!222942 (= (getValueByKey!358 (toList!2730 lt!183402) (_1!3269 lt!183189)) (Some!363 (_2!3269 lt!183189))))))

(declare-fun b!389778 () Bool)

(assert (=> b!389778 (= e!236136 (contains!2450 (toList!2730 lt!183402) lt!183189))))

(assert (= (and d!72945 res!222941) b!389777))

(assert (= (and b!389777 res!222942) b!389778))

(declare-fun m!385981 () Bool)

(assert (=> d!72945 m!385981))

(declare-fun m!385983 () Bool)

(assert (=> d!72945 m!385983))

(declare-fun m!385985 () Bool)

(assert (=> d!72945 m!385985))

(declare-fun m!385987 () Bool)

(assert (=> d!72945 m!385987))

(declare-fun m!385989 () Bool)

(assert (=> b!389777 m!385989))

(declare-fun m!385991 () Bool)

(assert (=> b!389778 m!385991))

(assert (=> b!389559 d!72945))

(declare-fun d!72947 () Bool)

(declare-fun e!236137 () Bool)

(assert (=> d!72947 e!236137))

(declare-fun res!222943 () Bool)

(assert (=> d!72947 (=> (not res!222943) (not e!236137))))

(declare-fun lt!183406 () ListLongMap!5429)

(assert (=> d!72947 (= res!222943 (contains!2449 lt!183406 (_1!3269 lt!183194)))))

(declare-fun lt!183404 () List!6371)

(assert (=> d!72947 (= lt!183406 (ListLongMap!5430 lt!183404))))

(declare-fun lt!183407 () Unit!11930)

(declare-fun lt!183405 () Unit!11930)

(assert (=> d!72947 (= lt!183407 lt!183405)))

(assert (=> d!72947 (= (getValueByKey!358 lt!183404 (_1!3269 lt!183194)) (Some!363 (_2!3269 lt!183194)))))

(assert (=> d!72947 (= lt!183405 (lemmaContainsTupThenGetReturnValue!180 lt!183404 (_1!3269 lt!183194) (_2!3269 lt!183194)))))

(assert (=> d!72947 (= lt!183404 (insertStrictlySorted!183 (toList!2730 lt!183195) (_1!3269 lt!183194) (_2!3269 lt!183194)))))

(assert (=> d!72947 (= (+!1025 lt!183195 lt!183194) lt!183406)))

(declare-fun b!389779 () Bool)

(declare-fun res!222944 () Bool)

(assert (=> b!389779 (=> (not res!222944) (not e!236137))))

(assert (=> b!389779 (= res!222944 (= (getValueByKey!358 (toList!2730 lt!183406) (_1!3269 lt!183194)) (Some!363 (_2!3269 lt!183194))))))

(declare-fun b!389780 () Bool)

(assert (=> b!389780 (= e!236137 (contains!2450 (toList!2730 lt!183406) lt!183194))))

(assert (= (and d!72947 res!222943) b!389779))

(assert (= (and b!389779 res!222944) b!389780))

(declare-fun m!385993 () Bool)

(assert (=> d!72947 m!385993))

(declare-fun m!385995 () Bool)

(assert (=> d!72947 m!385995))

(declare-fun m!385997 () Bool)

(assert (=> d!72947 m!385997))

(declare-fun m!385999 () Bool)

(assert (=> d!72947 m!385999))

(declare-fun m!386001 () Bool)

(assert (=> b!389779 m!386001))

(declare-fun m!386003 () Bool)

(assert (=> b!389780 m!386003))

(assert (=> b!389559 d!72947))

(declare-fun d!72949 () Bool)

(assert (=> d!72949 (= (+!1025 (+!1025 lt!183198 (tuple2!6517 k0!778 v!373)) (tuple2!6517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (+!1025 (+!1025 lt!183198 (tuple2!6517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472)) (tuple2!6517 k0!778 v!373)))))

(declare-fun lt!183410 () Unit!11930)

(declare-fun choose!1315 (ListLongMap!5429 (_ BitVec 64) V!13909 (_ BitVec 64) V!13909) Unit!11930)

(assert (=> d!72949 (= lt!183410 (choose!1315 lt!183198 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(assert (=> d!72949 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!72949 (= (addCommutativeForDiffKeys!329 lt!183198 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) lt!183410)))

(declare-fun bs!13132 () Bool)

(assert (= bs!13132 d!72949))

(declare-fun m!386005 () Bool)

(assert (=> bs!13132 m!386005))

(assert (=> bs!13132 m!386005))

(declare-fun m!386007 () Bool)

(assert (=> bs!13132 m!386007))

(declare-fun m!386009 () Bool)

(assert (=> bs!13132 m!386009))

(assert (=> bs!13132 m!386009))

(declare-fun m!386011 () Bool)

(assert (=> bs!13132 m!386011))

(declare-fun m!386013 () Bool)

(assert (=> bs!13132 m!386013))

(assert (=> b!389559 d!72949))

(declare-fun d!72951 () Bool)

(declare-fun e!236138 () Bool)

(assert (=> d!72951 e!236138))

(declare-fun res!222945 () Bool)

(assert (=> d!72951 (=> (not res!222945) (not e!236138))))

(declare-fun lt!183413 () ListLongMap!5429)

(assert (=> d!72951 (= res!222945 (contains!2449 lt!183413 (_1!3269 lt!183185)))))

(declare-fun lt!183411 () List!6371)

(assert (=> d!72951 (= lt!183413 (ListLongMap!5430 lt!183411))))

(declare-fun lt!183414 () Unit!11930)

(declare-fun lt!183412 () Unit!11930)

(assert (=> d!72951 (= lt!183414 lt!183412)))

(assert (=> d!72951 (= (getValueByKey!358 lt!183411 (_1!3269 lt!183185)) (Some!363 (_2!3269 lt!183185)))))

(assert (=> d!72951 (= lt!183412 (lemmaContainsTupThenGetReturnValue!180 lt!183411 (_1!3269 lt!183185) (_2!3269 lt!183185)))))

(assert (=> d!72951 (= lt!183411 (insertStrictlySorted!183 (toList!2730 lt!183197) (_1!3269 lt!183185) (_2!3269 lt!183185)))))

(assert (=> d!72951 (= (+!1025 lt!183197 lt!183185) lt!183413)))

(declare-fun b!389781 () Bool)

(declare-fun res!222946 () Bool)

(assert (=> b!389781 (=> (not res!222946) (not e!236138))))

(assert (=> b!389781 (= res!222946 (= (getValueByKey!358 (toList!2730 lt!183413) (_1!3269 lt!183185)) (Some!363 (_2!3269 lt!183185))))))

(declare-fun b!389782 () Bool)

(assert (=> b!389782 (= e!236138 (contains!2450 (toList!2730 lt!183413) lt!183185))))

(assert (= (and d!72951 res!222945) b!389781))

(assert (= (and b!389781 res!222946) b!389782))

(declare-fun m!386015 () Bool)

(assert (=> d!72951 m!386015))

(declare-fun m!386017 () Bool)

(assert (=> d!72951 m!386017))

(declare-fun m!386019 () Bool)

(assert (=> d!72951 m!386019))

(declare-fun m!386021 () Bool)

(assert (=> d!72951 m!386021))

(declare-fun m!386023 () Bool)

(assert (=> b!389781 m!386023))

(declare-fun m!386025 () Bool)

(assert (=> b!389782 m!386025))

(assert (=> b!389559 d!72951))

(declare-fun d!72953 () Bool)

(declare-fun res!222951 () Bool)

(declare-fun e!236143 () Bool)

(assert (=> d!72953 (=> res!222951 e!236143)))

(assert (=> d!72953 (= res!222951 (= (select (arr!11016 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72953 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236143)))

(declare-fun b!389787 () Bool)

(declare-fun e!236144 () Bool)

(assert (=> b!389787 (= e!236143 e!236144)))

(declare-fun res!222952 () Bool)

(assert (=> b!389787 (=> (not res!222952) (not e!236144))))

(assert (=> b!389787 (= res!222952 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11368 _keys!658)))))

(declare-fun b!389788 () Bool)

(assert (=> b!389788 (= e!236144 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72953 (not res!222951)) b!389787))

(assert (= (and b!389787 res!222952) b!389788))

(assert (=> d!72953 m!385761))

(declare-fun m!386027 () Bool)

(assert (=> b!389788 m!386027))

(assert (=> b!389560 d!72953))

(declare-fun b!389799 () Bool)

(declare-fun e!236154 () Bool)

(declare-fun contains!2451 (List!6370 (_ BitVec 64)) Bool)

(assert (=> b!389799 (= e!236154 (contains!2451 Nil!6367 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(declare-fun bm!27488 () Bool)

(declare-fun call!27491 () Bool)

(declare-fun c!54127 () Bool)

(assert (=> bm!27488 (= call!27491 (arrayNoDuplicates!0 lt!183186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54127 (Cons!6366 (select (arr!11016 lt!183186) #b00000000000000000000000000000000) Nil!6367) Nil!6367)))))

(declare-fun d!72955 () Bool)

(declare-fun res!222959 () Bool)

(declare-fun e!236156 () Bool)

(assert (=> d!72955 (=> res!222959 e!236156)))

(assert (=> d!72955 (= res!222959 (bvsge #b00000000000000000000000000000000 (size!11368 lt!183186)))))

(assert (=> d!72955 (= (arrayNoDuplicates!0 lt!183186 #b00000000000000000000000000000000 Nil!6367) e!236156)))

(declare-fun b!389800 () Bool)

(declare-fun e!236155 () Bool)

(assert (=> b!389800 (= e!236156 e!236155)))

(declare-fun res!222960 () Bool)

(assert (=> b!389800 (=> (not res!222960) (not e!236155))))

(assert (=> b!389800 (= res!222960 (not e!236154))))

(declare-fun res!222961 () Bool)

(assert (=> b!389800 (=> (not res!222961) (not e!236154))))

(assert (=> b!389800 (= res!222961 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(declare-fun b!389801 () Bool)

(declare-fun e!236153 () Bool)

(assert (=> b!389801 (= e!236153 call!27491)))

(declare-fun b!389802 () Bool)

(assert (=> b!389802 (= e!236153 call!27491)))

(declare-fun b!389803 () Bool)

(assert (=> b!389803 (= e!236155 e!236153)))

(assert (=> b!389803 (= c!54127 (validKeyInArray!0 (select (arr!11016 lt!183186) #b00000000000000000000000000000000)))))

(assert (= (and d!72955 (not res!222959)) b!389800))

(assert (= (and b!389800 res!222961) b!389799))

(assert (= (and b!389800 res!222960) b!389803))

(assert (= (and b!389803 c!54127) b!389802))

(assert (= (and b!389803 (not c!54127)) b!389801))

(assert (= (or b!389802 b!389801) bm!27488))

(assert (=> b!389799 m!385749))

(assert (=> b!389799 m!385749))

(declare-fun m!386029 () Bool)

(assert (=> b!389799 m!386029))

(assert (=> bm!27488 m!385749))

(declare-fun m!386031 () Bool)

(assert (=> bm!27488 m!386031))

(assert (=> b!389800 m!385749))

(assert (=> b!389800 m!385749))

(assert (=> b!389800 m!385759))

(assert (=> b!389803 m!385749))

(assert (=> b!389803 m!385749))

(assert (=> b!389803 m!385759))

(assert (=> b!389552 d!72955))

(declare-fun d!72957 () Bool)

(assert (=> d!72957 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!389561 d!72957))

(declare-fun b!389804 () Bool)

(declare-fun e!236158 () Bool)

(assert (=> b!389804 (= e!236158 (contains!2451 Nil!6367 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27489 () Bool)

(declare-fun call!27492 () Bool)

(declare-fun c!54128 () Bool)

(assert (=> bm!27489 (= call!27492 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54128 (Cons!6366 (select (arr!11016 _keys!658) #b00000000000000000000000000000000) Nil!6367) Nil!6367)))))

(declare-fun d!72959 () Bool)

(declare-fun res!222962 () Bool)

(declare-fun e!236160 () Bool)

(assert (=> d!72959 (=> res!222962 e!236160)))

(assert (=> d!72959 (= res!222962 (bvsge #b00000000000000000000000000000000 (size!11368 _keys!658)))))

(assert (=> d!72959 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6367) e!236160)))

(declare-fun b!389805 () Bool)

(declare-fun e!236159 () Bool)

(assert (=> b!389805 (= e!236160 e!236159)))

(declare-fun res!222963 () Bool)

(assert (=> b!389805 (=> (not res!222963) (not e!236159))))

(assert (=> b!389805 (= res!222963 (not e!236158))))

(declare-fun res!222964 () Bool)

(assert (=> b!389805 (=> (not res!222964) (not e!236158))))

(assert (=> b!389805 (= res!222964 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!389806 () Bool)

(declare-fun e!236157 () Bool)

(assert (=> b!389806 (= e!236157 call!27492)))

(declare-fun b!389807 () Bool)

(assert (=> b!389807 (= e!236157 call!27492)))

(declare-fun b!389808 () Bool)

(assert (=> b!389808 (= e!236159 e!236157)))

(assert (=> b!389808 (= c!54128 (validKeyInArray!0 (select (arr!11016 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72959 (not res!222962)) b!389805))

(assert (= (and b!389805 res!222964) b!389804))

(assert (= (and b!389805 res!222963) b!389808))

(assert (= (and b!389808 c!54128) b!389807))

(assert (= (and b!389808 (not c!54128)) b!389806))

(assert (= (or b!389807 b!389806) bm!27489))

(assert (=> b!389804 m!385761))

(assert (=> b!389804 m!385761))

(declare-fun m!386033 () Bool)

(assert (=> b!389804 m!386033))

(assert (=> bm!27489 m!385761))

(declare-fun m!386035 () Bool)

(assert (=> bm!27489 m!386035))

(assert (=> b!389805 m!385761))

(assert (=> b!389805 m!385761))

(assert (=> b!389805 m!385771))

(assert (=> b!389808 m!385761))

(assert (=> b!389808 m!385761))

(assert (=> b!389808 m!385771))

(assert (=> b!389556 d!72959))

(declare-fun d!72961 () Bool)

(assert (=> d!72961 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37894 d!72961))

(declare-fun d!72963 () Bool)

(assert (=> d!72963 (= (array_inv!8096 _values!506) (bvsge (size!11369 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37894 d!72963))

(declare-fun d!72965 () Bool)

(assert (=> d!72965 (= (array_inv!8097 _keys!658) (bvsge (size!11368 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37894 d!72965))

(declare-fun condMapEmpty!15984 () Bool)

(declare-fun mapDefault!15984 () ValueCell!4458)

(assert (=> mapNonEmpty!15978 (= condMapEmpty!15984 (= mapRest!15978 ((as const (Array (_ BitVec 32) ValueCell!4458)) mapDefault!15984)))))

(declare-fun e!236165 () Bool)

(declare-fun mapRes!15984 () Bool)

(assert (=> mapNonEmpty!15978 (= tp!31553 (and e!236165 mapRes!15984))))

(declare-fun mapIsEmpty!15984 () Bool)

(assert (=> mapIsEmpty!15984 mapRes!15984))

(declare-fun b!389816 () Bool)

(assert (=> b!389816 (= e!236165 tp_is_empty!9603)))

(declare-fun b!389815 () Bool)

(declare-fun e!236166 () Bool)

(assert (=> b!389815 (= e!236166 tp_is_empty!9603)))

(declare-fun mapNonEmpty!15984 () Bool)

(declare-fun tp!31563 () Bool)

(assert (=> mapNonEmpty!15984 (= mapRes!15984 (and tp!31563 e!236166))))

(declare-fun mapRest!15984 () (Array (_ BitVec 32) ValueCell!4458))

(declare-fun mapKey!15984 () (_ BitVec 32))

(declare-fun mapValue!15984 () ValueCell!4458)

(assert (=> mapNonEmpty!15984 (= mapRest!15978 (store mapRest!15984 mapKey!15984 mapValue!15984))))

(assert (= (and mapNonEmpty!15978 condMapEmpty!15984) mapIsEmpty!15984))

(assert (= (and mapNonEmpty!15978 (not condMapEmpty!15984)) mapNonEmpty!15984))

(assert (= (and mapNonEmpty!15984 ((_ is ValueCellFull!4458) mapValue!15984)) b!389815))

(assert (= (and mapNonEmpty!15978 ((_ is ValueCellFull!4458) mapDefault!15984)) b!389816))

(declare-fun m!386037 () Bool)

(assert (=> mapNonEmpty!15984 m!386037))

(declare-fun b_lambda!8611 () Bool)

(assert (= b_lambda!8609 (or (and start!37894 b_free!8931) b_lambda!8611)))

(declare-fun b_lambda!8613 () Bool)

(assert (= b_lambda!8607 (or (and start!37894 b_free!8931) b_lambda!8613)))

(declare-fun b_lambda!8615 () Bool)

(assert (= b_lambda!8605 (or (and start!37894 b_free!8931) b_lambda!8615)))

(declare-fun b_lambda!8617 () Bool)

(assert (= b_lambda!8603 (or (and start!37894 b_free!8931) b_lambda!8617)))

(declare-fun b_lambda!8619 () Bool)

(assert (= b_lambda!8599 (or (and start!37894 b_free!8931) b_lambda!8619)))

(declare-fun b_lambda!8621 () Bool)

(assert (= b_lambda!8601 (or (and start!37894 b_free!8931) b_lambda!8621)))

(check-sat (not b!389653) (not mapNonEmpty!15984) (not bm!27469) (not d!72931) (not bm!27472) (not bm!27489) (not b!389803) (not b!389782) tp_is_empty!9603 (not d!72929) (not d!72927) (not b!389799) (not b!389704) (not b!389751) (not b!389702) (not b!389650) (not b!389757) (not d!72933) (not d!72941) (not d!72939) (not b!389779) (not bm!27484) (not b!389619) (not b!389754) (not b!389700) (not bm!27473) (not b!389729) (not b_lambda!8621) (not b!389774) (not b!389777) (not b!389618) (not bm!27450) (not b!389740) (not b_lambda!8611) b_and!16223 (not bm!27446) (not b!389780) (not b!389645) (not b!389800) (not b!389708) (not b!389804) (not b!389713) (not b!389615) (not b!389760) (not b!389753) (not b!389759) (not b!389775) (not b!389725) (not b!389722) (not d!72925) (not b!389651) (not b_next!8931) (not d!72947) (not bm!27485) (not b!389773) (not b!389614) (not b!389808) (not b!389726) (not b!389778) (not b!389776) (not b!389644) (not b!389768) (not b!389721) (not b!389705) (not d!72935) (not b!389769) (not bm!27488) (not b_lambda!8619) (not b!389767) (not b!389701) (not bm!27466) (not b!389772) (not bm!27476) (not bm!27471) (not d!72949) (not b!389750) (not b!389723) (not b_lambda!8617) (not b!389719) (not b!389788) (not d!72937) (not b_lambda!8613) (not b!389647) (not b!389805) (not bm!27483) (not d!72951) (not b_lambda!8615) (not b!389781) (not bm!27465) (not b!389752) (not b!389652) (not bm!27478) (not b!389771) (not d!72943) (not b!389734) (not b!389758) (not d!72945) (not bm!27447) (not b!389646) (not b!389770))
(check-sat b_and!16223 (not b_next!8931))
