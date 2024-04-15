; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107964 () Bool)

(assert start!107964)

(declare-fun mapIsEmpty!51410 () Bool)

(declare-fun mapRes!51410 () Bool)

(assert (=> mapIsEmpty!51410 mapRes!51410))

(declare-fun b!1275410 () Bool)

(declare-fun res!847735 () Bool)

(declare-fun e!728109 () Bool)

(assert (=> b!1275410 (=> (not res!847735) (not e!728109))))

(declare-datatypes ((array!83523 0))(
  ( (array!83524 (arr!40276 (Array (_ BitVec 32) (_ BitVec 64))) (size!40828 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83523)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83523 (_ BitVec 32)) Bool)

(assert (=> b!1275410 (= res!847735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275411 () Bool)

(declare-fun e!728108 () Bool)

(declare-fun tp_is_empty!33259 () Bool)

(assert (=> b!1275411 (= e!728108 tp_is_empty!33259)))

(declare-fun b!1275412 () Bool)

(declare-fun e!728110 () Bool)

(assert (=> b!1275412 (= e!728110 tp_is_empty!33259)))

(declare-fun res!847736 () Bool)

(assert (=> start!107964 (=> (not res!847736) (not e!728109))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107964 (= res!847736 (validMask!0 mask!1805))))

(assert (=> start!107964 e!728109))

(assert (=> start!107964 true))

(declare-datatypes ((V!49449 0))(
  ( (V!49450 (val!16704 Int)) )
))
(declare-datatypes ((ValueCell!15731 0))(
  ( (ValueCellFull!15731 (v!19299 V!49449)) (EmptyCell!15731) )
))
(declare-datatypes ((array!83525 0))(
  ( (array!83526 (arr!40277 (Array (_ BitVec 32) ValueCell!15731)) (size!40829 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83525)

(declare-fun e!728107 () Bool)

(declare-fun array_inv!30769 (array!83525) Bool)

(assert (=> start!107964 (and (array_inv!30769 _values!1187) e!728107)))

(declare-fun array_inv!30770 (array!83523) Bool)

(assert (=> start!107964 (array_inv!30770 _keys!1427)))

(declare-fun b!1275413 () Bool)

(declare-datatypes ((List!28691 0))(
  ( (Nil!28688) (Cons!28687 (h!29896 (_ BitVec 64)) (t!42219 List!28691)) )
))
(declare-fun noDuplicate!2069 (List!28691) Bool)

(assert (=> b!1275413 (= e!728109 (not (noDuplicate!2069 Nil!28688)))))

(declare-fun b!1275414 () Bool)

(declare-fun res!847737 () Bool)

(assert (=> b!1275414 (=> (not res!847737) (not e!728109))))

(assert (=> b!1275414 (= res!847737 (and (bvsle #b00000000000000000000000000000000 (size!40828 _keys!1427)) (bvslt (size!40828 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51410 () Bool)

(declare-fun tp!98169 () Bool)

(assert (=> mapNonEmpty!51410 (= mapRes!51410 (and tp!98169 e!728110))))

(declare-fun mapRest!51410 () (Array (_ BitVec 32) ValueCell!15731))

(declare-fun mapValue!51410 () ValueCell!15731)

(declare-fun mapKey!51410 () (_ BitVec 32))

(assert (=> mapNonEmpty!51410 (= (arr!40277 _values!1187) (store mapRest!51410 mapKey!51410 mapValue!51410))))

(declare-fun b!1275415 () Bool)

(declare-fun res!847738 () Bool)

(assert (=> b!1275415 (=> (not res!847738) (not e!728109))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275415 (= res!847738 (and (= (size!40829 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40828 _keys!1427) (size!40829 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275416 () Bool)

(assert (=> b!1275416 (= e!728107 (and e!728108 mapRes!51410))))

(declare-fun condMapEmpty!51410 () Bool)

(declare-fun mapDefault!51410 () ValueCell!15731)

(assert (=> b!1275416 (= condMapEmpty!51410 (= (arr!40277 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15731)) mapDefault!51410)))))

(assert (= (and start!107964 res!847736) b!1275415))

(assert (= (and b!1275415 res!847738) b!1275410))

(assert (= (and b!1275410 res!847735) b!1275414))

(assert (= (and b!1275414 res!847737) b!1275413))

(assert (= (and b!1275416 condMapEmpty!51410) mapIsEmpty!51410))

(assert (= (and b!1275416 (not condMapEmpty!51410)) mapNonEmpty!51410))

(get-info :version)

(assert (= (and mapNonEmpty!51410 ((_ is ValueCellFull!15731) mapValue!51410)) b!1275412))

(assert (= (and b!1275416 ((_ is ValueCellFull!15731) mapDefault!51410)) b!1275411))

(assert (= start!107964 b!1275416))

(declare-fun m!1171205 () Bool)

(assert (=> b!1275410 m!1171205))

(declare-fun m!1171207 () Bool)

(assert (=> start!107964 m!1171207))

(declare-fun m!1171209 () Bool)

(assert (=> start!107964 m!1171209))

(declare-fun m!1171211 () Bool)

(assert (=> start!107964 m!1171211))

(declare-fun m!1171213 () Bool)

(assert (=> b!1275413 m!1171213))

(declare-fun m!1171215 () Bool)

(assert (=> mapNonEmpty!51410 m!1171215))

(check-sat (not start!107964) tp_is_empty!33259 (not b!1275413) (not b!1275410) (not mapNonEmpty!51410))
(check-sat)
(get-model)

(declare-fun d!140255 () Bool)

(assert (=> d!140255 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107964 d!140255))

(declare-fun d!140257 () Bool)

(assert (=> d!140257 (= (array_inv!30769 _values!1187) (bvsge (size!40829 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107964 d!140257))

(declare-fun d!140259 () Bool)

(assert (=> d!140259 (= (array_inv!30770 _keys!1427) (bvsge (size!40828 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107964 d!140259))

(declare-fun b!1275467 () Bool)

(declare-fun e!728148 () Bool)

(declare-fun e!728150 () Bool)

(assert (=> b!1275467 (= e!728148 e!728150)))

(declare-fun lt!575178 () (_ BitVec 64))

(assert (=> b!1275467 (= lt!575178 (select (arr!40276 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42201 0))(
  ( (Unit!42202) )
))
(declare-fun lt!575179 () Unit!42201)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83523 (_ BitVec 64) (_ BitVec 32)) Unit!42201)

(assert (=> b!1275467 (= lt!575179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575178 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83523 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275467 (arrayContainsKey!0 _keys!1427 lt!575178 #b00000000000000000000000000000000)))

(declare-fun lt!575180 () Unit!42201)

(assert (=> b!1275467 (= lt!575180 lt!575179)))

(declare-fun res!847767 () Bool)

(declare-datatypes ((SeekEntryResult!10002 0))(
  ( (MissingZero!10002 (index!42379 (_ BitVec 32))) (Found!10002 (index!42380 (_ BitVec 32))) (Intermediate!10002 (undefined!10814 Bool) (index!42381 (_ BitVec 32)) (x!112964 (_ BitVec 32))) (Undefined!10002) (MissingVacant!10002 (index!42382 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83523 (_ BitVec 32)) SeekEntryResult!10002)

(assert (=> b!1275467 (= res!847767 (= (seekEntryOrOpen!0 (select (arr!40276 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10002 #b00000000000000000000000000000000)))))

(assert (=> b!1275467 (=> (not res!847767) (not e!728150))))

(declare-fun d!140261 () Bool)

(declare-fun res!847768 () Bool)

(declare-fun e!728149 () Bool)

(assert (=> d!140261 (=> res!847768 e!728149)))

(assert (=> d!140261 (= res!847768 (bvsge #b00000000000000000000000000000000 (size!40828 _keys!1427)))))

(assert (=> d!140261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728149)))

(declare-fun b!1275468 () Bool)

(declare-fun call!62622 () Bool)

(assert (=> b!1275468 (= e!728150 call!62622)))

(declare-fun bm!62619 () Bool)

(assert (=> bm!62619 (= call!62622 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275469 () Bool)

(assert (=> b!1275469 (= e!728148 call!62622)))

(declare-fun b!1275470 () Bool)

(assert (=> b!1275470 (= e!728149 e!728148)))

(declare-fun c!123908 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275470 (= c!123908 (validKeyInArray!0 (select (arr!40276 _keys!1427) #b00000000000000000000000000000000)))))

(assert (= (and d!140261 (not res!847768)) b!1275470))

(assert (= (and b!1275470 c!123908) b!1275467))

(assert (= (and b!1275470 (not c!123908)) b!1275469))

(assert (= (and b!1275467 res!847767) b!1275468))

(assert (= (or b!1275468 b!1275469) bm!62619))

(declare-fun m!1171241 () Bool)

(assert (=> b!1275467 m!1171241))

(declare-fun m!1171243 () Bool)

(assert (=> b!1275467 m!1171243))

(declare-fun m!1171245 () Bool)

(assert (=> b!1275467 m!1171245))

(assert (=> b!1275467 m!1171241))

(declare-fun m!1171247 () Bool)

(assert (=> b!1275467 m!1171247))

(declare-fun m!1171249 () Bool)

(assert (=> bm!62619 m!1171249))

(assert (=> b!1275470 m!1171241))

(assert (=> b!1275470 m!1171241))

(declare-fun m!1171251 () Bool)

(assert (=> b!1275470 m!1171251))

(assert (=> b!1275410 d!140261))

(declare-fun d!140263 () Bool)

(declare-fun res!847773 () Bool)

(declare-fun e!728155 () Bool)

(assert (=> d!140263 (=> res!847773 e!728155)))

(assert (=> d!140263 (= res!847773 ((_ is Nil!28688) Nil!28688))))

(assert (=> d!140263 (= (noDuplicate!2069 Nil!28688) e!728155)))

(declare-fun b!1275475 () Bool)

(declare-fun e!728156 () Bool)

(assert (=> b!1275475 (= e!728155 e!728156)))

(declare-fun res!847774 () Bool)

(assert (=> b!1275475 (=> (not res!847774) (not e!728156))))

(declare-fun contains!7651 (List!28691 (_ BitVec 64)) Bool)

(assert (=> b!1275475 (= res!847774 (not (contains!7651 (t!42219 Nil!28688) (h!29896 Nil!28688))))))

(declare-fun b!1275476 () Bool)

(assert (=> b!1275476 (= e!728156 (noDuplicate!2069 (t!42219 Nil!28688)))))

(assert (= (and d!140263 (not res!847773)) b!1275475))

(assert (= (and b!1275475 res!847774) b!1275476))

(declare-fun m!1171253 () Bool)

(assert (=> b!1275475 m!1171253))

(declare-fun m!1171255 () Bool)

(assert (=> b!1275476 m!1171255))

(assert (=> b!1275413 d!140263))

(declare-fun condMapEmpty!51419 () Bool)

(declare-fun mapDefault!51419 () ValueCell!15731)

(assert (=> mapNonEmpty!51410 (= condMapEmpty!51419 (= mapRest!51410 ((as const (Array (_ BitVec 32) ValueCell!15731)) mapDefault!51419)))))

(declare-fun e!728162 () Bool)

(declare-fun mapRes!51419 () Bool)

(assert (=> mapNonEmpty!51410 (= tp!98169 (and e!728162 mapRes!51419))))

(declare-fun b!1275483 () Bool)

(declare-fun e!728161 () Bool)

(assert (=> b!1275483 (= e!728161 tp_is_empty!33259)))

(declare-fun b!1275484 () Bool)

(assert (=> b!1275484 (= e!728162 tp_is_empty!33259)))

(declare-fun mapIsEmpty!51419 () Bool)

(assert (=> mapIsEmpty!51419 mapRes!51419))

(declare-fun mapNonEmpty!51419 () Bool)

(declare-fun tp!98178 () Bool)

(assert (=> mapNonEmpty!51419 (= mapRes!51419 (and tp!98178 e!728161))))

(declare-fun mapKey!51419 () (_ BitVec 32))

(declare-fun mapRest!51419 () (Array (_ BitVec 32) ValueCell!15731))

(declare-fun mapValue!51419 () ValueCell!15731)

(assert (=> mapNonEmpty!51419 (= mapRest!51410 (store mapRest!51419 mapKey!51419 mapValue!51419))))

(assert (= (and mapNonEmpty!51410 condMapEmpty!51419) mapIsEmpty!51419))

(assert (= (and mapNonEmpty!51410 (not condMapEmpty!51419)) mapNonEmpty!51419))

(assert (= (and mapNonEmpty!51419 ((_ is ValueCellFull!15731) mapValue!51419)) b!1275483))

(assert (= (and mapNonEmpty!51410 ((_ is ValueCellFull!15731) mapDefault!51419)) b!1275484))

(declare-fun m!1171257 () Bool)

(assert (=> mapNonEmpty!51419 m!1171257))

(check-sat tp_is_empty!33259 (not mapNonEmpty!51419) (not b!1275475) (not b!1275467) (not b!1275470) (not bm!62619) (not b!1275476))
(check-sat)
