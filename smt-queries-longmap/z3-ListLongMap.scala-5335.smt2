; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71250 () Bool)

(assert start!71250)

(declare-fun b_free!13417 () Bool)

(declare-fun b_next!13417 () Bool)

(assert (=> start!71250 (= b_free!13417 (not b_next!13417))))

(declare-fun tp!47013 () Bool)

(declare-fun b_and!22329 () Bool)

(assert (=> start!71250 (= tp!47013 b_and!22329)))

(declare-fun res!564091 () Bool)

(declare-fun e!461066 () Bool)

(assert (=> start!71250 (=> (not res!564091) (not e!461066))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71250 (= res!564091 (validMask!0 mask!1312))))

(assert (=> start!71250 e!461066))

(declare-fun tp_is_empty!15127 () Bool)

(assert (=> start!71250 tp_is_empty!15127))

(declare-datatypes ((array!46389 0))(
  ( (array!46390 (arr!22239 (Array (_ BitVec 32) (_ BitVec 64))) (size!22660 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46389)

(declare-fun array_inv!17779 (array!46389) Bool)

(assert (=> start!71250 (array_inv!17779 _keys!976)))

(assert (=> start!71250 true))

(declare-datatypes ((V!25171 0))(
  ( (V!25172 (val!7611 Int)) )
))
(declare-datatypes ((ValueCell!7148 0))(
  ( (ValueCellFull!7148 (v!10040 V!25171)) (EmptyCell!7148) )
))
(declare-datatypes ((array!46391 0))(
  ( (array!46392 (arr!22240 (Array (_ BitVec 32) ValueCell!7148)) (size!22661 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46391)

(declare-fun e!461067 () Bool)

(declare-fun array_inv!17780 (array!46391) Bool)

(assert (=> start!71250 (and (array_inv!17780 _values!788) e!461067)))

(assert (=> start!71250 tp!47013))

(declare-fun b!827581 () Bool)

(declare-fun e!461065 () Bool)

(declare-fun mapRes!24319 () Bool)

(assert (=> b!827581 (= e!461067 (and e!461065 mapRes!24319))))

(declare-fun condMapEmpty!24319 () Bool)

(declare-fun mapDefault!24319 () ValueCell!7148)

(assert (=> b!827581 (= condMapEmpty!24319 (= (arr!22240 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7148)) mapDefault!24319)))))

(declare-fun b!827582 () Bool)

(assert (=> b!827582 (= e!461066 (bvsgt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-datatypes ((tuple2!10098 0))(
  ( (tuple2!10099 (_1!5060 (_ BitVec 64)) (_2!5060 V!25171)) )
))
(declare-datatypes ((List!15885 0))(
  ( (Nil!15882) (Cons!15881 (h!17010 tuple2!10098) (t!22225 List!15885)) )
))
(declare-datatypes ((ListLongMap!8911 0))(
  ( (ListLongMap!8912 (toList!4471 List!15885)) )
))
(declare-fun lt!374774 () ListLongMap!8911)

(declare-fun zeroValueAfter!34 () V!25171)

(declare-fun minValue!754 () V!25171)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2503 (array!46389 array!46391 (_ BitVec 32) (_ BitVec 32) V!25171 V!25171 (_ BitVec 32) Int) ListLongMap!8911)

(assert (=> b!827582 (= lt!374774 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25171)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374773 () ListLongMap!8911)

(assert (=> b!827582 (= lt!374773 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24319 () Bool)

(assert (=> mapIsEmpty!24319 mapRes!24319))

(declare-fun b!827583 () Bool)

(declare-fun e!461069 () Bool)

(assert (=> b!827583 (= e!461069 tp_is_empty!15127)))

(declare-fun mapNonEmpty!24319 () Bool)

(declare-fun tp!47014 () Bool)

(assert (=> mapNonEmpty!24319 (= mapRes!24319 (and tp!47014 e!461069))))

(declare-fun mapRest!24319 () (Array (_ BitVec 32) ValueCell!7148))

(declare-fun mapKey!24319 () (_ BitVec 32))

(declare-fun mapValue!24319 () ValueCell!7148)

(assert (=> mapNonEmpty!24319 (= (arr!22240 _values!788) (store mapRest!24319 mapKey!24319 mapValue!24319))))

(declare-fun b!827584 () Bool)

(declare-fun res!564092 () Bool)

(assert (=> b!827584 (=> (not res!564092) (not e!461066))))

(assert (=> b!827584 (= res!564092 (and (= (size!22661 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22660 _keys!976) (size!22661 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827585 () Bool)

(declare-fun res!564093 () Bool)

(assert (=> b!827585 (=> (not res!564093) (not e!461066))))

(declare-datatypes ((List!15886 0))(
  ( (Nil!15883) (Cons!15882 (h!17011 (_ BitVec 64)) (t!22226 List!15886)) )
))
(declare-fun arrayNoDuplicates!0 (array!46389 (_ BitVec 32) List!15886) Bool)

(assert (=> b!827585 (= res!564093 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15883))))

(declare-fun b!827586 () Bool)

(assert (=> b!827586 (= e!461065 tp_is_empty!15127)))

(declare-fun b!827587 () Bool)

(declare-fun res!564094 () Bool)

(assert (=> b!827587 (=> (not res!564094) (not e!461066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46389 (_ BitVec 32)) Bool)

(assert (=> b!827587 (= res!564094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71250 res!564091) b!827584))

(assert (= (and b!827584 res!564092) b!827587))

(assert (= (and b!827587 res!564094) b!827585))

(assert (= (and b!827585 res!564093) b!827582))

(assert (= (and b!827581 condMapEmpty!24319) mapIsEmpty!24319))

(assert (= (and b!827581 (not condMapEmpty!24319)) mapNonEmpty!24319))

(get-info :version)

(assert (= (and mapNonEmpty!24319 ((_ is ValueCellFull!7148) mapValue!24319)) b!827583))

(assert (= (and b!827581 ((_ is ValueCellFull!7148) mapDefault!24319)) b!827586))

(assert (= start!71250 b!827581))

(declare-fun m!770063 () Bool)

(assert (=> b!827582 m!770063))

(declare-fun m!770065 () Bool)

(assert (=> b!827582 m!770065))

(declare-fun m!770067 () Bool)

(assert (=> mapNonEmpty!24319 m!770067))

(declare-fun m!770069 () Bool)

(assert (=> b!827585 m!770069))

(declare-fun m!770071 () Bool)

(assert (=> start!71250 m!770071))

(declare-fun m!770073 () Bool)

(assert (=> start!71250 m!770073))

(declare-fun m!770075 () Bool)

(assert (=> start!71250 m!770075))

(declare-fun m!770077 () Bool)

(assert (=> b!827587 m!770077))

(check-sat (not mapNonEmpty!24319) (not b!827582) (not b!827585) tp_is_empty!15127 b_and!22329 (not b_next!13417) (not start!71250) (not b!827587))
(check-sat b_and!22329 (not b_next!13417))
(get-model)

(declare-fun d!104933 () Bool)

(assert (=> d!104933 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71250 d!104933))

(declare-fun d!104935 () Bool)

(assert (=> d!104935 (= (array_inv!17779 _keys!976) (bvsge (size!22660 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71250 d!104935))

(declare-fun d!104937 () Bool)

(assert (=> d!104937 (= (array_inv!17780 _values!788) (bvsge (size!22661 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71250 d!104937))

(declare-fun b!827638 () Bool)

(declare-fun e!461107 () Bool)

(declare-fun e!461106 () Bool)

(assert (=> b!827638 (= e!461107 e!461106)))

(declare-fun c!89455 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!827638 (= c!89455 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35920 () Bool)

(declare-fun call!35923 () Bool)

(assert (=> bm!35920 (= call!35923 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!827639 () Bool)

(assert (=> b!827639 (= e!461106 call!35923)))

(declare-fun b!827640 () Bool)

(declare-fun e!461108 () Bool)

(assert (=> b!827640 (= e!461106 e!461108)))

(declare-fun lt!374795 () (_ BitVec 64))

(assert (=> b!827640 (= lt!374795 (select (arr!22239 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28315 0))(
  ( (Unit!28316) )
))
(declare-fun lt!374794 () Unit!28315)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46389 (_ BitVec 64) (_ BitVec 32)) Unit!28315)

(assert (=> b!827640 (= lt!374794 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!374795 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!827640 (arrayContainsKey!0 _keys!976 lt!374795 #b00000000000000000000000000000000)))

(declare-fun lt!374793 () Unit!28315)

(assert (=> b!827640 (= lt!374793 lt!374794)))

(declare-fun res!564124 () Bool)

(declare-datatypes ((SeekEntryResult!8732 0))(
  ( (MissingZero!8732 (index!37299 (_ BitVec 32))) (Found!8732 (index!37300 (_ BitVec 32))) (Intermediate!8732 (undefined!9544 Bool) (index!37301 (_ BitVec 32)) (x!69900 (_ BitVec 32))) (Undefined!8732) (MissingVacant!8732 (index!37302 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46389 (_ BitVec 32)) SeekEntryResult!8732)

(assert (=> b!827640 (= res!564124 (= (seekEntryOrOpen!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8732 #b00000000000000000000000000000000)))))

(assert (=> b!827640 (=> (not res!564124) (not e!461108))))

(declare-fun b!827641 () Bool)

(assert (=> b!827641 (= e!461108 call!35923)))

(declare-fun d!104939 () Bool)

(declare-fun res!564123 () Bool)

(assert (=> d!104939 (=> res!564123 e!461107)))

(assert (=> d!104939 (= res!564123 (bvsge #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(assert (=> d!104939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461107)))

(assert (= (and d!104939 (not res!564123)) b!827638))

(assert (= (and b!827638 c!89455) b!827640))

(assert (= (and b!827638 (not c!89455)) b!827639))

(assert (= (and b!827640 res!564124) b!827641))

(assert (= (or b!827641 b!827639) bm!35920))

(declare-fun m!770111 () Bool)

(assert (=> b!827638 m!770111))

(assert (=> b!827638 m!770111))

(declare-fun m!770113 () Bool)

(assert (=> b!827638 m!770113))

(declare-fun m!770115 () Bool)

(assert (=> bm!35920 m!770115))

(assert (=> b!827640 m!770111))

(declare-fun m!770117 () Bool)

(assert (=> b!827640 m!770117))

(declare-fun m!770119 () Bool)

(assert (=> b!827640 m!770119))

(assert (=> b!827640 m!770111))

(declare-fun m!770121 () Bool)

(assert (=> b!827640 m!770121))

(assert (=> b!827587 d!104939))

(declare-fun d!104941 () Bool)

(declare-fun res!564131 () Bool)

(declare-fun e!461119 () Bool)

(assert (=> d!104941 (=> res!564131 e!461119)))

(assert (=> d!104941 (= res!564131 (bvsge #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(assert (=> d!104941 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15883) e!461119)))

(declare-fun bm!35923 () Bool)

(declare-fun call!35926 () Bool)

(declare-fun c!89458 () Bool)

(assert (=> bm!35923 (= call!35926 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89458 (Cons!15882 (select (arr!22239 _keys!976) #b00000000000000000000000000000000) Nil!15883) Nil!15883)))))

(declare-fun b!827652 () Bool)

(declare-fun e!461118 () Bool)

(assert (=> b!827652 (= e!461118 call!35926)))

(declare-fun b!827653 () Bool)

(declare-fun e!461117 () Bool)

(assert (=> b!827653 (= e!461117 e!461118)))

(assert (=> b!827653 (= c!89458 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827654 () Bool)

(assert (=> b!827654 (= e!461118 call!35926)))

(declare-fun b!827655 () Bool)

(assert (=> b!827655 (= e!461119 e!461117)))

(declare-fun res!564133 () Bool)

(assert (=> b!827655 (=> (not res!564133) (not e!461117))))

(declare-fun e!461120 () Bool)

(assert (=> b!827655 (= res!564133 (not e!461120))))

(declare-fun res!564132 () Bool)

(assert (=> b!827655 (=> (not res!564132) (not e!461120))))

(assert (=> b!827655 (= res!564132 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827656 () Bool)

(declare-fun contains!4164 (List!15886 (_ BitVec 64)) Bool)

(assert (=> b!827656 (= e!461120 (contains!4164 Nil!15883 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104941 (not res!564131)) b!827655))

(assert (= (and b!827655 res!564132) b!827656))

(assert (= (and b!827655 res!564133) b!827653))

(assert (= (and b!827653 c!89458) b!827654))

(assert (= (and b!827653 (not c!89458)) b!827652))

(assert (= (or b!827654 b!827652) bm!35923))

(assert (=> bm!35923 m!770111))

(declare-fun m!770123 () Bool)

(assert (=> bm!35923 m!770123))

(assert (=> b!827653 m!770111))

(assert (=> b!827653 m!770111))

(assert (=> b!827653 m!770113))

(assert (=> b!827655 m!770111))

(assert (=> b!827655 m!770111))

(assert (=> b!827655 m!770113))

(assert (=> b!827656 m!770111))

(assert (=> b!827656 m!770111))

(declare-fun m!770125 () Bool)

(assert (=> b!827656 m!770125))

(assert (=> b!827585 d!104941))

(declare-fun d!104943 () Bool)

(declare-fun e!461141 () Bool)

(assert (=> d!104943 e!461141))

(declare-fun res!564144 () Bool)

(assert (=> d!104943 (=> (not res!564144) (not e!461141))))

(declare-fun lt!374811 () ListLongMap!8911)

(declare-fun contains!4165 (ListLongMap!8911 (_ BitVec 64)) Bool)

(assert (=> d!104943 (= res!564144 (not (contains!4165 lt!374811 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461135 () ListLongMap!8911)

(assert (=> d!104943 (= lt!374811 e!461135)))

(declare-fun c!89468 () Bool)

(assert (=> d!104943 (= c!89468 (bvsge #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(assert (=> d!104943 (validMask!0 mask!1312)))

(assert (=> d!104943 (= (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374811)))

(declare-fun b!827681 () Bool)

(assert (=> b!827681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(assert (=> b!827681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22661 _values!788)))))

(declare-fun e!461136 () Bool)

(declare-fun apply!364 (ListLongMap!8911 (_ BitVec 64)) V!25171)

(declare-fun get!11789 (ValueCell!7148 V!25171) V!25171)

(declare-fun dynLambda!978 (Int (_ BitVec 64)) V!25171)

(assert (=> b!827681 (= e!461136 (= (apply!364 lt!374811 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)) (get!11789 (select (arr!22240 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827682 () Bool)

(declare-fun e!461138 () Bool)

(assert (=> b!827682 (= e!461141 e!461138)))

(declare-fun c!89470 () Bool)

(declare-fun e!461137 () Bool)

(assert (=> b!827682 (= c!89470 e!461137)))

(declare-fun res!564143 () Bool)

(assert (=> b!827682 (=> (not res!564143) (not e!461137))))

(assert (=> b!827682 (= res!564143 (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-fun b!827683 () Bool)

(declare-fun e!461139 () ListLongMap!8911)

(declare-fun call!35929 () ListLongMap!8911)

(assert (=> b!827683 (= e!461139 call!35929)))

(declare-fun b!827684 () Bool)

(assert (=> b!827684 (= e!461135 (ListLongMap!8912 Nil!15882))))

(declare-fun b!827685 () Bool)

(declare-fun e!461140 () Bool)

(assert (=> b!827685 (= e!461140 (= lt!374811 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827686 () Bool)

(assert (=> b!827686 (= e!461137 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827686 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827687 () Bool)

(declare-fun lt!374816 () Unit!28315)

(declare-fun lt!374815 () Unit!28315)

(assert (=> b!827687 (= lt!374816 lt!374815)))

(declare-fun lt!374814 () (_ BitVec 64))

(declare-fun lt!374810 () (_ BitVec 64))

(declare-fun lt!374813 () V!25171)

(declare-fun lt!374812 () ListLongMap!8911)

(declare-fun +!1983 (ListLongMap!8911 tuple2!10098) ListLongMap!8911)

(assert (=> b!827687 (not (contains!4165 (+!1983 lt!374812 (tuple2!10099 lt!374814 lt!374813)) lt!374810))))

(declare-fun addStillNotContains!190 (ListLongMap!8911 (_ BitVec 64) V!25171 (_ BitVec 64)) Unit!28315)

(assert (=> b!827687 (= lt!374815 (addStillNotContains!190 lt!374812 lt!374814 lt!374813 lt!374810))))

(assert (=> b!827687 (= lt!374810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827687 (= lt!374813 (get!11789 (select (arr!22240 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827687 (= lt!374814 (select (arr!22239 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827687 (= lt!374812 call!35929)))

(assert (=> b!827687 (= e!461139 (+!1983 call!35929 (tuple2!10099 (select (arr!22239 _keys!976) #b00000000000000000000000000000000) (get!11789 (select (arr!22240 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827688 () Bool)

(assert (=> b!827688 (= e!461138 e!461136)))

(assert (=> b!827688 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-fun res!564145 () Bool)

(assert (=> b!827688 (= res!564145 (contains!4165 lt!374811 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827688 (=> (not res!564145) (not e!461136))))

(declare-fun b!827689 () Bool)

(declare-fun res!564142 () Bool)

(assert (=> b!827689 (=> (not res!564142) (not e!461141))))

(assert (=> b!827689 (= res!564142 (not (contains!4165 lt!374811 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827690 () Bool)

(assert (=> b!827690 (= e!461138 e!461140)))

(declare-fun c!89467 () Bool)

(assert (=> b!827690 (= c!89467 (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-fun bm!35926 () Bool)

(assert (=> bm!35926 (= call!35929 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827691 () Bool)

(assert (=> b!827691 (= e!461135 e!461139)))

(declare-fun c!89469 () Bool)

(assert (=> b!827691 (= c!89469 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827692 () Bool)

(declare-fun isEmpty!651 (ListLongMap!8911) Bool)

(assert (=> b!827692 (= e!461140 (isEmpty!651 lt!374811))))

(assert (= (and d!104943 c!89468) b!827684))

(assert (= (and d!104943 (not c!89468)) b!827691))

(assert (= (and b!827691 c!89469) b!827687))

(assert (= (and b!827691 (not c!89469)) b!827683))

(assert (= (or b!827687 b!827683) bm!35926))

(assert (= (and d!104943 res!564144) b!827689))

(assert (= (and b!827689 res!564142) b!827682))

(assert (= (and b!827682 res!564143) b!827686))

(assert (= (and b!827682 c!89470) b!827688))

(assert (= (and b!827682 (not c!89470)) b!827690))

(assert (= (and b!827688 res!564145) b!827681))

(assert (= (and b!827690 c!89467) b!827685))

(assert (= (and b!827690 (not c!89467)) b!827692))

(declare-fun b_lambda!11145 () Bool)

(assert (=> (not b_lambda!11145) (not b!827681)))

(declare-fun t!22230 () Bool)

(declare-fun tb!4201 () Bool)

(assert (=> (and start!71250 (= defaultEntry!796 defaultEntry!796) t!22230) tb!4201))

(declare-fun result!7959 () Bool)

(assert (=> tb!4201 (= result!7959 tp_is_empty!15127)))

(assert (=> b!827681 t!22230))

(declare-fun b_and!22335 () Bool)

(assert (= b_and!22329 (and (=> t!22230 result!7959) b_and!22335)))

(declare-fun b_lambda!11147 () Bool)

(assert (=> (not b_lambda!11147) (not b!827687)))

(assert (=> b!827687 t!22230))

(declare-fun b_and!22337 () Bool)

(assert (= b_and!22335 (and (=> t!22230 result!7959) b_and!22337)))

(declare-fun m!770127 () Bool)

(assert (=> b!827681 m!770127))

(assert (=> b!827681 m!770111))

(declare-fun m!770129 () Bool)

(assert (=> b!827681 m!770129))

(assert (=> b!827681 m!770111))

(declare-fun m!770131 () Bool)

(assert (=> b!827681 m!770131))

(assert (=> b!827681 m!770129))

(assert (=> b!827681 m!770127))

(declare-fun m!770133 () Bool)

(assert (=> b!827681 m!770133))

(declare-fun m!770135 () Bool)

(assert (=> b!827692 m!770135))

(assert (=> b!827688 m!770111))

(assert (=> b!827688 m!770111))

(declare-fun m!770137 () Bool)

(assert (=> b!827688 m!770137))

(declare-fun m!770139 () Bool)

(assert (=> b!827685 m!770139))

(assert (=> b!827686 m!770111))

(assert (=> b!827686 m!770111))

(assert (=> b!827686 m!770113))

(declare-fun m!770141 () Bool)

(assert (=> d!104943 m!770141))

(assert (=> d!104943 m!770071))

(assert (=> bm!35926 m!770139))

(declare-fun m!770143 () Bool)

(assert (=> b!827689 m!770143))

(assert (=> b!827687 m!770129))

(assert (=> b!827687 m!770127))

(assert (=> b!827687 m!770133))

(declare-fun m!770145 () Bool)

(assert (=> b!827687 m!770145))

(declare-fun m!770147 () Bool)

(assert (=> b!827687 m!770147))

(assert (=> b!827687 m!770127))

(assert (=> b!827687 m!770111))

(assert (=> b!827687 m!770129))

(declare-fun m!770149 () Bool)

(assert (=> b!827687 m!770149))

(assert (=> b!827687 m!770145))

(declare-fun m!770151 () Bool)

(assert (=> b!827687 m!770151))

(assert (=> b!827691 m!770111))

(assert (=> b!827691 m!770111))

(assert (=> b!827691 m!770113))

(assert (=> b!827582 d!104943))

(declare-fun d!104945 () Bool)

(declare-fun e!461148 () Bool)

(assert (=> d!104945 e!461148))

(declare-fun res!564148 () Bool)

(assert (=> d!104945 (=> (not res!564148) (not e!461148))))

(declare-fun lt!374818 () ListLongMap!8911)

(assert (=> d!104945 (= res!564148 (not (contains!4165 lt!374818 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461142 () ListLongMap!8911)

(assert (=> d!104945 (= lt!374818 e!461142)))

(declare-fun c!89472 () Bool)

(assert (=> d!104945 (= c!89472 (bvsge #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(assert (=> d!104945 (validMask!0 mask!1312)))

(assert (=> d!104945 (= (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374818)))

(declare-fun b!827695 () Bool)

(assert (=> b!827695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(assert (=> b!827695 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22661 _values!788)))))

(declare-fun e!461143 () Bool)

(assert (=> b!827695 (= e!461143 (= (apply!364 lt!374818 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)) (get!11789 (select (arr!22240 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827696 () Bool)

(declare-fun e!461145 () Bool)

(assert (=> b!827696 (= e!461148 e!461145)))

(declare-fun c!89474 () Bool)

(declare-fun e!461144 () Bool)

(assert (=> b!827696 (= c!89474 e!461144)))

(declare-fun res!564147 () Bool)

(assert (=> b!827696 (=> (not res!564147) (not e!461144))))

(assert (=> b!827696 (= res!564147 (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-fun b!827697 () Bool)

(declare-fun e!461146 () ListLongMap!8911)

(declare-fun call!35930 () ListLongMap!8911)

(assert (=> b!827697 (= e!461146 call!35930)))

(declare-fun b!827698 () Bool)

(assert (=> b!827698 (= e!461142 (ListLongMap!8912 Nil!15882))))

(declare-fun b!827699 () Bool)

(declare-fun e!461147 () Bool)

(assert (=> b!827699 (= e!461147 (= lt!374818 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827700 () Bool)

(assert (=> b!827700 (= e!461144 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827700 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827701 () Bool)

(declare-fun lt!374823 () Unit!28315)

(declare-fun lt!374822 () Unit!28315)

(assert (=> b!827701 (= lt!374823 lt!374822)))

(declare-fun lt!374820 () V!25171)

(declare-fun lt!374817 () (_ BitVec 64))

(declare-fun lt!374821 () (_ BitVec 64))

(declare-fun lt!374819 () ListLongMap!8911)

(assert (=> b!827701 (not (contains!4165 (+!1983 lt!374819 (tuple2!10099 lt!374821 lt!374820)) lt!374817))))

(assert (=> b!827701 (= lt!374822 (addStillNotContains!190 lt!374819 lt!374821 lt!374820 lt!374817))))

(assert (=> b!827701 (= lt!374817 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827701 (= lt!374820 (get!11789 (select (arr!22240 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827701 (= lt!374821 (select (arr!22239 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827701 (= lt!374819 call!35930)))

(assert (=> b!827701 (= e!461146 (+!1983 call!35930 (tuple2!10099 (select (arr!22239 _keys!976) #b00000000000000000000000000000000) (get!11789 (select (arr!22240 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827702 () Bool)

(assert (=> b!827702 (= e!461145 e!461143)))

(assert (=> b!827702 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-fun res!564149 () Bool)

(assert (=> b!827702 (= res!564149 (contains!4165 lt!374818 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827702 (=> (not res!564149) (not e!461143))))

(declare-fun b!827703 () Bool)

(declare-fun res!564146 () Bool)

(assert (=> b!827703 (=> (not res!564146) (not e!461148))))

(assert (=> b!827703 (= res!564146 (not (contains!4165 lt!374818 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827704 () Bool)

(assert (=> b!827704 (= e!461145 e!461147)))

(declare-fun c!89471 () Bool)

(assert (=> b!827704 (= c!89471 (bvslt #b00000000000000000000000000000000 (size!22660 _keys!976)))))

(declare-fun bm!35927 () Bool)

(assert (=> bm!35927 (= call!35930 (getCurrentListMapNoExtraKeys!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827705 () Bool)

(assert (=> b!827705 (= e!461142 e!461146)))

(declare-fun c!89473 () Bool)

(assert (=> b!827705 (= c!89473 (validKeyInArray!0 (select (arr!22239 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827706 () Bool)

(assert (=> b!827706 (= e!461147 (isEmpty!651 lt!374818))))

(assert (= (and d!104945 c!89472) b!827698))

(assert (= (and d!104945 (not c!89472)) b!827705))

(assert (= (and b!827705 c!89473) b!827701))

(assert (= (and b!827705 (not c!89473)) b!827697))

(assert (= (or b!827701 b!827697) bm!35927))

(assert (= (and d!104945 res!564148) b!827703))

(assert (= (and b!827703 res!564146) b!827696))

(assert (= (and b!827696 res!564147) b!827700))

(assert (= (and b!827696 c!89474) b!827702))

(assert (= (and b!827696 (not c!89474)) b!827704))

(assert (= (and b!827702 res!564149) b!827695))

(assert (= (and b!827704 c!89471) b!827699))

(assert (= (and b!827704 (not c!89471)) b!827706))

(declare-fun b_lambda!11149 () Bool)

(assert (=> (not b_lambda!11149) (not b!827695)))

(assert (=> b!827695 t!22230))

(declare-fun b_and!22339 () Bool)

(assert (= b_and!22337 (and (=> t!22230 result!7959) b_and!22339)))

(declare-fun b_lambda!11151 () Bool)

(assert (=> (not b_lambda!11151) (not b!827701)))

(assert (=> b!827701 t!22230))

(declare-fun b_and!22341 () Bool)

(assert (= b_and!22339 (and (=> t!22230 result!7959) b_and!22341)))

(assert (=> b!827695 m!770127))

(assert (=> b!827695 m!770111))

(assert (=> b!827695 m!770129))

(assert (=> b!827695 m!770111))

(declare-fun m!770153 () Bool)

(assert (=> b!827695 m!770153))

(assert (=> b!827695 m!770129))

(assert (=> b!827695 m!770127))

(assert (=> b!827695 m!770133))

(declare-fun m!770155 () Bool)

(assert (=> b!827706 m!770155))

(assert (=> b!827702 m!770111))

(assert (=> b!827702 m!770111))

(declare-fun m!770157 () Bool)

(assert (=> b!827702 m!770157))

(declare-fun m!770159 () Bool)

(assert (=> b!827699 m!770159))

(assert (=> b!827700 m!770111))

(assert (=> b!827700 m!770111))

(assert (=> b!827700 m!770113))

(declare-fun m!770161 () Bool)

(assert (=> d!104945 m!770161))

(assert (=> d!104945 m!770071))

(assert (=> bm!35927 m!770159))

(declare-fun m!770163 () Bool)

(assert (=> b!827703 m!770163))

(assert (=> b!827701 m!770129))

(assert (=> b!827701 m!770127))

(assert (=> b!827701 m!770133))

(declare-fun m!770165 () Bool)

(assert (=> b!827701 m!770165))

(declare-fun m!770167 () Bool)

(assert (=> b!827701 m!770167))

(assert (=> b!827701 m!770127))

(assert (=> b!827701 m!770111))

(assert (=> b!827701 m!770129))

(declare-fun m!770169 () Bool)

(assert (=> b!827701 m!770169))

(assert (=> b!827701 m!770165))

(declare-fun m!770171 () Bool)

(assert (=> b!827701 m!770171))

(assert (=> b!827705 m!770111))

(assert (=> b!827705 m!770111))

(assert (=> b!827705 m!770113))

(assert (=> b!827582 d!104945))

(declare-fun mapIsEmpty!24328 () Bool)

(declare-fun mapRes!24328 () Bool)

(assert (=> mapIsEmpty!24328 mapRes!24328))

(declare-fun mapNonEmpty!24328 () Bool)

(declare-fun tp!47029 () Bool)

(declare-fun e!461154 () Bool)

(assert (=> mapNonEmpty!24328 (= mapRes!24328 (and tp!47029 e!461154))))

(declare-fun mapValue!24328 () ValueCell!7148)

(declare-fun mapKey!24328 () (_ BitVec 32))

(declare-fun mapRest!24328 () (Array (_ BitVec 32) ValueCell!7148))

(assert (=> mapNonEmpty!24328 (= mapRest!24319 (store mapRest!24328 mapKey!24328 mapValue!24328))))

(declare-fun b!827714 () Bool)

(declare-fun e!461153 () Bool)

(assert (=> b!827714 (= e!461153 tp_is_empty!15127)))

(declare-fun b!827713 () Bool)

(assert (=> b!827713 (= e!461154 tp_is_empty!15127)))

(declare-fun condMapEmpty!24328 () Bool)

(declare-fun mapDefault!24328 () ValueCell!7148)

(assert (=> mapNonEmpty!24319 (= condMapEmpty!24328 (= mapRest!24319 ((as const (Array (_ BitVec 32) ValueCell!7148)) mapDefault!24328)))))

(assert (=> mapNonEmpty!24319 (= tp!47014 (and e!461153 mapRes!24328))))

(assert (= (and mapNonEmpty!24319 condMapEmpty!24328) mapIsEmpty!24328))

(assert (= (and mapNonEmpty!24319 (not condMapEmpty!24328)) mapNonEmpty!24328))

(assert (= (and mapNonEmpty!24328 ((_ is ValueCellFull!7148) mapValue!24328)) b!827713))

(assert (= (and mapNonEmpty!24319 ((_ is ValueCellFull!7148) mapDefault!24328)) b!827714))

(declare-fun m!770173 () Bool)

(assert (=> mapNonEmpty!24328 m!770173))

(declare-fun b_lambda!11153 () Bool)

(assert (= b_lambda!11147 (or (and start!71250 b_free!13417) b_lambda!11153)))

(declare-fun b_lambda!11155 () Bool)

(assert (= b_lambda!11149 (or (and start!71250 b_free!13417) b_lambda!11155)))

(declare-fun b_lambda!11157 () Bool)

(assert (= b_lambda!11151 (or (and start!71250 b_free!13417) b_lambda!11157)))

(declare-fun b_lambda!11159 () Bool)

(assert (= b_lambda!11145 (or (and start!71250 b_free!13417) b_lambda!11159)))

(check-sat (not b!827638) (not b!827687) (not bm!35927) (not bm!35923) (not d!104943) (not mapNonEmpty!24328) (not b_lambda!11159) (not b_lambda!11155) (not b!827685) (not b_lambda!11153) (not b!827706) (not b!827688) (not b!827703) (not bm!35926) (not bm!35920) (not b!827701) (not b!827700) (not b!827695) (not b!827681) (not b_lambda!11157) (not b!827653) (not b!827702) (not b!827640) tp_is_empty!15127 (not d!104945) (not b!827699) (not b!827655) (not b!827691) (not b!827692) (not b!827705) (not b!827656) (not b_next!13417) (not b!827686) b_and!22341 (not b!827689))
(check-sat b_and!22341 (not b_next!13417))
