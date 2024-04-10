; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107938 () Bool)

(assert start!107938)

(declare-fun b!1275342 () Bool)

(declare-fun e!728032 () Bool)

(declare-fun e!728034 () Bool)

(declare-fun mapRes!51389 () Bool)

(assert (=> b!1275342 (= e!728032 (and e!728034 mapRes!51389))))

(declare-fun condMapEmpty!51389 () Bool)

(declare-datatypes ((V!49435 0))(
  ( (V!49436 (val!16699 Int)) )
))
(declare-datatypes ((ValueCell!15726 0))(
  ( (ValueCellFull!15726 (v!19295 V!49435)) (EmptyCell!15726) )
))
(declare-datatypes ((array!83606 0))(
  ( (array!83607 (arr!40319 (Array (_ BitVec 32) ValueCell!15726)) (size!40869 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83606)

(declare-fun mapDefault!51389 () ValueCell!15726)

(assert (=> b!1275342 (= condMapEmpty!51389 (= (arr!40319 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15726)) mapDefault!51389)))))

(declare-fun b!1275343 () Bool)

(declare-fun e!728033 () Bool)

(declare-fun tp_is_empty!33249 () Bool)

(assert (=> b!1275343 (= e!728033 tp_is_empty!33249)))

(declare-fun b!1275344 () Bool)

(assert (=> b!1275344 (= e!728034 tp_is_empty!33249)))

(declare-fun mapIsEmpty!51389 () Bool)

(assert (=> mapIsEmpty!51389 mapRes!51389))

(declare-fun res!847705 () Bool)

(declare-fun e!728031 () Bool)

(assert (=> start!107938 (=> (not res!847705) (not e!728031))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107938 (= res!847705 (validMask!0 mask!1805))))

(assert (=> start!107938 e!728031))

(assert (=> start!107938 true))

(declare-fun array_inv!30649 (array!83606) Bool)

(assert (=> start!107938 (and (array_inv!30649 _values!1187) e!728032)))

(declare-datatypes ((array!83608 0))(
  ( (array!83609 (arr!40320 (Array (_ BitVec 32) (_ BitVec 64))) (size!40870 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83608)

(declare-fun array_inv!30650 (array!83608) Bool)

(assert (=> start!107938 (array_inv!30650 _keys!1427)))

(declare-fun b!1275345 () Bool)

(declare-fun res!847703 () Bool)

(assert (=> b!1275345 (=> (not res!847703) (not e!728031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83608 (_ BitVec 32)) Bool)

(assert (=> b!1275345 (= res!847703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapNonEmpty!51389 () Bool)

(declare-fun tp!98147 () Bool)

(assert (=> mapNonEmpty!51389 (= mapRes!51389 (and tp!98147 e!728033))))

(declare-fun mapValue!51389 () ValueCell!15726)

(declare-fun mapRest!51389 () (Array (_ BitVec 32) ValueCell!15726))

(declare-fun mapKey!51389 () (_ BitVec 32))

(assert (=> mapNonEmpty!51389 (= (arr!40319 _values!1187) (store mapRest!51389 mapKey!51389 mapValue!51389))))

(declare-fun b!1275346 () Bool)

(declare-fun res!847704 () Bool)

(assert (=> b!1275346 (=> (not res!847704) (not e!728031))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275346 (= res!847704 (and (= (size!40869 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40870 _keys!1427) (size!40869 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275347 () Bool)

(assert (=> b!1275347 (= e!728031 (bvsgt #b00000000000000000000000000000000 (size!40870 _keys!1427)))))

(assert (= (and start!107938 res!847705) b!1275346))

(assert (= (and b!1275346 res!847704) b!1275345))

(assert (= (and b!1275345 res!847703) b!1275347))

(assert (= (and b!1275342 condMapEmpty!51389) mapIsEmpty!51389))

(assert (= (and b!1275342 (not condMapEmpty!51389)) mapNonEmpty!51389))

(get-info :version)

(assert (= (and mapNonEmpty!51389 ((_ is ValueCellFull!15726) mapValue!51389)) b!1275343))

(assert (= (and b!1275342 ((_ is ValueCellFull!15726) mapDefault!51389)) b!1275344))

(assert (= start!107938 b!1275342))

(declare-fun m!1171627 () Bool)

(assert (=> start!107938 m!1171627))

(declare-fun m!1171629 () Bool)

(assert (=> start!107938 m!1171629))

(declare-fun m!1171631 () Bool)

(assert (=> start!107938 m!1171631))

(declare-fun m!1171633 () Bool)

(assert (=> b!1275345 m!1171633))

(declare-fun m!1171635 () Bool)

(assert (=> mapNonEmpty!51389 m!1171635))

(check-sat (not b!1275345) (not start!107938) (not mapNonEmpty!51389) tp_is_empty!33249)
(check-sat)
(get-model)

(declare-fun b!1275374 () Bool)

(declare-fun e!728058 () Bool)

(declare-fun e!728057 () Bool)

(assert (=> b!1275374 (= e!728058 e!728057)))

(declare-fun c!123918 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275374 (= c!123918 (validKeyInArray!0 (select (arr!40320 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140347 () Bool)

(declare-fun res!847720 () Bool)

(assert (=> d!140347 (=> res!847720 e!728058)))

(assert (=> d!140347 (= res!847720 (bvsge #b00000000000000000000000000000000 (size!40870 _keys!1427)))))

(assert (=> d!140347 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728058)))

(declare-fun b!1275375 () Bool)

(declare-fun e!728059 () Bool)

(assert (=> b!1275375 (= e!728057 e!728059)))

(declare-fun lt!575340 () (_ BitVec 64))

(assert (=> b!1275375 (= lt!575340 (select (arr!40320 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42351 0))(
  ( (Unit!42352) )
))
(declare-fun lt!575338 () Unit!42351)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83608 (_ BitVec 64) (_ BitVec 32)) Unit!42351)

(assert (=> b!1275375 (= lt!575338 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575340 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83608 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275375 (arrayContainsKey!0 _keys!1427 lt!575340 #b00000000000000000000000000000000)))

(declare-fun lt!575339 () Unit!42351)

(assert (=> b!1275375 (= lt!575339 lt!575338)))

(declare-fun res!847719 () Bool)

(declare-datatypes ((SeekEntryResult!10001 0))(
  ( (MissingZero!10001 (index!42375 (_ BitVec 32))) (Found!10001 (index!42376 (_ BitVec 32))) (Intermediate!10001 (undefined!10813 Bool) (index!42377 (_ BitVec 32)) (x!112946 (_ BitVec 32))) (Undefined!10001) (MissingVacant!10001 (index!42378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83608 (_ BitVec 32)) SeekEntryResult!10001)

(assert (=> b!1275375 (= res!847719 (= (seekEntryOrOpen!0 (select (arr!40320 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10001 #b00000000000000000000000000000000)))))

(assert (=> b!1275375 (=> (not res!847719) (not e!728059))))

(declare-fun b!1275376 () Bool)

(declare-fun call!62635 () Bool)

(assert (=> b!1275376 (= e!728059 call!62635)))

(declare-fun bm!62632 () Bool)

(assert (=> bm!62632 (= call!62635 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275377 () Bool)

(assert (=> b!1275377 (= e!728057 call!62635)))

(assert (= (and d!140347 (not res!847720)) b!1275374))

(assert (= (and b!1275374 c!123918) b!1275375))

(assert (= (and b!1275374 (not c!123918)) b!1275377))

(assert (= (and b!1275375 res!847719) b!1275376))

(assert (= (or b!1275376 b!1275377) bm!62632))

(declare-fun m!1171647 () Bool)

(assert (=> b!1275374 m!1171647))

(assert (=> b!1275374 m!1171647))

(declare-fun m!1171649 () Bool)

(assert (=> b!1275374 m!1171649))

(assert (=> b!1275375 m!1171647))

(declare-fun m!1171651 () Bool)

(assert (=> b!1275375 m!1171651))

(declare-fun m!1171653 () Bool)

(assert (=> b!1275375 m!1171653))

(assert (=> b!1275375 m!1171647))

(declare-fun m!1171655 () Bool)

(assert (=> b!1275375 m!1171655))

(declare-fun m!1171657 () Bool)

(assert (=> bm!62632 m!1171657))

(assert (=> b!1275345 d!140347))

(declare-fun d!140349 () Bool)

(assert (=> d!140349 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107938 d!140349))

(declare-fun d!140351 () Bool)

(assert (=> d!140351 (= (array_inv!30649 _values!1187) (bvsge (size!40869 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107938 d!140351))

(declare-fun d!140353 () Bool)

(assert (=> d!140353 (= (array_inv!30650 _keys!1427) (bvsge (size!40870 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107938 d!140353))

(declare-fun condMapEmpty!51395 () Bool)

(declare-fun mapDefault!51395 () ValueCell!15726)

(assert (=> mapNonEmpty!51389 (= condMapEmpty!51395 (= mapRest!51389 ((as const (Array (_ BitVec 32) ValueCell!15726)) mapDefault!51395)))))

(declare-fun e!728065 () Bool)

(declare-fun mapRes!51395 () Bool)

(assert (=> mapNonEmpty!51389 (= tp!98147 (and e!728065 mapRes!51395))))

(declare-fun b!1275385 () Bool)

(assert (=> b!1275385 (= e!728065 tp_is_empty!33249)))

(declare-fun mapNonEmpty!51395 () Bool)

(declare-fun tp!98153 () Bool)

(declare-fun e!728064 () Bool)

(assert (=> mapNonEmpty!51395 (= mapRes!51395 (and tp!98153 e!728064))))

(declare-fun mapKey!51395 () (_ BitVec 32))

(declare-fun mapRest!51395 () (Array (_ BitVec 32) ValueCell!15726))

(declare-fun mapValue!51395 () ValueCell!15726)

(assert (=> mapNonEmpty!51395 (= mapRest!51389 (store mapRest!51395 mapKey!51395 mapValue!51395))))

(declare-fun mapIsEmpty!51395 () Bool)

(assert (=> mapIsEmpty!51395 mapRes!51395))

(declare-fun b!1275384 () Bool)

(assert (=> b!1275384 (= e!728064 tp_is_empty!33249)))

(assert (= (and mapNonEmpty!51389 condMapEmpty!51395) mapIsEmpty!51395))

(assert (= (and mapNonEmpty!51389 (not condMapEmpty!51395)) mapNonEmpty!51395))

(assert (= (and mapNonEmpty!51395 ((_ is ValueCellFull!15726) mapValue!51395)) b!1275384))

(assert (= (and mapNonEmpty!51389 ((_ is ValueCellFull!15726) mapDefault!51395)) b!1275385))

(declare-fun m!1171659 () Bool)

(assert (=> mapNonEmpty!51395 m!1171659))

(check-sat (not b!1275375) (not mapNonEmpty!51395) tp_is_empty!33249 (not b!1275374) (not bm!62632))
(check-sat)
