; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3702 () Bool)

(assert start!3702)

(declare-fun mapNonEmpty!1093 () Bool)

(declare-fun mapRes!1093 () Bool)

(declare-fun tp!3613 () Bool)

(declare-fun e!16744 () Bool)

(assert (=> mapNonEmpty!1093 (= mapRes!1093 (and tp!3613 e!16744))))

(declare-datatypes ((V!1235 0))(
  ( (V!1236 (val!555 Int)) )
))
(declare-datatypes ((ValueCell!329 0))(
  ( (ValueCellFull!329 (v!1640 V!1235)) (EmptyCell!329) )
))
(declare-datatypes ((array!1343 0))(
  ( (array!1344 (arr!632 (Array (_ BitVec 32) ValueCell!329)) (size!733 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1343)

(declare-fun mapKey!1093 () (_ BitVec 32))

(declare-fun mapRest!1093 () (Array (_ BitVec 32) ValueCell!329))

(declare-fun mapValue!1093 () ValueCell!329)

(assert (=> mapNonEmpty!1093 (= (arr!632 _values!1501) (store mapRest!1093 mapKey!1093 mapValue!1093))))

(declare-fun mapIsEmpty!1093 () Bool)

(assert (=> mapIsEmpty!1093 mapRes!1093))

(declare-fun b!25830 () Bool)

(declare-fun e!16747 () Bool)

(declare-datatypes ((array!1345 0))(
  ( (array!1346 (arr!633 (Array (_ BitVec 32) (_ BitVec 64))) (size!734 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1345)

(assert (=> b!25830 (= e!16747 (and (bvsle #b00000000000000000000000000000000 (size!734 _keys!1833)) (bvsge (size!734 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun b!25831 () Bool)

(declare-fun e!16745 () Bool)

(declare-fun tp_is_empty!1057 () Bool)

(assert (=> b!25831 (= e!16745 tp_is_empty!1057)))

(declare-fun b!25832 () Bool)

(declare-fun res!15372 () Bool)

(assert (=> b!25832 (=> (not res!15372) (not e!16747))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1345 (_ BitVec 32)) Bool)

(assert (=> b!25832 (= res!15372 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!25833 () Bool)

(declare-fun e!16746 () Bool)

(assert (=> b!25833 (= e!16746 (and e!16745 mapRes!1093))))

(declare-fun condMapEmpty!1093 () Bool)

(declare-fun mapDefault!1093 () ValueCell!329)

(assert (=> b!25833 (= condMapEmpty!1093 (= (arr!632 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!329)) mapDefault!1093)))))

(declare-fun res!15371 () Bool)

(assert (=> start!3702 (=> (not res!15371) (not e!16747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3702 (= res!15371 (validMask!0 mask!2294))))

(assert (=> start!3702 e!16747))

(assert (=> start!3702 true))

(declare-fun array_inv!445 (array!1343) Bool)

(assert (=> start!3702 (and (array_inv!445 _values!1501) e!16746)))

(declare-fun array_inv!446 (array!1345) Bool)

(assert (=> start!3702 (array_inv!446 _keys!1833)))

(declare-fun b!25834 () Bool)

(assert (=> b!25834 (= e!16744 tp_is_empty!1057)))

(declare-fun b!25835 () Bool)

(declare-fun res!15370 () Bool)

(assert (=> b!25835 (=> (not res!15370) (not e!16747))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25835 (= res!15370 (and (= (size!733 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!734 _keys!1833) (size!733 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3702 res!15371) b!25835))

(assert (= (and b!25835 res!15370) b!25832))

(assert (= (and b!25832 res!15372) b!25830))

(assert (= (and b!25833 condMapEmpty!1093) mapIsEmpty!1093))

(assert (= (and b!25833 (not condMapEmpty!1093)) mapNonEmpty!1093))

(get-info :version)

(assert (= (and mapNonEmpty!1093 ((_ is ValueCellFull!329) mapValue!1093)) b!25834))

(assert (= (and b!25833 ((_ is ValueCellFull!329) mapDefault!1093)) b!25831))

(assert (= start!3702 b!25833))

(declare-fun m!20715 () Bool)

(assert (=> mapNonEmpty!1093 m!20715))

(declare-fun m!20717 () Bool)

(assert (=> b!25832 m!20717))

(declare-fun m!20719 () Bool)

(assert (=> start!3702 m!20719))

(declare-fun m!20721 () Bool)

(assert (=> start!3702 m!20721))

(declare-fun m!20723 () Bool)

(assert (=> start!3702 m!20723))

(check-sat (not start!3702) (not b!25832) (not mapNonEmpty!1093) tp_is_empty!1057)
(check-sat)
(get-model)

(declare-fun d!4805 () Bool)

(assert (=> d!4805 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3702 d!4805))

(declare-fun d!4807 () Bool)

(assert (=> d!4807 (= (array_inv!445 _values!1501) (bvsge (size!733 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3702 d!4807))

(declare-fun d!4809 () Bool)

(assert (=> d!4809 (= (array_inv!446 _keys!1833) (bvsge (size!734 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3702 d!4809))

(declare-fun b!25880 () Bool)

(declare-fun e!16785 () Bool)

(declare-fun call!2481 () Bool)

(assert (=> b!25880 (= e!16785 call!2481)))

(declare-fun d!4811 () Bool)

(declare-fun res!15396 () Bool)

(declare-fun e!16787 () Bool)

(assert (=> d!4811 (=> res!15396 e!16787)))

(assert (=> d!4811 (= res!15396 (bvsge #b00000000000000000000000000000000 (size!734 _keys!1833)))))

(assert (=> d!4811 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16787)))

(declare-fun bm!2478 () Bool)

(assert (=> bm!2478 (= call!2481 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!25881 () Bool)

(assert (=> b!25881 (= e!16787 e!16785)))

(declare-fun c!3628 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25881 (= c!3628 (validKeyInArray!0 (select (arr!633 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!25882 () Bool)

(declare-fun e!16786 () Bool)

(assert (=> b!25882 (= e!16786 call!2481)))

(declare-fun b!25883 () Bool)

(assert (=> b!25883 (= e!16785 e!16786)))

(declare-fun lt!10253 () (_ BitVec 64))

(assert (=> b!25883 (= lt!10253 (select (arr!633 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!627 0))(
  ( (Unit!628) )
))
(declare-fun lt!10252 () Unit!627)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1345 (_ BitVec 64) (_ BitVec 32)) Unit!627)

(assert (=> b!25883 (= lt!10252 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10253 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25883 (arrayContainsKey!0 _keys!1833 lt!10253 #b00000000000000000000000000000000)))

(declare-fun lt!10251 () Unit!627)

(assert (=> b!25883 (= lt!10251 lt!10252)))

(declare-fun res!15395 () Bool)

(declare-datatypes ((SeekEntryResult!58 0))(
  ( (MissingZero!58 (index!2354 (_ BitVec 32))) (Found!58 (index!2355 (_ BitVec 32))) (Intermediate!58 (undefined!870 Bool) (index!2356 (_ BitVec 32)) (x!6052 (_ BitVec 32))) (Undefined!58) (MissingVacant!58 (index!2357 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1345 (_ BitVec 32)) SeekEntryResult!58)

(assert (=> b!25883 (= res!15395 (= (seekEntryOrOpen!0 (select (arr!633 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!58 #b00000000000000000000000000000000)))))

(assert (=> b!25883 (=> (not res!15395) (not e!16786))))

(assert (= (and d!4811 (not res!15396)) b!25881))

(assert (= (and b!25881 c!3628) b!25883))

(assert (= (and b!25881 (not c!3628)) b!25880))

(assert (= (and b!25883 res!15395) b!25882))

(assert (= (or b!25882 b!25880) bm!2478))

(declare-fun m!20745 () Bool)

(assert (=> bm!2478 m!20745))

(declare-fun m!20747 () Bool)

(assert (=> b!25881 m!20747))

(assert (=> b!25881 m!20747))

(declare-fun m!20749 () Bool)

(assert (=> b!25881 m!20749))

(assert (=> b!25883 m!20747))

(declare-fun m!20751 () Bool)

(assert (=> b!25883 m!20751))

(declare-fun m!20753 () Bool)

(assert (=> b!25883 m!20753))

(assert (=> b!25883 m!20747))

(declare-fun m!20755 () Bool)

(assert (=> b!25883 m!20755))

(assert (=> b!25832 d!4811))

(declare-fun mapNonEmpty!1102 () Bool)

(declare-fun mapRes!1102 () Bool)

(declare-fun tp!3622 () Bool)

(declare-fun e!16792 () Bool)

(assert (=> mapNonEmpty!1102 (= mapRes!1102 (and tp!3622 e!16792))))

(declare-fun mapRest!1102 () (Array (_ BitVec 32) ValueCell!329))

(declare-fun mapValue!1102 () ValueCell!329)

(declare-fun mapKey!1102 () (_ BitVec 32))

(assert (=> mapNonEmpty!1102 (= mapRest!1093 (store mapRest!1102 mapKey!1102 mapValue!1102))))

(declare-fun b!25890 () Bool)

(assert (=> b!25890 (= e!16792 tp_is_empty!1057)))

(declare-fun mapIsEmpty!1102 () Bool)

(assert (=> mapIsEmpty!1102 mapRes!1102))

(declare-fun condMapEmpty!1102 () Bool)

(declare-fun mapDefault!1102 () ValueCell!329)

(assert (=> mapNonEmpty!1093 (= condMapEmpty!1102 (= mapRest!1093 ((as const (Array (_ BitVec 32) ValueCell!329)) mapDefault!1102)))))

(declare-fun e!16793 () Bool)

(assert (=> mapNonEmpty!1093 (= tp!3613 (and e!16793 mapRes!1102))))

(declare-fun b!25891 () Bool)

(assert (=> b!25891 (= e!16793 tp_is_empty!1057)))

(assert (= (and mapNonEmpty!1093 condMapEmpty!1102) mapIsEmpty!1102))

(assert (= (and mapNonEmpty!1093 (not condMapEmpty!1102)) mapNonEmpty!1102))

(assert (= (and mapNonEmpty!1102 ((_ is ValueCellFull!329) mapValue!1102)) b!25890))

(assert (= (and mapNonEmpty!1093 ((_ is ValueCellFull!329) mapDefault!1102)) b!25891))

(declare-fun m!20757 () Bool)

(assert (=> mapNonEmpty!1102 m!20757))

(check-sat tp_is_empty!1057 (not b!25883) (not bm!2478) (not b!25881) (not mapNonEmpty!1102))
(check-sat)
