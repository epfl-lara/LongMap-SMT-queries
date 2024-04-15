; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84822 () Bool)

(assert start!84822)

(declare-fun b!991404 () Bool)

(declare-fun e!559144 () Bool)

(declare-fun tp_is_empty!23341 () Bool)

(assert (=> b!991404 (= e!559144 tp_is_empty!23341)))

(declare-fun b!991405 () Bool)

(declare-fun res!662728 () Bool)

(declare-fun e!559146 () Bool)

(assert (=> b!991405 (=> (not res!662728) (not e!559146))))

(declare-datatypes ((array!62582 0))(
  ( (array!62583 (arr!30138 (Array (_ BitVec 32) (_ BitVec 64))) (size!30619 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62582)

(assert (=> b!991405 (= res!662728 (and (bvsle #b00000000000000000000000000000000 (size!30619 _keys!1945)) (bvslt (size!30619 _keys!1945) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!37077 () Bool)

(declare-fun mapRes!37077 () Bool)

(declare-fun tp!70149 () Bool)

(declare-fun e!559145 () Bool)

(assert (=> mapNonEmpty!37077 (= mapRes!37077 (and tp!70149 e!559145))))

(declare-datatypes ((V!36105 0))(
  ( (V!36106 (val!11721 Int)) )
))
(declare-datatypes ((ValueCell!11189 0))(
  ( (ValueCellFull!11189 (v!14296 V!36105)) (EmptyCell!11189) )
))
(declare-fun mapRest!37077 () (Array (_ BitVec 32) ValueCell!11189))

(declare-fun mapKey!37077 () (_ BitVec 32))

(declare-datatypes ((array!62584 0))(
  ( (array!62585 (arr!30139 (Array (_ BitVec 32) ValueCell!11189)) (size!30620 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62584)

(declare-fun mapValue!37077 () ValueCell!11189)

(assert (=> mapNonEmpty!37077 (= (arr!30139 _values!1551) (store mapRest!37077 mapKey!37077 mapValue!37077))))

(declare-fun b!991406 () Bool)

(declare-fun res!662729 () Bool)

(assert (=> b!991406 (=> (not res!662729) (not e!559146))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(declare-fun mask!2471 () (_ BitVec 32))

(assert (=> b!991406 (= res!662729 (and (= (size!30620 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30619 _keys!1945) (size!30620 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991407 () Bool)

(declare-fun res!662727 () Bool)

(assert (=> b!991407 (=> (not res!662727) (not e!559146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62582 (_ BitVec 32)) Bool)

(assert (=> b!991407 (= res!662727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(declare-fun mapIsEmpty!37077 () Bool)

(assert (=> mapIsEmpty!37077 mapRes!37077))

(declare-fun b!991408 () Bool)

(declare-datatypes ((List!20894 0))(
  ( (Nil!20891) (Cons!20890 (h!22052 (_ BitVec 64)) (t!29868 List!20894)) )
))
(declare-fun noDuplicate!1386 (List!20894) Bool)

(assert (=> b!991408 (= e!559146 (not (noDuplicate!1386 Nil!20891)))))

(declare-fun res!662726 () Bool)

(assert (=> start!84822 (=> (not res!662726) (not e!559146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84822 (= res!662726 (validMask!0 mask!2471))))

(assert (=> start!84822 e!559146))

(assert (=> start!84822 true))

(declare-fun e!559142 () Bool)

(declare-fun array_inv!23289 (array!62584) Bool)

(assert (=> start!84822 (and (array_inv!23289 _values!1551) e!559142)))

(declare-fun array_inv!23290 (array!62582) Bool)

(assert (=> start!84822 (array_inv!23290 _keys!1945)))

(declare-fun b!991409 () Bool)

(assert (=> b!991409 (= e!559142 (and e!559144 mapRes!37077))))

(declare-fun condMapEmpty!37077 () Bool)

(declare-fun mapDefault!37077 () ValueCell!11189)

(assert (=> b!991409 (= condMapEmpty!37077 (= (arr!30139 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11189)) mapDefault!37077)))))

(declare-fun b!991410 () Bool)

(assert (=> b!991410 (= e!559145 tp_is_empty!23341)))

(assert (= (and start!84822 res!662726) b!991406))

(assert (= (and b!991406 res!662729) b!991407))

(assert (= (and b!991407 res!662727) b!991405))

(assert (= (and b!991405 res!662728) b!991408))

(assert (= (and b!991409 condMapEmpty!37077) mapIsEmpty!37077))

(assert (= (and b!991409 (not condMapEmpty!37077)) mapNonEmpty!37077))

(get-info :version)

(assert (= (and mapNonEmpty!37077 ((_ is ValueCellFull!11189) mapValue!37077)) b!991410))

(assert (= (and b!991409 ((_ is ValueCellFull!11189) mapDefault!37077)) b!991404))

(assert (= start!84822 b!991409))

(declare-fun m!918753 () Bool)

(assert (=> mapNonEmpty!37077 m!918753))

(declare-fun m!918755 () Bool)

(assert (=> b!991407 m!918755))

(declare-fun m!918757 () Bool)

(assert (=> b!991408 m!918757))

(declare-fun m!918759 () Bool)

(assert (=> start!84822 m!918759))

(declare-fun m!918761 () Bool)

(assert (=> start!84822 m!918761))

(declare-fun m!918763 () Bool)

(assert (=> start!84822 m!918763))

(check-sat tp_is_empty!23341 (not b!991408) (not start!84822) (not mapNonEmpty!37077) (not b!991407))
(check-sat)
(get-model)

(declare-fun b!991462 () Bool)

(declare-fun e!559184 () Bool)

(declare-fun call!42056 () Bool)

(assert (=> b!991462 (= e!559184 call!42056)))

(declare-fun b!991463 () Bool)

(declare-fun e!559185 () Bool)

(assert (=> b!991463 (= e!559185 call!42056)))

(declare-fun b!991461 () Bool)

(declare-fun e!559183 () Bool)

(assert (=> b!991461 (= e!559183 e!559184)))

(declare-fun c!100568 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991461 (= c!100568 (validKeyInArray!0 (select (arr!30138 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun d!117769 () Bool)

(declare-fun res!662759 () Bool)

(assert (=> d!117769 (=> res!662759 e!559183)))

(assert (=> d!117769 (= res!662759 (bvsge #b00000000000000000000000000000000 (size!30619 _keys!1945)))))

(assert (=> d!117769 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559183)))

(declare-fun b!991464 () Bool)

(assert (=> b!991464 (= e!559184 e!559185)))

(declare-fun lt!439773 () (_ BitVec 64))

(assert (=> b!991464 (= lt!439773 (select (arr!30138 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32771 0))(
  ( (Unit!32772) )
))
(declare-fun lt!439772 () Unit!32771)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62582 (_ BitVec 64) (_ BitVec 32)) Unit!32771)

(assert (=> b!991464 (= lt!439772 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!439773 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991464 (arrayContainsKey!0 _keys!1945 lt!439773 #b00000000000000000000000000000000)))

(declare-fun lt!439774 () Unit!32771)

(assert (=> b!991464 (= lt!439774 lt!439772)))

(declare-fun res!662758 () Bool)

(declare-datatypes ((SeekEntryResult!9211 0))(
  ( (MissingZero!9211 (index!39215 (_ BitVec 32))) (Found!9211 (index!39216 (_ BitVec 32))) (Intermediate!9211 (undefined!10023 Bool) (index!39217 (_ BitVec 32)) (x!86277 (_ BitVec 32))) (Undefined!9211) (MissingVacant!9211 (index!39218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62582 (_ BitVec 32)) SeekEntryResult!9211)

(assert (=> b!991464 (= res!662758 (= (seekEntryOrOpen!0 (select (arr!30138 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9211 #b00000000000000000000000000000000)))))

(assert (=> b!991464 (=> (not res!662758) (not e!559185))))

(declare-fun bm!42053 () Bool)

(assert (=> bm!42053 (= call!42056 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(assert (= (and d!117769 (not res!662759)) b!991461))

(assert (= (and b!991461 c!100568) b!991464))

(assert (= (and b!991461 (not c!100568)) b!991462))

(assert (= (and b!991464 res!662758) b!991463))

(assert (= (or b!991463 b!991462) bm!42053))

(declare-fun m!918789 () Bool)

(assert (=> b!991461 m!918789))

(assert (=> b!991461 m!918789))

(declare-fun m!918791 () Bool)

(assert (=> b!991461 m!918791))

(assert (=> b!991464 m!918789))

(declare-fun m!918793 () Bool)

(assert (=> b!991464 m!918793))

(declare-fun m!918795 () Bool)

(assert (=> b!991464 m!918795))

(assert (=> b!991464 m!918789))

(declare-fun m!918797 () Bool)

(assert (=> b!991464 m!918797))

(declare-fun m!918799 () Bool)

(assert (=> bm!42053 m!918799))

(assert (=> b!991407 d!117769))

(declare-fun d!117771 () Bool)

(declare-fun res!662764 () Bool)

(declare-fun e!559190 () Bool)

(assert (=> d!117771 (=> res!662764 e!559190)))

(assert (=> d!117771 (= res!662764 ((_ is Nil!20891) Nil!20891))))

(assert (=> d!117771 (= (noDuplicate!1386 Nil!20891) e!559190)))

(declare-fun b!991469 () Bool)

(declare-fun e!559191 () Bool)

(assert (=> b!991469 (= e!559190 e!559191)))

(declare-fun res!662765 () Bool)

(assert (=> b!991469 (=> (not res!662765) (not e!559191))))

(declare-fun contains!5701 (List!20894 (_ BitVec 64)) Bool)

(assert (=> b!991469 (= res!662765 (not (contains!5701 (t!29868 Nil!20891) (h!22052 Nil!20891))))))

(declare-fun b!991470 () Bool)

(assert (=> b!991470 (= e!559191 (noDuplicate!1386 (t!29868 Nil!20891)))))

(assert (= (and d!117771 (not res!662764)) b!991469))

(assert (= (and b!991469 res!662765) b!991470))

(declare-fun m!918801 () Bool)

(assert (=> b!991469 m!918801))

(declare-fun m!918803 () Bool)

(assert (=> b!991470 m!918803))

(assert (=> b!991408 d!117771))

(declare-fun d!117773 () Bool)

(assert (=> d!117773 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84822 d!117773))

(declare-fun d!117775 () Bool)

(assert (=> d!117775 (= (array_inv!23289 _values!1551) (bvsge (size!30620 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84822 d!117775))

(declare-fun d!117777 () Bool)

(assert (=> d!117777 (= (array_inv!23290 _keys!1945) (bvsge (size!30619 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84822 d!117777))

(declare-fun b!991477 () Bool)

(declare-fun e!559196 () Bool)

(assert (=> b!991477 (= e!559196 tp_is_empty!23341)))

(declare-fun mapNonEmpty!37086 () Bool)

(declare-fun mapRes!37086 () Bool)

(declare-fun tp!70158 () Bool)

(assert (=> mapNonEmpty!37086 (= mapRes!37086 (and tp!70158 e!559196))))

(declare-fun mapRest!37086 () (Array (_ BitVec 32) ValueCell!11189))

(declare-fun mapKey!37086 () (_ BitVec 32))

(declare-fun mapValue!37086 () ValueCell!11189)

(assert (=> mapNonEmpty!37086 (= mapRest!37077 (store mapRest!37086 mapKey!37086 mapValue!37086))))

(declare-fun condMapEmpty!37086 () Bool)

(declare-fun mapDefault!37086 () ValueCell!11189)

(assert (=> mapNonEmpty!37077 (= condMapEmpty!37086 (= mapRest!37077 ((as const (Array (_ BitVec 32) ValueCell!11189)) mapDefault!37086)))))

(declare-fun e!559197 () Bool)

(assert (=> mapNonEmpty!37077 (= tp!70149 (and e!559197 mapRes!37086))))

(declare-fun b!991478 () Bool)

(assert (=> b!991478 (= e!559197 tp_is_empty!23341)))

(declare-fun mapIsEmpty!37086 () Bool)

(assert (=> mapIsEmpty!37086 mapRes!37086))

(assert (= (and mapNonEmpty!37077 condMapEmpty!37086) mapIsEmpty!37086))

(assert (= (and mapNonEmpty!37077 (not condMapEmpty!37086)) mapNonEmpty!37086))

(assert (= (and mapNonEmpty!37086 ((_ is ValueCellFull!11189) mapValue!37086)) b!991477))

(assert (= (and mapNonEmpty!37077 ((_ is ValueCellFull!11189) mapDefault!37086)) b!991478))

(declare-fun m!918805 () Bool)

(assert (=> mapNonEmpty!37086 m!918805))

(check-sat (not b!991461) (not b!991470) (not b!991464) (not mapNonEmpty!37086) (not bm!42053) (not b!991469) tp_is_empty!23341)
(check-sat)
