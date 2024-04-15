; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112074 () Bool)

(assert start!112074)

(declare-fun b!1327506 () Bool)

(declare-fun e!756743 () Bool)

(declare-fun tp_is_empty!36391 () Bool)

(assert (=> b!1327506 (= e!756743 tp_is_empty!36391)))

(declare-fun b!1327507 () Bool)

(declare-fun res!880900 () Bool)

(declare-fun e!756739 () Bool)

(assert (=> b!1327507 (=> (not res!880900) (not e!756739))))

(declare-datatypes ((array!89623 0))(
  ( (array!89624 (arr!43279 (Array (_ BitVec 32) (_ BitVec 64))) (size!43831 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89623)

(assert (=> b!1327507 (= res!880900 (and (bvsle #b00000000000000000000000000000000 (size!43831 _keys!1590)) (bvslt (size!43831 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!56257 () Bool)

(declare-fun mapRes!56257 () Bool)

(assert (=> mapIsEmpty!56257 mapRes!56257))

(declare-fun res!880898 () Bool)

(assert (=> start!112074 (=> (not res!880898) (not e!756739))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112074 (= res!880898 (validMask!0 mask!1998))))

(assert (=> start!112074 e!756739))

(assert (=> start!112074 true))

(declare-datatypes ((V!53625 0))(
  ( (V!53626 (val!18270 Int)) )
))
(declare-datatypes ((ValueCell!17297 0))(
  ( (ValueCellFull!17297 (v!20905 V!53625)) (EmptyCell!17297) )
))
(declare-datatypes ((array!89625 0))(
  ( (array!89626 (arr!43280 (Array (_ BitVec 32) ValueCell!17297)) (size!43832 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89625)

(declare-fun e!756740 () Bool)

(declare-fun array_inv!32833 (array!89625) Bool)

(assert (=> start!112074 (and (array_inv!32833 _values!1320) e!756740)))

(declare-fun array_inv!32834 (array!89623) Bool)

(assert (=> start!112074 (array_inv!32834 _keys!1590)))

(declare-fun b!1327508 () Bool)

(declare-fun e!756738 () Bool)

(assert (=> b!1327508 (= e!756738 tp_is_empty!36391)))

(declare-fun b!1327509 () Bool)

(declare-fun res!880899 () Bool)

(assert (=> b!1327509 (=> (not res!880899) (not e!756739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89623 (_ BitVec 32)) Bool)

(assert (=> b!1327509 (= res!880899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327510 () Bool)

(declare-fun e!756741 () Bool)

(declare-datatypes ((List!30744 0))(
  ( (Nil!30741) (Cons!30740 (h!31949 (_ BitVec 64)) (t!44742 List!30744)) )
))
(declare-fun contains!8741 (List!30744 (_ BitVec 64)) Bool)

(assert (=> b!1327510 (= e!756741 (contains!8741 Nil!30741 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327511 () Bool)

(declare-fun res!880901 () Bool)

(assert (=> b!1327511 (=> (not res!880901) (not e!756739))))

(declare-fun noDuplicate!2089 (List!30744) Bool)

(assert (=> b!1327511 (= res!880901 (noDuplicate!2089 Nil!30741))))

(declare-fun b!1327512 () Bool)

(assert (=> b!1327512 (= e!756740 (and e!756738 mapRes!56257))))

(declare-fun condMapEmpty!56257 () Bool)

(declare-fun mapDefault!56257 () ValueCell!17297)

(assert (=> b!1327512 (= condMapEmpty!56257 (= (arr!43280 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17297)) mapDefault!56257)))))

(declare-fun b!1327513 () Bool)

(declare-fun res!880896 () Bool)

(assert (=> b!1327513 (=> (not res!880896) (not e!756739))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327513 (= res!880896 (and (= (size!43832 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43831 _keys!1590) (size!43832 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56257 () Bool)

(declare-fun tp!107165 () Bool)

(assert (=> mapNonEmpty!56257 (= mapRes!56257 (and tp!107165 e!756743))))

(declare-fun mapKey!56257 () (_ BitVec 32))

(declare-fun mapRest!56257 () (Array (_ BitVec 32) ValueCell!17297))

(declare-fun mapValue!56257 () ValueCell!17297)

(assert (=> mapNonEmpty!56257 (= (arr!43280 _values!1320) (store mapRest!56257 mapKey!56257 mapValue!56257))))

(declare-fun b!1327514 () Bool)

(assert (=> b!1327514 (= e!756739 e!756741)))

(declare-fun res!880897 () Bool)

(assert (=> b!1327514 (=> res!880897 e!756741)))

(assert (=> b!1327514 (= res!880897 (contains!8741 Nil!30741 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!112074 res!880898) b!1327513))

(assert (= (and b!1327513 res!880896) b!1327509))

(assert (= (and b!1327509 res!880899) b!1327507))

(assert (= (and b!1327507 res!880900) b!1327511))

(assert (= (and b!1327511 res!880901) b!1327514))

(assert (= (and b!1327514 (not res!880897)) b!1327510))

(assert (= (and b!1327512 condMapEmpty!56257) mapIsEmpty!56257))

(assert (= (and b!1327512 (not condMapEmpty!56257)) mapNonEmpty!56257))

(get-info :version)

(assert (= (and mapNonEmpty!56257 ((_ is ValueCellFull!17297) mapValue!56257)) b!1327506))

(assert (= (and b!1327512 ((_ is ValueCellFull!17297) mapDefault!56257)) b!1327508))

(assert (= start!112074 b!1327512))

(declare-fun m!1216325 () Bool)

(assert (=> b!1327509 m!1216325))

(declare-fun m!1216327 () Bool)

(assert (=> b!1327510 m!1216327))

(declare-fun m!1216329 () Bool)

(assert (=> start!112074 m!1216329))

(declare-fun m!1216331 () Bool)

(assert (=> start!112074 m!1216331))

(declare-fun m!1216333 () Bool)

(assert (=> start!112074 m!1216333))

(declare-fun m!1216335 () Bool)

(assert (=> mapNonEmpty!56257 m!1216335))

(declare-fun m!1216337 () Bool)

(assert (=> b!1327511 m!1216337))

(declare-fun m!1216339 () Bool)

(assert (=> b!1327514 m!1216339))

(check-sat tp_is_empty!36391 (not b!1327514) (not b!1327509) (not b!1327510) (not start!112074) (not mapNonEmpty!56257) (not b!1327511))
(check-sat)
(get-model)

(declare-fun d!143223 () Bool)

(assert (=> d!143223 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112074 d!143223))

(declare-fun d!143225 () Bool)

(assert (=> d!143225 (= (array_inv!32833 _values!1320) (bvsge (size!43832 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112074 d!143225))

(declare-fun d!143227 () Bool)

(assert (=> d!143227 (= (array_inv!32834 _keys!1590) (bvsge (size!43831 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112074 d!143227))

(declare-fun b!1327577 () Bool)

(declare-fun e!756787 () Bool)

(declare-fun e!756786 () Bool)

(assert (=> b!1327577 (= e!756787 e!756786)))

(declare-fun c!125883 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327577 (= c!125883 (validKeyInArray!0 (select (arr!43279 _keys!1590) #b00000000000000000000000000000000)))))

(declare-fun b!1327578 () Bool)

(declare-fun e!756788 () Bool)

(declare-fun call!64803 () Bool)

(assert (=> b!1327578 (= e!756788 call!64803)))

(declare-fun bm!64800 () Bool)

(assert (=> bm!64800 (= call!64803 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1327580 () Bool)

(assert (=> b!1327580 (= e!756786 call!64803)))

(declare-fun b!1327579 () Bool)

(assert (=> b!1327579 (= e!756786 e!756788)))

(declare-fun lt!590542 () (_ BitVec 64))

(assert (=> b!1327579 (= lt!590542 (select (arr!43279 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43532 0))(
  ( (Unit!43533) )
))
(declare-fun lt!590543 () Unit!43532)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89623 (_ BitVec 64) (_ BitVec 32)) Unit!43532)

(assert (=> b!1327579 (= lt!590543 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590542 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327579 (arrayContainsKey!0 _keys!1590 lt!590542 #b00000000000000000000000000000000)))

(declare-fun lt!590544 () Unit!43532)

(assert (=> b!1327579 (= lt!590544 lt!590543)))

(declare-fun res!880942 () Bool)

(declare-datatypes ((SeekEntryResult!10045 0))(
  ( (MissingZero!10045 (index!42551 (_ BitVec 32))) (Found!10045 (index!42552 (_ BitVec 32))) (Intermediate!10045 (undefined!10857 Bool) (index!42553 (_ BitVec 32)) (x!118374 (_ BitVec 32))) (Undefined!10045) (MissingVacant!10045 (index!42554 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89623 (_ BitVec 32)) SeekEntryResult!10045)

(assert (=> b!1327579 (= res!880942 (= (seekEntryOrOpen!0 (select (arr!43279 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10045 #b00000000000000000000000000000000)))))

(assert (=> b!1327579 (=> (not res!880942) (not e!756788))))

(declare-fun d!143229 () Bool)

(declare-fun res!880943 () Bool)

(assert (=> d!143229 (=> res!880943 e!756787)))

(assert (=> d!143229 (= res!880943 (bvsge #b00000000000000000000000000000000 (size!43831 _keys!1590)))))

(assert (=> d!143229 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756787)))

(assert (= (and d!143229 (not res!880943)) b!1327577))

(assert (= (and b!1327577 c!125883) b!1327579))

(assert (= (and b!1327577 (not c!125883)) b!1327580))

(assert (= (and b!1327579 res!880942) b!1327578))

(assert (= (or b!1327578 b!1327580) bm!64800))

(declare-fun m!1216373 () Bool)

(assert (=> b!1327577 m!1216373))

(assert (=> b!1327577 m!1216373))

(declare-fun m!1216375 () Bool)

(assert (=> b!1327577 m!1216375))

(declare-fun m!1216377 () Bool)

(assert (=> bm!64800 m!1216377))

(assert (=> b!1327579 m!1216373))

(declare-fun m!1216379 () Bool)

(assert (=> b!1327579 m!1216379))

(declare-fun m!1216381 () Bool)

(assert (=> b!1327579 m!1216381))

(assert (=> b!1327579 m!1216373))

(declare-fun m!1216383 () Bool)

(assert (=> b!1327579 m!1216383))

(assert (=> b!1327509 d!143229))

(declare-fun d!143231 () Bool)

(declare-fun res!880948 () Bool)

(declare-fun e!756793 () Bool)

(assert (=> d!143231 (=> res!880948 e!756793)))

(assert (=> d!143231 (= res!880948 ((_ is Nil!30741) Nil!30741))))

(assert (=> d!143231 (= (noDuplicate!2089 Nil!30741) e!756793)))

(declare-fun b!1327585 () Bool)

(declare-fun e!756794 () Bool)

(assert (=> b!1327585 (= e!756793 e!756794)))

(declare-fun res!880949 () Bool)

(assert (=> b!1327585 (=> (not res!880949) (not e!756794))))

(assert (=> b!1327585 (= res!880949 (not (contains!8741 (t!44742 Nil!30741) (h!31949 Nil!30741))))))

(declare-fun b!1327586 () Bool)

(assert (=> b!1327586 (= e!756794 (noDuplicate!2089 (t!44742 Nil!30741)))))

(assert (= (and d!143231 (not res!880948)) b!1327585))

(assert (= (and b!1327585 res!880949) b!1327586))

(declare-fun m!1216385 () Bool)

(assert (=> b!1327585 m!1216385))

(declare-fun m!1216387 () Bool)

(assert (=> b!1327586 m!1216387))

(assert (=> b!1327511 d!143231))

(declare-fun d!143233 () Bool)

(declare-fun lt!590547 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!654 (List!30744) (InoxSet (_ BitVec 64)))

(assert (=> d!143233 (= lt!590547 (select (content!654 Nil!30741) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!756800 () Bool)

(assert (=> d!143233 (= lt!590547 e!756800)))

(declare-fun res!880954 () Bool)

(assert (=> d!143233 (=> (not res!880954) (not e!756800))))

(assert (=> d!143233 (= res!880954 ((_ is Cons!30740) Nil!30741))))

(assert (=> d!143233 (= (contains!8741 Nil!30741 #b0000000000000000000000000000000000000000000000000000000000000000) lt!590547)))

(declare-fun b!1327591 () Bool)

(declare-fun e!756799 () Bool)

(assert (=> b!1327591 (= e!756800 e!756799)))

(declare-fun res!880955 () Bool)

(assert (=> b!1327591 (=> res!880955 e!756799)))

(assert (=> b!1327591 (= res!880955 (= (h!31949 Nil!30741) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327592 () Bool)

(assert (=> b!1327592 (= e!756799 (contains!8741 (t!44742 Nil!30741) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143233 res!880954) b!1327591))

(assert (= (and b!1327591 (not res!880955)) b!1327592))

(declare-fun m!1216389 () Bool)

(assert (=> d!143233 m!1216389))

(declare-fun m!1216391 () Bool)

(assert (=> d!143233 m!1216391))

(declare-fun m!1216393 () Bool)

(assert (=> b!1327592 m!1216393))

(assert (=> b!1327514 d!143233))

(declare-fun d!143235 () Bool)

(declare-fun lt!590548 () Bool)

(assert (=> d!143235 (= lt!590548 (select (content!654 Nil!30741) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!756802 () Bool)

(assert (=> d!143235 (= lt!590548 e!756802)))

(declare-fun res!880956 () Bool)

(assert (=> d!143235 (=> (not res!880956) (not e!756802))))

(assert (=> d!143235 (= res!880956 ((_ is Cons!30740) Nil!30741))))

(assert (=> d!143235 (= (contains!8741 Nil!30741 #b1000000000000000000000000000000000000000000000000000000000000000) lt!590548)))

(declare-fun b!1327593 () Bool)

(declare-fun e!756801 () Bool)

(assert (=> b!1327593 (= e!756802 e!756801)))

(declare-fun res!880957 () Bool)

(assert (=> b!1327593 (=> res!880957 e!756801)))

(assert (=> b!1327593 (= res!880957 (= (h!31949 Nil!30741) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327594 () Bool)

(assert (=> b!1327594 (= e!756801 (contains!8741 (t!44742 Nil!30741) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!143235 res!880956) b!1327593))

(assert (= (and b!1327593 (not res!880957)) b!1327594))

(assert (=> d!143235 m!1216389))

(declare-fun m!1216395 () Bool)

(assert (=> d!143235 m!1216395))

(declare-fun m!1216397 () Bool)

(assert (=> b!1327594 m!1216397))

(assert (=> b!1327510 d!143235))

(declare-fun mapNonEmpty!56266 () Bool)

(declare-fun mapRes!56266 () Bool)

(declare-fun tp!107174 () Bool)

(declare-fun e!756807 () Bool)

(assert (=> mapNonEmpty!56266 (= mapRes!56266 (and tp!107174 e!756807))))

(declare-fun mapKey!56266 () (_ BitVec 32))

(declare-fun mapValue!56266 () ValueCell!17297)

(declare-fun mapRest!56266 () (Array (_ BitVec 32) ValueCell!17297))

(assert (=> mapNonEmpty!56266 (= mapRest!56257 (store mapRest!56266 mapKey!56266 mapValue!56266))))

(declare-fun b!1327601 () Bool)

(assert (=> b!1327601 (= e!756807 tp_is_empty!36391)))

(declare-fun condMapEmpty!56266 () Bool)

(declare-fun mapDefault!56266 () ValueCell!17297)

(assert (=> mapNonEmpty!56257 (= condMapEmpty!56266 (= mapRest!56257 ((as const (Array (_ BitVec 32) ValueCell!17297)) mapDefault!56266)))))

(declare-fun e!756808 () Bool)

(assert (=> mapNonEmpty!56257 (= tp!107165 (and e!756808 mapRes!56266))))

(declare-fun b!1327602 () Bool)

(assert (=> b!1327602 (= e!756808 tp_is_empty!36391)))

(declare-fun mapIsEmpty!56266 () Bool)

(assert (=> mapIsEmpty!56266 mapRes!56266))

(assert (= (and mapNonEmpty!56257 condMapEmpty!56266) mapIsEmpty!56266))

(assert (= (and mapNonEmpty!56257 (not condMapEmpty!56266)) mapNonEmpty!56266))

(assert (= (and mapNonEmpty!56266 ((_ is ValueCellFull!17297) mapValue!56266)) b!1327601))

(assert (= (and mapNonEmpty!56257 ((_ is ValueCellFull!17297) mapDefault!56266)) b!1327602))

(declare-fun m!1216399 () Bool)

(assert (=> mapNonEmpty!56266 m!1216399))

(check-sat tp_is_empty!36391 (not b!1327594) (not b!1327577) (not d!143235) (not b!1327592) (not d!143233) (not mapNonEmpty!56266) (not b!1327579) (not b!1327585) (not bm!64800) (not b!1327586))
(check-sat)
