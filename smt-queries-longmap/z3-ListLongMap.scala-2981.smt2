; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42148 () Bool)

(assert start!42148)

(declare-fun b_free!11695 () Bool)

(declare-fun b_next!11695 () Bool)

(assert (=> start!42148 (= b_free!11695 (not b_next!11695))))

(declare-fun tp!41107 () Bool)

(declare-fun b_and!20127 () Bool)

(assert (=> start!42148 (= tp!41107 b_and!20127)))

(declare-fun b!470617 () Bool)

(declare-fun e!275729 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!29998 0))(
  ( (array!29999 (arr!14422 (Array (_ BitVec 32) (_ BitVec 64))) (size!14774 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29998)

(assert (=> b!470617 (= e!275729 (not (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle #b00000000000000000000000000000000 (size!14774 _keys!1025)))))))

(declare-datatypes ((V!18603 0))(
  ( (V!18604 (val!6606 Int)) )
))
(declare-datatypes ((tuple2!8620 0))(
  ( (tuple2!8621 (_1!4321 (_ BitVec 64)) (_2!4321 V!18603)) )
))
(declare-datatypes ((List!8694 0))(
  ( (Nil!8691) (Cons!8690 (h!9546 tuple2!8620) (t!14648 List!8694)) )
))
(declare-datatypes ((ListLongMap!7535 0))(
  ( (ListLongMap!7536 (toList!3783 List!8694)) )
))
(declare-fun lt!213569 () ListLongMap!7535)

(declare-fun lt!213568 () ListLongMap!7535)

(assert (=> b!470617 (= lt!213569 lt!213568)))

(declare-datatypes ((Unit!13779 0))(
  ( (Unit!13780) )
))
(declare-fun lt!213570 () Unit!13779)

(declare-fun minValueBefore!38 () V!18603)

(declare-fun zeroValue!794 () V!18603)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6218 0))(
  ( (ValueCellFull!6218 (v!8898 V!18603)) (EmptyCell!6218) )
))
(declare-datatypes ((array!30000 0))(
  ( (array!30001 (arr!14423 (Array (_ BitVec 32) ValueCell!6218)) (size!14775 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30000)

(declare-fun minValueAfter!38 () V!18603)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!158 (array!29998 array!30000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18603 V!18603 V!18603 V!18603 (_ BitVec 32) Int) Unit!13779)

(assert (=> b!470617 (= lt!213570 (lemmaNoChangeToArrayThenSameMapNoExtras!158 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1998 (array!29998 array!30000 (_ BitVec 32) (_ BitVec 32) V!18603 V!18603 (_ BitVec 32) Int) ListLongMap!7535)

(assert (=> b!470617 (= lt!213568 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470617 (= lt!213569 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470618 () Bool)

(declare-fun res!281228 () Bool)

(assert (=> b!470618 (=> (not res!281228) (not e!275729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29998 (_ BitVec 32)) Bool)

(assert (=> b!470618 (= res!281228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470619 () Bool)

(declare-fun res!281230 () Bool)

(assert (=> b!470619 (=> (not res!281230) (not e!275729))))

(assert (=> b!470619 (= res!281230 (and (= (size!14775 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14774 _keys!1025) (size!14775 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470620 () Bool)

(declare-fun e!275727 () Bool)

(declare-fun tp_is_empty!13123 () Bool)

(assert (=> b!470620 (= e!275727 tp_is_empty!13123)))

(declare-fun b!470621 () Bool)

(declare-fun e!275728 () Bool)

(assert (=> b!470621 (= e!275728 tp_is_empty!13123)))

(declare-fun mapNonEmpty!21385 () Bool)

(declare-fun mapRes!21385 () Bool)

(declare-fun tp!41106 () Bool)

(assert (=> mapNonEmpty!21385 (= mapRes!21385 (and tp!41106 e!275727))))

(declare-fun mapKey!21385 () (_ BitVec 32))

(declare-fun mapRest!21385 () (Array (_ BitVec 32) ValueCell!6218))

(declare-fun mapValue!21385 () ValueCell!6218)

(assert (=> mapNonEmpty!21385 (= (arr!14423 _values!833) (store mapRest!21385 mapKey!21385 mapValue!21385))))

(declare-fun mapIsEmpty!21385 () Bool)

(assert (=> mapIsEmpty!21385 mapRes!21385))

(declare-fun res!281229 () Bool)

(assert (=> start!42148 (=> (not res!281229) (not e!275729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42148 (= res!281229 (validMask!0 mask!1365))))

(assert (=> start!42148 e!275729))

(assert (=> start!42148 tp_is_empty!13123))

(assert (=> start!42148 tp!41107))

(assert (=> start!42148 true))

(declare-fun array_inv!10496 (array!29998) Bool)

(assert (=> start!42148 (array_inv!10496 _keys!1025)))

(declare-fun e!275730 () Bool)

(declare-fun array_inv!10497 (array!30000) Bool)

(assert (=> start!42148 (and (array_inv!10497 _values!833) e!275730)))

(declare-fun b!470622 () Bool)

(assert (=> b!470622 (= e!275730 (and e!275728 mapRes!21385))))

(declare-fun condMapEmpty!21385 () Bool)

(declare-fun mapDefault!21385 () ValueCell!6218)

(assert (=> b!470622 (= condMapEmpty!21385 (= (arr!14423 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6218)) mapDefault!21385)))))

(declare-fun b!470623 () Bool)

(declare-fun res!281231 () Bool)

(assert (=> b!470623 (=> (not res!281231) (not e!275729))))

(declare-datatypes ((List!8695 0))(
  ( (Nil!8692) (Cons!8691 (h!9547 (_ BitVec 64)) (t!14649 List!8695)) )
))
(declare-fun arrayNoDuplicates!0 (array!29998 (_ BitVec 32) List!8695) Bool)

(assert (=> b!470623 (= res!281231 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8692))))

(assert (= (and start!42148 res!281229) b!470619))

(assert (= (and b!470619 res!281230) b!470618))

(assert (= (and b!470618 res!281228) b!470623))

(assert (= (and b!470623 res!281231) b!470617))

(assert (= (and b!470622 condMapEmpty!21385) mapIsEmpty!21385))

(assert (= (and b!470622 (not condMapEmpty!21385)) mapNonEmpty!21385))

(get-info :version)

(assert (= (and mapNonEmpty!21385 ((_ is ValueCellFull!6218) mapValue!21385)) b!470620))

(assert (= (and b!470622 ((_ is ValueCellFull!6218) mapDefault!21385)) b!470621))

(assert (= start!42148 b!470622))

(declare-fun m!453115 () Bool)

(assert (=> mapNonEmpty!21385 m!453115))

(declare-fun m!453117 () Bool)

(assert (=> b!470623 m!453117))

(declare-fun m!453119 () Bool)

(assert (=> b!470617 m!453119))

(declare-fun m!453121 () Bool)

(assert (=> b!470617 m!453121))

(declare-fun m!453123 () Bool)

(assert (=> b!470617 m!453123))

(declare-fun m!453125 () Bool)

(assert (=> b!470618 m!453125))

(declare-fun m!453127 () Bool)

(assert (=> start!42148 m!453127))

(declare-fun m!453129 () Bool)

(assert (=> start!42148 m!453129))

(declare-fun m!453131 () Bool)

(assert (=> start!42148 m!453131))

(check-sat tp_is_empty!13123 (not b!470618) b_and!20127 (not mapNonEmpty!21385) (not b!470617) (not b!470623) (not b_next!11695) (not start!42148))
(check-sat b_and!20127 (not b_next!11695))
(get-model)

(declare-fun d!75393 () Bool)

(assert (=> d!75393 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!42148 d!75393))

(declare-fun d!75395 () Bool)

(assert (=> d!75395 (= (array_inv!10496 _keys!1025) (bvsge (size!14774 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!42148 d!75395))

(declare-fun d!75397 () Bool)

(assert (=> d!75397 (= (array_inv!10497 _values!833) (bvsge (size!14775 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!42148 d!75397))

(declare-fun d!75399 () Bool)

(assert (=> d!75399 (= (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!213591 () Unit!13779)

(declare-fun choose!1354 (array!29998 array!30000 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18603 V!18603 V!18603 V!18603 (_ BitVec 32) Int) Unit!13779)

(assert (=> d!75399 (= lt!213591 (choose!1354 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> d!75399 (validMask!0 mask!1365)))

(assert (=> d!75399 (= (lemmaNoChangeToArrayThenSameMapNoExtras!158 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213591)))

(declare-fun bs!14936 () Bool)

(assert (= bs!14936 d!75399))

(assert (=> bs!14936 m!453123))

(assert (=> bs!14936 m!453121))

(declare-fun m!453169 () Bool)

(assert (=> bs!14936 m!453169))

(assert (=> bs!14936 m!453127))

(assert (=> b!470617 d!75399))

(declare-fun b!470690 () Bool)

(declare-fun e!275780 () Bool)

(declare-fun e!275782 () Bool)

(assert (=> b!470690 (= e!275780 e!275782)))

(assert (=> b!470690 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun res!281264 () Bool)

(declare-fun lt!213610 () ListLongMap!7535)

(declare-fun contains!2521 (ListLongMap!7535 (_ BitVec 64)) Bool)

(assert (=> b!470690 (= res!281264 (contains!2521 lt!213610 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470690 (=> (not res!281264) (not e!275782))))

(declare-fun b!470691 () Bool)

(declare-fun e!275781 () ListLongMap!7535)

(declare-fun e!275777 () ListLongMap!7535)

(assert (=> b!470691 (= e!275781 e!275777)))

(declare-fun c!56925 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!470691 (= c!56925 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470692 () Bool)

(assert (=> b!470692 (= e!275781 (ListLongMap!7536 Nil!8691))))

(declare-fun b!470693 () Bool)

(declare-fun res!281266 () Bool)

(declare-fun e!275779 () Bool)

(assert (=> b!470693 (=> (not res!281266) (not e!275779))))

(assert (=> b!470693 (= res!281266 (not (contains!2521 lt!213610 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75401 () Bool)

(assert (=> d!75401 e!275779))

(declare-fun res!281265 () Bool)

(assert (=> d!75401 (=> (not res!281265) (not e!275779))))

(assert (=> d!75401 (= res!281265 (not (contains!2521 lt!213610 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75401 (= lt!213610 e!275781)))

(declare-fun c!56927 () Bool)

(assert (=> d!75401 (= c!56927 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75401 (validMask!0 mask!1365)))

(assert (=> d!75401 (= (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213610)))

(declare-fun b!470694 () Bool)

(assert (=> b!470694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> b!470694 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14775 _values!833)))))

(declare-fun apply!328 (ListLongMap!7535 (_ BitVec 64)) V!18603)

(declare-fun get!7042 (ValueCell!6218 V!18603) V!18603)

(declare-fun dynLambda!918 (Int (_ BitVec 64)) V!18603)

(assert (=> b!470694 (= e!275782 (= (apply!328 lt!213610 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)) (get!7042 (select (arr!14423 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!470695 () Bool)

(declare-fun e!275778 () Bool)

(assert (=> b!470695 (= e!275778 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470695 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470696 () Bool)

(declare-fun lt!213607 () Unit!13779)

(declare-fun lt!213612 () Unit!13779)

(assert (=> b!470696 (= lt!213607 lt!213612)))

(declare-fun lt!213608 () (_ BitVec 64))

(declare-fun lt!213606 () (_ BitVec 64))

(declare-fun lt!213609 () V!18603)

(declare-fun lt!213611 () ListLongMap!7535)

(declare-fun +!1725 (ListLongMap!7535 tuple2!8620) ListLongMap!7535)

(assert (=> b!470696 (not (contains!2521 (+!1725 lt!213611 (tuple2!8621 lt!213608 lt!213609)) lt!213606))))

(declare-fun addStillNotContains!163 (ListLongMap!7535 (_ BitVec 64) V!18603 (_ BitVec 64)) Unit!13779)

(assert (=> b!470696 (= lt!213612 (addStillNotContains!163 lt!213611 lt!213608 lt!213609 lt!213606))))

(assert (=> b!470696 (= lt!213606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470696 (= lt!213609 (get!7042 (select (arr!14423 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470696 (= lt!213608 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30420 () ListLongMap!7535)

(assert (=> b!470696 (= lt!213611 call!30420)))

(assert (=> b!470696 (= e!275777 (+!1725 call!30420 (tuple2!8621 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000) (get!7042 (select (arr!14423 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!470697 () Bool)

(assert (=> b!470697 (= e!275777 call!30420)))

(declare-fun b!470698 () Bool)

(declare-fun e!275776 () Bool)

(declare-fun isEmpty!581 (ListLongMap!7535) Bool)

(assert (=> b!470698 (= e!275776 (isEmpty!581 lt!213610))))

(declare-fun b!470699 () Bool)

(assert (=> b!470699 (= e!275776 (= lt!213610 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30417 () Bool)

(assert (=> bm!30417 (= call!30420 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!470700 () Bool)

(assert (=> b!470700 (= e!275780 e!275776)))

(declare-fun c!56926 () Bool)

(assert (=> b!470700 (= c!56926 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun b!470701 () Bool)

(assert (=> b!470701 (= e!275779 e!275780)))

(declare-fun c!56924 () Bool)

(assert (=> b!470701 (= c!56924 e!275778)))

(declare-fun res!281267 () Bool)

(assert (=> b!470701 (=> (not res!281267) (not e!275778))))

(assert (=> b!470701 (= res!281267 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (= (and d!75401 c!56927) b!470692))

(assert (= (and d!75401 (not c!56927)) b!470691))

(assert (= (and b!470691 c!56925) b!470696))

(assert (= (and b!470691 (not c!56925)) b!470697))

(assert (= (or b!470696 b!470697) bm!30417))

(assert (= (and d!75401 res!281265) b!470693))

(assert (= (and b!470693 res!281266) b!470701))

(assert (= (and b!470701 res!281267) b!470695))

(assert (= (and b!470701 c!56924) b!470690))

(assert (= (and b!470701 (not c!56924)) b!470700))

(assert (= (and b!470690 res!281264) b!470694))

(assert (= (and b!470700 c!56926) b!470699))

(assert (= (and b!470700 (not c!56926)) b!470698))

(declare-fun b_lambda!10151 () Bool)

(assert (=> (not b_lambda!10151) (not b!470694)))

(declare-fun t!14652 () Bool)

(declare-fun tb!3913 () Bool)

(assert (=> (and start!42148 (= defaultEntry!841 defaultEntry!841) t!14652) tb!3913))

(declare-fun result!7413 () Bool)

(assert (=> tb!3913 (= result!7413 tp_is_empty!13123)))

(assert (=> b!470694 t!14652))

(declare-fun b_and!20133 () Bool)

(assert (= b_and!20127 (and (=> t!14652 result!7413) b_and!20133)))

(declare-fun b_lambda!10153 () Bool)

(assert (=> (not b_lambda!10153) (not b!470696)))

(assert (=> b!470696 t!14652))

(declare-fun b_and!20135 () Bool)

(assert (= b_and!20133 (and (=> t!14652 result!7413) b_and!20135)))

(declare-fun m!453171 () Bool)

(assert (=> b!470699 m!453171))

(declare-fun m!453173 () Bool)

(assert (=> b!470690 m!453173))

(assert (=> b!470690 m!453173))

(declare-fun m!453175 () Bool)

(assert (=> b!470690 m!453175))

(declare-fun m!453177 () Bool)

(assert (=> d!75401 m!453177))

(assert (=> d!75401 m!453127))

(declare-fun m!453179 () Bool)

(assert (=> b!470698 m!453179))

(assert (=> bm!30417 m!453171))

(declare-fun m!453181 () Bool)

(assert (=> b!470696 m!453181))

(declare-fun m!453183 () Bool)

(assert (=> b!470696 m!453183))

(declare-fun m!453185 () Bool)

(assert (=> b!470696 m!453185))

(declare-fun m!453187 () Bool)

(assert (=> b!470696 m!453187))

(declare-fun m!453189 () Bool)

(assert (=> b!470696 m!453189))

(assert (=> b!470696 m!453173))

(declare-fun m!453191 () Bool)

(assert (=> b!470696 m!453191))

(assert (=> b!470696 m!453189))

(declare-fun m!453193 () Bool)

(assert (=> b!470696 m!453193))

(assert (=> b!470696 m!453191))

(assert (=> b!470696 m!453181))

(assert (=> b!470694 m!453173))

(declare-fun m!453195 () Bool)

(assert (=> b!470694 m!453195))

(assert (=> b!470694 m!453189))

(assert (=> b!470694 m!453173))

(assert (=> b!470694 m!453191))

(assert (=> b!470694 m!453189))

(assert (=> b!470694 m!453193))

(assert (=> b!470694 m!453191))

(declare-fun m!453197 () Bool)

(assert (=> b!470693 m!453197))

(assert (=> b!470695 m!453173))

(assert (=> b!470695 m!453173))

(declare-fun m!453199 () Bool)

(assert (=> b!470695 m!453199))

(assert (=> b!470691 m!453173))

(assert (=> b!470691 m!453173))

(assert (=> b!470691 m!453199))

(assert (=> b!470617 d!75401))

(declare-fun b!470704 () Bool)

(declare-fun e!275787 () Bool)

(declare-fun e!275789 () Bool)

(assert (=> b!470704 (= e!275787 e!275789)))

(assert (=> b!470704 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun res!281268 () Bool)

(declare-fun lt!213617 () ListLongMap!7535)

(assert (=> b!470704 (= res!281268 (contains!2521 lt!213617 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470704 (=> (not res!281268) (not e!275789))))

(declare-fun b!470705 () Bool)

(declare-fun e!275788 () ListLongMap!7535)

(declare-fun e!275784 () ListLongMap!7535)

(assert (=> b!470705 (= e!275788 e!275784)))

(declare-fun c!56929 () Bool)

(assert (=> b!470705 (= c!56929 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470706 () Bool)

(assert (=> b!470706 (= e!275788 (ListLongMap!7536 Nil!8691))))

(declare-fun b!470707 () Bool)

(declare-fun res!281270 () Bool)

(declare-fun e!275786 () Bool)

(assert (=> b!470707 (=> (not res!281270) (not e!275786))))

(assert (=> b!470707 (= res!281270 (not (contains!2521 lt!213617 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!75403 () Bool)

(assert (=> d!75403 e!275786))

(declare-fun res!281269 () Bool)

(assert (=> d!75403 (=> (not res!281269) (not e!275786))))

(assert (=> d!75403 (= res!281269 (not (contains!2521 lt!213617 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!75403 (= lt!213617 e!275788)))

(declare-fun c!56931 () Bool)

(assert (=> d!75403 (= c!56931 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75403 (validMask!0 mask!1365)))

(assert (=> d!75403 (= (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) lt!213617)))

(declare-fun b!470708 () Bool)

(assert (=> b!470708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> b!470708 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!14775 _values!833)))))

(assert (=> b!470708 (= e!275789 (= (apply!328 lt!213617 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)) (get!7042 (select (arr!14423 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!470709 () Bool)

(declare-fun e!275785 () Bool)

(assert (=> b!470709 (= e!275785 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(assert (=> b!470709 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!470710 () Bool)

(declare-fun lt!213614 () Unit!13779)

(declare-fun lt!213619 () Unit!13779)

(assert (=> b!470710 (= lt!213614 lt!213619)))

(declare-fun lt!213618 () ListLongMap!7535)

(declare-fun lt!213615 () (_ BitVec 64))

(declare-fun lt!213616 () V!18603)

(declare-fun lt!213613 () (_ BitVec 64))

(assert (=> b!470710 (not (contains!2521 (+!1725 lt!213618 (tuple2!8621 lt!213615 lt!213616)) lt!213613))))

(assert (=> b!470710 (= lt!213619 (addStillNotContains!163 lt!213618 lt!213615 lt!213616 lt!213613))))

(assert (=> b!470710 (= lt!213613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!470710 (= lt!213616 (get!7042 (select (arr!14423 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!470710 (= lt!213615 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun call!30421 () ListLongMap!7535)

(assert (=> b!470710 (= lt!213618 call!30421)))

(assert (=> b!470710 (= e!275784 (+!1725 call!30421 (tuple2!8621 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000) (get!7042 (select (arr!14423 _values!833) #b00000000000000000000000000000000) (dynLambda!918 defaultEntry!841 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!470711 () Bool)

(assert (=> b!470711 (= e!275784 call!30421)))

(declare-fun b!470712 () Bool)

(declare-fun e!275783 () Bool)

(assert (=> b!470712 (= e!275783 (isEmpty!581 lt!213617))))

(declare-fun b!470713 () Bool)

(assert (=> b!470713 (= e!275783 (= lt!213617 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841)))))

(declare-fun bm!30418 () Bool)

(assert (=> bm!30418 (= call!30421 (getCurrentListMapNoExtraKeys!1998 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!841))))

(declare-fun b!470714 () Bool)

(assert (=> b!470714 (= e!275787 e!275783)))

(declare-fun c!56930 () Bool)

(assert (=> b!470714 (= c!56930 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(declare-fun b!470715 () Bool)

(assert (=> b!470715 (= e!275786 e!275787)))

(declare-fun c!56928 () Bool)

(assert (=> b!470715 (= c!56928 e!275785)))

(declare-fun res!281271 () Bool)

(assert (=> b!470715 (=> (not res!281271) (not e!275785))))

(assert (=> b!470715 (= res!281271 (bvslt #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (= (and d!75403 c!56931) b!470706))

(assert (= (and d!75403 (not c!56931)) b!470705))

(assert (= (and b!470705 c!56929) b!470710))

(assert (= (and b!470705 (not c!56929)) b!470711))

(assert (= (or b!470710 b!470711) bm!30418))

(assert (= (and d!75403 res!281269) b!470707))

(assert (= (and b!470707 res!281270) b!470715))

(assert (= (and b!470715 res!281271) b!470709))

(assert (= (and b!470715 c!56928) b!470704))

(assert (= (and b!470715 (not c!56928)) b!470714))

(assert (= (and b!470704 res!281268) b!470708))

(assert (= (and b!470714 c!56930) b!470713))

(assert (= (and b!470714 (not c!56930)) b!470712))

(declare-fun b_lambda!10155 () Bool)

(assert (=> (not b_lambda!10155) (not b!470708)))

(assert (=> b!470708 t!14652))

(declare-fun b_and!20137 () Bool)

(assert (= b_and!20135 (and (=> t!14652 result!7413) b_and!20137)))

(declare-fun b_lambda!10157 () Bool)

(assert (=> (not b_lambda!10157) (not b!470710)))

(assert (=> b!470710 t!14652))

(declare-fun b_and!20139 () Bool)

(assert (= b_and!20137 (and (=> t!14652 result!7413) b_and!20139)))

(declare-fun m!453201 () Bool)

(assert (=> b!470713 m!453201))

(assert (=> b!470704 m!453173))

(assert (=> b!470704 m!453173))

(declare-fun m!453203 () Bool)

(assert (=> b!470704 m!453203))

(declare-fun m!453205 () Bool)

(assert (=> d!75403 m!453205))

(assert (=> d!75403 m!453127))

(declare-fun m!453207 () Bool)

(assert (=> b!470712 m!453207))

(assert (=> bm!30418 m!453201))

(declare-fun m!453209 () Bool)

(assert (=> b!470710 m!453209))

(declare-fun m!453211 () Bool)

(assert (=> b!470710 m!453211))

(declare-fun m!453213 () Bool)

(assert (=> b!470710 m!453213))

(declare-fun m!453215 () Bool)

(assert (=> b!470710 m!453215))

(assert (=> b!470710 m!453189))

(assert (=> b!470710 m!453173))

(assert (=> b!470710 m!453191))

(assert (=> b!470710 m!453189))

(assert (=> b!470710 m!453193))

(assert (=> b!470710 m!453191))

(assert (=> b!470710 m!453209))

(assert (=> b!470708 m!453173))

(declare-fun m!453217 () Bool)

(assert (=> b!470708 m!453217))

(assert (=> b!470708 m!453189))

(assert (=> b!470708 m!453173))

(assert (=> b!470708 m!453191))

(assert (=> b!470708 m!453189))

(assert (=> b!470708 m!453193))

(assert (=> b!470708 m!453191))

(declare-fun m!453219 () Bool)

(assert (=> b!470707 m!453219))

(assert (=> b!470709 m!453173))

(assert (=> b!470709 m!453173))

(assert (=> b!470709 m!453199))

(assert (=> b!470705 m!453173))

(assert (=> b!470705 m!453173))

(assert (=> b!470705 m!453199))

(assert (=> b!470617 d!75403))

(declare-fun b!470726 () Bool)

(declare-fun e!275800 () Bool)

(declare-fun contains!2522 (List!8695 (_ BitVec 64)) Bool)

(assert (=> b!470726 (= e!275800 (contains!2522 Nil!8692 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470727 () Bool)

(declare-fun e!275799 () Bool)

(declare-fun call!30424 () Bool)

(assert (=> b!470727 (= e!275799 call!30424)))

(declare-fun d!75405 () Bool)

(declare-fun res!281279 () Bool)

(declare-fun e!275798 () Bool)

(assert (=> d!75405 (=> res!281279 e!275798)))

(assert (=> d!75405 (= res!281279 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75405 (= (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8692) e!275798)))

(declare-fun b!470728 () Bool)

(declare-fun e!275801 () Bool)

(assert (=> b!470728 (= e!275801 e!275799)))

(declare-fun c!56934 () Bool)

(assert (=> b!470728 (= c!56934 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun bm!30421 () Bool)

(assert (=> bm!30421 (= call!30424 (arrayNoDuplicates!0 _keys!1025 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56934 (Cons!8691 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000) Nil!8692) Nil!8692)))))

(declare-fun b!470729 () Bool)

(assert (=> b!470729 (= e!275798 e!275801)))

(declare-fun res!281278 () Bool)

(assert (=> b!470729 (=> (not res!281278) (not e!275801))))

(assert (=> b!470729 (= res!281278 (not e!275800))))

(declare-fun res!281280 () Bool)

(assert (=> b!470729 (=> (not res!281280) (not e!275800))))

(assert (=> b!470729 (= res!281280 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470730 () Bool)

(assert (=> b!470730 (= e!275799 call!30424)))

(assert (= (and d!75405 (not res!281279)) b!470729))

(assert (= (and b!470729 res!281280) b!470726))

(assert (= (and b!470729 res!281278) b!470728))

(assert (= (and b!470728 c!56934) b!470730))

(assert (= (and b!470728 (not c!56934)) b!470727))

(assert (= (or b!470730 b!470727) bm!30421))

(assert (=> b!470726 m!453173))

(assert (=> b!470726 m!453173))

(declare-fun m!453221 () Bool)

(assert (=> b!470726 m!453221))

(assert (=> b!470728 m!453173))

(assert (=> b!470728 m!453173))

(assert (=> b!470728 m!453199))

(assert (=> bm!30421 m!453173))

(declare-fun m!453223 () Bool)

(assert (=> bm!30421 m!453223))

(assert (=> b!470729 m!453173))

(assert (=> b!470729 m!453173))

(assert (=> b!470729 m!453199))

(assert (=> b!470623 d!75405))

(declare-fun bm!30424 () Bool)

(declare-fun call!30427 () Bool)

(assert (=> bm!30424 (= call!30427 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!470739 () Bool)

(declare-fun e!275810 () Bool)

(declare-fun e!275809 () Bool)

(assert (=> b!470739 (= e!275810 e!275809)))

(declare-fun lt!213626 () (_ BitVec 64))

(assert (=> b!470739 (= lt!213626 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000))))

(declare-fun lt!213627 () Unit!13779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!29998 (_ BitVec 64) (_ BitVec 32)) Unit!13779)

(assert (=> b!470739 (= lt!213627 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!213626 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!29998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!470739 (arrayContainsKey!0 _keys!1025 lt!213626 #b00000000000000000000000000000000)))

(declare-fun lt!213628 () Unit!13779)

(assert (=> b!470739 (= lt!213628 lt!213627)))

(declare-fun res!281286 () Bool)

(declare-datatypes ((SeekEntryResult!3501 0))(
  ( (MissingZero!3501 (index!16183 (_ BitVec 32))) (Found!3501 (index!16184 (_ BitVec 32))) (Intermediate!3501 (undefined!4313 Bool) (index!16185 (_ BitVec 32)) (x!44034 (_ BitVec 32))) (Undefined!3501) (MissingVacant!3501 (index!16186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!29998 (_ BitVec 32)) SeekEntryResult!3501)

(assert (=> b!470739 (= res!281286 (= (seekEntryOrOpen!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3501 #b00000000000000000000000000000000)))))

(assert (=> b!470739 (=> (not res!281286) (not e!275809))))

(declare-fun b!470740 () Bool)

(assert (=> b!470740 (= e!275810 call!30427)))

(declare-fun b!470741 () Bool)

(declare-fun e!275808 () Bool)

(assert (=> b!470741 (= e!275808 e!275810)))

(declare-fun c!56937 () Bool)

(assert (=> b!470741 (= c!56937 (validKeyInArray!0 (select (arr!14422 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!470742 () Bool)

(assert (=> b!470742 (= e!275809 call!30427)))

(declare-fun d!75407 () Bool)

(declare-fun res!281285 () Bool)

(assert (=> d!75407 (=> res!281285 e!275808)))

(assert (=> d!75407 (= res!281285 (bvsge #b00000000000000000000000000000000 (size!14774 _keys!1025)))))

(assert (=> d!75407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!275808)))

(assert (= (and d!75407 (not res!281285)) b!470741))

(assert (= (and b!470741 c!56937) b!470739))

(assert (= (and b!470741 (not c!56937)) b!470740))

(assert (= (and b!470739 res!281286) b!470742))

(assert (= (or b!470742 b!470740) bm!30424))

(declare-fun m!453225 () Bool)

(assert (=> bm!30424 m!453225))

(assert (=> b!470739 m!453173))

(declare-fun m!453227 () Bool)

(assert (=> b!470739 m!453227))

(declare-fun m!453229 () Bool)

(assert (=> b!470739 m!453229))

(assert (=> b!470739 m!453173))

(declare-fun m!453231 () Bool)

(assert (=> b!470739 m!453231))

(assert (=> b!470741 m!453173))

(assert (=> b!470741 m!453173))

(assert (=> b!470741 m!453199))

(assert (=> b!470618 d!75407))

(declare-fun b!470749 () Bool)

(declare-fun e!275815 () Bool)

(assert (=> b!470749 (= e!275815 tp_is_empty!13123)))

(declare-fun mapNonEmpty!21394 () Bool)

(declare-fun mapRes!21394 () Bool)

(declare-fun tp!41122 () Bool)

(assert (=> mapNonEmpty!21394 (= mapRes!21394 (and tp!41122 e!275815))))

(declare-fun mapValue!21394 () ValueCell!6218)

(declare-fun mapKey!21394 () (_ BitVec 32))

(declare-fun mapRest!21394 () (Array (_ BitVec 32) ValueCell!6218))

(assert (=> mapNonEmpty!21394 (= mapRest!21385 (store mapRest!21394 mapKey!21394 mapValue!21394))))

(declare-fun condMapEmpty!21394 () Bool)

(declare-fun mapDefault!21394 () ValueCell!6218)

(assert (=> mapNonEmpty!21385 (= condMapEmpty!21394 (= mapRest!21385 ((as const (Array (_ BitVec 32) ValueCell!6218)) mapDefault!21394)))))

(declare-fun e!275816 () Bool)

(assert (=> mapNonEmpty!21385 (= tp!41106 (and e!275816 mapRes!21394))))

(declare-fun b!470750 () Bool)

(assert (=> b!470750 (= e!275816 tp_is_empty!13123)))

(declare-fun mapIsEmpty!21394 () Bool)

(assert (=> mapIsEmpty!21394 mapRes!21394))

(assert (= (and mapNonEmpty!21385 condMapEmpty!21394) mapIsEmpty!21394))

(assert (= (and mapNonEmpty!21385 (not condMapEmpty!21394)) mapNonEmpty!21394))

(assert (= (and mapNonEmpty!21394 ((_ is ValueCellFull!6218) mapValue!21394)) b!470749))

(assert (= (and mapNonEmpty!21385 ((_ is ValueCellFull!6218) mapDefault!21394)) b!470750))

(declare-fun m!453233 () Bool)

(assert (=> mapNonEmpty!21394 m!453233))

(declare-fun b_lambda!10159 () Bool)

(assert (= b_lambda!10155 (or (and start!42148 b_free!11695) b_lambda!10159)))

(declare-fun b_lambda!10161 () Bool)

(assert (= b_lambda!10153 (or (and start!42148 b_free!11695) b_lambda!10161)))

(declare-fun b_lambda!10163 () Bool)

(assert (= b_lambda!10157 (or (and start!42148 b_free!11695) b_lambda!10163)))

(declare-fun b_lambda!10165 () Bool)

(assert (= b_lambda!10151 (or (and start!42148 b_free!11695) b_lambda!10165)))

(check-sat (not d!75403) (not b_lambda!10161) tp_is_empty!13123 (not b!470694) (not b!470712) (not b!470696) (not b!470713) (not d!75399) (not b_next!11695) (not b!470693) (not b_lambda!10163) (not b!470699) (not bm!30421) (not bm!30418) (not b!470690) (not d!75401) (not bm!30424) (not b_lambda!10159) (not b!470728) (not b!470698) (not b!470708) (not b!470704) b_and!20139 (not b!470707) (not b!470695) (not b!470726) (not b_lambda!10165) (not b!470729) (not b!470709) (not b!470691) (not b!470739) (not b!470705) (not b!470710) (not mapNonEmpty!21394) (not bm!30417) (not b!470741))
(check-sat b_and!20139 (not b_next!11695))
