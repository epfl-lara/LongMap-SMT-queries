; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1014 () Bool)

(assert start!1014)

(declare-fun b_free!343 () Bool)

(declare-fun b_next!343 () Bool)

(assert (=> start!1014 (= b_free!343 (not b_next!343))))

(declare-fun tp!1267 () Bool)

(declare-fun b_and!495 () Bool)

(assert (=> start!1014 (= tp!1267 b_and!495)))

(declare-fun b!8691 () Bool)

(declare-fun res!8089 () Bool)

(declare-fun e!4955 () Bool)

(assert (=> b!8691 (=> (not res!8089) (not e!4955))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!739 0))(
  ( (V!740 (val!216 Int)) )
))
(declare-datatypes ((ValueCell!194 0))(
  ( (ValueCellFull!194 (v!1310 V!739)) (EmptyCell!194) )
))
(declare-datatypes ((array!757 0))(
  ( (array!758 (arr!364 (Array (_ BitVec 32) ValueCell!194)) (size!426 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!757)

(declare-datatypes ((array!759 0))(
  ( (array!760 (arr!365 (Array (_ BitVec 32) (_ BitVec 64))) (size!427 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!759)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8691 (= res!8089 (and (= (size!426 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!427 _keys!1806) (size!426 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8692 () Bool)

(declare-fun e!4956 () Bool)

(declare-fun tp_is_empty!421 () Bool)

(assert (=> b!8692 (= e!4956 tp_is_empty!421)))

(declare-fun b!8693 () Bool)

(declare-fun res!8085 () Bool)

(assert (=> b!8693 (=> (not res!8085) (not e!4955))))

(declare-datatypes ((List!252 0))(
  ( (Nil!249) (Cons!248 (h!814 (_ BitVec 64)) (t!2393 List!252)) )
))
(declare-fun arrayNoDuplicates!0 (array!759 (_ BitVec 32) List!252) Bool)

(assert (=> b!8693 (= res!8085 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!249))))

(declare-fun b!8694 () Bool)

(declare-fun e!4958 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(assert (=> b!8694 (= e!4958 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8695 () Bool)

(declare-fun arrayContainsKey!0 (array!759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!8695 (= e!4958 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!8696 () Bool)

(declare-fun res!8087 () Bool)

(assert (=> b!8696 (=> (not res!8087) (not e!4955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8696 (= res!8087 (validKeyInArray!0 k0!1278))))

(declare-fun mapNonEmpty!611 () Bool)

(declare-fun mapRes!611 () Bool)

(declare-fun tp!1268 () Bool)

(declare-fun e!4954 () Bool)

(assert (=> mapNonEmpty!611 (= mapRes!611 (and tp!1268 e!4954))))

(declare-fun mapValue!611 () ValueCell!194)

(declare-fun mapRest!611 () (Array (_ BitVec 32) ValueCell!194))

(declare-fun mapKey!611 () (_ BitVec 32))

(assert (=> mapNonEmpty!611 (= (arr!364 _values!1492) (store mapRest!611 mapKey!611 mapValue!611))))

(declare-fun b!8698 () Bool)

(declare-fun e!4952 () Bool)

(assert (=> b!8698 (= e!4952 true)))

(declare-fun lt!1878 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!759 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8698 (= lt!1878 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!611 () Bool)

(assert (=> mapIsEmpty!611 mapRes!611))

(declare-fun b!8699 () Bool)

(declare-fun e!4953 () Bool)

(assert (=> b!8699 (= e!4953 (and e!4956 mapRes!611))))

(declare-fun condMapEmpty!611 () Bool)

(declare-fun mapDefault!611 () ValueCell!194)

(assert (=> b!8699 (= condMapEmpty!611 (= (arr!364 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!194)) mapDefault!611)))))

(declare-fun b!8700 () Bool)

(declare-fun res!8088 () Bool)

(assert (=> b!8700 (=> (not res!8088) (not e!4955))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!739)

(declare-fun zeroValue!1434 () V!739)

(declare-datatypes ((tuple2!240 0))(
  ( (tuple2!241 (_1!120 (_ BitVec 64)) (_2!120 V!739)) )
))
(declare-datatypes ((List!253 0))(
  ( (Nil!250) (Cons!249 (h!815 tuple2!240) (t!2394 List!253)) )
))
(declare-datatypes ((ListLongMap!245 0))(
  ( (ListLongMap!246 (toList!138 List!253)) )
))
(declare-fun contains!115 (ListLongMap!245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!97 (array!759 array!757 (_ BitVec 32) (_ BitVec 32) V!739 V!739 (_ BitVec 32) Int) ListLongMap!245)

(assert (=> b!8700 (= res!8088 (contains!115 (getCurrentListMap!97 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!8701 () Bool)

(declare-fun res!8083 () Bool)

(assert (=> b!8701 (=> (not res!8083) (not e!4955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!759 (_ BitVec 32)) Bool)

(assert (=> b!8701 (= res!8083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!8702 () Bool)

(assert (=> b!8702 (= e!4954 tp_is_empty!421)))

(declare-fun b!8697 () Bool)

(assert (=> b!8697 (= e!4955 (not e!4952))))

(declare-fun res!8084 () Bool)

(assert (=> b!8697 (=> res!8084 e!4952)))

(assert (=> b!8697 (= res!8084 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!8697 e!4958))

(declare-fun c!662 () Bool)

(assert (=> b!8697 (= c!662 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!171 0))(
  ( (Unit!172) )
))
(declare-fun lt!1877 () Unit!171)

(declare-fun lemmaKeyInListMapIsInArray!65 (array!759 array!757 (_ BitVec 32) (_ BitVec 32) V!739 V!739 (_ BitVec 64) Int) Unit!171)

(assert (=> b!8697 (= lt!1877 (lemmaKeyInListMapIsInArray!65 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun res!8086 () Bool)

(assert (=> start!1014 (=> (not res!8086) (not e!4955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1014 (= res!8086 (validMask!0 mask!2250))))

(assert (=> start!1014 e!4955))

(assert (=> start!1014 tp!1267))

(assert (=> start!1014 true))

(declare-fun array_inv!269 (array!757) Bool)

(assert (=> start!1014 (and (array_inv!269 _values!1492) e!4953)))

(assert (=> start!1014 tp_is_empty!421))

(declare-fun array_inv!270 (array!759) Bool)

(assert (=> start!1014 (array_inv!270 _keys!1806)))

(assert (= (and start!1014 res!8086) b!8691))

(assert (= (and b!8691 res!8089) b!8701))

(assert (= (and b!8701 res!8083) b!8693))

(assert (= (and b!8693 res!8085) b!8700))

(assert (= (and b!8700 res!8088) b!8696))

(assert (= (and b!8696 res!8087) b!8697))

(assert (= (and b!8697 c!662) b!8695))

(assert (= (and b!8697 (not c!662)) b!8694))

(assert (= (and b!8697 (not res!8084)) b!8698))

(assert (= (and b!8699 condMapEmpty!611) mapIsEmpty!611))

(assert (= (and b!8699 (not condMapEmpty!611)) mapNonEmpty!611))

(get-info :version)

(assert (= (and mapNonEmpty!611 ((_ is ValueCellFull!194) mapValue!611)) b!8702))

(assert (= (and b!8699 ((_ is ValueCellFull!194) mapDefault!611)) b!8692))

(assert (= start!1014 b!8699))

(declare-fun m!5365 () Bool)

(assert (=> b!8693 m!5365))

(declare-fun m!5367 () Bool)

(assert (=> mapNonEmpty!611 m!5367))

(declare-fun m!5369 () Bool)

(assert (=> b!8701 m!5369))

(declare-fun m!5371 () Bool)

(assert (=> start!1014 m!5371))

(declare-fun m!5373 () Bool)

(assert (=> start!1014 m!5373))

(declare-fun m!5375 () Bool)

(assert (=> start!1014 m!5375))

(declare-fun m!5377 () Bool)

(assert (=> b!8700 m!5377))

(assert (=> b!8700 m!5377))

(declare-fun m!5379 () Bool)

(assert (=> b!8700 m!5379))

(declare-fun m!5381 () Bool)

(assert (=> b!8696 m!5381))

(declare-fun m!5383 () Bool)

(assert (=> b!8698 m!5383))

(declare-fun m!5385 () Bool)

(assert (=> b!8695 m!5385))

(assert (=> b!8697 m!5385))

(declare-fun m!5387 () Bool)

(assert (=> b!8697 m!5387))

(check-sat (not mapNonEmpty!611) (not b!8697) (not b!8698) b_and!495 (not b_next!343) (not b!8701) (not b!8696) (not b!8700) (not start!1014) (not b!8693) tp_is_empty!421 (not b!8695))
(check-sat b_and!495 (not b_next!343))
