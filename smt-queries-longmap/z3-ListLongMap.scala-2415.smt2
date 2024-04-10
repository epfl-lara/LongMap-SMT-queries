; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38198 () Bool)

(assert start!38198)

(declare-fun b_free!9057 () Bool)

(declare-fun b_next!9057 () Bool)

(assert (=> start!38198 (= b_free!9057 (not b_next!9057))))

(declare-fun tp!31955 () Bool)

(declare-fun b_and!16431 () Bool)

(assert (=> start!38198 (= tp!31955 b_and!16431)))

(declare-fun res!225768 () Bool)

(declare-fun e!238488 () Bool)

(assert (=> start!38198 (=> (not res!225768) (not e!238488))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38198 (= res!225768 (validMask!0 mask!970))))

(assert (=> start!38198 e!238488))

(declare-datatypes ((V!14077 0))(
  ( (V!14078 (val!4909 Int)) )
))
(declare-datatypes ((ValueCell!4521 0))(
  ( (ValueCellFull!4521 (v!7150 V!14077)) (EmptyCell!4521) )
))
(declare-datatypes ((array!23365 0))(
  ( (array!23366 (arr!11140 (Array (_ BitVec 32) ValueCell!4521)) (size!11492 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23365)

(declare-fun e!238489 () Bool)

(declare-fun array_inv!8180 (array!23365) Bool)

(assert (=> start!38198 (and (array_inv!8180 _values!506) e!238489)))

(assert (=> start!38198 tp!31955))

(assert (=> start!38198 true))

(declare-fun tp_is_empty!9729 () Bool)

(assert (=> start!38198 tp_is_empty!9729))

(declare-datatypes ((array!23367 0))(
  ( (array!23368 (arr!11141 (Array (_ BitVec 32) (_ BitVec 64))) (size!11493 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23367)

(declare-fun array_inv!8181 (array!23367) Bool)

(assert (=> start!38198 (array_inv!8181 _keys!658)))

(declare-fun b!393952 () Bool)

(declare-datatypes ((tuple2!6628 0))(
  ( (tuple2!6629 (_1!3325 (_ BitVec 64)) (_2!3325 V!14077)) )
))
(declare-datatypes ((List!6480 0))(
  ( (Nil!6477) (Cons!6476 (h!7332 tuple2!6628) (t!11652 List!6480)) )
))
(declare-datatypes ((ListLongMap!5541 0))(
  ( (ListLongMap!5542 (toList!2786 List!6480)) )
))
(declare-fun lt!186560 () ListLongMap!5541)

(declare-fun lt!186556 () tuple2!6628)

(declare-fun e!238492 () Bool)

(declare-fun lt!186552 () ListLongMap!5541)

(declare-fun +!1079 (ListLongMap!5541 tuple2!6628) ListLongMap!5541)

(assert (=> b!393952 (= e!238492 (= (+!1079 lt!186560 lt!186556) lt!186552))))

(declare-fun lt!186553 () ListLongMap!5541)

(assert (=> b!393952 (= lt!186552 lt!186553)))

(declare-fun mapIsEmpty!16191 () Bool)

(declare-fun mapRes!16191 () Bool)

(assert (=> mapIsEmpty!16191 mapRes!16191))

(declare-fun b!393953 () Bool)

(declare-fun e!238487 () Bool)

(assert (=> b!393953 (= e!238487 tp_is_empty!9729)))

(declare-fun b!393954 () Bool)

(declare-fun res!225770 () Bool)

(assert (=> b!393954 (=> (not res!225770) (not e!238488))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!393954 (= res!225770 (and (= (size!11492 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11493 _keys!658) (size!11492 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!393955 () Bool)

(declare-fun e!238486 () Bool)

(assert (=> b!393955 (= e!238486 (not e!238492))))

(declare-fun res!225766 () Bool)

(assert (=> b!393955 (=> res!225766 e!238492)))

(declare-fun lt!186561 () Bool)

(assert (=> b!393955 (= res!225766 (or (and (not lt!186561) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186561) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186561)))))

(assert (=> b!393955 (= lt!186561 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14077)

(declare-fun minValue!472 () V!14077)

(declare-fun getCurrentListMap!2125 (array!23367 array!23365 (_ BitVec 32) (_ BitVec 32) V!14077 V!14077 (_ BitVec 32) Int) ListLongMap!5541)

(assert (=> b!393955 (= lt!186560 (getCurrentListMap!2125 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186555 () array!23367)

(declare-fun lt!186559 () array!23365)

(assert (=> b!393955 (= lt!186552 (getCurrentListMap!2125 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186557 () ListLongMap!5541)

(assert (=> b!393955 (and (= lt!186553 lt!186557) (= lt!186557 lt!186553))))

(declare-fun lt!186554 () ListLongMap!5541)

(assert (=> b!393955 (= lt!186557 (+!1079 lt!186554 lt!186556))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!14077)

(assert (=> b!393955 (= lt!186556 (tuple2!6629 k0!778 v!373))))

(declare-datatypes ((Unit!12046 0))(
  ( (Unit!12047) )
))
(declare-fun lt!186558 () Unit!12046)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 (array!23367 array!23365 (_ BitVec 32) (_ BitVec 32) V!14077 V!14077 (_ BitVec 32) (_ BitVec 64) V!14077 (_ BitVec 32) Int) Unit!12046)

(assert (=> b!393955 (= lt!186558 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!1005 (array!23367 array!23365 (_ BitVec 32) (_ BitVec 32) V!14077 V!14077 (_ BitVec 32) Int) ListLongMap!5541)

(assert (=> b!393955 (= lt!186553 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!393955 (= lt!186559 (array!23366 (store (arr!11140 _values!506) i!548 (ValueCellFull!4521 v!373)) (size!11492 _values!506)))))

(assert (=> b!393955 (= lt!186554 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!393956 () Bool)

(declare-fun res!225765 () Bool)

(assert (=> b!393956 (=> (not res!225765) (not e!238488))))

(declare-fun arrayContainsKey!0 (array!23367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!393956 (= res!225765 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!393957 () Bool)

(declare-fun res!225762 () Bool)

(assert (=> b!393957 (=> (not res!225762) (not e!238488))))

(assert (=> b!393957 (= res!225762 (or (= (select (arr!11141 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11141 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16191 () Bool)

(declare-fun tp!31956 () Bool)

(declare-fun e!238491 () Bool)

(assert (=> mapNonEmpty!16191 (= mapRes!16191 (and tp!31956 e!238491))))

(declare-fun mapValue!16191 () ValueCell!4521)

(declare-fun mapKey!16191 () (_ BitVec 32))

(declare-fun mapRest!16191 () (Array (_ BitVec 32) ValueCell!4521))

(assert (=> mapNonEmpty!16191 (= (arr!11140 _values!506) (store mapRest!16191 mapKey!16191 mapValue!16191))))

(declare-fun b!393958 () Bool)

(assert (=> b!393958 (= e!238491 tp_is_empty!9729)))

(declare-fun b!393959 () Bool)

(declare-fun res!225763 () Bool)

(assert (=> b!393959 (=> (not res!225763) (not e!238488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23367 (_ BitVec 32)) Bool)

(assert (=> b!393959 (= res!225763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!393960 () Bool)

(declare-fun res!225771 () Bool)

(assert (=> b!393960 (=> (not res!225771) (not e!238488))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!393960 (= res!225771 (validKeyInArray!0 k0!778))))

(declare-fun b!393961 () Bool)

(declare-fun res!225761 () Bool)

(assert (=> b!393961 (=> (not res!225761) (not e!238488))))

(assert (=> b!393961 (= res!225761 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11493 _keys!658))))))

(declare-fun b!393962 () Bool)

(declare-fun res!225767 () Bool)

(assert (=> b!393962 (=> (not res!225767) (not e!238488))))

(declare-datatypes ((List!6481 0))(
  ( (Nil!6478) (Cons!6477 (h!7333 (_ BitVec 64)) (t!11653 List!6481)) )
))
(declare-fun arrayNoDuplicates!0 (array!23367 (_ BitVec 32) List!6481) Bool)

(assert (=> b!393962 (= res!225767 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6478))))

(declare-fun b!393963 () Bool)

(assert (=> b!393963 (= e!238488 e!238486)))

(declare-fun res!225769 () Bool)

(assert (=> b!393963 (=> (not res!225769) (not e!238486))))

(assert (=> b!393963 (= res!225769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186555 mask!970))))

(assert (=> b!393963 (= lt!186555 (array!23368 (store (arr!11141 _keys!658) i!548 k0!778) (size!11493 _keys!658)))))

(declare-fun b!393964 () Bool)

(declare-fun res!225764 () Bool)

(assert (=> b!393964 (=> (not res!225764) (not e!238486))))

(assert (=> b!393964 (= res!225764 (arrayNoDuplicates!0 lt!186555 #b00000000000000000000000000000000 Nil!6478))))

(declare-fun b!393965 () Bool)

(assert (=> b!393965 (= e!238489 (and e!238487 mapRes!16191))))

(declare-fun condMapEmpty!16191 () Bool)

(declare-fun mapDefault!16191 () ValueCell!4521)

(assert (=> b!393965 (= condMapEmpty!16191 (= (arr!11140 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4521)) mapDefault!16191)))))

(assert (= (and start!38198 res!225768) b!393954))

(assert (= (and b!393954 res!225770) b!393959))

(assert (= (and b!393959 res!225763) b!393962))

(assert (= (and b!393962 res!225767) b!393961))

(assert (= (and b!393961 res!225761) b!393960))

(assert (= (and b!393960 res!225771) b!393957))

(assert (= (and b!393957 res!225762) b!393956))

(assert (= (and b!393956 res!225765) b!393963))

(assert (= (and b!393963 res!225769) b!393964))

(assert (= (and b!393964 res!225764) b!393955))

(assert (= (and b!393955 (not res!225766)) b!393952))

(assert (= (and b!393965 condMapEmpty!16191) mapIsEmpty!16191))

(assert (= (and b!393965 (not condMapEmpty!16191)) mapNonEmpty!16191))

(get-info :version)

(assert (= (and mapNonEmpty!16191 ((_ is ValueCellFull!4521) mapValue!16191)) b!393958))

(assert (= (and b!393965 ((_ is ValueCellFull!4521) mapDefault!16191)) b!393953))

(assert (= start!38198 b!393965))

(declare-fun m!390391 () Bool)

(assert (=> b!393952 m!390391))

(declare-fun m!390393 () Bool)

(assert (=> b!393956 m!390393))

(declare-fun m!390395 () Bool)

(assert (=> b!393959 m!390395))

(declare-fun m!390397 () Bool)

(assert (=> b!393957 m!390397))

(declare-fun m!390399 () Bool)

(assert (=> mapNonEmpty!16191 m!390399))

(declare-fun m!390401 () Bool)

(assert (=> b!393960 m!390401))

(declare-fun m!390403 () Bool)

(assert (=> b!393964 m!390403))

(declare-fun m!390405 () Bool)

(assert (=> b!393962 m!390405))

(declare-fun m!390407 () Bool)

(assert (=> b!393963 m!390407))

(declare-fun m!390409 () Bool)

(assert (=> b!393963 m!390409))

(declare-fun m!390411 () Bool)

(assert (=> b!393955 m!390411))

(declare-fun m!390413 () Bool)

(assert (=> b!393955 m!390413))

(declare-fun m!390415 () Bool)

(assert (=> b!393955 m!390415))

(declare-fun m!390417 () Bool)

(assert (=> b!393955 m!390417))

(declare-fun m!390419 () Bool)

(assert (=> b!393955 m!390419))

(declare-fun m!390421 () Bool)

(assert (=> b!393955 m!390421))

(declare-fun m!390423 () Bool)

(assert (=> b!393955 m!390423))

(declare-fun m!390425 () Bool)

(assert (=> start!38198 m!390425))

(declare-fun m!390427 () Bool)

(assert (=> start!38198 m!390427))

(declare-fun m!390429 () Bool)

(assert (=> start!38198 m!390429))

(check-sat (not b!393963) b_and!16431 (not b!393952) (not start!38198) (not b!393955) (not b!393964) (not b!393959) (not b!393962) (not b!393956) (not mapNonEmpty!16191) (not b!393960) tp_is_empty!9729 (not b_next!9057))
(check-sat b_and!16431 (not b_next!9057))
(get-model)

(declare-fun d!73245 () Bool)

(declare-fun res!225812 () Bool)

(declare-fun e!238524 () Bool)

(assert (=> d!73245 (=> res!225812 e!238524)))

(assert (=> d!73245 (= res!225812 (bvsge #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(assert (=> d!73245 (= (arrayNoDuplicates!0 lt!186555 #b00000000000000000000000000000000 Nil!6478) e!238524)))

(declare-fun b!394018 () Bool)

(declare-fun e!238523 () Bool)

(assert (=> b!394018 (= e!238524 e!238523)))

(declare-fun res!225811 () Bool)

(assert (=> b!394018 (=> (not res!225811) (not e!238523))))

(declare-fun e!238525 () Bool)

(assert (=> b!394018 (= res!225811 (not e!238525))))

(declare-fun res!225813 () Bool)

(assert (=> b!394018 (=> (not res!225813) (not e!238525))))

(assert (=> b!394018 (= res!225813 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(declare-fun b!394019 () Bool)

(declare-fun e!238522 () Bool)

(declare-fun call!27817 () Bool)

(assert (=> b!394019 (= e!238522 call!27817)))

(declare-fun b!394020 () Bool)

(assert (=> b!394020 (= e!238522 call!27817)))

(declare-fun bm!27814 () Bool)

(declare-fun c!54488 () Bool)

(assert (=> bm!27814 (= call!27817 (arrayNoDuplicates!0 lt!186555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54488 (Cons!6477 (select (arr!11141 lt!186555) #b00000000000000000000000000000000) Nil!6478) Nil!6478)))))

(declare-fun b!394021 () Bool)

(declare-fun contains!2473 (List!6481 (_ BitVec 64)) Bool)

(assert (=> b!394021 (= e!238525 (contains!2473 Nil!6478 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(declare-fun b!394022 () Bool)

(assert (=> b!394022 (= e!238523 e!238522)))

(assert (=> b!394022 (= c!54488 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(assert (= (and d!73245 (not res!225812)) b!394018))

(assert (= (and b!394018 res!225813) b!394021))

(assert (= (and b!394018 res!225811) b!394022))

(assert (= (and b!394022 c!54488) b!394020))

(assert (= (and b!394022 (not c!54488)) b!394019))

(assert (= (or b!394020 b!394019) bm!27814))

(declare-fun m!390471 () Bool)

(assert (=> b!394018 m!390471))

(assert (=> b!394018 m!390471))

(declare-fun m!390473 () Bool)

(assert (=> b!394018 m!390473))

(assert (=> bm!27814 m!390471))

(declare-fun m!390475 () Bool)

(assert (=> bm!27814 m!390475))

(assert (=> b!394021 m!390471))

(assert (=> b!394021 m!390471))

(declare-fun m!390477 () Bool)

(assert (=> b!394021 m!390477))

(assert (=> b!394022 m!390471))

(assert (=> b!394022 m!390471))

(assert (=> b!394022 m!390473))

(assert (=> b!393964 d!73245))

(declare-fun b!394047 () Bool)

(declare-fun lt!186611 () Unit!12046)

(declare-fun lt!186608 () Unit!12046)

(assert (=> b!394047 (= lt!186611 lt!186608)))

(declare-fun lt!186612 () V!14077)

(declare-fun lt!186607 () ListLongMap!5541)

(declare-fun lt!186609 () (_ BitVec 64))

(declare-fun lt!186606 () (_ BitVec 64))

(declare-fun contains!2474 (ListLongMap!5541 (_ BitVec 64)) Bool)

(assert (=> b!394047 (not (contains!2474 (+!1079 lt!186607 (tuple2!6629 lt!186609 lt!186612)) lt!186606))))

(declare-fun addStillNotContains!141 (ListLongMap!5541 (_ BitVec 64) V!14077 (_ BitVec 64)) Unit!12046)

(assert (=> b!394047 (= lt!186608 (addStillNotContains!141 lt!186607 lt!186609 lt!186612 lt!186606))))

(assert (=> b!394047 (= lt!186606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5624 (ValueCell!4521 V!14077) V!14077)

(declare-fun dynLambda!651 (Int (_ BitVec 64)) V!14077)

(assert (=> b!394047 (= lt!186612 (get!5624 (select (arr!11140 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!394047 (= lt!186609 (select (arr!11141 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27820 () ListLongMap!5541)

(assert (=> b!394047 (= lt!186607 call!27820)))

(declare-fun e!238542 () ListLongMap!5541)

(assert (=> b!394047 (= e!238542 (+!1079 call!27820 (tuple2!6629 (select (arr!11141 _keys!658) #b00000000000000000000000000000000) (get!5624 (select (arr!11140 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!394048 () Bool)

(declare-fun e!238546 () ListLongMap!5541)

(assert (=> b!394048 (= e!238546 e!238542)))

(declare-fun c!54498 () Bool)

(assert (=> b!394048 (= c!54498 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394050 () Bool)

(declare-fun e!238540 () Bool)

(declare-fun e!238545 () Bool)

(assert (=> b!394050 (= e!238540 e!238545)))

(assert (=> b!394050 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(declare-fun res!225824 () Bool)

(declare-fun lt!186610 () ListLongMap!5541)

(assert (=> b!394050 (= res!225824 (contains!2474 lt!186610 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!394050 (=> (not res!225824) (not e!238545))))

(declare-fun b!394051 () Bool)

(declare-fun res!225825 () Bool)

(declare-fun e!238543 () Bool)

(assert (=> b!394051 (=> (not res!225825) (not e!238543))))

(assert (=> b!394051 (= res!225825 (not (contains!2474 lt!186610 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394052 () Bool)

(assert (=> b!394052 (= e!238542 call!27820)))

(declare-fun bm!27817 () Bool)

(assert (=> bm!27817 (= call!27820 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!394053 () Bool)

(declare-fun e!238541 () Bool)

(assert (=> b!394053 (= e!238540 e!238541)))

(declare-fun c!54500 () Bool)

(assert (=> b!394053 (= c!54500 (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(declare-fun b!394054 () Bool)

(assert (=> b!394054 (= e!238546 (ListLongMap!5542 Nil!6477))))

(declare-fun b!394055 () Bool)

(declare-fun isEmpty!554 (ListLongMap!5541) Bool)

(assert (=> b!394055 (= e!238541 (isEmpty!554 lt!186610))))

(declare-fun b!394056 () Bool)

(declare-fun e!238544 () Bool)

(assert (=> b!394056 (= e!238544 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!394056 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!394057 () Bool)

(assert (=> b!394057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(assert (=> b!394057 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11492 _values!506)))))

(declare-fun apply!308 (ListLongMap!5541 (_ BitVec 64)) V!14077)

(assert (=> b!394057 (= e!238545 (= (apply!308 lt!186610 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)) (get!5624 (select (arr!11140 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!394058 () Bool)

(assert (=> b!394058 (= e!238543 e!238540)))

(declare-fun c!54497 () Bool)

(assert (=> b!394058 (= c!54497 e!238544)))

(declare-fun res!225822 () Bool)

(assert (=> b!394058 (=> (not res!225822) (not e!238544))))

(assert (=> b!394058 (= res!225822 (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(declare-fun d!73247 () Bool)

(assert (=> d!73247 e!238543))

(declare-fun res!225823 () Bool)

(assert (=> d!73247 (=> (not res!225823) (not e!238543))))

(assert (=> d!73247 (= res!225823 (not (contains!2474 lt!186610 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73247 (= lt!186610 e!238546)))

(declare-fun c!54499 () Bool)

(assert (=> d!73247 (= c!54499 (bvsge #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(assert (=> d!73247 (validMask!0 mask!970)))

(assert (=> d!73247 (= (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186610)))

(declare-fun b!394049 () Bool)

(assert (=> b!394049 (= e!238541 (= lt!186610 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!73247 c!54499) b!394054))

(assert (= (and d!73247 (not c!54499)) b!394048))

(assert (= (and b!394048 c!54498) b!394047))

(assert (= (and b!394048 (not c!54498)) b!394052))

(assert (= (or b!394047 b!394052) bm!27817))

(assert (= (and d!73247 res!225823) b!394051))

(assert (= (and b!394051 res!225825) b!394058))

(assert (= (and b!394058 res!225822) b!394056))

(assert (= (and b!394058 c!54497) b!394050))

(assert (= (and b!394058 (not c!54497)) b!394053))

(assert (= (and b!394050 res!225824) b!394057))

(assert (= (and b!394053 c!54500) b!394049))

(assert (= (and b!394053 (not c!54500)) b!394055))

(declare-fun b_lambda!8791 () Bool)

(assert (=> (not b_lambda!8791) (not b!394047)))

(declare-fun t!11656 () Bool)

(declare-fun tb!3131 () Bool)

(assert (=> (and start!38198 (= defaultEntry!514 defaultEntry!514) t!11656) tb!3131))

(declare-fun result!5773 () Bool)

(assert (=> tb!3131 (= result!5773 tp_is_empty!9729)))

(assert (=> b!394047 t!11656))

(declare-fun b_and!16435 () Bool)

(assert (= b_and!16431 (and (=> t!11656 result!5773) b_and!16435)))

(declare-fun b_lambda!8793 () Bool)

(assert (=> (not b_lambda!8793) (not b!394057)))

(assert (=> b!394057 t!11656))

(declare-fun b_and!16437 () Bool)

(assert (= b_and!16435 (and (=> t!11656 result!5773) b_and!16437)))

(declare-fun m!390479 () Bool)

(assert (=> b!394047 m!390479))

(declare-fun m!390481 () Bool)

(assert (=> b!394047 m!390481))

(declare-fun m!390483 () Bool)

(assert (=> b!394047 m!390483))

(declare-fun m!390485 () Bool)

(assert (=> b!394047 m!390485))

(declare-fun m!390487 () Bool)

(assert (=> b!394047 m!390487))

(declare-fun m!390489 () Bool)

(assert (=> b!394047 m!390489))

(assert (=> b!394047 m!390483))

(assert (=> b!394047 m!390489))

(declare-fun m!390491 () Bool)

(assert (=> b!394047 m!390491))

(declare-fun m!390493 () Bool)

(assert (=> b!394047 m!390493))

(assert (=> b!394047 m!390479))

(declare-fun m!390495 () Bool)

(assert (=> d!73247 m!390495))

(assert (=> d!73247 m!390425))

(assert (=> b!394048 m!390493))

(assert (=> b!394048 m!390493))

(declare-fun m!390497 () Bool)

(assert (=> b!394048 m!390497))

(declare-fun m!390499 () Bool)

(assert (=> b!394051 m!390499))

(declare-fun m!390501 () Bool)

(assert (=> b!394049 m!390501))

(assert (=> bm!27817 m!390501))

(declare-fun m!390503 () Bool)

(assert (=> b!394055 m!390503))

(assert (=> b!394050 m!390493))

(assert (=> b!394050 m!390493))

(declare-fun m!390505 () Bool)

(assert (=> b!394050 m!390505))

(assert (=> b!394056 m!390493))

(assert (=> b!394056 m!390493))

(assert (=> b!394056 m!390497))

(assert (=> b!394057 m!390483))

(assert (=> b!394057 m!390489))

(assert (=> b!394057 m!390483))

(assert (=> b!394057 m!390489))

(assert (=> b!394057 m!390491))

(assert (=> b!394057 m!390493))

(assert (=> b!394057 m!390493))

(declare-fun m!390507 () Bool)

(assert (=> b!394057 m!390507))

(assert (=> b!393955 d!73247))

(declare-fun b!394061 () Bool)

(declare-fun lt!186618 () Unit!12046)

(declare-fun lt!186615 () Unit!12046)

(assert (=> b!394061 (= lt!186618 lt!186615)))

(declare-fun lt!186614 () ListLongMap!5541)

(declare-fun lt!186619 () V!14077)

(declare-fun lt!186616 () (_ BitVec 64))

(declare-fun lt!186613 () (_ BitVec 64))

(assert (=> b!394061 (not (contains!2474 (+!1079 lt!186614 (tuple2!6629 lt!186616 lt!186619)) lt!186613))))

(assert (=> b!394061 (= lt!186615 (addStillNotContains!141 lt!186614 lt!186616 lt!186619 lt!186613))))

(assert (=> b!394061 (= lt!186613 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!394061 (= lt!186619 (get!5624 (select (arr!11140 lt!186559) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!394061 (= lt!186616 (select (arr!11141 lt!186555) #b00000000000000000000000000000000))))

(declare-fun call!27821 () ListLongMap!5541)

(assert (=> b!394061 (= lt!186614 call!27821)))

(declare-fun e!238549 () ListLongMap!5541)

(assert (=> b!394061 (= e!238549 (+!1079 call!27821 (tuple2!6629 (select (arr!11141 lt!186555) #b00000000000000000000000000000000) (get!5624 (select (arr!11140 lt!186559) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!394062 () Bool)

(declare-fun e!238553 () ListLongMap!5541)

(assert (=> b!394062 (= e!238553 e!238549)))

(declare-fun c!54502 () Bool)

(assert (=> b!394062 (= c!54502 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(declare-fun b!394064 () Bool)

(declare-fun e!238547 () Bool)

(declare-fun e!238552 () Bool)

(assert (=> b!394064 (= e!238547 e!238552)))

(assert (=> b!394064 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(declare-fun res!225828 () Bool)

(declare-fun lt!186617 () ListLongMap!5541)

(assert (=> b!394064 (= res!225828 (contains!2474 lt!186617 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(assert (=> b!394064 (=> (not res!225828) (not e!238552))))

(declare-fun b!394065 () Bool)

(declare-fun res!225829 () Bool)

(declare-fun e!238550 () Bool)

(assert (=> b!394065 (=> (not res!225829) (not e!238550))))

(assert (=> b!394065 (= res!225829 (not (contains!2474 lt!186617 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394066 () Bool)

(assert (=> b!394066 (= e!238549 call!27821)))

(declare-fun bm!27818 () Bool)

(assert (=> bm!27818 (= call!27821 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!394067 () Bool)

(declare-fun e!238548 () Bool)

(assert (=> b!394067 (= e!238547 e!238548)))

(declare-fun c!54504 () Bool)

(assert (=> b!394067 (= c!54504 (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(declare-fun b!394068 () Bool)

(assert (=> b!394068 (= e!238553 (ListLongMap!5542 Nil!6477))))

(declare-fun b!394069 () Bool)

(assert (=> b!394069 (= e!238548 (isEmpty!554 lt!186617))))

(declare-fun b!394070 () Bool)

(declare-fun e!238551 () Bool)

(assert (=> b!394070 (= e!238551 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(assert (=> b!394070 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!394071 () Bool)

(assert (=> b!394071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(assert (=> b!394071 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11492 lt!186559)))))

(assert (=> b!394071 (= e!238552 (= (apply!308 lt!186617 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)) (get!5624 (select (arr!11140 lt!186559) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!394072 () Bool)

(assert (=> b!394072 (= e!238550 e!238547)))

(declare-fun c!54501 () Bool)

(assert (=> b!394072 (= c!54501 e!238551)))

(declare-fun res!225826 () Bool)

(assert (=> b!394072 (=> (not res!225826) (not e!238551))))

(assert (=> b!394072 (= res!225826 (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(declare-fun d!73249 () Bool)

(assert (=> d!73249 e!238550))

(declare-fun res!225827 () Bool)

(assert (=> d!73249 (=> (not res!225827) (not e!238550))))

(assert (=> d!73249 (= res!225827 (not (contains!2474 lt!186617 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!73249 (= lt!186617 e!238553)))

(declare-fun c!54503 () Bool)

(assert (=> d!73249 (= c!54503 (bvsge #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(assert (=> d!73249 (validMask!0 mask!970)))

(assert (=> d!73249 (= (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186617)))

(declare-fun b!394063 () Bool)

(assert (=> b!394063 (= e!238548 (= lt!186617 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(assert (= (and d!73249 c!54503) b!394068))

(assert (= (and d!73249 (not c!54503)) b!394062))

(assert (= (and b!394062 c!54502) b!394061))

(assert (= (and b!394062 (not c!54502)) b!394066))

(assert (= (or b!394061 b!394066) bm!27818))

(assert (= (and d!73249 res!225827) b!394065))

(assert (= (and b!394065 res!225829) b!394072))

(assert (= (and b!394072 res!225826) b!394070))

(assert (= (and b!394072 c!54501) b!394064))

(assert (= (and b!394072 (not c!54501)) b!394067))

(assert (= (and b!394064 res!225828) b!394071))

(assert (= (and b!394067 c!54504) b!394063))

(assert (= (and b!394067 (not c!54504)) b!394069))

(declare-fun b_lambda!8795 () Bool)

(assert (=> (not b_lambda!8795) (not b!394061)))

(assert (=> b!394061 t!11656))

(declare-fun b_and!16439 () Bool)

(assert (= b_and!16437 (and (=> t!11656 result!5773) b_and!16439)))

(declare-fun b_lambda!8797 () Bool)

(assert (=> (not b_lambda!8797) (not b!394071)))

(assert (=> b!394071 t!11656))

(declare-fun b_and!16441 () Bool)

(assert (= b_and!16439 (and (=> t!11656 result!5773) b_and!16441)))

(declare-fun m!390509 () Bool)

(assert (=> b!394061 m!390509))

(declare-fun m!390511 () Bool)

(assert (=> b!394061 m!390511))

(declare-fun m!390513 () Bool)

(assert (=> b!394061 m!390513))

(declare-fun m!390515 () Bool)

(assert (=> b!394061 m!390515))

(declare-fun m!390517 () Bool)

(assert (=> b!394061 m!390517))

(assert (=> b!394061 m!390489))

(assert (=> b!394061 m!390513))

(assert (=> b!394061 m!390489))

(declare-fun m!390519 () Bool)

(assert (=> b!394061 m!390519))

(assert (=> b!394061 m!390471))

(assert (=> b!394061 m!390509))

(declare-fun m!390521 () Bool)

(assert (=> d!73249 m!390521))

(assert (=> d!73249 m!390425))

(assert (=> b!394062 m!390471))

(assert (=> b!394062 m!390471))

(assert (=> b!394062 m!390473))

(declare-fun m!390523 () Bool)

(assert (=> b!394065 m!390523))

(declare-fun m!390525 () Bool)

(assert (=> b!394063 m!390525))

(assert (=> bm!27818 m!390525))

(declare-fun m!390527 () Bool)

(assert (=> b!394069 m!390527))

(assert (=> b!394064 m!390471))

(assert (=> b!394064 m!390471))

(declare-fun m!390529 () Bool)

(assert (=> b!394064 m!390529))

(assert (=> b!394070 m!390471))

(assert (=> b!394070 m!390471))

(assert (=> b!394070 m!390473))

(assert (=> b!394071 m!390513))

(assert (=> b!394071 m!390489))

(assert (=> b!394071 m!390513))

(assert (=> b!394071 m!390489))

(assert (=> b!394071 m!390519))

(assert (=> b!394071 m!390471))

(assert (=> b!394071 m!390471))

(declare-fun m!390531 () Bool)

(assert (=> b!394071 m!390531))

(assert (=> b!393955 d!73249))

(declare-fun b!394079 () Bool)

(declare-fun e!238558 () Bool)

(declare-fun call!27826 () ListLongMap!5541)

(declare-fun call!27827 () ListLongMap!5541)

(assert (=> b!394079 (= e!238558 (= call!27826 call!27827))))

(declare-fun b!394080 () Bool)

(declare-fun e!238559 () Bool)

(assert (=> b!394080 (= e!238559 e!238558)))

(declare-fun c!54507 () Bool)

(assert (=> b!394080 (= c!54507 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun d!73251 () Bool)

(assert (=> d!73251 e!238559))

(declare-fun res!225832 () Bool)

(assert (=> d!73251 (=> (not res!225832) (not e!238559))))

(assert (=> d!73251 (= res!225832 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11493 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11492 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11493 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11492 _values!506))))))))

(declare-fun lt!186622 () Unit!12046)

(declare-fun choose!1323 (array!23367 array!23365 (_ BitVec 32) (_ BitVec 32) V!14077 V!14077 (_ BitVec 32) (_ BitVec 64) V!14077 (_ BitVec 32) Int) Unit!12046)

(assert (=> d!73251 (= lt!186622 (choose!1323 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73251 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(assert (=> d!73251 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!289 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!186622)))

(declare-fun bm!27823 () Bool)

(assert (=> bm!27823 (= call!27826 (getCurrentListMapNoExtraKeys!1005 (array!23368 (store (arr!11141 _keys!658) i!548 k0!778) (size!11493 _keys!658)) (array!23366 (store (arr!11140 _values!506) i!548 (ValueCellFull!4521 v!373)) (size!11492 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394081 () Bool)

(assert (=> b!394081 (= e!238558 (= call!27826 (+!1079 call!27827 (tuple2!6629 k0!778 v!373))))))

(declare-fun bm!27824 () Bool)

(assert (=> bm!27824 (= call!27827 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!73251 res!225832) b!394080))

(assert (= (and b!394080 c!54507) b!394081))

(assert (= (and b!394080 (not c!54507)) b!394079))

(assert (= (or b!394081 b!394079) bm!27824))

(assert (= (or b!394081 b!394079) bm!27823))

(declare-fun m!390533 () Bool)

(assert (=> d!73251 m!390533))

(assert (=> bm!27823 m!390409))

(assert (=> bm!27823 m!390421))

(declare-fun m!390535 () Bool)

(assert (=> bm!27823 m!390535))

(declare-fun m!390537 () Bool)

(assert (=> b!394081 m!390537))

(assert (=> bm!27824 m!390411))

(assert (=> b!393955 d!73251))

(declare-fun b!394124 () Bool)

(declare-fun e!238589 () ListLongMap!5541)

(declare-fun call!27843 () ListLongMap!5541)

(assert (=> b!394124 (= e!238589 call!27843)))

(declare-fun b!394125 () Bool)

(declare-fun e!238593 () ListLongMap!5541)

(assert (=> b!394125 (= e!238593 e!238589)))

(declare-fun c!54522 () Bool)

(assert (=> b!394125 (= c!54522 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!394126 () Bool)

(declare-fun e!238588 () Unit!12046)

(declare-fun Unit!12048 () Unit!12046)

(assert (=> b!394126 (= e!238588 Unit!12048)))

(declare-fun b!394127 () Bool)

(declare-fun e!238594 () Bool)

(declare-fun e!238595 () Bool)

(assert (=> b!394127 (= e!238594 e!238595)))

(declare-fun res!225858 () Bool)

(assert (=> b!394127 (=> (not res!225858) (not e!238595))))

(declare-fun lt!186677 () ListLongMap!5541)

(assert (=> b!394127 (= res!225858 (contains!2474 lt!186677 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(assert (=> b!394127 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(declare-fun bm!27839 () Bool)

(declare-fun call!27846 () ListLongMap!5541)

(declare-fun call!27842 () ListLongMap!5541)

(assert (=> bm!27839 (= call!27846 call!27842)))

(declare-fun b!394128 () Bool)

(declare-fun e!238598 () Bool)

(declare-fun e!238591 () Bool)

(assert (=> b!394128 (= e!238598 e!238591)))

(declare-fun res!225853 () Bool)

(declare-fun call!27844 () Bool)

(assert (=> b!394128 (= res!225853 call!27844)))

(assert (=> b!394128 (=> (not res!225853) (not e!238591))))

(declare-fun b!394129 () Bool)

(assert (=> b!394129 (= e!238591 (= (apply!308 lt!186677 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27840 () Bool)

(declare-fun call!27848 () ListLongMap!5541)

(declare-fun c!54521 () Bool)

(declare-fun call!27845 () ListLongMap!5541)

(assert (=> bm!27840 (= call!27848 (+!1079 (ite c!54521 call!27842 (ite c!54522 call!27846 call!27845)) (ite (or c!54521 c!54522) (tuple2!6629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!394130 () Bool)

(declare-fun e!238597 () Bool)

(declare-fun e!238596 () Bool)

(assert (=> b!394130 (= e!238597 e!238596)))

(declare-fun res!225857 () Bool)

(declare-fun call!27847 () Bool)

(assert (=> b!394130 (= res!225857 call!27847)))

(assert (=> b!394130 (=> (not res!225857) (not e!238596))))

(declare-fun b!394131 () Bool)

(declare-fun e!238592 () Bool)

(assert (=> b!394131 (= e!238592 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(declare-fun b!394132 () Bool)

(declare-fun lt!186667 () Unit!12046)

(assert (=> b!394132 (= e!238588 lt!186667)))

(declare-fun lt!186682 () ListLongMap!5541)

(assert (=> b!394132 (= lt!186682 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186681 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186669 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186669 (select (arr!11141 lt!186555) #b00000000000000000000000000000000))))

(declare-fun lt!186675 () Unit!12046)

(declare-fun addStillContains!284 (ListLongMap!5541 (_ BitVec 64) V!14077 (_ BitVec 64)) Unit!12046)

(assert (=> b!394132 (= lt!186675 (addStillContains!284 lt!186682 lt!186681 zeroValue!472 lt!186669))))

(assert (=> b!394132 (contains!2474 (+!1079 lt!186682 (tuple2!6629 lt!186681 zeroValue!472)) lt!186669)))

(declare-fun lt!186673 () Unit!12046)

(assert (=> b!394132 (= lt!186673 lt!186675)))

(declare-fun lt!186670 () ListLongMap!5541)

(assert (=> b!394132 (= lt!186670 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186672 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186672 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186678 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186678 (select (arr!11141 lt!186555) #b00000000000000000000000000000000))))

(declare-fun lt!186686 () Unit!12046)

(declare-fun addApplyDifferent!284 (ListLongMap!5541 (_ BitVec 64) V!14077 (_ BitVec 64)) Unit!12046)

(assert (=> b!394132 (= lt!186686 (addApplyDifferent!284 lt!186670 lt!186672 minValue!472 lt!186678))))

(assert (=> b!394132 (= (apply!308 (+!1079 lt!186670 (tuple2!6629 lt!186672 minValue!472)) lt!186678) (apply!308 lt!186670 lt!186678))))

(declare-fun lt!186680 () Unit!12046)

(assert (=> b!394132 (= lt!186680 lt!186686)))

(declare-fun lt!186676 () ListLongMap!5541)

(assert (=> b!394132 (= lt!186676 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186679 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186671 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186671 (select (arr!11141 lt!186555) #b00000000000000000000000000000000))))

(declare-fun lt!186668 () Unit!12046)

(assert (=> b!394132 (= lt!186668 (addApplyDifferent!284 lt!186676 lt!186679 zeroValue!472 lt!186671))))

(assert (=> b!394132 (= (apply!308 (+!1079 lt!186676 (tuple2!6629 lt!186679 zeroValue!472)) lt!186671) (apply!308 lt!186676 lt!186671))))

(declare-fun lt!186685 () Unit!12046)

(assert (=> b!394132 (= lt!186685 lt!186668)))

(declare-fun lt!186688 () ListLongMap!5541)

(assert (=> b!394132 (= lt!186688 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186687 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186687 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186683 () (_ BitVec 64))

(assert (=> b!394132 (= lt!186683 (select (arr!11141 lt!186555) #b00000000000000000000000000000000))))

(assert (=> b!394132 (= lt!186667 (addApplyDifferent!284 lt!186688 lt!186687 minValue!472 lt!186683))))

(assert (=> b!394132 (= (apply!308 (+!1079 lt!186688 (tuple2!6629 lt!186687 minValue!472)) lt!186683) (apply!308 lt!186688 lt!186683))))

(declare-fun b!394133 () Bool)

(assert (=> b!394133 (= e!238595 (= (apply!308 lt!186677 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)) (get!5624 (select (arr!11140 lt!186559) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!394133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11492 lt!186559)))))

(assert (=> b!394133 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(declare-fun b!394134 () Bool)

(declare-fun e!238586 () Bool)

(assert (=> b!394134 (= e!238586 e!238598)))

(declare-fun c!54525 () Bool)

(assert (=> b!394134 (= c!54525 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!394135 () Bool)

(assert (=> b!394135 (= e!238598 (not call!27844))))

(declare-fun b!394136 () Bool)

(assert (=> b!394136 (= e!238596 (= (apply!308 lt!186677 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27841 () Bool)

(assert (=> bm!27841 (= call!27842 (getCurrentListMapNoExtraKeys!1005 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394137 () Bool)

(declare-fun res!225851 () Bool)

(assert (=> b!394137 (=> (not res!225851) (not e!238586))))

(assert (=> b!394137 (= res!225851 e!238597)))

(declare-fun c!54520 () Bool)

(assert (=> b!394137 (= c!54520 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!394138 () Bool)

(declare-fun res!225855 () Bool)

(assert (=> b!394138 (=> (not res!225855) (not e!238586))))

(assert (=> b!394138 (= res!225855 e!238594)))

(declare-fun res!225854 () Bool)

(assert (=> b!394138 (=> res!225854 e!238594)))

(assert (=> b!394138 (= res!225854 (not e!238592))))

(declare-fun res!225856 () Bool)

(assert (=> b!394138 (=> (not res!225856) (not e!238592))))

(assert (=> b!394138 (= res!225856 (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(declare-fun bm!27842 () Bool)

(assert (=> bm!27842 (= call!27845 call!27846)))

(declare-fun b!394139 () Bool)

(declare-fun e!238587 () ListLongMap!5541)

(assert (=> b!394139 (= e!238587 call!27843)))

(declare-fun b!394140 () Bool)

(declare-fun e!238590 () Bool)

(assert (=> b!394140 (= e!238590 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(declare-fun bm!27843 () Bool)

(assert (=> bm!27843 (= call!27847 (contains!2474 lt!186677 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27844 () Bool)

(assert (=> bm!27844 (= call!27843 call!27848)))

(declare-fun b!394141 () Bool)

(assert (=> b!394141 (= e!238593 (+!1079 call!27848 (tuple2!6629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!394142 () Bool)

(assert (=> b!394142 (= e!238587 call!27845)))

(declare-fun bm!27845 () Bool)

(assert (=> bm!27845 (= call!27844 (contains!2474 lt!186677 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394143 () Bool)

(declare-fun c!54523 () Bool)

(assert (=> b!394143 (= c!54523 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!394143 (= e!238589 e!238587)))

(declare-fun d!73253 () Bool)

(assert (=> d!73253 e!238586))

(declare-fun res!225859 () Bool)

(assert (=> d!73253 (=> (not res!225859) (not e!238586))))

(assert (=> d!73253 (= res!225859 (or (bvsge #b00000000000000000000000000000000 (size!11493 lt!186555)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))))

(declare-fun lt!186674 () ListLongMap!5541)

(assert (=> d!73253 (= lt!186677 lt!186674)))

(declare-fun lt!186684 () Unit!12046)

(assert (=> d!73253 (= lt!186684 e!238588)))

(declare-fun c!54524 () Bool)

(assert (=> d!73253 (= c!54524 e!238590)))

(declare-fun res!225852 () Bool)

(assert (=> d!73253 (=> (not res!225852) (not e!238590))))

(assert (=> d!73253 (= res!225852 (bvslt #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(assert (=> d!73253 (= lt!186674 e!238593)))

(assert (=> d!73253 (= c!54521 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73253 (validMask!0 mask!970)))

(assert (=> d!73253 (= (getCurrentListMap!2125 lt!186555 lt!186559 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186677)))

(declare-fun b!394144 () Bool)

(assert (=> b!394144 (= e!238597 (not call!27847))))

(assert (= (and d!73253 c!54521) b!394141))

(assert (= (and d!73253 (not c!54521)) b!394125))

(assert (= (and b!394125 c!54522) b!394124))

(assert (= (and b!394125 (not c!54522)) b!394143))

(assert (= (and b!394143 c!54523) b!394139))

(assert (= (and b!394143 (not c!54523)) b!394142))

(assert (= (or b!394139 b!394142) bm!27842))

(assert (= (or b!394124 bm!27842) bm!27839))

(assert (= (or b!394124 b!394139) bm!27844))

(assert (= (or b!394141 bm!27839) bm!27841))

(assert (= (or b!394141 bm!27844) bm!27840))

(assert (= (and d!73253 res!225852) b!394140))

(assert (= (and d!73253 c!54524) b!394132))

(assert (= (and d!73253 (not c!54524)) b!394126))

(assert (= (and d!73253 res!225859) b!394138))

(assert (= (and b!394138 res!225856) b!394131))

(assert (= (and b!394138 (not res!225854)) b!394127))

(assert (= (and b!394127 res!225858) b!394133))

(assert (= (and b!394138 res!225855) b!394137))

(assert (= (and b!394137 c!54520) b!394130))

(assert (= (and b!394137 (not c!54520)) b!394144))

(assert (= (and b!394130 res!225857) b!394136))

(assert (= (or b!394130 b!394144) bm!27843))

(assert (= (and b!394137 res!225851) b!394134))

(assert (= (and b!394134 c!54525) b!394128))

(assert (= (and b!394134 (not c!54525)) b!394135))

(assert (= (and b!394128 res!225853) b!394129))

(assert (= (or b!394128 b!394135) bm!27845))

(declare-fun b_lambda!8799 () Bool)

(assert (=> (not b_lambda!8799) (not b!394133)))

(assert (=> b!394133 t!11656))

(declare-fun b_and!16443 () Bool)

(assert (= b_and!16441 (and (=> t!11656 result!5773) b_and!16443)))

(declare-fun m!390539 () Bool)

(assert (=> b!394136 m!390539))

(assert (=> b!394133 m!390513))

(assert (=> b!394133 m!390489))

(assert (=> b!394133 m!390519))

(assert (=> b!394133 m!390513))

(assert (=> b!394133 m!390489))

(assert (=> b!394133 m!390471))

(declare-fun m!390541 () Bool)

(assert (=> b!394133 m!390541))

(assert (=> b!394133 m!390471))

(assert (=> b!394127 m!390471))

(assert (=> b!394127 m!390471))

(declare-fun m!390543 () Bool)

(assert (=> b!394127 m!390543))

(declare-fun m!390545 () Bool)

(assert (=> b!394129 m!390545))

(declare-fun m!390547 () Bool)

(assert (=> bm!27845 m!390547))

(assert (=> bm!27841 m!390413))

(assert (=> b!394140 m!390471))

(assert (=> b!394140 m!390471))

(assert (=> b!394140 m!390473))

(declare-fun m!390549 () Bool)

(assert (=> b!394132 m!390549))

(declare-fun m!390551 () Bool)

(assert (=> b!394132 m!390551))

(assert (=> b!394132 m!390551))

(declare-fun m!390553 () Bool)

(assert (=> b!394132 m!390553))

(declare-fun m!390555 () Bool)

(assert (=> b!394132 m!390555))

(declare-fun m!390557 () Bool)

(assert (=> b!394132 m!390557))

(declare-fun m!390559 () Bool)

(assert (=> b!394132 m!390559))

(assert (=> b!394132 m!390557))

(declare-fun m!390561 () Bool)

(assert (=> b!394132 m!390561))

(declare-fun m!390563 () Bool)

(assert (=> b!394132 m!390563))

(declare-fun m!390565 () Bool)

(assert (=> b!394132 m!390565))

(declare-fun m!390567 () Bool)

(assert (=> b!394132 m!390567))

(declare-fun m!390569 () Bool)

(assert (=> b!394132 m!390569))

(assert (=> b!394132 m!390413))

(assert (=> b!394132 m!390567))

(declare-fun m!390571 () Bool)

(assert (=> b!394132 m!390571))

(assert (=> b!394132 m!390563))

(declare-fun m!390573 () Bool)

(assert (=> b!394132 m!390573))

(declare-fun m!390575 () Bool)

(assert (=> b!394132 m!390575))

(assert (=> b!394132 m!390471))

(declare-fun m!390577 () Bool)

(assert (=> b!394132 m!390577))

(declare-fun m!390579 () Bool)

(assert (=> b!394141 m!390579))

(declare-fun m!390581 () Bool)

(assert (=> bm!27843 m!390581))

(assert (=> b!394131 m!390471))

(assert (=> b!394131 m!390471))

(assert (=> b!394131 m!390473))

(declare-fun m!390583 () Bool)

(assert (=> bm!27840 m!390583))

(assert (=> d!73253 m!390425))

(assert (=> b!393955 d!73253))

(declare-fun d!73255 () Bool)

(declare-fun e!238601 () Bool)

(assert (=> d!73255 e!238601))

(declare-fun res!225865 () Bool)

(assert (=> d!73255 (=> (not res!225865) (not e!238601))))

(declare-fun lt!186698 () ListLongMap!5541)

(assert (=> d!73255 (= res!225865 (contains!2474 lt!186698 (_1!3325 lt!186556)))))

(declare-fun lt!186699 () List!6480)

(assert (=> d!73255 (= lt!186698 (ListLongMap!5542 lt!186699))))

(declare-fun lt!186700 () Unit!12046)

(declare-fun lt!186697 () Unit!12046)

(assert (=> d!73255 (= lt!186700 lt!186697)))

(declare-datatypes ((Option!372 0))(
  ( (Some!371 (v!7155 V!14077)) (None!370) )
))
(declare-fun getValueByKey!366 (List!6480 (_ BitVec 64)) Option!372)

(assert (=> d!73255 (= (getValueByKey!366 lt!186699 (_1!3325 lt!186556)) (Some!371 (_2!3325 lt!186556)))))

(declare-fun lemmaContainsTupThenGetReturnValue!188 (List!6480 (_ BitVec 64) V!14077) Unit!12046)

(assert (=> d!73255 (= lt!186697 (lemmaContainsTupThenGetReturnValue!188 lt!186699 (_1!3325 lt!186556) (_2!3325 lt!186556)))))

(declare-fun insertStrictlySorted!191 (List!6480 (_ BitVec 64) V!14077) List!6480)

(assert (=> d!73255 (= lt!186699 (insertStrictlySorted!191 (toList!2786 lt!186554) (_1!3325 lt!186556) (_2!3325 lt!186556)))))

(assert (=> d!73255 (= (+!1079 lt!186554 lt!186556) lt!186698)))

(declare-fun b!394149 () Bool)

(declare-fun res!225864 () Bool)

(assert (=> b!394149 (=> (not res!225864) (not e!238601))))

(assert (=> b!394149 (= res!225864 (= (getValueByKey!366 (toList!2786 lt!186698) (_1!3325 lt!186556)) (Some!371 (_2!3325 lt!186556))))))

(declare-fun b!394150 () Bool)

(declare-fun contains!2475 (List!6480 tuple2!6628) Bool)

(assert (=> b!394150 (= e!238601 (contains!2475 (toList!2786 lt!186698) lt!186556))))

(assert (= (and d!73255 res!225865) b!394149))

(assert (= (and b!394149 res!225864) b!394150))

(declare-fun m!390585 () Bool)

(assert (=> d!73255 m!390585))

(declare-fun m!390587 () Bool)

(assert (=> d!73255 m!390587))

(declare-fun m!390589 () Bool)

(assert (=> d!73255 m!390589))

(declare-fun m!390591 () Bool)

(assert (=> d!73255 m!390591))

(declare-fun m!390593 () Bool)

(assert (=> b!394149 m!390593))

(declare-fun m!390595 () Bool)

(assert (=> b!394150 m!390595))

(assert (=> b!393955 d!73255))

(declare-fun b!394151 () Bool)

(declare-fun e!238605 () ListLongMap!5541)

(declare-fun call!27850 () ListLongMap!5541)

(assert (=> b!394151 (= e!238605 call!27850)))

(declare-fun b!394152 () Bool)

(declare-fun e!238609 () ListLongMap!5541)

(assert (=> b!394152 (= e!238609 e!238605)))

(declare-fun c!54528 () Bool)

(assert (=> b!394152 (= c!54528 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!394153 () Bool)

(declare-fun e!238604 () Unit!12046)

(declare-fun Unit!12049 () Unit!12046)

(assert (=> b!394153 (= e!238604 Unit!12049)))

(declare-fun b!394154 () Bool)

(declare-fun e!238610 () Bool)

(declare-fun e!238611 () Bool)

(assert (=> b!394154 (= e!238610 e!238611)))

(declare-fun res!225873 () Bool)

(assert (=> b!394154 (=> (not res!225873) (not e!238611))))

(declare-fun lt!186711 () ListLongMap!5541)

(assert (=> b!394154 (= res!225873 (contains!2474 lt!186711 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!394154 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(declare-fun bm!27846 () Bool)

(declare-fun call!27853 () ListLongMap!5541)

(declare-fun call!27849 () ListLongMap!5541)

(assert (=> bm!27846 (= call!27853 call!27849)))

(declare-fun b!394155 () Bool)

(declare-fun e!238614 () Bool)

(declare-fun e!238607 () Bool)

(assert (=> b!394155 (= e!238614 e!238607)))

(declare-fun res!225868 () Bool)

(declare-fun call!27851 () Bool)

(assert (=> b!394155 (= res!225868 call!27851)))

(assert (=> b!394155 (=> (not res!225868) (not e!238607))))

(declare-fun b!394156 () Bool)

(assert (=> b!394156 (= e!238607 (= (apply!308 lt!186711 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun call!27855 () ListLongMap!5541)

(declare-fun bm!27847 () Bool)

(declare-fun call!27852 () ListLongMap!5541)

(declare-fun c!54527 () Bool)

(assert (=> bm!27847 (= call!27855 (+!1079 (ite c!54527 call!27849 (ite c!54528 call!27853 call!27852)) (ite (or c!54527 c!54528) (tuple2!6629 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!394157 () Bool)

(declare-fun e!238613 () Bool)

(declare-fun e!238612 () Bool)

(assert (=> b!394157 (= e!238613 e!238612)))

(declare-fun res!225872 () Bool)

(declare-fun call!27854 () Bool)

(assert (=> b!394157 (= res!225872 call!27854)))

(assert (=> b!394157 (=> (not res!225872) (not e!238612))))

(declare-fun b!394158 () Bool)

(declare-fun e!238608 () Bool)

(assert (=> b!394158 (= e!238608 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394159 () Bool)

(declare-fun lt!186701 () Unit!12046)

(assert (=> b!394159 (= e!238604 lt!186701)))

(declare-fun lt!186716 () ListLongMap!5541)

(assert (=> b!394159 (= lt!186716 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186715 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186715 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186703 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186703 (select (arr!11141 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186709 () Unit!12046)

(assert (=> b!394159 (= lt!186709 (addStillContains!284 lt!186716 lt!186715 zeroValue!472 lt!186703))))

(assert (=> b!394159 (contains!2474 (+!1079 lt!186716 (tuple2!6629 lt!186715 zeroValue!472)) lt!186703)))

(declare-fun lt!186707 () Unit!12046)

(assert (=> b!394159 (= lt!186707 lt!186709)))

(declare-fun lt!186704 () ListLongMap!5541)

(assert (=> b!394159 (= lt!186704 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186706 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186706 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186712 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186712 (select (arr!11141 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186720 () Unit!12046)

(assert (=> b!394159 (= lt!186720 (addApplyDifferent!284 lt!186704 lt!186706 minValue!472 lt!186712))))

(assert (=> b!394159 (= (apply!308 (+!1079 lt!186704 (tuple2!6629 lt!186706 minValue!472)) lt!186712) (apply!308 lt!186704 lt!186712))))

(declare-fun lt!186714 () Unit!12046)

(assert (=> b!394159 (= lt!186714 lt!186720)))

(declare-fun lt!186710 () ListLongMap!5541)

(assert (=> b!394159 (= lt!186710 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186713 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186713 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186705 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186705 (select (arr!11141 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186702 () Unit!12046)

(assert (=> b!394159 (= lt!186702 (addApplyDifferent!284 lt!186710 lt!186713 zeroValue!472 lt!186705))))

(assert (=> b!394159 (= (apply!308 (+!1079 lt!186710 (tuple2!6629 lt!186713 zeroValue!472)) lt!186705) (apply!308 lt!186710 lt!186705))))

(declare-fun lt!186719 () Unit!12046)

(assert (=> b!394159 (= lt!186719 lt!186702)))

(declare-fun lt!186722 () ListLongMap!5541)

(assert (=> b!394159 (= lt!186722 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186721 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186721 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!186717 () (_ BitVec 64))

(assert (=> b!394159 (= lt!186717 (select (arr!11141 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!394159 (= lt!186701 (addApplyDifferent!284 lt!186722 lt!186721 minValue!472 lt!186717))))

(assert (=> b!394159 (= (apply!308 (+!1079 lt!186722 (tuple2!6629 lt!186721 minValue!472)) lt!186717) (apply!308 lt!186722 lt!186717))))

(declare-fun b!394160 () Bool)

(assert (=> b!394160 (= e!238611 (= (apply!308 lt!186711 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)) (get!5624 (select (arr!11140 _values!506) #b00000000000000000000000000000000) (dynLambda!651 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!394160 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11492 _values!506)))))

(assert (=> b!394160 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(declare-fun b!394161 () Bool)

(declare-fun e!238602 () Bool)

(assert (=> b!394161 (= e!238602 e!238614)))

(declare-fun c!54531 () Bool)

(assert (=> b!394161 (= c!54531 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!394162 () Bool)

(assert (=> b!394162 (= e!238614 (not call!27851))))

(declare-fun b!394163 () Bool)

(assert (=> b!394163 (= e!238612 (= (apply!308 lt!186711 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27848 () Bool)

(assert (=> bm!27848 (= call!27849 (getCurrentListMapNoExtraKeys!1005 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394164 () Bool)

(declare-fun res!225866 () Bool)

(assert (=> b!394164 (=> (not res!225866) (not e!238602))))

(assert (=> b!394164 (= res!225866 e!238613)))

(declare-fun c!54526 () Bool)

(assert (=> b!394164 (= c!54526 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!394165 () Bool)

(declare-fun res!225870 () Bool)

(assert (=> b!394165 (=> (not res!225870) (not e!238602))))

(assert (=> b!394165 (= res!225870 e!238610)))

(declare-fun res!225869 () Bool)

(assert (=> b!394165 (=> res!225869 e!238610)))

(assert (=> b!394165 (= res!225869 (not e!238608))))

(declare-fun res!225871 () Bool)

(assert (=> b!394165 (=> (not res!225871) (not e!238608))))

(assert (=> b!394165 (= res!225871 (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(declare-fun bm!27849 () Bool)

(assert (=> bm!27849 (= call!27852 call!27853)))

(declare-fun b!394166 () Bool)

(declare-fun e!238603 () ListLongMap!5541)

(assert (=> b!394166 (= e!238603 call!27850)))

(declare-fun b!394167 () Bool)

(declare-fun e!238606 () Bool)

(assert (=> b!394167 (= e!238606 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27850 () Bool)

(assert (=> bm!27850 (= call!27854 (contains!2474 lt!186711 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27851 () Bool)

(assert (=> bm!27851 (= call!27850 call!27855)))

(declare-fun b!394168 () Bool)

(assert (=> b!394168 (= e!238609 (+!1079 call!27855 (tuple2!6629 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!394169 () Bool)

(assert (=> b!394169 (= e!238603 call!27852)))

(declare-fun bm!27852 () Bool)

(assert (=> bm!27852 (= call!27851 (contains!2474 lt!186711 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!394170 () Bool)

(declare-fun c!54529 () Bool)

(assert (=> b!394170 (= c!54529 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!394170 (= e!238605 e!238603)))

(declare-fun d!73257 () Bool)

(assert (=> d!73257 e!238602))

(declare-fun res!225874 () Bool)

(assert (=> d!73257 (=> (not res!225874) (not e!238602))))

(assert (=> d!73257 (= res!225874 (or (bvsge #b00000000000000000000000000000000 (size!11493 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))))

(declare-fun lt!186708 () ListLongMap!5541)

(assert (=> d!73257 (= lt!186711 lt!186708)))

(declare-fun lt!186718 () Unit!12046)

(assert (=> d!73257 (= lt!186718 e!238604)))

(declare-fun c!54530 () Bool)

(assert (=> d!73257 (= c!54530 e!238606)))

(declare-fun res!225867 () Bool)

(assert (=> d!73257 (=> (not res!225867) (not e!238606))))

(assert (=> d!73257 (= res!225867 (bvslt #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(assert (=> d!73257 (= lt!186708 e!238609)))

(assert (=> d!73257 (= c!54527 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73257 (validMask!0 mask!970)))

(assert (=> d!73257 (= (getCurrentListMap!2125 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!186711)))

(declare-fun b!394171 () Bool)

(assert (=> b!394171 (= e!238613 (not call!27854))))

(assert (= (and d!73257 c!54527) b!394168))

(assert (= (and d!73257 (not c!54527)) b!394152))

(assert (= (and b!394152 c!54528) b!394151))

(assert (= (and b!394152 (not c!54528)) b!394170))

(assert (= (and b!394170 c!54529) b!394166))

(assert (= (and b!394170 (not c!54529)) b!394169))

(assert (= (or b!394166 b!394169) bm!27849))

(assert (= (or b!394151 bm!27849) bm!27846))

(assert (= (or b!394151 b!394166) bm!27851))

(assert (= (or b!394168 bm!27846) bm!27848))

(assert (= (or b!394168 bm!27851) bm!27847))

(assert (= (and d!73257 res!225867) b!394167))

(assert (= (and d!73257 c!54530) b!394159))

(assert (= (and d!73257 (not c!54530)) b!394153))

(assert (= (and d!73257 res!225874) b!394165))

(assert (= (and b!394165 res!225871) b!394158))

(assert (= (and b!394165 (not res!225869)) b!394154))

(assert (= (and b!394154 res!225873) b!394160))

(assert (= (and b!394165 res!225870) b!394164))

(assert (= (and b!394164 c!54526) b!394157))

(assert (= (and b!394164 (not c!54526)) b!394171))

(assert (= (and b!394157 res!225872) b!394163))

(assert (= (or b!394157 b!394171) bm!27850))

(assert (= (and b!394164 res!225866) b!394161))

(assert (= (and b!394161 c!54531) b!394155))

(assert (= (and b!394161 (not c!54531)) b!394162))

(assert (= (and b!394155 res!225868) b!394156))

(assert (= (or b!394155 b!394162) bm!27852))

(declare-fun b_lambda!8801 () Bool)

(assert (=> (not b_lambda!8801) (not b!394160)))

(assert (=> b!394160 t!11656))

(declare-fun b_and!16445 () Bool)

(assert (= b_and!16443 (and (=> t!11656 result!5773) b_and!16445)))

(declare-fun m!390597 () Bool)

(assert (=> b!394163 m!390597))

(assert (=> b!394160 m!390483))

(assert (=> b!394160 m!390489))

(assert (=> b!394160 m!390491))

(assert (=> b!394160 m!390483))

(assert (=> b!394160 m!390489))

(assert (=> b!394160 m!390493))

(declare-fun m!390599 () Bool)

(assert (=> b!394160 m!390599))

(assert (=> b!394160 m!390493))

(assert (=> b!394154 m!390493))

(assert (=> b!394154 m!390493))

(declare-fun m!390601 () Bool)

(assert (=> b!394154 m!390601))

(declare-fun m!390603 () Bool)

(assert (=> b!394156 m!390603))

(declare-fun m!390605 () Bool)

(assert (=> bm!27852 m!390605))

(assert (=> bm!27848 m!390411))

(assert (=> b!394167 m!390493))

(assert (=> b!394167 m!390493))

(assert (=> b!394167 m!390497))

(declare-fun m!390607 () Bool)

(assert (=> b!394159 m!390607))

(declare-fun m!390609 () Bool)

(assert (=> b!394159 m!390609))

(assert (=> b!394159 m!390609))

(declare-fun m!390611 () Bool)

(assert (=> b!394159 m!390611))

(declare-fun m!390613 () Bool)

(assert (=> b!394159 m!390613))

(declare-fun m!390615 () Bool)

(assert (=> b!394159 m!390615))

(declare-fun m!390617 () Bool)

(assert (=> b!394159 m!390617))

(assert (=> b!394159 m!390615))

(declare-fun m!390619 () Bool)

(assert (=> b!394159 m!390619))

(declare-fun m!390621 () Bool)

(assert (=> b!394159 m!390621))

(declare-fun m!390623 () Bool)

(assert (=> b!394159 m!390623))

(declare-fun m!390625 () Bool)

(assert (=> b!394159 m!390625))

(declare-fun m!390627 () Bool)

(assert (=> b!394159 m!390627))

(assert (=> b!394159 m!390411))

(assert (=> b!394159 m!390625))

(declare-fun m!390629 () Bool)

(assert (=> b!394159 m!390629))

(assert (=> b!394159 m!390621))

(declare-fun m!390631 () Bool)

(assert (=> b!394159 m!390631))

(declare-fun m!390633 () Bool)

(assert (=> b!394159 m!390633))

(assert (=> b!394159 m!390493))

(declare-fun m!390635 () Bool)

(assert (=> b!394159 m!390635))

(declare-fun m!390637 () Bool)

(assert (=> b!394168 m!390637))

(declare-fun m!390639 () Bool)

(assert (=> bm!27850 m!390639))

(assert (=> b!394158 m!390493))

(assert (=> b!394158 m!390493))

(assert (=> b!394158 m!390497))

(declare-fun m!390641 () Bool)

(assert (=> bm!27847 m!390641))

(assert (=> d!73257 m!390425))

(assert (=> b!393955 d!73257))

(declare-fun d!73259 () Bool)

(declare-fun res!225879 () Bool)

(declare-fun e!238621 () Bool)

(assert (=> d!73259 (=> res!225879 e!238621)))

(assert (=> d!73259 (= res!225879 (bvsge #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(assert (=> d!73259 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!238621)))

(declare-fun b!394180 () Bool)

(declare-fun e!238622 () Bool)

(declare-fun call!27858 () Bool)

(assert (=> b!394180 (= e!238622 call!27858)))

(declare-fun b!394181 () Bool)

(assert (=> b!394181 (= e!238621 e!238622)))

(declare-fun c!54534 () Bool)

(assert (=> b!394181 (= c!54534 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394182 () Bool)

(declare-fun e!238623 () Bool)

(assert (=> b!394182 (= e!238623 call!27858)))

(declare-fun b!394183 () Bool)

(assert (=> b!394183 (= e!238622 e!238623)))

(declare-fun lt!186731 () (_ BitVec 64))

(assert (=> b!394183 (= lt!186731 (select (arr!11141 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!186729 () Unit!12046)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23367 (_ BitVec 64) (_ BitVec 32)) Unit!12046)

(assert (=> b!394183 (= lt!186729 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!186731 #b00000000000000000000000000000000))))

(assert (=> b!394183 (arrayContainsKey!0 _keys!658 lt!186731 #b00000000000000000000000000000000)))

(declare-fun lt!186730 () Unit!12046)

(assert (=> b!394183 (= lt!186730 lt!186729)))

(declare-fun res!225880 () Bool)

(declare-datatypes ((SeekEntryResult!3519 0))(
  ( (MissingZero!3519 (index!16255 (_ BitVec 32))) (Found!3519 (index!16256 (_ BitVec 32))) (Intermediate!3519 (undefined!4331 Bool) (index!16257 (_ BitVec 32)) (x!38513 (_ BitVec 32))) (Undefined!3519) (MissingVacant!3519 (index!16258 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23367 (_ BitVec 32)) SeekEntryResult!3519)

(assert (=> b!394183 (= res!225880 (= (seekEntryOrOpen!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3519 #b00000000000000000000000000000000)))))

(assert (=> b!394183 (=> (not res!225880) (not e!238623))))

(declare-fun bm!27855 () Bool)

(assert (=> bm!27855 (= call!27858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(assert (= (and d!73259 (not res!225879)) b!394181))

(assert (= (and b!394181 c!54534) b!394183))

(assert (= (and b!394181 (not c!54534)) b!394180))

(assert (= (and b!394183 res!225880) b!394182))

(assert (= (or b!394182 b!394180) bm!27855))

(assert (=> b!394181 m!390493))

(assert (=> b!394181 m!390493))

(assert (=> b!394181 m!390497))

(assert (=> b!394183 m!390493))

(declare-fun m!390643 () Bool)

(assert (=> b!394183 m!390643))

(declare-fun m!390645 () Bool)

(assert (=> b!394183 m!390645))

(assert (=> b!394183 m!390493))

(declare-fun m!390647 () Bool)

(assert (=> b!394183 m!390647))

(declare-fun m!390649 () Bool)

(assert (=> bm!27855 m!390649))

(assert (=> b!393959 d!73259))

(declare-fun d!73261 () Bool)

(declare-fun res!225881 () Bool)

(declare-fun e!238624 () Bool)

(assert (=> d!73261 (=> res!225881 e!238624)))

(assert (=> d!73261 (= res!225881 (bvsge #b00000000000000000000000000000000 (size!11493 lt!186555)))))

(assert (=> d!73261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186555 mask!970) e!238624)))

(declare-fun b!394184 () Bool)

(declare-fun e!238625 () Bool)

(declare-fun call!27859 () Bool)

(assert (=> b!394184 (= e!238625 call!27859)))

(declare-fun b!394185 () Bool)

(assert (=> b!394185 (= e!238624 e!238625)))

(declare-fun c!54535 () Bool)

(assert (=> b!394185 (= c!54535 (validKeyInArray!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000)))))

(declare-fun b!394186 () Bool)

(declare-fun e!238626 () Bool)

(assert (=> b!394186 (= e!238626 call!27859)))

(declare-fun b!394187 () Bool)

(assert (=> b!394187 (= e!238625 e!238626)))

(declare-fun lt!186734 () (_ BitVec 64))

(assert (=> b!394187 (= lt!186734 (select (arr!11141 lt!186555) #b00000000000000000000000000000000))))

(declare-fun lt!186732 () Unit!12046)

(assert (=> b!394187 (= lt!186732 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!186555 lt!186734 #b00000000000000000000000000000000))))

(assert (=> b!394187 (arrayContainsKey!0 lt!186555 lt!186734 #b00000000000000000000000000000000)))

(declare-fun lt!186733 () Unit!12046)

(assert (=> b!394187 (= lt!186733 lt!186732)))

(declare-fun res!225882 () Bool)

(assert (=> b!394187 (= res!225882 (= (seekEntryOrOpen!0 (select (arr!11141 lt!186555) #b00000000000000000000000000000000) lt!186555 mask!970) (Found!3519 #b00000000000000000000000000000000)))))

(assert (=> b!394187 (=> (not res!225882) (not e!238626))))

(declare-fun bm!27856 () Bool)

(assert (=> bm!27856 (= call!27859 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!186555 mask!970))))

(assert (= (and d!73261 (not res!225881)) b!394185))

(assert (= (and b!394185 c!54535) b!394187))

(assert (= (and b!394185 (not c!54535)) b!394184))

(assert (= (and b!394187 res!225882) b!394186))

(assert (= (or b!394186 b!394184) bm!27856))

(assert (=> b!394185 m!390471))

(assert (=> b!394185 m!390471))

(assert (=> b!394185 m!390473))

(assert (=> b!394187 m!390471))

(declare-fun m!390651 () Bool)

(assert (=> b!394187 m!390651))

(declare-fun m!390653 () Bool)

(assert (=> b!394187 m!390653))

(assert (=> b!394187 m!390471))

(declare-fun m!390655 () Bool)

(assert (=> b!394187 m!390655))

(declare-fun m!390657 () Bool)

(assert (=> bm!27856 m!390657))

(assert (=> b!393963 d!73261))

(declare-fun d!73263 () Bool)

(declare-fun res!225884 () Bool)

(declare-fun e!238629 () Bool)

(assert (=> d!73263 (=> res!225884 e!238629)))

(assert (=> d!73263 (= res!225884 (bvsge #b00000000000000000000000000000000 (size!11493 _keys!658)))))

(assert (=> d!73263 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6478) e!238629)))

(declare-fun b!394188 () Bool)

(declare-fun e!238628 () Bool)

(assert (=> b!394188 (= e!238629 e!238628)))

(declare-fun res!225883 () Bool)

(assert (=> b!394188 (=> (not res!225883) (not e!238628))))

(declare-fun e!238630 () Bool)

(assert (=> b!394188 (= res!225883 (not e!238630))))

(declare-fun res!225885 () Bool)

(assert (=> b!394188 (=> (not res!225885) (not e!238630))))

(assert (=> b!394188 (= res!225885 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394189 () Bool)

(declare-fun e!238627 () Bool)

(declare-fun call!27860 () Bool)

(assert (=> b!394189 (= e!238627 call!27860)))

(declare-fun b!394190 () Bool)

(assert (=> b!394190 (= e!238627 call!27860)))

(declare-fun bm!27857 () Bool)

(declare-fun c!54536 () Bool)

(assert (=> bm!27857 (= call!27860 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54536 (Cons!6477 (select (arr!11141 _keys!658) #b00000000000000000000000000000000) Nil!6478) Nil!6478)))))

(declare-fun b!394191 () Bool)

(assert (=> b!394191 (= e!238630 (contains!2473 Nil!6478 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!394192 () Bool)

(assert (=> b!394192 (= e!238628 e!238627)))

(assert (=> b!394192 (= c!54536 (validKeyInArray!0 (select (arr!11141 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73263 (not res!225884)) b!394188))

(assert (= (and b!394188 res!225885) b!394191))

(assert (= (and b!394188 res!225883) b!394192))

(assert (= (and b!394192 c!54536) b!394190))

(assert (= (and b!394192 (not c!54536)) b!394189))

(assert (= (or b!394190 b!394189) bm!27857))

(assert (=> b!394188 m!390493))

(assert (=> b!394188 m!390493))

(assert (=> b!394188 m!390497))

(assert (=> bm!27857 m!390493))

(declare-fun m!390659 () Bool)

(assert (=> bm!27857 m!390659))

(assert (=> b!394191 m!390493))

(assert (=> b!394191 m!390493))

(declare-fun m!390661 () Bool)

(assert (=> b!394191 m!390661))

(assert (=> b!394192 m!390493))

(assert (=> b!394192 m!390493))

(assert (=> b!394192 m!390497))

(assert (=> b!393962 d!73263))

(declare-fun d!73265 () Bool)

(assert (=> d!73265 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38198 d!73265))

(declare-fun d!73267 () Bool)

(assert (=> d!73267 (= (array_inv!8180 _values!506) (bvsge (size!11492 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38198 d!73267))

(declare-fun d!73269 () Bool)

(assert (=> d!73269 (= (array_inv!8181 _keys!658) (bvsge (size!11493 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38198 d!73269))

(declare-fun d!73271 () Bool)

(assert (=> d!73271 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!393960 d!73271))

(declare-fun d!73273 () Bool)

(declare-fun e!238631 () Bool)

(assert (=> d!73273 e!238631))

(declare-fun res!225887 () Bool)

(assert (=> d!73273 (=> (not res!225887) (not e!238631))))

(declare-fun lt!186736 () ListLongMap!5541)

(assert (=> d!73273 (= res!225887 (contains!2474 lt!186736 (_1!3325 lt!186556)))))

(declare-fun lt!186737 () List!6480)

(assert (=> d!73273 (= lt!186736 (ListLongMap!5542 lt!186737))))

(declare-fun lt!186738 () Unit!12046)

(declare-fun lt!186735 () Unit!12046)

(assert (=> d!73273 (= lt!186738 lt!186735)))

(assert (=> d!73273 (= (getValueByKey!366 lt!186737 (_1!3325 lt!186556)) (Some!371 (_2!3325 lt!186556)))))

(assert (=> d!73273 (= lt!186735 (lemmaContainsTupThenGetReturnValue!188 lt!186737 (_1!3325 lt!186556) (_2!3325 lt!186556)))))

(assert (=> d!73273 (= lt!186737 (insertStrictlySorted!191 (toList!2786 lt!186560) (_1!3325 lt!186556) (_2!3325 lt!186556)))))

(assert (=> d!73273 (= (+!1079 lt!186560 lt!186556) lt!186736)))

(declare-fun b!394193 () Bool)

(declare-fun res!225886 () Bool)

(assert (=> b!394193 (=> (not res!225886) (not e!238631))))

(assert (=> b!394193 (= res!225886 (= (getValueByKey!366 (toList!2786 lt!186736) (_1!3325 lt!186556)) (Some!371 (_2!3325 lt!186556))))))

(declare-fun b!394194 () Bool)

(assert (=> b!394194 (= e!238631 (contains!2475 (toList!2786 lt!186736) lt!186556))))

(assert (= (and d!73273 res!225887) b!394193))

(assert (= (and b!394193 res!225886) b!394194))

(declare-fun m!390663 () Bool)

(assert (=> d!73273 m!390663))

(declare-fun m!390665 () Bool)

(assert (=> d!73273 m!390665))

(declare-fun m!390667 () Bool)

(assert (=> d!73273 m!390667))

(declare-fun m!390669 () Bool)

(assert (=> d!73273 m!390669))

(declare-fun m!390671 () Bool)

(assert (=> b!394193 m!390671))

(declare-fun m!390673 () Bool)

(assert (=> b!394194 m!390673))

(assert (=> b!393952 d!73273))

(declare-fun d!73275 () Bool)

(declare-fun res!225892 () Bool)

(declare-fun e!238636 () Bool)

(assert (=> d!73275 (=> res!225892 e!238636)))

(assert (=> d!73275 (= res!225892 (= (select (arr!11141 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73275 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!238636)))

(declare-fun b!394199 () Bool)

(declare-fun e!238637 () Bool)

(assert (=> b!394199 (= e!238636 e!238637)))

(declare-fun res!225893 () Bool)

(assert (=> b!394199 (=> (not res!225893) (not e!238637))))

(assert (=> b!394199 (= res!225893 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11493 _keys!658)))))

(declare-fun b!394200 () Bool)

(assert (=> b!394200 (= e!238637 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73275 (not res!225892)) b!394199))

(assert (= (and b!394199 res!225893) b!394200))

(assert (=> d!73275 m!390493))

(declare-fun m!390675 () Bool)

(assert (=> b!394200 m!390675))

(assert (=> b!393956 d!73275))

(declare-fun condMapEmpty!16197 () Bool)

(declare-fun mapDefault!16197 () ValueCell!4521)

(assert (=> mapNonEmpty!16191 (= condMapEmpty!16197 (= mapRest!16191 ((as const (Array (_ BitVec 32) ValueCell!4521)) mapDefault!16197)))))

(declare-fun e!238643 () Bool)

(declare-fun mapRes!16197 () Bool)

(assert (=> mapNonEmpty!16191 (= tp!31956 (and e!238643 mapRes!16197))))

(declare-fun mapIsEmpty!16197 () Bool)

(assert (=> mapIsEmpty!16197 mapRes!16197))

(declare-fun mapNonEmpty!16197 () Bool)

(declare-fun tp!31965 () Bool)

(declare-fun e!238642 () Bool)

(assert (=> mapNonEmpty!16197 (= mapRes!16197 (and tp!31965 e!238642))))

(declare-fun mapValue!16197 () ValueCell!4521)

(declare-fun mapRest!16197 () (Array (_ BitVec 32) ValueCell!4521))

(declare-fun mapKey!16197 () (_ BitVec 32))

(assert (=> mapNonEmpty!16197 (= mapRest!16191 (store mapRest!16197 mapKey!16197 mapValue!16197))))

(declare-fun b!394207 () Bool)

(assert (=> b!394207 (= e!238642 tp_is_empty!9729)))

(declare-fun b!394208 () Bool)

(assert (=> b!394208 (= e!238643 tp_is_empty!9729)))

(assert (= (and mapNonEmpty!16191 condMapEmpty!16197) mapIsEmpty!16197))

(assert (= (and mapNonEmpty!16191 (not condMapEmpty!16197)) mapNonEmpty!16197))

(assert (= (and mapNonEmpty!16197 ((_ is ValueCellFull!4521) mapValue!16197)) b!394207))

(assert (= (and mapNonEmpty!16191 ((_ is ValueCellFull!4521) mapDefault!16197)) b!394208))

(declare-fun m!390677 () Bool)

(assert (=> mapNonEmpty!16197 m!390677))

(declare-fun b_lambda!8803 () Bool)

(assert (= b_lambda!8795 (or (and start!38198 b_free!9057) b_lambda!8803)))

(declare-fun b_lambda!8805 () Bool)

(assert (= b_lambda!8791 (or (and start!38198 b_free!9057) b_lambda!8805)))

(declare-fun b_lambda!8807 () Bool)

(assert (= b_lambda!8801 (or (and start!38198 b_free!9057) b_lambda!8807)))

(declare-fun b_lambda!8809 () Bool)

(assert (= b_lambda!8793 (or (and start!38198 b_free!9057) b_lambda!8809)))

(declare-fun b_lambda!8811 () Bool)

(assert (= b_lambda!8799 (or (and start!38198 b_free!9057) b_lambda!8811)))

(declare-fun b_lambda!8813 () Bool)

(assert (= b_lambda!8797 (or (and start!38198 b_free!9057) b_lambda!8813)))

(check-sat (not b_lambda!8811) (not b!394149) (not b!394018) (not b!394158) (not b!394133) (not b!394193) (not b!394048) (not b!394069) (not b!394062) (not bm!27814) (not b!394154) (not b!394021) (not b!394150) (not bm!27817) (not b!394129) (not b!394057) (not b!394049) (not b!394188) (not bm!27818) (not bm!27856) (not b!394168) (not b!394192) (not bm!27840) (not b_lambda!8807) (not b!394047) (not bm!27845) (not d!73255) (not b_lambda!8813) (not d!73247) b_and!16445 (not bm!27850) (not b_lambda!8803) (not b!394141) (not bm!27852) (not b!394127) (not b!394200) (not b!394156) (not bm!27847) (not b!394055) (not b!394051) (not d!73253) (not b!394063) (not b!394187) (not b!394194) (not b!394056) (not bm!27848) (not bm!27855) (not b!394183) (not b!394163) (not d!73257) (not b!394071) (not b!394131) (not b!394185) (not b!394132) (not b!394136) (not b_lambda!8805) (not b!394159) (not bm!27823) (not b!394050) (not b!394065) (not bm!27841) (not b_lambda!8809) (not b!394081) (not d!73251) (not b!394160) (not d!73273) (not b!394070) tp_is_empty!9729 (not b_next!9057) (not b!394167) (not b!394022) (not b!394191) (not mapNonEmpty!16197) (not d!73249) (not bm!27857) (not bm!27843) (not b!394061) (not b!394140) (not bm!27824) (not b!394181) (not b!394064))
(check-sat b_and!16445 (not b_next!9057))
