; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108972 () Bool)

(assert start!108972)

(declare-fun b_free!28461 () Bool)

(declare-fun b_next!28461 () Bool)

(assert (=> start!108972 (= b_free!28461 (not b_next!28461))))

(declare-fun tp!100501 () Bool)

(declare-fun b_and!46551 () Bool)

(assert (=> start!108972 (= tp!100501 b_and!46551)))

(declare-fun mapNonEmpty!52712 () Bool)

(declare-fun mapRes!52712 () Bool)

(declare-fun tp!100502 () Bool)

(declare-fun e!735337 () Bool)

(assert (=> mapNonEmpty!52712 (= mapRes!52712 (and tp!100502 e!735337))))

(declare-datatypes ((V!50571 0))(
  ( (V!50572 (val!17125 Int)) )
))
(declare-datatypes ((ValueCell!16152 0))(
  ( (ValueCellFull!16152 (v!19728 V!50571)) (EmptyCell!16152) )
))
(declare-fun mapRest!52712 () (Array (_ BitVec 32) ValueCell!16152))

(declare-fun mapKey!52712 () (_ BitVec 32))

(declare-fun mapValue!52712 () ValueCell!16152)

(declare-datatypes ((array!85252 0))(
  ( (array!85253 (arr!41127 (Array (_ BitVec 32) ValueCell!16152)) (size!41677 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85252)

(assert (=> mapNonEmpty!52712 (= (arr!41127 _values!1445) (store mapRest!52712 mapKey!52712 mapValue!52712))))

(declare-fun b!1287630 () Bool)

(declare-fun res!855174 () Bool)

(declare-fun e!735334 () Bool)

(assert (=> b!1287630 (=> (not res!855174) (not e!735334))))

(declare-datatypes ((array!85254 0))(
  ( (array!85255 (arr!41128 (Array (_ BitVec 32) (_ BitVec 64))) (size!41678 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85254)

(declare-datatypes ((List!29152 0))(
  ( (Nil!29149) (Cons!29148 (h!30357 (_ BitVec 64)) (t!42716 List!29152)) )
))
(declare-fun arrayNoDuplicates!0 (array!85254 (_ BitVec 32) List!29152) Bool)

(assert (=> b!1287630 (= res!855174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29149))))

(declare-fun b!1287631 () Bool)

(assert (=> b!1287631 (= e!735334 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!21974 0))(
  ( (tuple2!21975 (_1!10998 (_ BitVec 64)) (_2!10998 V!50571)) )
))
(declare-datatypes ((List!29153 0))(
  ( (Nil!29150) (Cons!29149 (h!30358 tuple2!21974) (t!42717 List!29153)) )
))
(declare-datatypes ((ListLongMap!19631 0))(
  ( (ListLongMap!19632 (toList!9831 List!29153)) )
))
(declare-fun contains!7949 (ListLongMap!19631 (_ BitVec 64)) Bool)

(assert (=> b!1287631 (not (contains!7949 (ListLongMap!19632 Nil!29150) k0!1205))))

(declare-datatypes ((Unit!42584 0))(
  ( (Unit!42585) )
))
(declare-fun lt!577883 () Unit!42584)

(declare-fun emptyContainsNothing!21 ((_ BitVec 64)) Unit!42584)

(assert (=> b!1287631 (= lt!577883 (emptyContainsNothing!21 k0!1205))))

(declare-fun b!1287632 () Bool)

(declare-fun res!855175 () Bool)

(assert (=> b!1287632 (=> (not res!855175) (not e!735334))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85254 (_ BitVec 32)) Bool)

(assert (=> b!1287632 (= res!855175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287633 () Bool)

(declare-fun tp_is_empty!34101 () Bool)

(assert (=> b!1287633 (= e!735337 tp_is_empty!34101)))

(declare-fun res!855177 () Bool)

(assert (=> start!108972 (=> (not res!855177) (not e!735334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108972 (= res!855177 (validMask!0 mask!2175))))

(assert (=> start!108972 e!735334))

(assert (=> start!108972 tp_is_empty!34101))

(assert (=> start!108972 true))

(declare-fun e!735335 () Bool)

(declare-fun array_inv!31189 (array!85252) Bool)

(assert (=> start!108972 (and (array_inv!31189 _values!1445) e!735335)))

(declare-fun array_inv!31190 (array!85254) Bool)

(assert (=> start!108972 (array_inv!31190 _keys!1741)))

(assert (=> start!108972 tp!100501))

(declare-fun b!1287634 () Bool)

(declare-fun res!855173 () Bool)

(assert (=> b!1287634 (=> (not res!855173) (not e!735334))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1287634 (= res!855173 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41678 _keys!1741))))))

(declare-fun mapIsEmpty!52712 () Bool)

(assert (=> mapIsEmpty!52712 mapRes!52712))

(declare-fun b!1287635 () Bool)

(declare-fun res!855180 () Bool)

(assert (=> b!1287635 (=> (not res!855180) (not e!735334))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287635 (= res!855180 (and (= (size!41677 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41678 _keys!1741) (size!41677 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287636 () Bool)

(declare-fun e!735336 () Bool)

(assert (=> b!1287636 (= e!735336 tp_is_empty!34101)))

(declare-fun b!1287637 () Bool)

(declare-fun res!855179 () Bool)

(assert (=> b!1287637 (=> (not res!855179) (not e!735334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287637 (= res!855179 (not (validKeyInArray!0 (select (arr!41128 _keys!1741) from!2144))))))

(declare-fun b!1287638 () Bool)

(declare-fun res!855176 () Bool)

(assert (=> b!1287638 (=> (not res!855176) (not e!735334))))

(assert (=> b!1287638 (= res!855176 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41678 _keys!1741))))))

(declare-fun b!1287639 () Bool)

(declare-fun res!855178 () Bool)

(assert (=> b!1287639 (=> (not res!855178) (not e!735334))))

(declare-fun minValue!1387 () V!50571)

(declare-fun zeroValue!1387 () V!50571)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4903 (array!85254 array!85252 (_ BitVec 32) (_ BitVec 32) V!50571 V!50571 (_ BitVec 32) Int) ListLongMap!19631)

(assert (=> b!1287639 (= res!855178 (contains!7949 (getCurrentListMap!4903 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287640 () Bool)

(assert (=> b!1287640 (= e!735335 (and e!735336 mapRes!52712))))

(declare-fun condMapEmpty!52712 () Bool)

(declare-fun mapDefault!52712 () ValueCell!16152)

(assert (=> b!1287640 (= condMapEmpty!52712 (= (arr!41127 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16152)) mapDefault!52712)))))

(assert (= (and start!108972 res!855177) b!1287635))

(assert (= (and b!1287635 res!855180) b!1287632))

(assert (= (and b!1287632 res!855175) b!1287630))

(assert (= (and b!1287630 res!855174) b!1287638))

(assert (= (and b!1287638 res!855176) b!1287639))

(assert (= (and b!1287639 res!855178) b!1287634))

(assert (= (and b!1287634 res!855173) b!1287637))

(assert (= (and b!1287637 res!855179) b!1287631))

(assert (= (and b!1287640 condMapEmpty!52712) mapIsEmpty!52712))

(assert (= (and b!1287640 (not condMapEmpty!52712)) mapNonEmpty!52712))

(get-info :version)

(assert (= (and mapNonEmpty!52712 ((_ is ValueCellFull!16152) mapValue!52712)) b!1287633))

(assert (= (and b!1287640 ((_ is ValueCellFull!16152) mapDefault!52712)) b!1287636))

(assert (= start!108972 b!1287640))

(declare-fun m!1180439 () Bool)

(assert (=> b!1287639 m!1180439))

(assert (=> b!1287639 m!1180439))

(declare-fun m!1180441 () Bool)

(assert (=> b!1287639 m!1180441))

(declare-fun m!1180443 () Bool)

(assert (=> b!1287637 m!1180443))

(assert (=> b!1287637 m!1180443))

(declare-fun m!1180445 () Bool)

(assert (=> b!1287637 m!1180445))

(declare-fun m!1180447 () Bool)

(assert (=> b!1287632 m!1180447))

(declare-fun m!1180449 () Bool)

(assert (=> b!1287630 m!1180449))

(declare-fun m!1180451 () Bool)

(assert (=> mapNonEmpty!52712 m!1180451))

(declare-fun m!1180453 () Bool)

(assert (=> b!1287631 m!1180453))

(declare-fun m!1180455 () Bool)

(assert (=> b!1287631 m!1180455))

(declare-fun m!1180457 () Bool)

(assert (=> start!108972 m!1180457))

(declare-fun m!1180459 () Bool)

(assert (=> start!108972 m!1180459))

(declare-fun m!1180461 () Bool)

(assert (=> start!108972 m!1180461))

(check-sat (not b_next!28461) (not b!1287632) tp_is_empty!34101 (not b!1287630) (not start!108972) (not b!1287639) (not mapNonEmpty!52712) (not b!1287631) b_and!46551 (not b!1287637))
(check-sat b_and!46551 (not b_next!28461))
