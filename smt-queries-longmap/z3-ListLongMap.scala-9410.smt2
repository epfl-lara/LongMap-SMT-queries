; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112254 () Bool)

(assert start!112254)

(declare-fun b!1328632 () Bool)

(declare-fun res!881323 () Bool)

(declare-fun e!757430 () Bool)

(assert (=> b!1328632 (=> (not res!881323) (not e!757430))))

(declare-datatypes ((array!89751 0))(
  ( (array!89752 (arr!43341 (Array (_ BitVec 32) (_ BitVec 64))) (size!43892 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89751)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89751 (_ BitVec 32)) Bool)

(assert (=> b!1328632 (= res!881323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328633 () Bool)

(assert (=> b!1328633 (= e!757430 (bvsgt #b00000000000000000000000000000000 (size!43892 _keys!1590)))))

(declare-fun mapNonEmpty!56221 () Bool)

(declare-fun mapRes!56221 () Bool)

(declare-fun tp!107128 () Bool)

(declare-fun e!757428 () Bool)

(assert (=> mapNonEmpty!56221 (= mapRes!56221 (and tp!107128 e!757428))))

(declare-datatypes ((V!53601 0))(
  ( (V!53602 (val!18261 Int)) )
))
(declare-datatypes ((ValueCell!17288 0))(
  ( (ValueCellFull!17288 (v!20892 V!53601)) (EmptyCell!17288) )
))
(declare-datatypes ((array!89753 0))(
  ( (array!89754 (arr!43342 (Array (_ BitVec 32) ValueCell!17288)) (size!43893 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89753)

(declare-fun mapKey!56221 () (_ BitVec 32))

(declare-fun mapRest!56221 () (Array (_ BitVec 32) ValueCell!17288))

(declare-fun mapValue!56221 () ValueCell!17288)

(assert (=> mapNonEmpty!56221 (= (arr!43342 _values!1320) (store mapRest!56221 mapKey!56221 mapValue!56221))))

(declare-fun mapIsEmpty!56221 () Bool)

(assert (=> mapIsEmpty!56221 mapRes!56221))

(declare-fun b!1328634 () Bool)

(declare-fun e!757429 () Bool)

(declare-fun tp_is_empty!36373 () Bool)

(assert (=> b!1328634 (= e!757429 tp_is_empty!36373)))

(declare-fun b!1328635 () Bool)

(declare-fun res!881325 () Bool)

(assert (=> b!1328635 (=> (not res!881325) (not e!757430))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328635 (= res!881325 (and (= (size!43893 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43892 _keys!1590) (size!43893 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328636 () Bool)

(assert (=> b!1328636 (= e!757428 tp_is_empty!36373)))

(declare-fun b!1328637 () Bool)

(declare-fun e!757426 () Bool)

(assert (=> b!1328637 (= e!757426 (and e!757429 mapRes!56221))))

(declare-fun condMapEmpty!56221 () Bool)

(declare-fun mapDefault!56221 () ValueCell!17288)

(assert (=> b!1328637 (= condMapEmpty!56221 (= (arr!43342 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17288)) mapDefault!56221)))))

(declare-fun res!881324 () Bool)

(assert (=> start!112254 (=> (not res!881324) (not e!757430))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112254 (= res!881324 (validMask!0 mask!1998))))

(assert (=> start!112254 e!757430))

(assert (=> start!112254 true))

(declare-fun array_inv!32973 (array!89753) Bool)

(assert (=> start!112254 (and (array_inv!32973 _values!1320) e!757426)))

(declare-fun array_inv!32974 (array!89751) Bool)

(assert (=> start!112254 (array_inv!32974 _keys!1590)))

(assert (= (and start!112254 res!881324) b!1328635))

(assert (= (and b!1328635 res!881325) b!1328632))

(assert (= (and b!1328632 res!881323) b!1328633))

(assert (= (and b!1328637 condMapEmpty!56221) mapIsEmpty!56221))

(assert (= (and b!1328637 (not condMapEmpty!56221)) mapNonEmpty!56221))

(get-info :version)

(assert (= (and mapNonEmpty!56221 ((_ is ValueCellFull!17288) mapValue!56221)) b!1328636))

(assert (= (and b!1328637 ((_ is ValueCellFull!17288) mapDefault!56221)) b!1328634))

(assert (= start!112254 b!1328637))

(declare-fun m!1218297 () Bool)

(assert (=> b!1328632 m!1218297))

(declare-fun m!1218299 () Bool)

(assert (=> mapNonEmpty!56221 m!1218299))

(declare-fun m!1218301 () Bool)

(assert (=> start!112254 m!1218301))

(declare-fun m!1218303 () Bool)

(assert (=> start!112254 m!1218303))

(declare-fun m!1218305 () Bool)

(assert (=> start!112254 m!1218305))

(check-sat (not start!112254) (not b!1328632) (not mapNonEmpty!56221) tp_is_empty!36373)
(check-sat)
(get-model)

(declare-fun d!143751 () Bool)

(assert (=> d!143751 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112254 d!143751))

(declare-fun d!143753 () Bool)

(assert (=> d!143753 (= (array_inv!32973 _values!1320) (bvsge (size!43893 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112254 d!143753))

(declare-fun d!143755 () Bool)

(assert (=> d!143755 (= (array_inv!32974 _keys!1590) (bvsge (size!43892 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112254 d!143755))

(declare-fun b!1328682 () Bool)

(declare-fun e!757469 () Bool)

(declare-fun e!757467 () Bool)

(assert (=> b!1328682 (= e!757469 e!757467)))

(declare-fun lt!591179 () (_ BitVec 64))

(assert (=> b!1328682 (= lt!591179 (select (arr!43341 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43674 0))(
  ( (Unit!43675) )
))
(declare-fun lt!591178 () Unit!43674)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89751 (_ BitVec 64) (_ BitVec 32)) Unit!43674)

(assert (=> b!1328682 (= lt!591178 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!591179 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1328682 (arrayContainsKey!0 _keys!1590 lt!591179 #b00000000000000000000000000000000)))

(declare-fun lt!591177 () Unit!43674)

(assert (=> b!1328682 (= lt!591177 lt!591178)))

(declare-fun res!881348 () Bool)

(declare-datatypes ((SeekEntryResult!9999 0))(
  ( (MissingZero!9999 (index!42367 (_ BitVec 32))) (Found!9999 (index!42368 (_ BitVec 32))) (Intermediate!9999 (undefined!10811 Bool) (index!42369 (_ BitVec 32)) (x!118323 (_ BitVec 32))) (Undefined!9999) (MissingVacant!9999 (index!42370 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89751 (_ BitVec 32)) SeekEntryResult!9999)

(assert (=> b!1328682 (= res!881348 (= (seekEntryOrOpen!0 (select (arr!43341 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!9999 #b00000000000000000000000000000000)))))

(assert (=> b!1328682 (=> (not res!881348) (not e!757467))))

(declare-fun b!1328683 () Bool)

(declare-fun call!64878 () Bool)

(assert (=> b!1328683 (= e!757469 call!64878)))

(declare-fun d!143757 () Bool)

(declare-fun res!881349 () Bool)

(declare-fun e!757468 () Bool)

(assert (=> d!143757 (=> res!881349 e!757468)))

(assert (=> d!143757 (= res!881349 (bvsge #b00000000000000000000000000000000 (size!43892 _keys!1590)))))

(assert (=> d!143757 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!757468)))

(declare-fun bm!64875 () Bool)

(assert (=> bm!64875 (= call!64878 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1328684 () Bool)

(assert (=> b!1328684 (= e!757467 call!64878)))

(declare-fun b!1328685 () Bool)

(assert (=> b!1328685 (= e!757468 e!757469)))

(declare-fun c!126290 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328685 (= c!126290 (validKeyInArray!0 (select (arr!43341 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143757 (not res!881349)) b!1328685))

(assert (= (and b!1328685 c!126290) b!1328682))

(assert (= (and b!1328685 (not c!126290)) b!1328683))

(assert (= (and b!1328682 res!881348) b!1328684))

(assert (= (or b!1328684 b!1328683) bm!64875))

(declare-fun m!1218327 () Bool)

(assert (=> b!1328682 m!1218327))

(declare-fun m!1218329 () Bool)

(assert (=> b!1328682 m!1218329))

(declare-fun m!1218331 () Bool)

(assert (=> b!1328682 m!1218331))

(assert (=> b!1328682 m!1218327))

(declare-fun m!1218333 () Bool)

(assert (=> b!1328682 m!1218333))

(declare-fun m!1218335 () Bool)

(assert (=> bm!64875 m!1218335))

(assert (=> b!1328685 m!1218327))

(assert (=> b!1328685 m!1218327))

(declare-fun m!1218337 () Bool)

(assert (=> b!1328685 m!1218337))

(assert (=> b!1328632 d!143757))

(declare-fun mapNonEmpty!56230 () Bool)

(declare-fun mapRes!56230 () Bool)

(declare-fun tp!107137 () Bool)

(declare-fun e!757475 () Bool)

(assert (=> mapNonEmpty!56230 (= mapRes!56230 (and tp!107137 e!757475))))

(declare-fun mapKey!56230 () (_ BitVec 32))

(declare-fun mapValue!56230 () ValueCell!17288)

(declare-fun mapRest!56230 () (Array (_ BitVec 32) ValueCell!17288))

(assert (=> mapNonEmpty!56230 (= mapRest!56221 (store mapRest!56230 mapKey!56230 mapValue!56230))))

(declare-fun b!1328693 () Bool)

(declare-fun e!757474 () Bool)

(assert (=> b!1328693 (= e!757474 tp_is_empty!36373)))

(declare-fun b!1328692 () Bool)

(assert (=> b!1328692 (= e!757475 tp_is_empty!36373)))

(declare-fun condMapEmpty!56230 () Bool)

(declare-fun mapDefault!56230 () ValueCell!17288)

(assert (=> mapNonEmpty!56221 (= condMapEmpty!56230 (= mapRest!56221 ((as const (Array (_ BitVec 32) ValueCell!17288)) mapDefault!56230)))))

(assert (=> mapNonEmpty!56221 (= tp!107128 (and e!757474 mapRes!56230))))

(declare-fun mapIsEmpty!56230 () Bool)

(assert (=> mapIsEmpty!56230 mapRes!56230))

(assert (= (and mapNonEmpty!56221 condMapEmpty!56230) mapIsEmpty!56230))

(assert (= (and mapNonEmpty!56221 (not condMapEmpty!56230)) mapNonEmpty!56230))

(assert (= (and mapNonEmpty!56230 ((_ is ValueCellFull!17288) mapValue!56230)) b!1328692))

(assert (= (and mapNonEmpty!56221 ((_ is ValueCellFull!17288) mapDefault!56230)) b!1328693))

(declare-fun m!1218339 () Bool)

(assert (=> mapNonEmpty!56230 m!1218339))

(check-sat tp_is_empty!36373 (not b!1328685) (not mapNonEmpty!56230) (not bm!64875) (not b!1328682))
(check-sat)
