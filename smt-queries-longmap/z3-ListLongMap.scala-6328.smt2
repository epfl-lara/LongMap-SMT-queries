; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81676 () Bool)

(assert start!81676)

(declare-fun b!953350 () Bool)

(declare-fun b_free!18289 () Bool)

(declare-fun b_next!18289 () Bool)

(assert (=> b!953350 (= b_free!18289 (not b_next!18289))))

(declare-fun tp!63490 () Bool)

(declare-fun b_and!29779 () Bool)

(assert (=> b!953350 (= tp!63490 b_and!29779)))

(declare-fun b!953340 () Bool)

(declare-fun e!536975 () Bool)

(declare-fun key!756 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953340 (= e!536975 (validKeyInArray!0 key!756))))

(declare-fun b!953341 () Bool)

(declare-fun e!536974 () Bool)

(declare-fun tp_is_empty!20797 () Bool)

(assert (=> b!953341 (= e!536974 tp_is_empty!20797)))

(declare-fun mapIsEmpty!33133 () Bool)

(declare-fun mapRes!33133 () Bool)

(assert (=> mapIsEmpty!33133 mapRes!33133))

(declare-fun b!953342 () Bool)

(declare-fun res!638410 () Bool)

(declare-fun e!536973 () Bool)

(assert (=> b!953342 (=> (not res!638410) (not e!536973))))

