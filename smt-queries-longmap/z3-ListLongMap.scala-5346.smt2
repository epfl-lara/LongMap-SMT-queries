; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71440 () Bool)

(assert start!71440)

(declare-fun b_free!13485 () Bool)

(declare-fun b_next!13485 () Bool)

(assert (=> start!71440 (= b_free!13485 (not b_next!13485))))

(declare-fun tp!47236 () Bool)

(declare-fun b_and!22491 () Bool)

(assert (=> start!71440 (= tp!47236 b_and!22491)))

(declare-fun b!829674 () Bool)

(declare-fun e!462503 () Bool)

(declare-fun tp_is_empty!15195 () Bool)

(assert (=> b!829674 (= e!462503 tp_is_empty!15195)))

(declare-fun b!829675 () Bool)

(declare-fun e!462504 () Bool)

(assert (=> b!829675 (= e!462504 tp_is_empty!15195)))

(declare-fun b!829676 () Bool)

(declare-fun res!565176 () Bool)

(declare-fun e!462500 () Bool)

(assert (=> b!829676 (=> (not res!565176) (not e!462500))))

(declare-datatypes ((array!46556 0))(
  ( (array!46557 (arr!22316 (Array (_ BitVec 32) (_ BitVec 64))) (size!22737 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46556)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25261 0))(
  ( (V!25262 (val!7645 Int)) )
))
(declare-datatypes ((ValueCell!7182 0))(
  ( (ValueCellFull!7182 (v!10085 V!25261)) (EmptyCell!7182) )
))
(declare-datatypes ((array!46558 0))(
  ( (array!46559 (arr!22317 (Array (_ BitVec 32) ValueCell!7182)) (size!22738 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46558)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!829676 (= res!565176 (and (= (size!22738 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22737 _keys!976) (size!22738 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!829677 () Bool)

(declare-fun res!565175 () Bool)

(assert (=> b!829677 (=> (not res!565175) (not e!462500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46556 (_ BitVec 32)) Bool)

(assert (=> b!829677 (= res!565175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!565178 () Bool)

(assert (=> start!71440 (=> (not res!565178) (not e!462500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71440 (= res!565178 (validMask!0 mask!1312))))

(assert (=> start!71440 e!462500))

(assert (=> start!71440 tp_is_empty!15195))

(declare-fun array_inv!17773 (array!46556) Bool)

(assert (=> start!71440 (array_inv!17773 _keys!976)))

(assert (=> start!71440 true))

(declare-fun e!462501 () Bool)

(declare-fun array_inv!17774 (array!46558) Bool)

(assert (=> start!71440 (and (array_inv!17774 _values!788) e!462501)))

(assert (=> start!71440 tp!47236))

(declare-fun mapNonEmpty!24439 () Bool)

(declare-fun mapRes!24439 () Bool)

(declare-fun tp!47235 () Bool)

(assert (=> mapNonEmpty!24439 (= mapRes!24439 (and tp!47235 e!462504))))

(declare-fun mapRest!24439 () (Array (_ BitVec 32) ValueCell!7182))

(declare-fun mapKey!24439 () (_ BitVec 32))

(declare-fun mapValue!24439 () ValueCell!7182)

(assert (=> mapNonEmpty!24439 (= (arr!22317 _values!788) (store mapRest!24439 mapKey!24439 mapValue!24439))))

(declare-fun b!829678 () Bool)

(declare-fun res!565177 () Bool)

(assert (=> b!829678 (=> (not res!565177) (not e!462500))))

(declare-datatypes ((List!15933 0))(
  ( (Nil!15930) (Cons!15929 (h!17058 (_ BitVec 64)) (t!22294 List!15933)) )
))
(declare-fun arrayNoDuplicates!0 (array!46556 (_ BitVec 32) List!15933) Bool)

(assert (=> b!829678 (= res!565177 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15930))))

(declare-fun zeroValueBefore!34 () V!25261)

(declare-datatypes ((tuple2!10140 0))(
  ( (tuple2!10141 (_1!5081 (_ BitVec 64)) (_2!5081 V!25261)) )
))
(declare-datatypes ((List!15934 0))(
  ( (Nil!15931) (Cons!15930 (h!17059 tuple2!10140) (t!22295 List!15934)) )
))
(declare-datatypes ((ListLongMap!8963 0))(
  ( (ListLongMap!8964 (toList!4497 List!15934)) )
))
(declare-fun lt!376306 () ListLongMap!8963)

(declare-fun minValue!754 () V!25261)

(declare-fun e!462502 () Bool)

(declare-fun defaultEntry!796 () Int)

(declare-fun b!829679 () Bool)

(declare-fun getCurrentListMap!2594 (array!46556 array!46558 (_ BitVec 32) (_ BitVec 32) V!25261 V!25261 (_ BitVec 32) Int) ListLongMap!8963)

(declare-fun +!1976 (ListLongMap!8963 tuple2!10140) ListLongMap!8963)

(assert (=> b!829679 (= e!462502 (= (getCurrentListMap!2594 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1976 (+!1976 lt!376306 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376305 () ListLongMap!8963)

(declare-fun zeroValueAfter!34 () V!25261)

(assert (=> b!829679 (= lt!376305 (getCurrentListMap!2594 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829680 () Bool)

(assert (=> b!829680 (= e!462501 (and e!462503 mapRes!24439))))

(declare-fun condMapEmpty!24439 () Bool)

(declare-fun mapDefault!24439 () ValueCell!7182)

(assert (=> b!829680 (= condMapEmpty!24439 (= (arr!22317 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7182)) mapDefault!24439)))))

(declare-fun mapIsEmpty!24439 () Bool)

(assert (=> mapIsEmpty!24439 mapRes!24439))

(declare-fun b!829681 () Bool)

(assert (=> b!829681 (= e!462500 (not e!462502))))

(declare-fun res!565174 () Bool)

(assert (=> b!829681 (=> res!565174 e!462502)))

(assert (=> b!829681 (= res!565174 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!376303 () ListLongMap!8963)

(assert (=> b!829681 (= lt!376306 lt!376303)))

(declare-datatypes ((Unit!28415 0))(
  ( (Unit!28416) )
))
(declare-fun lt!376304 () Unit!28415)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!584 (array!46556 array!46558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25261 V!25261 V!25261 V!25261 (_ BitVec 32) Int) Unit!28415)

(assert (=> b!829681 (= lt!376304 (lemmaNoChangeToArrayThenSameMapNoExtras!584 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2496 (array!46556 array!46558 (_ BitVec 32) (_ BitVec 32) V!25261 V!25261 (_ BitVec 32) Int) ListLongMap!8963)

(assert (=> b!829681 (= lt!376303 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!829681 (= lt!376306 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71440 res!565178) b!829676))

(assert (= (and b!829676 res!565176) b!829677))

(assert (= (and b!829677 res!565175) b!829678))

(assert (= (and b!829678 res!565177) b!829681))

(assert (= (and b!829681 (not res!565174)) b!829679))

(assert (= (and b!829680 condMapEmpty!24439) mapIsEmpty!24439))

(assert (= (and b!829680 (not condMapEmpty!24439)) mapNonEmpty!24439))

(get-info :version)

(assert (= (and mapNonEmpty!24439 ((_ is ValueCellFull!7182) mapValue!24439)) b!829675))

(assert (= (and b!829680 ((_ is ValueCellFull!7182) mapDefault!24439)) b!829674))

(assert (= start!71440 b!829680))

(declare-fun m!772697 () Bool)

(assert (=> start!71440 m!772697))

(declare-fun m!772699 () Bool)

(assert (=> start!71440 m!772699))

(declare-fun m!772701 () Bool)

(assert (=> start!71440 m!772701))

(declare-fun m!772703 () Bool)

(assert (=> b!829679 m!772703))

(declare-fun m!772705 () Bool)

(assert (=> b!829679 m!772705))

(assert (=> b!829679 m!772705))

(declare-fun m!772707 () Bool)

(assert (=> b!829679 m!772707))

(declare-fun m!772709 () Bool)

(assert (=> b!829679 m!772709))

(declare-fun m!772711 () Bool)

(assert (=> b!829678 m!772711))

(declare-fun m!772713 () Bool)

(assert (=> b!829681 m!772713))

(declare-fun m!772715 () Bool)

(assert (=> b!829681 m!772715))

(declare-fun m!772717 () Bool)

(assert (=> b!829681 m!772717))

(declare-fun m!772719 () Bool)

(assert (=> b!829677 m!772719))

(declare-fun m!772721 () Bool)

(assert (=> mapNonEmpty!24439 m!772721))

(check-sat (not start!71440) (not b!829677) (not b_next!13485) (not b!829681) (not mapNonEmpty!24439) tp_is_empty!15195 (not b!829679) b_and!22491 (not b!829678))
(check-sat b_and!22491 (not b_next!13485))
(get-model)

(declare-fun b!829748 () Bool)

(declare-fun e!462555 () Bool)

(declare-fun e!462556 () Bool)

(assert (=> b!829748 (= e!462555 e!462556)))

(declare-fun res!565216 () Bool)

(declare-fun call!36163 () Bool)

(assert (=> b!829748 (= res!565216 call!36163)))

(assert (=> b!829748 (=> (not res!565216) (not e!462556))))

(declare-fun b!829749 () Bool)

(declare-fun e!462558 () ListLongMap!8963)

(declare-fun call!36164 () ListLongMap!8963)

(assert (=> b!829749 (= e!462558 call!36164)))

(declare-fun bm!36159 () Bool)

(declare-fun lt!376369 () ListLongMap!8963)

(declare-fun contains!4202 (ListLongMap!8963 (_ BitVec 64)) Bool)

(assert (=> bm!36159 (= call!36163 (contains!4202 lt!376369 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829750 () Bool)

(declare-fun e!462562 () Bool)

(declare-fun call!36166 () Bool)

(assert (=> b!829750 (= e!462562 (not call!36166))))

(declare-fun b!829751 () Bool)

(declare-fun e!462551 () ListLongMap!8963)

(declare-fun call!36167 () ListLongMap!8963)

(assert (=> b!829751 (= e!462551 (+!1976 call!36167 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829752 () Bool)

(declare-fun res!565214 () Bool)

(declare-fun e!462560 () Bool)

(assert (=> b!829752 (=> (not res!565214) (not e!462560))))

(declare-fun e!462559 () Bool)

(assert (=> b!829752 (= res!565214 e!462559)))

(declare-fun res!565215 () Bool)

(assert (=> b!829752 (=> res!565215 e!462559)))

(declare-fun e!462557 () Bool)

(assert (=> b!829752 (= res!565215 (not e!462557))))

(declare-fun res!565218 () Bool)

(assert (=> b!829752 (=> (not res!565218) (not e!462557))))

(assert (=> b!829752 (= res!565218 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829753 () Bool)

(declare-fun e!462561 () ListLongMap!8963)

(assert (=> b!829753 (= e!462561 call!36164)))

(declare-fun b!829754 () Bool)

(declare-fun res!565212 () Bool)

(assert (=> b!829754 (=> (not res!565212) (not e!462560))))

(assert (=> b!829754 (= res!565212 e!462562)))

(declare-fun c!89791 () Bool)

(assert (=> b!829754 (= c!89791 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36160 () Bool)

(assert (=> bm!36160 (= call!36164 call!36167)))

(declare-fun b!829755 () Bool)

(declare-fun e!462554 () Bool)

(declare-fun apply!370 (ListLongMap!8963 (_ BitVec 64)) V!25261)

(assert (=> b!829755 (= e!462554 (= (apply!370 lt!376369 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!829756 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!829756 (= e!462557 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36161 () Bool)

(assert (=> bm!36161 (= call!36166 (contains!4202 lt!376369 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829757 () Bool)

(assert (=> b!829757 (= e!462551 e!462561)))

(declare-fun c!89789 () Bool)

(assert (=> b!829757 (= c!89789 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829758 () Bool)

(declare-fun e!462552 () Unit!28415)

(declare-fun lt!376376 () Unit!28415)

(assert (=> b!829758 (= e!462552 lt!376376)))

(declare-fun lt!376378 () ListLongMap!8963)

(assert (=> b!829758 (= lt!376378 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376372 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376372 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376379 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376379 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376375 () Unit!28415)

(declare-fun addStillContains!321 (ListLongMap!8963 (_ BitVec 64) V!25261 (_ BitVec 64)) Unit!28415)

(assert (=> b!829758 (= lt!376375 (addStillContains!321 lt!376378 lt!376372 zeroValueBefore!34 lt!376379))))

(assert (=> b!829758 (contains!4202 (+!1976 lt!376378 (tuple2!10141 lt!376372 zeroValueBefore!34)) lt!376379)))

(declare-fun lt!376382 () Unit!28415)

(assert (=> b!829758 (= lt!376382 lt!376375)))

(declare-fun lt!376371 () ListLongMap!8963)

(assert (=> b!829758 (= lt!376371 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376365 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376365 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376374 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376374 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376370 () Unit!28415)

(declare-fun addApplyDifferent!321 (ListLongMap!8963 (_ BitVec 64) V!25261 (_ BitVec 64)) Unit!28415)

(assert (=> b!829758 (= lt!376370 (addApplyDifferent!321 lt!376371 lt!376365 minValue!754 lt!376374))))

(assert (=> b!829758 (= (apply!370 (+!1976 lt!376371 (tuple2!10141 lt!376365 minValue!754)) lt!376374) (apply!370 lt!376371 lt!376374))))

(declare-fun lt!376373 () Unit!28415)

(assert (=> b!829758 (= lt!376373 lt!376370)))

(declare-fun lt!376377 () ListLongMap!8963)

(assert (=> b!829758 (= lt!376377 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376381 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376381 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376367 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376367 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376364 () Unit!28415)

(assert (=> b!829758 (= lt!376364 (addApplyDifferent!321 lt!376377 lt!376381 zeroValueBefore!34 lt!376367))))

(assert (=> b!829758 (= (apply!370 (+!1976 lt!376377 (tuple2!10141 lt!376381 zeroValueBefore!34)) lt!376367) (apply!370 lt!376377 lt!376367))))

(declare-fun lt!376380 () Unit!28415)

(assert (=> b!829758 (= lt!376380 lt!376364)))

(declare-fun lt!376366 () ListLongMap!8963)

(assert (=> b!829758 (= lt!376366 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376383 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376383 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376384 () (_ BitVec 64))

(assert (=> b!829758 (= lt!376384 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829758 (= lt!376376 (addApplyDifferent!321 lt!376366 lt!376383 minValue!754 lt!376384))))

(assert (=> b!829758 (= (apply!370 (+!1976 lt!376366 (tuple2!10141 lt!376383 minValue!754)) lt!376384) (apply!370 lt!376366 lt!376384))))

(declare-fun b!829759 () Bool)

(declare-fun Unit!28417 () Unit!28415)

(assert (=> b!829759 (= e!462552 Unit!28417)))

(declare-fun b!829760 () Bool)

(assert (=> b!829760 (= e!462555 (not call!36163))))

(declare-fun call!36165 () ListLongMap!8963)

(declare-fun call!36161 () ListLongMap!8963)

(declare-fun bm!36158 () Bool)

(declare-fun call!36162 () ListLongMap!8963)

(declare-fun c!89792 () Bool)

(assert (=> bm!36158 (= call!36167 (+!1976 (ite c!89792 call!36165 (ite c!89789 call!36161 call!36162)) (ite (or c!89792 c!89789) (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!105281 () Bool)

(assert (=> d!105281 e!462560))

(declare-fun res!565213 () Bool)

(assert (=> d!105281 (=> (not res!565213) (not e!462560))))

(assert (=> d!105281 (= res!565213 (or (bvsge #b00000000000000000000000000000000 (size!22737 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))))

(declare-fun lt!376363 () ListLongMap!8963)

(assert (=> d!105281 (= lt!376369 lt!376363)))

(declare-fun lt!376368 () Unit!28415)

(assert (=> d!105281 (= lt!376368 e!462552)))

(declare-fun c!89787 () Bool)

(declare-fun e!462550 () Bool)

(assert (=> d!105281 (= c!89787 e!462550)))

(declare-fun res!565219 () Bool)

(assert (=> d!105281 (=> (not res!565219) (not e!462550))))

(assert (=> d!105281 (= res!565219 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> d!105281 (= lt!376363 e!462551)))

(assert (=> d!105281 (= c!89792 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105281 (validMask!0 mask!1312)))

(assert (=> d!105281 (= (getCurrentListMap!2594 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376369)))

(declare-fun b!829761 () Bool)

(declare-fun e!462553 () Bool)

(assert (=> b!829761 (= e!462559 e!462553)))

(declare-fun res!565220 () Bool)

(assert (=> b!829761 (=> (not res!565220) (not e!462553))))

(assert (=> b!829761 (= res!565220 (contains!4202 lt!376369 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829761 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun bm!36162 () Bool)

(assert (=> bm!36162 (= call!36161 call!36165)))

(declare-fun b!829762 () Bool)

(declare-fun get!11811 (ValueCell!7182 V!25261) V!25261)

(declare-fun dynLambda!981 (Int (_ BitVec 64)) V!25261)

(assert (=> b!829762 (= e!462553 (= (apply!370 lt!376369 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)) (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829762 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22738 _values!788)))))

(assert (=> b!829762 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829763 () Bool)

(assert (=> b!829763 (= e!462560 e!462555)))

(declare-fun c!89790 () Bool)

(assert (=> b!829763 (= c!89790 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36163 () Bool)

(assert (=> bm!36163 (= call!36162 call!36161)))

(declare-fun bm!36164 () Bool)

(assert (=> bm!36164 (= call!36165 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829764 () Bool)

(assert (=> b!829764 (= e!462550 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829765 () Bool)

(assert (=> b!829765 (= e!462562 e!462554)))

(declare-fun res!565217 () Bool)

(assert (=> b!829765 (= res!565217 call!36166)))

(assert (=> b!829765 (=> (not res!565217) (not e!462554))))

(declare-fun b!829766 () Bool)

(declare-fun c!89788 () Bool)

(assert (=> b!829766 (= c!89788 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829766 (= e!462561 e!462558)))

(declare-fun b!829767 () Bool)

(assert (=> b!829767 (= e!462556 (= (apply!370 lt!376369 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829768 () Bool)

(assert (=> b!829768 (= e!462558 call!36162)))

(assert (= (and d!105281 c!89792) b!829751))

(assert (= (and d!105281 (not c!89792)) b!829757))

(assert (= (and b!829757 c!89789) b!829753))

(assert (= (and b!829757 (not c!89789)) b!829766))

(assert (= (and b!829766 c!89788) b!829749))

(assert (= (and b!829766 (not c!89788)) b!829768))

(assert (= (or b!829749 b!829768) bm!36163))

(assert (= (or b!829753 bm!36163) bm!36162))

(assert (= (or b!829753 b!829749) bm!36160))

(assert (= (or b!829751 bm!36162) bm!36164))

(assert (= (or b!829751 bm!36160) bm!36158))

(assert (= (and d!105281 res!565219) b!829764))

(assert (= (and d!105281 c!89787) b!829758))

(assert (= (and d!105281 (not c!89787)) b!829759))

(assert (= (and d!105281 res!565213) b!829752))

(assert (= (and b!829752 res!565218) b!829756))

(assert (= (and b!829752 (not res!565215)) b!829761))

(assert (= (and b!829761 res!565220) b!829762))

(assert (= (and b!829752 res!565214) b!829754))

(assert (= (and b!829754 c!89791) b!829765))

(assert (= (and b!829754 (not c!89791)) b!829750))

(assert (= (and b!829765 res!565217) b!829755))

(assert (= (or b!829765 b!829750) bm!36161))

(assert (= (and b!829754 res!565212) b!829763))

(assert (= (and b!829763 c!89790) b!829748))

(assert (= (and b!829763 (not c!89790)) b!829760))

(assert (= (and b!829748 res!565216) b!829767))

(assert (= (or b!829748 b!829760) bm!36159))

(declare-fun b_lambda!11299 () Bool)

(assert (=> (not b_lambda!11299) (not b!829762)))

(declare-fun t!22298 () Bool)

(declare-fun tb!4221 () Bool)

(assert (=> (and start!71440 (= defaultEntry!796 defaultEntry!796) t!22298) tb!4221))

(declare-fun result!8003 () Bool)

(assert (=> tb!4221 (= result!8003 tp_is_empty!15195)))

(assert (=> b!829762 t!22298))

(declare-fun b_and!22495 () Bool)

(assert (= b_and!22491 (and (=> t!22298 result!8003) b_and!22495)))

(assert (=> d!105281 m!772697))

(assert (=> b!829758 m!772717))

(declare-fun m!772749 () Bool)

(assert (=> b!829758 m!772749))

(declare-fun m!772751 () Bool)

(assert (=> b!829758 m!772751))

(declare-fun m!772753 () Bool)

(assert (=> b!829758 m!772753))

(declare-fun m!772755 () Bool)

(assert (=> b!829758 m!772755))

(declare-fun m!772757 () Bool)

(assert (=> b!829758 m!772757))

(declare-fun m!772759 () Bool)

(assert (=> b!829758 m!772759))

(declare-fun m!772761 () Bool)

(assert (=> b!829758 m!772761))

(assert (=> b!829758 m!772755))

(declare-fun m!772763 () Bool)

(assert (=> b!829758 m!772763))

(assert (=> b!829758 m!772759))

(declare-fun m!772765 () Bool)

(assert (=> b!829758 m!772765))

(declare-fun m!772767 () Bool)

(assert (=> b!829758 m!772767))

(declare-fun m!772769 () Bool)

(assert (=> b!829758 m!772769))

(declare-fun m!772771 () Bool)

(assert (=> b!829758 m!772771))

(declare-fun m!772773 () Bool)

(assert (=> b!829758 m!772773))

(declare-fun m!772775 () Bool)

(assert (=> b!829758 m!772775))

(declare-fun m!772777 () Bool)

(assert (=> b!829758 m!772777))

(assert (=> b!829758 m!772767))

(declare-fun m!772779 () Bool)

(assert (=> b!829758 m!772779))

(assert (=> b!829758 m!772771))

(assert (=> b!829756 m!772751))

(assert (=> b!829756 m!772751))

(declare-fun m!772781 () Bool)

(assert (=> b!829756 m!772781))

(declare-fun m!772783 () Bool)

(assert (=> b!829767 m!772783))

(declare-fun m!772785 () Bool)

(assert (=> b!829751 m!772785))

(declare-fun m!772787 () Bool)

(assert (=> bm!36161 m!772787))

(assert (=> b!829764 m!772751))

(assert (=> b!829764 m!772751))

(assert (=> b!829764 m!772781))

(declare-fun m!772789 () Bool)

(assert (=> bm!36159 m!772789))

(declare-fun m!772791 () Bool)

(assert (=> b!829755 m!772791))

(assert (=> bm!36164 m!772717))

(assert (=> b!829761 m!772751))

(assert (=> b!829761 m!772751))

(declare-fun m!772793 () Bool)

(assert (=> b!829761 m!772793))

(declare-fun m!772795 () Bool)

(assert (=> bm!36158 m!772795))

(assert (=> b!829762 m!772751))

(declare-fun m!772797 () Bool)

(assert (=> b!829762 m!772797))

(declare-fun m!772799 () Bool)

(assert (=> b!829762 m!772799))

(assert (=> b!829762 m!772751))

(declare-fun m!772801 () Bool)

(assert (=> b!829762 m!772801))

(assert (=> b!829762 m!772797))

(assert (=> b!829762 m!772799))

(declare-fun m!772803 () Bool)

(assert (=> b!829762 m!772803))

(assert (=> b!829679 d!105281))

(declare-fun d!105283 () Bool)

(declare-fun e!462565 () Bool)

(assert (=> d!105283 e!462565))

(declare-fun res!565226 () Bool)

(assert (=> d!105283 (=> (not res!565226) (not e!462565))))

(declare-fun lt!376393 () ListLongMap!8963)

(assert (=> d!105283 (= res!565226 (contains!4202 lt!376393 (_1!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lt!376395 () List!15934)

(assert (=> d!105283 (= lt!376393 (ListLongMap!8964 lt!376395))))

(declare-fun lt!376396 () Unit!28415)

(declare-fun lt!376394 () Unit!28415)

(assert (=> d!105283 (= lt!376396 lt!376394)))

(declare-datatypes ((Option!419 0))(
  ( (Some!418 (v!10087 V!25261)) (None!417) )
))
(declare-fun getValueByKey!413 (List!15934 (_ BitVec 64)) Option!419)

(assert (=> d!105283 (= (getValueByKey!413 lt!376395 (_1!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun lemmaContainsTupThenGetReturnValue!227 (List!15934 (_ BitVec 64) V!25261) Unit!28415)

(assert (=> d!105283 (= lt!376394 (lemmaContainsTupThenGetReturnValue!227 lt!376395 (_1!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun insertStrictlySorted!266 (List!15934 (_ BitVec 64) V!25261) List!15934)

(assert (=> d!105283 (= lt!376395 (insertStrictlySorted!266 (toList!4497 (+!1976 lt!376306 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (_1!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) (_2!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(assert (=> d!105283 (= (+!1976 (+!1976 lt!376306 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)) lt!376393)))

(declare-fun b!829775 () Bool)

(declare-fun res!565225 () Bool)

(assert (=> b!829775 (=> (not res!565225) (not e!462565))))

(assert (=> b!829775 (= res!565225 (= (getValueByKey!413 (toList!4497 lt!376393) (_1!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))) (Some!418 (_2!5081 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))))

(declare-fun b!829776 () Bool)

(declare-fun contains!4203 (List!15934 tuple2!10140) Bool)

(assert (=> b!829776 (= e!462565 (contains!4203 (toList!4497 lt!376393) (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(assert (= (and d!105283 res!565226) b!829775))

(assert (= (and b!829775 res!565225) b!829776))

(declare-fun m!772805 () Bool)

(assert (=> d!105283 m!772805))

(declare-fun m!772807 () Bool)

(assert (=> d!105283 m!772807))

(declare-fun m!772809 () Bool)

(assert (=> d!105283 m!772809))

(declare-fun m!772811 () Bool)

(assert (=> d!105283 m!772811))

(declare-fun m!772813 () Bool)

(assert (=> b!829775 m!772813))

(declare-fun m!772815 () Bool)

(assert (=> b!829776 m!772815))

(assert (=> b!829679 d!105283))

(declare-fun d!105285 () Bool)

(declare-fun e!462566 () Bool)

(assert (=> d!105285 e!462566))

(declare-fun res!565228 () Bool)

(assert (=> d!105285 (=> (not res!565228) (not e!462566))))

(declare-fun lt!376397 () ListLongMap!8963)

(assert (=> d!105285 (= res!565228 (contains!4202 lt!376397 (_1!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!376399 () List!15934)

(assert (=> d!105285 (= lt!376397 (ListLongMap!8964 lt!376399))))

(declare-fun lt!376400 () Unit!28415)

(declare-fun lt!376398 () Unit!28415)

(assert (=> d!105285 (= lt!376400 lt!376398)))

(assert (=> d!105285 (= (getValueByKey!413 lt!376399 (_1!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!418 (_2!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105285 (= lt!376398 (lemmaContainsTupThenGetReturnValue!227 lt!376399 (_1!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105285 (= lt!376399 (insertStrictlySorted!266 (toList!4497 lt!376306) (_1!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105285 (= (+!1976 lt!376306 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!376397)))

(declare-fun b!829777 () Bool)

(declare-fun res!565227 () Bool)

(assert (=> b!829777 (=> (not res!565227) (not e!462566))))

(assert (=> b!829777 (= res!565227 (= (getValueByKey!413 (toList!4497 lt!376397) (_1!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!418 (_2!5081 (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!829778 () Bool)

(assert (=> b!829778 (= e!462566 (contains!4203 (toList!4497 lt!376397) (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105285 res!565228) b!829777))

(assert (= (and b!829777 res!565227) b!829778))

(declare-fun m!772817 () Bool)

(assert (=> d!105285 m!772817))

(declare-fun m!772819 () Bool)

(assert (=> d!105285 m!772819))

(declare-fun m!772821 () Bool)

(assert (=> d!105285 m!772821))

(declare-fun m!772823 () Bool)

(assert (=> d!105285 m!772823))

(declare-fun m!772825 () Bool)

(assert (=> b!829777 m!772825))

(declare-fun m!772827 () Bool)

(assert (=> b!829778 m!772827))

(assert (=> b!829679 d!105285))

(declare-fun b!829779 () Bool)

(declare-fun e!462572 () Bool)

(declare-fun e!462573 () Bool)

(assert (=> b!829779 (= e!462572 e!462573)))

(declare-fun res!565233 () Bool)

(declare-fun call!36170 () Bool)

(assert (=> b!829779 (= res!565233 call!36170)))

(assert (=> b!829779 (=> (not res!565233) (not e!462573))))

(declare-fun b!829780 () Bool)

(declare-fun e!462575 () ListLongMap!8963)

(declare-fun call!36171 () ListLongMap!8963)

(assert (=> b!829780 (= e!462575 call!36171)))

(declare-fun bm!36166 () Bool)

(declare-fun lt!376407 () ListLongMap!8963)

(assert (=> bm!36166 (= call!36170 (contains!4202 lt!376407 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829781 () Bool)

(declare-fun e!462579 () Bool)

(declare-fun call!36173 () Bool)

(assert (=> b!829781 (= e!462579 (not call!36173))))

(declare-fun b!829782 () Bool)

(declare-fun e!462568 () ListLongMap!8963)

(declare-fun call!36174 () ListLongMap!8963)

(assert (=> b!829782 (= e!462568 (+!1976 call!36174 (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!829783 () Bool)

(declare-fun res!565231 () Bool)

(declare-fun e!462577 () Bool)

(assert (=> b!829783 (=> (not res!565231) (not e!462577))))

(declare-fun e!462576 () Bool)

(assert (=> b!829783 (= res!565231 e!462576)))

(declare-fun res!565232 () Bool)

(assert (=> b!829783 (=> res!565232 e!462576)))

(declare-fun e!462574 () Bool)

(assert (=> b!829783 (= res!565232 (not e!462574))))

(declare-fun res!565235 () Bool)

(assert (=> b!829783 (=> (not res!565235) (not e!462574))))

(assert (=> b!829783 (= res!565235 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829784 () Bool)

(declare-fun e!462578 () ListLongMap!8963)

(assert (=> b!829784 (= e!462578 call!36171)))

(declare-fun b!829785 () Bool)

(declare-fun res!565229 () Bool)

(assert (=> b!829785 (=> (not res!565229) (not e!462577))))

(assert (=> b!829785 (= res!565229 e!462579)))

(declare-fun c!89797 () Bool)

(assert (=> b!829785 (= c!89797 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!36167 () Bool)

(assert (=> bm!36167 (= call!36171 call!36174)))

(declare-fun b!829786 () Bool)

(declare-fun e!462571 () Bool)

(assert (=> b!829786 (= e!462571 (= (apply!370 lt!376407 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!829787 () Bool)

(assert (=> b!829787 (= e!462574 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36168 () Bool)

(assert (=> bm!36168 (= call!36173 (contains!4202 lt!376407 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!829788 () Bool)

(assert (=> b!829788 (= e!462568 e!462578)))

(declare-fun c!89795 () Bool)

(assert (=> b!829788 (= c!89795 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!829789 () Bool)

(declare-fun e!462569 () Unit!28415)

(declare-fun lt!376414 () Unit!28415)

(assert (=> b!829789 (= e!462569 lt!376414)))

(declare-fun lt!376416 () ListLongMap!8963)

(assert (=> b!829789 (= lt!376416 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376410 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376417 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376417 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376413 () Unit!28415)

(assert (=> b!829789 (= lt!376413 (addStillContains!321 lt!376416 lt!376410 zeroValueAfter!34 lt!376417))))

(assert (=> b!829789 (contains!4202 (+!1976 lt!376416 (tuple2!10141 lt!376410 zeroValueAfter!34)) lt!376417)))

(declare-fun lt!376420 () Unit!28415)

(assert (=> b!829789 (= lt!376420 lt!376413)))

(declare-fun lt!376409 () ListLongMap!8963)

(assert (=> b!829789 (= lt!376409 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376403 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376403 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376412 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376412 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376408 () Unit!28415)

(assert (=> b!829789 (= lt!376408 (addApplyDifferent!321 lt!376409 lt!376403 minValue!754 lt!376412))))

(assert (=> b!829789 (= (apply!370 (+!1976 lt!376409 (tuple2!10141 lt!376403 minValue!754)) lt!376412) (apply!370 lt!376409 lt!376412))))

(declare-fun lt!376411 () Unit!28415)

(assert (=> b!829789 (= lt!376411 lt!376408)))

(declare-fun lt!376415 () ListLongMap!8963)

(assert (=> b!829789 (= lt!376415 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376419 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376405 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376405 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376402 () Unit!28415)

(assert (=> b!829789 (= lt!376402 (addApplyDifferent!321 lt!376415 lt!376419 zeroValueAfter!34 lt!376405))))

(assert (=> b!829789 (= (apply!370 (+!1976 lt!376415 (tuple2!10141 lt!376419 zeroValueAfter!34)) lt!376405) (apply!370 lt!376415 lt!376405))))

(declare-fun lt!376418 () Unit!28415)

(assert (=> b!829789 (= lt!376418 lt!376402)))

(declare-fun lt!376404 () ListLongMap!8963)

(assert (=> b!829789 (= lt!376404 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376421 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376421 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!376422 () (_ BitVec 64))

(assert (=> b!829789 (= lt!376422 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829789 (= lt!376414 (addApplyDifferent!321 lt!376404 lt!376421 minValue!754 lt!376422))))

(assert (=> b!829789 (= (apply!370 (+!1976 lt!376404 (tuple2!10141 lt!376421 minValue!754)) lt!376422) (apply!370 lt!376404 lt!376422))))

(declare-fun b!829790 () Bool)

(declare-fun Unit!28418 () Unit!28415)

(assert (=> b!829790 (= e!462569 Unit!28418)))

(declare-fun b!829791 () Bool)

(assert (=> b!829791 (= e!462572 (not call!36170))))

(declare-fun call!36172 () ListLongMap!8963)

(declare-fun call!36168 () ListLongMap!8963)

(declare-fun c!89798 () Bool)

(declare-fun call!36169 () ListLongMap!8963)

(declare-fun bm!36165 () Bool)

(assert (=> bm!36165 (= call!36174 (+!1976 (ite c!89798 call!36172 (ite c!89795 call!36168 call!36169)) (ite (or c!89798 c!89795) (tuple2!10141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun d!105287 () Bool)

(assert (=> d!105287 e!462577))

(declare-fun res!565230 () Bool)

(assert (=> d!105287 (=> (not res!565230) (not e!462577))))

(assert (=> d!105287 (= res!565230 (or (bvsge #b00000000000000000000000000000000 (size!22737 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))))

(declare-fun lt!376401 () ListLongMap!8963)

(assert (=> d!105287 (= lt!376407 lt!376401)))

(declare-fun lt!376406 () Unit!28415)

(assert (=> d!105287 (= lt!376406 e!462569)))

(declare-fun c!89793 () Bool)

(declare-fun e!462567 () Bool)

(assert (=> d!105287 (= c!89793 e!462567)))

(declare-fun res!565236 () Bool)

(assert (=> d!105287 (=> (not res!565236) (not e!462567))))

(assert (=> d!105287 (= res!565236 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> d!105287 (= lt!376401 e!462568)))

(assert (=> d!105287 (= c!89798 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105287 (validMask!0 mask!1312)))

(assert (=> d!105287 (= (getCurrentListMap!2594 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376407)))

(declare-fun b!829792 () Bool)

(declare-fun e!462570 () Bool)

(assert (=> b!829792 (= e!462576 e!462570)))

(declare-fun res!565237 () Bool)

(assert (=> b!829792 (=> (not res!565237) (not e!462570))))

(assert (=> b!829792 (= res!565237 (contains!4202 lt!376407 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829792 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun bm!36169 () Bool)

(assert (=> bm!36169 (= call!36168 call!36172)))

(declare-fun b!829793 () Bool)

(assert (=> b!829793 (= e!462570 (= (apply!370 lt!376407 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)) (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!829793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22738 _values!788)))))

(assert (=> b!829793 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829794 () Bool)

(assert (=> b!829794 (= e!462577 e!462572)))

(declare-fun c!89796 () Bool)

(assert (=> b!829794 (= c!89796 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!36170 () Bool)

(assert (=> bm!36170 (= call!36169 call!36168)))

(declare-fun bm!36171 () Bool)

(assert (=> bm!36171 (= call!36172 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!829795 () Bool)

(assert (=> b!829795 (= e!462567 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829796 () Bool)

(assert (=> b!829796 (= e!462579 e!462571)))

(declare-fun res!565234 () Bool)

(assert (=> b!829796 (= res!565234 call!36173)))

(assert (=> b!829796 (=> (not res!565234) (not e!462571))))

(declare-fun b!829797 () Bool)

(declare-fun c!89794 () Bool)

(assert (=> b!829797 (= c!89794 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!829797 (= e!462578 e!462575)))

(declare-fun b!829798 () Bool)

(assert (=> b!829798 (= e!462573 (= (apply!370 lt!376407 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!829799 () Bool)

(assert (=> b!829799 (= e!462575 call!36169)))

(assert (= (and d!105287 c!89798) b!829782))

(assert (= (and d!105287 (not c!89798)) b!829788))

(assert (= (and b!829788 c!89795) b!829784))

(assert (= (and b!829788 (not c!89795)) b!829797))

(assert (= (and b!829797 c!89794) b!829780))

(assert (= (and b!829797 (not c!89794)) b!829799))

(assert (= (or b!829780 b!829799) bm!36170))

(assert (= (or b!829784 bm!36170) bm!36169))

(assert (= (or b!829784 b!829780) bm!36167))

(assert (= (or b!829782 bm!36169) bm!36171))

(assert (= (or b!829782 bm!36167) bm!36165))

(assert (= (and d!105287 res!565236) b!829795))

(assert (= (and d!105287 c!89793) b!829789))

(assert (= (and d!105287 (not c!89793)) b!829790))

(assert (= (and d!105287 res!565230) b!829783))

(assert (= (and b!829783 res!565235) b!829787))

(assert (= (and b!829783 (not res!565232)) b!829792))

(assert (= (and b!829792 res!565237) b!829793))

(assert (= (and b!829783 res!565231) b!829785))

(assert (= (and b!829785 c!89797) b!829796))

(assert (= (and b!829785 (not c!89797)) b!829781))

(assert (= (and b!829796 res!565234) b!829786))

(assert (= (or b!829796 b!829781) bm!36168))

(assert (= (and b!829785 res!565229) b!829794))

(assert (= (and b!829794 c!89796) b!829779))

(assert (= (and b!829794 (not c!89796)) b!829791))

(assert (= (and b!829779 res!565233) b!829798))

(assert (= (or b!829779 b!829791) bm!36166))

(declare-fun b_lambda!11301 () Bool)

(assert (=> (not b_lambda!11301) (not b!829793)))

(assert (=> b!829793 t!22298))

(declare-fun b_and!22497 () Bool)

(assert (= b_and!22495 (and (=> t!22298 result!8003) b_and!22497)))

(assert (=> d!105287 m!772697))

(assert (=> b!829789 m!772715))

(declare-fun m!772829 () Bool)

(assert (=> b!829789 m!772829))

(assert (=> b!829789 m!772751))

(declare-fun m!772831 () Bool)

(assert (=> b!829789 m!772831))

(declare-fun m!772833 () Bool)

(assert (=> b!829789 m!772833))

(declare-fun m!772835 () Bool)

(assert (=> b!829789 m!772835))

(declare-fun m!772837 () Bool)

(assert (=> b!829789 m!772837))

(declare-fun m!772839 () Bool)

(assert (=> b!829789 m!772839))

(assert (=> b!829789 m!772833))

(declare-fun m!772841 () Bool)

(assert (=> b!829789 m!772841))

(assert (=> b!829789 m!772837))

(declare-fun m!772843 () Bool)

(assert (=> b!829789 m!772843))

(declare-fun m!772845 () Bool)

(assert (=> b!829789 m!772845))

(declare-fun m!772847 () Bool)

(assert (=> b!829789 m!772847))

(declare-fun m!772849 () Bool)

(assert (=> b!829789 m!772849))

(declare-fun m!772851 () Bool)

(assert (=> b!829789 m!772851))

(declare-fun m!772853 () Bool)

(assert (=> b!829789 m!772853))

(declare-fun m!772855 () Bool)

(assert (=> b!829789 m!772855))

(assert (=> b!829789 m!772845))

(declare-fun m!772857 () Bool)

(assert (=> b!829789 m!772857))

(assert (=> b!829789 m!772849))

(assert (=> b!829787 m!772751))

(assert (=> b!829787 m!772751))

(assert (=> b!829787 m!772781))

(declare-fun m!772859 () Bool)

(assert (=> b!829798 m!772859))

(declare-fun m!772861 () Bool)

(assert (=> b!829782 m!772861))

(declare-fun m!772863 () Bool)

(assert (=> bm!36168 m!772863))

(assert (=> b!829795 m!772751))

(assert (=> b!829795 m!772751))

(assert (=> b!829795 m!772781))

(declare-fun m!772865 () Bool)

(assert (=> bm!36166 m!772865))

(declare-fun m!772867 () Bool)

(assert (=> b!829786 m!772867))

(assert (=> bm!36171 m!772715))

(assert (=> b!829792 m!772751))

(assert (=> b!829792 m!772751))

(declare-fun m!772869 () Bool)

(assert (=> b!829792 m!772869))

(declare-fun m!772871 () Bool)

(assert (=> bm!36165 m!772871))

(assert (=> b!829793 m!772751))

(assert (=> b!829793 m!772797))

(assert (=> b!829793 m!772799))

(assert (=> b!829793 m!772751))

(declare-fun m!772873 () Bool)

(assert (=> b!829793 m!772873))

(assert (=> b!829793 m!772797))

(assert (=> b!829793 m!772799))

(assert (=> b!829793 m!772803))

(assert (=> b!829679 d!105287))

(declare-fun b!829810 () Bool)

(declare-fun e!462589 () Bool)

(declare-fun call!36177 () Bool)

(assert (=> b!829810 (= e!462589 call!36177)))

(declare-fun b!829811 () Bool)

(declare-fun e!462590 () Bool)

(declare-fun contains!4204 (List!15933 (_ BitVec 64)) Bool)

(assert (=> b!829811 (= e!462590 (contains!4204 Nil!15930 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829812 () Bool)

(assert (=> b!829812 (= e!462589 call!36177)))

(declare-fun b!829813 () Bool)

(declare-fun e!462591 () Bool)

(assert (=> b!829813 (= e!462591 e!462589)))

(declare-fun c!89801 () Bool)

(assert (=> b!829813 (= c!89801 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!829814 () Bool)

(declare-fun e!462588 () Bool)

(assert (=> b!829814 (= e!462588 e!462591)))

(declare-fun res!565244 () Bool)

(assert (=> b!829814 (=> (not res!565244) (not e!462591))))

(assert (=> b!829814 (= res!565244 (not e!462590))))

(declare-fun res!565246 () Bool)

(assert (=> b!829814 (=> (not res!565246) (not e!462590))))

(assert (=> b!829814 (= res!565246 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36174 () Bool)

(assert (=> bm!36174 (= call!36177 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89801 (Cons!15929 (select (arr!22316 _keys!976) #b00000000000000000000000000000000) Nil!15930) Nil!15930)))))

(declare-fun d!105289 () Bool)

(declare-fun res!565245 () Bool)

(assert (=> d!105289 (=> res!565245 e!462588)))

(assert (=> d!105289 (= res!565245 (bvsge #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> d!105289 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15930) e!462588)))

(assert (= (and d!105289 (not res!565245)) b!829814))

(assert (= (and b!829814 res!565246) b!829811))

(assert (= (and b!829814 res!565244) b!829813))

(assert (= (and b!829813 c!89801) b!829810))

(assert (= (and b!829813 (not c!89801)) b!829812))

(assert (= (or b!829810 b!829812) bm!36174))

(assert (=> b!829811 m!772751))

(assert (=> b!829811 m!772751))

(declare-fun m!772875 () Bool)

(assert (=> b!829811 m!772875))

(assert (=> b!829813 m!772751))

(assert (=> b!829813 m!772751))

(assert (=> b!829813 m!772781))

(assert (=> b!829814 m!772751))

(assert (=> b!829814 m!772751))

(assert (=> b!829814 m!772781))

(assert (=> bm!36174 m!772751))

(declare-fun m!772877 () Bool)

(assert (=> bm!36174 m!772877))

(assert (=> b!829678 d!105289))

(declare-fun d!105291 () Bool)

(assert (=> d!105291 (= (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!376425 () Unit!28415)

(declare-fun choose!1414 (array!46556 array!46558 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25261 V!25261 V!25261 V!25261 (_ BitVec 32) Int) Unit!28415)

(assert (=> d!105291 (= lt!376425 (choose!1414 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105291 (validMask!0 mask!1312)))

(assert (=> d!105291 (= (lemmaNoChangeToArrayThenSameMapNoExtras!584 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376425)))

(declare-fun bs!23176 () Bool)

(assert (= bs!23176 d!105291))

(assert (=> bs!23176 m!772717))

(assert (=> bs!23176 m!772715))

(declare-fun m!772879 () Bool)

(assert (=> bs!23176 m!772879))

(assert (=> bs!23176 m!772697))

(assert (=> b!829681 d!105291))

(declare-fun b!829839 () Bool)

(declare-fun e!462611 () Bool)

(declare-fun lt!376441 () ListLongMap!8963)

(declare-fun isEmpty!652 (ListLongMap!8963) Bool)

(assert (=> b!829839 (= e!462611 (isEmpty!652 lt!376441))))

(declare-fun b!829840 () Bool)

(declare-fun e!462610 () ListLongMap!8963)

(declare-fun call!36180 () ListLongMap!8963)

(assert (=> b!829840 (= e!462610 call!36180)))

(declare-fun b!829841 () Bool)

(assert (=> b!829841 (= e!462611 (= lt!376441 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829842 () Bool)

(declare-fun e!462612 () Bool)

(assert (=> b!829842 (= e!462612 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829842 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829843 () Bool)

(declare-fun e!462609 () Bool)

(declare-fun e!462606 () Bool)

(assert (=> b!829843 (= e!462609 e!462606)))

(assert (=> b!829843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun res!565255 () Bool)

(assert (=> b!829843 (= res!565255 (contains!4202 lt!376441 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829843 (=> (not res!565255) (not e!462606))))

(declare-fun bm!36177 () Bool)

(assert (=> bm!36177 (= call!36180 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829845 () Bool)

(declare-fun lt!376442 () Unit!28415)

(declare-fun lt!376445 () Unit!28415)

(assert (=> b!829845 (= lt!376442 lt!376445)))

(declare-fun lt!376446 () (_ BitVec 64))

(declare-fun lt!376440 () V!25261)

(declare-fun lt!376444 () ListLongMap!8963)

(declare-fun lt!376443 () (_ BitVec 64))

(assert (=> b!829845 (not (contains!4202 (+!1976 lt!376444 (tuple2!10141 lt!376446 lt!376440)) lt!376443))))

(declare-fun addStillNotContains!195 (ListLongMap!8963 (_ BitVec 64) V!25261 (_ BitVec 64)) Unit!28415)

(assert (=> b!829845 (= lt!376445 (addStillNotContains!195 lt!376444 lt!376446 lt!376440 lt!376443))))

(assert (=> b!829845 (= lt!376443 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829845 (= lt!376440 (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829845 (= lt!376446 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829845 (= lt!376444 call!36180)))

(assert (=> b!829845 (= e!462610 (+!1976 call!36180 (tuple2!10141 (select (arr!22316 _keys!976) #b00000000000000000000000000000000) (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829846 () Bool)

(assert (=> b!829846 (= e!462609 e!462611)))

(declare-fun c!89813 () Bool)

(assert (=> b!829846 (= c!89813 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829847 () Bool)

(declare-fun res!565257 () Bool)

(declare-fun e!462607 () Bool)

(assert (=> b!829847 (=> (not res!565257) (not e!462607))))

(assert (=> b!829847 (= res!565257 (not (contains!4202 lt!376441 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829848 () Bool)

(assert (=> b!829848 (= e!462607 e!462609)))

(declare-fun c!89810 () Bool)

(assert (=> b!829848 (= c!89810 e!462612)))

(declare-fun res!565258 () Bool)

(assert (=> b!829848 (=> (not res!565258) (not e!462612))))

(assert (=> b!829848 (= res!565258 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829849 () Bool)

(declare-fun e!462608 () ListLongMap!8963)

(assert (=> b!829849 (= e!462608 (ListLongMap!8964 Nil!15931))))

(declare-fun b!829850 () Bool)

(assert (=> b!829850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> b!829850 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22738 _values!788)))))

(assert (=> b!829850 (= e!462606 (= (apply!370 lt!376441 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)) (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105293 () Bool)

(assert (=> d!105293 e!462607))

(declare-fun res!565256 () Bool)

(assert (=> d!105293 (=> (not res!565256) (not e!462607))))

(assert (=> d!105293 (= res!565256 (not (contains!4202 lt!376441 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105293 (= lt!376441 e!462608)))

(declare-fun c!89812 () Bool)

(assert (=> d!105293 (= c!89812 (bvsge #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> d!105293 (validMask!0 mask!1312)))

(assert (=> d!105293 (= (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376441)))

(declare-fun b!829844 () Bool)

(assert (=> b!829844 (= e!462608 e!462610)))

(declare-fun c!89811 () Bool)

(assert (=> b!829844 (= c!89811 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105293 c!89812) b!829849))

(assert (= (and d!105293 (not c!89812)) b!829844))

(assert (= (and b!829844 c!89811) b!829845))

(assert (= (and b!829844 (not c!89811)) b!829840))

(assert (= (or b!829845 b!829840) bm!36177))

(assert (= (and d!105293 res!565256) b!829847))

(assert (= (and b!829847 res!565257) b!829848))

(assert (= (and b!829848 res!565258) b!829842))

(assert (= (and b!829848 c!89810) b!829843))

(assert (= (and b!829848 (not c!89810)) b!829846))

(assert (= (and b!829843 res!565255) b!829850))

(assert (= (and b!829846 c!89813) b!829841))

(assert (= (and b!829846 (not c!89813)) b!829839))

(declare-fun b_lambda!11303 () Bool)

(assert (=> (not b_lambda!11303) (not b!829845)))

(assert (=> b!829845 t!22298))

(declare-fun b_and!22499 () Bool)

(assert (= b_and!22497 (and (=> t!22298 result!8003) b_and!22499)))

(declare-fun b_lambda!11305 () Bool)

(assert (=> (not b_lambda!11305) (not b!829850)))

(assert (=> b!829850 t!22298))

(declare-fun b_and!22501 () Bool)

(assert (= b_and!22499 (and (=> t!22298 result!8003) b_and!22501)))

(assert (=> b!829842 m!772751))

(assert (=> b!829842 m!772751))

(assert (=> b!829842 m!772781))

(assert (=> b!829844 m!772751))

(assert (=> b!829844 m!772751))

(assert (=> b!829844 m!772781))

(declare-fun m!772881 () Bool)

(assert (=> d!105293 m!772881))

(assert (=> d!105293 m!772697))

(assert (=> b!829843 m!772751))

(assert (=> b!829843 m!772751))

(declare-fun m!772883 () Bool)

(assert (=> b!829843 m!772883))

(declare-fun m!772885 () Bool)

(assert (=> b!829847 m!772885))

(declare-fun m!772887 () Bool)

(assert (=> b!829841 m!772887))

(assert (=> bm!36177 m!772887))

(declare-fun m!772889 () Bool)

(assert (=> b!829839 m!772889))

(assert (=> b!829850 m!772797))

(assert (=> b!829850 m!772799))

(assert (=> b!829850 m!772803))

(assert (=> b!829850 m!772799))

(assert (=> b!829850 m!772751))

(assert (=> b!829850 m!772797))

(assert (=> b!829850 m!772751))

(declare-fun m!772891 () Bool)

(assert (=> b!829850 m!772891))

(assert (=> b!829845 m!772797))

(assert (=> b!829845 m!772799))

(assert (=> b!829845 m!772803))

(assert (=> b!829845 m!772799))

(declare-fun m!772893 () Bool)

(assert (=> b!829845 m!772893))

(declare-fun m!772895 () Bool)

(assert (=> b!829845 m!772895))

(assert (=> b!829845 m!772893))

(declare-fun m!772897 () Bool)

(assert (=> b!829845 m!772897))

(declare-fun m!772899 () Bool)

(assert (=> b!829845 m!772899))

(assert (=> b!829845 m!772751))

(assert (=> b!829845 m!772797))

(assert (=> b!829681 d!105293))

(declare-fun b!829851 () Bool)

(declare-fun e!462618 () Bool)

(declare-fun lt!376448 () ListLongMap!8963)

(assert (=> b!829851 (= e!462618 (isEmpty!652 lt!376448))))

(declare-fun b!829852 () Bool)

(declare-fun e!462617 () ListLongMap!8963)

(declare-fun call!36181 () ListLongMap!8963)

(assert (=> b!829852 (= e!462617 call!36181)))

(declare-fun b!829853 () Bool)

(assert (=> b!829853 (= e!462618 (= lt!376448 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!829854 () Bool)

(declare-fun e!462619 () Bool)

(assert (=> b!829854 (= e!462619 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829854 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!829855 () Bool)

(declare-fun e!462616 () Bool)

(declare-fun e!462613 () Bool)

(assert (=> b!829855 (= e!462616 e!462613)))

(assert (=> b!829855 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun res!565259 () Bool)

(assert (=> b!829855 (= res!565259 (contains!4202 lt!376448 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!829855 (=> (not res!565259) (not e!462613))))

(declare-fun bm!36178 () Bool)

(assert (=> bm!36178 (= call!36181 (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!829857 () Bool)

(declare-fun lt!376449 () Unit!28415)

(declare-fun lt!376452 () Unit!28415)

(assert (=> b!829857 (= lt!376449 lt!376452)))

(declare-fun lt!376453 () (_ BitVec 64))

(declare-fun lt!376450 () (_ BitVec 64))

(declare-fun lt!376451 () ListLongMap!8963)

(declare-fun lt!376447 () V!25261)

(assert (=> b!829857 (not (contains!4202 (+!1976 lt!376451 (tuple2!10141 lt!376453 lt!376447)) lt!376450))))

(assert (=> b!829857 (= lt!376452 (addStillNotContains!195 lt!376451 lt!376453 lt!376447 lt!376450))))

(assert (=> b!829857 (= lt!376450 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!829857 (= lt!376447 (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!829857 (= lt!376453 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!829857 (= lt!376451 call!36181)))

(assert (=> b!829857 (= e!462617 (+!1976 call!36181 (tuple2!10141 (select (arr!22316 _keys!976) #b00000000000000000000000000000000) (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!829858 () Bool)

(assert (=> b!829858 (= e!462616 e!462618)))

(declare-fun c!89817 () Bool)

(assert (=> b!829858 (= c!89817 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829859 () Bool)

(declare-fun res!565261 () Bool)

(declare-fun e!462614 () Bool)

(assert (=> b!829859 (=> (not res!565261) (not e!462614))))

(assert (=> b!829859 (= res!565261 (not (contains!4202 lt!376448 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!829860 () Bool)

(assert (=> b!829860 (= e!462614 e!462616)))

(declare-fun c!89814 () Bool)

(assert (=> b!829860 (= c!89814 e!462619)))

(declare-fun res!565262 () Bool)

(assert (=> b!829860 (=> (not res!565262) (not e!462619))))

(assert (=> b!829860 (= res!565262 (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(declare-fun b!829861 () Bool)

(declare-fun e!462615 () ListLongMap!8963)

(assert (=> b!829861 (= e!462615 (ListLongMap!8964 Nil!15931))))

(declare-fun b!829862 () Bool)

(assert (=> b!829862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> b!829862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22738 _values!788)))))

(assert (=> b!829862 (= e!462613 (= (apply!370 lt!376448 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)) (get!11811 (select (arr!22317 _values!788) #b00000000000000000000000000000000) (dynLambda!981 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!105295 () Bool)

(assert (=> d!105295 e!462614))

(declare-fun res!565260 () Bool)

(assert (=> d!105295 (=> (not res!565260) (not e!462614))))

(assert (=> d!105295 (= res!565260 (not (contains!4202 lt!376448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105295 (= lt!376448 e!462615)))

(declare-fun c!89816 () Bool)

(assert (=> d!105295 (= c!89816 (bvsge #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> d!105295 (validMask!0 mask!1312)))

(assert (=> d!105295 (= (getCurrentListMapNoExtraKeys!2496 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!376448)))

(declare-fun b!829856 () Bool)

(assert (=> b!829856 (= e!462615 e!462617)))

(declare-fun c!89815 () Bool)

(assert (=> b!829856 (= c!89815 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105295 c!89816) b!829861))

(assert (= (and d!105295 (not c!89816)) b!829856))

(assert (= (and b!829856 c!89815) b!829857))

(assert (= (and b!829856 (not c!89815)) b!829852))

(assert (= (or b!829857 b!829852) bm!36178))

(assert (= (and d!105295 res!565260) b!829859))

(assert (= (and b!829859 res!565261) b!829860))

(assert (= (and b!829860 res!565262) b!829854))

(assert (= (and b!829860 c!89814) b!829855))

(assert (= (and b!829860 (not c!89814)) b!829858))

(assert (= (and b!829855 res!565259) b!829862))

(assert (= (and b!829858 c!89817) b!829853))

(assert (= (and b!829858 (not c!89817)) b!829851))

(declare-fun b_lambda!11307 () Bool)

(assert (=> (not b_lambda!11307) (not b!829857)))

(assert (=> b!829857 t!22298))

(declare-fun b_and!22503 () Bool)

(assert (= b_and!22501 (and (=> t!22298 result!8003) b_and!22503)))

(declare-fun b_lambda!11309 () Bool)

(assert (=> (not b_lambda!11309) (not b!829862)))

(assert (=> b!829862 t!22298))

(declare-fun b_and!22505 () Bool)

(assert (= b_and!22503 (and (=> t!22298 result!8003) b_and!22505)))

(assert (=> b!829854 m!772751))

(assert (=> b!829854 m!772751))

(assert (=> b!829854 m!772781))

(assert (=> b!829856 m!772751))

(assert (=> b!829856 m!772751))

(assert (=> b!829856 m!772781))

(declare-fun m!772901 () Bool)

(assert (=> d!105295 m!772901))

(assert (=> d!105295 m!772697))

(assert (=> b!829855 m!772751))

(assert (=> b!829855 m!772751))

(declare-fun m!772903 () Bool)

(assert (=> b!829855 m!772903))

(declare-fun m!772905 () Bool)

(assert (=> b!829859 m!772905))

(declare-fun m!772907 () Bool)

(assert (=> b!829853 m!772907))

(assert (=> bm!36178 m!772907))

(declare-fun m!772909 () Bool)

(assert (=> b!829851 m!772909))

(assert (=> b!829862 m!772797))

(assert (=> b!829862 m!772799))

(assert (=> b!829862 m!772803))

(assert (=> b!829862 m!772799))

(assert (=> b!829862 m!772751))

(assert (=> b!829862 m!772797))

(assert (=> b!829862 m!772751))

(declare-fun m!772911 () Bool)

(assert (=> b!829862 m!772911))

(assert (=> b!829857 m!772797))

(assert (=> b!829857 m!772799))

(assert (=> b!829857 m!772803))

(assert (=> b!829857 m!772799))

(declare-fun m!772913 () Bool)

(assert (=> b!829857 m!772913))

(declare-fun m!772915 () Bool)

(assert (=> b!829857 m!772915))

(assert (=> b!829857 m!772913))

(declare-fun m!772917 () Bool)

(assert (=> b!829857 m!772917))

(declare-fun m!772919 () Bool)

(assert (=> b!829857 m!772919))

(assert (=> b!829857 m!772751))

(assert (=> b!829857 m!772797))

(assert (=> b!829681 d!105295))

(declare-fun d!105297 () Bool)

(assert (=> d!105297 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71440 d!105297))

(declare-fun d!105299 () Bool)

(assert (=> d!105299 (= (array_inv!17773 _keys!976) (bvsge (size!22737 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71440 d!105299))

(declare-fun d!105301 () Bool)

(assert (=> d!105301 (= (array_inv!17774 _values!788) (bvsge (size!22738 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71440 d!105301))

(declare-fun b!829871 () Bool)

(declare-fun e!462628 () Bool)

(declare-fun e!462627 () Bool)

(assert (=> b!829871 (= e!462628 e!462627)))

(declare-fun lt!376462 () (_ BitVec 64))

(assert (=> b!829871 (= lt!376462 (select (arr!22316 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!376460 () Unit!28415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46556 (_ BitVec 64) (_ BitVec 32)) Unit!28415)

(assert (=> b!829871 (= lt!376460 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!376462 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!829871 (arrayContainsKey!0 _keys!976 lt!376462 #b00000000000000000000000000000000)))

(declare-fun lt!376461 () Unit!28415)

(assert (=> b!829871 (= lt!376461 lt!376460)))

(declare-fun res!565268 () Bool)

(declare-datatypes ((SeekEntryResult!8742 0))(
  ( (MissingZero!8742 (index!37339 (_ BitVec 32))) (Found!8742 (index!37340 (_ BitVec 32))) (Intermediate!8742 (undefined!9554 Bool) (index!37341 (_ BitVec 32)) (x!70069 (_ BitVec 32))) (Undefined!8742) (MissingVacant!8742 (index!37342 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46556 (_ BitVec 32)) SeekEntryResult!8742)

(assert (=> b!829871 (= res!565268 (= (seekEntryOrOpen!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8742 #b00000000000000000000000000000000)))))

(assert (=> b!829871 (=> (not res!565268) (not e!462627))))

(declare-fun d!105303 () Bool)

(declare-fun res!565267 () Bool)

(declare-fun e!462626 () Bool)

(assert (=> d!105303 (=> res!565267 e!462626)))

(assert (=> d!105303 (= res!565267 (bvsge #b00000000000000000000000000000000 (size!22737 _keys!976)))))

(assert (=> d!105303 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!462626)))

(declare-fun b!829872 () Bool)

(declare-fun call!36184 () Bool)

(assert (=> b!829872 (= e!462628 call!36184)))

(declare-fun b!829873 () Bool)

(assert (=> b!829873 (= e!462627 call!36184)))

(declare-fun b!829874 () Bool)

(assert (=> b!829874 (= e!462626 e!462628)))

(declare-fun c!89820 () Bool)

(assert (=> b!829874 (= c!89820 (validKeyInArray!0 (select (arr!22316 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!36181 () Bool)

(assert (=> bm!36181 (= call!36184 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105303 (not res!565267)) b!829874))

(assert (= (and b!829874 c!89820) b!829871))

(assert (= (and b!829874 (not c!89820)) b!829872))

(assert (= (and b!829871 res!565268) b!829873))

(assert (= (or b!829873 b!829872) bm!36181))

(assert (=> b!829871 m!772751))

(declare-fun m!772921 () Bool)

(assert (=> b!829871 m!772921))

(declare-fun m!772923 () Bool)

(assert (=> b!829871 m!772923))

(assert (=> b!829871 m!772751))

(declare-fun m!772925 () Bool)

(assert (=> b!829871 m!772925))

(assert (=> b!829874 m!772751))

(assert (=> b!829874 m!772751))

(assert (=> b!829874 m!772781))

(declare-fun m!772927 () Bool)

(assert (=> bm!36181 m!772927))

(assert (=> b!829677 d!105303))

(declare-fun b!829881 () Bool)

(declare-fun e!462634 () Bool)

(assert (=> b!829881 (= e!462634 tp_is_empty!15195)))

(declare-fun condMapEmpty!24445 () Bool)

(declare-fun mapDefault!24445 () ValueCell!7182)

(assert (=> mapNonEmpty!24439 (= condMapEmpty!24445 (= mapRest!24439 ((as const (Array (_ BitVec 32) ValueCell!7182)) mapDefault!24445)))))

(declare-fun e!462633 () Bool)

(declare-fun mapRes!24445 () Bool)

(assert (=> mapNonEmpty!24439 (= tp!47235 (and e!462633 mapRes!24445))))

(declare-fun mapIsEmpty!24445 () Bool)

(assert (=> mapIsEmpty!24445 mapRes!24445))

(declare-fun mapNonEmpty!24445 () Bool)

(declare-fun tp!47245 () Bool)

(assert (=> mapNonEmpty!24445 (= mapRes!24445 (and tp!47245 e!462634))))

(declare-fun mapKey!24445 () (_ BitVec 32))

(declare-fun mapRest!24445 () (Array (_ BitVec 32) ValueCell!7182))

(declare-fun mapValue!24445 () ValueCell!7182)

(assert (=> mapNonEmpty!24445 (= mapRest!24439 (store mapRest!24445 mapKey!24445 mapValue!24445))))

(declare-fun b!829882 () Bool)

(assert (=> b!829882 (= e!462633 tp_is_empty!15195)))

(assert (= (and mapNonEmpty!24439 condMapEmpty!24445) mapIsEmpty!24445))

(assert (= (and mapNonEmpty!24439 (not condMapEmpty!24445)) mapNonEmpty!24445))

(assert (= (and mapNonEmpty!24445 ((_ is ValueCellFull!7182) mapValue!24445)) b!829881))

(assert (= (and mapNonEmpty!24439 ((_ is ValueCellFull!7182) mapDefault!24445)) b!829882))

(declare-fun m!772929 () Bool)

(assert (=> mapNonEmpty!24445 m!772929))

(declare-fun b_lambda!11311 () Bool)

(assert (= b_lambda!11303 (or (and start!71440 b_free!13485) b_lambda!11311)))

(declare-fun b_lambda!11313 () Bool)

(assert (= b_lambda!11305 (or (and start!71440 b_free!13485) b_lambda!11313)))

(declare-fun b_lambda!11315 () Bool)

(assert (= b_lambda!11301 (or (and start!71440 b_free!13485) b_lambda!11315)))

(declare-fun b_lambda!11317 () Bool)

(assert (= b_lambda!11307 (or (and start!71440 b_free!13485) b_lambda!11317)))

(declare-fun b_lambda!11319 () Bool)

(assert (= b_lambda!11309 (or (and start!71440 b_free!13485) b_lambda!11319)))

(declare-fun b_lambda!11321 () Bool)

(assert (= b_lambda!11299 (or (and start!71440 b_free!13485) b_lambda!11321)))

(check-sat (not b_lambda!11313) (not d!105287) (not b!829871) (not b!829793) (not b!829761) (not bm!36158) (not b!829782) b_and!22505 (not b!829776) (not b!829862) (not bm!36168) (not b!829786) (not b!829777) (not bm!36164) (not b!829855) (not b_lambda!11317) (not b!829859) (not b!829841) (not b!829787) (not mapNonEmpty!24445) (not b!829792) (not b!829857) (not bm!36177) (not b!829798) (not b!829856) (not d!105283) (not b!829854) (not d!105293) (not d!105281) (not b!829842) (not b!829847) (not b!829751) (not bm!36171) (not d!105295) (not b!829844) (not b!829762) tp_is_empty!15195 (not b!829767) (not b!829853) (not d!105291) (not b!829755) (not bm!36178) (not b!829778) (not b!829758) (not b_lambda!11311) (not b!829795) (not b!829850) (not b!829756) (not b_lambda!11315) (not bm!36161) (not bm!36174) (not b!829811) (not b_next!13485) (not bm!36166) (not b_lambda!11319) (not b!829764) (not bm!36165) (not b!829775) (not b!829874) (not b!829845) (not b!829851) (not d!105285) (not bm!36181) (not bm!36159) (not b!829789) (not b!829843) (not b!829814) (not b_lambda!11321) (not b!829839) (not b!829813))
(check-sat b_and!22505 (not b_next!13485))
