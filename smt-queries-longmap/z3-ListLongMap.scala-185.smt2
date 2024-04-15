; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3682 () Bool)

(assert start!3682)

(declare-fun b!25775 () Bool)

(declare-fun res!15346 () Bool)

(declare-fun e!16696 () Bool)

(assert (=> b!25775 (=> (not res!15346) (not e!16696))))

(declare-datatypes ((array!1325 0))(
  ( (array!1326 (arr!624 (Array (_ BitVec 32) (_ BitVec 64))) (size!725 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1325)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1325 (_ BitVec 32)) Bool)

(assert (=> b!25775 (= res!15346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1081 () Bool)

(declare-fun mapRes!1081 () Bool)

(declare-fun tp!3601 () Bool)

(declare-fun e!16694 () Bool)

(assert (=> mapNonEmpty!1081 (= mapRes!1081 (and tp!3601 e!16694))))

(declare-datatypes ((V!1227 0))(
  ( (V!1228 (val!552 Int)) )
))
(declare-datatypes ((ValueCell!326 0))(
  ( (ValueCellFull!326 (v!1636 V!1227)) (EmptyCell!326) )
))
(declare-fun mapRest!1081 () (Array (_ BitVec 32) ValueCell!326))

(declare-datatypes ((array!1327 0))(
  ( (array!1328 (arr!625 (Array (_ BitVec 32) ValueCell!326)) (size!726 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1327)

(declare-fun mapKey!1081 () (_ BitVec 32))

(declare-fun mapValue!1081 () ValueCell!326)

(assert (=> mapNonEmpty!1081 (= (arr!625 _values!1501) (store mapRest!1081 mapKey!1081 mapValue!1081))))

(declare-fun mapIsEmpty!1081 () Bool)

(assert (=> mapIsEmpty!1081 mapRes!1081))

(declare-fun b!25776 () Bool)

(declare-fun e!16695 () Bool)

(declare-fun e!16697 () Bool)

(assert (=> b!25776 (= e!16695 (and e!16697 mapRes!1081))))

(declare-fun condMapEmpty!1081 () Bool)

(declare-fun mapDefault!1081 () ValueCell!326)

(assert (=> b!25776 (= condMapEmpty!1081 (= (arr!625 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!326)) mapDefault!1081)))))

(declare-fun b!25777 () Bool)

(assert (=> b!25777 (= e!16696 (bvsgt #b00000000000000000000000000000000 (size!725 _keys!1833)))))

(declare-fun b!25774 () Bool)

(declare-fun tp_is_empty!1051 () Bool)

(assert (=> b!25774 (= e!16697 tp_is_empty!1051)))

(declare-fun res!15345 () Bool)

(assert (=> start!3682 (=> (not res!15345) (not e!16696))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3682 (= res!15345 (validMask!0 mask!2294))))

(assert (=> start!3682 e!16696))

(assert (=> start!3682 true))

(declare-fun array_inv!439 (array!1327) Bool)

(assert (=> start!3682 (and (array_inv!439 _values!1501) e!16695)))

(declare-fun array_inv!440 (array!1325) Bool)

(assert (=> start!3682 (array_inv!440 _keys!1833)))

(declare-fun b!25778 () Bool)

(declare-fun res!15347 () Bool)

(assert (=> b!25778 (=> (not res!15347) (not e!16696))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25778 (= res!15347 (and (= (size!726 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!725 _keys!1833) (size!726 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25779 () Bool)

(assert (=> b!25779 (= e!16694 tp_is_empty!1051)))

(assert (= (and start!3682 res!15345) b!25778))

(assert (= (and b!25778 res!15347) b!25775))

(assert (= (and b!25775 res!15346) b!25777))

(assert (= (and b!25776 condMapEmpty!1081) mapIsEmpty!1081))

(assert (= (and b!25776 (not condMapEmpty!1081)) mapNonEmpty!1081))

(get-info :version)

(assert (= (and mapNonEmpty!1081 ((_ is ValueCellFull!326) mapValue!1081)) b!25779))

(assert (= (and b!25776 ((_ is ValueCellFull!326) mapDefault!1081)) b!25774))

(assert (= start!3682 b!25776))

(declare-fun m!20753 () Bool)

(assert (=> b!25775 m!20753))

(declare-fun m!20755 () Bool)

(assert (=> mapNonEmpty!1081 m!20755))

(declare-fun m!20757 () Bool)

(assert (=> start!3682 m!20757))

(declare-fun m!20759 () Bool)

(assert (=> start!3682 m!20759))

(declare-fun m!20761 () Bool)

(assert (=> start!3682 m!20761))

(check-sat (not start!3682) (not b!25775) (not mapNonEmpty!1081) tp_is_empty!1051)
(check-sat)
(get-model)

(declare-fun d!4793 () Bool)

(assert (=> d!4793 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3682 d!4793))

(declare-fun d!4795 () Bool)

(assert (=> d!4795 (= (array_inv!439 _values!1501) (bvsge (size!726 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3682 d!4795))

(declare-fun d!4797 () Bool)

(assert (=> d!4797 (= (array_inv!440 _keys!1833) (bvsge (size!725 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3682 d!4797))

(declare-fun b!25824 () Bool)

(declare-fun e!16735 () Bool)

(declare-fun e!16734 () Bool)

(assert (=> b!25824 (= e!16735 e!16734)))

(declare-fun lt!10283 () (_ BitVec 64))

(assert (=> b!25824 (= lt!10283 (select (arr!624 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!624 0))(
  ( (Unit!625) )
))
(declare-fun lt!10284 () Unit!624)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1325 (_ BitVec 64) (_ BitVec 32)) Unit!624)

(assert (=> b!25824 (= lt!10284 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10283 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25824 (arrayContainsKey!0 _keys!1833 lt!10283 #b00000000000000000000000000000000)))

(declare-fun lt!10282 () Unit!624)

(assert (=> b!25824 (= lt!10282 lt!10284)))

(declare-fun res!15370 () Bool)

(declare-datatypes ((SeekEntryResult!58 0))(
  ( (MissingZero!58 (index!2354 (_ BitVec 32))) (Found!58 (index!2355 (_ BitVec 32))) (Intermediate!58 (undefined!870 Bool) (index!2356 (_ BitVec 32)) (x!6042 (_ BitVec 32))) (Undefined!58) (MissingVacant!58 (index!2357 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1325 (_ BitVec 32)) SeekEntryResult!58)

(assert (=> b!25824 (= res!15370 (= (seekEntryOrOpen!0 (select (arr!624 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!58 #b00000000000000000000000000000000)))))

(assert (=> b!25824 (=> (not res!15370) (not e!16734))))

(declare-fun b!25825 () Bool)

(declare-fun call!2492 () Bool)

(assert (=> b!25825 (= e!16735 call!2492)))

(declare-fun d!4799 () Bool)

(declare-fun res!15371 () Bool)

(declare-fun e!16736 () Bool)

(assert (=> d!4799 (=> res!15371 e!16736)))

(assert (=> d!4799 (= res!15371 (bvsge #b00000000000000000000000000000000 (size!725 _keys!1833)))))

(assert (=> d!4799 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16736)))

(declare-fun bm!2489 () Bool)

(assert (=> bm!2489 (= call!2492 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!25826 () Bool)

(assert (=> b!25826 (= e!16734 call!2492)))

(declare-fun b!25827 () Bool)

(assert (=> b!25827 (= e!16736 e!16735)))

(declare-fun c!3630 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25827 (= c!3630 (validKeyInArray!0 (select (arr!624 _keys!1833) #b00000000000000000000000000000000)))))

(assert (= (and d!4799 (not res!15371)) b!25827))

(assert (= (and b!25827 c!3630) b!25824))

(assert (= (and b!25827 (not c!3630)) b!25825))

(assert (= (and b!25824 res!15370) b!25826))

(assert (= (or b!25826 b!25825) bm!2489))

(declare-fun m!20783 () Bool)

(assert (=> b!25824 m!20783))

(declare-fun m!20785 () Bool)

(assert (=> b!25824 m!20785))

(declare-fun m!20787 () Bool)

(assert (=> b!25824 m!20787))

(assert (=> b!25824 m!20783))

(declare-fun m!20789 () Bool)

(assert (=> b!25824 m!20789))

(declare-fun m!20791 () Bool)

(assert (=> bm!2489 m!20791))

(assert (=> b!25827 m!20783))

(assert (=> b!25827 m!20783))

(declare-fun m!20793 () Bool)

(assert (=> b!25827 m!20793))

(assert (=> b!25775 d!4799))

(declare-fun mapIsEmpty!1090 () Bool)

(declare-fun mapRes!1090 () Bool)

(assert (=> mapIsEmpty!1090 mapRes!1090))

(declare-fun condMapEmpty!1090 () Bool)

(declare-fun mapDefault!1090 () ValueCell!326)

(assert (=> mapNonEmpty!1081 (= condMapEmpty!1090 (= mapRest!1081 ((as const (Array (_ BitVec 32) ValueCell!326)) mapDefault!1090)))))

(declare-fun e!16742 () Bool)

(assert (=> mapNonEmpty!1081 (= tp!3601 (and e!16742 mapRes!1090))))

(declare-fun b!25834 () Bool)

(declare-fun e!16741 () Bool)

(assert (=> b!25834 (= e!16741 tp_is_empty!1051)))

(declare-fun b!25835 () Bool)

(assert (=> b!25835 (= e!16742 tp_is_empty!1051)))

(declare-fun mapNonEmpty!1090 () Bool)

(declare-fun tp!3610 () Bool)

(assert (=> mapNonEmpty!1090 (= mapRes!1090 (and tp!3610 e!16741))))

(declare-fun mapKey!1090 () (_ BitVec 32))

(declare-fun mapValue!1090 () ValueCell!326)

(declare-fun mapRest!1090 () (Array (_ BitVec 32) ValueCell!326))

(assert (=> mapNonEmpty!1090 (= mapRest!1081 (store mapRest!1090 mapKey!1090 mapValue!1090))))

(assert (= (and mapNonEmpty!1081 condMapEmpty!1090) mapIsEmpty!1090))

(assert (= (and mapNonEmpty!1081 (not condMapEmpty!1090)) mapNonEmpty!1090))

(assert (= (and mapNonEmpty!1090 ((_ is ValueCellFull!326) mapValue!1090)) b!25834))

(assert (= (and mapNonEmpty!1081 ((_ is ValueCellFull!326) mapDefault!1090)) b!25835))

(declare-fun m!20795 () Bool)

(assert (=> mapNonEmpty!1090 m!20795))

(check-sat (not mapNonEmpty!1090) (not b!25824) (not bm!2489) tp_is_empty!1051 (not b!25827))
(check-sat)