(declare-datatypes ((V!32695 0))(
  ( (V!32696 (val!10449 Int)) )
))
(declare-datatypes ((ValueCell!9917 0))(
  ( (ValueCellFull!9917 (v!12997 V!32695)) (EmptyCell!9917) )
))
(declare-datatypes ((array!57679 0))(
  ( (array!57680 (arr!27727 (Array (_ BitVec 32) ValueCell!9917)) (size!28207 (_ BitVec 32))) )
))
(declare-datatypes ((array!57681 0))(
  ( (array!57682 (arr!27728 (Array (_ BitVec 32) (_ BitVec 64))) (size!28208 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4984 0))(
  ( (LongMapFixedSize!4985 (defaultEntry!5823 Int) (mask!27714 (_ BitVec 32)) (extraKeys!5555 (_ BitVec 32)) (zeroValue!5659 V!32695) (minValue!5659 V!32695) (_size!2547 (_ BitVec 32)) (_keys!10805 array!57681) (_values!5846 array!57679) (_vacant!2547 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4984)

(declare-datatypes ((tuple2!13564 0))(
  ( (tuple2!13565 (_1!6793 (_ BitVec 64)) (_2!6793 V!32695)) )
))
(declare-datatypes ((List!19352 0))(
  ( (Nil!19349) (Cons!19348 (h!20516 tuple2!13564) (t!27699 List!19352)) )
))
(declare-datatypes ((ListLongMap!12263 0))(
  ( (ListLongMap!12264 (toList!6147 List!19352)) )
))
(declare-fun contains!5253 (ListLongMap!12263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3380 (array!57681 array!57679 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 32) Int) ListLongMap!12263)

(assert (=> b!953342 (= res!638410 (contains!5253 (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)) key!756))))

(declare-fun b!953343 () Bool)

(declare-fun e!536979 () Bool)

(assert (=> b!953343 (= e!536979 (and e!536974 mapRes!33133))))

(declare-fun condMapEmpty!33133 () Bool)

(declare-fun mapDefault!33133 () ValueCell!9917)

(assert (=> b!953343 (= condMapEmpty!33133 (= (arr!27727 (_values!5846 thiss!1141)) ((as const (Array (_ BitVec 32) ValueCell!9917)) mapDefault!33133)))))

(declare-fun b!953344 () Bool)

(declare-fun res!638411 () Bool)

(assert (=> b!953344 (=> (not res!638411) (not e!536973))))

(get-info :version)

(declare-datatypes ((SeekEntryResult!9118 0))(
  ( (MissingZero!9118 (index!38843 (_ BitVec 32))) (Found!9118 (index!38844 (_ BitVec 32))) (Intermediate!9118 (undefined!9930 Bool) (index!38845 (_ BitVec 32)) (x!81910 (_ BitVec 32))) (Undefined!9118) (MissingVacant!9118 (index!38846 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57681 (_ BitVec 32)) SeekEntryResult!9118)

(assert (=> b!953344 (= res!638411 (not ((_ is Found!9118) (seekEntry!0 key!756 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)))))))

(declare-fun res!638407 () Bool)

(assert (=> start!81676 (=> (not res!638407) (not e!536973))))

(declare-fun valid!1904 (LongMapFixedSize!4984) Bool)

(assert (=> start!81676 (= res!638407 (valid!1904 thiss!1141))))

(assert (=> start!81676 e!536973))

(declare-fun e!536977 () Bool)

(assert (=> start!81676 e!536977))

(assert (=> start!81676 true))

(declare-fun b!953345 () Bool)

(declare-fun res!638409 () Bool)

(assert (=> b!953345 (=> (not res!638409) (not e!536973))))

(assert (=> b!953345 (= res!638409 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!953346 () Bool)

(assert (=> b!953346 (= e!536973 (not e!536975))))

(declare-fun res!638408 () Bool)

(assert (=> b!953346 (=> res!638408 e!536975)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!953346 (= res!638408 (not (validMask!0 (mask!27714 thiss!1141))))))

(declare-fun lt!429525 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57681 (_ BitVec 32)) Bool)

(assert (=> b!953346 (arrayForallSeekEntryOrOpenFound!0 lt!429525 (_keys!10805 thiss!1141) (mask!27714 thiss!1141))))

(declare-datatypes ((Unit!32024 0))(
  ( (Unit!32025) )
))
(declare-fun lt!429526 () Unit!32024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!57681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32024)

(assert (=> b!953346 (= lt!429526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10805 thiss!1141) (mask!27714 thiss!1141) #b00000000000000000000000000000000 lt!429525))))

(declare-fun arrayScanForKey!0 (array!57681 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953346 (= lt!429525 (arrayScanForKey!0 (_keys!10805 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57681 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953346 (arrayContainsKey!0 (_keys!10805 thiss!1141) key!756 #b00000000000000000000000000000000)))

(declare-fun lt!429524 () Unit!32024)

(declare-fun lemmaKeyInListMapIsInArray!332 (array!57681 array!57679 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 64) Int) Unit!32024)

(assert (=> b!953346 (= lt!429524 (lemmaKeyInListMapIsInArray!332 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) key!756 (defaultEntry!5823 thiss!1141)))))

(declare-fun b!953347 () Bool)

(declare-fun res!638413 () Bool)

(assert (=> b!953347 (=> res!638413 e!536975)))

(assert (=> b!953347 (= res!638413 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10805 thiss!1141) (mask!27714 thiss!1141))))))

(declare-fun b!953348 () Bool)

(declare-fun e!536976 () Bool)

(assert (=> b!953348 (= e!536976 tp_is_empty!20797)))

(declare-fun b!953349 () Bool)

(declare-fun res!638412 () Bool)

(assert (=> b!953349 (=> res!638412 e!536975)))

(assert (=> b!953349 (= res!638412 (not (= (size!28208 (_keys!10805 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27714 thiss!1141)))))))

(declare-fun array_inv!21596 (array!57681) Bool)

(declare-fun array_inv!21597 (array!57679) Bool)

(assert (=> b!953350 (= e!536977 (and tp!63490 tp_is_empty!20797 (array_inv!21596 (_keys!10805 thiss!1141)) (array_inv!21597 (_values!5846 thiss!1141)) e!536979))))

(declare-fun mapNonEmpty!33133 () Bool)

(declare-fun tp!63489 () Bool)

(assert (=> mapNonEmpty!33133 (= mapRes!33133 (and tp!63489 e!536976))))

(declare-fun mapValue!33133 () ValueCell!9917)

(declare-fun mapRest!33133 () (Array (_ BitVec 32) ValueCell!9917))

(declare-fun mapKey!33133 () (_ BitVec 32))

(assert (=> mapNonEmpty!33133 (= (arr!27727 (_values!5846 thiss!1141)) (store mapRest!33133 mapKey!33133 mapValue!33133))))

(assert (= (and start!81676 res!638407) b!953345))

(assert (= (and b!953345 res!638409) b!953344))

(assert (= (and b!953344 res!638411) b!953342))

(assert (= (and b!953342 res!638410) b!953346))

(assert (= (and b!953346 (not res!638408)) b!953349))

(assert (= (and b!953349 (not res!638412)) b!953347))

(assert (= (and b!953347 (not res!638413)) b!953340))

(assert (= (and b!953343 condMapEmpty!33133) mapIsEmpty!33133))

(assert (= (and b!953343 (not condMapEmpty!33133)) mapNonEmpty!33133))

(assert (= (and mapNonEmpty!33133 ((_ is ValueCellFull!9917) mapValue!33133)) b!953348))

(assert (= (and b!953343 ((_ is ValueCellFull!9917) mapDefault!33133)) b!953341))

(assert (= b!953350 b!953343))

(assert (= start!81676 b!953350))

(declare-fun m!885889 () Bool)

(assert (=> start!81676 m!885889))

(declare-fun m!885891 () Bool)

(assert (=> mapNonEmpty!33133 m!885891))

(declare-fun m!885893 () Bool)

(assert (=> b!953344 m!885893))

(declare-fun m!885895 () Bool)

(assert (=> b!953347 m!885895))

(declare-fun m!885897 () Bool)

(assert (=> b!953342 m!885897))

(assert (=> b!953342 m!885897))

(declare-fun m!885899 () Bool)

(assert (=> b!953342 m!885899))

(declare-fun m!885901 () Bool)

(assert (=> b!953346 m!885901))

(declare-fun m!885903 () Bool)

(assert (=> b!953346 m!885903))

(declare-fun m!885905 () Bool)

(assert (=> b!953346 m!885905))

(declare-fun m!885907 () Bool)

(assert (=> b!953346 m!885907))

(declare-fun m!885909 () Bool)

(assert (=> b!953346 m!885909))

(declare-fun m!885911 () Bool)

(assert (=> b!953346 m!885911))

(declare-fun m!885913 () Bool)

(assert (=> b!953340 m!885913))

(declare-fun m!885915 () Bool)

(assert (=> b!953350 m!885915))

(declare-fun m!885917 () Bool)

(assert (=> b!953350 m!885917))

(check-sat (not b_next!18289) tp_is_empty!20797 (not b!953350) b_and!29779 (not b!953344) (not b!953346) (not mapNonEmpty!33133) (not b!953347) (not b!953342) (not b!953340) (not start!81676))
(check-sat b_and!29779 (not b_next!18289))
(get-model)

(declare-fun d!115853 () Bool)

(declare-fun e!537027 () Bool)

(assert (=> d!115853 e!537027))

(declare-fun res!638458 () Bool)

(assert (=> d!115853 (=> res!638458 e!537027)))

(declare-fun lt!429553 () Bool)

(assert (=> d!115853 (= res!638458 (not lt!429553))))

(declare-fun lt!429554 () Bool)

(assert (=> d!115853 (= lt!429553 lt!429554)))

(declare-fun lt!429555 () Unit!32024)

(declare-fun e!537026 () Unit!32024)

(assert (=> d!115853 (= lt!429555 e!537026)))

(declare-fun c!99929 () Bool)

(assert (=> d!115853 (= c!99929 lt!429554)))

(declare-fun containsKey!474 (List!19352 (_ BitVec 64)) Bool)

(assert (=> d!115853 (= lt!429554 (containsKey!474 (toList!6147 (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756))))

(assert (=> d!115853 (= (contains!5253 (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)) key!756) lt!429553)))

(declare-fun b!953423 () Bool)

(declare-fun lt!429556 () Unit!32024)

(assert (=> b!953423 (= e!537026 lt!429556)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!368 (List!19352 (_ BitVec 64)) Unit!32024)

(assert (=> b!953423 (= lt!429556 (lemmaContainsKeyImpliesGetValueByKeyDefined!368 (toList!6147 (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756))))

(declare-datatypes ((Option!509 0))(
  ( (Some!508 (v!13000 V!32695)) (None!507) )
))
(declare-fun isDefined!376 (Option!509) Bool)

(declare-fun getValueByKey!503 (List!19352 (_ BitVec 64)) Option!509)

(assert (=> b!953423 (isDefined!376 (getValueByKey!503 (toList!6147 (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756))))

(declare-fun b!953424 () Bool)

(declare-fun Unit!32030 () Unit!32024)

(assert (=> b!953424 (= e!537026 Unit!32030)))

(declare-fun b!953425 () Bool)

(assert (=> b!953425 (= e!537027 (isDefined!376 (getValueByKey!503 (toList!6147 (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141))) key!756)))))

(assert (= (and d!115853 c!99929) b!953423))

(assert (= (and d!115853 (not c!99929)) b!953424))

(assert (= (and d!115853 (not res!638458)) b!953425))

(declare-fun m!885979 () Bool)

(assert (=> d!115853 m!885979))

(declare-fun m!885981 () Bool)

(assert (=> b!953423 m!885981))

(declare-fun m!885983 () Bool)

(assert (=> b!953423 m!885983))

(assert (=> b!953423 m!885983))

(declare-fun m!885985 () Bool)

(assert (=> b!953423 m!885985))

(assert (=> b!953425 m!885983))

(assert (=> b!953425 m!885983))

(assert (=> b!953425 m!885985))

(assert (=> b!953342 d!115853))

(declare-fun b!953468 () Bool)

(declare-fun e!537057 () Bool)

(declare-fun lt!429619 () ListLongMap!12263)

(declare-fun apply!895 (ListLongMap!12263 (_ BitVec 64)) V!32695)

(assert (=> b!953468 (= e!537057 (= (apply!895 lt!429619 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!5659 thiss!1141)))))

(declare-fun b!953469 () Bool)

(declare-fun c!99947 () Bool)

(assert (=> b!953469 (= c!99947 (and (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!537062 () ListLongMap!12263)

(declare-fun e!537061 () ListLongMap!12263)

(assert (=> b!953469 (= e!537062 e!537061)))

(declare-fun bm!41631 () Bool)

(declare-fun call!41640 () ListLongMap!12263)

(declare-fun call!41638 () ListLongMap!12263)

(assert (=> bm!41631 (= call!41640 call!41638)))

(declare-fun b!953470 () Bool)

(declare-fun e!537063 () Unit!32024)

(declare-fun lt!429612 () Unit!32024)

(assert (=> b!953470 (= e!537063 lt!429612)))

(declare-fun lt!429610 () ListLongMap!12263)

(declare-fun getCurrentListMapNoExtraKeys!3369 (array!57681 array!57679 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 32) Int) ListLongMap!12263)

(assert (=> b!953470 (= lt!429610 (getCurrentListMapNoExtraKeys!3369 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429609 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429609 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429616 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429616 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429615 () Unit!32024)

(declare-fun addStillContains!584 (ListLongMap!12263 (_ BitVec 64) V!32695 (_ BitVec 64)) Unit!32024)

(assert (=> b!953470 (= lt!429615 (addStillContains!584 lt!429610 lt!429609 (zeroValue!5659 thiss!1141) lt!429616))))

(declare-fun +!2881 (ListLongMap!12263 tuple2!13564) ListLongMap!12263)

(assert (=> b!953470 (contains!5253 (+!2881 lt!429610 (tuple2!13565 lt!429609 (zeroValue!5659 thiss!1141))) lt!429616)))

(declare-fun lt!429617 () Unit!32024)

(assert (=> b!953470 (= lt!429617 lt!429615)))

(declare-fun lt!429606 () ListLongMap!12263)

(assert (=> b!953470 (= lt!429606 (getCurrentListMapNoExtraKeys!3369 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429621 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429621 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429611 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429611 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429613 () Unit!32024)

(declare-fun addApplyDifferent!465 (ListLongMap!12263 (_ BitVec 64) V!32695 (_ BitVec 64)) Unit!32024)

(assert (=> b!953470 (= lt!429613 (addApplyDifferent!465 lt!429606 lt!429621 (minValue!5659 thiss!1141) lt!429611))))

(assert (=> b!953470 (= (apply!895 (+!2881 lt!429606 (tuple2!13565 lt!429621 (minValue!5659 thiss!1141))) lt!429611) (apply!895 lt!429606 lt!429611))))

(declare-fun lt!429608 () Unit!32024)

(assert (=> b!953470 (= lt!429608 lt!429613)))

(declare-fun lt!429602 () ListLongMap!12263)

(assert (=> b!953470 (= lt!429602 (getCurrentListMapNoExtraKeys!3369 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429614 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429603 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429603 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429620 () Unit!32024)

(assert (=> b!953470 (= lt!429620 (addApplyDifferent!465 lt!429602 lt!429614 (zeroValue!5659 thiss!1141) lt!429603))))

(assert (=> b!953470 (= (apply!895 (+!2881 lt!429602 (tuple2!13565 lt!429614 (zeroValue!5659 thiss!1141))) lt!429603) (apply!895 lt!429602 lt!429603))))

(declare-fun lt!429618 () Unit!32024)

(assert (=> b!953470 (= lt!429618 lt!429620)))

(declare-fun lt!429601 () ListLongMap!12263)

(assert (=> b!953470 (= lt!429601 (getCurrentListMapNoExtraKeys!3369 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun lt!429605 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429605 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!429622 () (_ BitVec 64))

(assert (=> b!953470 (= lt!429622 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953470 (= lt!429612 (addApplyDifferent!465 lt!429601 lt!429605 (minValue!5659 thiss!1141) lt!429622))))

(assert (=> b!953470 (= (apply!895 (+!2881 lt!429601 (tuple2!13565 lt!429605 (minValue!5659 thiss!1141))) lt!429622) (apply!895 lt!429601 lt!429622))))

(declare-fun bm!41632 () Bool)

(declare-fun call!41639 () ListLongMap!12263)

(assert (=> bm!41632 (= call!41639 (getCurrentListMapNoExtraKeys!3369 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)))))

(declare-fun b!953471 () Bool)

(declare-fun e!537055 () Bool)

(declare-fun e!537056 () Bool)

(assert (=> b!953471 (= e!537055 e!537056)))

(declare-fun res!638481 () Bool)

(assert (=> b!953471 (=> (not res!638481) (not e!537056))))

(assert (=> b!953471 (= res!638481 (contains!5253 lt!429619 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000)))))

(assert (=> b!953471 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))))))

(declare-fun b!953472 () Bool)

(declare-fun e!537058 () Bool)

(assert (=> b!953472 (= e!537058 e!537057)))

(declare-fun res!638480 () Bool)

(declare-fun call!41637 () Bool)

(assert (=> b!953472 (= res!638480 call!41637)))

(assert (=> b!953472 (=> (not res!638480) (not e!537057))))

(declare-fun bm!41633 () Bool)

(declare-fun call!41635 () ListLongMap!12263)

(declare-fun call!41634 () ListLongMap!12263)

(assert (=> bm!41633 (= call!41635 call!41634)))

(declare-fun b!953473 () Bool)

(assert (=> b!953473 (= e!537061 call!41640)))

(declare-fun b!953474 () Bool)

(declare-fun e!537066 () Bool)

(assert (=> b!953474 (= e!537066 (= (apply!895 lt!429619 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!5659 thiss!1141)))))

(declare-fun bm!41634 () Bool)

(assert (=> bm!41634 (= call!41634 call!41639)))

(declare-fun b!953475 () Bool)

(declare-fun Unit!32031 () Unit!32024)

(assert (=> b!953475 (= e!537063 Unit!32031)))

(declare-fun c!99945 () Bool)

(declare-fun c!99942 () Bool)

(declare-fun bm!41635 () Bool)

(assert (=> bm!41635 (= call!41638 (+!2881 (ite c!99942 call!41639 (ite c!99945 call!41634 call!41635)) (ite (or c!99942 c!99945) (tuple2!13565 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!5659 thiss!1141)) (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5659 thiss!1141)))))))

(declare-fun bm!41636 () Bool)

(assert (=> bm!41636 (= call!41637 (contains!5253 lt!429619 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953476 () Bool)

(declare-fun e!537059 () Bool)

(declare-fun call!41636 () Bool)

(assert (=> b!953476 (= e!537059 (not call!41636))))

(declare-fun b!953477 () Bool)

(declare-fun e!537065 () Bool)

(assert (=> b!953477 (= e!537065 (validKeyInArray!0 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953478 () Bool)

(declare-fun e!537054 () ListLongMap!12263)

(assert (=> b!953478 (= e!537054 e!537062)))

(assert (=> b!953478 (= c!99945 (and (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953479 () Bool)

(declare-fun e!537060 () Bool)

(assert (=> b!953479 (= e!537060 e!537058)))

(declare-fun c!99944 () Bool)

(assert (=> b!953479 (= c!99944 (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!953480 () Bool)

(assert (=> b!953480 (= e!537062 call!41640)))

(declare-fun b!953481 () Bool)

(declare-fun e!537064 () Bool)

(assert (=> b!953481 (= e!537064 (validKeyInArray!0 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953482 () Bool)

(assert (=> b!953482 (= e!537054 (+!2881 call!41638 (tuple2!13565 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!5659 thiss!1141))))))

(declare-fun d!115855 () Bool)

(assert (=> d!115855 e!537060))

(declare-fun res!638478 () Bool)

(assert (=> d!115855 (=> (not res!638478) (not e!537060))))

(assert (=> d!115855 (= res!638478 (or (bvsge #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))))))))

(declare-fun lt!429604 () ListLongMap!12263)

(assert (=> d!115855 (= lt!429619 lt!429604)))

(declare-fun lt!429607 () Unit!32024)

(assert (=> d!115855 (= lt!429607 e!537063)))

(declare-fun c!99943 () Bool)

(assert (=> d!115855 (= c!99943 e!537064)))

(declare-fun res!638483 () Bool)

(assert (=> d!115855 (=> (not res!638483) (not e!537064))))

(assert (=> d!115855 (= res!638483 (bvslt #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))))))

(assert (=> d!115855 (= lt!429604 e!537054)))

(assert (=> d!115855 (= c!99942 (and (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!115855 (validMask!0 (mask!27714 thiss!1141))))

(assert (=> d!115855 (= (getCurrentListMap!3380 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5823 thiss!1141)) lt!429619)))

(declare-fun b!953483 () Bool)

(assert (=> b!953483 (= e!537059 e!537066)))

(declare-fun res!638479 () Bool)

(assert (=> b!953483 (= res!638479 call!41636)))

(assert (=> b!953483 (=> (not res!638479) (not e!537066))))

(declare-fun b!953484 () Bool)

(assert (=> b!953484 (= e!537061 call!41635)))

(declare-fun b!953485 () Bool)

(declare-fun get!14588 (ValueCell!9917 V!32695) V!32695)

(declare-fun dynLambda!1678 (Int (_ BitVec 64)) V!32695)

(assert (=> b!953485 (= e!537056 (= (apply!895 lt!429619 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000)) (get!14588 (select (arr!27727 (_values!5846 thiss!1141)) #b00000000000000000000000000000000) (dynLambda!1678 (defaultEntry!5823 thiss!1141) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28207 (_values!5846 thiss!1141))))))

(assert (=> b!953485 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))))))

(declare-fun b!953486 () Bool)

(declare-fun res!638485 () Bool)

(assert (=> b!953486 (=> (not res!638485) (not e!537060))))

(assert (=> b!953486 (= res!638485 e!537059)))

(declare-fun c!99946 () Bool)

(assert (=> b!953486 (= c!99946 (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!953487 () Bool)

(declare-fun res!638482 () Bool)

(assert (=> b!953487 (=> (not res!638482) (not e!537060))))

(assert (=> b!953487 (= res!638482 e!537055)))

(declare-fun res!638477 () Bool)

(assert (=> b!953487 (=> res!638477 e!537055)))

(assert (=> b!953487 (= res!638477 (not e!537065))))

(declare-fun res!638484 () Bool)

(assert (=> b!953487 (=> (not res!638484) (not e!537065))))

(assert (=> b!953487 (= res!638484 (bvslt #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))))))

(declare-fun bm!41637 () Bool)

(assert (=> bm!41637 (= call!41636 (contains!5253 lt!429619 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!953488 () Bool)

(assert (=> b!953488 (= e!537058 (not call!41637))))

(assert (= (and d!115855 c!99942) b!953482))

(assert (= (and d!115855 (not c!99942)) b!953478))

(assert (= (and b!953478 c!99945) b!953480))

(assert (= (and b!953478 (not c!99945)) b!953469))

(assert (= (and b!953469 c!99947) b!953473))

(assert (= (and b!953469 (not c!99947)) b!953484))

(assert (= (or b!953473 b!953484) bm!41633))

(assert (= (or b!953480 bm!41633) bm!41634))

(assert (= (or b!953480 b!953473) bm!41631))

(assert (= (or b!953482 bm!41634) bm!41632))

(assert (= (or b!953482 bm!41631) bm!41635))

(assert (= (and d!115855 res!638483) b!953481))

(assert (= (and d!115855 c!99943) b!953470))

(assert (= (and d!115855 (not c!99943)) b!953475))

(assert (= (and d!115855 res!638478) b!953487))

(assert (= (and b!953487 res!638484) b!953477))

(assert (= (and b!953487 (not res!638477)) b!953471))

(assert (= (and b!953471 res!638481) b!953485))

(assert (= (and b!953487 res!638482) b!953486))

(assert (= (and b!953486 c!99946) b!953483))

(assert (= (and b!953486 (not c!99946)) b!953476))

(assert (= (and b!953483 res!638479) b!953474))

(assert (= (or b!953483 b!953476) bm!41637))

(assert (= (and b!953486 res!638485) b!953479))

(assert (= (and b!953479 c!99944) b!953472))

(assert (= (and b!953479 (not c!99944)) b!953488))

(assert (= (and b!953472 res!638480) b!953468))

(assert (= (or b!953472 b!953488) bm!41636))

(declare-fun b_lambda!14429 () Bool)

(assert (=> (not b_lambda!14429) (not b!953485)))

(declare-fun t!27703 () Bool)

(declare-fun tb!6199 () Bool)

(assert (=> (and b!953350 (= (defaultEntry!5823 thiss!1141) (defaultEntry!5823 thiss!1141)) t!27703) tb!6199))

(declare-fun result!12335 () Bool)

(assert (=> tb!6199 (= result!12335 tp_is_empty!20797)))

(assert (=> b!953485 t!27703))

(declare-fun b_and!29785 () Bool)

(assert (= b_and!29779 (and (=> t!27703 result!12335) b_and!29785)))

(declare-fun m!885987 () Bool)

(assert (=> bm!41635 m!885987))

(declare-fun m!885989 () Bool)

(assert (=> b!953485 m!885989))

(declare-fun m!885991 () Bool)

(assert (=> b!953485 m!885991))

(assert (=> b!953485 m!885989))

(assert (=> b!953485 m!885991))

(declare-fun m!885993 () Bool)

(assert (=> b!953485 m!885993))

(declare-fun m!885995 () Bool)

(assert (=> b!953485 m!885995))

(assert (=> b!953485 m!885995))

(declare-fun m!885997 () Bool)

(assert (=> b!953485 m!885997))

(declare-fun m!885999 () Bool)

(assert (=> bm!41636 m!885999))

(assert (=> b!953481 m!885995))

(assert (=> b!953481 m!885995))

(declare-fun m!886001 () Bool)

(assert (=> b!953481 m!886001))

(assert (=> b!953471 m!885995))

(assert (=> b!953471 m!885995))

(declare-fun m!886003 () Bool)

(assert (=> b!953471 m!886003))

(assert (=> d!115855 m!885907))

(declare-fun m!886005 () Bool)

(assert (=> b!953470 m!886005))

(declare-fun m!886007 () Bool)

(assert (=> b!953470 m!886007))

(declare-fun m!886009 () Bool)

(assert (=> b!953470 m!886009))

(declare-fun m!886011 () Bool)

(assert (=> b!953470 m!886011))

(declare-fun m!886013 () Bool)

(assert (=> b!953470 m!886013))

(assert (=> b!953470 m!886011))

(declare-fun m!886015 () Bool)

(assert (=> b!953470 m!886015))

(declare-fun m!886017 () Bool)

(assert (=> b!953470 m!886017))

(declare-fun m!886019 () Bool)

(assert (=> b!953470 m!886019))

(declare-fun m!886021 () Bool)

(assert (=> b!953470 m!886021))

(declare-fun m!886023 () Bool)

(assert (=> b!953470 m!886023))

(declare-fun m!886025 () Bool)

(assert (=> b!953470 m!886025))

(declare-fun m!886027 () Bool)

(assert (=> b!953470 m!886027))

(assert (=> b!953470 m!885995))

(assert (=> b!953470 m!886019))

(declare-fun m!886029 () Bool)

(assert (=> b!953470 m!886029))

(declare-fun m!886031 () Bool)

(assert (=> b!953470 m!886031))

(assert (=> b!953470 m!886005))

(assert (=> b!953470 m!886023))

(declare-fun m!886033 () Bool)

(assert (=> b!953470 m!886033))

(declare-fun m!886035 () Bool)

(assert (=> b!953470 m!886035))

(declare-fun m!886037 () Bool)

(assert (=> b!953468 m!886037))

(declare-fun m!886039 () Bool)

(assert (=> b!953482 m!886039))

(assert (=> bm!41632 m!886027))

(assert (=> b!953477 m!885995))

(assert (=> b!953477 m!885995))

(assert (=> b!953477 m!886001))

(declare-fun m!886041 () Bool)

(assert (=> b!953474 m!886041))

(declare-fun m!886043 () Bool)

(assert (=> bm!41637 m!886043))

(assert (=> b!953342 d!115855))

(declare-fun b!953499 () Bool)

(declare-fun e!537074 () Bool)

(declare-fun e!537075 () Bool)

(assert (=> b!953499 (= e!537074 e!537075)))

(declare-fun lt!429629 () (_ BitVec 64))

(assert (=> b!953499 (= lt!429629 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000))))

(declare-fun lt!429630 () Unit!32024)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57681 (_ BitVec 64) (_ BitVec 32)) Unit!32024)

(assert (=> b!953499 (= lt!429630 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10805 thiss!1141) lt!429629 #b00000000000000000000000000000000))))

(assert (=> b!953499 (arrayContainsKey!0 (_keys!10805 thiss!1141) lt!429629 #b00000000000000000000000000000000)))

(declare-fun lt!429631 () Unit!32024)

(assert (=> b!953499 (= lt!429631 lt!429630)))

(declare-fun res!638491 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57681 (_ BitVec 32)) SeekEntryResult!9118)

(assert (=> b!953499 (= res!638491 (= (seekEntryOrOpen!0 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000) (_keys!10805 thiss!1141) (mask!27714 thiss!1141)) (Found!9118 #b00000000000000000000000000000000)))))

(assert (=> b!953499 (=> (not res!638491) (not e!537075))))

(declare-fun b!953500 () Bool)

(declare-fun e!537073 () Bool)

(assert (=> b!953500 (= e!537073 e!537074)))

(declare-fun c!99950 () Bool)

(assert (=> b!953500 (= c!99950 (validKeyInArray!0 (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000)))))

(declare-fun b!953501 () Bool)

(declare-fun call!41643 () Bool)

(assert (=> b!953501 (= e!537074 call!41643)))

(declare-fun bm!41640 () Bool)

(assert (=> bm!41640 (= call!41643 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10805 thiss!1141) (mask!27714 thiss!1141)))))

(declare-fun d!115857 () Bool)

(declare-fun res!638490 () Bool)

(assert (=> d!115857 (=> res!638490 e!537073)))

(assert (=> d!115857 (= res!638490 (bvsge #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))))))

(assert (=> d!115857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)) e!537073)))

(declare-fun b!953502 () Bool)

(assert (=> b!953502 (= e!537075 call!41643)))

(assert (= (and d!115857 (not res!638490)) b!953500))

(assert (= (and b!953500 c!99950) b!953499))

(assert (= (and b!953500 (not c!99950)) b!953501))

(assert (= (and b!953499 res!638491) b!953502))

(assert (= (or b!953502 b!953501) bm!41640))

(assert (=> b!953499 m!885995))

(declare-fun m!886045 () Bool)

(assert (=> b!953499 m!886045))

(declare-fun m!886047 () Bool)

(assert (=> b!953499 m!886047))

(assert (=> b!953499 m!885995))

(declare-fun m!886049 () Bool)

(assert (=> b!953499 m!886049))

(assert (=> b!953500 m!885995))

(assert (=> b!953500 m!885995))

(assert (=> b!953500 m!886001))

(declare-fun m!886051 () Bool)

(assert (=> bm!41640 m!886051))

(assert (=> b!953347 d!115857))

(declare-fun d!115859 () Bool)

(declare-fun res!638498 () Bool)

(declare-fun e!537078 () Bool)

(assert (=> d!115859 (=> (not res!638498) (not e!537078))))

(declare-fun simpleValid!382 (LongMapFixedSize!4984) Bool)

(assert (=> d!115859 (= res!638498 (simpleValid!382 thiss!1141))))

(assert (=> d!115859 (= (valid!1904 thiss!1141) e!537078)))

(declare-fun b!953509 () Bool)

(declare-fun res!638499 () Bool)

(assert (=> b!953509 (=> (not res!638499) (not e!537078))))

(declare-fun arrayCountValidKeys!0 (array!57681 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!953509 (= res!638499 (= (arrayCountValidKeys!0 (_keys!10805 thiss!1141) #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))) (_size!2547 thiss!1141)))))

(declare-fun b!953510 () Bool)

(declare-fun res!638500 () Bool)

(assert (=> b!953510 (=> (not res!638500) (not e!537078))))

(assert (=> b!953510 (= res!638500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)))))

(declare-fun b!953511 () Bool)

(declare-datatypes ((List!19355 0))(
  ( (Nil!19352) (Cons!19351 (h!20519 (_ BitVec 64)) (t!27704 List!19355)) )
))
(declare-fun arrayNoDuplicates!0 (array!57681 (_ BitVec 32) List!19355) Bool)

(assert (=> b!953511 (= e!537078 (arrayNoDuplicates!0 (_keys!10805 thiss!1141) #b00000000000000000000000000000000 Nil!19352))))

(assert (= (and d!115859 res!638498) b!953509))

(assert (= (and b!953509 res!638499) b!953510))

(assert (= (and b!953510 res!638500) b!953511))

(declare-fun m!886053 () Bool)

(assert (=> d!115859 m!886053))

(declare-fun m!886055 () Bool)

(assert (=> b!953509 m!886055))

(assert (=> b!953510 m!885895))

(declare-fun m!886057 () Bool)

(assert (=> b!953511 m!886057))

(assert (=> start!81676 d!115859))

(declare-fun d!115861 () Bool)

(assert (=> d!115861 (= (array_inv!21596 (_keys!10805 thiss!1141)) (bvsge (size!28208 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953350 d!115861))

(declare-fun d!115863 () Bool)

(assert (=> d!115863 (= (array_inv!21597 (_values!5846 thiss!1141)) (bvsge (size!28207 (_values!5846 thiss!1141)) #b00000000000000000000000000000000))))

(assert (=> b!953350 d!115863))

(declare-fun b!953524 () Bool)

(declare-fun e!537087 () SeekEntryResult!9118)

(declare-fun lt!429640 () SeekEntryResult!9118)

(assert (=> b!953524 (= e!537087 (MissingZero!9118 (index!38845 lt!429640)))))

(declare-fun b!953525 () Bool)

(declare-fun e!537085 () SeekEntryResult!9118)

(assert (=> b!953525 (= e!537085 (Found!9118 (index!38845 lt!429640)))))

(declare-fun b!953526 () Bool)

(declare-fun c!99959 () Bool)

(declare-fun lt!429642 () (_ BitVec 64))

(assert (=> b!953526 (= c!99959 (= lt!429642 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!953526 (= e!537085 e!537087)))

(declare-fun b!953527 () Bool)

(declare-fun e!537086 () SeekEntryResult!9118)

(assert (=> b!953527 (= e!537086 e!537085)))

(assert (=> b!953527 (= lt!429642 (select (arr!27728 (_keys!10805 thiss!1141)) (index!38845 lt!429640)))))

(declare-fun c!99957 () Bool)

(assert (=> b!953527 (= c!99957 (= lt!429642 key!756))))

(declare-fun d!115865 () Bool)

(declare-fun lt!429641 () SeekEntryResult!9118)

(assert (=> d!115865 (and (or ((_ is MissingVacant!9118) lt!429641) (not ((_ is Found!9118) lt!429641)) (and (bvsge (index!38844 lt!429641) #b00000000000000000000000000000000) (bvslt (index!38844 lt!429641) (size!28208 (_keys!10805 thiss!1141))))) (not ((_ is MissingVacant!9118) lt!429641)) (or (not ((_ is Found!9118) lt!429641)) (= (select (arr!27728 (_keys!10805 thiss!1141)) (index!38844 lt!429641)) key!756)))))

(assert (=> d!115865 (= lt!429641 e!537086)))

(declare-fun c!99958 () Bool)

(assert (=> d!115865 (= c!99958 (and ((_ is Intermediate!9118) lt!429640) (undefined!9930 lt!429640)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57681 (_ BitVec 32)) SeekEntryResult!9118)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!115865 (= lt!429640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!756 (mask!27714 thiss!1141)) key!756 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)))))

(assert (=> d!115865 (validMask!0 (mask!27714 thiss!1141))))

(assert (=> d!115865 (= (seekEntry!0 key!756 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)) lt!429641)))

(declare-fun b!953528 () Bool)

(assert (=> b!953528 (= e!537086 Undefined!9118)))

(declare-fun b!953529 () Bool)

(declare-fun lt!429643 () SeekEntryResult!9118)

(assert (=> b!953529 (= e!537087 (ite ((_ is MissingVacant!9118) lt!429643) (MissingZero!9118 (index!38846 lt!429643)) lt!429643))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!57681 (_ BitVec 32)) SeekEntryResult!9118)

(assert (=> b!953529 (= lt!429643 (seekKeyOrZeroReturnVacant!0 (x!81910 lt!429640) (index!38845 lt!429640) (index!38845 lt!429640) key!756 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)))))

(assert (= (and d!115865 c!99958) b!953528))

(assert (= (and d!115865 (not c!99958)) b!953527))

(assert (= (and b!953527 c!99957) b!953525))

(assert (= (and b!953527 (not c!99957)) b!953526))

(assert (= (and b!953526 c!99959) b!953524))

(assert (= (and b!953526 (not c!99959)) b!953529))

(declare-fun m!886059 () Bool)

(assert (=> b!953527 m!886059))

(declare-fun m!886061 () Bool)

(assert (=> d!115865 m!886061))

(declare-fun m!886063 () Bool)

(assert (=> d!115865 m!886063))

(assert (=> d!115865 m!886063))

(declare-fun m!886065 () Bool)

(assert (=> d!115865 m!886065))

(assert (=> d!115865 m!885907))

(declare-fun m!886067 () Bool)

(assert (=> b!953529 m!886067))

(assert (=> b!953344 d!115865))

(declare-fun d!115867 () Bool)

(assert (=> d!115867 (= (validKeyInArray!0 key!756) (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!953340 d!115867))

(declare-fun d!115869 () Bool)

(declare-fun e!537090 () Bool)

(assert (=> d!115869 e!537090))

(declare-fun c!99962 () Bool)

(assert (=> d!115869 (= c!99962 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!429646 () Unit!32024)

(declare-fun choose!1604 (array!57681 array!57679 (_ BitVec 32) (_ BitVec 32) V!32695 V!32695 (_ BitVec 64) Int) Unit!32024)

(assert (=> d!115869 (= lt!429646 (choose!1604 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) key!756 (defaultEntry!5823 thiss!1141)))))

(assert (=> d!115869 (validMask!0 (mask!27714 thiss!1141))))

(assert (=> d!115869 (= (lemmaKeyInListMapIsInArray!332 (_keys!10805 thiss!1141) (_values!5846 thiss!1141) (mask!27714 thiss!1141) (extraKeys!5555 thiss!1141) (zeroValue!5659 thiss!1141) (minValue!5659 thiss!1141) key!756 (defaultEntry!5823 thiss!1141)) lt!429646)))

(declare-fun b!953534 () Bool)

(assert (=> b!953534 (= e!537090 (arrayContainsKey!0 (_keys!10805 thiss!1141) key!756 #b00000000000000000000000000000000))))

(declare-fun b!953535 () Bool)

(assert (=> b!953535 (= e!537090 (ite (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5555 thiss!1141) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!115869 c!99962) b!953534))

(assert (= (and d!115869 (not c!99962)) b!953535))

(declare-fun m!886069 () Bool)

(assert (=> d!115869 m!886069))

(assert (=> d!115869 m!885907))

(assert (=> b!953534 m!885911))

(assert (=> b!953346 d!115869))

(declare-fun d!115871 () Bool)

(declare-fun lt!429649 () (_ BitVec 32))

(assert (=> d!115871 (and (or (bvslt lt!429649 #b00000000000000000000000000000000) (bvsge lt!429649 (size!28208 (_keys!10805 thiss!1141))) (and (bvsge lt!429649 #b00000000000000000000000000000000) (bvslt lt!429649 (size!28208 (_keys!10805 thiss!1141))))) (bvsge lt!429649 #b00000000000000000000000000000000) (bvslt lt!429649 (size!28208 (_keys!10805 thiss!1141))) (= (select (arr!27728 (_keys!10805 thiss!1141)) lt!429649) key!756))))

(declare-fun e!537093 () (_ BitVec 32))

(assert (=> d!115871 (= lt!429649 e!537093)))

(declare-fun c!99965 () Bool)

(assert (=> d!115871 (= c!99965 (= (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!28208 (_keys!10805 thiss!1141))) (bvslt (size!28208 (_keys!10805 thiss!1141)) #b01111111111111111111111111111111))))

(assert (=> d!115871 (= (arrayScanForKey!0 (_keys!10805 thiss!1141) key!756 #b00000000000000000000000000000000) lt!429649)))

(declare-fun b!953540 () Bool)

(assert (=> b!953540 (= e!537093 #b00000000000000000000000000000000)))

(declare-fun b!953541 () Bool)

(assert (=> b!953541 (= e!537093 (arrayScanForKey!0 (_keys!10805 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115871 c!99965) b!953540))

(assert (= (and d!115871 (not c!99965)) b!953541))

(declare-fun m!886071 () Bool)

(assert (=> d!115871 m!886071))

(assert (=> d!115871 m!885995))

(declare-fun m!886073 () Bool)

(assert (=> b!953541 m!886073))

(assert (=> b!953346 d!115871))

(declare-fun d!115873 () Bool)

(assert (=> d!115873 (= (validMask!0 (mask!27714 thiss!1141)) (and (or (= (mask!27714 thiss!1141) #b00000000000000000000000000000111) (= (mask!27714 thiss!1141) #b00000000000000000000000000001111) (= (mask!27714 thiss!1141) #b00000000000000000000000000011111) (= (mask!27714 thiss!1141) #b00000000000000000000000000111111) (= (mask!27714 thiss!1141) #b00000000000000000000000001111111) (= (mask!27714 thiss!1141) #b00000000000000000000000011111111) (= (mask!27714 thiss!1141) #b00000000000000000000000111111111) (= (mask!27714 thiss!1141) #b00000000000000000000001111111111) (= (mask!27714 thiss!1141) #b00000000000000000000011111111111) (= (mask!27714 thiss!1141) #b00000000000000000000111111111111) (= (mask!27714 thiss!1141) #b00000000000000000001111111111111) (= (mask!27714 thiss!1141) #b00000000000000000011111111111111) (= (mask!27714 thiss!1141) #b00000000000000000111111111111111) (= (mask!27714 thiss!1141) #b00000000000000001111111111111111) (= (mask!27714 thiss!1141) #b00000000000000011111111111111111) (= (mask!27714 thiss!1141) #b00000000000000111111111111111111) (= (mask!27714 thiss!1141) #b00000000000001111111111111111111) (= (mask!27714 thiss!1141) #b00000000000011111111111111111111) (= (mask!27714 thiss!1141) #b00000000000111111111111111111111) (= (mask!27714 thiss!1141) #b00000000001111111111111111111111) (= (mask!27714 thiss!1141) #b00000000011111111111111111111111) (= (mask!27714 thiss!1141) #b00000000111111111111111111111111) (= (mask!27714 thiss!1141) #b00000001111111111111111111111111) (= (mask!27714 thiss!1141) #b00000011111111111111111111111111) (= (mask!27714 thiss!1141) #b00000111111111111111111111111111) (= (mask!27714 thiss!1141) #b00001111111111111111111111111111) (= (mask!27714 thiss!1141) #b00011111111111111111111111111111) (= (mask!27714 thiss!1141) #b00111111111111111111111111111111)) (bvsle (mask!27714 thiss!1141) #b00111111111111111111111111111111)))))

(assert (=> b!953346 d!115873))

(declare-fun d!115875 () Bool)

(assert (=> d!115875 (arrayForallSeekEntryOrOpenFound!0 lt!429525 (_keys!10805 thiss!1141) (mask!27714 thiss!1141))))

(declare-fun lt!429652 () Unit!32024)

(declare-fun choose!38 (array!57681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!32024)

(assert (=> d!115875 (= lt!429652 (choose!38 (_keys!10805 thiss!1141) (mask!27714 thiss!1141) #b00000000000000000000000000000000 lt!429525))))

(assert (=> d!115875 (validMask!0 (mask!27714 thiss!1141))))

(assert (=> d!115875 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!10805 thiss!1141) (mask!27714 thiss!1141) #b00000000000000000000000000000000 lt!429525) lt!429652)))

(declare-fun bs!26776 () Bool)

(assert (= bs!26776 d!115875))

(assert (=> bs!26776 m!885903))

(declare-fun m!886075 () Bool)

(assert (=> bs!26776 m!886075))

(assert (=> bs!26776 m!885907))

(assert (=> b!953346 d!115875))

(declare-fun b!953542 () Bool)

(declare-fun e!537095 () Bool)

(declare-fun e!537096 () Bool)

(assert (=> b!953542 (= e!537095 e!537096)))

(declare-fun lt!429653 () (_ BitVec 64))

(assert (=> b!953542 (= lt!429653 (select (arr!27728 (_keys!10805 thiss!1141)) lt!429525))))

(declare-fun lt!429654 () Unit!32024)

(assert (=> b!953542 (= lt!429654 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10805 thiss!1141) lt!429653 lt!429525))))

(assert (=> b!953542 (arrayContainsKey!0 (_keys!10805 thiss!1141) lt!429653 #b00000000000000000000000000000000)))

(declare-fun lt!429655 () Unit!32024)

(assert (=> b!953542 (= lt!429655 lt!429654)))

(declare-fun res!638502 () Bool)

(assert (=> b!953542 (= res!638502 (= (seekEntryOrOpen!0 (select (arr!27728 (_keys!10805 thiss!1141)) lt!429525) (_keys!10805 thiss!1141) (mask!27714 thiss!1141)) (Found!9118 lt!429525)))))

(assert (=> b!953542 (=> (not res!638502) (not e!537096))))

(declare-fun b!953543 () Bool)

(declare-fun e!537094 () Bool)

(assert (=> b!953543 (= e!537094 e!537095)))

(declare-fun c!99966 () Bool)

(assert (=> b!953543 (= c!99966 (validKeyInArray!0 (select (arr!27728 (_keys!10805 thiss!1141)) lt!429525)))))

(declare-fun b!953544 () Bool)

(declare-fun call!41644 () Bool)

(assert (=> b!953544 (= e!537095 call!41644)))

(declare-fun bm!41641 () Bool)

(assert (=> bm!41641 (= call!41644 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!429525 #b00000000000000000000000000000001) (_keys!10805 thiss!1141) (mask!27714 thiss!1141)))))

(declare-fun d!115877 () Bool)

(declare-fun res!638501 () Bool)

(assert (=> d!115877 (=> res!638501 e!537094)))

(assert (=> d!115877 (= res!638501 (bvsge lt!429525 (size!28208 (_keys!10805 thiss!1141))))))

(assert (=> d!115877 (= (arrayForallSeekEntryOrOpenFound!0 lt!429525 (_keys!10805 thiss!1141) (mask!27714 thiss!1141)) e!537094)))

(declare-fun b!953545 () Bool)

(assert (=> b!953545 (= e!537096 call!41644)))

(assert (= (and d!115877 (not res!638501)) b!953543))

(assert (= (and b!953543 c!99966) b!953542))

(assert (= (and b!953543 (not c!99966)) b!953544))

(assert (= (and b!953542 res!638502) b!953545))

(assert (= (or b!953545 b!953544) bm!41641))

(declare-fun m!886077 () Bool)

(assert (=> b!953542 m!886077))

(declare-fun m!886079 () Bool)

(assert (=> b!953542 m!886079))

(declare-fun m!886081 () Bool)

(assert (=> b!953542 m!886081))

(assert (=> b!953542 m!886077))

(declare-fun m!886083 () Bool)

(assert (=> b!953542 m!886083))

(assert (=> b!953543 m!886077))

(assert (=> b!953543 m!886077))

(declare-fun m!886085 () Bool)

(assert (=> b!953543 m!886085))

(declare-fun m!886087 () Bool)

(assert (=> bm!41641 m!886087))

(assert (=> b!953346 d!115877))

(declare-fun d!115879 () Bool)

(declare-fun res!638507 () Bool)

(declare-fun e!537101 () Bool)

(assert (=> d!115879 (=> res!638507 e!537101)))

(assert (=> d!115879 (= res!638507 (= (select (arr!27728 (_keys!10805 thiss!1141)) #b00000000000000000000000000000000) key!756))))

(assert (=> d!115879 (= (arrayContainsKey!0 (_keys!10805 thiss!1141) key!756 #b00000000000000000000000000000000) e!537101)))

(declare-fun b!953550 () Bool)

(declare-fun e!537102 () Bool)

(assert (=> b!953550 (= e!537101 e!537102)))

(declare-fun res!638508 () Bool)

(assert (=> b!953550 (=> (not res!638508) (not e!537102))))

(assert (=> b!953550 (= res!638508 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!28208 (_keys!10805 thiss!1141))))))

(declare-fun b!953551 () Bool)

(assert (=> b!953551 (= e!537102 (arrayContainsKey!0 (_keys!10805 thiss!1141) key!756 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!115879 (not res!638507)) b!953550))

(assert (= (and b!953550 res!638508) b!953551))

(assert (=> d!115879 m!885995))

(declare-fun m!886089 () Bool)

(assert (=> b!953551 m!886089))

(assert (=> b!953346 d!115879))

(declare-fun condMapEmpty!33142 () Bool)

(declare-fun mapDefault!33142 () ValueCell!9917)

(assert (=> mapNonEmpty!33133 (= condMapEmpty!33142 (= mapRest!33133 ((as const (Array (_ BitVec 32) ValueCell!9917)) mapDefault!33142)))))

(declare-fun e!537108 () Bool)

(declare-fun mapRes!33142 () Bool)

(assert (=> mapNonEmpty!33133 (= tp!63489 (and e!537108 mapRes!33142))))

(declare-fun b!953558 () Bool)

(declare-fun e!537107 () Bool)

(assert (=> b!953558 (= e!537107 tp_is_empty!20797)))

(declare-fun mapNonEmpty!33142 () Bool)

(declare-fun tp!63505 () Bool)

(assert (=> mapNonEmpty!33142 (= mapRes!33142 (and tp!63505 e!537107))))

(declare-fun mapKey!33142 () (_ BitVec 32))

(declare-fun mapRest!33142 () (Array (_ BitVec 32) ValueCell!9917))

(declare-fun mapValue!33142 () ValueCell!9917)

(assert (=> mapNonEmpty!33142 (= mapRest!33133 (store mapRest!33142 mapKey!33142 mapValue!33142))))

(declare-fun mapIsEmpty!33142 () Bool)

(assert (=> mapIsEmpty!33142 mapRes!33142))

(declare-fun b!953559 () Bool)

(assert (=> b!953559 (= e!537108 tp_is_empty!20797)))

(assert (= (and mapNonEmpty!33133 condMapEmpty!33142) mapIsEmpty!33142))

(assert (= (and mapNonEmpty!33133 (not condMapEmpty!33142)) mapNonEmpty!33142))

(assert (= (and mapNonEmpty!33142 ((_ is ValueCellFull!9917) mapValue!33142)) b!953558))

(assert (= (and mapNonEmpty!33133 ((_ is ValueCellFull!9917) mapDefault!33142)) b!953559))

(declare-fun m!886091 () Bool)

(assert (=> mapNonEmpty!33142 m!886091))

(declare-fun b_lambda!14431 () Bool)

(assert (= b_lambda!14429 (or (and b!953350 b_free!18289) b_lambda!14431)))

(check-sat (not b_next!18289) (not b!953471) (not bm!41635) (not d!115865) (not b!953468) (not b!953423) (not b!953509) (not b!953499) (not d!115855) (not bm!41632) (not b!953482) (not b!953470) (not b!953543) (not d!115853) (not b!953529) tp_is_empty!20797 (not d!115859) (not b!953534) (not bm!41640) (not bm!41637) (not mapNonEmpty!33142) (not b!953541) (not b_lambda!14431) (not bm!41636) b_and!29785 (not b!953551) (not b!953481) (not b!953511) (not b!953485) (not b!953500) (not b!953542) (not d!115875) (not b!953477) (not b!953510) (not bm!41641) (not b!953474) (not d!115869) (not b!953425))
(check-sat b_and!29785 (not b_next!18289))
