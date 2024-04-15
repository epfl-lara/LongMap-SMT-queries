; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21950 () Bool)

(assert start!21950)

(declare-fun b!223966 () Bool)

(declare-fun b_free!6013 () Bool)

(declare-fun b_next!6013 () Bool)

(assert (=> b!223966 (= b_free!6013 (not b_next!6013))))

(declare-fun tp!21180 () Bool)

(declare-fun b_and!12885 () Bool)

(assert (=> b!223966 (= tp!21180 b_and!12885)))

(declare-fun bm!20846 () Bool)

(declare-fun call!20849 () Bool)

(declare-datatypes ((V!7481 0))(
  ( (V!7482 (val!2982 Int)) )
))
(declare-datatypes ((ValueCell!2594 0))(
  ( (ValueCellFull!2594 (v!4996 V!7481)) (EmptyCell!2594) )
))
(declare-datatypes ((array!10985 0))(
  ( (array!10986 (arr!5211 (Array (_ BitVec 32) ValueCell!2594)) (size!5545 (_ BitVec 32))) )
))
(declare-datatypes ((array!10987 0))(
  ( (array!10988 (arr!5212 (Array (_ BitVec 32) (_ BitVec 64))) (size!5546 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3088 0))(
  ( (LongMapFixedSize!3089 (defaultEntry!4203 Int) (mask!10034 (_ BitVec 32)) (extraKeys!3940 (_ BitVec 32)) (zeroValue!4044 V!7481) (minValue!4044 V!7481) (_size!1593 (_ BitVec 32)) (_keys!6256 array!10987) (_values!4186 array!10985) (_vacant!1593 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3088)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!10987 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20846 (= call!20849 (arrayContainsKey!0 (_keys!6256 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223938 () Bool)

(declare-fun res!110122 () Bool)

(declare-fun e!145405 () Bool)

(assert (=> b!223938 (=> (not res!110122) (not e!145405))))

(assert (=> b!223938 (= res!110122 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!110127 () Bool)

(assert (=> start!21950 (=> (not res!110127) (not e!145405))))

(declare-fun valid!1258 (LongMapFixedSize!3088) Bool)

(assert (=> start!21950 (= res!110127 (valid!1258 thiss!1504))))

(assert (=> start!21950 e!145405))

(declare-fun e!145411 () Bool)

(assert (=> start!21950 e!145411))

(assert (=> start!21950 true))

(declare-fun mapNonEmpty!9982 () Bool)

(declare-fun mapRes!9982 () Bool)

(declare-fun tp!21181 () Bool)

(declare-fun e!145416 () Bool)

(assert (=> mapNonEmpty!9982 (= mapRes!9982 (and tp!21181 e!145416))))

(declare-fun mapValue!9982 () ValueCell!2594)

(declare-fun mapRest!9982 () (Array (_ BitVec 32) ValueCell!2594))

(declare-fun mapKey!9982 () (_ BitVec 32))

(assert (=> mapNonEmpty!9982 (= (arr!5211 (_values!4186 thiss!1504)) (store mapRest!9982 mapKey!9982 mapValue!9982))))

(declare-fun b!223939 () Bool)

(declare-fun res!110124 () Bool)

(declare-fun e!145414 () Bool)

(assert (=> b!223939 (=> (not res!110124) (not e!145414))))

(declare-datatypes ((List!3314 0))(
  ( (Nil!3311) (Cons!3310 (h!3958 (_ BitVec 64)) (t!8264 List!3314)) )
))
(declare-fun contains!1530 (List!3314 (_ BitVec 64)) Bool)

(assert (=> b!223939 (= res!110124 (not (contains!1530 Nil!3311 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223940 () Bool)

(assert (=> b!223940 (= e!145414 false)))

(declare-fun lt!112885 () Bool)

(assert (=> b!223940 (= lt!112885 (contains!1530 Nil!3311 key!932))))

(declare-fun b!223941 () Bool)

(declare-datatypes ((Unit!6680 0))(
  ( (Unit!6681) )
))
(declare-fun e!145421 () Unit!6680)

(declare-fun Unit!6682 () Unit!6680)

(assert (=> b!223941 (= e!145421 Unit!6682)))

(declare-fun b!223942 () Bool)

(declare-fun e!145413 () Bool)

(declare-fun e!145408 () Bool)

(assert (=> b!223942 (= e!145413 e!145408)))

(declare-fun res!110135 () Bool)

(declare-fun call!20850 () Bool)

(assert (=> b!223942 (= res!110135 call!20850)))

(assert (=> b!223942 (=> (not res!110135) (not e!145408))))

(declare-fun b!223943 () Bool)

(declare-fun e!145418 () Bool)

(declare-fun e!145417 () Bool)

(assert (=> b!223943 (= e!145418 (and e!145417 mapRes!9982))))

(declare-fun condMapEmpty!9982 () Bool)

(declare-fun mapDefault!9982 () ValueCell!2594)

(assert (=> b!223943 (= condMapEmpty!9982 (= (arr!5211 (_values!4186 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2594)) mapDefault!9982)))))

(declare-fun b!223944 () Bool)

(declare-fun e!145419 () Bool)

(declare-fun e!145415 () Bool)

(assert (=> b!223944 (= e!145419 e!145415)))

(declare-fun res!110131 () Bool)

(assert (=> b!223944 (=> (not res!110131) (not e!145415))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!223944 (= res!110131 (bvsle #b00000000000000000000000000000000 index!297))))

(declare-fun b!223945 () Bool)

(declare-fun e!145422 () Bool)

(assert (=> b!223945 (= e!145422 e!145414)))

(declare-fun res!110133 () Bool)

(assert (=> b!223945 (=> (not res!110133) (not e!145414))))

(assert (=> b!223945 (= res!110133 (and (bvslt (size!5546 (_keys!6256 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!5546 (_keys!6256 thiss!1504)))))))

(declare-fun lt!112888 () Unit!6680)

(assert (=> b!223945 (= lt!112888 e!145421)))

(declare-fun c!37148 () Bool)

(declare-fun lt!112887 () Bool)

(assert (=> b!223945 (= c!37148 lt!112887)))

(assert (=> b!223945 (= lt!112887 (arrayContainsKey!0 (_keys!6256 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!223946 () Bool)

(declare-fun res!110132 () Bool)

(assert (=> b!223946 (=> (not res!110132) (not e!145414))))

(assert (=> b!223946 (= res!110132 (not (contains!1530 Nil!3311 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!223947 () Bool)

(declare-fun res!110120 () Bool)

(assert (=> b!223947 (=> (not res!110120) (not e!145414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!223947 (= res!110120 (validKeyInArray!0 key!932))))

(declare-fun b!223948 () Bool)

(assert (=> b!223948 (= e!145415 (not (contains!1530 Nil!3311 key!932)))))

(declare-fun b!223949 () Bool)

(declare-fun res!110116 () Bool)

(assert (=> b!223949 (=> (not res!110116) (not e!145414))))

(assert (=> b!223949 (= res!110116 (not lt!112887))))

(declare-fun b!223950 () Bool)

(declare-fun e!145409 () Bool)

(assert (=> b!223950 (= e!145409 (not call!20849))))

(declare-fun b!223951 () Bool)

(declare-fun res!110125 () Bool)

(assert (=> b!223951 (=> (not res!110125) (not e!145414))))

(declare-fun noDuplicate!83 (List!3314) Bool)

(assert (=> b!223951 (= res!110125 (noDuplicate!83 Nil!3311))))

(declare-fun b!223952 () Bool)

(declare-fun e!145412 () Bool)

(assert (=> b!223952 (= e!145405 e!145412)))

(declare-fun res!110134 () Bool)

(assert (=> b!223952 (=> (not res!110134) (not e!145412))))

(declare-datatypes ((SeekEntryResult!850 0))(
  ( (MissingZero!850 (index!5570 (_ BitVec 32))) (Found!850 (index!5571 (_ BitVec 32))) (Intermediate!850 (undefined!1662 Bool) (index!5572 (_ BitVec 32)) (x!23117 (_ BitVec 32))) (Undefined!850) (MissingVacant!850 (index!5573 (_ BitVec 32))) )
))
(declare-fun lt!112884 () SeekEntryResult!850)

(assert (=> b!223952 (= res!110134 (or (= lt!112884 (MissingZero!850 index!297)) (= lt!112884 (MissingVacant!850 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10987 (_ BitVec 32)) SeekEntryResult!850)

(assert (=> b!223952 (= lt!112884 (seekEntryOrOpen!0 key!932 (_keys!6256 thiss!1504) (mask!10034 thiss!1504)))))

(declare-fun b!223953 () Bool)

(assert (=> b!223953 (= e!145412 e!145422)))

(declare-fun res!110129 () Bool)

(assert (=> b!223953 (=> (not res!110129) (not e!145422))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!223953 (= res!110129 (inRange!0 index!297 (mask!10034 thiss!1504)))))

(declare-fun lt!112886 () Unit!6680)

(declare-fun e!145420 () Unit!6680)

(assert (=> b!223953 (= lt!112886 e!145420)))

(declare-fun c!37149 () Bool)

(declare-datatypes ((tuple2!4388 0))(
  ( (tuple2!4389 (_1!2205 (_ BitVec 64)) (_2!2205 V!7481)) )
))
(declare-datatypes ((List!3315 0))(
  ( (Nil!3312) (Cons!3311 (h!3959 tuple2!4388) (t!8265 List!3315)) )
))
(declare-datatypes ((ListLongMap!3291 0))(
  ( (ListLongMap!3292 (toList!1661 List!3315)) )
))
(declare-fun contains!1531 (ListLongMap!3291 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1170 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 32) Int) ListLongMap!3291)

(assert (=> b!223953 (= c!37149 (contains!1531 (getCurrentListMap!1170 (_keys!6256 thiss!1504) (_values!4186 thiss!1504) (mask!10034 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4203 thiss!1504)) key!932))))

(declare-fun b!223954 () Bool)

(declare-fun lt!112883 () Unit!6680)

(assert (=> b!223954 (= e!145420 lt!112883)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!230 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) Int) Unit!6680)

(assert (=> b!223954 (= lt!112883 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!230 (_keys!6256 thiss!1504) (_values!4186 thiss!1504) (mask!10034 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 (defaultEntry!4203 thiss!1504)))))

(declare-fun c!37147 () Bool)

(get-info :version)

(assert (=> b!223954 (= c!37147 ((_ is MissingZero!850) lt!112884))))

(declare-fun e!145406 () Bool)

(assert (=> b!223954 e!145406))

(declare-fun b!223955 () Bool)

(declare-fun c!37150 () Bool)

(assert (=> b!223955 (= c!37150 ((_ is MissingVacant!850) lt!112884))))

(assert (=> b!223955 (= e!145406 e!145413)))

(declare-fun b!223956 () Bool)

(declare-fun res!110117 () Bool)

(assert (=> b!223956 (= res!110117 (= (select (arr!5212 (_keys!6256 thiss!1504)) (index!5573 lt!112884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!223956 (=> (not res!110117) (not e!145408))))

(declare-fun b!223957 () Bool)

(declare-fun res!110126 () Bool)

(assert (=> b!223957 (=> (not res!110126) (not e!145414))))

(assert (=> b!223957 (= res!110126 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!5546 (_keys!6256 thiss!1504)))))))

(declare-fun b!223958 () Bool)

(declare-fun res!110119 () Bool)

(assert (=> b!223958 (=> (not res!110119) (not e!145409))))

(assert (=> b!223958 (= res!110119 call!20850)))

(assert (=> b!223958 (= e!145406 e!145409)))

(declare-fun b!223959 () Bool)

(declare-fun Unit!6683 () Unit!6680)

(assert (=> b!223959 (= e!145421 Unit!6683)))

(declare-fun lt!112881 () Unit!6680)

(declare-fun lemmaArrayContainsKeyThenInListMap!74 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) (_ BitVec 32) Int) Unit!6680)

(assert (=> b!223959 (= lt!112881 (lemmaArrayContainsKeyThenInListMap!74 (_keys!6256 thiss!1504) (_values!4186 thiss!1504) (mask!10034 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!223959 false))

(declare-fun b!223960 () Bool)

(declare-fun tp_is_empty!5875 () Bool)

(assert (=> b!223960 (= e!145416 tp_is_empty!5875)))

(declare-fun b!223961 () Bool)

(assert (=> b!223961 (= e!145417 tp_is_empty!5875)))

(declare-fun b!223962 () Bool)

(assert (=> b!223962 (= e!145408 (not call!20849))))

(declare-fun b!223963 () Bool)

(declare-fun res!110123 () Bool)

(assert (=> b!223963 (=> (not res!110123) (not e!145414))))

(assert (=> b!223963 (= res!110123 e!145419)))

(declare-fun res!110121 () Bool)

(assert (=> b!223963 (=> res!110121 e!145419)))

(declare-fun e!145410 () Bool)

(assert (=> b!223963 (= res!110121 e!145410)))

(declare-fun res!110118 () Bool)

(assert (=> b!223963 (=> (not res!110118) (not e!145410))))

(assert (=> b!223963 (= res!110118 (bvsgt #b00000000000000000000000000000000 index!297))))

(declare-fun b!223964 () Bool)

(assert (=> b!223964 (= e!145413 ((_ is Undefined!850) lt!112884))))

(declare-fun b!223965 () Bool)

(assert (=> b!223965 (= e!145410 (contains!1530 Nil!3311 key!932))))

(declare-fun array_inv!3437 (array!10987) Bool)

(declare-fun array_inv!3438 (array!10985) Bool)

(assert (=> b!223966 (= e!145411 (and tp!21180 tp_is_empty!5875 (array_inv!3437 (_keys!6256 thiss!1504)) (array_inv!3438 (_values!4186 thiss!1504)) e!145418))))

(declare-fun b!223967 () Bool)

(declare-fun res!110128 () Bool)

(assert (=> b!223967 (=> (not res!110128) (not e!145409))))

(assert (=> b!223967 (= res!110128 (= (select (arr!5212 (_keys!6256 thiss!1504)) (index!5570 lt!112884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!20847 () Bool)

(assert (=> bm!20847 (= call!20850 (inRange!0 (ite c!37147 (index!5570 lt!112884) (index!5573 lt!112884)) (mask!10034 thiss!1504)))))

(declare-fun b!223968 () Bool)

(declare-fun res!110130 () Bool)

(assert (=> b!223968 (=> (not res!110130) (not e!145414))))

(declare-fun arrayNoDuplicates!0 (array!10987 (_ BitVec 32) List!3314) Bool)

(assert (=> b!223968 (= res!110130 (arrayNoDuplicates!0 (_keys!6256 thiss!1504) #b00000000000000000000000000000000 Nil!3311))))

(declare-fun mapIsEmpty!9982 () Bool)

(assert (=> mapIsEmpty!9982 mapRes!9982))

(declare-fun b!223969 () Bool)

(declare-fun Unit!6684 () Unit!6680)

(assert (=> b!223969 (= e!145420 Unit!6684)))

(declare-fun lt!112882 () Unit!6680)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!230 (array!10987 array!10985 (_ BitVec 32) (_ BitVec 32) V!7481 V!7481 (_ BitVec 64) Int) Unit!6680)

(assert (=> b!223969 (= lt!112882 (lemmaInListMapThenSeekEntryOrOpenFindsIt!230 (_keys!6256 thiss!1504) (_values!4186 thiss!1504) (mask!10034 thiss!1504) (extraKeys!3940 thiss!1504) (zeroValue!4044 thiss!1504) (minValue!4044 thiss!1504) key!932 (defaultEntry!4203 thiss!1504)))))

(assert (=> b!223969 false))

(assert (= (and start!21950 res!110127) b!223938))

(assert (= (and b!223938 res!110122) b!223952))

(assert (= (and b!223952 res!110134) b!223953))

(assert (= (and b!223953 c!37149) b!223969))

(assert (= (and b!223953 (not c!37149)) b!223954))

(assert (= (and b!223954 c!37147) b!223958))

(assert (= (and b!223954 (not c!37147)) b!223955))

(assert (= (and b!223958 res!110119) b!223967))

(assert (= (and b!223967 res!110128) b!223950))

(assert (= (and b!223955 c!37150) b!223942))

(assert (= (and b!223955 (not c!37150)) b!223964))

(assert (= (and b!223942 res!110135) b!223956))

(assert (= (and b!223956 res!110117) b!223962))

(assert (= (or b!223958 b!223942) bm!20847))

(assert (= (or b!223950 b!223962) bm!20846))

(assert (= (and b!223953 res!110129) b!223945))

(assert (= (and b!223945 c!37148) b!223959))

(assert (= (and b!223945 (not c!37148)) b!223941))

(assert (= (and b!223945 res!110133) b!223951))

(assert (= (and b!223951 res!110125) b!223939))

(assert (= (and b!223939 res!110124) b!223946))

(assert (= (and b!223946 res!110132) b!223963))

(assert (= (and b!223963 res!110118) b!223965))

(assert (= (and b!223963 (not res!110121)) b!223944))

(assert (= (and b!223944 res!110131) b!223948))

(assert (= (and b!223963 res!110123) b!223968))

(assert (= (and b!223968 res!110130) b!223957))

(assert (= (and b!223957 res!110126) b!223947))

(assert (= (and b!223947 res!110120) b!223949))

(assert (= (and b!223949 res!110116) b!223940))

(assert (= (and b!223943 condMapEmpty!9982) mapIsEmpty!9982))

(assert (= (and b!223943 (not condMapEmpty!9982)) mapNonEmpty!9982))

(assert (= (and mapNonEmpty!9982 ((_ is ValueCellFull!2594) mapValue!9982)) b!223960))

(assert (= (and b!223943 ((_ is ValueCellFull!2594) mapDefault!9982)) b!223961))

(assert (= b!223966 b!223943))

(assert (= start!21950 b!223966))

(declare-fun m!246673 () Bool)

(assert (=> b!223965 m!246673))

(declare-fun m!246675 () Bool)

(assert (=> b!223946 m!246675))

(assert (=> b!223940 m!246673))

(declare-fun m!246677 () Bool)

(assert (=> b!223952 m!246677))

(declare-fun m!246679 () Bool)

(assert (=> start!21950 m!246679))

(assert (=> b!223948 m!246673))

(declare-fun m!246681 () Bool)

(assert (=> b!223967 m!246681))

(declare-fun m!246683 () Bool)

(assert (=> b!223968 m!246683))

(declare-fun m!246685 () Bool)

(assert (=> mapNonEmpty!9982 m!246685))

(declare-fun m!246687 () Bool)

(assert (=> b!223954 m!246687))

(declare-fun m!246689 () Bool)

(assert (=> bm!20846 m!246689))

(declare-fun m!246691 () Bool)

(assert (=> bm!20847 m!246691))

(declare-fun m!246693 () Bool)

(assert (=> b!223969 m!246693))

(declare-fun m!246695 () Bool)

(assert (=> b!223939 m!246695))

(declare-fun m!246697 () Bool)

(assert (=> b!223959 m!246697))

(declare-fun m!246699 () Bool)

(assert (=> b!223953 m!246699))

(declare-fun m!246701 () Bool)

(assert (=> b!223953 m!246701))

(assert (=> b!223953 m!246701))

(declare-fun m!246703 () Bool)

(assert (=> b!223953 m!246703))

(declare-fun m!246705 () Bool)

(assert (=> b!223956 m!246705))

(declare-fun m!246707 () Bool)

(assert (=> b!223947 m!246707))

(assert (=> b!223945 m!246689))

(declare-fun m!246709 () Bool)

(assert (=> b!223951 m!246709))

(declare-fun m!246711 () Bool)

(assert (=> b!223966 m!246711))

(declare-fun m!246713 () Bool)

(assert (=> b!223966 m!246713))

(check-sat (not b!223945) (not bm!20847) b_and!12885 (not start!21950) (not b!223951) (not b!223966) (not b!223954) (not b_next!6013) tp_is_empty!5875 (not b!223952) (not b!223953) (not b!223946) (not b!223959) (not b!223948) (not b!223939) (not bm!20846) (not b!223968) (not b!223969) (not b!223965) (not b!223940) (not mapNonEmpty!9982) (not b!223947))
(check-sat b_and!12885 (not b_next!6013))
