; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77578 () Bool)

(assert start!77578)

(declare-fun b!903279 () Bool)

(declare-fun e!505948 () Bool)

(declare-datatypes ((List!17837 0))(
  ( (Nil!17834) (Cons!17833 (h!18985 (_ BitVec 64)) (t!25212 List!17837)) )
))
(declare-fun noDuplicate!1327 (List!17837) Bool)

(assert (=> b!903279 (= e!505948 (not (noDuplicate!1327 Nil!17834)))))

(declare-fun b!903280 () Bool)

(declare-fun res!609310 () Bool)

(assert (=> b!903280 (=> (not res!609310) (not e!505948))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52985 0))(
  ( (array!52986 (arr!25450 (Array (_ BitVec 32) (_ BitVec 64))) (size!25910 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52985)

(declare-datatypes ((V!29559 0))(
  ( (V!29560 (val!9273 Int)) )
))
(declare-datatypes ((ValueCell!8741 0))(
  ( (ValueCellFull!8741 (v!11774 V!29559)) (EmptyCell!8741) )
))
(declare-datatypes ((array!52987 0))(
  ( (array!52988 (arr!25451 (Array (_ BitVec 32) ValueCell!8741)) (size!25911 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52987)

(assert (=> b!903280 (= res!609310 (and (= (size!25911 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25910 _keys!1386) (size!25911 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!903281 () Bool)

(declare-fun e!505947 () Bool)

(declare-fun e!505949 () Bool)

(declare-fun mapRes!29371 () Bool)

(assert (=> b!903281 (= e!505947 (and e!505949 mapRes!29371))))

(declare-fun condMapEmpty!29371 () Bool)

(declare-fun mapDefault!29371 () ValueCell!8741)

(assert (=> b!903281 (= condMapEmpty!29371 (= (arr!25451 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8741)) mapDefault!29371)))))

(declare-fun b!903282 () Bool)

(declare-fun res!609309 () Bool)

(assert (=> b!903282 (=> (not res!609309) (not e!505948))))

(assert (=> b!903282 (= res!609309 (and (bvsle #b00000000000000000000000000000000 (size!25910 _keys!1386)) (bvslt (size!25910 _keys!1386) #b01111111111111111111111111111111)))))

(declare-fun res!609311 () Bool)

(assert (=> start!77578 (=> (not res!609311) (not e!505948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77578 (= res!609311 (validMask!0 mask!1756))))

(assert (=> start!77578 e!505948))

(assert (=> start!77578 true))

(declare-fun array_inv!20016 (array!52987) Bool)

(assert (=> start!77578 (and (array_inv!20016 _values!1152) e!505947)))

(declare-fun array_inv!20017 (array!52985) Bool)

(assert (=> start!77578 (array_inv!20017 _keys!1386)))

(declare-fun mapNonEmpty!29371 () Bool)

(declare-fun tp!56431 () Bool)

(declare-fun e!505950 () Bool)

(assert (=> mapNonEmpty!29371 (= mapRes!29371 (and tp!56431 e!505950))))

(declare-fun mapKey!29371 () (_ BitVec 32))

(declare-fun mapValue!29371 () ValueCell!8741)

(declare-fun mapRest!29371 () (Array (_ BitVec 32) ValueCell!8741))

(assert (=> mapNonEmpty!29371 (= (arr!25451 _values!1152) (store mapRest!29371 mapKey!29371 mapValue!29371))))

(declare-fun b!903283 () Bool)

(declare-fun tp_is_empty!18445 () Bool)

(assert (=> b!903283 (= e!505950 tp_is_empty!18445)))

(declare-fun b!903284 () Bool)

(declare-fun res!609308 () Bool)

(assert (=> b!903284 (=> (not res!609308) (not e!505948))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52985 (_ BitVec 32)) Bool)

(assert (=> b!903284 (= res!609308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29371 () Bool)

(assert (=> mapIsEmpty!29371 mapRes!29371))

(declare-fun b!903285 () Bool)

(assert (=> b!903285 (= e!505949 tp_is_empty!18445)))

(assert (= (and start!77578 res!609311) b!903280))

(assert (= (and b!903280 res!609310) b!903284))

(assert (= (and b!903284 res!609308) b!903282))

(assert (= (and b!903282 res!609309) b!903279))

(assert (= (and b!903281 condMapEmpty!29371) mapIsEmpty!29371))

(assert (= (and b!903281 (not condMapEmpty!29371)) mapNonEmpty!29371))

(get-info :version)

(assert (= (and mapNonEmpty!29371 ((_ is ValueCellFull!8741) mapValue!29371)) b!903283))

(assert (= (and b!903281 ((_ is ValueCellFull!8741) mapDefault!29371)) b!903285))

(assert (= start!77578 b!903281))

(declare-fun m!839695 () Bool)

(assert (=> b!903279 m!839695))

(declare-fun m!839697 () Bool)

(assert (=> start!77578 m!839697))

(declare-fun m!839699 () Bool)

(assert (=> start!77578 m!839699))

(declare-fun m!839701 () Bool)

(assert (=> start!77578 m!839701))

(declare-fun m!839703 () Bool)

(assert (=> mapNonEmpty!29371 m!839703))

(declare-fun m!839705 () Bool)

(assert (=> b!903284 m!839705))

(check-sat (not b!903284) (not b!903279) (not start!77578) tp_is_empty!18445 (not mapNonEmpty!29371))
(check-sat)
(get-model)

(declare-fun b!903336 () Bool)

(declare-fun e!505989 () Bool)

(declare-fun call!40288 () Bool)

(assert (=> b!903336 (= e!505989 call!40288)))

(declare-fun bm!40285 () Bool)

(assert (=> bm!40285 (= call!40288 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1386 mask!1756))))

(declare-fun d!112271 () Bool)

(declare-fun res!609340 () Bool)

(declare-fun e!505990 () Bool)

(assert (=> d!112271 (=> res!609340 e!505990)))

(assert (=> d!112271 (= res!609340 (bvsge #b00000000000000000000000000000000 (size!25910 _keys!1386)))))

(assert (=> d!112271 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756) e!505990)))

(declare-fun b!903337 () Bool)

(declare-fun e!505988 () Bool)

(assert (=> b!903337 (= e!505988 call!40288)))

(declare-fun b!903338 () Bool)

(assert (=> b!903338 (= e!505990 e!505988)))

(declare-fun c!95921 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!903338 (= c!95921 (validKeyInArray!0 (select (arr!25450 _keys!1386) #b00000000000000000000000000000000)))))

(declare-fun b!903339 () Bool)

(assert (=> b!903339 (= e!505988 e!505989)))

(declare-fun lt!408225 () (_ BitVec 64))

(assert (=> b!903339 (= lt!408225 (select (arr!25450 _keys!1386) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30640 0))(
  ( (Unit!30641) )
))
(declare-fun lt!408224 () Unit!30640)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52985 (_ BitVec 64) (_ BitVec 32)) Unit!30640)

(assert (=> b!903339 (= lt!408224 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1386 lt!408225 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52985 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!903339 (arrayContainsKey!0 _keys!1386 lt!408225 #b00000000000000000000000000000000)))

(declare-fun lt!408223 () Unit!30640)

(assert (=> b!903339 (= lt!408223 lt!408224)))

(declare-fun res!609341 () Bool)

(declare-datatypes ((SeekEntryResult!8914 0))(
  ( (MissingZero!8914 (index!38027 (_ BitVec 32))) (Found!8914 (index!38028 (_ BitVec 32))) (Intermediate!8914 (undefined!9726 Bool) (index!38029 (_ BitVec 32)) (x!76889 (_ BitVec 32))) (Undefined!8914) (MissingVacant!8914 (index!38030 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52985 (_ BitVec 32)) SeekEntryResult!8914)

(assert (=> b!903339 (= res!609341 (= (seekEntryOrOpen!0 (select (arr!25450 _keys!1386) #b00000000000000000000000000000000) _keys!1386 mask!1756) (Found!8914 #b00000000000000000000000000000000)))))

(assert (=> b!903339 (=> (not res!609341) (not e!505989))))

(assert (= (and d!112271 (not res!609340)) b!903338))

(assert (= (and b!903338 c!95921) b!903339))

(assert (= (and b!903338 (not c!95921)) b!903337))

(assert (= (and b!903339 res!609341) b!903336))

(assert (= (or b!903336 b!903337) bm!40285))

(declare-fun m!839731 () Bool)

(assert (=> bm!40285 m!839731))

(declare-fun m!839733 () Bool)

(assert (=> b!903338 m!839733))

(assert (=> b!903338 m!839733))

(declare-fun m!839735 () Bool)

(assert (=> b!903338 m!839735))

(assert (=> b!903339 m!839733))

(declare-fun m!839737 () Bool)

(assert (=> b!903339 m!839737))

(declare-fun m!839739 () Bool)

(assert (=> b!903339 m!839739))

(assert (=> b!903339 m!839733))

(declare-fun m!839741 () Bool)

(assert (=> b!903339 m!839741))

(assert (=> b!903284 d!112271))

(declare-fun d!112273 () Bool)

(declare-fun res!609346 () Bool)

(declare-fun e!505995 () Bool)

(assert (=> d!112273 (=> res!609346 e!505995)))

(assert (=> d!112273 (= res!609346 ((_ is Nil!17834) Nil!17834))))

(assert (=> d!112273 (= (noDuplicate!1327 Nil!17834) e!505995)))

(declare-fun b!903344 () Bool)

(declare-fun e!505996 () Bool)

(assert (=> b!903344 (= e!505995 e!505996)))

(declare-fun res!609347 () Bool)

(assert (=> b!903344 (=> (not res!609347) (not e!505996))))

(declare-fun contains!4423 (List!17837 (_ BitVec 64)) Bool)

(assert (=> b!903344 (= res!609347 (not (contains!4423 (t!25212 Nil!17834) (h!18985 Nil!17834))))))

(declare-fun b!903345 () Bool)

(assert (=> b!903345 (= e!505996 (noDuplicate!1327 (t!25212 Nil!17834)))))

(assert (= (and d!112273 (not res!609346)) b!903344))

(assert (= (and b!903344 res!609347) b!903345))

(declare-fun m!839743 () Bool)

(assert (=> b!903344 m!839743))

(declare-fun m!839745 () Bool)

(assert (=> b!903345 m!839745))

(assert (=> b!903279 d!112273))

(declare-fun d!112275 () Bool)

(assert (=> d!112275 (= (validMask!0 mask!1756) (and (or (= mask!1756 #b00000000000000000000000000000111) (= mask!1756 #b00000000000000000000000000001111) (= mask!1756 #b00000000000000000000000000011111) (= mask!1756 #b00000000000000000000000000111111) (= mask!1756 #b00000000000000000000000001111111) (= mask!1756 #b00000000000000000000000011111111) (= mask!1756 #b00000000000000000000000111111111) (= mask!1756 #b00000000000000000000001111111111) (= mask!1756 #b00000000000000000000011111111111) (= mask!1756 #b00000000000000000000111111111111) (= mask!1756 #b00000000000000000001111111111111) (= mask!1756 #b00000000000000000011111111111111) (= mask!1756 #b00000000000000000111111111111111) (= mask!1756 #b00000000000000001111111111111111) (= mask!1756 #b00000000000000011111111111111111) (= mask!1756 #b00000000000000111111111111111111) (= mask!1756 #b00000000000001111111111111111111) (= mask!1756 #b00000000000011111111111111111111) (= mask!1756 #b00000000000111111111111111111111) (= mask!1756 #b00000000001111111111111111111111) (= mask!1756 #b00000000011111111111111111111111) (= mask!1756 #b00000000111111111111111111111111) (= mask!1756 #b00000001111111111111111111111111) (= mask!1756 #b00000011111111111111111111111111) (= mask!1756 #b00000111111111111111111111111111) (= mask!1756 #b00001111111111111111111111111111) (= mask!1756 #b00011111111111111111111111111111) (= mask!1756 #b00111111111111111111111111111111)) (bvsle mask!1756 #b00111111111111111111111111111111)))))

(assert (=> start!77578 d!112275))

(declare-fun d!112277 () Bool)

(assert (=> d!112277 (= (array_inv!20016 _values!1152) (bvsge (size!25911 _values!1152) #b00000000000000000000000000000000))))

(assert (=> start!77578 d!112277))

(declare-fun d!112279 () Bool)

(assert (=> d!112279 (= (array_inv!20017 _keys!1386) (bvsge (size!25910 _keys!1386) #b00000000000000000000000000000000))))

(assert (=> start!77578 d!112279))

(declare-fun condMapEmpty!29380 () Bool)

(declare-fun mapDefault!29380 () ValueCell!8741)

(assert (=> mapNonEmpty!29371 (= condMapEmpty!29380 (= mapRest!29371 ((as const (Array (_ BitVec 32) ValueCell!8741)) mapDefault!29380)))))

(declare-fun e!506002 () Bool)

(declare-fun mapRes!29380 () Bool)

(assert (=> mapNonEmpty!29371 (= tp!56431 (and e!506002 mapRes!29380))))

(declare-fun b!903352 () Bool)

(declare-fun e!506001 () Bool)

(assert (=> b!903352 (= e!506001 tp_is_empty!18445)))

(declare-fun mapNonEmpty!29380 () Bool)

(declare-fun tp!56440 () Bool)

(assert (=> mapNonEmpty!29380 (= mapRes!29380 (and tp!56440 e!506001))))

(declare-fun mapRest!29380 () (Array (_ BitVec 32) ValueCell!8741))

(declare-fun mapKey!29380 () (_ BitVec 32))

(declare-fun mapValue!29380 () ValueCell!8741)

(assert (=> mapNonEmpty!29380 (= mapRest!29371 (store mapRest!29380 mapKey!29380 mapValue!29380))))

(declare-fun mapIsEmpty!29380 () Bool)

(assert (=> mapIsEmpty!29380 mapRes!29380))

(declare-fun b!903353 () Bool)

(assert (=> b!903353 (= e!506002 tp_is_empty!18445)))

(assert (= (and mapNonEmpty!29371 condMapEmpty!29380) mapIsEmpty!29380))

(assert (= (and mapNonEmpty!29371 (not condMapEmpty!29380)) mapNonEmpty!29380))

(assert (= (and mapNonEmpty!29380 ((_ is ValueCellFull!8741) mapValue!29380)) b!903352))

(assert (= (and mapNonEmpty!29371 ((_ is ValueCellFull!8741) mapDefault!29380)) b!903353))

(declare-fun m!839747 () Bool)

(assert (=> mapNonEmpty!29380 m!839747))

(check-sat (not b!903338) (not bm!40285) (not b!903344) tp_is_empty!18445 (not mapNonEmpty!29380) (not b!903345) (not b!903339))
(check-sat)
