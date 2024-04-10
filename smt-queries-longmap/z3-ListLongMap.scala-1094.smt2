; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22426 () Bool)

(assert start!22426)

(declare-fun b!234693 () Bool)

(declare-fun b_free!6315 () Bool)

(declare-fun b_next!6315 () Bool)

(assert (=> b!234693 (= b_free!6315 (not b_next!6315))))

(declare-fun tp!22104 () Bool)

(declare-fun b_and!13235 () Bool)

(assert (=> b!234693 (= tp!22104 b_and!13235)))

(declare-fun b!234685 () Bool)

(declare-fun e!152438 () Bool)

(declare-fun tp_is_empty!6177 () Bool)

(assert (=> b!234685 (= e!152438 tp_is_empty!6177)))

(declare-fun b!234686 () Bool)

(declare-fun e!152433 () Bool)

(declare-datatypes ((V!7883 0))(
  ( (V!7884 (val!3133 Int)) )
))
(declare-datatypes ((ValueCell!2745 0))(
  ( (ValueCellFull!2745 (v!5158 V!7883)) (EmptyCell!2745) )
))
(declare-datatypes ((array!11607 0))(
  ( (array!11608 (arr!5518 (Array (_ BitVec 32) ValueCell!2745)) (size!5854 (_ BitVec 32))) )
))
(declare-datatypes ((array!11609 0))(
  ( (array!11610 (arr!5519 (Array (_ BitVec 32) (_ BitVec 64))) (size!5855 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3390 0))(
  ( (LongMapFixedSize!3391 (defaultEntry!4362 Int) (mask!10316 (_ BitVec 32)) (extraKeys!4099 (_ BitVec 32)) (zeroValue!4203 V!7883) (minValue!4203 V!7883) (_size!1744 (_ BitVec 32)) (_keys!6430 array!11609) (_values!4345 array!11607) (_vacant!1744 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3390)

(assert (=> b!234686 (= e!152433 (and (= (size!5854 (_values!4345 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!10316 thiss!1504))) (= (size!5855 (_keys!6430 thiss!1504)) (size!5854 (_values!4345 thiss!1504))) (bvsge (mask!10316 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!4099 thiss!1504) #b00000000000000000000000000000000) (bvsgt (extraKeys!4099 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun res!115106 () Bool)

(declare-fun e!152432 () Bool)

(assert (=> start!22426 (=> (not res!115106) (not e!152432))))

(declare-fun valid!1338 (LongMapFixedSize!3390) Bool)

(assert (=> start!22426 (= res!115106 (valid!1338 thiss!1504))))

(assert (=> start!22426 e!152432))

(declare-fun e!152434 () Bool)

(assert (=> start!22426 e!152434))

(assert (=> start!22426 true))

(declare-fun b!234687 () Bool)

(declare-fun res!115108 () Bool)

(assert (=> b!234687 (=> (not res!115108) (not e!152433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!234687 (= res!115108 (validMask!0 (mask!10316 thiss!1504)))))

(declare-fun b!234688 () Bool)

(declare-fun e!152436 () Bool)

(declare-fun mapRes!10453 () Bool)

(assert (=> b!234688 (= e!152436 (and e!152438 mapRes!10453))))

(declare-fun condMapEmpty!10453 () Bool)

(declare-fun mapDefault!10453 () ValueCell!2745)

(assert (=> b!234688 (= condMapEmpty!10453 (= (arr!5518 (_values!4345 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2745)) mapDefault!10453)))))

(declare-fun b!234689 () Bool)

(declare-fun res!115104 () Bool)

(assert (=> b!234689 (=> (not res!115104) (not e!152433))))

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4618 0))(
  ( (tuple2!4619 (_1!2320 (_ BitVec 64)) (_2!2320 V!7883)) )
))
(declare-datatypes ((List!3527 0))(
  ( (Nil!3524) (Cons!3523 (h!4174 tuple2!4618) (t!8496 List!3527)) )
))
(declare-datatypes ((ListLongMap!3531 0))(
  ( (ListLongMap!3532 (toList!1781 List!3527)) )
))
(declare-fun contains!1655 (ListLongMap!3531 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1309 (array!11609 array!11607 (_ BitVec 32) (_ BitVec 32) V!7883 V!7883 (_ BitVec 32) Int) ListLongMap!3531)

(assert (=> b!234689 (= res!115104 (contains!1655 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)) key!932))))

(declare-fun mapIsEmpty!10453 () Bool)

(assert (=> mapIsEmpty!10453 mapRes!10453))

(declare-fun b!234690 () Bool)

(declare-fun res!115105 () Bool)

(assert (=> b!234690 (=> (not res!115105) (not e!152432))))

(assert (=> b!234690 (= res!115105 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!234691 () Bool)

(declare-fun e!152435 () Bool)

(assert (=> b!234691 (= e!152435 tp_is_empty!6177)))

(declare-fun b!234692 () Bool)

(assert (=> b!234692 (= e!152432 e!152433)))

(declare-fun res!115107 () Bool)

(assert (=> b!234692 (=> (not res!115107) (not e!152433))))

(declare-datatypes ((SeekEntryResult!982 0))(
  ( (MissingZero!982 (index!6098 (_ BitVec 32))) (Found!982 (index!6099 (_ BitVec 32))) (Intermediate!982 (undefined!1794 Bool) (index!6100 (_ BitVec 32)) (x!23724 (_ BitVec 32))) (Undefined!982) (MissingVacant!982 (index!6101 (_ BitVec 32))) )
))
(declare-fun lt!118721 () SeekEntryResult!982)

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!234692 (= res!115107 (or (= lt!118721 (MissingZero!982 index!297)) (= lt!118721 (MissingVacant!982 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!11609 (_ BitVec 32)) SeekEntryResult!982)

(assert (=> b!234692 (= lt!118721 (seekEntryOrOpen!0 key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(declare-fun mapNonEmpty!10453 () Bool)

(declare-fun tp!22105 () Bool)

(assert (=> mapNonEmpty!10453 (= mapRes!10453 (and tp!22105 e!152435))))

(declare-fun mapKey!10453 () (_ BitVec 32))

(declare-fun mapRest!10453 () (Array (_ BitVec 32) ValueCell!2745))

(declare-fun mapValue!10453 () ValueCell!2745)

(assert (=> mapNonEmpty!10453 (= (arr!5518 (_values!4345 thiss!1504)) (store mapRest!10453 mapKey!10453 mapValue!10453))))

(declare-fun array_inv!3637 (array!11609) Bool)

(declare-fun array_inv!3638 (array!11607) Bool)

(assert (=> b!234693 (= e!152434 (and tp!22104 tp_is_empty!6177 (array_inv!3637 (_keys!6430 thiss!1504)) (array_inv!3638 (_values!4345 thiss!1504)) e!152436))))

(assert (= (and start!22426 res!115106) b!234690))

(assert (= (and b!234690 res!115105) b!234692))

(assert (= (and b!234692 res!115107) b!234689))

(assert (= (and b!234689 res!115104) b!234687))

(assert (= (and b!234687 res!115108) b!234686))

(assert (= (and b!234688 condMapEmpty!10453) mapIsEmpty!10453))

(assert (= (and b!234688 (not condMapEmpty!10453)) mapNonEmpty!10453))

(get-info :version)

(assert (= (and mapNonEmpty!10453 ((_ is ValueCellFull!2745) mapValue!10453)) b!234691))

(assert (= (and b!234688 ((_ is ValueCellFull!2745) mapDefault!10453)) b!234685))

(assert (= b!234693 b!234688))

(assert (= start!22426 b!234693))

(declare-fun m!255945 () Bool)

(assert (=> b!234692 m!255945))

(declare-fun m!255947 () Bool)

(assert (=> start!22426 m!255947))

(declare-fun m!255949 () Bool)

(assert (=> mapNonEmpty!10453 m!255949))

(declare-fun m!255951 () Bool)

(assert (=> b!234693 m!255951))

(declare-fun m!255953 () Bool)

(assert (=> b!234693 m!255953))

(declare-fun m!255955 () Bool)

(assert (=> b!234689 m!255955))

(assert (=> b!234689 m!255955))

(declare-fun m!255957 () Bool)

(assert (=> b!234689 m!255957))

(declare-fun m!255959 () Bool)

(assert (=> b!234687 m!255959))

(check-sat (not b!234692) (not b_next!6315) tp_is_empty!6177 (not b!234687) (not start!22426) b_and!13235 (not b!234693) (not b!234689) (not mapNonEmpty!10453))
(check-sat b_and!13235 (not b_next!6315))
(get-model)

(declare-fun d!59165 () Bool)

(assert (=> d!59165 (= (validMask!0 (mask!10316 thiss!1504)) (and (or (= (mask!10316 thiss!1504) #b00000000000000000000000000000111) (= (mask!10316 thiss!1504) #b00000000000000000000000000001111) (= (mask!10316 thiss!1504) #b00000000000000000000000000011111) (= (mask!10316 thiss!1504) #b00000000000000000000000000111111) (= (mask!10316 thiss!1504) #b00000000000000000000000001111111) (= (mask!10316 thiss!1504) #b00000000000000000000000011111111) (= (mask!10316 thiss!1504) #b00000000000000000000000111111111) (= (mask!10316 thiss!1504) #b00000000000000000000001111111111) (= (mask!10316 thiss!1504) #b00000000000000000000011111111111) (= (mask!10316 thiss!1504) #b00000000000000000000111111111111) (= (mask!10316 thiss!1504) #b00000000000000000001111111111111) (= (mask!10316 thiss!1504) #b00000000000000000011111111111111) (= (mask!10316 thiss!1504) #b00000000000000000111111111111111) (= (mask!10316 thiss!1504) #b00000000000000001111111111111111) (= (mask!10316 thiss!1504) #b00000000000000011111111111111111) (= (mask!10316 thiss!1504) #b00000000000000111111111111111111) (= (mask!10316 thiss!1504) #b00000000000001111111111111111111) (= (mask!10316 thiss!1504) #b00000000000011111111111111111111) (= (mask!10316 thiss!1504) #b00000000000111111111111111111111) (= (mask!10316 thiss!1504) #b00000000001111111111111111111111) (= (mask!10316 thiss!1504) #b00000000011111111111111111111111) (= (mask!10316 thiss!1504) #b00000000111111111111111111111111) (= (mask!10316 thiss!1504) #b00000001111111111111111111111111) (= (mask!10316 thiss!1504) #b00000011111111111111111111111111) (= (mask!10316 thiss!1504) #b00000111111111111111111111111111) (= (mask!10316 thiss!1504) #b00001111111111111111111111111111) (= (mask!10316 thiss!1504) #b00011111111111111111111111111111) (= (mask!10316 thiss!1504) #b00111111111111111111111111111111)) (bvsle (mask!10316 thiss!1504) #b00111111111111111111111111111111)))))

(assert (=> b!234687 d!59165))

(declare-fun d!59167 () Bool)

(declare-fun res!115130 () Bool)

(declare-fun e!152462 () Bool)

(assert (=> d!59167 (=> (not res!115130) (not e!152462))))

(declare-fun simpleValid!231 (LongMapFixedSize!3390) Bool)

(assert (=> d!59167 (= res!115130 (simpleValid!231 thiss!1504))))

(assert (=> d!59167 (= (valid!1338 thiss!1504) e!152462)))

(declare-fun b!234727 () Bool)

(declare-fun res!115131 () Bool)

(assert (=> b!234727 (=> (not res!115131) (not e!152462))))

(declare-fun arrayCountValidKeys!0 (array!11609 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234727 (= res!115131 (= (arrayCountValidKeys!0 (_keys!6430 thiss!1504) #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))) (_size!1744 thiss!1504)))))

(declare-fun b!234728 () Bool)

(declare-fun res!115132 () Bool)

(assert (=> b!234728 (=> (not res!115132) (not e!152462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!11609 (_ BitVec 32)) Bool)

(assert (=> b!234728 (= res!115132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(declare-fun b!234729 () Bool)

(declare-datatypes ((List!3528 0))(
  ( (Nil!3525) (Cons!3524 (h!4175 (_ BitVec 64)) (t!8499 List!3528)) )
))
(declare-fun arrayNoDuplicates!0 (array!11609 (_ BitVec 32) List!3528) Bool)

(assert (=> b!234729 (= e!152462 (arrayNoDuplicates!0 (_keys!6430 thiss!1504) #b00000000000000000000000000000000 Nil!3525))))

(assert (= (and d!59167 res!115130) b!234727))

(assert (= (and b!234727 res!115131) b!234728))

(assert (= (and b!234728 res!115132) b!234729))

(declare-fun m!255977 () Bool)

(assert (=> d!59167 m!255977))

(declare-fun m!255979 () Bool)

(assert (=> b!234727 m!255979))

(declare-fun m!255981 () Bool)

(assert (=> b!234728 m!255981))

(declare-fun m!255983 () Bool)

(assert (=> b!234729 m!255983))

(assert (=> start!22426 d!59167))

(declare-fun b!234742 () Bool)

(declare-fun c!39097 () Bool)

(declare-fun lt!118733 () (_ BitVec 64))

(assert (=> b!234742 (= c!39097 (= lt!118733 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!152469 () SeekEntryResult!982)

(declare-fun e!152471 () SeekEntryResult!982)

(assert (=> b!234742 (= e!152469 e!152471)))

(declare-fun b!234743 () Bool)

(declare-fun lt!118731 () SeekEntryResult!982)

(assert (=> b!234743 (= e!152471 (MissingZero!982 (index!6100 lt!118731)))))

(declare-fun b!234744 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11609 (_ BitVec 32)) SeekEntryResult!982)

(assert (=> b!234744 (= e!152471 (seekKeyOrZeroReturnVacant!0 (x!23724 lt!118731) (index!6100 lt!118731) (index!6100 lt!118731) key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(declare-fun b!234745 () Bool)

(declare-fun e!152470 () SeekEntryResult!982)

(assert (=> b!234745 (= e!152470 e!152469)))

(assert (=> b!234745 (= lt!118733 (select (arr!5519 (_keys!6430 thiss!1504)) (index!6100 lt!118731)))))

(declare-fun c!39098 () Bool)

(assert (=> b!234745 (= c!39098 (= lt!118733 key!932))))

(declare-fun d!59169 () Bool)

(declare-fun lt!118732 () SeekEntryResult!982)

(assert (=> d!59169 (and (or ((_ is Undefined!982) lt!118732) (not ((_ is Found!982) lt!118732)) (and (bvsge (index!6099 lt!118732) #b00000000000000000000000000000000) (bvslt (index!6099 lt!118732) (size!5855 (_keys!6430 thiss!1504))))) (or ((_ is Undefined!982) lt!118732) ((_ is Found!982) lt!118732) (not ((_ is MissingZero!982) lt!118732)) (and (bvsge (index!6098 lt!118732) #b00000000000000000000000000000000) (bvslt (index!6098 lt!118732) (size!5855 (_keys!6430 thiss!1504))))) (or ((_ is Undefined!982) lt!118732) ((_ is Found!982) lt!118732) ((_ is MissingZero!982) lt!118732) (not ((_ is MissingVacant!982) lt!118732)) (and (bvsge (index!6101 lt!118732) #b00000000000000000000000000000000) (bvslt (index!6101 lt!118732) (size!5855 (_keys!6430 thiss!1504))))) (or ((_ is Undefined!982) lt!118732) (ite ((_ is Found!982) lt!118732) (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6099 lt!118732)) key!932) (ite ((_ is MissingZero!982) lt!118732) (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6098 lt!118732)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!982) lt!118732) (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6101 lt!118732)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!59169 (= lt!118732 e!152470)))

(declare-fun c!39099 () Bool)

(assert (=> d!59169 (= c!39099 (and ((_ is Intermediate!982) lt!118731) (undefined!1794 lt!118731)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!11609 (_ BitVec 32)) SeekEntryResult!982)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!59169 (= lt!118731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10316 thiss!1504)) key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(assert (=> d!59169 (validMask!0 (mask!10316 thiss!1504))))

(assert (=> d!59169 (= (seekEntryOrOpen!0 key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)) lt!118732)))

(declare-fun b!234746 () Bool)

(assert (=> b!234746 (= e!152469 (Found!982 (index!6100 lt!118731)))))

(declare-fun b!234747 () Bool)

(assert (=> b!234747 (= e!152470 Undefined!982)))

(assert (= (and d!59169 c!39099) b!234747))

(assert (= (and d!59169 (not c!39099)) b!234745))

(assert (= (and b!234745 c!39098) b!234746))

(assert (= (and b!234745 (not c!39098)) b!234742))

(assert (= (and b!234742 c!39097) b!234743))

(assert (= (and b!234742 (not c!39097)) b!234744))

(declare-fun m!255985 () Bool)

(assert (=> b!234744 m!255985))

(declare-fun m!255987 () Bool)

(assert (=> b!234745 m!255987))

(declare-fun m!255989 () Bool)

(assert (=> d!59169 m!255989))

(assert (=> d!59169 m!255959))

(declare-fun m!255991 () Bool)

(assert (=> d!59169 m!255991))

(assert (=> d!59169 m!255989))

(declare-fun m!255993 () Bool)

(assert (=> d!59169 m!255993))

(declare-fun m!255995 () Bool)

(assert (=> d!59169 m!255995))

(declare-fun m!255997 () Bool)

(assert (=> d!59169 m!255997))

(assert (=> b!234692 d!59169))

(declare-fun d!59171 () Bool)

(declare-fun e!152476 () Bool)

(assert (=> d!59171 e!152476))

(declare-fun res!115135 () Bool)

(assert (=> d!59171 (=> res!115135 e!152476)))

(declare-fun lt!118743 () Bool)

(assert (=> d!59171 (= res!115135 (not lt!118743))))

(declare-fun lt!118742 () Bool)

(assert (=> d!59171 (= lt!118743 lt!118742)))

(declare-datatypes ((Unit!7242 0))(
  ( (Unit!7243) )
))
(declare-fun lt!118744 () Unit!7242)

(declare-fun e!152477 () Unit!7242)

(assert (=> d!59171 (= lt!118744 e!152477)))

(declare-fun c!39102 () Bool)

(assert (=> d!59171 (= c!39102 lt!118742)))

(declare-fun containsKey!258 (List!3527 (_ BitVec 64)) Bool)

(assert (=> d!59171 (= lt!118742 (containsKey!258 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))

(assert (=> d!59171 (= (contains!1655 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)) key!932) lt!118743)))

(declare-fun b!234754 () Bool)

(declare-fun lt!118745 () Unit!7242)

(assert (=> b!234754 (= e!152477 lt!118745)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!206 (List!3527 (_ BitVec 64)) Unit!7242)

(assert (=> b!234754 (= lt!118745 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))

(declare-datatypes ((Option!272 0))(
  ( (Some!271 (v!5160 V!7883)) (None!270) )
))
(declare-fun isDefined!207 (Option!272) Bool)

(declare-fun getValueByKey!266 (List!3527 (_ BitVec 64)) Option!272)

(assert (=> b!234754 (isDefined!207 (getValueByKey!266 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))

(declare-fun b!234755 () Bool)

(declare-fun Unit!7244 () Unit!7242)

(assert (=> b!234755 (= e!152477 Unit!7244)))

(declare-fun b!234756 () Bool)

(assert (=> b!234756 (= e!152476 (isDefined!207 (getValueByKey!266 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932)))))

(assert (= (and d!59171 c!39102) b!234754))

(assert (= (and d!59171 (not c!39102)) b!234755))

(assert (= (and d!59171 (not res!115135)) b!234756))

(declare-fun m!255999 () Bool)

(assert (=> d!59171 m!255999))

(declare-fun m!256001 () Bool)

(assert (=> b!234754 m!256001))

(declare-fun m!256003 () Bool)

(assert (=> b!234754 m!256003))

(assert (=> b!234754 m!256003))

(declare-fun m!256005 () Bool)

(assert (=> b!234754 m!256005))

(assert (=> b!234756 m!256003))

(assert (=> b!234756 m!256003))

(assert (=> b!234756 m!256005))

(assert (=> b!234689 d!59171))

(declare-fun b!234799 () Bool)

(declare-fun e!152509 () ListLongMap!3531)

(declare-fun call!21840 () ListLongMap!3531)

(assert (=> b!234799 (= e!152509 call!21840)))

(declare-fun b!234800 () Bool)

(declare-fun e!152505 () ListLongMap!3531)

(assert (=> b!234800 (= e!152505 call!21840)))

(declare-fun b!234801 () Bool)

(declare-fun e!152508 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!234801 (= e!152508 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234802 () Bool)

(declare-fun e!152507 () Bool)

(declare-fun e!152506 () Bool)

(assert (=> b!234802 (= e!152507 e!152506)))

(declare-fun res!115154 () Bool)

(declare-fun call!21838 () Bool)

(assert (=> b!234802 (= res!115154 call!21838)))

(assert (=> b!234802 (=> (not res!115154) (not e!152506))))

(declare-fun b!234803 () Bool)

(declare-fun e!152513 () Bool)

(declare-fun lt!118794 () ListLongMap!3531)

(declare-fun apply!208 (ListLongMap!3531 (_ BitVec 64)) V!7883)

(assert (=> b!234803 (= e!152513 (= (apply!208 lt!118794 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4203 thiss!1504)))))

(declare-fun b!234804 () Bool)

(declare-fun e!152512 () Bool)

(assert (=> b!234804 (= e!152512 e!152513)))

(declare-fun res!115160 () Bool)

(declare-fun call!21834 () Bool)

(assert (=> b!234804 (= res!115160 call!21834)))

(assert (=> b!234804 (=> (not res!115160) (not e!152513))))

(declare-fun bm!21831 () Bool)

(declare-fun call!21835 () ListLongMap!3531)

(declare-fun call!21839 () ListLongMap!3531)

(assert (=> bm!21831 (= call!21835 call!21839)))

(declare-fun bm!21832 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!530 (array!11609 array!11607 (_ BitVec 32) (_ BitVec 32) V!7883 V!7883 (_ BitVec 32) Int) ListLongMap!3531)

(assert (=> bm!21832 (= call!21839 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))

(declare-fun b!234805 () Bool)

(declare-fun c!39118 () Bool)

(assert (=> b!234805 (= c!39118 (and (not (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!234805 (= e!152509 e!152505)))

(declare-fun b!234806 () Bool)

(assert (=> b!234806 (= e!152512 (not call!21834))))

(declare-fun b!234807 () Bool)

(declare-fun e!152514 () Bool)

(assert (=> b!234807 (= e!152514 e!152507)))

(declare-fun c!39116 () Bool)

(assert (=> b!234807 (= c!39116 (not (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!234808 () Bool)

(declare-fun e!152516 () Bool)

(declare-fun get!2834 (ValueCell!2745 V!7883) V!7883)

(declare-fun dynLambda!551 (Int (_ BitVec 64)) V!7883)

(assert (=> b!234808 (= e!152516 (= (apply!208 lt!118794 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)) (get!2834 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5854 (_values!4345 thiss!1504))))))

(assert (=> b!234808 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun b!234809 () Bool)

(declare-fun e!152504 () Bool)

(assert (=> b!234809 (= e!152504 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234810 () Bool)

(declare-fun e!152515 () Unit!7242)

(declare-fun lt!118800 () Unit!7242)

(assert (=> b!234810 (= e!152515 lt!118800)))

(declare-fun lt!118797 () ListLongMap!3531)

(assert (=> b!234810 (= lt!118797 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))

(declare-fun lt!118810 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118810 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118805 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118805 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118807 () Unit!7242)

(declare-fun addStillContains!184 (ListLongMap!3531 (_ BitVec 64) V!7883 (_ BitVec 64)) Unit!7242)

(assert (=> b!234810 (= lt!118807 (addStillContains!184 lt!118797 lt!118810 (zeroValue!4203 thiss!1504) lt!118805))))

(declare-fun +!635 (ListLongMap!3531 tuple2!4618) ListLongMap!3531)

(assert (=> b!234810 (contains!1655 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))) lt!118805)))

(declare-fun lt!118796 () Unit!7242)

(assert (=> b!234810 (= lt!118796 lt!118807)))

(declare-fun lt!118798 () ListLongMap!3531)

(assert (=> b!234810 (= lt!118798 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))

(declare-fun lt!118791 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118791 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118795 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118795 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118792 () Unit!7242)

(declare-fun addApplyDifferent!184 (ListLongMap!3531 (_ BitVec 64) V!7883 (_ BitVec 64)) Unit!7242)

(assert (=> b!234810 (= lt!118792 (addApplyDifferent!184 lt!118798 lt!118791 (minValue!4203 thiss!1504) lt!118795))))

(assert (=> b!234810 (= (apply!208 (+!635 lt!118798 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))) lt!118795) (apply!208 lt!118798 lt!118795))))

(declare-fun lt!118806 () Unit!7242)

(assert (=> b!234810 (= lt!118806 lt!118792)))

(declare-fun lt!118790 () ListLongMap!3531)

(assert (=> b!234810 (= lt!118790 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))

(declare-fun lt!118811 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118802 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118802 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118804 () Unit!7242)

(assert (=> b!234810 (= lt!118804 (addApplyDifferent!184 lt!118790 lt!118811 (zeroValue!4203 thiss!1504) lt!118802))))

(assert (=> b!234810 (= (apply!208 (+!635 lt!118790 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))) lt!118802) (apply!208 lt!118790 lt!118802))))

(declare-fun lt!118803 () Unit!7242)

(assert (=> b!234810 (= lt!118803 lt!118804)))

(declare-fun lt!118808 () ListLongMap!3531)

(assert (=> b!234810 (= lt!118808 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))

(declare-fun lt!118809 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118809 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!118793 () (_ BitVec 64))

(assert (=> b!234810 (= lt!118793 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234810 (= lt!118800 (addApplyDifferent!184 lt!118808 lt!118809 (minValue!4203 thiss!1504) lt!118793))))

(assert (=> b!234810 (= (apply!208 (+!635 lt!118808 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))) lt!118793) (apply!208 lt!118808 lt!118793))))

(declare-fun b!234811 () Bool)

(declare-fun call!21836 () ListLongMap!3531)

(assert (=> b!234811 (= e!152505 call!21836)))

(declare-fun b!234812 () Bool)

(assert (=> b!234812 (= e!152507 (not call!21838))))

(declare-fun b!234813 () Bool)

(declare-fun res!115161 () Bool)

(assert (=> b!234813 (=> (not res!115161) (not e!152514))))

(declare-fun e!152510 () Bool)

(assert (=> b!234813 (= res!115161 e!152510)))

(declare-fun res!115162 () Bool)

(assert (=> b!234813 (=> res!115162 e!152510)))

(assert (=> b!234813 (= res!115162 (not e!152508))))

(declare-fun res!115156 () Bool)

(assert (=> b!234813 (=> (not res!115156) (not e!152508))))

(assert (=> b!234813 (= res!115156 (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun b!234814 () Bool)

(declare-fun res!115157 () Bool)

(assert (=> b!234814 (=> (not res!115157) (not e!152514))))

(assert (=> b!234814 (= res!115157 e!152512)))

(declare-fun c!39119 () Bool)

(assert (=> b!234814 (= c!39119 (not (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!21833 () Bool)

(assert (=> bm!21833 (= call!21836 call!21835)))

(declare-fun b!234815 () Bool)

(declare-fun e!152511 () ListLongMap!3531)

(declare-fun call!21837 () ListLongMap!3531)

(assert (=> b!234815 (= e!152511 (+!635 call!21837 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))

(declare-fun b!234816 () Bool)

(assert (=> b!234816 (= e!152510 e!152516)))

(declare-fun res!115158 () Bool)

(assert (=> b!234816 (=> (not res!115158) (not e!152516))))

(assert (=> b!234816 (= res!115158 (contains!1655 lt!118794 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234816 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun b!234817 () Bool)

(assert (=> b!234817 (= e!152506 (= (apply!208 lt!118794 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4203 thiss!1504)))))

(declare-fun d!59173 () Bool)

(assert (=> d!59173 e!152514))

(declare-fun res!115159 () Bool)

(assert (=> d!59173 (=> (not res!115159) (not e!152514))))

(assert (=> d!59173 (= res!115159 (or (bvsge #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))))

(declare-fun lt!118799 () ListLongMap!3531)

(assert (=> d!59173 (= lt!118794 lt!118799)))

(declare-fun lt!118801 () Unit!7242)

(assert (=> d!59173 (= lt!118801 e!152515)))

(declare-fun c!39115 () Bool)

(assert (=> d!59173 (= c!39115 e!152504)))

(declare-fun res!115155 () Bool)

(assert (=> d!59173 (=> (not res!115155) (not e!152504))))

(assert (=> d!59173 (= res!115155 (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> d!59173 (= lt!118799 e!152511)))

(declare-fun c!39120 () Bool)

(assert (=> d!59173 (= c!39120 (and (not (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!59173 (validMask!0 (mask!10316 thiss!1504))))

(assert (=> d!59173 (= (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)) lt!118794)))

(declare-fun b!234818 () Bool)

(declare-fun Unit!7245 () Unit!7242)

(assert (=> b!234818 (= e!152515 Unit!7245)))

(declare-fun bm!21834 () Bool)

(assert (=> bm!21834 (= call!21838 (contains!1655 lt!118794 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!21835 () Bool)

(declare-fun c!39117 () Bool)

(assert (=> bm!21835 (= call!21837 (+!635 (ite c!39120 call!21839 (ite c!39117 call!21835 call!21836)) (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))

(declare-fun bm!21836 () Bool)

(assert (=> bm!21836 (= call!21840 call!21837)))

(declare-fun bm!21837 () Bool)

(assert (=> bm!21837 (= call!21834 (contains!1655 lt!118794 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234819 () Bool)

(assert (=> b!234819 (= e!152511 e!152509)))

(assert (=> b!234819 (= c!39117 (and (not (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4099 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!59173 c!39120) b!234815))

(assert (= (and d!59173 (not c!39120)) b!234819))

(assert (= (and b!234819 c!39117) b!234799))

(assert (= (and b!234819 (not c!39117)) b!234805))

(assert (= (and b!234805 c!39118) b!234800))

(assert (= (and b!234805 (not c!39118)) b!234811))

(assert (= (or b!234800 b!234811) bm!21833))

(assert (= (or b!234799 bm!21833) bm!21831))

(assert (= (or b!234799 b!234800) bm!21836))

(assert (= (or b!234815 bm!21831) bm!21832))

(assert (= (or b!234815 bm!21836) bm!21835))

(assert (= (and d!59173 res!115155) b!234809))

(assert (= (and d!59173 c!39115) b!234810))

(assert (= (and d!59173 (not c!39115)) b!234818))

(assert (= (and d!59173 res!115159) b!234813))

(assert (= (and b!234813 res!115156) b!234801))

(assert (= (and b!234813 (not res!115162)) b!234816))

(assert (= (and b!234816 res!115158) b!234808))

(assert (= (and b!234813 res!115161) b!234814))

(assert (= (and b!234814 c!39119) b!234804))

(assert (= (and b!234814 (not c!39119)) b!234806))

(assert (= (and b!234804 res!115160) b!234803))

(assert (= (or b!234804 b!234806) bm!21837))

(assert (= (and b!234814 res!115157) b!234807))

(assert (= (and b!234807 c!39116) b!234802))

(assert (= (and b!234807 (not c!39116)) b!234812))

(assert (= (and b!234802 res!115154) b!234817))

(assert (= (or b!234802 b!234812) bm!21834))

(declare-fun b_lambda!7887 () Bool)

(assert (=> (not b_lambda!7887) (not b!234808)))

(declare-fun t!8498 () Bool)

(declare-fun tb!2929 () Bool)

(assert (=> (and b!234693 (= (defaultEntry!4362 thiss!1504) (defaultEntry!4362 thiss!1504)) t!8498) tb!2929))

(declare-fun result!5109 () Bool)

(assert (=> tb!2929 (= result!5109 tp_is_empty!6177)))

(assert (=> b!234808 t!8498))

(declare-fun b_and!13239 () Bool)

(assert (= b_and!13235 (and (=> t!8498 result!5109) b_and!13239)))

(declare-fun m!256007 () Bool)

(assert (=> b!234810 m!256007))

(assert (=> b!234810 m!256007))

(declare-fun m!256009 () Bool)

(assert (=> b!234810 m!256009))

(declare-fun m!256011 () Bool)

(assert (=> b!234810 m!256011))

(declare-fun m!256013 () Bool)

(assert (=> b!234810 m!256013))

(declare-fun m!256015 () Bool)

(assert (=> b!234810 m!256015))

(declare-fun m!256017 () Bool)

(assert (=> b!234810 m!256017))

(declare-fun m!256019 () Bool)

(assert (=> b!234810 m!256019))

(declare-fun m!256021 () Bool)

(assert (=> b!234810 m!256021))

(declare-fun m!256023 () Bool)

(assert (=> b!234810 m!256023))

(assert (=> b!234810 m!256013))

(declare-fun m!256025 () Bool)

(assert (=> b!234810 m!256025))

(declare-fun m!256027 () Bool)

(assert (=> b!234810 m!256027))

(declare-fun m!256029 () Bool)

(assert (=> b!234810 m!256029))

(assert (=> b!234810 m!256023))

(declare-fun m!256031 () Bool)

(assert (=> b!234810 m!256031))

(declare-fun m!256033 () Bool)

(assert (=> b!234810 m!256033))

(declare-fun m!256035 () Bool)

(assert (=> b!234810 m!256035))

(declare-fun m!256037 () Bool)

(assert (=> b!234810 m!256037))

(assert (=> b!234810 m!256027))

(declare-fun m!256039 () Bool)

(assert (=> b!234810 m!256039))

(assert (=> d!59173 m!255959))

(assert (=> b!234816 m!256035))

(assert (=> b!234816 m!256035))

(declare-fun m!256041 () Bool)

(assert (=> b!234816 m!256041))

(assert (=> b!234808 m!256035))

(declare-fun m!256043 () Bool)

(assert (=> b!234808 m!256043))

(assert (=> b!234808 m!256035))

(declare-fun m!256045 () Bool)

(assert (=> b!234808 m!256045))

(declare-fun m!256047 () Bool)

(assert (=> b!234808 m!256047))

(declare-fun m!256049 () Bool)

(assert (=> b!234808 m!256049))

(assert (=> b!234808 m!256045))

(assert (=> b!234808 m!256047))

(declare-fun m!256051 () Bool)

(assert (=> b!234817 m!256051))

(declare-fun m!256053 () Bool)

(assert (=> b!234803 m!256053))

(assert (=> bm!21832 m!256037))

(assert (=> b!234801 m!256035))

(assert (=> b!234801 m!256035))

(declare-fun m!256055 () Bool)

(assert (=> b!234801 m!256055))

(declare-fun m!256057 () Bool)

(assert (=> bm!21837 m!256057))

(declare-fun m!256059 () Bool)

(assert (=> bm!21835 m!256059))

(assert (=> b!234809 m!256035))

(assert (=> b!234809 m!256035))

(assert (=> b!234809 m!256055))

(declare-fun m!256061 () Bool)

(assert (=> b!234815 m!256061))

(declare-fun m!256063 () Bool)

(assert (=> bm!21834 m!256063))

(assert (=> b!234689 d!59173))

(declare-fun d!59175 () Bool)

(assert (=> d!59175 (= (array_inv!3637 (_keys!6430 thiss!1504)) (bvsge (size!5855 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234693 d!59175))

(declare-fun d!59177 () Bool)

(assert (=> d!59177 (= (array_inv!3638 (_values!4345 thiss!1504)) (bvsge (size!5854 (_values!4345 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234693 d!59177))

(declare-fun b!234828 () Bool)

(declare-fun e!152521 () Bool)

(assert (=> b!234828 (= e!152521 tp_is_empty!6177)))

(declare-fun mapIsEmpty!10459 () Bool)

(declare-fun mapRes!10459 () Bool)

(assert (=> mapIsEmpty!10459 mapRes!10459))

(declare-fun condMapEmpty!10459 () Bool)

(declare-fun mapDefault!10459 () ValueCell!2745)

(assert (=> mapNonEmpty!10453 (= condMapEmpty!10459 (= mapRest!10453 ((as const (Array (_ BitVec 32) ValueCell!2745)) mapDefault!10459)))))

(declare-fun e!152522 () Bool)

(assert (=> mapNonEmpty!10453 (= tp!22105 (and e!152522 mapRes!10459))))

(declare-fun b!234829 () Bool)

(assert (=> b!234829 (= e!152522 tp_is_empty!6177)))

(declare-fun mapNonEmpty!10459 () Bool)

(declare-fun tp!22114 () Bool)

(assert (=> mapNonEmpty!10459 (= mapRes!10459 (and tp!22114 e!152521))))

(declare-fun mapKey!10459 () (_ BitVec 32))

(declare-fun mapRest!10459 () (Array (_ BitVec 32) ValueCell!2745))

(declare-fun mapValue!10459 () ValueCell!2745)

(assert (=> mapNonEmpty!10459 (= mapRest!10453 (store mapRest!10459 mapKey!10459 mapValue!10459))))

(assert (= (and mapNonEmpty!10453 condMapEmpty!10459) mapIsEmpty!10459))

(assert (= (and mapNonEmpty!10453 (not condMapEmpty!10459)) mapNonEmpty!10459))

(assert (= (and mapNonEmpty!10459 ((_ is ValueCellFull!2745) mapValue!10459)) b!234828))

(assert (= (and mapNonEmpty!10453 ((_ is ValueCellFull!2745) mapDefault!10459)) b!234829))

(declare-fun m!256065 () Bool)

(assert (=> mapNonEmpty!10459 m!256065))

(declare-fun b_lambda!7889 () Bool)

(assert (= b_lambda!7887 (or (and b!234693 b_free!6315) b_lambda!7889)))

(check-sat (not b!234816) (not d!59167) (not b!234803) (not bm!21834) (not mapNonEmpty!10459) (not b_next!6315) (not d!59169) (not d!59171) (not b!234754) (not d!59173) (not b!234809) (not bm!21835) (not b!234817) (not bm!21837) (not b!234728) (not b_lambda!7889) tp_is_empty!6177 (not b!234801) (not bm!21832) (not b!234815) (not b!234756) (not b!234729) b_and!13239 (not b!234810) (not b!234744) (not b!234808) (not b!234727))
(check-sat b_and!13239 (not b_next!6315))
(get-model)

(declare-fun d!59179 () Bool)

(declare-fun e!152525 () Bool)

(assert (=> d!59179 e!152525))

(declare-fun res!115168 () Bool)

(assert (=> d!59179 (=> (not res!115168) (not e!152525))))

(declare-fun lt!118821 () ListLongMap!3531)

(assert (=> d!59179 (= res!115168 (contains!1655 lt!118821 (_1!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))))

(declare-fun lt!118823 () List!3527)

(assert (=> d!59179 (= lt!118821 (ListLongMap!3532 lt!118823))))

(declare-fun lt!118822 () Unit!7242)

(declare-fun lt!118820 () Unit!7242)

(assert (=> d!59179 (= lt!118822 lt!118820)))

(assert (=> d!59179 (= (getValueByKey!266 lt!118823 (_1!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))) (Some!271 (_2!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))))

(declare-fun lemmaContainsTupThenGetReturnValue!150 (List!3527 (_ BitVec 64) V!7883) Unit!7242)

(assert (=> d!59179 (= lt!118820 (lemmaContainsTupThenGetReturnValue!150 lt!118823 (_1!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))) (_2!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))))

(declare-fun insertStrictlySorted!153 (List!3527 (_ BitVec 64) V!7883) List!3527)

(assert (=> d!59179 (= lt!118823 (insertStrictlySorted!153 (toList!1781 (ite c!39120 call!21839 (ite c!39117 call!21835 call!21836))) (_1!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))) (_2!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))))

(assert (=> d!59179 (= (+!635 (ite c!39120 call!21839 (ite c!39117 call!21835 call!21836)) (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))) lt!118821)))

(declare-fun b!234834 () Bool)

(declare-fun res!115167 () Bool)

(assert (=> b!234834 (=> (not res!115167) (not e!152525))))

(assert (=> b!234834 (= res!115167 (= (getValueByKey!266 (toList!1781 lt!118821) (_1!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))) (Some!271 (_2!2320 (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))))

(declare-fun b!234835 () Bool)

(declare-fun contains!1656 (List!3527 tuple2!4618) Bool)

(assert (=> b!234835 (= e!152525 (contains!1656 (toList!1781 lt!118821) (ite (or c!39120 c!39117) (tuple2!4619 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4203 thiss!1504)) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))

(assert (= (and d!59179 res!115168) b!234834))

(assert (= (and b!234834 res!115167) b!234835))

(declare-fun m!256067 () Bool)

(assert (=> d!59179 m!256067))

(declare-fun m!256069 () Bool)

(assert (=> d!59179 m!256069))

(declare-fun m!256071 () Bool)

(assert (=> d!59179 m!256071))

(declare-fun m!256073 () Bool)

(assert (=> d!59179 m!256073))

(declare-fun m!256075 () Bool)

(assert (=> b!234834 m!256075))

(declare-fun m!256077 () Bool)

(assert (=> b!234835 m!256077))

(assert (=> bm!21835 d!59179))

(declare-fun d!59181 () Bool)

(declare-fun get!2835 (Option!272) V!7883)

(assert (=> d!59181 (= (apply!208 (+!635 lt!118808 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))) lt!118793) (get!2835 (getValueByKey!266 (toList!1781 (+!635 lt!118808 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))) lt!118793)))))

(declare-fun bs!8695 () Bool)

(assert (= bs!8695 d!59181))

(declare-fun m!256079 () Bool)

(assert (=> bs!8695 m!256079))

(assert (=> bs!8695 m!256079))

(declare-fun m!256081 () Bool)

(assert (=> bs!8695 m!256081))

(assert (=> b!234810 d!59181))

(declare-fun d!59183 () Bool)

(declare-fun e!152526 () Bool)

(assert (=> d!59183 e!152526))

(declare-fun res!115170 () Bool)

(assert (=> d!59183 (=> (not res!115170) (not e!152526))))

(declare-fun lt!118825 () ListLongMap!3531)

(assert (=> d!59183 (= res!115170 (contains!1655 lt!118825 (_1!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))))))

(declare-fun lt!118827 () List!3527)

(assert (=> d!59183 (= lt!118825 (ListLongMap!3532 lt!118827))))

(declare-fun lt!118826 () Unit!7242)

(declare-fun lt!118824 () Unit!7242)

(assert (=> d!59183 (= lt!118826 lt!118824)))

(assert (=> d!59183 (= (getValueByKey!266 lt!118827 (_1!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))))))

(assert (=> d!59183 (= lt!118824 (lemmaContainsTupThenGetReturnValue!150 lt!118827 (_1!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))))))

(assert (=> d!59183 (= lt!118827 (insertStrictlySorted!153 (toList!1781 lt!118797) (_1!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))))))

(assert (=> d!59183 (= (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))) lt!118825)))

(declare-fun b!234836 () Bool)

(declare-fun res!115169 () Bool)

(assert (=> b!234836 (=> (not res!115169) (not e!152526))))

(assert (=> b!234836 (= res!115169 (= (getValueByKey!266 (toList!1781 lt!118825) (_1!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))))))))

(declare-fun b!234837 () Bool)

(assert (=> b!234837 (= e!152526 (contains!1656 (toList!1781 lt!118825) (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))))))

(assert (= (and d!59183 res!115170) b!234836))

(assert (= (and b!234836 res!115169) b!234837))

(declare-fun m!256083 () Bool)

(assert (=> d!59183 m!256083))

(declare-fun m!256085 () Bool)

(assert (=> d!59183 m!256085))

(declare-fun m!256087 () Bool)

(assert (=> d!59183 m!256087))

(declare-fun m!256089 () Bool)

(assert (=> d!59183 m!256089))

(declare-fun m!256091 () Bool)

(assert (=> b!234836 m!256091))

(declare-fun m!256093 () Bool)

(assert (=> b!234837 m!256093))

(assert (=> b!234810 d!59183))

(declare-fun d!59185 () Bool)

(assert (=> d!59185 (= (apply!208 (+!635 lt!118798 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))) lt!118795) (apply!208 lt!118798 lt!118795))))

(declare-fun lt!118830 () Unit!7242)

(declare-fun choose!1101 (ListLongMap!3531 (_ BitVec 64) V!7883 (_ BitVec 64)) Unit!7242)

(assert (=> d!59185 (= lt!118830 (choose!1101 lt!118798 lt!118791 (minValue!4203 thiss!1504) lt!118795))))

(declare-fun e!152529 () Bool)

(assert (=> d!59185 e!152529))

(declare-fun res!115173 () Bool)

(assert (=> d!59185 (=> (not res!115173) (not e!152529))))

(assert (=> d!59185 (= res!115173 (contains!1655 lt!118798 lt!118795))))

(assert (=> d!59185 (= (addApplyDifferent!184 lt!118798 lt!118791 (minValue!4203 thiss!1504) lt!118795) lt!118830)))

(declare-fun b!234841 () Bool)

(assert (=> b!234841 (= e!152529 (not (= lt!118795 lt!118791)))))

(assert (= (and d!59185 res!115173) b!234841))

(declare-fun m!256095 () Bool)

(assert (=> d!59185 m!256095))

(assert (=> d!59185 m!256023))

(assert (=> d!59185 m!256031))

(assert (=> d!59185 m!256023))

(assert (=> d!59185 m!256011))

(declare-fun m!256097 () Bool)

(assert (=> d!59185 m!256097))

(assert (=> b!234810 d!59185))

(declare-fun d!59187 () Bool)

(declare-fun e!152530 () Bool)

(assert (=> d!59187 e!152530))

(declare-fun res!115174 () Bool)

(assert (=> d!59187 (=> res!115174 e!152530)))

(declare-fun lt!118832 () Bool)

(assert (=> d!59187 (= res!115174 (not lt!118832))))

(declare-fun lt!118831 () Bool)

(assert (=> d!59187 (= lt!118832 lt!118831)))

(declare-fun lt!118833 () Unit!7242)

(declare-fun e!152531 () Unit!7242)

(assert (=> d!59187 (= lt!118833 e!152531)))

(declare-fun c!39121 () Bool)

(assert (=> d!59187 (= c!39121 lt!118831)))

(assert (=> d!59187 (= lt!118831 (containsKey!258 (toList!1781 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))) lt!118805))))

(assert (=> d!59187 (= (contains!1655 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))) lt!118805) lt!118832)))

(declare-fun b!234842 () Bool)

(declare-fun lt!118834 () Unit!7242)

(assert (=> b!234842 (= e!152531 lt!118834)))

(assert (=> b!234842 (= lt!118834 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1781 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))) lt!118805))))

(assert (=> b!234842 (isDefined!207 (getValueByKey!266 (toList!1781 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))) lt!118805))))

(declare-fun b!234843 () Bool)

(declare-fun Unit!7246 () Unit!7242)

(assert (=> b!234843 (= e!152531 Unit!7246)))

(declare-fun b!234844 () Bool)

(assert (=> b!234844 (= e!152530 (isDefined!207 (getValueByKey!266 (toList!1781 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504)))) lt!118805)))))

(assert (= (and d!59187 c!39121) b!234842))

(assert (= (and d!59187 (not c!39121)) b!234843))

(assert (= (and d!59187 (not res!115174)) b!234844))

(declare-fun m!256099 () Bool)

(assert (=> d!59187 m!256099))

(declare-fun m!256101 () Bool)

(assert (=> b!234842 m!256101))

(declare-fun m!256103 () Bool)

(assert (=> b!234842 m!256103))

(assert (=> b!234842 m!256103))

(declare-fun m!256105 () Bool)

(assert (=> b!234842 m!256105))

(assert (=> b!234844 m!256103))

(assert (=> b!234844 m!256103))

(assert (=> b!234844 m!256105))

(assert (=> b!234810 d!59187))

(declare-fun d!59189 () Bool)

(assert (=> d!59189 (= (apply!208 (+!635 lt!118808 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))) lt!118793) (apply!208 lt!118808 lt!118793))))

(declare-fun lt!118835 () Unit!7242)

(assert (=> d!59189 (= lt!118835 (choose!1101 lt!118808 lt!118809 (minValue!4203 thiss!1504) lt!118793))))

(declare-fun e!152532 () Bool)

(assert (=> d!59189 e!152532))

(declare-fun res!115175 () Bool)

(assert (=> d!59189 (=> (not res!115175) (not e!152532))))

(assert (=> d!59189 (= res!115175 (contains!1655 lt!118808 lt!118793))))

(assert (=> d!59189 (= (addApplyDifferent!184 lt!118808 lt!118809 (minValue!4203 thiss!1504) lt!118793) lt!118835)))

(declare-fun b!234845 () Bool)

(assert (=> b!234845 (= e!152532 (not (= lt!118793 lt!118809)))))

(assert (= (and d!59189 res!115175) b!234845))

(declare-fun m!256107 () Bool)

(assert (=> d!59189 m!256107))

(assert (=> d!59189 m!256007))

(assert (=> d!59189 m!256009))

(assert (=> d!59189 m!256007))

(assert (=> d!59189 m!256019))

(declare-fun m!256109 () Bool)

(assert (=> d!59189 m!256109))

(assert (=> b!234810 d!59189))

(declare-fun d!59191 () Bool)

(declare-fun e!152533 () Bool)

(assert (=> d!59191 e!152533))

(declare-fun res!115177 () Bool)

(assert (=> d!59191 (=> (not res!115177) (not e!152533))))

(declare-fun lt!118837 () ListLongMap!3531)

(assert (=> d!59191 (= res!115177 (contains!1655 lt!118837 (_1!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))))))

(declare-fun lt!118839 () List!3527)

(assert (=> d!59191 (= lt!118837 (ListLongMap!3532 lt!118839))))

(declare-fun lt!118838 () Unit!7242)

(declare-fun lt!118836 () Unit!7242)

(assert (=> d!59191 (= lt!118838 lt!118836)))

(assert (=> d!59191 (= (getValueByKey!266 lt!118839 (_1!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))))))

(assert (=> d!59191 (= lt!118836 (lemmaContainsTupThenGetReturnValue!150 lt!118839 (_1!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))))))

(assert (=> d!59191 (= lt!118839 (insertStrictlySorted!153 (toList!1781 lt!118790) (_1!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))))))

(assert (=> d!59191 (= (+!635 lt!118790 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))) lt!118837)))

(declare-fun b!234846 () Bool)

(declare-fun res!115176 () Bool)

(assert (=> b!234846 (=> (not res!115176) (not e!152533))))

(assert (=> b!234846 (= res!115176 (= (getValueByKey!266 (toList!1781 lt!118837) (_1!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))))))))

(declare-fun b!234847 () Bool)

(assert (=> b!234847 (= e!152533 (contains!1656 (toList!1781 lt!118837) (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))))))

(assert (= (and d!59191 res!115177) b!234846))

(assert (= (and b!234846 res!115176) b!234847))

(declare-fun m!256111 () Bool)

(assert (=> d!59191 m!256111))

(declare-fun m!256113 () Bool)

(assert (=> d!59191 m!256113))

(declare-fun m!256115 () Bool)

(assert (=> d!59191 m!256115))

(declare-fun m!256117 () Bool)

(assert (=> d!59191 m!256117))

(declare-fun m!256119 () Bool)

(assert (=> b!234846 m!256119))

(declare-fun m!256121 () Bool)

(assert (=> b!234847 m!256121))

(assert (=> b!234810 d!59191))

(declare-fun d!59193 () Bool)

(declare-fun e!152534 () Bool)

(assert (=> d!59193 e!152534))

(declare-fun res!115179 () Bool)

(assert (=> d!59193 (=> (not res!115179) (not e!152534))))

(declare-fun lt!118841 () ListLongMap!3531)

(assert (=> d!59193 (= res!115179 (contains!1655 lt!118841 (_1!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))))))

(declare-fun lt!118843 () List!3527)

(assert (=> d!59193 (= lt!118841 (ListLongMap!3532 lt!118843))))

(declare-fun lt!118842 () Unit!7242)

(declare-fun lt!118840 () Unit!7242)

(assert (=> d!59193 (= lt!118842 lt!118840)))

(assert (=> d!59193 (= (getValueByKey!266 lt!118843 (_1!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))))))

(assert (=> d!59193 (= lt!118840 (lemmaContainsTupThenGetReturnValue!150 lt!118843 (_1!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))))))

(assert (=> d!59193 (= lt!118843 (insertStrictlySorted!153 (toList!1781 lt!118798) (_1!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))))))

(assert (=> d!59193 (= (+!635 lt!118798 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))) lt!118841)))

(declare-fun b!234848 () Bool)

(declare-fun res!115178 () Bool)

(assert (=> b!234848 (=> (not res!115178) (not e!152534))))

(assert (=> b!234848 (= res!115178 (= (getValueByKey!266 (toList!1781 lt!118841) (_1!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))))))))

(declare-fun b!234849 () Bool)

(assert (=> b!234849 (= e!152534 (contains!1656 (toList!1781 lt!118841) (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))))))

(assert (= (and d!59193 res!115179) b!234848))

(assert (= (and b!234848 res!115178) b!234849))

(declare-fun m!256123 () Bool)

(assert (=> d!59193 m!256123))

(declare-fun m!256125 () Bool)

(assert (=> d!59193 m!256125))

(declare-fun m!256127 () Bool)

(assert (=> d!59193 m!256127))

(declare-fun m!256129 () Bool)

(assert (=> d!59193 m!256129))

(declare-fun m!256131 () Bool)

(assert (=> b!234848 m!256131))

(declare-fun m!256133 () Bool)

(assert (=> b!234849 m!256133))

(assert (=> b!234810 d!59193))

(declare-fun d!59195 () Bool)

(declare-fun e!152535 () Bool)

(assert (=> d!59195 e!152535))

(declare-fun res!115181 () Bool)

(assert (=> d!59195 (=> (not res!115181) (not e!152535))))

(declare-fun lt!118845 () ListLongMap!3531)

(assert (=> d!59195 (= res!115181 (contains!1655 lt!118845 (_1!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))))))

(declare-fun lt!118847 () List!3527)

(assert (=> d!59195 (= lt!118845 (ListLongMap!3532 lt!118847))))

(declare-fun lt!118846 () Unit!7242)

(declare-fun lt!118844 () Unit!7242)

(assert (=> d!59195 (= lt!118846 lt!118844)))

(assert (=> d!59195 (= (getValueByKey!266 lt!118847 (_1!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))))))

(assert (=> d!59195 (= lt!118844 (lemmaContainsTupThenGetReturnValue!150 lt!118847 (_1!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))))))

(assert (=> d!59195 (= lt!118847 (insertStrictlySorted!153 (toList!1781 lt!118808) (_1!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))))))

(assert (=> d!59195 (= (+!635 lt!118808 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))) lt!118845)))

(declare-fun b!234850 () Bool)

(declare-fun res!115180 () Bool)

(assert (=> b!234850 (=> (not res!115180) (not e!152535))))

(assert (=> b!234850 (= res!115180 (= (getValueByKey!266 (toList!1781 lt!118845) (_1!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))))))))

(declare-fun b!234851 () Bool)

(assert (=> b!234851 (= e!152535 (contains!1656 (toList!1781 lt!118845) (tuple2!4619 lt!118809 (minValue!4203 thiss!1504))))))

(assert (= (and d!59195 res!115181) b!234850))

(assert (= (and b!234850 res!115180) b!234851))

(declare-fun m!256135 () Bool)

(assert (=> d!59195 m!256135))

(declare-fun m!256137 () Bool)

(assert (=> d!59195 m!256137))

(declare-fun m!256139 () Bool)

(assert (=> d!59195 m!256139))

(declare-fun m!256141 () Bool)

(assert (=> d!59195 m!256141))

(declare-fun m!256143 () Bool)

(assert (=> b!234850 m!256143))

(declare-fun m!256145 () Bool)

(assert (=> b!234851 m!256145))

(assert (=> b!234810 d!59195))

(declare-fun b!234876 () Bool)

(declare-fun e!152550 () ListLongMap!3531)

(declare-fun call!21843 () ListLongMap!3531)

(assert (=> b!234876 (= e!152550 call!21843)))

(declare-fun b!234877 () Bool)

(declare-fun e!152551 () Bool)

(declare-fun lt!118863 () ListLongMap!3531)

(assert (=> b!234877 (= e!152551 (= lt!118863 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4362 thiss!1504))))))

(declare-fun b!234878 () Bool)

(declare-fun e!152553 () Bool)

(assert (=> b!234878 (= e!152553 e!152551)))

(declare-fun c!39132 () Bool)

(assert (=> b!234878 (= c!39132 (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun b!234879 () Bool)

(declare-fun e!152552 () Bool)

(assert (=> b!234879 (= e!152553 e!152552)))

(assert (=> b!234879 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun res!115192 () Bool)

(assert (=> b!234879 (= res!115192 (contains!1655 lt!118863 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234879 (=> (not res!115192) (not e!152552))))

(declare-fun b!234880 () Bool)

(declare-fun isEmpty!510 (ListLongMap!3531) Bool)

(assert (=> b!234880 (= e!152551 (isEmpty!510 lt!118863))))

(declare-fun b!234881 () Bool)

(declare-fun e!152554 () Bool)

(assert (=> b!234881 (= e!152554 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234881 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!234882 () Bool)

(declare-fun res!115193 () Bool)

(declare-fun e!152556 () Bool)

(assert (=> b!234882 (=> (not res!115193) (not e!152556))))

(assert (=> b!234882 (= res!115193 (not (contains!1655 lt!118863 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234883 () Bool)

(declare-fun e!152555 () ListLongMap!3531)

(assert (=> b!234883 (= e!152555 (ListLongMap!3532 Nil!3524))))

(declare-fun b!234884 () Bool)

(assert (=> b!234884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> b!234884 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5854 (_values!4345 thiss!1504))))))

(assert (=> b!234884 (= e!152552 (= (apply!208 lt!118863 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)) (get!2834 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!21840 () Bool)

(assert (=> bm!21840 (= call!21843 (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!4362 thiss!1504)))))

(declare-fun b!234885 () Bool)

(assert (=> b!234885 (= e!152555 e!152550)))

(declare-fun c!39133 () Bool)

(assert (=> b!234885 (= c!39133 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234886 () Bool)

(assert (=> b!234886 (= e!152556 e!152553)))

(declare-fun c!39131 () Bool)

(assert (=> b!234886 (= c!39131 e!152554)))

(declare-fun res!115191 () Bool)

(assert (=> b!234886 (=> (not res!115191) (not e!152554))))

(assert (=> b!234886 (= res!115191 (bvslt #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun d!59197 () Bool)

(assert (=> d!59197 e!152556))

(declare-fun res!115190 () Bool)

(assert (=> d!59197 (=> (not res!115190) (not e!152556))))

(assert (=> d!59197 (= res!115190 (not (contains!1655 lt!118863 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!59197 (= lt!118863 e!152555)))

(declare-fun c!39130 () Bool)

(assert (=> d!59197 (= c!39130 (bvsge #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> d!59197 (validMask!0 (mask!10316 thiss!1504))))

(assert (=> d!59197 (= (getCurrentListMapNoExtraKeys!530 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)) lt!118863)))

(declare-fun b!234887 () Bool)

(declare-fun lt!118868 () Unit!7242)

(declare-fun lt!118864 () Unit!7242)

(assert (=> b!234887 (= lt!118868 lt!118864)))

(declare-fun lt!118865 () (_ BitVec 64))

(declare-fun lt!118862 () (_ BitVec 64))

(declare-fun lt!118867 () ListLongMap!3531)

(declare-fun lt!118866 () V!7883)

(assert (=> b!234887 (not (contains!1655 (+!635 lt!118867 (tuple2!4619 lt!118865 lt!118866)) lt!118862))))

(declare-fun addStillNotContains!114 (ListLongMap!3531 (_ BitVec 64) V!7883 (_ BitVec 64)) Unit!7242)

(assert (=> b!234887 (= lt!118864 (addStillNotContains!114 lt!118867 lt!118865 lt!118866 lt!118862))))

(assert (=> b!234887 (= lt!118862 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!234887 (= lt!118866 (get!2834 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!234887 (= lt!118865 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!234887 (= lt!118867 call!21843)))

(assert (=> b!234887 (= e!152550 (+!635 call!21843 (tuple2!4619 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000) (get!2834 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!59197 c!39130) b!234883))

(assert (= (and d!59197 (not c!39130)) b!234885))

(assert (= (and b!234885 c!39133) b!234887))

(assert (= (and b!234885 (not c!39133)) b!234876))

(assert (= (or b!234887 b!234876) bm!21840))

(assert (= (and d!59197 res!115190) b!234882))

(assert (= (and b!234882 res!115193) b!234886))

(assert (= (and b!234886 res!115191) b!234881))

(assert (= (and b!234886 c!39131) b!234879))

(assert (= (and b!234886 (not c!39131)) b!234878))

(assert (= (and b!234879 res!115192) b!234884))

(assert (= (and b!234878 c!39132) b!234877))

(assert (= (and b!234878 (not c!39132)) b!234880))

(declare-fun b_lambda!7891 () Bool)

(assert (=> (not b_lambda!7891) (not b!234884)))

(assert (=> b!234884 t!8498))

(declare-fun b_and!13241 () Bool)

(assert (= b_and!13239 (and (=> t!8498 result!5109) b_and!13241)))

(declare-fun b_lambda!7893 () Bool)

(assert (=> (not b_lambda!7893) (not b!234887)))

(assert (=> b!234887 t!8498))

(declare-fun b_and!13243 () Bool)

(assert (= b_and!13241 (and (=> t!8498 result!5109) b_and!13243)))

(assert (=> b!234879 m!256035))

(assert (=> b!234879 m!256035))

(declare-fun m!256147 () Bool)

(assert (=> b!234879 m!256147))

(declare-fun m!256149 () Bool)

(assert (=> d!59197 m!256149))

(assert (=> d!59197 m!255959))

(declare-fun m!256151 () Bool)

(assert (=> b!234877 m!256151))

(assert (=> b!234885 m!256035))

(assert (=> b!234885 m!256035))

(assert (=> b!234885 m!256055))

(declare-fun m!256153 () Bool)

(assert (=> b!234880 m!256153))

(declare-fun m!256155 () Bool)

(assert (=> b!234882 m!256155))

(assert (=> bm!21840 m!256151))

(assert (=> b!234887 m!256045))

(assert (=> b!234887 m!256047))

(assert (=> b!234887 m!256035))

(declare-fun m!256157 () Bool)

(assert (=> b!234887 m!256157))

(declare-fun m!256159 () Bool)

(assert (=> b!234887 m!256159))

(assert (=> b!234887 m!256157))

(assert (=> b!234887 m!256045))

(assert (=> b!234887 m!256047))

(assert (=> b!234887 m!256049))

(declare-fun m!256161 () Bool)

(assert (=> b!234887 m!256161))

(declare-fun m!256163 () Bool)

(assert (=> b!234887 m!256163))

(assert (=> b!234881 m!256035))

(assert (=> b!234881 m!256035))

(assert (=> b!234881 m!256055))

(assert (=> b!234884 m!256045))

(assert (=> b!234884 m!256035))

(declare-fun m!256165 () Bool)

(assert (=> b!234884 m!256165))

(assert (=> b!234884 m!256047))

(assert (=> b!234884 m!256035))

(assert (=> b!234884 m!256045))

(assert (=> b!234884 m!256047))

(assert (=> b!234884 m!256049))

(assert (=> b!234810 d!59197))

(declare-fun d!59199 () Bool)

(assert (=> d!59199 (= (apply!208 (+!635 lt!118798 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504))) lt!118795) (get!2835 (getValueByKey!266 (toList!1781 (+!635 lt!118798 (tuple2!4619 lt!118791 (minValue!4203 thiss!1504)))) lt!118795)))))

(declare-fun bs!8696 () Bool)

(assert (= bs!8696 d!59199))

(declare-fun m!256167 () Bool)

(assert (=> bs!8696 m!256167))

(assert (=> bs!8696 m!256167))

(declare-fun m!256169 () Bool)

(assert (=> bs!8696 m!256169))

(assert (=> b!234810 d!59199))

(declare-fun d!59201 () Bool)

(assert (=> d!59201 (= (apply!208 lt!118790 lt!118802) (get!2835 (getValueByKey!266 (toList!1781 lt!118790) lt!118802)))))

(declare-fun bs!8697 () Bool)

(assert (= bs!8697 d!59201))

(declare-fun m!256171 () Bool)

(assert (=> bs!8697 m!256171))

(assert (=> bs!8697 m!256171))

(declare-fun m!256173 () Bool)

(assert (=> bs!8697 m!256173))

(assert (=> b!234810 d!59201))

(declare-fun d!59203 () Bool)

(assert (=> d!59203 (contains!1655 (+!635 lt!118797 (tuple2!4619 lt!118810 (zeroValue!4203 thiss!1504))) lt!118805)))

(declare-fun lt!118871 () Unit!7242)

(declare-fun choose!1102 (ListLongMap!3531 (_ BitVec 64) V!7883 (_ BitVec 64)) Unit!7242)

(assert (=> d!59203 (= lt!118871 (choose!1102 lt!118797 lt!118810 (zeroValue!4203 thiss!1504) lt!118805))))

(assert (=> d!59203 (contains!1655 lt!118797 lt!118805)))

(assert (=> d!59203 (= (addStillContains!184 lt!118797 lt!118810 (zeroValue!4203 thiss!1504) lt!118805) lt!118871)))

(declare-fun bs!8698 () Bool)

(assert (= bs!8698 d!59203))

(assert (=> bs!8698 m!256013))

(assert (=> bs!8698 m!256013))

(assert (=> bs!8698 m!256015))

(declare-fun m!256175 () Bool)

(assert (=> bs!8698 m!256175))

(declare-fun m!256177 () Bool)

(assert (=> bs!8698 m!256177))

(assert (=> b!234810 d!59203))

(declare-fun d!59205 () Bool)

(assert (=> d!59205 (= (apply!208 (+!635 lt!118790 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))) lt!118802) (apply!208 lt!118790 lt!118802))))

(declare-fun lt!118872 () Unit!7242)

(assert (=> d!59205 (= lt!118872 (choose!1101 lt!118790 lt!118811 (zeroValue!4203 thiss!1504) lt!118802))))

(declare-fun e!152557 () Bool)

(assert (=> d!59205 e!152557))

(declare-fun res!115194 () Bool)

(assert (=> d!59205 (=> (not res!115194) (not e!152557))))

(assert (=> d!59205 (= res!115194 (contains!1655 lt!118790 lt!118802))))

(assert (=> d!59205 (= (addApplyDifferent!184 lt!118790 lt!118811 (zeroValue!4203 thiss!1504) lt!118802) lt!118872)))

(declare-fun b!234889 () Bool)

(assert (=> b!234889 (= e!152557 (not (= lt!118802 lt!118811)))))

(assert (= (and d!59205 res!115194) b!234889))

(declare-fun m!256179 () Bool)

(assert (=> d!59205 m!256179))

(assert (=> d!59205 m!256027))

(assert (=> d!59205 m!256029))

(assert (=> d!59205 m!256027))

(assert (=> d!59205 m!256039))

(declare-fun m!256181 () Bool)

(assert (=> d!59205 m!256181))

(assert (=> b!234810 d!59205))

(declare-fun d!59207 () Bool)

(assert (=> d!59207 (= (apply!208 lt!118808 lt!118793) (get!2835 (getValueByKey!266 (toList!1781 lt!118808) lt!118793)))))

(declare-fun bs!8699 () Bool)

(assert (= bs!8699 d!59207))

(declare-fun m!256183 () Bool)

(assert (=> bs!8699 m!256183))

(assert (=> bs!8699 m!256183))

(declare-fun m!256185 () Bool)

(assert (=> bs!8699 m!256185))

(assert (=> b!234810 d!59207))

(declare-fun d!59209 () Bool)

(assert (=> d!59209 (= (apply!208 lt!118798 lt!118795) (get!2835 (getValueByKey!266 (toList!1781 lt!118798) lt!118795)))))

(declare-fun bs!8700 () Bool)

(assert (= bs!8700 d!59209))

(declare-fun m!256187 () Bool)

(assert (=> bs!8700 m!256187))

(assert (=> bs!8700 m!256187))

(declare-fun m!256189 () Bool)

(assert (=> bs!8700 m!256189))

(assert (=> b!234810 d!59209))

(declare-fun d!59211 () Bool)

(assert (=> d!59211 (= (apply!208 (+!635 lt!118790 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504))) lt!118802) (get!2835 (getValueByKey!266 (toList!1781 (+!635 lt!118790 (tuple2!4619 lt!118811 (zeroValue!4203 thiss!1504)))) lt!118802)))))

(declare-fun bs!8701 () Bool)

(assert (= bs!8701 d!59211))

(declare-fun m!256191 () Bool)

(assert (=> bs!8701 m!256191))

(assert (=> bs!8701 m!256191))

(declare-fun m!256193 () Bool)

(assert (=> bs!8701 m!256193))

(assert (=> b!234810 d!59211))

(declare-fun d!59213 () Bool)

(assert (=> d!59213 (= (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)) (and (not (= (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!234801 d!59213))

(declare-fun d!59215 () Bool)

(declare-fun e!152558 () Bool)

(assert (=> d!59215 e!152558))

(declare-fun res!115195 () Bool)

(assert (=> d!59215 (=> res!115195 e!152558)))

(declare-fun lt!118874 () Bool)

(assert (=> d!59215 (= res!115195 (not lt!118874))))

(declare-fun lt!118873 () Bool)

(assert (=> d!59215 (= lt!118874 lt!118873)))

(declare-fun lt!118875 () Unit!7242)

(declare-fun e!152559 () Unit!7242)

(assert (=> d!59215 (= lt!118875 e!152559)))

(declare-fun c!39134 () Bool)

(assert (=> d!59215 (= c!39134 lt!118873)))

(assert (=> d!59215 (= lt!118873 (containsKey!258 (toList!1781 lt!118794) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59215 (= (contains!1655 lt!118794 #b1000000000000000000000000000000000000000000000000000000000000000) lt!118874)))

(declare-fun b!234890 () Bool)

(declare-fun lt!118876 () Unit!7242)

(assert (=> b!234890 (= e!152559 lt!118876)))

(assert (=> b!234890 (= lt!118876 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1781 lt!118794) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234890 (isDefined!207 (getValueByKey!266 (toList!1781 lt!118794) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234891 () Bool)

(declare-fun Unit!7247 () Unit!7242)

(assert (=> b!234891 (= e!152559 Unit!7247)))

(declare-fun b!234892 () Bool)

(assert (=> b!234892 (= e!152558 (isDefined!207 (getValueByKey!266 (toList!1781 lt!118794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59215 c!39134) b!234890))

(assert (= (and d!59215 (not c!39134)) b!234891))

(assert (= (and d!59215 (not res!115195)) b!234892))

(declare-fun m!256195 () Bool)

(assert (=> d!59215 m!256195))

(declare-fun m!256197 () Bool)

(assert (=> b!234890 m!256197))

(declare-fun m!256199 () Bool)

(assert (=> b!234890 m!256199))

(assert (=> b!234890 m!256199))

(declare-fun m!256201 () Bool)

(assert (=> b!234890 m!256201))

(assert (=> b!234892 m!256199))

(assert (=> b!234892 m!256199))

(assert (=> b!234892 m!256201))

(assert (=> bm!21834 d!59215))

(assert (=> b!234809 d!59213))

(declare-fun d!59217 () Bool)

(assert (=> d!59217 (= (apply!208 lt!118794 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)) (get!2835 (getValueByKey!266 (toList!1781 lt!118794) (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))))

(declare-fun bs!8702 () Bool)

(assert (= bs!8702 d!59217))

(assert (=> bs!8702 m!256035))

(declare-fun m!256203 () Bool)

(assert (=> bs!8702 m!256203))

(assert (=> bs!8702 m!256203))

(declare-fun m!256205 () Bool)

(assert (=> bs!8702 m!256205))

(assert (=> b!234808 d!59217))

(declare-fun d!59219 () Bool)

(declare-fun c!39137 () Bool)

(assert (=> d!59219 (= c!39137 ((_ is ValueCellFull!2745) (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152562 () V!7883)

(assert (=> d!59219 (= (get!2834 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)) e!152562)))

(declare-fun b!234897 () Bool)

(declare-fun get!2836 (ValueCell!2745 V!7883) V!7883)

(assert (=> b!234897 (= e!152562 (get!2836 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!234898 () Bool)

(declare-fun get!2837 (ValueCell!2745 V!7883) V!7883)

(assert (=> b!234898 (= e!152562 (get!2837 (select (arr!5518 (_values!4345 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!551 (defaultEntry!4362 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59219 c!39137) b!234897))

(assert (= (and d!59219 (not c!39137)) b!234898))

(assert (=> b!234897 m!256045))

(assert (=> b!234897 m!256047))

(declare-fun m!256207 () Bool)

(assert (=> b!234897 m!256207))

(assert (=> b!234898 m!256045))

(assert (=> b!234898 m!256047))

(declare-fun m!256209 () Bool)

(assert (=> b!234898 m!256209))

(assert (=> b!234808 d!59219))

(declare-fun d!59221 () Bool)

(declare-fun lt!118882 () SeekEntryResult!982)

(assert (=> d!59221 (and (or ((_ is Undefined!982) lt!118882) (not ((_ is Found!982) lt!118882)) (and (bvsge (index!6099 lt!118882) #b00000000000000000000000000000000) (bvslt (index!6099 lt!118882) (size!5855 (_keys!6430 thiss!1504))))) (or ((_ is Undefined!982) lt!118882) ((_ is Found!982) lt!118882) (not ((_ is MissingVacant!982) lt!118882)) (not (= (index!6101 lt!118882) (index!6100 lt!118731))) (and (bvsge (index!6101 lt!118882) #b00000000000000000000000000000000) (bvslt (index!6101 lt!118882) (size!5855 (_keys!6430 thiss!1504))))) (or ((_ is Undefined!982) lt!118882) (ite ((_ is Found!982) lt!118882) (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6099 lt!118882)) key!932) (and ((_ is MissingVacant!982) lt!118882) (= (index!6101 lt!118882) (index!6100 lt!118731)) (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6101 lt!118882)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!152570 () SeekEntryResult!982)

(assert (=> d!59221 (= lt!118882 e!152570)))

(declare-fun c!39146 () Bool)

(assert (=> d!59221 (= c!39146 (bvsge (x!23724 lt!118731) #b01111111111111111111111111111110))))

(declare-fun lt!118881 () (_ BitVec 64))

(assert (=> d!59221 (= lt!118881 (select (arr!5519 (_keys!6430 thiss!1504)) (index!6100 lt!118731)))))

(assert (=> d!59221 (validMask!0 (mask!10316 thiss!1504))))

(assert (=> d!59221 (= (seekKeyOrZeroReturnVacant!0 (x!23724 lt!118731) (index!6100 lt!118731) (index!6100 lt!118731) key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)) lt!118882)))

(declare-fun b!234911 () Bool)

(declare-fun e!152569 () SeekEntryResult!982)

(assert (=> b!234911 (= e!152570 e!152569)))

(declare-fun c!39145 () Bool)

(assert (=> b!234911 (= c!39145 (= lt!118881 key!932))))

(declare-fun b!234912 () Bool)

(declare-fun e!152571 () SeekEntryResult!982)

(assert (=> b!234912 (= e!152571 (MissingVacant!982 (index!6100 lt!118731)))))

(declare-fun b!234913 () Bool)

(assert (=> b!234913 (= e!152570 Undefined!982)))

(declare-fun b!234914 () Bool)

(declare-fun c!39144 () Bool)

(assert (=> b!234914 (= c!39144 (= lt!118881 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234914 (= e!152569 e!152571)))

(declare-fun b!234915 () Bool)

(assert (=> b!234915 (= e!152569 (Found!982 (index!6100 lt!118731)))))

(declare-fun b!234916 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!234916 (= e!152571 (seekKeyOrZeroReturnVacant!0 (bvadd (x!23724 lt!118731) #b00000000000000000000000000000001) (nextIndex!0 (index!6100 lt!118731) (x!23724 lt!118731) (mask!10316 thiss!1504)) (index!6100 lt!118731) key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(assert (= (and d!59221 c!39146) b!234913))

(assert (= (and d!59221 (not c!39146)) b!234911))

(assert (= (and b!234911 c!39145) b!234915))

(assert (= (and b!234911 (not c!39145)) b!234914))

(assert (= (and b!234914 c!39144) b!234912))

(assert (= (and b!234914 (not c!39144)) b!234916))

(declare-fun m!256211 () Bool)

(assert (=> d!59221 m!256211))

(declare-fun m!256213 () Bool)

(assert (=> d!59221 m!256213))

(assert (=> d!59221 m!255987))

(assert (=> d!59221 m!255959))

(declare-fun m!256215 () Bool)

(assert (=> b!234916 m!256215))

(assert (=> b!234916 m!256215))

(declare-fun m!256217 () Bool)

(assert (=> b!234916 m!256217))

(assert (=> b!234744 d!59221))

(declare-fun d!59223 () Bool)

(declare-fun e!152572 () Bool)

(assert (=> d!59223 e!152572))

(declare-fun res!115196 () Bool)

(assert (=> d!59223 (=> res!115196 e!152572)))

(declare-fun lt!118884 () Bool)

(assert (=> d!59223 (= res!115196 (not lt!118884))))

(declare-fun lt!118883 () Bool)

(assert (=> d!59223 (= lt!118884 lt!118883)))

(declare-fun lt!118885 () Unit!7242)

(declare-fun e!152573 () Unit!7242)

(assert (=> d!59223 (= lt!118885 e!152573)))

(declare-fun c!39147 () Bool)

(assert (=> d!59223 (= c!39147 lt!118883)))

(assert (=> d!59223 (= lt!118883 (containsKey!258 (toList!1781 lt!118794) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!59223 (= (contains!1655 lt!118794 #b0000000000000000000000000000000000000000000000000000000000000000) lt!118884)))

(declare-fun b!234917 () Bool)

(declare-fun lt!118886 () Unit!7242)

(assert (=> b!234917 (= e!152573 lt!118886)))

(assert (=> b!234917 (= lt!118886 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1781 lt!118794) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!234917 (isDefined!207 (getValueByKey!266 (toList!1781 lt!118794) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!234918 () Bool)

(declare-fun Unit!7248 () Unit!7242)

(assert (=> b!234918 (= e!152573 Unit!7248)))

(declare-fun b!234919 () Bool)

(assert (=> b!234919 (= e!152572 (isDefined!207 (getValueByKey!266 (toList!1781 lt!118794) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!59223 c!39147) b!234917))

(assert (= (and d!59223 (not c!39147)) b!234918))

(assert (= (and d!59223 (not res!115196)) b!234919))

(declare-fun m!256219 () Bool)

(assert (=> d!59223 m!256219))

(declare-fun m!256221 () Bool)

(assert (=> b!234917 m!256221))

(declare-fun m!256223 () Bool)

(assert (=> b!234917 m!256223))

(assert (=> b!234917 m!256223))

(declare-fun m!256225 () Bool)

(assert (=> b!234917 m!256225))

(assert (=> b!234919 m!256223))

(assert (=> b!234919 m!256223))

(assert (=> b!234919 m!256225))

(assert (=> bm!21837 d!59223))

(declare-fun d!59225 () Bool)

(assert (=> d!59225 (= (apply!208 lt!118794 #b0000000000000000000000000000000000000000000000000000000000000000) (get!2835 (getValueByKey!266 (toList!1781 lt!118794) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8703 () Bool)

(assert (= bs!8703 d!59225))

(assert (=> bs!8703 m!256223))

(assert (=> bs!8703 m!256223))

(declare-fun m!256227 () Bool)

(assert (=> bs!8703 m!256227))

(assert (=> b!234803 d!59225))

(declare-fun d!59227 () Bool)

(declare-fun res!115201 () Bool)

(declare-fun e!152578 () Bool)

(assert (=> d!59227 (=> res!115201 e!152578)))

(assert (=> d!59227 (= res!115201 (and ((_ is Cons!3523) (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))) (= (_1!2320 (h!4174 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))))) key!932)))))

(assert (=> d!59227 (= (containsKey!258 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932) e!152578)))

(declare-fun b!234924 () Bool)

(declare-fun e!152579 () Bool)

(assert (=> b!234924 (= e!152578 e!152579)))

(declare-fun res!115202 () Bool)

(assert (=> b!234924 (=> (not res!115202) (not e!152579))))

(assert (=> b!234924 (= res!115202 (and (or (not ((_ is Cons!3523) (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))))) (bvsle (_1!2320 (h!4174 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))))) key!932)) ((_ is Cons!3523) (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))) (bvslt (_1!2320 (h!4174 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))))) key!932)))))

(declare-fun b!234925 () Bool)

(assert (=> b!234925 (= e!152579 (containsKey!258 (t!8496 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))) key!932))))

(assert (= (and d!59227 (not res!115201)) b!234924))

(assert (= (and b!234924 res!115202) b!234925))

(declare-fun m!256229 () Bool)

(assert (=> b!234925 m!256229))

(assert (=> d!59171 d!59227))

(declare-fun d!59229 () Bool)

(declare-fun isEmpty!511 (Option!272) Bool)

(assert (=> d!59229 (= (isDefined!207 (getValueByKey!266 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932)) (not (isEmpty!511 (getValueByKey!266 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))))

(declare-fun bs!8704 () Bool)

(assert (= bs!8704 d!59229))

(assert (=> bs!8704 m!256003))

(declare-fun m!256231 () Bool)

(assert (=> bs!8704 m!256231))

(assert (=> b!234756 d!59229))

(declare-fun b!234936 () Bool)

(declare-fun e!152585 () Option!272)

(assert (=> b!234936 (= e!152585 (getValueByKey!266 (t!8496 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))) key!932))))

(declare-fun b!234935 () Bool)

(declare-fun e!152584 () Option!272)

(assert (=> b!234935 (= e!152584 e!152585)))

(declare-fun c!39153 () Bool)

(assert (=> b!234935 (= c!39153 (and ((_ is Cons!3523) (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))) (not (= (_1!2320 (h!4174 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))))) key!932))))))

(declare-fun b!234934 () Bool)

(assert (=> b!234934 (= e!152584 (Some!271 (_2!2320 (h!4174 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))))))

(declare-fun b!234937 () Bool)

(assert (=> b!234937 (= e!152585 None!270)))

(declare-fun d!59231 () Bool)

(declare-fun c!39152 () Bool)

(assert (=> d!59231 (= c!39152 (and ((_ is Cons!3523) (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))) (= (_1!2320 (h!4174 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))))) key!932)))))

(assert (=> d!59231 (= (getValueByKey!266 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932) e!152584)))

(assert (= (and d!59231 c!39152) b!234934))

(assert (= (and d!59231 (not c!39152)) b!234935))

(assert (= (and b!234935 c!39153) b!234936))

(assert (= (and b!234935 (not c!39153)) b!234937))

(declare-fun m!256233 () Bool)

(assert (=> b!234936 m!256233))

(assert (=> b!234756 d!59231))

(assert (=> d!59173 d!59165))

(declare-fun bm!21843 () Bool)

(declare-fun call!21846 () (_ BitVec 32))

(assert (=> bm!21843 (= call!21846 (arrayCountValidKeys!0 (_keys!6430 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun d!59233 () Bool)

(declare-fun lt!118889 () (_ BitVec 32))

(assert (=> d!59233 (and (bvsge lt!118889 #b00000000000000000000000000000000) (bvsle lt!118889 (bvsub (size!5855 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun e!152591 () (_ BitVec 32))

(assert (=> d!59233 (= lt!118889 e!152591)))

(declare-fun c!39158 () Bool)

(assert (=> d!59233 (= c!39158 (bvsge #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> d!59233 (and (bvsle #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!5855 (_keys!6430 thiss!1504)) (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> d!59233 (= (arrayCountValidKeys!0 (_keys!6430 thiss!1504) #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))) lt!118889)))

(declare-fun b!234946 () Bool)

(declare-fun e!152590 () (_ BitVec 32))

(assert (=> b!234946 (= e!152590 (bvadd #b00000000000000000000000000000001 call!21846))))

(declare-fun b!234947 () Bool)

(assert (=> b!234947 (= e!152591 #b00000000000000000000000000000000)))

(declare-fun b!234948 () Bool)

(assert (=> b!234948 (= e!152590 call!21846)))

(declare-fun b!234949 () Bool)

(assert (=> b!234949 (= e!152591 e!152590)))

(declare-fun c!39159 () Bool)

(assert (=> b!234949 (= c!39159 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (= (and d!59233 c!39158) b!234947))

(assert (= (and d!59233 (not c!39158)) b!234949))

(assert (= (and b!234949 c!39159) b!234946))

(assert (= (and b!234949 (not c!39159)) b!234948))

(assert (= (or b!234946 b!234948) bm!21843))

(declare-fun m!256235 () Bool)

(assert (=> bm!21843 m!256235))

(assert (=> b!234949 m!256035))

(assert (=> b!234949 m!256035))

(assert (=> b!234949 m!256055))

(assert (=> b!234727 d!59233))

(assert (=> bm!21832 d!59197))

(declare-fun b!234958 () Bool)

(declare-fun res!115211 () Bool)

(declare-fun e!152594 () Bool)

(assert (=> b!234958 (=> (not res!115211) (not e!152594))))

(assert (=> b!234958 (= res!115211 (and (= (size!5854 (_values!4345 thiss!1504)) (bvadd (mask!10316 thiss!1504) #b00000000000000000000000000000001)) (= (size!5855 (_keys!6430 thiss!1504)) (size!5854 (_values!4345 thiss!1504))) (bvsge (_size!1744 thiss!1504) #b00000000000000000000000000000000) (bvsle (_size!1744 thiss!1504) (bvadd (mask!10316 thiss!1504) #b00000000000000000000000000000001))))))

(declare-fun d!59235 () Bool)

(declare-fun res!115213 () Bool)

(assert (=> d!59235 (=> (not res!115213) (not e!152594))))

(assert (=> d!59235 (= res!115213 (validMask!0 (mask!10316 thiss!1504)))))

(assert (=> d!59235 (= (simpleValid!231 thiss!1504) e!152594)))

(declare-fun b!234961 () Bool)

(assert (=> b!234961 (= e!152594 (and (bvsge (extraKeys!4099 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!4099 thiss!1504) #b00000000000000000000000000000011) (bvsge (_vacant!1744 thiss!1504) #b00000000000000000000000000000000)))))

(declare-fun b!234959 () Bool)

(declare-fun res!115214 () Bool)

(assert (=> b!234959 (=> (not res!115214) (not e!152594))))

(declare-fun size!5858 (LongMapFixedSize!3390) (_ BitVec 32))

(assert (=> b!234959 (= res!115214 (bvsge (size!5858 thiss!1504) (_size!1744 thiss!1504)))))

(declare-fun b!234960 () Bool)

(declare-fun res!115212 () Bool)

(assert (=> b!234960 (=> (not res!115212) (not e!152594))))

(assert (=> b!234960 (= res!115212 (= (size!5858 thiss!1504) (bvadd (_size!1744 thiss!1504) (bvsdiv (bvadd (extraKeys!4099 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!59235 res!115213) b!234958))

(assert (= (and b!234958 res!115211) b!234959))

(assert (= (and b!234959 res!115214) b!234960))

(assert (= (and b!234960 res!115212) b!234961))

(assert (=> d!59235 m!255959))

(declare-fun m!256237 () Bool)

(assert (=> b!234959 m!256237))

(assert (=> b!234960 m!256237))

(assert (=> d!59167 d!59235))

(declare-fun d!59237 () Bool)

(assert (=> d!59237 (isDefined!207 (getValueByKey!266 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))

(declare-fun lt!118892 () Unit!7242)

(declare-fun choose!1103 (List!3527 (_ BitVec 64)) Unit!7242)

(assert (=> d!59237 (= lt!118892 (choose!1103 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))

(declare-fun e!152597 () Bool)

(assert (=> d!59237 e!152597))

(declare-fun res!115217 () Bool)

(assert (=> d!59237 (=> (not res!115217) (not e!152597))))

(declare-fun isStrictlySorted!362 (List!3527) Bool)

(assert (=> d!59237 (= res!115217 (isStrictlySorted!362 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504)))))))

(assert (=> d!59237 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932) lt!118892)))

(declare-fun b!234964 () Bool)

(assert (=> b!234964 (= e!152597 (containsKey!258 (toList!1781 (getCurrentListMap!1309 (_keys!6430 thiss!1504) (_values!4345 thiss!1504) (mask!10316 thiss!1504) (extraKeys!4099 thiss!1504) (zeroValue!4203 thiss!1504) (minValue!4203 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4362 thiss!1504))) key!932))))

(assert (= (and d!59237 res!115217) b!234964))

(assert (=> d!59237 m!256003))

(assert (=> d!59237 m!256003))

(assert (=> d!59237 m!256005))

(declare-fun m!256239 () Bool)

(assert (=> d!59237 m!256239))

(declare-fun m!256241 () Bool)

(assert (=> d!59237 m!256241))

(assert (=> b!234964 m!255999))

(assert (=> b!234754 d!59237))

(assert (=> b!234754 d!59229))

(assert (=> b!234754 d!59231))

(declare-fun d!59239 () Bool)

(assert (=> d!59239 (= (apply!208 lt!118794 #b1000000000000000000000000000000000000000000000000000000000000000) (get!2835 (getValueByKey!266 (toList!1781 lt!118794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!8705 () Bool)

(assert (= bs!8705 d!59239))

(assert (=> bs!8705 m!256199))

(assert (=> bs!8705 m!256199))

(declare-fun m!256243 () Bool)

(assert (=> bs!8705 m!256243))

(assert (=> b!234817 d!59239))

(declare-fun d!59241 () Bool)

(declare-fun e!152598 () Bool)

(assert (=> d!59241 e!152598))

(declare-fun res!115218 () Bool)

(assert (=> d!59241 (=> res!115218 e!152598)))

(declare-fun lt!118894 () Bool)

(assert (=> d!59241 (= res!115218 (not lt!118894))))

(declare-fun lt!118893 () Bool)

(assert (=> d!59241 (= lt!118894 lt!118893)))

(declare-fun lt!118895 () Unit!7242)

(declare-fun e!152599 () Unit!7242)

(assert (=> d!59241 (= lt!118895 e!152599)))

(declare-fun c!39160 () Bool)

(assert (=> d!59241 (= c!39160 lt!118893)))

(assert (=> d!59241 (= lt!118893 (containsKey!258 (toList!1781 lt!118794) (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> d!59241 (= (contains!1655 lt!118794 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)) lt!118894)))

(declare-fun b!234965 () Bool)

(declare-fun lt!118896 () Unit!7242)

(assert (=> b!234965 (= e!152599 lt!118896)))

(assert (=> b!234965 (= lt!118896 (lemmaContainsKeyImpliesGetValueByKeyDefined!206 (toList!1781 lt!118794) (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!234965 (isDefined!207 (getValueByKey!266 (toList!1781 lt!118794) (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234966 () Bool)

(declare-fun Unit!7249 () Unit!7242)

(assert (=> b!234966 (= e!152599 Unit!7249)))

(declare-fun b!234967 () Bool)

(assert (=> b!234967 (= e!152598 (isDefined!207 (getValueByKey!266 (toList!1781 lt!118794) (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))))

(assert (= (and d!59241 c!39160) b!234965))

(assert (= (and d!59241 (not c!39160)) b!234966))

(assert (= (and d!59241 (not res!115218)) b!234967))

(assert (=> d!59241 m!256035))

(declare-fun m!256245 () Bool)

(assert (=> d!59241 m!256245))

(assert (=> b!234965 m!256035))

(declare-fun m!256247 () Bool)

(assert (=> b!234965 m!256247))

(assert (=> b!234965 m!256035))

(assert (=> b!234965 m!256203))

(assert (=> b!234965 m!256203))

(declare-fun m!256249 () Bool)

(assert (=> b!234965 m!256249))

(assert (=> b!234967 m!256035))

(assert (=> b!234967 m!256203))

(assert (=> b!234967 m!256203))

(assert (=> b!234967 m!256249))

(assert (=> b!234816 d!59241))

(declare-fun b!234978 () Bool)

(declare-fun e!152610 () Bool)

(declare-fun contains!1657 (List!3528 (_ BitVec 64)) Bool)

(assert (=> b!234978 (= e!152610 (contains!1657 Nil!3525 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234979 () Bool)

(declare-fun e!152609 () Bool)

(declare-fun e!152608 () Bool)

(assert (=> b!234979 (= e!152609 e!152608)))

(declare-fun res!115225 () Bool)

(assert (=> b!234979 (=> (not res!115225) (not e!152608))))

(assert (=> b!234979 (= res!115225 (not e!152610))))

(declare-fun res!115226 () Bool)

(assert (=> b!234979 (=> (not res!115226) (not e!152610))))

(assert (=> b!234979 (= res!115226 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!234980 () Bool)

(declare-fun e!152611 () Bool)

(assert (=> b!234980 (= e!152608 e!152611)))

(declare-fun c!39163 () Bool)

(assert (=> b!234980 (= c!39163 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun d!59243 () Bool)

(declare-fun res!115227 () Bool)

(assert (=> d!59243 (=> res!115227 e!152609)))

(assert (=> d!59243 (= res!115227 (bvsge #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> d!59243 (= (arrayNoDuplicates!0 (_keys!6430 thiss!1504) #b00000000000000000000000000000000 Nil!3525) e!152609)))

(declare-fun bm!21846 () Bool)

(declare-fun call!21849 () Bool)

(assert (=> bm!21846 (= call!21849 (arrayNoDuplicates!0 (_keys!6430 thiss!1504) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!39163 (Cons!3524 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000) Nil!3525) Nil!3525)))))

(declare-fun b!234981 () Bool)

(assert (=> b!234981 (= e!152611 call!21849)))

(declare-fun b!234982 () Bool)

(assert (=> b!234982 (= e!152611 call!21849)))

(assert (= (and d!59243 (not res!115227)) b!234979))

(assert (= (and b!234979 res!115226) b!234978))

(assert (= (and b!234979 res!115225) b!234980))

(assert (= (and b!234980 c!39163) b!234982))

(assert (= (and b!234980 (not c!39163)) b!234981))

(assert (= (or b!234982 b!234981) bm!21846))

(assert (=> b!234978 m!256035))

(assert (=> b!234978 m!256035))

(declare-fun m!256251 () Bool)

(assert (=> b!234978 m!256251))

(assert (=> b!234979 m!256035))

(assert (=> b!234979 m!256035))

(assert (=> b!234979 m!256055))

(assert (=> b!234980 m!256035))

(assert (=> b!234980 m!256035))

(assert (=> b!234980 m!256055))

(assert (=> bm!21846 m!256035))

(declare-fun m!256253 () Bool)

(assert (=> bm!21846 m!256253))

(assert (=> b!234729 d!59243))

(declare-fun b!235001 () Bool)

(declare-fun e!152625 () SeekEntryResult!982)

(declare-fun e!152622 () SeekEntryResult!982)

(assert (=> b!235001 (= e!152625 e!152622)))

(declare-fun c!39172 () Bool)

(declare-fun lt!118902 () (_ BitVec 64))

(assert (=> b!235001 (= c!39172 (or (= lt!118902 key!932) (= (bvadd lt!118902 lt!118902) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!235002 () Bool)

(assert (=> b!235002 (= e!152622 (Intermediate!982 false (toIndex!0 key!932 (mask!10316 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!235003 () Bool)

(declare-fun e!152624 () Bool)

(declare-fun e!152623 () Bool)

(assert (=> b!235003 (= e!152624 e!152623)))

(declare-fun res!115235 () Bool)

(declare-fun lt!118901 () SeekEntryResult!982)

(assert (=> b!235003 (= res!115235 (and ((_ is Intermediate!982) lt!118901) (not (undefined!1794 lt!118901)) (bvslt (x!23724 lt!118901) #b01111111111111111111111111111110) (bvsge (x!23724 lt!118901) #b00000000000000000000000000000000) (bvsge (x!23724 lt!118901) #b00000000000000000000000000000000)))))

(assert (=> b!235003 (=> (not res!115235) (not e!152623))))

(declare-fun b!235004 () Bool)

(assert (=> b!235004 (= e!152622 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!932 (mask!10316 thiss!1504)) #b00000000000000000000000000000000 (mask!10316 thiss!1504)) key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(declare-fun b!235005 () Bool)

(assert (=> b!235005 (= e!152624 (bvsge (x!23724 lt!118901) #b01111111111111111111111111111110))))

(declare-fun b!235006 () Bool)

(assert (=> b!235006 (and (bvsge (index!6100 lt!118901) #b00000000000000000000000000000000) (bvslt (index!6100 lt!118901) (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun res!115236 () Bool)

(assert (=> b!235006 (= res!115236 (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6100 lt!118901)) key!932))))

(declare-fun e!152626 () Bool)

(assert (=> b!235006 (=> res!115236 e!152626)))

(assert (=> b!235006 (= e!152623 e!152626)))

(declare-fun d!59245 () Bool)

(assert (=> d!59245 e!152624))

(declare-fun c!39170 () Bool)

(assert (=> d!59245 (= c!39170 (and ((_ is Intermediate!982) lt!118901) (undefined!1794 lt!118901)))))

(assert (=> d!59245 (= lt!118901 e!152625)))

(declare-fun c!39171 () Bool)

(assert (=> d!59245 (= c!39171 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!59245 (= lt!118902 (select (arr!5519 (_keys!6430 thiss!1504)) (toIndex!0 key!932 (mask!10316 thiss!1504))))))

(assert (=> d!59245 (validMask!0 (mask!10316 thiss!1504))))

(assert (=> d!59245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10316 thiss!1504)) key!932 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)) lt!118901)))

(declare-fun b!235007 () Bool)

(assert (=> b!235007 (and (bvsge (index!6100 lt!118901) #b00000000000000000000000000000000) (bvslt (index!6100 lt!118901) (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> b!235007 (= e!152626 (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6100 lt!118901)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235008 () Bool)

(assert (=> b!235008 (= e!152625 (Intermediate!982 true (toIndex!0 key!932 (mask!10316 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun b!235009 () Bool)

(assert (=> b!235009 (and (bvsge (index!6100 lt!118901) #b00000000000000000000000000000000) (bvslt (index!6100 lt!118901) (size!5855 (_keys!6430 thiss!1504))))))

(declare-fun res!115234 () Bool)

(assert (=> b!235009 (= res!115234 (= (select (arr!5519 (_keys!6430 thiss!1504)) (index!6100 lt!118901)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!235009 (=> res!115234 e!152626)))

(assert (= (and d!59245 c!39171) b!235008))

(assert (= (and d!59245 (not c!39171)) b!235001))

(assert (= (and b!235001 c!39172) b!235002))

(assert (= (and b!235001 (not c!39172)) b!235004))

(assert (= (and d!59245 c!39170) b!235005))

(assert (= (and d!59245 (not c!39170)) b!235003))

(assert (= (and b!235003 res!115235) b!235006))

(assert (= (and b!235006 (not res!115236)) b!235009))

(assert (= (and b!235009 (not res!115234)) b!235007))

(declare-fun m!256255 () Bool)

(assert (=> b!235006 m!256255))

(assert (=> b!235007 m!256255))

(assert (=> d!59245 m!255989))

(declare-fun m!256257 () Bool)

(assert (=> d!59245 m!256257))

(assert (=> d!59245 m!255959))

(assert (=> b!235004 m!255989))

(declare-fun m!256259 () Bool)

(assert (=> b!235004 m!256259))

(assert (=> b!235004 m!256259))

(declare-fun m!256261 () Bool)

(assert (=> b!235004 m!256261))

(assert (=> b!235009 m!256255))

(assert (=> d!59169 d!59245))

(declare-fun d!59247 () Bool)

(declare-fun lt!118908 () (_ BitVec 32))

(declare-fun lt!118907 () (_ BitVec 32))

(assert (=> d!59247 (= lt!118908 (bvmul (bvxor lt!118907 (bvlshr lt!118907 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!59247 (= lt!118907 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!59247 (and (bvsge (mask!10316 thiss!1504) #b00000000000000000000000000000000) (let ((res!115237 (let ((h!4176 ((_ extract 31 0) (bvand (bvxor key!932 (bvlshr key!932 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!23742 (bvmul (bvxor h!4176 (bvlshr h!4176 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!23742 (bvlshr x!23742 #b00000000000000000000000000001101)) (mask!10316 thiss!1504)))))) (and (bvslt res!115237 (bvadd (mask!10316 thiss!1504) #b00000000000000000000000000000001)) (bvsge res!115237 #b00000000000000000000000000000000))))))

(assert (=> d!59247 (= (toIndex!0 key!932 (mask!10316 thiss!1504)) (bvand (bvxor lt!118908 (bvlshr lt!118908 #b00000000000000000000000000001101)) (mask!10316 thiss!1504)))))

(assert (=> d!59169 d!59247))

(assert (=> d!59169 d!59165))

(declare-fun d!59249 () Bool)

(declare-fun e!152627 () Bool)

(assert (=> d!59249 e!152627))

(declare-fun res!115239 () Bool)

(assert (=> d!59249 (=> (not res!115239) (not e!152627))))

(declare-fun lt!118910 () ListLongMap!3531)

(assert (=> d!59249 (= res!115239 (contains!1655 lt!118910 (_1!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))

(declare-fun lt!118912 () List!3527)

(assert (=> d!59249 (= lt!118910 (ListLongMap!3532 lt!118912))))

(declare-fun lt!118911 () Unit!7242)

(declare-fun lt!118909 () Unit!7242)

(assert (=> d!59249 (= lt!118911 lt!118909)))

(assert (=> d!59249 (= (getValueByKey!266 lt!118912 (_1!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))

(assert (=> d!59249 (= lt!118909 (lemmaContainsTupThenGetReturnValue!150 lt!118912 (_1!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))

(assert (=> d!59249 (= lt!118912 (insertStrictlySorted!153 (toList!1781 call!21837) (_1!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))) (_2!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))))))

(assert (=> d!59249 (= (+!635 call!21837 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))) lt!118910)))

(declare-fun b!235010 () Bool)

(declare-fun res!115238 () Bool)

(assert (=> b!235010 (=> (not res!115238) (not e!152627))))

(assert (=> b!235010 (= res!115238 (= (getValueByKey!266 (toList!1781 lt!118910) (_1!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504)))) (Some!271 (_2!2320 (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))))

(declare-fun b!235011 () Bool)

(assert (=> b!235011 (= e!152627 (contains!1656 (toList!1781 lt!118910) (tuple2!4619 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4203 thiss!1504))))))

(assert (= (and d!59249 res!115239) b!235010))

(assert (= (and b!235010 res!115238) b!235011))

(declare-fun m!256263 () Bool)

(assert (=> d!59249 m!256263))

(declare-fun m!256265 () Bool)

(assert (=> d!59249 m!256265))

(declare-fun m!256267 () Bool)

(assert (=> d!59249 m!256267))

(declare-fun m!256269 () Bool)

(assert (=> d!59249 m!256269))

(declare-fun m!256271 () Bool)

(assert (=> b!235010 m!256271))

(declare-fun m!256273 () Bool)

(assert (=> b!235011 m!256273))

(assert (=> b!234815 d!59249))

(declare-fun d!59251 () Bool)

(declare-fun res!115244 () Bool)

(declare-fun e!152636 () Bool)

(assert (=> d!59251 (=> res!115244 e!152636)))

(assert (=> d!59251 (= res!115244 (bvsge #b00000000000000000000000000000000 (size!5855 (_keys!6430 thiss!1504))))))

(assert (=> d!59251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6430 thiss!1504) (mask!10316 thiss!1504)) e!152636)))

(declare-fun b!235020 () Bool)

(declare-fun e!152635 () Bool)

(declare-fun e!152634 () Bool)

(assert (=> b!235020 (= e!152635 e!152634)))

(declare-fun lt!118919 () (_ BitVec 64))

(assert (=> b!235020 (= lt!118919 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!118921 () Unit!7242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!11609 (_ BitVec 64) (_ BitVec 32)) Unit!7242)

(assert (=> b!235020 (= lt!118921 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!6430 thiss!1504) lt!118919 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!11609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!235020 (arrayContainsKey!0 (_keys!6430 thiss!1504) lt!118919 #b00000000000000000000000000000000)))

(declare-fun lt!118920 () Unit!7242)

(assert (=> b!235020 (= lt!118920 lt!118921)))

(declare-fun res!115245 () Bool)

(assert (=> b!235020 (= res!115245 (= (seekEntryOrOpen!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000) (_keys!6430 thiss!1504) (mask!10316 thiss!1504)) (Found!982 #b00000000000000000000000000000000)))))

(assert (=> b!235020 (=> (not res!115245) (not e!152634))))

(declare-fun b!235021 () Bool)

(assert (=> b!235021 (= e!152636 e!152635)))

(declare-fun c!39175 () Bool)

(assert (=> b!235021 (= c!39175 (validKeyInArray!0 (select (arr!5519 (_keys!6430 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun bm!21849 () Bool)

(declare-fun call!21852 () Bool)

(assert (=> bm!21849 (= call!21852 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!6430 thiss!1504) (mask!10316 thiss!1504)))))

(declare-fun b!235022 () Bool)

(assert (=> b!235022 (= e!152634 call!21852)))

(declare-fun b!235023 () Bool)

(assert (=> b!235023 (= e!152635 call!21852)))

(assert (= (and d!59251 (not res!115244)) b!235021))

(assert (= (and b!235021 c!39175) b!235020))

(assert (= (and b!235021 (not c!39175)) b!235023))

(assert (= (and b!235020 res!115245) b!235022))

(assert (= (or b!235022 b!235023) bm!21849))

(assert (=> b!235020 m!256035))

(declare-fun m!256275 () Bool)

(assert (=> b!235020 m!256275))

(declare-fun m!256277 () Bool)

(assert (=> b!235020 m!256277))

(assert (=> b!235020 m!256035))

(declare-fun m!256279 () Bool)

(assert (=> b!235020 m!256279))

(assert (=> b!235021 m!256035))

(assert (=> b!235021 m!256035))

(assert (=> b!235021 m!256055))

(declare-fun m!256281 () Bool)

(assert (=> bm!21849 m!256281))

(assert (=> b!234728 d!59251))

(declare-fun b!235024 () Bool)

(declare-fun e!152637 () Bool)

(assert (=> b!235024 (= e!152637 tp_is_empty!6177)))

(declare-fun mapIsEmpty!10460 () Bool)

(declare-fun mapRes!10460 () Bool)

(assert (=> mapIsEmpty!10460 mapRes!10460))

(declare-fun condMapEmpty!10460 () Bool)

(declare-fun mapDefault!10460 () ValueCell!2745)

(assert (=> mapNonEmpty!10459 (= condMapEmpty!10460 (= mapRest!10459 ((as const (Array (_ BitVec 32) ValueCell!2745)) mapDefault!10460)))))

(declare-fun e!152638 () Bool)

(assert (=> mapNonEmpty!10459 (= tp!22114 (and e!152638 mapRes!10460))))

(declare-fun b!235025 () Bool)

(assert (=> b!235025 (= e!152638 tp_is_empty!6177)))

(declare-fun mapNonEmpty!10460 () Bool)

(declare-fun tp!22115 () Bool)

(assert (=> mapNonEmpty!10460 (= mapRes!10460 (and tp!22115 e!152637))))

(declare-fun mapValue!10460 () ValueCell!2745)

(declare-fun mapRest!10460 () (Array (_ BitVec 32) ValueCell!2745))

(declare-fun mapKey!10460 () (_ BitVec 32))

(assert (=> mapNonEmpty!10460 (= mapRest!10459 (store mapRest!10460 mapKey!10460 mapValue!10460))))

(assert (= (and mapNonEmpty!10459 condMapEmpty!10460) mapIsEmpty!10460))

(assert (= (and mapNonEmpty!10459 (not condMapEmpty!10460)) mapNonEmpty!10460))

(assert (= (and mapNonEmpty!10460 ((_ is ValueCellFull!2745) mapValue!10460)) b!235024))

(assert (= (and mapNonEmpty!10459 ((_ is ValueCellFull!2745) mapDefault!10460)) b!235025))

(declare-fun m!256283 () Bool)

(assert (=> mapNonEmpty!10460 m!256283))

(declare-fun b_lambda!7895 () Bool)

(assert (= b_lambda!7891 (or (and b!234693 b_free!6315) b_lambda!7895)))

(declare-fun b_lambda!7897 () Bool)

(assert (= b_lambda!7893 (or (and b!234693 b_free!6315) b_lambda!7897)))

(check-sat (not d!59239) (not d!59197) (not b!234834) (not d!59235) (not b!234835) (not d!59193) (not b!234887) (not d!59191) (not d!59245) (not b!234882) (not d!59249) (not bm!21843) (not bm!21840) (not d!59195) (not b!234897) (not b!235010) (not d!59179) (not b!234892) (not b!234925) (not b!234842) (not bm!21849) (not b!235011) (not d!59189) (not d!59217) (not b!234959) (not b!234960) (not d!59215) (not b!234847) (not b!234919) (not d!59237) (not b!234979) (not b!234980) (not b_lambda!7889) (not d!59185) (not b!234850) (not d!59207) (not b_next!6315) (not d!59221) tp_is_empty!6177 (not b!234844) (not b!234978) (not b!234881) (not b!234965) (not b!234890) (not d!59187) (not b!235021) (not b!234936) (not b!234848) (not b!234879) (not d!59229) b_and!13243 (not b!234836) (not b!234964) (not b!234880) (not d!59181) (not b!235020) (not d!59241) (not b!234884) (not b!234877) (not b!234885) (not b_lambda!7897) (not d!59205) (not d!59201) (not d!59211) (not b!234898) (not b!234851) (not d!59225) (not d!59203) (not d!59209) (not b_lambda!7895) (not b!234849) (not b!235004) (not d!59183) (not b!234916) (not b!234837) (not d!59199) (not mapNonEmpty!10460) (not b!234917) (not d!59223) (not b!234846) (not b!234949) (not b!234967) (not bm!21846))
(check-sat b_and!13243 (not b_next!6315))
