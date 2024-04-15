; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112030 () Bool)

(assert start!112030)

(declare-fun b!1327263 () Bool)

(declare-fun e!756554 () Bool)

(declare-fun e!756550 () Bool)

(declare-fun mapRes!56221 () Bool)

(assert (=> b!1327263 (= e!756554 (and e!756550 mapRes!56221))))

(declare-fun condMapEmpty!56221 () Bool)

(declare-datatypes ((V!53601 0))(
  ( (V!53602 (val!18261 Int)) )
))
(declare-datatypes ((ValueCell!17288 0))(
  ( (ValueCellFull!17288 (v!20896 V!53601)) (EmptyCell!17288) )
))
(declare-datatypes ((array!89587 0))(
  ( (array!89588 (arr!43264 (Array (_ BitVec 32) ValueCell!17288)) (size!43816 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89587)

(declare-fun mapDefault!56221 () ValueCell!17288)

(assert (=> b!1327263 (= condMapEmpty!56221 (= (arr!43264 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17288)) mapDefault!56221)))))

(declare-fun b!1327264 () Bool)

(declare-fun e!756552 () Bool)

(declare-fun tp_is_empty!36373 () Bool)

(assert (=> b!1327264 (= e!756552 tp_is_empty!36373)))

(declare-fun mapNonEmpty!56221 () Bool)

(declare-fun tp!107129 () Bool)

(assert (=> mapNonEmpty!56221 (= mapRes!56221 (and tp!107129 e!756552))))

(declare-fun mapKey!56221 () (_ BitVec 32))

(declare-fun mapValue!56221 () ValueCell!17288)

(declare-fun mapRest!56221 () (Array (_ BitVec 32) ValueCell!17288))

(assert (=> mapNonEmpty!56221 (= (arr!43264 _values!1320) (store mapRest!56221 mapKey!56221 mapValue!56221))))

(declare-fun res!880776 () Bool)

(declare-fun e!756551 () Bool)

(assert (=> start!112030 (=> (not res!880776) (not e!756551))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112030 (= res!880776 (validMask!0 mask!1998))))

(assert (=> start!112030 e!756551))

(assert (=> start!112030 true))

(declare-fun array_inv!32825 (array!89587) Bool)

(assert (=> start!112030 (and (array_inv!32825 _values!1320) e!756554)))

(declare-datatypes ((array!89589 0))(
  ( (array!89590 (arr!43265 (Array (_ BitVec 32) (_ BitVec 64))) (size!43817 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89589)

(declare-fun array_inv!32826 (array!89589) Bool)

(assert (=> start!112030 (array_inv!32826 _keys!1590)))

(declare-fun b!1327265 () Bool)

(declare-fun res!880777 () Bool)

(assert (=> b!1327265 (=> (not res!880777) (not e!756551))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89589 (_ BitVec 32)) Bool)

(assert (=> b!1327265 (= res!880777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1327266 () Bool)

(assert (=> b!1327266 (= e!756551 (bvsgt #b00000000000000000000000000000000 (size!43817 _keys!1590)))))

(declare-fun b!1327267 () Bool)

(declare-fun res!880778 () Bool)

(assert (=> b!1327267 (=> (not res!880778) (not e!756551))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327267 (= res!880778 (and (= (size!43816 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43817 _keys!1590) (size!43816 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56221 () Bool)

(assert (=> mapIsEmpty!56221 mapRes!56221))

(declare-fun b!1327268 () Bool)

(assert (=> b!1327268 (= e!756550 tp_is_empty!36373)))

(assert (= (and start!112030 res!880776) b!1327267))

(assert (= (and b!1327267 res!880778) b!1327265))

(assert (= (and b!1327265 res!880777) b!1327266))

(assert (= (and b!1327263 condMapEmpty!56221) mapIsEmpty!56221))

(assert (= (and b!1327263 (not condMapEmpty!56221)) mapNonEmpty!56221))

(get-info :version)

(assert (= (and mapNonEmpty!56221 ((_ is ValueCellFull!17288) mapValue!56221)) b!1327264))

(assert (= (and b!1327263 ((_ is ValueCellFull!17288) mapDefault!56221)) b!1327268))

(assert (= start!112030 b!1327263))

(declare-fun m!1216183 () Bool)

(assert (=> mapNonEmpty!56221 m!1216183))

(declare-fun m!1216185 () Bool)

(assert (=> start!112030 m!1216185))

(declare-fun m!1216187 () Bool)

(assert (=> start!112030 m!1216187))

(declare-fun m!1216189 () Bool)

(assert (=> start!112030 m!1216189))

(declare-fun m!1216191 () Bool)

(assert (=> b!1327265 m!1216191))

(check-sat (not start!112030) (not b!1327265) (not mapNonEmpty!56221) tp_is_empty!36373)
(check-sat)
(get-model)

(declare-fun d!143191 () Bool)

(assert (=> d!143191 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112030 d!143191))

(declare-fun d!143193 () Bool)

(assert (=> d!143193 (= (array_inv!32825 _values!1320) (bvsge (size!43816 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112030 d!143193))

(declare-fun d!143195 () Bool)

(assert (=> d!143195 (= (array_inv!32826 _keys!1590) (bvsge (size!43817 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112030 d!143195))

(declare-fun d!143197 () Bool)

(declare-fun res!880801 () Bool)

(declare-fun e!756593 () Bool)

(assert (=> d!143197 (=> res!880801 e!756593)))

(assert (=> d!143197 (= res!880801 (bvsge #b00000000000000000000000000000000 (size!43817 _keys!1590)))))

(assert (=> d!143197 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!756593)))

(declare-fun b!1327313 () Bool)

(declare-fun e!756592 () Bool)

(declare-fun call!64794 () Bool)

(assert (=> b!1327313 (= e!756592 call!64794)))

(declare-fun b!1327314 () Bool)

(declare-fun e!756591 () Bool)

(assert (=> b!1327314 (= e!756591 call!64794)))

(declare-fun bm!64791 () Bool)

(assert (=> bm!64791 (= call!64794 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1327315 () Bool)

(assert (=> b!1327315 (= e!756591 e!756592)))

(declare-fun lt!590515 () (_ BitVec 64))

(assert (=> b!1327315 (= lt!590515 (select (arr!43265 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43526 0))(
  ( (Unit!43527) )
))
(declare-fun lt!590517 () Unit!43526)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89589 (_ BitVec 64) (_ BitVec 32)) Unit!43526)

(assert (=> b!1327315 (= lt!590517 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!590515 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1327315 (arrayContainsKey!0 _keys!1590 lt!590515 #b00000000000000000000000000000000)))

(declare-fun lt!590516 () Unit!43526)

(assert (=> b!1327315 (= lt!590516 lt!590517)))

(declare-fun res!880802 () Bool)

(declare-datatypes ((SeekEntryResult!10042 0))(
  ( (MissingZero!10042 (index!42539 (_ BitVec 32))) (Found!10042 (index!42540 (_ BitVec 32))) (Intermediate!10042 (undefined!10854 Bool) (index!42541 (_ BitVec 32)) (x!118341 (_ BitVec 32))) (Undefined!10042) (MissingVacant!10042 (index!42542 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89589 (_ BitVec 32)) SeekEntryResult!10042)

(assert (=> b!1327315 (= res!880802 (= (seekEntryOrOpen!0 (select (arr!43265 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10042 #b00000000000000000000000000000000)))))

(assert (=> b!1327315 (=> (not res!880802) (not e!756592))))

(declare-fun b!1327316 () Bool)

(assert (=> b!1327316 (= e!756593 e!756591)))

(declare-fun c!125874 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327316 (= c!125874 (validKeyInArray!0 (select (arr!43265 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143197 (not res!880801)) b!1327316))

(assert (= (and b!1327316 c!125874) b!1327315))

(assert (= (and b!1327316 (not c!125874)) b!1327314))

(assert (= (and b!1327315 res!880802) b!1327313))

(assert (= (or b!1327313 b!1327314) bm!64791))

(declare-fun m!1216213 () Bool)

(assert (=> bm!64791 m!1216213))

(declare-fun m!1216215 () Bool)

(assert (=> b!1327315 m!1216215))

(declare-fun m!1216217 () Bool)

(assert (=> b!1327315 m!1216217))

(declare-fun m!1216219 () Bool)

(assert (=> b!1327315 m!1216219))

(assert (=> b!1327315 m!1216215))

(declare-fun m!1216221 () Bool)

(assert (=> b!1327315 m!1216221))

(assert (=> b!1327316 m!1216215))

(assert (=> b!1327316 m!1216215))

(declare-fun m!1216223 () Bool)

(assert (=> b!1327316 m!1216223))

(assert (=> b!1327265 d!143197))

(declare-fun mapNonEmpty!56230 () Bool)

(declare-fun mapRes!56230 () Bool)

(declare-fun tp!107138 () Bool)

(declare-fun e!756598 () Bool)

(assert (=> mapNonEmpty!56230 (= mapRes!56230 (and tp!107138 e!756598))))

(declare-fun mapValue!56230 () ValueCell!17288)

(declare-fun mapRest!56230 () (Array (_ BitVec 32) ValueCell!17288))

(declare-fun mapKey!56230 () (_ BitVec 32))

(assert (=> mapNonEmpty!56230 (= mapRest!56221 (store mapRest!56230 mapKey!56230 mapValue!56230))))

(declare-fun mapIsEmpty!56230 () Bool)

(assert (=> mapIsEmpty!56230 mapRes!56230))

(declare-fun b!1327323 () Bool)

(assert (=> b!1327323 (= e!756598 tp_is_empty!36373)))

(declare-fun b!1327324 () Bool)

(declare-fun e!756599 () Bool)

(assert (=> b!1327324 (= e!756599 tp_is_empty!36373)))

(declare-fun condMapEmpty!56230 () Bool)

(declare-fun mapDefault!56230 () ValueCell!17288)

(assert (=> mapNonEmpty!56221 (= condMapEmpty!56230 (= mapRest!56221 ((as const (Array (_ BitVec 32) ValueCell!17288)) mapDefault!56230)))))

(assert (=> mapNonEmpty!56221 (= tp!107129 (and e!756599 mapRes!56230))))

(assert (= (and mapNonEmpty!56221 condMapEmpty!56230) mapIsEmpty!56230))

(assert (= (and mapNonEmpty!56221 (not condMapEmpty!56230)) mapNonEmpty!56230))

(assert (= (and mapNonEmpty!56230 ((_ is ValueCellFull!17288) mapValue!56230)) b!1327323))

(assert (= (and mapNonEmpty!56221 ((_ is ValueCellFull!17288) mapDefault!56230)) b!1327324))

(declare-fun m!1216225 () Bool)

(assert (=> mapNonEmpty!56230 m!1216225))

(check-sat tp_is_empty!36373 (not bm!64791) (not mapNonEmpty!56230) (not b!1327316) (not b!1327315))
(check-sat)
