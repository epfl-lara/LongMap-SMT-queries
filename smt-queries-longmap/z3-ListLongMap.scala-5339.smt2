; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71344 () Bool)

(assert start!71344)

(declare-fun b_free!13443 () Bool)

(declare-fun b_next!13443 () Bool)

(assert (=> start!71344 (= b_free!13443 (not b_next!13443))))

(declare-fun tp!47101 () Bool)

(declare-fun b_and!22413 () Bool)

(assert (=> start!71344 (= tp!47101 b_and!22413)))

(declare-fun mapIsEmpty!24367 () Bool)

(declare-fun mapRes!24367 () Bool)

(assert (=> mapIsEmpty!24367 mapRes!24367))

(declare-fun mapNonEmpty!24367 () Bool)

(declare-fun tp!47100 () Bool)

(declare-fun e!461730 () Bool)

(assert (=> mapNonEmpty!24367 (= mapRes!24367 (and tp!47100 e!461730))))

(declare-fun mapKey!24367 () (_ BitVec 32))

(declare-datatypes ((V!25205 0))(
  ( (V!25206 (val!7624 Int)) )
))
(declare-datatypes ((ValueCell!7161 0))(
  ( (ValueCellFull!7161 (v!10061 V!25205)) (EmptyCell!7161) )
))
(declare-fun mapRest!24367 () (Array (_ BitVec 32) ValueCell!7161))

