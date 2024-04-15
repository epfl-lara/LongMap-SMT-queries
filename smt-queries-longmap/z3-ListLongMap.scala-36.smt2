; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!648 () Bool)

(assert start!648)

(declare-fun b_free!121 () Bool)

(declare-fun b_next!121 () Bool)

(assert (=> start!648 (= b_free!121 (not b_next!121))))

(declare-fun tp!580 () Bool)

(declare-fun b_and!259 () Bool)

(assert (=> start!648 (= tp!580 b_and!259)))

(declare-fun b!4212 () Bool)

(declare-fun res!5614 () Bool)

(declare-fun e!2213 () Bool)

(assert (=> b!4212 (=> (not res!5614) (not e!2213))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!443 0))(
  ( (V!444 (val!105 Int)) )
))
(declare-datatypes ((ValueCell!83 0))(
  ( (ValueCellFull!83 (v!1192 V!443)) (EmptyCell!83) )
))
(declare-datatypes ((array!323 0))(
  ( (array!324 (arr!154 (Array (_ BitVec 32) ValueCell!83)) (size!216 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!323)

(declare-fun minValue!1434 () V!443)

(declare-datatypes ((array!325 0))(
  ( (array!326 (arr!155 (Array (_ BitVec 32) (_ BitVec 64))) (size!217 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!325)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!443)

(declare-datatypes ((tuple2!90 0))(
  ( (tuple2!91 (_1!45 (_ BitVec 64)) (_2!45 V!443)) )
))
(declare-datatypes ((List!96 0))(
  ( (Nil!93) (Cons!92 (h!658 tuple2!90) (t!2223 List!96)) )
))
(declare-datatypes ((ListLongMap!95 0))(
  ( (ListLongMap!96 (toList!63 List!96)) )
))
(declare-fun contains!33 (ListLongMap!95 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!22 (array!325 array!323 (_ BitVec 32) (_ BitVec 32) V!443 V!443 (_ BitVec 32) Int) ListLongMap!95)

(assert (=> b!4212 (= res!5614 (contains!33 (getCurrentListMap!22 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!4214 () Bool)

(declare-fun e!2208 () Bool)

(assert (=> b!4214 (= e!2208 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!257 () Bool)

(declare-fun mapRes!257 () Bool)

(assert (=> mapIsEmpty!257 mapRes!257))

(declare-fun b!4215 () Bool)

(declare-fun arrayContainsKey!0 (array!325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!4215 (= e!2208 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!4216 () Bool)

(declare-fun res!5610 () Bool)

(assert (=> b!4216 (=> (not res!5610) (not e!2213))))

(declare-datatypes ((List!97 0))(
  ( (Nil!94) (Cons!93 (h!659 (_ BitVec 64)) (t!2224 List!97)) )
))
(declare-fun arrayNoDuplicates!0 (array!325 (_ BitVec 32) List!97) Bool)

(assert (=> b!4216 (= res!5610 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!94))))

(declare-fun b!4217 () Bool)

(declare-fun res!5609 () Bool)

(assert (=> b!4217 (=> (not res!5609) (not e!2213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!325 (_ BitVec 32)) Bool)

(assert (=> b!4217 (= res!5609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!4218 () Bool)

(declare-fun res!5613 () Bool)

(assert (=> b!4218 (=> (not res!5613) (not e!2213))))

(assert (=> b!4218 (= res!5613 (and (= (size!216 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!217 _keys!1806) (size!216 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!4219 () Bool)

(declare-fun res!5612 () Bool)

(assert (=> b!4219 (=> (not res!5612) (not e!2213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!4219 (= res!5612 (validKeyInArray!0 k0!1278))))

(declare-fun mapNonEmpty!257 () Bool)

(declare-fun tp!581 () Bool)

(declare-fun e!2212 () Bool)

(assert (=> mapNonEmpty!257 (= mapRes!257 (and tp!581 e!2212))))

(declare-fun mapKey!257 () (_ BitVec 32))

(declare-fun mapValue!257 () ValueCell!83)

(declare-fun mapRest!257 () (Array (_ BitVec 32) ValueCell!83))

(assert (=> mapNonEmpty!257 (= (arr!154 _values!1492) (store mapRest!257 mapKey!257 mapValue!257))))

(declare-fun b!4213 () Bool)

(declare-fun tp_is_empty!199 () Bool)

(assert (=> b!4213 (= e!2212 tp_is_empty!199)))

(declare-fun res!5611 () Bool)

(assert (=> start!648 (=> (not res!5611) (not e!2213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!648 (= res!5611 (validMask!0 mask!2250))))

(assert (=> start!648 e!2213))

(assert (=> start!648 tp!580))

(assert (=> start!648 true))

(declare-fun e!2211 () Bool)

(declare-fun array_inv!105 (array!323) Bool)

(assert (=> start!648 (and (array_inv!105 _values!1492) e!2211)))

(assert (=> start!648 tp_is_empty!199))

(declare-fun array_inv!106 (array!325) Bool)

(assert (=> start!648 (array_inv!106 _keys!1806)))

(declare-fun b!4220 () Bool)

(assert (=> b!4220 (= e!2213 (not true))))

(assert (=> b!4220 e!2208))

(declare-fun c!194 () Bool)

(assert (=> b!4220 (= c!194 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!29 0))(
  ( (Unit!30) )
))
(declare-fun lt!582 () Unit!29)

(declare-fun lemmaKeyInListMapIsInArray!4 (array!325 array!323 (_ BitVec 32) (_ BitVec 32) V!443 V!443 (_ BitVec 64) Int) Unit!29)

(assert (=> b!4220 (= lt!582 (lemmaKeyInListMapIsInArray!4 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!4221 () Bool)

(declare-fun e!2209 () Bool)

(assert (=> b!4221 (= e!2211 (and e!2209 mapRes!257))))

(declare-fun condMapEmpty!257 () Bool)

(declare-fun mapDefault!257 () ValueCell!83)

(assert (=> b!4221 (= condMapEmpty!257 (= (arr!154 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!83)) mapDefault!257)))))

(declare-fun b!4222 () Bool)

(assert (=> b!4222 (= e!2209 tp_is_empty!199)))

(assert (= (and start!648 res!5611) b!4218))

(assert (= (and b!4218 res!5613) b!4217))

(assert (= (and b!4217 res!5609) b!4216))

(assert (= (and b!4216 res!5610) b!4212))

(assert (= (and b!4212 res!5614) b!4219))

(assert (= (and b!4219 res!5612) b!4220))

(assert (= (and b!4220 c!194) b!4215))

(assert (= (and b!4220 (not c!194)) b!4214))

(assert (= (and b!4221 condMapEmpty!257) mapIsEmpty!257))

(assert (= (and b!4221 (not condMapEmpty!257)) mapNonEmpty!257))

(get-info :version)

(assert (= (and mapNonEmpty!257 ((_ is ValueCellFull!83) mapValue!257)) b!4213))

(assert (= (and b!4221 ((_ is ValueCellFull!83) mapDefault!257)) b!4222))

(assert (= start!648 b!4221))

(declare-fun m!2207 () Bool)

(assert (=> start!648 m!2207))

(declare-fun m!2209 () Bool)

(assert (=> start!648 m!2209))

(declare-fun m!2211 () Bool)

(assert (=> start!648 m!2211))

(declare-fun m!2213 () Bool)

(assert (=> b!4212 m!2213))

(assert (=> b!4212 m!2213))

(declare-fun m!2215 () Bool)

(assert (=> b!4212 m!2215))

(declare-fun m!2217 () Bool)

(assert (=> b!4215 m!2217))

(declare-fun m!2219 () Bool)

(assert (=> b!4220 m!2219))

(declare-fun m!2221 () Bool)

(assert (=> b!4219 m!2221))

(declare-fun m!2223 () Bool)

(assert (=> b!4217 m!2223))

(declare-fun m!2225 () Bool)

(assert (=> b!4216 m!2225))

(declare-fun m!2227 () Bool)

(assert (=> mapNonEmpty!257 m!2227))

(check-sat (not start!648) b_and!259 (not mapNonEmpty!257) (not b!4215) (not b!4216) (not b!4219) (not b!4220) tp_is_empty!199 (not b!4217) (not b!4212) (not b_next!121))
(check-sat b_and!259 (not b_next!121))
