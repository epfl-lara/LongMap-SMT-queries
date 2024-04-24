; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34940 () Bool)

(assert start!34940)

(declare-fun b_free!7669 () Bool)

(declare-fun b_next!7669 () Bool)

(assert (=> start!34940 (= b_free!7669 (not b_next!7669))))

(declare-fun tp!26582 () Bool)

(declare-fun b_and!14911 () Bool)

(assert (=> start!34940 (= tp!26582 b_and!14911)))

(declare-fun b!350034 () Bool)

(declare-fun e!214417 () Bool)

(declare-fun tp_is_empty!7621 () Bool)

(assert (=> b!350034 (= e!214417 tp_is_empty!7621)))

(declare-fun b!350035 () Bool)

(declare-fun e!214408 () Bool)

(assert (=> b!350035 (= e!214408 tp_is_empty!7621)))

(declare-datatypes ((SeekEntryResult!3389 0))(
  ( (MissingZero!3389 (index!15735 (_ BitVec 32))) (Found!3389 (index!15736 (_ BitVec 32))) (Intermediate!3389 (undefined!4201 Bool) (index!15737 (_ BitVec 32)) (x!34808 (_ BitVec 32))) (Undefined!3389) (MissingVacant!3389 (index!15738 (_ BitVec 32))) )
))
(declare-fun lt!164457 () SeekEntryResult!3389)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun c!53336 () Bool)

(declare-fun call!26933 () Bool)

(declare-fun bm!26930 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!26930 (= call!26933 (inRange!0 (ite c!53336 (index!15735 lt!164457) (index!15738 lt!164457)) mask!2385))))

(declare-fun b!350036 () Bool)

(declare-datatypes ((Unit!10820 0))(
  ( (Unit!10821) )
))
(declare-fun e!214409 () Unit!10820)

(declare-fun Unit!10822 () Unit!10820)

