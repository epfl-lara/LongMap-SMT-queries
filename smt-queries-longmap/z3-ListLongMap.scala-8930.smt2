; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108284 () Bool)

(assert start!108284)

(declare-fun b!1278267 () Bool)

(declare-fun res!849250 () Bool)

(declare-fun e!730176 () Bool)

(assert (=> b!1278267 (=> (not res!849250) (not e!730176))))

(declare-datatypes ((array!83973 0))(
  ( (array!83974 (arr!40493 (Array (_ BitVec 32) (_ BitVec 64))) (size!41045 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83973)

(assert (=> b!1278267 (= res!849250 (and (bvsle #b00000000000000000000000000000000 (size!41045 _keys!1741)) (bvslt (size!41045 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!51785 () Bool)

(declare-fun mapRes!51785 () Bool)

(assert (=> mapIsEmpty!51785 mapRes!51785))

(declare-fun b!1278268 () Bool)

(declare-fun res!849249 () Bool)

(assert (=> b!1278268 (=> (not res!849249) (not e!730176))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83973 (_ BitVec 32)) Bool)

(assert (=> b!1278268 (= res!849249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278269 () Bool)

(declare-fun res!849252 () Bool)

(assert (=> b!1278269 (=> (not res!849252) (not e!730176))))

(declare-datatypes ((V!49761 0))(
  ( (V!49762 (val!16821 Int)) )
))
(declare-datatypes ((ValueCell!15848 0))(
  ( (ValueCellFull!15848 (v!19419 V!49761)) (EmptyCell!15848) )
))
(declare-datatypes ((array!83975 0))(
  ( (array!83976 (arr!40494 (Array (_ BitVec 32) ValueCell!15848)) (size!41046 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!83975)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278269 (= res!849252 (and (= (size!41046 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41045 _keys!1741) (size!41046 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278270 () Bool)

(declare-datatypes ((List!28811 0))(
  ( (Nil!28808) (Cons!28807 (h!30016 (_ BitVec 64)) (t!42343 List!28811)) )
))
(declare-fun noDuplicate!2073 (List!28811) Bool)

(assert (=> b!1278270 (= e!730176 (not (noDuplicate!2073 Nil!28808)))))

(declare-fun mapNonEmpty!51785 () Bool)

(declare-fun tp!98760 () Bool)

(declare-fun e!730177 () Bool)

(assert (=> mapNonEmpty!51785 (= mapRes!51785 (and tp!98760 e!730177))))

(declare-fun mapKey!51785 () (_ BitVec 32))

(declare-fun mapRest!51785 () (Array (_ BitVec 32) ValueCell!15848))

(declare-fun mapValue!51785 () ValueCell!15848)

(assert (=> mapNonEmpty!51785 (= (arr!40494 _values!1445) (store mapRest!51785 mapKey!51785 mapValue!51785))))

(declare-fun b!1278272 () Bool)

(declare-fun tp_is_empty!33493 () Bool)

(assert (=> b!1278272 (= e!730177 tp_is_empty!33493)))

(declare-fun b!1278273 () Bool)

(declare-fun e!730174 () Bool)

(declare-fun e!730175 () Bool)

(assert (=> b!1278273 (= e!730174 (and e!730175 mapRes!51785))))

(declare-fun condMapEmpty!51785 () Bool)

(declare-fun mapDefault!51785 () ValueCell!15848)

(assert (=> b!1278273 (= condMapEmpty!51785 (= (arr!40494 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15848)) mapDefault!51785)))))

(declare-fun b!1278271 () Bool)

(assert (=> b!1278271 (= e!730175 tp_is_empty!33493)))

(declare-fun res!849251 () Bool)

(assert (=> start!108284 (=> (not res!849251) (not e!730176))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108284 (= res!849251 (validMask!0 mask!2175))))

(assert (=> start!108284 e!730176))

(assert (=> start!108284 true))

(declare-fun array_inv!30915 (array!83975) Bool)

(assert (=> start!108284 (and (array_inv!30915 _values!1445) e!730174)))

(declare-fun array_inv!30916 (array!83973) Bool)

(assert (=> start!108284 (array_inv!30916 _keys!1741)))

(assert (= (and start!108284 res!849251) b!1278269))

(assert (= (and b!1278269 res!849252) b!1278268))

(assert (= (and b!1278268 res!849249) b!1278267))

(assert (= (and b!1278267 res!849250) b!1278270))

(assert (= (and b!1278273 condMapEmpty!51785) mapIsEmpty!51785))

(assert (= (and b!1278273 (not condMapEmpty!51785)) mapNonEmpty!51785))

(get-info :version)

(assert (= (and mapNonEmpty!51785 ((_ is ValueCellFull!15848) mapValue!51785)) b!1278272))

(assert (= (and b!1278273 ((_ is ValueCellFull!15848) mapDefault!51785)) b!1278271))

(assert (= start!108284 b!1278273))

(declare-fun m!1173179 () Bool)

(assert (=> b!1278268 m!1173179))

(declare-fun m!1173181 () Bool)

(assert (=> b!1278270 m!1173181))

(declare-fun m!1173183 () Bool)

(assert (=> mapNonEmpty!51785 m!1173183))

(declare-fun m!1173185 () Bool)

(assert (=> start!108284 m!1173185))

(declare-fun m!1173187 () Bool)

(assert (=> start!108284 m!1173187))

(declare-fun m!1173189 () Bool)

(assert (=> start!108284 m!1173189))

(check-sat (not start!108284) (not b!1278268) tp_is_empty!33493 (not b!1278270) (not mapNonEmpty!51785))
(check-sat)
(get-model)

(declare-fun b!1278324 () Bool)

(declare-fun e!730215 () Bool)

(declare-fun e!730214 () Bool)

(assert (=> b!1278324 (= e!730215 e!730214)))

(declare-fun c!124019 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278324 (= c!124019 (validKeyInArray!0 (select (arr!40493 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62691 () Bool)

(declare-fun call!62694 () Bool)

(assert (=> bm!62691 (= call!62694 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun d!140421 () Bool)

(declare-fun res!849282 () Bool)

(assert (=> d!140421 (=> res!849282 e!730215)))

(assert (=> d!140421 (= res!849282 (bvsge #b00000000000000000000000000000000 (size!41045 _keys!1741)))))

(assert (=> d!140421 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730215)))

(declare-fun b!1278325 () Bool)

(assert (=> b!1278325 (= e!730214 call!62694)))

(declare-fun b!1278326 () Bool)

(declare-fun e!730216 () Bool)

(assert (=> b!1278326 (= e!730216 call!62694)))

(declare-fun b!1278327 () Bool)

(assert (=> b!1278327 (= e!730214 e!730216)))

(declare-fun lt!575692 () (_ BitVec 64))

(assert (=> b!1278327 (= lt!575692 (select (arr!40493 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42235 0))(
  ( (Unit!42236) )
))
(declare-fun lt!575694 () Unit!42235)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83973 (_ BitVec 64) (_ BitVec 32)) Unit!42235)

(assert (=> b!1278327 (= lt!575694 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575692 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278327 (arrayContainsKey!0 _keys!1741 lt!575692 #b00000000000000000000000000000000)))

(declare-fun lt!575693 () Unit!42235)

(assert (=> b!1278327 (= lt!575693 lt!575694)))

(declare-fun res!849281 () Bool)

(declare-datatypes ((SeekEntryResult!10009 0))(
  ( (MissingZero!10009 (index!42407 (_ BitVec 32))) (Found!10009 (index!42408 (_ BitVec 32))) (Intermediate!10009 (undefined!10821 Bool) (index!42409 (_ BitVec 32)) (x!113315 (_ BitVec 32))) (Undefined!10009) (MissingVacant!10009 (index!42410 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83973 (_ BitVec 32)) SeekEntryResult!10009)

(assert (=> b!1278327 (= res!849281 (= (seekEntryOrOpen!0 (select (arr!40493 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10009 #b00000000000000000000000000000000)))))

(assert (=> b!1278327 (=> (not res!849281) (not e!730216))))

(assert (= (and d!140421 (not res!849282)) b!1278324))

(assert (= (and b!1278324 c!124019) b!1278327))

(assert (= (and b!1278324 (not c!124019)) b!1278325))

(assert (= (and b!1278327 res!849281) b!1278326))

(assert (= (or b!1278326 b!1278325) bm!62691))

(declare-fun m!1173215 () Bool)

(assert (=> b!1278324 m!1173215))

(assert (=> b!1278324 m!1173215))

(declare-fun m!1173217 () Bool)

(assert (=> b!1278324 m!1173217))

(declare-fun m!1173219 () Bool)

(assert (=> bm!62691 m!1173219))

(assert (=> b!1278327 m!1173215))

(declare-fun m!1173221 () Bool)

(assert (=> b!1278327 m!1173221))

(declare-fun m!1173223 () Bool)

(assert (=> b!1278327 m!1173223))

(assert (=> b!1278327 m!1173215))

(declare-fun m!1173225 () Bool)

(assert (=> b!1278327 m!1173225))

(assert (=> b!1278268 d!140421))

(declare-fun d!140423 () Bool)

(declare-fun res!849287 () Bool)

(declare-fun e!730221 () Bool)

(assert (=> d!140423 (=> res!849287 e!730221)))

(assert (=> d!140423 (= res!849287 ((_ is Nil!28808) Nil!28808))))

(assert (=> d!140423 (= (noDuplicate!2073 Nil!28808) e!730221)))

(declare-fun b!1278332 () Bool)

(declare-fun e!730222 () Bool)

(assert (=> b!1278332 (= e!730221 e!730222)))

(declare-fun res!849288 () Bool)

(assert (=> b!1278332 (=> (not res!849288) (not e!730222))))

(declare-fun contains!7707 (List!28811 (_ BitVec 64)) Bool)

(assert (=> b!1278332 (= res!849288 (not (contains!7707 (t!42343 Nil!28808) (h!30016 Nil!28808))))))

(declare-fun b!1278333 () Bool)

(assert (=> b!1278333 (= e!730222 (noDuplicate!2073 (t!42343 Nil!28808)))))

(assert (= (and d!140423 (not res!849287)) b!1278332))

(assert (= (and b!1278332 res!849288) b!1278333))

(declare-fun m!1173227 () Bool)

(assert (=> b!1278332 m!1173227))

(declare-fun m!1173229 () Bool)

(assert (=> b!1278333 m!1173229))

(assert (=> b!1278270 d!140423))

(declare-fun d!140425 () Bool)

(assert (=> d!140425 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108284 d!140425))

(declare-fun d!140427 () Bool)

(assert (=> d!140427 (= (array_inv!30915 _values!1445) (bvsge (size!41046 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108284 d!140427))

(declare-fun d!140429 () Bool)

(assert (=> d!140429 (= (array_inv!30916 _keys!1741) (bvsge (size!41045 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108284 d!140429))

(declare-fun mapIsEmpty!51794 () Bool)

(declare-fun mapRes!51794 () Bool)

(assert (=> mapIsEmpty!51794 mapRes!51794))

(declare-fun b!1278340 () Bool)

(declare-fun e!730228 () Bool)

(assert (=> b!1278340 (= e!730228 tp_is_empty!33493)))

(declare-fun b!1278341 () Bool)

(declare-fun e!730227 () Bool)

(assert (=> b!1278341 (= e!730227 tp_is_empty!33493)))

(declare-fun condMapEmpty!51794 () Bool)

(declare-fun mapDefault!51794 () ValueCell!15848)

(assert (=> mapNonEmpty!51785 (= condMapEmpty!51794 (= mapRest!51785 ((as const (Array (_ BitVec 32) ValueCell!15848)) mapDefault!51794)))))

(assert (=> mapNonEmpty!51785 (= tp!98760 (and e!730227 mapRes!51794))))

(declare-fun mapNonEmpty!51794 () Bool)

(declare-fun tp!98769 () Bool)

(assert (=> mapNonEmpty!51794 (= mapRes!51794 (and tp!98769 e!730228))))

(declare-fun mapValue!51794 () ValueCell!15848)

(declare-fun mapKey!51794 () (_ BitVec 32))

(declare-fun mapRest!51794 () (Array (_ BitVec 32) ValueCell!15848))

(assert (=> mapNonEmpty!51794 (= mapRest!51785 (store mapRest!51794 mapKey!51794 mapValue!51794))))

(assert (= (and mapNonEmpty!51785 condMapEmpty!51794) mapIsEmpty!51794))

(assert (= (and mapNonEmpty!51785 (not condMapEmpty!51794)) mapNonEmpty!51794))

(assert (= (and mapNonEmpty!51794 ((_ is ValueCellFull!15848) mapValue!51794)) b!1278340))

(assert (= (and mapNonEmpty!51785 ((_ is ValueCellFull!15848) mapDefault!51794)) b!1278341))

(declare-fun m!1173231 () Bool)

(assert (=> mapNonEmpty!51794 m!1173231))

(check-sat (not b!1278332) (not bm!62691) (not b!1278333) (not mapNonEmpty!51794) (not b!1278324) tp_is_empty!33493 (not b!1278327))
(check-sat)
