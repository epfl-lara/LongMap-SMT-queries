; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107146 () Bool)

(assert start!107146)

(declare-fun res!844610 () Bool)

(declare-fun e!723413 () Bool)

(assert (=> start!107146 (=> (not res!844610) (not e!723413))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107146 (= res!844610 (validMask!0 mask!1730))))

(assert (=> start!107146 e!723413))

(declare-datatypes ((V!48715 0))(
  ( (V!48716 (val!16395 Int)) )
))
(declare-datatypes ((ValueCell!15467 0))(
  ( (ValueCellFull!15467 (v!19026 V!48715)) (EmptyCell!15467) )
))
(declare-datatypes ((array!82597 0))(
  ( (array!82598 (arr!39834 (Array (_ BitVec 32) ValueCell!15467)) (size!40371 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82597)

(declare-fun e!723415 () Bool)

(declare-fun array_inv!30481 (array!82597) Bool)

(assert (=> start!107146 (and (array_inv!30481 _values!1134) e!723415)))

(assert (=> start!107146 true))

(declare-datatypes ((array!82599 0))(
  ( (array!82600 (arr!39835 (Array (_ BitVec 32) (_ BitVec 64))) (size!40372 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82599)

(declare-fun array_inv!30482 (array!82599) Bool)

(assert (=> start!107146 (array_inv!30482 _keys!1364)))

(declare-fun mapIsEmpty!50533 () Bool)

(declare-fun mapRes!50533 () Bool)

(assert (=> mapIsEmpty!50533 mapRes!50533))

(declare-fun b!1269456 () Bool)

(declare-fun e!723412 () Bool)

(declare-fun tp_is_empty!32641 () Bool)

(assert (=> b!1269456 (= e!723412 tp_is_empty!32641)))

(declare-fun b!1269457 () Bool)

(declare-fun e!723416 () Bool)

(assert (=> b!1269457 (= e!723415 (and e!723416 mapRes!50533))))

(declare-fun condMapEmpty!50533 () Bool)

(declare-fun mapDefault!50533 () ValueCell!15467)

(assert (=> b!1269457 (= condMapEmpty!50533 (= (arr!39834 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15467)) mapDefault!50533)))))

(declare-fun b!1269458 () Bool)

(declare-fun res!844611 () Bool)

(assert (=> b!1269458 (=> (not res!844611) (not e!723413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82599 (_ BitVec 32)) Bool)

(assert (=> b!1269458 (= res!844611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50533 () Bool)

(declare-fun tp!96712 () Bool)

(assert (=> mapNonEmpty!50533 (= mapRes!50533 (and tp!96712 e!723412))))

(declare-fun mapRest!50533 () (Array (_ BitVec 32) ValueCell!15467))

(declare-fun mapValue!50533 () ValueCell!15467)

(declare-fun mapKey!50533 () (_ BitVec 32))

(assert (=> mapNonEmpty!50533 (= (arr!39834 _values!1134) (store mapRest!50533 mapKey!50533 mapValue!50533))))

(declare-fun b!1269459 () Bool)

(assert (=> b!1269459 (= e!723413 (and (bvsle #b00000000000000000000000000000000 (size!40372 _keys!1364)) (bvsge (size!40372 _keys!1364) #b01111111111111111111111111111111)))))

(declare-fun b!1269460 () Bool)

(assert (=> b!1269460 (= e!723416 tp_is_empty!32641)))

(declare-fun b!1269461 () Bool)

(declare-fun res!844612 () Bool)

(assert (=> b!1269461 (=> (not res!844612) (not e!723413))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269461 (= res!844612 (and (= (size!40371 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40372 _keys!1364) (size!40371 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107146 res!844610) b!1269461))

(assert (= (and b!1269461 res!844612) b!1269458))

(assert (= (and b!1269458 res!844611) b!1269459))

(assert (= (and b!1269457 condMapEmpty!50533) mapIsEmpty!50533))

(assert (= (and b!1269457 (not condMapEmpty!50533)) mapNonEmpty!50533))

(get-info :version)

(assert (= (and mapNonEmpty!50533 ((_ is ValueCellFull!15467) mapValue!50533)) b!1269456))

(assert (= (and b!1269457 ((_ is ValueCellFull!15467) mapDefault!50533)) b!1269460))

(assert (= start!107146 b!1269457))

(declare-fun m!1168713 () Bool)

(assert (=> start!107146 m!1168713))

(declare-fun m!1168715 () Bool)

(assert (=> start!107146 m!1168715))

(declare-fun m!1168717 () Bool)

(assert (=> start!107146 m!1168717))

(declare-fun m!1168719 () Bool)

(assert (=> b!1269458 m!1168719))

(declare-fun m!1168721 () Bool)

(assert (=> mapNonEmpty!50533 m!1168721))

(check-sat (not b!1269458) (not start!107146) (not mapNonEmpty!50533) tp_is_empty!32641)
(check-sat)
(get-model)

(declare-fun b!1269506 () Bool)

(declare-fun e!723454 () Bool)

(declare-fun e!723453 () Bool)

(assert (=> b!1269506 (= e!723454 e!723453)))

(declare-fun lt!574883 () (_ BitVec 64))

(assert (=> b!1269506 (= lt!574883 (select (arr!39835 _keys!1364) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42203 0))(
  ( (Unit!42204) )
))
(declare-fun lt!574882 () Unit!42203)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!82599 (_ BitVec 64) (_ BitVec 32)) Unit!42203)

(assert (=> b!1269506 (= lt!574882 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1364 lt!574883 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!82599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1269506 (arrayContainsKey!0 _keys!1364 lt!574883 #b00000000000000000000000000000000)))

(declare-fun lt!574884 () Unit!42203)

(assert (=> b!1269506 (= lt!574884 lt!574882)))

(declare-fun res!844636 () Bool)

(declare-datatypes ((SeekEntryResult!9940 0))(
  ( (MissingZero!9940 (index!42131 (_ BitVec 32))) (Found!9940 (index!42132 (_ BitVec 32))) (Intermediate!9940 (undefined!10752 Bool) (index!42133 (_ BitVec 32)) (x!111823 (_ BitVec 32))) (Undefined!9940) (MissingVacant!9940 (index!42134 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!82599 (_ BitVec 32)) SeekEntryResult!9940)

(assert (=> b!1269506 (= res!844636 (= (seekEntryOrOpen!0 (select (arr!39835 _keys!1364) #b00000000000000000000000000000000) _keys!1364 mask!1730) (Found!9940 #b00000000000000000000000000000000)))))

(assert (=> b!1269506 (=> (not res!844636) (not e!723453))))

(declare-fun b!1269507 () Bool)

(declare-fun call!62574 () Bool)

(assert (=> b!1269507 (= e!723453 call!62574)))

(declare-fun b!1269508 () Bool)

(assert (=> b!1269508 (= e!723454 call!62574)))

(declare-fun d!140097 () Bool)

(declare-fun res!844635 () Bool)

(declare-fun e!723455 () Bool)

(assert (=> d!140097 (=> res!844635 e!723455)))

(assert (=> d!140097 (= res!844635 (bvsge #b00000000000000000000000000000000 (size!40372 _keys!1364)))))

(assert (=> d!140097 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730) e!723455)))

(declare-fun b!1269509 () Bool)

(assert (=> b!1269509 (= e!723455 e!723454)))

(declare-fun c!124026 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1269509 (= c!124026 (validKeyInArray!0 (select (arr!39835 _keys!1364) #b00000000000000000000000000000000)))))

(declare-fun bm!62571 () Bool)

(assert (=> bm!62571 (= call!62574 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1364 mask!1730))))

(assert (= (and d!140097 (not res!844635)) b!1269509))

(assert (= (and b!1269509 c!124026) b!1269506))

(assert (= (and b!1269509 (not c!124026)) b!1269508))

(assert (= (and b!1269506 res!844636) b!1269507))

(assert (= (or b!1269507 b!1269508) bm!62571))

(declare-fun m!1168743 () Bool)

(assert (=> b!1269506 m!1168743))

(declare-fun m!1168745 () Bool)

(assert (=> b!1269506 m!1168745))

(declare-fun m!1168747 () Bool)

(assert (=> b!1269506 m!1168747))

(assert (=> b!1269506 m!1168743))

(declare-fun m!1168749 () Bool)

(assert (=> b!1269506 m!1168749))

(assert (=> b!1269509 m!1168743))

(assert (=> b!1269509 m!1168743))

(declare-fun m!1168751 () Bool)

(assert (=> b!1269509 m!1168751))

(declare-fun m!1168753 () Bool)

(assert (=> bm!62571 m!1168753))

(assert (=> b!1269458 d!140097))

(declare-fun d!140099 () Bool)

(assert (=> d!140099 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107146 d!140099))

(declare-fun d!140101 () Bool)

(assert (=> d!140101 (= (array_inv!30481 _values!1134) (bvsge (size!40371 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107146 d!140101))

(declare-fun d!140103 () Bool)

(assert (=> d!140103 (= (array_inv!30482 _keys!1364) (bvsge (size!40372 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107146 d!140103))

(declare-fun b!1269516 () Bool)

(declare-fun e!723460 () Bool)

(assert (=> b!1269516 (= e!723460 tp_is_empty!32641)))

(declare-fun mapIsEmpty!50542 () Bool)

(declare-fun mapRes!50542 () Bool)

(assert (=> mapIsEmpty!50542 mapRes!50542))

(declare-fun b!1269517 () Bool)

(declare-fun e!723461 () Bool)

(assert (=> b!1269517 (= e!723461 tp_is_empty!32641)))

(declare-fun condMapEmpty!50542 () Bool)

(declare-fun mapDefault!50542 () ValueCell!15467)

(assert (=> mapNonEmpty!50533 (= condMapEmpty!50542 (= mapRest!50533 ((as const (Array (_ BitVec 32) ValueCell!15467)) mapDefault!50542)))))

(assert (=> mapNonEmpty!50533 (= tp!96712 (and e!723461 mapRes!50542))))

(declare-fun mapNonEmpty!50542 () Bool)

(declare-fun tp!96721 () Bool)

(assert (=> mapNonEmpty!50542 (= mapRes!50542 (and tp!96721 e!723460))))

(declare-fun mapKey!50542 () (_ BitVec 32))

(declare-fun mapRest!50542 () (Array (_ BitVec 32) ValueCell!15467))

(declare-fun mapValue!50542 () ValueCell!15467)

(assert (=> mapNonEmpty!50542 (= mapRest!50533 (store mapRest!50542 mapKey!50542 mapValue!50542))))

(assert (= (and mapNonEmpty!50533 condMapEmpty!50542) mapIsEmpty!50542))

(assert (= (and mapNonEmpty!50533 (not condMapEmpty!50542)) mapNonEmpty!50542))

(assert (= (and mapNonEmpty!50542 ((_ is ValueCellFull!15467) mapValue!50542)) b!1269516))

(assert (= (and mapNonEmpty!50533 ((_ is ValueCellFull!15467) mapDefault!50542)) b!1269517))

(declare-fun m!1168755 () Bool)

(assert (=> mapNonEmpty!50542 m!1168755))

(check-sat (not mapNonEmpty!50542) (not bm!62571) tp_is_empty!32641 (not b!1269506) (not b!1269509))
(check-sat)
