; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70318 () Bool)

(assert start!70318)

(declare-fun b_free!12693 () Bool)

(declare-fun b_next!12693 () Bool)

(assert (=> start!70318 (= b_free!12693 (not b_next!12693))))

(declare-fun tp!44802 () Bool)

(declare-fun b_and!21493 () Bool)

(assert (=> start!70318 (= tp!44802 b_and!21493)))

(declare-fun b!816948 () Bool)

(declare-fun res!557724 () Bool)

(declare-fun e!453258 () Bool)

(assert (=> b!816948 (=> (not res!557724) (not e!453258))))

(declare-datatypes ((array!45004 0))(
  ( (array!45005 (arr!21559 (Array (_ BitVec 32) (_ BitVec 64))) (size!21980 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45004)

(declare-datatypes ((List!15356 0))(
  ( (Nil!15353) (Cons!15352 (h!16481 (_ BitVec 64)) (t!21679 List!15356)) )
))
(declare-fun arrayNoDuplicates!0 (array!45004 (_ BitVec 32) List!15356) Bool)

(assert (=> b!816948 (= res!557724 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15353))))

(declare-fun b!816949 () Bool)

(declare-fun res!557723 () Bool)

(assert (=> b!816949 (=> (not res!557723) (not e!453258))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!24205 0))(
  ( (V!24206 (val!7249 Int)) )
))
(declare-datatypes ((ValueCell!6786 0))(
  ( (ValueCellFull!6786 (v!9677 V!24205)) (EmptyCell!6786) )
))
(declare-datatypes ((array!45006 0))(
  ( (array!45007 (arr!21560 (Array (_ BitVec 32) ValueCell!6786)) (size!21981 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45006)

(assert (=> b!816949 (= res!557723 (and (= (size!21981 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21980 _keys!976) (size!21981 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816950 () Bool)

(declare-fun e!453260 () Bool)

(declare-fun e!453257 () Bool)

(declare-fun mapRes!23194 () Bool)

(assert (=> b!816950 (= e!453260 (and e!453257 mapRes!23194))))

(declare-fun condMapEmpty!23194 () Bool)

(declare-fun mapDefault!23194 () ValueCell!6786)

(assert (=> b!816950 (= condMapEmpty!23194 (= (arr!21560 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6786)) mapDefault!23194)))))

(declare-fun b!816951 () Bool)

(declare-fun e!453261 () Bool)

(assert (=> b!816951 (= e!453261 (bvsle #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun mapNonEmpty!23194 () Bool)

(declare-fun tp!44803 () Bool)

(declare-fun e!453259 () Bool)

(assert (=> mapNonEmpty!23194 (= mapRes!23194 (and tp!44803 e!453259))))

(declare-fun mapRest!23194 () (Array (_ BitVec 32) ValueCell!6786))

(declare-fun mapKey!23194 () (_ BitVec 32))

(declare-fun mapValue!23194 () ValueCell!6786)

(assert (=> mapNonEmpty!23194 (= (arr!21560 _values!788) (store mapRest!23194 mapKey!23194 mapValue!23194))))

(declare-fun b!816952 () Bool)

(assert (=> b!816952 (= e!453258 (not e!453261))))

(declare-fun res!557727 () Bool)

(assert (=> b!816952 (=> res!557727 e!453261)))

(assert (=> b!816952 (= res!557727 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9528 0))(
  ( (tuple2!9529 (_1!4775 (_ BitVec 64)) (_2!4775 V!24205)) )
))
(declare-datatypes ((List!15357 0))(
  ( (Nil!15354) (Cons!15353 (h!16482 tuple2!9528) (t!21680 List!15357)) )
))
(declare-datatypes ((ListLongMap!8351 0))(
  ( (ListLongMap!8352 (toList!4191 List!15357)) )
))
(declare-fun lt!365980 () ListLongMap!8351)

(declare-fun lt!365979 () ListLongMap!8351)

(assert (=> b!816952 (= lt!365980 lt!365979)))

(declare-fun zeroValueBefore!34 () V!24205)

(declare-fun zeroValueAfter!34 () V!24205)

(declare-fun minValue!754 () V!24205)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27864 0))(
  ( (Unit!27865) )
))
(declare-fun lt!365978 () Unit!27864)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!342 (array!45004 array!45006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24205 V!24205 V!24205 V!24205 (_ BitVec 32) Int) Unit!27864)

(assert (=> b!816952 (= lt!365978 (lemmaNoChangeToArrayThenSameMapNoExtras!342 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2232 (array!45004 array!45006 (_ BitVec 32) (_ BitVec 32) V!24205 V!24205 (_ BitVec 32) Int) ListLongMap!8351)

(assert (=> b!816952 (= lt!365979 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816952 (= lt!365980 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816953 () Bool)

(declare-fun res!557726 () Bool)

(assert (=> b!816953 (=> (not res!557726) (not e!453258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45004 (_ BitVec 32)) Bool)

(assert (=> b!816953 (= res!557726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!557725 () Bool)

(assert (=> start!70318 (=> (not res!557725) (not e!453258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70318 (= res!557725 (validMask!0 mask!1312))))

(assert (=> start!70318 e!453258))

(declare-fun tp_is_empty!14403 () Bool)

(assert (=> start!70318 tp_is_empty!14403))

(declare-fun array_inv!17249 (array!45004) Bool)

(assert (=> start!70318 (array_inv!17249 _keys!976)))

(assert (=> start!70318 true))

(declare-fun array_inv!17250 (array!45006) Bool)

(assert (=> start!70318 (and (array_inv!17250 _values!788) e!453260)))

(assert (=> start!70318 tp!44802))

(declare-fun b!816954 () Bool)

(assert (=> b!816954 (= e!453257 tp_is_empty!14403)))

(declare-fun b!816955 () Bool)

(assert (=> b!816955 (= e!453259 tp_is_empty!14403)))

(declare-fun mapIsEmpty!23194 () Bool)

(assert (=> mapIsEmpty!23194 mapRes!23194))

(declare-fun b!816956 () Bool)

(declare-fun res!557722 () Bool)

(assert (=> b!816956 (=> res!557722 e!453261)))

(declare-fun +!1820 (ListLongMap!8351 tuple2!9528) ListLongMap!8351)

(declare-fun getCurrentListMap!2414 (array!45004 array!45006 (_ BitVec 32) (_ BitVec 32) V!24205 V!24205 (_ BitVec 32) Int) ListLongMap!8351)

(assert (=> b!816956 (= res!557722 (not (= (+!1820 (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))))

(assert (= (and start!70318 res!557725) b!816949))

(assert (= (and b!816949 res!557723) b!816953))

(assert (= (and b!816953 res!557726) b!816948))

(assert (= (and b!816948 res!557724) b!816952))

(assert (= (and b!816952 (not res!557727)) b!816956))

(assert (= (and b!816956 (not res!557722)) b!816951))

(assert (= (and b!816950 condMapEmpty!23194) mapIsEmpty!23194))

(assert (= (and b!816950 (not condMapEmpty!23194)) mapNonEmpty!23194))

(get-info :version)

(assert (= (and mapNonEmpty!23194 ((_ is ValueCellFull!6786) mapValue!23194)) b!816955))

(assert (= (and b!816950 ((_ is ValueCellFull!6786) mapDefault!23194)) b!816954))

(assert (= start!70318 b!816950))

(declare-fun m!758575 () Bool)

(assert (=> mapNonEmpty!23194 m!758575))

(declare-fun m!758577 () Bool)

(assert (=> b!816953 m!758577))

(declare-fun m!758579 () Bool)

(assert (=> start!70318 m!758579))

(declare-fun m!758581 () Bool)

(assert (=> start!70318 m!758581))

(declare-fun m!758583 () Bool)

(assert (=> start!70318 m!758583))

(declare-fun m!758585 () Bool)

(assert (=> b!816956 m!758585))

(assert (=> b!816956 m!758585))

(declare-fun m!758587 () Bool)

(assert (=> b!816956 m!758587))

(declare-fun m!758589 () Bool)

(assert (=> b!816956 m!758589))

(declare-fun m!758591 () Bool)

(assert (=> b!816952 m!758591))

(declare-fun m!758593 () Bool)

(assert (=> b!816952 m!758593))

(declare-fun m!758595 () Bool)

(assert (=> b!816952 m!758595))

(declare-fun m!758597 () Bool)

(assert (=> b!816948 m!758597))

(check-sat (not b!816956) (not b_next!12693) (not mapNonEmpty!23194) (not start!70318) (not b!816948) (not b!816953) tp_is_empty!14403 b_and!21493 (not b!816952))
(check-sat b_and!21493 (not b_next!12693))
(get-model)

(declare-fun d!104543 () Bool)

(declare-fun e!453283 () Bool)

(assert (=> d!104543 e!453283))

(declare-fun res!557751 () Bool)

(assert (=> d!104543 (=> (not res!557751) (not e!453283))))

(declare-fun lt!366001 () ListLongMap!8351)

(declare-fun contains!4152 (ListLongMap!8351 (_ BitVec 64)) Bool)

(assert (=> d!104543 (= res!557751 (contains!4152 lt!366001 (_1!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!365999 () List!15357)

(assert (=> d!104543 (= lt!366001 (ListLongMap!8352 lt!365999))))

(declare-fun lt!365998 () Unit!27864)

(declare-fun lt!366000 () Unit!27864)

(assert (=> d!104543 (= lt!365998 lt!366000)))

(declare-datatypes ((Option!407 0))(
  ( (Some!406 (v!9679 V!24205)) (None!405) )
))
(declare-fun getValueByKey!401 (List!15357 (_ BitVec 64)) Option!407)

(assert (=> d!104543 (= (getValueByKey!401 lt!365999 (_1!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!406 (_2!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!215 (List!15357 (_ BitVec 64) V!24205) Unit!27864)

(assert (=> d!104543 (= lt!366000 (lemmaContainsTupThenGetReturnValue!215 lt!365999 (_1!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!254 (List!15357 (_ BitVec 64) V!24205) List!15357)

(assert (=> d!104543 (= lt!365999 (insertStrictlySorted!254 (toList!4191 (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104543 (= (+!1820 (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!366001)))

(declare-fun b!816988 () Bool)

(declare-fun res!557750 () Bool)

(assert (=> b!816988 (=> (not res!557750) (not e!453283))))

(assert (=> b!816988 (= res!557750 (= (getValueByKey!401 (toList!4191 lt!366001) (_1!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!406 (_2!4775 (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!816989 () Bool)

(declare-fun contains!4153 (List!15357 tuple2!9528) Bool)

(assert (=> b!816989 (= e!453283 (contains!4153 (toList!4191 lt!366001) (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104543 res!557751) b!816988))

(assert (= (and b!816988 res!557750) b!816989))

(declare-fun m!758623 () Bool)

(assert (=> d!104543 m!758623))

(declare-fun m!758625 () Bool)

(assert (=> d!104543 m!758625))

(declare-fun m!758627 () Bool)

(assert (=> d!104543 m!758627))

(declare-fun m!758629 () Bool)

(assert (=> d!104543 m!758629))

(declare-fun m!758631 () Bool)

(assert (=> b!816988 m!758631))

(declare-fun m!758633 () Bool)

(assert (=> b!816989 m!758633))

(assert (=> b!816956 d!104543))

(declare-fun bm!35569 () Bool)

(declare-fun call!35577 () ListLongMap!8351)

(assert (=> bm!35569 (= call!35577 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366056 () ListLongMap!8351)

(declare-fun b!817033 () Bool)

(declare-fun e!453321 () Bool)

(declare-fun apply!351 (ListLongMap!8351 (_ BitVec 64)) V!24205)

(declare-fun get!11528 (ValueCell!6786 V!24205) V!24205)

(declare-fun dynLambda!962 (Int (_ BitVec 64)) V!24205)

(assert (=> b!817033 (= e!453321 (= (apply!351 lt!366056 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)) (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!817033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21981 _values!788)))))

(assert (=> b!817033 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817034 () Bool)

(declare-fun e!453313 () Bool)

(assert (=> b!817034 (= e!453313 e!453321)))

(declare-fun res!557772 () Bool)

(assert (=> b!817034 (=> (not res!557772) (not e!453321))))

(assert (=> b!817034 (= res!557772 (contains!4152 lt!366056 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817034 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817035 () Bool)

(declare-fun e!453322 () Bool)

(declare-fun e!453315 () Bool)

(assert (=> b!817035 (= e!453322 e!453315)))

(declare-fun res!557774 () Bool)

(declare-fun call!35573 () Bool)

(assert (=> b!817035 (= res!557774 call!35573)))

(assert (=> b!817035 (=> (not res!557774) (not e!453315))))

(declare-fun b!817036 () Bool)

(declare-fun e!453319 () ListLongMap!8351)

(declare-fun call!35576 () ListLongMap!8351)

(assert (=> b!817036 (= e!453319 call!35576)))

(declare-fun b!817037 () Bool)

(declare-fun e!453311 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!817037 (= e!453311 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35570 () Bool)

(declare-fun call!35572 () ListLongMap!8351)

(declare-fun c!89029 () Bool)

(declare-fun call!35574 () ListLongMap!8351)

(declare-fun c!89028 () Bool)

(assert (=> bm!35570 (= call!35574 (+!1820 (ite c!89029 call!35577 (ite c!89028 call!35572 call!35576)) (ite (or c!89029 c!89028) (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!817038 () Bool)

(declare-fun call!35575 () ListLongMap!8351)

(assert (=> b!817038 (= e!453319 call!35575)))

(declare-fun b!817039 () Bool)

(declare-fun res!557775 () Bool)

(declare-fun e!453317 () Bool)

(assert (=> b!817039 (=> (not res!557775) (not e!453317))))

(assert (=> b!817039 (= res!557775 e!453313)))

(declare-fun res!557771 () Bool)

(assert (=> b!817039 (=> res!557771 e!453313)))

(declare-fun e!453312 () Bool)

(assert (=> b!817039 (= res!557771 (not e!453312))))

(declare-fun res!557770 () Bool)

(assert (=> b!817039 (=> (not res!557770) (not e!453312))))

(assert (=> b!817039 (= res!557770 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817040 () Bool)

(declare-fun e!453318 () ListLongMap!8351)

(assert (=> b!817040 (= e!453318 (+!1820 call!35574 (tuple2!9529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!817041 () Bool)

(assert (=> b!817041 (= e!453315 (= (apply!351 lt!366056 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!817042 () Bool)

(declare-fun c!89027 () Bool)

(assert (=> b!817042 (= c!89027 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!453314 () ListLongMap!8351)

(assert (=> b!817042 (= e!453314 e!453319)))

(declare-fun bm!35571 () Bool)

(assert (=> bm!35571 (= call!35572 call!35577)))

(declare-fun b!817043 () Bool)

(assert (=> b!817043 (= e!453312 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817032 () Bool)

(declare-fun res!557776 () Bool)

(assert (=> b!817032 (=> (not res!557776) (not e!453317))))

(assert (=> b!817032 (= res!557776 e!453322)))

(declare-fun c!89030 () Bool)

(assert (=> b!817032 (= c!89030 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!104545 () Bool)

(assert (=> d!104545 e!453317))

(declare-fun res!557777 () Bool)

(assert (=> d!104545 (=> (not res!557777) (not e!453317))))

(assert (=> d!104545 (= res!557777 (or (bvsge #b00000000000000000000000000000000 (size!21980 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))))

(declare-fun lt!366063 () ListLongMap!8351)

(assert (=> d!104545 (= lt!366056 lt!366063)))

(declare-fun lt!366055 () Unit!27864)

(declare-fun e!453320 () Unit!27864)

(assert (=> d!104545 (= lt!366055 e!453320)))

(declare-fun c!89032 () Bool)

(assert (=> d!104545 (= c!89032 e!453311)))

(declare-fun res!557773 () Bool)

(assert (=> d!104545 (=> (not res!557773) (not e!453311))))

(assert (=> d!104545 (= res!557773 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> d!104545 (= lt!366063 e!453318)))

(assert (=> d!104545 (= c!89029 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104545 (validMask!0 mask!1312)))

(assert (=> d!104545 (= (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366056)))

(declare-fun b!817044 () Bool)

(declare-fun e!453310 () Bool)

(assert (=> b!817044 (= e!453310 (= (apply!351 lt!366056 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!817045 () Bool)

(declare-fun Unit!27868 () Unit!27864)

(assert (=> b!817045 (= e!453320 Unit!27868)))

(declare-fun bm!35572 () Bool)

(declare-fun call!35578 () Bool)

(assert (=> bm!35572 (= call!35578 (contains!4152 lt!366056 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817046 () Bool)

(declare-fun e!453316 () Bool)

(assert (=> b!817046 (= e!453316 (not call!35578))))

(declare-fun b!817047 () Bool)

(assert (=> b!817047 (= e!453314 call!35575)))

(declare-fun bm!35573 () Bool)

(assert (=> bm!35573 (= call!35576 call!35572)))

(declare-fun b!817048 () Bool)

(assert (=> b!817048 (= e!453316 e!453310)))

(declare-fun res!557778 () Bool)

(assert (=> b!817048 (= res!557778 call!35578)))

(assert (=> b!817048 (=> (not res!557778) (not e!453310))))

(declare-fun b!817049 () Bool)

(assert (=> b!817049 (= e!453318 e!453314)))

(assert (=> b!817049 (= c!89028 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35574 () Bool)

(assert (=> bm!35574 (= call!35573 (contains!4152 lt!366056 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817050 () Bool)

(assert (=> b!817050 (= e!453322 (not call!35573))))

(declare-fun b!817051 () Bool)

(declare-fun lt!366067 () Unit!27864)

(assert (=> b!817051 (= e!453320 lt!366067)))

(declare-fun lt!366054 () ListLongMap!8351)

(assert (=> b!817051 (= lt!366054 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366046 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366046 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366052 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366052 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366066 () Unit!27864)

(declare-fun addStillContains!306 (ListLongMap!8351 (_ BitVec 64) V!24205 (_ BitVec 64)) Unit!27864)

(assert (=> b!817051 (= lt!366066 (addStillContains!306 lt!366054 lt!366046 zeroValueBefore!34 lt!366052))))

(assert (=> b!817051 (contains!4152 (+!1820 lt!366054 (tuple2!9529 lt!366046 zeroValueBefore!34)) lt!366052)))

(declare-fun lt!366060 () Unit!27864)

(assert (=> b!817051 (= lt!366060 lt!366066)))

(declare-fun lt!366051 () ListLongMap!8351)

(assert (=> b!817051 (= lt!366051 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366053 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366053 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366050 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366050 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366059 () Unit!27864)

(declare-fun addApplyDifferent!306 (ListLongMap!8351 (_ BitVec 64) V!24205 (_ BitVec 64)) Unit!27864)

(assert (=> b!817051 (= lt!366059 (addApplyDifferent!306 lt!366051 lt!366053 minValue!754 lt!366050))))

(assert (=> b!817051 (= (apply!351 (+!1820 lt!366051 (tuple2!9529 lt!366053 minValue!754)) lt!366050) (apply!351 lt!366051 lt!366050))))

(declare-fun lt!366049 () Unit!27864)

(assert (=> b!817051 (= lt!366049 lt!366059)))

(declare-fun lt!366048 () ListLongMap!8351)

(assert (=> b!817051 (= lt!366048 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366047 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366047 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366061 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366061 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366062 () Unit!27864)

(assert (=> b!817051 (= lt!366062 (addApplyDifferent!306 lt!366048 lt!366047 zeroValueBefore!34 lt!366061))))

(assert (=> b!817051 (= (apply!351 (+!1820 lt!366048 (tuple2!9529 lt!366047 zeroValueBefore!34)) lt!366061) (apply!351 lt!366048 lt!366061))))

(declare-fun lt!366064 () Unit!27864)

(assert (=> b!817051 (= lt!366064 lt!366062)))

(declare-fun lt!366057 () ListLongMap!8351)

(assert (=> b!817051 (= lt!366057 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366065 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366065 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366058 () (_ BitVec 64))

(assert (=> b!817051 (= lt!366058 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817051 (= lt!366067 (addApplyDifferent!306 lt!366057 lt!366065 minValue!754 lt!366058))))

(assert (=> b!817051 (= (apply!351 (+!1820 lt!366057 (tuple2!9529 lt!366065 minValue!754)) lt!366058) (apply!351 lt!366057 lt!366058))))

(declare-fun bm!35575 () Bool)

(assert (=> bm!35575 (= call!35575 call!35574)))

(declare-fun b!817052 () Bool)

(assert (=> b!817052 (= e!453317 e!453316)))

(declare-fun c!89031 () Bool)

(assert (=> b!817052 (= c!89031 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104545 c!89029) b!817040))

(assert (= (and d!104545 (not c!89029)) b!817049))

(assert (= (and b!817049 c!89028) b!817047))

(assert (= (and b!817049 (not c!89028)) b!817042))

(assert (= (and b!817042 c!89027) b!817038))

(assert (= (and b!817042 (not c!89027)) b!817036))

(assert (= (or b!817038 b!817036) bm!35573))

(assert (= (or b!817047 bm!35573) bm!35571))

(assert (= (or b!817047 b!817038) bm!35575))

(assert (= (or b!817040 bm!35571) bm!35569))

(assert (= (or b!817040 bm!35575) bm!35570))

(assert (= (and d!104545 res!557773) b!817037))

(assert (= (and d!104545 c!89032) b!817051))

(assert (= (and d!104545 (not c!89032)) b!817045))

(assert (= (and d!104545 res!557777) b!817039))

(assert (= (and b!817039 res!557770) b!817043))

(assert (= (and b!817039 (not res!557771)) b!817034))

(assert (= (and b!817034 res!557772) b!817033))

(assert (= (and b!817039 res!557775) b!817032))

(assert (= (and b!817032 c!89030) b!817035))

(assert (= (and b!817032 (not c!89030)) b!817050))

(assert (= (and b!817035 res!557774) b!817041))

(assert (= (or b!817035 b!817050) bm!35574))

(assert (= (and b!817032 res!557776) b!817052))

(assert (= (and b!817052 c!89031) b!817048))

(assert (= (and b!817052 (not c!89031)) b!817046))

(assert (= (and b!817048 res!557778) b!817044))

(assert (= (or b!817048 b!817046) bm!35572))

(declare-fun b_lambda!10887 () Bool)

(assert (=> (not b_lambda!10887) (not b!817033)))

(declare-fun t!21684 () Bool)

(declare-fun tb!4183 () Bool)

(assert (=> (and start!70318 (= defaultEntry!796 defaultEntry!796) t!21684) tb!4183))

(declare-fun result!7889 () Bool)

(assert (=> tb!4183 (= result!7889 tp_is_empty!14403)))

(assert (=> b!817033 t!21684))

(declare-fun b_and!21497 () Bool)

(assert (= b_and!21493 (and (=> t!21684 result!7889) b_and!21497)))

(declare-fun m!758635 () Bool)

(assert (=> b!817037 m!758635))

(assert (=> b!817037 m!758635))

(declare-fun m!758637 () Bool)

(assert (=> b!817037 m!758637))

(assert (=> d!104545 m!758579))

(declare-fun m!758639 () Bool)

(assert (=> bm!35574 m!758639))

(declare-fun m!758641 () Bool)

(assert (=> b!817051 m!758641))

(declare-fun m!758643 () Bool)

(assert (=> b!817051 m!758643))

(declare-fun m!758645 () Bool)

(assert (=> b!817051 m!758645))

(declare-fun m!758647 () Bool)

(assert (=> b!817051 m!758647))

(assert (=> b!817051 m!758645))

(declare-fun m!758649 () Bool)

(assert (=> b!817051 m!758649))

(declare-fun m!758651 () Bool)

(assert (=> b!817051 m!758651))

(declare-fun m!758653 () Bool)

(assert (=> b!817051 m!758653))

(assert (=> b!817051 m!758595))

(declare-fun m!758655 () Bool)

(assert (=> b!817051 m!758655))

(declare-fun m!758657 () Bool)

(assert (=> b!817051 m!758657))

(declare-fun m!758659 () Bool)

(assert (=> b!817051 m!758659))

(declare-fun m!758661 () Bool)

(assert (=> b!817051 m!758661))

(declare-fun m!758663 () Bool)

(assert (=> b!817051 m!758663))

(assert (=> b!817051 m!758635))

(assert (=> b!817051 m!758651))

(assert (=> b!817051 m!758641))

(declare-fun m!758665 () Bool)

(assert (=> b!817051 m!758665))

(declare-fun m!758667 () Bool)

(assert (=> b!817051 m!758667))

(declare-fun m!758669 () Bool)

(assert (=> b!817051 m!758669))

(assert (=> b!817051 m!758661))

(assert (=> b!817043 m!758635))

(assert (=> b!817043 m!758635))

(assert (=> b!817043 m!758637))

(declare-fun m!758671 () Bool)

(assert (=> bm!35570 m!758671))

(assert (=> b!817034 m!758635))

(assert (=> b!817034 m!758635))

(declare-fun m!758673 () Bool)

(assert (=> b!817034 m!758673))

(declare-fun m!758675 () Bool)

(assert (=> b!817044 m!758675))

(declare-fun m!758677 () Bool)

(assert (=> b!817041 m!758677))

(declare-fun m!758679 () Bool)

(assert (=> b!817040 m!758679))

(assert (=> bm!35569 m!758595))

(declare-fun m!758681 () Bool)

(assert (=> bm!35572 m!758681))

(assert (=> b!817033 m!758635))

(assert (=> b!817033 m!758635))

(declare-fun m!758683 () Bool)

(assert (=> b!817033 m!758683))

(declare-fun m!758685 () Bool)

(assert (=> b!817033 m!758685))

(declare-fun m!758687 () Bool)

(assert (=> b!817033 m!758687))

(assert (=> b!817033 m!758685))

(declare-fun m!758689 () Bool)

(assert (=> b!817033 m!758689))

(assert (=> b!817033 m!758687))

(assert (=> b!816956 d!104545))

(declare-fun bm!35576 () Bool)

(declare-fun call!35584 () ListLongMap!8351)

(assert (=> bm!35576 (= call!35584 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366078 () ListLongMap!8351)

(declare-fun e!453334 () Bool)

(declare-fun b!817056 () Bool)

(assert (=> b!817056 (= e!453334 (= (apply!351 lt!366078 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)) (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!817056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21981 _values!788)))))

(assert (=> b!817056 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817057 () Bool)

(declare-fun e!453326 () Bool)

(assert (=> b!817057 (= e!453326 e!453334)))

(declare-fun res!557781 () Bool)

(assert (=> b!817057 (=> (not res!557781) (not e!453334))))

(assert (=> b!817057 (= res!557781 (contains!4152 lt!366078 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817058 () Bool)

(declare-fun e!453335 () Bool)

(declare-fun e!453328 () Bool)

(assert (=> b!817058 (= e!453335 e!453328)))

(declare-fun res!557783 () Bool)

(declare-fun call!35580 () Bool)

(assert (=> b!817058 (= res!557783 call!35580)))

(assert (=> b!817058 (=> (not res!557783) (not e!453328))))

(declare-fun b!817059 () Bool)

(declare-fun e!453332 () ListLongMap!8351)

(declare-fun call!35583 () ListLongMap!8351)

(assert (=> b!817059 (= e!453332 call!35583)))

(declare-fun b!817060 () Bool)

(declare-fun e!453324 () Bool)

(assert (=> b!817060 (= e!453324 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35577 () Bool)

(declare-fun call!35581 () ListLongMap!8351)

(declare-fun c!89034 () Bool)

(declare-fun c!89035 () Bool)

(declare-fun call!35579 () ListLongMap!8351)

(assert (=> bm!35577 (= call!35581 (+!1820 (ite c!89035 call!35584 (ite c!89034 call!35579 call!35583)) (ite (or c!89035 c!89034) (tuple2!9529 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!817061 () Bool)

(declare-fun call!35582 () ListLongMap!8351)

(assert (=> b!817061 (= e!453332 call!35582)))

(declare-fun b!817062 () Bool)

(declare-fun res!557784 () Bool)

(declare-fun e!453330 () Bool)

(assert (=> b!817062 (=> (not res!557784) (not e!453330))))

(assert (=> b!817062 (= res!557784 e!453326)))

(declare-fun res!557780 () Bool)

(assert (=> b!817062 (=> res!557780 e!453326)))

(declare-fun e!453325 () Bool)

(assert (=> b!817062 (= res!557780 (not e!453325))))

(declare-fun res!557779 () Bool)

(assert (=> b!817062 (=> (not res!557779) (not e!453325))))

(assert (=> b!817062 (= res!557779 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817063 () Bool)

(declare-fun e!453331 () ListLongMap!8351)

(assert (=> b!817063 (= e!453331 (+!1820 call!35581 (tuple2!9529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!817064 () Bool)

(assert (=> b!817064 (= e!453328 (= (apply!351 lt!366078 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!817065 () Bool)

(declare-fun c!89033 () Bool)

(assert (=> b!817065 (= c!89033 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!453327 () ListLongMap!8351)

(assert (=> b!817065 (= e!453327 e!453332)))

(declare-fun bm!35578 () Bool)

(assert (=> bm!35578 (= call!35579 call!35584)))

(declare-fun b!817066 () Bool)

(assert (=> b!817066 (= e!453325 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817055 () Bool)

(declare-fun res!557785 () Bool)

(assert (=> b!817055 (=> (not res!557785) (not e!453330))))

(assert (=> b!817055 (= res!557785 e!453335)))

(declare-fun c!89036 () Bool)

(assert (=> b!817055 (= c!89036 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!104547 () Bool)

(assert (=> d!104547 e!453330))

(declare-fun res!557786 () Bool)

(assert (=> d!104547 (=> (not res!557786) (not e!453330))))

(assert (=> d!104547 (= res!557786 (or (bvsge #b00000000000000000000000000000000 (size!21980 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))))

(declare-fun lt!366085 () ListLongMap!8351)

(assert (=> d!104547 (= lt!366078 lt!366085)))

(declare-fun lt!366077 () Unit!27864)

(declare-fun e!453333 () Unit!27864)

(assert (=> d!104547 (= lt!366077 e!453333)))

(declare-fun c!89038 () Bool)

(assert (=> d!104547 (= c!89038 e!453324)))

(declare-fun res!557782 () Bool)

(assert (=> d!104547 (=> (not res!557782) (not e!453324))))

(assert (=> d!104547 (= res!557782 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> d!104547 (= lt!366085 e!453331)))

(assert (=> d!104547 (= c!89035 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104547 (validMask!0 mask!1312)))

(assert (=> d!104547 (= (getCurrentListMap!2414 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366078)))

(declare-fun b!817067 () Bool)

(declare-fun e!453323 () Bool)

(assert (=> b!817067 (= e!453323 (= (apply!351 lt!366078 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!817068 () Bool)

(declare-fun Unit!27869 () Unit!27864)

(assert (=> b!817068 (= e!453333 Unit!27869)))

(declare-fun bm!35579 () Bool)

(declare-fun call!35585 () Bool)

(assert (=> bm!35579 (= call!35585 (contains!4152 lt!366078 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817069 () Bool)

(declare-fun e!453329 () Bool)

(assert (=> b!817069 (= e!453329 (not call!35585))))

(declare-fun b!817070 () Bool)

(assert (=> b!817070 (= e!453327 call!35582)))

(declare-fun bm!35580 () Bool)

(assert (=> bm!35580 (= call!35583 call!35579)))

(declare-fun b!817071 () Bool)

(assert (=> b!817071 (= e!453329 e!453323)))

(declare-fun res!557787 () Bool)

(assert (=> b!817071 (= res!557787 call!35585)))

(assert (=> b!817071 (=> (not res!557787) (not e!453323))))

(declare-fun b!817072 () Bool)

(assert (=> b!817072 (= e!453331 e!453327)))

(assert (=> b!817072 (= c!89034 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35581 () Bool)

(assert (=> bm!35581 (= call!35580 (contains!4152 lt!366078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!817073 () Bool)

(assert (=> b!817073 (= e!453335 (not call!35580))))

(declare-fun b!817074 () Bool)

(declare-fun lt!366089 () Unit!27864)

(assert (=> b!817074 (= e!453333 lt!366089)))

(declare-fun lt!366076 () ListLongMap!8351)

(assert (=> b!817074 (= lt!366076 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366068 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366068 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366074 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366074 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366088 () Unit!27864)

(assert (=> b!817074 (= lt!366088 (addStillContains!306 lt!366076 lt!366068 zeroValueAfter!34 lt!366074))))

(assert (=> b!817074 (contains!4152 (+!1820 lt!366076 (tuple2!9529 lt!366068 zeroValueAfter!34)) lt!366074)))

(declare-fun lt!366082 () Unit!27864)

(assert (=> b!817074 (= lt!366082 lt!366088)))

(declare-fun lt!366073 () ListLongMap!8351)

(assert (=> b!817074 (= lt!366073 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366075 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366075 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366072 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366072 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366081 () Unit!27864)

(assert (=> b!817074 (= lt!366081 (addApplyDifferent!306 lt!366073 lt!366075 minValue!754 lt!366072))))

(assert (=> b!817074 (= (apply!351 (+!1820 lt!366073 (tuple2!9529 lt!366075 minValue!754)) lt!366072) (apply!351 lt!366073 lt!366072))))

(declare-fun lt!366071 () Unit!27864)

(assert (=> b!817074 (= lt!366071 lt!366081)))

(declare-fun lt!366070 () ListLongMap!8351)

(assert (=> b!817074 (= lt!366070 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366069 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366069 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366083 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366083 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366084 () Unit!27864)

(assert (=> b!817074 (= lt!366084 (addApplyDifferent!306 lt!366070 lt!366069 zeroValueAfter!34 lt!366083))))

(assert (=> b!817074 (= (apply!351 (+!1820 lt!366070 (tuple2!9529 lt!366069 zeroValueAfter!34)) lt!366083) (apply!351 lt!366070 lt!366083))))

(declare-fun lt!366086 () Unit!27864)

(assert (=> b!817074 (= lt!366086 lt!366084)))

(declare-fun lt!366079 () ListLongMap!8351)

(assert (=> b!817074 (= lt!366079 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366087 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366087 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!366080 () (_ BitVec 64))

(assert (=> b!817074 (= lt!366080 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!817074 (= lt!366089 (addApplyDifferent!306 lt!366079 lt!366087 minValue!754 lt!366080))))

(assert (=> b!817074 (= (apply!351 (+!1820 lt!366079 (tuple2!9529 lt!366087 minValue!754)) lt!366080) (apply!351 lt!366079 lt!366080))))

(declare-fun bm!35582 () Bool)

(assert (=> bm!35582 (= call!35582 call!35581)))

(declare-fun b!817075 () Bool)

(assert (=> b!817075 (= e!453330 e!453329)))

(declare-fun c!89037 () Bool)

(assert (=> b!817075 (= c!89037 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!104547 c!89035) b!817063))

(assert (= (and d!104547 (not c!89035)) b!817072))

(assert (= (and b!817072 c!89034) b!817070))

(assert (= (and b!817072 (not c!89034)) b!817065))

(assert (= (and b!817065 c!89033) b!817061))

(assert (= (and b!817065 (not c!89033)) b!817059))

(assert (= (or b!817061 b!817059) bm!35580))

(assert (= (or b!817070 bm!35580) bm!35578))

(assert (= (or b!817070 b!817061) bm!35582))

(assert (= (or b!817063 bm!35578) bm!35576))

(assert (= (or b!817063 bm!35582) bm!35577))

(assert (= (and d!104547 res!557782) b!817060))

(assert (= (and d!104547 c!89038) b!817074))

(assert (= (and d!104547 (not c!89038)) b!817068))

(assert (= (and d!104547 res!557786) b!817062))

(assert (= (and b!817062 res!557779) b!817066))

(assert (= (and b!817062 (not res!557780)) b!817057))

(assert (= (and b!817057 res!557781) b!817056))

(assert (= (and b!817062 res!557784) b!817055))

(assert (= (and b!817055 c!89036) b!817058))

(assert (= (and b!817055 (not c!89036)) b!817073))

(assert (= (and b!817058 res!557783) b!817064))

(assert (= (or b!817058 b!817073) bm!35581))

(assert (= (and b!817055 res!557785) b!817075))

(assert (= (and b!817075 c!89037) b!817071))

(assert (= (and b!817075 (not c!89037)) b!817069))

(assert (= (and b!817071 res!557787) b!817067))

(assert (= (or b!817071 b!817069) bm!35579))

(declare-fun b_lambda!10889 () Bool)

(assert (=> (not b_lambda!10889) (not b!817056)))

(assert (=> b!817056 t!21684))

(declare-fun b_and!21499 () Bool)

(assert (= b_and!21497 (and (=> t!21684 result!7889) b_and!21499)))

(assert (=> b!817060 m!758635))

(assert (=> b!817060 m!758635))

(assert (=> b!817060 m!758637))

(assert (=> d!104547 m!758579))

(declare-fun m!758691 () Bool)

(assert (=> bm!35581 m!758691))

(declare-fun m!758693 () Bool)

(assert (=> b!817074 m!758693))

(declare-fun m!758695 () Bool)

(assert (=> b!817074 m!758695))

(declare-fun m!758697 () Bool)

(assert (=> b!817074 m!758697))

(declare-fun m!758699 () Bool)

(assert (=> b!817074 m!758699))

(assert (=> b!817074 m!758697))

(declare-fun m!758701 () Bool)

(assert (=> b!817074 m!758701))

(declare-fun m!758703 () Bool)

(assert (=> b!817074 m!758703))

(declare-fun m!758705 () Bool)

(assert (=> b!817074 m!758705))

(assert (=> b!817074 m!758593))

(declare-fun m!758707 () Bool)

(assert (=> b!817074 m!758707))

(declare-fun m!758709 () Bool)

(assert (=> b!817074 m!758709))

(declare-fun m!758711 () Bool)

(assert (=> b!817074 m!758711))

(declare-fun m!758713 () Bool)

(assert (=> b!817074 m!758713))

(declare-fun m!758715 () Bool)

(assert (=> b!817074 m!758715))

(assert (=> b!817074 m!758635))

(assert (=> b!817074 m!758703))

(assert (=> b!817074 m!758693))

(declare-fun m!758717 () Bool)

(assert (=> b!817074 m!758717))

(declare-fun m!758719 () Bool)

(assert (=> b!817074 m!758719))

(declare-fun m!758721 () Bool)

(assert (=> b!817074 m!758721))

(assert (=> b!817074 m!758713))

(assert (=> b!817066 m!758635))

(assert (=> b!817066 m!758635))

(assert (=> b!817066 m!758637))

(declare-fun m!758723 () Bool)

(assert (=> bm!35577 m!758723))

(assert (=> b!817057 m!758635))

(assert (=> b!817057 m!758635))

(declare-fun m!758725 () Bool)

(assert (=> b!817057 m!758725))

(declare-fun m!758727 () Bool)

(assert (=> b!817067 m!758727))

(declare-fun m!758729 () Bool)

(assert (=> b!817064 m!758729))

(declare-fun m!758731 () Bool)

(assert (=> b!817063 m!758731))

(assert (=> bm!35576 m!758593))

(declare-fun m!758733 () Bool)

(assert (=> bm!35579 m!758733))

(assert (=> b!817056 m!758635))

(assert (=> b!817056 m!758635))

(declare-fun m!758735 () Bool)

(assert (=> b!817056 m!758735))

(assert (=> b!817056 m!758685))

(assert (=> b!817056 m!758687))

(assert (=> b!817056 m!758685))

(assert (=> b!817056 m!758689))

(assert (=> b!817056 m!758687))

(assert (=> b!816956 d!104547))

(declare-fun d!104549 () Bool)

(assert (=> d!104549 (= (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!366092 () Unit!27864)

(declare-fun choose!1390 (array!45004 array!45006 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24205 V!24205 V!24205 V!24205 (_ BitVec 32) Int) Unit!27864)

(assert (=> d!104549 (= lt!366092 (choose!1390 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104549 (validMask!0 mask!1312)))

(assert (=> d!104549 (= (lemmaNoChangeToArrayThenSameMapNoExtras!342 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366092)))

(declare-fun bs!22756 () Bool)

(assert (= bs!22756 d!104549))

(assert (=> bs!22756 m!758595))

(assert (=> bs!22756 m!758593))

(declare-fun m!758737 () Bool)

(assert (=> bs!22756 m!758737))

(assert (=> bs!22756 m!758579))

(assert (=> b!816952 d!104549))

(declare-fun e!453352 () Bool)

(declare-fun b!817100 () Bool)

(declare-fun lt!366109 () ListLongMap!8351)

(assert (=> b!817100 (= e!453352 (= lt!366109 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817101 () Bool)

(assert (=> b!817101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> b!817101 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21981 _values!788)))))

(declare-fun e!453356 () Bool)

(assert (=> b!817101 (= e!453356 (= (apply!351 lt!366109 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)) (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817102 () Bool)

(declare-fun e!453355 () Bool)

(assert (=> b!817102 (= e!453355 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817102 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!817103 () Bool)

(declare-fun isEmpty!633 (ListLongMap!8351) Bool)

(assert (=> b!817103 (= e!453352 (isEmpty!633 lt!366109))))

(declare-fun b!817104 () Bool)

(declare-fun lt!366111 () Unit!27864)

(declare-fun lt!366113 () Unit!27864)

(assert (=> b!817104 (= lt!366111 lt!366113)))

(declare-fun lt!366112 () ListLongMap!8351)

(declare-fun lt!366110 () V!24205)

(declare-fun lt!366108 () (_ BitVec 64))

(declare-fun lt!366107 () (_ BitVec 64))

(assert (=> b!817104 (not (contains!4152 (+!1820 lt!366112 (tuple2!9529 lt!366108 lt!366110)) lt!366107))))

(declare-fun addStillNotContains!176 (ListLongMap!8351 (_ BitVec 64) V!24205 (_ BitVec 64)) Unit!27864)

(assert (=> b!817104 (= lt!366113 (addStillNotContains!176 lt!366112 lt!366108 lt!366110 lt!366107))))

(assert (=> b!817104 (= lt!366107 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817104 (= lt!366110 (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817104 (= lt!366108 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35588 () ListLongMap!8351)

(assert (=> b!817104 (= lt!366112 call!35588)))

(declare-fun e!453353 () ListLongMap!8351)

(assert (=> b!817104 (= e!453353 (+!1820 call!35588 (tuple2!9529 (select (arr!21559 _keys!976) #b00000000000000000000000000000000) (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!817105 () Bool)

(declare-fun e!453354 () ListLongMap!8351)

(assert (=> b!817105 (= e!453354 (ListLongMap!8352 Nil!15354))))

(declare-fun d!104551 () Bool)

(declare-fun e!453350 () Bool)

(assert (=> d!104551 e!453350))

(declare-fun res!557797 () Bool)

(assert (=> d!104551 (=> (not res!557797) (not e!453350))))

(assert (=> d!104551 (= res!557797 (not (contains!4152 lt!366109 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104551 (= lt!366109 e!453354)))

(declare-fun c!89049 () Bool)

(assert (=> d!104551 (= c!89049 (bvsge #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> d!104551 (validMask!0 mask!1312)))

(assert (=> d!104551 (= (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366109)))

(declare-fun b!817106 () Bool)

(assert (=> b!817106 (= e!453354 e!453353)))

(declare-fun c!89047 () Bool)

(assert (=> b!817106 (= c!89047 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817107 () Bool)

(declare-fun e!453351 () Bool)

(assert (=> b!817107 (= e!453351 e!453352)))

(declare-fun c!89048 () Bool)

(assert (=> b!817107 (= c!89048 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817108 () Bool)

(assert (=> b!817108 (= e!453350 e!453351)))

(declare-fun c!89050 () Bool)

(assert (=> b!817108 (= c!89050 e!453355)))

(declare-fun res!557799 () Bool)

(assert (=> b!817108 (=> (not res!557799) (not e!453355))))

(assert (=> b!817108 (= res!557799 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun bm!35585 () Bool)

(assert (=> bm!35585 (= call!35588 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817109 () Bool)

(assert (=> b!817109 (= e!453351 e!453356)))

(assert (=> b!817109 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun res!557796 () Bool)

(assert (=> b!817109 (= res!557796 (contains!4152 lt!366109 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817109 (=> (not res!557796) (not e!453356))))

(declare-fun b!817110 () Bool)

(assert (=> b!817110 (= e!453353 call!35588)))

(declare-fun b!817111 () Bool)

(declare-fun res!557798 () Bool)

(assert (=> b!817111 (=> (not res!557798) (not e!453350))))

(assert (=> b!817111 (= res!557798 (not (contains!4152 lt!366109 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!104551 c!89049) b!817105))

(assert (= (and d!104551 (not c!89049)) b!817106))

(assert (= (and b!817106 c!89047) b!817104))

(assert (= (and b!817106 (not c!89047)) b!817110))

(assert (= (or b!817104 b!817110) bm!35585))

(assert (= (and d!104551 res!557797) b!817111))

(assert (= (and b!817111 res!557798) b!817108))

(assert (= (and b!817108 res!557799) b!817102))

(assert (= (and b!817108 c!89050) b!817109))

(assert (= (and b!817108 (not c!89050)) b!817107))

(assert (= (and b!817109 res!557796) b!817101))

(assert (= (and b!817107 c!89048) b!817100))

(assert (= (and b!817107 (not c!89048)) b!817103))

(declare-fun b_lambda!10891 () Bool)

(assert (=> (not b_lambda!10891) (not b!817101)))

(assert (=> b!817101 t!21684))

(declare-fun b_and!21501 () Bool)

(assert (= b_and!21499 (and (=> t!21684 result!7889) b_and!21501)))

(declare-fun b_lambda!10893 () Bool)

(assert (=> (not b_lambda!10893) (not b!817104)))

(assert (=> b!817104 t!21684))

(declare-fun b_and!21503 () Bool)

(assert (= b_and!21501 (and (=> t!21684 result!7889) b_and!21503)))

(assert (=> b!817102 m!758635))

(assert (=> b!817102 m!758635))

(assert (=> b!817102 m!758637))

(declare-fun m!758739 () Bool)

(assert (=> b!817100 m!758739))

(declare-fun m!758741 () Bool)

(assert (=> b!817103 m!758741))

(assert (=> b!817109 m!758635))

(assert (=> b!817109 m!758635))

(declare-fun m!758743 () Bool)

(assert (=> b!817109 m!758743))

(assert (=> b!817106 m!758635))

(assert (=> b!817106 m!758635))

(assert (=> b!817106 m!758637))

(declare-fun m!758745 () Bool)

(assert (=> b!817111 m!758745))

(assert (=> bm!35585 m!758739))

(assert (=> b!817101 m!758685))

(assert (=> b!817101 m!758635))

(declare-fun m!758747 () Bool)

(assert (=> b!817101 m!758747))

(assert (=> b!817101 m!758687))

(assert (=> b!817101 m!758687))

(assert (=> b!817101 m!758685))

(assert (=> b!817101 m!758689))

(assert (=> b!817101 m!758635))

(assert (=> b!817104 m!758685))

(assert (=> b!817104 m!758687))

(declare-fun m!758749 () Bool)

(assert (=> b!817104 m!758749))

(declare-fun m!758751 () Bool)

(assert (=> b!817104 m!758751))

(declare-fun m!758753 () Bool)

(assert (=> b!817104 m!758753))

(declare-fun m!758755 () Bool)

(assert (=> b!817104 m!758755))

(assert (=> b!817104 m!758753))

(assert (=> b!817104 m!758687))

(assert (=> b!817104 m!758685))

(assert (=> b!817104 m!758689))

(assert (=> b!817104 m!758635))

(declare-fun m!758757 () Bool)

(assert (=> d!104551 m!758757))

(assert (=> d!104551 m!758579))

(assert (=> b!816952 d!104551))

(declare-fun lt!366116 () ListLongMap!8351)

(declare-fun b!817112 () Bool)

(declare-fun e!453359 () Bool)

(assert (=> b!817112 (= e!453359 (= lt!366116 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!817113 () Bool)

(assert (=> b!817113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> b!817113 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21981 _values!788)))))

(declare-fun e!453363 () Bool)

(assert (=> b!817113 (= e!453363 (= (apply!351 lt!366116 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)) (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!817114 () Bool)

(declare-fun e!453362 () Bool)

(assert (=> b!817114 (= e!453362 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817114 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!817115 () Bool)

(assert (=> b!817115 (= e!453359 (isEmpty!633 lt!366116))))

(declare-fun b!817116 () Bool)

(declare-fun lt!366118 () Unit!27864)

(declare-fun lt!366120 () Unit!27864)

(assert (=> b!817116 (= lt!366118 lt!366120)))

(declare-fun lt!366117 () V!24205)

(declare-fun lt!366115 () (_ BitVec 64))

(declare-fun lt!366119 () ListLongMap!8351)

(declare-fun lt!366114 () (_ BitVec 64))

(assert (=> b!817116 (not (contains!4152 (+!1820 lt!366119 (tuple2!9529 lt!366115 lt!366117)) lt!366114))))

(assert (=> b!817116 (= lt!366120 (addStillNotContains!176 lt!366119 lt!366115 lt!366117 lt!366114))))

(assert (=> b!817116 (= lt!366114 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!817116 (= lt!366117 (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!817116 (= lt!366115 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35589 () ListLongMap!8351)

(assert (=> b!817116 (= lt!366119 call!35589)))

(declare-fun e!453360 () ListLongMap!8351)

(assert (=> b!817116 (= e!453360 (+!1820 call!35589 (tuple2!9529 (select (arr!21559 _keys!976) #b00000000000000000000000000000000) (get!11528 (select (arr!21560 _values!788) #b00000000000000000000000000000000) (dynLambda!962 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!817117 () Bool)

(declare-fun e!453361 () ListLongMap!8351)

(assert (=> b!817117 (= e!453361 (ListLongMap!8352 Nil!15354))))

(declare-fun d!104553 () Bool)

(declare-fun e!453357 () Bool)

(assert (=> d!104553 e!453357))

(declare-fun res!557801 () Bool)

(assert (=> d!104553 (=> (not res!557801) (not e!453357))))

(assert (=> d!104553 (= res!557801 (not (contains!4152 lt!366116 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104553 (= lt!366116 e!453361)))

(declare-fun c!89053 () Bool)

(assert (=> d!104553 (= c!89053 (bvsge #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> d!104553 (validMask!0 mask!1312)))

(assert (=> d!104553 (= (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!366116)))

(declare-fun b!817118 () Bool)

(assert (=> b!817118 (= e!453361 e!453360)))

(declare-fun c!89051 () Bool)

(assert (=> b!817118 (= c!89051 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817119 () Bool)

(declare-fun e!453358 () Bool)

(assert (=> b!817119 (= e!453358 e!453359)))

(declare-fun c!89052 () Bool)

(assert (=> b!817119 (= c!89052 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun b!817120 () Bool)

(assert (=> b!817120 (= e!453357 e!453358)))

(declare-fun c!89054 () Bool)

(assert (=> b!817120 (= c!89054 e!453362)))

(declare-fun res!557803 () Bool)

(assert (=> b!817120 (=> (not res!557803) (not e!453362))))

(assert (=> b!817120 (= res!557803 (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun bm!35586 () Bool)

(assert (=> bm!35586 (= call!35589 (getCurrentListMapNoExtraKeys!2232 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!817121 () Bool)

(assert (=> b!817121 (= e!453358 e!453363)))

(assert (=> b!817121 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(declare-fun res!557800 () Bool)

(assert (=> b!817121 (= res!557800 (contains!4152 lt!366116 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!817121 (=> (not res!557800) (not e!453363))))

(declare-fun b!817122 () Bool)

(assert (=> b!817122 (= e!453360 call!35589)))

(declare-fun b!817123 () Bool)

(declare-fun res!557802 () Bool)

(assert (=> b!817123 (=> (not res!557802) (not e!453357))))

(assert (=> b!817123 (= res!557802 (not (contains!4152 lt!366116 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!104553 c!89053) b!817117))

(assert (= (and d!104553 (not c!89053)) b!817118))

(assert (= (and b!817118 c!89051) b!817116))

(assert (= (and b!817118 (not c!89051)) b!817122))

(assert (= (or b!817116 b!817122) bm!35586))

(assert (= (and d!104553 res!557801) b!817123))

(assert (= (and b!817123 res!557802) b!817120))

(assert (= (and b!817120 res!557803) b!817114))

(assert (= (and b!817120 c!89054) b!817121))

(assert (= (and b!817120 (not c!89054)) b!817119))

(assert (= (and b!817121 res!557800) b!817113))

(assert (= (and b!817119 c!89052) b!817112))

(assert (= (and b!817119 (not c!89052)) b!817115))

(declare-fun b_lambda!10895 () Bool)

(assert (=> (not b_lambda!10895) (not b!817113)))

(assert (=> b!817113 t!21684))

(declare-fun b_and!21505 () Bool)

(assert (= b_and!21503 (and (=> t!21684 result!7889) b_and!21505)))

(declare-fun b_lambda!10897 () Bool)

(assert (=> (not b_lambda!10897) (not b!817116)))

(assert (=> b!817116 t!21684))

(declare-fun b_and!21507 () Bool)

(assert (= b_and!21505 (and (=> t!21684 result!7889) b_and!21507)))

(assert (=> b!817114 m!758635))

(assert (=> b!817114 m!758635))

(assert (=> b!817114 m!758637))

(declare-fun m!758759 () Bool)

(assert (=> b!817112 m!758759))

(declare-fun m!758761 () Bool)

(assert (=> b!817115 m!758761))

(assert (=> b!817121 m!758635))

(assert (=> b!817121 m!758635))

(declare-fun m!758763 () Bool)

(assert (=> b!817121 m!758763))

(assert (=> b!817118 m!758635))

(assert (=> b!817118 m!758635))

(assert (=> b!817118 m!758637))

(declare-fun m!758765 () Bool)

(assert (=> b!817123 m!758765))

(assert (=> bm!35586 m!758759))

(assert (=> b!817113 m!758685))

(assert (=> b!817113 m!758635))

(declare-fun m!758767 () Bool)

(assert (=> b!817113 m!758767))

(assert (=> b!817113 m!758687))

(assert (=> b!817113 m!758687))

(assert (=> b!817113 m!758685))

(assert (=> b!817113 m!758689))

(assert (=> b!817113 m!758635))

(assert (=> b!817116 m!758685))

(assert (=> b!817116 m!758687))

(declare-fun m!758769 () Bool)

(assert (=> b!817116 m!758769))

(declare-fun m!758771 () Bool)

(assert (=> b!817116 m!758771))

(declare-fun m!758773 () Bool)

(assert (=> b!817116 m!758773))

(declare-fun m!758775 () Bool)

(assert (=> b!817116 m!758775))

(assert (=> b!817116 m!758773))

(assert (=> b!817116 m!758687))

(assert (=> b!817116 m!758685))

(assert (=> b!817116 m!758689))

(assert (=> b!817116 m!758635))

(declare-fun m!758777 () Bool)

(assert (=> d!104553 m!758777))

(assert (=> d!104553 m!758579))

(assert (=> b!816952 d!104553))

(declare-fun b!817132 () Bool)

(declare-fun e!453370 () Bool)

(declare-fun call!35592 () Bool)

(assert (=> b!817132 (= e!453370 call!35592)))

(declare-fun b!817133 () Bool)

(declare-fun e!453371 () Bool)

(declare-fun e!453372 () Bool)

(assert (=> b!817133 (= e!453371 e!453372)))

(declare-fun c!89057 () Bool)

(assert (=> b!817133 (= c!89057 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104555 () Bool)

(declare-fun res!557809 () Bool)

(assert (=> d!104555 (=> res!557809 e!453371)))

(assert (=> d!104555 (= res!557809 (bvsge #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> d!104555 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!453371)))

(declare-fun bm!35589 () Bool)

(assert (=> bm!35589 (= call!35592 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!817134 () Bool)

(assert (=> b!817134 (= e!453372 e!453370)))

(declare-fun lt!366129 () (_ BitVec 64))

(assert (=> b!817134 (= lt!366129 (select (arr!21559 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!366128 () Unit!27864)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45004 (_ BitVec 64) (_ BitVec 32)) Unit!27864)

(assert (=> b!817134 (= lt!366128 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!366129 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!817134 (arrayContainsKey!0 _keys!976 lt!366129 #b00000000000000000000000000000000)))

(declare-fun lt!366127 () Unit!27864)

(assert (=> b!817134 (= lt!366127 lt!366128)))

(declare-fun res!557808 () Bool)

(declare-datatypes ((SeekEntryResult!8723 0))(
  ( (MissingZero!8723 (index!37263 (_ BitVec 32))) (Found!8723 (index!37264 (_ BitVec 32))) (Intermediate!8723 (undefined!9535 Bool) (index!37265 (_ BitVec 32)) (x!68785 (_ BitVec 32))) (Undefined!8723) (MissingVacant!8723 (index!37266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45004 (_ BitVec 32)) SeekEntryResult!8723)

(assert (=> b!817134 (= res!557808 (= (seekEntryOrOpen!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8723 #b00000000000000000000000000000000)))))

(assert (=> b!817134 (=> (not res!557808) (not e!453370))))

(declare-fun b!817135 () Bool)

(assert (=> b!817135 (= e!453372 call!35592)))

(assert (= (and d!104555 (not res!557809)) b!817133))

(assert (= (and b!817133 c!89057) b!817134))

(assert (= (and b!817133 (not c!89057)) b!817135))

(assert (= (and b!817134 res!557808) b!817132))

(assert (= (or b!817132 b!817135) bm!35589))

(assert (=> b!817133 m!758635))

(assert (=> b!817133 m!758635))

(assert (=> b!817133 m!758637))

(declare-fun m!758779 () Bool)

(assert (=> bm!35589 m!758779))

(assert (=> b!817134 m!758635))

(declare-fun m!758781 () Bool)

(assert (=> b!817134 m!758781))

(declare-fun m!758783 () Bool)

(assert (=> b!817134 m!758783))

(assert (=> b!817134 m!758635))

(declare-fun m!758785 () Bool)

(assert (=> b!817134 m!758785))

(assert (=> b!816953 d!104555))

(declare-fun bm!35592 () Bool)

(declare-fun call!35595 () Bool)

(declare-fun c!89060 () Bool)

(assert (=> bm!35592 (= call!35595 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89060 (Cons!15352 (select (arr!21559 _keys!976) #b00000000000000000000000000000000) Nil!15353) Nil!15353)))))

(declare-fun d!104557 () Bool)

(declare-fun res!557816 () Bool)

(declare-fun e!453384 () Bool)

(assert (=> d!104557 (=> res!557816 e!453384)))

(assert (=> d!104557 (= res!557816 (bvsge #b00000000000000000000000000000000 (size!21980 _keys!976)))))

(assert (=> d!104557 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15353) e!453384)))

(declare-fun b!817146 () Bool)

(declare-fun e!453382 () Bool)

(assert (=> b!817146 (= e!453382 call!35595)))

(declare-fun b!817147 () Bool)

(declare-fun e!453381 () Bool)

(assert (=> b!817147 (= e!453381 e!453382)))

(assert (=> b!817147 (= c!89060 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817148 () Bool)

(assert (=> b!817148 (= e!453382 call!35595)))

(declare-fun b!817149 () Bool)

(assert (=> b!817149 (= e!453384 e!453381)))

(declare-fun res!557817 () Bool)

(assert (=> b!817149 (=> (not res!557817) (not e!453381))))

(declare-fun e!453383 () Bool)

(assert (=> b!817149 (= res!557817 (not e!453383))))

(declare-fun res!557818 () Bool)

(assert (=> b!817149 (=> (not res!557818) (not e!453383))))

(assert (=> b!817149 (= res!557818 (validKeyInArray!0 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!817150 () Bool)

(declare-fun contains!4154 (List!15356 (_ BitVec 64)) Bool)

(assert (=> b!817150 (= e!453383 (contains!4154 Nil!15353 (select (arr!21559 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104557 (not res!557816)) b!817149))

(assert (= (and b!817149 res!557818) b!817150))

(assert (= (and b!817149 res!557817) b!817147))

(assert (= (and b!817147 c!89060) b!817148))

(assert (= (and b!817147 (not c!89060)) b!817146))

(assert (= (or b!817148 b!817146) bm!35592))

(assert (=> bm!35592 m!758635))

(declare-fun m!758787 () Bool)

(assert (=> bm!35592 m!758787))

(assert (=> b!817147 m!758635))

(assert (=> b!817147 m!758635))

(assert (=> b!817147 m!758637))

(assert (=> b!817149 m!758635))

(assert (=> b!817149 m!758635))

(assert (=> b!817149 m!758637))

(assert (=> b!817150 m!758635))

(assert (=> b!817150 m!758635))

(declare-fun m!758789 () Bool)

(assert (=> b!817150 m!758789))

(assert (=> b!816948 d!104557))

(declare-fun d!104559 () Bool)

(assert (=> d!104559 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70318 d!104559))

(declare-fun d!104561 () Bool)

(assert (=> d!104561 (= (array_inv!17249 _keys!976) (bvsge (size!21980 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70318 d!104561))

(declare-fun d!104563 () Bool)

(assert (=> d!104563 (= (array_inv!17250 _values!788) (bvsge (size!21981 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70318 d!104563))

(declare-fun b!817157 () Bool)

(declare-fun e!453389 () Bool)

(assert (=> b!817157 (= e!453389 tp_is_empty!14403)))

(declare-fun mapIsEmpty!23200 () Bool)

(declare-fun mapRes!23200 () Bool)

(assert (=> mapIsEmpty!23200 mapRes!23200))

(declare-fun condMapEmpty!23200 () Bool)

(declare-fun mapDefault!23200 () ValueCell!6786)

(assert (=> mapNonEmpty!23194 (= condMapEmpty!23200 (= mapRest!23194 ((as const (Array (_ BitVec 32) ValueCell!6786)) mapDefault!23200)))))

(declare-fun e!453390 () Bool)

(assert (=> mapNonEmpty!23194 (= tp!44803 (and e!453390 mapRes!23200))))

(declare-fun mapNonEmpty!23200 () Bool)

(declare-fun tp!44812 () Bool)

(assert (=> mapNonEmpty!23200 (= mapRes!23200 (and tp!44812 e!453389))))

(declare-fun mapValue!23200 () ValueCell!6786)

(declare-fun mapRest!23200 () (Array (_ BitVec 32) ValueCell!6786))

(declare-fun mapKey!23200 () (_ BitVec 32))

(assert (=> mapNonEmpty!23200 (= mapRest!23194 (store mapRest!23200 mapKey!23200 mapValue!23200))))

(declare-fun b!817158 () Bool)

(assert (=> b!817158 (= e!453390 tp_is_empty!14403)))

(assert (= (and mapNonEmpty!23194 condMapEmpty!23200) mapIsEmpty!23200))

(assert (= (and mapNonEmpty!23194 (not condMapEmpty!23200)) mapNonEmpty!23200))

(assert (= (and mapNonEmpty!23200 ((_ is ValueCellFull!6786) mapValue!23200)) b!817157))

(assert (= (and mapNonEmpty!23194 ((_ is ValueCellFull!6786) mapDefault!23200)) b!817158))

(declare-fun m!758791 () Bool)

(assert (=> mapNonEmpty!23200 m!758791))

(declare-fun b_lambda!10899 () Bool)

(assert (= b_lambda!10893 (or (and start!70318 b_free!12693) b_lambda!10899)))

(declare-fun b_lambda!10901 () Bool)

(assert (= b_lambda!10887 (or (and start!70318 b_free!12693) b_lambda!10901)))

(declare-fun b_lambda!10903 () Bool)

(assert (= b_lambda!10895 (or (and start!70318 b_free!12693) b_lambda!10903)))

(declare-fun b_lambda!10905 () Bool)

(assert (= b_lambda!10897 (or (and start!70318 b_free!12693) b_lambda!10905)))

(declare-fun b_lambda!10907 () Bool)

(assert (= b_lambda!10889 (or (and start!70318 b_free!12693) b_lambda!10907)))

(declare-fun b_lambda!10909 () Bool)

(assert (= b_lambda!10891 (or (and start!70318 b_free!12693) b_lambda!10909)))

(check-sat (not b!817041) (not b!817067) (not d!104543) (not b!817150) (not d!104551) (not b!817118) (not d!104549) (not b!817033) (not b!817147) (not b!817134) (not b!817100) (not bm!35576) (not b!817106) (not b!817111) (not b!817133) (not b!817043) (not b_lambda!10901) (not b!817114) (not b!817034) (not b_lambda!10905) (not b_next!12693) (not bm!35592) (not b!817116) b_and!21507 (not bm!35585) (not b!816989) (not b!817044) (not b!817066) (not b_lambda!10899) (not bm!35589) (not b!817115) (not b!817109) (not b!817101) (not b_lambda!10903) (not b!817123) (not b_lambda!10909) (not mapNonEmpty!23200) (not b!817074) (not bm!35579) (not d!104547) (not b!817113) (not d!104545) (not b!817040) (not bm!35570) (not b!817104) (not b!817057) (not bm!35581) (not bm!35569) (not d!104553) (not b!817051) (not b_lambda!10907) (not bm!35586) (not b!817060) (not b!816988) (not b!817121) (not b!817149) (not b!817064) (not b!817063) (not b!817102) (not bm!35577) (not b!817112) (not b!817103) (not b!817037) (not b!817056) (not bm!35572) tp_is_empty!14403 (not bm!35574))
(check-sat b_and!21507 (not b_next!12693))
