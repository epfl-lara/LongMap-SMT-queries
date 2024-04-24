; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33894 () Bool)

(assert start!33894)

(declare-fun b_free!7087 () Bool)

(declare-fun b_next!7087 () Bool)

(assert (=> start!33894 (= b_free!7087 (not b_next!7087))))

(declare-fun tp!24773 () Bool)

(declare-fun b_and!14287 () Bool)

(assert (=> start!33894 (= tp!24773 b_and!14287)))

(declare-fun res!186616 () Bool)

(declare-fun e!207213 () Bool)

(assert (=> start!33894 (=> (not res!186616) (not e!207213))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33894 (= res!186616 (validMask!0 mask!2385))))

(assert (=> start!33894 e!207213))

(assert (=> start!33894 true))

(declare-fun tp_is_empty!7039 () Bool)

(assert (=> start!33894 tp_is_empty!7039))

(assert (=> start!33894 tp!24773))

(declare-datatypes ((V!10363 0))(
  ( (V!10364 (val!3564 Int)) )
))
(declare-datatypes ((ValueCell!3176 0))(
  ( (ValueCellFull!3176 (v!5730 V!10363)) (EmptyCell!3176) )
))
(declare-datatypes ((array!17656 0))(
  ( (array!17657 (arr!8355 (Array (_ BitVec 32) ValueCell!3176)) (size!8707 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17656)

(declare-fun e!207216 () Bool)

(declare-fun array_inv!6210 (array!17656) Bool)

(assert (=> start!33894 (and (array_inv!6210 _values!1525) e!207216)))

(declare-datatypes ((array!17658 0))(
  ( (array!17659 (arr!8356 (Array (_ BitVec 32) (_ BitVec 64))) (size!8708 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17658)

(declare-fun array_inv!6211 (array!17658) Bool)

(assert (=> start!33894 (array_inv!6211 _keys!1895)))

(declare-fun b!337713 () Bool)

(declare-fun res!186612 () Bool)

(assert (=> b!337713 (=> (not res!186612) (not e!207213))))

(declare-datatypes ((List!4699 0))(
  ( (Nil!4696) (Cons!4695 (h!5551 (_ BitVec 64)) (t!9785 List!4699)) )
))
(declare-fun arrayNoDuplicates!0 (array!17658 (_ BitVec 32) List!4699) Bool)

(assert (=> b!337713 (= res!186612 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4696))))

(declare-fun mapNonEmpty!11964 () Bool)

(declare-fun mapRes!11964 () Bool)

(declare-fun tp!24774 () Bool)

(declare-fun e!207215 () Bool)

(assert (=> mapNonEmpty!11964 (= mapRes!11964 (and tp!24774 e!207215))))

(declare-fun mapRest!11964 () (Array (_ BitVec 32) ValueCell!3176))

(declare-fun mapValue!11964 () ValueCell!3176)

(declare-fun mapKey!11964 () (_ BitVec 32))

(assert (=> mapNonEmpty!11964 (= (arr!8355 _values!1525) (store mapRest!11964 mapKey!11964 mapValue!11964))))

(declare-fun mapIsEmpty!11964 () Bool)

(assert (=> mapIsEmpty!11964 mapRes!11964))

(declare-fun b!337714 () Bool)

(declare-fun res!186615 () Bool)

(assert (=> b!337714 (=> (not res!186615) (not e!207213))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10363)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10363)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5088 0))(
  ( (tuple2!5089 (_1!2555 (_ BitVec 64)) (_2!2555 V!10363)) )
))
(declare-datatypes ((List!4700 0))(
  ( (Nil!4697) (Cons!4696 (h!5552 tuple2!5088) (t!9786 List!4700)) )
))
(declare-datatypes ((ListLongMap!4003 0))(
  ( (ListLongMap!4004 (toList!2017 List!4700)) )
))
(declare-fun contains!2083 (ListLongMap!4003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1546 (array!17658 array!17656 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 32) Int) ListLongMap!4003)

(assert (=> b!337714 (= res!186615 (not (contains!2083 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337715 () Bool)

(declare-datatypes ((Unit!10448 0))(
  ( (Unit!10449) )
))
(declare-fun e!207217 () Unit!10448)

(declare-fun Unit!10450 () Unit!10448)

(assert (=> b!337715 (= e!207217 Unit!10450)))

(declare-fun lt!160520 () Unit!10448)

(declare-fun lemmaArrayContainsKeyThenInListMap!274 (array!17658 array!17656 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 64) (_ BitVec 32) Int) Unit!10448)

(declare-fun arrayScanForKey!0 (array!17658 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337715 (= lt!160520 (lemmaArrayContainsKeyThenInListMap!274 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337715 false))

(declare-fun b!337716 () Bool)

(assert (=> b!337716 (= e!207215 tp_is_empty!7039)))

(declare-fun b!337717 () Bool)

(declare-fun Unit!10451 () Unit!10448)

(assert (=> b!337717 (= e!207217 Unit!10451)))

(declare-fun b!337718 () Bool)

(declare-fun res!186614 () Bool)

(assert (=> b!337718 (=> (not res!186614) (not e!207213))))

(assert (=> b!337718 (= res!186614 (and (= (size!8707 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8708 _keys!1895) (size!8707 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!337719 () Bool)

(declare-fun res!186613 () Bool)

(assert (=> b!337719 (=> (not res!186613) (not e!207213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337719 (= res!186613 (validKeyInArray!0 k0!1348))))

(declare-fun b!337720 () Bool)

(declare-fun e!207218 () Bool)

(assert (=> b!337720 (= e!207218 tp_is_empty!7039)))

(declare-fun b!337721 () Bool)

(declare-fun e!207214 () Bool)

(assert (=> b!337721 (= e!207214 (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun lt!160522 () Unit!10448)

(assert (=> b!337721 (= lt!160522 e!207217)))

(declare-fun c!52289 () Bool)

(declare-fun arrayContainsKey!0 (array!17658 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337721 (= c!52289 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!337722 () Bool)

(assert (=> b!337722 (= e!207213 e!207214)))

(declare-fun res!186611 () Bool)

(assert (=> b!337722 (=> (not res!186611) (not e!207214))))

(declare-datatypes ((SeekEntryResult!3189 0))(
  ( (MissingZero!3189 (index!14935 (_ BitVec 32))) (Found!3189 (index!14936 (_ BitVec 32))) (Intermediate!3189 (undefined!4001 Bool) (index!14937 (_ BitVec 32)) (x!33622 (_ BitVec 32))) (Undefined!3189) (MissingVacant!3189 (index!14938 (_ BitVec 32))) )
))
(declare-fun lt!160521 () SeekEntryResult!3189)

(get-info :version)

(assert (=> b!337722 (= res!186611 (and (not ((_ is Found!3189) lt!160521)) ((_ is MissingZero!3189) lt!160521)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17658 (_ BitVec 32)) SeekEntryResult!3189)

(assert (=> b!337722 (= lt!160521 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337723 () Bool)

(assert (=> b!337723 (= e!207216 (and e!207218 mapRes!11964))))

(declare-fun condMapEmpty!11964 () Bool)

(declare-fun mapDefault!11964 () ValueCell!3176)

(assert (=> b!337723 (= condMapEmpty!11964 (= (arr!8355 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3176)) mapDefault!11964)))))

(declare-fun b!337724 () Bool)

(declare-fun res!186617 () Bool)

(assert (=> b!337724 (=> (not res!186617) (not e!207213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17658 (_ BitVec 32)) Bool)

(assert (=> b!337724 (= res!186617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!33894 res!186616) b!337718))

(assert (= (and b!337718 res!186614) b!337724))

(assert (= (and b!337724 res!186617) b!337713))

(assert (= (and b!337713 res!186612) b!337719))

(assert (= (and b!337719 res!186613) b!337714))

(assert (= (and b!337714 res!186615) b!337722))

(assert (= (and b!337722 res!186611) b!337721))

(assert (= (and b!337721 c!52289) b!337715))

(assert (= (and b!337721 (not c!52289)) b!337717))

(assert (= (and b!337723 condMapEmpty!11964) mapIsEmpty!11964))

(assert (= (and b!337723 (not condMapEmpty!11964)) mapNonEmpty!11964))

(assert (= (and mapNonEmpty!11964 ((_ is ValueCellFull!3176) mapValue!11964)) b!337716))

(assert (= (and b!337723 ((_ is ValueCellFull!3176) mapDefault!11964)) b!337720))

(assert (= start!33894 b!337723))

(declare-fun m!341425 () Bool)

(assert (=> b!337719 m!341425))

(declare-fun m!341427 () Bool)

(assert (=> start!33894 m!341427))

(declare-fun m!341429 () Bool)

(assert (=> start!33894 m!341429))

(declare-fun m!341431 () Bool)

(assert (=> start!33894 m!341431))

(declare-fun m!341433 () Bool)

(assert (=> mapNonEmpty!11964 m!341433))

(declare-fun m!341435 () Bool)

(assert (=> b!337714 m!341435))

(assert (=> b!337714 m!341435))

(declare-fun m!341437 () Bool)

(assert (=> b!337714 m!341437))

(declare-fun m!341439 () Bool)

(assert (=> b!337715 m!341439))

(assert (=> b!337715 m!341439))

(declare-fun m!341441 () Bool)

(assert (=> b!337715 m!341441))

(declare-fun m!341443 () Bool)

(assert (=> b!337721 m!341443))

(declare-fun m!341445 () Bool)

(assert (=> b!337722 m!341445))

(declare-fun m!341447 () Bool)

(assert (=> b!337713 m!341447))

(declare-fun m!341449 () Bool)

(assert (=> b!337724 m!341449))

(check-sat (not b!337724) (not b!337719) tp_is_empty!7039 (not b!337715) (not b!337721) (not b!337713) (not start!33894) (not b!337722) (not b_next!7087) (not mapNonEmpty!11964) b_and!14287 (not b!337714))
(check-sat b_and!14287 (not b_next!7087))
(get-model)

(declare-fun b!337809 () Bool)

(declare-fun e!207268 () SeekEntryResult!3189)

(declare-fun lt!160548 () SeekEntryResult!3189)

(assert (=> b!337809 (= e!207268 (Found!3189 (index!14937 lt!160548)))))

(declare-fun b!337810 () Bool)

(declare-fun e!207269 () SeekEntryResult!3189)

(assert (=> b!337810 (= e!207269 e!207268)))

(declare-fun lt!160547 () (_ BitVec 64))

(assert (=> b!337810 (= lt!160547 (select (arr!8356 _keys!1895) (index!14937 lt!160548)))))

(declare-fun c!52303 () Bool)

(assert (=> b!337810 (= c!52303 (= lt!160547 k0!1348))))

(declare-fun e!207267 () SeekEntryResult!3189)

(declare-fun b!337811 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17658 (_ BitVec 32)) SeekEntryResult!3189)

(assert (=> b!337811 (= e!207267 (seekKeyOrZeroReturnVacant!0 (x!33622 lt!160548) (index!14937 lt!160548) (index!14937 lt!160548) k0!1348 _keys!1895 mask!2385))))

(declare-fun d!70769 () Bool)

(declare-fun lt!160549 () SeekEntryResult!3189)

(assert (=> d!70769 (and (or ((_ is Undefined!3189) lt!160549) (not ((_ is Found!3189) lt!160549)) (and (bvsge (index!14936 lt!160549) #b00000000000000000000000000000000) (bvslt (index!14936 lt!160549) (size!8708 _keys!1895)))) (or ((_ is Undefined!3189) lt!160549) ((_ is Found!3189) lt!160549) (not ((_ is MissingZero!3189) lt!160549)) (and (bvsge (index!14935 lt!160549) #b00000000000000000000000000000000) (bvslt (index!14935 lt!160549) (size!8708 _keys!1895)))) (or ((_ is Undefined!3189) lt!160549) ((_ is Found!3189) lt!160549) ((_ is MissingZero!3189) lt!160549) (not ((_ is MissingVacant!3189) lt!160549)) (and (bvsge (index!14938 lt!160549) #b00000000000000000000000000000000) (bvslt (index!14938 lt!160549) (size!8708 _keys!1895)))) (or ((_ is Undefined!3189) lt!160549) (ite ((_ is Found!3189) lt!160549) (= (select (arr!8356 _keys!1895) (index!14936 lt!160549)) k0!1348) (ite ((_ is MissingZero!3189) lt!160549) (= (select (arr!8356 _keys!1895) (index!14935 lt!160549)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3189) lt!160549) (= (select (arr!8356 _keys!1895) (index!14938 lt!160549)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70769 (= lt!160549 e!207269)))

(declare-fun c!52302 () Bool)

(assert (=> d!70769 (= c!52302 (and ((_ is Intermediate!3189) lt!160548) (undefined!4001 lt!160548)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17658 (_ BitVec 32)) SeekEntryResult!3189)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70769 (= lt!160548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70769 (validMask!0 mask!2385)))

(assert (=> d!70769 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160549)))

(declare-fun b!337812 () Bool)

(assert (=> b!337812 (= e!207269 Undefined!3189)))

(declare-fun b!337813 () Bool)

(declare-fun c!52304 () Bool)

(assert (=> b!337813 (= c!52304 (= lt!160547 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!337813 (= e!207268 e!207267)))

(declare-fun b!337814 () Bool)

(assert (=> b!337814 (= e!207267 (MissingZero!3189 (index!14937 lt!160548)))))

(assert (= (and d!70769 c!52302) b!337812))

(assert (= (and d!70769 (not c!52302)) b!337810))

(assert (= (and b!337810 c!52303) b!337809))

(assert (= (and b!337810 (not c!52303)) b!337813))

(assert (= (and b!337813 c!52304) b!337814))

(assert (= (and b!337813 (not c!52304)) b!337811))

(declare-fun m!341503 () Bool)

(assert (=> b!337810 m!341503))

(declare-fun m!341505 () Bool)

(assert (=> b!337811 m!341505))

(declare-fun m!341507 () Bool)

(assert (=> d!70769 m!341507))

(assert (=> d!70769 m!341427))

(declare-fun m!341509 () Bool)

(assert (=> d!70769 m!341509))

(declare-fun m!341511 () Bool)

(assert (=> d!70769 m!341511))

(assert (=> d!70769 m!341509))

(declare-fun m!341513 () Bool)

(assert (=> d!70769 m!341513))

(declare-fun m!341515 () Bool)

(assert (=> d!70769 m!341515))

(assert (=> b!337722 d!70769))

(declare-fun b!337823 () Bool)

(declare-fun e!207278 () Bool)

(declare-fun call!26366 () Bool)

(assert (=> b!337823 (= e!207278 call!26366)))

(declare-fun b!337824 () Bool)

(declare-fun e!207276 () Bool)

(assert (=> b!337824 (= e!207276 e!207278)))

(declare-fun lt!160558 () (_ BitVec 64))

(assert (=> b!337824 (= lt!160558 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160556 () Unit!10448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17658 (_ BitVec 64) (_ BitVec 32)) Unit!10448)

(assert (=> b!337824 (= lt!160556 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160558 #b00000000000000000000000000000000))))

(assert (=> b!337824 (arrayContainsKey!0 _keys!1895 lt!160558 #b00000000000000000000000000000000)))

(declare-fun lt!160557 () Unit!10448)

(assert (=> b!337824 (= lt!160557 lt!160556)))

(declare-fun res!186664 () Bool)

(assert (=> b!337824 (= res!186664 (= (seekEntryOrOpen!0 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3189 #b00000000000000000000000000000000)))))

(assert (=> b!337824 (=> (not res!186664) (not e!207278))))

(declare-fun b!337825 () Bool)

(declare-fun e!207277 () Bool)

(assert (=> b!337825 (= e!207277 e!207276)))

(declare-fun c!52307 () Bool)

(assert (=> b!337825 (= c!52307 (validKeyInArray!0 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70771 () Bool)

(declare-fun res!186665 () Bool)

(assert (=> d!70771 (=> res!186665 e!207277)))

(assert (=> d!70771 (= res!186665 (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(assert (=> d!70771 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207277)))

(declare-fun bm!26363 () Bool)

(assert (=> bm!26363 (= call!26366 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!337826 () Bool)

(assert (=> b!337826 (= e!207276 call!26366)))

(assert (= (and d!70771 (not res!186665)) b!337825))

(assert (= (and b!337825 c!52307) b!337824))

(assert (= (and b!337825 (not c!52307)) b!337826))

(assert (= (and b!337824 res!186664) b!337823))

(assert (= (or b!337823 b!337826) bm!26363))

(declare-fun m!341517 () Bool)

(assert (=> b!337824 m!341517))

(declare-fun m!341519 () Bool)

(assert (=> b!337824 m!341519))

(declare-fun m!341521 () Bool)

(assert (=> b!337824 m!341521))

(assert (=> b!337824 m!341517))

(declare-fun m!341523 () Bool)

(assert (=> b!337824 m!341523))

(assert (=> b!337825 m!341517))

(assert (=> b!337825 m!341517))

(declare-fun m!341525 () Bool)

(assert (=> b!337825 m!341525))

(declare-fun m!341527 () Bool)

(assert (=> bm!26363 m!341527))

(assert (=> b!337724 d!70771))

(declare-fun d!70773 () Bool)

(assert (=> d!70773 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337719 d!70773))

(declare-fun d!70775 () Bool)

(assert (=> d!70775 (contains!2083 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160561 () Unit!10448)

(declare-fun choose!1305 (array!17658 array!17656 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 64) (_ BitVec 32) Int) Unit!10448)

(assert (=> d!70775 (= lt!160561 (choose!1305 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70775 (validMask!0 mask!2385)))

(assert (=> d!70775 (= (lemmaArrayContainsKeyThenInListMap!274 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160561)))

(declare-fun bs!11655 () Bool)

(assert (= bs!11655 d!70775))

(assert (=> bs!11655 m!341435))

(assert (=> bs!11655 m!341435))

(assert (=> bs!11655 m!341437))

(assert (=> bs!11655 m!341439))

(declare-fun m!341529 () Bool)

(assert (=> bs!11655 m!341529))

(assert (=> bs!11655 m!341427))

(assert (=> b!337715 d!70775))

(declare-fun d!70777 () Bool)

(declare-fun lt!160564 () (_ BitVec 32))

(assert (=> d!70777 (and (or (bvslt lt!160564 #b00000000000000000000000000000000) (bvsge lt!160564 (size!8708 _keys!1895)) (and (bvsge lt!160564 #b00000000000000000000000000000000) (bvslt lt!160564 (size!8708 _keys!1895)))) (bvsge lt!160564 #b00000000000000000000000000000000) (bvslt lt!160564 (size!8708 _keys!1895)) (= (select (arr!8356 _keys!1895) lt!160564) k0!1348))))

(declare-fun e!207281 () (_ BitVec 32))

(assert (=> d!70777 (= lt!160564 e!207281)))

(declare-fun c!52310 () Bool)

(assert (=> d!70777 (= c!52310 (= (select (arr!8356 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70777 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)) (bvslt (size!8708 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70777 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160564)))

(declare-fun b!337831 () Bool)

(assert (=> b!337831 (= e!207281 #b00000000000000000000000000000000)))

(declare-fun b!337832 () Bool)

(assert (=> b!337832 (= e!207281 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70777 c!52310) b!337831))

(assert (= (and d!70777 (not c!52310)) b!337832))

(declare-fun m!341531 () Bool)

(assert (=> d!70777 m!341531))

(assert (=> d!70777 m!341517))

(declare-fun m!341533 () Bool)

(assert (=> b!337832 m!341533))

(assert (=> b!337715 d!70777))

(declare-fun d!70779 () Bool)

(declare-fun e!207287 () Bool)

(assert (=> d!70779 e!207287))

(declare-fun res!186668 () Bool)

(assert (=> d!70779 (=> res!186668 e!207287)))

(declare-fun lt!160574 () Bool)

(assert (=> d!70779 (= res!186668 (not lt!160574))))

(declare-fun lt!160573 () Bool)

(assert (=> d!70779 (= lt!160574 lt!160573)))

(declare-fun lt!160575 () Unit!10448)

(declare-fun e!207286 () Unit!10448)

(assert (=> d!70779 (= lt!160575 e!207286)))

(declare-fun c!52313 () Bool)

(assert (=> d!70779 (= c!52313 lt!160573)))

(declare-fun containsKey!319 (List!4700 (_ BitVec 64)) Bool)

(assert (=> d!70779 (= lt!160573 (containsKey!319 (toList!2017 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70779 (= (contains!2083 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160574)))

(declare-fun b!337839 () Bool)

(declare-fun lt!160576 () Unit!10448)

(assert (=> b!337839 (= e!207286 lt!160576)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!267 (List!4700 (_ BitVec 64)) Unit!10448)

(assert (=> b!337839 (= lt!160576 (lemmaContainsKeyImpliesGetValueByKeyDefined!267 (toList!2017 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!334 0))(
  ( (Some!333 (v!5733 V!10363)) (None!332) )
))
(declare-fun isDefined!268 (Option!334) Bool)

(declare-fun getValueByKey!328 (List!4700 (_ BitVec 64)) Option!334)

(assert (=> b!337839 (isDefined!268 (getValueByKey!328 (toList!2017 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!337840 () Bool)

(declare-fun Unit!10452 () Unit!10448)

(assert (=> b!337840 (= e!207286 Unit!10452)))

(declare-fun b!337841 () Bool)

(assert (=> b!337841 (= e!207287 (isDefined!268 (getValueByKey!328 (toList!2017 (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70779 c!52313) b!337839))

(assert (= (and d!70779 (not c!52313)) b!337840))

(assert (= (and d!70779 (not res!186668)) b!337841))

(declare-fun m!341535 () Bool)

(assert (=> d!70779 m!341535))

(declare-fun m!341537 () Bool)

(assert (=> b!337839 m!341537))

(declare-fun m!341539 () Bool)

(assert (=> b!337839 m!341539))

(assert (=> b!337839 m!341539))

(declare-fun m!341541 () Bool)

(assert (=> b!337839 m!341541))

(assert (=> b!337841 m!341539))

(assert (=> b!337841 m!341539))

(assert (=> b!337841 m!341541))

(assert (=> b!337714 d!70779))

(declare-fun b!337884 () Bool)

(declare-fun e!207318 () Bool)

(declare-fun e!207321 () Bool)

(assert (=> b!337884 (= e!207318 e!207321)))

(declare-fun res!186695 () Bool)

(assert (=> b!337884 (=> (not res!186695) (not e!207321))))

(declare-fun lt!160622 () ListLongMap!4003)

(assert (=> b!337884 (= res!186695 (contains!2083 lt!160622 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!337884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun b!337885 () Bool)

(declare-fun e!207322 () ListLongMap!4003)

(declare-fun call!26381 () ListLongMap!4003)

(assert (=> b!337885 (= e!207322 call!26381)))

(declare-fun bm!26378 () Bool)

(declare-fun call!26387 () ListLongMap!4003)

(declare-fun call!26383 () ListLongMap!4003)

(assert (=> bm!26378 (= call!26387 call!26383)))

(declare-fun bm!26379 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!585 (array!17658 array!17656 (_ BitVec 32) (_ BitVec 32) V!10363 V!10363 (_ BitVec 32) Int) ListLongMap!4003)

(assert (=> bm!26379 (= call!26383 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!337887 () Bool)

(declare-fun e!207315 () Bool)

(declare-fun e!207320 () Bool)

(assert (=> b!337887 (= e!207315 e!207320)))

(declare-fun c!52326 () Bool)

(assert (=> b!337887 (= c!52326 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26380 () Bool)

(declare-fun call!26386 () ListLongMap!4003)

(assert (=> bm!26380 (= call!26386 call!26387)))

(declare-fun bm!26381 () Bool)

(declare-fun call!26384 () ListLongMap!4003)

(assert (=> bm!26381 (= call!26381 call!26384)))

(declare-fun b!337888 () Bool)

(declare-fun res!186693 () Bool)

(assert (=> b!337888 (=> (not res!186693) (not e!207315))))

(declare-fun e!207316 () Bool)

(assert (=> b!337888 (= res!186693 e!207316)))

(declare-fun c!52329 () Bool)

(assert (=> b!337888 (= c!52329 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!337889 () Bool)

(declare-fun res!186690 () Bool)

(assert (=> b!337889 (=> (not res!186690) (not e!207315))))

(assert (=> b!337889 (= res!186690 e!207318)))

(declare-fun res!186687 () Bool)

(assert (=> b!337889 (=> res!186687 e!207318)))

(declare-fun e!207324 () Bool)

(assert (=> b!337889 (= res!186687 (not e!207324))))

(declare-fun res!186691 () Bool)

(assert (=> b!337889 (=> (not res!186691) (not e!207324))))

(assert (=> b!337889 (= res!186691 (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun b!337890 () Bool)

(declare-fun e!207323 () Bool)

(assert (=> b!337890 (= e!207320 e!207323)))

(declare-fun res!186694 () Bool)

(declare-fun call!26385 () Bool)

(assert (=> b!337890 (= res!186694 call!26385)))

(assert (=> b!337890 (=> (not res!186694) (not e!207323))))

(declare-fun b!337891 () Bool)

(declare-fun e!207319 () Bool)

(declare-fun apply!269 (ListLongMap!4003 (_ BitVec 64)) V!10363)

(assert (=> b!337891 (= e!207319 (= (apply!269 lt!160622 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!337892 () Bool)

(declare-fun e!207326 () Unit!10448)

(declare-fun Unit!10453 () Unit!10448)

(assert (=> b!337892 (= e!207326 Unit!10453)))

(declare-fun d!70781 () Bool)

(assert (=> d!70781 e!207315))

(declare-fun res!186689 () Bool)

(assert (=> d!70781 (=> (not res!186689) (not e!207315))))

(assert (=> d!70781 (= res!186689 (or (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))))

(declare-fun lt!160639 () ListLongMap!4003)

(assert (=> d!70781 (= lt!160622 lt!160639)))

(declare-fun lt!160628 () Unit!10448)

(assert (=> d!70781 (= lt!160628 e!207326)))

(declare-fun c!52331 () Bool)

(declare-fun e!207325 () Bool)

(assert (=> d!70781 (= c!52331 e!207325)))

(declare-fun res!186692 () Bool)

(assert (=> d!70781 (=> (not res!186692) (not e!207325))))

(assert (=> d!70781 (= res!186692 (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun e!207317 () ListLongMap!4003)

(assert (=> d!70781 (= lt!160639 e!207317)))

(declare-fun c!52327 () Bool)

(assert (=> d!70781 (= c!52327 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70781 (validMask!0 mask!2385)))

(assert (=> d!70781 (= (getCurrentListMap!1546 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160622)))

(declare-fun b!337886 () Bool)

(declare-fun e!207314 () ListLongMap!4003)

(assert (=> b!337886 (= e!207314 call!26381)))

(declare-fun b!337893 () Bool)

(declare-fun +!720 (ListLongMap!4003 tuple2!5088) ListLongMap!4003)

(assert (=> b!337893 (= e!207317 (+!720 call!26384 (tuple2!5089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!337894 () Bool)

(declare-fun call!26382 () Bool)

(assert (=> b!337894 (= e!207316 (not call!26382))))

(declare-fun b!337895 () Bool)

(assert (=> b!337895 (= e!207314 call!26386)))

(declare-fun b!337896 () Bool)

(assert (=> b!337896 (= e!207323 (= (apply!269 lt!160622 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!337897 () Bool)

(assert (=> b!337897 (= e!207316 e!207319)))

(declare-fun res!186688 () Bool)

(assert (=> b!337897 (= res!186688 call!26382)))

(assert (=> b!337897 (=> (not res!186688) (not e!207319))))

(declare-fun b!337898 () Bool)

(declare-fun get!4567 (ValueCell!3176 V!10363) V!10363)

(declare-fun dynLambda!612 (Int (_ BitVec 64)) V!10363)

(assert (=> b!337898 (= e!207321 (= (apply!269 lt!160622 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)) (get!4567 (select (arr!8355 _values!1525) #b00000000000000000000000000000000) (dynLambda!612 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8707 _values!1525)))))

(assert (=> b!337898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(declare-fun b!337899 () Bool)

(assert (=> b!337899 (= e!207325 (validKeyInArray!0 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337900 () Bool)

(assert (=> b!337900 (= e!207324 (validKeyInArray!0 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26382 () Bool)

(assert (=> bm!26382 (= call!26385 (contains!2083 lt!160622 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!337901 () Bool)

(assert (=> b!337901 (= e!207317 e!207322)))

(declare-fun c!52328 () Bool)

(assert (=> b!337901 (= c!52328 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!337902 () Bool)

(assert (=> b!337902 (= e!207320 (not call!26385))))

(declare-fun bm!26383 () Bool)

(assert (=> bm!26383 (= call!26382 (contains!2083 lt!160622 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26384 () Bool)

(assert (=> bm!26384 (= call!26384 (+!720 (ite c!52327 call!26383 (ite c!52328 call!26387 call!26386)) (ite (or c!52327 c!52328) (tuple2!5089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!337903 () Bool)

(declare-fun lt!160625 () Unit!10448)

(assert (=> b!337903 (= e!207326 lt!160625)))

(declare-fun lt!160630 () ListLongMap!4003)

(assert (=> b!337903 (= lt!160630 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160636 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160636 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160623 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160623 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160642 () Unit!10448)

(declare-fun addStillContains!245 (ListLongMap!4003 (_ BitVec 64) V!10363 (_ BitVec 64)) Unit!10448)

(assert (=> b!337903 (= lt!160642 (addStillContains!245 lt!160630 lt!160636 zeroValue!1467 lt!160623))))

(assert (=> b!337903 (contains!2083 (+!720 lt!160630 (tuple2!5089 lt!160636 zeroValue!1467)) lt!160623)))

(declare-fun lt!160640 () Unit!10448)

(assert (=> b!337903 (= lt!160640 lt!160642)))

(declare-fun lt!160632 () ListLongMap!4003)

(assert (=> b!337903 (= lt!160632 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160635 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160635 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160637 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160637 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160627 () Unit!10448)

(declare-fun addApplyDifferent!245 (ListLongMap!4003 (_ BitVec 64) V!10363 (_ BitVec 64)) Unit!10448)

(assert (=> b!337903 (= lt!160627 (addApplyDifferent!245 lt!160632 lt!160635 minValue!1467 lt!160637))))

(assert (=> b!337903 (= (apply!269 (+!720 lt!160632 (tuple2!5089 lt!160635 minValue!1467)) lt!160637) (apply!269 lt!160632 lt!160637))))

(declare-fun lt!160624 () Unit!10448)

(assert (=> b!337903 (= lt!160624 lt!160627)))

(declare-fun lt!160633 () ListLongMap!4003)

(assert (=> b!337903 (= lt!160633 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160626 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160626 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160629 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160629 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160621 () Unit!10448)

(assert (=> b!337903 (= lt!160621 (addApplyDifferent!245 lt!160633 lt!160626 zeroValue!1467 lt!160629))))

(assert (=> b!337903 (= (apply!269 (+!720 lt!160633 (tuple2!5089 lt!160626 zeroValue!1467)) lt!160629) (apply!269 lt!160633 lt!160629))))

(declare-fun lt!160631 () Unit!10448)

(assert (=> b!337903 (= lt!160631 lt!160621)))

(declare-fun lt!160638 () ListLongMap!4003)

(assert (=> b!337903 (= lt!160638 (getCurrentListMapNoExtraKeys!585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160634 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160634 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160641 () (_ BitVec 64))

(assert (=> b!337903 (= lt!160641 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!337903 (= lt!160625 (addApplyDifferent!245 lt!160638 lt!160634 minValue!1467 lt!160641))))

(assert (=> b!337903 (= (apply!269 (+!720 lt!160638 (tuple2!5089 lt!160634 minValue!1467)) lt!160641) (apply!269 lt!160638 lt!160641))))

(declare-fun b!337904 () Bool)

(declare-fun c!52330 () Bool)

(assert (=> b!337904 (= c!52330 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!337904 (= e!207322 e!207314)))

(assert (= (and d!70781 c!52327) b!337893))

(assert (= (and d!70781 (not c!52327)) b!337901))

(assert (= (and b!337901 c!52328) b!337885))

(assert (= (and b!337901 (not c!52328)) b!337904))

(assert (= (and b!337904 c!52330) b!337886))

(assert (= (and b!337904 (not c!52330)) b!337895))

(assert (= (or b!337886 b!337895) bm!26380))

(assert (= (or b!337885 bm!26380) bm!26378))

(assert (= (or b!337885 b!337886) bm!26381))

(assert (= (or b!337893 bm!26378) bm!26379))

(assert (= (or b!337893 bm!26381) bm!26384))

(assert (= (and d!70781 res!186692) b!337899))

(assert (= (and d!70781 c!52331) b!337903))

(assert (= (and d!70781 (not c!52331)) b!337892))

(assert (= (and d!70781 res!186689) b!337889))

(assert (= (and b!337889 res!186691) b!337900))

(assert (= (and b!337889 (not res!186687)) b!337884))

(assert (= (and b!337884 res!186695) b!337898))

(assert (= (and b!337889 res!186690) b!337888))

(assert (= (and b!337888 c!52329) b!337897))

(assert (= (and b!337888 (not c!52329)) b!337894))

(assert (= (and b!337897 res!186688) b!337891))

(assert (= (or b!337897 b!337894) bm!26383))

(assert (= (and b!337888 res!186693) b!337887))

(assert (= (and b!337887 c!52326) b!337890))

(assert (= (and b!337887 (not c!52326)) b!337902))

(assert (= (and b!337890 res!186694) b!337896))

(assert (= (or b!337890 b!337902) bm!26382))

(declare-fun b_lambda!8437 () Bool)

(assert (=> (not b_lambda!8437) (not b!337898)))

(declare-fun t!9789 () Bool)

(declare-fun tb!3045 () Bool)

(assert (=> (and start!33894 (= defaultEntry!1528 defaultEntry!1528) t!9789) tb!3045))

(declare-fun result!5481 () Bool)

(assert (=> tb!3045 (= result!5481 tp_is_empty!7039)))

(assert (=> b!337898 t!9789))

(declare-fun b_and!14293 () Bool)

(assert (= b_and!14287 (and (=> t!9789 result!5481) b_and!14293)))

(declare-fun m!341543 () Bool)

(assert (=> bm!26379 m!341543))

(declare-fun m!341545 () Bool)

(assert (=> b!337893 m!341545))

(declare-fun m!341547 () Bool)

(assert (=> b!337896 m!341547))

(assert (=> b!337900 m!341517))

(assert (=> b!337900 m!341517))

(assert (=> b!337900 m!341525))

(assert (=> b!337899 m!341517))

(assert (=> b!337899 m!341517))

(assert (=> b!337899 m!341525))

(declare-fun m!341549 () Bool)

(assert (=> b!337891 m!341549))

(declare-fun m!341551 () Bool)

(assert (=> b!337898 m!341551))

(assert (=> b!337898 m!341517))

(declare-fun m!341553 () Bool)

(assert (=> b!337898 m!341553))

(assert (=> b!337898 m!341551))

(declare-fun m!341555 () Bool)

(assert (=> b!337898 m!341555))

(declare-fun m!341557 () Bool)

(assert (=> b!337898 m!341557))

(assert (=> b!337898 m!341517))

(assert (=> b!337898 m!341555))

(declare-fun m!341559 () Bool)

(assert (=> bm!26384 m!341559))

(assert (=> b!337884 m!341517))

(assert (=> b!337884 m!341517))

(declare-fun m!341561 () Bool)

(assert (=> b!337884 m!341561))

(declare-fun m!341563 () Bool)

(assert (=> bm!26382 m!341563))

(declare-fun m!341565 () Bool)

(assert (=> bm!26383 m!341565))

(declare-fun m!341567 () Bool)

(assert (=> b!337903 m!341567))

(declare-fun m!341569 () Bool)

(assert (=> b!337903 m!341569))

(declare-fun m!341571 () Bool)

(assert (=> b!337903 m!341571))

(declare-fun m!341573 () Bool)

(assert (=> b!337903 m!341573))

(assert (=> b!337903 m!341517))

(declare-fun m!341575 () Bool)

(assert (=> b!337903 m!341575))

(declare-fun m!341577 () Bool)

(assert (=> b!337903 m!341577))

(declare-fun m!341579 () Bool)

(assert (=> b!337903 m!341579))

(declare-fun m!341581 () Bool)

(assert (=> b!337903 m!341581))

(declare-fun m!341583 () Bool)

(assert (=> b!337903 m!341583))

(declare-fun m!341585 () Bool)

(assert (=> b!337903 m!341585))

(declare-fun m!341587 () Bool)

(assert (=> b!337903 m!341587))

(assert (=> b!337903 m!341583))

(assert (=> b!337903 m!341573))

(declare-fun m!341589 () Bool)

(assert (=> b!337903 m!341589))

(assert (=> b!337903 m!341543))

(assert (=> b!337903 m!341577))

(declare-fun m!341591 () Bool)

(assert (=> b!337903 m!341591))

(assert (=> b!337903 m!341567))

(declare-fun m!341593 () Bool)

(assert (=> b!337903 m!341593))

(declare-fun m!341595 () Bool)

(assert (=> b!337903 m!341595))

(assert (=> d!70781 m!341427))

(assert (=> b!337714 d!70781))

(declare-fun d!70783 () Bool)

(assert (=> d!70783 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33894 d!70783))

(declare-fun d!70785 () Bool)

(assert (=> d!70785 (= (array_inv!6210 _values!1525) (bvsge (size!8707 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33894 d!70785))

(declare-fun d!70787 () Bool)

(assert (=> d!70787 (= (array_inv!6211 _keys!1895) (bvsge (size!8708 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33894 d!70787))

(declare-fun b!337917 () Bool)

(declare-fun e!207337 () Bool)

(declare-fun e!207336 () Bool)

(assert (=> b!337917 (= e!207337 e!207336)))

(declare-fun c!52334 () Bool)

(assert (=> b!337917 (= c!52334 (validKeyInArray!0 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!337918 () Bool)

(declare-fun call!26390 () Bool)

(assert (=> b!337918 (= e!207336 call!26390)))

(declare-fun d!70789 () Bool)

(declare-fun res!186702 () Bool)

(declare-fun e!207335 () Bool)

(assert (=> d!70789 (=> res!186702 e!207335)))

(assert (=> d!70789 (= res!186702 (bvsge #b00000000000000000000000000000000 (size!8708 _keys!1895)))))

(assert (=> d!70789 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4696) e!207335)))

(declare-fun b!337919 () Bool)

(assert (=> b!337919 (= e!207335 e!207337)))

(declare-fun res!186704 () Bool)

(assert (=> b!337919 (=> (not res!186704) (not e!207337))))

(declare-fun e!207338 () Bool)

(assert (=> b!337919 (= res!186704 (not e!207338))))

(declare-fun res!186703 () Bool)

(assert (=> b!337919 (=> (not res!186703) (not e!207338))))

(assert (=> b!337919 (= res!186703 (validKeyInArray!0 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26387 () Bool)

(assert (=> bm!26387 (= call!26390 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52334 (Cons!4695 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000) Nil!4696) Nil!4696)))))

(declare-fun b!337920 () Bool)

(assert (=> b!337920 (= e!207336 call!26390)))

(declare-fun b!337921 () Bool)

(declare-fun contains!2085 (List!4699 (_ BitVec 64)) Bool)

(assert (=> b!337921 (= e!207338 (contains!2085 Nil!4696 (select (arr!8356 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70789 (not res!186702)) b!337919))

(assert (= (and b!337919 res!186703) b!337921))

(assert (= (and b!337919 res!186704) b!337917))

(assert (= (and b!337917 c!52334) b!337918))

(assert (= (and b!337917 (not c!52334)) b!337920))

(assert (= (or b!337918 b!337920) bm!26387))

(assert (=> b!337917 m!341517))

(assert (=> b!337917 m!341517))

(assert (=> b!337917 m!341525))

(assert (=> b!337919 m!341517))

(assert (=> b!337919 m!341517))

(assert (=> b!337919 m!341525))

(assert (=> bm!26387 m!341517))

(declare-fun m!341597 () Bool)

(assert (=> bm!26387 m!341597))

(assert (=> b!337921 m!341517))

(assert (=> b!337921 m!341517))

(declare-fun m!341599 () Bool)

(assert (=> b!337921 m!341599))

(assert (=> b!337713 d!70789))

(declare-fun d!70791 () Bool)

(declare-fun res!186709 () Bool)

(declare-fun e!207343 () Bool)

(assert (=> d!70791 (=> res!186709 e!207343)))

(assert (=> d!70791 (= res!186709 (= (select (arr!8356 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70791 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207343)))

(declare-fun b!337926 () Bool)

(declare-fun e!207344 () Bool)

(assert (=> b!337926 (= e!207343 e!207344)))

(declare-fun res!186710 () Bool)

(assert (=> b!337926 (=> (not res!186710) (not e!207344))))

(assert (=> b!337926 (= res!186710 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8708 _keys!1895)))))

(declare-fun b!337927 () Bool)

(assert (=> b!337927 (= e!207344 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70791 (not res!186709)) b!337926))

(assert (= (and b!337926 res!186710) b!337927))

(assert (=> d!70791 m!341517))

(declare-fun m!341601 () Bool)

(assert (=> b!337927 m!341601))

(assert (=> b!337721 d!70791))

(declare-fun b!337934 () Bool)

(declare-fun e!207350 () Bool)

(assert (=> b!337934 (= e!207350 tp_is_empty!7039)))

(declare-fun b!337935 () Bool)

(declare-fun e!207349 () Bool)

(assert (=> b!337935 (= e!207349 tp_is_empty!7039)))

(declare-fun mapIsEmpty!11973 () Bool)

(declare-fun mapRes!11973 () Bool)

(assert (=> mapIsEmpty!11973 mapRes!11973))

(declare-fun condMapEmpty!11973 () Bool)

(declare-fun mapDefault!11973 () ValueCell!3176)

(assert (=> mapNonEmpty!11964 (= condMapEmpty!11973 (= mapRest!11964 ((as const (Array (_ BitVec 32) ValueCell!3176)) mapDefault!11973)))))

(assert (=> mapNonEmpty!11964 (= tp!24774 (and e!207349 mapRes!11973))))

(declare-fun mapNonEmpty!11973 () Bool)

(declare-fun tp!24789 () Bool)

(assert (=> mapNonEmpty!11973 (= mapRes!11973 (and tp!24789 e!207350))))

(declare-fun mapRest!11973 () (Array (_ BitVec 32) ValueCell!3176))

(declare-fun mapValue!11973 () ValueCell!3176)

(declare-fun mapKey!11973 () (_ BitVec 32))

(assert (=> mapNonEmpty!11973 (= mapRest!11964 (store mapRest!11973 mapKey!11973 mapValue!11973))))

(assert (= (and mapNonEmpty!11964 condMapEmpty!11973) mapIsEmpty!11973))

(assert (= (and mapNonEmpty!11964 (not condMapEmpty!11973)) mapNonEmpty!11973))

(assert (= (and mapNonEmpty!11973 ((_ is ValueCellFull!3176) mapValue!11973)) b!337934))

(assert (= (and mapNonEmpty!11964 ((_ is ValueCellFull!3176) mapDefault!11973)) b!337935))

(declare-fun m!341603 () Bool)

(assert (=> mapNonEmpty!11973 m!341603))

(declare-fun b_lambda!8439 () Bool)

(assert (= b_lambda!8437 (or (and start!33894 b_free!7087) b_lambda!8439)))

(check-sat (not b!337832) (not d!70775) (not b!337903) (not b!337884) (not b!337893) (not bm!26387) (not b_next!7087) tp_is_empty!7039 (not b!337896) (not b!337891) (not b!337927) (not b!337900) (not b!337839) (not b!337921) (not bm!26363) (not b!337899) (not d!70779) (not b!337824) b_and!14293 (not b!337841) (not b!337919) (not b!337811) (not bm!26379) (not bm!26384) (not b_lambda!8439) (not d!70769) (not mapNonEmpty!11973) (not b!337898) (not bm!26383) (not b!337825) (not bm!26382) (not b!337917) (not d!70781))
(check-sat b_and!14293 (not b_next!7087))
