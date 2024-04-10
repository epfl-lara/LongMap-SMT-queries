; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81510 () Bool)

(assert start!81510)

(declare-fun b!952476 () Bool)

(declare-fun b_free!18291 () Bool)

(declare-fun b_next!18291 () Bool)

(assert (=> b!952476 (= b_free!18291 (not b_next!18291))))

(declare-fun tp!63495 () Bool)

(declare-fun b_and!29771 () Bool)

(assert (=> b!952476 (= tp!63495 b_and!29771)))

(declare-fun b!952470 () Bool)

(declare-fun e!536417 () Bool)

(declare-fun e!536413 () Bool)

(assert (=> b!952470 (= e!536417 (not e!536413))))

(declare-fun res!638088 () Bool)

(assert (=> b!952470 (=> res!638088 e!536413)))

(declare-datatypes ((V!32697 0))(
  ( (V!32698 (val!10450 Int)) )
))
(declare-datatypes ((ValueCell!9918 0))(
  ( (ValueCellFull!9918 (v!13001 V!32697)) (EmptyCell!9918) )
))
(declare-datatypes ((array!57632 0))(
  ( (array!57633 (arr!27708 (Array (_ BitVec 32) ValueCell!9918)) (size!28187 (_ BitVec 32))) )
))
(declare-datatypes ((array!57634 0))(
  ( (array!57635 (arr!27709 (Array (_ BitVec 32) (_ BitVec 64))) (size!28188 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4986 0))(
  ( (LongMapFixedSize!4987 (defaultEntry!5824 Int) (mask!27672 (_ BitVec 32)) (extraKeys!5556 (_ BitVec 32)) (zeroValue!5660 V!32697) (minValue!5660 V!32697) (_size!2548 (_ BitVec 32)) (_keys!10778 array!57634) (_values!5847 array!57632) (_vacant!2548 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4986)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!952470 (= res!638088 (not (validMask!0 (mask!27672 thiss!1141))))))

(declare-fun lt!429172 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57634 (_ BitVec 32)) Bool)

(assert (=> b!952470 (arrayForallSeekEntryOrOpenFound!0 lt!429172 (_keys!10778 thiss!1141) (mask!27672 thiss!1141))))

(declare-datatypes ((Unit!32045 0))(
  ( (Unit!32046) )
))
(declare-fun lt!429174 () Unit!32045)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32045)

(assert (=> b!952470 (= lt!429174 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10778 thiss!1141) (mask!27672 thiss!1141) #b00000000000000000000000000000000 lt!429172))))

(declare-fun key!756 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!57634 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952470 (= lt!429172 (arrayScanForKey!0 (_keys!10778 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!952470 (arrayContainsKey!0 (_keys!10778 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429173 () Unit!32045)

(declare-fun lemmaKeyInListMapIsInArray!335 (array!57634 array!57632 (_ BitVec 32) (_ BitVec 32) V!32697 V!32697 (_ BitVec 64) Int) Unit!32045)

(assert (=> b!952470 (= lt!429173 (lemmaKeyInListMapIsInArray!335 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) key!756 (defaultEntry!5824 thiss!1141)))))

(declare-fun b!952471 () Bool)

(declare-fun res!638085 () Bool)

(assert (=> b!952471 (=> (not res!638085) (not e!536417))))

(declare-datatypes ((tuple2!13584 0))(
  ( (tuple2!13585 (_1!6803 (_ BitVec 64)) (_2!6803 V!32697)) )
))
(declare-datatypes ((List!19365 0))(
  ( (Nil!19362) (Cons!19361 (h!20523 tuple2!13584) (t!27720 List!19365)) )
))
(declare-datatypes ((ListLongMap!12281 0))(
  ( (ListLongMap!12282 (toList!6156 List!19365)) )
))
(declare-fun contains!5251 (ListLongMap!12281 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3389 (array!57634 array!57632 (_ BitVec 32) (_ BitVec 32) V!32697 V!32697 (_ BitVec 32) Int) ListLongMap!12281)

(assert (=> b!952471 (= res!638085 (contains!5251 (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)) key!756))))

(declare-fun b!952472 () Bool)

(declare-fun e!536415 () Bool)

(declare-fun tp_is_empty!20799 () Bool)

(assert (=> b!952472 (= e!536415 tp_is_empty!20799)))

(declare-fun mapNonEmpty!33136 () Bool)

(declare-fun mapRes!33136 () Bool)

(declare-fun tp!63494 () Bool)

(declare-fun e!536414 () Bool)

(assert (=> mapNonEmpty!33136 (= mapRes!33136 (and tp!63494 e!536414))))

(declare-fun mapKey!33136 () (_ BitVec 32))

(declare-fun mapRest!33136 () (Array (_ BitVec 32) ValueCell!9918))

(declare-fun mapValue!33136 () ValueCell!9918)

(assert (=> mapNonEmpty!33136 (= (arr!27708 (_values!5847 thiss!1141)) (store mapRest!33136 mapKey!33136 mapValue!33136))))

(declare-fun mapIsEmpty!33136 () Bool)

(assert (=> mapIsEmpty!33136 mapRes!33136))

(declare-fun res!638087 () Bool)

(assert (=> start!81510 (=> (not res!638087) (not e!536417))))

(declare-fun valid!1898 (LongMapFixedSize!4986) Bool)

(assert (=> start!81510 (= res!638087 (valid!1898 thiss!1141))))

(assert (=> start!81510 e!536417))

(declare-fun e!536416 () Bool)

(assert (=> start!81510 e!536416))

(assert (=> start!81510 true))

(declare-fun b!952473 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!952473 (= e!536413 (validKeyInArray!0 key!756))))

(declare-fun b!952474 () Bool)

(declare-fun res!638090 () Bool)

(assert (=> b!952474 (=> res!638090 e!536413)))

(assert (=> b!952474 (= res!638090 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10778 thiss!1141) (mask!27672 thiss!1141))))))

(declare-fun b!952475 () Bool)

(assert (=> b!952475 (= e!536414 tp_is_empty!20799)))

(declare-fun e!536412 () Bool)

(declare-fun array_inv!21504 (array!57634) Bool)

(declare-fun array_inv!21505 (array!57632) Bool)

(assert (=> b!952476 (= e!536416 (and tp!63495 tp_is_empty!20799 (array_inv!21504 (_keys!10778 thiss!1141)) (array_inv!21505 (_values!5847 thiss!1141)) e!536412))))

(declare-fun b!952477 () Bool)

(declare-fun res!638084 () Bool)

(assert (=> b!952477 (=> (not res!638084) (not e!536417))))

(assert (=> b!952477 (= res!638084 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!952478 () Bool)

(assert (=> b!952478 (= e!536412 (and e!536415 mapRes!33136))))

(declare-fun condMapEmpty!33136 () Bool)

(declare-fun mapDefault!33136 () ValueCell!9918)

(assert (=> b!952478 (= condMapEmpty!33136 (= (arr!27708 (_values!5847 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9918)) mapDefault!33136)))))

(declare-fun b!952479 () Bool)

(declare-fun res!638086 () Bool)

(assert (=> b!952479 (=> res!638086 e!536413)))

(assert (=> b!952479 (= res!638086 (not (= (size!28188 (_keys!10778 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27672 thiss!1141)))))))

(declare-fun b!952480 () Bool)

(declare-fun res!638089 () Bool)

(assert (=> b!952480 (=> (not res!638089) (not e!536417))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9161 0))(
  ( (MissingZero!9161 (index!39015 (_ BitVec 32))) (Found!9161 (index!39016 (_ BitVec 32))) (Intermediate!9161 (undefined!9973 Bool) (index!39017 (_ BitVec 32)) (x!81939 (_ BitVec 32))) (Undefined!9161) (MissingVacant!9161 (index!39018 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57634 (_ BitVec 32)) SeekEntryResult!9161)

(assert (=> b!952480 (= res!638089 (not ((_ is Found!9161) (seekEntry!0 key!756 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)))))))

(assert (= (and start!81510 res!638087) b!952477))

(assert (= (and b!952477 res!638084) b!952480))

(assert (= (and b!952480 res!638089) b!952471))

(assert (= (and b!952471 res!638085) b!952470))

(assert (= (and b!952470 (not res!638088)) b!952479))

(assert (= (and b!952479 (not res!638086)) b!952474))

(assert (= (and b!952474 (not res!638090)) b!952473))

(assert (= (and b!952478 condMapEmpty!33136) mapIsEmpty!33136))

(assert (= (and b!952478 (not condMapEmpty!33136)) mapNonEmpty!33136))

(assert (= (and mapNonEmpty!33136 ((_ is ValueCellFull!9918) mapValue!33136)) b!952475))

(assert (= (and b!952478 ((_ is ValueCellFull!9918) mapDefault!33136)) b!952472))

(assert (= b!952476 b!952478))

(assert (= start!81510 b!952476))

(declare-fun m!884625 () Bool)

(assert (=> mapNonEmpty!33136 m!884625))

(declare-fun m!884627 () Bool)

(assert (=> b!952476 m!884627))

(declare-fun m!884629 () Bool)

(assert (=> b!952476 m!884629))

(declare-fun m!884631 () Bool)

(assert (=> b!952471 m!884631))

(assert (=> b!952471 m!884631))

(declare-fun m!884633 () Bool)

(assert (=> b!952471 m!884633))

(declare-fun m!884635 () Bool)

(assert (=> b!952473 m!884635))

(declare-fun m!884637 () Bool)

(assert (=> b!952470 m!884637))

(declare-fun m!884639 () Bool)

(assert (=> b!952470 m!884639))

(declare-fun m!884641 () Bool)

(assert (=> b!952470 m!884641))

(declare-fun m!884643 () Bool)

(assert (=> b!952470 m!884643))

(declare-fun m!884645 () Bool)

(assert (=> b!952470 m!884645))

(declare-fun m!884647 () Bool)

(assert (=> b!952470 m!884647))

(declare-fun m!884649 () Bool)

(assert (=> b!952480 m!884649))

(declare-fun m!884651 () Bool)

(assert (=> start!81510 m!884651))

(declare-fun m!884653 () Bool)

(assert (=> b!952474 m!884653))

(check-sat (not b!952470) (not b!952474) (not b!952476) tp_is_empty!20799 (not b!952471) (not b!952473) (not start!81510) (not b!952480) (not b_next!18291) b_and!29771 (not mapNonEmpty!33136))
(check-sat b_and!29771 (not b_next!18291))
(get-model)

(declare-fun d!115531 () Bool)

(assert (=> d!115531 (= (array_inv!21504 (_keys!10778 thiss!1141)) (bvsge (size!28188 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952476 d!115531))

(declare-fun d!115533 () Bool)

(assert (=> d!115533 (= (array_inv!21505 (_values!5847 thiss!1141)) (bvsge (size!28187 (_values!5847 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952476 d!115533))

(declare-fun d!115535 () Bool)

(declare-fun res!638118 () Bool)

(declare-fun e!536442 () Bool)

(assert (=> d!115535 (=> (not res!638118) (not e!536442))))

(declare-fun simpleValid!382 (LongMapFixedSize!4986) Bool)

(assert (=> d!115535 (= res!638118 (simpleValid!382 thiss!1141))))

(assert (=> d!115535 (= (valid!1898 thiss!1141) e!536442)))

(declare-fun b!952520 () Bool)

(declare-fun res!638119 () Bool)

(assert (=> b!952520 (=> (not res!638119) (not e!536442))))

(declare-fun arrayCountValidKeys!0 (array!57634 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!952520 (= res!638119 (= (arrayCountValidKeys!0 (_keys!10778 thiss!1141) #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))) (_size!2548 thiss!1141)))))

(declare-fun b!952521 () Bool)

(declare-fun res!638120 () Bool)

(assert (=> b!952521 (=> (not res!638120) (not e!536442))))

(assert (=> b!952521 (= res!638120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)))))

(declare-fun b!952522 () Bool)

(declare-datatypes ((List!19366 0))(
  ( (Nil!19363) (Cons!19362 (h!20524 (_ BitVec 64)) (t!27723 List!19366)) )
))
(declare-fun arrayNoDuplicates!0 (array!57634 (_ BitVec 32) List!19366) Bool)

(assert (=> b!952522 (= e!536442 (arrayNoDuplicates!0 (_keys!10778 thiss!1141) #b00000000000000000000000000000000 Nil!19363))))

(assert (= (and d!115535 res!638118) b!952520))

(assert (= (and b!952520 res!638119) b!952521))

(assert (= (and b!952521 res!638120) b!952522))

(declare-fun m!884685 () Bool)

(assert (=> d!115535 m!884685))

(declare-fun m!884687 () Bool)

(assert (=> b!952520 m!884687))

(assert (=> b!952521 m!884653))

(declare-fun m!884689 () Bool)

(assert (=> b!952522 m!884689))

(assert (=> start!81510 d!115535))

(declare-fun b!952535 () Bool)

(declare-fun e!536451 () SeekEntryResult!9161)

(assert (=> b!952535 (= e!536451 Undefined!9161)))

(declare-fun b!952536 () Bool)

(declare-fun e!536450 () SeekEntryResult!9161)

(declare-fun lt!429195 () SeekEntryResult!9161)

(assert (=> b!952536 (= e!536450 (MissingZero!9161 (index!39017 lt!429195)))))

(declare-fun b!952537 () Bool)

(declare-fun c!99652 () Bool)

(declare-fun lt!429192 () (_ BitVec 64))

(assert (=> b!952537 (= c!99652 (= lt!429192 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!536449 () SeekEntryResult!9161)

(assert (=> b!952537 (= e!536449 e!536450)))

(declare-fun d!115537 () Bool)

(declare-fun lt!429193 () SeekEntryResult!9161)

(assert (=> d!115537 (and (or ((_ is MissingVacant!9161) lt!429193) (not ((_ is Found!9161) lt!429193)) (and (bvsge (index!39016 lt!429193) #b00000000000000000000000000000000) (bvslt (index!39016 lt!429193) (size!28188 (_keys!10778 thiss!1141))))) (not ((_ is MissingVacant!9161) lt!429193)) (or (not ((_ is Found!9161) lt!429193)) (= (select (arr!27709 (_keys!10778 thiss!1141)) (index!39016 lt!429193)) key!756)))))

(assert (=> d!115537 (= lt!429193 e!536451)))

(declare-fun c!99653 () Bool)

(assert (=> d!115537 (= c!99653 (and ((_ is Intermediate!9161) lt!429195) (undefined!9973 lt!429195)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57634 (_ BitVec 32)) SeekEntryResult!9161)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115537 (= lt!429195 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27672 thiss!1141)) key!756 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)))))

(assert (=> d!115537 (validMask!0 (mask!27672 thiss!1141))))

(assert (=> d!115537 (= (seekEntry!0 key!756 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)) lt!429193)))

(declare-fun b!952538 () Bool)

(assert (=> b!952538 (= e!536451 e!536449)))

(assert (=> b!952538 (= lt!429192 (select (arr!27709 (_keys!10778 thiss!1141)) (index!39017 lt!429195)))))

(declare-fun c!99651 () Bool)

(assert (=> b!952538 (= c!99651 (= lt!429192 key!756))))

(declare-fun b!952539 () Bool)

(declare-fun lt!429194 () SeekEntryResult!9161)

(assert (=> b!952539 (= e!536450 (ite ((_ is MissingVacant!9161) lt!429194) (MissingZero!9161 (index!39018 lt!429194)) lt!429194))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57634 (_ BitVec 32)) SeekEntryResult!9161)

(assert (=> b!952539 (= lt!429194 (seekKeyOrZeroReturnVacant!0 (x!81939 lt!429195) (index!39017 lt!429195) (index!39017 lt!429195) key!756 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)))))

(declare-fun b!952540 () Bool)

(assert (=> b!952540 (= e!536449 (Found!9161 (index!39017 lt!429195)))))

(assert (= (and d!115537 c!99653) b!952535))

(assert (= (and d!115537 (not c!99653)) b!952538))

(assert (= (and b!952538 c!99651) b!952540))

(assert (= (and b!952538 (not c!99651)) b!952537))

(assert (= (and b!952537 c!99652) b!952536))

(assert (= (and b!952537 (not c!99652)) b!952539))

(declare-fun m!884691 () Bool)

(assert (=> d!115537 m!884691))

(declare-fun m!884693 () Bool)

(assert (=> d!115537 m!884693))

(assert (=> d!115537 m!884693))

(declare-fun m!884695 () Bool)

(assert (=> d!115537 m!884695))

(assert (=> d!115537 m!884641))

(declare-fun m!884697 () Bool)

(assert (=> b!952538 m!884697))

(declare-fun m!884699 () Bool)

(assert (=> b!952539 m!884699))

(assert (=> b!952480 d!115537))

(declare-fun d!115539 () Bool)

(declare-fun res!638126 () Bool)

(declare-fun e!536458 () Bool)

(assert (=> d!115539 (=> res!638126 e!536458)))

(assert (=> d!115539 (= res!638126 (bvsge #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))))))

(assert (=> d!115539 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)) e!536458)))

(declare-fun b!952549 () Bool)

(declare-fun e!536459 () Bool)

(declare-fun call!41577 () Bool)

(assert (=> b!952549 (= e!536459 call!41577)))

(declare-fun b!952550 () Bool)

(declare-fun e!536460 () Bool)

(assert (=> b!952550 (= e!536460 call!41577)))

(declare-fun b!952551 () Bool)

(assert (=> b!952551 (= e!536458 e!536459)))

(declare-fun c!99656 () Bool)

(assert (=> b!952551 (= c!99656 (validKeyInArray!0 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952552 () Bool)

(assert (=> b!952552 (= e!536459 e!536460)))

(declare-fun lt!429202 () (_ BitVec 64))

(assert (=> b!952552 (= lt!429202 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429203 () Unit!32045)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57634 (_ BitVec 64) (_ BitVec 32)) Unit!32045)

(assert (=> b!952552 (= lt!429203 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10778 thiss!1141) lt!429202 #b00000000000000000000000000000000))))

(assert (=> b!952552 (arrayContainsKey!0 (_keys!10778 thiss!1141) lt!429202 #b00000000000000000000000000000000)))

(declare-fun lt!429204 () Unit!32045)

(assert (=> b!952552 (= lt!429204 lt!429203)))

(declare-fun res!638125 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57634 (_ BitVec 32)) SeekEntryResult!9161)

(assert (=> b!952552 (= res!638125 (= (seekEntryOrOpen!0 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000) (_keys!10778 thiss!1141) (mask!27672 thiss!1141)) (Found!9161 #b00000000000000000000000000000000)))))

(assert (=> b!952552 (=> (not res!638125) (not e!536460))))

(declare-fun bm!41574 () Bool)

(assert (=> bm!41574 (= call!41577 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10778 thiss!1141) (mask!27672 thiss!1141)))))

(assert (= (and d!115539 (not res!638126)) b!952551))

(assert (= (and b!952551 c!99656) b!952552))

(assert (= (and b!952551 (not c!99656)) b!952549))

(assert (= (and b!952552 res!638125) b!952550))

(assert (= (or b!952550 b!952549) bm!41574))

(declare-fun m!884701 () Bool)

(assert (=> b!952551 m!884701))

(assert (=> b!952551 m!884701))

(declare-fun m!884703 () Bool)

(assert (=> b!952551 m!884703))

(assert (=> b!952552 m!884701))

(declare-fun m!884705 () Bool)

(assert (=> b!952552 m!884705))

(declare-fun m!884707 () Bool)

(assert (=> b!952552 m!884707))

(assert (=> b!952552 m!884701))

(declare-fun m!884709 () Bool)

(assert (=> b!952552 m!884709))

(declare-fun m!884711 () Bool)

(assert (=> bm!41574 m!884711))

(assert (=> b!952474 d!115539))

(declare-fun d!115541 () Bool)

(declare-fun e!536466 () Bool)

(assert (=> d!115541 e!536466))

(declare-fun res!638129 () Bool)

(assert (=> d!115541 (=> res!638129 e!536466)))

(declare-fun lt!429215 () Bool)

(assert (=> d!115541 (= res!638129 (not lt!429215))))

(declare-fun lt!429213 () Bool)

(assert (=> d!115541 (= lt!429215 lt!429213)))

(declare-fun lt!429216 () Unit!32045)

(declare-fun e!536465 () Unit!32045)

(assert (=> d!115541 (= lt!429216 e!536465)))

(declare-fun c!99659 () Bool)

(assert (=> d!115541 (= c!99659 lt!429213)))

(declare-fun containsKey!472 (List!19365 (_ BitVec 64)) Bool)

(assert (=> d!115541 (= lt!429213 (containsKey!472 (toList!6156 (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141))) key!756))))

(assert (=> d!115541 (= (contains!5251 (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)) key!756) lt!429215)))

(declare-fun b!952559 () Bool)

(declare-fun lt!429214 () Unit!32045)

(assert (=> b!952559 (= e!536465 lt!429214)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!368 (List!19365 (_ BitVec 64)) Unit!32045)

(assert (=> b!952559 (= lt!429214 (lemmaContainsKeyImpliesGetValueByKeyDefined!368 (toList!6156 (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141))) key!756))))

(declare-datatypes ((Option!511 0))(
  ( (Some!510 (v!13003 V!32697)) (None!509) )
))
(declare-fun isDefined!377 (Option!511) Bool)

(declare-fun getValueByKey!505 (List!19365 (_ BitVec 64)) Option!511)

(assert (=> b!952559 (isDefined!377 (getValueByKey!505 (toList!6156 (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141))) key!756))))

(declare-fun b!952560 () Bool)

(declare-fun Unit!32047 () Unit!32045)

(assert (=> b!952560 (= e!536465 Unit!32047)))

(declare-fun b!952561 () Bool)

(assert (=> b!952561 (= e!536466 (isDefined!377 (getValueByKey!505 (toList!6156 (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141))) key!756)))))

(assert (= (and d!115541 c!99659) b!952559))

(assert (= (and d!115541 (not c!99659)) b!952560))

(assert (= (and d!115541 (not res!638129)) b!952561))

(declare-fun m!884713 () Bool)

(assert (=> d!115541 m!884713))

(declare-fun m!884715 () Bool)

(assert (=> b!952559 m!884715))

(declare-fun m!884717 () Bool)

(assert (=> b!952559 m!884717))

(assert (=> b!952559 m!884717))

(declare-fun m!884719 () Bool)

(assert (=> b!952559 m!884719))

(assert (=> b!952561 m!884717))

(assert (=> b!952561 m!884717))

(assert (=> b!952561 m!884719))

(assert (=> b!952471 d!115541))

(declare-fun b!952604 () Bool)

(declare-fun e!536493 () Bool)

(declare-fun lt!429269 () ListLongMap!12281)

(declare-fun apply!886 (ListLongMap!12281 (_ BitVec 64)) V!32697)

(assert (=> b!952604 (= e!536493 (= (apply!886 lt!429269 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5660 thiss!1141)))))

(declare-fun call!41596 () ListLongMap!12281)

(declare-fun call!41598 () ListLongMap!12281)

(declare-fun call!41592 () ListLongMap!12281)

(declare-fun c!99672 () Bool)

(declare-fun bm!41589 () Bool)

(declare-fun c!99677 () Bool)

(declare-fun call!41595 () ListLongMap!12281)

(declare-fun +!2870 (ListLongMap!12281 tuple2!13584) ListLongMap!12281)

(assert (=> bm!41589 (= call!41592 (+!2870 (ite c!99672 call!41598 (ite c!99677 call!41595 call!41596)) (ite (or c!99672 c!99677) (tuple2!13585 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5660 thiss!1141)) (tuple2!13585 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5660 thiss!1141)))))))

(declare-fun b!952606 () Bool)

(declare-fun e!536505 () Bool)

(declare-fun get!14565 (ValueCell!9918 V!32697) V!32697)

(declare-fun dynLambda!1659 (Int (_ BitVec 64)) V!32697)

(assert (=> b!952606 (= e!536505 (= (apply!886 lt!429269 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000)) (get!14565 (select (arr!27708 (_values!5847 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1659 (defaultEntry!5824 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28187 (_values!5847 thiss!1141))))))

(assert (=> b!952606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))))))

(declare-fun b!952607 () Bool)

(declare-fun e!536501 () Bool)

(declare-fun e!536498 () Bool)

(assert (=> b!952607 (= e!536501 e!536498)))

(declare-fun c!99675 () Bool)

(assert (=> b!952607 (= c!99675 (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!952608 () Bool)

(declare-fun res!638148 () Bool)

(assert (=> b!952608 (=> (not res!638148) (not e!536501))))

(declare-fun e!536503 () Bool)

(assert (=> b!952608 (= res!638148 e!536503)))

(declare-fun c!99674 () Bool)

(assert (=> b!952608 (= c!99674 (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!952609 () Bool)

(declare-fun e!536499 () ListLongMap!12281)

(declare-fun call!41593 () ListLongMap!12281)

(assert (=> b!952609 (= e!536499 call!41593)))

(declare-fun bm!41590 () Bool)

(declare-fun call!41594 () Bool)

(assert (=> bm!41590 (= call!41594 (contains!5251 lt!429269 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!952610 () Bool)

(declare-fun e!536495 () Bool)

(assert (=> b!952610 (= e!536495 (= (apply!886 lt!429269 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5660 thiss!1141)))))

(declare-fun b!952611 () Bool)

(declare-fun e!536504 () ListLongMap!12281)

(assert (=> b!952611 (= e!536504 call!41593)))

(declare-fun b!952612 () Bool)

(declare-fun e!536496 () Bool)

(assert (=> b!952612 (= e!536496 e!536505)))

(declare-fun res!638154 () Bool)

(assert (=> b!952612 (=> (not res!638154) (not e!536505))))

(assert (=> b!952612 (= res!638154 (contains!5251 lt!429269 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!952612 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))))))

(declare-fun bm!41591 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!3325 (array!57634 array!57632 (_ BitVec 32) (_ BitVec 32) V!32697 V!32697 (_ BitVec 32) Int) ListLongMap!12281)

(assert (=> bm!41591 (= call!41598 (getCurrentListMapNoExtraKeys!3325 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)))))

(declare-fun b!952613 () Bool)

(declare-fun e!536502 () Unit!32045)

(declare-fun lt!429281 () Unit!32045)

(assert (=> b!952613 (= e!536502 lt!429281)))

(declare-fun lt!429272 () ListLongMap!12281)

(assert (=> b!952613 (= lt!429272 (getCurrentListMapNoExtraKeys!3325 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)))))

(declare-fun lt!429265 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429265 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429267 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429267 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429263 () Unit!32045)

(declare-fun addStillContains!589 (ListLongMap!12281 (_ BitVec 64) V!32697 (_ BitVec 64)) Unit!32045)

(assert (=> b!952613 (= lt!429263 (addStillContains!589 lt!429272 lt!429265 (zeroValue!5660 thiss!1141) lt!429267))))

(assert (=> b!952613 (contains!5251 (+!2870 lt!429272 (tuple2!13585 lt!429265 (zeroValue!5660 thiss!1141))) lt!429267)))

(declare-fun lt!429262 () Unit!32045)

(assert (=> b!952613 (= lt!429262 lt!429263)))

(declare-fun lt!429271 () ListLongMap!12281)

(assert (=> b!952613 (= lt!429271 (getCurrentListMapNoExtraKeys!3325 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)))))

(declare-fun lt!429277 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429277 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429264 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429264 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429276 () Unit!32045)

(declare-fun addApplyDifferent!469 (ListLongMap!12281 (_ BitVec 64) V!32697 (_ BitVec 64)) Unit!32045)

(assert (=> b!952613 (= lt!429276 (addApplyDifferent!469 lt!429271 lt!429277 (minValue!5660 thiss!1141) lt!429264))))

(assert (=> b!952613 (= (apply!886 (+!2870 lt!429271 (tuple2!13585 lt!429277 (minValue!5660 thiss!1141))) lt!429264) (apply!886 lt!429271 lt!429264))))

(declare-fun lt!429275 () Unit!32045)

(assert (=> b!952613 (= lt!429275 lt!429276)))

(declare-fun lt!429280 () ListLongMap!12281)

(assert (=> b!952613 (= lt!429280 (getCurrentListMapNoExtraKeys!3325 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)))))

(declare-fun lt!429274 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429274 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429261 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429261 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429268 () Unit!32045)

(assert (=> b!952613 (= lt!429268 (addApplyDifferent!469 lt!429280 lt!429274 (zeroValue!5660 thiss!1141) lt!429261))))

(assert (=> b!952613 (= (apply!886 (+!2870 lt!429280 (tuple2!13585 lt!429274 (zeroValue!5660 thiss!1141))) lt!429261) (apply!886 lt!429280 lt!429261))))

(declare-fun lt!429266 () Unit!32045)

(assert (=> b!952613 (= lt!429266 lt!429268)))

(declare-fun lt!429279 () ListLongMap!12281)

(assert (=> b!952613 (= lt!429279 (getCurrentListMapNoExtraKeys!3325 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)))))

(declare-fun lt!429273 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429273 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429282 () (_ BitVec 64))

(assert (=> b!952613 (= lt!429282 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!952613 (= lt!429281 (addApplyDifferent!469 lt!429279 lt!429273 (minValue!5660 thiss!1141) lt!429282))))

(assert (=> b!952613 (= (apply!886 (+!2870 lt!429279 (tuple2!13585 lt!429273 (minValue!5660 thiss!1141))) lt!429282) (apply!886 lt!429279 lt!429282))))

(declare-fun b!952605 () Bool)

(declare-fun res!638151 () Bool)

(assert (=> b!952605 (=> (not res!638151) (not e!536501))))

(assert (=> b!952605 (= res!638151 e!536496)))

(declare-fun res!638155 () Bool)

(assert (=> b!952605 (=> res!638155 e!536496)))

(declare-fun e!536494 () Bool)

(assert (=> b!952605 (= res!638155 (not e!536494))))

(declare-fun res!638150 () Bool)

(assert (=> b!952605 (=> (not res!638150) (not e!536494))))

(assert (=> b!952605 (= res!638150 (bvslt #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))))))

(declare-fun d!115543 () Bool)

(assert (=> d!115543 e!536501))

(declare-fun res!638153 () Bool)

(assert (=> d!115543 (=> (not res!638153) (not e!536501))))

(assert (=> d!115543 (= res!638153 (or (bvsge #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))))))))

(declare-fun lt!429270 () ListLongMap!12281)

(assert (=> d!115543 (= lt!429269 lt!429270)))

(declare-fun lt!429278 () Unit!32045)

(assert (=> d!115543 (= lt!429278 e!536502)))

(declare-fun c!99673 () Bool)

(declare-fun e!536500 () Bool)

(assert (=> d!115543 (= c!99673 e!536500)))

(declare-fun res!638149 () Bool)

(assert (=> d!115543 (=> (not res!638149) (not e!536500))))

(assert (=> d!115543 (= res!638149 (bvslt #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))))))

(declare-fun e!536497 () ListLongMap!12281)

(assert (=> d!115543 (= lt!429270 e!536497)))

(assert (=> d!115543 (= c!99672 (and (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115543 (validMask!0 (mask!27672 thiss!1141))))

(assert (=> d!115543 (= (getCurrentListMap!3389 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5824 thiss!1141)) lt!429269)))

(declare-fun b!952614 () Bool)

(declare-fun c!99676 () Bool)

(assert (=> b!952614 (= c!99676 (and (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!952614 (= e!536504 e!536499)))

(declare-fun bm!41592 () Bool)

(assert (=> bm!41592 (= call!41595 call!41598)))

(declare-fun b!952615 () Bool)

(declare-fun Unit!32048 () Unit!32045)

(assert (=> b!952615 (= e!536502 Unit!32048)))

(declare-fun b!952616 () Bool)

(assert (=> b!952616 (= e!536498 e!536495)))

(declare-fun res!638156 () Bool)

(declare-fun call!41597 () Bool)

(assert (=> b!952616 (= res!638156 call!41597)))

(assert (=> b!952616 (=> (not res!638156) (not e!536495))))

(declare-fun b!952617 () Bool)

(assert (=> b!952617 (= e!536498 (not call!41597))))

(declare-fun b!952618 () Bool)

(assert (=> b!952618 (= e!536503 e!536493)))

(declare-fun res!638152 () Bool)

(assert (=> b!952618 (= res!638152 call!41594)))

(assert (=> b!952618 (=> (not res!638152) (not e!536493))))

(declare-fun bm!41593 () Bool)

(assert (=> bm!41593 (= call!41596 call!41595)))

(declare-fun b!952619 () Bool)

(assert (=> b!952619 (= e!536494 (validKeyInArray!0 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952620 () Bool)

(assert (=> b!952620 (= e!536497 (+!2870 call!41592 (tuple2!13585 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5660 thiss!1141))))))

(declare-fun b!952621 () Bool)

(assert (=> b!952621 (= e!536500 (validKeyInArray!0 (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!952622 () Bool)

(assert (=> b!952622 (= e!536497 e!536504)))

(assert (=> b!952622 (= c!99677 (and (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!41594 () Bool)

(assert (=> bm!41594 (= call!41593 call!41592)))

(declare-fun b!952623 () Bool)

(assert (=> b!952623 (= e!536499 call!41596)))

(declare-fun b!952624 () Bool)

(assert (=> b!952624 (= e!536503 (not call!41594))))

(declare-fun bm!41595 () Bool)

(assert (=> bm!41595 (= call!41597 (contains!5251 lt!429269 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!115543 c!99672) b!952620))

(assert (= (and d!115543 (not c!99672)) b!952622))

(assert (= (and b!952622 c!99677) b!952611))

(assert (= (and b!952622 (not c!99677)) b!952614))

(assert (= (and b!952614 c!99676) b!952609))

(assert (= (and b!952614 (not c!99676)) b!952623))

(assert (= (or b!952609 b!952623) bm!41593))

(assert (= (or b!952611 bm!41593) bm!41592))

(assert (= (or b!952611 b!952609) bm!41594))

(assert (= (or b!952620 bm!41592) bm!41591))

(assert (= (or b!952620 bm!41594) bm!41589))

(assert (= (and d!115543 res!638149) b!952621))

(assert (= (and d!115543 c!99673) b!952613))

(assert (= (and d!115543 (not c!99673)) b!952615))

(assert (= (and d!115543 res!638153) b!952605))

(assert (= (and b!952605 res!638150) b!952619))

(assert (= (and b!952605 (not res!638155)) b!952612))

(assert (= (and b!952612 res!638154) b!952606))

(assert (= (and b!952605 res!638151) b!952608))

(assert (= (and b!952608 c!99674) b!952618))

(assert (= (and b!952608 (not c!99674)) b!952624))

(assert (= (and b!952618 res!638152) b!952604))

(assert (= (or b!952618 b!952624) bm!41590))

(assert (= (and b!952608 res!638148) b!952607))

(assert (= (and b!952607 c!99675) b!952616))

(assert (= (and b!952607 (not c!99675)) b!952617))

(assert (= (and b!952616 res!638156) b!952610))

(assert (= (or b!952616 b!952617) bm!41595))

(declare-fun b_lambda!14415 () Bool)

(assert (=> (not b_lambda!14415) (not b!952606)))

(declare-fun t!27722 () Bool)

(declare-fun tb!6207 () Bool)

(assert (=> (and b!952476 (= (defaultEntry!5824 thiss!1141) (defaultEntry!5824 thiss!1141)) t!27722) tb!6207))

(declare-fun result!12343 () Bool)

(assert (=> tb!6207 (= result!12343 tp_is_empty!20799)))

(assert (=> b!952606 t!27722))

(declare-fun b_and!29775 () Bool)

(assert (= b_and!29771 (and (=> t!27722 result!12343) b_and!29775)))

(declare-fun m!884721 () Bool)

(assert (=> b!952613 m!884721))

(declare-fun m!884723 () Bool)

(assert (=> b!952613 m!884723))

(declare-fun m!884725 () Bool)

(assert (=> b!952613 m!884725))

(declare-fun m!884727 () Bool)

(assert (=> b!952613 m!884727))

(declare-fun m!884729 () Bool)

(assert (=> b!952613 m!884729))

(declare-fun m!884731 () Bool)

(assert (=> b!952613 m!884731))

(declare-fun m!884733 () Bool)

(assert (=> b!952613 m!884733))

(declare-fun m!884735 () Bool)

(assert (=> b!952613 m!884735))

(assert (=> b!952613 m!884721))

(declare-fun m!884737 () Bool)

(assert (=> b!952613 m!884737))

(assert (=> b!952613 m!884725))

(declare-fun m!884739 () Bool)

(assert (=> b!952613 m!884739))

(declare-fun m!884741 () Bool)

(assert (=> b!952613 m!884741))

(declare-fun m!884743 () Bool)

(assert (=> b!952613 m!884743))

(declare-fun m!884745 () Bool)

(assert (=> b!952613 m!884745))

(declare-fun m!884747 () Bool)

(assert (=> b!952613 m!884747))

(assert (=> b!952613 m!884733))

(declare-fun m!884749 () Bool)

(assert (=> b!952613 m!884749))

(declare-fun m!884751 () Bool)

(assert (=> b!952613 m!884751))

(assert (=> b!952613 m!884729))

(assert (=> b!952613 m!884701))

(assert (=> b!952606 m!884701))

(declare-fun m!884753 () Bool)

(assert (=> b!952606 m!884753))

(assert (=> b!952606 m!884701))

(declare-fun m!884755 () Bool)

(assert (=> b!952606 m!884755))

(declare-fun m!884757 () Bool)

(assert (=> b!952606 m!884757))

(assert (=> b!952606 m!884757))

(assert (=> b!952606 m!884755))

(declare-fun m!884759 () Bool)

(assert (=> b!952606 m!884759))

(assert (=> bm!41591 m!884747))

(assert (=> b!952619 m!884701))

(assert (=> b!952619 m!884701))

(assert (=> b!952619 m!884703))

(assert (=> d!115543 m!884641))

(assert (=> b!952621 m!884701))

(assert (=> b!952621 m!884701))

(assert (=> b!952621 m!884703))

(declare-fun m!884761 () Bool)

(assert (=> b!952610 m!884761))

(declare-fun m!884763 () Bool)

(assert (=> bm!41595 m!884763))

(declare-fun m!884765 () Bool)

(assert (=> b!952604 m!884765))

(declare-fun m!884767 () Bool)

(assert (=> b!952620 m!884767))

(declare-fun m!884769 () Bool)

(assert (=> bm!41590 m!884769))

(declare-fun m!884771 () Bool)

(assert (=> bm!41589 m!884771))

(assert (=> b!952612 m!884701))

(assert (=> b!952612 m!884701))

(declare-fun m!884773 () Bool)

(assert (=> b!952612 m!884773))

(assert (=> b!952471 d!115543))

(declare-fun d!115545 () Bool)

(declare-fun res!638158 () Bool)

(declare-fun e!536506 () Bool)

(assert (=> d!115545 (=> res!638158 e!536506)))

(assert (=> d!115545 (= res!638158 (bvsge lt!429172 (size!28188 (_keys!10778 thiss!1141))))))

(assert (=> d!115545 (= (arrayForallSeekEntryOrOpenFound!0 lt!429172 (_keys!10778 thiss!1141) (mask!27672 thiss!1141)) e!536506)))

(declare-fun b!952627 () Bool)

(declare-fun e!536507 () Bool)

(declare-fun call!41599 () Bool)

(assert (=> b!952627 (= e!536507 call!41599)))

(declare-fun b!952628 () Bool)

(declare-fun e!536508 () Bool)

(assert (=> b!952628 (= e!536508 call!41599)))

(declare-fun b!952629 () Bool)

(assert (=> b!952629 (= e!536506 e!536507)))

(declare-fun c!99678 () Bool)

(assert (=> b!952629 (= c!99678 (validKeyInArray!0 (select (arr!27709 (_keys!10778 thiss!1141)) lt!429172)))))

(declare-fun b!952630 () Bool)

(assert (=> b!952630 (= e!536507 e!536508)))

(declare-fun lt!429283 () (_ BitVec 64))

(assert (=> b!952630 (= lt!429283 (select (arr!27709 (_keys!10778 thiss!1141)) lt!429172))))

(declare-fun lt!429284 () Unit!32045)

(assert (=> b!952630 (= lt!429284 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10778 thiss!1141) lt!429283 lt!429172))))

(assert (=> b!952630 (arrayContainsKey!0 (_keys!10778 thiss!1141) lt!429283 #b00000000000000000000000000000000)))

(declare-fun lt!429285 () Unit!32045)

(assert (=> b!952630 (= lt!429285 lt!429284)))

(declare-fun res!638157 () Bool)

(assert (=> b!952630 (= res!638157 (= (seekEntryOrOpen!0 (select (arr!27709 (_keys!10778 thiss!1141)) lt!429172) (_keys!10778 thiss!1141) (mask!27672 thiss!1141)) (Found!9161 lt!429172)))))

(assert (=> b!952630 (=> (not res!638157) (not e!536508))))

(declare-fun bm!41596 () Bool)

(assert (=> bm!41596 (= call!41599 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429172 #b00000000000000000000000000000001) (_keys!10778 thiss!1141) (mask!27672 thiss!1141)))))

(assert (= (and d!115545 (not res!638158)) b!952629))

(assert (= (and b!952629 c!99678) b!952630))

(assert (= (and b!952629 (not c!99678)) b!952627))

(assert (= (and b!952630 res!638157) b!952628))

(assert (= (or b!952628 b!952627) bm!41596))

(declare-fun m!884775 () Bool)

(assert (=> b!952629 m!884775))

(assert (=> b!952629 m!884775))

(declare-fun m!884777 () Bool)

(assert (=> b!952629 m!884777))

(assert (=> b!952630 m!884775))

(declare-fun m!884779 () Bool)

(assert (=> b!952630 m!884779))

(declare-fun m!884781 () Bool)

(assert (=> b!952630 m!884781))

(assert (=> b!952630 m!884775))

(declare-fun m!884783 () Bool)

(assert (=> b!952630 m!884783))

(declare-fun m!884785 () Bool)

(assert (=> bm!41596 m!884785))

(assert (=> b!952470 d!115545))

(declare-fun d!115547 () Bool)

(declare-fun res!638163 () Bool)

(declare-fun e!536513 () Bool)

(assert (=> d!115547 (=> res!638163 e!536513)))

(assert (=> d!115547 (= res!638163 (= (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115547 (= (arrayContainsKey!0 (_keys!10778 thiss!1141) key!756 #b00000000000000000000000000000000) e!536513)))

(declare-fun b!952635 () Bool)

(declare-fun e!536514 () Bool)

(assert (=> b!952635 (= e!536513 e!536514)))

(declare-fun res!638164 () Bool)

(assert (=> b!952635 (=> (not res!638164) (not e!536514))))

(assert (=> b!952635 (= res!638164 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28188 (_keys!10778 thiss!1141))))))

(declare-fun b!952636 () Bool)

(assert (=> b!952636 (= e!536514 (arrayContainsKey!0 (_keys!10778 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115547 (not res!638163)) b!952635))

(assert (= (and b!952635 res!638164) b!952636))

(assert (=> d!115547 m!884701))

(declare-fun m!884787 () Bool)

(assert (=> b!952636 m!884787))

(assert (=> b!952470 d!115547))

(declare-fun d!115549 () Bool)

(declare-fun e!536517 () Bool)

(assert (=> d!115549 e!536517))

(declare-fun c!99681 () Bool)

(assert (=> d!115549 (= c!99681 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429288 () Unit!32045)

(declare-fun choose!1598 (array!57634 array!57632 (_ BitVec 32) (_ BitVec 32) V!32697 V!32697 (_ BitVec 64) Int) Unit!32045)

(assert (=> d!115549 (= lt!429288 (choose!1598 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) key!756 (defaultEntry!5824 thiss!1141)))))

(assert (=> d!115549 (validMask!0 (mask!27672 thiss!1141))))

(assert (=> d!115549 (= (lemmaKeyInListMapIsInArray!335 (_keys!10778 thiss!1141) (_values!5847 thiss!1141) (mask!27672 thiss!1141) (extraKeys!5556 thiss!1141) (zeroValue!5660 thiss!1141) (minValue!5660 thiss!1141) key!756 (defaultEntry!5824 thiss!1141)) lt!429288)))

(declare-fun b!952641 () Bool)

(assert (=> b!952641 (= e!536517 (arrayContainsKey!0 (_keys!10778 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!952642 () Bool)

(assert (=> b!952642 (= e!536517 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5556 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115549 c!99681) b!952641))

(assert (= (and d!115549 (not c!99681)) b!952642))

(declare-fun m!884789 () Bool)

(assert (=> d!115549 m!884789))

(assert (=> d!115549 m!884641))

(assert (=> b!952641 m!884643))

(assert (=> b!952470 d!115549))

(declare-fun d!115551 () Bool)

(assert (=> d!115551 (arrayForallSeekEntryOrOpenFound!0 lt!429172 (_keys!10778 thiss!1141) (mask!27672 thiss!1141))))

(declare-fun lt!429291 () Unit!32045)

(declare-fun choose!38 (array!57634 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32045)

(assert (=> d!115551 (= lt!429291 (choose!38 (_keys!10778 thiss!1141) (mask!27672 thiss!1141) #b00000000000000000000000000000000 lt!429172))))

(assert (=> d!115551 (validMask!0 (mask!27672 thiss!1141))))

(assert (=> d!115551 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10778 thiss!1141) (mask!27672 thiss!1141) #b00000000000000000000000000000000 lt!429172) lt!429291)))

(declare-fun bs!26763 () Bool)

(assert (= bs!26763 d!115551))

(assert (=> bs!26763 m!884647))

(declare-fun m!884791 () Bool)

(assert (=> bs!26763 m!884791))

(assert (=> bs!26763 m!884641))

(assert (=> b!952470 d!115551))

(declare-fun d!115553 () Bool)

(declare-fun lt!429294 () (_ BitVec 32))

(assert (=> d!115553 (and (or (bvslt lt!429294 #b00000000000000000000000000000000) (bvsge lt!429294 (size!28188 (_keys!10778 thiss!1141))) (and (bvsge lt!429294 #b00000000000000000000000000000000) (bvslt lt!429294 (size!28188 (_keys!10778 thiss!1141))))) (bvsge lt!429294 #b00000000000000000000000000000000) (bvslt lt!429294 (size!28188 (_keys!10778 thiss!1141))) (= (select (arr!27709 (_keys!10778 thiss!1141)) lt!429294) key!756))))

(declare-fun e!536520 () (_ BitVec 32))

(assert (=> d!115553 (= lt!429294 e!536520)))

(declare-fun c!99684 () Bool)

(assert (=> d!115553 (= c!99684 (= (select (arr!27709 (_keys!10778 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115553 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28188 (_keys!10778 thiss!1141))) (bvslt (size!28188 (_keys!10778 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115553 (= (arrayScanForKey!0 (_keys!10778 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429294)))

(declare-fun b!952647 () Bool)

(assert (=> b!952647 (= e!536520 #b00000000000000000000000000000000)))

(declare-fun b!952648 () Bool)

(assert (=> b!952648 (= e!536520 (arrayScanForKey!0 (_keys!10778 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115553 c!99684) b!952647))

(assert (= (and d!115553 (not c!99684)) b!952648))

(declare-fun m!884793 () Bool)

(assert (=> d!115553 m!884793))

(assert (=> d!115553 m!884701))

(declare-fun m!884795 () Bool)

(assert (=> b!952648 m!884795))

(assert (=> b!952470 d!115553))

(declare-fun d!115555 () Bool)

(assert (=> d!115555 (= (validMask!0 (mask!27672 thiss!1141)) (and (or (= (mask!27672 thiss!1141) #b00000000000000000000000000000111) (= (mask!27672 thiss!1141) #b00000000000000000000000000001111) (= (mask!27672 thiss!1141) #b00000000000000000000000000011111) (= (mask!27672 thiss!1141) #b00000000000000000000000000111111) (= (mask!27672 thiss!1141) #b00000000000000000000000001111111) (= (mask!27672 thiss!1141) #b00000000000000000000000011111111) (= (mask!27672 thiss!1141) #b00000000000000000000000111111111) (= (mask!27672 thiss!1141) #b00000000000000000000001111111111) (= (mask!27672 thiss!1141) #b00000000000000000000011111111111) (= (mask!27672 thiss!1141) #b00000000000000000000111111111111) (= (mask!27672 thiss!1141) #b00000000000000000001111111111111) (= (mask!27672 thiss!1141) #b00000000000000000011111111111111) (= (mask!27672 thiss!1141) #b00000000000000000111111111111111) (= (mask!27672 thiss!1141) #b00000000000000001111111111111111) (= (mask!27672 thiss!1141) #b00000000000000011111111111111111) (= (mask!27672 thiss!1141) #b00000000000000111111111111111111) (= (mask!27672 thiss!1141) #b00000000000001111111111111111111) (= (mask!27672 thiss!1141) #b00000000000011111111111111111111) (= (mask!27672 thiss!1141) #b00000000000111111111111111111111) (= (mask!27672 thiss!1141) #b00000000001111111111111111111111) (= (mask!27672 thiss!1141) #b00000000011111111111111111111111) (= (mask!27672 thiss!1141) #b00000000111111111111111111111111) (= (mask!27672 thiss!1141) #b00000001111111111111111111111111) (= (mask!27672 thiss!1141) #b00000011111111111111111111111111) (= (mask!27672 thiss!1141) #b00000111111111111111111111111111) (= (mask!27672 thiss!1141) #b00001111111111111111111111111111) (= (mask!27672 thiss!1141) #b00011111111111111111111111111111) (= (mask!27672 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27672 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!952470 d!115555))

(declare-fun d!115557 () Bool)

(assert (=> d!115557 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!952473 d!115557))

(declare-fun mapIsEmpty!33142 () Bool)

(declare-fun mapRes!33142 () Bool)

(assert (=> mapIsEmpty!33142 mapRes!33142))

(declare-fun mapNonEmpty!33142 () Bool)

(declare-fun tp!63504 () Bool)

(declare-fun e!536525 () Bool)

(assert (=> mapNonEmpty!33142 (= mapRes!33142 (and tp!63504 e!536525))))

(declare-fun mapValue!33142 () ValueCell!9918)

(declare-fun mapRest!33142 () (Array (_ BitVec 32) ValueCell!9918))

(declare-fun mapKey!33142 () (_ BitVec 32))

(assert (=> mapNonEmpty!33142 (= mapRest!33136 (store mapRest!33142 mapKey!33142 mapValue!33142))))

(declare-fun condMapEmpty!33142 () Bool)

(declare-fun mapDefault!33142 () ValueCell!9918)

(assert (=> mapNonEmpty!33136 (= condMapEmpty!33142 (= mapRest!33136 ((as const (Array (_ BitVec 32) ValueCell!9918)) mapDefault!33142)))))

(declare-fun e!536526 () Bool)

(assert (=> mapNonEmpty!33136 (= tp!63494 (and e!536526 mapRes!33142))))

(declare-fun b!952655 () Bool)

(assert (=> b!952655 (= e!536525 tp_is_empty!20799)))

(declare-fun b!952656 () Bool)

(assert (=> b!952656 (= e!536526 tp_is_empty!20799)))

(assert (= (and mapNonEmpty!33136 condMapEmpty!33142) mapIsEmpty!33142))

(assert (= (and mapNonEmpty!33136 (not condMapEmpty!33142)) mapNonEmpty!33142))

(assert (= (and mapNonEmpty!33142 ((_ is ValueCellFull!9918) mapValue!33142)) b!952655))

(assert (= (and mapNonEmpty!33136 ((_ is ValueCellFull!9918) mapDefault!33142)) b!952656))

(declare-fun m!884797 () Bool)

(assert (=> mapNonEmpty!33142 m!884797))

(declare-fun b_lambda!14417 () Bool)

(assert (= b_lambda!14415 (or (and b!952476 b_free!18291) b_lambda!14417)))

(check-sat (not b!952559) (not b!952604) (not b!952636) (not d!115543) (not bm!41596) (not b_lambda!14417) (not b!952552) (not b!952619) (not b!952629) (not b!952551) (not bm!41595) (not b!952613) (not d!115541) (not b!952610) b_and!29775 (not b!952520) (not b!952620) (not d!115549) (not bm!41574) (not bm!41590) (not b!952648) tp_is_empty!20799 (not b!952641) (not b!952539) (not d!115535) (not b!952612) (not b!952561) (not bm!41589) (not mapNonEmpty!33142) (not b_next!18291) (not b!952606) (not b!952522) (not d!115551) (not bm!41591) (not d!115537) (not b!952621) (not b!952630) (not b!952521))
(check-sat b_and!29775 (not b_next!18291))
