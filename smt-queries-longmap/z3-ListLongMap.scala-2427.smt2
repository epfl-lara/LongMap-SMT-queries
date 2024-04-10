; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38322 () Bool)

(assert start!38322)

(declare-fun b!395257 () Bool)

(declare-fun e!239301 () Bool)

(declare-fun tp_is_empty!9801 () Bool)

(assert (=> b!395257 (= e!239301 tp_is_empty!9801)))

(declare-fun mapIsEmpty!16311 () Bool)

(declare-fun mapRes!16311 () Bool)

(assert (=> mapIsEmpty!16311 mapRes!16311))

(declare-fun b!395258 () Bool)

(declare-fun res!226590 () Bool)

(declare-fun e!239305 () Bool)

(assert (=> b!395258 (=> (not res!226590) (not e!239305))))

(declare-datatypes ((array!23507 0))(
  ( (array!23508 (arr!11207 (Array (_ BitVec 32) (_ BitVec 64))) (size!11559 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23507)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!14173 0))(
  ( (V!14174 (val!4945 Int)) )
))
(declare-datatypes ((ValueCell!4557 0))(
  ( (ValueCellFull!4557 (v!7191 V!14173)) (EmptyCell!4557) )
))
(declare-datatypes ((array!23509 0))(
  ( (array!23510 (arr!11208 (Array (_ BitVec 32) ValueCell!4557)) (size!11560 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23509)

(assert (=> b!395258 (= res!226590 (and (= (size!11560 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11559 _keys!709) (size!11560 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16311 () Bool)

(declare-fun tp!32106 () Bool)

(assert (=> mapNonEmpty!16311 (= mapRes!16311 (and tp!32106 e!239301))))

(declare-fun mapValue!16311 () ValueCell!4557)

(declare-fun mapKey!16311 () (_ BitVec 32))

(declare-fun mapRest!16311 () (Array (_ BitVec 32) ValueCell!4557))

(assert (=> mapNonEmpty!16311 (= (arr!11208 _values!549) (store mapRest!16311 mapKey!16311 mapValue!16311))))

(declare-fun b!395259 () Bool)

(declare-fun e!239304 () Bool)

(assert (=> b!395259 (= e!239304 tp_is_empty!9801)))

(declare-fun b!395260 () Bool)

(declare-fun res!226592 () Bool)

(assert (=> b!395260 (=> (not res!226592) (not e!239305))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395260 (= res!226592 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11559 _keys!709))))))

(declare-fun b!395261 () Bool)

(declare-fun e!239303 () Bool)

(assert (=> b!395261 (= e!239303 (and e!239304 mapRes!16311))))

(declare-fun condMapEmpty!16311 () Bool)

(declare-fun mapDefault!16311 () ValueCell!4557)

(assert (=> b!395261 (= condMapEmpty!16311 (= (arr!11208 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4557)) mapDefault!16311)))))

(declare-fun res!226588 () Bool)

(assert (=> start!38322 (=> (not res!226588) (not e!239305))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38322 (= res!226588 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11559 _keys!709))))))

(assert (=> start!38322 e!239305))

(assert (=> start!38322 true))

(declare-fun array_inv!8226 (array!23509) Bool)

(assert (=> start!38322 (and (array_inv!8226 _values!549) e!239303)))

(declare-fun array_inv!8227 (array!23507) Bool)

(assert (=> start!38322 (array_inv!8227 _keys!709)))

(declare-fun b!395262 () Bool)

(declare-fun res!226591 () Bool)

(assert (=> b!395262 (=> (not res!226591) (not e!239305))))

(declare-datatypes ((List!6507 0))(
  ( (Nil!6504) (Cons!6503 (h!7359 (_ BitVec 64)) (t!11681 List!6507)) )
))
(declare-fun arrayNoDuplicates!0 (array!23507 (_ BitVec 32) List!6507) Bool)

(assert (=> b!395262 (= res!226591 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6504))))

(declare-fun b!395263 () Bool)

(declare-fun res!226589 () Bool)

(assert (=> b!395263 (=> (not res!226589) (not e!239305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23507 (_ BitVec 32)) Bool)

(assert (=> b!395263 (= res!226589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395264 () Bool)

(declare-fun res!226594 () Bool)

(assert (=> b!395264 (=> (not res!226594) (not e!239305))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395264 (= res!226594 (validKeyInArray!0 k0!794))))

(declare-fun b!395265 () Bool)

(declare-fun res!226593 () Bool)

(assert (=> b!395265 (=> (not res!226593) (not e!239305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395265 (= res!226593 (validMask!0 mask!1025))))

(declare-fun b!395266 () Bool)

(assert (=> b!395266 (= e!239305 (and (or (= (select (arr!11207 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11207 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt #b00000000000000000000000000000000 (size!11559 _keys!709)) (bvsge (size!11559 _keys!709) #b01111111111111111111111111111111)))))

(assert (= (and start!38322 res!226588) b!395265))

(assert (= (and b!395265 res!226593) b!395258))

(assert (= (and b!395258 res!226590) b!395263))

(assert (= (and b!395263 res!226589) b!395262))

(assert (= (and b!395262 res!226591) b!395260))

(assert (= (and b!395260 res!226592) b!395264))

(assert (= (and b!395264 res!226594) b!395266))

(assert (= (and b!395261 condMapEmpty!16311) mapIsEmpty!16311))

(assert (= (and b!395261 (not condMapEmpty!16311)) mapNonEmpty!16311))

(get-info :version)

(assert (= (and mapNonEmpty!16311 ((_ is ValueCellFull!4557) mapValue!16311)) b!395257))

(assert (= (and b!395261 ((_ is ValueCellFull!4557) mapDefault!16311)) b!395259))

(assert (= start!38322 b!395261))

(declare-fun m!391391 () Bool)

(assert (=> b!395263 m!391391))

(declare-fun m!391393 () Bool)

(assert (=> b!395265 m!391393))

(declare-fun m!391395 () Bool)

(assert (=> b!395266 m!391395))

(declare-fun m!391397 () Bool)

(assert (=> b!395262 m!391397))

(declare-fun m!391399 () Bool)

(assert (=> b!395264 m!391399))

(declare-fun m!391401 () Bool)

(assert (=> start!38322 m!391401))

(declare-fun m!391403 () Bool)

(assert (=> start!38322 m!391403))

(declare-fun m!391405 () Bool)

(assert (=> mapNonEmpty!16311 m!391405))

(check-sat (not b!395265) (not mapNonEmpty!16311) (not b!395264) (not b!395263) tp_is_empty!9801 (not b!395262) (not start!38322))
(check-sat)
(get-model)

(declare-fun d!73333 () Bool)

(declare-fun res!226621 () Bool)

(declare-fun e!239327 () Bool)

(assert (=> d!73333 (=> res!226621 e!239327)))

(assert (=> d!73333 (= res!226621 (bvsge #b00000000000000000000000000000000 (size!11559 _keys!709)))))

(assert (=> d!73333 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!239327)))

(declare-fun b!395305 () Bool)

(declare-fun e!239329 () Bool)

(assert (=> b!395305 (= e!239327 e!239329)))

(declare-fun c!54548 () Bool)

(assert (=> b!395305 (= c!54548 (validKeyInArray!0 (select (arr!11207 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395306 () Bool)

(declare-fun call!27872 () Bool)

(assert (=> b!395306 (= e!239329 call!27872)))

(declare-fun b!395307 () Bool)

(declare-fun e!239328 () Bool)

(assert (=> b!395307 (= e!239329 e!239328)))

(declare-fun lt!187073 () (_ BitVec 64))

(assert (=> b!395307 (= lt!187073 (select (arr!11207 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12070 0))(
  ( (Unit!12071) )
))
(declare-fun lt!187074 () Unit!12070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23507 (_ BitVec 64) (_ BitVec 32)) Unit!12070)

(assert (=> b!395307 (= lt!187074 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!187073 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!395307 (arrayContainsKey!0 _keys!709 lt!187073 #b00000000000000000000000000000000)))

(declare-fun lt!187075 () Unit!12070)

(assert (=> b!395307 (= lt!187075 lt!187074)))

(declare-fun res!226620 () Bool)

(declare-datatypes ((SeekEntryResult!3523 0))(
  ( (MissingZero!3523 (index!16271 (_ BitVec 32))) (Found!3523 (index!16272 (_ BitVec 32))) (Intermediate!3523 (undefined!4335 Bool) (index!16273 (_ BitVec 32)) (x!38621 (_ BitVec 32))) (Undefined!3523) (MissingVacant!3523 (index!16274 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23507 (_ BitVec 32)) SeekEntryResult!3523)

(assert (=> b!395307 (= res!226620 (= (seekEntryOrOpen!0 (select (arr!11207 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3523 #b00000000000000000000000000000000)))))

(assert (=> b!395307 (=> (not res!226620) (not e!239328))))

(declare-fun bm!27869 () Bool)

(assert (=> bm!27869 (= call!27872 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!395308 () Bool)

(assert (=> b!395308 (= e!239328 call!27872)))

(assert (= (and d!73333 (not res!226621)) b!395305))

(assert (= (and b!395305 c!54548) b!395307))

(assert (= (and b!395305 (not c!54548)) b!395306))

(assert (= (and b!395307 res!226620) b!395308))

(assert (= (or b!395308 b!395306) bm!27869))

(declare-fun m!391423 () Bool)

(assert (=> b!395305 m!391423))

(assert (=> b!395305 m!391423))

(declare-fun m!391425 () Bool)

(assert (=> b!395305 m!391425))

(assert (=> b!395307 m!391423))

(declare-fun m!391427 () Bool)

(assert (=> b!395307 m!391427))

(declare-fun m!391429 () Bool)

(assert (=> b!395307 m!391429))

(assert (=> b!395307 m!391423))

(declare-fun m!391431 () Bool)

(assert (=> b!395307 m!391431))

(declare-fun m!391433 () Bool)

(assert (=> bm!27869 m!391433))

(assert (=> b!395263 d!73333))

(declare-fun d!73335 () Bool)

(assert (=> d!73335 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!395264 d!73335))

(declare-fun b!395319 () Bool)

(declare-fun e!239338 () Bool)

(declare-fun call!27875 () Bool)

(assert (=> b!395319 (= e!239338 call!27875)))

(declare-fun b!395320 () Bool)

(declare-fun e!239340 () Bool)

(declare-fun e!239341 () Bool)

(assert (=> b!395320 (= e!239340 e!239341)))

(declare-fun res!226630 () Bool)

(assert (=> b!395320 (=> (not res!226630) (not e!239341))))

(declare-fun e!239339 () Bool)

(assert (=> b!395320 (= res!226630 (not e!239339))))

(declare-fun res!226629 () Bool)

(assert (=> b!395320 (=> (not res!226629) (not e!239339))))

(assert (=> b!395320 (= res!226629 (validKeyInArray!0 (select (arr!11207 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395321 () Bool)

(assert (=> b!395321 (= e!239338 call!27875)))

(declare-fun d!73337 () Bool)

(declare-fun res!226628 () Bool)

(assert (=> d!73337 (=> res!226628 e!239340)))

(assert (=> d!73337 (= res!226628 (bvsge #b00000000000000000000000000000000 (size!11559 _keys!709)))))

(assert (=> d!73337 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6504) e!239340)))

(declare-fun b!395322 () Bool)

(declare-fun contains!2480 (List!6507 (_ BitVec 64)) Bool)

(assert (=> b!395322 (= e!239339 (contains!2480 Nil!6504 (select (arr!11207 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!395323 () Bool)

(assert (=> b!395323 (= e!239341 e!239338)))

(declare-fun c!54551 () Bool)

(assert (=> b!395323 (= c!54551 (validKeyInArray!0 (select (arr!11207 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!27872 () Bool)

(assert (=> bm!27872 (= call!27875 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54551 (Cons!6503 (select (arr!11207 _keys!709) #b00000000000000000000000000000000) Nil!6504) Nil!6504)))))

(assert (= (and d!73337 (not res!226628)) b!395320))

(assert (= (and b!395320 res!226629) b!395322))

(assert (= (and b!395320 res!226630) b!395323))

(assert (= (and b!395323 c!54551) b!395321))

(assert (= (and b!395323 (not c!54551)) b!395319))

(assert (= (or b!395321 b!395319) bm!27872))

(assert (=> b!395320 m!391423))

(assert (=> b!395320 m!391423))

(assert (=> b!395320 m!391425))

(assert (=> b!395322 m!391423))

(assert (=> b!395322 m!391423))

(declare-fun m!391435 () Bool)

(assert (=> b!395322 m!391435))

(assert (=> b!395323 m!391423))

(assert (=> b!395323 m!391423))

(assert (=> b!395323 m!391425))

(assert (=> bm!27872 m!391423))

(declare-fun m!391437 () Bool)

(assert (=> bm!27872 m!391437))

(assert (=> b!395262 d!73337))

(declare-fun d!73339 () Bool)

(assert (=> d!73339 (= (array_inv!8226 _values!549) (bvsge (size!11560 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38322 d!73339))

(declare-fun d!73341 () Bool)

(assert (=> d!73341 (= (array_inv!8227 _keys!709) (bvsge (size!11559 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38322 d!73341))

(declare-fun d!73343 () Bool)

(assert (=> d!73343 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!395265 d!73343))

(declare-fun mapNonEmpty!16317 () Bool)

(declare-fun mapRes!16317 () Bool)

(declare-fun tp!32112 () Bool)

(declare-fun e!239346 () Bool)

(assert (=> mapNonEmpty!16317 (= mapRes!16317 (and tp!32112 e!239346))))

(declare-fun mapKey!16317 () (_ BitVec 32))

(declare-fun mapValue!16317 () ValueCell!4557)

(declare-fun mapRest!16317 () (Array (_ BitVec 32) ValueCell!4557))

(assert (=> mapNonEmpty!16317 (= mapRest!16311 (store mapRest!16317 mapKey!16317 mapValue!16317))))

(declare-fun mapIsEmpty!16317 () Bool)

(assert (=> mapIsEmpty!16317 mapRes!16317))

(declare-fun b!395330 () Bool)

(assert (=> b!395330 (= e!239346 tp_is_empty!9801)))

(declare-fun b!395331 () Bool)

(declare-fun e!239347 () Bool)

(assert (=> b!395331 (= e!239347 tp_is_empty!9801)))

(declare-fun condMapEmpty!16317 () Bool)

(declare-fun mapDefault!16317 () ValueCell!4557)

(assert (=> mapNonEmpty!16311 (= condMapEmpty!16317 (= mapRest!16311 ((as const (Array (_ BitVec 32) ValueCell!4557)) mapDefault!16317)))))

(assert (=> mapNonEmpty!16311 (= tp!32106 (and e!239347 mapRes!16317))))

(assert (= (and mapNonEmpty!16311 condMapEmpty!16317) mapIsEmpty!16317))

(assert (= (and mapNonEmpty!16311 (not condMapEmpty!16317)) mapNonEmpty!16317))

(assert (= (and mapNonEmpty!16317 ((_ is ValueCellFull!4557) mapValue!16317)) b!395330))

(assert (= (and mapNonEmpty!16311 ((_ is ValueCellFull!4557) mapDefault!16317)) b!395331))

(declare-fun m!391439 () Bool)

(assert (=> mapNonEmpty!16317 m!391439))

(check-sat (not b!395320) (not b!395322) tp_is_empty!9801 (not b!395307) (not b!395323) (not b!395305) (not mapNonEmpty!16317) (not bm!27872) (not bm!27869))
(check-sat)
