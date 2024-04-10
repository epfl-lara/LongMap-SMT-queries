; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18672 () Bool)

(assert start!18672)

(declare-fun b!184691 () Bool)

(declare-fun b_free!4551 () Bool)

(declare-fun b_next!4551 () Bool)

(assert (=> b!184691 (= b_free!4551 (not b_next!4551))))

(declare-fun tp!16439 () Bool)

(declare-fun b_and!11141 () Bool)

(assert (=> b!184691 (= tp!16439 b_and!11141)))

(declare-fun b!184685 () Bool)

(declare-fun res!87372 () Bool)

(declare-fun e!121565 () Bool)

(assert (=> b!184685 (=> (not res!87372) (not e!121565))))

(declare-datatypes ((V!5411 0))(
  ( (V!5412 (val!2206 Int)) )
))
(declare-datatypes ((ValueCell!1818 0))(
  ( (ValueCellFull!1818 (v!4113 V!5411)) (EmptyCell!1818) )
))
(declare-datatypes ((array!7847 0))(
  ( (array!7848 (arr!3707 (Array (_ BitVec 32) (_ BitVec 64))) (size!4022 (_ BitVec 32))) )
))
(declare-datatypes ((array!7849 0))(
  ( (array!7850 (arr!3708 (Array (_ BitVec 32) ValueCell!1818)) (size!4023 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2544 0))(
  ( (LongMapFixedSize!2545 (defaultEntry!3769 Int) (mask!8859 (_ BitVec 32)) (extraKeys!3506 (_ BitVec 32)) (zeroValue!3610 V!5411) (minValue!3610 V!5411) (_size!1321 (_ BitVec 32)) (_keys!5700 array!7847) (_values!3752 array!7849) (_vacant!1321 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2544)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3434 0))(
  ( (tuple2!3435 (_1!1728 (_ BitVec 64)) (_2!1728 V!5411)) )
))
(declare-datatypes ((List!2348 0))(
  ( (Nil!2345) (Cons!2344 (h!2976 tuple2!3434) (t!7224 List!2348)) )
))
(declare-datatypes ((ListLongMap!2351 0))(
  ( (ListLongMap!2352 (toList!1191 List!2348)) )
))
(declare-fun contains!1283 (ListLongMap!2351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!839 (array!7847 array!7849 (_ BitVec 32) (_ BitVec 32) V!5411 V!5411 (_ BitVec 32) Int) ListLongMap!2351)

(assert (=> b!184685 (= res!87372 (not (contains!1283 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)) key!828)))))

(declare-fun b!184686 () Bool)

(assert (=> b!184686 (= e!121565 (and (= (size!4023 (_values!3752 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8859 thiss!1248))) (= (size!4022 (_keys!5700 thiss!1248)) (size!4023 (_values!3752 thiss!1248))) (bvsge (mask!8859 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3506 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3506 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!184687 () Bool)

(declare-fun res!87368 () Bool)

(assert (=> b!184687 (=> (not res!87368) (not e!121565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!184687 (= res!87368 (validMask!0 (mask!8859 thiss!1248)))))

(declare-fun b!184688 () Bool)

(declare-fun res!87371 () Bool)

(declare-fun e!121559 () Bool)

(assert (=> b!184688 (=> (not res!87371) (not e!121559))))

(assert (=> b!184688 (= res!87371 (not (= key!828 (bvneg key!828))))))

(declare-fun b!184689 () Bool)

(declare-fun e!121561 () Bool)

(declare-fun tp_is_empty!4323 () Bool)

(assert (=> b!184689 (= e!121561 tp_is_empty!4323)))

(declare-fun mapIsEmpty!7433 () Bool)

(declare-fun mapRes!7433 () Bool)

(assert (=> mapIsEmpty!7433 mapRes!7433))

(declare-fun mapNonEmpty!7433 () Bool)

(declare-fun tp!16438 () Bool)

(declare-fun e!121563 () Bool)

(assert (=> mapNonEmpty!7433 (= mapRes!7433 (and tp!16438 e!121563))))

(declare-fun mapValue!7433 () ValueCell!1818)

(declare-fun mapRest!7433 () (Array (_ BitVec 32) ValueCell!1818))

(declare-fun mapKey!7433 () (_ BitVec 32))

(assert (=> mapNonEmpty!7433 (= (arr!3708 (_values!3752 thiss!1248)) (store mapRest!7433 mapKey!7433 mapValue!7433))))

(declare-fun b!184690 () Bool)

(assert (=> b!184690 (= e!121559 e!121565)))

(declare-fun res!87370 () Bool)

(assert (=> b!184690 (=> (not res!87370) (not e!121565))))

(declare-datatypes ((SeekEntryResult!628 0))(
  ( (MissingZero!628 (index!4682 (_ BitVec 32))) (Found!628 (index!4683 (_ BitVec 32))) (Intermediate!628 (undefined!1440 Bool) (index!4684 (_ BitVec 32)) (x!20078 (_ BitVec 32))) (Undefined!628) (MissingVacant!628 (index!4685 (_ BitVec 32))) )
))
(declare-fun lt!91336 () SeekEntryResult!628)

(get-info :version)

(assert (=> b!184690 (= res!87370 (and (not ((_ is Undefined!628) lt!91336)) (not ((_ is MissingVacant!628) lt!91336)) (not ((_ is MissingZero!628) lt!91336)) ((_ is Found!628) lt!91336)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!7847 (_ BitVec 32)) SeekEntryResult!628)

(assert (=> b!184690 (= lt!91336 (seekEntryOrOpen!0 key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(declare-fun e!121564 () Bool)

(declare-fun e!121562 () Bool)

(declare-fun array_inv!2397 (array!7847) Bool)

(declare-fun array_inv!2398 (array!7849) Bool)

(assert (=> b!184691 (= e!121562 (and tp!16439 tp_is_empty!4323 (array_inv!2397 (_keys!5700 thiss!1248)) (array_inv!2398 (_values!3752 thiss!1248)) e!121564))))

(declare-fun res!87369 () Bool)

(assert (=> start!18672 (=> (not res!87369) (not e!121559))))

(declare-fun valid!1050 (LongMapFixedSize!2544) Bool)

(assert (=> start!18672 (= res!87369 (valid!1050 thiss!1248))))

(assert (=> start!18672 e!121559))

(assert (=> start!18672 e!121562))

(assert (=> start!18672 true))

(declare-fun b!184692 () Bool)

(assert (=> b!184692 (= e!121563 tp_is_empty!4323)))

(declare-fun b!184693 () Bool)

(assert (=> b!184693 (= e!121564 (and e!121561 mapRes!7433))))

(declare-fun condMapEmpty!7433 () Bool)

(declare-fun mapDefault!7433 () ValueCell!1818)

(assert (=> b!184693 (= condMapEmpty!7433 (= (arr!3708 (_values!3752 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1818)) mapDefault!7433)))))

(assert (= (and start!18672 res!87369) b!184688))

(assert (= (and b!184688 res!87371) b!184690))

(assert (= (and b!184690 res!87370) b!184685))

(assert (= (and b!184685 res!87372) b!184687))

(assert (= (and b!184687 res!87368) b!184686))

(assert (= (and b!184693 condMapEmpty!7433) mapIsEmpty!7433))

(assert (= (and b!184693 (not condMapEmpty!7433)) mapNonEmpty!7433))

(assert (= (and mapNonEmpty!7433 ((_ is ValueCellFull!1818) mapValue!7433)) b!184692))

(assert (= (and b!184693 ((_ is ValueCellFull!1818) mapDefault!7433)) b!184689))

(assert (= b!184691 b!184693))

(assert (= start!18672 b!184691))

(declare-fun m!212053 () Bool)

(assert (=> mapNonEmpty!7433 m!212053))

(declare-fun m!212055 () Bool)

(assert (=> start!18672 m!212055))

(declare-fun m!212057 () Bool)

(assert (=> b!184687 m!212057))

(declare-fun m!212059 () Bool)

(assert (=> b!184685 m!212059))

(assert (=> b!184685 m!212059))

(declare-fun m!212061 () Bool)

(assert (=> b!184685 m!212061))

(declare-fun m!212063 () Bool)

(assert (=> b!184691 m!212063))

(declare-fun m!212065 () Bool)

(assert (=> b!184691 m!212065))

(declare-fun m!212067 () Bool)

(assert (=> b!184690 m!212067))

(check-sat (not b!184687) (not b!184685) (not b_next!4551) b_and!11141 (not mapNonEmpty!7433) (not b!184690) (not start!18672) tp_is_empty!4323 (not b!184691))
(check-sat b_and!11141 (not b_next!4551))
(get-model)

(declare-fun d!54989 () Bool)

(declare-fun e!121591 () Bool)

(assert (=> d!54989 e!121591))

(declare-fun res!87390 () Bool)

(assert (=> d!54989 (=> res!87390 e!121591)))

(declare-fun lt!91349 () Bool)

(assert (=> d!54989 (= res!87390 (not lt!91349))))

(declare-fun lt!91350 () Bool)

(assert (=> d!54989 (= lt!91349 lt!91350)))

(declare-datatypes ((Unit!5576 0))(
  ( (Unit!5577) )
))
(declare-fun lt!91348 () Unit!5576)

(declare-fun e!121592 () Unit!5576)

(assert (=> d!54989 (= lt!91348 e!121592)))

(declare-fun c!33135 () Bool)

(assert (=> d!54989 (= c!33135 lt!91350)))

(declare-fun containsKey!224 (List!2348 (_ BitVec 64)) Bool)

(assert (=> d!54989 (= lt!91350 (containsKey!224 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))

(assert (=> d!54989 (= (contains!1283 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)) key!828) lt!91349)))

(declare-fun b!184727 () Bool)

(declare-fun lt!91351 () Unit!5576)

(assert (=> b!184727 (= e!121592 lt!91351)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!172 (List!2348 (_ BitVec 64)) Unit!5576)

(assert (=> b!184727 (= lt!91351 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))

(declare-datatypes ((Option!226 0))(
  ( (Some!225 (v!4115 V!5411)) (None!224) )
))
(declare-fun isDefined!173 (Option!226) Bool)

(declare-fun getValueByKey!220 (List!2348 (_ BitVec 64)) Option!226)

(assert (=> b!184727 (isDefined!173 (getValueByKey!220 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))

(declare-fun b!184728 () Bool)

(declare-fun Unit!5578 () Unit!5576)

(assert (=> b!184728 (= e!121592 Unit!5578)))

(declare-fun b!184729 () Bool)

(assert (=> b!184729 (= e!121591 (isDefined!173 (getValueByKey!220 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828)))))

(assert (= (and d!54989 c!33135) b!184727))

(assert (= (and d!54989 (not c!33135)) b!184728))

(assert (= (and d!54989 (not res!87390)) b!184729))

(declare-fun m!212085 () Bool)

(assert (=> d!54989 m!212085))

(declare-fun m!212087 () Bool)

(assert (=> b!184727 m!212087))

(declare-fun m!212089 () Bool)

(assert (=> b!184727 m!212089))

(assert (=> b!184727 m!212089))

(declare-fun m!212091 () Bool)

(assert (=> b!184727 m!212091))

(assert (=> b!184729 m!212089))

(assert (=> b!184729 m!212089))

(assert (=> b!184729 m!212091))

(assert (=> b!184685 d!54989))

(declare-fun bm!18640 () Bool)

(declare-fun call!18645 () Bool)

(declare-fun lt!91398 () ListLongMap!2351)

(assert (=> bm!18640 (= call!18645 (contains!1283 lt!91398 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184772 () Bool)

(declare-fun e!121629 () ListLongMap!2351)

(declare-fun call!18643 () ListLongMap!2351)

(assert (=> b!184772 (= e!121629 call!18643)))

(declare-fun b!184773 () Bool)

(declare-fun e!121625 () Bool)

(declare-fun apply!163 (ListLongMap!2351 (_ BitVec 64)) V!5411)

(assert (=> b!184773 (= e!121625 (= (apply!163 lt!91398 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!3610 thiss!1248)))))

(declare-fun call!18648 () ListLongMap!2351)

(declare-fun call!18647 () ListLongMap!2351)

(declare-fun c!33148 () Bool)

(declare-fun c!33149 () Bool)

(declare-fun bm!18641 () Bool)

(declare-fun call!18646 () ListLongMap!2351)

(declare-fun +!283 (ListLongMap!2351 tuple2!3434) ListLongMap!2351)

(assert (=> bm!18641 (= call!18646 (+!283 (ite c!33149 call!18647 (ite c!33148 call!18648 call!18643)) (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))

(declare-fun b!184774 () Bool)

(declare-fun e!121628 () Bool)

(declare-fun call!18644 () Bool)

(assert (=> b!184774 (= e!121628 (not call!18644))))

(declare-fun b!184775 () Bool)

(declare-fun e!121630 () Bool)

(declare-fun e!121620 () Bool)

(assert (=> b!184775 (= e!121630 e!121620)))

(declare-fun res!87413 () Bool)

(assert (=> b!184775 (=> (not res!87413) (not e!121620))))

(assert (=> b!184775 (= res!87413 (contains!1283 lt!91398 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184775 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun b!184776 () Bool)

(declare-fun call!18649 () ListLongMap!2351)

(assert (=> b!184776 (= e!121629 call!18649)))

(declare-fun b!184777 () Bool)

(declare-fun e!121623 () Bool)

(declare-fun e!121631 () Bool)

(assert (=> b!184777 (= e!121623 e!121631)))

(declare-fun c!33153 () Bool)

(assert (=> b!184777 (= c!33153 (not (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184778 () Bool)

(declare-fun e!121626 () Unit!5576)

(declare-fun Unit!5579 () Unit!5576)

(assert (=> b!184778 (= e!121626 Unit!5579)))

(declare-fun b!184779 () Bool)

(declare-fun e!121624 () ListLongMap!2351)

(assert (=> b!184779 (= e!121624 call!18649)))

(declare-fun b!184780 () Bool)

(declare-fun e!121619 () ListLongMap!2351)

(assert (=> b!184780 (= e!121619 e!121624)))

(assert (=> b!184780 (= c!33148 (and (not (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!184781 () Bool)

(declare-fun c!33152 () Bool)

(assert (=> b!184781 (= c!33152 (and (not (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!184781 (= e!121624 e!121629)))

(declare-fun bm!18642 () Bool)

(assert (=> bm!18642 (= call!18649 call!18646)))

(declare-fun b!184782 () Bool)

(declare-fun e!121621 () Bool)

(assert (=> b!184782 (= e!121631 e!121621)))

(declare-fun res!87415 () Bool)

(assert (=> b!184782 (= res!87415 call!18645)))

(assert (=> b!184782 (=> (not res!87415) (not e!121621))))

(declare-fun b!184783 () Bool)

(declare-fun res!87411 () Bool)

(assert (=> b!184783 (=> (not res!87411) (not e!121623))))

(assert (=> b!184783 (= res!87411 e!121628)))

(declare-fun c!33150 () Bool)

(assert (=> b!184783 (= c!33150 (not (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!18643 () Bool)

(assert (=> bm!18643 (= call!18644 (contains!1283 lt!91398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!54991 () Bool)

(assert (=> d!54991 e!121623))

(declare-fun res!87409 () Bool)

(assert (=> d!54991 (=> (not res!87409) (not e!121623))))

(assert (=> d!54991 (= res!87409 (or (bvsge #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))))

(declare-fun lt!91409 () ListLongMap!2351)

(assert (=> d!54991 (= lt!91398 lt!91409)))

(declare-fun lt!91417 () Unit!5576)

(assert (=> d!54991 (= lt!91417 e!121626)))

(declare-fun c!33151 () Bool)

(declare-fun e!121622 () Bool)

(assert (=> d!54991 (= c!33151 e!121622)))

(declare-fun res!87417 () Bool)

(assert (=> d!54991 (=> (not res!87417) (not e!121622))))

(assert (=> d!54991 (= res!87417 (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> d!54991 (= lt!91409 e!121619)))

(assert (=> d!54991 (= c!33149 (and (not (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!3506 thiss!1248) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!54991 (validMask!0 (mask!8859 thiss!1248))))

(assert (=> d!54991 (= (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)) lt!91398)))

(declare-fun b!184784 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!184784 (= e!121622 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184785 () Bool)

(assert (=> b!184785 (= e!121619 (+!283 call!18646 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))

(declare-fun b!184786 () Bool)

(declare-fun res!87414 () Bool)

(assert (=> b!184786 (=> (not res!87414) (not e!121623))))

(assert (=> b!184786 (= res!87414 e!121630)))

(declare-fun res!87416 () Bool)

(assert (=> b!184786 (=> res!87416 e!121630)))

(declare-fun e!121627 () Bool)

(assert (=> b!184786 (= res!87416 (not e!121627))))

(declare-fun res!87412 () Bool)

(assert (=> b!184786 (=> (not res!87412) (not e!121627))))

(assert (=> b!184786 (= res!87412 (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun b!184787 () Bool)

(assert (=> b!184787 (= e!121628 e!121625)))

(declare-fun res!87410 () Bool)

(assert (=> b!184787 (= res!87410 call!18644)))

(assert (=> b!184787 (=> (not res!87410) (not e!121625))))

(declare-fun b!184788 () Bool)

(declare-fun lt!91404 () Unit!5576)

(assert (=> b!184788 (= e!121626 lt!91404)))

(declare-fun lt!91401 () ListLongMap!2351)

(declare-fun getCurrentListMapNoExtraKeys!196 (array!7847 array!7849 (_ BitVec 32) (_ BitVec 32) V!5411 V!5411 (_ BitVec 32) Int) ListLongMap!2351)

(assert (=> b!184788 (= lt!91401 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))

(declare-fun lt!91410 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91410 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91411 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91411 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91405 () Unit!5576)

(declare-fun addStillContains!139 (ListLongMap!2351 (_ BitVec 64) V!5411 (_ BitVec 64)) Unit!5576)

(assert (=> b!184788 (= lt!91405 (addStillContains!139 lt!91401 lt!91410 (zeroValue!3610 thiss!1248) lt!91411))))

(assert (=> b!184788 (contains!1283 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))) lt!91411)))

(declare-fun lt!91416 () Unit!5576)

(assert (=> b!184788 (= lt!91416 lt!91405)))

(declare-fun lt!91396 () ListLongMap!2351)

(assert (=> b!184788 (= lt!91396 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))

(declare-fun lt!91399 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91399 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91412 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91412 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91397 () Unit!5576)

(declare-fun addApplyDifferent!139 (ListLongMap!2351 (_ BitVec 64) V!5411 (_ BitVec 64)) Unit!5576)

(assert (=> b!184788 (= lt!91397 (addApplyDifferent!139 lt!91396 lt!91399 (minValue!3610 thiss!1248) lt!91412))))

(assert (=> b!184788 (= (apply!163 (+!283 lt!91396 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))) lt!91412) (apply!163 lt!91396 lt!91412))))

(declare-fun lt!91406 () Unit!5576)

(assert (=> b!184788 (= lt!91406 lt!91397)))

(declare-fun lt!91414 () ListLongMap!2351)

(assert (=> b!184788 (= lt!91414 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))

(declare-fun lt!91400 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91400 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91402 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91402 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91408 () Unit!5576)

(assert (=> b!184788 (= lt!91408 (addApplyDifferent!139 lt!91414 lt!91400 (zeroValue!3610 thiss!1248) lt!91402))))

(assert (=> b!184788 (= (apply!163 (+!283 lt!91414 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))) lt!91402) (apply!163 lt!91414 lt!91402))))

(declare-fun lt!91403 () Unit!5576)

(assert (=> b!184788 (= lt!91403 lt!91408)))

(declare-fun lt!91413 () ListLongMap!2351)

(assert (=> b!184788 (= lt!91413 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))

(declare-fun lt!91407 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91407 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91415 () (_ BitVec 64))

(assert (=> b!184788 (= lt!91415 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184788 (= lt!91404 (addApplyDifferent!139 lt!91413 lt!91407 (minValue!3610 thiss!1248) lt!91415))))

(assert (=> b!184788 (= (apply!163 (+!283 lt!91413 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))) lt!91415) (apply!163 lt!91413 lt!91415))))

(declare-fun b!184789 () Bool)

(assert (=> b!184789 (= e!121621 (= (apply!163 lt!91398 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!3610 thiss!1248)))))

(declare-fun b!184790 () Bool)

(declare-fun get!2129 (ValueCell!1818 V!5411) V!5411)

(declare-fun dynLambda!506 (Int (_ BitVec 64)) V!5411)

(assert (=> b!184790 (= e!121620 (= (apply!163 lt!91398 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)) (get!2129 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4023 (_values!3752 thiss!1248))))))

(assert (=> b!184790 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun bm!18644 () Bool)

(assert (=> bm!18644 (= call!18643 call!18648)))

(declare-fun bm!18645 () Bool)

(assert (=> bm!18645 (= call!18648 call!18647)))

(declare-fun bm!18646 () Bool)

(assert (=> bm!18646 (= call!18647 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))

(declare-fun b!184791 () Bool)

(assert (=> b!184791 (= e!121627 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184792 () Bool)

(assert (=> b!184792 (= e!121631 (not call!18645))))

(assert (= (and d!54991 c!33149) b!184785))

(assert (= (and d!54991 (not c!33149)) b!184780))

(assert (= (and b!184780 c!33148) b!184779))

(assert (= (and b!184780 (not c!33148)) b!184781))

(assert (= (and b!184781 c!33152) b!184776))

(assert (= (and b!184781 (not c!33152)) b!184772))

(assert (= (or b!184776 b!184772) bm!18644))

(assert (= (or b!184779 bm!18644) bm!18645))

(assert (= (or b!184779 b!184776) bm!18642))

(assert (= (or b!184785 bm!18645) bm!18646))

(assert (= (or b!184785 bm!18642) bm!18641))

(assert (= (and d!54991 res!87417) b!184784))

(assert (= (and d!54991 c!33151) b!184788))

(assert (= (and d!54991 (not c!33151)) b!184778))

(assert (= (and d!54991 res!87409) b!184786))

(assert (= (and b!184786 res!87412) b!184791))

(assert (= (and b!184786 (not res!87416)) b!184775))

(assert (= (and b!184775 res!87413) b!184790))

(assert (= (and b!184786 res!87414) b!184783))

(assert (= (and b!184783 c!33150) b!184787))

(assert (= (and b!184783 (not c!33150)) b!184774))

(assert (= (and b!184787 res!87410) b!184773))

(assert (= (or b!184787 b!184774) bm!18643))

(assert (= (and b!184783 res!87411) b!184777))

(assert (= (and b!184777 c!33153) b!184782))

(assert (= (and b!184777 (not c!33153)) b!184792))

(assert (= (and b!184782 res!87415) b!184789))

(assert (= (or b!184782 b!184792) bm!18640))

(declare-fun b_lambda!7231 () Bool)

(assert (=> (not b_lambda!7231) (not b!184790)))

(declare-fun t!7227 () Bool)

(declare-fun tb!2837 () Bool)

(assert (=> (and b!184691 (= (defaultEntry!3769 thiss!1248) (defaultEntry!3769 thiss!1248)) t!7227) tb!2837))

(declare-fun result!4789 () Bool)

(assert (=> tb!2837 (= result!4789 tp_is_empty!4323)))

(assert (=> b!184790 t!7227))

(declare-fun b_and!11145 () Bool)

(assert (= b_and!11141 (and (=> t!7227 result!4789) b_and!11145)))

(declare-fun m!212093 () Bool)

(assert (=> b!184773 m!212093))

(declare-fun m!212095 () Bool)

(assert (=> b!184784 m!212095))

(assert (=> b!184784 m!212095))

(declare-fun m!212097 () Bool)

(assert (=> b!184784 m!212097))

(declare-fun m!212099 () Bool)

(assert (=> b!184790 m!212099))

(assert (=> b!184790 m!212095))

(declare-fun m!212101 () Bool)

(assert (=> b!184790 m!212101))

(assert (=> b!184790 m!212099))

(declare-fun m!212103 () Bool)

(assert (=> b!184790 m!212103))

(assert (=> b!184790 m!212095))

(declare-fun m!212105 () Bool)

(assert (=> b!184790 m!212105))

(assert (=> b!184790 m!212101))

(assert (=> b!184775 m!212095))

(assert (=> b!184775 m!212095))

(declare-fun m!212107 () Bool)

(assert (=> b!184775 m!212107))

(declare-fun m!212109 () Bool)

(assert (=> bm!18646 m!212109))

(declare-fun m!212111 () Bool)

(assert (=> b!184789 m!212111))

(declare-fun m!212113 () Bool)

(assert (=> b!184785 m!212113))

(declare-fun m!212115 () Bool)

(assert (=> bm!18640 m!212115))

(declare-fun m!212117 () Bool)

(assert (=> bm!18643 m!212117))

(assert (=> d!54991 m!212057))

(declare-fun m!212119 () Bool)

(assert (=> bm!18641 m!212119))

(assert (=> b!184791 m!212095))

(assert (=> b!184791 m!212095))

(assert (=> b!184791 m!212097))

(declare-fun m!212121 () Bool)

(assert (=> b!184788 m!212121))

(declare-fun m!212123 () Bool)

(assert (=> b!184788 m!212123))

(declare-fun m!212125 () Bool)

(assert (=> b!184788 m!212125))

(assert (=> b!184788 m!212095))

(declare-fun m!212127 () Bool)

(assert (=> b!184788 m!212127))

(declare-fun m!212129 () Bool)

(assert (=> b!184788 m!212129))

(declare-fun m!212131 () Bool)

(assert (=> b!184788 m!212131))

(declare-fun m!212133 () Bool)

(assert (=> b!184788 m!212133))

(assert (=> b!184788 m!212125))

(declare-fun m!212135 () Bool)

(assert (=> b!184788 m!212135))

(declare-fun m!212137 () Bool)

(assert (=> b!184788 m!212137))

(declare-fun m!212139 () Bool)

(assert (=> b!184788 m!212139))

(declare-fun m!212141 () Bool)

(assert (=> b!184788 m!212141))

(assert (=> b!184788 m!212121))

(declare-fun m!212143 () Bool)

(assert (=> b!184788 m!212143))

(assert (=> b!184788 m!212109))

(declare-fun m!212145 () Bool)

(assert (=> b!184788 m!212145))

(assert (=> b!184788 m!212129))

(declare-fun m!212147 () Bool)

(assert (=> b!184788 m!212147))

(assert (=> b!184788 m!212139))

(declare-fun m!212149 () Bool)

(assert (=> b!184788 m!212149))

(assert (=> b!184685 d!54991))

(declare-fun b!184807 () Bool)

(declare-fun e!121640 () SeekEntryResult!628)

(assert (=> b!184807 (= e!121640 Undefined!628)))

(declare-fun b!184808 () Bool)

(declare-fun e!121638 () SeekEntryResult!628)

(assert (=> b!184808 (= e!121640 e!121638)))

(declare-fun lt!91424 () (_ BitVec 64))

(declare-fun lt!91426 () SeekEntryResult!628)

(assert (=> b!184808 (= lt!91424 (select (arr!3707 (_keys!5700 thiss!1248)) (index!4684 lt!91426)))))

(declare-fun c!33160 () Bool)

(assert (=> b!184808 (= c!33160 (= lt!91424 key!828))))

(declare-fun b!184809 () Bool)

(assert (=> b!184809 (= e!121638 (Found!628 (index!4684 lt!91426)))))

(declare-fun b!184810 () Bool)

(declare-fun e!121639 () SeekEntryResult!628)

(assert (=> b!184810 (= e!121639 (MissingZero!628 (index!4684 lt!91426)))))

(declare-fun b!184811 () Bool)

(declare-fun c!33161 () Bool)

(assert (=> b!184811 (= c!33161 (= lt!91424 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184811 (= e!121638 e!121639)))

(declare-fun b!184812 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7847 (_ BitVec 32)) SeekEntryResult!628)

(assert (=> b!184812 (= e!121639 (seekKeyOrZeroReturnVacant!0 (x!20078 lt!91426) (index!4684 lt!91426) (index!4684 lt!91426) key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(declare-fun d!54993 () Bool)

(declare-fun lt!91425 () SeekEntryResult!628)

(assert (=> d!54993 (and (or ((_ is Undefined!628) lt!91425) (not ((_ is Found!628) lt!91425)) (and (bvsge (index!4683 lt!91425) #b00000000000000000000000000000000) (bvslt (index!4683 lt!91425) (size!4022 (_keys!5700 thiss!1248))))) (or ((_ is Undefined!628) lt!91425) ((_ is Found!628) lt!91425) (not ((_ is MissingZero!628) lt!91425)) (and (bvsge (index!4682 lt!91425) #b00000000000000000000000000000000) (bvslt (index!4682 lt!91425) (size!4022 (_keys!5700 thiss!1248))))) (or ((_ is Undefined!628) lt!91425) ((_ is Found!628) lt!91425) ((_ is MissingZero!628) lt!91425) (not ((_ is MissingVacant!628) lt!91425)) (and (bvsge (index!4685 lt!91425) #b00000000000000000000000000000000) (bvslt (index!4685 lt!91425) (size!4022 (_keys!5700 thiss!1248))))) (or ((_ is Undefined!628) lt!91425) (ite ((_ is Found!628) lt!91425) (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4683 lt!91425)) key!828) (ite ((_ is MissingZero!628) lt!91425) (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4682 lt!91425)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!628) lt!91425) (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4685 lt!91425)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!54993 (= lt!91425 e!121640)))

(declare-fun c!33162 () Bool)

(assert (=> d!54993 (= c!33162 (and ((_ is Intermediate!628) lt!91426) (undefined!1440 lt!91426)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!7847 (_ BitVec 32)) SeekEntryResult!628)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!54993 (= lt!91426 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8859 thiss!1248)) key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(assert (=> d!54993 (validMask!0 (mask!8859 thiss!1248))))

(assert (=> d!54993 (= (seekEntryOrOpen!0 key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)) lt!91425)))

(assert (= (and d!54993 c!33162) b!184807))

(assert (= (and d!54993 (not c!33162)) b!184808))

(assert (= (and b!184808 c!33160) b!184809))

(assert (= (and b!184808 (not c!33160)) b!184811))

(assert (= (and b!184811 c!33161) b!184810))

(assert (= (and b!184811 (not c!33161)) b!184812))

(declare-fun m!212151 () Bool)

(assert (=> b!184808 m!212151))

(declare-fun m!212153 () Bool)

(assert (=> b!184812 m!212153))

(assert (=> d!54993 m!212057))

(declare-fun m!212155 () Bool)

(assert (=> d!54993 m!212155))

(declare-fun m!212157 () Bool)

(assert (=> d!54993 m!212157))

(declare-fun m!212159 () Bool)

(assert (=> d!54993 m!212159))

(assert (=> d!54993 m!212155))

(declare-fun m!212161 () Bool)

(assert (=> d!54993 m!212161))

(declare-fun m!212163 () Bool)

(assert (=> d!54993 m!212163))

(assert (=> b!184690 d!54993))

(declare-fun d!54995 () Bool)

(assert (=> d!54995 (= (validMask!0 (mask!8859 thiss!1248)) (and (or (= (mask!8859 thiss!1248) #b00000000000000000000000000000111) (= (mask!8859 thiss!1248) #b00000000000000000000000000001111) (= (mask!8859 thiss!1248) #b00000000000000000000000000011111) (= (mask!8859 thiss!1248) #b00000000000000000000000000111111) (= (mask!8859 thiss!1248) #b00000000000000000000000001111111) (= (mask!8859 thiss!1248) #b00000000000000000000000011111111) (= (mask!8859 thiss!1248) #b00000000000000000000000111111111) (= (mask!8859 thiss!1248) #b00000000000000000000001111111111) (= (mask!8859 thiss!1248) #b00000000000000000000011111111111) (= (mask!8859 thiss!1248) #b00000000000000000000111111111111) (= (mask!8859 thiss!1248) #b00000000000000000001111111111111) (= (mask!8859 thiss!1248) #b00000000000000000011111111111111) (= (mask!8859 thiss!1248) #b00000000000000000111111111111111) (= (mask!8859 thiss!1248) #b00000000000000001111111111111111) (= (mask!8859 thiss!1248) #b00000000000000011111111111111111) (= (mask!8859 thiss!1248) #b00000000000000111111111111111111) (= (mask!8859 thiss!1248) #b00000000000001111111111111111111) (= (mask!8859 thiss!1248) #b00000000000011111111111111111111) (= (mask!8859 thiss!1248) #b00000000000111111111111111111111) (= (mask!8859 thiss!1248) #b00000000001111111111111111111111) (= (mask!8859 thiss!1248) #b00000000011111111111111111111111) (= (mask!8859 thiss!1248) #b00000000111111111111111111111111) (= (mask!8859 thiss!1248) #b00000001111111111111111111111111) (= (mask!8859 thiss!1248) #b00000011111111111111111111111111) (= (mask!8859 thiss!1248) #b00000111111111111111111111111111) (= (mask!8859 thiss!1248) #b00001111111111111111111111111111) (= (mask!8859 thiss!1248) #b00011111111111111111111111111111) (= (mask!8859 thiss!1248) #b00111111111111111111111111111111)) (bvsle (mask!8859 thiss!1248) #b00111111111111111111111111111111)))))

(assert (=> b!184687 d!54995))

(declare-fun d!54997 () Bool)

(assert (=> d!54997 (= (array_inv!2397 (_keys!5700 thiss!1248)) (bvsge (size!4022 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184691 d!54997))

(declare-fun d!54999 () Bool)

(assert (=> d!54999 (= (array_inv!2398 (_values!3752 thiss!1248)) (bvsge (size!4023 (_values!3752 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184691 d!54999))

(declare-fun d!55001 () Bool)

(declare-fun res!87424 () Bool)

(declare-fun e!121643 () Bool)

(assert (=> d!55001 (=> (not res!87424) (not e!121643))))

(declare-fun simpleValid!179 (LongMapFixedSize!2544) Bool)

(assert (=> d!55001 (= res!87424 (simpleValid!179 thiss!1248))))

(assert (=> d!55001 (= (valid!1050 thiss!1248) e!121643)))

(declare-fun b!184819 () Bool)

(declare-fun res!87425 () Bool)

(assert (=> b!184819 (=> (not res!87425) (not e!121643))))

(declare-fun arrayCountValidKeys!0 (array!7847 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184819 (= res!87425 (= (arrayCountValidKeys!0 (_keys!5700 thiss!1248) #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))) (_size!1321 thiss!1248)))))

(declare-fun b!184820 () Bool)

(declare-fun res!87426 () Bool)

(assert (=> b!184820 (=> (not res!87426) (not e!121643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!7847 (_ BitVec 32)) Bool)

(assert (=> b!184820 (= res!87426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(declare-fun b!184821 () Bool)

(declare-datatypes ((List!2350 0))(
  ( (Nil!2347) (Cons!2346 (h!2978 (_ BitVec 64)) (t!7228 List!2350)) )
))
(declare-fun arrayNoDuplicates!0 (array!7847 (_ BitVec 32) List!2350) Bool)

(assert (=> b!184821 (= e!121643 (arrayNoDuplicates!0 (_keys!5700 thiss!1248) #b00000000000000000000000000000000 Nil!2347))))

(assert (= (and d!55001 res!87424) b!184819))

(assert (= (and b!184819 res!87425) b!184820))

(assert (= (and b!184820 res!87426) b!184821))

(declare-fun m!212165 () Bool)

(assert (=> d!55001 m!212165))

(declare-fun m!212167 () Bool)

(assert (=> b!184819 m!212167))

(declare-fun m!212169 () Bool)

(assert (=> b!184820 m!212169))

(declare-fun m!212171 () Bool)

(assert (=> b!184821 m!212171))

(assert (=> start!18672 d!55001))

(declare-fun b!184829 () Bool)

(declare-fun e!121649 () Bool)

(assert (=> b!184829 (= e!121649 tp_is_empty!4323)))

(declare-fun condMapEmpty!7439 () Bool)

(declare-fun mapDefault!7439 () ValueCell!1818)

(assert (=> mapNonEmpty!7433 (= condMapEmpty!7439 (= mapRest!7433 ((as const (Array (_ BitVec 32) ValueCell!1818)) mapDefault!7439)))))

(declare-fun mapRes!7439 () Bool)

(assert (=> mapNonEmpty!7433 (= tp!16438 (and e!121649 mapRes!7439))))

(declare-fun b!184828 () Bool)

(declare-fun e!121648 () Bool)

(assert (=> b!184828 (= e!121648 tp_is_empty!4323)))

(declare-fun mapIsEmpty!7439 () Bool)

(assert (=> mapIsEmpty!7439 mapRes!7439))

(declare-fun mapNonEmpty!7439 () Bool)

(declare-fun tp!16448 () Bool)

(assert (=> mapNonEmpty!7439 (= mapRes!7439 (and tp!16448 e!121648))))

(declare-fun mapRest!7439 () (Array (_ BitVec 32) ValueCell!1818))

(declare-fun mapKey!7439 () (_ BitVec 32))

(declare-fun mapValue!7439 () ValueCell!1818)

(assert (=> mapNonEmpty!7439 (= mapRest!7433 (store mapRest!7439 mapKey!7439 mapValue!7439))))

(assert (= (and mapNonEmpty!7433 condMapEmpty!7439) mapIsEmpty!7439))

(assert (= (and mapNonEmpty!7433 (not condMapEmpty!7439)) mapNonEmpty!7439))

(assert (= (and mapNonEmpty!7439 ((_ is ValueCellFull!1818) mapValue!7439)) b!184828))

(assert (= (and mapNonEmpty!7433 ((_ is ValueCellFull!1818) mapDefault!7439)) b!184829))

(declare-fun m!212173 () Bool)

(assert (=> mapNonEmpty!7439 m!212173))

(declare-fun b_lambda!7233 () Bool)

(assert (= b_lambda!7231 (or (and b!184691 b_free!4551) b_lambda!7233)))

(check-sat (not b!184788) (not b!184729) (not b_next!4551) (not b!184789) (not b!184727) (not d!54989) (not b!184773) (not bm!18640) (not b!184821) (not b!184819) (not b!184791) (not b!184790) (not b!184820) (not mapNonEmpty!7439) (not b!184785) (not d!55001) (not d!54993) b_and!11145 (not b!184784) (not bm!18643) (not b_lambda!7233) (not b!184812) (not b!184775) (not d!54991) tp_is_empty!4323 (not bm!18646) (not bm!18641))
(check-sat b_and!11145 (not b_next!4551))
(get-model)

(declare-fun d!55003 () Bool)

(declare-fun get!2130 (Option!226) V!5411)

(assert (=> d!55003 (= (apply!163 lt!91398 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2130 (getValueByKey!220 (toList!1191 lt!91398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7499 () Bool)

(assert (= bs!7499 d!55003))

(declare-fun m!212175 () Bool)

(assert (=> bs!7499 m!212175))

(assert (=> bs!7499 m!212175))

(declare-fun m!212177 () Bool)

(assert (=> bs!7499 m!212177))

(assert (=> b!184773 d!55003))

(declare-fun d!55005 () Bool)

(declare-fun e!121652 () Bool)

(assert (=> d!55005 e!121652))

(declare-fun res!87432 () Bool)

(assert (=> d!55005 (=> (not res!87432) (not e!121652))))

(declare-fun lt!91436 () ListLongMap!2351)

(assert (=> d!55005 (= res!87432 (contains!1283 lt!91436 (_1!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))))

(declare-fun lt!91437 () List!2348)

(assert (=> d!55005 (= lt!91436 (ListLongMap!2352 lt!91437))))

(declare-fun lt!91438 () Unit!5576)

(declare-fun lt!91435 () Unit!5576)

(assert (=> d!55005 (= lt!91438 lt!91435)))

(assert (=> d!55005 (= (getValueByKey!220 lt!91437 (_1!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))) (Some!225 (_2!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!116 (List!2348 (_ BitVec 64) V!5411) Unit!5576)

(assert (=> d!55005 (= lt!91435 (lemmaContainsTupThenGetReturnValue!116 lt!91437 (_1!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))) (_2!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))))

(declare-fun insertStrictlySorted!119 (List!2348 (_ BitVec 64) V!5411) List!2348)

(assert (=> d!55005 (= lt!91437 (insertStrictlySorted!119 (toList!1191 (ite c!33149 call!18647 (ite c!33148 call!18648 call!18643))) (_1!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))) (_2!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))))

(assert (=> d!55005 (= (+!283 (ite c!33149 call!18647 (ite c!33148 call!18648 call!18643)) (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))) lt!91436)))

(declare-fun b!184834 () Bool)

(declare-fun res!87431 () Bool)

(assert (=> b!184834 (=> (not res!87431) (not e!121652))))

(assert (=> b!184834 (= res!87431 (= (getValueByKey!220 (toList!1191 lt!91436) (_1!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))) (Some!225 (_2!1728 (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))))

(declare-fun b!184835 () Bool)

(declare-fun contains!1285 (List!2348 tuple2!3434) Bool)

(assert (=> b!184835 (= e!121652 (contains!1285 (toList!1191 lt!91436) (ite (or c!33149 c!33148) (tuple2!3435 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!3610 thiss!1248)) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))

(assert (= (and d!55005 res!87432) b!184834))

(assert (= (and b!184834 res!87431) b!184835))

(declare-fun m!212179 () Bool)

(assert (=> d!55005 m!212179))

(declare-fun m!212181 () Bool)

(assert (=> d!55005 m!212181))

(declare-fun m!212183 () Bool)

(assert (=> d!55005 m!212183))

(declare-fun m!212185 () Bool)

(assert (=> d!55005 m!212185))

(declare-fun m!212187 () Bool)

(assert (=> b!184834 m!212187))

(declare-fun m!212189 () Bool)

(assert (=> b!184835 m!212189))

(assert (=> bm!18641 d!55005))

(declare-fun d!55007 () Bool)

(declare-fun res!87437 () Bool)

(declare-fun e!121657 () Bool)

(assert (=> d!55007 (=> res!87437 e!121657)))

(assert (=> d!55007 (= res!87437 (and ((_ is Cons!2344) (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))) (= (_1!1728 (h!2976 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))))) key!828)))))

(assert (=> d!55007 (= (containsKey!224 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828) e!121657)))

(declare-fun b!184840 () Bool)

(declare-fun e!121658 () Bool)

(assert (=> b!184840 (= e!121657 e!121658)))

(declare-fun res!87438 () Bool)

(assert (=> b!184840 (=> (not res!87438) (not e!121658))))

(assert (=> b!184840 (= res!87438 (and (or (not ((_ is Cons!2344) (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))))) (bvsle (_1!1728 (h!2976 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))))) key!828)) ((_ is Cons!2344) (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))) (bvslt (_1!1728 (h!2976 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))))) key!828)))))

(declare-fun b!184841 () Bool)

(assert (=> b!184841 (= e!121658 (containsKey!224 (t!7224 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))) key!828))))

(assert (= (and d!55007 (not res!87437)) b!184840))

(assert (= (and b!184840 res!87438) b!184841))

(declare-fun m!212191 () Bool)

(assert (=> b!184841 m!212191))

(assert (=> d!54989 d!55007))

(declare-fun b!184866 () Bool)

(declare-fun e!121675 () Bool)

(declare-fun e!121674 () Bool)

(assert (=> b!184866 (= e!121675 e!121674)))

(assert (=> b!184866 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun res!87449 () Bool)

(declare-fun lt!91453 () ListLongMap!2351)

(assert (=> b!184866 (= res!87449 (contains!1283 lt!91453 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184866 (=> (not res!87449) (not e!121674))))

(declare-fun bm!18649 () Bool)

(declare-fun call!18652 () ListLongMap!2351)

(assert (=> bm!18649 (= call!18652 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3769 thiss!1248)))))

(declare-fun b!184867 () Bool)

(declare-fun e!121678 () Bool)

(assert (=> b!184867 (= e!121675 e!121678)))

(declare-fun c!33174 () Bool)

(assert (=> b!184867 (= c!33174 (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun b!184868 () Bool)

(declare-fun e!121676 () Bool)

(assert (=> b!184868 (= e!121676 e!121675)))

(declare-fun c!33172 () Bool)

(declare-fun e!121679 () Bool)

(assert (=> b!184868 (= c!33172 e!121679)))

(declare-fun res!87447 () Bool)

(assert (=> b!184868 (=> (not res!87447) (not e!121679))))

(assert (=> b!184868 (= res!87447 (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun d!55009 () Bool)

(assert (=> d!55009 e!121676))

(declare-fun res!87448 () Bool)

(assert (=> d!55009 (=> (not res!87448) (not e!121676))))

(assert (=> d!55009 (= res!87448 (not (contains!1283 lt!91453 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!121677 () ListLongMap!2351)

(assert (=> d!55009 (= lt!91453 e!121677)))

(declare-fun c!33171 () Bool)

(assert (=> d!55009 (= c!33171 (bvsge #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> d!55009 (validMask!0 (mask!8859 thiss!1248))))

(assert (=> d!55009 (= (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)) lt!91453)))

(declare-fun b!184869 () Bool)

(assert (=> b!184869 (= e!121677 (ListLongMap!2352 Nil!2345))))

(declare-fun b!184870 () Bool)

(declare-fun e!121673 () ListLongMap!2351)

(assert (=> b!184870 (= e!121673 call!18652)))

(declare-fun b!184871 () Bool)

(assert (=> b!184871 (= e!121677 e!121673)))

(declare-fun c!33173 () Bool)

(assert (=> b!184871 (= c!33173 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184872 () Bool)

(assert (=> b!184872 (= e!121679 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184872 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!184873 () Bool)

(declare-fun lt!91457 () Unit!5576)

(declare-fun lt!91459 () Unit!5576)

(assert (=> b!184873 (= lt!91457 lt!91459)))

(declare-fun lt!91455 () ListLongMap!2351)

(declare-fun lt!91454 () (_ BitVec 64))

(declare-fun lt!91458 () V!5411)

(declare-fun lt!91456 () (_ BitVec 64))

(assert (=> b!184873 (not (contains!1283 (+!283 lt!91455 (tuple2!3435 lt!91456 lt!91458)) lt!91454))))

(declare-fun addStillNotContains!88 (ListLongMap!2351 (_ BitVec 64) V!5411 (_ BitVec 64)) Unit!5576)

(assert (=> b!184873 (= lt!91459 (addStillNotContains!88 lt!91455 lt!91456 lt!91458 lt!91454))))

(assert (=> b!184873 (= lt!91454 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!184873 (= lt!91458 (get!2129 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!184873 (= lt!91456 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(assert (=> b!184873 (= lt!91455 call!18652)))

(assert (=> b!184873 (= e!121673 (+!283 call!18652 (tuple2!3435 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000) (get!2129 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!184874 () Bool)

(assert (=> b!184874 (= e!121678 (= lt!91453 (getCurrentListMapNoExtraKeys!196 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!3769 thiss!1248))))))

(declare-fun b!184875 () Bool)

(declare-fun res!87450 () Bool)

(assert (=> b!184875 (=> (not res!87450) (not e!121676))))

(assert (=> b!184875 (= res!87450 (not (contains!1283 lt!91453 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184876 () Bool)

(assert (=> b!184876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> b!184876 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!4023 (_values!3752 thiss!1248))))))

(assert (=> b!184876 (= e!121674 (= (apply!163 lt!91453 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)) (get!2129 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!184877 () Bool)

(declare-fun isEmpty!469 (ListLongMap!2351) Bool)

(assert (=> b!184877 (= e!121678 (isEmpty!469 lt!91453))))

(assert (= (and d!55009 c!33171) b!184869))

(assert (= (and d!55009 (not c!33171)) b!184871))

(assert (= (and b!184871 c!33173) b!184873))

(assert (= (and b!184871 (not c!33173)) b!184870))

(assert (= (or b!184873 b!184870) bm!18649))

(assert (= (and d!55009 res!87448) b!184875))

(assert (= (and b!184875 res!87450) b!184868))

(assert (= (and b!184868 res!87447) b!184872))

(assert (= (and b!184868 c!33172) b!184866))

(assert (= (and b!184868 (not c!33172)) b!184867))

(assert (= (and b!184866 res!87449) b!184876))

(assert (= (and b!184867 c!33174) b!184874))

(assert (= (and b!184867 (not c!33174)) b!184877))

(declare-fun b_lambda!7235 () Bool)

(assert (=> (not b_lambda!7235) (not b!184873)))

(assert (=> b!184873 t!7227))

(declare-fun b_and!11147 () Bool)

(assert (= b_and!11145 (and (=> t!7227 result!4789) b_and!11147)))

(declare-fun b_lambda!7237 () Bool)

(assert (=> (not b_lambda!7237) (not b!184876)))

(assert (=> b!184876 t!7227))

(declare-fun b_and!11149 () Bool)

(assert (= b_and!11147 (and (=> t!7227 result!4789) b_and!11149)))

(assert (=> b!184872 m!212095))

(assert (=> b!184872 m!212095))

(assert (=> b!184872 m!212097))

(declare-fun m!212193 () Bool)

(assert (=> b!184874 m!212193))

(declare-fun m!212195 () Bool)

(assert (=> b!184873 m!212195))

(declare-fun m!212197 () Bool)

(assert (=> b!184873 m!212197))

(declare-fun m!212199 () Bool)

(assert (=> b!184873 m!212199))

(assert (=> b!184873 m!212101))

(assert (=> b!184873 m!212099))

(assert (=> b!184873 m!212103))

(assert (=> b!184873 m!212197))

(assert (=> b!184873 m!212099))

(assert (=> b!184873 m!212101))

(assert (=> b!184873 m!212095))

(declare-fun m!212201 () Bool)

(assert (=> b!184873 m!212201))

(assert (=> b!184866 m!212095))

(assert (=> b!184866 m!212095))

(declare-fun m!212203 () Bool)

(assert (=> b!184866 m!212203))

(assert (=> bm!18649 m!212193))

(declare-fun m!212205 () Bool)

(assert (=> d!55009 m!212205))

(assert (=> d!55009 m!212057))

(assert (=> b!184876 m!212101))

(assert (=> b!184876 m!212099))

(assert (=> b!184876 m!212103))

(assert (=> b!184876 m!212095))

(declare-fun m!212207 () Bool)

(assert (=> b!184876 m!212207))

(assert (=> b!184876 m!212099))

(assert (=> b!184876 m!212101))

(assert (=> b!184876 m!212095))

(assert (=> b!184871 m!212095))

(assert (=> b!184871 m!212095))

(assert (=> b!184871 m!212097))

(declare-fun m!212209 () Bool)

(assert (=> b!184875 m!212209))

(declare-fun m!212211 () Bool)

(assert (=> b!184877 m!212211))

(assert (=> bm!18646 d!55009))

(declare-fun d!55011 () Bool)

(assert (=> d!55011 (= (apply!163 (+!283 lt!91396 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))) lt!91412) (get!2130 (getValueByKey!220 (toList!1191 (+!283 lt!91396 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))) lt!91412)))))

(declare-fun bs!7500 () Bool)

(assert (= bs!7500 d!55011))

(declare-fun m!212213 () Bool)

(assert (=> bs!7500 m!212213))

(assert (=> bs!7500 m!212213))

(declare-fun m!212215 () Bool)

(assert (=> bs!7500 m!212215))

(assert (=> b!184788 d!55011))

(declare-fun d!55013 () Bool)

(assert (=> d!55013 (= (apply!163 (+!283 lt!91414 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))) lt!91402) (get!2130 (getValueByKey!220 (toList!1191 (+!283 lt!91414 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))) lt!91402)))))

(declare-fun bs!7501 () Bool)

(assert (= bs!7501 d!55013))

(declare-fun m!212217 () Bool)

(assert (=> bs!7501 m!212217))

(assert (=> bs!7501 m!212217))

(declare-fun m!212219 () Bool)

(assert (=> bs!7501 m!212219))

(assert (=> b!184788 d!55013))

(declare-fun d!55015 () Bool)

(declare-fun e!121680 () Bool)

(assert (=> d!55015 e!121680))

(declare-fun res!87452 () Bool)

(assert (=> d!55015 (=> (not res!87452) (not e!121680))))

(declare-fun lt!91461 () ListLongMap!2351)

(assert (=> d!55015 (= res!87452 (contains!1283 lt!91461 (_1!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))))))

(declare-fun lt!91462 () List!2348)

(assert (=> d!55015 (= lt!91461 (ListLongMap!2352 lt!91462))))

(declare-fun lt!91463 () Unit!5576)

(declare-fun lt!91460 () Unit!5576)

(assert (=> d!55015 (= lt!91463 lt!91460)))

(assert (=> d!55015 (= (getValueByKey!220 lt!91462 (_1!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))))))

(assert (=> d!55015 (= lt!91460 (lemmaContainsTupThenGetReturnValue!116 lt!91462 (_1!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))))))

(assert (=> d!55015 (= lt!91462 (insertStrictlySorted!119 (toList!1191 lt!91401) (_1!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))))))

(assert (=> d!55015 (= (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))) lt!91461)))

(declare-fun b!184878 () Bool)

(declare-fun res!87451 () Bool)

(assert (=> b!184878 (=> (not res!87451) (not e!121680))))

(assert (=> b!184878 (= res!87451 (= (getValueByKey!220 (toList!1191 lt!91461) (_1!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))))))))

(declare-fun b!184879 () Bool)

(assert (=> b!184879 (= e!121680 (contains!1285 (toList!1191 lt!91461) (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))))))

(assert (= (and d!55015 res!87452) b!184878))

(assert (= (and b!184878 res!87451) b!184879))

(declare-fun m!212221 () Bool)

(assert (=> d!55015 m!212221))

(declare-fun m!212223 () Bool)

(assert (=> d!55015 m!212223))

(declare-fun m!212225 () Bool)

(assert (=> d!55015 m!212225))

(declare-fun m!212227 () Bool)

(assert (=> d!55015 m!212227))

(declare-fun m!212229 () Bool)

(assert (=> b!184878 m!212229))

(declare-fun m!212231 () Bool)

(assert (=> b!184879 m!212231))

(assert (=> b!184788 d!55015))

(declare-fun d!55017 () Bool)

(assert (=> d!55017 (= (apply!163 lt!91414 lt!91402) (get!2130 (getValueByKey!220 (toList!1191 lt!91414) lt!91402)))))

(declare-fun bs!7502 () Bool)

(assert (= bs!7502 d!55017))

(declare-fun m!212233 () Bool)

(assert (=> bs!7502 m!212233))

(assert (=> bs!7502 m!212233))

(declare-fun m!212235 () Bool)

(assert (=> bs!7502 m!212235))

(assert (=> b!184788 d!55017))

(declare-fun d!55019 () Bool)

(assert (=> d!55019 (contains!1283 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))) lt!91411)))

(declare-fun lt!91466 () Unit!5576)

(declare-fun choose!979 (ListLongMap!2351 (_ BitVec 64) V!5411 (_ BitVec 64)) Unit!5576)

(assert (=> d!55019 (= lt!91466 (choose!979 lt!91401 lt!91410 (zeroValue!3610 thiss!1248) lt!91411))))

(assert (=> d!55019 (contains!1283 lt!91401 lt!91411)))

(assert (=> d!55019 (= (addStillContains!139 lt!91401 lt!91410 (zeroValue!3610 thiss!1248) lt!91411) lt!91466)))

(declare-fun bs!7503 () Bool)

(assert (= bs!7503 d!55019))

(assert (=> bs!7503 m!212139))

(assert (=> bs!7503 m!212139))

(assert (=> bs!7503 m!212149))

(declare-fun m!212237 () Bool)

(assert (=> bs!7503 m!212237))

(declare-fun m!212239 () Bool)

(assert (=> bs!7503 m!212239))

(assert (=> b!184788 d!55019))

(declare-fun d!55021 () Bool)

(assert (=> d!55021 (= (apply!163 (+!283 lt!91414 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))) lt!91402) (apply!163 lt!91414 lt!91402))))

(declare-fun lt!91469 () Unit!5576)

(declare-fun choose!980 (ListLongMap!2351 (_ BitVec 64) V!5411 (_ BitVec 64)) Unit!5576)

(assert (=> d!55021 (= lt!91469 (choose!980 lt!91414 lt!91400 (zeroValue!3610 thiss!1248) lt!91402))))

(declare-fun e!121683 () Bool)

(assert (=> d!55021 e!121683))

(declare-fun res!87455 () Bool)

(assert (=> d!55021 (=> (not res!87455) (not e!121683))))

(assert (=> d!55021 (= res!87455 (contains!1283 lt!91414 lt!91402))))

(assert (=> d!55021 (= (addApplyDifferent!139 lt!91414 lt!91400 (zeroValue!3610 thiss!1248) lt!91402) lt!91469)))

(declare-fun b!184884 () Bool)

(assert (=> b!184884 (= e!121683 (not (= lt!91402 lt!91400)))))

(assert (= (and d!55021 res!87455) b!184884))

(assert (=> d!55021 m!212125))

(assert (=> d!55021 m!212135))

(assert (=> d!55021 m!212125))

(declare-fun m!212241 () Bool)

(assert (=> d!55021 m!212241))

(assert (=> d!55021 m!212133))

(declare-fun m!212243 () Bool)

(assert (=> d!55021 m!212243))

(assert (=> b!184788 d!55021))

(declare-fun d!55023 () Bool)

(assert (=> d!55023 (= (apply!163 lt!91413 lt!91415) (get!2130 (getValueByKey!220 (toList!1191 lt!91413) lt!91415)))))

(declare-fun bs!7504 () Bool)

(assert (= bs!7504 d!55023))

(declare-fun m!212245 () Bool)

(assert (=> bs!7504 m!212245))

(assert (=> bs!7504 m!212245))

(declare-fun m!212247 () Bool)

(assert (=> bs!7504 m!212247))

(assert (=> b!184788 d!55023))

(declare-fun d!55025 () Bool)

(declare-fun e!121684 () Bool)

(assert (=> d!55025 e!121684))

(declare-fun res!87456 () Bool)

(assert (=> d!55025 (=> res!87456 e!121684)))

(declare-fun lt!91471 () Bool)

(assert (=> d!55025 (= res!87456 (not lt!91471))))

(declare-fun lt!91472 () Bool)

(assert (=> d!55025 (= lt!91471 lt!91472)))

(declare-fun lt!91470 () Unit!5576)

(declare-fun e!121685 () Unit!5576)

(assert (=> d!55025 (= lt!91470 e!121685)))

(declare-fun c!33175 () Bool)

(assert (=> d!55025 (= c!33175 lt!91472)))

(assert (=> d!55025 (= lt!91472 (containsKey!224 (toList!1191 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))) lt!91411))))

(assert (=> d!55025 (= (contains!1283 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248))) lt!91411) lt!91471)))

(declare-fun b!184885 () Bool)

(declare-fun lt!91473 () Unit!5576)

(assert (=> b!184885 (= e!121685 lt!91473)))

(assert (=> b!184885 (= lt!91473 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1191 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))) lt!91411))))

(assert (=> b!184885 (isDefined!173 (getValueByKey!220 (toList!1191 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))) lt!91411))))

(declare-fun b!184886 () Bool)

(declare-fun Unit!5580 () Unit!5576)

(assert (=> b!184886 (= e!121685 Unit!5580)))

(declare-fun b!184887 () Bool)

(assert (=> b!184887 (= e!121684 (isDefined!173 (getValueByKey!220 (toList!1191 (+!283 lt!91401 (tuple2!3435 lt!91410 (zeroValue!3610 thiss!1248)))) lt!91411)))))

(assert (= (and d!55025 c!33175) b!184885))

(assert (= (and d!55025 (not c!33175)) b!184886))

(assert (= (and d!55025 (not res!87456)) b!184887))

(declare-fun m!212249 () Bool)

(assert (=> d!55025 m!212249))

(declare-fun m!212251 () Bool)

(assert (=> b!184885 m!212251))

(declare-fun m!212253 () Bool)

(assert (=> b!184885 m!212253))

(assert (=> b!184885 m!212253))

(declare-fun m!212255 () Bool)

(assert (=> b!184885 m!212255))

(assert (=> b!184887 m!212253))

(assert (=> b!184887 m!212253))

(assert (=> b!184887 m!212255))

(assert (=> b!184788 d!55025))

(declare-fun d!55027 () Bool)

(assert (=> d!55027 (= (apply!163 (+!283 lt!91413 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))) lt!91415) (get!2130 (getValueByKey!220 (toList!1191 (+!283 lt!91413 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))) lt!91415)))))

(declare-fun bs!7505 () Bool)

(assert (= bs!7505 d!55027))

(declare-fun m!212257 () Bool)

(assert (=> bs!7505 m!212257))

(assert (=> bs!7505 m!212257))

(declare-fun m!212259 () Bool)

(assert (=> bs!7505 m!212259))

(assert (=> b!184788 d!55027))

(declare-fun d!55029 () Bool)

(assert (=> d!55029 (= (apply!163 (+!283 lt!91413 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))) lt!91415) (apply!163 lt!91413 lt!91415))))

(declare-fun lt!91474 () Unit!5576)

(assert (=> d!55029 (= lt!91474 (choose!980 lt!91413 lt!91407 (minValue!3610 thiss!1248) lt!91415))))

(declare-fun e!121686 () Bool)

(assert (=> d!55029 e!121686))

(declare-fun res!87457 () Bool)

(assert (=> d!55029 (=> (not res!87457) (not e!121686))))

(assert (=> d!55029 (= res!87457 (contains!1283 lt!91413 lt!91415))))

(assert (=> d!55029 (= (addApplyDifferent!139 lt!91413 lt!91407 (minValue!3610 thiss!1248) lt!91415) lt!91474)))

(declare-fun b!184888 () Bool)

(assert (=> b!184888 (= e!121686 (not (= lt!91415 lt!91407)))))

(assert (= (and d!55029 res!87457) b!184888))

(assert (=> d!55029 m!212129))

(assert (=> d!55029 m!212131))

(assert (=> d!55029 m!212129))

(declare-fun m!212261 () Bool)

(assert (=> d!55029 m!212261))

(assert (=> d!55029 m!212145))

(declare-fun m!212263 () Bool)

(assert (=> d!55029 m!212263))

(assert (=> b!184788 d!55029))

(assert (=> b!184788 d!55009))

(declare-fun d!55031 () Bool)

(assert (=> d!55031 (= (apply!163 lt!91396 lt!91412) (get!2130 (getValueByKey!220 (toList!1191 lt!91396) lt!91412)))))

(declare-fun bs!7506 () Bool)

(assert (= bs!7506 d!55031))

(declare-fun m!212265 () Bool)

(assert (=> bs!7506 m!212265))

(assert (=> bs!7506 m!212265))

(declare-fun m!212267 () Bool)

(assert (=> bs!7506 m!212267))

(assert (=> b!184788 d!55031))

(declare-fun d!55033 () Bool)

(declare-fun e!121687 () Bool)

(assert (=> d!55033 e!121687))

(declare-fun res!87459 () Bool)

(assert (=> d!55033 (=> (not res!87459) (not e!121687))))

(declare-fun lt!91476 () ListLongMap!2351)

(assert (=> d!55033 (= res!87459 (contains!1283 lt!91476 (_1!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))))))

(declare-fun lt!91477 () List!2348)

(assert (=> d!55033 (= lt!91476 (ListLongMap!2352 lt!91477))))

(declare-fun lt!91478 () Unit!5576)

(declare-fun lt!91475 () Unit!5576)

(assert (=> d!55033 (= lt!91478 lt!91475)))

(assert (=> d!55033 (= (getValueByKey!220 lt!91477 (_1!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))))))

(assert (=> d!55033 (= lt!91475 (lemmaContainsTupThenGetReturnValue!116 lt!91477 (_1!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))))))

(assert (=> d!55033 (= lt!91477 (insertStrictlySorted!119 (toList!1191 lt!91413) (_1!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))))))

(assert (=> d!55033 (= (+!283 lt!91413 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))) lt!91476)))

(declare-fun b!184889 () Bool)

(declare-fun res!87458 () Bool)

(assert (=> b!184889 (=> (not res!87458) (not e!121687))))

(assert (=> b!184889 (= res!87458 (= (getValueByKey!220 (toList!1191 lt!91476) (_1!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))))))))

(declare-fun b!184890 () Bool)

(assert (=> b!184890 (= e!121687 (contains!1285 (toList!1191 lt!91476) (tuple2!3435 lt!91407 (minValue!3610 thiss!1248))))))

(assert (= (and d!55033 res!87459) b!184889))

(assert (= (and b!184889 res!87458) b!184890))

(declare-fun m!212269 () Bool)

(assert (=> d!55033 m!212269))

(declare-fun m!212271 () Bool)

(assert (=> d!55033 m!212271))

(declare-fun m!212273 () Bool)

(assert (=> d!55033 m!212273))

(declare-fun m!212275 () Bool)

(assert (=> d!55033 m!212275))

(declare-fun m!212277 () Bool)

(assert (=> b!184889 m!212277))

(declare-fun m!212279 () Bool)

(assert (=> b!184890 m!212279))

(assert (=> b!184788 d!55033))

(declare-fun d!55035 () Bool)

(declare-fun e!121688 () Bool)

(assert (=> d!55035 e!121688))

(declare-fun res!87461 () Bool)

(assert (=> d!55035 (=> (not res!87461) (not e!121688))))

(declare-fun lt!91480 () ListLongMap!2351)

(assert (=> d!55035 (= res!87461 (contains!1283 lt!91480 (_1!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))))))

(declare-fun lt!91481 () List!2348)

(assert (=> d!55035 (= lt!91480 (ListLongMap!2352 lt!91481))))

(declare-fun lt!91482 () Unit!5576)

(declare-fun lt!91479 () Unit!5576)

(assert (=> d!55035 (= lt!91482 lt!91479)))

(assert (=> d!55035 (= (getValueByKey!220 lt!91481 (_1!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))))))

(assert (=> d!55035 (= lt!91479 (lemmaContainsTupThenGetReturnValue!116 lt!91481 (_1!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))))))

(assert (=> d!55035 (= lt!91481 (insertStrictlySorted!119 (toList!1191 lt!91414) (_1!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))))))

(assert (=> d!55035 (= (+!283 lt!91414 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))) lt!91480)))

(declare-fun b!184891 () Bool)

(declare-fun res!87460 () Bool)

(assert (=> b!184891 (=> (not res!87460) (not e!121688))))

(assert (=> b!184891 (= res!87460 (= (getValueByKey!220 (toList!1191 lt!91480) (_1!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))))))))

(declare-fun b!184892 () Bool)

(assert (=> b!184892 (= e!121688 (contains!1285 (toList!1191 lt!91480) (tuple2!3435 lt!91400 (zeroValue!3610 thiss!1248))))))

(assert (= (and d!55035 res!87461) b!184891))

(assert (= (and b!184891 res!87460) b!184892))

(declare-fun m!212281 () Bool)

(assert (=> d!55035 m!212281))

(declare-fun m!212283 () Bool)

(assert (=> d!55035 m!212283))

(declare-fun m!212285 () Bool)

(assert (=> d!55035 m!212285))

(declare-fun m!212287 () Bool)

(assert (=> d!55035 m!212287))

(declare-fun m!212289 () Bool)

(assert (=> b!184891 m!212289))

(declare-fun m!212291 () Bool)

(assert (=> b!184892 m!212291))

(assert (=> b!184788 d!55035))

(declare-fun d!55037 () Bool)

(assert (=> d!55037 (= (apply!163 (+!283 lt!91396 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))) lt!91412) (apply!163 lt!91396 lt!91412))))

(declare-fun lt!91483 () Unit!5576)

(assert (=> d!55037 (= lt!91483 (choose!980 lt!91396 lt!91399 (minValue!3610 thiss!1248) lt!91412))))

(declare-fun e!121689 () Bool)

(assert (=> d!55037 e!121689))

(declare-fun res!87462 () Bool)

(assert (=> d!55037 (=> (not res!87462) (not e!121689))))

(assert (=> d!55037 (= res!87462 (contains!1283 lt!91396 lt!91412))))

(assert (=> d!55037 (= (addApplyDifferent!139 lt!91396 lt!91399 (minValue!3610 thiss!1248) lt!91412) lt!91483)))

(declare-fun b!184893 () Bool)

(assert (=> b!184893 (= e!121689 (not (= lt!91412 lt!91399)))))

(assert (= (and d!55037 res!87462) b!184893))

(assert (=> d!55037 m!212121))

(assert (=> d!55037 m!212143))

(assert (=> d!55037 m!212121))

(declare-fun m!212293 () Bool)

(assert (=> d!55037 m!212293))

(assert (=> d!55037 m!212147))

(declare-fun m!212295 () Bool)

(assert (=> d!55037 m!212295))

(assert (=> b!184788 d!55037))

(declare-fun d!55039 () Bool)

(declare-fun e!121690 () Bool)

(assert (=> d!55039 e!121690))

(declare-fun res!87464 () Bool)

(assert (=> d!55039 (=> (not res!87464) (not e!121690))))

(declare-fun lt!91485 () ListLongMap!2351)

(assert (=> d!55039 (= res!87464 (contains!1283 lt!91485 (_1!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))))))

(declare-fun lt!91486 () List!2348)

(assert (=> d!55039 (= lt!91485 (ListLongMap!2352 lt!91486))))

(declare-fun lt!91487 () Unit!5576)

(declare-fun lt!91484 () Unit!5576)

(assert (=> d!55039 (= lt!91487 lt!91484)))

(assert (=> d!55039 (= (getValueByKey!220 lt!91486 (_1!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))))))

(assert (=> d!55039 (= lt!91484 (lemmaContainsTupThenGetReturnValue!116 lt!91486 (_1!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))))))

(assert (=> d!55039 (= lt!91486 (insertStrictlySorted!119 (toList!1191 lt!91396) (_1!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))))))

(assert (=> d!55039 (= (+!283 lt!91396 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))) lt!91485)))

(declare-fun b!184894 () Bool)

(declare-fun res!87463 () Bool)

(assert (=> b!184894 (=> (not res!87463) (not e!121690))))

(assert (=> b!184894 (= res!87463 (= (getValueByKey!220 (toList!1191 lt!91485) (_1!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))))))))

(declare-fun b!184895 () Bool)

(assert (=> b!184895 (= e!121690 (contains!1285 (toList!1191 lt!91485) (tuple2!3435 lt!91399 (minValue!3610 thiss!1248))))))

(assert (= (and d!55039 res!87464) b!184894))

(assert (= (and b!184894 res!87463) b!184895))

(declare-fun m!212297 () Bool)

(assert (=> d!55039 m!212297))

(declare-fun m!212299 () Bool)

(assert (=> d!55039 m!212299))

(declare-fun m!212301 () Bool)

(assert (=> d!55039 m!212301))

(declare-fun m!212303 () Bool)

(assert (=> d!55039 m!212303))

(declare-fun m!212305 () Bool)

(assert (=> b!184894 m!212305))

(declare-fun m!212307 () Bool)

(assert (=> b!184895 m!212307))

(assert (=> b!184788 d!55039))

(declare-fun d!55041 () Bool)

(assert (=> d!55041 (= (apply!163 lt!91398 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2130 (getValueByKey!220 (toList!1191 lt!91398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!7507 () Bool)

(assert (= bs!7507 d!55041))

(declare-fun m!212309 () Bool)

(assert (=> bs!7507 m!212309))

(assert (=> bs!7507 m!212309))

(declare-fun m!212311 () Bool)

(assert (=> bs!7507 m!212311))

(assert (=> b!184789 d!55041))

(declare-fun d!55043 () Bool)

(declare-fun e!121691 () Bool)

(assert (=> d!55043 e!121691))

(declare-fun res!87465 () Bool)

(assert (=> d!55043 (=> res!87465 e!121691)))

(declare-fun lt!91489 () Bool)

(assert (=> d!55043 (= res!87465 (not lt!91489))))

(declare-fun lt!91490 () Bool)

(assert (=> d!55043 (= lt!91489 lt!91490)))

(declare-fun lt!91488 () Unit!5576)

(declare-fun e!121692 () Unit!5576)

(assert (=> d!55043 (= lt!91488 e!121692)))

(declare-fun c!33176 () Bool)

(assert (=> d!55043 (= c!33176 lt!91490)))

(assert (=> d!55043 (= lt!91490 (containsKey!224 (toList!1191 lt!91398) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55043 (= (contains!1283 lt!91398 #b1000000000000000000000000000000000000000000000000000000000000000) lt!91489)))

(declare-fun b!184896 () Bool)

(declare-fun lt!91491 () Unit!5576)

(assert (=> b!184896 (= e!121692 lt!91491)))

(assert (=> b!184896 (= lt!91491 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1191 lt!91398) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184896 (isDefined!173 (getValueByKey!220 (toList!1191 lt!91398) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184897 () Bool)

(declare-fun Unit!5581 () Unit!5576)

(assert (=> b!184897 (= e!121692 Unit!5581)))

(declare-fun b!184898 () Bool)

(assert (=> b!184898 (= e!121691 (isDefined!173 (getValueByKey!220 (toList!1191 lt!91398) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55043 c!33176) b!184896))

(assert (= (and d!55043 (not c!33176)) b!184897))

(assert (= (and d!55043 (not res!87465)) b!184898))

(declare-fun m!212313 () Bool)

(assert (=> d!55043 m!212313))

(declare-fun m!212315 () Bool)

(assert (=> b!184896 m!212315))

(assert (=> b!184896 m!212309))

(assert (=> b!184896 m!212309))

(declare-fun m!212317 () Bool)

(assert (=> b!184896 m!212317))

(assert (=> b!184898 m!212309))

(assert (=> b!184898 m!212309))

(assert (=> b!184898 m!212317))

(assert (=> bm!18640 d!55043))

(declare-fun d!55045 () Bool)

(assert (=> d!55045 (= (apply!163 lt!91398 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)) (get!2130 (getValueByKey!220 (toList!1191 lt!91398) (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))))

(declare-fun bs!7508 () Bool)

(assert (= bs!7508 d!55045))

(assert (=> bs!7508 m!212095))

(declare-fun m!212319 () Bool)

(assert (=> bs!7508 m!212319))

(assert (=> bs!7508 m!212319))

(declare-fun m!212321 () Bool)

(assert (=> bs!7508 m!212321))

(assert (=> b!184790 d!55045))

(declare-fun d!55047 () Bool)

(declare-fun c!33179 () Bool)

(assert (=> d!55047 (= c!33179 ((_ is ValueCellFull!1818) (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121695 () V!5411)

(assert (=> d!55047 (= (get!2129 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)) e!121695)))

(declare-fun b!184903 () Bool)

(declare-fun get!2131 (ValueCell!1818 V!5411) V!5411)

(assert (=> b!184903 (= e!121695 (get!2131 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184904 () Bool)

(declare-fun get!2132 (ValueCell!1818 V!5411) V!5411)

(assert (=> b!184904 (= e!121695 (get!2132 (select (arr!3708 (_values!3752 thiss!1248)) #b00000000000000000000000000000000) (dynLambda!506 (defaultEntry!3769 thiss!1248) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55047 c!33179) b!184903))

(assert (= (and d!55047 (not c!33179)) b!184904))

(assert (=> b!184903 m!212101))

(assert (=> b!184903 m!212099))

(declare-fun m!212323 () Bool)

(assert (=> b!184903 m!212323))

(assert (=> b!184904 m!212101))

(assert (=> b!184904 m!212099))

(declare-fun m!212325 () Bool)

(assert (=> b!184904 m!212325))

(assert (=> b!184790 d!55047))

(declare-fun b!184917 () Bool)

(declare-fun e!121703 () SeekEntryResult!628)

(assert (=> b!184917 (= e!121703 (Found!628 (index!4684 lt!91426)))))

(declare-fun b!184918 () Bool)

(declare-fun c!33186 () Bool)

(declare-fun lt!91496 () (_ BitVec 64))

(assert (=> b!184918 (= c!33186 (= lt!91496 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!121702 () SeekEntryResult!628)

(assert (=> b!184918 (= e!121703 e!121702)))

(declare-fun b!184919 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!184919 (= e!121702 (seekKeyOrZeroReturnVacant!0 (bvadd (x!20078 lt!91426) #b00000000000000000000000000000001) (nextIndex!0 (index!4684 lt!91426) (x!20078 lt!91426) (mask!8859 thiss!1248)) (index!4684 lt!91426) key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(declare-fun b!184921 () Bool)

(declare-fun e!121704 () SeekEntryResult!628)

(assert (=> b!184921 (= e!121704 Undefined!628)))

(declare-fun b!184922 () Bool)

(assert (=> b!184922 (= e!121702 (MissingVacant!628 (index!4684 lt!91426)))))

(declare-fun lt!91497 () SeekEntryResult!628)

(declare-fun d!55049 () Bool)

(assert (=> d!55049 (and (or ((_ is Undefined!628) lt!91497) (not ((_ is Found!628) lt!91497)) (and (bvsge (index!4683 lt!91497) #b00000000000000000000000000000000) (bvslt (index!4683 lt!91497) (size!4022 (_keys!5700 thiss!1248))))) (or ((_ is Undefined!628) lt!91497) ((_ is Found!628) lt!91497) (not ((_ is MissingVacant!628) lt!91497)) (not (= (index!4685 lt!91497) (index!4684 lt!91426))) (and (bvsge (index!4685 lt!91497) #b00000000000000000000000000000000) (bvslt (index!4685 lt!91497) (size!4022 (_keys!5700 thiss!1248))))) (or ((_ is Undefined!628) lt!91497) (ite ((_ is Found!628) lt!91497) (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4683 lt!91497)) key!828) (and ((_ is MissingVacant!628) lt!91497) (= (index!4685 lt!91497) (index!4684 lt!91426)) (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4685 lt!91497)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!55049 (= lt!91497 e!121704)))

(declare-fun c!33187 () Bool)

(assert (=> d!55049 (= c!33187 (bvsge (x!20078 lt!91426) #b01111111111111111111111111111110))))

(assert (=> d!55049 (= lt!91496 (select (arr!3707 (_keys!5700 thiss!1248)) (index!4684 lt!91426)))))

(assert (=> d!55049 (validMask!0 (mask!8859 thiss!1248))))

(assert (=> d!55049 (= (seekKeyOrZeroReturnVacant!0 (x!20078 lt!91426) (index!4684 lt!91426) (index!4684 lt!91426) key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)) lt!91497)))

(declare-fun b!184920 () Bool)

(assert (=> b!184920 (= e!121704 e!121703)))

(declare-fun c!33188 () Bool)

(assert (=> b!184920 (= c!33188 (= lt!91496 key!828))))

(assert (= (and d!55049 c!33187) b!184921))

(assert (= (and d!55049 (not c!33187)) b!184920))

(assert (= (and b!184920 c!33188) b!184917))

(assert (= (and b!184920 (not c!33188)) b!184918))

(assert (= (and b!184918 c!33186) b!184922))

(assert (= (and b!184918 (not c!33186)) b!184919))

(declare-fun m!212327 () Bool)

(assert (=> b!184919 m!212327))

(assert (=> b!184919 m!212327))

(declare-fun m!212329 () Bool)

(assert (=> b!184919 m!212329))

(declare-fun m!212331 () Bool)

(assert (=> d!55049 m!212331))

(declare-fun m!212333 () Bool)

(assert (=> d!55049 m!212333))

(assert (=> d!55049 m!212151))

(assert (=> d!55049 m!212057))

(assert (=> b!184812 d!55049))

(declare-fun b!184941 () Bool)

(declare-fun e!121717 () SeekEntryResult!628)

(declare-fun e!121718 () SeekEntryResult!628)

(assert (=> b!184941 (= e!121717 e!121718)))

(declare-fun c!33196 () Bool)

(declare-fun lt!91503 () (_ BitVec 64))

(assert (=> b!184941 (= c!33196 (or (= lt!91503 key!828) (= (bvadd lt!91503 lt!91503) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!184942 () Bool)

(declare-fun lt!91502 () SeekEntryResult!628)

(assert (=> b!184942 (and (bvsge (index!4684 lt!91502) #b00000000000000000000000000000000) (bvslt (index!4684 lt!91502) (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun e!121716 () Bool)

(assert (=> b!184942 (= e!121716 (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4684 lt!91502)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184943 () Bool)

(assert (=> b!184943 (= e!121717 (Intermediate!628 true (toIndex!0 key!828 (mask!8859 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun b!184944 () Bool)

(assert (=> b!184944 (and (bvsge (index!4684 lt!91502) #b00000000000000000000000000000000) (bvslt (index!4684 lt!91502) (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun res!87472 () Bool)

(assert (=> b!184944 (= res!87472 (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4684 lt!91502)) key!828))))

(assert (=> b!184944 (=> res!87472 e!121716)))

(declare-fun e!121715 () Bool)

(assert (=> b!184944 (= e!121715 e!121716)))

(declare-fun b!184945 () Bool)

(assert (=> b!184945 (and (bvsge (index!4684 lt!91502) #b00000000000000000000000000000000) (bvslt (index!4684 lt!91502) (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun res!87473 () Bool)

(assert (=> b!184945 (= res!87473 (= (select (arr!3707 (_keys!5700 thiss!1248)) (index!4684 lt!91502)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184945 (=> res!87473 e!121716)))

(declare-fun b!184947 () Bool)

(declare-fun e!121719 () Bool)

(assert (=> b!184947 (= e!121719 e!121715)))

(declare-fun res!87474 () Bool)

(assert (=> b!184947 (= res!87474 (and ((_ is Intermediate!628) lt!91502) (not (undefined!1440 lt!91502)) (bvslt (x!20078 lt!91502) #b01111111111111111111111111111110) (bvsge (x!20078 lt!91502) #b00000000000000000000000000000000) (bvsge (x!20078 lt!91502) #b00000000000000000000000000000000)))))

(assert (=> b!184947 (=> (not res!87474) (not e!121715))))

(declare-fun b!184948 () Bool)

(assert (=> b!184948 (= e!121718 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!828 (mask!8859 thiss!1248)) #b00000000000000000000000000000000 (mask!8859 thiss!1248)) key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(declare-fun b!184949 () Bool)

(assert (=> b!184949 (= e!121718 (Intermediate!628 false (toIndex!0 key!828 (mask!8859 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun d!55051 () Bool)

(assert (=> d!55051 e!121719))

(declare-fun c!33195 () Bool)

(assert (=> d!55051 (= c!33195 (and ((_ is Intermediate!628) lt!91502) (undefined!1440 lt!91502)))))

(assert (=> d!55051 (= lt!91502 e!121717)))

(declare-fun c!33197 () Bool)

(assert (=> d!55051 (= c!33197 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!55051 (= lt!91503 (select (arr!3707 (_keys!5700 thiss!1248)) (toIndex!0 key!828 (mask!8859 thiss!1248))))))

(assert (=> d!55051 (validMask!0 (mask!8859 thiss!1248))))

(assert (=> d!55051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!828 (mask!8859 thiss!1248)) key!828 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)) lt!91502)))

(declare-fun b!184946 () Bool)

(assert (=> b!184946 (= e!121719 (bvsge (x!20078 lt!91502) #b01111111111111111111111111111110))))

(assert (= (and d!55051 c!33197) b!184943))

(assert (= (and d!55051 (not c!33197)) b!184941))

(assert (= (and b!184941 c!33196) b!184949))

(assert (= (and b!184941 (not c!33196)) b!184948))

(assert (= (and d!55051 c!33195) b!184946))

(assert (= (and d!55051 (not c!33195)) b!184947))

(assert (= (and b!184947 res!87474) b!184944))

(assert (= (and b!184944 (not res!87472)) b!184945))

(assert (= (and b!184945 (not res!87473)) b!184942))

(declare-fun m!212335 () Bool)

(assert (=> b!184942 m!212335))

(assert (=> b!184945 m!212335))

(assert (=> d!55051 m!212155))

(declare-fun m!212337 () Bool)

(assert (=> d!55051 m!212337))

(assert (=> d!55051 m!212057))

(assert (=> b!184944 m!212335))

(assert (=> b!184948 m!212155))

(declare-fun m!212339 () Bool)

(assert (=> b!184948 m!212339))

(assert (=> b!184948 m!212339))

(declare-fun m!212341 () Bool)

(assert (=> b!184948 m!212341))

(assert (=> d!54993 d!55051))

(declare-fun d!55053 () Bool)

(declare-fun lt!91509 () (_ BitVec 32))

(declare-fun lt!91508 () (_ BitVec 32))

(assert (=> d!55053 (= lt!91509 (bvmul (bvxor lt!91508 (bvlshr lt!91508 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!55053 (= lt!91508 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!55053 (and (bvsge (mask!8859 thiss!1248) #b00000000000000000000000000000000) (let ((res!87475 (let ((h!2979 ((_ extract 31 0) (bvand (bvxor key!828 (bvlshr key!828 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!20096 (bvmul (bvxor h!2979 (bvlshr h!2979 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!20096 (bvlshr x!20096 #b00000000000000000000000000001101)) (mask!8859 thiss!1248)))))) (and (bvslt res!87475 (bvadd (mask!8859 thiss!1248) #b00000000000000000000000000000001)) (bvsge res!87475 #b00000000000000000000000000000000))))))

(assert (=> d!55053 (= (toIndex!0 key!828 (mask!8859 thiss!1248)) (bvand (bvxor lt!91509 (bvlshr lt!91509 #b00000000000000000000000000001101)) (mask!8859 thiss!1248)))))

(assert (=> d!54993 d!55053))

(assert (=> d!54993 d!54995))

(declare-fun b!184958 () Bool)

(declare-fun e!121726 () Bool)

(declare-fun e!121728 () Bool)

(assert (=> b!184958 (= e!121726 e!121728)))

(declare-fun lt!91518 () (_ BitVec 64))

(assert (=> b!184958 (= lt!91518 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))

(declare-fun lt!91517 () Unit!5576)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!7847 (_ BitVec 64) (_ BitVec 32)) Unit!5576)

(assert (=> b!184958 (= lt!91517 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!5700 thiss!1248) lt!91518 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!7847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!184958 (arrayContainsKey!0 (_keys!5700 thiss!1248) lt!91518 #b00000000000000000000000000000000)))

(declare-fun lt!91516 () Unit!5576)

(assert (=> b!184958 (= lt!91516 lt!91517)))

(declare-fun res!87481 () Bool)

(assert (=> b!184958 (= res!87481 (= (seekEntryOrOpen!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000) (_keys!5700 thiss!1248) (mask!8859 thiss!1248)) (Found!628 #b00000000000000000000000000000000)))))

(assert (=> b!184958 (=> (not res!87481) (not e!121728))))

(declare-fun b!184959 () Bool)

(declare-fun e!121727 () Bool)

(assert (=> b!184959 (= e!121727 e!121726)))

(declare-fun c!33200 () Bool)

(assert (=> b!184959 (= c!33200 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184960 () Bool)

(declare-fun call!18655 () Bool)

(assert (=> b!184960 (= e!121726 call!18655)))

(declare-fun bm!18652 () Bool)

(assert (=> bm!18652 (= call!18655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!5700 thiss!1248) (mask!8859 thiss!1248)))))

(declare-fun b!184961 () Bool)

(assert (=> b!184961 (= e!121728 call!18655)))

(declare-fun d!55055 () Bool)

(declare-fun res!87480 () Bool)

(assert (=> d!55055 (=> res!87480 e!121727)))

(assert (=> d!55055 (= res!87480 (bvsge #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> d!55055 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5700 thiss!1248) (mask!8859 thiss!1248)) e!121727)))

(assert (= (and d!55055 (not res!87480)) b!184959))

(assert (= (and b!184959 c!33200) b!184958))

(assert (= (and b!184959 (not c!33200)) b!184960))

(assert (= (and b!184958 res!87481) b!184961))

(assert (= (or b!184961 b!184960) bm!18652))

(assert (=> b!184958 m!212095))

(declare-fun m!212343 () Bool)

(assert (=> b!184958 m!212343))

(declare-fun m!212345 () Bool)

(assert (=> b!184958 m!212345))

(assert (=> b!184958 m!212095))

(declare-fun m!212347 () Bool)

(assert (=> b!184958 m!212347))

(assert (=> b!184959 m!212095))

(assert (=> b!184959 m!212095))

(assert (=> b!184959 m!212097))

(declare-fun m!212349 () Bool)

(assert (=> bm!18652 m!212349))

(assert (=> b!184820 d!55055))

(assert (=> d!54991 d!54995))

(declare-fun d!55057 () Bool)

(declare-fun isEmpty!470 (Option!226) Bool)

(assert (=> d!55057 (= (isDefined!173 (getValueByKey!220 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828)) (not (isEmpty!470 (getValueByKey!220 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))))

(declare-fun bs!7509 () Bool)

(assert (= bs!7509 d!55057))

(assert (=> bs!7509 m!212089))

(declare-fun m!212351 () Bool)

(assert (=> bs!7509 m!212351))

(assert (=> b!184729 d!55057))

(declare-fun d!55059 () Bool)

(declare-fun c!33205 () Bool)

(assert (=> d!55059 (= c!33205 (and ((_ is Cons!2344) (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))) (= (_1!1728 (h!2976 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))))) key!828)))))

(declare-fun e!121733 () Option!226)

(assert (=> d!55059 (= (getValueByKey!220 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828) e!121733)))

(declare-fun b!184970 () Bool)

(assert (=> b!184970 (= e!121733 (Some!225 (_2!1728 (h!2976 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))))))

(declare-fun b!184971 () Bool)

(declare-fun e!121734 () Option!226)

(assert (=> b!184971 (= e!121733 e!121734)))

(declare-fun c!33206 () Bool)

(assert (=> b!184971 (= c!33206 (and ((_ is Cons!2344) (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))) (not (= (_1!1728 (h!2976 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))))) key!828))))))

(declare-fun b!184972 () Bool)

(assert (=> b!184972 (= e!121734 (getValueByKey!220 (t!7224 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))) key!828))))

(declare-fun b!184973 () Bool)

(assert (=> b!184973 (= e!121734 None!224)))

(assert (= (and d!55059 c!33205) b!184970))

(assert (= (and d!55059 (not c!33205)) b!184971))

(assert (= (and b!184971 c!33206) b!184972))

(assert (= (and b!184971 (not c!33206)) b!184973))

(declare-fun m!212353 () Bool)

(assert (=> b!184972 m!212353))

(assert (=> b!184729 d!55059))

(declare-fun b!184984 () Bool)

(declare-fun e!121746 () Bool)

(declare-fun e!121744 () Bool)

(assert (=> b!184984 (= e!121746 e!121744)))

(declare-fun c!33209 () Bool)

(assert (=> b!184984 (= c!33209 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184985 () Bool)

(declare-fun e!121743 () Bool)

(assert (=> b!184985 (= e!121743 e!121746)))

(declare-fun res!87490 () Bool)

(assert (=> b!184985 (=> (not res!87490) (not e!121746))))

(declare-fun e!121745 () Bool)

(assert (=> b!184985 (= res!87490 (not e!121745))))

(declare-fun res!87488 () Bool)

(assert (=> b!184985 (=> (not res!87488) (not e!121745))))

(assert (=> b!184985 (= res!87488 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184986 () Bool)

(declare-fun contains!1286 (List!2350 (_ BitVec 64)) Bool)

(assert (=> b!184986 (= e!121745 (contains!1286 Nil!2347 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun d!55061 () Bool)

(declare-fun res!87489 () Bool)

(assert (=> d!55061 (=> res!87489 e!121743)))

(assert (=> d!55061 (= res!87489 (bvsge #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> d!55061 (= (arrayNoDuplicates!0 (_keys!5700 thiss!1248) #b00000000000000000000000000000000 Nil!2347) e!121743)))

(declare-fun b!184987 () Bool)

(declare-fun call!18658 () Bool)

(assert (=> b!184987 (= e!121744 call!18658)))

(declare-fun b!184988 () Bool)

(assert (=> b!184988 (= e!121744 call!18658)))

(declare-fun bm!18655 () Bool)

(assert (=> bm!18655 (= call!18658 (arrayNoDuplicates!0 (_keys!5700 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!33209 (Cons!2346 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000) Nil!2347) Nil!2347)))))

(assert (= (and d!55061 (not res!87489)) b!184985))

(assert (= (and b!184985 res!87488) b!184986))

(assert (= (and b!184985 res!87490) b!184984))

(assert (= (and b!184984 c!33209) b!184988))

(assert (= (and b!184984 (not c!33209)) b!184987))

(assert (= (or b!184988 b!184987) bm!18655))

(assert (=> b!184984 m!212095))

(assert (=> b!184984 m!212095))

(assert (=> b!184984 m!212097))

(assert (=> b!184985 m!212095))

(assert (=> b!184985 m!212095))

(assert (=> b!184985 m!212097))

(assert (=> b!184986 m!212095))

(assert (=> b!184986 m!212095))

(declare-fun m!212355 () Bool)

(assert (=> b!184986 m!212355))

(assert (=> bm!18655 m!212095))

(declare-fun m!212357 () Bool)

(assert (=> bm!18655 m!212357))

(assert (=> b!184821 d!55061))

(declare-fun d!55063 () Bool)

(declare-fun e!121747 () Bool)

(assert (=> d!55063 e!121747))

(declare-fun res!87491 () Bool)

(assert (=> d!55063 (=> res!87491 e!121747)))

(declare-fun lt!91520 () Bool)

(assert (=> d!55063 (= res!87491 (not lt!91520))))

(declare-fun lt!91521 () Bool)

(assert (=> d!55063 (= lt!91520 lt!91521)))

(declare-fun lt!91519 () Unit!5576)

(declare-fun e!121748 () Unit!5576)

(assert (=> d!55063 (= lt!91519 e!121748)))

(declare-fun c!33210 () Bool)

(assert (=> d!55063 (= c!33210 lt!91521)))

(assert (=> d!55063 (= lt!91521 (containsKey!224 (toList!1191 lt!91398) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!55063 (= (contains!1283 lt!91398 #b0000000000000000000000000000000000000000000000000000000000000000) lt!91520)))

(declare-fun b!184989 () Bool)

(declare-fun lt!91522 () Unit!5576)

(assert (=> b!184989 (= e!121748 lt!91522)))

(assert (=> b!184989 (= lt!91522 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1191 lt!91398) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!184989 (isDefined!173 (getValueByKey!220 (toList!1191 lt!91398) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!184990 () Bool)

(declare-fun Unit!5582 () Unit!5576)

(assert (=> b!184990 (= e!121748 Unit!5582)))

(declare-fun b!184991 () Bool)

(assert (=> b!184991 (= e!121747 (isDefined!173 (getValueByKey!220 (toList!1191 lt!91398) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!55063 c!33210) b!184989))

(assert (= (and d!55063 (not c!33210)) b!184990))

(assert (= (and d!55063 (not res!87491)) b!184991))

(declare-fun m!212359 () Bool)

(assert (=> d!55063 m!212359))

(declare-fun m!212361 () Bool)

(assert (=> b!184989 m!212361))

(assert (=> b!184989 m!212175))

(assert (=> b!184989 m!212175))

(declare-fun m!212363 () Bool)

(assert (=> b!184989 m!212363))

(assert (=> b!184991 m!212175))

(assert (=> b!184991 m!212175))

(assert (=> b!184991 m!212363))

(assert (=> bm!18643 d!55063))

(declare-fun d!55065 () Bool)

(assert (=> d!55065 (= (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)) (and (not (= (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!184791 d!55065))

(declare-fun d!55067 () Bool)

(declare-fun e!121749 () Bool)

(assert (=> d!55067 e!121749))

(declare-fun res!87492 () Bool)

(assert (=> d!55067 (=> res!87492 e!121749)))

(declare-fun lt!91524 () Bool)

(assert (=> d!55067 (= res!87492 (not lt!91524))))

(declare-fun lt!91525 () Bool)

(assert (=> d!55067 (= lt!91524 lt!91525)))

(declare-fun lt!91523 () Unit!5576)

(declare-fun e!121750 () Unit!5576)

(assert (=> d!55067 (= lt!91523 e!121750)))

(declare-fun c!33211 () Bool)

(assert (=> d!55067 (= c!33211 lt!91525)))

(assert (=> d!55067 (= lt!91525 (containsKey!224 (toList!1191 lt!91398) (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> d!55067 (= (contains!1283 lt!91398 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)) lt!91524)))

(declare-fun b!184992 () Bool)

(declare-fun lt!91526 () Unit!5576)

(assert (=> b!184992 (= e!121750 lt!91526)))

(assert (=> b!184992 (= lt!91526 (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1191 lt!91398) (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(assert (=> b!184992 (isDefined!173 (getValueByKey!220 (toList!1191 lt!91398) (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!184993 () Bool)

(declare-fun Unit!5583 () Unit!5576)

(assert (=> b!184993 (= e!121750 Unit!5583)))

(declare-fun b!184994 () Bool)

(assert (=> b!184994 (= e!121749 (isDefined!173 (getValueByKey!220 (toList!1191 lt!91398) (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000))))))

(assert (= (and d!55067 c!33211) b!184992))

(assert (= (and d!55067 (not c!33211)) b!184993))

(assert (= (and d!55067 (not res!87492)) b!184994))

(assert (=> d!55067 m!212095))

(declare-fun m!212365 () Bool)

(assert (=> d!55067 m!212365))

(assert (=> b!184992 m!212095))

(declare-fun m!212367 () Bool)

(assert (=> b!184992 m!212367))

(assert (=> b!184992 m!212095))

(assert (=> b!184992 m!212319))

(assert (=> b!184992 m!212319))

(declare-fun m!212369 () Bool)

(assert (=> b!184992 m!212369))

(assert (=> b!184994 m!212095))

(assert (=> b!184994 m!212319))

(assert (=> b!184994 m!212319))

(assert (=> b!184994 m!212369))

(assert (=> b!184775 d!55067))

(assert (=> b!184784 d!55065))

(declare-fun b!185006 () Bool)

(declare-fun e!121753 () Bool)

(assert (=> b!185006 (= e!121753 (and (bvsge (extraKeys!3506 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3506 thiss!1248) #b00000000000000000000000000000011) (bvsge (_vacant!1321 thiss!1248) #b00000000000000000000000000000000)))))

(declare-fun b!185005 () Bool)

(declare-fun res!87503 () Bool)

(assert (=> b!185005 (=> (not res!87503) (not e!121753))))

(declare-fun size!4026 (LongMapFixedSize!2544) (_ BitVec 32))

(assert (=> b!185005 (= res!87503 (= (size!4026 thiss!1248) (bvadd (_size!1321 thiss!1248) (bvsdiv (bvadd (extraKeys!3506 thiss!1248) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!55069 () Bool)

(declare-fun res!87501 () Bool)

(assert (=> d!55069 (=> (not res!87501) (not e!121753))))

(assert (=> d!55069 (= res!87501 (validMask!0 (mask!8859 thiss!1248)))))

(assert (=> d!55069 (= (simpleValid!179 thiss!1248) e!121753)))

(declare-fun b!185003 () Bool)

(declare-fun res!87502 () Bool)

(assert (=> b!185003 (=> (not res!87502) (not e!121753))))

(assert (=> b!185003 (= res!87502 (and (= (size!4023 (_values!3752 thiss!1248)) (bvadd (mask!8859 thiss!1248) #b00000000000000000000000000000001)) (= (size!4022 (_keys!5700 thiss!1248)) (size!4023 (_values!3752 thiss!1248))) (bvsge (_size!1321 thiss!1248) #b00000000000000000000000000000000) (bvsle (_size!1321 thiss!1248) (bvadd (mask!8859 thiss!1248) #b00000000000000000000000000000001))))))

(declare-fun b!185004 () Bool)

(declare-fun res!87504 () Bool)

(assert (=> b!185004 (=> (not res!87504) (not e!121753))))

(assert (=> b!185004 (= res!87504 (bvsge (size!4026 thiss!1248) (_size!1321 thiss!1248)))))

(assert (= (and d!55069 res!87501) b!185003))

(assert (= (and b!185003 res!87502) b!185004))

(assert (= (and b!185004 res!87504) b!185005))

(assert (= (and b!185005 res!87503) b!185006))

(declare-fun m!212371 () Bool)

(assert (=> b!185005 m!212371))

(assert (=> d!55069 m!212057))

(assert (=> b!185004 m!212371))

(assert (=> d!55001 d!55069))

(declare-fun d!55071 () Bool)

(assert (=> d!55071 (isDefined!173 (getValueByKey!220 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))

(declare-fun lt!91529 () Unit!5576)

(declare-fun choose!981 (List!2348 (_ BitVec 64)) Unit!5576)

(assert (=> d!55071 (= lt!91529 (choose!981 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))

(declare-fun e!121756 () Bool)

(assert (=> d!55071 e!121756))

(declare-fun res!87507 () Bool)

(assert (=> d!55071 (=> (not res!87507) (not e!121756))))

(declare-fun isStrictlySorted!348 (List!2348) Bool)

(assert (=> d!55071 (= res!87507 (isStrictlySorted!348 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248)))))))

(assert (=> d!55071 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!172 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828) lt!91529)))

(declare-fun b!185009 () Bool)

(assert (=> b!185009 (= e!121756 (containsKey!224 (toList!1191 (getCurrentListMap!839 (_keys!5700 thiss!1248) (_values!3752 thiss!1248) (mask!8859 thiss!1248) (extraKeys!3506 thiss!1248) (zeroValue!3610 thiss!1248) (minValue!3610 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3769 thiss!1248))) key!828))))

(assert (= (and d!55071 res!87507) b!185009))

(assert (=> d!55071 m!212089))

(assert (=> d!55071 m!212089))

(assert (=> d!55071 m!212091))

(declare-fun m!212373 () Bool)

(assert (=> d!55071 m!212373))

(declare-fun m!212375 () Bool)

(assert (=> d!55071 m!212375))

(assert (=> b!185009 m!212085))

(assert (=> b!184727 d!55071))

(assert (=> b!184727 d!55057))

(assert (=> b!184727 d!55059))

(declare-fun d!55073 () Bool)

(declare-fun lt!91532 () (_ BitVec 32))

(assert (=> d!55073 (and (bvsge lt!91532 #b00000000000000000000000000000000) (bvsle lt!91532 (bvsub (size!4022 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun e!121762 () (_ BitVec 32))

(assert (=> d!55073 (= lt!91532 e!121762)))

(declare-fun c!33216 () Bool)

(assert (=> d!55073 (= c!33216 (bvsge #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> d!55073 (and (bvsle #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!4022 (_keys!5700 thiss!1248)) (size!4022 (_keys!5700 thiss!1248))))))

(assert (=> d!55073 (= (arrayCountValidKeys!0 (_keys!5700 thiss!1248) #b00000000000000000000000000000000 (size!4022 (_keys!5700 thiss!1248))) lt!91532)))

(declare-fun b!185018 () Bool)

(assert (=> b!185018 (= e!121762 #b00000000000000000000000000000000)))

(declare-fun b!185019 () Bool)

(declare-fun e!121761 () (_ BitVec 32))

(declare-fun call!18661 () (_ BitVec 32))

(assert (=> b!185019 (= e!121761 call!18661)))

(declare-fun bm!18658 () Bool)

(assert (=> bm!18658 (= call!18661 (arrayCountValidKeys!0 (_keys!5700 thiss!1248) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!4022 (_keys!5700 thiss!1248))))))

(declare-fun b!185020 () Bool)

(assert (=> b!185020 (= e!121762 e!121761)))

(declare-fun c!33217 () Bool)

(assert (=> b!185020 (= c!33217 (validKeyInArray!0 (select (arr!3707 (_keys!5700 thiss!1248)) #b00000000000000000000000000000000)))))

(declare-fun b!185021 () Bool)

(assert (=> b!185021 (= e!121761 (bvadd #b00000000000000000000000000000001 call!18661))))

(assert (= (and d!55073 c!33216) b!185018))

(assert (= (and d!55073 (not c!33216)) b!185020))

(assert (= (and b!185020 c!33217) b!185021))

(assert (= (and b!185020 (not c!33217)) b!185019))

(assert (= (or b!185021 b!185019) bm!18658))

(declare-fun m!212377 () Bool)

(assert (=> bm!18658 m!212377))

(assert (=> b!185020 m!212095))

(assert (=> b!185020 m!212095))

(assert (=> b!185020 m!212097))

(assert (=> b!184819 d!55073))

(declare-fun d!55075 () Bool)

(declare-fun e!121763 () Bool)

(assert (=> d!55075 e!121763))

(declare-fun res!87509 () Bool)

(assert (=> d!55075 (=> (not res!87509) (not e!121763))))

(declare-fun lt!91534 () ListLongMap!2351)

(assert (=> d!55075 (= res!87509 (contains!1283 lt!91534 (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))

(declare-fun lt!91535 () List!2348)

(assert (=> d!55075 (= lt!91534 (ListLongMap!2352 lt!91535))))

(declare-fun lt!91536 () Unit!5576)

(declare-fun lt!91533 () Unit!5576)

(assert (=> d!55075 (= lt!91536 lt!91533)))

(assert (=> d!55075 (= (getValueByKey!220 lt!91535 (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))

(assert (=> d!55075 (= lt!91533 (lemmaContainsTupThenGetReturnValue!116 lt!91535 (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))

(assert (=> d!55075 (= lt!91535 (insertStrictlySorted!119 (toList!1191 call!18646) (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))) (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))))))

(assert (=> d!55075 (= (+!283 call!18646 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))) lt!91534)))

(declare-fun b!185022 () Bool)

(declare-fun res!87508 () Bool)

(assert (=> b!185022 (=> (not res!87508) (not e!121763))))

(assert (=> b!185022 (= res!87508 (= (getValueByKey!220 (toList!1191 lt!91534) (_1!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248)))) (Some!225 (_2!1728 (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))))

(declare-fun b!185023 () Bool)

(assert (=> b!185023 (= e!121763 (contains!1285 (toList!1191 lt!91534) (tuple2!3435 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!3610 thiss!1248))))))

(assert (= (and d!55075 res!87509) b!185022))

(assert (= (and b!185022 res!87508) b!185023))

(declare-fun m!212379 () Bool)

(assert (=> d!55075 m!212379))

(declare-fun m!212381 () Bool)

(assert (=> d!55075 m!212381))

(declare-fun m!212383 () Bool)

(assert (=> d!55075 m!212383))

(declare-fun m!212385 () Bool)

(assert (=> d!55075 m!212385))

(declare-fun m!212387 () Bool)

(assert (=> b!185022 m!212387))

(declare-fun m!212389 () Bool)

(assert (=> b!185023 m!212389))

(assert (=> b!184785 d!55075))

(declare-fun b!185025 () Bool)

(declare-fun e!121765 () Bool)

(assert (=> b!185025 (= e!121765 tp_is_empty!4323)))

(declare-fun condMapEmpty!7440 () Bool)

(declare-fun mapDefault!7440 () ValueCell!1818)

(assert (=> mapNonEmpty!7439 (= condMapEmpty!7440 (= mapRest!7439 ((as const (Array (_ BitVec 32) ValueCell!1818)) mapDefault!7440)))))

(declare-fun mapRes!7440 () Bool)

(assert (=> mapNonEmpty!7439 (= tp!16448 (and e!121765 mapRes!7440))))

(declare-fun b!185024 () Bool)

(declare-fun e!121764 () Bool)

(assert (=> b!185024 (= e!121764 tp_is_empty!4323)))

(declare-fun mapIsEmpty!7440 () Bool)

(assert (=> mapIsEmpty!7440 mapRes!7440))

(declare-fun mapNonEmpty!7440 () Bool)

(declare-fun tp!16449 () Bool)

(assert (=> mapNonEmpty!7440 (= mapRes!7440 (and tp!16449 e!121764))))

(declare-fun mapKey!7440 () (_ BitVec 32))

(declare-fun mapRest!7440 () (Array (_ BitVec 32) ValueCell!1818))

(declare-fun mapValue!7440 () ValueCell!1818)

(assert (=> mapNonEmpty!7440 (= mapRest!7439 (store mapRest!7440 mapKey!7440 mapValue!7440))))

(assert (= (and mapNonEmpty!7439 condMapEmpty!7440) mapIsEmpty!7440))

(assert (= (and mapNonEmpty!7439 (not condMapEmpty!7440)) mapNonEmpty!7440))

(assert (= (and mapNonEmpty!7440 ((_ is ValueCellFull!1818) mapValue!7440)) b!185024))

(assert (= (and mapNonEmpty!7439 ((_ is ValueCellFull!1818) mapDefault!7440)) b!185025))

(declare-fun m!212391 () Bool)

(assert (=> mapNonEmpty!7440 m!212391))

(declare-fun b_lambda!7239 () Bool)

(assert (= b_lambda!7237 (or (and b!184691 b_free!4551) b_lambda!7239)))

(declare-fun b_lambda!7241 () Bool)

(assert (= b_lambda!7235 (or (and b!184691 b_free!4551) b_lambda!7241)))

(check-sat (not b_lambda!7239) (not b!185020) (not d!55063) (not d!55049) (not b!184876) tp_is_empty!4323 (not b!185005) (not d!55035) (not b_lambda!7241) (not mapNonEmpty!7440) (not b!184890) (not d!55025) (not d!55075) (not b!184841) (not b!185023) (not b!185009) (not d!55031) (not b!184887) (not d!55027) (not b!184994) (not b!184904) (not b!184972) (not d!55043) (not b!184875) (not b!184871) (not b!184958) (not b!184872) (not b!184992) (not d!55019) (not b!185022) (not b!184874) (not b!184989) (not b!184878) (not b_next!4551) (not bm!18649) b_and!11149 (not d!55033) (not b!184959) (not b!184834) (not d!55051) (not d!55003) (not d!55021) (not d!55029) (not d!55041) (not d!55039) (not b!184898) (not b!184985) (not bm!18652) (not d!55037) (not b!184889) (not b!184903) (not b!184948) (not b!184866) (not d!55067) (not b!184984) (not b!184919) (not b!184877) (not d!55057) (not b!184894) (not b!184879) (not b_lambda!7233) (not bm!18658) (not d!55011) (not d!55045) (not b!184895) (not b!184991) (not d!55071) (not b!184885) (not bm!18655) (not d!55015) (not d!55013) (not d!55009) (not b!184835) (not d!55005) (not b!184873) (not d!55023) (not b!185004) (not b!184896) (not b!184891) (not d!55069) (not b!184892) (not d!55017) (not b!184986))
(check-sat b_and!11149 (not b_next!4551))
