; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107952 () Bool)

(assert start!107952)

(declare-fun res!847736 () Bool)

(declare-fun e!728091 () Bool)

(assert (=> start!107952 (=> (not res!847736) (not e!728091))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107952 (= res!847736 (validMask!0 mask!1805))))

(assert (=> start!107952 e!728091))

(assert (=> start!107952 true))

(declare-datatypes ((V!49443 0))(
  ( (V!49444 (val!16702 Int)) )
))
(declare-datatypes ((ValueCell!15729 0))(
  ( (ValueCellFull!15729 (v!19298 V!49443)) (EmptyCell!15729) )
))
(declare-datatypes ((array!83616 0))(
  ( (array!83617 (arr!40323 (Array (_ BitVec 32) ValueCell!15729)) (size!40873 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83616)

(declare-fun e!728095 () Bool)

(declare-fun array_inv!30651 (array!83616) Bool)

(assert (=> start!107952 (and (array_inv!30651 _values!1187) e!728095)))

(declare-datatypes ((array!83618 0))(
  ( (array!83619 (arr!40324 (Array (_ BitVec 32) (_ BitVec 64))) (size!40874 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83618)

(declare-fun array_inv!30652 (array!83618) Bool)

(assert (=> start!107952 (array_inv!30652 _keys!1427)))

(declare-fun b!1275416 () Bool)

(declare-fun e!728093 () Bool)

(declare-fun tp_is_empty!33255 () Bool)

(assert (=> b!1275416 (= e!728093 tp_is_empty!33255)))

(declare-fun b!1275417 () Bool)

(declare-fun res!847738 () Bool)

(assert (=> b!1275417 (=> (not res!847738) (not e!728091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83618 (_ BitVec 32)) Bool)

(assert (=> b!1275417 (= res!847738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275418 () Bool)

(assert (=> b!1275418 (= e!728091 (and (bvsle #b00000000000000000000000000000000 (size!40874 _keys!1427)) (bvsge (size!40874 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51401 () Bool)

(declare-fun mapRes!51401 () Bool)

(declare-fun tp!98159 () Bool)

(declare-fun e!728092 () Bool)

(assert (=> mapNonEmpty!51401 (= mapRes!51401 (and tp!98159 e!728092))))

(declare-fun mapRest!51401 () (Array (_ BitVec 32) ValueCell!15729))

(declare-fun mapKey!51401 () (_ BitVec 32))

(declare-fun mapValue!51401 () ValueCell!15729)

(assert (=> mapNonEmpty!51401 (= (arr!40323 _values!1187) (store mapRest!51401 mapKey!51401 mapValue!51401))))

(declare-fun b!1275419 () Bool)

(assert (=> b!1275419 (= e!728095 (and e!728093 mapRes!51401))))

(declare-fun condMapEmpty!51401 () Bool)

(declare-fun mapDefault!51401 () ValueCell!15729)

(assert (=> b!1275419 (= condMapEmpty!51401 (= (arr!40323 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15729)) mapDefault!51401)))))

(declare-fun b!1275420 () Bool)

(declare-fun res!847737 () Bool)

(assert (=> b!1275420 (=> (not res!847737) (not e!728091))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275420 (= res!847737 (and (= (size!40873 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40874 _keys!1427) (size!40873 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51401 () Bool)

(assert (=> mapIsEmpty!51401 mapRes!51401))

(declare-fun b!1275421 () Bool)

(assert (=> b!1275421 (= e!728092 tp_is_empty!33255)))

(assert (= (and start!107952 res!847736) b!1275420))

(assert (= (and b!1275420 res!847737) b!1275417))

(assert (= (and b!1275417 res!847738) b!1275418))

(assert (= (and b!1275419 condMapEmpty!51401) mapIsEmpty!51401))

(assert (= (and b!1275419 (not condMapEmpty!51401)) mapNonEmpty!51401))

(get-info :version)

(assert (= (and mapNonEmpty!51401 ((_ is ValueCellFull!15729) mapValue!51401)) b!1275421))

(assert (= (and b!1275419 ((_ is ValueCellFull!15729) mapDefault!51401)) b!1275416))

(assert (= start!107952 b!1275419))

(declare-fun m!1171671 () Bool)

(assert (=> start!107952 m!1171671))

(declare-fun m!1171673 () Bool)

(assert (=> start!107952 m!1171673))

(declare-fun m!1171675 () Bool)

(assert (=> start!107952 m!1171675))

(declare-fun m!1171677 () Bool)

(assert (=> b!1275417 m!1171677))

(declare-fun m!1171679 () Bool)

(assert (=> mapNonEmpty!51401 m!1171679))

(check-sat (not b!1275417) (not start!107952) (not mapNonEmpty!51401) tp_is_empty!33255)
(check-sat)
(get-model)

(declare-fun b!1275448 () Bool)

(declare-fun e!728119 () Bool)

(declare-fun e!728118 () Bool)

(assert (=> b!1275448 (= e!728119 e!728118)))

(declare-fun lt!575349 () (_ BitVec 64))

(assert (=> b!1275448 (= lt!575349 (select (arr!40324 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42353 0))(
  ( (Unit!42354) )
))
(declare-fun lt!575347 () Unit!42353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83618 (_ BitVec 64) (_ BitVec 32)) Unit!42353)

(assert (=> b!1275448 (= lt!575347 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575349 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275448 (arrayContainsKey!0 _keys!1427 lt!575349 #b00000000000000000000000000000000)))

(declare-fun lt!575348 () Unit!42353)

(assert (=> b!1275448 (= lt!575348 lt!575347)))

(declare-fun res!847752 () Bool)

(declare-datatypes ((SeekEntryResult!10002 0))(
  ( (MissingZero!10002 (index!42379 (_ BitVec 32))) (Found!10002 (index!42380 (_ BitVec 32))) (Intermediate!10002 (undefined!10814 Bool) (index!42381 (_ BitVec 32)) (x!112957 (_ BitVec 32))) (Undefined!10002) (MissingVacant!10002 (index!42382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83618 (_ BitVec 32)) SeekEntryResult!10002)

(assert (=> b!1275448 (= res!847752 (= (seekEntryOrOpen!0 (select (arr!40324 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10002 #b00000000000000000000000000000000)))))

(assert (=> b!1275448 (=> (not res!847752) (not e!728118))))

(declare-fun b!1275449 () Bool)

(declare-fun call!62638 () Bool)

(assert (=> b!1275449 (= e!728119 call!62638)))

(declare-fun d!140357 () Bool)

(declare-fun res!847753 () Bool)

(declare-fun e!728117 () Bool)

(assert (=> d!140357 (=> res!847753 e!728117)))

(assert (=> d!140357 (= res!847753 (bvsge #b00000000000000000000000000000000 (size!40874 _keys!1427)))))

(assert (=> d!140357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728117)))

(declare-fun bm!62635 () Bool)

(assert (=> bm!62635 (= call!62638 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275450 () Bool)

(assert (=> b!1275450 (= e!728118 call!62638)))

(declare-fun b!1275451 () Bool)

(assert (=> b!1275451 (= e!728117 e!728119)))

(declare-fun c!123921 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275451 (= c!123921 (validKeyInArray!0 (select (arr!40324 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140357 (not res!847753)) b!1275451))

(assert (= (and b!1275451 c!123921) b!1275448))

(assert (= (and b!1275451 (not c!123921)) b!1275449))

(assert (= (and b!1275448 res!847752) b!1275450))

(assert (= (or b!1275450 b!1275449) bm!62635))

(declare-fun m!1171691 () Bool)

(assert (=> b!1275448 m!1171691))

(declare-fun m!1171693 () Bool)

(assert (=> b!1275448 m!1171693))

(declare-fun m!1171695 () Bool)

(assert (=> b!1275448 m!1171695))

(assert (=> b!1275448 m!1171691))

(declare-fun m!1171697 () Bool)

(assert (=> b!1275448 m!1171697))

(declare-fun m!1171699 () Bool)

(assert (=> bm!62635 m!1171699))

(assert (=> b!1275451 m!1171691))

(assert (=> b!1275451 m!1171691))

(declare-fun m!1171701 () Bool)

(assert (=> b!1275451 m!1171701))

(assert (=> b!1275417 d!140357))

(declare-fun d!140359 () Bool)

(assert (=> d!140359 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107952 d!140359))

(declare-fun d!140361 () Bool)

(assert (=> d!140361 (= (array_inv!30651 _values!1187) (bvsge (size!40873 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107952 d!140361))

(declare-fun d!140363 () Bool)

(assert (=> d!140363 (= (array_inv!30652 _keys!1427) (bvsge (size!40874 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107952 d!140363))

(declare-fun b!1275458 () Bool)

(declare-fun e!728125 () Bool)

(assert (=> b!1275458 (= e!728125 tp_is_empty!33255)))

(declare-fun condMapEmpty!51407 () Bool)

(declare-fun mapDefault!51407 () ValueCell!15729)

(assert (=> mapNonEmpty!51401 (= condMapEmpty!51407 (= mapRest!51401 ((as const (Array (_ BitVec 32) ValueCell!15729)) mapDefault!51407)))))

(declare-fun e!728124 () Bool)

(declare-fun mapRes!51407 () Bool)

(assert (=> mapNonEmpty!51401 (= tp!98159 (and e!728124 mapRes!51407))))

(declare-fun b!1275459 () Bool)

(assert (=> b!1275459 (= e!728124 tp_is_empty!33255)))

(declare-fun mapIsEmpty!51407 () Bool)

(assert (=> mapIsEmpty!51407 mapRes!51407))

(declare-fun mapNonEmpty!51407 () Bool)

(declare-fun tp!98165 () Bool)

(assert (=> mapNonEmpty!51407 (= mapRes!51407 (and tp!98165 e!728125))))

(declare-fun mapRest!51407 () (Array (_ BitVec 32) ValueCell!15729))

(declare-fun mapValue!51407 () ValueCell!15729)

(declare-fun mapKey!51407 () (_ BitVec 32))

(assert (=> mapNonEmpty!51407 (= mapRest!51401 (store mapRest!51407 mapKey!51407 mapValue!51407))))

(assert (= (and mapNonEmpty!51401 condMapEmpty!51407) mapIsEmpty!51407))

(assert (= (and mapNonEmpty!51401 (not condMapEmpty!51407)) mapNonEmpty!51407))

(assert (= (and mapNonEmpty!51407 ((_ is ValueCellFull!15729) mapValue!51407)) b!1275458))

(assert (= (and mapNonEmpty!51401 ((_ is ValueCellFull!15729) mapDefault!51407)) b!1275459))

(declare-fun m!1171703 () Bool)

(assert (=> mapNonEmpty!51407 m!1171703))

(check-sat (not b!1275448) (not b!1275451) (not bm!62635) tp_is_empty!33255 (not mapNonEmpty!51407))
(check-sat)
