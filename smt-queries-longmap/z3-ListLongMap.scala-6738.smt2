; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84418 () Bool)

(assert start!84418)

(declare-fun b_free!19989 () Bool)

(declare-fun b_next!19989 () Bool)

(assert (=> start!84418 (= b_free!19989 (not b_next!19989))))

(declare-fun tp!69744 () Bool)

(declare-fun b_and!32041 () Bool)

(assert (=> start!84418 (= tp!69744 b_and!32041)))

(declare-fun b!987438 () Bool)

(declare-fun res!660592 () Bool)

(declare-fun e!556802 () Bool)

(assert (=> b!987438 (=> (not res!660592) (not e!556802))))

(declare-datatypes ((array!62367 0))(
  ( (array!62368 (arr!30040 (Array (_ BitVec 32) (_ BitVec 64))) (size!30519 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62367)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62367 (_ BitVec 32)) Bool)

(assert (=> b!987438 (= res!660592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987439 () Bool)

(declare-fun res!660596 () Bool)

(assert (=> b!987439 (=> (not res!660596) (not e!556802))))

(declare-datatypes ((List!20774 0))(
  ( (Nil!20771) (Cons!20770 (h!21932 (_ BitVec 64)) (t!29691 List!20774)) )
))
(declare-fun arrayNoDuplicates!0 (array!62367 (_ BitVec 32) List!20774) Bool)

(assert (=> b!987439 (= res!660596 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20771))))

(declare-fun b!987440 () Bool)

(declare-fun res!660595 () Bool)

(assert (=> b!987440 (=> (not res!660595) (not e!556802))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987440 (= res!660595 (validKeyInArray!0 (select (arr!30040 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36839 () Bool)

(declare-fun mapRes!36839 () Bool)

(assert (=> mapIsEmpty!36839 mapRes!36839))

(declare-fun b!987441 () Bool)

(declare-fun e!556801 () Bool)

(declare-fun tp_is_empty!23205 () Bool)

(assert (=> b!987441 (= e!556801 tp_is_empty!23205)))

(declare-fun b!987442 () Bool)

(declare-fun e!556803 () Bool)

(declare-fun e!556800 () Bool)

(assert (=> b!987442 (= e!556803 (and e!556800 mapRes!36839))))

(declare-fun condMapEmpty!36839 () Bool)

(declare-datatypes ((V!35923 0))(
  ( (V!35924 (val!11653 Int)) )
))
(declare-datatypes ((ValueCell!11121 0))(
  ( (ValueCellFull!11121 (v!14216 V!35923)) (EmptyCell!11121) )
))
(declare-datatypes ((array!62369 0))(
  ( (array!62370 (arr!30041 (Array (_ BitVec 32) ValueCell!11121)) (size!30520 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62369)

(declare-fun mapDefault!36839 () ValueCell!11121)

(assert (=> b!987442 (= condMapEmpty!36839 (= (arr!30041 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11121)) mapDefault!36839)))))

(declare-fun res!660593 () Bool)

(assert (=> start!84418 (=> (not res!660593) (not e!556802))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84418 (= res!660593 (validMask!0 mask!1948))))

(assert (=> start!84418 e!556802))

(assert (=> start!84418 true))

(assert (=> start!84418 tp_is_empty!23205))

(declare-fun array_inv!23209 (array!62369) Bool)

(assert (=> start!84418 (and (array_inv!23209 _values!1278) e!556803)))

(assert (=> start!84418 tp!69744))

(declare-fun array_inv!23210 (array!62367) Bool)

(assert (=> start!84418 (array_inv!23210 _keys!1544)))

(declare-fun mapNonEmpty!36839 () Bool)

(declare-fun tp!69745 () Bool)

(assert (=> mapNonEmpty!36839 (= mapRes!36839 (and tp!69745 e!556801))))

(declare-fun mapKey!36839 () (_ BitVec 32))

(declare-fun mapValue!36839 () ValueCell!11121)

(declare-fun mapRest!36839 () (Array (_ BitVec 32) ValueCell!11121))

(assert (=> mapNonEmpty!36839 (= (arr!30041 _values!1278) (store mapRest!36839 mapKey!36839 mapValue!36839))))

(declare-fun b!987443 () Bool)

(declare-fun res!660590 () Bool)

(assert (=> b!987443 (=> (not res!660590) (not e!556802))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987443 (= res!660590 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987444 () Bool)

(declare-fun res!660591 () Bool)

(assert (=> b!987444 (=> (not res!660591) (not e!556802))))

(assert (=> b!987444 (= res!660591 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30519 _keys!1544))))))

(declare-fun b!987445 () Bool)

(assert (=> b!987445 (= e!556802 (not (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30040 _keys!1544) from!1932)))))))

(declare-datatypes ((tuple2!14844 0))(
  ( (tuple2!14845 (_1!7433 (_ BitVec 64)) (_2!7433 V!35923)) )
))
(declare-datatypes ((List!20775 0))(
  ( (Nil!20772) (Cons!20771 (h!21933 tuple2!14844) (t!29692 List!20775)) )
))
(declare-datatypes ((ListLongMap!13541 0))(
  ( (ListLongMap!13542 (toList!6786 List!20775)) )
))
(declare-fun lt!437740 () ListLongMap!13541)

(declare-fun lt!437738 () tuple2!14844)

(declare-fun lt!437741 () tuple2!14844)

(declare-fun +!3071 (ListLongMap!13541 tuple2!14844) ListLongMap!13541)

(assert (=> b!987445 (= (+!3071 (+!3071 lt!437740 lt!437738) lt!437741) (+!3071 (+!3071 lt!437740 lt!437741) lt!437738))))

(declare-fun lt!437737 () V!35923)

(assert (=> b!987445 (= lt!437741 (tuple2!14845 (select (arr!30040 _keys!1544) from!1932) lt!437737))))

(declare-fun minValue!1220 () V!35923)

(assert (=> b!987445 (= lt!437738 (tuple2!14845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32775 0))(
  ( (Unit!32776) )
))
(declare-fun lt!437739 () Unit!32775)

(declare-fun addCommutativeForDiffKeys!695 (ListLongMap!13541 (_ BitVec 64) V!35923 (_ BitVec 64) V!35923) Unit!32775)

(assert (=> b!987445 (= lt!437739 (addCommutativeForDiffKeys!695 lt!437740 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30040 _keys!1544) from!1932) lt!437737))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15583 (ValueCell!11121 V!35923) V!35923)

(declare-fun dynLambda!1854 (Int (_ BitVec 64)) V!35923)

(assert (=> b!987445 (= lt!437737 (get!15583 (select (arr!30041 _values!1278) from!1932) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35923)

(declare-fun getCurrentListMapNoExtraKeys!3477 (array!62367 array!62369 (_ BitVec 32) (_ BitVec 32) V!35923 V!35923 (_ BitVec 32) Int) ListLongMap!13541)

(assert (=> b!987445 (= lt!437740 (+!3071 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987446 () Bool)

(declare-fun res!660594 () Bool)

(assert (=> b!987446 (=> (not res!660594) (not e!556802))))

(assert (=> b!987446 (= res!660594 (and (= (size!30520 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30519 _keys!1544) (size!30520 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987447 () Bool)

(assert (=> b!987447 (= e!556800 tp_is_empty!23205)))

(assert (= (and start!84418 res!660593) b!987446))

(assert (= (and b!987446 res!660594) b!987438))

(assert (= (and b!987438 res!660592) b!987439))

(assert (= (and b!987439 res!660596) b!987444))

(assert (= (and b!987444 res!660591) b!987440))

(assert (= (and b!987440 res!660595) b!987443))

(assert (= (and b!987443 res!660590) b!987445))

(assert (= (and b!987442 condMapEmpty!36839) mapIsEmpty!36839))

(assert (= (and b!987442 (not condMapEmpty!36839)) mapNonEmpty!36839))

(get-info :version)

(assert (= (and mapNonEmpty!36839 ((_ is ValueCellFull!11121) mapValue!36839)) b!987441))

(assert (= (and b!987442 ((_ is ValueCellFull!11121) mapDefault!36839)) b!987447))

(assert (= start!84418 b!987442))

(declare-fun b_lambda!15011 () Bool)

(assert (=> (not b_lambda!15011) (not b!987445)))

(declare-fun t!29690 () Bool)

(declare-fun tb!6767 () Bool)

(assert (=> (and start!84418 (= defaultEntry!1281 defaultEntry!1281) t!29690) tb!6767))

(declare-fun result!13525 () Bool)

(assert (=> tb!6767 (= result!13525 tp_is_empty!23205)))

(assert (=> b!987445 t!29690))

(declare-fun b_and!32043 () Bool)

(assert (= b_and!32041 (and (=> t!29690 result!13525) b_and!32043)))

(declare-fun m!914035 () Bool)

(assert (=> b!987445 m!914035))

(declare-fun m!914037 () Bool)

(assert (=> b!987445 m!914037))

(declare-fun m!914039 () Bool)

(assert (=> b!987445 m!914039))

(declare-fun m!914041 () Bool)

(assert (=> b!987445 m!914041))

(assert (=> b!987445 m!914037))

(declare-fun m!914043 () Bool)

(assert (=> b!987445 m!914043))

(assert (=> b!987445 m!914039))

(declare-fun m!914045 () Bool)

(assert (=> b!987445 m!914045))

(declare-fun m!914047 () Bool)

(assert (=> b!987445 m!914047))

(assert (=> b!987445 m!914035))

(declare-fun m!914049 () Bool)

(assert (=> b!987445 m!914049))

(assert (=> b!987445 m!914047))

(declare-fun m!914051 () Bool)

(assert (=> b!987445 m!914051))

(declare-fun m!914053 () Bool)

(assert (=> b!987445 m!914053))

(assert (=> b!987445 m!914041))

(assert (=> b!987445 m!914053))

(declare-fun m!914055 () Bool)

(assert (=> b!987445 m!914055))

(declare-fun m!914057 () Bool)

(assert (=> start!84418 m!914057))

(declare-fun m!914059 () Bool)

(assert (=> start!84418 m!914059))

(declare-fun m!914061 () Bool)

(assert (=> start!84418 m!914061))

(declare-fun m!914063 () Bool)

(assert (=> b!987438 m!914063))

(declare-fun m!914065 () Bool)

(assert (=> b!987439 m!914065))

(assert (=> b!987440 m!914039))

(assert (=> b!987440 m!914039))

(declare-fun m!914067 () Bool)

(assert (=> b!987440 m!914067))

(declare-fun m!914069 () Bool)

(assert (=> mapNonEmpty!36839 m!914069))

(check-sat (not b!987445) tp_is_empty!23205 b_and!32043 (not start!84418) (not b_next!19989) (not b_lambda!15011) (not mapNonEmpty!36839) (not b!987439) (not b!987440) (not b!987438))
(check-sat b_and!32043 (not b_next!19989))
(get-model)

(declare-fun b_lambda!15015 () Bool)

(assert (= b_lambda!15011 (or (and start!84418 b_free!19989) b_lambda!15015)))

(check-sat (not b_lambda!15015) (not b!987445) tp_is_empty!23205 b_and!32043 (not start!84418) (not b_next!19989) (not mapNonEmpty!36839) (not b!987439) (not b!987440) (not b!987438))
(check-sat b_and!32043 (not b_next!19989))
(get-model)

(declare-fun b!987492 () Bool)

(declare-fun e!556829 () Bool)

(declare-fun call!41805 () Bool)

(assert (=> b!987492 (= e!556829 call!41805)))

(declare-fun d!116925 () Bool)

(declare-fun res!660626 () Bool)

(declare-fun e!556830 () Bool)

(assert (=> d!116925 (=> res!660626 e!556830)))

(assert (=> d!116925 (= res!660626 (bvsge #b00000000000000000000000000000000 (size!30519 _keys!1544)))))

(assert (=> d!116925 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20771) e!556830)))

(declare-fun b!987493 () Bool)

(declare-fun e!556827 () Bool)

(declare-fun contains!5710 (List!20774 (_ BitVec 64)) Bool)

(assert (=> b!987493 (= e!556827 (contains!5710 Nil!20771 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41802 () Bool)

(declare-fun c!100043 () Bool)

(assert (=> bm!41802 (= call!41805 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100043 (Cons!20770 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000) Nil!20771) Nil!20771)))))

(declare-fun b!987494 () Bool)

(declare-fun e!556828 () Bool)

(assert (=> b!987494 (= e!556830 e!556828)))

(declare-fun res!660624 () Bool)

(assert (=> b!987494 (=> (not res!660624) (not e!556828))))

(assert (=> b!987494 (= res!660624 (not e!556827))))

(declare-fun res!660625 () Bool)

(assert (=> b!987494 (=> (not res!660625) (not e!556827))))

(assert (=> b!987494 (= res!660625 (validKeyInArray!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!987495 () Bool)

(assert (=> b!987495 (= e!556829 call!41805)))

(declare-fun b!987496 () Bool)

(assert (=> b!987496 (= e!556828 e!556829)))

(assert (=> b!987496 (= c!100043 (validKeyInArray!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(assert (= (and d!116925 (not res!660626)) b!987494))

(assert (= (and b!987494 res!660625) b!987493))

(assert (= (and b!987494 res!660624) b!987496))

(assert (= (and b!987496 c!100043) b!987492))

(assert (= (and b!987496 (not c!100043)) b!987495))

(assert (= (or b!987492 b!987495) bm!41802))

(declare-fun m!914107 () Bool)

(assert (=> b!987493 m!914107))

(assert (=> b!987493 m!914107))

(declare-fun m!914109 () Bool)

(assert (=> b!987493 m!914109))

(assert (=> bm!41802 m!914107))

(declare-fun m!914111 () Bool)

(assert (=> bm!41802 m!914111))

(assert (=> b!987494 m!914107))

(assert (=> b!987494 m!914107))

(declare-fun m!914113 () Bool)

(assert (=> b!987494 m!914113))

(assert (=> b!987496 m!914107))

(assert (=> b!987496 m!914107))

(assert (=> b!987496 m!914113))

(assert (=> b!987439 d!116925))

(declare-fun d!116927 () Bool)

(assert (=> d!116927 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84418 d!116927))

(declare-fun d!116929 () Bool)

(assert (=> d!116929 (= (array_inv!23209 _values!1278) (bvsge (size!30520 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84418 d!116929))

(declare-fun d!116931 () Bool)

(assert (=> d!116931 (= (array_inv!23210 _keys!1544) (bvsge (size!30519 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84418 d!116931))

(declare-fun bm!41805 () Bool)

(declare-fun call!41808 () Bool)

(assert (=> bm!41805 (= call!41808 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!987505 () Bool)

(declare-fun e!556837 () Bool)

(assert (=> b!987505 (= e!556837 call!41808)))

(declare-fun b!987506 () Bool)

(declare-fun e!556839 () Bool)

(assert (=> b!987506 (= e!556837 e!556839)))

(declare-fun lt!437763 () (_ BitVec 64))

(assert (=> b!987506 (= lt!437763 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000))))

(declare-fun lt!437765 () Unit!32775)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62367 (_ BitVec 64) (_ BitVec 32)) Unit!32775)

(assert (=> b!987506 (= lt!437765 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!437763 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!987506 (arrayContainsKey!0 _keys!1544 lt!437763 #b00000000000000000000000000000000)))

(declare-fun lt!437764 () Unit!32775)

(assert (=> b!987506 (= lt!437764 lt!437765)))

(declare-fun res!660632 () Bool)

(declare-datatypes ((SeekEntryResult!9207 0))(
  ( (MissingZero!9207 (index!39199 (_ BitVec 32))) (Found!9207 (index!39200 (_ BitVec 32))) (Intermediate!9207 (undefined!10019 Bool) (index!39201 (_ BitVec 32)) (x!85944 (_ BitVec 32))) (Undefined!9207) (MissingVacant!9207 (index!39202 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62367 (_ BitVec 32)) SeekEntryResult!9207)

(assert (=> b!987506 (= res!660632 (= (seekEntryOrOpen!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9207 #b00000000000000000000000000000000)))))

(assert (=> b!987506 (=> (not res!660632) (not e!556839))))

(declare-fun b!987507 () Bool)

(assert (=> b!987507 (= e!556839 call!41808)))

(declare-fun b!987508 () Bool)

(declare-fun e!556838 () Bool)

(assert (=> b!987508 (= e!556838 e!556837)))

(declare-fun c!100046 () Bool)

(assert (=> b!987508 (= c!100046 (validKeyInArray!0 (select (arr!30040 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun d!116933 () Bool)

(declare-fun res!660631 () Bool)

(assert (=> d!116933 (=> res!660631 e!556838)))

(assert (=> d!116933 (= res!660631 (bvsge #b00000000000000000000000000000000 (size!30519 _keys!1544)))))

(assert (=> d!116933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!556838)))

(assert (= (and d!116933 (not res!660631)) b!987508))

(assert (= (and b!987508 c!100046) b!987506))

(assert (= (and b!987508 (not c!100046)) b!987505))

(assert (= (and b!987506 res!660632) b!987507))

(assert (= (or b!987507 b!987505) bm!41805))

(declare-fun m!914115 () Bool)

(assert (=> bm!41805 m!914115))

(assert (=> b!987506 m!914107))

(declare-fun m!914117 () Bool)

(assert (=> b!987506 m!914117))

(declare-fun m!914119 () Bool)

(assert (=> b!987506 m!914119))

(assert (=> b!987506 m!914107))

(declare-fun m!914121 () Bool)

(assert (=> b!987506 m!914121))

(assert (=> b!987508 m!914107))

(assert (=> b!987508 m!914107))

(assert (=> b!987508 m!914113))

(assert (=> b!987438 d!116933))

(declare-fun d!116935 () Bool)

(declare-fun c!100049 () Bool)

(assert (=> d!116935 (= c!100049 ((_ is ValueCellFull!11121) (select (arr!30041 _values!1278) from!1932)))))

(declare-fun e!556842 () V!35923)

(assert (=> d!116935 (= (get!15583 (select (arr!30041 _values!1278) from!1932) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)) e!556842)))

(declare-fun b!987513 () Bool)

(declare-fun get!15585 (ValueCell!11121 V!35923) V!35923)

(assert (=> b!987513 (= e!556842 (get!15585 (select (arr!30041 _values!1278) from!1932) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987514 () Bool)

(declare-fun get!15586 (ValueCell!11121 V!35923) V!35923)

(assert (=> b!987514 (= e!556842 (get!15586 (select (arr!30041 _values!1278) from!1932) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!116935 c!100049) b!987513))

(assert (= (and d!116935 (not c!100049)) b!987514))

(assert (=> b!987513 m!914041))

(assert (=> b!987513 m!914053))

(declare-fun m!914123 () Bool)

(assert (=> b!987513 m!914123))

(assert (=> b!987514 m!914041))

(assert (=> b!987514 m!914053))

(declare-fun m!914125 () Bool)

(assert (=> b!987514 m!914125))

(assert (=> b!987445 d!116935))

(declare-fun e!556858 () Bool)

(declare-fun b!987539 () Bool)

(declare-fun lt!437785 () ListLongMap!13541)

(assert (=> b!987539 (= e!556858 (= lt!437785 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!987540 () Bool)

(declare-fun e!556861 () Bool)

(assert (=> b!987540 (= e!556861 e!556858)))

(declare-fun c!100061 () Bool)

(assert (=> b!987540 (= c!100061 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(declare-fun b!987541 () Bool)

(declare-fun res!660642 () Bool)

(declare-fun e!556863 () Bool)

(assert (=> b!987541 (=> (not res!660642) (not e!556863))))

(declare-fun contains!5711 (ListLongMap!13541 (_ BitVec 64)) Bool)

(assert (=> b!987541 (= res!660642 (not (contains!5711 lt!437785 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!987542 () Bool)

(declare-fun e!556860 () ListLongMap!13541)

(declare-fun e!556857 () ListLongMap!13541)

(assert (=> b!987542 (= e!556860 e!556857)))

(declare-fun c!100059 () Bool)

(assert (=> b!987542 (= c!100059 (validKeyInArray!0 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!987543 () Bool)

(declare-fun e!556859 () Bool)

(assert (=> b!987543 (= e!556861 e!556859)))

(assert (=> b!987543 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(declare-fun res!660643 () Bool)

(assert (=> b!987543 (= res!660643 (contains!5711 lt!437785 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987543 (=> (not res!660643) (not e!556859))))

(declare-fun call!41811 () ListLongMap!13541)

(declare-fun bm!41808 () Bool)

(assert (=> bm!41808 (= call!41811 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun b!987544 () Bool)

(declare-fun e!556862 () Bool)

(assert (=> b!987544 (= e!556862 (validKeyInArray!0 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!987544 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!987546 () Bool)

(assert (=> b!987546 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(assert (=> b!987546 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30520 _values!1278)))))

(declare-fun apply!892 (ListLongMap!13541 (_ BitVec 64)) V!35923)

(assert (=> b!987546 (= e!556859 (= (apply!892 lt!437785 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15583 (select (arr!30041 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!987547 () Bool)

(assert (=> b!987547 (= e!556863 e!556861)))

(declare-fun c!100058 () Bool)

(assert (=> b!987547 (= c!100058 e!556862)))

(declare-fun res!660644 () Bool)

(assert (=> b!987547 (=> (not res!660644) (not e!556862))))

(assert (=> b!987547 (= res!660644 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(declare-fun b!987548 () Bool)

(assert (=> b!987548 (= e!556857 call!41811)))

(declare-fun b!987549 () Bool)

(assert (=> b!987549 (= e!556860 (ListLongMap!13542 Nil!20772))))

(declare-fun b!987550 () Bool)

(declare-fun isEmpty!719 (ListLongMap!13541) Bool)

(assert (=> b!987550 (= e!556858 (isEmpty!719 lt!437785))))

(declare-fun b!987545 () Bool)

(declare-fun lt!437786 () Unit!32775)

(declare-fun lt!437781 () Unit!32775)

(assert (=> b!987545 (= lt!437786 lt!437781)))

(declare-fun lt!437780 () (_ BitVec 64))

(declare-fun lt!437784 () V!35923)

(declare-fun lt!437782 () ListLongMap!13541)

(declare-fun lt!437783 () (_ BitVec 64))

(assert (=> b!987545 (not (contains!5711 (+!3071 lt!437782 (tuple2!14845 lt!437783 lt!437784)) lt!437780))))

(declare-fun addStillNotContains!231 (ListLongMap!13541 (_ BitVec 64) V!35923 (_ BitVec 64)) Unit!32775)

(assert (=> b!987545 (= lt!437781 (addStillNotContains!231 lt!437782 lt!437783 lt!437784 lt!437780))))

(assert (=> b!987545 (= lt!437780 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!987545 (= lt!437784 (get!15583 (select (arr!30041 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987545 (= lt!437783 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!987545 (= lt!437782 call!41811)))

(assert (=> b!987545 (= e!556857 (+!3071 call!41811 (tuple2!14845 (select (arr!30040 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15583 (select (arr!30041 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1854 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun d!116937 () Bool)

(assert (=> d!116937 e!556863))

(declare-fun res!660641 () Bool)

(assert (=> d!116937 (=> (not res!660641) (not e!556863))))

(assert (=> d!116937 (= res!660641 (not (contains!5711 lt!437785 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!116937 (= lt!437785 e!556860)))

(declare-fun c!100060 () Bool)

(assert (=> d!116937 (= c!100060 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30519 _keys!1544)))))

(assert (=> d!116937 (validMask!0 mask!1948)))

(assert (=> d!116937 (= (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!437785)))

(assert (= (and d!116937 c!100060) b!987549))

(assert (= (and d!116937 (not c!100060)) b!987542))

(assert (= (and b!987542 c!100059) b!987545))

(assert (= (and b!987542 (not c!100059)) b!987548))

(assert (= (or b!987545 b!987548) bm!41808))

(assert (= (and d!116937 res!660641) b!987541))

(assert (= (and b!987541 res!660642) b!987547))

(assert (= (and b!987547 res!660644) b!987544))

(assert (= (and b!987547 c!100058) b!987543))

(assert (= (and b!987547 (not c!100058)) b!987540))

(assert (= (and b!987543 res!660643) b!987546))

(assert (= (and b!987540 c!100061) b!987539))

(assert (= (and b!987540 (not c!100061)) b!987550))

(declare-fun b_lambda!15017 () Bool)

(assert (=> (not b_lambda!15017) (not b!987546)))

(assert (=> b!987546 t!29690))

(declare-fun b_and!32049 () Bool)

(assert (= b_and!32043 (and (=> t!29690 result!13525) b_and!32049)))

(declare-fun b_lambda!15019 () Bool)

(assert (=> (not b_lambda!15019) (not b!987545)))

(assert (=> b!987545 t!29690))

(declare-fun b_and!32051 () Bool)

(assert (= b_and!32049 (and (=> t!29690 result!13525) b_and!32051)))

(declare-fun m!914127 () Bool)

(assert (=> b!987539 m!914127))

(declare-fun m!914129 () Bool)

(assert (=> b!987543 m!914129))

(assert (=> b!987543 m!914129))

(declare-fun m!914131 () Bool)

(assert (=> b!987543 m!914131))

(assert (=> b!987546 m!914129))

(declare-fun m!914133 () Bool)

(assert (=> b!987546 m!914133))

(assert (=> b!987546 m!914129))

(declare-fun m!914135 () Bool)

(assert (=> b!987546 m!914135))

(assert (=> b!987546 m!914053))

(assert (=> b!987546 m!914135))

(assert (=> b!987546 m!914053))

(declare-fun m!914137 () Bool)

(assert (=> b!987546 m!914137))

(assert (=> bm!41808 m!914127))

(declare-fun m!914139 () Bool)

(assert (=> b!987550 m!914139))

(assert (=> b!987544 m!914129))

(assert (=> b!987544 m!914129))

(declare-fun m!914141 () Bool)

(assert (=> b!987544 m!914141))

(declare-fun m!914143 () Bool)

(assert (=> b!987541 m!914143))

(assert (=> b!987542 m!914129))

(assert (=> b!987542 m!914129))

(assert (=> b!987542 m!914141))

(assert (=> b!987545 m!914129))

(declare-fun m!914145 () Bool)

(assert (=> b!987545 m!914145))

(declare-fun m!914147 () Bool)

(assert (=> b!987545 m!914147))

(assert (=> b!987545 m!914053))

(assert (=> b!987545 m!914147))

(declare-fun m!914149 () Bool)

(assert (=> b!987545 m!914149))

(assert (=> b!987545 m!914135))

(assert (=> b!987545 m!914053))

(assert (=> b!987545 m!914137))

(declare-fun m!914151 () Bool)

(assert (=> b!987545 m!914151))

(assert (=> b!987545 m!914135))

(declare-fun m!914153 () Bool)

(assert (=> d!116937 m!914153))

(assert (=> d!116937 m!914057))

(assert (=> b!987445 d!116937))

(declare-fun d!116939 () Bool)

(declare-fun e!556866 () Bool)

(assert (=> d!116939 e!556866))

(declare-fun res!660650 () Bool)

(assert (=> d!116939 (=> (not res!660650) (not e!556866))))

(declare-fun lt!437798 () ListLongMap!13541)

(assert (=> d!116939 (= res!660650 (contains!5711 lt!437798 (_1!7433 lt!437738)))))

(declare-fun lt!437797 () List!20775)

(assert (=> d!116939 (= lt!437798 (ListLongMap!13542 lt!437797))))

(declare-fun lt!437795 () Unit!32775)

(declare-fun lt!437796 () Unit!32775)

(assert (=> d!116939 (= lt!437795 lt!437796)))

(declare-datatypes ((Option!517 0))(
  ( (Some!516 (v!14218 V!35923)) (None!515) )
))
(declare-fun getValueByKey!511 (List!20775 (_ BitVec 64)) Option!517)

(assert (=> d!116939 (= (getValueByKey!511 lt!437797 (_1!7433 lt!437738)) (Some!516 (_2!7433 lt!437738)))))

(declare-fun lemmaContainsTupThenGetReturnValue!270 (List!20775 (_ BitVec 64) V!35923) Unit!32775)

(assert (=> d!116939 (= lt!437796 (lemmaContainsTupThenGetReturnValue!270 lt!437797 (_1!7433 lt!437738) (_2!7433 lt!437738)))))

(declare-fun insertStrictlySorted!327 (List!20775 (_ BitVec 64) V!35923) List!20775)

(assert (=> d!116939 (= lt!437797 (insertStrictlySorted!327 (toList!6786 (+!3071 lt!437740 lt!437741)) (_1!7433 lt!437738) (_2!7433 lt!437738)))))

(assert (=> d!116939 (= (+!3071 (+!3071 lt!437740 lt!437741) lt!437738) lt!437798)))

(declare-fun b!987555 () Bool)

(declare-fun res!660649 () Bool)

(assert (=> b!987555 (=> (not res!660649) (not e!556866))))

(assert (=> b!987555 (= res!660649 (= (getValueByKey!511 (toList!6786 lt!437798) (_1!7433 lt!437738)) (Some!516 (_2!7433 lt!437738))))))

(declare-fun b!987556 () Bool)

(declare-fun contains!5712 (List!20775 tuple2!14844) Bool)

(assert (=> b!987556 (= e!556866 (contains!5712 (toList!6786 lt!437798) lt!437738))))

(assert (= (and d!116939 res!660650) b!987555))

(assert (= (and b!987555 res!660649) b!987556))

(declare-fun m!914155 () Bool)

(assert (=> d!116939 m!914155))

(declare-fun m!914157 () Bool)

(assert (=> d!116939 m!914157))

(declare-fun m!914159 () Bool)

(assert (=> d!116939 m!914159))

(declare-fun m!914161 () Bool)

(assert (=> d!116939 m!914161))

(declare-fun m!914163 () Bool)

(assert (=> b!987555 m!914163))

(declare-fun m!914165 () Bool)

(assert (=> b!987556 m!914165))

(assert (=> b!987445 d!116939))

(declare-fun d!116941 () Bool)

(assert (=> d!116941 (= (+!3071 (+!3071 lt!437740 (tuple2!14845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)) (tuple2!14845 (select (arr!30040 _keys!1544) from!1932) lt!437737)) (+!3071 (+!3071 lt!437740 (tuple2!14845 (select (arr!30040 _keys!1544) from!1932) lt!437737)) (tuple2!14845 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220)))))

(declare-fun lt!437801 () Unit!32775)

(declare-fun choose!1604 (ListLongMap!13541 (_ BitVec 64) V!35923 (_ BitVec 64) V!35923) Unit!32775)

(assert (=> d!116941 (= lt!437801 (choose!1604 lt!437740 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30040 _keys!1544) from!1932) lt!437737))))

(assert (=> d!116941 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30040 _keys!1544) from!1932)))))

(assert (=> d!116941 (= (addCommutativeForDiffKeys!695 lt!437740 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30040 _keys!1544) from!1932) lt!437737) lt!437801)))

(declare-fun bs!28021 () Bool)

(assert (= bs!28021 d!116941))

(declare-fun m!914167 () Bool)

(assert (=> bs!28021 m!914167))

(declare-fun m!914169 () Bool)

(assert (=> bs!28021 m!914169))

(assert (=> bs!28021 m!914169))

(declare-fun m!914171 () Bool)

(assert (=> bs!28021 m!914171))

(assert (=> bs!28021 m!914167))

(declare-fun m!914173 () Bool)

(assert (=> bs!28021 m!914173))

(assert (=> bs!28021 m!914039))

(declare-fun m!914175 () Bool)

(assert (=> bs!28021 m!914175))

(assert (=> b!987445 d!116941))

(declare-fun d!116943 () Bool)

(declare-fun e!556867 () Bool)

(assert (=> d!116943 e!556867))

(declare-fun res!660652 () Bool)

(assert (=> d!116943 (=> (not res!660652) (not e!556867))))

(declare-fun lt!437805 () ListLongMap!13541)

(assert (=> d!116943 (= res!660652 (contains!5711 lt!437805 (_1!7433 lt!437741)))))

(declare-fun lt!437804 () List!20775)

(assert (=> d!116943 (= lt!437805 (ListLongMap!13542 lt!437804))))

(declare-fun lt!437802 () Unit!32775)

(declare-fun lt!437803 () Unit!32775)

(assert (=> d!116943 (= lt!437802 lt!437803)))

(assert (=> d!116943 (= (getValueByKey!511 lt!437804 (_1!7433 lt!437741)) (Some!516 (_2!7433 lt!437741)))))

(assert (=> d!116943 (= lt!437803 (lemmaContainsTupThenGetReturnValue!270 lt!437804 (_1!7433 lt!437741) (_2!7433 lt!437741)))))

(assert (=> d!116943 (= lt!437804 (insertStrictlySorted!327 (toList!6786 (+!3071 lt!437740 lt!437738)) (_1!7433 lt!437741) (_2!7433 lt!437741)))))

(assert (=> d!116943 (= (+!3071 (+!3071 lt!437740 lt!437738) lt!437741) lt!437805)))

(declare-fun b!987557 () Bool)

(declare-fun res!660651 () Bool)

(assert (=> b!987557 (=> (not res!660651) (not e!556867))))

(assert (=> b!987557 (= res!660651 (= (getValueByKey!511 (toList!6786 lt!437805) (_1!7433 lt!437741)) (Some!516 (_2!7433 lt!437741))))))

(declare-fun b!987558 () Bool)

(assert (=> b!987558 (= e!556867 (contains!5712 (toList!6786 lt!437805) lt!437741))))

(assert (= (and d!116943 res!660652) b!987557))

(assert (= (and b!987557 res!660651) b!987558))

(declare-fun m!914177 () Bool)

(assert (=> d!116943 m!914177))

(declare-fun m!914179 () Bool)

(assert (=> d!116943 m!914179))

(declare-fun m!914181 () Bool)

(assert (=> d!116943 m!914181))

(declare-fun m!914183 () Bool)

(assert (=> d!116943 m!914183))

(declare-fun m!914185 () Bool)

(assert (=> b!987557 m!914185))

(declare-fun m!914187 () Bool)

(assert (=> b!987558 m!914187))

(assert (=> b!987445 d!116943))

(declare-fun d!116945 () Bool)

(declare-fun e!556868 () Bool)

(assert (=> d!116945 e!556868))

(declare-fun res!660654 () Bool)

(assert (=> d!116945 (=> (not res!660654) (not e!556868))))

(declare-fun lt!437809 () ListLongMap!13541)

(assert (=> d!116945 (= res!660654 (contains!5711 lt!437809 (_1!7433 lt!437738)))))

(declare-fun lt!437808 () List!20775)

(assert (=> d!116945 (= lt!437809 (ListLongMap!13542 lt!437808))))

(declare-fun lt!437806 () Unit!32775)

(declare-fun lt!437807 () Unit!32775)

(assert (=> d!116945 (= lt!437806 lt!437807)))

(assert (=> d!116945 (= (getValueByKey!511 lt!437808 (_1!7433 lt!437738)) (Some!516 (_2!7433 lt!437738)))))

(assert (=> d!116945 (= lt!437807 (lemmaContainsTupThenGetReturnValue!270 lt!437808 (_1!7433 lt!437738) (_2!7433 lt!437738)))))

(assert (=> d!116945 (= lt!437808 (insertStrictlySorted!327 (toList!6786 lt!437740) (_1!7433 lt!437738) (_2!7433 lt!437738)))))

(assert (=> d!116945 (= (+!3071 lt!437740 lt!437738) lt!437809)))

(declare-fun b!987559 () Bool)

(declare-fun res!660653 () Bool)

(assert (=> b!987559 (=> (not res!660653) (not e!556868))))

(assert (=> b!987559 (= res!660653 (= (getValueByKey!511 (toList!6786 lt!437809) (_1!7433 lt!437738)) (Some!516 (_2!7433 lt!437738))))))

(declare-fun b!987560 () Bool)

(assert (=> b!987560 (= e!556868 (contains!5712 (toList!6786 lt!437809) lt!437738))))

(assert (= (and d!116945 res!660654) b!987559))

(assert (= (and b!987559 res!660653) b!987560))

(declare-fun m!914189 () Bool)

(assert (=> d!116945 m!914189))

(declare-fun m!914191 () Bool)

(assert (=> d!116945 m!914191))

(declare-fun m!914193 () Bool)

(assert (=> d!116945 m!914193))

(declare-fun m!914195 () Bool)

(assert (=> d!116945 m!914195))

(declare-fun m!914197 () Bool)

(assert (=> b!987559 m!914197))

(declare-fun m!914199 () Bool)

(assert (=> b!987560 m!914199))

(assert (=> b!987445 d!116945))

(declare-fun d!116947 () Bool)

(declare-fun e!556869 () Bool)

(assert (=> d!116947 e!556869))

(declare-fun res!660656 () Bool)

(assert (=> d!116947 (=> (not res!660656) (not e!556869))))

(declare-fun lt!437813 () ListLongMap!13541)

(assert (=> d!116947 (= res!660656 (contains!5711 lt!437813 (_1!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(declare-fun lt!437812 () List!20775)

(assert (=> d!116947 (= lt!437813 (ListLongMap!13542 lt!437812))))

(declare-fun lt!437810 () Unit!32775)

(declare-fun lt!437811 () Unit!32775)

(assert (=> d!116947 (= lt!437810 lt!437811)))

(assert (=> d!116947 (= (getValueByKey!511 lt!437812 (_1!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!516 (_2!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116947 (= lt!437811 (lemmaContainsTupThenGetReturnValue!270 lt!437812 (_1!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116947 (= lt!437812 (insertStrictlySorted!327 (toList!6786 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281)) (_1!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) (_2!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))))

(assert (=> d!116947 (= (+!3071 (getCurrentListMapNoExtraKeys!3477 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)) lt!437813)))

(declare-fun b!987561 () Bool)

(declare-fun res!660655 () Bool)

(assert (=> b!987561 (=> (not res!660655) (not e!556869))))

(assert (=> b!987561 (= res!660655 (= (getValueByKey!511 (toList!6786 lt!437813) (_1!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))) (Some!516 (_2!7433 (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))))

(declare-fun b!987562 () Bool)

(assert (=> b!987562 (= e!556869 (contains!5712 (toList!6786 lt!437813) (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(assert (= (and d!116947 res!660656) b!987561))

(assert (= (and b!987561 res!660655) b!987562))

(declare-fun m!914201 () Bool)

(assert (=> d!116947 m!914201))

(declare-fun m!914203 () Bool)

(assert (=> d!116947 m!914203))

(declare-fun m!914205 () Bool)

(assert (=> d!116947 m!914205))

(declare-fun m!914207 () Bool)

(assert (=> d!116947 m!914207))

(declare-fun m!914209 () Bool)

(assert (=> b!987561 m!914209))

(declare-fun m!914211 () Bool)

(assert (=> b!987562 m!914211))

(assert (=> b!987445 d!116947))

(declare-fun d!116949 () Bool)

(declare-fun e!556870 () Bool)

(assert (=> d!116949 e!556870))

(declare-fun res!660658 () Bool)

(assert (=> d!116949 (=> (not res!660658) (not e!556870))))

(declare-fun lt!437817 () ListLongMap!13541)

(assert (=> d!116949 (= res!660658 (contains!5711 lt!437817 (_1!7433 lt!437741)))))

(declare-fun lt!437816 () List!20775)

(assert (=> d!116949 (= lt!437817 (ListLongMap!13542 lt!437816))))

(declare-fun lt!437814 () Unit!32775)

(declare-fun lt!437815 () Unit!32775)

(assert (=> d!116949 (= lt!437814 lt!437815)))

(assert (=> d!116949 (= (getValueByKey!511 lt!437816 (_1!7433 lt!437741)) (Some!516 (_2!7433 lt!437741)))))

(assert (=> d!116949 (= lt!437815 (lemmaContainsTupThenGetReturnValue!270 lt!437816 (_1!7433 lt!437741) (_2!7433 lt!437741)))))

(assert (=> d!116949 (= lt!437816 (insertStrictlySorted!327 (toList!6786 lt!437740) (_1!7433 lt!437741) (_2!7433 lt!437741)))))

(assert (=> d!116949 (= (+!3071 lt!437740 lt!437741) lt!437817)))

(declare-fun b!987563 () Bool)

(declare-fun res!660657 () Bool)

(assert (=> b!987563 (=> (not res!660657) (not e!556870))))

(assert (=> b!987563 (= res!660657 (= (getValueByKey!511 (toList!6786 lt!437817) (_1!7433 lt!437741)) (Some!516 (_2!7433 lt!437741))))))

(declare-fun b!987564 () Bool)

(assert (=> b!987564 (= e!556870 (contains!5712 (toList!6786 lt!437817) lt!437741))))

(assert (= (and d!116949 res!660658) b!987563))

(assert (= (and b!987563 res!660657) b!987564))

(declare-fun m!914213 () Bool)

(assert (=> d!116949 m!914213))

(declare-fun m!914215 () Bool)

(assert (=> d!116949 m!914215))

(declare-fun m!914217 () Bool)

(assert (=> d!116949 m!914217))

(declare-fun m!914219 () Bool)

(assert (=> d!116949 m!914219))

(declare-fun m!914221 () Bool)

(assert (=> b!987563 m!914221))

(declare-fun m!914223 () Bool)

(assert (=> b!987564 m!914223))

(assert (=> b!987445 d!116949))

(declare-fun d!116951 () Bool)

(assert (=> d!116951 (= (validKeyInArray!0 (select (arr!30040 _keys!1544) from!1932)) (and (not (= (select (arr!30040 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30040 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!987440 d!116951))

(declare-fun mapIsEmpty!36845 () Bool)

(declare-fun mapRes!36845 () Bool)

(assert (=> mapIsEmpty!36845 mapRes!36845))

(declare-fun b!987571 () Bool)

(declare-fun e!556875 () Bool)

(assert (=> b!987571 (= e!556875 tp_is_empty!23205)))

(declare-fun mapNonEmpty!36845 () Bool)

(declare-fun tp!69754 () Bool)

(assert (=> mapNonEmpty!36845 (= mapRes!36845 (and tp!69754 e!556875))))

(declare-fun mapRest!36845 () (Array (_ BitVec 32) ValueCell!11121))

(declare-fun mapValue!36845 () ValueCell!11121)

(declare-fun mapKey!36845 () (_ BitVec 32))

(assert (=> mapNonEmpty!36845 (= mapRest!36839 (store mapRest!36845 mapKey!36845 mapValue!36845))))

(declare-fun condMapEmpty!36845 () Bool)

(declare-fun mapDefault!36845 () ValueCell!11121)

(assert (=> mapNonEmpty!36839 (= condMapEmpty!36845 (= mapRest!36839 ((as const (Array (_ BitVec 32) ValueCell!11121)) mapDefault!36845)))))

(declare-fun e!556876 () Bool)

(assert (=> mapNonEmpty!36839 (= tp!69745 (and e!556876 mapRes!36845))))

(declare-fun b!987572 () Bool)

(assert (=> b!987572 (= e!556876 tp_is_empty!23205)))

(assert (= (and mapNonEmpty!36839 condMapEmpty!36845) mapIsEmpty!36845))

(assert (= (and mapNonEmpty!36839 (not condMapEmpty!36845)) mapNonEmpty!36845))

(assert (= (and mapNonEmpty!36845 ((_ is ValueCellFull!11121) mapValue!36845)) b!987571))

(assert (= (and mapNonEmpty!36839 ((_ is ValueCellFull!11121) mapDefault!36845)) b!987572))

(declare-fun m!914225 () Bool)

(assert (=> mapNonEmpty!36845 m!914225))

(declare-fun b_lambda!15021 () Bool)

(assert (= b_lambda!15017 (or (and start!84418 b_free!19989) b_lambda!15021)))

(declare-fun b_lambda!15023 () Bool)

(assert (= b_lambda!15019 (or (and start!84418 b_free!19989) b_lambda!15023)))

(check-sat (not b!987542) (not d!116949) (not b!987494) (not b_lambda!15023) (not b!987561) (not b!987564) (not b!987545) (not b!987562) (not bm!41808) (not b!987543) (not b!987563) (not b!987514) (not b!987508) (not mapNonEmpty!36845) (not b!987539) (not b_lambda!15015) (not b!987493) (not b!987496) (not d!116939) tp_is_empty!23205 (not b!987513) (not d!116941) (not b!987550) (not b!987544) (not b!987560) (not b!987555) (not b!987557) (not bm!41802) (not d!116945) (not b_lambda!15021) (not d!116937) (not d!116943) (not bm!41805) (not d!116947) (not b!987556) (not b!987546) (not b_next!19989) (not b!987506) (not b!987559) (not b!987541) b_and!32051 (not b!987558))
(check-sat b_and!32051 (not b_next!19989))
