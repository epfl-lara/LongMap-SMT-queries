; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108174 () Bool)

(assert start!108174)

(declare-fun mapNonEmpty!51398 () Bool)

(declare-fun mapRes!51398 () Bool)

(declare-fun tp!98156 () Bool)

(declare-fun e!728926 () Bool)

(assert (=> mapNonEmpty!51398 (= mapRes!51398 (and tp!98156 e!728926))))

(declare-fun mapKey!51398 () (_ BitVec 32))

(declare-datatypes ((V!49441 0))(
  ( (V!49442 (val!16701 Int)) )
))
(declare-datatypes ((ValueCell!15728 0))(
  ( (ValueCellFull!15728 (v!19292 V!49441)) (EmptyCell!15728) )
))
(declare-fun mapRest!51398 () (Array (_ BitVec 32) ValueCell!15728))

(declare-datatypes ((array!83631 0))(
  ( (array!83632 (arr!40326 (Array (_ BitVec 32) ValueCell!15728)) (size!40877 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83631)

(declare-fun mapValue!51398 () ValueCell!15728)

(assert (=> mapNonEmpty!51398 (= (arr!40326 _values!1187) (store mapRest!51398 mapKey!51398 mapValue!51398))))

(declare-fun res!848248 () Bool)

(declare-fun e!728924 () Bool)

(assert (=> start!108174 (=> (not res!848248) (not e!728924))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108174 (= res!848248 (validMask!0 mask!1805))))

(assert (=> start!108174 e!728924))

(assert (=> start!108174 true))

(declare-fun e!728923 () Bool)

(declare-fun array_inv!30835 (array!83631) Bool)

(assert (=> start!108174 (and (array_inv!30835 _values!1187) e!728923)))

(declare-datatypes ((array!83633 0))(
  ( (array!83634 (arr!40327 (Array (_ BitVec 32) (_ BitVec 64))) (size!40878 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83633)

(declare-fun array_inv!30836 (array!83633) Bool)

(assert (=> start!108174 (array_inv!30836 _keys!1427)))

(declare-fun mapIsEmpty!51398 () Bool)

(assert (=> mapIsEmpty!51398 mapRes!51398))

(declare-fun b!1276703 () Bool)

(declare-fun e!728927 () Bool)

(assert (=> b!1276703 (= e!728923 (and e!728927 mapRes!51398))))

(declare-fun condMapEmpty!51398 () Bool)

(declare-fun mapDefault!51398 () ValueCell!15728)

(assert (=> b!1276703 (= condMapEmpty!51398 (= (arr!40326 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15728)) mapDefault!51398)))))

(declare-fun b!1276704 () Bool)

(declare-fun res!848249 () Bool)

(assert (=> b!1276704 (=> (not res!848249) (not e!728924))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276704 (= res!848249 (and (= (size!40877 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40878 _keys!1427) (size!40877 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276705 () Bool)

(declare-fun res!848247 () Bool)

(assert (=> b!1276705 (=> (not res!848247) (not e!728924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83633 (_ BitVec 32)) Bool)

(assert (=> b!1276705 (= res!848247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276706 () Bool)

(declare-fun tp_is_empty!33253 () Bool)

(assert (=> b!1276706 (= e!728926 tp_is_empty!33253)))

(declare-fun b!1276707 () Bool)

(assert (=> b!1276707 (= e!728924 (and (bvsle #b00000000000000000000000000000000 (size!40878 _keys!1427)) (bvsge (size!40878 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun b!1276708 () Bool)

(assert (=> b!1276708 (= e!728927 tp_is_empty!33253)))

(assert (= (and start!108174 res!848248) b!1276704))

(assert (= (and b!1276704 res!848249) b!1276705))

(assert (= (and b!1276705 res!848247) b!1276707))

(assert (= (and b!1276703 condMapEmpty!51398) mapIsEmpty!51398))

(assert (= (and b!1276703 (not condMapEmpty!51398)) mapNonEmpty!51398))

(get-info :version)

(assert (= (and mapNonEmpty!51398 ((_ is ValueCellFull!15728) mapValue!51398)) b!1276706))

(assert (= (and b!1276703 ((_ is ValueCellFull!15728) mapDefault!51398)) b!1276708))

(assert (= start!108174 b!1276703))

(declare-fun m!1173273 () Bool)

(assert (=> mapNonEmpty!51398 m!1173273))

(declare-fun m!1173275 () Bool)

(assert (=> start!108174 m!1173275))

(declare-fun m!1173277 () Bool)

(assert (=> start!108174 m!1173277))

(declare-fun m!1173279 () Bool)

(assert (=> start!108174 m!1173279))

(declare-fun m!1173281 () Bool)

(assert (=> b!1276705 m!1173281))

(check-sat (not b!1276705) (not start!108174) (not mapNonEmpty!51398) tp_is_empty!33253)
(check-sat)
(get-model)

(declare-fun b!1276753 () Bool)

(declare-fun e!728966 () Bool)

(declare-fun call!62703 () Bool)

(assert (=> b!1276753 (= e!728966 call!62703)))

(declare-fun bm!62700 () Bool)

(assert (=> bm!62700 (= call!62703 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1276754 () Bool)

(declare-fun e!728965 () Bool)

(assert (=> b!1276754 (= e!728965 call!62703)))

(declare-fun d!140805 () Bool)

(declare-fun res!848273 () Bool)

(declare-fun e!728964 () Bool)

(assert (=> d!140805 (=> res!848273 e!728964)))

(assert (=> d!140805 (= res!848273 (bvsge #b00000000000000000000000000000000 (size!40878 _keys!1427)))))

(assert (=> d!140805 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728964)))

(declare-fun b!1276755 () Bool)

(assert (=> b!1276755 (= e!728965 e!728966)))

(declare-fun lt!575833 () (_ BitVec 64))

(assert (=> b!1276755 (= lt!575833 (select (arr!40327 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42324 0))(
  ( (Unit!42325) )
))
(declare-fun lt!575832 () Unit!42324)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83633 (_ BitVec 64) (_ BitVec 32)) Unit!42324)

(assert (=> b!1276755 (= lt!575832 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575833 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276755 (arrayContainsKey!0 _keys!1427 lt!575833 #b00000000000000000000000000000000)))

(declare-fun lt!575831 () Unit!42324)

(assert (=> b!1276755 (= lt!575831 lt!575832)))

(declare-fun res!848272 () Bool)

(declare-datatypes ((SeekEntryResult!9958 0))(
  ( (MissingZero!9958 (index!42203 (_ BitVec 32))) (Found!9958 (index!42204 (_ BitVec 32))) (Intermediate!9958 (undefined!10770 Bool) (index!42205 (_ BitVec 32)) (x!112935 (_ BitVec 32))) (Undefined!9958) (MissingVacant!9958 (index!42206 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83633 (_ BitVec 32)) SeekEntryResult!9958)

(assert (=> b!1276755 (= res!848272 (= (seekEntryOrOpen!0 (select (arr!40327 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9958 #b00000000000000000000000000000000)))))

(assert (=> b!1276755 (=> (not res!848272) (not e!728966))))

(declare-fun b!1276756 () Bool)

(assert (=> b!1276756 (= e!728964 e!728965)))

(declare-fun c!124321 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1276756 (= c!124321 (validKeyInArray!0 (select (arr!40327 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140805 (not res!848273)) b!1276756))

(assert (= (and b!1276756 c!124321) b!1276755))

(assert (= (and b!1276756 (not c!124321)) b!1276754))

(assert (= (and b!1276755 res!848272) b!1276753))

(assert (= (or b!1276753 b!1276754) bm!62700))

(declare-fun m!1173303 () Bool)

(assert (=> bm!62700 m!1173303))

(declare-fun m!1173305 () Bool)

(assert (=> b!1276755 m!1173305))

(declare-fun m!1173307 () Bool)

(assert (=> b!1276755 m!1173307))

(declare-fun m!1173309 () Bool)

(assert (=> b!1276755 m!1173309))

(assert (=> b!1276755 m!1173305))

(declare-fun m!1173311 () Bool)

(assert (=> b!1276755 m!1173311))

(assert (=> b!1276756 m!1173305))

(assert (=> b!1276756 m!1173305))

(declare-fun m!1173313 () Bool)

(assert (=> b!1276756 m!1173313))

(assert (=> b!1276705 d!140805))

(declare-fun d!140807 () Bool)

(assert (=> d!140807 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108174 d!140807))

(declare-fun d!140809 () Bool)

(assert (=> d!140809 (= (array_inv!30835 _values!1187) (bvsge (size!40877 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108174 d!140809))

(declare-fun d!140811 () Bool)

(assert (=> d!140811 (= (array_inv!30836 _keys!1427) (bvsge (size!40878 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108174 d!140811))

(declare-fun condMapEmpty!51407 () Bool)

(declare-fun mapDefault!51407 () ValueCell!15728)

(assert (=> mapNonEmpty!51398 (= condMapEmpty!51407 (= mapRest!51398 ((as const (Array (_ BitVec 32) ValueCell!15728)) mapDefault!51407)))))

(declare-fun e!728972 () Bool)

(declare-fun mapRes!51407 () Bool)

(assert (=> mapNonEmpty!51398 (= tp!98156 (and e!728972 mapRes!51407))))

(declare-fun b!1276764 () Bool)

(assert (=> b!1276764 (= e!728972 tp_is_empty!33253)))

(declare-fun b!1276763 () Bool)

(declare-fun e!728971 () Bool)

(assert (=> b!1276763 (= e!728971 tp_is_empty!33253)))

(declare-fun mapNonEmpty!51407 () Bool)

(declare-fun tp!98165 () Bool)

(assert (=> mapNonEmpty!51407 (= mapRes!51407 (and tp!98165 e!728971))))

(declare-fun mapKey!51407 () (_ BitVec 32))

(declare-fun mapRest!51407 () (Array (_ BitVec 32) ValueCell!15728))

(declare-fun mapValue!51407 () ValueCell!15728)

(assert (=> mapNonEmpty!51407 (= mapRest!51398 (store mapRest!51407 mapKey!51407 mapValue!51407))))

(declare-fun mapIsEmpty!51407 () Bool)

(assert (=> mapIsEmpty!51407 mapRes!51407))

(assert (= (and mapNonEmpty!51398 condMapEmpty!51407) mapIsEmpty!51407))

(assert (= (and mapNonEmpty!51398 (not condMapEmpty!51407)) mapNonEmpty!51407))

(assert (= (and mapNonEmpty!51407 ((_ is ValueCellFull!15728) mapValue!51407)) b!1276763))

(assert (= (and mapNonEmpty!51398 ((_ is ValueCellFull!15728) mapDefault!51407)) b!1276764))

(declare-fun m!1173315 () Bool)

(assert (=> mapNonEmpty!51407 m!1173315))

(check-sat (not b!1276755) (not bm!62700) (not b!1276756) tp_is_empty!33253 (not mapNonEmpty!51407))
(check-sat)
