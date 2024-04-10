; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111280 () Bool)

(assert start!111280)

(declare-fun b!1317023 () Bool)

(declare-fun e!751425 () Bool)

(declare-fun e!751423 () Bool)

(assert (=> b!1317023 (= e!751425 e!751423)))

(declare-fun res!874170 () Bool)

(assert (=> b!1317023 (=> res!874170 e!751423)))

(declare-datatypes ((List!30292 0))(
  ( (Nil!30289) (Cons!30288 (h!31497 (_ BitVec 64)) (t!43900 List!30292)) )
))
(declare-fun contains!8574 (List!30292 (_ BitVec 64)) Bool)

(assert (=> b!1317023 (= res!874170 (contains!8574 Nil!30289 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317024 () Bool)

(declare-fun res!874168 () Bool)

(assert (=> b!1317024 (=> (not res!874168) (not e!751425))))

(declare-fun noDuplicate!2063 (List!30292) Bool)

(assert (=> b!1317024 (= res!874168 (noDuplicate!2063 Nil!30289))))

(declare-fun b!1317025 () Bool)

(assert (=> b!1317025 (= e!751423 (contains!8574 Nil!30289 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317026 () Bool)

(declare-fun res!874169 () Bool)

(assert (=> b!1317026 (=> (not res!874169) (not e!751425))))

(declare-datatypes ((array!88500 0))(
  ( (array!88501 (arr!42725 (Array (_ BitVec 32) (_ BitVec 64))) (size!43275 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88500)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88500 (_ BitVec 32)) Bool)

(assert (=> b!1317026 (= res!874169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1317027 () Bool)

(declare-fun e!751422 () Bool)

(declare-fun tp_is_empty!35769 () Bool)

(assert (=> b!1317027 (= e!751422 tp_is_empty!35769)))

(declare-fun mapIsEmpty!55298 () Bool)

(declare-fun mapRes!55298 () Bool)

(assert (=> mapIsEmpty!55298 mapRes!55298))

(declare-fun mapNonEmpty!55298 () Bool)

(declare-fun tp!105404 () Bool)

(declare-fun e!751424 () Bool)

(assert (=> mapNonEmpty!55298 (= mapRes!55298 (and tp!105404 e!751424))))

(declare-datatypes ((V!52795 0))(
  ( (V!52796 (val!17959 Int)) )
))
(declare-datatypes ((ValueCell!16986 0))(
  ( (ValueCellFull!16986 (v!20588 V!52795)) (EmptyCell!16986) )
))
(declare-fun mapRest!55298 () (Array (_ BitVec 32) ValueCell!16986))

(declare-fun mapValue!55298 () ValueCell!16986)

(declare-fun mapKey!55298 () (_ BitVec 32))

(declare-datatypes ((array!88502 0))(
  ( (array!88503 (arr!42726 (Array (_ BitVec 32) ValueCell!16986)) (size!43276 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88502)

(assert (=> mapNonEmpty!55298 (= (arr!42726 _values!1337) (store mapRest!55298 mapKey!55298 mapValue!55298))))

(declare-fun b!1317029 () Bool)

(declare-fun e!751426 () Bool)

(assert (=> b!1317029 (= e!751426 (and e!751422 mapRes!55298))))

(declare-fun condMapEmpty!55298 () Bool)

(declare-fun mapDefault!55298 () ValueCell!16986)

(assert (=> b!1317029 (= condMapEmpty!55298 (= (arr!42726 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16986)) mapDefault!55298)))))

(declare-fun b!1317030 () Bool)

(assert (=> b!1317030 (= e!751424 tp_is_empty!35769)))

(declare-fun b!1317031 () Bool)

(declare-fun res!874165 () Bool)

(assert (=> b!1317031 (=> (not res!874165) (not e!751425))))

(assert (=> b!1317031 (= res!874165 (and (bvsle #b00000000000000000000000000000000 (size!43275 _keys!1609)) (bvslt (size!43275 _keys!1609) #b01111111111111111111111111111111)))))

(declare-fun res!874166 () Bool)

(assert (=> start!111280 (=> (not res!874166) (not e!751425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111280 (= res!874166 (validMask!0 mask!2019))))

(assert (=> start!111280 e!751425))

(assert (=> start!111280 true))

(declare-fun array_inv!32267 (array!88502) Bool)

(assert (=> start!111280 (and (array_inv!32267 _values!1337) e!751426)))

(declare-fun array_inv!32268 (array!88500) Bool)

(assert (=> start!111280 (array_inv!32268 _keys!1609)))

(declare-fun b!1317028 () Bool)

(declare-fun res!874167 () Bool)

(assert (=> b!1317028 (=> (not res!874167) (not e!751425))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317028 (= res!874167 (and (= (size!43276 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43275 _keys!1609) (size!43276 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(assert (= (and start!111280 res!874166) b!1317028))

(assert (= (and b!1317028 res!874167) b!1317026))

(assert (= (and b!1317026 res!874169) b!1317031))

(assert (= (and b!1317031 res!874165) b!1317024))

(assert (= (and b!1317024 res!874168) b!1317023))

(assert (= (and b!1317023 (not res!874170)) b!1317025))

(assert (= (and b!1317029 condMapEmpty!55298) mapIsEmpty!55298))

(assert (= (and b!1317029 (not condMapEmpty!55298)) mapNonEmpty!55298))

(get-info :version)

(assert (= (and mapNonEmpty!55298 ((_ is ValueCellFull!16986) mapValue!55298)) b!1317030))

(assert (= (and b!1317029 ((_ is ValueCellFull!16986) mapDefault!55298)) b!1317027))

(assert (= start!111280 b!1317029))

(declare-fun m!1205019 () Bool)

(assert (=> start!111280 m!1205019))

(declare-fun m!1205021 () Bool)

(assert (=> start!111280 m!1205021))

(declare-fun m!1205023 () Bool)

(assert (=> start!111280 m!1205023))

(declare-fun m!1205025 () Bool)

(assert (=> mapNonEmpty!55298 m!1205025))

(declare-fun m!1205027 () Bool)

(assert (=> b!1317025 m!1205027))

(declare-fun m!1205029 () Bool)

(assert (=> b!1317024 m!1205029))

(declare-fun m!1205031 () Bool)

(assert (=> b!1317023 m!1205031))

(declare-fun m!1205033 () Bool)

(assert (=> b!1317026 m!1205033))

(check-sat (not b!1317024) (not mapNonEmpty!55298) (not b!1317025) tp_is_empty!35769 (not start!111280) (not b!1317026) (not b!1317023))
(check-sat)
(get-model)

(declare-fun d!142711 () Bool)

(declare-fun res!874193 () Bool)

(declare-fun e!751450 () Bool)

(assert (=> d!142711 (=> res!874193 e!751450)))

(assert (=> d!142711 (= res!874193 ((_ is Nil!30289) Nil!30289))))

(assert (=> d!142711 (= (noDuplicate!2063 Nil!30289) e!751450)))

(declare-fun b!1317063 () Bool)

(declare-fun e!751451 () Bool)

(assert (=> b!1317063 (= e!751450 e!751451)))

(declare-fun res!874194 () Bool)

(assert (=> b!1317063 (=> (not res!874194) (not e!751451))))

(assert (=> b!1317063 (= res!874194 (not (contains!8574 (t!43900 Nil!30289) (h!31497 Nil!30289))))))

(declare-fun b!1317064 () Bool)

(assert (=> b!1317064 (= e!751451 (noDuplicate!2063 (t!43900 Nil!30289)))))

(assert (= (and d!142711 (not res!874193)) b!1317063))

(assert (= (and b!1317063 res!874194) b!1317064))

(declare-fun m!1205051 () Bool)

(assert (=> b!1317063 m!1205051))

(declare-fun m!1205053 () Bool)

(assert (=> b!1317064 m!1205053))

(assert (=> b!1317024 d!142711))

(declare-fun d!142713 () Bool)

(declare-fun lt!586301 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!652 (List!30292) (InoxSet (_ BitVec 64)))

(assert (=> d!142713 (= lt!586301 (select (content!652 Nil!30289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!751456 () Bool)

(assert (=> d!142713 (= lt!586301 e!751456)))

(declare-fun res!874200 () Bool)

(assert (=> d!142713 (=> (not res!874200) (not e!751456))))

(assert (=> d!142713 (= res!874200 ((_ is Cons!30288) Nil!30289))))

(assert (=> d!142713 (= (contains!8574 Nil!30289 #b0000000000000000000000000000000000000000000000000000000000000000) lt!586301)))

(declare-fun b!1317069 () Bool)

(declare-fun e!751457 () Bool)

(assert (=> b!1317069 (= e!751456 e!751457)))

(declare-fun res!874199 () Bool)

(assert (=> b!1317069 (=> res!874199 e!751457)))

(assert (=> b!1317069 (= res!874199 (= (h!31497 Nil!30289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317070 () Bool)

(assert (=> b!1317070 (= e!751457 (contains!8574 (t!43900 Nil!30289) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142713 res!874200) b!1317069))

(assert (= (and b!1317069 (not res!874199)) b!1317070))

(declare-fun m!1205055 () Bool)

(assert (=> d!142713 m!1205055))

(declare-fun m!1205057 () Bool)

(assert (=> d!142713 m!1205057))

(declare-fun m!1205059 () Bool)

(assert (=> b!1317070 m!1205059))

(assert (=> b!1317023 d!142713))

(declare-fun d!142715 () Bool)

(assert (=> d!142715 (= (validMask!0 mask!2019) (and (or (= mask!2019 #b00000000000000000000000000000111) (= mask!2019 #b00000000000000000000000000001111) (= mask!2019 #b00000000000000000000000000011111) (= mask!2019 #b00000000000000000000000000111111) (= mask!2019 #b00000000000000000000000001111111) (= mask!2019 #b00000000000000000000000011111111) (= mask!2019 #b00000000000000000000000111111111) (= mask!2019 #b00000000000000000000001111111111) (= mask!2019 #b00000000000000000000011111111111) (= mask!2019 #b00000000000000000000111111111111) (= mask!2019 #b00000000000000000001111111111111) (= mask!2019 #b00000000000000000011111111111111) (= mask!2019 #b00000000000000000111111111111111) (= mask!2019 #b00000000000000001111111111111111) (= mask!2019 #b00000000000000011111111111111111) (= mask!2019 #b00000000000000111111111111111111) (= mask!2019 #b00000000000001111111111111111111) (= mask!2019 #b00000000000011111111111111111111) (= mask!2019 #b00000000000111111111111111111111) (= mask!2019 #b00000000001111111111111111111111) (= mask!2019 #b00000000011111111111111111111111) (= mask!2019 #b00000000111111111111111111111111) (= mask!2019 #b00000001111111111111111111111111) (= mask!2019 #b00000011111111111111111111111111) (= mask!2019 #b00000111111111111111111111111111) (= mask!2019 #b00001111111111111111111111111111) (= mask!2019 #b00011111111111111111111111111111) (= mask!2019 #b00111111111111111111111111111111)) (bvsle mask!2019 #b00111111111111111111111111111111)))))

(assert (=> start!111280 d!142715))

(declare-fun d!142717 () Bool)

(assert (=> d!142717 (= (array_inv!32267 _values!1337) (bvsge (size!43276 _values!1337) #b00000000000000000000000000000000))))

(assert (=> start!111280 d!142717))

(declare-fun d!142719 () Bool)

(assert (=> d!142719 (= (array_inv!32268 _keys!1609) (bvsge (size!43275 _keys!1609) #b00000000000000000000000000000000))))

(assert (=> start!111280 d!142719))

(declare-fun b!1317079 () Bool)

(declare-fun e!751464 () Bool)

(declare-fun call!64684 () Bool)

(assert (=> b!1317079 (= e!751464 call!64684)))

(declare-fun d!142721 () Bool)

(declare-fun res!874206 () Bool)

(declare-fun e!751465 () Bool)

(assert (=> d!142721 (=> res!874206 e!751465)))

(assert (=> d!142721 (= res!874206 (bvsge #b00000000000000000000000000000000 (size!43275 _keys!1609)))))

(assert (=> d!142721 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019) e!751465)))

(declare-fun b!1317080 () Bool)

(declare-fun e!751466 () Bool)

(assert (=> b!1317080 (= e!751465 e!751466)))

(declare-fun c!125640 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1317080 (= c!125640 (validKeyInArray!0 (select (arr!42725 _keys!1609) #b00000000000000000000000000000000)))))

(declare-fun bm!64681 () Bool)

(assert (=> bm!64681 (= call!64684 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1609 mask!2019))))

(declare-fun b!1317081 () Bool)

(assert (=> b!1317081 (= e!751466 call!64684)))

(declare-fun b!1317082 () Bool)

(assert (=> b!1317082 (= e!751466 e!751464)))

(declare-fun lt!586308 () (_ BitVec 64))

(assert (=> b!1317082 (= lt!586308 (select (arr!42725 _keys!1609) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43420 0))(
  ( (Unit!43421) )
))
(declare-fun lt!586310 () Unit!43420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!88500 (_ BitVec 64) (_ BitVec 32)) Unit!43420)

(assert (=> b!1317082 (= lt!586310 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1609 lt!586308 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!88500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1317082 (arrayContainsKey!0 _keys!1609 lt!586308 #b00000000000000000000000000000000)))

(declare-fun lt!586309 () Unit!43420)

(assert (=> b!1317082 (= lt!586309 lt!586310)))

(declare-fun res!874205 () Bool)

(declare-datatypes ((SeekEntryResult!10039 0))(
  ( (MissingZero!10039 (index!42527 (_ BitVec 32))) (Found!10039 (index!42528 (_ BitVec 32))) (Intermediate!10039 (undefined!10851 Bool) (index!42529 (_ BitVec 32)) (x!117092 (_ BitVec 32))) (Undefined!10039) (MissingVacant!10039 (index!42530 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!88500 (_ BitVec 32)) SeekEntryResult!10039)

(assert (=> b!1317082 (= res!874205 (= (seekEntryOrOpen!0 (select (arr!42725 _keys!1609) #b00000000000000000000000000000000) _keys!1609 mask!2019) (Found!10039 #b00000000000000000000000000000000)))))

(assert (=> b!1317082 (=> (not res!874205) (not e!751464))))

(assert (= (and d!142721 (not res!874206)) b!1317080))

(assert (= (and b!1317080 c!125640) b!1317082))

(assert (= (and b!1317080 (not c!125640)) b!1317081))

(assert (= (and b!1317082 res!874205) b!1317079))

(assert (= (or b!1317079 b!1317081) bm!64681))

(declare-fun m!1205061 () Bool)

(assert (=> b!1317080 m!1205061))

(assert (=> b!1317080 m!1205061))

(declare-fun m!1205063 () Bool)

(assert (=> b!1317080 m!1205063))

(declare-fun m!1205065 () Bool)

(assert (=> bm!64681 m!1205065))

(assert (=> b!1317082 m!1205061))

(declare-fun m!1205067 () Bool)

(assert (=> b!1317082 m!1205067))

(declare-fun m!1205069 () Bool)

(assert (=> b!1317082 m!1205069))

(assert (=> b!1317082 m!1205061))

(declare-fun m!1205071 () Bool)

(assert (=> b!1317082 m!1205071))

(assert (=> b!1317026 d!142721))

(declare-fun d!142723 () Bool)

(declare-fun lt!586311 () Bool)

(assert (=> d!142723 (= lt!586311 (select (content!652 Nil!30289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!751467 () Bool)

(assert (=> d!142723 (= lt!586311 e!751467)))

(declare-fun res!874208 () Bool)

(assert (=> d!142723 (=> (not res!874208) (not e!751467))))

(assert (=> d!142723 (= res!874208 ((_ is Cons!30288) Nil!30289))))

(assert (=> d!142723 (= (contains!8574 Nil!30289 #b1000000000000000000000000000000000000000000000000000000000000000) lt!586311)))

(declare-fun b!1317083 () Bool)

(declare-fun e!751468 () Bool)

(assert (=> b!1317083 (= e!751467 e!751468)))

(declare-fun res!874207 () Bool)

(assert (=> b!1317083 (=> res!874207 e!751468)))

(assert (=> b!1317083 (= res!874207 (= (h!31497 Nil!30289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1317084 () Bool)

(assert (=> b!1317084 (= e!751468 (contains!8574 (t!43900 Nil!30289) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!142723 res!874208) b!1317083))

(assert (= (and b!1317083 (not res!874207)) b!1317084))

(assert (=> d!142723 m!1205055))

(declare-fun m!1205073 () Bool)

(assert (=> d!142723 m!1205073))

(declare-fun m!1205075 () Bool)

(assert (=> b!1317084 m!1205075))

(assert (=> b!1317025 d!142723))

(declare-fun condMapEmpty!55304 () Bool)

(declare-fun mapDefault!55304 () ValueCell!16986)

(assert (=> mapNonEmpty!55298 (= condMapEmpty!55304 (= mapRest!55298 ((as const (Array (_ BitVec 32) ValueCell!16986)) mapDefault!55304)))))

(declare-fun e!751474 () Bool)

(declare-fun mapRes!55304 () Bool)

(assert (=> mapNonEmpty!55298 (= tp!105404 (and e!751474 mapRes!55304))))

(declare-fun b!1317091 () Bool)

(declare-fun e!751473 () Bool)

(assert (=> b!1317091 (= e!751473 tp_is_empty!35769)))

(declare-fun mapNonEmpty!55304 () Bool)

(declare-fun tp!105410 () Bool)

(assert (=> mapNonEmpty!55304 (= mapRes!55304 (and tp!105410 e!751473))))

(declare-fun mapKey!55304 () (_ BitVec 32))

(declare-fun mapValue!55304 () ValueCell!16986)

(declare-fun mapRest!55304 () (Array (_ BitVec 32) ValueCell!16986))

(assert (=> mapNonEmpty!55304 (= mapRest!55298 (store mapRest!55304 mapKey!55304 mapValue!55304))))

(declare-fun b!1317092 () Bool)

(assert (=> b!1317092 (= e!751474 tp_is_empty!35769)))

(declare-fun mapIsEmpty!55304 () Bool)

(assert (=> mapIsEmpty!55304 mapRes!55304))

(assert (= (and mapNonEmpty!55298 condMapEmpty!55304) mapIsEmpty!55304))

(assert (= (and mapNonEmpty!55298 (not condMapEmpty!55304)) mapNonEmpty!55304))

(assert (= (and mapNonEmpty!55304 ((_ is ValueCellFull!16986) mapValue!55304)) b!1317091))

(assert (= (and mapNonEmpty!55298 ((_ is ValueCellFull!16986) mapDefault!55304)) b!1317092))

(declare-fun m!1205077 () Bool)

(assert (=> mapNonEmpty!55304 m!1205077))

(check-sat (not d!142713) (not b!1317070) (not b!1317064) (not b!1317082) (not mapNonEmpty!55304) tp_is_empty!35769 (not bm!64681) (not b!1317063) (not b!1317080) (not b!1317084) (not d!142723))
(check-sat)
