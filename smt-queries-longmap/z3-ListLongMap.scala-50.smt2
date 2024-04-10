; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!814 () Bool)

(assert start!814)

(declare-fun b_free!207 () Bool)

(declare-fun b_next!207 () Bool)

(assert (=> start!814 (= b_free!207 (not b_next!207))))

(declare-fun tp!850 () Bool)

(declare-fun b_and!353 () Bool)

(assert (=> start!814 (= tp!850 b_and!353)))

(declare-fun mapIsEmpty!398 () Bool)

(declare-fun mapRes!398 () Bool)

(assert (=> mapIsEmpty!398 mapRes!398))

(declare-fun b!6198 () Bool)

(declare-fun e!3393 () Bool)

(declare-fun e!3389 () Bool)

(assert (=> b!6198 (= e!3393 (and e!3389 mapRes!398))))

(declare-fun condMapEmpty!398 () Bool)

(declare-datatypes ((V!557 0))(
  ( (V!558 (val!148 Int)) )
))
(declare-datatypes ((ValueCell!126 0))(
  ( (ValueCellFull!126 (v!1239 V!557)) (EmptyCell!126) )
))
(declare-datatypes ((array!503 0))(
  ( (array!504 (arr!240 (Array (_ BitVec 32) ValueCell!126)) (size!302 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!503)

(declare-fun mapDefault!398 () ValueCell!126)

(assert (=> b!6198 (= condMapEmpty!398 (= (arr!240 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!126)) mapDefault!398)))))

(declare-fun b!6199 () Bool)

(declare-fun e!3391 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6199 (= e!3391 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6200 () Bool)

(declare-fun res!6673 () Bool)

(declare-fun e!3394 () Bool)

(assert (=> b!6200 (=> (not res!6673) (not e!3394))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!505 0))(
  ( (array!506 (arr!241 (Array (_ BitVec 32) (_ BitVec 64))) (size!303 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!505)

(assert (=> b!6200 (= res!6673 (and (= (size!302 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!303 _keys!1806) (size!302 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6201 () Bool)

(declare-fun res!6671 () Bool)

(assert (=> b!6201 (=> (not res!6671) (not e!3394))))

(declare-datatypes ((List!160 0))(
  ( (Nil!157) (Cons!156 (h!722 (_ BitVec 64)) (t!2295 List!160)) )
))
(declare-fun arrayNoDuplicates!0 (array!505 (_ BitVec 32) List!160) Bool)

(assert (=> b!6201 (= res!6671 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!157))))

(declare-fun b!6202 () Bool)

(declare-fun tp_is_empty!285 () Bool)

(assert (=> b!6202 (= e!3389 tp_is_empty!285)))

(declare-fun b!6203 () Bool)

(declare-fun arrayContainsKey!0 (array!505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6203 (= e!3391 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6204 () Bool)

(declare-fun res!6675 () Bool)

(assert (=> b!6204 (=> (not res!6675) (not e!3394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!505 (_ BitVec 32)) Bool)

(assert (=> b!6204 (= res!6675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6205 () Bool)

(declare-fun res!6669 () Bool)

(assert (=> b!6205 (=> (not res!6669) (not e!3394))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!557)

(declare-fun zeroValue!1434 () V!557)

(declare-datatypes ((tuple2!152 0))(
  ( (tuple2!153 (_1!76 (_ BitVec 64)) (_2!76 V!557)) )
))
(declare-datatypes ((List!161 0))(
  ( (Nil!158) (Cons!157 (h!723 tuple2!152) (t!2296 List!161)) )
))
(declare-datatypes ((ListLongMap!157 0))(
  ( (ListLongMap!158 (toList!94 List!161)) )
))
(declare-fun contains!68 (ListLongMap!157 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!53 (array!505 array!503 (_ BitVec 32) (_ BitVec 32) V!557 V!557 (_ BitVec 32) Int) ListLongMap!157)

(assert (=> b!6205 (= res!6669 (contains!68 (getCurrentListMap!53 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6206 () Bool)

(declare-fun e!3390 () Bool)

(assert (=> b!6206 (= e!3394 (not e!3390))))

(declare-fun res!6672 () Bool)

(assert (=> b!6206 (=> res!6672 e!3390)))

(assert (=> b!6206 (= res!6672 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6206 e!3391))

(declare-fun c!443 () Bool)

(assert (=> b!6206 (= c!443 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!95 0))(
  ( (Unit!96) )
))
(declare-fun lt!1132 () Unit!95)

(declare-fun lemmaKeyInListMapIsInArray!33 (array!505 array!503 (_ BitVec 32) (_ BitVec 32) V!557 V!557 (_ BitVec 64) Int) Unit!95)

(assert (=> b!6206 (= lt!1132 (lemmaKeyInListMapIsInArray!33 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun mapNonEmpty!398 () Bool)

(declare-fun tp!851 () Bool)

(declare-fun e!3388 () Bool)

(assert (=> mapNonEmpty!398 (= mapRes!398 (and tp!851 e!3388))))

(declare-fun mapValue!398 () ValueCell!126)

(declare-fun mapRest!398 () (Array (_ BitVec 32) ValueCell!126))

(declare-fun mapKey!398 () (_ BitVec 32))

(assert (=> mapNonEmpty!398 (= (arr!240 _values!1492) (store mapRest!398 mapKey!398 mapValue!398))))

(declare-fun b!6207 () Bool)

(assert (=> b!6207 (= e!3388 tp_is_empty!285)))

(declare-fun res!6674 () Bool)

(assert (=> start!814 (=> (not res!6674) (not e!3394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!814 (= res!6674 (validMask!0 mask!2250))))

(assert (=> start!814 e!3394))

(assert (=> start!814 tp!850))

(assert (=> start!814 true))

(declare-fun array_inv!173 (array!503) Bool)

(assert (=> start!814 (and (array_inv!173 _values!1492) e!3393)))

(assert (=> start!814 tp_is_empty!285))

(declare-fun array_inv!174 (array!505) Bool)

(assert (=> start!814 (array_inv!174 _keys!1806)))

(declare-fun b!6197 () Bool)

(declare-fun e!3392 () Bool)

(assert (=> b!6197 (= e!3392 true)))

(declare-datatypes ((SeekEntryResult!15 0))(
  ( (MissingZero!15 (index!2179 (_ BitVec 32))) (Found!15 (index!2180 (_ BitVec 32))) (Intermediate!15 (undefined!827 Bool) (index!2181 (_ BitVec 32)) (x!2505 (_ BitVec 32))) (Undefined!15) (MissingVacant!15 (index!2182 (_ BitVec 32))) )
))
(declare-fun lt!1131 () SeekEntryResult!15)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!505 (_ BitVec 32)) SeekEntryResult!15)

(assert (=> b!6197 (= lt!1131 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6208 () Bool)

(assert (=> b!6208 (= e!3390 e!3392)))

(declare-fun res!6670 () Bool)

(assert (=> b!6208 (=> res!6670 e!3392)))

(assert (=> b!6208 (= res!6670 (not (= (size!303 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1133 () (_ BitVec 32))

(assert (=> b!6208 (arrayForallSeekEntryOrOpenFound!0 lt!1133 _keys!1806 mask!2250)))

(declare-fun lt!1134 () Unit!95)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!95)

(assert (=> b!6208 (= lt!1134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1133))))

(declare-fun arrayScanForKey!0 (array!505 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6208 (= lt!1133 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6209 () Bool)

(declare-fun res!6676 () Bool)

(assert (=> b!6209 (=> (not res!6676) (not e!3394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6209 (= res!6676 (validKeyInArray!0 k0!1278))))

(assert (= (and start!814 res!6674) b!6200))

(assert (= (and b!6200 res!6673) b!6204))

(assert (= (and b!6204 res!6675) b!6201))

(assert (= (and b!6201 res!6671) b!6205))

(assert (= (and b!6205 res!6669) b!6209))

(assert (= (and b!6209 res!6676) b!6206))

(assert (= (and b!6206 c!443) b!6203))

(assert (= (and b!6206 (not c!443)) b!6199))

(assert (= (and b!6206 (not res!6672)) b!6208))

(assert (= (and b!6208 (not res!6670)) b!6197))

(assert (= (and b!6198 condMapEmpty!398) mapIsEmpty!398))

(assert (= (and b!6198 (not condMapEmpty!398)) mapNonEmpty!398))

(get-info :version)

(assert (= (and mapNonEmpty!398 ((_ is ValueCellFull!126) mapValue!398)) b!6207))

(assert (= (and b!6198 ((_ is ValueCellFull!126) mapDefault!398)) b!6202))

(assert (= start!814 b!6198))

(declare-fun m!3527 () Bool)

(assert (=> b!6205 m!3527))

(assert (=> b!6205 m!3527))

(declare-fun m!3529 () Bool)

(assert (=> b!6205 m!3529))

(declare-fun m!3531 () Bool)

(assert (=> b!6208 m!3531))

(declare-fun m!3533 () Bool)

(assert (=> b!6208 m!3533))

(declare-fun m!3535 () Bool)

(assert (=> b!6208 m!3535))

(declare-fun m!3537 () Bool)

(assert (=> b!6204 m!3537))

(declare-fun m!3539 () Bool)

(assert (=> b!6197 m!3539))

(declare-fun m!3541 () Bool)

(assert (=> mapNonEmpty!398 m!3541))

(declare-fun m!3543 () Bool)

(assert (=> b!6209 m!3543))

(declare-fun m!3545 () Bool)

(assert (=> start!814 m!3545))

(declare-fun m!3547 () Bool)

(assert (=> start!814 m!3547))

(declare-fun m!3549 () Bool)

(assert (=> start!814 m!3549))

(declare-fun m!3551 () Bool)

(assert (=> b!6201 m!3551))

(declare-fun m!3553 () Bool)

(assert (=> b!6206 m!3553))

(declare-fun m!3555 () Bool)

(assert (=> b!6206 m!3555))

(assert (=> b!6203 m!3553))

(check-sat (not b!6205) b_and!353 (not mapNonEmpty!398) (not b!6197) (not b!6208) tp_is_empty!285 (not b!6206) (not b!6201) (not b!6203) (not b!6204) (not b!6209) (not start!814) (not b_next!207))
(check-sat b_and!353 (not b_next!207))
