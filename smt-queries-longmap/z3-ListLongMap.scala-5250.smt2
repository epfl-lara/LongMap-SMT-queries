; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70602 () Bool)

(assert start!70602)

(declare-fun b_free!12909 () Bool)

(declare-fun b_next!12909 () Bool)

(assert (=> start!70602 (= b_free!12909 (not b_next!12909))))

(declare-fun tp!45463 () Bool)

(declare-fun b_and!21751 () Bool)

(assert (=> start!70602 (= tp!45463 b_and!21751)))

(declare-fun b!820228 () Bool)

(declare-fun e!455669 () Bool)

(declare-fun tp_is_empty!14619 () Bool)

(assert (=> b!820228 (= e!455669 tp_is_empty!14619)))

(declare-fun b!820230 () Bool)

(declare-fun e!455671 () Bool)

(declare-fun e!455672 () Bool)

(assert (=> b!820230 (= e!455671 (not e!455672))))

(declare-fun res!559684 () Bool)

(assert (=> b!820230 (=> res!559684 e!455672)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820230 (= res!559684 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24493 0))(
  ( (V!24494 (val!7357 Int)) )
))
(declare-datatypes ((tuple2!9692 0))(
  ( (tuple2!9693 (_1!4857 (_ BitVec 64)) (_2!4857 V!24493)) )
))
(declare-datatypes ((List!15514 0))(
  ( (Nil!15511) (Cons!15510 (h!16639 tuple2!9692) (t!21845 List!15514)) )
))
(declare-datatypes ((ListLongMap!8515 0))(
  ( (ListLongMap!8516 (toList!4273 List!15514)) )
))
(declare-fun lt!368580 () ListLongMap!8515)

(declare-fun lt!368579 () ListLongMap!8515)

(assert (=> b!820230 (= lt!368580 lt!368579)))

(declare-fun zeroValueBefore!34 () V!24493)

