; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76336 () Bool)

(assert start!76336)

(declare-fun b!895642 () Bool)

(declare-fun b_free!15925 () Bool)

(declare-fun b_next!15925 () Bool)

(assert (=> b!895642 (= b_free!15925 (not b_next!15925))))

(declare-fun tp!55794 () Bool)

(declare-fun b_and!26191 () Bool)

(assert (=> b!895642 (= tp!55794 b_and!26191)))

(declare-fun mapNonEmpty!28984 () Bool)

(declare-fun mapRes!28984 () Bool)

(declare-fun tp!55795 () Bool)

(declare-fun e!500472 () Bool)

(assert (=> mapNonEmpty!28984 (= mapRes!28984 (and tp!55795 e!500472))))

(declare-datatypes ((V!29303 0))(
  ( (V!29304 (val!9177 Int)) )
))
(declare-datatypes ((ValueCell!8645 0))(
  ( (ValueCellFull!8645 (v!11664 V!29303)) (EmptyCell!8645) )
))
(declare-fun mapValue!28984 () ValueCell!8645)

(declare-fun mapKey!28984 () (_ BitVec 32))

(declare-fun mapRest!28984 () (Array (_ BitVec 32) ValueCell!8645))

(declare-datatypes ((array!52497 0))(
  ( (array!52498 (arr!25241 (Array (_ BitVec 32) (_ BitVec 64))) (size!25693 (_ BitVec 32))) )
))
(declare-datatypes ((array!52499 0))(
  ( (array!52500 (arr!25242 (Array (_ BitVec 32) ValueCell!8645)) (size!25694 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4306 0))(
  ( (LongMapFixedSize!4307 (defaultEntry!5365 Int) (mask!25972 (_ BitVec 32)) (extraKeys!5061 (_ BitVec 32)) (zeroValue!5165 V!29303) (minValue!5165 V!29303) (_size!2208 (_ BitVec 32)) (_keys!10081 array!52497) (_values!5352 array!52499) (_vacant!2208 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4306)

(assert (=> mapNonEmpty!28984 (= (arr!25242 (_values!5352 thiss!1181)) (store mapRest!28984 mapKey!28984 mapValue!28984))))

(declare-fun b!895640 () Bool)

(declare-fun e!500476 () Bool)

(declare-fun tp_is_empty!18253 () Bool)

(assert (=> b!895640 (= e!500476 tp_is_empty!18253)))

(declare-fun b!895641 () Bool)

(declare-fun e!500471 () Bool)

(assert (=> b!895641 (= e!500471 (and e!500476 mapRes!28984))))

(declare-fun condMapEmpty!28984 () Bool)

(declare-fun mapDefault!28984 () ValueCell!8645)

(assert (=> b!895641 (= condMapEmpty!28984 (= (arr!25242 (_values!5352 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8645)) mapDefault!28984)))))

(declare-fun e!500473 () Bool)

(declare-fun array_inv!19868 (array!52497) Bool)

(declare-fun array_inv!19869 (array!52499) Bool)

(assert (=> b!895642 (= e!500473 (and tp!55794 tp_is_empty!18253 (array_inv!19868 (_keys!10081 thiss!1181)) (array_inv!19869 (_values!5352 thiss!1181)) e!500471))))

(declare-fun b!895643 () Bool)

(declare-fun e!500475 () Bool)

(declare-datatypes ((SeekEntryResult!8891 0))(
  ( (MissingZero!8891 (index!37935 (_ BitVec 32))) (Found!8891 (index!37936 (_ BitVec 32))) (Intermediate!8891 (undefined!9703 Bool) (index!37937 (_ BitVec 32)) (x!76246 (_ BitVec 32))) (Undefined!8891) (MissingVacant!8891 (index!37938 (_ BitVec 32))) )
))
(declare-fun lt!404390 () SeekEntryResult!8891)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!895643 (= e!500475 (inRange!0 (index!37936 lt!404390) (mask!25972 thiss!1181)))))

(declare-fun b!895644 () Bool)

(assert (=> b!895644 (= e!500472 tp_is_empty!18253)))

(declare-fun mapIsEmpty!28984 () Bool)

(assert (=> mapIsEmpty!28984 mapRes!28984))

(declare-fun b!895646 () Bool)

(declare-fun e!500474 () Bool)

(get-info :version)

(assert (=> b!895646 (= e!500474 (not (or (not ((_ is Found!8891) lt!404390)) (bvsge (index!37936 lt!404390) #b00000000000000000000000000000000))))))

(assert (=> b!895646 e!500475))

(declare-fun res!605808 () Bool)

(assert (=> b!895646 (=> res!605808 e!500475)))

(assert (=> b!895646 (= res!605808 (not ((_ is Found!8891) lt!404390)))))

(declare-datatypes ((Unit!30412 0))(
  ( (Unit!30413) )
))
(declare-fun lt!404389 () Unit!30412)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!65 (array!52497 array!52499 (_ BitVec 32) (_ BitVec 32) V!29303 V!29303 (_ BitVec 64)) Unit!30412)

(assert (=> b!895646 (= lt!404389 (lemmaSeekEntryGivesInRangeIndex!65 (_keys!10081 thiss!1181) (_values!5352 thiss!1181) (mask!25972 thiss!1181) (extraKeys!5061 thiss!1181) (zeroValue!5165 thiss!1181) (minValue!5165 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8891)

(assert (=> b!895646 (= lt!404390 (seekEntry!0 key!785 (_keys!10081 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun res!605806 () Bool)

(assert (=> start!76336 (=> (not res!605806) (not e!500474))))

(declare-fun valid!1667 (LongMapFixedSize!4306) Bool)

(assert (=> start!76336 (= res!605806 (valid!1667 thiss!1181))))

(assert (=> start!76336 e!500474))

(assert (=> start!76336 e!500473))

(assert (=> start!76336 true))

(declare-fun b!895645 () Bool)

(declare-fun res!605807 () Bool)

(assert (=> b!895645 (=> (not res!605807) (not e!500474))))

(assert (=> b!895645 (= res!605807 (not (= key!785 (bvneg key!785))))))

(assert (= (and start!76336 res!605806) b!895645))

(assert (= (and b!895645 res!605807) b!895646))

(assert (= (and b!895646 (not res!605808)) b!895643))

(assert (= (and b!895641 condMapEmpty!28984) mapIsEmpty!28984))

(assert (= (and b!895641 (not condMapEmpty!28984)) mapNonEmpty!28984))

(assert (= (and mapNonEmpty!28984 ((_ is ValueCellFull!8645) mapValue!28984)) b!895644))

(assert (= (and b!895641 ((_ is ValueCellFull!8645) mapDefault!28984)) b!895640))

(assert (= b!895642 b!895641))

(assert (= start!76336 b!895642))

(declare-fun m!832509 () Bool)

(assert (=> b!895643 m!832509))

(declare-fun m!832511 () Bool)

(assert (=> b!895642 m!832511))

(declare-fun m!832513 () Bool)

(assert (=> b!895642 m!832513))

(declare-fun m!832515 () Bool)

(assert (=> start!76336 m!832515))

(declare-fun m!832517 () Bool)

(assert (=> b!895646 m!832517))

(declare-fun m!832519 () Bool)

(assert (=> b!895646 m!832519))

(declare-fun m!832521 () Bool)

(assert (=> mapNonEmpty!28984 m!832521))

(check-sat (not mapNonEmpty!28984) (not start!76336) (not b!895643) (not b!895642) (not b!895646) tp_is_empty!18253 (not b_next!15925) b_and!26191)
(check-sat b_and!26191 (not b_next!15925))
(get-model)

(declare-fun d!110633 () Bool)

(declare-fun res!605833 () Bool)

(declare-fun e!500521 () Bool)

(assert (=> d!110633 (=> (not res!605833) (not e!500521))))

(declare-fun simpleValid!309 (LongMapFixedSize!4306) Bool)

(assert (=> d!110633 (= res!605833 (simpleValid!309 thiss!1181))))

(assert (=> d!110633 (= (valid!1667 thiss!1181) e!500521)))

(declare-fun b!895695 () Bool)

(declare-fun res!605834 () Bool)

(assert (=> b!895695 (=> (not res!605834) (not e!500521))))

(declare-fun arrayCountValidKeys!0 (array!52497 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895695 (= res!605834 (= (arrayCountValidKeys!0 (_keys!10081 thiss!1181) #b00000000000000000000000000000000 (size!25693 (_keys!10081 thiss!1181))) (_size!2208 thiss!1181)))))

(declare-fun b!895696 () Bool)

(declare-fun res!605835 () Bool)

(assert (=> b!895696 (=> (not res!605835) (not e!500521))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52497 (_ BitVec 32)) Bool)

(assert (=> b!895696 (= res!605835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10081 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun b!895697 () Bool)

(declare-datatypes ((List!17827 0))(
  ( (Nil!17824) (Cons!17823 (h!18960 (_ BitVec 64)) (t!25157 List!17827)) )
))
(declare-fun arrayNoDuplicates!0 (array!52497 (_ BitVec 32) List!17827) Bool)

(assert (=> b!895697 (= e!500521 (arrayNoDuplicates!0 (_keys!10081 thiss!1181) #b00000000000000000000000000000000 Nil!17824))))

(assert (= (and d!110633 res!605833) b!895695))

(assert (= (and b!895695 res!605834) b!895696))

(assert (= (and b!895696 res!605835) b!895697))

(declare-fun m!832551 () Bool)

(assert (=> d!110633 m!832551))

(declare-fun m!832553 () Bool)

(assert (=> b!895695 m!832553))

(declare-fun m!832555 () Bool)

(assert (=> b!895696 m!832555))

(declare-fun m!832557 () Bool)

(assert (=> b!895697 m!832557))

(assert (=> start!76336 d!110633))

(declare-fun d!110635 () Bool)

(assert (=> d!110635 (= (inRange!0 (index!37936 lt!404390) (mask!25972 thiss!1181)) (and (bvsge (index!37936 lt!404390) #b00000000000000000000000000000000) (bvslt (index!37936 lt!404390) (bvadd (mask!25972 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!895643 d!110635))

(declare-fun d!110637 () Bool)

(assert (=> d!110637 (= (array_inv!19868 (_keys!10081 thiss!1181)) (bvsge (size!25693 (_keys!10081 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895642 d!110637))

(declare-fun d!110639 () Bool)

(assert (=> d!110639 (= (array_inv!19869 (_values!5352 thiss!1181)) (bvsge (size!25694 (_values!5352 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895642 d!110639))

(declare-fun d!110641 () Bool)

(declare-fun e!500524 () Bool)

(assert (=> d!110641 e!500524))

(declare-fun res!605838 () Bool)

(assert (=> d!110641 (=> res!605838 e!500524)))

(declare-fun lt!404408 () SeekEntryResult!8891)

(assert (=> d!110641 (= res!605838 (not ((_ is Found!8891) lt!404408)))))

(assert (=> d!110641 (= lt!404408 (seekEntry!0 key!785 (_keys!10081 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun lt!404407 () Unit!30412)

(declare-fun choose!1483 (array!52497 array!52499 (_ BitVec 32) (_ BitVec 32) V!29303 V!29303 (_ BitVec 64)) Unit!30412)

(assert (=> d!110641 (= lt!404407 (choose!1483 (_keys!10081 thiss!1181) (_values!5352 thiss!1181) (mask!25972 thiss!1181) (extraKeys!5061 thiss!1181) (zeroValue!5165 thiss!1181) (minValue!5165 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110641 (validMask!0 (mask!25972 thiss!1181))))

(assert (=> d!110641 (= (lemmaSeekEntryGivesInRangeIndex!65 (_keys!10081 thiss!1181) (_values!5352 thiss!1181) (mask!25972 thiss!1181) (extraKeys!5061 thiss!1181) (zeroValue!5165 thiss!1181) (minValue!5165 thiss!1181) key!785) lt!404407)))

(declare-fun b!895700 () Bool)

(assert (=> b!895700 (= e!500524 (inRange!0 (index!37936 lt!404408) (mask!25972 thiss!1181)))))

(assert (= (and d!110641 (not res!605838)) b!895700))

(assert (=> d!110641 m!832519))

(declare-fun m!832559 () Bool)

(assert (=> d!110641 m!832559))

(declare-fun m!832561 () Bool)

(assert (=> d!110641 m!832561))

(declare-fun m!832563 () Bool)

(assert (=> b!895700 m!832563))

(assert (=> b!895646 d!110641))

(declare-fun b!895713 () Bool)

(declare-fun e!500532 () SeekEntryResult!8891)

(declare-fun e!500533 () SeekEntryResult!8891)

(assert (=> b!895713 (= e!500532 e!500533)))

(declare-fun lt!404420 () (_ BitVec 64))

(declare-fun lt!404419 () SeekEntryResult!8891)

(assert (=> b!895713 (= lt!404420 (select (arr!25241 (_keys!10081 thiss!1181)) (index!37937 lt!404419)))))

(declare-fun c!94559 () Bool)

(assert (=> b!895713 (= c!94559 (= lt!404420 key!785))))

(declare-fun b!895714 () Bool)

(assert (=> b!895714 (= e!500532 Undefined!8891)))

(declare-fun b!895715 () Bool)

(declare-fun e!500531 () SeekEntryResult!8891)

(assert (=> b!895715 (= e!500531 (MissingZero!8891 (index!37937 lt!404419)))))

(declare-fun b!895716 () Bool)

(declare-fun c!94558 () Bool)

(assert (=> b!895716 (= c!94558 (= lt!404420 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895716 (= e!500533 e!500531)))

(declare-fun d!110643 () Bool)

(declare-fun lt!404417 () SeekEntryResult!8891)

(assert (=> d!110643 (and (or ((_ is MissingVacant!8891) lt!404417) (not ((_ is Found!8891) lt!404417)) (and (bvsge (index!37936 lt!404417) #b00000000000000000000000000000000) (bvslt (index!37936 lt!404417) (size!25693 (_keys!10081 thiss!1181))))) (not ((_ is MissingVacant!8891) lt!404417)) (or (not ((_ is Found!8891) lt!404417)) (= (select (arr!25241 (_keys!10081 thiss!1181)) (index!37936 lt!404417)) key!785)))))

(assert (=> d!110643 (= lt!404417 e!500532)))

(declare-fun c!94560 () Bool)

(assert (=> d!110643 (= c!94560 (and ((_ is Intermediate!8891) lt!404419) (undefined!9703 lt!404419)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8891)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110643 (= lt!404419 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25972 thiss!1181)) key!785 (_keys!10081 thiss!1181) (mask!25972 thiss!1181)))))

(assert (=> d!110643 (validMask!0 (mask!25972 thiss!1181))))

(assert (=> d!110643 (= (seekEntry!0 key!785 (_keys!10081 thiss!1181) (mask!25972 thiss!1181)) lt!404417)))

(declare-fun b!895717 () Bool)

(declare-fun lt!404418 () SeekEntryResult!8891)

(assert (=> b!895717 (= e!500531 (ite ((_ is MissingVacant!8891) lt!404418) (MissingZero!8891 (index!37938 lt!404418)) lt!404418))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52497 (_ BitVec 32)) SeekEntryResult!8891)

(assert (=> b!895717 (= lt!404418 (seekKeyOrZeroReturnVacant!0 (x!76246 lt!404419) (index!37937 lt!404419) (index!37937 lt!404419) key!785 (_keys!10081 thiss!1181) (mask!25972 thiss!1181)))))

(declare-fun b!895718 () Bool)

(assert (=> b!895718 (= e!500533 (Found!8891 (index!37937 lt!404419)))))

(assert (= (and d!110643 c!94560) b!895714))

(assert (= (and d!110643 (not c!94560)) b!895713))

(assert (= (and b!895713 c!94559) b!895718))

(assert (= (and b!895713 (not c!94559)) b!895716))

(assert (= (and b!895716 c!94558) b!895715))

(assert (= (and b!895716 (not c!94558)) b!895717))

(declare-fun m!832565 () Bool)

(assert (=> b!895713 m!832565))

(declare-fun m!832567 () Bool)

(assert (=> d!110643 m!832567))

(declare-fun m!832569 () Bool)

(assert (=> d!110643 m!832569))

(assert (=> d!110643 m!832569))

(declare-fun m!832571 () Bool)

(assert (=> d!110643 m!832571))

(assert (=> d!110643 m!832561))

(declare-fun m!832573 () Bool)

(assert (=> b!895717 m!832573))

(assert (=> b!895646 d!110643))

(declare-fun condMapEmpty!28993 () Bool)

(declare-fun mapDefault!28993 () ValueCell!8645)

(assert (=> mapNonEmpty!28984 (= condMapEmpty!28993 (= mapRest!28984 ((as const (Array (_ BitVec 32) ValueCell!8645)) mapDefault!28993)))))

(declare-fun e!500538 () Bool)

(declare-fun mapRes!28993 () Bool)

(assert (=> mapNonEmpty!28984 (= tp!55795 (and e!500538 mapRes!28993))))

(declare-fun b!895726 () Bool)

(assert (=> b!895726 (= e!500538 tp_is_empty!18253)))

(declare-fun b!895725 () Bool)

(declare-fun e!500539 () Bool)

(assert (=> b!895725 (= e!500539 tp_is_empty!18253)))

(declare-fun mapIsEmpty!28993 () Bool)

(assert (=> mapIsEmpty!28993 mapRes!28993))

(declare-fun mapNonEmpty!28993 () Bool)

(declare-fun tp!55810 () Bool)

(assert (=> mapNonEmpty!28993 (= mapRes!28993 (and tp!55810 e!500539))))

(declare-fun mapKey!28993 () (_ BitVec 32))

(declare-fun mapValue!28993 () ValueCell!8645)

(declare-fun mapRest!28993 () (Array (_ BitVec 32) ValueCell!8645))

(assert (=> mapNonEmpty!28993 (= mapRest!28984 (store mapRest!28993 mapKey!28993 mapValue!28993))))

(assert (= (and mapNonEmpty!28984 condMapEmpty!28993) mapIsEmpty!28993))

(assert (= (and mapNonEmpty!28984 (not condMapEmpty!28993)) mapNonEmpty!28993))

(assert (= (and mapNonEmpty!28993 ((_ is ValueCellFull!8645) mapValue!28993)) b!895725))

(assert (= (and mapNonEmpty!28984 ((_ is ValueCellFull!8645) mapDefault!28993)) b!895726))

(declare-fun m!832575 () Bool)

(assert (=> mapNonEmpty!28993 m!832575))

(check-sat (not b!895696) (not b!895695) (not b!895697) (not d!110633) (not b!895700) (not mapNonEmpty!28993) (not b!895717) (not d!110643) tp_is_empty!18253 (not d!110641) (not b_next!15925) b_and!26191)
(check-sat b_and!26191 (not b_next!15925))
