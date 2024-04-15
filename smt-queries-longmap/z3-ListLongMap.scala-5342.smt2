; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71358 () Bool)

(assert start!71358)

(declare-fun b_free!13459 () Bool)

(declare-fun b_next!13459 () Bool)

(assert (=> start!71358 (= b_free!13459 (not b_next!13459))))

(declare-fun tp!47151 () Bool)

(declare-fun b_and!22415 () Bool)

(assert (=> start!71358 (= tp!47151 b_and!22415)))

(declare-fun b!828735 () Bool)

(declare-fun e!461868 () Bool)

(declare-fun e!461872 () Bool)

(assert (=> b!828735 (= e!461868 (not e!461872))))

(declare-fun res!564696 () Bool)

(assert (=> b!828735 (=> res!564696 e!461872)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828735 (= res!564696 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!25227 0))(
  ( (V!25228 (val!7632 Int)) )
))
(declare-datatypes ((tuple2!10132 0))(
  ( (tuple2!10133 (_1!5077 (_ BitVec 64)) (_2!5077 V!25227)) )
))
(declare-datatypes ((List!15918 0))(
  ( (Nil!15915) (Cons!15914 (h!17043 tuple2!10132) (t!22266 List!15918)) )
))
(declare-datatypes ((ListLongMap!8945 0))(
  ( (ListLongMap!8946 (toList!4488 List!15918)) )
))
(declare-fun lt!375554 () ListLongMap!8945)

(declare-fun lt!375556 () ListLongMap!8945)

(assert (=> b!828735 (= lt!375554 lt!375556)))

(declare-fun zeroValueBefore!34 () V!25227)

(declare-datatypes ((Unit!28347 0))(
  ( (Unit!28348) )
))
(declare-fun lt!375555 () Unit!28347)

