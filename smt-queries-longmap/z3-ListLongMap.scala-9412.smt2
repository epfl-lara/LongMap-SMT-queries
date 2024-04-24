; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112282 () Bool)

(assert start!112282)

(declare-fun mapNonEmpty!56245 () Bool)

(declare-fun mapRes!56245 () Bool)

(declare-fun tp!107152 () Bool)

(declare-fun e!757549 () Bool)

(assert (=> mapNonEmpty!56245 (= mapRes!56245 (and tp!107152 e!757549))))

(declare-datatypes ((V!53617 0))(
  ( (V!53618 (val!18267 Int)) )
))
(declare-datatypes ((ValueCell!17294 0))(
  ( (ValueCellFull!17294 (v!20898 V!53617)) (EmptyCell!17294) )
))
(declare-datatypes ((array!89777 0))(
  ( (array!89778 (arr!43352 (Array (_ BitVec 32) ValueCell!17294)) (size!43903 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89777)

(declare-fun mapValue!56245 () ValueCell!17294)

(declare-fun mapRest!56245 () (Array (_ BitVec 32) ValueCell!17294))

(declare-fun mapKey!56245 () (_ BitVec 32))

(assert (=> mapNonEmpty!56245 (= (arr!43352 _values!1320) (store mapRest!56245 mapKey!56245 mapValue!56245))))

(declare-fun res!881391 () Bool)

(declare-fun e!757547 () Bool)

(assert (=> start!112282 (=> (not res!881391) (not e!757547))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112282 (= res!881391 (validMask!0 mask!1998))))

(assert (=> start!112282 e!757547))

(assert (=> start!112282 true))

(declare-fun e!757548 () Bool)

(declare-fun array_inv!32983 (array!89777) Bool)

(assert (=> start!112282 (and (array_inv!32983 _values!1320) e!757548)))

(declare-datatypes ((array!89779 0))(
  ( (array!89780 (arr!43353 (Array (_ BitVec 32) (_ BitVec 64))) (size!43904 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89779)

(declare-fun array_inv!32984 (array!89779) Bool)

(assert (=> start!112282 (array_inv!32984 _keys!1590)))

(declare-fun mapIsEmpty!56245 () Bool)

(assert (=> mapIsEmpty!56245 mapRes!56245))

(declare-fun b!1328782 () Bool)

(declare-datatypes ((List!30732 0))(
  ( (Nil!30729) (Cons!30728 (h!31946 (_ BitVec 64)) (t!44730 List!30732)) )
))
(declare-fun noDuplicate!2081 (List!30732) Bool)

(assert (=> b!1328782 (= e!757547 (not (noDuplicate!2081 Nil!30729)))))

(declare-fun b!1328783 () Bool)

(declare-fun res!881394 () Bool)

(assert (=> b!1328783 (=> (not res!881394) (not e!757547))))

(assert (=> b!1328783 (= res!881394 (and (bvsle #b00000000000000000000000000000000 (size!43904 _keys!1590)) (bvslt (size!43904 _keys!1590) #b01111111111111111111111111111111)))))

(declare-fun b!1328784 () Bool)

(declare-fun e!757546 () Bool)

(assert (=> b!1328784 (= e!757548 (and e!757546 mapRes!56245))))

(declare-fun condMapEmpty!56245 () Bool)

(declare-fun mapDefault!56245 () ValueCell!17294)

(assert (=> b!1328784 (= condMapEmpty!56245 (= (arr!43352 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17294)) mapDefault!56245)))))

(declare-fun b!1328785 () Bool)

(declare-fun res!881393 () Bool)

(assert (=> b!1328785 (=> (not res!881393) (not e!757547))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89779 (_ BitVec 32)) Bool)

(assert (=> b!1328785 (= res!881393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328786 () Bool)

(declare-fun tp_is_empty!36385 () Bool)

(assert (=> b!1328786 (= e!757546 tp_is_empty!36385)))

(declare-fun b!1328787 () Bool)

(assert (=> b!1328787 (= e!757549 tp_is_empty!36385)))

(declare-fun b!1328788 () Bool)

(declare-fun res!881392 () Bool)

(assert (=> b!1328788 (=> (not res!881392) (not e!757547))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328788 (= res!881392 (and (= (size!43903 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43904 _keys!1590) (size!43903 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(assert (= (and start!112282 res!881391) b!1328788))

(assert (= (and b!1328788 res!881392) b!1328785))

(assert (= (and b!1328785 res!881393) b!1328783))

(assert (= (and b!1328783 res!881394) b!1328782))

(assert (= (and b!1328784 condMapEmpty!56245) mapIsEmpty!56245))

(assert (= (and b!1328784 (not condMapEmpty!56245)) mapNonEmpty!56245))

(get-info :version)

(assert (= (and mapNonEmpty!56245 ((_ is ValueCellFull!17294) mapValue!56245)) b!1328787))

(assert (= (and b!1328784 ((_ is ValueCellFull!17294) mapDefault!56245)) b!1328786))

(assert (= start!112282 b!1328784))

(declare-fun m!1218385 () Bool)

(assert (=> mapNonEmpty!56245 m!1218385))

(declare-fun m!1218387 () Bool)

(assert (=> start!112282 m!1218387))

(declare-fun m!1218389 () Bool)

(assert (=> start!112282 m!1218389))

(declare-fun m!1218391 () Bool)

(assert (=> start!112282 m!1218391))

(declare-fun m!1218393 () Bool)

(assert (=> b!1328782 m!1218393))

(declare-fun m!1218395 () Bool)

(assert (=> b!1328785 m!1218395))

(check-sat (not b!1328785) (not b!1328782) tp_is_empty!36385 (not start!112282) (not mapNonEmpty!56245))
(check-sat)
(get-model)

(declare-fun b!1328839 () Bool)

(declare-fun e!757588 () Bool)

(declare-fun call!64884 () Bool)

(assert (=> b!1328839 (= e!757588 call!64884)))

(declare-fun b!1328840 () Bool)

(declare-fun e!757587 () Bool)

(assert (=> b!1328840 (= e!757588 e!757587)))

(declare-fun lt!591195 () (_ BitVec 64))

(assert (=> b!1328840 (= lt!591195 (select (arr!43353 _keys!1590) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43678 0))(
  ( (Unit!43679) )
))
(declare-fun lt!591196 () Unit!43678)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!89779 (_ BitVec 64) (_ BitVec 32)) Unit!43678)

(assert (=> b!1328840 (= lt!591196 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1590 lt!591195 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!89779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1328840 (arrayContainsKey!0 _keys!1590 lt!591195 #b00000000000000000000000000000000)))

(declare-fun lt!591197 () Unit!43678)

(assert (=> b!1328840 (= lt!591197 lt!591196)))

(declare-fun res!881424 () Bool)

(declare-datatypes ((SeekEntryResult!10001 0))(
  ( (MissingZero!10001 (index!42375 (_ BitVec 32))) (Found!10001 (index!42376 (_ BitVec 32))) (Intermediate!10001 (undefined!10813 Bool) (index!42377 (_ BitVec 32)) (x!118345 (_ BitVec 32))) (Undefined!10001) (MissingVacant!10001 (index!42378 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!89779 (_ BitVec 32)) SeekEntryResult!10001)

(assert (=> b!1328840 (= res!881424 (= (seekEntryOrOpen!0 (select (arr!43353 _keys!1590) #b00000000000000000000000000000000) _keys!1590 mask!1998) (Found!10001 #b00000000000000000000000000000000)))))

(assert (=> b!1328840 (=> (not res!881424) (not e!757587))))

(declare-fun b!1328841 () Bool)

(assert (=> b!1328841 (= e!757587 call!64884)))

(declare-fun d!143771 () Bool)

(declare-fun res!881423 () Bool)

(declare-fun e!757589 () Bool)

(assert (=> d!143771 (=> res!881423 e!757589)))

(assert (=> d!143771 (= res!881423 (bvsge #b00000000000000000000000000000000 (size!43904 _keys!1590)))))

(assert (=> d!143771 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998) e!757589)))

(declare-fun bm!64881 () Bool)

(assert (=> bm!64881 (= call!64884 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1590 mask!1998))))

(declare-fun b!1328842 () Bool)

(assert (=> b!1328842 (= e!757589 e!757588)))

(declare-fun c!126296 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328842 (= c!126296 (validKeyInArray!0 (select (arr!43353 _keys!1590) #b00000000000000000000000000000000)))))

(assert (= (and d!143771 (not res!881423)) b!1328842))

(assert (= (and b!1328842 c!126296) b!1328840))

(assert (= (and b!1328842 (not c!126296)) b!1328839))

(assert (= (and b!1328840 res!881424) b!1328841))

(assert (= (or b!1328841 b!1328839) bm!64881))

(declare-fun m!1218421 () Bool)

(assert (=> b!1328840 m!1218421))

(declare-fun m!1218423 () Bool)

(assert (=> b!1328840 m!1218423))

(declare-fun m!1218425 () Bool)

(assert (=> b!1328840 m!1218425))

(assert (=> b!1328840 m!1218421))

(declare-fun m!1218427 () Bool)

(assert (=> b!1328840 m!1218427))

(declare-fun m!1218429 () Bool)

(assert (=> bm!64881 m!1218429))

(assert (=> b!1328842 m!1218421))

(assert (=> b!1328842 m!1218421))

(declare-fun m!1218431 () Bool)

(assert (=> b!1328842 m!1218431))

(assert (=> b!1328785 d!143771))

(declare-fun d!143773 () Bool)

(assert (=> d!143773 (= (validMask!0 mask!1998) (and (or (= mask!1998 #b00000000000000000000000000000111) (= mask!1998 #b00000000000000000000000000001111) (= mask!1998 #b00000000000000000000000000011111) (= mask!1998 #b00000000000000000000000000111111) (= mask!1998 #b00000000000000000000000001111111) (= mask!1998 #b00000000000000000000000011111111) (= mask!1998 #b00000000000000000000000111111111) (= mask!1998 #b00000000000000000000001111111111) (= mask!1998 #b00000000000000000000011111111111) (= mask!1998 #b00000000000000000000111111111111) (= mask!1998 #b00000000000000000001111111111111) (= mask!1998 #b00000000000000000011111111111111) (= mask!1998 #b00000000000000000111111111111111) (= mask!1998 #b00000000000000001111111111111111) (= mask!1998 #b00000000000000011111111111111111) (= mask!1998 #b00000000000000111111111111111111) (= mask!1998 #b00000000000001111111111111111111) (= mask!1998 #b00000000000011111111111111111111) (= mask!1998 #b00000000000111111111111111111111) (= mask!1998 #b00000000001111111111111111111111) (= mask!1998 #b00000000011111111111111111111111) (= mask!1998 #b00000000111111111111111111111111) (= mask!1998 #b00000001111111111111111111111111) (= mask!1998 #b00000011111111111111111111111111) (= mask!1998 #b00000111111111111111111111111111) (= mask!1998 #b00001111111111111111111111111111) (= mask!1998 #b00011111111111111111111111111111) (= mask!1998 #b00111111111111111111111111111111)) (bvsle mask!1998 #b00111111111111111111111111111111)))))

(assert (=> start!112282 d!143773))

(declare-fun d!143775 () Bool)

(assert (=> d!143775 (= (array_inv!32983 _values!1320) (bvsge (size!43903 _values!1320) #b00000000000000000000000000000000))))

(assert (=> start!112282 d!143775))

(declare-fun d!143777 () Bool)

(assert (=> d!143777 (= (array_inv!32984 _keys!1590) (bvsge (size!43904 _keys!1590) #b00000000000000000000000000000000))))

(assert (=> start!112282 d!143777))

(declare-fun d!143779 () Bool)

(declare-fun res!881429 () Bool)

(declare-fun e!757594 () Bool)

(assert (=> d!143779 (=> res!881429 e!757594)))

(assert (=> d!143779 (= res!881429 ((_ is Nil!30729) Nil!30729))))

(assert (=> d!143779 (= (noDuplicate!2081 Nil!30729) e!757594)))

(declare-fun b!1328847 () Bool)

(declare-fun e!757595 () Bool)

(assert (=> b!1328847 (= e!757594 e!757595)))

(declare-fun res!881430 () Bool)

(assert (=> b!1328847 (=> (not res!881430) (not e!757595))))

(declare-fun contains!8810 (List!30732 (_ BitVec 64)) Bool)

(assert (=> b!1328847 (= res!881430 (not (contains!8810 (t!44730 Nil!30729) (h!31946 Nil!30729))))))

(declare-fun b!1328848 () Bool)

(assert (=> b!1328848 (= e!757595 (noDuplicate!2081 (t!44730 Nil!30729)))))

(assert (= (and d!143779 (not res!881429)) b!1328847))

(assert (= (and b!1328847 res!881430) b!1328848))

(declare-fun m!1218433 () Bool)

(assert (=> b!1328847 m!1218433))

(declare-fun m!1218435 () Bool)

(assert (=> b!1328848 m!1218435))

(assert (=> b!1328782 d!143779))

(declare-fun mapIsEmpty!56254 () Bool)

(declare-fun mapRes!56254 () Bool)

(assert (=> mapIsEmpty!56254 mapRes!56254))

(declare-fun b!1328856 () Bool)

(declare-fun e!757600 () Bool)

(assert (=> b!1328856 (= e!757600 tp_is_empty!36385)))

(declare-fun mapNonEmpty!56254 () Bool)

(declare-fun tp!107161 () Bool)

(declare-fun e!757601 () Bool)

(assert (=> mapNonEmpty!56254 (= mapRes!56254 (and tp!107161 e!757601))))

(declare-fun mapRest!56254 () (Array (_ BitVec 32) ValueCell!17294))

(declare-fun mapKey!56254 () (_ BitVec 32))

(declare-fun mapValue!56254 () ValueCell!17294)

(assert (=> mapNonEmpty!56254 (= mapRest!56245 (store mapRest!56254 mapKey!56254 mapValue!56254))))

(declare-fun condMapEmpty!56254 () Bool)

(declare-fun mapDefault!56254 () ValueCell!17294)

(assert (=> mapNonEmpty!56245 (= condMapEmpty!56254 (= mapRest!56245 ((as const (Array (_ BitVec 32) ValueCell!17294)) mapDefault!56254)))))

(assert (=> mapNonEmpty!56245 (= tp!107152 (and e!757600 mapRes!56254))))

(declare-fun b!1328855 () Bool)

(assert (=> b!1328855 (= e!757601 tp_is_empty!36385)))

(assert (= (and mapNonEmpty!56245 condMapEmpty!56254) mapIsEmpty!56254))

(assert (= (and mapNonEmpty!56245 (not condMapEmpty!56254)) mapNonEmpty!56254))

(assert (= (and mapNonEmpty!56254 ((_ is ValueCellFull!17294) mapValue!56254)) b!1328855))

(assert (= (and mapNonEmpty!56245 ((_ is ValueCellFull!17294) mapDefault!56254)) b!1328856))

(declare-fun m!1218437 () Bool)

(assert (=> mapNonEmpty!56254 m!1218437))

(check-sat (not b!1328847) (not b!1328840) tp_is_empty!36385 (not mapNonEmpty!56254) (not bm!64881) (not b!1328848) (not b!1328842))
(check-sat)
