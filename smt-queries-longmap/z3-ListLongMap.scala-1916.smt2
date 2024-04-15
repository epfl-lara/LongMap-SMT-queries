; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34072 () Bool)

(assert start!34072)

(declare-fun b_free!7165 () Bool)

(declare-fun b_next!7165 () Bool)

(assert (=> start!34072 (= b_free!7165 (not b_next!7165))))

(declare-fun tp!25019 () Bool)

(declare-fun b_and!14333 () Bool)

(assert (=> start!34072 (= tp!25019 b_and!14333)))

(declare-fun b!339454 () Bool)

(declare-fun res!187538 () Bool)

(declare-fun e!208247 () Bool)

(assert (=> b!339454 (=> (not res!187538) (not e!208247))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339454 (= res!187538 (validKeyInArray!0 k0!1348))))

(declare-fun b!339455 () Bool)

(declare-fun res!187535 () Bool)

(assert (=> b!339455 (=> (not res!187535) (not e!208247))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10467 0))(
  ( (V!10468 (val!3603 Int)) )
))
(declare-datatypes ((ValueCell!3215 0))(
  ( (ValueCellFull!3215 (v!5766 V!10467)) (EmptyCell!3215) )
))
(declare-datatypes ((array!17809 0))(
  ( (array!17810 (arr!8428 (Array (_ BitVec 32) ValueCell!3215)) (size!8781 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17809)

(declare-datatypes ((array!17811 0))(
  ( (array!17812 (arr!8429 (Array (_ BitVec 32) (_ BitVec 64))) (size!8782 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17811)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!339455 (= res!187535 (and (= (size!8781 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8782 _keys!1895) (size!8781 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339456 () Bool)

(declare-fun e!208249 () Bool)

(declare-fun tp_is_empty!7117 () Bool)

(assert (=> b!339456 (= e!208249 tp_is_empty!7117)))

(declare-fun b!339457 () Bool)

(declare-fun e!208246 () Bool)

(assert (=> b!339457 (= e!208246 tp_is_empty!7117)))

(declare-fun mapIsEmpty!12093 () Bool)

(declare-fun mapRes!12093 () Bool)

(assert (=> mapIsEmpty!12093 mapRes!12093))

(declare-fun b!339458 () Bool)

(declare-datatypes ((SeekEntryResult!3251 0))(
  ( (MissingZero!3251 (index!15183 (_ BitVec 32))) (Found!3251 (index!15184 (_ BitVec 32))) (Intermediate!3251 (undefined!4063 Bool) (index!15185 (_ BitVec 32)) (x!33826 (_ BitVec 32))) (Undefined!3251) (MissingVacant!3251 (index!15186 (_ BitVec 32))) )
))
(declare-fun lt!161031 () SeekEntryResult!3251)

(get-info :version)

(assert (=> b!339458 (= e!208247 (and (not ((_ is Found!3251) lt!161031)) (not ((_ is MissingZero!3251) lt!161031)) ((_ is MissingVacant!3251) lt!161031) (bvsge #b00000000000000000000000000000000 (size!8782 _keys!1895))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17811 (_ BitVec 32)) SeekEntryResult!3251)

(assert (=> b!339458 (= lt!161031 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339459 () Bool)

(declare-fun e!208245 () Bool)

(assert (=> b!339459 (= e!208245 (and e!208246 mapRes!12093))))

(declare-fun condMapEmpty!12093 () Bool)

(declare-fun mapDefault!12093 () ValueCell!3215)

(assert (=> b!339459 (= condMapEmpty!12093 (= (arr!8428 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3215)) mapDefault!12093)))))

(declare-fun res!187533 () Bool)

(assert (=> start!34072 (=> (not res!187533) (not e!208247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34072 (= res!187533 (validMask!0 mask!2385))))

(assert (=> start!34072 e!208247))

(assert (=> start!34072 true))

(assert (=> start!34072 tp_is_empty!7117))

(assert (=> start!34072 tp!25019))

(declare-fun array_inv!6278 (array!17809) Bool)

(assert (=> start!34072 (and (array_inv!6278 _values!1525) e!208245)))

(declare-fun array_inv!6279 (array!17811) Bool)

(assert (=> start!34072 (array_inv!6279 _keys!1895)))

(declare-fun b!339460 () Bool)

(declare-fun res!187536 () Bool)

(assert (=> b!339460 (=> (not res!187536) (not e!208247))))

(declare-fun zeroValue!1467 () V!10467)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10467)

(declare-datatypes ((tuple2!5174 0))(
  ( (tuple2!5175 (_1!2598 (_ BitVec 64)) (_2!2598 V!10467)) )
))
(declare-datatypes ((List!4798 0))(
  ( (Nil!4795) (Cons!4794 (h!5650 tuple2!5174) (t!9891 List!4798)) )
))
(declare-datatypes ((ListLongMap!4077 0))(
  ( (ListLongMap!4078 (toList!2054 List!4798)) )
))
(declare-fun contains!2116 (ListLongMap!4077 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1560 (array!17811 array!17809 (_ BitVec 32) (_ BitVec 32) V!10467 V!10467 (_ BitVec 32) Int) ListLongMap!4077)

(assert (=> b!339460 (= res!187536 (not (contains!2116 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339461 () Bool)

(declare-fun res!187537 () Bool)

(assert (=> b!339461 (=> (not res!187537) (not e!208247))))

(declare-datatypes ((List!4799 0))(
  ( (Nil!4796) (Cons!4795 (h!5651 (_ BitVec 64)) (t!9892 List!4799)) )
))
(declare-fun arrayNoDuplicates!0 (array!17811 (_ BitVec 32) List!4799) Bool)

(assert (=> b!339461 (= res!187537 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4796))))

(declare-fun mapNonEmpty!12093 () Bool)

(declare-fun tp!25020 () Bool)

(assert (=> mapNonEmpty!12093 (= mapRes!12093 (and tp!25020 e!208249))))

(declare-fun mapRest!12093 () (Array (_ BitVec 32) ValueCell!3215))

(declare-fun mapValue!12093 () ValueCell!3215)

(declare-fun mapKey!12093 () (_ BitVec 32))

(assert (=> mapNonEmpty!12093 (= (arr!8428 _values!1525) (store mapRest!12093 mapKey!12093 mapValue!12093))))

(declare-fun b!339462 () Bool)

(declare-fun res!187534 () Bool)

(assert (=> b!339462 (=> (not res!187534) (not e!208247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17811 (_ BitVec 32)) Bool)

(assert (=> b!339462 (= res!187534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(assert (= (and start!34072 res!187533) b!339455))

(assert (= (and b!339455 res!187535) b!339462))

(assert (= (and b!339462 res!187534) b!339461))

(assert (= (and b!339461 res!187537) b!339454))

(assert (= (and b!339454 res!187538) b!339460))

(assert (= (and b!339460 res!187536) b!339458))

(assert (= (and b!339459 condMapEmpty!12093) mapIsEmpty!12093))

(assert (= (and b!339459 (not condMapEmpty!12093)) mapNonEmpty!12093))

(assert (= (and mapNonEmpty!12093 ((_ is ValueCellFull!3215) mapValue!12093)) b!339456))

(assert (= (and b!339459 ((_ is ValueCellFull!3215) mapDefault!12093)) b!339457))

(assert (= start!34072 b!339459))

(declare-fun m!341899 () Bool)

(assert (=> b!339461 m!341899))

(declare-fun m!341901 () Bool)

(assert (=> b!339458 m!341901))

(declare-fun m!341903 () Bool)

(assert (=> b!339454 m!341903))

(declare-fun m!341905 () Bool)

(assert (=> mapNonEmpty!12093 m!341905))

(declare-fun m!341907 () Bool)

(assert (=> b!339460 m!341907))

(assert (=> b!339460 m!341907))

(declare-fun m!341909 () Bool)

(assert (=> b!339460 m!341909))

(declare-fun m!341911 () Bool)

(assert (=> b!339462 m!341911))

(declare-fun m!341913 () Bool)

(assert (=> start!34072 m!341913))

(declare-fun m!341915 () Bool)

(assert (=> start!34072 m!341915))

(declare-fun m!341917 () Bool)

(assert (=> start!34072 m!341917))

(check-sat (not b!339461) (not b_next!7165) (not b!339460) b_and!14333 tp_is_empty!7117 (not b!339462) (not start!34072) (not mapNonEmpty!12093) (not b!339458) (not b!339454))
(check-sat b_and!14333 (not b_next!7165))
(get-model)

(declare-fun bm!26459 () Bool)

(declare-fun call!26462 () Bool)

(assert (=> bm!26459 (= call!26462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!339525 () Bool)

(declare-fun e!208287 () Bool)

(assert (=> b!339525 (= e!208287 call!26462)))

(declare-fun b!339526 () Bool)

(declare-fun e!208288 () Bool)

(assert (=> b!339526 (= e!208287 e!208288)))

(declare-fun lt!161045 () (_ BitVec 64))

(assert (=> b!339526 (= lt!161045 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10558 0))(
  ( (Unit!10559) )
))
(declare-fun lt!161044 () Unit!10558)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17811 (_ BitVec 64) (_ BitVec 32)) Unit!10558)

(assert (=> b!339526 (= lt!161044 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161045 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!17811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339526 (arrayContainsKey!0 _keys!1895 lt!161045 #b00000000000000000000000000000000)))

(declare-fun lt!161046 () Unit!10558)

(assert (=> b!339526 (= lt!161046 lt!161044)))

(declare-fun res!187579 () Bool)

(assert (=> b!339526 (= res!187579 (= (seekEntryOrOpen!0 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3251 #b00000000000000000000000000000000)))))

(assert (=> b!339526 (=> (not res!187579) (not e!208288))))

(declare-fun b!339527 () Bool)

(declare-fun e!208286 () Bool)

(assert (=> b!339527 (= e!208286 e!208287)))

(declare-fun c!52505 () Bool)

(assert (=> b!339527 (= c!52505 (validKeyInArray!0 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339528 () Bool)

(assert (=> b!339528 (= e!208288 call!26462)))

(declare-fun d!70661 () Bool)

(declare-fun res!187580 () Bool)

(assert (=> d!70661 (=> res!187580 e!208286)))

(assert (=> d!70661 (= res!187580 (bvsge #b00000000000000000000000000000000 (size!8782 _keys!1895)))))

(assert (=> d!70661 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208286)))

(assert (= (and d!70661 (not res!187580)) b!339527))

(assert (= (and b!339527 c!52505) b!339526))

(assert (= (and b!339527 (not c!52505)) b!339525))

(assert (= (and b!339526 res!187579) b!339528))

(assert (= (or b!339528 b!339525) bm!26459))

(declare-fun m!341959 () Bool)

(assert (=> bm!26459 m!341959))

(declare-fun m!341961 () Bool)

(assert (=> b!339526 m!341961))

(declare-fun m!341963 () Bool)

(assert (=> b!339526 m!341963))

(declare-fun m!341965 () Bool)

(assert (=> b!339526 m!341965))

(assert (=> b!339526 m!341961))

(declare-fun m!341967 () Bool)

(assert (=> b!339526 m!341967))

(assert (=> b!339527 m!341961))

(assert (=> b!339527 m!341961))

(declare-fun m!341969 () Bool)

(assert (=> b!339527 m!341969))

(assert (=> b!339462 d!70661))

(declare-fun d!70663 () Bool)

(declare-fun lt!161054 () SeekEntryResult!3251)

(assert (=> d!70663 (and (or ((_ is Undefined!3251) lt!161054) (not ((_ is Found!3251) lt!161054)) (and (bvsge (index!15184 lt!161054) #b00000000000000000000000000000000) (bvslt (index!15184 lt!161054) (size!8782 _keys!1895)))) (or ((_ is Undefined!3251) lt!161054) ((_ is Found!3251) lt!161054) (not ((_ is MissingZero!3251) lt!161054)) (and (bvsge (index!15183 lt!161054) #b00000000000000000000000000000000) (bvslt (index!15183 lt!161054) (size!8782 _keys!1895)))) (or ((_ is Undefined!3251) lt!161054) ((_ is Found!3251) lt!161054) ((_ is MissingZero!3251) lt!161054) (not ((_ is MissingVacant!3251) lt!161054)) (and (bvsge (index!15186 lt!161054) #b00000000000000000000000000000000) (bvslt (index!15186 lt!161054) (size!8782 _keys!1895)))) (or ((_ is Undefined!3251) lt!161054) (ite ((_ is Found!3251) lt!161054) (= (select (arr!8429 _keys!1895) (index!15184 lt!161054)) k0!1348) (ite ((_ is MissingZero!3251) lt!161054) (= (select (arr!8429 _keys!1895) (index!15183 lt!161054)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3251) lt!161054) (= (select (arr!8429 _keys!1895) (index!15186 lt!161054)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!208296 () SeekEntryResult!3251)

(assert (=> d!70663 (= lt!161054 e!208296)))

(declare-fun c!52512 () Bool)

(declare-fun lt!161053 () SeekEntryResult!3251)

(assert (=> d!70663 (= c!52512 (and ((_ is Intermediate!3251) lt!161053) (undefined!4063 lt!161053)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17811 (_ BitVec 32)) SeekEntryResult!3251)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70663 (= lt!161053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70663 (validMask!0 mask!2385)))

(assert (=> d!70663 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161054)))

(declare-fun b!339541 () Bool)

(declare-fun e!208295 () SeekEntryResult!3251)

(assert (=> b!339541 (= e!208295 (MissingZero!3251 (index!15185 lt!161053)))))

(declare-fun b!339542 () Bool)

(declare-fun e!208297 () SeekEntryResult!3251)

(assert (=> b!339542 (= e!208297 (Found!3251 (index!15185 lt!161053)))))

(declare-fun b!339543 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17811 (_ BitVec 32)) SeekEntryResult!3251)

(assert (=> b!339543 (= e!208295 (seekKeyOrZeroReturnVacant!0 (x!33826 lt!161053) (index!15185 lt!161053) (index!15185 lt!161053) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339544 () Bool)

(assert (=> b!339544 (= e!208296 Undefined!3251)))

(declare-fun b!339545 () Bool)

(declare-fun c!52513 () Bool)

(declare-fun lt!161055 () (_ BitVec 64))

(assert (=> b!339545 (= c!52513 (= lt!161055 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!339545 (= e!208297 e!208295)))

(declare-fun b!339546 () Bool)

(assert (=> b!339546 (= e!208296 e!208297)))

(assert (=> b!339546 (= lt!161055 (select (arr!8429 _keys!1895) (index!15185 lt!161053)))))

(declare-fun c!52514 () Bool)

(assert (=> b!339546 (= c!52514 (= lt!161055 k0!1348))))

(assert (= (and d!70663 c!52512) b!339544))

(assert (= (and d!70663 (not c!52512)) b!339546))

(assert (= (and b!339546 c!52514) b!339542))

(assert (= (and b!339546 (not c!52514)) b!339545))

(assert (= (and b!339545 c!52513) b!339541))

(assert (= (and b!339545 (not c!52513)) b!339543))

(declare-fun m!341971 () Bool)

(assert (=> d!70663 m!341971))

(declare-fun m!341973 () Bool)

(assert (=> d!70663 m!341973))

(declare-fun m!341975 () Bool)

(assert (=> d!70663 m!341975))

(assert (=> d!70663 m!341913))

(assert (=> d!70663 m!341971))

(declare-fun m!341977 () Bool)

(assert (=> d!70663 m!341977))

(declare-fun m!341979 () Bool)

(assert (=> d!70663 m!341979))

(declare-fun m!341981 () Bool)

(assert (=> b!339543 m!341981))

(declare-fun m!341983 () Bool)

(assert (=> b!339546 m!341983))

(assert (=> b!339458 d!70663))

(declare-fun d!70665 () Bool)

(assert (=> d!70665 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339454 d!70665))

(declare-fun d!70667 () Bool)

(assert (=> d!70667 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34072 d!70667))

(declare-fun d!70669 () Bool)

(assert (=> d!70669 (= (array_inv!6278 _values!1525) (bvsge (size!8781 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34072 d!70669))

(declare-fun d!70671 () Bool)

(assert (=> d!70671 (= (array_inv!6279 _keys!1895) (bvsge (size!8782 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34072 d!70671))

(declare-fun d!70673 () Bool)

(declare-fun e!208303 () Bool)

(assert (=> d!70673 e!208303))

(declare-fun res!187583 () Bool)

(assert (=> d!70673 (=> res!187583 e!208303)))

(declare-fun lt!161067 () Bool)

(assert (=> d!70673 (= res!187583 (not lt!161067))))

(declare-fun lt!161064 () Bool)

(assert (=> d!70673 (= lt!161067 lt!161064)))

(declare-fun lt!161066 () Unit!10558)

(declare-fun e!208302 () Unit!10558)

(assert (=> d!70673 (= lt!161066 e!208302)))

(declare-fun c!52517 () Bool)

(assert (=> d!70673 (= c!52517 lt!161064)))

(declare-fun containsKey!321 (List!4798 (_ BitVec 64)) Bool)

(assert (=> d!70673 (= lt!161064 (containsKey!321 (toList!2054 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70673 (= (contains!2116 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161067)))

(declare-fun b!339553 () Bool)

(declare-fun lt!161065 () Unit!10558)

(assert (=> b!339553 (= e!208302 lt!161065)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!270 (List!4798 (_ BitVec 64)) Unit!10558)

(assert (=> b!339553 (= lt!161065 (lemmaContainsKeyImpliesGetValueByKeyDefined!270 (toList!2054 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!335 0))(
  ( (Some!334 (v!5769 V!10467)) (None!333) )
))
(declare-fun isDefined!271 (Option!335) Bool)

(declare-fun getValueByKey!329 (List!4798 (_ BitVec 64)) Option!335)

(assert (=> b!339553 (isDefined!271 (getValueByKey!329 (toList!2054 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339554 () Bool)

(declare-fun Unit!10560 () Unit!10558)

(assert (=> b!339554 (= e!208302 Unit!10560)))

(declare-fun b!339555 () Bool)

(assert (=> b!339555 (= e!208303 (isDefined!271 (getValueByKey!329 (toList!2054 (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70673 c!52517) b!339553))

(assert (= (and d!70673 (not c!52517)) b!339554))

(assert (= (and d!70673 (not res!187583)) b!339555))

(declare-fun m!341985 () Bool)

(assert (=> d!70673 m!341985))

(declare-fun m!341987 () Bool)

(assert (=> b!339553 m!341987))

(declare-fun m!341989 () Bool)

(assert (=> b!339553 m!341989))

(assert (=> b!339553 m!341989))

(declare-fun m!341991 () Bool)

(assert (=> b!339553 m!341991))

(assert (=> b!339555 m!341989))

(assert (=> b!339555 m!341989))

(assert (=> b!339555 m!341991))

(assert (=> b!339460 d!70673))

(declare-fun b!339598 () Bool)

(declare-fun e!208336 () ListLongMap!4077)

(declare-fun e!208340 () ListLongMap!4077)

(assert (=> b!339598 (= e!208336 e!208340)))

(declare-fun c!52531 () Bool)

(assert (=> b!339598 (= c!52531 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339599 () Bool)

(declare-fun e!208337 () Unit!10558)

(declare-fun lt!161114 () Unit!10558)

(assert (=> b!339599 (= e!208337 lt!161114)))

(declare-fun lt!161130 () ListLongMap!4077)

(declare-fun getCurrentListMapNoExtraKeys!589 (array!17811 array!17809 (_ BitVec 32) (_ BitVec 32) V!10467 V!10467 (_ BitVec 32) Int) ListLongMap!4077)

(assert (=> b!339599 (= lt!161130 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161133 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161133 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161128 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161128 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161131 () Unit!10558)

(declare-fun addStillContains!249 (ListLongMap!4077 (_ BitVec 64) V!10467 (_ BitVec 64)) Unit!10558)

(assert (=> b!339599 (= lt!161131 (addStillContains!249 lt!161130 lt!161133 zeroValue!1467 lt!161128))))

(declare-fun +!726 (ListLongMap!4077 tuple2!5174) ListLongMap!4077)

(assert (=> b!339599 (contains!2116 (+!726 lt!161130 (tuple2!5175 lt!161133 zeroValue!1467)) lt!161128)))

(declare-fun lt!161123 () Unit!10558)

(assert (=> b!339599 (= lt!161123 lt!161131)))

(declare-fun lt!161126 () ListLongMap!4077)

(assert (=> b!339599 (= lt!161126 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161120 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161120 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161116 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161116 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161115 () Unit!10558)

(declare-fun addApplyDifferent!249 (ListLongMap!4077 (_ BitVec 64) V!10467 (_ BitVec 64)) Unit!10558)

(assert (=> b!339599 (= lt!161115 (addApplyDifferent!249 lt!161126 lt!161120 minValue!1467 lt!161116))))

(declare-fun apply!273 (ListLongMap!4077 (_ BitVec 64)) V!10467)

(assert (=> b!339599 (= (apply!273 (+!726 lt!161126 (tuple2!5175 lt!161120 minValue!1467)) lt!161116) (apply!273 lt!161126 lt!161116))))

(declare-fun lt!161113 () Unit!10558)

(assert (=> b!339599 (= lt!161113 lt!161115)))

(declare-fun lt!161118 () ListLongMap!4077)

(assert (=> b!339599 (= lt!161118 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161132 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161132 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161121 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161121 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161117 () Unit!10558)

(assert (=> b!339599 (= lt!161117 (addApplyDifferent!249 lt!161118 lt!161132 zeroValue!1467 lt!161121))))

(assert (=> b!339599 (= (apply!273 (+!726 lt!161118 (tuple2!5175 lt!161132 zeroValue!1467)) lt!161121) (apply!273 lt!161118 lt!161121))))

(declare-fun lt!161112 () Unit!10558)

(assert (=> b!339599 (= lt!161112 lt!161117)))

(declare-fun lt!161119 () ListLongMap!4077)

(assert (=> b!339599 (= lt!161119 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161129 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161129 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161125 () (_ BitVec 64))

(assert (=> b!339599 (= lt!161125 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339599 (= lt!161114 (addApplyDifferent!249 lt!161119 lt!161129 minValue!1467 lt!161125))))

(assert (=> b!339599 (= (apply!273 (+!726 lt!161119 (tuple2!5175 lt!161129 minValue!1467)) lt!161125) (apply!273 lt!161119 lt!161125))))

(declare-fun b!339600 () Bool)

(declare-fun e!208332 () Bool)

(declare-fun e!208331 () Bool)

(assert (=> b!339600 (= e!208332 e!208331)))

(declare-fun res!187607 () Bool)

(declare-fun call!26478 () Bool)

(assert (=> b!339600 (= res!187607 call!26478)))

(assert (=> b!339600 (=> (not res!187607) (not e!208331))))

(declare-fun b!339601 () Bool)

(declare-fun c!52530 () Bool)

(assert (=> b!339601 (= c!52530 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208330 () ListLongMap!4077)

(assert (=> b!339601 (= e!208340 e!208330)))

(declare-fun b!339602 () Bool)

(assert (=> b!339602 (= e!208332 (not call!26478))))

(declare-fun b!339603 () Bool)

(declare-fun call!26481 () ListLongMap!4077)

(assert (=> b!339603 (= e!208340 call!26481)))

(declare-fun bm!26474 () Bool)

(declare-fun call!26482 () ListLongMap!4077)

(assert (=> bm!26474 (= call!26482 (getCurrentListMapNoExtraKeys!589 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26475 () Bool)

(declare-fun lt!161122 () ListLongMap!4077)

(assert (=> bm!26475 (= call!26478 (contains!2116 lt!161122 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26476 () Bool)

(declare-fun call!26479 () ListLongMap!4077)

(declare-fun call!26483 () ListLongMap!4077)

(assert (=> bm!26476 (= call!26479 call!26483)))

(declare-fun b!339605 () Bool)

(declare-fun e!208339 () Bool)

(assert (=> b!339605 (= e!208339 (validKeyInArray!0 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339606 () Bool)

(declare-fun e!208334 () Bool)

(declare-fun get!4585 (ValueCell!3215 V!10467) V!10467)

(declare-fun dynLambda!607 (Int (_ BitVec 64)) V!10467)

(assert (=> b!339606 (= e!208334 (= (apply!273 lt!161122 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)) (get!4585 (select (arr!8428 _values!1525) #b00000000000000000000000000000000) (dynLambda!607 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8781 _values!1525)))))

(assert (=> b!339606 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8782 _keys!1895)))))

(declare-fun b!339607 () Bool)

(declare-fun res!187605 () Bool)

(declare-fun e!208338 () Bool)

(assert (=> b!339607 (=> (not res!187605) (not e!208338))))

(declare-fun e!208341 () Bool)

(assert (=> b!339607 (= res!187605 e!208341)))

(declare-fun c!52534 () Bool)

(assert (=> b!339607 (= c!52534 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!339608 () Bool)

(declare-fun e!208333 () Bool)

(assert (=> b!339608 (= e!208341 e!208333)))

(declare-fun res!187608 () Bool)

(declare-fun call!26477 () Bool)

(assert (=> b!339608 (= res!187608 call!26477)))

(assert (=> b!339608 (=> (not res!187608) (not e!208333))))

(declare-fun b!339609 () Bool)

(assert (=> b!339609 (= e!208330 call!26479)))

(declare-fun b!339610 () Bool)

(declare-fun call!26480 () ListLongMap!4077)

(assert (=> b!339610 (= e!208336 (+!726 call!26480 (tuple2!5175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26477 () Bool)

(assert (=> bm!26477 (= call!26477 (contains!2116 lt!161122 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26478 () Bool)

(assert (=> bm!26478 (= call!26481 call!26480)))

(declare-fun b!339611 () Bool)

(declare-fun e!208335 () Bool)

(assert (=> b!339611 (= e!208335 e!208334)))

(declare-fun res!187602 () Bool)

(assert (=> b!339611 (=> (not res!187602) (not e!208334))))

(assert (=> b!339611 (= res!187602 (contains!2116 lt!161122 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339611 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8782 _keys!1895)))))

(declare-fun b!339612 () Bool)

(assert (=> b!339612 (= e!208330 call!26481)))

(declare-fun c!52535 () Bool)

(declare-fun bm!26479 () Bool)

(assert (=> bm!26479 (= call!26480 (+!726 (ite c!52535 call!26482 (ite c!52531 call!26483 call!26479)) (ite (or c!52535 c!52531) (tuple2!5175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5175 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!339613 () Bool)

(declare-fun Unit!10561 () Unit!10558)

(assert (=> b!339613 (= e!208337 Unit!10561)))

(declare-fun bm!26480 () Bool)

(assert (=> bm!26480 (= call!26483 call!26482)))

(declare-fun d!70675 () Bool)

(assert (=> d!70675 e!208338))

(declare-fun res!187610 () Bool)

(assert (=> d!70675 (=> (not res!187610) (not e!208338))))

(assert (=> d!70675 (= res!187610 (or (bvsge #b00000000000000000000000000000000 (size!8782 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8782 _keys!1895)))))))

(declare-fun lt!161127 () ListLongMap!4077)

(assert (=> d!70675 (= lt!161122 lt!161127)))

(declare-fun lt!161124 () Unit!10558)

(assert (=> d!70675 (= lt!161124 e!208337)))

(declare-fun c!52533 () Bool)

(declare-fun e!208342 () Bool)

(assert (=> d!70675 (= c!52533 e!208342)))

(declare-fun res!187603 () Bool)

(assert (=> d!70675 (=> (not res!187603) (not e!208342))))

(assert (=> d!70675 (= res!187603 (bvslt #b00000000000000000000000000000000 (size!8782 _keys!1895)))))

(assert (=> d!70675 (= lt!161127 e!208336)))

(assert (=> d!70675 (= c!52535 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70675 (validMask!0 mask!2385)))

(assert (=> d!70675 (= (getCurrentListMap!1560 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161122)))

(declare-fun b!339604 () Bool)

(assert (=> b!339604 (= e!208333 (= (apply!273 lt!161122 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!339614 () Bool)

(assert (=> b!339614 (= e!208341 (not call!26477))))

(declare-fun b!339615 () Bool)

(declare-fun res!187606 () Bool)

(assert (=> b!339615 (=> (not res!187606) (not e!208338))))

(assert (=> b!339615 (= res!187606 e!208335)))

(declare-fun res!187609 () Bool)

(assert (=> b!339615 (=> res!187609 e!208335)))

(assert (=> b!339615 (= res!187609 (not e!208339))))

(declare-fun res!187604 () Bool)

(assert (=> b!339615 (=> (not res!187604) (not e!208339))))

(assert (=> b!339615 (= res!187604 (bvslt #b00000000000000000000000000000000 (size!8782 _keys!1895)))))

(declare-fun b!339616 () Bool)

(assert (=> b!339616 (= e!208338 e!208332)))

(declare-fun c!52532 () Bool)

(assert (=> b!339616 (= c!52532 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!339617 () Bool)

(assert (=> b!339617 (= e!208342 (validKeyInArray!0 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339618 () Bool)

(assert (=> b!339618 (= e!208331 (= (apply!273 lt!161122 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(assert (= (and d!70675 c!52535) b!339610))

(assert (= (and d!70675 (not c!52535)) b!339598))

(assert (= (and b!339598 c!52531) b!339603))

(assert (= (and b!339598 (not c!52531)) b!339601))

(assert (= (and b!339601 c!52530) b!339612))

(assert (= (and b!339601 (not c!52530)) b!339609))

(assert (= (or b!339612 b!339609) bm!26476))

(assert (= (or b!339603 bm!26476) bm!26480))

(assert (= (or b!339603 b!339612) bm!26478))

(assert (= (or b!339610 bm!26480) bm!26474))

(assert (= (or b!339610 bm!26478) bm!26479))

(assert (= (and d!70675 res!187603) b!339617))

(assert (= (and d!70675 c!52533) b!339599))

(assert (= (and d!70675 (not c!52533)) b!339613))

(assert (= (and d!70675 res!187610) b!339615))

(assert (= (and b!339615 res!187604) b!339605))

(assert (= (and b!339615 (not res!187609)) b!339611))

(assert (= (and b!339611 res!187602) b!339606))

(assert (= (and b!339615 res!187606) b!339607))

(assert (= (and b!339607 c!52534) b!339608))

(assert (= (and b!339607 (not c!52534)) b!339614))

(assert (= (and b!339608 res!187608) b!339604))

(assert (= (or b!339608 b!339614) bm!26477))

(assert (= (and b!339607 res!187605) b!339616))

(assert (= (and b!339616 c!52532) b!339600))

(assert (= (and b!339616 (not c!52532)) b!339602))

(assert (= (and b!339600 res!187607) b!339618))

(assert (= (or b!339600 b!339602) bm!26475))

(declare-fun b_lambda!8413 () Bool)

(assert (=> (not b_lambda!8413) (not b!339606)))

(declare-fun t!9896 () Bool)

(declare-fun tb!3053 () Bool)

(assert (=> (and start!34072 (= defaultEntry!1528 defaultEntry!1528) t!9896) tb!3053))

(declare-fun result!5505 () Bool)

(assert (=> tb!3053 (= result!5505 tp_is_empty!7117)))

(assert (=> b!339606 t!9896))

(declare-fun b_and!14339 () Bool)

(assert (= b_and!14333 (and (=> t!9896 result!5505) b_and!14339)))

(declare-fun m!341993 () Bool)

(assert (=> bm!26474 m!341993))

(declare-fun m!341995 () Bool)

(assert (=> b!339618 m!341995))

(assert (=> b!339617 m!341961))

(assert (=> b!339617 m!341961))

(assert (=> b!339617 m!341969))

(declare-fun m!341997 () Bool)

(assert (=> bm!26479 m!341997))

(declare-fun m!341999 () Bool)

(assert (=> bm!26477 m!341999))

(assert (=> d!70675 m!341913))

(assert (=> b!339611 m!341961))

(assert (=> b!339611 m!341961))

(declare-fun m!342001 () Bool)

(assert (=> b!339611 m!342001))

(declare-fun m!342003 () Bool)

(assert (=> b!339610 m!342003))

(assert (=> b!339605 m!341961))

(assert (=> b!339605 m!341961))

(assert (=> b!339605 m!341969))

(declare-fun m!342005 () Bool)

(assert (=> b!339599 m!342005))

(declare-fun m!342007 () Bool)

(assert (=> b!339599 m!342007))

(declare-fun m!342009 () Bool)

(assert (=> b!339599 m!342009))

(declare-fun m!342011 () Bool)

(assert (=> b!339599 m!342011))

(declare-fun m!342013 () Bool)

(assert (=> b!339599 m!342013))

(declare-fun m!342015 () Bool)

(assert (=> b!339599 m!342015))

(declare-fun m!342017 () Bool)

(assert (=> b!339599 m!342017))

(assert (=> b!339599 m!341993))

(declare-fun m!342019 () Bool)

(assert (=> b!339599 m!342019))

(assert (=> b!339599 m!342015))

(assert (=> b!339599 m!342005))

(declare-fun m!342021 () Bool)

(assert (=> b!339599 m!342021))

(assert (=> b!339599 m!342019))

(declare-fun m!342023 () Bool)

(assert (=> b!339599 m!342023))

(declare-fun m!342025 () Bool)

(assert (=> b!339599 m!342025))

(declare-fun m!342027 () Bool)

(assert (=> b!339599 m!342027))

(assert (=> b!339599 m!341961))

(declare-fun m!342029 () Bool)

(assert (=> b!339599 m!342029))

(declare-fun m!342031 () Bool)

(assert (=> b!339599 m!342031))

(assert (=> b!339599 m!342027))

(declare-fun m!342033 () Bool)

(assert (=> b!339599 m!342033))

(declare-fun m!342035 () Bool)

(assert (=> b!339606 m!342035))

(declare-fun m!342037 () Bool)

(assert (=> b!339606 m!342037))

(assert (=> b!339606 m!342035))

(declare-fun m!342039 () Bool)

(assert (=> b!339606 m!342039))

(assert (=> b!339606 m!341961))

(assert (=> b!339606 m!341961))

(declare-fun m!342041 () Bool)

(assert (=> b!339606 m!342041))

(assert (=> b!339606 m!342037))

(declare-fun m!342043 () Bool)

(assert (=> bm!26475 m!342043))

(declare-fun m!342045 () Bool)

(assert (=> b!339604 m!342045))

(assert (=> b!339460 d!70675))

(declare-fun b!339631 () Bool)

(declare-fun e!208354 () Bool)

(declare-fun e!208353 () Bool)

(assert (=> b!339631 (= e!208354 e!208353)))

(declare-fun c!52538 () Bool)

(assert (=> b!339631 (= c!52538 (validKeyInArray!0 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339632 () Bool)

(declare-fun e!208351 () Bool)

(declare-fun contains!2118 (List!4799 (_ BitVec 64)) Bool)

(assert (=> b!339632 (= e!208351 (contains!2118 Nil!4796 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339633 () Bool)

(declare-fun call!26486 () Bool)

(assert (=> b!339633 (= e!208353 call!26486)))

(declare-fun b!339634 () Bool)

(assert (=> b!339634 (= e!208353 call!26486)))

(declare-fun b!339635 () Bool)

(declare-fun e!208352 () Bool)

(assert (=> b!339635 (= e!208352 e!208354)))

(declare-fun res!187619 () Bool)

(assert (=> b!339635 (=> (not res!187619) (not e!208354))))

(assert (=> b!339635 (= res!187619 (not e!208351))))

(declare-fun res!187618 () Bool)

(assert (=> b!339635 (=> (not res!187618) (not e!208351))))

(assert (=> b!339635 (= res!187618 (validKeyInArray!0 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!70677 () Bool)

(declare-fun res!187617 () Bool)

(assert (=> d!70677 (=> res!187617 e!208352)))

(assert (=> d!70677 (= res!187617 (bvsge #b00000000000000000000000000000000 (size!8782 _keys!1895)))))

(assert (=> d!70677 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4796) e!208352)))

(declare-fun bm!26483 () Bool)

(assert (=> bm!26483 (= call!26486 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52538 (Cons!4795 (select (arr!8429 _keys!1895) #b00000000000000000000000000000000) Nil!4796) Nil!4796)))))

(assert (= (and d!70677 (not res!187617)) b!339635))

(assert (= (and b!339635 res!187618) b!339632))

(assert (= (and b!339635 res!187619) b!339631))

(assert (= (and b!339631 c!52538) b!339634))

(assert (= (and b!339631 (not c!52538)) b!339633))

(assert (= (or b!339634 b!339633) bm!26483))

(assert (=> b!339631 m!341961))

(assert (=> b!339631 m!341961))

(assert (=> b!339631 m!341969))

(assert (=> b!339632 m!341961))

(assert (=> b!339632 m!341961))

(declare-fun m!342047 () Bool)

(assert (=> b!339632 m!342047))

(assert (=> b!339635 m!341961))

(assert (=> b!339635 m!341961))

(assert (=> b!339635 m!341969))

(assert (=> bm!26483 m!341961))

(declare-fun m!342049 () Bool)

(assert (=> bm!26483 m!342049))

(assert (=> b!339461 d!70677))

(declare-fun mapNonEmpty!12102 () Bool)

(declare-fun mapRes!12102 () Bool)

(declare-fun tp!25035 () Bool)

(declare-fun e!208359 () Bool)

(assert (=> mapNonEmpty!12102 (= mapRes!12102 (and tp!25035 e!208359))))

(declare-fun mapRest!12102 () (Array (_ BitVec 32) ValueCell!3215))

(declare-fun mapKey!12102 () (_ BitVec 32))

(declare-fun mapValue!12102 () ValueCell!3215)

(assert (=> mapNonEmpty!12102 (= mapRest!12093 (store mapRest!12102 mapKey!12102 mapValue!12102))))

(declare-fun b!339643 () Bool)

(declare-fun e!208360 () Bool)

(assert (=> b!339643 (= e!208360 tp_is_empty!7117)))

(declare-fun b!339642 () Bool)

(assert (=> b!339642 (= e!208359 tp_is_empty!7117)))

(declare-fun mapIsEmpty!12102 () Bool)

(assert (=> mapIsEmpty!12102 mapRes!12102))

(declare-fun condMapEmpty!12102 () Bool)

(declare-fun mapDefault!12102 () ValueCell!3215)

(assert (=> mapNonEmpty!12093 (= condMapEmpty!12102 (= mapRest!12093 ((as const (Array (_ BitVec 32) ValueCell!3215)) mapDefault!12102)))))

(assert (=> mapNonEmpty!12093 (= tp!25020 (and e!208360 mapRes!12102))))

(assert (= (and mapNonEmpty!12093 condMapEmpty!12102) mapIsEmpty!12102))

(assert (= (and mapNonEmpty!12093 (not condMapEmpty!12102)) mapNonEmpty!12102))

(assert (= (and mapNonEmpty!12102 ((_ is ValueCellFull!3215) mapValue!12102)) b!339642))

(assert (= (and mapNonEmpty!12093 ((_ is ValueCellFull!3215) mapDefault!12102)) b!339643))

(declare-fun m!342051 () Bool)

(assert (=> mapNonEmpty!12102 m!342051))

(declare-fun b_lambda!8415 () Bool)

(assert (= b_lambda!8413 (or (and start!34072 b_free!7165) b_lambda!8415)))

(check-sat (not b!339555) (not b_next!7165) (not b!339606) (not b!339611) (not b!339527) tp_is_empty!7117 (not b!339604) (not d!70663) (not bm!26474) (not b!339632) (not bm!26483) (not b!339599) (not b!339605) (not bm!26459) (not mapNonEmpty!12102) (not b!339617) (not bm!26477) (not bm!26479) (not b!339618) (not b_lambda!8415) (not b!339553) (not d!70673) (not b!339543) (not bm!26475) (not d!70675) (not b!339635) b_and!14339 (not b!339631) (not b!339610) (not b!339526))
(check-sat b_and!14339 (not b_next!7165))
