; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77356 () Bool)

(assert start!77356)

(declare-fun b!901629 () Bool)

(declare-fun b_free!16057 () Bool)

(declare-fun b_next!16057 () Bool)

(assert (=> b!901629 (= b_free!16057 (not b_next!16057))))

(declare-fun tp!56266 () Bool)

(declare-fun b_and!26391 () Bool)

(assert (=> b!901629 (= tp!56266 b_and!26391)))

(declare-fun b!901625 () Bool)

(declare-fun e!504756 () Bool)

(declare-datatypes ((V!29479 0))(
  ( (V!29480 (val!9243 Int)) )
))
(declare-datatypes ((tuple2!11980 0))(
  ( (tuple2!11981 (_1!6001 (_ BitVec 64)) (_2!6001 V!29479)) )
))
(declare-datatypes ((List!17813 0))(
  ( (Nil!17810) (Cons!17809 (h!18961 tuple2!11980) (t!25160 List!17813)) )
))
(declare-datatypes ((ListLongMap!10679 0))(
  ( (ListLongMap!10680 (toList!5355 List!17813)) )
))
(declare-fun lt!407394 () ListLongMap!10679)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4405 (ListLongMap!10679 (_ BitVec 64)) Bool)

(assert (=> b!901625 (= e!504756 (contains!4405 lt!407394 key!785))))

(declare-fun b!901626 () Bool)

(declare-fun res!608573 () Bool)

(declare-fun e!504758 () Bool)

(assert (=> b!901626 (=> (not res!608573) (not e!504758))))

(assert (=> b!901626 (= res!608573 (not (= key!785 (bvneg key!785))))))

(declare-fun res!608572 () Bool)

(assert (=> start!77356 (=> (not res!608572) (not e!504758))))

