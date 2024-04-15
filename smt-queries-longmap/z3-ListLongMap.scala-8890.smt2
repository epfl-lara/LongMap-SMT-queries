; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107950 () Bool)

(assert start!107950)

(declare-fun mapNonEmpty!51398 () Bool)

(declare-fun mapRes!51398 () Bool)

(declare-fun tp!98157 () Bool)

(declare-fun e!728048 () Bool)

(assert (=> mapNonEmpty!51398 (= mapRes!51398 (and tp!98157 e!728048))))

(declare-fun mapKey!51398 () (_ BitVec 32))

(declare-datatypes ((V!49441 0))(
  ( (V!49442 (val!16701 Int)) )
))
(declare-datatypes ((ValueCell!15728 0))(
  ( (ValueCellFull!15728 (v!19296 V!49441)) (EmptyCell!15728) )
))
(declare-fun mapRest!51398 () (Array (_ BitVec 32) ValueCell!15728))

(declare-fun mapValue!51398 () ValueCell!15728)

(declare-datatypes ((array!83511 0))(
  ( (array!83512 (arr!40271 (Array (_ BitVec 32) ValueCell!15728)) (size!40823 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83511)

(assert (=> mapNonEmpty!51398 (= (arr!40271 _values!1187) (store mapRest!51398 mapKey!51398 mapValue!51398))))

(declare-fun b!1275334 () Bool)

(declare-fun res!847701 () Bool)

(declare-fun e!728050 () Bool)

(assert (=> b!1275334 (=> (not res!847701) (not e!728050))))

(declare-datatypes ((array!83513 0))(
  ( (array!83514 (arr!40272 (Array (_ BitVec 32) (_ BitVec 64))) (size!40824 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83513)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83513 (_ BitVec 32)) Bool)

(assert (=> b!1275334 (= res!847701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275335 () Bool)

(declare-fun e!728047 () Bool)

(declare-fun tp_is_empty!33253 () Bool)

(assert (=> b!1275335 (= e!728047 tp_is_empty!33253)))

(declare-fun mapIsEmpty!51398 () Bool)

(assert (=> mapIsEmpty!51398 mapRes!51398))

(declare-fun b!1275336 () Bool)

(assert (=> b!1275336 (= e!728050 (and (bvsle #b00000000000000000000000000000000 (size!40824 _keys!1427)) (bvsge (size!40824 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun b!1275337 () Bool)

(assert (=> b!1275337 (= e!728048 tp_is_empty!33253)))

(declare-fun res!847702 () Bool)

(assert (=> start!107950 (=> (not res!847702) (not e!728050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107950 (= res!847702 (validMask!0 mask!1805))))

(assert (=> start!107950 e!728050))

(assert (=> start!107950 true))

(declare-fun e!728051 () Bool)

(declare-fun array_inv!30765 (array!83511) Bool)

(assert (=> start!107950 (and (array_inv!30765 _values!1187) e!728051)))

(declare-fun array_inv!30766 (array!83513) Bool)

(assert (=> start!107950 (array_inv!30766 _keys!1427)))

(declare-fun b!1275338 () Bool)

(declare-fun res!847700 () Bool)

(assert (=> b!1275338 (=> (not res!847700) (not e!728050))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275338 (= res!847700 (and (= (size!40823 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40824 _keys!1427) (size!40823 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275339 () Bool)

(assert (=> b!1275339 (= e!728051 (and e!728047 mapRes!51398))))

(declare-fun condMapEmpty!51398 () Bool)

(declare-fun mapDefault!51398 () ValueCell!15728)

(assert (=> b!1275339 (= condMapEmpty!51398 (= (arr!40271 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15728)) mapDefault!51398)))))

(assert (= (and start!107950 res!847702) b!1275338))

(assert (= (and b!1275338 res!847700) b!1275334))

(assert (= (and b!1275334 res!847701) b!1275336))

(assert (= (and b!1275339 condMapEmpty!51398) mapIsEmpty!51398))

(assert (= (and b!1275339 (not condMapEmpty!51398)) mapNonEmpty!51398))

(get-info :version)

(assert (= (and mapNonEmpty!51398 ((_ is ValueCellFull!15728) mapValue!51398)) b!1275337))

(assert (= (and b!1275339 ((_ is ValueCellFull!15728) mapDefault!51398)) b!1275335))

(assert (= start!107950 b!1275339))

(declare-fun m!1171161 () Bool)

(assert (=> mapNonEmpty!51398 m!1171161))

(declare-fun m!1171163 () Bool)

(assert (=> b!1275334 m!1171163))

(declare-fun m!1171165 () Bool)

(assert (=> start!107950 m!1171165))

(declare-fun m!1171167 () Bool)

(assert (=> start!107950 m!1171167))

(declare-fun m!1171169 () Bool)

(assert (=> start!107950 m!1171169))

(check-sat (not b!1275334) (not start!107950) (not mapNonEmpty!51398) tp_is_empty!33253)
(check-sat)
(get-model)

(declare-fun b!1275384 () Bool)

(declare-fun e!728090 () Bool)

(declare-fun call!62619 () Bool)

(assert (=> b!1275384 (= e!728090 call!62619)))

(declare-fun bm!62616 () Bool)

(assert (=> bm!62616 (= call!62619 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275385 () Bool)

(declare-fun e!728088 () Bool)

(assert (=> b!1275385 (= e!728088 call!62619)))

(declare-fun b!1275386 () Bool)

(assert (=> b!1275386 (= e!728090 e!728088)))

(declare-fun lt!575171 () (_ BitVec 64))

(assert (=> b!1275386 (= lt!575171 (select (arr!40272 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42199 0))(
  ( (Unit!42200) )
))
(declare-fun lt!575170 () Unit!42199)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83513 (_ BitVec 64) (_ BitVec 32)) Unit!42199)

(assert (=> b!1275386 (= lt!575170 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575171 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275386 (arrayContainsKey!0 _keys!1427 lt!575171 #b00000000000000000000000000000000)))

(declare-fun lt!575169 () Unit!42199)

(assert (=> b!1275386 (= lt!575169 lt!575170)))

(declare-fun res!847725 () Bool)

(declare-datatypes ((SeekEntryResult!10001 0))(
  ( (MissingZero!10001 (index!42375 (_ BitVec 32))) (Found!10001 (index!42376 (_ BitVec 32))) (Intermediate!10001 (undefined!10813 Bool) (index!42377 (_ BitVec 32)) (x!112953 (_ BitVec 32))) (Undefined!10001) (MissingVacant!10001 (index!42378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83513 (_ BitVec 32)) SeekEntryResult!10001)

(assert (=> b!1275386 (= res!847725 (= (seekEntryOrOpen!0 (select (arr!40272 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10001 #b00000000000000000000000000000000)))))

(assert (=> b!1275386 (=> (not res!847725) (not e!728088))))

(declare-fun d!140245 () Bool)

(declare-fun res!847726 () Bool)

(declare-fun e!728089 () Bool)

(assert (=> d!140245 (=> res!847726 e!728089)))

(assert (=> d!140245 (= res!847726 (bvsge #b00000000000000000000000000000000 (size!40824 _keys!1427)))))

(assert (=> d!140245 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728089)))

(declare-fun b!1275387 () Bool)

(assert (=> b!1275387 (= e!728089 e!728090)))

(declare-fun c!123905 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275387 (= c!123905 (validKeyInArray!0 (select (arr!40272 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140245 (not res!847726)) b!1275387))

(assert (= (and b!1275387 c!123905) b!1275386))

(assert (= (and b!1275387 (not c!123905)) b!1275384))

(assert (= (and b!1275386 res!847725) b!1275385))

(assert (= (or b!1275385 b!1275384) bm!62616))

(declare-fun m!1171191 () Bool)

(assert (=> bm!62616 m!1171191))

(declare-fun m!1171193 () Bool)

(assert (=> b!1275386 m!1171193))

(declare-fun m!1171195 () Bool)

(assert (=> b!1275386 m!1171195))

(declare-fun m!1171197 () Bool)

(assert (=> b!1275386 m!1171197))

(assert (=> b!1275386 m!1171193))

(declare-fun m!1171199 () Bool)

(assert (=> b!1275386 m!1171199))

(assert (=> b!1275387 m!1171193))

(assert (=> b!1275387 m!1171193))

(declare-fun m!1171201 () Bool)

(assert (=> b!1275387 m!1171201))

(assert (=> b!1275334 d!140245))

(declare-fun d!140247 () Bool)

(assert (=> d!140247 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107950 d!140247))

(declare-fun d!140249 () Bool)

(assert (=> d!140249 (= (array_inv!30765 _values!1187) (bvsge (size!40823 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107950 d!140249))

(declare-fun d!140251 () Bool)

(assert (=> d!140251 (= (array_inv!30766 _keys!1427) (bvsge (size!40824 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107950 d!140251))

(declare-fun mapNonEmpty!51407 () Bool)

(declare-fun mapRes!51407 () Bool)

(declare-fun tp!98166 () Bool)

(declare-fun e!728095 () Bool)

(assert (=> mapNonEmpty!51407 (= mapRes!51407 (and tp!98166 e!728095))))

(declare-fun mapValue!51407 () ValueCell!15728)

(declare-fun mapKey!51407 () (_ BitVec 32))

(declare-fun mapRest!51407 () (Array (_ BitVec 32) ValueCell!15728))

(assert (=> mapNonEmpty!51407 (= mapRest!51398 (store mapRest!51407 mapKey!51407 mapValue!51407))))

(declare-fun b!1275395 () Bool)

(declare-fun e!728096 () Bool)

(assert (=> b!1275395 (= e!728096 tp_is_empty!33253)))

(declare-fun mapIsEmpty!51407 () Bool)

(assert (=> mapIsEmpty!51407 mapRes!51407))

(declare-fun b!1275394 () Bool)

(assert (=> b!1275394 (= e!728095 tp_is_empty!33253)))

(declare-fun condMapEmpty!51407 () Bool)

(declare-fun mapDefault!51407 () ValueCell!15728)

(assert (=> mapNonEmpty!51398 (= condMapEmpty!51407 (= mapRest!51398 ((as const (Array (_ BitVec 32) ValueCell!15728)) mapDefault!51407)))))

(assert (=> mapNonEmpty!51398 (= tp!98157 (and e!728096 mapRes!51407))))

(assert (= (and mapNonEmpty!51398 condMapEmpty!51407) mapIsEmpty!51407))

(assert (= (and mapNonEmpty!51398 (not condMapEmpty!51407)) mapNonEmpty!51407))

(assert (= (and mapNonEmpty!51407 ((_ is ValueCellFull!15728) mapValue!51407)) b!1275394))

(assert (= (and mapNonEmpty!51398 ((_ is ValueCellFull!15728) mapDefault!51407)) b!1275395))

(declare-fun m!1171203 () Bool)

(assert (=> mapNonEmpty!51407 m!1171203))

(check-sat (not bm!62616) (not mapNonEmpty!51407) (not b!1275387) tp_is_empty!33253 (not b!1275386))
(check-sat)