(declare-datatypes ((array!46472 0))(
  ( (array!46473 (arr!22277 (Array (_ BitVec 32) ValueCell!7161)) (size!22698 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46472)

(declare-fun mapValue!24367 () ValueCell!7161)

(assert (=> mapNonEmpty!24367 (= (arr!22277 _values!788) (store mapRest!24367 mapKey!24367 mapValue!24367))))

(declare-fun b!828578 () Bool)

(declare-fun tp_is_empty!15153 () Bool)

(assert (=> b!828578 (= e!461730 tp_is_empty!15153)))

(declare-fun b!828579 () Bool)

(declare-fun e!461732 () Bool)

(declare-fun e!461733 () Bool)

(assert (=> b!828579 (= e!461732 (and e!461733 mapRes!24367))))

(declare-fun condMapEmpty!24367 () Bool)

(declare-fun mapDefault!24367 () ValueCell!7161)

(assert (=> b!828579 (= condMapEmpty!24367 (= (arr!22277 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7161)) mapDefault!24367)))))

(declare-fun b!828580 () Bool)

(declare-fun res!564572 () Bool)

(declare-fun e!461729 () Bool)

(assert (=> b!828580 (=> (not res!564572) (not e!461729))))

(declare-datatypes ((array!46474 0))(
  ( (array!46475 (arr!22278 (Array (_ BitVec 32) (_ BitVec 64))) (size!22699 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46474)

(declare-datatypes ((List!15902 0))(
  ( (Nil!15899) (Cons!15898 (h!17027 (_ BitVec 64)) (t!22257 List!15902)) )
))
(declare-fun arrayNoDuplicates!0 (array!46474 (_ BitVec 32) List!15902) Bool)

(assert (=> b!828580 (= res!564572 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15899))))

(declare-fun b!828581 () Bool)

(declare-fun e!461734 () Bool)

(assert (=> b!828581 (= e!461729 (not e!461734))))

(declare-fun res!564577 () Bool)

(assert (=> b!828581 (=> res!564577 e!461734)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!828581 (= res!564577 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!461728 () Bool)

(assert (=> b!828581 e!461728))

(declare-fun res!564575 () Bool)

(assert (=> b!828581 (=> (not res!564575) (not e!461728))))

(declare-datatypes ((tuple2!10110 0))(
  ( (tuple2!10111 (_1!5066 (_ BitVec 64)) (_2!5066 V!25205)) )
))
(declare-datatypes ((List!15903 0))(
  ( (Nil!15900) (Cons!15899 (h!17028 tuple2!10110) (t!22258 List!15903)) )
))
(declare-datatypes ((ListLongMap!8933 0))(
  ( (ListLongMap!8934 (toList!4482 List!15903)) )
))
(declare-fun lt!375472 () ListLongMap!8933)

(declare-fun lt!375471 () ListLongMap!8933)

(assert (=> b!828581 (= res!564575 (= lt!375472 lt!375471))))

(declare-fun zeroValueBefore!34 () V!25205)

(declare-fun zeroValueAfter!34 () V!25205)

(declare-fun minValue!754 () V!25205)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28383 0))(
  ( (Unit!28384) )
))
(declare-fun lt!375470 () Unit!28383)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!571 (array!46474 array!46472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25205 V!25205 V!25205 V!25205 (_ BitVec 32) Int) Unit!28383)

(assert (=> b!828581 (= lt!375470 (lemmaNoChangeToArrayThenSameMapNoExtras!571 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2483 (array!46474 array!46472 (_ BitVec 32) (_ BitVec 32) V!25205 V!25205 (_ BitVec 32) Int) ListLongMap!8933)

(assert (=> b!828581 (= lt!375471 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828581 (= lt!375472 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828582 () Bool)

(assert (=> b!828582 (= e!461733 tp_is_empty!15153)))

(declare-fun b!828583 () Bool)

(declare-fun res!564574 () Bool)

(assert (=> b!828583 (=> (not res!564574) (not e!461729))))

(assert (=> b!828583 (= res!564574 (and (= (size!22698 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22699 _keys!976) (size!22698 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828584 () Bool)

(declare-fun res!564573 () Bool)

(assert (=> b!828584 (=> (not res!564573) (not e!461729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46474 (_ BitVec 32)) Bool)

(assert (=> b!828584 (= res!564573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564576 () Bool)

(assert (=> start!71344 (=> (not res!564576) (not e!461729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71344 (= res!564576 (validMask!0 mask!1312))))

(assert (=> start!71344 e!461729))

(assert (=> start!71344 tp_is_empty!15153))

(declare-fun array_inv!17747 (array!46474) Bool)

(assert (=> start!71344 (array_inv!17747 _keys!976)))

(assert (=> start!71344 true))

(declare-fun array_inv!17748 (array!46472) Bool)

(assert (=> start!71344 (and (array_inv!17748 _values!788) e!461732)))

(assert (=> start!71344 tp!47101))

(declare-fun b!828577 () Bool)

(declare-fun e!461727 () Bool)

(declare-fun getCurrentListMap!2583 (array!46474 array!46472 (_ BitVec 32) (_ BitVec 32) V!25205 V!25205 (_ BitVec 32) Int) ListLongMap!8933)

(declare-fun +!1964 (ListLongMap!8933 tuple2!10110) ListLongMap!8933)

(assert (=> b!828577 (= e!461727 (= (getCurrentListMap!2583 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1964 lt!375472 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun b!828585 () Bool)

(assert (=> b!828585 (= e!461728 e!461727)))

(declare-fun res!564578 () Bool)

(assert (=> b!828585 (=> res!564578 e!461727)))

(assert (=> b!828585 (= res!564578 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828586 () Bool)

(assert (=> b!828586 (= e!461734 (= (getCurrentListMap!2583 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (+!1964 lt!375471 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (= (and start!71344 res!564576) b!828583))

(assert (= (and b!828583 res!564574) b!828584))

(assert (= (and b!828584 res!564573) b!828580))

(assert (= (and b!828580 res!564572) b!828581))

(assert (= (and b!828581 res!564575) b!828585))

(assert (= (and b!828585 (not res!564578)) b!828577))

(assert (= (and b!828581 (not res!564577)) b!828586))

(assert (= (and b!828579 condMapEmpty!24367) mapIsEmpty!24367))

(assert (= (and b!828579 (not condMapEmpty!24367)) mapNonEmpty!24367))

(get-info :version)

(assert (= (and mapNonEmpty!24367 ((_ is ValueCellFull!7161) mapValue!24367)) b!828578))

(assert (= (and b!828579 ((_ is ValueCellFull!7161) mapDefault!24367)) b!828582))

(assert (= start!71344 b!828579))

(declare-fun m!771509 () Bool)

(assert (=> b!828581 m!771509))

(declare-fun m!771511 () Bool)

(assert (=> b!828581 m!771511))

(declare-fun m!771513 () Bool)

(assert (=> b!828581 m!771513))

(declare-fun m!771515 () Bool)

(assert (=> b!828580 m!771515))

(declare-fun m!771517 () Bool)

(assert (=> start!71344 m!771517))

(declare-fun m!771519 () Bool)

(assert (=> start!71344 m!771519))

(declare-fun m!771521 () Bool)

(assert (=> start!71344 m!771521))

(declare-fun m!771523 () Bool)

(assert (=> b!828584 m!771523))

(declare-fun m!771525 () Bool)

(assert (=> b!828577 m!771525))

(declare-fun m!771527 () Bool)

(assert (=> b!828577 m!771527))

(declare-fun m!771529 () Bool)

(assert (=> mapNonEmpty!24367 m!771529))

(declare-fun m!771531 () Bool)

(assert (=> b!828586 m!771531))

(declare-fun m!771533 () Bool)

(assert (=> b!828586 m!771533))

(check-sat tp_is_empty!15153 (not b!828577) (not b!828581) (not b!828580) (not b!828586) (not start!71344) (not b!828584) b_and!22413 (not mapNonEmpty!24367) (not b_next!13443))
(check-sat b_and!22413 (not b_next!13443))
(get-model)

(declare-fun d!105195 () Bool)

(assert (=> d!105195 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71344 d!105195))

(declare-fun d!105197 () Bool)

(assert (=> d!105197 (= (array_inv!17747 _keys!976) (bvsge (size!22699 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71344 d!105197))

(declare-fun d!105199 () Bool)

(assert (=> d!105199 (= (array_inv!17748 _values!788) (bvsge (size!22698 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71344 d!105199))

(declare-fun bm!36044 () Bool)

(declare-fun call!36048 () ListLongMap!8933)

(declare-fun call!36047 () ListLongMap!8933)

(assert (=> bm!36044 (= call!36048 call!36047)))

(declare-fun b!828659 () Bool)

(declare-fun e!461794 () Bool)

(declare-fun e!461790 () Bool)

(assert (=> b!828659 (= e!461794 e!461790)))

(declare-fun res!564620 () Bool)

(declare-fun call!36052 () Bool)

(assert (=> b!828659 (= res!564620 call!36052)))

(assert (=> b!828659 (=> (not res!564620) (not e!461790))))

(declare-fun b!828660 () Bool)

(declare-fun e!461796 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!828660 (= e!461796 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828661 () Bool)

(declare-fun e!461788 () Bool)

(declare-fun e!461785 () Bool)

(assert (=> b!828661 (= e!461788 e!461785)))

(declare-fun res!564618 () Bool)

(assert (=> b!828661 (=> (not res!564618) (not e!461785))))

(declare-fun lt!375531 () ListLongMap!8933)

(declare-fun contains!4193 (ListLongMap!8933 (_ BitVec 64)) Bool)

(assert (=> b!828661 (= res!564618 (contains!4193 lt!375531 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun b!828662 () Bool)

(declare-fun e!461797 () ListLongMap!8933)

(assert (=> b!828662 (= e!461797 call!36048)))

(declare-fun b!828663 () Bool)

(declare-fun apply!367 (ListLongMap!8933 (_ BitVec 64)) V!25205)

(assert (=> b!828663 (= e!461790 (= (apply!367 lt!375531 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!828664 () Bool)

(declare-fun e!461791 () Bool)

(declare-fun e!461786 () Bool)

(assert (=> b!828664 (= e!461791 e!461786)))

(declare-fun res!564623 () Bool)

(declare-fun call!36050 () Bool)

(assert (=> b!828664 (= res!564623 call!36050)))

(assert (=> b!828664 (=> (not res!564623) (not e!461786))))

(declare-fun b!828665 () Bool)

(declare-fun res!564626 () Bool)

(declare-fun e!461787 () Bool)

(assert (=> b!828665 (=> (not res!564626) (not e!461787))))

(assert (=> b!828665 (= res!564626 e!461788)))

(declare-fun res!564619 () Bool)

(assert (=> b!828665 (=> res!564619 e!461788)))

(assert (=> b!828665 (= res!564619 (not e!461796))))

(declare-fun res!564621 () Bool)

(assert (=> b!828665 (=> (not res!564621) (not e!461796))))

(assert (=> b!828665 (= res!564621 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun bm!36046 () Bool)

(assert (=> bm!36046 (= call!36052 (contains!4193 lt!375531 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828666 () Bool)

(assert (=> b!828666 (= e!461794 (not call!36052))))

(declare-fun b!828667 () Bool)

(assert (=> b!828667 (= e!461787 e!461791)))

(declare-fun c!89649 () Bool)

(assert (=> b!828667 (= c!89649 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828668 () Bool)

(declare-fun e!461792 () Unit!28383)

(declare-fun Unit!28385 () Unit!28383)

(assert (=> b!828668 (= e!461792 Unit!28385)))

(declare-fun b!828669 () Bool)

(declare-fun e!461795 () Bool)

(assert (=> b!828669 (= e!461795 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun call!36051 () ListLongMap!8933)

(declare-fun c!89650 () Bool)

(declare-fun c!89653 () Bool)

(declare-fun bm!36047 () Bool)

(declare-fun call!36053 () ListLongMap!8933)

(declare-fun call!36049 () ListLongMap!8933)

(assert (=> bm!36047 (= call!36047 (+!1964 (ite c!89650 call!36049 (ite c!89653 call!36051 call!36053)) (ite (or c!89650 c!89653) (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36048 () Bool)

(assert (=> bm!36048 (= call!36053 call!36051)))

(declare-fun b!828670 () Bool)

(assert (=> b!828670 (= e!461786 (= (apply!367 lt!375531 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828671 () Bool)

(declare-fun e!461789 () ListLongMap!8933)

(assert (=> b!828671 (= e!461789 (+!1964 call!36047 (tuple2!10111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828672 () Bool)

(declare-fun res!564624 () Bool)

(assert (=> b!828672 (=> (not res!564624) (not e!461787))))

(assert (=> b!828672 (= res!564624 e!461794)))

(declare-fun c!89654 () Bool)

(assert (=> b!828672 (= c!89654 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828673 () Bool)

(declare-fun e!461793 () ListLongMap!8933)

(assert (=> b!828673 (= e!461793 call!36048)))

(declare-fun b!828674 () Bool)

(assert (=> b!828674 (= e!461797 call!36053)))

(declare-fun bm!36045 () Bool)

(assert (=> bm!36045 (= call!36051 call!36049)))

(declare-fun d!105201 () Bool)

(assert (=> d!105201 e!461787))

(declare-fun res!564622 () Bool)

(assert (=> d!105201 (=> (not res!564622) (not e!461787))))

(assert (=> d!105201 (= res!564622 (or (bvsge #b00000000000000000000000000000000 (size!22699 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))))

(declare-fun lt!375528 () ListLongMap!8933)

(assert (=> d!105201 (= lt!375531 lt!375528)))

(declare-fun lt!375545 () Unit!28383)

(assert (=> d!105201 (= lt!375545 e!461792)))

(declare-fun c!89652 () Bool)

(assert (=> d!105201 (= c!89652 e!461795)))

(declare-fun res!564625 () Bool)

(assert (=> d!105201 (=> (not res!564625) (not e!461795))))

(assert (=> d!105201 (= res!564625 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> d!105201 (= lt!375528 e!461789)))

(assert (=> d!105201 (= c!89650 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105201 (validMask!0 mask!1312)))

(assert (=> d!105201 (= (getCurrentListMap!2583 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375531)))

(declare-fun b!828675 () Bool)

(declare-fun c!89651 () Bool)

(assert (=> b!828675 (= c!89651 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828675 (= e!461793 e!461797)))

(declare-fun b!828676 () Bool)

(assert (=> b!828676 (= e!461789 e!461793)))

(assert (=> b!828676 (= c!89653 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828677 () Bool)

(declare-fun get!11794 (ValueCell!7161 V!25205) V!25205)

(declare-fun dynLambda!978 (Int (_ BitVec 64)) V!25205)

(assert (=> b!828677 (= e!461785 (= (apply!367 lt!375531 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22698 _values!788)))))

(assert (=> b!828677 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun b!828678 () Bool)

(assert (=> b!828678 (= e!461791 (not call!36050))))

(declare-fun bm!36049 () Bool)

(assert (=> bm!36049 (= call!36050 (contains!4193 lt!375531 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36050 () Bool)

(assert (=> bm!36050 (= call!36049 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828679 () Bool)

(declare-fun lt!375533 () Unit!28383)

(assert (=> b!828679 (= e!461792 lt!375533)))

(declare-fun lt!375539 () ListLongMap!8933)

(assert (=> b!828679 (= lt!375539 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375543 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375543 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375529 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375529 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375535 () Unit!28383)

(declare-fun addStillContains!318 (ListLongMap!8933 (_ BitVec 64) V!25205 (_ BitVec 64)) Unit!28383)

(assert (=> b!828679 (= lt!375535 (addStillContains!318 lt!375539 lt!375543 zeroValueBefore!34 lt!375529))))

(assert (=> b!828679 (contains!4193 (+!1964 lt!375539 (tuple2!10111 lt!375543 zeroValueBefore!34)) lt!375529)))

(declare-fun lt!375542 () Unit!28383)

(assert (=> b!828679 (= lt!375542 lt!375535)))

(declare-fun lt!375547 () ListLongMap!8933)

(assert (=> b!828679 (= lt!375547 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375537 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375537 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375544 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375544 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375538 () Unit!28383)

(declare-fun addApplyDifferent!318 (ListLongMap!8933 (_ BitVec 64) V!25205 (_ BitVec 64)) Unit!28383)

(assert (=> b!828679 (= lt!375538 (addApplyDifferent!318 lt!375547 lt!375537 minValue!754 lt!375544))))

(assert (=> b!828679 (= (apply!367 (+!1964 lt!375547 (tuple2!10111 lt!375537 minValue!754)) lt!375544) (apply!367 lt!375547 lt!375544))))

(declare-fun lt!375536 () Unit!28383)

(assert (=> b!828679 (= lt!375536 lt!375538)))

(declare-fun lt!375541 () ListLongMap!8933)

(assert (=> b!828679 (= lt!375541 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375532 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375532 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375546 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375546 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375534 () Unit!28383)

(assert (=> b!828679 (= lt!375534 (addApplyDifferent!318 lt!375541 lt!375532 zeroValueBefore!34 lt!375546))))

(assert (=> b!828679 (= (apply!367 (+!1964 lt!375541 (tuple2!10111 lt!375532 zeroValueBefore!34)) lt!375546) (apply!367 lt!375541 lt!375546))))

(declare-fun lt!375540 () Unit!28383)

(assert (=> b!828679 (= lt!375540 lt!375534)))

(declare-fun lt!375527 () ListLongMap!8933)

(assert (=> b!828679 (= lt!375527 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375530 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375530 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375526 () (_ BitVec 64))

(assert (=> b!828679 (= lt!375526 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828679 (= lt!375533 (addApplyDifferent!318 lt!375527 lt!375530 minValue!754 lt!375526))))

(assert (=> b!828679 (= (apply!367 (+!1964 lt!375527 (tuple2!10111 lt!375530 minValue!754)) lt!375526) (apply!367 lt!375527 lt!375526))))

(assert (= (and d!105201 c!89650) b!828671))

(assert (= (and d!105201 (not c!89650)) b!828676))

(assert (= (and b!828676 c!89653) b!828673))

(assert (= (and b!828676 (not c!89653)) b!828675))

(assert (= (and b!828675 c!89651) b!828662))

(assert (= (and b!828675 (not c!89651)) b!828674))

(assert (= (or b!828662 b!828674) bm!36048))

(assert (= (or b!828673 bm!36048) bm!36045))

(assert (= (or b!828673 b!828662) bm!36044))

(assert (= (or b!828671 bm!36045) bm!36050))

(assert (= (or b!828671 bm!36044) bm!36047))

(assert (= (and d!105201 res!564625) b!828669))

(assert (= (and d!105201 c!89652) b!828679))

(assert (= (and d!105201 (not c!89652)) b!828668))

(assert (= (and d!105201 res!564622) b!828665))

(assert (= (and b!828665 res!564621) b!828660))

(assert (= (and b!828665 (not res!564619)) b!828661))

(assert (= (and b!828661 res!564618) b!828677))

(assert (= (and b!828665 res!564626) b!828672))

(assert (= (and b!828672 c!89654) b!828659))

(assert (= (and b!828672 (not c!89654)) b!828666))

(assert (= (and b!828659 res!564620) b!828663))

(assert (= (or b!828659 b!828666) bm!36046))

(assert (= (and b!828672 res!564624) b!828667))

(assert (= (and b!828667 c!89649) b!828664))

(assert (= (and b!828667 (not c!89649)) b!828678))

(assert (= (and b!828664 res!564623) b!828670))

(assert (= (or b!828664 b!828678) bm!36049))

(declare-fun b_lambda!11227 () Bool)

(assert (=> (not b_lambda!11227) (not b!828677)))

(declare-fun t!22260 () Bool)

(declare-fun tb!4215 () Bool)

(assert (=> (and start!71344 (= defaultEntry!796 defaultEntry!796) t!22260) tb!4215))

(declare-fun result!7985 () Bool)

(assert (=> tb!4215 (= result!7985 tp_is_empty!15153)))

(assert (=> b!828677 t!22260))

(declare-fun b_and!22417 () Bool)

(assert (= b_and!22413 (and (=> t!22260 result!7985) b_and!22417)))

(declare-fun m!771561 () Bool)

(assert (=> bm!36046 m!771561))

(declare-fun m!771563 () Bool)

(assert (=> b!828670 m!771563))

(assert (=> d!105201 m!771517))

(declare-fun m!771565 () Bool)

(assert (=> b!828669 m!771565))

(assert (=> b!828669 m!771565))

(declare-fun m!771567 () Bool)

(assert (=> b!828669 m!771567))

(declare-fun m!771569 () Bool)

(assert (=> b!828671 m!771569))

(assert (=> bm!36050 m!771513))

(declare-fun m!771571 () Bool)

(assert (=> bm!36047 m!771571))

(declare-fun m!771573 () Bool)

(assert (=> b!828677 m!771573))

(declare-fun m!771575 () Bool)

(assert (=> b!828677 m!771575))

(declare-fun m!771577 () Bool)

(assert (=> b!828677 m!771577))

(assert (=> b!828677 m!771573))

(assert (=> b!828677 m!771575))

(assert (=> b!828677 m!771565))

(assert (=> b!828677 m!771565))

(declare-fun m!771579 () Bool)

(assert (=> b!828677 m!771579))

(declare-fun m!771581 () Bool)

(assert (=> bm!36049 m!771581))

(assert (=> b!828661 m!771565))

(assert (=> b!828661 m!771565))

(declare-fun m!771583 () Bool)

(assert (=> b!828661 m!771583))

(declare-fun m!771585 () Bool)

(assert (=> b!828679 m!771585))

(assert (=> b!828679 m!771513))

(declare-fun m!771587 () Bool)

(assert (=> b!828679 m!771587))

(declare-fun m!771589 () Bool)

(assert (=> b!828679 m!771589))

(declare-fun m!771591 () Bool)

(assert (=> b!828679 m!771591))

(declare-fun m!771593 () Bool)

(assert (=> b!828679 m!771593))

(declare-fun m!771595 () Bool)

(assert (=> b!828679 m!771595))

(declare-fun m!771597 () Bool)

(assert (=> b!828679 m!771597))

(assert (=> b!828679 m!771587))

(declare-fun m!771599 () Bool)

(assert (=> b!828679 m!771599))

(declare-fun m!771601 () Bool)

(assert (=> b!828679 m!771601))

(declare-fun m!771603 () Bool)

(assert (=> b!828679 m!771603))

(declare-fun m!771605 () Bool)

(assert (=> b!828679 m!771605))

(assert (=> b!828679 m!771593))

(declare-fun m!771607 () Bool)

(assert (=> b!828679 m!771607))

(assert (=> b!828679 m!771601))

(assert (=> b!828679 m!771565))

(declare-fun m!771609 () Bool)

(assert (=> b!828679 m!771609))

(declare-fun m!771611 () Bool)

(assert (=> b!828679 m!771611))

(assert (=> b!828679 m!771611))

(declare-fun m!771613 () Bool)

(assert (=> b!828679 m!771613))

(assert (=> b!828660 m!771565))

(assert (=> b!828660 m!771565))

(assert (=> b!828660 m!771567))

(declare-fun m!771615 () Bool)

(assert (=> b!828663 m!771615))

(assert (=> b!828577 d!105201))

(declare-fun d!105203 () Bool)

(declare-fun e!461800 () Bool)

(assert (=> d!105203 e!461800))

(declare-fun res!564632 () Bool)

(assert (=> d!105203 (=> (not res!564632) (not e!461800))))

(declare-fun lt!375559 () ListLongMap!8933)

(assert (=> d!105203 (= res!564632 (contains!4193 lt!375559 (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lt!375556 () List!15903)

(assert (=> d!105203 (= lt!375559 (ListLongMap!8934 lt!375556))))

(declare-fun lt!375558 () Unit!28383)

(declare-fun lt!375557 () Unit!28383)

(assert (=> d!105203 (= lt!375558 lt!375557)))

(declare-datatypes ((Option!416 0))(
  ( (Some!415 (v!10063 V!25205)) (None!414) )
))
(declare-fun getValueByKey!410 (List!15903 (_ BitVec 64)) Option!416)

(assert (=> d!105203 (= (getValueByKey!410 lt!375556 (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!415 (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!224 (List!15903 (_ BitVec 64) V!25205) Unit!28383)

(assert (=> d!105203 (= lt!375557 (lemmaContainsTupThenGetReturnValue!224 lt!375556 (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(declare-fun insertStrictlySorted!263 (List!15903 (_ BitVec 64) V!25205) List!15903)

(assert (=> d!105203 (= lt!375556 (insertStrictlySorted!263 (toList!4482 lt!375472) (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))))

(assert (=> d!105203 (= (+!1964 lt!375472 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) lt!375559)))

(declare-fun b!828686 () Bool)

(declare-fun res!564631 () Bool)

(assert (=> b!828686 (=> (not res!564631) (not e!461800))))

(assert (=> b!828686 (= res!564631 (= (getValueByKey!410 (toList!4482 lt!375559) (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))) (Some!415 (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))))

(declare-fun b!828687 () Bool)

(declare-fun contains!4194 (List!15903 tuple2!10110) Bool)

(assert (=> b!828687 (= e!461800 (contains!4194 (toList!4482 lt!375559) (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)))))

(assert (= (and d!105203 res!564632) b!828686))

(assert (= (and b!828686 res!564631) b!828687))

(declare-fun m!771617 () Bool)

(assert (=> d!105203 m!771617))

(declare-fun m!771619 () Bool)

(assert (=> d!105203 m!771619))

(declare-fun m!771621 () Bool)

(assert (=> d!105203 m!771621))

(declare-fun m!771623 () Bool)

(assert (=> d!105203 m!771623))

(declare-fun m!771625 () Bool)

(assert (=> b!828686 m!771625))

(declare-fun m!771627 () Bool)

(assert (=> b!828687 m!771627))

(assert (=> b!828577 d!105203))

(declare-fun bm!36051 () Bool)

(declare-fun call!36055 () ListLongMap!8933)

(declare-fun call!36054 () ListLongMap!8933)

(assert (=> bm!36051 (= call!36055 call!36054)))

(declare-fun b!828688 () Bool)

(declare-fun e!461810 () Bool)

(declare-fun e!461806 () Bool)

(assert (=> b!828688 (= e!461810 e!461806)))

(declare-fun res!564635 () Bool)

(declare-fun call!36059 () Bool)

(assert (=> b!828688 (= res!564635 call!36059)))

(assert (=> b!828688 (=> (not res!564635) (not e!461806))))

(declare-fun b!828689 () Bool)

(declare-fun e!461812 () Bool)

(assert (=> b!828689 (= e!461812 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828690 () Bool)

(declare-fun e!461804 () Bool)

(declare-fun e!461801 () Bool)

(assert (=> b!828690 (= e!461804 e!461801)))

(declare-fun res!564633 () Bool)

(assert (=> b!828690 (=> (not res!564633) (not e!461801))))

(declare-fun lt!375565 () ListLongMap!8933)

(assert (=> b!828690 (= res!564633 (contains!4193 lt!375565 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun b!828691 () Bool)

(declare-fun e!461813 () ListLongMap!8933)

(assert (=> b!828691 (= e!461813 call!36055)))

(declare-fun b!828692 () Bool)

(assert (=> b!828692 (= e!461806 (= (apply!367 lt!375565 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!828693 () Bool)

(declare-fun e!461807 () Bool)

(declare-fun e!461802 () Bool)

(assert (=> b!828693 (= e!461807 e!461802)))

(declare-fun res!564638 () Bool)

(declare-fun call!36057 () Bool)

(assert (=> b!828693 (= res!564638 call!36057)))

(assert (=> b!828693 (=> (not res!564638) (not e!461802))))

(declare-fun b!828694 () Bool)

(declare-fun res!564641 () Bool)

(declare-fun e!461803 () Bool)

(assert (=> b!828694 (=> (not res!564641) (not e!461803))))

(assert (=> b!828694 (= res!564641 e!461804)))

(declare-fun res!564634 () Bool)

(assert (=> b!828694 (=> res!564634 e!461804)))

(assert (=> b!828694 (= res!564634 (not e!461812))))

(declare-fun res!564636 () Bool)

(assert (=> b!828694 (=> (not res!564636) (not e!461812))))

(assert (=> b!828694 (= res!564636 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun bm!36053 () Bool)

(assert (=> bm!36053 (= call!36059 (contains!4193 lt!375565 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!828695 () Bool)

(assert (=> b!828695 (= e!461810 (not call!36059))))

(declare-fun b!828696 () Bool)

(assert (=> b!828696 (= e!461803 e!461807)))

(declare-fun c!89655 () Bool)

(assert (=> b!828696 (= c!89655 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828697 () Bool)

(declare-fun e!461808 () Unit!28383)

(declare-fun Unit!28386 () Unit!28383)

(assert (=> b!828697 (= e!461808 Unit!28386)))

(declare-fun b!828698 () Bool)

(declare-fun e!461811 () Bool)

(assert (=> b!828698 (= e!461811 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun c!89656 () Bool)

(declare-fun call!36060 () ListLongMap!8933)

(declare-fun bm!36054 () Bool)

(declare-fun call!36058 () ListLongMap!8933)

(declare-fun c!89659 () Bool)

(declare-fun call!36056 () ListLongMap!8933)

(assert (=> bm!36054 (= call!36054 (+!1964 (ite c!89656 call!36056 (ite c!89659 call!36058 call!36060)) (ite (or c!89656 c!89659) (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun bm!36055 () Bool)

(assert (=> bm!36055 (= call!36060 call!36058)))

(declare-fun b!828699 () Bool)

(assert (=> b!828699 (= e!461802 (= (apply!367 lt!375565 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!828700 () Bool)

(declare-fun e!461805 () ListLongMap!8933)

(assert (=> b!828700 (= e!461805 (+!1964 call!36054 (tuple2!10111 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!828701 () Bool)

(declare-fun res!564639 () Bool)

(assert (=> b!828701 (=> (not res!564639) (not e!461803))))

(assert (=> b!828701 (= res!564639 e!461810)))

(declare-fun c!89660 () Bool)

(assert (=> b!828701 (= c!89660 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!828702 () Bool)

(declare-fun e!461809 () ListLongMap!8933)

(assert (=> b!828702 (= e!461809 call!36055)))

(declare-fun b!828703 () Bool)

(assert (=> b!828703 (= e!461813 call!36060)))

(declare-fun bm!36052 () Bool)

(assert (=> bm!36052 (= call!36058 call!36056)))

(declare-fun d!105205 () Bool)

(assert (=> d!105205 e!461803))

(declare-fun res!564637 () Bool)

(assert (=> d!105205 (=> (not res!564637) (not e!461803))))

(assert (=> d!105205 (= res!564637 (or (bvsge #b00000000000000000000000000000000 (size!22699 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))))

(declare-fun lt!375562 () ListLongMap!8933)

(assert (=> d!105205 (= lt!375565 lt!375562)))

(declare-fun lt!375579 () Unit!28383)

(assert (=> d!105205 (= lt!375579 e!461808)))

(declare-fun c!89658 () Bool)

(assert (=> d!105205 (= c!89658 e!461811)))

(declare-fun res!564640 () Bool)

(assert (=> d!105205 (=> (not res!564640) (not e!461811))))

(assert (=> d!105205 (= res!564640 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> d!105205 (= lt!375562 e!461805)))

(assert (=> d!105205 (= c!89656 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105205 (validMask!0 mask!1312)))

(assert (=> d!105205 (= (getCurrentListMap!2583 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375565)))

(declare-fun b!828704 () Bool)

(declare-fun c!89657 () Bool)

(assert (=> b!828704 (= c!89657 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828704 (= e!461809 e!461813)))

(declare-fun b!828705 () Bool)

(assert (=> b!828705 (= e!461805 e!461809)))

(assert (=> b!828705 (= c!89659 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!828706 () Bool)

(assert (=> b!828706 (= e!461801 (= (apply!367 lt!375565 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!828706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22698 _values!788)))))

(assert (=> b!828706 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun b!828707 () Bool)

(assert (=> b!828707 (= e!461807 (not call!36057))))

(declare-fun bm!36056 () Bool)

(assert (=> bm!36056 (= call!36057 (contains!4193 lt!375565 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!36057 () Bool)

(assert (=> bm!36057 (= call!36056 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!828708 () Bool)

(declare-fun lt!375567 () Unit!28383)

(assert (=> b!828708 (= e!461808 lt!375567)))

(declare-fun lt!375573 () ListLongMap!8933)

(assert (=> b!828708 (= lt!375573 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375577 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375577 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375563 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375563 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375569 () Unit!28383)

(assert (=> b!828708 (= lt!375569 (addStillContains!318 lt!375573 lt!375577 zeroValueAfter!34 lt!375563))))

(assert (=> b!828708 (contains!4193 (+!1964 lt!375573 (tuple2!10111 lt!375577 zeroValueAfter!34)) lt!375563)))

(declare-fun lt!375576 () Unit!28383)

(assert (=> b!828708 (= lt!375576 lt!375569)))

(declare-fun lt!375581 () ListLongMap!8933)

(assert (=> b!828708 (= lt!375581 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375571 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375571 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375578 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375578 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375572 () Unit!28383)

(assert (=> b!828708 (= lt!375572 (addApplyDifferent!318 lt!375581 lt!375571 minValue!754 lt!375578))))

(assert (=> b!828708 (= (apply!367 (+!1964 lt!375581 (tuple2!10111 lt!375571 minValue!754)) lt!375578) (apply!367 lt!375581 lt!375578))))

(declare-fun lt!375570 () Unit!28383)

(assert (=> b!828708 (= lt!375570 lt!375572)))

(declare-fun lt!375575 () ListLongMap!8933)

(assert (=> b!828708 (= lt!375575 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375566 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375580 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375580 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375568 () Unit!28383)

(assert (=> b!828708 (= lt!375568 (addApplyDifferent!318 lt!375575 lt!375566 zeroValueAfter!34 lt!375580))))

(assert (=> b!828708 (= (apply!367 (+!1964 lt!375575 (tuple2!10111 lt!375566 zeroValueAfter!34)) lt!375580) (apply!367 lt!375575 lt!375580))))

(declare-fun lt!375574 () Unit!28383)

(assert (=> b!828708 (= lt!375574 lt!375568)))

(declare-fun lt!375561 () ListLongMap!8933)

(assert (=> b!828708 (= lt!375561 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375564 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375564 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!375560 () (_ BitVec 64))

(assert (=> b!828708 (= lt!375560 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828708 (= lt!375567 (addApplyDifferent!318 lt!375561 lt!375564 minValue!754 lt!375560))))

(assert (=> b!828708 (= (apply!367 (+!1964 lt!375561 (tuple2!10111 lt!375564 minValue!754)) lt!375560) (apply!367 lt!375561 lt!375560))))

(assert (= (and d!105205 c!89656) b!828700))

(assert (= (and d!105205 (not c!89656)) b!828705))

(assert (= (and b!828705 c!89659) b!828702))

(assert (= (and b!828705 (not c!89659)) b!828704))

(assert (= (and b!828704 c!89657) b!828691))

(assert (= (and b!828704 (not c!89657)) b!828703))

(assert (= (or b!828691 b!828703) bm!36055))

(assert (= (or b!828702 bm!36055) bm!36052))

(assert (= (or b!828702 b!828691) bm!36051))

(assert (= (or b!828700 bm!36052) bm!36057))

(assert (= (or b!828700 bm!36051) bm!36054))

(assert (= (and d!105205 res!564640) b!828698))

(assert (= (and d!105205 c!89658) b!828708))

(assert (= (and d!105205 (not c!89658)) b!828697))

(assert (= (and d!105205 res!564637) b!828694))

(assert (= (and b!828694 res!564636) b!828689))

(assert (= (and b!828694 (not res!564634)) b!828690))

(assert (= (and b!828690 res!564633) b!828706))

(assert (= (and b!828694 res!564641) b!828701))

(assert (= (and b!828701 c!89660) b!828688))

(assert (= (and b!828701 (not c!89660)) b!828695))

(assert (= (and b!828688 res!564635) b!828692))

(assert (= (or b!828688 b!828695) bm!36053))

(assert (= (and b!828701 res!564639) b!828696))

(assert (= (and b!828696 c!89655) b!828693))

(assert (= (and b!828696 (not c!89655)) b!828707))

(assert (= (and b!828693 res!564638) b!828699))

(assert (= (or b!828693 b!828707) bm!36056))

(declare-fun b_lambda!11229 () Bool)

(assert (=> (not b_lambda!11229) (not b!828706)))

(assert (=> b!828706 t!22260))

(declare-fun b_and!22419 () Bool)

(assert (= b_and!22417 (and (=> t!22260 result!7985) b_and!22419)))

(declare-fun m!771629 () Bool)

(assert (=> bm!36053 m!771629))

(declare-fun m!771631 () Bool)

(assert (=> b!828699 m!771631))

(assert (=> d!105205 m!771517))

(assert (=> b!828698 m!771565))

(assert (=> b!828698 m!771565))

(assert (=> b!828698 m!771567))

(declare-fun m!771633 () Bool)

(assert (=> b!828700 m!771633))

(assert (=> bm!36057 m!771511))

(declare-fun m!771635 () Bool)

(assert (=> bm!36054 m!771635))

(assert (=> b!828706 m!771573))

(assert (=> b!828706 m!771575))

(assert (=> b!828706 m!771577))

(assert (=> b!828706 m!771573))

(assert (=> b!828706 m!771575))

(assert (=> b!828706 m!771565))

(assert (=> b!828706 m!771565))

(declare-fun m!771637 () Bool)

(assert (=> b!828706 m!771637))

(declare-fun m!771639 () Bool)

(assert (=> bm!36056 m!771639))

(assert (=> b!828690 m!771565))

(assert (=> b!828690 m!771565))

(declare-fun m!771641 () Bool)

(assert (=> b!828690 m!771641))

(declare-fun m!771643 () Bool)

(assert (=> b!828708 m!771643))

(assert (=> b!828708 m!771511))

(declare-fun m!771645 () Bool)

(assert (=> b!828708 m!771645))

(declare-fun m!771647 () Bool)

(assert (=> b!828708 m!771647))

(declare-fun m!771649 () Bool)

(assert (=> b!828708 m!771649))

(declare-fun m!771651 () Bool)

(assert (=> b!828708 m!771651))

(declare-fun m!771653 () Bool)

(assert (=> b!828708 m!771653))

(declare-fun m!771655 () Bool)

(assert (=> b!828708 m!771655))

(assert (=> b!828708 m!771645))

(declare-fun m!771657 () Bool)

(assert (=> b!828708 m!771657))

(declare-fun m!771659 () Bool)

(assert (=> b!828708 m!771659))

(declare-fun m!771661 () Bool)

(assert (=> b!828708 m!771661))

(declare-fun m!771663 () Bool)

(assert (=> b!828708 m!771663))

(assert (=> b!828708 m!771651))

(declare-fun m!771665 () Bool)

(assert (=> b!828708 m!771665))

(assert (=> b!828708 m!771659))

(assert (=> b!828708 m!771565))

(declare-fun m!771667 () Bool)

(assert (=> b!828708 m!771667))

(declare-fun m!771669 () Bool)

(assert (=> b!828708 m!771669))

(assert (=> b!828708 m!771669))

(declare-fun m!771671 () Bool)

(assert (=> b!828708 m!771671))

(assert (=> b!828689 m!771565))

(assert (=> b!828689 m!771565))

(assert (=> b!828689 m!771567))

(declare-fun m!771673 () Bool)

(assert (=> b!828692 m!771673))

(assert (=> b!828586 d!105205))

(declare-fun d!105207 () Bool)

(declare-fun e!461814 () Bool)

(assert (=> d!105207 e!461814))

(declare-fun res!564643 () Bool)

(assert (=> d!105207 (=> (not res!564643) (not e!461814))))

(declare-fun lt!375585 () ListLongMap!8933)

(assert (=> d!105207 (= res!564643 (contains!4193 lt!375585 (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!375582 () List!15903)

(assert (=> d!105207 (= lt!375585 (ListLongMap!8934 lt!375582))))

(declare-fun lt!375584 () Unit!28383)

(declare-fun lt!375583 () Unit!28383)

(assert (=> d!105207 (= lt!375584 lt!375583)))

(assert (=> d!105207 (= (getValueByKey!410 lt!375582 (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!415 (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105207 (= lt!375583 (lemmaContainsTupThenGetReturnValue!224 lt!375582 (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105207 (= lt!375582 (insertStrictlySorted!263 (toList!4482 lt!375471) (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105207 (= (+!1964 lt!375471 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!375585)))

(declare-fun b!828709 () Bool)

(declare-fun res!564642 () Bool)

(assert (=> b!828709 (=> (not res!564642) (not e!461814))))

(assert (=> b!828709 (= res!564642 (= (getValueByKey!410 (toList!4482 lt!375585) (_1!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!415 (_2!5066 (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!828710 () Bool)

(assert (=> b!828710 (= e!461814 (contains!4194 (toList!4482 lt!375585) (tuple2!10111 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105207 res!564643) b!828709))

(assert (= (and b!828709 res!564642) b!828710))

(declare-fun m!771675 () Bool)

(assert (=> d!105207 m!771675))

(declare-fun m!771677 () Bool)

(assert (=> d!105207 m!771677))

(declare-fun m!771679 () Bool)

(assert (=> d!105207 m!771679))

(declare-fun m!771681 () Bool)

(assert (=> d!105207 m!771681))

(declare-fun m!771683 () Bool)

(assert (=> b!828709 m!771683))

(declare-fun m!771685 () Bool)

(assert (=> b!828710 m!771685))

(assert (=> b!828586 d!105207))

(declare-fun d!105209 () Bool)

(assert (=> d!105209 (= (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!375588 () Unit!28383)

(declare-fun choose!1411 (array!46474 array!46472 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25205 V!25205 V!25205 V!25205 (_ BitVec 32) Int) Unit!28383)

(assert (=> d!105209 (= lt!375588 (choose!1411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105209 (validMask!0 mask!1312)))

(assert (=> d!105209 (= (lemmaNoChangeToArrayThenSameMapNoExtras!571 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375588)))

(declare-fun bs!23152 () Bool)

(assert (= bs!23152 d!105209))

(assert (=> bs!23152 m!771513))

(assert (=> bs!23152 m!771511))

(declare-fun m!771687 () Bool)

(assert (=> bs!23152 m!771687))

(assert (=> bs!23152 m!771517))

(assert (=> b!828581 d!105209))

(declare-fun b!828735 () Bool)

(declare-fun e!461832 () ListLongMap!8933)

(declare-fun e!461831 () ListLongMap!8933)

(assert (=> b!828735 (= e!461832 e!461831)))

(declare-fun c!89671 () Bool)

(assert (=> b!828735 (= c!89671 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!461830 () Bool)

(declare-fun b!828736 () Bool)

(declare-fun lt!375605 () ListLongMap!8933)

(assert (=> b!828736 (= e!461830 (= lt!375605 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828738 () Bool)

(declare-fun isEmpty!649 (ListLongMap!8933) Bool)

(assert (=> b!828738 (= e!461830 (isEmpty!649 lt!375605))))

(declare-fun b!828739 () Bool)

(assert (=> b!828739 (= e!461832 (ListLongMap!8934 Nil!15900))))

(declare-fun b!828740 () Bool)

(declare-fun e!461834 () Bool)

(assert (=> b!828740 (= e!461834 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828740 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828741 () Bool)

(declare-fun call!36063 () ListLongMap!8933)

(assert (=> b!828741 (= e!461831 call!36063)))

(declare-fun b!828742 () Bool)

(declare-fun e!461835 () Bool)

(declare-fun e!461829 () Bool)

(assert (=> b!828742 (= e!461835 e!461829)))

(assert (=> b!828742 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun res!564652 () Bool)

(assert (=> b!828742 (= res!564652 (contains!4193 lt!375605 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828742 (=> (not res!564652) (not e!461829))))

(declare-fun b!828743 () Bool)

(declare-fun e!461833 () Bool)

(assert (=> b!828743 (= e!461833 e!461835)))

(declare-fun c!89670 () Bool)

(assert (=> b!828743 (= c!89670 e!461834)))

(declare-fun res!564654 () Bool)

(assert (=> b!828743 (=> (not res!564654) (not e!461834))))

(assert (=> b!828743 (= res!564654 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun b!828737 () Bool)

(assert (=> b!828737 (= e!461835 e!461830)))

(declare-fun c!89672 () Bool)

(assert (=> b!828737 (= c!89672 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun d!105211 () Bool)

(assert (=> d!105211 e!461833))

(declare-fun res!564655 () Bool)

(assert (=> d!105211 (=> (not res!564655) (not e!461833))))

(assert (=> d!105211 (= res!564655 (not (contains!4193 lt!375605 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105211 (= lt!375605 e!461832)))

(declare-fun c!89669 () Bool)

(assert (=> d!105211 (= c!89669 (bvsge #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> d!105211 (validMask!0 mask!1312)))

(assert (=> d!105211 (= (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375605)))

(declare-fun b!828744 () Bool)

(declare-fun lt!375609 () Unit!28383)

(declare-fun lt!375608 () Unit!28383)

(assert (=> b!828744 (= lt!375609 lt!375608)))

(declare-fun lt!375607 () ListLongMap!8933)

(declare-fun lt!375606 () (_ BitVec 64))

(declare-fun lt!375603 () (_ BitVec 64))

(declare-fun lt!375604 () V!25205)

(assert (=> b!828744 (not (contains!4193 (+!1964 lt!375607 (tuple2!10111 lt!375603 lt!375604)) lt!375606))))

(declare-fun addStillNotContains!192 (ListLongMap!8933 (_ BitVec 64) V!25205 (_ BitVec 64)) Unit!28383)

(assert (=> b!828744 (= lt!375608 (addStillNotContains!192 lt!375607 lt!375603 lt!375604 lt!375606))))

(assert (=> b!828744 (= lt!375606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828744 (= lt!375604 (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828744 (= lt!375603 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828744 (= lt!375607 call!36063)))

(assert (=> b!828744 (= e!461831 (+!1964 call!36063 (tuple2!10111 (select (arr!22278 _keys!976) #b00000000000000000000000000000000) (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828745 () Bool)

(declare-fun res!564653 () Bool)

(assert (=> b!828745 (=> (not res!564653) (not e!461833))))

(assert (=> b!828745 (= res!564653 (not (contains!4193 lt!375605 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828746 () Bool)

(assert (=> b!828746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> b!828746 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22698 _values!788)))))

(assert (=> b!828746 (= e!461829 (= (apply!367 lt!375605 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!36060 () Bool)

(assert (=> bm!36060 (= call!36063 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105211 c!89669) b!828739))

(assert (= (and d!105211 (not c!89669)) b!828735))

(assert (= (and b!828735 c!89671) b!828744))

(assert (= (and b!828735 (not c!89671)) b!828741))

(assert (= (or b!828744 b!828741) bm!36060))

(assert (= (and d!105211 res!564655) b!828745))

(assert (= (and b!828745 res!564653) b!828743))

(assert (= (and b!828743 res!564654) b!828740))

(assert (= (and b!828743 c!89670) b!828742))

(assert (= (and b!828743 (not c!89670)) b!828737))

(assert (= (and b!828742 res!564652) b!828746))

(assert (= (and b!828737 c!89672) b!828736))

(assert (= (and b!828737 (not c!89672)) b!828738))

(declare-fun b_lambda!11231 () Bool)

(assert (=> (not b_lambda!11231) (not b!828744)))

(assert (=> b!828744 t!22260))

(declare-fun b_and!22421 () Bool)

(assert (= b_and!22419 (and (=> t!22260 result!7985) b_and!22421)))

(declare-fun b_lambda!11233 () Bool)

(assert (=> (not b_lambda!11233) (not b!828746)))

(assert (=> b!828746 t!22260))

(declare-fun b_and!22423 () Bool)

(assert (= b_and!22421 (and (=> t!22260 result!7985) b_and!22423)))

(assert (=> b!828740 m!771565))

(assert (=> b!828740 m!771565))

(assert (=> b!828740 m!771567))

(declare-fun m!771689 () Bool)

(assert (=> b!828738 m!771689))

(declare-fun m!771691 () Bool)

(assert (=> b!828744 m!771691))

(declare-fun m!771693 () Bool)

(assert (=> b!828744 m!771693))

(declare-fun m!771695 () Bool)

(assert (=> b!828744 m!771695))

(declare-fun m!771697 () Bool)

(assert (=> b!828744 m!771697))

(assert (=> b!828744 m!771575))

(assert (=> b!828744 m!771695))

(assert (=> b!828744 m!771573))

(assert (=> b!828744 m!771575))

(assert (=> b!828744 m!771577))

(assert (=> b!828744 m!771565))

(assert (=> b!828744 m!771573))

(declare-fun m!771699 () Bool)

(assert (=> bm!36060 m!771699))

(assert (=> b!828735 m!771565))

(assert (=> b!828735 m!771565))

(assert (=> b!828735 m!771567))

(assert (=> b!828736 m!771699))

(assert (=> b!828742 m!771565))

(assert (=> b!828742 m!771565))

(declare-fun m!771701 () Bool)

(assert (=> b!828742 m!771701))

(assert (=> b!828746 m!771575))

(assert (=> b!828746 m!771565))

(declare-fun m!771703 () Bool)

(assert (=> b!828746 m!771703))

(assert (=> b!828746 m!771573))

(assert (=> b!828746 m!771575))

(assert (=> b!828746 m!771577))

(assert (=> b!828746 m!771565))

(assert (=> b!828746 m!771573))

(declare-fun m!771705 () Bool)

(assert (=> d!105211 m!771705))

(assert (=> d!105211 m!771517))

(declare-fun m!771707 () Bool)

(assert (=> b!828745 m!771707))

(assert (=> b!828581 d!105211))

(declare-fun b!828747 () Bool)

(declare-fun e!461839 () ListLongMap!8933)

(declare-fun e!461838 () ListLongMap!8933)

(assert (=> b!828747 (= e!461839 e!461838)))

(declare-fun c!89675 () Bool)

(assert (=> b!828747 (= c!89675 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828748 () Bool)

(declare-fun e!461837 () Bool)

(declare-fun lt!375612 () ListLongMap!8933)

(assert (=> b!828748 (= e!461837 (= lt!375612 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!828750 () Bool)

(assert (=> b!828750 (= e!461837 (isEmpty!649 lt!375612))))

(declare-fun b!828751 () Bool)

(assert (=> b!828751 (= e!461839 (ListLongMap!8934 Nil!15900))))

(declare-fun b!828752 () Bool)

(declare-fun e!461841 () Bool)

(assert (=> b!828752 (= e!461841 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828752 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!828753 () Bool)

(declare-fun call!36064 () ListLongMap!8933)

(assert (=> b!828753 (= e!461838 call!36064)))

(declare-fun b!828754 () Bool)

(declare-fun e!461842 () Bool)

(declare-fun e!461836 () Bool)

(assert (=> b!828754 (= e!461842 e!461836)))

(assert (=> b!828754 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun res!564656 () Bool)

(assert (=> b!828754 (= res!564656 (contains!4193 lt!375612 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!828754 (=> (not res!564656) (not e!461836))))

(declare-fun b!828755 () Bool)

(declare-fun e!461840 () Bool)

(assert (=> b!828755 (= e!461840 e!461842)))

(declare-fun c!89674 () Bool)

(assert (=> b!828755 (= c!89674 e!461841)))

(declare-fun res!564658 () Bool)

(assert (=> b!828755 (=> (not res!564658) (not e!461841))))

(assert (=> b!828755 (= res!564658 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun b!828749 () Bool)

(assert (=> b!828749 (= e!461842 e!461837)))

(declare-fun c!89676 () Bool)

(assert (=> b!828749 (= c!89676 (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(declare-fun d!105213 () Bool)

(assert (=> d!105213 e!461840))

(declare-fun res!564659 () Bool)

(assert (=> d!105213 (=> (not res!564659) (not e!461840))))

(assert (=> d!105213 (= res!564659 (not (contains!4193 lt!375612 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105213 (= lt!375612 e!461839)))

(declare-fun c!89673 () Bool)

(assert (=> d!105213 (= c!89673 (bvsge #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> d!105213 (validMask!0 mask!1312)))

(assert (=> d!105213 (= (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!375612)))

(declare-fun b!828756 () Bool)

(declare-fun lt!375616 () Unit!28383)

(declare-fun lt!375615 () Unit!28383)

(assert (=> b!828756 (= lt!375616 lt!375615)))

(declare-fun lt!375614 () ListLongMap!8933)

(declare-fun lt!375613 () (_ BitVec 64))

(declare-fun lt!375611 () V!25205)

(declare-fun lt!375610 () (_ BitVec 64))

(assert (=> b!828756 (not (contains!4193 (+!1964 lt!375614 (tuple2!10111 lt!375610 lt!375611)) lt!375613))))

(assert (=> b!828756 (= lt!375615 (addStillNotContains!192 lt!375614 lt!375610 lt!375611 lt!375613))))

(assert (=> b!828756 (= lt!375613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!828756 (= lt!375611 (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!828756 (= lt!375610 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!828756 (= lt!375614 call!36064)))

(assert (=> b!828756 (= e!461838 (+!1964 call!36064 (tuple2!10111 (select (arr!22278 _keys!976) #b00000000000000000000000000000000) (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!828757 () Bool)

(declare-fun res!564657 () Bool)

(assert (=> b!828757 (=> (not res!564657) (not e!461840))))

(assert (=> b!828757 (= res!564657 (not (contains!4193 lt!375612 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!828758 () Bool)

(assert (=> b!828758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> b!828758 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22698 _values!788)))))

(assert (=> b!828758 (= e!461836 (= (apply!367 lt!375612 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)) (get!11794 (select (arr!22277 _values!788) #b00000000000000000000000000000000) (dynLambda!978 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!36061 () Bool)

(assert (=> bm!36061 (= call!36064 (getCurrentListMapNoExtraKeys!2483 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(assert (= (and d!105213 c!89673) b!828751))

(assert (= (and d!105213 (not c!89673)) b!828747))

(assert (= (and b!828747 c!89675) b!828756))

(assert (= (and b!828747 (not c!89675)) b!828753))

(assert (= (or b!828756 b!828753) bm!36061))

(assert (= (and d!105213 res!564659) b!828757))

(assert (= (and b!828757 res!564657) b!828755))

(assert (= (and b!828755 res!564658) b!828752))

(assert (= (and b!828755 c!89674) b!828754))

(assert (= (and b!828755 (not c!89674)) b!828749))

(assert (= (and b!828754 res!564656) b!828758))

(assert (= (and b!828749 c!89676) b!828748))

(assert (= (and b!828749 (not c!89676)) b!828750))

(declare-fun b_lambda!11235 () Bool)

(assert (=> (not b_lambda!11235) (not b!828756)))

(assert (=> b!828756 t!22260))

(declare-fun b_and!22425 () Bool)

(assert (= b_and!22423 (and (=> t!22260 result!7985) b_and!22425)))

(declare-fun b_lambda!11237 () Bool)

(assert (=> (not b_lambda!11237) (not b!828758)))

(assert (=> b!828758 t!22260))

(declare-fun b_and!22427 () Bool)

(assert (= b_and!22425 (and (=> t!22260 result!7985) b_and!22427)))

(assert (=> b!828752 m!771565))

(assert (=> b!828752 m!771565))

(assert (=> b!828752 m!771567))

(declare-fun m!771709 () Bool)

(assert (=> b!828750 m!771709))

(declare-fun m!771711 () Bool)

(assert (=> b!828756 m!771711))

(declare-fun m!771713 () Bool)

(assert (=> b!828756 m!771713))

(declare-fun m!771715 () Bool)

(assert (=> b!828756 m!771715))

(declare-fun m!771717 () Bool)

(assert (=> b!828756 m!771717))

(assert (=> b!828756 m!771575))

(assert (=> b!828756 m!771715))

(assert (=> b!828756 m!771573))

(assert (=> b!828756 m!771575))

(assert (=> b!828756 m!771577))

(assert (=> b!828756 m!771565))

(assert (=> b!828756 m!771573))

(declare-fun m!771719 () Bool)

(assert (=> bm!36061 m!771719))

(assert (=> b!828747 m!771565))

(assert (=> b!828747 m!771565))

(assert (=> b!828747 m!771567))

(assert (=> b!828748 m!771719))

(assert (=> b!828754 m!771565))

(assert (=> b!828754 m!771565))

(declare-fun m!771721 () Bool)

(assert (=> b!828754 m!771721))

(assert (=> b!828758 m!771575))

(assert (=> b!828758 m!771565))

(declare-fun m!771723 () Bool)

(assert (=> b!828758 m!771723))

(assert (=> b!828758 m!771573))

(assert (=> b!828758 m!771575))

(assert (=> b!828758 m!771577))

(assert (=> b!828758 m!771565))

(assert (=> b!828758 m!771573))

(declare-fun m!771725 () Bool)

(assert (=> d!105213 m!771725))

(assert (=> d!105213 m!771517))

(declare-fun m!771727 () Bool)

(assert (=> b!828757 m!771727))

(assert (=> b!828581 d!105213))

(declare-fun b!828769 () Bool)

(declare-fun e!461851 () Bool)

(declare-fun e!461853 () Bool)

(assert (=> b!828769 (= e!461851 e!461853)))

(declare-fun res!564666 () Bool)

(assert (=> b!828769 (=> (not res!564666) (not e!461853))))

(declare-fun e!461854 () Bool)

(assert (=> b!828769 (= res!564666 (not e!461854))))

(declare-fun res!564668 () Bool)

(assert (=> b!828769 (=> (not res!564668) (not e!461854))))

(assert (=> b!828769 (= res!564668 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828770 () Bool)

(declare-fun e!461852 () Bool)

(declare-fun call!36067 () Bool)

(assert (=> b!828770 (= e!461852 call!36067)))

(declare-fun b!828771 () Bool)

(assert (=> b!828771 (= e!461853 e!461852)))

(declare-fun c!89679 () Bool)

(assert (=> b!828771 (= c!89679 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105215 () Bool)

(declare-fun res!564667 () Bool)

(assert (=> d!105215 (=> res!564667 e!461851)))

(assert (=> d!105215 (= res!564667 (bvsge #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> d!105215 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15899) e!461851)))

(declare-fun bm!36064 () Bool)

(assert (=> bm!36064 (= call!36067 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89679 (Cons!15898 (select (arr!22278 _keys!976) #b00000000000000000000000000000000) Nil!15899) Nil!15899)))))

(declare-fun b!828772 () Bool)

(declare-fun contains!4195 (List!15902 (_ BitVec 64)) Bool)

(assert (=> b!828772 (= e!461854 (contains!4195 Nil!15899 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828773 () Bool)

(assert (=> b!828773 (= e!461852 call!36067)))

(assert (= (and d!105215 (not res!564667)) b!828769))

(assert (= (and b!828769 res!564668) b!828772))

(assert (= (and b!828769 res!564666) b!828771))

(assert (= (and b!828771 c!89679) b!828770))

(assert (= (and b!828771 (not c!89679)) b!828773))

(assert (= (or b!828770 b!828773) bm!36064))

(assert (=> b!828769 m!771565))

(assert (=> b!828769 m!771565))

(assert (=> b!828769 m!771567))

(assert (=> b!828771 m!771565))

(assert (=> b!828771 m!771565))

(assert (=> b!828771 m!771567))

(assert (=> bm!36064 m!771565))

(declare-fun m!771729 () Bool)

(assert (=> bm!36064 m!771729))

(assert (=> b!828772 m!771565))

(assert (=> b!828772 m!771565))

(declare-fun m!771731 () Bool)

(assert (=> b!828772 m!771731))

(assert (=> b!828580 d!105215))

(declare-fun b!828782 () Bool)

(declare-fun e!461862 () Bool)

(declare-fun e!461861 () Bool)

(assert (=> b!828782 (= e!461862 e!461861)))

(declare-fun c!89682 () Bool)

(assert (=> b!828782 (= c!89682 (validKeyInArray!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!828783 () Bool)

(declare-fun e!461863 () Bool)

(declare-fun call!36070 () Bool)

(assert (=> b!828783 (= e!461863 call!36070)))

(declare-fun bm!36067 () Bool)

(assert (=> bm!36067 (= call!36070 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!828784 () Bool)

(assert (=> b!828784 (= e!461861 e!461863)))

(declare-fun lt!375623 () (_ BitVec 64))

(assert (=> b!828784 (= lt!375623 (select (arr!22278 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!375625 () Unit!28383)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46474 (_ BitVec 64) (_ BitVec 32)) Unit!28383)

(assert (=> b!828784 (= lt!375625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!375623 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!828784 (arrayContainsKey!0 _keys!976 lt!375623 #b00000000000000000000000000000000)))

(declare-fun lt!375624 () Unit!28383)

(assert (=> b!828784 (= lt!375624 lt!375625)))

(declare-fun res!564674 () Bool)

(declare-datatypes ((SeekEntryResult!8739 0))(
  ( (MissingZero!8739 (index!37327 (_ BitVec 32))) (Found!8739 (index!37328 (_ BitVec 32))) (Intermediate!8739 (undefined!9551 Bool) (index!37329 (_ BitVec 32)) (x!69977 (_ BitVec 32))) (Undefined!8739) (MissingVacant!8739 (index!37330 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46474 (_ BitVec 32)) SeekEntryResult!8739)

(assert (=> b!828784 (= res!564674 (= (seekEntryOrOpen!0 (select (arr!22278 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8739 #b00000000000000000000000000000000)))))

(assert (=> b!828784 (=> (not res!564674) (not e!461863))))

(declare-fun d!105217 () Bool)

(declare-fun res!564673 () Bool)

(assert (=> d!105217 (=> res!564673 e!461862)))

(assert (=> d!105217 (= res!564673 (bvsge #b00000000000000000000000000000000 (size!22699 _keys!976)))))

(assert (=> d!105217 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461862)))

(declare-fun b!828785 () Bool)

(assert (=> b!828785 (= e!461861 call!36070)))

(assert (= (and d!105217 (not res!564673)) b!828782))

(assert (= (and b!828782 c!89682) b!828784))

(assert (= (and b!828782 (not c!89682)) b!828785))

(assert (= (and b!828784 res!564674) b!828783))

(assert (= (or b!828783 b!828785) bm!36067))

(assert (=> b!828782 m!771565))

(assert (=> b!828782 m!771565))

(assert (=> b!828782 m!771567))

(declare-fun m!771733 () Bool)

(assert (=> bm!36067 m!771733))

(assert (=> b!828784 m!771565))

(declare-fun m!771735 () Bool)

(assert (=> b!828784 m!771735))

(declare-fun m!771737 () Bool)

(assert (=> b!828784 m!771737))

(assert (=> b!828784 m!771565))

(declare-fun m!771739 () Bool)

(assert (=> b!828784 m!771739))

(assert (=> b!828584 d!105217))

(declare-fun b!828793 () Bool)

(declare-fun e!461868 () Bool)

(assert (=> b!828793 (= e!461868 tp_is_empty!15153)))

(declare-fun b!828792 () Bool)

(declare-fun e!461869 () Bool)

(assert (=> b!828792 (= e!461869 tp_is_empty!15153)))

(declare-fun mapNonEmpty!24373 () Bool)

(declare-fun mapRes!24373 () Bool)

(declare-fun tp!47110 () Bool)

(assert (=> mapNonEmpty!24373 (= mapRes!24373 (and tp!47110 e!461869))))

(declare-fun mapRest!24373 () (Array (_ BitVec 32) ValueCell!7161))

(declare-fun mapValue!24373 () ValueCell!7161)

(declare-fun mapKey!24373 () (_ BitVec 32))

(assert (=> mapNonEmpty!24373 (= mapRest!24367 (store mapRest!24373 mapKey!24373 mapValue!24373))))

(declare-fun condMapEmpty!24373 () Bool)

(declare-fun mapDefault!24373 () ValueCell!7161)

(assert (=> mapNonEmpty!24367 (= condMapEmpty!24373 (= mapRest!24367 ((as const (Array (_ BitVec 32) ValueCell!7161)) mapDefault!24373)))))

(assert (=> mapNonEmpty!24367 (= tp!47100 (and e!461868 mapRes!24373))))

(declare-fun mapIsEmpty!24373 () Bool)

(assert (=> mapIsEmpty!24373 mapRes!24373))

(assert (= (and mapNonEmpty!24367 condMapEmpty!24373) mapIsEmpty!24373))

(assert (= (and mapNonEmpty!24367 (not condMapEmpty!24373)) mapNonEmpty!24373))

(assert (= (and mapNonEmpty!24373 ((_ is ValueCellFull!7161) mapValue!24373)) b!828792))

(assert (= (and mapNonEmpty!24367 ((_ is ValueCellFull!7161) mapDefault!24373)) b!828793))

(declare-fun m!771741 () Bool)

(assert (=> mapNonEmpty!24373 m!771741))

(declare-fun b_lambda!11239 () Bool)

(assert (= b_lambda!11229 (or (and start!71344 b_free!13443) b_lambda!11239)))

(declare-fun b_lambda!11241 () Bool)

(assert (= b_lambda!11235 (or (and start!71344 b_free!13443) b_lambda!11241)))

(declare-fun b_lambda!11243 () Bool)

(assert (= b_lambda!11237 (or (and start!71344 b_free!13443) b_lambda!11243)))

(declare-fun b_lambda!11245 () Bool)

(assert (= b_lambda!11233 (or (and start!71344 b_free!13443) b_lambda!11245)))

(declare-fun b_lambda!11247 () Bool)

(assert (= b_lambda!11227 (or (and start!71344 b_free!13443) b_lambda!11247)))

(declare-fun b_lambda!11249 () Bool)

(assert (= b_lambda!11231 (or (and start!71344 b_free!13443) b_lambda!11249)))

(check-sat tp_is_empty!15153 (not b!828706) (not b!828709) (not b!828745) (not d!105211) (not b!828769) (not b!828698) (not bm!36050) (not bm!36064) (not b_lambda!11241) (not mapNonEmpty!24373) (not b!828661) (not b!828748) (not b!828736) (not b!828757) (not d!105203) (not bm!36056) (not b!828738) (not b!828689) (not b!828771) (not b!828708) (not bm!36049) (not b!828687) (not b_lambda!11247) (not b!828750) (not b_lambda!11243) (not b!828752) (not b!828699) (not bm!36054) (not bm!36053) (not bm!36046) (not b!828784) (not b_lambda!11245) (not d!105205) (not d!105201) (not b!828744) (not b!828756) (not b!828670) b_and!22427 (not b!828677) (not b!828663) (not b!828679) (not d!105207) (not b!828671) (not b!828754) (not bm!36061) (not d!105213) (not bm!36060) (not bm!36057) (not b!828692) (not b_next!13443) (not b!828742) (not bm!36067) (not b!828690) (not b!828686) (not bm!36047) (not b!828700) (not b!828710) (not b!828758) (not d!105209) (not b!828669) (not b!828747) (not b!828660) (not b!828735) (not b!828772) (not b!828746) (not b_lambda!11239) (not b!828740) (not b_lambda!11249) (not b!828782))
(check-sat b_and!22427 (not b_next!13443))