(declare-datatypes ((array!52861 0))(
  ( (array!52862 (arr!25396 (Array (_ BitVec 32) (_ BitVec 64))) (size!25856 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8711 0))(
  ( (ValueCellFull!8711 (v!11738 V!29479)) (EmptyCell!8711) )
))
(declare-datatypes ((array!52863 0))(
  ( (array!52864 (arr!25397 (Array (_ BitVec 32) ValueCell!8711)) (size!25857 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4438 0))(
  ( (LongMapFixedSize!4439 (defaultEntry!5455 Int) (mask!26292 (_ BitVec 32)) (extraKeys!5182 (_ BitVec 32)) (zeroValue!5286 V!29479) (minValue!5286 V!29479) (_size!2274 (_ BitVec 32)) (_keys!10290 array!52861) (_values!5473 array!52863) (_vacant!2274 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4438)

(declare-fun valid!1716 (LongMapFixedSize!4438) Bool)

(assert (=> start!77356 (= res!608572 (valid!1716 thiss!1181))))

(assert (=> start!77356 e!504758))

(declare-fun e!504755 () Bool)

(assert (=> start!77356 e!504755))

(assert (=> start!77356 true))

(declare-fun b!901627 () Bool)

(declare-fun e!504761 () Bool)

(declare-fun tp_is_empty!18385 () Bool)

(assert (=> b!901627 (= e!504761 tp_is_empty!18385)))

(declare-fun b!901628 () Bool)

(declare-fun e!504760 () Bool)

(declare-datatypes ((SeekEntryResult!8896 0))(
  ( (MissingZero!8896 (index!37955 (_ BitVec 32))) (Found!8896 (index!37956 (_ BitVec 32))) (Intermediate!8896 (undefined!9708 Bool) (index!37957 (_ BitVec 32)) (x!76715 (_ BitVec 32))) (Undefined!8896) (MissingVacant!8896 (index!37958 (_ BitVec 32))) )
))
(declare-fun lt!407393 () SeekEntryResult!8896)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901628 (= e!504760 (inRange!0 (index!37956 lt!407393) (mask!26292 thiss!1181)))))

(declare-fun e!504759 () Bool)

(declare-fun array_inv!19980 (array!52861) Bool)

(declare-fun array_inv!19981 (array!52863) Bool)

(assert (=> b!901629 (= e!504755 (and tp!56266 tp_is_empty!18385 (array_inv!19980 (_keys!10290 thiss!1181)) (array_inv!19981 (_values!5473 thiss!1181)) e!504759))))

(declare-fun b!901630 () Bool)

(declare-fun res!608577 () Bool)

(assert (=> b!901630 (=> res!608577 e!504756)))

(declare-datatypes ((List!17814 0))(
  ( (Nil!17811) (Cons!17810 (h!18962 (_ BitVec 64)) (t!25161 List!17814)) )
))
(declare-fun arrayNoDuplicates!0 (array!52861 (_ BitVec 32) List!17814) Bool)

(assert (=> b!901630 (= res!608577 (not (arrayNoDuplicates!0 (_keys!10290 thiss!1181) #b00000000000000000000000000000000 Nil!17811)))))

(declare-fun mapNonEmpty!29257 () Bool)

(declare-fun mapRes!29257 () Bool)

(declare-fun tp!56265 () Bool)

(assert (=> mapNonEmpty!29257 (= mapRes!29257 (and tp!56265 e!504761))))

(declare-fun mapValue!29257 () ValueCell!8711)

(declare-fun mapRest!29257 () (Array (_ BitVec 32) ValueCell!8711))

(declare-fun mapKey!29257 () (_ BitVec 32))

(assert (=> mapNonEmpty!29257 (= (arr!25397 (_values!5473 thiss!1181)) (store mapRest!29257 mapKey!29257 mapValue!29257))))

(declare-fun b!901631 () Bool)

(declare-fun e!504754 () Bool)

(assert (=> b!901631 (= e!504758 (not e!504754))))

(declare-fun res!608575 () Bool)

(assert (=> b!901631 (=> res!608575 e!504754)))

(get-info :version)

(assert (=> b!901631 (= res!608575 (not ((_ is Found!8896) lt!407393)))))

(assert (=> b!901631 e!504760))

(declare-fun res!608570 () Bool)

(assert (=> b!901631 (=> res!608570 e!504760)))

(assert (=> b!901631 (= res!608570 (not ((_ is Found!8896) lt!407393)))))

(declare-datatypes ((Unit!30592 0))(
  ( (Unit!30593) )
))
(declare-fun lt!407395 () Unit!30592)

(declare-fun lemmaSeekEntryGivesInRangeIndex!115 (array!52861 array!52863 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 64)) Unit!30592)

(assert (=> b!901631 (= lt!407395 (lemmaSeekEntryGivesInRangeIndex!115 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52861 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!901631 (= lt!407393 (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)))))

(declare-fun b!901632 () Bool)

(declare-fun res!608571 () Bool)

(assert (=> b!901632 (=> res!608571 e!504756)))

(assert (=> b!901632 (= res!608571 (or (not (= (size!25857 (_values!5473 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26292 thiss!1181)))) (not (= (size!25856 (_keys!10290 thiss!1181)) (size!25857 (_values!5473 thiss!1181)))) (bvslt (mask!26292 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5182 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!5182 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!29257 () Bool)

(assert (=> mapIsEmpty!29257 mapRes!29257))

(declare-fun b!901633 () Bool)

(declare-fun e!504762 () Bool)

(assert (=> b!901633 (= e!504759 (and e!504762 mapRes!29257))))

(declare-fun condMapEmpty!29257 () Bool)

(declare-fun mapDefault!29257 () ValueCell!8711)

(assert (=> b!901633 (= condMapEmpty!29257 (= (arr!25397 (_values!5473 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8711)) mapDefault!29257)))))

(declare-fun b!901634 () Bool)

(assert (=> b!901634 (= e!504762 tp_is_empty!18385)))

(declare-fun b!901635 () Bool)

(assert (=> b!901635 (= e!504754 e!504756)))

(declare-fun res!608576 () Bool)

(assert (=> b!901635 (=> res!608576 e!504756)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!901635 (= res!608576 (not (validMask!0 (mask!26292 thiss!1181))))))

(assert (=> b!901635 (contains!4405 lt!407394 (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393)))))

(declare-fun getCurrentListMap!2627 (array!52861 array!52863 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) ListLongMap!10679)

(assert (=> b!901635 (= lt!407394 (getCurrentListMap!2627 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!407391 () Unit!30592)

(declare-fun lemmaValidKeyInArrayIsInListMap!257 (array!52861 array!52863 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) Unit!30592)

(assert (=> b!901635 (= lt!407391 (lemmaValidKeyInArrayIsInListMap!257 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) (index!37956 lt!407393) (defaultEntry!5455 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!901635 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407392 () Unit!30592)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52861 (_ BitVec 64) (_ BitVec 32)) Unit!30592)

(assert (=> b!901635 (= lt!407392 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10290 thiss!1181) key!785 (index!37956 lt!407393)))))

(declare-fun b!901636 () Bool)

(declare-fun res!608574 () Bool)

(assert (=> b!901636 (=> res!608574 e!504756)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52861 (_ BitVec 32)) Bool)

(assert (=> b!901636 (= res!608574 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10290 thiss!1181) (mask!26292 thiss!1181))))))

(assert (= (and start!77356 res!608572) b!901626))

(assert (= (and b!901626 res!608573) b!901631))

(assert (= (and b!901631 (not res!608570)) b!901628))

(assert (= (and b!901631 (not res!608575)) b!901635))

(assert (= (and b!901635 (not res!608576)) b!901632))

(assert (= (and b!901632 (not res!608571)) b!901636))

(assert (= (and b!901636 (not res!608574)) b!901630))

(assert (= (and b!901630 (not res!608577)) b!901625))

(assert (= (and b!901633 condMapEmpty!29257) mapIsEmpty!29257))

(assert (= (and b!901633 (not condMapEmpty!29257)) mapNonEmpty!29257))

(assert (= (and mapNonEmpty!29257 ((_ is ValueCellFull!8711) mapValue!29257)) b!901627))

(assert (= (and b!901633 ((_ is ValueCellFull!8711) mapDefault!29257)) b!901634))

(assert (= b!901629 b!901633))

(assert (= start!77356 b!901629))

(declare-fun m!838411 () Bool)

(assert (=> b!901630 m!838411))

(declare-fun m!838413 () Bool)

(assert (=> b!901631 m!838413))

(declare-fun m!838415 () Bool)

(assert (=> b!901631 m!838415))

(declare-fun m!838417 () Bool)

(assert (=> mapNonEmpty!29257 m!838417))

(declare-fun m!838419 () Bool)

(assert (=> start!77356 m!838419))

(declare-fun m!838421 () Bool)

(assert (=> b!901629 m!838421))

(declare-fun m!838423 () Bool)

(assert (=> b!901629 m!838423))

(declare-fun m!838425 () Bool)

(assert (=> b!901636 m!838425))

(declare-fun m!838427 () Bool)

(assert (=> b!901628 m!838427))

(declare-fun m!838429 () Bool)

(assert (=> b!901635 m!838429))

(declare-fun m!838431 () Bool)

(assert (=> b!901635 m!838431))

(declare-fun m!838433 () Bool)

(assert (=> b!901635 m!838433))

(declare-fun m!838435 () Bool)

(assert (=> b!901635 m!838435))

(declare-fun m!838437 () Bool)

(assert (=> b!901635 m!838437))

(declare-fun m!838439 () Bool)

(assert (=> b!901635 m!838439))

(declare-fun m!838441 () Bool)

(assert (=> b!901635 m!838441))

(assert (=> b!901635 m!838439))

(declare-fun m!838443 () Bool)

(assert (=> b!901625 m!838443))

(check-sat (not b!901636) (not b!901629) (not b!901630) (not b_next!16057) (not mapNonEmpty!29257) (not b!901635) tp_is_empty!18385 (not b!901625) (not start!77356) b_and!26391 (not b!901631) (not b!901628))
(check-sat b_and!26391 (not b_next!16057))
(get-model)

(declare-fun bm!40105 () Bool)

(declare-fun call!40108 () Bool)

(assert (=> bm!40105 (= call!40108 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10290 thiss!1181) (mask!26292 thiss!1181)))))

(declare-fun b!901717 () Bool)

(declare-fun e!504823 () Bool)

(declare-fun e!504824 () Bool)

(assert (=> b!901717 (= e!504823 e!504824)))

(declare-fun c!95667 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!901717 (= c!95667 (validKeyInArray!0 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901718 () Bool)

(assert (=> b!901718 (= e!504824 call!40108)))

(declare-fun b!901720 () Bool)

(declare-fun e!504825 () Bool)

(assert (=> b!901720 (= e!504824 e!504825)))

(declare-fun lt!407432 () (_ BitVec 64))

(assert (=> b!901720 (= lt!407432 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407434 () Unit!30592)

(assert (=> b!901720 (= lt!407434 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10290 thiss!1181) lt!407432 #b00000000000000000000000000000000))))

(assert (=> b!901720 (arrayContainsKey!0 (_keys!10290 thiss!1181) lt!407432 #b00000000000000000000000000000000)))

(declare-fun lt!407433 () Unit!30592)

(assert (=> b!901720 (= lt!407433 lt!407434)))

(declare-fun res!608631 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52861 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!901720 (= res!608631 (= (seekEntryOrOpen!0 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000) (_keys!10290 thiss!1181) (mask!26292 thiss!1181)) (Found!8896 #b00000000000000000000000000000000)))))

(assert (=> b!901720 (=> (not res!608631) (not e!504825))))

(declare-fun d!112085 () Bool)

(declare-fun res!608630 () Bool)

(assert (=> d!112085 (=> res!608630 e!504823)))

(assert (=> d!112085 (= res!608630 (bvsge #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))

(assert (=> d!112085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)) e!504823)))

(declare-fun b!901719 () Bool)

(assert (=> b!901719 (= e!504825 call!40108)))

(assert (= (and d!112085 (not res!608630)) b!901717))

(assert (= (and b!901717 c!95667) b!901720))

(assert (= (and b!901717 (not c!95667)) b!901718))

(assert (= (and b!901720 res!608631) b!901719))

(assert (= (or b!901719 b!901718) bm!40105))

(declare-fun m!838513 () Bool)

(assert (=> bm!40105 m!838513))

(declare-fun m!838515 () Bool)

(assert (=> b!901717 m!838515))

(assert (=> b!901717 m!838515))

(declare-fun m!838517 () Bool)

(assert (=> b!901717 m!838517))

(assert (=> b!901720 m!838515))

(declare-fun m!838519 () Bool)

(assert (=> b!901720 m!838519))

(declare-fun m!838521 () Bool)

(assert (=> b!901720 m!838521))

(assert (=> b!901720 m!838515))

(declare-fun m!838523 () Bool)

(assert (=> b!901720 m!838523))

(assert (=> b!901636 d!112085))

(declare-fun d!112087 () Bool)

(assert (=> d!112087 (= (inRange!0 (index!37956 lt!407393) (mask!26292 thiss!1181)) (and (bvsge (index!37956 lt!407393) #b00000000000000000000000000000000) (bvslt (index!37956 lt!407393) (bvadd (mask!26292 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!901628 d!112087))

(declare-fun d!112089 () Bool)

(assert (=> d!112089 (= (array_inv!19980 (_keys!10290 thiss!1181)) (bvsge (size!25856 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901629 d!112089))

(declare-fun d!112091 () Bool)

(assert (=> d!112091 (= (array_inv!19981 (_values!5473 thiss!1181)) (bvsge (size!25857 (_values!5473 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901629 d!112091))

(declare-fun b!901731 () Bool)

(declare-fun e!504834 () Bool)

(declare-fun call!40111 () Bool)

(assert (=> b!901731 (= e!504834 call!40111)))

(declare-fun b!901732 () Bool)

(assert (=> b!901732 (= e!504834 call!40111)))

(declare-fun b!901733 () Bool)

(declare-fun e!504836 () Bool)

(declare-fun contains!4407 (List!17814 (_ BitVec 64)) Bool)

(assert (=> b!901733 (= e!504836 (contains!4407 Nil!17811 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!112093 () Bool)

(declare-fun res!608638 () Bool)

(declare-fun e!504837 () Bool)

(assert (=> d!112093 (=> res!608638 e!504837)))

(assert (=> d!112093 (= res!608638 (bvsge #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))

(assert (=> d!112093 (= (arrayNoDuplicates!0 (_keys!10290 thiss!1181) #b00000000000000000000000000000000 Nil!17811) e!504837)))

(declare-fun bm!40108 () Bool)

(declare-fun c!95670 () Bool)

(assert (=> bm!40108 (= call!40111 (arrayNoDuplicates!0 (_keys!10290 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!95670 (Cons!17810 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000) Nil!17811) Nil!17811)))))

(declare-fun b!901734 () Bool)

(declare-fun e!504835 () Bool)

(assert (=> b!901734 (= e!504835 e!504834)))

(assert (=> b!901734 (= c!95670 (validKeyInArray!0 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!901735 () Bool)

(assert (=> b!901735 (= e!504837 e!504835)))

(declare-fun res!608639 () Bool)

(assert (=> b!901735 (=> (not res!608639) (not e!504835))))

(assert (=> b!901735 (= res!608639 (not e!504836))))

(declare-fun res!608640 () Bool)

(assert (=> b!901735 (=> (not res!608640) (not e!504836))))

(assert (=> b!901735 (= res!608640 (validKeyInArray!0 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!112093 (not res!608638)) b!901735))

(assert (= (and b!901735 res!608640) b!901733))

(assert (= (and b!901735 res!608639) b!901734))

(assert (= (and b!901734 c!95670) b!901732))

(assert (= (and b!901734 (not c!95670)) b!901731))

(assert (= (or b!901732 b!901731) bm!40108))

(assert (=> b!901733 m!838515))

(assert (=> b!901733 m!838515))

(declare-fun m!838525 () Bool)

(assert (=> b!901733 m!838525))

(assert (=> bm!40108 m!838515))

(declare-fun m!838527 () Bool)

(assert (=> bm!40108 m!838527))

(assert (=> b!901734 m!838515))

(assert (=> b!901734 m!838515))

(assert (=> b!901734 m!838517))

(assert (=> b!901735 m!838515))

(assert (=> b!901735 m!838515))

(assert (=> b!901735 m!838517))

(assert (=> b!901630 d!112093))

(declare-fun d!112095 () Bool)

(declare-fun e!504842 () Bool)

(assert (=> d!112095 e!504842))

(declare-fun res!608643 () Bool)

(assert (=> d!112095 (=> res!608643 e!504842)))

(declare-fun lt!407445 () Bool)

(assert (=> d!112095 (= res!608643 (not lt!407445))))

(declare-fun lt!407446 () Bool)

(assert (=> d!112095 (= lt!407445 lt!407446)))

(declare-fun lt!407443 () Unit!30592)

(declare-fun e!504843 () Unit!30592)

(assert (=> d!112095 (= lt!407443 e!504843)))

(declare-fun c!95673 () Bool)

(assert (=> d!112095 (= c!95673 lt!407446)))

(declare-fun containsKey!434 (List!17813 (_ BitVec 64)) Bool)

(assert (=> d!112095 (= lt!407446 (containsKey!434 (toList!5355 lt!407394) key!785))))

(assert (=> d!112095 (= (contains!4405 lt!407394 key!785) lt!407445)))

(declare-fun b!901742 () Bool)

(declare-fun lt!407444 () Unit!30592)

(assert (=> b!901742 (= e!504843 lt!407444)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!328 (List!17813 (_ BitVec 64)) Unit!30592)

(assert (=> b!901742 (= lt!407444 (lemmaContainsKeyImpliesGetValueByKeyDefined!328 (toList!5355 lt!407394) key!785))))

(declare-datatypes ((Option!467 0))(
  ( (Some!466 (v!11741 V!29479)) (None!465) )
))
(declare-fun isDefined!336 (Option!467) Bool)

(declare-fun getValueByKey!461 (List!17813 (_ BitVec 64)) Option!467)

(assert (=> b!901742 (isDefined!336 (getValueByKey!461 (toList!5355 lt!407394) key!785))))

(declare-fun b!901743 () Bool)

(declare-fun Unit!30598 () Unit!30592)

(assert (=> b!901743 (= e!504843 Unit!30598)))

(declare-fun b!901744 () Bool)

(assert (=> b!901744 (= e!504842 (isDefined!336 (getValueByKey!461 (toList!5355 lt!407394) key!785)))))

(assert (= (and d!112095 c!95673) b!901742))

(assert (= (and d!112095 (not c!95673)) b!901743))

(assert (= (and d!112095 (not res!608643)) b!901744))

(declare-fun m!838529 () Bool)

(assert (=> d!112095 m!838529))

(declare-fun m!838531 () Bool)

(assert (=> b!901742 m!838531))

(declare-fun m!838533 () Bool)

(assert (=> b!901742 m!838533))

(assert (=> b!901742 m!838533))

(declare-fun m!838535 () Bool)

(assert (=> b!901742 m!838535))

(assert (=> b!901744 m!838533))

(assert (=> b!901744 m!838533))

(assert (=> b!901744 m!838535))

(assert (=> b!901625 d!112095))

(declare-fun d!112097 () Bool)

(declare-fun e!504846 () Bool)

(assert (=> d!112097 e!504846))

(declare-fun res!608646 () Bool)

(assert (=> d!112097 (=> res!608646 e!504846)))

(declare-fun lt!407452 () SeekEntryResult!8896)

(assert (=> d!112097 (= res!608646 (not ((_ is Found!8896) lt!407452)))))

(assert (=> d!112097 (= lt!407452 (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)))))

(declare-fun lt!407451 () Unit!30592)

(declare-fun choose!1522 (array!52861 array!52863 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 64)) Unit!30592)

(assert (=> d!112097 (= lt!407451 (choose!1522 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785))))

(assert (=> d!112097 (validMask!0 (mask!26292 thiss!1181))))

(assert (=> d!112097 (= (lemmaSeekEntryGivesInRangeIndex!115 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) key!785) lt!407451)))

(declare-fun b!901747 () Bool)

(assert (=> b!901747 (= e!504846 (inRange!0 (index!37956 lt!407452) (mask!26292 thiss!1181)))))

(assert (= (and d!112097 (not res!608646)) b!901747))

(assert (=> d!112097 m!838415))

(declare-fun m!838537 () Bool)

(assert (=> d!112097 m!838537))

(assert (=> d!112097 m!838435))

(declare-fun m!838539 () Bool)

(assert (=> b!901747 m!838539))

(assert (=> b!901631 d!112097))

(declare-fun b!901760 () Bool)

(declare-fun e!504854 () SeekEntryResult!8896)

(declare-fun lt!407461 () SeekEntryResult!8896)

(assert (=> b!901760 (= e!504854 (Found!8896 (index!37957 lt!407461)))))

(declare-fun b!901761 () Bool)

(declare-fun c!95681 () Bool)

(declare-fun lt!407464 () (_ BitVec 64))

(assert (=> b!901761 (= c!95681 (= lt!407464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!504853 () SeekEntryResult!8896)

(assert (=> b!901761 (= e!504854 e!504853)))

(declare-fun b!901762 () Bool)

(declare-fun lt!407462 () SeekEntryResult!8896)

(assert (=> b!901762 (= e!504853 (ite ((_ is MissingVacant!8896) lt!407462) (MissingZero!8896 (index!37958 lt!407462)) lt!407462))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52861 (_ BitVec 32)) SeekEntryResult!8896)

(assert (=> b!901762 (= lt!407462 (seekKeyOrZeroReturnVacant!0 (x!76715 lt!407461) (index!37957 lt!407461) (index!37957 lt!407461) key!785 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)))))

(declare-fun b!901763 () Bool)

(assert (=> b!901763 (= e!504853 (MissingZero!8896 (index!37957 lt!407461)))))

(declare-fun b!901765 () Bool)

(declare-fun e!504855 () SeekEntryResult!8896)

(assert (=> b!901765 (= e!504855 Undefined!8896)))

(declare-fun b!901764 () Bool)

(assert (=> b!901764 (= e!504855 e!504854)))

(assert (=> b!901764 (= lt!407464 (select (arr!25396 (_keys!10290 thiss!1181)) (index!37957 lt!407461)))))

(declare-fun c!95680 () Bool)

(assert (=> b!901764 (= c!95680 (= lt!407464 key!785))))

(declare-fun d!112099 () Bool)

(declare-fun lt!407463 () SeekEntryResult!8896)

(assert (=> d!112099 (and (or ((_ is MissingVacant!8896) lt!407463) (not ((_ is Found!8896) lt!407463)) (and (bvsge (index!37956 lt!407463) #b00000000000000000000000000000000) (bvslt (index!37956 lt!407463) (size!25856 (_keys!10290 thiss!1181))))) (not ((_ is MissingVacant!8896) lt!407463)) (or (not ((_ is Found!8896) lt!407463)) (= (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407463)) key!785)))))

(assert (=> d!112099 (= lt!407463 e!504855)))

(declare-fun c!95682 () Bool)

(assert (=> d!112099 (= c!95682 (and ((_ is Intermediate!8896) lt!407461) (undefined!9708 lt!407461)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52861 (_ BitVec 32)) SeekEntryResult!8896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!112099 (= lt!407461 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26292 thiss!1181)) key!785 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)))))

(assert (=> d!112099 (validMask!0 (mask!26292 thiss!1181))))

(assert (=> d!112099 (= (seekEntry!0 key!785 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)) lt!407463)))

(assert (= (and d!112099 c!95682) b!901765))

(assert (= (and d!112099 (not c!95682)) b!901764))

(assert (= (and b!901764 c!95680) b!901760))

(assert (= (and b!901764 (not c!95680)) b!901761))

(assert (= (and b!901761 c!95681) b!901763))

(assert (= (and b!901761 (not c!95681)) b!901762))

(declare-fun m!838541 () Bool)

(assert (=> b!901762 m!838541))

(declare-fun m!838543 () Bool)

(assert (=> b!901764 m!838543))

(declare-fun m!838545 () Bool)

(assert (=> d!112099 m!838545))

(declare-fun m!838547 () Bool)

(assert (=> d!112099 m!838547))

(assert (=> d!112099 m!838547))

(declare-fun m!838549 () Bool)

(assert (=> d!112099 m!838549))

(assert (=> d!112099 m!838435))

(assert (=> b!901631 d!112099))

(declare-fun d!112101 () Bool)

(declare-fun res!608653 () Bool)

(declare-fun e!504858 () Bool)

(assert (=> d!112101 (=> (not res!608653) (not e!504858))))

(declare-fun simpleValid!331 (LongMapFixedSize!4438) Bool)

(assert (=> d!112101 (= res!608653 (simpleValid!331 thiss!1181))))

(assert (=> d!112101 (= (valid!1716 thiss!1181) e!504858)))

(declare-fun b!901772 () Bool)

(declare-fun res!608654 () Bool)

(assert (=> b!901772 (=> (not res!608654) (not e!504858))))

(declare-fun arrayCountValidKeys!0 (array!52861 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!901772 (= res!608654 (= (arrayCountValidKeys!0 (_keys!10290 thiss!1181) #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))) (_size!2274 thiss!1181)))))

(declare-fun b!901773 () Bool)

(declare-fun res!608655 () Bool)

(assert (=> b!901773 (=> (not res!608655) (not e!504858))))

(assert (=> b!901773 (= res!608655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10290 thiss!1181) (mask!26292 thiss!1181)))))

(declare-fun b!901774 () Bool)

(assert (=> b!901774 (= e!504858 (arrayNoDuplicates!0 (_keys!10290 thiss!1181) #b00000000000000000000000000000000 Nil!17811))))

(assert (= (and d!112101 res!608653) b!901772))

(assert (= (and b!901772 res!608654) b!901773))

(assert (= (and b!901773 res!608655) b!901774))

(declare-fun m!838551 () Bool)

(assert (=> d!112101 m!838551))

(declare-fun m!838553 () Bool)

(assert (=> b!901772 m!838553))

(assert (=> b!901773 m!838425))

(assert (=> b!901774 m!838411))

(assert (=> start!77356 d!112101))

(declare-fun d!112103 () Bool)

(assert (=> d!112103 (= (validMask!0 (mask!26292 thiss!1181)) (and (or (= (mask!26292 thiss!1181) #b00000000000000000000000000000111) (= (mask!26292 thiss!1181) #b00000000000000000000000000001111) (= (mask!26292 thiss!1181) #b00000000000000000000000000011111) (= (mask!26292 thiss!1181) #b00000000000000000000000000111111) (= (mask!26292 thiss!1181) #b00000000000000000000000001111111) (= (mask!26292 thiss!1181) #b00000000000000000000000011111111) (= (mask!26292 thiss!1181) #b00000000000000000000000111111111) (= (mask!26292 thiss!1181) #b00000000000000000000001111111111) (= (mask!26292 thiss!1181) #b00000000000000000000011111111111) (= (mask!26292 thiss!1181) #b00000000000000000000111111111111) (= (mask!26292 thiss!1181) #b00000000000000000001111111111111) (= (mask!26292 thiss!1181) #b00000000000000000011111111111111) (= (mask!26292 thiss!1181) #b00000000000000000111111111111111) (= (mask!26292 thiss!1181) #b00000000000000001111111111111111) (= (mask!26292 thiss!1181) #b00000000000000011111111111111111) (= (mask!26292 thiss!1181) #b00000000000000111111111111111111) (= (mask!26292 thiss!1181) #b00000000000001111111111111111111) (= (mask!26292 thiss!1181) #b00000000000011111111111111111111) (= (mask!26292 thiss!1181) #b00000000000111111111111111111111) (= (mask!26292 thiss!1181) #b00000000001111111111111111111111) (= (mask!26292 thiss!1181) #b00000000011111111111111111111111) (= (mask!26292 thiss!1181) #b00000000111111111111111111111111) (= (mask!26292 thiss!1181) #b00000001111111111111111111111111) (= (mask!26292 thiss!1181) #b00000011111111111111111111111111) (= (mask!26292 thiss!1181) #b00000111111111111111111111111111) (= (mask!26292 thiss!1181) #b00001111111111111111111111111111) (= (mask!26292 thiss!1181) #b00011111111111111111111111111111) (= (mask!26292 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!26292 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!901635 d!112103))

(declare-fun d!112105 () Bool)

(declare-fun e!504859 () Bool)

(assert (=> d!112105 e!504859))

(declare-fun res!608656 () Bool)

(assert (=> d!112105 (=> res!608656 e!504859)))

(declare-fun lt!407467 () Bool)

(assert (=> d!112105 (= res!608656 (not lt!407467))))

(declare-fun lt!407468 () Bool)

(assert (=> d!112105 (= lt!407467 lt!407468)))

(declare-fun lt!407465 () Unit!30592)

(declare-fun e!504860 () Unit!30592)

(assert (=> d!112105 (= lt!407465 e!504860)))

(declare-fun c!95683 () Bool)

(assert (=> d!112105 (= c!95683 lt!407468)))

(assert (=> d!112105 (= lt!407468 (containsKey!434 (toList!5355 lt!407394) (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393))))))

(assert (=> d!112105 (= (contains!4405 lt!407394 (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393))) lt!407467)))

(declare-fun b!901775 () Bool)

(declare-fun lt!407466 () Unit!30592)

(assert (=> b!901775 (= e!504860 lt!407466)))

(assert (=> b!901775 (= lt!407466 (lemmaContainsKeyImpliesGetValueByKeyDefined!328 (toList!5355 lt!407394) (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393))))))

(assert (=> b!901775 (isDefined!336 (getValueByKey!461 (toList!5355 lt!407394) (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393))))))

(declare-fun b!901776 () Bool)

(declare-fun Unit!30599 () Unit!30592)

(assert (=> b!901776 (= e!504860 Unit!30599)))

(declare-fun b!901777 () Bool)

(assert (=> b!901777 (= e!504859 (isDefined!336 (getValueByKey!461 (toList!5355 lt!407394) (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393)))))))

(assert (= (and d!112105 c!95683) b!901775))

(assert (= (and d!112105 (not c!95683)) b!901776))

(assert (= (and d!112105 (not res!608656)) b!901777))

(assert (=> d!112105 m!838439))

(declare-fun m!838555 () Bool)

(assert (=> d!112105 m!838555))

(assert (=> b!901775 m!838439))

(declare-fun m!838557 () Bool)

(assert (=> b!901775 m!838557))

(assert (=> b!901775 m!838439))

(declare-fun m!838559 () Bool)

(assert (=> b!901775 m!838559))

(assert (=> b!901775 m!838559))

(declare-fun m!838561 () Bool)

(assert (=> b!901775 m!838561))

(assert (=> b!901777 m!838439))

(assert (=> b!901777 m!838559))

(assert (=> b!901777 m!838559))

(assert (=> b!901777 m!838561))

(assert (=> b!901635 d!112105))

(declare-fun d!112107 () Bool)

(declare-fun e!504863 () Bool)

(assert (=> d!112107 e!504863))

(declare-fun res!608659 () Bool)

(assert (=> d!112107 (=> (not res!608659) (not e!504863))))

(assert (=> d!112107 (= res!608659 (and (bvsge (index!37956 lt!407393) #b00000000000000000000000000000000) (bvslt (index!37956 lt!407393) (size!25856 (_keys!10290 thiss!1181)))))))

(declare-fun lt!407471 () Unit!30592)

(declare-fun choose!1523 (array!52861 array!52863 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) Unit!30592)

(assert (=> d!112107 (= lt!407471 (choose!1523 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) (index!37956 lt!407393) (defaultEntry!5455 thiss!1181)))))

(assert (=> d!112107 (validMask!0 (mask!26292 thiss!1181))))

(assert (=> d!112107 (= (lemmaValidKeyInArrayIsInListMap!257 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) (index!37956 lt!407393) (defaultEntry!5455 thiss!1181)) lt!407471)))

(declare-fun b!901780 () Bool)

(assert (=> b!901780 (= e!504863 (contains!4405 (getCurrentListMap!2627 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)) (select (arr!25396 (_keys!10290 thiss!1181)) (index!37956 lt!407393))))))

(assert (= (and d!112107 res!608659) b!901780))

(declare-fun m!838563 () Bool)

(assert (=> d!112107 m!838563))

(assert (=> d!112107 m!838435))

(assert (=> b!901780 m!838437))

(assert (=> b!901780 m!838439))

(assert (=> b!901780 m!838437))

(assert (=> b!901780 m!838439))

(declare-fun m!838565 () Bool)

(assert (=> b!901780 m!838565))

(assert (=> b!901635 d!112107))

(declare-fun d!112109 () Bool)

(declare-fun res!608664 () Bool)

(declare-fun e!504868 () Bool)

(assert (=> d!112109 (=> res!608664 e!504868)))

(assert (=> d!112109 (= res!608664 (= (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000) key!785))))

(assert (=> d!112109 (= (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000) e!504868)))

(declare-fun b!901785 () Bool)

(declare-fun e!504869 () Bool)

(assert (=> b!901785 (= e!504868 e!504869)))

(declare-fun res!608665 () Bool)

(assert (=> b!901785 (=> (not res!608665) (not e!504869))))

(assert (=> b!901785 (= res!608665 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25856 (_keys!10290 thiss!1181))))))

(declare-fun b!901786 () Bool)

(assert (=> b!901786 (= e!504869 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!112109 (not res!608664)) b!901785))

(assert (= (and b!901785 res!608665) b!901786))

(assert (=> d!112109 m!838515))

(declare-fun m!838567 () Bool)

(assert (=> b!901786 m!838567))

(assert (=> b!901635 d!112109))

(declare-fun b!901829 () Bool)

(declare-fun e!504907 () ListLongMap!10679)

(declare-fun e!504896 () ListLongMap!10679)

(assert (=> b!901829 (= e!504907 e!504896)))

(declare-fun c!95696 () Bool)

(assert (=> b!901829 (= c!95696 (and (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!95698 () Bool)

(declare-fun call!40126 () ListLongMap!10679)

(declare-fun bm!40123 () Bool)

(declare-fun call!40127 () ListLongMap!10679)

(declare-fun call!40130 () ListLongMap!10679)

(declare-fun call!40129 () ListLongMap!10679)

(declare-fun +!2608 (ListLongMap!10679 tuple2!11980) ListLongMap!10679)

(assert (=> bm!40123 (= call!40127 (+!2608 (ite c!95698 call!40126 (ite c!95696 call!40130 call!40129)) (ite (or c!95698 c!95696) (tuple2!11981 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5286 thiss!1181)) (tuple2!11981 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5286 thiss!1181)))))))

(declare-fun bm!40124 () Bool)

(declare-fun call!40128 () ListLongMap!10679)

(assert (=> bm!40124 (= call!40128 call!40127)))

(declare-fun b!901830 () Bool)

(declare-fun c!95700 () Bool)

(assert (=> b!901830 (= c!95700 (and (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!504905 () ListLongMap!10679)

(assert (=> b!901830 (= e!504896 e!504905)))

(declare-fun b!901831 () Bool)

(declare-fun res!608691 () Bool)

(declare-fun e!504901 () Bool)

(assert (=> b!901831 (=> (not res!608691) (not e!504901))))

(declare-fun e!504898 () Bool)

(assert (=> b!901831 (= res!608691 e!504898)))

(declare-fun res!608690 () Bool)

(assert (=> b!901831 (=> res!608690 e!504898)))

(declare-fun e!504900 () Bool)

(assert (=> b!901831 (= res!608690 (not e!504900))))

(declare-fun res!608684 () Bool)

(assert (=> b!901831 (=> (not res!608684) (not e!504900))))

(assert (=> b!901831 (= res!608684 (bvslt #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))

(declare-fun b!901832 () Bool)

(assert (=> b!901832 (= e!504905 call!40129)))

(declare-fun b!901833 () Bool)

(declare-fun e!504906 () Bool)

(assert (=> b!901833 (= e!504906 (validKeyInArray!0 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!40125 () Bool)

(declare-fun call!40131 () Bool)

(declare-fun lt!407534 () ListLongMap!10679)

(assert (=> bm!40125 (= call!40131 (contains!4405 lt!407534 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!112111 () Bool)

(assert (=> d!112111 e!504901))

(declare-fun res!608685 () Bool)

(assert (=> d!112111 (=> (not res!608685) (not e!504901))))

(assert (=> d!112111 (= res!608685 (or (bvsge #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))))

(declare-fun lt!407522 () ListLongMap!10679)

(assert (=> d!112111 (= lt!407534 lt!407522)))

(declare-fun lt!407530 () Unit!30592)

(declare-fun e!504902 () Unit!30592)

(assert (=> d!112111 (= lt!407530 e!504902)))

(declare-fun c!95699 () Bool)

(assert (=> d!112111 (= c!95699 e!504906)))

(declare-fun res!608692 () Bool)

(assert (=> d!112111 (=> (not res!608692) (not e!504906))))

(assert (=> d!112111 (= res!608692 (bvslt #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))

(assert (=> d!112111 (= lt!407522 e!504907)))

(assert (=> d!112111 (= c!95698 (and (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!112111 (validMask!0 (mask!26292 thiss!1181))))

(assert (=> d!112111 (= (getCurrentListMap!2627 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)) lt!407534)))

(declare-fun b!901834 () Bool)

(declare-fun e!504899 () Bool)

(declare-fun apply!413 (ListLongMap!10679 (_ BitVec 64)) V!29479)

(assert (=> b!901834 (= e!504899 (= (apply!413 lt!407534 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5286 thiss!1181)))))

(declare-fun b!901835 () Bool)

(declare-fun lt!407521 () Unit!30592)

(assert (=> b!901835 (= e!504902 lt!407521)))

(declare-fun lt!407531 () ListLongMap!10679)

(declare-fun getCurrentListMapNoExtraKeys!3329 (array!52861 array!52863 (_ BitVec 32) (_ BitVec 32) V!29479 V!29479 (_ BitVec 32) Int) ListLongMap!10679)

(assert (=> b!901835 (= lt!407531 (getCurrentListMapNoExtraKeys!3329 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!407526 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407526 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407529 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407529 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407527 () Unit!30592)

(declare-fun addStillContains!339 (ListLongMap!10679 (_ BitVec 64) V!29479 (_ BitVec 64)) Unit!30592)

(assert (=> b!901835 (= lt!407527 (addStillContains!339 lt!407531 lt!407526 (zeroValue!5286 thiss!1181) lt!407529))))

(assert (=> b!901835 (contains!4405 (+!2608 lt!407531 (tuple2!11981 lt!407526 (zeroValue!5286 thiss!1181))) lt!407529)))

(declare-fun lt!407524 () Unit!30592)

(assert (=> b!901835 (= lt!407524 lt!407527)))

(declare-fun lt!407523 () ListLongMap!10679)

(assert (=> b!901835 (= lt!407523 (getCurrentListMapNoExtraKeys!3329 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!407516 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407516 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407533 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407533 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407535 () Unit!30592)

(declare-fun addApplyDifferent!339 (ListLongMap!10679 (_ BitVec 64) V!29479 (_ BitVec 64)) Unit!30592)

(assert (=> b!901835 (= lt!407535 (addApplyDifferent!339 lt!407523 lt!407516 (minValue!5286 thiss!1181) lt!407533))))

(assert (=> b!901835 (= (apply!413 (+!2608 lt!407523 (tuple2!11981 lt!407516 (minValue!5286 thiss!1181))) lt!407533) (apply!413 lt!407523 lt!407533))))

(declare-fun lt!407537 () Unit!30592)

(assert (=> b!901835 (= lt!407537 lt!407535)))

(declare-fun lt!407528 () ListLongMap!10679)

(assert (=> b!901835 (= lt!407528 (getCurrentListMapNoExtraKeys!3329 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!407536 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407520 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407520 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun lt!407519 () Unit!30592)

(assert (=> b!901835 (= lt!407519 (addApplyDifferent!339 lt!407528 lt!407536 (zeroValue!5286 thiss!1181) lt!407520))))

(assert (=> b!901835 (= (apply!413 (+!2608 lt!407528 (tuple2!11981 lt!407536 (zeroValue!5286 thiss!1181))) lt!407520) (apply!413 lt!407528 lt!407520))))

(declare-fun lt!407517 () Unit!30592)

(assert (=> b!901835 (= lt!407517 lt!407519)))

(declare-fun lt!407525 () ListLongMap!10679)

(assert (=> b!901835 (= lt!407525 (getCurrentListMapNoExtraKeys!3329 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun lt!407532 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407532 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!407518 () (_ BitVec 64))

(assert (=> b!901835 (= lt!407518 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!901835 (= lt!407521 (addApplyDifferent!339 lt!407525 lt!407532 (minValue!5286 thiss!1181) lt!407518))))

(assert (=> b!901835 (= (apply!413 (+!2608 lt!407525 (tuple2!11981 lt!407532 (minValue!5286 thiss!1181))) lt!407518) (apply!413 lt!407525 lt!407518))))

(declare-fun b!901836 () Bool)

(declare-fun e!504897 () Bool)

(declare-fun call!40132 () Bool)

(assert (=> b!901836 (= e!504897 (not call!40132))))

(declare-fun b!901837 () Bool)

(declare-fun e!504904 () Bool)

(assert (=> b!901837 (= e!504904 (not call!40131))))

(declare-fun b!901838 () Bool)

(declare-fun e!504903 () Bool)

(assert (=> b!901838 (= e!504904 e!504903)))

(declare-fun res!608686 () Bool)

(assert (=> b!901838 (= res!608686 call!40131)))

(assert (=> b!901838 (=> (not res!608686) (not e!504903))))

(declare-fun bm!40126 () Bool)

(assert (=> bm!40126 (= call!40130 call!40126)))

(declare-fun bm!40127 () Bool)

(assert (=> bm!40127 (= call!40132 (contains!4405 lt!407534 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!901839 () Bool)

(assert (=> b!901839 (= e!504896 call!40128)))

(declare-fun b!901840 () Bool)

(assert (=> b!901840 (= e!504907 (+!2608 call!40127 (tuple2!11981 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5286 thiss!1181))))))

(declare-fun bm!40128 () Bool)

(assert (=> bm!40128 (= call!40126 (getCurrentListMapNoExtraKeys!3329 (_keys!10290 thiss!1181) (_values!5473 thiss!1181) (mask!26292 thiss!1181) (extraKeys!5182 thiss!1181) (zeroValue!5286 thiss!1181) (minValue!5286 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5455 thiss!1181)))))

(declare-fun b!901841 () Bool)

(declare-fun e!504908 () Bool)

(assert (=> b!901841 (= e!504898 e!504908)))

(declare-fun res!608688 () Bool)

(assert (=> b!901841 (=> (not res!608688) (not e!504908))))

(assert (=> b!901841 (= res!608688 (contains!4405 lt!407534 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> b!901841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))

(declare-fun b!901842 () Bool)

(assert (=> b!901842 (= e!504897 e!504899)))

(declare-fun res!608689 () Bool)

(assert (=> b!901842 (= res!608689 call!40132)))

(assert (=> b!901842 (=> (not res!608689) (not e!504899))))

(declare-fun b!901843 () Bool)

(declare-fun get!13376 (ValueCell!8711 V!29479) V!29479)

(declare-fun dynLambda!1328 (Int (_ BitVec 64)) V!29479)

(assert (=> b!901843 (= e!504908 (= (apply!413 lt!407534 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)) (get!13376 (select (arr!25397 (_values!5473 thiss!1181)) #b00000000000000000000000000000000) (dynLambda!1328 (defaultEntry!5455 thiss!1181) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!901843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25857 (_values!5473 thiss!1181))))))

(assert (=> b!901843 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!25856 (_keys!10290 thiss!1181))))))

(declare-fun bm!40129 () Bool)

(assert (=> bm!40129 (= call!40129 call!40130)))

(declare-fun b!901844 () Bool)

(declare-fun Unit!30600 () Unit!30592)

(assert (=> b!901844 (= e!504902 Unit!30600)))

(declare-fun b!901845 () Bool)

(assert (=> b!901845 (= e!504905 call!40128)))

(declare-fun b!901846 () Bool)

(assert (=> b!901846 (= e!504901 e!504897)))

(declare-fun c!95697 () Bool)

(assert (=> b!901846 (= c!95697 (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!901847 () Bool)

(declare-fun res!608687 () Bool)

(assert (=> b!901847 (=> (not res!608687) (not e!504901))))

(assert (=> b!901847 (= res!608687 e!504904)))

(declare-fun c!95701 () Bool)

(assert (=> b!901847 (= c!95701 (not (= (bvand (extraKeys!5182 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!901848 () Bool)

(assert (=> b!901848 (= e!504903 (= (apply!413 lt!407534 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5286 thiss!1181)))))

(declare-fun b!901849 () Bool)

(assert (=> b!901849 (= e!504900 (validKeyInArray!0 (select (arr!25396 (_keys!10290 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!112111 c!95698) b!901840))

(assert (= (and d!112111 (not c!95698)) b!901829))

(assert (= (and b!901829 c!95696) b!901839))

(assert (= (and b!901829 (not c!95696)) b!901830))

(assert (= (and b!901830 c!95700) b!901845))

(assert (= (and b!901830 (not c!95700)) b!901832))

(assert (= (or b!901845 b!901832) bm!40129))

(assert (= (or b!901839 bm!40129) bm!40126))

(assert (= (or b!901839 b!901845) bm!40124))

(assert (= (or b!901840 bm!40126) bm!40128))

(assert (= (or b!901840 bm!40124) bm!40123))

(assert (= (and d!112111 res!608692) b!901833))

(assert (= (and d!112111 c!95699) b!901835))

(assert (= (and d!112111 (not c!95699)) b!901844))

(assert (= (and d!112111 res!608685) b!901831))

(assert (= (and b!901831 res!608684) b!901849))

(assert (= (and b!901831 (not res!608690)) b!901841))

(assert (= (and b!901841 res!608688) b!901843))

(assert (= (and b!901831 res!608691) b!901847))

(assert (= (and b!901847 c!95701) b!901838))

(assert (= (and b!901847 (not c!95701)) b!901837))

(assert (= (and b!901838 res!608686) b!901848))

(assert (= (or b!901838 b!901837) bm!40125))

(assert (= (and b!901847 res!608687) b!901846))

(assert (= (and b!901846 c!95697) b!901842))

(assert (= (and b!901846 (not c!95697)) b!901836))

(assert (= (and b!901842 res!608689) b!901834))

(assert (= (or b!901842 b!901836) bm!40127))

(declare-fun b_lambda!13037 () Bool)

(assert (=> (not b_lambda!13037) (not b!901843)))

(declare-fun t!25165 () Bool)

(declare-fun tb!5199 () Bool)

(assert (=> (and b!901629 (= (defaultEntry!5455 thiss!1181) (defaultEntry!5455 thiss!1181)) t!25165) tb!5199))

(declare-fun result!10185 () Bool)

(assert (=> tb!5199 (= result!10185 tp_is_empty!18385)))

(assert (=> b!901843 t!25165))

(declare-fun b_and!26397 () Bool)

(assert (= b_and!26391 (and (=> t!25165 result!10185) b_and!26397)))

(declare-fun m!838569 () Bool)

(assert (=> bm!40123 m!838569))

(declare-fun m!838571 () Bool)

(assert (=> bm!40125 m!838571))

(declare-fun m!838573 () Bool)

(assert (=> b!901848 m!838573))

(assert (=> b!901841 m!838515))

(assert (=> b!901841 m!838515))

(declare-fun m!838575 () Bool)

(assert (=> b!901841 m!838575))

(declare-fun m!838577 () Bool)

(assert (=> bm!40128 m!838577))

(assert (=> b!901833 m!838515))

(assert (=> b!901833 m!838515))

(assert (=> b!901833 m!838517))

(assert (=> b!901849 m!838515))

(assert (=> b!901849 m!838515))

(assert (=> b!901849 m!838517))

(declare-fun m!838579 () Bool)

(assert (=> b!901840 m!838579))

(declare-fun m!838581 () Bool)

(assert (=> b!901834 m!838581))

(assert (=> d!112111 m!838435))

(declare-fun m!838583 () Bool)

(assert (=> b!901843 m!838583))

(assert (=> b!901843 m!838515))

(assert (=> b!901843 m!838515))

(declare-fun m!838585 () Bool)

(assert (=> b!901843 m!838585))

(declare-fun m!838587 () Bool)

(assert (=> b!901843 m!838587))

(assert (=> b!901843 m!838587))

(assert (=> b!901843 m!838583))

(declare-fun m!838589 () Bool)

(assert (=> b!901843 m!838589))

(declare-fun m!838591 () Bool)

(assert (=> bm!40127 m!838591))

(declare-fun m!838593 () Bool)

(assert (=> b!901835 m!838593))

(declare-fun m!838595 () Bool)

(assert (=> b!901835 m!838595))

(declare-fun m!838597 () Bool)

(assert (=> b!901835 m!838597))

(declare-fun m!838599 () Bool)

(assert (=> b!901835 m!838599))

(declare-fun m!838601 () Bool)

(assert (=> b!901835 m!838601))

(assert (=> b!901835 m!838597))

(declare-fun m!838603 () Bool)

(assert (=> b!901835 m!838603))

(declare-fun m!838605 () Bool)

(assert (=> b!901835 m!838605))

(assert (=> b!901835 m!838515))

(declare-fun m!838607 () Bool)

(assert (=> b!901835 m!838607))

(declare-fun m!838609 () Bool)

(assert (=> b!901835 m!838609))

(assert (=> b!901835 m!838593))

(declare-fun m!838611 () Bool)

(assert (=> b!901835 m!838611))

(declare-fun m!838613 () Bool)

(assert (=> b!901835 m!838613))

(assert (=> b!901835 m!838577))

(declare-fun m!838615 () Bool)

(assert (=> b!901835 m!838615))

(declare-fun m!838617 () Bool)

(assert (=> b!901835 m!838617))

(assert (=> b!901835 m!838609))

(declare-fun m!838619 () Bool)

(assert (=> b!901835 m!838619))

(assert (=> b!901835 m!838605))

(declare-fun m!838621 () Bool)

(assert (=> b!901835 m!838621))

(assert (=> b!901635 d!112111))

(declare-fun d!112113 () Bool)

(assert (=> d!112113 (arrayContainsKey!0 (_keys!10290 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!407540 () Unit!30592)

(declare-fun choose!13 (array!52861 (_ BitVec 64) (_ BitVec 32)) Unit!30592)

(assert (=> d!112113 (= lt!407540 (choose!13 (_keys!10290 thiss!1181) key!785 (index!37956 lt!407393)))))

(assert (=> d!112113 (bvsge (index!37956 lt!407393) #b00000000000000000000000000000000)))

(assert (=> d!112113 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10290 thiss!1181) key!785 (index!37956 lt!407393)) lt!407540)))

(declare-fun bs!25307 () Bool)

(assert (= bs!25307 d!112113))

(assert (=> bs!25307 m!838431))

(declare-fun m!838623 () Bool)

(assert (=> bs!25307 m!838623))

(assert (=> b!901635 d!112113))

(declare-fun mapNonEmpty!29266 () Bool)

(declare-fun mapRes!29266 () Bool)

(declare-fun tp!56281 () Bool)

(declare-fun e!504913 () Bool)

(assert (=> mapNonEmpty!29266 (= mapRes!29266 (and tp!56281 e!504913))))

(declare-fun mapValue!29266 () ValueCell!8711)

(declare-fun mapRest!29266 () (Array (_ BitVec 32) ValueCell!8711))

(declare-fun mapKey!29266 () (_ BitVec 32))

(assert (=> mapNonEmpty!29266 (= mapRest!29257 (store mapRest!29266 mapKey!29266 mapValue!29266))))

(declare-fun b!901858 () Bool)

(assert (=> b!901858 (= e!504913 tp_is_empty!18385)))

(declare-fun condMapEmpty!29266 () Bool)

(declare-fun mapDefault!29266 () ValueCell!8711)

(assert (=> mapNonEmpty!29257 (= condMapEmpty!29266 (= mapRest!29257 ((as const (Array (_ BitVec 32) ValueCell!8711)) mapDefault!29266)))))

(declare-fun e!504914 () Bool)

(assert (=> mapNonEmpty!29257 (= tp!56265 (and e!504914 mapRes!29266))))

(declare-fun b!901859 () Bool)

(assert (=> b!901859 (= e!504914 tp_is_empty!18385)))

(declare-fun mapIsEmpty!29266 () Bool)

(assert (=> mapIsEmpty!29266 mapRes!29266))

(assert (= (and mapNonEmpty!29257 condMapEmpty!29266) mapIsEmpty!29266))

(assert (= (and mapNonEmpty!29257 (not condMapEmpty!29266)) mapNonEmpty!29266))

(assert (= (and mapNonEmpty!29266 ((_ is ValueCellFull!8711) mapValue!29266)) b!901858))

(assert (= (and mapNonEmpty!29257 ((_ is ValueCellFull!8711) mapDefault!29266)) b!901859))

(declare-fun m!838625 () Bool)

(assert (=> mapNonEmpty!29266 m!838625))

(declare-fun b_lambda!13039 () Bool)

(assert (= b_lambda!13037 (or (and b!901629 b_free!16057) b_lambda!13039)))

(check-sat (not b!901833) (not b!901720) (not b!901777) (not d!112097) (not d!112105) (not b!901843) tp_is_empty!18385 (not b!901734) (not b!901834) (not b!901762) (not b!901840) (not d!112101) (not bm!40128) (not b!901775) (not d!112099) (not bm!40127) (not bm!40105) (not bm!40123) (not d!112113) (not d!112107) (not b!901735) (not b!901742) (not b_next!16057) (not b!901786) (not b!901841) (not b!901773) (not bm!40108) (not b!901717) (not b!901774) (not d!112095) (not d!112111) (not b!901849) (not b!901772) (not b!901733) (not b!901835) (not b!901744) (not b!901848) (not b_lambda!13039) (not bm!40125) (not mapNonEmpty!29266) b_and!26397 (not b!901747) (not b!901780))
(check-sat b_and!26397 (not b_next!16057))
