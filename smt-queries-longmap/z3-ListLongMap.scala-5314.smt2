; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71270 () Bool)

(assert start!71270)

(declare-fun b_free!13291 () Bool)

(declare-fun b_next!13291 () Bool)

(assert (=> start!71270 (= b_free!13291 (not b_next!13291))))

(declare-fun tp!46629 () Bool)

(declare-fun b_and!22215 () Bool)

(assert (=> start!71270 (= tp!46629 b_and!22215)))

(declare-fun b!826724 () Bool)

(declare-fun e!460330 () Bool)

(declare-fun e!460328 () Bool)

(declare-fun mapRes!24124 () Bool)

(assert (=> b!826724 (= e!460330 (and e!460328 mapRes!24124))))

(declare-fun condMapEmpty!24124 () Bool)

(declare-datatypes ((V!25003 0))(
  ( (V!25004 (val!7548 Int)) )
))
(declare-datatypes ((ValueCell!7085 0))(
  ( (ValueCellFull!7085 (v!9981 V!25003)) (EmptyCell!7085) )
))
(declare-datatypes ((array!46185 0))(
  ( (array!46186 (arr!22134 (Array (_ BitVec 32) ValueCell!7085)) (size!22554 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46185)

(declare-fun mapDefault!24124 () ValueCell!7085)

(assert (=> b!826724 (= condMapEmpty!24124 (= (arr!22134 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7085)) mapDefault!24124)))))

(declare-fun b!826725 () Bool)

(declare-fun e!460331 () Bool)

(declare-datatypes ((array!46187 0))(
  ( (array!46188 (arr!22135 (Array (_ BitVec 32) (_ BitVec 64))) (size!22555 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46187)

(assert (=> b!826725 (= e!460331 (bvsle #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826726 () Bool)

(declare-fun e!460334 () Bool)

(declare-fun e!460329 () Bool)

(assert (=> b!826726 (= e!460334 (not e!460329))))

(declare-fun res!563324 () Bool)

(assert (=> b!826726 (=> res!563324 e!460329)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826726 (= res!563324 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9920 0))(
  ( (tuple2!9921 (_1!4971 (_ BitVec 64)) (_2!4971 V!25003)) )
))
(declare-datatypes ((List!15701 0))(
  ( (Nil!15698) (Cons!15697 (h!16832 tuple2!9920) (t!22038 List!15701)) )
))
(declare-datatypes ((ListLongMap!8745 0))(
  ( (ListLongMap!8746 (toList!4388 List!15701)) )
))
(declare-fun lt!373577 () ListLongMap!8745)

(declare-fun lt!373581 () ListLongMap!8745)

(assert (=> b!826726 (= lt!373577 lt!373581)))

(declare-fun zeroValueBefore!34 () V!25003)

(declare-datatypes ((Unit!28326 0))(
  ( (Unit!28327) )
))
(declare-fun lt!373574 () Unit!28326)

(declare-fun zeroValueAfter!34 () V!25003)

(declare-fun minValue!754 () V!25003)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!555 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 V!25003 V!25003 (_ BitVec 32) Int) Unit!28326)

(assert (=> b!826726 (= lt!373574 (lemmaNoChangeToArrayThenSameMapNoExtras!555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2467 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 (_ BitVec 32) Int) ListLongMap!8745)

(assert (=> b!826726 (= lt!373581 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826726 (= lt!373577 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24124 () Bool)

(declare-fun tp!46630 () Bool)

(declare-fun e!460327 () Bool)

(assert (=> mapNonEmpty!24124 (= mapRes!24124 (and tp!46630 e!460327))))

(declare-fun mapKey!24124 () (_ BitVec 32))

(declare-fun mapRest!24124 () (Array (_ BitVec 32) ValueCell!7085))

(declare-fun mapValue!24124 () ValueCell!7085)

(assert (=> mapNonEmpty!24124 (= (arr!22134 _values!788) (store mapRest!24124 mapKey!24124 mapValue!24124))))

(declare-fun mapIsEmpty!24124 () Bool)

(assert (=> mapIsEmpty!24124 mapRes!24124))

(declare-fun b!826727 () Bool)

(declare-fun res!563319 () Bool)

(assert (=> b!826727 (=> (not res!563319) (not e!460334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46187 (_ BitVec 32)) Bool)

(assert (=> b!826727 (= res!563319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563320 () Bool)

(assert (=> start!71270 (=> (not res!563320) (not e!460334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71270 (= res!563320 (validMask!0 mask!1312))))

(assert (=> start!71270 e!460334))

(declare-fun tp_is_empty!15001 () Bool)

(assert (=> start!71270 tp_is_empty!15001))

(declare-fun array_inv!17685 (array!46187) Bool)

(assert (=> start!71270 (array_inv!17685 _keys!976)))

(assert (=> start!71270 true))

(declare-fun array_inv!17686 (array!46185) Bool)

(assert (=> start!71270 (and (array_inv!17686 _values!788) e!460330)))

(assert (=> start!71270 tp!46629))

(declare-fun b!826728 () Bool)

(declare-fun res!563318 () Bool)

(assert (=> b!826728 (=> (not res!563318) (not e!460334))))

(declare-datatypes ((List!15702 0))(
  ( (Nil!15699) (Cons!15698 (h!16833 (_ BitVec 64)) (t!22039 List!15702)) )
))
(declare-fun arrayNoDuplicates!0 (array!46187 (_ BitVec 32) List!15702) Bool)

(assert (=> b!826728 (= res!563318 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15699))))

(declare-fun b!826729 () Bool)

(assert (=> b!826729 (= e!460328 tp_is_empty!15001)))

(declare-fun lt!373572 () tuple2!9920)

(declare-fun e!460333 () Bool)

(declare-fun b!826730 () Bool)

(declare-fun lt!373578 () tuple2!9920)

(declare-fun lt!373575 () ListLongMap!8745)

(declare-fun +!1935 (ListLongMap!8745 tuple2!9920) ListLongMap!8745)

(assert (=> b!826730 (= e!460333 (= lt!373575 (+!1935 (+!1935 lt!373581 lt!373572) lt!373578)))))

(declare-fun b!826731 () Bool)

(declare-fun e!460332 () Bool)

(assert (=> b!826731 (= e!460332 (= lt!373575 (+!1935 (+!1935 lt!373581 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373572)))))

(declare-fun b!826732 () Bool)

(assert (=> b!826732 (= e!460327 tp_is_empty!15001)))

(declare-fun b!826733 () Bool)

(assert (=> b!826733 (= e!460329 e!460331)))

(declare-fun res!563323 () Bool)

(assert (=> b!826733 (=> res!563323 e!460331)))

(assert (=> b!826733 (= res!563323 (not (= lt!373575 (+!1935 (+!1935 lt!373577 lt!373578) lt!373572))))))

(declare-fun lt!373571 () ListLongMap!8745)

(declare-fun lt!373579 () ListLongMap!8745)

(assert (=> b!826733 (and (= lt!373571 lt!373579) (= lt!373575 lt!373579) (= lt!373575 lt!373571))))

(declare-fun lt!373576 () ListLongMap!8745)

(assert (=> b!826733 (= lt!373579 (+!1935 lt!373576 lt!373578))))

(declare-fun lt!373580 () ListLongMap!8745)

(assert (=> b!826733 (= lt!373571 (+!1935 lt!373580 lt!373578))))

(declare-fun lt!373569 () Unit!28326)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!220 (ListLongMap!8745 (_ BitVec 64) V!25003 V!25003) Unit!28326)

(assert (=> b!826733 (= lt!373569 (addSameAsAddTwiceSameKeyDiffValues!220 lt!373580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826733 e!460333))

(declare-fun res!563317 () Bool)

(assert (=> b!826733 (=> (not res!563317) (not e!460333))))

(declare-fun lt!373573 () ListLongMap!8745)

(assert (=> b!826733 (= res!563317 (= lt!373573 lt!373576))))

(declare-fun lt!373570 () tuple2!9920)

(assert (=> b!826733 (= lt!373576 (+!1935 lt!373580 lt!373570))))

(assert (=> b!826733 (= lt!373580 (+!1935 lt!373577 lt!373572))))

(assert (=> b!826733 (= lt!373578 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826733 e!460332))

(declare-fun res!563322 () Bool)

(assert (=> b!826733 (=> (not res!563322) (not e!460332))))

(assert (=> b!826733 (= res!563322 (= lt!373573 (+!1935 (+!1935 lt!373577 lt!373570) lt!373572)))))

(assert (=> b!826733 (= lt!373572 (tuple2!9921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826733 (= lt!373570 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2511 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 (_ BitVec 32) Int) ListLongMap!8745)

(assert (=> b!826733 (= lt!373575 (getCurrentListMap!2511 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826733 (= lt!373573 (getCurrentListMap!2511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826734 () Bool)

(declare-fun res!563321 () Bool)

(assert (=> b!826734 (=> (not res!563321) (not e!460334))))

(assert (=> b!826734 (= res!563321 (and (= (size!22554 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22555 _keys!976) (size!22554 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71270 res!563320) b!826734))

(assert (= (and b!826734 res!563321) b!826727))

(assert (= (and b!826727 res!563319) b!826728))

(assert (= (and b!826728 res!563318) b!826726))

(assert (= (and b!826726 (not res!563324)) b!826733))

(assert (= (and b!826733 res!563322) b!826731))

(assert (= (and b!826733 res!563317) b!826730))

(assert (= (and b!826733 (not res!563323)) b!826725))

(assert (= (and b!826724 condMapEmpty!24124) mapIsEmpty!24124))

(assert (= (and b!826724 (not condMapEmpty!24124)) mapNonEmpty!24124))

(get-info :version)

(assert (= (and mapNonEmpty!24124 ((_ is ValueCellFull!7085) mapValue!24124)) b!826732))

(assert (= (and b!826724 ((_ is ValueCellFull!7085) mapDefault!24124)) b!826729))

(assert (= start!71270 b!826724))

(declare-fun m!769503 () Bool)

(assert (=> b!826730 m!769503))

(assert (=> b!826730 m!769503))

(declare-fun m!769505 () Bool)

(assert (=> b!826730 m!769505))

(declare-fun m!769507 () Bool)

(assert (=> b!826733 m!769507))

(assert (=> b!826733 m!769507))

(declare-fun m!769509 () Bool)

(assert (=> b!826733 m!769509))

(declare-fun m!769511 () Bool)

(assert (=> b!826733 m!769511))

(declare-fun m!769513 () Bool)

(assert (=> b!826733 m!769513))

(assert (=> b!826733 m!769513))

(declare-fun m!769515 () Bool)

(assert (=> b!826733 m!769515))

(declare-fun m!769517 () Bool)

(assert (=> b!826733 m!769517))

(declare-fun m!769519 () Bool)

(assert (=> b!826733 m!769519))

(declare-fun m!769521 () Bool)

(assert (=> b!826733 m!769521))

(declare-fun m!769523 () Bool)

(assert (=> b!826733 m!769523))

(declare-fun m!769525 () Bool)

(assert (=> b!826733 m!769525))

(declare-fun m!769527 () Bool)

(assert (=> b!826733 m!769527))

(declare-fun m!769529 () Bool)

(assert (=> b!826726 m!769529))

(declare-fun m!769531 () Bool)

(assert (=> b!826726 m!769531))

(declare-fun m!769533 () Bool)

(assert (=> b!826726 m!769533))

(declare-fun m!769535 () Bool)

(assert (=> start!71270 m!769535))

(declare-fun m!769537 () Bool)

(assert (=> start!71270 m!769537))

(declare-fun m!769539 () Bool)

(assert (=> start!71270 m!769539))

(declare-fun m!769541 () Bool)

(assert (=> b!826727 m!769541))

(declare-fun m!769543 () Bool)

(assert (=> b!826728 m!769543))

(declare-fun m!769545 () Bool)

(assert (=> mapNonEmpty!24124 m!769545))

(declare-fun m!769547 () Bool)

(assert (=> b!826731 m!769547))

(assert (=> b!826731 m!769547))

(declare-fun m!769549 () Bool)

(assert (=> b!826731 m!769549))

(check-sat (not b!826733) (not b!826727) b_and!22215 (not b!826728) tp_is_empty!15001 (not b!826730) (not start!71270) (not b!826731) (not mapNonEmpty!24124) (not b!826726) (not b_next!13291))
(check-sat b_and!22215 (not b_next!13291))
(get-model)

(declare-fun d!105315 () Bool)

(assert (=> d!105315 (= (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373662 () Unit!28326)

(declare-fun choose!1411 (array!46187 array!46185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25003 V!25003 V!25003 V!25003 (_ BitVec 32) Int) Unit!28326)

(assert (=> d!105315 (= lt!373662 (choose!1411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105315 (validMask!0 mask!1312)))

(assert (=> d!105315 (= (lemmaNoChangeToArrayThenSameMapNoExtras!555 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373662)))

(declare-fun bs!23085 () Bool)

(assert (= bs!23085 d!105315))

(assert (=> bs!23085 m!769533))

(assert (=> bs!23085 m!769531))

(declare-fun m!769647 () Bool)

(assert (=> bs!23085 m!769647))

(assert (=> bs!23085 m!769535))

(assert (=> b!826726 d!105315))

(declare-fun e!460405 () Bool)

(declare-fun lt!373677 () ListLongMap!8745)

(declare-fun b!826825 () Bool)

(assert (=> b!826825 (= e!460405 (= lt!373677 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!826826 () Bool)

(declare-fun e!460403 () ListLongMap!8745)

(declare-fun call!35918 () ListLongMap!8745)

(assert (=> b!826826 (= e!460403 call!35918)))

(declare-fun bm!35915 () Bool)

(assert (=> bm!35915 (= call!35918 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!826827 () Bool)

(declare-fun e!460407 () ListLongMap!8745)

(assert (=> b!826827 (= e!460407 (ListLongMap!8746 Nil!15698))))

(declare-fun b!826828 () Bool)

(declare-fun e!460406 () Bool)

(declare-fun e!460409 () Bool)

(assert (=> b!826828 (= e!460406 e!460409)))

(assert (=> b!826828 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun res!563382 () Bool)

(declare-fun contains!4157 (ListLongMap!8745 (_ BitVec 64)) Bool)

(assert (=> b!826828 (= res!563382 (contains!4157 lt!373677 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826828 (=> (not res!563382) (not e!460409))))

(declare-fun b!826829 () Bool)

(declare-fun e!460404 () Bool)

(assert (=> b!826829 (= e!460404 e!460406)))

(declare-fun c!89716 () Bool)

(declare-fun e!460408 () Bool)

(assert (=> b!826829 (= c!89716 e!460408)))

(declare-fun res!563383 () Bool)

(assert (=> b!826829 (=> (not res!563383) (not e!460408))))

(assert (=> b!826829 (= res!563383 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826831 () Bool)

(assert (=> b!826831 (= e!460406 e!460405)))

(declare-fun c!89719 () Bool)

(assert (=> b!826831 (= c!89719 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826832 () Bool)

(assert (=> b!826832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(assert (=> b!826832 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22554 _values!788)))))

(declare-fun apply!362 (ListLongMap!8745 (_ BitVec 64)) V!25003)

(declare-fun get!11742 (ValueCell!7085 V!25003) V!25003)

(declare-fun dynLambda!970 (Int (_ BitVec 64)) V!25003)

(assert (=> b!826832 (= e!460409 (= (apply!362 lt!373677 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)) (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!826833 () Bool)

(assert (=> b!826833 (= e!460407 e!460403)))

(declare-fun c!89717 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!826833 (= c!89717 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826834 () Bool)

(declare-fun res!563384 () Bool)

(assert (=> b!826834 (=> (not res!563384) (not e!460404))))

(assert (=> b!826834 (= res!563384 (not (contains!4157 lt!373677 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!105317 () Bool)

(assert (=> d!105317 e!460404))

(declare-fun res!563381 () Bool)

(assert (=> d!105317 (=> (not res!563381) (not e!460404))))

(assert (=> d!105317 (= res!563381 (not (contains!4157 lt!373677 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105317 (= lt!373677 e!460407)))

(declare-fun c!89718 () Bool)

(assert (=> d!105317 (= c!89718 (bvsge #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(assert (=> d!105317 (validMask!0 mask!1312)))

(assert (=> d!105317 (= (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373677)))

(declare-fun b!826830 () Bool)

(declare-fun lt!373678 () Unit!28326)

(declare-fun lt!373682 () Unit!28326)

(assert (=> b!826830 (= lt!373678 lt!373682)))

(declare-fun lt!373679 () (_ BitVec 64))

(declare-fun lt!373683 () ListLongMap!8745)

(declare-fun lt!373681 () (_ BitVec 64))

(declare-fun lt!373680 () V!25003)

(assert (=> b!826830 (not (contains!4157 (+!1935 lt!373683 (tuple2!9921 lt!373681 lt!373680)) lt!373679))))

(declare-fun addStillNotContains!189 (ListLongMap!8745 (_ BitVec 64) V!25003 (_ BitVec 64)) Unit!28326)

(assert (=> b!826830 (= lt!373682 (addStillNotContains!189 lt!373683 lt!373681 lt!373680 lt!373679))))

(assert (=> b!826830 (= lt!373679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!826830 (= lt!373680 (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!826830 (= lt!373681 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826830 (= lt!373683 call!35918)))

(assert (=> b!826830 (= e!460403 (+!1935 call!35918 (tuple2!9921 (select (arr!22135 _keys!976) #b00000000000000000000000000000000) (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!826835 () Bool)

(assert (=> b!826835 (= e!460408 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826835 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!826836 () Bool)

(declare-fun isEmpty!650 (ListLongMap!8745) Bool)

(assert (=> b!826836 (= e!460405 (isEmpty!650 lt!373677))))

(assert (= (and d!105317 c!89718) b!826827))

(assert (= (and d!105317 (not c!89718)) b!826833))

(assert (= (and b!826833 c!89717) b!826830))

(assert (= (and b!826833 (not c!89717)) b!826826))

(assert (= (or b!826830 b!826826) bm!35915))

(assert (= (and d!105317 res!563381) b!826834))

(assert (= (and b!826834 res!563384) b!826829))

(assert (= (and b!826829 res!563383) b!826835))

(assert (= (and b!826829 c!89716) b!826828))

(assert (= (and b!826829 (not c!89716)) b!826831))

(assert (= (and b!826828 res!563382) b!826832))

(assert (= (and b!826831 c!89719) b!826825))

(assert (= (and b!826831 (not c!89719)) b!826836))

(declare-fun b_lambda!11129 () Bool)

(assert (=> (not b_lambda!11129) (not b!826832)))

(declare-fun t!22043 () Bool)

(declare-fun tb!4197 () Bool)

(assert (=> (and start!71270 (= defaultEntry!796 defaultEntry!796) t!22043) tb!4197))

(declare-fun result!7947 () Bool)

(assert (=> tb!4197 (= result!7947 tp_is_empty!15001)))

(assert (=> b!826832 t!22043))

(declare-fun b_and!22221 () Bool)

(assert (= b_and!22215 (and (=> t!22043 result!7947) b_and!22221)))

(declare-fun b_lambda!11131 () Bool)

(assert (=> (not b_lambda!11131) (not b!826830)))

(assert (=> b!826830 t!22043))

(declare-fun b_and!22223 () Bool)

(assert (= b_and!22221 (and (=> t!22043 result!7947) b_and!22223)))

(declare-fun m!769649 () Bool)

(assert (=> b!826825 m!769649))

(declare-fun m!769651 () Bool)

(assert (=> b!826832 m!769651))

(declare-fun m!769653 () Bool)

(assert (=> b!826832 m!769653))

(assert (=> b!826832 m!769651))

(declare-fun m!769655 () Bool)

(assert (=> b!826832 m!769655))

(declare-fun m!769657 () Bool)

(assert (=> b!826832 m!769657))

(assert (=> b!826832 m!769653))

(declare-fun m!769659 () Bool)

(assert (=> b!826832 m!769659))

(assert (=> b!826832 m!769657))

(assert (=> b!826835 m!769651))

(assert (=> b!826835 m!769651))

(declare-fun m!769661 () Bool)

(assert (=> b!826835 m!769661))

(declare-fun m!769663 () Bool)

(assert (=> b!826834 m!769663))

(declare-fun m!769665 () Bool)

(assert (=> b!826830 m!769665))

(assert (=> b!826830 m!769665))

(declare-fun m!769667 () Bool)

(assert (=> b!826830 m!769667))

(assert (=> b!826830 m!769653))

(assert (=> b!826830 m!769657))

(assert (=> b!826830 m!769651))

(declare-fun m!769669 () Bool)

(assert (=> b!826830 m!769669))

(declare-fun m!769671 () Bool)

(assert (=> b!826830 m!769671))

(assert (=> b!826830 m!769657))

(assert (=> b!826830 m!769653))

(assert (=> b!826830 m!769659))

(assert (=> b!826828 m!769651))

(assert (=> b!826828 m!769651))

(declare-fun m!769673 () Bool)

(assert (=> b!826828 m!769673))

(assert (=> bm!35915 m!769649))

(assert (=> b!826833 m!769651))

(assert (=> b!826833 m!769651))

(assert (=> b!826833 m!769661))

(declare-fun m!769675 () Bool)

(assert (=> d!105317 m!769675))

(assert (=> d!105317 m!769535))

(declare-fun m!769677 () Bool)

(assert (=> b!826836 m!769677))

(assert (=> b!826726 d!105317))

(declare-fun b!826839 () Bool)

(declare-fun lt!373684 () ListLongMap!8745)

(declare-fun e!460412 () Bool)

(assert (=> b!826839 (= e!460412 (= lt!373684 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!826840 () Bool)

(declare-fun e!460410 () ListLongMap!8745)

(declare-fun call!35919 () ListLongMap!8745)

(assert (=> b!826840 (= e!460410 call!35919)))

(declare-fun bm!35916 () Bool)

(assert (=> bm!35916 (= call!35919 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!826841 () Bool)

(declare-fun e!460414 () ListLongMap!8745)

(assert (=> b!826841 (= e!460414 (ListLongMap!8746 Nil!15698))))

(declare-fun b!826842 () Bool)

(declare-fun e!460413 () Bool)

(declare-fun e!460416 () Bool)

(assert (=> b!826842 (= e!460413 e!460416)))

(assert (=> b!826842 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun res!563386 () Bool)

(assert (=> b!826842 (= res!563386 (contains!4157 lt!373684 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826842 (=> (not res!563386) (not e!460416))))

(declare-fun b!826843 () Bool)

(declare-fun e!460411 () Bool)

(assert (=> b!826843 (= e!460411 e!460413)))

(declare-fun c!89720 () Bool)

(declare-fun e!460415 () Bool)

(assert (=> b!826843 (= c!89720 e!460415)))

(declare-fun res!563387 () Bool)

(assert (=> b!826843 (=> (not res!563387) (not e!460415))))

(assert (=> b!826843 (= res!563387 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826845 () Bool)

(assert (=> b!826845 (= e!460413 e!460412)))

(declare-fun c!89723 () Bool)

(assert (=> b!826845 (= c!89723 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826846 () Bool)

(assert (=> b!826846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(assert (=> b!826846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22554 _values!788)))))

(assert (=> b!826846 (= e!460416 (= (apply!362 lt!373684 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)) (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!826847 () Bool)

(assert (=> b!826847 (= e!460414 e!460410)))

(declare-fun c!89721 () Bool)

(assert (=> b!826847 (= c!89721 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826848 () Bool)

(declare-fun res!563388 () Bool)

(assert (=> b!826848 (=> (not res!563388) (not e!460411))))

(assert (=> b!826848 (= res!563388 (not (contains!4157 lt!373684 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!105319 () Bool)

(assert (=> d!105319 e!460411))

(declare-fun res!563385 () Bool)

(assert (=> d!105319 (=> (not res!563385) (not e!460411))))

(assert (=> d!105319 (= res!563385 (not (contains!4157 lt!373684 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105319 (= lt!373684 e!460414)))

(declare-fun c!89722 () Bool)

(assert (=> d!105319 (= c!89722 (bvsge #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(assert (=> d!105319 (validMask!0 mask!1312)))

(assert (=> d!105319 (= (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373684)))

(declare-fun b!826844 () Bool)

(declare-fun lt!373685 () Unit!28326)

(declare-fun lt!373689 () Unit!28326)

(assert (=> b!826844 (= lt!373685 lt!373689)))

(declare-fun lt!373690 () ListLongMap!8745)

(declare-fun lt!373686 () (_ BitVec 64))

(declare-fun lt!373687 () V!25003)

(declare-fun lt!373688 () (_ BitVec 64))

(assert (=> b!826844 (not (contains!4157 (+!1935 lt!373690 (tuple2!9921 lt!373688 lt!373687)) lt!373686))))

(assert (=> b!826844 (= lt!373689 (addStillNotContains!189 lt!373690 lt!373688 lt!373687 lt!373686))))

(assert (=> b!826844 (= lt!373686 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!826844 (= lt!373687 (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!826844 (= lt!373688 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826844 (= lt!373690 call!35919)))

(assert (=> b!826844 (= e!460410 (+!1935 call!35919 (tuple2!9921 (select (arr!22135 _keys!976) #b00000000000000000000000000000000) (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!826849 () Bool)

(assert (=> b!826849 (= e!460415 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826849 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!826850 () Bool)

(assert (=> b!826850 (= e!460412 (isEmpty!650 lt!373684))))

(assert (= (and d!105319 c!89722) b!826841))

(assert (= (and d!105319 (not c!89722)) b!826847))

(assert (= (and b!826847 c!89721) b!826844))

(assert (= (and b!826847 (not c!89721)) b!826840))

(assert (= (or b!826844 b!826840) bm!35916))

(assert (= (and d!105319 res!563385) b!826848))

(assert (= (and b!826848 res!563388) b!826843))

(assert (= (and b!826843 res!563387) b!826849))

(assert (= (and b!826843 c!89720) b!826842))

(assert (= (and b!826843 (not c!89720)) b!826845))

(assert (= (and b!826842 res!563386) b!826846))

(assert (= (and b!826845 c!89723) b!826839))

(assert (= (and b!826845 (not c!89723)) b!826850))

(declare-fun b_lambda!11133 () Bool)

(assert (=> (not b_lambda!11133) (not b!826846)))

(assert (=> b!826846 t!22043))

(declare-fun b_and!22225 () Bool)

(assert (= b_and!22223 (and (=> t!22043 result!7947) b_and!22225)))

(declare-fun b_lambda!11135 () Bool)

(assert (=> (not b_lambda!11135) (not b!826844)))

(assert (=> b!826844 t!22043))

(declare-fun b_and!22227 () Bool)

(assert (= b_and!22225 (and (=> t!22043 result!7947) b_and!22227)))

(declare-fun m!769679 () Bool)

(assert (=> b!826839 m!769679))

(assert (=> b!826846 m!769651))

(assert (=> b!826846 m!769653))

(assert (=> b!826846 m!769651))

(declare-fun m!769681 () Bool)

(assert (=> b!826846 m!769681))

(assert (=> b!826846 m!769657))

(assert (=> b!826846 m!769653))

(assert (=> b!826846 m!769659))

(assert (=> b!826846 m!769657))

(assert (=> b!826849 m!769651))

(assert (=> b!826849 m!769651))

(assert (=> b!826849 m!769661))

(declare-fun m!769683 () Bool)

(assert (=> b!826848 m!769683))

(declare-fun m!769685 () Bool)

(assert (=> b!826844 m!769685))

(assert (=> b!826844 m!769685))

(declare-fun m!769687 () Bool)

(assert (=> b!826844 m!769687))

(assert (=> b!826844 m!769653))

(assert (=> b!826844 m!769657))

(assert (=> b!826844 m!769651))

(declare-fun m!769689 () Bool)

(assert (=> b!826844 m!769689))

(declare-fun m!769691 () Bool)

(assert (=> b!826844 m!769691))

(assert (=> b!826844 m!769657))

(assert (=> b!826844 m!769653))

(assert (=> b!826844 m!769659))

(assert (=> b!826842 m!769651))

(assert (=> b!826842 m!769651))

(declare-fun m!769693 () Bool)

(assert (=> b!826842 m!769693))

(assert (=> bm!35916 m!769679))

(assert (=> b!826847 m!769651))

(assert (=> b!826847 m!769651))

(assert (=> b!826847 m!769661))

(declare-fun m!769695 () Bool)

(assert (=> d!105319 m!769695))

(assert (=> d!105319 m!769535))

(declare-fun m!769697 () Bool)

(assert (=> b!826850 m!769697))

(assert (=> b!826726 d!105319))

(declare-fun d!105321 () Bool)

(declare-fun res!563397 () Bool)

(declare-fun e!460427 () Bool)

(assert (=> d!105321 (=> res!563397 e!460427)))

(assert (=> d!105321 (= res!563397 (bvsge #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(assert (=> d!105321 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15699) e!460427)))

(declare-fun b!826861 () Bool)

(declare-fun e!460425 () Bool)

(declare-fun call!35922 () Bool)

(assert (=> b!826861 (= e!460425 call!35922)))

(declare-fun b!826862 () Bool)

(declare-fun e!460426 () Bool)

(declare-fun contains!4158 (List!15702 (_ BitVec 64)) Bool)

(assert (=> b!826862 (= e!460426 (contains!4158 Nil!15699 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826863 () Bool)

(assert (=> b!826863 (= e!460425 call!35922)))

(declare-fun bm!35919 () Bool)

(declare-fun c!89726 () Bool)

(assert (=> bm!35919 (= call!35922 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89726 (Cons!15698 (select (arr!22135 _keys!976) #b00000000000000000000000000000000) Nil!15699) Nil!15699)))))

(declare-fun b!826864 () Bool)

(declare-fun e!460428 () Bool)

(assert (=> b!826864 (= e!460427 e!460428)))

(declare-fun res!563396 () Bool)

(assert (=> b!826864 (=> (not res!563396) (not e!460428))))

(assert (=> b!826864 (= res!563396 (not e!460426))))

(declare-fun res!563395 () Bool)

(assert (=> b!826864 (=> (not res!563395) (not e!460426))))

(assert (=> b!826864 (= res!563395 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826865 () Bool)

(assert (=> b!826865 (= e!460428 e!460425)))

(assert (=> b!826865 (= c!89726 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105321 (not res!563397)) b!826864))

(assert (= (and b!826864 res!563395) b!826862))

(assert (= (and b!826864 res!563396) b!826865))

(assert (= (and b!826865 c!89726) b!826863))

(assert (= (and b!826865 (not c!89726)) b!826861))

(assert (= (or b!826863 b!826861) bm!35919))

(assert (=> b!826862 m!769651))

(assert (=> b!826862 m!769651))

(declare-fun m!769699 () Bool)

(assert (=> b!826862 m!769699))

(assert (=> bm!35919 m!769651))

(declare-fun m!769701 () Bool)

(assert (=> bm!35919 m!769701))

(assert (=> b!826864 m!769651))

(assert (=> b!826864 m!769651))

(assert (=> b!826864 m!769661))

(assert (=> b!826865 m!769651))

(assert (=> b!826865 m!769651))

(assert (=> b!826865 m!769661))

(assert (=> b!826728 d!105321))

(declare-fun d!105323 () Bool)

(declare-fun e!460431 () Bool)

(assert (=> d!105323 e!460431))

(declare-fun res!563403 () Bool)

(assert (=> d!105323 (=> (not res!563403) (not e!460431))))

(declare-fun lt!373701 () ListLongMap!8745)

(assert (=> d!105323 (= res!563403 (contains!4157 lt!373701 (_1!4971 lt!373578)))))

(declare-fun lt!373699 () List!15701)

(assert (=> d!105323 (= lt!373701 (ListLongMap!8746 lt!373699))))

(declare-fun lt!373700 () Unit!28326)

(declare-fun lt!373702 () Unit!28326)

(assert (=> d!105323 (= lt!373700 lt!373702)))

(declare-datatypes ((Option!413 0))(
  ( (Some!412 (v!9984 V!25003)) (None!411) )
))
(declare-fun getValueByKey!407 (List!15701 (_ BitVec 64)) Option!413)

(assert (=> d!105323 (= (getValueByKey!407 lt!373699 (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578)))))

(declare-fun lemmaContainsTupThenGetReturnValue!221 (List!15701 (_ BitVec 64) V!25003) Unit!28326)

(assert (=> d!105323 (= lt!373702 (lemmaContainsTupThenGetReturnValue!221 lt!373699 (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(declare-fun insertStrictlySorted!260 (List!15701 (_ BitVec 64) V!25003) List!15701)

(assert (=> d!105323 (= lt!373699 (insertStrictlySorted!260 (toList!4388 lt!373576) (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105323 (= (+!1935 lt!373576 lt!373578) lt!373701)))

(declare-fun b!826870 () Bool)

(declare-fun res!563402 () Bool)

(assert (=> b!826870 (=> (not res!563402) (not e!460431))))

(assert (=> b!826870 (= res!563402 (= (getValueByKey!407 (toList!4388 lt!373701) (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578))))))

(declare-fun b!826871 () Bool)

(declare-fun contains!4159 (List!15701 tuple2!9920) Bool)

(assert (=> b!826871 (= e!460431 (contains!4159 (toList!4388 lt!373701) lt!373578))))

(assert (= (and d!105323 res!563403) b!826870))

(assert (= (and b!826870 res!563402) b!826871))

(declare-fun m!769703 () Bool)

(assert (=> d!105323 m!769703))

(declare-fun m!769705 () Bool)

(assert (=> d!105323 m!769705))

(declare-fun m!769707 () Bool)

(assert (=> d!105323 m!769707))

(declare-fun m!769709 () Bool)

(assert (=> d!105323 m!769709))

(declare-fun m!769711 () Bool)

(assert (=> b!826870 m!769711))

(declare-fun m!769713 () Bool)

(assert (=> b!826871 m!769713))

(assert (=> b!826733 d!105323))

(declare-fun d!105325 () Bool)

(declare-fun e!460432 () Bool)

(assert (=> d!105325 e!460432))

(declare-fun res!563405 () Bool)

(assert (=> d!105325 (=> (not res!563405) (not e!460432))))

(declare-fun lt!373705 () ListLongMap!8745)

(assert (=> d!105325 (= res!563405 (contains!4157 lt!373705 (_1!4971 lt!373572)))))

(declare-fun lt!373703 () List!15701)

(assert (=> d!105325 (= lt!373705 (ListLongMap!8746 lt!373703))))

(declare-fun lt!373704 () Unit!28326)

(declare-fun lt!373706 () Unit!28326)

(assert (=> d!105325 (= lt!373704 lt!373706)))

(assert (=> d!105325 (= (getValueByKey!407 lt!373703 (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572)))))

(assert (=> d!105325 (= lt!373706 (lemmaContainsTupThenGetReturnValue!221 lt!373703 (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105325 (= lt!373703 (insertStrictlySorted!260 (toList!4388 lt!373577) (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105325 (= (+!1935 lt!373577 lt!373572) lt!373705)))

(declare-fun b!826872 () Bool)

(declare-fun res!563404 () Bool)

(assert (=> b!826872 (=> (not res!563404) (not e!460432))))

(assert (=> b!826872 (= res!563404 (= (getValueByKey!407 (toList!4388 lt!373705) (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572))))))

(declare-fun b!826873 () Bool)

(assert (=> b!826873 (= e!460432 (contains!4159 (toList!4388 lt!373705) lt!373572))))

(assert (= (and d!105325 res!563405) b!826872))

(assert (= (and b!826872 res!563404) b!826873))

(declare-fun m!769715 () Bool)

(assert (=> d!105325 m!769715))

(declare-fun m!769717 () Bool)

(assert (=> d!105325 m!769717))

(declare-fun m!769719 () Bool)

(assert (=> d!105325 m!769719))

(declare-fun m!769721 () Bool)

(assert (=> d!105325 m!769721))

(declare-fun m!769723 () Bool)

(assert (=> b!826872 m!769723))

(declare-fun m!769725 () Bool)

(assert (=> b!826873 m!769725))

(assert (=> b!826733 d!105325))

(declare-fun b!826916 () Bool)

(declare-fun e!460468 () Bool)

(declare-fun e!460459 () Bool)

(assert (=> b!826916 (= e!460468 e!460459)))

(declare-fun res!563424 () Bool)

(assert (=> b!826916 (=> (not res!563424) (not e!460459))))

(declare-fun lt!373762 () ListLongMap!8745)

(assert (=> b!826916 (= res!563424 (contains!4157 lt!373762 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826917 () Bool)

(declare-fun e!460470 () Bool)

(assert (=> b!826917 (= e!460470 (= (apply!362 lt!373762 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!826918 () Bool)

(declare-fun e!460466 () Bool)

(declare-fun call!35941 () Bool)

(assert (=> b!826918 (= e!460466 (not call!35941))))

(declare-fun b!826919 () Bool)

(declare-fun e!460464 () Unit!28326)

(declare-fun Unit!28330 () Unit!28326)

(assert (=> b!826919 (= e!460464 Unit!28330)))

(declare-fun bm!35934 () Bool)

(declare-fun call!35937 () ListLongMap!8745)

(assert (=> bm!35934 (= call!35937 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun d!105327 () Bool)

(declare-fun e!460463 () Bool)

(assert (=> d!105327 e!460463))

(declare-fun res!563430 () Bool)

(assert (=> d!105327 (=> (not res!563430) (not e!460463))))

(assert (=> d!105327 (= res!563430 (or (bvsge #b00000000000000000000000000000000 (size!22555 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))))

(declare-fun lt!373759 () ListLongMap!8745)

(assert (=> d!105327 (= lt!373762 lt!373759)))

(declare-fun lt!373763 () Unit!28326)

(assert (=> d!105327 (= lt!373763 e!460464)))

(declare-fun c!89739 () Bool)

(declare-fun e!460460 () Bool)

(assert (=> d!105327 (= c!89739 e!460460)))

(declare-fun res!563426 () Bool)

(assert (=> d!105327 (=> (not res!563426) (not e!460460))))

(assert (=> d!105327 (= res!563426 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun e!460462 () ListLongMap!8745)

(assert (=> d!105327 (= lt!373759 e!460462)))

(declare-fun c!89741 () Bool)

(assert (=> d!105327 (= c!89741 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105327 (validMask!0 mask!1312)))

(assert (=> d!105327 (= (getCurrentListMap!2511 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373762)))

(declare-fun b!826920 () Bool)

(declare-fun res!563425 () Bool)

(assert (=> b!826920 (=> (not res!563425) (not e!460463))))

(assert (=> b!826920 (= res!563425 e!460468)))

(declare-fun res!563427 () Bool)

(assert (=> b!826920 (=> res!563427 e!460468)))

(declare-fun e!460469 () Bool)

(assert (=> b!826920 (= res!563427 (not e!460469))))

(declare-fun res!563428 () Bool)

(assert (=> b!826920 (=> (not res!563428) (not e!460469))))

(assert (=> b!826920 (= res!563428 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826921 () Bool)

(assert (=> b!826921 (= e!460459 (= (apply!362 lt!373762 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)) (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!826921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22554 _values!788)))))

(assert (=> b!826921 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826922 () Bool)

(assert (=> b!826922 (= e!460466 e!460470)))

(declare-fun res!563429 () Bool)

(assert (=> b!826922 (= res!563429 call!35941)))

(assert (=> b!826922 (=> (not res!563429) (not e!460470))))

(declare-fun b!826923 () Bool)

(declare-fun call!35942 () ListLongMap!8745)

(assert (=> b!826923 (= e!460462 (+!1935 call!35942 (tuple2!9921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35935 () Bool)

(declare-fun call!35943 () ListLongMap!8745)

(assert (=> bm!35935 (= call!35943 call!35937)))

(declare-fun bm!35936 () Bool)

(declare-fun call!35939 () Bool)

(assert (=> bm!35936 (= call!35939 (contains!4157 lt!373762 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826924 () Bool)

(declare-fun e!460467 () ListLongMap!8745)

(assert (=> b!826924 (= e!460462 e!460467)))

(declare-fun c!89743 () Bool)

(assert (=> b!826924 (= c!89743 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35937 () Bool)

(declare-fun call!35938 () ListLongMap!8745)

(assert (=> bm!35937 (= call!35938 call!35943)))

(declare-fun b!826925 () Bool)

(declare-fun lt!373766 () Unit!28326)

(assert (=> b!826925 (= e!460464 lt!373766)))

(declare-fun lt!373755 () ListLongMap!8745)

(assert (=> b!826925 (= lt!373755 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373753 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373753 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373772 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373772 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373765 () Unit!28326)

(declare-fun addStillContains!314 (ListLongMap!8745 (_ BitVec 64) V!25003 (_ BitVec 64)) Unit!28326)

(assert (=> b!826925 (= lt!373765 (addStillContains!314 lt!373755 lt!373753 zeroValueAfter!34 lt!373772))))

(assert (=> b!826925 (contains!4157 (+!1935 lt!373755 (tuple2!9921 lt!373753 zeroValueAfter!34)) lt!373772)))

(declare-fun lt!373756 () Unit!28326)

(assert (=> b!826925 (= lt!373756 lt!373765)))

(declare-fun lt!373764 () ListLongMap!8745)

(assert (=> b!826925 (= lt!373764 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373767 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373767 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373758 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373758 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373769 () Unit!28326)

(declare-fun addApplyDifferent!314 (ListLongMap!8745 (_ BitVec 64) V!25003 (_ BitVec 64)) Unit!28326)

(assert (=> b!826925 (= lt!373769 (addApplyDifferent!314 lt!373764 lt!373767 minValue!754 lt!373758))))

(assert (=> b!826925 (= (apply!362 (+!1935 lt!373764 (tuple2!9921 lt!373767 minValue!754)) lt!373758) (apply!362 lt!373764 lt!373758))))

(declare-fun lt!373752 () Unit!28326)

(assert (=> b!826925 (= lt!373752 lt!373769)))

(declare-fun lt!373760 () ListLongMap!8745)

(assert (=> b!826925 (= lt!373760 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373751 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373768 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373768 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373754 () Unit!28326)

(assert (=> b!826925 (= lt!373754 (addApplyDifferent!314 lt!373760 lt!373751 zeroValueAfter!34 lt!373768))))

(assert (=> b!826925 (= (apply!362 (+!1935 lt!373760 (tuple2!9921 lt!373751 zeroValueAfter!34)) lt!373768) (apply!362 lt!373760 lt!373768))))

(declare-fun lt!373757 () Unit!28326)

(assert (=> b!826925 (= lt!373757 lt!373754)))

(declare-fun lt!373761 () ListLongMap!8745)

(assert (=> b!826925 (= lt!373761 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373770 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373770 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373771 () (_ BitVec 64))

(assert (=> b!826925 (= lt!373771 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826925 (= lt!373766 (addApplyDifferent!314 lt!373761 lt!373770 minValue!754 lt!373771))))

(assert (=> b!826925 (= (apply!362 (+!1935 lt!373761 (tuple2!9921 lt!373770 minValue!754)) lt!373771) (apply!362 lt!373761 lt!373771))))

(declare-fun b!826926 () Bool)

(declare-fun e!460465 () Bool)

(assert (=> b!826926 (= e!460465 (not call!35939))))

(declare-fun b!826927 () Bool)

(declare-fun e!460461 () ListLongMap!8745)

(declare-fun call!35940 () ListLongMap!8745)

(assert (=> b!826927 (= e!460461 call!35940)))

(declare-fun b!826928 () Bool)

(declare-fun e!460471 () Bool)

(assert (=> b!826928 (= e!460465 e!460471)))

(declare-fun res!563432 () Bool)

(assert (=> b!826928 (= res!563432 call!35939)))

(assert (=> b!826928 (=> (not res!563432) (not e!460471))))

(declare-fun bm!35938 () Bool)

(assert (=> bm!35938 (= call!35942 (+!1935 (ite c!89741 call!35937 (ite c!89743 call!35943 call!35938)) (ite (or c!89741 c!89743) (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!9921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!826929 () Bool)

(assert (=> b!826929 (= e!460467 call!35940)))

(declare-fun bm!35939 () Bool)

(assert (=> bm!35939 (= call!35940 call!35942)))

(declare-fun b!826930 () Bool)

(assert (=> b!826930 (= e!460461 call!35938)))

(declare-fun b!826931 () Bool)

(assert (=> b!826931 (= e!460469 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826932 () Bool)

(declare-fun c!89742 () Bool)

(assert (=> b!826932 (= c!89742 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826932 (= e!460467 e!460461)))

(declare-fun b!826933 () Bool)

(assert (=> b!826933 (= e!460460 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826934 () Bool)

(assert (=> b!826934 (= e!460463 e!460465)))

(declare-fun c!89744 () Bool)

(assert (=> b!826934 (= c!89744 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!826935 () Bool)

(declare-fun res!563431 () Bool)

(assert (=> b!826935 (=> (not res!563431) (not e!460463))))

(assert (=> b!826935 (= res!563431 e!460466)))

(declare-fun c!89740 () Bool)

(assert (=> b!826935 (= c!89740 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35940 () Bool)

(assert (=> bm!35940 (= call!35941 (contains!4157 lt!373762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826936 () Bool)

(assert (=> b!826936 (= e!460471 (= (apply!362 lt!373762 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(assert (= (and d!105327 c!89741) b!826923))

(assert (= (and d!105327 (not c!89741)) b!826924))

(assert (= (and b!826924 c!89743) b!826929))

(assert (= (and b!826924 (not c!89743)) b!826932))

(assert (= (and b!826932 c!89742) b!826927))

(assert (= (and b!826932 (not c!89742)) b!826930))

(assert (= (or b!826927 b!826930) bm!35937))

(assert (= (or b!826929 bm!35937) bm!35935))

(assert (= (or b!826929 b!826927) bm!35939))

(assert (= (or b!826923 bm!35935) bm!35934))

(assert (= (or b!826923 bm!35939) bm!35938))

(assert (= (and d!105327 res!563426) b!826933))

(assert (= (and d!105327 c!89739) b!826925))

(assert (= (and d!105327 (not c!89739)) b!826919))

(assert (= (and d!105327 res!563430) b!826920))

(assert (= (and b!826920 res!563428) b!826931))

(assert (= (and b!826920 (not res!563427)) b!826916))

(assert (= (and b!826916 res!563424) b!826921))

(assert (= (and b!826920 res!563425) b!826935))

(assert (= (and b!826935 c!89740) b!826922))

(assert (= (and b!826935 (not c!89740)) b!826918))

(assert (= (and b!826922 res!563429) b!826917))

(assert (= (or b!826922 b!826918) bm!35940))

(assert (= (and b!826935 res!563431) b!826934))

(assert (= (and b!826934 c!89744) b!826928))

(assert (= (and b!826934 (not c!89744)) b!826926))

(assert (= (and b!826928 res!563432) b!826936))

(assert (= (or b!826928 b!826926) bm!35936))

(declare-fun b_lambda!11137 () Bool)

(assert (=> (not b_lambda!11137) (not b!826921)))

(assert (=> b!826921 t!22043))

(declare-fun b_and!22229 () Bool)

(assert (= b_and!22227 (and (=> t!22043 result!7947) b_and!22229)))

(declare-fun m!769727 () Bool)

(assert (=> b!826925 m!769727))

(declare-fun m!769729 () Bool)

(assert (=> b!826925 m!769729))

(declare-fun m!769731 () Bool)

(assert (=> b!826925 m!769731))

(declare-fun m!769733 () Bool)

(assert (=> b!826925 m!769733))

(declare-fun m!769735 () Bool)

(assert (=> b!826925 m!769735))

(declare-fun m!769737 () Bool)

(assert (=> b!826925 m!769737))

(declare-fun m!769739 () Bool)

(assert (=> b!826925 m!769739))

(declare-fun m!769741 () Bool)

(assert (=> b!826925 m!769741))

(declare-fun m!769743 () Bool)

(assert (=> b!826925 m!769743))

(declare-fun m!769745 () Bool)

(assert (=> b!826925 m!769745))

(declare-fun m!769747 () Bool)

(assert (=> b!826925 m!769747))

(declare-fun m!769749 () Bool)

(assert (=> b!826925 m!769749))

(assert (=> b!826925 m!769727))

(assert (=> b!826925 m!769739))

(assert (=> b!826925 m!769531))

(assert (=> b!826925 m!769737))

(declare-fun m!769751 () Bool)

(assert (=> b!826925 m!769751))

(assert (=> b!826925 m!769651))

(declare-fun m!769753 () Bool)

(assert (=> b!826925 m!769753))

(declare-fun m!769755 () Bool)

(assert (=> b!826925 m!769755))

(assert (=> b!826925 m!769733))

(declare-fun m!769757 () Bool)

(assert (=> bm!35940 m!769757))

(declare-fun m!769759 () Bool)

(assert (=> b!826917 m!769759))

(declare-fun m!769761 () Bool)

(assert (=> bm!35938 m!769761))

(declare-fun m!769763 () Bool)

(assert (=> bm!35936 m!769763))

(assert (=> b!826916 m!769651))

(assert (=> b!826916 m!769651))

(declare-fun m!769765 () Bool)

(assert (=> b!826916 m!769765))

(assert (=> bm!35934 m!769531))

(assert (=> b!826933 m!769651))

(assert (=> b!826933 m!769651))

(assert (=> b!826933 m!769661))

(assert (=> d!105327 m!769535))

(declare-fun m!769767 () Bool)

(assert (=> b!826923 m!769767))

(assert (=> b!826931 m!769651))

(assert (=> b!826931 m!769651))

(assert (=> b!826931 m!769661))

(declare-fun m!769769 () Bool)

(assert (=> b!826936 m!769769))

(assert (=> b!826921 m!769653))

(assert (=> b!826921 m!769657))

(assert (=> b!826921 m!769657))

(assert (=> b!826921 m!769653))

(assert (=> b!826921 m!769659))

(assert (=> b!826921 m!769651))

(declare-fun m!769771 () Bool)

(assert (=> b!826921 m!769771))

(assert (=> b!826921 m!769651))

(assert (=> b!826733 d!105327))

(declare-fun d!105329 () Bool)

(assert (=> d!105329 (= (+!1935 lt!373580 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1935 (+!1935 lt!373580 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!373775 () Unit!28326)

(declare-fun choose!1412 (ListLongMap!8745 (_ BitVec 64) V!25003 V!25003) Unit!28326)

(assert (=> d!105329 (= lt!373775 (choose!1412 lt!373580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!105329 (= (addSameAsAddTwiceSameKeyDiffValues!220 lt!373580 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!373775)))

(declare-fun bs!23086 () Bool)

(assert (= bs!23086 d!105329))

(declare-fun m!769773 () Bool)

(assert (=> bs!23086 m!769773))

(declare-fun m!769775 () Bool)

(assert (=> bs!23086 m!769775))

(assert (=> bs!23086 m!769775))

(declare-fun m!769777 () Bool)

(assert (=> bs!23086 m!769777))

(declare-fun m!769779 () Bool)

(assert (=> bs!23086 m!769779))

(assert (=> b!826733 d!105329))

(declare-fun d!105331 () Bool)

(declare-fun e!460472 () Bool)

(assert (=> d!105331 e!460472))

(declare-fun res!563434 () Bool)

(assert (=> d!105331 (=> (not res!563434) (not e!460472))))

(declare-fun lt!373778 () ListLongMap!8745)

(assert (=> d!105331 (= res!563434 (contains!4157 lt!373778 (_1!4971 lt!373570)))))

(declare-fun lt!373776 () List!15701)

(assert (=> d!105331 (= lt!373778 (ListLongMap!8746 lt!373776))))

(declare-fun lt!373777 () Unit!28326)

(declare-fun lt!373779 () Unit!28326)

(assert (=> d!105331 (= lt!373777 lt!373779)))

(assert (=> d!105331 (= (getValueByKey!407 lt!373776 (_1!4971 lt!373570)) (Some!412 (_2!4971 lt!373570)))))

(assert (=> d!105331 (= lt!373779 (lemmaContainsTupThenGetReturnValue!221 lt!373776 (_1!4971 lt!373570) (_2!4971 lt!373570)))))

(assert (=> d!105331 (= lt!373776 (insertStrictlySorted!260 (toList!4388 lt!373577) (_1!4971 lt!373570) (_2!4971 lt!373570)))))

(assert (=> d!105331 (= (+!1935 lt!373577 lt!373570) lt!373778)))

(declare-fun b!826937 () Bool)

(declare-fun res!563433 () Bool)

(assert (=> b!826937 (=> (not res!563433) (not e!460472))))

(assert (=> b!826937 (= res!563433 (= (getValueByKey!407 (toList!4388 lt!373778) (_1!4971 lt!373570)) (Some!412 (_2!4971 lt!373570))))))

(declare-fun b!826938 () Bool)

(assert (=> b!826938 (= e!460472 (contains!4159 (toList!4388 lt!373778) lt!373570))))

(assert (= (and d!105331 res!563434) b!826937))

(assert (= (and b!826937 res!563433) b!826938))

(declare-fun m!769781 () Bool)

(assert (=> d!105331 m!769781))

(declare-fun m!769783 () Bool)

(assert (=> d!105331 m!769783))

(declare-fun m!769785 () Bool)

(assert (=> d!105331 m!769785))

(declare-fun m!769787 () Bool)

(assert (=> d!105331 m!769787))

(declare-fun m!769789 () Bool)

(assert (=> b!826937 m!769789))

(declare-fun m!769791 () Bool)

(assert (=> b!826938 m!769791))

(assert (=> b!826733 d!105331))

(declare-fun d!105333 () Bool)

(declare-fun e!460473 () Bool)

(assert (=> d!105333 e!460473))

(declare-fun res!563436 () Bool)

(assert (=> d!105333 (=> (not res!563436) (not e!460473))))

(declare-fun lt!373782 () ListLongMap!8745)

(assert (=> d!105333 (= res!563436 (contains!4157 lt!373782 (_1!4971 lt!373570)))))

(declare-fun lt!373780 () List!15701)

(assert (=> d!105333 (= lt!373782 (ListLongMap!8746 lt!373780))))

(declare-fun lt!373781 () Unit!28326)

(declare-fun lt!373783 () Unit!28326)

(assert (=> d!105333 (= lt!373781 lt!373783)))

(assert (=> d!105333 (= (getValueByKey!407 lt!373780 (_1!4971 lt!373570)) (Some!412 (_2!4971 lt!373570)))))

(assert (=> d!105333 (= lt!373783 (lemmaContainsTupThenGetReturnValue!221 lt!373780 (_1!4971 lt!373570) (_2!4971 lt!373570)))))

(assert (=> d!105333 (= lt!373780 (insertStrictlySorted!260 (toList!4388 lt!373580) (_1!4971 lt!373570) (_2!4971 lt!373570)))))

(assert (=> d!105333 (= (+!1935 lt!373580 lt!373570) lt!373782)))

(declare-fun b!826939 () Bool)

(declare-fun res!563435 () Bool)

(assert (=> b!826939 (=> (not res!563435) (not e!460473))))

(assert (=> b!826939 (= res!563435 (= (getValueByKey!407 (toList!4388 lt!373782) (_1!4971 lt!373570)) (Some!412 (_2!4971 lt!373570))))))

(declare-fun b!826940 () Bool)

(assert (=> b!826940 (= e!460473 (contains!4159 (toList!4388 lt!373782) lt!373570))))

(assert (= (and d!105333 res!563436) b!826939))

(assert (= (and b!826939 res!563435) b!826940))

(declare-fun m!769793 () Bool)

(assert (=> d!105333 m!769793))

(declare-fun m!769795 () Bool)

(assert (=> d!105333 m!769795))

(declare-fun m!769797 () Bool)

(assert (=> d!105333 m!769797))

(declare-fun m!769799 () Bool)

(assert (=> d!105333 m!769799))

(declare-fun m!769801 () Bool)

(assert (=> b!826939 m!769801))

(declare-fun m!769803 () Bool)

(assert (=> b!826940 m!769803))

(assert (=> b!826733 d!105333))

(declare-fun d!105335 () Bool)

(declare-fun e!460474 () Bool)

(assert (=> d!105335 e!460474))

(declare-fun res!563438 () Bool)

(assert (=> d!105335 (=> (not res!563438) (not e!460474))))

(declare-fun lt!373786 () ListLongMap!8745)

(assert (=> d!105335 (= res!563438 (contains!4157 lt!373786 (_1!4971 lt!373572)))))

(declare-fun lt!373784 () List!15701)

(assert (=> d!105335 (= lt!373786 (ListLongMap!8746 lt!373784))))

(declare-fun lt!373785 () Unit!28326)

(declare-fun lt!373787 () Unit!28326)

(assert (=> d!105335 (= lt!373785 lt!373787)))

(assert (=> d!105335 (= (getValueByKey!407 lt!373784 (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572)))))

(assert (=> d!105335 (= lt!373787 (lemmaContainsTupThenGetReturnValue!221 lt!373784 (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105335 (= lt!373784 (insertStrictlySorted!260 (toList!4388 (+!1935 lt!373577 lt!373578)) (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105335 (= (+!1935 (+!1935 lt!373577 lt!373578) lt!373572) lt!373786)))

(declare-fun b!826941 () Bool)

(declare-fun res!563437 () Bool)

(assert (=> b!826941 (=> (not res!563437) (not e!460474))))

(assert (=> b!826941 (= res!563437 (= (getValueByKey!407 (toList!4388 lt!373786) (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572))))))

(declare-fun b!826942 () Bool)

(assert (=> b!826942 (= e!460474 (contains!4159 (toList!4388 lt!373786) lt!373572))))

(assert (= (and d!105335 res!563438) b!826941))

(assert (= (and b!826941 res!563437) b!826942))

(declare-fun m!769805 () Bool)

(assert (=> d!105335 m!769805))

(declare-fun m!769807 () Bool)

(assert (=> d!105335 m!769807))

(declare-fun m!769809 () Bool)

(assert (=> d!105335 m!769809))

(declare-fun m!769811 () Bool)

(assert (=> d!105335 m!769811))

(declare-fun m!769813 () Bool)

(assert (=> b!826941 m!769813))

(declare-fun m!769815 () Bool)

(assert (=> b!826942 m!769815))

(assert (=> b!826733 d!105335))

(declare-fun d!105337 () Bool)

(declare-fun e!460475 () Bool)

(assert (=> d!105337 e!460475))

(declare-fun res!563440 () Bool)

(assert (=> d!105337 (=> (not res!563440) (not e!460475))))

(declare-fun lt!373790 () ListLongMap!8745)

(assert (=> d!105337 (= res!563440 (contains!4157 lt!373790 (_1!4971 lt!373578)))))

(declare-fun lt!373788 () List!15701)

(assert (=> d!105337 (= lt!373790 (ListLongMap!8746 lt!373788))))

(declare-fun lt!373789 () Unit!28326)

(declare-fun lt!373791 () Unit!28326)

(assert (=> d!105337 (= lt!373789 lt!373791)))

(assert (=> d!105337 (= (getValueByKey!407 lt!373788 (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578)))))

(assert (=> d!105337 (= lt!373791 (lemmaContainsTupThenGetReturnValue!221 lt!373788 (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105337 (= lt!373788 (insertStrictlySorted!260 (toList!4388 lt!373577) (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105337 (= (+!1935 lt!373577 lt!373578) lt!373790)))

(declare-fun b!826943 () Bool)

(declare-fun res!563439 () Bool)

(assert (=> b!826943 (=> (not res!563439) (not e!460475))))

(assert (=> b!826943 (= res!563439 (= (getValueByKey!407 (toList!4388 lt!373790) (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578))))))

(declare-fun b!826944 () Bool)

(assert (=> b!826944 (= e!460475 (contains!4159 (toList!4388 lt!373790) lt!373578))))

(assert (= (and d!105337 res!563440) b!826943))

(assert (= (and b!826943 res!563439) b!826944))

(declare-fun m!769817 () Bool)

(assert (=> d!105337 m!769817))

(declare-fun m!769819 () Bool)

(assert (=> d!105337 m!769819))

(declare-fun m!769821 () Bool)

(assert (=> d!105337 m!769821))

(declare-fun m!769823 () Bool)

(assert (=> d!105337 m!769823))

(declare-fun m!769825 () Bool)

(assert (=> b!826943 m!769825))

(declare-fun m!769827 () Bool)

(assert (=> b!826944 m!769827))

(assert (=> b!826733 d!105337))

(declare-fun b!826945 () Bool)

(declare-fun e!460485 () Bool)

(declare-fun e!460476 () Bool)

(assert (=> b!826945 (= e!460485 e!460476)))

(declare-fun res!563441 () Bool)

(assert (=> b!826945 (=> (not res!563441) (not e!460476))))

(declare-fun lt!373803 () ListLongMap!8745)

(assert (=> b!826945 (= res!563441 (contains!4157 lt!373803 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!826945 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826946 () Bool)

(declare-fun e!460487 () Bool)

(assert (=> b!826946 (= e!460487 (= (apply!362 lt!373803 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!826947 () Bool)

(declare-fun e!460483 () Bool)

(declare-fun call!35948 () Bool)

(assert (=> b!826947 (= e!460483 (not call!35948))))

(declare-fun b!826948 () Bool)

(declare-fun e!460481 () Unit!28326)

(declare-fun Unit!28331 () Unit!28326)

(assert (=> b!826948 (= e!460481 Unit!28331)))

(declare-fun bm!35941 () Bool)

(declare-fun call!35944 () ListLongMap!8745)

(assert (=> bm!35941 (= call!35944 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun d!105339 () Bool)

(declare-fun e!460480 () Bool)

(assert (=> d!105339 e!460480))

(declare-fun res!563447 () Bool)

(assert (=> d!105339 (=> (not res!563447) (not e!460480))))

(assert (=> d!105339 (= res!563447 (or (bvsge #b00000000000000000000000000000000 (size!22555 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))))

(declare-fun lt!373800 () ListLongMap!8745)

(assert (=> d!105339 (= lt!373803 lt!373800)))

(declare-fun lt!373804 () Unit!28326)

(assert (=> d!105339 (= lt!373804 e!460481)))

(declare-fun c!89745 () Bool)

(declare-fun e!460477 () Bool)

(assert (=> d!105339 (= c!89745 e!460477)))

(declare-fun res!563443 () Bool)

(assert (=> d!105339 (=> (not res!563443) (not e!460477))))

(assert (=> d!105339 (= res!563443 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun e!460479 () ListLongMap!8745)

(assert (=> d!105339 (= lt!373800 e!460479)))

(declare-fun c!89747 () Bool)

(assert (=> d!105339 (= c!89747 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105339 (validMask!0 mask!1312)))

(assert (=> d!105339 (= (getCurrentListMap!2511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!373803)))

(declare-fun b!826949 () Bool)

(declare-fun res!563442 () Bool)

(assert (=> b!826949 (=> (not res!563442) (not e!460480))))

(assert (=> b!826949 (= res!563442 e!460485)))

(declare-fun res!563444 () Bool)

(assert (=> b!826949 (=> res!563444 e!460485)))

(declare-fun e!460486 () Bool)

(assert (=> b!826949 (= res!563444 (not e!460486))))

(declare-fun res!563445 () Bool)

(assert (=> b!826949 (=> (not res!563445) (not e!460486))))

(assert (=> b!826949 (= res!563445 (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826950 () Bool)

(assert (=> b!826950 (= e!460476 (= (apply!362 lt!373803 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)) (get!11742 (select (arr!22134 _values!788) #b00000000000000000000000000000000) (dynLambda!970 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!826950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22554 _values!788)))))

(assert (=> b!826950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(declare-fun b!826951 () Bool)

(assert (=> b!826951 (= e!460483 e!460487)))

(declare-fun res!563446 () Bool)

(assert (=> b!826951 (= res!563446 call!35948)))

(assert (=> b!826951 (=> (not res!563446) (not e!460487))))

(declare-fun b!826952 () Bool)

(declare-fun call!35949 () ListLongMap!8745)

(assert (=> b!826952 (= e!460479 (+!1935 call!35949 (tuple2!9921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35942 () Bool)

(declare-fun call!35950 () ListLongMap!8745)

(assert (=> bm!35942 (= call!35950 call!35944)))

(declare-fun bm!35943 () Bool)

(declare-fun call!35946 () Bool)

(assert (=> bm!35943 (= call!35946 (contains!4157 lt!373803 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826953 () Bool)

(declare-fun e!460484 () ListLongMap!8745)

(assert (=> b!826953 (= e!460479 e!460484)))

(declare-fun c!89749 () Bool)

(assert (=> b!826953 (= c!89749 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35944 () Bool)

(declare-fun call!35945 () ListLongMap!8745)

(assert (=> bm!35944 (= call!35945 call!35950)))

(declare-fun b!826954 () Bool)

(declare-fun lt!373807 () Unit!28326)

(assert (=> b!826954 (= e!460481 lt!373807)))

(declare-fun lt!373796 () ListLongMap!8745)

(assert (=> b!826954 (= lt!373796 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373794 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373794 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373813 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373813 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373806 () Unit!28326)

(assert (=> b!826954 (= lt!373806 (addStillContains!314 lt!373796 lt!373794 zeroValueBefore!34 lt!373813))))

(assert (=> b!826954 (contains!4157 (+!1935 lt!373796 (tuple2!9921 lt!373794 zeroValueBefore!34)) lt!373813)))

(declare-fun lt!373797 () Unit!28326)

(assert (=> b!826954 (= lt!373797 lt!373806)))

(declare-fun lt!373805 () ListLongMap!8745)

(assert (=> b!826954 (= lt!373805 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373808 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373808 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373799 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373799 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373810 () Unit!28326)

(assert (=> b!826954 (= lt!373810 (addApplyDifferent!314 lt!373805 lt!373808 minValue!754 lt!373799))))

(assert (=> b!826954 (= (apply!362 (+!1935 lt!373805 (tuple2!9921 lt!373808 minValue!754)) lt!373799) (apply!362 lt!373805 lt!373799))))

(declare-fun lt!373793 () Unit!28326)

(assert (=> b!826954 (= lt!373793 lt!373810)))

(declare-fun lt!373801 () ListLongMap!8745)

(assert (=> b!826954 (= lt!373801 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373792 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373792 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373809 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373809 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373795 () Unit!28326)

(assert (=> b!826954 (= lt!373795 (addApplyDifferent!314 lt!373801 lt!373792 zeroValueBefore!34 lt!373809))))

(assert (=> b!826954 (= (apply!362 (+!1935 lt!373801 (tuple2!9921 lt!373792 zeroValueBefore!34)) lt!373809) (apply!362 lt!373801 lt!373809))))

(declare-fun lt!373798 () Unit!28326)

(assert (=> b!826954 (= lt!373798 lt!373795)))

(declare-fun lt!373802 () ListLongMap!8745)

(assert (=> b!826954 (= lt!373802 (getCurrentListMapNoExtraKeys!2467 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!373811 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373811 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!373812 () (_ BitVec 64))

(assert (=> b!826954 (= lt!373812 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!826954 (= lt!373807 (addApplyDifferent!314 lt!373802 lt!373811 minValue!754 lt!373812))))

(assert (=> b!826954 (= (apply!362 (+!1935 lt!373802 (tuple2!9921 lt!373811 minValue!754)) lt!373812) (apply!362 lt!373802 lt!373812))))

(declare-fun b!826955 () Bool)

(declare-fun e!460482 () Bool)

(assert (=> b!826955 (= e!460482 (not call!35946))))

(declare-fun b!826956 () Bool)

(declare-fun e!460478 () ListLongMap!8745)

(declare-fun call!35947 () ListLongMap!8745)

(assert (=> b!826956 (= e!460478 call!35947)))

(declare-fun b!826957 () Bool)

(declare-fun e!460488 () Bool)

(assert (=> b!826957 (= e!460482 e!460488)))

(declare-fun res!563449 () Bool)

(assert (=> b!826957 (= res!563449 call!35946)))

(assert (=> b!826957 (=> (not res!563449) (not e!460488))))

(declare-fun bm!35945 () Bool)

(assert (=> bm!35945 (= call!35949 (+!1935 (ite c!89747 call!35944 (ite c!89749 call!35950 call!35945)) (ite (or c!89747 c!89749) (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!826958 () Bool)

(assert (=> b!826958 (= e!460484 call!35947)))

(declare-fun bm!35946 () Bool)

(assert (=> bm!35946 (= call!35947 call!35949)))

(declare-fun b!826959 () Bool)

(assert (=> b!826959 (= e!460478 call!35945)))

(declare-fun b!826960 () Bool)

(assert (=> b!826960 (= e!460486 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826961 () Bool)

(declare-fun c!89748 () Bool)

(assert (=> b!826961 (= c!89748 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826961 (= e!460484 e!460478)))

(declare-fun b!826962 () Bool)

(assert (=> b!826962 (= e!460477 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826963 () Bool)

(assert (=> b!826963 (= e!460480 e!460482)))

(declare-fun c!89750 () Bool)

(assert (=> b!826963 (= c!89750 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!826964 () Bool)

(declare-fun res!563448 () Bool)

(assert (=> b!826964 (=> (not res!563448) (not e!460480))))

(assert (=> b!826964 (= res!563448 e!460483)))

(declare-fun c!89746 () Bool)

(assert (=> b!826964 (= c!89746 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!35947 () Bool)

(assert (=> bm!35947 (= call!35948 (contains!4157 lt!373803 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!826965 () Bool)

(assert (=> b!826965 (= e!460488 (= (apply!362 lt!373803 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(assert (= (and d!105339 c!89747) b!826952))

(assert (= (and d!105339 (not c!89747)) b!826953))

(assert (= (and b!826953 c!89749) b!826958))

(assert (= (and b!826953 (not c!89749)) b!826961))

(assert (= (and b!826961 c!89748) b!826956))

(assert (= (and b!826961 (not c!89748)) b!826959))

(assert (= (or b!826956 b!826959) bm!35944))

(assert (= (or b!826958 bm!35944) bm!35942))

(assert (= (or b!826958 b!826956) bm!35946))

(assert (= (or b!826952 bm!35942) bm!35941))

(assert (= (or b!826952 bm!35946) bm!35945))

(assert (= (and d!105339 res!563443) b!826962))

(assert (= (and d!105339 c!89745) b!826954))

(assert (= (and d!105339 (not c!89745)) b!826948))

(assert (= (and d!105339 res!563447) b!826949))

(assert (= (and b!826949 res!563445) b!826960))

(assert (= (and b!826949 (not res!563444)) b!826945))

(assert (= (and b!826945 res!563441) b!826950))

(assert (= (and b!826949 res!563442) b!826964))

(assert (= (and b!826964 c!89746) b!826951))

(assert (= (and b!826964 (not c!89746)) b!826947))

(assert (= (and b!826951 res!563446) b!826946))

(assert (= (or b!826951 b!826947) bm!35947))

(assert (= (and b!826964 res!563448) b!826963))

(assert (= (and b!826963 c!89750) b!826957))

(assert (= (and b!826963 (not c!89750)) b!826955))

(assert (= (and b!826957 res!563449) b!826965))

(assert (= (or b!826957 b!826955) bm!35943))

(declare-fun b_lambda!11139 () Bool)

(assert (=> (not b_lambda!11139) (not b!826950)))

(assert (=> b!826950 t!22043))

(declare-fun b_and!22231 () Bool)

(assert (= b_and!22229 (and (=> t!22043 result!7947) b_and!22231)))

(declare-fun m!769829 () Bool)

(assert (=> b!826954 m!769829))

(declare-fun m!769831 () Bool)

(assert (=> b!826954 m!769831))

(declare-fun m!769833 () Bool)

(assert (=> b!826954 m!769833))

(declare-fun m!769835 () Bool)

(assert (=> b!826954 m!769835))

(declare-fun m!769837 () Bool)

(assert (=> b!826954 m!769837))

(declare-fun m!769839 () Bool)

(assert (=> b!826954 m!769839))

(declare-fun m!769841 () Bool)

(assert (=> b!826954 m!769841))

(declare-fun m!769843 () Bool)

(assert (=> b!826954 m!769843))

(declare-fun m!769845 () Bool)

(assert (=> b!826954 m!769845))

(declare-fun m!769847 () Bool)

(assert (=> b!826954 m!769847))

(declare-fun m!769849 () Bool)

(assert (=> b!826954 m!769849))

(declare-fun m!769851 () Bool)

(assert (=> b!826954 m!769851))

(assert (=> b!826954 m!769829))

(assert (=> b!826954 m!769841))

(assert (=> b!826954 m!769533))

(assert (=> b!826954 m!769839))

(declare-fun m!769853 () Bool)

(assert (=> b!826954 m!769853))

(assert (=> b!826954 m!769651))

(declare-fun m!769855 () Bool)

(assert (=> b!826954 m!769855))

(declare-fun m!769857 () Bool)

(assert (=> b!826954 m!769857))

(assert (=> b!826954 m!769835))

(declare-fun m!769859 () Bool)

(assert (=> bm!35947 m!769859))

(declare-fun m!769861 () Bool)

(assert (=> b!826946 m!769861))

(declare-fun m!769863 () Bool)

(assert (=> bm!35945 m!769863))

(declare-fun m!769865 () Bool)

(assert (=> bm!35943 m!769865))

(assert (=> b!826945 m!769651))

(assert (=> b!826945 m!769651))

(declare-fun m!769867 () Bool)

(assert (=> b!826945 m!769867))

(assert (=> bm!35941 m!769533))

(assert (=> b!826962 m!769651))

(assert (=> b!826962 m!769651))

(assert (=> b!826962 m!769661))

(assert (=> d!105339 m!769535))

(declare-fun m!769869 () Bool)

(assert (=> b!826952 m!769869))

(assert (=> b!826960 m!769651))

(assert (=> b!826960 m!769651))

(assert (=> b!826960 m!769661))

(declare-fun m!769871 () Bool)

(assert (=> b!826965 m!769871))

(assert (=> b!826950 m!769653))

(assert (=> b!826950 m!769657))

(assert (=> b!826950 m!769657))

(assert (=> b!826950 m!769653))

(assert (=> b!826950 m!769659))

(assert (=> b!826950 m!769651))

(declare-fun m!769873 () Bool)

(assert (=> b!826950 m!769873))

(assert (=> b!826950 m!769651))

(assert (=> b!826733 d!105339))

(declare-fun d!105341 () Bool)

(declare-fun e!460489 () Bool)

(assert (=> d!105341 e!460489))

(declare-fun res!563451 () Bool)

(assert (=> d!105341 (=> (not res!563451) (not e!460489))))

(declare-fun lt!373816 () ListLongMap!8745)

(assert (=> d!105341 (= res!563451 (contains!4157 lt!373816 (_1!4971 lt!373572)))))

(declare-fun lt!373814 () List!15701)

(assert (=> d!105341 (= lt!373816 (ListLongMap!8746 lt!373814))))

(declare-fun lt!373815 () Unit!28326)

(declare-fun lt!373817 () Unit!28326)

(assert (=> d!105341 (= lt!373815 lt!373817)))

(assert (=> d!105341 (= (getValueByKey!407 lt!373814 (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572)))))

(assert (=> d!105341 (= lt!373817 (lemmaContainsTupThenGetReturnValue!221 lt!373814 (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105341 (= lt!373814 (insertStrictlySorted!260 (toList!4388 (+!1935 lt!373577 lt!373570)) (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105341 (= (+!1935 (+!1935 lt!373577 lt!373570) lt!373572) lt!373816)))

(declare-fun b!826966 () Bool)

(declare-fun res!563450 () Bool)

(assert (=> b!826966 (=> (not res!563450) (not e!460489))))

(assert (=> b!826966 (= res!563450 (= (getValueByKey!407 (toList!4388 lt!373816) (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572))))))

(declare-fun b!826967 () Bool)

(assert (=> b!826967 (= e!460489 (contains!4159 (toList!4388 lt!373816) lt!373572))))

(assert (= (and d!105341 res!563451) b!826966))

(assert (= (and b!826966 res!563450) b!826967))

(declare-fun m!769875 () Bool)

(assert (=> d!105341 m!769875))

(declare-fun m!769877 () Bool)

(assert (=> d!105341 m!769877))

(declare-fun m!769879 () Bool)

(assert (=> d!105341 m!769879))

(declare-fun m!769881 () Bool)

(assert (=> d!105341 m!769881))

(declare-fun m!769883 () Bool)

(assert (=> b!826966 m!769883))

(declare-fun m!769885 () Bool)

(assert (=> b!826967 m!769885))

(assert (=> b!826733 d!105341))

(declare-fun d!105343 () Bool)

(declare-fun e!460490 () Bool)

(assert (=> d!105343 e!460490))

(declare-fun res!563453 () Bool)

(assert (=> d!105343 (=> (not res!563453) (not e!460490))))

(declare-fun lt!373820 () ListLongMap!8745)

(assert (=> d!105343 (= res!563453 (contains!4157 lt!373820 (_1!4971 lt!373578)))))

(declare-fun lt!373818 () List!15701)

(assert (=> d!105343 (= lt!373820 (ListLongMap!8746 lt!373818))))

(declare-fun lt!373819 () Unit!28326)

(declare-fun lt!373821 () Unit!28326)

(assert (=> d!105343 (= lt!373819 lt!373821)))

(assert (=> d!105343 (= (getValueByKey!407 lt!373818 (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578)))))

(assert (=> d!105343 (= lt!373821 (lemmaContainsTupThenGetReturnValue!221 lt!373818 (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105343 (= lt!373818 (insertStrictlySorted!260 (toList!4388 lt!373580) (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105343 (= (+!1935 lt!373580 lt!373578) lt!373820)))

(declare-fun b!826968 () Bool)

(declare-fun res!563452 () Bool)

(assert (=> b!826968 (=> (not res!563452) (not e!460490))))

(assert (=> b!826968 (= res!563452 (= (getValueByKey!407 (toList!4388 lt!373820) (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578))))))

(declare-fun b!826969 () Bool)

(assert (=> b!826969 (= e!460490 (contains!4159 (toList!4388 lt!373820) lt!373578))))

(assert (= (and d!105343 res!563453) b!826968))

(assert (= (and b!826968 res!563452) b!826969))

(declare-fun m!769887 () Bool)

(assert (=> d!105343 m!769887))

(declare-fun m!769889 () Bool)

(assert (=> d!105343 m!769889))

(declare-fun m!769891 () Bool)

(assert (=> d!105343 m!769891))

(declare-fun m!769893 () Bool)

(assert (=> d!105343 m!769893))

(declare-fun m!769895 () Bool)

(assert (=> b!826968 m!769895))

(declare-fun m!769897 () Bool)

(assert (=> b!826969 m!769897))

(assert (=> b!826733 d!105343))

(declare-fun d!105345 () Bool)

(assert (=> d!105345 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71270 d!105345))

(declare-fun d!105347 () Bool)

(assert (=> d!105347 (= (array_inv!17685 _keys!976) (bvsge (size!22555 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71270 d!105347))

(declare-fun d!105349 () Bool)

(assert (=> d!105349 (= (array_inv!17686 _values!788) (bvsge (size!22554 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71270 d!105349))

(declare-fun d!105351 () Bool)

(declare-fun res!563459 () Bool)

(declare-fun e!460498 () Bool)

(assert (=> d!105351 (=> res!563459 e!460498)))

(assert (=> d!105351 (= res!563459 (bvsge #b00000000000000000000000000000000 (size!22555 _keys!976)))))

(assert (=> d!105351 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!460498)))

(declare-fun b!826978 () Bool)

(declare-fun e!460499 () Bool)

(assert (=> b!826978 (= e!460498 e!460499)))

(declare-fun c!89753 () Bool)

(assert (=> b!826978 (= c!89753 (validKeyInArray!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826979 () Bool)

(declare-fun e!460497 () Bool)

(declare-fun call!35953 () Bool)

(assert (=> b!826979 (= e!460497 call!35953)))

(declare-fun b!826980 () Bool)

(assert (=> b!826980 (= e!460499 call!35953)))

(declare-fun bm!35950 () Bool)

(assert (=> bm!35950 (= call!35953 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun b!826981 () Bool)

(assert (=> b!826981 (= e!460499 e!460497)))

(declare-fun lt!373830 () (_ BitVec 64))

(assert (=> b!826981 (= lt!373830 (select (arr!22135 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!373828 () Unit!28326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46187 (_ BitVec 64) (_ BitVec 32)) Unit!28326)

(assert (=> b!826981 (= lt!373828 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!373830 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!826981 (arrayContainsKey!0 _keys!976 lt!373830 #b00000000000000000000000000000000)))

(declare-fun lt!373829 () Unit!28326)

(assert (=> b!826981 (= lt!373829 lt!373828)))

(declare-fun res!563458 () Bool)

(declare-datatypes ((SeekEntryResult!8685 0))(
  ( (MissingZero!8685 (index!37111 (_ BitVec 32))) (Found!8685 (index!37112 (_ BitVec 32))) (Intermediate!8685 (undefined!9497 Bool) (index!37113 (_ BitVec 32)) (x!69682 (_ BitVec 32))) (Undefined!8685) (MissingVacant!8685 (index!37114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46187 (_ BitVec 32)) SeekEntryResult!8685)

(assert (=> b!826981 (= res!563458 (= (seekEntryOrOpen!0 (select (arr!22135 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8685 #b00000000000000000000000000000000)))))

(assert (=> b!826981 (=> (not res!563458) (not e!460497))))

(assert (= (and d!105351 (not res!563459)) b!826978))

(assert (= (and b!826978 c!89753) b!826981))

(assert (= (and b!826978 (not c!89753)) b!826980))

(assert (= (and b!826981 res!563458) b!826979))

(assert (= (or b!826979 b!826980) bm!35950))

(assert (=> b!826978 m!769651))

(assert (=> b!826978 m!769651))

(assert (=> b!826978 m!769661))

(declare-fun m!769899 () Bool)

(assert (=> bm!35950 m!769899))

(assert (=> b!826981 m!769651))

(declare-fun m!769901 () Bool)

(assert (=> b!826981 m!769901))

(declare-fun m!769903 () Bool)

(assert (=> b!826981 m!769903))

(assert (=> b!826981 m!769651))

(declare-fun m!769905 () Bool)

(assert (=> b!826981 m!769905))

(assert (=> b!826727 d!105351))

(declare-fun d!105353 () Bool)

(declare-fun e!460500 () Bool)

(assert (=> d!105353 e!460500))

(declare-fun res!563461 () Bool)

(assert (=> d!105353 (=> (not res!563461) (not e!460500))))

(declare-fun lt!373833 () ListLongMap!8745)

(assert (=> d!105353 (= res!563461 (contains!4157 lt!373833 (_1!4971 lt!373572)))))

(declare-fun lt!373831 () List!15701)

(assert (=> d!105353 (= lt!373833 (ListLongMap!8746 lt!373831))))

(declare-fun lt!373832 () Unit!28326)

(declare-fun lt!373834 () Unit!28326)

(assert (=> d!105353 (= lt!373832 lt!373834)))

(assert (=> d!105353 (= (getValueByKey!407 lt!373831 (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572)))))

(assert (=> d!105353 (= lt!373834 (lemmaContainsTupThenGetReturnValue!221 lt!373831 (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105353 (= lt!373831 (insertStrictlySorted!260 (toList!4388 (+!1935 lt!373581 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105353 (= (+!1935 (+!1935 lt!373581 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373572) lt!373833)))

(declare-fun b!826982 () Bool)

(declare-fun res!563460 () Bool)

(assert (=> b!826982 (=> (not res!563460) (not e!460500))))

(assert (=> b!826982 (= res!563460 (= (getValueByKey!407 (toList!4388 lt!373833) (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572))))))

(declare-fun b!826983 () Bool)

(assert (=> b!826983 (= e!460500 (contains!4159 (toList!4388 lt!373833) lt!373572))))

(assert (= (and d!105353 res!563461) b!826982))

(assert (= (and b!826982 res!563460) b!826983))

(declare-fun m!769907 () Bool)

(assert (=> d!105353 m!769907))

(declare-fun m!769909 () Bool)

(assert (=> d!105353 m!769909))

(declare-fun m!769911 () Bool)

(assert (=> d!105353 m!769911))

(declare-fun m!769913 () Bool)

(assert (=> d!105353 m!769913))

(declare-fun m!769915 () Bool)

(assert (=> b!826982 m!769915))

(declare-fun m!769917 () Bool)

(assert (=> b!826983 m!769917))

(assert (=> b!826731 d!105353))

(declare-fun d!105355 () Bool)

(declare-fun e!460501 () Bool)

(assert (=> d!105355 e!460501))

(declare-fun res!563463 () Bool)

(assert (=> d!105355 (=> (not res!563463) (not e!460501))))

(declare-fun lt!373837 () ListLongMap!8745)

(assert (=> d!105355 (= res!563463 (contains!4157 lt!373837 (_1!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!373835 () List!15701)

(assert (=> d!105355 (= lt!373837 (ListLongMap!8746 lt!373835))))

(declare-fun lt!373836 () Unit!28326)

(declare-fun lt!373838 () Unit!28326)

(assert (=> d!105355 (= lt!373836 lt!373838)))

(assert (=> d!105355 (= (getValueByKey!407 lt!373835 (_1!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!412 (_2!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105355 (= lt!373838 (lemmaContainsTupThenGetReturnValue!221 lt!373835 (_1!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105355 (= lt!373835 (insertStrictlySorted!260 (toList!4388 lt!373581) (_1!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105355 (= (+!1935 lt!373581 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373837)))

(declare-fun b!826984 () Bool)

(declare-fun res!563462 () Bool)

(assert (=> b!826984 (=> (not res!563462) (not e!460501))))

(assert (=> b!826984 (= res!563462 (= (getValueByKey!407 (toList!4388 lt!373837) (_1!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!412 (_2!4971 (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!826985 () Bool)

(assert (=> b!826985 (= e!460501 (contains!4159 (toList!4388 lt!373837) (tuple2!9921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105355 res!563463) b!826984))

(assert (= (and b!826984 res!563462) b!826985))

(declare-fun m!769919 () Bool)

(assert (=> d!105355 m!769919))

(declare-fun m!769921 () Bool)

(assert (=> d!105355 m!769921))

(declare-fun m!769923 () Bool)

(assert (=> d!105355 m!769923))

(declare-fun m!769925 () Bool)

(assert (=> d!105355 m!769925))

(declare-fun m!769927 () Bool)

(assert (=> b!826984 m!769927))

(declare-fun m!769929 () Bool)

(assert (=> b!826985 m!769929))

(assert (=> b!826731 d!105355))

(declare-fun d!105357 () Bool)

(declare-fun e!460502 () Bool)

(assert (=> d!105357 e!460502))

(declare-fun res!563465 () Bool)

(assert (=> d!105357 (=> (not res!563465) (not e!460502))))

(declare-fun lt!373841 () ListLongMap!8745)

(assert (=> d!105357 (= res!563465 (contains!4157 lt!373841 (_1!4971 lt!373578)))))

(declare-fun lt!373839 () List!15701)

(assert (=> d!105357 (= lt!373841 (ListLongMap!8746 lt!373839))))

(declare-fun lt!373840 () Unit!28326)

(declare-fun lt!373842 () Unit!28326)

(assert (=> d!105357 (= lt!373840 lt!373842)))

(assert (=> d!105357 (= (getValueByKey!407 lt!373839 (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578)))))

(assert (=> d!105357 (= lt!373842 (lemmaContainsTupThenGetReturnValue!221 lt!373839 (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105357 (= lt!373839 (insertStrictlySorted!260 (toList!4388 (+!1935 lt!373581 lt!373572)) (_1!4971 lt!373578) (_2!4971 lt!373578)))))

(assert (=> d!105357 (= (+!1935 (+!1935 lt!373581 lt!373572) lt!373578) lt!373841)))

(declare-fun b!826986 () Bool)

(declare-fun res!563464 () Bool)

(assert (=> b!826986 (=> (not res!563464) (not e!460502))))

(assert (=> b!826986 (= res!563464 (= (getValueByKey!407 (toList!4388 lt!373841) (_1!4971 lt!373578)) (Some!412 (_2!4971 lt!373578))))))

(declare-fun b!826987 () Bool)

(assert (=> b!826987 (= e!460502 (contains!4159 (toList!4388 lt!373841) lt!373578))))

(assert (= (and d!105357 res!563465) b!826986))

(assert (= (and b!826986 res!563464) b!826987))

(declare-fun m!769931 () Bool)

(assert (=> d!105357 m!769931))

(declare-fun m!769933 () Bool)

(assert (=> d!105357 m!769933))

(declare-fun m!769935 () Bool)

(assert (=> d!105357 m!769935))

(declare-fun m!769937 () Bool)

(assert (=> d!105357 m!769937))

(declare-fun m!769939 () Bool)

(assert (=> b!826986 m!769939))

(declare-fun m!769941 () Bool)

(assert (=> b!826987 m!769941))

(assert (=> b!826730 d!105357))

(declare-fun d!105359 () Bool)

(declare-fun e!460503 () Bool)

(assert (=> d!105359 e!460503))

(declare-fun res!563467 () Bool)

(assert (=> d!105359 (=> (not res!563467) (not e!460503))))

(declare-fun lt!373845 () ListLongMap!8745)

(assert (=> d!105359 (= res!563467 (contains!4157 lt!373845 (_1!4971 lt!373572)))))

(declare-fun lt!373843 () List!15701)

(assert (=> d!105359 (= lt!373845 (ListLongMap!8746 lt!373843))))

(declare-fun lt!373844 () Unit!28326)

(declare-fun lt!373846 () Unit!28326)

(assert (=> d!105359 (= lt!373844 lt!373846)))

(assert (=> d!105359 (= (getValueByKey!407 lt!373843 (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572)))))

(assert (=> d!105359 (= lt!373846 (lemmaContainsTupThenGetReturnValue!221 lt!373843 (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105359 (= lt!373843 (insertStrictlySorted!260 (toList!4388 lt!373581) (_1!4971 lt!373572) (_2!4971 lt!373572)))))

(assert (=> d!105359 (= (+!1935 lt!373581 lt!373572) lt!373845)))

(declare-fun b!826988 () Bool)

(declare-fun res!563466 () Bool)

(assert (=> b!826988 (=> (not res!563466) (not e!460503))))

(assert (=> b!826988 (= res!563466 (= (getValueByKey!407 (toList!4388 lt!373845) (_1!4971 lt!373572)) (Some!412 (_2!4971 lt!373572))))))

(declare-fun b!826989 () Bool)

(assert (=> b!826989 (= e!460503 (contains!4159 (toList!4388 lt!373845) lt!373572))))

(assert (= (and d!105359 res!563467) b!826988))

(assert (= (and b!826988 res!563466) b!826989))

(declare-fun m!769943 () Bool)

(assert (=> d!105359 m!769943))

(declare-fun m!769945 () Bool)

(assert (=> d!105359 m!769945))

(declare-fun m!769947 () Bool)

(assert (=> d!105359 m!769947))

(declare-fun m!769949 () Bool)

(assert (=> d!105359 m!769949))

(declare-fun m!769951 () Bool)

(assert (=> b!826988 m!769951))

(declare-fun m!769953 () Bool)

(assert (=> b!826989 m!769953))

(assert (=> b!826730 d!105359))

(declare-fun mapNonEmpty!24133 () Bool)

(declare-fun mapRes!24133 () Bool)

(declare-fun tp!46645 () Bool)

(declare-fun e!460509 () Bool)

(assert (=> mapNonEmpty!24133 (= mapRes!24133 (and tp!46645 e!460509))))

(declare-fun mapKey!24133 () (_ BitVec 32))

(declare-fun mapValue!24133 () ValueCell!7085)

(declare-fun mapRest!24133 () (Array (_ BitVec 32) ValueCell!7085))

(assert (=> mapNonEmpty!24133 (= mapRest!24124 (store mapRest!24133 mapKey!24133 mapValue!24133))))

(declare-fun mapIsEmpty!24133 () Bool)

(assert (=> mapIsEmpty!24133 mapRes!24133))

(declare-fun b!826996 () Bool)

(assert (=> b!826996 (= e!460509 tp_is_empty!15001)))

(declare-fun condMapEmpty!24133 () Bool)

(declare-fun mapDefault!24133 () ValueCell!7085)

(assert (=> mapNonEmpty!24124 (= condMapEmpty!24133 (= mapRest!24124 ((as const (Array (_ BitVec 32) ValueCell!7085)) mapDefault!24133)))))

(declare-fun e!460508 () Bool)

(assert (=> mapNonEmpty!24124 (= tp!46630 (and e!460508 mapRes!24133))))

(declare-fun b!826997 () Bool)

(assert (=> b!826997 (= e!460508 tp_is_empty!15001)))

(assert (= (and mapNonEmpty!24124 condMapEmpty!24133) mapIsEmpty!24133))

(assert (= (and mapNonEmpty!24124 (not condMapEmpty!24133)) mapNonEmpty!24133))

(assert (= (and mapNonEmpty!24133 ((_ is ValueCellFull!7085) mapValue!24133)) b!826996))

(assert (= (and mapNonEmpty!24124 ((_ is ValueCellFull!7085) mapDefault!24133)) b!826997))

(declare-fun m!769955 () Bool)

(assert (=> mapNonEmpty!24133 m!769955))

(declare-fun b_lambda!11141 () Bool)

(assert (= b_lambda!11131 (or (and start!71270 b_free!13291) b_lambda!11141)))

(declare-fun b_lambda!11143 () Bool)

(assert (= b_lambda!11137 (or (and start!71270 b_free!13291) b_lambda!11143)))

(declare-fun b_lambda!11145 () Bool)

(assert (= b_lambda!11129 (or (and start!71270 b_free!13291) b_lambda!11145)))

(declare-fun b_lambda!11147 () Bool)

(assert (= b_lambda!11139 (or (and start!71270 b_free!13291) b_lambda!11147)))

(declare-fun b_lambda!11149 () Bool)

(assert (= b_lambda!11133 (or (and start!71270 b_free!13291) b_lambda!11149)))

(declare-fun b_lambda!11151 () Bool)

(assert (= b_lambda!11135 (or (and start!71270 b_free!13291) b_lambda!11151)))

(check-sat (not b!826978) (not b!826985) (not b_lambda!11141) (not b!826862) (not bm!35950) (not b!826941) (not b!826848) (not b!826981) (not b!826836) (not bm!35936) (not b!826988) (not b!826983) (not d!105359) (not b!826925) (not b_lambda!11145) (not b!826835) (not b!826865) (not b_lambda!11149) (not b!826834) (not b!826954) (not bm!35941) (not d!105323) (not b!826986) (not d!105339) (not b!826871) (not b!826936) b_and!22231 (not b!826873) (not d!105341) (not b!826938) (not b!826916) (not b!826952) (not b!826989) (not b_lambda!11147) (not b!826850) (not d!105343) (not b!826984) (not b!826960) (not d!105337) (not b!826849) (not b!826968) (not b!826832) (not bm!35947) (not b!826982) (not b!826933) (not bm!35916) (not b!826830) (not b!826942) (not b_lambda!11151) (not bm!35915) (not b!826962) (not b!826839) (not b!826825) tp_is_empty!15001 (not b!826946) (not mapNonEmpty!24133) (not b!826939) (not bm!35940) (not b!826931) (not b!826950) (not b!826940) (not b!826987) (not b!826945) (not b!826828) (not b_lambda!11143) (not d!105353) (not b!826921) (not d!105325) (not d!105315) (not d!105335) (not d!105355) (not b!826864) (not b!826944) (not b!826870) (not bm!35934) (not bm!35943) (not b_next!13291) (not d!105331) (not d!105357) (not b!826847) (not d!105327) (not b!826917) (not b!826969) (not b!826937) (not b!826943) (not b!826967) (not d!105319) (not d!105329) (not bm!35945) (not bm!35938) (not d!105317) (not b!826966) (not b!826872) (not b!826965) (not bm!35919) (not b!826846) (not b!826842) (not d!105333) (not b!826844) (not b!826923) (not b!826833))
(check-sat b_and!22231 (not b_next!13291))
