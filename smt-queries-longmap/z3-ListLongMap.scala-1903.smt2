; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33894 () Bool)

(assert start!33894)

(declare-fun b_free!7087 () Bool)

(declare-fun b_next!7087 () Bool)

(assert (=> start!33894 (= b_free!7087 (not b_next!7087))))

(declare-fun tp!24774 () Bool)

(declare-fun b_and!14247 () Bool)

(assert (=> start!33894 (= tp!24774 b_and!14247)))

(declare-fun b!337491 () Bool)

(declare-datatypes ((Unit!10458 0))(
  ( (Unit!10459) )
))
(declare-fun e!207074 () Unit!10458)

(declare-fun Unit!10460 () Unit!10458)

(assert (=> b!337491 (= e!207074 Unit!10460)))

(declare-fun b!337492 () Bool)

(declare-fun e!207076 () Bool)

(declare-fun tp_is_empty!7039 () Bool)

(assert (=> b!337492 (= e!207076 tp_is_empty!7039)))

(declare-fun b!337493 () Bool)

(declare-fun res!186490 () Bool)

(declare-fun e!207070 () Bool)

(assert (=> b!337493 (=> (not res!186490) (not e!207070))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10363 0))(
  ( (V!10364 (val!3564 Int)) )
))
(declare-fun zeroValue!1467 () V!10363)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3176 0))(
  ( (ValueCellFull!3176 (v!5723 V!10363)) (EmptyCell!3176) )
))
(declare-datatypes ((array!17653 0))(
  ( (array!17654 (arr!8354 (Array (_ BitVec 32) ValueCell!3176)) (size!8707 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17653)

(declare-datatypes ((array!17655 0))(
  ( (array!17656 (arr!8355 (Array (_ BitVec 32) (_ BitVec 64))) (size!8708 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17655)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10363)

(declare-datatypes ((tuple2!5118 0))(
  ( (tuple2!5119 (_1!2570 (_ BitVec 64)) (_2!2570 V!10363)) )
))
(declare-datatypes ((List!4752 0))(
  ( (Nil!4749) (Cons!4748 (h!5604 tuple2!5118) (t!9837 List!4752)) )
))
(declare-datatypes ((ListLongMap!4021 0))(
  ( (ListLongMap!4022 (toList!2026 List!4752)) )
))
(declare-fun contains!2084 (ListLongMap!4021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1532 (array!17655 array!17653 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 32) Int) ListLongMap!4021)

(assert (=> b!337493 (= res!186490 (not (contains!2084 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337494 () Bool)

(declare-fun res!186486 () Bool)

(assert (=> b!337494 (=> (not res!186486) (not e!207070))))

(declare-datatypes ((List!4753 0))(
  ( (Nil!4750) (Cons!4749 (h!5605 (_ BitVec 64)) (t!9838 List!4753)) )
))
(declare-fun arrayNoDuplicates!0 (array!17655 (_ BitVec 32) List!4753) Bool)

(assert (=> b!337494 (= res!186486 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4750))))

(declare-fun b!337495 () Bool)

(declare-fun Unit!10461 () Unit!10458)

(assert (=> b!337495 (= e!207074 Unit!10461)))

(declare-fun lt!160269 () Unit!10458)

(declare-fun lemmaArrayContainsKeyThenInListMap!268 (array!17655 array!17653 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 64) (_ BitVec 32) Int) Unit!10458)

(declare-fun arrayScanForKey!0 (array!17655 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337495 (= lt!160269 (lemmaArrayContainsKeyThenInListMap!268 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337495 false))

(declare-fun b!337496 () Bool)

(declare-fun e!207075 () Bool)

(assert (=> b!337496 (= e!207070 e!207075)))

(declare-fun res!186488 () Bool)

(assert (=> b!337496 (=> (not res!186488) (not e!207075))))

(declare-datatypes ((SeekEntryResult!3228 0))(
  ( (MissingZero!3228 (index!15091 (_ BitVec 32))) (Found!3228 (index!15092 (_ BitVec 32))) (Intermediate!3228 (undefined!4040 Bool) (index!15093 (_ BitVec 32)) (x!33659 (_ BitVec 32))) (Undefined!3228) (MissingVacant!3228 (index!15094 (_ BitVec 32))) )
))
(declare-fun lt!160267 () SeekEntryResult!3228)

(get-info :version)

(assert (=> b!337496 (= res!186488 (and (not ((_ is Found!3228) lt!160267)) ((_ is MissingZero!3228) lt!160267)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17655 (_ BitVec 32)) SeekEntryResult!3228)

(assert (=> b!337496 (= lt!160267 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337497 () Bool)

(assert (=> b!337497 (= e!207075 (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun lt!160268 () Unit!10458)

(assert (=> b!337497 (= lt!160268 e!207074)))

(declare-fun c!52241 () Bool)

(declare-fun arrayContainsKey!0 (array!17655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337497 (= c!52241 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337498 () Bool)

(declare-fun e!207071 () Bool)

(declare-fun mapRes!11964 () Bool)

(assert (=> b!337498 (= e!207071 (and e!207076 mapRes!11964))))

(declare-fun condMapEmpty!11964 () Bool)

(declare-fun mapDefault!11964 () ValueCell!3176)

(assert (=> b!337498 (= condMapEmpty!11964 (= (arr!8354 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3176)) mapDefault!11964)))))

(declare-fun mapIsEmpty!11964 () Bool)

(assert (=> mapIsEmpty!11964 mapRes!11964))

(declare-fun b!337499 () Bool)

(declare-fun e!207073 () Bool)

(assert (=> b!337499 (= e!207073 tp_is_empty!7039)))

(declare-fun res!186491 () Bool)

(assert (=> start!33894 (=> (not res!186491) (not e!207070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33894 (= res!186491 (validMask!0 mask!2385))))

(assert (=> start!33894 e!207070))

(assert (=> start!33894 true))

(assert (=> start!33894 tp_is_empty!7039))

(assert (=> start!33894 tp!24774))

(declare-fun array_inv!6228 (array!17653) Bool)

(assert (=> start!33894 (and (array_inv!6228 _values!1525) e!207071)))

(declare-fun array_inv!6229 (array!17655) Bool)

(assert (=> start!33894 (array_inv!6229 _keys!1895)))

(declare-fun mapNonEmpty!11964 () Bool)

(declare-fun tp!24773 () Bool)

(assert (=> mapNonEmpty!11964 (= mapRes!11964 (and tp!24773 e!207073))))

(declare-fun mapKey!11964 () (_ BitVec 32))

(declare-fun mapValue!11964 () ValueCell!3176)

(declare-fun mapRest!11964 () (Array (_ BitVec 32) ValueCell!3176))

(assert (=> mapNonEmpty!11964 (= (arr!8354 _values!1525) (store mapRest!11964 mapKey!11964 mapValue!11964))))

(declare-fun b!337500 () Bool)

(declare-fun res!186489 () Bool)

(assert (=> b!337500 (=> (not res!186489) (not e!207070))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17655 (_ BitVec 32)) Bool)

(assert (=> b!337500 (= res!186489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!337501 () Bool)

(declare-fun res!186487 () Bool)

(assert (=> b!337501 (=> (not res!186487) (not e!207070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337501 (= res!186487 (validKeyInArray!0 k0!1348))))

(declare-fun b!337502 () Bool)

(declare-fun res!186485 () Bool)

(assert (=> b!337502 (=> (not res!186485) (not e!207070))))

(assert (=> b!337502 (= res!186485 (and (= (size!8707 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8708 _keys!1895) (size!8707 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(assert (= (and start!33894 res!186491) b!337502))

(assert (= (and b!337502 res!186485) b!337500))

(assert (= (and b!337500 res!186489) b!337494))

(assert (= (and b!337494 res!186486) b!337501))

(assert (= (and b!337501 res!186487) b!337493))

(assert (= (and b!337493 res!186490) b!337496))

(assert (= (and b!337496 res!186488) b!337497))

(assert (= (and b!337497 c!52241) b!337495))

(assert (= (and b!337497 (not c!52241)) b!337491))

(assert (= (and b!337498 condMapEmpty!11964) mapIsEmpty!11964))

(assert (= (and b!337498 (not condMapEmpty!11964)) mapNonEmpty!11964))

(assert (= (and mapNonEmpty!11964 ((_ is ValueCellFull!3176) mapValue!11964)) b!337499))

(assert (= (and b!337498 ((_ is ValueCellFull!3176) mapDefault!11964)) b!337492))

(assert (= start!33894 b!337498))

(declare-fun m!340471 () Bool)

(assert (=> b!337495 m!340471))

(assert (=> b!337495 m!340471))

(declare-fun m!340473 () Bool)

(assert (=> b!337495 m!340473))

(declare-fun m!340475 () Bool)

(assert (=> b!337496 m!340475))

(declare-fun m!340477 () Bool)

(assert (=> b!337501 m!340477))

(declare-fun m!340479 () Bool)

(assert (=> b!337500 m!340479))

(declare-fun m!340481 () Bool)

(assert (=> start!33894 m!340481))

(declare-fun m!340483 () Bool)

(assert (=> start!33894 m!340483))

(declare-fun m!340485 () Bool)

(assert (=> start!33894 m!340485))

(declare-fun m!340487 () Bool)

(assert (=> b!337493 m!340487))

(assert (=> b!337493 m!340487))

(declare-fun m!340489 () Bool)

(assert (=> b!337493 m!340489))

(declare-fun m!340491 () Bool)

(assert (=> mapNonEmpty!11964 m!340491))

(declare-fun m!340493 () Bool)

(assert (=> b!337494 m!340493))

(declare-fun m!340495 () Bool)

(assert (=> b!337497 m!340495))

(check-sat (not start!33894) (not b_next!7087) (not b!337495) b_and!14247 (not mapNonEmpty!11964) (not b!337500) (not b!337501) (not b!337493) (not b!337497) (not b!337496) tp_is_empty!7039 (not b!337494))
(check-sat b_and!14247 (not b_next!7087))
(get-model)

(declare-fun d!70535 () Bool)

(declare-fun res!186538 () Bool)

(declare-fun e!207123 () Bool)

(assert (=> d!70535 (=> res!186538 e!207123)))

(assert (=> d!70535 (= res!186538 (= (select (arr!8355 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70535 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207123)))

(declare-fun b!337579 () Bool)

(declare-fun e!207124 () Bool)

(assert (=> b!337579 (= e!207123 e!207124)))

(declare-fun res!186539 () Bool)

(assert (=> b!337579 (=> (not res!186539) (not e!207124))))

(assert (=> b!337579 (= res!186539 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8708 _keys!1895)))))

(declare-fun b!337580 () Bool)

(assert (=> b!337580 (= e!207124 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70535 (not res!186538)) b!337579))

(assert (= (and b!337579 res!186539) b!337580))

(declare-fun m!340549 () Bool)

(assert (=> d!70535 m!340549))

(declare-fun m!340551 () Bool)

(assert (=> b!337580 m!340551))

(assert (=> b!337497 d!70535))

(declare-fun d!70537 () Bool)

(assert (=> d!70537 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337501 d!70537))

(declare-fun b!337593 () Bool)

(declare-fun e!207131 () SeekEntryResult!3228)

(declare-fun lt!160294 () SeekEntryResult!3228)

(assert (=> b!337593 (= e!207131 (MissingZero!3228 (index!15093 lt!160294)))))

(declare-fun b!337594 () Bool)

(declare-fun e!207133 () SeekEntryResult!3228)

(declare-fun e!207132 () SeekEntryResult!3228)

(assert (=> b!337594 (= e!207133 e!207132)))

(declare-fun lt!160296 () (_ BitVec 64))

(assert (=> b!337594 (= lt!160296 (select (arr!8355 _keys!1895) (index!15093 lt!160294)))))

(declare-fun c!52255 () Bool)

(assert (=> b!337594 (= c!52255 (= lt!160296 k0!1348))))

(declare-fun b!337595 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17655 (_ BitVec 32)) SeekEntryResult!3228)

(assert (=> b!337595 (= e!207131 (seekKeyOrZeroReturnVacant!0 (x!33659 lt!160294) (index!15093 lt!160294) (index!15093 lt!160294) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!70539 () Bool)

(declare-fun lt!160295 () SeekEntryResult!3228)

(assert (=> d!70539 (and (or ((_ is Undefined!3228) lt!160295) (not ((_ is Found!3228) lt!160295)) (and (bvsge (index!15092 lt!160295) #b00000000000000000000000000000000) (bvslt (index!15092 lt!160295) (size!8708 _keys!1895)))) (or ((_ is Undefined!3228) lt!160295) ((_ is Found!3228) lt!160295) (not ((_ is MissingZero!3228) lt!160295)) (and (bvsge (index!15091 lt!160295) #b00000000000000000000000000000000) (bvslt (index!15091 lt!160295) (size!8708 _keys!1895)))) (or ((_ is Undefined!3228) lt!160295) ((_ is Found!3228) lt!160295) ((_ is MissingZero!3228) lt!160295) (not ((_ is MissingVacant!3228) lt!160295)) (and (bvsge (index!15094 lt!160295) #b00000000000000000000000000000000) (bvslt (index!15094 lt!160295) (size!8708 _keys!1895)))) (or ((_ is Undefined!3228) lt!160295) (ite ((_ is Found!3228) lt!160295) (= (select (arr!8355 _keys!1895) (index!15092 lt!160295)) k0!1348) (ite ((_ is MissingZero!3228) lt!160295) (= (select (arr!8355 _keys!1895) (index!15091 lt!160295)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3228) lt!160295) (= (select (arr!8355 _keys!1895) (index!15094 lt!160295)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70539 (= lt!160295 e!207133)))

(declare-fun c!52256 () Bool)

(assert (=> d!70539 (= c!52256 (and ((_ is Intermediate!3228) lt!160294) (undefined!4040 lt!160294)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17655 (_ BitVec 32)) SeekEntryResult!3228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70539 (= lt!160294 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70539 (validMask!0 mask!2385)))

(assert (=> d!70539 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160295)))

(declare-fun b!337596 () Bool)

(assert (=> b!337596 (= e!207132 (Found!3228 (index!15093 lt!160294)))))

(declare-fun b!337597 () Bool)

(assert (=> b!337597 (= e!207133 Undefined!3228)))

(declare-fun b!337598 () Bool)

(declare-fun c!52254 () Bool)

(assert (=> b!337598 (= c!52254 (= lt!160296 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!337598 (= e!207132 e!207131)))

(assert (= (and d!70539 c!52256) b!337597))

(assert (= (and d!70539 (not c!52256)) b!337594))

(assert (= (and b!337594 c!52255) b!337596))

(assert (= (and b!337594 (not c!52255)) b!337598))

(assert (= (and b!337598 c!52254) b!337593))

(assert (= (and b!337598 (not c!52254)) b!337595))

(declare-fun m!340553 () Bool)

(assert (=> b!337594 m!340553))

(declare-fun m!340555 () Bool)

(assert (=> b!337595 m!340555))

(declare-fun m!340557 () Bool)

(assert (=> d!70539 m!340557))

(declare-fun m!340559 () Bool)

(assert (=> d!70539 m!340559))

(declare-fun m!340561 () Bool)

(assert (=> d!70539 m!340561))

(assert (=> d!70539 m!340481))

(declare-fun m!340563 () Bool)

(assert (=> d!70539 m!340563))

(declare-fun m!340565 () Bool)

(assert (=> d!70539 m!340565))

(assert (=> d!70539 m!340563))

(assert (=> b!337496 d!70539))

(declare-fun b!337607 () Bool)

(declare-fun e!207142 () Bool)

(declare-fun call!26354 () Bool)

(assert (=> b!337607 (= e!207142 call!26354)))

(declare-fun b!337608 () Bool)

(declare-fun e!207141 () Bool)

(assert (=> b!337608 (= e!207141 e!207142)))

(declare-fun c!52259 () Bool)

(assert (=> b!337608 (= c!52259 (validKeyInArray!0 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70541 () Bool)

(declare-fun res!186545 () Bool)

(assert (=> d!70541 (=> res!186545 e!207141)))

(assert (=> d!70541 (= res!186545 (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(assert (=> d!70541 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207141)))

(declare-fun bm!26351 () Bool)

(assert (=> bm!26351 (= call!26354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!337609 () Bool)

(declare-fun e!207140 () Bool)

(assert (=> b!337609 (= e!207142 e!207140)))

(declare-fun lt!160304 () (_ BitVec 64))

(assert (=> b!337609 (= lt!160304 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160305 () Unit!10458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17655 (_ BitVec 64) (_ BitVec 32)) Unit!10458)

(assert (=> b!337609 (= lt!160305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160304 #b00000000000000000000000000000000))))

(assert (=> b!337609 (arrayContainsKey!0 _keys!1895 lt!160304 #b00000000000000000000000000000000)))

(declare-fun lt!160303 () Unit!10458)

(assert (=> b!337609 (= lt!160303 lt!160305)))

(declare-fun res!186544 () Bool)

(assert (=> b!337609 (= res!186544 (= (seekEntryOrOpen!0 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3228 #b00000000000000000000000000000000)))))

(assert (=> b!337609 (=> (not res!186544) (not e!207140))))

(declare-fun b!337610 () Bool)

(assert (=> b!337610 (= e!207140 call!26354)))

(assert (= (and d!70541 (not res!186545)) b!337608))

(assert (= (and b!337608 c!52259) b!337609))

(assert (= (and b!337608 (not c!52259)) b!337607))

(assert (= (and b!337609 res!186544) b!337610))

(assert (= (or b!337610 b!337607) bm!26351))

(assert (=> b!337608 m!340549))

(assert (=> b!337608 m!340549))

(declare-fun m!340567 () Bool)

(assert (=> b!337608 m!340567))

(declare-fun m!340569 () Bool)

(assert (=> bm!26351 m!340569))

(assert (=> b!337609 m!340549))

(declare-fun m!340571 () Bool)

(assert (=> b!337609 m!340571))

(declare-fun m!340573 () Bool)

(assert (=> b!337609 m!340573))

(assert (=> b!337609 m!340549))

(declare-fun m!340575 () Bool)

(assert (=> b!337609 m!340575))

(assert (=> b!337500 d!70541))

(declare-fun d!70543 () Bool)

(assert (=> d!70543 (contains!2084 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160308 () Unit!10458)

(declare-fun choose!1305 (array!17655 array!17653 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 64) (_ BitVec 32) Int) Unit!10458)

(assert (=> d!70543 (= lt!160308 (choose!1305 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70543 (validMask!0 mask!2385)))

(assert (=> d!70543 (= (lemmaArrayContainsKeyThenInListMap!268 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160308)))

(declare-fun bs!11609 () Bool)

(assert (= bs!11609 d!70543))

(assert (=> bs!11609 m!340487))

(assert (=> bs!11609 m!340487))

(assert (=> bs!11609 m!340489))

(assert (=> bs!11609 m!340471))

(declare-fun m!340577 () Bool)

(assert (=> bs!11609 m!340577))

(assert (=> bs!11609 m!340481))

(assert (=> b!337495 d!70543))

(declare-fun d!70545 () Bool)

(declare-fun lt!160311 () (_ BitVec 32))

(assert (=> d!70545 (and (or (bvslt lt!160311 #b00000000000000000000000000000000) (bvsge lt!160311 (size!8708 _keys!1895)) (and (bvsge lt!160311 #b00000000000000000000000000000000) (bvslt lt!160311 (size!8708 _keys!1895)))) (bvsge lt!160311 #b00000000000000000000000000000000) (bvslt lt!160311 (size!8708 _keys!1895)) (= (select (arr!8355 _keys!1895) lt!160311) k0!1348))))

(declare-fun e!207145 () (_ BitVec 32))

(assert (=> d!70545 (= lt!160311 e!207145)))

(declare-fun c!52262 () Bool)

(assert (=> d!70545 (= c!52262 (= (select (arr!8355 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70545 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)) (bvslt (size!8708 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70545 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160311)))

(declare-fun b!337615 () Bool)

(assert (=> b!337615 (= e!207145 #b00000000000000000000000000000000)))

(declare-fun b!337616 () Bool)

(assert (=> b!337616 (= e!207145 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70545 c!52262) b!337615))

(assert (= (and d!70545 (not c!52262)) b!337616))

(declare-fun m!340579 () Bool)

(assert (=> d!70545 m!340579))

(assert (=> d!70545 m!340549))

(declare-fun m!340581 () Bool)

(assert (=> b!337616 m!340581))

(assert (=> b!337495 d!70545))

(declare-fun d!70547 () Bool)

(declare-fun e!207151 () Bool)

(assert (=> d!70547 e!207151))

(declare-fun res!186548 () Bool)

(assert (=> d!70547 (=> res!186548 e!207151)))

(declare-fun lt!160320 () Bool)

(assert (=> d!70547 (= res!186548 (not lt!160320))))

(declare-fun lt!160322 () Bool)

(assert (=> d!70547 (= lt!160320 lt!160322)))

(declare-fun lt!160323 () Unit!10458)

(declare-fun e!207150 () Unit!10458)

(assert (=> d!70547 (= lt!160323 e!207150)))

(declare-fun c!52265 () Bool)

(assert (=> d!70547 (= c!52265 lt!160322)))

(declare-fun containsKey!317 (List!4752 (_ BitVec 64)) Bool)

(assert (=> d!70547 (= lt!160322 (containsKey!317 (toList!2026 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70547 (= (contains!2084 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160320)))

(declare-fun b!337623 () Bool)

(declare-fun lt!160321 () Unit!10458)

(assert (=> b!337623 (= e!207150 lt!160321)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!266 (List!4752 (_ BitVec 64)) Unit!10458)

(assert (=> b!337623 (= lt!160321 (lemmaContainsKeyImpliesGetValueByKeyDefined!266 (toList!2026 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!331 0))(
  ( (Some!330 (v!5726 V!10363)) (None!329) )
))
(declare-fun isDefined!267 (Option!331) Bool)

(declare-fun getValueByKey!325 (List!4752 (_ BitVec 64)) Option!331)

(assert (=> b!337623 (isDefined!267 (getValueByKey!325 (toList!2026 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!337624 () Bool)

(declare-fun Unit!10466 () Unit!10458)

(assert (=> b!337624 (= e!207150 Unit!10466)))

(declare-fun b!337625 () Bool)

(assert (=> b!337625 (= e!207151 (isDefined!267 (getValueByKey!325 (toList!2026 (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70547 c!52265) b!337623))

(assert (= (and d!70547 (not c!52265)) b!337624))

(assert (= (and d!70547 (not res!186548)) b!337625))

(declare-fun m!340583 () Bool)

(assert (=> d!70547 m!340583))

(declare-fun m!340585 () Bool)

(assert (=> b!337623 m!340585))

(declare-fun m!340587 () Bool)

(assert (=> b!337623 m!340587))

(assert (=> b!337623 m!340587))

(declare-fun m!340589 () Bool)

(assert (=> b!337623 m!340589))

(assert (=> b!337625 m!340587))

(assert (=> b!337625 m!340587))

(assert (=> b!337625 m!340589))

(assert (=> b!337493 d!70547))

(declare-fun b!337668 () Bool)

(declare-fun e!207178 () Bool)

(declare-fun call!26370 () Bool)

(assert (=> b!337668 (= e!207178 (not call!26370))))

(declare-fun b!337669 () Bool)

(declare-fun e!207183 () ListLongMap!4021)

(declare-fun call!26372 () ListLongMap!4021)

(declare-fun +!722 (ListLongMap!4021 tuple2!5118) ListLongMap!4021)

(assert (=> b!337669 (= e!207183 (+!722 call!26372 (tuple2!5119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!337670 () Bool)

(declare-fun e!207186 () Bool)

(assert (=> b!337670 (= e!207186 (validKeyInArray!0 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26366 () Bool)

(declare-fun call!26369 () ListLongMap!4021)

(declare-fun getCurrentListMapNoExtraKeys!585 (array!17655 array!17653 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 32) Int) ListLongMap!4021)

(assert (=> bm!26366 (= call!26369 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!337671 () Bool)

(declare-fun e!207189 () Bool)

(declare-fun e!207185 () Bool)

(assert (=> b!337671 (= e!207189 e!207185)))

(declare-fun res!186569 () Bool)

(assert (=> b!337671 (=> (not res!186569) (not e!207185))))

(declare-fun lt!160386 () ListLongMap!4021)

(assert (=> b!337671 (= res!186569 (contains!2084 lt!160386 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!337671 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun b!337672 () Bool)

(declare-fun e!207180 () ListLongMap!4021)

(declare-fun call!26374 () ListLongMap!4021)

(assert (=> b!337672 (= e!207180 call!26374)))

(declare-fun b!337673 () Bool)

(declare-fun res!186571 () Bool)

(declare-fun e!207182 () Bool)

(assert (=> b!337673 (=> (not res!186571) (not e!207182))))

(assert (=> b!337673 (= res!186571 e!207189)))

(declare-fun res!186568 () Bool)

(assert (=> b!337673 (=> res!186568 e!207189)))

(declare-fun e!207188 () Bool)

(assert (=> b!337673 (= res!186568 (not e!207188))))

(declare-fun res!186567 () Bool)

(assert (=> b!337673 (=> (not res!186567) (not e!207188))))

(assert (=> b!337673 (= res!186567 (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun b!337674 () Bool)

(declare-fun e!207187 () ListLongMap!4021)

(assert (=> b!337674 (= e!207183 e!207187)))

(declare-fun c!52281 () Bool)

(assert (=> b!337674 (= c!52281 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26367 () Bool)

(assert (=> bm!26367 (= call!26370 (contains!2084 lt!160386 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!337675 () Bool)

(declare-fun e!207181 () Unit!10458)

(declare-fun lt!160389 () Unit!10458)

(assert (=> b!337675 (= e!207181 lt!160389)))

(declare-fun lt!160379 () ListLongMap!4021)

(assert (=> b!337675 (= lt!160379 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160371 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160371 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160388 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160388 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160373 () Unit!10458)

(declare-fun addStillContains!245 (ListLongMap!4021 (_ BitVec 64) V!10363 (_ BitVec 64)) Unit!10458)

(assert (=> b!337675 (= lt!160373 (addStillContains!245 lt!160379 lt!160371 zeroValue!1467 lt!160388))))

(assert (=> b!337675 (contains!2084 (+!722 lt!160379 (tuple2!5119 lt!160371 zeroValue!1467)) lt!160388)))

(declare-fun lt!160376 () Unit!10458)

(assert (=> b!337675 (= lt!160376 lt!160373)))

(declare-fun lt!160384 () ListLongMap!4021)

(assert (=> b!337675 (= lt!160384 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160369 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160369 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160370 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160370 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160385 () Unit!10458)

(declare-fun addApplyDifferent!245 (ListLongMap!4021 (_ BitVec 64) V!10363 (_ BitVec 64)) Unit!10458)

(assert (=> b!337675 (= lt!160385 (addApplyDifferent!245 lt!160384 lt!160369 minValue!1467 lt!160370))))

(declare-fun apply!269 (ListLongMap!4021 (_ BitVec 64)) V!10363)

(assert (=> b!337675 (= (apply!269 (+!722 lt!160384 (tuple2!5119 lt!160369 minValue!1467)) lt!160370) (apply!269 lt!160384 lt!160370))))

(declare-fun lt!160382 () Unit!10458)

(assert (=> b!337675 (= lt!160382 lt!160385)))

(declare-fun lt!160383 () ListLongMap!4021)

(assert (=> b!337675 (= lt!160383 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160374 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160375 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160375 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160377 () Unit!10458)

(assert (=> b!337675 (= lt!160377 (addApplyDifferent!245 lt!160383 lt!160374 zeroValue!1467 lt!160375))))

(assert (=> b!337675 (= (apply!269 (+!722 lt!160383 (tuple2!5119 lt!160374 zeroValue!1467)) lt!160375) (apply!269 lt!160383 lt!160375))))

(declare-fun lt!160387 () Unit!10458)

(assert (=> b!337675 (= lt!160387 lt!160377)))

(declare-fun lt!160380 () ListLongMap!4021)

(assert (=> b!337675 (= lt!160380 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160378 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160378 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160381 () (_ BitVec 64))

(assert (=> b!337675 (= lt!160381 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!337675 (= lt!160389 (addApplyDifferent!245 lt!160380 lt!160378 minValue!1467 lt!160381))))

(assert (=> b!337675 (= (apply!269 (+!722 lt!160380 (tuple2!5119 lt!160378 minValue!1467)) lt!160381) (apply!269 lt!160380 lt!160381))))

(declare-fun b!337676 () Bool)

(declare-fun e!207190 () Bool)

(declare-fun call!26371 () Bool)

(assert (=> b!337676 (= e!207190 (not call!26371))))

(declare-fun b!337677 () Bool)

(declare-fun e!207179 () Bool)

(assert (=> b!337677 (= e!207179 (= (apply!269 lt!160386 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun d!70549 () Bool)

(assert (=> d!70549 e!207182))

(declare-fun res!186575 () Bool)

(assert (=> d!70549 (=> (not res!186575) (not e!207182))))

(assert (=> d!70549 (= res!186575 (or (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))))

(declare-fun lt!160372 () ListLongMap!4021)

(assert (=> d!70549 (= lt!160386 lt!160372)))

(declare-fun lt!160368 () Unit!10458)

(assert (=> d!70549 (= lt!160368 e!207181)))

(declare-fun c!52280 () Bool)

(assert (=> d!70549 (= c!52280 e!207186)))

(declare-fun res!186574 () Bool)

(assert (=> d!70549 (=> (not res!186574) (not e!207186))))

(assert (=> d!70549 (= res!186574 (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(assert (=> d!70549 (= lt!160372 e!207183)))

(declare-fun c!52282 () Bool)

(assert (=> d!70549 (= c!52282 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70549 (validMask!0 mask!2385)))

(assert (=> d!70549 (= (getCurrentListMap!1532 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160386)))

(declare-fun call!26375 () ListLongMap!4021)

(declare-fun bm!26368 () Bool)

(assert (=> bm!26368 (= call!26372 (+!722 (ite c!52282 call!26369 (ite c!52281 call!26375 call!26374)) (ite (or c!52282 c!52281) (tuple2!5119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5119 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!337678 () Bool)

(declare-fun c!52278 () Bool)

(assert (=> b!337678 (= c!52278 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!337678 (= e!207187 e!207180)))

(declare-fun b!337679 () Bool)

(declare-fun Unit!10467 () Unit!10458)

(assert (=> b!337679 (= e!207181 Unit!10467)))

(declare-fun bm!26369 () Bool)

(assert (=> bm!26369 (= call!26374 call!26375)))

(declare-fun b!337680 () Bool)

(declare-fun call!26373 () ListLongMap!4021)

(assert (=> b!337680 (= e!207180 call!26373)))

(declare-fun bm!26370 () Bool)

(assert (=> bm!26370 (= call!26371 (contains!2084 lt!160386 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!337681 () Bool)

(declare-fun get!4555 (ValueCell!3176 V!10363) V!10363)

(declare-fun dynLambda!603 (Int (_ BitVec 64)) V!10363)

(assert (=> b!337681 (= e!207185 (= (apply!269 lt!160386 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)) (get!4555 (select (arr!8354 _values!1525) #b00000000000000000000000000000000) (dynLambda!603 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8707 _values!1525)))))

(assert (=> b!337681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun b!337682 () Bool)

(assert (=> b!337682 (= e!207188 (validKeyInArray!0 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337683 () Bool)

(assert (=> b!337683 (= e!207187 call!26373)))

(declare-fun b!337684 () Bool)

(declare-fun res!186573 () Bool)

(assert (=> b!337684 (=> (not res!186573) (not e!207182))))

(assert (=> b!337684 (= res!186573 e!207178)))

(declare-fun c!52283 () Bool)

(assert (=> b!337684 (= c!52283 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!337685 () Bool)

(declare-fun e!207184 () Bool)

(assert (=> b!337685 (= e!207190 e!207184)))

(declare-fun res!186572 () Bool)

(assert (=> b!337685 (= res!186572 call!26371)))

(assert (=> b!337685 (=> (not res!186572) (not e!207184))))

(declare-fun b!337686 () Bool)

(assert (=> b!337686 (= e!207182 e!207190)))

(declare-fun c!52279 () Bool)

(assert (=> b!337686 (= c!52279 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26371 () Bool)

(assert (=> bm!26371 (= call!26373 call!26372)))

(declare-fun bm!26372 () Bool)

(assert (=> bm!26372 (= call!26375 call!26369)))

(declare-fun b!337687 () Bool)

(assert (=> b!337687 (= e!207184 (= (apply!269 lt!160386 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!337688 () Bool)

(assert (=> b!337688 (= e!207178 e!207179)))

(declare-fun res!186570 () Bool)

(assert (=> b!337688 (= res!186570 call!26370)))

(assert (=> b!337688 (=> (not res!186570) (not e!207179))))

(assert (= (and d!70549 c!52282) b!337669))

(assert (= (and d!70549 (not c!52282)) b!337674))

(assert (= (and b!337674 c!52281) b!337683))

(assert (= (and b!337674 (not c!52281)) b!337678))

(assert (= (and b!337678 c!52278) b!337680))

(assert (= (and b!337678 (not c!52278)) b!337672))

(assert (= (or b!337680 b!337672) bm!26369))

(assert (= (or b!337683 bm!26369) bm!26372))

(assert (= (or b!337683 b!337680) bm!26371))

(assert (= (or b!337669 bm!26372) bm!26366))

(assert (= (or b!337669 bm!26371) bm!26368))

(assert (= (and d!70549 res!186574) b!337670))

(assert (= (and d!70549 c!52280) b!337675))

(assert (= (and d!70549 (not c!52280)) b!337679))

(assert (= (and d!70549 res!186575) b!337673))

(assert (= (and b!337673 res!186567) b!337682))

(assert (= (and b!337673 (not res!186568)) b!337671))

(assert (= (and b!337671 res!186569) b!337681))

(assert (= (and b!337673 res!186571) b!337684))

(assert (= (and b!337684 c!52283) b!337688))

(assert (= (and b!337684 (not c!52283)) b!337668))

(assert (= (and b!337688 res!186570) b!337677))

(assert (= (or b!337688 b!337668) bm!26367))

(assert (= (and b!337684 res!186573) b!337686))

(assert (= (and b!337686 c!52279) b!337685))

(assert (= (and b!337686 (not c!52279)) b!337676))

(assert (= (and b!337685 res!186572) b!337687))

(assert (= (or b!337685 b!337676) bm!26370))

(declare-fun b_lambda!8397 () Bool)

(assert (=> (not b_lambda!8397) (not b!337681)))

(declare-fun t!9840 () Bool)

(declare-fun tb!3045 () Bool)

(assert (=> (and start!33894 (= defaultEntry!1528 defaultEntry!1528) t!9840) tb!3045))

(declare-fun result!5481 () Bool)

(assert (=> tb!3045 (= result!5481 tp_is_empty!7039)))

(assert (=> b!337681 t!9840))

(declare-fun b_and!14253 () Bool)

(assert (= b_and!14247 (and (=> t!9840 result!5481) b_and!14253)))

(declare-fun m!340591 () Bool)

(assert (=> bm!26366 m!340591))

(assert (=> d!70549 m!340481))

(declare-fun m!340593 () Bool)

(assert (=> b!337669 m!340593))

(declare-fun m!340595 () Bool)

(assert (=> b!337681 m!340595))

(assert (=> b!337681 m!340549))

(declare-fun m!340597 () Bool)

(assert (=> b!337681 m!340597))

(assert (=> b!337681 m!340549))

(declare-fun m!340599 () Bool)

(assert (=> b!337681 m!340599))

(assert (=> b!337681 m!340597))

(assert (=> b!337681 m!340595))

(declare-fun m!340601 () Bool)

(assert (=> b!337681 m!340601))

(assert (=> b!337671 m!340549))

(assert (=> b!337671 m!340549))

(declare-fun m!340603 () Bool)

(assert (=> b!337671 m!340603))

(declare-fun m!340605 () Bool)

(assert (=> b!337677 m!340605))

(declare-fun m!340607 () Bool)

(assert (=> b!337687 m!340607))

(declare-fun m!340609 () Bool)

(assert (=> bm!26368 m!340609))

(declare-fun m!340611 () Bool)

(assert (=> b!337675 m!340611))

(declare-fun m!340613 () Bool)

(assert (=> b!337675 m!340613))

(declare-fun m!340615 () Bool)

(assert (=> b!337675 m!340615))

(declare-fun m!340617 () Bool)

(assert (=> b!337675 m!340617))

(declare-fun m!340619 () Bool)

(assert (=> b!337675 m!340619))

(declare-fun m!340621 () Bool)

(assert (=> b!337675 m!340621))

(declare-fun m!340623 () Bool)

(assert (=> b!337675 m!340623))

(declare-fun m!340625 () Bool)

(assert (=> b!337675 m!340625))

(assert (=> b!337675 m!340611))

(declare-fun m!340627 () Bool)

(assert (=> b!337675 m!340627))

(assert (=> b!337675 m!340549))

(declare-fun m!340629 () Bool)

(assert (=> b!337675 m!340629))

(declare-fun m!340631 () Bool)

(assert (=> b!337675 m!340631))

(declare-fun m!340633 () Bool)

(assert (=> b!337675 m!340633))

(declare-fun m!340635 () Bool)

(assert (=> b!337675 m!340635))

(declare-fun m!340637 () Bool)

(assert (=> b!337675 m!340637))

(assert (=> b!337675 m!340591))

(assert (=> b!337675 m!340631))

(assert (=> b!337675 m!340613))

(declare-fun m!340639 () Bool)

(assert (=> b!337675 m!340639))

(assert (=> b!337675 m!340615))

(assert (=> b!337670 m!340549))

(assert (=> b!337670 m!340549))

(assert (=> b!337670 m!340567))

(declare-fun m!340641 () Bool)

(assert (=> bm!26370 m!340641))

(declare-fun m!340643 () Bool)

(assert (=> bm!26367 m!340643))

(assert (=> b!337682 m!340549))

(assert (=> b!337682 m!340549))

(assert (=> b!337682 m!340567))

(assert (=> b!337493 d!70549))

(declare-fun b!337701 () Bool)

(declare-fun e!207199 () Bool)

(declare-fun e!207200 () Bool)

(assert (=> b!337701 (= e!207199 e!207200)))

(declare-fun res!186582 () Bool)

(assert (=> b!337701 (=> (not res!186582) (not e!207200))))

(declare-fun e!207202 () Bool)

(assert (=> b!337701 (= res!186582 (not e!207202))))

(declare-fun res!186583 () Bool)

(assert (=> b!337701 (=> (not res!186583) (not e!207202))))

(assert (=> b!337701 (= res!186583 (validKeyInArray!0 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337702 () Bool)

(declare-fun e!207201 () Bool)

(assert (=> b!337702 (= e!207200 e!207201)))

(declare-fun c!52286 () Bool)

(assert (=> b!337702 (= c!52286 (validKeyInArray!0 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70551 () Bool)

(declare-fun res!186584 () Bool)

(assert (=> d!70551 (=> res!186584 e!207199)))

(assert (=> d!70551 (= res!186584 (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(assert (=> d!70551 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4750) e!207199)))

(declare-fun b!337703 () Bool)

(declare-fun contains!2085 (List!4753 (_ BitVec 64)) Bool)

(assert (=> b!337703 (= e!207202 (contains!2085 Nil!4750 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337704 () Bool)

(declare-fun call!26378 () Bool)

(assert (=> b!337704 (= e!207201 call!26378)))

(declare-fun b!337705 () Bool)

(assert (=> b!337705 (= e!207201 call!26378)))

(declare-fun bm!26375 () Bool)

(assert (=> bm!26375 (= call!26378 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52286 (Cons!4749 (select (arr!8355 _keys!1895) #b00000000000000000000000000000000) Nil!4750) Nil!4750)))))

(assert (= (and d!70551 (not res!186584)) b!337701))

(assert (= (and b!337701 res!186583) b!337703))

(assert (= (and b!337701 res!186582) b!337702))

(assert (= (and b!337702 c!52286) b!337704))

(assert (= (and b!337702 (not c!52286)) b!337705))

(assert (= (or b!337704 b!337705) bm!26375))

(assert (=> b!337701 m!340549))

(assert (=> b!337701 m!340549))

(assert (=> b!337701 m!340567))

(assert (=> b!337702 m!340549))

(assert (=> b!337702 m!340549))

(assert (=> b!337702 m!340567))

(assert (=> b!337703 m!340549))

(assert (=> b!337703 m!340549))

(declare-fun m!340645 () Bool)

(assert (=> b!337703 m!340645))

(assert (=> bm!26375 m!340549))

(declare-fun m!340647 () Bool)

(assert (=> bm!26375 m!340647))

(assert (=> b!337494 d!70551))

(declare-fun d!70553 () Bool)

(assert (=> d!70553 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33894 d!70553))

(declare-fun d!70555 () Bool)

(assert (=> d!70555 (= (array_inv!6228 _values!1525) (bvsge (size!8707 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33894 d!70555))

(declare-fun d!70557 () Bool)

(assert (=> d!70557 (= (array_inv!6229 _keys!1895) (bvsge (size!8708 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33894 d!70557))

(declare-fun b!337712 () Bool)

(declare-fun e!207207 () Bool)

(assert (=> b!337712 (= e!207207 tp_is_empty!7039)))

(declare-fun mapNonEmpty!11973 () Bool)

(declare-fun mapRes!11973 () Bool)

(declare-fun tp!24789 () Bool)

(assert (=> mapNonEmpty!11973 (= mapRes!11973 (and tp!24789 e!207207))))

(declare-fun mapRest!11973 () (Array (_ BitVec 32) ValueCell!3176))

(declare-fun mapValue!11973 () ValueCell!3176)

(declare-fun mapKey!11973 () (_ BitVec 32))

(assert (=> mapNonEmpty!11973 (= mapRest!11964 (store mapRest!11973 mapKey!11973 mapValue!11973))))

(declare-fun mapIsEmpty!11973 () Bool)

(assert (=> mapIsEmpty!11973 mapRes!11973))

(declare-fun b!337713 () Bool)

(declare-fun e!207208 () Bool)

(assert (=> b!337713 (= e!207208 tp_is_empty!7039)))

(declare-fun condMapEmpty!11973 () Bool)

(declare-fun mapDefault!11973 () ValueCell!3176)

(assert (=> mapNonEmpty!11964 (= condMapEmpty!11973 (= mapRest!11964 ((as const (Array (_ BitVec 32) ValueCell!3176)) mapDefault!11973)))))

(assert (=> mapNonEmpty!11964 (= tp!24773 (and e!207208 mapRes!11973))))

(assert (= (and mapNonEmpty!11964 condMapEmpty!11973) mapIsEmpty!11973))

(assert (= (and mapNonEmpty!11964 (not condMapEmpty!11973)) mapNonEmpty!11973))

(assert (= (and mapNonEmpty!11973 ((_ is ValueCellFull!3176) mapValue!11973)) b!337712))

(assert (= (and mapNonEmpty!11964 ((_ is ValueCellFull!3176) mapDefault!11973)) b!337713))

(declare-fun m!340649 () Bool)

(assert (=> mapNonEmpty!11973 m!340649))

(declare-fun b_lambda!8399 () Bool)

(assert (= b_lambda!8397 (or (and start!33894 b_free!7087) b_lambda!8399)))

(check-sat (not d!70547) (not bm!26375) (not b!337595) (not b!337609) (not b!337669) (not b!337670) (not d!70539) (not d!70543) (not d!70549) (not bm!26351) (not b!337682) (not b!337623) (not b!337616) (not b!337681) (not b!337580) (not b!337703) (not b!337625) b_and!14253 (not b_lambda!8399) (not b!337687) (not b_next!7087) (not bm!26368) (not b!337702) (not b!337671) (not bm!26370) (not bm!26366) (not b!337608) (not bm!26367) tp_is_empty!7039 (not b!337701) (not mapNonEmpty!11973) (not b!337675) (not b!337677))
(check-sat b_and!14253 (not b_next!7087))
