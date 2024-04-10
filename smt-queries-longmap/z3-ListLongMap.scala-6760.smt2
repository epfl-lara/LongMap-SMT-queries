; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84828 () Bool)

(assert start!84828)

(declare-fun b!991585 () Bool)

(declare-fun e!559248 () Bool)

(declare-fun e!559245 () Bool)

(declare-fun mapRes!37068 () Bool)

(assert (=> b!991585 (= e!559248 (and e!559245 mapRes!37068))))

(declare-fun condMapEmpty!37068 () Bool)

(declare-datatypes ((V!36099 0))(
  ( (V!36100 (val!11719 Int)) )
))
(declare-datatypes ((ValueCell!11187 0))(
  ( (ValueCellFull!11187 (v!14295 V!36099)) (EmptyCell!11187) )
))
(declare-datatypes ((array!62639 0))(
  ( (array!62640 (arr!30167 (Array (_ BitVec 32) ValueCell!11187)) (size!30646 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62639)

(declare-fun mapDefault!37068 () ValueCell!11187)

(assert (=> b!991585 (= condMapEmpty!37068 (= (arr!30167 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11187)) mapDefault!37068)))))

(declare-fun mapNonEmpty!37068 () Bool)

(declare-fun tp!70139 () Bool)

(declare-fun e!559247 () Bool)

(assert (=> mapNonEmpty!37068 (= mapRes!37068 (and tp!70139 e!559247))))

(declare-fun mapKey!37068 () (_ BitVec 32))

(declare-fun mapRest!37068 () (Array (_ BitVec 32) ValueCell!11187))

(declare-fun mapValue!37068 () ValueCell!11187)

(assert (=> mapNonEmpty!37068 (= (arr!30167 _values!1551) (store mapRest!37068 mapKey!37068 mapValue!37068))))

(declare-fun mapIsEmpty!37068 () Bool)

(assert (=> mapIsEmpty!37068 mapRes!37068))

(declare-fun b!991586 () Bool)

(declare-fun tp_is_empty!23337 () Bool)

(assert (=> b!991586 (= e!559245 tp_is_empty!23337)))

(declare-fun res!662812 () Bool)

(declare-fun e!559249 () Bool)

(assert (=> start!84828 (=> (not res!662812) (not e!559249))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84828 (= res!662812 (validMask!0 mask!2471))))

(assert (=> start!84828 e!559249))

(assert (=> start!84828 true))

(declare-fun array_inv!23299 (array!62639) Bool)

(assert (=> start!84828 (and (array_inv!23299 _values!1551) e!559248)))

(declare-datatypes ((array!62641 0))(
  ( (array!62642 (arr!30168 (Array (_ BitVec 32) (_ BitVec 64))) (size!30647 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62641)

(declare-fun array_inv!23300 (array!62641) Bool)

(assert (=> start!84828 (array_inv!23300 _keys!1945)))

(declare-fun b!991587 () Bool)

(declare-fun res!662810 () Bool)

(assert (=> b!991587 (=> (not res!662810) (not e!559249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62641 (_ BitVec 32)) Bool)

(assert (=> b!991587 (= res!662810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun b!991588 () Bool)

(declare-fun res!662811 () Bool)

(assert (=> b!991588 (=> (not res!662811) (not e!559249))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991588 (= res!662811 (and (= (size!30646 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30647 _keys!1945) (size!30646 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991589 () Bool)

(assert (=> b!991589 (= e!559247 tp_is_empty!23337)))

(declare-fun b!991590 () Bool)

(assert (=> b!991590 (= e!559249 (and (bvsle #b00000000000000000000000000000000 (size!30647 _keys!1945)) (bvsge (size!30647 _keys!1945) #b01111111111111111111111111111111)))))

(assert (= (and start!84828 res!662812) b!991588))

(assert (= (and b!991588 res!662811) b!991587))

(assert (= (and b!991587 res!662810) b!991590))

(assert (= (and b!991585 condMapEmpty!37068) mapIsEmpty!37068))

(assert (= (and b!991585 (not condMapEmpty!37068)) mapNonEmpty!37068))

(get-info :version)

(assert (= (and mapNonEmpty!37068 ((_ is ValueCellFull!11187) mapValue!37068)) b!991589))

(assert (= (and b!991585 ((_ is ValueCellFull!11187) mapDefault!37068)) b!991586))

(assert (= start!84828 b!991585))

(declare-fun m!919477 () Bool)

(assert (=> mapNonEmpty!37068 m!919477))

(declare-fun m!919479 () Bool)

(assert (=> start!84828 m!919479))

(declare-fun m!919481 () Bool)

(assert (=> start!84828 m!919481))

(declare-fun m!919483 () Bool)

(assert (=> start!84828 m!919483))

(declare-fun m!919485 () Bool)

(assert (=> b!991587 m!919485))

(check-sat (not b!991587) (not start!84828) (not mapNonEmpty!37068) tp_is_empty!23337)
(check-sat)
(get-model)

(declare-fun b!991617 () Bool)

(declare-fun e!559271 () Bool)

(declare-fun e!559273 () Bool)

(assert (=> b!991617 (= e!559271 e!559273)))

(declare-fun lt!440001 () (_ BitVec 64))

(assert (=> b!991617 (= lt!440001 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32896 0))(
  ( (Unit!32897) )
))
(declare-fun lt!439999 () Unit!32896)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62641 (_ BitVec 64) (_ BitVec 32)) Unit!32896)

(assert (=> b!991617 (= lt!439999 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!440001 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991617 (arrayContainsKey!0 _keys!1945 lt!440001 #b00000000000000000000000000000000)))

(declare-fun lt!440000 () Unit!32896)

(assert (=> b!991617 (= lt!440000 lt!439999)))

(declare-fun res!662826 () Bool)

(declare-datatypes ((SeekEntryResult!9215 0))(
  ( (MissingZero!9215 (index!39231 (_ BitVec 32))) (Found!9215 (index!39232 (_ BitVec 32))) (Intermediate!9215 (undefined!10027 Bool) (index!39233 (_ BitVec 32)) (x!86276 (_ BitVec 32))) (Undefined!9215) (MissingVacant!9215 (index!39234 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62641 (_ BitVec 32)) SeekEntryResult!9215)

(assert (=> b!991617 (= res!662826 (= (seekEntryOrOpen!0 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9215 #b00000000000000000000000000000000)))))

(assert (=> b!991617 (=> (not res!662826) (not e!559273))))

(declare-fun b!991618 () Bool)

(declare-fun e!559272 () Bool)

(assert (=> b!991618 (= e!559272 e!559271)))

(declare-fun c!100630 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991618 (= c!100630 (validKeyInArray!0 (select (arr!30168 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!991620 () Bool)

(declare-fun call!42079 () Bool)

(assert (=> b!991620 (= e!559271 call!42079)))

(declare-fun bm!42076 () Bool)

(assert (=> bm!42076 (= call!42079 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun d!117957 () Bool)

(declare-fun res!662827 () Bool)

(assert (=> d!117957 (=> res!662827 e!559272)))

(assert (=> d!117957 (= res!662827 (bvsge #b00000000000000000000000000000000 (size!30647 _keys!1945)))))

(assert (=> d!117957 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559272)))

(declare-fun b!991619 () Bool)

(assert (=> b!991619 (= e!559273 call!42079)))

(assert (= (and d!117957 (not res!662827)) b!991618))

(assert (= (and b!991618 c!100630) b!991617))

(assert (= (and b!991618 (not c!100630)) b!991620))

(assert (= (and b!991617 res!662826) b!991619))

(assert (= (or b!991619 b!991620) bm!42076))

(declare-fun m!919497 () Bool)

(assert (=> b!991617 m!919497))

(declare-fun m!919499 () Bool)

(assert (=> b!991617 m!919499))

(declare-fun m!919501 () Bool)

(assert (=> b!991617 m!919501))

(assert (=> b!991617 m!919497))

(declare-fun m!919503 () Bool)

(assert (=> b!991617 m!919503))

(assert (=> b!991618 m!919497))

(assert (=> b!991618 m!919497))

(declare-fun m!919505 () Bool)

(assert (=> b!991618 m!919505))

(declare-fun m!919507 () Bool)

(assert (=> bm!42076 m!919507))

(assert (=> b!991587 d!117957))

(declare-fun d!117959 () Bool)

(assert (=> d!117959 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84828 d!117959))

(declare-fun d!117961 () Bool)

(assert (=> d!117961 (= (array_inv!23299 _values!1551) (bvsge (size!30646 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84828 d!117961))

(declare-fun d!117963 () Bool)

(assert (=> d!117963 (= (array_inv!23300 _keys!1945) (bvsge (size!30647 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84828 d!117963))

(declare-fun b!991628 () Bool)

(declare-fun e!559279 () Bool)

(assert (=> b!991628 (= e!559279 tp_is_empty!23337)))

(declare-fun mapIsEmpty!37074 () Bool)

(declare-fun mapRes!37074 () Bool)

(assert (=> mapIsEmpty!37074 mapRes!37074))

(declare-fun condMapEmpty!37074 () Bool)

(declare-fun mapDefault!37074 () ValueCell!11187)

(assert (=> mapNonEmpty!37068 (= condMapEmpty!37074 (= mapRest!37068 ((as const (Array (_ BitVec 32) ValueCell!11187)) mapDefault!37074)))))

(assert (=> mapNonEmpty!37068 (= tp!70139 (and e!559279 mapRes!37074))))

(declare-fun mapNonEmpty!37074 () Bool)

(declare-fun tp!70145 () Bool)

(declare-fun e!559278 () Bool)

(assert (=> mapNonEmpty!37074 (= mapRes!37074 (and tp!70145 e!559278))))

(declare-fun mapValue!37074 () ValueCell!11187)

(declare-fun mapKey!37074 () (_ BitVec 32))

(declare-fun mapRest!37074 () (Array (_ BitVec 32) ValueCell!11187))

(assert (=> mapNonEmpty!37074 (= mapRest!37068 (store mapRest!37074 mapKey!37074 mapValue!37074))))

(declare-fun b!991627 () Bool)

(assert (=> b!991627 (= e!559278 tp_is_empty!23337)))

(assert (= (and mapNonEmpty!37068 condMapEmpty!37074) mapIsEmpty!37074))

(assert (= (and mapNonEmpty!37068 (not condMapEmpty!37074)) mapNonEmpty!37074))

(assert (= (and mapNonEmpty!37074 ((_ is ValueCellFull!11187) mapValue!37074)) b!991627))

(assert (= (and mapNonEmpty!37068 ((_ is ValueCellFull!11187) mapDefault!37074)) b!991628))

(declare-fun m!919509 () Bool)

(assert (=> mapNonEmpty!37074 m!919509))

(check-sat (not mapNonEmpty!37074) (not bm!42076) tp_is_empty!23337 (not b!991618) (not b!991617))
(check-sat)
