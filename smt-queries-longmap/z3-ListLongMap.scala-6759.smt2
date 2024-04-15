; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84794 () Bool)

(assert start!84794)

(declare-fun res!662659 () Bool)

(declare-fun e!559026 () Bool)

(assert (=> start!84794 (=> (not res!662659) (not e!559026))))

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84794 (= res!662659 (validMask!0 mask!2471))))

(assert (=> start!84794 e!559026))

(assert (=> start!84794 true))

(declare-datatypes ((V!36089 0))(
  ( (V!36090 (val!11715 Int)) )
))
(declare-datatypes ((ValueCell!11183 0))(
  ( (ValueCellFull!11183 (v!14290 V!36089)) (EmptyCell!11183) )
))
(declare-datatypes ((array!62554 0))(
  ( (array!62555 (arr!30126 (Array (_ BitVec 32) ValueCell!11183)) (size!30607 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62554)

(declare-fun e!559022 () Bool)

(declare-fun array_inv!23281 (array!62554) Bool)

(assert (=> start!84794 (and (array_inv!23281 _values!1551) e!559022)))

(declare-datatypes ((array!62556 0))(
  ( (array!62557 (arr!30127 (Array (_ BitVec 32) (_ BitVec 64))) (size!30608 (_ BitVec 32))) )
))
(declare-fun _keys!1945 () array!62556)

(declare-fun array_inv!23282 (array!62556) Bool)

(assert (=> start!84794 (array_inv!23282 _keys!1945)))

(declare-fun mapNonEmpty!37053 () Bool)

(declare-fun mapRes!37053 () Bool)

(declare-fun tp!70125 () Bool)

(declare-fun e!559025 () Bool)

(assert (=> mapNonEmpty!37053 (= mapRes!37053 (and tp!70125 e!559025))))

(declare-fun mapKey!37053 () (_ BitVec 32))

(declare-fun mapValue!37053 () ValueCell!11183)

(declare-fun mapRest!37053 () (Array (_ BitVec 32) ValueCell!11183))

(assert (=> mapNonEmpty!37053 (= (arr!30126 _values!1551) (store mapRest!37053 mapKey!37053 mapValue!37053))))

(declare-fun b!991254 () Bool)

(declare-fun e!559024 () Bool)

(declare-fun tp_is_empty!23329 () Bool)

(assert (=> b!991254 (= e!559024 tp_is_empty!23329)))

(declare-fun b!991255 () Bool)

(assert (=> b!991255 (= e!559026 (bvsgt #b00000000000000000000000000000000 (size!30608 _keys!1945)))))

(declare-fun b!991256 () Bool)

(assert (=> b!991256 (= e!559022 (and e!559024 mapRes!37053))))

(declare-fun condMapEmpty!37053 () Bool)

(declare-fun mapDefault!37053 () ValueCell!11183)

(assert (=> b!991256 (= condMapEmpty!37053 (= (arr!30126 _values!1551) ((as const (Array (_ BitVec 32) ValueCell!11183)) mapDefault!37053)))))

(declare-fun b!991257 () Bool)

(declare-fun res!662660 () Bool)

(assert (=> b!991257 (=> (not res!662660) (not e!559026))))

(declare-fun extraKeys!1472 () (_ BitVec 32))

(assert (=> b!991257 (= res!662660 (and (= (size!30607 _values!1551) (bvadd #b00000000000000000000000000000001 mask!2471)) (= (size!30608 _keys!1945) (size!30607 _values!1551)) (bvsge mask!2471 #b00000000000000000000000000000000) (bvsge extraKeys!1472 #b00000000000000000000000000000000) (bvsle extraKeys!1472 #b00000000000000000000000000000011)))))

(declare-fun b!991258 () Bool)

(assert (=> b!991258 (= e!559025 tp_is_empty!23329)))

(declare-fun mapIsEmpty!37053 () Bool)

(assert (=> mapIsEmpty!37053 mapRes!37053))

(declare-fun b!991259 () Bool)

(declare-fun res!662658 () Bool)

(assert (=> b!991259 (=> (not res!662658) (not e!559026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62556 (_ BitVec 32)) Bool)

(assert (=> b!991259 (= res!662658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471))))

(assert (= (and start!84794 res!662659) b!991257))

(assert (= (and b!991257 res!662660) b!991259))

(assert (= (and b!991259 res!662658) b!991255))

(assert (= (and b!991256 condMapEmpty!37053) mapIsEmpty!37053))

(assert (= (and b!991256 (not condMapEmpty!37053)) mapNonEmpty!37053))

(get-info :version)

(assert (= (and mapNonEmpty!37053 ((_ is ValueCellFull!11183) mapValue!37053)) b!991258))

(assert (= (and b!991256 ((_ is ValueCellFull!11183) mapDefault!37053)) b!991254))

(assert (= start!84794 b!991256))

(declare-fun m!918665 () Bool)

(assert (=> start!84794 m!918665))

(declare-fun m!918667 () Bool)

(assert (=> start!84794 m!918667))

(declare-fun m!918669 () Bool)

(assert (=> start!84794 m!918669))

(declare-fun m!918671 () Bool)

(assert (=> mapNonEmpty!37053 m!918671))

(declare-fun m!918673 () Bool)

(assert (=> b!991259 m!918673))

(check-sat (not start!84794) (not b!991259) (not mapNonEmpty!37053) tp_is_empty!23329)
(check-sat)
(get-model)

(declare-fun d!117749 () Bool)

(assert (=> d!117749 (= (validMask!0 mask!2471) (and (or (= mask!2471 #b00000000000000000000000000000111) (= mask!2471 #b00000000000000000000000000001111) (= mask!2471 #b00000000000000000000000000011111) (= mask!2471 #b00000000000000000000000000111111) (= mask!2471 #b00000000000000000000000001111111) (= mask!2471 #b00000000000000000000000011111111) (= mask!2471 #b00000000000000000000000111111111) (= mask!2471 #b00000000000000000000001111111111) (= mask!2471 #b00000000000000000000011111111111) (= mask!2471 #b00000000000000000000111111111111) (= mask!2471 #b00000000000000000001111111111111) (= mask!2471 #b00000000000000000011111111111111) (= mask!2471 #b00000000000000000111111111111111) (= mask!2471 #b00000000000000001111111111111111) (= mask!2471 #b00000000000000011111111111111111) (= mask!2471 #b00000000000000111111111111111111) (= mask!2471 #b00000000000001111111111111111111) (= mask!2471 #b00000000000011111111111111111111) (= mask!2471 #b00000000000111111111111111111111) (= mask!2471 #b00000000001111111111111111111111) (= mask!2471 #b00000000011111111111111111111111) (= mask!2471 #b00000000111111111111111111111111) (= mask!2471 #b00000001111111111111111111111111) (= mask!2471 #b00000011111111111111111111111111) (= mask!2471 #b00000111111111111111111111111111) (= mask!2471 #b00001111111111111111111111111111) (= mask!2471 #b00011111111111111111111111111111) (= mask!2471 #b00111111111111111111111111111111)) (bvsle mask!2471 #b00111111111111111111111111111111)))))

(assert (=> start!84794 d!117749))

(declare-fun d!117751 () Bool)

(assert (=> d!117751 (= (array_inv!23281 _values!1551) (bvsge (size!30607 _values!1551) #b00000000000000000000000000000000))))

(assert (=> start!84794 d!117751))

(declare-fun d!117753 () Bool)

(assert (=> d!117753 (= (array_inv!23282 _keys!1945) (bvsge (size!30608 _keys!1945) #b00000000000000000000000000000000))))

(assert (=> start!84794 d!117753))

(declare-fun bm!42047 () Bool)

(declare-fun call!42050 () Bool)

(assert (=> bm!42047 (= call!42050 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1945 mask!2471))))

(declare-fun d!117755 () Bool)

(declare-fun res!662684 () Bool)

(declare-fun e!559063 () Bool)

(assert (=> d!117755 (=> res!662684 e!559063)))

(assert (=> d!117755 (= res!662684 (bvsge #b00000000000000000000000000000000 (size!30608 _keys!1945)))))

(assert (=> d!117755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1945 mask!2471) e!559063)))

(declare-fun b!991304 () Bool)

(declare-fun e!559064 () Bool)

(assert (=> b!991304 (= e!559064 call!42050)))

(declare-fun b!991305 () Bool)

(declare-fun e!559065 () Bool)

(assert (=> b!991305 (= e!559063 e!559065)))

(declare-fun c!100562 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991305 (= c!100562 (validKeyInArray!0 (select (arr!30127 _keys!1945) #b00000000000000000000000000000000)))))

(declare-fun b!991306 () Bool)

(assert (=> b!991306 (= e!559065 call!42050)))

(declare-fun b!991307 () Bool)

(assert (=> b!991307 (= e!559065 e!559064)))

(declare-fun lt!439755 () (_ BitVec 64))

(assert (=> b!991307 (= lt!439755 (select (arr!30127 _keys!1945) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32767 0))(
  ( (Unit!32768) )
))
(declare-fun lt!439756 () Unit!32767)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62556 (_ BitVec 64) (_ BitVec 32)) Unit!32767)

(assert (=> b!991307 (= lt!439756 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1945 lt!439755 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!62556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!991307 (arrayContainsKey!0 _keys!1945 lt!439755 #b00000000000000000000000000000000)))

(declare-fun lt!439754 () Unit!32767)

(assert (=> b!991307 (= lt!439754 lt!439756)))

(declare-fun res!662683 () Bool)

(declare-datatypes ((SeekEntryResult!9209 0))(
  ( (MissingZero!9209 (index!39207 (_ BitVec 32))) (Found!9209 (index!39208 (_ BitVec 32))) (Intermediate!9209 (undefined!10021 Bool) (index!39209 (_ BitVec 32)) (x!86255 (_ BitVec 32))) (Undefined!9209) (MissingVacant!9209 (index!39210 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62556 (_ BitVec 32)) SeekEntryResult!9209)

(assert (=> b!991307 (= res!662683 (= (seekEntryOrOpen!0 (select (arr!30127 _keys!1945) #b00000000000000000000000000000000) _keys!1945 mask!2471) (Found!9209 #b00000000000000000000000000000000)))))

(assert (=> b!991307 (=> (not res!662683) (not e!559064))))

(assert (= (and d!117755 (not res!662684)) b!991305))

(assert (= (and b!991305 c!100562) b!991307))

(assert (= (and b!991305 (not c!100562)) b!991306))

(assert (= (and b!991307 res!662683) b!991304))

(assert (= (or b!991304 b!991306) bm!42047))

(declare-fun m!918695 () Bool)

(assert (=> bm!42047 m!918695))

(declare-fun m!918697 () Bool)

(assert (=> b!991305 m!918697))

(assert (=> b!991305 m!918697))

(declare-fun m!918699 () Bool)

(assert (=> b!991305 m!918699))

(assert (=> b!991307 m!918697))

(declare-fun m!918701 () Bool)

(assert (=> b!991307 m!918701))

(declare-fun m!918703 () Bool)

(assert (=> b!991307 m!918703))

(assert (=> b!991307 m!918697))

(declare-fun m!918705 () Bool)

(assert (=> b!991307 m!918705))

(assert (=> b!991259 d!117755))

(declare-fun b!991314 () Bool)

(declare-fun e!559071 () Bool)

(assert (=> b!991314 (= e!559071 tp_is_empty!23329)))

(declare-fun mapIsEmpty!37062 () Bool)

(declare-fun mapRes!37062 () Bool)

(assert (=> mapIsEmpty!37062 mapRes!37062))

(declare-fun b!991315 () Bool)

(declare-fun e!559070 () Bool)

(assert (=> b!991315 (= e!559070 tp_is_empty!23329)))

(declare-fun condMapEmpty!37062 () Bool)

(declare-fun mapDefault!37062 () ValueCell!11183)

(assert (=> mapNonEmpty!37053 (= condMapEmpty!37062 (= mapRest!37053 ((as const (Array (_ BitVec 32) ValueCell!11183)) mapDefault!37062)))))

(assert (=> mapNonEmpty!37053 (= tp!70125 (and e!559070 mapRes!37062))))

(declare-fun mapNonEmpty!37062 () Bool)

(declare-fun tp!70134 () Bool)

(assert (=> mapNonEmpty!37062 (= mapRes!37062 (and tp!70134 e!559071))))

(declare-fun mapRest!37062 () (Array (_ BitVec 32) ValueCell!11183))

(declare-fun mapKey!37062 () (_ BitVec 32))

(declare-fun mapValue!37062 () ValueCell!11183)

(assert (=> mapNonEmpty!37062 (= mapRest!37053 (store mapRest!37062 mapKey!37062 mapValue!37062))))

(assert (= (and mapNonEmpty!37053 condMapEmpty!37062) mapIsEmpty!37062))

(assert (= (and mapNonEmpty!37053 (not condMapEmpty!37062)) mapNonEmpty!37062))

(assert (= (and mapNonEmpty!37062 ((_ is ValueCellFull!11183) mapValue!37062)) b!991314))

(assert (= (and mapNonEmpty!37053 ((_ is ValueCellFull!11183) mapDefault!37062)) b!991315))

(declare-fun m!918707 () Bool)

(assert (=> mapNonEmpty!37062 m!918707))

(check-sat (not bm!42047) (not b!991307) (not mapNonEmpty!37062) tp_is_empty!23329 (not b!991305))
(check-sat)
