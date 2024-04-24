; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71652 () Bool)

(assert start!71652)

(declare-fun b_free!13495 () Bool)

(declare-fun b_next!13495 () Bool)

(assert (=> start!71652 (= b_free!13495 (not b_next!13495))))

(declare-fun tp!47271 () Bool)

(declare-fun b_and!22535 () Bool)

(assert (=> start!71652 (= tp!47271 b_and!22535)))

(declare-fun b!831066 () Bool)

(declare-fun res!565771 () Bool)

(declare-fun e!463418 () Bool)

(assert (=> b!831066 (=> (not res!565771) (not e!463418))))

(declare-datatypes ((array!46587 0))(
  ( (array!46588 (arr!22325 (Array (_ BitVec 32) (_ BitVec 64))) (size!22745 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46587)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25275 0))(
  ( (V!25276 (val!7650 Int)) )
))
(declare-datatypes ((ValueCell!7187 0))(
  ( (ValueCellFull!7187 (v!10092 V!25275)) (EmptyCell!7187) )
))
(declare-datatypes ((array!46589 0))(
  ( (array!46590 (arr!22326 (Array (_ BitVec 32) ValueCell!7187)) (size!22746 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46589)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!831066 (= res!565771 (and (= (size!22746 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22745 _keys!976) (size!22746 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!831067 () Bool)

(declare-fun res!565774 () Bool)

(assert (=> b!831067 (=> (not res!565774) (not e!463418))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46587 (_ BitVec 32)) Bool)

(assert (=> b!831067 (= res!565774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!831068 () Bool)

(declare-fun e!463412 () Bool)

(assert (=> b!831068 (= e!463418 (not e!463412))))

(declare-fun res!565773 () Bool)

(assert (=> b!831068 (=> res!565773 e!463412)))

(assert (=> b!831068 (= res!565773 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10076 0))(
  ( (tuple2!10077 (_1!5049 (_ BitVec 64)) (_2!5049 V!25275)) )
))
(declare-datatypes ((List!15846 0))(
  ( (Nil!15843) (Cons!15842 (h!16977 tuple2!10076) (t!22203 List!15846)) )
))
(declare-datatypes ((ListLongMap!8901 0))(
  ( (ListLongMap!8902 (toList!4466 List!15846)) )
))
(declare-fun lt!377014 () ListLongMap!8901)

(declare-fun lt!377013 () ListLongMap!8901)

(assert (=> b!831068 (= lt!377014 lt!377013)))

(declare-fun zeroValueBefore!34 () V!25275)

(declare-fun zeroValueAfter!34 () V!25275)

(declare-fun minValue!754 () V!25275)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28446 0))(
  ( (Unit!28447) )
))
(declare-fun lt!377015 () Unit!28446)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!603 (array!46587 array!46589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 V!25275 V!25275 (_ BitVec 32) Int) Unit!28446)

(assert (=> b!831068 (= lt!377015 (lemmaNoChangeToArrayThenSameMapNoExtras!603 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2536 (array!46587 array!46589 (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 (_ BitVec 32) Int) ListLongMap!8901)

(assert (=> b!831068 (= lt!377013 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831068 (= lt!377014 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831069 () Bool)

(declare-fun e!463417 () Bool)

(declare-fun tp_is_empty!15205 () Bool)

(assert (=> b!831069 (= e!463417 tp_is_empty!15205)))

(declare-fun b!831070 () Bool)

(declare-fun e!463413 () Bool)

(declare-fun e!463415 () Bool)

(declare-fun mapRes!24460 () Bool)

(assert (=> b!831070 (= e!463413 (and e!463415 mapRes!24460))))

(declare-fun condMapEmpty!24460 () Bool)

(declare-fun mapDefault!24460 () ValueCell!7187)

(assert (=> b!831070 (= condMapEmpty!24460 (= (arr!22326 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24460)))))

(declare-fun b!831071 () Bool)

(assert (=> b!831071 (= e!463415 tp_is_empty!15205)))

(declare-fun mapIsEmpty!24460 () Bool)

(assert (=> mapIsEmpty!24460 mapRes!24460))

(declare-fun res!565770 () Bool)

(assert (=> start!71652 (=> (not res!565770) (not e!463418))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71652 (= res!565770 (validMask!0 mask!1312))))

(assert (=> start!71652 e!463418))

(assert (=> start!71652 tp_is_empty!15205))

(declare-fun array_inv!17821 (array!46587) Bool)

(assert (=> start!71652 (array_inv!17821 _keys!976)))

(assert (=> start!71652 true))

(declare-fun array_inv!17822 (array!46589) Bool)

(assert (=> start!71652 (and (array_inv!17822 _values!788) e!463413)))

(assert (=> start!71652 tp!47271))

(declare-fun b!831072 () Bool)

(declare-fun res!565772 () Bool)

(assert (=> b!831072 (=> (not res!565772) (not e!463418))))

(declare-datatypes ((List!15847 0))(
  ( (Nil!15844) (Cons!15843 (h!16978 (_ BitVec 64)) (t!22204 List!15847)) )
))
(declare-fun arrayNoDuplicates!0 (array!46587 (_ BitVec 32) List!15847) Bool)

(assert (=> b!831072 (= res!565772 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15844))))

(declare-fun mapNonEmpty!24460 () Bool)

(declare-fun tp!47272 () Bool)

(assert (=> mapNonEmpty!24460 (= mapRes!24460 (and tp!47272 e!463417))))

(declare-fun mapValue!24460 () ValueCell!7187)

(declare-fun mapRest!24460 () (Array (_ BitVec 32) ValueCell!7187))

(declare-fun mapKey!24460 () (_ BitVec 32))

(assert (=> mapNonEmpty!24460 (= (arr!22326 _values!788) (store mapRest!24460 mapKey!24460 mapValue!24460))))

(declare-fun lt!377010 () tuple2!10076)

(declare-fun lt!377011 () ListLongMap!8901)

(declare-fun lt!377012 () tuple2!10076)

(declare-fun b!831073 () Bool)

(declare-fun +!1988 (ListLongMap!8901 tuple2!10076) ListLongMap!8901)

(assert (=> b!831073 (= e!463412 (= lt!377011 (+!1988 (+!1988 lt!377014 lt!377012) lt!377010)))))

(declare-fun e!463416 () Bool)

(assert (=> b!831073 e!463416))

(declare-fun res!565769 () Bool)

(assert (=> b!831073 (=> (not res!565769) (not e!463416))))

(assert (=> b!831073 (= res!565769 (= lt!377011 (+!1988 (+!1988 lt!377014 lt!377010) lt!377012)))))

(assert (=> b!831073 (= lt!377012 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!831073 (= lt!377010 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!377016 () ListLongMap!8901)

(declare-fun getCurrentListMap!2559 (array!46587 array!46589 (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 (_ BitVec 32) Int) ListLongMap!8901)

(assert (=> b!831073 (= lt!377016 (getCurrentListMap!2559 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!831073 (= lt!377011 (getCurrentListMap!2559 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831074 () Bool)

(assert (=> b!831074 (= e!463416 (= lt!377016 (+!1988 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377012)))))

(assert (= (and start!71652 res!565770) b!831066))

(assert (= (and b!831066 res!565771) b!831067))

(assert (= (and b!831067 res!565774) b!831072))

(assert (= (and b!831072 res!565772) b!831068))

(assert (= (and b!831068 (not res!565773)) b!831073))

(assert (= (and b!831073 res!565769) b!831074))

(assert (= (and b!831070 condMapEmpty!24460) mapIsEmpty!24460))

(assert (= (and b!831070 (not condMapEmpty!24460)) mapNonEmpty!24460))

(get-info :version)

(assert (= (and mapNonEmpty!24460 ((_ is ValueCellFull!7187) mapValue!24460)) b!831069))

(assert (= (and b!831070 ((_ is ValueCellFull!7187) mapDefault!24460)) b!831071))

(assert (= start!71652 b!831070))

(declare-fun m!774509 () Bool)

(assert (=> b!831068 m!774509))

(declare-fun m!774511 () Bool)

(assert (=> b!831068 m!774511))

(declare-fun m!774513 () Bool)

(assert (=> b!831068 m!774513))

(declare-fun m!774515 () Bool)

(assert (=> b!831073 m!774515))

(declare-fun m!774517 () Bool)

(assert (=> b!831073 m!774517))

(assert (=> b!831073 m!774517))

(declare-fun m!774519 () Bool)

(assert (=> b!831073 m!774519))

(assert (=> b!831073 m!774515))

(declare-fun m!774521 () Bool)

(assert (=> b!831073 m!774521))

(declare-fun m!774523 () Bool)

(assert (=> b!831073 m!774523))

(declare-fun m!774525 () Bool)

(assert (=> b!831073 m!774525))

(declare-fun m!774527 () Bool)

(assert (=> start!71652 m!774527))

(declare-fun m!774529 () Bool)

(assert (=> start!71652 m!774529))

(declare-fun m!774531 () Bool)

(assert (=> start!71652 m!774531))

(declare-fun m!774533 () Bool)

(assert (=> b!831074 m!774533))

(assert (=> b!831074 m!774533))

(declare-fun m!774535 () Bool)

(assert (=> b!831074 m!774535))

(declare-fun m!774537 () Bool)

(assert (=> mapNonEmpty!24460 m!774537))

(declare-fun m!774539 () Bool)

(assert (=> b!831067 m!774539))

(declare-fun m!774541 () Bool)

(assert (=> b!831072 m!774541))

(check-sat b_and!22535 (not start!71652) (not b!831072) (not b!831074) (not b!831073) tp_is_empty!15205 (not b_next!13495) (not b!831067) (not b!831068) (not mapNonEmpty!24460))
(check-sat b_and!22535 (not b_next!13495))
(get-model)

(declare-fun b!831137 () Bool)

(declare-fun e!463468 () Bool)

(declare-fun call!36270 () Bool)

(assert (=> b!831137 (= e!463468 call!36270)))

(declare-fun b!831138 () Bool)

(declare-fun e!463469 () Bool)

(assert (=> b!831138 (= e!463468 e!463469)))

(declare-fun lt!377065 () (_ BitVec 64))

(assert (=> b!831138 (= lt!377065 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377066 () Unit!28446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46587 (_ BitVec 64) (_ BitVec 32)) Unit!28446)

(assert (=> b!831138 (= lt!377066 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377065 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46587 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!831138 (arrayContainsKey!0 _keys!976 lt!377065 #b00000000000000000000000000000000)))

(declare-fun lt!377067 () Unit!28446)

(assert (=> b!831138 (= lt!377067 lt!377066)))

(declare-fun res!565816 () Bool)

(declare-datatypes ((SeekEntryResult!8695 0))(
  ( (MissingZero!8695 (index!37151 (_ BitVec 32))) (Found!8695 (index!37152 (_ BitVec 32))) (Intermediate!8695 (undefined!9507 Bool) (index!37153 (_ BitVec 32)) (x!70074 (_ BitVec 32))) (Undefined!8695) (MissingVacant!8695 (index!37154 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46587 (_ BitVec 32)) SeekEntryResult!8695)

(assert (=> b!831138 (= res!565816 (= (seekEntryOrOpen!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8695 #b00000000000000000000000000000000)))))

(assert (=> b!831138 (=> (not res!565816) (not e!463469))))

(declare-fun b!831139 () Bool)

(declare-fun e!463467 () Bool)

(assert (=> b!831139 (= e!463467 e!463468)))

(declare-fun c!90146 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!831139 (= c!90146 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105657 () Bool)

(declare-fun res!565815 () Bool)

(assert (=> d!105657 (=> res!565815 e!463467)))

(assert (=> d!105657 (= res!565815 (bvsge #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> d!105657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!463467)))

(declare-fun bm!36267 () Bool)

(assert (=> bm!36267 (= call!36270 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!831140 () Bool)

(assert (=> b!831140 (= e!463469 call!36270)))

(assert (= (and d!105657 (not res!565815)) b!831139))

(assert (= (and b!831139 c!90146) b!831138))

(assert (= (and b!831139 (not c!90146)) b!831137))

(assert (= (and b!831138 res!565816) b!831140))

(assert (= (or b!831140 b!831137) bm!36267))

(declare-fun m!774611 () Bool)

(assert (=> b!831138 m!774611))

(declare-fun m!774613 () Bool)

(assert (=> b!831138 m!774613))

(declare-fun m!774615 () Bool)

(assert (=> b!831138 m!774615))

(assert (=> b!831138 m!774611))

(declare-fun m!774617 () Bool)

(assert (=> b!831138 m!774617))

(assert (=> b!831139 m!774611))

(assert (=> b!831139 m!774611))

(declare-fun m!774619 () Bool)

(assert (=> b!831139 m!774619))

(declare-fun m!774621 () Bool)

(assert (=> bm!36267 m!774621))

(assert (=> b!831067 d!105657))

(declare-fun b!831151 () Bool)

(declare-fun e!463480 () Bool)

(declare-fun e!463478 () Bool)

(assert (=> b!831151 (= e!463480 e!463478)))

(declare-fun res!565825 () Bool)

(assert (=> b!831151 (=> (not res!565825) (not e!463478))))

(declare-fun e!463479 () Bool)

(assert (=> b!831151 (= res!565825 (not e!463479))))

(declare-fun res!565824 () Bool)

(assert (=> b!831151 (=> (not res!565824) (not e!463479))))

(assert (=> b!831151 (= res!565824 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831152 () Bool)

(declare-fun e!463481 () Bool)

(declare-fun call!36273 () Bool)

(assert (=> b!831152 (= e!463481 call!36273)))

(declare-fun b!831153 () Bool)

(declare-fun contains!4186 (List!15847 (_ BitVec 64)) Bool)

(assert (=> b!831153 (= e!463479 (contains!4186 Nil!15844 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831154 () Bool)

(assert (=> b!831154 (= e!463478 e!463481)))

(declare-fun c!90149 () Bool)

(assert (=> b!831154 (= c!90149 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105659 () Bool)

(declare-fun res!565823 () Bool)

(assert (=> d!105659 (=> res!565823 e!463480)))

(assert (=> d!105659 (= res!565823 (bvsge #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> d!105659 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15844) e!463480)))

(declare-fun bm!36270 () Bool)

(assert (=> bm!36270 (= call!36273 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)))))

(declare-fun b!831155 () Bool)

(assert (=> b!831155 (= e!463481 call!36273)))

(assert (= (and d!105659 (not res!565823)) b!831151))

(assert (= (and b!831151 res!565824) b!831153))

(assert (= (and b!831151 res!565825) b!831154))

(assert (= (and b!831154 c!90149) b!831152))

(assert (= (and b!831154 (not c!90149)) b!831155))

(assert (= (or b!831152 b!831155) bm!36270))

(assert (=> b!831151 m!774611))

(assert (=> b!831151 m!774611))

(assert (=> b!831151 m!774619))

(assert (=> b!831153 m!774611))

(assert (=> b!831153 m!774611))

(declare-fun m!774623 () Bool)

(assert (=> b!831153 m!774623))

(assert (=> b!831154 m!774611))

(assert (=> b!831154 m!774611))

(assert (=> b!831154 m!774619))

(assert (=> bm!36270 m!774611))

(declare-fun m!774625 () Bool)

(assert (=> bm!36270 m!774625))

(assert (=> b!831072 d!105659))

(declare-fun d!105661 () Bool)

(assert (=> d!105661 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377070 () Unit!28446)

(declare-fun choose!1422 (array!46587 array!46589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25275 V!25275 V!25275 V!25275 (_ BitVec 32) Int) Unit!28446)

(assert (=> d!105661 (= lt!377070 (choose!1422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105661 (validMask!0 mask!1312)))

(assert (=> d!105661 (= (lemmaNoChangeToArrayThenSameMapNoExtras!603 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377070)))

(declare-fun bs!23198 () Bool)

(assert (= bs!23198 d!105661))

(assert (=> bs!23198 m!774513))

(assert (=> bs!23198 m!774511))

(declare-fun m!774627 () Bool)

(assert (=> bs!23198 m!774627))

(assert (=> bs!23198 m!774527))

(assert (=> b!831068 d!105661))

(declare-fun d!105663 () Bool)

(declare-fun e!463499 () Bool)

(assert (=> d!105663 e!463499))

(declare-fun res!565837 () Bool)

(assert (=> d!105663 (=> (not res!565837) (not e!463499))))

(declare-fun lt!377087 () ListLongMap!8901)

(declare-fun contains!4187 (ListLongMap!8901 (_ BitVec 64)) Bool)

(assert (=> d!105663 (= res!565837 (not (contains!4187 lt!377087 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463496 () ListLongMap!8901)

(assert (=> d!105663 (= lt!377087 e!463496)))

(declare-fun c!90160 () Bool)

(assert (=> d!105663 (= c!90160 (bvsge #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> d!105663 (validMask!0 mask!1312)))

(assert (=> d!105663 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377087)))

(declare-fun b!831180 () Bool)

(declare-fun e!463501 () Bool)

(declare-fun e!463497 () Bool)

(assert (=> b!831180 (= e!463501 e!463497)))

(assert (=> b!831180 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun res!565835 () Bool)

(assert (=> b!831180 (= res!565835 (contains!4187 lt!377087 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831180 (=> (not res!565835) (not e!463497))))

(declare-fun b!831181 () Bool)

(declare-fun res!565836 () Bool)

(assert (=> b!831181 (=> (not res!565836) (not e!463499))))

(assert (=> b!831181 (= res!565836 (not (contains!4187 lt!377087 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831182 () Bool)

(declare-fun e!463500 () Bool)

(assert (=> b!831182 (= e!463500 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831182 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!831183 () Bool)

(assert (=> b!831183 (= e!463499 e!463501)))

(declare-fun c!90159 () Bool)

(assert (=> b!831183 (= c!90159 e!463500)))

(declare-fun res!565834 () Bool)

(assert (=> b!831183 (=> (not res!565834) (not e!463500))))

(assert (=> b!831183 (= res!565834 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun bm!36273 () Bool)

(declare-fun call!36276 () ListLongMap!8901)

(assert (=> bm!36273 (= call!36276 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun e!463502 () Bool)

(declare-fun b!831184 () Bool)

(assert (=> b!831184 (= e!463502 (= lt!377087 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831185 () Bool)

(declare-fun lt!377088 () Unit!28446)

(declare-fun lt!377085 () Unit!28446)

(assert (=> b!831185 (= lt!377088 lt!377085)))

(declare-fun lt!377091 () V!25275)

(declare-fun lt!377090 () ListLongMap!8901)

(declare-fun lt!377086 () (_ BitVec 64))

(declare-fun lt!377089 () (_ BitVec 64))

(assert (=> b!831185 (not (contains!4187 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)) lt!377089))))

(declare-fun addStillNotContains!199 (ListLongMap!8901 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28446)

(assert (=> b!831185 (= lt!377085 (addStillNotContains!199 lt!377090 lt!377086 lt!377091 lt!377089))))

(assert (=> b!831185 (= lt!377089 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11820 (ValueCell!7187 V!25275) V!25275)

(declare-fun dynLambda!980 (Int (_ BitVec 64)) V!25275)

(assert (=> b!831185 (= lt!377091 (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831185 (= lt!377086 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831185 (= lt!377090 call!36276)))

(declare-fun e!463498 () ListLongMap!8901)

(assert (=> b!831185 (= e!463498 (+!1988 call!36276 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831186 () Bool)

(assert (=> b!831186 (= e!463501 e!463502)))

(declare-fun c!90158 () Bool)

(assert (=> b!831186 (= c!90158 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun b!831187 () Bool)

(assert (=> b!831187 (= e!463496 (ListLongMap!8902 Nil!15843))))

(declare-fun b!831188 () Bool)

(assert (=> b!831188 (= e!463498 call!36276)))

(declare-fun b!831189 () Bool)

(assert (=> b!831189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> b!831189 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22746 _values!788)))))

(declare-fun apply!372 (ListLongMap!8901 (_ BitVec 64)) V!25275)

(assert (=> b!831189 (= e!463497 (= (apply!372 lt!377087 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831190 () Bool)

(assert (=> b!831190 (= e!463496 e!463498)))

(declare-fun c!90161 () Bool)

(assert (=> b!831190 (= c!90161 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831191 () Bool)

(declare-fun isEmpty!660 (ListLongMap!8901) Bool)

(assert (=> b!831191 (= e!463502 (isEmpty!660 lt!377087))))

(assert (= (and d!105663 c!90160) b!831187))

(assert (= (and d!105663 (not c!90160)) b!831190))

(assert (= (and b!831190 c!90161) b!831185))

(assert (= (and b!831190 (not c!90161)) b!831188))

(assert (= (or b!831185 b!831188) bm!36273))

(assert (= (and d!105663 res!565837) b!831181))

(assert (= (and b!831181 res!565836) b!831183))

(assert (= (and b!831183 res!565834) b!831182))

(assert (= (and b!831183 c!90159) b!831180))

(assert (= (and b!831183 (not c!90159)) b!831186))

(assert (= (and b!831180 res!565835) b!831189))

(assert (= (and b!831186 c!90158) b!831184))

(assert (= (and b!831186 (not c!90158)) b!831191))

(declare-fun b_lambda!11361 () Bool)

(assert (=> (not b_lambda!11361) (not b!831185)))

(declare-fun t!22210 () Bool)

(declare-fun tb!4217 () Bool)

(assert (=> (and start!71652 (= defaultEntry!796 defaultEntry!796) t!22210) tb!4217))

(declare-fun result!8007 () Bool)

(assert (=> tb!4217 (= result!8007 tp_is_empty!15205)))

(assert (=> b!831185 t!22210))

(declare-fun b_and!22541 () Bool)

(assert (= b_and!22535 (and (=> t!22210 result!8007) b_and!22541)))

(declare-fun b_lambda!11363 () Bool)

(assert (=> (not b_lambda!11363) (not b!831189)))

(assert (=> b!831189 t!22210))

(declare-fun b_and!22543 () Bool)

(assert (= b_and!22541 (and (=> t!22210 result!8007) b_and!22543)))

(assert (=> b!831180 m!774611))

(assert (=> b!831180 m!774611))

(declare-fun m!774629 () Bool)

(assert (=> b!831180 m!774629))

(declare-fun m!774631 () Bool)

(assert (=> b!831181 m!774631))

(declare-fun m!774633 () Bool)

(assert (=> b!831185 m!774633))

(declare-fun m!774635 () Bool)

(assert (=> b!831185 m!774635))

(declare-fun m!774637 () Bool)

(assert (=> b!831185 m!774637))

(assert (=> b!831185 m!774635))

(declare-fun m!774639 () Bool)

(assert (=> b!831185 m!774639))

(declare-fun m!774641 () Bool)

(assert (=> b!831185 m!774641))

(assert (=> b!831185 m!774611))

(assert (=> b!831185 m!774641))

(assert (=> b!831185 m!774637))

(declare-fun m!774643 () Bool)

(assert (=> b!831185 m!774643))

(declare-fun m!774645 () Bool)

(assert (=> b!831185 m!774645))

(assert (=> b!831182 m!774611))

(assert (=> b!831182 m!774611))

(assert (=> b!831182 m!774619))

(declare-fun m!774647 () Bool)

(assert (=> d!105663 m!774647))

(assert (=> d!105663 m!774527))

(assert (=> b!831190 m!774611))

(assert (=> b!831190 m!774611))

(assert (=> b!831190 m!774619))

(declare-fun m!774649 () Bool)

(assert (=> b!831191 m!774649))

(declare-fun m!774651 () Bool)

(assert (=> bm!36273 m!774651))

(assert (=> b!831189 m!774641))

(assert (=> b!831189 m!774637))

(assert (=> b!831189 m!774643))

(assert (=> b!831189 m!774637))

(assert (=> b!831189 m!774611))

(declare-fun m!774653 () Bool)

(assert (=> b!831189 m!774653))

(assert (=> b!831189 m!774641))

(assert (=> b!831189 m!774611))

(assert (=> b!831184 m!774651))

(assert (=> b!831068 d!105663))

(declare-fun d!105665 () Bool)

(declare-fun e!463506 () Bool)

(assert (=> d!105665 e!463506))

(declare-fun res!565841 () Bool)

(assert (=> d!105665 (=> (not res!565841) (not e!463506))))

(declare-fun lt!377094 () ListLongMap!8901)

(assert (=> d!105665 (= res!565841 (not (contains!4187 lt!377094 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463503 () ListLongMap!8901)

(assert (=> d!105665 (= lt!377094 e!463503)))

(declare-fun c!90164 () Bool)

(assert (=> d!105665 (= c!90164 (bvsge #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> d!105665 (validMask!0 mask!1312)))

(assert (=> d!105665 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377094)))

(declare-fun b!831194 () Bool)

(declare-fun e!463508 () Bool)

(declare-fun e!463504 () Bool)

(assert (=> b!831194 (= e!463508 e!463504)))

(assert (=> b!831194 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun res!565839 () Bool)

(assert (=> b!831194 (= res!565839 (contains!4187 lt!377094 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831194 (=> (not res!565839) (not e!463504))))

(declare-fun b!831195 () Bool)

(declare-fun res!565840 () Bool)

(assert (=> b!831195 (=> (not res!565840) (not e!463506))))

(assert (=> b!831195 (= res!565840 (not (contains!4187 lt!377094 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831196 () Bool)

(declare-fun e!463507 () Bool)

(assert (=> b!831196 (= e!463507 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831196 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!831197 () Bool)

(assert (=> b!831197 (= e!463506 e!463508)))

(declare-fun c!90163 () Bool)

(assert (=> b!831197 (= c!90163 e!463507)))

(declare-fun res!565838 () Bool)

(assert (=> b!831197 (=> (not res!565838) (not e!463507))))

(assert (=> b!831197 (= res!565838 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun call!36277 () ListLongMap!8901)

(declare-fun bm!36274 () Bool)

(assert (=> bm!36274 (= call!36277 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun e!463509 () Bool)

(declare-fun b!831198 () Bool)

(assert (=> b!831198 (= e!463509 (= lt!377094 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831199 () Bool)

(declare-fun lt!377095 () Unit!28446)

(declare-fun lt!377092 () Unit!28446)

(assert (=> b!831199 (= lt!377095 lt!377092)))

(declare-fun lt!377093 () (_ BitVec 64))

(declare-fun lt!377098 () V!25275)

(declare-fun lt!377096 () (_ BitVec 64))

(declare-fun lt!377097 () ListLongMap!8901)

(assert (=> b!831199 (not (contains!4187 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)) lt!377096))))

(assert (=> b!831199 (= lt!377092 (addStillNotContains!199 lt!377097 lt!377093 lt!377098 lt!377096))))

(assert (=> b!831199 (= lt!377096 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831199 (= lt!377098 (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831199 (= lt!377093 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831199 (= lt!377097 call!36277)))

(declare-fun e!463505 () ListLongMap!8901)

(assert (=> b!831199 (= e!463505 (+!1988 call!36277 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831200 () Bool)

(assert (=> b!831200 (= e!463508 e!463509)))

(declare-fun c!90162 () Bool)

(assert (=> b!831200 (= c!90162 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun b!831201 () Bool)

(assert (=> b!831201 (= e!463503 (ListLongMap!8902 Nil!15843))))

(declare-fun b!831202 () Bool)

(assert (=> b!831202 (= e!463505 call!36277)))

(declare-fun b!831203 () Bool)

(assert (=> b!831203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> b!831203 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22746 _values!788)))))

(assert (=> b!831203 (= e!463504 (= (apply!372 lt!377094 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831204 () Bool)

(assert (=> b!831204 (= e!463503 e!463505)))

(declare-fun c!90165 () Bool)

(assert (=> b!831204 (= c!90165 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831205 () Bool)

(assert (=> b!831205 (= e!463509 (isEmpty!660 lt!377094))))

(assert (= (and d!105665 c!90164) b!831201))

(assert (= (and d!105665 (not c!90164)) b!831204))

(assert (= (and b!831204 c!90165) b!831199))

(assert (= (and b!831204 (not c!90165)) b!831202))

(assert (= (or b!831199 b!831202) bm!36274))

(assert (= (and d!105665 res!565841) b!831195))

(assert (= (and b!831195 res!565840) b!831197))

(assert (= (and b!831197 res!565838) b!831196))

(assert (= (and b!831197 c!90163) b!831194))

(assert (= (and b!831197 (not c!90163)) b!831200))

(assert (= (and b!831194 res!565839) b!831203))

(assert (= (and b!831200 c!90162) b!831198))

(assert (= (and b!831200 (not c!90162)) b!831205))

(declare-fun b_lambda!11365 () Bool)

(assert (=> (not b_lambda!11365) (not b!831199)))

(assert (=> b!831199 t!22210))

(declare-fun b_and!22545 () Bool)

(assert (= b_and!22543 (and (=> t!22210 result!8007) b_and!22545)))

(declare-fun b_lambda!11367 () Bool)

(assert (=> (not b_lambda!11367) (not b!831203)))

(assert (=> b!831203 t!22210))

(declare-fun b_and!22547 () Bool)

(assert (= b_and!22545 (and (=> t!22210 result!8007) b_and!22547)))

(assert (=> b!831194 m!774611))

(assert (=> b!831194 m!774611))

(declare-fun m!774655 () Bool)

(assert (=> b!831194 m!774655))

(declare-fun m!774657 () Bool)

(assert (=> b!831195 m!774657))

(declare-fun m!774659 () Bool)

(assert (=> b!831199 m!774659))

(declare-fun m!774661 () Bool)

(assert (=> b!831199 m!774661))

(assert (=> b!831199 m!774637))

(assert (=> b!831199 m!774661))

(declare-fun m!774663 () Bool)

(assert (=> b!831199 m!774663))

(assert (=> b!831199 m!774641))

(assert (=> b!831199 m!774611))

(assert (=> b!831199 m!774641))

(assert (=> b!831199 m!774637))

(assert (=> b!831199 m!774643))

(declare-fun m!774665 () Bool)

(assert (=> b!831199 m!774665))

(assert (=> b!831196 m!774611))

(assert (=> b!831196 m!774611))

(assert (=> b!831196 m!774619))

(declare-fun m!774667 () Bool)

(assert (=> d!105665 m!774667))

(assert (=> d!105665 m!774527))

(assert (=> b!831204 m!774611))

(assert (=> b!831204 m!774611))

(assert (=> b!831204 m!774619))

(declare-fun m!774669 () Bool)

(assert (=> b!831205 m!774669))

(declare-fun m!774671 () Bool)

(assert (=> bm!36274 m!774671))

(assert (=> b!831203 m!774641))

(assert (=> b!831203 m!774637))

(assert (=> b!831203 m!774643))

(assert (=> b!831203 m!774637))

(assert (=> b!831203 m!774611))

(declare-fun m!774673 () Bool)

(assert (=> b!831203 m!774673))

(assert (=> b!831203 m!774641))

(assert (=> b!831203 m!774611))

(assert (=> b!831198 m!774671))

(assert (=> b!831068 d!105665))

(declare-fun d!105667 () Bool)

(assert (=> d!105667 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71652 d!105667))

(declare-fun d!105669 () Bool)

(assert (=> d!105669 (= (array_inv!17821 _keys!976) (bvsge (size!22745 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71652 d!105669))

(declare-fun d!105671 () Bool)

(assert (=> d!105671 (= (array_inv!17822 _values!788) (bvsge (size!22746 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71652 d!105671))

(declare-fun d!105673 () Bool)

(declare-fun e!463512 () Bool)

(assert (=> d!105673 e!463512))

(declare-fun res!565846 () Bool)

(assert (=> d!105673 (=> (not res!565846) (not e!463512))))

(declare-fun lt!377108 () ListLongMap!8901)

(assert (=> d!105673 (= res!565846 (contains!4187 lt!377108 (_1!5049 lt!377010)))))

(declare-fun lt!377110 () List!15846)

(assert (=> d!105673 (= lt!377108 (ListLongMap!8902 lt!377110))))

(declare-fun lt!377109 () Unit!28446)

(declare-fun lt!377107 () Unit!28446)

(assert (=> d!105673 (= lt!377109 lt!377107)))

(declare-datatypes ((Option!422 0))(
  ( (Some!421 (v!10095 V!25275)) (None!420) )
))
(declare-fun getValueByKey!416 (List!15846 (_ BitVec 64)) Option!422)

(assert (=> d!105673 (= (getValueByKey!416 lt!377110 (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010)))))

(declare-fun lemmaContainsTupThenGetReturnValue!230 (List!15846 (_ BitVec 64) V!25275) Unit!28446)

(assert (=> d!105673 (= lt!377107 (lemmaContainsTupThenGetReturnValue!230 lt!377110 (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun insertStrictlySorted!269 (List!15846 (_ BitVec 64) V!25275) List!15846)

(assert (=> d!105673 (= lt!377110 (insertStrictlySorted!269 (toList!4466 lt!377014) (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(assert (=> d!105673 (= (+!1988 lt!377014 lt!377010) lt!377108)))

(declare-fun b!831210 () Bool)

(declare-fun res!565847 () Bool)

(assert (=> b!831210 (=> (not res!565847) (not e!463512))))

(assert (=> b!831210 (= res!565847 (= (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010))))))

(declare-fun b!831211 () Bool)

(declare-fun contains!4188 (List!15846 tuple2!10076) Bool)

(assert (=> b!831211 (= e!463512 (contains!4188 (toList!4466 lt!377108) lt!377010))))

(assert (= (and d!105673 res!565846) b!831210))

(assert (= (and b!831210 res!565847) b!831211))

(declare-fun m!774675 () Bool)

(assert (=> d!105673 m!774675))

(declare-fun m!774677 () Bool)

(assert (=> d!105673 m!774677))

(declare-fun m!774679 () Bool)

(assert (=> d!105673 m!774679))

(declare-fun m!774681 () Bool)

(assert (=> d!105673 m!774681))

(declare-fun m!774683 () Bool)

(assert (=> b!831210 m!774683))

(declare-fun m!774685 () Bool)

(assert (=> b!831211 m!774685))

(assert (=> b!831073 d!105673))

(declare-fun d!105675 () Bool)

(declare-fun e!463513 () Bool)

(assert (=> d!105675 e!463513))

(declare-fun res!565848 () Bool)

(assert (=> d!105675 (=> (not res!565848) (not e!463513))))

(declare-fun lt!377112 () ListLongMap!8901)

(assert (=> d!105675 (= res!565848 (contains!4187 lt!377112 (_1!5049 lt!377012)))))

(declare-fun lt!377114 () List!15846)

(assert (=> d!105675 (= lt!377112 (ListLongMap!8902 lt!377114))))

(declare-fun lt!377113 () Unit!28446)

(declare-fun lt!377111 () Unit!28446)

(assert (=> d!105675 (= lt!377113 lt!377111)))

(assert (=> d!105675 (= (getValueByKey!416 lt!377114 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(assert (=> d!105675 (= lt!377111 (lemmaContainsTupThenGetReturnValue!230 lt!377114 (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(assert (=> d!105675 (= lt!377114 (insertStrictlySorted!269 (toList!4466 (+!1988 lt!377014 lt!377010)) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(assert (=> d!105675 (= (+!1988 (+!1988 lt!377014 lt!377010) lt!377012) lt!377112)))

(declare-fun b!831212 () Bool)

(declare-fun res!565849 () Bool)

(assert (=> b!831212 (=> (not res!565849) (not e!463513))))

(assert (=> b!831212 (= res!565849 (= (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012))))))

(declare-fun b!831213 () Bool)

(assert (=> b!831213 (= e!463513 (contains!4188 (toList!4466 lt!377112) lt!377012))))

(assert (= (and d!105675 res!565848) b!831212))

(assert (= (and b!831212 res!565849) b!831213))

(declare-fun m!774687 () Bool)

(assert (=> d!105675 m!774687))

(declare-fun m!774689 () Bool)

(assert (=> d!105675 m!774689))

(declare-fun m!774691 () Bool)

(assert (=> d!105675 m!774691))

(declare-fun m!774693 () Bool)

(assert (=> d!105675 m!774693))

(declare-fun m!774695 () Bool)

(assert (=> b!831212 m!774695))

(declare-fun m!774697 () Bool)

(assert (=> b!831213 m!774697))

(assert (=> b!831073 d!105675))

(declare-fun d!105677 () Bool)

(declare-fun e!463514 () Bool)

(assert (=> d!105677 e!463514))

(declare-fun res!565850 () Bool)

(assert (=> d!105677 (=> (not res!565850) (not e!463514))))

(declare-fun lt!377116 () ListLongMap!8901)

(assert (=> d!105677 (= res!565850 (contains!4187 lt!377116 (_1!5049 lt!377010)))))

(declare-fun lt!377118 () List!15846)

(assert (=> d!105677 (= lt!377116 (ListLongMap!8902 lt!377118))))

(declare-fun lt!377117 () Unit!28446)

(declare-fun lt!377115 () Unit!28446)

(assert (=> d!105677 (= lt!377117 lt!377115)))

(assert (=> d!105677 (= (getValueByKey!416 lt!377118 (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010)))))

(assert (=> d!105677 (= lt!377115 (lemmaContainsTupThenGetReturnValue!230 lt!377118 (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(assert (=> d!105677 (= lt!377118 (insertStrictlySorted!269 (toList!4466 (+!1988 lt!377014 lt!377012)) (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(assert (=> d!105677 (= (+!1988 (+!1988 lt!377014 lt!377012) lt!377010) lt!377116)))

(declare-fun b!831214 () Bool)

(declare-fun res!565851 () Bool)

(assert (=> b!831214 (=> (not res!565851) (not e!463514))))

(assert (=> b!831214 (= res!565851 (= (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010))))))

(declare-fun b!831215 () Bool)

(assert (=> b!831215 (= e!463514 (contains!4188 (toList!4466 lt!377116) lt!377010))))

(assert (= (and d!105677 res!565850) b!831214))

(assert (= (and b!831214 res!565851) b!831215))

(declare-fun m!774699 () Bool)

(assert (=> d!105677 m!774699))

(declare-fun m!774701 () Bool)

(assert (=> d!105677 m!774701))

(declare-fun m!774703 () Bool)

(assert (=> d!105677 m!774703))

(declare-fun m!774705 () Bool)

(assert (=> d!105677 m!774705))

(declare-fun m!774707 () Bool)

(assert (=> b!831214 m!774707))

(declare-fun m!774709 () Bool)

(assert (=> b!831215 m!774709))

(assert (=> b!831073 d!105677))

(declare-fun b!831258 () Bool)

(declare-fun e!463542 () Bool)

(declare-fun e!463541 () Bool)

(assert (=> b!831258 (= e!463542 e!463541)))

(declare-fun res!565870 () Bool)

(declare-fun call!36292 () Bool)

(assert (=> b!831258 (= res!565870 call!36292)))

(assert (=> b!831258 (=> (not res!565870) (not e!463541))))

(declare-fun b!831259 () Bool)

(declare-fun e!463553 () ListLongMap!8901)

(declare-fun call!36293 () ListLongMap!8901)

(assert (=> b!831259 (= e!463553 call!36293)))

(declare-fun b!831260 () Bool)

(declare-fun e!463550 () ListLongMap!8901)

(declare-fun e!463545 () ListLongMap!8901)

(assert (=> b!831260 (= e!463550 e!463545)))

(declare-fun c!90179 () Bool)

(assert (=> b!831260 (= c!90179 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36289 () Bool)

(declare-fun call!36295 () ListLongMap!8901)

(assert (=> bm!36289 (= call!36293 call!36295)))

(declare-fun bm!36290 () Bool)

(declare-fun call!36297 () ListLongMap!8901)

(declare-fun call!36298 () ListLongMap!8901)

(assert (=> bm!36290 (= call!36297 call!36298)))

(declare-fun bm!36291 () Bool)

(declare-fun call!36296 () Bool)

(declare-fun lt!377180 () ListLongMap!8901)

(assert (=> bm!36291 (= call!36296 (contains!4187 lt!377180 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831261 () Bool)

(declare-fun e!463543 () Bool)

(assert (=> b!831261 (= e!463543 (not call!36296))))

(declare-fun bm!36292 () Bool)

(declare-fun call!36294 () ListLongMap!8901)

(assert (=> bm!36292 (= call!36294 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831263 () Bool)

(assert (=> b!831263 (= e!463545 call!36297)))

(declare-fun b!831264 () Bool)

(declare-fun e!463548 () Bool)

(assert (=> b!831264 (= e!463548 (= (apply!372 lt!377180 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!36293 () Bool)

(declare-fun c!90178 () Bool)

(assert (=> bm!36293 (= call!36298 (+!1988 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831265 () Bool)

(assert (=> b!831265 (= e!463553 call!36297)))

(declare-fun e!463552 () Bool)

(declare-fun b!831266 () Bool)

(assert (=> b!831266 (= e!463552 (= (apply!372 lt!377180 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831266 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22746 _values!788)))))

(assert (=> b!831266 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun bm!36294 () Bool)

(assert (=> bm!36294 (= call!36295 call!36294)))

(declare-fun b!831267 () Bool)

(declare-fun e!463547 () Bool)

(assert (=> b!831267 (= e!463547 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831268 () Bool)

(declare-fun res!565877 () Bool)

(declare-fun e!463544 () Bool)

(assert (=> b!831268 (=> (not res!565877) (not e!463544))))

(assert (=> b!831268 (= res!565877 e!463542)))

(declare-fun c!90182 () Bool)

(assert (=> b!831268 (= c!90182 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!831269 () Bool)

(assert (=> b!831269 (= e!463542 (not call!36292))))

(declare-fun b!831270 () Bool)

(assert (=> b!831270 (= e!463544 e!463543)))

(declare-fun c!90181 () Bool)

(assert (=> b!831270 (= c!90181 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831271 () Bool)

(declare-fun c!90183 () Bool)

(assert (=> b!831271 (= c!90183 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831271 (= e!463545 e!463553)))

(declare-fun b!831272 () Bool)

(declare-fun e!463549 () Unit!28446)

(declare-fun Unit!28452 () Unit!28446)

(assert (=> b!831272 (= e!463549 Unit!28452)))

(declare-fun bm!36295 () Bool)

(assert (=> bm!36295 (= call!36292 (contains!4187 lt!377180 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831273 () Bool)

(assert (=> b!831273 (= e!463543 e!463548)))

(declare-fun res!565872 () Bool)

(assert (=> b!831273 (= res!565872 call!36296)))

(assert (=> b!831273 (=> (not res!565872) (not e!463548))))

(declare-fun b!831274 () Bool)

(assert (=> b!831274 (= e!463541 (= (apply!372 lt!377180 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun d!105679 () Bool)

(assert (=> d!105679 e!463544))

(declare-fun res!565871 () Bool)

(assert (=> d!105679 (=> (not res!565871) (not e!463544))))

(assert (=> d!105679 (= res!565871 (or (bvsge #b00000000000000000000000000000000 (size!22745 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))))

(declare-fun lt!377175 () ListLongMap!8901)

(assert (=> d!105679 (= lt!377180 lt!377175)))

(declare-fun lt!377179 () Unit!28446)

(assert (=> d!105679 (= lt!377179 e!463549)))

(declare-fun c!90180 () Bool)

(assert (=> d!105679 (= c!90180 e!463547)))

(declare-fun res!565878 () Bool)

(assert (=> d!105679 (=> (not res!565878) (not e!463547))))

(assert (=> d!105679 (= res!565878 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> d!105679 (= lt!377175 e!463550)))

(assert (=> d!105679 (= c!90178 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105679 (validMask!0 mask!1312)))

(assert (=> d!105679 (= (getCurrentListMap!2559 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377180)))

(declare-fun b!831262 () Bool)

(declare-fun lt!377174 () Unit!28446)

(assert (=> b!831262 (= e!463549 lt!377174)))

(declare-fun lt!377168 () ListLongMap!8901)

(assert (=> b!831262 (= lt!377168 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377167 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377167 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377176 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377176 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377183 () Unit!28446)

(declare-fun addStillContains!323 (ListLongMap!8901 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28446)

(assert (=> b!831262 (= lt!377183 (addStillContains!323 lt!377168 lt!377167 zeroValueBefore!34 lt!377176))))

(assert (=> b!831262 (contains!4187 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)) lt!377176)))

(declare-fun lt!377184 () Unit!28446)

(assert (=> b!831262 (= lt!377184 lt!377183)))

(declare-fun lt!377177 () ListLongMap!8901)

(assert (=> b!831262 (= lt!377177 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377173 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377173 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377172 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377172 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377164 () Unit!28446)

(declare-fun addApplyDifferent!323 (ListLongMap!8901 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28446)

(assert (=> b!831262 (= lt!377164 (addApplyDifferent!323 lt!377177 lt!377173 minValue!754 lt!377172))))

(assert (=> b!831262 (= (apply!372 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)) lt!377172) (apply!372 lt!377177 lt!377172))))

(declare-fun lt!377163 () Unit!28446)

(assert (=> b!831262 (= lt!377163 lt!377164)))

(declare-fun lt!377170 () ListLongMap!8901)

(assert (=> b!831262 (= lt!377170 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377178 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377178 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377166 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377166 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377169 () Unit!28446)

(assert (=> b!831262 (= lt!377169 (addApplyDifferent!323 lt!377170 lt!377178 zeroValueBefore!34 lt!377166))))

(assert (=> b!831262 (= (apply!372 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)) lt!377166) (apply!372 lt!377170 lt!377166))))

(declare-fun lt!377181 () Unit!28446)

(assert (=> b!831262 (= lt!377181 lt!377169)))

(declare-fun lt!377182 () ListLongMap!8901)

(assert (=> b!831262 (= lt!377182 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377165 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377165 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377171 () (_ BitVec 64))

(assert (=> b!831262 (= lt!377171 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831262 (= lt!377174 (addApplyDifferent!323 lt!377182 lt!377165 minValue!754 lt!377171))))

(assert (=> b!831262 (= (apply!372 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)) lt!377171) (apply!372 lt!377182 lt!377171))))

(declare-fun b!831275 () Bool)

(declare-fun res!565874 () Bool)

(assert (=> b!831275 (=> (not res!565874) (not e!463544))))

(declare-fun e!463546 () Bool)

(assert (=> b!831275 (= res!565874 e!463546)))

(declare-fun res!565876 () Bool)

(assert (=> b!831275 (=> res!565876 e!463546)))

(declare-fun e!463551 () Bool)

(assert (=> b!831275 (= res!565876 (not e!463551))))

(declare-fun res!565873 () Bool)

(assert (=> b!831275 (=> (not res!565873) (not e!463551))))

(assert (=> b!831275 (= res!565873 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun b!831276 () Bool)

(assert (=> b!831276 (= e!463550 (+!1988 call!36298 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!831277 () Bool)

(assert (=> b!831277 (= e!463551 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831278 () Bool)

(assert (=> b!831278 (= e!463546 e!463552)))

(declare-fun res!565875 () Bool)

(assert (=> b!831278 (=> (not res!565875) (not e!463552))))

(assert (=> b!831278 (= res!565875 (contains!4187 lt!377180 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831278 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (= (and d!105679 c!90178) b!831276))

(assert (= (and d!105679 (not c!90178)) b!831260))

(assert (= (and b!831260 c!90179) b!831263))

(assert (= (and b!831260 (not c!90179)) b!831271))

(assert (= (and b!831271 c!90183) b!831265))

(assert (= (and b!831271 (not c!90183)) b!831259))

(assert (= (or b!831265 b!831259) bm!36289))

(assert (= (or b!831263 bm!36289) bm!36294))

(assert (= (or b!831263 b!831265) bm!36290))

(assert (= (or b!831276 bm!36294) bm!36292))

(assert (= (or b!831276 bm!36290) bm!36293))

(assert (= (and d!105679 res!565878) b!831267))

(assert (= (and d!105679 c!90180) b!831262))

(assert (= (and d!105679 (not c!90180)) b!831272))

(assert (= (and d!105679 res!565871) b!831275))

(assert (= (and b!831275 res!565873) b!831277))

(assert (= (and b!831275 (not res!565876)) b!831278))

(assert (= (and b!831278 res!565875) b!831266))

(assert (= (and b!831275 res!565874) b!831268))

(assert (= (and b!831268 c!90182) b!831258))

(assert (= (and b!831268 (not c!90182)) b!831269))

(assert (= (and b!831258 res!565870) b!831274))

(assert (= (or b!831258 b!831269) bm!36295))

(assert (= (and b!831268 res!565877) b!831270))

(assert (= (and b!831270 c!90181) b!831273))

(assert (= (and b!831270 (not c!90181)) b!831261))

(assert (= (and b!831273 res!565872) b!831264))

(assert (= (or b!831273 b!831261) bm!36291))

(declare-fun b_lambda!11369 () Bool)

(assert (=> (not b_lambda!11369) (not b!831266)))

(assert (=> b!831266 t!22210))

(declare-fun b_and!22549 () Bool)

(assert (= b_and!22547 (and (=> t!22210 result!8007) b_and!22549)))

(declare-fun m!774711 () Bool)

(assert (=> bm!36295 m!774711))

(assert (=> b!831277 m!774611))

(assert (=> b!831277 m!774611))

(assert (=> b!831277 m!774619))

(assert (=> b!831267 m!774611))

(assert (=> b!831267 m!774611))

(assert (=> b!831267 m!774619))

(assert (=> b!831266 m!774611))

(assert (=> b!831266 m!774611))

(declare-fun m!774713 () Bool)

(assert (=> b!831266 m!774713))

(assert (=> b!831266 m!774641))

(assert (=> b!831266 m!774641))

(assert (=> b!831266 m!774637))

(assert (=> b!831266 m!774643))

(assert (=> b!831266 m!774637))

(assert (=> b!831278 m!774611))

(assert (=> b!831278 m!774611))

(declare-fun m!774715 () Bool)

(assert (=> b!831278 m!774715))

(assert (=> d!105679 m!774527))

(declare-fun m!774717 () Bool)

(assert (=> b!831274 m!774717))

(declare-fun m!774719 () Bool)

(assert (=> bm!36293 m!774719))

(declare-fun m!774721 () Bool)

(assert (=> b!831264 m!774721))

(assert (=> bm!36292 m!774513))

(declare-fun m!774723 () Bool)

(assert (=> b!831276 m!774723))

(assert (=> b!831262 m!774611))

(declare-fun m!774725 () Bool)

(assert (=> b!831262 m!774725))

(declare-fun m!774727 () Bool)

(assert (=> b!831262 m!774727))

(assert (=> b!831262 m!774513))

(declare-fun m!774729 () Bool)

(assert (=> b!831262 m!774729))

(declare-fun m!774731 () Bool)

(assert (=> b!831262 m!774731))

(declare-fun m!774733 () Bool)

(assert (=> b!831262 m!774733))

(declare-fun m!774735 () Bool)

(assert (=> b!831262 m!774735))

(declare-fun m!774737 () Bool)

(assert (=> b!831262 m!774737))

(declare-fun m!774739 () Bool)

(assert (=> b!831262 m!774739))

(assert (=> b!831262 m!774739))

(declare-fun m!774741 () Bool)

(assert (=> b!831262 m!774741))

(assert (=> b!831262 m!774731))

(assert (=> b!831262 m!774735))

(declare-fun m!774743 () Bool)

(assert (=> b!831262 m!774743))

(declare-fun m!774745 () Bool)

(assert (=> b!831262 m!774745))

(declare-fun m!774747 () Bool)

(assert (=> b!831262 m!774747))

(assert (=> b!831262 m!774747))

(declare-fun m!774749 () Bool)

(assert (=> b!831262 m!774749))

(declare-fun m!774751 () Bool)

(assert (=> b!831262 m!774751))

(declare-fun m!774753 () Bool)

(assert (=> b!831262 m!774753))

(declare-fun m!774755 () Bool)

(assert (=> bm!36291 m!774755))

(assert (=> b!831073 d!105679))

(declare-fun b!831279 () Bool)

(declare-fun e!463555 () Bool)

(declare-fun e!463554 () Bool)

(assert (=> b!831279 (= e!463555 e!463554)))

(declare-fun res!565879 () Bool)

(declare-fun call!36299 () Bool)

(assert (=> b!831279 (= res!565879 call!36299)))

(assert (=> b!831279 (=> (not res!565879) (not e!463554))))

(declare-fun b!831280 () Bool)

(declare-fun e!463566 () ListLongMap!8901)

(declare-fun call!36300 () ListLongMap!8901)

(assert (=> b!831280 (= e!463566 call!36300)))

(declare-fun b!831281 () Bool)

(declare-fun e!463563 () ListLongMap!8901)

(declare-fun e!463558 () ListLongMap!8901)

(assert (=> b!831281 (= e!463563 e!463558)))

(declare-fun c!90185 () Bool)

(assert (=> b!831281 (= c!90185 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36296 () Bool)

(declare-fun call!36302 () ListLongMap!8901)

(assert (=> bm!36296 (= call!36300 call!36302)))

(declare-fun bm!36297 () Bool)

(declare-fun call!36304 () ListLongMap!8901)

(declare-fun call!36305 () ListLongMap!8901)

(assert (=> bm!36297 (= call!36304 call!36305)))

(declare-fun bm!36298 () Bool)

(declare-fun call!36303 () Bool)

(declare-fun lt!377202 () ListLongMap!8901)

(assert (=> bm!36298 (= call!36303 (contains!4187 lt!377202 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831282 () Bool)

(declare-fun e!463556 () Bool)

(assert (=> b!831282 (= e!463556 (not call!36303))))

(declare-fun bm!36299 () Bool)

(declare-fun call!36301 () ListLongMap!8901)

(assert (=> bm!36299 (= call!36301 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!831284 () Bool)

(assert (=> b!831284 (= e!463558 call!36304)))

(declare-fun b!831285 () Bool)

(declare-fun e!463561 () Bool)

(assert (=> b!831285 (= e!463561 (= (apply!372 lt!377202 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun c!90184 () Bool)

(declare-fun bm!36300 () Bool)

(assert (=> bm!36300 (= call!36305 (+!1988 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!831286 () Bool)

(assert (=> b!831286 (= e!463566 call!36304)))

(declare-fun e!463565 () Bool)

(declare-fun b!831287 () Bool)

(assert (=> b!831287 (= e!463565 (= (apply!372 lt!377202 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22746 _values!788)))))

(assert (=> b!831287 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun bm!36301 () Bool)

(assert (=> bm!36301 (= call!36302 call!36301)))

(declare-fun b!831288 () Bool)

(declare-fun e!463560 () Bool)

(assert (=> b!831288 (= e!463560 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831289 () Bool)

(declare-fun res!565886 () Bool)

(declare-fun e!463557 () Bool)

(assert (=> b!831289 (=> (not res!565886) (not e!463557))))

(assert (=> b!831289 (= res!565886 e!463555)))

(declare-fun c!90188 () Bool)

(assert (=> b!831289 (= c!90188 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!831290 () Bool)

(assert (=> b!831290 (= e!463555 (not call!36299))))

(declare-fun b!831291 () Bool)

(assert (=> b!831291 (= e!463557 e!463556)))

(declare-fun c!90187 () Bool)

(assert (=> b!831291 (= c!90187 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!831292 () Bool)

(declare-fun c!90189 () Bool)

(assert (=> b!831292 (= c!90189 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!831292 (= e!463558 e!463566)))

(declare-fun b!831293 () Bool)

(declare-fun e!463562 () Unit!28446)

(declare-fun Unit!28453 () Unit!28446)

(assert (=> b!831293 (= e!463562 Unit!28453)))

(declare-fun bm!36302 () Bool)

(assert (=> bm!36302 (= call!36299 (contains!4187 lt!377202 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831294 () Bool)

(assert (=> b!831294 (= e!463556 e!463561)))

(declare-fun res!565881 () Bool)

(assert (=> b!831294 (= res!565881 call!36303)))

(assert (=> b!831294 (=> (not res!565881) (not e!463561))))

(declare-fun b!831295 () Bool)

(assert (=> b!831295 (= e!463554 (= (apply!372 lt!377202 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun d!105681 () Bool)

(assert (=> d!105681 e!463557))

(declare-fun res!565880 () Bool)

(assert (=> d!105681 (=> (not res!565880) (not e!463557))))

(assert (=> d!105681 (= res!565880 (or (bvsge #b00000000000000000000000000000000 (size!22745 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))))

(declare-fun lt!377197 () ListLongMap!8901)

(assert (=> d!105681 (= lt!377202 lt!377197)))

(declare-fun lt!377201 () Unit!28446)

(assert (=> d!105681 (= lt!377201 e!463562)))

(declare-fun c!90186 () Bool)

(assert (=> d!105681 (= c!90186 e!463560)))

(declare-fun res!565887 () Bool)

(assert (=> d!105681 (=> (not res!565887) (not e!463560))))

(assert (=> d!105681 (= res!565887 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (=> d!105681 (= lt!377197 e!463563)))

(assert (=> d!105681 (= c!90184 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105681 (validMask!0 mask!1312)))

(assert (=> d!105681 (= (getCurrentListMap!2559 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!377202)))

(declare-fun b!831283 () Bool)

(declare-fun lt!377196 () Unit!28446)

(assert (=> b!831283 (= e!463562 lt!377196)))

(declare-fun lt!377190 () ListLongMap!8901)

(assert (=> b!831283 (= lt!377190 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377189 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377189 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377198 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377198 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377205 () Unit!28446)

(assert (=> b!831283 (= lt!377205 (addStillContains!323 lt!377190 lt!377189 zeroValueAfter!34 lt!377198))))

(assert (=> b!831283 (contains!4187 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)) lt!377198)))

(declare-fun lt!377206 () Unit!28446)

(assert (=> b!831283 (= lt!377206 lt!377205)))

(declare-fun lt!377199 () ListLongMap!8901)

(assert (=> b!831283 (= lt!377199 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377195 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377195 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377194 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377194 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377186 () Unit!28446)

(assert (=> b!831283 (= lt!377186 (addApplyDifferent!323 lt!377199 lt!377195 minValue!754 lt!377194))))

(assert (=> b!831283 (= (apply!372 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)) lt!377194) (apply!372 lt!377199 lt!377194))))

(declare-fun lt!377185 () Unit!28446)

(assert (=> b!831283 (= lt!377185 lt!377186)))

(declare-fun lt!377192 () ListLongMap!8901)

(assert (=> b!831283 (= lt!377192 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377200 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377200 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377188 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377188 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!377191 () Unit!28446)

(assert (=> b!831283 (= lt!377191 (addApplyDifferent!323 lt!377192 lt!377200 zeroValueAfter!34 lt!377188))))

(assert (=> b!831283 (= (apply!372 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)) lt!377188) (apply!372 lt!377192 lt!377188))))

(declare-fun lt!377203 () Unit!28446)

(assert (=> b!831283 (= lt!377203 lt!377191)))

(declare-fun lt!377204 () ListLongMap!8901)

(assert (=> b!831283 (= lt!377204 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!377187 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377187 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!377193 () (_ BitVec 64))

(assert (=> b!831283 (= lt!377193 (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!831283 (= lt!377196 (addApplyDifferent!323 lt!377204 lt!377187 minValue!754 lt!377193))))

(assert (=> b!831283 (= (apply!372 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)) lt!377193) (apply!372 lt!377204 lt!377193))))

(declare-fun b!831296 () Bool)

(declare-fun res!565883 () Bool)

(assert (=> b!831296 (=> (not res!565883) (not e!463557))))

(declare-fun e!463559 () Bool)

(assert (=> b!831296 (= res!565883 e!463559)))

(declare-fun res!565885 () Bool)

(assert (=> b!831296 (=> res!565885 e!463559)))

(declare-fun e!463564 () Bool)

(assert (=> b!831296 (= res!565885 (not e!463564))))

(declare-fun res!565882 () Bool)

(assert (=> b!831296 (=> (not res!565882) (not e!463564))))

(assert (=> b!831296 (= res!565882 (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(declare-fun b!831297 () Bool)

(assert (=> b!831297 (= e!463563 (+!1988 call!36305 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!831298 () Bool)

(assert (=> b!831298 (= e!463564 (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831299 () Bool)

(assert (=> b!831299 (= e!463559 e!463565)))

(declare-fun res!565884 () Bool)

(assert (=> b!831299 (=> (not res!565884) (not e!463565))))

(assert (=> b!831299 (= res!565884 (contains!4187 lt!377202 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831299 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22745 _keys!976)))))

(assert (= (and d!105681 c!90184) b!831297))

(assert (= (and d!105681 (not c!90184)) b!831281))

(assert (= (and b!831281 c!90185) b!831284))

(assert (= (and b!831281 (not c!90185)) b!831292))

(assert (= (and b!831292 c!90189) b!831286))

(assert (= (and b!831292 (not c!90189)) b!831280))

(assert (= (or b!831286 b!831280) bm!36296))

(assert (= (or b!831284 bm!36296) bm!36301))

(assert (= (or b!831284 b!831286) bm!36297))

(assert (= (or b!831297 bm!36301) bm!36299))

(assert (= (or b!831297 bm!36297) bm!36300))

(assert (= (and d!105681 res!565887) b!831288))

(assert (= (and d!105681 c!90186) b!831283))

(assert (= (and d!105681 (not c!90186)) b!831293))

(assert (= (and d!105681 res!565880) b!831296))

(assert (= (and b!831296 res!565882) b!831298))

(assert (= (and b!831296 (not res!565885)) b!831299))

(assert (= (and b!831299 res!565884) b!831287))

(assert (= (and b!831296 res!565883) b!831289))

(assert (= (and b!831289 c!90188) b!831279))

(assert (= (and b!831289 (not c!90188)) b!831290))

(assert (= (and b!831279 res!565879) b!831295))

(assert (= (or b!831279 b!831290) bm!36302))

(assert (= (and b!831289 res!565886) b!831291))

(assert (= (and b!831291 c!90187) b!831294))

(assert (= (and b!831291 (not c!90187)) b!831282))

(assert (= (and b!831294 res!565881) b!831285))

(assert (= (or b!831294 b!831282) bm!36298))

(declare-fun b_lambda!11371 () Bool)

(assert (=> (not b_lambda!11371) (not b!831287)))

(assert (=> b!831287 t!22210))

(declare-fun b_and!22551 () Bool)

(assert (= b_and!22549 (and (=> t!22210 result!8007) b_and!22551)))

(declare-fun m!774757 () Bool)

(assert (=> bm!36302 m!774757))

(assert (=> b!831298 m!774611))

(assert (=> b!831298 m!774611))

(assert (=> b!831298 m!774619))

(assert (=> b!831288 m!774611))

(assert (=> b!831288 m!774611))

(assert (=> b!831288 m!774619))

(assert (=> b!831287 m!774611))

(assert (=> b!831287 m!774611))

(declare-fun m!774759 () Bool)

(assert (=> b!831287 m!774759))

(assert (=> b!831287 m!774641))

(assert (=> b!831287 m!774641))

(assert (=> b!831287 m!774637))

(assert (=> b!831287 m!774643))

(assert (=> b!831287 m!774637))

(assert (=> b!831299 m!774611))

(assert (=> b!831299 m!774611))

(declare-fun m!774761 () Bool)

(assert (=> b!831299 m!774761))

(assert (=> d!105681 m!774527))

(declare-fun m!774763 () Bool)

(assert (=> b!831295 m!774763))

(declare-fun m!774765 () Bool)

(assert (=> bm!36300 m!774765))

(declare-fun m!774767 () Bool)

(assert (=> b!831285 m!774767))

(assert (=> bm!36299 m!774511))

(declare-fun m!774769 () Bool)

(assert (=> b!831297 m!774769))

(assert (=> b!831283 m!774611))

(declare-fun m!774771 () Bool)

(assert (=> b!831283 m!774771))

(declare-fun m!774773 () Bool)

(assert (=> b!831283 m!774773))

(assert (=> b!831283 m!774511))

(declare-fun m!774775 () Bool)

(assert (=> b!831283 m!774775))

(declare-fun m!774777 () Bool)

(assert (=> b!831283 m!774777))

(declare-fun m!774779 () Bool)

(assert (=> b!831283 m!774779))

(declare-fun m!774781 () Bool)

(assert (=> b!831283 m!774781))

(declare-fun m!774783 () Bool)

(assert (=> b!831283 m!774783))

(declare-fun m!774785 () Bool)

(assert (=> b!831283 m!774785))

(assert (=> b!831283 m!774785))

(declare-fun m!774787 () Bool)

(assert (=> b!831283 m!774787))

(assert (=> b!831283 m!774777))

(assert (=> b!831283 m!774781))

(declare-fun m!774789 () Bool)

(assert (=> b!831283 m!774789))

(declare-fun m!774791 () Bool)

(assert (=> b!831283 m!774791))

(declare-fun m!774793 () Bool)

(assert (=> b!831283 m!774793))

(assert (=> b!831283 m!774793))

(declare-fun m!774795 () Bool)

(assert (=> b!831283 m!774795))

(declare-fun m!774797 () Bool)

(assert (=> b!831283 m!774797))

(declare-fun m!774799 () Bool)

(assert (=> b!831283 m!774799))

(declare-fun m!774801 () Bool)

(assert (=> bm!36298 m!774801))

(assert (=> b!831073 d!105681))

(declare-fun d!105683 () Bool)

(declare-fun e!463567 () Bool)

(assert (=> d!105683 e!463567))

(declare-fun res!565888 () Bool)

(assert (=> d!105683 (=> (not res!565888) (not e!463567))))

(declare-fun lt!377208 () ListLongMap!8901)

(assert (=> d!105683 (= res!565888 (contains!4187 lt!377208 (_1!5049 lt!377012)))))

(declare-fun lt!377210 () List!15846)

(assert (=> d!105683 (= lt!377208 (ListLongMap!8902 lt!377210))))

(declare-fun lt!377209 () Unit!28446)

(declare-fun lt!377207 () Unit!28446)

(assert (=> d!105683 (= lt!377209 lt!377207)))

(assert (=> d!105683 (= (getValueByKey!416 lt!377210 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(assert (=> d!105683 (= lt!377207 (lemmaContainsTupThenGetReturnValue!230 lt!377210 (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(assert (=> d!105683 (= lt!377210 (insertStrictlySorted!269 (toList!4466 lt!377014) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(assert (=> d!105683 (= (+!1988 lt!377014 lt!377012) lt!377208)))

(declare-fun b!831300 () Bool)

(declare-fun res!565889 () Bool)

(assert (=> b!831300 (=> (not res!565889) (not e!463567))))

(assert (=> b!831300 (= res!565889 (= (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012))))))

(declare-fun b!831301 () Bool)

(assert (=> b!831301 (= e!463567 (contains!4188 (toList!4466 lt!377208) lt!377012))))

(assert (= (and d!105683 res!565888) b!831300))

(assert (= (and b!831300 res!565889) b!831301))

(declare-fun m!774803 () Bool)

(assert (=> d!105683 m!774803))

(declare-fun m!774805 () Bool)

(assert (=> d!105683 m!774805))

(declare-fun m!774807 () Bool)

(assert (=> d!105683 m!774807))

(declare-fun m!774809 () Bool)

(assert (=> d!105683 m!774809))

(declare-fun m!774811 () Bool)

(assert (=> b!831300 m!774811))

(declare-fun m!774813 () Bool)

(assert (=> b!831301 m!774813))

(assert (=> b!831073 d!105683))

(declare-fun d!105685 () Bool)

(declare-fun e!463568 () Bool)

(assert (=> d!105685 e!463568))

(declare-fun res!565890 () Bool)

(assert (=> d!105685 (=> (not res!565890) (not e!463568))))

(declare-fun lt!377212 () ListLongMap!8901)

(assert (=> d!105685 (= res!565890 (contains!4187 lt!377212 (_1!5049 lt!377012)))))

(declare-fun lt!377214 () List!15846)

(assert (=> d!105685 (= lt!377212 (ListLongMap!8902 lt!377214))))

(declare-fun lt!377213 () Unit!28446)

(declare-fun lt!377211 () Unit!28446)

(assert (=> d!105685 (= lt!377213 lt!377211)))

(assert (=> d!105685 (= (getValueByKey!416 lt!377214 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(assert (=> d!105685 (= lt!377211 (lemmaContainsTupThenGetReturnValue!230 lt!377214 (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(assert (=> d!105685 (= lt!377214 (insertStrictlySorted!269 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(assert (=> d!105685 (= (+!1988 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377012) lt!377212)))

(declare-fun b!831302 () Bool)

(declare-fun res!565891 () Bool)

(assert (=> b!831302 (=> (not res!565891) (not e!463568))))

(assert (=> b!831302 (= res!565891 (= (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012))))))

(declare-fun b!831303 () Bool)

(assert (=> b!831303 (= e!463568 (contains!4188 (toList!4466 lt!377212) lt!377012))))

(assert (= (and d!105685 res!565890) b!831302))

(assert (= (and b!831302 res!565891) b!831303))

(declare-fun m!774815 () Bool)

(assert (=> d!105685 m!774815))

(declare-fun m!774817 () Bool)

(assert (=> d!105685 m!774817))

(declare-fun m!774819 () Bool)

(assert (=> d!105685 m!774819))

(declare-fun m!774821 () Bool)

(assert (=> d!105685 m!774821))

(declare-fun m!774823 () Bool)

(assert (=> b!831302 m!774823))

(declare-fun m!774825 () Bool)

(assert (=> b!831303 m!774825))

(assert (=> b!831074 d!105685))

(declare-fun d!105687 () Bool)

(declare-fun e!463569 () Bool)

(assert (=> d!105687 e!463569))

(declare-fun res!565892 () Bool)

(assert (=> d!105687 (=> (not res!565892) (not e!463569))))

(declare-fun lt!377216 () ListLongMap!8901)

(assert (=> d!105687 (= res!565892 (contains!4187 lt!377216 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377218 () List!15846)

(assert (=> d!105687 (= lt!377216 (ListLongMap!8902 lt!377218))))

(declare-fun lt!377217 () Unit!28446)

(declare-fun lt!377215 () Unit!28446)

(assert (=> d!105687 (= lt!377217 lt!377215)))

(assert (=> d!105687 (= (getValueByKey!416 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105687 (= lt!377215 (lemmaContainsTupThenGetReturnValue!230 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105687 (= lt!377218 (insertStrictlySorted!269 (toList!4466 lt!377013) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105687 (= (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377216)))

(declare-fun b!831304 () Bool)

(declare-fun res!565893 () Bool)

(assert (=> b!831304 (=> (not res!565893) (not e!463569))))

(assert (=> b!831304 (= res!565893 (= (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831305 () Bool)

(assert (=> b!831305 (= e!463569 (contains!4188 (toList!4466 lt!377216) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105687 res!565892) b!831304))

(assert (= (and b!831304 res!565893) b!831305))

(declare-fun m!774827 () Bool)

(assert (=> d!105687 m!774827))

(declare-fun m!774829 () Bool)

(assert (=> d!105687 m!774829))

(declare-fun m!774831 () Bool)

(assert (=> d!105687 m!774831))

(declare-fun m!774833 () Bool)

(assert (=> d!105687 m!774833))

(declare-fun m!774835 () Bool)

(assert (=> b!831304 m!774835))

(declare-fun m!774837 () Bool)

(assert (=> b!831305 m!774837))

(assert (=> b!831074 d!105687))

(declare-fun mapIsEmpty!24469 () Bool)

(declare-fun mapRes!24469 () Bool)

(assert (=> mapIsEmpty!24469 mapRes!24469))

(declare-fun b!831313 () Bool)

(declare-fun e!463575 () Bool)

(assert (=> b!831313 (= e!463575 tp_is_empty!15205)))

(declare-fun mapNonEmpty!24469 () Bool)

(declare-fun tp!47287 () Bool)

(declare-fun e!463574 () Bool)

(assert (=> mapNonEmpty!24469 (= mapRes!24469 (and tp!47287 e!463574))))

(declare-fun mapRest!24469 () (Array (_ BitVec 32) ValueCell!7187))

(declare-fun mapValue!24469 () ValueCell!7187)

(declare-fun mapKey!24469 () (_ BitVec 32))

(assert (=> mapNonEmpty!24469 (= mapRest!24460 (store mapRest!24469 mapKey!24469 mapValue!24469))))

(declare-fun condMapEmpty!24469 () Bool)

(declare-fun mapDefault!24469 () ValueCell!7187)

(assert (=> mapNonEmpty!24460 (= condMapEmpty!24469 (= mapRest!24460 ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24469)))))

(assert (=> mapNonEmpty!24460 (= tp!47272 (and e!463575 mapRes!24469))))

(declare-fun b!831312 () Bool)

(assert (=> b!831312 (= e!463574 tp_is_empty!15205)))

(assert (= (and mapNonEmpty!24460 condMapEmpty!24469) mapIsEmpty!24469))

(assert (= (and mapNonEmpty!24460 (not condMapEmpty!24469)) mapNonEmpty!24469))

(assert (= (and mapNonEmpty!24469 ((_ is ValueCellFull!7187) mapValue!24469)) b!831312))

(assert (= (and mapNonEmpty!24460 ((_ is ValueCellFull!7187) mapDefault!24469)) b!831313))

(declare-fun m!774839 () Bool)

(assert (=> mapNonEmpty!24469 m!774839))

(declare-fun b_lambda!11373 () Bool)

(assert (= b_lambda!11367 (or (and start!71652 b_free!13495) b_lambda!11373)))

(declare-fun b_lambda!11375 () Bool)

(assert (= b_lambda!11361 (or (and start!71652 b_free!13495) b_lambda!11375)))

(declare-fun b_lambda!11377 () Bool)

(assert (= b_lambda!11371 (or (and start!71652 b_free!13495) b_lambda!11377)))

(declare-fun b_lambda!11379 () Bool)

(assert (= b_lambda!11365 (or (and start!71652 b_free!13495) b_lambda!11379)))

(declare-fun b_lambda!11381 () Bool)

(assert (= b_lambda!11369 (or (and start!71652 b_free!13495) b_lambda!11381)))

(declare-fun b_lambda!11383 () Bool)

(assert (= b_lambda!11363 (or (and start!71652 b_free!13495) b_lambda!11383)))

(check-sat (not b!831266) (not b!831276) (not bm!36291) (not b!831213) (not b!831210) (not bm!36274) (not b!831190) (not b!831214) (not b!831180) (not b_lambda!11373) (not b!831303) (not b!831262) (not b!831274) (not d!105661) (not bm!36292) (not b!831300) (not d!105665) (not b!831139) (not b!831299) (not bm!36273) (not mapNonEmpty!24469) (not b!831212) (not b!831211) (not d!105679) (not b!831283) (not b!831196) (not b!831181) (not b!831154) (not b!831151) (not d!105663) (not b!831204) (not b_lambda!11381) (not b!831153) (not bm!36302) (not b!831278) (not b!831191) (not b!831199) (not d!105677) (not b!831304) (not bm!36267) (not b!831198) (not b!831185) (not b!831285) (not b_lambda!11379) (not b!831277) (not b!831295) (not b!831302) (not b!831297) (not d!105683) (not b!831298) (not d!105675) (not b_lambda!11377) (not bm!36299) (not b_next!13495) (not b!831267) (not b!831305) (not b!831189) (not d!105687) (not bm!36300) (not b!831288) (not bm!36298) (not b!831184) (not b!831182) (not b_lambda!11375) (not bm!36293) b_and!22551 (not b_lambda!11383) (not b!831203) (not b!831264) (not b!831205) (not bm!36270) (not b!831215) (not d!105681) tp_is_empty!15205 (not b!831195) (not bm!36295) (not b!831301) (not b!831287) (not d!105673) (not b!831194) (not d!105685) (not b!831138))
(check-sat b_and!22551 (not b_next!13495))
(get-model)

(assert (=> bm!36292 d!105665))

(declare-fun d!105689 () Bool)

(declare-fun e!463581 () Bool)

(assert (=> d!105689 e!463581))

(declare-fun res!565896 () Bool)

(assert (=> d!105689 (=> res!565896 e!463581)))

(declare-fun lt!377229 () Bool)

(assert (=> d!105689 (= res!565896 (not lt!377229))))

(declare-fun lt!377228 () Bool)

(assert (=> d!105689 (= lt!377229 lt!377228)))

(declare-fun lt!377227 () Unit!28446)

(declare-fun e!463580 () Unit!28446)

(assert (=> d!105689 (= lt!377227 e!463580)))

(declare-fun c!90192 () Bool)

(assert (=> d!105689 (= c!90192 lt!377228)))

(declare-fun containsKey!401 (List!15846 (_ BitVec 64)) Bool)

(assert (=> d!105689 (= lt!377228 (containsKey!401 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105689 (= (contains!4187 lt!377180 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377229)))

(declare-fun b!831320 () Bool)

(declare-fun lt!377230 () Unit!28446)

(assert (=> b!831320 (= e!463580 lt!377230)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!310 (List!15846 (_ BitVec 64)) Unit!28446)

(assert (=> b!831320 (= lt!377230 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun isDefined!311 (Option!422) Bool)

(assert (=> b!831320 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831321 () Bool)

(declare-fun Unit!28454 () Unit!28446)

(assert (=> b!831321 (= e!463580 Unit!28454)))

(declare-fun b!831322 () Bool)

(assert (=> b!831322 (= e!463581 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105689 c!90192) b!831320))

(assert (= (and d!105689 (not c!90192)) b!831321))

(assert (= (and d!105689 (not res!565896)) b!831322))

(declare-fun m!774841 () Bool)

(assert (=> d!105689 m!774841))

(declare-fun m!774843 () Bool)

(assert (=> b!831320 m!774843))

(declare-fun m!774845 () Bool)

(assert (=> b!831320 m!774845))

(assert (=> b!831320 m!774845))

(declare-fun m!774847 () Bool)

(assert (=> b!831320 m!774847))

(assert (=> b!831322 m!774845))

(assert (=> b!831322 m!774845))

(assert (=> b!831322 m!774847))

(assert (=> bm!36291 d!105689))

(declare-fun d!105691 () Bool)

(assert (=> d!105691 (arrayContainsKey!0 _keys!976 lt!377065 #b00000000000000000000000000000000)))

(declare-fun lt!377233 () Unit!28446)

(declare-fun choose!13 (array!46587 (_ BitVec 64) (_ BitVec 32)) Unit!28446)

(assert (=> d!105691 (= lt!377233 (choose!13 _keys!976 lt!377065 #b00000000000000000000000000000000))))

(assert (=> d!105691 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!105691 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377065 #b00000000000000000000000000000000) lt!377233)))

(declare-fun bs!23199 () Bool)

(assert (= bs!23199 d!105691))

(assert (=> bs!23199 m!774615))

(declare-fun m!774849 () Bool)

(assert (=> bs!23199 m!774849))

(assert (=> b!831138 d!105691))

(declare-fun d!105693 () Bool)

(declare-fun res!565901 () Bool)

(declare-fun e!463586 () Bool)

(assert (=> d!105693 (=> res!565901 e!463586)))

(assert (=> d!105693 (= res!565901 (= (select (arr!22325 _keys!976) #b00000000000000000000000000000000) lt!377065))))

(assert (=> d!105693 (= (arrayContainsKey!0 _keys!976 lt!377065 #b00000000000000000000000000000000) e!463586)))

(declare-fun b!831327 () Bool)

(declare-fun e!463587 () Bool)

(assert (=> b!831327 (= e!463586 e!463587)))

(declare-fun res!565902 () Bool)

(assert (=> b!831327 (=> (not res!565902) (not e!463587))))

(assert (=> b!831327 (= res!565902 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!831328 () Bool)

(assert (=> b!831328 (= e!463587 (arrayContainsKey!0 _keys!976 lt!377065 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!105693 (not res!565901)) b!831327))

(assert (= (and b!831327 res!565902) b!831328))

(assert (=> d!105693 m!774611))

(declare-fun m!774851 () Bool)

(assert (=> b!831328 m!774851))

(assert (=> b!831138 d!105693))

(declare-fun b!831341 () Bool)

(declare-fun e!463594 () SeekEntryResult!8695)

(assert (=> b!831341 (= e!463594 Undefined!8695)))

(declare-fun b!831342 () Bool)

(declare-fun e!463596 () SeekEntryResult!8695)

(assert (=> b!831342 (= e!463594 e!463596)))

(declare-fun lt!377240 () (_ BitVec 64))

(declare-fun lt!377242 () SeekEntryResult!8695)

(assert (=> b!831342 (= lt!377240 (select (arr!22325 _keys!976) (index!37153 lt!377242)))))

(declare-fun c!90199 () Bool)

(assert (=> b!831342 (= c!90199 (= lt!377240 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105695 () Bool)

(declare-fun lt!377241 () SeekEntryResult!8695)

(assert (=> d!105695 (and (or ((_ is Undefined!8695) lt!377241) (not ((_ is Found!8695) lt!377241)) (and (bvsge (index!37152 lt!377241) #b00000000000000000000000000000000) (bvslt (index!37152 lt!377241) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377241) ((_ is Found!8695) lt!377241) (not ((_ is MissingZero!8695) lt!377241)) (and (bvsge (index!37151 lt!377241) #b00000000000000000000000000000000) (bvslt (index!37151 lt!377241) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377241) ((_ is Found!8695) lt!377241) ((_ is MissingZero!8695) lt!377241) (not ((_ is MissingVacant!8695) lt!377241)) (and (bvsge (index!37154 lt!377241) #b00000000000000000000000000000000) (bvslt (index!37154 lt!377241) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377241) (ite ((_ is Found!8695) lt!377241) (= (select (arr!22325 _keys!976) (index!37152 lt!377241)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!8695) lt!377241) (= (select (arr!22325 _keys!976) (index!37151 lt!377241)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8695) lt!377241) (= (select (arr!22325 _keys!976) (index!37154 lt!377241)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105695 (= lt!377241 e!463594)))

(declare-fun c!90200 () Bool)

(assert (=> d!105695 (= c!90200 (and ((_ is Intermediate!8695) lt!377242) (undefined!9507 lt!377242)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46587 (_ BitVec 32)) SeekEntryResult!8695)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!105695 (= lt!377242 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(assert (=> d!105695 (validMask!0 mask!1312)))

(assert (=> d!105695 (= (seekEntryOrOpen!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377241)))

(declare-fun b!831343 () Bool)

(assert (=> b!831343 (= e!463596 (Found!8695 (index!37153 lt!377242)))))

(declare-fun b!831344 () Bool)

(declare-fun e!463595 () SeekEntryResult!8695)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!46587 (_ BitVec 32)) SeekEntryResult!8695)

(assert (=> b!831344 (= e!463595 (seekKeyOrZeroReturnVacant!0 (x!70074 lt!377242) (index!37153 lt!377242) (index!37153 lt!377242) (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!831345 () Bool)

(assert (=> b!831345 (= e!463595 (MissingZero!8695 (index!37153 lt!377242)))))

(declare-fun b!831346 () Bool)

(declare-fun c!90201 () Bool)

(assert (=> b!831346 (= c!90201 (= lt!377240 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831346 (= e!463596 e!463595)))

(assert (= (and d!105695 c!90200) b!831341))

(assert (= (and d!105695 (not c!90200)) b!831342))

(assert (= (and b!831342 c!90199) b!831343))

(assert (= (and b!831342 (not c!90199)) b!831346))

(assert (= (and b!831346 c!90201) b!831345))

(assert (= (and b!831346 (not c!90201)) b!831344))

(declare-fun m!774853 () Bool)

(assert (=> b!831342 m!774853))

(declare-fun m!774855 () Bool)

(assert (=> d!105695 m!774855))

(declare-fun m!774857 () Bool)

(assert (=> d!105695 m!774857))

(assert (=> d!105695 m!774611))

(declare-fun m!774859 () Bool)

(assert (=> d!105695 m!774859))

(assert (=> d!105695 m!774611))

(assert (=> d!105695 m!774857))

(declare-fun m!774861 () Bool)

(assert (=> d!105695 m!774861))

(assert (=> d!105695 m!774527))

(declare-fun m!774863 () Bool)

(assert (=> d!105695 m!774863))

(assert (=> b!831344 m!774611))

(declare-fun m!774865 () Bool)

(assert (=> b!831344 m!774865))

(assert (=> b!831138 d!105695))

(declare-fun d!105697 () Bool)

(assert (=> d!105697 (= (validKeyInArray!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (and (not (= (select (arr!22325 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22325 _keys!976) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831277 d!105697))

(declare-fun d!105699 () Bool)

(declare-fun e!463600 () Bool)

(assert (=> d!105699 e!463600))

(declare-fun res!565906 () Bool)

(assert (=> d!105699 (=> (not res!565906) (not e!463600))))

(declare-fun lt!377245 () ListLongMap!8901)

(assert (=> d!105699 (= res!565906 (not (contains!4187 lt!377245 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463597 () ListLongMap!8901)

(assert (=> d!105699 (= lt!377245 e!463597)))

(declare-fun c!90204 () Bool)

(assert (=> d!105699 (= c!90204 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!105699 (validMask!0 mask!1312)))

(assert (=> d!105699 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!377245)))

(declare-fun b!831347 () Bool)

(declare-fun e!463602 () Bool)

(declare-fun e!463598 () Bool)

(assert (=> b!831347 (= e!463602 e!463598)))

(assert (=> b!831347 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun res!565904 () Bool)

(assert (=> b!831347 (= res!565904 (contains!4187 lt!377245 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831347 (=> (not res!565904) (not e!463598))))

(declare-fun b!831348 () Bool)

(declare-fun res!565905 () Bool)

(assert (=> b!831348 (=> (not res!565905) (not e!463600))))

(assert (=> b!831348 (= res!565905 (not (contains!4187 lt!377245 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831349 () Bool)

(declare-fun e!463601 () Bool)

(assert (=> b!831349 (= e!463601 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831349 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!831350 () Bool)

(assert (=> b!831350 (= e!463600 e!463602)))

(declare-fun c!90203 () Bool)

(assert (=> b!831350 (= c!90203 e!463601)))

(declare-fun res!565903 () Bool)

(assert (=> b!831350 (=> (not res!565903) (not e!463601))))

(assert (=> b!831350 (= res!565903 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun bm!36303 () Bool)

(declare-fun call!36306 () ListLongMap!8901)

(assert (=> bm!36303 (= call!36306 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831351 () Bool)

(declare-fun e!463603 () Bool)

(assert (=> b!831351 (= e!463603 (= lt!377245 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831352 () Bool)

(declare-fun lt!377246 () Unit!28446)

(declare-fun lt!377243 () Unit!28446)

(assert (=> b!831352 (= lt!377246 lt!377243)))

(declare-fun lt!377244 () (_ BitVec 64))

(declare-fun lt!377249 () V!25275)

(declare-fun lt!377247 () (_ BitVec 64))

(declare-fun lt!377248 () ListLongMap!8901)

(assert (=> b!831352 (not (contains!4187 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249)) lt!377247))))

(assert (=> b!831352 (= lt!377243 (addStillNotContains!199 lt!377248 lt!377244 lt!377249 lt!377247))))

(assert (=> b!831352 (= lt!377247 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831352 (= lt!377249 (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831352 (= lt!377244 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!831352 (= lt!377248 call!36306)))

(declare-fun e!463599 () ListLongMap!8901)

(assert (=> b!831352 (= e!463599 (+!1988 call!36306 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831353 () Bool)

(assert (=> b!831353 (= e!463602 e!463603)))

(declare-fun c!90202 () Bool)

(assert (=> b!831353 (= c!90202 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!831354 () Bool)

(assert (=> b!831354 (= e!463597 (ListLongMap!8902 Nil!15843))))

(declare-fun b!831355 () Bool)

(assert (=> b!831355 (= e!463599 call!36306)))

(declare-fun b!831356 () Bool)

(assert (=> b!831356 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> b!831356 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22746 _values!788)))))

(assert (=> b!831356 (= e!463598 (= (apply!372 lt!377245 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831357 () Bool)

(assert (=> b!831357 (= e!463597 e!463599)))

(declare-fun c!90205 () Bool)

(assert (=> b!831357 (= c!90205 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831358 () Bool)

(assert (=> b!831358 (= e!463603 (isEmpty!660 lt!377245))))

(assert (= (and d!105699 c!90204) b!831354))

(assert (= (and d!105699 (not c!90204)) b!831357))

(assert (= (and b!831357 c!90205) b!831352))

(assert (= (and b!831357 (not c!90205)) b!831355))

(assert (= (or b!831352 b!831355) bm!36303))

(assert (= (and d!105699 res!565906) b!831348))

(assert (= (and b!831348 res!565905) b!831350))

(assert (= (and b!831350 res!565903) b!831349))

(assert (= (and b!831350 c!90203) b!831347))

(assert (= (and b!831350 (not c!90203)) b!831353))

(assert (= (and b!831347 res!565904) b!831356))

(assert (= (and b!831353 c!90202) b!831351))

(assert (= (and b!831353 (not c!90202)) b!831358))

(declare-fun b_lambda!11385 () Bool)

(assert (=> (not b_lambda!11385) (not b!831352)))

(assert (=> b!831352 t!22210))

(declare-fun b_and!22553 () Bool)

(assert (= b_and!22551 (and (=> t!22210 result!8007) b_and!22553)))

(declare-fun b_lambda!11387 () Bool)

(assert (=> (not b_lambda!11387) (not b!831356)))

(assert (=> b!831356 t!22210))

(declare-fun b_and!22555 () Bool)

(assert (= b_and!22553 (and (=> t!22210 result!8007) b_and!22555)))

(declare-fun m!774867 () Bool)

(assert (=> b!831347 m!774867))

(assert (=> b!831347 m!774867))

(declare-fun m!774869 () Bool)

(assert (=> b!831347 m!774869))

(declare-fun m!774871 () Bool)

(assert (=> b!831348 m!774871))

(declare-fun m!774873 () Bool)

(assert (=> b!831352 m!774873))

(declare-fun m!774875 () Bool)

(assert (=> b!831352 m!774875))

(assert (=> b!831352 m!774637))

(assert (=> b!831352 m!774875))

(declare-fun m!774877 () Bool)

(assert (=> b!831352 m!774877))

(declare-fun m!774879 () Bool)

(assert (=> b!831352 m!774879))

(assert (=> b!831352 m!774867))

(assert (=> b!831352 m!774879))

(assert (=> b!831352 m!774637))

(declare-fun m!774881 () Bool)

(assert (=> b!831352 m!774881))

(declare-fun m!774883 () Bool)

(assert (=> b!831352 m!774883))

(assert (=> b!831349 m!774867))

(assert (=> b!831349 m!774867))

(declare-fun m!774885 () Bool)

(assert (=> b!831349 m!774885))

(declare-fun m!774887 () Bool)

(assert (=> d!105699 m!774887))

(assert (=> d!105699 m!774527))

(assert (=> b!831357 m!774867))

(assert (=> b!831357 m!774867))

(assert (=> b!831357 m!774885))

(declare-fun m!774889 () Bool)

(assert (=> b!831358 m!774889))

(declare-fun m!774891 () Bool)

(assert (=> bm!36303 m!774891))

(assert (=> b!831356 m!774879))

(assert (=> b!831356 m!774637))

(assert (=> b!831356 m!774881))

(assert (=> b!831356 m!774637))

(assert (=> b!831356 m!774867))

(declare-fun m!774893 () Bool)

(assert (=> b!831356 m!774893))

(assert (=> b!831356 m!774879))

(assert (=> b!831356 m!774867))

(assert (=> b!831351 m!774891))

(assert (=> b!831184 d!105699))

(assert (=> b!831154 d!105697))

(declare-fun b!831368 () Bool)

(declare-fun e!463608 () Option!422)

(declare-fun e!463609 () Option!422)

(assert (=> b!831368 (= e!463608 e!463609)))

(declare-fun c!90211 () Bool)

(assert (=> b!831368 (= c!90211 (and ((_ is Cons!15842) (toList!4466 lt!377116)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377116))) (_1!5049 lt!377010)))))))

(declare-fun b!831369 () Bool)

(assert (=> b!831369 (= e!463609 (getValueByKey!416 (t!22203 (toList!4466 lt!377116)) (_1!5049 lt!377010)))))

(declare-fun d!105701 () Bool)

(declare-fun c!90210 () Bool)

(assert (=> d!105701 (= c!90210 (and ((_ is Cons!15842) (toList!4466 lt!377116)) (= (_1!5049 (h!16977 (toList!4466 lt!377116))) (_1!5049 lt!377010))))))

(assert (=> d!105701 (= (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010)) e!463608)))

(declare-fun b!831367 () Bool)

(assert (=> b!831367 (= e!463608 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377116)))))))

(declare-fun b!831370 () Bool)

(assert (=> b!831370 (= e!463609 None!420)))

(assert (= (and d!105701 c!90210) b!831367))

(assert (= (and d!105701 (not c!90210)) b!831368))

(assert (= (and b!831368 c!90211) b!831369))

(assert (= (and b!831368 (not c!90211)) b!831370))

(declare-fun m!774895 () Bool)

(assert (=> b!831369 m!774895))

(assert (=> b!831214 d!105701))

(declare-fun d!105703 () Bool)

(declare-fun e!463613 () Bool)

(assert (=> d!105703 e!463613))

(declare-fun res!565910 () Bool)

(assert (=> d!105703 (=> (not res!565910) (not e!463613))))

(declare-fun lt!377252 () ListLongMap!8901)

(assert (=> d!105703 (= res!565910 (not (contains!4187 lt!377252 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463610 () ListLongMap!8901)

(assert (=> d!105703 (= lt!377252 e!463610)))

(declare-fun c!90214 () Bool)

(assert (=> d!105703 (= c!90214 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!105703 (validMask!0 mask!1312)))

(assert (=> d!105703 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796) lt!377252)))

(declare-fun b!831371 () Bool)

(declare-fun e!463615 () Bool)

(declare-fun e!463611 () Bool)

(assert (=> b!831371 (= e!463615 e!463611)))

(assert (=> b!831371 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun res!565908 () Bool)

(assert (=> b!831371 (= res!565908 (contains!4187 lt!377252 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831371 (=> (not res!565908) (not e!463611))))

(declare-fun b!831372 () Bool)

(declare-fun res!565909 () Bool)

(assert (=> b!831372 (=> (not res!565909) (not e!463613))))

(assert (=> b!831372 (= res!565909 (not (contains!4187 lt!377252 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831373 () Bool)

(declare-fun e!463614 () Bool)

(assert (=> b!831373 (= e!463614 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831373 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!831374 () Bool)

(assert (=> b!831374 (= e!463613 e!463615)))

(declare-fun c!90213 () Bool)

(assert (=> b!831374 (= c!90213 e!463614)))

(declare-fun res!565907 () Bool)

(assert (=> b!831374 (=> (not res!565907) (not e!463614))))

(assert (=> b!831374 (= res!565907 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun call!36307 () ListLongMap!8901)

(declare-fun bm!36304 () Bool)

(assert (=> bm!36304 (= call!36307 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831375 () Bool)

(declare-fun e!463616 () Bool)

(assert (=> b!831375 (= e!463616 (= lt!377252 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831376 () Bool)

(declare-fun lt!377253 () Unit!28446)

(declare-fun lt!377250 () Unit!28446)

(assert (=> b!831376 (= lt!377253 lt!377250)))

(declare-fun lt!377256 () V!25275)

(declare-fun lt!377255 () ListLongMap!8901)

(declare-fun lt!377254 () (_ BitVec 64))

(declare-fun lt!377251 () (_ BitVec 64))

(assert (=> b!831376 (not (contains!4187 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256)) lt!377254))))

(assert (=> b!831376 (= lt!377250 (addStillNotContains!199 lt!377255 lt!377251 lt!377256 lt!377254))))

(assert (=> b!831376 (= lt!377254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831376 (= lt!377256 (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831376 (= lt!377251 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!831376 (= lt!377255 call!36307)))

(declare-fun e!463612 () ListLongMap!8901)

(assert (=> b!831376 (= e!463612 (+!1988 call!36307 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831377 () Bool)

(assert (=> b!831377 (= e!463615 e!463616)))

(declare-fun c!90212 () Bool)

(assert (=> b!831377 (= c!90212 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!831378 () Bool)

(assert (=> b!831378 (= e!463610 (ListLongMap!8902 Nil!15843))))

(declare-fun b!831379 () Bool)

(assert (=> b!831379 (= e!463612 call!36307)))

(declare-fun b!831380 () Bool)

(assert (=> b!831380 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> b!831380 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22746 _values!788)))))

(assert (=> b!831380 (= e!463611 (= (apply!372 lt!377252 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831381 () Bool)

(assert (=> b!831381 (= e!463610 e!463612)))

(declare-fun c!90215 () Bool)

(assert (=> b!831381 (= c!90215 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831382 () Bool)

(assert (=> b!831382 (= e!463616 (isEmpty!660 lt!377252))))

(assert (= (and d!105703 c!90214) b!831378))

(assert (= (and d!105703 (not c!90214)) b!831381))

(assert (= (and b!831381 c!90215) b!831376))

(assert (= (and b!831381 (not c!90215)) b!831379))

(assert (= (or b!831376 b!831379) bm!36304))

(assert (= (and d!105703 res!565910) b!831372))

(assert (= (and b!831372 res!565909) b!831374))

(assert (= (and b!831374 res!565907) b!831373))

(assert (= (and b!831374 c!90213) b!831371))

(assert (= (and b!831374 (not c!90213)) b!831377))

(assert (= (and b!831371 res!565908) b!831380))

(assert (= (and b!831377 c!90212) b!831375))

(assert (= (and b!831377 (not c!90212)) b!831382))

(declare-fun b_lambda!11389 () Bool)

(assert (=> (not b_lambda!11389) (not b!831376)))

(assert (=> b!831376 t!22210))

(declare-fun b_and!22557 () Bool)

(assert (= b_and!22555 (and (=> t!22210 result!8007) b_and!22557)))

(declare-fun b_lambda!11391 () Bool)

(assert (=> (not b_lambda!11391) (not b!831380)))

(assert (=> b!831380 t!22210))

(declare-fun b_and!22559 () Bool)

(assert (= b_and!22557 (and (=> t!22210 result!8007) b_and!22559)))

(assert (=> b!831371 m!774867))

(assert (=> b!831371 m!774867))

(declare-fun m!774897 () Bool)

(assert (=> b!831371 m!774897))

(declare-fun m!774899 () Bool)

(assert (=> b!831372 m!774899))

(declare-fun m!774901 () Bool)

(assert (=> b!831376 m!774901))

(declare-fun m!774903 () Bool)

(assert (=> b!831376 m!774903))

(assert (=> b!831376 m!774637))

(assert (=> b!831376 m!774903))

(declare-fun m!774905 () Bool)

(assert (=> b!831376 m!774905))

(assert (=> b!831376 m!774879))

(assert (=> b!831376 m!774867))

(assert (=> b!831376 m!774879))

(assert (=> b!831376 m!774637))

(assert (=> b!831376 m!774881))

(declare-fun m!774907 () Bool)

(assert (=> b!831376 m!774907))

(assert (=> b!831373 m!774867))

(assert (=> b!831373 m!774867))

(assert (=> b!831373 m!774885))

(declare-fun m!774909 () Bool)

(assert (=> d!105703 m!774909))

(assert (=> d!105703 m!774527))

(assert (=> b!831381 m!774867))

(assert (=> b!831381 m!774867))

(assert (=> b!831381 m!774885))

(declare-fun m!774911 () Bool)

(assert (=> b!831382 m!774911))

(declare-fun m!774913 () Bool)

(assert (=> bm!36304 m!774913))

(assert (=> b!831380 m!774879))

(assert (=> b!831380 m!774637))

(assert (=> b!831380 m!774881))

(assert (=> b!831380 m!774637))

(assert (=> b!831380 m!774867))

(declare-fun m!774915 () Bool)

(assert (=> b!831380 m!774915))

(assert (=> b!831380 m!774879))

(assert (=> b!831380 m!774867))

(assert (=> b!831375 m!774913))

(assert (=> b!831198 d!105703))

(declare-fun d!105705 () Bool)

(declare-fun lt!377259 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!386 (List!15846) (InoxSet tuple2!10076))

(assert (=> d!105705 (= lt!377259 (select (content!386 (toList!4466 lt!377212)) lt!377012))))

(declare-fun e!463622 () Bool)

(assert (=> d!105705 (= lt!377259 e!463622)))

(declare-fun res!565915 () Bool)

(assert (=> d!105705 (=> (not res!565915) (not e!463622))))

(assert (=> d!105705 (= res!565915 ((_ is Cons!15842) (toList!4466 lt!377212)))))

(assert (=> d!105705 (= (contains!4188 (toList!4466 lt!377212) lt!377012) lt!377259)))

(declare-fun b!831387 () Bool)

(declare-fun e!463621 () Bool)

(assert (=> b!831387 (= e!463622 e!463621)))

(declare-fun res!565916 () Bool)

(assert (=> b!831387 (=> res!565916 e!463621)))

(assert (=> b!831387 (= res!565916 (= (h!16977 (toList!4466 lt!377212)) lt!377012))))

(declare-fun b!831388 () Bool)

(assert (=> b!831388 (= e!463621 (contains!4188 (t!22203 (toList!4466 lt!377212)) lt!377012))))

(assert (= (and d!105705 res!565915) b!831387))

(assert (= (and b!831387 (not res!565916)) b!831388))

(declare-fun m!774917 () Bool)

(assert (=> d!105705 m!774917))

(declare-fun m!774919 () Bool)

(assert (=> d!105705 m!774919))

(declare-fun m!774921 () Bool)

(assert (=> b!831388 m!774921))

(assert (=> b!831303 d!105705))

(declare-fun d!105707 () Bool)

(declare-fun get!11821 (Option!422) V!25275)

(assert (=> d!105707 (= (apply!372 lt!377180 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11821 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23200 () Bool)

(assert (= bs!23200 d!105707))

(assert (=> bs!23200 m!774611))

(declare-fun m!774923 () Bool)

(assert (=> bs!23200 m!774923))

(assert (=> bs!23200 m!774923))

(declare-fun m!774925 () Bool)

(assert (=> bs!23200 m!774925))

(assert (=> b!831266 d!105707))

(declare-fun d!105709 () Bool)

(declare-fun c!90218 () Bool)

(assert (=> d!105709 (= c!90218 ((_ is ValueCellFull!7187) (select (arr!22326 _values!788) #b00000000000000000000000000000000)))))

(declare-fun e!463625 () V!25275)

(assert (=> d!105709 (= (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!463625)))

(declare-fun b!831393 () Bool)

(declare-fun get!11822 (ValueCell!7187 V!25275) V!25275)

(assert (=> b!831393 (= e!463625 (get!11822 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831394 () Bool)

(declare-fun get!11823 (ValueCell!7187 V!25275) V!25275)

(assert (=> b!831394 (= e!463625 (get!11823 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105709 c!90218) b!831393))

(assert (= (and d!105709 (not c!90218)) b!831394))

(assert (=> b!831393 m!774641))

(assert (=> b!831393 m!774637))

(declare-fun m!774927 () Bool)

(assert (=> b!831393 m!774927))

(assert (=> b!831394 m!774641))

(assert (=> b!831394 m!774637))

(declare-fun m!774929 () Bool)

(assert (=> b!831394 m!774929))

(assert (=> b!831266 d!105709))

(declare-fun d!105711 () Bool)

(declare-fun e!463626 () Bool)

(assert (=> d!105711 e!463626))

(declare-fun res!565917 () Bool)

(assert (=> d!105711 (=> (not res!565917) (not e!463626))))

(declare-fun lt!377261 () ListLongMap!8901)

(assert (=> d!105711 (= res!565917 (contains!4187 lt!377261 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377263 () List!15846)

(assert (=> d!105711 (= lt!377261 (ListLongMap!8902 lt!377263))))

(declare-fun lt!377262 () Unit!28446)

(declare-fun lt!377260 () Unit!28446)

(assert (=> d!105711 (= lt!377262 lt!377260)))

(assert (=> d!105711 (= (getValueByKey!416 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105711 (= lt!377260 (lemmaContainsTupThenGetReturnValue!230 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105711 (= lt!377263 (insertStrictlySorted!269 (toList!4466 call!36305) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105711 (= (+!1988 call!36305 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377261)))

(declare-fun b!831395 () Bool)

(declare-fun res!565918 () Bool)

(assert (=> b!831395 (=> (not res!565918) (not e!463626))))

(assert (=> b!831395 (= res!565918 (= (getValueByKey!416 (toList!4466 lt!377261) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831396 () Bool)

(assert (=> b!831396 (= e!463626 (contains!4188 (toList!4466 lt!377261) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105711 res!565917) b!831395))

(assert (= (and b!831395 res!565918) b!831396))

(declare-fun m!774931 () Bool)

(assert (=> d!105711 m!774931))

(declare-fun m!774933 () Bool)

(assert (=> d!105711 m!774933))

(declare-fun m!774935 () Bool)

(assert (=> d!105711 m!774935))

(declare-fun m!774937 () Bool)

(assert (=> d!105711 m!774937))

(declare-fun m!774939 () Bool)

(assert (=> b!831395 m!774939))

(declare-fun m!774941 () Bool)

(assert (=> b!831396 m!774941))

(assert (=> b!831297 d!105711))

(declare-fun d!105713 () Bool)

(declare-fun e!463628 () Bool)

(assert (=> d!105713 e!463628))

(declare-fun res!565919 () Bool)

(assert (=> d!105713 (=> res!565919 e!463628)))

(declare-fun lt!377266 () Bool)

(assert (=> d!105713 (= res!565919 (not lt!377266))))

(declare-fun lt!377265 () Bool)

(assert (=> d!105713 (= lt!377266 lt!377265)))

(declare-fun lt!377264 () Unit!28446)

(declare-fun e!463627 () Unit!28446)

(assert (=> d!105713 (= lt!377264 e!463627)))

(declare-fun c!90219 () Bool)

(assert (=> d!105713 (= c!90219 lt!377265)))

(assert (=> d!105713 (= lt!377265 (containsKey!401 (toList!4466 lt!377108) (_1!5049 lt!377010)))))

(assert (=> d!105713 (= (contains!4187 lt!377108 (_1!5049 lt!377010)) lt!377266)))

(declare-fun b!831397 () Bool)

(declare-fun lt!377267 () Unit!28446)

(assert (=> b!831397 (= e!463627 lt!377267)))

(assert (=> b!831397 (= lt!377267 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377108) (_1!5049 lt!377010)))))

(assert (=> b!831397 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010)))))

(declare-fun b!831398 () Bool)

(declare-fun Unit!28455 () Unit!28446)

(assert (=> b!831398 (= e!463627 Unit!28455)))

(declare-fun b!831399 () Bool)

(assert (=> b!831399 (= e!463628 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010))))))

(assert (= (and d!105713 c!90219) b!831397))

(assert (= (and d!105713 (not c!90219)) b!831398))

(assert (= (and d!105713 (not res!565919)) b!831399))

(declare-fun m!774943 () Bool)

(assert (=> d!105713 m!774943))

(declare-fun m!774945 () Bool)

(assert (=> b!831397 m!774945))

(assert (=> b!831397 m!774683))

(assert (=> b!831397 m!774683))

(declare-fun m!774947 () Bool)

(assert (=> b!831397 m!774947))

(assert (=> b!831399 m!774683))

(assert (=> b!831399 m!774683))

(assert (=> b!831399 m!774947))

(assert (=> d!105673 d!105713))

(declare-fun b!831401 () Bool)

(declare-fun e!463629 () Option!422)

(declare-fun e!463630 () Option!422)

(assert (=> b!831401 (= e!463629 e!463630)))

(declare-fun c!90221 () Bool)

(assert (=> b!831401 (= c!90221 (and ((_ is Cons!15842) lt!377110) (not (= (_1!5049 (h!16977 lt!377110)) (_1!5049 lt!377010)))))))

(declare-fun b!831402 () Bool)

(assert (=> b!831402 (= e!463630 (getValueByKey!416 (t!22203 lt!377110) (_1!5049 lt!377010)))))

(declare-fun d!105715 () Bool)

(declare-fun c!90220 () Bool)

(assert (=> d!105715 (= c!90220 (and ((_ is Cons!15842) lt!377110) (= (_1!5049 (h!16977 lt!377110)) (_1!5049 lt!377010))))))

(assert (=> d!105715 (= (getValueByKey!416 lt!377110 (_1!5049 lt!377010)) e!463629)))

(declare-fun b!831400 () Bool)

(assert (=> b!831400 (= e!463629 (Some!421 (_2!5049 (h!16977 lt!377110))))))

(declare-fun b!831403 () Bool)

(assert (=> b!831403 (= e!463630 None!420)))

(assert (= (and d!105715 c!90220) b!831400))

(assert (= (and d!105715 (not c!90220)) b!831401))

(assert (= (and b!831401 c!90221) b!831402))

(assert (= (and b!831401 (not c!90221)) b!831403))

(declare-fun m!774949 () Bool)

(assert (=> b!831402 m!774949))

(assert (=> d!105673 d!105715))

(declare-fun d!105717 () Bool)

(assert (=> d!105717 (= (getValueByKey!416 lt!377110 (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010)))))

(declare-fun lt!377270 () Unit!28446)

(declare-fun choose!1423 (List!15846 (_ BitVec 64) V!25275) Unit!28446)

(assert (=> d!105717 (= lt!377270 (choose!1423 lt!377110 (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun e!463633 () Bool)

(assert (=> d!105717 e!463633))

(declare-fun res!565924 () Bool)

(assert (=> d!105717 (=> (not res!565924) (not e!463633))))

(declare-fun isStrictlySorted!429 (List!15846) Bool)

(assert (=> d!105717 (= res!565924 (isStrictlySorted!429 lt!377110))))

(assert (=> d!105717 (= (lemmaContainsTupThenGetReturnValue!230 lt!377110 (_1!5049 lt!377010) (_2!5049 lt!377010)) lt!377270)))

(declare-fun b!831408 () Bool)

(declare-fun res!565925 () Bool)

(assert (=> b!831408 (=> (not res!565925) (not e!463633))))

(assert (=> b!831408 (= res!565925 (containsKey!401 lt!377110 (_1!5049 lt!377010)))))

(declare-fun b!831409 () Bool)

(assert (=> b!831409 (= e!463633 (contains!4188 lt!377110 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(assert (= (and d!105717 res!565924) b!831408))

(assert (= (and b!831408 res!565925) b!831409))

(assert (=> d!105717 m!774677))

(declare-fun m!774951 () Bool)

(assert (=> d!105717 m!774951))

(declare-fun m!774953 () Bool)

(assert (=> d!105717 m!774953))

(declare-fun m!774955 () Bool)

(assert (=> b!831408 m!774955))

(declare-fun m!774957 () Bool)

(assert (=> b!831409 m!774957))

(assert (=> d!105673 d!105717))

(declare-fun bm!36311 () Bool)

(declare-fun call!36314 () List!15846)

(declare-fun call!36315 () List!15846)

(assert (=> bm!36311 (= call!36314 call!36315)))

(declare-fun bm!36312 () Bool)

(declare-fun call!36316 () List!15846)

(assert (=> bm!36312 (= call!36315 call!36316)))

(declare-fun d!105719 () Bool)

(declare-fun e!463646 () Bool)

(assert (=> d!105719 e!463646))

(declare-fun res!565931 () Bool)

(assert (=> d!105719 (=> (not res!565931) (not e!463646))))

(declare-fun lt!377273 () List!15846)

(assert (=> d!105719 (= res!565931 (isStrictlySorted!429 lt!377273))))

(declare-fun e!463647 () List!15846)

(assert (=> d!105719 (= lt!377273 e!463647)))

(declare-fun c!90231 () Bool)

(assert (=> d!105719 (= c!90231 (and ((_ is Cons!15842) (toList!4466 lt!377014)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 lt!377010))))))

(assert (=> d!105719 (isStrictlySorted!429 (toList!4466 lt!377014))))

(assert (=> d!105719 (= (insertStrictlySorted!269 (toList!4466 lt!377014) (_1!5049 lt!377010) (_2!5049 lt!377010)) lt!377273)))

(declare-fun c!90233 () Bool)

(declare-fun e!463648 () List!15846)

(declare-fun c!90232 () Bool)

(declare-fun b!831430 () Bool)

(assert (=> b!831430 (= e!463648 (ite c!90233 (t!22203 (toList!4466 lt!377014)) (ite c!90232 (Cons!15842 (h!16977 (toList!4466 lt!377014)) (t!22203 (toList!4466 lt!377014))) Nil!15843)))))

(declare-fun b!831431 () Bool)

(declare-fun e!463645 () List!15846)

(assert (=> b!831431 (= e!463645 call!36314)))

(declare-fun b!831432 () Bool)

(assert (=> b!831432 (= e!463645 call!36314)))

(declare-fun b!831433 () Bool)

(declare-fun e!463644 () List!15846)

(assert (=> b!831433 (= e!463644 call!36315)))

(declare-fun bm!36313 () Bool)

(declare-fun $colon$colon!533 (List!15846 tuple2!10076) List!15846)

(assert (=> bm!36313 (= call!36316 ($colon$colon!533 e!463648 (ite c!90231 (h!16977 (toList!4466 lt!377014)) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010)))))))

(declare-fun c!90230 () Bool)

(assert (=> bm!36313 (= c!90230 c!90231)))

(declare-fun b!831434 () Bool)

(assert (=> b!831434 (= e!463648 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377014)) (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun b!831435 () Bool)

(declare-fun res!565930 () Bool)

(assert (=> b!831435 (=> (not res!565930) (not e!463646))))

(assert (=> b!831435 (= res!565930 (containsKey!401 lt!377273 (_1!5049 lt!377010)))))

(declare-fun b!831436 () Bool)

(assert (=> b!831436 (= e!463647 e!463644)))

(assert (=> b!831436 (= c!90233 (and ((_ is Cons!15842) (toList!4466 lt!377014)) (= (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 lt!377010))))))

(declare-fun b!831437 () Bool)

(assert (=> b!831437 (= e!463646 (contains!4188 lt!377273 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831438 () Bool)

(assert (=> b!831438 (= e!463647 call!36316)))

(declare-fun b!831439 () Bool)

(assert (=> b!831439 (= c!90232 (and ((_ is Cons!15842) (toList!4466 lt!377014)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 lt!377010))))))

(assert (=> b!831439 (= e!463644 e!463645)))

(assert (= (and d!105719 c!90231) b!831438))

(assert (= (and d!105719 (not c!90231)) b!831436))

(assert (= (and b!831436 c!90233) b!831433))

(assert (= (and b!831436 (not c!90233)) b!831439))

(assert (= (and b!831439 c!90232) b!831431))

(assert (= (and b!831439 (not c!90232)) b!831432))

(assert (= (or b!831431 b!831432) bm!36311))

(assert (= (or b!831433 bm!36311) bm!36312))

(assert (= (or b!831438 bm!36312) bm!36313))

(assert (= (and bm!36313 c!90230) b!831434))

(assert (= (and bm!36313 (not c!90230)) b!831430))

(assert (= (and d!105719 res!565931) b!831435))

(assert (= (and b!831435 res!565930) b!831437))

(declare-fun m!774959 () Bool)

(assert (=> d!105719 m!774959))

(declare-fun m!774961 () Bool)

(assert (=> d!105719 m!774961))

(declare-fun m!774963 () Bool)

(assert (=> bm!36313 m!774963))

(declare-fun m!774965 () Bool)

(assert (=> b!831434 m!774965))

(declare-fun m!774967 () Bool)

(assert (=> b!831435 m!774967))

(declare-fun m!774969 () Bool)

(assert (=> b!831437 m!774969))

(assert (=> d!105673 d!105719))

(declare-fun d!105721 () Bool)

(declare-fun lt!377274 () Bool)

(assert (=> d!105721 (= lt!377274 (select (content!386 (toList!4466 lt!377208)) lt!377012))))

(declare-fun e!463650 () Bool)

(assert (=> d!105721 (= lt!377274 e!463650)))

(declare-fun res!565932 () Bool)

(assert (=> d!105721 (=> (not res!565932) (not e!463650))))

(assert (=> d!105721 (= res!565932 ((_ is Cons!15842) (toList!4466 lt!377208)))))

(assert (=> d!105721 (= (contains!4188 (toList!4466 lt!377208) lt!377012) lt!377274)))

(declare-fun b!831440 () Bool)

(declare-fun e!463649 () Bool)

(assert (=> b!831440 (= e!463650 e!463649)))

(declare-fun res!565933 () Bool)

(assert (=> b!831440 (=> res!565933 e!463649)))

(assert (=> b!831440 (= res!565933 (= (h!16977 (toList!4466 lt!377208)) lt!377012))))

(declare-fun b!831441 () Bool)

(assert (=> b!831441 (= e!463649 (contains!4188 (t!22203 (toList!4466 lt!377208)) lt!377012))))

(assert (= (and d!105721 res!565932) b!831440))

(assert (= (and b!831440 (not res!565933)) b!831441))

(declare-fun m!774971 () Bool)

(assert (=> d!105721 m!774971))

(declare-fun m!774973 () Bool)

(assert (=> d!105721 m!774973))

(declare-fun m!774975 () Bool)

(assert (=> b!831441 m!774975))

(assert (=> b!831301 d!105721))

(declare-fun d!105723 () Bool)

(declare-fun e!463651 () Bool)

(assert (=> d!105723 e!463651))

(declare-fun res!565934 () Bool)

(assert (=> d!105723 (=> (not res!565934) (not e!463651))))

(declare-fun lt!377276 () ListLongMap!8901)

(assert (=> d!105723 (= res!565934 (contains!4187 lt!377276 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377278 () List!15846)

(assert (=> d!105723 (= lt!377276 (ListLongMap!8902 lt!377278))))

(declare-fun lt!377277 () Unit!28446)

(declare-fun lt!377275 () Unit!28446)

(assert (=> d!105723 (= lt!377277 lt!377275)))

(assert (=> d!105723 (= (getValueByKey!416 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105723 (= lt!377275 (lemmaContainsTupThenGetReturnValue!230 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105723 (= lt!377278 (insertStrictlySorted!269 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105723 (= (+!1988 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377276)))

(declare-fun b!831442 () Bool)

(declare-fun res!565935 () Bool)

(assert (=> b!831442 (=> (not res!565935) (not e!463651))))

(assert (=> b!831442 (= res!565935 (= (getValueByKey!416 (toList!4466 lt!377276) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831443 () Bool)

(assert (=> b!831443 (= e!463651 (contains!4188 (toList!4466 lt!377276) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105723 res!565934) b!831442))

(assert (= (and b!831442 res!565935) b!831443))

(declare-fun m!774977 () Bool)

(assert (=> d!105723 m!774977))

(declare-fun m!774979 () Bool)

(assert (=> d!105723 m!774979))

(declare-fun m!774981 () Bool)

(assert (=> d!105723 m!774981))

(declare-fun m!774983 () Bool)

(assert (=> d!105723 m!774983))

(declare-fun m!774985 () Bool)

(assert (=> b!831442 m!774985))

(declare-fun m!774987 () Bool)

(assert (=> b!831443 m!774987))

(assert (=> bm!36293 d!105723))

(declare-fun d!105725 () Bool)

(assert (=> d!105725 (= (apply!372 lt!377202 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11821 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23201 () Bool)

(assert (= bs!23201 d!105725))

(declare-fun m!774989 () Bool)

(assert (=> bs!23201 m!774989))

(assert (=> bs!23201 m!774989))

(declare-fun m!774991 () Bool)

(assert (=> bs!23201 m!774991))

(assert (=> b!831295 d!105725))

(assert (=> b!831190 d!105697))

(assert (=> b!831204 d!105697))

(declare-fun d!105727 () Bool)

(declare-fun e!463653 () Bool)

(assert (=> d!105727 e!463653))

(declare-fun res!565936 () Bool)

(assert (=> d!105727 (=> res!565936 e!463653)))

(declare-fun lt!377281 () Bool)

(assert (=> d!105727 (= res!565936 (not lt!377281))))

(declare-fun lt!377280 () Bool)

(assert (=> d!105727 (= lt!377281 lt!377280)))

(declare-fun lt!377279 () Unit!28446)

(declare-fun e!463652 () Unit!28446)

(assert (=> d!105727 (= lt!377279 e!463652)))

(declare-fun c!90234 () Bool)

(assert (=> d!105727 (= c!90234 lt!377280)))

(assert (=> d!105727 (= lt!377280 (containsKey!401 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105727 (= (contains!4187 lt!377202 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377281)))

(declare-fun b!831444 () Bool)

(declare-fun lt!377282 () Unit!28446)

(assert (=> b!831444 (= e!463652 lt!377282)))

(assert (=> b!831444 (= lt!377282 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831444 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831445 () Bool)

(declare-fun Unit!28456 () Unit!28446)

(assert (=> b!831445 (= e!463652 Unit!28456)))

(declare-fun b!831446 () Bool)

(assert (=> b!831446 (= e!463653 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105727 c!90234) b!831444))

(assert (= (and d!105727 (not c!90234)) b!831445))

(assert (= (and d!105727 (not res!565936)) b!831446))

(declare-fun m!774993 () Bool)

(assert (=> d!105727 m!774993))

(declare-fun m!774995 () Bool)

(assert (=> b!831444 m!774995))

(assert (=> b!831444 m!774989))

(assert (=> b!831444 m!774989))

(declare-fun m!774997 () Bool)

(assert (=> b!831444 m!774997))

(assert (=> b!831446 m!774989))

(assert (=> b!831446 m!774989))

(assert (=> b!831446 m!774997))

(assert (=> bm!36302 d!105727))

(declare-fun d!105729 () Bool)

(assert (=> d!105729 (= (apply!372 lt!377192 lt!377188) (get!11821 (getValueByKey!416 (toList!4466 lt!377192) lt!377188)))))

(declare-fun bs!23202 () Bool)

(assert (= bs!23202 d!105729))

(declare-fun m!774999 () Bool)

(assert (=> bs!23202 m!774999))

(assert (=> bs!23202 m!774999))

(declare-fun m!775001 () Bool)

(assert (=> bs!23202 m!775001))

(assert (=> b!831283 d!105729))

(declare-fun d!105731 () Bool)

(assert (=> d!105731 (= (apply!372 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)) lt!377193) (apply!372 lt!377204 lt!377193))))

(declare-fun lt!377285 () Unit!28446)

(declare-fun choose!1424 (ListLongMap!8901 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28446)

(assert (=> d!105731 (= lt!377285 (choose!1424 lt!377204 lt!377187 minValue!754 lt!377193))))

(declare-fun e!463656 () Bool)

(assert (=> d!105731 e!463656))

(declare-fun res!565939 () Bool)

(assert (=> d!105731 (=> (not res!565939) (not e!463656))))

(assert (=> d!105731 (= res!565939 (contains!4187 lt!377204 lt!377193))))

(assert (=> d!105731 (= (addApplyDifferent!323 lt!377204 lt!377187 minValue!754 lt!377193) lt!377285)))

(declare-fun b!831450 () Bool)

(assert (=> b!831450 (= e!463656 (not (= lt!377193 lt!377187)))))

(assert (= (and d!105731 res!565939) b!831450))

(assert (=> d!105731 m!774781))

(assert (=> d!105731 m!774783))

(assert (=> d!105731 m!774799))

(assert (=> d!105731 m!774781))

(declare-fun m!775003 () Bool)

(assert (=> d!105731 m!775003))

(declare-fun m!775005 () Bool)

(assert (=> d!105731 m!775005))

(assert (=> b!831283 d!105731))

(declare-fun d!105733 () Bool)

(declare-fun e!463658 () Bool)

(assert (=> d!105733 e!463658))

(declare-fun res!565940 () Bool)

(assert (=> d!105733 (=> res!565940 e!463658)))

(declare-fun lt!377288 () Bool)

(assert (=> d!105733 (= res!565940 (not lt!377288))))

(declare-fun lt!377287 () Bool)

(assert (=> d!105733 (= lt!377288 lt!377287)))

(declare-fun lt!377286 () Unit!28446)

(declare-fun e!463657 () Unit!28446)

(assert (=> d!105733 (= lt!377286 e!463657)))

(declare-fun c!90235 () Bool)

(assert (=> d!105733 (= c!90235 lt!377287)))

(assert (=> d!105733 (= lt!377287 (containsKey!401 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))

(assert (=> d!105733 (= (contains!4187 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)) lt!377198) lt!377288)))

(declare-fun b!831451 () Bool)

(declare-fun lt!377289 () Unit!28446)

(assert (=> b!831451 (= e!463657 lt!377289)))

(assert (=> b!831451 (= lt!377289 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))

(assert (=> b!831451 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))

(declare-fun b!831452 () Bool)

(declare-fun Unit!28457 () Unit!28446)

(assert (=> b!831452 (= e!463657 Unit!28457)))

(declare-fun b!831453 () Bool)

(assert (=> b!831453 (= e!463658 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198)))))

(assert (= (and d!105733 c!90235) b!831451))

(assert (= (and d!105733 (not c!90235)) b!831452))

(assert (= (and d!105733 (not res!565940)) b!831453))

(declare-fun m!775007 () Bool)

(assert (=> d!105733 m!775007))

(declare-fun m!775009 () Bool)

(assert (=> b!831451 m!775009))

(declare-fun m!775011 () Bool)

(assert (=> b!831451 m!775011))

(assert (=> b!831451 m!775011))

(declare-fun m!775013 () Bool)

(assert (=> b!831451 m!775013))

(assert (=> b!831453 m!775011))

(assert (=> b!831453 m!775011))

(assert (=> b!831453 m!775013))

(assert (=> b!831283 d!105733))

(declare-fun d!105735 () Bool)

(assert (=> d!105735 (contains!4187 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)) lt!377198)))

(declare-fun lt!377292 () Unit!28446)

(declare-fun choose!1425 (ListLongMap!8901 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28446)

(assert (=> d!105735 (= lt!377292 (choose!1425 lt!377190 lt!377189 zeroValueAfter!34 lt!377198))))

(assert (=> d!105735 (contains!4187 lt!377190 lt!377198)))

(assert (=> d!105735 (= (addStillContains!323 lt!377190 lt!377189 zeroValueAfter!34 lt!377198) lt!377292)))

(declare-fun bs!23203 () Bool)

(assert (= bs!23203 d!105735))

(assert (=> bs!23203 m!774793))

(assert (=> bs!23203 m!774793))

(assert (=> bs!23203 m!774795))

(declare-fun m!775015 () Bool)

(assert (=> bs!23203 m!775015))

(declare-fun m!775017 () Bool)

(assert (=> bs!23203 m!775017))

(assert (=> b!831283 d!105735))

(assert (=> b!831283 d!105663))

(declare-fun d!105737 () Bool)

(declare-fun e!463659 () Bool)

(assert (=> d!105737 e!463659))

(declare-fun res!565941 () Bool)

(assert (=> d!105737 (=> (not res!565941) (not e!463659))))

(declare-fun lt!377294 () ListLongMap!8901)

(assert (=> d!105737 (= res!565941 (contains!4187 lt!377294 (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun lt!377296 () List!15846)

(assert (=> d!105737 (= lt!377294 (ListLongMap!8902 lt!377296))))

(declare-fun lt!377295 () Unit!28446)

(declare-fun lt!377293 () Unit!28446)

(assert (=> d!105737 (= lt!377295 lt!377293)))

(assert (=> d!105737 (= (getValueByKey!416 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))

(assert (=> d!105737 (= lt!377293 (lemmaContainsTupThenGetReturnValue!230 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))

(assert (=> d!105737 (= lt!377296 (insertStrictlySorted!269 (toList!4466 lt!377204) (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))

(assert (=> d!105737 (= (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)) lt!377294)))

(declare-fun b!831455 () Bool)

(declare-fun res!565942 () Bool)

(assert (=> b!831455 (=> (not res!565942) (not e!463659))))

(assert (=> b!831455 (= res!565942 (= (getValueByKey!416 (toList!4466 lt!377294) (_1!5049 (tuple2!10077 lt!377187 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(declare-fun b!831456 () Bool)

(assert (=> b!831456 (= e!463659 (contains!4188 (toList!4466 lt!377294) (tuple2!10077 lt!377187 minValue!754)))))

(assert (= (and d!105737 res!565941) b!831455))

(assert (= (and b!831455 res!565942) b!831456))

(declare-fun m!775019 () Bool)

(assert (=> d!105737 m!775019))

(declare-fun m!775021 () Bool)

(assert (=> d!105737 m!775021))

(declare-fun m!775023 () Bool)

(assert (=> d!105737 m!775023))

(declare-fun m!775025 () Bool)

(assert (=> d!105737 m!775025))

(declare-fun m!775027 () Bool)

(assert (=> b!831455 m!775027))

(declare-fun m!775029 () Bool)

(assert (=> b!831456 m!775029))

(assert (=> b!831283 d!105737))

(declare-fun d!105739 () Bool)

(declare-fun e!463660 () Bool)

(assert (=> d!105739 e!463660))

(declare-fun res!565943 () Bool)

(assert (=> d!105739 (=> (not res!565943) (not e!463660))))

(declare-fun lt!377298 () ListLongMap!8901)

(assert (=> d!105739 (= res!565943 (contains!4187 lt!377298 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun lt!377300 () List!15846)

(assert (=> d!105739 (= lt!377298 (ListLongMap!8902 lt!377300))))

(declare-fun lt!377299 () Unit!28446)

(declare-fun lt!377297 () Unit!28446)

(assert (=> d!105739 (= lt!377299 lt!377297)))

(assert (=> d!105739 (= (getValueByKey!416 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(assert (=> d!105739 (= lt!377297 (lemmaContainsTupThenGetReturnValue!230 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(assert (=> d!105739 (= lt!377300 (insertStrictlySorted!269 (toList!4466 lt!377192) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(assert (=> d!105739 (= (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)) lt!377298)))

(declare-fun b!831457 () Bool)

(declare-fun res!565944 () Bool)

(assert (=> b!831457 (=> (not res!565944) (not e!463660))))

(assert (=> b!831457 (= res!565944 (= (getValueByKey!416 (toList!4466 lt!377298) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(declare-fun b!831458 () Bool)

(assert (=> b!831458 (= e!463660 (contains!4188 (toList!4466 lt!377298) (tuple2!10077 lt!377200 zeroValueAfter!34)))))

(assert (= (and d!105739 res!565943) b!831457))

(assert (= (and b!831457 res!565944) b!831458))

(declare-fun m!775031 () Bool)

(assert (=> d!105739 m!775031))

(declare-fun m!775033 () Bool)

(assert (=> d!105739 m!775033))

(declare-fun m!775035 () Bool)

(assert (=> d!105739 m!775035))

(declare-fun m!775037 () Bool)

(assert (=> d!105739 m!775037))

(declare-fun m!775039 () Bool)

(assert (=> b!831457 m!775039))

(declare-fun m!775041 () Bool)

(assert (=> b!831458 m!775041))

(assert (=> b!831283 d!105739))

(declare-fun d!105741 () Bool)

(assert (=> d!105741 (= (apply!372 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)) lt!377194) (apply!372 lt!377199 lt!377194))))

(declare-fun lt!377301 () Unit!28446)

(assert (=> d!105741 (= lt!377301 (choose!1424 lt!377199 lt!377195 minValue!754 lt!377194))))

(declare-fun e!463661 () Bool)

(assert (=> d!105741 e!463661))

(declare-fun res!565945 () Bool)

(assert (=> d!105741 (=> (not res!565945) (not e!463661))))

(assert (=> d!105741 (= res!565945 (contains!4187 lt!377199 lt!377194))))

(assert (=> d!105741 (= (addApplyDifferent!323 lt!377199 lt!377195 minValue!754 lt!377194) lt!377301)))

(declare-fun b!831459 () Bool)

(assert (=> b!831459 (= e!463661 (not (= lt!377194 lt!377195)))))

(assert (= (and d!105741 res!565945) b!831459))

(assert (=> d!105741 m!774777))

(assert (=> d!105741 m!774779))

(assert (=> d!105741 m!774771))

(assert (=> d!105741 m!774777))

(declare-fun m!775043 () Bool)

(assert (=> d!105741 m!775043))

(declare-fun m!775045 () Bool)

(assert (=> d!105741 m!775045))

(assert (=> b!831283 d!105741))

(declare-fun d!105743 () Bool)

(assert (=> d!105743 (= (apply!372 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)) lt!377188) (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377188)))))

(declare-fun bs!23204 () Bool)

(assert (= bs!23204 d!105743))

(declare-fun m!775047 () Bool)

(assert (=> bs!23204 m!775047))

(assert (=> bs!23204 m!775047))

(declare-fun m!775049 () Bool)

(assert (=> bs!23204 m!775049))

(assert (=> b!831283 d!105743))

(declare-fun d!105745 () Bool)

(assert (=> d!105745 (= (apply!372 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)) lt!377194) (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754))) lt!377194)))))

(declare-fun bs!23205 () Bool)

(assert (= bs!23205 d!105745))

(declare-fun m!775051 () Bool)

(assert (=> bs!23205 m!775051))

(assert (=> bs!23205 m!775051))

(declare-fun m!775053 () Bool)

(assert (=> bs!23205 m!775053))

(assert (=> b!831283 d!105745))

(declare-fun d!105747 () Bool)

(assert (=> d!105747 (= (apply!372 lt!377199 lt!377194) (get!11821 (getValueByKey!416 (toList!4466 lt!377199) lt!377194)))))

(declare-fun bs!23206 () Bool)

(assert (= bs!23206 d!105747))

(declare-fun m!775055 () Bool)

(assert (=> bs!23206 m!775055))

(assert (=> bs!23206 m!775055))

(declare-fun m!775057 () Bool)

(assert (=> bs!23206 m!775057))

(assert (=> b!831283 d!105747))

(declare-fun d!105749 () Bool)

(declare-fun e!463662 () Bool)

(assert (=> d!105749 e!463662))

(declare-fun res!565946 () Bool)

(assert (=> d!105749 (=> (not res!565946) (not e!463662))))

(declare-fun lt!377303 () ListLongMap!8901)

(assert (=> d!105749 (= res!565946 (contains!4187 lt!377303 (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun lt!377305 () List!15846)

(assert (=> d!105749 (= lt!377303 (ListLongMap!8902 lt!377305))))

(declare-fun lt!377304 () Unit!28446)

(declare-fun lt!377302 () Unit!28446)

(assert (=> d!105749 (= lt!377304 lt!377302)))

(assert (=> d!105749 (= (getValueByKey!416 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))

(assert (=> d!105749 (= lt!377302 (lemmaContainsTupThenGetReturnValue!230 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))

(assert (=> d!105749 (= lt!377305 (insertStrictlySorted!269 (toList!4466 lt!377199) (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))

(assert (=> d!105749 (= (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)) lt!377303)))

(declare-fun b!831460 () Bool)

(declare-fun res!565947 () Bool)

(assert (=> b!831460 (=> (not res!565947) (not e!463662))))

(assert (=> b!831460 (= res!565947 (= (getValueByKey!416 (toList!4466 lt!377303) (_1!5049 (tuple2!10077 lt!377195 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(declare-fun b!831461 () Bool)

(assert (=> b!831461 (= e!463662 (contains!4188 (toList!4466 lt!377303) (tuple2!10077 lt!377195 minValue!754)))))

(assert (= (and d!105749 res!565946) b!831460))

(assert (= (and b!831460 res!565947) b!831461))

(declare-fun m!775059 () Bool)

(assert (=> d!105749 m!775059))

(declare-fun m!775061 () Bool)

(assert (=> d!105749 m!775061))

(declare-fun m!775063 () Bool)

(assert (=> d!105749 m!775063))

(declare-fun m!775065 () Bool)

(assert (=> d!105749 m!775065))

(declare-fun m!775067 () Bool)

(assert (=> b!831460 m!775067))

(declare-fun m!775069 () Bool)

(assert (=> b!831461 m!775069))

(assert (=> b!831283 d!105749))

(declare-fun d!105751 () Bool)

(assert (=> d!105751 (= (apply!372 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)) lt!377188) (apply!372 lt!377192 lt!377188))))

(declare-fun lt!377306 () Unit!28446)

(assert (=> d!105751 (= lt!377306 (choose!1424 lt!377192 lt!377200 zeroValueAfter!34 lt!377188))))

(declare-fun e!463663 () Bool)

(assert (=> d!105751 e!463663))

(declare-fun res!565948 () Bool)

(assert (=> d!105751 (=> (not res!565948) (not e!463663))))

(assert (=> d!105751 (= res!565948 (contains!4187 lt!377192 lt!377188))))

(assert (=> d!105751 (= (addApplyDifferent!323 lt!377192 lt!377200 zeroValueAfter!34 lt!377188) lt!377306)))

(declare-fun b!831462 () Bool)

(assert (=> b!831462 (= e!463663 (not (= lt!377188 lt!377200)))))

(assert (= (and d!105751 res!565948) b!831462))

(assert (=> d!105751 m!774785))

(assert (=> d!105751 m!774787))

(assert (=> d!105751 m!774791))

(assert (=> d!105751 m!774785))

(declare-fun m!775071 () Bool)

(assert (=> d!105751 m!775071))

(declare-fun m!775073 () Bool)

(assert (=> d!105751 m!775073))

(assert (=> b!831283 d!105751))

(declare-fun d!105753 () Bool)

(assert (=> d!105753 (= (apply!372 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)) lt!377193) (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754))) lt!377193)))))

(declare-fun bs!23207 () Bool)

(assert (= bs!23207 d!105753))

(declare-fun m!775075 () Bool)

(assert (=> bs!23207 m!775075))

(assert (=> bs!23207 m!775075))

(declare-fun m!775077 () Bool)

(assert (=> bs!23207 m!775077))

(assert (=> b!831283 d!105753))

(declare-fun d!105755 () Bool)

(declare-fun e!463664 () Bool)

(assert (=> d!105755 e!463664))

(declare-fun res!565949 () Bool)

(assert (=> d!105755 (=> (not res!565949) (not e!463664))))

(declare-fun lt!377308 () ListLongMap!8901)

(assert (=> d!105755 (= res!565949 (contains!4187 lt!377308 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun lt!377310 () List!15846)

(assert (=> d!105755 (= lt!377308 (ListLongMap!8902 lt!377310))))

(declare-fun lt!377309 () Unit!28446)

(declare-fun lt!377307 () Unit!28446)

(assert (=> d!105755 (= lt!377309 lt!377307)))

(assert (=> d!105755 (= (getValueByKey!416 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(assert (=> d!105755 (= lt!377307 (lemmaContainsTupThenGetReturnValue!230 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(assert (=> d!105755 (= lt!377310 (insertStrictlySorted!269 (toList!4466 lt!377190) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(assert (=> d!105755 (= (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)) lt!377308)))

(declare-fun b!831463 () Bool)

(declare-fun res!565950 () Bool)

(assert (=> b!831463 (=> (not res!565950) (not e!463664))))

(assert (=> b!831463 (= res!565950 (= (getValueByKey!416 (toList!4466 lt!377308) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(declare-fun b!831464 () Bool)

(assert (=> b!831464 (= e!463664 (contains!4188 (toList!4466 lt!377308) (tuple2!10077 lt!377189 zeroValueAfter!34)))))

(assert (= (and d!105755 res!565949) b!831463))

(assert (= (and b!831463 res!565950) b!831464))

(declare-fun m!775079 () Bool)

(assert (=> d!105755 m!775079))

(declare-fun m!775081 () Bool)

(assert (=> d!105755 m!775081))

(declare-fun m!775083 () Bool)

(assert (=> d!105755 m!775083))

(declare-fun m!775085 () Bool)

(assert (=> d!105755 m!775085))

(declare-fun m!775087 () Bool)

(assert (=> b!831463 m!775087))

(declare-fun m!775089 () Bool)

(assert (=> b!831464 m!775089))

(assert (=> b!831283 d!105755))

(declare-fun d!105757 () Bool)

(assert (=> d!105757 (= (apply!372 lt!377204 lt!377193) (get!11821 (getValueByKey!416 (toList!4466 lt!377204) lt!377193)))))

(declare-fun bs!23208 () Bool)

(assert (= bs!23208 d!105757))

(declare-fun m!775091 () Bool)

(assert (=> bs!23208 m!775091))

(assert (=> bs!23208 m!775091))

(declare-fun m!775093 () Bool)

(assert (=> bs!23208 m!775093))

(assert (=> b!831283 d!105757))

(declare-fun d!105759 () Bool)

(declare-fun lt!377311 () Bool)

(assert (=> d!105759 (= lt!377311 (select (content!386 (toList!4466 lt!377216)) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463666 () Bool)

(assert (=> d!105759 (= lt!377311 e!463666)))

(declare-fun res!565951 () Bool)

(assert (=> d!105759 (=> (not res!565951) (not e!463666))))

(assert (=> d!105759 (= res!565951 ((_ is Cons!15842) (toList!4466 lt!377216)))))

(assert (=> d!105759 (= (contains!4188 (toList!4466 lt!377216) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377311)))

(declare-fun b!831465 () Bool)

(declare-fun e!463665 () Bool)

(assert (=> b!831465 (= e!463666 e!463665)))

(declare-fun res!565952 () Bool)

(assert (=> b!831465 (=> res!565952 e!463665)))

(assert (=> b!831465 (= res!565952 (= (h!16977 (toList!4466 lt!377216)) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!831466 () Bool)

(assert (=> b!831466 (= e!463665 (contains!4188 (t!22203 (toList!4466 lt!377216)) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105759 res!565951) b!831465))

(assert (= (and b!831465 (not res!565952)) b!831466))

(declare-fun m!775095 () Bool)

(assert (=> d!105759 m!775095))

(declare-fun m!775097 () Bool)

(assert (=> d!105759 m!775097))

(declare-fun m!775099 () Bool)

(assert (=> b!831466 m!775099))

(assert (=> b!831305 d!105759))

(assert (=> b!831267 d!105697))

(declare-fun d!105761 () Bool)

(declare-fun e!463668 () Bool)

(assert (=> d!105761 e!463668))

(declare-fun res!565953 () Bool)

(assert (=> d!105761 (=> res!565953 e!463668)))

(declare-fun lt!377314 () Bool)

(assert (=> d!105761 (= res!565953 (not lt!377314))))

(declare-fun lt!377313 () Bool)

(assert (=> d!105761 (= lt!377314 lt!377313)))

(declare-fun lt!377312 () Unit!28446)

(declare-fun e!463667 () Unit!28446)

(assert (=> d!105761 (= lt!377312 e!463667)))

(declare-fun c!90236 () Bool)

(assert (=> d!105761 (= c!90236 lt!377313)))

(assert (=> d!105761 (= lt!377313 (containsKey!401 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105761 (= (contains!4187 lt!377202 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377314)))

(declare-fun b!831467 () Bool)

(declare-fun lt!377315 () Unit!28446)

(assert (=> b!831467 (= e!463667 lt!377315)))

(assert (=> b!831467 (= lt!377315 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831467 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831468 () Bool)

(declare-fun Unit!28458 () Unit!28446)

(assert (=> b!831468 (= e!463667 Unit!28458)))

(declare-fun b!831469 () Bool)

(assert (=> b!831469 (= e!463668 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105761 c!90236) b!831467))

(assert (= (and d!105761 (not c!90236)) b!831468))

(assert (= (and d!105761 (not res!565953)) b!831469))

(assert (=> d!105761 m!774611))

(declare-fun m!775101 () Bool)

(assert (=> d!105761 m!775101))

(assert (=> b!831467 m!774611))

(declare-fun m!775103 () Bool)

(assert (=> b!831467 m!775103))

(assert (=> b!831467 m!774611))

(declare-fun m!775105 () Bool)

(assert (=> b!831467 m!775105))

(assert (=> b!831467 m!775105))

(declare-fun m!775107 () Bool)

(assert (=> b!831467 m!775107))

(assert (=> b!831469 m!774611))

(assert (=> b!831469 m!775105))

(assert (=> b!831469 m!775105))

(assert (=> b!831469 m!775107))

(assert (=> b!831299 d!105761))

(declare-fun b!831470 () Bool)

(declare-fun e!463670 () Bool)

(declare-fun call!36317 () Bool)

(assert (=> b!831470 (= e!463670 call!36317)))

(declare-fun b!831471 () Bool)

(declare-fun e!463671 () Bool)

(assert (=> b!831471 (= e!463670 e!463671)))

(declare-fun lt!377316 () (_ BitVec 64))

(assert (=> b!831471 (= lt!377316 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!377317 () Unit!28446)

(assert (=> b!831471 (= lt!377317 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377316 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!831471 (arrayContainsKey!0 _keys!976 lt!377316 #b00000000000000000000000000000000)))

(declare-fun lt!377318 () Unit!28446)

(assert (=> b!831471 (= lt!377318 lt!377317)))

(declare-fun res!565955 () Bool)

(assert (=> b!831471 (= res!565955 (= (seekEntryOrOpen!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831471 (=> (not res!565955) (not e!463671))))

(declare-fun b!831472 () Bool)

(declare-fun e!463669 () Bool)

(assert (=> b!831472 (= e!463669 e!463670)))

(declare-fun c!90237 () Bool)

(assert (=> b!831472 (= c!90237 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!105763 () Bool)

(declare-fun res!565954 () Bool)

(assert (=> d!105763 (=> res!565954 e!463669)))

(assert (=> d!105763 (= res!565954 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!105763 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312) e!463669)))

(declare-fun bm!36314 () Bool)

(assert (=> bm!36314 (= call!36317 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!831473 () Bool)

(assert (=> b!831473 (= e!463671 call!36317)))

(assert (= (and d!105763 (not res!565954)) b!831472))

(assert (= (and b!831472 c!90237) b!831471))

(assert (= (and b!831472 (not c!90237)) b!831470))

(assert (= (and b!831471 res!565955) b!831473))

(assert (= (or b!831473 b!831470) bm!36314))

(assert (=> b!831471 m!774867))

(declare-fun m!775109 () Bool)

(assert (=> b!831471 m!775109))

(declare-fun m!775111 () Bool)

(assert (=> b!831471 m!775111))

(assert (=> b!831471 m!774867))

(declare-fun m!775113 () Bool)

(assert (=> b!831471 m!775113))

(assert (=> b!831472 m!774867))

(assert (=> b!831472 m!774867))

(assert (=> b!831472 m!774885))

(declare-fun m!775115 () Bool)

(assert (=> bm!36314 m!775115))

(assert (=> bm!36267 d!105763))

(declare-fun d!105765 () Bool)

(declare-fun e!463673 () Bool)

(assert (=> d!105765 e!463673))

(declare-fun res!565956 () Bool)

(assert (=> d!105765 (=> res!565956 e!463673)))

(declare-fun lt!377321 () Bool)

(assert (=> d!105765 (= res!565956 (not lt!377321))))

(declare-fun lt!377320 () Bool)

(assert (=> d!105765 (= lt!377321 lt!377320)))

(declare-fun lt!377319 () Unit!28446)

(declare-fun e!463672 () Unit!28446)

(assert (=> d!105765 (= lt!377319 e!463672)))

(declare-fun c!90238 () Bool)

(assert (=> d!105765 (= c!90238 lt!377320)))

(assert (=> d!105765 (= lt!377320 (containsKey!401 (toList!4466 lt!377208) (_1!5049 lt!377012)))))

(assert (=> d!105765 (= (contains!4187 lt!377208 (_1!5049 lt!377012)) lt!377321)))

(declare-fun b!831474 () Bool)

(declare-fun lt!377322 () Unit!28446)

(assert (=> b!831474 (= e!463672 lt!377322)))

(assert (=> b!831474 (= lt!377322 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377208) (_1!5049 lt!377012)))))

(assert (=> b!831474 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012)))))

(declare-fun b!831475 () Bool)

(declare-fun Unit!28459 () Unit!28446)

(assert (=> b!831475 (= e!463672 Unit!28459)))

(declare-fun b!831476 () Bool)

(assert (=> b!831476 (= e!463673 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012))))))

(assert (= (and d!105765 c!90238) b!831474))

(assert (= (and d!105765 (not c!90238)) b!831475))

(assert (= (and d!105765 (not res!565956)) b!831476))

(declare-fun m!775117 () Bool)

(assert (=> d!105765 m!775117))

(declare-fun m!775119 () Bool)

(assert (=> b!831474 m!775119))

(assert (=> b!831474 m!774811))

(assert (=> b!831474 m!774811))

(declare-fun m!775121 () Bool)

(assert (=> b!831474 m!775121))

(assert (=> b!831476 m!774811))

(assert (=> b!831476 m!774811))

(assert (=> b!831476 m!775121))

(assert (=> d!105683 d!105765))

(declare-fun b!831478 () Bool)

(declare-fun e!463674 () Option!422)

(declare-fun e!463675 () Option!422)

(assert (=> b!831478 (= e!463674 e!463675)))

(declare-fun c!90240 () Bool)

(assert (=> b!831478 (= c!90240 (and ((_ is Cons!15842) lt!377210) (not (= (_1!5049 (h!16977 lt!377210)) (_1!5049 lt!377012)))))))

(declare-fun b!831479 () Bool)

(assert (=> b!831479 (= e!463675 (getValueByKey!416 (t!22203 lt!377210) (_1!5049 lt!377012)))))

(declare-fun d!105767 () Bool)

(declare-fun c!90239 () Bool)

(assert (=> d!105767 (= c!90239 (and ((_ is Cons!15842) lt!377210) (= (_1!5049 (h!16977 lt!377210)) (_1!5049 lt!377012))))))

(assert (=> d!105767 (= (getValueByKey!416 lt!377210 (_1!5049 lt!377012)) e!463674)))

(declare-fun b!831477 () Bool)

(assert (=> b!831477 (= e!463674 (Some!421 (_2!5049 (h!16977 lt!377210))))))

(declare-fun b!831480 () Bool)

(assert (=> b!831480 (= e!463675 None!420)))

(assert (= (and d!105767 c!90239) b!831477))

(assert (= (and d!105767 (not c!90239)) b!831478))

(assert (= (and b!831478 c!90240) b!831479))

(assert (= (and b!831478 (not c!90240)) b!831480))

(declare-fun m!775123 () Bool)

(assert (=> b!831479 m!775123))

(assert (=> d!105683 d!105767))

(declare-fun d!105769 () Bool)

(assert (=> d!105769 (= (getValueByKey!416 lt!377210 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(declare-fun lt!377323 () Unit!28446)

(assert (=> d!105769 (= lt!377323 (choose!1423 lt!377210 (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun e!463676 () Bool)

(assert (=> d!105769 e!463676))

(declare-fun res!565957 () Bool)

(assert (=> d!105769 (=> (not res!565957) (not e!463676))))

(assert (=> d!105769 (= res!565957 (isStrictlySorted!429 lt!377210))))

(assert (=> d!105769 (= (lemmaContainsTupThenGetReturnValue!230 lt!377210 (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377323)))

(declare-fun b!831481 () Bool)

(declare-fun res!565958 () Bool)

(assert (=> b!831481 (=> (not res!565958) (not e!463676))))

(assert (=> b!831481 (= res!565958 (containsKey!401 lt!377210 (_1!5049 lt!377012)))))

(declare-fun b!831482 () Bool)

(assert (=> b!831482 (= e!463676 (contains!4188 lt!377210 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!105769 res!565957) b!831481))

(assert (= (and b!831481 res!565958) b!831482))

(assert (=> d!105769 m!774805))

(declare-fun m!775125 () Bool)

(assert (=> d!105769 m!775125))

(declare-fun m!775127 () Bool)

(assert (=> d!105769 m!775127))

(declare-fun m!775129 () Bool)

(assert (=> b!831481 m!775129))

(declare-fun m!775131 () Bool)

(assert (=> b!831482 m!775131))

(assert (=> d!105683 d!105769))

(declare-fun bm!36315 () Bool)

(declare-fun call!36318 () List!15846)

(declare-fun call!36319 () List!15846)

(assert (=> bm!36315 (= call!36318 call!36319)))

(declare-fun bm!36316 () Bool)

(declare-fun call!36320 () List!15846)

(assert (=> bm!36316 (= call!36319 call!36320)))

(declare-fun d!105771 () Bool)

(declare-fun e!463679 () Bool)

(assert (=> d!105771 e!463679))

(declare-fun res!565960 () Bool)

(assert (=> d!105771 (=> (not res!565960) (not e!463679))))

(declare-fun lt!377324 () List!15846)

(assert (=> d!105771 (= res!565960 (isStrictlySorted!429 lt!377324))))

(declare-fun e!463680 () List!15846)

(assert (=> d!105771 (= lt!377324 e!463680)))

(declare-fun c!90242 () Bool)

(assert (=> d!105771 (= c!90242 (and ((_ is Cons!15842) (toList!4466 lt!377014)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 lt!377012))))))

(assert (=> d!105771 (isStrictlySorted!429 (toList!4466 lt!377014))))

(assert (=> d!105771 (= (insertStrictlySorted!269 (toList!4466 lt!377014) (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377324)))

(declare-fun e!463681 () List!15846)

(declare-fun c!90244 () Bool)

(declare-fun b!831483 () Bool)

(declare-fun c!90243 () Bool)

(assert (=> b!831483 (= e!463681 (ite c!90244 (t!22203 (toList!4466 lt!377014)) (ite c!90243 (Cons!15842 (h!16977 (toList!4466 lt!377014)) (t!22203 (toList!4466 lt!377014))) Nil!15843)))))

(declare-fun b!831484 () Bool)

(declare-fun e!463678 () List!15846)

(assert (=> b!831484 (= e!463678 call!36318)))

(declare-fun b!831485 () Bool)

(assert (=> b!831485 (= e!463678 call!36318)))

(declare-fun b!831486 () Bool)

(declare-fun e!463677 () List!15846)

(assert (=> b!831486 (= e!463677 call!36319)))

(declare-fun bm!36317 () Bool)

(assert (=> bm!36317 (= call!36320 ($colon$colon!533 e!463681 (ite c!90242 (h!16977 (toList!4466 lt!377014)) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))))))

(declare-fun c!90241 () Bool)

(assert (=> bm!36317 (= c!90241 c!90242)))

(declare-fun b!831487 () Bool)

(assert (=> b!831487 (= e!463681 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377014)) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun b!831488 () Bool)

(declare-fun res!565959 () Bool)

(assert (=> b!831488 (=> (not res!565959) (not e!463679))))

(assert (=> b!831488 (= res!565959 (containsKey!401 lt!377324 (_1!5049 lt!377012)))))

(declare-fun b!831489 () Bool)

(assert (=> b!831489 (= e!463680 e!463677)))

(assert (=> b!831489 (= c!90244 (and ((_ is Cons!15842) (toList!4466 lt!377014)) (= (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 lt!377012))))))

(declare-fun b!831490 () Bool)

(assert (=> b!831490 (= e!463679 (contains!4188 lt!377324 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!831491 () Bool)

(assert (=> b!831491 (= e!463680 call!36320)))

(declare-fun b!831492 () Bool)

(assert (=> b!831492 (= c!90243 (and ((_ is Cons!15842) (toList!4466 lt!377014)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 lt!377012))))))

(assert (=> b!831492 (= e!463677 e!463678)))

(assert (= (and d!105771 c!90242) b!831491))

(assert (= (and d!105771 (not c!90242)) b!831489))

(assert (= (and b!831489 c!90244) b!831486))

(assert (= (and b!831489 (not c!90244)) b!831492))

(assert (= (and b!831492 c!90243) b!831484))

(assert (= (and b!831492 (not c!90243)) b!831485))

(assert (= (or b!831484 b!831485) bm!36315))

(assert (= (or b!831486 bm!36315) bm!36316))

(assert (= (or b!831491 bm!36316) bm!36317))

(assert (= (and bm!36317 c!90241) b!831487))

(assert (= (and bm!36317 (not c!90241)) b!831483))

(assert (= (and d!105771 res!565960) b!831488))

(assert (= (and b!831488 res!565959) b!831490))

(declare-fun m!775133 () Bool)

(assert (=> d!105771 m!775133))

(assert (=> d!105771 m!774961))

(declare-fun m!775135 () Bool)

(assert (=> bm!36317 m!775135))

(declare-fun m!775137 () Bool)

(assert (=> b!831487 m!775137))

(declare-fun m!775139 () Bool)

(assert (=> b!831488 m!775139))

(declare-fun m!775141 () Bool)

(assert (=> b!831490 m!775141))

(assert (=> d!105683 d!105771))

(declare-fun d!105773 () Bool)

(declare-fun lt!377325 () Bool)

(assert (=> d!105773 (= lt!377325 (select (content!386 (toList!4466 lt!377112)) lt!377012))))

(declare-fun e!463683 () Bool)

(assert (=> d!105773 (= lt!377325 e!463683)))

(declare-fun res!565961 () Bool)

(assert (=> d!105773 (=> (not res!565961) (not e!463683))))

(assert (=> d!105773 (= res!565961 ((_ is Cons!15842) (toList!4466 lt!377112)))))

(assert (=> d!105773 (= (contains!4188 (toList!4466 lt!377112) lt!377012) lt!377325)))

(declare-fun b!831493 () Bool)

(declare-fun e!463682 () Bool)

(assert (=> b!831493 (= e!463683 e!463682)))

(declare-fun res!565962 () Bool)

(assert (=> b!831493 (=> res!565962 e!463682)))

(assert (=> b!831493 (= res!565962 (= (h!16977 (toList!4466 lt!377112)) lt!377012))))

(declare-fun b!831494 () Bool)

(assert (=> b!831494 (= e!463682 (contains!4188 (t!22203 (toList!4466 lt!377112)) lt!377012))))

(assert (= (and d!105773 res!565961) b!831493))

(assert (= (and b!831493 (not res!565962)) b!831494))

(declare-fun m!775143 () Bool)

(assert (=> d!105773 m!775143))

(declare-fun m!775145 () Bool)

(assert (=> d!105773 m!775145))

(declare-fun m!775147 () Bool)

(assert (=> b!831494 m!775147))

(assert (=> b!831213 d!105773))

(assert (=> bm!36274 d!105703))

(declare-fun d!105775 () Bool)

(assert (=> d!105775 (= (apply!372 lt!377180 #b0000000000000000000000000000000000000000000000000000000000000000) (get!11821 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23209 () Bool)

(assert (= bs!23209 d!105775))

(declare-fun m!775149 () Bool)

(assert (=> bs!23209 m!775149))

(assert (=> bs!23209 m!775149))

(declare-fun m!775151 () Bool)

(assert (=> bs!23209 m!775151))

(assert (=> b!831274 d!105775))

(assert (=> b!831182 d!105697))

(declare-fun d!105777 () Bool)

(declare-fun lt!377326 () Bool)

(assert (=> d!105777 (= lt!377326 (select (content!386 (toList!4466 lt!377108)) lt!377010))))

(declare-fun e!463685 () Bool)

(assert (=> d!105777 (= lt!377326 e!463685)))

(declare-fun res!565963 () Bool)

(assert (=> d!105777 (=> (not res!565963) (not e!463685))))

(assert (=> d!105777 (= res!565963 ((_ is Cons!15842) (toList!4466 lt!377108)))))

(assert (=> d!105777 (= (contains!4188 (toList!4466 lt!377108) lt!377010) lt!377326)))

(declare-fun b!831495 () Bool)

(declare-fun e!463684 () Bool)

(assert (=> b!831495 (= e!463685 e!463684)))

(declare-fun res!565964 () Bool)

(assert (=> b!831495 (=> res!565964 e!463684)))

(assert (=> b!831495 (= res!565964 (= (h!16977 (toList!4466 lt!377108)) lt!377010))))

(declare-fun b!831496 () Bool)

(assert (=> b!831496 (= e!463684 (contains!4188 (t!22203 (toList!4466 lt!377108)) lt!377010))))

(assert (= (and d!105777 res!565963) b!831495))

(assert (= (and b!831495 (not res!565964)) b!831496))

(declare-fun m!775153 () Bool)

(assert (=> d!105777 m!775153))

(declare-fun m!775155 () Bool)

(assert (=> d!105777 m!775155))

(declare-fun m!775157 () Bool)

(assert (=> b!831496 m!775157))

(assert (=> b!831211 d!105777))

(assert (=> b!831196 d!105697))

(declare-fun d!105779 () Bool)

(declare-fun e!463687 () Bool)

(assert (=> d!105779 e!463687))

(declare-fun res!565965 () Bool)

(assert (=> d!105779 (=> res!565965 e!463687)))

(declare-fun lt!377329 () Bool)

(assert (=> d!105779 (= res!565965 (not lt!377329))))

(declare-fun lt!377328 () Bool)

(assert (=> d!105779 (= lt!377329 lt!377328)))

(declare-fun lt!377327 () Unit!28446)

(declare-fun e!463686 () Unit!28446)

(assert (=> d!105779 (= lt!377327 e!463686)))

(declare-fun c!90245 () Bool)

(assert (=> d!105779 (= c!90245 lt!377328)))

(assert (=> d!105779 (= lt!377328 (containsKey!401 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105779 (= (contains!4187 lt!377180 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377329)))

(declare-fun b!831497 () Bool)

(declare-fun lt!377330 () Unit!28446)

(assert (=> b!831497 (= e!463686 lt!377330)))

(assert (=> b!831497 (= lt!377330 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831497 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831498 () Bool)

(declare-fun Unit!28460 () Unit!28446)

(assert (=> b!831498 (= e!463686 Unit!28460)))

(declare-fun b!831499 () Bool)

(assert (=> b!831499 (= e!463687 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105779 c!90245) b!831497))

(assert (= (and d!105779 (not c!90245)) b!831498))

(assert (= (and d!105779 (not res!565965)) b!831499))

(declare-fun m!775159 () Bool)

(assert (=> d!105779 m!775159))

(declare-fun m!775161 () Bool)

(assert (=> b!831497 m!775161))

(assert (=> b!831497 m!775149))

(assert (=> b!831497 m!775149))

(declare-fun m!775163 () Bool)

(assert (=> b!831497 m!775163))

(assert (=> b!831499 m!775149))

(assert (=> b!831499 m!775149))

(assert (=> b!831499 m!775163))

(assert (=> bm!36295 d!105779))

(declare-fun d!105781 () Bool)

(declare-fun e!463689 () Bool)

(assert (=> d!105781 e!463689))

(declare-fun res!565966 () Bool)

(assert (=> d!105781 (=> res!565966 e!463689)))

(declare-fun lt!377333 () Bool)

(assert (=> d!105781 (= res!565966 (not lt!377333))))

(declare-fun lt!377332 () Bool)

(assert (=> d!105781 (= lt!377333 lt!377332)))

(declare-fun lt!377331 () Unit!28446)

(declare-fun e!463688 () Unit!28446)

(assert (=> d!105781 (= lt!377331 e!463688)))

(declare-fun c!90246 () Bool)

(assert (=> d!105781 (= c!90246 lt!377332)))

(assert (=> d!105781 (= lt!377332 (containsKey!401 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105781 (= (contains!4187 lt!377087 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377333)))

(declare-fun b!831500 () Bool)

(declare-fun lt!377334 () Unit!28446)

(assert (=> b!831500 (= e!463688 lt!377334)))

(assert (=> b!831500 (= lt!377334 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831500 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831501 () Bool)

(declare-fun Unit!28461 () Unit!28446)

(assert (=> b!831501 (= e!463688 Unit!28461)))

(declare-fun b!831502 () Bool)

(assert (=> b!831502 (= e!463689 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105781 c!90246) b!831500))

(assert (= (and d!105781 (not c!90246)) b!831501))

(assert (= (and d!105781 (not res!565966)) b!831502))

(assert (=> d!105781 m!774611))

(declare-fun m!775165 () Bool)

(assert (=> d!105781 m!775165))

(assert (=> b!831500 m!774611))

(declare-fun m!775167 () Bool)

(assert (=> b!831500 m!775167))

(assert (=> b!831500 m!774611))

(declare-fun m!775169 () Bool)

(assert (=> b!831500 m!775169))

(assert (=> b!831500 m!775169))

(declare-fun m!775171 () Bool)

(assert (=> b!831500 m!775171))

(assert (=> b!831502 m!774611))

(assert (=> b!831502 m!775169))

(assert (=> b!831502 m!775169))

(assert (=> b!831502 m!775171))

(assert (=> b!831180 d!105781))

(assert (=> d!105661 d!105665))

(assert (=> d!105661 d!105663))

(declare-fun d!105783 () Bool)

(assert (=> d!105783 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105783 true))

(declare-fun _$13!46 () Unit!28446)

(assert (=> d!105783 (= (choose!1422 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) _$13!46)))

(declare-fun bs!23210 () Bool)

(assert (= bs!23210 d!105783))

(assert (=> bs!23210 m!774513))

(assert (=> bs!23210 m!774511))

(assert (=> d!105661 d!105783))

(assert (=> d!105661 d!105667))

(declare-fun d!105785 () Bool)

(declare-fun e!463691 () Bool)

(assert (=> d!105785 e!463691))

(declare-fun res!565967 () Bool)

(assert (=> d!105785 (=> res!565967 e!463691)))

(declare-fun lt!377337 () Bool)

(assert (=> d!105785 (= res!565967 (not lt!377337))))

(declare-fun lt!377336 () Bool)

(assert (=> d!105785 (= lt!377337 lt!377336)))

(declare-fun lt!377335 () Unit!28446)

(declare-fun e!463690 () Unit!28446)

(assert (=> d!105785 (= lt!377335 e!463690)))

(declare-fun c!90247 () Bool)

(assert (=> d!105785 (= c!90247 lt!377336)))

(assert (=> d!105785 (= lt!377336 (containsKey!401 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105785 (= (contains!4187 lt!377087 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377337)))

(declare-fun b!831503 () Bool)

(declare-fun lt!377338 () Unit!28446)

(assert (=> b!831503 (= e!463690 lt!377338)))

(assert (=> b!831503 (= lt!377338 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831503 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831504 () Bool)

(declare-fun Unit!28462 () Unit!28446)

(assert (=> b!831504 (= e!463690 Unit!28462)))

(declare-fun b!831505 () Bool)

(assert (=> b!831505 (= e!463691 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105785 c!90247) b!831503))

(assert (= (and d!105785 (not c!90247)) b!831504))

(assert (= (and d!105785 (not res!565967)) b!831505))

(declare-fun m!775173 () Bool)

(assert (=> d!105785 m!775173))

(declare-fun m!775175 () Bool)

(assert (=> b!831503 m!775175))

(declare-fun m!775177 () Bool)

(assert (=> b!831503 m!775177))

(assert (=> b!831503 m!775177))

(declare-fun m!775179 () Bool)

(assert (=> b!831503 m!775179))

(assert (=> b!831505 m!775177))

(assert (=> b!831505 m!775177))

(assert (=> b!831505 m!775179))

(assert (=> d!105663 d!105785))

(assert (=> d!105663 d!105667))

(declare-fun d!105787 () Bool)

(declare-fun e!463693 () Bool)

(assert (=> d!105787 e!463693))

(declare-fun res!565968 () Bool)

(assert (=> d!105787 (=> res!565968 e!463693)))

(declare-fun lt!377341 () Bool)

(assert (=> d!105787 (= res!565968 (not lt!377341))))

(declare-fun lt!377340 () Bool)

(assert (=> d!105787 (= lt!377341 lt!377340)))

(declare-fun lt!377339 () Unit!28446)

(declare-fun e!463692 () Unit!28446)

(assert (=> d!105787 (= lt!377339 e!463692)))

(declare-fun c!90248 () Bool)

(assert (=> d!105787 (= c!90248 lt!377340)))

(assert (=> d!105787 (= lt!377340 (containsKey!401 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105787 (= (contains!4187 lt!377094 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377341)))

(declare-fun b!831506 () Bool)

(declare-fun lt!377342 () Unit!28446)

(assert (=> b!831506 (= e!463692 lt!377342)))

(assert (=> b!831506 (= lt!377342 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831506 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831507 () Bool)

(declare-fun Unit!28463 () Unit!28446)

(assert (=> b!831507 (= e!463692 Unit!28463)))

(declare-fun b!831508 () Bool)

(assert (=> b!831508 (= e!463693 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105787 c!90248) b!831506))

(assert (= (and d!105787 (not c!90248)) b!831507))

(assert (= (and d!105787 (not res!565968)) b!831508))

(assert (=> d!105787 m!774611))

(declare-fun m!775181 () Bool)

(assert (=> d!105787 m!775181))

(assert (=> b!831506 m!774611))

(declare-fun m!775183 () Bool)

(assert (=> b!831506 m!775183))

(assert (=> b!831506 m!774611))

(declare-fun m!775185 () Bool)

(assert (=> b!831506 m!775185))

(assert (=> b!831506 m!775185))

(declare-fun m!775187 () Bool)

(assert (=> b!831506 m!775187))

(assert (=> b!831508 m!774611))

(assert (=> b!831508 m!775185))

(assert (=> b!831508 m!775185))

(assert (=> b!831508 m!775187))

(assert (=> b!831194 d!105787))

(declare-fun d!105789 () Bool)

(assert (=> d!105789 (= (apply!372 lt!377202 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11821 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23211 () Bool)

(assert (= bs!23211 d!105789))

(declare-fun m!775189 () Bool)

(assert (=> bs!23211 m!775189))

(assert (=> bs!23211 m!775189))

(declare-fun m!775191 () Bool)

(assert (=> bs!23211 m!775191))

(assert (=> b!831285 d!105789))

(declare-fun d!105791 () Bool)

(assert (=> d!105791 (= (apply!372 lt!377170 lt!377166) (get!11821 (getValueByKey!416 (toList!4466 lt!377170) lt!377166)))))

(declare-fun bs!23212 () Bool)

(assert (= bs!23212 d!105791))

(declare-fun m!775193 () Bool)

(assert (=> bs!23212 m!775193))

(assert (=> bs!23212 m!775193))

(declare-fun m!775195 () Bool)

(assert (=> bs!23212 m!775195))

(assert (=> b!831262 d!105791))

(declare-fun d!105793 () Bool)

(assert (=> d!105793 (contains!4187 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)) lt!377176)))

(declare-fun lt!377343 () Unit!28446)

(assert (=> d!105793 (= lt!377343 (choose!1425 lt!377168 lt!377167 zeroValueBefore!34 lt!377176))))

(assert (=> d!105793 (contains!4187 lt!377168 lt!377176)))

(assert (=> d!105793 (= (addStillContains!323 lt!377168 lt!377167 zeroValueBefore!34 lt!377176) lt!377343)))

(declare-fun bs!23213 () Bool)

(assert (= bs!23213 d!105793))

(assert (=> bs!23213 m!774747))

(assert (=> bs!23213 m!774747))

(assert (=> bs!23213 m!774749))

(declare-fun m!775197 () Bool)

(assert (=> bs!23213 m!775197))

(declare-fun m!775199 () Bool)

(assert (=> bs!23213 m!775199))

(assert (=> b!831262 d!105793))

(declare-fun d!105795 () Bool)

(assert (=> d!105795 (= (apply!372 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)) lt!377171) (apply!372 lt!377182 lt!377171))))

(declare-fun lt!377344 () Unit!28446)

(assert (=> d!105795 (= lt!377344 (choose!1424 lt!377182 lt!377165 minValue!754 lt!377171))))

(declare-fun e!463694 () Bool)

(assert (=> d!105795 e!463694))

(declare-fun res!565969 () Bool)

(assert (=> d!105795 (=> (not res!565969) (not e!463694))))

(assert (=> d!105795 (= res!565969 (contains!4187 lt!377182 lt!377171))))

(assert (=> d!105795 (= (addApplyDifferent!323 lt!377182 lt!377165 minValue!754 lt!377171) lt!377344)))

(declare-fun b!831509 () Bool)

(assert (=> b!831509 (= e!463694 (not (= lt!377171 lt!377165)))))

(assert (= (and d!105795 res!565969) b!831509))

(assert (=> d!105795 m!774735))

(assert (=> d!105795 m!774737))

(assert (=> d!105795 m!774753))

(assert (=> d!105795 m!774735))

(declare-fun m!775201 () Bool)

(assert (=> d!105795 m!775201))

(declare-fun m!775203 () Bool)

(assert (=> d!105795 m!775203))

(assert (=> b!831262 d!105795))

(declare-fun d!105797 () Bool)

(assert (=> d!105797 (= (apply!372 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)) lt!377166) (apply!372 lt!377170 lt!377166))))

(declare-fun lt!377345 () Unit!28446)

(assert (=> d!105797 (= lt!377345 (choose!1424 lt!377170 lt!377178 zeroValueBefore!34 lt!377166))))

(declare-fun e!463695 () Bool)

(assert (=> d!105797 e!463695))

(declare-fun res!565970 () Bool)

(assert (=> d!105797 (=> (not res!565970) (not e!463695))))

(assert (=> d!105797 (= res!565970 (contains!4187 lt!377170 lt!377166))))

(assert (=> d!105797 (= (addApplyDifferent!323 lt!377170 lt!377178 zeroValueBefore!34 lt!377166) lt!377345)))

(declare-fun b!831510 () Bool)

(assert (=> b!831510 (= e!463695 (not (= lt!377166 lt!377178)))))

(assert (= (and d!105797 res!565970) b!831510))

(assert (=> d!105797 m!774739))

(assert (=> d!105797 m!774741))

(assert (=> d!105797 m!774745))

(assert (=> d!105797 m!774739))

(declare-fun m!775205 () Bool)

(assert (=> d!105797 m!775205))

(declare-fun m!775207 () Bool)

(assert (=> d!105797 m!775207))

(assert (=> b!831262 d!105797))

(declare-fun d!105799 () Bool)

(assert (=> d!105799 (= (apply!372 lt!377182 lt!377171) (get!11821 (getValueByKey!416 (toList!4466 lt!377182) lt!377171)))))

(declare-fun bs!23214 () Bool)

(assert (= bs!23214 d!105799))

(declare-fun m!775209 () Bool)

(assert (=> bs!23214 m!775209))

(assert (=> bs!23214 m!775209))

(declare-fun m!775211 () Bool)

(assert (=> bs!23214 m!775211))

(assert (=> b!831262 d!105799))

(declare-fun d!105801 () Bool)

(declare-fun e!463697 () Bool)

(assert (=> d!105801 e!463697))

(declare-fun res!565971 () Bool)

(assert (=> d!105801 (=> res!565971 e!463697)))

(declare-fun lt!377348 () Bool)

(assert (=> d!105801 (= res!565971 (not lt!377348))))

(declare-fun lt!377347 () Bool)

(assert (=> d!105801 (= lt!377348 lt!377347)))

(declare-fun lt!377346 () Unit!28446)

(declare-fun e!463696 () Unit!28446)

(assert (=> d!105801 (= lt!377346 e!463696)))

(declare-fun c!90249 () Bool)

(assert (=> d!105801 (= c!90249 lt!377347)))

(assert (=> d!105801 (= lt!377347 (containsKey!401 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))

(assert (=> d!105801 (= (contains!4187 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)) lt!377176) lt!377348)))

(declare-fun b!831511 () Bool)

(declare-fun lt!377349 () Unit!28446)

(assert (=> b!831511 (= e!463696 lt!377349)))

(assert (=> b!831511 (= lt!377349 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))

(assert (=> b!831511 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))

(declare-fun b!831512 () Bool)

(declare-fun Unit!28464 () Unit!28446)

(assert (=> b!831512 (= e!463696 Unit!28464)))

(declare-fun b!831513 () Bool)

(assert (=> b!831513 (= e!463697 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176)))))

(assert (= (and d!105801 c!90249) b!831511))

(assert (= (and d!105801 (not c!90249)) b!831512))

(assert (= (and d!105801 (not res!565971)) b!831513))

(declare-fun m!775213 () Bool)

(assert (=> d!105801 m!775213))

(declare-fun m!775215 () Bool)

(assert (=> b!831511 m!775215))

(declare-fun m!775217 () Bool)

(assert (=> b!831511 m!775217))

(assert (=> b!831511 m!775217))

(declare-fun m!775219 () Bool)

(assert (=> b!831511 m!775219))

(assert (=> b!831513 m!775217))

(assert (=> b!831513 m!775217))

(assert (=> b!831513 m!775219))

(assert (=> b!831262 d!105801))

(declare-fun d!105803 () Bool)

(assert (=> d!105803 (= (apply!372 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)) lt!377166) (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377166)))))

(declare-fun bs!23215 () Bool)

(assert (= bs!23215 d!105803))

(declare-fun m!775221 () Bool)

(assert (=> bs!23215 m!775221))

(assert (=> bs!23215 m!775221))

(declare-fun m!775223 () Bool)

(assert (=> bs!23215 m!775223))

(assert (=> b!831262 d!105803))

(declare-fun d!105805 () Bool)

(assert (=> d!105805 (= (apply!372 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)) lt!377172) (apply!372 lt!377177 lt!377172))))

(declare-fun lt!377350 () Unit!28446)

(assert (=> d!105805 (= lt!377350 (choose!1424 lt!377177 lt!377173 minValue!754 lt!377172))))

(declare-fun e!463698 () Bool)

(assert (=> d!105805 e!463698))

(declare-fun res!565972 () Bool)

(assert (=> d!105805 (=> (not res!565972) (not e!463698))))

(assert (=> d!105805 (= res!565972 (contains!4187 lt!377177 lt!377172))))

(assert (=> d!105805 (= (addApplyDifferent!323 lt!377177 lt!377173 minValue!754 lt!377172) lt!377350)))

(declare-fun b!831514 () Bool)

(assert (=> b!831514 (= e!463698 (not (= lt!377172 lt!377173)))))

(assert (= (and d!105805 res!565972) b!831514))

(assert (=> d!105805 m!774731))

(assert (=> d!105805 m!774733))

(assert (=> d!105805 m!774725))

(assert (=> d!105805 m!774731))

(declare-fun m!775225 () Bool)

(assert (=> d!105805 m!775225))

(declare-fun m!775227 () Bool)

(assert (=> d!105805 m!775227))

(assert (=> b!831262 d!105805))

(declare-fun d!105807 () Bool)

(declare-fun e!463699 () Bool)

(assert (=> d!105807 e!463699))

(declare-fun res!565973 () Bool)

(assert (=> d!105807 (=> (not res!565973) (not e!463699))))

(declare-fun lt!377352 () ListLongMap!8901)

(assert (=> d!105807 (= res!565973 (contains!4187 lt!377352 (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun lt!377354 () List!15846)

(assert (=> d!105807 (= lt!377352 (ListLongMap!8902 lt!377354))))

(declare-fun lt!377353 () Unit!28446)

(declare-fun lt!377351 () Unit!28446)

(assert (=> d!105807 (= lt!377353 lt!377351)))

(assert (=> d!105807 (= (getValueByKey!416 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))

(assert (=> d!105807 (= lt!377351 (lemmaContainsTupThenGetReturnValue!230 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))

(assert (=> d!105807 (= lt!377354 (insertStrictlySorted!269 (toList!4466 lt!377177) (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))

(assert (=> d!105807 (= (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)) lt!377352)))

(declare-fun b!831515 () Bool)

(declare-fun res!565974 () Bool)

(assert (=> b!831515 (=> (not res!565974) (not e!463699))))

(assert (=> b!831515 (= res!565974 (= (getValueByKey!416 (toList!4466 lt!377352) (_1!5049 (tuple2!10077 lt!377173 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(declare-fun b!831516 () Bool)

(assert (=> b!831516 (= e!463699 (contains!4188 (toList!4466 lt!377352) (tuple2!10077 lt!377173 minValue!754)))))

(assert (= (and d!105807 res!565973) b!831515))

(assert (= (and b!831515 res!565974) b!831516))

(declare-fun m!775229 () Bool)

(assert (=> d!105807 m!775229))

(declare-fun m!775231 () Bool)

(assert (=> d!105807 m!775231))

(declare-fun m!775233 () Bool)

(assert (=> d!105807 m!775233))

(declare-fun m!775235 () Bool)

(assert (=> d!105807 m!775235))

(declare-fun m!775237 () Bool)

(assert (=> b!831515 m!775237))

(declare-fun m!775239 () Bool)

(assert (=> b!831516 m!775239))

(assert (=> b!831262 d!105807))

(declare-fun d!105809 () Bool)

(declare-fun e!463700 () Bool)

(assert (=> d!105809 e!463700))

(declare-fun res!565975 () Bool)

(assert (=> d!105809 (=> (not res!565975) (not e!463700))))

(declare-fun lt!377356 () ListLongMap!8901)

(assert (=> d!105809 (= res!565975 (contains!4187 lt!377356 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun lt!377358 () List!15846)

(assert (=> d!105809 (= lt!377356 (ListLongMap!8902 lt!377358))))

(declare-fun lt!377357 () Unit!28446)

(declare-fun lt!377355 () Unit!28446)

(assert (=> d!105809 (= lt!377357 lt!377355)))

(assert (=> d!105809 (= (getValueByKey!416 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(assert (=> d!105809 (= lt!377355 (lemmaContainsTupThenGetReturnValue!230 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(assert (=> d!105809 (= lt!377358 (insertStrictlySorted!269 (toList!4466 lt!377168) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(assert (=> d!105809 (= (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)) lt!377356)))

(declare-fun b!831517 () Bool)

(declare-fun res!565976 () Bool)

(assert (=> b!831517 (=> (not res!565976) (not e!463700))))

(assert (=> b!831517 (= res!565976 (= (getValueByKey!416 (toList!4466 lt!377356) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(declare-fun b!831518 () Bool)

(assert (=> b!831518 (= e!463700 (contains!4188 (toList!4466 lt!377356) (tuple2!10077 lt!377167 zeroValueBefore!34)))))

(assert (= (and d!105809 res!565975) b!831517))

(assert (= (and b!831517 res!565976) b!831518))

(declare-fun m!775241 () Bool)

(assert (=> d!105809 m!775241))

(declare-fun m!775243 () Bool)

(assert (=> d!105809 m!775243))

(declare-fun m!775245 () Bool)

(assert (=> d!105809 m!775245))

(declare-fun m!775247 () Bool)

(assert (=> d!105809 m!775247))

(declare-fun m!775249 () Bool)

(assert (=> b!831517 m!775249))

(declare-fun m!775251 () Bool)

(assert (=> b!831518 m!775251))

(assert (=> b!831262 d!105809))

(declare-fun d!105811 () Bool)

(assert (=> d!105811 (= (apply!372 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)) lt!377171) (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754))) lt!377171)))))

(declare-fun bs!23216 () Bool)

(assert (= bs!23216 d!105811))

(declare-fun m!775253 () Bool)

(assert (=> bs!23216 m!775253))

(assert (=> bs!23216 m!775253))

(declare-fun m!775255 () Bool)

(assert (=> bs!23216 m!775255))

(assert (=> b!831262 d!105811))

(assert (=> b!831262 d!105665))

(declare-fun d!105813 () Bool)

(declare-fun e!463701 () Bool)

(assert (=> d!105813 e!463701))

(declare-fun res!565977 () Bool)

(assert (=> d!105813 (=> (not res!565977) (not e!463701))))

(declare-fun lt!377360 () ListLongMap!8901)

(assert (=> d!105813 (= res!565977 (contains!4187 lt!377360 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun lt!377362 () List!15846)

(assert (=> d!105813 (= lt!377360 (ListLongMap!8902 lt!377362))))

(declare-fun lt!377361 () Unit!28446)

(declare-fun lt!377359 () Unit!28446)

(assert (=> d!105813 (= lt!377361 lt!377359)))

(assert (=> d!105813 (= (getValueByKey!416 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(assert (=> d!105813 (= lt!377359 (lemmaContainsTupThenGetReturnValue!230 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(assert (=> d!105813 (= lt!377362 (insertStrictlySorted!269 (toList!4466 lt!377170) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(assert (=> d!105813 (= (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)) lt!377360)))

(declare-fun b!831519 () Bool)

(declare-fun res!565978 () Bool)

(assert (=> b!831519 (=> (not res!565978) (not e!463701))))

(assert (=> b!831519 (= res!565978 (= (getValueByKey!416 (toList!4466 lt!377360) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(declare-fun b!831520 () Bool)

(assert (=> b!831520 (= e!463701 (contains!4188 (toList!4466 lt!377360) (tuple2!10077 lt!377178 zeroValueBefore!34)))))

(assert (= (and d!105813 res!565977) b!831519))

(assert (= (and b!831519 res!565978) b!831520))

(declare-fun m!775257 () Bool)

(assert (=> d!105813 m!775257))

(declare-fun m!775259 () Bool)

(assert (=> d!105813 m!775259))

(declare-fun m!775261 () Bool)

(assert (=> d!105813 m!775261))

(declare-fun m!775263 () Bool)

(assert (=> d!105813 m!775263))

(declare-fun m!775265 () Bool)

(assert (=> b!831519 m!775265))

(declare-fun m!775267 () Bool)

(assert (=> b!831520 m!775267))

(assert (=> b!831262 d!105813))

(declare-fun d!105815 () Bool)

(declare-fun e!463702 () Bool)

(assert (=> d!105815 e!463702))

(declare-fun res!565979 () Bool)

(assert (=> d!105815 (=> (not res!565979) (not e!463702))))

(declare-fun lt!377364 () ListLongMap!8901)

(assert (=> d!105815 (= res!565979 (contains!4187 lt!377364 (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun lt!377366 () List!15846)

(assert (=> d!105815 (= lt!377364 (ListLongMap!8902 lt!377366))))

(declare-fun lt!377365 () Unit!28446)

(declare-fun lt!377363 () Unit!28446)

(assert (=> d!105815 (= lt!377365 lt!377363)))

(assert (=> d!105815 (= (getValueByKey!416 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))

(assert (=> d!105815 (= lt!377363 (lemmaContainsTupThenGetReturnValue!230 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))

(assert (=> d!105815 (= lt!377366 (insertStrictlySorted!269 (toList!4466 lt!377182) (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))

(assert (=> d!105815 (= (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)) lt!377364)))

(declare-fun b!831521 () Bool)

(declare-fun res!565980 () Bool)

(assert (=> b!831521 (=> (not res!565980) (not e!463702))))

(assert (=> b!831521 (= res!565980 (= (getValueByKey!416 (toList!4466 lt!377364) (_1!5049 (tuple2!10077 lt!377165 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(declare-fun b!831522 () Bool)

(assert (=> b!831522 (= e!463702 (contains!4188 (toList!4466 lt!377364) (tuple2!10077 lt!377165 minValue!754)))))

(assert (= (and d!105815 res!565979) b!831521))

(assert (= (and b!831521 res!565980) b!831522))

(declare-fun m!775269 () Bool)

(assert (=> d!105815 m!775269))

(declare-fun m!775271 () Bool)

(assert (=> d!105815 m!775271))

(declare-fun m!775273 () Bool)

(assert (=> d!105815 m!775273))

(declare-fun m!775275 () Bool)

(assert (=> d!105815 m!775275))

(declare-fun m!775277 () Bool)

(assert (=> b!831521 m!775277))

(declare-fun m!775279 () Bool)

(assert (=> b!831522 m!775279))

(assert (=> b!831262 d!105815))

(declare-fun d!105817 () Bool)

(assert (=> d!105817 (= (apply!372 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)) lt!377172) (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754))) lt!377172)))))

(declare-fun bs!23217 () Bool)

(assert (= bs!23217 d!105817))

(declare-fun m!775281 () Bool)

(assert (=> bs!23217 m!775281))

(assert (=> bs!23217 m!775281))

(declare-fun m!775283 () Bool)

(assert (=> bs!23217 m!775283))

(assert (=> b!831262 d!105817))

(declare-fun d!105819 () Bool)

(assert (=> d!105819 (= (apply!372 lt!377177 lt!377172) (get!11821 (getValueByKey!416 (toList!4466 lt!377177) lt!377172)))))

(declare-fun bs!23218 () Bool)

(assert (= bs!23218 d!105819))

(declare-fun m!775285 () Bool)

(assert (=> bs!23218 m!775285))

(assert (=> bs!23218 m!775285))

(declare-fun m!775287 () Bool)

(assert (=> bs!23218 m!775287))

(assert (=> b!831262 d!105819))

(declare-fun d!105821 () Bool)

(assert (=> d!105821 (= (apply!372 lt!377094 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11821 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23219 () Bool)

(assert (= bs!23219 d!105821))

(assert (=> bs!23219 m!774611))

(assert (=> bs!23219 m!775185))

(assert (=> bs!23219 m!775185))

(declare-fun m!775289 () Bool)

(assert (=> bs!23219 m!775289))

(assert (=> b!831203 d!105821))

(assert (=> b!831203 d!105709))

(assert (=> b!831151 d!105697))

(declare-fun d!105823 () Bool)

(declare-fun e!463704 () Bool)

(assert (=> d!105823 e!463704))

(declare-fun res!565981 () Bool)

(assert (=> d!105823 (=> res!565981 e!463704)))

(declare-fun lt!377369 () Bool)

(assert (=> d!105823 (= res!565981 (not lt!377369))))

(declare-fun lt!377368 () Bool)

(assert (=> d!105823 (= lt!377369 lt!377368)))

(declare-fun lt!377367 () Unit!28446)

(declare-fun e!463703 () Unit!28446)

(assert (=> d!105823 (= lt!377367 e!463703)))

(declare-fun c!90250 () Bool)

(assert (=> d!105823 (= c!90250 lt!377368)))

(assert (=> d!105823 (= lt!377368 (containsKey!401 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105823 (= (contains!4187 lt!377216 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377369)))

(declare-fun b!831523 () Bool)

(declare-fun lt!377370 () Unit!28446)

(assert (=> b!831523 (= e!463703 lt!377370)))

(assert (=> b!831523 (= lt!377370 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> b!831523 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831524 () Bool)

(declare-fun Unit!28465 () Unit!28446)

(assert (=> b!831524 (= e!463703 Unit!28465)))

(declare-fun b!831525 () Bool)

(assert (=> b!831525 (= e!463704 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105823 c!90250) b!831523))

(assert (= (and d!105823 (not c!90250)) b!831524))

(assert (= (and d!105823 (not res!565981)) b!831525))

(declare-fun m!775291 () Bool)

(assert (=> d!105823 m!775291))

(declare-fun m!775293 () Bool)

(assert (=> b!831523 m!775293))

(assert (=> b!831523 m!774835))

(assert (=> b!831523 m!774835))

(declare-fun m!775295 () Bool)

(assert (=> b!831523 m!775295))

(assert (=> b!831525 m!774835))

(assert (=> b!831525 m!774835))

(assert (=> b!831525 m!775295))

(assert (=> d!105687 d!105823))

(declare-fun b!831527 () Bool)

(declare-fun e!463705 () Option!422)

(declare-fun e!463706 () Option!422)

(assert (=> b!831527 (= e!463705 e!463706)))

(declare-fun c!90252 () Bool)

(assert (=> b!831527 (= c!90252 (and ((_ is Cons!15842) lt!377218) (not (= (_1!5049 (h!16977 lt!377218)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!831528 () Bool)

(assert (=> b!831528 (= e!463706 (getValueByKey!416 (t!22203 lt!377218) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!105825 () Bool)

(declare-fun c!90251 () Bool)

(assert (=> d!105825 (= c!90251 (and ((_ is Cons!15842) lt!377218) (= (_1!5049 (h!16977 lt!377218)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105825 (= (getValueByKey!416 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463705)))

(declare-fun b!831526 () Bool)

(assert (=> b!831526 (= e!463705 (Some!421 (_2!5049 (h!16977 lt!377218))))))

(declare-fun b!831529 () Bool)

(assert (=> b!831529 (= e!463706 None!420)))

(assert (= (and d!105825 c!90251) b!831526))

(assert (= (and d!105825 (not c!90251)) b!831527))

(assert (= (and b!831527 c!90252) b!831528))

(assert (= (and b!831527 (not c!90252)) b!831529))

(declare-fun m!775297 () Bool)

(assert (=> b!831528 m!775297))

(assert (=> d!105687 d!105825))

(declare-fun d!105827 () Bool)

(assert (=> d!105827 (= (getValueByKey!416 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377371 () Unit!28446)

(assert (=> d!105827 (= lt!377371 (choose!1423 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!463707 () Bool)

(assert (=> d!105827 e!463707))

(declare-fun res!565982 () Bool)

(assert (=> d!105827 (=> (not res!565982) (not e!463707))))

(assert (=> d!105827 (= res!565982 (isStrictlySorted!429 lt!377218))))

(assert (=> d!105827 (= (lemmaContainsTupThenGetReturnValue!230 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377371)))

(declare-fun b!831530 () Bool)

(declare-fun res!565983 () Bool)

(assert (=> b!831530 (=> (not res!565983) (not e!463707))))

(assert (=> b!831530 (= res!565983 (containsKey!401 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831531 () Bool)

(assert (=> b!831531 (= e!463707 (contains!4188 lt!377218 (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!105827 res!565982) b!831530))

(assert (= (and b!831530 res!565983) b!831531))

(assert (=> d!105827 m!774829))

(declare-fun m!775299 () Bool)

(assert (=> d!105827 m!775299))

(declare-fun m!775301 () Bool)

(assert (=> d!105827 m!775301))

(declare-fun m!775303 () Bool)

(assert (=> b!831530 m!775303))

(declare-fun m!775305 () Bool)

(assert (=> b!831531 m!775305))

(assert (=> d!105687 d!105827))

(declare-fun bm!36318 () Bool)

(declare-fun call!36321 () List!15846)

(declare-fun call!36322 () List!15846)

(assert (=> bm!36318 (= call!36321 call!36322)))

(declare-fun bm!36319 () Bool)

(declare-fun call!36323 () List!15846)

(assert (=> bm!36319 (= call!36322 call!36323)))

(declare-fun d!105829 () Bool)

(declare-fun e!463710 () Bool)

(assert (=> d!105829 e!463710))

(declare-fun res!565985 () Bool)

(assert (=> d!105829 (=> (not res!565985) (not e!463710))))

(declare-fun lt!377372 () List!15846)

(assert (=> d!105829 (= res!565985 (isStrictlySorted!429 lt!377372))))

(declare-fun e!463711 () List!15846)

(assert (=> d!105829 (= lt!377372 e!463711)))

(declare-fun c!90254 () Bool)

(assert (=> d!105829 (= c!90254 (and ((_ is Cons!15842) (toList!4466 lt!377013)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377013))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105829 (isStrictlySorted!429 (toList!4466 lt!377013))))

(assert (=> d!105829 (= (insertStrictlySorted!269 (toList!4466 lt!377013) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377372)))

(declare-fun c!90255 () Bool)

(declare-fun c!90256 () Bool)

(declare-fun b!831532 () Bool)

(declare-fun e!463712 () List!15846)

(assert (=> b!831532 (= e!463712 (ite c!90256 (t!22203 (toList!4466 lt!377013)) (ite c!90255 (Cons!15842 (h!16977 (toList!4466 lt!377013)) (t!22203 (toList!4466 lt!377013))) Nil!15843)))))

(declare-fun b!831533 () Bool)

(declare-fun e!463709 () List!15846)

(assert (=> b!831533 (= e!463709 call!36321)))

(declare-fun b!831534 () Bool)

(assert (=> b!831534 (= e!463709 call!36321)))

(declare-fun b!831535 () Bool)

(declare-fun e!463708 () List!15846)

(assert (=> b!831535 (= e!463708 call!36322)))

(declare-fun bm!36320 () Bool)

(assert (=> bm!36320 (= call!36323 ($colon$colon!533 e!463712 (ite c!90254 (h!16977 (toList!4466 lt!377013)) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90253 () Bool)

(assert (=> bm!36320 (= c!90253 c!90254)))

(declare-fun b!831536 () Bool)

(assert (=> b!831536 (= e!463712 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377013)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831537 () Bool)

(declare-fun res!565984 () Bool)

(assert (=> b!831537 (=> (not res!565984) (not e!463710))))

(assert (=> b!831537 (= res!565984 (containsKey!401 lt!377372 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831538 () Bool)

(assert (=> b!831538 (= e!463711 e!463708)))

(assert (=> b!831538 (= c!90256 (and ((_ is Cons!15842) (toList!4466 lt!377013)) (= (_1!5049 (h!16977 (toList!4466 lt!377013))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831539 () Bool)

(assert (=> b!831539 (= e!463710 (contains!4188 lt!377372 (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831540 () Bool)

(assert (=> b!831540 (= e!463711 call!36323)))

(declare-fun b!831541 () Bool)

(assert (=> b!831541 (= c!90255 (and ((_ is Cons!15842) (toList!4466 lt!377013)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377013))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!831541 (= e!463708 e!463709)))

(assert (= (and d!105829 c!90254) b!831540))

(assert (= (and d!105829 (not c!90254)) b!831538))

(assert (= (and b!831538 c!90256) b!831535))

(assert (= (and b!831538 (not c!90256)) b!831541))

(assert (= (and b!831541 c!90255) b!831533))

(assert (= (and b!831541 (not c!90255)) b!831534))

(assert (= (or b!831533 b!831534) bm!36318))

(assert (= (or b!831535 bm!36318) bm!36319))

(assert (= (or b!831540 bm!36319) bm!36320))

(assert (= (and bm!36320 c!90253) b!831536))

(assert (= (and bm!36320 (not c!90253)) b!831532))

(assert (= (and d!105829 res!565985) b!831537))

(assert (= (and b!831537 res!565984) b!831539))

(declare-fun m!775307 () Bool)

(assert (=> d!105829 m!775307))

(declare-fun m!775309 () Bool)

(assert (=> d!105829 m!775309))

(declare-fun m!775311 () Bool)

(assert (=> bm!36320 m!775311))

(declare-fun m!775313 () Bool)

(assert (=> b!831536 m!775313))

(declare-fun m!775315 () Bool)

(assert (=> b!831537 m!775315))

(declare-fun m!775317 () Bool)

(assert (=> b!831539 m!775317))

(assert (=> d!105687 d!105829))

(declare-fun d!105831 () Bool)

(declare-fun e!463714 () Bool)

(assert (=> d!105831 e!463714))

(declare-fun res!565986 () Bool)

(assert (=> d!105831 (=> res!565986 e!463714)))

(declare-fun lt!377375 () Bool)

(assert (=> d!105831 (= res!565986 (not lt!377375))))

(declare-fun lt!377374 () Bool)

(assert (=> d!105831 (= lt!377375 lt!377374)))

(declare-fun lt!377373 () Unit!28446)

(declare-fun e!463713 () Unit!28446)

(assert (=> d!105831 (= lt!377373 e!463713)))

(declare-fun c!90257 () Bool)

(assert (=> d!105831 (= c!90257 lt!377374)))

(assert (=> d!105831 (= lt!377374 (containsKey!401 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> d!105831 (= (contains!4187 lt!377180 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377375)))

(declare-fun b!831542 () Bool)

(declare-fun lt!377376 () Unit!28446)

(assert (=> b!831542 (= e!463713 lt!377376)))

(assert (=> b!831542 (= lt!377376 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831542 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831543 () Bool)

(declare-fun Unit!28466 () Unit!28446)

(assert (=> b!831543 (= e!463713 Unit!28466)))

(declare-fun b!831544 () Bool)

(assert (=> b!831544 (= e!463714 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (= (and d!105831 c!90257) b!831542))

(assert (= (and d!105831 (not c!90257)) b!831543))

(assert (= (and d!105831 (not res!565986)) b!831544))

(assert (=> d!105831 m!774611))

(declare-fun m!775319 () Bool)

(assert (=> d!105831 m!775319))

(assert (=> b!831542 m!774611))

(declare-fun m!775321 () Bool)

(assert (=> b!831542 m!775321))

(assert (=> b!831542 m!774611))

(assert (=> b!831542 m!774923))

(assert (=> b!831542 m!774923))

(declare-fun m!775323 () Bool)

(assert (=> b!831542 m!775323))

(assert (=> b!831544 m!774611))

(assert (=> b!831544 m!774923))

(assert (=> b!831544 m!774923))

(assert (=> b!831544 m!775323))

(assert (=> b!831278 d!105831))

(declare-fun d!105833 () Bool)

(declare-fun e!463715 () Bool)

(assert (=> d!105833 e!463715))

(declare-fun res!565987 () Bool)

(assert (=> d!105833 (=> (not res!565987) (not e!463715))))

(declare-fun lt!377378 () ListLongMap!8901)

(assert (=> d!105833 (= res!565987 (contains!4187 lt!377378 (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun lt!377380 () List!15846)

(assert (=> d!105833 (= lt!377378 (ListLongMap!8902 lt!377380))))

(declare-fun lt!377379 () Unit!28446)

(declare-fun lt!377377 () Unit!28446)

(assert (=> d!105833 (= lt!377379 lt!377377)))

(assert (=> d!105833 (= (getValueByKey!416 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091))) (Some!421 (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))

(assert (=> d!105833 (= lt!377377 (lemmaContainsTupThenGetReturnValue!230 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))

(assert (=> d!105833 (= lt!377380 (insertStrictlySorted!269 (toList!4466 lt!377090) (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))

(assert (=> d!105833 (= (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)) lt!377378)))

(declare-fun b!831545 () Bool)

(declare-fun res!565988 () Bool)

(assert (=> b!831545 (=> (not res!565988) (not e!463715))))

(assert (=> b!831545 (= res!565988 (= (getValueByKey!416 (toList!4466 lt!377378) (_1!5049 (tuple2!10077 lt!377086 lt!377091))) (Some!421 (_2!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(declare-fun b!831546 () Bool)

(assert (=> b!831546 (= e!463715 (contains!4188 (toList!4466 lt!377378) (tuple2!10077 lt!377086 lt!377091)))))

(assert (= (and d!105833 res!565987) b!831545))

(assert (= (and b!831545 res!565988) b!831546))

(declare-fun m!775325 () Bool)

(assert (=> d!105833 m!775325))

(declare-fun m!775327 () Bool)

(assert (=> d!105833 m!775327))

(declare-fun m!775329 () Bool)

(assert (=> d!105833 m!775329))

(declare-fun m!775331 () Bool)

(assert (=> d!105833 m!775331))

(declare-fun m!775333 () Bool)

(assert (=> b!831545 m!775333))

(declare-fun m!775335 () Bool)

(assert (=> b!831546 m!775335))

(assert (=> b!831185 d!105833))

(assert (=> b!831185 d!105709))

(declare-fun d!105835 () Bool)

(declare-fun e!463716 () Bool)

(assert (=> d!105835 e!463716))

(declare-fun res!565989 () Bool)

(assert (=> d!105835 (=> (not res!565989) (not e!463716))))

(declare-fun lt!377382 () ListLongMap!8901)

(assert (=> d!105835 (= res!565989 (contains!4187 lt!377382 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377384 () List!15846)

(assert (=> d!105835 (= lt!377382 (ListLongMap!8902 lt!377384))))

(declare-fun lt!377383 () Unit!28446)

(declare-fun lt!377381 () Unit!28446)

(assert (=> d!105835 (= lt!377383 lt!377381)))

(assert (=> d!105835 (= (getValueByKey!416 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105835 (= lt!377381 (lemmaContainsTupThenGetReturnValue!230 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105835 (= lt!377384 (insertStrictlySorted!269 (toList!4466 call!36276) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105835 (= (+!1988 call!36276 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377382)))

(declare-fun b!831547 () Bool)

(declare-fun res!565990 () Bool)

(assert (=> b!831547 (=> (not res!565990) (not e!463716))))

(assert (=> b!831547 (= res!565990 (= (getValueByKey!416 (toList!4466 lt!377382) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831548 () Bool)

(assert (=> b!831548 (= e!463716 (contains!4188 (toList!4466 lt!377382) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105835 res!565989) b!831547))

(assert (= (and b!831547 res!565990) b!831548))

(declare-fun m!775337 () Bool)

(assert (=> d!105835 m!775337))

(declare-fun m!775339 () Bool)

(assert (=> d!105835 m!775339))

(declare-fun m!775341 () Bool)

(assert (=> d!105835 m!775341))

(declare-fun m!775343 () Bool)

(assert (=> d!105835 m!775343))

(declare-fun m!775345 () Bool)

(assert (=> b!831547 m!775345))

(declare-fun m!775347 () Bool)

(assert (=> b!831548 m!775347))

(assert (=> b!831185 d!105835))

(declare-fun d!105837 () Bool)

(assert (=> d!105837 (not (contains!4187 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)) lt!377089))))

(declare-fun lt!377387 () Unit!28446)

(declare-fun choose!1426 (ListLongMap!8901 (_ BitVec 64) V!25275 (_ BitVec 64)) Unit!28446)

(assert (=> d!105837 (= lt!377387 (choose!1426 lt!377090 lt!377086 lt!377091 lt!377089))))

(declare-fun e!463719 () Bool)

(assert (=> d!105837 e!463719))

(declare-fun res!565993 () Bool)

(assert (=> d!105837 (=> (not res!565993) (not e!463719))))

(assert (=> d!105837 (= res!565993 (not (contains!4187 lt!377090 lt!377089)))))

(assert (=> d!105837 (= (addStillNotContains!199 lt!377090 lt!377086 lt!377091 lt!377089) lt!377387)))

(declare-fun b!831552 () Bool)

(assert (=> b!831552 (= e!463719 (not (= lt!377086 lt!377089)))))

(assert (= (and d!105837 res!565993) b!831552))

(assert (=> d!105837 m!774635))

(assert (=> d!105837 m!774635))

(assert (=> d!105837 m!774639))

(declare-fun m!775349 () Bool)

(assert (=> d!105837 m!775349))

(declare-fun m!775351 () Bool)

(assert (=> d!105837 m!775351))

(assert (=> b!831185 d!105837))

(declare-fun d!105839 () Bool)

(declare-fun e!463721 () Bool)

(assert (=> d!105839 e!463721))

(declare-fun res!565994 () Bool)

(assert (=> d!105839 (=> res!565994 e!463721)))

(declare-fun lt!377390 () Bool)

(assert (=> d!105839 (= res!565994 (not lt!377390))))

(declare-fun lt!377389 () Bool)

(assert (=> d!105839 (= lt!377390 lt!377389)))

(declare-fun lt!377388 () Unit!28446)

(declare-fun e!463720 () Unit!28446)

(assert (=> d!105839 (= lt!377388 e!463720)))

(declare-fun c!90258 () Bool)

(assert (=> d!105839 (= c!90258 lt!377389)))

(assert (=> d!105839 (= lt!377389 (containsKey!401 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))

(assert (=> d!105839 (= (contains!4187 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)) lt!377089) lt!377390)))

(declare-fun b!831553 () Bool)

(declare-fun lt!377391 () Unit!28446)

(assert (=> b!831553 (= e!463720 lt!377391)))

(assert (=> b!831553 (= lt!377391 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))

(assert (=> b!831553 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))

(declare-fun b!831554 () Bool)

(declare-fun Unit!28467 () Unit!28446)

(assert (=> b!831554 (= e!463720 Unit!28467)))

(declare-fun b!831555 () Bool)

(assert (=> b!831555 (= e!463721 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089)))))

(assert (= (and d!105839 c!90258) b!831553))

(assert (= (and d!105839 (not c!90258)) b!831554))

(assert (= (and d!105839 (not res!565994)) b!831555))

(declare-fun m!775353 () Bool)

(assert (=> d!105839 m!775353))

(declare-fun m!775355 () Bool)

(assert (=> b!831553 m!775355))

(declare-fun m!775357 () Bool)

(assert (=> b!831553 m!775357))

(assert (=> b!831553 m!775357))

(declare-fun m!775359 () Bool)

(assert (=> b!831553 m!775359))

(assert (=> b!831555 m!775357))

(assert (=> b!831555 m!775357))

(assert (=> b!831555 m!775359))

(assert (=> b!831185 d!105839))

(declare-fun d!105841 () Bool)

(declare-fun lt!377394 () Bool)

(declare-fun content!387 (List!15847) (InoxSet (_ BitVec 64)))

(assert (=> d!105841 (= lt!377394 (select (content!387 Nil!15844) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463726 () Bool)

(assert (=> d!105841 (= lt!377394 e!463726)))

(declare-fun res!566000 () Bool)

(assert (=> d!105841 (=> (not res!566000) (not e!463726))))

(assert (=> d!105841 (= res!566000 ((_ is Cons!15843) Nil!15844))))

(assert (=> d!105841 (= (contains!4186 Nil!15844 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377394)))

(declare-fun b!831560 () Bool)

(declare-fun e!463727 () Bool)

(assert (=> b!831560 (= e!463726 e!463727)))

(declare-fun res!565999 () Bool)

(assert (=> b!831560 (=> res!565999 e!463727)))

(assert (=> b!831560 (= res!565999 (= (h!16978 Nil!15844) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!831561 () Bool)

(assert (=> b!831561 (= e!463727 (contains!4186 (t!22204 Nil!15844) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105841 res!566000) b!831560))

(assert (= (and b!831560 (not res!565999)) b!831561))

(declare-fun m!775361 () Bool)

(assert (=> d!105841 m!775361))

(assert (=> d!105841 m!774611))

(declare-fun m!775363 () Bool)

(assert (=> d!105841 m!775363))

(assert (=> b!831561 m!774611))

(declare-fun m!775365 () Bool)

(assert (=> b!831561 m!775365))

(assert (=> b!831153 d!105841))

(declare-fun d!105843 () Bool)

(declare-fun e!463729 () Bool)

(assert (=> d!105843 e!463729))

(declare-fun res!566001 () Bool)

(assert (=> d!105843 (=> res!566001 e!463729)))

(declare-fun lt!377397 () Bool)

(assert (=> d!105843 (= res!566001 (not lt!377397))))

(declare-fun lt!377396 () Bool)

(assert (=> d!105843 (= lt!377397 lt!377396)))

(declare-fun lt!377395 () Unit!28446)

(declare-fun e!463728 () Unit!28446)

(assert (=> d!105843 (= lt!377395 e!463728)))

(declare-fun c!90259 () Bool)

(assert (=> d!105843 (= c!90259 lt!377396)))

(assert (=> d!105843 (= lt!377396 (containsKey!401 (toList!4466 lt!377212) (_1!5049 lt!377012)))))

(assert (=> d!105843 (= (contains!4187 lt!377212 (_1!5049 lt!377012)) lt!377397)))

(declare-fun b!831562 () Bool)

(declare-fun lt!377398 () Unit!28446)

(assert (=> b!831562 (= e!463728 lt!377398)))

(assert (=> b!831562 (= lt!377398 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377212) (_1!5049 lt!377012)))))

(assert (=> b!831562 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012)))))

(declare-fun b!831563 () Bool)

(declare-fun Unit!28468 () Unit!28446)

(assert (=> b!831563 (= e!463728 Unit!28468)))

(declare-fun b!831564 () Bool)

(assert (=> b!831564 (= e!463729 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012))))))

(assert (= (and d!105843 c!90259) b!831562))

(assert (= (and d!105843 (not c!90259)) b!831563))

(assert (= (and d!105843 (not res!566001)) b!831564))

(declare-fun m!775367 () Bool)

(assert (=> d!105843 m!775367))

(declare-fun m!775369 () Bool)

(assert (=> b!831562 m!775369))

(assert (=> b!831562 m!774823))

(assert (=> b!831562 m!774823))

(declare-fun m!775371 () Bool)

(assert (=> b!831562 m!775371))

(assert (=> b!831564 m!774823))

(assert (=> b!831564 m!774823))

(assert (=> b!831564 m!775371))

(assert (=> d!105685 d!105843))

(declare-fun b!831566 () Bool)

(declare-fun e!463730 () Option!422)

(declare-fun e!463731 () Option!422)

(assert (=> b!831566 (= e!463730 e!463731)))

(declare-fun c!90261 () Bool)

(assert (=> b!831566 (= c!90261 (and ((_ is Cons!15842) lt!377214) (not (= (_1!5049 (h!16977 lt!377214)) (_1!5049 lt!377012)))))))

(declare-fun b!831567 () Bool)

(assert (=> b!831567 (= e!463731 (getValueByKey!416 (t!22203 lt!377214) (_1!5049 lt!377012)))))

(declare-fun d!105845 () Bool)

(declare-fun c!90260 () Bool)

(assert (=> d!105845 (= c!90260 (and ((_ is Cons!15842) lt!377214) (= (_1!5049 (h!16977 lt!377214)) (_1!5049 lt!377012))))))

(assert (=> d!105845 (= (getValueByKey!416 lt!377214 (_1!5049 lt!377012)) e!463730)))

(declare-fun b!831565 () Bool)

(assert (=> b!831565 (= e!463730 (Some!421 (_2!5049 (h!16977 lt!377214))))))

(declare-fun b!831568 () Bool)

(assert (=> b!831568 (= e!463731 None!420)))

(assert (= (and d!105845 c!90260) b!831565))

(assert (= (and d!105845 (not c!90260)) b!831566))

(assert (= (and b!831566 c!90261) b!831567))

(assert (= (and b!831566 (not c!90261)) b!831568))

(declare-fun m!775373 () Bool)

(assert (=> b!831567 m!775373))

(assert (=> d!105685 d!105845))

(declare-fun d!105847 () Bool)

(assert (=> d!105847 (= (getValueByKey!416 lt!377214 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(declare-fun lt!377399 () Unit!28446)

(assert (=> d!105847 (= lt!377399 (choose!1423 lt!377214 (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun e!463732 () Bool)

(assert (=> d!105847 e!463732))

(declare-fun res!566002 () Bool)

(assert (=> d!105847 (=> (not res!566002) (not e!463732))))

(assert (=> d!105847 (= res!566002 (isStrictlySorted!429 lt!377214))))

(assert (=> d!105847 (= (lemmaContainsTupThenGetReturnValue!230 lt!377214 (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377399)))

(declare-fun b!831569 () Bool)

(declare-fun res!566003 () Bool)

(assert (=> b!831569 (=> (not res!566003) (not e!463732))))

(assert (=> b!831569 (= res!566003 (containsKey!401 lt!377214 (_1!5049 lt!377012)))))

(declare-fun b!831570 () Bool)

(assert (=> b!831570 (= e!463732 (contains!4188 lt!377214 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!105847 res!566002) b!831569))

(assert (= (and b!831569 res!566003) b!831570))

(assert (=> d!105847 m!774817))

(declare-fun m!775375 () Bool)

(assert (=> d!105847 m!775375))

(declare-fun m!775377 () Bool)

(assert (=> d!105847 m!775377))

(declare-fun m!775379 () Bool)

(assert (=> b!831569 m!775379))

(declare-fun m!775381 () Bool)

(assert (=> b!831570 m!775381))

(assert (=> d!105685 d!105847))

(declare-fun bm!36321 () Bool)

(declare-fun call!36324 () List!15846)

(declare-fun call!36325 () List!15846)

(assert (=> bm!36321 (= call!36324 call!36325)))

(declare-fun bm!36322 () Bool)

(declare-fun call!36326 () List!15846)

(assert (=> bm!36322 (= call!36325 call!36326)))

(declare-fun d!105849 () Bool)

(declare-fun e!463735 () Bool)

(assert (=> d!105849 e!463735))

(declare-fun res!566005 () Bool)

(assert (=> d!105849 (=> (not res!566005) (not e!463735))))

(declare-fun lt!377400 () List!15846)

(assert (=> d!105849 (= res!566005 (isStrictlySorted!429 lt!377400))))

(declare-fun e!463736 () List!15846)

(assert (=> d!105849 (= lt!377400 e!463736)))

(declare-fun c!90263 () Bool)

(assert (=> d!105849 (= c!90263 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5049 lt!377012))))))

(assert (=> d!105849 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105849 (= (insertStrictlySorted!269 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377400)))

(declare-fun c!90264 () Bool)

(declare-fun b!831571 () Bool)

(declare-fun c!90265 () Bool)

(declare-fun e!463737 () List!15846)

(assert (=> b!831571 (= e!463737 (ite c!90265 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (ite c!90264 (Cons!15842 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) Nil!15843)))))

(declare-fun b!831572 () Bool)

(declare-fun e!463734 () List!15846)

(assert (=> b!831572 (= e!463734 call!36324)))

(declare-fun b!831573 () Bool)

(assert (=> b!831573 (= e!463734 call!36324)))

(declare-fun b!831574 () Bool)

(declare-fun e!463733 () List!15846)

(assert (=> b!831574 (= e!463733 call!36325)))

(declare-fun bm!36323 () Bool)

(assert (=> bm!36323 (= call!36326 ($colon$colon!533 e!463737 (ite c!90263 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))))))

(declare-fun c!90262 () Bool)

(assert (=> bm!36323 (= c!90262 c!90263)))

(declare-fun b!831575 () Bool)

(assert (=> b!831575 (= e!463737 (insertStrictlySorted!269 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun b!831576 () Bool)

(declare-fun res!566004 () Bool)

(assert (=> b!831576 (=> (not res!566004) (not e!463735))))

(assert (=> b!831576 (= res!566004 (containsKey!401 lt!377400 (_1!5049 lt!377012)))))

(declare-fun b!831577 () Bool)

(assert (=> b!831577 (= e!463736 e!463733)))

(assert (=> b!831577 (= c!90265 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5049 lt!377012))))))

(declare-fun b!831578 () Bool)

(assert (=> b!831578 (= e!463735 (contains!4188 lt!377400 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!831579 () Bool)

(assert (=> b!831579 (= e!463736 call!36326)))

(declare-fun b!831580 () Bool)

(assert (=> b!831580 (= c!90264 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (bvsgt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5049 lt!377012))))))

(assert (=> b!831580 (= e!463733 e!463734)))

(assert (= (and d!105849 c!90263) b!831579))

(assert (= (and d!105849 (not c!90263)) b!831577))

(assert (= (and b!831577 c!90265) b!831574))

(assert (= (and b!831577 (not c!90265)) b!831580))

(assert (= (and b!831580 c!90264) b!831572))

(assert (= (and b!831580 (not c!90264)) b!831573))

(assert (= (or b!831572 b!831573) bm!36321))

(assert (= (or b!831574 bm!36321) bm!36322))

(assert (= (or b!831579 bm!36322) bm!36323))

(assert (= (and bm!36323 c!90262) b!831575))

(assert (= (and bm!36323 (not c!90262)) b!831571))

(assert (= (and d!105849 res!566005) b!831576))

(assert (= (and b!831576 res!566004) b!831578))

(declare-fun m!775383 () Bool)

(assert (=> d!105849 m!775383))

(declare-fun m!775385 () Bool)

(assert (=> d!105849 m!775385))

(declare-fun m!775387 () Bool)

(assert (=> bm!36323 m!775387))

(declare-fun m!775389 () Bool)

(assert (=> b!831575 m!775389))

(declare-fun m!775391 () Bool)

(assert (=> b!831576 m!775391))

(declare-fun m!775393 () Bool)

(assert (=> b!831578 m!775393))

(assert (=> d!105685 d!105849))

(declare-fun d!105851 () Bool)

(declare-fun lt!377401 () Bool)

(assert (=> d!105851 (= lt!377401 (select (content!386 (toList!4466 lt!377116)) lt!377010))))

(declare-fun e!463739 () Bool)

(assert (=> d!105851 (= lt!377401 e!463739)))

(declare-fun res!566006 () Bool)

(assert (=> d!105851 (=> (not res!566006) (not e!463739))))

(assert (=> d!105851 (= res!566006 ((_ is Cons!15842) (toList!4466 lt!377116)))))

(assert (=> d!105851 (= (contains!4188 (toList!4466 lt!377116) lt!377010) lt!377401)))

(declare-fun b!831581 () Bool)

(declare-fun e!463738 () Bool)

(assert (=> b!831581 (= e!463739 e!463738)))

(declare-fun res!566007 () Bool)

(assert (=> b!831581 (=> res!566007 e!463738)))

(assert (=> b!831581 (= res!566007 (= (h!16977 (toList!4466 lt!377116)) lt!377010))))

(declare-fun b!831582 () Bool)

(assert (=> b!831582 (= e!463738 (contains!4188 (t!22203 (toList!4466 lt!377116)) lt!377010))))

(assert (= (and d!105851 res!566006) b!831581))

(assert (= (and b!831581 (not res!566007)) b!831582))

(declare-fun m!775395 () Bool)

(assert (=> d!105851 m!775395))

(declare-fun m!775397 () Bool)

(assert (=> d!105851 m!775397))

(declare-fun m!775399 () Bool)

(assert (=> b!831582 m!775399))

(assert (=> b!831215 d!105851))

(declare-fun d!105853 () Bool)

(assert (=> d!105853 (not (contains!4187 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)) lt!377096))))

(declare-fun lt!377402 () Unit!28446)

(assert (=> d!105853 (= lt!377402 (choose!1426 lt!377097 lt!377093 lt!377098 lt!377096))))

(declare-fun e!463740 () Bool)

(assert (=> d!105853 e!463740))

(declare-fun res!566008 () Bool)

(assert (=> d!105853 (=> (not res!566008) (not e!463740))))

(assert (=> d!105853 (= res!566008 (not (contains!4187 lt!377097 lt!377096)))))

(assert (=> d!105853 (= (addStillNotContains!199 lt!377097 lt!377093 lt!377098 lt!377096) lt!377402)))

(declare-fun b!831583 () Bool)

(assert (=> b!831583 (= e!463740 (not (= lt!377093 lt!377096)))))

(assert (= (and d!105853 res!566008) b!831583))

(assert (=> d!105853 m!774661))

(assert (=> d!105853 m!774661))

(assert (=> d!105853 m!774663))

(declare-fun m!775401 () Bool)

(assert (=> d!105853 m!775401))

(declare-fun m!775403 () Bool)

(assert (=> d!105853 m!775403))

(assert (=> b!831199 d!105853))

(declare-fun d!105855 () Bool)

(declare-fun e!463741 () Bool)

(assert (=> d!105855 e!463741))

(declare-fun res!566009 () Bool)

(assert (=> d!105855 (=> (not res!566009) (not e!463741))))

(declare-fun lt!377404 () ListLongMap!8901)

(assert (=> d!105855 (= res!566009 (contains!4187 lt!377404 (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun lt!377406 () List!15846)

(assert (=> d!105855 (= lt!377404 (ListLongMap!8902 lt!377406))))

(declare-fun lt!377405 () Unit!28446)

(declare-fun lt!377403 () Unit!28446)

(assert (=> d!105855 (= lt!377405 lt!377403)))

(assert (=> d!105855 (= (getValueByKey!416 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098))) (Some!421 (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))

(assert (=> d!105855 (= lt!377403 (lemmaContainsTupThenGetReturnValue!230 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))

(assert (=> d!105855 (= lt!377406 (insertStrictlySorted!269 (toList!4466 lt!377097) (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))

(assert (=> d!105855 (= (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)) lt!377404)))

(declare-fun b!831584 () Bool)

(declare-fun res!566010 () Bool)

(assert (=> b!831584 (=> (not res!566010) (not e!463741))))

(assert (=> b!831584 (= res!566010 (= (getValueByKey!416 (toList!4466 lt!377404) (_1!5049 (tuple2!10077 lt!377093 lt!377098))) (Some!421 (_2!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(declare-fun b!831585 () Bool)

(assert (=> b!831585 (= e!463741 (contains!4188 (toList!4466 lt!377404) (tuple2!10077 lt!377093 lt!377098)))))

(assert (= (and d!105855 res!566009) b!831584))

(assert (= (and b!831584 res!566010) b!831585))

(declare-fun m!775405 () Bool)

(assert (=> d!105855 m!775405))

(declare-fun m!775407 () Bool)

(assert (=> d!105855 m!775407))

(declare-fun m!775409 () Bool)

(assert (=> d!105855 m!775409))

(declare-fun m!775411 () Bool)

(assert (=> d!105855 m!775411))

(declare-fun m!775413 () Bool)

(assert (=> b!831584 m!775413))

(declare-fun m!775415 () Bool)

(assert (=> b!831585 m!775415))

(assert (=> b!831199 d!105855))

(assert (=> b!831199 d!105709))

(declare-fun d!105857 () Bool)

(declare-fun e!463743 () Bool)

(assert (=> d!105857 e!463743))

(declare-fun res!566011 () Bool)

(assert (=> d!105857 (=> res!566011 e!463743)))

(declare-fun lt!377409 () Bool)

(assert (=> d!105857 (= res!566011 (not lt!377409))))

(declare-fun lt!377408 () Bool)

(assert (=> d!105857 (= lt!377409 lt!377408)))

(declare-fun lt!377407 () Unit!28446)

(declare-fun e!463742 () Unit!28446)

(assert (=> d!105857 (= lt!377407 e!463742)))

(declare-fun c!90266 () Bool)

(assert (=> d!105857 (= c!90266 lt!377408)))

(assert (=> d!105857 (= lt!377408 (containsKey!401 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))

(assert (=> d!105857 (= (contains!4187 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)) lt!377096) lt!377409)))

(declare-fun b!831586 () Bool)

(declare-fun lt!377410 () Unit!28446)

(assert (=> b!831586 (= e!463742 lt!377410)))

(assert (=> b!831586 (= lt!377410 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))

(assert (=> b!831586 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))

(declare-fun b!831587 () Bool)

(declare-fun Unit!28469 () Unit!28446)

(assert (=> b!831587 (= e!463742 Unit!28469)))

(declare-fun b!831588 () Bool)

(assert (=> b!831588 (= e!463743 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096)))))

(assert (= (and d!105857 c!90266) b!831586))

(assert (= (and d!105857 (not c!90266)) b!831587))

(assert (= (and d!105857 (not res!566011)) b!831588))

(declare-fun m!775417 () Bool)

(assert (=> d!105857 m!775417))

(declare-fun m!775419 () Bool)

(assert (=> b!831586 m!775419))

(declare-fun m!775421 () Bool)

(assert (=> b!831586 m!775421))

(assert (=> b!831586 m!775421))

(declare-fun m!775423 () Bool)

(assert (=> b!831586 m!775423))

(assert (=> b!831588 m!775421))

(assert (=> b!831588 m!775421))

(assert (=> b!831588 m!775423))

(assert (=> b!831199 d!105857))

(declare-fun d!105859 () Bool)

(declare-fun e!463744 () Bool)

(assert (=> d!105859 e!463744))

(declare-fun res!566012 () Bool)

(assert (=> d!105859 (=> (not res!566012) (not e!463744))))

(declare-fun lt!377412 () ListLongMap!8901)

(assert (=> d!105859 (= res!566012 (contains!4187 lt!377412 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377414 () List!15846)

(assert (=> d!105859 (= lt!377412 (ListLongMap!8902 lt!377414))))

(declare-fun lt!377413 () Unit!28446)

(declare-fun lt!377411 () Unit!28446)

(assert (=> d!105859 (= lt!377413 lt!377411)))

(assert (=> d!105859 (= (getValueByKey!416 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105859 (= lt!377411 (lemmaContainsTupThenGetReturnValue!230 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105859 (= lt!377414 (insertStrictlySorted!269 (toList!4466 call!36277) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105859 (= (+!1988 call!36277 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377412)))

(declare-fun b!831589 () Bool)

(declare-fun res!566013 () Bool)

(assert (=> b!831589 (=> (not res!566013) (not e!463744))))

(assert (=> b!831589 (= res!566013 (= (getValueByKey!416 (toList!4466 lt!377412) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831590 () Bool)

(assert (=> b!831590 (= e!463744 (contains!4188 (toList!4466 lt!377412) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105859 res!566012) b!831589))

(assert (= (and b!831589 res!566013) b!831590))

(declare-fun m!775425 () Bool)

(assert (=> d!105859 m!775425))

(declare-fun m!775427 () Bool)

(assert (=> d!105859 m!775427))

(declare-fun m!775429 () Bool)

(assert (=> d!105859 m!775429))

(declare-fun m!775431 () Bool)

(assert (=> d!105859 m!775431))

(declare-fun m!775433 () Bool)

(assert (=> b!831589 m!775433))

(declare-fun m!775435 () Bool)

(assert (=> b!831590 m!775435))

(assert (=> b!831199 d!105859))

(assert (=> b!831139 d!105697))

(declare-fun d!105861 () Bool)

(declare-fun e!463745 () Bool)

(assert (=> d!105861 e!463745))

(declare-fun res!566014 () Bool)

(assert (=> d!105861 (=> (not res!566014) (not e!463745))))

(declare-fun lt!377416 () ListLongMap!8901)

(assert (=> d!105861 (= res!566014 (contains!4187 lt!377416 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377418 () List!15846)

(assert (=> d!105861 (= lt!377416 (ListLongMap!8902 lt!377418))))

(declare-fun lt!377417 () Unit!28446)

(declare-fun lt!377415 () Unit!28446)

(assert (=> d!105861 (= lt!377417 lt!377415)))

(assert (=> d!105861 (= (getValueByKey!416 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105861 (= lt!377415 (lemmaContainsTupThenGetReturnValue!230 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105861 (= lt!377418 (insertStrictlySorted!269 (toList!4466 call!36298) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105861 (= (+!1988 call!36298 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377416)))

(declare-fun b!831591 () Bool)

(declare-fun res!566015 () Bool)

(assert (=> b!831591 (=> (not res!566015) (not e!463745))))

(assert (=> b!831591 (= res!566015 (= (getValueByKey!416 (toList!4466 lt!377416) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!831592 () Bool)

(assert (=> b!831592 (= e!463745 (contains!4188 (toList!4466 lt!377416) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105861 res!566014) b!831591))

(assert (= (and b!831591 res!566015) b!831592))

(declare-fun m!775437 () Bool)

(assert (=> d!105861 m!775437))

(declare-fun m!775439 () Bool)

(assert (=> d!105861 m!775439))

(declare-fun m!775441 () Bool)

(assert (=> d!105861 m!775441))

(declare-fun m!775443 () Bool)

(assert (=> d!105861 m!775443))

(declare-fun m!775445 () Bool)

(assert (=> b!831591 m!775445))

(declare-fun m!775447 () Bool)

(assert (=> b!831592 m!775447))

(assert (=> b!831276 d!105861))

(assert (=> bm!36273 d!105699))

(declare-fun b!831594 () Bool)

(declare-fun e!463746 () Option!422)

(declare-fun e!463747 () Option!422)

(assert (=> b!831594 (= e!463746 e!463747)))

(declare-fun c!90268 () Bool)

(assert (=> b!831594 (= c!90268 (and ((_ is Cons!15842) (toList!4466 lt!377212)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377212))) (_1!5049 lt!377012)))))))

(declare-fun b!831595 () Bool)

(assert (=> b!831595 (= e!463747 (getValueByKey!416 (t!22203 (toList!4466 lt!377212)) (_1!5049 lt!377012)))))

(declare-fun d!105863 () Bool)

(declare-fun c!90267 () Bool)

(assert (=> d!105863 (= c!90267 (and ((_ is Cons!15842) (toList!4466 lt!377212)) (= (_1!5049 (h!16977 (toList!4466 lt!377212))) (_1!5049 lt!377012))))))

(assert (=> d!105863 (= (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012)) e!463746)))

(declare-fun b!831593 () Bool)

(assert (=> b!831593 (= e!463746 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377212)))))))

(declare-fun b!831596 () Bool)

(assert (=> b!831596 (= e!463747 None!420)))

(assert (= (and d!105863 c!90267) b!831593))

(assert (= (and d!105863 (not c!90267)) b!831594))

(assert (= (and b!831594 c!90268) b!831595))

(assert (= (and b!831594 (not c!90268)) b!831596))

(declare-fun m!775449 () Bool)

(assert (=> b!831595 m!775449))

(assert (=> b!831302 d!105863))

(declare-fun d!105865 () Bool)

(declare-fun isEmpty!661 (List!15846) Bool)

(assert (=> d!105865 (= (isEmpty!660 lt!377087) (isEmpty!661 (toList!4466 lt!377087)))))

(declare-fun bs!23220 () Bool)

(assert (= bs!23220 d!105865))

(declare-fun m!775451 () Bool)

(assert (=> bs!23220 m!775451))

(assert (=> b!831191 d!105865))

(declare-fun b!831598 () Bool)

(declare-fun e!463748 () Option!422)

(declare-fun e!463749 () Option!422)

(assert (=> b!831598 (= e!463748 e!463749)))

(declare-fun c!90270 () Bool)

(assert (=> b!831598 (= c!90270 (and ((_ is Cons!15842) (toList!4466 lt!377208)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377208))) (_1!5049 lt!377012)))))))

(declare-fun b!831599 () Bool)

(assert (=> b!831599 (= e!463749 (getValueByKey!416 (t!22203 (toList!4466 lt!377208)) (_1!5049 lt!377012)))))

(declare-fun d!105867 () Bool)

(declare-fun c!90269 () Bool)

(assert (=> d!105867 (= c!90269 (and ((_ is Cons!15842) (toList!4466 lt!377208)) (= (_1!5049 (h!16977 (toList!4466 lt!377208))) (_1!5049 lt!377012))))))

(assert (=> d!105867 (= (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012)) e!463748)))

(declare-fun b!831597 () Bool)

(assert (=> b!831597 (= e!463748 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377208)))))))

(declare-fun b!831600 () Bool)

(assert (=> b!831600 (= e!463749 None!420)))

(assert (= (and d!105867 c!90269) b!831597))

(assert (= (and d!105867 (not c!90269)) b!831598))

(assert (= (and b!831598 c!90270) b!831599))

(assert (= (and b!831598 (not c!90270)) b!831600))

(declare-fun m!775453 () Bool)

(assert (=> b!831599 m!775453))

(assert (=> b!831300 d!105867))

(declare-fun d!105869 () Bool)

(assert (=> d!105869 (= (apply!372 lt!377180 #b1000000000000000000000000000000000000000000000000000000000000000) (get!11821 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!23221 () Bool)

(assert (= bs!23221 d!105869))

(assert (=> bs!23221 m!774845))

(assert (=> bs!23221 m!774845))

(declare-fun m!775455 () Bool)

(assert (=> bs!23221 m!775455))

(assert (=> b!831264 d!105869))

(declare-fun d!105871 () Bool)

(assert (=> d!105871 (= (isEmpty!660 lt!377094) (isEmpty!661 (toList!4466 lt!377094)))))

(declare-fun bs!23222 () Bool)

(assert (= bs!23222 d!105871))

(declare-fun m!775457 () Bool)

(assert (=> bs!23222 m!775457))

(assert (=> b!831205 d!105871))

(declare-fun d!105873 () Bool)

(assert (=> d!105873 (= (apply!372 lt!377087 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11821 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23223 () Bool)

(assert (= bs!23223 d!105873))

(assert (=> bs!23223 m!774611))

(assert (=> bs!23223 m!775169))

(assert (=> bs!23223 m!775169))

(declare-fun m!775459 () Bool)

(assert (=> bs!23223 m!775459))

(assert (=> b!831189 d!105873))

(assert (=> b!831189 d!105709))

(assert (=> d!105679 d!105667))

(declare-fun d!105875 () Bool)

(declare-fun e!463751 () Bool)

(assert (=> d!105875 e!463751))

(declare-fun res!566016 () Bool)

(assert (=> d!105875 (=> res!566016 e!463751)))

(declare-fun lt!377421 () Bool)

(assert (=> d!105875 (= res!566016 (not lt!377421))))

(declare-fun lt!377420 () Bool)

(assert (=> d!105875 (= lt!377421 lt!377420)))

(declare-fun lt!377419 () Unit!28446)

(declare-fun e!463750 () Unit!28446)

(assert (=> d!105875 (= lt!377419 e!463750)))

(declare-fun c!90271 () Bool)

(assert (=> d!105875 (= c!90271 lt!377420)))

(assert (=> d!105875 (= lt!377420 (containsKey!401 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105875 (= (contains!4187 lt!377094 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377421)))

(declare-fun b!831601 () Bool)

(declare-fun lt!377422 () Unit!28446)

(assert (=> b!831601 (= e!463750 lt!377422)))

(assert (=> b!831601 (= lt!377422 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831601 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831602 () Bool)

(declare-fun Unit!28470 () Unit!28446)

(assert (=> b!831602 (= e!463750 Unit!28470)))

(declare-fun b!831603 () Bool)

(assert (=> b!831603 (= e!463751 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105875 c!90271) b!831601))

(assert (= (and d!105875 (not c!90271)) b!831602))

(assert (= (and d!105875 (not res!566016)) b!831603))

(declare-fun m!775461 () Bool)

(assert (=> d!105875 m!775461))

(declare-fun m!775463 () Bool)

(assert (=> b!831601 m!775463))

(declare-fun m!775465 () Bool)

(assert (=> b!831601 m!775465))

(assert (=> b!831601 m!775465))

(declare-fun m!775467 () Bool)

(assert (=> b!831601 m!775467))

(assert (=> b!831603 m!775465))

(assert (=> b!831603 m!775465))

(assert (=> b!831603 m!775467))

(assert (=> d!105665 d!105875))

(assert (=> d!105665 d!105667))

(declare-fun d!105877 () Bool)

(declare-fun e!463753 () Bool)

(assert (=> d!105877 e!463753))

(declare-fun res!566017 () Bool)

(assert (=> d!105877 (=> res!566017 e!463753)))

(declare-fun lt!377425 () Bool)

(assert (=> d!105877 (= res!566017 (not lt!377425))))

(declare-fun lt!377424 () Bool)

(assert (=> d!105877 (= lt!377425 lt!377424)))

(declare-fun lt!377423 () Unit!28446)

(declare-fun e!463752 () Unit!28446)

(assert (=> d!105877 (= lt!377423 e!463752)))

(declare-fun c!90272 () Bool)

(assert (=> d!105877 (= c!90272 lt!377424)))

(assert (=> d!105877 (= lt!377424 (containsKey!401 (toList!4466 lt!377116) (_1!5049 lt!377010)))))

(assert (=> d!105877 (= (contains!4187 lt!377116 (_1!5049 lt!377010)) lt!377425)))

(declare-fun b!831604 () Bool)

(declare-fun lt!377426 () Unit!28446)

(assert (=> b!831604 (= e!463752 lt!377426)))

(assert (=> b!831604 (= lt!377426 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377116) (_1!5049 lt!377010)))))

(assert (=> b!831604 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010)))))

(declare-fun b!831605 () Bool)

(declare-fun Unit!28471 () Unit!28446)

(assert (=> b!831605 (= e!463752 Unit!28471)))

(declare-fun b!831606 () Bool)

(assert (=> b!831606 (= e!463753 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010))))))

(assert (= (and d!105877 c!90272) b!831604))

(assert (= (and d!105877 (not c!90272)) b!831605))

(assert (= (and d!105877 (not res!566017)) b!831606))

(declare-fun m!775469 () Bool)

(assert (=> d!105877 m!775469))

(declare-fun m!775471 () Bool)

(assert (=> b!831604 m!775471))

(assert (=> b!831604 m!774707))

(assert (=> b!831604 m!774707))

(declare-fun m!775473 () Bool)

(assert (=> b!831604 m!775473))

(assert (=> b!831606 m!774707))

(assert (=> b!831606 m!774707))

(assert (=> b!831606 m!775473))

(assert (=> d!105677 d!105877))

(declare-fun b!831608 () Bool)

(declare-fun e!463754 () Option!422)

(declare-fun e!463755 () Option!422)

(assert (=> b!831608 (= e!463754 e!463755)))

(declare-fun c!90274 () Bool)

(assert (=> b!831608 (= c!90274 (and ((_ is Cons!15842) lt!377118) (not (= (_1!5049 (h!16977 lt!377118)) (_1!5049 lt!377010)))))))

(declare-fun b!831609 () Bool)

(assert (=> b!831609 (= e!463755 (getValueByKey!416 (t!22203 lt!377118) (_1!5049 lt!377010)))))

(declare-fun d!105879 () Bool)

(declare-fun c!90273 () Bool)

(assert (=> d!105879 (= c!90273 (and ((_ is Cons!15842) lt!377118) (= (_1!5049 (h!16977 lt!377118)) (_1!5049 lt!377010))))))

(assert (=> d!105879 (= (getValueByKey!416 lt!377118 (_1!5049 lt!377010)) e!463754)))

(declare-fun b!831607 () Bool)

(assert (=> b!831607 (= e!463754 (Some!421 (_2!5049 (h!16977 lt!377118))))))

(declare-fun b!831610 () Bool)

(assert (=> b!831610 (= e!463755 None!420)))

(assert (= (and d!105879 c!90273) b!831607))

(assert (= (and d!105879 (not c!90273)) b!831608))

(assert (= (and b!831608 c!90274) b!831609))

(assert (= (and b!831608 (not c!90274)) b!831610))

(declare-fun m!775475 () Bool)

(assert (=> b!831609 m!775475))

(assert (=> d!105677 d!105879))

(declare-fun d!105881 () Bool)

(assert (=> d!105881 (= (getValueByKey!416 lt!377118 (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010)))))

(declare-fun lt!377427 () Unit!28446)

(assert (=> d!105881 (= lt!377427 (choose!1423 lt!377118 (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun e!463756 () Bool)

(assert (=> d!105881 e!463756))

(declare-fun res!566018 () Bool)

(assert (=> d!105881 (=> (not res!566018) (not e!463756))))

(assert (=> d!105881 (= res!566018 (isStrictlySorted!429 lt!377118))))

(assert (=> d!105881 (= (lemmaContainsTupThenGetReturnValue!230 lt!377118 (_1!5049 lt!377010) (_2!5049 lt!377010)) lt!377427)))

(declare-fun b!831611 () Bool)

(declare-fun res!566019 () Bool)

(assert (=> b!831611 (=> (not res!566019) (not e!463756))))

(assert (=> b!831611 (= res!566019 (containsKey!401 lt!377118 (_1!5049 lt!377010)))))

(declare-fun b!831612 () Bool)

(assert (=> b!831612 (= e!463756 (contains!4188 lt!377118 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(assert (= (and d!105881 res!566018) b!831611))

(assert (= (and b!831611 res!566019) b!831612))

(assert (=> d!105881 m!774701))

(declare-fun m!775477 () Bool)

(assert (=> d!105881 m!775477))

(declare-fun m!775479 () Bool)

(assert (=> d!105881 m!775479))

(declare-fun m!775481 () Bool)

(assert (=> b!831611 m!775481))

(declare-fun m!775483 () Bool)

(assert (=> b!831612 m!775483))

(assert (=> d!105677 d!105881))

(declare-fun bm!36324 () Bool)

(declare-fun call!36327 () List!15846)

(declare-fun call!36328 () List!15846)

(assert (=> bm!36324 (= call!36327 call!36328)))

(declare-fun bm!36325 () Bool)

(declare-fun call!36329 () List!15846)

(assert (=> bm!36325 (= call!36328 call!36329)))

(declare-fun d!105883 () Bool)

(declare-fun e!463759 () Bool)

(assert (=> d!105883 e!463759))

(declare-fun res!566021 () Bool)

(assert (=> d!105883 (=> (not res!566021) (not e!463759))))

(declare-fun lt!377428 () List!15846)

(assert (=> d!105883 (= res!566021 (isStrictlySorted!429 lt!377428))))

(declare-fun e!463760 () List!15846)

(assert (=> d!105883 (= lt!377428 e!463760)))

(declare-fun c!90276 () Bool)

(assert (=> d!105883 (= c!90276 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377014 lt!377012))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012)))) (_1!5049 lt!377010))))))

(assert (=> d!105883 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377014 lt!377012)))))

(assert (=> d!105883 (= (insertStrictlySorted!269 (toList!4466 (+!1988 lt!377014 lt!377012)) (_1!5049 lt!377010) (_2!5049 lt!377010)) lt!377428)))

(declare-fun c!90278 () Bool)

(declare-fun c!90277 () Bool)

(declare-fun e!463761 () List!15846)

(declare-fun b!831613 () Bool)

(assert (=> b!831613 (= e!463761 (ite c!90278 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))) (ite c!90277 (Cons!15842 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012))) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) Nil!15843)))))

(declare-fun b!831614 () Bool)

(declare-fun e!463758 () List!15846)

(assert (=> b!831614 (= e!463758 call!36327)))

(declare-fun b!831615 () Bool)

(assert (=> b!831615 (= e!463758 call!36327)))

(declare-fun b!831616 () Bool)

(declare-fun e!463757 () List!15846)

(assert (=> b!831616 (= e!463757 call!36328)))

(declare-fun bm!36326 () Bool)

(assert (=> bm!36326 (= call!36329 ($colon$colon!533 e!463761 (ite c!90276 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012))) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010)))))))

(declare-fun c!90275 () Bool)

(assert (=> bm!36326 (= c!90275 c!90276)))

(declare-fun b!831617 () Bool)

(assert (=> b!831617 (= e!463761 (insertStrictlySorted!269 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))) (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun b!831618 () Bool)

(declare-fun res!566020 () Bool)

(assert (=> b!831618 (=> (not res!566020) (not e!463759))))

(assert (=> b!831618 (= res!566020 (containsKey!401 lt!377428 (_1!5049 lt!377010)))))

(declare-fun b!831619 () Bool)

(assert (=> b!831619 (= e!463760 e!463757)))

(assert (=> b!831619 (= c!90278 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377014 lt!377012))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012)))) (_1!5049 lt!377010))))))

(declare-fun b!831620 () Bool)

(assert (=> b!831620 (= e!463759 (contains!4188 lt!377428 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831621 () Bool)

(assert (=> b!831621 (= e!463760 call!36329)))

(declare-fun b!831622 () Bool)

(assert (=> b!831622 (= c!90277 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377014 lt!377012))) (bvsgt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012)))) (_1!5049 lt!377010))))))

(assert (=> b!831622 (= e!463757 e!463758)))

(assert (= (and d!105883 c!90276) b!831621))

(assert (= (and d!105883 (not c!90276)) b!831619))

(assert (= (and b!831619 c!90278) b!831616))

(assert (= (and b!831619 (not c!90278)) b!831622))

(assert (= (and b!831622 c!90277) b!831614))

(assert (= (and b!831622 (not c!90277)) b!831615))

(assert (= (or b!831614 b!831615) bm!36324))

(assert (= (or b!831616 bm!36324) bm!36325))

(assert (= (or b!831621 bm!36325) bm!36326))

(assert (= (and bm!36326 c!90275) b!831617))

(assert (= (and bm!36326 (not c!90275)) b!831613))

(assert (= (and d!105883 res!566021) b!831618))

(assert (= (and b!831618 res!566020) b!831620))

(declare-fun m!775485 () Bool)

(assert (=> d!105883 m!775485))

(declare-fun m!775487 () Bool)

(assert (=> d!105883 m!775487))

(declare-fun m!775489 () Bool)

(assert (=> bm!36326 m!775489))

(declare-fun m!775491 () Bool)

(assert (=> b!831617 m!775491))

(declare-fun m!775493 () Bool)

(assert (=> b!831618 m!775493))

(declare-fun m!775495 () Bool)

(assert (=> b!831620 m!775495))

(assert (=> d!105677 d!105883))

(assert (=> bm!36299 d!105663))

(assert (=> d!105681 d!105667))

(declare-fun d!105885 () Bool)

(declare-fun e!463763 () Bool)

(assert (=> d!105885 e!463763))

(declare-fun res!566022 () Bool)

(assert (=> d!105885 (=> res!566022 e!463763)))

(declare-fun lt!377431 () Bool)

(assert (=> d!105885 (= res!566022 (not lt!377431))))

(declare-fun lt!377430 () Bool)

(assert (=> d!105885 (= lt!377431 lt!377430)))

(declare-fun lt!377429 () Unit!28446)

(declare-fun e!463762 () Unit!28446)

(assert (=> d!105885 (= lt!377429 e!463762)))

(declare-fun c!90279 () Bool)

(assert (=> d!105885 (= c!90279 lt!377430)))

(assert (=> d!105885 (= lt!377430 (containsKey!401 (toList!4466 lt!377112) (_1!5049 lt!377012)))))

(assert (=> d!105885 (= (contains!4187 lt!377112 (_1!5049 lt!377012)) lt!377431)))

(declare-fun b!831623 () Bool)

(declare-fun lt!377432 () Unit!28446)

(assert (=> b!831623 (= e!463762 lt!377432)))

(assert (=> b!831623 (= lt!377432 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377112) (_1!5049 lt!377012)))))

(assert (=> b!831623 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012)))))

(declare-fun b!831624 () Bool)

(declare-fun Unit!28472 () Unit!28446)

(assert (=> b!831624 (= e!463762 Unit!28472)))

(declare-fun b!831625 () Bool)

(assert (=> b!831625 (= e!463763 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012))))))

(assert (= (and d!105885 c!90279) b!831623))

(assert (= (and d!105885 (not c!90279)) b!831624))

(assert (= (and d!105885 (not res!566022)) b!831625))

(declare-fun m!775497 () Bool)

(assert (=> d!105885 m!775497))

(declare-fun m!775499 () Bool)

(assert (=> b!831623 m!775499))

(assert (=> b!831623 m!774695))

(assert (=> b!831623 m!774695))

(declare-fun m!775501 () Bool)

(assert (=> b!831623 m!775501))

(assert (=> b!831625 m!774695))

(assert (=> b!831625 m!774695))

(assert (=> b!831625 m!775501))

(assert (=> d!105675 d!105885))

(declare-fun b!831627 () Bool)

(declare-fun e!463764 () Option!422)

(declare-fun e!463765 () Option!422)

(assert (=> b!831627 (= e!463764 e!463765)))

(declare-fun c!90281 () Bool)

(assert (=> b!831627 (= c!90281 (and ((_ is Cons!15842) lt!377114) (not (= (_1!5049 (h!16977 lt!377114)) (_1!5049 lt!377012)))))))

(declare-fun b!831628 () Bool)

(assert (=> b!831628 (= e!463765 (getValueByKey!416 (t!22203 lt!377114) (_1!5049 lt!377012)))))

(declare-fun d!105887 () Bool)

(declare-fun c!90280 () Bool)

(assert (=> d!105887 (= c!90280 (and ((_ is Cons!15842) lt!377114) (= (_1!5049 (h!16977 lt!377114)) (_1!5049 lt!377012))))))

(assert (=> d!105887 (= (getValueByKey!416 lt!377114 (_1!5049 lt!377012)) e!463764)))

(declare-fun b!831626 () Bool)

(assert (=> b!831626 (= e!463764 (Some!421 (_2!5049 (h!16977 lt!377114))))))

(declare-fun b!831629 () Bool)

(assert (=> b!831629 (= e!463765 None!420)))

(assert (= (and d!105887 c!90280) b!831626))

(assert (= (and d!105887 (not c!90280)) b!831627))

(assert (= (and b!831627 c!90281) b!831628))

(assert (= (and b!831627 (not c!90281)) b!831629))

(declare-fun m!775503 () Bool)

(assert (=> b!831628 m!775503))

(assert (=> d!105675 d!105887))

(declare-fun d!105889 () Bool)

(assert (=> d!105889 (= (getValueByKey!416 lt!377114 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(declare-fun lt!377433 () Unit!28446)

(assert (=> d!105889 (= lt!377433 (choose!1423 lt!377114 (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun e!463766 () Bool)

(assert (=> d!105889 e!463766))

(declare-fun res!566023 () Bool)

(assert (=> d!105889 (=> (not res!566023) (not e!463766))))

(assert (=> d!105889 (= res!566023 (isStrictlySorted!429 lt!377114))))

(assert (=> d!105889 (= (lemmaContainsTupThenGetReturnValue!230 lt!377114 (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377433)))

(declare-fun b!831630 () Bool)

(declare-fun res!566024 () Bool)

(assert (=> b!831630 (=> (not res!566024) (not e!463766))))

(assert (=> b!831630 (= res!566024 (containsKey!401 lt!377114 (_1!5049 lt!377012)))))

(declare-fun b!831631 () Bool)

(assert (=> b!831631 (= e!463766 (contains!4188 lt!377114 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!105889 res!566023) b!831630))

(assert (= (and b!831630 res!566024) b!831631))

(assert (=> d!105889 m!774689))

(declare-fun m!775505 () Bool)

(assert (=> d!105889 m!775505))

(declare-fun m!775507 () Bool)

(assert (=> d!105889 m!775507))

(declare-fun m!775509 () Bool)

(assert (=> b!831630 m!775509))

(declare-fun m!775511 () Bool)

(assert (=> b!831631 m!775511))

(assert (=> d!105675 d!105889))

(declare-fun bm!36327 () Bool)

(declare-fun call!36330 () List!15846)

(declare-fun call!36331 () List!15846)

(assert (=> bm!36327 (= call!36330 call!36331)))

(declare-fun bm!36328 () Bool)

(declare-fun call!36332 () List!15846)

(assert (=> bm!36328 (= call!36331 call!36332)))

(declare-fun d!105891 () Bool)

(declare-fun e!463769 () Bool)

(assert (=> d!105891 e!463769))

(declare-fun res!566026 () Bool)

(assert (=> d!105891 (=> (not res!566026) (not e!463769))))

(declare-fun lt!377434 () List!15846)

(assert (=> d!105891 (= res!566026 (isStrictlySorted!429 lt!377434))))

(declare-fun e!463770 () List!15846)

(assert (=> d!105891 (= lt!377434 e!463770)))

(declare-fun c!90283 () Bool)

(assert (=> d!105891 (= c!90283 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377014 lt!377010))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010)))) (_1!5049 lt!377012))))))

(assert (=> d!105891 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377014 lt!377010)))))

(assert (=> d!105891 (= (insertStrictlySorted!269 (toList!4466 (+!1988 lt!377014 lt!377010)) (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377434)))

(declare-fun c!90284 () Bool)

(declare-fun c!90285 () Bool)

(declare-fun b!831632 () Bool)

(declare-fun e!463771 () List!15846)

(assert (=> b!831632 (= e!463771 (ite c!90285 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))) (ite c!90284 (Cons!15842 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010))) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) Nil!15843)))))

(declare-fun b!831633 () Bool)

(declare-fun e!463768 () List!15846)

(assert (=> b!831633 (= e!463768 call!36330)))

(declare-fun b!831634 () Bool)

(assert (=> b!831634 (= e!463768 call!36330)))

(declare-fun b!831635 () Bool)

(declare-fun e!463767 () List!15846)

(assert (=> b!831635 (= e!463767 call!36331)))

(declare-fun bm!36329 () Bool)

(assert (=> bm!36329 (= call!36332 ($colon$colon!533 e!463771 (ite c!90283 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))))))

(declare-fun c!90282 () Bool)

(assert (=> bm!36329 (= c!90282 c!90283)))

(declare-fun b!831636 () Bool)

(assert (=> b!831636 (= e!463771 (insertStrictlySorted!269 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun b!831637 () Bool)

(declare-fun res!566025 () Bool)

(assert (=> b!831637 (=> (not res!566025) (not e!463769))))

(assert (=> b!831637 (= res!566025 (containsKey!401 lt!377434 (_1!5049 lt!377012)))))

(declare-fun b!831638 () Bool)

(assert (=> b!831638 (= e!463770 e!463767)))

(assert (=> b!831638 (= c!90285 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377014 lt!377010))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010)))) (_1!5049 lt!377012))))))

(declare-fun b!831639 () Bool)

(assert (=> b!831639 (= e!463769 (contains!4188 lt!377434 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!831640 () Bool)

(assert (=> b!831640 (= e!463770 call!36332)))

(declare-fun b!831641 () Bool)

(assert (=> b!831641 (= c!90284 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377014 lt!377010))) (bvsgt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010)))) (_1!5049 lt!377012))))))

(assert (=> b!831641 (= e!463767 e!463768)))

(assert (= (and d!105891 c!90283) b!831640))

(assert (= (and d!105891 (not c!90283)) b!831638))

(assert (= (and b!831638 c!90285) b!831635))

(assert (= (and b!831638 (not c!90285)) b!831641))

(assert (= (and b!831641 c!90284) b!831633))

(assert (= (and b!831641 (not c!90284)) b!831634))

(assert (= (or b!831633 b!831634) bm!36327))

(assert (= (or b!831635 bm!36327) bm!36328))

(assert (= (or b!831640 bm!36328) bm!36329))

(assert (= (and bm!36329 c!90282) b!831636))

(assert (= (and bm!36329 (not c!90282)) b!831632))

(assert (= (and d!105891 res!566026) b!831637))

(assert (= (and b!831637 res!566025) b!831639))

(declare-fun m!775513 () Bool)

(assert (=> d!105891 m!775513))

(declare-fun m!775515 () Bool)

(assert (=> d!105891 m!775515))

(declare-fun m!775517 () Bool)

(assert (=> bm!36329 m!775517))

(declare-fun m!775519 () Bool)

(assert (=> b!831636 m!775519))

(declare-fun m!775521 () Bool)

(assert (=> b!831637 m!775521))

(declare-fun m!775523 () Bool)

(assert (=> b!831639 m!775523))

(assert (=> d!105675 d!105891))

(declare-fun b!831643 () Bool)

(declare-fun e!463772 () Option!422)

(declare-fun e!463773 () Option!422)

(assert (=> b!831643 (= e!463772 e!463773)))

(declare-fun c!90287 () Bool)

(assert (=> b!831643 (= c!90287 (and ((_ is Cons!15842) (toList!4466 lt!377216)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377216))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!831644 () Bool)

(assert (=> b!831644 (= e!463773 (getValueByKey!416 (t!22203 (toList!4466 lt!377216)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!105893 () Bool)

(declare-fun c!90286 () Bool)

(assert (=> d!105893 (= c!90286 (and ((_ is Cons!15842) (toList!4466 lt!377216)) (= (_1!5049 (h!16977 (toList!4466 lt!377216))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105893 (= (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463772)))

(declare-fun b!831642 () Bool)

(assert (=> b!831642 (= e!463772 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377216)))))))

(declare-fun b!831645 () Bool)

(assert (=> b!831645 (= e!463773 None!420)))

(assert (= (and d!105893 c!90286) b!831642))

(assert (= (and d!105893 (not c!90286)) b!831643))

(assert (= (and b!831643 c!90287) b!831644))

(assert (= (and b!831643 (not c!90287)) b!831645))

(declare-fun m!775525 () Bool)

(assert (=> b!831644 m!775525))

(assert (=> b!831304 d!105893))

(declare-fun d!105895 () Bool)

(declare-fun e!463775 () Bool)

(assert (=> d!105895 e!463775))

(declare-fun res!566027 () Bool)

(assert (=> d!105895 (=> res!566027 e!463775)))

(declare-fun lt!377437 () Bool)

(assert (=> d!105895 (= res!566027 (not lt!377437))))

(declare-fun lt!377436 () Bool)

(assert (=> d!105895 (= lt!377437 lt!377436)))

(declare-fun lt!377435 () Unit!28446)

(declare-fun e!463774 () Unit!28446)

(assert (=> d!105895 (= lt!377435 e!463774)))

(declare-fun c!90288 () Bool)

(assert (=> d!105895 (= c!90288 lt!377436)))

(assert (=> d!105895 (= lt!377436 (containsKey!401 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105895 (= (contains!4187 lt!377202 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377437)))

(declare-fun b!831646 () Bool)

(declare-fun lt!377438 () Unit!28446)

(assert (=> b!831646 (= e!463774 lt!377438)))

(assert (=> b!831646 (= lt!377438 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831646 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831647 () Bool)

(declare-fun Unit!28473 () Unit!28446)

(assert (=> b!831647 (= e!463774 Unit!28473)))

(declare-fun b!831648 () Bool)

(assert (=> b!831648 (= e!463775 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105895 c!90288) b!831646))

(assert (= (and d!105895 (not c!90288)) b!831647))

(assert (= (and d!105895 (not res!566027)) b!831648))

(declare-fun m!775527 () Bool)

(assert (=> d!105895 m!775527))

(declare-fun m!775529 () Bool)

(assert (=> b!831646 m!775529))

(assert (=> b!831646 m!775189))

(assert (=> b!831646 m!775189))

(declare-fun m!775531 () Bool)

(assert (=> b!831646 m!775531))

(assert (=> b!831648 m!775189))

(assert (=> b!831648 m!775189))

(assert (=> b!831648 m!775531))

(assert (=> bm!36298 d!105895))

(assert (=> b!831298 d!105697))

(declare-fun b!831649 () Bool)

(declare-fun e!463778 () Bool)

(declare-fun e!463776 () Bool)

(assert (=> b!831649 (= e!463778 e!463776)))

(declare-fun res!566030 () Bool)

(assert (=> b!831649 (=> (not res!566030) (not e!463776))))

(declare-fun e!463777 () Bool)

(assert (=> b!831649 (= res!566030 (not e!463777))))

(declare-fun res!566029 () Bool)

(assert (=> b!831649 (=> (not res!566029) (not e!463777))))

(assert (=> b!831649 (= res!566029 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831650 () Bool)

(declare-fun e!463779 () Bool)

(declare-fun call!36333 () Bool)

(assert (=> b!831650 (= e!463779 call!36333)))

(declare-fun b!831651 () Bool)

(assert (=> b!831651 (= e!463777 (contains!4186 (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831652 () Bool)

(assert (=> b!831652 (= e!463776 e!463779)))

(declare-fun c!90289 () Bool)

(assert (=> b!831652 (= c!90289 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!105897 () Bool)

(declare-fun res!566028 () Bool)

(assert (=> d!105897 (=> res!566028 e!463778)))

(assert (=> d!105897 (= res!566028 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!105897 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) e!463778)))

(declare-fun bm!36330 () Bool)

(assert (=> bm!36330 (= call!36333 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90289 (Cons!15843 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844))))))

(declare-fun b!831653 () Bool)

(assert (=> b!831653 (= e!463779 call!36333)))

(assert (= (and d!105897 (not res!566028)) b!831649))

(assert (= (and b!831649 res!566029) b!831651))

(assert (= (and b!831649 res!566030) b!831652))

(assert (= (and b!831652 c!90289) b!831650))

(assert (= (and b!831652 (not c!90289)) b!831653))

(assert (= (or b!831650 b!831653) bm!36330))

(assert (=> b!831649 m!774867))

(assert (=> b!831649 m!774867))

(assert (=> b!831649 m!774885))

(assert (=> b!831651 m!774867))

(assert (=> b!831651 m!774867))

(declare-fun m!775533 () Bool)

(assert (=> b!831651 m!775533))

(assert (=> b!831652 m!774867))

(assert (=> b!831652 m!774867))

(assert (=> b!831652 m!774885))

(assert (=> bm!36330 m!774867))

(declare-fun m!775535 () Bool)

(assert (=> bm!36330 m!775535))

(assert (=> bm!36270 d!105897))

(assert (=> b!831288 d!105697))

(declare-fun b!831655 () Bool)

(declare-fun e!463780 () Option!422)

(declare-fun e!463781 () Option!422)

(assert (=> b!831655 (= e!463780 e!463781)))

(declare-fun c!90291 () Bool)

(assert (=> b!831655 (= c!90291 (and ((_ is Cons!15842) (toList!4466 lt!377112)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377112))) (_1!5049 lt!377012)))))))

(declare-fun b!831656 () Bool)

(assert (=> b!831656 (= e!463781 (getValueByKey!416 (t!22203 (toList!4466 lt!377112)) (_1!5049 lt!377012)))))

(declare-fun d!105899 () Bool)

(declare-fun c!90290 () Bool)

(assert (=> d!105899 (= c!90290 (and ((_ is Cons!15842) (toList!4466 lt!377112)) (= (_1!5049 (h!16977 (toList!4466 lt!377112))) (_1!5049 lt!377012))))))

(assert (=> d!105899 (= (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012)) e!463780)))

(declare-fun b!831654 () Bool)

(assert (=> b!831654 (= e!463780 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377112)))))))

(declare-fun b!831657 () Bool)

(assert (=> b!831657 (= e!463781 None!420)))

(assert (= (and d!105899 c!90290) b!831654))

(assert (= (and d!105899 (not c!90290)) b!831655))

(assert (= (and b!831655 c!90291) b!831656))

(assert (= (and b!831655 (not c!90291)) b!831657))

(declare-fun m!775537 () Bool)

(assert (=> b!831656 m!775537))

(assert (=> b!831212 d!105899))

(declare-fun d!105901 () Bool)

(assert (=> d!105901 (= (apply!372 lt!377202 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (get!11821 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun bs!23224 () Bool)

(assert (= bs!23224 d!105901))

(assert (=> bs!23224 m!774611))

(assert (=> bs!23224 m!775105))

(assert (=> bs!23224 m!775105))

(declare-fun m!775539 () Bool)

(assert (=> bs!23224 m!775539))

(assert (=> b!831287 d!105901))

(assert (=> b!831287 d!105709))

(declare-fun d!105903 () Bool)

(declare-fun e!463783 () Bool)

(assert (=> d!105903 e!463783))

(declare-fun res!566031 () Bool)

(assert (=> d!105903 (=> res!566031 e!463783)))

(declare-fun lt!377441 () Bool)

(assert (=> d!105903 (= res!566031 (not lt!377441))))

(declare-fun lt!377440 () Bool)

(assert (=> d!105903 (= lt!377441 lt!377440)))

(declare-fun lt!377439 () Unit!28446)

(declare-fun e!463782 () Unit!28446)

(assert (=> d!105903 (= lt!377439 e!463782)))

(declare-fun c!90292 () Bool)

(assert (=> d!105903 (= c!90292 lt!377440)))

(assert (=> d!105903 (= lt!377440 (containsKey!401 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105903 (= (contains!4187 lt!377087 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377441)))

(declare-fun b!831658 () Bool)

(declare-fun lt!377442 () Unit!28446)

(assert (=> b!831658 (= e!463782 lt!377442)))

(assert (=> b!831658 (= lt!377442 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831658 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831659 () Bool)

(declare-fun Unit!28474 () Unit!28446)

(assert (=> b!831659 (= e!463782 Unit!28474)))

(declare-fun b!831660 () Bool)

(assert (=> b!831660 (= e!463783 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105903 c!90292) b!831658))

(assert (= (and d!105903 (not c!90292)) b!831659))

(assert (= (and d!105903 (not res!566031)) b!831660))

(declare-fun m!775541 () Bool)

(assert (=> d!105903 m!775541))

(declare-fun m!775543 () Bool)

(assert (=> b!831658 m!775543))

(declare-fun m!775545 () Bool)

(assert (=> b!831658 m!775545))

(assert (=> b!831658 m!775545))

(declare-fun m!775547 () Bool)

(assert (=> b!831658 m!775547))

(assert (=> b!831660 m!775545))

(assert (=> b!831660 m!775545))

(assert (=> b!831660 m!775547))

(assert (=> b!831181 d!105903))

(declare-fun b!831662 () Bool)

(declare-fun e!463784 () Option!422)

(declare-fun e!463785 () Option!422)

(assert (=> b!831662 (= e!463784 e!463785)))

(declare-fun c!90294 () Bool)

(assert (=> b!831662 (= c!90294 (and ((_ is Cons!15842) (toList!4466 lt!377108)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377108))) (_1!5049 lt!377010)))))))

(declare-fun b!831663 () Bool)

(assert (=> b!831663 (= e!463785 (getValueByKey!416 (t!22203 (toList!4466 lt!377108)) (_1!5049 lt!377010)))))

(declare-fun d!105905 () Bool)

(declare-fun c!90293 () Bool)

(assert (=> d!105905 (= c!90293 (and ((_ is Cons!15842) (toList!4466 lt!377108)) (= (_1!5049 (h!16977 (toList!4466 lt!377108))) (_1!5049 lt!377010))))))

(assert (=> d!105905 (= (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010)) e!463784)))

(declare-fun b!831661 () Bool)

(assert (=> b!831661 (= e!463784 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377108)))))))

(declare-fun b!831664 () Bool)

(assert (=> b!831664 (= e!463785 None!420)))

(assert (= (and d!105905 c!90293) b!831661))

(assert (= (and d!105905 (not c!90293)) b!831662))

(assert (= (and b!831662 c!90294) b!831663))

(assert (= (and b!831662 (not c!90294)) b!831664))

(declare-fun m!775549 () Bool)

(assert (=> b!831663 m!775549))

(assert (=> b!831210 d!105905))

(declare-fun d!105907 () Bool)

(declare-fun e!463787 () Bool)

(assert (=> d!105907 e!463787))

(declare-fun res!566032 () Bool)

(assert (=> d!105907 (=> res!566032 e!463787)))

(declare-fun lt!377445 () Bool)

(assert (=> d!105907 (= res!566032 (not lt!377445))))

(declare-fun lt!377444 () Bool)

(assert (=> d!105907 (= lt!377445 lt!377444)))

(declare-fun lt!377443 () Unit!28446)

(declare-fun e!463786 () Unit!28446)

(assert (=> d!105907 (= lt!377443 e!463786)))

(declare-fun c!90295 () Bool)

(assert (=> d!105907 (= c!90295 lt!377444)))

(assert (=> d!105907 (= lt!377444 (containsKey!401 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!105907 (= (contains!4187 lt!377094 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377445)))

(declare-fun b!831665 () Bool)

(declare-fun lt!377446 () Unit!28446)

(assert (=> b!831665 (= e!463786 lt!377446)))

(assert (=> b!831665 (= lt!377446 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831665 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831666 () Bool)

(declare-fun Unit!28475 () Unit!28446)

(assert (=> b!831666 (= e!463786 Unit!28475)))

(declare-fun b!831667 () Bool)

(assert (=> b!831667 (= e!463787 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105907 c!90295) b!831665))

(assert (= (and d!105907 (not c!90295)) b!831666))

(assert (= (and d!105907 (not res!566032)) b!831667))

(declare-fun m!775551 () Bool)

(assert (=> d!105907 m!775551))

(declare-fun m!775553 () Bool)

(assert (=> b!831665 m!775553))

(declare-fun m!775555 () Bool)

(assert (=> b!831665 m!775555))

(assert (=> b!831665 m!775555))

(declare-fun m!775557 () Bool)

(assert (=> b!831665 m!775557))

(assert (=> b!831667 m!775555))

(assert (=> b!831667 m!775555))

(assert (=> b!831667 m!775557))

(assert (=> b!831195 d!105907))

(declare-fun d!105909 () Bool)

(declare-fun e!463788 () Bool)

(assert (=> d!105909 e!463788))

(declare-fun res!566033 () Bool)

(assert (=> d!105909 (=> (not res!566033) (not e!463788))))

(declare-fun lt!377448 () ListLongMap!8901)

(assert (=> d!105909 (= res!566033 (contains!4187 lt!377448 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377450 () List!15846)

(assert (=> d!105909 (= lt!377448 (ListLongMap!8902 lt!377450))))

(declare-fun lt!377449 () Unit!28446)

(declare-fun lt!377447 () Unit!28446)

(assert (=> d!105909 (= lt!377449 lt!377447)))

(assert (=> d!105909 (= (getValueByKey!416 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105909 (= lt!377447 (lemmaContainsTupThenGetReturnValue!230 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105909 (= lt!377450 (insertStrictlySorted!269 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!105909 (= (+!1988 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377448)))

(declare-fun b!831668 () Bool)

(declare-fun res!566034 () Bool)

(assert (=> b!831668 (=> (not res!566034) (not e!463788))))

(assert (=> b!831668 (= res!566034 (= (getValueByKey!416 (toList!4466 lt!377448) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!831669 () Bool)

(assert (=> b!831669 (= e!463788 (contains!4188 (toList!4466 lt!377448) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!105909 res!566033) b!831668))

(assert (= (and b!831668 res!566034) b!831669))

(declare-fun m!775559 () Bool)

(assert (=> d!105909 m!775559))

(declare-fun m!775561 () Bool)

(assert (=> d!105909 m!775561))

(declare-fun m!775563 () Bool)

(assert (=> d!105909 m!775563))

(declare-fun m!775565 () Bool)

(assert (=> d!105909 m!775565))

(declare-fun m!775567 () Bool)

(assert (=> b!831668 m!775567))

(declare-fun m!775569 () Bool)

(assert (=> b!831669 m!775569))

(assert (=> bm!36300 d!105909))

(declare-fun mapIsEmpty!24470 () Bool)

(declare-fun mapRes!24470 () Bool)

(assert (=> mapIsEmpty!24470 mapRes!24470))

(declare-fun b!831671 () Bool)

(declare-fun e!463790 () Bool)

(assert (=> b!831671 (= e!463790 tp_is_empty!15205)))

(declare-fun mapNonEmpty!24470 () Bool)

(declare-fun tp!47288 () Bool)

(declare-fun e!463789 () Bool)

(assert (=> mapNonEmpty!24470 (= mapRes!24470 (and tp!47288 e!463789))))

(declare-fun mapKey!24470 () (_ BitVec 32))

(declare-fun mapRest!24470 () (Array (_ BitVec 32) ValueCell!7187))

(declare-fun mapValue!24470 () ValueCell!7187)

(assert (=> mapNonEmpty!24470 (= mapRest!24469 (store mapRest!24470 mapKey!24470 mapValue!24470))))

(declare-fun condMapEmpty!24470 () Bool)

(declare-fun mapDefault!24470 () ValueCell!7187)

(assert (=> mapNonEmpty!24469 (= condMapEmpty!24470 (= mapRest!24469 ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24470)))))

(assert (=> mapNonEmpty!24469 (= tp!47287 (and e!463790 mapRes!24470))))

(declare-fun b!831670 () Bool)

(assert (=> b!831670 (= e!463789 tp_is_empty!15205)))

(assert (= (and mapNonEmpty!24469 condMapEmpty!24470) mapIsEmpty!24470))

(assert (= (and mapNonEmpty!24469 (not condMapEmpty!24470)) mapNonEmpty!24470))

(assert (= (and mapNonEmpty!24470 ((_ is ValueCellFull!7187) mapValue!24470)) b!831670))

(assert (= (and mapNonEmpty!24469 ((_ is ValueCellFull!7187) mapDefault!24470)) b!831671))

(declare-fun m!775571 () Bool)

(assert (=> mapNonEmpty!24470 m!775571))

(declare-fun b_lambda!11393 () Bool)

(assert (= b_lambda!11385 (or (and start!71652 b_free!13495) b_lambda!11393)))

(declare-fun b_lambda!11395 () Bool)

(assert (= b_lambda!11391 (or (and start!71652 b_free!13495) b_lambda!11395)))

(declare-fun b_lambda!11397 () Bool)

(assert (= b_lambda!11387 (or (and start!71652 b_free!13495) b_lambda!11397)))

(declare-fun b_lambda!11399 () Bool)

(assert (= b_lambda!11389 (or (and start!71652 b_free!13495) b_lambda!11399)))

(check-sat (not b!831582) (not d!105861) (not d!105733) (not d!105743) (not b!831497) (not d!105711) (not d!105843) (not b!831599) (not d!105849) (not b!831663) (not b!831636) (not b!831499) (not b!831656) (not d!105747) (not b_lambda!11373) (not d!105755) (not b!831567) (not d!105833) (not d!105853) (not d!105793) (not b!831399) (not d!105731) (not b!831328) (not b!831444) (not b!831357) (not d!105783) (not d!105751) (not b!831531) (not d!105691) (not b!831382) (not bm!36330) (not b!831395) (not b!831539) (not b!831601) (not b!831530) (not d!105813) (not b!831375) (not d!105871) (not b_lambda!11397) (not b!831555) (not b!831487) (not bm!36313) (not b!831668) (not d!105727) (not b!831482) (not b!831590) (not bm!36303) (not b!831320) (not d!105771) (not d!105795) (not b!831451) (not b!831606) (not b!831408) (not d!105817) (not bm!36317) (not d!105907) (not d!105773) (not d!105761) (not b!831528) (not b!831503) (not d!105735) (not b!831476) (not b!831639) (not b!831519) (not d!105877) (not d!105789) (not b!831646) (not b!831604) (not b!831603) (not d!105703) (not b!831576) (not b!831620) (not b!831611) (not d!105875) (not b!831322) (not b!831591) (not b_lambda!11381) (not b!831488) (not b!831496) (not bm!36314) (not d!105719) (not d!105699) (not d!105729) (not b!831631) (not b!831358) (not b!831525) (not d!105829) (not b!831481) (not d!105765) (not b_lambda!11395) (not b!831437) (not b!831352) (not d!105901) (not b!831658) (not b!831546) (not d!105811) (not b!831380) (not b!831505) (not b!831584) (not d!105705) (not b!831348) (not b!831372) (not d!105807) (not b!831618) (not b!831369) (not b!831553) (not b!831397) (not d!105689) (not d!105799) (not b!831373) (not b!831595) (not d!105797) (not b!831569) (not d!105759) (not b!831589) (not b!831471) (not b!831578) (not b!831396) (not b!831517) (not d!105857) (not b!831623) (not d!105869) (not b!831521) (not d!105873) (not b!831588) (not d!105837) (not b!831463) (not b!831575) (not d!105835) (not d!105889) (not b!831518) (not d!105883) (not d!105831) (not b!831644) (not b!831402) (not b!831344) (not b_lambda!11379) (not b!831669) (not b!831515) (not bm!36323) (not d!105737) (not b!831435) (not b!831665) (not b!831458) (not d!105823) (not d!105859) (not b!831356) (not bm!36304) (not b!831443) (not b!831502) (not b!831648) (not b_lambda!11377) (not b!831617) (not d!105769) (not b!831371) (not b!831547) (not b!831585) (not d!105803) (not d!105851) (not b!831562) (not d!105821) (not d!105827) (not d!105781) (not b_lambda!11393) b_and!22559 (not b!831464) (not d!105839) (not d!105695) (not b_next!13495) (not d!105903) (not b!831351) (not b!831469) (not d!105739) (not b!831592) (not b!831442) (not b!831349) (not b!831542) (not b!831434) (not d!105891) (not d!105885) (not b!831544) (not b!831441) (not d!105707) (not b!831466) (not b_lambda!11399) (not b!831500) (not d!105865) (not b!831628) (not b!831490) (not d!105909) (not b!831479) (not b!831511) (not b!831453) (not d!105777) (not b_lambda!11375) (not bm!36326) (not b!831523) (not b!831660) (not b!831457) (not b!831446) (not b!831612) (not b!831347) (not b!831508) (not b_lambda!11383) (not d!105741) (not d!105757) (not b!831513) (not d!105723) (not d!105717) (not d!105841) (not b!831455) (not d!105855) (not bm!36329) (not b!831651) (not d!105815) (not d!105721) (not d!105809) (not b!831537) (not b!831545) (not b!831564) (not b!831474) (not b!831522) (not b!831467) (not b!831472) (not d!105753) (not b!831625) (not d!105895) (not d!105787) (not d!105745) (not d!105881) (not d!105713) (not b!831652) (not b!831586) tp_is_empty!15205 (not b!831536) (not b!831376) (not b!831494) (not b!831381) (not d!105819) (not d!105749) (not b!831630) (not d!105801) (not b!831570) (not b!831409) (not d!105725) (not b!831393) (not d!105791) (not bm!36320) (not mapNonEmpty!24470) (not b!831516) (not b!831506) (not b!831388) (not b!831609) (not b!831460) (not b!831548) (not b!831637) (not b!831461) (not b!831456) (not b!831394) (not d!105779) (not b!831561) (not b!831649) (not b!831520) (not d!105785) (not b!831667) (not d!105805) (not d!105775) (not d!105847))
(check-sat b_and!22559 (not b_next!13495))
(get-model)

(declare-fun d!105911 () Bool)

(assert (=> d!105911 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377453 () Unit!28446)

(declare-fun choose!1427 (List!15846 (_ BitVec 64)) Unit!28446)

(assert (=> d!105911 (= lt!377453 (choose!1427 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463793 () Bool)

(assert (=> d!105911 e!463793))

(declare-fun res!566037 () Bool)

(assert (=> d!105911 (=> (not res!566037) (not e!463793))))

(assert (=> d!105911 (= res!566037 (isStrictlySorted!429 (toList!4466 lt!377087)))))

(assert (=> d!105911 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377453)))

(declare-fun b!831674 () Bool)

(assert (=> b!831674 (= e!463793 (containsKey!401 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105911 res!566037) b!831674))

(assert (=> d!105911 m!775545))

(assert (=> d!105911 m!775545))

(assert (=> d!105911 m!775547))

(declare-fun m!775573 () Bool)

(assert (=> d!105911 m!775573))

(declare-fun m!775575 () Bool)

(assert (=> d!105911 m!775575))

(assert (=> b!831674 m!775541))

(assert (=> b!831658 d!105911))

(declare-fun d!105913 () Bool)

(declare-fun isEmpty!662 (Option!422) Bool)

(assert (=> d!105913 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23225 () Bool)

(assert (= bs!23225 d!105913))

(assert (=> bs!23225 m!775545))

(declare-fun m!775577 () Bool)

(assert (=> bs!23225 m!775577))

(assert (=> b!831658 d!105913))

(declare-fun b!831676 () Bool)

(declare-fun e!463794 () Option!422)

(declare-fun e!463795 () Option!422)

(assert (=> b!831676 (= e!463794 e!463795)))

(declare-fun c!90297 () Bool)

(assert (=> b!831676 (= c!90297 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377087))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831677 () Bool)

(assert (=> b!831677 (= e!463795 (getValueByKey!416 (t!22203 (toList!4466 lt!377087)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105915 () Bool)

(declare-fun c!90296 () Bool)

(assert (=> d!105915 (= c!90296 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (= (_1!5049 (h!16977 (toList!4466 lt!377087))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105915 (= (getValueByKey!416 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000) e!463794)))

(declare-fun b!831675 () Bool)

(assert (=> b!831675 (= e!463794 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377087)))))))

(declare-fun b!831678 () Bool)

(assert (=> b!831678 (= e!463795 None!420)))

(assert (= (and d!105915 c!90296) b!831675))

(assert (= (and d!105915 (not c!90296)) b!831676))

(assert (= (and b!831676 c!90297) b!831677))

(assert (= (and b!831676 (not c!90297)) b!831678))

(declare-fun m!775579 () Bool)

(assert (=> b!831677 m!775579))

(assert (=> b!831658 d!105915))

(declare-fun b!831680 () Bool)

(declare-fun e!463796 () Option!422)

(declare-fun e!463797 () Option!422)

(assert (=> b!831680 (= e!463796 e!463797)))

(declare-fun c!90299 () Bool)

(assert (=> b!831680 (= c!90299 (and ((_ is Cons!15842) (toList!4466 lt!377382)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377382))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!831681 () Bool)

(assert (=> b!831681 (= e!463797 (getValueByKey!416 (t!22203 (toList!4466 lt!377382)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!105917 () Bool)

(declare-fun c!90298 () Bool)

(assert (=> d!105917 (= c!90298 (and ((_ is Cons!15842) (toList!4466 lt!377382)) (= (_1!5049 (h!16977 (toList!4466 lt!377382))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105917 (= (getValueByKey!416 (toList!4466 lt!377382) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463796)))

(declare-fun b!831679 () Bool)

(assert (=> b!831679 (= e!463796 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377382)))))))

(declare-fun b!831682 () Bool)

(assert (=> b!831682 (= e!463797 None!420)))

(assert (= (and d!105917 c!90298) b!831679))

(assert (= (and d!105917 (not c!90298)) b!831680))

(assert (= (and b!831680 c!90299) b!831681))

(assert (= (and b!831680 (not c!90299)) b!831682))

(declare-fun m!775581 () Bool)

(assert (=> b!831681 m!775581))

(assert (=> b!831547 d!105917))

(declare-fun d!105919 () Bool)

(assert (=> d!105919 (= (isEmpty!660 lt!377245) (isEmpty!661 (toList!4466 lt!377245)))))

(declare-fun bs!23226 () Bool)

(assert (= bs!23226 d!105919))

(declare-fun m!775583 () Bool)

(assert (=> bs!23226 m!775583))

(assert (=> b!831358 d!105919))

(declare-fun d!105921 () Bool)

(declare-fun res!566042 () Bool)

(declare-fun e!463802 () Bool)

(assert (=> d!105921 (=> res!566042 e!463802)))

(assert (=> d!105921 (= res!566042 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (= (_1!5049 (h!16977 (toList!4466 lt!377087))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105921 (= (containsKey!401 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000) e!463802)))

(declare-fun b!831687 () Bool)

(declare-fun e!463803 () Bool)

(assert (=> b!831687 (= e!463802 e!463803)))

(declare-fun res!566043 () Bool)

(assert (=> b!831687 (=> (not res!566043) (not e!463803))))

(assert (=> b!831687 (= res!566043 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377087))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377087))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377087)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377087))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831688 () Bool)

(assert (=> b!831688 (= e!463803 (containsKey!401 (t!22203 (toList!4466 lt!377087)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105921 (not res!566042)) b!831687))

(assert (= (and b!831687 res!566043) b!831688))

(declare-fun m!775585 () Bool)

(assert (=> b!831688 m!775585))

(assert (=> d!105785 d!105921))

(declare-fun d!105923 () Bool)

(assert (=> d!105923 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105789 d!105923))

(declare-fun b!831690 () Bool)

(declare-fun e!463804 () Option!422)

(declare-fun e!463805 () Option!422)

(assert (=> b!831690 (= e!463804 e!463805)))

(declare-fun c!90301 () Bool)

(assert (=> b!831690 (= c!90301 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377202))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831691 () Bool)

(assert (=> b!831691 (= e!463805 (getValueByKey!416 (t!22203 (toList!4466 lt!377202)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105925 () Bool)

(declare-fun c!90300 () Bool)

(assert (=> d!105925 (= c!90300 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (= (_1!5049 (h!16977 (toList!4466 lt!377202))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105925 (= (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000) e!463804)))

(declare-fun b!831689 () Bool)

(assert (=> b!831689 (= e!463804 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377202)))))))

(declare-fun b!831692 () Bool)

(assert (=> b!831692 (= e!463805 None!420)))

(assert (= (and d!105925 c!90300) b!831689))

(assert (= (and d!105925 (not c!90300)) b!831690))

(assert (= (and b!831690 c!90301) b!831691))

(assert (= (and b!831690 (not c!90301)) b!831692))

(declare-fun m!775587 () Bool)

(assert (=> b!831691 m!775587))

(assert (=> d!105789 d!105925))

(declare-fun d!105927 () Bool)

(assert (=> d!105927 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377177) lt!377172)) (v!10095 (getValueByKey!416 (toList!4466 lt!377177) lt!377172)))))

(assert (=> d!105819 d!105927))

(declare-fun b!831694 () Bool)

(declare-fun e!463806 () Option!422)

(declare-fun e!463807 () Option!422)

(assert (=> b!831694 (= e!463806 e!463807)))

(declare-fun c!90303 () Bool)

(assert (=> b!831694 (= c!90303 (and ((_ is Cons!15842) (toList!4466 lt!377177)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377177))) lt!377172))))))

(declare-fun b!831695 () Bool)

(assert (=> b!831695 (= e!463807 (getValueByKey!416 (t!22203 (toList!4466 lt!377177)) lt!377172))))

(declare-fun d!105929 () Bool)

(declare-fun c!90302 () Bool)

(assert (=> d!105929 (= c!90302 (and ((_ is Cons!15842) (toList!4466 lt!377177)) (= (_1!5049 (h!16977 (toList!4466 lt!377177))) lt!377172)))))

(assert (=> d!105929 (= (getValueByKey!416 (toList!4466 lt!377177) lt!377172) e!463806)))

(declare-fun b!831693 () Bool)

(assert (=> b!831693 (= e!463806 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377177)))))))

(declare-fun b!831696 () Bool)

(assert (=> b!831696 (= e!463807 None!420)))

(assert (= (and d!105929 c!90302) b!831693))

(assert (= (and d!105929 (not c!90302)) b!831694))

(assert (= (and b!831694 c!90303) b!831695))

(assert (= (and b!831694 (not c!90303)) b!831696))

(declare-fun m!775589 () Bool)

(assert (=> b!831695 m!775589))

(assert (=> d!105819 d!105929))

(declare-fun d!105931 () Bool)

(assert (=> d!105931 (= (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))))

(declare-fun bs!23227 () Bool)

(assert (= bs!23227 d!105931))

(assert (=> bs!23227 m!775357))

(declare-fun m!775591 () Bool)

(assert (=> bs!23227 m!775591))

(assert (=> b!831555 d!105931))

(declare-fun b!831698 () Bool)

(declare-fun e!463808 () Option!422)

(declare-fun e!463809 () Option!422)

(assert (=> b!831698 (= e!463808 e!463809)))

(declare-fun c!90305 () Bool)

(assert (=> b!831698 (= c!90305 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))))) lt!377089))))))

(declare-fun b!831699 () Bool)

(assert (=> b!831699 (= e!463809 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))) lt!377089))))

(declare-fun d!105933 () Bool)

(declare-fun c!90304 () Bool)

(assert (=> d!105933 (= c!90304 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))))) lt!377089)))))

(assert (=> d!105933 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089) e!463808)))

(declare-fun b!831697 () Bool)

(assert (=> b!831697 (= e!463808 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))))))))

(declare-fun b!831700 () Bool)

(assert (=> b!831700 (= e!463809 None!420)))

(assert (= (and d!105933 c!90304) b!831697))

(assert (= (and d!105933 (not c!90304)) b!831698))

(assert (= (and b!831698 c!90305) b!831699))

(assert (= (and b!831698 (not c!90305)) b!831700))

(declare-fun m!775593 () Bool)

(assert (=> b!831699 m!775593))

(assert (=> b!831555 d!105933))

(declare-fun b!831713 () Bool)

(declare-fun e!463817 () SeekEntryResult!8695)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!831713 (= e!463817 (seekKeyOrZeroReturnVacant!0 (bvadd (x!70074 lt!377242) #b00000000000000000000000000000001) (nextIndex!0 (index!37153 lt!377242) (bvadd (x!70074 lt!377242) #b00000000000000000000000000000001) mask!1312) (index!37153 lt!377242) (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!831714 () Bool)

(declare-fun c!90314 () Bool)

(declare-fun lt!377459 () (_ BitVec 64))

(assert (=> b!831714 (= c!90314 (= lt!377459 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463816 () SeekEntryResult!8695)

(assert (=> b!831714 (= e!463816 e!463817)))

(declare-fun b!831715 () Bool)

(assert (=> b!831715 (= e!463816 (Found!8695 (index!37153 lt!377242)))))

(declare-fun b!831716 () Bool)

(declare-fun e!463818 () SeekEntryResult!8695)

(assert (=> b!831716 (= e!463818 Undefined!8695)))

(declare-fun b!831717 () Bool)

(assert (=> b!831717 (= e!463818 e!463816)))

(declare-fun c!90313 () Bool)

(assert (=> b!831717 (= c!90313 (= lt!377459 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105935 () Bool)

(declare-fun lt!377458 () SeekEntryResult!8695)

(assert (=> d!105935 (and (or ((_ is Undefined!8695) lt!377458) (not ((_ is Found!8695) lt!377458)) (and (bvsge (index!37152 lt!377458) #b00000000000000000000000000000000) (bvslt (index!37152 lt!377458) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377458) ((_ is Found!8695) lt!377458) (not ((_ is MissingVacant!8695) lt!377458)) (not (= (index!37154 lt!377458) (index!37153 lt!377242))) (and (bvsge (index!37154 lt!377458) #b00000000000000000000000000000000) (bvslt (index!37154 lt!377458) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377458) (ite ((_ is Found!8695) lt!377458) (= (select (arr!22325 _keys!976) (index!37152 lt!377458)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!8695) lt!377458) (= (index!37154 lt!377458) (index!37153 lt!377242)) (= (select (arr!22325 _keys!976) (index!37154 lt!377458)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!105935 (= lt!377458 e!463818)))

(declare-fun c!90312 () Bool)

(assert (=> d!105935 (= c!90312 (bvsge (x!70074 lt!377242) #b01111111111111111111111111111110))))

(assert (=> d!105935 (= lt!377459 (select (arr!22325 _keys!976) (index!37153 lt!377242)))))

(assert (=> d!105935 (validMask!0 mask!1312)))

(assert (=> d!105935 (= (seekKeyOrZeroReturnVacant!0 (x!70074 lt!377242) (index!37153 lt!377242) (index!37153 lt!377242) (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377458)))

(declare-fun b!831718 () Bool)

(assert (=> b!831718 (= e!463817 (MissingVacant!8695 (index!37153 lt!377242)))))

(assert (= (and d!105935 c!90312) b!831716))

(assert (= (and d!105935 (not c!90312)) b!831717))

(assert (= (and b!831717 c!90313) b!831715))

(assert (= (and b!831717 (not c!90313)) b!831714))

(assert (= (and b!831714 c!90314) b!831718))

(assert (= (and b!831714 (not c!90314)) b!831713))

(declare-fun m!775595 () Bool)

(assert (=> b!831713 m!775595))

(assert (=> b!831713 m!775595))

(assert (=> b!831713 m!774611))

(declare-fun m!775597 () Bool)

(assert (=> b!831713 m!775597))

(declare-fun m!775599 () Bool)

(assert (=> d!105935 m!775599))

(declare-fun m!775601 () Bool)

(assert (=> d!105935 m!775601))

(assert (=> d!105935 m!774853))

(assert (=> d!105935 m!774527))

(assert (=> b!831344 d!105935))

(declare-fun d!105937 () Bool)

(declare-fun lt!377460 () Bool)

(assert (=> d!105937 (= lt!377460 (select (content!386 (toList!4466 lt!377412)) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!463820 () Bool)

(assert (=> d!105937 (= lt!377460 e!463820)))

(declare-fun res!566044 () Bool)

(assert (=> d!105937 (=> (not res!566044) (not e!463820))))

(assert (=> d!105937 (= res!566044 ((_ is Cons!15842) (toList!4466 lt!377412)))))

(assert (=> d!105937 (= (contains!4188 (toList!4466 lt!377412) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377460)))

(declare-fun b!831719 () Bool)

(declare-fun e!463819 () Bool)

(assert (=> b!831719 (= e!463820 e!463819)))

(declare-fun res!566045 () Bool)

(assert (=> b!831719 (=> res!566045 e!463819)))

(assert (=> b!831719 (= res!566045 (= (h!16977 (toList!4466 lt!377412)) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831720 () Bool)

(assert (=> b!831720 (= e!463819 (contains!4188 (t!22203 (toList!4466 lt!377412)) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!105937 res!566044) b!831719))

(assert (= (and b!831719 (not res!566045)) b!831720))

(declare-fun m!775603 () Bool)

(assert (=> d!105937 m!775603))

(declare-fun m!775605 () Bool)

(assert (=> d!105937 m!775605))

(declare-fun m!775607 () Bool)

(assert (=> b!831720 m!775607))

(assert (=> b!831590 d!105937))

(declare-fun d!105939 () Bool)

(declare-fun res!566046 () Bool)

(declare-fun e!463821 () Bool)

(assert (=> d!105939 (=> res!566046 e!463821)))

(assert (=> d!105939 (= res!566046 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (= (_1!5049 (h!16977 (toList!4466 lt!377094))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105939 (= (containsKey!401 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000) e!463821)))

(declare-fun b!831721 () Bool)

(declare-fun e!463822 () Bool)

(assert (=> b!831721 (= e!463821 e!463822)))

(declare-fun res!566047 () Bool)

(assert (=> b!831721 (=> (not res!566047) (not e!463822))))

(assert (=> b!831721 (= res!566047 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377094))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377094))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377094)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377094))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831722 () Bool)

(assert (=> b!831722 (= e!463822 (containsKey!401 (t!22203 (toList!4466 lt!377094)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105939 (not res!566046)) b!831721))

(assert (= (and b!831721 res!566047) b!831722))

(declare-fun m!775609 () Bool)

(assert (=> b!831722 m!775609))

(assert (=> d!105875 d!105939))

(declare-fun d!105941 () Bool)

(declare-fun res!566048 () Bool)

(declare-fun e!463823 () Bool)

(assert (=> d!105941 (=> res!566048 e!463823)))

(assert (=> d!105941 (= res!566048 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (= (_1!5049 (h!16977 (toList!4466 lt!377180))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105941 (= (containsKey!401 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000) e!463823)))

(declare-fun b!831723 () Bool)

(declare-fun e!463824 () Bool)

(assert (=> b!831723 (= e!463823 e!463824)))

(declare-fun res!566049 () Bool)

(assert (=> b!831723 (=> (not res!566049) (not e!463824))))

(assert (=> b!831723 (= res!566049 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377180))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377180))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377180)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377180))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831724 () Bool)

(assert (=> b!831724 (= e!463824 (containsKey!401 (t!22203 (toList!4466 lt!377180)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105941 (not res!566048)) b!831723))

(assert (= (and b!831723 res!566049) b!831724))

(declare-fun m!775611 () Bool)

(assert (=> b!831724 m!775611))

(assert (=> d!105779 d!105941))

(declare-fun d!105943 () Bool)

(assert (=> d!105943 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))

(declare-fun lt!377461 () Unit!28446)

(assert (=> d!105943 (= lt!377461 (choose!1427 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))

(declare-fun e!463825 () Bool)

(assert (=> d!105943 e!463825))

(declare-fun res!566050 () Bool)

(assert (=> d!105943 (=> (not res!566050) (not e!463825))))

(assert (=> d!105943 (= res!566050 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (=> d!105943 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176) lt!377461)))

(declare-fun b!831725 () Bool)

(assert (=> b!831725 (= e!463825 (containsKey!401 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))

(assert (= (and d!105943 res!566050) b!831725))

(assert (=> d!105943 m!775217))

(assert (=> d!105943 m!775217))

(assert (=> d!105943 m!775219))

(declare-fun m!775613 () Bool)

(assert (=> d!105943 m!775613))

(declare-fun m!775615 () Bool)

(assert (=> d!105943 m!775615))

(assert (=> b!831725 m!775213))

(assert (=> b!831511 d!105943))

(declare-fun d!105945 () Bool)

(assert (=> d!105945 (= (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176))))))

(declare-fun bs!23228 () Bool)

(assert (= bs!23228 d!105945))

(assert (=> bs!23228 m!775217))

(declare-fun m!775617 () Bool)

(assert (=> bs!23228 m!775617))

(assert (=> b!831511 d!105945))

(declare-fun b!831727 () Bool)

(declare-fun e!463826 () Option!422)

(declare-fun e!463827 () Option!422)

(assert (=> b!831727 (= e!463826 e!463827)))

(declare-fun c!90316 () Bool)

(assert (=> b!831727 (= c!90316 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))))) lt!377176))))))

(declare-fun b!831728 () Bool)

(assert (=> b!831728 (= e!463827 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))) lt!377176))))

(declare-fun c!90315 () Bool)

(declare-fun d!105947 () Bool)

(assert (=> d!105947 (= c!90315 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))))) lt!377176)))))

(assert (=> d!105947 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176) e!463826)))

(declare-fun b!831726 () Bool)

(assert (=> b!831726 (= e!463826 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))))

(declare-fun b!831729 () Bool)

(assert (=> b!831729 (= e!463827 None!420)))

(assert (= (and d!105947 c!90315) b!831726))

(assert (= (and d!105947 (not c!90315)) b!831727))

(assert (= (and b!831727 c!90316) b!831728))

(assert (= (and b!831727 (not c!90316)) b!831729))

(declare-fun m!775619 () Bool)

(assert (=> b!831728 m!775619))

(assert (=> b!831511 d!105947))

(declare-fun d!105949 () Bool)

(assert (=> d!105949 (= (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754))) lt!377194)) (v!10095 (getValueByKey!416 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754))) lt!377194)))))

(assert (=> d!105745 d!105949))

(declare-fun b!831731 () Bool)

(declare-fun e!463828 () Option!422)

(declare-fun e!463829 () Option!422)

(assert (=> b!831731 (= e!463828 e!463829)))

(declare-fun c!90318 () Bool)

(assert (=> b!831731 (= c!90318 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754))))) lt!377194))))))

(declare-fun b!831732 () Bool)

(assert (=> b!831732 (= e!463829 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)))) lt!377194))))

(declare-fun d!105951 () Bool)

(declare-fun c!90317 () Bool)

(assert (=> d!105951 (= c!90317 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754))))) lt!377194)))))

(assert (=> d!105951 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754))) lt!377194) e!463828)))

(declare-fun b!831730 () Bool)

(assert (=> b!831730 (= e!463828 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)))))))))

(declare-fun b!831733 () Bool)

(assert (=> b!831733 (= e!463829 None!420)))

(assert (= (and d!105951 c!90317) b!831730))

(assert (= (and d!105951 (not c!90317)) b!831731))

(assert (= (and b!831731 c!90318) b!831732))

(assert (= (and b!831731 (not c!90318)) b!831733))

(declare-fun m!775621 () Bool)

(assert (=> b!831732 m!775621))

(assert (=> d!105745 d!105951))

(declare-fun d!105953 () Bool)

(assert (=> d!105953 (= (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!831652 d!105953))

(declare-fun d!105955 () Bool)

(assert (=> d!105955 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23229 () Bool)

(assert (= bs!23229 d!105955))

(assert (=> bs!23229 m!774845))

(declare-fun m!775623 () Bool)

(assert (=> bs!23229 m!775623))

(assert (=> b!831322 d!105955))

(declare-fun b!831735 () Bool)

(declare-fun e!463830 () Option!422)

(declare-fun e!463831 () Option!422)

(assert (=> b!831735 (= e!463830 e!463831)))

(declare-fun c!90320 () Bool)

(assert (=> b!831735 (= c!90320 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377180))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831736 () Bool)

(assert (=> b!831736 (= e!463831 (getValueByKey!416 (t!22203 (toList!4466 lt!377180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!105957 () Bool)

(declare-fun c!90319 () Bool)

(assert (=> d!105957 (= c!90319 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (= (_1!5049 (h!16977 (toList!4466 lt!377180))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105957 (= (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000) e!463830)))

(declare-fun b!831734 () Bool)

(assert (=> b!831734 (= e!463830 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377180)))))))

(declare-fun b!831737 () Bool)

(assert (=> b!831737 (= e!463831 None!420)))

(assert (= (and d!105957 c!90319) b!831734))

(assert (= (and d!105957 (not c!90319)) b!831735))

(assert (= (and b!831735 c!90320) b!831736))

(assert (= (and b!831735 (not c!90320)) b!831737))

(declare-fun m!775625 () Bool)

(assert (=> b!831736 m!775625))

(assert (=> b!831322 d!105957))

(declare-fun d!105959 () Bool)

(declare-fun c!90323 () Bool)

(assert (=> d!105959 (= c!90323 ((_ is Nil!15843) (toList!4466 lt!377216)))))

(declare-fun e!463834 () (InoxSet tuple2!10076))

(assert (=> d!105959 (= (content!386 (toList!4466 lt!377216)) e!463834)))

(declare-fun b!831742 () Bool)

(assert (=> b!831742 (= e!463834 ((as const (Array tuple2!10076 Bool)) false))))

(declare-fun b!831743 () Bool)

(assert (=> b!831743 (= e!463834 ((_ map or) (store ((as const (Array tuple2!10076 Bool)) false) (h!16977 (toList!4466 lt!377216)) true) (content!386 (t!22203 (toList!4466 lt!377216)))))))

(assert (= (and d!105959 c!90323) b!831742))

(assert (= (and d!105959 (not c!90323)) b!831743))

(declare-fun m!775627 () Bool)

(assert (=> b!831743 m!775627))

(declare-fun m!775629 () Bool)

(assert (=> b!831743 m!775629))

(assert (=> d!105759 d!105959))

(declare-fun d!105961 () Bool)

(declare-fun res!566051 () Bool)

(declare-fun e!463835 () Bool)

(assert (=> d!105961 (=> res!566051 e!463835)))

(assert (=> d!105961 (= res!566051 (and ((_ is Cons!15842) lt!377428) (= (_1!5049 (h!16977 lt!377428)) (_1!5049 lt!377010))))))

(assert (=> d!105961 (= (containsKey!401 lt!377428 (_1!5049 lt!377010)) e!463835)))

(declare-fun b!831744 () Bool)

(declare-fun e!463836 () Bool)

(assert (=> b!831744 (= e!463835 e!463836)))

(declare-fun res!566052 () Bool)

(assert (=> b!831744 (=> (not res!566052) (not e!463836))))

(assert (=> b!831744 (= res!566052 (and (or (not ((_ is Cons!15842) lt!377428)) (bvsle (_1!5049 (h!16977 lt!377428)) (_1!5049 lt!377010))) ((_ is Cons!15842) lt!377428) (bvslt (_1!5049 (h!16977 lt!377428)) (_1!5049 lt!377010))))))

(declare-fun b!831745 () Bool)

(assert (=> b!831745 (= e!463836 (containsKey!401 (t!22203 lt!377428) (_1!5049 lt!377010)))))

(assert (= (and d!105961 (not res!566051)) b!831744))

(assert (= (and b!831744 res!566052) b!831745))

(declare-fun m!775631 () Bool)

(assert (=> b!831745 m!775631))

(assert (=> b!831618 d!105961))

(declare-fun b!831765 () Bool)

(declare-fun lt!377467 () SeekEntryResult!8695)

(assert (=> b!831765 (and (bvsge (index!37153 lt!377467) #b00000000000000000000000000000000) (bvslt (index!37153 lt!377467) (size!22745 _keys!976)))))

(declare-fun e!463847 () Bool)

(assert (=> b!831765 (= e!463847 (= (select (arr!22325 _keys!976) (index!37153 lt!377467)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!831766 () Bool)

(assert (=> b!831766 (and (bvsge (index!37153 lt!377467) #b00000000000000000000000000000000) (bvslt (index!37153 lt!377467) (size!22745 _keys!976)))))

(declare-fun res!566060 () Bool)

(assert (=> b!831766 (= res!566060 (= (select (arr!22325 _keys!976) (index!37153 lt!377467)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831766 (=> res!566060 e!463847)))

(declare-fun b!831767 () Bool)

(declare-fun e!463850 () Bool)

(assert (=> b!831767 (= e!463850 (bvsge (x!70074 lt!377467) #b01111111111111111111111111111110))))

(declare-fun b!831768 () Bool)

(declare-fun e!463851 () SeekEntryResult!8695)

(assert (=> b!831768 (= e!463851 (Intermediate!8695 true (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!831769 () Bool)

(declare-fun e!463848 () SeekEntryResult!8695)

(assert (=> b!831769 (= e!463851 e!463848)))

(declare-fun c!90330 () Bool)

(declare-fun lt!377466 () (_ BitVec 64))

(assert (=> b!831769 (= c!90330 (or (= lt!377466 (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) (= (bvadd lt!377466 lt!377466) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831770 () Bool)

(assert (=> b!831770 (= e!463848 (Intermediate!8695 false (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312) #b00000000000000000000000000000000))))

(declare-fun b!831771 () Bool)

(assert (=> b!831771 (= e!463848 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!1312) (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312))))

(declare-fun b!831772 () Bool)

(assert (=> b!831772 (and (bvsge (index!37153 lt!377467) #b00000000000000000000000000000000) (bvslt (index!37153 lt!377467) (size!22745 _keys!976)))))

(declare-fun res!566059 () Bool)

(assert (=> b!831772 (= res!566059 (= (select (arr!22325 _keys!976) (index!37153 lt!377467)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!831772 (=> res!566059 e!463847)))

(declare-fun e!463849 () Bool)

(assert (=> b!831772 (= e!463849 e!463847)))

(declare-fun d!105963 () Bool)

(assert (=> d!105963 e!463850))

(declare-fun c!90332 () Bool)

(assert (=> d!105963 (= c!90332 (and ((_ is Intermediate!8695) lt!377467) (undefined!9507 lt!377467)))))

(assert (=> d!105963 (= lt!377467 e!463851)))

(declare-fun c!90331 () Bool)

(assert (=> d!105963 (= c!90331 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!105963 (= lt!377466 (select (arr!22325 _keys!976) (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312)))))

(assert (=> d!105963 (validMask!0 mask!1312)))

(assert (=> d!105963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312) (select (arr!22325 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) lt!377467)))

(declare-fun b!831764 () Bool)

(assert (=> b!831764 (= e!463850 e!463849)))

(declare-fun res!566061 () Bool)

(assert (=> b!831764 (= res!566061 (and ((_ is Intermediate!8695) lt!377467) (not (undefined!9507 lt!377467)) (bvslt (x!70074 lt!377467) #b01111111111111111111111111111110) (bvsge (x!70074 lt!377467) #b00000000000000000000000000000000) (bvsge (x!70074 lt!377467) #b00000000000000000000000000000000)))))

(assert (=> b!831764 (=> (not res!566061) (not e!463849))))

(assert (= (and d!105963 c!90331) b!831768))

(assert (= (and d!105963 (not c!90331)) b!831769))

(assert (= (and b!831769 c!90330) b!831770))

(assert (= (and b!831769 (not c!90330)) b!831771))

(assert (= (and d!105963 c!90332) b!831767))

(assert (= (and d!105963 (not c!90332)) b!831764))

(assert (= (and b!831764 res!566061) b!831772))

(assert (= (and b!831772 (not res!566059)) b!831766))

(assert (= (and b!831766 (not res!566060)) b!831765))

(assert (=> d!105963 m!774857))

(declare-fun m!775633 () Bool)

(assert (=> d!105963 m!775633))

(assert (=> d!105963 m!774527))

(declare-fun m!775635 () Bool)

(assert (=> b!831765 m!775635))

(assert (=> b!831771 m!774857))

(declare-fun m!775637 () Bool)

(assert (=> b!831771 m!775637))

(assert (=> b!831771 m!775637))

(assert (=> b!831771 m!774611))

(declare-fun m!775639 () Bool)

(assert (=> b!831771 m!775639))

(assert (=> b!831772 m!775635))

(assert (=> b!831766 m!775635))

(assert (=> d!105695 d!105963))

(declare-fun d!105965 () Bool)

(declare-fun lt!377473 () (_ BitVec 32))

(declare-fun lt!377472 () (_ BitVec 32))

(assert (=> d!105965 (= lt!377473 (bvmul (bvxor lt!377472 (bvlshr lt!377472 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!105965 (= lt!377472 ((_ extract 31 0) (bvand (bvxor (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22325 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!105965 (and (bvsge mask!1312 #b00000000000000000000000000000000) (let ((res!566062 (let ((h!16983 ((_ extract 31 0) (bvand (bvxor (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (bvlshr (select (arr!22325 _keys!976) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!70085 (bvmul (bvxor h!16983 (bvlshr h!16983 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!70085 (bvlshr x!70085 #b00000000000000000000000000001101)) mask!1312))))) (and (bvslt res!566062 (bvadd mask!1312 #b00000000000000000000000000000001)) (bvsge res!566062 #b00000000000000000000000000000000))))))

(assert (=> d!105965 (= (toIndex!0 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) mask!1312) (bvand (bvxor lt!377473 (bvlshr lt!377473 #b00000000000000000000000000001101)) mask!1312))))

(assert (=> d!105695 d!105965))

(assert (=> d!105695 d!105667))

(declare-fun d!105967 () Bool)

(declare-fun res!566063 () Bool)

(declare-fun e!463852 () Bool)

(assert (=> d!105967 (=> res!566063 e!463852)))

(assert (=> d!105967 (= res!566063 (and ((_ is Cons!15842) lt!377372) (= (_1!5049 (h!16977 lt!377372)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!105967 (= (containsKey!401 lt!377372 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!463852)))

(declare-fun b!831773 () Bool)

(declare-fun e!463853 () Bool)

(assert (=> b!831773 (= e!463852 e!463853)))

(declare-fun res!566064 () Bool)

(assert (=> b!831773 (=> (not res!566064) (not e!463853))))

(assert (=> b!831773 (= res!566064 (and (or (not ((_ is Cons!15842) lt!377372)) (bvsle (_1!5049 (h!16977 lt!377372)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15842) lt!377372) (bvslt (_1!5049 (h!16977 lt!377372)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831774 () Bool)

(assert (=> b!831774 (= e!463853 (containsKey!401 (t!22203 lt!377372) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!105967 (not res!566063)) b!831773))

(assert (= (and b!831773 res!566064) b!831774))

(declare-fun m!775641 () Bool)

(assert (=> b!831774 m!775641))

(assert (=> b!831537 d!105967))

(declare-fun b!831775 () Bool)

(declare-fun e!463855 () Bool)

(declare-fun call!36334 () Bool)

(assert (=> b!831775 (= e!463855 call!36334)))

(declare-fun b!831776 () Bool)

(declare-fun e!463856 () Bool)

(assert (=> b!831776 (= e!463855 e!463856)))

(declare-fun lt!377474 () (_ BitVec 64))

(assert (=> b!831776 (= lt!377474 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!377475 () Unit!28446)

(assert (=> b!831776 (= lt!377475 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377474 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!831776 (arrayContainsKey!0 _keys!976 lt!377474 #b00000000000000000000000000000000)))

(declare-fun lt!377476 () Unit!28446)

(assert (=> b!831776 (= lt!377476 lt!377475)))

(declare-fun res!566066 () Bool)

(assert (=> b!831776 (= res!566066 (= (seekEntryOrOpen!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) _keys!976 mask!1312) (Found!8695 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831776 (=> (not res!566066) (not e!463856))))

(declare-fun b!831777 () Bool)

(declare-fun e!463854 () Bool)

(assert (=> b!831777 (= e!463854 e!463855)))

(declare-fun c!90333 () Bool)

(assert (=> b!831777 (= c!90333 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!105969 () Bool)

(declare-fun res!566065 () Bool)

(assert (=> d!105969 (=> res!566065 e!463854)))

(assert (=> d!105969 (= res!566065 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!105969 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312) e!463854)))

(declare-fun bm!36331 () Bool)

(assert (=> bm!36331 (= call!36334 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!831778 () Bool)

(assert (=> b!831778 (= e!463856 call!36334)))

(assert (= (and d!105969 (not res!566065)) b!831777))

(assert (= (and b!831777 c!90333) b!831776))

(assert (= (and b!831777 (not c!90333)) b!831775))

(assert (= (and b!831776 res!566066) b!831778))

(assert (= (or b!831778 b!831775) bm!36331))

(declare-fun m!775643 () Bool)

(assert (=> b!831776 m!775643))

(declare-fun m!775645 () Bool)

(assert (=> b!831776 m!775645))

(declare-fun m!775647 () Bool)

(assert (=> b!831776 m!775647))

(assert (=> b!831776 m!775643))

(declare-fun m!775649 () Bool)

(assert (=> b!831776 m!775649))

(assert (=> b!831777 m!775643))

(assert (=> b!831777 m!775643))

(declare-fun m!775651 () Bool)

(assert (=> b!831777 m!775651))

(declare-fun m!775653 () Bool)

(assert (=> bm!36331 m!775653))

(assert (=> bm!36314 d!105969))

(declare-fun d!105971 () Bool)

(declare-fun lt!377477 () Bool)

(assert (=> d!105971 (= lt!377477 (select (content!386 lt!377118) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun e!463858 () Bool)

(assert (=> d!105971 (= lt!377477 e!463858)))

(declare-fun res!566067 () Bool)

(assert (=> d!105971 (=> (not res!566067) (not e!463858))))

(assert (=> d!105971 (= res!566067 ((_ is Cons!15842) lt!377118))))

(assert (=> d!105971 (= (contains!4188 lt!377118 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))) lt!377477)))

(declare-fun b!831779 () Bool)

(declare-fun e!463857 () Bool)

(assert (=> b!831779 (= e!463858 e!463857)))

(declare-fun res!566068 () Bool)

(assert (=> b!831779 (=> res!566068 e!463857)))

(assert (=> b!831779 (= res!566068 (= (h!16977 lt!377118) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831780 () Bool)

(assert (=> b!831780 (= e!463857 (contains!4188 (t!22203 lt!377118) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(assert (= (and d!105971 res!566067) b!831779))

(assert (= (and b!831779 (not res!566068)) b!831780))

(declare-fun m!775655 () Bool)

(assert (=> d!105971 m!775655))

(declare-fun m!775657 () Bool)

(assert (=> d!105971 m!775657))

(declare-fun m!775659 () Bool)

(assert (=> b!831780 m!775659))

(assert (=> b!831612 d!105971))

(assert (=> d!105769 d!105767))

(declare-fun d!105973 () Bool)

(assert (=> d!105973 (= (getValueByKey!416 lt!377210 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(assert (=> d!105973 true))

(declare-fun _$22!568 () Unit!28446)

(assert (=> d!105973 (= (choose!1423 lt!377210 (_1!5049 lt!377012) (_2!5049 lt!377012)) _$22!568)))

(declare-fun bs!23230 () Bool)

(assert (= bs!23230 d!105973))

(assert (=> bs!23230 m!774805))

(assert (=> d!105769 d!105973))

(declare-fun d!105975 () Bool)

(declare-fun res!566073 () Bool)

(declare-fun e!463863 () Bool)

(assert (=> d!105975 (=> res!566073 e!463863)))

(assert (=> d!105975 (= res!566073 (or ((_ is Nil!15843) lt!377210) ((_ is Nil!15843) (t!22203 lt!377210))))))

(assert (=> d!105975 (= (isStrictlySorted!429 lt!377210) e!463863)))

(declare-fun b!831785 () Bool)

(declare-fun e!463864 () Bool)

(assert (=> b!831785 (= e!463863 e!463864)))

(declare-fun res!566074 () Bool)

(assert (=> b!831785 (=> (not res!566074) (not e!463864))))

(assert (=> b!831785 (= res!566074 (bvslt (_1!5049 (h!16977 lt!377210)) (_1!5049 (h!16977 (t!22203 lt!377210)))))))

(declare-fun b!831786 () Bool)

(assert (=> b!831786 (= e!463864 (isStrictlySorted!429 (t!22203 lt!377210)))))

(assert (= (and d!105975 (not res!566073)) b!831785))

(assert (= (and b!831785 res!566074) b!831786))

(declare-fun m!775661 () Bool)

(assert (=> b!831786 m!775661))

(assert (=> d!105769 d!105975))

(declare-fun b!831788 () Bool)

(declare-fun e!463865 () Option!422)

(declare-fun e!463866 () Option!422)

(assert (=> b!831788 (= e!463865 e!463866)))

(declare-fun c!90335 () Bool)

(assert (=> b!831788 (= c!90335 (and ((_ is Cons!15842) (t!22203 lt!377110)) (not (= (_1!5049 (h!16977 (t!22203 lt!377110))) (_1!5049 lt!377010)))))))

(declare-fun b!831789 () Bool)

(assert (=> b!831789 (= e!463866 (getValueByKey!416 (t!22203 (t!22203 lt!377110)) (_1!5049 lt!377010)))))

(declare-fun d!105977 () Bool)

(declare-fun c!90334 () Bool)

(assert (=> d!105977 (= c!90334 (and ((_ is Cons!15842) (t!22203 lt!377110)) (= (_1!5049 (h!16977 (t!22203 lt!377110))) (_1!5049 lt!377010))))))

(assert (=> d!105977 (= (getValueByKey!416 (t!22203 lt!377110) (_1!5049 lt!377010)) e!463865)))

(declare-fun b!831787 () Bool)

(assert (=> b!831787 (= e!463865 (Some!421 (_2!5049 (h!16977 (t!22203 lt!377110)))))))

(declare-fun b!831790 () Bool)

(assert (=> b!831790 (= e!463866 None!420)))

(assert (= (and d!105977 c!90334) b!831787))

(assert (= (and d!105977 (not c!90334)) b!831788))

(assert (= (and b!831788 c!90335) b!831789))

(assert (= (and b!831788 (not c!90335)) b!831790))

(declare-fun m!775663 () Bool)

(assert (=> b!831789 m!775663))

(assert (=> b!831402 d!105977))

(declare-fun d!105979 () Bool)

(declare-fun e!463868 () Bool)

(assert (=> d!105979 e!463868))

(declare-fun res!566075 () Bool)

(assert (=> d!105979 (=> res!566075 e!463868)))

(declare-fun lt!377480 () Bool)

(assert (=> d!105979 (= res!566075 (not lt!377480))))

(declare-fun lt!377479 () Bool)

(assert (=> d!105979 (= lt!377480 lt!377479)))

(declare-fun lt!377478 () Unit!28446)

(declare-fun e!463867 () Unit!28446)

(assert (=> d!105979 (= lt!377478 e!463867)))

(declare-fun c!90336 () Bool)

(assert (=> d!105979 (= c!90336 lt!377479)))

(assert (=> d!105979 (= lt!377479 (containsKey!401 (toList!4466 lt!377412) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!105979 (= (contains!4187 lt!377412 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377480)))

(declare-fun b!831791 () Bool)

(declare-fun lt!377481 () Unit!28446)

(assert (=> b!831791 (= e!463867 lt!377481)))

(assert (=> b!831791 (= lt!377481 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377412) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!831791 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377412) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831792 () Bool)

(declare-fun Unit!28476 () Unit!28446)

(assert (=> b!831792 (= e!463867 Unit!28476)))

(declare-fun b!831793 () Bool)

(assert (=> b!831793 (= e!463868 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377412) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105979 c!90336) b!831791))

(assert (= (and d!105979 (not c!90336)) b!831792))

(assert (= (and d!105979 (not res!566075)) b!831793))

(declare-fun m!775665 () Bool)

(assert (=> d!105979 m!775665))

(declare-fun m!775667 () Bool)

(assert (=> b!831791 m!775667))

(assert (=> b!831791 m!775433))

(assert (=> b!831791 m!775433))

(declare-fun m!775669 () Bool)

(assert (=> b!831791 m!775669))

(assert (=> b!831793 m!775433))

(assert (=> b!831793 m!775433))

(assert (=> b!831793 m!775669))

(assert (=> d!105859 d!105979))

(declare-fun b!831795 () Bool)

(declare-fun e!463869 () Option!422)

(declare-fun e!463870 () Option!422)

(assert (=> b!831795 (= e!463869 e!463870)))

(declare-fun c!90338 () Bool)

(assert (=> b!831795 (= c!90338 (and ((_ is Cons!15842) lt!377414) (not (= (_1!5049 (h!16977 lt!377414)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!831796 () Bool)

(assert (=> b!831796 (= e!463870 (getValueByKey!416 (t!22203 lt!377414) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!90337 () Bool)

(declare-fun d!105981 () Bool)

(assert (=> d!105981 (= c!90337 (and ((_ is Cons!15842) lt!377414) (= (_1!5049 (h!16977 lt!377414)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105981 (= (getValueByKey!416 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463869)))

(declare-fun b!831794 () Bool)

(assert (=> b!831794 (= e!463869 (Some!421 (_2!5049 (h!16977 lt!377414))))))

(declare-fun b!831797 () Bool)

(assert (=> b!831797 (= e!463870 None!420)))

(assert (= (and d!105981 c!90337) b!831794))

(assert (= (and d!105981 (not c!90337)) b!831795))

(assert (= (and b!831795 c!90338) b!831796))

(assert (= (and b!831795 (not c!90338)) b!831797))

(declare-fun m!775671 () Bool)

(assert (=> b!831796 m!775671))

(assert (=> d!105859 d!105981))

(declare-fun d!105983 () Bool)

(assert (=> d!105983 (= (getValueByKey!416 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377482 () Unit!28446)

(assert (=> d!105983 (= lt!377482 (choose!1423 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!463871 () Bool)

(assert (=> d!105983 e!463871))

(declare-fun res!566076 () Bool)

(assert (=> d!105983 (=> (not res!566076) (not e!463871))))

(assert (=> d!105983 (= res!566076 (isStrictlySorted!429 lt!377414))))

(assert (=> d!105983 (= (lemmaContainsTupThenGetReturnValue!230 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377482)))

(declare-fun b!831798 () Bool)

(declare-fun res!566077 () Bool)

(assert (=> b!831798 (=> (not res!566077) (not e!463871))))

(assert (=> b!831798 (= res!566077 (containsKey!401 lt!377414 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831799 () Bool)

(assert (=> b!831799 (= e!463871 (contains!4188 lt!377414 (tuple2!10077 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!105983 res!566076) b!831798))

(assert (= (and b!831798 res!566077) b!831799))

(assert (=> d!105983 m!775427))

(declare-fun m!775673 () Bool)

(assert (=> d!105983 m!775673))

(declare-fun m!775675 () Bool)

(assert (=> d!105983 m!775675))

(declare-fun m!775677 () Bool)

(assert (=> b!831798 m!775677))

(declare-fun m!775679 () Bool)

(assert (=> b!831799 m!775679))

(assert (=> d!105859 d!105983))

(declare-fun bm!36332 () Bool)

(declare-fun call!36335 () List!15846)

(declare-fun call!36336 () List!15846)

(assert (=> bm!36332 (= call!36335 call!36336)))

(declare-fun bm!36333 () Bool)

(declare-fun call!36337 () List!15846)

(assert (=> bm!36333 (= call!36336 call!36337)))

(declare-fun d!105985 () Bool)

(declare-fun e!463874 () Bool)

(assert (=> d!105985 e!463874))

(declare-fun res!566079 () Bool)

(assert (=> d!105985 (=> (not res!566079) (not e!463874))))

(declare-fun lt!377483 () List!15846)

(assert (=> d!105985 (= res!566079 (isStrictlySorted!429 lt!377483))))

(declare-fun e!463875 () List!15846)

(assert (=> d!105985 (= lt!377483 e!463875)))

(declare-fun c!90340 () Bool)

(assert (=> d!105985 (= c!90340 (and ((_ is Cons!15842) (toList!4466 call!36277)) (bvslt (_1!5049 (h!16977 (toList!4466 call!36277))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!105985 (isStrictlySorted!429 (toList!4466 call!36277))))

(assert (=> d!105985 (= (insertStrictlySorted!269 (toList!4466 call!36277) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377483)))

(declare-fun c!90341 () Bool)

(declare-fun b!831800 () Bool)

(declare-fun c!90342 () Bool)

(declare-fun e!463876 () List!15846)

(assert (=> b!831800 (= e!463876 (ite c!90342 (t!22203 (toList!4466 call!36277)) (ite c!90341 (Cons!15842 (h!16977 (toList!4466 call!36277)) (t!22203 (toList!4466 call!36277))) Nil!15843)))))

(declare-fun b!831801 () Bool)

(declare-fun e!463873 () List!15846)

(assert (=> b!831801 (= e!463873 call!36335)))

(declare-fun b!831802 () Bool)

(assert (=> b!831802 (= e!463873 call!36335)))

(declare-fun b!831803 () Bool)

(declare-fun e!463872 () List!15846)

(assert (=> b!831803 (= e!463872 call!36336)))

(declare-fun bm!36334 () Bool)

(assert (=> bm!36334 (= call!36337 ($colon$colon!533 e!463876 (ite c!90340 (h!16977 (toList!4466 call!36277)) (tuple2!10077 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90339 () Bool)

(assert (=> bm!36334 (= c!90339 c!90340)))

(declare-fun b!831804 () Bool)

(assert (=> b!831804 (= e!463876 (insertStrictlySorted!269 (t!22203 (toList!4466 call!36277)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831805 () Bool)

(declare-fun res!566078 () Bool)

(assert (=> b!831805 (=> (not res!566078) (not e!463874))))

(assert (=> b!831805 (= res!566078 (containsKey!401 lt!377483 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!831806 () Bool)

(assert (=> b!831806 (= e!463875 e!463872)))

(assert (=> b!831806 (= c!90342 (and ((_ is Cons!15842) (toList!4466 call!36277)) (= (_1!5049 (h!16977 (toList!4466 call!36277))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831807 () Bool)

(assert (=> b!831807 (= e!463874 (contains!4188 lt!377483 (tuple2!10077 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831808 () Bool)

(assert (=> b!831808 (= e!463875 call!36337)))

(declare-fun b!831809 () Bool)

(assert (=> b!831809 (= c!90341 (and ((_ is Cons!15842) (toList!4466 call!36277)) (bvsgt (_1!5049 (h!16977 (toList!4466 call!36277))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!831809 (= e!463872 e!463873)))

(assert (= (and d!105985 c!90340) b!831808))

(assert (= (and d!105985 (not c!90340)) b!831806))

(assert (= (and b!831806 c!90342) b!831803))

(assert (= (and b!831806 (not c!90342)) b!831809))

(assert (= (and b!831809 c!90341) b!831801))

(assert (= (and b!831809 (not c!90341)) b!831802))

(assert (= (or b!831801 b!831802) bm!36332))

(assert (= (or b!831803 bm!36332) bm!36333))

(assert (= (or b!831808 bm!36333) bm!36334))

(assert (= (and bm!36334 c!90339) b!831804))

(assert (= (and bm!36334 (not c!90339)) b!831800))

(assert (= (and d!105985 res!566079) b!831805))

(assert (= (and b!831805 res!566078) b!831807))

(declare-fun m!775681 () Bool)

(assert (=> d!105985 m!775681))

(declare-fun m!775683 () Bool)

(assert (=> d!105985 m!775683))

(declare-fun m!775685 () Bool)

(assert (=> bm!36334 m!775685))

(declare-fun m!775687 () Bool)

(assert (=> b!831804 m!775687))

(declare-fun m!775689 () Bool)

(assert (=> b!831805 m!775689))

(declare-fun m!775691 () Bool)

(assert (=> b!831807 m!775691))

(assert (=> d!105859 d!105985))

(declare-fun d!105987 () Bool)

(declare-fun lt!377484 () Bool)

(assert (=> d!105987 (= lt!377484 (select (content!386 lt!377324) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun e!463878 () Bool)

(assert (=> d!105987 (= lt!377484 e!463878)))

(declare-fun res!566080 () Bool)

(assert (=> d!105987 (=> (not res!566080) (not e!463878))))

(assert (=> d!105987 (= res!566080 ((_ is Cons!15842) lt!377324))))

(assert (=> d!105987 (= (contains!4188 lt!377324 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) lt!377484)))

(declare-fun b!831810 () Bool)

(declare-fun e!463877 () Bool)

(assert (=> b!831810 (= e!463878 e!463877)))

(declare-fun res!566081 () Bool)

(assert (=> b!831810 (=> res!566081 e!463877)))

(assert (=> b!831810 (= res!566081 (= (h!16977 lt!377324) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!831811 () Bool)

(assert (=> b!831811 (= e!463877 (contains!4188 (t!22203 lt!377324) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!105987 res!566080) b!831810))

(assert (= (and b!831810 (not res!566081)) b!831811))

(declare-fun m!775693 () Bool)

(assert (=> d!105987 m!775693))

(declare-fun m!775695 () Bool)

(assert (=> d!105987 m!775695))

(declare-fun m!775697 () Bool)

(assert (=> b!831811 m!775697))

(assert (=> b!831490 d!105987))

(declare-fun d!105989 () Bool)

(declare-fun e!463880 () Bool)

(assert (=> d!105989 e!463880))

(declare-fun res!566082 () Bool)

(assert (=> d!105989 (=> res!566082 e!463880)))

(declare-fun lt!377487 () Bool)

(assert (=> d!105989 (= res!566082 (not lt!377487))))

(declare-fun lt!377486 () Bool)

(assert (=> d!105989 (= lt!377487 lt!377486)))

(declare-fun lt!377485 () Unit!28446)

(declare-fun e!463879 () Unit!28446)

(assert (=> d!105989 (= lt!377485 e!463879)))

(declare-fun c!90343 () Bool)

(assert (=> d!105989 (= c!90343 lt!377486)))

(assert (=> d!105989 (= lt!377486 (containsKey!401 (toList!4466 lt!377199) lt!377194))))

(assert (=> d!105989 (= (contains!4187 lt!377199 lt!377194) lt!377487)))

(declare-fun b!831812 () Bool)

(declare-fun lt!377488 () Unit!28446)

(assert (=> b!831812 (= e!463879 lt!377488)))

(assert (=> b!831812 (= lt!377488 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377199) lt!377194))))

(assert (=> b!831812 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377199) lt!377194))))

(declare-fun b!831813 () Bool)

(declare-fun Unit!28477 () Unit!28446)

(assert (=> b!831813 (= e!463879 Unit!28477)))

(declare-fun b!831814 () Bool)

(assert (=> b!831814 (= e!463880 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377199) lt!377194)))))

(assert (= (and d!105989 c!90343) b!831812))

(assert (= (and d!105989 (not c!90343)) b!831813))

(assert (= (and d!105989 (not res!566082)) b!831814))

(declare-fun m!775699 () Bool)

(assert (=> d!105989 m!775699))

(declare-fun m!775701 () Bool)

(assert (=> b!831812 m!775701))

(assert (=> b!831812 m!775055))

(assert (=> b!831812 m!775055))

(declare-fun m!775703 () Bool)

(assert (=> b!831812 m!775703))

(assert (=> b!831814 m!775055))

(assert (=> b!831814 m!775055))

(assert (=> b!831814 m!775703))

(assert (=> d!105741 d!105989))

(declare-fun d!105991 () Bool)

(assert (=> d!105991 (= (apply!372 (+!1988 lt!377199 (tuple2!10077 lt!377195 minValue!754)) lt!377194) (apply!372 lt!377199 lt!377194))))

(assert (=> d!105991 true))

(declare-fun _$34!1142 () Unit!28446)

(assert (=> d!105991 (= (choose!1424 lt!377199 lt!377195 minValue!754 lt!377194) _$34!1142)))

(declare-fun bs!23231 () Bool)

(assert (= bs!23231 d!105991))

(assert (=> bs!23231 m!774777))

(assert (=> bs!23231 m!774777))

(assert (=> bs!23231 m!774779))

(assert (=> bs!23231 m!774771))

(assert (=> d!105741 d!105991))

(assert (=> d!105741 d!105745))

(assert (=> d!105741 d!105747))

(assert (=> d!105741 d!105749))

(declare-fun d!105993 () Bool)

(declare-fun res!566083 () Bool)

(declare-fun e!463881 () Bool)

(assert (=> d!105993 (=> res!566083 e!463881)))

(assert (=> d!105993 (= res!566083 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (= (_1!5049 (h!16977 (toList!4466 lt!377087))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105993 (= (containsKey!401 (toList!4466 lt!377087) #b1000000000000000000000000000000000000000000000000000000000000000) e!463881)))

(declare-fun b!831816 () Bool)

(declare-fun e!463882 () Bool)

(assert (=> b!831816 (= e!463881 e!463882)))

(declare-fun res!566084 () Bool)

(assert (=> b!831816 (=> (not res!566084) (not e!463882))))

(assert (=> b!831816 (= res!566084 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377087))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377087))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377087)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377087))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831817 () Bool)

(assert (=> b!831817 (= e!463882 (containsKey!401 (t!22203 (toList!4466 lt!377087)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!105993 (not res!566083)) b!831816))

(assert (= (and b!831816 res!566084) b!831817))

(declare-fun m!775705 () Bool)

(assert (=> b!831817 m!775705))

(assert (=> d!105903 d!105993))

(declare-fun d!105995 () Bool)

(declare-fun e!463884 () Bool)

(assert (=> d!105995 e!463884))

(declare-fun res!566085 () Bool)

(assert (=> d!105995 (=> res!566085 e!463884)))

(declare-fun lt!377491 () Bool)

(assert (=> d!105995 (= res!566085 (not lt!377491))))

(declare-fun lt!377490 () Bool)

(assert (=> d!105995 (= lt!377491 lt!377490)))

(declare-fun lt!377489 () Unit!28446)

(declare-fun e!463883 () Unit!28446)

(assert (=> d!105995 (= lt!377489 e!463883)))

(declare-fun c!90344 () Bool)

(assert (=> d!105995 (= c!90344 lt!377490)))

(assert (=> d!105995 (= lt!377490 (containsKey!401 (toList!4466 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256))) lt!377254))))

(assert (=> d!105995 (= (contains!4187 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256)) lt!377254) lt!377491)))

(declare-fun b!831818 () Bool)

(declare-fun lt!377492 () Unit!28446)

(assert (=> b!831818 (= e!463883 lt!377492)))

(assert (=> b!831818 (= lt!377492 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256))) lt!377254))))

(assert (=> b!831818 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256))) lt!377254))))

(declare-fun b!831819 () Bool)

(declare-fun Unit!28478 () Unit!28446)

(assert (=> b!831819 (= e!463883 Unit!28478)))

(declare-fun b!831820 () Bool)

(assert (=> b!831820 (= e!463884 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256))) lt!377254)))))

(assert (= (and d!105995 c!90344) b!831818))

(assert (= (and d!105995 (not c!90344)) b!831819))

(assert (= (and d!105995 (not res!566085)) b!831820))

(declare-fun m!775707 () Bool)

(assert (=> d!105995 m!775707))

(declare-fun m!775709 () Bool)

(assert (=> b!831818 m!775709))

(declare-fun m!775711 () Bool)

(assert (=> b!831818 m!775711))

(assert (=> b!831818 m!775711))

(declare-fun m!775713 () Bool)

(assert (=> b!831818 m!775713))

(assert (=> b!831820 m!775711))

(assert (=> b!831820 m!775711))

(assert (=> b!831820 m!775713))

(assert (=> b!831376 d!105995))

(declare-fun d!105997 () Bool)

(assert (=> d!105997 (not (contains!4187 (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256)) lt!377254))))

(declare-fun lt!377493 () Unit!28446)

(assert (=> d!105997 (= lt!377493 (choose!1426 lt!377255 lt!377251 lt!377256 lt!377254))))

(declare-fun e!463885 () Bool)

(assert (=> d!105997 e!463885))

(declare-fun res!566086 () Bool)

(assert (=> d!105997 (=> (not res!566086) (not e!463885))))

(assert (=> d!105997 (= res!566086 (not (contains!4187 lt!377255 lt!377254)))))

(assert (=> d!105997 (= (addStillNotContains!199 lt!377255 lt!377251 lt!377256 lt!377254) lt!377493)))

(declare-fun b!831821 () Bool)

(assert (=> b!831821 (= e!463885 (not (= lt!377251 lt!377254)))))

(assert (= (and d!105997 res!566086) b!831821))

(assert (=> d!105997 m!774903))

(assert (=> d!105997 m!774903))

(assert (=> d!105997 m!774905))

(declare-fun m!775715 () Bool)

(assert (=> d!105997 m!775715))

(declare-fun m!775717 () Bool)

(assert (=> d!105997 m!775717))

(assert (=> b!831376 d!105997))

(declare-fun d!105999 () Bool)

(declare-fun c!90345 () Bool)

(assert (=> d!105999 (= c!90345 ((_ is ValueCellFull!7187) (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463886 () V!25275)

(assert (=> d!105999 (= (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) e!463886)))

(declare-fun b!831822 () Bool)

(assert (=> b!831822 (= e!463886 (get!11822 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831823 () Bool)

(assert (=> b!831823 (= e!463886 (get!11823 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!105999 c!90345) b!831822))

(assert (= (and d!105999 (not c!90345)) b!831823))

(assert (=> b!831822 m!774879))

(assert (=> b!831822 m!774637))

(declare-fun m!775719 () Bool)

(assert (=> b!831822 m!775719))

(assert (=> b!831823 m!774879))

(assert (=> b!831823 m!774637))

(declare-fun m!775721 () Bool)

(assert (=> b!831823 m!775721))

(assert (=> b!831376 d!105999))

(declare-fun d!106001 () Bool)

(declare-fun e!463887 () Bool)

(assert (=> d!106001 e!463887))

(declare-fun res!566087 () Bool)

(assert (=> d!106001 (=> (not res!566087) (not e!463887))))

(declare-fun lt!377495 () ListLongMap!8901)

(assert (=> d!106001 (= res!566087 (contains!4187 lt!377495 (_1!5049 (tuple2!10077 lt!377251 lt!377256))))))

(declare-fun lt!377497 () List!15846)

(assert (=> d!106001 (= lt!377495 (ListLongMap!8902 lt!377497))))

(declare-fun lt!377496 () Unit!28446)

(declare-fun lt!377494 () Unit!28446)

(assert (=> d!106001 (= lt!377496 lt!377494)))

(assert (=> d!106001 (= (getValueByKey!416 lt!377497 (_1!5049 (tuple2!10077 lt!377251 lt!377256))) (Some!421 (_2!5049 (tuple2!10077 lt!377251 lt!377256))))))

(assert (=> d!106001 (= lt!377494 (lemmaContainsTupThenGetReturnValue!230 lt!377497 (_1!5049 (tuple2!10077 lt!377251 lt!377256)) (_2!5049 (tuple2!10077 lt!377251 lt!377256))))))

(assert (=> d!106001 (= lt!377497 (insertStrictlySorted!269 (toList!4466 lt!377255) (_1!5049 (tuple2!10077 lt!377251 lt!377256)) (_2!5049 (tuple2!10077 lt!377251 lt!377256))))))

(assert (=> d!106001 (= (+!1988 lt!377255 (tuple2!10077 lt!377251 lt!377256)) lt!377495)))

(declare-fun b!831824 () Bool)

(declare-fun res!566088 () Bool)

(assert (=> b!831824 (=> (not res!566088) (not e!463887))))

(assert (=> b!831824 (= res!566088 (= (getValueByKey!416 (toList!4466 lt!377495) (_1!5049 (tuple2!10077 lt!377251 lt!377256))) (Some!421 (_2!5049 (tuple2!10077 lt!377251 lt!377256)))))))

(declare-fun b!831825 () Bool)

(assert (=> b!831825 (= e!463887 (contains!4188 (toList!4466 lt!377495) (tuple2!10077 lt!377251 lt!377256)))))

(assert (= (and d!106001 res!566087) b!831824))

(assert (= (and b!831824 res!566088) b!831825))

(declare-fun m!775723 () Bool)

(assert (=> d!106001 m!775723))

(declare-fun m!775725 () Bool)

(assert (=> d!106001 m!775725))

(declare-fun m!775727 () Bool)

(assert (=> d!106001 m!775727))

(declare-fun m!775729 () Bool)

(assert (=> d!106001 m!775729))

(declare-fun m!775731 () Bool)

(assert (=> b!831824 m!775731))

(declare-fun m!775733 () Bool)

(assert (=> b!831825 m!775733))

(assert (=> b!831376 d!106001))

(declare-fun d!106003 () Bool)

(declare-fun e!463888 () Bool)

(assert (=> d!106003 e!463888))

(declare-fun res!566089 () Bool)

(assert (=> d!106003 (=> (not res!566089) (not e!463888))))

(declare-fun lt!377499 () ListLongMap!8901)

(assert (=> d!106003 (= res!566089 (contains!4187 lt!377499 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377501 () List!15846)

(assert (=> d!106003 (= lt!377499 (ListLongMap!8902 lt!377501))))

(declare-fun lt!377500 () Unit!28446)

(declare-fun lt!377498 () Unit!28446)

(assert (=> d!106003 (= lt!377500 lt!377498)))

(assert (=> d!106003 (= (getValueByKey!416 lt!377501 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106003 (= lt!377498 (lemmaContainsTupThenGetReturnValue!230 lt!377501 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106003 (= lt!377501 (insertStrictlySorted!269 (toList!4466 call!36307) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106003 (= (+!1988 call!36307 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377499)))

(declare-fun b!831826 () Bool)

(declare-fun res!566090 () Bool)

(assert (=> b!831826 (=> (not res!566090) (not e!463888))))

(assert (=> b!831826 (= res!566090 (= (getValueByKey!416 (toList!4466 lt!377499) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!831827 () Bool)

(assert (=> b!831827 (= e!463888 (contains!4188 (toList!4466 lt!377499) (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106003 res!566089) b!831826))

(assert (= (and b!831826 res!566090) b!831827))

(declare-fun m!775735 () Bool)

(assert (=> d!106003 m!775735))

(declare-fun m!775737 () Bool)

(assert (=> d!106003 m!775737))

(declare-fun m!775739 () Bool)

(assert (=> d!106003 m!775739))

(declare-fun m!775741 () Bool)

(assert (=> d!106003 m!775741))

(declare-fun m!775743 () Bool)

(assert (=> b!831826 m!775743))

(declare-fun m!775745 () Bool)

(assert (=> b!831827 m!775745))

(assert (=> b!831376 d!106003))

(declare-fun d!106005 () Bool)

(assert (=> d!106005 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377502 () Unit!28446)

(assert (=> d!106005 (= lt!377502 (choose!1427 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463889 () Bool)

(assert (=> d!106005 e!463889))

(declare-fun res!566091 () Bool)

(assert (=> d!106005 (=> (not res!566091) (not e!463889))))

(assert (=> d!106005 (= res!566091 (isStrictlySorted!429 (toList!4466 lt!377094)))))

(assert (=> d!106005 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377502)))

(declare-fun b!831828 () Bool)

(assert (=> b!831828 (= e!463889 (containsKey!401 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106005 res!566091) b!831828))

(assert (=> d!106005 m!775555))

(assert (=> d!106005 m!775555))

(assert (=> d!106005 m!775557))

(declare-fun m!775747 () Bool)

(assert (=> d!106005 m!775747))

(declare-fun m!775749 () Bool)

(assert (=> d!106005 m!775749))

(assert (=> b!831828 m!775551))

(assert (=> b!831665 d!106005))

(declare-fun d!106007 () Bool)

(assert (=> d!106007 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23232 () Bool)

(assert (= bs!23232 d!106007))

(assert (=> bs!23232 m!775555))

(declare-fun m!775751 () Bool)

(assert (=> bs!23232 m!775751))

(assert (=> b!831665 d!106007))

(declare-fun b!831830 () Bool)

(declare-fun e!463890 () Option!422)

(declare-fun e!463891 () Option!422)

(assert (=> b!831830 (= e!463890 e!463891)))

(declare-fun c!90347 () Bool)

(assert (=> b!831830 (= c!90347 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377094))) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831831 () Bool)

(assert (=> b!831831 (= e!463891 (getValueByKey!416 (t!22203 (toList!4466 lt!377094)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!106009 () Bool)

(declare-fun c!90346 () Bool)

(assert (=> d!106009 (= c!90346 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (= (_1!5049 (h!16977 (toList!4466 lt!377094))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106009 (= (getValueByKey!416 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000) e!463890)))

(declare-fun b!831829 () Bool)

(assert (=> b!831829 (= e!463890 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377094)))))))

(declare-fun b!831832 () Bool)

(assert (=> b!831832 (= e!463891 None!420)))

(assert (= (and d!106009 c!90346) b!831829))

(assert (= (and d!106009 (not c!90346)) b!831830))

(assert (= (and b!831830 c!90347) b!831831))

(assert (= (and b!831830 (not c!90347)) b!831832))

(declare-fun m!775753 () Bool)

(assert (=> b!831831 m!775753))

(assert (=> b!831665 d!106009))

(declare-fun d!106011 () Bool)

(assert (=> d!106011 (= (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754))) lt!377171)) (v!10095 (getValueByKey!416 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754))) lt!377171)))))

(assert (=> d!105811 d!106011))

(declare-fun b!831834 () Bool)

(declare-fun e!463892 () Option!422)

(declare-fun e!463893 () Option!422)

(assert (=> b!831834 (= e!463892 e!463893)))

(declare-fun c!90349 () Bool)

(assert (=> b!831834 (= c!90349 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754))))) lt!377171))))))

(declare-fun b!831835 () Bool)

(assert (=> b!831835 (= e!463893 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)))) lt!377171))))

(declare-fun c!90348 () Bool)

(declare-fun d!106013 () Bool)

(assert (=> d!106013 (= c!90348 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754))))) lt!377171)))))

(assert (=> d!106013 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754))) lt!377171) e!463892)))

(declare-fun b!831833 () Bool)

(assert (=> b!831833 (= e!463892 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)))))))))

(declare-fun b!831836 () Bool)

(assert (=> b!831836 (= e!463893 None!420)))

(assert (= (and d!106013 c!90348) b!831833))

(assert (= (and d!106013 (not c!90348)) b!831834))

(assert (= (and b!831834 c!90349) b!831835))

(assert (= (and b!831834 (not c!90349)) b!831836))

(declare-fun m!775755 () Bool)

(assert (=> b!831835 m!775755))

(assert (=> d!105811 d!106013))

(assert (=> b!831357 d!105953))

(declare-fun d!106015 () Bool)

(assert (=> d!106015 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010)))))

(declare-fun lt!377503 () Unit!28446)

(assert (=> d!106015 (= lt!377503 (choose!1427 (toList!4466 lt!377108) (_1!5049 lt!377010)))))

(declare-fun e!463894 () Bool)

(assert (=> d!106015 e!463894))

(declare-fun res!566092 () Bool)

(assert (=> d!106015 (=> (not res!566092) (not e!463894))))

(assert (=> d!106015 (= res!566092 (isStrictlySorted!429 (toList!4466 lt!377108)))))

(assert (=> d!106015 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377108) (_1!5049 lt!377010)) lt!377503)))

(declare-fun b!831837 () Bool)

(assert (=> b!831837 (= e!463894 (containsKey!401 (toList!4466 lt!377108) (_1!5049 lt!377010)))))

(assert (= (and d!106015 res!566092) b!831837))

(assert (=> d!106015 m!774683))

(assert (=> d!106015 m!774683))

(assert (=> d!106015 m!774947))

(declare-fun m!775757 () Bool)

(assert (=> d!106015 m!775757))

(declare-fun m!775759 () Bool)

(assert (=> d!106015 m!775759))

(assert (=> b!831837 m!774943))

(assert (=> b!831397 d!106015))

(declare-fun d!106017 () Bool)

(assert (=> d!106017 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377108) (_1!5049 lt!377010)))))))

(declare-fun bs!23233 () Bool)

(assert (= bs!23233 d!106017))

(assert (=> bs!23233 m!774683))

(declare-fun m!775761 () Bool)

(assert (=> bs!23233 m!775761))

(assert (=> b!831397 d!106017))

(assert (=> b!831397 d!105905))

(declare-fun d!106019 () Bool)

(assert (=> d!106019 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105821 d!106019))

(declare-fun b!831839 () Bool)

(declare-fun e!463895 () Option!422)

(declare-fun e!463896 () Option!422)

(assert (=> b!831839 (= e!463895 e!463896)))

(declare-fun c!90351 () Bool)

(assert (=> b!831839 (= c!90351 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377094))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!831840 () Bool)

(assert (=> b!831840 (= e!463896 (getValueByKey!416 (t!22203 (toList!4466 lt!377094)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!106021 () Bool)

(declare-fun c!90350 () Bool)

(assert (=> d!106021 (= c!90350 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (= (_1!5049 (h!16977 (toList!4466 lt!377094))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106021 (= (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!463895)))

(declare-fun b!831838 () Bool)

(assert (=> b!831838 (= e!463895 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377094)))))))

(declare-fun b!831841 () Bool)

(assert (=> b!831841 (= e!463896 None!420)))

(assert (= (and d!106021 c!90350) b!831838))

(assert (= (and d!106021 (not c!90350)) b!831839))

(assert (= (and b!831839 c!90351) b!831840))

(assert (= (and b!831839 (not c!90351)) b!831841))

(assert (=> b!831840 m!774611))

(declare-fun m!775763 () Bool)

(assert (=> b!831840 m!775763))

(assert (=> d!105821 d!106021))

(declare-fun d!106023 () Bool)

(assert (=> d!106023 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377170) lt!377166)) (v!10095 (getValueByKey!416 (toList!4466 lt!377170) lt!377166)))))

(assert (=> d!105791 d!106023))

(declare-fun b!831843 () Bool)

(declare-fun e!463897 () Option!422)

(declare-fun e!463898 () Option!422)

(assert (=> b!831843 (= e!463897 e!463898)))

(declare-fun c!90353 () Bool)

(assert (=> b!831843 (= c!90353 (and ((_ is Cons!15842) (toList!4466 lt!377170)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377170))) lt!377166))))))

(declare-fun b!831844 () Bool)

(assert (=> b!831844 (= e!463898 (getValueByKey!416 (t!22203 (toList!4466 lt!377170)) lt!377166))))

(declare-fun d!106025 () Bool)

(declare-fun c!90352 () Bool)

(assert (=> d!106025 (= c!90352 (and ((_ is Cons!15842) (toList!4466 lt!377170)) (= (_1!5049 (h!16977 (toList!4466 lt!377170))) lt!377166)))))

(assert (=> d!106025 (= (getValueByKey!416 (toList!4466 lt!377170) lt!377166) e!463897)))

(declare-fun b!831842 () Bool)

(assert (=> b!831842 (= e!463897 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377170)))))))

(declare-fun b!831845 () Bool)

(assert (=> b!831845 (= e!463898 None!420)))

(assert (= (and d!106025 c!90352) b!831842))

(assert (= (and d!106025 (not c!90352)) b!831843))

(assert (= (and b!831843 c!90353) b!831844))

(assert (= (and b!831843 (not c!90353)) b!831845))

(declare-fun m!775765 () Bool)

(assert (=> b!831844 m!775765))

(assert (=> d!105791 d!106025))

(declare-fun d!106027 () Bool)

(declare-fun res!566093 () Bool)

(declare-fun e!463899 () Bool)

(assert (=> d!106027 (=> res!566093 e!463899)))

(assert (=> d!106027 (= res!566093 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (= (_1!5049 (h!16977 (toList!4466 lt!377094))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106027 (= (containsKey!401 (toList!4466 lt!377094) #b1000000000000000000000000000000000000000000000000000000000000000) e!463899)))

(declare-fun b!831846 () Bool)

(declare-fun e!463900 () Bool)

(assert (=> b!831846 (= e!463899 e!463900)))

(declare-fun res!566094 () Bool)

(assert (=> b!831846 (=> (not res!566094) (not e!463900))))

(assert (=> b!831846 (= res!566094 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377094))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377094))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377094)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377094))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831847 () Bool)

(assert (=> b!831847 (= e!463900 (containsKey!401 (t!22203 (toList!4466 lt!377094)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106027 (not res!566093)) b!831846))

(assert (= (and b!831846 res!566094) b!831847))

(declare-fun m!775767 () Bool)

(assert (=> b!831847 m!775767))

(assert (=> d!105907 d!106027))

(declare-fun d!106029 () Bool)

(declare-fun lt!377504 () Bool)

(assert (=> d!106029 (= lt!377504 (select (content!386 lt!377218) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!463902 () Bool)

(assert (=> d!106029 (= lt!377504 e!463902)))

(declare-fun res!566095 () Bool)

(assert (=> d!106029 (=> (not res!566095) (not e!463902))))

(assert (=> d!106029 (= res!566095 ((_ is Cons!15842) lt!377218))))

(assert (=> d!106029 (= (contains!4188 lt!377218 (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377504)))

(declare-fun b!831848 () Bool)

(declare-fun e!463901 () Bool)

(assert (=> b!831848 (= e!463902 e!463901)))

(declare-fun res!566096 () Bool)

(assert (=> b!831848 (=> res!566096 e!463901)))

(assert (=> b!831848 (= res!566096 (= (h!16977 lt!377218) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831849 () Bool)

(assert (=> b!831849 (= e!463901 (contains!4188 (t!22203 lt!377218) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106029 res!566095) b!831848))

(assert (= (and b!831848 (not res!566096)) b!831849))

(declare-fun m!775769 () Bool)

(assert (=> d!106029 m!775769))

(declare-fun m!775771 () Bool)

(assert (=> d!106029 m!775771))

(declare-fun m!775773 () Bool)

(assert (=> b!831849 m!775773))

(assert (=> b!831531 d!106029))

(declare-fun b!831851 () Bool)

(declare-fun e!463903 () Option!422)

(declare-fun e!463904 () Option!422)

(assert (=> b!831851 (= e!463903 e!463904)))

(declare-fun c!90355 () Bool)

(assert (=> b!831851 (= c!90355 (and ((_ is Cons!15842) (toList!4466 lt!377412)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377412))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!831852 () Bool)

(assert (=> b!831852 (= e!463904 (getValueByKey!416 (t!22203 (toList!4466 lt!377412)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun c!90354 () Bool)

(declare-fun d!106031 () Bool)

(assert (=> d!106031 (= c!90354 (and ((_ is Cons!15842) (toList!4466 lt!377412)) (= (_1!5049 (h!16977 (toList!4466 lt!377412))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106031 (= (getValueByKey!416 (toList!4466 lt!377412) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!463903)))

(declare-fun b!831850 () Bool)

(assert (=> b!831850 (= e!463903 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377412)))))))

(declare-fun b!831853 () Bool)

(assert (=> b!831853 (= e!463904 None!420)))

(assert (= (and d!106031 c!90354) b!831850))

(assert (= (and d!106031 (not c!90354)) b!831851))

(assert (= (and b!831851 c!90355) b!831852))

(assert (= (and b!831851 (not c!90355)) b!831853))

(declare-fun m!775775 () Bool)

(assert (=> b!831852 m!775775))

(assert (=> b!831589 d!106031))

(declare-fun d!106033 () Bool)

(declare-fun res!566097 () Bool)

(declare-fun e!463905 () Bool)

(assert (=> d!106033 (=> res!566097 e!463905)))

(assert (=> d!106033 (= res!566097 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))))) lt!377176)))))

(assert (=> d!106033 (= (containsKey!401 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377176) e!463905)))

(declare-fun b!831854 () Bool)

(declare-fun e!463906 () Bool)

(assert (=> b!831854 (= e!463905 e!463906)))

(declare-fun res!566098 () Bool)

(assert (=> b!831854 (=> (not res!566098) (not e!463906))))

(assert (=> b!831854 (= res!566098 (and (or (not ((_ is Cons!15842) (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))))) (bvsle (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))))) lt!377176)) ((_ is Cons!15842) (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34))))) lt!377176)))))

(declare-fun b!831855 () Bool)

(assert (=> b!831855 (= e!463906 (containsKey!401 (t!22203 (toList!4466 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)))) lt!377176))))

(assert (= (and d!106033 (not res!566097)) b!831854))

(assert (= (and b!831854 res!566098) b!831855))

(declare-fun m!775777 () Bool)

(assert (=> b!831855 m!775777))

(assert (=> d!105801 d!106033))

(declare-fun d!106035 () Bool)

(assert (=> d!106035 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377505 () Unit!28446)

(assert (=> d!106035 (= lt!377505 (choose!1427 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!463907 () Bool)

(assert (=> d!106035 e!463907))

(declare-fun res!566099 () Bool)

(assert (=> d!106035 (=> (not res!566099) (not e!463907))))

(assert (=> d!106035 (= res!566099 (isStrictlySorted!429 (toList!4466 lt!377202)))))

(assert (=> d!106035 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377505)))

(declare-fun b!831856 () Bool)

(assert (=> b!831856 (= e!463907 (containsKey!401 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106035 res!566099) b!831856))

(assert (=> d!106035 m!774611))

(assert (=> d!106035 m!775105))

(assert (=> d!106035 m!775105))

(assert (=> d!106035 m!775107))

(assert (=> d!106035 m!774611))

(declare-fun m!775779 () Bool)

(assert (=> d!106035 m!775779))

(declare-fun m!775781 () Bool)

(assert (=> d!106035 m!775781))

(assert (=> b!831856 m!774611))

(assert (=> b!831856 m!775101))

(assert (=> b!831467 d!106035))

(declare-fun d!106037 () Bool)

(assert (=> d!106037 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23234 () Bool)

(assert (= bs!23234 d!106037))

(assert (=> bs!23234 m!775105))

(declare-fun m!775783 () Bool)

(assert (=> bs!23234 m!775783))

(assert (=> b!831467 d!106037))

(declare-fun b!831858 () Bool)

(declare-fun e!463908 () Option!422)

(declare-fun e!463909 () Option!422)

(assert (=> b!831858 (= e!463908 e!463909)))

(declare-fun c!90357 () Bool)

(assert (=> b!831858 (= c!90357 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377202))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!831859 () Bool)

(assert (=> b!831859 (= e!463909 (getValueByKey!416 (t!22203 (toList!4466 lt!377202)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!106039 () Bool)

(declare-fun c!90356 () Bool)

(assert (=> d!106039 (= c!90356 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (= (_1!5049 (h!16977 (toList!4466 lt!377202))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106039 (= (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!463908)))

(declare-fun b!831857 () Bool)

(assert (=> b!831857 (= e!463908 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377202)))))))

(declare-fun b!831860 () Bool)

(assert (=> b!831860 (= e!463909 None!420)))

(assert (= (and d!106039 c!90356) b!831857))

(assert (= (and d!106039 (not c!90356)) b!831858))

(assert (= (and b!831858 c!90357) b!831859))

(assert (= (and b!831858 (not c!90357)) b!831860))

(assert (=> b!831859 m!774611))

(declare-fun m!775785 () Bool)

(assert (=> b!831859 m!775785))

(assert (=> b!831467 d!106039))

(declare-fun d!106041 () Bool)

(declare-fun res!566100 () Bool)

(declare-fun e!463910 () Bool)

(assert (=> d!106041 (=> res!566100 e!463910)))

(assert (=> d!106041 (= res!566100 (and ((_ is Cons!15842) (toList!4466 lt!377108)) (= (_1!5049 (h!16977 (toList!4466 lt!377108))) (_1!5049 lt!377010))))))

(assert (=> d!106041 (= (containsKey!401 (toList!4466 lt!377108) (_1!5049 lt!377010)) e!463910)))

(declare-fun b!831861 () Bool)

(declare-fun e!463911 () Bool)

(assert (=> b!831861 (= e!463910 e!463911)))

(declare-fun res!566101 () Bool)

(assert (=> b!831861 (=> (not res!566101) (not e!463911))))

(assert (=> b!831861 (= res!566101 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377108))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377108))) (_1!5049 lt!377010))) ((_ is Cons!15842) (toList!4466 lt!377108)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377108))) (_1!5049 lt!377010))))))

(declare-fun b!831862 () Bool)

(assert (=> b!831862 (= e!463911 (containsKey!401 (t!22203 (toList!4466 lt!377108)) (_1!5049 lt!377010)))))

(assert (= (and d!106041 (not res!566100)) b!831861))

(assert (= (and b!831861 res!566101) b!831862))

(declare-fun m!775787 () Bool)

(assert (=> b!831862 m!775787))

(assert (=> d!105713 d!106041))

(declare-fun d!106043 () Bool)

(declare-fun res!566102 () Bool)

(declare-fun e!463912 () Bool)

(assert (=> d!106043 (=> res!566102 e!463912)))

(assert (=> d!106043 (= res!566102 (or ((_ is Nil!15843) lt!377324) ((_ is Nil!15843) (t!22203 lt!377324))))))

(assert (=> d!106043 (= (isStrictlySorted!429 lt!377324) e!463912)))

(declare-fun b!831863 () Bool)

(declare-fun e!463913 () Bool)

(assert (=> b!831863 (= e!463912 e!463913)))

(declare-fun res!566103 () Bool)

(assert (=> b!831863 (=> (not res!566103) (not e!463913))))

(assert (=> b!831863 (= res!566103 (bvslt (_1!5049 (h!16977 lt!377324)) (_1!5049 (h!16977 (t!22203 lt!377324)))))))

(declare-fun b!831864 () Bool)

(assert (=> b!831864 (= e!463913 (isStrictlySorted!429 (t!22203 lt!377324)))))

(assert (= (and d!106043 (not res!566102)) b!831863))

(assert (= (and b!831863 res!566103) b!831864))

(declare-fun m!775789 () Bool)

(assert (=> b!831864 m!775789))

(assert (=> d!105771 d!106043))

(declare-fun d!106045 () Bool)

(declare-fun res!566104 () Bool)

(declare-fun e!463914 () Bool)

(assert (=> d!106045 (=> res!566104 e!463914)))

(assert (=> d!106045 (= res!566104 (or ((_ is Nil!15843) (toList!4466 lt!377014)) ((_ is Nil!15843) (t!22203 (toList!4466 lt!377014)))))))

(assert (=> d!106045 (= (isStrictlySorted!429 (toList!4466 lt!377014)) e!463914)))

(declare-fun b!831865 () Bool)

(declare-fun e!463915 () Bool)

(assert (=> b!831865 (= e!463914 e!463915)))

(declare-fun res!566105 () Bool)

(assert (=> b!831865 (=> (not res!566105) (not e!463915))))

(assert (=> b!831865 (= res!566105 (bvslt (_1!5049 (h!16977 (toList!4466 lt!377014))) (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014))))))))

(declare-fun b!831866 () Bool)

(assert (=> b!831866 (= e!463915 (isStrictlySorted!429 (t!22203 (toList!4466 lt!377014))))))

(assert (= (and d!106045 (not res!566104)) b!831865))

(assert (= (and b!831865 res!566105) b!831866))

(declare-fun m!775791 () Bool)

(assert (=> b!831866 m!775791))

(assert (=> d!105771 d!106045))

(assert (=> b!831349 d!105953))

(declare-fun d!106047 () Bool)

(assert (=> d!106047 (= (isEmpty!661 (toList!4466 lt!377087)) ((_ is Nil!15843) (toList!4466 lt!377087)))))

(assert (=> d!105865 d!106047))

(declare-fun d!106049 () Bool)

(declare-fun lt!377506 () Bool)

(assert (=> d!106049 (= lt!377506 (select (content!387 (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!463916 () Bool)

(assert (=> d!106049 (= lt!377506 e!463916)))

(declare-fun res!566107 () Bool)

(assert (=> d!106049 (=> (not res!566107) (not e!463916))))

(assert (=> d!106049 (= res!566107 ((_ is Cons!15843) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)))))

(assert (=> d!106049 (= (contains!4186 (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377506)))

(declare-fun b!831867 () Bool)

(declare-fun e!463917 () Bool)

(assert (=> b!831867 (= e!463916 e!463917)))

(declare-fun res!566106 () Bool)

(assert (=> b!831867 (=> res!566106 e!463917)))

(assert (=> b!831867 (= res!566106 (= (h!16978 (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831868 () Bool)

(assert (=> b!831868 (= e!463917 (contains!4186 (t!22204 (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!106049 res!566107) b!831867))

(assert (= (and b!831867 (not res!566106)) b!831868))

(declare-fun m!775793 () Bool)

(assert (=> d!106049 m!775793))

(assert (=> d!106049 m!774867))

(declare-fun m!775795 () Bool)

(assert (=> d!106049 m!775795))

(assert (=> b!831868 m!774867))

(declare-fun m!775797 () Bool)

(assert (=> b!831868 m!775797))

(assert (=> b!831651 d!106049))

(declare-fun d!106051 () Bool)

(assert (=> d!106051 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23235 () Bool)

(assert (= bs!23235 d!106051))

(assert (=> bs!23235 m!775185))

(declare-fun m!775799 () Bool)

(assert (=> bs!23235 m!775799))

(assert (=> b!831508 d!106051))

(assert (=> b!831508 d!106021))

(declare-fun bm!36335 () Bool)

(declare-fun call!36338 () List!15846)

(declare-fun call!36339 () List!15846)

(assert (=> bm!36335 (= call!36338 call!36339)))

(declare-fun bm!36336 () Bool)

(declare-fun call!36340 () List!15846)

(assert (=> bm!36336 (= call!36339 call!36340)))

(declare-fun d!106053 () Bool)

(declare-fun e!463920 () Bool)

(assert (=> d!106053 e!463920))

(declare-fun res!566109 () Bool)

(assert (=> d!106053 (=> (not res!566109) (not e!463920))))

(declare-fun lt!377507 () List!15846)

(assert (=> d!106053 (= res!566109 (isStrictlySorted!429 lt!377507))))

(declare-fun e!463921 () List!15846)

(assert (=> d!106053 (= lt!377507 e!463921)))

(declare-fun c!90359 () Bool)

(assert (=> d!106053 (= c!90359 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (bvslt (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))))) (_1!5049 lt!377010))))))

(assert (=> d!106053 (isStrictlySorted!429 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))))))

(assert (=> d!106053 (= (insertStrictlySorted!269 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))) (_1!5049 lt!377010) (_2!5049 lt!377010)) lt!377507)))

(declare-fun c!90360 () Bool)

(declare-fun b!831869 () Bool)

(declare-fun c!90361 () Bool)

(declare-fun e!463922 () List!15846)

(assert (=> b!831869 (= e!463922 (ite c!90361 (t!22203 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (ite c!90360 (Cons!15842 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (t!22203 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))))) Nil!15843)))))

(declare-fun b!831870 () Bool)

(declare-fun e!463919 () List!15846)

(assert (=> b!831870 (= e!463919 call!36338)))

(declare-fun b!831871 () Bool)

(assert (=> b!831871 (= e!463919 call!36338)))

(declare-fun b!831872 () Bool)

(declare-fun e!463918 () List!15846)

(assert (=> b!831872 (= e!463918 call!36339)))

(declare-fun bm!36337 () Bool)

(assert (=> bm!36337 (= call!36340 ($colon$colon!533 e!463922 (ite c!90359 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010)))))))

(declare-fun c!90358 () Bool)

(assert (=> bm!36337 (= c!90358 c!90359)))

(declare-fun b!831873 () Bool)

(assert (=> b!831873 (= e!463922 (insertStrictlySorted!269 (t!22203 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun b!831874 () Bool)

(declare-fun res!566108 () Bool)

(assert (=> b!831874 (=> (not res!566108) (not e!463920))))

(assert (=> b!831874 (= res!566108 (containsKey!401 lt!377507 (_1!5049 lt!377010)))))

(declare-fun b!831875 () Bool)

(assert (=> b!831875 (= e!463921 e!463918)))

(assert (=> b!831875 (= c!90361 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))))) (_1!5049 lt!377010))))))

(declare-fun b!831876 () Bool)

(assert (=> b!831876 (= e!463920 (contains!4188 lt!377507 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831877 () Bool)

(assert (=> b!831877 (= e!463921 call!36340)))

(declare-fun b!831878 () Bool)

(assert (=> b!831878 (= c!90360 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))) (bvsgt (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))))) (_1!5049 lt!377010))))))

(assert (=> b!831878 (= e!463918 e!463919)))

(assert (= (and d!106053 c!90359) b!831877))

(assert (= (and d!106053 (not c!90359)) b!831875))

(assert (= (and b!831875 c!90361) b!831872))

(assert (= (and b!831875 (not c!90361)) b!831878))

(assert (= (and b!831878 c!90360) b!831870))

(assert (= (and b!831878 (not c!90360)) b!831871))

(assert (= (or b!831870 b!831871) bm!36335))

(assert (= (or b!831872 bm!36335) bm!36336))

(assert (= (or b!831877 bm!36336) bm!36337))

(assert (= (and bm!36337 c!90358) b!831873))

(assert (= (and bm!36337 (not c!90358)) b!831869))

(assert (= (and d!106053 res!566109) b!831874))

(assert (= (and b!831874 res!566108) b!831876))

(declare-fun m!775801 () Bool)

(assert (=> d!106053 m!775801))

(declare-fun m!775803 () Bool)

(assert (=> d!106053 m!775803))

(declare-fun m!775805 () Bool)

(assert (=> bm!36337 m!775805))

(declare-fun m!775807 () Bool)

(assert (=> b!831873 m!775807))

(declare-fun m!775809 () Bool)

(assert (=> b!831874 m!775809))

(declare-fun m!775811 () Bool)

(assert (=> b!831876 m!775811))

(assert (=> b!831617 d!106053))

(assert (=> d!105797 d!105791))

(assert (=> d!105797 d!105813))

(declare-fun d!106055 () Bool)

(assert (=> d!106055 (= (apply!372 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)) lt!377166) (apply!372 lt!377170 lt!377166))))

(assert (=> d!106055 true))

(declare-fun _$34!1143 () Unit!28446)

(assert (=> d!106055 (= (choose!1424 lt!377170 lt!377178 zeroValueBefore!34 lt!377166) _$34!1143)))

(declare-fun bs!23236 () Bool)

(assert (= bs!23236 d!106055))

(assert (=> bs!23236 m!774739))

(assert (=> bs!23236 m!774739))

(assert (=> bs!23236 m!774741))

(assert (=> bs!23236 m!774745))

(assert (=> d!105797 d!106055))

(assert (=> d!105797 d!105803))

(declare-fun d!106057 () Bool)

(declare-fun e!463924 () Bool)

(assert (=> d!106057 e!463924))

(declare-fun res!566110 () Bool)

(assert (=> d!106057 (=> res!566110 e!463924)))

(declare-fun lt!377510 () Bool)

(assert (=> d!106057 (= res!566110 (not lt!377510))))

(declare-fun lt!377509 () Bool)

(assert (=> d!106057 (= lt!377510 lt!377509)))

(declare-fun lt!377508 () Unit!28446)

(declare-fun e!463923 () Unit!28446)

(assert (=> d!106057 (= lt!377508 e!463923)))

(declare-fun c!90362 () Bool)

(assert (=> d!106057 (= c!90362 lt!377509)))

(assert (=> d!106057 (= lt!377509 (containsKey!401 (toList!4466 lt!377170) lt!377166))))

(assert (=> d!106057 (= (contains!4187 lt!377170 lt!377166) lt!377510)))

(declare-fun b!831879 () Bool)

(declare-fun lt!377511 () Unit!28446)

(assert (=> b!831879 (= e!463923 lt!377511)))

(assert (=> b!831879 (= lt!377511 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377170) lt!377166))))

(assert (=> b!831879 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377170) lt!377166))))

(declare-fun b!831880 () Bool)

(declare-fun Unit!28479 () Unit!28446)

(assert (=> b!831880 (= e!463923 Unit!28479)))

(declare-fun b!831881 () Bool)

(assert (=> b!831881 (= e!463924 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377170) lt!377166)))))

(assert (= (and d!106057 c!90362) b!831879))

(assert (= (and d!106057 (not c!90362)) b!831880))

(assert (= (and d!106057 (not res!566110)) b!831881))

(declare-fun m!775813 () Bool)

(assert (=> d!106057 m!775813))

(declare-fun m!775815 () Bool)

(assert (=> b!831879 m!775815))

(assert (=> b!831879 m!775193))

(assert (=> b!831879 m!775193))

(declare-fun m!775817 () Bool)

(assert (=> b!831879 m!775817))

(assert (=> b!831881 m!775193))

(assert (=> b!831881 m!775193))

(assert (=> b!831881 m!775817))

(assert (=> d!105797 d!106057))

(declare-fun d!106059 () Bool)

(assert (=> d!106059 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377199) lt!377194)) (v!10095 (getValueByKey!416 (toList!4466 lt!377199) lt!377194)))))

(assert (=> d!105747 d!106059))

(declare-fun b!831883 () Bool)

(declare-fun e!463925 () Option!422)

(declare-fun e!463926 () Option!422)

(assert (=> b!831883 (= e!463925 e!463926)))

(declare-fun c!90364 () Bool)

(assert (=> b!831883 (= c!90364 (and ((_ is Cons!15842) (toList!4466 lt!377199)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377199))) lt!377194))))))

(declare-fun b!831884 () Bool)

(assert (=> b!831884 (= e!463926 (getValueByKey!416 (t!22203 (toList!4466 lt!377199)) lt!377194))))

(declare-fun d!106061 () Bool)

(declare-fun c!90363 () Bool)

(assert (=> d!106061 (= c!90363 (and ((_ is Cons!15842) (toList!4466 lt!377199)) (= (_1!5049 (h!16977 (toList!4466 lt!377199))) lt!377194)))))

(assert (=> d!106061 (= (getValueByKey!416 (toList!4466 lt!377199) lt!377194) e!463925)))

(declare-fun b!831882 () Bool)

(assert (=> b!831882 (= e!463925 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377199)))))))

(declare-fun b!831885 () Bool)

(assert (=> b!831885 (= e!463926 None!420)))

(assert (= (and d!106061 c!90363) b!831882))

(assert (= (and d!106061 (not c!90363)) b!831883))

(assert (= (and b!831883 c!90364) b!831884))

(assert (= (and b!831883 (not c!90364)) b!831885))

(declare-fun m!775819 () Bool)

(assert (=> b!831884 m!775819))

(assert (=> d!105747 d!106061))

(assert (=> d!105847 d!105845))

(declare-fun d!106063 () Bool)

(assert (=> d!106063 (= (getValueByKey!416 lt!377214 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(assert (=> d!106063 true))

(declare-fun _$22!569 () Unit!28446)

(assert (=> d!106063 (= (choose!1423 lt!377214 (_1!5049 lt!377012) (_2!5049 lt!377012)) _$22!569)))

(declare-fun bs!23237 () Bool)

(assert (= bs!23237 d!106063))

(assert (=> bs!23237 m!774817))

(assert (=> d!105847 d!106063))

(declare-fun d!106065 () Bool)

(declare-fun res!566111 () Bool)

(declare-fun e!463927 () Bool)

(assert (=> d!106065 (=> res!566111 e!463927)))

(assert (=> d!106065 (= res!566111 (or ((_ is Nil!15843) lt!377214) ((_ is Nil!15843) (t!22203 lt!377214))))))

(assert (=> d!106065 (= (isStrictlySorted!429 lt!377214) e!463927)))

(declare-fun b!831886 () Bool)

(declare-fun e!463928 () Bool)

(assert (=> b!831886 (= e!463927 e!463928)))

(declare-fun res!566112 () Bool)

(assert (=> b!831886 (=> (not res!566112) (not e!463928))))

(assert (=> b!831886 (= res!566112 (bvslt (_1!5049 (h!16977 lt!377214)) (_1!5049 (h!16977 (t!22203 lt!377214)))))))

(declare-fun b!831887 () Bool)

(assert (=> b!831887 (= e!463928 (isStrictlySorted!429 (t!22203 lt!377214)))))

(assert (= (and d!106065 (not res!566111)) b!831886))

(assert (= (and b!831886 res!566112) b!831887))

(declare-fun m!775821 () Bool)

(assert (=> b!831887 m!775821))

(assert (=> d!105847 d!106065))

(declare-fun d!106067 () Bool)

(declare-fun lt!377512 () Bool)

(assert (=> d!106067 (= lt!377512 (select (content!386 (toList!4466 lt!377360)) (tuple2!10077 lt!377178 zeroValueBefore!34)))))

(declare-fun e!463930 () Bool)

(assert (=> d!106067 (= lt!377512 e!463930)))

(declare-fun res!566113 () Bool)

(assert (=> d!106067 (=> (not res!566113) (not e!463930))))

(assert (=> d!106067 (= res!566113 ((_ is Cons!15842) (toList!4466 lt!377360)))))

(assert (=> d!106067 (= (contains!4188 (toList!4466 lt!377360) (tuple2!10077 lt!377178 zeroValueBefore!34)) lt!377512)))

(declare-fun b!831888 () Bool)

(declare-fun e!463929 () Bool)

(assert (=> b!831888 (= e!463930 e!463929)))

(declare-fun res!566114 () Bool)

(assert (=> b!831888 (=> res!566114 e!463929)))

(assert (=> b!831888 (= res!566114 (= (h!16977 (toList!4466 lt!377360)) (tuple2!10077 lt!377178 zeroValueBefore!34)))))

(declare-fun b!831889 () Bool)

(assert (=> b!831889 (= e!463929 (contains!4188 (t!22203 (toList!4466 lt!377360)) (tuple2!10077 lt!377178 zeroValueBefore!34)))))

(assert (= (and d!106067 res!566113) b!831888))

(assert (= (and b!831888 (not res!566114)) b!831889))

(declare-fun m!775823 () Bool)

(assert (=> d!106067 m!775823))

(declare-fun m!775825 () Bool)

(assert (=> d!106067 m!775825))

(declare-fun m!775827 () Bool)

(assert (=> b!831889 m!775827))

(assert (=> b!831520 d!106067))

(declare-fun bm!36338 () Bool)

(declare-fun call!36341 () List!15846)

(declare-fun call!36342 () List!15846)

(assert (=> bm!36338 (= call!36341 call!36342)))

(declare-fun bm!36339 () Bool)

(declare-fun call!36343 () List!15846)

(assert (=> bm!36339 (= call!36342 call!36343)))

(declare-fun d!106069 () Bool)

(declare-fun e!463933 () Bool)

(assert (=> d!106069 e!463933))

(declare-fun res!566116 () Bool)

(assert (=> d!106069 (=> (not res!566116) (not e!463933))))

(declare-fun lt!377513 () List!15846)

(assert (=> d!106069 (= res!566116 (isStrictlySorted!429 lt!377513))))

(declare-fun e!463934 () List!15846)

(assert (=> d!106069 (= lt!377513 e!463934)))

(declare-fun c!90366 () Bool)

(assert (=> d!106069 (= c!90366 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377013))) (bvslt (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377013)))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106069 (isStrictlySorted!429 (t!22203 (toList!4466 lt!377013)))))

(assert (=> d!106069 (= (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377013)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377513)))

(declare-fun c!90368 () Bool)

(declare-fun c!90367 () Bool)

(declare-fun e!463935 () List!15846)

(declare-fun b!831890 () Bool)

(assert (=> b!831890 (= e!463935 (ite c!90368 (t!22203 (t!22203 (toList!4466 lt!377013))) (ite c!90367 (Cons!15842 (h!16977 (t!22203 (toList!4466 lt!377013))) (t!22203 (t!22203 (toList!4466 lt!377013)))) Nil!15843)))))

(declare-fun b!831891 () Bool)

(declare-fun e!463932 () List!15846)

(assert (=> b!831891 (= e!463932 call!36341)))

(declare-fun b!831892 () Bool)

(assert (=> b!831892 (= e!463932 call!36341)))

(declare-fun b!831893 () Bool)

(declare-fun e!463931 () List!15846)

(assert (=> b!831893 (= e!463931 call!36342)))

(declare-fun bm!36340 () Bool)

(assert (=> bm!36340 (= call!36343 ($colon$colon!533 e!463935 (ite c!90366 (h!16977 (t!22203 (toList!4466 lt!377013))) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun c!90365 () Bool)

(assert (=> bm!36340 (= c!90365 c!90366)))

(declare-fun b!831894 () Bool)

(assert (=> b!831894 (= e!463935 (insertStrictlySorted!269 (t!22203 (t!22203 (toList!4466 lt!377013))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831895 () Bool)

(declare-fun res!566115 () Bool)

(assert (=> b!831895 (=> (not res!566115) (not e!463933))))

(assert (=> b!831895 (= res!566115 (containsKey!401 lt!377513 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!831896 () Bool)

(assert (=> b!831896 (= e!463934 e!463931)))

(assert (=> b!831896 (= c!90368 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377013))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377013)))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831897 () Bool)

(assert (=> b!831897 (= e!463933 (contains!4188 lt!377513 (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!831898 () Bool)

(assert (=> b!831898 (= e!463934 call!36343)))

(declare-fun b!831899 () Bool)

(assert (=> b!831899 (= c!90367 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377013))) (bvsgt (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377013)))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> b!831899 (= e!463931 e!463932)))

(assert (= (and d!106069 c!90366) b!831898))

(assert (= (and d!106069 (not c!90366)) b!831896))

(assert (= (and b!831896 c!90368) b!831893))

(assert (= (and b!831896 (not c!90368)) b!831899))

(assert (= (and b!831899 c!90367) b!831891))

(assert (= (and b!831899 (not c!90367)) b!831892))

(assert (= (or b!831891 b!831892) bm!36338))

(assert (= (or b!831893 bm!36338) bm!36339))

(assert (= (or b!831898 bm!36339) bm!36340))

(assert (= (and bm!36340 c!90365) b!831894))

(assert (= (and bm!36340 (not c!90365)) b!831890))

(assert (= (and d!106069 res!566116) b!831895))

(assert (= (and b!831895 res!566115) b!831897))

(declare-fun m!775829 () Bool)

(assert (=> d!106069 m!775829))

(declare-fun m!775831 () Bool)

(assert (=> d!106069 m!775831))

(declare-fun m!775833 () Bool)

(assert (=> bm!36340 m!775833))

(declare-fun m!775835 () Bool)

(assert (=> b!831894 m!775835))

(declare-fun m!775837 () Bool)

(assert (=> b!831895 m!775837))

(declare-fun m!775839 () Bool)

(assert (=> b!831897 m!775839))

(assert (=> b!831536 d!106069))

(declare-fun d!106071 () Bool)

(declare-fun lt!377514 () Bool)

(assert (=> d!106071 (= lt!377514 (select (content!386 (t!22203 (toList!4466 lt!377216))) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun e!463937 () Bool)

(assert (=> d!106071 (= lt!377514 e!463937)))

(declare-fun res!566117 () Bool)

(assert (=> d!106071 (=> (not res!566117) (not e!463937))))

(assert (=> d!106071 (= res!566117 ((_ is Cons!15842) (t!22203 (toList!4466 lt!377216))))))

(assert (=> d!106071 (= (contains!4188 (t!22203 (toList!4466 lt!377216)) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!377514)))

(declare-fun b!831900 () Bool)

(declare-fun e!463936 () Bool)

(assert (=> b!831900 (= e!463937 e!463936)))

(declare-fun res!566118 () Bool)

(assert (=> b!831900 (=> res!566118 e!463936)))

(assert (=> b!831900 (= res!566118 (= (h!16977 (t!22203 (toList!4466 lt!377216))) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!831901 () Bool)

(assert (=> b!831901 (= e!463936 (contains!4188 (t!22203 (t!22203 (toList!4466 lt!377216))) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!106071 res!566117) b!831900))

(assert (= (and b!831900 (not res!566118)) b!831901))

(assert (=> d!106071 m!775629))

(declare-fun m!775841 () Bool)

(assert (=> d!106071 m!775841))

(declare-fun m!775843 () Bool)

(assert (=> b!831901 m!775843))

(assert (=> b!831466 d!106071))

(declare-fun d!106073 () Bool)

(declare-fun res!566119 () Bool)

(declare-fun e!463938 () Bool)

(assert (=> d!106073 (=> res!566119 e!463938)))

(assert (=> d!106073 (= res!566119 (and ((_ is Cons!15842) lt!377118) (= (_1!5049 (h!16977 lt!377118)) (_1!5049 lt!377010))))))

(assert (=> d!106073 (= (containsKey!401 lt!377118 (_1!5049 lt!377010)) e!463938)))

(declare-fun b!831902 () Bool)

(declare-fun e!463939 () Bool)

(assert (=> b!831902 (= e!463938 e!463939)))

(declare-fun res!566120 () Bool)

(assert (=> b!831902 (=> (not res!566120) (not e!463939))))

(assert (=> b!831902 (= res!566120 (and (or (not ((_ is Cons!15842) lt!377118)) (bvsle (_1!5049 (h!16977 lt!377118)) (_1!5049 lt!377010))) ((_ is Cons!15842) lt!377118) (bvslt (_1!5049 (h!16977 lt!377118)) (_1!5049 lt!377010))))))

(declare-fun b!831903 () Bool)

(assert (=> b!831903 (= e!463939 (containsKey!401 (t!22203 lt!377118) (_1!5049 lt!377010)))))

(assert (= (and d!106073 (not res!566119)) b!831902))

(assert (= (and b!831902 res!566120) b!831903))

(declare-fun m!775845 () Bool)

(assert (=> b!831903 m!775845))

(assert (=> b!831611 d!106073))

(assert (=> b!831472 d!105953))

(declare-fun d!106075 () Bool)

(declare-fun lt!377515 () Bool)

(assert (=> d!106075 (= lt!377515 (select (content!386 lt!377400) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun e!463941 () Bool)

(assert (=> d!106075 (= lt!377515 e!463941)))

(declare-fun res!566121 () Bool)

(assert (=> d!106075 (=> (not res!566121) (not e!463941))))

(assert (=> d!106075 (= res!566121 ((_ is Cons!15842) lt!377400))))

(assert (=> d!106075 (= (contains!4188 lt!377400 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) lt!377515)))

(declare-fun b!831904 () Bool)

(declare-fun e!463940 () Bool)

(assert (=> b!831904 (= e!463941 e!463940)))

(declare-fun res!566122 () Bool)

(assert (=> b!831904 (=> res!566122 e!463940)))

(assert (=> b!831904 (= res!566122 (= (h!16977 lt!377400) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!831905 () Bool)

(assert (=> b!831905 (= e!463940 (contains!4188 (t!22203 lt!377400) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!106075 res!566121) b!831904))

(assert (= (and b!831904 (not res!566122)) b!831905))

(declare-fun m!775847 () Bool)

(assert (=> d!106075 m!775847))

(declare-fun m!775849 () Bool)

(assert (=> d!106075 m!775849))

(declare-fun m!775851 () Bool)

(assert (=> b!831905 m!775851))

(assert (=> b!831578 d!106075))

(declare-fun d!106077 () Bool)

(declare-fun lt!377516 () Bool)

(assert (=> d!106077 (= lt!377516 (select (content!386 lt!377434) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun e!463943 () Bool)

(assert (=> d!106077 (= lt!377516 e!463943)))

(declare-fun res!566123 () Bool)

(assert (=> d!106077 (=> (not res!566123) (not e!463943))))

(assert (=> d!106077 (= res!566123 ((_ is Cons!15842) lt!377434))))

(assert (=> d!106077 (= (contains!4188 lt!377434 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) lt!377516)))

(declare-fun b!831906 () Bool)

(declare-fun e!463942 () Bool)

(assert (=> b!831906 (= e!463943 e!463942)))

(declare-fun res!566124 () Bool)

(assert (=> b!831906 (=> res!566124 e!463942)))

(assert (=> b!831906 (= res!566124 (= (h!16977 lt!377434) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!831907 () Bool)

(assert (=> b!831907 (= e!463942 (contains!4188 (t!22203 lt!377434) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!106077 res!566123) b!831906))

(assert (= (and b!831906 (not res!566124)) b!831907))

(declare-fun m!775853 () Bool)

(assert (=> d!106077 m!775853))

(declare-fun m!775855 () Bool)

(assert (=> d!106077 m!775855))

(declare-fun m!775857 () Bool)

(assert (=> b!831907 m!775857))

(assert (=> b!831639 d!106077))

(assert (=> d!105837 d!105839))

(assert (=> d!105837 d!105833))

(declare-fun d!106079 () Bool)

(assert (=> d!106079 (not (contains!4187 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)) lt!377089))))

(assert (=> d!106079 true))

(declare-fun _$36!343 () Unit!28446)

(assert (=> d!106079 (= (choose!1426 lt!377090 lt!377086 lt!377091 lt!377089) _$36!343)))

(declare-fun bs!23238 () Bool)

(assert (= bs!23238 d!106079))

(assert (=> bs!23238 m!774635))

(assert (=> bs!23238 m!774635))

(assert (=> bs!23238 m!774639))

(assert (=> d!105837 d!106079))

(declare-fun d!106081 () Bool)

(declare-fun e!463945 () Bool)

(assert (=> d!106081 e!463945))

(declare-fun res!566125 () Bool)

(assert (=> d!106081 (=> res!566125 e!463945)))

(declare-fun lt!377519 () Bool)

(assert (=> d!106081 (= res!566125 (not lt!377519))))

(declare-fun lt!377518 () Bool)

(assert (=> d!106081 (= lt!377519 lt!377518)))

(declare-fun lt!377517 () Unit!28446)

(declare-fun e!463944 () Unit!28446)

(assert (=> d!106081 (= lt!377517 e!463944)))

(declare-fun c!90369 () Bool)

(assert (=> d!106081 (= c!90369 lt!377518)))

(assert (=> d!106081 (= lt!377518 (containsKey!401 (toList!4466 lt!377090) lt!377089))))

(assert (=> d!106081 (= (contains!4187 lt!377090 lt!377089) lt!377519)))

(declare-fun b!831909 () Bool)

(declare-fun lt!377520 () Unit!28446)

(assert (=> b!831909 (= e!463944 lt!377520)))

(assert (=> b!831909 (= lt!377520 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377090) lt!377089))))

(assert (=> b!831909 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377090) lt!377089))))

(declare-fun b!831910 () Bool)

(declare-fun Unit!28480 () Unit!28446)

(assert (=> b!831910 (= e!463944 Unit!28480)))

(declare-fun b!831911 () Bool)

(assert (=> b!831911 (= e!463945 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377090) lt!377089)))))

(assert (= (and d!106081 c!90369) b!831909))

(assert (= (and d!106081 (not c!90369)) b!831910))

(assert (= (and d!106081 (not res!566125)) b!831911))

(declare-fun m!775859 () Bool)

(assert (=> d!106081 m!775859))

(declare-fun m!775861 () Bool)

(assert (=> b!831909 m!775861))

(declare-fun m!775863 () Bool)

(assert (=> b!831909 m!775863))

(assert (=> b!831909 m!775863))

(declare-fun m!775865 () Bool)

(assert (=> b!831909 m!775865))

(assert (=> b!831911 m!775863))

(assert (=> b!831911 m!775863))

(assert (=> b!831911 m!775865))

(assert (=> d!105837 d!106081))

(assert (=> d!105889 d!105887))

(declare-fun d!106083 () Bool)

(assert (=> d!106083 (= (getValueByKey!416 lt!377114 (_1!5049 lt!377012)) (Some!421 (_2!5049 lt!377012)))))

(assert (=> d!106083 true))

(declare-fun _$22!570 () Unit!28446)

(assert (=> d!106083 (= (choose!1423 lt!377114 (_1!5049 lt!377012) (_2!5049 lt!377012)) _$22!570)))

(declare-fun bs!23239 () Bool)

(assert (= bs!23239 d!106083))

(assert (=> bs!23239 m!774689))

(assert (=> d!105889 d!106083))

(declare-fun d!106085 () Bool)

(declare-fun res!566126 () Bool)

(declare-fun e!463946 () Bool)

(assert (=> d!106085 (=> res!566126 e!463946)))

(assert (=> d!106085 (= res!566126 (or ((_ is Nil!15843) lt!377114) ((_ is Nil!15843) (t!22203 lt!377114))))))

(assert (=> d!106085 (= (isStrictlySorted!429 lt!377114) e!463946)))

(declare-fun b!831912 () Bool)

(declare-fun e!463947 () Bool)

(assert (=> b!831912 (= e!463946 e!463947)))

(declare-fun res!566127 () Bool)

(assert (=> b!831912 (=> (not res!566127) (not e!463947))))

(assert (=> b!831912 (= res!566127 (bvslt (_1!5049 (h!16977 lt!377114)) (_1!5049 (h!16977 (t!22203 lt!377114)))))))

(declare-fun b!831913 () Bool)

(assert (=> b!831913 (= e!463947 (isStrictlySorted!429 (t!22203 lt!377114)))))

(assert (= (and d!106085 (not res!566126)) b!831912))

(assert (= (and b!831912 res!566127) b!831913))

(declare-fun m!775867 () Bool)

(assert (=> b!831913 m!775867))

(assert (=> d!105889 d!106085))

(declare-fun d!106087 () Bool)

(declare-fun e!463951 () Bool)

(assert (=> d!106087 e!463951))

(declare-fun res!566131 () Bool)

(assert (=> d!106087 (=> (not res!566131) (not e!463951))))

(declare-fun lt!377523 () ListLongMap!8901)

(assert (=> d!106087 (= res!566131 (not (contains!4187 lt!377523 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463948 () ListLongMap!8901)

(assert (=> d!106087 (= lt!377523 e!463948)))

(declare-fun c!90372 () Bool)

(assert (=> d!106087 (= c!90372 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!106087 (validMask!0 mask!1312)))

(assert (=> d!106087 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!377523)))

(declare-fun b!831914 () Bool)

(declare-fun e!463953 () Bool)

(declare-fun e!463949 () Bool)

(assert (=> b!831914 (= e!463953 e!463949)))

(assert (=> b!831914 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun res!566129 () Bool)

(assert (=> b!831914 (= res!566129 (contains!4187 lt!377523 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831914 (=> (not res!566129) (not e!463949))))

(declare-fun b!831915 () Bool)

(declare-fun res!566130 () Bool)

(assert (=> b!831915 (=> (not res!566130) (not e!463951))))

(assert (=> b!831915 (= res!566130 (not (contains!4187 lt!377523 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831916 () Bool)

(declare-fun e!463952 () Bool)

(assert (=> b!831916 (= e!463952 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831916 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!831917 () Bool)

(assert (=> b!831917 (= e!463951 e!463953)))

(declare-fun c!90371 () Bool)

(assert (=> b!831917 (= c!90371 e!463952)))

(declare-fun res!566128 () Bool)

(assert (=> b!831917 (=> (not res!566128) (not e!463952))))

(assert (=> b!831917 (= res!566128 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun bm!36341 () Bool)

(declare-fun call!36344 () ListLongMap!8901)

(assert (=> bm!36341 (= call!36344 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun e!463954 () Bool)

(declare-fun b!831918 () Bool)

(assert (=> b!831918 (= e!463954 (= lt!377523 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831919 () Bool)

(declare-fun lt!377524 () Unit!28446)

(declare-fun lt!377521 () Unit!28446)

(assert (=> b!831919 (= lt!377524 lt!377521)))

(declare-fun lt!377525 () (_ BitVec 64))

(declare-fun lt!377527 () V!25275)

(declare-fun lt!377522 () (_ BitVec 64))

(declare-fun lt!377526 () ListLongMap!8901)

(assert (=> b!831919 (not (contains!4187 (+!1988 lt!377526 (tuple2!10077 lt!377522 lt!377527)) lt!377525))))

(assert (=> b!831919 (= lt!377521 (addStillNotContains!199 lt!377526 lt!377522 lt!377527 lt!377525))))

(assert (=> b!831919 (= lt!377525 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831919 (= lt!377527 (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831919 (= lt!377522 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!831919 (= lt!377526 call!36344)))

(declare-fun e!463950 () ListLongMap!8901)

(assert (=> b!831919 (= e!463950 (+!1988 call!36344 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831920 () Bool)

(assert (=> b!831920 (= e!463953 e!463954)))

(declare-fun c!90370 () Bool)

(assert (=> b!831920 (= c!90370 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!831921 () Bool)

(assert (=> b!831921 (= e!463948 (ListLongMap!8902 Nil!15843))))

(declare-fun b!831922 () Bool)

(assert (=> b!831922 (= e!463950 call!36344)))

(declare-fun b!831923 () Bool)

(assert (=> b!831923 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> b!831923 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22746 _values!788)))))

(assert (=> b!831923 (= e!463949 (= (apply!372 lt!377523 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831924 () Bool)

(assert (=> b!831924 (= e!463948 e!463950)))

(declare-fun c!90373 () Bool)

(assert (=> b!831924 (= c!90373 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!831925 () Bool)

(assert (=> b!831925 (= e!463954 (isEmpty!660 lt!377523))))

(assert (= (and d!106087 c!90372) b!831921))

(assert (= (and d!106087 (not c!90372)) b!831924))

(assert (= (and b!831924 c!90373) b!831919))

(assert (= (and b!831924 (not c!90373)) b!831922))

(assert (= (or b!831919 b!831922) bm!36341))

(assert (= (and d!106087 res!566131) b!831915))

(assert (= (and b!831915 res!566130) b!831917))

(assert (= (and b!831917 res!566128) b!831916))

(assert (= (and b!831917 c!90371) b!831914))

(assert (= (and b!831917 (not c!90371)) b!831920))

(assert (= (and b!831914 res!566129) b!831923))

(assert (= (and b!831920 c!90370) b!831918))

(assert (= (and b!831920 (not c!90370)) b!831925))

(declare-fun b_lambda!11401 () Bool)

(assert (=> (not b_lambda!11401) (not b!831919)))

(assert (=> b!831919 t!22210))

(declare-fun b_and!22561 () Bool)

(assert (= b_and!22559 (and (=> t!22210 result!8007) b_and!22561)))

(declare-fun b_lambda!11403 () Bool)

(assert (=> (not b_lambda!11403) (not b!831923)))

(assert (=> b!831923 t!22210))

(declare-fun b_and!22563 () Bool)

(assert (= b_and!22561 (and (=> t!22210 result!8007) b_and!22563)))

(assert (=> b!831914 m!775643))

(assert (=> b!831914 m!775643))

(declare-fun m!775869 () Bool)

(assert (=> b!831914 m!775869))

(declare-fun m!775871 () Bool)

(assert (=> b!831915 m!775871))

(declare-fun m!775873 () Bool)

(assert (=> b!831919 m!775873))

(declare-fun m!775875 () Bool)

(assert (=> b!831919 m!775875))

(assert (=> b!831919 m!774637))

(assert (=> b!831919 m!775875))

(declare-fun m!775877 () Bool)

(assert (=> b!831919 m!775877))

(declare-fun m!775879 () Bool)

(assert (=> b!831919 m!775879))

(assert (=> b!831919 m!775643))

(assert (=> b!831919 m!775879))

(assert (=> b!831919 m!774637))

(declare-fun m!775881 () Bool)

(assert (=> b!831919 m!775881))

(declare-fun m!775883 () Bool)

(assert (=> b!831919 m!775883))

(assert (=> b!831916 m!775643))

(assert (=> b!831916 m!775643))

(assert (=> b!831916 m!775651))

(declare-fun m!775885 () Bool)

(assert (=> d!106087 m!775885))

(assert (=> d!106087 m!774527))

(assert (=> b!831924 m!775643))

(assert (=> b!831924 m!775643))

(assert (=> b!831924 m!775651))

(declare-fun m!775887 () Bool)

(assert (=> b!831925 m!775887))

(declare-fun m!775889 () Bool)

(assert (=> bm!36341 m!775889))

(assert (=> b!831923 m!775879))

(assert (=> b!831923 m!774637))

(assert (=> b!831923 m!775881))

(assert (=> b!831923 m!774637))

(assert (=> b!831923 m!775643))

(declare-fun m!775891 () Bool)

(assert (=> b!831923 m!775891))

(assert (=> b!831923 m!775879))

(assert (=> b!831923 m!775643))

(assert (=> b!831918 m!775889))

(assert (=> b!831375 d!106087))

(declare-fun d!106089 () Bool)

(assert (=> d!106089 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010)))))))

(declare-fun bs!23240 () Bool)

(assert (= bs!23240 d!106089))

(assert (=> bs!23240 m!774707))

(declare-fun m!775893 () Bool)

(assert (=> bs!23240 m!775893))

(assert (=> b!831606 d!106089))

(assert (=> b!831606 d!105701))

(declare-fun d!106091 () Bool)

(declare-fun lt!377528 () Bool)

(assert (=> d!106091 (= lt!377528 (select (content!386 lt!377273) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun e!463956 () Bool)

(assert (=> d!106091 (= lt!377528 e!463956)))

(declare-fun res!566132 () Bool)

(assert (=> d!106091 (=> (not res!566132) (not e!463956))))

(assert (=> d!106091 (= res!566132 ((_ is Cons!15842) lt!377273))))

(assert (=> d!106091 (= (contains!4188 lt!377273 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))) lt!377528)))

(declare-fun b!831926 () Bool)

(declare-fun e!463955 () Bool)

(assert (=> b!831926 (= e!463956 e!463955)))

(declare-fun res!566133 () Bool)

(assert (=> b!831926 (=> res!566133 e!463955)))

(assert (=> b!831926 (= res!566133 (= (h!16977 lt!377273) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831927 () Bool)

(assert (=> b!831927 (= e!463955 (contains!4188 (t!22203 lt!377273) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(assert (= (and d!106091 res!566132) b!831926))

(assert (= (and b!831926 (not res!566133)) b!831927))

(declare-fun m!775895 () Bool)

(assert (=> d!106091 m!775895))

(declare-fun m!775897 () Bool)

(assert (=> d!106091 m!775897))

(declare-fun m!775899 () Bool)

(assert (=> b!831927 m!775899))

(assert (=> b!831437 d!106091))

(declare-fun d!106093 () Bool)

(assert (=> d!106093 (= (isEmpty!661 (toList!4466 lt!377094)) ((_ is Nil!15843) (toList!4466 lt!377094)))))

(assert (=> d!105871 d!106093))

(declare-fun d!106095 () Bool)

(declare-fun lt!377529 () Bool)

(assert (=> d!106095 (= lt!377529 (select (content!386 lt!377110) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun e!463958 () Bool)

(assert (=> d!106095 (= lt!377529 e!463958)))

(declare-fun res!566134 () Bool)

(assert (=> d!106095 (=> (not res!566134) (not e!463958))))

(assert (=> d!106095 (= res!566134 ((_ is Cons!15842) lt!377110))))

(assert (=> d!106095 (= (contains!4188 lt!377110 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))) lt!377529)))

(declare-fun b!831928 () Bool)

(declare-fun e!463957 () Bool)

(assert (=> b!831928 (= e!463958 e!463957)))

(declare-fun res!566135 () Bool)

(assert (=> b!831928 (=> res!566135 e!463957)))

(assert (=> b!831928 (= res!566135 (= (h!16977 lt!377110) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831929 () Bool)

(assert (=> b!831929 (= e!463957 (contains!4188 (t!22203 lt!377110) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(assert (= (and d!106095 res!566134) b!831928))

(assert (= (and b!831928 (not res!566135)) b!831929))

(declare-fun m!775901 () Bool)

(assert (=> d!106095 m!775901))

(declare-fun m!775903 () Bool)

(assert (=> d!106095 m!775903))

(declare-fun m!775905 () Bool)

(assert (=> b!831929 m!775905))

(assert (=> b!831409 d!106095))

(declare-fun lt!377530 () Bool)

(declare-fun d!106097 () Bool)

(assert (=> d!106097 (= lt!377530 (select (content!386 (toList!4466 lt!377298)) (tuple2!10077 lt!377200 zeroValueAfter!34)))))

(declare-fun e!463960 () Bool)

(assert (=> d!106097 (= lt!377530 e!463960)))

(declare-fun res!566136 () Bool)

(assert (=> d!106097 (=> (not res!566136) (not e!463960))))

(assert (=> d!106097 (= res!566136 ((_ is Cons!15842) (toList!4466 lt!377298)))))

(assert (=> d!106097 (= (contains!4188 (toList!4466 lt!377298) (tuple2!10077 lt!377200 zeroValueAfter!34)) lt!377530)))

(declare-fun b!831930 () Bool)

(declare-fun e!463959 () Bool)

(assert (=> b!831930 (= e!463960 e!463959)))

(declare-fun res!566137 () Bool)

(assert (=> b!831930 (=> res!566137 e!463959)))

(assert (=> b!831930 (= res!566137 (= (h!16977 (toList!4466 lt!377298)) (tuple2!10077 lt!377200 zeroValueAfter!34)))))

(declare-fun b!831931 () Bool)

(assert (=> b!831931 (= e!463959 (contains!4188 (t!22203 (toList!4466 lt!377298)) (tuple2!10077 lt!377200 zeroValueAfter!34)))))

(assert (= (and d!106097 res!566136) b!831930))

(assert (= (and b!831930 (not res!566137)) b!831931))

(declare-fun m!775907 () Bool)

(assert (=> d!106097 m!775907))

(declare-fun m!775909 () Bool)

(assert (=> d!106097 m!775909))

(declare-fun m!775911 () Bool)

(assert (=> b!831931 m!775911))

(assert (=> b!831458 d!106097))

(declare-fun d!106099 () Bool)

(declare-fun res!566138 () Bool)

(declare-fun e!463961 () Bool)

(assert (=> d!106099 (=> res!566138 e!463961)))

(assert (=> d!106099 (= res!566138 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (= (_1!5049 (h!16977 (toList!4466 lt!377087))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106099 (= (containsKey!401 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!463961)))

(declare-fun b!831932 () Bool)

(declare-fun e!463962 () Bool)

(assert (=> b!831932 (= e!463961 e!463962)))

(declare-fun res!566139 () Bool)

(assert (=> b!831932 (=> (not res!566139) (not e!463962))))

(assert (=> b!831932 (= res!566139 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377087))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377087))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15842) (toList!4466 lt!377087)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377087))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!831933 () Bool)

(assert (=> b!831933 (= e!463962 (containsKey!401 (t!22203 (toList!4466 lt!377087)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106099 (not res!566138)) b!831932))

(assert (= (and b!831932 res!566139) b!831933))

(assert (=> b!831933 m!774611))

(declare-fun m!775913 () Bool)

(assert (=> b!831933 m!775913))

(assert (=> d!105781 d!106099))

(declare-fun b!831935 () Bool)

(declare-fun e!463963 () Option!422)

(declare-fun e!463964 () Option!422)

(assert (=> b!831935 (= e!463963 e!463964)))

(declare-fun c!90375 () Bool)

(assert (=> b!831935 (= c!90375 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377108))) (not (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377108)))) (_1!5049 lt!377010)))))))

(declare-fun b!831936 () Bool)

(assert (=> b!831936 (= e!463964 (getValueByKey!416 (t!22203 (t!22203 (toList!4466 lt!377108))) (_1!5049 lt!377010)))))

(declare-fun d!106101 () Bool)

(declare-fun c!90374 () Bool)

(assert (=> d!106101 (= c!90374 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377108))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377108)))) (_1!5049 lt!377010))))))

(assert (=> d!106101 (= (getValueByKey!416 (t!22203 (toList!4466 lt!377108)) (_1!5049 lt!377010)) e!463963)))

(declare-fun b!831934 () Bool)

(assert (=> b!831934 (= e!463963 (Some!421 (_2!5049 (h!16977 (t!22203 (toList!4466 lt!377108))))))))

(declare-fun b!831937 () Bool)

(assert (=> b!831937 (= e!463964 None!420)))

(assert (= (and d!106101 c!90374) b!831934))

(assert (= (and d!106101 (not c!90374)) b!831935))

(assert (= (and b!831935 c!90375) b!831936))

(assert (= (and b!831935 (not c!90375)) b!831937))

(declare-fun m!775915 () Bool)

(assert (=> b!831936 m!775915))

(assert (=> b!831663 d!106101))

(declare-fun b!831939 () Bool)

(declare-fun e!463965 () Option!422)

(declare-fun e!463966 () Option!422)

(assert (=> b!831939 (= e!463965 e!463966)))

(declare-fun c!90377 () Bool)

(assert (=> b!831939 (= c!90377 (and ((_ is Cons!15842) (toList!4466 lt!377378)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377378))) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))))

(declare-fun b!831940 () Bool)

(assert (=> b!831940 (= e!463966 (getValueByKey!416 (t!22203 (toList!4466 lt!377378)) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun d!106103 () Bool)

(declare-fun c!90376 () Bool)

(assert (=> d!106103 (= c!90376 (and ((_ is Cons!15842) (toList!4466 lt!377378)) (= (_1!5049 (h!16977 (toList!4466 lt!377378))) (_1!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (=> d!106103 (= (getValueByKey!416 (toList!4466 lt!377378) (_1!5049 (tuple2!10077 lt!377086 lt!377091))) e!463965)))

(declare-fun b!831938 () Bool)

(assert (=> b!831938 (= e!463965 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377378)))))))

(declare-fun b!831941 () Bool)

(assert (=> b!831941 (= e!463966 None!420)))

(assert (= (and d!106103 c!90376) b!831938))

(assert (= (and d!106103 (not c!90376)) b!831939))

(assert (= (and b!831939 c!90377) b!831940))

(assert (= (and b!831939 (not c!90377)) b!831941))

(declare-fun m!775917 () Bool)

(assert (=> b!831940 m!775917))

(assert (=> b!831545 d!106103))

(declare-fun d!106105 () Bool)

(declare-fun res!566140 () Bool)

(declare-fun e!463967 () Bool)

(assert (=> d!106105 (=> res!566140 e!463967)))

(assert (=> d!106105 (= res!566140 (and ((_ is Cons!15842) (toList!4466 lt!377208)) (= (_1!5049 (h!16977 (toList!4466 lt!377208))) (_1!5049 lt!377012))))))

(assert (=> d!106105 (= (containsKey!401 (toList!4466 lt!377208) (_1!5049 lt!377012)) e!463967)))

(declare-fun b!831942 () Bool)

(declare-fun e!463968 () Bool)

(assert (=> b!831942 (= e!463967 e!463968)))

(declare-fun res!566141 () Bool)

(assert (=> b!831942 (=> (not res!566141) (not e!463968))))

(assert (=> b!831942 (= res!566141 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377208))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377208))) (_1!5049 lt!377012))) ((_ is Cons!15842) (toList!4466 lt!377208)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377208))) (_1!5049 lt!377012))))))

(declare-fun b!831943 () Bool)

(assert (=> b!831943 (= e!463968 (containsKey!401 (t!22203 (toList!4466 lt!377208)) (_1!5049 lt!377012)))))

(assert (= (and d!106105 (not res!566140)) b!831942))

(assert (= (and b!831942 res!566141) b!831943))

(declare-fun m!775919 () Bool)

(assert (=> b!831943 m!775919))

(assert (=> d!105765 d!106105))

(declare-fun b!831945 () Bool)

(declare-fun e!463969 () Option!422)

(declare-fun e!463970 () Option!422)

(assert (=> b!831945 (= e!463969 e!463970)))

(declare-fun c!90379 () Bool)

(assert (=> b!831945 (= c!90379 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377212))) (not (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377212)))) (_1!5049 lt!377012)))))))

(declare-fun b!831946 () Bool)

(assert (=> b!831946 (= e!463970 (getValueByKey!416 (t!22203 (t!22203 (toList!4466 lt!377212))) (_1!5049 lt!377012)))))

(declare-fun d!106107 () Bool)

(declare-fun c!90378 () Bool)

(assert (=> d!106107 (= c!90378 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377212))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377212)))) (_1!5049 lt!377012))))))

(assert (=> d!106107 (= (getValueByKey!416 (t!22203 (toList!4466 lt!377212)) (_1!5049 lt!377012)) e!463969)))

(declare-fun b!831944 () Bool)

(assert (=> b!831944 (= e!463969 (Some!421 (_2!5049 (h!16977 (t!22203 (toList!4466 lt!377212))))))))

(declare-fun b!831947 () Bool)

(assert (=> b!831947 (= e!463970 None!420)))

(assert (= (and d!106107 c!90378) b!831944))

(assert (= (and d!106107 (not c!90378)) b!831945))

(assert (= (and b!831945 c!90379) b!831946))

(assert (= (and b!831945 (not c!90379)) b!831947))

(declare-fun m!775921 () Bool)

(assert (=> b!831946 m!775921))

(assert (=> b!831595 d!106107))

(assert (=> b!831660 d!105913))

(assert (=> b!831660 d!105915))

(declare-fun d!106109 () Bool)

(assert (=> d!106109 (= (get!11822 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10092 (select (arr!22326 _values!788) #b00000000000000000000000000000000)))))

(assert (=> b!831393 d!106109))

(declare-fun d!106111 () Bool)

(assert (=> d!106111 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105725 d!106111))

(declare-fun b!831949 () Bool)

(declare-fun e!463971 () Option!422)

(declare-fun e!463972 () Option!422)

(assert (=> b!831949 (= e!463971 e!463972)))

(declare-fun c!90381 () Bool)

(assert (=> b!831949 (= c!90381 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377202))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831950 () Bool)

(assert (=> b!831950 (= e!463972 (getValueByKey!416 (t!22203 (toList!4466 lt!377202)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!106113 () Bool)

(declare-fun c!90380 () Bool)

(assert (=> d!106113 (= c!90380 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (= (_1!5049 (h!16977 (toList!4466 lt!377202))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106113 (= (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000) e!463971)))

(declare-fun b!831948 () Bool)

(assert (=> b!831948 (= e!463971 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377202)))))))

(declare-fun b!831951 () Bool)

(assert (=> b!831951 (= e!463972 None!420)))

(assert (= (and d!106113 c!90380) b!831948))

(assert (= (and d!106113 (not c!90380)) b!831949))

(assert (= (and b!831949 c!90381) b!831950))

(assert (= (and b!831949 (not c!90381)) b!831951))

(declare-fun m!775923 () Bool)

(assert (=> b!831950 m!775923))

(assert (=> d!105725 d!106113))

(declare-fun b!831953 () Bool)

(declare-fun e!463973 () Option!422)

(declare-fun e!463974 () Option!422)

(assert (=> b!831953 (= e!463973 e!463974)))

(declare-fun c!90383 () Bool)

(assert (=> b!831953 (= c!90383 (and ((_ is Cons!15842) (t!22203 lt!377214)) (not (= (_1!5049 (h!16977 (t!22203 lt!377214))) (_1!5049 lt!377012)))))))

(declare-fun b!831954 () Bool)

(assert (=> b!831954 (= e!463974 (getValueByKey!416 (t!22203 (t!22203 lt!377214)) (_1!5049 lt!377012)))))

(declare-fun d!106115 () Bool)

(declare-fun c!90382 () Bool)

(assert (=> d!106115 (= c!90382 (and ((_ is Cons!15842) (t!22203 lt!377214)) (= (_1!5049 (h!16977 (t!22203 lt!377214))) (_1!5049 lt!377012))))))

(assert (=> d!106115 (= (getValueByKey!416 (t!22203 lt!377214) (_1!5049 lt!377012)) e!463973)))

(declare-fun b!831952 () Bool)

(assert (=> b!831952 (= e!463973 (Some!421 (_2!5049 (h!16977 (t!22203 lt!377214)))))))

(declare-fun b!831955 () Bool)

(assert (=> b!831955 (= e!463974 None!420)))

(assert (= (and d!106115 c!90382) b!831952))

(assert (= (and d!106115 (not c!90382)) b!831953))

(assert (= (and b!831953 c!90383) b!831954))

(assert (= (and b!831953 (not c!90383)) b!831955))

(declare-fun m!775925 () Bool)

(assert (=> b!831954 m!775925))

(assert (=> b!831567 d!106115))

(assert (=> d!105881 d!105879))

(declare-fun d!106117 () Bool)

(assert (=> d!106117 (= (getValueByKey!416 lt!377118 (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010)))))

(assert (=> d!106117 true))

(declare-fun _$22!571 () Unit!28446)

(assert (=> d!106117 (= (choose!1423 lt!377118 (_1!5049 lt!377010) (_2!5049 lt!377010)) _$22!571)))

(declare-fun bs!23241 () Bool)

(assert (= bs!23241 d!106117))

(assert (=> bs!23241 m!774701))

(assert (=> d!105881 d!106117))

(declare-fun d!106119 () Bool)

(declare-fun res!566142 () Bool)

(declare-fun e!463975 () Bool)

(assert (=> d!106119 (=> res!566142 e!463975)))

(assert (=> d!106119 (= res!566142 (or ((_ is Nil!15843) lt!377118) ((_ is Nil!15843) (t!22203 lt!377118))))))

(assert (=> d!106119 (= (isStrictlySorted!429 lt!377118) e!463975)))

(declare-fun b!831956 () Bool)

(declare-fun e!463976 () Bool)

(assert (=> b!831956 (= e!463975 e!463976)))

(declare-fun res!566143 () Bool)

(assert (=> b!831956 (=> (not res!566143) (not e!463976))))

(assert (=> b!831956 (= res!566143 (bvslt (_1!5049 (h!16977 lt!377118)) (_1!5049 (h!16977 (t!22203 lt!377118)))))))

(declare-fun b!831957 () Bool)

(assert (=> b!831957 (= e!463976 (isStrictlySorted!429 (t!22203 lt!377118)))))

(assert (= (and d!106119 (not res!566142)) b!831956))

(assert (= (and b!831956 res!566143) b!831957))

(declare-fun m!775927 () Bool)

(assert (=> b!831957 m!775927))

(assert (=> d!105881 d!106119))

(declare-fun d!106121 () Bool)

(declare-fun lt!377531 () Bool)

(assert (=> d!106121 (= lt!377531 (select (content!386 (t!22203 (toList!4466 lt!377212))) lt!377012))))

(declare-fun e!463978 () Bool)

(assert (=> d!106121 (= lt!377531 e!463978)))

(declare-fun res!566144 () Bool)

(assert (=> d!106121 (=> (not res!566144) (not e!463978))))

(assert (=> d!106121 (= res!566144 ((_ is Cons!15842) (t!22203 (toList!4466 lt!377212))))))

(assert (=> d!106121 (= (contains!4188 (t!22203 (toList!4466 lt!377212)) lt!377012) lt!377531)))

(declare-fun b!831958 () Bool)

(declare-fun e!463977 () Bool)

(assert (=> b!831958 (= e!463978 e!463977)))

(declare-fun res!566145 () Bool)

(assert (=> b!831958 (=> res!566145 e!463977)))

(assert (=> b!831958 (= res!566145 (= (h!16977 (t!22203 (toList!4466 lt!377212))) lt!377012))))

(declare-fun b!831959 () Bool)

(assert (=> b!831959 (= e!463977 (contains!4188 (t!22203 (t!22203 (toList!4466 lt!377212))) lt!377012))))

(assert (= (and d!106121 res!566144) b!831958))

(assert (= (and b!831958 (not res!566145)) b!831959))

(declare-fun m!775929 () Bool)

(assert (=> d!106121 m!775929))

(declare-fun m!775931 () Bool)

(assert (=> d!106121 m!775931))

(declare-fun m!775933 () Bool)

(assert (=> b!831959 m!775933))

(assert (=> b!831388 d!106121))

(declare-fun d!106123 () Bool)

(assert (=> d!106123 (= (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754))) lt!377172)) (v!10095 (getValueByKey!416 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754))) lt!377172)))))

(assert (=> d!105817 d!106123))

(declare-fun b!831961 () Bool)

(declare-fun e!463979 () Option!422)

(declare-fun e!463980 () Option!422)

(assert (=> b!831961 (= e!463979 e!463980)))

(declare-fun c!90385 () Bool)

(assert (=> b!831961 (= c!90385 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754))))) lt!377172))))))

(declare-fun b!831962 () Bool)

(assert (=> b!831962 (= e!463980 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)))) lt!377172))))

(declare-fun c!90384 () Bool)

(declare-fun d!106125 () Bool)

(assert (=> d!106125 (= c!90384 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754))))) lt!377172)))))

(assert (=> d!106125 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754))) lt!377172) e!463979)))

(declare-fun b!831960 () Bool)

(assert (=> b!831960 (= e!463979 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)))))))))

(declare-fun b!831963 () Bool)

(assert (=> b!831963 (= e!463980 None!420)))

(assert (= (and d!106125 c!90384) b!831960))

(assert (= (and d!106125 (not c!90384)) b!831961))

(assert (= (and b!831961 c!90385) b!831962))

(assert (= (and b!831961 (not c!90385)) b!831963))

(declare-fun m!775935 () Bool)

(assert (=> b!831962 m!775935))

(assert (=> d!105817 d!106125))

(declare-fun b!831965 () Bool)

(declare-fun e!463981 () Option!422)

(declare-fun e!463982 () Option!422)

(assert (=> b!831965 (= e!463981 e!463982)))

(declare-fun c!90387 () Bool)

(assert (=> b!831965 (= c!90387 (and ((_ is Cons!15842) (t!22203 lt!377114)) (not (= (_1!5049 (h!16977 (t!22203 lt!377114))) (_1!5049 lt!377012)))))))

(declare-fun b!831966 () Bool)

(assert (=> b!831966 (= e!463982 (getValueByKey!416 (t!22203 (t!22203 lt!377114)) (_1!5049 lt!377012)))))

(declare-fun d!106127 () Bool)

(declare-fun c!90386 () Bool)

(assert (=> d!106127 (= c!90386 (and ((_ is Cons!15842) (t!22203 lt!377114)) (= (_1!5049 (h!16977 (t!22203 lt!377114))) (_1!5049 lt!377012))))))

(assert (=> d!106127 (= (getValueByKey!416 (t!22203 lt!377114) (_1!5049 lt!377012)) e!463981)))

(declare-fun b!831964 () Bool)

(assert (=> b!831964 (= e!463981 (Some!421 (_2!5049 (h!16977 (t!22203 lt!377114)))))))

(declare-fun b!831967 () Bool)

(assert (=> b!831967 (= e!463982 None!420)))

(assert (= (and d!106127 c!90386) b!831964))

(assert (= (and d!106127 (not c!90386)) b!831965))

(assert (= (and b!831965 c!90387) b!831966))

(assert (= (and b!831965 (not c!90387)) b!831967))

(declare-fun m!775937 () Bool)

(assert (=> b!831966 m!775937))

(assert (=> b!831628 d!106127))

(declare-fun d!106129 () Bool)

(declare-fun lt!377532 () Bool)

(assert (=> d!106129 (= lt!377532 (select (content!386 lt!377428) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun e!463984 () Bool)

(assert (=> d!106129 (= lt!377532 e!463984)))

(declare-fun res!566146 () Bool)

(assert (=> d!106129 (=> (not res!566146) (not e!463984))))

(assert (=> d!106129 (= res!566146 ((_ is Cons!15842) lt!377428))))

(assert (=> d!106129 (= (contains!4188 lt!377428 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))) lt!377532)))

(declare-fun b!831968 () Bool)

(declare-fun e!463983 () Bool)

(assert (=> b!831968 (= e!463984 e!463983)))

(declare-fun res!566147 () Bool)

(assert (=> b!831968 (=> res!566147 e!463983)))

(assert (=> b!831968 (= res!566147 (= (h!16977 lt!377428) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!831969 () Bool)

(assert (=> b!831969 (= e!463983 (contains!4188 (t!22203 lt!377428) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(assert (= (and d!106129 res!566146) b!831968))

(assert (= (and b!831968 (not res!566147)) b!831969))

(declare-fun m!775939 () Bool)

(assert (=> d!106129 m!775939))

(declare-fun m!775941 () Bool)

(assert (=> d!106129 m!775941))

(declare-fun m!775943 () Bool)

(assert (=> b!831969 m!775943))

(assert (=> b!831620 d!106129))

(declare-fun lt!377533 () Bool)

(declare-fun d!106131 () Bool)

(assert (=> d!106131 (= lt!377533 (select (content!386 (toList!4466 lt!377356)) (tuple2!10077 lt!377167 zeroValueBefore!34)))))

(declare-fun e!463986 () Bool)

(assert (=> d!106131 (= lt!377533 e!463986)))

(declare-fun res!566148 () Bool)

(assert (=> d!106131 (=> (not res!566148) (not e!463986))))

(assert (=> d!106131 (= res!566148 ((_ is Cons!15842) (toList!4466 lt!377356)))))

(assert (=> d!106131 (= (contains!4188 (toList!4466 lt!377356) (tuple2!10077 lt!377167 zeroValueBefore!34)) lt!377533)))

(declare-fun b!831970 () Bool)

(declare-fun e!463985 () Bool)

(assert (=> b!831970 (= e!463986 e!463985)))

(declare-fun res!566149 () Bool)

(assert (=> b!831970 (=> res!566149 e!463985)))

(assert (=> b!831970 (= res!566149 (= (h!16977 (toList!4466 lt!377356)) (tuple2!10077 lt!377167 zeroValueBefore!34)))))

(declare-fun b!831971 () Bool)

(assert (=> b!831971 (= e!463985 (contains!4188 (t!22203 (toList!4466 lt!377356)) (tuple2!10077 lt!377167 zeroValueBefore!34)))))

(assert (= (and d!106131 res!566148) b!831970))

(assert (= (and b!831970 (not res!566149)) b!831971))

(declare-fun m!775945 () Bool)

(assert (=> d!106131 m!775945))

(declare-fun m!775947 () Bool)

(assert (=> d!106131 m!775947))

(declare-fun m!775949 () Bool)

(assert (=> b!831971 m!775949))

(assert (=> b!831518 d!106131))

(declare-fun d!106133 () Bool)

(assert (=> d!106133 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377534 () Unit!28446)

(assert (=> d!106133 (= lt!377534 (choose!1427 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!463987 () Bool)

(assert (=> d!106133 e!463987))

(declare-fun res!566150 () Bool)

(assert (=> d!106133 (=> (not res!566150) (not e!463987))))

(assert (=> d!106133 (= res!566150 (isStrictlySorted!429 (toList!4466 lt!377202)))))

(assert (=> d!106133 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377534)))

(declare-fun b!831972 () Bool)

(assert (=> b!831972 (= e!463987 (containsKey!401 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106133 res!566150) b!831972))

(assert (=> d!106133 m!775189))

(assert (=> d!106133 m!775189))

(assert (=> d!106133 m!775531))

(declare-fun m!775951 () Bool)

(assert (=> d!106133 m!775951))

(assert (=> d!106133 m!775781))

(assert (=> b!831972 m!775527))

(assert (=> b!831646 d!106133))

(declare-fun d!106135 () Bool)

(assert (=> d!106135 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23242 () Bool)

(assert (= bs!23242 d!106135))

(assert (=> bs!23242 m!775189))

(declare-fun m!775953 () Bool)

(assert (=> bs!23242 m!775953))

(assert (=> b!831646 d!106135))

(assert (=> b!831646 d!105925))

(declare-fun d!106137 () Bool)

(declare-fun c!90388 () Bool)

(assert (=> d!106137 (= c!90388 ((_ is Nil!15843) (toList!4466 lt!377108)))))

(declare-fun e!463988 () (InoxSet tuple2!10076))

(assert (=> d!106137 (= (content!386 (toList!4466 lt!377108)) e!463988)))

(declare-fun b!831973 () Bool)

(assert (=> b!831973 (= e!463988 ((as const (Array tuple2!10076 Bool)) false))))

(declare-fun b!831974 () Bool)

(assert (=> b!831974 (= e!463988 ((_ map or) (store ((as const (Array tuple2!10076 Bool)) false) (h!16977 (toList!4466 lt!377108)) true) (content!386 (t!22203 (toList!4466 lt!377108)))))))

(assert (= (and d!106137 c!90388) b!831973))

(assert (= (and d!106137 (not c!90388)) b!831974))

(declare-fun m!775955 () Bool)

(assert (=> b!831974 m!775955))

(declare-fun m!775957 () Bool)

(assert (=> b!831974 m!775957))

(assert (=> d!105777 d!106137))

(declare-fun d!106139 () Bool)

(assert (=> d!106139 (= (apply!372 (+!1988 lt!377177 (tuple2!10077 lt!377173 minValue!754)) lt!377172) (apply!372 lt!377177 lt!377172))))

(assert (=> d!106139 true))

(declare-fun _$34!1144 () Unit!28446)

(assert (=> d!106139 (= (choose!1424 lt!377177 lt!377173 minValue!754 lt!377172) _$34!1144)))

(declare-fun bs!23243 () Bool)

(assert (= bs!23243 d!106139))

(assert (=> bs!23243 m!774731))

(assert (=> bs!23243 m!774731))

(assert (=> bs!23243 m!774733))

(assert (=> bs!23243 m!774725))

(assert (=> d!105805 d!106139))

(declare-fun d!106141 () Bool)

(declare-fun e!463990 () Bool)

(assert (=> d!106141 e!463990))

(declare-fun res!566151 () Bool)

(assert (=> d!106141 (=> res!566151 e!463990)))

(declare-fun lt!377537 () Bool)

(assert (=> d!106141 (= res!566151 (not lt!377537))))

(declare-fun lt!377536 () Bool)

(assert (=> d!106141 (= lt!377537 lt!377536)))

(declare-fun lt!377535 () Unit!28446)

(declare-fun e!463989 () Unit!28446)

(assert (=> d!106141 (= lt!377535 e!463989)))

(declare-fun c!90389 () Bool)

(assert (=> d!106141 (= c!90389 lt!377536)))

(assert (=> d!106141 (= lt!377536 (containsKey!401 (toList!4466 lt!377177) lt!377172))))

(assert (=> d!106141 (= (contains!4187 lt!377177 lt!377172) lt!377537)))

(declare-fun b!831975 () Bool)

(declare-fun lt!377538 () Unit!28446)

(assert (=> b!831975 (= e!463989 lt!377538)))

(assert (=> b!831975 (= lt!377538 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377177) lt!377172))))

(assert (=> b!831975 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377177) lt!377172))))

(declare-fun b!831976 () Bool)

(declare-fun Unit!28481 () Unit!28446)

(assert (=> b!831976 (= e!463989 Unit!28481)))

(declare-fun b!831977 () Bool)

(assert (=> b!831977 (= e!463990 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377177) lt!377172)))))

(assert (= (and d!106141 c!90389) b!831975))

(assert (= (and d!106141 (not c!90389)) b!831976))

(assert (= (and d!106141 (not res!566151)) b!831977))

(declare-fun m!775959 () Bool)

(assert (=> d!106141 m!775959))

(declare-fun m!775961 () Bool)

(assert (=> b!831975 m!775961))

(assert (=> b!831975 m!775285))

(assert (=> b!831975 m!775285))

(declare-fun m!775963 () Bool)

(assert (=> b!831975 m!775963))

(assert (=> b!831977 m!775285))

(assert (=> b!831977 m!775285))

(assert (=> b!831977 m!775963))

(assert (=> d!105805 d!106141))

(assert (=> d!105805 d!105807))

(assert (=> d!105805 d!105817))

(assert (=> d!105805 d!105819))

(declare-fun d!106143 () Bool)

(declare-fun e!463992 () Bool)

(assert (=> d!106143 e!463992))

(declare-fun res!566152 () Bool)

(assert (=> d!106143 (=> res!566152 e!463992)))

(declare-fun lt!377541 () Bool)

(assert (=> d!106143 (= res!566152 (not lt!377541))))

(declare-fun lt!377540 () Bool)

(assert (=> d!106143 (= lt!377541 lt!377540)))

(declare-fun lt!377539 () Unit!28446)

(declare-fun e!463991 () Unit!28446)

(assert (=> d!106143 (= lt!377539 e!463991)))

(declare-fun c!90390 () Bool)

(assert (=> d!106143 (= c!90390 lt!377540)))

(assert (=> d!106143 (= lt!377540 (containsKey!401 (toList!4466 lt!377252) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!106143 (= (contains!4187 lt!377252 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377541)))

(declare-fun b!831978 () Bool)

(declare-fun lt!377542 () Unit!28446)

(assert (=> b!831978 (= e!463991 lt!377542)))

(assert (=> b!831978 (= lt!377542 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377252) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!831978 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377252) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!831979 () Bool)

(declare-fun Unit!28482 () Unit!28446)

(assert (=> b!831979 (= e!463991 Unit!28482)))

(declare-fun b!831980 () Bool)

(assert (=> b!831980 (= e!463992 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377252) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!106143 c!90390) b!831978))

(assert (= (and d!106143 (not c!90390)) b!831979))

(assert (= (and d!106143 (not res!566152)) b!831980))

(assert (=> d!106143 m!774867))

(declare-fun m!775965 () Bool)

(assert (=> d!106143 m!775965))

(assert (=> b!831978 m!774867))

(declare-fun m!775967 () Bool)

(assert (=> b!831978 m!775967))

(assert (=> b!831978 m!774867))

(declare-fun m!775969 () Bool)

(assert (=> b!831978 m!775969))

(assert (=> b!831978 m!775969))

(declare-fun m!775971 () Bool)

(assert (=> b!831978 m!775971))

(assert (=> b!831980 m!774867))

(assert (=> b!831980 m!775969))

(assert (=> b!831980 m!775969))

(assert (=> b!831980 m!775971))

(assert (=> b!831371 d!106143))

(declare-fun d!106145 () Bool)

(assert (=> d!106145 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105869 d!106145))

(assert (=> d!105869 d!105957))

(declare-fun d!106147 () Bool)

(declare-fun c!90391 () Bool)

(assert (=> d!106147 (= c!90391 ((_ is Nil!15843) (toList!4466 lt!377212)))))

(declare-fun e!463993 () (InoxSet tuple2!10076))

(assert (=> d!106147 (= (content!386 (toList!4466 lt!377212)) e!463993)))

(declare-fun b!831981 () Bool)

(assert (=> b!831981 (= e!463993 ((as const (Array tuple2!10076 Bool)) false))))

(declare-fun b!831982 () Bool)

(assert (=> b!831982 (= e!463993 ((_ map or) (store ((as const (Array tuple2!10076 Bool)) false) (h!16977 (toList!4466 lt!377212)) true) (content!386 (t!22203 (toList!4466 lt!377212)))))))

(assert (= (and d!106147 c!90391) b!831981))

(assert (= (and d!106147 (not c!90391)) b!831982))

(declare-fun m!775973 () Bool)

(assert (=> b!831982 m!775973))

(assert (=> b!831982 m!775929))

(assert (=> d!105705 d!106147))

(declare-fun d!106149 () Bool)

(assert (=> d!106149 (= (content!387 Nil!15844) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!105841 d!106149))

(assert (=> b!831667 d!106007))

(assert (=> b!831667 d!106009))

(declare-fun d!106151 () Bool)

(assert (=> d!106151 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012)))))

(declare-fun lt!377543 () Unit!28446)

(assert (=> d!106151 (= lt!377543 (choose!1427 (toList!4466 lt!377212) (_1!5049 lt!377012)))))

(declare-fun e!463994 () Bool)

(assert (=> d!106151 e!463994))

(declare-fun res!566153 () Bool)

(assert (=> d!106151 (=> (not res!566153) (not e!463994))))

(assert (=> d!106151 (= res!566153 (isStrictlySorted!429 (toList!4466 lt!377212)))))

(assert (=> d!106151 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377212) (_1!5049 lt!377012)) lt!377543)))

(declare-fun b!831983 () Bool)

(assert (=> b!831983 (= e!463994 (containsKey!401 (toList!4466 lt!377212) (_1!5049 lt!377012)))))

(assert (= (and d!106151 res!566153) b!831983))

(assert (=> d!106151 m!774823))

(assert (=> d!106151 m!774823))

(assert (=> d!106151 m!775371))

(declare-fun m!775975 () Bool)

(assert (=> d!106151 m!775975))

(declare-fun m!775977 () Bool)

(assert (=> d!106151 m!775977))

(assert (=> b!831983 m!775367))

(assert (=> b!831562 d!106151))

(declare-fun d!106153 () Bool)

(assert (=> d!106153 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377212) (_1!5049 lt!377012)))))))

(declare-fun bs!23244 () Bool)

(assert (= bs!23244 d!106153))

(assert (=> bs!23244 m!774823))

(declare-fun m!775979 () Bool)

(assert (=> bs!23244 m!775979))

(assert (=> b!831562 d!106153))

(assert (=> b!831562 d!105863))

(assert (=> d!105731 d!105737))

(assert (=> d!105731 d!105753))

(assert (=> d!105731 d!105757))

(declare-fun d!106155 () Bool)

(declare-fun e!463996 () Bool)

(assert (=> d!106155 e!463996))

(declare-fun res!566154 () Bool)

(assert (=> d!106155 (=> res!566154 e!463996)))

(declare-fun lt!377546 () Bool)

(assert (=> d!106155 (= res!566154 (not lt!377546))))

(declare-fun lt!377545 () Bool)

(assert (=> d!106155 (= lt!377546 lt!377545)))

(declare-fun lt!377544 () Unit!28446)

(declare-fun e!463995 () Unit!28446)

(assert (=> d!106155 (= lt!377544 e!463995)))

(declare-fun c!90392 () Bool)

(assert (=> d!106155 (= c!90392 lt!377545)))

(assert (=> d!106155 (= lt!377545 (containsKey!401 (toList!4466 lt!377204) lt!377193))))

(assert (=> d!106155 (= (contains!4187 lt!377204 lt!377193) lt!377546)))

(declare-fun b!831984 () Bool)

(declare-fun lt!377547 () Unit!28446)

(assert (=> b!831984 (= e!463995 lt!377547)))

(assert (=> b!831984 (= lt!377547 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377204) lt!377193))))

(assert (=> b!831984 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377204) lt!377193))))

(declare-fun b!831985 () Bool)

(declare-fun Unit!28483 () Unit!28446)

(assert (=> b!831985 (= e!463995 Unit!28483)))

(declare-fun b!831986 () Bool)

(assert (=> b!831986 (= e!463996 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377204) lt!377193)))))

(assert (= (and d!106155 c!90392) b!831984))

(assert (= (and d!106155 (not c!90392)) b!831985))

(assert (= (and d!106155 (not res!566154)) b!831986))

(declare-fun m!775981 () Bool)

(assert (=> d!106155 m!775981))

(declare-fun m!775983 () Bool)

(assert (=> b!831984 m!775983))

(assert (=> b!831984 m!775091))

(assert (=> b!831984 m!775091))

(declare-fun m!775985 () Bool)

(assert (=> b!831984 m!775985))

(assert (=> b!831986 m!775091))

(assert (=> b!831986 m!775091))

(assert (=> b!831986 m!775985))

(assert (=> d!105731 d!106155))

(declare-fun d!106157 () Bool)

(assert (=> d!106157 (= (apply!372 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)) lt!377193) (apply!372 lt!377204 lt!377193))))

(assert (=> d!106157 true))

(declare-fun _$34!1145 () Unit!28446)

(assert (=> d!106157 (= (choose!1424 lt!377204 lt!377187 minValue!754 lt!377193) _$34!1145)))

(declare-fun bs!23245 () Bool)

(assert (= bs!23245 d!106157))

(assert (=> bs!23245 m!774781))

(assert (=> bs!23245 m!774781))

(assert (=> bs!23245 m!774783))

(assert (=> bs!23245 m!774799))

(assert (=> d!105731 d!106157))

(declare-fun d!106159 () Bool)

(assert (=> d!106159 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012)))))

(declare-fun lt!377548 () Unit!28446)

(assert (=> d!106159 (= lt!377548 (choose!1427 (toList!4466 lt!377112) (_1!5049 lt!377012)))))

(declare-fun e!463997 () Bool)

(assert (=> d!106159 e!463997))

(declare-fun res!566155 () Bool)

(assert (=> d!106159 (=> (not res!566155) (not e!463997))))

(assert (=> d!106159 (= res!566155 (isStrictlySorted!429 (toList!4466 lt!377112)))))

(assert (=> d!106159 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377112) (_1!5049 lt!377012)) lt!377548)))

(declare-fun b!831987 () Bool)

(assert (=> b!831987 (= e!463997 (containsKey!401 (toList!4466 lt!377112) (_1!5049 lt!377012)))))

(assert (= (and d!106159 res!566155) b!831987))

(assert (=> d!106159 m!774695))

(assert (=> d!106159 m!774695))

(assert (=> d!106159 m!775501))

(declare-fun m!775987 () Bool)

(assert (=> d!106159 m!775987))

(declare-fun m!775989 () Bool)

(assert (=> d!106159 m!775989))

(assert (=> b!831987 m!775497))

(assert (=> b!831623 d!106159))

(declare-fun d!106161 () Bool)

(assert (=> d!106161 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377112) (_1!5049 lt!377012)))))))

(declare-fun bs!23246 () Bool)

(assert (= bs!23246 d!106161))

(assert (=> bs!23246 m!774695))

(declare-fun m!775991 () Bool)

(assert (=> bs!23246 m!775991))

(assert (=> b!831623 d!106161))

(assert (=> b!831623 d!105899))

(assert (=> b!831513 d!105945))

(assert (=> b!831513 d!105947))

(declare-fun d!106163 () Bool)

(declare-fun e!464001 () Bool)

(assert (=> d!106163 e!464001))

(declare-fun res!566159 () Bool)

(assert (=> d!106163 (=> (not res!566159) (not e!464001))))

(declare-fun lt!377551 () ListLongMap!8901)

(assert (=> d!106163 (= res!566159 (not (contains!4187 lt!377551 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!463998 () ListLongMap!8901)

(assert (=> d!106163 (= lt!377551 e!463998)))

(declare-fun c!90395 () Bool)

(assert (=> d!106163 (= c!90395 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!106163 (validMask!0 mask!1312)))

(assert (=> d!106163 (= (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796) lt!377551)))

(declare-fun b!831988 () Bool)

(declare-fun e!464003 () Bool)

(declare-fun e!463999 () Bool)

(assert (=> b!831988 (= e!464003 e!463999)))

(assert (=> b!831988 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun res!566157 () Bool)

(assert (=> b!831988 (= res!566157 (contains!4187 lt!377551 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831988 (=> (not res!566157) (not e!463999))))

(declare-fun b!831989 () Bool)

(declare-fun res!566158 () Bool)

(assert (=> b!831989 (=> (not res!566158) (not e!464001))))

(assert (=> b!831989 (= res!566158 (not (contains!4187 lt!377551 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!831990 () Bool)

(declare-fun e!464002 () Bool)

(assert (=> b!831990 (= e!464002 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!831990 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!831991 () Bool)

(assert (=> b!831991 (= e!464001 e!464003)))

(declare-fun c!90394 () Bool)

(assert (=> b!831991 (= c!90394 e!464002)))

(declare-fun res!566156 () Bool)

(assert (=> b!831991 (=> (not res!566156) (not e!464002))))

(assert (=> b!831991 (= res!566156 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun bm!36342 () Bool)

(declare-fun call!36345 () ListLongMap!8901)

(assert (=> bm!36342 (= call!36345 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!831992 () Bool)

(declare-fun e!464004 () Bool)

(assert (=> b!831992 (= e!464004 (= lt!377551 (getCurrentListMapNoExtraKeys!2536 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!831993 () Bool)

(declare-fun lt!377552 () Unit!28446)

(declare-fun lt!377549 () Unit!28446)

(assert (=> b!831993 (= lt!377552 lt!377549)))

(declare-fun lt!377555 () V!25275)

(declare-fun lt!377553 () (_ BitVec 64))

(declare-fun lt!377554 () ListLongMap!8901)

(declare-fun lt!377550 () (_ BitVec 64))

(assert (=> b!831993 (not (contains!4187 (+!1988 lt!377554 (tuple2!10077 lt!377550 lt!377555)) lt!377553))))

(assert (=> b!831993 (= lt!377549 (addStillNotContains!199 lt!377554 lt!377550 lt!377555 lt!377553))))

(assert (=> b!831993 (= lt!377553 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!831993 (= lt!377555 (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!831993 (= lt!377550 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!831993 (= lt!377554 call!36345)))

(declare-fun e!464000 () ListLongMap!8901)

(assert (=> b!831993 (= e!464000 (+!1988 call!36345 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!831994 () Bool)

(assert (=> b!831994 (= e!464003 e!464004)))

(declare-fun c!90393 () Bool)

(assert (=> b!831994 (= c!90393 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!831995 () Bool)

(assert (=> b!831995 (= e!463998 (ListLongMap!8902 Nil!15843))))

(declare-fun b!831996 () Bool)

(assert (=> b!831996 (= e!464000 call!36345)))

(declare-fun b!831997 () Bool)

(assert (=> b!831997 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> b!831997 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22746 _values!788)))))

(assert (=> b!831997 (= e!463999 (= (apply!372 lt!377551 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!831998 () Bool)

(assert (=> b!831998 (= e!463998 e!464000)))

(declare-fun c!90396 () Bool)

(assert (=> b!831998 (= c!90396 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!831999 () Bool)

(assert (=> b!831999 (= e!464004 (isEmpty!660 lt!377551))))

(assert (= (and d!106163 c!90395) b!831995))

(assert (= (and d!106163 (not c!90395)) b!831998))

(assert (= (and b!831998 c!90396) b!831993))

(assert (= (and b!831998 (not c!90396)) b!831996))

(assert (= (or b!831993 b!831996) bm!36342))

(assert (= (and d!106163 res!566159) b!831989))

(assert (= (and b!831989 res!566158) b!831991))

(assert (= (and b!831991 res!566156) b!831990))

(assert (= (and b!831991 c!90394) b!831988))

(assert (= (and b!831991 (not c!90394)) b!831994))

(assert (= (and b!831988 res!566157) b!831997))

(assert (= (and b!831994 c!90393) b!831992))

(assert (= (and b!831994 (not c!90393)) b!831999))

(declare-fun b_lambda!11405 () Bool)

(assert (=> (not b_lambda!11405) (not b!831993)))

(assert (=> b!831993 t!22210))

(declare-fun b_and!22565 () Bool)

(assert (= b_and!22563 (and (=> t!22210 result!8007) b_and!22565)))

(declare-fun b_lambda!11407 () Bool)

(assert (=> (not b_lambda!11407) (not b!831997)))

(assert (=> b!831997 t!22210))

(declare-fun b_and!22567 () Bool)

(assert (= b_and!22565 (and (=> t!22210 result!8007) b_and!22567)))

(assert (=> b!831988 m!775643))

(assert (=> b!831988 m!775643))

(declare-fun m!775993 () Bool)

(assert (=> b!831988 m!775993))

(declare-fun m!775995 () Bool)

(assert (=> b!831989 m!775995))

(declare-fun m!775997 () Bool)

(assert (=> b!831993 m!775997))

(declare-fun m!775999 () Bool)

(assert (=> b!831993 m!775999))

(assert (=> b!831993 m!774637))

(assert (=> b!831993 m!775999))

(declare-fun m!776001 () Bool)

(assert (=> b!831993 m!776001))

(assert (=> b!831993 m!775879))

(assert (=> b!831993 m!775643))

(assert (=> b!831993 m!775879))

(assert (=> b!831993 m!774637))

(assert (=> b!831993 m!775881))

(declare-fun m!776003 () Bool)

(assert (=> b!831993 m!776003))

(assert (=> b!831990 m!775643))

(assert (=> b!831990 m!775643))

(assert (=> b!831990 m!775651))

(declare-fun m!776005 () Bool)

(assert (=> d!106163 m!776005))

(assert (=> d!106163 m!774527))

(assert (=> b!831998 m!775643))

(assert (=> b!831998 m!775643))

(assert (=> b!831998 m!775651))

(declare-fun m!776007 () Bool)

(assert (=> b!831999 m!776007))

(declare-fun m!776009 () Bool)

(assert (=> bm!36342 m!776009))

(assert (=> b!831997 m!775879))

(assert (=> b!831997 m!774637))

(assert (=> b!831997 m!775881))

(assert (=> b!831997 m!774637))

(assert (=> b!831997 m!775643))

(declare-fun m!776011 () Bool)

(assert (=> b!831997 m!776011))

(assert (=> b!831997 m!775879))

(assert (=> b!831997 m!775643))

(assert (=> b!831992 m!776009))

(assert (=> b!831351 d!106163))

(declare-fun d!106165 () Bool)

(declare-fun e!464006 () Bool)

(assert (=> d!106165 e!464006))

(declare-fun res!566160 () Bool)

(assert (=> d!106165 (=> res!566160 e!464006)))

(declare-fun lt!377558 () Bool)

(assert (=> d!106165 (= res!566160 (not lt!377558))))

(declare-fun lt!377557 () Bool)

(assert (=> d!106165 (= lt!377558 lt!377557)))

(declare-fun lt!377556 () Unit!28446)

(declare-fun e!464005 () Unit!28446)

(assert (=> d!106165 (= lt!377556 e!464005)))

(declare-fun c!90397 () Bool)

(assert (=> d!106165 (= c!90397 lt!377557)))

(assert (=> d!106165 (= lt!377557 (containsKey!401 (toList!4466 lt!377298) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(assert (=> d!106165 (= (contains!4187 lt!377298 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377558)))

(declare-fun b!832000 () Bool)

(declare-fun lt!377559 () Unit!28446)

(assert (=> b!832000 (= e!464005 lt!377559)))

(assert (=> b!832000 (= lt!377559 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377298) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(assert (=> b!832000 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377298) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun b!832001 () Bool)

(declare-fun Unit!28484 () Unit!28446)

(assert (=> b!832001 (= e!464005 Unit!28484)))

(declare-fun b!832002 () Bool)

(assert (=> b!832002 (= e!464006 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377298) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(assert (= (and d!106165 c!90397) b!832000))

(assert (= (and d!106165 (not c!90397)) b!832001))

(assert (= (and d!106165 (not res!566160)) b!832002))

(declare-fun m!776013 () Bool)

(assert (=> d!106165 m!776013))

(declare-fun m!776015 () Bool)

(assert (=> b!832000 m!776015))

(assert (=> b!832000 m!775039))

(assert (=> b!832000 m!775039))

(declare-fun m!776017 () Bool)

(assert (=> b!832000 m!776017))

(assert (=> b!832002 m!775039))

(assert (=> b!832002 m!775039))

(assert (=> b!832002 m!776017))

(assert (=> d!105739 d!106165))

(declare-fun b!832004 () Bool)

(declare-fun e!464007 () Option!422)

(declare-fun e!464008 () Option!422)

(assert (=> b!832004 (= e!464007 e!464008)))

(declare-fun c!90399 () Bool)

(assert (=> b!832004 (= c!90399 (and ((_ is Cons!15842) lt!377300) (not (= (_1!5049 (h!16977 lt!377300)) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))))

(declare-fun b!832005 () Bool)

(assert (=> b!832005 (= e!464008 (getValueByKey!416 (t!22203 lt!377300) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun d!106167 () Bool)

(declare-fun c!90398 () Bool)

(assert (=> d!106167 (= c!90398 (and ((_ is Cons!15842) lt!377300) (= (_1!5049 (h!16977 lt!377300)) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(assert (=> d!106167 (= (getValueByKey!416 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) e!464007)))

(declare-fun b!832003 () Bool)

(assert (=> b!832003 (= e!464007 (Some!421 (_2!5049 (h!16977 lt!377300))))))

(declare-fun b!832006 () Bool)

(assert (=> b!832006 (= e!464008 None!420)))

(assert (= (and d!106167 c!90398) b!832003))

(assert (= (and d!106167 (not c!90398)) b!832004))

(assert (= (and b!832004 c!90399) b!832005))

(assert (= (and b!832004 (not c!90399)) b!832006))

(declare-fun m!776019 () Bool)

(assert (=> b!832005 m!776019))

(assert (=> d!105739 d!106167))

(declare-fun d!106169 () Bool)

(assert (=> d!106169 (= (getValueByKey!416 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun lt!377560 () Unit!28446)

(assert (=> d!106169 (= lt!377560 (choose!1423 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun e!464009 () Bool)

(assert (=> d!106169 e!464009))

(declare-fun res!566161 () Bool)

(assert (=> d!106169 (=> (not res!566161) (not e!464009))))

(assert (=> d!106169 (= res!566161 (isStrictlySorted!429 lt!377300))))

(assert (=> d!106169 (= (lemmaContainsTupThenGetReturnValue!230 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377560)))

(declare-fun b!832007 () Bool)

(declare-fun res!566162 () Bool)

(assert (=> b!832007 (=> (not res!566162) (not e!464009))))

(assert (=> b!832007 (= res!566162 (containsKey!401 lt!377300 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun b!832008 () Bool)

(assert (=> b!832008 (= e!464009 (contains!4188 lt!377300 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(assert (= (and d!106169 res!566161) b!832007))

(assert (= (and b!832007 res!566162) b!832008))

(assert (=> d!106169 m!775033))

(declare-fun m!776021 () Bool)

(assert (=> d!106169 m!776021))

(declare-fun m!776023 () Bool)

(assert (=> d!106169 m!776023))

(declare-fun m!776025 () Bool)

(assert (=> b!832007 m!776025))

(declare-fun m!776027 () Bool)

(assert (=> b!832008 m!776027))

(assert (=> d!105739 d!106169))

(declare-fun bm!36343 () Bool)

(declare-fun call!36346 () List!15846)

(declare-fun call!36347 () List!15846)

(assert (=> bm!36343 (= call!36346 call!36347)))

(declare-fun bm!36344 () Bool)

(declare-fun call!36348 () List!15846)

(assert (=> bm!36344 (= call!36347 call!36348)))

(declare-fun d!106171 () Bool)

(declare-fun e!464012 () Bool)

(assert (=> d!106171 e!464012))

(declare-fun res!566164 () Bool)

(assert (=> d!106171 (=> (not res!566164) (not e!464012))))

(declare-fun lt!377561 () List!15846)

(assert (=> d!106171 (= res!566164 (isStrictlySorted!429 lt!377561))))

(declare-fun e!464013 () List!15846)

(assert (=> d!106171 (= lt!377561 e!464013)))

(declare-fun c!90401 () Bool)

(assert (=> d!106171 (= c!90401 (and ((_ is Cons!15842) (toList!4466 lt!377192)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377192))) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(assert (=> d!106171 (isStrictlySorted!429 (toList!4466 lt!377192))))

(assert (=> d!106171 (= (insertStrictlySorted!269 (toList!4466 lt!377192) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377561)))

(declare-fun e!464014 () List!15846)

(declare-fun b!832009 () Bool)

(declare-fun c!90402 () Bool)

(declare-fun c!90403 () Bool)

(assert (=> b!832009 (= e!464014 (ite c!90403 (t!22203 (toList!4466 lt!377192)) (ite c!90402 (Cons!15842 (h!16977 (toList!4466 lt!377192)) (t!22203 (toList!4466 lt!377192))) Nil!15843)))))

(declare-fun b!832010 () Bool)

(declare-fun e!464011 () List!15846)

(assert (=> b!832010 (= e!464011 call!36346)))

(declare-fun b!832011 () Bool)

(assert (=> b!832011 (= e!464011 call!36346)))

(declare-fun b!832012 () Bool)

(declare-fun e!464010 () List!15846)

(assert (=> b!832012 (= e!464010 call!36347)))

(declare-fun bm!36345 () Bool)

(assert (=> bm!36345 (= call!36348 ($colon$colon!533 e!464014 (ite c!90401 (h!16977 (toList!4466 lt!377192)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))))

(declare-fun c!90400 () Bool)

(assert (=> bm!36345 (= c!90400 c!90401)))

(declare-fun b!832013 () Bool)

(assert (=> b!832013 (= e!464014 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377192)) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun b!832014 () Bool)

(declare-fun res!566163 () Bool)

(assert (=> b!832014 (=> (not res!566163) (not e!464012))))

(assert (=> b!832014 (= res!566163 (containsKey!401 lt!377561 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun b!832015 () Bool)

(assert (=> b!832015 (= e!464013 e!464010)))

(assert (=> b!832015 (= c!90403 (and ((_ is Cons!15842) (toList!4466 lt!377192)) (= (_1!5049 (h!16977 (toList!4466 lt!377192))) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(declare-fun b!832016 () Bool)

(assert (=> b!832016 (= e!464012 (contains!4188 lt!377561 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(declare-fun b!832017 () Bool)

(assert (=> b!832017 (= e!464013 call!36348)))

(declare-fun b!832018 () Bool)

(assert (=> b!832018 (= c!90402 (and ((_ is Cons!15842) (toList!4466 lt!377192)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377192))) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(assert (=> b!832018 (= e!464010 e!464011)))

(assert (= (and d!106171 c!90401) b!832017))

(assert (= (and d!106171 (not c!90401)) b!832015))

(assert (= (and b!832015 c!90403) b!832012))

(assert (= (and b!832015 (not c!90403)) b!832018))

(assert (= (and b!832018 c!90402) b!832010))

(assert (= (and b!832018 (not c!90402)) b!832011))

(assert (= (or b!832010 b!832011) bm!36343))

(assert (= (or b!832012 bm!36343) bm!36344))

(assert (= (or b!832017 bm!36344) bm!36345))

(assert (= (and bm!36345 c!90400) b!832013))

(assert (= (and bm!36345 (not c!90400)) b!832009))

(assert (= (and d!106171 res!566164) b!832014))

(assert (= (and b!832014 res!566163) b!832016))

(declare-fun m!776029 () Bool)

(assert (=> d!106171 m!776029))

(declare-fun m!776031 () Bool)

(assert (=> d!106171 m!776031))

(declare-fun m!776033 () Bool)

(assert (=> bm!36345 m!776033))

(declare-fun m!776035 () Bool)

(assert (=> b!832013 m!776035))

(declare-fun m!776037 () Bool)

(assert (=> b!832014 m!776037))

(declare-fun m!776039 () Bool)

(assert (=> b!832016 m!776039))

(assert (=> d!105739 d!106171))

(declare-fun d!106173 () Bool)

(assert (=> d!106173 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377562 () Unit!28446)

(assert (=> d!106173 (= lt!377562 (choose!1427 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464015 () Bool)

(assert (=> d!106173 e!464015))

(declare-fun res!566165 () Bool)

(assert (=> d!106173 (=> (not res!566165) (not e!464015))))

(assert (=> d!106173 (= res!566165 (isStrictlySorted!429 (toList!4466 lt!377180)))))

(assert (=> d!106173 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377562)))

(declare-fun b!832019 () Bool)

(assert (=> b!832019 (= e!464015 (containsKey!401 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106173 res!566165) b!832019))

(assert (=> d!106173 m!774611))

(assert (=> d!106173 m!774923))

(assert (=> d!106173 m!774923))

(assert (=> d!106173 m!775323))

(assert (=> d!106173 m!774611))

(declare-fun m!776041 () Bool)

(assert (=> d!106173 m!776041))

(declare-fun m!776043 () Bool)

(assert (=> d!106173 m!776043))

(assert (=> b!832019 m!774611))

(assert (=> b!832019 m!775319))

(assert (=> b!831542 d!106173))

(declare-fun d!106175 () Bool)

(assert (=> d!106175 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23247 () Bool)

(assert (= bs!23247 d!106175))

(assert (=> bs!23247 m!774923))

(declare-fun m!776045 () Bool)

(assert (=> bs!23247 m!776045))

(assert (=> b!831542 d!106175))

(declare-fun b!832021 () Bool)

(declare-fun e!464016 () Option!422)

(declare-fun e!464017 () Option!422)

(assert (=> b!832021 (= e!464016 e!464017)))

(declare-fun c!90405 () Bool)

(assert (=> b!832021 (= c!90405 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377180))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832022 () Bool)

(assert (=> b!832022 (= e!464017 (getValueByKey!416 (t!22203 (toList!4466 lt!377180)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!106177 () Bool)

(declare-fun c!90404 () Bool)

(assert (=> d!106177 (= c!90404 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (= (_1!5049 (h!16977 (toList!4466 lt!377180))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106177 (= (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!464016)))

(declare-fun b!832020 () Bool)

(assert (=> b!832020 (= e!464016 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377180)))))))

(declare-fun b!832023 () Bool)

(assert (=> b!832023 (= e!464017 None!420)))

(assert (= (and d!106177 c!90404) b!832020))

(assert (= (and d!106177 (not c!90404)) b!832021))

(assert (= (and b!832021 c!90405) b!832022))

(assert (= (and b!832021 (not c!90405)) b!832023))

(assert (=> b!832022 m!774611))

(declare-fun m!776047 () Bool)

(assert (=> b!832022 m!776047))

(assert (=> b!831542 d!106177))

(assert (=> b!831399 d!106017))

(assert (=> b!831399 d!105905))

(declare-fun b!832025 () Bool)

(declare-fun e!464018 () Option!422)

(declare-fun e!464019 () Option!422)

(assert (=> b!832025 (= e!464018 e!464019)))

(declare-fun c!90407 () Bool)

(assert (=> b!832025 (= c!90407 (and ((_ is Cons!15842) (toList!4466 lt!377298)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377298))) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))))

(declare-fun b!832026 () Bool)

(assert (=> b!832026 (= e!464019 (getValueByKey!416 (t!22203 (toList!4466 lt!377298)) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))))))

(declare-fun c!90406 () Bool)

(declare-fun d!106179 () Bool)

(assert (=> d!106179 (= c!90406 (and ((_ is Cons!15842) (toList!4466 lt!377298)) (= (_1!5049 (h!16977 (toList!4466 lt!377298))) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))

(assert (=> d!106179 (= (getValueByKey!416 (toList!4466 lt!377298) (_1!5049 (tuple2!10077 lt!377200 zeroValueAfter!34))) e!464018)))

(declare-fun b!832024 () Bool)

(assert (=> b!832024 (= e!464018 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377298)))))))

(declare-fun b!832027 () Bool)

(assert (=> b!832027 (= e!464019 None!420)))

(assert (= (and d!106179 c!90406) b!832024))

(assert (= (and d!106179 (not c!90406)) b!832025))

(assert (= (and b!832025 c!90407) b!832026))

(assert (= (and b!832025 (not c!90407)) b!832027))

(declare-fun m!776049 () Bool)

(assert (=> b!832026 m!776049))

(assert (=> b!831457 d!106179))

(declare-fun d!106181 () Bool)

(declare-fun res!566166 () Bool)

(declare-fun e!464020 () Bool)

(assert (=> d!106181 (=> res!566166 e!464020)))

(assert (=> d!106181 (= res!566166 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (= (_1!5049 (h!16977 (toList!4466 lt!377202))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106181 (= (containsKey!401 (toList!4466 lt!377202) #b1000000000000000000000000000000000000000000000000000000000000000) e!464020)))

(declare-fun b!832028 () Bool)

(declare-fun e!464021 () Bool)

(assert (=> b!832028 (= e!464020 e!464021)))

(declare-fun res!566167 () Bool)

(assert (=> b!832028 (=> (not res!566167) (not e!464021))))

(assert (=> b!832028 (= res!566167 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377202))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377202))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377202)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377202))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832029 () Bool)

(assert (=> b!832029 (= e!464021 (containsKey!401 (t!22203 (toList!4466 lt!377202)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106181 (not res!566166)) b!832028))

(assert (= (and b!832028 res!566167) b!832029))

(declare-fun m!776051 () Bool)

(assert (=> b!832029 m!776051))

(assert (=> d!105895 d!106181))

(declare-fun d!106183 () Bool)

(declare-fun res!566168 () Bool)

(declare-fun e!464022 () Bool)

(assert (=> d!106183 (=> res!566168 e!464022)))

(assert (=> d!106183 (= res!566168 (and ((_ is Cons!15842) lt!377110) (= (_1!5049 (h!16977 lt!377110)) (_1!5049 lt!377010))))))

(assert (=> d!106183 (= (containsKey!401 lt!377110 (_1!5049 lt!377010)) e!464022)))

(declare-fun b!832030 () Bool)

(declare-fun e!464023 () Bool)

(assert (=> b!832030 (= e!464022 e!464023)))

(declare-fun res!566169 () Bool)

(assert (=> b!832030 (=> (not res!566169) (not e!464023))))

(assert (=> b!832030 (= res!566169 (and (or (not ((_ is Cons!15842) lt!377110)) (bvsle (_1!5049 (h!16977 lt!377110)) (_1!5049 lt!377010))) ((_ is Cons!15842) lt!377110) (bvslt (_1!5049 (h!16977 lt!377110)) (_1!5049 lt!377010))))))

(declare-fun b!832031 () Bool)

(assert (=> b!832031 (= e!464023 (containsKey!401 (t!22203 lt!377110) (_1!5049 lt!377010)))))

(assert (= (and d!106183 (not res!566168)) b!832030))

(assert (= (and b!832030 res!566169) b!832031))

(declare-fun m!776053 () Bool)

(assert (=> b!832031 m!776053))

(assert (=> b!831408 d!106183))

(declare-fun lt!377563 () Bool)

(declare-fun d!106185 () Bool)

(assert (=> d!106185 (= lt!377563 (select (content!386 (toList!4466 lt!377382)) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!464025 () Bool)

(assert (=> d!106185 (= lt!377563 e!464025)))

(declare-fun res!566170 () Bool)

(assert (=> d!106185 (=> (not res!566170) (not e!464025))))

(assert (=> d!106185 (= res!566170 ((_ is Cons!15842) (toList!4466 lt!377382)))))

(assert (=> d!106185 (= (contains!4188 (toList!4466 lt!377382) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377563)))

(declare-fun b!832032 () Bool)

(declare-fun e!464024 () Bool)

(assert (=> b!832032 (= e!464025 e!464024)))

(declare-fun res!566171 () Bool)

(assert (=> b!832032 (=> res!566171 e!464024)))

(assert (=> b!832032 (= res!566171 (= (h!16977 (toList!4466 lt!377382)) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!832033 () Bool)

(assert (=> b!832033 (= e!464024 (contains!4188 (t!22203 (toList!4466 lt!377382)) (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106185 res!566170) b!832032))

(assert (= (and b!832032 (not res!566171)) b!832033))

(declare-fun m!776055 () Bool)

(assert (=> d!106185 m!776055))

(declare-fun m!776057 () Bool)

(assert (=> d!106185 m!776057))

(declare-fun m!776059 () Bool)

(assert (=> b!832033 m!776059))

(assert (=> b!831548 d!106185))

(declare-fun d!106187 () Bool)

(declare-fun e!464027 () Bool)

(assert (=> d!106187 e!464027))

(declare-fun res!566172 () Bool)

(assert (=> d!106187 (=> res!566172 e!464027)))

(declare-fun lt!377566 () Bool)

(assert (=> d!106187 (= res!566172 (not lt!377566))))

(declare-fun lt!377565 () Bool)

(assert (=> d!106187 (= lt!377566 lt!377565)))

(declare-fun lt!377564 () Unit!28446)

(declare-fun e!464026 () Unit!28446)

(assert (=> d!106187 (= lt!377564 e!464026)))

(declare-fun c!90408 () Bool)

(assert (=> d!106187 (= c!90408 lt!377565)))

(assert (=> d!106187 (= lt!377565 (containsKey!401 (toList!4466 lt!377356) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(assert (=> d!106187 (= (contains!4187 lt!377356 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377566)))

(declare-fun b!832034 () Bool)

(declare-fun lt!377567 () Unit!28446)

(assert (=> b!832034 (= e!464026 lt!377567)))

(assert (=> b!832034 (= lt!377567 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377356) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(assert (=> b!832034 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377356) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun b!832035 () Bool)

(declare-fun Unit!28485 () Unit!28446)

(assert (=> b!832035 (= e!464026 Unit!28485)))

(declare-fun b!832036 () Bool)

(assert (=> b!832036 (= e!464027 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377356) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (= (and d!106187 c!90408) b!832034))

(assert (= (and d!106187 (not c!90408)) b!832035))

(assert (= (and d!106187 (not res!566172)) b!832036))

(declare-fun m!776061 () Bool)

(assert (=> d!106187 m!776061))

(declare-fun m!776063 () Bool)

(assert (=> b!832034 m!776063))

(assert (=> b!832034 m!775249))

(assert (=> b!832034 m!775249))

(declare-fun m!776065 () Bool)

(assert (=> b!832034 m!776065))

(assert (=> b!832036 m!775249))

(assert (=> b!832036 m!775249))

(assert (=> b!832036 m!776065))

(assert (=> d!105809 d!106187))

(declare-fun b!832038 () Bool)

(declare-fun e!464028 () Option!422)

(declare-fun e!464029 () Option!422)

(assert (=> b!832038 (= e!464028 e!464029)))

(declare-fun c!90410 () Bool)

(assert (=> b!832038 (= c!90410 (and ((_ is Cons!15842) lt!377358) (not (= (_1!5049 (h!16977 lt!377358)) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))))

(declare-fun b!832039 () Bool)

(assert (=> b!832039 (= e!464029 (getValueByKey!416 (t!22203 lt!377358) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun c!90409 () Bool)

(declare-fun d!106189 () Bool)

(assert (=> d!106189 (= c!90409 (and ((_ is Cons!15842) lt!377358) (= (_1!5049 (h!16977 lt!377358)) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (=> d!106189 (= (getValueByKey!416 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) e!464028)))

(declare-fun b!832037 () Bool)

(assert (=> b!832037 (= e!464028 (Some!421 (_2!5049 (h!16977 lt!377358))))))

(declare-fun b!832040 () Bool)

(assert (=> b!832040 (= e!464029 None!420)))

(assert (= (and d!106189 c!90409) b!832037))

(assert (= (and d!106189 (not c!90409)) b!832038))

(assert (= (and b!832038 c!90410) b!832039))

(assert (= (and b!832038 (not c!90410)) b!832040))

(declare-fun m!776067 () Bool)

(assert (=> b!832039 m!776067))

(assert (=> d!105809 d!106189))

(declare-fun d!106191 () Bool)

(assert (=> d!106191 (= (getValueByKey!416 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun lt!377568 () Unit!28446)

(assert (=> d!106191 (= lt!377568 (choose!1423 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun e!464030 () Bool)

(assert (=> d!106191 e!464030))

(declare-fun res!566173 () Bool)

(assert (=> d!106191 (=> (not res!566173) (not e!464030))))

(assert (=> d!106191 (= res!566173 (isStrictlySorted!429 lt!377358))))

(assert (=> d!106191 (= (lemmaContainsTupThenGetReturnValue!230 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377568)))

(declare-fun b!832041 () Bool)

(declare-fun res!566174 () Bool)

(assert (=> b!832041 (=> (not res!566174) (not e!464030))))

(assert (=> b!832041 (= res!566174 (containsKey!401 lt!377358 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun b!832042 () Bool)

(assert (=> b!832042 (= e!464030 (contains!4188 lt!377358 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (= (and d!106191 res!566173) b!832041))

(assert (= (and b!832041 res!566174) b!832042))

(assert (=> d!106191 m!775243))

(declare-fun m!776069 () Bool)

(assert (=> d!106191 m!776069))

(declare-fun m!776071 () Bool)

(assert (=> d!106191 m!776071))

(declare-fun m!776073 () Bool)

(assert (=> b!832041 m!776073))

(declare-fun m!776075 () Bool)

(assert (=> b!832042 m!776075))

(assert (=> d!105809 d!106191))

(declare-fun bm!36346 () Bool)

(declare-fun call!36349 () List!15846)

(declare-fun call!36350 () List!15846)

(assert (=> bm!36346 (= call!36349 call!36350)))

(declare-fun bm!36347 () Bool)

(declare-fun call!36351 () List!15846)

(assert (=> bm!36347 (= call!36350 call!36351)))

(declare-fun d!106193 () Bool)

(declare-fun e!464033 () Bool)

(assert (=> d!106193 e!464033))

(declare-fun res!566176 () Bool)

(assert (=> d!106193 (=> (not res!566176) (not e!464033))))

(declare-fun lt!377569 () List!15846)

(assert (=> d!106193 (= res!566176 (isStrictlySorted!429 lt!377569))))

(declare-fun e!464034 () List!15846)

(assert (=> d!106193 (= lt!377569 e!464034)))

(declare-fun c!90412 () Bool)

(assert (=> d!106193 (= c!90412 (and ((_ is Cons!15842) (toList!4466 lt!377168)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377168))) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (=> d!106193 (isStrictlySorted!429 (toList!4466 lt!377168))))

(assert (=> d!106193 (= (insertStrictlySorted!269 (toList!4466 lt!377168) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) lt!377569)))

(declare-fun c!90413 () Bool)

(declare-fun e!464035 () List!15846)

(declare-fun b!832043 () Bool)

(declare-fun c!90414 () Bool)

(assert (=> b!832043 (= e!464035 (ite c!90414 (t!22203 (toList!4466 lt!377168)) (ite c!90413 (Cons!15842 (h!16977 (toList!4466 lt!377168)) (t!22203 (toList!4466 lt!377168))) Nil!15843)))))

(declare-fun b!832044 () Bool)

(declare-fun e!464032 () List!15846)

(assert (=> b!832044 (= e!464032 call!36349)))

(declare-fun b!832045 () Bool)

(assert (=> b!832045 (= e!464032 call!36349)))

(declare-fun b!832046 () Bool)

(declare-fun e!464031 () List!15846)

(assert (=> b!832046 (= e!464031 call!36350)))

(declare-fun bm!36348 () Bool)

(assert (=> bm!36348 (= call!36351 ($colon$colon!533 e!464035 (ite c!90412 (h!16977 (toList!4466 lt!377168)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))))

(declare-fun c!90411 () Bool)

(assert (=> bm!36348 (= c!90411 c!90412)))

(declare-fun b!832047 () Bool)

(assert (=> b!832047 (= e!464035 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377168)) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun b!832048 () Bool)

(declare-fun res!566175 () Bool)

(assert (=> b!832048 (=> (not res!566175) (not e!464033))))

(assert (=> b!832048 (= res!566175 (containsKey!401 lt!377569 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun b!832049 () Bool)

(assert (=> b!832049 (= e!464034 e!464031)))

(assert (=> b!832049 (= c!90414 (and ((_ is Cons!15842) (toList!4466 lt!377168)) (= (_1!5049 (h!16977 (toList!4466 lt!377168))) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(declare-fun b!832050 () Bool)

(assert (=> b!832050 (= e!464033 (contains!4188 lt!377569 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(declare-fun b!832051 () Bool)

(assert (=> b!832051 (= e!464034 call!36351)))

(declare-fun b!832052 () Bool)

(assert (=> b!832052 (= c!90413 (and ((_ is Cons!15842) (toList!4466 lt!377168)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377168))) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (=> b!832052 (= e!464031 e!464032)))

(assert (= (and d!106193 c!90412) b!832051))

(assert (= (and d!106193 (not c!90412)) b!832049))

(assert (= (and b!832049 c!90414) b!832046))

(assert (= (and b!832049 (not c!90414)) b!832052))

(assert (= (and b!832052 c!90413) b!832044))

(assert (= (and b!832052 (not c!90413)) b!832045))

(assert (= (or b!832044 b!832045) bm!36346))

(assert (= (or b!832046 bm!36346) bm!36347))

(assert (= (or b!832051 bm!36347) bm!36348))

(assert (= (and bm!36348 c!90411) b!832047))

(assert (= (and bm!36348 (not c!90411)) b!832043))

(assert (= (and d!106193 res!566176) b!832048))

(assert (= (and b!832048 res!566175) b!832050))

(declare-fun m!776077 () Bool)

(assert (=> d!106193 m!776077))

(declare-fun m!776079 () Bool)

(assert (=> d!106193 m!776079))

(declare-fun m!776081 () Bool)

(assert (=> bm!36348 m!776081))

(declare-fun m!776083 () Bool)

(assert (=> b!832047 m!776083))

(declare-fun m!776085 () Bool)

(assert (=> b!832048 m!776085))

(declare-fun m!776087 () Bool)

(assert (=> b!832050 m!776087))

(assert (=> d!105809 d!106193))

(assert (=> d!105691 d!105693))

(declare-fun d!106195 () Bool)

(assert (=> d!106195 (arrayContainsKey!0 _keys!976 lt!377065 #b00000000000000000000000000000000)))

(assert (=> d!106195 true))

(declare-fun _$60!394 () Unit!28446)

(assert (=> d!106195 (= (choose!13 _keys!976 lt!377065 #b00000000000000000000000000000000) _$60!394)))

(declare-fun bs!23248 () Bool)

(assert (= bs!23248 d!106195))

(assert (=> bs!23248 m!774615))

(assert (=> d!105691 d!106195))

(assert (=> d!105827 d!105825))

(declare-fun d!106197 () Bool)

(assert (=> d!106197 (= (getValueByKey!416 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!106197 true))

(declare-fun _$22!572 () Unit!28446)

(assert (=> d!106197 (= (choose!1423 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) _$22!572)))

(declare-fun bs!23249 () Bool)

(assert (= bs!23249 d!106197))

(assert (=> bs!23249 m!774829))

(assert (=> d!105827 d!106197))

(declare-fun d!106199 () Bool)

(declare-fun res!566177 () Bool)

(declare-fun e!464036 () Bool)

(assert (=> d!106199 (=> res!566177 e!464036)))

(assert (=> d!106199 (= res!566177 (or ((_ is Nil!15843) lt!377218) ((_ is Nil!15843) (t!22203 lt!377218))))))

(assert (=> d!106199 (= (isStrictlySorted!429 lt!377218) e!464036)))

(declare-fun b!832053 () Bool)

(declare-fun e!464037 () Bool)

(assert (=> b!832053 (= e!464036 e!464037)))

(declare-fun res!566178 () Bool)

(assert (=> b!832053 (=> (not res!566178) (not e!464037))))

(assert (=> b!832053 (= res!566178 (bvslt (_1!5049 (h!16977 lt!377218)) (_1!5049 (h!16977 (t!22203 lt!377218)))))))

(declare-fun b!832054 () Bool)

(assert (=> b!832054 (= e!464037 (isStrictlySorted!429 (t!22203 lt!377218)))))

(assert (= (and d!106199 (not res!566177)) b!832053))

(assert (= (and b!832053 res!566178) b!832054))

(declare-fun m!776089 () Bool)

(assert (=> b!832054 m!776089))

(assert (=> d!105827 d!106199))

(declare-fun d!106201 () Bool)

(assert (=> d!106201 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!416 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105707 d!106201))

(assert (=> d!105707 d!106177))

(declare-fun d!106203 () Bool)

(assert (not d!106203))

(assert (=> b!831561 d!106203))

(declare-fun d!106205 () Bool)

(declare-fun lt!377570 () Bool)

(assert (=> d!106205 (= lt!377570 (select (content!386 (toList!4466 lt!377261)) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!464039 () Bool)

(assert (=> d!106205 (= lt!377570 e!464039)))

(declare-fun res!566179 () Bool)

(assert (=> d!106205 (=> (not res!566179) (not e!464039))))

(assert (=> d!106205 (= res!566179 ((_ is Cons!15842) (toList!4466 lt!377261)))))

(assert (=> d!106205 (= (contains!4188 (toList!4466 lt!377261) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377570)))

(declare-fun b!832055 () Bool)

(declare-fun e!464038 () Bool)

(assert (=> b!832055 (= e!464039 e!464038)))

(declare-fun res!566180 () Bool)

(assert (=> b!832055 (=> res!566180 e!464038)))

(assert (=> b!832055 (= res!566180 (= (h!16977 (toList!4466 lt!377261)) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!832056 () Bool)

(assert (=> b!832056 (= e!464038 (contains!4188 (t!22203 (toList!4466 lt!377261)) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106205 res!566179) b!832055))

(assert (= (and b!832055 (not res!566180)) b!832056))

(declare-fun m!776091 () Bool)

(assert (=> d!106205 m!776091))

(declare-fun m!776093 () Bool)

(assert (=> d!106205 m!776093))

(declare-fun m!776095 () Bool)

(assert (=> b!832056 m!776095))

(assert (=> b!831396 d!106205))

(declare-fun d!106207 () Bool)

(assert (=> d!106207 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377571 () Unit!28446)

(assert (=> d!106207 (= lt!377571 (choose!1427 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464040 () Bool)

(assert (=> d!106207 e!464040))

(declare-fun res!566181 () Bool)

(assert (=> d!106207 (=> (not res!566181) (not e!464040))))

(assert (=> d!106207 (= res!566181 (isStrictlySorted!429 (toList!4466 lt!377202)))))

(assert (=> d!106207 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377571)))

(declare-fun b!832057 () Bool)

(assert (=> b!832057 (= e!464040 (containsKey!401 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106207 res!566181) b!832057))

(assert (=> d!106207 m!774989))

(assert (=> d!106207 m!774989))

(assert (=> d!106207 m!774997))

(declare-fun m!776097 () Bool)

(assert (=> d!106207 m!776097))

(assert (=> d!106207 m!775781))

(assert (=> b!832057 m!774993))

(assert (=> b!831444 d!106207))

(declare-fun d!106209 () Bool)

(assert (=> d!106209 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23250 () Bool)

(assert (= bs!23250 d!106209))

(assert (=> bs!23250 m!774989))

(declare-fun m!776099 () Bool)

(assert (=> bs!23250 m!776099))

(assert (=> b!831444 d!106209))

(assert (=> b!831444 d!106113))

(declare-fun d!106211 () Bool)

(declare-fun lt!377572 () Bool)

(assert (=> d!106211 (= lt!377572 (select (content!386 lt!377372) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun e!464042 () Bool)

(assert (=> d!106211 (= lt!377572 e!464042)))

(declare-fun res!566182 () Bool)

(assert (=> d!106211 (=> (not res!566182) (not e!464042))))

(assert (=> d!106211 (= res!566182 ((_ is Cons!15842) lt!377372))))

(assert (=> d!106211 (= (contains!4188 lt!377372 (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) lt!377572)))

(declare-fun b!832058 () Bool)

(declare-fun e!464041 () Bool)

(assert (=> b!832058 (= e!464042 e!464041)))

(declare-fun res!566183 () Bool)

(assert (=> b!832058 (=> res!566183 e!464041)))

(assert (=> b!832058 (= res!566183 (= (h!16977 lt!377372) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832059 () Bool)

(assert (=> b!832059 (= e!464041 (contains!4188 (t!22203 lt!377372) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (= (and d!106211 res!566182) b!832058))

(assert (= (and b!832058 (not res!566183)) b!832059))

(declare-fun m!776101 () Bool)

(assert (=> d!106211 m!776101))

(declare-fun m!776103 () Bool)

(assert (=> d!106211 m!776103))

(declare-fun m!776105 () Bool)

(assert (=> b!832059 m!776105))

(assert (=> b!831539 d!106211))

(declare-fun d!106213 () Bool)

(declare-fun res!566184 () Bool)

(declare-fun e!464043 () Bool)

(assert (=> d!106213 (=> res!566184 e!464043)))

(assert (=> d!106213 (= res!566184 (or ((_ is Nil!15843) lt!377428) ((_ is Nil!15843) (t!22203 lt!377428))))))

(assert (=> d!106213 (= (isStrictlySorted!429 lt!377428) e!464043)))

(declare-fun b!832060 () Bool)

(declare-fun e!464044 () Bool)

(assert (=> b!832060 (= e!464043 e!464044)))

(declare-fun res!566185 () Bool)

(assert (=> b!832060 (=> (not res!566185) (not e!464044))))

(assert (=> b!832060 (= res!566185 (bvslt (_1!5049 (h!16977 lt!377428)) (_1!5049 (h!16977 (t!22203 lt!377428)))))))

(declare-fun b!832061 () Bool)

(assert (=> b!832061 (= e!464044 (isStrictlySorted!429 (t!22203 lt!377428)))))

(assert (= (and d!106213 (not res!566184)) b!832060))

(assert (= (and b!832060 res!566185) b!832061))

(declare-fun m!776107 () Bool)

(assert (=> b!832061 m!776107))

(assert (=> d!105883 d!106213))

(declare-fun d!106215 () Bool)

(declare-fun res!566186 () Bool)

(declare-fun e!464045 () Bool)

(assert (=> d!106215 (=> res!566186 e!464045)))

(assert (=> d!106215 (= res!566186 (or ((_ is Nil!15843) (toList!4466 (+!1988 lt!377014 lt!377012))) ((_ is Nil!15843) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012))))))))

(assert (=> d!106215 (= (isStrictlySorted!429 (toList!4466 (+!1988 lt!377014 lt!377012))) e!464045)))

(declare-fun b!832062 () Bool)

(declare-fun e!464046 () Bool)

(assert (=> b!832062 (= e!464045 e!464046)))

(declare-fun res!566187 () Bool)

(assert (=> b!832062 (=> (not res!566187) (not e!464046))))

(assert (=> b!832062 (= res!566187 (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012)))) (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))))))))

(declare-fun b!832063 () Bool)

(assert (=> b!832063 (= e!464046 (isStrictlySorted!429 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377012)))))))

(assert (= (and d!106215 (not res!566186)) b!832062))

(assert (= (and b!832062 res!566187) b!832063))

(assert (=> b!832063 m!775803))

(assert (=> d!105883 d!106215))

(declare-fun d!106217 () Bool)

(declare-fun res!566188 () Bool)

(declare-fun e!464047 () Bool)

(assert (=> d!106217 (=> res!566188 e!464047)))

(assert (=> d!106217 (= res!566188 (and ((_ is Cons!15842) (toList!4466 lt!377212)) (= (_1!5049 (h!16977 (toList!4466 lt!377212))) (_1!5049 lt!377012))))))

(assert (=> d!106217 (= (containsKey!401 (toList!4466 lt!377212) (_1!5049 lt!377012)) e!464047)))

(declare-fun b!832064 () Bool)

(declare-fun e!464048 () Bool)

(assert (=> b!832064 (= e!464047 e!464048)))

(declare-fun res!566189 () Bool)

(assert (=> b!832064 (=> (not res!566189) (not e!464048))))

(assert (=> b!832064 (= res!566189 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377212))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377212))) (_1!5049 lt!377012))) ((_ is Cons!15842) (toList!4466 lt!377212)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377212))) (_1!5049 lt!377012))))))

(declare-fun b!832065 () Bool)

(assert (=> b!832065 (= e!464048 (containsKey!401 (t!22203 (toList!4466 lt!377212)) (_1!5049 lt!377012)))))

(assert (= (and d!106217 (not res!566188)) b!832064))

(assert (= (and b!832064 res!566189) b!832065))

(declare-fun m!776109 () Bool)

(assert (=> b!832065 m!776109))

(assert (=> d!105843 d!106217))

(declare-fun d!106219 () Bool)

(assert (=> d!106219 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377573 () Unit!28446)

(assert (=> d!106219 (= lt!377573 (choose!1427 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464049 () Bool)

(assert (=> d!106219 e!464049))

(declare-fun res!566190 () Bool)

(assert (=> d!106219 (=> (not res!566190) (not e!464049))))

(assert (=> d!106219 (= res!566190 (isStrictlySorted!429 (toList!4466 lt!377087)))))

(assert (=> d!106219 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377573)))

(declare-fun b!832066 () Bool)

(assert (=> b!832066 (= e!464049 (containsKey!401 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106219 res!566190) b!832066))

(assert (=> d!106219 m!775177))

(assert (=> d!106219 m!775177))

(assert (=> d!106219 m!775179))

(declare-fun m!776111 () Bool)

(assert (=> d!106219 m!776111))

(assert (=> d!106219 m!775575))

(assert (=> b!832066 m!775173))

(assert (=> b!831503 d!106219))

(declare-fun d!106221 () Bool)

(assert (=> d!106221 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23251 () Bool)

(assert (= bs!23251 d!106221))

(assert (=> bs!23251 m!775177))

(declare-fun m!776113 () Bool)

(assert (=> bs!23251 m!776113))

(assert (=> b!831503 d!106221))

(declare-fun b!832068 () Bool)

(declare-fun e!464050 () Option!422)

(declare-fun e!464051 () Option!422)

(assert (=> b!832068 (= e!464050 e!464051)))

(declare-fun c!90416 () Bool)

(assert (=> b!832068 (= c!90416 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377087))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832069 () Bool)

(assert (=> b!832069 (= e!464051 (getValueByKey!416 (t!22203 (toList!4466 lt!377087)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!106223 () Bool)

(declare-fun c!90415 () Bool)

(assert (=> d!106223 (= c!90415 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (= (_1!5049 (h!16977 (toList!4466 lt!377087))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106223 (= (getValueByKey!416 (toList!4466 lt!377087) #b0000000000000000000000000000000000000000000000000000000000000000) e!464050)))

(declare-fun b!832067 () Bool)

(assert (=> b!832067 (= e!464050 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377087)))))))

(declare-fun b!832070 () Bool)

(assert (=> b!832070 (= e!464051 None!420)))

(assert (= (and d!106223 c!90415) b!832067))

(assert (= (and d!106223 (not c!90415)) b!832068))

(assert (= (and b!832068 c!90416) b!832069))

(assert (= (and b!832068 (not c!90416)) b!832070))

(declare-fun m!776115 () Bool)

(assert (=> b!832069 m!776115))

(assert (=> b!831503 d!106223))

(declare-fun d!106225 () Bool)

(assert (=> d!106225 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))

(declare-fun lt!377574 () Unit!28446)

(assert (=> d!106225 (= lt!377574 (choose!1427 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))

(declare-fun e!464052 () Bool)

(assert (=> d!106225 e!464052))

(declare-fun res!566191 () Bool)

(assert (=> d!106225 (=> (not res!566191) (not e!464052))))

(assert (=> d!106225 (= res!566191 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (=> d!106225 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198) lt!377574)))

(declare-fun b!832071 () Bool)

(assert (=> b!832071 (= e!464052 (containsKey!401 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))

(assert (= (and d!106225 res!566191) b!832071))

(assert (=> d!106225 m!775011))

(assert (=> d!106225 m!775011))

(assert (=> d!106225 m!775013))

(declare-fun m!776117 () Bool)

(assert (=> d!106225 m!776117))

(declare-fun m!776119 () Bool)

(assert (=> d!106225 m!776119))

(assert (=> b!832071 m!775007))

(assert (=> b!831451 d!106225))

(declare-fun d!106227 () Bool)

(assert (=> d!106227 (= (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198))))))

(declare-fun bs!23252 () Bool)

(assert (= bs!23252 d!106227))

(assert (=> bs!23252 m!775011))

(declare-fun m!776121 () Bool)

(assert (=> bs!23252 m!776121))

(assert (=> b!831451 d!106227))

(declare-fun b!832073 () Bool)

(declare-fun e!464053 () Option!422)

(declare-fun e!464054 () Option!422)

(assert (=> b!832073 (= e!464053 e!464054)))

(declare-fun c!90418 () Bool)

(assert (=> b!832073 (= c!90418 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))))) lt!377198))))))

(declare-fun b!832074 () Bool)

(assert (=> b!832074 (= e!464054 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))) lt!377198))))

(declare-fun d!106229 () Bool)

(declare-fun c!90417 () Bool)

(assert (=> d!106229 (= c!90417 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))))) lt!377198)))))

(assert (=> d!106229 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198) e!464053)))

(declare-fun b!832072 () Bool)

(assert (=> b!832072 (= e!464053 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))))

(declare-fun b!832075 () Bool)

(assert (=> b!832075 (= e!464054 None!420)))

(assert (= (and d!106229 c!90417) b!832072))

(assert (= (and d!106229 (not c!90417)) b!832073))

(assert (= (and b!832073 c!90418) b!832074))

(assert (= (and b!832073 (not c!90418)) b!832075))

(declare-fun m!776123 () Bool)

(assert (=> b!832074 m!776123))

(assert (=> b!831451 d!106229))

(declare-fun d!106231 () Bool)

(declare-fun res!566192 () Bool)

(declare-fun e!464055 () Bool)

(assert (=> d!106231 (=> res!566192 e!464055)))

(assert (=> d!106231 (= res!566192 (and ((_ is Cons!15842) (toList!4466 lt!377112)) (= (_1!5049 (h!16977 (toList!4466 lt!377112))) (_1!5049 lt!377012))))))

(assert (=> d!106231 (= (containsKey!401 (toList!4466 lt!377112) (_1!5049 lt!377012)) e!464055)))

(declare-fun b!832076 () Bool)

(declare-fun e!464056 () Bool)

(assert (=> b!832076 (= e!464055 e!464056)))

(declare-fun res!566193 () Bool)

(assert (=> b!832076 (=> (not res!566193) (not e!464056))))

(assert (=> b!832076 (= res!566193 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377112))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377112))) (_1!5049 lt!377012))) ((_ is Cons!15842) (toList!4466 lt!377112)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377112))) (_1!5049 lt!377012))))))

(declare-fun b!832077 () Bool)

(assert (=> b!832077 (= e!464056 (containsKey!401 (t!22203 (toList!4466 lt!377112)) (_1!5049 lt!377012)))))

(assert (= (and d!106231 (not res!566192)) b!832076))

(assert (= (and b!832076 res!566193) b!832077))

(declare-fun m!776125 () Bool)

(assert (=> b!832077 m!776125))

(assert (=> d!105885 d!106231))

(declare-fun d!106233 () Bool)

(assert (=> d!106233 (= (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377188)) (v!10095 (getValueByKey!416 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377188)))))

(assert (=> d!105743 d!106233))

(declare-fun b!832079 () Bool)

(declare-fun e!464057 () Option!422)

(declare-fun e!464058 () Option!422)

(assert (=> b!832079 (= e!464057 e!464058)))

(declare-fun c!90420 () Bool)

(assert (=> b!832079 (= c!90420 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34))))) lt!377188))))))

(declare-fun b!832080 () Bool)

(assert (=> b!832080 (= e!464058 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)))) lt!377188))))

(declare-fun d!106235 () Bool)

(declare-fun c!90419 () Bool)

(assert (=> d!106235 (= c!90419 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34))))) lt!377188)))))

(assert (=> d!106235 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34))) lt!377188) e!464057)))

(declare-fun b!832078 () Bool)

(assert (=> b!832078 (= e!464057 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)))))))))

(declare-fun b!832081 () Bool)

(assert (=> b!832081 (= e!464058 None!420)))

(assert (= (and d!106235 c!90419) b!832078))

(assert (= (and d!106235 (not c!90419)) b!832079))

(assert (= (and b!832079 c!90420) b!832080))

(assert (= (and b!832079 (not c!90420)) b!832081))

(declare-fun m!776127 () Bool)

(assert (=> b!832080 m!776127))

(assert (=> d!105743 d!106235))

(declare-fun d!106237 () Bool)

(assert (=> d!106237 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377204) lt!377193)) (v!10095 (getValueByKey!416 (toList!4466 lt!377204) lt!377193)))))

(assert (=> d!105757 d!106237))

(declare-fun b!832083 () Bool)

(declare-fun e!464059 () Option!422)

(declare-fun e!464060 () Option!422)

(assert (=> b!832083 (= e!464059 e!464060)))

(declare-fun c!90422 () Bool)

(assert (=> b!832083 (= c!90422 (and ((_ is Cons!15842) (toList!4466 lt!377204)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377204))) lt!377193))))))

(declare-fun b!832084 () Bool)

(assert (=> b!832084 (= e!464060 (getValueByKey!416 (t!22203 (toList!4466 lt!377204)) lt!377193))))

(declare-fun d!106239 () Bool)

(declare-fun c!90421 () Bool)

(assert (=> d!106239 (= c!90421 (and ((_ is Cons!15842) (toList!4466 lt!377204)) (= (_1!5049 (h!16977 (toList!4466 lt!377204))) lt!377193)))))

(assert (=> d!106239 (= (getValueByKey!416 (toList!4466 lt!377204) lt!377193) e!464059)))

(declare-fun b!832082 () Bool)

(assert (=> b!832082 (= e!464059 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377204)))))))

(declare-fun b!832085 () Bool)

(assert (=> b!832085 (= e!464060 None!420)))

(assert (= (and d!106239 c!90421) b!832082))

(assert (= (and d!106239 (not c!90421)) b!832083))

(assert (= (and b!832083 c!90422) b!832084))

(assert (= (and b!832083 (not c!90422)) b!832085))

(declare-fun m!776129 () Bool)

(assert (=> b!832084 m!776129))

(assert (=> d!105757 d!106239))

(declare-fun b!832086 () Bool)

(declare-fun e!464063 () Bool)

(declare-fun e!464061 () Bool)

(assert (=> b!832086 (= e!464063 e!464061)))

(declare-fun res!566196 () Bool)

(assert (=> b!832086 (=> (not res!566196) (not e!464061))))

(declare-fun e!464062 () Bool)

(assert (=> b!832086 (= res!566196 (not e!464062))))

(declare-fun res!566195 () Bool)

(assert (=> b!832086 (=> (not res!566195) (not e!464062))))

(assert (=> b!832086 (= res!566195 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!832087 () Bool)

(declare-fun e!464064 () Bool)

(declare-fun call!36352 () Bool)

(assert (=> b!832087 (= e!464064 call!36352)))

(declare-fun b!832088 () Bool)

(assert (=> b!832088 (= e!464062 (contains!4186 (ite c!90289 (Cons!15843 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!832089 () Bool)

(assert (=> b!832089 (= e!464061 e!464064)))

(declare-fun c!90423 () Bool)

(assert (=> b!832089 (= c!90423 (validKeyInArray!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!106241 () Bool)

(declare-fun res!566194 () Bool)

(assert (=> d!106241 (=> res!566194 e!464063)))

(assert (=> d!106241 (= res!566194 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(assert (=> d!106241 (= (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90289 (Cons!15843 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844))) e!464063)))

(declare-fun bm!36349 () Bool)

(assert (=> bm!36349 (= call!36352 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!90423 (Cons!15843 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!90289 (Cons!15843 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844))) (ite c!90289 (Cons!15843 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)) (ite c!90149 (Cons!15843 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) Nil!15844) Nil!15844)))))))

(declare-fun b!832090 () Bool)

(assert (=> b!832090 (= e!464064 call!36352)))

(assert (= (and d!106241 (not res!566194)) b!832086))

(assert (= (and b!832086 res!566195) b!832088))

(assert (= (and b!832086 res!566196) b!832089))

(assert (= (and b!832089 c!90423) b!832087))

(assert (= (and b!832089 (not c!90423)) b!832090))

(assert (= (or b!832087 b!832090) bm!36349))

(assert (=> b!832086 m!775643))

(assert (=> b!832086 m!775643))

(assert (=> b!832086 m!775651))

(assert (=> b!832088 m!775643))

(assert (=> b!832088 m!775643))

(declare-fun m!776131 () Bool)

(assert (=> b!832088 m!776131))

(assert (=> b!832089 m!775643))

(assert (=> b!832089 m!775643))

(assert (=> b!832089 m!775651))

(assert (=> bm!36349 m!775643))

(declare-fun m!776133 () Bool)

(assert (=> bm!36349 m!776133))

(assert (=> bm!36330 d!106241))

(declare-fun d!106243 () Bool)

(assert (=> d!106243 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377575 () Unit!28446)

(assert (=> d!106243 (= lt!377575 (choose!1427 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464065 () Bool)

(assert (=> d!106243 e!464065))

(declare-fun res!566197 () Bool)

(assert (=> d!106243 (=> (not res!566197) (not e!464065))))

(assert (=> d!106243 (= res!566197 (isStrictlySorted!429 (toList!4466 lt!377180)))))

(assert (=> d!106243 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377575)))

(declare-fun b!832091 () Bool)

(assert (=> b!832091 (= e!464065 (containsKey!401 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106243 res!566197) b!832091))

(assert (=> d!106243 m!775149))

(assert (=> d!106243 m!775149))

(assert (=> d!106243 m!775163))

(declare-fun m!776135 () Bool)

(assert (=> d!106243 m!776135))

(assert (=> d!106243 m!776043))

(assert (=> b!832091 m!775159))

(assert (=> b!831497 d!106243))

(declare-fun d!106245 () Bool)

(assert (=> d!106245 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23253 () Bool)

(assert (= bs!23253 d!106245))

(assert (=> bs!23253 m!775149))

(declare-fun m!776137 () Bool)

(assert (=> bs!23253 m!776137))

(assert (=> b!831497 d!106245))

(declare-fun b!832093 () Bool)

(declare-fun e!464066 () Option!422)

(declare-fun e!464067 () Option!422)

(assert (=> b!832093 (= e!464066 e!464067)))

(declare-fun c!90425 () Bool)

(assert (=> b!832093 (= c!90425 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377180))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832094 () Bool)

(assert (=> b!832094 (= e!464067 (getValueByKey!416 (t!22203 (toList!4466 lt!377180)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!106247 () Bool)

(declare-fun c!90424 () Bool)

(assert (=> d!106247 (= c!90424 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (= (_1!5049 (h!16977 (toList!4466 lt!377180))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106247 (= (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000) e!464066)))

(declare-fun b!832092 () Bool)

(assert (=> b!832092 (= e!464066 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377180)))))))

(declare-fun b!832095 () Bool)

(assert (=> b!832095 (= e!464067 None!420)))

(assert (= (and d!106247 c!90424) b!832092))

(assert (= (and d!106247 (not c!90424)) b!832093))

(assert (= (and b!832093 c!90425) b!832094))

(assert (= (and b!832093 (not c!90425)) b!832095))

(declare-fun m!776139 () Bool)

(assert (=> b!832094 m!776139))

(assert (=> b!831497 d!106247))

(declare-fun d!106249 () Bool)

(declare-fun res!566198 () Bool)

(declare-fun e!464068 () Bool)

(assert (=> d!106249 (=> res!566198 e!464068)))

(assert (=> d!106249 (= res!566198 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (= (_1!5049 (h!16977 (toList!4466 lt!377202))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106249 (= (containsKey!401 (toList!4466 lt!377202) #b0000000000000000000000000000000000000000000000000000000000000000) e!464068)))

(declare-fun b!832096 () Bool)

(declare-fun e!464069 () Bool)

(assert (=> b!832096 (= e!464068 e!464069)))

(declare-fun res!566199 () Bool)

(assert (=> b!832096 (=> (not res!566199) (not e!464069))))

(assert (=> b!832096 (= res!566199 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377202))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377202))) #b0000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377202)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377202))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832097 () Bool)

(assert (=> b!832097 (= e!464069 (containsKey!401 (t!22203 (toList!4466 lt!377202)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106249 (not res!566198)) b!832096))

(assert (= (and b!832096 res!566199) b!832097))

(declare-fun m!776141 () Bool)

(assert (=> b!832097 m!776141))

(assert (=> d!105727 d!106249))

(declare-fun d!106251 () Bool)

(assert (=> d!106251 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377576 () Unit!28446)

(assert (=> d!106251 (= lt!377576 (choose!1427 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464070 () Bool)

(assert (=> d!106251 e!464070))

(declare-fun res!566200 () Bool)

(assert (=> d!106251 (=> (not res!566200) (not e!464070))))

(assert (=> d!106251 (= res!566200 (isStrictlySorted!429 (toList!4466 lt!377094)))))

(assert (=> d!106251 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000) lt!377576)))

(declare-fun b!832098 () Bool)

(assert (=> b!832098 (= e!464070 (containsKey!401 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106251 res!566200) b!832098))

(assert (=> d!106251 m!775465))

(assert (=> d!106251 m!775465))

(assert (=> d!106251 m!775467))

(declare-fun m!776143 () Bool)

(assert (=> d!106251 m!776143))

(assert (=> d!106251 m!775749))

(assert (=> b!832098 m!775461))

(assert (=> b!831601 d!106251))

(declare-fun d!106253 () Bool)

(assert (=> d!106253 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bs!23254 () Bool)

(assert (= bs!23254 d!106253))

(assert (=> bs!23254 m!775465))

(declare-fun m!776145 () Bool)

(assert (=> bs!23254 m!776145))

(assert (=> b!831601 d!106253))

(declare-fun b!832100 () Bool)

(declare-fun e!464071 () Option!422)

(declare-fun e!464072 () Option!422)

(assert (=> b!832100 (= e!464071 e!464072)))

(declare-fun c!90427 () Bool)

(assert (=> b!832100 (= c!90427 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377094))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!832101 () Bool)

(assert (=> b!832101 (= e!464072 (getValueByKey!416 (t!22203 (toList!4466 lt!377094)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!106255 () Bool)

(declare-fun c!90426 () Bool)

(assert (=> d!106255 (= c!90426 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (= (_1!5049 (h!16977 (toList!4466 lt!377094))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106255 (= (getValueByKey!416 (toList!4466 lt!377094) #b0000000000000000000000000000000000000000000000000000000000000000) e!464071)))

(declare-fun b!832099 () Bool)

(assert (=> b!832099 (= e!464071 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377094)))))))

(declare-fun b!832102 () Bool)

(assert (=> b!832102 (= e!464072 None!420)))

(assert (= (and d!106255 c!90426) b!832099))

(assert (= (and d!106255 (not c!90426)) b!832100))

(assert (= (and b!832100 c!90427) b!832101))

(assert (= (and b!832100 (not c!90427)) b!832102))

(declare-fun m!776147 () Bool)

(assert (=> b!832101 m!776147))

(assert (=> b!831601 d!106255))

(declare-fun d!106257 () Bool)

(declare-fun e!464074 () Bool)

(assert (=> d!106257 e!464074))

(declare-fun res!566201 () Bool)

(assert (=> d!106257 (=> res!566201 e!464074)))

(declare-fun lt!377579 () Bool)

(assert (=> d!106257 (= res!566201 (not lt!377579))))

(declare-fun lt!377578 () Bool)

(assert (=> d!106257 (= lt!377579 lt!377578)))

(declare-fun lt!377577 () Unit!28446)

(declare-fun e!464073 () Unit!28446)

(assert (=> d!106257 (= lt!377577 e!464073)))

(declare-fun c!90428 () Bool)

(assert (=> d!106257 (= c!90428 lt!377578)))

(assert (=> d!106257 (= lt!377578 (containsKey!401 (toList!4466 lt!377261) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106257 (= (contains!4187 lt!377261 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377579)))

(declare-fun b!832103 () Bool)

(declare-fun lt!377580 () Unit!28446)

(assert (=> b!832103 (= e!464073 lt!377580)))

(assert (=> b!832103 (= lt!377580 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377261) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!832103 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377261) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832104 () Bool)

(declare-fun Unit!28486 () Unit!28446)

(assert (=> b!832104 (= e!464073 Unit!28486)))

(declare-fun b!832105 () Bool)

(assert (=> b!832105 (= e!464074 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377261) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106257 c!90428) b!832103))

(assert (= (and d!106257 (not c!90428)) b!832104))

(assert (= (and d!106257 (not res!566201)) b!832105))

(declare-fun m!776149 () Bool)

(assert (=> d!106257 m!776149))

(declare-fun m!776151 () Bool)

(assert (=> b!832103 m!776151))

(assert (=> b!832103 m!774939))

(assert (=> b!832103 m!774939))

(declare-fun m!776153 () Bool)

(assert (=> b!832103 m!776153))

(assert (=> b!832105 m!774939))

(assert (=> b!832105 m!774939))

(assert (=> b!832105 m!776153))

(assert (=> d!105711 d!106257))

(declare-fun b!832107 () Bool)

(declare-fun e!464075 () Option!422)

(declare-fun e!464076 () Option!422)

(assert (=> b!832107 (= e!464075 e!464076)))

(declare-fun c!90430 () Bool)

(assert (=> b!832107 (= c!90430 (and ((_ is Cons!15842) lt!377263) (not (= (_1!5049 (h!16977 lt!377263)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832108 () Bool)

(assert (=> b!832108 (= e!464076 (getValueByKey!416 (t!22203 lt!377263) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106259 () Bool)

(declare-fun c!90429 () Bool)

(assert (=> d!106259 (= c!90429 (and ((_ is Cons!15842) lt!377263) (= (_1!5049 (h!16977 lt!377263)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106259 (= (getValueByKey!416 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464075)))

(declare-fun b!832106 () Bool)

(assert (=> b!832106 (= e!464075 (Some!421 (_2!5049 (h!16977 lt!377263))))))

(declare-fun b!832109 () Bool)

(assert (=> b!832109 (= e!464076 None!420)))

(assert (= (and d!106259 c!90429) b!832106))

(assert (= (and d!106259 (not c!90429)) b!832107))

(assert (= (and b!832107 c!90430) b!832108))

(assert (= (and b!832107 (not c!90430)) b!832109))

(declare-fun m!776155 () Bool)

(assert (=> b!832108 m!776155))

(assert (=> d!105711 d!106259))

(declare-fun d!106261 () Bool)

(assert (=> d!106261 (= (getValueByKey!416 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377581 () Unit!28446)

(assert (=> d!106261 (= lt!377581 (choose!1423 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464077 () Bool)

(assert (=> d!106261 e!464077))

(declare-fun res!566202 () Bool)

(assert (=> d!106261 (=> (not res!566202) (not e!464077))))

(assert (=> d!106261 (= res!566202 (isStrictlySorted!429 lt!377263))))

(assert (=> d!106261 (= (lemmaContainsTupThenGetReturnValue!230 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377581)))

(declare-fun b!832110 () Bool)

(declare-fun res!566203 () Bool)

(assert (=> b!832110 (=> (not res!566203) (not e!464077))))

(assert (=> b!832110 (= res!566203 (containsKey!401 lt!377263 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832111 () Bool)

(assert (=> b!832111 (= e!464077 (contains!4188 lt!377263 (tuple2!10077 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106261 res!566202) b!832110))

(assert (= (and b!832110 res!566203) b!832111))

(assert (=> d!106261 m!774933))

(declare-fun m!776157 () Bool)

(assert (=> d!106261 m!776157))

(declare-fun m!776159 () Bool)

(assert (=> d!106261 m!776159))

(declare-fun m!776161 () Bool)

(assert (=> b!832110 m!776161))

(declare-fun m!776163 () Bool)

(assert (=> b!832111 m!776163))

(assert (=> d!105711 d!106261))

(declare-fun bm!36350 () Bool)

(declare-fun call!36353 () List!15846)

(declare-fun call!36354 () List!15846)

(assert (=> bm!36350 (= call!36353 call!36354)))

(declare-fun bm!36351 () Bool)

(declare-fun call!36355 () List!15846)

(assert (=> bm!36351 (= call!36354 call!36355)))

(declare-fun d!106263 () Bool)

(declare-fun e!464080 () Bool)

(assert (=> d!106263 e!464080))

(declare-fun res!566205 () Bool)

(assert (=> d!106263 (=> (not res!566205) (not e!464080))))

(declare-fun lt!377582 () List!15846)

(assert (=> d!106263 (= res!566205 (isStrictlySorted!429 lt!377582))))

(declare-fun e!464081 () List!15846)

(assert (=> d!106263 (= lt!377582 e!464081)))

(declare-fun c!90432 () Bool)

(assert (=> d!106263 (= c!90432 (and ((_ is Cons!15842) (toList!4466 call!36305)) (bvslt (_1!5049 (h!16977 (toList!4466 call!36305))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106263 (isStrictlySorted!429 (toList!4466 call!36305))))

(assert (=> d!106263 (= (insertStrictlySorted!269 (toList!4466 call!36305) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377582)))

(declare-fun e!464082 () List!15846)

(declare-fun c!90433 () Bool)

(declare-fun c!90434 () Bool)

(declare-fun b!832112 () Bool)

(assert (=> b!832112 (= e!464082 (ite c!90434 (t!22203 (toList!4466 call!36305)) (ite c!90433 (Cons!15842 (h!16977 (toList!4466 call!36305)) (t!22203 (toList!4466 call!36305))) Nil!15843)))))

(declare-fun b!832113 () Bool)

(declare-fun e!464079 () List!15846)

(assert (=> b!832113 (= e!464079 call!36353)))

(declare-fun b!832114 () Bool)

(assert (=> b!832114 (= e!464079 call!36353)))

(declare-fun b!832115 () Bool)

(declare-fun e!464078 () List!15846)

(assert (=> b!832115 (= e!464078 call!36354)))

(declare-fun bm!36352 () Bool)

(assert (=> bm!36352 (= call!36355 ($colon$colon!533 e!464082 (ite c!90432 (h!16977 (toList!4466 call!36305)) (tuple2!10077 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90431 () Bool)

(assert (=> bm!36352 (= c!90431 c!90432)))

(declare-fun b!832116 () Bool)

(assert (=> b!832116 (= e!464082 (insertStrictlySorted!269 (t!22203 (toList!4466 call!36305)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832117 () Bool)

(declare-fun res!566204 () Bool)

(assert (=> b!832117 (=> (not res!566204) (not e!464080))))

(assert (=> b!832117 (= res!566204 (containsKey!401 lt!377582 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832118 () Bool)

(assert (=> b!832118 (= e!464081 e!464078)))

(assert (=> b!832118 (= c!90434 (and ((_ is Cons!15842) (toList!4466 call!36305)) (= (_1!5049 (h!16977 (toList!4466 call!36305))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832119 () Bool)

(assert (=> b!832119 (= e!464080 (contains!4188 lt!377582 (tuple2!10077 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832120 () Bool)

(assert (=> b!832120 (= e!464081 call!36355)))

(declare-fun b!832121 () Bool)

(assert (=> b!832121 (= c!90433 (and ((_ is Cons!15842) (toList!4466 call!36305)) (bvsgt (_1!5049 (h!16977 (toList!4466 call!36305))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832121 (= e!464078 e!464079)))

(assert (= (and d!106263 c!90432) b!832120))

(assert (= (and d!106263 (not c!90432)) b!832118))

(assert (= (and b!832118 c!90434) b!832115))

(assert (= (and b!832118 (not c!90434)) b!832121))

(assert (= (and b!832121 c!90433) b!832113))

(assert (= (and b!832121 (not c!90433)) b!832114))

(assert (= (or b!832113 b!832114) bm!36350))

(assert (= (or b!832115 bm!36350) bm!36351))

(assert (= (or b!832120 bm!36351) bm!36352))

(assert (= (and bm!36352 c!90431) b!832116))

(assert (= (and bm!36352 (not c!90431)) b!832112))

(assert (= (and d!106263 res!566205) b!832117))

(assert (= (and b!832117 res!566204) b!832119))

(declare-fun m!776165 () Bool)

(assert (=> d!106263 m!776165))

(declare-fun m!776167 () Bool)

(assert (=> d!106263 m!776167))

(declare-fun m!776169 () Bool)

(assert (=> bm!36352 m!776169))

(declare-fun m!776171 () Bool)

(assert (=> b!832116 m!776171))

(declare-fun m!776173 () Bool)

(assert (=> b!832117 m!776173))

(declare-fun m!776175 () Bool)

(assert (=> b!832119 m!776175))

(assert (=> d!105711 d!106263))

(declare-fun b!832123 () Bool)

(declare-fun e!464083 () Option!422)

(declare-fun e!464084 () Option!422)

(assert (=> b!832123 (= e!464083 e!464084)))

(declare-fun c!90436 () Bool)

(assert (=> b!832123 (= c!90436 (and ((_ is Cons!15842) (toList!4466 lt!377356)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377356))) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))))

(declare-fun b!832124 () Bool)

(assert (=> b!832124 (= e!464084 (getValueByKey!416 (t!22203 (toList!4466 lt!377356)) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))))))

(declare-fun d!106265 () Bool)

(declare-fun c!90435 () Bool)

(assert (=> d!106265 (= c!90435 (and ((_ is Cons!15842) (toList!4466 lt!377356)) (= (_1!5049 (h!16977 (toList!4466 lt!377356))) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34)))))))

(assert (=> d!106265 (= (getValueByKey!416 (toList!4466 lt!377356) (_1!5049 (tuple2!10077 lt!377167 zeroValueBefore!34))) e!464083)))

(declare-fun b!832122 () Bool)

(assert (=> b!832122 (= e!464083 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377356)))))))

(declare-fun b!832125 () Bool)

(assert (=> b!832125 (= e!464084 None!420)))

(assert (= (and d!106265 c!90435) b!832122))

(assert (= (and d!106265 (not c!90435)) b!832123))

(assert (= (and b!832123 c!90436) b!832124))

(assert (= (and b!832123 (not c!90436)) b!832125))

(declare-fun m!776177 () Bool)

(assert (=> b!832124 m!776177))

(assert (=> b!831517 d!106265))

(declare-fun d!106267 () Bool)

(declare-fun res!566206 () Bool)

(declare-fun e!464085 () Bool)

(assert (=> d!106267 (=> res!566206 e!464085)))

(assert (=> d!106267 (= res!566206 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))))) lt!377198)))))

(assert (=> d!106267 (= (containsKey!401 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377198) e!464085)))

(declare-fun b!832126 () Bool)

(declare-fun e!464086 () Bool)

(assert (=> b!832126 (= e!464085 e!464086)))

(declare-fun res!566207 () Bool)

(assert (=> b!832126 (=> (not res!566207) (not e!464086))))

(assert (=> b!832126 (= res!566207 (and (or (not ((_ is Cons!15842) (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))))) (bvsle (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))))) lt!377198)) ((_ is Cons!15842) (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34))))) lt!377198)))))

(declare-fun b!832127 () Bool)

(assert (=> b!832127 (= e!464086 (containsKey!401 (t!22203 (toList!4466 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)))) lt!377198))))

(assert (= (and d!106267 (not res!566206)) b!832126))

(assert (= (and b!832126 res!566207) b!832127))

(declare-fun m!776179 () Bool)

(assert (=> b!832127 m!776179))

(assert (=> d!105733 d!106267))

(declare-fun b!832129 () Bool)

(declare-fun e!464087 () Option!422)

(declare-fun e!464088 () Option!422)

(assert (=> b!832129 (= e!464087 e!464088)))

(declare-fun c!90438 () Bool)

(assert (=> b!832129 (= c!90438 (and ((_ is Cons!15842) (toList!4466 lt!377261)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377261))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832130 () Bool)

(assert (=> b!832130 (= e!464088 (getValueByKey!416 (t!22203 (toList!4466 lt!377261)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106269 () Bool)

(declare-fun c!90437 () Bool)

(assert (=> d!106269 (= c!90437 (and ((_ is Cons!15842) (toList!4466 lt!377261)) (= (_1!5049 (h!16977 (toList!4466 lt!377261))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106269 (= (getValueByKey!416 (toList!4466 lt!377261) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464087)))

(declare-fun b!832128 () Bool)

(assert (=> b!832128 (= e!464087 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377261)))))))

(declare-fun b!832131 () Bool)

(assert (=> b!832131 (= e!464088 None!420)))

(assert (= (and d!106269 c!90437) b!832128))

(assert (= (and d!106269 (not c!90437)) b!832129))

(assert (= (and b!832129 c!90438) b!832130))

(assert (= (and b!832129 (not c!90438)) b!832131))

(declare-fun m!776181 () Bool)

(assert (=> b!832130 m!776181))

(assert (=> b!831395 d!106269))

(declare-fun d!106271 () Bool)

(assert (=> d!106271 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377182) lt!377171)) (v!10095 (getValueByKey!416 (toList!4466 lt!377182) lt!377171)))))

(assert (=> d!105799 d!106271))

(declare-fun b!832133 () Bool)

(declare-fun e!464089 () Option!422)

(declare-fun e!464090 () Option!422)

(assert (=> b!832133 (= e!464089 e!464090)))

(declare-fun c!90440 () Bool)

(assert (=> b!832133 (= c!90440 (and ((_ is Cons!15842) (toList!4466 lt!377182)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377182))) lt!377171))))))

(declare-fun b!832134 () Bool)

(assert (=> b!832134 (= e!464090 (getValueByKey!416 (t!22203 (toList!4466 lt!377182)) lt!377171))))

(declare-fun d!106273 () Bool)

(declare-fun c!90439 () Bool)

(assert (=> d!106273 (= c!90439 (and ((_ is Cons!15842) (toList!4466 lt!377182)) (= (_1!5049 (h!16977 (toList!4466 lt!377182))) lt!377171)))))

(assert (=> d!106273 (= (getValueByKey!416 (toList!4466 lt!377182) lt!377171) e!464089)))

(declare-fun b!832132 () Bool)

(assert (=> b!832132 (= e!464089 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377182)))))))

(declare-fun b!832135 () Bool)

(assert (=> b!832135 (= e!464090 None!420)))

(assert (= (and d!106273 c!90439) b!832132))

(assert (= (and d!106273 (not c!90439)) b!832133))

(assert (= (and b!832133 c!90440) b!832134))

(assert (= (and b!832133 (not c!90440)) b!832135))

(declare-fun m!776183 () Bool)

(assert (=> b!832134 m!776183))

(assert (=> d!105799 d!106273))

(declare-fun d!106275 () Bool)

(declare-fun lt!377583 () Bool)

(assert (=> d!106275 (= lt!377583 (select (content!386 (t!22203 (toList!4466 lt!377108))) lt!377010))))

(declare-fun e!464092 () Bool)

(assert (=> d!106275 (= lt!377583 e!464092)))

(declare-fun res!566208 () Bool)

(assert (=> d!106275 (=> (not res!566208) (not e!464092))))

(assert (=> d!106275 (= res!566208 ((_ is Cons!15842) (t!22203 (toList!4466 lt!377108))))))

(assert (=> d!106275 (= (contains!4188 (t!22203 (toList!4466 lt!377108)) lt!377010) lt!377583)))

(declare-fun b!832136 () Bool)

(declare-fun e!464091 () Bool)

(assert (=> b!832136 (= e!464092 e!464091)))

(declare-fun res!566209 () Bool)

(assert (=> b!832136 (=> res!566209 e!464091)))

(assert (=> b!832136 (= res!566209 (= (h!16977 (t!22203 (toList!4466 lt!377108))) lt!377010))))

(declare-fun b!832137 () Bool)

(assert (=> b!832137 (= e!464091 (contains!4188 (t!22203 (t!22203 (toList!4466 lt!377108))) lt!377010))))

(assert (= (and d!106275 res!566208) b!832136))

(assert (= (and b!832136 (not res!566209)) b!832137))

(assert (=> d!106275 m!775957))

(declare-fun m!776185 () Bool)

(assert (=> d!106275 m!776185))

(declare-fun m!776187 () Bool)

(assert (=> b!832137 m!776187))

(assert (=> b!831496 d!106275))

(declare-fun d!106277 () Bool)

(declare-fun res!566210 () Bool)

(declare-fun e!464093 () Bool)

(assert (=> d!106277 (=> res!566210 e!464093)))

(assert (=> d!106277 (= res!566210 (or ((_ is Nil!15843) lt!377372) ((_ is Nil!15843) (t!22203 lt!377372))))))

(assert (=> d!106277 (= (isStrictlySorted!429 lt!377372) e!464093)))

(declare-fun b!832138 () Bool)

(declare-fun e!464094 () Bool)

(assert (=> b!832138 (= e!464093 e!464094)))

(declare-fun res!566211 () Bool)

(assert (=> b!832138 (=> (not res!566211) (not e!464094))))

(assert (=> b!832138 (= res!566211 (bvslt (_1!5049 (h!16977 lt!377372)) (_1!5049 (h!16977 (t!22203 lt!377372)))))))

(declare-fun b!832139 () Bool)

(assert (=> b!832139 (= e!464094 (isStrictlySorted!429 (t!22203 lt!377372)))))

(assert (= (and d!106277 (not res!566210)) b!832138))

(assert (= (and b!832138 res!566211) b!832139))

(declare-fun m!776189 () Bool)

(assert (=> b!832139 m!776189))

(assert (=> d!105829 d!106277))

(declare-fun d!106279 () Bool)

(declare-fun res!566212 () Bool)

(declare-fun e!464095 () Bool)

(assert (=> d!106279 (=> res!566212 e!464095)))

(assert (=> d!106279 (= res!566212 (or ((_ is Nil!15843) (toList!4466 lt!377013)) ((_ is Nil!15843) (t!22203 (toList!4466 lt!377013)))))))

(assert (=> d!106279 (= (isStrictlySorted!429 (toList!4466 lt!377013)) e!464095)))

(declare-fun b!832140 () Bool)

(declare-fun e!464096 () Bool)

(assert (=> b!832140 (= e!464095 e!464096)))

(declare-fun res!566213 () Bool)

(assert (=> b!832140 (=> (not res!566213) (not e!464096))))

(assert (=> b!832140 (= res!566213 (bvslt (_1!5049 (h!16977 (toList!4466 lt!377013))) (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377013))))))))

(declare-fun b!832141 () Bool)

(assert (=> b!832141 (= e!464096 (isStrictlySorted!429 (t!22203 (toList!4466 lt!377013))))))

(assert (= (and d!106279 (not res!566212)) b!832140))

(assert (= (and b!832140 res!566213) b!832141))

(assert (=> b!832141 m!775831))

(assert (=> d!105829 d!106279))

(assert (=> b!831469 d!106037))

(assert (=> b!831469 d!106039))

(declare-fun d!106281 () Bool)

(declare-fun e!464098 () Bool)

(assert (=> d!106281 e!464098))

(declare-fun res!566214 () Bool)

(assert (=> d!106281 (=> res!566214 e!464098)))

(declare-fun lt!377586 () Bool)

(assert (=> d!106281 (= res!566214 (not lt!377586))))

(declare-fun lt!377585 () Bool)

(assert (=> d!106281 (= lt!377586 lt!377585)))

(declare-fun lt!377584 () Unit!28446)

(declare-fun e!464097 () Unit!28446)

(assert (=> d!106281 (= lt!377584 e!464097)))

(declare-fun c!90441 () Bool)

(assert (=> d!106281 (= c!90441 lt!377585)))

(assert (=> d!106281 (= lt!377585 (containsKey!401 (toList!4466 lt!377382) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106281 (= (contains!4187 lt!377382 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377586)))

(declare-fun b!832142 () Bool)

(declare-fun lt!377587 () Unit!28446)

(assert (=> b!832142 (= e!464097 lt!377587)))

(assert (=> b!832142 (= lt!377587 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377382) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> b!832142 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377382) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832143 () Bool)

(declare-fun Unit!28487 () Unit!28446)

(assert (=> b!832143 (= e!464097 Unit!28487)))

(declare-fun b!832144 () Bool)

(assert (=> b!832144 (= e!464098 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377382) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106281 c!90441) b!832142))

(assert (= (and d!106281 (not c!90441)) b!832143))

(assert (= (and d!106281 (not res!566214)) b!832144))

(declare-fun m!776191 () Bool)

(assert (=> d!106281 m!776191))

(declare-fun m!776193 () Bool)

(assert (=> b!832142 m!776193))

(assert (=> b!832142 m!775345))

(assert (=> b!832142 m!775345))

(declare-fun m!776195 () Bool)

(assert (=> b!832142 m!776195))

(assert (=> b!832144 m!775345))

(assert (=> b!832144 m!775345))

(assert (=> b!832144 m!776195))

(assert (=> d!105835 d!106281))

(declare-fun b!832146 () Bool)

(declare-fun e!464099 () Option!422)

(declare-fun e!464100 () Option!422)

(assert (=> b!832146 (= e!464099 e!464100)))

(declare-fun c!90443 () Bool)

(assert (=> b!832146 (= c!90443 (and ((_ is Cons!15842) lt!377384) (not (= (_1!5049 (h!16977 lt!377384)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun b!832147 () Bool)

(assert (=> b!832147 (= e!464100 (getValueByKey!416 (t!22203 lt!377384) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun d!106283 () Bool)

(declare-fun c!90442 () Bool)

(assert (=> d!106283 (= c!90442 (and ((_ is Cons!15842) lt!377384) (= (_1!5049 (h!16977 lt!377384)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106283 (= (getValueByKey!416 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) e!464099)))

(declare-fun b!832145 () Bool)

(assert (=> b!832145 (= e!464099 (Some!421 (_2!5049 (h!16977 lt!377384))))))

(declare-fun b!832148 () Bool)

(assert (=> b!832148 (= e!464100 None!420)))

(assert (= (and d!106283 c!90442) b!832145))

(assert (= (and d!106283 (not c!90442)) b!832146))

(assert (= (and b!832146 c!90443) b!832147))

(assert (= (and b!832146 (not c!90443)) b!832148))

(declare-fun m!776197 () Bool)

(assert (=> b!832147 m!776197))

(assert (=> d!105835 d!106283))

(declare-fun d!106285 () Bool)

(assert (=> d!106285 (= (getValueByKey!416 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377588 () Unit!28446)

(assert (=> d!106285 (= lt!377588 (choose!1423 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!464101 () Bool)

(assert (=> d!106285 e!464101))

(declare-fun res!566215 () Bool)

(assert (=> d!106285 (=> (not res!566215) (not e!464101))))

(assert (=> d!106285 (= res!566215 (isStrictlySorted!429 lt!377384))))

(assert (=> d!106285 (= (lemmaContainsTupThenGetReturnValue!230 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377588)))

(declare-fun b!832149 () Bool)

(declare-fun res!566216 () Bool)

(assert (=> b!832149 (=> (not res!566216) (not e!464101))))

(assert (=> b!832149 (= res!566216 (containsKey!401 lt!377384 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832150 () Bool)

(assert (=> b!832150 (= e!464101 (contains!4188 lt!377384 (tuple2!10077 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (= (and d!106285 res!566215) b!832149))

(assert (= (and b!832149 res!566216) b!832150))

(assert (=> d!106285 m!775339))

(declare-fun m!776199 () Bool)

(assert (=> d!106285 m!776199))

(declare-fun m!776201 () Bool)

(assert (=> d!106285 m!776201))

(declare-fun m!776203 () Bool)

(assert (=> b!832149 m!776203))

(declare-fun m!776205 () Bool)

(assert (=> b!832150 m!776205))

(assert (=> d!105835 d!106285))

(declare-fun bm!36353 () Bool)

(declare-fun call!36356 () List!15846)

(declare-fun call!36357 () List!15846)

(assert (=> bm!36353 (= call!36356 call!36357)))

(declare-fun bm!36354 () Bool)

(declare-fun call!36358 () List!15846)

(assert (=> bm!36354 (= call!36357 call!36358)))

(declare-fun d!106287 () Bool)

(declare-fun e!464104 () Bool)

(assert (=> d!106287 e!464104))

(declare-fun res!566218 () Bool)

(assert (=> d!106287 (=> (not res!566218) (not e!464104))))

(declare-fun lt!377589 () List!15846)

(assert (=> d!106287 (= res!566218 (isStrictlySorted!429 lt!377589))))

(declare-fun e!464105 () List!15846)

(assert (=> d!106287 (= lt!377589 e!464105)))

(declare-fun c!90445 () Bool)

(assert (=> d!106287 (= c!90445 (and ((_ is Cons!15842) (toList!4466 call!36276)) (bvslt (_1!5049 (h!16977 (toList!4466 call!36276))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> d!106287 (isStrictlySorted!429 (toList!4466 call!36276))))

(assert (=> d!106287 (= (insertStrictlySorted!269 (toList!4466 call!36276) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) lt!377589)))

(declare-fun c!90446 () Bool)

(declare-fun c!90447 () Bool)

(declare-fun e!464106 () List!15846)

(declare-fun b!832151 () Bool)

(assert (=> b!832151 (= e!464106 (ite c!90447 (t!22203 (toList!4466 call!36276)) (ite c!90446 (Cons!15842 (h!16977 (toList!4466 call!36276)) (t!22203 (toList!4466 call!36276))) Nil!15843)))))

(declare-fun b!832152 () Bool)

(declare-fun e!464103 () List!15846)

(assert (=> b!832152 (= e!464103 call!36356)))

(declare-fun b!832153 () Bool)

(assert (=> b!832153 (= e!464103 call!36356)))

(declare-fun b!832154 () Bool)

(declare-fun e!464102 () List!15846)

(assert (=> b!832154 (= e!464102 call!36357)))

(declare-fun bm!36355 () Bool)

(assert (=> bm!36355 (= call!36358 ($colon$colon!533 e!464106 (ite c!90445 (h!16977 (toList!4466 call!36276)) (tuple2!10077 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))))

(declare-fun c!90444 () Bool)

(assert (=> bm!36355 (= c!90444 c!90445)))

(declare-fun b!832155 () Bool)

(assert (=> b!832155 (= e!464106 (insertStrictlySorted!269 (t!22203 (toList!4466 call!36276)) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832156 () Bool)

(declare-fun res!566217 () Bool)

(assert (=> b!832156 (=> (not res!566217) (not e!464104))))

(assert (=> b!832156 (= res!566217 (containsKey!401 lt!377589 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!832157 () Bool)

(assert (=> b!832157 (= e!464105 e!464102)))

(assert (=> b!832157 (= c!90447 (and ((_ is Cons!15842) (toList!4466 call!36276)) (= (_1!5049 (h!16977 (toList!4466 call!36276))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832158 () Bool)

(assert (=> b!832158 (= e!464104 (contains!4188 lt!377589 (tuple2!10077 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832159 () Bool)

(assert (=> b!832159 (= e!464105 call!36358)))

(declare-fun b!832160 () Bool)

(assert (=> b!832160 (= c!90446 (and ((_ is Cons!15842) (toList!4466 call!36276)) (bvsgt (_1!5049 (h!16977 (toList!4466 call!36276))) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) #b00000000000000000000000000000000) (get!11820 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(assert (=> b!832160 (= e!464102 e!464103)))

(assert (= (and d!106287 c!90445) b!832159))

(assert (= (and d!106287 (not c!90445)) b!832157))

(assert (= (and b!832157 c!90447) b!832154))

(assert (= (and b!832157 (not c!90447)) b!832160))

(assert (= (and b!832160 c!90446) b!832152))

(assert (= (and b!832160 (not c!90446)) b!832153))

(assert (= (or b!832152 b!832153) bm!36353))

(assert (= (or b!832154 bm!36353) bm!36354))

(assert (= (or b!832159 bm!36354) bm!36355))

(assert (= (and bm!36355 c!90444) b!832155))

(assert (= (and bm!36355 (not c!90444)) b!832151))

(assert (= (and d!106287 res!566218) b!832156))

(assert (= (and b!832156 res!566217) b!832158))

(declare-fun m!776207 () Bool)

(assert (=> d!106287 m!776207))

(declare-fun m!776209 () Bool)

(assert (=> d!106287 m!776209))

(declare-fun m!776211 () Bool)

(assert (=> bm!36355 m!776211))

(declare-fun m!776213 () Bool)

(assert (=> b!832155 m!776213))

(declare-fun m!776215 () Bool)

(assert (=> b!832156 m!776215))

(declare-fun m!776217 () Bool)

(assert (=> b!832158 m!776217))

(assert (=> d!105835 d!106287))

(assert (=> bm!36303 d!106163))

(declare-fun d!106289 () Bool)

(declare-fun res!566219 () Bool)

(declare-fun e!464107 () Bool)

(assert (=> d!106289 (=> res!566219 e!464107)))

(assert (=> d!106289 (= res!566219 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (= (_1!5049 (h!16977 (toList!4466 lt!377180))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106289 (= (containsKey!401 (toList!4466 lt!377180) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!464107)))

(declare-fun b!832161 () Bool)

(declare-fun e!464108 () Bool)

(assert (=> b!832161 (= e!464107 e!464108)))

(declare-fun res!566220 () Bool)

(assert (=> b!832161 (=> (not res!566220) (not e!464108))))

(assert (=> b!832161 (= res!566220 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377180))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377180))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15842) (toList!4466 lt!377180)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377180))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832162 () Bool)

(assert (=> b!832162 (= e!464108 (containsKey!401 (t!22203 (toList!4466 lt!377180)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106289 (not res!566219)) b!832161))

(assert (= (and b!832161 res!566220) b!832162))

(assert (=> b!832162 m!774611))

(declare-fun m!776219 () Bool)

(assert (=> b!832162 m!776219))

(assert (=> d!105831 d!106289))

(declare-fun d!106291 () Bool)

(declare-fun e!464110 () Bool)

(assert (=> d!106291 e!464110))

(declare-fun res!566221 () Bool)

(assert (=> d!106291 (=> res!566221 e!464110)))

(declare-fun lt!377592 () Bool)

(assert (=> d!106291 (= res!566221 (not lt!377592))))

(declare-fun lt!377591 () Bool)

(assert (=> d!106291 (= lt!377592 lt!377591)))

(declare-fun lt!377590 () Unit!28446)

(declare-fun e!464109 () Unit!28446)

(assert (=> d!106291 (= lt!377590 e!464109)))

(declare-fun c!90448 () Bool)

(assert (=> d!106291 (= c!90448 lt!377591)))

(assert (=> d!106291 (= lt!377591 (containsKey!401 (toList!4466 lt!377276) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106291 (= (contains!4187 lt!377276 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377592)))

(declare-fun b!832163 () Bool)

(declare-fun lt!377593 () Unit!28446)

(assert (=> b!832163 (= e!464109 lt!377593)))

(assert (=> b!832163 (= lt!377593 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377276) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832163 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377276) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832164 () Bool)

(declare-fun Unit!28488 () Unit!28446)

(assert (=> b!832164 (= e!464109 Unit!28488)))

(declare-fun b!832165 () Bool)

(assert (=> b!832165 (= e!464110 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377276) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106291 c!90448) b!832163))

(assert (= (and d!106291 (not c!90448)) b!832164))

(assert (= (and d!106291 (not res!566221)) b!832165))

(declare-fun m!776221 () Bool)

(assert (=> d!106291 m!776221))

(declare-fun m!776223 () Bool)

(assert (=> b!832163 m!776223))

(assert (=> b!832163 m!774985))

(assert (=> b!832163 m!774985))

(declare-fun m!776225 () Bool)

(assert (=> b!832163 m!776225))

(assert (=> b!832165 m!774985))

(assert (=> b!832165 m!774985))

(assert (=> b!832165 m!776225))

(assert (=> d!105723 d!106291))

(declare-fun b!832167 () Bool)

(declare-fun e!464111 () Option!422)

(declare-fun e!464112 () Option!422)

(assert (=> b!832167 (= e!464111 e!464112)))

(declare-fun c!90450 () Bool)

(assert (=> b!832167 (= c!90450 (and ((_ is Cons!15842) lt!377278) (not (= (_1!5049 (h!16977 lt!377278)) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832168 () Bool)

(assert (=> b!832168 (= e!464112 (getValueByKey!416 (t!22203 lt!377278) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!90449 () Bool)

(declare-fun d!106293 () Bool)

(assert (=> d!106293 (= c!90449 (and ((_ is Cons!15842) lt!377278) (= (_1!5049 (h!16977 lt!377278)) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106293 (= (getValueByKey!416 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464111)))

(declare-fun b!832166 () Bool)

(assert (=> b!832166 (= e!464111 (Some!421 (_2!5049 (h!16977 lt!377278))))))

(declare-fun b!832169 () Bool)

(assert (=> b!832169 (= e!464112 None!420)))

(assert (= (and d!106293 c!90449) b!832166))

(assert (= (and d!106293 (not c!90449)) b!832167))

(assert (= (and b!832167 c!90450) b!832168))

(assert (= (and b!832167 (not c!90450)) b!832169))

(declare-fun m!776227 () Bool)

(assert (=> b!832168 m!776227))

(assert (=> d!105723 d!106293))

(declare-fun d!106295 () Bool)

(assert (=> d!106295 (= (getValueByKey!416 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377594 () Unit!28446)

(assert (=> d!106295 (= lt!377594 (choose!1423 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464113 () Bool)

(assert (=> d!106295 e!464113))

(declare-fun res!566222 () Bool)

(assert (=> d!106295 (=> (not res!566222) (not e!464113))))

(assert (=> d!106295 (= res!566222 (isStrictlySorted!429 lt!377278))))

(assert (=> d!106295 (= (lemmaContainsTupThenGetReturnValue!230 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377594)))

(declare-fun b!832170 () Bool)

(declare-fun res!566223 () Bool)

(assert (=> b!832170 (=> (not res!566223) (not e!464113))))

(assert (=> b!832170 (= res!566223 (containsKey!401 lt!377278 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832171 () Bool)

(assert (=> b!832171 (= e!464113 (contains!4188 lt!377278 (tuple2!10077 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106295 res!566222) b!832170))

(assert (= (and b!832170 res!566223) b!832171))

(assert (=> d!106295 m!774979))

(declare-fun m!776229 () Bool)

(assert (=> d!106295 m!776229))

(declare-fun m!776231 () Bool)

(assert (=> d!106295 m!776231))

(declare-fun m!776233 () Bool)

(assert (=> b!832170 m!776233))

(declare-fun m!776235 () Bool)

(assert (=> b!832171 m!776235))

(assert (=> d!105723 d!106295))

(declare-fun bm!36356 () Bool)

(declare-fun call!36359 () List!15846)

(declare-fun call!36360 () List!15846)

(assert (=> bm!36356 (= call!36359 call!36360)))

(declare-fun bm!36357 () Bool)

(declare-fun call!36361 () List!15846)

(assert (=> bm!36357 (= call!36360 call!36361)))

(declare-fun d!106297 () Bool)

(declare-fun e!464116 () Bool)

(assert (=> d!106297 e!464116))

(declare-fun res!566225 () Bool)

(assert (=> d!106297 (=> (not res!566225) (not e!464116))))

(declare-fun lt!377595 () List!15846)

(assert (=> d!106297 (= res!566225 (isStrictlySorted!429 lt!377595))))

(declare-fun e!464117 () List!15846)

(assert (=> d!106297 (= lt!377595 e!464117)))

(declare-fun c!90452 () Bool)

(assert (=> d!106297 (= c!90452 (and ((_ is Cons!15842) (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (bvslt (_1!5049 (h!16977 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106297 (isStrictlySorted!429 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))))))

(assert (=> d!106297 (= (insertStrictlySorted!269 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377595)))

(declare-fun c!90453 () Bool)

(declare-fun c!90454 () Bool)

(declare-fun b!832172 () Bool)

(declare-fun e!464118 () List!15846)

(assert (=> b!832172 (= e!464118 (ite c!90454 (t!22203 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (ite c!90453 (Cons!15842 (h!16977 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (t!22203 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))))) Nil!15843)))))

(declare-fun b!832173 () Bool)

(declare-fun e!464115 () List!15846)

(assert (=> b!832173 (= e!464115 call!36359)))

(declare-fun b!832174 () Bool)

(assert (=> b!832174 (= e!464115 call!36359)))

(declare-fun b!832175 () Bool)

(declare-fun e!464114 () List!15846)

(assert (=> b!832175 (= e!464114 call!36360)))

(declare-fun bm!36358 () Bool)

(assert (=> bm!36358 (= call!36361 ($colon$colon!533 e!464118 (ite c!90452 (h!16977 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (tuple2!10077 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90451 () Bool)

(assert (=> bm!36358 (= c!90451 c!90452)))

(declare-fun b!832176 () Bool)

(assert (=> b!832176 (= e!464118 (insertStrictlySorted!269 (t!22203 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832177 () Bool)

(declare-fun res!566224 () Bool)

(assert (=> b!832177 (=> (not res!566224) (not e!464116))))

(assert (=> b!832177 (= res!566224 (containsKey!401 lt!377595 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832178 () Bool)

(assert (=> b!832178 (= e!464117 e!464114)))

(assert (=> b!832178 (= c!90454 (and ((_ is Cons!15842) (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (= (_1!5049 (h!16977 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832179 () Bool)

(assert (=> b!832179 (= e!464116 (contains!4188 lt!377595 (tuple2!10077 (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832180 () Bool)

(assert (=> b!832180 (= e!464117 call!36361)))

(declare-fun b!832181 () Bool)

(assert (=> b!832181 (= c!90453 (and ((_ is Cons!15842) (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293)))) (bvsgt (_1!5049 (h!16977 (toList!4466 (ite c!90178 call!36294 (ite c!90179 call!36295 call!36293))))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> b!832181 (= e!464114 e!464115)))

(assert (= (and d!106297 c!90452) b!832180))

(assert (= (and d!106297 (not c!90452)) b!832178))

(assert (= (and b!832178 c!90454) b!832175))

(assert (= (and b!832178 (not c!90454)) b!832181))

(assert (= (and b!832181 c!90453) b!832173))

(assert (= (and b!832181 (not c!90453)) b!832174))

(assert (= (or b!832173 b!832174) bm!36356))

(assert (= (or b!832175 bm!36356) bm!36357))

(assert (= (or b!832180 bm!36357) bm!36358))

(assert (= (and bm!36358 c!90451) b!832176))

(assert (= (and bm!36358 (not c!90451)) b!832172))

(assert (= (and d!106297 res!566225) b!832177))

(assert (= (and b!832177 res!566224) b!832179))

(declare-fun m!776237 () Bool)

(assert (=> d!106297 m!776237))

(declare-fun m!776239 () Bool)

(assert (=> d!106297 m!776239))

(declare-fun m!776241 () Bool)

(assert (=> bm!36358 m!776241))

(declare-fun m!776243 () Bool)

(assert (=> b!832176 m!776243))

(declare-fun m!776245 () Bool)

(assert (=> b!832177 m!776245))

(declare-fun m!776247 () Bool)

(assert (=> b!832179 m!776247))

(assert (=> d!105723 d!106297))

(declare-fun d!106299 () Bool)

(declare-fun res!566226 () Bool)

(declare-fun e!464119 () Bool)

(assert (=> d!106299 (=> res!566226 e!464119)))

(assert (=> d!106299 (= res!566226 (and ((_ is Cons!15842) (toList!4466 lt!377116)) (= (_1!5049 (h!16977 (toList!4466 lt!377116))) (_1!5049 lt!377010))))))

(assert (=> d!106299 (= (containsKey!401 (toList!4466 lt!377116) (_1!5049 lt!377010)) e!464119)))

(declare-fun b!832182 () Bool)

(declare-fun e!464120 () Bool)

(assert (=> b!832182 (= e!464119 e!464120)))

(declare-fun res!566227 () Bool)

(assert (=> b!832182 (=> (not res!566227) (not e!464120))))

(assert (=> b!832182 (= res!566227 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377116))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377116))) (_1!5049 lt!377010))) ((_ is Cons!15842) (toList!4466 lt!377116)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377116))) (_1!5049 lt!377010))))))

(declare-fun b!832183 () Bool)

(assert (=> b!832183 (= e!464120 (containsKey!401 (t!22203 (toList!4466 lt!377116)) (_1!5049 lt!377010)))))

(assert (= (and d!106299 (not res!566226)) b!832182))

(assert (= (and b!832182 res!566227) b!832183))

(declare-fun m!776249 () Bool)

(assert (=> b!832183 m!776249))

(assert (=> d!105877 d!106299))

(declare-fun d!106301 () Bool)

(declare-fun lt!377596 () Bool)

(assert (=> d!106301 (= lt!377596 (select (content!386 lt!377214) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun e!464122 () Bool)

(assert (=> d!106301 (= lt!377596 e!464122)))

(declare-fun res!566228 () Bool)

(assert (=> d!106301 (=> (not res!566228) (not e!464122))))

(assert (=> d!106301 (= res!566228 ((_ is Cons!15842) lt!377214))))

(assert (=> d!106301 (= (contains!4188 lt!377214 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) lt!377596)))

(declare-fun b!832184 () Bool)

(declare-fun e!464121 () Bool)

(assert (=> b!832184 (= e!464122 e!464121)))

(declare-fun res!566229 () Bool)

(assert (=> b!832184 (=> res!566229 e!464121)))

(assert (=> b!832184 (= res!566229 (= (h!16977 lt!377214) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!832185 () Bool)

(assert (=> b!832185 (= e!464121 (contains!4188 (t!22203 lt!377214) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!106301 res!566228) b!832184))

(assert (= (and b!832184 (not res!566229)) b!832185))

(declare-fun m!776251 () Bool)

(assert (=> d!106301 m!776251))

(declare-fun m!776253 () Bool)

(assert (=> d!106301 m!776253))

(declare-fun m!776255 () Bool)

(assert (=> b!832185 m!776255))

(assert (=> b!831570 d!106301))

(declare-fun d!106303 () Bool)

(declare-fun lt!377597 () Bool)

(assert (=> d!106303 (= lt!377597 (select (content!386 lt!377114) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun e!464124 () Bool)

(assert (=> d!106303 (= lt!377597 e!464124)))

(declare-fun res!566230 () Bool)

(assert (=> d!106303 (=> (not res!566230) (not e!464124))))

(assert (=> d!106303 (= res!566230 ((_ is Cons!15842) lt!377114))))

(assert (=> d!106303 (= (contains!4188 lt!377114 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) lt!377597)))

(declare-fun b!832186 () Bool)

(declare-fun e!464123 () Bool)

(assert (=> b!832186 (= e!464124 e!464123)))

(declare-fun res!566231 () Bool)

(assert (=> b!832186 (=> res!566231 e!464123)))

(assert (=> b!832186 (= res!566231 (= (h!16977 lt!377114) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!832187 () Bool)

(assert (=> b!832187 (= e!464123 (contains!4188 (t!22203 lt!377114) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!106303 res!566230) b!832186))

(assert (= (and b!832186 (not res!566231)) b!832187))

(declare-fun m!776257 () Bool)

(assert (=> d!106303 m!776257))

(declare-fun m!776259 () Bool)

(assert (=> d!106303 m!776259))

(declare-fun m!776261 () Bool)

(assert (=> b!832187 m!776261))

(assert (=> b!831631 d!106303))

(declare-fun lt!377598 () Bool)

(declare-fun d!106305 () Bool)

(assert (=> d!106305 (= lt!377598 (select (content!386 (toList!4466 lt!377294)) (tuple2!10077 lt!377187 minValue!754)))))

(declare-fun e!464126 () Bool)

(assert (=> d!106305 (= lt!377598 e!464126)))

(declare-fun res!566232 () Bool)

(assert (=> d!106305 (=> (not res!566232) (not e!464126))))

(assert (=> d!106305 (= res!566232 ((_ is Cons!15842) (toList!4466 lt!377294)))))

(assert (=> d!106305 (= (contains!4188 (toList!4466 lt!377294) (tuple2!10077 lt!377187 minValue!754)) lt!377598)))

(declare-fun b!832188 () Bool)

(declare-fun e!464125 () Bool)

(assert (=> b!832188 (= e!464126 e!464125)))

(declare-fun res!566233 () Bool)

(assert (=> b!832188 (=> res!566233 e!464125)))

(assert (=> b!832188 (= res!566233 (= (h!16977 (toList!4466 lt!377294)) (tuple2!10077 lt!377187 minValue!754)))))

(declare-fun b!832189 () Bool)

(assert (=> b!832189 (= e!464125 (contains!4188 (t!22203 (toList!4466 lt!377294)) (tuple2!10077 lt!377187 minValue!754)))))

(assert (= (and d!106305 res!566232) b!832188))

(assert (= (and b!832188 (not res!566233)) b!832189))

(declare-fun m!776263 () Bool)

(assert (=> d!106305 m!776263))

(declare-fun m!776265 () Bool)

(assert (=> d!106305 m!776265))

(declare-fun m!776267 () Bool)

(assert (=> b!832189 m!776267))

(assert (=> b!831456 d!106305))

(declare-fun d!106307 () Bool)

(declare-fun res!566234 () Bool)

(declare-fun e!464127 () Bool)

(assert (=> d!106307 (=> res!566234 e!464127)))

(assert (=> d!106307 (= res!566234 (and ((_ is Cons!15842) lt!377210) (= (_1!5049 (h!16977 lt!377210)) (_1!5049 lt!377012))))))

(assert (=> d!106307 (= (containsKey!401 lt!377210 (_1!5049 lt!377012)) e!464127)))

(declare-fun b!832190 () Bool)

(declare-fun e!464128 () Bool)

(assert (=> b!832190 (= e!464127 e!464128)))

(declare-fun res!566235 () Bool)

(assert (=> b!832190 (=> (not res!566235) (not e!464128))))

(assert (=> b!832190 (= res!566235 (and (or (not ((_ is Cons!15842) lt!377210)) (bvsle (_1!5049 (h!16977 lt!377210)) (_1!5049 lt!377012))) ((_ is Cons!15842) lt!377210) (bvslt (_1!5049 (h!16977 lt!377210)) (_1!5049 lt!377012))))))

(declare-fun b!832191 () Bool)

(assert (=> b!832191 (= e!464128 (containsKey!401 (t!22203 lt!377210) (_1!5049 lt!377012)))))

(assert (= (and d!106307 (not res!566234)) b!832190))

(assert (= (and b!832190 res!566235) b!832191))

(declare-fun m!776269 () Bool)

(assert (=> b!832191 m!776269))

(assert (=> b!831481 d!106307))

(assert (=> d!105717 d!105715))

(declare-fun d!106309 () Bool)

(assert (=> d!106309 (= (getValueByKey!416 lt!377110 (_1!5049 lt!377010)) (Some!421 (_2!5049 lt!377010)))))

(assert (=> d!106309 true))

(declare-fun _$22!573 () Unit!28446)

(assert (=> d!106309 (= (choose!1423 lt!377110 (_1!5049 lt!377010) (_2!5049 lt!377010)) _$22!573)))

(declare-fun bs!23255 () Bool)

(assert (= bs!23255 d!106309))

(assert (=> bs!23255 m!774677))

(assert (=> d!105717 d!106309))

(declare-fun d!106311 () Bool)

(declare-fun res!566236 () Bool)

(declare-fun e!464129 () Bool)

(assert (=> d!106311 (=> res!566236 e!464129)))

(assert (=> d!106311 (= res!566236 (or ((_ is Nil!15843) lt!377110) ((_ is Nil!15843) (t!22203 lt!377110))))))

(assert (=> d!106311 (= (isStrictlySorted!429 lt!377110) e!464129)))

(declare-fun b!832192 () Bool)

(declare-fun e!464130 () Bool)

(assert (=> b!832192 (= e!464129 e!464130)))

(declare-fun res!566237 () Bool)

(assert (=> b!832192 (=> (not res!566237) (not e!464130))))

(assert (=> b!832192 (= res!566237 (bvslt (_1!5049 (h!16977 lt!377110)) (_1!5049 (h!16977 (t!22203 lt!377110)))))))

(declare-fun b!832193 () Bool)

(assert (=> b!832193 (= e!464130 (isStrictlySorted!429 (t!22203 lt!377110)))))

(assert (= (and d!106311 (not res!566236)) b!832192))

(assert (= (and b!832192 res!566237) b!832193))

(declare-fun m!776271 () Bool)

(assert (=> b!832193 m!776271))

(assert (=> d!105717 d!106311))

(declare-fun d!106313 () Bool)

(declare-fun lt!377599 () Bool)

(assert (=> d!106313 (= lt!377599 (select (content!386 (toList!4466 lt!377364)) (tuple2!10077 lt!377165 minValue!754)))))

(declare-fun e!464132 () Bool)

(assert (=> d!106313 (= lt!377599 e!464132)))

(declare-fun res!566238 () Bool)

(assert (=> d!106313 (=> (not res!566238) (not e!464132))))

(assert (=> d!106313 (= res!566238 ((_ is Cons!15842) (toList!4466 lt!377364)))))

(assert (=> d!106313 (= (contains!4188 (toList!4466 lt!377364) (tuple2!10077 lt!377165 minValue!754)) lt!377599)))

(declare-fun b!832194 () Bool)

(declare-fun e!464131 () Bool)

(assert (=> b!832194 (= e!464132 e!464131)))

(declare-fun res!566239 () Bool)

(assert (=> b!832194 (=> res!566239 e!464131)))

(assert (=> b!832194 (= res!566239 (= (h!16977 (toList!4466 lt!377364)) (tuple2!10077 lt!377165 minValue!754)))))

(declare-fun b!832195 () Bool)

(assert (=> b!832195 (= e!464131 (contains!4188 (t!22203 (toList!4466 lt!377364)) (tuple2!10077 lt!377165 minValue!754)))))

(assert (= (and d!106313 res!566238) b!832194))

(assert (= (and b!832194 (not res!566239)) b!832195))

(declare-fun m!776273 () Bool)

(assert (=> d!106313 m!776273))

(declare-fun m!776275 () Bool)

(assert (=> d!106313 m!776275))

(declare-fun m!776277 () Bool)

(assert (=> b!832195 m!776277))

(assert (=> b!831522 d!106313))

(assert (=> b!831381 d!105953))

(declare-fun d!106315 () Bool)

(declare-fun res!566240 () Bool)

(declare-fun e!464133 () Bool)

(assert (=> d!106315 (=> res!566240 e!464133)))

(assert (=> d!106315 (= res!566240 (and ((_ is Cons!15842) (toList!4466 lt!377094)) (= (_1!5049 (h!16977 (toList!4466 lt!377094))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106315 (= (containsKey!401 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!464133)))

(declare-fun b!832196 () Bool)

(declare-fun e!464134 () Bool)

(assert (=> b!832196 (= e!464133 e!464134)))

(declare-fun res!566241 () Bool)

(assert (=> b!832196 (=> (not res!566241) (not e!464134))))

(assert (=> b!832196 (= res!566241 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377094))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377094))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15842) (toList!4466 lt!377094)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377094))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832197 () Bool)

(assert (=> b!832197 (= e!464134 (containsKey!401 (t!22203 (toList!4466 lt!377094)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106315 (not res!566240)) b!832196))

(assert (= (and b!832196 res!566241) b!832197))

(assert (=> b!832197 m!774611))

(declare-fun m!776279 () Bool)

(assert (=> b!832197 m!776279))

(assert (=> d!105787 d!106315))

(declare-fun d!106317 () Bool)

(assert (=> d!106317 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!377600 () Unit!28446)

(assert (=> d!106317 (= lt!377600 (choose!1427 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun e!464135 () Bool)

(assert (=> d!106317 e!464135))

(declare-fun res!566242 () Bool)

(assert (=> d!106317 (=> (not res!566242) (not e!464135))))

(assert (=> d!106317 (= res!566242 (isStrictlySorted!429 (toList!4466 lt!377216)))))

(assert (=> d!106317 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) lt!377600)))

(declare-fun b!832198 () Bool)

(assert (=> b!832198 (= e!464135 (containsKey!401 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106317 res!566242) b!832198))

(assert (=> d!106317 m!774835))

(assert (=> d!106317 m!774835))

(assert (=> d!106317 m!775295))

(declare-fun m!776281 () Bool)

(assert (=> d!106317 m!776281))

(declare-fun m!776283 () Bool)

(assert (=> d!106317 m!776283))

(assert (=> b!832198 m!775291))

(assert (=> b!831523 d!106317))

(declare-fun d!106319 () Bool)

(assert (=> d!106319 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun bs!23256 () Bool)

(assert (= bs!23256 d!106319))

(assert (=> bs!23256 m!774835))

(declare-fun m!776285 () Bool)

(assert (=> bs!23256 m!776285))

(assert (=> b!831523 d!106319))

(assert (=> b!831523 d!105893))

(declare-fun d!106321 () Bool)

(assert (=> d!106321 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))

(declare-fun lt!377601 () Unit!28446)

(assert (=> d!106321 (= lt!377601 (choose!1427 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))

(declare-fun e!464136 () Bool)

(assert (=> d!106321 e!464136))

(declare-fun res!566243 () Bool)

(assert (=> d!106321 (=> (not res!566243) (not e!464136))))

(assert (=> d!106321 (= res!566243 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (=> d!106321 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096) lt!377601)))

(declare-fun b!832199 () Bool)

(assert (=> b!832199 (= e!464136 (containsKey!401 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))

(assert (= (and d!106321 res!566243) b!832199))

(assert (=> d!106321 m!775421))

(assert (=> d!106321 m!775421))

(assert (=> d!106321 m!775423))

(declare-fun m!776287 () Bool)

(assert (=> d!106321 m!776287))

(declare-fun m!776289 () Bool)

(assert (=> d!106321 m!776289))

(assert (=> b!832199 m!775417))

(assert (=> b!831586 d!106321))

(declare-fun d!106323 () Bool)

(assert (=> d!106323 (= (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096)) (not (isEmpty!662 (getValueByKey!416 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096))))))

(declare-fun bs!23257 () Bool)

(assert (= bs!23257 d!106323))

(assert (=> bs!23257 m!775421))

(declare-fun m!776291 () Bool)

(assert (=> bs!23257 m!776291))

(assert (=> b!831586 d!106323))

(declare-fun b!832201 () Bool)

(declare-fun e!464137 () Option!422)

(declare-fun e!464138 () Option!422)

(assert (=> b!832201 (= e!464137 e!464138)))

(declare-fun c!90456 () Bool)

(assert (=> b!832201 (= c!90456 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))))) lt!377096))))))

(declare-fun b!832202 () Bool)

(assert (=> b!832202 (= e!464138 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))) lt!377096))))

(declare-fun d!106325 () Bool)

(declare-fun c!90455 () Bool)

(assert (=> d!106325 (= c!90455 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))))) lt!377096)))))

(assert (=> d!106325 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096) e!464137)))

(declare-fun b!832200 () Bool)

(assert (=> b!832200 (= e!464137 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))))))))

(declare-fun b!832203 () Bool)

(assert (=> b!832203 (= e!464138 None!420)))

(assert (= (and d!106325 c!90455) b!832200))

(assert (= (and d!106325 (not c!90455)) b!832201))

(assert (= (and b!832201 c!90456) b!832202))

(assert (= (and b!832201 (not c!90456)) b!832203))

(declare-fun m!776293 () Bool)

(assert (=> b!832202 m!776293))

(assert (=> b!831586 d!106325))

(assert (=> d!105853 d!105857))

(assert (=> d!105853 d!105855))

(declare-fun d!106327 () Bool)

(assert (=> d!106327 (not (contains!4187 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)) lt!377096))))

(assert (=> d!106327 true))

(declare-fun _$36!344 () Unit!28446)

(assert (=> d!106327 (= (choose!1426 lt!377097 lt!377093 lt!377098 lt!377096) _$36!344)))

(declare-fun bs!23258 () Bool)

(assert (= bs!23258 d!106327))

(assert (=> bs!23258 m!774661))

(assert (=> bs!23258 m!774661))

(assert (=> bs!23258 m!774663))

(assert (=> d!105853 d!106327))

(declare-fun d!106329 () Bool)

(declare-fun e!464140 () Bool)

(assert (=> d!106329 e!464140))

(declare-fun res!566244 () Bool)

(assert (=> d!106329 (=> res!566244 e!464140)))

(declare-fun lt!377604 () Bool)

(assert (=> d!106329 (= res!566244 (not lt!377604))))

(declare-fun lt!377603 () Bool)

(assert (=> d!106329 (= lt!377604 lt!377603)))

(declare-fun lt!377602 () Unit!28446)

(declare-fun e!464139 () Unit!28446)

(assert (=> d!106329 (= lt!377602 e!464139)))

(declare-fun c!90457 () Bool)

(assert (=> d!106329 (= c!90457 lt!377603)))

(assert (=> d!106329 (= lt!377603 (containsKey!401 (toList!4466 lt!377097) lt!377096))))

(assert (=> d!106329 (= (contains!4187 lt!377097 lt!377096) lt!377604)))

(declare-fun b!832204 () Bool)

(declare-fun lt!377605 () Unit!28446)

(assert (=> b!832204 (= e!464139 lt!377605)))

(assert (=> b!832204 (= lt!377605 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377097) lt!377096))))

(assert (=> b!832204 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377097) lt!377096))))

(declare-fun b!832205 () Bool)

(declare-fun Unit!28489 () Unit!28446)

(assert (=> b!832205 (= e!464139 Unit!28489)))

(declare-fun b!832206 () Bool)

(assert (=> b!832206 (= e!464140 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377097) lt!377096)))))

(assert (= (and d!106329 c!90457) b!832204))

(assert (= (and d!106329 (not c!90457)) b!832205))

(assert (= (and d!106329 (not res!566244)) b!832206))

(declare-fun m!776295 () Bool)

(assert (=> d!106329 m!776295))

(declare-fun m!776297 () Bool)

(assert (=> b!832204 m!776297))

(declare-fun m!776299 () Bool)

(assert (=> b!832204 m!776299))

(assert (=> b!832204 m!776299))

(declare-fun m!776301 () Bool)

(assert (=> b!832204 m!776301))

(assert (=> b!832206 m!776299))

(assert (=> b!832206 m!776299))

(assert (=> b!832206 m!776301))

(assert (=> d!105853 d!106329))

(declare-fun bm!36359 () Bool)

(declare-fun call!36362 () List!15846)

(declare-fun call!36363 () List!15846)

(assert (=> bm!36359 (= call!36362 call!36363)))

(declare-fun bm!36360 () Bool)

(declare-fun call!36364 () List!15846)

(assert (=> bm!36360 (= call!36363 call!36364)))

(declare-fun d!106331 () Bool)

(declare-fun e!464143 () Bool)

(assert (=> d!106331 e!464143))

(declare-fun res!566246 () Bool)

(assert (=> d!106331 (=> (not res!566246) (not e!464143))))

(declare-fun lt!377606 () List!15846)

(assert (=> d!106331 (= res!566246 (isStrictlySorted!429 lt!377606))))

(declare-fun e!464144 () List!15846)

(assert (=> d!106331 (= lt!377606 e!464144)))

(declare-fun c!90459 () Bool)

(assert (=> d!106331 (= c!90459 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (bvslt (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))))) (_1!5049 lt!377012))))))

(assert (=> d!106331 (isStrictlySorted!429 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))))))

(assert (=> d!106331 (= (insertStrictlySorted!269 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))) (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377606)))

(declare-fun c!90461 () Bool)

(declare-fun e!464145 () List!15846)

(declare-fun c!90460 () Bool)

(declare-fun b!832207 () Bool)

(assert (=> b!832207 (= e!464145 (ite c!90461 (t!22203 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (ite c!90460 (Cons!15842 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (t!22203 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))))) Nil!15843)))))

(declare-fun b!832208 () Bool)

(declare-fun e!464142 () List!15846)

(assert (=> b!832208 (= e!464142 call!36362)))

(declare-fun b!832209 () Bool)

(assert (=> b!832209 (= e!464142 call!36362)))

(declare-fun b!832210 () Bool)

(declare-fun e!464141 () List!15846)

(assert (=> b!832210 (= e!464141 call!36363)))

(declare-fun bm!36361 () Bool)

(assert (=> bm!36361 (= call!36364 ($colon$colon!533 e!464145 (ite c!90459 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))))))

(declare-fun c!90458 () Bool)

(assert (=> bm!36361 (= c!90458 c!90459)))

(declare-fun b!832211 () Bool)

(assert (=> b!832211 (= e!464145 (insertStrictlySorted!269 (t!22203 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun b!832212 () Bool)

(declare-fun res!566245 () Bool)

(assert (=> b!832212 (=> (not res!566245) (not e!464143))))

(assert (=> b!832212 (= res!566245 (containsKey!401 lt!377606 (_1!5049 lt!377012)))))

(declare-fun b!832213 () Bool)

(assert (=> b!832213 (= e!464144 e!464141)))

(assert (=> b!832213 (= c!90461 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))))) (_1!5049 lt!377012))))))

(declare-fun b!832214 () Bool)

(assert (=> b!832214 (= e!464143 (contains!4188 lt!377606 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!832215 () Bool)

(assert (=> b!832215 (= e!464144 call!36364)))

(declare-fun b!832216 () Bool)

(assert (=> b!832216 (= c!90460 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))) (bvsgt (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))))) (_1!5049 lt!377012))))))

(assert (=> b!832216 (= e!464141 e!464142)))

(assert (= (and d!106331 c!90459) b!832215))

(assert (= (and d!106331 (not c!90459)) b!832213))

(assert (= (and b!832213 c!90461) b!832210))

(assert (= (and b!832213 (not c!90461)) b!832216))

(assert (= (and b!832216 c!90460) b!832208))

(assert (= (and b!832216 (not c!90460)) b!832209))

(assert (= (or b!832208 b!832209) bm!36359))

(assert (= (or b!832210 bm!36359) bm!36360))

(assert (= (or b!832215 bm!36360) bm!36361))

(assert (= (and bm!36361 c!90458) b!832211))

(assert (= (and bm!36361 (not c!90458)) b!832207))

(assert (= (and d!106331 res!566246) b!832212))

(assert (= (and b!832212 res!566245) b!832214))

(declare-fun m!776303 () Bool)

(assert (=> d!106331 m!776303))

(declare-fun m!776305 () Bool)

(assert (=> d!106331 m!776305))

(declare-fun m!776307 () Bool)

(assert (=> bm!36361 m!776307))

(declare-fun m!776309 () Bool)

(assert (=> b!832211 m!776309))

(declare-fun m!776311 () Bool)

(assert (=> b!832212 m!776311))

(declare-fun m!776313 () Bool)

(assert (=> b!832214 m!776313))

(assert (=> b!831636 d!106331))

(declare-fun d!106333 () Bool)

(assert (=> d!106333 (= ($colon$colon!533 e!463681 (ite c!90242 (h!16977 (toList!4466 lt!377014)) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))) (Cons!15842 (ite c!90242 (h!16977 (toList!4466 lt!377014)) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) e!463681))))

(assert (=> bm!36317 d!106333))

(declare-fun d!106335 () Bool)

(declare-fun res!566247 () Bool)

(declare-fun e!464146 () Bool)

(assert (=> d!106335 (=> res!566247 e!464146)))

(assert (=> d!106335 (= res!566247 (or ((_ is Nil!15843) lt!377273) ((_ is Nil!15843) (t!22203 lt!377273))))))

(assert (=> d!106335 (= (isStrictlySorted!429 lt!377273) e!464146)))

(declare-fun b!832217 () Bool)

(declare-fun e!464147 () Bool)

(assert (=> b!832217 (= e!464146 e!464147)))

(declare-fun res!566248 () Bool)

(assert (=> b!832217 (=> (not res!566248) (not e!464147))))

(assert (=> b!832217 (= res!566248 (bvslt (_1!5049 (h!16977 lt!377273)) (_1!5049 (h!16977 (t!22203 lt!377273)))))))

(declare-fun b!832218 () Bool)

(assert (=> b!832218 (= e!464147 (isStrictlySorted!429 (t!22203 lt!377273)))))

(assert (= (and d!106335 (not res!566247)) b!832217))

(assert (= (and b!832217 res!566248) b!832218))

(declare-fun m!776315 () Bool)

(assert (=> b!832218 m!776315))

(assert (=> d!105719 d!106335))

(assert (=> d!105719 d!106045))

(declare-fun d!106337 () Bool)

(declare-fun e!464149 () Bool)

(assert (=> d!106337 e!464149))

(declare-fun res!566249 () Bool)

(assert (=> d!106337 (=> res!566249 e!464149)))

(declare-fun lt!377609 () Bool)

(assert (=> d!106337 (= res!566249 (not lt!377609))))

(declare-fun lt!377608 () Bool)

(assert (=> d!106337 (= lt!377609 lt!377608)))

(declare-fun lt!377607 () Unit!28446)

(declare-fun e!464148 () Unit!28446)

(assert (=> d!106337 (= lt!377607 e!464148)))

(declare-fun c!90462 () Bool)

(assert (=> d!106337 (= c!90462 lt!377608)))

(assert (=> d!106337 (= lt!377608 (containsKey!401 (toList!4466 lt!377294) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(assert (=> d!106337 (= (contains!4187 lt!377294 (_1!5049 (tuple2!10077 lt!377187 minValue!754))) lt!377609)))

(declare-fun b!832219 () Bool)

(declare-fun lt!377610 () Unit!28446)

(assert (=> b!832219 (= e!464148 lt!377610)))

(assert (=> b!832219 (= lt!377610 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377294) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(assert (=> b!832219 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377294) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun b!832220 () Bool)

(declare-fun Unit!28490 () Unit!28446)

(assert (=> b!832220 (= e!464148 Unit!28490)))

(declare-fun b!832221 () Bool)

(assert (=> b!832221 (= e!464149 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377294) (_1!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(assert (= (and d!106337 c!90462) b!832219))

(assert (= (and d!106337 (not c!90462)) b!832220))

(assert (= (and d!106337 (not res!566249)) b!832221))

(declare-fun m!776317 () Bool)

(assert (=> d!106337 m!776317))

(declare-fun m!776319 () Bool)

(assert (=> b!832219 m!776319))

(assert (=> b!832219 m!775027))

(assert (=> b!832219 m!775027))

(declare-fun m!776321 () Bool)

(assert (=> b!832219 m!776321))

(assert (=> b!832221 m!775027))

(assert (=> b!832221 m!775027))

(assert (=> b!832221 m!776321))

(assert (=> d!105737 d!106337))

(declare-fun b!832223 () Bool)

(declare-fun e!464150 () Option!422)

(declare-fun e!464151 () Option!422)

(assert (=> b!832223 (= e!464150 e!464151)))

(declare-fun c!90464 () Bool)

(assert (=> b!832223 (= c!90464 (and ((_ is Cons!15842) lt!377296) (not (= (_1!5049 (h!16977 lt!377296)) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))))

(declare-fun b!832224 () Bool)

(assert (=> b!832224 (= e!464151 (getValueByKey!416 (t!22203 lt!377296) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun d!106339 () Bool)

(declare-fun c!90463 () Bool)

(assert (=> d!106339 (= c!90463 (and ((_ is Cons!15842) lt!377296) (= (_1!5049 (h!16977 lt!377296)) (_1!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(assert (=> d!106339 (= (getValueByKey!416 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754))) e!464150)))

(declare-fun b!832222 () Bool)

(assert (=> b!832222 (= e!464150 (Some!421 (_2!5049 (h!16977 lt!377296))))))

(declare-fun b!832225 () Bool)

(assert (=> b!832225 (= e!464151 None!420)))

(assert (= (and d!106339 c!90463) b!832222))

(assert (= (and d!106339 (not c!90463)) b!832223))

(assert (= (and b!832223 c!90464) b!832224))

(assert (= (and b!832223 (not c!90464)) b!832225))

(declare-fun m!776323 () Bool)

(assert (=> b!832224 m!776323))

(assert (=> d!105737 d!106339))

(declare-fun d!106341 () Bool)

(assert (=> d!106341 (= (getValueByKey!416 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun lt!377611 () Unit!28446)

(assert (=> d!106341 (= lt!377611 (choose!1423 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun e!464152 () Bool)

(assert (=> d!106341 e!464152))

(declare-fun res!566250 () Bool)

(assert (=> d!106341 (=> (not res!566250) (not e!464152))))

(assert (=> d!106341 (= res!566250 (isStrictlySorted!429 lt!377296))))

(assert (=> d!106341 (= (lemmaContainsTupThenGetReturnValue!230 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))) lt!377611)))

(declare-fun b!832226 () Bool)

(declare-fun res!566251 () Bool)

(assert (=> b!832226 (=> (not res!566251) (not e!464152))))

(assert (=> b!832226 (= res!566251 (containsKey!401 lt!377296 (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun b!832227 () Bool)

(assert (=> b!832227 (= e!464152 (contains!4188 lt!377296 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(assert (= (and d!106341 res!566250) b!832226))

(assert (= (and b!832226 res!566251) b!832227))

(assert (=> d!106341 m!775021))

(declare-fun m!776325 () Bool)

(assert (=> d!106341 m!776325))

(declare-fun m!776327 () Bool)

(assert (=> d!106341 m!776327))

(declare-fun m!776329 () Bool)

(assert (=> b!832226 m!776329))

(declare-fun m!776331 () Bool)

(assert (=> b!832227 m!776331))

(assert (=> d!105737 d!106341))

(declare-fun bm!36362 () Bool)

(declare-fun call!36365 () List!15846)

(declare-fun call!36366 () List!15846)

(assert (=> bm!36362 (= call!36365 call!36366)))

(declare-fun bm!36363 () Bool)

(declare-fun call!36367 () List!15846)

(assert (=> bm!36363 (= call!36366 call!36367)))

(declare-fun d!106343 () Bool)

(declare-fun e!464155 () Bool)

(assert (=> d!106343 e!464155))

(declare-fun res!566253 () Bool)

(assert (=> d!106343 (=> (not res!566253) (not e!464155))))

(declare-fun lt!377612 () List!15846)

(assert (=> d!106343 (= res!566253 (isStrictlySorted!429 lt!377612))))

(declare-fun e!464156 () List!15846)

(assert (=> d!106343 (= lt!377612 e!464156)))

(declare-fun c!90466 () Bool)

(assert (=> d!106343 (= c!90466 (and ((_ is Cons!15842) (toList!4466 lt!377204)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377204))) (_1!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(assert (=> d!106343 (isStrictlySorted!429 (toList!4466 lt!377204))))

(assert (=> d!106343 (= (insertStrictlySorted!269 (toList!4466 lt!377204) (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))) lt!377612)))

(declare-fun c!90468 () Bool)

(declare-fun b!832228 () Bool)

(declare-fun c!90467 () Bool)

(declare-fun e!464157 () List!15846)

(assert (=> b!832228 (= e!464157 (ite c!90468 (t!22203 (toList!4466 lt!377204)) (ite c!90467 (Cons!15842 (h!16977 (toList!4466 lt!377204)) (t!22203 (toList!4466 lt!377204))) Nil!15843)))))

(declare-fun b!832229 () Bool)

(declare-fun e!464154 () List!15846)

(assert (=> b!832229 (= e!464154 call!36365)))

(declare-fun b!832230 () Bool)

(assert (=> b!832230 (= e!464154 call!36365)))

(declare-fun b!832231 () Bool)

(declare-fun e!464153 () List!15846)

(assert (=> b!832231 (= e!464153 call!36366)))

(declare-fun bm!36364 () Bool)

(assert (=> bm!36364 (= call!36367 ($colon$colon!533 e!464157 (ite c!90466 (h!16977 (toList!4466 lt!377204)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))))

(declare-fun c!90465 () Bool)

(assert (=> bm!36364 (= c!90465 c!90466)))

(declare-fun b!832232 () Bool)

(assert (=> b!832232 (= e!464157 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377204)) (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun b!832233 () Bool)

(declare-fun res!566252 () Bool)

(assert (=> b!832233 (=> (not res!566252) (not e!464155))))

(assert (=> b!832233 (= res!566252 (containsKey!401 lt!377612 (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun b!832234 () Bool)

(assert (=> b!832234 (= e!464156 e!464153)))

(assert (=> b!832234 (= c!90468 (and ((_ is Cons!15842) (toList!4466 lt!377204)) (= (_1!5049 (h!16977 (toList!4466 lt!377204))) (_1!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(declare-fun b!832235 () Bool)

(assert (=> b!832235 (= e!464155 (contains!4188 lt!377612 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377187 minValue!754)) (_2!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(declare-fun b!832236 () Bool)

(assert (=> b!832236 (= e!464156 call!36367)))

(declare-fun b!832237 () Bool)

(assert (=> b!832237 (= c!90467 (and ((_ is Cons!15842) (toList!4466 lt!377204)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377204))) (_1!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(assert (=> b!832237 (= e!464153 e!464154)))

(assert (= (and d!106343 c!90466) b!832236))

(assert (= (and d!106343 (not c!90466)) b!832234))

(assert (= (and b!832234 c!90468) b!832231))

(assert (= (and b!832234 (not c!90468)) b!832237))

(assert (= (and b!832237 c!90467) b!832229))

(assert (= (and b!832237 (not c!90467)) b!832230))

(assert (= (or b!832229 b!832230) bm!36362))

(assert (= (or b!832231 bm!36362) bm!36363))

(assert (= (or b!832236 bm!36363) bm!36364))

(assert (= (and bm!36364 c!90465) b!832232))

(assert (= (and bm!36364 (not c!90465)) b!832228))

(assert (= (and d!106343 res!566253) b!832233))

(assert (= (and b!832233 res!566252) b!832235))

(declare-fun m!776333 () Bool)

(assert (=> d!106343 m!776333))

(declare-fun m!776335 () Bool)

(assert (=> d!106343 m!776335))

(declare-fun m!776337 () Bool)

(assert (=> bm!36364 m!776337))

(declare-fun m!776339 () Bool)

(assert (=> b!832232 m!776339))

(declare-fun m!776341 () Bool)

(assert (=> b!832233 m!776341))

(declare-fun m!776343 () Bool)

(assert (=> b!832235 m!776343))

(assert (=> d!105737 d!106343))

(declare-fun d!106345 () Bool)

(declare-fun e!464159 () Bool)

(assert (=> d!106345 e!464159))

(declare-fun res!566254 () Bool)

(assert (=> d!106345 (=> res!566254 e!464159)))

(declare-fun lt!377615 () Bool)

(assert (=> d!106345 (= res!566254 (not lt!377615))))

(declare-fun lt!377614 () Bool)

(assert (=> d!106345 (= lt!377615 lt!377614)))

(declare-fun lt!377613 () Unit!28446)

(declare-fun e!464158 () Unit!28446)

(assert (=> d!106345 (= lt!377613 e!464158)))

(declare-fun c!90469 () Bool)

(assert (=> d!106345 (= c!90469 lt!377614)))

(assert (=> d!106345 (= lt!377614 (containsKey!401 (toList!4466 lt!377364) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(assert (=> d!106345 (= (contains!4187 lt!377364 (_1!5049 (tuple2!10077 lt!377165 minValue!754))) lt!377615)))

(declare-fun b!832238 () Bool)

(declare-fun lt!377616 () Unit!28446)

(assert (=> b!832238 (= e!464158 lt!377616)))

(assert (=> b!832238 (= lt!377616 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377364) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(assert (=> b!832238 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377364) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun b!832239 () Bool)

(declare-fun Unit!28491 () Unit!28446)

(assert (=> b!832239 (= e!464158 Unit!28491)))

(declare-fun b!832240 () Bool)

(assert (=> b!832240 (= e!464159 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377364) (_1!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(assert (= (and d!106345 c!90469) b!832238))

(assert (= (and d!106345 (not c!90469)) b!832239))

(assert (= (and d!106345 (not res!566254)) b!832240))

(declare-fun m!776345 () Bool)

(assert (=> d!106345 m!776345))

(declare-fun m!776347 () Bool)

(assert (=> b!832238 m!776347))

(assert (=> b!832238 m!775277))

(assert (=> b!832238 m!775277))

(declare-fun m!776349 () Bool)

(assert (=> b!832238 m!776349))

(assert (=> b!832240 m!775277))

(assert (=> b!832240 m!775277))

(assert (=> b!832240 m!776349))

(assert (=> d!105815 d!106345))

(declare-fun b!832242 () Bool)

(declare-fun e!464160 () Option!422)

(declare-fun e!464161 () Option!422)

(assert (=> b!832242 (= e!464160 e!464161)))

(declare-fun c!90471 () Bool)

(assert (=> b!832242 (= c!90471 (and ((_ is Cons!15842) lt!377366) (not (= (_1!5049 (h!16977 lt!377366)) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))))

(declare-fun b!832243 () Bool)

(assert (=> b!832243 (= e!464161 (getValueByKey!416 (t!22203 lt!377366) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun c!90470 () Bool)

(declare-fun d!106347 () Bool)

(assert (=> d!106347 (= c!90470 (and ((_ is Cons!15842) lt!377366) (= (_1!5049 (h!16977 lt!377366)) (_1!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(assert (=> d!106347 (= (getValueByKey!416 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754))) e!464160)))

(declare-fun b!832241 () Bool)

(assert (=> b!832241 (= e!464160 (Some!421 (_2!5049 (h!16977 lt!377366))))))

(declare-fun b!832244 () Bool)

(assert (=> b!832244 (= e!464161 None!420)))

(assert (= (and d!106347 c!90470) b!832241))

(assert (= (and d!106347 (not c!90470)) b!832242))

(assert (= (and b!832242 c!90471) b!832243))

(assert (= (and b!832242 (not c!90471)) b!832244))

(declare-fun m!776351 () Bool)

(assert (=> b!832243 m!776351))

(assert (=> d!105815 d!106347))

(declare-fun d!106349 () Bool)

(assert (=> d!106349 (= (getValueByKey!416 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun lt!377617 () Unit!28446)

(assert (=> d!106349 (= lt!377617 (choose!1423 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun e!464162 () Bool)

(assert (=> d!106349 e!464162))

(declare-fun res!566255 () Bool)

(assert (=> d!106349 (=> (not res!566255) (not e!464162))))

(assert (=> d!106349 (= res!566255 (isStrictlySorted!429 lt!377366))))

(assert (=> d!106349 (= (lemmaContainsTupThenGetReturnValue!230 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))) lt!377617)))

(declare-fun b!832245 () Bool)

(declare-fun res!566256 () Bool)

(assert (=> b!832245 (=> (not res!566256) (not e!464162))))

(assert (=> b!832245 (= res!566256 (containsKey!401 lt!377366 (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun b!832246 () Bool)

(assert (=> b!832246 (= e!464162 (contains!4188 lt!377366 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(assert (= (and d!106349 res!566255) b!832245))

(assert (= (and b!832245 res!566256) b!832246))

(assert (=> d!106349 m!775271))

(declare-fun m!776353 () Bool)

(assert (=> d!106349 m!776353))

(declare-fun m!776355 () Bool)

(assert (=> d!106349 m!776355))

(declare-fun m!776357 () Bool)

(assert (=> b!832245 m!776357))

(declare-fun m!776359 () Bool)

(assert (=> b!832246 m!776359))

(assert (=> d!105815 d!106349))

(declare-fun bm!36365 () Bool)

(declare-fun call!36368 () List!15846)

(declare-fun call!36369 () List!15846)

(assert (=> bm!36365 (= call!36368 call!36369)))

(declare-fun bm!36366 () Bool)

(declare-fun call!36370 () List!15846)

(assert (=> bm!36366 (= call!36369 call!36370)))

(declare-fun d!106351 () Bool)

(declare-fun e!464165 () Bool)

(assert (=> d!106351 e!464165))

(declare-fun res!566258 () Bool)

(assert (=> d!106351 (=> (not res!566258) (not e!464165))))

(declare-fun lt!377618 () List!15846)

(assert (=> d!106351 (= res!566258 (isStrictlySorted!429 lt!377618))))

(declare-fun e!464166 () List!15846)

(assert (=> d!106351 (= lt!377618 e!464166)))

(declare-fun c!90473 () Bool)

(assert (=> d!106351 (= c!90473 (and ((_ is Cons!15842) (toList!4466 lt!377182)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377182))) (_1!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(assert (=> d!106351 (isStrictlySorted!429 (toList!4466 lt!377182))))

(assert (=> d!106351 (= (insertStrictlySorted!269 (toList!4466 lt!377182) (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))) lt!377618)))

(declare-fun e!464167 () List!15846)

(declare-fun c!90475 () Bool)

(declare-fun c!90474 () Bool)

(declare-fun b!832247 () Bool)

(assert (=> b!832247 (= e!464167 (ite c!90475 (t!22203 (toList!4466 lt!377182)) (ite c!90474 (Cons!15842 (h!16977 (toList!4466 lt!377182)) (t!22203 (toList!4466 lt!377182))) Nil!15843)))))

(declare-fun b!832248 () Bool)

(declare-fun e!464164 () List!15846)

(assert (=> b!832248 (= e!464164 call!36368)))

(declare-fun b!832249 () Bool)

(assert (=> b!832249 (= e!464164 call!36368)))

(declare-fun b!832250 () Bool)

(declare-fun e!464163 () List!15846)

(assert (=> b!832250 (= e!464163 call!36369)))

(declare-fun bm!36367 () Bool)

(assert (=> bm!36367 (= call!36370 ($colon$colon!533 e!464167 (ite c!90473 (h!16977 (toList!4466 lt!377182)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))))

(declare-fun c!90472 () Bool)

(assert (=> bm!36367 (= c!90472 c!90473)))

(declare-fun b!832251 () Bool)

(assert (=> b!832251 (= e!464167 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377182)) (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun b!832252 () Bool)

(declare-fun res!566257 () Bool)

(assert (=> b!832252 (=> (not res!566257) (not e!464165))))

(assert (=> b!832252 (= res!566257 (containsKey!401 lt!377618 (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun b!832253 () Bool)

(assert (=> b!832253 (= e!464166 e!464163)))

(assert (=> b!832253 (= c!90475 (and ((_ is Cons!15842) (toList!4466 lt!377182)) (= (_1!5049 (h!16977 (toList!4466 lt!377182))) (_1!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(declare-fun b!832254 () Bool)

(assert (=> b!832254 (= e!464165 (contains!4188 lt!377618 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377165 minValue!754)) (_2!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(declare-fun b!832255 () Bool)

(assert (=> b!832255 (= e!464166 call!36370)))

(declare-fun b!832256 () Bool)

(assert (=> b!832256 (= c!90474 (and ((_ is Cons!15842) (toList!4466 lt!377182)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377182))) (_1!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(assert (=> b!832256 (= e!464163 e!464164)))

(assert (= (and d!106351 c!90473) b!832255))

(assert (= (and d!106351 (not c!90473)) b!832253))

(assert (= (and b!832253 c!90475) b!832250))

(assert (= (and b!832253 (not c!90475)) b!832256))

(assert (= (and b!832256 c!90474) b!832248))

(assert (= (and b!832256 (not c!90474)) b!832249))

(assert (= (or b!832248 b!832249) bm!36365))

(assert (= (or b!832250 bm!36365) bm!36366))

(assert (= (or b!832255 bm!36366) bm!36367))

(assert (= (and bm!36367 c!90472) b!832251))

(assert (= (and bm!36367 (not c!90472)) b!832247))

(assert (= (and d!106351 res!566258) b!832252))

(assert (= (and b!832252 res!566257) b!832254))

(declare-fun m!776361 () Bool)

(assert (=> d!106351 m!776361))

(declare-fun m!776363 () Bool)

(assert (=> d!106351 m!776363))

(declare-fun m!776365 () Bool)

(assert (=> bm!36367 m!776365))

(declare-fun m!776367 () Bool)

(assert (=> b!832251 m!776367))

(declare-fun m!776369 () Bool)

(assert (=> b!832252 m!776369))

(declare-fun m!776371 () Bool)

(assert (=> b!832254 m!776371))

(assert (=> d!105815 d!106351))

(declare-fun bm!36368 () Bool)

(declare-fun call!36371 () List!15846)

(declare-fun call!36372 () List!15846)

(assert (=> bm!36368 (= call!36371 call!36372)))

(declare-fun bm!36369 () Bool)

(declare-fun call!36373 () List!15846)

(assert (=> bm!36369 (= call!36372 call!36373)))

(declare-fun d!106353 () Bool)

(declare-fun e!464170 () Bool)

(assert (=> d!106353 e!464170))

(declare-fun res!566260 () Bool)

(assert (=> d!106353 (=> (not res!566260) (not e!464170))))

(declare-fun lt!377619 () List!15846)

(assert (=> d!106353 (= res!566260 (isStrictlySorted!429 lt!377619))))

(declare-fun e!464171 () List!15846)

(assert (=> d!106353 (= lt!377619 e!464171)))

(declare-fun c!90477 () Bool)

(assert (=> d!106353 (= c!90477 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377014))) (bvslt (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014)))) (_1!5049 lt!377010))))))

(assert (=> d!106353 (isStrictlySorted!429 (t!22203 (toList!4466 lt!377014)))))

(assert (=> d!106353 (= (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377014)) (_1!5049 lt!377010) (_2!5049 lt!377010)) lt!377619)))

(declare-fun c!90479 () Bool)

(declare-fun e!464172 () List!15846)

(declare-fun b!832257 () Bool)

(declare-fun c!90478 () Bool)

(assert (=> b!832257 (= e!464172 (ite c!90479 (t!22203 (t!22203 (toList!4466 lt!377014))) (ite c!90478 (Cons!15842 (h!16977 (t!22203 (toList!4466 lt!377014))) (t!22203 (t!22203 (toList!4466 lt!377014)))) Nil!15843)))))

(declare-fun b!832258 () Bool)

(declare-fun e!464169 () List!15846)

(assert (=> b!832258 (= e!464169 call!36371)))

(declare-fun b!832259 () Bool)

(assert (=> b!832259 (= e!464169 call!36371)))

(declare-fun b!832260 () Bool)

(declare-fun e!464168 () List!15846)

(assert (=> b!832260 (= e!464168 call!36372)))

(declare-fun bm!36370 () Bool)

(assert (=> bm!36370 (= call!36373 ($colon$colon!533 e!464172 (ite c!90477 (h!16977 (t!22203 (toList!4466 lt!377014))) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010)))))))

(declare-fun c!90476 () Bool)

(assert (=> bm!36370 (= c!90476 c!90477)))

(declare-fun b!832261 () Bool)

(assert (=> b!832261 (= e!464172 (insertStrictlySorted!269 (t!22203 (t!22203 (toList!4466 lt!377014))) (_1!5049 lt!377010) (_2!5049 lt!377010)))))

(declare-fun b!832262 () Bool)

(declare-fun res!566259 () Bool)

(assert (=> b!832262 (=> (not res!566259) (not e!464170))))

(assert (=> b!832262 (= res!566259 (containsKey!401 lt!377619 (_1!5049 lt!377010)))))

(declare-fun b!832263 () Bool)

(assert (=> b!832263 (= e!464171 e!464168)))

(assert (=> b!832263 (= c!90479 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377014))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014)))) (_1!5049 lt!377010))))))

(declare-fun b!832264 () Bool)

(assert (=> b!832264 (= e!464170 (contains!4188 lt!377619 (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))))))

(declare-fun b!832265 () Bool)

(assert (=> b!832265 (= e!464171 call!36373)))

(declare-fun b!832266 () Bool)

(assert (=> b!832266 (= c!90478 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377014))) (bvsgt (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014)))) (_1!5049 lt!377010))))))

(assert (=> b!832266 (= e!464168 e!464169)))

(assert (= (and d!106353 c!90477) b!832265))

(assert (= (and d!106353 (not c!90477)) b!832263))

(assert (= (and b!832263 c!90479) b!832260))

(assert (= (and b!832263 (not c!90479)) b!832266))

(assert (= (and b!832266 c!90478) b!832258))

(assert (= (and b!832266 (not c!90478)) b!832259))

(assert (= (or b!832258 b!832259) bm!36368))

(assert (= (or b!832260 bm!36368) bm!36369))

(assert (= (or b!832265 bm!36369) bm!36370))

(assert (= (and bm!36370 c!90476) b!832261))

(assert (= (and bm!36370 (not c!90476)) b!832257))

(assert (= (and d!106353 res!566260) b!832262))

(assert (= (and b!832262 res!566259) b!832264))

(declare-fun m!776373 () Bool)

(assert (=> d!106353 m!776373))

(assert (=> d!106353 m!775791))

(declare-fun m!776375 () Bool)

(assert (=> bm!36370 m!776375))

(declare-fun m!776377 () Bool)

(assert (=> b!832261 m!776377))

(declare-fun m!776379 () Bool)

(assert (=> b!832262 m!776379))

(declare-fun m!776381 () Bool)

(assert (=> b!832264 m!776381))

(assert (=> b!831434 d!106353))

(assert (=> b!831373 d!105953))

(assert (=> b!831648 d!106135))

(assert (=> b!831648 d!105925))

(declare-fun b!832268 () Bool)

(declare-fun e!464173 () Option!422)

(declare-fun e!464174 () Option!422)

(assert (=> b!832268 (= e!464173 e!464174)))

(declare-fun c!90481 () Bool)

(assert (=> b!832268 (= c!90481 (and ((_ is Cons!15842) (toList!4466 lt!377276)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377276))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832269 () Bool)

(assert (=> b!832269 (= e!464174 (getValueByKey!416 (t!22203 (toList!4466 lt!377276)) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!106355 () Bool)

(declare-fun c!90480 () Bool)

(assert (=> d!106355 (= c!90480 (and ((_ is Cons!15842) (toList!4466 lt!377276)) (= (_1!5049 (h!16977 (toList!4466 lt!377276))) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106355 (= (getValueByKey!416 (toList!4466 lt!377276) (_1!5049 (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464173)))

(declare-fun b!832267 () Bool)

(assert (=> b!832267 (= e!464173 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377276)))))))

(declare-fun b!832270 () Bool)

(assert (=> b!832270 (= e!464174 None!420)))

(assert (= (and d!106355 c!90480) b!832267))

(assert (= (and d!106355 (not c!90480)) b!832268))

(assert (= (and b!832268 c!90481) b!832269))

(assert (= (and b!832268 (not c!90481)) b!832270))

(declare-fun m!776383 () Bool)

(assert (=> b!832269 m!776383))

(assert (=> b!831442 d!106355))

(declare-fun lt!377620 () Bool)

(declare-fun d!106357 () Bool)

(assert (=> d!106357 (= lt!377620 (select (content!386 (toList!4466 lt!377308)) (tuple2!10077 lt!377189 zeroValueAfter!34)))))

(declare-fun e!464176 () Bool)

(assert (=> d!106357 (= lt!377620 e!464176)))

(declare-fun res!566261 () Bool)

(assert (=> d!106357 (=> (not res!566261) (not e!464176))))

(assert (=> d!106357 (= res!566261 ((_ is Cons!15842) (toList!4466 lt!377308)))))

(assert (=> d!106357 (= (contains!4188 (toList!4466 lt!377308) (tuple2!10077 lt!377189 zeroValueAfter!34)) lt!377620)))

(declare-fun b!832271 () Bool)

(declare-fun e!464175 () Bool)

(assert (=> b!832271 (= e!464176 e!464175)))

(declare-fun res!566262 () Bool)

(assert (=> b!832271 (=> res!566262 e!464175)))

(assert (=> b!832271 (= res!566262 (= (h!16977 (toList!4466 lt!377308)) (tuple2!10077 lt!377189 zeroValueAfter!34)))))

(declare-fun b!832272 () Bool)

(assert (=> b!832272 (= e!464175 (contains!4188 (t!22203 (toList!4466 lt!377308)) (tuple2!10077 lt!377189 zeroValueAfter!34)))))

(assert (= (and d!106357 res!566261) b!832271))

(assert (= (and b!832271 (not res!566262)) b!832272))

(declare-fun m!776385 () Bool)

(assert (=> d!106357 m!776385))

(declare-fun m!776387 () Bool)

(assert (=> d!106357 m!776387))

(declare-fun m!776389 () Bool)

(assert (=> b!832272 m!776389))

(assert (=> b!831464 d!106357))

(declare-fun d!106359 () Bool)

(declare-fun res!566263 () Bool)

(declare-fun e!464177 () Bool)

(assert (=> d!106359 (=> res!566263 e!464177)))

(assert (=> d!106359 (= res!566263 (and ((_ is Cons!15842) (toList!4466 lt!377216)) (= (_1!5049 (h!16977 (toList!4466 lt!377216))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106359 (= (containsKey!401 (toList!4466 lt!377216) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464177)))

(declare-fun b!832273 () Bool)

(declare-fun e!464178 () Bool)

(assert (=> b!832273 (= e!464177 e!464178)))

(declare-fun res!566264 () Bool)

(assert (=> b!832273 (=> (not res!566264) (not e!464178))))

(assert (=> b!832273 (= res!566264 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377216))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377216))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15842) (toList!4466 lt!377216)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377216))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832274 () Bool)

(assert (=> b!832274 (= e!464178 (containsKey!401 (t!22203 (toList!4466 lt!377216)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106359 (not res!566263)) b!832273))

(assert (= (and b!832273 res!566264) b!832274))

(declare-fun m!776391 () Bool)

(assert (=> b!832274 m!776391))

(assert (=> d!105823 d!106359))

(declare-fun lt!377621 () Bool)

(declare-fun d!106361 () Bool)

(assert (=> d!106361 (= lt!377621 (select (content!386 (toList!4466 lt!377352)) (tuple2!10077 lt!377173 minValue!754)))))

(declare-fun e!464180 () Bool)

(assert (=> d!106361 (= lt!377621 e!464180)))

(declare-fun res!566265 () Bool)

(assert (=> d!106361 (=> (not res!566265) (not e!464180))))

(assert (=> d!106361 (= res!566265 ((_ is Cons!15842) (toList!4466 lt!377352)))))

(assert (=> d!106361 (= (contains!4188 (toList!4466 lt!377352) (tuple2!10077 lt!377173 minValue!754)) lt!377621)))

(declare-fun b!832275 () Bool)

(declare-fun e!464179 () Bool)

(assert (=> b!832275 (= e!464180 e!464179)))

(declare-fun res!566266 () Bool)

(assert (=> b!832275 (=> res!566266 e!464179)))

(assert (=> b!832275 (= res!566266 (= (h!16977 (toList!4466 lt!377352)) (tuple2!10077 lt!377173 minValue!754)))))

(declare-fun b!832276 () Bool)

(assert (=> b!832276 (= e!464179 (contains!4188 (t!22203 (toList!4466 lt!377352)) (tuple2!10077 lt!377173 minValue!754)))))

(assert (= (and d!106361 res!566265) b!832275))

(assert (= (and b!832275 (not res!566266)) b!832276))

(declare-fun m!776393 () Bool)

(assert (=> d!106361 m!776393))

(declare-fun m!776395 () Bool)

(assert (=> d!106361 m!776395))

(declare-fun m!776397 () Bool)

(assert (=> b!832276 m!776397))

(assert (=> b!831516 d!106361))

(assert (=> b!831625 d!106161))

(assert (=> b!831625 d!105899))

(declare-fun d!106363 () Bool)

(declare-fun res!566267 () Bool)

(declare-fun e!464181 () Bool)

(assert (=> d!106363 (=> res!566267 e!464181)))

(assert (=> d!106363 (= res!566267 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))))) lt!377096)))))

(assert (=> d!106363 (= (containsKey!401 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))) lt!377096) e!464181)))

(declare-fun b!832277 () Bool)

(declare-fun e!464182 () Bool)

(assert (=> b!832277 (= e!464181 e!464182)))

(declare-fun res!566268 () Bool)

(assert (=> b!832277 (=> (not res!566268) (not e!464182))))

(assert (=> b!832277 (= res!566268 (and (or (not ((_ is Cons!15842) (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))))) (bvsle (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))))) lt!377096)) ((_ is Cons!15842) (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098))))) lt!377096)))))

(declare-fun b!832278 () Bool)

(assert (=> b!832278 (= e!464182 (containsKey!401 (t!22203 (toList!4466 (+!1988 lt!377097 (tuple2!10077 lt!377093 lt!377098)))) lt!377096))))

(assert (= (and d!106363 (not res!566267)) b!832277))

(assert (= (and b!832277 res!566268) b!832278))

(declare-fun m!776399 () Bool)

(assert (=> b!832278 m!776399))

(assert (=> d!105857 d!106363))

(declare-fun d!106365 () Bool)

(declare-fun lt!377622 () Bool)

(assert (=> d!106365 (= lt!377622 (select (content!386 (t!22203 (toList!4466 lt!377112))) lt!377012))))

(declare-fun e!464184 () Bool)

(assert (=> d!106365 (= lt!377622 e!464184)))

(declare-fun res!566269 () Bool)

(assert (=> d!106365 (=> (not res!566269) (not e!464184))))

(assert (=> d!106365 (= res!566269 ((_ is Cons!15842) (t!22203 (toList!4466 lt!377112))))))

(assert (=> d!106365 (= (contains!4188 (t!22203 (toList!4466 lt!377112)) lt!377012) lt!377622)))

(declare-fun b!832279 () Bool)

(declare-fun e!464183 () Bool)

(assert (=> b!832279 (= e!464184 e!464183)))

(declare-fun res!566270 () Bool)

(assert (=> b!832279 (=> res!566270 e!464183)))

(assert (=> b!832279 (= res!566270 (= (h!16977 (t!22203 (toList!4466 lt!377112))) lt!377012))))

(declare-fun b!832280 () Bool)

(assert (=> b!832280 (= e!464183 (contains!4188 (t!22203 (t!22203 (toList!4466 lt!377112))) lt!377012))))

(assert (= (and d!106365 res!566269) b!832279))

(assert (= (and b!832279 (not res!566270)) b!832280))

(declare-fun m!776401 () Bool)

(assert (=> d!106365 m!776401))

(declare-fun m!776403 () Bool)

(assert (=> d!106365 m!776403))

(declare-fun m!776405 () Bool)

(assert (=> b!832280 m!776405))

(assert (=> b!831494 d!106365))

(declare-fun d!106367 () Bool)

(declare-fun res!566271 () Bool)

(declare-fun e!464185 () Bool)

(assert (=> d!106367 (=> res!566271 e!464185)))

(assert (=> d!106367 (= res!566271 (= (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377065))))

(assert (=> d!106367 (= (arrayContainsKey!0 _keys!976 lt!377065 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!464185)))

(declare-fun b!832281 () Bool)

(declare-fun e!464186 () Bool)

(assert (=> b!832281 (= e!464185 e!464186)))

(declare-fun res!566272 () Bool)

(assert (=> b!832281 (=> (not res!566272) (not e!464186))))

(assert (=> b!832281 (= res!566272 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!832282 () Bool)

(assert (=> b!832282 (= e!464186 (arrayContainsKey!0 _keys!976 lt!377065 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!106367 (not res!566271)) b!832281))

(assert (= (and b!832281 res!566272) b!832282))

(assert (=> d!106367 m!774867))

(declare-fun m!776407 () Bool)

(assert (=> b!832282 m!776407))

(assert (=> b!831328 d!106367))

(declare-fun d!106369 () Bool)

(declare-fun lt!377623 () Bool)

(assert (=> d!106369 (= lt!377623 (select (content!386 (toList!4466 lt!377448)) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464188 () Bool)

(assert (=> d!106369 (= lt!377623 e!464188)))

(declare-fun res!566273 () Bool)

(assert (=> d!106369 (=> (not res!566273) (not e!464188))))

(assert (=> d!106369 (= res!566273 ((_ is Cons!15842) (toList!4466 lt!377448)))))

(assert (=> d!106369 (= (contains!4188 (toList!4466 lt!377448) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377623)))

(declare-fun b!832283 () Bool)

(declare-fun e!464187 () Bool)

(assert (=> b!832283 (= e!464188 e!464187)))

(declare-fun res!566274 () Bool)

(assert (=> b!832283 (=> res!566274 e!464187)))

(assert (=> b!832283 (= res!566274 (= (h!16977 (toList!4466 lt!377448)) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832284 () Bool)

(assert (=> b!832284 (= e!464187 (contains!4188 (t!22203 (toList!4466 lt!377448)) (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106369 res!566273) b!832283))

(assert (= (and b!832283 (not res!566274)) b!832284))

(declare-fun m!776409 () Bool)

(assert (=> d!106369 m!776409))

(declare-fun m!776411 () Bool)

(assert (=> d!106369 m!776411))

(declare-fun m!776413 () Bool)

(assert (=> b!832284 m!776413))

(assert (=> b!831669 d!106369))

(declare-fun bm!36371 () Bool)

(declare-fun call!36374 () List!15846)

(declare-fun call!36375 () List!15846)

(assert (=> bm!36371 (= call!36374 call!36375)))

(declare-fun bm!36372 () Bool)

(declare-fun call!36376 () List!15846)

(assert (=> bm!36372 (= call!36375 call!36376)))

(declare-fun d!106371 () Bool)

(declare-fun e!464191 () Bool)

(assert (=> d!106371 e!464191))

(declare-fun res!566276 () Bool)

(assert (=> d!106371 (=> (not res!566276) (not e!464191))))

(declare-fun lt!377624 () List!15846)

(assert (=> d!106371 (= res!566276 (isStrictlySorted!429 lt!377624))))

(declare-fun e!464192 () List!15846)

(assert (=> d!106371 (= lt!377624 e!464192)))

(declare-fun c!90483 () Bool)

(assert (=> d!106371 (= c!90483 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvslt (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5049 lt!377012))))))

(assert (=> d!106371 (isStrictlySorted!429 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106371 (= (insertStrictlySorted!269 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377624)))

(declare-fun b!832285 () Bool)

(declare-fun c!90484 () Bool)

(declare-fun c!90485 () Bool)

(declare-fun e!464193 () List!15846)

(assert (=> b!832285 (= e!464193 (ite c!90485 (t!22203 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (ite c!90484 (Cons!15842 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (t!22203 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) Nil!15843)))))

(declare-fun b!832286 () Bool)

(declare-fun e!464190 () List!15846)

(assert (=> b!832286 (= e!464190 call!36374)))

(declare-fun b!832287 () Bool)

(assert (=> b!832287 (= e!464190 call!36374)))

(declare-fun b!832288 () Bool)

(declare-fun e!464189 () List!15846)

(assert (=> b!832288 (= e!464189 call!36375)))

(declare-fun bm!36373 () Bool)

(assert (=> bm!36373 (= call!36376 ($colon$colon!533 e!464193 (ite c!90483 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))))))

(declare-fun c!90482 () Bool)

(assert (=> bm!36373 (= c!90482 c!90483)))

(declare-fun b!832289 () Bool)

(assert (=> b!832289 (= e!464193 (insertStrictlySorted!269 (t!22203 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun b!832290 () Bool)

(declare-fun res!566275 () Bool)

(assert (=> b!832290 (=> (not res!566275) (not e!464191))))

(assert (=> b!832290 (= res!566275 (containsKey!401 lt!377624 (_1!5049 lt!377012)))))

(declare-fun b!832291 () Bool)

(assert (=> b!832291 (= e!464192 e!464189)))

(assert (=> b!832291 (= c!90485 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5049 lt!377012))))))

(declare-fun b!832292 () Bool)

(assert (=> b!832292 (= e!464191 (contains!4188 lt!377624 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!832293 () Bool)

(assert (=> b!832293 (= e!464192 call!36376)))

(declare-fun b!832294 () Bool)

(assert (=> b!832294 (= c!90484 (and ((_ is Cons!15842) (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (bvsgt (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))) (_1!5049 lt!377012))))))

(assert (=> b!832294 (= e!464189 e!464190)))

(assert (= (and d!106371 c!90483) b!832293))

(assert (= (and d!106371 (not c!90483)) b!832291))

(assert (= (and b!832291 c!90485) b!832288))

(assert (= (and b!832291 (not c!90485)) b!832294))

(assert (= (and b!832294 c!90484) b!832286))

(assert (= (and b!832294 (not c!90484)) b!832287))

(assert (= (or b!832286 b!832287) bm!36371))

(assert (= (or b!832288 bm!36371) bm!36372))

(assert (= (or b!832293 bm!36372) bm!36373))

(assert (= (and bm!36373 c!90482) b!832289))

(assert (= (and bm!36373 (not c!90482)) b!832285))

(assert (= (and d!106371 res!566276) b!832290))

(assert (= (and b!832290 res!566275) b!832292))

(declare-fun m!776415 () Bool)

(assert (=> d!106371 m!776415))

(declare-fun m!776417 () Bool)

(assert (=> d!106371 m!776417))

(declare-fun m!776419 () Bool)

(assert (=> bm!36373 m!776419))

(declare-fun m!776421 () Bool)

(assert (=> b!832289 m!776421))

(declare-fun m!776423 () Bool)

(assert (=> b!832290 m!776423))

(declare-fun m!776425 () Bool)

(assert (=> b!832292 m!776425))

(assert (=> b!831575 d!106371))

(declare-fun d!106373 () Bool)

(assert (=> d!106373 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000)) (v!10095 (getValueByKey!416 (toList!4466 lt!377180) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105775 d!106373))

(assert (=> d!105775 d!106247))

(declare-fun d!106375 () Bool)

(declare-fun e!464195 () Bool)

(assert (=> d!106375 e!464195))

(declare-fun res!566277 () Bool)

(assert (=> d!106375 (=> res!566277 e!464195)))

(declare-fun lt!377627 () Bool)

(assert (=> d!106375 (= res!566277 (not lt!377627))))

(declare-fun lt!377626 () Bool)

(assert (=> d!106375 (= lt!377627 lt!377626)))

(declare-fun lt!377625 () Unit!28446)

(declare-fun e!464194 () Unit!28446)

(assert (=> d!106375 (= lt!377625 e!464194)))

(declare-fun c!90486 () Bool)

(assert (=> d!106375 (= c!90486 lt!377626)))

(assert (=> d!106375 (= lt!377626 (containsKey!401 (toList!4466 lt!377308) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(assert (=> d!106375 (= (contains!4187 lt!377308 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377627)))

(declare-fun b!832295 () Bool)

(declare-fun lt!377628 () Unit!28446)

(assert (=> b!832295 (= e!464194 lt!377628)))

(assert (=> b!832295 (= lt!377628 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377308) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(assert (=> b!832295 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377308) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun b!832296 () Bool)

(declare-fun Unit!28492 () Unit!28446)

(assert (=> b!832296 (= e!464194 Unit!28492)))

(declare-fun b!832297 () Bool)

(assert (=> b!832297 (= e!464195 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377308) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (= (and d!106375 c!90486) b!832295))

(assert (= (and d!106375 (not c!90486)) b!832296))

(assert (= (and d!106375 (not res!566277)) b!832297))

(declare-fun m!776427 () Bool)

(assert (=> d!106375 m!776427))

(declare-fun m!776429 () Bool)

(assert (=> b!832295 m!776429))

(assert (=> b!832295 m!775087))

(assert (=> b!832295 m!775087))

(declare-fun m!776431 () Bool)

(assert (=> b!832295 m!776431))

(assert (=> b!832297 m!775087))

(assert (=> b!832297 m!775087))

(assert (=> b!832297 m!776431))

(assert (=> d!105755 d!106375))

(declare-fun b!832299 () Bool)

(declare-fun e!464196 () Option!422)

(declare-fun e!464197 () Option!422)

(assert (=> b!832299 (= e!464196 e!464197)))

(declare-fun c!90488 () Bool)

(assert (=> b!832299 (= c!90488 (and ((_ is Cons!15842) lt!377310) (not (= (_1!5049 (h!16977 lt!377310)) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))))

(declare-fun b!832300 () Bool)

(assert (=> b!832300 (= e!464197 (getValueByKey!416 (t!22203 lt!377310) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun c!90487 () Bool)

(declare-fun d!106377 () Bool)

(assert (=> d!106377 (= c!90487 (and ((_ is Cons!15842) lt!377310) (= (_1!5049 (h!16977 lt!377310)) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (=> d!106377 (= (getValueByKey!416 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) e!464196)))

(declare-fun b!832298 () Bool)

(assert (=> b!832298 (= e!464196 (Some!421 (_2!5049 (h!16977 lt!377310))))))

(declare-fun b!832301 () Bool)

(assert (=> b!832301 (= e!464197 None!420)))

(assert (= (and d!106377 c!90487) b!832298))

(assert (= (and d!106377 (not c!90487)) b!832299))

(assert (= (and b!832299 c!90488) b!832300))

(assert (= (and b!832299 (not c!90488)) b!832301))

(declare-fun m!776433 () Bool)

(assert (=> b!832300 m!776433))

(assert (=> d!105755 d!106377))

(declare-fun d!106379 () Bool)

(assert (=> d!106379 (= (getValueByKey!416 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun lt!377629 () Unit!28446)

(assert (=> d!106379 (= lt!377629 (choose!1423 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun e!464198 () Bool)

(assert (=> d!106379 e!464198))

(declare-fun res!566278 () Bool)

(assert (=> d!106379 (=> (not res!566278) (not e!464198))))

(assert (=> d!106379 (= res!566278 (isStrictlySorted!429 lt!377310))))

(assert (=> d!106379 (= (lemmaContainsTupThenGetReturnValue!230 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377629)))

(declare-fun b!832302 () Bool)

(declare-fun res!566279 () Bool)

(assert (=> b!832302 (=> (not res!566279) (not e!464198))))

(assert (=> b!832302 (= res!566279 (containsKey!401 lt!377310 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun b!832303 () Bool)

(assert (=> b!832303 (= e!464198 (contains!4188 lt!377310 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (= (and d!106379 res!566278) b!832302))

(assert (= (and b!832302 res!566279) b!832303))

(assert (=> d!106379 m!775081))

(declare-fun m!776435 () Bool)

(assert (=> d!106379 m!776435))

(declare-fun m!776437 () Bool)

(assert (=> d!106379 m!776437))

(declare-fun m!776439 () Bool)

(assert (=> b!832302 m!776439))

(declare-fun m!776441 () Bool)

(assert (=> b!832303 m!776441))

(assert (=> d!105755 d!106379))

(declare-fun bm!36374 () Bool)

(declare-fun call!36377 () List!15846)

(declare-fun call!36378 () List!15846)

(assert (=> bm!36374 (= call!36377 call!36378)))

(declare-fun bm!36375 () Bool)

(declare-fun call!36379 () List!15846)

(assert (=> bm!36375 (= call!36378 call!36379)))

(declare-fun d!106381 () Bool)

(declare-fun e!464201 () Bool)

(assert (=> d!106381 e!464201))

(declare-fun res!566281 () Bool)

(assert (=> d!106381 (=> (not res!566281) (not e!464201))))

(declare-fun lt!377630 () List!15846)

(assert (=> d!106381 (= res!566281 (isStrictlySorted!429 lt!377630))))

(declare-fun e!464202 () List!15846)

(assert (=> d!106381 (= lt!377630 e!464202)))

(declare-fun c!90490 () Bool)

(assert (=> d!106381 (= c!90490 (and ((_ is Cons!15842) (toList!4466 lt!377190)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377190))) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (=> d!106381 (isStrictlySorted!429 (toList!4466 lt!377190))))

(assert (=> d!106381 (= (insertStrictlySorted!269 (toList!4466 lt!377190) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) lt!377630)))

(declare-fun c!90491 () Bool)

(declare-fun c!90492 () Bool)

(declare-fun e!464203 () List!15846)

(declare-fun b!832304 () Bool)

(assert (=> b!832304 (= e!464203 (ite c!90492 (t!22203 (toList!4466 lt!377190)) (ite c!90491 (Cons!15842 (h!16977 (toList!4466 lt!377190)) (t!22203 (toList!4466 lt!377190))) Nil!15843)))))

(declare-fun b!832305 () Bool)

(declare-fun e!464200 () List!15846)

(assert (=> b!832305 (= e!464200 call!36377)))

(declare-fun b!832306 () Bool)

(assert (=> b!832306 (= e!464200 call!36377)))

(declare-fun b!832307 () Bool)

(declare-fun e!464199 () List!15846)

(assert (=> b!832307 (= e!464199 call!36378)))

(declare-fun bm!36376 () Bool)

(assert (=> bm!36376 (= call!36379 ($colon$colon!533 e!464203 (ite c!90490 (h!16977 (toList!4466 lt!377190)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))))

(declare-fun c!90489 () Bool)

(assert (=> bm!36376 (= c!90489 c!90490)))

(declare-fun b!832308 () Bool)

(assert (=> b!832308 (= e!464203 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377190)) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun b!832309 () Bool)

(declare-fun res!566280 () Bool)

(assert (=> b!832309 (=> (not res!566280) (not e!464201))))

(assert (=> b!832309 (= res!566280 (containsKey!401 lt!377630 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun b!832310 () Bool)

(assert (=> b!832310 (= e!464202 e!464199)))

(assert (=> b!832310 (= c!90492 (and ((_ is Cons!15842) (toList!4466 lt!377190)) (= (_1!5049 (h!16977 (toList!4466 lt!377190))) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(declare-fun b!832311 () Bool)

(assert (=> b!832311 (= e!464201 (contains!4188 lt!377630 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)) (_2!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(declare-fun b!832312 () Bool)

(assert (=> b!832312 (= e!464202 call!36379)))

(declare-fun b!832313 () Bool)

(assert (=> b!832313 (= c!90491 (and ((_ is Cons!15842) (toList!4466 lt!377190)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377190))) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (=> b!832313 (= e!464199 e!464200)))

(assert (= (and d!106381 c!90490) b!832312))

(assert (= (and d!106381 (not c!90490)) b!832310))

(assert (= (and b!832310 c!90492) b!832307))

(assert (= (and b!832310 (not c!90492)) b!832313))

(assert (= (and b!832313 c!90491) b!832305))

(assert (= (and b!832313 (not c!90491)) b!832306))

(assert (= (or b!832305 b!832306) bm!36374))

(assert (= (or b!832307 bm!36374) bm!36375))

(assert (= (or b!832312 bm!36375) bm!36376))

(assert (= (and bm!36376 c!90489) b!832308))

(assert (= (and bm!36376 (not c!90489)) b!832304))

(assert (= (and d!106381 res!566281) b!832309))

(assert (= (and b!832309 res!566280) b!832311))

(declare-fun m!776443 () Bool)

(assert (=> d!106381 m!776443))

(declare-fun m!776445 () Bool)

(assert (=> d!106381 m!776445))

(declare-fun m!776447 () Bool)

(assert (=> bm!36376 m!776447))

(declare-fun m!776449 () Bool)

(assert (=> b!832308 m!776449))

(declare-fun m!776451 () Bool)

(assert (=> b!832309 m!776451))

(declare-fun m!776453 () Bool)

(assert (=> b!832311 m!776453))

(assert (=> d!105755 d!106381))

(declare-fun d!106383 () Bool)

(declare-fun res!566282 () Bool)

(declare-fun e!464204 () Bool)

(assert (=> d!106383 (=> res!566282 e!464204)))

(assert (=> d!106383 (= res!566282 (and ((_ is Cons!15842) lt!377214) (= (_1!5049 (h!16977 lt!377214)) (_1!5049 lt!377012))))))

(assert (=> d!106383 (= (containsKey!401 lt!377214 (_1!5049 lt!377012)) e!464204)))

(declare-fun b!832314 () Bool)

(declare-fun e!464205 () Bool)

(assert (=> b!832314 (= e!464204 e!464205)))

(declare-fun res!566283 () Bool)

(assert (=> b!832314 (=> (not res!566283) (not e!464205))))

(assert (=> b!832314 (= res!566283 (and (or (not ((_ is Cons!15842) lt!377214)) (bvsle (_1!5049 (h!16977 lt!377214)) (_1!5049 lt!377012))) ((_ is Cons!15842) lt!377214) (bvslt (_1!5049 (h!16977 lt!377214)) (_1!5049 lt!377012))))))

(declare-fun b!832315 () Bool)

(assert (=> b!832315 (= e!464205 (containsKey!401 (t!22203 lt!377214) (_1!5049 lt!377012)))))

(assert (= (and d!106383 (not res!566282)) b!832314))

(assert (= (and b!832314 res!566283) b!832315))

(declare-fun m!776455 () Bool)

(assert (=> b!832315 m!776455))

(assert (=> b!831569 d!106383))

(assert (=> b!831446 d!106209))

(assert (=> b!831446 d!106113))

(declare-fun d!106385 () Bool)

(declare-fun e!464207 () Bool)

(assert (=> d!106385 e!464207))

(declare-fun res!566284 () Bool)

(assert (=> d!106385 (=> res!566284 e!464207)))

(declare-fun lt!377633 () Bool)

(assert (=> d!106385 (= res!566284 (not lt!377633))))

(declare-fun lt!377632 () Bool)

(assert (=> d!106385 (= lt!377633 lt!377632)))

(declare-fun lt!377631 () Unit!28446)

(declare-fun e!464206 () Unit!28446)

(assert (=> d!106385 (= lt!377631 e!464206)))

(declare-fun c!90493 () Bool)

(assert (=> d!106385 (= c!90493 lt!377632)))

(assert (=> d!106385 (= lt!377632 (containsKey!401 (toList!4466 lt!377352) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(assert (=> d!106385 (= (contains!4187 lt!377352 (_1!5049 (tuple2!10077 lt!377173 minValue!754))) lt!377633)))

(declare-fun b!832316 () Bool)

(declare-fun lt!377634 () Unit!28446)

(assert (=> b!832316 (= e!464206 lt!377634)))

(assert (=> b!832316 (= lt!377634 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377352) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(assert (=> b!832316 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377352) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun b!832317 () Bool)

(declare-fun Unit!28493 () Unit!28446)

(assert (=> b!832317 (= e!464206 Unit!28493)))

(declare-fun b!832318 () Bool)

(assert (=> b!832318 (= e!464207 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377352) (_1!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(assert (= (and d!106385 c!90493) b!832316))

(assert (= (and d!106385 (not c!90493)) b!832317))

(assert (= (and d!106385 (not res!566284)) b!832318))

(declare-fun m!776457 () Bool)

(assert (=> d!106385 m!776457))

(declare-fun m!776459 () Bool)

(assert (=> b!832316 m!776459))

(assert (=> b!832316 m!775237))

(assert (=> b!832316 m!775237))

(declare-fun m!776461 () Bool)

(assert (=> b!832316 m!776461))

(assert (=> b!832318 m!775237))

(assert (=> b!832318 m!775237))

(assert (=> b!832318 m!776461))

(assert (=> d!105807 d!106385))

(declare-fun b!832320 () Bool)

(declare-fun e!464208 () Option!422)

(declare-fun e!464209 () Option!422)

(assert (=> b!832320 (= e!464208 e!464209)))

(declare-fun c!90495 () Bool)

(assert (=> b!832320 (= c!90495 (and ((_ is Cons!15842) lt!377354) (not (= (_1!5049 (h!16977 lt!377354)) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))))

(declare-fun b!832321 () Bool)

(assert (=> b!832321 (= e!464209 (getValueByKey!416 (t!22203 lt!377354) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun d!106387 () Bool)

(declare-fun c!90494 () Bool)

(assert (=> d!106387 (= c!90494 (and ((_ is Cons!15842) lt!377354) (= (_1!5049 (h!16977 lt!377354)) (_1!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(assert (=> d!106387 (= (getValueByKey!416 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754))) e!464208)))

(declare-fun b!832319 () Bool)

(assert (=> b!832319 (= e!464208 (Some!421 (_2!5049 (h!16977 lt!377354))))))

(declare-fun b!832322 () Bool)

(assert (=> b!832322 (= e!464209 None!420)))

(assert (= (and d!106387 c!90494) b!832319))

(assert (= (and d!106387 (not c!90494)) b!832320))

(assert (= (and b!832320 c!90495) b!832321))

(assert (= (and b!832320 (not c!90495)) b!832322))

(declare-fun m!776463 () Bool)

(assert (=> b!832321 m!776463))

(assert (=> d!105807 d!106387))

(declare-fun d!106389 () Bool)

(assert (=> d!106389 (= (getValueByKey!416 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun lt!377635 () Unit!28446)

(assert (=> d!106389 (= lt!377635 (choose!1423 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun e!464210 () Bool)

(assert (=> d!106389 e!464210))

(declare-fun res!566285 () Bool)

(assert (=> d!106389 (=> (not res!566285) (not e!464210))))

(assert (=> d!106389 (= res!566285 (isStrictlySorted!429 lt!377354))))

(assert (=> d!106389 (= (lemmaContainsTupThenGetReturnValue!230 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))) lt!377635)))

(declare-fun b!832323 () Bool)

(declare-fun res!566286 () Bool)

(assert (=> b!832323 (=> (not res!566286) (not e!464210))))

(assert (=> b!832323 (= res!566286 (containsKey!401 lt!377354 (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun b!832324 () Bool)

(assert (=> b!832324 (= e!464210 (contains!4188 lt!377354 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(assert (= (and d!106389 res!566285) b!832323))

(assert (= (and b!832323 res!566286) b!832324))

(assert (=> d!106389 m!775231))

(declare-fun m!776465 () Bool)

(assert (=> d!106389 m!776465))

(declare-fun m!776467 () Bool)

(assert (=> d!106389 m!776467))

(declare-fun m!776469 () Bool)

(assert (=> b!832323 m!776469))

(declare-fun m!776471 () Bool)

(assert (=> b!832324 m!776471))

(assert (=> d!105807 d!106389))

(declare-fun bm!36377 () Bool)

(declare-fun call!36380 () List!15846)

(declare-fun call!36381 () List!15846)

(assert (=> bm!36377 (= call!36380 call!36381)))

(declare-fun bm!36378 () Bool)

(declare-fun call!36382 () List!15846)

(assert (=> bm!36378 (= call!36381 call!36382)))

(declare-fun d!106391 () Bool)

(declare-fun e!464213 () Bool)

(assert (=> d!106391 e!464213))

(declare-fun res!566288 () Bool)

(assert (=> d!106391 (=> (not res!566288) (not e!464213))))

(declare-fun lt!377636 () List!15846)

(assert (=> d!106391 (= res!566288 (isStrictlySorted!429 lt!377636))))

(declare-fun e!464214 () List!15846)

(assert (=> d!106391 (= lt!377636 e!464214)))

(declare-fun c!90497 () Bool)

(assert (=> d!106391 (= c!90497 (and ((_ is Cons!15842) (toList!4466 lt!377177)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377177))) (_1!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(assert (=> d!106391 (isStrictlySorted!429 (toList!4466 lt!377177))))

(assert (=> d!106391 (= (insertStrictlySorted!269 (toList!4466 lt!377177) (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))) lt!377636)))

(declare-fun b!832325 () Bool)

(declare-fun c!90498 () Bool)

(declare-fun e!464215 () List!15846)

(declare-fun c!90499 () Bool)

(assert (=> b!832325 (= e!464215 (ite c!90499 (t!22203 (toList!4466 lt!377177)) (ite c!90498 (Cons!15842 (h!16977 (toList!4466 lt!377177)) (t!22203 (toList!4466 lt!377177))) Nil!15843)))))

(declare-fun b!832326 () Bool)

(declare-fun e!464212 () List!15846)

(assert (=> b!832326 (= e!464212 call!36380)))

(declare-fun b!832327 () Bool)

(assert (=> b!832327 (= e!464212 call!36380)))

(declare-fun b!832328 () Bool)

(declare-fun e!464211 () List!15846)

(assert (=> b!832328 (= e!464211 call!36381)))

(declare-fun bm!36379 () Bool)

(assert (=> bm!36379 (= call!36382 ($colon$colon!533 e!464215 (ite c!90497 (h!16977 (toList!4466 lt!377177)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))))

(declare-fun c!90496 () Bool)

(assert (=> bm!36379 (= c!90496 c!90497)))

(declare-fun b!832329 () Bool)

(assert (=> b!832329 (= e!464215 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377177)) (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun b!832330 () Bool)

(declare-fun res!566287 () Bool)

(assert (=> b!832330 (=> (not res!566287) (not e!464213))))

(assert (=> b!832330 (= res!566287 (containsKey!401 lt!377636 (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun b!832331 () Bool)

(assert (=> b!832331 (= e!464214 e!464211)))

(assert (=> b!832331 (= c!90499 (and ((_ is Cons!15842) (toList!4466 lt!377177)) (= (_1!5049 (h!16977 (toList!4466 lt!377177))) (_1!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(declare-fun b!832332 () Bool)

(assert (=> b!832332 (= e!464213 (contains!4188 lt!377636 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377173 minValue!754)) (_2!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(declare-fun b!832333 () Bool)

(assert (=> b!832333 (= e!464214 call!36382)))

(declare-fun b!832334 () Bool)

(assert (=> b!832334 (= c!90498 (and ((_ is Cons!15842) (toList!4466 lt!377177)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377177))) (_1!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(assert (=> b!832334 (= e!464211 e!464212)))

(assert (= (and d!106391 c!90497) b!832333))

(assert (= (and d!106391 (not c!90497)) b!832331))

(assert (= (and b!832331 c!90499) b!832328))

(assert (= (and b!832331 (not c!90499)) b!832334))

(assert (= (and b!832334 c!90498) b!832326))

(assert (= (and b!832334 (not c!90498)) b!832327))

(assert (= (or b!832326 b!832327) bm!36377))

(assert (= (or b!832328 bm!36377) bm!36378))

(assert (= (or b!832333 bm!36378) bm!36379))

(assert (= (and bm!36379 c!90496) b!832329))

(assert (= (and bm!36379 (not c!90496)) b!832325))

(assert (= (and d!106391 res!566288) b!832330))

(assert (= (and b!832330 res!566287) b!832332))

(declare-fun m!776473 () Bool)

(assert (=> d!106391 m!776473))

(declare-fun m!776475 () Bool)

(assert (=> d!106391 m!776475))

(declare-fun m!776477 () Bool)

(assert (=> bm!36379 m!776477))

(declare-fun m!776479 () Bool)

(assert (=> b!832329 m!776479))

(declare-fun m!776481 () Bool)

(assert (=> b!832330 m!776481))

(declare-fun m!776483 () Bool)

(assert (=> b!832332 m!776483))

(assert (=> d!105807 d!106391))

(declare-fun b!832336 () Bool)

(declare-fun e!464216 () Option!422)

(declare-fun e!464217 () Option!422)

(assert (=> b!832336 (= e!464216 e!464217)))

(declare-fun c!90501 () Bool)

(assert (=> b!832336 (= c!90501 (and ((_ is Cons!15842) (toList!4466 lt!377294)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377294))) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))))

(declare-fun b!832337 () Bool)

(assert (=> b!832337 (= e!464217 (getValueByKey!416 (t!22203 (toList!4466 lt!377294)) (_1!5049 (tuple2!10077 lt!377187 minValue!754))))))

(declare-fun c!90500 () Bool)

(declare-fun d!106393 () Bool)

(assert (=> d!106393 (= c!90500 (and ((_ is Cons!15842) (toList!4466 lt!377294)) (= (_1!5049 (h!16977 (toList!4466 lt!377294))) (_1!5049 (tuple2!10077 lt!377187 minValue!754)))))))

(assert (=> d!106393 (= (getValueByKey!416 (toList!4466 lt!377294) (_1!5049 (tuple2!10077 lt!377187 minValue!754))) e!464216)))

(declare-fun b!832335 () Bool)

(assert (=> b!832335 (= e!464216 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377294)))))))

(declare-fun b!832338 () Bool)

(assert (=> b!832338 (= e!464217 None!420)))

(assert (= (and d!106393 c!90500) b!832335))

(assert (= (and d!106393 (not c!90500)) b!832336))

(assert (= (and b!832336 c!90501) b!832337))

(assert (= (and b!832336 (not c!90501)) b!832338))

(declare-fun m!776485 () Bool)

(assert (=> b!832337 m!776485))

(assert (=> b!831455 d!106393))

(declare-fun d!106395 () Bool)

(declare-fun res!566289 () Bool)

(declare-fun e!464218 () Bool)

(assert (=> d!106395 (=> res!566289 e!464218)))

(assert (=> d!106395 (= res!566289 (and ((_ is Cons!15842) lt!377114) (= (_1!5049 (h!16977 lt!377114)) (_1!5049 lt!377012))))))

(assert (=> d!106395 (= (containsKey!401 lt!377114 (_1!5049 lt!377012)) e!464218)))

(declare-fun b!832339 () Bool)

(declare-fun e!464219 () Bool)

(assert (=> b!832339 (= e!464218 e!464219)))

(declare-fun res!566290 () Bool)

(assert (=> b!832339 (=> (not res!566290) (not e!464219))))

(assert (=> b!832339 (= res!566290 (and (or (not ((_ is Cons!15842) lt!377114)) (bvsle (_1!5049 (h!16977 lt!377114)) (_1!5049 lt!377012))) ((_ is Cons!15842) lt!377114) (bvslt (_1!5049 (h!16977 lt!377114)) (_1!5049 lt!377012))))))

(declare-fun b!832340 () Bool)

(assert (=> b!832340 (= e!464219 (containsKey!401 (t!22203 lt!377114) (_1!5049 lt!377012)))))

(assert (= (and d!106395 (not res!566289)) b!832339))

(assert (= (and b!832339 res!566290) b!832340))

(declare-fun m!776487 () Bool)

(assert (=> b!832340 m!776487))

(assert (=> b!831630 d!106395))

(declare-fun d!106397 () Bool)

(declare-fun lt!377637 () Bool)

(assert (=> d!106397 (= lt!377637 (select (content!386 (toList!4466 lt!377378)) (tuple2!10077 lt!377086 lt!377091)))))

(declare-fun e!464221 () Bool)

(assert (=> d!106397 (= lt!377637 e!464221)))

(declare-fun res!566291 () Bool)

(assert (=> d!106397 (=> (not res!566291) (not e!464221))))

(assert (=> d!106397 (= res!566291 ((_ is Cons!15842) (toList!4466 lt!377378)))))

(assert (=> d!106397 (= (contains!4188 (toList!4466 lt!377378) (tuple2!10077 lt!377086 lt!377091)) lt!377637)))

(declare-fun b!832341 () Bool)

(declare-fun e!464220 () Bool)

(assert (=> b!832341 (= e!464221 e!464220)))

(declare-fun res!566292 () Bool)

(assert (=> b!832341 (=> res!566292 e!464220)))

(assert (=> b!832341 (= res!566292 (= (h!16977 (toList!4466 lt!377378)) (tuple2!10077 lt!377086 lt!377091)))))

(declare-fun b!832342 () Bool)

(assert (=> b!832342 (= e!464220 (contains!4188 (t!22203 (toList!4466 lt!377378)) (tuple2!10077 lt!377086 lt!377091)))))

(assert (= (and d!106397 res!566291) b!832341))

(assert (= (and b!832341 (not res!566292)) b!832342))

(declare-fun m!776489 () Bool)

(assert (=> d!106397 m!776489))

(declare-fun m!776491 () Bool)

(assert (=> d!106397 m!776491))

(declare-fun m!776493 () Bool)

(assert (=> b!832342 m!776493))

(assert (=> b!831546 d!106397))

(declare-fun d!106399 () Bool)

(assert (=> d!106399 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105873 d!106399))

(declare-fun b!832344 () Bool)

(declare-fun e!464222 () Option!422)

(declare-fun e!464223 () Option!422)

(assert (=> b!832344 (= e!464222 e!464223)))

(declare-fun c!90503 () Bool)

(assert (=> b!832344 (= c!90503 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377087))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun b!832345 () Bool)

(assert (=> b!832345 (= e!464223 (getValueByKey!416 (t!22203 (toList!4466 lt!377087)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!106401 () Bool)

(declare-fun c!90502 () Bool)

(assert (=> d!106401 (= c!90502 (and ((_ is Cons!15842) (toList!4466 lt!377087)) (= (_1!5049 (h!16977 (toList!4466 lt!377087))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106401 (= (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!464222)))

(declare-fun b!832343 () Bool)

(assert (=> b!832343 (= e!464222 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377087)))))))

(declare-fun b!832346 () Bool)

(assert (=> b!832346 (= e!464223 None!420)))

(assert (= (and d!106401 c!90502) b!832343))

(assert (= (and d!106401 (not c!90502)) b!832344))

(assert (= (and b!832344 c!90503) b!832345))

(assert (= (and b!832344 (not c!90503)) b!832346))

(assert (=> b!832345 m!774611))

(declare-fun m!776495 () Bool)

(assert (=> b!832345 m!776495))

(assert (=> d!105873 d!106401))

(declare-fun b!832348 () Bool)

(declare-fun e!464224 () Option!422)

(declare-fun e!464225 () Option!422)

(assert (=> b!832348 (= e!464224 e!464225)))

(declare-fun c!90505 () Bool)

(assert (=> b!832348 (= c!90505 (and ((_ is Cons!15842) (toList!4466 lt!377364)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377364))) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))))

(declare-fun b!832349 () Bool)

(assert (=> b!832349 (= e!464225 (getValueByKey!416 (t!22203 (toList!4466 lt!377364)) (_1!5049 (tuple2!10077 lt!377165 minValue!754))))))

(declare-fun c!90504 () Bool)

(declare-fun d!106403 () Bool)

(assert (=> d!106403 (= c!90504 (and ((_ is Cons!15842) (toList!4466 lt!377364)) (= (_1!5049 (h!16977 (toList!4466 lt!377364))) (_1!5049 (tuple2!10077 lt!377165 minValue!754)))))))

(assert (=> d!106403 (= (getValueByKey!416 (toList!4466 lt!377364) (_1!5049 (tuple2!10077 lt!377165 minValue!754))) e!464224)))

(declare-fun b!832347 () Bool)

(assert (=> b!832347 (= e!464224 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377364)))))))

(declare-fun b!832350 () Bool)

(assert (=> b!832350 (= e!464225 None!420)))

(assert (= (and d!106403 c!90504) b!832347))

(assert (= (and d!106403 (not c!90504)) b!832348))

(assert (= (and b!832348 c!90505) b!832349))

(assert (= (and b!832348 (not c!90505)) b!832350))

(declare-fun m!776497 () Bool)

(assert (=> b!832349 m!776497))

(assert (=> b!831521 d!106403))

(assert (=> b!831564 d!106153))

(assert (=> b!831564 d!105863))

(declare-fun d!106405 () Bool)

(assert (=> d!106405 (= (apply!372 lt!377252 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11821 (getValueByKey!416 (toList!4466 lt!377252) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23259 () Bool)

(assert (= bs!23259 d!106405))

(assert (=> bs!23259 m!774867))

(assert (=> bs!23259 m!775969))

(assert (=> bs!23259 m!775969))

(declare-fun m!776499 () Bool)

(assert (=> bs!23259 m!776499))

(assert (=> b!831380 d!106405))

(assert (=> b!831380 d!105999))

(declare-fun b!832352 () Bool)

(declare-fun e!464226 () Option!422)

(declare-fun e!464227 () Option!422)

(assert (=> b!832352 (= e!464226 e!464227)))

(declare-fun c!90507 () Bool)

(assert (=> b!832352 (= c!90507 (and ((_ is Cons!15842) (toList!4466 lt!377352)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377352))) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))))

(declare-fun b!832353 () Bool)

(assert (=> b!832353 (= e!464227 (getValueByKey!416 (t!22203 (toList!4466 lt!377352)) (_1!5049 (tuple2!10077 lt!377173 minValue!754))))))

(declare-fun c!90506 () Bool)

(declare-fun d!106407 () Bool)

(assert (=> d!106407 (= c!90506 (and ((_ is Cons!15842) (toList!4466 lt!377352)) (= (_1!5049 (h!16977 (toList!4466 lt!377352))) (_1!5049 (tuple2!10077 lt!377173 minValue!754)))))))

(assert (=> d!106407 (= (getValueByKey!416 (toList!4466 lt!377352) (_1!5049 (tuple2!10077 lt!377173 minValue!754))) e!464226)))

(declare-fun b!832351 () Bool)

(assert (=> b!832351 (= e!464226 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377352)))))))

(declare-fun b!832354 () Bool)

(assert (=> b!832354 (= e!464227 None!420)))

(assert (= (and d!106407 c!90506) b!832351))

(assert (= (and d!106407 (not c!90506)) b!832352))

(assert (= (and b!832352 c!90507) b!832353))

(assert (= (and b!832352 (not c!90507)) b!832354))

(declare-fun m!776501 () Bool)

(assert (=> b!832353 m!776501))

(assert (=> b!831515 d!106407))

(assert (=> b!831453 d!106227))

(assert (=> b!831453 d!106229))

(declare-fun d!106409 () Bool)

(declare-fun e!464229 () Bool)

(assert (=> d!106409 e!464229))

(declare-fun res!566293 () Bool)

(assert (=> d!106409 (=> res!566293 e!464229)))

(declare-fun lt!377640 () Bool)

(assert (=> d!106409 (= res!566293 (not lt!377640))))

(declare-fun lt!377639 () Bool)

(assert (=> d!106409 (= lt!377640 lt!377639)))

(declare-fun lt!377638 () Unit!28446)

(declare-fun e!464228 () Unit!28446)

(assert (=> d!106409 (= lt!377638 e!464228)))

(declare-fun c!90508 () Bool)

(assert (=> d!106409 (= c!90508 lt!377639)))

(assert (=> d!106409 (= lt!377639 (containsKey!401 (toList!4466 lt!377252) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106409 (= (contains!4187 lt!377252 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377640)))

(declare-fun b!832355 () Bool)

(declare-fun lt!377641 () Unit!28446)

(assert (=> b!832355 (= e!464228 lt!377641)))

(assert (=> b!832355 (= lt!377641 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377252) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832355 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377252) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832356 () Bool)

(declare-fun Unit!28494 () Unit!28446)

(assert (=> b!832356 (= e!464228 Unit!28494)))

(declare-fun b!832357 () Bool)

(assert (=> b!832357 (= e!464229 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377252) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106409 c!90508) b!832355))

(assert (= (and d!106409 (not c!90508)) b!832356))

(assert (= (and d!106409 (not res!566293)) b!832357))

(declare-fun m!776503 () Bool)

(assert (=> d!106409 m!776503))

(declare-fun m!776505 () Bool)

(assert (=> b!832355 m!776505))

(declare-fun m!776507 () Bool)

(assert (=> b!832355 m!776507))

(assert (=> b!832355 m!776507))

(declare-fun m!776509 () Bool)

(assert (=> b!832355 m!776509))

(assert (=> b!832357 m!776507))

(assert (=> b!832357 m!776507))

(assert (=> b!832357 m!776509))

(assert (=> d!105703 d!106409))

(assert (=> d!105703 d!105667))

(assert (=> d!105751 d!105729))

(assert (=> d!105751 d!105739))

(assert (=> d!105751 d!105743))

(declare-fun d!106411 () Bool)

(declare-fun e!464231 () Bool)

(assert (=> d!106411 e!464231))

(declare-fun res!566294 () Bool)

(assert (=> d!106411 (=> res!566294 e!464231)))

(declare-fun lt!377644 () Bool)

(assert (=> d!106411 (= res!566294 (not lt!377644))))

(declare-fun lt!377643 () Bool)

(assert (=> d!106411 (= lt!377644 lt!377643)))

(declare-fun lt!377642 () Unit!28446)

(declare-fun e!464230 () Unit!28446)

(assert (=> d!106411 (= lt!377642 e!464230)))

(declare-fun c!90509 () Bool)

(assert (=> d!106411 (= c!90509 lt!377643)))

(assert (=> d!106411 (= lt!377643 (containsKey!401 (toList!4466 lt!377192) lt!377188))))

(assert (=> d!106411 (= (contains!4187 lt!377192 lt!377188) lt!377644)))

(declare-fun b!832358 () Bool)

(declare-fun lt!377645 () Unit!28446)

(assert (=> b!832358 (= e!464230 lt!377645)))

(assert (=> b!832358 (= lt!377645 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377192) lt!377188))))

(assert (=> b!832358 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377192) lt!377188))))

(declare-fun b!832359 () Bool)

(declare-fun Unit!28495 () Unit!28446)

(assert (=> b!832359 (= e!464230 Unit!28495)))

(declare-fun b!832360 () Bool)

(assert (=> b!832360 (= e!464231 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377192) lt!377188)))))

(assert (= (and d!106411 c!90509) b!832358))

(assert (= (and d!106411 (not c!90509)) b!832359))

(assert (= (and d!106411 (not res!566294)) b!832360))

(declare-fun m!776511 () Bool)

(assert (=> d!106411 m!776511))

(declare-fun m!776513 () Bool)

(assert (=> b!832358 m!776513))

(assert (=> b!832358 m!774999))

(assert (=> b!832358 m!774999))

(declare-fun m!776515 () Bool)

(assert (=> b!832358 m!776515))

(assert (=> b!832360 m!774999))

(assert (=> b!832360 m!774999))

(assert (=> b!832360 m!776515))

(assert (=> d!105751 d!106411))

(declare-fun d!106413 () Bool)

(assert (=> d!106413 (= (apply!372 (+!1988 lt!377192 (tuple2!10077 lt!377200 zeroValueAfter!34)) lt!377188) (apply!372 lt!377192 lt!377188))))

(assert (=> d!106413 true))

(declare-fun _$34!1146 () Unit!28446)

(assert (=> d!106413 (= (choose!1424 lt!377192 lt!377200 zeroValueAfter!34 lt!377188) _$34!1146)))

(declare-fun bs!23260 () Bool)

(assert (= bs!23260 d!106413))

(assert (=> bs!23260 m!774785))

(assert (=> bs!23260 m!774785))

(assert (=> bs!23260 m!774787))

(assert (=> bs!23260 m!774791))

(assert (=> d!105751 d!106413))

(declare-fun d!106415 () Bool)

(assert (=> d!106415 (= (get!11823 (select (arr!22326 _values!788) #b00000000000000000000000000000000) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!831394 d!106415))

(declare-fun d!106417 () Bool)

(declare-fun e!464233 () Bool)

(assert (=> d!106417 e!464233))

(declare-fun res!566295 () Bool)

(assert (=> d!106417 (=> res!566295 e!464233)))

(declare-fun lt!377648 () Bool)

(assert (=> d!106417 (= res!566295 (not lt!377648))))

(declare-fun lt!377647 () Bool)

(assert (=> d!106417 (= lt!377648 lt!377647)))

(declare-fun lt!377646 () Unit!28446)

(declare-fun e!464232 () Unit!28446)

(assert (=> d!106417 (= lt!377646 e!464232)))

(declare-fun c!90510 () Bool)

(assert (=> d!106417 (= c!90510 lt!377647)))

(assert (=> d!106417 (= lt!377647 (containsKey!401 (toList!4466 lt!377448) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106417 (= (contains!4187 lt!377448 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377648)))

(declare-fun b!832361 () Bool)

(declare-fun lt!377649 () Unit!28446)

(assert (=> b!832361 (= e!464232 lt!377649)))

(assert (=> b!832361 (= lt!377649 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377448) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832361 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377448) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832362 () Bool)

(declare-fun Unit!28496 () Unit!28446)

(assert (=> b!832362 (= e!464232 Unit!28496)))

(declare-fun b!832363 () Bool)

(assert (=> b!832363 (= e!464233 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377448) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106417 c!90510) b!832361))

(assert (= (and d!106417 (not c!90510)) b!832362))

(assert (= (and d!106417 (not res!566295)) b!832363))

(declare-fun m!776517 () Bool)

(assert (=> d!106417 m!776517))

(declare-fun m!776519 () Bool)

(assert (=> b!832361 m!776519))

(assert (=> b!832361 m!775567))

(assert (=> b!832361 m!775567))

(declare-fun m!776521 () Bool)

(assert (=> b!832361 m!776521))

(assert (=> b!832363 m!775567))

(assert (=> b!832363 m!775567))

(assert (=> b!832363 m!776521))

(assert (=> d!105909 d!106417))

(declare-fun b!832365 () Bool)

(declare-fun e!464234 () Option!422)

(declare-fun e!464235 () Option!422)

(assert (=> b!832365 (= e!464234 e!464235)))

(declare-fun c!90512 () Bool)

(assert (=> b!832365 (= c!90512 (and ((_ is Cons!15842) lt!377450) (not (= (_1!5049 (h!16977 lt!377450)) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832366 () Bool)

(assert (=> b!832366 (= e!464235 (getValueByKey!416 (t!22203 lt!377450) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun d!106419 () Bool)

(declare-fun c!90511 () Bool)

(assert (=> d!106419 (= c!90511 (and ((_ is Cons!15842) lt!377450) (= (_1!5049 (h!16977 lt!377450)) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106419 (= (getValueByKey!416 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464234)))

(declare-fun b!832364 () Bool)

(assert (=> b!832364 (= e!464234 (Some!421 (_2!5049 (h!16977 lt!377450))))))

(declare-fun b!832367 () Bool)

(assert (=> b!832367 (= e!464235 None!420)))

(assert (= (and d!106419 c!90511) b!832364))

(assert (= (and d!106419 (not c!90511)) b!832365))

(assert (= (and b!832365 c!90512) b!832366))

(assert (= (and b!832365 (not c!90512)) b!832367))

(declare-fun m!776523 () Bool)

(assert (=> b!832366 m!776523))

(assert (=> d!105909 d!106419))

(declare-fun d!106421 () Bool)

(assert (=> d!106421 (= (getValueByKey!416 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) (Some!421 (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun lt!377650 () Unit!28446)

(assert (=> d!106421 (= lt!377650 (choose!1423 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun e!464236 () Bool)

(assert (=> d!106421 e!464236))

(declare-fun res!566296 () Bool)

(assert (=> d!106421 (=> (not res!566296) (not e!464236))))

(assert (=> d!106421 (= res!566296 (isStrictlySorted!429 lt!377450))))

(assert (=> d!106421 (= (lemmaContainsTupThenGetReturnValue!230 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377650)))

(declare-fun b!832368 () Bool)

(declare-fun res!566297 () Bool)

(assert (=> b!832368 (=> (not res!566297) (not e!464236))))

(assert (=> b!832368 (= res!566297 (containsKey!401 lt!377450 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832369 () Bool)

(assert (=> b!832369 (= e!464236 (contains!4188 lt!377450 (tuple2!10077 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (= (and d!106421 res!566296) b!832368))

(assert (= (and b!832368 res!566297) b!832369))

(assert (=> d!106421 m!775561))

(declare-fun m!776525 () Bool)

(assert (=> d!106421 m!776525))

(declare-fun m!776527 () Bool)

(assert (=> d!106421 m!776527))

(declare-fun m!776529 () Bool)

(assert (=> b!832368 m!776529))

(declare-fun m!776531 () Bool)

(assert (=> b!832369 m!776531))

(assert (=> d!105909 d!106421))

(declare-fun bm!36380 () Bool)

(declare-fun call!36383 () List!15846)

(declare-fun call!36384 () List!15846)

(assert (=> bm!36380 (= call!36383 call!36384)))

(declare-fun bm!36381 () Bool)

(declare-fun call!36385 () List!15846)

(assert (=> bm!36381 (= call!36384 call!36385)))

(declare-fun d!106423 () Bool)

(declare-fun e!464239 () Bool)

(assert (=> d!106423 e!464239))

(declare-fun res!566299 () Bool)

(assert (=> d!106423 (=> (not res!566299) (not e!464239))))

(declare-fun lt!377651 () List!15846)

(assert (=> d!106423 (= res!566299 (isStrictlySorted!429 lt!377651))))

(declare-fun e!464240 () List!15846)

(assert (=> d!106423 (= lt!377651 e!464240)))

(declare-fun c!90514 () Bool)

(assert (=> d!106423 (= c!90514 (and ((_ is Cons!15842) (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (bvslt (_1!5049 (h!16977 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106423 (isStrictlySorted!429 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))))))

(assert (=> d!106423 (= (insertStrictlySorted!269 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) lt!377651)))

(declare-fun b!832370 () Bool)

(declare-fun e!464241 () List!15846)

(declare-fun c!90516 () Bool)

(declare-fun c!90515 () Bool)

(assert (=> b!832370 (= e!464241 (ite c!90516 (t!22203 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (ite c!90515 (Cons!15842 (h!16977 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (t!22203 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))))) Nil!15843)))))

(declare-fun b!832371 () Bool)

(declare-fun e!464238 () List!15846)

(assert (=> b!832371 (= e!464238 call!36383)))

(declare-fun b!832372 () Bool)

(assert (=> b!832372 (= e!464238 call!36383)))

(declare-fun b!832373 () Bool)

(declare-fun e!464237 () List!15846)

(assert (=> b!832373 (= e!464237 call!36384)))

(declare-fun bm!36382 () Bool)

(assert (=> bm!36382 (= call!36385 ($colon$colon!533 e!464241 (ite c!90514 (h!16977 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (tuple2!10077 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun c!90513 () Bool)

(assert (=> bm!36382 (= c!90513 c!90514)))

(declare-fun b!832374 () Bool)

(assert (=> b!832374 (= e!464241 (insertStrictlySorted!269 (t!22203 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832375 () Bool)

(declare-fun res!566298 () Bool)

(assert (=> b!832375 (=> (not res!566298) (not e!464239))))

(assert (=> b!832375 (= res!566298 (containsKey!401 lt!377651 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832376 () Bool)

(assert (=> b!832376 (= e!464240 e!464237)))

(assert (=> b!832376 (= c!90516 (and ((_ is Cons!15842) (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (= (_1!5049 (h!16977 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832377 () Bool)

(assert (=> b!832377 (= e!464239 (contains!4188 lt!377651 (tuple2!10077 (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (_2!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832378 () Bool)

(assert (=> b!832378 (= e!464240 call!36385)))

(declare-fun b!832379 () Bool)

(assert (=> b!832379 (= c!90515 (and ((_ is Cons!15842) (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300)))) (bvsgt (_1!5049 (h!16977 (toList!4466 (ite c!90184 call!36301 (ite c!90185 call!36302 call!36300))))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> b!832379 (= e!464237 e!464238)))

(assert (= (and d!106423 c!90514) b!832378))

(assert (= (and d!106423 (not c!90514)) b!832376))

(assert (= (and b!832376 c!90516) b!832373))

(assert (= (and b!832376 (not c!90516)) b!832379))

(assert (= (and b!832379 c!90515) b!832371))

(assert (= (and b!832379 (not c!90515)) b!832372))

(assert (= (or b!832371 b!832372) bm!36380))

(assert (= (or b!832373 bm!36380) bm!36381))

(assert (= (or b!832378 bm!36381) bm!36382))

(assert (= (and bm!36382 c!90513) b!832374))

(assert (= (and bm!36382 (not c!90513)) b!832370))

(assert (= (and d!106423 res!566299) b!832375))

(assert (= (and b!832375 res!566298) b!832377))

(declare-fun m!776533 () Bool)

(assert (=> d!106423 m!776533))

(declare-fun m!776535 () Bool)

(assert (=> d!106423 m!776535))

(declare-fun m!776537 () Bool)

(assert (=> bm!36382 m!776537))

(declare-fun m!776539 () Bool)

(assert (=> b!832374 m!776539))

(declare-fun m!776541 () Bool)

(assert (=> b!832375 m!776541))

(declare-fun m!776543 () Bool)

(assert (=> b!832377 m!776543))

(assert (=> d!105909 d!106423))

(assert (=> b!831544 d!106175))

(assert (=> b!831544 d!106177))

(declare-fun d!106425 () Bool)

(assert (=> d!106425 (= (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377166)) (v!10095 (getValueByKey!416 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377166)))))

(assert (=> d!105803 d!106425))

(declare-fun b!832381 () Bool)

(declare-fun e!464242 () Option!422)

(declare-fun e!464243 () Option!422)

(assert (=> b!832381 (= e!464242 e!464243)))

(declare-fun c!90518 () Bool)

(assert (=> b!832381 (= c!90518 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34))))) lt!377166))))))

(declare-fun b!832382 () Bool)

(assert (=> b!832382 (= e!464243 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)))) lt!377166))))

(declare-fun c!90517 () Bool)

(declare-fun d!106427 () Bool)

(assert (=> d!106427 (= c!90517 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34))))) lt!377166)))))

(assert (=> d!106427 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377166) e!464242)))

(declare-fun b!832380 () Bool)

(assert (=> b!832380 (= e!464242 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377170 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))))

(declare-fun b!832383 () Bool)

(assert (=> b!832383 (= e!464243 None!420)))

(assert (= (and d!106427 c!90517) b!832380))

(assert (= (and d!106427 (not c!90517)) b!832381))

(assert (= (and b!832381 c!90518) b!832382))

(assert (= (and b!832381 (not c!90518)) b!832383))

(declare-fun m!776545 () Bool)

(assert (=> b!832382 m!776545))

(assert (=> d!105803 d!106427))

(declare-fun b!832385 () Bool)

(declare-fun e!464244 () Option!422)

(declare-fun e!464245 () Option!422)

(assert (=> b!832385 (= e!464244 e!464245)))

(declare-fun c!90520 () Bool)

(assert (=> b!832385 (= c!90520 (and ((_ is Cons!15842) (toList!4466 lt!377448)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377448))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))))

(declare-fun b!832386 () Bool)

(assert (=> b!832386 (= e!464245 (getValueByKey!416 (t!22203 (toList!4466 lt!377448)) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun c!90519 () Bool)

(declare-fun d!106429 () Bool)

(assert (=> d!106429 (= c!90519 (and ((_ is Cons!15842) (toList!4466 lt!377448)) (= (_1!5049 (h!16977 (toList!4466 lt!377448))) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(assert (=> d!106429 (= (getValueByKey!416 (toList!4466 lt!377448) (_1!5049 (ite (or c!90184 c!90185) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))) e!464244)))

(declare-fun b!832384 () Bool)

(assert (=> b!832384 (= e!464244 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377448)))))))

(declare-fun b!832387 () Bool)

(assert (=> b!832387 (= e!464245 None!420)))

(assert (= (and d!106429 c!90519) b!832384))

(assert (= (and d!106429 (not c!90519)) b!832385))

(assert (= (and b!832385 c!90520) b!832386))

(assert (= (and b!832385 (not c!90520)) b!832387))

(declare-fun m!776547 () Bool)

(assert (=> b!832386 m!776547))

(assert (=> b!831668 d!106429))

(declare-fun d!106431 () Bool)

(assert (=> d!106431 (= ($colon$colon!533 e!463737 (ite c!90263 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))) (Cons!15842 (ite c!90263 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) e!463737))))

(assert (=> bm!36323 d!106431))

(declare-fun d!106433 () Bool)

(assert (=> d!106433 (= ($colon$colon!533 e!463771 (ite c!90283 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))) (Cons!15842 (ite c!90283 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) e!463771))))

(assert (=> bm!36329 d!106433))

(declare-fun b!832389 () Bool)

(declare-fun e!464246 () Option!422)

(declare-fun e!464247 () Option!422)

(assert (=> b!832389 (= e!464246 e!464247)))

(declare-fun c!90522 () Bool)

(assert (=> b!832389 (= c!90522 (and ((_ is Cons!15842) (t!22203 lt!377210)) (not (= (_1!5049 (h!16977 (t!22203 lt!377210))) (_1!5049 lt!377012)))))))

(declare-fun b!832390 () Bool)

(assert (=> b!832390 (= e!464247 (getValueByKey!416 (t!22203 (t!22203 lt!377210)) (_1!5049 lt!377012)))))

(declare-fun d!106435 () Bool)

(declare-fun c!90521 () Bool)

(assert (=> d!106435 (= c!90521 (and ((_ is Cons!15842) (t!22203 lt!377210)) (= (_1!5049 (h!16977 (t!22203 lt!377210))) (_1!5049 lt!377012))))))

(assert (=> d!106435 (= (getValueByKey!416 (t!22203 lt!377210) (_1!5049 lt!377012)) e!464246)))

(declare-fun b!832388 () Bool)

(assert (=> b!832388 (= e!464246 (Some!421 (_2!5049 (h!16977 (t!22203 lt!377210)))))))

(declare-fun b!832391 () Bool)

(assert (=> b!832391 (= e!464247 None!420)))

(assert (= (and d!106435 c!90521) b!832388))

(assert (= (and d!106435 (not c!90521)) b!832389))

(assert (= (and b!832389 c!90522) b!832390))

(assert (= (and b!832389 (not c!90522)) b!832391))

(declare-fun m!776549 () Bool)

(assert (=> b!832390 m!776549))

(assert (=> b!831479 d!106435))

(declare-fun d!106437 () Bool)

(declare-fun e!464249 () Bool)

(assert (=> d!106437 e!464249))

(declare-fun res!566300 () Bool)

(assert (=> d!106437 (=> res!566300 e!464249)))

(declare-fun lt!377654 () Bool)

(assert (=> d!106437 (= res!566300 (not lt!377654))))

(declare-fun lt!377653 () Bool)

(assert (=> d!106437 (= lt!377654 lt!377653)))

(declare-fun lt!377652 () Unit!28446)

(declare-fun e!464248 () Unit!28446)

(assert (=> d!106437 (= lt!377652 e!464248)))

(declare-fun c!90523 () Bool)

(assert (=> d!106437 (= c!90523 lt!377653)))

(assert (=> d!106437 (= lt!377653 (containsKey!401 (toList!4466 lt!377378) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(assert (=> d!106437 (= (contains!4187 lt!377378 (_1!5049 (tuple2!10077 lt!377086 lt!377091))) lt!377654)))

(declare-fun b!832392 () Bool)

(declare-fun lt!377655 () Unit!28446)

(assert (=> b!832392 (= e!464248 lt!377655)))

(assert (=> b!832392 (= lt!377655 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377378) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(assert (=> b!832392 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377378) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun b!832393 () Bool)

(declare-fun Unit!28497 () Unit!28446)

(assert (=> b!832393 (= e!464248 Unit!28497)))

(declare-fun b!832394 () Bool)

(assert (=> b!832394 (= e!464249 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377378) (_1!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (= (and d!106437 c!90523) b!832392))

(assert (= (and d!106437 (not c!90523)) b!832393))

(assert (= (and d!106437 (not res!566300)) b!832394))

(declare-fun m!776551 () Bool)

(assert (=> d!106437 m!776551))

(declare-fun m!776553 () Bool)

(assert (=> b!832392 m!776553))

(assert (=> b!832392 m!775333))

(assert (=> b!832392 m!775333))

(declare-fun m!776555 () Bool)

(assert (=> b!832392 m!776555))

(assert (=> b!832394 m!775333))

(assert (=> b!832394 m!775333))

(assert (=> b!832394 m!776555))

(assert (=> d!105833 d!106437))

(declare-fun b!832396 () Bool)

(declare-fun e!464250 () Option!422)

(declare-fun e!464251 () Option!422)

(assert (=> b!832396 (= e!464250 e!464251)))

(declare-fun c!90525 () Bool)

(assert (=> b!832396 (= c!90525 (and ((_ is Cons!15842) lt!377380) (not (= (_1!5049 (h!16977 lt!377380)) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))))

(declare-fun b!832397 () Bool)

(assert (=> b!832397 (= e!464251 (getValueByKey!416 (t!22203 lt!377380) (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun d!106439 () Bool)

(declare-fun c!90524 () Bool)

(assert (=> d!106439 (= c!90524 (and ((_ is Cons!15842) lt!377380) (= (_1!5049 (h!16977 lt!377380)) (_1!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (=> d!106439 (= (getValueByKey!416 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091))) e!464250)))

(declare-fun b!832395 () Bool)

(assert (=> b!832395 (= e!464250 (Some!421 (_2!5049 (h!16977 lt!377380))))))

(declare-fun b!832398 () Bool)

(assert (=> b!832398 (= e!464251 None!420)))

(assert (= (and d!106439 c!90524) b!832395))

(assert (= (and d!106439 (not c!90524)) b!832396))

(assert (= (and b!832396 c!90525) b!832397))

(assert (= (and b!832396 (not c!90525)) b!832398))

(declare-fun m!776557 () Bool)

(assert (=> b!832397 m!776557))

(assert (=> d!105833 d!106439))

(declare-fun d!106441 () Bool)

(assert (=> d!106441 (= (getValueByKey!416 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091))) (Some!421 (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun lt!377656 () Unit!28446)

(assert (=> d!106441 (= lt!377656 (choose!1423 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun e!464252 () Bool)

(assert (=> d!106441 e!464252))

(declare-fun res!566301 () Bool)

(assert (=> d!106441 (=> (not res!566301) (not e!464252))))

(assert (=> d!106441 (= res!566301 (isStrictlySorted!429 lt!377380))))

(assert (=> d!106441 (= (lemmaContainsTupThenGetReturnValue!230 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))) lt!377656)))

(declare-fun b!832399 () Bool)

(declare-fun res!566302 () Bool)

(assert (=> b!832399 (=> (not res!566302) (not e!464252))))

(assert (=> b!832399 (= res!566302 (containsKey!401 lt!377380 (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun b!832400 () Bool)

(assert (=> b!832400 (= e!464252 (contains!4188 lt!377380 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (= (and d!106441 res!566301) b!832399))

(assert (= (and b!832399 res!566302) b!832400))

(assert (=> d!106441 m!775327))

(declare-fun m!776559 () Bool)

(assert (=> d!106441 m!776559))

(declare-fun m!776561 () Bool)

(assert (=> d!106441 m!776561))

(declare-fun m!776563 () Bool)

(assert (=> b!832399 m!776563))

(declare-fun m!776565 () Bool)

(assert (=> b!832400 m!776565))

(assert (=> d!105833 d!106441))

(declare-fun bm!36383 () Bool)

(declare-fun call!36386 () List!15846)

(declare-fun call!36387 () List!15846)

(assert (=> bm!36383 (= call!36386 call!36387)))

(declare-fun bm!36384 () Bool)

(declare-fun call!36388 () List!15846)

(assert (=> bm!36384 (= call!36387 call!36388)))

(declare-fun d!106443 () Bool)

(declare-fun e!464255 () Bool)

(assert (=> d!106443 e!464255))

(declare-fun res!566304 () Bool)

(assert (=> d!106443 (=> (not res!566304) (not e!464255))))

(declare-fun lt!377657 () List!15846)

(assert (=> d!106443 (= res!566304 (isStrictlySorted!429 lt!377657))))

(declare-fun e!464256 () List!15846)

(assert (=> d!106443 (= lt!377657 e!464256)))

(declare-fun c!90527 () Bool)

(assert (=> d!106443 (= c!90527 (and ((_ is Cons!15842) (toList!4466 lt!377090)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377090))) (_1!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (=> d!106443 (isStrictlySorted!429 (toList!4466 lt!377090))))

(assert (=> d!106443 (= (insertStrictlySorted!269 (toList!4466 lt!377090) (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))) lt!377657)))

(declare-fun c!90528 () Bool)

(declare-fun e!464257 () List!15846)

(declare-fun c!90529 () Bool)

(declare-fun b!832401 () Bool)

(assert (=> b!832401 (= e!464257 (ite c!90529 (t!22203 (toList!4466 lt!377090)) (ite c!90528 (Cons!15842 (h!16977 (toList!4466 lt!377090)) (t!22203 (toList!4466 lt!377090))) Nil!15843)))))

(declare-fun b!832402 () Bool)

(declare-fun e!464254 () List!15846)

(assert (=> b!832402 (= e!464254 call!36386)))

(declare-fun b!832403 () Bool)

(assert (=> b!832403 (= e!464254 call!36386)))

(declare-fun b!832404 () Bool)

(declare-fun e!464253 () List!15846)

(assert (=> b!832404 (= e!464253 call!36387)))

(declare-fun bm!36385 () Bool)

(assert (=> bm!36385 (= call!36388 ($colon$colon!533 e!464257 (ite c!90527 (h!16977 (toList!4466 lt!377090)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))))

(declare-fun c!90526 () Bool)

(assert (=> bm!36385 (= c!90526 c!90527)))

(declare-fun b!832405 () Bool)

(assert (=> b!832405 (= e!464257 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377090)) (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun b!832406 () Bool)

(declare-fun res!566303 () Bool)

(assert (=> b!832406 (=> (not res!566303) (not e!464255))))

(assert (=> b!832406 (= res!566303 (containsKey!401 lt!377657 (_1!5049 (tuple2!10077 lt!377086 lt!377091))))))

(declare-fun b!832407 () Bool)

(assert (=> b!832407 (= e!464256 e!464253)))

(assert (=> b!832407 (= c!90529 (and ((_ is Cons!15842) (toList!4466 lt!377090)) (= (_1!5049 (h!16977 (toList!4466 lt!377090))) (_1!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(declare-fun b!832408 () Bool)

(assert (=> b!832408 (= e!464255 (contains!4188 lt!377657 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377086 lt!377091)) (_2!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(declare-fun b!832409 () Bool)

(assert (=> b!832409 (= e!464256 call!36388)))

(declare-fun b!832410 () Bool)

(assert (=> b!832410 (= c!90528 (and ((_ is Cons!15842) (toList!4466 lt!377090)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377090))) (_1!5049 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (=> b!832410 (= e!464253 e!464254)))

(assert (= (and d!106443 c!90527) b!832409))

(assert (= (and d!106443 (not c!90527)) b!832407))

(assert (= (and b!832407 c!90529) b!832404))

(assert (= (and b!832407 (not c!90529)) b!832410))

(assert (= (and b!832410 c!90528) b!832402))

(assert (= (and b!832410 (not c!90528)) b!832403))

(assert (= (or b!832402 b!832403) bm!36383))

(assert (= (or b!832404 bm!36383) bm!36384))

(assert (= (or b!832409 bm!36384) bm!36385))

(assert (= (and bm!36385 c!90526) b!832405))

(assert (= (and bm!36385 (not c!90526)) b!832401))

(assert (= (and d!106443 res!566304) b!832406))

(assert (= (and b!832406 res!566303) b!832408))

(declare-fun m!776567 () Bool)

(assert (=> d!106443 m!776567))

(declare-fun m!776569 () Bool)

(assert (=> d!106443 m!776569))

(declare-fun m!776571 () Bool)

(assert (=> bm!36385 m!776571))

(declare-fun m!776573 () Bool)

(assert (=> b!832405 m!776573))

(declare-fun m!776575 () Bool)

(assert (=> b!832406 m!776575))

(declare-fun m!776577 () Bool)

(assert (=> b!832408 m!776577))

(assert (=> d!105833 d!106443))

(declare-fun d!106445 () Bool)

(declare-fun e!464259 () Bool)

(assert (=> d!106445 e!464259))

(declare-fun res!566305 () Bool)

(assert (=> d!106445 (=> res!566305 e!464259)))

(declare-fun lt!377660 () Bool)

(assert (=> d!106445 (= res!566305 (not lt!377660))))

(declare-fun lt!377659 () Bool)

(assert (=> d!106445 (= lt!377660 lt!377659)))

(declare-fun lt!377658 () Unit!28446)

(declare-fun e!464258 () Unit!28446)

(assert (=> d!106445 (= lt!377658 e!464258)))

(declare-fun c!90530 () Bool)

(assert (=> d!106445 (= c!90530 lt!377659)))

(assert (=> d!106445 (= lt!377659 (containsKey!401 (toList!4466 lt!377252) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106445 (= (contains!4187 lt!377252 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377660)))

(declare-fun b!832411 () Bool)

(declare-fun lt!377661 () Unit!28446)

(assert (=> b!832411 (= e!464258 lt!377661)))

(assert (=> b!832411 (= lt!377661 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377252) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832411 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377252) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832412 () Bool)

(declare-fun Unit!28498 () Unit!28446)

(assert (=> b!832412 (= e!464258 Unit!28498)))

(declare-fun b!832413 () Bool)

(assert (=> b!832413 (= e!464259 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377252) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106445 c!90530) b!832411))

(assert (= (and d!106445 (not c!90530)) b!832412))

(assert (= (and d!106445 (not res!566305)) b!832413))

(declare-fun m!776579 () Bool)

(assert (=> d!106445 m!776579))

(declare-fun m!776581 () Bool)

(assert (=> b!832411 m!776581))

(declare-fun m!776583 () Bool)

(assert (=> b!832411 m!776583))

(assert (=> b!832411 m!776583))

(declare-fun m!776585 () Bool)

(assert (=> b!832411 m!776585))

(assert (=> b!832413 m!776583))

(assert (=> b!832413 m!776583))

(assert (=> b!832413 m!776585))

(assert (=> b!831372 d!106445))

(declare-fun d!106447 () Bool)

(assert (=> d!106447 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (v!10095 (getValueByKey!416 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!105901 d!106447))

(assert (=> d!105901 d!106039))

(declare-fun b!832415 () Bool)

(declare-fun e!464260 () Option!422)

(declare-fun e!464261 () Option!422)

(assert (=> b!832415 (= e!464260 e!464261)))

(declare-fun c!90532 () Bool)

(assert (=> b!832415 (= c!90532 (and ((_ is Cons!15842) (toList!4466 lt!377308)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377308))) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))))

(declare-fun b!832416 () Bool)

(assert (=> b!832416 (= e!464261 (getValueByKey!416 (t!22203 (toList!4466 lt!377308)) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))))))

(declare-fun c!90531 () Bool)

(declare-fun d!106449 () Bool)

(assert (=> d!106449 (= c!90531 (and ((_ is Cons!15842) (toList!4466 lt!377308)) (= (_1!5049 (h!16977 (toList!4466 lt!377308))) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34)))))))

(assert (=> d!106449 (= (getValueByKey!416 (toList!4466 lt!377308) (_1!5049 (tuple2!10077 lt!377189 zeroValueAfter!34))) e!464260)))

(declare-fun b!832414 () Bool)

(assert (=> b!832414 (= e!464260 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377308)))))))

(declare-fun b!832417 () Bool)

(assert (=> b!832417 (= e!464261 None!420)))

(assert (= (and d!106449 c!90531) b!832414))

(assert (= (and d!106449 (not c!90531)) b!832415))

(assert (= (and b!832415 c!90532) b!832416))

(assert (= (and b!832415 (not c!90532)) b!832417))

(declare-fun m!776587 () Bool)

(assert (=> b!832416 m!776587))

(assert (=> b!831463 d!106449))

(declare-fun d!106451 () Bool)

(assert (=> d!106451 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377662 () Unit!28446)

(assert (=> d!106451 (= lt!377662 (choose!1427 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464262 () Bool)

(assert (=> d!106451 e!464262))

(declare-fun res!566306 () Bool)

(assert (=> d!106451 (=> (not res!566306) (not e!464262))))

(assert (=> d!106451 (= res!566306 (isStrictlySorted!429 (toList!4466 lt!377087)))))

(assert (=> d!106451 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377662)))

(declare-fun b!832418 () Bool)

(assert (=> b!832418 (= e!464262 (containsKey!401 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106451 res!566306) b!832418))

(assert (=> d!106451 m!774611))

(assert (=> d!106451 m!775169))

(assert (=> d!106451 m!775169))

(assert (=> d!106451 m!775171))

(assert (=> d!106451 m!774611))

(declare-fun m!776589 () Bool)

(assert (=> d!106451 m!776589))

(assert (=> d!106451 m!775575))

(assert (=> b!832418 m!774611))

(assert (=> b!832418 m!775165))

(assert (=> b!831500 d!106451))

(declare-fun d!106453 () Bool)

(assert (=> d!106453 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377087) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))))

(declare-fun bs!23261 () Bool)

(assert (= bs!23261 d!106453))

(assert (=> bs!23261 m!775169))

(declare-fun m!776591 () Bool)

(assert (=> bs!23261 m!776591))

(assert (=> b!831500 d!106453))

(assert (=> b!831500 d!106401))

(declare-fun d!106455 () Bool)

(assert (=> d!106455 (= ($colon$colon!533 e!463648 (ite c!90231 (h!16977 (toList!4466 lt!377014)) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010)))) (Cons!15842 (ite c!90231 (h!16977 (toList!4466 lt!377014)) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))) e!463648))))

(assert (=> bm!36313 d!106455))

(assert (=> b!831505 d!106221))

(assert (=> b!831505 d!106223))

(declare-fun d!106457 () Bool)

(assert (=> d!106457 (= (get!11821 (getValueByKey!416 (toList!4466 lt!377192) lt!377188)) (v!10095 (getValueByKey!416 (toList!4466 lt!377192) lt!377188)))))

(assert (=> d!105729 d!106457))

(declare-fun b!832420 () Bool)

(declare-fun e!464263 () Option!422)

(declare-fun e!464264 () Option!422)

(assert (=> b!832420 (= e!464263 e!464264)))

(declare-fun c!90534 () Bool)

(assert (=> b!832420 (= c!90534 (and ((_ is Cons!15842) (toList!4466 lt!377192)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377192))) lt!377188))))))

(declare-fun b!832421 () Bool)

(assert (=> b!832421 (= e!464264 (getValueByKey!416 (t!22203 (toList!4466 lt!377192)) lt!377188))))

(declare-fun d!106459 () Bool)

(declare-fun c!90533 () Bool)

(assert (=> d!106459 (= c!90533 (and ((_ is Cons!15842) (toList!4466 lt!377192)) (= (_1!5049 (h!16977 (toList!4466 lt!377192))) lt!377188)))))

(assert (=> d!106459 (= (getValueByKey!416 (toList!4466 lt!377192) lt!377188) e!464263)))

(declare-fun b!832419 () Bool)

(assert (=> b!832419 (= e!464263 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377192)))))))

(declare-fun b!832422 () Bool)

(assert (=> b!832422 (= e!464264 None!420)))

(assert (= (and d!106459 c!90533) b!832419))

(assert (= (and d!106459 (not c!90533)) b!832420))

(assert (= (and b!832420 c!90534) b!832421))

(assert (= (and b!832420 (not c!90534)) b!832422))

(declare-fun m!776593 () Bool)

(assert (=> b!832421 m!776593))

(assert (=> d!105729 d!106459))

(declare-fun d!106461 () Bool)

(assert (=> d!106461 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012)))))

(declare-fun lt!377663 () Unit!28446)

(assert (=> d!106461 (= lt!377663 (choose!1427 (toList!4466 lt!377208) (_1!5049 lt!377012)))))

(declare-fun e!464265 () Bool)

(assert (=> d!106461 e!464265))

(declare-fun res!566307 () Bool)

(assert (=> d!106461 (=> (not res!566307) (not e!464265))))

(assert (=> d!106461 (= res!566307 (isStrictlySorted!429 (toList!4466 lt!377208)))))

(assert (=> d!106461 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377208) (_1!5049 lt!377012)) lt!377663)))

(declare-fun b!832423 () Bool)

(assert (=> b!832423 (= e!464265 (containsKey!401 (toList!4466 lt!377208) (_1!5049 lt!377012)))))

(assert (= (and d!106461 res!566307) b!832423))

(assert (=> d!106461 m!774811))

(assert (=> d!106461 m!774811))

(assert (=> d!106461 m!775121))

(declare-fun m!776595 () Bool)

(assert (=> d!106461 m!776595))

(declare-fun m!776597 () Bool)

(assert (=> d!106461 m!776597))

(assert (=> b!832423 m!775117))

(assert (=> b!831474 d!106461))

(declare-fun d!106463 () Bool)

(assert (=> d!106463 (= (isDefined!311 (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012))) (not (isEmpty!662 (getValueByKey!416 (toList!4466 lt!377208) (_1!5049 lt!377012)))))))

(declare-fun bs!23262 () Bool)

(assert (= bs!23262 d!106463))

(assert (=> bs!23262 m!774811))

(declare-fun m!776599 () Bool)

(assert (=> bs!23262 m!776599))

(assert (=> b!831474 d!106463))

(assert (=> b!831474 d!105867))

(declare-fun d!106465 () Bool)

(declare-fun e!464267 () Bool)

(assert (=> d!106465 e!464267))

(declare-fun res!566308 () Bool)

(assert (=> d!106465 (=> res!566308 e!464267)))

(declare-fun lt!377666 () Bool)

(assert (=> d!106465 (= res!566308 (not lt!377666))))

(declare-fun lt!377665 () Bool)

(assert (=> d!106465 (= lt!377666 lt!377665)))

(declare-fun lt!377664 () Unit!28446)

(declare-fun e!464266 () Unit!28446)

(assert (=> d!106465 (= lt!377664 e!464266)))

(declare-fun c!90535 () Bool)

(assert (=> d!106465 (= c!90535 lt!377665)))

(assert (=> d!106465 (= lt!377665 (containsKey!401 (toList!4466 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249))) lt!377247))))

(assert (=> d!106465 (= (contains!4187 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249)) lt!377247) lt!377666)))

(declare-fun b!832424 () Bool)

(declare-fun lt!377667 () Unit!28446)

(assert (=> b!832424 (= e!464266 lt!377667)))

(assert (=> b!832424 (= lt!377667 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249))) lt!377247))))

(assert (=> b!832424 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249))) lt!377247))))

(declare-fun b!832425 () Bool)

(declare-fun Unit!28499 () Unit!28446)

(assert (=> b!832425 (= e!464266 Unit!28499)))

(declare-fun b!832426 () Bool)

(assert (=> b!832426 (= e!464267 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249))) lt!377247)))))

(assert (= (and d!106465 c!90535) b!832424))

(assert (= (and d!106465 (not c!90535)) b!832425))

(assert (= (and d!106465 (not res!566308)) b!832426))

(declare-fun m!776601 () Bool)

(assert (=> d!106465 m!776601))

(declare-fun m!776603 () Bool)

(assert (=> b!832424 m!776603))

(declare-fun m!776605 () Bool)

(assert (=> b!832424 m!776605))

(assert (=> b!832424 m!776605))

(declare-fun m!776607 () Bool)

(assert (=> b!832424 m!776607))

(assert (=> b!832426 m!776605))

(assert (=> b!832426 m!776605))

(assert (=> b!832426 m!776607))

(assert (=> b!831352 d!106465))

(declare-fun d!106467 () Bool)

(assert (=> d!106467 (not (contains!4187 (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249)) lt!377247))))

(declare-fun lt!377668 () Unit!28446)

(assert (=> d!106467 (= lt!377668 (choose!1426 lt!377248 lt!377244 lt!377249 lt!377247))))

(declare-fun e!464268 () Bool)

(assert (=> d!106467 e!464268))

(declare-fun res!566309 () Bool)

(assert (=> d!106467 (=> (not res!566309) (not e!464268))))

(assert (=> d!106467 (= res!566309 (not (contains!4187 lt!377248 lt!377247)))))

(assert (=> d!106467 (= (addStillNotContains!199 lt!377248 lt!377244 lt!377249 lt!377247) lt!377668)))

(declare-fun b!832427 () Bool)

(assert (=> b!832427 (= e!464268 (not (= lt!377244 lt!377247)))))

(assert (= (and d!106467 res!566309) b!832427))

(assert (=> d!106467 m!774875))

(assert (=> d!106467 m!774875))

(assert (=> d!106467 m!774877))

(declare-fun m!776609 () Bool)

(assert (=> d!106467 m!776609))

(declare-fun m!776611 () Bool)

(assert (=> d!106467 m!776611))

(assert (=> b!831352 d!106467))

(assert (=> b!831352 d!105999))

(declare-fun d!106469 () Bool)

(declare-fun e!464269 () Bool)

(assert (=> d!106469 e!464269))

(declare-fun res!566310 () Bool)

(assert (=> d!106469 (=> (not res!566310) (not e!464269))))

(declare-fun lt!377670 () ListLongMap!8901)

(assert (=> d!106469 (= res!566310 (contains!4187 lt!377670 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!377672 () List!15846)

(assert (=> d!106469 (= lt!377670 (ListLongMap!8902 lt!377672))))

(declare-fun lt!377671 () Unit!28446)

(declare-fun lt!377669 () Unit!28446)

(assert (=> d!106469 (= lt!377671 lt!377669)))

(assert (=> d!106469 (= (getValueByKey!416 lt!377672 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106469 (= lt!377669 (lemmaContainsTupThenGetReturnValue!230 lt!377672 (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106469 (= lt!377672 (insertStrictlySorted!269 (toList!4466 call!36306) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106469 (= (+!1988 call!36306 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!377670)))

(declare-fun b!832428 () Bool)

(declare-fun res!566311 () Bool)

(assert (=> b!832428 (=> (not res!566311) (not e!464269))))

(assert (=> b!832428 (= res!566311 (= (getValueByKey!416 (toList!4466 lt!377670) (_1!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!421 (_2!5049 (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!832429 () Bool)

(assert (=> b!832429 (= e!464269 (contains!4188 (toList!4466 lt!377670) (tuple2!10077 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (get!11820 (select (arr!22326 _values!788) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (dynLambda!980 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!106469 res!566310) b!832428))

(assert (= (and b!832428 res!566311) b!832429))

(declare-fun m!776613 () Bool)

(assert (=> d!106469 m!776613))

(declare-fun m!776615 () Bool)

(assert (=> d!106469 m!776615))

(declare-fun m!776617 () Bool)

(assert (=> d!106469 m!776617))

(declare-fun m!776619 () Bool)

(assert (=> d!106469 m!776619))

(declare-fun m!776621 () Bool)

(assert (=> b!832428 m!776621))

(declare-fun m!776623 () Bool)

(assert (=> b!832429 m!776623))

(assert (=> b!831352 d!106469))

(declare-fun d!106471 () Bool)

(declare-fun e!464270 () Bool)

(assert (=> d!106471 e!464270))

(declare-fun res!566312 () Bool)

(assert (=> d!106471 (=> (not res!566312) (not e!464270))))

(declare-fun lt!377674 () ListLongMap!8901)

(assert (=> d!106471 (= res!566312 (contains!4187 lt!377674 (_1!5049 (tuple2!10077 lt!377244 lt!377249))))))

(declare-fun lt!377676 () List!15846)

(assert (=> d!106471 (= lt!377674 (ListLongMap!8902 lt!377676))))

(declare-fun lt!377675 () Unit!28446)

(declare-fun lt!377673 () Unit!28446)

(assert (=> d!106471 (= lt!377675 lt!377673)))

(assert (=> d!106471 (= (getValueByKey!416 lt!377676 (_1!5049 (tuple2!10077 lt!377244 lt!377249))) (Some!421 (_2!5049 (tuple2!10077 lt!377244 lt!377249))))))

(assert (=> d!106471 (= lt!377673 (lemmaContainsTupThenGetReturnValue!230 lt!377676 (_1!5049 (tuple2!10077 lt!377244 lt!377249)) (_2!5049 (tuple2!10077 lt!377244 lt!377249))))))

(assert (=> d!106471 (= lt!377676 (insertStrictlySorted!269 (toList!4466 lt!377248) (_1!5049 (tuple2!10077 lt!377244 lt!377249)) (_2!5049 (tuple2!10077 lt!377244 lt!377249))))))

(assert (=> d!106471 (= (+!1988 lt!377248 (tuple2!10077 lt!377244 lt!377249)) lt!377674)))

(declare-fun b!832430 () Bool)

(declare-fun res!566313 () Bool)

(assert (=> b!832430 (=> (not res!566313) (not e!464270))))

(assert (=> b!832430 (= res!566313 (= (getValueByKey!416 (toList!4466 lt!377674) (_1!5049 (tuple2!10077 lt!377244 lt!377249))) (Some!421 (_2!5049 (tuple2!10077 lt!377244 lt!377249)))))))

(declare-fun b!832431 () Bool)

(assert (=> b!832431 (= e!464270 (contains!4188 (toList!4466 lt!377674) (tuple2!10077 lt!377244 lt!377249)))))

(assert (= (and d!106471 res!566312) b!832430))

(assert (= (and b!832430 res!566313) b!832431))

(declare-fun m!776625 () Bool)

(assert (=> d!106471 m!776625))

(declare-fun m!776627 () Bool)

(assert (=> d!106471 m!776627))

(declare-fun m!776629 () Bool)

(assert (=> d!106471 m!776629))

(declare-fun m!776631 () Bool)

(assert (=> d!106471 m!776631))

(declare-fun m!776633 () Bool)

(assert (=> b!832430 m!776633))

(declare-fun m!776635 () Bool)

(assert (=> b!832431 m!776635))

(assert (=> b!831352 d!106471))

(assert (=> b!831499 d!106245))

(assert (=> b!831499 d!106247))

(assert (=> b!831603 d!106253))

(assert (=> b!831603 d!106255))

(declare-fun b!832433 () Bool)

(declare-fun e!464271 () Option!422)

(declare-fun e!464272 () Option!422)

(assert (=> b!832433 (= e!464271 e!464272)))

(declare-fun c!90537 () Bool)

(assert (=> b!832433 (= c!90537 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377116))) (not (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377116)))) (_1!5049 lt!377010)))))))

(declare-fun b!832434 () Bool)

(assert (=> b!832434 (= e!464272 (getValueByKey!416 (t!22203 (t!22203 (toList!4466 lt!377116))) (_1!5049 lt!377010)))))

(declare-fun d!106473 () Bool)

(declare-fun c!90536 () Bool)

(assert (=> d!106473 (= c!90536 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377116))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377116)))) (_1!5049 lt!377010))))))

(assert (=> d!106473 (= (getValueByKey!416 (t!22203 (toList!4466 lt!377116)) (_1!5049 lt!377010)) e!464271)))

(declare-fun b!832432 () Bool)

(assert (=> b!832432 (= e!464271 (Some!421 (_2!5049 (h!16977 (t!22203 (toList!4466 lt!377116))))))))

(declare-fun b!832435 () Bool)

(assert (=> b!832435 (= e!464272 None!420)))

(assert (= (and d!106473 c!90536) b!832432))

(assert (= (and d!106473 (not c!90536)) b!832433))

(assert (= (and b!832433 c!90537) b!832434))

(assert (= (and b!832433 (not c!90537)) b!832435))

(declare-fun m!776637 () Bool)

(assert (=> b!832434 m!776637))

(assert (=> b!831369 d!106473))

(assert (=> b!831525 d!106319))

(assert (=> b!831525 d!105893))

(assert (=> d!105783 d!105665))

(assert (=> d!105783 d!105663))

(declare-fun d!106475 () Bool)

(assert (=> d!106475 (= (apply!372 lt!377245 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (get!11821 (getValueByKey!416 (toList!4466 lt!377245) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(declare-fun bs!23263 () Bool)

(assert (= bs!23263 d!106475))

(assert (=> bs!23263 m!774867))

(declare-fun m!776639 () Bool)

(assert (=> bs!23263 m!776639))

(assert (=> bs!23263 m!776639))

(declare-fun m!776641 () Bool)

(assert (=> bs!23263 m!776641))

(assert (=> b!831356 d!106475))

(assert (=> b!831356 d!105999))

(declare-fun d!106477 () Bool)

(declare-fun e!464274 () Bool)

(assert (=> d!106477 e!464274))

(declare-fun res!566314 () Bool)

(assert (=> d!106477 (=> res!566314 e!464274)))

(declare-fun lt!377679 () Bool)

(assert (=> d!106477 (= res!566314 (not lt!377679))))

(declare-fun lt!377678 () Bool)

(assert (=> d!106477 (= lt!377679 lt!377678)))

(declare-fun lt!377677 () Unit!28446)

(declare-fun e!464273 () Unit!28446)

(assert (=> d!106477 (= lt!377677 e!464273)))

(declare-fun c!90538 () Bool)

(assert (=> d!106477 (= c!90538 lt!377678)))

(assert (=> d!106477 (= lt!377678 (containsKey!401 (toList!4466 lt!377245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106477 (= (contains!4187 lt!377245 #b0000000000000000000000000000000000000000000000000000000000000000) lt!377679)))

(declare-fun b!832436 () Bool)

(declare-fun lt!377680 () Unit!28446)

(assert (=> b!832436 (= e!464273 lt!377680)))

(assert (=> b!832436 (= lt!377680 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832436 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377245) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832437 () Bool)

(declare-fun Unit!28500 () Unit!28446)

(assert (=> b!832437 (= e!464273 Unit!28500)))

(declare-fun b!832438 () Bool)

(assert (=> b!832438 (= e!464274 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377245) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106477 c!90538) b!832436))

(assert (= (and d!106477 (not c!90538)) b!832437))

(assert (= (and d!106477 (not res!566314)) b!832438))

(declare-fun m!776643 () Bool)

(assert (=> d!106477 m!776643))

(declare-fun m!776645 () Bool)

(assert (=> b!832436 m!776645))

(declare-fun m!776647 () Bool)

(assert (=> b!832436 m!776647))

(assert (=> b!832436 m!776647))

(declare-fun m!776649 () Bool)

(assert (=> b!832436 m!776649))

(assert (=> b!832438 m!776647))

(assert (=> b!832438 m!776647))

(assert (=> b!832438 m!776649))

(assert (=> d!105699 d!106477))

(assert (=> d!105699 d!105667))

(declare-fun d!106479 () Bool)

(assert (=> d!106479 (= ($colon$colon!533 e!463761 (ite c!90276 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012))) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010)))) (Cons!15842 (ite c!90276 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377012))) (tuple2!10077 (_1!5049 lt!377010) (_2!5049 lt!377010))) e!463761))))

(assert (=> bm!36326 d!106479))

(declare-fun d!106481 () Bool)

(declare-fun lt!377681 () Bool)

(assert (=> d!106481 (= lt!377681 (select (content!386 (toList!4466 lt!377416)) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun e!464276 () Bool)

(assert (=> d!106481 (= lt!377681 e!464276)))

(declare-fun res!566315 () Bool)

(assert (=> d!106481 (=> (not res!566315) (not e!464276))))

(assert (=> d!106481 (= res!566315 ((_ is Cons!15842) (toList!4466 lt!377416)))))

(assert (=> d!106481 (= (contains!4188 (toList!4466 lt!377416) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!377681)))

(declare-fun b!832439 () Bool)

(declare-fun e!464275 () Bool)

(assert (=> b!832439 (= e!464276 e!464275)))

(declare-fun res!566316 () Bool)

(assert (=> b!832439 (=> res!566316 e!464275)))

(assert (=> b!832439 (= res!566316 (= (h!16977 (toList!4466 lt!377416)) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!832440 () Bool)

(assert (=> b!832440 (= e!464275 (contains!4188 (t!22203 (toList!4466 lt!377416)) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!106481 res!566315) b!832439))

(assert (= (and b!832439 (not res!566316)) b!832440))

(declare-fun m!776651 () Bool)

(assert (=> d!106481 m!776651))

(declare-fun m!776653 () Bool)

(assert (=> d!106481 m!776653))

(declare-fun m!776655 () Bool)

(assert (=> b!832440 m!776655))

(assert (=> b!831592 d!106481))

(declare-fun d!106483 () Bool)

(assert (=> d!106483 (isDefined!311 (getValueByKey!416 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))

(declare-fun lt!377682 () Unit!28446)

(assert (=> d!106483 (= lt!377682 (choose!1427 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))

(declare-fun e!464277 () Bool)

(assert (=> d!106483 e!464277))

(declare-fun res!566317 () Bool)

(assert (=> d!106483 (=> (not res!566317) (not e!464277))))

(assert (=> d!106483 (= res!566317 (isStrictlySorted!429 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))))))

(assert (=> d!106483 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089) lt!377682)))

(declare-fun b!832441 () Bool)

(assert (=> b!832441 (= e!464277 (containsKey!401 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089))))

(assert (= (and d!106483 res!566317) b!832441))

(assert (=> d!106483 m!775357))

(assert (=> d!106483 m!775357))

(assert (=> d!106483 m!775359))

(declare-fun m!776657 () Bool)

(assert (=> d!106483 m!776657))

(declare-fun m!776659 () Bool)

(assert (=> d!106483 m!776659))

(assert (=> b!832441 m!775353))

(assert (=> b!831553 d!106483))

(assert (=> b!831553 d!105931))

(assert (=> b!831553 d!105933))

(assert (=> b!831588 d!106323))

(assert (=> b!831588 d!106325))

(declare-fun b!832443 () Bool)

(declare-fun e!464278 () Option!422)

(declare-fun e!464279 () Option!422)

(assert (=> b!832443 (= e!464278 e!464279)))

(declare-fun c!90540 () Bool)

(assert (=> b!832443 (= c!90540 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377112))) (not (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377112)))) (_1!5049 lt!377012)))))))

(declare-fun b!832444 () Bool)

(assert (=> b!832444 (= e!464279 (getValueByKey!416 (t!22203 (t!22203 (toList!4466 lt!377112))) (_1!5049 lt!377012)))))

(declare-fun d!106485 () Bool)

(declare-fun c!90539 () Bool)

(assert (=> d!106485 (= c!90539 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377112))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377112)))) (_1!5049 lt!377012))))))

(assert (=> d!106485 (= (getValueByKey!416 (t!22203 (toList!4466 lt!377112)) (_1!5049 lt!377012)) e!464278)))

(declare-fun b!832442 () Bool)

(assert (=> b!832442 (= e!464278 (Some!421 (_2!5049 (h!16977 (t!22203 (toList!4466 lt!377112))))))))

(declare-fun b!832445 () Bool)

(assert (=> b!832445 (= e!464279 None!420)))

(assert (= (and d!106485 c!90539) b!832442))

(assert (= (and d!106485 (not c!90539)) b!832443))

(assert (= (and b!832443 c!90540) b!832444))

(assert (= (and b!832443 (not c!90540)) b!832445))

(declare-fun m!776661 () Bool)

(assert (=> b!832444 m!776661))

(assert (=> b!831656 d!106485))

(declare-fun d!106487 () Bool)

(declare-fun res!566318 () Bool)

(declare-fun e!464280 () Bool)

(assert (=> d!106487 (=> res!566318 e!464280)))

(assert (=> d!106487 (= res!566318 (and ((_ is Cons!15842) (toList!4466 lt!377202)) (= (_1!5049 (h!16977 (toList!4466 lt!377202))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(assert (=> d!106487 (= (containsKey!401 (toList!4466 lt!377202) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) e!464280)))

(declare-fun b!832446 () Bool)

(declare-fun e!464281 () Bool)

(assert (=> b!832446 (= e!464280 e!464281)))

(declare-fun res!566319 () Bool)

(assert (=> b!832446 (=> (not res!566319) (not e!464281))))

(assert (=> b!832446 (= res!566319 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377202))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377202))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))) ((_ is Cons!15842) (toList!4466 lt!377202)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377202))) (select (arr!22325 _keys!976) #b00000000000000000000000000000000))))))

(declare-fun b!832447 () Bool)

(assert (=> b!832447 (= e!464281 (containsKey!401 (t!22203 (toList!4466 lt!377202)) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106487 (not res!566318)) b!832446))

(assert (= (and b!832446 res!566319) b!832447))

(assert (=> b!832447 m!774611))

(declare-fun m!776663 () Bool)

(assert (=> b!832447 m!776663))

(assert (=> d!105761 d!106487))

(declare-fun lt!377683 () Bool)

(declare-fun d!106489 () Bool)

(assert (=> d!106489 (= lt!377683 (select (content!386 (toList!4466 lt!377404)) (tuple2!10077 lt!377093 lt!377098)))))

(declare-fun e!464283 () Bool)

(assert (=> d!106489 (= lt!377683 e!464283)))

(declare-fun res!566320 () Bool)

(assert (=> d!106489 (=> (not res!566320) (not e!464283))))

(assert (=> d!106489 (= res!566320 ((_ is Cons!15842) (toList!4466 lt!377404)))))

(assert (=> d!106489 (= (contains!4188 (toList!4466 lt!377404) (tuple2!10077 lt!377093 lt!377098)) lt!377683)))

(declare-fun b!832448 () Bool)

(declare-fun e!464282 () Bool)

(assert (=> b!832448 (= e!464283 e!464282)))

(declare-fun res!566321 () Bool)

(assert (=> b!832448 (=> res!566321 e!464282)))

(assert (=> b!832448 (= res!566321 (= (h!16977 (toList!4466 lt!377404)) (tuple2!10077 lt!377093 lt!377098)))))

(declare-fun b!832449 () Bool)

(assert (=> b!832449 (= e!464282 (contains!4188 (t!22203 (toList!4466 lt!377404)) (tuple2!10077 lt!377093 lt!377098)))))

(assert (= (and d!106489 res!566320) b!832448))

(assert (= (and b!832448 (not res!566321)) b!832449))

(declare-fun m!776665 () Bool)

(assert (=> d!106489 m!776665))

(declare-fun m!776667 () Bool)

(assert (=> d!106489 m!776667))

(declare-fun m!776669 () Bool)

(assert (=> b!832449 m!776669))

(assert (=> b!831585 d!106489))

(declare-fun d!106491 () Bool)

(declare-fun res!566322 () Bool)

(declare-fun e!464284 () Bool)

(assert (=> d!106491 (=> res!566322 e!464284)))

(assert (=> d!106491 (= res!566322 (and ((_ is Cons!15842) lt!377218) (= (_1!5049 (h!16977 lt!377218)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106491 (= (containsKey!401 lt!377218 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464284)))

(declare-fun b!832450 () Bool)

(declare-fun e!464285 () Bool)

(assert (=> b!832450 (= e!464284 e!464285)))

(declare-fun res!566323 () Bool)

(assert (=> b!832450 (=> (not res!566323) (not e!464285))))

(assert (=> b!832450 (= res!566323 (and (or (not ((_ is Cons!15842) lt!377218)) (bvsle (_1!5049 (h!16977 lt!377218)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Cons!15842) lt!377218) (bvslt (_1!5049 (h!16977 lt!377218)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!832451 () Bool)

(assert (=> b!832451 (= e!464285 (containsKey!401 (t!22203 lt!377218) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and d!106491 (not res!566322)) b!832450))

(assert (= (and b!832450 res!566323) b!832451))

(declare-fun m!776671 () Bool)

(assert (=> b!832451 m!776671))

(assert (=> b!831530 d!106491))

(declare-fun lt!377684 () Bool)

(declare-fun d!106493 () Bool)

(assert (=> d!106493 (= lt!377684 (select (content!386 (toList!4466 lt!377303)) (tuple2!10077 lt!377195 minValue!754)))))

(declare-fun e!464287 () Bool)

(assert (=> d!106493 (= lt!377684 e!464287)))

(declare-fun res!566324 () Bool)

(assert (=> d!106493 (=> (not res!566324) (not e!464287))))

(assert (=> d!106493 (= res!566324 ((_ is Cons!15842) (toList!4466 lt!377303)))))

(assert (=> d!106493 (= (contains!4188 (toList!4466 lt!377303) (tuple2!10077 lt!377195 minValue!754)) lt!377684)))

(declare-fun b!832452 () Bool)

(declare-fun e!464286 () Bool)

(assert (=> b!832452 (= e!464287 e!464286)))

(declare-fun res!566325 () Bool)

(assert (=> b!832452 (=> res!566325 e!464286)))

(assert (=> b!832452 (= res!566325 (= (h!16977 (toList!4466 lt!377303)) (tuple2!10077 lt!377195 minValue!754)))))

(declare-fun b!832453 () Bool)

(assert (=> b!832453 (= e!464286 (contains!4188 (t!22203 (toList!4466 lt!377303)) (tuple2!10077 lt!377195 minValue!754)))))

(assert (= (and d!106493 res!566324) b!832452))

(assert (= (and b!832452 (not res!566325)) b!832453))

(declare-fun m!776673 () Bool)

(assert (=> d!106493 m!776673))

(declare-fun m!776675 () Bool)

(assert (=> d!106493 m!776675))

(declare-fun m!776677 () Bool)

(assert (=> b!832453 m!776677))

(assert (=> b!831461 d!106493))

(assert (=> bm!36304 d!106087))

(declare-fun d!106495 () Bool)

(declare-fun res!566326 () Bool)

(declare-fun e!464288 () Bool)

(assert (=> d!106495 (=> res!566326 e!464288)))

(assert (=> d!106495 (= res!566326 (or ((_ is Nil!15843) lt!377400) ((_ is Nil!15843) (t!22203 lt!377400))))))

(assert (=> d!106495 (= (isStrictlySorted!429 lt!377400) e!464288)))

(declare-fun b!832454 () Bool)

(declare-fun e!464289 () Bool)

(assert (=> b!832454 (= e!464288 e!464289)))

(declare-fun res!566327 () Bool)

(assert (=> b!832454 (=> (not res!566327) (not e!464289))))

(assert (=> b!832454 (= res!566327 (bvslt (_1!5049 (h!16977 lt!377400)) (_1!5049 (h!16977 (t!22203 lt!377400)))))))

(declare-fun b!832455 () Bool)

(assert (=> b!832455 (= e!464289 (isStrictlySorted!429 (t!22203 lt!377400)))))

(assert (= (and d!106495 (not res!566326)) b!832454))

(assert (= (and b!832454 res!566327) b!832455))

(declare-fun m!776679 () Bool)

(assert (=> b!832455 m!776679))

(assert (=> d!105849 d!106495))

(declare-fun d!106497 () Bool)

(declare-fun res!566328 () Bool)

(declare-fun e!464290 () Bool)

(assert (=> d!106497 (=> res!566328 e!464290)))

(assert (=> d!106497 (= res!566328 (or ((_ is Nil!15843) (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) ((_ is Nil!15843) (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))))

(assert (=> d!106497 (= (isStrictlySorted!429 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!464290)))

(declare-fun b!832456 () Bool)

(declare-fun e!464291 () Bool)

(assert (=> b!832456 (= e!464290 e!464291)))

(declare-fun res!566329 () Bool)

(assert (=> b!832456 (=> (not res!566329) (not e!464291))))

(assert (=> b!832456 (= res!566329 (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))))

(declare-fun b!832457 () Bool)

(assert (=> b!832457 (= e!464291 (isStrictlySorted!429 (t!22203 (toList!4466 (+!1988 lt!377013 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(assert (= (and d!106497 (not res!566328)) b!832456))

(assert (= (and b!832456 res!566329) b!832457))

(assert (=> b!832457 m!776417))

(assert (=> d!105849 d!106497))

(declare-fun d!106499 () Bool)

(declare-fun e!464293 () Bool)

(assert (=> d!106499 e!464293))

(declare-fun res!566330 () Bool)

(assert (=> d!106499 (=> res!566330 e!464293)))

(declare-fun lt!377687 () Bool)

(assert (=> d!106499 (= res!566330 (not lt!377687))))

(declare-fun lt!377686 () Bool)

(assert (=> d!106499 (= lt!377687 lt!377686)))

(declare-fun lt!377685 () Unit!28446)

(declare-fun e!464292 () Unit!28446)

(assert (=> d!106499 (= lt!377685 e!464292)))

(declare-fun c!90541 () Bool)

(assert (=> d!106499 (= c!90541 lt!377686)))

(assert (=> d!106499 (= lt!377686 (containsKey!401 (toList!4466 lt!377245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!106499 (= (contains!4187 lt!377245 #b1000000000000000000000000000000000000000000000000000000000000000) lt!377687)))

(declare-fun b!832458 () Bool)

(declare-fun lt!377688 () Unit!28446)

(assert (=> b!832458 (= e!464292 lt!377688)))

(assert (=> b!832458 (= lt!377688 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832458 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377245) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!832459 () Bool)

(declare-fun Unit!28501 () Unit!28446)

(assert (=> b!832459 (= e!464292 Unit!28501)))

(declare-fun b!832460 () Bool)

(assert (=> b!832460 (= e!464293 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!106499 c!90541) b!832458))

(assert (= (and d!106499 (not c!90541)) b!832459))

(assert (= (and d!106499 (not res!566330)) b!832460))

(declare-fun m!776681 () Bool)

(assert (=> d!106499 m!776681))

(declare-fun m!776683 () Bool)

(assert (=> b!832458 m!776683))

(declare-fun m!776685 () Bool)

(assert (=> b!832458 m!776685))

(assert (=> b!832458 m!776685))

(declare-fun m!776687 () Bool)

(assert (=> b!832458 m!776687))

(assert (=> b!832460 m!776685))

(assert (=> b!832460 m!776685))

(assert (=> b!832460 m!776687))

(assert (=> b!831348 d!106499))

(declare-fun d!106501 () Bool)

(declare-fun c!90542 () Bool)

(assert (=> d!106501 (= c!90542 ((_ is Nil!15843) (toList!4466 lt!377116)))))

(declare-fun e!464294 () (InoxSet tuple2!10076))

(assert (=> d!106501 (= (content!386 (toList!4466 lt!377116)) e!464294)))

(declare-fun b!832461 () Bool)

(assert (=> b!832461 (= e!464294 ((as const (Array tuple2!10076 Bool)) false))))

(declare-fun b!832462 () Bool)

(assert (=> b!832462 (= e!464294 ((_ map or) (store ((as const (Array tuple2!10076 Bool)) false) (h!16977 (toList!4466 lt!377116)) true) (content!386 (t!22203 (toList!4466 lt!377116)))))))

(assert (= (and d!106501 c!90542) b!832461))

(assert (= (and d!106501 (not c!90542)) b!832462))

(declare-fun m!776689 () Bool)

(assert (=> b!832462 m!776689))

(declare-fun m!776691 () Bool)

(assert (=> b!832462 m!776691))

(assert (=> d!105851 d!106501))

(assert (=> d!105793 d!105801))

(assert (=> d!105793 d!105809))

(declare-fun d!106503 () Bool)

(assert (=> d!106503 (contains!4187 (+!1988 lt!377168 (tuple2!10077 lt!377167 zeroValueBefore!34)) lt!377176)))

(assert (=> d!106503 true))

(declare-fun _$35!424 () Unit!28446)

(assert (=> d!106503 (= (choose!1425 lt!377168 lt!377167 zeroValueBefore!34 lt!377176) _$35!424)))

(declare-fun bs!23264 () Bool)

(assert (= bs!23264 d!106503))

(assert (=> bs!23264 m!774747))

(assert (=> bs!23264 m!774747))

(assert (=> bs!23264 m!774749))

(assert (=> d!105793 d!106503))

(declare-fun d!106505 () Bool)

(declare-fun e!464296 () Bool)

(assert (=> d!106505 e!464296))

(declare-fun res!566331 () Bool)

(assert (=> d!106505 (=> res!566331 e!464296)))

(declare-fun lt!377691 () Bool)

(assert (=> d!106505 (= res!566331 (not lt!377691))))

(declare-fun lt!377690 () Bool)

(assert (=> d!106505 (= lt!377691 lt!377690)))

(declare-fun lt!377689 () Unit!28446)

(declare-fun e!464295 () Unit!28446)

(assert (=> d!106505 (= lt!377689 e!464295)))

(declare-fun c!90543 () Bool)

(assert (=> d!106505 (= c!90543 lt!377690)))

(assert (=> d!106505 (= lt!377690 (containsKey!401 (toList!4466 lt!377168) lt!377176))))

(assert (=> d!106505 (= (contains!4187 lt!377168 lt!377176) lt!377691)))

(declare-fun b!832464 () Bool)

(declare-fun lt!377692 () Unit!28446)

(assert (=> b!832464 (= e!464295 lt!377692)))

(assert (=> b!832464 (= lt!377692 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377168) lt!377176))))

(assert (=> b!832464 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377168) lt!377176))))

(declare-fun b!832465 () Bool)

(declare-fun Unit!28502 () Unit!28446)

(assert (=> b!832465 (= e!464295 Unit!28502)))

(declare-fun b!832466 () Bool)

(assert (=> b!832466 (= e!464296 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377168) lt!377176)))))

(assert (= (and d!106505 c!90543) b!832464))

(assert (= (and d!106505 (not c!90543)) b!832465))

(assert (= (and d!106505 (not res!566331)) b!832466))

(declare-fun m!776693 () Bool)

(assert (=> d!106505 m!776693))

(declare-fun m!776695 () Bool)

(assert (=> b!832464 m!776695))

(declare-fun m!776697 () Bool)

(assert (=> b!832464 m!776697))

(assert (=> b!832464 m!776697))

(declare-fun m!776699 () Bool)

(assert (=> b!832464 m!776699))

(assert (=> b!832466 m!776697))

(assert (=> b!832466 m!776697))

(assert (=> b!832466 m!776699))

(assert (=> d!105793 d!106505))

(declare-fun d!106507 () Bool)

(declare-fun e!464298 () Bool)

(assert (=> d!106507 e!464298))

(declare-fun res!566332 () Bool)

(assert (=> d!106507 (=> res!566332 e!464298)))

(declare-fun lt!377695 () Bool)

(assert (=> d!106507 (= res!566332 (not lt!377695))))

(declare-fun lt!377694 () Bool)

(assert (=> d!106507 (= lt!377695 lt!377694)))

(declare-fun lt!377693 () Unit!28446)

(declare-fun e!464297 () Unit!28446)

(assert (=> d!106507 (= lt!377693 e!464297)))

(declare-fun c!90544 () Bool)

(assert (=> d!106507 (= c!90544 lt!377694)))

(assert (=> d!106507 (= lt!377694 (containsKey!401 (toList!4466 lt!377360) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(assert (=> d!106507 (= (contains!4187 lt!377360 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377695)))

(declare-fun b!832467 () Bool)

(declare-fun lt!377696 () Unit!28446)

(assert (=> b!832467 (= e!464297 lt!377696)))

(assert (=> b!832467 (= lt!377696 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377360) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(assert (=> b!832467 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377360) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun b!832468 () Bool)

(declare-fun Unit!28503 () Unit!28446)

(assert (=> b!832468 (= e!464297 Unit!28503)))

(declare-fun b!832469 () Bool)

(assert (=> b!832469 (= e!464298 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377360) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(assert (= (and d!106507 c!90544) b!832467))

(assert (= (and d!106507 (not c!90544)) b!832468))

(assert (= (and d!106507 (not res!566332)) b!832469))

(declare-fun m!776701 () Bool)

(assert (=> d!106507 m!776701))

(declare-fun m!776703 () Bool)

(assert (=> b!832467 m!776703))

(assert (=> b!832467 m!775265))

(assert (=> b!832467 m!775265))

(declare-fun m!776705 () Bool)

(assert (=> b!832467 m!776705))

(assert (=> b!832469 m!775265))

(assert (=> b!832469 m!775265))

(assert (=> b!832469 m!776705))

(assert (=> d!105813 d!106507))

(declare-fun b!832471 () Bool)

(declare-fun e!464299 () Option!422)

(declare-fun e!464300 () Option!422)

(assert (=> b!832471 (= e!464299 e!464300)))

(declare-fun c!90546 () Bool)

(assert (=> b!832471 (= c!90546 (and ((_ is Cons!15842) lt!377362) (not (= (_1!5049 (h!16977 lt!377362)) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))))

(declare-fun b!832472 () Bool)

(assert (=> b!832472 (= e!464300 (getValueByKey!416 (t!22203 lt!377362) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun d!106509 () Bool)

(declare-fun c!90545 () Bool)

(assert (=> d!106509 (= c!90545 (and ((_ is Cons!15842) lt!377362) (= (_1!5049 (h!16977 lt!377362)) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(assert (=> d!106509 (= (getValueByKey!416 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) e!464299)))

(declare-fun b!832470 () Bool)

(assert (=> b!832470 (= e!464299 (Some!421 (_2!5049 (h!16977 lt!377362))))))

(declare-fun b!832473 () Bool)

(assert (=> b!832473 (= e!464300 None!420)))

(assert (= (and d!106509 c!90545) b!832470))

(assert (= (and d!106509 (not c!90545)) b!832471))

(assert (= (and b!832471 c!90546) b!832472))

(assert (= (and b!832471 (not c!90546)) b!832473))

(declare-fun m!776707 () Bool)

(assert (=> b!832472 m!776707))

(assert (=> d!105813 d!106509))

(declare-fun d!106511 () Bool)

(assert (=> d!106511 (= (getValueByKey!416 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) (Some!421 (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun lt!377697 () Unit!28446)

(assert (=> d!106511 (= lt!377697 (choose!1423 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun e!464301 () Bool)

(assert (=> d!106511 e!464301))

(declare-fun res!566333 () Bool)

(assert (=> d!106511 (=> (not res!566333) (not e!464301))))

(assert (=> d!106511 (= res!566333 (isStrictlySorted!429 lt!377362))))

(assert (=> d!106511 (= (lemmaContainsTupThenGetReturnValue!230 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377697)))

(declare-fun b!832474 () Bool)

(declare-fun res!566334 () Bool)

(assert (=> b!832474 (=> (not res!566334) (not e!464301))))

(assert (=> b!832474 (= res!566334 (containsKey!401 lt!377362 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun b!832475 () Bool)

(assert (=> b!832475 (= e!464301 (contains!4188 lt!377362 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(assert (= (and d!106511 res!566333) b!832474))

(assert (= (and b!832474 res!566334) b!832475))

(assert (=> d!106511 m!775259))

(declare-fun m!776709 () Bool)

(assert (=> d!106511 m!776709))

(declare-fun m!776711 () Bool)

(assert (=> d!106511 m!776711))

(declare-fun m!776713 () Bool)

(assert (=> b!832474 m!776713))

(declare-fun m!776715 () Bool)

(assert (=> b!832475 m!776715))

(assert (=> d!105813 d!106511))

(declare-fun bm!36386 () Bool)

(declare-fun call!36389 () List!15846)

(declare-fun call!36390 () List!15846)

(assert (=> bm!36386 (= call!36389 call!36390)))

(declare-fun bm!36387 () Bool)

(declare-fun call!36391 () List!15846)

(assert (=> bm!36387 (= call!36390 call!36391)))

(declare-fun d!106513 () Bool)

(declare-fun e!464304 () Bool)

(assert (=> d!106513 e!464304))

(declare-fun res!566336 () Bool)

(assert (=> d!106513 (=> (not res!566336) (not e!464304))))

(declare-fun lt!377698 () List!15846)

(assert (=> d!106513 (= res!566336 (isStrictlySorted!429 lt!377698))))

(declare-fun e!464305 () List!15846)

(assert (=> d!106513 (= lt!377698 e!464305)))

(declare-fun c!90548 () Bool)

(assert (=> d!106513 (= c!90548 (and ((_ is Cons!15842) (toList!4466 lt!377170)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377170))) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(assert (=> d!106513 (isStrictlySorted!429 (toList!4466 lt!377170))))

(assert (=> d!106513 (= (insertStrictlySorted!269 (toList!4466 lt!377170) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) lt!377698)))

(declare-fun e!464306 () List!15846)

(declare-fun c!90550 () Bool)

(declare-fun b!832476 () Bool)

(declare-fun c!90549 () Bool)

(assert (=> b!832476 (= e!464306 (ite c!90550 (t!22203 (toList!4466 lt!377170)) (ite c!90549 (Cons!15842 (h!16977 (toList!4466 lt!377170)) (t!22203 (toList!4466 lt!377170))) Nil!15843)))))

(declare-fun b!832477 () Bool)

(declare-fun e!464303 () List!15846)

(assert (=> b!832477 (= e!464303 call!36389)))

(declare-fun b!832478 () Bool)

(assert (=> b!832478 (= e!464303 call!36389)))

(declare-fun b!832479 () Bool)

(declare-fun e!464302 () List!15846)

(assert (=> b!832479 (= e!464302 call!36390)))

(declare-fun bm!36388 () Bool)

(assert (=> bm!36388 (= call!36391 ($colon$colon!533 e!464306 (ite c!90548 (h!16977 (toList!4466 lt!377170)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))))

(declare-fun c!90547 () Bool)

(assert (=> bm!36388 (= c!90547 c!90548)))

(declare-fun b!832480 () Bool)

(assert (=> b!832480 (= e!464306 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377170)) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun b!832481 () Bool)

(declare-fun res!566335 () Bool)

(assert (=> b!832481 (=> (not res!566335) (not e!464304))))

(assert (=> b!832481 (= res!566335 (containsKey!401 lt!377698 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun b!832482 () Bool)

(assert (=> b!832482 (= e!464305 e!464302)))

(assert (=> b!832482 (= c!90550 (and ((_ is Cons!15842) (toList!4466 lt!377170)) (= (_1!5049 (h!16977 (toList!4466 lt!377170))) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(declare-fun b!832483 () Bool)

(assert (=> b!832483 (= e!464304 (contains!4188 lt!377698 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)) (_2!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(declare-fun b!832484 () Bool)

(assert (=> b!832484 (= e!464305 call!36391)))

(declare-fun b!832485 () Bool)

(assert (=> b!832485 (= c!90549 (and ((_ is Cons!15842) (toList!4466 lt!377170)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377170))) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(assert (=> b!832485 (= e!464302 e!464303)))

(assert (= (and d!106513 c!90548) b!832484))

(assert (= (and d!106513 (not c!90548)) b!832482))

(assert (= (and b!832482 c!90550) b!832479))

(assert (= (and b!832482 (not c!90550)) b!832485))

(assert (= (and b!832485 c!90549) b!832477))

(assert (= (and b!832485 (not c!90549)) b!832478))

(assert (= (or b!832477 b!832478) bm!36386))

(assert (= (or b!832479 bm!36386) bm!36387))

(assert (= (or b!832484 bm!36387) bm!36388))

(assert (= (and bm!36388 c!90547) b!832480))

(assert (= (and bm!36388 (not c!90547)) b!832476))

(assert (= (and d!106513 res!566336) b!832481))

(assert (= (and b!832481 res!566335) b!832483))

(declare-fun m!776717 () Bool)

(assert (=> d!106513 m!776717))

(declare-fun m!776719 () Bool)

(assert (=> d!106513 m!776719))

(declare-fun m!776721 () Bool)

(assert (=> bm!36388 m!776721))

(declare-fun m!776723 () Bool)

(assert (=> b!832480 m!776723))

(declare-fun m!776725 () Bool)

(assert (=> b!832481 m!776725))

(declare-fun m!776727 () Bool)

(assert (=> b!832483 m!776727))

(assert (=> d!105813 d!106513))

(declare-fun d!106515 () Bool)

(declare-fun res!566337 () Bool)

(declare-fun e!464307 () Bool)

(assert (=> d!106515 (=> res!566337 e!464307)))

(assert (=> d!106515 (= res!566337 (or ((_ is Nil!15843) lt!377434) ((_ is Nil!15843) (t!22203 lt!377434))))))

(assert (=> d!106515 (= (isStrictlySorted!429 lt!377434) e!464307)))

(declare-fun b!832486 () Bool)

(declare-fun e!464308 () Bool)

(assert (=> b!832486 (= e!464307 e!464308)))

(declare-fun res!566338 () Bool)

(assert (=> b!832486 (=> (not res!566338) (not e!464308))))

(assert (=> b!832486 (= res!566338 (bvslt (_1!5049 (h!16977 lt!377434)) (_1!5049 (h!16977 (t!22203 lt!377434)))))))

(declare-fun b!832487 () Bool)

(assert (=> b!832487 (= e!464308 (isStrictlySorted!429 (t!22203 lt!377434)))))

(assert (= (and d!106515 (not res!566337)) b!832486))

(assert (= (and b!832486 res!566338) b!832487))

(declare-fun m!776729 () Bool)

(assert (=> b!832487 m!776729))

(assert (=> d!105891 d!106515))

(declare-fun d!106517 () Bool)

(declare-fun res!566339 () Bool)

(declare-fun e!464309 () Bool)

(assert (=> d!106517 (=> res!566339 e!464309)))

(assert (=> d!106517 (= res!566339 (or ((_ is Nil!15843) (toList!4466 (+!1988 lt!377014 lt!377010))) ((_ is Nil!15843) (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010))))))))

(assert (=> d!106517 (= (isStrictlySorted!429 (toList!4466 (+!1988 lt!377014 lt!377010))) e!464309)))

(declare-fun b!832488 () Bool)

(declare-fun e!464310 () Bool)

(assert (=> b!832488 (= e!464309 e!464310)))

(declare-fun res!566340 () Bool)

(assert (=> b!832488 (=> (not res!566340) (not e!464310))))

(assert (=> b!832488 (= res!566340 (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377014 lt!377010)))) (_1!5049 (h!16977 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))))))))

(declare-fun b!832489 () Bool)

(assert (=> b!832489 (= e!464310 (isStrictlySorted!429 (t!22203 (toList!4466 (+!1988 lt!377014 lt!377010)))))))

(assert (= (and d!106517 (not res!566339)) b!832488))

(assert (= (and b!832488 res!566340) b!832489))

(assert (=> b!832489 m!776305))

(assert (=> d!105891 d!106517))

(declare-fun d!106519 () Bool)

(assert (=> d!106519 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!377699 () Unit!28446)

(assert (=> d!106519 (= lt!377699 (choose!1427 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!464311 () Bool)

(assert (=> d!106519 e!464311))

(declare-fun res!566341 () Bool)

(assert (=> d!106519 (=> (not res!566341) (not e!464311))))

(assert (=> d!106519 (= res!566341 (isStrictlySorted!429 (toList!4466 lt!377180)))))

(assert (=> d!106519 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000) lt!377699)))

(declare-fun b!832490 () Bool)

(assert (=> b!832490 (= e!464311 (containsKey!401 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106519 res!566341) b!832490))

(assert (=> d!106519 m!774845))

(assert (=> d!106519 m!774845))

(assert (=> d!106519 m!774847))

(declare-fun m!776731 () Bool)

(assert (=> d!106519 m!776731))

(assert (=> d!106519 m!776043))

(assert (=> b!832490 m!774841))

(assert (=> b!831320 d!106519))

(assert (=> b!831320 d!105955))

(assert (=> b!831320 d!105957))

(declare-fun d!106521 () Bool)

(declare-fun c!90551 () Bool)

(assert (=> d!106521 (= c!90551 ((_ is Nil!15843) (toList!4466 lt!377208)))))

(declare-fun e!464312 () (InoxSet tuple2!10076))

(assert (=> d!106521 (= (content!386 (toList!4466 lt!377208)) e!464312)))

(declare-fun b!832491 () Bool)

(assert (=> b!832491 (= e!464312 ((as const (Array tuple2!10076 Bool)) false))))

(declare-fun b!832492 () Bool)

(assert (=> b!832492 (= e!464312 ((_ map or) (store ((as const (Array tuple2!10076 Bool)) false) (h!16977 (toList!4466 lt!377208)) true) (content!386 (t!22203 (toList!4466 lt!377208)))))))

(assert (= (and d!106521 c!90551) b!832491))

(assert (= (and d!106521 (not c!90551)) b!832492))

(declare-fun m!776733 () Bool)

(assert (=> b!832492 m!776733))

(declare-fun m!776735 () Bool)

(assert (=> b!832492 m!776735))

(assert (=> d!105721 d!106521))

(declare-fun d!106523 () Bool)

(declare-fun res!566342 () Bool)

(declare-fun e!464313 () Bool)

(assert (=> d!106523 (=> res!566342 e!464313)))

(assert (=> d!106523 (= res!566342 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))))) lt!377089)))))

(assert (=> d!106523 (= (containsKey!401 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))) lt!377089) e!464313)))

(declare-fun b!832493 () Bool)

(declare-fun e!464314 () Bool)

(assert (=> b!832493 (= e!464313 e!464314)))

(declare-fun res!566343 () Bool)

(assert (=> b!832493 (=> (not res!566343) (not e!464314))))

(assert (=> b!832493 (= res!566343 (and (or (not ((_ is Cons!15842) (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))))) (bvsle (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))))) lt!377089)) ((_ is Cons!15842) (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))) (bvslt (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091))))) lt!377089)))))

(declare-fun b!832494 () Bool)

(assert (=> b!832494 (= e!464314 (containsKey!401 (t!22203 (toList!4466 (+!1988 lt!377090 (tuple2!10077 lt!377086 lt!377091)))) lt!377089))))

(assert (= (and d!106523 (not res!566342)) b!832493))

(assert (= (and b!832493 res!566343) b!832494))

(declare-fun m!776737 () Bool)

(assert (=> b!832494 m!776737))

(assert (=> d!105839 d!106523))

(declare-fun b!832496 () Bool)

(declare-fun e!464315 () Option!422)

(declare-fun e!464316 () Option!422)

(assert (=> b!832496 (= e!464315 e!464316)))

(declare-fun c!90553 () Bool)

(assert (=> b!832496 (= c!90553 (and ((_ is Cons!15842) (toList!4466 lt!377360)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377360))) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))))

(declare-fun b!832497 () Bool)

(assert (=> b!832497 (= e!464316 (getValueByKey!416 (t!22203 (toList!4466 lt!377360)) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))))))

(declare-fun d!106525 () Bool)

(declare-fun c!90552 () Bool)

(assert (=> d!106525 (= c!90552 (and ((_ is Cons!15842) (toList!4466 lt!377360)) (= (_1!5049 (h!16977 (toList!4466 lt!377360))) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34)))))))

(assert (=> d!106525 (= (getValueByKey!416 (toList!4466 lt!377360) (_1!5049 (tuple2!10077 lt!377178 zeroValueBefore!34))) e!464315)))

(declare-fun b!832495 () Bool)

(assert (=> b!832495 (= e!464315 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377360)))))))

(declare-fun b!832498 () Bool)

(assert (=> b!832498 (= e!464316 None!420)))

(assert (= (and d!106525 c!90552) b!832495))

(assert (= (and d!106525 (not c!90552)) b!832496))

(assert (= (and b!832496 c!90553) b!832497))

(assert (= (and b!832496 (not c!90553)) b!832498))

(declare-fun m!776739 () Bool)

(assert (=> b!832497 m!776739))

(assert (=> b!831519 d!106525))

(declare-fun d!106527 () Bool)

(declare-fun e!464318 () Bool)

(assert (=> d!106527 e!464318))

(declare-fun res!566344 () Bool)

(assert (=> d!106527 (=> res!566344 e!464318)))

(declare-fun lt!377702 () Bool)

(assert (=> d!106527 (= res!566344 (not lt!377702))))

(declare-fun lt!377701 () Bool)

(assert (=> d!106527 (= lt!377702 lt!377701)))

(declare-fun lt!377700 () Unit!28446)

(declare-fun e!464317 () Unit!28446)

(assert (=> d!106527 (= lt!377700 e!464317)))

(declare-fun c!90554 () Bool)

(assert (=> d!106527 (= c!90554 lt!377701)))

(assert (=> d!106527 (= lt!377701 (containsKey!401 (toList!4466 lt!377416) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!106527 (= (contains!4187 lt!377416 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377702)))

(declare-fun b!832499 () Bool)

(declare-fun lt!377703 () Unit!28446)

(assert (=> b!832499 (= e!464317 lt!377703)))

(assert (=> b!832499 (= lt!377703 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377416) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> b!832499 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377416) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832500 () Bool)

(declare-fun Unit!28504 () Unit!28446)

(assert (=> b!832500 (= e!464317 Unit!28504)))

(declare-fun b!832501 () Bool)

(assert (=> b!832501 (= e!464318 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377416) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106527 c!90554) b!832499))

(assert (= (and d!106527 (not c!90554)) b!832500))

(assert (= (and d!106527 (not res!566344)) b!832501))

(declare-fun m!776741 () Bool)

(assert (=> d!106527 m!776741))

(declare-fun m!776743 () Bool)

(assert (=> b!832499 m!776743))

(assert (=> b!832499 m!775445))

(assert (=> b!832499 m!775445))

(declare-fun m!776745 () Bool)

(assert (=> b!832499 m!776745))

(assert (=> b!832501 m!775445))

(assert (=> b!832501 m!775445))

(assert (=> b!832501 m!776745))

(assert (=> d!105861 d!106527))

(declare-fun b!832503 () Bool)

(declare-fun e!464319 () Option!422)

(declare-fun e!464320 () Option!422)

(assert (=> b!832503 (= e!464319 e!464320)))

(declare-fun c!90556 () Bool)

(assert (=> b!832503 (= c!90556 (and ((_ is Cons!15842) lt!377418) (not (= (_1!5049 (h!16977 lt!377418)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832504 () Bool)

(assert (=> b!832504 (= e!464320 (getValueByKey!416 (t!22203 lt!377418) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106529 () Bool)

(declare-fun c!90555 () Bool)

(assert (=> d!106529 (= c!90555 (and ((_ is Cons!15842) lt!377418) (= (_1!5049 (h!16977 lt!377418)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106529 (= (getValueByKey!416 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464319)))

(declare-fun b!832502 () Bool)

(assert (=> b!832502 (= e!464319 (Some!421 (_2!5049 (h!16977 lt!377418))))))

(declare-fun b!832505 () Bool)

(assert (=> b!832505 (= e!464320 None!420)))

(assert (= (and d!106529 c!90555) b!832502))

(assert (= (and d!106529 (not c!90555)) b!832503))

(assert (= (and b!832503 c!90556) b!832504))

(assert (= (and b!832503 (not c!90556)) b!832505))

(declare-fun m!776747 () Bool)

(assert (=> b!832504 m!776747))

(assert (=> d!105861 d!106529))

(declare-fun d!106531 () Bool)

(assert (=> d!106531 (= (getValueByKey!416 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!377704 () Unit!28446)

(assert (=> d!106531 (= lt!377704 (choose!1423 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464321 () Bool)

(assert (=> d!106531 e!464321))

(declare-fun res!566345 () Bool)

(assert (=> d!106531 (=> (not res!566345) (not e!464321))))

(assert (=> d!106531 (= res!566345 (isStrictlySorted!429 lt!377418))))

(assert (=> d!106531 (= (lemmaContainsTupThenGetReturnValue!230 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377704)))

(declare-fun b!832506 () Bool)

(declare-fun res!566346 () Bool)

(assert (=> b!832506 (=> (not res!566346) (not e!464321))))

(assert (=> b!832506 (= res!566346 (containsKey!401 lt!377418 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832507 () Bool)

(assert (=> b!832507 (= e!464321 (contains!4188 lt!377418 (tuple2!10077 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (= (and d!106531 res!566345) b!832506))

(assert (= (and b!832506 res!566346) b!832507))

(assert (=> d!106531 m!775439))

(declare-fun m!776749 () Bool)

(assert (=> d!106531 m!776749))

(declare-fun m!776751 () Bool)

(assert (=> d!106531 m!776751))

(declare-fun m!776753 () Bool)

(assert (=> b!832506 m!776753))

(declare-fun m!776755 () Bool)

(assert (=> b!832507 m!776755))

(assert (=> d!105861 d!106531))

(declare-fun bm!36389 () Bool)

(declare-fun call!36392 () List!15846)

(declare-fun call!36393 () List!15846)

(assert (=> bm!36389 (= call!36392 call!36393)))

(declare-fun bm!36390 () Bool)

(declare-fun call!36394 () List!15846)

(assert (=> bm!36390 (= call!36393 call!36394)))

(declare-fun d!106533 () Bool)

(declare-fun e!464324 () Bool)

(assert (=> d!106533 e!464324))

(declare-fun res!566348 () Bool)

(assert (=> d!106533 (=> (not res!566348) (not e!464324))))

(declare-fun lt!377705 () List!15846)

(assert (=> d!106533 (= res!566348 (isStrictlySorted!429 lt!377705))))

(declare-fun e!464325 () List!15846)

(assert (=> d!106533 (= lt!377705 e!464325)))

(declare-fun c!90558 () Bool)

(assert (=> d!106533 (= c!90558 (and ((_ is Cons!15842) (toList!4466 call!36298)) (bvslt (_1!5049 (h!16977 (toList!4466 call!36298))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106533 (isStrictlySorted!429 (toList!4466 call!36298))))

(assert (=> d!106533 (= (insertStrictlySorted!269 (toList!4466 call!36298) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377705)))

(declare-fun e!464326 () List!15846)

(declare-fun c!90560 () Bool)

(declare-fun c!90559 () Bool)

(declare-fun b!832508 () Bool)

(assert (=> b!832508 (= e!464326 (ite c!90560 (t!22203 (toList!4466 call!36298)) (ite c!90559 (Cons!15842 (h!16977 (toList!4466 call!36298)) (t!22203 (toList!4466 call!36298))) Nil!15843)))))

(declare-fun b!832509 () Bool)

(declare-fun e!464323 () List!15846)

(assert (=> b!832509 (= e!464323 call!36392)))

(declare-fun b!832510 () Bool)

(assert (=> b!832510 (= e!464323 call!36392)))

(declare-fun b!832511 () Bool)

(declare-fun e!464322 () List!15846)

(assert (=> b!832511 (= e!464322 call!36393)))

(declare-fun bm!36391 () Bool)

(assert (=> bm!36391 (= call!36394 ($colon$colon!533 e!464326 (ite c!90558 (h!16977 (toList!4466 call!36298)) (tuple2!10077 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun c!90557 () Bool)

(assert (=> bm!36391 (= c!90557 c!90558)))

(declare-fun b!832512 () Bool)

(assert (=> b!832512 (= e!464326 (insertStrictlySorted!269 (t!22203 (toList!4466 call!36298)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832513 () Bool)

(declare-fun res!566347 () Bool)

(assert (=> b!832513 (=> (not res!566347) (not e!464324))))

(assert (=> b!832513 (= res!566347 (containsKey!401 lt!377705 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832514 () Bool)

(assert (=> b!832514 (= e!464325 e!464322)))

(assert (=> b!832514 (= c!90560 (and ((_ is Cons!15842) (toList!4466 call!36298)) (= (_1!5049 (h!16977 (toList!4466 call!36298))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832515 () Bool)

(assert (=> b!832515 (= e!464324 (contains!4188 lt!377705 (tuple2!10077 (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!832516 () Bool)

(assert (=> b!832516 (= e!464325 call!36394)))

(declare-fun b!832517 () Bool)

(assert (=> b!832517 (= c!90559 (and ((_ is Cons!15842) (toList!4466 call!36298)) (bvsgt (_1!5049 (h!16977 (toList!4466 call!36298))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> b!832517 (= e!464322 e!464323)))

(assert (= (and d!106533 c!90558) b!832516))

(assert (= (and d!106533 (not c!90558)) b!832514))

(assert (= (and b!832514 c!90560) b!832511))

(assert (= (and b!832514 (not c!90560)) b!832517))

(assert (= (and b!832517 c!90559) b!832509))

(assert (= (and b!832517 (not c!90559)) b!832510))

(assert (= (or b!832509 b!832510) bm!36389))

(assert (= (or b!832511 bm!36389) bm!36390))

(assert (= (or b!832516 bm!36390) bm!36391))

(assert (= (and bm!36391 c!90557) b!832512))

(assert (= (and bm!36391 (not c!90557)) b!832508))

(assert (= (and d!106533 res!566348) b!832513))

(assert (= (and b!832513 res!566347) b!832515))

(declare-fun m!776757 () Bool)

(assert (=> d!106533 m!776757))

(declare-fun m!776759 () Bool)

(assert (=> d!106533 m!776759))

(declare-fun m!776761 () Bool)

(assert (=> bm!36391 m!776761))

(declare-fun m!776763 () Bool)

(assert (=> b!832512 m!776763))

(declare-fun m!776765 () Bool)

(assert (=> b!832513 m!776765))

(declare-fun m!776767 () Bool)

(assert (=> b!832515 m!776767))

(assert (=> d!105861 d!106533))

(declare-fun d!106535 () Bool)

(assert (=> d!106535 (arrayContainsKey!0 _keys!976 lt!377316 #b00000000000000000000000000000000)))

(declare-fun lt!377706 () Unit!28446)

(assert (=> d!106535 (= lt!377706 (choose!13 _keys!976 lt!377316 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!106535 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!106535 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!377316 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!377706)))

(declare-fun bs!23265 () Bool)

(assert (= bs!23265 d!106535))

(assert (=> bs!23265 m!775111))

(declare-fun m!776769 () Bool)

(assert (=> bs!23265 m!776769))

(assert (=> b!831471 d!106535))

(declare-fun d!106537 () Bool)

(declare-fun res!566349 () Bool)

(declare-fun e!464327 () Bool)

(assert (=> d!106537 (=> res!566349 e!464327)))

(assert (=> d!106537 (= res!566349 (= (select (arr!22325 _keys!976) #b00000000000000000000000000000000) lt!377316))))

(assert (=> d!106537 (= (arrayContainsKey!0 _keys!976 lt!377316 #b00000000000000000000000000000000) e!464327)))

(declare-fun b!832518 () Bool)

(declare-fun e!464328 () Bool)

(assert (=> b!832518 (= e!464327 e!464328)))

(declare-fun res!566350 () Bool)

(assert (=> b!832518 (=> (not res!566350) (not e!464328))))

(assert (=> b!832518 (= res!566350 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!22745 _keys!976)))))

(declare-fun b!832519 () Bool)

(assert (=> b!832519 (= e!464328 (arrayContainsKey!0 _keys!976 lt!377316 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!106537 (not res!566349)) b!832518))

(assert (= (and b!832518 res!566350) b!832519))

(assert (=> d!106537 m!774611))

(declare-fun m!776771 () Bool)

(assert (=> b!832519 m!776771))

(assert (=> b!831471 d!106537))

(declare-fun b!832520 () Bool)

(declare-fun e!464329 () SeekEntryResult!8695)

(assert (=> b!832520 (= e!464329 Undefined!8695)))

(declare-fun b!832521 () Bool)

(declare-fun e!464331 () SeekEntryResult!8695)

(assert (=> b!832521 (= e!464329 e!464331)))

(declare-fun lt!377707 () (_ BitVec 64))

(declare-fun lt!377709 () SeekEntryResult!8695)

(assert (=> b!832521 (= lt!377707 (select (arr!22325 _keys!976) (index!37153 lt!377709)))))

(declare-fun c!90561 () Bool)

(assert (=> b!832521 (= c!90561 (= lt!377707 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!106539 () Bool)

(declare-fun lt!377708 () SeekEntryResult!8695)

(assert (=> d!106539 (and (or ((_ is Undefined!8695) lt!377708) (not ((_ is Found!8695) lt!377708)) (and (bvsge (index!37152 lt!377708) #b00000000000000000000000000000000) (bvslt (index!37152 lt!377708) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377708) ((_ is Found!8695) lt!377708) (not ((_ is MissingZero!8695) lt!377708)) (and (bvsge (index!37151 lt!377708) #b00000000000000000000000000000000) (bvslt (index!37151 lt!377708) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377708) ((_ is Found!8695) lt!377708) ((_ is MissingZero!8695) lt!377708) (not ((_ is MissingVacant!8695) lt!377708)) (and (bvsge (index!37154 lt!377708) #b00000000000000000000000000000000) (bvslt (index!37154 lt!377708) (size!22745 _keys!976)))) (or ((_ is Undefined!8695) lt!377708) (ite ((_ is Found!8695) lt!377708) (= (select (arr!22325 _keys!976) (index!37152 lt!377708)) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!8695) lt!377708) (= (select (arr!22325 _keys!976) (index!37151 lt!377708)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8695) lt!377708) (= (select (arr!22325 _keys!976) (index!37154 lt!377708)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!106539 (= lt!377708 e!464329)))

(declare-fun c!90562 () Bool)

(assert (=> d!106539 (= c!90562 (and ((_ is Intermediate!8695) lt!377709) (undefined!9507 lt!377709)))))

(assert (=> d!106539 (= lt!377709 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!1312) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(assert (=> d!106539 (validMask!0 mask!1312)))

(assert (=> d!106539 (= (seekEntryOrOpen!0 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312) lt!377708)))

(declare-fun b!832522 () Bool)

(assert (=> b!832522 (= e!464331 (Found!8695 (index!37153 lt!377709)))))

(declare-fun b!832523 () Bool)

(declare-fun e!464330 () SeekEntryResult!8695)

(assert (=> b!832523 (= e!464330 (seekKeyOrZeroReturnVacant!0 (x!70074 lt!377709) (index!37153 lt!377709) (index!37153 lt!377709) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!976 mask!1312))))

(declare-fun b!832524 () Bool)

(assert (=> b!832524 (= e!464330 (MissingZero!8695 (index!37153 lt!377709)))))

(declare-fun b!832525 () Bool)

(declare-fun c!90563 () Bool)

(assert (=> b!832525 (= c!90563 (= lt!377707 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!832525 (= e!464331 e!464330)))

(assert (= (and d!106539 c!90562) b!832520))

(assert (= (and d!106539 (not c!90562)) b!832521))

(assert (= (and b!832521 c!90561) b!832522))

(assert (= (and b!832521 (not c!90561)) b!832525))

(assert (= (and b!832525 c!90563) b!832524))

(assert (= (and b!832525 (not c!90563)) b!832523))

(declare-fun m!776773 () Bool)

(assert (=> b!832521 m!776773))

(declare-fun m!776775 () Bool)

(assert (=> d!106539 m!776775))

(declare-fun m!776777 () Bool)

(assert (=> d!106539 m!776777))

(assert (=> d!106539 m!774867))

(declare-fun m!776779 () Bool)

(assert (=> d!106539 m!776779))

(assert (=> d!106539 m!774867))

(assert (=> d!106539 m!776777))

(declare-fun m!776781 () Bool)

(assert (=> d!106539 m!776781))

(assert (=> d!106539 m!774527))

(declare-fun m!776783 () Bool)

(assert (=> d!106539 m!776783))

(assert (=> b!832523 m!774867))

(declare-fun m!776785 () Bool)

(assert (=> b!832523 m!776785))

(assert (=> b!831471 d!106539))

(declare-fun d!106541 () Bool)

(declare-fun e!464333 () Bool)

(assert (=> d!106541 e!464333))

(declare-fun res!566351 () Bool)

(assert (=> d!106541 (=> res!566351 e!464333)))

(declare-fun lt!377712 () Bool)

(assert (=> d!106541 (= res!566351 (not lt!377712))))

(declare-fun lt!377711 () Bool)

(assert (=> d!106541 (= lt!377712 lt!377711)))

(declare-fun lt!377710 () Unit!28446)

(declare-fun e!464332 () Unit!28446)

(assert (=> d!106541 (= lt!377710 e!464332)))

(declare-fun c!90564 () Bool)

(assert (=> d!106541 (= c!90564 lt!377711)))

(assert (=> d!106541 (= lt!377711 (containsKey!401 (toList!4466 lt!377404) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(assert (=> d!106541 (= (contains!4187 lt!377404 (_1!5049 (tuple2!10077 lt!377093 lt!377098))) lt!377712)))

(declare-fun b!832526 () Bool)

(declare-fun lt!377713 () Unit!28446)

(assert (=> b!832526 (= e!464332 lt!377713)))

(assert (=> b!832526 (= lt!377713 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377404) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(assert (=> b!832526 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377404) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun b!832527 () Bool)

(declare-fun Unit!28505 () Unit!28446)

(assert (=> b!832527 (= e!464332 Unit!28505)))

(declare-fun b!832528 () Bool)

(assert (=> b!832528 (= e!464333 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377404) (_1!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (= (and d!106541 c!90564) b!832526))

(assert (= (and d!106541 (not c!90564)) b!832527))

(assert (= (and d!106541 (not res!566351)) b!832528))

(declare-fun m!776787 () Bool)

(assert (=> d!106541 m!776787))

(declare-fun m!776789 () Bool)

(assert (=> b!832526 m!776789))

(assert (=> b!832526 m!775413))

(assert (=> b!832526 m!775413))

(declare-fun m!776791 () Bool)

(assert (=> b!832526 m!776791))

(assert (=> b!832528 m!775413))

(assert (=> b!832528 m!775413))

(assert (=> b!832528 m!776791))

(assert (=> d!105855 d!106541))

(declare-fun b!832530 () Bool)

(declare-fun e!464334 () Option!422)

(declare-fun e!464335 () Option!422)

(assert (=> b!832530 (= e!464334 e!464335)))

(declare-fun c!90566 () Bool)

(assert (=> b!832530 (= c!90566 (and ((_ is Cons!15842) lt!377406) (not (= (_1!5049 (h!16977 lt!377406)) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))))

(declare-fun b!832531 () Bool)

(assert (=> b!832531 (= e!464335 (getValueByKey!416 (t!22203 lt!377406) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun c!90565 () Bool)

(declare-fun d!106543 () Bool)

(assert (=> d!106543 (= c!90565 (and ((_ is Cons!15842) lt!377406) (= (_1!5049 (h!16977 lt!377406)) (_1!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (=> d!106543 (= (getValueByKey!416 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098))) e!464334)))

(declare-fun b!832529 () Bool)

(assert (=> b!832529 (= e!464334 (Some!421 (_2!5049 (h!16977 lt!377406))))))

(declare-fun b!832532 () Bool)

(assert (=> b!832532 (= e!464335 None!420)))

(assert (= (and d!106543 c!90565) b!832529))

(assert (= (and d!106543 (not c!90565)) b!832530))

(assert (= (and b!832530 c!90566) b!832531))

(assert (= (and b!832530 (not c!90566)) b!832532))

(declare-fun m!776793 () Bool)

(assert (=> b!832531 m!776793))

(assert (=> d!105855 d!106543))

(declare-fun d!106545 () Bool)

(assert (=> d!106545 (= (getValueByKey!416 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098))) (Some!421 (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun lt!377714 () Unit!28446)

(assert (=> d!106545 (= lt!377714 (choose!1423 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun e!464336 () Bool)

(assert (=> d!106545 e!464336))

(declare-fun res!566352 () Bool)

(assert (=> d!106545 (=> (not res!566352) (not e!464336))))

(assert (=> d!106545 (= res!566352 (isStrictlySorted!429 lt!377406))))

(assert (=> d!106545 (= (lemmaContainsTupThenGetReturnValue!230 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))) lt!377714)))

(declare-fun b!832533 () Bool)

(declare-fun res!566353 () Bool)

(assert (=> b!832533 (=> (not res!566353) (not e!464336))))

(assert (=> b!832533 (= res!566353 (containsKey!401 lt!377406 (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun b!832534 () Bool)

(assert (=> b!832534 (= e!464336 (contains!4188 lt!377406 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (= (and d!106545 res!566352) b!832533))

(assert (= (and b!832533 res!566353) b!832534))

(assert (=> d!106545 m!775407))

(declare-fun m!776795 () Bool)

(assert (=> d!106545 m!776795))

(declare-fun m!776797 () Bool)

(assert (=> d!106545 m!776797))

(declare-fun m!776799 () Bool)

(assert (=> b!832533 m!776799))

(declare-fun m!776801 () Bool)

(assert (=> b!832534 m!776801))

(assert (=> d!105855 d!106545))

(declare-fun bm!36392 () Bool)

(declare-fun call!36395 () List!15846)

(declare-fun call!36396 () List!15846)

(assert (=> bm!36392 (= call!36395 call!36396)))

(declare-fun bm!36393 () Bool)

(declare-fun call!36397 () List!15846)

(assert (=> bm!36393 (= call!36396 call!36397)))

(declare-fun d!106547 () Bool)

(declare-fun e!464339 () Bool)

(assert (=> d!106547 e!464339))

(declare-fun res!566355 () Bool)

(assert (=> d!106547 (=> (not res!566355) (not e!464339))))

(declare-fun lt!377715 () List!15846)

(assert (=> d!106547 (= res!566355 (isStrictlySorted!429 lt!377715))))

(declare-fun e!464340 () List!15846)

(assert (=> d!106547 (= lt!377715 e!464340)))

(declare-fun c!90568 () Bool)

(assert (=> d!106547 (= c!90568 (and ((_ is Cons!15842) (toList!4466 lt!377097)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377097))) (_1!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (=> d!106547 (isStrictlySorted!429 (toList!4466 lt!377097))))

(assert (=> d!106547 (= (insertStrictlySorted!269 (toList!4466 lt!377097) (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))) lt!377715)))

(declare-fun e!464341 () List!15846)

(declare-fun c!90570 () Bool)

(declare-fun b!832535 () Bool)

(declare-fun c!90569 () Bool)

(assert (=> b!832535 (= e!464341 (ite c!90570 (t!22203 (toList!4466 lt!377097)) (ite c!90569 (Cons!15842 (h!16977 (toList!4466 lt!377097)) (t!22203 (toList!4466 lt!377097))) Nil!15843)))))

(declare-fun b!832536 () Bool)

(declare-fun e!464338 () List!15846)

(assert (=> b!832536 (= e!464338 call!36395)))

(declare-fun b!832537 () Bool)

(assert (=> b!832537 (= e!464338 call!36395)))

(declare-fun b!832538 () Bool)

(declare-fun e!464337 () List!15846)

(assert (=> b!832538 (= e!464337 call!36396)))

(declare-fun bm!36394 () Bool)

(assert (=> bm!36394 (= call!36397 ($colon$colon!533 e!464341 (ite c!90568 (h!16977 (toList!4466 lt!377097)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))))

(declare-fun c!90567 () Bool)

(assert (=> bm!36394 (= c!90567 c!90568)))

(declare-fun b!832539 () Bool)

(assert (=> b!832539 (= e!464341 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377097)) (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun b!832540 () Bool)

(declare-fun res!566354 () Bool)

(assert (=> b!832540 (=> (not res!566354) (not e!464339))))

(assert (=> b!832540 (= res!566354 (containsKey!401 lt!377715 (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun b!832541 () Bool)

(assert (=> b!832541 (= e!464340 e!464337)))

(assert (=> b!832541 (= c!90570 (and ((_ is Cons!15842) (toList!4466 lt!377097)) (= (_1!5049 (h!16977 (toList!4466 lt!377097))) (_1!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(declare-fun b!832542 () Bool)

(assert (=> b!832542 (= e!464339 (contains!4188 lt!377715 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377093 lt!377098)) (_2!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(declare-fun b!832543 () Bool)

(assert (=> b!832543 (= e!464340 call!36397)))

(declare-fun b!832544 () Bool)

(assert (=> b!832544 (= c!90569 (and ((_ is Cons!15842) (toList!4466 lt!377097)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377097))) (_1!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (=> b!832544 (= e!464337 e!464338)))

(assert (= (and d!106547 c!90568) b!832543))

(assert (= (and d!106547 (not c!90568)) b!832541))

(assert (= (and b!832541 c!90570) b!832538))

(assert (= (and b!832541 (not c!90570)) b!832544))

(assert (= (and b!832544 c!90569) b!832536))

(assert (= (and b!832544 (not c!90569)) b!832537))

(assert (= (or b!832536 b!832537) bm!36392))

(assert (= (or b!832538 bm!36392) bm!36393))

(assert (= (or b!832543 bm!36393) bm!36394))

(assert (= (and bm!36394 c!90567) b!832539))

(assert (= (and bm!36394 (not c!90567)) b!832535))

(assert (= (and d!106547 res!566355) b!832540))

(assert (= (and b!832540 res!566354) b!832542))

(declare-fun m!776803 () Bool)

(assert (=> d!106547 m!776803))

(declare-fun m!776805 () Bool)

(assert (=> d!106547 m!776805))

(declare-fun m!776807 () Bool)

(assert (=> bm!36394 m!776807))

(declare-fun m!776809 () Bool)

(assert (=> b!832539 m!776809))

(declare-fun m!776811 () Bool)

(assert (=> b!832540 m!776811))

(declare-fun m!776813 () Bool)

(assert (=> b!832542 m!776813))

(assert (=> d!105855 d!106547))

(declare-fun d!106549 () Bool)

(assert (=> d!106549 (= ($colon$colon!533 e!463712 (ite c!90254 (h!16977 (toList!4466 lt!377013)) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))) (Cons!15842 (ite c!90254 (h!16977 (toList!4466 lt!377013)) (tuple2!10077 (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))) e!463712))))

(assert (=> bm!36320 d!106549))

(declare-fun d!106551 () Bool)

(declare-fun res!566356 () Bool)

(declare-fun e!464342 () Bool)

(assert (=> d!106551 (=> res!566356 e!464342)))

(assert (=> d!106551 (= res!566356 (and ((_ is Cons!15842) lt!377324) (= (_1!5049 (h!16977 lt!377324)) (_1!5049 lt!377012))))))

(assert (=> d!106551 (= (containsKey!401 lt!377324 (_1!5049 lt!377012)) e!464342)))

(declare-fun b!832545 () Bool)

(declare-fun e!464343 () Bool)

(assert (=> b!832545 (= e!464342 e!464343)))

(declare-fun res!566357 () Bool)

(assert (=> b!832545 (=> (not res!566357) (not e!464343))))

(assert (=> b!832545 (= res!566357 (and (or (not ((_ is Cons!15842) lt!377324)) (bvsle (_1!5049 (h!16977 lt!377324)) (_1!5049 lt!377012))) ((_ is Cons!15842) lt!377324) (bvslt (_1!5049 (h!16977 lt!377324)) (_1!5049 lt!377012))))))

(declare-fun b!832546 () Bool)

(assert (=> b!832546 (= e!464343 (containsKey!401 (t!22203 lt!377324) (_1!5049 lt!377012)))))

(assert (= (and d!106551 (not res!566356)) b!832545))

(assert (= (and b!832545 res!566357) b!832546))

(declare-fun m!776815 () Bool)

(assert (=> b!832546 m!776815))

(assert (=> b!831488 d!106551))

(declare-fun b!832548 () Bool)

(declare-fun e!464344 () Option!422)

(declare-fun e!464345 () Option!422)

(assert (=> b!832548 (= e!464344 e!464345)))

(declare-fun c!90572 () Bool)

(assert (=> b!832548 (= c!90572 (and ((_ is Cons!15842) (toList!4466 lt!377404)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377404))) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))))

(declare-fun b!832549 () Bool)

(assert (=> b!832549 (= e!464345 (getValueByKey!416 (t!22203 (toList!4466 lt!377404)) (_1!5049 (tuple2!10077 lt!377093 lt!377098))))))

(declare-fun c!90571 () Bool)

(declare-fun d!106553 () Bool)

(assert (=> d!106553 (= c!90571 (and ((_ is Cons!15842) (toList!4466 lt!377404)) (= (_1!5049 (h!16977 (toList!4466 lt!377404))) (_1!5049 (tuple2!10077 lt!377093 lt!377098)))))))

(assert (=> d!106553 (= (getValueByKey!416 (toList!4466 lt!377404) (_1!5049 (tuple2!10077 lt!377093 lt!377098))) e!464344)))

(declare-fun b!832547 () Bool)

(assert (=> b!832547 (= e!464344 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377404)))))))

(declare-fun b!832550 () Bool)

(assert (=> b!832550 (= e!464345 None!420)))

(assert (= (and d!106553 c!90571) b!832547))

(assert (= (and d!106553 (not c!90571)) b!832548))

(assert (= (and b!832548 c!90572) b!832549))

(assert (= (and b!832548 (not c!90572)) b!832550))

(declare-fun m!776817 () Bool)

(assert (=> b!832549 m!776817))

(assert (=> b!831584 d!106553))

(declare-fun d!106555 () Bool)

(declare-fun lt!377716 () Bool)

(assert (=> d!106555 (= lt!377716 (select (content!386 lt!377210) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun e!464347 () Bool)

(assert (=> d!106555 (= lt!377716 e!464347)))

(declare-fun res!566358 () Bool)

(assert (=> d!106555 (=> (not res!566358) (not e!464347))))

(assert (=> d!106555 (= res!566358 ((_ is Cons!15842) lt!377210))))

(assert (=> d!106555 (= (contains!4188 lt!377210 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))) lt!377716)))

(declare-fun b!832551 () Bool)

(declare-fun e!464346 () Bool)

(assert (=> b!832551 (= e!464347 e!464346)))

(declare-fun res!566359 () Bool)

(assert (=> b!832551 (=> res!566359 e!464346)))

(assert (=> b!832551 (= res!566359 (= (h!16977 lt!377210) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!832552 () Bool)

(assert (=> b!832552 (= e!464346 (contains!4188 (t!22203 lt!377210) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(assert (= (and d!106555 res!566358) b!832551))

(assert (= (and b!832551 (not res!566359)) b!832552))

(declare-fun m!776819 () Bool)

(assert (=> d!106555 m!776819))

(declare-fun m!776821 () Bool)

(assert (=> d!106555 m!776821))

(declare-fun m!776823 () Bool)

(assert (=> b!832552 m!776823))

(assert (=> b!831482 d!106555))

(declare-fun d!106557 () Bool)

(assert (=> d!106557 (= (isEmpty!660 lt!377252) (isEmpty!661 (toList!4466 lt!377252)))))

(declare-fun bs!23266 () Bool)

(assert (= bs!23266 d!106557))

(declare-fun m!776825 () Bool)

(assert (=> bs!23266 m!776825))

(assert (=> b!831382 d!106557))

(assert (=> d!105795 d!105815))

(declare-fun d!106559 () Bool)

(assert (=> d!106559 (= (apply!372 (+!1988 lt!377182 (tuple2!10077 lt!377165 minValue!754)) lt!377171) (apply!372 lt!377182 lt!377171))))

(assert (=> d!106559 true))

(declare-fun _$34!1147 () Unit!28446)

(assert (=> d!106559 (= (choose!1424 lt!377182 lt!377165 minValue!754 lt!377171) _$34!1147)))

(declare-fun bs!23267 () Bool)

(assert (= bs!23267 d!106559))

(assert (=> bs!23267 m!774735))

(assert (=> bs!23267 m!774735))

(assert (=> bs!23267 m!774737))

(assert (=> bs!23267 m!774753))

(assert (=> d!105795 d!106559))

(assert (=> d!105795 d!105799))

(assert (=> d!105795 d!105811))

(declare-fun d!106561 () Bool)

(declare-fun e!464349 () Bool)

(assert (=> d!106561 e!464349))

(declare-fun res!566360 () Bool)

(assert (=> d!106561 (=> res!566360 e!464349)))

(declare-fun lt!377719 () Bool)

(assert (=> d!106561 (= res!566360 (not lt!377719))))

(declare-fun lt!377718 () Bool)

(assert (=> d!106561 (= lt!377719 lt!377718)))

(declare-fun lt!377717 () Unit!28446)

(declare-fun e!464348 () Unit!28446)

(assert (=> d!106561 (= lt!377717 e!464348)))

(declare-fun c!90573 () Bool)

(assert (=> d!106561 (= c!90573 lt!377718)))

(assert (=> d!106561 (= lt!377718 (containsKey!401 (toList!4466 lt!377182) lt!377171))))

(assert (=> d!106561 (= (contains!4187 lt!377182 lt!377171) lt!377719)))

(declare-fun b!832553 () Bool)

(declare-fun lt!377720 () Unit!28446)

(assert (=> b!832553 (= e!464348 lt!377720)))

(assert (=> b!832553 (= lt!377720 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377182) lt!377171))))

(assert (=> b!832553 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377182) lt!377171))))

(declare-fun b!832554 () Bool)

(declare-fun Unit!28506 () Unit!28446)

(assert (=> b!832554 (= e!464348 Unit!28506)))

(declare-fun b!832555 () Bool)

(assert (=> b!832555 (= e!464349 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377182) lt!377171)))))

(assert (= (and d!106561 c!90573) b!832553))

(assert (= (and d!106561 (not c!90573)) b!832554))

(assert (= (and d!106561 (not res!566360)) b!832555))

(declare-fun m!776827 () Bool)

(assert (=> d!106561 m!776827))

(declare-fun m!776829 () Bool)

(assert (=> b!832553 m!776829))

(assert (=> b!832553 m!775209))

(assert (=> b!832553 m!775209))

(declare-fun m!776831 () Bool)

(assert (=> b!832553 m!776831))

(assert (=> b!832555 m!775209))

(assert (=> b!832555 m!775209))

(assert (=> b!832555 m!776831))

(assert (=> d!105795 d!106561))

(declare-fun b!832557 () Bool)

(declare-fun e!464350 () Option!422)

(declare-fun e!464351 () Option!422)

(assert (=> b!832557 (= e!464350 e!464351)))

(declare-fun c!90575 () Bool)

(assert (=> b!832557 (= c!90575 (and ((_ is Cons!15842) (t!22203 lt!377118)) (not (= (_1!5049 (h!16977 (t!22203 lt!377118))) (_1!5049 lt!377010)))))))

(declare-fun b!832558 () Bool)

(assert (=> b!832558 (= e!464351 (getValueByKey!416 (t!22203 (t!22203 lt!377118)) (_1!5049 lt!377010)))))

(declare-fun d!106563 () Bool)

(declare-fun c!90574 () Bool)

(assert (=> d!106563 (= c!90574 (and ((_ is Cons!15842) (t!22203 lt!377118)) (= (_1!5049 (h!16977 (t!22203 lt!377118))) (_1!5049 lt!377010))))))

(assert (=> d!106563 (= (getValueByKey!416 (t!22203 lt!377118) (_1!5049 lt!377010)) e!464350)))

(declare-fun b!832556 () Bool)

(assert (=> b!832556 (= e!464350 (Some!421 (_2!5049 (h!16977 (t!22203 lt!377118)))))))

(declare-fun b!832559 () Bool)

(assert (=> b!832559 (= e!464351 None!420)))

(assert (= (and d!106563 c!90574) b!832556))

(assert (= (and d!106563 (not c!90574)) b!832557))

(assert (= (and b!832557 c!90575) b!832558))

(assert (= (and b!832557 (not c!90575)) b!832559))

(declare-fun m!776833 () Bool)

(assert (=> b!832558 m!776833))

(assert (=> b!831609 d!106563))

(declare-fun d!106565 () Bool)

(assert (=> d!106565 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun lt!377721 () Unit!28446)

(assert (=> d!106565 (= lt!377721 (choose!1427 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!464352 () Bool)

(assert (=> d!106565 e!464352))

(declare-fun res!566361 () Bool)

(assert (=> d!106565 (=> (not res!566361) (not e!464352))))

(assert (=> d!106565 (= res!566361 (isStrictlySorted!429 (toList!4466 lt!377094)))))

(assert (=> d!106565 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)) lt!377721)))

(declare-fun b!832560 () Bool)

(assert (=> b!832560 (= e!464352 (containsKey!401 (toList!4466 lt!377094) (select (arr!22325 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!106565 res!566361) b!832560))

(assert (=> d!106565 m!774611))

(assert (=> d!106565 m!775185))

(assert (=> d!106565 m!775185))

(assert (=> d!106565 m!775187))

(assert (=> d!106565 m!774611))

(declare-fun m!776835 () Bool)

(assert (=> d!106565 m!776835))

(assert (=> d!106565 m!775749))

(assert (=> b!832560 m!774611))

(assert (=> b!832560 m!775181))

(assert (=> b!831506 d!106565))

(assert (=> b!831506 d!106051))

(assert (=> b!831506 d!106021))

(declare-fun b!832562 () Bool)

(declare-fun e!464353 () Option!422)

(declare-fun e!464354 () Option!422)

(assert (=> b!832562 (= e!464353 e!464354)))

(declare-fun c!90577 () Bool)

(assert (=> b!832562 (= c!90577 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377208))) (not (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377208)))) (_1!5049 lt!377012)))))))

(declare-fun b!832563 () Bool)

(assert (=> b!832563 (= e!464354 (getValueByKey!416 (t!22203 (t!22203 (toList!4466 lt!377208))) (_1!5049 lt!377012)))))

(declare-fun d!106567 () Bool)

(declare-fun c!90576 () Bool)

(assert (=> d!106567 (= c!90576 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377208))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377208)))) (_1!5049 lt!377012))))))

(assert (=> d!106567 (= (getValueByKey!416 (t!22203 (toList!4466 lt!377208)) (_1!5049 lt!377012)) e!464353)))

(declare-fun b!832561 () Bool)

(assert (=> b!832561 (= e!464353 (Some!421 (_2!5049 (h!16977 (t!22203 (toList!4466 lt!377208))))))))

(declare-fun b!832564 () Bool)

(assert (=> b!832564 (= e!464354 None!420)))

(assert (= (and d!106567 c!90576) b!832561))

(assert (= (and d!106567 (not c!90576)) b!832562))

(assert (= (and b!832562 c!90577) b!832563))

(assert (= (and b!832562 (not c!90577)) b!832564))

(declare-fun m!776837 () Bool)

(assert (=> b!832563 m!776837))

(assert (=> b!831599 d!106567))

(declare-fun d!106569 () Bool)

(declare-fun e!464356 () Bool)

(assert (=> d!106569 e!464356))

(declare-fun res!566362 () Bool)

(assert (=> d!106569 (=> res!566362 e!464356)))

(declare-fun lt!377724 () Bool)

(assert (=> d!106569 (= res!566362 (not lt!377724))))

(declare-fun lt!377723 () Bool)

(assert (=> d!106569 (= lt!377724 lt!377723)))

(declare-fun lt!377722 () Unit!28446)

(declare-fun e!464355 () Unit!28446)

(assert (=> d!106569 (= lt!377722 e!464355)))

(declare-fun c!90578 () Bool)

(assert (=> d!106569 (= c!90578 lt!377723)))

(assert (=> d!106569 (= lt!377723 (containsKey!401 (toList!4466 lt!377303) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(assert (=> d!106569 (= (contains!4187 lt!377303 (_1!5049 (tuple2!10077 lt!377195 minValue!754))) lt!377724)))

(declare-fun b!832565 () Bool)

(declare-fun lt!377725 () Unit!28446)

(assert (=> b!832565 (= e!464355 lt!377725)))

(assert (=> b!832565 (= lt!377725 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377303) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(assert (=> b!832565 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377303) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun b!832566 () Bool)

(declare-fun Unit!28507 () Unit!28446)

(assert (=> b!832566 (= e!464355 Unit!28507)))

(declare-fun b!832567 () Bool)

(assert (=> b!832567 (= e!464356 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377303) (_1!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(assert (= (and d!106569 c!90578) b!832565))

(assert (= (and d!106569 (not c!90578)) b!832566))

(assert (= (and d!106569 (not res!566362)) b!832567))

(declare-fun m!776839 () Bool)

(assert (=> d!106569 m!776839))

(declare-fun m!776841 () Bool)

(assert (=> b!832565 m!776841))

(assert (=> b!832565 m!775067))

(assert (=> b!832565 m!775067))

(declare-fun m!776843 () Bool)

(assert (=> b!832565 m!776843))

(assert (=> b!832567 m!775067))

(assert (=> b!832567 m!775067))

(assert (=> b!832567 m!776843))

(assert (=> d!105749 d!106569))

(declare-fun b!832569 () Bool)

(declare-fun e!464357 () Option!422)

(declare-fun e!464358 () Option!422)

(assert (=> b!832569 (= e!464357 e!464358)))

(declare-fun c!90580 () Bool)

(assert (=> b!832569 (= c!90580 (and ((_ is Cons!15842) lt!377305) (not (= (_1!5049 (h!16977 lt!377305)) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))))

(declare-fun b!832570 () Bool)

(assert (=> b!832570 (= e!464358 (getValueByKey!416 (t!22203 lt!377305) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun c!90579 () Bool)

(declare-fun d!106571 () Bool)

(assert (=> d!106571 (= c!90579 (and ((_ is Cons!15842) lt!377305) (= (_1!5049 (h!16977 lt!377305)) (_1!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(assert (=> d!106571 (= (getValueByKey!416 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754))) e!464357)))

(declare-fun b!832568 () Bool)

(assert (=> b!832568 (= e!464357 (Some!421 (_2!5049 (h!16977 lt!377305))))))

(declare-fun b!832571 () Bool)

(assert (=> b!832571 (= e!464358 None!420)))

(assert (= (and d!106571 c!90579) b!832568))

(assert (= (and d!106571 (not c!90579)) b!832569))

(assert (= (and b!832569 c!90580) b!832570))

(assert (= (and b!832569 (not c!90580)) b!832571))

(declare-fun m!776845 () Bool)

(assert (=> b!832570 m!776845))

(assert (=> d!105749 d!106571))

(declare-fun d!106573 () Bool)

(assert (=> d!106573 (= (getValueByKey!416 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754))) (Some!421 (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun lt!377726 () Unit!28446)

(assert (=> d!106573 (= lt!377726 (choose!1423 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun e!464359 () Bool)

(assert (=> d!106573 e!464359))

(declare-fun res!566363 () Bool)

(assert (=> d!106573 (=> (not res!566363) (not e!464359))))

(assert (=> d!106573 (= res!566363 (isStrictlySorted!429 lt!377305))))

(assert (=> d!106573 (= (lemmaContainsTupThenGetReturnValue!230 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))) lt!377726)))

(declare-fun b!832572 () Bool)

(declare-fun res!566364 () Bool)

(assert (=> b!832572 (=> (not res!566364) (not e!464359))))

(assert (=> b!832572 (= res!566364 (containsKey!401 lt!377305 (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun b!832573 () Bool)

(assert (=> b!832573 (= e!464359 (contains!4188 lt!377305 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(assert (= (and d!106573 res!566363) b!832572))

(assert (= (and b!832572 res!566364) b!832573))

(assert (=> d!106573 m!775061))

(declare-fun m!776847 () Bool)

(assert (=> d!106573 m!776847))

(declare-fun m!776849 () Bool)

(assert (=> d!106573 m!776849))

(declare-fun m!776851 () Bool)

(assert (=> b!832572 m!776851))

(declare-fun m!776853 () Bool)

(assert (=> b!832573 m!776853))

(assert (=> d!105749 d!106573))

(declare-fun bm!36395 () Bool)

(declare-fun call!36398 () List!15846)

(declare-fun call!36399 () List!15846)

(assert (=> bm!36395 (= call!36398 call!36399)))

(declare-fun bm!36396 () Bool)

(declare-fun call!36400 () List!15846)

(assert (=> bm!36396 (= call!36399 call!36400)))

(declare-fun d!106575 () Bool)

(declare-fun e!464362 () Bool)

(assert (=> d!106575 e!464362))

(declare-fun res!566366 () Bool)

(assert (=> d!106575 (=> (not res!566366) (not e!464362))))

(declare-fun lt!377727 () List!15846)

(assert (=> d!106575 (= res!566366 (isStrictlySorted!429 lt!377727))))

(declare-fun e!464363 () List!15846)

(assert (=> d!106575 (= lt!377727 e!464363)))

(declare-fun c!90582 () Bool)

(assert (=> d!106575 (= c!90582 (and ((_ is Cons!15842) (toList!4466 lt!377199)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377199))) (_1!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(assert (=> d!106575 (isStrictlySorted!429 (toList!4466 lt!377199))))

(assert (=> d!106575 (= (insertStrictlySorted!269 (toList!4466 lt!377199) (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))) lt!377727)))

(declare-fun c!90584 () Bool)

(declare-fun e!464364 () List!15846)

(declare-fun c!90583 () Bool)

(declare-fun b!832574 () Bool)

(assert (=> b!832574 (= e!464364 (ite c!90584 (t!22203 (toList!4466 lt!377199)) (ite c!90583 (Cons!15842 (h!16977 (toList!4466 lt!377199)) (t!22203 (toList!4466 lt!377199))) Nil!15843)))))

(declare-fun b!832575 () Bool)

(declare-fun e!464361 () List!15846)

(assert (=> b!832575 (= e!464361 call!36398)))

(declare-fun b!832576 () Bool)

(assert (=> b!832576 (= e!464361 call!36398)))

(declare-fun b!832577 () Bool)

(declare-fun e!464360 () List!15846)

(assert (=> b!832577 (= e!464360 call!36399)))

(declare-fun bm!36397 () Bool)

(assert (=> bm!36397 (= call!36400 ($colon$colon!533 e!464364 (ite c!90582 (h!16977 (toList!4466 lt!377199)) (tuple2!10077 (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))))

(declare-fun c!90581 () Bool)

(assert (=> bm!36397 (= c!90581 c!90582)))

(declare-fun b!832578 () Bool)

(assert (=> b!832578 (= e!464364 (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377199)) (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun b!832579 () Bool)

(declare-fun res!566365 () Bool)

(assert (=> b!832579 (=> (not res!566365) (not e!464362))))

(assert (=> b!832579 (= res!566365 (containsKey!401 lt!377727 (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun b!832580 () Bool)

(assert (=> b!832580 (= e!464363 e!464360)))

(assert (=> b!832580 (= c!90584 (and ((_ is Cons!15842) (toList!4466 lt!377199)) (= (_1!5049 (h!16977 (toList!4466 lt!377199))) (_1!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(declare-fun b!832581 () Bool)

(assert (=> b!832581 (= e!464362 (contains!4188 lt!377727 (tuple2!10077 (_1!5049 (tuple2!10077 lt!377195 minValue!754)) (_2!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(declare-fun b!832582 () Bool)

(assert (=> b!832582 (= e!464363 call!36400)))

(declare-fun b!832583 () Bool)

(assert (=> b!832583 (= c!90583 (and ((_ is Cons!15842) (toList!4466 lt!377199)) (bvsgt (_1!5049 (h!16977 (toList!4466 lt!377199))) (_1!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(assert (=> b!832583 (= e!464360 e!464361)))

(assert (= (and d!106575 c!90582) b!832582))

(assert (= (and d!106575 (not c!90582)) b!832580))

(assert (= (and b!832580 c!90584) b!832577))

(assert (= (and b!832580 (not c!90584)) b!832583))

(assert (= (and b!832583 c!90583) b!832575))

(assert (= (and b!832583 (not c!90583)) b!832576))

(assert (= (or b!832575 b!832576) bm!36395))

(assert (= (or b!832577 bm!36395) bm!36396))

(assert (= (or b!832582 bm!36396) bm!36397))

(assert (= (and bm!36397 c!90581) b!832578))

(assert (= (and bm!36397 (not c!90581)) b!832574))

(assert (= (and d!106575 res!566366) b!832579))

(assert (= (and b!832579 res!566365) b!832581))

(declare-fun m!776855 () Bool)

(assert (=> d!106575 m!776855))

(declare-fun m!776857 () Bool)

(assert (=> d!106575 m!776857))

(declare-fun m!776859 () Bool)

(assert (=> bm!36397 m!776859))

(declare-fun m!776861 () Bool)

(assert (=> b!832578 m!776861))

(declare-fun m!776863 () Bool)

(assert (=> b!832579 m!776863))

(declare-fun m!776865 () Bool)

(assert (=> b!832581 m!776865))

(assert (=> d!105749 d!106575))

(declare-fun b!832585 () Bool)

(declare-fun e!464365 () Option!422)

(declare-fun e!464366 () Option!422)

(assert (=> b!832585 (= e!464365 e!464366)))

(declare-fun c!90586 () Bool)

(assert (=> b!832585 (= c!90586 (and ((_ is Cons!15842) (toList!4466 lt!377416)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377416))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))))

(declare-fun b!832586 () Bool)

(assert (=> b!832586 (= e!464366 (getValueByKey!416 (t!22203 (toList!4466 lt!377416)) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!106577 () Bool)

(declare-fun c!90585 () Bool)

(assert (=> d!106577 (= c!90585 (and ((_ is Cons!15842) (toList!4466 lt!377416)) (= (_1!5049 (h!16977 (toList!4466 lt!377416))) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(assert (=> d!106577 (= (getValueByKey!416 (toList!4466 lt!377416) (_1!5049 (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) e!464365)))

(declare-fun b!832584 () Bool)

(assert (=> b!832584 (= e!464365 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377416)))))))

(declare-fun b!832587 () Bool)

(assert (=> b!832587 (= e!464366 None!420)))

(assert (= (and d!106577 c!90585) b!832584))

(assert (= (and d!106577 (not c!90585)) b!832585))

(assert (= (and b!832585 c!90586) b!832586))

(assert (= (and b!832585 (not c!90586)) b!832587))

(declare-fun m!776867 () Bool)

(assert (=> b!832586 m!776867))

(assert (=> b!831591 d!106577))

(declare-fun bm!36398 () Bool)

(declare-fun call!36401 () List!15846)

(declare-fun call!36402 () List!15846)

(assert (=> bm!36398 (= call!36401 call!36402)))

(declare-fun bm!36399 () Bool)

(declare-fun call!36403 () List!15846)

(assert (=> bm!36399 (= call!36402 call!36403)))

(declare-fun d!106579 () Bool)

(declare-fun e!464369 () Bool)

(assert (=> d!106579 e!464369))

(declare-fun res!566368 () Bool)

(assert (=> d!106579 (=> (not res!566368) (not e!464369))))

(declare-fun lt!377728 () List!15846)

(assert (=> d!106579 (= res!566368 (isStrictlySorted!429 lt!377728))))

(declare-fun e!464370 () List!15846)

(assert (=> d!106579 (= lt!377728 e!464370)))

(declare-fun c!90588 () Bool)

(assert (=> d!106579 (= c!90588 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377014))) (bvslt (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014)))) (_1!5049 lt!377012))))))

(assert (=> d!106579 (isStrictlySorted!429 (t!22203 (toList!4466 lt!377014)))))

(assert (=> d!106579 (= (insertStrictlySorted!269 (t!22203 (toList!4466 lt!377014)) (_1!5049 lt!377012) (_2!5049 lt!377012)) lt!377728)))

(declare-fun c!90590 () Bool)

(declare-fun b!832588 () Bool)

(declare-fun c!90589 () Bool)

(declare-fun e!464371 () List!15846)

(assert (=> b!832588 (= e!464371 (ite c!90590 (t!22203 (t!22203 (toList!4466 lt!377014))) (ite c!90589 (Cons!15842 (h!16977 (t!22203 (toList!4466 lt!377014))) (t!22203 (t!22203 (toList!4466 lt!377014)))) Nil!15843)))))

(declare-fun b!832589 () Bool)

(declare-fun e!464368 () List!15846)

(assert (=> b!832589 (= e!464368 call!36401)))

(declare-fun b!832590 () Bool)

(assert (=> b!832590 (= e!464368 call!36401)))

(declare-fun b!832591 () Bool)

(declare-fun e!464367 () List!15846)

(assert (=> b!832591 (= e!464367 call!36402)))

(declare-fun bm!36400 () Bool)

(assert (=> bm!36400 (= call!36403 ($colon$colon!533 e!464371 (ite c!90588 (h!16977 (t!22203 (toList!4466 lt!377014))) (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012)))))))

(declare-fun c!90587 () Bool)

(assert (=> bm!36400 (= c!90587 c!90588)))

(declare-fun b!832592 () Bool)

(assert (=> b!832592 (= e!464371 (insertStrictlySorted!269 (t!22203 (t!22203 (toList!4466 lt!377014))) (_1!5049 lt!377012) (_2!5049 lt!377012)))))

(declare-fun b!832593 () Bool)

(declare-fun res!566367 () Bool)

(assert (=> b!832593 (=> (not res!566367) (not e!464369))))

(assert (=> b!832593 (= res!566367 (containsKey!401 lt!377728 (_1!5049 lt!377012)))))

(declare-fun b!832594 () Bool)

(assert (=> b!832594 (= e!464370 e!464367)))

(assert (=> b!832594 (= c!90590 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377014))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014)))) (_1!5049 lt!377012))))))

(declare-fun b!832595 () Bool)

(assert (=> b!832595 (= e!464369 (contains!4188 lt!377728 (tuple2!10077 (_1!5049 lt!377012) (_2!5049 lt!377012))))))

(declare-fun b!832596 () Bool)

(assert (=> b!832596 (= e!464370 call!36403)))

(declare-fun b!832597 () Bool)

(assert (=> b!832597 (= c!90589 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377014))) (bvsgt (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377014)))) (_1!5049 lt!377012))))))

(assert (=> b!832597 (= e!464367 e!464368)))

(assert (= (and d!106579 c!90588) b!832596))

(assert (= (and d!106579 (not c!90588)) b!832594))

(assert (= (and b!832594 c!90590) b!832591))

(assert (= (and b!832594 (not c!90590)) b!832597))

(assert (= (and b!832597 c!90589) b!832589))

(assert (= (and b!832597 (not c!90589)) b!832590))

(assert (= (or b!832589 b!832590) bm!36398))

(assert (= (or b!832591 bm!36398) bm!36399))

(assert (= (or b!832596 bm!36399) bm!36400))

(assert (= (and bm!36400 c!90587) b!832592))

(assert (= (and bm!36400 (not c!90587)) b!832588))

(assert (= (and d!106579 res!566368) b!832593))

(assert (= (and b!832593 res!566367) b!832595))

(declare-fun m!776869 () Bool)

(assert (=> d!106579 m!776869))

(assert (=> d!106579 m!775791))

(declare-fun m!776871 () Bool)

(assert (=> bm!36400 m!776871))

(declare-fun m!776873 () Bool)

(assert (=> b!832592 m!776873))

(declare-fun m!776875 () Bool)

(assert (=> b!832593 m!776875))

(declare-fun m!776877 () Bool)

(assert (=> b!832595 m!776877))

(assert (=> b!831487 d!106579))

(declare-fun b!832599 () Bool)

(declare-fun e!464372 () Option!422)

(declare-fun e!464373 () Option!422)

(assert (=> b!832599 (= e!464372 e!464373)))

(declare-fun c!90592 () Bool)

(assert (=> b!832599 (= c!90592 (and ((_ is Cons!15842) (toList!4466 lt!377303)) (not (= (_1!5049 (h!16977 (toList!4466 lt!377303))) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))))

(declare-fun b!832600 () Bool)

(assert (=> b!832600 (= e!464373 (getValueByKey!416 (t!22203 (toList!4466 lt!377303)) (_1!5049 (tuple2!10077 lt!377195 minValue!754))))))

(declare-fun d!106581 () Bool)

(declare-fun c!90591 () Bool)

(assert (=> d!106581 (= c!90591 (and ((_ is Cons!15842) (toList!4466 lt!377303)) (= (_1!5049 (h!16977 (toList!4466 lt!377303))) (_1!5049 (tuple2!10077 lt!377195 minValue!754)))))))

(assert (=> d!106581 (= (getValueByKey!416 (toList!4466 lt!377303) (_1!5049 (tuple2!10077 lt!377195 minValue!754))) e!464372)))

(declare-fun b!832598 () Bool)

(assert (=> b!832598 (= e!464372 (Some!421 (_2!5049 (h!16977 (toList!4466 lt!377303)))))))

(declare-fun b!832601 () Bool)

(assert (=> b!832601 (= e!464373 None!420)))

(assert (= (and d!106581 c!90591) b!832598))

(assert (= (and d!106581 (not c!90591)) b!832599))

(assert (= (and b!832599 c!90592) b!832600))

(assert (= (and b!832599 (not c!90592)) b!832601))

(declare-fun m!776879 () Bool)

(assert (=> b!832600 m!776879))

(assert (=> b!831460 d!106581))

(declare-fun d!106583 () Bool)

(declare-fun res!566369 () Bool)

(declare-fun e!464374 () Bool)

(assert (=> d!106583 (=> res!566369 e!464374)))

(assert (=> d!106583 (= res!566369 (and ((_ is Cons!15842) lt!377434) (= (_1!5049 (h!16977 lt!377434)) (_1!5049 lt!377012))))))

(assert (=> d!106583 (= (containsKey!401 lt!377434 (_1!5049 lt!377012)) e!464374)))

(declare-fun b!832602 () Bool)

(declare-fun e!464375 () Bool)

(assert (=> b!832602 (= e!464374 e!464375)))

(declare-fun res!566370 () Bool)

(assert (=> b!832602 (=> (not res!566370) (not e!464375))))

(assert (=> b!832602 (= res!566370 (and (or (not ((_ is Cons!15842) lt!377434)) (bvsle (_1!5049 (h!16977 lt!377434)) (_1!5049 lt!377012))) ((_ is Cons!15842) lt!377434) (bvslt (_1!5049 (h!16977 lt!377434)) (_1!5049 lt!377012))))))

(declare-fun b!832603 () Bool)

(assert (=> b!832603 (= e!464375 (containsKey!401 (t!22203 lt!377434) (_1!5049 lt!377012)))))

(assert (= (and d!106583 (not res!566369)) b!832602))

(assert (= (and b!832602 res!566370) b!832603))

(declare-fun m!776881 () Bool)

(assert (=> b!832603 m!776881))

(assert (=> b!831637 d!106583))

(assert (=> b!831502 d!106453))

(assert (=> b!831502 d!106401))

(declare-fun d!106585 () Bool)

(declare-fun res!566371 () Bool)

(declare-fun e!464376 () Bool)

(assert (=> d!106585 (=> res!566371 e!464376)))

(assert (=> d!106585 (= res!566371 (and ((_ is Cons!15842) lt!377273) (= (_1!5049 (h!16977 lt!377273)) (_1!5049 lt!377010))))))

(assert (=> d!106585 (= (containsKey!401 lt!377273 (_1!5049 lt!377010)) e!464376)))

(declare-fun b!832604 () Bool)

(declare-fun e!464377 () Bool)

(assert (=> b!832604 (= e!464376 e!464377)))

(declare-fun res!566372 () Bool)

(assert (=> b!832604 (=> (not res!566372) (not e!464377))))

(assert (=> b!832604 (= res!566372 (and (or (not ((_ is Cons!15842) lt!377273)) (bvsle (_1!5049 (h!16977 lt!377273)) (_1!5049 lt!377010))) ((_ is Cons!15842) lt!377273) (bvslt (_1!5049 (h!16977 lt!377273)) (_1!5049 lt!377010))))))

(declare-fun b!832605 () Bool)

(assert (=> b!832605 (= e!464377 (containsKey!401 (t!22203 lt!377273) (_1!5049 lt!377010)))))

(assert (= (and d!106585 (not res!566371)) b!832604))

(assert (= (and b!832604 res!566372) b!832605))

(declare-fun m!776883 () Bool)

(assert (=> b!832605 m!776883))

(assert (=> b!831435 d!106585))

(declare-fun lt!377729 () Bool)

(declare-fun d!106587 () Bool)

(assert (=> d!106587 (= lt!377729 (select (content!386 (toList!4466 lt!377276)) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun e!464379 () Bool)

(assert (=> d!106587 (= lt!377729 e!464379)))

(declare-fun res!566373 () Bool)

(assert (=> d!106587 (=> (not res!566373) (not e!464379))))

(assert (=> d!106587 (= res!566373 ((_ is Cons!15842) (toList!4466 lt!377276)))))

(assert (=> d!106587 (= (contains!4188 (toList!4466 lt!377276) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) lt!377729)))

(declare-fun b!832606 () Bool)

(declare-fun e!464378 () Bool)

(assert (=> b!832606 (= e!464379 e!464378)))

(declare-fun res!566374 () Bool)

(assert (=> b!832606 (=> res!566374 e!464378)))

(assert (=> b!832606 (= res!566374 (= (h!16977 (toList!4466 lt!377276)) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!832607 () Bool)

(assert (=> b!832607 (= e!464378 (contains!4188 (t!22203 (toList!4466 lt!377276)) (ite (or c!90178 c!90179) (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10077 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (= (and d!106587 res!566373) b!832606))

(assert (= (and b!832606 (not res!566374)) b!832607))

(declare-fun m!776885 () Bool)

(assert (=> d!106587 m!776885))

(declare-fun m!776887 () Bool)

(assert (=> d!106587 m!776887))

(declare-fun m!776889 () Bool)

(assert (=> b!832607 m!776889))

(assert (=> b!831443 d!106587))

(declare-fun d!106589 () Bool)

(assert (=> d!106589 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377116) (_1!5049 lt!377010)))))

(declare-fun lt!377730 () Unit!28446)

(assert (=> d!106589 (= lt!377730 (choose!1427 (toList!4466 lt!377116) (_1!5049 lt!377010)))))

(declare-fun e!464380 () Bool)

(assert (=> d!106589 e!464380))

(declare-fun res!566375 () Bool)

(assert (=> d!106589 (=> (not res!566375) (not e!464380))))

(assert (=> d!106589 (= res!566375 (isStrictlySorted!429 (toList!4466 lt!377116)))))

(assert (=> d!106589 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377116) (_1!5049 lt!377010)) lt!377730)))

(declare-fun b!832608 () Bool)

(assert (=> b!832608 (= e!464380 (containsKey!401 (toList!4466 lt!377116) (_1!5049 lt!377010)))))

(assert (= (and d!106589 res!566375) b!832608))

(assert (=> d!106589 m!774707))

(assert (=> d!106589 m!774707))

(assert (=> d!106589 m!775473))

(declare-fun m!776891 () Bool)

(assert (=> d!106589 m!776891))

(declare-fun m!776893 () Bool)

(assert (=> d!106589 m!776893))

(assert (=> b!832608 m!775469))

(assert (=> b!831604 d!106589))

(assert (=> b!831604 d!106089))

(assert (=> b!831604 d!105701))

(declare-fun d!106591 () Bool)

(declare-fun e!464382 () Bool)

(assert (=> d!106591 e!464382))

(declare-fun res!566376 () Bool)

(assert (=> d!106591 (=> res!566376 e!464382)))

(declare-fun lt!377733 () Bool)

(assert (=> d!106591 (= res!566376 (not lt!377733))))

(declare-fun lt!377732 () Bool)

(assert (=> d!106591 (= lt!377733 lt!377732)))

(declare-fun lt!377731 () Unit!28446)

(declare-fun e!464381 () Unit!28446)

(assert (=> d!106591 (= lt!377731 e!464381)))

(declare-fun c!90593 () Bool)

(assert (=> d!106591 (= c!90593 lt!377732)))

(assert (=> d!106591 (= lt!377732 (containsKey!401 (toList!4466 lt!377245) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!106591 (= (contains!4187 lt!377245 (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!377733)))

(declare-fun b!832609 () Bool)

(declare-fun lt!377734 () Unit!28446)

(assert (=> b!832609 (= e!464381 lt!377734)))

(assert (=> b!832609 (= lt!377734 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377245) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!832609 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377245) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!832610 () Bool)

(declare-fun Unit!28508 () Unit!28446)

(assert (=> b!832610 (= e!464381 Unit!28508)))

(declare-fun b!832611 () Bool)

(assert (=> b!832611 (= e!464382 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377245) (select (arr!22325 _keys!976) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))))

(assert (= (and d!106591 c!90593) b!832609))

(assert (= (and d!106591 (not c!90593)) b!832610))

(assert (= (and d!106591 (not res!566376)) b!832611))

(assert (=> d!106591 m!774867))

(declare-fun m!776895 () Bool)

(assert (=> d!106591 m!776895))

(assert (=> b!832609 m!774867))

(declare-fun m!776897 () Bool)

(assert (=> b!832609 m!776897))

(assert (=> b!832609 m!774867))

(assert (=> b!832609 m!776639))

(assert (=> b!832609 m!776639))

(declare-fun m!776899 () Bool)

(assert (=> b!832609 m!776899))

(assert (=> b!832611 m!774867))

(assert (=> b!832611 m!776639))

(assert (=> b!832611 m!776639))

(assert (=> b!832611 m!776899))

(assert (=> b!831347 d!106591))

(declare-fun d!106593 () Bool)

(declare-fun c!90594 () Bool)

(assert (=> d!106593 (= c!90594 ((_ is Nil!15843) (toList!4466 lt!377112)))))

(declare-fun e!464383 () (InoxSet tuple2!10076))

(assert (=> d!106593 (= (content!386 (toList!4466 lt!377112)) e!464383)))

(declare-fun b!832612 () Bool)

(assert (=> b!832612 (= e!464383 ((as const (Array tuple2!10076 Bool)) false))))

(declare-fun b!832613 () Bool)

(assert (=> b!832613 (= e!464383 ((_ map or) (store ((as const (Array tuple2!10076 Bool)) false) (h!16977 (toList!4466 lt!377112)) true) (content!386 (t!22203 (toList!4466 lt!377112)))))))

(assert (= (and d!106593 c!90594) b!832612))

(assert (= (and d!106593 (not c!90594)) b!832613))

(declare-fun m!776901 () Bool)

(assert (=> b!832613 m!776901))

(assert (=> b!832613 m!776401))

(assert (=> d!105773 d!106593))

(assert (=> b!831649 d!105953))

(assert (=> b!831476 d!106463))

(assert (=> b!831476 d!105867))

(declare-fun d!106595 () Bool)

(declare-fun lt!377735 () Bool)

(assert (=> d!106595 (= lt!377735 (select (content!386 (t!22203 (toList!4466 lt!377116))) lt!377010))))

(declare-fun e!464385 () Bool)

(assert (=> d!106595 (= lt!377735 e!464385)))

(declare-fun res!566377 () Bool)

(assert (=> d!106595 (=> (not res!566377) (not e!464385))))

(assert (=> d!106595 (= res!566377 ((_ is Cons!15842) (t!22203 (toList!4466 lt!377116))))))

(assert (=> d!106595 (= (contains!4188 (t!22203 (toList!4466 lt!377116)) lt!377010) lt!377735)))

(declare-fun b!832614 () Bool)

(declare-fun e!464384 () Bool)

(assert (=> b!832614 (= e!464385 e!464384)))

(declare-fun res!566378 () Bool)

(assert (=> b!832614 (=> res!566378 e!464384)))

(assert (=> b!832614 (= res!566378 (= (h!16977 (t!22203 (toList!4466 lt!377116))) lt!377010))))

(declare-fun b!832615 () Bool)

(assert (=> b!832615 (= e!464384 (contains!4188 (t!22203 (t!22203 (toList!4466 lt!377116))) lt!377010))))

(assert (= (and d!106595 res!566377) b!832614))

(assert (= (and b!832614 (not res!566378)) b!832615))

(assert (=> d!106595 m!776691))

(declare-fun m!776903 () Bool)

(assert (=> d!106595 m!776903))

(declare-fun m!776905 () Bool)

(assert (=> b!832615 m!776905))

(assert (=> b!831582 d!106595))

(assert (=> d!105735 d!105733))

(assert (=> d!105735 d!105755))

(declare-fun d!106597 () Bool)

(assert (=> d!106597 (contains!4187 (+!1988 lt!377190 (tuple2!10077 lt!377189 zeroValueAfter!34)) lt!377198)))

(assert (=> d!106597 true))

(declare-fun _$35!425 () Unit!28446)

(assert (=> d!106597 (= (choose!1425 lt!377190 lt!377189 zeroValueAfter!34 lt!377198) _$35!425)))

(declare-fun bs!23268 () Bool)

(assert (= bs!23268 d!106597))

(assert (=> bs!23268 m!774793))

(assert (=> bs!23268 m!774793))

(assert (=> bs!23268 m!774795))

(assert (=> d!105735 d!106597))

(declare-fun d!106599 () Bool)

(declare-fun e!464387 () Bool)

(assert (=> d!106599 e!464387))

(declare-fun res!566379 () Bool)

(assert (=> d!106599 (=> res!566379 e!464387)))

(declare-fun lt!377738 () Bool)

(assert (=> d!106599 (= res!566379 (not lt!377738))))

(declare-fun lt!377737 () Bool)

(assert (=> d!106599 (= lt!377738 lt!377737)))

(declare-fun lt!377736 () Unit!28446)

(declare-fun e!464386 () Unit!28446)

(assert (=> d!106599 (= lt!377736 e!464386)))

(declare-fun c!90595 () Bool)

(assert (=> d!106599 (= c!90595 lt!377737)))

(assert (=> d!106599 (= lt!377737 (containsKey!401 (toList!4466 lt!377190) lt!377198))))

(assert (=> d!106599 (= (contains!4187 lt!377190 lt!377198) lt!377738)))

(declare-fun b!832616 () Bool)

(declare-fun lt!377739 () Unit!28446)

(assert (=> b!832616 (= e!464386 lt!377739)))

(assert (=> b!832616 (= lt!377739 (lemmaContainsKeyImpliesGetValueByKeyDefined!310 (toList!4466 lt!377190) lt!377198))))

(assert (=> b!832616 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377190) lt!377198))))

(declare-fun b!832617 () Bool)

(declare-fun Unit!28509 () Unit!28446)

(assert (=> b!832617 (= e!464386 Unit!28509)))

(declare-fun b!832618 () Bool)

(assert (=> b!832618 (= e!464387 (isDefined!311 (getValueByKey!416 (toList!4466 lt!377190) lt!377198)))))

(assert (= (and d!106599 c!90595) b!832616))

(assert (= (and d!106599 (not c!90595)) b!832617))

(assert (= (and d!106599 (not res!566379)) b!832618))

(declare-fun m!776907 () Bool)

(assert (=> d!106599 m!776907))

(declare-fun m!776909 () Bool)

(assert (=> b!832616 m!776909))

(declare-fun m!776911 () Bool)

(assert (=> b!832616 m!776911))

(assert (=> b!832616 m!776911))

(declare-fun m!776913 () Bool)

(assert (=> b!832616 m!776913))

(assert (=> b!832618 m!776911))

(assert (=> b!832618 m!776911))

(assert (=> b!832618 m!776913))

(assert (=> d!105735 d!106599))

(declare-fun d!106601 () Bool)

(declare-fun res!566380 () Bool)

(declare-fun e!464388 () Bool)

(assert (=> d!106601 (=> res!566380 e!464388)))

(assert (=> d!106601 (= res!566380 (and ((_ is Cons!15842) (toList!4466 lt!377180)) (= (_1!5049 (h!16977 (toList!4466 lt!377180))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106601 (= (containsKey!401 (toList!4466 lt!377180) #b1000000000000000000000000000000000000000000000000000000000000000) e!464388)))

(declare-fun b!832619 () Bool)

(declare-fun e!464389 () Bool)

(assert (=> b!832619 (= e!464388 e!464389)))

(declare-fun res!566381 () Bool)

(assert (=> b!832619 (=> (not res!566381) (not e!464389))))

(assert (=> b!832619 (= res!566381 (and (or (not ((_ is Cons!15842) (toList!4466 lt!377180))) (bvsle (_1!5049 (h!16977 (toList!4466 lt!377180))) #b1000000000000000000000000000000000000000000000000000000000000000)) ((_ is Cons!15842) (toList!4466 lt!377180)) (bvslt (_1!5049 (h!16977 (toList!4466 lt!377180))) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!832620 () Bool)

(assert (=> b!832620 (= e!464389 (containsKey!401 (t!22203 (toList!4466 lt!377180)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!106601 (not res!566380)) b!832619))

(assert (= (and b!832619 res!566381) b!832620))

(declare-fun m!776915 () Bool)

(assert (=> b!832620 m!776915))

(assert (=> d!105689 d!106601))

(declare-fun b!832622 () Bool)

(declare-fun e!464390 () Option!422)

(declare-fun e!464391 () Option!422)

(assert (=> b!832622 (= e!464390 e!464391)))

(declare-fun c!90597 () Bool)

(assert (=> b!832622 (= c!90597 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377216))) (not (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377216)))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832623 () Bool)

(assert (=> b!832623 (= e!464391 (getValueByKey!416 (t!22203 (t!22203 (toList!4466 lt!377216))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!106603 () Bool)

(declare-fun c!90596 () Bool)

(assert (=> d!106603 (= c!90596 (and ((_ is Cons!15842) (t!22203 (toList!4466 lt!377216))) (= (_1!5049 (h!16977 (t!22203 (toList!4466 lt!377216)))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106603 (= (getValueByKey!416 (t!22203 (toList!4466 lt!377216)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464390)))

(declare-fun b!832621 () Bool)

(assert (=> b!832621 (= e!464390 (Some!421 (_2!5049 (h!16977 (t!22203 (toList!4466 lt!377216))))))))

(declare-fun b!832624 () Bool)

(assert (=> b!832624 (= e!464391 None!420)))

(assert (= (and d!106603 c!90596) b!832621))

(assert (= (and d!106603 (not c!90596)) b!832622))

(assert (= (and b!832622 c!90597) b!832623))

(assert (= (and b!832622 (not c!90597)) b!832624))

(declare-fun m!776917 () Bool)

(assert (=> b!832623 m!776917))

(assert (=> b!831644 d!106603))

(declare-fun d!106605 () Bool)

(declare-fun lt!377740 () Bool)

(assert (=> d!106605 (= lt!377740 (select (content!386 (t!22203 (toList!4466 lt!377208))) lt!377012))))

(declare-fun e!464393 () Bool)

(assert (=> d!106605 (= lt!377740 e!464393)))

(declare-fun res!566382 () Bool)

(assert (=> d!106605 (=> (not res!566382) (not e!464393))))

(assert (=> d!106605 (= res!566382 ((_ is Cons!15842) (t!22203 (toList!4466 lt!377208))))))

(assert (=> d!106605 (= (contains!4188 (t!22203 (toList!4466 lt!377208)) lt!377012) lt!377740)))

(declare-fun b!832625 () Bool)

(declare-fun e!464392 () Bool)

(assert (=> b!832625 (= e!464393 e!464392)))

(declare-fun res!566383 () Bool)

(assert (=> b!832625 (=> res!566383 e!464392)))

(assert (=> b!832625 (= res!566383 (= (h!16977 (t!22203 (toList!4466 lt!377208))) lt!377012))))

(declare-fun b!832626 () Bool)

(assert (=> b!832626 (= e!464392 (contains!4188 (t!22203 (t!22203 (toList!4466 lt!377208))) lt!377012))))

(assert (= (and d!106605 res!566382) b!832625))

(assert (= (and b!832625 (not res!566383)) b!832626))

(assert (=> d!106605 m!776735))

(declare-fun m!776919 () Bool)

(assert (=> d!106605 m!776919))

(declare-fun m!776921 () Bool)

(assert (=> b!832626 m!776921))

(assert (=> b!831441 d!106605))

(declare-fun b!832628 () Bool)

(declare-fun e!464394 () Option!422)

(declare-fun e!464395 () Option!422)

(assert (=> b!832628 (= e!464394 e!464395)))

(declare-fun c!90599 () Bool)

(assert (=> b!832628 (= c!90599 (and ((_ is Cons!15842) (t!22203 lt!377218)) (not (= (_1!5049 (h!16977 (t!22203 lt!377218))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))))

(declare-fun b!832629 () Bool)

(assert (=> b!832629 (= e!464395 (getValueByKey!416 (t!22203 (t!22203 lt!377218)) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun d!106607 () Bool)

(declare-fun c!90598 () Bool)

(assert (=> d!106607 (= c!90598 (and ((_ is Cons!15842) (t!22203 lt!377218)) (= (_1!5049 (h!16977 (t!22203 lt!377218))) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(assert (=> d!106607 (= (getValueByKey!416 (t!22203 lt!377218) (_1!5049 (tuple2!10077 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) e!464394)))

(declare-fun b!832627 () Bool)

(assert (=> b!832627 (= e!464394 (Some!421 (_2!5049 (h!16977 (t!22203 lt!377218)))))))

(declare-fun b!832630 () Bool)

(assert (=> b!832630 (= e!464395 None!420)))

(assert (= (and d!106607 c!90598) b!832627))

(assert (= (and d!106607 (not c!90598)) b!832628))

(assert (= (and b!832628 c!90599) b!832629))

(assert (= (and b!832628 (not c!90599)) b!832630))

(declare-fun m!776923 () Bool)

(assert (=> b!832629 m!776923))

(assert (=> b!831528 d!106607))

(declare-fun d!106609 () Bool)

(assert (=> d!106609 (= (get!11821 (getValueByKey!416 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754))) lt!377193)) (v!10095 (getValueByKey!416 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754))) lt!377193)))))

(assert (=> d!105753 d!106609))

(declare-fun b!832632 () Bool)

(declare-fun e!464396 () Option!422)

(declare-fun e!464397 () Option!422)

(assert (=> b!832632 (= e!464396 e!464397)))

(declare-fun c!90601 () Bool)

(assert (=> b!832632 (= c!90601 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)))) (not (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754))))) lt!377193))))))

(declare-fun b!832633 () Bool)

(assert (=> b!832633 (= e!464397 (getValueByKey!416 (t!22203 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)))) lt!377193))))

(declare-fun d!106611 () Bool)

(declare-fun c!90600 () Bool)

(assert (=> d!106611 (= c!90600 (and ((_ is Cons!15842) (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)))) (= (_1!5049 (h!16977 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754))))) lt!377193)))))

(assert (=> d!106611 (= (getValueByKey!416 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754))) lt!377193) e!464396)))

(declare-fun b!832631 () Bool)

(assert (=> b!832631 (= e!464396 (Some!421 (_2!5049 (h!16977 (toList!4466 (+!1988 lt!377204 (tuple2!10077 lt!377187 minValue!754)))))))))

(declare-fun b!832634 () Bool)

(assert (=> b!832634 (= e!464397 None!420)))

(assert (= (and d!106611 c!90600) b!832631))

(assert (= (and d!106611 (not c!90600)) b!832632))

(assert (= (and b!832632 c!90601) b!832633))

(assert (= (and b!832632 (not c!90601)) b!832634))

(declare-fun m!776925 () Bool)

(assert (=> b!832633 m!776925))

(assert (=> d!105753 d!106611))

(declare-fun d!106613 () Bool)

(declare-fun res!566384 () Bool)

(declare-fun e!464398 () Bool)

(assert (=> d!106613 (=> res!566384 e!464398)))

(assert (=> d!106613 (= res!566384 (and ((_ is Cons!15842) lt!377400) (= (_1!5049 (h!16977 lt!377400)) (_1!5049 lt!377012))))))

(assert (=> d!106613 (= (containsKey!401 lt!377400 (_1!5049 lt!377012)) e!464398)))

(declare-fun b!832635 () Bool)

(declare-fun e!464399 () Bool)

(assert (=> b!832635 (= e!464398 e!464399)))

(declare-fun res!566385 () Bool)

(assert (=> b!832635 (=> (not res!566385) (not e!464399))))

(assert (=> b!832635 (= res!566385 (and (or (not ((_ is Cons!15842) lt!377400)) (bvsle (_1!5049 (h!16977 lt!377400)) (_1!5049 lt!377012))) ((_ is Cons!15842) lt!377400) (bvslt (_1!5049 (h!16977 lt!377400)) (_1!5049 lt!377012))))))

(declare-fun b!832636 () Bool)

(assert (=> b!832636 (= e!464399 (containsKey!401 (t!22203 lt!377400) (_1!5049 lt!377012)))))

(assert (= (and d!106613 (not res!566384)) b!832635))

(assert (= (and b!832635 res!566385) b!832636))

(declare-fun m!776927 () Bool)

(assert (=> b!832636 m!776927))

(assert (=> b!831576 d!106613))

(declare-fun mapIsEmpty!24471 () Bool)

(declare-fun mapRes!24471 () Bool)

(assert (=> mapIsEmpty!24471 mapRes!24471))

(declare-fun b!832638 () Bool)

(declare-fun e!464401 () Bool)

(assert (=> b!832638 (= e!464401 tp_is_empty!15205)))

(declare-fun mapNonEmpty!24471 () Bool)

(declare-fun tp!47289 () Bool)

(declare-fun e!464400 () Bool)

(assert (=> mapNonEmpty!24471 (= mapRes!24471 (and tp!47289 e!464400))))

(declare-fun mapRest!24471 () (Array (_ BitVec 32) ValueCell!7187))

(declare-fun mapKey!24471 () (_ BitVec 32))

(declare-fun mapValue!24471 () ValueCell!7187)

(assert (=> mapNonEmpty!24471 (= mapRest!24470 (store mapRest!24471 mapKey!24471 mapValue!24471))))

(declare-fun condMapEmpty!24471 () Bool)

(declare-fun mapDefault!24471 () ValueCell!7187)

(assert (=> mapNonEmpty!24470 (= condMapEmpty!24471 (= mapRest!24470 ((as const (Array (_ BitVec 32) ValueCell!7187)) mapDefault!24471)))))

(assert (=> mapNonEmpty!24470 (= tp!47288 (and e!464401 mapRes!24471))))

(declare-fun b!832637 () Bool)

(assert (=> b!832637 (= e!464400 tp_is_empty!15205)))

(assert (= (and mapNonEmpty!24470 condMapEmpty!24471) mapIsEmpty!24471))

(assert (= (and mapNonEmpty!24470 (not condMapEmpty!24471)) mapNonEmpty!24471))

(assert (= (and mapNonEmpty!24471 ((_ is ValueCellFull!7187) mapValue!24471)) b!832637))

(assert (= (and mapNonEmpty!24470 ((_ is ValueCellFull!7187) mapDefault!24471)) b!832638))

(declare-fun m!776929 () Bool)

(assert (=> mapNonEmpty!24471 m!776929))

(declare-fun b_lambda!11409 () Bool)

(assert (= b_lambda!11403 (or (and start!71652 b_free!13495) b_lambda!11409)))

(declare-fun b_lambda!11411 () Bool)

(assert (= b_lambda!11401 (or (and start!71652 b_free!13495) b_lambda!11411)))

(declare-fun b_lambda!11413 () Bool)

(assert (= b_lambda!11405 (or (and start!71652 b_free!13495) b_lambda!11413)))

(declare-fun b_lambda!11415 () Bool)

(assert (= b_lambda!11407 (or (and start!71652 b_free!13495) b_lambda!11415)))

(check-sat (not b_lambda!11411) (not b!832189) (not b!832165) (not d!105979) (not d!106155) (not d!105919) (not b!832436) (not d!106003) (not b!832235) (not d!105987) (not b!832607) (not b!832567) (not b!832579) (not d!106005) (not b!832609) (not b!832170) (not b!832593) (not bm!36341) (not b!832363) (not d!106017) (not b!832469) (not b!832492) (not d!106133) (not b!832289) (not b!831732) (not d!106555) (not b!832272) (not b!832290) (not b!832519) (not b!832193) (not b!832026) (not b!832056) (not bm!36376) (not b!831814) (not b!832429) (not b!832063) (not b!831959) (not d!106357) (not b!832276) (not bm!36349) (not b!832302) (not b!832047) (not b!831879) (not b!832616) (not d!106559) (not b_lambda!11373) (not b!831677) (not b!832171) (not b!832224) (not b!832377) (not b!832386) (not b!832560) (not b!832057) (not b!831946) (not b!831918) (not b!832586) (not d!106219) (not b!832002) (not b_lambda!11409) (not b!831824) (not b!832337) (not b!832572) (not d!106089) (not d!106573) (not b!832552) (not b!832406) (not b!832089) (not b!831855) (not b!831699) (not b!831852) (not b!831914) (not b!831862) (not b!832382) (not b!832447) (not bm!36348) (not d!106505) (not b!831881) (not b!831818) (not d!106421) (not b!832303) (not d!106285) (not b!832202) (not b!832451) (not b!832592) (not d!106539) (not b!832163) (not b!831844) (not b!831866) (not b!832061) (not b!832297) (not b!831909) (not bm!36382) (not b!831977) (not b!832462) (not d!106095) (not b!832191) (not bm!36331) (not b!832578) (not d!106257) (not mapNonEmpty!24471) (not b!831743) (not b!832636) (not b!832375) (not b!832533) (not b!831837) (not b!832300) (not d!106117) (not b!832008) (not d!106329) (not b!832245) (not d!106323) (not b!832512) (not b!831978) b_and!22567 (not b!832324) (not b!831695) (not d!106503) (not b!832361) (not b!832466) (not b!832101) (not b_lambda!11397) (not d!106063) (not b!832540) (not b!831793) (not b!832103) (not d!106591) (not b!831993) (not b!832176) (not b!832050) (not b!831691) (not d!106565) (not b!832553) (not d!106443) (not b!831971) (not b!832431) (not b!831745) (not b!831828) (not b!831774) (not d!106445) (not b!832531) (not bm!36340) (not d!106369) (not b!832506) (not b!832219) (not b!831728) (not d!105989) (not d!106161) (not b!831825) (not b!832600) (not b!831791) (not b!831907) (not b!832311) (not b!832355) (not b!831957) (not b!832149) (not b!832440) (not b!832573) (not b!831936) (not b!832480) (not d!106243) (not d!106129) (not d!106511) (not b!832369) (not d!106275) (not b!832474) (not b!831876) (not b!832539) (not d!106507) (not b!832162) (not b!832246) (not d!106163) (not b!832016) (not b!832262) (not b!831931) (not b!832019) (not d!106489) (not d!106345) (not b!831929) (not b!832323) (not b!832005) (not b!831786) (not b!832464) (not d!106195) (not b!832360) (not b!831868) (not b!832549) (not b!832563) (not b!832094) (not b!832316) (not d!106341) (not d!106169) (not d!106037) (not b!832124) (not b!831736) (not b!832261) (not b!831954) (not b!831889) (not b!831724) (not d!106303) (not d!106405) (not d!105945) (not b!831713) (not d!106175) (not b!832620) (not b!831826) (not d!106541) (not b!832111) (not b!831972) (not d!106343) (not b!831856) (not d!106141) (not b!832438) (not b!832214) (not b!831894) (not d!106327) (not b!832494) (not d!106185) (not b_lambda!11381) (not d!106417) (not b!831950) (not bm!36355) (not b!832212) (not b!832608) (not b!831722) (not b!832565) (not b!831980) (not b!832546) (not b!832088) (not d!106067) (not d!106071) (not b!832014) (not b!831943) (not d!106375) (not b!832458) (not b!832345) (not d!106055) (not b_lambda!11395) (not b!831811) (not bm!36358) (not bm!36364) (not b!831903) (not d!106035) (not bm!36397) (not d!105983) (not d!106561) (not d!106171) (not d!106385) (not b!832467) (not b!832490) (not b!831988) (not b!831831) (not b!831725) (not b!832098) (not b!832349) (not b!831681) (not d!106413) (not b!832399) (not b!832475) (not b!832515) (not b!832430) (not d!106051) (not b!831780) (not d!106361) (not b!832457) (not b!832071) (not b!831897) (not d!106527) (not b!832195) (not b!832358) (not b!832526) (not b!832254) (not d!106605) (not d!105913) (not b!832615) (not d!106205) (not bm!36370) (not d!106389) (not d!106437) (not d!106533) (not b!831849) (not b!832357) (not b!832413) (not b!832034) (not b!832041) (not d!106599) (not b!831822) (not b!831777) (not d!106465) (not b!832487) (not d!106281) (not b!832013) (not d!106165) (not b!832199) (not b!831804) (not b!832059) (not b!832400) (not d!106331) (not d!106535) (not b!832264) (not d!106353) (not d!106579) (not d!106157) (not b!831864) (not b!831974) (not d!106391) (not b!832086) (not d!105935) (not b!831997) (not d!106135) (not b!831966) (not b!832501) (not b!832453) (not d!106069) (not d!106297) (not b!831799) (not d!106287) (not d!106475) (not d!106225) (not b!832243) (not b!832206) (not b!832397) (not b!832269) (not b_lambda!11379) (not b!832309) (not d!106423) (not d!106079) (not b!832390) (not d!106365) (not b!832130) (not d!106305) (not b!832065) (not b!831975) (not b!832424) (not d!106319) (not d!106207) (not d!105973) (not b!831820) (not b!832066) (not b!832197) (not b!831771) (not d!106097) (not b!831901) (not b!832282) (not b!832513) (not d!106309) (not b!832507) (not b!832000) (not b!832497) (not d!106191) (not d!105997) (not d!106337) (not b!832108) (not d!106253) (not d!106569) (not d!106483) (not d!106077) (not b_lambda!11377) (not b!832240) (not b!832119) (not d!106251) (not b!832455) (not d!106227) (not b!831933) (not b!832295) (not b!831887) (not d!106321) (not b!832523) (not d!106317) (not d!106381) (not b!832168) (not b!831915) (not d!106083) (not b!832029) (not bm!36379) (not d!106053) (not d!106481) (not b!832274) (not b!831962) (not b!832150) (not b!832226) (not d!106091) (not b!832238) (not b!832179) (not b!832117) (not b!832581) (not b!831989) (not b!832221) (not b!831986) (not b!831940) (not b!832449) (not d!105911) (not b!832481) (not b!832318) (not b_lambda!11393) (not b!832558) (not b!832332) (not b!832080) (not d!106015) (not d!106143) (not b!831789) (not b!831982) (not d!106397) (not d!106001) (not b!831911) (not d!106575) (not d!106131) (not b!832394) (not b!832613) (not b_next!13495) (not d!106075) (not b!832472) (not b!831998) (not b!831796) (not b!831895) (not d!106547) (not b!832595) (not b!831924) (not d!106453) (not b!832405) (not b!832137) (not b!831916) (not b!832423) (not bm!36361) (not b!831919) (not b!831990) (not b!832428) (not d!106261) (not b!831827) (not d!106049) (not b!832077) (not d!106597) (not b_lambda!11399) (not b!832368) (not b!832042) (not b!831840) (not b!832134) (not b!832232) (not d!106291) (not b!832434) (not b!832097) (not d!106513) (not bm!36400) (not d!106589) (not bm!36345) (not bm!36391) (not b!832418) (not b!832155) (not b!832315) (not b_lambda!11413) (not b!832177) (not b!832031) (not b!832408) (not b!832069) (not b!832353) (not b!832127) (not d!105955) (not bm!36367) (not b!832411) (not b!831798) (not b!831874) (not bm!36334) (not d!106351) (not d!106467) (not d!106057) (not b!832555) (not d!106153) (not b!832187) (not b!832110) (not b!832392) (not d!106263) (not b!831913) (not b!831688) (not d!106087) (not d!106245) (not bm!36385) (not d!106029) (not b!832033) (not d!106379) (not b!832156) (not b_lambda!11375) (not b!831992) (not b!832329) (not bm!36342) (not b!831807) (not d!105943) (not b!832629) (not d!105995) (not b!832158) (not b!832489) (not d!106187) (not d!106081) (not b!831923) (not d!106595) (not d!106477) (not b!831835) (not b_lambda!11383) (not bm!36352) (not b!832416) (not d!105963) (not b!831720) (not b!831823) (not b!832542) (not b!832139) (not b!831905) (not d!106531) (not b!832366) (not b!832444) (not d!106197) (not b!832618) (not d!106221) (not b!832611) (not d!106441) (not b!832534) (not b!832185) (not b!832421) (not d!106295) (not d!106499) (not b!832084) (not d!105971) (not b!832233) (not b!831987) (not d!106471) (not b!832292) (not bm!36337) (not b!832147) (not b!832091) (not d!106121) (not b!831983) (not bm!36394) (not b_lambda!11415) (not b!832198) (not b!831817) (not d!106493) (not d!105931) (not b!832141) (not b!832116) (not b!832204) (not b!832603) (not b!832623) (not b!832308) (not b!832499) (not d!106463) (not d!106469) (not d!106209) (not b!832074) (not b!831847) tp_is_empty!15205 (not b!831884) (not b!832211) (not b!832054) (not b!832251) (not d!106151) (not b!832426) (not d!106461) (not d!106451) (not b!831873) (not d!106007) (not d!106301) (not b!832142) (not b!832144) (not b!832342) (not b!831999) (not bm!36388) (not d!106587) (not d!106211) (not d!106545) (not b!832218) (not b!832036) (not b!831812) (not d!106159) (not b!832441) (not b!832626) (not d!106557) (not b!831925) (not b!832105) (not b!832278) (not b!832048) (not b!832330) (not b!832504) (not b!831969) (not b!832460) (not d!106193) (not d!105937) (not b!832605) (not b!832039) (not b!832340) (not b!832227) (not b!832321) (not d!106409) (not d!105991) (not d!106173) (not b!831776) (not b!831805) (not d!106349) (not b!832022) (not d!106519) (not b!832570) (not b!832374) (not b!832252) (not b!832007) (not b!832528) (not d!106313) (not b!831984) (not b!832284) (not b!832483) (not d!106139) (not b!832183) (not d!105985) (not b!832633) (not b!831674) (not b!832280) (not d!106371) (not bm!36373) (not d!106411) (not b!831927) (not b!831859))
(check-sat b_and!22567 (not b_next!13495))
