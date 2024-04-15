; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108766 () Bool)

(assert start!108766)

(declare-fun b_free!28279 () Bool)

(declare-fun b_next!28279 () Bool)

(assert (=> start!108766 (= b_free!28279 (not b_next!28279))))

(declare-fun tp!99953 () Bool)

(declare-fun b_and!46327 () Bool)

(assert (=> start!108766 (= tp!99953 b_and!46327)))

(declare-fun mapNonEmpty!52436 () Bool)

(declare-fun mapRes!52436 () Bool)

(declare-fun tp!99954 () Bool)

(declare-fun e!733623 () Bool)

(assert (=> mapNonEmpty!52436 (= mapRes!52436 (and tp!99954 e!733623))))

(declare-datatypes ((V!50329 0))(
  ( (V!50330 (val!17034 Int)) )
))
(declare-datatypes ((ValueCell!16061 0))(
  ( (ValueCellFull!16061 (v!19635 V!50329)) (EmptyCell!16061) )
))
(declare-fun mapValue!52436 () ValueCell!16061)

(declare-fun mapKey!52436 () (_ BitVec 32))

(declare-datatypes ((array!84793 0))(
  ( (array!84794 (arr!40899 (Array (_ BitVec 32) ValueCell!16061)) (size!41451 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84793)

(declare-fun mapRest!52436 () (Array (_ BitVec 32) ValueCell!16061))

(assert (=> mapNonEmpty!52436 (= (arr!40899 _values!1445) (store mapRest!52436 mapKey!52436 mapValue!52436))))

(declare-fun b!1284316 () Bool)

(declare-fun tp_is_empty!33919 () Bool)

(assert (=> b!1284316 (= e!733623 tp_is_empty!33919)))

(declare-fun b!1284317 () Bool)

(declare-fun res!853207 () Bool)

(declare-fun e!733622 () Bool)

(assert (=> b!1284317 (=> (not res!853207) (not e!733622))))

(declare-datatypes ((array!84795 0))(
  ( (array!84796 (arr!40900 (Array (_ BitVec 32) (_ BitVec 64))) (size!41452 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84795)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84795 (_ BitVec 32)) Bool)

(assert (=> b!1284317 (= res!853207 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284318 () Bool)

(declare-fun res!853209 () Bool)

(assert (=> b!1284318 (=> (not res!853209) (not e!733622))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284318 (= res!853209 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41452 _keys!1741))))))

(declare-fun b!1284319 () Bool)

(declare-fun e!733624 () Bool)

(declare-fun e!733626 () Bool)

(assert (=> b!1284319 (= e!733624 (and e!733626 mapRes!52436))))

(declare-fun condMapEmpty!52436 () Bool)

(declare-fun mapDefault!52436 () ValueCell!16061)

(assert (=> b!1284319 (= condMapEmpty!52436 (= (arr!40899 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16061)) mapDefault!52436)))))

(declare-fun b!1284321 () Bool)

(assert (=> b!1284321 (= e!733622 false)))

(declare-fun minValue!1387 () V!50329)

(declare-fun zeroValue!1387 () V!50329)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!576627 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21894 0))(
  ( (tuple2!21895 (_1!10958 (_ BitVec 64)) (_2!10958 V!50329)) )
))
(declare-datatypes ((List!29075 0))(
  ( (Nil!29072) (Cons!29071 (h!30280 tuple2!21894) (t!42611 List!29075)) )
))
(declare-datatypes ((ListLongMap!19551 0))(
  ( (ListLongMap!19552 (toList!9791 List!29075)) )
))
(declare-fun contains!7838 (ListLongMap!19551 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4761 (array!84795 array!84793 (_ BitVec 32) (_ BitVec 32) V!50329 V!50329 (_ BitVec 32) Int) ListLongMap!19551)

(assert (=> b!1284321 (= lt!576627 (contains!7838 (getCurrentListMap!4761 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284322 () Bool)

(assert (=> b!1284322 (= e!733626 tp_is_empty!33919)))

(declare-fun mapIsEmpty!52436 () Bool)

(assert (=> mapIsEmpty!52436 mapRes!52436))

(declare-fun b!1284323 () Bool)

(declare-fun res!853208 () Bool)

(assert (=> b!1284323 (=> (not res!853208) (not e!733622))))

(declare-datatypes ((List!29076 0))(
  ( (Nil!29073) (Cons!29072 (h!30281 (_ BitVec 64)) (t!42612 List!29076)) )
))
(declare-fun arrayNoDuplicates!0 (array!84795 (_ BitVec 32) List!29076) Bool)

(assert (=> b!1284323 (= res!853208 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29073))))

(declare-fun res!853205 () Bool)

(assert (=> start!108766 (=> (not res!853205) (not e!733622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108766 (= res!853205 (validMask!0 mask!2175))))

(assert (=> start!108766 e!733622))

(assert (=> start!108766 tp_is_empty!33919))

(assert (=> start!108766 true))

(declare-fun array_inv!31181 (array!84793) Bool)

(assert (=> start!108766 (and (array_inv!31181 _values!1445) e!733624)))

(declare-fun array_inv!31182 (array!84795) Bool)

(assert (=> start!108766 (array_inv!31182 _keys!1741)))

(assert (=> start!108766 tp!99953))

(declare-fun b!1284320 () Bool)

(declare-fun res!853206 () Bool)

(assert (=> b!1284320 (=> (not res!853206) (not e!733622))))

(assert (=> b!1284320 (= res!853206 (and (= (size!41451 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41452 _keys!1741) (size!41451 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108766 res!853205) b!1284320))

(assert (= (and b!1284320 res!853206) b!1284317))

(assert (= (and b!1284317 res!853207) b!1284323))

(assert (= (and b!1284323 res!853208) b!1284318))

(assert (= (and b!1284318 res!853209) b!1284321))

(assert (= (and b!1284319 condMapEmpty!52436) mapIsEmpty!52436))

(assert (= (and b!1284319 (not condMapEmpty!52436)) mapNonEmpty!52436))

(get-info :version)

(assert (= (and mapNonEmpty!52436 ((_ is ValueCellFull!16061) mapValue!52436)) b!1284316))

(assert (= (and b!1284319 ((_ is ValueCellFull!16061) mapDefault!52436)) b!1284322))

(assert (= start!108766 b!1284319))

(declare-fun m!1177585 () Bool)

(assert (=> b!1284321 m!1177585))

(assert (=> b!1284321 m!1177585))

(declare-fun m!1177587 () Bool)

(assert (=> b!1284321 m!1177587))

(declare-fun m!1177589 () Bool)

(assert (=> b!1284323 m!1177589))

(declare-fun m!1177591 () Bool)

(assert (=> start!108766 m!1177591))

(declare-fun m!1177593 () Bool)

(assert (=> start!108766 m!1177593))

(declare-fun m!1177595 () Bool)

(assert (=> start!108766 m!1177595))

(declare-fun m!1177597 () Bool)

(assert (=> mapNonEmpty!52436 m!1177597))

(declare-fun m!1177599 () Bool)

(assert (=> b!1284317 m!1177599))

(check-sat (not mapNonEmpty!52436) (not start!108766) b_and!46327 (not b!1284317) (not b!1284323) (not b_next!28279) tp_is_empty!33919 (not b!1284321))
(check-sat b_and!46327 (not b_next!28279))
