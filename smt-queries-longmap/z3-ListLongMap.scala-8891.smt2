; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107966 () Bool)

(assert start!107966)

(declare-fun b!1275495 () Bool)

(declare-fun e!728154 () Bool)

(declare-datatypes ((List!28619 0))(
  ( (Nil!28616) (Cons!28615 (h!29824 (_ BitVec 64)) (t!42155 List!28619)) )
))
(declare-fun noDuplicate!2050 (List!28619) Bool)

(assert (=> b!1275495 (= e!728154 (not (noDuplicate!2050 Nil!28616)))))

(declare-fun b!1275497 () Bool)

(declare-fun e!728153 () Bool)

(declare-fun e!728155 () Bool)

(declare-fun mapRes!51413 () Bool)

(assert (=> b!1275497 (= e!728153 (and e!728155 mapRes!51413))))

(declare-fun condMapEmpty!51413 () Bool)

(declare-datatypes ((V!49451 0))(
  ( (V!49452 (val!16705 Int)) )
))
(declare-datatypes ((ValueCell!15732 0))(
  ( (ValueCellFull!15732 (v!19301 V!49451)) (EmptyCell!15732) )
))
(declare-datatypes ((array!83630 0))(
  ( (array!83631 (arr!40329 (Array (_ BitVec 32) ValueCell!15732)) (size!40879 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83630)

(declare-fun mapDefault!51413 () ValueCell!15732)

(assert (=> b!1275497 (= condMapEmpty!51413 (= (arr!40329 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15732)) mapDefault!51413)))))

(declare-fun b!1275498 () Bool)

(declare-fun res!847775 () Bool)

(assert (=> b!1275498 (=> (not res!847775) (not e!728154))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83632 0))(
  ( (array!83633 (arr!40330 (Array (_ BitVec 32) (_ BitVec 64))) (size!40880 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83632)

(assert (=> b!1275498 (= res!847775 (and (= (size!40879 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40880 _keys!1427) (size!40879 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275499 () Bool)

(declare-fun e!728152 () Bool)

(declare-fun tp_is_empty!33261 () Bool)

(assert (=> b!1275499 (= e!728152 tp_is_empty!33261)))

(declare-fun mapIsEmpty!51413 () Bool)

(assert (=> mapIsEmpty!51413 mapRes!51413))

(declare-fun b!1275500 () Bool)

(declare-fun res!847774 () Bool)

(assert (=> b!1275500 (=> (not res!847774) (not e!728154))))

(assert (=> b!1275500 (= res!847774 (and (bvsle #b00000000000000000000000000000000 (size!40880 _keys!1427)) (bvslt (size!40880 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51413 () Bool)

(declare-fun tp!98171 () Bool)

(assert (=> mapNonEmpty!51413 (= mapRes!51413 (and tp!98171 e!728152))))

(declare-fun mapKey!51413 () (_ BitVec 32))

(declare-fun mapValue!51413 () ValueCell!15732)

(declare-fun mapRest!51413 () (Array (_ BitVec 32) ValueCell!15732))

(assert (=> mapNonEmpty!51413 (= (arr!40329 _values!1187) (store mapRest!51413 mapKey!51413 mapValue!51413))))

(declare-fun b!1275501 () Bool)

(declare-fun res!847777 () Bool)

(assert (=> b!1275501 (=> (not res!847777) (not e!728154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83632 (_ BitVec 32)) Bool)

(assert (=> b!1275501 (= res!847777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun res!847776 () Bool)

(assert (=> start!107966 (=> (not res!847776) (not e!728154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107966 (= res!847776 (validMask!0 mask!1805))))

(assert (=> start!107966 e!728154))

(assert (=> start!107966 true))

(declare-fun array_inv!30657 (array!83630) Bool)

(assert (=> start!107966 (and (array_inv!30657 _values!1187) e!728153)))

(declare-fun array_inv!30658 (array!83632) Bool)

(assert (=> start!107966 (array_inv!30658 _keys!1427)))

(declare-fun b!1275496 () Bool)

(assert (=> b!1275496 (= e!728155 tp_is_empty!33261)))

(assert (= (and start!107966 res!847776) b!1275498))

(assert (= (and b!1275498 res!847775) b!1275501))

(assert (= (and b!1275501 res!847777) b!1275500))

(assert (= (and b!1275500 res!847774) b!1275495))

(assert (= (and b!1275497 condMapEmpty!51413) mapIsEmpty!51413))

(assert (= (and b!1275497 (not condMapEmpty!51413)) mapNonEmpty!51413))

(get-info :version)

(assert (= (and mapNonEmpty!51413 ((_ is ValueCellFull!15732) mapValue!51413)) b!1275499))

(assert (= (and b!1275497 ((_ is ValueCellFull!15732) mapDefault!51413)) b!1275496))

(assert (= start!107966 b!1275497))

(declare-fun m!1171717 () Bool)

(assert (=> b!1275495 m!1171717))

(declare-fun m!1171719 () Bool)

(assert (=> mapNonEmpty!51413 m!1171719))

(declare-fun m!1171721 () Bool)

(assert (=> b!1275501 m!1171721))

(declare-fun m!1171723 () Bool)

(assert (=> start!107966 m!1171723))

(declare-fun m!1171725 () Bool)

(assert (=> start!107966 m!1171725))

(declare-fun m!1171727 () Bool)

(assert (=> start!107966 m!1171727))

(check-sat (not start!107966) (not mapNonEmpty!51413) (not b!1275495) tp_is_empty!33261 (not b!1275501))
(check-sat)
(get-model)

(declare-fun d!140367 () Bool)

(assert (=> d!140367 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107966 d!140367))

(declare-fun d!140369 () Bool)

(assert (=> d!140369 (= (array_inv!30657 _values!1187) (bvsge (size!40879 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107966 d!140369))

(declare-fun d!140371 () Bool)

(assert (=> d!140371 (= (array_inv!30658 _keys!1427) (bvsge (size!40880 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107966 d!140371))

(declare-fun d!140373 () Bool)

(declare-fun res!847794 () Bool)

(declare-fun e!728175 () Bool)

(assert (=> d!140373 (=> res!847794 e!728175)))

(assert (=> d!140373 (= res!847794 ((_ is Nil!28616) Nil!28616))))

(assert (=> d!140373 (= (noDuplicate!2050 Nil!28616) e!728175)))

(declare-fun b!1275527 () Bool)

(declare-fun e!728176 () Bool)

(assert (=> b!1275527 (= e!728175 e!728176)))

(declare-fun res!847795 () Bool)

(assert (=> b!1275527 (=> (not res!847795) (not e!728176))))

(declare-fun contains!7682 (List!28619 (_ BitVec 64)) Bool)

(assert (=> b!1275527 (= res!847795 (not (contains!7682 (t!42155 Nil!28616) (h!29824 Nil!28616))))))

(declare-fun b!1275528 () Bool)

(assert (=> b!1275528 (= e!728176 (noDuplicate!2050 (t!42155 Nil!28616)))))

(assert (= (and d!140373 (not res!847794)) b!1275527))

(assert (= (and b!1275527 res!847795) b!1275528))

(declare-fun m!1171741 () Bool)

(assert (=> b!1275527 m!1171741))

(declare-fun m!1171743 () Bool)

(assert (=> b!1275528 m!1171743))

(assert (=> b!1275495 d!140373))

(declare-fun b!1275537 () Bool)

(declare-fun e!728184 () Bool)

(declare-fun e!728185 () Bool)

(assert (=> b!1275537 (= e!728184 e!728185)))

(declare-fun lt!575356 () (_ BitVec 64))

(assert (=> b!1275537 (= lt!575356 (select (arr!40330 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42355 0))(
  ( (Unit!42356) )
))
(declare-fun lt!575357 () Unit!42355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83632 (_ BitVec 64) (_ BitVec 32)) Unit!42355)

(assert (=> b!1275537 (= lt!575357 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575356 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83632 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275537 (arrayContainsKey!0 _keys!1427 lt!575356 #b00000000000000000000000000000000)))

(declare-fun lt!575358 () Unit!42355)

(assert (=> b!1275537 (= lt!575358 lt!575357)))

(declare-fun res!847801 () Bool)

(declare-datatypes ((SeekEntryResult!10003 0))(
  ( (MissingZero!10003 (index!42383 (_ BitVec 32))) (Found!10003 (index!42384 (_ BitVec 32))) (Intermediate!10003 (undefined!10815 Bool) (index!42385 (_ BitVec 32)) (x!112968 (_ BitVec 32))) (Undefined!10003) (MissingVacant!10003 (index!42386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83632 (_ BitVec 32)) SeekEntryResult!10003)

(assert (=> b!1275537 (= res!847801 (= (seekEntryOrOpen!0 (select (arr!40330 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10003 #b00000000000000000000000000000000)))))

(assert (=> b!1275537 (=> (not res!847801) (not e!728185))))

(declare-fun d!140375 () Bool)

(declare-fun res!847800 () Bool)

(declare-fun e!728183 () Bool)

(assert (=> d!140375 (=> res!847800 e!728183)))

(assert (=> d!140375 (= res!847800 (bvsge #b00000000000000000000000000000000 (size!40880 _keys!1427)))))

(assert (=> d!140375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728183)))

(declare-fun b!1275538 () Bool)

(assert (=> b!1275538 (= e!728183 e!728184)))

(declare-fun c!123924 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275538 (= c!123924 (validKeyInArray!0 (select (arr!40330 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1275539 () Bool)

(declare-fun call!62641 () Bool)

(assert (=> b!1275539 (= e!728185 call!62641)))

(declare-fun bm!62638 () Bool)

(assert (=> bm!62638 (= call!62641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275540 () Bool)

(assert (=> b!1275540 (= e!728184 call!62641)))

(assert (= (and d!140375 (not res!847800)) b!1275538))

(assert (= (and b!1275538 c!123924) b!1275537))

(assert (= (and b!1275538 (not c!123924)) b!1275540))

(assert (= (and b!1275537 res!847801) b!1275539))

(assert (= (or b!1275539 b!1275540) bm!62638))

(declare-fun m!1171745 () Bool)

(assert (=> b!1275537 m!1171745))

(declare-fun m!1171747 () Bool)

(assert (=> b!1275537 m!1171747))

(declare-fun m!1171749 () Bool)

(assert (=> b!1275537 m!1171749))

(assert (=> b!1275537 m!1171745))

(declare-fun m!1171751 () Bool)

(assert (=> b!1275537 m!1171751))

(assert (=> b!1275538 m!1171745))

(assert (=> b!1275538 m!1171745))

(declare-fun m!1171753 () Bool)

(assert (=> b!1275538 m!1171753))

(declare-fun m!1171755 () Bool)

(assert (=> bm!62638 m!1171755))

(assert (=> b!1275501 d!140375))

(declare-fun b!1275547 () Bool)

(declare-fun e!728190 () Bool)

(assert (=> b!1275547 (= e!728190 tp_is_empty!33261)))

(declare-fun condMapEmpty!51419 () Bool)

(declare-fun mapDefault!51419 () ValueCell!15732)

(assert (=> mapNonEmpty!51413 (= condMapEmpty!51419 (= mapRest!51413 ((as const (Array (_ BitVec 32) ValueCell!15732)) mapDefault!51419)))))

(declare-fun e!728191 () Bool)

(declare-fun mapRes!51419 () Bool)

(assert (=> mapNonEmpty!51413 (= tp!98171 (and e!728191 mapRes!51419))))

(declare-fun mapIsEmpty!51419 () Bool)

(assert (=> mapIsEmpty!51419 mapRes!51419))

(declare-fun mapNonEmpty!51419 () Bool)

(declare-fun tp!98177 () Bool)

(assert (=> mapNonEmpty!51419 (= mapRes!51419 (and tp!98177 e!728190))))

(declare-fun mapKey!51419 () (_ BitVec 32))

(declare-fun mapRest!51419 () (Array (_ BitVec 32) ValueCell!15732))

(declare-fun mapValue!51419 () ValueCell!15732)

(assert (=> mapNonEmpty!51419 (= mapRest!51413 (store mapRest!51419 mapKey!51419 mapValue!51419))))

(declare-fun b!1275548 () Bool)

(assert (=> b!1275548 (= e!728191 tp_is_empty!33261)))

(assert (= (and mapNonEmpty!51413 condMapEmpty!51419) mapIsEmpty!51419))

(assert (= (and mapNonEmpty!51413 (not condMapEmpty!51419)) mapNonEmpty!51419))

(assert (= (and mapNonEmpty!51419 ((_ is ValueCellFull!15732) mapValue!51419)) b!1275547))

(assert (= (and mapNonEmpty!51413 ((_ is ValueCellFull!15732) mapDefault!51419)) b!1275548))

(declare-fun m!1171757 () Bool)

(assert (=> mapNonEmpty!51419 m!1171757))

(check-sat (not b!1275537) (not b!1275528) (not b!1275527) (not b!1275538) tp_is_empty!33261 (not bm!62638) (not mapNonEmpty!51419))
(check-sat)
