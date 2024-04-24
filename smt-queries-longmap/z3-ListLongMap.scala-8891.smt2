; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108188 () Bool)

(assert start!108188)

(declare-fun b!1276779 () Bool)

(declare-fun e!728983 () Bool)

(declare-fun tp_is_empty!33259 () Bool)

(assert (=> b!1276779 (= e!728983 tp_is_empty!33259)))

(declare-fun res!848285 () Bool)

(declare-fun e!728984 () Bool)

(assert (=> start!108188 (=> (not res!848285) (not e!728984))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108188 (= res!848285 (validMask!0 mask!1805))))

(assert (=> start!108188 e!728984))

(assert (=> start!108188 true))

(declare-datatypes ((V!49449 0))(
  ( (V!49450 (val!16704 Int)) )
))
(declare-datatypes ((ValueCell!15731 0))(
  ( (ValueCellFull!15731 (v!19295 V!49449)) (EmptyCell!15731) )
))
(declare-datatypes ((array!83645 0))(
  ( (array!83646 (arr!40332 (Array (_ BitVec 32) ValueCell!15731)) (size!40883 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83645)

(declare-fun e!728987 () Bool)

(declare-fun array_inv!30841 (array!83645) Bool)

(assert (=> start!108188 (and (array_inv!30841 _values!1187) e!728987)))

(declare-datatypes ((array!83647 0))(
  ( (array!83648 (arr!40333 (Array (_ BitVec 32) (_ BitVec 64))) (size!40884 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83647)

(declare-fun array_inv!30842 (array!83647) Bool)

(assert (=> start!108188 (array_inv!30842 _keys!1427)))

(declare-fun mapNonEmpty!51410 () Bool)

(declare-fun mapRes!51410 () Bool)

(declare-fun tp!98168 () Bool)

(assert (=> mapNonEmpty!51410 (= mapRes!51410 (and tp!98168 e!728983))))

(declare-fun mapValue!51410 () ValueCell!15731)

(declare-fun mapKey!51410 () (_ BitVec 32))

(declare-fun mapRest!51410 () (Array (_ BitVec 32) ValueCell!15731))

(assert (=> mapNonEmpty!51410 (= (arr!40332 _values!1187) (store mapRest!51410 mapKey!51410 mapValue!51410))))

(declare-fun b!1276780 () Bool)

(declare-fun e!728986 () Bool)

(assert (=> b!1276780 (= e!728987 (and e!728986 mapRes!51410))))

(declare-fun condMapEmpty!51410 () Bool)

(declare-fun mapDefault!51410 () ValueCell!15731)

(assert (=> b!1276780 (= condMapEmpty!51410 (= (arr!40332 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15731)) mapDefault!51410)))))

(declare-fun b!1276781 () Bool)

(declare-fun res!848284 () Bool)

(assert (=> b!1276781 (=> (not res!848284) (not e!728984))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1276781 (= res!848284 (and (= (size!40883 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40884 _keys!1427) (size!40883 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276782 () Bool)

(declare-fun res!848282 () Bool)

(assert (=> b!1276782 (=> (not res!848282) (not e!728984))))

(assert (=> b!1276782 (= res!848282 (and (bvsle #b00000000000000000000000000000000 (size!40884 _keys!1427)) (bvslt (size!40884 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun b!1276783 () Bool)

(assert (=> b!1276783 (= e!728986 tp_is_empty!33259)))

(declare-fun b!1276784 () Bool)

(declare-datatypes ((List!28646 0))(
  ( (Nil!28643) (Cons!28642 (h!29860 (_ BitVec 64)) (t!42174 List!28646)) )
))
(declare-fun noDuplicate!2064 (List!28646) Bool)

(assert (=> b!1276784 (= e!728984 (not (noDuplicate!2064 Nil!28643)))))

(declare-fun b!1276785 () Bool)

(declare-fun res!848283 () Bool)

(assert (=> b!1276785 (=> (not res!848283) (not e!728984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83647 (_ BitVec 32)) Bool)

(assert (=> b!1276785 (= res!848283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun mapIsEmpty!51410 () Bool)

(assert (=> mapIsEmpty!51410 mapRes!51410))

(assert (= (and start!108188 res!848285) b!1276781))

(assert (= (and b!1276781 res!848284) b!1276785))

(assert (= (and b!1276785 res!848283) b!1276782))

(assert (= (and b!1276782 res!848282) b!1276784))

(assert (= (and b!1276780 condMapEmpty!51410) mapIsEmpty!51410))

(assert (= (and b!1276780 (not condMapEmpty!51410)) mapNonEmpty!51410))

(get-info :version)

(assert (= (and mapNonEmpty!51410 ((_ is ValueCellFull!15731) mapValue!51410)) b!1276779))

(assert (= (and b!1276780 ((_ is ValueCellFull!15731) mapDefault!51410)) b!1276783))

(assert (= start!108188 b!1276780))

(declare-fun m!1173317 () Bool)

(assert (=> start!108188 m!1173317))

(declare-fun m!1173319 () Bool)

(assert (=> start!108188 m!1173319))

(declare-fun m!1173321 () Bool)

(assert (=> start!108188 m!1173321))

(declare-fun m!1173323 () Bool)

(assert (=> mapNonEmpty!51410 m!1173323))

(declare-fun m!1173325 () Bool)

(assert (=> b!1276784 m!1173325))

(declare-fun m!1173327 () Bool)

(assert (=> b!1276785 m!1173327))

(check-sat (not mapNonEmpty!51410) (not b!1276785) (not start!108188) tp_is_empty!33259 (not b!1276784))
(check-sat)
(get-model)

(declare-fun d!140815 () Bool)

(declare-fun res!848314 () Bool)

(declare-fun e!729022 () Bool)

(assert (=> d!140815 (=> res!848314 e!729022)))

(assert (=> d!140815 (= res!848314 ((_ is Nil!28643) Nil!28643))))

(assert (=> d!140815 (= (noDuplicate!2064 Nil!28643) e!729022)))

(declare-fun b!1276832 () Bool)

(declare-fun e!729023 () Bool)

(assert (=> b!1276832 (= e!729022 e!729023)))

(declare-fun res!848315 () Bool)

(assert (=> b!1276832 (=> (not res!848315) (not e!729023))))

(declare-fun contains!7706 (List!28646 (_ BitVec 64)) Bool)

(assert (=> b!1276832 (= res!848315 (not (contains!7706 (t!42174 Nil!28643) (h!29860 Nil!28643))))))

(declare-fun b!1276833 () Bool)

(assert (=> b!1276833 (= e!729023 (noDuplicate!2064 (t!42174 Nil!28643)))))

(assert (= (and d!140815 (not res!848314)) b!1276832))

(assert (= (and b!1276832 res!848315) b!1276833))

(declare-fun m!1173353 () Bool)

(assert (=> b!1276832 m!1173353))

(declare-fun m!1173355 () Bool)

(assert (=> b!1276833 m!1173355))

(assert (=> b!1276784 d!140815))

(declare-fun d!140817 () Bool)

(assert (=> d!140817 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!108188 d!140817))

(declare-fun d!140819 () Bool)

(assert (=> d!140819 (= (array_inv!30841 _values!1187) (bvsge (size!40883 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!108188 d!140819))

(declare-fun d!140821 () Bool)

(assert (=> d!140821 (= (array_inv!30842 _keys!1427) (bvsge (size!40884 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!108188 d!140821))

(declare-fun b!1276842 () Bool)

(declare-fun e!729032 () Bool)

(declare-fun call!62706 () Bool)

(assert (=> b!1276842 (= e!729032 call!62706)))

(declare-fun b!1276843 () Bool)

(declare-fun e!729031 () Bool)

(declare-fun e!729030 () Bool)

(assert (=> b!1276843 (= e!729031 e!729030)))

(declare-fun c!124324 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1276843 (= c!124324 (validKeyInArray!0 (select (arr!40333 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140823 () Bool)

(declare-fun res!848321 () Bool)

(assert (=> d!140823 (=> res!848321 e!729031)))

(assert (=> d!140823 (= res!848321 (bvsge #b00000000000000000000000000000000 (size!40884 _keys!1427)))))

(assert (=> d!140823 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!729031)))

(declare-fun bm!62703 () Bool)

(assert (=> bm!62703 (= call!62706 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1276844 () Bool)

(assert (=> b!1276844 (= e!729030 e!729032)))

(declare-fun lt!575840 () (_ BitVec 64))

(assert (=> b!1276844 (= lt!575840 (select (arr!40333 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42326 0))(
  ( (Unit!42327) )
))
(declare-fun lt!575841 () Unit!42326)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83647 (_ BitVec 64) (_ BitVec 32)) Unit!42326)

(assert (=> b!1276844 (= lt!575841 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575840 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1276844 (arrayContainsKey!0 _keys!1427 lt!575840 #b00000000000000000000000000000000)))

(declare-fun lt!575842 () Unit!42326)

(assert (=> b!1276844 (= lt!575842 lt!575841)))

(declare-fun res!848320 () Bool)

(declare-datatypes ((SeekEntryResult!9959 0))(
  ( (MissingZero!9959 (index!42207 (_ BitVec 32))) (Found!9959 (index!42208 (_ BitVec 32))) (Intermediate!9959 (undefined!10771 Bool) (index!42209 (_ BitVec 32)) (x!112946 (_ BitVec 32))) (Undefined!9959) (MissingVacant!9959 (index!42210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83647 (_ BitVec 32)) SeekEntryResult!9959)

(assert (=> b!1276844 (= res!848320 (= (seekEntryOrOpen!0 (select (arr!40333 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!9959 #b00000000000000000000000000000000)))))

(assert (=> b!1276844 (=> (not res!848320) (not e!729032))))

(declare-fun b!1276845 () Bool)

(assert (=> b!1276845 (= e!729030 call!62706)))

(assert (= (and d!140823 (not res!848321)) b!1276843))

(assert (= (and b!1276843 c!124324) b!1276844))

(assert (= (and b!1276843 (not c!124324)) b!1276845))

(assert (= (and b!1276844 res!848320) b!1276842))

(assert (= (or b!1276842 b!1276845) bm!62703))

(declare-fun m!1173357 () Bool)

(assert (=> b!1276843 m!1173357))

(assert (=> b!1276843 m!1173357))

(declare-fun m!1173359 () Bool)

(assert (=> b!1276843 m!1173359))

(declare-fun m!1173361 () Bool)

(assert (=> bm!62703 m!1173361))

(assert (=> b!1276844 m!1173357))

(declare-fun m!1173363 () Bool)

(assert (=> b!1276844 m!1173363))

(declare-fun m!1173365 () Bool)

(assert (=> b!1276844 m!1173365))

(assert (=> b!1276844 m!1173357))

(declare-fun m!1173367 () Bool)

(assert (=> b!1276844 m!1173367))

(assert (=> b!1276785 d!140823))

(declare-fun mapNonEmpty!51419 () Bool)

(declare-fun mapRes!51419 () Bool)

(declare-fun tp!98177 () Bool)

(declare-fun e!729038 () Bool)

(assert (=> mapNonEmpty!51419 (= mapRes!51419 (and tp!98177 e!729038))))

(declare-fun mapValue!51419 () ValueCell!15731)

(declare-fun mapRest!51419 () (Array (_ BitVec 32) ValueCell!15731))

(declare-fun mapKey!51419 () (_ BitVec 32))

(assert (=> mapNonEmpty!51419 (= mapRest!51410 (store mapRest!51419 mapKey!51419 mapValue!51419))))

(declare-fun b!1276852 () Bool)

(assert (=> b!1276852 (= e!729038 tp_is_empty!33259)))

(declare-fun mapIsEmpty!51419 () Bool)

(assert (=> mapIsEmpty!51419 mapRes!51419))

(declare-fun b!1276853 () Bool)

(declare-fun e!729037 () Bool)

(assert (=> b!1276853 (= e!729037 tp_is_empty!33259)))

(declare-fun condMapEmpty!51419 () Bool)

(declare-fun mapDefault!51419 () ValueCell!15731)

(assert (=> mapNonEmpty!51410 (= condMapEmpty!51419 (= mapRest!51410 ((as const (Array (_ BitVec 32) ValueCell!15731)) mapDefault!51419)))))

(assert (=> mapNonEmpty!51410 (= tp!98168 (and e!729037 mapRes!51419))))

(assert (= (and mapNonEmpty!51410 condMapEmpty!51419) mapIsEmpty!51419))

(assert (= (and mapNonEmpty!51410 (not condMapEmpty!51419)) mapNonEmpty!51419))

(assert (= (and mapNonEmpty!51419 ((_ is ValueCellFull!15731) mapValue!51419)) b!1276852))

(assert (= (and mapNonEmpty!51410 ((_ is ValueCellFull!15731) mapDefault!51419)) b!1276853))

(declare-fun m!1173369 () Bool)

(assert (=> mapNonEmpty!51419 m!1173369))

(check-sat (not b!1276843) (not b!1276832) (not b!1276844) (not b!1276833) tp_is_empty!33259 (not mapNonEmpty!51419) (not bm!62703))
(check-sat)
