; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38260 () Bool)

(assert start!38260)

(declare-fun b!394799 () Bool)

(declare-fun res!226322 () Bool)

(declare-fun e!239018 () Bool)

(assert (=> b!394799 (=> (not res!226322) (not e!239018))))

(declare-datatypes ((array!23446 0))(
  ( (array!23447 (arr!11178 (Array (_ BitVec 32) (_ BitVec 64))) (size!11530 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23446)

(assert (=> b!394799 (= res!226322 (and (bvsle #b00000000000000000000000000000000 (size!11530 _keys!709)) (bvslt (size!11530 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394800 () Bool)

(declare-fun res!226323 () Bool)

(assert (=> b!394800 (=> (not res!226323) (not e!239018))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394800 (= res!226323 (validMask!0 mask!1025))))

(declare-fun b!394801 () Bool)

(declare-fun e!239019 () Bool)

(declare-fun e!239015 () Bool)

(declare-fun mapRes!16266 () Bool)

(assert (=> b!394801 (= e!239019 (and e!239015 mapRes!16266))))

(declare-fun condMapEmpty!16266 () Bool)

(declare-datatypes ((V!14139 0))(
  ( (V!14140 (val!4932 Int)) )
))
(declare-datatypes ((ValueCell!4544 0))(
  ( (ValueCellFull!4544 (v!7178 V!14139)) (EmptyCell!4544) )
))
(declare-datatypes ((array!23448 0))(
  ( (array!23449 (arr!11179 (Array (_ BitVec 32) ValueCell!4544)) (size!11531 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23448)

(declare-fun mapDefault!16266 () ValueCell!4544)

(assert (=> b!394801 (= condMapEmpty!16266 (= (arr!11179 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4544)) mapDefault!16266)))))

(declare-fun res!226325 () Bool)

(assert (=> start!38260 (=> (not res!226325) (not e!239018))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38260 (= res!226325 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11530 _keys!709))))))

(assert (=> start!38260 e!239018))

(assert (=> start!38260 true))

(declare-fun array_inv!8262 (array!23448) Bool)

(assert (=> start!38260 (and (array_inv!8262 _values!549) e!239019)))

(declare-fun array_inv!8263 (array!23446) Bool)

(assert (=> start!38260 (array_inv!8263 _keys!709)))

(declare-fun b!394802 () Bool)

(declare-fun res!226321 () Bool)

(assert (=> b!394802 (=> (not res!226321) (not e!239018))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394802 (= res!226321 (and (= (size!11531 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11530 _keys!709) (size!11531 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394803 () Bool)

(declare-fun e!239016 () Bool)

(declare-fun tp_is_empty!9775 () Bool)

(assert (=> b!394803 (= e!239016 tp_is_empty!9775)))

(declare-fun mapNonEmpty!16266 () Bool)

(declare-fun tp!32061 () Bool)

(assert (=> mapNonEmpty!16266 (= mapRes!16266 (and tp!32061 e!239016))))

(declare-fun mapKey!16266 () (_ BitVec 32))

(declare-fun mapRest!16266 () (Array (_ BitVec 32) ValueCell!4544))

(declare-fun mapValue!16266 () ValueCell!4544)

(assert (=> mapNonEmpty!16266 (= (arr!11179 _values!549) (store mapRest!16266 mapKey!16266 mapValue!16266))))

(declare-fun b!394804 () Bool)

(declare-fun res!226324 () Bool)

(assert (=> b!394804 (=> (not res!226324) (not e!239018))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23446 (_ BitVec 32)) Bool)

(assert (=> b!394804 (= res!226324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394805 () Bool)

(assert (=> b!394805 (= e!239015 tp_is_empty!9775)))

(declare-fun mapIsEmpty!16266 () Bool)

(assert (=> mapIsEmpty!16266 mapRes!16266))

(declare-fun b!394806 () Bool)

(declare-datatypes ((List!6360 0))(
  ( (Nil!6357) (Cons!6356 (h!7212 (_ BitVec 64)) (t!11526 List!6360)) )
))
(declare-fun noDuplicate!195 (List!6360) Bool)

(assert (=> b!394806 (= e!239018 (not (noDuplicate!195 Nil!6357)))))

(assert (= (and start!38260 res!226325) b!394800))

(assert (= (and b!394800 res!226323) b!394802))

(assert (= (and b!394802 res!226321) b!394804))

(assert (= (and b!394804 res!226324) b!394799))

(assert (= (and b!394799 res!226322) b!394806))

(assert (= (and b!394801 condMapEmpty!16266) mapIsEmpty!16266))

(assert (= (and b!394801 (not condMapEmpty!16266)) mapNonEmpty!16266))

(get-info :version)

(assert (= (and mapNonEmpty!16266 ((_ is ValueCellFull!4544) mapValue!16266)) b!394803))

(assert (= (and b!394801 ((_ is ValueCellFull!4544) mapDefault!16266)) b!394805))

(assert (= start!38260 b!394801))

(declare-fun m!391391 () Bool)

(assert (=> mapNonEmpty!16266 m!391391))

(declare-fun m!391393 () Bool)

(assert (=> b!394806 m!391393))

(declare-fun m!391395 () Bool)

(assert (=> b!394800 m!391395))

(declare-fun m!391397 () Bool)

(assert (=> start!38260 m!391397))

(declare-fun m!391399 () Bool)

(assert (=> start!38260 m!391399))

(declare-fun m!391401 () Bool)

(assert (=> b!394804 m!391401))

(check-sat (not mapNonEmpty!16266) (not b!394804) tp_is_empty!9775 (not b!394800) (not b!394806) (not start!38260))
(check-sat)
(get-model)

(declare-fun d!73331 () Bool)

(declare-fun res!226360 () Bool)

(declare-fun e!239054 () Bool)

(assert (=> d!73331 (=> res!226360 e!239054)))

(assert (=> d!73331 (= res!226360 ((_ is Nil!6357) Nil!6357))))

(assert (=> d!73331 (= (noDuplicate!195 Nil!6357) e!239054)))

(declare-fun b!394859 () Bool)

(declare-fun e!239055 () Bool)

(assert (=> b!394859 (= e!239054 e!239055)))

(declare-fun res!226361 () Bool)

(assert (=> b!394859 (=> (not res!226361) (not e!239055))))

(declare-fun contains!2455 (List!6360 (_ BitVec 64)) Bool)

(assert (=> b!394859 (= res!226361 (not (contains!2455 (t!11526 Nil!6357) (h!7212 Nil!6357))))))

(declare-fun b!394860 () Bool)

(assert (=> b!394860 (= e!239055 (noDuplicate!195 (t!11526 Nil!6357)))))

(assert (= (and d!73331 (not res!226360)) b!394859))

(assert (= (and b!394859 res!226361) b!394860))

(declare-fun m!391427 () Bool)

(assert (=> b!394859 m!391427))

(declare-fun m!391429 () Bool)

(assert (=> b!394860 m!391429))

(assert (=> b!394806 d!73331))

(declare-fun d!73333 () Bool)

(assert (=> d!73333 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394800 d!73333))

(declare-fun b!394869 () Bool)

(declare-fun e!239064 () Bool)

(declare-fun e!239062 () Bool)

(assert (=> b!394869 (= e!239064 e!239062)))

(declare-fun lt!187061 () (_ BitVec 64))

(assert (=> b!394869 (= lt!187061 (select (arr!11178 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12035 0))(
  ( (Unit!12036) )
))
(declare-fun lt!187063 () Unit!12035)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23446 (_ BitVec 64) (_ BitVec 32)) Unit!12035)

(assert (=> b!394869 (= lt!187063 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187061 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23446 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394869 (arrayContainsKey!0 _keys!709 lt!187061 #b00000000000000000000000000000000)))

(declare-fun lt!187062 () Unit!12035)

(assert (=> b!394869 (= lt!187062 lt!187063)))

(declare-fun res!226366 () Bool)

(declare-datatypes ((SeekEntryResult!3470 0))(
  ( (MissingZero!3470 (index!16059 (_ BitVec 32))) (Found!3470 (index!16060 (_ BitVec 32))) (Intermediate!3470 (undefined!4282 Bool) (index!16061 (_ BitVec 32)) (x!38529 (_ BitVec 32))) (Undefined!3470) (MissingVacant!3470 (index!16062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23446 (_ BitVec 32)) SeekEntryResult!3470)

(assert (=> b!394869 (= res!226366 (= (seekEntryOrOpen!0 (select (arr!11178 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3470 #b00000000000000000000000000000000)))))

(assert (=> b!394869 (=> (not res!226366) (not e!239062))))

(declare-fun d!73335 () Bool)

(declare-fun res!226367 () Bool)

(declare-fun e!239063 () Bool)

(assert (=> d!73335 (=> res!226367 e!239063)))

(assert (=> d!73335 (= res!226367 (bvsge #b00000000000000000000000000000000 (size!11530 _keys!709)))))

(assert (=> d!73335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239063)))

(declare-fun b!394870 () Bool)

(assert (=> b!394870 (= e!239063 e!239064)))

(declare-fun c!54519 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394870 (= c!54519 (validKeyInArray!0 (select (arr!11178 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27850 () Bool)

(declare-fun call!27853 () Bool)

(assert (=> bm!27850 (= call!27853 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!394871 () Bool)

(assert (=> b!394871 (= e!239062 call!27853)))

(declare-fun b!394872 () Bool)

(assert (=> b!394872 (= e!239064 call!27853)))

(assert (= (and d!73335 (not res!226367)) b!394870))

(assert (= (and b!394870 c!54519) b!394869))

(assert (= (and b!394870 (not c!54519)) b!394872))

(assert (= (and b!394869 res!226366) b!394871))

(assert (= (or b!394871 b!394872) bm!27850))

(declare-fun m!391431 () Bool)

(assert (=> b!394869 m!391431))

(declare-fun m!391433 () Bool)

(assert (=> b!394869 m!391433))

(declare-fun m!391435 () Bool)

(assert (=> b!394869 m!391435))

(assert (=> b!394869 m!391431))

(declare-fun m!391437 () Bool)

(assert (=> b!394869 m!391437))

(assert (=> b!394870 m!391431))

(assert (=> b!394870 m!391431))

(declare-fun m!391439 () Bool)

(assert (=> b!394870 m!391439))

(declare-fun m!391441 () Bool)

(assert (=> bm!27850 m!391441))

(assert (=> b!394804 d!73335))

(declare-fun d!73337 () Bool)

(assert (=> d!73337 (= (array_inv!8262 _values!549) (bvsge (size!11531 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38260 d!73337))

(declare-fun d!73339 () Bool)

(assert (=> d!73339 (= (array_inv!8263 _keys!709) (bvsge (size!11530 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38260 d!73339))

(declare-fun b!394880 () Bool)

(declare-fun e!239070 () Bool)

(assert (=> b!394880 (= e!239070 tp_is_empty!9775)))

(declare-fun mapNonEmpty!16275 () Bool)

(declare-fun mapRes!16275 () Bool)

(declare-fun tp!32070 () Bool)

(declare-fun e!239069 () Bool)

(assert (=> mapNonEmpty!16275 (= mapRes!16275 (and tp!32070 e!239069))))

(declare-fun mapRest!16275 () (Array (_ BitVec 32) ValueCell!4544))

(declare-fun mapKey!16275 () (_ BitVec 32))

(declare-fun mapValue!16275 () ValueCell!4544)

(assert (=> mapNonEmpty!16275 (= mapRest!16266 (store mapRest!16275 mapKey!16275 mapValue!16275))))

(declare-fun mapIsEmpty!16275 () Bool)

(assert (=> mapIsEmpty!16275 mapRes!16275))

(declare-fun condMapEmpty!16275 () Bool)

(declare-fun mapDefault!16275 () ValueCell!4544)

(assert (=> mapNonEmpty!16266 (= condMapEmpty!16275 (= mapRest!16266 ((as const (Array (_ BitVec 32) ValueCell!4544)) mapDefault!16275)))))

(assert (=> mapNonEmpty!16266 (= tp!32061 (and e!239070 mapRes!16275))))

(declare-fun b!394879 () Bool)

(assert (=> b!394879 (= e!239069 tp_is_empty!9775)))

(assert (= (and mapNonEmpty!16266 condMapEmpty!16275) mapIsEmpty!16275))

(assert (= (and mapNonEmpty!16266 (not condMapEmpty!16275)) mapNonEmpty!16275))

(assert (= (and mapNonEmpty!16275 ((_ is ValueCellFull!4544) mapValue!16275)) b!394879))

(assert (= (and mapNonEmpty!16266 ((_ is ValueCellFull!4544) mapDefault!16275)) b!394880))

(declare-fun m!391443 () Bool)

(assert (=> mapNonEmpty!16275 m!391443))

(check-sat (not b!394870) (not b!394859) (not b!394860) tp_is_empty!9775 (not b!394869) (not mapNonEmpty!16275) (not bm!27850))
(check-sat)
