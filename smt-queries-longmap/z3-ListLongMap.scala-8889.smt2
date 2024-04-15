; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107936 () Bool)

(assert start!107936)

(declare-fun b!1275260 () Bool)

(declare-fun e!727987 () Bool)

(declare-fun tp_is_empty!33247 () Bool)

(assert (=> b!1275260 (= e!727987 tp_is_empty!33247)))

(declare-fun b!1275261 () Bool)

(declare-fun res!847669 () Bool)

(declare-fun e!727991 () Bool)

(assert (=> b!1275261 (=> (not res!847669) (not e!727991))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83499 0))(
  ( (array!83500 (arr!40266 (Array (_ BitVec 32) (_ BitVec 64))) (size!40818 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83499)

(declare-datatypes ((V!49433 0))(
  ( (V!49434 (val!16698 Int)) )
))
(declare-datatypes ((ValueCell!15725 0))(
  ( (ValueCellFull!15725 (v!19293 V!49433)) (EmptyCell!15725) )
))
(declare-datatypes ((array!83501 0))(
  ( (array!83502 (arr!40267 (Array (_ BitVec 32) ValueCell!15725)) (size!40819 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83501)

(assert (=> b!1275261 (= res!847669 (and (= (size!40819 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40818 _keys!1427) (size!40819 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275262 () Bool)

(assert (=> b!1275262 (= e!727991 (bvsgt #b00000000000000000000000000000000 (size!40818 _keys!1427)))))

(declare-fun b!1275263 () Bool)

(declare-fun res!847668 () Bool)

(assert (=> b!1275263 (=> (not res!847668) (not e!727991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83499 (_ BitVec 32)) Bool)

(assert (=> b!1275263 (= res!847668 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!847667 () Bool)

(assert (=> start!107936 (=> (not res!847667) (not e!727991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107936 (= res!847667 (validMask!0 mask!1805))))

(assert (=> start!107936 e!727991))

(assert (=> start!107936 true))

(declare-fun e!727989 () Bool)

(declare-fun array_inv!30761 (array!83501) Bool)

(assert (=> start!107936 (and (array_inv!30761 _values!1187) e!727989)))

(declare-fun array_inv!30762 (array!83499) Bool)

(assert (=> start!107936 (array_inv!30762 _keys!1427)))

(declare-fun mapNonEmpty!51386 () Bool)

(declare-fun mapRes!51386 () Bool)

(declare-fun tp!98145 () Bool)

(assert (=> mapNonEmpty!51386 (= mapRes!51386 (and tp!98145 e!727987))))

(declare-fun mapValue!51386 () ValueCell!15725)

(declare-fun mapKey!51386 () (_ BitVec 32))

(declare-fun mapRest!51386 () (Array (_ BitVec 32) ValueCell!15725))

(assert (=> mapNonEmpty!51386 (= (arr!40267 _values!1187) (store mapRest!51386 mapKey!51386 mapValue!51386))))

(declare-fun b!1275264 () Bool)

(declare-fun e!727988 () Bool)

(assert (=> b!1275264 (= e!727989 (and e!727988 mapRes!51386))))

(declare-fun condMapEmpty!51386 () Bool)

(declare-fun mapDefault!51386 () ValueCell!15725)

(assert (=> b!1275264 (= condMapEmpty!51386 (= (arr!40267 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15725)) mapDefault!51386)))))

(declare-fun mapIsEmpty!51386 () Bool)

(assert (=> mapIsEmpty!51386 mapRes!51386))

(declare-fun b!1275265 () Bool)

(assert (=> b!1275265 (= e!727988 tp_is_empty!33247)))

(assert (= (and start!107936 res!847667) b!1275261))

(assert (= (and b!1275261 res!847669) b!1275263))

(assert (= (and b!1275263 res!847668) b!1275262))

(assert (= (and b!1275264 condMapEmpty!51386) mapIsEmpty!51386))

(assert (= (and b!1275264 (not condMapEmpty!51386)) mapNonEmpty!51386))

(get-info :version)

(assert (= (and mapNonEmpty!51386 ((_ is ValueCellFull!15725) mapValue!51386)) b!1275260))

(assert (= (and b!1275264 ((_ is ValueCellFull!15725) mapDefault!51386)) b!1275265))

(assert (= start!107936 b!1275264))

(declare-fun m!1171117 () Bool)

(assert (=> b!1275263 m!1171117))

(declare-fun m!1171119 () Bool)

(assert (=> start!107936 m!1171119))

(declare-fun m!1171121 () Bool)

(assert (=> start!107936 m!1171121))

(declare-fun m!1171123 () Bool)

(assert (=> start!107936 m!1171123))

(declare-fun m!1171125 () Bool)

(assert (=> mapNonEmpty!51386 m!1171125))

(check-sat (not b!1275263) (not start!107936) (not mapNonEmpty!51386) tp_is_empty!33247)
(check-sat)
(get-model)

(declare-fun b!1275310 () Bool)

(declare-fun e!728028 () Bool)

(declare-fun call!62616 () Bool)

(assert (=> b!1275310 (= e!728028 call!62616)))

(declare-fun d!140235 () Bool)

(declare-fun res!847692 () Bool)

(declare-fun e!728030 () Bool)

(assert (=> d!140235 (=> res!847692 e!728030)))

(assert (=> d!140235 (= res!847692 (bvsge #b00000000000000000000000000000000 (size!40818 _keys!1427)))))

(assert (=> d!140235 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728030)))

(declare-fun bm!62613 () Bool)

(assert (=> bm!62613 (= call!62616 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275311 () Bool)

(declare-fun e!728029 () Bool)

(assert (=> b!1275311 (= e!728028 e!728029)))

(declare-fun lt!575162 () (_ BitVec 64))

(assert (=> b!1275311 (= lt!575162 (select (arr!40266 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42197 0))(
  ( (Unit!42198) )
))
(declare-fun lt!575160 () Unit!42197)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83499 (_ BitVec 64) (_ BitVec 32)) Unit!42197)

(assert (=> b!1275311 (= lt!575160 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575162 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83499 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275311 (arrayContainsKey!0 _keys!1427 lt!575162 #b00000000000000000000000000000000)))

(declare-fun lt!575161 () Unit!42197)

(assert (=> b!1275311 (= lt!575161 lt!575160)))

(declare-fun res!847693 () Bool)

(declare-datatypes ((SeekEntryResult!10000 0))(
  ( (MissingZero!10000 (index!42371 (_ BitVec 32))) (Found!10000 (index!42372 (_ BitVec 32))) (Intermediate!10000 (undefined!10812 Bool) (index!42373 (_ BitVec 32)) (x!112942 (_ BitVec 32))) (Undefined!10000) (MissingVacant!10000 (index!42374 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83499 (_ BitVec 32)) SeekEntryResult!10000)

(assert (=> b!1275311 (= res!847693 (= (seekEntryOrOpen!0 (select (arr!40266 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10000 #b00000000000000000000000000000000)))))

(assert (=> b!1275311 (=> (not res!847693) (not e!728029))))

(declare-fun b!1275312 () Bool)

(assert (=> b!1275312 (= e!728030 e!728028)))

(declare-fun c!123902 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275312 (= c!123902 (validKeyInArray!0 (select (arr!40266 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1275313 () Bool)

(assert (=> b!1275313 (= e!728029 call!62616)))

(assert (= (and d!140235 (not res!847692)) b!1275312))

(assert (= (and b!1275312 c!123902) b!1275311))

(assert (= (and b!1275312 (not c!123902)) b!1275310))

(assert (= (and b!1275311 res!847693) b!1275313))

(assert (= (or b!1275313 b!1275310) bm!62613))

(declare-fun m!1171147 () Bool)

(assert (=> bm!62613 m!1171147))

(declare-fun m!1171149 () Bool)

(assert (=> b!1275311 m!1171149))

(declare-fun m!1171151 () Bool)

(assert (=> b!1275311 m!1171151))

(declare-fun m!1171153 () Bool)

(assert (=> b!1275311 m!1171153))

(assert (=> b!1275311 m!1171149))

(declare-fun m!1171155 () Bool)

(assert (=> b!1275311 m!1171155))

(assert (=> b!1275312 m!1171149))

(assert (=> b!1275312 m!1171149))

(declare-fun m!1171157 () Bool)

(assert (=> b!1275312 m!1171157))

(assert (=> b!1275263 d!140235))

(declare-fun d!140237 () Bool)

(assert (=> d!140237 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107936 d!140237))

(declare-fun d!140239 () Bool)

(assert (=> d!140239 (= (array_inv!30761 _values!1187) (bvsge (size!40819 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107936 d!140239))

(declare-fun d!140241 () Bool)

(assert (=> d!140241 (= (array_inv!30762 _keys!1427) (bvsge (size!40818 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107936 d!140241))

(declare-fun mapNonEmpty!51395 () Bool)

(declare-fun mapRes!51395 () Bool)

(declare-fun tp!98154 () Bool)

(declare-fun e!728036 () Bool)

(assert (=> mapNonEmpty!51395 (= mapRes!51395 (and tp!98154 e!728036))))

(declare-fun mapKey!51395 () (_ BitVec 32))

(declare-fun mapRest!51395 () (Array (_ BitVec 32) ValueCell!15725))

(declare-fun mapValue!51395 () ValueCell!15725)

(assert (=> mapNonEmpty!51395 (= mapRest!51386 (store mapRest!51395 mapKey!51395 mapValue!51395))))

(declare-fun b!1275320 () Bool)

(assert (=> b!1275320 (= e!728036 tp_is_empty!33247)))

(declare-fun b!1275321 () Bool)

(declare-fun e!728035 () Bool)

(assert (=> b!1275321 (= e!728035 tp_is_empty!33247)))

(declare-fun condMapEmpty!51395 () Bool)

(declare-fun mapDefault!51395 () ValueCell!15725)

(assert (=> mapNonEmpty!51386 (= condMapEmpty!51395 (= mapRest!51386 ((as const (Array (_ BitVec 32) ValueCell!15725)) mapDefault!51395)))))

(assert (=> mapNonEmpty!51386 (= tp!98145 (and e!728035 mapRes!51395))))

(declare-fun mapIsEmpty!51395 () Bool)

(assert (=> mapIsEmpty!51395 mapRes!51395))

(assert (= (and mapNonEmpty!51386 condMapEmpty!51395) mapIsEmpty!51395))

(assert (= (and mapNonEmpty!51386 (not condMapEmpty!51395)) mapNonEmpty!51395))

(assert (= (and mapNonEmpty!51395 ((_ is ValueCellFull!15725) mapValue!51395)) b!1275320))

(assert (= (and mapNonEmpty!51386 ((_ is ValueCellFull!15725) mapDefault!51395)) b!1275321))

(declare-fun m!1171159 () Bool)

(assert (=> mapNonEmpty!51395 m!1171159))

(check-sat tp_is_empty!33247 (not bm!62613) (not b!1275311) (not b!1275312) (not mapNonEmpty!51395))
(check-sat)
