; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1028 () Bool)

(assert start!1028)

(declare-fun b_free!357 () Bool)

(declare-fun b_next!357 () Bool)

(assert (=> start!1028 (= b_free!357 (not b_next!357))))

(declare-fun tp!1309 () Bool)

(declare-fun b_and!509 () Bool)

(assert (=> start!1028 (= tp!1309 b_and!509)))

(declare-fun b!8944 () Bool)

(declare-fun res!8233 () Bool)

(declare-fun e!5102 () Bool)

(assert (=> b!8944 (=> (not res!8233) (not e!5102))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!757 0))(
  ( (V!758 (val!223 Int)) )
))
(declare-datatypes ((ValueCell!201 0))(
  ( (ValueCellFull!201 (v!1317 V!757)) (EmptyCell!201) )
))
(declare-datatypes ((array!803 0))(
  ( (array!804 (arr!387 (Array (_ BitVec 32) ValueCell!201)) (size!449 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!803)

(declare-fun minValue!1434 () V!757)

(declare-datatypes ((array!805 0))(
  ( (array!806 (arr!388 (Array (_ BitVec 32) (_ BitVec 64))) (size!450 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!805)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!757)

(declare-datatypes ((tuple2!258 0))(
  ( (tuple2!259 (_1!129 (_ BitVec 64)) (_2!129 V!757)) )
))
(declare-datatypes ((List!268 0))(
  ( (Nil!265) (Cons!264 (h!830 tuple2!258) (t!2409 List!268)) )
))
(declare-datatypes ((ListLongMap!263 0))(
  ( (ListLongMap!264 (toList!147 List!268)) )
))
(declare-fun contains!124 (ListLongMap!263 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!106 (array!805 array!803 (_ BitVec 32) (_ BitVec 32) V!757 V!757 (_ BitVec 32) Int) ListLongMap!263)

(assert (=> b!8944 (= res!8233 (contains!124 (getCurrentListMap!106 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8945 () Bool)

(declare-fun res!8234 () Bool)

(assert (=> b!8945 (=> (not res!8234) (not e!5102))))

(assert (=> b!8945 (= res!8234 (and (= (size!449 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!450 _keys!1806) (size!449 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8946 () Bool)

(declare-fun e!5099 () Bool)

(assert (=> b!8946 (= e!5099 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8947 () Bool)

(declare-fun e!5100 () Bool)

(assert (=> b!8947 (= e!5102 (not e!5100))))

(declare-fun res!8231 () Bool)

(assert (=> b!8947 (=> res!8231 e!5100)))

(declare-fun arrayContainsKey!0 (array!805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8947 (= res!8231 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8947 e!5099))

(declare-fun c!683 () Bool)

(assert (=> b!8947 (= c!683 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!179 0))(
  ( (Unit!180) )
))
(declare-fun lt!1933 () Unit!179)

(declare-fun lemmaKeyInListMapIsInArray!66 (array!805 array!803 (_ BitVec 32) (_ BitVec 32) V!757 V!757 (_ BitVec 64) Int) Unit!179)

(assert (=> b!8947 (= lt!1933 (lemmaKeyInListMapIsInArray!66 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!8948 () Bool)

(declare-fun e!5105 () Bool)

(declare-fun tp_is_empty!435 () Bool)

(assert (=> b!8948 (= e!5105 tp_is_empty!435)))

(declare-fun b!8949 () Bool)

(declare-fun e!5103 () Bool)

(declare-fun e!5104 () Bool)

(declare-fun mapRes!632 () Bool)

(assert (=> b!8949 (= e!5103 (and e!5104 mapRes!632))))

(declare-fun condMapEmpty!632 () Bool)

(declare-fun mapDefault!632 () ValueCell!201)

(assert (=> b!8949 (= condMapEmpty!632 (= (arr!387 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!201)) mapDefault!632)))))

(declare-fun b!8950 () Bool)

(assert (=> b!8950 (= e!5099 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8951 () Bool)

(declare-fun res!8235 () Bool)

(assert (=> b!8951 (=> (not res!8235) (not e!5102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!805 (_ BitVec 32)) Bool)

(assert (=> b!8951 (= res!8235 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8952 () Bool)

(assert (=> b!8952 (= e!5100 (= (size!450 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun lt!1935 () (_ BitVec 32))

(assert (=> b!8952 (arrayForallSeekEntryOrOpenFound!0 lt!1935 _keys!1806 mask!2250)))

(declare-fun lt!1934 () Unit!179)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!179)

(assert (=> b!8952 (= lt!1934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1935))))

(declare-fun arrayScanForKey!0 (array!805 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8952 (= lt!1935 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8943 () Bool)

(declare-fun res!8230 () Bool)

(assert (=> b!8943 (=> (not res!8230) (not e!5102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8943 (= res!8230 (validKeyInArray!0 k0!1278))))

(declare-fun res!8232 () Bool)

(assert (=> start!1028 (=> (not res!8232) (not e!5102))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1028 (= res!8232 (validMask!0 mask!2250))))

(assert (=> start!1028 e!5102))

(assert (=> start!1028 tp!1309))

(assert (=> start!1028 true))

(declare-fun array_inv!287 (array!803) Bool)

(assert (=> start!1028 (and (array_inv!287 _values!1492) e!5103)))

(assert (=> start!1028 tp_is_empty!435))

(declare-fun array_inv!288 (array!805) Bool)

(assert (=> start!1028 (array_inv!288 _keys!1806)))

(declare-fun b!8953 () Bool)

(assert (=> b!8953 (= e!5104 tp_is_empty!435)))

(declare-fun mapIsEmpty!632 () Bool)

(assert (=> mapIsEmpty!632 mapRes!632))

(declare-fun b!8954 () Bool)

(declare-fun res!8236 () Bool)

(assert (=> b!8954 (=> (not res!8236) (not e!5102))))

(declare-datatypes ((List!269 0))(
  ( (Nil!266) (Cons!265 (h!831 (_ BitVec 64)) (t!2410 List!269)) )
))
(declare-fun arrayNoDuplicates!0 (array!805 (_ BitVec 32) List!269) Bool)

(assert (=> b!8954 (= res!8236 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!266))))

(declare-fun mapNonEmpty!632 () Bool)

(declare-fun tp!1310 () Bool)

(assert (=> mapNonEmpty!632 (= mapRes!632 (and tp!1310 e!5105))))

(declare-fun mapValue!632 () ValueCell!201)

(declare-fun mapRest!632 () (Array (_ BitVec 32) ValueCell!201))

(declare-fun mapKey!632 () (_ BitVec 32))

(assert (=> mapNonEmpty!632 (= (arr!387 _values!1492) (store mapRest!632 mapKey!632 mapValue!632))))

(assert (= (and start!1028 res!8232) b!8945))

(assert (= (and b!8945 res!8234) b!8951))

(assert (= (and b!8951 res!8235) b!8954))

(assert (= (and b!8954 res!8236) b!8944))

(assert (= (and b!8944 res!8233) b!8943))

(assert (= (and b!8943 res!8230) b!8947))

(assert (= (and b!8947 c!683) b!8950))

(assert (= (and b!8947 (not c!683)) b!8946))

(assert (= (and b!8947 (not res!8231)) b!8952))

(assert (= (and b!8949 condMapEmpty!632) mapIsEmpty!632))

(assert (= (and b!8949 (not condMapEmpty!632)) mapNonEmpty!632))

(get-info :version)

(assert (= (and mapNonEmpty!632 ((_ is ValueCellFull!201) mapValue!632)) b!8948))

(assert (= (and b!8949 ((_ is ValueCellFull!201) mapDefault!632)) b!8953))

(assert (= start!1028 b!8949))

(declare-fun m!5549 () Bool)

(assert (=> b!8943 m!5549))

(declare-fun m!5551 () Bool)

(assert (=> b!8954 m!5551))

(declare-fun m!5553 () Bool)

(assert (=> b!8951 m!5553))

(declare-fun m!5555 () Bool)

(assert (=> mapNonEmpty!632 m!5555))

(declare-fun m!5557 () Bool)

(assert (=> b!8950 m!5557))

(declare-fun m!5559 () Bool)

(assert (=> b!8952 m!5559))

(declare-fun m!5561 () Bool)

(assert (=> b!8952 m!5561))

(declare-fun m!5563 () Bool)

(assert (=> b!8952 m!5563))

(declare-fun m!5565 () Bool)

(assert (=> start!1028 m!5565))

(declare-fun m!5567 () Bool)

(assert (=> start!1028 m!5567))

(declare-fun m!5569 () Bool)

(assert (=> start!1028 m!5569))

(declare-fun m!5571 () Bool)

(assert (=> b!8944 m!5571))

(assert (=> b!8944 m!5571))

(declare-fun m!5573 () Bool)

(assert (=> b!8944 m!5573))

(assert (=> b!8947 m!5557))

(declare-fun m!5575 () Bool)

(assert (=> b!8947 m!5575))

(check-sat (not b!8943) (not b_next!357) (not b!8951) b_and!509 (not mapNonEmpty!632) (not start!1028) (not b!8954) (not b!8952) (not b!8944) tp_is_empty!435 (not b!8947) (not b!8950))
(check-sat b_and!509 (not b_next!357))