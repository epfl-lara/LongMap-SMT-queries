; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33924 () Bool)

(assert start!33924)

(declare-fun b_free!7093 () Bool)

(declare-fun b_next!7093 () Bool)

(assert (=> start!33924 (= b_free!7093 (not b_next!7093))))

(declare-fun tp!24795 () Bool)

(declare-fun b_and!14295 () Bool)

(assert (=> start!33924 (= tp!24795 b_and!14295)))

(declare-fun b!337960 () Bool)

(declare-fun res!186731 () Bool)

(declare-fun e!207371 () Bool)

(assert (=> b!337960 (=> (not res!186731) (not e!207371))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10371 0))(
  ( (V!10372 (val!3567 Int)) )
))
(declare-datatypes ((ValueCell!3179 0))(
  ( (ValueCellFull!3179 (v!5734 V!10371)) (EmptyCell!3179) )
))
(declare-datatypes ((array!17668 0))(
  ( (array!17669 (arr!8360 (Array (_ BitVec 32) ValueCell!3179)) (size!8712 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17668)

(declare-datatypes ((array!17670 0))(
  ( (array!17671 (arr!8361 (Array (_ BitVec 32) (_ BitVec 64))) (size!8713 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17670)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!337960 (= res!186731 (and (= (size!8712 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8713 _keys!1895) (size!8712 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!11976 () Bool)

(declare-fun mapRes!11976 () Bool)

(declare-fun tp!24794 () Bool)

(declare-fun e!207367 () Bool)

(assert (=> mapNonEmpty!11976 (= mapRes!11976 (and tp!24794 e!207367))))

(declare-fun mapRest!11976 () (Array (_ BitVec 32) ValueCell!3179))

(declare-fun mapKey!11976 () (_ BitVec 32))

(declare-fun mapValue!11976 () ValueCell!3179)

(assert (=> mapNonEmpty!11976 (= (arr!8360 _values!1525) (store mapRest!11976 mapKey!11976 mapValue!11976))))

(declare-fun b!337961 () Bool)

(declare-fun res!186727 () Bool)

(assert (=> b!337961 (=> (not res!186727) (not e!207371))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10371)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10371)

(declare-datatypes ((tuple2!5092 0))(
  ( (tuple2!5093 (_1!2557 (_ BitVec 64)) (_2!2557 V!10371)) )
))
(declare-datatypes ((List!4702 0))(
  ( (Nil!4699) (Cons!4698 (h!5554 tuple2!5092) (t!9790 List!4702)) )
))
(declare-datatypes ((ListLongMap!4007 0))(
  ( (ListLongMap!4008 (toList!2019 List!4702)) )
))
(declare-fun contains!2086 (ListLongMap!4007 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1548 (array!17670 array!17668 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 32) Int) ListLongMap!4007)

(assert (=> b!337961 (= res!186727 (not (contains!2086 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!337962 () Bool)

(declare-fun e!207365 () Bool)

(declare-fun e!207369 () Bool)

(assert (=> b!337962 (= e!207365 (and e!207369 mapRes!11976))))

(declare-fun condMapEmpty!11976 () Bool)

(declare-fun mapDefault!11976 () ValueCell!3179)

(assert (=> b!337962 (= condMapEmpty!11976 (= (arr!8360 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3179)) mapDefault!11976)))))

(declare-fun b!337964 () Bool)

(declare-fun e!207366 () Bool)

(assert (=> b!337964 (= e!207366 (and (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)) (bvsge (size!8713 _keys!1895) #b01111111111111111111111111111111)))))

(declare-datatypes ((Unit!10454 0))(
  ( (Unit!10455) )
))
(declare-fun lt!160649 () Unit!10454)

(declare-fun e!207368 () Unit!10454)

(assert (=> b!337964 (= lt!160649 e!207368)))

(declare-fun c!52337 () Bool)

(declare-fun arrayContainsKey!0 (array!17670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!337964 (= c!52337 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!11976 () Bool)

(assert (=> mapIsEmpty!11976 mapRes!11976))

(declare-fun b!337965 () Bool)

(declare-fun tp_is_empty!7045 () Bool)

(assert (=> b!337965 (= e!207369 tp_is_empty!7045)))

(declare-fun b!337966 () Bool)

(declare-fun res!186726 () Bool)

(assert (=> b!337966 (=> (not res!186726) (not e!207371))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!337966 (= res!186726 (validKeyInArray!0 k0!1348))))

(declare-fun b!337967 () Bool)

(declare-fun Unit!10456 () Unit!10454)

(assert (=> b!337967 (= e!207368 Unit!10456)))

(declare-fun b!337968 () Bool)

(assert (=> b!337968 (= e!207367 tp_is_empty!7045)))

(declare-fun b!337969 () Bool)

(assert (=> b!337969 (= e!207371 e!207366)))

(declare-fun res!186729 () Bool)

(assert (=> b!337969 (=> (not res!186729) (not e!207366))))

(declare-datatypes ((SeekEntryResult!3190 0))(
  ( (MissingZero!3190 (index!14939 (_ BitVec 32))) (Found!3190 (index!14940 (_ BitVec 32))) (Intermediate!3190 (undefined!4002 Bool) (index!14941 (_ BitVec 32)) (x!33641 (_ BitVec 32))) (Undefined!3190) (MissingVacant!3190 (index!14942 (_ BitVec 32))) )
))
(declare-fun lt!160650 () SeekEntryResult!3190)

(get-info :version)

(assert (=> b!337969 (= res!186729 (and (not ((_ is Found!3190) lt!160650)) ((_ is MissingZero!3190) lt!160650)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17670 (_ BitVec 32)) SeekEntryResult!3190)

(assert (=> b!337969 (= lt!160650 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!337970 () Bool)

(declare-fun Unit!10457 () Unit!10454)

(assert (=> b!337970 (= e!207368 Unit!10457)))

(declare-fun lt!160651 () Unit!10454)

(declare-fun lemmaArrayContainsKeyThenInListMap!275 (array!17670 array!17668 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 64) (_ BitVec 32) Int) Unit!10454)

(declare-fun arrayScanForKey!0 (array!17670 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!337970 (= lt!160651 (lemmaArrayContainsKeyThenInListMap!275 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!337970 false))

(declare-fun b!337971 () Bool)

(declare-fun res!186728 () Bool)

(assert (=> b!337971 (=> (not res!186728) (not e!207371))))

(declare-datatypes ((List!4703 0))(
  ( (Nil!4700) (Cons!4699 (h!5555 (_ BitVec 64)) (t!9791 List!4703)) )
))
(declare-fun arrayNoDuplicates!0 (array!17670 (_ BitVec 32) List!4703) Bool)

(assert (=> b!337971 (= res!186728 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4700))))

(declare-fun b!337963 () Bool)

(declare-fun res!186725 () Bool)

(assert (=> b!337963 (=> (not res!186725) (not e!207371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17670 (_ BitVec 32)) Bool)

(assert (=> b!337963 (= res!186725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!186730 () Bool)

(assert (=> start!33924 (=> (not res!186730) (not e!207371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33924 (= res!186730 (validMask!0 mask!2385))))

(assert (=> start!33924 e!207371))

(assert (=> start!33924 true))

(assert (=> start!33924 tp_is_empty!7045))

(assert (=> start!33924 tp!24795))

(declare-fun array_inv!6212 (array!17668) Bool)

(assert (=> start!33924 (and (array_inv!6212 _values!1525) e!207365)))

(declare-fun array_inv!6213 (array!17670) Bool)

(assert (=> start!33924 (array_inv!6213 _keys!1895)))

(assert (= (and start!33924 res!186730) b!337960))

(assert (= (and b!337960 res!186731) b!337963))

(assert (= (and b!337963 res!186725) b!337971))

(assert (= (and b!337971 res!186728) b!337966))

(assert (= (and b!337966 res!186726) b!337961))

(assert (= (and b!337961 res!186727) b!337969))

(assert (= (and b!337969 res!186729) b!337964))

(assert (= (and b!337964 c!52337) b!337970))

(assert (= (and b!337964 (not c!52337)) b!337967))

(assert (= (and b!337962 condMapEmpty!11976) mapIsEmpty!11976))

(assert (= (and b!337962 (not condMapEmpty!11976)) mapNonEmpty!11976))

(assert (= (and mapNonEmpty!11976 ((_ is ValueCellFull!3179) mapValue!11976)) b!337968))

(assert (= (and b!337962 ((_ is ValueCellFull!3179) mapDefault!11976)) b!337965))

(assert (= start!33924 b!337962))

(declare-fun m!341605 () Bool)

(assert (=> b!337969 m!341605))

(declare-fun m!341607 () Bool)

(assert (=> start!33924 m!341607))

(declare-fun m!341609 () Bool)

(assert (=> start!33924 m!341609))

(declare-fun m!341611 () Bool)

(assert (=> start!33924 m!341611))

(declare-fun m!341613 () Bool)

(assert (=> b!337963 m!341613))

(declare-fun m!341615 () Bool)

(assert (=> mapNonEmpty!11976 m!341615))

(declare-fun m!341617 () Bool)

(assert (=> b!337966 m!341617))

(declare-fun m!341619 () Bool)

(assert (=> b!337964 m!341619))

(declare-fun m!341621 () Bool)

(assert (=> b!337970 m!341621))

(assert (=> b!337970 m!341621))

(declare-fun m!341623 () Bool)

(assert (=> b!337970 m!341623))

(declare-fun m!341625 () Bool)

(assert (=> b!337971 m!341625))

(declare-fun m!341627 () Bool)

(assert (=> b!337961 m!341627))

(assert (=> b!337961 m!341627))

(declare-fun m!341629 () Bool)

(assert (=> b!337961 m!341629))

(check-sat (not b!337966) (not mapNonEmpty!11976) (not b!337969) b_and!14295 (not b!337971) (not b!337961) (not b!337964) (not b_next!7093) (not start!33924) (not b!337963) (not b!337970) tp_is_empty!7045)
(check-sat b_and!14295 (not b_next!7093))
(get-model)

(declare-fun d!70795 () Bool)

(assert (=> d!70795 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!33924 d!70795))

(declare-fun d!70797 () Bool)

(assert (=> d!70797 (= (array_inv!6212 _values!1525) (bvsge (size!8712 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!33924 d!70797))

(declare-fun d!70799 () Bool)

(assert (=> d!70799 (= (array_inv!6213 _keys!1895) (bvsge (size!8713 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!33924 d!70799))

(declare-fun d!70801 () Bool)

(assert (=> d!70801 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!337966 d!70801))

(declare-fun d!70803 () Bool)

(declare-fun res!186778 () Bool)

(declare-fun e!207421 () Bool)

(assert (=> d!70803 (=> res!186778 e!207421)))

(assert (=> d!70803 (= res!186778 (bvsge #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (=> d!70803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!207421)))

(declare-fun b!338052 () Bool)

(declare-fun e!207420 () Bool)

(declare-fun call!26393 () Bool)

(assert (=> b!338052 (= e!207420 call!26393)))

(declare-fun b!338053 () Bool)

(assert (=> b!338053 (= e!207421 e!207420)))

(declare-fun c!52346 () Bool)

(assert (=> b!338053 (= c!52346 (validKeyInArray!0 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338054 () Bool)

(declare-fun e!207422 () Bool)

(assert (=> b!338054 (= e!207420 e!207422)))

(declare-fun lt!160676 () (_ BitVec 64))

(assert (=> b!338054 (= lt!160676 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160678 () Unit!10454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17670 (_ BitVec 64) (_ BitVec 32)) Unit!10454)

(assert (=> b!338054 (= lt!160678 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!160676 #b00000000000000000000000000000000))))

(assert (=> b!338054 (arrayContainsKey!0 _keys!1895 lt!160676 #b00000000000000000000000000000000)))

(declare-fun lt!160677 () Unit!10454)

(assert (=> b!338054 (= lt!160677 lt!160678)))

(declare-fun res!186779 () Bool)

(assert (=> b!338054 (= res!186779 (= (seekEntryOrOpen!0 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3190 #b00000000000000000000000000000000)))))

(assert (=> b!338054 (=> (not res!186779) (not e!207422))))

(declare-fun bm!26390 () Bool)

(assert (=> bm!26390 (= call!26393 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!338055 () Bool)

(assert (=> b!338055 (= e!207422 call!26393)))

(assert (= (and d!70803 (not res!186778)) b!338053))

(assert (= (and b!338053 c!52346) b!338054))

(assert (= (and b!338053 (not c!52346)) b!338052))

(assert (= (and b!338054 res!186779) b!338055))

(assert (= (or b!338055 b!338052) bm!26390))

(declare-fun m!341683 () Bool)

(assert (=> b!338053 m!341683))

(assert (=> b!338053 m!341683))

(declare-fun m!341685 () Bool)

(assert (=> b!338053 m!341685))

(assert (=> b!338054 m!341683))

(declare-fun m!341687 () Bool)

(assert (=> b!338054 m!341687))

(declare-fun m!341689 () Bool)

(assert (=> b!338054 m!341689))

(assert (=> b!338054 m!341683))

(declare-fun m!341691 () Bool)

(assert (=> b!338054 m!341691))

(declare-fun m!341693 () Bool)

(assert (=> bm!26390 m!341693))

(assert (=> b!337963 d!70803))

(declare-fun d!70805 () Bool)

(declare-fun res!186784 () Bool)

(declare-fun e!207427 () Bool)

(assert (=> d!70805 (=> res!186784 e!207427)))

(assert (=> d!70805 (= res!186784 (= (select (arr!8361 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70805 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!207427)))

(declare-fun b!338060 () Bool)

(declare-fun e!207428 () Bool)

(assert (=> b!338060 (= e!207427 e!207428)))

(declare-fun res!186785 () Bool)

(assert (=> b!338060 (=> (not res!186785) (not e!207428))))

(assert (=> b!338060 (= res!186785 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8713 _keys!1895)))))

(declare-fun b!338061 () Bool)

(assert (=> b!338061 (= e!207428 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70805 (not res!186784)) b!338060))

(assert (= (and b!338060 res!186785) b!338061))

(assert (=> d!70805 m!341683))

(declare-fun m!341695 () Bool)

(assert (=> b!338061 m!341695))

(assert (=> b!337964 d!70805))

(declare-fun b!338074 () Bool)

(declare-fun e!207436 () SeekEntryResult!3190)

(declare-fun lt!160687 () SeekEntryResult!3190)

(assert (=> b!338074 (= e!207436 (Found!3190 (index!14941 lt!160687)))))

(declare-fun b!338075 () Bool)

(declare-fun e!207437 () SeekEntryResult!3190)

(assert (=> b!338075 (= e!207437 e!207436)))

(declare-fun lt!160685 () (_ BitVec 64))

(assert (=> b!338075 (= lt!160685 (select (arr!8361 _keys!1895) (index!14941 lt!160687)))))

(declare-fun c!52353 () Bool)

(assert (=> b!338075 (= c!52353 (= lt!160685 k0!1348))))

(declare-fun b!338076 () Bool)

(declare-fun e!207435 () SeekEntryResult!3190)

(assert (=> b!338076 (= e!207435 (MissingZero!3190 (index!14941 lt!160687)))))

(declare-fun d!70807 () Bool)

(declare-fun lt!160686 () SeekEntryResult!3190)

(assert (=> d!70807 (and (or ((_ is Undefined!3190) lt!160686) (not ((_ is Found!3190) lt!160686)) (and (bvsge (index!14940 lt!160686) #b00000000000000000000000000000000) (bvslt (index!14940 lt!160686) (size!8713 _keys!1895)))) (or ((_ is Undefined!3190) lt!160686) ((_ is Found!3190) lt!160686) (not ((_ is MissingZero!3190) lt!160686)) (and (bvsge (index!14939 lt!160686) #b00000000000000000000000000000000) (bvslt (index!14939 lt!160686) (size!8713 _keys!1895)))) (or ((_ is Undefined!3190) lt!160686) ((_ is Found!3190) lt!160686) ((_ is MissingZero!3190) lt!160686) (not ((_ is MissingVacant!3190) lt!160686)) (and (bvsge (index!14942 lt!160686) #b00000000000000000000000000000000) (bvslt (index!14942 lt!160686) (size!8713 _keys!1895)))) (or ((_ is Undefined!3190) lt!160686) (ite ((_ is Found!3190) lt!160686) (= (select (arr!8361 _keys!1895) (index!14940 lt!160686)) k0!1348) (ite ((_ is MissingZero!3190) lt!160686) (= (select (arr!8361 _keys!1895) (index!14939 lt!160686)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3190) lt!160686) (= (select (arr!8361 _keys!1895) (index!14942 lt!160686)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70807 (= lt!160686 e!207437)))

(declare-fun c!52354 () Bool)

(assert (=> d!70807 (= c!52354 (and ((_ is Intermediate!3190) lt!160687) (undefined!4002 lt!160687)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17670 (_ BitVec 32)) SeekEntryResult!3190)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70807 (= lt!160687 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70807 (validMask!0 mask!2385)))

(assert (=> d!70807 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!160686)))

(declare-fun b!338077 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17670 (_ BitVec 32)) SeekEntryResult!3190)

(assert (=> b!338077 (= e!207435 (seekKeyOrZeroReturnVacant!0 (x!33641 lt!160687) (index!14941 lt!160687) (index!14941 lt!160687) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!338078 () Bool)

(assert (=> b!338078 (= e!207437 Undefined!3190)))

(declare-fun b!338079 () Bool)

(declare-fun c!52355 () Bool)

(assert (=> b!338079 (= c!52355 (= lt!160685 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!338079 (= e!207436 e!207435)))

(assert (= (and d!70807 c!52354) b!338078))

(assert (= (and d!70807 (not c!52354)) b!338075))

(assert (= (and b!338075 c!52353) b!338074))

(assert (= (and b!338075 (not c!52353)) b!338079))

(assert (= (and b!338079 c!52355) b!338076))

(assert (= (and b!338079 (not c!52355)) b!338077))

(declare-fun m!341697 () Bool)

(assert (=> b!338075 m!341697))

(declare-fun m!341699 () Bool)

(assert (=> d!70807 m!341699))

(declare-fun m!341701 () Bool)

(assert (=> d!70807 m!341701))

(declare-fun m!341703 () Bool)

(assert (=> d!70807 m!341703))

(assert (=> d!70807 m!341607))

(assert (=> d!70807 m!341703))

(declare-fun m!341705 () Bool)

(assert (=> d!70807 m!341705))

(declare-fun m!341707 () Bool)

(assert (=> d!70807 m!341707))

(declare-fun m!341709 () Bool)

(assert (=> b!338077 m!341709))

(assert (=> b!337969 d!70807))

(declare-fun d!70809 () Bool)

(assert (=> d!70809 (contains!2086 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!160690 () Unit!10454)

(declare-fun choose!1306 (array!17670 array!17668 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 64) (_ BitVec 32) Int) Unit!10454)

(assert (=> d!70809 (= lt!160690 (choose!1306 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70809 (validMask!0 mask!2385)))

(assert (=> d!70809 (= (lemmaArrayContainsKeyThenInListMap!275 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!160690)))

(declare-fun bs!11659 () Bool)

(assert (= bs!11659 d!70809))

(assert (=> bs!11659 m!341627))

(assert (=> bs!11659 m!341627))

(assert (=> bs!11659 m!341629))

(assert (=> bs!11659 m!341621))

(declare-fun m!341711 () Bool)

(assert (=> bs!11659 m!341711))

(assert (=> bs!11659 m!341607))

(assert (=> b!337970 d!70809))

(declare-fun d!70811 () Bool)

(declare-fun lt!160693 () (_ BitVec 32))

(assert (=> d!70811 (and (or (bvslt lt!160693 #b00000000000000000000000000000000) (bvsge lt!160693 (size!8713 _keys!1895)) (and (bvsge lt!160693 #b00000000000000000000000000000000) (bvslt lt!160693 (size!8713 _keys!1895)))) (bvsge lt!160693 #b00000000000000000000000000000000) (bvslt lt!160693 (size!8713 _keys!1895)) (= (select (arr!8361 _keys!1895) lt!160693) k0!1348))))

(declare-fun e!207440 () (_ BitVec 32))

(assert (=> d!70811 (= lt!160693 e!207440)))

(declare-fun c!52358 () Bool)

(assert (=> d!70811 (= c!52358 (= (select (arr!8361 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70811 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)) (bvslt (size!8713 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70811 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!160693)))

(declare-fun b!338084 () Bool)

(assert (=> b!338084 (= e!207440 #b00000000000000000000000000000000)))

(declare-fun b!338085 () Bool)

(assert (=> b!338085 (= e!207440 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70811 c!52358) b!338084))

(assert (= (and d!70811 (not c!52358)) b!338085))

(declare-fun m!341713 () Bool)

(assert (=> d!70811 m!341713))

(assert (=> d!70811 m!341683))

(declare-fun m!341715 () Bool)

(assert (=> b!338085 m!341715))

(assert (=> b!337970 d!70811))

(declare-fun b!338096 () Bool)

(declare-fun e!207451 () Bool)

(declare-fun call!26396 () Bool)

(assert (=> b!338096 (= e!207451 call!26396)))

(declare-fun b!338097 () Bool)

(declare-fun e!207452 () Bool)

(declare-fun contains!2089 (List!4703 (_ BitVec 64)) Bool)

(assert (=> b!338097 (= e!207452 (contains!2089 Nil!4700 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338098 () Bool)

(declare-fun e!207449 () Bool)

(assert (=> b!338098 (= e!207449 e!207451)))

(declare-fun c!52361 () Bool)

(assert (=> b!338098 (= c!52361 (validKeyInArray!0 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338099 () Bool)

(declare-fun e!207450 () Bool)

(assert (=> b!338099 (= e!207450 e!207449)))

(declare-fun res!186794 () Bool)

(assert (=> b!338099 (=> (not res!186794) (not e!207449))))

(assert (=> b!338099 (= res!186794 (not e!207452))))

(declare-fun res!186792 () Bool)

(assert (=> b!338099 (=> (not res!186792) (not e!207452))))

(assert (=> b!338099 (= res!186792 (validKeyInArray!0 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338100 () Bool)

(assert (=> b!338100 (= e!207451 call!26396)))

(declare-fun bm!26393 () Bool)

(assert (=> bm!26393 (= call!26396 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52361 (Cons!4699 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000) Nil!4700) Nil!4700)))))

(declare-fun d!70813 () Bool)

(declare-fun res!186793 () Bool)

(assert (=> d!70813 (=> res!186793 e!207450)))

(assert (=> d!70813 (= res!186793 (bvsge #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (=> d!70813 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4700) e!207450)))

(assert (= (and d!70813 (not res!186793)) b!338099))

(assert (= (and b!338099 res!186792) b!338097))

(assert (= (and b!338099 res!186794) b!338098))

(assert (= (and b!338098 c!52361) b!338096))

(assert (= (and b!338098 (not c!52361)) b!338100))

(assert (= (or b!338096 b!338100) bm!26393))

(assert (=> b!338097 m!341683))

(assert (=> b!338097 m!341683))

(declare-fun m!341717 () Bool)

(assert (=> b!338097 m!341717))

(assert (=> b!338098 m!341683))

(assert (=> b!338098 m!341683))

(assert (=> b!338098 m!341685))

(assert (=> b!338099 m!341683))

(assert (=> b!338099 m!341683))

(assert (=> b!338099 m!341685))

(assert (=> bm!26393 m!341683))

(declare-fun m!341719 () Bool)

(assert (=> bm!26393 m!341719))

(assert (=> b!337971 d!70813))

(declare-fun d!70815 () Bool)

(declare-fun e!207458 () Bool)

(assert (=> d!70815 e!207458))

(declare-fun res!186797 () Bool)

(assert (=> d!70815 (=> res!186797 e!207458)))

(declare-fun lt!160703 () Bool)

(assert (=> d!70815 (= res!186797 (not lt!160703))))

(declare-fun lt!160702 () Bool)

(assert (=> d!70815 (= lt!160703 lt!160702)))

(declare-fun lt!160704 () Unit!10454)

(declare-fun e!207457 () Unit!10454)

(assert (=> d!70815 (= lt!160704 e!207457)))

(declare-fun c!52364 () Bool)

(assert (=> d!70815 (= c!52364 lt!160702)))

(declare-fun containsKey!320 (List!4702 (_ BitVec 64)) Bool)

(assert (=> d!70815 (= lt!160702 (containsKey!320 (toList!2019 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70815 (= (contains!2086 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!160703)))

(declare-fun b!338107 () Bool)

(declare-fun lt!160705 () Unit!10454)

(assert (=> b!338107 (= e!207457 lt!160705)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!268 (List!4702 (_ BitVec 64)) Unit!10454)

(assert (=> b!338107 (= lt!160705 (lemmaContainsKeyImpliesGetValueByKeyDefined!268 (toList!2019 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!335 0))(
  ( (Some!334 (v!5737 V!10371)) (None!333) )
))
(declare-fun isDefined!269 (Option!335) Bool)

(declare-fun getValueByKey!329 (List!4702 (_ BitVec 64)) Option!335)

(assert (=> b!338107 (isDefined!269 (getValueByKey!329 (toList!2019 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!338108 () Bool)

(declare-fun Unit!10464 () Unit!10454)

(assert (=> b!338108 (= e!207457 Unit!10464)))

(declare-fun b!338109 () Bool)

(assert (=> b!338109 (= e!207458 (isDefined!269 (getValueByKey!329 (toList!2019 (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70815 c!52364) b!338107))

(assert (= (and d!70815 (not c!52364)) b!338108))

(assert (= (and d!70815 (not res!186797)) b!338109))

(declare-fun m!341721 () Bool)

(assert (=> d!70815 m!341721))

(declare-fun m!341723 () Bool)

(assert (=> b!338107 m!341723))

(declare-fun m!341725 () Bool)

(assert (=> b!338107 m!341725))

(assert (=> b!338107 m!341725))

(declare-fun m!341727 () Bool)

(assert (=> b!338107 m!341727))

(assert (=> b!338109 m!341725))

(assert (=> b!338109 m!341725))

(assert (=> b!338109 m!341727))

(assert (=> b!337961 d!70815))

(declare-fun b!338152 () Bool)

(declare-fun e!207486 () ListLongMap!4007)

(declare-fun e!207488 () ListLongMap!4007)

(assert (=> b!338152 (= e!207486 e!207488)))

(declare-fun c!52382 () Bool)

(assert (=> b!338152 (= c!52382 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26408 () Bool)

(declare-fun call!26412 () ListLongMap!4007)

(declare-fun getCurrentListMapNoExtraKeys!586 (array!17670 array!17668 (_ BitVec 32) (_ BitVec 32) V!10371 V!10371 (_ BitVec 32) Int) ListLongMap!4007)

(assert (=> bm!26408 (= call!26412 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun bm!26409 () Bool)

(declare-fun call!26411 () Bool)

(declare-fun lt!160766 () ListLongMap!4007)

(assert (=> bm!26409 (= call!26411 (contains!2086 lt!160766 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338153 () Bool)

(declare-fun e!207496 () Unit!10454)

(declare-fun Unit!10465 () Unit!10454)

(assert (=> b!338153 (= e!207496 Unit!10465)))

(declare-fun b!338154 () Bool)

(declare-fun e!207490 () Bool)

(declare-fun e!207493 () Bool)

(assert (=> b!338154 (= e!207490 e!207493)))

(declare-fun res!186824 () Bool)

(assert (=> b!338154 (= res!186824 call!26411)))

(assert (=> b!338154 (=> (not res!186824) (not e!207493))))

(declare-fun b!338155 () Bool)

(declare-fun e!207487 () ListLongMap!4007)

(declare-fun call!26416 () ListLongMap!4007)

(assert (=> b!338155 (= e!207487 call!26416)))

(declare-fun b!338156 () Bool)

(declare-fun lt!160765 () Unit!10454)

(assert (=> b!338156 (= e!207496 lt!160765)))

(declare-fun lt!160770 () ListLongMap!4007)

(assert (=> b!338156 (= lt!160770 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160751 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160751 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160752 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160752 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160757 () Unit!10454)

(declare-fun addStillContains!246 (ListLongMap!4007 (_ BitVec 64) V!10371 (_ BitVec 64)) Unit!10454)

(assert (=> b!338156 (= lt!160757 (addStillContains!246 lt!160770 lt!160751 zeroValue!1467 lt!160752))))

(declare-fun +!721 (ListLongMap!4007 tuple2!5092) ListLongMap!4007)

(assert (=> b!338156 (contains!2086 (+!721 lt!160770 (tuple2!5093 lt!160751 zeroValue!1467)) lt!160752)))

(declare-fun lt!160760 () Unit!10454)

(assert (=> b!338156 (= lt!160760 lt!160757)))

(declare-fun lt!160755 () ListLongMap!4007)

(assert (=> b!338156 (= lt!160755 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160771 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160771 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160769 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160769 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160764 () Unit!10454)

(declare-fun addApplyDifferent!246 (ListLongMap!4007 (_ BitVec 64) V!10371 (_ BitVec 64)) Unit!10454)

(assert (=> b!338156 (= lt!160764 (addApplyDifferent!246 lt!160755 lt!160771 minValue!1467 lt!160769))))

(declare-fun apply!270 (ListLongMap!4007 (_ BitVec 64)) V!10371)

(assert (=> b!338156 (= (apply!270 (+!721 lt!160755 (tuple2!5093 lt!160771 minValue!1467)) lt!160769) (apply!270 lt!160755 lt!160769))))

(declare-fun lt!160758 () Unit!10454)

(assert (=> b!338156 (= lt!160758 lt!160764)))

(declare-fun lt!160767 () ListLongMap!4007)

(assert (=> b!338156 (= lt!160767 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160759 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160759 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160754 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160754 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!160768 () Unit!10454)

(assert (=> b!338156 (= lt!160768 (addApplyDifferent!246 lt!160767 lt!160759 zeroValue!1467 lt!160754))))

(assert (=> b!338156 (= (apply!270 (+!721 lt!160767 (tuple2!5093 lt!160759 zeroValue!1467)) lt!160754) (apply!270 lt!160767 lt!160754))))

(declare-fun lt!160762 () Unit!10454)

(assert (=> b!338156 (= lt!160762 lt!160768)))

(declare-fun lt!160756 () ListLongMap!4007)

(assert (=> b!338156 (= lt!160756 (getCurrentListMapNoExtraKeys!586 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!160763 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160763 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!160753 () (_ BitVec 64))

(assert (=> b!338156 (= lt!160753 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!338156 (= lt!160765 (addApplyDifferent!246 lt!160756 lt!160763 minValue!1467 lt!160753))))

(assert (=> b!338156 (= (apply!270 (+!721 lt!160756 (tuple2!5093 lt!160763 minValue!1467)) lt!160753) (apply!270 lt!160756 lt!160753))))

(declare-fun bm!26410 () Bool)

(declare-fun call!26417 () Bool)

(assert (=> bm!26410 (= call!26417 (contains!2086 lt!160766 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!338157 () Bool)

(declare-fun c!52378 () Bool)

(assert (=> b!338157 (= c!52378 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!338157 (= e!207488 e!207487)))

(declare-fun b!338158 () Bool)

(assert (=> b!338158 (= e!207488 call!26416)))

(declare-fun b!338159 () Bool)

(declare-fun e!207485 () Bool)

(declare-fun e!207489 () Bool)

(assert (=> b!338159 (= e!207485 e!207489)))

(declare-fun res!186820 () Bool)

(assert (=> b!338159 (=> (not res!186820) (not e!207489))))

(assert (=> b!338159 (= res!186820 (contains!2086 lt!160766 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!338159 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(declare-fun b!338160 () Bool)

(assert (=> b!338160 (= e!207493 (= (apply!270 lt!160766 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!338161 () Bool)

(declare-fun e!207495 () Bool)

(assert (=> b!338161 (= e!207495 (validKeyInArray!0 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338162 () Bool)

(declare-fun call!26413 () ListLongMap!4007)

(assert (=> b!338162 (= e!207486 (+!721 call!26413 (tuple2!5093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun bm!26411 () Bool)

(declare-fun c!52377 () Bool)

(declare-fun call!26415 () ListLongMap!4007)

(declare-fun call!26414 () ListLongMap!4007)

(assert (=> bm!26411 (= call!26413 (+!721 (ite c!52377 call!26412 (ite c!52382 call!26415 call!26414)) (ite (or c!52377 c!52382) (tuple2!5093 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5093 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!338163 () Bool)

(declare-fun get!4570 (ValueCell!3179 V!10371) V!10371)

(declare-fun dynLambda!613 (Int (_ BitVec 64)) V!10371)

(assert (=> b!338163 (= e!207489 (= (apply!270 lt!160766 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)) (get!4570 (select (arr!8360 _values!1525) #b00000000000000000000000000000000) (dynLambda!613 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!338163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8712 _values!1525)))))

(assert (=> b!338163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(declare-fun b!338164 () Bool)

(declare-fun e!207494 () Bool)

(assert (=> b!338164 (= e!207494 (= (apply!270 lt!160766 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun bm!26412 () Bool)

(assert (=> bm!26412 (= call!26416 call!26413)))

(declare-fun b!338165 () Bool)

(assert (=> b!338165 (= e!207487 call!26414)))

(declare-fun b!338166 () Bool)

(assert (=> b!338166 (= e!207490 (not call!26411))))

(declare-fun bm!26413 () Bool)

(assert (=> bm!26413 (= call!26415 call!26412)))

(declare-fun b!338167 () Bool)

(declare-fun e!207492 () Bool)

(assert (=> b!338167 (= e!207492 e!207494)))

(declare-fun res!186822 () Bool)

(assert (=> b!338167 (= res!186822 call!26417)))

(assert (=> b!338167 (=> (not res!186822) (not e!207494))))

(declare-fun b!338168 () Bool)

(assert (=> b!338168 (= e!207492 (not call!26417))))

(declare-fun bm!26414 () Bool)

(assert (=> bm!26414 (= call!26414 call!26415)))

(declare-fun b!338169 () Bool)

(declare-fun res!186817 () Bool)

(declare-fun e!207497 () Bool)

(assert (=> b!338169 (=> (not res!186817) (not e!207497))))

(assert (=> b!338169 (= res!186817 e!207492)))

(declare-fun c!52380 () Bool)

(assert (=> b!338169 (= c!52380 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!70817 () Bool)

(assert (=> d!70817 e!207497))

(declare-fun res!186819 () Bool)

(assert (=> d!70817 (=> (not res!186819) (not e!207497))))

(assert (=> d!70817 (= res!186819 (or (bvsge #b00000000000000000000000000000000 (size!8713 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))))

(declare-fun lt!160750 () ListLongMap!4007)

(assert (=> d!70817 (= lt!160766 lt!160750)))

(declare-fun lt!160761 () Unit!10454)

(assert (=> d!70817 (= lt!160761 e!207496)))

(declare-fun c!52379 () Bool)

(declare-fun e!207491 () Bool)

(assert (=> d!70817 (= c!52379 e!207491)))

(declare-fun res!186818 () Bool)

(assert (=> d!70817 (=> (not res!186818) (not e!207491))))

(assert (=> d!70817 (= res!186818 (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (=> d!70817 (= lt!160750 e!207486)))

(assert (=> d!70817 (= c!52377 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70817 (validMask!0 mask!2385)))

(assert (=> d!70817 (= (getCurrentListMap!1548 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!160766)))

(declare-fun b!338170 () Bool)

(assert (=> b!338170 (= e!207491 (validKeyInArray!0 (select (arr!8361 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!338171 () Bool)

(assert (=> b!338171 (= e!207497 e!207490)))

(declare-fun c!52381 () Bool)

(assert (=> b!338171 (= c!52381 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!338172 () Bool)

(declare-fun res!186823 () Bool)

(assert (=> b!338172 (=> (not res!186823) (not e!207497))))

(assert (=> b!338172 (= res!186823 e!207485)))

(declare-fun res!186821 () Bool)

(assert (=> b!338172 (=> res!186821 e!207485)))

(assert (=> b!338172 (= res!186821 (not e!207495))))

(declare-fun res!186816 () Bool)

(assert (=> b!338172 (=> (not res!186816) (not e!207495))))

(assert (=> b!338172 (= res!186816 (bvslt #b00000000000000000000000000000000 (size!8713 _keys!1895)))))

(assert (= (and d!70817 c!52377) b!338162))

(assert (= (and d!70817 (not c!52377)) b!338152))

(assert (= (and b!338152 c!52382) b!338158))

(assert (= (and b!338152 (not c!52382)) b!338157))

(assert (= (and b!338157 c!52378) b!338155))

(assert (= (and b!338157 (not c!52378)) b!338165))

(assert (= (or b!338155 b!338165) bm!26414))

(assert (= (or b!338158 bm!26414) bm!26413))

(assert (= (or b!338158 b!338155) bm!26412))

(assert (= (or b!338162 bm!26413) bm!26408))

(assert (= (or b!338162 bm!26412) bm!26411))

(assert (= (and d!70817 res!186818) b!338170))

(assert (= (and d!70817 c!52379) b!338156))

(assert (= (and d!70817 (not c!52379)) b!338153))

(assert (= (and d!70817 res!186819) b!338172))

(assert (= (and b!338172 res!186816) b!338161))

(assert (= (and b!338172 (not res!186821)) b!338159))

(assert (= (and b!338159 res!186820) b!338163))

(assert (= (and b!338172 res!186823) b!338169))

(assert (= (and b!338169 c!52380) b!338167))

(assert (= (and b!338169 (not c!52380)) b!338168))

(assert (= (and b!338167 res!186822) b!338164))

(assert (= (or b!338167 b!338168) bm!26410))

(assert (= (and b!338169 res!186817) b!338171))

(assert (= (and b!338171 c!52381) b!338154))

(assert (= (and b!338171 (not c!52381)) b!338166))

(assert (= (and b!338154 res!186824) b!338160))

(assert (= (or b!338154 b!338166) bm!26409))

(declare-fun b_lambda!8441 () Bool)

(assert (=> (not b_lambda!8441) (not b!338163)))

(declare-fun t!9796 () Bool)

(declare-fun tb!3047 () Bool)

(assert (=> (and start!33924 (= defaultEntry!1528 defaultEntry!1528) t!9796) tb!3047))

(declare-fun result!5487 () Bool)

(assert (=> tb!3047 (= result!5487 tp_is_empty!7045)))

(assert (=> b!338163 t!9796))

(declare-fun b_and!14301 () Bool)

(assert (= b_and!14295 (and (=> t!9796 result!5487) b_and!14301)))

(declare-fun m!341729 () Bool)

(assert (=> b!338164 m!341729))

(declare-fun m!341731 () Bool)

(assert (=> bm!26411 m!341731))

(declare-fun m!341733 () Bool)

(assert (=> b!338160 m!341733))

(assert (=> d!70817 m!341607))

(declare-fun m!341735 () Bool)

(assert (=> bm!26410 m!341735))

(declare-fun m!341737 () Bool)

(assert (=> b!338156 m!341737))

(declare-fun m!341739 () Bool)

(assert (=> b!338156 m!341739))

(declare-fun m!341741 () Bool)

(assert (=> b!338156 m!341741))

(declare-fun m!341743 () Bool)

(assert (=> b!338156 m!341743))

(declare-fun m!341745 () Bool)

(assert (=> b!338156 m!341745))

(assert (=> b!338156 m!341683))

(declare-fun m!341747 () Bool)

(assert (=> b!338156 m!341747))

(declare-fun m!341749 () Bool)

(assert (=> b!338156 m!341749))

(declare-fun m!341751 () Bool)

(assert (=> b!338156 m!341751))

(assert (=> b!338156 m!341743))

(declare-fun m!341753 () Bool)

(assert (=> b!338156 m!341753))

(assert (=> b!338156 m!341739))

(declare-fun m!341755 () Bool)

(assert (=> b!338156 m!341755))

(declare-fun m!341757 () Bool)

(assert (=> b!338156 m!341757))

(declare-fun m!341759 () Bool)

(assert (=> b!338156 m!341759))

(declare-fun m!341761 () Bool)

(assert (=> b!338156 m!341761))

(declare-fun m!341763 () Bool)

(assert (=> b!338156 m!341763))

(assert (=> b!338156 m!341755))

(declare-fun m!341765 () Bool)

(assert (=> b!338156 m!341765))

(assert (=> b!338156 m!341763))

(declare-fun m!341767 () Bool)

(assert (=> b!338156 m!341767))

(assert (=> b!338163 m!341683))

(declare-fun m!341769 () Bool)

(assert (=> b!338163 m!341769))

(declare-fun m!341771 () Bool)

(assert (=> b!338163 m!341771))

(assert (=> b!338163 m!341683))

(declare-fun m!341773 () Bool)

(assert (=> b!338163 m!341773))

(assert (=> b!338163 m!341769))

(assert (=> b!338163 m!341771))

(declare-fun m!341775 () Bool)

(assert (=> b!338163 m!341775))

(assert (=> b!338161 m!341683))

(assert (=> b!338161 m!341683))

(assert (=> b!338161 m!341685))

(assert (=> bm!26408 m!341747))

(assert (=> b!338159 m!341683))

(assert (=> b!338159 m!341683))

(declare-fun m!341777 () Bool)

(assert (=> b!338159 m!341777))

(assert (=> b!338170 m!341683))

(assert (=> b!338170 m!341683))

(assert (=> b!338170 m!341685))

(declare-fun m!341779 () Bool)

(assert (=> bm!26409 m!341779))

(declare-fun m!341781 () Bool)

(assert (=> b!338162 m!341781))

(assert (=> b!337961 d!70817))

(declare-fun b!338181 () Bool)

(declare-fun e!207503 () Bool)

(assert (=> b!338181 (= e!207503 tp_is_empty!7045)))

(declare-fun mapIsEmpty!11985 () Bool)

(declare-fun mapRes!11985 () Bool)

(assert (=> mapIsEmpty!11985 mapRes!11985))

(declare-fun b!338182 () Bool)

(declare-fun e!207502 () Bool)

(assert (=> b!338182 (= e!207502 tp_is_empty!7045)))

(declare-fun mapNonEmpty!11985 () Bool)

(declare-fun tp!24810 () Bool)

(assert (=> mapNonEmpty!11985 (= mapRes!11985 (and tp!24810 e!207503))))

(declare-fun mapKey!11985 () (_ BitVec 32))

(declare-fun mapRest!11985 () (Array (_ BitVec 32) ValueCell!3179))

(declare-fun mapValue!11985 () ValueCell!3179)

(assert (=> mapNonEmpty!11985 (= mapRest!11976 (store mapRest!11985 mapKey!11985 mapValue!11985))))

(declare-fun condMapEmpty!11985 () Bool)

(declare-fun mapDefault!11985 () ValueCell!3179)

(assert (=> mapNonEmpty!11976 (= condMapEmpty!11985 (= mapRest!11976 ((as const (Array (_ BitVec 32) ValueCell!3179)) mapDefault!11985)))))

(assert (=> mapNonEmpty!11976 (= tp!24794 (and e!207502 mapRes!11985))))

(assert (= (and mapNonEmpty!11976 condMapEmpty!11985) mapIsEmpty!11985))

(assert (= (and mapNonEmpty!11976 (not condMapEmpty!11985)) mapNonEmpty!11985))

(assert (= (and mapNonEmpty!11985 ((_ is ValueCellFull!3179) mapValue!11985)) b!338181))

(assert (= (and mapNonEmpty!11976 ((_ is ValueCellFull!3179) mapDefault!11985)) b!338182))

(declare-fun m!341783 () Bool)

(assert (=> mapNonEmpty!11985 m!341783))

(declare-fun b_lambda!8443 () Bool)

(assert (= b_lambda!8441 (or (and start!33924 b_free!7093) b_lambda!8443)))

(check-sat (not b!338097) (not d!70817) (not b!338162) (not b!338156) (not b!338159) (not b!338164) (not b!338085) (not mapNonEmpty!11985) (not b!338053) (not d!70815) (not b_next!7093) (not b!338098) (not b!338160) (not b!338109) (not bm!26408) (not bm!26390) (not bm!26410) (not b!338170) (not b!338054) (not b!338061) (not bm!26393) (not bm!26409) (not d!70807) (not b!338107) (not b!338077) (not b!338163) tp_is_empty!7045 (not b!338099) (not b_lambda!8443) (not b!338161) (not bm!26411) (not d!70809) b_and!14301)
(check-sat b_and!14301 (not b_next!7093))
