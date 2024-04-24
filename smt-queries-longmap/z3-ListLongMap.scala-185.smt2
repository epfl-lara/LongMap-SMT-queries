; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3688 () Bool)

(assert start!3688)

(declare-fun b!25756 () Bool)

(declare-fun res!15337 () Bool)

(declare-fun e!16684 () Bool)

(assert (=> b!25756 (=> (not res!15337) (not e!16684))))

(declare-datatypes ((array!1329 0))(
  ( (array!1330 (arr!626 (Array (_ BitVec 32) (_ BitVec 64))) (size!727 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1329)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1329 (_ BitVec 32)) Bool)

(assert (=> b!25756 (= res!15337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1081 () Bool)

(declare-fun mapRes!1081 () Bool)

(declare-fun tp!3601 () Bool)

(declare-fun e!16688 () Bool)

(assert (=> mapNonEmpty!1081 (= mapRes!1081 (and tp!3601 e!16688))))

(declare-datatypes ((V!1227 0))(
  ( (V!1228 (val!552 Int)) )
))
(declare-datatypes ((ValueCell!326 0))(
  ( (ValueCellFull!326 (v!1637 V!1227)) (EmptyCell!326) )
))
(declare-fun mapRest!1081 () (Array (_ BitVec 32) ValueCell!326))

(declare-datatypes ((array!1331 0))(
  ( (array!1332 (arr!627 (Array (_ BitVec 32) ValueCell!326)) (size!728 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1331)

(declare-fun mapValue!1081 () ValueCell!326)

(declare-fun mapKey!1081 () (_ BitVec 32))

(assert (=> mapNonEmpty!1081 (= (arr!627 _values!1501) (store mapRest!1081 mapKey!1081 mapValue!1081))))

(declare-fun b!25757 () Bool)

(assert (=> b!25757 (= e!16684 (bvsgt #b00000000000000000000000000000000 (size!727 _keys!1833)))))

(declare-fun res!15339 () Bool)

(assert (=> start!3688 (=> (not res!15339) (not e!16684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3688 (= res!15339 (validMask!0 mask!2294))))

(assert (=> start!3688 e!16684))

(assert (=> start!3688 true))

(declare-fun e!16687 () Bool)

(declare-fun array_inv!439 (array!1331) Bool)

(assert (=> start!3688 (and (array_inv!439 _values!1501) e!16687)))

(declare-fun array_inv!440 (array!1329) Bool)

(assert (=> start!3688 (array_inv!440 _keys!1833)))

(declare-fun mapIsEmpty!1081 () Bool)

(assert (=> mapIsEmpty!1081 mapRes!1081))

(declare-fun b!25758 () Bool)

(declare-fun e!16686 () Bool)

(assert (=> b!25758 (= e!16687 (and e!16686 mapRes!1081))))

(declare-fun condMapEmpty!1081 () Bool)

(declare-fun mapDefault!1081 () ValueCell!326)

(assert (=> b!25758 (= condMapEmpty!1081 (= (arr!627 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!326)) mapDefault!1081)))))

(declare-fun b!25759 () Bool)

(declare-fun tp_is_empty!1051 () Bool)

(assert (=> b!25759 (= e!16686 tp_is_empty!1051)))

(declare-fun b!25760 () Bool)

(declare-fun res!15338 () Bool)

(assert (=> b!25760 (=> (not res!15338) (not e!16684))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!25760 (= res!15338 (and (= (size!728 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!727 _keys!1833) (size!728 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25761 () Bool)

(assert (=> b!25761 (= e!16688 tp_is_empty!1051)))

(assert (= (and start!3688 res!15339) b!25760))

(assert (= (and b!25760 res!15338) b!25756))

(assert (= (and b!25756 res!15337) b!25757))

(assert (= (and b!25758 condMapEmpty!1081) mapIsEmpty!1081))

(assert (= (and b!25758 (not condMapEmpty!1081)) mapNonEmpty!1081))

(get-info :version)

(assert (= (and mapNonEmpty!1081 ((_ is ValueCellFull!326) mapValue!1081)) b!25761))

(assert (= (and b!25758 ((_ is ValueCellFull!326) mapDefault!1081)) b!25759))

(assert (= start!3688 b!25758))

(declare-fun m!20671 () Bool)

(assert (=> b!25756 m!20671))

(declare-fun m!20673 () Bool)

(assert (=> mapNonEmpty!1081 m!20673))

(declare-fun m!20675 () Bool)

(assert (=> start!3688 m!20675))

(declare-fun m!20677 () Bool)

(assert (=> start!3688 m!20677))

(declare-fun m!20679 () Bool)

(assert (=> start!3688 m!20679))

(check-sat (not b!25756) (not start!3688) (not mapNonEmpty!1081) tp_is_empty!1051)
(check-sat)
(get-model)

(declare-fun b!25806 () Bool)

(declare-fun e!16727 () Bool)

(declare-fun e!16725 () Bool)

(assert (=> b!25806 (= e!16727 e!16725)))

(declare-fun c!3625 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!25806 (= c!3625 (validKeyInArray!0 (select (arr!626 _keys!1833) #b00000000000000000000000000000000)))))

(declare-fun b!25807 () Bool)

(declare-fun e!16726 () Bool)

(declare-fun call!2478 () Bool)

(assert (=> b!25807 (= e!16726 call!2478)))

(declare-fun d!4795 () Bool)

(declare-fun res!15363 () Bool)

(assert (=> d!4795 (=> res!15363 e!16727)))

(assert (=> d!4795 (= res!15363 (bvsge #b00000000000000000000000000000000 (size!727 _keys!1833)))))

(assert (=> d!4795 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294) e!16727)))

(declare-fun b!25808 () Bool)

(assert (=> b!25808 (= e!16725 call!2478)))

(declare-fun bm!2475 () Bool)

(assert (=> bm!2475 (= call!2478 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1833 mask!2294))))

(declare-fun b!25809 () Bool)

(assert (=> b!25809 (= e!16725 e!16726)))

(declare-fun lt!10243 () (_ BitVec 64))

(assert (=> b!25809 (= lt!10243 (select (arr!626 _keys!1833) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!625 0))(
  ( (Unit!626) )
))
(declare-fun lt!10244 () Unit!625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!1329 (_ BitVec 64) (_ BitVec 32)) Unit!625)

(assert (=> b!25809 (= lt!10244 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1833 lt!10243 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!1329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!25809 (arrayContainsKey!0 _keys!1833 lt!10243 #b00000000000000000000000000000000)))

(declare-fun lt!10242 () Unit!625)

(assert (=> b!25809 (= lt!10242 lt!10244)))

(declare-fun res!15362 () Bool)

(declare-datatypes ((SeekEntryResult!57 0))(
  ( (MissingZero!57 (index!2350 (_ BitVec 32))) (Found!57 (index!2351 (_ BitVec 32))) (Intermediate!57 (undefined!869 Bool) (index!2352 (_ BitVec 32)) (x!6041 (_ BitVec 32))) (Undefined!57) (MissingVacant!57 (index!2353 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!1329 (_ BitVec 32)) SeekEntryResult!57)

(assert (=> b!25809 (= res!15362 (= (seekEntryOrOpen!0 (select (arr!626 _keys!1833) #b00000000000000000000000000000000) _keys!1833 mask!2294) (Found!57 #b00000000000000000000000000000000)))))

(assert (=> b!25809 (=> (not res!15362) (not e!16726))))

(assert (= (and d!4795 (not res!15363)) b!25806))

(assert (= (and b!25806 c!3625) b!25809))

(assert (= (and b!25806 (not c!3625)) b!25808))

(assert (= (and b!25809 res!15362) b!25807))

(assert (= (or b!25807 b!25808) bm!2475))

(declare-fun m!20701 () Bool)

(assert (=> b!25806 m!20701))

(assert (=> b!25806 m!20701))

(declare-fun m!20703 () Bool)

(assert (=> b!25806 m!20703))

(declare-fun m!20705 () Bool)

(assert (=> bm!2475 m!20705))

(assert (=> b!25809 m!20701))

(declare-fun m!20707 () Bool)

(assert (=> b!25809 m!20707))

(declare-fun m!20709 () Bool)

(assert (=> b!25809 m!20709))

(assert (=> b!25809 m!20701))

(declare-fun m!20711 () Bool)

(assert (=> b!25809 m!20711))

(assert (=> b!25756 d!4795))

(declare-fun d!4797 () Bool)

(assert (=> d!4797 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3688 d!4797))

(declare-fun d!4799 () Bool)

(assert (=> d!4799 (= (array_inv!439 _values!1501) (bvsge (size!728 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3688 d!4799))

(declare-fun d!4801 () Bool)

(assert (=> d!4801 (= (array_inv!440 _keys!1833) (bvsge (size!727 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3688 d!4801))

(declare-fun mapNonEmpty!1090 () Bool)

(declare-fun mapRes!1090 () Bool)

(declare-fun tp!3610 () Bool)

(declare-fun e!16732 () Bool)

(assert (=> mapNonEmpty!1090 (= mapRes!1090 (and tp!3610 e!16732))))

(declare-fun mapKey!1090 () (_ BitVec 32))

(declare-fun mapValue!1090 () ValueCell!326)

(declare-fun mapRest!1090 () (Array (_ BitVec 32) ValueCell!326))

(assert (=> mapNonEmpty!1090 (= mapRest!1081 (store mapRest!1090 mapKey!1090 mapValue!1090))))

(declare-fun b!25816 () Bool)

(assert (=> b!25816 (= e!16732 tp_is_empty!1051)))

(declare-fun b!25817 () Bool)

(declare-fun e!16733 () Bool)

(assert (=> b!25817 (= e!16733 tp_is_empty!1051)))

(declare-fun condMapEmpty!1090 () Bool)

(declare-fun mapDefault!1090 () ValueCell!326)

(assert (=> mapNonEmpty!1081 (= condMapEmpty!1090 (= mapRest!1081 ((as const (Array (_ BitVec 32) ValueCell!326)) mapDefault!1090)))))

(assert (=> mapNonEmpty!1081 (= tp!3601 (and e!16733 mapRes!1090))))

(declare-fun mapIsEmpty!1090 () Bool)

(assert (=> mapIsEmpty!1090 mapRes!1090))

(assert (= (and mapNonEmpty!1081 condMapEmpty!1090) mapIsEmpty!1090))

(assert (= (and mapNonEmpty!1081 (not condMapEmpty!1090)) mapNonEmpty!1090))

(assert (= (and mapNonEmpty!1090 ((_ is ValueCellFull!326) mapValue!1090)) b!25816))

(assert (= (and mapNonEmpty!1081 ((_ is ValueCellFull!326) mapDefault!1090)) b!25817))

(declare-fun m!20713 () Bool)

(assert (=> mapNonEmpty!1090 m!20713))

(check-sat (not b!25806) (not b!25809) (not mapNonEmpty!1090) (not bm!2475) tp_is_empty!1051)
(check-sat)
