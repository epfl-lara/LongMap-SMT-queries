; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21936 () Bool)

(assert start!21936)

(declare-fun b!223614 () Bool)

(declare-fun b_free!6003 () Bool)

(declare-fun b_next!6003 () Bool)

(assert (=> b!223614 (= b_free!6003 (not b_next!6003))))

(declare-fun tp!21151 () Bool)

(declare-fun b_and!12901 () Bool)

(assert (=> b!223614 (= tp!21151 b_and!12901)))

(declare-datatypes ((SeekEntryResult!850 0))(
  ( (MissingZero!850 (index!5570 (_ BitVec 32))) (Found!850 (index!5571 (_ BitVec 32))) (Intermediate!850 (undefined!1662 Bool) (index!5572 (_ BitVec 32)) (x!23102 (_ BitVec 32))) (Undefined!850) (MissingVacant!850 (index!5573 (_ BitVec 32))) )
))
(declare-fun lt!112947 () SeekEntryResult!850)

(declare-fun call!20844 () Bool)

(declare-datatypes ((V!7467 0))(
  ( (V!7468 (val!2977 Int)) )
))
(declare-datatypes ((ValueCell!2589 0))(
  ( (ValueCellFull!2589 (v!4997 V!7467)) (EmptyCell!2589) )
))
(declare-datatypes ((array!10973 0))(
  ( (array!10974 (arr!5206 (Array (_ BitVec 32) ValueCell!2589)) (size!5539 (_ BitVec 32))) )
))
(declare-datatypes ((array!10975 0))(
  ( (array!10976 (arr!5207 (Array (_ BitVec 32) (_ BitVec 64))) (size!5540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3078 0))(
  ( (LongMapFixedSize!3079 (defaultEntry!4198 Int) (mask!10026 (_ BitVec 32)) (extraKeys!3935 (_ BitVec 32)) (zeroValue!4039 V!7467) (minValue!4039 V!7467) (_size!1588 (_ BitVec 32)) (_keys!6252 array!10975) (_values!4181 array!10973) (_vacant!1588 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3078)

(declare-fun bm!20840 () Bool)

(declare-fun c!37116 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!20840 (= call!20844 (inRange!0 (ite c!37116 (index!5570 lt!112947) (index!5573 lt!112947)) (mask!10026 thiss!1504)))))

(declare-fun b!223605 () Bool)

(declare-fun e!145252 () Bool)

(declare-fun call!20843 () Bool)

(assert (=> b!223605 (= e!145252 (not call!20843))))

(declare-fun b!223606 () Bool)

(declare-fun e!145236 () Bool)

(assert (=> b!223606 (= e!145236 false)))

(declare-fun lt!112946 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((List!3323 0))(
  ( (Nil!3320) (Cons!3319 (h!3967 (_ BitVec 64)) (t!8282 List!3323)) )
))
(declare-fun contains!1543 (List!3323 (_ BitVec 64)) Bool)

(assert (=> b!223606 (= lt!112946 (contains!1543 Nil!3320 key!932))))

(declare-fun b!223607 () Bool)

(declare-fun res!109915 () Bool)

(assert (=> b!223607 (=> (not res!109915) (not e!145236))))

(assert (=> b!223607 (= res!109915 (not (contains!1543 Nil!3320 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223608 () Bool)

(declare-fun e!145251 () Bool)

(assert (=> b!223608 (= e!145251 (not call!20843))))

(declare-fun b!223609 () Bool)

(declare-fun res!109914 () Bool)

(assert (=> b!223609 (=> (not res!109914) (not e!145236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223609 (= res!109914 (validKeyInArray!0 key!932))))

(declare-fun b!223610 () Bool)

(declare-fun e!145247 () Bool)

(declare-fun tp_is_empty!5865 () Bool)

(assert (=> b!223610 (= e!145247 tp_is_empty!5865)))

(declare-fun b!223611 () Bool)

(declare-fun res!109921 () Bool)

(assert (=> b!223611 (=> (not res!109921) (not e!145236))))

(declare-fun lt!112944 () Bool)

(assert (=> b!223611 (= res!109921 (not lt!112944))))

(declare-fun b!223612 () Bool)

(declare-datatypes ((Unit!6721 0))(
  ( (Unit!6722) )
))
(declare-fun e!145239 () Unit!6721)

(declare-fun lt!112945 () Unit!6721)

(assert (=> b!223612 (= e!145239 lt!112945)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!245 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7467 V!7467 (_ BitVec 64) Int) Unit!6721)

(assert (=> b!223612 (= lt!112945 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!245 (_keys!6252 thiss!1504) (_values!4181 thiss!1504) (mask!10026 thiss!1504) (extraKeys!3935 thiss!1504) (zeroValue!4039 thiss!1504) (minValue!4039 thiss!1504) key!932 (defaultEntry!4198 thiss!1504)))))

(get-info :version)

(assert (=> b!223612 (= c!37116 ((_ is MissingZero!850) lt!112947))))

(declare-fun e!145241 () Bool)

(assert (=> b!223612 e!145241))

(declare-fun b!223613 () Bool)

(declare-fun e!145243 () Bool)

(declare-fun e!145248 () Bool)

(declare-fun mapRes!9967 () Bool)

(assert (=> b!223613 (= e!145243 (and e!145248 mapRes!9967))))

(declare-fun condMapEmpty!9967 () Bool)

(declare-fun mapDefault!9967 () ValueCell!2589)

(assert (=> b!223613 (= condMapEmpty!9967 (= (arr!5206 (_values!4181 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2589)) mapDefault!9967)))))

(declare-fun e!145249 () Bool)

(declare-fun array_inv!3445 (array!10975) Bool)

(declare-fun array_inv!3446 (array!10973) Bool)

(assert (=> b!223614 (= e!145249 (and tp!21151 tp_is_empty!5865 (array_inv!3445 (_keys!6252 thiss!1504)) (array_inv!3446 (_values!4181 thiss!1504)) e!145243))))

(declare-fun b!223616 () Bool)

(declare-fun e!145246 () Bool)

(assert (=> b!223616 (= e!145246 ((_ is Undefined!850) lt!112947))))

(declare-fun b!223617 () Bool)

(declare-fun res!109919 () Bool)

(assert (=> b!223617 (=> (not res!109919) (not e!145251))))

(assert (=> b!223617 (= res!109919 (= (select (arr!5207 (_keys!6252 thiss!1504)) (index!5570 lt!112947)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!223618 () Bool)

(declare-fun res!109923 () Bool)

(assert (=> b!223618 (=> (not res!109923) (not e!145251))))

(assert (=> b!223618 (= res!109923 call!20844)))

(assert (=> b!223618 (= e!145241 e!145251)))

(declare-fun b!223619 () Bool)

(declare-fun e!145244 () Bool)

(assert (=> b!223619 (= e!145244 (contains!1543 Nil!3320 key!932))))

(declare-fun b!223620 () Bool)

(declare-fun e!145242 () Bool)

(declare-fun e!145253 () Bool)

(assert (=> b!223620 (= e!145242 e!145253)))

(declare-fun res!109922 () Bool)

(assert (=> b!223620 (=> (not res!109922) (not e!145253))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223620 (= res!109922 (inRange!0 index!297 (mask!10026 thiss!1504)))))

(declare-fun lt!112942 () Unit!6721)

(assert (=> b!223620 (= lt!112942 e!145239)))

(declare-fun c!37113 () Bool)

(declare-datatypes ((tuple2!4414 0))(
  ( (tuple2!4415 (_1!2218 (_ BitVec 64)) (_2!2218 V!7467)) )
))
(declare-datatypes ((List!3324 0))(
  ( (Nil!3321) (Cons!3320 (h!3968 tuple2!4414) (t!8283 List!3324)) )
))
(declare-datatypes ((ListLongMap!3327 0))(
  ( (ListLongMap!3328 (toList!1679 List!3324)) )
))
(declare-fun contains!1544 (ListLongMap!3327 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1207 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7467 V!7467 (_ BitVec 32) Int) ListLongMap!3327)

(assert (=> b!223620 (= c!37113 (contains!1544 (getCurrentListMap!1207 (_keys!6252 thiss!1504) (_values!4181 thiss!1504) (mask!10026 thiss!1504) (extraKeys!3935 thiss!1504) (zeroValue!4039 thiss!1504) (minValue!4039 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4198 thiss!1504)) key!932))))

(declare-fun b!223621 () Bool)

(declare-fun c!37114 () Bool)

(assert (=> b!223621 (= c!37114 ((_ is MissingVacant!850) lt!112947))))

(assert (=> b!223621 (= e!145241 e!145246)))

(declare-fun b!223622 () Bool)

(declare-fun res!109916 () Bool)

(assert (=> b!223622 (=> (not res!109916) (not e!145236))))

(assert (=> b!223622 (= res!109916 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5540 (_keys!6252 thiss!1504)))))))

(declare-fun bm!20841 () Bool)

(declare-fun arrayContainsKey!0 (array!10975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20841 (= call!20843 (arrayContainsKey!0 (_keys!6252 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223623 () Bool)

(declare-fun e!145238 () Unit!6721)

(declare-fun Unit!6723 () Unit!6721)

(assert (=> b!223623 (= e!145238 Unit!6723)))

(declare-fun b!223624 () Bool)

(assert (=> b!223624 (= e!145248 tp_is_empty!5865)))

(declare-fun b!223625 () Bool)

(assert (=> b!223625 (= e!145246 e!145252)))

(declare-fun res!109912 () Bool)

(assert (=> b!223625 (= res!109912 call!20844)))

(assert (=> b!223625 (=> (not res!109912) (not e!145252))))

(declare-fun b!223626 () Bool)

(declare-fun e!145240 () Bool)

(assert (=> b!223626 (= e!145240 e!145242)))

(declare-fun res!109929 () Bool)

(assert (=> b!223626 (=> (not res!109929) (not e!145242))))

(assert (=> b!223626 (= res!109929 (or (= lt!112947 (MissingZero!850 index!297)) (= lt!112947 (MissingVacant!850 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10975 (_ BitVec 32)) SeekEntryResult!850)

(assert (=> b!223626 (= lt!112947 (seekEntryOrOpen!0 key!932 (_keys!6252 thiss!1504) (mask!10026 thiss!1504)))))

(declare-fun mapIsEmpty!9967 () Bool)

(assert (=> mapIsEmpty!9967 mapRes!9967))

(declare-fun b!223627 () Bool)

(declare-fun Unit!6724 () Unit!6721)

(assert (=> b!223627 (= e!145239 Unit!6724)))

(declare-fun lt!112949 () Unit!6721)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!234 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7467 V!7467 (_ BitVec 64) Int) Unit!6721)

(assert (=> b!223627 (= lt!112949 (lemmaInListMapThenSeekEntryOrOpenFindsIt!234 (_keys!6252 thiss!1504) (_values!4181 thiss!1504) (mask!10026 thiss!1504) (extraKeys!3935 thiss!1504) (zeroValue!4039 thiss!1504) (minValue!4039 thiss!1504) key!932 (defaultEntry!4198 thiss!1504)))))

(assert (=> b!223627 false))

(declare-fun b!223628 () Bool)

(declare-fun res!109918 () Bool)

(assert (=> b!223628 (=> (not res!109918) (not e!145240))))

(assert (=> b!223628 (= res!109918 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!223629 () Bool)

(declare-fun res!109924 () Bool)

(assert (=> b!223629 (=> (not res!109924) (not e!145236))))

(declare-fun e!145250 () Bool)

(assert (=> b!223629 (= res!109924 e!145250)))

(declare-fun res!109913 () Bool)

(assert (=> b!223629 (=> res!109913 e!145250)))

(assert (=> b!223629 (= res!109913 e!145244)))

(declare-fun res!109930 () Bool)

(assert (=> b!223629 (=> (not res!109930) (not e!145244))))

(assert (=> b!223629 (= res!109930 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223630 () Bool)

(declare-fun Unit!6725 () Unit!6721)

(assert (=> b!223630 (= e!145238 Unit!6725)))

(declare-fun lt!112948 () Unit!6721)

(declare-fun lemmaArrayContainsKeyThenInListMap!73 (array!10975 array!10973 (_ BitVec 32) (_ BitVec 32) V!7467 V!7467 (_ BitVec 64) (_ BitVec 32) Int) Unit!6721)

(assert (=> b!223630 (= lt!112948 (lemmaArrayContainsKeyThenInListMap!73 (_keys!6252 thiss!1504) (_values!4181 thiss!1504) (mask!10026 thiss!1504) (extraKeys!3935 thiss!1504) (zeroValue!4039 thiss!1504) (minValue!4039 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4198 thiss!1504)))))

(assert (=> b!223630 false))

(declare-fun b!223631 () Bool)

(declare-fun res!109926 () Bool)

(assert (=> b!223631 (=> (not res!109926) (not e!145236))))

(declare-fun arrayNoDuplicates!0 (array!10975 (_ BitVec 32) List!3323) Bool)

(assert (=> b!223631 (= res!109926 (arrayNoDuplicates!0 (_keys!6252 thiss!1504) #b00000000000000000000000000000000 Nil!3320))))

(declare-fun b!223632 () Bool)

(declare-fun res!109917 () Bool)

(assert (=> b!223632 (= res!109917 (= (select (arr!5207 (_keys!6252 thiss!1504)) (index!5573 lt!112947)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223632 (=> (not res!109917) (not e!145252))))

(declare-fun res!109920 () Bool)

(assert (=> start!21936 (=> (not res!109920) (not e!145240))))

(declare-fun valid!1240 (LongMapFixedSize!3078) Bool)

(assert (=> start!21936 (= res!109920 (valid!1240 thiss!1504))))

(assert (=> start!21936 e!145240))

(assert (=> start!21936 e!145249))

(assert (=> start!21936 true))

(declare-fun b!223615 () Bool)

(declare-fun res!109911 () Bool)

(assert (=> b!223615 (=> (not res!109911) (not e!145236))))

(declare-fun noDuplicate!79 (List!3323) Bool)

(assert (=> b!223615 (= res!109911 (noDuplicate!79 Nil!3320))))

(declare-fun b!223633 () Bool)

(declare-fun e!145245 () Bool)

(assert (=> b!223633 (= e!145245 (not (contains!1543 Nil!3320 key!932)))))

(declare-fun b!223634 () Bool)

(declare-fun res!109925 () Bool)

(assert (=> b!223634 (=> (not res!109925) (not e!145236))))

(assert (=> b!223634 (= res!109925 (not (contains!1543 Nil!3320 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!9967 () Bool)

(declare-fun tp!21150 () Bool)

(assert (=> mapNonEmpty!9967 (= mapRes!9967 (and tp!21150 e!145247))))

(declare-fun mapKey!9967 () (_ BitVec 32))

(declare-fun mapValue!9967 () ValueCell!2589)

(declare-fun mapRest!9967 () (Array (_ BitVec 32) ValueCell!2589))

(assert (=> mapNonEmpty!9967 (= (arr!5206 (_values!4181 thiss!1504)) (store mapRest!9967 mapKey!9967 mapValue!9967))))

(declare-fun b!223635 () Bool)

(assert (=> b!223635 (= e!145250 e!145245)))

(declare-fun res!109928 () Bool)

(assert (=> b!223635 (=> (not res!109928) (not e!145245))))

(assert (=> b!223635 (= res!109928 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223636 () Bool)

(assert (=> b!223636 (= e!145253 e!145236)))

(declare-fun res!109927 () Bool)

(assert (=> b!223636 (=> (not res!109927) (not e!145236))))

(assert (=> b!223636 (= res!109927 (and (bvslt (size!5540 (_keys!6252 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5540 (_keys!6252 thiss!1504)))))))

(declare-fun lt!112943 () Unit!6721)

(assert (=> b!223636 (= lt!112943 e!145238)))

(declare-fun c!37115 () Bool)

(assert (=> b!223636 (= c!37115 lt!112944)))

(assert (=> b!223636 (= lt!112944 (arrayContainsKey!0 (_keys!6252 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!21936 res!109920) b!223628))

(assert (= (and b!223628 res!109918) b!223626))

(assert (= (and b!223626 res!109929) b!223620))

(assert (= (and b!223620 c!37113) b!223627))

(assert (= (and b!223620 (not c!37113)) b!223612))

(assert (= (and b!223612 c!37116) b!223618))

(assert (= (and b!223612 (not c!37116)) b!223621))

(assert (= (and b!223618 res!109923) b!223617))

(assert (= (and b!223617 res!109919) b!223608))

(assert (= (and b!223621 c!37114) b!223625))

(assert (= (and b!223621 (not c!37114)) b!223616))

(assert (= (and b!223625 res!109912) b!223632))

(assert (= (and b!223632 res!109917) b!223605))

(assert (= (or b!223618 b!223625) bm!20840))

(assert (= (or b!223608 b!223605) bm!20841))

(assert (= (and b!223620 res!109922) b!223636))

(assert (= (and b!223636 c!37115) b!223630))

(assert (= (and b!223636 (not c!37115)) b!223623))

(assert (= (and b!223636 res!109927) b!223615))

(assert (= (and b!223615 res!109911) b!223607))

(assert (= (and b!223607 res!109915) b!223634))

(assert (= (and b!223634 res!109925) b!223629))

(assert (= (and b!223629 res!109930) b!223619))

(assert (= (and b!223629 (not res!109913)) b!223635))

(assert (= (and b!223635 res!109928) b!223633))

(assert (= (and b!223629 res!109924) b!223631))

(assert (= (and b!223631 res!109926) b!223622))

(assert (= (and b!223622 res!109916) b!223609))

(assert (= (and b!223609 res!109914) b!223611))

(assert (= (and b!223611 res!109921) b!223606))

(assert (= (and b!223613 condMapEmpty!9967) mapIsEmpty!9967))

(assert (= (and b!223613 (not condMapEmpty!9967)) mapNonEmpty!9967))

(assert (= (and mapNonEmpty!9967 ((_ is ValueCellFull!2589) mapValue!9967)) b!223610))

(assert (= (and b!223613 ((_ is ValueCellFull!2589) mapDefault!9967)) b!223624))

(assert (= b!223614 b!223613))

(assert (= start!21936 b!223614))

(declare-fun m!247079 () Bool)

(assert (=> start!21936 m!247079))

(declare-fun m!247081 () Bool)

(assert (=> b!223620 m!247081))

(declare-fun m!247083 () Bool)

(assert (=> b!223620 m!247083))

(assert (=> b!223620 m!247083))

(declare-fun m!247085 () Bool)

(assert (=> b!223620 m!247085))

(declare-fun m!247087 () Bool)

(assert (=> b!223607 m!247087))

(declare-fun m!247089 () Bool)

(assert (=> b!223632 m!247089))

(declare-fun m!247091 () Bool)

(assert (=> b!223630 m!247091))

(declare-fun m!247093 () Bool)

(assert (=> b!223619 m!247093))

(declare-fun m!247095 () Bool)

(assert (=> b!223634 m!247095))

(declare-fun m!247097 () Bool)

(assert (=> bm!20840 m!247097))

(declare-fun m!247099 () Bool)

(assert (=> b!223626 m!247099))

(assert (=> b!223633 m!247093))

(declare-fun m!247101 () Bool)

(assert (=> b!223609 m!247101))

(declare-fun m!247103 () Bool)

(assert (=> b!223627 m!247103))

(declare-fun m!247105 () Bool)

(assert (=> b!223636 m!247105))

(assert (=> bm!20841 m!247105))

(declare-fun m!247107 () Bool)

(assert (=> b!223614 m!247107))

(declare-fun m!247109 () Bool)

(assert (=> b!223614 m!247109))

(declare-fun m!247111 () Bool)

(assert (=> mapNonEmpty!9967 m!247111))

(declare-fun m!247113 () Bool)

(assert (=> b!223612 m!247113))

(declare-fun m!247115 () Bool)

(assert (=> b!223617 m!247115))

(declare-fun m!247117 () Bool)

(assert (=> b!223615 m!247117))

(assert (=> b!223606 m!247093))

(declare-fun m!247119 () Bool)

(assert (=> b!223631 m!247119))

(check-sat (not b!223607) (not b!223614) (not b!223633) tp_is_empty!5865 (not bm!20840) (not b!223634) (not b!223609) (not b!223612) (not b!223626) (not b!223627) (not b!223615) (not bm!20841) b_and!12901 (not mapNonEmpty!9967) (not start!21936) (not b!223631) (not b!223636) (not b!223619) (not b!223620) (not b!223606) (not b_next!6003) (not b!223630))
(check-sat b_and!12901 (not b_next!6003))
