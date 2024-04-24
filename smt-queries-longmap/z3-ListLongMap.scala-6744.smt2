; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84696 () Bool)

(assert start!84696)

(declare-fun b_free!20023 () Bool)

(declare-fun b_next!20023 () Bool)

(assert (=> start!84696 (= b_free!20023 (not b_next!20023))))

(declare-fun tp!69854 () Bool)

(declare-fun b_and!32127 () Bool)

(assert (=> start!84696 (= tp!69854 b_and!32127)))

(declare-fun b!989575 () Bool)

(declare-fun res!661605 () Bool)

(declare-fun e!558072 () Bool)

(assert (=> b!989575 (=> (not res!661605) (not e!558072))))

(declare-datatypes ((array!62484 0))(
  ( (array!62485 (arr!30092 (Array (_ BitVec 32) (_ BitVec 64))) (size!30572 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62484)

(declare-datatypes ((List!20802 0))(
  ( (Nil!20799) (Cons!20798 (h!21966 (_ BitVec 64)) (t!29731 List!20802)) )
))
(declare-fun arrayNoDuplicates!0 (array!62484 (_ BitVec 32) List!20802) Bool)

(assert (=> b!989575 (= res!661605 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20799))))

(declare-fun mapIsEmpty!36897 () Bool)

(declare-fun mapRes!36897 () Bool)

(assert (=> mapIsEmpty!36897 mapRes!36897))

(declare-fun b!989576 () Bool)

(declare-fun res!661606 () Bool)

(assert (=> b!989576 (=> (not res!661606) (not e!558072))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35969 0))(
  ( (V!35970 (val!11670 Int)) )
))
(declare-datatypes ((ValueCell!11138 0))(
  ( (ValueCellFull!11138 (v!14234 V!35969)) (EmptyCell!11138) )
))
(declare-datatypes ((array!62486 0))(
  ( (array!62487 (arr!30093 (Array (_ BitVec 32) ValueCell!11138)) (size!30573 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62486)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989576 (= res!661606 (and (= (size!30573 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30572 _keys!1544) (size!30573 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989577 () Bool)

(declare-fun e!558073 () Bool)

(declare-fun tp_is_empty!23239 () Bool)

(assert (=> b!989577 (= e!558073 tp_is_empty!23239)))

(declare-fun b!989578 () Bool)

(declare-fun e!558074 () Bool)

(declare-fun e!558075 () Bool)

(assert (=> b!989578 (= e!558074 (and e!558075 mapRes!36897))))

(declare-fun condMapEmpty!36897 () Bool)

(declare-fun mapDefault!36897 () ValueCell!11138)

(assert (=> b!989578 (= condMapEmpty!36897 (= (arr!30093 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11138)) mapDefault!36897)))))

(declare-fun b!989579 () Bool)

(declare-fun res!661607 () Bool)

(assert (=> b!989579 (=> (not res!661607) (not e!558072))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!989579 (= res!661607 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30572 _keys!1544))))))

(declare-fun b!989580 () Bool)

(declare-fun res!661610 () Bool)

(assert (=> b!989580 (=> (not res!661610) (not e!558072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62484 (_ BitVec 32)) Bool)

(assert (=> b!989580 (= res!661610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!661609 () Bool)

(assert (=> start!84696 (=> (not res!661609) (not e!558072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84696 (= res!661609 (validMask!0 mask!1948))))

(assert (=> start!84696 e!558072))

(assert (=> start!84696 true))

(assert (=> start!84696 tp_is_empty!23239))

(declare-fun array_inv!23273 (array!62486) Bool)

(assert (=> start!84696 (and (array_inv!23273 _values!1278) e!558074)))

(assert (=> start!84696 tp!69854))

(declare-fun array_inv!23274 (array!62484) Bool)

(assert (=> start!84696 (array_inv!23274 _keys!1544)))

(declare-fun b!989581 () Bool)

(assert (=> b!989581 (= e!558072 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30092 _keys!1544) from!1932)))))

(declare-fun minValue!1220 () V!35969)

(declare-fun zeroValue!1220 () V!35969)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14898 0))(
  ( (tuple2!14899 (_1!7460 (_ BitVec 64)) (_2!7460 V!35969)) )
))
(declare-datatypes ((List!20803 0))(
  ( (Nil!20800) (Cons!20799 (h!21967 tuple2!14898) (t!29732 List!20803)) )
))
(declare-datatypes ((ListLongMap!13597 0))(
  ( (ListLongMap!13598 (toList!6814 List!20803)) )
))
(declare-fun lt!438902 () ListLongMap!13597)

(declare-fun getCurrentListMapNoExtraKeys!3542 (array!62484 array!62486 (_ BitVec 32) (_ BitVec 32) V!35969 V!35969 (_ BitVec 32) Int) ListLongMap!13597)

(assert (=> b!989581 (= lt!438902 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989582 () Bool)

(assert (=> b!989582 (= e!558075 tp_is_empty!23239)))

(declare-fun b!989583 () Bool)

(declare-fun res!661608 () Bool)

(assert (=> b!989583 (=> (not res!661608) (not e!558072))))

(assert (=> b!989583 (= res!661608 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!989584 () Bool)

(declare-fun res!661604 () Bool)

(assert (=> b!989584 (=> (not res!661604) (not e!558072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989584 (= res!661604 (validKeyInArray!0 (select (arr!30092 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36897 () Bool)

(declare-fun tp!69855 () Bool)

(assert (=> mapNonEmpty!36897 (= mapRes!36897 (and tp!69855 e!558073))))

(declare-fun mapRest!36897 () (Array (_ BitVec 32) ValueCell!11138))

(declare-fun mapValue!36897 () ValueCell!11138)

(declare-fun mapKey!36897 () (_ BitVec 32))

(assert (=> mapNonEmpty!36897 (= (arr!30093 _values!1278) (store mapRest!36897 mapKey!36897 mapValue!36897))))

(assert (= (and start!84696 res!661609) b!989576))

(assert (= (and b!989576 res!661606) b!989580))

(assert (= (and b!989580 res!661610) b!989575))

(assert (= (and b!989575 res!661605) b!989579))

(assert (= (and b!989579 res!661607) b!989584))

(assert (= (and b!989584 res!661604) b!989583))

(assert (= (and b!989583 res!661608) b!989581))

(assert (= (and b!989578 condMapEmpty!36897) mapIsEmpty!36897))

(assert (= (and b!989578 (not condMapEmpty!36897)) mapNonEmpty!36897))

(get-info :version)

(assert (= (and mapNonEmpty!36897 ((_ is ValueCellFull!11138) mapValue!36897)) b!989577))

(assert (= (and b!989578 ((_ is ValueCellFull!11138) mapDefault!36897)) b!989582))

(assert (= start!84696 b!989578))

(declare-fun m!917135 () Bool)

(assert (=> mapNonEmpty!36897 m!917135))

(declare-fun m!917137 () Bool)

(assert (=> b!989584 m!917137))

(assert (=> b!989584 m!917137))

(declare-fun m!917139 () Bool)

(assert (=> b!989584 m!917139))

(declare-fun m!917141 () Bool)

(assert (=> start!84696 m!917141))

(declare-fun m!917143 () Bool)

(assert (=> start!84696 m!917143))

(declare-fun m!917145 () Bool)

(assert (=> start!84696 m!917145))

(declare-fun m!917147 () Bool)

(assert (=> b!989580 m!917147))

(declare-fun m!917149 () Bool)

(assert (=> b!989575 m!917149))

(assert (=> b!989581 m!917137))

(declare-fun m!917151 () Bool)

(assert (=> b!989581 m!917151))

(check-sat (not b!989575) (not b!989584) b_and!32127 (not b_next!20023) (not b!989581) (not mapNonEmpty!36897) (not start!84696) (not b!989580) tp_is_empty!23239)
(check-sat b_and!32127 (not b_next!20023))
(get-model)

(declare-fun b!989655 () Bool)

(declare-fun e!558116 () Bool)

(declare-fun e!558118 () Bool)

(assert (=> b!989655 (= e!558116 e!558118)))

(declare-fun c!100509 () Bool)

(assert (=> b!989655 (= c!100509 (validKeyInArray!0 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41927 () Bool)

(declare-fun call!41930 () Bool)

(assert (=> bm!41927 (= call!41930 (arrayNoDuplicates!0 _keys!1544 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!100509 (Cons!20798 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000) Nil!20799) Nil!20799)))))

(declare-fun b!989656 () Bool)

(declare-fun e!558115 () Bool)

(assert (=> b!989656 (= e!558115 e!558116)))

(declare-fun res!661660 () Bool)

(assert (=> b!989656 (=> (not res!661660) (not e!558116))))

(declare-fun e!558117 () Bool)

(assert (=> b!989656 (= res!661660 (not e!558117))))

(declare-fun res!661661 () Bool)

(assert (=> b!989656 (=> (not res!661661) (not e!558117))))

(assert (=> b!989656 (= res!661661 (validKeyInArray!0 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989657 () Bool)

(declare-fun contains!5738 (List!20802 (_ BitVec 64)) Bool)

(assert (=> b!989657 (= e!558117 (contains!5738 Nil!20799 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989658 () Bool)

(assert (=> b!989658 (= e!558118 call!41930)))

(declare-fun d!117579 () Bool)

(declare-fun res!661659 () Bool)

(assert (=> d!117579 (=> res!661659 e!558115)))

(assert (=> d!117579 (= res!661659 (bvsge #b00000000000000000000000000000000 (size!30572 _keys!1544)))))

(assert (=> d!117579 (= (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20799) e!558115)))

(declare-fun b!989659 () Bool)

(assert (=> b!989659 (= e!558118 call!41930)))

(assert (= (and d!117579 (not res!661659)) b!989656))

(assert (= (and b!989656 res!661661) b!989657))

(assert (= (and b!989656 res!661660) b!989655))

(assert (= (and b!989655 c!100509) b!989659))

(assert (= (and b!989655 (not c!100509)) b!989658))

(assert (= (or b!989659 b!989658) bm!41927))

(declare-fun m!917189 () Bool)

(assert (=> b!989655 m!917189))

(assert (=> b!989655 m!917189))

(declare-fun m!917191 () Bool)

(assert (=> b!989655 m!917191))

(assert (=> bm!41927 m!917189))

(declare-fun m!917193 () Bool)

(assert (=> bm!41927 m!917193))

(assert (=> b!989656 m!917189))

(assert (=> b!989656 m!917189))

(assert (=> b!989656 m!917191))

(assert (=> b!989657 m!917189))

(assert (=> b!989657 m!917189))

(declare-fun m!917195 () Bool)

(assert (=> b!989657 m!917195))

(assert (=> b!989575 d!117579))

(declare-fun b!989668 () Bool)

(declare-fun e!558127 () Bool)

(declare-fun e!558126 () Bool)

(assert (=> b!989668 (= e!558127 e!558126)))

(declare-fun lt!438915 () (_ BitVec 64))

(assert (=> b!989668 (= lt!438915 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32810 0))(
  ( (Unit!32811) )
))
(declare-fun lt!438917 () Unit!32810)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62484 (_ BitVec 64) (_ BitVec 32)) Unit!32810)

(assert (=> b!989668 (= lt!438917 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!438915 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!989668 (arrayContainsKey!0 _keys!1544 lt!438915 #b00000000000000000000000000000000)))

(declare-fun lt!438916 () Unit!32810)

(assert (=> b!989668 (= lt!438916 lt!438917)))

(declare-fun res!661667 () Bool)

(declare-datatypes ((SeekEntryResult!9164 0))(
  ( (MissingZero!9164 (index!39027 (_ BitVec 32))) (Found!9164 (index!39028 (_ BitVec 32))) (Intermediate!9164 (undefined!9976 Bool) (index!39029 (_ BitVec 32)) (x!86007 (_ BitVec 32))) (Undefined!9164) (MissingVacant!9164 (index!39030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62484 (_ BitVec 32)) SeekEntryResult!9164)

(assert (=> b!989668 (= res!661667 (= (seekEntryOrOpen!0 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9164 #b00000000000000000000000000000000)))))

(assert (=> b!989668 (=> (not res!661667) (not e!558126))))

(declare-fun b!989669 () Bool)

(declare-fun call!41933 () Bool)

(assert (=> b!989669 (= e!558126 call!41933)))

(declare-fun d!117581 () Bool)

(declare-fun res!661666 () Bool)

(declare-fun e!558125 () Bool)

(assert (=> d!117581 (=> res!661666 e!558125)))

(assert (=> d!117581 (= res!661666 (bvsge #b00000000000000000000000000000000 (size!30572 _keys!1544)))))

(assert (=> d!117581 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!558125)))

(declare-fun bm!41930 () Bool)

(assert (=> bm!41930 (= call!41933 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!989670 () Bool)

(assert (=> b!989670 (= e!558125 e!558127)))

(declare-fun c!100512 () Bool)

(assert (=> b!989670 (= c!100512 (validKeyInArray!0 (select (arr!30092 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!989671 () Bool)

(assert (=> b!989671 (= e!558127 call!41933)))

(assert (= (and d!117581 (not res!661666)) b!989670))

(assert (= (and b!989670 c!100512) b!989668))

(assert (= (and b!989670 (not c!100512)) b!989671))

(assert (= (and b!989668 res!661667) b!989669))

(assert (= (or b!989669 b!989671) bm!41930))

(assert (=> b!989668 m!917189))

(declare-fun m!917197 () Bool)

(assert (=> b!989668 m!917197))

(declare-fun m!917199 () Bool)

(assert (=> b!989668 m!917199))

(assert (=> b!989668 m!917189))

(declare-fun m!917201 () Bool)

(assert (=> b!989668 m!917201))

(declare-fun m!917203 () Bool)

(assert (=> bm!41930 m!917203))

(assert (=> b!989670 m!917189))

(assert (=> b!989670 m!917189))

(assert (=> b!989670 m!917191))

(assert (=> b!989580 d!117581))

(declare-fun d!117583 () Bool)

(assert (=> d!117583 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!84696 d!117583))

(declare-fun d!117585 () Bool)

(assert (=> d!117585 (= (array_inv!23273 _values!1278) (bvsge (size!30573 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!84696 d!117585))

(declare-fun d!117587 () Bool)

(assert (=> d!117587 (= (array_inv!23274 _keys!1544) (bvsge (size!30572 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!84696 d!117587))

(declare-fun lt!438938 () ListLongMap!13597)

(declare-fun b!989696 () Bool)

(declare-fun e!558145 () Bool)

(assert (=> b!989696 (= e!558145 (= lt!438938 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281)))))

(declare-fun b!989697 () Bool)

(declare-fun e!558143 () Bool)

(assert (=> b!989697 (= e!558143 e!558145)))

(declare-fun c!100524 () Bool)

(assert (=> b!989697 (= c!100524 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989698 () Bool)

(declare-fun e!558144 () ListLongMap!13597)

(declare-fun e!558147 () ListLongMap!13597)

(assert (=> b!989698 (= e!558144 e!558147)))

(declare-fun c!100523 () Bool)

(assert (=> b!989698 (= c!100523 (validKeyInArray!0 (select (arr!30092 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(declare-fun b!989699 () Bool)

(assert (=> b!989699 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(assert (=> b!989699 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30573 _values!1278)))))

(declare-fun e!558142 () Bool)

(declare-fun apply!903 (ListLongMap!13597 (_ BitVec 64)) V!35969)

(declare-fun get!15640 (ValueCell!11138 V!35969) V!35969)

(declare-fun dynLambda!1890 (Int (_ BitVec 64)) V!35969)

(assert (=> b!989699 (= e!558142 (= (apply!903 lt!438938 (select (arr!30092 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))) (get!15640 (select (arr!30093 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1890 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!41933 () Bool)

(declare-fun call!41936 () ListLongMap!13597)

(assert (=> bm!41933 (= call!41936 (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932 #b00000000000000000000000000000001) defaultEntry!1281))))

(declare-fun d!117589 () Bool)

(declare-fun e!558148 () Bool)

(assert (=> d!117589 e!558148))

(declare-fun res!661679 () Bool)

(assert (=> d!117589 (=> (not res!661679) (not e!558148))))

(declare-fun contains!5739 (ListLongMap!13597 (_ BitVec 64)) Bool)

(assert (=> d!117589 (= res!661679 (not (contains!5739 lt!438938 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!117589 (= lt!438938 e!558144)))

(declare-fun c!100521 () Bool)

(assert (=> d!117589 (= c!100521 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(assert (=> d!117589 (validMask!0 mask!1948)))

(assert (=> d!117589 (= (getCurrentListMapNoExtraKeys!3542 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) lt!438938)))

(declare-fun b!989700 () Bool)

(assert (=> b!989700 (= e!558147 call!41936)))

(declare-fun b!989701 () Bool)

(declare-fun isEmpty!728 (ListLongMap!13597) Bool)

(assert (=> b!989701 (= e!558145 (isEmpty!728 lt!438938))))

(declare-fun b!989702 () Bool)

(declare-fun res!661677 () Bool)

(assert (=> b!989702 (=> (not res!661677) (not e!558148))))

(assert (=> b!989702 (= res!661677 (not (contains!5739 lt!438938 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!989703 () Bool)

(assert (=> b!989703 (= e!558143 e!558142)))

(assert (=> b!989703 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun res!661676 () Bool)

(assert (=> b!989703 (= res!661676 (contains!5739 lt!438938 (select (arr!30092 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989703 (=> (not res!661676) (not e!558142))))

(declare-fun b!989704 () Bool)

(assert (=> b!989704 (= e!558144 (ListLongMap!13598 Nil!20800))))

(declare-fun b!989705 () Bool)

(declare-fun e!558146 () Bool)

(assert (=> b!989705 (= e!558146 (validKeyInArray!0 (select (arr!30092 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932))))))

(assert (=> b!989705 (bvsge (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))

(declare-fun b!989706 () Bool)

(assert (=> b!989706 (= e!558148 e!558143)))

(declare-fun c!100522 () Bool)

(assert (=> b!989706 (= c!100522 e!558146)))

(declare-fun res!661678 () Bool)

(assert (=> b!989706 (=> (not res!661678) (not e!558146))))

(assert (=> b!989706 (= res!661678 (bvslt (bvadd #b00000000000000000000000000000001 from!1932) (size!30572 _keys!1544)))))

(declare-fun b!989707 () Bool)

(declare-fun lt!438934 () Unit!32810)

(declare-fun lt!438935 () Unit!32810)

(assert (=> b!989707 (= lt!438934 lt!438935)))

(declare-fun lt!438936 () (_ BitVec 64))

(declare-fun lt!438937 () (_ BitVec 64))

(declare-fun lt!438933 () ListLongMap!13597)

(declare-fun lt!438932 () V!35969)

(declare-fun +!3107 (ListLongMap!13597 tuple2!14898) ListLongMap!13597)

(assert (=> b!989707 (not (contains!5739 (+!3107 lt!438933 (tuple2!14899 lt!438936 lt!438932)) lt!438937))))

(declare-fun addStillNotContains!235 (ListLongMap!13597 (_ BitVec 64) V!35969 (_ BitVec 64)) Unit!32810)

(assert (=> b!989707 (= lt!438935 (addStillNotContains!235 lt!438933 lt!438936 lt!438932 lt!438937))))

(assert (=> b!989707 (= lt!438937 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!989707 (= lt!438932 (get!15640 (select (arr!30093 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1890 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!989707 (= lt!438936 (select (arr!30092 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)))))

(assert (=> b!989707 (= lt!438933 call!41936)))

(assert (=> b!989707 (= e!558147 (+!3107 call!41936 (tuple2!14899 (select (arr!30092 _keys!1544) (bvadd #b00000000000000000000000000000001 from!1932)) (get!15640 (select (arr!30093 _values!1278) (bvadd #b00000000000000000000000000000001 from!1932)) (dynLambda!1890 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!117589 c!100521) b!989704))

(assert (= (and d!117589 (not c!100521)) b!989698))

(assert (= (and b!989698 c!100523) b!989707))

(assert (= (and b!989698 (not c!100523)) b!989700))

(assert (= (or b!989707 b!989700) bm!41933))

(assert (= (and d!117589 res!661679) b!989702))

(assert (= (and b!989702 res!661677) b!989706))

(assert (= (and b!989706 res!661678) b!989705))

(assert (= (and b!989706 c!100522) b!989703))

(assert (= (and b!989706 (not c!100522)) b!989697))

(assert (= (and b!989703 res!661676) b!989699))

(assert (= (and b!989697 c!100524) b!989696))

(assert (= (and b!989697 (not c!100524)) b!989701))

(declare-fun b_lambda!15091 () Bool)

(assert (=> (not b_lambda!15091) (not b!989699)))

(declare-fun t!29735 () Bool)

(declare-fun tb!6781 () Bool)

(assert (=> (and start!84696 (= defaultEntry!1281 defaultEntry!1281) t!29735) tb!6781))

(declare-fun result!13565 () Bool)

(assert (=> tb!6781 (= result!13565 tp_is_empty!23239)))

(assert (=> b!989699 t!29735))

(declare-fun b_and!32133 () Bool)

(assert (= b_and!32127 (and (=> t!29735 result!13565) b_and!32133)))

(declare-fun b_lambda!15093 () Bool)

(assert (=> (not b_lambda!15093) (not b!989707)))

(assert (=> b!989707 t!29735))

(declare-fun b_and!32135 () Bool)

(assert (= b_and!32133 (and (=> t!29735 result!13565) b_and!32135)))

(declare-fun m!917205 () Bool)

(assert (=> b!989699 m!917205))

(declare-fun m!917207 () Bool)

(assert (=> b!989699 m!917207))

(declare-fun m!917209 () Bool)

(assert (=> b!989699 m!917209))

(declare-fun m!917211 () Bool)

(assert (=> b!989699 m!917211))

(assert (=> b!989699 m!917205))

(declare-fun m!917213 () Bool)

(assert (=> b!989699 m!917213))

(assert (=> b!989699 m!917207))

(assert (=> b!989699 m!917209))

(declare-fun m!917215 () Bool)

(assert (=> b!989707 m!917215))

(declare-fun m!917217 () Bool)

(assert (=> b!989707 m!917217))

(assert (=> b!989707 m!917205))

(assert (=> b!989707 m!917217))

(declare-fun m!917219 () Bool)

(assert (=> b!989707 m!917219))

(assert (=> b!989707 m!917207))

(assert (=> b!989707 m!917209))

(assert (=> b!989707 m!917211))

(declare-fun m!917221 () Bool)

(assert (=> b!989707 m!917221))

(assert (=> b!989707 m!917207))

(assert (=> b!989707 m!917209))

(declare-fun m!917223 () Bool)

(assert (=> bm!41933 m!917223))

(assert (=> b!989696 m!917223))

(assert (=> b!989703 m!917205))

(assert (=> b!989703 m!917205))

(declare-fun m!917225 () Bool)

(assert (=> b!989703 m!917225))

(declare-fun m!917227 () Bool)

(assert (=> b!989702 m!917227))

(declare-fun m!917229 () Bool)

(assert (=> b!989701 m!917229))

(assert (=> b!989698 m!917205))

(assert (=> b!989698 m!917205))

(declare-fun m!917231 () Bool)

(assert (=> b!989698 m!917231))

(assert (=> b!989705 m!917205))

(assert (=> b!989705 m!917205))

(assert (=> b!989705 m!917231))

(declare-fun m!917233 () Bool)

(assert (=> d!117589 m!917233))

(assert (=> d!117589 m!917141))

(assert (=> b!989581 d!117589))

(declare-fun d!117591 () Bool)

(assert (=> d!117591 (= (validKeyInArray!0 (select (arr!30092 _keys!1544) from!1932)) (and (not (= (select (arr!30092 _keys!1544) from!1932) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30092 _keys!1544) from!1932) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!989584 d!117591))

(declare-fun mapNonEmpty!36906 () Bool)

(declare-fun mapRes!36906 () Bool)

(declare-fun tp!69870 () Bool)

(declare-fun e!558154 () Bool)

(assert (=> mapNonEmpty!36906 (= mapRes!36906 (and tp!69870 e!558154))))

(declare-fun mapKey!36906 () (_ BitVec 32))

(declare-fun mapRest!36906 () (Array (_ BitVec 32) ValueCell!11138))

(declare-fun mapValue!36906 () ValueCell!11138)

(assert (=> mapNonEmpty!36906 (= mapRest!36897 (store mapRest!36906 mapKey!36906 mapValue!36906))))

(declare-fun condMapEmpty!36906 () Bool)

(declare-fun mapDefault!36906 () ValueCell!11138)

(assert (=> mapNonEmpty!36897 (= condMapEmpty!36906 (= mapRest!36897 ((as const (Array (_ BitVec 32) ValueCell!11138)) mapDefault!36906)))))

(declare-fun e!558153 () Bool)

(assert (=> mapNonEmpty!36897 (= tp!69855 (and e!558153 mapRes!36906))))

(declare-fun b!989717 () Bool)

(assert (=> b!989717 (= e!558153 tp_is_empty!23239)))

(declare-fun b!989716 () Bool)

(assert (=> b!989716 (= e!558154 tp_is_empty!23239)))

(declare-fun mapIsEmpty!36906 () Bool)

(assert (=> mapIsEmpty!36906 mapRes!36906))

(assert (= (and mapNonEmpty!36897 condMapEmpty!36906) mapIsEmpty!36906))

(assert (= (and mapNonEmpty!36897 (not condMapEmpty!36906)) mapNonEmpty!36906))

(assert (= (and mapNonEmpty!36906 ((_ is ValueCellFull!11138) mapValue!36906)) b!989716))

(assert (= (and mapNonEmpty!36897 ((_ is ValueCellFull!11138) mapDefault!36906)) b!989717))

(declare-fun m!917235 () Bool)

(assert (=> mapNonEmpty!36906 m!917235))

(declare-fun b_lambda!15095 () Bool)

(assert (= b_lambda!15091 (or (and start!84696 b_free!20023) b_lambda!15095)))

(declare-fun b_lambda!15097 () Bool)

(assert (= b_lambda!15093 (or (and start!84696 b_free!20023) b_lambda!15097)))

(check-sat (not b!989703) (not d!117589) (not b!989668) (not b!989701) (not b!989670) b_and!32135 (not b!989696) tp_is_empty!23239 (not b!989657) (not mapNonEmpty!36906) (not b!989655) (not b!989707) (not b!989698) (not b_lambda!15095) (not b!989702) (not b!989656) (not b!989705) (not bm!41930) (not b_lambda!15097) (not b_next!20023) (not bm!41933) (not bm!41927) (not b!989699))
(check-sat b_and!32135 (not b_next!20023))