(assert (=> b!350036 (= e!214409 Unit!10822)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11139 0))(
  ( (V!11140 (val!3855 Int)) )
))
(declare-fun zeroValue!1467 () V!11139)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3467 0))(
  ( (ValueCellFull!3467 (v!6042 V!11139)) (EmptyCell!3467) )
))
(declare-datatypes ((array!18818 0))(
  ( (array!18819 (arr!8915 (Array (_ BitVec 32) ValueCell!3467)) (size!9267 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18818)

(declare-datatypes ((array!18820 0))(
  ( (array!18821 (arr!8916 (Array (_ BitVec 32) (_ BitVec 64))) (size!9268 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18820)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11139)

(declare-fun lt!164456 () Unit!10820)

(declare-fun lemmaArrayContainsKeyThenInListMap!332 (array!18820 array!18818 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 64) (_ BitVec 32) Int) Unit!10820)

(declare-fun arrayScanForKey!0 (array!18820 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350036 (= lt!164456 (lemmaArrayContainsKeyThenInListMap!332 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!350036 false))

(declare-fun b!350038 () Bool)

(declare-fun e!214418 () Bool)

(assert (=> b!350038 (= e!214418 (not (= (select (arr!8916 _keys!1895) (index!15735 lt!164457)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!350039 () Bool)

(declare-fun res!194022 () Bool)

(declare-fun e!214413 () Bool)

(assert (=> b!350039 (=> (not res!194022) (not e!214413))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18820 (_ BitVec 32)) Bool)

(assert (=> b!350039 (= res!194022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350040 () Bool)

(declare-fun e!214412 () Bool)

(assert (=> b!350040 (= e!214412 (not (= (select (arr!8916 _keys!1895) (index!15738 lt!164457)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!12900 () Bool)

(declare-fun mapRes!12900 () Bool)

(declare-fun tp!26583 () Bool)

(assert (=> mapNonEmpty!12900 (= mapRes!12900 (and tp!26583 e!214417))))

(declare-fun mapRest!12900 () (Array (_ BitVec 32) ValueCell!3467))

(declare-fun mapKey!12900 () (_ BitVec 32))

(declare-fun mapValue!12900 () ValueCell!3467)

(assert (=> mapNonEmpty!12900 (= (arr!8915 _values!1525) (store mapRest!12900 mapKey!12900 mapValue!12900))))

(declare-fun res!194020 () Bool)

(assert (=> start!34940 (=> (not res!194020) (not e!214413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34940 (= res!194020 (validMask!0 mask!2385))))

(assert (=> start!34940 e!214413))

(assert (=> start!34940 true))

(assert (=> start!34940 tp_is_empty!7621))

(assert (=> start!34940 tp!26582))

(declare-fun e!214416 () Bool)

(declare-fun array_inv!6590 (array!18818) Bool)

(assert (=> start!34940 (and (array_inv!6590 _values!1525) e!214416)))

(declare-fun array_inv!6591 (array!18820) Bool)

(assert (=> start!34940 (array_inv!6591 _keys!1895)))

(declare-fun b!350037 () Bool)

(declare-fun e!214411 () Bool)

(assert (=> b!350037 (= e!214413 e!214411)))

(declare-fun res!194015 () Bool)

(assert (=> b!350037 (=> (not res!194015) (not e!214411))))

(get-info :version)

(assert (=> b!350037 (= res!194015 (and (not ((_ is Found!3389) lt!164457)) ((_ is MissingZero!3389) lt!164457)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18820 (_ BitVec 32)) SeekEntryResult!3389)

(assert (=> b!350037 (= lt!164457 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350041 () Bool)

(declare-fun e!214419 () Bool)

(declare-fun e!214414 () Bool)

(assert (=> b!350041 (= e!214419 e!214414)))

(assert (=> b!350041 (= c!53336 ((_ is MissingZero!3389) lt!164457))))

(declare-fun b!350042 () Bool)

(declare-fun Unit!10823 () Unit!10820)

(assert (=> b!350042 (= e!214409 Unit!10823)))

(declare-fun b!350043 () Bool)

(declare-fun res!194013 () Bool)

(assert (=> b!350043 (=> (not res!194013) (not e!214413))))

(declare-datatypes ((List!5090 0))(
  ( (Nil!5087) (Cons!5086 (h!5942 (_ BitVec 64)) (t!10218 List!5090)) )
))
(declare-fun arrayNoDuplicates!0 (array!18820 (_ BitVec 32) List!5090) Bool)

(assert (=> b!350043 (= res!194013 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5087))))

(declare-fun b!350044 () Bool)

(declare-fun res!194018 () Bool)

(assert (=> b!350044 (=> (not res!194018) (not e!214413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350044 (= res!194018 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!12900 () Bool)

(assert (=> mapIsEmpty!12900 mapRes!12900))

(declare-fun b!350045 () Bool)

(declare-fun res!194021 () Bool)

(assert (=> b!350045 (=> (not res!194021) (not e!214413))))

(declare-datatypes ((tuple2!5484 0))(
  ( (tuple2!5485 (_1!2753 (_ BitVec 64)) (_2!2753 V!11139)) )
))
(declare-datatypes ((List!5091 0))(
  ( (Nil!5088) (Cons!5087 (h!5943 tuple2!5484) (t!10219 List!5091)) )
))
(declare-datatypes ((ListLongMap!4399 0))(
  ( (ListLongMap!4400 (toList!2215 List!5091)) )
))
(declare-fun contains!2302 (ListLongMap!4399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1743 (array!18820 array!18818 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 32) Int) ListLongMap!4399)

(assert (=> b!350045 (= res!194021 (not (contains!2302 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350046 () Bool)

(declare-fun e!214410 () Bool)

(assert (=> b!350046 (= e!214410 (not ((_ is Undefined!3389) lt!164457)))))

(declare-fun b!350047 () Bool)

(assert (=> b!350047 (= e!214414 e!214418)))

(declare-fun res!194019 () Bool)

(assert (=> b!350047 (= res!194019 (not call!26933))))

(assert (=> b!350047 (=> res!194019 e!214418)))

(declare-fun b!350048 () Bool)

(declare-fun res!194017 () Bool)

(assert (=> b!350048 (=> (not res!194017) (not e!214413))))

(assert (=> b!350048 (= res!194017 (and (= (size!9267 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9268 _keys!1895) (size!9267 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350049 () Bool)

(assert (=> b!350049 (= e!214416 (and e!214408 mapRes!12900))))

(declare-fun condMapEmpty!12900 () Bool)

(declare-fun mapDefault!12900 () ValueCell!3467)

(assert (=> b!350049 (= condMapEmpty!12900 (= (arr!8915 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3467)) mapDefault!12900)))))

(declare-fun b!350050 () Bool)

(assert (=> b!350050 (= e!214414 e!214410)))

(declare-fun c!53335 () Bool)

(assert (=> b!350050 (= c!53335 ((_ is MissingVacant!3389) lt!164457))))

(declare-fun b!350051 () Bool)

(declare-fun res!194014 () Bool)

(assert (=> b!350051 (=> res!194014 e!214412)))

(assert (=> b!350051 (= res!194014 (not call!26933))))

(assert (=> b!350051 (= e!214410 e!214412)))

(declare-fun b!350052 () Bool)

(assert (=> b!350052 (= e!214411 e!214419)))

(declare-fun res!194016 () Bool)

(assert (=> b!350052 (=> (not res!194016) (not e!214419))))

(declare-fun lt!164458 () Bool)

(assert (=> b!350052 (= res!194016 (not lt!164458))))

(declare-fun lt!164455 () Unit!10820)

(assert (=> b!350052 (= lt!164455 e!214409)))

(declare-fun c!53334 () Bool)

(assert (=> b!350052 (= c!53334 lt!164458)))

(declare-fun arrayContainsKey!0 (array!18820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350052 (= lt!164458 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(assert (= (and start!34940 res!194020) b!350048))

(assert (= (and b!350048 res!194017) b!350039))

(assert (= (and b!350039 res!194022) b!350043))

(assert (= (and b!350043 res!194013) b!350044))

(assert (= (and b!350044 res!194018) b!350045))

(assert (= (and b!350045 res!194021) b!350037))

(assert (= (and b!350037 res!194015) b!350052))

(assert (= (and b!350052 c!53334) b!350036))

(assert (= (and b!350052 (not c!53334)) b!350042))

(assert (= (and b!350052 res!194016) b!350041))

(assert (= (and b!350041 c!53336) b!350047))

(assert (= (and b!350041 (not c!53336)) b!350050))

(assert (= (and b!350047 (not res!194019)) b!350038))

(assert (= (and b!350050 c!53335) b!350051))

(assert (= (and b!350050 (not c!53335)) b!350046))

(assert (= (and b!350051 (not res!194014)) b!350040))

(assert (= (or b!350047 b!350051) bm!26930))

(assert (= (and b!350049 condMapEmpty!12900) mapIsEmpty!12900))

(assert (= (and b!350049 (not condMapEmpty!12900)) mapNonEmpty!12900))

(assert (= (and mapNonEmpty!12900 ((_ is ValueCellFull!3467) mapValue!12900)) b!350034))

(assert (= (and b!350049 ((_ is ValueCellFull!3467) mapDefault!12900)) b!350035))

(assert (= start!34940 b!350049))

(declare-fun m!350619 () Bool)

(assert (=> b!350039 m!350619))

(declare-fun m!350621 () Bool)

(assert (=> b!350040 m!350621))

(declare-fun m!350623 () Bool)

(assert (=> b!350036 m!350623))

(assert (=> b!350036 m!350623))

(declare-fun m!350625 () Bool)

(assert (=> b!350036 m!350625))

(declare-fun m!350627 () Bool)

(assert (=> b!350043 m!350627))

(declare-fun m!350629 () Bool)

(assert (=> mapNonEmpty!12900 m!350629))

(declare-fun m!350631 () Bool)

(assert (=> b!350052 m!350631))

(declare-fun m!350633 () Bool)

(assert (=> b!350037 m!350633))

(declare-fun m!350635 () Bool)

(assert (=> b!350045 m!350635))

(assert (=> b!350045 m!350635))

(declare-fun m!350637 () Bool)

(assert (=> b!350045 m!350637))

(declare-fun m!350639 () Bool)

(assert (=> b!350044 m!350639))

(declare-fun m!350641 () Bool)

(assert (=> b!350038 m!350641))

(declare-fun m!350643 () Bool)

(assert (=> bm!26930 m!350643))

(declare-fun m!350645 () Bool)

(assert (=> start!34940 m!350645))

(declare-fun m!350647 () Bool)

(assert (=> start!34940 m!350647))

(declare-fun m!350649 () Bool)

(assert (=> start!34940 m!350649))

(check-sat (not b!350036) (not b_next!7669) (not b!350045) (not b!350039) (not b!350043) (not start!34940) (not b!350044) b_and!14911 (not bm!26930) (not mapNonEmpty!12900) (not b!350037) tp_is_empty!7621 (not b!350052))
(check-sat b_and!14911 (not b_next!7669))
(get-model)

(declare-fun b!350179 () Bool)

(declare-fun c!53362 () Bool)

(declare-fun lt!164489 () (_ BitVec 64))

(assert (=> b!350179 (= c!53362 (= lt!164489 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!214500 () SeekEntryResult!3389)

(declare-fun e!214499 () SeekEntryResult!3389)

(assert (=> b!350179 (= e!214500 e!214499)))

(declare-fun lt!164490 () SeekEntryResult!3389)

(declare-fun b!350180 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18820 (_ BitVec 32)) SeekEntryResult!3389)

(assert (=> b!350180 (= e!214499 (seekKeyOrZeroReturnVacant!0 (x!34808 lt!164490) (index!15737 lt!164490) (index!15737 lt!164490) k0!1348 _keys!1895 mask!2385))))

(declare-fun b!350181 () Bool)

(assert (=> b!350181 (= e!214500 (Found!3389 (index!15737 lt!164490)))))

(declare-fun b!350182 () Bool)

(assert (=> b!350182 (= e!214499 (MissingZero!3389 (index!15737 lt!164490)))))

(declare-fun d!71431 () Bool)

(declare-fun lt!164491 () SeekEntryResult!3389)

(assert (=> d!71431 (and (or ((_ is Undefined!3389) lt!164491) (not ((_ is Found!3389) lt!164491)) (and (bvsge (index!15736 lt!164491) #b00000000000000000000000000000000) (bvslt (index!15736 lt!164491) (size!9268 _keys!1895)))) (or ((_ is Undefined!3389) lt!164491) ((_ is Found!3389) lt!164491) (not ((_ is MissingZero!3389) lt!164491)) (and (bvsge (index!15735 lt!164491) #b00000000000000000000000000000000) (bvslt (index!15735 lt!164491) (size!9268 _keys!1895)))) (or ((_ is Undefined!3389) lt!164491) ((_ is Found!3389) lt!164491) ((_ is MissingZero!3389) lt!164491) (not ((_ is MissingVacant!3389) lt!164491)) (and (bvsge (index!15738 lt!164491) #b00000000000000000000000000000000) (bvslt (index!15738 lt!164491) (size!9268 _keys!1895)))) (or ((_ is Undefined!3389) lt!164491) (ite ((_ is Found!3389) lt!164491) (= (select (arr!8916 _keys!1895) (index!15736 lt!164491)) k0!1348) (ite ((_ is MissingZero!3389) lt!164491) (= (select (arr!8916 _keys!1895) (index!15735 lt!164491)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3389) lt!164491) (= (select (arr!8916 _keys!1895) (index!15738 lt!164491)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!214498 () SeekEntryResult!3389)

(assert (=> d!71431 (= lt!164491 e!214498)))

(declare-fun c!53363 () Bool)

(assert (=> d!71431 (= c!53363 (and ((_ is Intermediate!3389) lt!164490) (undefined!4201 lt!164490)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!18820 (_ BitVec 32)) SeekEntryResult!3389)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!71431 (= lt!164490 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!71431 (validMask!0 mask!2385)))

(assert (=> d!71431 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!164491)))

(declare-fun b!350183 () Bool)

(assert (=> b!350183 (= e!214498 Undefined!3389)))

(declare-fun b!350184 () Bool)

(assert (=> b!350184 (= e!214498 e!214500)))

(assert (=> b!350184 (= lt!164489 (select (arr!8916 _keys!1895) (index!15737 lt!164490)))))

(declare-fun c!53361 () Bool)

(assert (=> b!350184 (= c!53361 (= lt!164489 k0!1348))))

(assert (= (and d!71431 c!53363) b!350183))

(assert (= (and d!71431 (not c!53363)) b!350184))

(assert (= (and b!350184 c!53361) b!350181))

(assert (= (and b!350184 (not c!53361)) b!350179))

(assert (= (and b!350179 c!53362) b!350182))

(assert (= (and b!350179 (not c!53362)) b!350180))

(declare-fun m!350715 () Bool)

(assert (=> b!350180 m!350715))

(assert (=> d!71431 m!350645))

(declare-fun m!350717 () Bool)

(assert (=> d!71431 m!350717))

(declare-fun m!350719 () Bool)

(assert (=> d!71431 m!350719))

(declare-fun m!350721 () Bool)

(assert (=> d!71431 m!350721))

(declare-fun m!350723 () Bool)

(assert (=> d!71431 m!350723))

(declare-fun m!350725 () Bool)

(assert (=> d!71431 m!350725))

(assert (=> d!71431 m!350723))

(declare-fun m!350727 () Bool)

(assert (=> b!350184 m!350727))

(assert (=> b!350037 d!71431))

(declare-fun d!71433 () Bool)

(assert (=> d!71433 (contains!2302 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!164494 () Unit!10820)

(declare-fun choose!1314 (array!18820 array!18818 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 64) (_ BitVec 32) Int) Unit!10820)

(assert (=> d!71433 (= lt!164494 (choose!1314 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!71433 (validMask!0 mask!2385)))

(assert (=> d!71433 (= (lemmaArrayContainsKeyThenInListMap!332 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!164494)))

(declare-fun bs!11956 () Bool)

(assert (= bs!11956 d!71433))

(assert (=> bs!11956 m!350635))

(assert (=> bs!11956 m!350635))

(assert (=> bs!11956 m!350637))

(assert (=> bs!11956 m!350623))

(declare-fun m!350729 () Bool)

(assert (=> bs!11956 m!350729))

(assert (=> bs!11956 m!350645))

(assert (=> b!350036 d!71433))

(declare-fun d!71435 () Bool)

(declare-fun lt!164497 () (_ BitVec 32))

(assert (=> d!71435 (and (or (bvslt lt!164497 #b00000000000000000000000000000000) (bvsge lt!164497 (size!9268 _keys!1895)) (and (bvsge lt!164497 #b00000000000000000000000000000000) (bvslt lt!164497 (size!9268 _keys!1895)))) (bvsge lt!164497 #b00000000000000000000000000000000) (bvslt lt!164497 (size!9268 _keys!1895)) (= (select (arr!8916 _keys!1895) lt!164497) k0!1348))))

(declare-fun e!214503 () (_ BitVec 32))

(assert (=> d!71435 (= lt!164497 e!214503)))

(declare-fun c!53366 () Bool)

(assert (=> d!71435 (= c!53366 (= (select (arr!8916 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71435 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9268 _keys!1895)) (bvslt (size!9268 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!71435 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!164497)))

(declare-fun b!350189 () Bool)

(assert (=> b!350189 (= e!214503 #b00000000000000000000000000000000)))

(declare-fun b!350190 () Bool)

(assert (=> b!350190 (= e!214503 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71435 c!53366) b!350189))

(assert (= (and d!71435 (not c!53366)) b!350190))

(declare-fun m!350731 () Bool)

(assert (=> d!71435 m!350731))

(declare-fun m!350733 () Bool)

(assert (=> d!71435 m!350733))

(declare-fun m!350735 () Bool)

(assert (=> b!350190 m!350735))

(assert (=> b!350036 d!71435))

(declare-fun d!71437 () Bool)

(declare-fun e!214509 () Bool)

(assert (=> d!71437 e!214509))

(declare-fun res!194085 () Bool)

(assert (=> d!71437 (=> res!194085 e!214509)))

(declare-fun lt!164507 () Bool)

(assert (=> d!71437 (= res!194085 (not lt!164507))))

(declare-fun lt!164508 () Bool)

(assert (=> d!71437 (= lt!164507 lt!164508)))

(declare-fun lt!164506 () Unit!10820)

(declare-fun e!214508 () Unit!10820)

(assert (=> d!71437 (= lt!164506 e!214508)))

(declare-fun c!53369 () Bool)

(assert (=> d!71437 (= c!53369 lt!164508)))

(declare-fun containsKey!340 (List!5091 (_ BitVec 64)) Bool)

(assert (=> d!71437 (= lt!164508 (containsKey!340 (toList!2215 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!71437 (= (contains!2302 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!164507)))

(declare-fun b!350197 () Bool)

(declare-fun lt!164509 () Unit!10820)

(assert (=> b!350197 (= e!214508 lt!164509)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!288 (List!5091 (_ BitVec 64)) Unit!10820)

(assert (=> b!350197 (= lt!164509 (lemmaContainsKeyImpliesGetValueByKeyDefined!288 (toList!2215 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!355 0))(
  ( (Some!354 (v!6045 V!11139)) (None!353) )
))
(declare-fun isDefined!289 (Option!355) Bool)

(declare-fun getValueByKey!349 (List!5091 (_ BitVec 64)) Option!355)

(assert (=> b!350197 (isDefined!289 (getValueByKey!349 (toList!2215 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!350198 () Bool)

(declare-fun Unit!10828 () Unit!10820)

(assert (=> b!350198 (= e!214508 Unit!10828)))

(declare-fun b!350199 () Bool)

(assert (=> b!350199 (= e!214509 (isDefined!289 (getValueByKey!349 (toList!2215 (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!71437 c!53369) b!350197))

(assert (= (and d!71437 (not c!53369)) b!350198))

(assert (= (and d!71437 (not res!194085)) b!350199))

(declare-fun m!350737 () Bool)

(assert (=> d!71437 m!350737))

(declare-fun m!350739 () Bool)

(assert (=> b!350197 m!350739))

(declare-fun m!350741 () Bool)

(assert (=> b!350197 m!350741))

(assert (=> b!350197 m!350741))

(declare-fun m!350743 () Bool)

(assert (=> b!350197 m!350743))

(assert (=> b!350199 m!350741))

(assert (=> b!350199 m!350741))

(assert (=> b!350199 m!350743))

(assert (=> b!350045 d!71437))

(declare-fun b!350242 () Bool)

(declare-fun e!214544 () Unit!10820)

(declare-fun Unit!10829 () Unit!10820)

(assert (=> b!350242 (= e!214544 Unit!10829)))

(declare-fun b!350243 () Bool)

(declare-fun e!214542 () Bool)

(declare-fun e!214547 () Bool)

(assert (=> b!350243 (= e!214542 e!214547)))

(declare-fun res!194112 () Bool)

(assert (=> b!350243 (=> (not res!194112) (not e!214547))))

(declare-fun lt!164554 () ListLongMap!4399)

(assert (=> b!350243 (= res!194112 (contains!2302 lt!164554 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!350243 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9268 _keys!1895)))))

(declare-fun b!350244 () Bool)

(declare-fun res!194111 () Bool)

(declare-fun e!214540 () Bool)

(assert (=> b!350244 (=> (not res!194111) (not e!214540))))

(assert (=> b!350244 (= res!194111 e!214542)))

(declare-fun res!194108 () Bool)

(assert (=> b!350244 (=> res!194108 e!214542)))

(declare-fun e!214548 () Bool)

(assert (=> b!350244 (= res!194108 (not e!214548))))

(declare-fun res!194107 () Bool)

(assert (=> b!350244 (=> (not res!194107) (not e!214548))))

(assert (=> b!350244 (= res!194107 (bvslt #b00000000000000000000000000000000 (size!9268 _keys!1895)))))

(declare-fun bm!26951 () Bool)

(declare-fun call!26958 () ListLongMap!4399)

(declare-fun call!26955 () ListLongMap!4399)

(assert (=> bm!26951 (= call!26958 call!26955)))

(declare-fun b!350245 () Bool)

(declare-fun e!214537 () Bool)

(assert (=> b!350245 (= e!214537 (validKeyInArray!0 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350246 () Bool)

(declare-fun e!214539 () ListLongMap!4399)

(declare-fun e!214546 () ListLongMap!4399)

(assert (=> b!350246 (= e!214539 e!214546)))

(declare-fun c!53385 () Bool)

(assert (=> b!350246 (= c!53385 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!350247 () Bool)

(declare-fun e!214541 () Bool)

(declare-fun apply!290 (ListLongMap!4399 (_ BitVec 64)) V!11139)

(assert (=> b!350247 (= e!214541 (= (apply!290 lt!164554 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun call!26960 () ListLongMap!4399)

(declare-fun bm!26952 () Bool)

(declare-fun c!53382 () Bool)

(declare-fun call!26957 () ListLongMap!4399)

(declare-fun +!741 (ListLongMap!4399 tuple2!5484) ListLongMap!4399)

(assert (=> bm!26952 (= call!26957 (+!741 (ite c!53382 call!26960 (ite c!53385 call!26955 call!26958)) (ite (or c!53382 c!53385) (tuple2!5485 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!350248 () Bool)

(declare-fun e!214538 () Bool)

(assert (=> b!350248 (= e!214538 (= (apply!290 lt!164554 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun d!71439 () Bool)

(assert (=> d!71439 e!214540))

(declare-fun res!194109 () Bool)

(assert (=> d!71439 (=> (not res!194109) (not e!214540))))

(assert (=> d!71439 (= res!194109 (or (bvsge #b00000000000000000000000000000000 (size!9268 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9268 _keys!1895)))))))

(declare-fun lt!164565 () ListLongMap!4399)

(assert (=> d!71439 (= lt!164554 lt!164565)))

(declare-fun lt!164557 () Unit!10820)

(assert (=> d!71439 (= lt!164557 e!214544)))

(declare-fun c!53383 () Bool)

(assert (=> d!71439 (= c!53383 e!214537)))

(declare-fun res!194105 () Bool)

(assert (=> d!71439 (=> (not res!194105) (not e!214537))))

(assert (=> d!71439 (= res!194105 (bvslt #b00000000000000000000000000000000 (size!9268 _keys!1895)))))

(assert (=> d!71439 (= lt!164565 e!214539)))

(assert (=> d!71439 (= c!53382 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!71439 (validMask!0 mask!2385)))

(assert (=> d!71439 (= (getCurrentListMap!1743 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!164554)))

(declare-fun b!350249 () Bool)

(declare-fun e!214536 () ListLongMap!4399)

(declare-fun call!26954 () ListLongMap!4399)

(assert (=> b!350249 (= e!214536 call!26954)))

(declare-fun bm!26953 () Bool)

(assert (=> bm!26953 (= call!26954 call!26957)))

(declare-fun b!350250 () Bool)

(declare-fun e!214543 () Bool)

(declare-fun call!26959 () Bool)

(assert (=> b!350250 (= e!214543 (not call!26959))))

(declare-fun b!350251 () Bool)

(declare-fun e!214545 () Bool)

(declare-fun call!26956 () Bool)

(assert (=> b!350251 (= e!214545 (not call!26956))))

(declare-fun b!350252 () Bool)

(assert (=> b!350252 (= e!214536 call!26958)))

(declare-fun b!350253 () Bool)

(declare-fun get!4782 (ValueCell!3467 V!11139) V!11139)

(declare-fun dynLambda!633 (Int (_ BitVec 64)) V!11139)

(assert (=> b!350253 (= e!214547 (= (apply!290 lt!164554 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)) (get!4782 (select (arr!8915 _values!1525) #b00000000000000000000000000000000) (dynLambda!633 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!350253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9267 _values!1525)))))

(assert (=> b!350253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!9268 _keys!1895)))))

(declare-fun bm!26954 () Bool)

(assert (=> bm!26954 (= call!26956 (contains!2302 lt!164554 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!350254 () Bool)

(assert (=> b!350254 (= e!214546 call!26954)))

(declare-fun b!350255 () Bool)

(assert (=> b!350255 (= e!214543 e!214541)))

(declare-fun res!194110 () Bool)

(assert (=> b!350255 (= res!194110 call!26959)))

(assert (=> b!350255 (=> (not res!194110) (not e!214541))))

(declare-fun b!350256 () Bool)

(assert (=> b!350256 (= e!214545 e!214538)))

(declare-fun res!194106 () Bool)

(assert (=> b!350256 (= res!194106 call!26956)))

(assert (=> b!350256 (=> (not res!194106) (not e!214538))))

(declare-fun b!350257 () Bool)

(declare-fun c!53384 () Bool)

(assert (=> b!350257 (= c!53384 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!350257 (= e!214546 e!214536)))

(declare-fun bm!26955 () Bool)

(assert (=> bm!26955 (= call!26959 (contains!2302 lt!164554 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!26956 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!606 (array!18820 array!18818 (_ BitVec 32) (_ BitVec 32) V!11139 V!11139 (_ BitVec 32) Int) ListLongMap!4399)

(assert (=> bm!26956 (= call!26960 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!350258 () Bool)

(declare-fun res!194104 () Bool)

(assert (=> b!350258 (=> (not res!194104) (not e!214540))))

(assert (=> b!350258 (= res!194104 e!214543)))

(declare-fun c!53386 () Bool)

(assert (=> b!350258 (= c!53386 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!350259 () Bool)

(assert (=> b!350259 (= e!214548 (validKeyInArray!0 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350260 () Bool)

(assert (=> b!350260 (= e!214539 (+!741 call!26957 (tuple2!5485 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!350261 () Bool)

(declare-fun lt!164571 () Unit!10820)

(assert (=> b!350261 (= e!214544 lt!164571)))

(declare-fun lt!164560 () ListLongMap!4399)

(assert (=> b!350261 (= lt!164560 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164570 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164568 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164568 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164555 () Unit!10820)

(declare-fun addStillContains!266 (ListLongMap!4399 (_ BitVec 64) V!11139 (_ BitVec 64)) Unit!10820)

(assert (=> b!350261 (= lt!164555 (addStillContains!266 lt!164560 lt!164570 zeroValue!1467 lt!164568))))

(assert (=> b!350261 (contains!2302 (+!741 lt!164560 (tuple2!5485 lt!164570 zeroValue!1467)) lt!164568)))

(declare-fun lt!164558 () Unit!10820)

(assert (=> b!350261 (= lt!164558 lt!164555)))

(declare-fun lt!164564 () ListLongMap!4399)

(assert (=> b!350261 (= lt!164564 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164575 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164575 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164569 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164569 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164572 () Unit!10820)

(declare-fun addApplyDifferent!266 (ListLongMap!4399 (_ BitVec 64) V!11139 (_ BitVec 64)) Unit!10820)

(assert (=> b!350261 (= lt!164572 (addApplyDifferent!266 lt!164564 lt!164575 minValue!1467 lt!164569))))

(assert (=> b!350261 (= (apply!290 (+!741 lt!164564 (tuple2!5485 lt!164575 minValue!1467)) lt!164569) (apply!290 lt!164564 lt!164569))))

(declare-fun lt!164559 () Unit!10820)

(assert (=> b!350261 (= lt!164559 lt!164572)))

(declare-fun lt!164573 () ListLongMap!4399)

(assert (=> b!350261 (= lt!164573 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164567 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164567 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164563 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164563 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164562 () Unit!10820)

(assert (=> b!350261 (= lt!164562 (addApplyDifferent!266 lt!164573 lt!164567 zeroValue!1467 lt!164563))))

(assert (=> b!350261 (= (apply!290 (+!741 lt!164573 (tuple2!5485 lt!164567 zeroValue!1467)) lt!164563) (apply!290 lt!164573 lt!164563))))

(declare-fun lt!164556 () Unit!10820)

(assert (=> b!350261 (= lt!164556 lt!164562)))

(declare-fun lt!164561 () ListLongMap!4399)

(assert (=> b!350261 (= lt!164561 (getCurrentListMapNoExtraKeys!606 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!164574 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164574 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!164566 () (_ BitVec 64))

(assert (=> b!350261 (= lt!164566 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!350261 (= lt!164571 (addApplyDifferent!266 lt!164561 lt!164574 minValue!1467 lt!164566))))

(assert (=> b!350261 (= (apply!290 (+!741 lt!164561 (tuple2!5485 lt!164574 minValue!1467)) lt!164566) (apply!290 lt!164561 lt!164566))))

(declare-fun bm!26957 () Bool)

(assert (=> bm!26957 (= call!26955 call!26960)))

(declare-fun b!350262 () Bool)

(assert (=> b!350262 (= e!214540 e!214545)))

(declare-fun c!53387 () Bool)

(assert (=> b!350262 (= c!53387 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!71439 c!53382) b!350260))

(assert (= (and d!71439 (not c!53382)) b!350246))

(assert (= (and b!350246 c!53385) b!350254))

(assert (= (and b!350246 (not c!53385)) b!350257))

(assert (= (and b!350257 c!53384) b!350249))

(assert (= (and b!350257 (not c!53384)) b!350252))

(assert (= (or b!350249 b!350252) bm!26951))

(assert (= (or b!350254 bm!26951) bm!26957))

(assert (= (or b!350254 b!350249) bm!26953))

(assert (= (or b!350260 bm!26957) bm!26956))

(assert (= (or b!350260 bm!26953) bm!26952))

(assert (= (and d!71439 res!194105) b!350245))

(assert (= (and d!71439 c!53383) b!350261))

(assert (= (and d!71439 (not c!53383)) b!350242))

(assert (= (and d!71439 res!194109) b!350244))

(assert (= (and b!350244 res!194107) b!350259))

(assert (= (and b!350244 (not res!194108)) b!350243))

(assert (= (and b!350243 res!194112) b!350253))

(assert (= (and b!350244 res!194111) b!350258))

(assert (= (and b!350258 c!53386) b!350255))

(assert (= (and b!350258 (not c!53386)) b!350250))

(assert (= (and b!350255 res!194110) b!350247))

(assert (= (or b!350255 b!350250) bm!26955))

(assert (= (and b!350258 res!194104) b!350262))

(assert (= (and b!350262 c!53387) b!350256))

(assert (= (and b!350262 (not c!53387)) b!350251))

(assert (= (and b!350256 res!194106) b!350248))

(assert (= (or b!350256 b!350251) bm!26954))

(declare-fun b_lambda!8521 () Bool)

(assert (=> (not b_lambda!8521) (not b!350253)))

(declare-fun t!10222 () Bool)

(declare-fun tb!3087 () Bool)

(assert (=> (and start!34940 (= defaultEntry!1528 defaultEntry!1528) t!10222) tb!3087))

(declare-fun result!5607 () Bool)

(assert (=> tb!3087 (= result!5607 tp_is_empty!7621)))

(assert (=> b!350253 t!10222))

(declare-fun b_and!14917 () Bool)

(assert (= b_and!14911 (and (=> t!10222 result!5607) b_and!14917)))

(declare-fun m!350745 () Bool)

(assert (=> bm!26952 m!350745))

(declare-fun m!350747 () Bool)

(assert (=> b!350260 m!350747))

(declare-fun m!350749 () Bool)

(assert (=> bm!26956 m!350749))

(assert (=> b!350243 m!350733))

(assert (=> b!350243 m!350733))

(declare-fun m!350751 () Bool)

(assert (=> b!350243 m!350751))

(assert (=> b!350259 m!350733))

(assert (=> b!350259 m!350733))

(declare-fun m!350753 () Bool)

(assert (=> b!350259 m!350753))

(declare-fun m!350755 () Bool)

(assert (=> b!350253 m!350755))

(declare-fun m!350757 () Bool)

(assert (=> b!350253 m!350757))

(assert (=> b!350253 m!350733))

(assert (=> b!350253 m!350755))

(assert (=> b!350253 m!350757))

(declare-fun m!350759 () Bool)

(assert (=> b!350253 m!350759))

(assert (=> b!350253 m!350733))

(declare-fun m!350761 () Bool)

(assert (=> b!350253 m!350761))

(declare-fun m!350763 () Bool)

(assert (=> bm!26954 m!350763))

(assert (=> d!71439 m!350645))

(declare-fun m!350765 () Bool)

(assert (=> b!350247 m!350765))

(declare-fun m!350767 () Bool)

(assert (=> b!350261 m!350767))

(declare-fun m!350769 () Bool)

(assert (=> b!350261 m!350769))

(declare-fun m!350771 () Bool)

(assert (=> b!350261 m!350771))

(assert (=> b!350261 m!350733))

(declare-fun m!350773 () Bool)

(assert (=> b!350261 m!350773))

(declare-fun m!350775 () Bool)

(assert (=> b!350261 m!350775))

(assert (=> b!350261 m!350767))

(declare-fun m!350777 () Bool)

(assert (=> b!350261 m!350777))

(assert (=> b!350261 m!350749))

(declare-fun m!350779 () Bool)

(assert (=> b!350261 m!350779))

(declare-fun m!350781 () Bool)

(assert (=> b!350261 m!350781))

(declare-fun m!350783 () Bool)

(assert (=> b!350261 m!350783))

(declare-fun m!350785 () Bool)

(assert (=> b!350261 m!350785))

(declare-fun m!350787 () Bool)

(assert (=> b!350261 m!350787))

(assert (=> b!350261 m!350781))

(assert (=> b!350261 m!350773))

(assert (=> b!350261 m!350779))

(declare-fun m!350789 () Bool)

(assert (=> b!350261 m!350789))

(declare-fun m!350791 () Bool)

(assert (=> b!350261 m!350791))

(declare-fun m!350793 () Bool)

(assert (=> b!350261 m!350793))

(declare-fun m!350795 () Bool)

(assert (=> b!350261 m!350795))

(assert (=> b!350245 m!350733))

(assert (=> b!350245 m!350733))

(assert (=> b!350245 m!350753))

(declare-fun m!350797 () Bool)

(assert (=> bm!26955 m!350797))

(declare-fun m!350799 () Bool)

(assert (=> b!350248 m!350799))

(assert (=> b!350045 d!71439))

(declare-fun d!71441 () Bool)

(assert (=> d!71441 (= (inRange!0 (ite c!53336 (index!15735 lt!164457) (index!15738 lt!164457)) mask!2385) (and (bvsge (ite c!53336 (index!15735 lt!164457) (index!15738 lt!164457)) #b00000000000000000000000000000000) (bvslt (ite c!53336 (index!15735 lt!164457) (index!15738 lt!164457)) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> bm!26930 d!71441))

(declare-fun d!71443 () Bool)

(assert (=> d!71443 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!350044 d!71443))

(declare-fun b!350275 () Bool)

(declare-fun e!214560 () Bool)

(declare-fun e!214558 () Bool)

(assert (=> b!350275 (= e!214560 e!214558)))

(declare-fun res!194119 () Bool)

(assert (=> b!350275 (=> (not res!194119) (not e!214558))))

(declare-fun e!214557 () Bool)

(assert (=> b!350275 (= res!194119 (not e!214557))))

(declare-fun res!194120 () Bool)

(assert (=> b!350275 (=> (not res!194120) (not e!214557))))

(assert (=> b!350275 (= res!194120 (validKeyInArray!0 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350276 () Bool)

(declare-fun contains!2304 (List!5090 (_ BitVec 64)) Bool)

(assert (=> b!350276 (= e!214557 (contains!2304 Nil!5087 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350277 () Bool)

(declare-fun e!214559 () Bool)

(declare-fun call!26963 () Bool)

(assert (=> b!350277 (= e!214559 call!26963)))

(declare-fun bm!26960 () Bool)

(declare-fun c!53390 () Bool)

(assert (=> bm!26960 (= call!26963 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53390 (Cons!5086 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000) Nil!5087) Nil!5087)))))

(declare-fun b!350278 () Bool)

(assert (=> b!350278 (= e!214558 e!214559)))

(assert (=> b!350278 (= c!53390 (validKeyInArray!0 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun d!71445 () Bool)

(declare-fun res!194121 () Bool)

(assert (=> d!71445 (=> res!194121 e!214560)))

(assert (=> d!71445 (= res!194121 (bvsge #b00000000000000000000000000000000 (size!9268 _keys!1895)))))

(assert (=> d!71445 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5087) e!214560)))

(declare-fun b!350279 () Bool)

(assert (=> b!350279 (= e!214559 call!26963)))

(assert (= (and d!71445 (not res!194121)) b!350275))

(assert (= (and b!350275 res!194120) b!350276))

(assert (= (and b!350275 res!194119) b!350278))

(assert (= (and b!350278 c!53390) b!350279))

(assert (= (and b!350278 (not c!53390)) b!350277))

(assert (= (or b!350279 b!350277) bm!26960))

(assert (=> b!350275 m!350733))

(assert (=> b!350275 m!350733))

(assert (=> b!350275 m!350753))

(assert (=> b!350276 m!350733))

(assert (=> b!350276 m!350733))

(declare-fun m!350801 () Bool)

(assert (=> b!350276 m!350801))

(assert (=> bm!26960 m!350733))

(declare-fun m!350803 () Bool)

(assert (=> bm!26960 m!350803))

(assert (=> b!350278 m!350733))

(assert (=> b!350278 m!350733))

(assert (=> b!350278 m!350753))

(assert (=> b!350043 d!71445))

(declare-fun bm!26963 () Bool)

(declare-fun call!26966 () Bool)

(assert (=> bm!26963 (= call!26966 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun d!71447 () Bool)

(declare-fun res!194126 () Bool)

(declare-fun e!214568 () Bool)

(assert (=> d!71447 (=> res!194126 e!214568)))

(assert (=> d!71447 (= res!194126 (bvsge #b00000000000000000000000000000000 (size!9268 _keys!1895)))))

(assert (=> d!71447 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!214568)))

(declare-fun b!350288 () Bool)

(declare-fun e!214569 () Bool)

(assert (=> b!350288 (= e!214568 e!214569)))

(declare-fun c!53393 () Bool)

(assert (=> b!350288 (= c!53393 (validKeyInArray!0 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!350289 () Bool)

(declare-fun e!214567 () Bool)

(assert (=> b!350289 (= e!214569 e!214567)))

(declare-fun lt!164583 () (_ BitVec 64))

(assert (=> b!350289 (= lt!164583 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!164584 () Unit!10820)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18820 (_ BitVec 64) (_ BitVec 32)) Unit!10820)

(assert (=> b!350289 (= lt!164584 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!164583 #b00000000000000000000000000000000))))

(assert (=> b!350289 (arrayContainsKey!0 _keys!1895 lt!164583 #b00000000000000000000000000000000)))

(declare-fun lt!164582 () Unit!10820)

(assert (=> b!350289 (= lt!164582 lt!164584)))

(declare-fun res!194127 () Bool)

(assert (=> b!350289 (= res!194127 (= (seekEntryOrOpen!0 (select (arr!8916 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3389 #b00000000000000000000000000000000)))))

(assert (=> b!350289 (=> (not res!194127) (not e!214567))))

(declare-fun b!350290 () Bool)

(assert (=> b!350290 (= e!214567 call!26966)))

(declare-fun b!350291 () Bool)

(assert (=> b!350291 (= e!214569 call!26966)))

(assert (= (and d!71447 (not res!194126)) b!350288))

(assert (= (and b!350288 c!53393) b!350289))

(assert (= (and b!350288 (not c!53393)) b!350291))

(assert (= (and b!350289 res!194127) b!350290))

(assert (= (or b!350290 b!350291) bm!26963))

(declare-fun m!350805 () Bool)

(assert (=> bm!26963 m!350805))

(assert (=> b!350288 m!350733))

(assert (=> b!350288 m!350733))

(assert (=> b!350288 m!350753))

(assert (=> b!350289 m!350733))

(declare-fun m!350807 () Bool)

(assert (=> b!350289 m!350807))

(declare-fun m!350809 () Bool)

(assert (=> b!350289 m!350809))

(assert (=> b!350289 m!350733))

(declare-fun m!350811 () Bool)

(assert (=> b!350289 m!350811))

(assert (=> b!350039 d!71447))

(declare-fun d!71449 () Bool)

(declare-fun res!194132 () Bool)

(declare-fun e!214574 () Bool)

(assert (=> d!71449 (=> res!194132 e!214574)))

(assert (=> d!71449 (= res!194132 (= (select (arr!8916 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!71449 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!214574)))

(declare-fun b!350296 () Bool)

(declare-fun e!214575 () Bool)

(assert (=> b!350296 (= e!214574 e!214575)))

(declare-fun res!194133 () Bool)

(assert (=> b!350296 (=> (not res!194133) (not e!214575))))

(assert (=> b!350296 (= res!194133 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!9268 _keys!1895)))))

(declare-fun b!350297 () Bool)

(assert (=> b!350297 (= e!214575 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!71449 (not res!194132)) b!350296))

(assert (= (and b!350296 res!194133) b!350297))

(assert (=> d!71449 m!350733))

(declare-fun m!350813 () Bool)

(assert (=> b!350297 m!350813))

(assert (=> b!350052 d!71449))

(declare-fun d!71451 () Bool)

(assert (=> d!71451 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34940 d!71451))

(declare-fun d!71453 () Bool)

(assert (=> d!71453 (= (array_inv!6590 _values!1525) (bvsge (size!9267 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34940 d!71453))

(declare-fun d!71455 () Bool)

(assert (=> d!71455 (= (array_inv!6591 _keys!1895) (bvsge (size!9268 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34940 d!71455))

(declare-fun b!350304 () Bool)

(declare-fun e!214581 () Bool)

(assert (=> b!350304 (= e!214581 tp_is_empty!7621)))

(declare-fun b!350305 () Bool)

(declare-fun e!214580 () Bool)

(assert (=> b!350305 (= e!214580 tp_is_empty!7621)))

(declare-fun mapIsEmpty!12909 () Bool)

(declare-fun mapRes!12909 () Bool)

(assert (=> mapIsEmpty!12909 mapRes!12909))

(declare-fun mapNonEmpty!12909 () Bool)

(declare-fun tp!26598 () Bool)

(assert (=> mapNonEmpty!12909 (= mapRes!12909 (and tp!26598 e!214581))))

(declare-fun mapValue!12909 () ValueCell!3467)

(declare-fun mapKey!12909 () (_ BitVec 32))

(declare-fun mapRest!12909 () (Array (_ BitVec 32) ValueCell!3467))

(assert (=> mapNonEmpty!12909 (= mapRest!12900 (store mapRest!12909 mapKey!12909 mapValue!12909))))

(declare-fun condMapEmpty!12909 () Bool)

(declare-fun mapDefault!12909 () ValueCell!3467)

(assert (=> mapNonEmpty!12900 (= condMapEmpty!12909 (= mapRest!12900 ((as const (Array (_ BitVec 32) ValueCell!3467)) mapDefault!12909)))))

(assert (=> mapNonEmpty!12900 (= tp!26583 (and e!214580 mapRes!12909))))

(assert (= (and mapNonEmpty!12900 condMapEmpty!12909) mapIsEmpty!12909))

(assert (= (and mapNonEmpty!12900 (not condMapEmpty!12909)) mapNonEmpty!12909))

(assert (= (and mapNonEmpty!12909 ((_ is ValueCellFull!3467) mapValue!12909)) b!350304))

(assert (= (and mapNonEmpty!12900 ((_ is ValueCellFull!3467) mapDefault!12909)) b!350305))

(declare-fun m!350815 () Bool)

(assert (=> mapNonEmpty!12909 m!350815))

(declare-fun b_lambda!8523 () Bool)

(assert (= b_lambda!8521 (or (and start!34940 b_free!7669) b_lambda!8523)))

(check-sat (not b!350199) b_and!14917 (not b!350289) (not b!350288) (not b!350247) (not bm!26963) (not b!350190) (not b!350180) (not b!350260) (not bm!26960) (not bm!26955) (not d!71433) (not b!350278) (not b_next!7669) (not b!350275) (not b!350261) (not b!350248) (not b!350245) (not b!350259) (not b!350243) (not b!350276) (not d!71431) (not b!350197) (not d!71439) (not bm!26954) (not d!71437) (not mapNonEmpty!12909) (not bm!26956) (not b!350297) (not b_lambda!8523) (not bm!26952) tp_is_empty!7621 (not b!350253))
(check-sat b_and!14917 (not b_next!7669))
