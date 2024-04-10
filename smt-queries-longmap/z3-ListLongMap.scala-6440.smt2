; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82470 () Bool)

(assert start!82470)

(declare-fun b!961270 () Bool)

(declare-fun e!541964 () Bool)

(declare-datatypes ((List!19685 0))(
  ( (Nil!19682) (Cons!19681 (h!20843 (_ BitVec 64)) (t!28048 List!19685)) )
))
(declare-fun contains!5394 (List!19685 (_ BitVec 64)) Bool)

(assert (=> b!961270 (= e!541964 (contains!5394 Nil!19682 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961271 () Bool)

(declare-fun res!643383 () Bool)

(declare-fun e!541967 () Bool)

(assert (=> b!961271 (=> (not res!643383) (not e!541967))))

(declare-datatypes ((array!58929 0))(
  ( (array!58930 (arr!28334 (Array (_ BitVec 32) (_ BitVec 64))) (size!28813 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58929)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58929 (_ BitVec 32)) Bool)

(assert (=> b!961271 (= res!643383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34117 () Bool)

(declare-fun mapRes!34117 () Bool)

(assert (=> mapIsEmpty!34117 mapRes!34117))

(declare-fun b!961273 () Bool)

(declare-fun e!541966 () Bool)

(declare-fun tp_is_empty!21417 () Bool)

(assert (=> b!961273 (= e!541966 tp_is_empty!21417)))

(declare-fun b!961274 () Bool)

(declare-fun res!643384 () Bool)

(assert (=> b!961274 (=> (not res!643384) (not e!541967))))

(assert (=> b!961274 (= res!643384 (and (bvsle #b00000000000000000000000000000000 (size!28813 _keys!1686)) (bvslt (size!28813 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!34117 () Bool)

(declare-fun tp!65046 () Bool)

(assert (=> mapNonEmpty!34117 (= mapRes!34117 (and tp!65046 e!541966))))

(declare-datatypes ((V!33539 0))(
  ( (V!33540 (val!10759 Int)) )
))
(declare-datatypes ((ValueCell!10227 0))(
  ( (ValueCellFull!10227 (v!13316 V!33539)) (EmptyCell!10227) )
))
(declare-fun mapValue!34117 () ValueCell!10227)

(declare-datatypes ((array!58931 0))(
  ( (array!58932 (arr!28335 (Array (_ BitVec 32) ValueCell!10227)) (size!28814 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58931)

(declare-fun mapKey!34117 () (_ BitVec 32))

(declare-fun mapRest!34117 () (Array (_ BitVec 32) ValueCell!10227))

(assert (=> mapNonEmpty!34117 (= (arr!28335 _values!1400) (store mapRest!34117 mapKey!34117 mapValue!34117))))

(declare-fun b!961272 () Bool)

(declare-fun e!541965 () Bool)

(declare-fun e!541963 () Bool)

(assert (=> b!961272 (= e!541965 (and e!541963 mapRes!34117))))

(declare-fun condMapEmpty!34117 () Bool)

(declare-fun mapDefault!34117 () ValueCell!10227)

(assert (=> b!961272 (= condMapEmpty!34117 (= (arr!28335 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10227)) mapDefault!34117)))))

(declare-fun res!643382 () Bool)

(assert (=> start!82470 (=> (not res!643382) (not e!541967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82470 (= res!643382 (validMask!0 mask!2110))))

(assert (=> start!82470 e!541967))

(assert (=> start!82470 true))

(declare-fun array_inv!21955 (array!58931) Bool)

(assert (=> start!82470 (and (array_inv!21955 _values!1400) e!541965)))

(declare-fun array_inv!21956 (array!58929) Bool)

(assert (=> start!82470 (array_inv!21956 _keys!1686)))

(declare-fun b!961275 () Bool)

(assert (=> b!961275 (= e!541963 tp_is_empty!21417)))

(declare-fun b!961276 () Bool)

(declare-fun res!643385 () Bool)

(assert (=> b!961276 (=> (not res!643385) (not e!541967))))

(declare-fun noDuplicate!1368 (List!19685) Bool)

(assert (=> b!961276 (= res!643385 (noDuplicate!1368 Nil!19682))))

(declare-fun b!961277 () Bool)

(assert (=> b!961277 (= e!541967 e!541964)))

(declare-fun res!643381 () Bool)

(assert (=> b!961277 (=> res!643381 e!541964)))

(assert (=> b!961277 (= res!643381 (contains!5394 Nil!19682 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961278 () Bool)

(declare-fun res!643380 () Bool)

(assert (=> b!961278 (=> (not res!643380) (not e!541967))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961278 (= res!643380 (and (= (size!28814 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28813 _keys!1686) (size!28814 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82470 res!643382) b!961278))

(assert (= (and b!961278 res!643380) b!961271))

(assert (= (and b!961271 res!643383) b!961274))

(assert (= (and b!961274 res!643384) b!961276))

(assert (= (and b!961276 res!643385) b!961277))

(assert (= (and b!961277 (not res!643381)) b!961270))

(assert (= (and b!961272 condMapEmpty!34117) mapIsEmpty!34117))

(assert (= (and b!961272 (not condMapEmpty!34117)) mapNonEmpty!34117))

(get-info :version)

(assert (= (and mapNonEmpty!34117 ((_ is ValueCellFull!10227) mapValue!34117)) b!961273))

(assert (= (and b!961272 ((_ is ValueCellFull!10227) mapDefault!34117)) b!961275))

(assert (= start!82470 b!961272))

(declare-fun m!891273 () Bool)

(assert (=> b!961276 m!891273))

(declare-fun m!891275 () Bool)

(assert (=> mapNonEmpty!34117 m!891275))

(declare-fun m!891277 () Bool)

(assert (=> b!961270 m!891277))

(declare-fun m!891279 () Bool)

(assert (=> b!961271 m!891279))

(declare-fun m!891281 () Bool)

(assert (=> start!82470 m!891281))

(declare-fun m!891283 () Bool)

(assert (=> start!82470 m!891283))

(declare-fun m!891285 () Bool)

(assert (=> start!82470 m!891285))

(declare-fun m!891287 () Bool)

(assert (=> b!961277 m!891287))

(check-sat tp_is_empty!21417 (not start!82470) (not b!961277) (not b!961276) (not b!961271) (not mapNonEmpty!34117) (not b!961270))
(check-sat)
(get-model)

(declare-fun d!116053 () Bool)

(declare-fun lt!430728 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!414 (List!19685) (InoxSet (_ BitVec 64)))

(assert (=> d!116053 (= lt!430728 (select (content!414 Nil!19682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!541991 () Bool)

(assert (=> d!116053 (= lt!430728 e!541991)))

(declare-fun res!643409 () Bool)

(assert (=> d!116053 (=> (not res!643409) (not e!541991))))

(assert (=> d!116053 (= res!643409 ((_ is Cons!19681) Nil!19682))))

(assert (=> d!116053 (= (contains!5394 Nil!19682 #b0000000000000000000000000000000000000000000000000000000000000000) lt!430728)))

(declare-fun b!961310 () Bool)

(declare-fun e!541992 () Bool)

(assert (=> b!961310 (= e!541991 e!541992)))

(declare-fun res!643408 () Bool)

(assert (=> b!961310 (=> res!643408 e!541992)))

(assert (=> b!961310 (= res!643408 (= (h!20843 Nil!19682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961311 () Bool)

(assert (=> b!961311 (= e!541992 (contains!5394 (t!28048 Nil!19682) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116053 res!643409) b!961310))

(assert (= (and b!961310 (not res!643408)) b!961311))

(declare-fun m!891305 () Bool)

(assert (=> d!116053 m!891305))

(declare-fun m!891307 () Bool)

(assert (=> d!116053 m!891307))

(declare-fun m!891309 () Bool)

(assert (=> b!961311 m!891309))

(assert (=> b!961277 d!116053))

(declare-fun d!116055 () Bool)

(assert (=> d!116055 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82470 d!116055))

(declare-fun d!116057 () Bool)

(assert (=> d!116057 (= (array_inv!21955 _values!1400) (bvsge (size!28814 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82470 d!116057))

(declare-fun d!116059 () Bool)

(assert (=> d!116059 (= (array_inv!21956 _keys!1686) (bvsge (size!28813 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82470 d!116059))

(declare-fun d!116061 () Bool)

(declare-fun lt!430729 () Bool)

(assert (=> d!116061 (= lt!430729 (select (content!414 Nil!19682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!541993 () Bool)

(assert (=> d!116061 (= lt!430729 e!541993)))

(declare-fun res!643411 () Bool)

(assert (=> d!116061 (=> (not res!643411) (not e!541993))))

(assert (=> d!116061 (= res!643411 ((_ is Cons!19681) Nil!19682))))

(assert (=> d!116061 (= (contains!5394 Nil!19682 #b1000000000000000000000000000000000000000000000000000000000000000) lt!430729)))

(declare-fun b!961312 () Bool)

(declare-fun e!541994 () Bool)

(assert (=> b!961312 (= e!541993 e!541994)))

(declare-fun res!643410 () Bool)

(assert (=> b!961312 (=> res!643410 e!541994)))

(assert (=> b!961312 (= res!643410 (= (h!20843 Nil!19682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!961313 () Bool)

(assert (=> b!961313 (= e!541994 (contains!5394 (t!28048 Nil!19682) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116061 res!643411) b!961312))

(assert (= (and b!961312 (not res!643410)) b!961313))

(assert (=> d!116061 m!891305))

(declare-fun m!891311 () Bool)

(assert (=> d!116061 m!891311))

(declare-fun m!891313 () Bool)

(assert (=> b!961313 m!891313))

(assert (=> b!961270 d!116061))

(declare-fun b!961322 () Bool)

(declare-fun e!542001 () Bool)

(declare-fun e!542002 () Bool)

(assert (=> b!961322 (= e!542001 e!542002)))

(declare-fun lt!430738 () (_ BitVec 64))

(assert (=> b!961322 (= lt!430738 (select (arr!28334 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32211 0))(
  ( (Unit!32212) )
))
(declare-fun lt!430736 () Unit!32211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58929 (_ BitVec 64) (_ BitVec 32)) Unit!32211)

(assert (=> b!961322 (= lt!430736 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430738 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58929 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!961322 (arrayContainsKey!0 _keys!1686 lt!430738 #b00000000000000000000000000000000)))

(declare-fun lt!430737 () Unit!32211)

(assert (=> b!961322 (= lt!430737 lt!430736)))

(declare-fun res!643416 () Bool)

(declare-datatypes ((SeekEntryResult!9196 0))(
  ( (MissingZero!9196 (index!39155 (_ BitVec 32))) (Found!9196 (index!39156 (_ BitVec 32))) (Intermediate!9196 (undefined!10008 Bool) (index!39157 (_ BitVec 32)) (x!82940 (_ BitVec 32))) (Undefined!9196) (MissingVacant!9196 (index!39158 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58929 (_ BitVec 32)) SeekEntryResult!9196)

(assert (=> b!961322 (= res!643416 (= (seekEntryOrOpen!0 (select (arr!28334 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9196 #b00000000000000000000000000000000)))))

(assert (=> b!961322 (=> (not res!643416) (not e!542002))))

(declare-fun bm!41726 () Bool)

(declare-fun call!41729 () Bool)

(assert (=> bm!41726 (= call!41729 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!961323 () Bool)

(assert (=> b!961323 (= e!542001 call!41729)))

(declare-fun d!116063 () Bool)

(declare-fun res!643417 () Bool)

(declare-fun e!542003 () Bool)

(assert (=> d!116063 (=> res!643417 e!542003)))

(assert (=> d!116063 (= res!643417 (bvsge #b00000000000000000000000000000000 (size!28813 _keys!1686)))))

(assert (=> d!116063 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!542003)))

(declare-fun b!961324 () Bool)

(assert (=> b!961324 (= e!542002 call!41729)))

(declare-fun b!961325 () Bool)

(assert (=> b!961325 (= e!542003 e!542001)))

(declare-fun c!99917 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961325 (= c!99917 (validKeyInArray!0 (select (arr!28334 _keys!1686) #b00000000000000000000000000000000)))))

(assert (= (and d!116063 (not res!643417)) b!961325))

(assert (= (and b!961325 c!99917) b!961322))

(assert (= (and b!961325 (not c!99917)) b!961323))

(assert (= (and b!961322 res!643416) b!961324))

(assert (= (or b!961324 b!961323) bm!41726))

(declare-fun m!891315 () Bool)

(assert (=> b!961322 m!891315))

(declare-fun m!891317 () Bool)

(assert (=> b!961322 m!891317))

(declare-fun m!891319 () Bool)

(assert (=> b!961322 m!891319))

(assert (=> b!961322 m!891315))

(declare-fun m!891321 () Bool)

(assert (=> b!961322 m!891321))

(declare-fun m!891323 () Bool)

(assert (=> bm!41726 m!891323))

(assert (=> b!961325 m!891315))

(assert (=> b!961325 m!891315))

(declare-fun m!891325 () Bool)

(assert (=> b!961325 m!891325))

(assert (=> b!961271 d!116063))

(declare-fun d!116065 () Bool)

(declare-fun res!643422 () Bool)

(declare-fun e!542008 () Bool)

(assert (=> d!116065 (=> res!643422 e!542008)))

(assert (=> d!116065 (= res!643422 ((_ is Nil!19682) Nil!19682))))

(assert (=> d!116065 (= (noDuplicate!1368 Nil!19682) e!542008)))

(declare-fun b!961330 () Bool)

(declare-fun e!542009 () Bool)

(assert (=> b!961330 (= e!542008 e!542009)))

(declare-fun res!643423 () Bool)

(assert (=> b!961330 (=> (not res!643423) (not e!542009))))

(assert (=> b!961330 (= res!643423 (not (contains!5394 (t!28048 Nil!19682) (h!20843 Nil!19682))))))

(declare-fun b!961331 () Bool)

(assert (=> b!961331 (= e!542009 (noDuplicate!1368 (t!28048 Nil!19682)))))

(assert (= (and d!116065 (not res!643422)) b!961330))

(assert (= (and b!961330 res!643423) b!961331))

(declare-fun m!891327 () Bool)

(assert (=> b!961330 m!891327))

(declare-fun m!891329 () Bool)

(assert (=> b!961331 m!891329))

(assert (=> b!961276 d!116065))

(declare-fun b!961339 () Bool)

(declare-fun e!542014 () Bool)

(assert (=> b!961339 (= e!542014 tp_is_empty!21417)))

(declare-fun mapNonEmpty!34123 () Bool)

(declare-fun mapRes!34123 () Bool)

(declare-fun tp!65052 () Bool)

(declare-fun e!542015 () Bool)

(assert (=> mapNonEmpty!34123 (= mapRes!34123 (and tp!65052 e!542015))))

(declare-fun mapRest!34123 () (Array (_ BitVec 32) ValueCell!10227))

(declare-fun mapValue!34123 () ValueCell!10227)

(declare-fun mapKey!34123 () (_ BitVec 32))

(assert (=> mapNonEmpty!34123 (= mapRest!34117 (store mapRest!34123 mapKey!34123 mapValue!34123))))

(declare-fun b!961338 () Bool)

(assert (=> b!961338 (= e!542015 tp_is_empty!21417)))

(declare-fun mapIsEmpty!34123 () Bool)

(assert (=> mapIsEmpty!34123 mapRes!34123))

(declare-fun condMapEmpty!34123 () Bool)

(declare-fun mapDefault!34123 () ValueCell!10227)

(assert (=> mapNonEmpty!34117 (= condMapEmpty!34123 (= mapRest!34117 ((as const (Array (_ BitVec 32) ValueCell!10227)) mapDefault!34123)))))

(assert (=> mapNonEmpty!34117 (= tp!65046 (and e!542014 mapRes!34123))))

(assert (= (and mapNonEmpty!34117 condMapEmpty!34123) mapIsEmpty!34123))

(assert (= (and mapNonEmpty!34117 (not condMapEmpty!34123)) mapNonEmpty!34123))

(assert (= (and mapNonEmpty!34123 ((_ is ValueCellFull!10227) mapValue!34123)) b!961338))

(assert (= (and mapNonEmpty!34117 ((_ is ValueCellFull!10227) mapDefault!34123)) b!961339))

(declare-fun m!891331 () Bool)

(assert (=> mapNonEmpty!34123 m!891331))

(check-sat tp_is_empty!21417 (not b!961322) (not d!116061) (not b!961313) (not b!961330) (not d!116053) (not mapNonEmpty!34123) (not bm!41726) (not b!961325) (not b!961331) (not b!961311))
(check-sat)
