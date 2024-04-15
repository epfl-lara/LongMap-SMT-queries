; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35026 () Bool)

(assert start!35026)

(declare-fun b_free!7729 () Bool)

(declare-fun b_next!7729 () Bool)

(assert (=> start!35026 (= b_free!7729 (not b_next!7729))))

(declare-fun tp!26765 () Bool)

(declare-fun b_and!14933 () Bool)

(assert (=> start!35026 (= tp!26765 b_and!14933)))

(declare-fun res!194673 () Bool)

(declare-fun e!214941 () Bool)

(assert (=> start!35026 (=> (not res!194673) (not e!214941))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35026 (= res!194673 (validMask!0 mask!2385))))

(assert (=> start!35026 e!214941))

(assert (=> start!35026 true))

(declare-fun tp_is_empty!7681 () Bool)

(assert (=> start!35026 tp_is_empty!7681))

(assert (=> start!35026 tp!26765))

(declare-datatypes ((V!11219 0))(
  ( (V!11220 (val!3885 Int)) )
))
(declare-datatypes ((ValueCell!3497 0))(
  ( (ValueCellFull!3497 (v!6066 V!11219)) (EmptyCell!3497) )
))
(declare-datatypes ((array!18929 0))(
  ( (array!18930 (arr!8970 (Array (_ BitVec 32) ValueCell!3497)) (size!9323 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18929)

(declare-fun e!214939 () Bool)

(declare-fun array_inv!6646 (array!18929) Bool)

(assert (=> start!35026 (and (array_inv!6646 _values!1525) e!214939)))

(declare-datatypes ((array!18931 0))(
  ( (array!18932 (arr!8971 (Array (_ BitVec 32) (_ BitVec 64))) (size!9324 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18931)

(declare-fun array_inv!6647 (array!18931) Bool)

(assert (=> start!35026 (array_inv!6647 _keys!1895)))

(declare-fun b!350997 () Bool)

(declare-fun res!194677 () Bool)

(assert (=> b!350997 (=> (not res!194677) (not e!214941))))

(declare-datatypes ((List!5195 0))(
  ( (Nil!5192) (Cons!5191 (h!6047 (_ BitVec 64)) (t!10324 List!5195)) )
))
(declare-fun arrayNoDuplicates!0 (array!18931 (_ BitVec 32) List!5195) Bool)

(assert (=> b!350997 (= res!194677 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5192))))

(declare-fun b!350998 () Bool)

(declare-fun e!214943 () Bool)

(assert (=> b!350998 (= e!214943 tp_is_empty!7681)))

(declare-fun b!350999 () Bool)

(declare-fun e!214938 () Bool)

(assert (=> b!350999 (= e!214938 tp_is_empty!7681)))

(declare-fun mapIsEmpty!12993 () Bool)

(declare-fun mapRes!12993 () Bool)

(assert (=> mapIsEmpty!12993 mapRes!12993))

(declare-fun b!351000 () Bool)

(assert (=> b!351000 (= e!214939 (and e!214943 mapRes!12993))))

(declare-fun condMapEmpty!12993 () Bool)

(declare-fun mapDefault!12993 () ValueCell!3497)

(assert (=> b!351000 (= condMapEmpty!12993 (= (arr!8970 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3497)) mapDefault!12993)))))

(declare-fun b!351001 () Bool)

(declare-fun res!194672 () Bool)

(assert (=> b!351001 (=> (not res!194672) (not e!214941))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351001 (= res!194672 (and (= (size!9323 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9324 _keys!1895) (size!9323 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351002 () Bool)

(declare-fun res!194676 () Bool)

(assert (=> b!351002 (=> (not res!194676) (not e!214941))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351002 (= res!194676 (validKeyInArray!0 k0!1348))))

(declare-fun b!351003 () Bool)

(declare-fun res!194678 () Bool)

(assert (=> b!351003 (=> (not res!194678) (not e!214941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18931 (_ BitVec 32)) Bool)

(assert (=> b!351003 (= res!194678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12993 () Bool)

(declare-fun tp!26766 () Bool)

(assert (=> mapNonEmpty!12993 (= mapRes!12993 (and tp!26766 e!214938))))

(declare-fun mapKey!12993 () (_ BitVec 32))

(declare-fun mapRest!12993 () (Array (_ BitVec 32) ValueCell!3497))

(declare-fun mapValue!12993 () ValueCell!3497)

(assert (=> mapNonEmpty!12993 (= (arr!8970 _values!1525) (store mapRest!12993 mapKey!12993 mapValue!12993))))

(declare-fun b!351004 () Bool)

(declare-fun res!194675 () Bool)

(assert (=> b!351004 (=> (not res!194675) (not e!214941))))

(declare-fun zeroValue!1467 () V!11219)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11219)

(declare-datatypes ((tuple2!5580 0))(
  ( (tuple2!5581 (_1!2801 (_ BitVec 64)) (_2!2801 V!11219)) )
))
(declare-datatypes ((List!5196 0))(
  ( (Nil!5193) (Cons!5192 (h!6048 tuple2!5580) (t!10325 List!5196)) )
))
(declare-datatypes ((ListLongMap!4483 0))(
  ( (ListLongMap!4484 (toList!2257 List!5196)) )
))
(declare-fun contains!2337 (ListLongMap!4483 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1762 (array!18931 array!18929 (_ BitVec 32) (_ BitVec 32) V!11219 V!11219 (_ BitVec 32) Int) ListLongMap!4483)

(assert (=> b!351004 (= res!194675 (not (contains!2337 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351005 () Bool)

(declare-fun e!214940 () Bool)

(declare-fun lt!164499 () (_ BitVec 32))

(assert (=> b!351005 (= e!214940 (or (bvslt lt!164499 #b00000000000000000000000000000000) (bvsge lt!164499 (size!9324 _keys!1895))))))

(declare-fun arrayScanForKey!0 (array!18931 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351005 (= lt!164499 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351006 () Bool)

(assert (=> b!351006 (= e!214941 e!214940)))

(declare-fun res!194674 () Bool)

(assert (=> b!351006 (=> (not res!194674) (not e!214940))))

(declare-datatypes ((SeekEntryResult!3454 0))(
  ( (MissingZero!3454 (index!15995 (_ BitVec 32))) (Found!3454 (index!15996 (_ BitVec 32))) (Intermediate!3454 (undefined!4266 Bool) (index!15997 (_ BitVec 32)) (x!34961 (_ BitVec 32))) (Undefined!3454) (MissingVacant!3454 (index!15998 (_ BitVec 32))) )
))
(declare-fun lt!164498 () SeekEntryResult!3454)

(get-info :version)

(assert (=> b!351006 (= res!194674 (and (not ((_ is Found!3454) lt!164498)) (not ((_ is MissingZero!3454) lt!164498)) ((_ is MissingVacant!3454) lt!164498)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18931 (_ BitVec 32)) SeekEntryResult!3454)

(assert (=> b!351006 (= lt!164498 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!351007 () Bool)

(declare-fun res!194679 () Bool)

(assert (=> b!351007 (=> (not res!194679) (not e!214940))))

(declare-fun arrayContainsKey!0 (array!18931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351007 (= res!194679 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!35026 res!194673) b!351001))

(assert (= (and b!351001 res!194672) b!351003))

(assert (= (and b!351003 res!194678) b!350997))

(assert (= (and b!350997 res!194677) b!351002))

(assert (= (and b!351002 res!194676) b!351004))

(assert (= (and b!351004 res!194675) b!351006))

(assert (= (and b!351006 res!194674) b!351007))

(assert (= (and b!351007 res!194679) b!351005))

(assert (= (and b!351000 condMapEmpty!12993) mapIsEmpty!12993))

(assert (= (and b!351000 (not condMapEmpty!12993)) mapNonEmpty!12993))

(assert (= (and mapNonEmpty!12993 ((_ is ValueCellFull!3497) mapValue!12993)) b!350999))

(assert (= (and b!351000 ((_ is ValueCellFull!3497) mapDefault!12993)) b!350998))

(assert (= start!35026 b!351000))

(declare-fun m!350511 () Bool)

(assert (=> mapNonEmpty!12993 m!350511))

(declare-fun m!350513 () Bool)

(assert (=> b!351002 m!350513))

(declare-fun m!350515 () Bool)

(assert (=> b!351006 m!350515))

(declare-fun m!350517 () Bool)

(assert (=> start!35026 m!350517))

(declare-fun m!350519 () Bool)

(assert (=> start!35026 m!350519))

(declare-fun m!350521 () Bool)

(assert (=> start!35026 m!350521))

(declare-fun m!350523 () Bool)

(assert (=> b!350997 m!350523))

(declare-fun m!350525 () Bool)

(assert (=> b!351003 m!350525))

(declare-fun m!350527 () Bool)

(assert (=> b!351005 m!350527))

(declare-fun m!350529 () Bool)

(assert (=> b!351007 m!350529))

(declare-fun m!350531 () Bool)

(assert (=> b!351004 m!350531))

(assert (=> b!351004 m!350531))

(declare-fun m!350533 () Bool)

(assert (=> b!351004 m!350533))

(check-sat (not b!351004) (not b_next!7729) (not b!351005) tp_is_empty!7681 (not start!35026) (not b!351006) (not b!350997) (not b!351007) (not b!351002) b_and!14933 (not b!351003) (not mapNonEmpty!12993))
(check-sat b_and!14933 (not b_next!7729))
(get-model)

(declare-fun d!71243 () Bool)

(declare-fun lt!164514 () (_ BitVec 32))

(assert (=> d!71243 (and (or (bvslt lt!164514 #b00000000000000000000000000000000) (bvsge lt!164514 (size!9324 _keys!1895)) (and (bvsge lt!164514 #b00000000000000000000000000000000) (bvslt lt!164514 (size!9324 _keys!1895)))) (bvsge lt!164514 #b00000000000000000000000000000000) (bvslt lt!164514 (size!9324 _keys!1895)) (= (select (arr!8971 _keys!1895) lt!164514) k0!1348))))

(declare-fun e!214982 () (_ BitVec 32))

(assert (=> d!71243 (= lt!164514 e!214982)))

(declare-fun c!53348 () Bool)

(assert (=> d!71243 (= c!53348 (= (select (arr!8971 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9324 _keys!1895)) (bvslt (size!9324 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71243 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164514)))

(declare-fun b!351078 () Bool)

(assert (=> b!351078 (= e!214982 #b00000000000000000000000000000000)))

(declare-fun b!351079 () Bool)

(assert (=> b!351079 (= e!214982 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71243 c!53348) b!351078))

(assert (= (and d!71243 (not c!53348)) b!351079))

(declare-fun m!350583 () Bool)

(assert (=> d!71243 m!350583))

(declare-fun m!350585 () Bool)

(assert (=> d!71243 m!350585))

(declare-fun m!350587 () Bool)

(assert (=> b!351079 m!350587))

(assert (=> b!351005 d!71243))

(declare-fun b!351090 () Bool)

(declare-fun e!214992 () Bool)

(declare-fun call!26957 () Bool)

(assert (=> b!351090 (= e!214992 call!26957)))

(declare-fun b!351091 () Bool)

(declare-fun e!214991 () Bool)

(assert (=> b!351091 (= e!214991 e!214992)))

(declare-fun c!53351 () Bool)

(assert (=> b!351091 (= c!53351 (validKeyInArray!0 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26954 () Bool)

(assert (=> bm!26954 (= call!26957 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53351 (Cons!5191 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000) Nil!5192) Nil!5192)))))

(declare-fun d!71245 () Bool)

(declare-fun res!194736 () Bool)

(declare-fun e!214994 () Bool)

(assert (=> d!71245 (=> res!194736 e!214994)))

(assert (=> d!71245 (= res!194736 (bvsge #b00000000000000000000000000000000 (size!9324 _keys!1895)))))

(assert (=> d!71245 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5192) e!214994)))

(declare-fun b!351092 () Bool)

(declare-fun e!214993 () Bool)

(declare-fun contains!2339 (List!5195 (_ BitVec 64)) Bool)

(assert (=> b!351092 (= e!214993 (contains!2339 Nil!5192 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351093 () Bool)

(assert (=> b!351093 (= e!214992 call!26957)))

(declare-fun b!351094 () Bool)

(assert (=> b!351094 (= e!214994 e!214991)))

(declare-fun res!194734 () Bool)

(assert (=> b!351094 (=> (not res!194734) (not e!214991))))

(assert (=> b!351094 (= res!194734 (not e!214993))))

(declare-fun res!194735 () Bool)

(assert (=> b!351094 (=> (not res!194735) (not e!214993))))

(assert (=> b!351094 (= res!194735 (validKeyInArray!0 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71245 (not res!194736)) b!351094))

(assert (= (and b!351094 res!194735) b!351092))

(assert (= (and b!351094 res!194734) b!351091))

(assert (= (and b!351091 c!53351) b!351093))

(assert (= (and b!351091 (not c!53351)) b!351090))

(assert (= (or b!351093 b!351090) bm!26954))

(assert (=> b!351091 m!350585))

(assert (=> b!351091 m!350585))

(declare-fun m!350589 () Bool)

(assert (=> b!351091 m!350589))

(assert (=> bm!26954 m!350585))

(declare-fun m!350591 () Bool)

(assert (=> bm!26954 m!350591))

(assert (=> b!351092 m!350585))

(assert (=> b!351092 m!350585))

(declare-fun m!350593 () Bool)

(assert (=> b!351092 m!350593))

(assert (=> b!351094 m!350585))

(assert (=> b!351094 m!350585))

(assert (=> b!351094 m!350589))

(assert (=> b!350997 d!71245))

(declare-fun b!351107 () Bool)

(declare-fun e!215003 () SeekEntryResult!3454)

(declare-fun e!215002 () SeekEntryResult!3454)

(assert (=> b!351107 (= e!215003 e!215002)))

(declare-fun lt!164523 () (_ BitVec 64))

(declare-fun lt!164521 () SeekEntryResult!3454)

(assert (=> b!351107 (= lt!164523 (select (arr!8971 _keys!1895) (index!15997 lt!164521)))))

(declare-fun c!53358 () Bool)

(assert (=> b!351107 (= c!53358 (= lt!164523 k0!1348))))

(declare-fun d!71247 () Bool)

(declare-fun lt!164522 () SeekEntryResult!3454)

(assert (=> d!71247 (and (or ((_ is Undefined!3454) lt!164522) (not ((_ is Found!3454) lt!164522)) (and (bvsge (index!15996 lt!164522) #b00000000000000000000000000000000) (bvslt (index!15996 lt!164522) (size!9324 _keys!1895)))) (or ((_ is Undefined!3454) lt!164522) ((_ is Found!3454) lt!164522) (not ((_ is MissingZero!3454) lt!164522)) (and (bvsge (index!15995 lt!164522) #b00000000000000000000000000000000) (bvslt (index!15995 lt!164522) (size!9324 _keys!1895)))) (or ((_ is Undefined!3454) lt!164522) ((_ is Found!3454) lt!164522) ((_ is MissingZero!3454) lt!164522) (not ((_ is MissingVacant!3454) lt!164522)) (and (bvsge (index!15998 lt!164522) #b00000000000000000000000000000000) (bvslt (index!15998 lt!164522) (size!9324 _keys!1895)))) (or ((_ is Undefined!3454) lt!164522) (ite ((_ is Found!3454) lt!164522) (= (select (arr!8971 _keys!1895) (index!15996 lt!164522)) k0!1348) (ite ((_ is MissingZero!3454) lt!164522) (= (select (arr!8971 _keys!1895) (index!15995 lt!164522)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3454) lt!164522) (= (select (arr!8971 _keys!1895) (index!15998 lt!164522)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!71247 (= lt!164522 e!215003)))

(declare-fun c!53359 () Bool)

(assert (=> d!71247 (= c!53359 (and ((_ is Intermediate!3454) lt!164521) (undefined!4266 lt!164521)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18931 (_ BitVec 32)) SeekEntryResult!3454)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71247 (= lt!164521 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71247 (validMask!0 mask!2385)))

(assert (=> d!71247 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164522)))

(declare-fun b!351108 () Bool)

(assert (=> b!351108 (= e!215003 Undefined!3454)))

(declare-fun b!351109 () Bool)

(declare-fun e!215001 () SeekEntryResult!3454)

(assert (=> b!351109 (= e!215001 (MissingZero!3454 (index!15997 lt!164521)))))

(declare-fun b!351110 () Bool)

(assert (=> b!351110 (= e!215002 (Found!3454 (index!15997 lt!164521)))))

(declare-fun b!351111 () Bool)

(declare-fun c!53360 () Bool)

(assert (=> b!351111 (= c!53360 (= lt!164523 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!351111 (= e!215002 e!215001)))

(declare-fun b!351112 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18931 (_ BitVec 32)) SeekEntryResult!3454)

(assert (=> b!351112 (= e!215001 (seekKeyOrZeroReturnVacant!0 (x!34961 lt!164521) (index!15997 lt!164521) (index!15997 lt!164521) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!71247 c!53359) b!351108))

(assert (= (and d!71247 (not c!53359)) b!351107))

(assert (= (and b!351107 c!53358) b!351110))

(assert (= (and b!351107 (not c!53358)) b!351111))

(assert (= (and b!351111 c!53360) b!351109))

(assert (= (and b!351111 (not c!53360)) b!351112))

(declare-fun m!350595 () Bool)

(assert (=> b!351107 m!350595))

(declare-fun m!350597 () Bool)

(assert (=> d!71247 m!350597))

(declare-fun m!350599 () Bool)

(assert (=> d!71247 m!350599))

(declare-fun m!350601 () Bool)

(assert (=> d!71247 m!350601))

(assert (=> d!71247 m!350517))

(assert (=> d!71247 m!350599))

(declare-fun m!350603 () Bool)

(assert (=> d!71247 m!350603))

(declare-fun m!350605 () Bool)

(assert (=> d!71247 m!350605))

(declare-fun m!350607 () Bool)

(assert (=> b!351112 m!350607))

(assert (=> b!351006 d!71247))

(declare-fun d!71249 () Bool)

(assert (=> d!71249 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!35026 d!71249))

(declare-fun d!71251 () Bool)

(assert (=> d!71251 (= (array_inv!6646 _values!1525) (bvsge (size!9323 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!35026 d!71251))

(declare-fun d!71253 () Bool)

(assert (=> d!71253 (= (array_inv!6647 _keys!1895) (bvsge (size!9324 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!35026 d!71253))

(declare-fun d!71255 () Bool)

(assert (=> d!71255 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351002 d!71255))

(declare-fun d!71257 () Bool)

(declare-fun res!194741 () Bool)

(declare-fun e!215008 () Bool)

(assert (=> d!71257 (=> res!194741 e!215008)))

(assert (=> d!71257 (= res!194741 (= (select (arr!8971 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71257 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!215008)))

(declare-fun b!351117 () Bool)

(declare-fun e!215009 () Bool)

(assert (=> b!351117 (= e!215008 e!215009)))

(declare-fun res!194742 () Bool)

(assert (=> b!351117 (=> (not res!194742) (not e!215009))))

(assert (=> b!351117 (= res!194742 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9324 _keys!1895)))))

(declare-fun b!351118 () Bool)

(assert (=> b!351118 (= e!215009 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71257 (not res!194741)) b!351117))

(assert (= (and b!351117 res!194742) b!351118))

(assert (=> d!71257 m!350585))

(declare-fun m!350609 () Bool)

(assert (=> b!351118 m!350609))

(assert (=> b!351007 d!71257))

(declare-fun b!351127 () Bool)

(declare-fun e!215018 () Bool)

(declare-fun e!215016 () Bool)

(assert (=> b!351127 (= e!215018 e!215016)))

(declare-fun lt!164531 () (_ BitVec 64))

(assert (=> b!351127 (= lt!164531 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10847 0))(
  ( (Unit!10848) )
))
(declare-fun lt!164532 () Unit!10847)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18931 (_ BitVec 64) (_ BitVec 32)) Unit!10847)

(assert (=> b!351127 (= lt!164532 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164531 #b00000000000000000000000000000000))))

(assert (=> b!351127 (arrayContainsKey!0 _keys!1895 lt!164531 #b00000000000000000000000000000000)))

(declare-fun lt!164530 () Unit!10847)

(assert (=> b!351127 (= lt!164530 lt!164532)))

(declare-fun res!194747 () Bool)

(assert (=> b!351127 (= res!194747 (= (seekEntryOrOpen!0 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3454 #b00000000000000000000000000000000)))))

(assert (=> b!351127 (=> (not res!194747) (not e!215016))))

(declare-fun b!351128 () Bool)

(declare-fun call!26960 () Bool)

(assert (=> b!351128 (= e!215018 call!26960)))

(declare-fun b!351129 () Bool)

(assert (=> b!351129 (= e!215016 call!26960)))

(declare-fun d!71259 () Bool)

(declare-fun res!194748 () Bool)

(declare-fun e!215017 () Bool)

(assert (=> d!71259 (=> res!194748 e!215017)))

(assert (=> d!71259 (= res!194748 (bvsge #b00000000000000000000000000000000 (size!9324 _keys!1895)))))

(assert (=> d!71259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!215017)))

(declare-fun bm!26957 () Bool)

(assert (=> bm!26957 (= call!26960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!351130 () Bool)

(assert (=> b!351130 (= e!215017 e!215018)))

(declare-fun c!53363 () Bool)

(assert (=> b!351130 (= c!53363 (validKeyInArray!0 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!71259 (not res!194748)) b!351130))

(assert (= (and b!351130 c!53363) b!351127))

(assert (= (and b!351130 (not c!53363)) b!351128))

(assert (= (and b!351127 res!194747) b!351129))

(assert (= (or b!351129 b!351128) bm!26957))

(assert (=> b!351127 m!350585))

(declare-fun m!350611 () Bool)

(assert (=> b!351127 m!350611))

(declare-fun m!350613 () Bool)

(assert (=> b!351127 m!350613))

(assert (=> b!351127 m!350585))

(declare-fun m!350615 () Bool)

(assert (=> b!351127 m!350615))

(declare-fun m!350617 () Bool)

(assert (=> bm!26957 m!350617))

(assert (=> b!351130 m!350585))

(assert (=> b!351130 m!350585))

(assert (=> b!351130 m!350589))

(assert (=> b!351003 d!71259))

(declare-fun d!71261 () Bool)

(declare-fun e!215024 () Bool)

(assert (=> d!71261 e!215024))

(declare-fun res!194751 () Bool)

(assert (=> d!71261 (=> res!194751 e!215024)))

(declare-fun lt!164544 () Bool)

(assert (=> d!71261 (= res!194751 (not lt!164544))))

(declare-fun lt!164541 () Bool)

(assert (=> d!71261 (= lt!164544 lt!164541)))

(declare-fun lt!164543 () Unit!10847)

(declare-fun e!215023 () Unit!10847)

(assert (=> d!71261 (= lt!164543 e!215023)))

(declare-fun c!53366 () Bool)

(assert (=> d!71261 (= c!53366 lt!164541)))

(declare-fun containsKey!339 (List!5196 (_ BitVec 64)) Bool)

(assert (=> d!71261 (= lt!164541 (containsKey!339 (toList!2257 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71261 (= (contains!2337 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164544)))

(declare-fun b!351137 () Bool)

(declare-fun lt!164542 () Unit!10847)

(assert (=> b!351137 (= e!215023 lt!164542)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!288 (List!5196 (_ BitVec 64)) Unit!10847)

(assert (=> b!351137 (= lt!164542 (lemmaContainsKeyImpliesGetValueByKeyDefined!288 (toList!2257 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!353 0))(
  ( (Some!352 (v!6069 V!11219)) (None!351) )
))
(declare-fun isDefined!289 (Option!353) Bool)

(declare-fun getValueByKey!347 (List!5196 (_ BitVec 64)) Option!353)

(assert (=> b!351137 (isDefined!289 (getValueByKey!347 (toList!2257 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!351138 () Bool)

(declare-fun Unit!10849 () Unit!10847)

(assert (=> b!351138 (= e!215023 Unit!10849)))

(declare-fun b!351139 () Bool)

(assert (=> b!351139 (= e!215024 (isDefined!289 (getValueByKey!347 (toList!2257 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71261 c!53366) b!351137))

(assert (= (and d!71261 (not c!53366)) b!351138))

(assert (= (and d!71261 (not res!194751)) b!351139))

(declare-fun m!350619 () Bool)

(assert (=> d!71261 m!350619))

(declare-fun m!350621 () Bool)

(assert (=> b!351137 m!350621))

(declare-fun m!350623 () Bool)

(assert (=> b!351137 m!350623))

(assert (=> b!351137 m!350623))

(declare-fun m!350625 () Bool)

(assert (=> b!351137 m!350625))

(assert (=> b!351139 m!350623))

(assert (=> b!351139 m!350623))

(assert (=> b!351139 m!350625))

(assert (=> b!351004 d!71261))

(declare-fun b!351182 () Bool)

(declare-fun e!215063 () ListLongMap!4483)

(declare-fun e!215060 () ListLongMap!4483)

(assert (=> b!351182 (= e!215063 e!215060)))

(declare-fun c!53379 () Bool)

(assert (=> b!351182 (= c!53379 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!71263 () Bool)

(declare-fun e!215059 () Bool)

(assert (=> d!71263 e!215059))

(declare-fun res!194774 () Bool)

(assert (=> d!71263 (=> (not res!194774) (not e!215059))))

(assert (=> d!71263 (= res!194774 (or (bvsge #b00000000000000000000000000000000 (size!9324 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9324 _keys!1895)))))))

(declare-fun lt!164597 () ListLongMap!4483)

(declare-fun lt!164608 () ListLongMap!4483)

(assert (=> d!71263 (= lt!164597 lt!164608)))

(declare-fun lt!164606 () Unit!10847)

(declare-fun e!215053 () Unit!10847)

(assert (=> d!71263 (= lt!164606 e!215053)))

(declare-fun c!53384 () Bool)

(declare-fun e!215056 () Bool)

(assert (=> d!71263 (= c!53384 e!215056)))

(declare-fun res!194777 () Bool)

(assert (=> d!71263 (=> (not res!194777) (not e!215056))))

(assert (=> d!71263 (= res!194777 (bvslt #b00000000000000000000000000000000 (size!9324 _keys!1895)))))

(assert (=> d!71263 (= lt!164608 e!215063)))

(declare-fun c!53382 () Bool)

(assert (=> d!71263 (= c!53382 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71263 (validMask!0 mask!2385)))

(assert (=> d!71263 (= (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164597)))

(declare-fun b!351183 () Bool)

(declare-fun c!53381 () Bool)

(assert (=> b!351183 (= c!53381 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!215062 () ListLongMap!4483)

(assert (=> b!351183 (= e!215060 e!215062)))

(declare-fun b!351184 () Bool)

(declare-fun e!215057 () Bool)

(declare-fun e!215052 () Bool)

(assert (=> b!351184 (= e!215057 e!215052)))

(declare-fun res!194770 () Bool)

(assert (=> b!351184 (=> (not res!194770) (not e!215052))))

(assert (=> b!351184 (= res!194770 (contains!2337 lt!164597 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!351184 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9324 _keys!1895)))))

(declare-fun b!351185 () Bool)

(declare-fun e!215051 () Bool)

(declare-fun apply!291 (ListLongMap!4483 (_ BitVec 64)) V!11219)

(assert (=> b!351185 (= e!215051 (= (apply!291 lt!164597 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!351186 () Bool)

(declare-fun e!215058 () Bool)

(assert (=> b!351186 (= e!215058 e!215051)))

(declare-fun res!194771 () Bool)

(declare-fun call!26979 () Bool)

(assert (=> b!351186 (= res!194771 call!26979)))

(assert (=> b!351186 (=> (not res!194771) (not e!215051))))

(declare-fun b!351187 () Bool)

(declare-fun call!26981 () ListLongMap!4483)

(assert (=> b!351187 (= e!215060 call!26981)))

(declare-fun b!351188 () Bool)

(assert (=> b!351188 (= e!215062 call!26981)))

(declare-fun b!351189 () Bool)

(declare-fun Unit!10850 () Unit!10847)

(assert (=> b!351189 (= e!215053 Unit!10850)))

(declare-fun b!351190 () Bool)

(declare-fun get!4791 (ValueCell!3497 V!11219) V!11219)

(declare-fun dynLambda!625 (Int (_ BitVec 64)) V!11219)

(assert (=> b!351190 (= e!215052 (= (apply!291 lt!164597 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)) (get!4791 (select (arr!8970 _values!1525) #b00000000000000000000000000000000) (dynLambda!625 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!351190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9323 _values!1525)))))

(assert (=> b!351190 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9324 _keys!1895)))))

(declare-fun b!351191 () Bool)

(declare-fun e!215061 () Bool)

(assert (=> b!351191 (= e!215061 (validKeyInArray!0 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26972 () Bool)

(declare-fun call!26977 () ListLongMap!4483)

(declare-fun call!26980 () ListLongMap!4483)

(assert (=> bm!26972 (= call!26977 call!26980)))

(declare-fun bm!26973 () Bool)

(declare-fun call!26976 () ListLongMap!4483)

(assert (=> bm!26973 (= call!26980 call!26976)))

(declare-fun b!351192 () Bool)

(declare-fun e!215054 () Bool)

(assert (=> b!351192 (= e!215054 (= (apply!291 lt!164597 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun bm!26974 () Bool)

(declare-fun call!26978 () Bool)

(assert (=> bm!26974 (= call!26978 (contains!2337 lt!164597 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351193 () Bool)

(declare-fun res!194778 () Bool)

(assert (=> b!351193 (=> (not res!194778) (not e!215059))))

(assert (=> b!351193 (= res!194778 e!215057)))

(declare-fun res!194772 () Bool)

(assert (=> b!351193 (=> res!194772 e!215057)))

(assert (=> b!351193 (= res!194772 (not e!215061))))

(declare-fun res!194773 () Bool)

(assert (=> b!351193 (=> (not res!194773) (not e!215061))))

(assert (=> b!351193 (= res!194773 (bvslt #b00000000000000000000000000000000 (size!9324 _keys!1895)))))

(declare-fun bm!26975 () Bool)

(declare-fun call!26975 () ListLongMap!4483)

(declare-fun +!744 (ListLongMap!4483 tuple2!5580) ListLongMap!4483)

(assert (=> bm!26975 (= call!26975 (+!744 (ite c!53382 call!26976 (ite c!53379 call!26980 call!26977)) (ite (or c!53382 c!53379) (tuple2!5581 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!351194 () Bool)

(declare-fun e!215055 () Bool)

(assert (=> b!351194 (= e!215055 (not call!26978))))

(declare-fun bm!26976 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!607 (array!18931 array!18929 (_ BitVec 32) (_ BitVec 32) V!11219 V!11219 (_ BitVec 32) Int) ListLongMap!4483)

(assert (=> bm!26976 (= call!26976 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26977 () Bool)

(assert (=> bm!26977 (= call!26981 call!26975)))

(declare-fun b!351195 () Bool)

(assert (=> b!351195 (= e!215056 (validKeyInArray!0 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!351196 () Bool)

(declare-fun res!194775 () Bool)

(assert (=> b!351196 (=> (not res!194775) (not e!215059))))

(assert (=> b!351196 (= res!194775 e!215058)))

(declare-fun c!53380 () Bool)

(assert (=> b!351196 (= c!53380 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!351197 () Bool)

(assert (=> b!351197 (= e!215063 (+!744 call!26975 (tuple2!5581 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!351198 () Bool)

(assert (=> b!351198 (= e!215058 (not call!26979))))

(declare-fun b!351199 () Bool)

(declare-fun lt!164593 () Unit!10847)

(assert (=> b!351199 (= e!215053 lt!164593)))

(declare-fun lt!164594 () ListLongMap!4483)

(assert (=> b!351199 (= lt!164594 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164591 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164591 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164601 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164601 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164590 () Unit!10847)

(declare-fun addStillContains!267 (ListLongMap!4483 (_ BitVec 64) V!11219 (_ BitVec 64)) Unit!10847)

(assert (=> b!351199 (= lt!164590 (addStillContains!267 lt!164594 lt!164591 zeroValue!1467 lt!164601))))

(assert (=> b!351199 (contains!2337 (+!744 lt!164594 (tuple2!5581 lt!164591 zeroValue!1467)) lt!164601)))

(declare-fun lt!164605 () Unit!10847)

(assert (=> b!351199 (= lt!164605 lt!164590)))

(declare-fun lt!164603 () ListLongMap!4483)

(assert (=> b!351199 (= lt!164603 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164600 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164600 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164607 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164607 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164602 () Unit!10847)

(declare-fun addApplyDifferent!267 (ListLongMap!4483 (_ BitVec 64) V!11219 (_ BitVec 64)) Unit!10847)

(assert (=> b!351199 (= lt!164602 (addApplyDifferent!267 lt!164603 lt!164600 minValue!1467 lt!164607))))

(assert (=> b!351199 (= (apply!291 (+!744 lt!164603 (tuple2!5581 lt!164600 minValue!1467)) lt!164607) (apply!291 lt!164603 lt!164607))))

(declare-fun lt!164596 () Unit!10847)

(assert (=> b!351199 (= lt!164596 lt!164602)))

(declare-fun lt!164599 () ListLongMap!4483)

(assert (=> b!351199 (= lt!164599 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164595 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164592 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164592 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164589 () Unit!10847)

(assert (=> b!351199 (= lt!164589 (addApplyDifferent!267 lt!164599 lt!164595 zeroValue!1467 lt!164592))))

(assert (=> b!351199 (= (apply!291 (+!744 lt!164599 (tuple2!5581 lt!164595 zeroValue!1467)) lt!164592) (apply!291 lt!164599 lt!164592))))

(declare-fun lt!164609 () Unit!10847)

(assert (=> b!351199 (= lt!164609 lt!164589)))

(declare-fun lt!164610 () ListLongMap!4483)

(assert (=> b!351199 (= lt!164610 (getCurrentListMapNoExtraKeys!607 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164598 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164598 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164604 () (_ BitVec 64))

(assert (=> b!351199 (= lt!164604 (select (arr!8971 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!351199 (= lt!164593 (addApplyDifferent!267 lt!164610 lt!164598 minValue!1467 lt!164604))))

(assert (=> b!351199 (= (apply!291 (+!744 lt!164610 (tuple2!5581 lt!164598 minValue!1467)) lt!164604) (apply!291 lt!164610 lt!164604))))

(declare-fun b!351200 () Bool)

(assert (=> b!351200 (= e!215059 e!215055)))

(declare-fun c!53383 () Bool)

(assert (=> b!351200 (= c!53383 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!351201 () Bool)

(assert (=> b!351201 (= e!215062 call!26977)))

(declare-fun bm!26978 () Bool)

(assert (=> bm!26978 (= call!26979 (contains!2337 lt!164597 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!351202 () Bool)

(assert (=> b!351202 (= e!215055 e!215054)))

(declare-fun res!194776 () Bool)

(assert (=> b!351202 (= res!194776 call!26978)))

(assert (=> b!351202 (=> (not res!194776) (not e!215054))))

(assert (= (and d!71263 c!53382) b!351197))

(assert (= (and d!71263 (not c!53382)) b!351182))

(assert (= (and b!351182 c!53379) b!351187))

(assert (= (and b!351182 (not c!53379)) b!351183))

(assert (= (and b!351183 c!53381) b!351188))

(assert (= (and b!351183 (not c!53381)) b!351201))

(assert (= (or b!351188 b!351201) bm!26972))

(assert (= (or b!351187 bm!26972) bm!26973))

(assert (= (or b!351187 b!351188) bm!26977))

(assert (= (or b!351197 bm!26973) bm!26976))

(assert (= (or b!351197 bm!26977) bm!26975))

(assert (= (and d!71263 res!194777) b!351195))

(assert (= (and d!71263 c!53384) b!351199))

(assert (= (and d!71263 (not c!53384)) b!351189))

(assert (= (and d!71263 res!194774) b!351193))

(assert (= (and b!351193 res!194773) b!351191))

(assert (= (and b!351193 (not res!194772)) b!351184))

(assert (= (and b!351184 res!194770) b!351190))

(assert (= (and b!351193 res!194778) b!351196))

(assert (= (and b!351196 c!53380) b!351186))

(assert (= (and b!351196 (not c!53380)) b!351198))

(assert (= (and b!351186 res!194771) b!351185))

(assert (= (or b!351186 b!351198) bm!26978))

(assert (= (and b!351196 res!194775) b!351200))

(assert (= (and b!351200 c!53383) b!351202))

(assert (= (and b!351200 (not c!53383)) b!351194))

(assert (= (and b!351202 res!194776) b!351192))

(assert (= (or b!351202 b!351194) bm!26974))

(declare-fun b_lambda!8485 () Bool)

(assert (=> (not b_lambda!8485) (not b!351190)))

(declare-fun t!10329 () Bool)

(declare-fun tb!3089 () Bool)

(assert (=> (and start!35026 (= defaultEntry!1528 defaultEntry!1528) t!10329) tb!3089))

(declare-fun result!5613 () Bool)

(assert (=> tb!3089 (= result!5613 tp_is_empty!7681)))

(assert (=> b!351190 t!10329))

(declare-fun b_and!14939 () Bool)

(assert (= b_and!14933 (and (=> t!10329 result!5613) b_and!14939)))

(declare-fun m!350627 () Bool)

(assert (=> b!351190 m!350627))

(assert (=> b!351190 m!350585))

(declare-fun m!350629 () Bool)

(assert (=> b!351190 m!350629))

(assert (=> b!351190 m!350585))

(declare-fun m!350631 () Bool)

(assert (=> b!351190 m!350631))

(assert (=> b!351190 m!350631))

(assert (=> b!351190 m!350627))

(declare-fun m!350633 () Bool)

(assert (=> b!351190 m!350633))

(declare-fun m!350635 () Bool)

(assert (=> b!351185 m!350635))

(declare-fun m!350637 () Bool)

(assert (=> bm!26974 m!350637))

(assert (=> d!71263 m!350517))

(declare-fun m!350639 () Bool)

(assert (=> bm!26976 m!350639))

(declare-fun m!350641 () Bool)

(assert (=> b!351192 m!350641))

(declare-fun m!350643 () Bool)

(assert (=> bm!26975 m!350643))

(declare-fun m!350645 () Bool)

(assert (=> b!351197 m!350645))

(assert (=> b!351184 m!350585))

(assert (=> b!351184 m!350585))

(declare-fun m!350647 () Bool)

(assert (=> b!351184 m!350647))

(declare-fun m!350649 () Bool)

(assert (=> bm!26978 m!350649))

(declare-fun m!350651 () Bool)

(assert (=> b!351199 m!350651))

(declare-fun m!350653 () Bool)

(assert (=> b!351199 m!350653))

(assert (=> b!351199 m!350639))

(assert (=> b!351199 m!350653))

(declare-fun m!350655 () Bool)

(assert (=> b!351199 m!350655))

(declare-fun m!350657 () Bool)

(assert (=> b!351199 m!350657))

(declare-fun m!350659 () Bool)

(assert (=> b!351199 m!350659))

(declare-fun m!350661 () Bool)

(assert (=> b!351199 m!350661))

(declare-fun m!350663 () Bool)

(assert (=> b!351199 m!350663))

(declare-fun m!350665 () Bool)

(assert (=> b!351199 m!350665))

(declare-fun m!350667 () Bool)

(assert (=> b!351199 m!350667))

(declare-fun m!350669 () Bool)

(assert (=> b!351199 m!350669))

(declare-fun m!350671 () Bool)

(assert (=> b!351199 m!350671))

(declare-fun m!350673 () Bool)

(assert (=> b!351199 m!350673))

(assert (=> b!351199 m!350667))

(assert (=> b!351199 m!350671))

(declare-fun m!350675 () Bool)

(assert (=> b!351199 m!350675))

(assert (=> b!351199 m!350585))

(declare-fun m!350677 () Bool)

(assert (=> b!351199 m!350677))

(assert (=> b!351199 m!350657))

(declare-fun m!350679 () Bool)

(assert (=> b!351199 m!350679))

(assert (=> b!351191 m!350585))

(assert (=> b!351191 m!350585))

(assert (=> b!351191 m!350589))

(assert (=> b!351195 m!350585))

(assert (=> b!351195 m!350585))

(assert (=> b!351195 m!350589))

(assert (=> b!351004 d!71263))

(declare-fun condMapEmpty!13002 () Bool)

(declare-fun mapDefault!13002 () ValueCell!3497)

(assert (=> mapNonEmpty!12993 (= condMapEmpty!13002 (= mapRest!12993 ((as const (Array (_ BitVec 32) ValueCell!3497)) mapDefault!13002)))))

(declare-fun e!215068 () Bool)

(declare-fun mapRes!13002 () Bool)

(assert (=> mapNonEmpty!12993 (= tp!26766 (and e!215068 mapRes!13002))))

(declare-fun mapNonEmpty!13002 () Bool)

(declare-fun tp!26781 () Bool)

(declare-fun e!215069 () Bool)

(assert (=> mapNonEmpty!13002 (= mapRes!13002 (and tp!26781 e!215069))))

(declare-fun mapRest!13002 () (Array (_ BitVec 32) ValueCell!3497))

(declare-fun mapKey!13002 () (_ BitVec 32))

(declare-fun mapValue!13002 () ValueCell!3497)

(assert (=> mapNonEmpty!13002 (= mapRest!12993 (store mapRest!13002 mapKey!13002 mapValue!13002))))

(declare-fun b!351212 () Bool)

(assert (=> b!351212 (= e!215068 tp_is_empty!7681)))

(declare-fun b!351211 () Bool)

(assert (=> b!351211 (= e!215069 tp_is_empty!7681)))

(declare-fun mapIsEmpty!13002 () Bool)

(assert (=> mapIsEmpty!13002 mapRes!13002))

(assert (= (and mapNonEmpty!12993 condMapEmpty!13002) mapIsEmpty!13002))

(assert (= (and mapNonEmpty!12993 (not condMapEmpty!13002)) mapNonEmpty!13002))

(assert (= (and mapNonEmpty!13002 ((_ is ValueCellFull!3497) mapValue!13002)) b!351211))

(assert (= (and mapNonEmpty!12993 ((_ is ValueCellFull!3497) mapDefault!13002)) b!351212))

(declare-fun m!350681 () Bool)

(assert (=> mapNonEmpty!13002 m!350681))

(declare-fun b_lambda!8487 () Bool)

(assert (= b_lambda!8485 (or (and start!35026 b_free!7729) b_lambda!8487)))

(check-sat (not b_lambda!8487) (not b!351199) (not d!71263) (not bm!26957) (not b!351191) (not bm!26975) (not b!351137) (not b!351094) (not b!351130) (not bm!26954) (not b!351127) (not b!351190) (not bm!26976) (not b!351112) (not b!351139) (not b_next!7729) (not b!351079) (not bm!26978) (not d!71247) (not b!351192) (not b!351118) (not b!351197) (not d!71261) tp_is_empty!7681 (not b!351195) (not b!351091) (not mapNonEmpty!13002) (not b!351092) (not b!351185) b_and!14939 (not b!351184) (not bm!26974))
(check-sat b_and!14939 (not b_next!7729))
