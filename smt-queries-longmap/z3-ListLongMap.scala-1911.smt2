; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34032 () Bool)

(assert start!34032)

(declare-fun b_free!7137 () Bool)

(declare-fun b_next!7137 () Bool)

(assert (=> start!34032 (= b_free!7137 (not b_next!7137))))

(declare-fun tp!24932 () Bool)

(declare-fun b_and!14329 () Bool)

(assert (=> start!34032 (= tp!24932 b_and!14329)))

(declare-fun b!339111 () Bool)

(declare-fun res!187321 () Bool)

(declare-fun e!208060 () Bool)

(assert (=> b!339111 (=> (not res!187321) (not e!208060))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!10429 0))(
  ( (V!10430 (val!3589 Int)) )
))
(declare-fun zeroValue!1467 () V!10429)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3201 0))(
  ( (ValueCellFull!3201 (v!5757 V!10429)) (EmptyCell!3201) )
))
(declare-datatypes ((array!17775 0))(
  ( (array!17776 (arr!8412 (Array (_ BitVec 32) ValueCell!3201)) (size!8764 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17775)

(declare-datatypes ((array!17777 0))(
  ( (array!17778 (arr!8413 (Array (_ BitVec 32) (_ BitVec 64))) (size!8765 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17777)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10429)

(declare-datatypes ((tuple2!5210 0))(
  ( (tuple2!5211 (_1!2616 (_ BitVec 64)) (_2!2616 V!10429)) )
))
(declare-datatypes ((List!4827 0))(
  ( (Nil!4824) (Cons!4823 (h!5679 tuple2!5210) (t!9927 List!4827)) )
))
(declare-datatypes ((ListLongMap!4123 0))(
  ( (ListLongMap!4124 (toList!2077 List!4827)) )
))
(declare-fun contains!2127 (ListLongMap!4123 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1598 (array!17777 array!17775 (_ BitVec 32) (_ BitVec 32) V!10429 V!10429 (_ BitVec 32) Int) ListLongMap!4123)

(assert (=> b!339111 (= res!187321 (not (contains!2127 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!339112 () Bool)

(declare-fun res!187325 () Bool)

(declare-fun e!208059 () Bool)

(assert (=> b!339112 (=> (not res!187325) (not e!208059))))

(declare-datatypes ((SeekEntryResult!3250 0))(
  ( (MissingZero!3250 (index!15179 (_ BitVec 32))) (Found!3250 (index!15180 (_ BitVec 32))) (Intermediate!3250 (undefined!4062 Bool) (index!15181 (_ BitVec 32)) (x!33780 (_ BitVec 32))) (Undefined!3250) (MissingVacant!3250 (index!15182 (_ BitVec 32))) )
))
(declare-fun lt!161058 () SeekEntryResult!3250)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!339112 (= res!187325 (inRange!0 (index!15179 lt!161058) mask!2385))))

(declare-fun mapIsEmpty!12048 () Bool)

(declare-fun mapRes!12048 () Bool)

(assert (=> mapIsEmpty!12048 mapRes!12048))

(declare-fun b!339114 () Bool)

(declare-fun e!208055 () Bool)

(assert (=> b!339114 (= e!208055 e!208059)))

(declare-fun res!187327 () Bool)

(assert (=> b!339114 (=> (not res!187327) (not e!208059))))

(declare-fun lt!161059 () Bool)

(assert (=> b!339114 (= res!187327 (not lt!161059))))

(declare-datatypes ((Unit!10553 0))(
  ( (Unit!10554) )
))
(declare-fun lt!161057 () Unit!10553)

(declare-fun e!208057 () Unit!10553)

(assert (=> b!339114 (= lt!161057 e!208057)))

(declare-fun c!52506 () Bool)

(assert (=> b!339114 (= c!52506 lt!161059)))

(declare-fun arrayContainsKey!0 (array!17777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339114 (= lt!161059 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!339115 () Bool)

(declare-fun res!187326 () Bool)

(assert (=> b!339115 (=> (not res!187326) (not e!208060))))

(assert (=> b!339115 (= res!187326 (and (= (size!8764 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8765 _keys!1895) (size!8764 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!339116 () Bool)

(assert (=> b!339116 (= e!208059 (and (= (select (arr!8413 _keys!1895) (index!15179 lt!161058)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)) (bvsge (size!8765 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!339117 () Bool)

(assert (=> b!339117 (= e!208060 e!208055)))

(declare-fun res!187324 () Bool)

(assert (=> b!339117 (=> (not res!187324) (not e!208055))))

(get-info :version)

(assert (=> b!339117 (= res!187324 (and (not ((_ is Found!3250) lt!161058)) ((_ is MissingZero!3250) lt!161058)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17777 (_ BitVec 32)) SeekEntryResult!3250)

(assert (=> b!339117 (= lt!161058 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!339118 () Bool)

(declare-fun e!208062 () Bool)

(declare-fun e!208056 () Bool)

(assert (=> b!339118 (= e!208062 (and e!208056 mapRes!12048))))

(declare-fun condMapEmpty!12048 () Bool)

(declare-fun mapDefault!12048 () ValueCell!3201)

(assert (=> b!339118 (= condMapEmpty!12048 (= (arr!8412 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3201)) mapDefault!12048)))))

(declare-fun b!339119 () Bool)

(declare-fun Unit!10555 () Unit!10553)

(assert (=> b!339119 (= e!208057 Unit!10555)))

(declare-fun lt!161056 () Unit!10553)

(declare-fun lemmaArrayContainsKeyThenInListMap!282 (array!17777 array!17775 (_ BitVec 32) (_ BitVec 32) V!10429 V!10429 (_ BitVec 64) (_ BitVec 32) Int) Unit!10553)

(declare-fun arrayScanForKey!0 (array!17777 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339119 (= lt!161056 (lemmaArrayContainsKeyThenInListMap!282 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339119 false))

(declare-fun b!339120 () Bool)

(declare-fun e!208061 () Bool)

(declare-fun tp_is_empty!7089 () Bool)

(assert (=> b!339120 (= e!208061 tp_is_empty!7089)))

(declare-fun b!339121 () Bool)

(declare-fun res!187320 () Bool)

(assert (=> b!339121 (=> (not res!187320) (not e!208060))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!339121 (= res!187320 (validKeyInArray!0 k0!1348))))

(declare-fun b!339122 () Bool)

(assert (=> b!339122 (= e!208056 tp_is_empty!7089)))

(declare-fun b!339123 () Bool)

(declare-fun res!187323 () Bool)

(assert (=> b!339123 (=> (not res!187323) (not e!208060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17777 (_ BitVec 32)) Bool)

(assert (=> b!339123 (= res!187323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12048 () Bool)

(declare-fun tp!24933 () Bool)

(assert (=> mapNonEmpty!12048 (= mapRes!12048 (and tp!24933 e!208061))))

(declare-fun mapValue!12048 () ValueCell!3201)

(declare-fun mapKey!12048 () (_ BitVec 32))

(declare-fun mapRest!12048 () (Array (_ BitVec 32) ValueCell!3201))

(assert (=> mapNonEmpty!12048 (= (arr!8412 _values!1525) (store mapRest!12048 mapKey!12048 mapValue!12048))))

(declare-fun b!339124 () Bool)

(declare-fun res!187322 () Bool)

(assert (=> b!339124 (=> (not res!187322) (not e!208060))))

(declare-datatypes ((List!4828 0))(
  ( (Nil!4825) (Cons!4824 (h!5680 (_ BitVec 64)) (t!9928 List!4828)) )
))
(declare-fun arrayNoDuplicates!0 (array!17777 (_ BitVec 32) List!4828) Bool)

(assert (=> b!339124 (= res!187322 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4825))))

(declare-fun res!187328 () Bool)

(assert (=> start!34032 (=> (not res!187328) (not e!208060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34032 (= res!187328 (validMask!0 mask!2385))))

(assert (=> start!34032 e!208060))

(assert (=> start!34032 true))

(assert (=> start!34032 tp_is_empty!7089))

(assert (=> start!34032 tp!24932))

(declare-fun array_inv!6236 (array!17775) Bool)

(assert (=> start!34032 (and (array_inv!6236 _values!1525) e!208062)))

(declare-fun array_inv!6237 (array!17777) Bool)

(assert (=> start!34032 (array_inv!6237 _keys!1895)))

(declare-fun b!339113 () Bool)

(declare-fun Unit!10556 () Unit!10553)

(assert (=> b!339113 (= e!208057 Unit!10556)))

(assert (= (and start!34032 res!187328) b!339115))

(assert (= (and b!339115 res!187326) b!339123))

(assert (= (and b!339123 res!187323) b!339124))

(assert (= (and b!339124 res!187322) b!339121))

(assert (= (and b!339121 res!187320) b!339111))

(assert (= (and b!339111 res!187321) b!339117))

(assert (= (and b!339117 res!187324) b!339114))

(assert (= (and b!339114 c!52506) b!339119))

(assert (= (and b!339114 (not c!52506)) b!339113))

(assert (= (and b!339114 res!187327) b!339112))

(assert (= (and b!339112 res!187325) b!339116))

(assert (= (and b!339118 condMapEmpty!12048) mapIsEmpty!12048))

(assert (= (and b!339118 (not condMapEmpty!12048)) mapNonEmpty!12048))

(assert (= (and mapNonEmpty!12048 ((_ is ValueCellFull!3201) mapValue!12048)) b!339120))

(assert (= (and b!339118 ((_ is ValueCellFull!3201) mapDefault!12048)) b!339122))

(assert (= start!34032 b!339118))

(declare-fun m!342173 () Bool)

(assert (=> b!339114 m!342173))

(declare-fun m!342175 () Bool)

(assert (=> start!34032 m!342175))

(declare-fun m!342177 () Bool)

(assert (=> start!34032 m!342177))

(declare-fun m!342179 () Bool)

(assert (=> start!34032 m!342179))

(declare-fun m!342181 () Bool)

(assert (=> mapNonEmpty!12048 m!342181))

(declare-fun m!342183 () Bool)

(assert (=> b!339123 m!342183))

(declare-fun m!342185 () Bool)

(assert (=> b!339124 m!342185))

(declare-fun m!342187 () Bool)

(assert (=> b!339112 m!342187))

(declare-fun m!342189 () Bool)

(assert (=> b!339119 m!342189))

(assert (=> b!339119 m!342189))

(declare-fun m!342191 () Bool)

(assert (=> b!339119 m!342191))

(declare-fun m!342193 () Bool)

(assert (=> b!339111 m!342193))

(assert (=> b!339111 m!342193))

(declare-fun m!342195 () Bool)

(assert (=> b!339111 m!342195))

(declare-fun m!342197 () Bool)

(assert (=> b!339116 m!342197))

(declare-fun m!342199 () Bool)

(assert (=> b!339121 m!342199))

(declare-fun m!342201 () Bool)

(assert (=> b!339117 m!342201))

(check-sat b_and!14329 (not b!339123) (not b!339111) (not b!339114) (not start!34032) (not b!339117) tp_is_empty!7089 (not b!339119) (not mapNonEmpty!12048) (not b_next!7137) (not b!339121) (not b!339112) (not b!339124))
(check-sat b_and!14329 (not b_next!7137))
(get-model)

(declare-fun d!70831 () Bool)

(assert (=> d!70831 (= (validMask!0 mask!2385) (and (or (= mask!2385 #b00000000000000000000000000000111) (= mask!2385 #b00000000000000000000000000001111) (= mask!2385 #b00000000000000000000000000011111) (= mask!2385 #b00000000000000000000000000111111) (= mask!2385 #b00000000000000000000000001111111) (= mask!2385 #b00000000000000000000000011111111) (= mask!2385 #b00000000000000000000000111111111) (= mask!2385 #b00000000000000000000001111111111) (= mask!2385 #b00000000000000000000011111111111) (= mask!2385 #b00000000000000000000111111111111) (= mask!2385 #b00000000000000000001111111111111) (= mask!2385 #b00000000000000000011111111111111) (= mask!2385 #b00000000000000000111111111111111) (= mask!2385 #b00000000000000001111111111111111) (= mask!2385 #b00000000000000011111111111111111) (= mask!2385 #b00000000000000111111111111111111) (= mask!2385 #b00000000000001111111111111111111) (= mask!2385 #b00000000000011111111111111111111) (= mask!2385 #b00000000000111111111111111111111) (= mask!2385 #b00000000001111111111111111111111) (= mask!2385 #b00000000011111111111111111111111) (= mask!2385 #b00000000111111111111111111111111) (= mask!2385 #b00000001111111111111111111111111) (= mask!2385 #b00000011111111111111111111111111) (= mask!2385 #b00000111111111111111111111111111) (= mask!2385 #b00001111111111111111111111111111) (= mask!2385 #b00011111111111111111111111111111) (= mask!2385 #b00111111111111111111111111111111)) (bvsle mask!2385 #b00111111111111111111111111111111)))))

(assert (=> start!34032 d!70831))

(declare-fun d!70833 () Bool)

(assert (=> d!70833 (= (array_inv!6236 _values!1525) (bvsge (size!8764 _values!1525) #b00000000000000000000000000000000))))

(assert (=> start!34032 d!70833))

(declare-fun d!70835 () Bool)

(assert (=> d!70835 (= (array_inv!6237 _keys!1895) (bvsge (size!8765 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> start!34032 d!70835))

(declare-fun d!70837 () Bool)

(declare-fun res!187360 () Bool)

(declare-fun e!208091 () Bool)

(assert (=> d!70837 (=> res!187360 e!208091)))

(assert (=> d!70837 (= res!187360 (= (select (arr!8413 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70837 (= (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) e!208091)))

(declare-fun b!339171 () Bool)

(declare-fun e!208092 () Bool)

(assert (=> b!339171 (= e!208091 e!208092)))

(declare-fun res!187361 () Bool)

(assert (=> b!339171 (=> (not res!187361) (not e!208092))))

(assert (=> b!339171 (= res!187361 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8765 _keys!1895)))))

(declare-fun b!339172 () Bool)

(assert (=> b!339172 (= e!208092 (arrayContainsKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70837 (not res!187360)) b!339171))

(assert (= (and b!339171 res!187361) b!339172))

(declare-fun m!342233 () Bool)

(assert (=> d!70837 m!342233))

(declare-fun m!342235 () Bool)

(assert (=> b!339172 m!342235))

(assert (=> b!339114 d!70837))

(declare-fun d!70839 () Bool)

(assert (=> d!70839 (contains!2127 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))

(declare-fun lt!161074 () Unit!10553)

(declare-fun choose!1301 (array!17777 array!17775 (_ BitVec 32) (_ BitVec 32) V!10429 V!10429 (_ BitVec 64) (_ BitVec 32) Int) Unit!10553)

(assert (=> d!70839 (= lt!161074 (choose!1301 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> d!70839 (validMask!0 mask!2385)))

(assert (=> d!70839 (= (lemmaArrayContainsKeyThenInListMap!282 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528) lt!161074)))

(declare-fun bs!11666 () Bool)

(assert (= bs!11666 d!70839))

(assert (=> bs!11666 m!342193))

(assert (=> bs!11666 m!342193))

(assert (=> bs!11666 m!342195))

(assert (=> bs!11666 m!342189))

(declare-fun m!342237 () Bool)

(assert (=> bs!11666 m!342237))

(assert (=> bs!11666 m!342175))

(assert (=> b!339119 d!70839))

(declare-fun d!70841 () Bool)

(declare-fun lt!161077 () (_ BitVec 32))

(assert (=> d!70841 (and (or (bvslt lt!161077 #b00000000000000000000000000000000) (bvsge lt!161077 (size!8765 _keys!1895)) (and (bvsge lt!161077 #b00000000000000000000000000000000) (bvslt lt!161077 (size!8765 _keys!1895)))) (bvsge lt!161077 #b00000000000000000000000000000000) (bvslt lt!161077 (size!8765 _keys!1895)) (= (select (arr!8413 _keys!1895) lt!161077) k0!1348))))

(declare-fun e!208095 () (_ BitVec 32))

(assert (=> d!70841 (= lt!161077 e!208095)))

(declare-fun c!52512 () Bool)

(assert (=> d!70841 (= c!52512 (= (select (arr!8413 _keys!1895) #b00000000000000000000000000000000) k0!1348))))

(assert (=> d!70841 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)) (bvslt (size!8765 _keys!1895) #b01111111111111111111111111111111))))

(assert (=> d!70841 (= (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) lt!161077)))

(declare-fun b!339177 () Bool)

(assert (=> b!339177 (= e!208095 #b00000000000000000000000000000000)))

(declare-fun b!339178 () Bool)

(assert (=> b!339178 (= e!208095 (arrayScanForKey!0 _keys!1895 k0!1348 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70841 c!52512) b!339177))

(assert (= (and d!70841 (not c!52512)) b!339178))

(declare-fun m!342239 () Bool)

(assert (=> d!70841 m!342239))

(assert (=> d!70841 m!342233))

(declare-fun m!342241 () Bool)

(assert (=> b!339178 m!342241))

(assert (=> b!339119 d!70841))

(declare-fun d!70843 () Bool)

(declare-fun res!187370 () Bool)

(declare-fun e!208104 () Bool)

(assert (=> d!70843 (=> res!187370 e!208104)))

(assert (=> d!70843 (= res!187370 (bvsge #b00000000000000000000000000000000 (size!8765 _keys!1895)))))

(assert (=> d!70843 (= (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4825) e!208104)))

(declare-fun b!339189 () Bool)

(declare-fun e!208107 () Bool)

(declare-fun e!208106 () Bool)

(assert (=> b!339189 (= e!208107 e!208106)))

(declare-fun c!52515 () Bool)

(assert (=> b!339189 (= c!52515 (validKeyInArray!0 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339190 () Bool)

(assert (=> b!339190 (= e!208104 e!208107)))

(declare-fun res!187369 () Bool)

(assert (=> b!339190 (=> (not res!187369) (not e!208107))))

(declare-fun e!208105 () Bool)

(assert (=> b!339190 (= res!187369 (not e!208105))))

(declare-fun res!187368 () Bool)

(assert (=> b!339190 (=> (not res!187368) (not e!208105))))

(assert (=> b!339190 (= res!187368 (validKeyInArray!0 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun bm!26458 () Bool)

(declare-fun call!26461 () Bool)

(assert (=> bm!26458 (= call!26461 (arrayNoDuplicates!0 _keys!1895 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!52515 (Cons!4824 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000) Nil!4825) Nil!4825)))))

(declare-fun b!339191 () Bool)

(assert (=> b!339191 (= e!208106 call!26461)))

(declare-fun b!339192 () Bool)

(assert (=> b!339192 (= e!208106 call!26461)))

(declare-fun b!339193 () Bool)

(declare-fun contains!2128 (List!4828 (_ BitVec 64)) Bool)

(assert (=> b!339193 (= e!208105 (contains!2128 Nil!4825 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(assert (= (and d!70843 (not res!187370)) b!339190))

(assert (= (and b!339190 res!187368) b!339193))

(assert (= (and b!339190 res!187369) b!339189))

(assert (= (and b!339189 c!52515) b!339192))

(assert (= (and b!339189 (not c!52515)) b!339191))

(assert (= (or b!339192 b!339191) bm!26458))

(assert (=> b!339189 m!342233))

(assert (=> b!339189 m!342233))

(declare-fun m!342243 () Bool)

(assert (=> b!339189 m!342243))

(assert (=> b!339190 m!342233))

(assert (=> b!339190 m!342233))

(assert (=> b!339190 m!342243))

(assert (=> bm!26458 m!342233))

(declare-fun m!342245 () Bool)

(assert (=> bm!26458 m!342245))

(assert (=> b!339193 m!342233))

(assert (=> b!339193 m!342233))

(declare-fun m!342247 () Bool)

(assert (=> b!339193 m!342247))

(assert (=> b!339124 d!70843))

(declare-fun d!70845 () Bool)

(declare-fun e!208112 () Bool)

(assert (=> d!70845 e!208112))

(declare-fun res!187373 () Bool)

(assert (=> d!70845 (=> res!187373 e!208112)))

(declare-fun lt!161089 () Bool)

(assert (=> d!70845 (= res!187373 (not lt!161089))))

(declare-fun lt!161088 () Bool)

(assert (=> d!70845 (= lt!161089 lt!161088)))

(declare-fun lt!161086 () Unit!10553)

(declare-fun e!208113 () Unit!10553)

(assert (=> d!70845 (= lt!161086 e!208113)))

(declare-fun c!52518 () Bool)

(assert (=> d!70845 (= c!52518 lt!161088)))

(declare-fun containsKey!322 (List!4827 (_ BitVec 64)) Bool)

(assert (=> d!70845 (= lt!161088 (containsKey!322 (toList!2077 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(assert (=> d!70845 (= (contains!2127 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348) lt!161089)))

(declare-fun b!339200 () Bool)

(declare-fun lt!161087 () Unit!10553)

(assert (=> b!339200 (= e!208113 lt!161087)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!270 (List!4827 (_ BitVec 64)) Unit!10553)

(assert (=> b!339200 (= lt!161087 (lemmaContainsKeyImpliesGetValueByKeyDefined!270 (toList!2077 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-datatypes ((Option!336 0))(
  ( (Some!335 (v!5759 V!10429)) (None!334) )
))
(declare-fun isDefined!271 (Option!336) Bool)

(declare-fun getValueByKey!330 (List!4827 (_ BitVec 64)) Option!336)

(assert (=> b!339200 (isDefined!271 (getValueByKey!330 (toList!2077 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348))))

(declare-fun b!339201 () Bool)

(declare-fun Unit!10560 () Unit!10553)

(assert (=> b!339201 (= e!208113 Unit!10560)))

(declare-fun b!339202 () Bool)

(assert (=> b!339202 (= e!208112 (isDefined!271 (getValueByKey!330 (toList!2077 (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528)) k0!1348)))))

(assert (= (and d!70845 c!52518) b!339200))

(assert (= (and d!70845 (not c!52518)) b!339201))

(assert (= (and d!70845 (not res!187373)) b!339202))

(declare-fun m!342249 () Bool)

(assert (=> d!70845 m!342249))

(declare-fun m!342251 () Bool)

(assert (=> b!339200 m!342251))

(declare-fun m!342253 () Bool)

(assert (=> b!339200 m!342253))

(assert (=> b!339200 m!342253))

(declare-fun m!342255 () Bool)

(assert (=> b!339200 m!342255))

(assert (=> b!339202 m!342253))

(assert (=> b!339202 m!342253))

(assert (=> b!339202 m!342255))

(assert (=> b!339111 d!70845))

(declare-fun bm!26473 () Bool)

(declare-fun call!26477 () ListLongMap!4123)

(declare-fun call!26476 () ListLongMap!4123)

(assert (=> bm!26473 (= call!26477 call!26476)))

(declare-fun b!339245 () Bool)

(declare-fun e!208141 () Bool)

(declare-fun e!208148 () Bool)

(assert (=> b!339245 (= e!208141 e!208148)))

(declare-fun c!52531 () Bool)

(assert (=> b!339245 (= c!52531 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun c!52536 () Bool)

(declare-fun call!26481 () ListLongMap!4123)

(declare-fun call!26479 () ListLongMap!4123)

(declare-fun c!52532 () Bool)

(declare-fun bm!26474 () Bool)

(declare-fun +!721 (ListLongMap!4123 tuple2!5210) ListLongMap!4123)

(assert (=> bm!26474 (= call!26481 (+!721 (ite c!52532 call!26476 (ite c!52536 call!26477 call!26479)) (ite (or c!52532 c!52536) (tuple2!5211 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1467) (tuple2!5211 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467))))))

(declare-fun b!339246 () Bool)

(declare-fun c!52533 () Bool)

(assert (=> b!339246 (= c!52533 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!208146 () ListLongMap!4123)

(declare-fun e!208140 () ListLongMap!4123)

(assert (=> b!339246 (= e!208146 e!208140)))

(declare-fun b!339247 () Bool)

(declare-fun call!26480 () ListLongMap!4123)

(assert (=> b!339247 (= e!208140 call!26480)))

(declare-fun b!339248 () Bool)

(declare-fun e!208147 () Bool)

(declare-fun e!208145 () Bool)

(assert (=> b!339248 (= e!208147 e!208145)))

(declare-fun res!187399 () Bool)

(declare-fun call!26482 () Bool)

(assert (=> b!339248 (= res!187399 call!26482)))

(assert (=> b!339248 (=> (not res!187399) (not e!208145))))

(declare-fun d!70847 () Bool)

(assert (=> d!70847 e!208141))

(declare-fun res!187395 () Bool)

(assert (=> d!70847 (=> (not res!187395) (not e!208141))))

(assert (=> d!70847 (= res!187395 (or (bvsge #b00000000000000000000000000000000 (size!8765 _keys!1895)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)))))))

(declare-fun lt!161137 () ListLongMap!4123)

(declare-fun lt!161151 () ListLongMap!4123)

(assert (=> d!70847 (= lt!161137 lt!161151)))

(declare-fun lt!161150 () Unit!10553)

(declare-fun e!208144 () Unit!10553)

(assert (=> d!70847 (= lt!161150 e!208144)))

(declare-fun c!52535 () Bool)

(declare-fun e!208142 () Bool)

(assert (=> d!70847 (= c!52535 e!208142)))

(declare-fun res!187392 () Bool)

(assert (=> d!70847 (=> (not res!187392) (not e!208142))))

(assert (=> d!70847 (= res!187392 (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)))))

(declare-fun e!208151 () ListLongMap!4123)

(assert (=> d!70847 (= lt!161151 e!208151)))

(assert (=> d!70847 (= c!52532 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!70847 (validMask!0 mask!2385)))

(assert (=> d!70847 (= (getCurrentListMap!1598 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) lt!161137)))

(declare-fun b!339249 () Bool)

(declare-fun lt!161143 () Unit!10553)

(assert (=> b!339249 (= e!208144 lt!161143)))

(declare-fun lt!161134 () ListLongMap!4123)

(declare-fun getCurrentListMapNoExtraKeys!594 (array!17777 array!17775 (_ BitVec 32) (_ BitVec 32) V!10429 V!10429 (_ BitVec 32) Int) ListLongMap!4123)

(assert (=> b!339249 (= lt!161134 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161140 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161140 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161154 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161154 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161146 () Unit!10553)

(declare-fun addStillContains!248 (ListLongMap!4123 (_ BitVec 64) V!10429 (_ BitVec 64)) Unit!10553)

(assert (=> b!339249 (= lt!161146 (addStillContains!248 lt!161134 lt!161140 zeroValue!1467 lt!161154))))

(assert (=> b!339249 (contains!2127 (+!721 lt!161134 (tuple2!5211 lt!161140 zeroValue!1467)) lt!161154)))

(declare-fun lt!161148 () Unit!10553)

(assert (=> b!339249 (= lt!161148 lt!161146)))

(declare-fun lt!161135 () ListLongMap!4123)

(assert (=> b!339249 (= lt!161135 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161152 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161152 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161136 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161136 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161142 () Unit!10553)

(declare-fun addApplyDifferent!248 (ListLongMap!4123 (_ BitVec 64) V!10429 (_ BitVec 64)) Unit!10553)

(assert (=> b!339249 (= lt!161142 (addApplyDifferent!248 lt!161135 lt!161152 minValue!1467 lt!161136))))

(declare-fun apply!272 (ListLongMap!4123 (_ BitVec 64)) V!10429)

(assert (=> b!339249 (= (apply!272 (+!721 lt!161135 (tuple2!5211 lt!161152 minValue!1467)) lt!161136) (apply!272 lt!161135 lt!161136))))

(declare-fun lt!161147 () Unit!10553)

(assert (=> b!339249 (= lt!161147 lt!161142)))

(declare-fun lt!161155 () ListLongMap!4123)

(assert (=> b!339249 (= lt!161155 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161144 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161144 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161138 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161138 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161149 () Unit!10553)

(assert (=> b!339249 (= lt!161149 (addApplyDifferent!248 lt!161155 lt!161144 zeroValue!1467 lt!161138))))

(assert (=> b!339249 (= (apply!272 (+!721 lt!161155 (tuple2!5211 lt!161144 zeroValue!1467)) lt!161138) (apply!272 lt!161155 lt!161138))))

(declare-fun lt!161139 () Unit!10553)

(assert (=> b!339249 (= lt!161139 lt!161149)))

(declare-fun lt!161153 () ListLongMap!4123)

(assert (=> b!339249 (= lt!161153 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun lt!161145 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161145 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161141 () (_ BitVec 64))

(assert (=> b!339249 (= lt!161141 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000))))

(assert (=> b!339249 (= lt!161143 (addApplyDifferent!248 lt!161153 lt!161145 minValue!1467 lt!161141))))

(assert (=> b!339249 (= (apply!272 (+!721 lt!161153 (tuple2!5211 lt!161145 minValue!1467)) lt!161141) (apply!272 lt!161153 lt!161141))))

(declare-fun b!339250 () Bool)

(declare-fun e!208149 () Bool)

(declare-fun get!4580 (ValueCell!3201 V!10429) V!10429)

(declare-fun dynLambda!615 (Int (_ BitVec 64)) V!10429)

(assert (=> b!339250 (= e!208149 (= (apply!272 lt!161137 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)) (get!4580 (select (arr!8412 _values!1525) #b00000000000000000000000000000000) (dynLambda!615 defaultEntry!1528 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339250 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8764 _values!1525)))))

(assert (=> b!339250 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)))))

(declare-fun bm!26475 () Bool)

(declare-fun call!26478 () Bool)

(assert (=> bm!26475 (= call!26478 (contains!2127 lt!161137 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339251 () Bool)

(assert (=> b!339251 (= e!208147 (not call!26482))))

(declare-fun bm!26476 () Bool)

(assert (=> bm!26476 (= call!26482 (contains!2127 lt!161137 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!339252 () Bool)

(declare-fun e!208152 () Bool)

(assert (=> b!339252 (= e!208152 (validKeyInArray!0 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339253 () Bool)

(assert (=> b!339253 (= e!208151 e!208146)))

(assert (=> b!339253 (= c!52536 (and (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1446 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!26477 () Bool)

(assert (=> bm!26477 (= call!26480 call!26481)))

(declare-fun b!339254 () Bool)

(assert (=> b!339254 (= e!208151 (+!721 call!26481 (tuple2!5211 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1467)))))

(declare-fun b!339255 () Bool)

(declare-fun e!208143 () Bool)

(assert (=> b!339255 (= e!208143 (= (apply!272 lt!161137 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1467))))

(declare-fun b!339256 () Bool)

(assert (=> b!339256 (= e!208142 (validKeyInArray!0 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339257 () Bool)

(declare-fun e!208150 () Bool)

(assert (=> b!339257 (= e!208150 e!208149)))

(declare-fun res!187394 () Bool)

(assert (=> b!339257 (=> (not res!187394) (not e!208149))))

(assert (=> b!339257 (= res!187394 (contains!2127 lt!161137 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(assert (=> b!339257 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)))))

(declare-fun b!339258 () Bool)

(assert (=> b!339258 (= e!208148 (not call!26478))))

(declare-fun b!339259 () Bool)

(declare-fun Unit!10561 () Unit!10553)

(assert (=> b!339259 (= e!208144 Unit!10561)))

(declare-fun b!339260 () Bool)

(declare-fun res!187398 () Bool)

(assert (=> b!339260 (=> (not res!187398) (not e!208141))))

(assert (=> b!339260 (= res!187398 e!208147)))

(declare-fun c!52534 () Bool)

(assert (=> b!339260 (= c!52534 (not (= (bvand extraKeys!1446 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!26478 () Bool)

(assert (=> bm!26478 (= call!26476 (getCurrentListMapNoExtraKeys!594 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!339261 () Bool)

(declare-fun res!187396 () Bool)

(assert (=> b!339261 (=> (not res!187396) (not e!208141))))

(assert (=> b!339261 (= res!187396 e!208150)))

(declare-fun res!187393 () Bool)

(assert (=> b!339261 (=> res!187393 e!208150)))

(assert (=> b!339261 (= res!187393 (not e!208152))))

(declare-fun res!187397 () Bool)

(assert (=> b!339261 (=> (not res!187397) (not e!208152))))

(assert (=> b!339261 (= res!187397 (bvslt #b00000000000000000000000000000000 (size!8765 _keys!1895)))))

(declare-fun bm!26479 () Bool)

(assert (=> bm!26479 (= call!26479 call!26477)))

(declare-fun b!339262 () Bool)

(assert (=> b!339262 (= e!208145 (= (apply!272 lt!161137 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1467))))

(declare-fun b!339263 () Bool)

(assert (=> b!339263 (= e!208140 call!26479)))

(declare-fun b!339264 () Bool)

(assert (=> b!339264 (= e!208148 e!208143)))

(declare-fun res!187400 () Bool)

(assert (=> b!339264 (= res!187400 call!26478)))

(assert (=> b!339264 (=> (not res!187400) (not e!208143))))

(declare-fun b!339265 () Bool)

(assert (=> b!339265 (= e!208146 call!26480)))

(assert (= (and d!70847 c!52532) b!339254))

(assert (= (and d!70847 (not c!52532)) b!339253))

(assert (= (and b!339253 c!52536) b!339265))

(assert (= (and b!339253 (not c!52536)) b!339246))

(assert (= (and b!339246 c!52533) b!339247))

(assert (= (and b!339246 (not c!52533)) b!339263))

(assert (= (or b!339247 b!339263) bm!26479))

(assert (= (or b!339265 bm!26479) bm!26473))

(assert (= (or b!339265 b!339247) bm!26477))

(assert (= (or b!339254 bm!26473) bm!26478))

(assert (= (or b!339254 bm!26477) bm!26474))

(assert (= (and d!70847 res!187392) b!339256))

(assert (= (and d!70847 c!52535) b!339249))

(assert (= (and d!70847 (not c!52535)) b!339259))

(assert (= (and d!70847 res!187395) b!339261))

(assert (= (and b!339261 res!187397) b!339252))

(assert (= (and b!339261 (not res!187393)) b!339257))

(assert (= (and b!339257 res!187394) b!339250))

(assert (= (and b!339261 res!187396) b!339260))

(assert (= (and b!339260 c!52534) b!339248))

(assert (= (and b!339260 (not c!52534)) b!339251))

(assert (= (and b!339248 res!187399) b!339262))

(assert (= (or b!339248 b!339251) bm!26476))

(assert (= (and b!339260 res!187398) b!339245))

(assert (= (and b!339245 c!52531) b!339264))

(assert (= (and b!339245 (not c!52531)) b!339258))

(assert (= (and b!339264 res!187400) b!339255))

(assert (= (or b!339264 b!339258) bm!26475))

(declare-fun b_lambda!8427 () Bool)

(assert (=> (not b_lambda!8427) (not b!339250)))

(declare-fun t!9931 () Bool)

(declare-fun tb!3059 () Bool)

(assert (=> (and start!34032 (= defaultEntry!1528 defaultEntry!1528) t!9931) tb!3059))

(declare-fun result!5507 () Bool)

(assert (=> tb!3059 (= result!5507 tp_is_empty!7089)))

(assert (=> b!339250 t!9931))

(declare-fun b_and!14333 () Bool)

(assert (= b_and!14329 (and (=> t!9931 result!5507) b_and!14333)))

(declare-fun m!342257 () Bool)

(assert (=> b!339262 m!342257))

(declare-fun m!342259 () Bool)

(assert (=> bm!26476 m!342259))

(declare-fun m!342261 () Bool)

(assert (=> b!339255 m!342261))

(assert (=> d!70847 m!342175))

(declare-fun m!342263 () Bool)

(assert (=> bm!26475 m!342263))

(assert (=> b!339252 m!342233))

(assert (=> b!339252 m!342233))

(assert (=> b!339252 m!342243))

(declare-fun m!342265 () Bool)

(assert (=> bm!26474 m!342265))

(declare-fun m!342267 () Bool)

(assert (=> b!339254 m!342267))

(declare-fun m!342269 () Bool)

(assert (=> b!339249 m!342269))

(declare-fun m!342271 () Bool)

(assert (=> b!339249 m!342271))

(declare-fun m!342273 () Bool)

(assert (=> b!339249 m!342273))

(declare-fun m!342275 () Bool)

(assert (=> b!339249 m!342275))

(declare-fun m!342277 () Bool)

(assert (=> b!339249 m!342277))

(declare-fun m!342279 () Bool)

(assert (=> b!339249 m!342279))

(declare-fun m!342281 () Bool)

(assert (=> b!339249 m!342281))

(declare-fun m!342283 () Bool)

(assert (=> b!339249 m!342283))

(assert (=> b!339249 m!342277))

(declare-fun m!342285 () Bool)

(assert (=> b!339249 m!342285))

(declare-fun m!342287 () Bool)

(assert (=> b!339249 m!342287))

(assert (=> b!339249 m!342281))

(declare-fun m!342289 () Bool)

(assert (=> b!339249 m!342289))

(declare-fun m!342291 () Bool)

(assert (=> b!339249 m!342291))

(assert (=> b!339249 m!342233))

(assert (=> b!339249 m!342271))

(declare-fun m!342293 () Bool)

(assert (=> b!339249 m!342293))

(declare-fun m!342295 () Bool)

(assert (=> b!339249 m!342295))

(assert (=> b!339249 m!342269))

(declare-fun m!342297 () Bool)

(assert (=> b!339249 m!342297))

(declare-fun m!342299 () Bool)

(assert (=> b!339249 m!342299))

(assert (=> b!339257 m!342233))

(assert (=> b!339257 m!342233))

(declare-fun m!342301 () Bool)

(assert (=> b!339257 m!342301))

(assert (=> b!339250 m!342233))

(declare-fun m!342303 () Bool)

(assert (=> b!339250 m!342303))

(assert (=> b!339250 m!342233))

(declare-fun m!342305 () Bool)

(assert (=> b!339250 m!342305))

(declare-fun m!342307 () Bool)

(assert (=> b!339250 m!342307))

(declare-fun m!342309 () Bool)

(assert (=> b!339250 m!342309))

(assert (=> b!339250 m!342307))

(assert (=> b!339250 m!342305))

(assert (=> bm!26478 m!342285))

(assert (=> b!339256 m!342233))

(assert (=> b!339256 m!342233))

(assert (=> b!339256 m!342243))

(assert (=> b!339111 d!70847))

(declare-fun d!70849 () Bool)

(assert (=> d!70849 (= (validKeyInArray!0 k0!1348) (and (not (= k0!1348 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1348 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!339121 d!70849))

(declare-fun d!70851 () Bool)

(assert (=> d!70851 (= (inRange!0 (index!15179 lt!161058) mask!2385) (and (bvsge (index!15179 lt!161058) #b00000000000000000000000000000000) (bvslt (index!15179 lt!161058) (bvadd mask!2385 #b00000000000000000000000000000001))))))

(assert (=> b!339112 d!70851))

(declare-fun b!339280 () Bool)

(declare-fun c!52544 () Bool)

(declare-fun lt!161162 () (_ BitVec 64))

(assert (=> b!339280 (= c!52544 (= lt!161162 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!208159 () SeekEntryResult!3250)

(declare-fun e!208161 () SeekEntryResult!3250)

(assert (=> b!339280 (= e!208159 e!208161)))

(declare-fun b!339281 () Bool)

(declare-fun e!208160 () SeekEntryResult!3250)

(assert (=> b!339281 (= e!208160 Undefined!3250)))

(declare-fun b!339282 () Bool)

(assert (=> b!339282 (= e!208160 e!208159)))

(declare-fun lt!161163 () SeekEntryResult!3250)

(assert (=> b!339282 (= lt!161162 (select (arr!8413 _keys!1895) (index!15181 lt!161163)))))

(declare-fun c!52543 () Bool)

(assert (=> b!339282 (= c!52543 (= lt!161162 k0!1348))))

(declare-fun d!70853 () Bool)

(declare-fun lt!161164 () SeekEntryResult!3250)

(assert (=> d!70853 (and (or ((_ is Undefined!3250) lt!161164) (not ((_ is Found!3250) lt!161164)) (and (bvsge (index!15180 lt!161164) #b00000000000000000000000000000000) (bvslt (index!15180 lt!161164) (size!8765 _keys!1895)))) (or ((_ is Undefined!3250) lt!161164) ((_ is Found!3250) lt!161164) (not ((_ is MissingZero!3250) lt!161164)) (and (bvsge (index!15179 lt!161164) #b00000000000000000000000000000000) (bvslt (index!15179 lt!161164) (size!8765 _keys!1895)))) (or ((_ is Undefined!3250) lt!161164) ((_ is Found!3250) lt!161164) ((_ is MissingZero!3250) lt!161164) (not ((_ is MissingVacant!3250) lt!161164)) (and (bvsge (index!15182 lt!161164) #b00000000000000000000000000000000) (bvslt (index!15182 lt!161164) (size!8765 _keys!1895)))) (or ((_ is Undefined!3250) lt!161164) (ite ((_ is Found!3250) lt!161164) (= (select (arr!8413 _keys!1895) (index!15180 lt!161164)) k0!1348) (ite ((_ is MissingZero!3250) lt!161164) (= (select (arr!8413 _keys!1895) (index!15179 lt!161164)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3250) lt!161164) (= (select (arr!8413 _keys!1895) (index!15182 lt!161164)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70853 (= lt!161164 e!208160)))

(declare-fun c!52545 () Bool)

(assert (=> d!70853 (= c!52545 (and ((_ is Intermediate!3250) lt!161163) (undefined!4062 lt!161163)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17777 (_ BitVec 32)) SeekEntryResult!3250)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70853 (= lt!161163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1348 mask!2385) k0!1348 _keys!1895 mask!2385))))

(assert (=> d!70853 (validMask!0 mask!2385)))

(assert (=> d!70853 (= (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385) lt!161164)))

(declare-fun b!339283 () Bool)

(assert (=> b!339283 (= e!208159 (Found!3250 (index!15181 lt!161163)))))

(declare-fun b!339284 () Bool)

(assert (=> b!339284 (= e!208161 (MissingZero!3250 (index!15181 lt!161163)))))

(declare-fun b!339285 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!17777 (_ BitVec 32)) SeekEntryResult!3250)

(assert (=> b!339285 (= e!208161 (seekKeyOrZeroReturnVacant!0 (x!33780 lt!161163) (index!15181 lt!161163) (index!15181 lt!161163) k0!1348 _keys!1895 mask!2385))))

(assert (= (and d!70853 c!52545) b!339281))

(assert (= (and d!70853 (not c!52545)) b!339282))

(assert (= (and b!339282 c!52543) b!339283))

(assert (= (and b!339282 (not c!52543)) b!339280))

(assert (= (and b!339280 c!52544) b!339284))

(assert (= (and b!339280 (not c!52544)) b!339285))

(declare-fun m!342311 () Bool)

(assert (=> b!339282 m!342311))

(declare-fun m!342313 () Bool)

(assert (=> d!70853 m!342313))

(assert (=> d!70853 m!342175))

(declare-fun m!342315 () Bool)

(assert (=> d!70853 m!342315))

(declare-fun m!342317 () Bool)

(assert (=> d!70853 m!342317))

(declare-fun m!342319 () Bool)

(assert (=> d!70853 m!342319))

(assert (=> d!70853 m!342313))

(declare-fun m!342321 () Bool)

(assert (=> d!70853 m!342321))

(declare-fun m!342323 () Bool)

(assert (=> b!339285 m!342323))

(assert (=> b!339117 d!70853))

(declare-fun d!70855 () Bool)

(declare-fun res!187406 () Bool)

(declare-fun e!208169 () Bool)

(assert (=> d!70855 (=> res!187406 e!208169)))

(assert (=> d!70855 (= res!187406 (bvsge #b00000000000000000000000000000000 (size!8765 _keys!1895)))))

(assert (=> d!70855 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385) e!208169)))

(declare-fun b!339294 () Bool)

(declare-fun e!208168 () Bool)

(declare-fun e!208170 () Bool)

(assert (=> b!339294 (= e!208168 e!208170)))

(declare-fun lt!161173 () (_ BitVec 64))

(assert (=> b!339294 (= lt!161173 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000))))

(declare-fun lt!161172 () Unit!10553)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17777 (_ BitVec 64) (_ BitVec 32)) Unit!10553)

(assert (=> b!339294 (= lt!161172 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 lt!161173 #b00000000000000000000000000000000))))

(assert (=> b!339294 (arrayContainsKey!0 _keys!1895 lt!161173 #b00000000000000000000000000000000)))

(declare-fun lt!161171 () Unit!10553)

(assert (=> b!339294 (= lt!161171 lt!161172)))

(declare-fun res!187405 () Bool)

(assert (=> b!339294 (= res!187405 (= (seekEntryOrOpen!0 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000) _keys!1895 mask!2385) (Found!3250 #b00000000000000000000000000000000)))))

(assert (=> b!339294 (=> (not res!187405) (not e!208170))))

(declare-fun b!339295 () Bool)

(assert (=> b!339295 (= e!208169 e!208168)))

(declare-fun c!52548 () Bool)

(assert (=> b!339295 (= c!52548 (validKeyInArray!0 (select (arr!8413 _keys!1895) #b00000000000000000000000000000000)))))

(declare-fun b!339296 () Bool)

(declare-fun call!26485 () Bool)

(assert (=> b!339296 (= e!208168 call!26485)))

(declare-fun bm!26482 () Bool)

(assert (=> bm!26482 (= call!26485 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1895 mask!2385))))

(declare-fun b!339297 () Bool)

(assert (=> b!339297 (= e!208170 call!26485)))

(assert (= (and d!70855 (not res!187406)) b!339295))

(assert (= (and b!339295 c!52548) b!339294))

(assert (= (and b!339295 (not c!52548)) b!339296))

(assert (= (and b!339294 res!187405) b!339297))

(assert (= (or b!339297 b!339296) bm!26482))

(assert (=> b!339294 m!342233))

(declare-fun m!342325 () Bool)

(assert (=> b!339294 m!342325))

(declare-fun m!342327 () Bool)

(assert (=> b!339294 m!342327))

(assert (=> b!339294 m!342233))

(declare-fun m!342329 () Bool)

(assert (=> b!339294 m!342329))

(assert (=> b!339295 m!342233))

(assert (=> b!339295 m!342233))

(assert (=> b!339295 m!342243))

(declare-fun m!342331 () Bool)

(assert (=> bm!26482 m!342331))

(assert (=> b!339123 d!70855))

(declare-fun condMapEmpty!12054 () Bool)

(declare-fun mapDefault!12054 () ValueCell!3201)

(assert (=> mapNonEmpty!12048 (= condMapEmpty!12054 (= mapRest!12048 ((as const (Array (_ BitVec 32) ValueCell!3201)) mapDefault!12054)))))

(declare-fun e!208176 () Bool)

(declare-fun mapRes!12054 () Bool)

(assert (=> mapNonEmpty!12048 (= tp!24933 (and e!208176 mapRes!12054))))

(declare-fun mapNonEmpty!12054 () Bool)

(declare-fun tp!24942 () Bool)

(declare-fun e!208175 () Bool)

(assert (=> mapNonEmpty!12054 (= mapRes!12054 (and tp!24942 e!208175))))

(declare-fun mapKey!12054 () (_ BitVec 32))

(declare-fun mapRest!12054 () (Array (_ BitVec 32) ValueCell!3201))

(declare-fun mapValue!12054 () ValueCell!3201)

(assert (=> mapNonEmpty!12054 (= mapRest!12048 (store mapRest!12054 mapKey!12054 mapValue!12054))))

(declare-fun b!339304 () Bool)

(assert (=> b!339304 (= e!208175 tp_is_empty!7089)))

(declare-fun b!339305 () Bool)

(assert (=> b!339305 (= e!208176 tp_is_empty!7089)))

(declare-fun mapIsEmpty!12054 () Bool)

(assert (=> mapIsEmpty!12054 mapRes!12054))

(assert (= (and mapNonEmpty!12048 condMapEmpty!12054) mapIsEmpty!12054))

(assert (= (and mapNonEmpty!12048 (not condMapEmpty!12054)) mapNonEmpty!12054))

(assert (= (and mapNonEmpty!12054 ((_ is ValueCellFull!3201) mapValue!12054)) b!339304))

(assert (= (and mapNonEmpty!12048 ((_ is ValueCellFull!3201) mapDefault!12054)) b!339305))

(declare-fun m!342333 () Bool)

(assert (=> mapNonEmpty!12054 m!342333))

(declare-fun b_lambda!8429 () Bool)

(assert (= b_lambda!8427 (or (and start!34032 b_free!7137) b_lambda!8429)))

(check-sat (not b!339257) (not b_next!7137) (not b!339193) (not d!70839) (not b!339250) (not bm!26458) (not bm!26475) tp_is_empty!7089 (not b!339285) (not d!70847) (not d!70853) (not mapNonEmpty!12054) (not bm!26482) (not bm!26476) (not b!339256) (not b!339200) (not b!339294) (not b!339190) (not b!339255) (not b!339295) (not b!339262) b_and!14333 (not b!339249) (not bm!26478) (not b_lambda!8429) (not b!339189) (not d!70845) (not b!339252) (not bm!26474) (not b!339178) (not b!339254) (not b!339172) (not b!339202))
(check-sat b_and!14333 (not b_next!7137))