(declare-datatypes ((array!45432 0))(
  ( (array!45433 (arr!21769 (Array (_ BitVec 32) (_ BitVec 64))) (size!22190 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45432)

(declare-fun zeroValueAfter!34 () V!24493)

(declare-fun minValue!754 () V!24493)

(declare-datatypes ((ValueCell!6894 0))(
  ( (ValueCellFull!6894 (v!9787 V!24493)) (EmptyCell!6894) )
))
(declare-datatypes ((array!45434 0))(
  ( (array!45435 (arr!21770 (Array (_ BitVec 32) ValueCell!6894)) (size!22191 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45434)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28023 0))(
  ( (Unit!28024) )
))
(declare-fun lt!368573 () Unit!28023)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!410 (array!45432 array!45434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24493 V!24493 V!24493 V!24493 (_ BitVec 32) Int) Unit!28023)

(assert (=> b!820230 (= lt!368573 (lemmaNoChangeToArrayThenSameMapNoExtras!410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2300 (array!45432 array!45434 (_ BitVec 32) (_ BitVec 32) V!24493 V!24493 (_ BitVec 32) Int) ListLongMap!8515)

(assert (=> b!820230 (= lt!368579 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820230 (= lt!368580 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820231 () Bool)

(declare-fun e!455670 () Bool)

(assert (=> b!820231 (= e!455670 (bvsle #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820232 () Bool)

(declare-fun res!559682 () Bool)

(assert (=> b!820232 (=> (not res!559682) (not e!455671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45432 (_ BitVec 32)) Bool)

(assert (=> b!820232 (= res!559682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23530 () Bool)

(declare-fun mapRes!23530 () Bool)

(declare-fun tp!45462 () Bool)

(assert (=> mapNonEmpty!23530 (= mapRes!23530 (and tp!45462 e!455669))))

(declare-fun mapRest!23530 () (Array (_ BitVec 32) ValueCell!6894))

(declare-fun mapValue!23530 () ValueCell!6894)

(declare-fun mapKey!23530 () (_ BitVec 32))

(assert (=> mapNonEmpty!23530 (= (arr!21770 _values!788) (store mapRest!23530 mapKey!23530 mapValue!23530))))

(declare-fun mapIsEmpty!23530 () Bool)

(assert (=> mapIsEmpty!23530 mapRes!23530))

(declare-fun b!820233 () Bool)

(declare-fun res!559683 () Bool)

(assert (=> b!820233 (=> (not res!559683) (not e!455671))))

(declare-datatypes ((List!15515 0))(
  ( (Nil!15512) (Cons!15511 (h!16640 (_ BitVec 64)) (t!21846 List!15515)) )
))
(declare-fun arrayNoDuplicates!0 (array!45432 (_ BitVec 32) List!15515) Bool)

(assert (=> b!820233 (= res!559683 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15512))))

(declare-fun b!820234 () Bool)

(declare-fun e!455667 () Bool)

(declare-fun e!455673 () Bool)

(assert (=> b!820234 (= e!455667 (and e!455673 mapRes!23530))))

(declare-fun condMapEmpty!23530 () Bool)

(declare-fun mapDefault!23530 () ValueCell!6894)

(assert (=> b!820234 (= condMapEmpty!23530 (= (arr!21770 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6894)) mapDefault!23530)))))

(declare-fun b!820235 () Bool)

(declare-fun e!455666 () Bool)

(declare-fun lt!368576 () ListLongMap!8515)

(declare-fun +!1867 (ListLongMap!8515 tuple2!9692) ListLongMap!8515)

(assert (=> b!820235 (= e!455666 (= lt!368576 (+!1867 lt!368579 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820229 () Bool)

(declare-fun res!559687 () Bool)

(assert (=> b!820229 (=> (not res!559687) (not e!455671))))

(assert (=> b!820229 (= res!559687 (and (= (size!22191 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22190 _keys!976) (size!22191 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!559686 () Bool)

(assert (=> start!70602 (=> (not res!559686) (not e!455671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70602 (= res!559686 (validMask!0 mask!1312))))

(assert (=> start!70602 e!455671))

(assert (=> start!70602 tp_is_empty!14619))

(declare-fun array_inv!17401 (array!45432) Bool)

(assert (=> start!70602 (array_inv!17401 _keys!976)))

(assert (=> start!70602 true))

(declare-fun array_inv!17402 (array!45434) Bool)

(assert (=> start!70602 (and (array_inv!17402 _values!788) e!455667)))

(assert (=> start!70602 tp!45463))

(declare-fun b!820236 () Bool)

(assert (=> b!820236 (= e!455673 tp_is_empty!14619)))

(declare-fun b!820237 () Bool)

(assert (=> b!820237 (= e!455672 e!455670)))

(declare-fun res!559688 () Bool)

(assert (=> b!820237 (=> res!559688 e!455670)))

(declare-fun lt!368577 () tuple2!9692)

(declare-fun lt!368574 () tuple2!9692)

(assert (=> b!820237 (= res!559688 (not (= lt!368576 (+!1867 (+!1867 lt!368579 lt!368577) lt!368574))))))

(declare-fun lt!368578 () ListLongMap!8515)

(assert (=> b!820237 (= (+!1867 lt!368580 lt!368574) (+!1867 lt!368578 lt!368574))))

(declare-fun lt!368572 () Unit!28023)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!203 (ListLongMap!8515 (_ BitVec 64) V!24493 V!24493) Unit!28023)

(assert (=> b!820237 (= lt!368572 (addSameAsAddTwiceSameKeyDiffValues!203 lt!368580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820237 (= lt!368574 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820237 e!455666))

(declare-fun res!559685 () Bool)

(assert (=> b!820237 (=> (not res!559685) (not e!455666))))

(declare-fun lt!368575 () ListLongMap!8515)

(assert (=> b!820237 (= res!559685 (= lt!368575 lt!368578))))

(assert (=> b!820237 (= lt!368578 (+!1867 lt!368580 lt!368577))))

(assert (=> b!820237 (= lt!368577 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2469 (array!45432 array!45434 (_ BitVec 32) (_ BitVec 32) V!24493 V!24493 (_ BitVec 32) Int) ListLongMap!8515)

(assert (=> b!820237 (= lt!368576 (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820237 (= lt!368575 (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70602 res!559686) b!820229))

(assert (= (and b!820229 res!559687) b!820232))

(assert (= (and b!820232 res!559682) b!820233))

(assert (= (and b!820233 res!559683) b!820230))

(assert (= (and b!820230 (not res!559684)) b!820237))

(assert (= (and b!820237 res!559685) b!820235))

(assert (= (and b!820237 (not res!559688)) b!820231))

(assert (= (and b!820234 condMapEmpty!23530) mapIsEmpty!23530))

(assert (= (and b!820234 (not condMapEmpty!23530)) mapNonEmpty!23530))

(get-info :version)

(assert (= (and mapNonEmpty!23530 ((_ is ValueCellFull!6894) mapValue!23530)) b!820228))

(assert (= (and b!820234 ((_ is ValueCellFull!6894) mapDefault!23530)) b!820236))

(assert (= start!70602 b!820234))

(declare-fun m!762107 () Bool)

(assert (=> b!820235 m!762107))

(declare-fun m!762109 () Bool)

(assert (=> mapNonEmpty!23530 m!762109))

(declare-fun m!762111 () Bool)

(assert (=> start!70602 m!762111))

(declare-fun m!762113 () Bool)

(assert (=> start!70602 m!762113))

(declare-fun m!762115 () Bool)

(assert (=> start!70602 m!762115))

(declare-fun m!762117 () Bool)

(assert (=> b!820232 m!762117))

(declare-fun m!762119 () Bool)

(assert (=> b!820230 m!762119))

(declare-fun m!762121 () Bool)

(assert (=> b!820230 m!762121))

(declare-fun m!762123 () Bool)

(assert (=> b!820230 m!762123))

(declare-fun m!762125 () Bool)

(assert (=> b!820233 m!762125))

(declare-fun m!762127 () Bool)

(assert (=> b!820237 m!762127))

(declare-fun m!762129 () Bool)

(assert (=> b!820237 m!762129))

(declare-fun m!762131 () Bool)

(assert (=> b!820237 m!762131))

(assert (=> b!820237 m!762127))

(declare-fun m!762133 () Bool)

(assert (=> b!820237 m!762133))

(declare-fun m!762135 () Bool)

(assert (=> b!820237 m!762135))

(declare-fun m!762137 () Bool)

(assert (=> b!820237 m!762137))

(declare-fun m!762139 () Bool)

(assert (=> b!820237 m!762139))

(declare-fun m!762141 () Bool)

(assert (=> b!820237 m!762141))

(check-sat tp_is_empty!14619 (not b_next!12909) (not b!820237) (not b!820232) (not b!820235) b_and!21751 (not mapNonEmpty!23530) (not start!70602) (not b!820233) (not b!820230))
(check-sat b_and!21751 (not b_next!12909))
(get-model)

(declare-fun d!104705 () Bool)

(declare-fun e!455700 () Bool)

(assert (=> d!104705 e!455700))

(declare-fun res!559714 () Bool)

(assert (=> d!104705 (=> (not res!559714) (not e!455700))))

(declare-fun lt!368617 () ListLongMap!8515)

(declare-fun contains!4162 (ListLongMap!8515 (_ BitVec 64)) Bool)

(assert (=> d!104705 (= res!559714 (contains!4162 lt!368617 (_1!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!368618 () List!15514)

(assert (=> d!104705 (= lt!368617 (ListLongMap!8516 lt!368618))))

(declare-fun lt!368616 () Unit!28023)

(declare-fun lt!368619 () Unit!28023)

(assert (=> d!104705 (= lt!368616 lt!368619)))

(declare-datatypes ((Option!409 0))(
  ( (Some!408 (v!9789 V!24493)) (None!407) )
))
(declare-fun getValueByKey!403 (List!15514 (_ BitVec 64)) Option!409)

(assert (=> d!104705 (= (getValueByKey!403 lt!368618 (_1!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!408 (_2!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!217 (List!15514 (_ BitVec 64) V!24493) Unit!28023)

(assert (=> d!104705 (= lt!368619 (lemmaContainsTupThenGetReturnValue!217 lt!368618 (_1!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!256 (List!15514 (_ BitVec 64) V!24493) List!15514)

(assert (=> d!104705 (= lt!368618 (insertStrictlySorted!256 (toList!4273 lt!368579) (_1!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104705 (= (+!1867 lt!368579 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!368617)))

(declare-fun b!820272 () Bool)

(declare-fun res!559715 () Bool)

(assert (=> b!820272 (=> (not res!559715) (not e!455700))))

(assert (=> b!820272 (= res!559715 (= (getValueByKey!403 (toList!4273 lt!368617) (_1!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!408 (_2!4857 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!820273 () Bool)

(declare-fun contains!4163 (List!15514 tuple2!9692) Bool)

(assert (=> b!820273 (= e!455700 (contains!4163 (toList!4273 lt!368617) (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104705 res!559714) b!820272))

(assert (= (and b!820272 res!559715) b!820273))

(declare-fun m!762179 () Bool)

(assert (=> d!104705 m!762179))

(declare-fun m!762181 () Bool)

(assert (=> d!104705 m!762181))

(declare-fun m!762183 () Bool)

(assert (=> d!104705 m!762183))

(declare-fun m!762185 () Bool)

(assert (=> d!104705 m!762185))

(declare-fun m!762187 () Bool)

(assert (=> b!820272 m!762187))

(declare-fun m!762189 () Bool)

(assert (=> b!820273 m!762189))

(assert (=> b!820235 d!104705))

(declare-fun b!820282 () Bool)

(declare-fun e!455707 () Bool)

(declare-fun e!455708 () Bool)

(assert (=> b!820282 (= e!455707 e!455708)))

(declare-fun c!89171 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!820282 (= c!89171 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820283 () Bool)

(declare-fun call!35677 () Bool)

(assert (=> b!820283 (= e!455708 call!35677)))

(declare-fun d!104707 () Bool)

(declare-fun res!559721 () Bool)

(assert (=> d!104707 (=> res!559721 e!455707)))

(assert (=> d!104707 (= res!559721 (bvsge #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> d!104707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!455707)))

(declare-fun b!820284 () Bool)

(declare-fun e!455709 () Bool)

(assert (=> b!820284 (= e!455709 call!35677)))

(declare-fun bm!35674 () Bool)

(assert (=> bm!35674 (= call!35677 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!820285 () Bool)

(assert (=> b!820285 (= e!455708 e!455709)))

(declare-fun lt!368627 () (_ BitVec 64))

(assert (=> b!820285 (= lt!368627 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368626 () Unit!28023)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45432 (_ BitVec 64) (_ BitVec 32)) Unit!28023)

(assert (=> b!820285 (= lt!368626 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!368627 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!820285 (arrayContainsKey!0 _keys!976 lt!368627 #b00000000000000000000000000000000)))

(declare-fun lt!368628 () Unit!28023)

(assert (=> b!820285 (= lt!368628 lt!368626)))

(declare-fun res!559720 () Bool)

(declare-datatypes ((SeekEntryResult!8727 0))(
  ( (MissingZero!8727 (index!37279 (_ BitVec 32))) (Found!8727 (index!37280 (_ BitVec 32))) (Intermediate!8727 (undefined!9539 Bool) (index!37281 (_ BitVec 32)) (x!69121 (_ BitVec 32))) (Undefined!8727) (MissingVacant!8727 (index!37282 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45432 (_ BitVec 32)) SeekEntryResult!8727)

(assert (=> b!820285 (= res!559720 (= (seekEntryOrOpen!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8727 #b00000000000000000000000000000000)))))

(assert (=> b!820285 (=> (not res!559720) (not e!455709))))

(assert (= (and d!104707 (not res!559721)) b!820282))

(assert (= (and b!820282 c!89171) b!820285))

(assert (= (and b!820282 (not c!89171)) b!820283))

(assert (= (and b!820285 res!559720) b!820284))

(assert (= (or b!820284 b!820283) bm!35674))

(declare-fun m!762191 () Bool)

(assert (=> b!820282 m!762191))

(assert (=> b!820282 m!762191))

(declare-fun m!762193 () Bool)

(assert (=> b!820282 m!762193))

(declare-fun m!762195 () Bool)

(assert (=> bm!35674 m!762195))

(assert (=> b!820285 m!762191))

(declare-fun m!762197 () Bool)

(assert (=> b!820285 m!762197))

(declare-fun m!762199 () Bool)

(assert (=> b!820285 m!762199))

(assert (=> b!820285 m!762191))

(declare-fun m!762201 () Bool)

(assert (=> b!820285 m!762201))

(assert (=> b!820232 d!104707))

(declare-fun d!104709 () Bool)

(assert (=> d!104709 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70602 d!104709))

(declare-fun d!104711 () Bool)

(assert (=> d!104711 (= (array_inv!17401 _keys!976) (bvsge (size!22190 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70602 d!104711))

(declare-fun d!104713 () Bool)

(assert (=> d!104713 (= (array_inv!17402 _values!788) (bvsge (size!22191 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70602 d!104713))

(declare-fun d!104715 () Bool)

(declare-fun e!455710 () Bool)

(assert (=> d!104715 e!455710))

(declare-fun res!559722 () Bool)

(assert (=> d!104715 (=> (not res!559722) (not e!455710))))

(declare-fun lt!368630 () ListLongMap!8515)

(assert (=> d!104715 (= res!559722 (contains!4162 lt!368630 (_1!4857 lt!368577)))))

(declare-fun lt!368631 () List!15514)

(assert (=> d!104715 (= lt!368630 (ListLongMap!8516 lt!368631))))

(declare-fun lt!368629 () Unit!28023)

(declare-fun lt!368632 () Unit!28023)

(assert (=> d!104715 (= lt!368629 lt!368632)))

(assert (=> d!104715 (= (getValueByKey!403 lt!368631 (_1!4857 lt!368577)) (Some!408 (_2!4857 lt!368577)))))

(assert (=> d!104715 (= lt!368632 (lemmaContainsTupThenGetReturnValue!217 lt!368631 (_1!4857 lt!368577) (_2!4857 lt!368577)))))

(assert (=> d!104715 (= lt!368631 (insertStrictlySorted!256 (toList!4273 lt!368579) (_1!4857 lt!368577) (_2!4857 lt!368577)))))

(assert (=> d!104715 (= (+!1867 lt!368579 lt!368577) lt!368630)))

(declare-fun b!820286 () Bool)

(declare-fun res!559723 () Bool)

(assert (=> b!820286 (=> (not res!559723) (not e!455710))))

(assert (=> b!820286 (= res!559723 (= (getValueByKey!403 (toList!4273 lt!368630) (_1!4857 lt!368577)) (Some!408 (_2!4857 lt!368577))))))

(declare-fun b!820287 () Bool)

(assert (=> b!820287 (= e!455710 (contains!4163 (toList!4273 lt!368630) lt!368577))))

(assert (= (and d!104715 res!559722) b!820286))

(assert (= (and b!820286 res!559723) b!820287))

(declare-fun m!762203 () Bool)

(assert (=> d!104715 m!762203))

(declare-fun m!762205 () Bool)

(assert (=> d!104715 m!762205))

(declare-fun m!762207 () Bool)

(assert (=> d!104715 m!762207))

(declare-fun m!762209 () Bool)

(assert (=> d!104715 m!762209))

(declare-fun m!762211 () Bool)

(assert (=> b!820286 m!762211))

(declare-fun m!762213 () Bool)

(assert (=> b!820287 m!762213))

(assert (=> b!820237 d!104715))

(declare-fun d!104717 () Bool)

(declare-fun e!455711 () Bool)

(assert (=> d!104717 e!455711))

(declare-fun res!559724 () Bool)

(assert (=> d!104717 (=> (not res!559724) (not e!455711))))

(declare-fun lt!368634 () ListLongMap!8515)

(assert (=> d!104717 (= res!559724 (contains!4162 lt!368634 (_1!4857 lt!368574)))))

(declare-fun lt!368635 () List!15514)

(assert (=> d!104717 (= lt!368634 (ListLongMap!8516 lt!368635))))

(declare-fun lt!368633 () Unit!28023)

(declare-fun lt!368636 () Unit!28023)

(assert (=> d!104717 (= lt!368633 lt!368636)))

(assert (=> d!104717 (= (getValueByKey!403 lt!368635 (_1!4857 lt!368574)) (Some!408 (_2!4857 lt!368574)))))

(assert (=> d!104717 (= lt!368636 (lemmaContainsTupThenGetReturnValue!217 lt!368635 (_1!4857 lt!368574) (_2!4857 lt!368574)))))

(assert (=> d!104717 (= lt!368635 (insertStrictlySorted!256 (toList!4273 lt!368580) (_1!4857 lt!368574) (_2!4857 lt!368574)))))

(assert (=> d!104717 (= (+!1867 lt!368580 lt!368574) lt!368634)))

(declare-fun b!820288 () Bool)

(declare-fun res!559725 () Bool)

(assert (=> b!820288 (=> (not res!559725) (not e!455711))))

(assert (=> b!820288 (= res!559725 (= (getValueByKey!403 (toList!4273 lt!368634) (_1!4857 lt!368574)) (Some!408 (_2!4857 lt!368574))))))

(declare-fun b!820289 () Bool)

(assert (=> b!820289 (= e!455711 (contains!4163 (toList!4273 lt!368634) lt!368574))))

(assert (= (and d!104717 res!559724) b!820288))

(assert (= (and b!820288 res!559725) b!820289))

(declare-fun m!762215 () Bool)

(assert (=> d!104717 m!762215))

(declare-fun m!762217 () Bool)

(assert (=> d!104717 m!762217))

(declare-fun m!762219 () Bool)

(assert (=> d!104717 m!762219))

(declare-fun m!762221 () Bool)

(assert (=> d!104717 m!762221))

(declare-fun m!762223 () Bool)

(assert (=> b!820288 m!762223))

(declare-fun m!762225 () Bool)

(assert (=> b!820289 m!762225))

(assert (=> b!820237 d!104717))

(declare-fun b!820332 () Bool)

(declare-fun e!455747 () Bool)

(assert (=> b!820332 (= e!455747 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820333 () Bool)

(declare-fun e!455745 () Bool)

(declare-fun lt!368699 () ListLongMap!8515)

(declare-fun apply!355 (ListLongMap!8515 (_ BitVec 64)) V!24493)

(assert (=> b!820333 (= e!455745 (= (apply!355 lt!368699 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!820334 () Bool)

(declare-fun e!455744 () Bool)

(declare-fun e!455740 () Bool)

(assert (=> b!820334 (= e!455744 e!455740)))

(declare-fun res!559752 () Bool)

(declare-fun call!35694 () Bool)

(assert (=> b!820334 (= res!559752 call!35694)))

(assert (=> b!820334 (=> (not res!559752) (not e!455740))))

(declare-fun b!820335 () Bool)

(declare-fun res!559745 () Bool)

(declare-fun e!455739 () Bool)

(assert (=> b!820335 (=> (not res!559745) (not e!455739))))

(assert (=> b!820335 (= res!559745 e!455744)))

(declare-fun c!89188 () Bool)

(assert (=> b!820335 (= c!89188 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35690 () Bool)

(declare-fun call!35693 () ListLongMap!8515)

(declare-fun call!35698 () ListLongMap!8515)

(assert (=> bm!35690 (= call!35693 call!35698)))

(declare-fun b!820336 () Bool)

(declare-fun e!455742 () Bool)

(declare-fun get!11604 (ValueCell!6894 V!24493) V!24493)

(declare-fun dynLambda!966 (Int (_ BitVec 64)) V!24493)

(assert (=> b!820336 (= e!455742 (= (apply!355 lt!368699 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)) (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!820336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22191 _values!788)))))

(assert (=> b!820336 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun bm!35691 () Bool)

(declare-fun call!35695 () ListLongMap!8515)

(declare-fun call!35697 () ListLongMap!8515)

(assert (=> bm!35691 (= call!35695 call!35697)))

(declare-fun b!820337 () Bool)

(declare-fun e!455743 () Unit!28023)

(declare-fun Unit!28025 () Unit!28023)

(assert (=> b!820337 (= e!455743 Unit!28025)))

(declare-fun b!820338 () Bool)

(declare-fun e!455750 () ListLongMap!8515)

(assert (=> b!820338 (= e!455750 (+!1867 call!35698 (tuple2!9693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!820339 () Bool)

(declare-fun e!455738 () Bool)

(declare-fun call!35692 () Bool)

(assert (=> b!820339 (= e!455738 (not call!35692))))

(declare-fun bm!35692 () Bool)

(assert (=> bm!35692 (= call!35694 (contains!4162 lt!368699 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!35696 () ListLongMap!8515)

(declare-fun bm!35693 () Bool)

(assert (=> bm!35693 (= call!35696 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun c!89185 () Bool)

(declare-fun bm!35694 () Bool)

(declare-fun c!89187 () Bool)

(assert (=> bm!35694 (= call!35698 (+!1867 (ite c!89185 call!35696 (ite c!89187 call!35697 call!35695)) (ite (or c!89185 c!89187) (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35695 () Bool)

(assert (=> bm!35695 (= call!35697 call!35696)))

(declare-fun b!820340 () Bool)

(declare-fun e!455749 () Bool)

(assert (=> b!820340 (= e!455749 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820341 () Bool)

(declare-fun e!455746 () Bool)

(assert (=> b!820341 (= e!455746 e!455742)))

(declare-fun res!559744 () Bool)

(assert (=> b!820341 (=> (not res!559744) (not e!455742))))

(assert (=> b!820341 (= res!559744 (contains!4162 lt!368699 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820341 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820342 () Bool)

(declare-fun c!89184 () Bool)

(assert (=> b!820342 (= c!89184 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!455748 () ListLongMap!8515)

(declare-fun e!455741 () ListLongMap!8515)

(assert (=> b!820342 (= e!455748 e!455741)))

(declare-fun b!820343 () Bool)

(assert (=> b!820343 (= e!455744 (not call!35694))))

(declare-fun b!820344 () Bool)

(assert (=> b!820344 (= e!455741 call!35693)))

(declare-fun b!820345 () Bool)

(assert (=> b!820345 (= e!455738 e!455745)))

(declare-fun res!559749 () Bool)

(assert (=> b!820345 (= res!559749 call!35692)))

(assert (=> b!820345 (=> (not res!559749) (not e!455745))))

(declare-fun b!820346 () Bool)

(assert (=> b!820346 (= e!455741 call!35695)))

(declare-fun b!820347 () Bool)

(declare-fun lt!368693 () Unit!28023)

(assert (=> b!820347 (= e!455743 lt!368693)))

(declare-fun lt!368698 () ListLongMap!8515)

(assert (=> b!820347 (= lt!368698 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368689 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368689 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368696 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368696 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368697 () Unit!28023)

(declare-fun addStillContains!309 (ListLongMap!8515 (_ BitVec 64) V!24493 (_ BitVec 64)) Unit!28023)

(assert (=> b!820347 (= lt!368697 (addStillContains!309 lt!368698 lt!368689 zeroValueAfter!34 lt!368696))))

(assert (=> b!820347 (contains!4162 (+!1867 lt!368698 (tuple2!9693 lt!368689 zeroValueAfter!34)) lt!368696)))

(declare-fun lt!368688 () Unit!28023)

(assert (=> b!820347 (= lt!368688 lt!368697)))

(declare-fun lt!368694 () ListLongMap!8515)

(assert (=> b!820347 (= lt!368694 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368682 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368682 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368702 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368702 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368691 () Unit!28023)

(declare-fun addApplyDifferent!309 (ListLongMap!8515 (_ BitVec 64) V!24493 (_ BitVec 64)) Unit!28023)

(assert (=> b!820347 (= lt!368691 (addApplyDifferent!309 lt!368694 lt!368682 minValue!754 lt!368702))))

(assert (=> b!820347 (= (apply!355 (+!1867 lt!368694 (tuple2!9693 lt!368682 minValue!754)) lt!368702) (apply!355 lt!368694 lt!368702))))

(declare-fun lt!368700 () Unit!28023)

(assert (=> b!820347 (= lt!368700 lt!368691)))

(declare-fun lt!368690 () ListLongMap!8515)

(assert (=> b!820347 (= lt!368690 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368701 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368685 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368685 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368695 () Unit!28023)

(assert (=> b!820347 (= lt!368695 (addApplyDifferent!309 lt!368690 lt!368701 zeroValueAfter!34 lt!368685))))

(assert (=> b!820347 (= (apply!355 (+!1867 lt!368690 (tuple2!9693 lt!368701 zeroValueAfter!34)) lt!368685) (apply!355 lt!368690 lt!368685))))

(declare-fun lt!368683 () Unit!28023)

(assert (=> b!820347 (= lt!368683 lt!368695)))

(declare-fun lt!368681 () ListLongMap!8515)

(assert (=> b!820347 (= lt!368681 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368686 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368686 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368692 () (_ BitVec 64))

(assert (=> b!820347 (= lt!368692 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820347 (= lt!368693 (addApplyDifferent!309 lt!368681 lt!368686 minValue!754 lt!368692))))

(assert (=> b!820347 (= (apply!355 (+!1867 lt!368681 (tuple2!9693 lt!368686 minValue!754)) lt!368692) (apply!355 lt!368681 lt!368692))))

(declare-fun b!820348 () Bool)

(assert (=> b!820348 (= e!455740 (= (apply!355 lt!368699 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun bm!35689 () Bool)

(assert (=> bm!35689 (= call!35692 (contains!4162 lt!368699 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!104719 () Bool)

(assert (=> d!104719 e!455739))

(declare-fun res!559747 () Bool)

(assert (=> d!104719 (=> (not res!559747) (not e!455739))))

(assert (=> d!104719 (= res!559747 (or (bvsge #b00000000000000000000000000000000 (size!22190 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))))

(declare-fun lt!368687 () ListLongMap!8515)

(assert (=> d!104719 (= lt!368699 lt!368687)))

(declare-fun lt!368684 () Unit!28023)

(assert (=> d!104719 (= lt!368684 e!455743)))

(declare-fun c!89186 () Bool)

(assert (=> d!104719 (= c!89186 e!455749)))

(declare-fun res!559748 () Bool)

(assert (=> d!104719 (=> (not res!559748) (not e!455749))))

(assert (=> d!104719 (= res!559748 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> d!104719 (= lt!368687 e!455750)))

(assert (=> d!104719 (= c!89185 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104719 (validMask!0 mask!1312)))

(assert (=> d!104719 (= (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368699)))

(declare-fun b!820349 () Bool)

(assert (=> b!820349 (= e!455739 e!455738)))

(declare-fun c!89189 () Bool)

(assert (=> b!820349 (= c!89189 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820350 () Bool)

(assert (=> b!820350 (= e!455748 call!35693)))

(declare-fun b!820351 () Bool)

(assert (=> b!820351 (= e!455750 e!455748)))

(assert (=> b!820351 (= c!89187 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820352 () Bool)

(declare-fun res!559751 () Bool)

(assert (=> b!820352 (=> (not res!559751) (not e!455739))))

(assert (=> b!820352 (= res!559751 e!455746)))

(declare-fun res!559746 () Bool)

(assert (=> b!820352 (=> res!559746 e!455746)))

(assert (=> b!820352 (= res!559746 (not e!455747))))

(declare-fun res!559750 () Bool)

(assert (=> b!820352 (=> (not res!559750) (not e!455747))))

(assert (=> b!820352 (= res!559750 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (= (and d!104719 c!89185) b!820338))

(assert (= (and d!104719 (not c!89185)) b!820351))

(assert (= (and b!820351 c!89187) b!820350))

(assert (= (and b!820351 (not c!89187)) b!820342))

(assert (= (and b!820342 c!89184) b!820344))

(assert (= (and b!820342 (not c!89184)) b!820346))

(assert (= (or b!820344 b!820346) bm!35691))

(assert (= (or b!820350 bm!35691) bm!35695))

(assert (= (or b!820350 b!820344) bm!35690))

(assert (= (or b!820338 bm!35695) bm!35693))

(assert (= (or b!820338 bm!35690) bm!35694))

(assert (= (and d!104719 res!559748) b!820340))

(assert (= (and d!104719 c!89186) b!820347))

(assert (= (and d!104719 (not c!89186)) b!820337))

(assert (= (and d!104719 res!559747) b!820352))

(assert (= (and b!820352 res!559750) b!820332))

(assert (= (and b!820352 (not res!559746)) b!820341))

(assert (= (and b!820341 res!559744) b!820336))

(assert (= (and b!820352 res!559751) b!820335))

(assert (= (and b!820335 c!89188) b!820334))

(assert (= (and b!820335 (not c!89188)) b!820343))

(assert (= (and b!820334 res!559752) b!820348))

(assert (= (or b!820334 b!820343) bm!35692))

(assert (= (and b!820335 res!559745) b!820349))

(assert (= (and b!820349 c!89189) b!820345))

(assert (= (and b!820349 (not c!89189)) b!820339))

(assert (= (and b!820345 res!559749) b!820333))

(assert (= (or b!820345 b!820339) bm!35689))

(declare-fun b_lambda!10971 () Bool)

(assert (=> (not b_lambda!10971) (not b!820336)))

(declare-fun t!21849 () Bool)

(declare-fun tb!4191 () Bool)

(assert (=> (and start!70602 (= defaultEntry!796 defaultEntry!796) t!21849) tb!4191))

(declare-fun result!7913 () Bool)

(assert (=> tb!4191 (= result!7913 tp_is_empty!14619)))

(assert (=> b!820336 t!21849))

(declare-fun b_and!21755 () Bool)

(assert (= b_and!21751 (and (=> t!21849 result!7913) b_and!21755)))

(declare-fun m!762227 () Bool)

(assert (=> b!820348 m!762227))

(declare-fun m!762229 () Bool)

(assert (=> b!820336 m!762229))

(assert (=> b!820336 m!762191))

(assert (=> b!820336 m!762191))

(declare-fun m!762231 () Bool)

(assert (=> b!820336 m!762231))

(declare-fun m!762233 () Bool)

(assert (=> b!820336 m!762233))

(assert (=> b!820336 m!762229))

(assert (=> b!820336 m!762233))

(declare-fun m!762235 () Bool)

(assert (=> b!820336 m!762235))

(declare-fun m!762237 () Bool)

(assert (=> bm!35694 m!762237))

(assert (=> b!820340 m!762191))

(assert (=> b!820340 m!762191))

(assert (=> b!820340 m!762193))

(declare-fun m!762239 () Bool)

(assert (=> bm!35689 m!762239))

(assert (=> bm!35693 m!762121))

(declare-fun m!762241 () Bool)

(assert (=> bm!35692 m!762241))

(declare-fun m!762243 () Bool)

(assert (=> b!820347 m!762243))

(declare-fun m!762245 () Bool)

(assert (=> b!820347 m!762245))

(assert (=> b!820347 m!762121))

(assert (=> b!820347 m!762245))

(declare-fun m!762247 () Bool)

(assert (=> b!820347 m!762247))

(declare-fun m!762249 () Bool)

(assert (=> b!820347 m!762249))

(declare-fun m!762251 () Bool)

(assert (=> b!820347 m!762251))

(assert (=> b!820347 m!762191))

(declare-fun m!762253 () Bool)

(assert (=> b!820347 m!762253))

(declare-fun m!762255 () Bool)

(assert (=> b!820347 m!762255))

(declare-fun m!762257 () Bool)

(assert (=> b!820347 m!762257))

(assert (=> b!820347 m!762243))

(declare-fun m!762259 () Bool)

(assert (=> b!820347 m!762259))

(assert (=> b!820347 m!762249))

(declare-fun m!762261 () Bool)

(assert (=> b!820347 m!762261))

(declare-fun m!762263 () Bool)

(assert (=> b!820347 m!762263))

(declare-fun m!762265 () Bool)

(assert (=> b!820347 m!762265))

(assert (=> b!820347 m!762253))

(declare-fun m!762267 () Bool)

(assert (=> b!820347 m!762267))

(declare-fun m!762269 () Bool)

(assert (=> b!820347 m!762269))

(declare-fun m!762271 () Bool)

(assert (=> b!820347 m!762271))

(assert (=> b!820341 m!762191))

(assert (=> b!820341 m!762191))

(declare-fun m!762273 () Bool)

(assert (=> b!820341 m!762273))

(assert (=> d!104719 m!762111))

(assert (=> b!820332 m!762191))

(assert (=> b!820332 m!762191))

(assert (=> b!820332 m!762193))

(declare-fun m!762275 () Bool)

(assert (=> b!820338 m!762275))

(declare-fun m!762277 () Bool)

(assert (=> b!820333 m!762277))

(assert (=> b!820237 d!104719))

(declare-fun d!104721 () Bool)

(declare-fun e!455751 () Bool)

(assert (=> d!104721 e!455751))

(declare-fun res!559753 () Bool)

(assert (=> d!104721 (=> (not res!559753) (not e!455751))))

(declare-fun lt!368704 () ListLongMap!8515)

(assert (=> d!104721 (= res!559753 (contains!4162 lt!368704 (_1!4857 lt!368577)))))

(declare-fun lt!368705 () List!15514)

(assert (=> d!104721 (= lt!368704 (ListLongMap!8516 lt!368705))))

(declare-fun lt!368703 () Unit!28023)

(declare-fun lt!368706 () Unit!28023)

(assert (=> d!104721 (= lt!368703 lt!368706)))

(assert (=> d!104721 (= (getValueByKey!403 lt!368705 (_1!4857 lt!368577)) (Some!408 (_2!4857 lt!368577)))))

(assert (=> d!104721 (= lt!368706 (lemmaContainsTupThenGetReturnValue!217 lt!368705 (_1!4857 lt!368577) (_2!4857 lt!368577)))))

(assert (=> d!104721 (= lt!368705 (insertStrictlySorted!256 (toList!4273 lt!368580) (_1!4857 lt!368577) (_2!4857 lt!368577)))))

(assert (=> d!104721 (= (+!1867 lt!368580 lt!368577) lt!368704)))

(declare-fun b!820355 () Bool)

(declare-fun res!559754 () Bool)

(assert (=> b!820355 (=> (not res!559754) (not e!455751))))

(assert (=> b!820355 (= res!559754 (= (getValueByKey!403 (toList!4273 lt!368704) (_1!4857 lt!368577)) (Some!408 (_2!4857 lt!368577))))))

(declare-fun b!820356 () Bool)

(assert (=> b!820356 (= e!455751 (contains!4163 (toList!4273 lt!368704) lt!368577))))

(assert (= (and d!104721 res!559753) b!820355))

(assert (= (and b!820355 res!559754) b!820356))

(declare-fun m!762279 () Bool)

(assert (=> d!104721 m!762279))

(declare-fun m!762281 () Bool)

(assert (=> d!104721 m!762281))

(declare-fun m!762283 () Bool)

(assert (=> d!104721 m!762283))

(declare-fun m!762285 () Bool)

(assert (=> d!104721 m!762285))

(declare-fun m!762287 () Bool)

(assert (=> b!820355 m!762287))

(declare-fun m!762289 () Bool)

(assert (=> b!820356 m!762289))

(assert (=> b!820237 d!104721))

(declare-fun d!104723 () Bool)

(assert (=> d!104723 (= (+!1867 lt!368580 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1867 (+!1867 lt!368580 (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!368709 () Unit!28023)

(declare-fun choose!1395 (ListLongMap!8515 (_ BitVec 64) V!24493 V!24493) Unit!28023)

(assert (=> d!104723 (= lt!368709 (choose!1395 lt!368580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!104723 (= (addSameAsAddTwiceSameKeyDiffValues!203 lt!368580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!368709)))

(declare-fun bs!22869 () Bool)

(assert (= bs!22869 d!104723))

(declare-fun m!762291 () Bool)

(assert (=> bs!22869 m!762291))

(declare-fun m!762293 () Bool)

(assert (=> bs!22869 m!762293))

(assert (=> bs!22869 m!762293))

(declare-fun m!762295 () Bool)

(assert (=> bs!22869 m!762295))

(declare-fun m!762297 () Bool)

(assert (=> bs!22869 m!762297))

(assert (=> b!820237 d!104723))

(declare-fun d!104725 () Bool)

(declare-fun e!455752 () Bool)

(assert (=> d!104725 e!455752))

(declare-fun res!559755 () Bool)

(assert (=> d!104725 (=> (not res!559755) (not e!455752))))

(declare-fun lt!368711 () ListLongMap!8515)

(assert (=> d!104725 (= res!559755 (contains!4162 lt!368711 (_1!4857 lt!368574)))))

(declare-fun lt!368712 () List!15514)

(assert (=> d!104725 (= lt!368711 (ListLongMap!8516 lt!368712))))

(declare-fun lt!368710 () Unit!28023)

(declare-fun lt!368713 () Unit!28023)

(assert (=> d!104725 (= lt!368710 lt!368713)))

(assert (=> d!104725 (= (getValueByKey!403 lt!368712 (_1!4857 lt!368574)) (Some!408 (_2!4857 lt!368574)))))

(assert (=> d!104725 (= lt!368713 (lemmaContainsTupThenGetReturnValue!217 lt!368712 (_1!4857 lt!368574) (_2!4857 lt!368574)))))

(assert (=> d!104725 (= lt!368712 (insertStrictlySorted!256 (toList!4273 (+!1867 lt!368579 lt!368577)) (_1!4857 lt!368574) (_2!4857 lt!368574)))))

(assert (=> d!104725 (= (+!1867 (+!1867 lt!368579 lt!368577) lt!368574) lt!368711)))

(declare-fun b!820357 () Bool)

(declare-fun res!559756 () Bool)

(assert (=> b!820357 (=> (not res!559756) (not e!455752))))

(assert (=> b!820357 (= res!559756 (= (getValueByKey!403 (toList!4273 lt!368711) (_1!4857 lt!368574)) (Some!408 (_2!4857 lt!368574))))))

(declare-fun b!820358 () Bool)

(assert (=> b!820358 (= e!455752 (contains!4163 (toList!4273 lt!368711) lt!368574))))

(assert (= (and d!104725 res!559755) b!820357))

(assert (= (and b!820357 res!559756) b!820358))

(declare-fun m!762299 () Bool)

(assert (=> d!104725 m!762299))

(declare-fun m!762301 () Bool)

(assert (=> d!104725 m!762301))

(declare-fun m!762303 () Bool)

(assert (=> d!104725 m!762303))

(declare-fun m!762305 () Bool)

(assert (=> d!104725 m!762305))

(declare-fun m!762307 () Bool)

(assert (=> b!820357 m!762307))

(declare-fun m!762309 () Bool)

(assert (=> b!820358 m!762309))

(assert (=> b!820237 d!104725))

(declare-fun d!104727 () Bool)

(declare-fun e!455753 () Bool)

(assert (=> d!104727 e!455753))

(declare-fun res!559757 () Bool)

(assert (=> d!104727 (=> (not res!559757) (not e!455753))))

(declare-fun lt!368715 () ListLongMap!8515)

(assert (=> d!104727 (= res!559757 (contains!4162 lt!368715 (_1!4857 lt!368574)))))

(declare-fun lt!368716 () List!15514)

(assert (=> d!104727 (= lt!368715 (ListLongMap!8516 lt!368716))))

(declare-fun lt!368714 () Unit!28023)

(declare-fun lt!368717 () Unit!28023)

(assert (=> d!104727 (= lt!368714 lt!368717)))

(assert (=> d!104727 (= (getValueByKey!403 lt!368716 (_1!4857 lt!368574)) (Some!408 (_2!4857 lt!368574)))))

(assert (=> d!104727 (= lt!368717 (lemmaContainsTupThenGetReturnValue!217 lt!368716 (_1!4857 lt!368574) (_2!4857 lt!368574)))))

(assert (=> d!104727 (= lt!368716 (insertStrictlySorted!256 (toList!4273 lt!368578) (_1!4857 lt!368574) (_2!4857 lt!368574)))))

(assert (=> d!104727 (= (+!1867 lt!368578 lt!368574) lt!368715)))

(declare-fun b!820359 () Bool)

(declare-fun res!559758 () Bool)

(assert (=> b!820359 (=> (not res!559758) (not e!455753))))

(assert (=> b!820359 (= res!559758 (= (getValueByKey!403 (toList!4273 lt!368715) (_1!4857 lt!368574)) (Some!408 (_2!4857 lt!368574))))))

(declare-fun b!820360 () Bool)

(assert (=> b!820360 (= e!455753 (contains!4163 (toList!4273 lt!368715) lt!368574))))

(assert (= (and d!104727 res!559757) b!820359))

(assert (= (and b!820359 res!559758) b!820360))

(declare-fun m!762311 () Bool)

(assert (=> d!104727 m!762311))

(declare-fun m!762313 () Bool)

(assert (=> d!104727 m!762313))

(declare-fun m!762315 () Bool)

(assert (=> d!104727 m!762315))

(declare-fun m!762317 () Bool)

(assert (=> d!104727 m!762317))

(declare-fun m!762319 () Bool)

(assert (=> b!820359 m!762319))

(declare-fun m!762321 () Bool)

(assert (=> b!820360 m!762321))

(assert (=> b!820237 d!104727))

(declare-fun b!820361 () Bool)

(declare-fun e!455763 () Bool)

(assert (=> b!820361 (= e!455763 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820362 () Bool)

(declare-fun e!455761 () Bool)

(declare-fun lt!368736 () ListLongMap!8515)

(assert (=> b!820362 (= e!455761 (= (apply!355 lt!368736 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!820363 () Bool)

(declare-fun e!455760 () Bool)

(declare-fun e!455756 () Bool)

(assert (=> b!820363 (= e!455760 e!455756)))

(declare-fun res!559767 () Bool)

(declare-fun call!35701 () Bool)

(assert (=> b!820363 (= res!559767 call!35701)))

(assert (=> b!820363 (=> (not res!559767) (not e!455756))))

(declare-fun b!820364 () Bool)

(declare-fun res!559760 () Bool)

(declare-fun e!455755 () Bool)

(assert (=> b!820364 (=> (not res!559760) (not e!455755))))

(assert (=> b!820364 (= res!559760 e!455760)))

(declare-fun c!89194 () Bool)

(assert (=> b!820364 (= c!89194 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35697 () Bool)

(declare-fun call!35700 () ListLongMap!8515)

(declare-fun call!35705 () ListLongMap!8515)

(assert (=> bm!35697 (= call!35700 call!35705)))

(declare-fun b!820365 () Bool)

(declare-fun e!455758 () Bool)

(assert (=> b!820365 (= e!455758 (= (apply!355 lt!368736 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)) (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!820365 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22191 _values!788)))))

(assert (=> b!820365 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun bm!35698 () Bool)

(declare-fun call!35702 () ListLongMap!8515)

(declare-fun call!35704 () ListLongMap!8515)

(assert (=> bm!35698 (= call!35702 call!35704)))

(declare-fun b!820366 () Bool)

(declare-fun e!455759 () Unit!28023)

(declare-fun Unit!28026 () Unit!28023)

(assert (=> b!820366 (= e!455759 Unit!28026)))

(declare-fun b!820367 () Bool)

(declare-fun e!455766 () ListLongMap!8515)

(assert (=> b!820367 (= e!455766 (+!1867 call!35705 (tuple2!9693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!820368 () Bool)

(declare-fun e!455754 () Bool)

(declare-fun call!35699 () Bool)

(assert (=> b!820368 (= e!455754 (not call!35699))))

(declare-fun bm!35699 () Bool)

(assert (=> bm!35699 (= call!35701 (contains!4162 lt!368736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!35700 () Bool)

(declare-fun call!35703 () ListLongMap!8515)

(assert (=> bm!35700 (= call!35703 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun bm!35701 () Bool)

(declare-fun c!89193 () Bool)

(declare-fun c!89191 () Bool)

(assert (=> bm!35701 (= call!35705 (+!1867 (ite c!89191 call!35703 (ite c!89193 call!35704 call!35702)) (ite (or c!89191 c!89193) (tuple2!9693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9693 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!35702 () Bool)

(assert (=> bm!35702 (= call!35704 call!35703)))

(declare-fun b!820369 () Bool)

(declare-fun e!455765 () Bool)

(assert (=> b!820369 (= e!455765 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820370 () Bool)

(declare-fun e!455762 () Bool)

(assert (=> b!820370 (= e!455762 e!455758)))

(declare-fun res!559759 () Bool)

(assert (=> b!820370 (=> (not res!559759) (not e!455758))))

(assert (=> b!820370 (= res!559759 (contains!4162 lt!368736 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820370 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820371 () Bool)

(declare-fun c!89190 () Bool)

(assert (=> b!820371 (= c!89190 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!455764 () ListLongMap!8515)

(declare-fun e!455757 () ListLongMap!8515)

(assert (=> b!820371 (= e!455764 e!455757)))

(declare-fun b!820372 () Bool)

(assert (=> b!820372 (= e!455760 (not call!35701))))

(declare-fun b!820373 () Bool)

(assert (=> b!820373 (= e!455757 call!35700)))

(declare-fun b!820374 () Bool)

(assert (=> b!820374 (= e!455754 e!455761)))

(declare-fun res!559764 () Bool)

(assert (=> b!820374 (= res!559764 call!35699)))

(assert (=> b!820374 (=> (not res!559764) (not e!455761))))

(declare-fun b!820375 () Bool)

(assert (=> b!820375 (= e!455757 call!35702)))

(declare-fun b!820376 () Bool)

(declare-fun lt!368730 () Unit!28023)

(assert (=> b!820376 (= e!455759 lt!368730)))

(declare-fun lt!368735 () ListLongMap!8515)

(assert (=> b!820376 (= lt!368735 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368726 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368726 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368733 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368733 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368734 () Unit!28023)

(assert (=> b!820376 (= lt!368734 (addStillContains!309 lt!368735 lt!368726 zeroValueBefore!34 lt!368733))))

(assert (=> b!820376 (contains!4162 (+!1867 lt!368735 (tuple2!9693 lt!368726 zeroValueBefore!34)) lt!368733)))

(declare-fun lt!368725 () Unit!28023)

(assert (=> b!820376 (= lt!368725 lt!368734)))

(declare-fun lt!368731 () ListLongMap!8515)

(assert (=> b!820376 (= lt!368731 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368719 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368719 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368739 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368739 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368728 () Unit!28023)

(assert (=> b!820376 (= lt!368728 (addApplyDifferent!309 lt!368731 lt!368719 minValue!754 lt!368739))))

(assert (=> b!820376 (= (apply!355 (+!1867 lt!368731 (tuple2!9693 lt!368719 minValue!754)) lt!368739) (apply!355 lt!368731 lt!368739))))

(declare-fun lt!368737 () Unit!28023)

(assert (=> b!820376 (= lt!368737 lt!368728)))

(declare-fun lt!368727 () ListLongMap!8515)

(assert (=> b!820376 (= lt!368727 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368738 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368738 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368722 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368722 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!368732 () Unit!28023)

(assert (=> b!820376 (= lt!368732 (addApplyDifferent!309 lt!368727 lt!368738 zeroValueBefore!34 lt!368722))))

(assert (=> b!820376 (= (apply!355 (+!1867 lt!368727 (tuple2!9693 lt!368738 zeroValueBefore!34)) lt!368722) (apply!355 lt!368727 lt!368722))))

(declare-fun lt!368720 () Unit!28023)

(assert (=> b!820376 (= lt!368720 lt!368732)))

(declare-fun lt!368718 () ListLongMap!8515)

(assert (=> b!820376 (= lt!368718 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368723 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368723 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!368729 () (_ BitVec 64))

(assert (=> b!820376 (= lt!368729 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!820376 (= lt!368730 (addApplyDifferent!309 lt!368718 lt!368723 minValue!754 lt!368729))))

(assert (=> b!820376 (= (apply!355 (+!1867 lt!368718 (tuple2!9693 lt!368723 minValue!754)) lt!368729) (apply!355 lt!368718 lt!368729))))

(declare-fun b!820377 () Bool)

(assert (=> b!820377 (= e!455756 (= (apply!355 lt!368736 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun bm!35696 () Bool)

(assert (=> bm!35696 (= call!35699 (contains!4162 lt!368736 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!104729 () Bool)

(assert (=> d!104729 e!455755))

(declare-fun res!559762 () Bool)

(assert (=> d!104729 (=> (not res!559762) (not e!455755))))

(assert (=> d!104729 (= res!559762 (or (bvsge #b00000000000000000000000000000000 (size!22190 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))))

(declare-fun lt!368724 () ListLongMap!8515)

(assert (=> d!104729 (= lt!368736 lt!368724)))

(declare-fun lt!368721 () Unit!28023)

(assert (=> d!104729 (= lt!368721 e!455759)))

(declare-fun c!89192 () Bool)

(assert (=> d!104729 (= c!89192 e!455765)))

(declare-fun res!559763 () Bool)

(assert (=> d!104729 (=> (not res!559763) (not e!455765))))

(assert (=> d!104729 (= res!559763 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> d!104729 (= lt!368724 e!455766)))

(assert (=> d!104729 (= c!89191 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104729 (validMask!0 mask!1312)))

(assert (=> d!104729 (= (getCurrentListMap!2469 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368736)))

(declare-fun b!820378 () Bool)

(assert (=> b!820378 (= e!455755 e!455754)))

(declare-fun c!89195 () Bool)

(assert (=> b!820378 (= c!89195 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820379 () Bool)

(assert (=> b!820379 (= e!455764 call!35700)))

(declare-fun b!820380 () Bool)

(assert (=> b!820380 (= e!455766 e!455764)))

(assert (=> b!820380 (= c!89193 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!820381 () Bool)

(declare-fun res!559766 () Bool)

(assert (=> b!820381 (=> (not res!559766) (not e!455755))))

(assert (=> b!820381 (= res!559766 e!455762)))

(declare-fun res!559761 () Bool)

(assert (=> b!820381 (=> res!559761 e!455762)))

(assert (=> b!820381 (= res!559761 (not e!455763))))

(declare-fun res!559765 () Bool)

(assert (=> b!820381 (=> (not res!559765) (not e!455763))))

(assert (=> b!820381 (= res!559765 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (= (and d!104729 c!89191) b!820367))

(assert (= (and d!104729 (not c!89191)) b!820380))

(assert (= (and b!820380 c!89193) b!820379))

(assert (= (and b!820380 (not c!89193)) b!820371))

(assert (= (and b!820371 c!89190) b!820373))

(assert (= (and b!820371 (not c!89190)) b!820375))

(assert (= (or b!820373 b!820375) bm!35698))

(assert (= (or b!820379 bm!35698) bm!35702))

(assert (= (or b!820379 b!820373) bm!35697))

(assert (= (or b!820367 bm!35702) bm!35700))

(assert (= (or b!820367 bm!35697) bm!35701))

(assert (= (and d!104729 res!559763) b!820369))

(assert (= (and d!104729 c!89192) b!820376))

(assert (= (and d!104729 (not c!89192)) b!820366))

(assert (= (and d!104729 res!559762) b!820381))

(assert (= (and b!820381 res!559765) b!820361))

(assert (= (and b!820381 (not res!559761)) b!820370))

(assert (= (and b!820370 res!559759) b!820365))

(assert (= (and b!820381 res!559766) b!820364))

(assert (= (and b!820364 c!89194) b!820363))

(assert (= (and b!820364 (not c!89194)) b!820372))

(assert (= (and b!820363 res!559767) b!820377))

(assert (= (or b!820363 b!820372) bm!35699))

(assert (= (and b!820364 res!559760) b!820378))

(assert (= (and b!820378 c!89195) b!820374))

(assert (= (and b!820378 (not c!89195)) b!820368))

(assert (= (and b!820374 res!559764) b!820362))

(assert (= (or b!820374 b!820368) bm!35696))

(declare-fun b_lambda!10973 () Bool)

(assert (=> (not b_lambda!10973) (not b!820365)))

(assert (=> b!820365 t!21849))

(declare-fun b_and!21757 () Bool)

(assert (= b_and!21755 (and (=> t!21849 result!7913) b_and!21757)))

(declare-fun m!762323 () Bool)

(assert (=> b!820377 m!762323))

(assert (=> b!820365 m!762229))

(assert (=> b!820365 m!762191))

(assert (=> b!820365 m!762191))

(declare-fun m!762325 () Bool)

(assert (=> b!820365 m!762325))

(assert (=> b!820365 m!762233))

(assert (=> b!820365 m!762229))

(assert (=> b!820365 m!762233))

(assert (=> b!820365 m!762235))

(declare-fun m!762327 () Bool)

(assert (=> bm!35701 m!762327))

(assert (=> b!820369 m!762191))

(assert (=> b!820369 m!762191))

(assert (=> b!820369 m!762193))

(declare-fun m!762329 () Bool)

(assert (=> bm!35696 m!762329))

(assert (=> bm!35700 m!762123))

(declare-fun m!762331 () Bool)

(assert (=> bm!35699 m!762331))

(declare-fun m!762333 () Bool)

(assert (=> b!820376 m!762333))

(declare-fun m!762335 () Bool)

(assert (=> b!820376 m!762335))

(assert (=> b!820376 m!762123))

(assert (=> b!820376 m!762335))

(declare-fun m!762337 () Bool)

(assert (=> b!820376 m!762337))

(declare-fun m!762339 () Bool)

(assert (=> b!820376 m!762339))

(declare-fun m!762341 () Bool)

(assert (=> b!820376 m!762341))

(assert (=> b!820376 m!762191))

(declare-fun m!762343 () Bool)

(assert (=> b!820376 m!762343))

(declare-fun m!762345 () Bool)

(assert (=> b!820376 m!762345))

(declare-fun m!762347 () Bool)

(assert (=> b!820376 m!762347))

(assert (=> b!820376 m!762333))

(declare-fun m!762349 () Bool)

(assert (=> b!820376 m!762349))

(assert (=> b!820376 m!762339))

(declare-fun m!762351 () Bool)

(assert (=> b!820376 m!762351))

(declare-fun m!762353 () Bool)

(assert (=> b!820376 m!762353))

(declare-fun m!762355 () Bool)

(assert (=> b!820376 m!762355))

(assert (=> b!820376 m!762343))

(declare-fun m!762357 () Bool)

(assert (=> b!820376 m!762357))

(declare-fun m!762359 () Bool)

(assert (=> b!820376 m!762359))

(declare-fun m!762361 () Bool)

(assert (=> b!820376 m!762361))

(assert (=> b!820370 m!762191))

(assert (=> b!820370 m!762191))

(declare-fun m!762363 () Bool)

(assert (=> b!820370 m!762363))

(assert (=> d!104729 m!762111))

(assert (=> b!820361 m!762191))

(assert (=> b!820361 m!762191))

(assert (=> b!820361 m!762193))

(declare-fun m!762365 () Bool)

(assert (=> b!820367 m!762365))

(declare-fun m!762367 () Bool)

(assert (=> b!820362 m!762367))

(assert (=> b!820237 d!104729))

(declare-fun b!820392 () Bool)

(declare-fun e!455777 () Bool)

(declare-fun e!455775 () Bool)

(assert (=> b!820392 (= e!455777 e!455775)))

(declare-fun c!89198 () Bool)

(assert (=> b!820392 (= c!89198 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104731 () Bool)

(declare-fun res!559774 () Bool)

(declare-fun e!455776 () Bool)

(assert (=> d!104731 (=> res!559774 e!455776)))

(assert (=> d!104731 (= res!559774 (bvsge #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> d!104731 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15512) e!455776)))

(declare-fun b!820393 () Bool)

(assert (=> b!820393 (= e!455776 e!455777)))

(declare-fun res!559776 () Bool)

(assert (=> b!820393 (=> (not res!559776) (not e!455777))))

(declare-fun e!455778 () Bool)

(assert (=> b!820393 (= res!559776 (not e!455778))))

(declare-fun res!559775 () Bool)

(assert (=> b!820393 (=> (not res!559775) (not e!455778))))

(assert (=> b!820393 (= res!559775 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!820394 () Bool)

(declare-fun call!35708 () Bool)

(assert (=> b!820394 (= e!455775 call!35708)))

(declare-fun b!820395 () Bool)

(assert (=> b!820395 (= e!455775 call!35708)))

(declare-fun bm!35705 () Bool)

(assert (=> bm!35705 (= call!35708 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89198 (Cons!15511 (select (arr!21769 _keys!976) #b00000000000000000000000000000000) Nil!15512) Nil!15512)))))

(declare-fun b!820396 () Bool)

(declare-fun contains!4164 (List!15515 (_ BitVec 64)) Bool)

(assert (=> b!820396 (= e!455778 (contains!4164 Nil!15512 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104731 (not res!559774)) b!820393))

(assert (= (and b!820393 res!559775) b!820396))

(assert (= (and b!820393 res!559776) b!820392))

(assert (= (and b!820392 c!89198) b!820395))

(assert (= (and b!820392 (not c!89198)) b!820394))

(assert (= (or b!820395 b!820394) bm!35705))

(assert (=> b!820392 m!762191))

(assert (=> b!820392 m!762191))

(assert (=> b!820392 m!762193))

(assert (=> b!820393 m!762191))

(assert (=> b!820393 m!762191))

(assert (=> b!820393 m!762193))

(assert (=> bm!35705 m!762191))

(declare-fun m!762369 () Bool)

(assert (=> bm!35705 m!762369))

(assert (=> b!820396 m!762191))

(assert (=> b!820396 m!762191))

(declare-fun m!762371 () Bool)

(assert (=> b!820396 m!762371))

(assert (=> b!820233 d!104731))

(declare-fun d!104733 () Bool)

(assert (=> d!104733 (= (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!368742 () Unit!28023)

(declare-fun choose!1396 (array!45432 array!45434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24493 V!24493 V!24493 V!24493 (_ BitVec 32) Int) Unit!28023)

(assert (=> d!104733 (= lt!368742 (choose!1396 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104733 (validMask!0 mask!1312)))

(assert (=> d!104733 (= (lemmaNoChangeToArrayThenSameMapNoExtras!410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368742)))

(declare-fun bs!22870 () Bool)

(assert (= bs!22870 d!104733))

(assert (=> bs!22870 m!762123))

(assert (=> bs!22870 m!762121))

(declare-fun m!762373 () Bool)

(assert (=> bs!22870 m!762373))

(assert (=> bs!22870 m!762111))

(assert (=> b!820230 d!104733))

(declare-fun b!820421 () Bool)

(declare-fun e!455798 () Bool)

(declare-fun e!455796 () Bool)

(assert (=> b!820421 (= e!455798 e!455796)))

(declare-fun c!89210 () Bool)

(declare-fun e!455797 () Bool)

(assert (=> b!820421 (= c!89210 e!455797)))

(declare-fun res!559786 () Bool)

(assert (=> b!820421 (=> (not res!559786) (not e!455797))))

(assert (=> b!820421 (= res!559786 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820422 () Bool)

(declare-fun res!559787 () Bool)

(assert (=> b!820422 (=> (not res!559787) (not e!455798))))

(declare-fun lt!368758 () ListLongMap!8515)

(assert (=> b!820422 (= res!559787 (not (contains!4162 lt!368758 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!820423 () Bool)

(declare-fun lt!368760 () Unit!28023)

(declare-fun lt!368759 () Unit!28023)

(assert (=> b!820423 (= lt!368760 lt!368759)))

(declare-fun lt!368762 () (_ BitVec 64))

(declare-fun lt!368763 () ListLongMap!8515)

(declare-fun lt!368757 () (_ BitVec 64))

(declare-fun lt!368761 () V!24493)

(assert (=> b!820423 (not (contains!4162 (+!1867 lt!368763 (tuple2!9693 lt!368757 lt!368761)) lt!368762))))

(declare-fun addStillNotContains!180 (ListLongMap!8515 (_ BitVec 64) V!24493 (_ BitVec 64)) Unit!28023)

(assert (=> b!820423 (= lt!368759 (addStillNotContains!180 lt!368763 lt!368757 lt!368761 lt!368762))))

(assert (=> b!820423 (= lt!368762 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820423 (= lt!368761 (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820423 (= lt!368757 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35711 () ListLongMap!8515)

(assert (=> b!820423 (= lt!368763 call!35711)))

(declare-fun e!455794 () ListLongMap!8515)

(assert (=> b!820423 (= e!455794 (+!1867 call!35711 (tuple2!9693 (select (arr!21769 _keys!976) #b00000000000000000000000000000000) (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!820424 () Bool)

(declare-fun e!455795 () ListLongMap!8515)

(assert (=> b!820424 (= e!455795 (ListLongMap!8516 Nil!15511))))

(declare-fun d!104735 () Bool)

(assert (=> d!104735 e!455798))

(declare-fun res!559788 () Bool)

(assert (=> d!104735 (=> (not res!559788) (not e!455798))))

(assert (=> d!104735 (= res!559788 (not (contains!4162 lt!368758 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104735 (= lt!368758 e!455795)))

(declare-fun c!89209 () Bool)

(assert (=> d!104735 (= c!89209 (bvsge #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> d!104735 (validMask!0 mask!1312)))

(assert (=> d!104735 (= (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368758)))

(declare-fun b!820425 () Bool)

(declare-fun e!455793 () Bool)

(declare-fun isEmpty!637 (ListLongMap!8515) Bool)

(assert (=> b!820425 (= e!455793 (isEmpty!637 lt!368758))))

(declare-fun b!820426 () Bool)

(assert (=> b!820426 (= e!455797 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820426 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!820427 () Bool)

(assert (=> b!820427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> b!820427 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22191 _values!788)))))

(declare-fun e!455799 () Bool)

(assert (=> b!820427 (= e!455799 (= (apply!355 lt!368758 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)) (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820428 () Bool)

(assert (=> b!820428 (= e!455796 e!455793)))

(declare-fun c!89208 () Bool)

(assert (=> b!820428 (= c!89208 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820429 () Bool)

(assert (=> b!820429 (= e!455794 call!35711)))

(declare-fun b!820430 () Bool)

(assert (=> b!820430 (= e!455793 (= lt!368758 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820431 () Bool)

(assert (=> b!820431 (= e!455795 e!455794)))

(declare-fun c!89207 () Bool)

(assert (=> b!820431 (= c!89207 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35708 () Bool)

(assert (=> bm!35708 (= call!35711 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820432 () Bool)

(assert (=> b!820432 (= e!455796 e!455799)))

(assert (=> b!820432 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun res!559785 () Bool)

(assert (=> b!820432 (= res!559785 (contains!4162 lt!368758 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820432 (=> (not res!559785) (not e!455799))))

(assert (= (and d!104735 c!89209) b!820424))

(assert (= (and d!104735 (not c!89209)) b!820431))

(assert (= (and b!820431 c!89207) b!820423))

(assert (= (and b!820431 (not c!89207)) b!820429))

(assert (= (or b!820423 b!820429) bm!35708))

(assert (= (and d!104735 res!559788) b!820422))

(assert (= (and b!820422 res!559787) b!820421))

(assert (= (and b!820421 res!559786) b!820426))

(assert (= (and b!820421 c!89210) b!820432))

(assert (= (and b!820421 (not c!89210)) b!820428))

(assert (= (and b!820432 res!559785) b!820427))

(assert (= (and b!820428 c!89208) b!820430))

(assert (= (and b!820428 (not c!89208)) b!820425))

(declare-fun b_lambda!10975 () Bool)

(assert (=> (not b_lambda!10975) (not b!820423)))

(assert (=> b!820423 t!21849))

(declare-fun b_and!21759 () Bool)

(assert (= b_and!21757 (and (=> t!21849 result!7913) b_and!21759)))

(declare-fun b_lambda!10977 () Bool)

(assert (=> (not b_lambda!10977) (not b!820427)))

(assert (=> b!820427 t!21849))

(declare-fun b_and!21761 () Bool)

(assert (= b_and!21759 (and (=> t!21849 result!7913) b_and!21761)))

(assert (=> b!820432 m!762191))

(assert (=> b!820432 m!762191))

(declare-fun m!762375 () Bool)

(assert (=> b!820432 m!762375))

(declare-fun m!762377 () Bool)

(assert (=> d!104735 m!762377))

(assert (=> d!104735 m!762111))

(declare-fun m!762379 () Bool)

(assert (=> b!820422 m!762379))

(declare-fun m!762381 () Bool)

(assert (=> b!820423 m!762381))

(declare-fun m!762383 () Bool)

(assert (=> b!820423 m!762383))

(assert (=> b!820423 m!762381))

(declare-fun m!762385 () Bool)

(assert (=> b!820423 m!762385))

(assert (=> b!820423 m!762233))

(declare-fun m!762387 () Bool)

(assert (=> b!820423 m!762387))

(assert (=> b!820423 m!762191))

(assert (=> b!820423 m!762229))

(assert (=> b!820423 m!762233))

(assert (=> b!820423 m!762235))

(assert (=> b!820423 m!762229))

(declare-fun m!762389 () Bool)

(assert (=> b!820425 m!762389))

(declare-fun m!762391 () Bool)

(assert (=> bm!35708 m!762391))

(assert (=> b!820426 m!762191))

(assert (=> b!820426 m!762191))

(assert (=> b!820426 m!762193))

(assert (=> b!820430 m!762391))

(assert (=> b!820431 m!762191))

(assert (=> b!820431 m!762191))

(assert (=> b!820431 m!762193))

(assert (=> b!820427 m!762233))

(assert (=> b!820427 m!762191))

(assert (=> b!820427 m!762191))

(declare-fun m!762393 () Bool)

(assert (=> b!820427 m!762393))

(assert (=> b!820427 m!762229))

(assert (=> b!820427 m!762233))

(assert (=> b!820427 m!762235))

(assert (=> b!820427 m!762229))

(assert (=> b!820230 d!104735))

(declare-fun b!820433 () Bool)

(declare-fun e!455805 () Bool)

(declare-fun e!455803 () Bool)

(assert (=> b!820433 (= e!455805 e!455803)))

(declare-fun c!89214 () Bool)

(declare-fun e!455804 () Bool)

(assert (=> b!820433 (= c!89214 e!455804)))

(declare-fun res!559790 () Bool)

(assert (=> b!820433 (=> (not res!559790) (not e!455804))))

(assert (=> b!820433 (= res!559790 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820434 () Bool)

(declare-fun res!559791 () Bool)

(assert (=> b!820434 (=> (not res!559791) (not e!455805))))

(declare-fun lt!368765 () ListLongMap!8515)

(assert (=> b!820434 (= res!559791 (not (contains!4162 lt!368765 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!820435 () Bool)

(declare-fun lt!368767 () Unit!28023)

(declare-fun lt!368766 () Unit!28023)

(assert (=> b!820435 (= lt!368767 lt!368766)))

(declare-fun lt!368769 () (_ BitVec 64))

(declare-fun lt!368770 () ListLongMap!8515)

(declare-fun lt!368764 () (_ BitVec 64))

(declare-fun lt!368768 () V!24493)

(assert (=> b!820435 (not (contains!4162 (+!1867 lt!368770 (tuple2!9693 lt!368764 lt!368768)) lt!368769))))

(assert (=> b!820435 (= lt!368766 (addStillNotContains!180 lt!368770 lt!368764 lt!368768 lt!368769))))

(assert (=> b!820435 (= lt!368769 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!820435 (= lt!368768 (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!820435 (= lt!368764 (select (arr!21769 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35712 () ListLongMap!8515)

(assert (=> b!820435 (= lt!368770 call!35712)))

(declare-fun e!455801 () ListLongMap!8515)

(assert (=> b!820435 (= e!455801 (+!1867 call!35712 (tuple2!9693 (select (arr!21769 _keys!976) #b00000000000000000000000000000000) (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!820436 () Bool)

(declare-fun e!455802 () ListLongMap!8515)

(assert (=> b!820436 (= e!455802 (ListLongMap!8516 Nil!15511))))

(declare-fun d!104737 () Bool)

(assert (=> d!104737 e!455805))

(declare-fun res!559792 () Bool)

(assert (=> d!104737 (=> (not res!559792) (not e!455805))))

(assert (=> d!104737 (= res!559792 (not (contains!4162 lt!368765 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104737 (= lt!368765 e!455802)))

(declare-fun c!89213 () Bool)

(assert (=> d!104737 (= c!89213 (bvsge #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> d!104737 (validMask!0 mask!1312)))

(assert (=> d!104737 (= (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!368765)))

(declare-fun b!820437 () Bool)

(declare-fun e!455800 () Bool)

(assert (=> b!820437 (= e!455800 (isEmpty!637 lt!368765))))

(declare-fun b!820438 () Bool)

(assert (=> b!820438 (= e!455804 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820438 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!820439 () Bool)

(assert (=> b!820439 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(assert (=> b!820439 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22191 _values!788)))))

(declare-fun e!455806 () Bool)

(assert (=> b!820439 (= e!455806 (= (apply!355 lt!368765 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)) (get!11604 (select (arr!21770 _values!788) #b00000000000000000000000000000000) (dynLambda!966 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!820440 () Bool)

(assert (=> b!820440 (= e!455803 e!455800)))

(declare-fun c!89212 () Bool)

(assert (=> b!820440 (= c!89212 (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun b!820441 () Bool)

(assert (=> b!820441 (= e!455801 call!35712)))

(declare-fun b!820442 () Bool)

(assert (=> b!820442 (= e!455800 (= lt!368765 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!820443 () Bool)

(assert (=> b!820443 (= e!455802 e!455801)))

(declare-fun c!89211 () Bool)

(assert (=> b!820443 (= c!89211 (validKeyInArray!0 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35709 () Bool)

(assert (=> bm!35709 (= call!35712 (getCurrentListMapNoExtraKeys!2300 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!820444 () Bool)

(assert (=> b!820444 (= e!455803 e!455806)))

(assert (=> b!820444 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22190 _keys!976)))))

(declare-fun res!559789 () Bool)

(assert (=> b!820444 (= res!559789 (contains!4162 lt!368765 (select (arr!21769 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!820444 (=> (not res!559789) (not e!455806))))

(assert (= (and d!104737 c!89213) b!820436))

(assert (= (and d!104737 (not c!89213)) b!820443))

(assert (= (and b!820443 c!89211) b!820435))

(assert (= (and b!820443 (not c!89211)) b!820441))

(assert (= (or b!820435 b!820441) bm!35709))

(assert (= (and d!104737 res!559792) b!820434))

(assert (= (and b!820434 res!559791) b!820433))

(assert (= (and b!820433 res!559790) b!820438))

(assert (= (and b!820433 c!89214) b!820444))

(assert (= (and b!820433 (not c!89214)) b!820440))

(assert (= (and b!820444 res!559789) b!820439))

(assert (= (and b!820440 c!89212) b!820442))

(assert (= (and b!820440 (not c!89212)) b!820437))

(declare-fun b_lambda!10979 () Bool)

(assert (=> (not b_lambda!10979) (not b!820435)))

(assert (=> b!820435 t!21849))

(declare-fun b_and!21763 () Bool)

(assert (= b_and!21761 (and (=> t!21849 result!7913) b_and!21763)))

(declare-fun b_lambda!10981 () Bool)

(assert (=> (not b_lambda!10981) (not b!820439)))

(assert (=> b!820439 t!21849))

(declare-fun b_and!21765 () Bool)

(assert (= b_and!21763 (and (=> t!21849 result!7913) b_and!21765)))

(assert (=> b!820444 m!762191))

(assert (=> b!820444 m!762191))

(declare-fun m!762395 () Bool)

(assert (=> b!820444 m!762395))

(declare-fun m!762397 () Bool)

(assert (=> d!104737 m!762397))

(assert (=> d!104737 m!762111))

(declare-fun m!762399 () Bool)

(assert (=> b!820434 m!762399))

(declare-fun m!762401 () Bool)

(assert (=> b!820435 m!762401))

(declare-fun m!762403 () Bool)

(assert (=> b!820435 m!762403))

(assert (=> b!820435 m!762401))

(declare-fun m!762405 () Bool)

(assert (=> b!820435 m!762405))

(assert (=> b!820435 m!762233))

(declare-fun m!762407 () Bool)

(assert (=> b!820435 m!762407))

(assert (=> b!820435 m!762191))

(assert (=> b!820435 m!762229))

(assert (=> b!820435 m!762233))

(assert (=> b!820435 m!762235))

(assert (=> b!820435 m!762229))

(declare-fun m!762409 () Bool)

(assert (=> b!820437 m!762409))

(declare-fun m!762411 () Bool)

(assert (=> bm!35709 m!762411))

(assert (=> b!820438 m!762191))

(assert (=> b!820438 m!762191))

(assert (=> b!820438 m!762193))

(assert (=> b!820442 m!762411))

(assert (=> b!820443 m!762191))

(assert (=> b!820443 m!762191))

(assert (=> b!820443 m!762193))

(assert (=> b!820439 m!762233))

(assert (=> b!820439 m!762191))

(assert (=> b!820439 m!762191))

(declare-fun m!762413 () Bool)

(assert (=> b!820439 m!762413))

(assert (=> b!820439 m!762229))

(assert (=> b!820439 m!762233))

(assert (=> b!820439 m!762235))

(assert (=> b!820439 m!762229))

(assert (=> b!820230 d!104737))

(declare-fun mapIsEmpty!23536 () Bool)

(declare-fun mapRes!23536 () Bool)

(assert (=> mapIsEmpty!23536 mapRes!23536))

(declare-fun condMapEmpty!23536 () Bool)

(declare-fun mapDefault!23536 () ValueCell!6894)

(assert (=> mapNonEmpty!23530 (= condMapEmpty!23536 (= mapRest!23530 ((as const (Array (_ BitVec 32) ValueCell!6894)) mapDefault!23536)))))

(declare-fun e!455812 () Bool)

(assert (=> mapNonEmpty!23530 (= tp!45462 (and e!455812 mapRes!23536))))

(declare-fun b!820451 () Bool)

(declare-fun e!455811 () Bool)

(assert (=> b!820451 (= e!455811 tp_is_empty!14619)))

(declare-fun mapNonEmpty!23536 () Bool)

(declare-fun tp!45472 () Bool)

(assert (=> mapNonEmpty!23536 (= mapRes!23536 (and tp!45472 e!455811))))

(declare-fun mapKey!23536 () (_ BitVec 32))

(declare-fun mapValue!23536 () ValueCell!6894)

(declare-fun mapRest!23536 () (Array (_ BitVec 32) ValueCell!6894))

(assert (=> mapNonEmpty!23536 (= mapRest!23530 (store mapRest!23536 mapKey!23536 mapValue!23536))))

(declare-fun b!820452 () Bool)

(assert (=> b!820452 (= e!455812 tp_is_empty!14619)))

(assert (= (and mapNonEmpty!23530 condMapEmpty!23536) mapIsEmpty!23536))

(assert (= (and mapNonEmpty!23530 (not condMapEmpty!23536)) mapNonEmpty!23536))

(assert (= (and mapNonEmpty!23536 ((_ is ValueCellFull!6894) mapValue!23536)) b!820451))

(assert (= (and mapNonEmpty!23530 ((_ is ValueCellFull!6894) mapDefault!23536)) b!820452))

(declare-fun m!762415 () Bool)

(assert (=> mapNonEmpty!23536 m!762415))

(declare-fun b_lambda!10983 () Bool)

(assert (= b_lambda!10971 (or (and start!70602 b_free!12909) b_lambda!10983)))

(declare-fun b_lambda!10985 () Bool)

(assert (= b_lambda!10973 (or (and start!70602 b_free!12909) b_lambda!10985)))

(declare-fun b_lambda!10987 () Bool)

(assert (= b_lambda!10979 (or (and start!70602 b_free!12909) b_lambda!10987)))

(declare-fun b_lambda!10989 () Bool)

(assert (= b_lambda!10981 (or (and start!70602 b_free!12909) b_lambda!10989)))

(declare-fun b_lambda!10991 () Bool)

(assert (= b_lambda!10977 (or (and start!70602 b_free!12909) b_lambda!10991)))

(declare-fun b_lambda!10993 () Bool)

(assert (= b_lambda!10975 (or (and start!70602 b_free!12909) b_lambda!10993)))

(check-sat (not b!820431) (not d!104715) (not d!104719) (not b!820333) (not bm!35708) (not b!820336) (not b!820439) (not b!820393) (not b!820426) (not b!820288) (not b!820365) (not b_lambda!10989) (not b!820341) (not b!820422) (not b!820356) b_and!21765 (not b!820443) (not b!820332) (not b!820444) (not d!104705) (not d!104725) (not b!820273) (not b!820437) (not d!104721) tp_is_empty!14619 (not b!820360) (not b_next!12909) (not b_lambda!10993) (not b!820286) (not d!104727) (not bm!35705) (not b_lambda!10983) (not b!820282) (not b!820367) (not b!820430) (not b_lambda!10985) (not d!104723) (not b!820369) (not d!104737) (not mapNonEmpty!23536) (not b!820358) (not d!104729) (not d!104717) (not b!820432) (not bm!35692) (not b!820338) (not b!820377) (not b!820376) (not b!820427) (not b!820285) (not b!820435) (not b!820425) (not b!820289) (not b!820287) (not b!820392) (not b_lambda!10991) (not b!820361) (not b!820362) (not b!820370) (not b!820434) (not b!820348) (not b!820272) (not b!820396) (not b_lambda!10987) (not b!820359) (not bm!35696) (not b!820340) (not bm!35693) (not d!104735) (not b!820355) (not bm!35674) (not bm!35694) (not bm!35699) (not b!820438) (not b!820347) (not b!820442) (not d!104733) (not bm!35709) (not bm!35701) (not b!820423) (not bm!35689) (not b!820357) (not bm!35700))
(check-sat b_and!21765 (not b_next!12909))
