; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!988 () Bool)

(assert start!988)

(declare-fun b_free!339 () Bool)

(declare-fun b_next!339 () Bool)

(assert (=> start!988 (= b_free!339 (not b_next!339))))

(declare-fun tp!1253 () Bool)

(declare-fun b_and!489 () Bool)

(assert (=> start!988 (= tp!1253 b_and!489)))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!1773 () (_ BitVec 32))

(declare-datatypes ((array!765 0))(
  ( (array!766 (arr!369 (Array (_ BitVec 32) (_ BitVec 64))) (size!431 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!765)

(declare-fun b!8492 () Bool)

(declare-fun e!4831 () Bool)

(assert (=> b!8492 (= e!4831 (or (not (= (size!431 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))) (bvsgt #b00000000000000000000000000000000 (size!431 _keys!1806)) (and (bvsge lt!1773 #b00000000000000000000000000000000) (bvsle lt!1773 (size!431 _keys!1806)))))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!765 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8492 (= lt!1773 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8493 () Bool)

(declare-fun res!7993 () Bool)

(declare-fun e!4829 () Bool)

(assert (=> b!8493 (=> (not res!7993) (not e!4829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!765 (_ BitVec 32)) Bool)

(assert (=> b!8493 (= res!7993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8494 () Bool)

(declare-fun e!4826 () Bool)

(declare-fun tp_is_empty!417 () Bool)

(assert (=> b!8494 (= e!4826 tp_is_empty!417)))

(declare-fun b!8495 () Bool)

(declare-fun e!4828 () Bool)

(assert (=> b!8495 (= e!4828 tp_is_empty!417)))

(declare-fun res!7995 () Bool)

(assert (=> start!988 (=> (not res!7995) (not e!4829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!988 (= res!7995 (validMask!0 mask!2250))))

(assert (=> start!988 e!4829))

(assert (=> start!988 tp!1253))

(assert (=> start!988 true))

(declare-datatypes ((V!733 0))(
  ( (V!734 (val!214 Int)) )
))
(declare-datatypes ((ValueCell!192 0))(
  ( (ValueCellFull!192 (v!1307 V!733)) (EmptyCell!192) )
))
(declare-datatypes ((array!767 0))(
  ( (array!768 (arr!370 (Array (_ BitVec 32) ValueCell!192)) (size!432 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!767)

(declare-fun e!4827 () Bool)

(declare-fun array_inv!273 (array!767) Bool)

(assert (=> start!988 (and (array_inv!273 _values!1492) e!4827)))

(assert (=> start!988 tp_is_empty!417))

(declare-fun array_inv!274 (array!765) Bool)

(assert (=> start!988 (array_inv!274 _keys!1806)))

(declare-fun b!8496 () Bool)

(declare-fun mapRes!602 () Bool)

(assert (=> b!8496 (= e!4827 (and e!4826 mapRes!602))))

(declare-fun condMapEmpty!602 () Bool)

(declare-fun mapDefault!602 () ValueCell!192)

(assert (=> b!8496 (= condMapEmpty!602 (= (arr!370 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!192)) mapDefault!602)))))

(declare-fun b!8497 () Bool)

(declare-fun res!7992 () Bool)

(assert (=> b!8497 (=> (not res!7992) (not e!4829))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8497 (= res!7992 (and (= (size!432 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!431 _keys!1806) (size!432 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8498 () Bool)

(declare-fun res!7991 () Bool)

(assert (=> b!8498 (=> (not res!7991) (not e!4829))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!733)

(declare-fun zeroValue!1434 () V!733)

(declare-datatypes ((tuple2!244 0))(
  ( (tuple2!245 (_1!122 (_ BitVec 64)) (_2!122 V!733)) )
))
(declare-datatypes ((List!254 0))(
  ( (Nil!251) (Cons!250 (h!816 tuple2!244) (t!2393 List!254)) )
))
(declare-datatypes ((ListLongMap!249 0))(
  ( (ListLongMap!250 (toList!140 List!254)) )
))
(declare-fun contains!116 (ListLongMap!249 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!99 (array!765 array!767 (_ BitVec 32) (_ BitVec 32) V!733 V!733 (_ BitVec 32) Int) ListLongMap!249)

(assert (=> b!8498 (= res!7991 (contains!116 (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!602 () Bool)

(assert (=> mapIsEmpty!602 mapRes!602))

(declare-fun b!8499 () Bool)

(declare-fun res!7996 () Bool)

(assert (=> b!8499 (=> (not res!7996) (not e!4829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8499 (= res!7996 (validKeyInArray!0 k0!1278))))

(declare-fun b!8500 () Bool)

(declare-fun res!7994 () Bool)

(assert (=> b!8500 (=> (not res!7994) (not e!4829))))

(declare-datatypes ((List!255 0))(
  ( (Nil!252) (Cons!251 (h!817 (_ BitVec 64)) (t!2394 List!255)) )
))
(declare-fun arrayNoDuplicates!0 (array!765 (_ BitVec 32) List!255) Bool)

(assert (=> b!8500 (= res!7994 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!252))))

(declare-fun b!8501 () Bool)

(assert (=> b!8501 (= e!4829 (not e!4831))))

(declare-fun res!7990 () Bool)

(assert (=> b!8501 (=> res!7990 e!4831)))

(declare-fun arrayContainsKey!0 (array!765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8501 (= res!7990 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(declare-fun e!4832 () Bool)

(assert (=> b!8501 e!4832))

(declare-fun c!623 () Bool)

(assert (=> b!8501 (= c!623 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!165 0))(
  ( (Unit!166) )
))
(declare-fun lt!1772 () Unit!165)

(declare-fun lemmaKeyInListMapIsInArray!62 (array!765 array!767 (_ BitVec 32) (_ BitVec 32) V!733 V!733 (_ BitVec 64) Int) Unit!165)

(assert (=> b!8501 (= lt!1772 (lemmaKeyInListMapIsInArray!62 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8502 () Bool)

(assert (=> b!8502 (= e!4832 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8503 () Bool)

(assert (=> b!8503 (= e!4832 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!602 () Bool)

(declare-fun tp!1252 () Bool)

(assert (=> mapNonEmpty!602 (= mapRes!602 (and tp!1252 e!4828))))

(declare-fun mapRest!602 () (Array (_ BitVec 32) ValueCell!192))

(declare-fun mapValue!602 () ValueCell!192)

(declare-fun mapKey!602 () (_ BitVec 32))

(assert (=> mapNonEmpty!602 (= (arr!370 _values!1492) (store mapRest!602 mapKey!602 mapValue!602))))

(assert (= (and start!988 res!7995) b!8497))

(assert (= (and b!8497 res!7992) b!8493))

(assert (= (and b!8493 res!7993) b!8500))

(assert (= (and b!8500 res!7994) b!8498))

(assert (= (and b!8498 res!7991) b!8499))

(assert (= (and b!8499 res!7996) b!8501))

(assert (= (and b!8501 c!623) b!8502))

(assert (= (and b!8501 (not c!623)) b!8503))

(assert (= (and b!8501 (not res!7990)) b!8492))

(assert (= (and b!8496 condMapEmpty!602) mapIsEmpty!602))

(assert (= (and b!8496 (not condMapEmpty!602)) mapNonEmpty!602))

(get-info :version)

(assert (= (and mapNonEmpty!602 ((_ is ValueCellFull!192) mapValue!602)) b!8495))

(assert (= (and b!8496 ((_ is ValueCellFull!192) mapDefault!602)) b!8494))

(assert (= start!988 b!8496))

(declare-fun m!5229 () Bool)

(assert (=> b!8500 m!5229))

(declare-fun m!5231 () Bool)

(assert (=> b!8501 m!5231))

(declare-fun m!5233 () Bool)

(assert (=> b!8501 m!5233))

(assert (=> b!8502 m!5231))

(declare-fun m!5235 () Bool)

(assert (=> start!988 m!5235))

(declare-fun m!5237 () Bool)

(assert (=> start!988 m!5237))

(declare-fun m!5239 () Bool)

(assert (=> start!988 m!5239))

(declare-fun m!5241 () Bool)

(assert (=> b!8493 m!5241))

(declare-fun m!5243 () Bool)

(assert (=> mapNonEmpty!602 m!5243))

(declare-fun m!5245 () Bool)

(assert (=> b!8499 m!5245))

(declare-fun m!5247 () Bool)

(assert (=> b!8492 m!5247))

(declare-fun m!5249 () Bool)

(assert (=> b!8498 m!5249))

(assert (=> b!8498 m!5249))

(declare-fun m!5251 () Bool)

(assert (=> b!8498 m!5251))

(check-sat (not b!8493) (not b!8501) (not b!8500) (not b!8502) b_and!489 tp_is_empty!417 (not b_next!339) (not b!8499) (not b!8492) (not b!8498) (not start!988) (not mapNonEmpty!602))
(check-sat b_and!489 (not b_next!339))
(get-model)

(declare-fun d!861 () Bool)

(assert (=> d!861 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!988 d!861))

(declare-fun d!863 () Bool)

(assert (=> d!863 (= (array_inv!273 _values!1492) (bvsge (size!432 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!988 d!863))

(declare-fun d!865 () Bool)

(assert (=> d!865 (= (array_inv!274 _keys!1806) (bvsge (size!431 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!988 d!865))

(declare-fun d!867 () Bool)

(declare-fun e!4859 () Bool)

(assert (=> d!867 e!4859))

(declare-fun res!8020 () Bool)

(assert (=> d!867 (=> res!8020 e!4859)))

(declare-fun lt!1788 () Bool)

(assert (=> d!867 (= res!8020 (not lt!1788))))

(declare-fun lt!1790 () Bool)

(assert (=> d!867 (= lt!1788 lt!1790)))

(declare-fun lt!1789 () Unit!165)

(declare-fun e!4858 () Unit!165)

(assert (=> d!867 (= lt!1789 e!4858)))

(declare-fun c!629 () Bool)

(assert (=> d!867 (= c!629 lt!1790)))

(declare-fun containsKey!7 (List!254 (_ BitVec 64)) Bool)

(assert (=> d!867 (= lt!1790 (containsKey!7 (toList!140 (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(assert (=> d!867 (= (contains!116 (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278) lt!1788)))

(declare-fun b!8546 () Bool)

(declare-fun lt!1791 () Unit!165)

(assert (=> b!8546 (= e!4858 lt!1791)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!7 (List!254 (_ BitVec 64)) Unit!165)

(assert (=> b!8546 (= lt!1791 (lemmaContainsKeyImpliesGetValueByKeyDefined!7 (toList!140 (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-datatypes ((Option!19 0))(
  ( (Some!18 (v!1309 V!733)) (None!17) )
))
(declare-fun isDefined!8 (Option!19) Bool)

(declare-fun getValueByKey!13 (List!254 (_ BitVec 64)) Option!19)

(assert (=> b!8546 (isDefined!8 (getValueByKey!13 (toList!140 (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278))))

(declare-fun b!8547 () Bool)

(declare-fun Unit!169 () Unit!165)

(assert (=> b!8547 (= e!4858 Unit!169)))

(declare-fun b!8548 () Bool)

(assert (=> b!8548 (= e!4859 (isDefined!8 (getValueByKey!13 (toList!140 (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495)) k0!1278)))))

(assert (= (and d!867 c!629) b!8546))

(assert (= (and d!867 (not c!629)) b!8547))

(assert (= (and d!867 (not res!8020)) b!8548))

(declare-fun m!5277 () Bool)

(assert (=> d!867 m!5277))

(declare-fun m!5279 () Bool)

(assert (=> b!8546 m!5279))

(declare-fun m!5281 () Bool)

(assert (=> b!8546 m!5281))

(assert (=> b!8546 m!5281))

(declare-fun m!5283 () Bool)

(assert (=> b!8546 m!5283))

(assert (=> b!8548 m!5281))

(assert (=> b!8548 m!5281))

(assert (=> b!8548 m!5283))

(assert (=> b!8498 d!867))

(declare-fun b!8591 () Bool)

(declare-fun e!4892 () Bool)

(assert (=> b!8591 (= e!4892 (validKeyInArray!0 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8592 () Bool)

(declare-fun e!4897 () Unit!165)

(declare-fun lt!1841 () Unit!165)

(assert (=> b!8592 (= e!4897 lt!1841)))

(declare-fun lt!1849 () ListLongMap!249)

(declare-fun getCurrentListMapNoExtraKeys!7 (array!765 array!767 (_ BitVec 32) (_ BitVec 32) V!733 V!733 (_ BitVec 32) Int) ListLongMap!249)

(assert (=> b!8592 (= lt!1849 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1843 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1843 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1846 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1846 (select (arr!369 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1847 () Unit!165)

(declare-fun addStillContains!8 (ListLongMap!249 (_ BitVec 64) V!733 (_ BitVec 64)) Unit!165)

(assert (=> b!8592 (= lt!1847 (addStillContains!8 lt!1849 lt!1843 zeroValue!1434 lt!1846))))

(declare-fun +!10 (ListLongMap!249 tuple2!244) ListLongMap!249)

(assert (=> b!8592 (contains!116 (+!10 lt!1849 (tuple2!245 lt!1843 zeroValue!1434)) lt!1846)))

(declare-fun lt!1854 () Unit!165)

(assert (=> b!8592 (= lt!1854 lt!1847)))

(declare-fun lt!1851 () ListLongMap!249)

(assert (=> b!8592 (= lt!1851 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1838 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1838 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1852 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1852 (select (arr!369 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1855 () Unit!165)

(declare-fun addApplyDifferent!8 (ListLongMap!249 (_ BitVec 64) V!733 (_ BitVec 64)) Unit!165)

(assert (=> b!8592 (= lt!1855 (addApplyDifferent!8 lt!1851 lt!1838 minValue!1434 lt!1852))))

(declare-fun apply!23 (ListLongMap!249 (_ BitVec 64)) V!733)

(assert (=> b!8592 (= (apply!23 (+!10 lt!1851 (tuple2!245 lt!1838 minValue!1434)) lt!1852) (apply!23 lt!1851 lt!1852))))

(declare-fun lt!1845 () Unit!165)

(assert (=> b!8592 (= lt!1845 lt!1855)))

(declare-fun lt!1836 () ListLongMap!249)

(assert (=> b!8592 (= lt!1836 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1840 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1840 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1853 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1853 (select (arr!369 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1857 () Unit!165)

(assert (=> b!8592 (= lt!1857 (addApplyDifferent!8 lt!1836 lt!1840 zeroValue!1434 lt!1853))))

(assert (=> b!8592 (= (apply!23 (+!10 lt!1836 (tuple2!245 lt!1840 zeroValue!1434)) lt!1853) (apply!23 lt!1836 lt!1853))))

(declare-fun lt!1856 () Unit!165)

(assert (=> b!8592 (= lt!1856 lt!1857)))

(declare-fun lt!1837 () ListLongMap!249)

(assert (=> b!8592 (= lt!1837 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun lt!1848 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1848 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!1839 () (_ BitVec 64))

(assert (=> b!8592 (= lt!1839 (select (arr!369 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> b!8592 (= lt!1841 (addApplyDifferent!8 lt!1837 lt!1848 minValue!1434 lt!1839))))

(assert (=> b!8592 (= (apply!23 (+!10 lt!1837 (tuple2!245 lt!1848 minValue!1434)) lt!1839) (apply!23 lt!1837 lt!1839))))

(declare-fun b!8593 () Bool)

(declare-fun e!4894 () ListLongMap!249)

(declare-fun call!226 () ListLongMap!249)

(assert (=> b!8593 (= e!4894 call!226)))

(declare-fun call!229 () ListLongMap!249)

(declare-fun c!642 () Bool)

(declare-fun c!647 () Bool)

(declare-fun call!228 () ListLongMap!249)

(declare-fun call!227 () ListLongMap!249)

(declare-fun bm!221 () Bool)

(assert (=> bm!221 (= call!227 (+!10 (ite c!642 call!228 (ite c!647 call!229 call!226)) (ite (or c!642 c!647) (tuple2!245 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1434) (tuple2!245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434))))))

(declare-fun b!8594 () Bool)

(declare-fun e!4886 () Bool)

(declare-fun e!4891 () Bool)

(assert (=> b!8594 (= e!4886 e!4891)))

(declare-fun res!8046 () Bool)

(declare-fun call!230 () Bool)

(assert (=> b!8594 (= res!8046 call!230)))

(assert (=> b!8594 (=> (not res!8046) (not e!4891))))

(declare-fun b!8595 () Bool)

(declare-fun e!4888 () ListLongMap!249)

(declare-fun e!4893 () ListLongMap!249)

(assert (=> b!8595 (= e!4888 e!4893)))

(assert (=> b!8595 (= c!647 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!222 () Bool)

(declare-fun lt!1842 () ListLongMap!249)

(assert (=> bm!222 (= call!230 (contains!116 lt!1842 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!8596 () Bool)

(assert (=> b!8596 (= e!4886 (not call!230))))

(declare-fun bm!223 () Bool)

(declare-fun call!224 () ListLongMap!249)

(assert (=> bm!223 (= call!224 call!227)))

(declare-fun bm!224 () Bool)

(assert (=> bm!224 (= call!229 call!228)))

(declare-fun b!8597 () Bool)

(declare-fun Unit!170 () Unit!165)

(assert (=> b!8597 (= e!4897 Unit!170)))

(declare-fun bm!225 () Bool)

(assert (=> bm!225 (= call!226 call!229)))

(declare-fun b!8598 () Bool)

(declare-fun res!8045 () Bool)

(declare-fun e!4887 () Bool)

(assert (=> b!8598 (=> (not res!8045) (not e!4887))))

(declare-fun e!4895 () Bool)

(assert (=> b!8598 (= res!8045 e!4895)))

(declare-fun c!644 () Bool)

(assert (=> b!8598 (= c!644 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!226 () Bool)

(assert (=> bm!226 (= call!228 (getCurrentListMapNoExtraKeys!7 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495))))

(declare-fun b!8599 () Bool)

(assert (=> b!8599 (= e!4887 e!4886)))

(declare-fun c!643 () Bool)

(assert (=> b!8599 (= c!643 (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!8600 () Bool)

(assert (=> b!8600 (= e!4893 call!224)))

(declare-fun b!8601 () Bool)

(declare-fun e!4889 () Bool)

(assert (=> b!8601 (= e!4889 (= (apply!23 lt!1842 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1434))))

(declare-fun b!8602 () Bool)

(declare-fun e!4896 () Bool)

(assert (=> b!8602 (= e!4896 (validKeyInArray!0 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8603 () Bool)

(declare-fun e!4898 () Bool)

(declare-fun get!163 (ValueCell!192 V!733) V!733)

(declare-fun dynLambda!45 (Int (_ BitVec 64)) V!733)

(assert (=> b!8603 (= e!4898 (= (apply!23 lt!1842 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)) (get!163 (select (arr!370 _values!1492) #b00000000000000000000000000000000) (dynLambda!45 defaultEntry!1495 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!432 _values!1492)))))

(assert (=> b!8603 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!431 _keys!1806)))))

(declare-fun b!8604 () Bool)

(assert (=> b!8604 (= e!4895 e!4889)))

(declare-fun res!8042 () Bool)

(declare-fun call!225 () Bool)

(assert (=> b!8604 (= res!8042 call!225)))

(assert (=> b!8604 (=> (not res!8042) (not e!4889))))

(declare-fun b!8605 () Bool)

(assert (=> b!8605 (= e!4891 (= (apply!23 lt!1842 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1434))))

(declare-fun bm!227 () Bool)

(assert (=> bm!227 (= call!225 (contains!116 lt!1842 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!8606 () Bool)

(assert (=> b!8606 (= e!4894 call!224)))

(declare-fun b!8607 () Bool)

(declare-fun res!8039 () Bool)

(assert (=> b!8607 (=> (not res!8039) (not e!4887))))

(declare-fun e!4890 () Bool)

(assert (=> b!8607 (= res!8039 e!4890)))

(declare-fun res!8040 () Bool)

(assert (=> b!8607 (=> res!8040 e!4890)))

(assert (=> b!8607 (= res!8040 (not e!4892))))

(declare-fun res!8041 () Bool)

(assert (=> b!8607 (=> (not res!8041) (not e!4892))))

(assert (=> b!8607 (= res!8041 (bvslt #b00000000000000000000000000000000 (size!431 _keys!1806)))))

(declare-fun b!8608 () Bool)

(assert (=> b!8608 (= e!4890 e!4898)))

(declare-fun res!8044 () Bool)

(assert (=> b!8608 (=> (not res!8044) (not e!4898))))

(assert (=> b!8608 (= res!8044 (contains!116 lt!1842 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(assert (=> b!8608 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!431 _keys!1806)))))

(declare-fun d!869 () Bool)

(assert (=> d!869 e!4887))

(declare-fun res!8043 () Bool)

(assert (=> d!869 (=> (not res!8043) (not e!4887))))

(assert (=> d!869 (= res!8043 (or (bvsge #b00000000000000000000000000000000 (size!431 _keys!1806)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!431 _keys!1806)))))))

(declare-fun lt!1844 () ListLongMap!249)

(assert (=> d!869 (= lt!1842 lt!1844)))

(declare-fun lt!1850 () Unit!165)

(assert (=> d!869 (= lt!1850 e!4897)))

(declare-fun c!645 () Bool)

(assert (=> d!869 (= c!645 e!4896)))

(declare-fun res!8047 () Bool)

(assert (=> d!869 (=> (not res!8047) (not e!4896))))

(assert (=> d!869 (= res!8047 (bvslt #b00000000000000000000000000000000 (size!431 _keys!1806)))))

(assert (=> d!869 (= lt!1844 e!4888)))

(assert (=> d!869 (= c!642 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!869 (validMask!0 mask!2250)))

(assert (=> d!869 (= (getCurrentListMap!99 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) lt!1842)))

(declare-fun b!8609 () Bool)

(assert (=> b!8609 (= e!4895 (not call!225))))

(declare-fun b!8610 () Bool)

(assert (=> b!8610 (= e!4888 (+!10 call!227 (tuple2!245 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1434)))))

(declare-fun b!8611 () Bool)

(declare-fun c!646 () Bool)

(assert (=> b!8611 (= c!646 (and (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!8611 (= e!4893 e!4894)))

(assert (= (and d!869 c!642) b!8610))

(assert (= (and d!869 (not c!642)) b!8595))

(assert (= (and b!8595 c!647) b!8600))

(assert (= (and b!8595 (not c!647)) b!8611))

(assert (= (and b!8611 c!646) b!8606))

(assert (= (and b!8611 (not c!646)) b!8593))

(assert (= (or b!8606 b!8593) bm!225))

(assert (= (or b!8600 bm!225) bm!224))

(assert (= (or b!8600 b!8606) bm!223))

(assert (= (or b!8610 bm!224) bm!226))

(assert (= (or b!8610 bm!223) bm!221))

(assert (= (and d!869 res!8047) b!8602))

(assert (= (and d!869 c!645) b!8592))

(assert (= (and d!869 (not c!645)) b!8597))

(assert (= (and d!869 res!8043) b!8607))

(assert (= (and b!8607 res!8041) b!8591))

(assert (= (and b!8607 (not res!8040)) b!8608))

(assert (= (and b!8608 res!8044) b!8603))

(assert (= (and b!8607 res!8039) b!8598))

(assert (= (and b!8598 c!644) b!8604))

(assert (= (and b!8598 (not c!644)) b!8609))

(assert (= (and b!8604 res!8042) b!8601))

(assert (= (or b!8604 b!8609) bm!227))

(assert (= (and b!8598 res!8045) b!8599))

(assert (= (and b!8599 c!643) b!8594))

(assert (= (and b!8599 (not c!643)) b!8596))

(assert (= (and b!8594 res!8046) b!8605))

(assert (= (or b!8594 b!8596) bm!222))

(declare-fun b_lambda!343 () Bool)

(assert (=> (not b_lambda!343) (not b!8603)))

(declare-fun t!2398 () Bool)

(declare-fun tb!139 () Bool)

(assert (=> (and start!988 (= defaultEntry!1495 defaultEntry!1495) t!2398) tb!139))

(declare-fun result!219 () Bool)

(assert (=> tb!139 (= result!219 tp_is_empty!417)))

(assert (=> b!8603 t!2398))

(declare-fun b_and!493 () Bool)

(assert (= b_and!489 (and (=> t!2398 result!219) b_and!493)))

(declare-fun m!5285 () Bool)

(assert (=> b!8602 m!5285))

(assert (=> b!8602 m!5285))

(declare-fun m!5287 () Bool)

(assert (=> b!8602 m!5287))

(declare-fun m!5289 () Bool)

(assert (=> bm!227 m!5289))

(assert (=> b!8591 m!5285))

(assert (=> b!8591 m!5285))

(assert (=> b!8591 m!5287))

(declare-fun m!5291 () Bool)

(assert (=> b!8605 m!5291))

(declare-fun m!5293 () Bool)

(assert (=> bm!226 m!5293))

(declare-fun m!5295 () Bool)

(assert (=> b!8603 m!5295))

(declare-fun m!5297 () Bool)

(assert (=> b!8603 m!5297))

(declare-fun m!5299 () Bool)

(assert (=> b!8603 m!5299))

(assert (=> b!8603 m!5285))

(declare-fun m!5301 () Bool)

(assert (=> b!8603 m!5301))

(assert (=> b!8603 m!5285))

(assert (=> b!8603 m!5297))

(assert (=> b!8603 m!5295))

(declare-fun m!5303 () Bool)

(assert (=> bm!222 m!5303))

(declare-fun m!5305 () Bool)

(assert (=> b!8601 m!5305))

(assert (=> d!869 m!5235))

(declare-fun m!5307 () Bool)

(assert (=> b!8610 m!5307))

(declare-fun m!5309 () Bool)

(assert (=> bm!221 m!5309))

(declare-fun m!5311 () Bool)

(assert (=> b!8592 m!5311))

(declare-fun m!5313 () Bool)

(assert (=> b!8592 m!5313))

(declare-fun m!5315 () Bool)

(assert (=> b!8592 m!5315))

(declare-fun m!5317 () Bool)

(assert (=> b!8592 m!5317))

(declare-fun m!5319 () Bool)

(assert (=> b!8592 m!5319))

(declare-fun m!5321 () Bool)

(assert (=> b!8592 m!5321))

(declare-fun m!5323 () Bool)

(assert (=> b!8592 m!5323))

(declare-fun m!5325 () Bool)

(assert (=> b!8592 m!5325))

(declare-fun m!5327 () Bool)

(assert (=> b!8592 m!5327))

(assert (=> b!8592 m!5315))

(declare-fun m!5329 () Bool)

(assert (=> b!8592 m!5329))

(assert (=> b!8592 m!5311))

(declare-fun m!5331 () Bool)

(assert (=> b!8592 m!5331))

(assert (=> b!8592 m!5293))

(declare-fun m!5333 () Bool)

(assert (=> b!8592 m!5333))

(assert (=> b!8592 m!5325))

(declare-fun m!5335 () Bool)

(assert (=> b!8592 m!5335))

(assert (=> b!8592 m!5285))

(assert (=> b!8592 m!5333))

(declare-fun m!5337 () Bool)

(assert (=> b!8592 m!5337))

(declare-fun m!5339 () Bool)

(assert (=> b!8592 m!5339))

(assert (=> b!8608 m!5285))

(assert (=> b!8608 m!5285))

(declare-fun m!5341 () Bool)

(assert (=> b!8608 m!5341))

(assert (=> b!8498 d!869))

(declare-fun d!871 () Bool)

(declare-fun res!8052 () Bool)

(declare-fun e!4903 () Bool)

(assert (=> d!871 (=> res!8052 e!4903)))

(assert (=> d!871 (= res!8052 (= (select (arr!369 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!871 (= (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) e!4903)))

(declare-fun b!8618 () Bool)

(declare-fun e!4904 () Bool)

(assert (=> b!8618 (= e!4903 e!4904)))

(declare-fun res!8053 () Bool)

(assert (=> b!8618 (=> (not res!8053) (not e!4904))))

(assert (=> b!8618 (= res!8053 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!431 _keys!1806)))))

(declare-fun b!8619 () Bool)

(assert (=> b!8619 (= e!4904 (arrayContainsKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!871 (not res!8052)) b!8618))

(assert (= (and b!8618 res!8053) b!8619))

(assert (=> d!871 m!5285))

(declare-fun m!5343 () Bool)

(assert (=> b!8619 m!5343))

(assert (=> b!8502 d!871))

(declare-fun bm!230 () Bool)

(declare-fun call!233 () Bool)

(assert (=> bm!230 (= call!233 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun d!873 () Bool)

(declare-fun res!8058 () Bool)

(declare-fun e!4911 () Bool)

(assert (=> d!873 (=> res!8058 e!4911)))

(assert (=> d!873 (= res!8058 (bvsge #b00000000000000000000000000000000 (size!431 _keys!1806)))))

(assert (=> d!873 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!4911)))

(declare-fun b!8628 () Bool)

(declare-fun e!4913 () Bool)

(assert (=> b!8628 (= e!4913 call!233)))

(declare-fun b!8629 () Bool)

(declare-fun e!4912 () Bool)

(assert (=> b!8629 (= e!4913 e!4912)))

(declare-fun lt!1865 () (_ BitVec 64))

(assert (=> b!8629 (= lt!1865 (select (arr!369 _keys!1806) #b00000000000000000000000000000000))))

(declare-fun lt!1864 () Unit!165)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!765 (_ BitVec 64) (_ BitVec 32)) Unit!165)

(assert (=> b!8629 (= lt!1864 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!1865 #b00000000000000000000000000000000))))

(assert (=> b!8629 (arrayContainsKey!0 _keys!1806 lt!1865 #b00000000000000000000000000000000)))

(declare-fun lt!1866 () Unit!165)

(assert (=> b!8629 (= lt!1866 lt!1864)))

(declare-fun res!8059 () Bool)

(declare-datatypes ((SeekEntryResult!32 0))(
  ( (MissingZero!32 (index!2247 (_ BitVec 32))) (Found!32 (index!2248 (_ BitVec 32))) (Intermediate!32 (undefined!844 Bool) (index!2249 (_ BitVec 32)) (x!2728 (_ BitVec 32))) (Undefined!32) (MissingVacant!32 (index!2250 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!765 (_ BitVec 32)) SeekEntryResult!32)

(assert (=> b!8629 (= res!8059 (= (seekEntryOrOpen!0 (select (arr!369 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!32 #b00000000000000000000000000000000)))))

(assert (=> b!8629 (=> (not res!8059) (not e!4912))))

(declare-fun b!8630 () Bool)

(assert (=> b!8630 (= e!4911 e!4913)))

(declare-fun c!650 () Bool)

(assert (=> b!8630 (= c!650 (validKeyInArray!0 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8631 () Bool)

(assert (=> b!8631 (= e!4912 call!233)))

(assert (= (and d!873 (not res!8058)) b!8630))

(assert (= (and b!8630 c!650) b!8629))

(assert (= (and b!8630 (not c!650)) b!8628))

(assert (= (and b!8629 res!8059) b!8631))

(assert (= (or b!8631 b!8628) bm!230))

(declare-fun m!5345 () Bool)

(assert (=> bm!230 m!5345))

(assert (=> b!8629 m!5285))

(declare-fun m!5347 () Bool)

(assert (=> b!8629 m!5347))

(declare-fun m!5349 () Bool)

(assert (=> b!8629 m!5349))

(assert (=> b!8629 m!5285))

(declare-fun m!5351 () Bool)

(assert (=> b!8629 m!5351))

(assert (=> b!8630 m!5285))

(assert (=> b!8630 m!5285))

(assert (=> b!8630 m!5287))

(assert (=> b!8493 d!873))

(declare-fun d!875 () Bool)

(assert (=> d!875 (= (validKeyInArray!0 k0!1278) (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!8499 d!875))

(declare-fun b!8642 () Bool)

(declare-fun e!4922 () Bool)

(declare-fun contains!118 (List!255 (_ BitVec 64)) Bool)

(assert (=> b!8642 (= e!4922 (contains!118 Nil!252 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun b!8643 () Bool)

(declare-fun e!4925 () Bool)

(declare-fun e!4923 () Bool)

(assert (=> b!8643 (= e!4925 e!4923)))

(declare-fun c!653 () Bool)

(assert (=> b!8643 (= c!653 (validKeyInArray!0 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!233 () Bool)

(declare-fun call!236 () Bool)

(assert (=> bm!233 (= call!236 (arrayNoDuplicates!0 _keys!1806 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!653 (Cons!251 (select (arr!369 _keys!1806) #b00000000000000000000000000000000) Nil!252) Nil!252)))))

(declare-fun b!8644 () Bool)

(assert (=> b!8644 (= e!4923 call!236)))

(declare-fun b!8645 () Bool)

(assert (=> b!8645 (= e!4923 call!236)))

(declare-fun b!8646 () Bool)

(declare-fun e!4924 () Bool)

(assert (=> b!8646 (= e!4924 e!4925)))

(declare-fun res!8068 () Bool)

(assert (=> b!8646 (=> (not res!8068) (not e!4925))))

(assert (=> b!8646 (= res!8068 (not e!4922))))

(declare-fun res!8066 () Bool)

(assert (=> b!8646 (=> (not res!8066) (not e!4922))))

(assert (=> b!8646 (= res!8066 (validKeyInArray!0 (select (arr!369 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun d!877 () Bool)

(declare-fun res!8067 () Bool)

(assert (=> d!877 (=> res!8067 e!4924)))

(assert (=> d!877 (= res!8067 (bvsge #b00000000000000000000000000000000 (size!431 _keys!1806)))))

(assert (=> d!877 (= (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!252) e!4924)))

(assert (= (and d!877 (not res!8067)) b!8646))

(assert (= (and b!8646 res!8066) b!8642))

(assert (= (and b!8646 res!8068) b!8643))

(assert (= (and b!8643 c!653) b!8645))

(assert (= (and b!8643 (not c!653)) b!8644))

(assert (= (or b!8645 b!8644) bm!233))

(assert (=> b!8642 m!5285))

(assert (=> b!8642 m!5285))

(declare-fun m!5353 () Bool)

(assert (=> b!8642 m!5353))

(assert (=> b!8643 m!5285))

(assert (=> b!8643 m!5285))

(assert (=> b!8643 m!5287))

(assert (=> bm!233 m!5285))

(declare-fun m!5355 () Bool)

(assert (=> bm!233 m!5355))

(assert (=> b!8646 m!5285))

(assert (=> b!8646 m!5285))

(assert (=> b!8646 m!5287))

(assert (=> b!8500 d!877))

(assert (=> b!8501 d!871))

(declare-fun d!879 () Bool)

(declare-fun e!4928 () Bool)

(assert (=> d!879 e!4928))

(declare-fun c!656 () Bool)

(assert (=> d!879 (= c!656 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1869 () Unit!165)

(declare-fun choose!140 (array!765 array!767 (_ BitVec 32) (_ BitVec 32) V!733 V!733 (_ BitVec 64) Int) Unit!165)

(assert (=> d!879 (= lt!1869 (choose!140 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(assert (=> d!879 (validMask!0 mask!2250)))

(assert (=> d!879 (= (lemmaKeyInListMapIsInArray!62 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495) lt!1869)))

(declare-fun b!8651 () Bool)

(assert (=> b!8651 (= e!4928 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8652 () Bool)

(assert (=> b!8652 (= e!4928 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!879 c!656) b!8651))

(assert (= (and d!879 (not c!656)) b!8652))

(declare-fun m!5357 () Bool)

(assert (=> d!879 m!5357))

(assert (=> d!879 m!5235))

(assert (=> b!8651 m!5231))

(assert (=> b!8501 d!879))

(declare-fun d!881 () Bool)

(declare-fun lt!1872 () (_ BitVec 32))

(assert (=> d!881 (and (or (bvslt lt!1872 #b00000000000000000000000000000000) (bvsge lt!1872 (size!431 _keys!1806)) (and (bvsge lt!1872 #b00000000000000000000000000000000) (bvslt lt!1872 (size!431 _keys!1806)))) (bvsge lt!1872 #b00000000000000000000000000000000) (bvslt lt!1872 (size!431 _keys!1806)) (= (select (arr!369 _keys!1806) lt!1872) k0!1278))))

(declare-fun e!4931 () (_ BitVec 32))

(assert (=> d!881 (= lt!1872 e!4931)))

(declare-fun c!659 () Bool)

(assert (=> d!881 (= c!659 (= (select (arr!369 _keys!1806) #b00000000000000000000000000000000) k0!1278))))

(assert (=> d!881 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!431 _keys!1806)) (bvslt (size!431 _keys!1806) #b01111111111111111111111111111111))))

(assert (=> d!881 (= (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000) lt!1872)))

(declare-fun b!8657 () Bool)

(assert (=> b!8657 (= e!4931 #b00000000000000000000000000000000)))

(declare-fun b!8658 () Bool)

(assert (=> b!8658 (= e!4931 (arrayScanForKey!0 _keys!1806 k0!1278 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!881 c!659) b!8657))

(assert (= (and d!881 (not c!659)) b!8658))

(declare-fun m!5359 () Bool)

(assert (=> d!881 m!5359))

(assert (=> d!881 m!5285))

(declare-fun m!5361 () Bool)

(assert (=> b!8658 m!5361))

(assert (=> b!8492 d!881))

(declare-fun mapNonEmpty!608 () Bool)

(declare-fun mapRes!608 () Bool)

(declare-fun tp!1262 () Bool)

(declare-fun e!4937 () Bool)

(assert (=> mapNonEmpty!608 (= mapRes!608 (and tp!1262 e!4937))))

(declare-fun mapRest!608 () (Array (_ BitVec 32) ValueCell!192))

(declare-fun mapKey!608 () (_ BitVec 32))

(declare-fun mapValue!608 () ValueCell!192)

(assert (=> mapNonEmpty!608 (= mapRest!602 (store mapRest!608 mapKey!608 mapValue!608))))

(declare-fun mapIsEmpty!608 () Bool)

(assert (=> mapIsEmpty!608 mapRes!608))

(declare-fun b!8665 () Bool)

(assert (=> b!8665 (= e!4937 tp_is_empty!417)))

(declare-fun condMapEmpty!608 () Bool)

(declare-fun mapDefault!608 () ValueCell!192)

(assert (=> mapNonEmpty!602 (= condMapEmpty!608 (= mapRest!602 ((as const (Array (_ BitVec 32) ValueCell!192)) mapDefault!608)))))

(declare-fun e!4936 () Bool)

(assert (=> mapNonEmpty!602 (= tp!1252 (and e!4936 mapRes!608))))

(declare-fun b!8666 () Bool)

(assert (=> b!8666 (= e!4936 tp_is_empty!417)))

(assert (= (and mapNonEmpty!602 condMapEmpty!608) mapIsEmpty!608))

(assert (= (and mapNonEmpty!602 (not condMapEmpty!608)) mapNonEmpty!608))

(assert (= (and mapNonEmpty!608 ((_ is ValueCellFull!192) mapValue!608)) b!8665))

(assert (= (and mapNonEmpty!602 ((_ is ValueCellFull!192) mapDefault!608)) b!8666))

(declare-fun m!5363 () Bool)

(assert (=> mapNonEmpty!608 m!5363))

(declare-fun b_lambda!345 () Bool)

(assert (= b_lambda!343 (or (and start!988 b_free!339) b_lambda!345)))

(check-sat b_and!493 (not b!8619) (not b!8601) (not b!8610) (not b!8658) (not bm!227) (not b!8591) (not b!8546) (not bm!230) (not d!867) (not b!8643) (not d!879) (not b_next!339) (not mapNonEmpty!608) (not b!8592) (not b!8642) (not bm!233) (not b!8603) (not b!8608) (not b!8646) (not b_lambda!345) (not b!8548) (not b!8651) (not b!8605) (not bm!222) (not b!8629) (not bm!221) tp_is_empty!417 (not b!8602) (not bm!226) (not d!869) (not b!8630))
(check-sat b_and!493 (not b_next!339))
