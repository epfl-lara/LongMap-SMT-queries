; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42588 () Bool)

(assert start!42588)

(declare-fun b_free!12037 () Bool)

(declare-fun b_next!12037 () Bool)

(assert (=> start!42588 (= b_free!12037 (not b_next!12037))))

(declare-fun tp!42151 () Bool)

(declare-fun b_and!20527 () Bool)

(assert (=> start!42588 (= tp!42151 b_and!20527)))

(declare-fun mapIsEmpty!21916 () Bool)

(declare-fun mapRes!21916 () Bool)

(assert (=> mapIsEmpty!21916 mapRes!21916))

(declare-fun mapNonEmpty!21916 () Bool)

(declare-fun tp!42150 () Bool)

(declare-fun e!279022 () Bool)

(assert (=> mapNonEmpty!21916 (= mapRes!21916 (and tp!42150 e!279022))))

(declare-datatypes ((V!19059 0))(
  ( (V!19060 (val!6777 Int)) )
))
(declare-datatypes ((ValueCell!6389 0))(
  ( (ValueCellFull!6389 (v!9071 V!19059)) (EmptyCell!6389) )
))
(declare-datatypes ((array!30654 0))(
  ( (array!30655 (arr!14744 (Array (_ BitVec 32) ValueCell!6389)) (size!15096 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30654)

(declare-fun mapRest!21916 () (Array (_ BitVec 32) ValueCell!6389))

(declare-fun mapKey!21916 () (_ BitVec 32))

(declare-fun mapValue!21916 () ValueCell!6389)

(assert (=> mapNonEmpty!21916 (= (arr!14744 _values!833) (store mapRest!21916 mapKey!21916 mapValue!21916))))

(declare-fun res!283835 () Bool)

(declare-fun e!279021 () Bool)

(assert (=> start!42588 (=> (not res!283835) (not e!279021))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42588 (= res!283835 (validMask!0 mask!1365))))

(assert (=> start!42588 e!279021))

(declare-fun tp_is_empty!13465 () Bool)

(assert (=> start!42588 tp_is_empty!13465))

(assert (=> start!42588 tp!42151))

(assert (=> start!42588 true))

(declare-datatypes ((array!30656 0))(
  ( (array!30657 (arr!14745 (Array (_ BitVec 32) (_ BitVec 64))) (size!15097 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30656)

(declare-fun array_inv!10714 (array!30656) Bool)

(assert (=> start!42588 (array_inv!10714 _keys!1025)))

(declare-fun e!279020 () Bool)

(declare-fun array_inv!10715 (array!30654) Bool)

(assert (=> start!42588 (and (array_inv!10715 _values!833) e!279020)))

(declare-fun b!475216 () Bool)

(assert (=> b!475216 (= e!279021 (bvsgt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(declare-fun zeroValue!794 () V!19059)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8862 0))(
  ( (tuple2!8863 (_1!4442 (_ BitVec 64)) (_2!4442 V!19059)) )
))
(declare-datatypes ((List!8921 0))(
  ( (Nil!8918) (Cons!8917 (h!9773 tuple2!8862) (t!14887 List!8921)) )
))
(declare-datatypes ((ListLongMap!7777 0))(
  ( (ListLongMap!7778 (toList!3904 List!8921)) )
))
(declare-fun lt!216443 () ListLongMap!7777)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!19059)

(declare-fun getCurrentListMapNoExtraKeys!2111 (array!30656 array!30654 (_ BitVec 32) (_ BitVec 32) V!19059 V!19059 (_ BitVec 32) Int) ListLongMap!7777)

(assert (=> b!475216 (= lt!216443 (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19059)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!216442 () ListLongMap!7777)

(assert (=> b!475216 (= lt!216442 (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!475217 () Bool)

(declare-fun res!283832 () Bool)

(assert (=> b!475217 (=> (not res!283832) (not e!279021))))

(assert (=> b!475217 (= res!283832 (and (= (size!15096 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15097 _keys!1025) (size!15096 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!475218 () Bool)

(declare-fun e!279024 () Bool)

(assert (=> b!475218 (= e!279020 (and e!279024 mapRes!21916))))

(declare-fun condMapEmpty!21916 () Bool)

(declare-fun mapDefault!21916 () ValueCell!6389)

(assert (=> b!475218 (= condMapEmpty!21916 (= (arr!14744 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6389)) mapDefault!21916)))))

(declare-fun b!475219 () Bool)

(assert (=> b!475219 (= e!279022 tp_is_empty!13465)))

(declare-fun b!475220 () Bool)

(assert (=> b!475220 (= e!279024 tp_is_empty!13465)))

(declare-fun b!475221 () Bool)

(declare-fun res!283834 () Bool)

(assert (=> b!475221 (=> (not res!283834) (not e!279021))))

(declare-datatypes ((List!8922 0))(
  ( (Nil!8919) (Cons!8918 (h!9774 (_ BitVec 64)) (t!14888 List!8922)) )
))
(declare-fun arrayNoDuplicates!0 (array!30656 (_ BitVec 32) List!8922) Bool)

(assert (=> b!475221 (= res!283834 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8919))))

(declare-fun b!475222 () Bool)

(declare-fun res!283833 () Bool)

(assert (=> b!475222 (=> (not res!283833) (not e!279021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30656 (_ BitVec 32)) Bool)

(assert (=> b!475222 (= res!283833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42588 res!283835) b!475217))

(assert (= (and b!475217 res!283832) b!475222))

(assert (= (and b!475222 res!283833) b!475221))

(assert (= (and b!475221 res!283834) b!475216))

(assert (= (and b!475218 condMapEmpty!21916) mapIsEmpty!21916))

(assert (= (and b!475218 (not condMapEmpty!21916)) mapNonEmpty!21916))

(get-info :version)

(assert (= (and mapNonEmpty!21916 ((_ is ValueCellFull!6389) mapValue!21916)) b!475219))

(assert (= (and b!475218 ((_ is ValueCellFull!6389) mapDefault!21916)) b!475220))

(assert (= start!42588 b!475218))

(declare-fun m!457677 () Bool)

(assert (=> mapNonEmpty!21916 m!457677))

(declare-fun m!457679 () Bool)

(assert (=> b!475216 m!457679))

(declare-fun m!457681 () Bool)

(assert (=> b!475216 m!457681))

(declare-fun m!457683 () Bool)

(assert (=> b!475222 m!457683))

(declare-fun m!457685 () Bool)

(assert (=> start!42588 m!457685))

(declare-fun m!457687 () Bool)

(assert (=> start!42588 m!457687))

(declare-fun m!457689 () Bool)

(assert (=> start!42588 m!457689))

(declare-fun m!457691 () Bool)

(assert (=> b!475221 m!457691))

(check-sat (not b!475222) (not start!42588) (not b_next!12037) (not mapNonEmpty!21916) (not b!475221) (not b!475216) tp_is_empty!13465 b_and!20527)
(check-sat b_and!20527 (not b_next!12037))
(get-model)

(declare-fun bm!30554 () Bool)

(declare-fun call!30557 () Bool)

(declare-fun c!57116 () Bool)

(assert (=> bm!30554 (= call!30557 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!57116 (Cons!8918 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000) Nil!8919) Nil!8919)))))

(declare-fun b!475275 () Bool)

(declare-fun e!279063 () Bool)

(assert (=> b!475275 (= e!279063 call!30557)))

(declare-fun b!475276 () Bool)

(declare-fun e!279065 () Bool)

(declare-fun e!279066 () Bool)

(assert (=> b!475276 (= e!279065 e!279066)))

(declare-fun res!283868 () Bool)

(assert (=> b!475276 (=> (not res!283868) (not e!279066))))

(declare-fun e!279064 () Bool)

(assert (=> b!475276 (= res!283868 (not e!279064))))

(declare-fun res!283867 () Bool)

(assert (=> b!475276 (=> (not res!283867) (not e!279064))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!475276 (= res!283867 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475277 () Bool)

(declare-fun contains!2535 (List!8922 (_ BitVec 64)) Bool)

(assert (=> b!475277 (= e!279064 (contains!2535 Nil!8919 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475278 () Bool)

(assert (=> b!475278 (= e!279063 call!30557)))

(declare-fun d!75633 () Bool)

(declare-fun res!283866 () Bool)

(assert (=> d!75633 (=> res!283866 e!279065)))

(assert (=> d!75633 (= res!283866 (bvsge #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (=> d!75633 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8919) e!279065)))

(declare-fun b!475279 () Bool)

(assert (=> b!475279 (= e!279066 e!279063)))

(assert (=> b!475279 (= c!57116 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(assert (= (and d!75633 (not res!283866)) b!475276))

(assert (= (and b!475276 res!283867) b!475277))

(assert (= (and b!475276 res!283868) b!475279))

(assert (= (and b!475279 c!57116) b!475278))

(assert (= (and b!475279 (not c!57116)) b!475275))

(assert (= (or b!475278 b!475275) bm!30554))

(declare-fun m!457725 () Bool)

(assert (=> bm!30554 m!457725))

(declare-fun m!457727 () Bool)

(assert (=> bm!30554 m!457727))

(assert (=> b!475276 m!457725))

(assert (=> b!475276 m!457725))

(declare-fun m!457729 () Bool)

(assert (=> b!475276 m!457729))

(assert (=> b!475277 m!457725))

(assert (=> b!475277 m!457725))

(declare-fun m!457731 () Bool)

(assert (=> b!475277 m!457731))

(assert (=> b!475279 m!457725))

(assert (=> b!475279 m!457725))

(assert (=> b!475279 m!457729))

(assert (=> b!475221 d!75633))

(declare-fun b!475304 () Bool)

(declare-fun e!279087 () Bool)

(declare-fun lt!216470 () ListLongMap!7777)

(declare-fun isEmpty!587 (ListLongMap!7777) Bool)

(assert (=> b!475304 (= e!279087 (isEmpty!587 lt!216470))))

(declare-fun call!30560 () ListLongMap!7777)

(declare-fun bm!30557 () Bool)

(assert (=> bm!30557 (= call!30560 (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475306 () Bool)

(declare-fun e!279085 () Bool)

(declare-fun e!279083 () Bool)

(assert (=> b!475306 (= e!279085 e!279083)))

(declare-fun c!57126 () Bool)

(declare-fun e!279086 () Bool)

(assert (=> b!475306 (= c!57126 e!279086)))

(declare-fun res!283878 () Bool)

(assert (=> b!475306 (=> (not res!283878) (not e!279086))))

(assert (=> b!475306 (= res!283878 (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(declare-fun b!475307 () Bool)

(declare-datatypes ((Unit!13974 0))(
  ( (Unit!13975) )
))
(declare-fun lt!216471 () Unit!13974)

(declare-fun lt!216473 () Unit!13974)

(assert (=> b!475307 (= lt!216471 lt!216473)))

(declare-fun lt!216475 () V!19059)

(declare-fun lt!216476 () (_ BitVec 64))

(declare-fun lt!216474 () (_ BitVec 64))

(declare-fun lt!216472 () ListLongMap!7777)

(declare-fun contains!2536 (ListLongMap!7777 (_ BitVec 64)) Bool)

(declare-fun +!1762 (ListLongMap!7777 tuple2!8862) ListLongMap!7777)

(assert (=> b!475307 (not (contains!2536 (+!1762 lt!216472 (tuple2!8863 lt!216476 lt!216475)) lt!216474))))

(declare-fun addStillNotContains!169 (ListLongMap!7777 (_ BitVec 64) V!19059 (_ BitVec 64)) Unit!13974)

(assert (=> b!475307 (= lt!216473 (addStillNotContains!169 lt!216472 lt!216476 lt!216475 lt!216474))))

(assert (=> b!475307 (= lt!216474 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!7162 (ValueCell!6389 V!19059) V!19059)

(declare-fun dynLambda!924 (Int (_ BitVec 64)) V!19059)

(assert (=> b!475307 (= lt!216475 (get!7162 (select (arr!14744 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475307 (= lt!216476 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475307 (= lt!216472 call!30560)))

(declare-fun e!279082 () ListLongMap!7777)

(assert (=> b!475307 (= e!279082 (+!1762 call!30560 (tuple2!8863 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000) (get!7162 (select (arr!14744 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475308 () Bool)

(assert (=> b!475308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (=> b!475308 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15096 _values!833)))))

(declare-fun e!279084 () Bool)

(declare-fun apply!334 (ListLongMap!7777 (_ BitVec 64)) V!19059)

(assert (=> b!475308 (= e!279084 (= (apply!334 lt!216470 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)) (get!7162 (select (arr!14744 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475309 () Bool)

(assert (=> b!475309 (= e!279083 e!279084)))

(assert (=> b!475309 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(declare-fun res!283879 () Bool)

(assert (=> b!475309 (= res!283879 (contains!2536 lt!216470 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475309 (=> (not res!283879) (not e!279084))))

(declare-fun d!75635 () Bool)

(assert (=> d!75635 e!279085))

(declare-fun res!283880 () Bool)

(assert (=> d!75635 (=> (not res!283880) (not e!279085))))

(assert (=> d!75635 (= res!283880 (not (contains!2536 lt!216470 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279081 () ListLongMap!7777)

(assert (=> d!75635 (= lt!216470 e!279081)))

(declare-fun c!57125 () Bool)

(assert (=> d!75635 (= c!57125 (bvsge #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (=> d!75635 (validMask!0 mask!1365)))

(assert (=> d!75635 (= (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216470)))

(declare-fun b!475305 () Bool)

(assert (=> b!475305 (= e!279081 e!279082)))

(declare-fun c!57127 () Bool)

(assert (=> b!475305 (= c!57127 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475310 () Bool)

(assert (=> b!475310 (= e!279086 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475310 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475311 () Bool)

(assert (=> b!475311 (= e!279082 call!30560)))

(declare-fun b!475312 () Bool)

(assert (=> b!475312 (= e!279081 (ListLongMap!7778 Nil!8918))))

(declare-fun b!475313 () Bool)

(assert (=> b!475313 (= e!279087 (= lt!216470 (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475314 () Bool)

(declare-fun res!283877 () Bool)

(assert (=> b!475314 (=> (not res!283877) (not e!279085))))

(assert (=> b!475314 (= res!283877 (not (contains!2536 lt!216470 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475315 () Bool)

(assert (=> b!475315 (= e!279083 e!279087)))

(declare-fun c!57128 () Bool)

(assert (=> b!475315 (= c!57128 (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (= (and d!75635 c!57125) b!475312))

(assert (= (and d!75635 (not c!57125)) b!475305))

(assert (= (and b!475305 c!57127) b!475307))

(assert (= (and b!475305 (not c!57127)) b!475311))

(assert (= (or b!475307 b!475311) bm!30557))

(assert (= (and d!75635 res!283880) b!475314))

(assert (= (and b!475314 res!283877) b!475306))

(assert (= (and b!475306 res!283878) b!475310))

(assert (= (and b!475306 c!57126) b!475309))

(assert (= (and b!475306 (not c!57126)) b!475315))

(assert (= (and b!475309 res!283879) b!475308))

(assert (= (and b!475315 c!57128) b!475313))

(assert (= (and b!475315 (not c!57128)) b!475304))

(declare-fun b_lambda!10267 () Bool)

(assert (=> (not b_lambda!10267) (not b!475307)))

(declare-fun t!14891 () Bool)

(declare-fun tb!3925 () Bool)

(assert (=> (and start!42588 (= defaultEntry!841 defaultEntry!841) t!14891) tb!3925))

(declare-fun result!7449 () Bool)

(assert (=> tb!3925 (= result!7449 tp_is_empty!13465)))

(assert (=> b!475307 t!14891))

(declare-fun b_and!20533 () Bool)

(assert (= b_and!20527 (and (=> t!14891 result!7449) b_and!20533)))

(declare-fun b_lambda!10269 () Bool)

(assert (=> (not b_lambda!10269) (not b!475308)))

(assert (=> b!475308 t!14891))

(declare-fun b_and!20535 () Bool)

(assert (= b_and!20533 (and (=> t!14891 result!7449) b_and!20535)))

(declare-fun m!457733 () Bool)

(assert (=> b!475314 m!457733))

(assert (=> b!475305 m!457725))

(assert (=> b!475305 m!457725))

(assert (=> b!475305 m!457729))

(declare-fun m!457735 () Bool)

(assert (=> d!75635 m!457735))

(assert (=> d!75635 m!457685))

(declare-fun m!457737 () Bool)

(assert (=> b!475304 m!457737))

(declare-fun m!457739 () Bool)

(assert (=> b!475307 m!457739))

(declare-fun m!457741 () Bool)

(assert (=> b!475307 m!457741))

(declare-fun m!457743 () Bool)

(assert (=> b!475307 m!457743))

(assert (=> b!475307 m!457725))

(assert (=> b!475307 m!457741))

(assert (=> b!475307 m!457743))

(declare-fun m!457745 () Bool)

(assert (=> b!475307 m!457745))

(declare-fun m!457747 () Bool)

(assert (=> b!475307 m!457747))

(declare-fun m!457749 () Bool)

(assert (=> b!475307 m!457749))

(assert (=> b!475307 m!457739))

(declare-fun m!457751 () Bool)

(assert (=> b!475307 m!457751))

(assert (=> b!475310 m!457725))

(assert (=> b!475310 m!457725))

(assert (=> b!475310 m!457729))

(declare-fun m!457753 () Bool)

(assert (=> b!475313 m!457753))

(assert (=> b!475309 m!457725))

(assert (=> b!475309 m!457725))

(declare-fun m!457755 () Bool)

(assert (=> b!475309 m!457755))

(assert (=> bm!30557 m!457753))

(assert (=> b!475308 m!457741))

(assert (=> b!475308 m!457743))

(assert (=> b!475308 m!457725))

(assert (=> b!475308 m!457741))

(assert (=> b!475308 m!457743))

(assert (=> b!475308 m!457745))

(assert (=> b!475308 m!457725))

(declare-fun m!457757 () Bool)

(assert (=> b!475308 m!457757))

(assert (=> b!475216 d!75635))

(declare-fun b!475318 () Bool)

(declare-fun e!279094 () Bool)

(declare-fun lt!216477 () ListLongMap!7777)

(assert (=> b!475318 (= e!279094 (isEmpty!587 lt!216477))))

(declare-fun bm!30558 () Bool)

(declare-fun call!30561 () ListLongMap!7777)

(assert (=> bm!30558 (= call!30561 (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!475320 () Bool)

(declare-fun e!279092 () Bool)

(declare-fun e!279090 () Bool)

(assert (=> b!475320 (= e!279092 e!279090)))

(declare-fun c!57130 () Bool)

(declare-fun e!279093 () Bool)

(assert (=> b!475320 (= c!57130 e!279093)))

(declare-fun res!283882 () Bool)

(assert (=> b!475320 (=> (not res!283882) (not e!279093))))

(assert (=> b!475320 (= res!283882 (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(declare-fun b!475321 () Bool)

(declare-fun lt!216478 () Unit!13974)

(declare-fun lt!216480 () Unit!13974)

(assert (=> b!475321 (= lt!216478 lt!216480)))

(declare-fun lt!216479 () ListLongMap!7777)

(declare-fun lt!216482 () V!19059)

(declare-fun lt!216481 () (_ BitVec 64))

(declare-fun lt!216483 () (_ BitVec 64))

(assert (=> b!475321 (not (contains!2536 (+!1762 lt!216479 (tuple2!8863 lt!216483 lt!216482)) lt!216481))))

(assert (=> b!475321 (= lt!216480 (addStillNotContains!169 lt!216479 lt!216483 lt!216482 lt!216481))))

(assert (=> b!475321 (= lt!216481 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!475321 (= lt!216482 (get!7162 (select (arr!14744 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!475321 (= lt!216483 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> b!475321 (= lt!216479 call!30561)))

(declare-fun e!279089 () ListLongMap!7777)

(assert (=> b!475321 (= e!279089 (+!1762 call!30561 (tuple2!8863 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000) (get!7162 (select (arr!14744 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!475322 () Bool)

(assert (=> b!475322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (=> b!475322 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15096 _values!833)))))

(declare-fun e!279091 () Bool)

(assert (=> b!475322 (= e!279091 (= (apply!334 lt!216477 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)) (get!7162 (select (arr!14744 _values!833) #b00000000000000000000000000000000) (dynLambda!924 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!475323 () Bool)

(assert (=> b!475323 (= e!279090 e!279091)))

(assert (=> b!475323 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(declare-fun res!283883 () Bool)

(assert (=> b!475323 (= res!283883 (contains!2536 lt!216477 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475323 (=> (not res!283883) (not e!279091))))

(declare-fun d!75637 () Bool)

(assert (=> d!75637 e!279092))

(declare-fun res!283884 () Bool)

(assert (=> d!75637 (=> (not res!283884) (not e!279092))))

(assert (=> d!75637 (= res!283884 (not (contains!2536 lt!216477 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!279088 () ListLongMap!7777)

(assert (=> d!75637 (= lt!216477 e!279088)))

(declare-fun c!57129 () Bool)

(assert (=> d!75637 (= c!57129 (bvsge #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (=> d!75637 (validMask!0 mask!1365)))

(assert (=> d!75637 (= (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!216477)))

(declare-fun b!475319 () Bool)

(assert (=> b!475319 (= e!279088 e!279089)))

(declare-fun c!57131 () Bool)

(assert (=> b!475319 (= c!57131 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!475324 () Bool)

(assert (=> b!475324 (= e!279093 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!475324 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!475325 () Bool)

(assert (=> b!475325 (= e!279089 call!30561)))

(declare-fun b!475326 () Bool)

(assert (=> b!475326 (= e!279088 (ListLongMap!7778 Nil!8918))))

(declare-fun b!475327 () Bool)

(assert (=> b!475327 (= e!279094 (= lt!216477 (getCurrentListMapNoExtraKeys!2111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun b!475328 () Bool)

(declare-fun res!283881 () Bool)

(assert (=> b!475328 (=> (not res!283881) (not e!279092))))

(assert (=> b!475328 (= res!283881 (not (contains!2536 lt!216477 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!475329 () Bool)

(assert (=> b!475329 (= e!279090 e!279094)))

(declare-fun c!57132 () Bool)

(assert (=> b!475329 (= c!57132 (bvslt #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (= (and d!75637 c!57129) b!475326))

(assert (= (and d!75637 (not c!57129)) b!475319))

(assert (= (and b!475319 c!57131) b!475321))

(assert (= (and b!475319 (not c!57131)) b!475325))

(assert (= (or b!475321 b!475325) bm!30558))

(assert (= (and d!75637 res!283884) b!475328))

(assert (= (and b!475328 res!283881) b!475320))

(assert (= (and b!475320 res!283882) b!475324))

(assert (= (and b!475320 c!57130) b!475323))

(assert (= (and b!475320 (not c!57130)) b!475329))

(assert (= (and b!475323 res!283883) b!475322))

(assert (= (and b!475329 c!57132) b!475327))

(assert (= (and b!475329 (not c!57132)) b!475318))

(declare-fun b_lambda!10271 () Bool)

(assert (=> (not b_lambda!10271) (not b!475321)))

(assert (=> b!475321 t!14891))

(declare-fun b_and!20537 () Bool)

(assert (= b_and!20535 (and (=> t!14891 result!7449) b_and!20537)))

(declare-fun b_lambda!10273 () Bool)

(assert (=> (not b_lambda!10273) (not b!475322)))

(assert (=> b!475322 t!14891))

(declare-fun b_and!20539 () Bool)

(assert (= b_and!20537 (and (=> t!14891 result!7449) b_and!20539)))

(declare-fun m!457759 () Bool)

(assert (=> b!475328 m!457759))

(assert (=> b!475319 m!457725))

(assert (=> b!475319 m!457725))

(assert (=> b!475319 m!457729))

(declare-fun m!457761 () Bool)

(assert (=> d!75637 m!457761))

(assert (=> d!75637 m!457685))

(declare-fun m!457763 () Bool)

(assert (=> b!475318 m!457763))

(declare-fun m!457765 () Bool)

(assert (=> b!475321 m!457765))

(assert (=> b!475321 m!457741))

(assert (=> b!475321 m!457743))

(assert (=> b!475321 m!457725))

(assert (=> b!475321 m!457741))

(assert (=> b!475321 m!457743))

(assert (=> b!475321 m!457745))

(declare-fun m!457767 () Bool)

(assert (=> b!475321 m!457767))

(declare-fun m!457769 () Bool)

(assert (=> b!475321 m!457769))

(assert (=> b!475321 m!457765))

(declare-fun m!457771 () Bool)

(assert (=> b!475321 m!457771))

(assert (=> b!475324 m!457725))

(assert (=> b!475324 m!457725))

(assert (=> b!475324 m!457729))

(declare-fun m!457773 () Bool)

(assert (=> b!475327 m!457773))

(assert (=> b!475323 m!457725))

(assert (=> b!475323 m!457725))

(declare-fun m!457775 () Bool)

(assert (=> b!475323 m!457775))

(assert (=> bm!30558 m!457773))

(assert (=> b!475322 m!457741))

(assert (=> b!475322 m!457743))

(assert (=> b!475322 m!457725))

(assert (=> b!475322 m!457741))

(assert (=> b!475322 m!457743))

(assert (=> b!475322 m!457745))

(assert (=> b!475322 m!457725))

(declare-fun m!457777 () Bool)

(assert (=> b!475322 m!457777))

(assert (=> b!475216 d!75637))

(declare-fun d!75639 () Bool)

(assert (=> d!75639 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42588 d!75639))

(declare-fun d!75641 () Bool)

(assert (=> d!75641 (= (array_inv!10714 _keys!1025) (bvsge (size!15097 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42588 d!75641))

(declare-fun d!75643 () Bool)

(assert (=> d!75643 (= (array_inv!10715 _values!833) (bvsge (size!15096 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42588 d!75643))

(declare-fun b!475338 () Bool)

(declare-fun e!279101 () Bool)

(declare-fun call!30564 () Bool)

(assert (=> b!475338 (= e!279101 call!30564)))

(declare-fun d!75645 () Bool)

(declare-fun res!283890 () Bool)

(declare-fun e!279102 () Bool)

(assert (=> d!75645 (=> res!283890 e!279102)))

(assert (=> d!75645 (= res!283890 (bvsge #b00000000000000000000000000000000 (size!15097 _keys!1025)))))

(assert (=> d!75645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!279102)))

(declare-fun b!475339 () Bool)

(declare-fun e!279103 () Bool)

(assert (=> b!475339 (= e!279102 e!279103)))

(declare-fun c!57135 () Bool)

(assert (=> b!475339 (= c!57135 (validKeyInArray!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30561 () Bool)

(assert (=> bm!30561 (= call!30564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!475340 () Bool)

(assert (=> b!475340 (= e!279103 call!30564)))

(declare-fun b!475341 () Bool)

(assert (=> b!475341 (= e!279103 e!279101)))

(declare-fun lt!216490 () (_ BitVec 64))

(assert (=> b!475341 (= lt!216490 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!216491 () Unit!13974)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!30656 (_ BitVec 64) (_ BitVec 32)) Unit!13974)

(assert (=> b!475341 (= lt!216491 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!216490 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!30656 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!475341 (arrayContainsKey!0 _keys!1025 lt!216490 #b00000000000000000000000000000000)))

(declare-fun lt!216492 () Unit!13974)

(assert (=> b!475341 (= lt!216492 lt!216491)))

(declare-fun res!283889 () Bool)

(declare-datatypes ((SeekEntryResult!3507 0))(
  ( (MissingZero!3507 (index!16207 (_ BitVec 32))) (Found!3507 (index!16208 (_ BitVec 32))) (Intermediate!3507 (undefined!4319 Bool) (index!16209 (_ BitVec 32)) (x!44562 (_ BitVec 32))) (Undefined!3507) (MissingVacant!3507 (index!16210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!30656 (_ BitVec 32)) SeekEntryResult!3507)

(assert (=> b!475341 (= res!283889 (= (seekEntryOrOpen!0 (select (arr!14745 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3507 #b00000000000000000000000000000000)))))

(assert (=> b!475341 (=> (not res!283889) (not e!279101))))

(assert (= (and d!75645 (not res!283890)) b!475339))

(assert (= (and b!475339 c!57135) b!475341))

(assert (= (and b!475339 (not c!57135)) b!475340))

(assert (= (and b!475341 res!283889) b!475338))

(assert (= (or b!475338 b!475340) bm!30561))

(assert (=> b!475339 m!457725))

(assert (=> b!475339 m!457725))

(assert (=> b!475339 m!457729))

(declare-fun m!457779 () Bool)

(assert (=> bm!30561 m!457779))

(assert (=> b!475341 m!457725))

(declare-fun m!457781 () Bool)

(assert (=> b!475341 m!457781))

(declare-fun m!457783 () Bool)

(assert (=> b!475341 m!457783))

(assert (=> b!475341 m!457725))

(declare-fun m!457785 () Bool)

(assert (=> b!475341 m!457785))

(assert (=> b!475222 d!75645))

(declare-fun mapIsEmpty!21925 () Bool)

(declare-fun mapRes!21925 () Bool)

(assert (=> mapIsEmpty!21925 mapRes!21925))

(declare-fun b!475349 () Bool)

(declare-fun e!279108 () Bool)

(assert (=> b!475349 (= e!279108 tp_is_empty!13465)))

(declare-fun mapNonEmpty!21925 () Bool)

(declare-fun tp!42166 () Bool)

(declare-fun e!279109 () Bool)

(assert (=> mapNonEmpty!21925 (= mapRes!21925 (and tp!42166 e!279109))))

(declare-fun mapKey!21925 () (_ BitVec 32))

(declare-fun mapRest!21925 () (Array (_ BitVec 32) ValueCell!6389))

(declare-fun mapValue!21925 () ValueCell!6389)

(assert (=> mapNonEmpty!21925 (= mapRest!21916 (store mapRest!21925 mapKey!21925 mapValue!21925))))

(declare-fun condMapEmpty!21925 () Bool)

(declare-fun mapDefault!21925 () ValueCell!6389)

(assert (=> mapNonEmpty!21916 (= condMapEmpty!21925 (= mapRest!21916 ((as const (Array (_ BitVec 32) ValueCell!6389)) mapDefault!21925)))))

(assert (=> mapNonEmpty!21916 (= tp!42150 (and e!279108 mapRes!21925))))

(declare-fun b!475348 () Bool)

(assert (=> b!475348 (= e!279109 tp_is_empty!13465)))

(assert (= (and mapNonEmpty!21916 condMapEmpty!21925) mapIsEmpty!21925))

(assert (= (and mapNonEmpty!21916 (not condMapEmpty!21925)) mapNonEmpty!21925))

(assert (= (and mapNonEmpty!21925 ((_ is ValueCellFull!6389) mapValue!21925)) b!475348))

(assert (= (and mapNonEmpty!21916 ((_ is ValueCellFull!6389) mapDefault!21925)) b!475349))

(declare-fun m!457787 () Bool)

(assert (=> mapNonEmpty!21925 m!457787))

(declare-fun b_lambda!10275 () Bool)

(assert (= b_lambda!10271 (or (and start!42588 b_free!12037) b_lambda!10275)))

(declare-fun b_lambda!10277 () Bool)

(assert (= b_lambda!10267 (or (and start!42588 b_free!12037) b_lambda!10277)))

(declare-fun b_lambda!10279 () Bool)

(assert (= b_lambda!10273 (or (and start!42588 b_free!12037) b_lambda!10279)))

(declare-fun b_lambda!10281 () Bool)

(assert (= b_lambda!10269 (or (and start!42588 b_free!12037) b_lambda!10281)))

(check-sat (not b!475277) (not b!475309) (not b!475323) (not b!475305) (not b_next!12037) (not b!475341) (not d!75635) (not b_lambda!10275) (not b!475322) (not bm!30557) (not b!475313) (not b!475324) (not b!475310) (not b!475304) (not b_lambda!10279) (not b!475279) (not b!475321) (not b!475327) (not b!475319) (not d!75637) (not bm!30561) (not b!475339) (not b!475276) (not b_lambda!10277) (not bm!30558) (not b!475314) (not b!475318) (not bm!30554) (not b!475328) tp_is_empty!13465 (not b!475307) b_and!20539 (not b!475308) (not b_lambda!10281) (not mapNonEmpty!21925))
(check-sat b_and!20539 (not b_next!12037))