(declare-datatypes ((array!46477 0))(
  ( (array!46478 (arr!22279 (Array (_ BitVec 32) (_ BitVec 64))) (size!22700 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46477)

(declare-fun zeroValueAfter!34 () V!25227)

(declare-fun minValue!754 () V!25227)

(declare-datatypes ((ValueCell!7169 0))(
  ( (ValueCellFull!7169 (v!10064 V!25227)) (EmptyCell!7169) )
))
(declare-datatypes ((array!46479 0))(
  ( (array!46480 (arr!22280 (Array (_ BitVec 32) ValueCell!7169)) (size!22701 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46479)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!587 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 V!25227 V!25227 (_ BitVec 32) Int) Unit!28347)

(assert (=> b!828735 (= lt!375555 (lemmaNoChangeToArrayThenSameMapNoExtras!587 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2517 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 (_ BitVec 32) Int) ListLongMap!8945)

(assert (=> b!828735 (= lt!375556 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828735 (= lt!375554 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828736 () Bool)

(declare-fun res!564697 () Bool)

(assert (=> b!828736 (=> (not res!564697) (not e!461868))))

(assert (=> b!828736 (= res!564697 (and (= (size!22701 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22700 _keys!976) (size!22701 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828737 () Bool)

(declare-fun res!564699 () Bool)

(assert (=> b!828737 (=> (not res!564699) (not e!461868))))

(declare-datatypes ((List!15919 0))(
  ( (Nil!15916) (Cons!15915 (h!17044 (_ BitVec 64)) (t!22267 List!15919)) )
))
(declare-fun arrayNoDuplicates!0 (array!46477 (_ BitVec 32) List!15919) Bool)

(assert (=> b!828737 (= res!564699 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15916))))

(declare-fun res!564700 () Bool)

(assert (=> start!71358 (=> (not res!564700) (not e!461868))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71358 (= res!564700 (validMask!0 mask!1312))))

(assert (=> start!71358 e!461868))

(declare-fun tp_is_empty!15169 () Bool)

(assert (=> start!71358 tp_is_empty!15169))

(declare-fun array_inv!17811 (array!46477) Bool)

(assert (=> start!71358 (array_inv!17811 _keys!976)))

(assert (=> start!71358 true))

(declare-fun e!461869 () Bool)

(declare-fun array_inv!17812 (array!46479) Bool)

(assert (=> start!71358 (and (array_inv!17812 _values!788) e!461869)))

(assert (=> start!71358 tp!47151))

(declare-fun b!828738 () Bool)

(declare-fun e!461871 () Bool)

(assert (=> b!828738 (= e!461871 tp_is_empty!15169)))

(declare-fun b!828739 () Bool)

(declare-fun e!461867 () Bool)

(assert (=> b!828739 (= e!461867 tp_is_empty!15169)))

(declare-fun b!828740 () Bool)

(declare-fun getCurrentListMap!2541 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 (_ BitVec 32) Int) ListLongMap!8945)

(declare-fun +!1998 (ListLongMap!8945 tuple2!10132) ListLongMap!8945)

(assert (=> b!828740 (= e!461872 (= (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1998 lt!375554 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!375553 () ListLongMap!8945)

(assert (=> b!828740 (= lt!375553 (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24394 () Bool)

(declare-fun mapRes!24394 () Bool)

(assert (=> mapIsEmpty!24394 mapRes!24394))

(declare-fun b!828741 () Bool)

(assert (=> b!828741 (= e!461869 (and e!461867 mapRes!24394))))

(declare-fun condMapEmpty!24394 () Bool)

(declare-fun mapDefault!24394 () ValueCell!7169)

(assert (=> b!828741 (= condMapEmpty!24394 (= (arr!22280 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7169)) mapDefault!24394)))))

(declare-fun b!828742 () Bool)

(declare-fun res!564698 () Bool)

(assert (=> b!828742 (=> (not res!564698) (not e!461868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46477 (_ BitVec 32)) Bool)

(assert (=> b!828742 (= res!564698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!24394 () Bool)

(declare-fun tp!47152 () Bool)

(assert (=> mapNonEmpty!24394 (= mapRes!24394 (and tp!47152 e!461871))))

(declare-fun mapRest!24394 () (Array (_ BitVec 32) ValueCell!7169))

(declare-fun mapValue!24394 () ValueCell!7169)

(declare-fun mapKey!24394 () (_ BitVec 32))

(assert (=> mapNonEmpty!24394 (= (arr!22280 _values!788) (store mapRest!24394 mapKey!24394 mapValue!24394))))

(assert (= (and start!71358 res!564700) b!828736))

(assert (= (and b!828736 res!564697) b!828742))

(assert (= (and b!828742 res!564698) b!828737))

(assert (= (and b!828737 res!564699) b!828735))

(assert (= (and b!828735 (not res!564696)) b!828740))

(assert (= (and b!828741 condMapEmpty!24394) mapIsEmpty!24394))

(assert (= (and b!828741 (not condMapEmpty!24394)) mapNonEmpty!24394))

(get-info :version)

(assert (= (and mapNonEmpty!24394 ((_ is ValueCellFull!7169) mapValue!24394)) b!828738))

(assert (= (and b!828741 ((_ is ValueCellFull!7169) mapDefault!24394)) b!828739))

(assert (= start!71358 b!828741))

(declare-fun m!771213 () Bool)

(assert (=> start!71358 m!771213))

(declare-fun m!771215 () Bool)

(assert (=> start!71358 m!771215))

(declare-fun m!771217 () Bool)

(assert (=> start!71358 m!771217))

(declare-fun m!771219 () Bool)

(assert (=> b!828742 m!771219))

(declare-fun m!771221 () Bool)

(assert (=> b!828740 m!771221))

(declare-fun m!771223 () Bool)

(assert (=> b!828740 m!771223))

(declare-fun m!771225 () Bool)

(assert (=> b!828740 m!771225))

(declare-fun m!771227 () Bool)

(assert (=> mapNonEmpty!24394 m!771227))

(declare-fun m!771229 () Bool)

(assert (=> b!828735 m!771229))

(declare-fun m!771231 () Bool)

(assert (=> b!828735 m!771231))

(declare-fun m!771233 () Bool)

(assert (=> b!828735 m!771233))

(declare-fun m!771235 () Bool)

(assert (=> b!828737 m!771235))

(check-sat (not b!828740) tp_is_empty!15169 (not mapNonEmpty!24394) (not b_next!13459) (not b!828735) (not b!828742) (not start!71358) (not b!828737) b_and!22415)
(check-sat b_and!22415 (not b_next!13459))
(get-model)

(declare-fun bm!36056 () Bool)

(declare-fun call!36060 () Bool)

(declare-fun lt!375641 () ListLongMap!8945)

(declare-fun contains!4175 (ListLongMap!8945 (_ BitVec 64)) Bool)

(assert (=> bm!36056 (= call!36060 (contains!4175 lt!375641 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828833 () Bool)

(declare-fun e!461940 () ListLongMap!8945)

(declare-fun call!36061 () ListLongMap!8945)

(assert (=> b!828833 (= e!461940 call!36061)))

(declare-fun b!828834 () Bool)

(declare-fun e!461936 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828834 (= e!461936 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828836 () Bool)

(declare-fun c!89626 () Bool)

(assert (=> b!828836 (= c!89626 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!461947 () ListLongMap!8945)

(assert (=> b!828836 (= e!461940 e!461947)))

(declare-fun b!828837 () Bool)

(declare-fun e!461943 () Unit!28347)

(declare-fun lt!375645 () Unit!28347)

(assert (=> b!828837 (= e!461943 lt!375645)))

(declare-fun lt!375646 () ListLongMap!8945)

(assert (=> b!828837 (= lt!375646 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375633 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375633 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375627 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375627 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375631 () Unit!28347)

(declare-fun addStillContains!319 (ListLongMap!8945 (_ BitVec 64) V!25227 (_ BitVec 64)) Unit!28347)

(assert (=> b!828837 (= lt!375631 (addStillContains!319 lt!375646 lt!375633 zeroValueBefore!34 lt!375627))))

(assert (=> b!828837 (contains!4175 (+!1998 lt!375646 (tuple2!10133 lt!375633 zeroValueBefore!34)) lt!375627)))

(declare-fun lt!375634 () Unit!28347)

(assert (=> b!828837 (= lt!375634 lt!375631)))

(declare-fun lt!375640 () ListLongMap!8945)

(assert (=> b!828837 (= lt!375640 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375626 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375626 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375642 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375642 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375644 () Unit!28347)

(declare-fun addApplyDifferent!319 (ListLongMap!8945 (_ BitVec 64) V!25227 (_ BitVec 64)) Unit!28347)

(assert (=> b!828837 (= lt!375644 (addApplyDifferent!319 lt!375640 lt!375626 minValue!754 lt!375642))))

(declare-fun apply!368 (ListLongMap!8945 (_ BitVec 64)) V!25227)

(assert (=> b!828837 (= (apply!368 (+!1998 lt!375640 (tuple2!10133 lt!375626 minValue!754)) lt!375642) (apply!368 lt!375640 lt!375642))))

(declare-fun lt!375629 () Unit!28347)

(assert (=> b!828837 (= lt!375629 lt!375644)))

(declare-fun lt!375630 () ListLongMap!8945)

(assert (=> b!828837 (= lt!375630 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375628 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375628 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375625 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375625 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375636 () Unit!28347)

(assert (=> b!828837 (= lt!375636 (addApplyDifferent!319 lt!375630 lt!375628 zeroValueBefore!34 lt!375625))))

(assert (=> b!828837 (= (apply!368 (+!1998 lt!375630 (tuple2!10133 lt!375628 zeroValueBefore!34)) lt!375625) (apply!368 lt!375630 lt!375625))))

(declare-fun lt!375643 () Unit!28347)

(assert (=> b!828837 (= lt!375643 lt!375636)))

(declare-fun lt!375638 () ListLongMap!8945)

(assert (=> b!828837 (= lt!375638 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375632 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375632 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375635 () (_ BitVec 64))

(assert (=> b!828837 (= lt!375635 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828837 (= lt!375645 (addApplyDifferent!319 lt!375638 lt!375632 minValue!754 lt!375635))))

(assert (=> b!828837 (= (apply!368 (+!1998 lt!375638 (tuple2!10133 lt!375632 minValue!754)) lt!375635) (apply!368 lt!375638 lt!375635))))

(declare-fun b!828838 () Bool)

(declare-fun e!461939 () Bool)

(assert (=> b!828838 (= e!461939 (= (apply!368 lt!375641 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun e!461944 () Bool)

(declare-fun b!828839 () Bool)

(declare-fun get!11807 (ValueCell!7169 V!25227) V!25227)

(declare-fun dynLambda!982 (Int (_ BitVec 64)) V!25227)

(assert (=> b!828839 (= e!461944 (= (apply!368 lt!375641 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22701 _values!788)))))

(assert (=> b!828839 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun bm!36057 () Bool)

(declare-fun call!36062 () ListLongMap!8945)

(declare-fun call!36064 () ListLongMap!8945)

(assert (=> bm!36057 (= call!36062 call!36064)))

(declare-fun b!828840 () Bool)

(declare-fun e!461946 () Bool)

(assert (=> b!828840 (= e!461946 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828841 () Bool)

(declare-fun e!461938 () Bool)

(assert (=> b!828841 (= e!461938 (not call!36060))))

(declare-fun b!828842 () Bool)

(declare-fun e!461945 () Bool)

(assert (=> b!828842 (= e!461945 (= (apply!368 lt!375641 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!828843 () Bool)

(declare-fun e!461935 () Bool)

(declare-fun call!36059 () Bool)

(assert (=> b!828843 (= e!461935 (not call!36059))))

(declare-fun bm!36058 () Bool)

(declare-fun call!36063 () ListLongMap!8945)

(assert (=> bm!36058 (= call!36063 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828844 () Bool)

(declare-fun Unit!28351 () Unit!28347)

(assert (=> b!828844 (= e!461943 Unit!28351)))

(declare-fun bm!36059 () Bool)

(declare-fun call!36065 () ListLongMap!8945)

(assert (=> bm!36059 (= call!36061 call!36065)))

(declare-fun b!828845 () Bool)

(declare-fun e!461941 () ListLongMap!8945)

(assert (=> b!828845 (= e!461941 (+!1998 call!36065 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828846 () Bool)

(assert (=> b!828846 (= e!461941 e!461940)))

(declare-fun c!89629 () Bool)

(assert (=> b!828846 (= c!89629 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828835 () Bool)

(declare-fun res!564757 () Bool)

(declare-fun e!461942 () Bool)

(assert (=> b!828835 (=> (not res!564757) (not e!461942))))

(assert (=> b!828835 (= res!564757 e!461938)))

(declare-fun c!89628 () Bool)

(assert (=> b!828835 (= c!89628 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!105029 () Bool)

(assert (=> d!105029 e!461942))

(declare-fun res!564753 () Bool)

(assert (=> d!105029 (=> (not res!564753) (not e!461942))))

(assert (=> d!105029 (= res!564753 (or (bvsge #b00000000000000000000000000000000 (size!22700 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))))

(declare-fun lt!375639 () ListLongMap!8945)

(assert (=> d!105029 (= lt!375641 lt!375639)))

(declare-fun lt!375637 () Unit!28347)

(assert (=> d!105029 (= lt!375637 e!461943)))

(declare-fun c!89627 () Bool)

(assert (=> d!105029 (= c!89627 e!461946)))

(declare-fun res!564750 () Bool)

(assert (=> d!105029 (=> (not res!564750) (not e!461946))))

(assert (=> d!105029 (= res!564750 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> d!105029 (= lt!375639 e!461941)))

(declare-fun c!89625 () Bool)

(assert (=> d!105029 (= c!89625 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105029 (validMask!0 mask!1312)))

(assert (=> d!105029 (= (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375641)))

(declare-fun b!828847 () Bool)

(assert (=> b!828847 (= e!461942 e!461935)))

(declare-fun c!89630 () Bool)

(assert (=> b!828847 (= c!89630 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828848 () Bool)

(assert (=> b!828848 (= e!461938 e!461945)))

(declare-fun res!564756 () Bool)

(assert (=> b!828848 (= res!564756 call!36060)))

(assert (=> b!828848 (=> (not res!564756) (not e!461945))))

(declare-fun b!828849 () Bool)

(assert (=> b!828849 (= e!461935 e!461939)))

(declare-fun res!564751 () Bool)

(assert (=> b!828849 (= res!564751 call!36059)))

(assert (=> b!828849 (=> (not res!564751) (not e!461939))))

(declare-fun bm!36060 () Bool)

(assert (=> bm!36060 (= call!36059 (contains!4175 lt!375641 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36061 () Bool)

(assert (=> bm!36061 (= call!36064 call!36063)))

(declare-fun b!828850 () Bool)

(declare-fun e!461937 () Bool)

(assert (=> b!828850 (= e!461937 e!461944)))

(declare-fun res!564754 () Bool)

(assert (=> b!828850 (=> (not res!564754) (not e!461944))))

(assert (=> b!828850 (= res!564754 (contains!4175 lt!375641 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828851 () Bool)

(declare-fun res!564755 () Bool)

(assert (=> b!828851 (=> (not res!564755) (not e!461942))))

(assert (=> b!828851 (= res!564755 e!461937)))

(declare-fun res!564752 () Bool)

(assert (=> b!828851 (=> res!564752 e!461937)))

(assert (=> b!828851 (= res!564752 (not e!461936))))

(declare-fun res!564749 () Bool)

(assert (=> b!828851 (=> (not res!564749) (not e!461936))))

(assert (=> b!828851 (= res!564749 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828852 () Bool)

(assert (=> b!828852 (= e!461947 call!36062)))

(declare-fun b!828853 () Bool)

(assert (=> b!828853 (= e!461947 call!36061)))

(declare-fun bm!36062 () Bool)

(assert (=> bm!36062 (= call!36065 (+!1998 (ite c!89625 call!36063 (ite c!89629 call!36064 call!36062)) (ite (or c!89625 c!89629) (tuple2!10133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105029 c!89625) b!828845))

(assert (= (and d!105029 (not c!89625)) b!828846))

(assert (= (and b!828846 c!89629) b!828833))

(assert (= (and b!828846 (not c!89629)) b!828836))

(assert (= (and b!828836 c!89626) b!828853))

(assert (= (and b!828836 (not c!89626)) b!828852))

(assert (= (or b!828853 b!828852) bm!36057))

(assert (= (or b!828833 bm!36057) bm!36061))

(assert (= (or b!828833 b!828853) bm!36059))

(assert (= (or b!828845 bm!36061) bm!36058))

(assert (= (or b!828845 bm!36059) bm!36062))

(assert (= (and d!105029 res!564750) b!828840))

(assert (= (and d!105029 c!89627) b!828837))

(assert (= (and d!105029 (not c!89627)) b!828844))

(assert (= (and d!105029 res!564753) b!828851))

(assert (= (and b!828851 res!564749) b!828834))

(assert (= (and b!828851 (not res!564752)) b!828850))

(assert (= (and b!828850 res!564754) b!828839))

(assert (= (and b!828851 res!564755) b!828835))

(assert (= (and b!828835 c!89628) b!828848))

(assert (= (and b!828835 (not c!89628)) b!828841))

(assert (= (and b!828848 res!564756) b!828842))

(assert (= (or b!828848 b!828841) bm!36056))

(assert (= (and b!828835 res!564757) b!828847))

(assert (= (and b!828847 c!89630) b!828849))

(assert (= (and b!828847 (not c!89630)) b!828843))

(assert (= (and b!828849 res!564751) b!828838))

(assert (= (or b!828849 b!828843) bm!36060))

(declare-fun b_lambda!11233 () Bool)

(assert (=> (not b_lambda!11233) (not b!828839)))

(declare-fun t!22271 () Bool)

(declare-fun tb!4209 () Bool)

(assert (=> (and start!71358 (= defaultEntry!796 defaultEntry!796) t!22271) tb!4209))

(declare-fun result!7983 () Bool)

(assert (=> tb!4209 (= result!7983 tp_is_empty!15169)))

(assert (=> b!828839 t!22271))

(declare-fun b_and!22421 () Bool)

(assert (= b_and!22415 (and (=> t!22271 result!7983) b_and!22421)))

(declare-fun m!771285 () Bool)

(assert (=> b!828845 m!771285))

(declare-fun m!771287 () Bool)

(assert (=> bm!36062 m!771287))

(declare-fun m!771289 () Bool)

(assert (=> b!828839 m!771289))

(declare-fun m!771291 () Bool)

(assert (=> b!828839 m!771291))

(assert (=> b!828839 m!771289))

(declare-fun m!771293 () Bool)

(assert (=> b!828839 m!771293))

(declare-fun m!771295 () Bool)

(assert (=> b!828839 m!771295))

(assert (=> b!828839 m!771295))

(assert (=> b!828839 m!771291))

(declare-fun m!771297 () Bool)

(assert (=> b!828839 m!771297))

(assert (=> b!828850 m!771289))

(assert (=> b!828850 m!771289))

(declare-fun m!771299 () Bool)

(assert (=> b!828850 m!771299))

(declare-fun m!771301 () Bool)

(assert (=> bm!36056 m!771301))

(assert (=> bm!36058 m!771233))

(assert (=> d!105029 m!771213))

(assert (=> b!828834 m!771289))

(assert (=> b!828834 m!771289))

(declare-fun m!771303 () Bool)

(assert (=> b!828834 m!771303))

(declare-fun m!771305 () Bool)

(assert (=> b!828838 m!771305))

(declare-fun m!771307 () Bool)

(assert (=> b!828842 m!771307))

(declare-fun m!771309 () Bool)

(assert (=> bm!36060 m!771309))

(assert (=> b!828837 m!771233))

(declare-fun m!771311 () Bool)

(assert (=> b!828837 m!771311))

(declare-fun m!771313 () Bool)

(assert (=> b!828837 m!771313))

(declare-fun m!771315 () Bool)

(assert (=> b!828837 m!771315))

(declare-fun m!771317 () Bool)

(assert (=> b!828837 m!771317))

(declare-fun m!771319 () Bool)

(assert (=> b!828837 m!771319))

(declare-fun m!771321 () Bool)

(assert (=> b!828837 m!771321))

(declare-fun m!771323 () Bool)

(assert (=> b!828837 m!771323))

(declare-fun m!771325 () Bool)

(assert (=> b!828837 m!771325))

(assert (=> b!828837 m!771311))

(declare-fun m!771327 () Bool)

(assert (=> b!828837 m!771327))

(declare-fun m!771329 () Bool)

(assert (=> b!828837 m!771329))

(declare-fun m!771331 () Bool)

(assert (=> b!828837 m!771331))

(declare-fun m!771333 () Bool)

(assert (=> b!828837 m!771333))

(assert (=> b!828837 m!771317))

(declare-fun m!771335 () Bool)

(assert (=> b!828837 m!771335))

(declare-fun m!771337 () Bool)

(assert (=> b!828837 m!771337))

(assert (=> b!828837 m!771289))

(assert (=> b!828837 m!771321))

(declare-fun m!771339 () Bool)

(assert (=> b!828837 m!771339))

(assert (=> b!828837 m!771331))

(assert (=> b!828840 m!771289))

(assert (=> b!828840 m!771289))

(assert (=> b!828840 m!771303))

(assert (=> b!828740 d!105029))

(declare-fun d!105031 () Bool)

(declare-fun e!461950 () Bool)

(assert (=> d!105031 e!461950))

(declare-fun res!564763 () Bool)

(assert (=> d!105031 (=> (not res!564763) (not e!461950))))

(declare-fun lt!375657 () ListLongMap!8945)

(assert (=> d!105031 (= res!564763 (contains!4175 lt!375657 (_1!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!375656 () List!15918)

(assert (=> d!105031 (= lt!375657 (ListLongMap!8946 lt!375656))))

(declare-fun lt!375655 () Unit!28347)

(declare-fun lt!375658 () Unit!28347)

(assert (=> d!105031 (= lt!375655 lt!375658)))

(declare-datatypes ((Option!415 0))(
  ( (Some!414 (v!10067 V!25227)) (None!413) )
))
(declare-fun getValueByKey!409 (List!15918 (_ BitVec 64)) Option!415)

(assert (=> d!105031 (= (getValueByKey!409 lt!375656 (_1!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!414 (_2!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!226 (List!15918 (_ BitVec 64) V!25227) Unit!28347)

(assert (=> d!105031 (= lt!375658 (lemmaContainsTupThenGetReturnValue!226 lt!375656 (_1!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!265 (List!15918 (_ BitVec 64) V!25227) List!15918)

(assert (=> d!105031 (= lt!375656 (insertStrictlySorted!265 (toList!4488 lt!375554) (_1!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105031 (= (+!1998 lt!375554 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!375657)))

(declare-fun b!828860 () Bool)

(declare-fun res!564762 () Bool)

(assert (=> b!828860 (=> (not res!564762) (not e!461950))))

(assert (=> b!828860 (= res!564762 (= (getValueByKey!409 (toList!4488 lt!375657) (_1!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!414 (_2!5077 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!828861 () Bool)

(declare-fun contains!4176 (List!15918 tuple2!10132) Bool)

(assert (=> b!828861 (= e!461950 (contains!4176 (toList!4488 lt!375657) (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105031 res!564763) b!828860))

(assert (= (and b!828860 res!564762) b!828861))

(declare-fun m!771341 () Bool)

(assert (=> d!105031 m!771341))

(declare-fun m!771343 () Bool)

(assert (=> d!105031 m!771343))

(declare-fun m!771345 () Bool)

(assert (=> d!105031 m!771345))

(declare-fun m!771347 () Bool)

(assert (=> d!105031 m!771347))

(declare-fun m!771349 () Bool)

(assert (=> b!828860 m!771349))

(declare-fun m!771351 () Bool)

(assert (=> b!828861 m!771351))

(assert (=> b!828740 d!105031))

(declare-fun bm!36063 () Bool)

(declare-fun call!36067 () Bool)

(declare-fun lt!375675 () ListLongMap!8945)

(assert (=> bm!36063 (= call!36067 (contains!4175 lt!375675 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828862 () Bool)

(declare-fun e!461956 () ListLongMap!8945)

(declare-fun call!36068 () ListLongMap!8945)

(assert (=> b!828862 (= e!461956 call!36068)))

(declare-fun b!828863 () Bool)

(declare-fun e!461952 () Bool)

(assert (=> b!828863 (= e!461952 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828865 () Bool)

(declare-fun c!89632 () Bool)

(assert (=> b!828865 (= c!89632 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!461963 () ListLongMap!8945)

(assert (=> b!828865 (= e!461956 e!461963)))

(declare-fun b!828866 () Bool)

(declare-fun e!461959 () Unit!28347)

(declare-fun lt!375679 () Unit!28347)

(assert (=> b!828866 (= e!461959 lt!375679)))

(declare-fun lt!375680 () ListLongMap!8945)

(assert (=> b!828866 (= lt!375680 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375667 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375661 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375661 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375665 () Unit!28347)

(assert (=> b!828866 (= lt!375665 (addStillContains!319 lt!375680 lt!375667 zeroValueAfter!34 lt!375661))))

(assert (=> b!828866 (contains!4175 (+!1998 lt!375680 (tuple2!10133 lt!375667 zeroValueAfter!34)) lt!375661)))

(declare-fun lt!375668 () Unit!28347)

(assert (=> b!828866 (= lt!375668 lt!375665)))

(declare-fun lt!375674 () ListLongMap!8945)

(assert (=> b!828866 (= lt!375674 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375660 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375660 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375676 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375676 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375678 () Unit!28347)

(assert (=> b!828866 (= lt!375678 (addApplyDifferent!319 lt!375674 lt!375660 minValue!754 lt!375676))))

(assert (=> b!828866 (= (apply!368 (+!1998 lt!375674 (tuple2!10133 lt!375660 minValue!754)) lt!375676) (apply!368 lt!375674 lt!375676))))

(declare-fun lt!375663 () Unit!28347)

(assert (=> b!828866 (= lt!375663 lt!375678)))

(declare-fun lt!375664 () ListLongMap!8945)

(assert (=> b!828866 (= lt!375664 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375662 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375662 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375659 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375659 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375670 () Unit!28347)

(assert (=> b!828866 (= lt!375670 (addApplyDifferent!319 lt!375664 lt!375662 zeroValueAfter!34 lt!375659))))

(assert (=> b!828866 (= (apply!368 (+!1998 lt!375664 (tuple2!10133 lt!375662 zeroValueAfter!34)) lt!375659) (apply!368 lt!375664 lt!375659))))

(declare-fun lt!375677 () Unit!28347)

(assert (=> b!828866 (= lt!375677 lt!375670)))

(declare-fun lt!375672 () ListLongMap!8945)

(assert (=> b!828866 (= lt!375672 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375666 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375666 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375669 () (_ BitVec 64))

(assert (=> b!828866 (= lt!375669 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828866 (= lt!375679 (addApplyDifferent!319 lt!375672 lt!375666 minValue!754 lt!375669))))

(assert (=> b!828866 (= (apply!368 (+!1998 lt!375672 (tuple2!10133 lt!375666 minValue!754)) lt!375669) (apply!368 lt!375672 lt!375669))))

(declare-fun b!828867 () Bool)

(declare-fun e!461955 () Bool)

(assert (=> b!828867 (= e!461955 (= (apply!368 lt!375675 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828868 () Bool)

(declare-fun e!461960 () Bool)

(assert (=> b!828868 (= e!461960 (= (apply!368 lt!375675 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22701 _values!788)))))

(assert (=> b!828868 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun bm!36064 () Bool)

(declare-fun call!36069 () ListLongMap!8945)

(declare-fun call!36071 () ListLongMap!8945)

(assert (=> bm!36064 (= call!36069 call!36071)))

(declare-fun b!828869 () Bool)

(declare-fun e!461962 () Bool)

(assert (=> b!828869 (= e!461962 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828870 () Bool)

(declare-fun e!461954 () Bool)

(assert (=> b!828870 (= e!461954 (not call!36067))))

(declare-fun b!828871 () Bool)

(declare-fun e!461961 () Bool)

(assert (=> b!828871 (= e!461961 (= (apply!368 lt!375675 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!828872 () Bool)

(declare-fun e!461951 () Bool)

(declare-fun call!36066 () Bool)

(assert (=> b!828872 (= e!461951 (not call!36066))))

(declare-fun call!36070 () ListLongMap!8945)

(declare-fun bm!36065 () Bool)

(assert (=> bm!36065 (= call!36070 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828873 () Bool)

(declare-fun Unit!28352 () Unit!28347)

(assert (=> b!828873 (= e!461959 Unit!28352)))

(declare-fun bm!36066 () Bool)

(declare-fun call!36072 () ListLongMap!8945)

(assert (=> bm!36066 (= call!36068 call!36072)))

(declare-fun b!828874 () Bool)

(declare-fun e!461957 () ListLongMap!8945)

(assert (=> b!828874 (= e!461957 (+!1998 call!36072 (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828875 () Bool)

(assert (=> b!828875 (= e!461957 e!461956)))

(declare-fun c!89635 () Bool)

(assert (=> b!828875 (= c!89635 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828864 () Bool)

(declare-fun res!564772 () Bool)

(declare-fun e!461958 () Bool)

(assert (=> b!828864 (=> (not res!564772) (not e!461958))))

(assert (=> b!828864 (= res!564772 e!461954)))

(declare-fun c!89634 () Bool)

(assert (=> b!828864 (= c!89634 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!105033 () Bool)

(assert (=> d!105033 e!461958))

(declare-fun res!564768 () Bool)

(assert (=> d!105033 (=> (not res!564768) (not e!461958))))

(assert (=> d!105033 (= res!564768 (or (bvsge #b00000000000000000000000000000000 (size!22700 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))))

(declare-fun lt!375673 () ListLongMap!8945)

(assert (=> d!105033 (= lt!375675 lt!375673)))

(declare-fun lt!375671 () Unit!28347)

(assert (=> d!105033 (= lt!375671 e!461959)))

(declare-fun c!89633 () Bool)

(assert (=> d!105033 (= c!89633 e!461962)))

(declare-fun res!564765 () Bool)

(assert (=> d!105033 (=> (not res!564765) (not e!461962))))

(assert (=> d!105033 (= res!564765 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> d!105033 (= lt!375673 e!461957)))

(declare-fun c!89631 () Bool)

(assert (=> d!105033 (= c!89631 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105033 (validMask!0 mask!1312)))

(assert (=> d!105033 (= (getCurrentListMap!2541 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375675)))

(declare-fun b!828876 () Bool)

(assert (=> b!828876 (= e!461958 e!461951)))

(declare-fun c!89636 () Bool)

(assert (=> b!828876 (= c!89636 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828877 () Bool)

(assert (=> b!828877 (= e!461954 e!461961)))

(declare-fun res!564771 () Bool)

(assert (=> b!828877 (= res!564771 call!36067)))

(assert (=> b!828877 (=> (not res!564771) (not e!461961))))

(declare-fun b!828878 () Bool)

(assert (=> b!828878 (= e!461951 e!461955)))

(declare-fun res!564766 () Bool)

(assert (=> b!828878 (= res!564766 call!36066)))

(assert (=> b!828878 (=> (not res!564766) (not e!461955))))

(declare-fun bm!36067 () Bool)

(assert (=> bm!36067 (= call!36066 (contains!4175 lt!375675 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36068 () Bool)

(assert (=> bm!36068 (= call!36071 call!36070)))

(declare-fun b!828879 () Bool)

(declare-fun e!461953 () Bool)

(assert (=> b!828879 (= e!461953 e!461960)))

(declare-fun res!564769 () Bool)

(assert (=> b!828879 (=> (not res!564769) (not e!461960))))

(assert (=> b!828879 (= res!564769 (contains!4175 lt!375675 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828880 () Bool)

(declare-fun res!564770 () Bool)

(assert (=> b!828880 (=> (not res!564770) (not e!461958))))

(assert (=> b!828880 (= res!564770 e!461953)))

(declare-fun res!564767 () Bool)

(assert (=> b!828880 (=> res!564767 e!461953)))

(assert (=> b!828880 (= res!564767 (not e!461952))))

(declare-fun res!564764 () Bool)

(assert (=> b!828880 (=> (not res!564764) (not e!461952))))

(assert (=> b!828880 (= res!564764 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828881 () Bool)

(assert (=> b!828881 (= e!461963 call!36069)))

(declare-fun b!828882 () Bool)

(assert (=> b!828882 (= e!461963 call!36068)))

(declare-fun bm!36069 () Bool)

(assert (=> bm!36069 (= call!36072 (+!1998 (ite c!89631 call!36070 (ite c!89635 call!36071 call!36069)) (ite (or c!89631 c!89635) (tuple2!10133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10133 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105033 c!89631) b!828874))

(assert (= (and d!105033 (not c!89631)) b!828875))

(assert (= (and b!828875 c!89635) b!828862))

(assert (= (and b!828875 (not c!89635)) b!828865))

(assert (= (and b!828865 c!89632) b!828882))

(assert (= (and b!828865 (not c!89632)) b!828881))

(assert (= (or b!828882 b!828881) bm!36064))

(assert (= (or b!828862 bm!36064) bm!36068))

(assert (= (or b!828862 b!828882) bm!36066))

(assert (= (or b!828874 bm!36068) bm!36065))

(assert (= (or b!828874 bm!36066) bm!36069))

(assert (= (and d!105033 res!564765) b!828869))

(assert (= (and d!105033 c!89633) b!828866))

(assert (= (and d!105033 (not c!89633)) b!828873))

(assert (= (and d!105033 res!564768) b!828880))

(assert (= (and b!828880 res!564764) b!828863))

(assert (= (and b!828880 (not res!564767)) b!828879))

(assert (= (and b!828879 res!564769) b!828868))

(assert (= (and b!828880 res!564770) b!828864))

(assert (= (and b!828864 c!89634) b!828877))

(assert (= (and b!828864 (not c!89634)) b!828870))

(assert (= (and b!828877 res!564771) b!828871))

(assert (= (or b!828877 b!828870) bm!36063))

(assert (= (and b!828864 res!564772) b!828876))

(assert (= (and b!828876 c!89636) b!828878))

(assert (= (and b!828876 (not c!89636)) b!828872))

(assert (= (and b!828878 res!564766) b!828867))

(assert (= (or b!828878 b!828872) bm!36067))

(declare-fun b_lambda!11235 () Bool)

(assert (=> (not b_lambda!11235) (not b!828868)))

(assert (=> b!828868 t!22271))

(declare-fun b_and!22423 () Bool)

(assert (= b_and!22421 (and (=> t!22271 result!7983) b_and!22423)))

(declare-fun m!771353 () Bool)

(assert (=> b!828874 m!771353))

(declare-fun m!771355 () Bool)

(assert (=> bm!36069 m!771355))

(assert (=> b!828868 m!771289))

(assert (=> b!828868 m!771291))

(assert (=> b!828868 m!771289))

(declare-fun m!771357 () Bool)

(assert (=> b!828868 m!771357))

(assert (=> b!828868 m!771295))

(assert (=> b!828868 m!771295))

(assert (=> b!828868 m!771291))

(assert (=> b!828868 m!771297))

(assert (=> b!828879 m!771289))

(assert (=> b!828879 m!771289))

(declare-fun m!771359 () Bool)

(assert (=> b!828879 m!771359))

(declare-fun m!771361 () Bool)

(assert (=> bm!36063 m!771361))

(assert (=> bm!36065 m!771231))

(assert (=> d!105033 m!771213))

(assert (=> b!828863 m!771289))

(assert (=> b!828863 m!771289))

(assert (=> b!828863 m!771303))

(declare-fun m!771363 () Bool)

(assert (=> b!828867 m!771363))

(declare-fun m!771365 () Bool)

(assert (=> b!828871 m!771365))

(declare-fun m!771367 () Bool)

(assert (=> bm!36067 m!771367))

(assert (=> b!828866 m!771231))

(declare-fun m!771369 () Bool)

(assert (=> b!828866 m!771369))

(declare-fun m!771371 () Bool)

(assert (=> b!828866 m!771371))

(declare-fun m!771373 () Bool)

(assert (=> b!828866 m!771373))

(declare-fun m!771375 () Bool)

(assert (=> b!828866 m!771375))

(declare-fun m!771377 () Bool)

(assert (=> b!828866 m!771377))

(declare-fun m!771379 () Bool)

(assert (=> b!828866 m!771379))

(declare-fun m!771381 () Bool)

(assert (=> b!828866 m!771381))

(declare-fun m!771383 () Bool)

(assert (=> b!828866 m!771383))

(assert (=> b!828866 m!771369))

(declare-fun m!771385 () Bool)

(assert (=> b!828866 m!771385))

(declare-fun m!771387 () Bool)

(assert (=> b!828866 m!771387))

(declare-fun m!771389 () Bool)

(assert (=> b!828866 m!771389))

(declare-fun m!771391 () Bool)

(assert (=> b!828866 m!771391))

(assert (=> b!828866 m!771375))

(declare-fun m!771393 () Bool)

(assert (=> b!828866 m!771393))

(declare-fun m!771395 () Bool)

(assert (=> b!828866 m!771395))

(assert (=> b!828866 m!771289))

(assert (=> b!828866 m!771379))

(declare-fun m!771397 () Bool)

(assert (=> b!828866 m!771397))

(assert (=> b!828866 m!771389))

(assert (=> b!828869 m!771289))

(assert (=> b!828869 m!771289))

(assert (=> b!828869 m!771303))

(assert (=> b!828740 d!105033))

(declare-fun d!105035 () Bool)

(assert (=> d!105035 (= (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375683 () Unit!28347)

(declare-fun choose!1421 (array!46477 array!46479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25227 V!25227 V!25227 V!25227 (_ BitVec 32) Int) Unit!28347)

(assert (=> d!105035 (= lt!375683 (choose!1421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105035 (validMask!0 mask!1312)))

(assert (=> d!105035 (= (lemmaNoChangeToArrayThenSameMapNoExtras!587 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375683)))

(declare-fun bs!23130 () Bool)

(assert (= bs!23130 d!105035))

(assert (=> bs!23130 m!771233))

(assert (=> bs!23130 m!771231))

(declare-fun m!771399 () Bool)

(assert (=> bs!23130 m!771399))

(assert (=> bs!23130 m!771213))

(assert (=> b!828735 d!105035))

(declare-fun b!828907 () Bool)

(declare-fun e!461981 () Bool)

(declare-fun e!461978 () Bool)

(assert (=> b!828907 (= e!461981 e!461978)))

(declare-fun c!89645 () Bool)

(assert (=> b!828907 (= c!89645 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828908 () Bool)

(declare-fun lt!375701 () Unit!28347)

(declare-fun lt!375702 () Unit!28347)

(assert (=> b!828908 (= lt!375701 lt!375702)))

(declare-fun lt!375700 () (_ BitVec 64))

(declare-fun lt!375699 () ListLongMap!8945)

(declare-fun lt!375703 () V!25227)

(declare-fun lt!375704 () (_ BitVec 64))

(assert (=> b!828908 (not (contains!4175 (+!1998 lt!375699 (tuple2!10133 lt!375704 lt!375703)) lt!375700))))

(declare-fun addStillNotContains!194 (ListLongMap!8945 (_ BitVec 64) V!25227 (_ BitVec 64)) Unit!28347)

(assert (=> b!828908 (= lt!375702 (addStillNotContains!194 lt!375699 lt!375704 lt!375703 lt!375700))))

(assert (=> b!828908 (= lt!375700 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828908 (= lt!375703 (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828908 (= lt!375704 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36075 () ListLongMap!8945)

(assert (=> b!828908 (= lt!375699 call!36075)))

(declare-fun e!461984 () ListLongMap!8945)

(assert (=> b!828908 (= e!461984 (+!1998 call!36075 (tuple2!10133 (select (arr!22279 _keys!976) #b00000000000000000000000000000000) (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828909 () Bool)

(declare-fun lt!375698 () ListLongMap!8945)

(declare-fun isEmpty!655 (ListLongMap!8945) Bool)

(assert (=> b!828909 (= e!461978 (isEmpty!655 lt!375698))))

(declare-fun b!828910 () Bool)

(assert (=> b!828910 (= e!461978 (= lt!375698 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!105037 () Bool)

(declare-fun e!461980 () Bool)

(assert (=> d!105037 e!461980))

(declare-fun res!564783 () Bool)

(assert (=> d!105037 (=> (not res!564783) (not e!461980))))

(assert (=> d!105037 (= res!564783 (not (contains!4175 lt!375698 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461983 () ListLongMap!8945)

(assert (=> d!105037 (= lt!375698 e!461983)))

(declare-fun c!89647 () Bool)

(assert (=> d!105037 (= c!89647 (bvsge #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> d!105037 (validMask!0 mask!1312)))

(assert (=> d!105037 (= (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375698)))

(declare-fun b!828911 () Bool)

(assert (=> b!828911 (= e!461983 e!461984)))

(declare-fun c!89646 () Bool)

(assert (=> b!828911 (= c!89646 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828912 () Bool)

(assert (=> b!828912 (= e!461984 call!36075)))

(declare-fun bm!36072 () Bool)

(assert (=> bm!36072 (= call!36075 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828913 () Bool)

(declare-fun e!461979 () Bool)

(assert (=> b!828913 (= e!461981 e!461979)))

(assert (=> b!828913 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun res!564784 () Bool)

(assert (=> b!828913 (= res!564784 (contains!4175 lt!375698 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828913 (=> (not res!564784) (not e!461979))))

(declare-fun b!828914 () Bool)

(assert (=> b!828914 (= e!461983 (ListLongMap!8946 Nil!15915))))

(declare-fun b!828915 () Bool)

(declare-fun e!461982 () Bool)

(assert (=> b!828915 (= e!461982 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828915 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828916 () Bool)

(declare-fun res!564782 () Bool)

(assert (=> b!828916 (=> (not res!564782) (not e!461980))))

(assert (=> b!828916 (= res!564782 (not (contains!4175 lt!375698 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828917 () Bool)

(assert (=> b!828917 (= e!461980 e!461981)))

(declare-fun c!89648 () Bool)

(assert (=> b!828917 (= c!89648 e!461982)))

(declare-fun res!564781 () Bool)

(assert (=> b!828917 (=> (not res!564781) (not e!461982))))

(assert (=> b!828917 (= res!564781 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828918 () Bool)

(assert (=> b!828918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> b!828918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22701 _values!788)))))

(assert (=> b!828918 (= e!461979 (= (apply!368 lt!375698 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!105037 c!89647) b!828914))

(assert (= (and d!105037 (not c!89647)) b!828911))

(assert (= (and b!828911 c!89646) b!828908))

(assert (= (and b!828911 (not c!89646)) b!828912))

(assert (= (or b!828908 b!828912) bm!36072))

(assert (= (and d!105037 res!564783) b!828916))

(assert (= (and b!828916 res!564782) b!828917))

(assert (= (and b!828917 res!564781) b!828915))

(assert (= (and b!828917 c!89648) b!828913))

(assert (= (and b!828917 (not c!89648)) b!828907))

(assert (= (and b!828913 res!564784) b!828918))

(assert (= (and b!828907 c!89645) b!828910))

(assert (= (and b!828907 (not c!89645)) b!828909))

(declare-fun b_lambda!11237 () Bool)

(assert (=> (not b_lambda!11237) (not b!828908)))

(assert (=> b!828908 t!22271))

(declare-fun b_and!22425 () Bool)

(assert (= b_and!22423 (and (=> t!22271 result!7983) b_and!22425)))

(declare-fun b_lambda!11239 () Bool)

(assert (=> (not b_lambda!11239) (not b!828918)))

(assert (=> b!828918 t!22271))

(declare-fun b_and!22427 () Bool)

(assert (= b_and!22425 (and (=> t!22271 result!7983) b_and!22427)))

(declare-fun m!771401 () Bool)

(assert (=> d!105037 m!771401))

(assert (=> d!105037 m!771213))

(assert (=> b!828915 m!771289))

(assert (=> b!828915 m!771289))

(assert (=> b!828915 m!771303))

(assert (=> b!828908 m!771291))

(assert (=> b!828908 m!771289))

(assert (=> b!828908 m!771295))

(assert (=> b!828908 m!771291))

(assert (=> b!828908 m!771297))

(declare-fun m!771403 () Bool)

(assert (=> b!828908 m!771403))

(declare-fun m!771405 () Bool)

(assert (=> b!828908 m!771405))

(assert (=> b!828908 m!771405))

(declare-fun m!771407 () Bool)

(assert (=> b!828908 m!771407))

(assert (=> b!828908 m!771295))

(declare-fun m!771409 () Bool)

(assert (=> b!828908 m!771409))

(declare-fun m!771411 () Bool)

(assert (=> bm!36072 m!771411))

(assert (=> b!828918 m!771291))

(assert (=> b!828918 m!771289))

(assert (=> b!828918 m!771295))

(assert (=> b!828918 m!771291))

(assert (=> b!828918 m!771297))

(assert (=> b!828918 m!771295))

(assert (=> b!828918 m!771289))

(declare-fun m!771413 () Bool)

(assert (=> b!828918 m!771413))

(assert (=> b!828911 m!771289))

(assert (=> b!828911 m!771289))

(assert (=> b!828911 m!771303))

(declare-fun m!771415 () Bool)

(assert (=> b!828909 m!771415))

(declare-fun m!771417 () Bool)

(assert (=> b!828916 m!771417))

(assert (=> b!828910 m!771411))

(assert (=> b!828913 m!771289))

(assert (=> b!828913 m!771289))

(declare-fun m!771419 () Bool)

(assert (=> b!828913 m!771419))

(assert (=> b!828735 d!105037))

(declare-fun b!828919 () Bool)

(declare-fun e!461988 () Bool)

(declare-fun e!461985 () Bool)

(assert (=> b!828919 (= e!461988 e!461985)))

(declare-fun c!89649 () Bool)

(assert (=> b!828919 (= c!89649 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828920 () Bool)

(declare-fun lt!375708 () Unit!28347)

(declare-fun lt!375709 () Unit!28347)

(assert (=> b!828920 (= lt!375708 lt!375709)))

(declare-fun lt!375710 () V!25227)

(declare-fun lt!375707 () (_ BitVec 64))

(declare-fun lt!375706 () ListLongMap!8945)

(declare-fun lt!375711 () (_ BitVec 64))

(assert (=> b!828920 (not (contains!4175 (+!1998 lt!375706 (tuple2!10133 lt!375711 lt!375710)) lt!375707))))

(assert (=> b!828920 (= lt!375709 (addStillNotContains!194 lt!375706 lt!375711 lt!375710 lt!375707))))

(assert (=> b!828920 (= lt!375707 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828920 (= lt!375710 (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828920 (= lt!375711 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!36076 () ListLongMap!8945)

(assert (=> b!828920 (= lt!375706 call!36076)))

(declare-fun e!461991 () ListLongMap!8945)

(assert (=> b!828920 (= e!461991 (+!1998 call!36076 (tuple2!10133 (select (arr!22279 _keys!976) #b00000000000000000000000000000000) (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828921 () Bool)

(declare-fun lt!375705 () ListLongMap!8945)

(assert (=> b!828921 (= e!461985 (isEmpty!655 lt!375705))))

(declare-fun b!828922 () Bool)

(assert (=> b!828922 (= e!461985 (= lt!375705 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun d!105039 () Bool)

(declare-fun e!461987 () Bool)

(assert (=> d!105039 e!461987))

(declare-fun res!564787 () Bool)

(assert (=> d!105039 (=> (not res!564787) (not e!461987))))

(assert (=> d!105039 (= res!564787 (not (contains!4175 lt!375705 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461990 () ListLongMap!8945)

(assert (=> d!105039 (= lt!375705 e!461990)))

(declare-fun c!89651 () Bool)

(assert (=> d!105039 (= c!89651 (bvsge #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> d!105039 (validMask!0 mask!1312)))

(assert (=> d!105039 (= (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375705)))

(declare-fun b!828923 () Bool)

(assert (=> b!828923 (= e!461990 e!461991)))

(declare-fun c!89650 () Bool)

(assert (=> b!828923 (= c!89650 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828924 () Bool)

(assert (=> b!828924 (= e!461991 call!36076)))

(declare-fun bm!36073 () Bool)

(assert (=> bm!36073 (= call!36076 (getCurrentListMapNoExtraKeys!2517 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!828925 () Bool)

(declare-fun e!461986 () Bool)

(assert (=> b!828925 (= e!461988 e!461986)))

(assert (=> b!828925 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun res!564788 () Bool)

(assert (=> b!828925 (= res!564788 (contains!4175 lt!375705 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828925 (=> (not res!564788) (not e!461986))))

(declare-fun b!828926 () Bool)

(assert (=> b!828926 (= e!461990 (ListLongMap!8946 Nil!15915))))

(declare-fun b!828927 () Bool)

(declare-fun e!461989 () Bool)

(assert (=> b!828927 (= e!461989 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828927 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828928 () Bool)

(declare-fun res!564786 () Bool)

(assert (=> b!828928 (=> (not res!564786) (not e!461987))))

(assert (=> b!828928 (= res!564786 (not (contains!4175 lt!375705 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828929 () Bool)

(assert (=> b!828929 (= e!461987 e!461988)))

(declare-fun c!89652 () Bool)

(assert (=> b!828929 (= c!89652 e!461989)))

(declare-fun res!564785 () Bool)

(assert (=> b!828929 (=> (not res!564785) (not e!461989))))

(assert (=> b!828929 (= res!564785 (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(declare-fun b!828930 () Bool)

(assert (=> b!828930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> b!828930 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22701 _values!788)))))

(assert (=> b!828930 (= e!461986 (= (apply!368 lt!375705 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)) (get!11807 (select (arr!22280 _values!788) #b00000000000000000000000000000000) (dynLambda!982 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!105039 c!89651) b!828926))

(assert (= (and d!105039 (not c!89651)) b!828923))

(assert (= (and b!828923 c!89650) b!828920))

(assert (= (and b!828923 (not c!89650)) b!828924))

(assert (= (or b!828920 b!828924) bm!36073))

(assert (= (and d!105039 res!564787) b!828928))

(assert (= (and b!828928 res!564786) b!828929))

(assert (= (and b!828929 res!564785) b!828927))

(assert (= (and b!828929 c!89652) b!828925))

(assert (= (and b!828929 (not c!89652)) b!828919))

(assert (= (and b!828925 res!564788) b!828930))

(assert (= (and b!828919 c!89649) b!828922))

(assert (= (and b!828919 (not c!89649)) b!828921))

(declare-fun b_lambda!11241 () Bool)

(assert (=> (not b_lambda!11241) (not b!828920)))

(assert (=> b!828920 t!22271))

(declare-fun b_and!22429 () Bool)

(assert (= b_and!22427 (and (=> t!22271 result!7983) b_and!22429)))

(declare-fun b_lambda!11243 () Bool)

(assert (=> (not b_lambda!11243) (not b!828930)))

(assert (=> b!828930 t!22271))

(declare-fun b_and!22431 () Bool)

(assert (= b_and!22429 (and (=> t!22271 result!7983) b_and!22431)))

(declare-fun m!771421 () Bool)

(assert (=> d!105039 m!771421))

(assert (=> d!105039 m!771213))

(assert (=> b!828927 m!771289))

(assert (=> b!828927 m!771289))

(assert (=> b!828927 m!771303))

(assert (=> b!828920 m!771291))

(assert (=> b!828920 m!771289))

(assert (=> b!828920 m!771295))

(assert (=> b!828920 m!771291))

(assert (=> b!828920 m!771297))

(declare-fun m!771423 () Bool)

(assert (=> b!828920 m!771423))

(declare-fun m!771425 () Bool)

(assert (=> b!828920 m!771425))

(assert (=> b!828920 m!771425))

(declare-fun m!771427 () Bool)

(assert (=> b!828920 m!771427))

(assert (=> b!828920 m!771295))

(declare-fun m!771429 () Bool)

(assert (=> b!828920 m!771429))

(declare-fun m!771431 () Bool)

(assert (=> bm!36073 m!771431))

(assert (=> b!828930 m!771291))

(assert (=> b!828930 m!771289))

(assert (=> b!828930 m!771295))

(assert (=> b!828930 m!771291))

(assert (=> b!828930 m!771297))

(assert (=> b!828930 m!771295))

(assert (=> b!828930 m!771289))

(declare-fun m!771433 () Bool)

(assert (=> b!828930 m!771433))

(assert (=> b!828923 m!771289))

(assert (=> b!828923 m!771289))

(assert (=> b!828923 m!771303))

(declare-fun m!771435 () Bool)

(assert (=> b!828921 m!771435))

(declare-fun m!771437 () Bool)

(assert (=> b!828928 m!771437))

(assert (=> b!828922 m!771431))

(assert (=> b!828925 m!771289))

(assert (=> b!828925 m!771289))

(declare-fun m!771439 () Bool)

(assert (=> b!828925 m!771439))

(assert (=> b!828735 d!105039))

(declare-fun d!105041 () Bool)

(assert (=> d!105041 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71358 d!105041))

(declare-fun d!105043 () Bool)

(assert (=> d!105043 (= (array_inv!17811 _keys!976) (bvsge (size!22700 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71358 d!105043))

(declare-fun d!105045 () Bool)

(assert (=> d!105045 (= (array_inv!17812 _values!788) (bvsge (size!22701 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71358 d!105045))

(declare-fun b!828941 () Bool)

(declare-fun e!462002 () Bool)

(declare-fun call!36079 () Bool)

(assert (=> b!828941 (= e!462002 call!36079)))

(declare-fun b!828942 () Bool)

(declare-fun e!462001 () Bool)

(assert (=> b!828942 (= e!462001 e!462002)))

(declare-fun c!89655 () Bool)

(assert (=> b!828942 (= c!89655 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828943 () Bool)

(assert (=> b!828943 (= e!462002 call!36079)))

(declare-fun b!828944 () Bool)

(declare-fun e!462000 () Bool)

(declare-fun contains!4177 (List!15919 (_ BitVec 64)) Bool)

(assert (=> b!828944 (= e!462000 (contains!4177 Nil!15916 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36076 () Bool)

(assert (=> bm!36076 (= call!36079 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89655 (Cons!15915 (select (arr!22279 _keys!976) #b00000000000000000000000000000000) Nil!15916) Nil!15916)))))

(declare-fun b!828945 () Bool)

(declare-fun e!462003 () Bool)

(assert (=> b!828945 (= e!462003 e!462001)))

(declare-fun res!564797 () Bool)

(assert (=> b!828945 (=> (not res!564797) (not e!462001))))

(assert (=> b!828945 (= res!564797 (not e!462000))))

(declare-fun res!564795 () Bool)

(assert (=> b!828945 (=> (not res!564795) (not e!462000))))

(assert (=> b!828945 (= res!564795 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105047 () Bool)

(declare-fun res!564796 () Bool)

(assert (=> d!105047 (=> res!564796 e!462003)))

(assert (=> d!105047 (= res!564796 (bvsge #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> d!105047 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15916) e!462003)))

(assert (= (and d!105047 (not res!564796)) b!828945))

(assert (= (and b!828945 res!564795) b!828944))

(assert (= (and b!828945 res!564797) b!828942))

(assert (= (and b!828942 c!89655) b!828941))

(assert (= (and b!828942 (not c!89655)) b!828943))

(assert (= (or b!828941 b!828943) bm!36076))

(assert (=> b!828942 m!771289))

(assert (=> b!828942 m!771289))

(assert (=> b!828942 m!771303))

(assert (=> b!828944 m!771289))

(assert (=> b!828944 m!771289))

(declare-fun m!771441 () Bool)

(assert (=> b!828944 m!771441))

(assert (=> bm!36076 m!771289))

(declare-fun m!771443 () Bool)

(assert (=> bm!36076 m!771443))

(assert (=> b!828945 m!771289))

(assert (=> b!828945 m!771289))

(assert (=> b!828945 m!771303))

(assert (=> b!828737 d!105047))

(declare-fun b!828954 () Bool)

(declare-fun e!462010 () Bool)

(declare-fun e!462011 () Bool)

(assert (=> b!828954 (= e!462010 e!462011)))

(declare-fun lt!375719 () (_ BitVec 64))

(assert (=> b!828954 (= lt!375719 (select (arr!22279 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375720 () Unit!28347)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46477 (_ BitVec 64) (_ BitVec 32)) Unit!28347)

(assert (=> b!828954 (= lt!375720 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375719 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828954 (arrayContainsKey!0 _keys!976 lt!375719 #b00000000000000000000000000000000)))

(declare-fun lt!375718 () Unit!28347)

(assert (=> b!828954 (= lt!375718 lt!375720)))

(declare-fun res!564803 () Bool)

(declare-datatypes ((SeekEntryResult!8736 0))(
  ( (MissingZero!8736 (index!37315 (_ BitVec 32))) (Found!8736 (index!37316 (_ BitVec 32))) (Intermediate!8736 (undefined!9548 Bool) (index!37317 (_ BitVec 32)) (x!70004 (_ BitVec 32))) (Undefined!8736) (MissingVacant!8736 (index!37318 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46477 (_ BitVec 32)) SeekEntryResult!8736)

(assert (=> b!828954 (= res!564803 (= (seekEntryOrOpen!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8736 #b00000000000000000000000000000000)))))

(assert (=> b!828954 (=> (not res!564803) (not e!462011))))

(declare-fun b!828955 () Bool)

(declare-fun call!36082 () Bool)

(assert (=> b!828955 (= e!462010 call!36082)))

(declare-fun d!105049 () Bool)

(declare-fun res!564802 () Bool)

(declare-fun e!462012 () Bool)

(assert (=> d!105049 (=> res!564802 e!462012)))

(assert (=> d!105049 (= res!564802 (bvsge #b00000000000000000000000000000000 (size!22700 _keys!976)))))

(assert (=> d!105049 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462012)))

(declare-fun bm!36079 () Bool)

(assert (=> bm!36079 (= call!36082 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828956 () Bool)

(assert (=> b!828956 (= e!462011 call!36082)))

(declare-fun b!828957 () Bool)

(assert (=> b!828957 (= e!462012 e!462010)))

(declare-fun c!89658 () Bool)

(assert (=> b!828957 (= c!89658 (validKeyInArray!0 (select (arr!22279 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105049 (not res!564802)) b!828957))

(assert (= (and b!828957 c!89658) b!828954))

(assert (= (and b!828957 (not c!89658)) b!828955))

(assert (= (and b!828954 res!564803) b!828956))

(assert (= (or b!828956 b!828955) bm!36079))

(assert (=> b!828954 m!771289))

(declare-fun m!771445 () Bool)

(assert (=> b!828954 m!771445))

(declare-fun m!771447 () Bool)

(assert (=> b!828954 m!771447))

(assert (=> b!828954 m!771289))

(declare-fun m!771449 () Bool)

(assert (=> b!828954 m!771449))

(declare-fun m!771451 () Bool)

(assert (=> bm!36079 m!771451))

(assert (=> b!828957 m!771289))

(assert (=> b!828957 m!771289))

(assert (=> b!828957 m!771303))

(assert (=> b!828742 d!105049))

(declare-fun mapNonEmpty!24403 () Bool)

(declare-fun mapRes!24403 () Bool)

(declare-fun tp!47167 () Bool)

(declare-fun e!462017 () Bool)

(assert (=> mapNonEmpty!24403 (= mapRes!24403 (and tp!47167 e!462017))))

(declare-fun mapRest!24403 () (Array (_ BitVec 32) ValueCell!7169))

(declare-fun mapValue!24403 () ValueCell!7169)

(declare-fun mapKey!24403 () (_ BitVec 32))

(assert (=> mapNonEmpty!24403 (= mapRest!24394 (store mapRest!24403 mapKey!24403 mapValue!24403))))

(declare-fun b!828964 () Bool)

(assert (=> b!828964 (= e!462017 tp_is_empty!15169)))

(declare-fun mapIsEmpty!24403 () Bool)

(assert (=> mapIsEmpty!24403 mapRes!24403))

(declare-fun condMapEmpty!24403 () Bool)

(declare-fun mapDefault!24403 () ValueCell!7169)

(assert (=> mapNonEmpty!24394 (= condMapEmpty!24403 (= mapRest!24394 ((as const (Array (_ BitVec 32) ValueCell!7169)) mapDefault!24403)))))

(declare-fun e!462018 () Bool)

(assert (=> mapNonEmpty!24394 (= tp!47152 (and e!462018 mapRes!24403))))

(declare-fun b!828965 () Bool)

(assert (=> b!828965 (= e!462018 tp_is_empty!15169)))

(assert (= (and mapNonEmpty!24394 condMapEmpty!24403) mapIsEmpty!24403))

(assert (= (and mapNonEmpty!24394 (not condMapEmpty!24403)) mapNonEmpty!24403))

(assert (= (and mapNonEmpty!24403 ((_ is ValueCellFull!7169) mapValue!24403)) b!828964))

(assert (= (and mapNonEmpty!24394 ((_ is ValueCellFull!7169) mapDefault!24403)) b!828965))

(declare-fun m!771453 () Bool)

(assert (=> mapNonEmpty!24403 m!771453))

(declare-fun b_lambda!11245 () Bool)

(assert (= b_lambda!11235 (or (and start!71358 b_free!13459) b_lambda!11245)))

(declare-fun b_lambda!11247 () Bool)

(assert (= b_lambda!11241 (or (and start!71358 b_free!13459) b_lambda!11247)))

(declare-fun b_lambda!11249 () Bool)

(assert (= b_lambda!11239 (or (and start!71358 b_free!13459) b_lambda!11249)))

(declare-fun b_lambda!11251 () Bool)

(assert (= b_lambda!11237 (or (and start!71358 b_free!13459) b_lambda!11251)))

(declare-fun b_lambda!11253 () Bool)

(assert (= b_lambda!11243 (or (and start!71358 b_free!13459) b_lambda!11253)))

(declare-fun b_lambda!11255 () Bool)

(assert (= b_lambda!11233 (or (and start!71358 b_free!13459) b_lambda!11255)))

(check-sat (not d!105035) (not b!828860) (not b_lambda!11251) (not b!828913) (not b!828918) (not bm!36069) (not b!828957) (not b!828838) (not b!828930) (not bm!36065) (not b_lambda!11245) (not bm!36062) tp_is_empty!15169 (not b!828920) (not b_lambda!11253) (not bm!36079) (not bm!36067) (not b!828911) (not b!828840) (not b!828922) (not bm!36076) (not b!828866) (not bm!36060) (not bm!36056) (not b_next!13459) (not d!105033) (not bm!36063) (not bm!36072) (not b!828945) (not b!828845) (not b!828954) (not b!828923) (not b!828909) (not b!828874) (not b_lambda!11255) (not b_lambda!11247) (not b!828868) (not b!828850) (not b!828863) (not bm!36058) (not b!828927) (not b!828910) (not b!828942) (not b!828944) (not b!828921) (not d!105037) (not b!828861) (not b!828879) (not b!828837) (not b!828834) (not b!828915) (not b!828925) (not b!828842) (not b!828871) (not b_lambda!11249) (not b!828867) (not d!105039) (not b!828928) (not b!828869) (not b!828908) (not bm!36073) b_and!22431 (not d!105029) (not b!828839) (not mapNonEmpty!24403) (not b!828916) (not d!105031))
(check-sat b_and!22431 (not b_next!13459))
