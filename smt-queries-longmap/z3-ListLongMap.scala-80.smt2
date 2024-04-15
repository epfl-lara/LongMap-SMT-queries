; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1114 () Bool)

(assert start!1114)

(declare-fun b_free!385 () Bool)

(declare-fun b_next!385 () Bool)

(assert (=> start!1114 (= b_free!385 (not b_next!385))))

(declare-fun tp!1400 () Bool)

(declare-fun b_and!541 () Bool)

(assert (=> start!1114 (= tp!1400 b_and!541)))

(declare-fun mapNonEmpty!680 () Bool)

(declare-fun mapRes!680 () Bool)

(declare-fun tp!1399 () Bool)

(declare-fun e!5629 () Bool)

(assert (=> mapNonEmpty!680 (= mapRes!680 (and tp!1399 e!5629))))

(declare-datatypes ((V!795 0))(
  ( (V!796 (val!237 Int)) )
))
(declare-datatypes ((ValueCell!215 0))(
  ( (ValueCellFull!215 (v!1333 V!795)) (EmptyCell!215) )
))
(declare-fun mapValue!680 () ValueCell!215)

(declare-fun mapKey!680 () (_ BitVec 32))

(declare-datatypes ((array!843 0))(
  ( (array!844 (arr!405 (Array (_ BitVec 32) ValueCell!215)) (size!467 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!843)

(declare-fun mapRest!680 () (Array (_ BitVec 32) ValueCell!215))

(assert (=> mapNonEmpty!680 (= (arr!405 _values!1492) (store mapRest!680 mapKey!680 mapValue!680))))

(declare-fun b!9816 () Bool)

(declare-fun e!5626 () Bool)

(declare-datatypes ((array!845 0))(
  ( (array!846 (arr!406 (Array (_ BitVec 32) (_ BitVec 64))) (size!468 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!845)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!9816 (= e!5626 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!9817 () Bool)

(declare-fun res!8684 () Bool)

(declare-fun e!5630 () Bool)

(assert (=> b!9817 (=> (not res!8684) (not e!5630))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!795)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!795)

(declare-datatypes ((tuple2!274 0))(
  ( (tuple2!275 (_1!137 (_ BitVec 64)) (_2!137 V!795)) )
))
(declare-datatypes ((List!286 0))(
  ( (Nil!283) (Cons!282 (h!848 tuple2!274) (t!2431 List!286)) )
))
(declare-datatypes ((ListLongMap!279 0))(
  ( (ListLongMap!280 (toList!155 List!286)) )
))
(declare-fun contains!134 (ListLongMap!279 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!114 (array!845 array!843 (_ BitVec 32) (_ BitVec 32) V!795 V!795 (_ BitVec 32) Int) ListLongMap!279)

(assert (=> b!9817 (= res!8684 (contains!134 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!9818 () Bool)

(declare-fun res!8683 () Bool)

(assert (=> b!9818 (=> (not res!8683) (not e!5630))))

(declare-datatypes ((List!287 0))(
  ( (Nil!284) (Cons!283 (h!849 (_ BitVec 64)) (t!2432 List!287)) )
))
(declare-fun arrayNoDuplicates!0 (array!845 (_ BitVec 32) List!287) Bool)

(assert (=> b!9818 (= res!8683 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!284))))

(declare-fun b!9819 () Bool)

(declare-fun res!8690 () Bool)

(assert (=> b!9819 (=> (not res!8690) (not e!5630))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!9819 (= res!8690 (validKeyInArray!0 k0!1278))))

(declare-datatypes ((SeekEntryResult!39 0))(
  ( (MissingZero!39 (index!2275 (_ BitVec 32))) (Found!39 (index!2276 (_ BitVec 32))) (Intermediate!39 (undefined!851 Bool) (index!2277 (_ BitVec 32)) (x!2819 (_ BitVec 32))) (Undefined!39) (MissingVacant!39 (index!2278 (_ BitVec 32))) )
))
(declare-fun lt!2318 () SeekEntryResult!39)

(declare-fun b!9820 () Bool)

(declare-fun e!5631 () Bool)

(assert (=> b!9820 (= e!5631 (= (select (arr!406 _keys!1806) (index!2276 lt!2318)) k0!1278))))

(declare-fun b!9821 () Bool)

(declare-fun e!5627 () Bool)

(assert (=> b!9821 (= e!5627 e!5631)))

(declare-fun res!8693 () Bool)

(assert (=> b!9821 (=> (not res!8693) (not e!5631))))

(get-info :version)

(assert (=> b!9821 (= res!8693 ((_ is Found!39) lt!2318))))

(declare-fun lt!2316 () (_ BitVec 32))

(assert (=> b!9821 (and ((_ is Found!39) lt!2318) (= (index!2276 lt!2318) lt!2316))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!845 (_ BitVec 32)) SeekEntryResult!39)

(assert (=> b!9821 (= lt!2318 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!213 0))(
  ( (Unit!214) )
))
(declare-fun lt!2315 () Unit!213)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!845 (_ BitVec 32)) Unit!213)

(assert (=> b!9821 (= lt!2315 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2316 _keys!1806 mask!2250))))

(declare-fun b!9822 () Bool)

(declare-fun e!5632 () Bool)

(assert (=> b!9822 (= e!5630 (not e!5632))))

(declare-fun res!8689 () Bool)

(assert (=> b!9822 (=> res!8689 e!5632)))

(assert (=> b!9822 (= res!8689 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!9822 e!5626))

(declare-fun c!820 () Bool)

(assert (=> b!9822 (= c!820 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2317 () Unit!213)

(declare-fun lemmaKeyInListMapIsInArray!81 (array!845 array!843 (_ BitVec 32) (_ BitVec 32) V!795 V!795 (_ BitVec 64) Int) Unit!213)

(assert (=> b!9822 (= lt!2317 (lemmaKeyInListMapIsInArray!81 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!9823 () Bool)

(declare-fun e!5633 () Bool)

(declare-fun tp_is_empty!463 () Bool)

(assert (=> b!9823 (= e!5633 tp_is_empty!463)))

(declare-fun mapIsEmpty!680 () Bool)

(assert (=> mapIsEmpty!680 mapRes!680))

(declare-fun b!9824 () Bool)

(declare-fun res!8687 () Bool)

(assert (=> b!9824 (=> res!8687 e!5627)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!845 (_ BitVec 32)) SeekEntryResult!39)

(assert (=> b!9824 (= res!8687 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!39 lt!2316))))))

(declare-fun b!9825 () Bool)

(assert (=> b!9825 (= e!5626 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!9826 () Bool)

(declare-fun res!8692 () Bool)

(assert (=> b!9826 (=> (not res!8692) (not e!5630))))

(assert (=> b!9826 (= res!8692 (and (= (size!467 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!468 _keys!1806) (size!467 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!9827 () Bool)

(declare-fun e!5625 () Bool)

(assert (=> b!9827 (= e!5625 (and e!5633 mapRes!680))))

(declare-fun condMapEmpty!680 () Bool)

(declare-fun mapDefault!680 () ValueCell!215)

(assert (=> b!9827 (= condMapEmpty!680 (= (arr!405 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!215)) mapDefault!680)))))

(declare-fun b!9828 () Bool)

(declare-fun res!8691 () Bool)

(assert (=> b!9828 (=> (not res!8691) (not e!5631))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9828 (= res!8691 (inRange!0 (index!2276 lt!2318) mask!2250))))

(declare-fun b!9829 () Bool)

(assert (=> b!9829 (= e!5629 tp_is_empty!463)))

(declare-fun b!9830 () Bool)

(declare-fun res!8685 () Bool)

(assert (=> b!9830 (=> (not res!8685) (not e!5630))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!845 (_ BitVec 32)) Bool)

(assert (=> b!9830 (= res!8685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!9831 () Bool)

(assert (=> b!9831 (= e!5632 e!5627)))

(declare-fun res!8688 () Bool)

(assert (=> b!9831 (=> res!8688 e!5627)))

(assert (=> b!9831 (= res!8688 (not (= (size!468 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!9831 (arrayForallSeekEntryOrOpenFound!0 lt!2316 _keys!1806 mask!2250)))

(declare-fun lt!2319 () Unit!213)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!213)

(assert (=> b!9831 (= lt!2319 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2316))))

(declare-fun arrayScanForKey!0 (array!845 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!9831 (= lt!2316 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun res!8686 () Bool)

(assert (=> start!1114 (=> (not res!8686) (not e!5630))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1114 (= res!8686 (validMask!0 mask!2250))))

(assert (=> start!1114 e!5630))

(assert (=> start!1114 tp!1400))

(assert (=> start!1114 true))

(declare-fun array_inv!303 (array!843) Bool)

(assert (=> start!1114 (and (array_inv!303 _values!1492) e!5625)))

(assert (=> start!1114 tp_is_empty!463))

(declare-fun array_inv!304 (array!845) Bool)

(assert (=> start!1114 (array_inv!304 _keys!1806)))

(assert (= (and start!1114 res!8686) b!9826))

(assert (= (and b!9826 res!8692) b!9830))

(assert (= (and b!9830 res!8685) b!9818))

(assert (= (and b!9818 res!8683) b!9817))

(assert (= (and b!9817 res!8684) b!9819))

(assert (= (and b!9819 res!8690) b!9822))

(assert (= (and b!9822 c!820) b!9816))

(assert (= (and b!9822 (not c!820)) b!9825))

(assert (= (and b!9822 (not res!8689)) b!9831))

(assert (= (and b!9831 (not res!8688)) b!9824))

(assert (= (and b!9824 (not res!8687)) b!9821))

(assert (= (and b!9821 res!8693) b!9828))

(assert (= (and b!9828 res!8691) b!9820))

(assert (= (and b!9827 condMapEmpty!680) mapIsEmpty!680))

(assert (= (and b!9827 (not condMapEmpty!680)) mapNonEmpty!680))

(assert (= (and mapNonEmpty!680 ((_ is ValueCellFull!215) mapValue!680)) b!9829))

(assert (= (and b!9827 ((_ is ValueCellFull!215) mapDefault!680)) b!9823))

(assert (= start!1114 b!9827))

(declare-fun m!6211 () Bool)

(assert (=> b!9824 m!6211))

(declare-fun m!6213 () Bool)

(assert (=> mapNonEmpty!680 m!6213))

(declare-fun m!6215 () Bool)

(assert (=> start!1114 m!6215))

(declare-fun m!6217 () Bool)

(assert (=> start!1114 m!6217))

(declare-fun m!6219 () Bool)

(assert (=> start!1114 m!6219))

(declare-fun m!6221 () Bool)

(assert (=> b!9831 m!6221))

(declare-fun m!6223 () Bool)

(assert (=> b!9831 m!6223))

(declare-fun m!6225 () Bool)

(assert (=> b!9831 m!6225))

(declare-fun m!6227 () Bool)

(assert (=> b!9817 m!6227))

(assert (=> b!9817 m!6227))

(declare-fun m!6229 () Bool)

(assert (=> b!9817 m!6229))

(declare-fun m!6231 () Bool)

(assert (=> b!9830 m!6231))

(declare-fun m!6233 () Bool)

(assert (=> b!9820 m!6233))

(declare-fun m!6235 () Bool)

(assert (=> b!9816 m!6235))

(declare-fun m!6237 () Bool)

(assert (=> b!9818 m!6237))

(declare-fun m!6239 () Bool)

(assert (=> b!9828 m!6239))

(assert (=> b!9822 m!6235))

(declare-fun m!6241 () Bool)

(assert (=> b!9822 m!6241))

(declare-fun m!6243 () Bool)

(assert (=> b!9819 m!6243))

(declare-fun m!6245 () Bool)

(assert (=> b!9821 m!6245))

(declare-fun m!6247 () Bool)

(assert (=> b!9821 m!6247))

(check-sat (not b!9824) b_and!541 (not b!9821) (not mapNonEmpty!680) (not b!9822) (not b!9830) (not b!9816) (not start!1114) (not b_next!385) (not b!9831) tp_is_empty!463 (not b!9817) (not b!9819) (not b!9828) (not b!9818))
(check-sat b_and!541 (not b_next!385))
(get-model)

(declare-fun b!9938 () Bool)

(declare-fun e!5699 () Bool)

(declare-fun contains!135 (List!287 (_ BitVec 64)) Bool)

(assert (=> b!9938 (= e!5699 (contains!135 Nil!284 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9939 () Bool)

(declare-fun e!5697 () Bool)

(declare-fun e!5698 () Bool)

(assert (=> b!9939 (= e!5697 e!5698)))

(declare-fun res!8768 () Bool)

(assert (=> b!9939 (=> (not res!8768) (not e!5698))))

(assert (=> b!9939 (= res!8768 (not e!5699))))

(declare-fun res!8767 () Bool)

(assert (=> b!9939 (=> (not res!8767) (not e!5699))))

(assert (=> b!9939 (= res!8767 (validKeyInArray!0 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9940 () Bool)

(declare-fun e!5696 () Bool)

(assert (=> b!9940 (= e!5698 e!5696)))

(declare-fun c!829 () Bool)

(assert (=> b!9940 (= c!829 (validKeyInArray!0 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!961 () Bool)

(declare-fun res!8766 () Bool)

(assert (=> d!961 (=> res!8766 e!5697)))

(assert (=> d!961 (= res!8766 (bvsge #b00000000000000000000000000000000 (size!468 _keys!1806)))))

(assert (=> d!961 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!284) e!5697)))

(declare-fun b!9941 () Bool)

(declare-fun call!295 () Bool)

(assert (=> b!9941 (= e!5696 call!295)))

(declare-fun bm!292 () Bool)

(assert (=> bm!292 (= call!295 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!829 (Cons!283 (select (arr!406 _keys!1806) #b00000000000000000000000000000000) Nil!284) Nil!284)))))

(declare-fun b!9942 () Bool)

(assert (=> b!9942 (= e!5696 call!295)))

(assert (= (and d!961 (not res!8766)) b!9939))

(assert (= (and b!9939 res!8767) b!9938))

(assert (= (and b!9939 res!8768) b!9940))

(assert (= (and b!9940 c!829) b!9942))

(assert (= (and b!9940 (not c!829)) b!9941))

(assert (= (or b!9942 b!9941) bm!292))

(declare-fun m!6325 () Bool)

(assert (=> b!9938 m!6325))

(assert (=> b!9938 m!6325))

(declare-fun m!6327 () Bool)

(assert (=> b!9938 m!6327))

(assert (=> b!9939 m!6325))

(assert (=> b!9939 m!6325))

(declare-fun m!6329 () Bool)

(assert (=> b!9939 m!6329))

(assert (=> b!9940 m!6325))

(assert (=> b!9940 m!6325))

(assert (=> b!9940 m!6329))

(assert (=> bm!292 m!6325))

(declare-fun m!6331 () Bool)

(assert (=> bm!292 m!6331))

(assert (=> b!9818 d!961))

(declare-fun d!963 () Bool)

(assert (=> d!963 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!1114 d!963))

(declare-fun d!965 () Bool)

(assert (=> d!965 (= (array_inv!303 _values!1492) (bvsge (size!467 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!1114 d!965))

(declare-fun d!967 () Bool)

(assert (=> d!967 (= (array_inv!304 _keys!1806) (bvsge (size!468 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!1114 d!967))

(declare-fun d!969 () Bool)

(assert (=> d!969 (= (inRange!0 (index!2276 lt!2318) mask!2250) (and (bvsge (index!2276 lt!2318) #b00000000000000000000000000000000) (bvslt (index!2276 lt!2318) (bvadd mask!2250 #b00000000000000000000000000000001))))))

(assert (=> b!9828 d!969))

(declare-fun lt!2357 () SeekEntryResult!39)

(declare-fun e!5707 () SeekEntryResult!39)

(declare-fun b!9955 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!845 (_ BitVec 32)) SeekEntryResult!39)

(assert (=> b!9955 (= e!5707 (seekKeyOrZeroReturnVacant!0 (x!2819 lt!2357) (index!2277 lt!2357) (index!2277 lt!2357) k0!1278 _keys!1806 mask!2250))))

(declare-fun b!9956 () Bool)

(assert (=> b!9956 (= e!5707 (MissingZero!39 (index!2277 lt!2357)))))

(declare-fun b!9958 () Bool)

(declare-fun c!838 () Bool)

(declare-fun lt!2358 () (_ BitVec 64))

(assert (=> b!9958 (= c!838 (= lt!2358 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5708 () SeekEntryResult!39)

(assert (=> b!9958 (= e!5708 e!5707)))

(declare-fun b!9959 () Bool)

(declare-fun e!5706 () SeekEntryResult!39)

(assert (=> b!9959 (= e!5706 e!5708)))

(assert (=> b!9959 (= lt!2358 (select (arr!406 _keys!1806) (index!2277 lt!2357)))))

(declare-fun c!837 () Bool)

(assert (=> b!9959 (= c!837 (= lt!2358 k0!1278))))

(declare-fun b!9960 () Bool)

(assert (=> b!9960 (= e!5708 (Found!39 (index!2277 lt!2357)))))

(declare-fun b!9957 () Bool)

(assert (=> b!9957 (= e!5706 Undefined!39)))

(declare-fun d!971 () Bool)

(declare-fun lt!2356 () SeekEntryResult!39)

(assert (=> d!971 (and (or ((_ is Undefined!39) lt!2356) (not ((_ is Found!39) lt!2356)) (and (bvsge (index!2276 lt!2356) #b00000000000000000000000000000000) (bvslt (index!2276 lt!2356) (size!468 _keys!1806)))) (or ((_ is Undefined!39) lt!2356) ((_ is Found!39) lt!2356) (not ((_ is MissingZero!39) lt!2356)) (and (bvsge (index!2275 lt!2356) #b00000000000000000000000000000000) (bvslt (index!2275 lt!2356) (size!468 _keys!1806)))) (or ((_ is Undefined!39) lt!2356) ((_ is Found!39) lt!2356) ((_ is MissingZero!39) lt!2356) (not ((_ is MissingVacant!39) lt!2356)) (and (bvsge (index!2278 lt!2356) #b00000000000000000000000000000000) (bvslt (index!2278 lt!2356) (size!468 _keys!1806)))) (or ((_ is Undefined!39) lt!2356) (ite ((_ is Found!39) lt!2356) (= (select (arr!406 _keys!1806) (index!2276 lt!2356)) k0!1278) (ite ((_ is MissingZero!39) lt!2356) (= (select (arr!406 _keys!1806) (index!2275 lt!2356)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!39) lt!2356) (= (select (arr!406 _keys!1806) (index!2278 lt!2356)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!971 (= lt!2356 e!5706)))

(declare-fun c!836 () Bool)

(assert (=> d!971 (= c!836 (and ((_ is Intermediate!39) lt!2357) (undefined!851 lt!2357)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!845 (_ BitVec 32)) SeekEntryResult!39)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!971 (= lt!2357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!971 (validMask!0 mask!2250)))

(assert (=> d!971 (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) lt!2356)))

(assert (= (and d!971 c!836) b!9957))

(assert (= (and d!971 (not c!836)) b!9959))

(assert (= (and b!9959 c!837) b!9960))

(assert (= (and b!9959 (not c!837)) b!9958))

(assert (= (and b!9958 c!838) b!9956))

(assert (= (and b!9958 (not c!838)) b!9955))

(declare-fun m!6333 () Bool)

(assert (=> b!9955 m!6333))

(declare-fun m!6335 () Bool)

(assert (=> b!9959 m!6335))

(declare-fun m!6337 () Bool)

(assert (=> d!971 m!6337))

(declare-fun m!6339 () Bool)

(assert (=> d!971 m!6339))

(assert (=> d!971 m!6215))

(declare-fun m!6341 () Bool)

(assert (=> d!971 m!6341))

(declare-fun m!6343 () Bool)

(assert (=> d!971 m!6343))

(declare-fun m!6345 () Bool)

(assert (=> d!971 m!6345))

(assert (=> d!971 m!6341))

(assert (=> b!9824 d!971))

(declare-fun d!973 () Bool)

(assert (=> d!973 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!9819 d!973))

(declare-fun b!9973 () Bool)

(declare-fun e!5716 () SeekEntryResult!39)

(declare-fun lt!2368 () SeekEntryResult!39)

(assert (=> b!9973 (= e!5716 (ite ((_ is MissingVacant!39) lt!2368) (MissingZero!39 (index!2278 lt!2368)) lt!2368))))

(declare-fun lt!2369 () SeekEntryResult!39)

(assert (=> b!9973 (= lt!2368 (seekKeyOrZeroReturnVacant!0 (x!2819 lt!2369) (index!2277 lt!2369) (index!2277 lt!2369) k0!1278 _keys!1806 mask!2250))))

(declare-fun d!975 () Bool)

(declare-fun lt!2370 () SeekEntryResult!39)

(assert (=> d!975 (and (or ((_ is MissingVacant!39) lt!2370) (not ((_ is Found!39) lt!2370)) (and (bvsge (index!2276 lt!2370) #b00000000000000000000000000000000) (bvslt (index!2276 lt!2370) (size!468 _keys!1806)))) (not ((_ is MissingVacant!39) lt!2370)) (or (not ((_ is Found!39) lt!2370)) (= (select (arr!406 _keys!1806) (index!2276 lt!2370)) k0!1278)))))

(declare-fun e!5717 () SeekEntryResult!39)

(assert (=> d!975 (= lt!2370 e!5717)))

(declare-fun c!845 () Bool)

(assert (=> d!975 (= c!845 (and ((_ is Intermediate!39) lt!2369) (undefined!851 lt!2369)))))

(assert (=> d!975 (= lt!2369 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1278 mask!2250) k0!1278 _keys!1806 mask!2250))))

(assert (=> d!975 (validMask!0 mask!2250)))

(assert (=> d!975 (= (seekEntry!0 k0!1278 _keys!1806 mask!2250) lt!2370)))

(declare-fun b!9974 () Bool)

(declare-fun e!5715 () SeekEntryResult!39)

(assert (=> b!9974 (= e!5715 (Found!39 (index!2277 lt!2369)))))

(declare-fun b!9975 () Bool)

(assert (=> b!9975 (= e!5717 e!5715)))

(declare-fun lt!2367 () (_ BitVec 64))

(assert (=> b!9975 (= lt!2367 (select (arr!406 _keys!1806) (index!2277 lt!2369)))))

(declare-fun c!846 () Bool)

(assert (=> b!9975 (= c!846 (= lt!2367 k0!1278))))

(declare-fun b!9976 () Bool)

(assert (=> b!9976 (= e!5717 Undefined!39)))

(declare-fun b!9977 () Bool)

(declare-fun c!847 () Bool)

(assert (=> b!9977 (= c!847 (= lt!2367 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!9977 (= e!5715 e!5716)))

(declare-fun b!9978 () Bool)

(assert (=> b!9978 (= e!5716 (MissingZero!39 (index!2277 lt!2369)))))

(assert (= (and d!975 c!845) b!9976))

(assert (= (and d!975 (not c!845)) b!9975))

(assert (= (and b!9975 c!846) b!9974))

(assert (= (and b!9975 (not c!846)) b!9977))

(assert (= (and b!9977 c!847) b!9978))

(assert (= (and b!9977 (not c!847)) b!9973))

(declare-fun m!6347 () Bool)

(assert (=> b!9973 m!6347))

(declare-fun m!6349 () Bool)

(assert (=> d!975 m!6349))

(assert (=> d!975 m!6341))

(assert (=> d!975 m!6341))

(assert (=> d!975 m!6343))

(assert (=> d!975 m!6215))

(declare-fun m!6351 () Bool)

(assert (=> b!9975 m!6351))

(assert (=> b!9821 d!975))

(declare-fun d!977 () Bool)

(declare-fun lt!2376 () SeekEntryResult!39)

(assert (=> d!977 (and ((_ is Found!39) lt!2376) (= (index!2276 lt!2376) lt!2316))))

(assert (=> d!977 (= lt!2376 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun lt!2375 () Unit!213)

(declare-fun choose!0 ((_ BitVec 64) (_ BitVec 32) array!845 (_ BitVec 32)) Unit!213)

(assert (=> d!977 (= lt!2375 (choose!0 k0!1278 lt!2316 _keys!1806 mask!2250))))

(assert (=> d!977 (validMask!0 mask!2250)))

(assert (=> d!977 (= (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!2316 _keys!1806 mask!2250) lt!2375)))

(declare-fun bs!337 () Bool)

(assert (= bs!337 d!977))

(assert (=> bs!337 m!6245))

(declare-fun m!6353 () Bool)

(assert (=> bs!337 m!6353))

(assert (=> bs!337 m!6215))

(assert (=> b!9821 d!977))

(declare-fun bm!295 () Bool)

(declare-fun call!298 () Bool)

(assert (=> bm!295 (= call!298 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!9987 () Bool)

(declare-fun e!5724 () Bool)

(assert (=> b!9987 (= e!5724 call!298)))

(declare-fun b!9988 () Bool)

(declare-fun e!5726 () Bool)

(assert (=> b!9988 (= e!5724 e!5726)))

(declare-fun lt!2384 () (_ BitVec 64))

(assert (=> b!9988 (= lt!2384 (select (arr!406 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2383 () Unit!213)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!845 (_ BitVec 64) (_ BitVec 32)) Unit!213)

(assert (=> b!9988 (= lt!2383 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2384 #b00000000000000000000000000000000))))

(assert (=> b!9988 (arrayContainsKey!0 _keys!1806 lt!2384 #b00000000000000000000000000000000)))

(declare-fun lt!2385 () Unit!213)

(assert (=> b!9988 (= lt!2385 lt!2383)))

(declare-fun res!8774 () Bool)

(assert (=> b!9988 (= res!8774 (= (seekEntryOrOpen!0 (select (arr!406 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!39 #b00000000000000000000000000000000)))))

(assert (=> b!9988 (=> (not res!8774) (not e!5726))))

(declare-fun d!979 () Bool)

(declare-fun res!8773 () Bool)

(declare-fun e!5725 () Bool)

(assert (=> d!979 (=> res!8773 e!5725)))

(assert (=> d!979 (= res!8773 (bvsge #b00000000000000000000000000000000 (size!468 _keys!1806)))))

(assert (=> d!979 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!5725)))

(declare-fun b!9989 () Bool)

(assert (=> b!9989 (= e!5725 e!5724)))

(declare-fun c!850 () Bool)

(assert (=> b!9989 (= c!850 (validKeyInArray!0 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!9990 () Bool)

(assert (=> b!9990 (= e!5726 call!298)))

(assert (= (and d!979 (not res!8773)) b!9989))

(assert (= (and b!9989 c!850) b!9988))

(assert (= (and b!9989 (not c!850)) b!9987))

(assert (= (and b!9988 res!8774) b!9990))

(assert (= (or b!9990 b!9987) bm!295))

(declare-fun m!6355 () Bool)

(assert (=> bm!295 m!6355))

(assert (=> b!9988 m!6325))

(declare-fun m!6357 () Bool)

(assert (=> b!9988 m!6357))

(declare-fun m!6359 () Bool)

(assert (=> b!9988 m!6359))

(assert (=> b!9988 m!6325))

(declare-fun m!6361 () Bool)

(assert (=> b!9988 m!6361))

(assert (=> b!9989 m!6325))

(assert (=> b!9989 m!6325))

(assert (=> b!9989 m!6329))

(assert (=> b!9830 d!979))

(declare-fun d!981 () Bool)

(declare-fun res!8779 () Bool)

(declare-fun e!5731 () Bool)

(assert (=> d!981 (=> res!8779 e!5731)))

(assert (=> d!981 (= res!8779 (= (select (arr!406 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!981 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!5731)))

(declare-fun b!9995 () Bool)

(declare-fun e!5732 () Bool)

(assert (=> b!9995 (= e!5731 e!5732)))

(declare-fun res!8780 () Bool)

(assert (=> b!9995 (=> (not res!8780) (not e!5732))))

(assert (=> b!9995 (= res!8780 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!468 _keys!1806)))))

(declare-fun b!9996 () Bool)

(assert (=> b!9996 (= e!5732 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!981 (not res!8779)) b!9995))

(assert (= (and b!9995 res!8780) b!9996))

(assert (=> d!981 m!6325))

(declare-fun m!6363 () Bool)

(assert (=> b!9996 m!6363))

(assert (=> b!9822 d!981))

(declare-fun d!983 () Bool)

(declare-fun e!5735 () Bool)

(assert (=> d!983 e!5735))

(declare-fun c!853 () Bool)

(assert (=> d!983 (= c!853 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!2388 () Unit!213)

(declare-fun choose!143 (array!845 array!843 (_ BitVec 32) (_ BitVec 32) V!795 V!795 (_ BitVec 64) Int) Unit!213)

(assert (=> d!983 (= lt!2388 (choose!143 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!983 (validMask!0 mask!2250)))

(assert (=> d!983 (= (lemmaKeyInListMapIsInArray!81 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!2388)))

(declare-fun b!10001 () Bool)

(assert (=> b!10001 (= e!5735 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!10002 () Bool)

(assert (=> b!10002 (= e!5735 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!983 c!853) b!10001))

(assert (= (and d!983 (not c!853)) b!10002))

(declare-fun m!6365 () Bool)

(assert (=> d!983 m!6365))

(assert (=> d!983 m!6215))

(assert (=> b!10001 m!6235))

(assert (=> b!9822 d!983))

(declare-fun d!985 () Bool)

(declare-fun e!5741 () Bool)

(assert (=> d!985 e!5741))

(declare-fun res!8783 () Bool)

(assert (=> d!985 (=> res!8783 e!5741)))

(declare-fun lt!2399 () Bool)

(assert (=> d!985 (= res!8783 (not lt!2399))))

(declare-fun lt!2400 () Bool)

(assert (=> d!985 (= lt!2399 lt!2400)))

(declare-fun lt!2398 () Unit!213)

(declare-fun e!5740 () Unit!213)

(assert (=> d!985 (= lt!2398 e!5740)))

(declare-fun c!856 () Bool)

(assert (=> d!985 (= c!856 lt!2400)))

(declare-fun containsKey!10 (List!286 (_ BitVec 64)) Bool)

(assert (=> d!985 (= lt!2400 (containsKey!10 (toList!155 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!985 (= (contains!134 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!2399)))

(declare-fun b!10009 () Bool)

(declare-fun lt!2397 () Unit!213)

(assert (=> b!10009 (= e!5740 lt!2397)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!10 (List!286 (_ BitVec 64)) Unit!213)

(assert (=> b!10009 (= lt!2397 (lemmaContainsKeyImpliesGetValueByKeyDefined!10 (toList!155 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!22 0))(
  ( (Some!21 (v!1336 V!795)) (None!20) )
))
(declare-fun isDefined!11 (Option!22) Bool)

(declare-fun getValueByKey!16 (List!286 (_ BitVec 64)) Option!22)

(assert (=> b!10009 (isDefined!11 (getValueByKey!16 (toList!155 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!10010 () Bool)

(declare-fun Unit!215 () Unit!213)

(assert (=> b!10010 (= e!5740 Unit!215)))

(declare-fun b!10011 () Bool)

(assert (=> b!10011 (= e!5741 (isDefined!11 (getValueByKey!16 (toList!155 (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!985 c!856) b!10009))

(assert (= (and d!985 (not c!856)) b!10010))

(assert (= (and d!985 (not res!8783)) b!10011))

(declare-fun m!6367 () Bool)

(assert (=> d!985 m!6367))

(declare-fun m!6369 () Bool)

(assert (=> b!10009 m!6369))

(declare-fun m!6371 () Bool)

(assert (=> b!10009 m!6371))

(assert (=> b!10009 m!6371))

(declare-fun m!6373 () Bool)

(assert (=> b!10009 m!6373))

(assert (=> b!10011 m!6371))

(assert (=> b!10011 m!6371))

(assert (=> b!10011 m!6373))

(assert (=> b!9817 d!985))

(declare-fun b!10054 () Bool)

(declare-fun e!5768 () ListLongMap!279)

(declare-fun call!319 () ListLongMap!279)

(assert (=> b!10054 (= e!5768 call!319)))

(declare-fun bm!310 () Bool)

(declare-fun call!316 () Bool)

(declare-fun lt!2464 () ListLongMap!279)

(assert (=> bm!310 (= call!316 (contains!134 lt!2464 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!311 () Bool)

(declare-fun call!315 () Bool)

(assert (=> bm!311 (= call!315 (contains!134 lt!2464 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!10055 () Bool)

(declare-fun res!8808 () Bool)

(declare-fun e!5777 () Bool)

(assert (=> b!10055 (=> (not res!8808) (not e!5777))))

(declare-fun e!5776 () Bool)

(assert (=> b!10055 (= res!8808 e!5776)))

(declare-fun res!8804 () Bool)

(assert (=> b!10055 (=> res!8804 e!5776)))

(declare-fun e!5769 () Bool)

(assert (=> b!10055 (= res!8804 (not e!5769))))

(declare-fun res!8810 () Bool)

(assert (=> b!10055 (=> (not res!8810) (not e!5769))))

(assert (=> b!10055 (= res!8810 (bvslt #b00000000000000000000000000000000 (size!468 _keys!1806)))))

(declare-fun d!987 () Bool)

(assert (=> d!987 e!5777))

(declare-fun res!8805 () Bool)

(assert (=> d!987 (=> (not res!8805) (not e!5777))))

(assert (=> d!987 (= res!8805 (or (bvsge #b00000000000000000000000000000000 (size!468 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!468 _keys!1806)))))))

(declare-fun lt!2466 () ListLongMap!279)

(assert (=> d!987 (= lt!2464 lt!2466)))

(declare-fun lt!2453 () Unit!213)

(declare-fun e!5771 () Unit!213)

(assert (=> d!987 (= lt!2453 e!5771)))

(declare-fun c!872 () Bool)

(declare-fun e!5772 () Bool)

(assert (=> d!987 (= c!872 e!5772)))

(declare-fun res!8802 () Bool)

(assert (=> d!987 (=> (not res!8802) (not e!5772))))

(assert (=> d!987 (= res!8802 (bvslt #b00000000000000000000000000000000 (size!468 _keys!1806)))))

(declare-fun e!5774 () ListLongMap!279)

(assert (=> d!987 (= lt!2466 e!5774)))

(declare-fun c!869 () Bool)

(assert (=> d!987 (= c!869 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!987 (validMask!0 mask!2250)))

(assert (=> d!987 (= (getCurrentListMap!114 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!2464)))

(declare-fun b!10056 () Bool)

(declare-fun c!873 () Bool)

(assert (=> b!10056 (= c!873 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!5775 () ListLongMap!279)

(assert (=> b!10056 (= e!5775 e!5768)))

(declare-fun b!10057 () Bool)

(declare-fun e!5778 () Bool)

(declare-fun apply!26 (ListLongMap!279 (_ BitVec 64)) V!795)

(assert (=> b!10057 (= e!5778 (= (apply!26 lt!2464 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!10058 () Bool)

(declare-fun e!5773 () Bool)

(assert (=> b!10058 (= e!5777 e!5773)))

(declare-fun c!871 () Bool)

(assert (=> b!10058 (= c!871 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!10059 () Bool)

(declare-fun call!313 () ListLongMap!279)

(assert (=> b!10059 (= e!5768 call!313)))

(declare-fun b!10060 () Bool)

(declare-fun Unit!216 () Unit!213)

(assert (=> b!10060 (= e!5771 Unit!216)))

(declare-fun b!10061 () Bool)

(declare-fun e!5779 () Bool)

(assert (=> b!10061 (= e!5776 e!5779)))

(declare-fun res!8809 () Bool)

(assert (=> b!10061 (=> (not res!8809) (not e!5779))))

(assert (=> b!10061 (= res!8809 (contains!134 lt!2464 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!10061 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!468 _keys!1806)))))

(declare-fun b!10062 () Bool)

(assert (=> b!10062 (= e!5773 (not call!316))))

(declare-fun b!10063 () Bool)

(declare-fun e!5770 () Bool)

(assert (=> b!10063 (= e!5773 e!5770)))

(declare-fun res!8803 () Bool)

(assert (=> b!10063 (= res!8803 call!316)))

(assert (=> b!10063 (=> (not res!8803) (not e!5770))))

(declare-fun b!10064 () Bool)

(declare-fun call!317 () ListLongMap!279)

(declare-fun +!13 (ListLongMap!279 tuple2!274) ListLongMap!279)

(assert (=> b!10064 (= e!5774 (+!13 call!317 (tuple2!275 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!10065 () Bool)

(declare-fun lt!2449 () Unit!213)

(assert (=> b!10065 (= e!5771 lt!2449)))

(declare-fun lt!2446 () ListLongMap!279)

(declare-fun getCurrentListMapNoExtraKeys!10 (array!845 array!843 (_ BitVec 32) (_ BitVec 32) V!795 V!795 (_ BitVec 32) Int) ListLongMap!279)

(assert (=> b!10065 (= lt!2446 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2461 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2461 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2463 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2463 (select (arr!406 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2456 () Unit!213)

(declare-fun addStillContains!11 (ListLongMap!279 (_ BitVec 64) V!795 (_ BitVec 64)) Unit!213)

(assert (=> b!10065 (= lt!2456 (addStillContains!11 lt!2446 lt!2461 zeroValue!1434 lt!2463))))

(assert (=> b!10065 (contains!134 (+!13 lt!2446 (tuple2!275 lt!2461 zeroValue!1434)) lt!2463)))

(declare-fun lt!2447 () Unit!213)

(assert (=> b!10065 (= lt!2447 lt!2456)))

(declare-fun lt!2465 () ListLongMap!279)

(assert (=> b!10065 (= lt!2465 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2448 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2448 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2451 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2451 (select (arr!406 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2457 () Unit!213)

(declare-fun addApplyDifferent!11 (ListLongMap!279 (_ BitVec 64) V!795 (_ BitVec 64)) Unit!213)

(assert (=> b!10065 (= lt!2457 (addApplyDifferent!11 lt!2465 lt!2448 minValue!1434 lt!2451))))

(assert (=> b!10065 (= (apply!26 (+!13 lt!2465 (tuple2!275 lt!2448 minValue!1434)) lt!2451) (apply!26 lt!2465 lt!2451))))

(declare-fun lt!2462 () Unit!213)

(assert (=> b!10065 (= lt!2462 lt!2457)))

(declare-fun lt!2455 () ListLongMap!279)

(assert (=> b!10065 (= lt!2455 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2452 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2452 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2450 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2450 (select (arr!406 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!2454 () Unit!213)

(assert (=> b!10065 (= lt!2454 (addApplyDifferent!11 lt!2455 lt!2452 zeroValue!1434 lt!2450))))

(assert (=> b!10065 (= (apply!26 (+!13 lt!2455 (tuple2!275 lt!2452 zeroValue!1434)) lt!2450) (apply!26 lt!2455 lt!2450))))

(declare-fun lt!2460 () Unit!213)

(assert (=> b!10065 (= lt!2460 lt!2454)))

(declare-fun lt!2458 () ListLongMap!279)

(assert (=> b!10065 (= lt!2458 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!2445 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2445 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!2459 () (_ BitVec 64))

(assert (=> b!10065 (= lt!2459 (select (arr!406 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!10065 (= lt!2449 (addApplyDifferent!11 lt!2458 lt!2445 minValue!1434 lt!2459))))

(assert (=> b!10065 (= (apply!26 (+!13 lt!2458 (tuple2!275 lt!2445 minValue!1434)) lt!2459) (apply!26 lt!2458 lt!2459))))

(declare-fun bm!312 () Bool)

(declare-fun call!314 () ListLongMap!279)

(declare-fun call!318 () ListLongMap!279)

(assert (=> bm!312 (= call!314 call!318)))

(declare-fun b!10066 () Bool)

(assert (=> b!10066 (= e!5774 e!5775)))

(declare-fun c!870 () Bool)

(assert (=> b!10066 (= c!870 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!10067 () Bool)

(declare-fun get!182 (ValueCell!215 V!795) V!795)

(declare-fun dynLambda!48 (Int (_ BitVec 64)) V!795)

(assert (=> b!10067 (= e!5779 (= (apply!26 lt!2464 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)) (get!182 (select (arr!405 _values!1492) #b00000000000000000000000000000000) (dynLambda!48 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!10067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!467 _values!1492)))))

(assert (=> b!10067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!468 _keys!1806)))))

(declare-fun b!10068 () Bool)

(declare-fun e!5780 () Bool)

(assert (=> b!10068 (= e!5780 e!5778)))

(declare-fun res!8806 () Bool)

(assert (=> b!10068 (= res!8806 call!315)))

(assert (=> b!10068 (=> (not res!8806) (not e!5778))))

(declare-fun b!10069 () Bool)

(assert (=> b!10069 (= e!5780 (not call!315))))

(declare-fun b!10070 () Bool)

(assert (=> b!10070 (= e!5775 call!313)))

(declare-fun b!10071 () Bool)

(assert (=> b!10071 (= e!5770 (= (apply!26 lt!2464 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun b!10072 () Bool)

(assert (=> b!10072 (= e!5772 (validKeyInArray!0 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!313 () Bool)

(assert (=> bm!313 (= call!318 (getCurrentListMapNoExtraKeys!10 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!10073 () Bool)

(declare-fun res!8807 () Bool)

(assert (=> b!10073 (=> (not res!8807) (not e!5777))))

(assert (=> b!10073 (= res!8807 e!5780)))

(declare-fun c!874 () Bool)

(assert (=> b!10073 (= c!874 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!314 () Bool)

(assert (=> bm!314 (= call!317 (+!13 (ite c!869 call!318 (ite c!870 call!314 call!319)) (ite (or c!869 c!870) (tuple2!275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!275 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun bm!315 () Bool)

(assert (=> bm!315 (= call!313 call!317)))

(declare-fun bm!316 () Bool)

(assert (=> bm!316 (= call!319 call!314)))

(declare-fun b!10074 () Bool)

(assert (=> b!10074 (= e!5769 (validKeyInArray!0 (select (arr!406 _keys!1806) #b00000000000000000000000000000000)))))

(assert (= (and d!987 c!869) b!10064))

(assert (= (and d!987 (not c!869)) b!10066))

(assert (= (and b!10066 c!870) b!10070))

(assert (= (and b!10066 (not c!870)) b!10056))

(assert (= (and b!10056 c!873) b!10059))

(assert (= (and b!10056 (not c!873)) b!10054))

(assert (= (or b!10059 b!10054) bm!316))

(assert (= (or b!10070 bm!316) bm!312))

(assert (= (or b!10070 b!10059) bm!315))

(assert (= (or b!10064 bm!312) bm!313))

(assert (= (or b!10064 bm!315) bm!314))

(assert (= (and d!987 res!8802) b!10072))

(assert (= (and d!987 c!872) b!10065))

(assert (= (and d!987 (not c!872)) b!10060))

(assert (= (and d!987 res!8805) b!10055))

(assert (= (and b!10055 res!8810) b!10074))

(assert (= (and b!10055 (not res!8804)) b!10061))

(assert (= (and b!10061 res!8809) b!10067))

(assert (= (and b!10055 res!8808) b!10073))

(assert (= (and b!10073 c!874) b!10068))

(assert (= (and b!10073 (not c!874)) b!10069))

(assert (= (and b!10068 res!8806) b!10057))

(assert (= (or b!10068 b!10069) bm!311))

(assert (= (and b!10073 res!8807) b!10058))

(assert (= (and b!10058 c!871) b!10063))

(assert (= (and b!10058 (not c!871)) b!10062))

(assert (= (and b!10063 res!8803) b!10071))

(assert (= (or b!10063 b!10062) bm!310))

(declare-fun b_lambda!355 () Bool)

(assert (=> (not b_lambda!355) (not b!10067)))

(declare-fun t!2434 () Bool)

(declare-fun tb!145 () Bool)

(assert (=> (and start!1114 (= defaultEntry!1495 defaultEntry!1495) t!2434) tb!145))

(declare-fun result!237 () Bool)

(assert (=> tb!145 (= result!237 tp_is_empty!463)))

(assert (=> b!10067 t!2434))

(declare-fun b_and!547 () Bool)

(assert (= b_and!541 (and (=> t!2434 result!237) b_and!547)))

(assert (=> b!10072 m!6325))

(assert (=> b!10072 m!6325))

(assert (=> b!10072 m!6329))

(assert (=> d!987 m!6215))

(declare-fun m!6375 () Bool)

(assert (=> bm!314 m!6375))

(declare-fun m!6377 () Bool)

(assert (=> b!10064 m!6377))

(assert (=> b!10061 m!6325))

(assert (=> b!10061 m!6325))

(declare-fun m!6379 () Bool)

(assert (=> b!10061 m!6379))

(declare-fun m!6381 () Bool)

(assert (=> b!10065 m!6381))

(declare-fun m!6383 () Bool)

(assert (=> b!10065 m!6383))

(declare-fun m!6385 () Bool)

(assert (=> b!10065 m!6385))

(declare-fun m!6387 () Bool)

(assert (=> b!10065 m!6387))

(declare-fun m!6389 () Bool)

(assert (=> b!10065 m!6389))

(declare-fun m!6391 () Bool)

(assert (=> b!10065 m!6391))

(declare-fun m!6393 () Bool)

(assert (=> b!10065 m!6393))

(declare-fun m!6395 () Bool)

(assert (=> b!10065 m!6395))

(assert (=> b!10065 m!6381))

(declare-fun m!6397 () Bool)

(assert (=> b!10065 m!6397))

(assert (=> b!10065 m!6383))

(declare-fun m!6399 () Bool)

(assert (=> b!10065 m!6399))

(declare-fun m!6401 () Bool)

(assert (=> b!10065 m!6401))

(declare-fun m!6403 () Bool)

(assert (=> b!10065 m!6403))

(declare-fun m!6405 () Bool)

(assert (=> b!10065 m!6405))

(declare-fun m!6407 () Bool)

(assert (=> b!10065 m!6407))

(declare-fun m!6409 () Bool)

(assert (=> b!10065 m!6409))

(assert (=> b!10065 m!6325))

(assert (=> b!10065 m!6393))

(assert (=> b!10065 m!6407))

(declare-fun m!6411 () Bool)

(assert (=> b!10065 m!6411))

(declare-fun m!6413 () Bool)

(assert (=> b!10057 m!6413))

(declare-fun m!6415 () Bool)

(assert (=> b!10071 m!6415))

(assert (=> bm!313 m!6405))

(assert (=> b!10074 m!6325))

(assert (=> b!10074 m!6325))

(assert (=> b!10074 m!6329))

(declare-fun m!6417 () Bool)

(assert (=> bm!311 m!6417))

(declare-fun m!6419 () Bool)

(assert (=> b!10067 m!6419))

(assert (=> b!10067 m!6325))

(declare-fun m!6421 () Bool)

(assert (=> b!10067 m!6421))

(declare-fun m!6423 () Bool)

(assert (=> b!10067 m!6423))

(assert (=> b!10067 m!6419))

(assert (=> b!10067 m!6423))

(declare-fun m!6425 () Bool)

(assert (=> b!10067 m!6425))

(assert (=> b!10067 m!6325))

(declare-fun m!6427 () Bool)

(assert (=> bm!310 m!6427))

(assert (=> b!9817 d!987))

(declare-fun bm!317 () Bool)

(declare-fun call!320 () Bool)

(assert (=> bm!317 (= call!320 (arrayForallSeekEntryOrOpenFound!0 (bvadd lt!2316 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!10077 () Bool)

(declare-fun e!5781 () Bool)

(assert (=> b!10077 (= e!5781 call!320)))

(declare-fun b!10078 () Bool)

(declare-fun e!5783 () Bool)

(assert (=> b!10078 (= e!5781 e!5783)))

(declare-fun lt!2468 () (_ BitVec 64))

(assert (=> b!10078 (= lt!2468 (select (arr!406 _keys!1806) lt!2316))))

(declare-fun lt!2467 () Unit!213)

(assert (=> b!10078 (= lt!2467 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!2468 lt!2316))))

(assert (=> b!10078 (arrayContainsKey!0 _keys!1806 lt!2468 #b00000000000000000000000000000000)))

(declare-fun lt!2469 () Unit!213)

(assert (=> b!10078 (= lt!2469 lt!2467)))

(declare-fun res!8812 () Bool)

(assert (=> b!10078 (= res!8812 (= (seekEntryOrOpen!0 (select (arr!406 _keys!1806) lt!2316) _keys!1806 mask!2250) (Found!39 lt!2316)))))

(assert (=> b!10078 (=> (not res!8812) (not e!5783))))

(declare-fun d!989 () Bool)

(declare-fun res!8811 () Bool)

(declare-fun e!5782 () Bool)

(assert (=> d!989 (=> res!8811 e!5782)))

(assert (=> d!989 (= res!8811 (bvsge lt!2316 (size!468 _keys!1806)))))

(assert (=> d!989 (= (arrayForallSeekEntryOrOpenFound!0 lt!2316 _keys!1806 mask!2250) e!5782)))

(declare-fun b!10079 () Bool)

(assert (=> b!10079 (= e!5782 e!5781)))

(declare-fun c!875 () Bool)

(assert (=> b!10079 (= c!875 (validKeyInArray!0 (select (arr!406 _keys!1806) lt!2316)))))

(declare-fun b!10080 () Bool)

(assert (=> b!10080 (= e!5783 call!320)))

(assert (= (and d!989 (not res!8811)) b!10079))

(assert (= (and b!10079 c!875) b!10078))

(assert (= (and b!10079 (not c!875)) b!10077))

(assert (= (and b!10078 res!8812) b!10080))

(assert (= (or b!10080 b!10077) bm!317))

(declare-fun m!6429 () Bool)

(assert (=> bm!317 m!6429))

(declare-fun m!6431 () Bool)

(assert (=> b!10078 m!6431))

(declare-fun m!6433 () Bool)

(assert (=> b!10078 m!6433))

(declare-fun m!6435 () Bool)

(assert (=> b!10078 m!6435))

(assert (=> b!10078 m!6431))

(declare-fun m!6437 () Bool)

(assert (=> b!10078 m!6437))

(assert (=> b!10079 m!6431))

(assert (=> b!10079 m!6431))

(declare-fun m!6439 () Bool)

(assert (=> b!10079 m!6439))

(assert (=> b!9831 d!989))

(declare-fun d!991 () Bool)

(assert (=> d!991 (arrayForallSeekEntryOrOpenFound!0 lt!2316 _keys!1806 mask!2250)))

(declare-fun lt!2472 () Unit!213)

(declare-fun choose!38 (array!845 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!213)

(assert (=> d!991 (= lt!2472 (choose!38 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2316))))

(assert (=> d!991 (validMask!0 mask!2250)))

(assert (=> d!991 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!2316) lt!2472)))

(declare-fun bs!338 () Bool)

(assert (= bs!338 d!991))

(assert (=> bs!338 m!6221))

(declare-fun m!6441 () Bool)

(assert (=> bs!338 m!6441))

(assert (=> bs!338 m!6215))

(assert (=> b!9831 d!991))

(declare-fun d!993 () Bool)

(declare-fun lt!2475 () (_ BitVec 32))

(assert (=> d!993 (and (or (bvslt lt!2475 #b00000000000000000000000000000000) (bvsge lt!2475 (size!468 _keys!1806)) (and (bvsge lt!2475 #b00000000000000000000000000000000) (bvslt lt!2475 (size!468 _keys!1806)))) (bvsge lt!2475 #b00000000000000000000000000000000) (bvslt lt!2475 (size!468 _keys!1806)) (= (select (arr!406 _keys!1806) lt!2475) k0!1278))))

(declare-fun e!5786 () (_ BitVec 32))

(assert (=> d!993 (= lt!2475 e!5786)))

(declare-fun c!878 () Bool)

(assert (=> d!993 (= c!878 (= (select (arr!406 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!993 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!468 _keys!1806)) (bvslt (size!468 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!993 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!2475)))

(declare-fun b!10085 () Bool)

(assert (=> b!10085 (= e!5786 #b00000000000000000000000000000000)))

(declare-fun b!10086 () Bool)

(assert (=> b!10086 (= e!5786 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!993 c!878) b!10085))

(assert (= (and d!993 (not c!878)) b!10086))

(declare-fun m!6443 () Bool)

(assert (=> d!993 m!6443))

(assert (=> d!993 m!6325))

(declare-fun m!6445 () Bool)

(assert (=> b!10086 m!6445))

(assert (=> b!9831 d!993))

(assert (=> b!9816 d!981))

(declare-fun b!10094 () Bool)

(declare-fun e!5792 () Bool)

(assert (=> b!10094 (= e!5792 tp_is_empty!463)))

(declare-fun mapNonEmpty!689 () Bool)

(declare-fun mapRes!689 () Bool)

(declare-fun tp!1415 () Bool)

(declare-fun e!5791 () Bool)

(assert (=> mapNonEmpty!689 (= mapRes!689 (and tp!1415 e!5791))))

(declare-fun mapValue!689 () ValueCell!215)

(declare-fun mapKey!689 () (_ BitVec 32))

(declare-fun mapRest!689 () (Array (_ BitVec 32) ValueCell!215))

(assert (=> mapNonEmpty!689 (= mapRest!680 (store mapRest!689 mapKey!689 mapValue!689))))

(declare-fun condMapEmpty!689 () Bool)

(declare-fun mapDefault!689 () ValueCell!215)

(assert (=> mapNonEmpty!680 (= condMapEmpty!689 (= mapRest!680 ((as const (Array (_ BitVec 32) ValueCell!215)) mapDefault!689)))))

(assert (=> mapNonEmpty!680 (= tp!1399 (and e!5792 mapRes!689))))

(declare-fun mapIsEmpty!689 () Bool)

(assert (=> mapIsEmpty!689 mapRes!689))

(declare-fun b!10093 () Bool)

(assert (=> b!10093 (= e!5791 tp_is_empty!463)))

(assert (= (and mapNonEmpty!680 condMapEmpty!689) mapIsEmpty!689))

(assert (= (and mapNonEmpty!680 (not condMapEmpty!689)) mapNonEmpty!689))

(assert (= (and mapNonEmpty!689 ((_ is ValueCellFull!215) mapValue!689)) b!10093))

(assert (= (and mapNonEmpty!680 ((_ is ValueCellFull!215) mapDefault!689)) b!10094))

(declare-fun m!6447 () Bool)

(assert (=> mapNonEmpty!689 m!6447))

(declare-fun b_lambda!357 () Bool)

(assert (= b_lambda!355 (or (and start!1114 b_free!385) b_lambda!357)))

(check-sat (not b_lambda!357) (not b!10001) (not b!10078) (not d!975) (not d!971) (not bm!311) (not b!10071) (not b!9989) (not b!10061) (not b_next!385) (not d!983) b_and!547 (not b!9955) (not b!10065) (not b!10011) (not b!9973) (not d!985) (not b!10057) (not b!10009) (not b!10067) (not b!10064) (not d!991) (not b!9939) (not b!10074) (not bm!295) tp_is_empty!463 (not b!10086) (not bm!314) (not b!10072) (not bm!292) (not b!10079) (not d!987) (not mapNonEmpty!689) (not bm!310) (not b!9938) (not b!9940) (not b!9988) (not bm!317) (not d!977) (not bm!313) (not b!9996))
(check-sat b_and!547 (not b_next!385))
