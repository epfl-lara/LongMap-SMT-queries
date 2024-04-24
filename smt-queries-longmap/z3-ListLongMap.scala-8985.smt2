; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108894 () Bool)

(assert start!108894)

(declare-fun b_free!28183 () Bool)

(declare-fun b_next!28183 () Bool)

(assert (=> start!108894 (= b_free!28183 (not b_next!28183))))

(declare-fun tp!99664 () Bool)

(declare-fun b_and!46251 () Bool)

(assert (=> start!108894 (= tp!99664 b_and!46251)))

(declare-fun b!1284044 () Bool)

(declare-fun e!733782 () Bool)

(declare-fun tp_is_empty!33823 () Bool)

(assert (=> b!1284044 (= e!733782 tp_is_empty!33823)))

(declare-fun b!1284045 () Bool)

(declare-fun res!852550 () Bool)

(declare-fun e!733779 () Bool)

(assert (=> b!1284045 (=> (not res!852550) (not e!733779))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50201 0))(
  ( (V!50202 (val!16986 Int)) )
))
(declare-datatypes ((ValueCell!16013 0))(
  ( (ValueCellFull!16013 (v!19583 V!50201)) (EmptyCell!16013) )
))
(declare-datatypes ((array!84741 0))(
  ( (array!84742 (arr!40868 (Array (_ BitVec 32) ValueCell!16013)) (size!41419 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84741)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84743 0))(
  ( (array!84744 (arr!40869 (Array (_ BitVec 32) (_ BitVec 64))) (size!41420 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84743)

(assert (=> b!1284045 (= res!852550 (and (= (size!41419 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41420 _keys!1741) (size!41419 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284046 () Bool)

(declare-fun e!733781 () Bool)

(assert (=> b!1284046 (= e!733781 tp_is_empty!33823)))

(declare-fun res!852549 () Bool)

(assert (=> start!108894 (=> (not res!852549) (not e!733779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108894 (= res!852549 (validMask!0 mask!2175))))

(assert (=> start!108894 e!733779))

(assert (=> start!108894 tp_is_empty!33823))

(assert (=> start!108894 true))

(declare-fun e!733778 () Bool)

(declare-fun array_inv!31213 (array!84741) Bool)

(assert (=> start!108894 (and (array_inv!31213 _values!1445) e!733778)))

(declare-fun array_inv!31214 (array!84743) Bool)

(assert (=> start!108894 (array_inv!31214 _keys!1741)))

(assert (=> start!108894 tp!99664))

(declare-fun b!1284047 () Bool)

(declare-fun mapRes!52292 () Bool)

(assert (=> b!1284047 (= e!733778 (and e!733781 mapRes!52292))))

(declare-fun condMapEmpty!52292 () Bool)

(declare-fun mapDefault!52292 () ValueCell!16013)

(assert (=> b!1284047 (= condMapEmpty!52292 (= (arr!40868 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16013)) mapDefault!52292)))))

(declare-fun mapIsEmpty!52292 () Bool)

(assert (=> mapIsEmpty!52292 mapRes!52292))

(declare-fun b!1284048 () Bool)

(declare-fun res!852545 () Bool)

(assert (=> b!1284048 (=> (not res!852545) (not e!733779))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84743 (_ BitVec 32)) Bool)

(assert (=> b!1284048 (= res!852545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284049 () Bool)

(declare-fun res!852547 () Bool)

(assert (=> b!1284049 (=> (not res!852547) (not e!733779))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1284049 (= res!852547 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41420 _keys!1741))))))

(declare-fun b!1284050 () Bool)

(declare-fun res!852543 () Bool)

(assert (=> b!1284050 (=> (not res!852543) (not e!733779))))

(declare-fun minValue!1387 () V!50201)

(declare-fun zeroValue!1387 () V!50201)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21766 0))(
  ( (tuple2!21767 (_1!10894 (_ BitVec 64)) (_2!10894 V!50201)) )
))
(declare-datatypes ((List!28978 0))(
  ( (Nil!28975) (Cons!28974 (h!30192 tuple2!21766) (t!42514 List!28978)) )
))
(declare-datatypes ((ListLongMap!19431 0))(
  ( (ListLongMap!19432 (toList!9731 List!28978)) )
))
(declare-fun contains!7862 (ListLongMap!19431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4800 (array!84743 array!84741 (_ BitVec 32) (_ BitVec 32) V!50201 V!50201 (_ BitVec 32) Int) ListLongMap!19431)

(assert (=> b!1284050 (= res!852543 (contains!7862 (getCurrentListMap!4800 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284051 () Bool)

(declare-fun res!852544 () Bool)

(assert (=> b!1284051 (=> (not res!852544) (not e!733779))))

(assert (=> b!1284051 (= res!852544 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41420 _keys!1741))))))

(declare-fun b!1284052 () Bool)

(declare-fun res!852546 () Bool)

(assert (=> b!1284052 (=> (not res!852546) (not e!733779))))

(declare-datatypes ((List!28979 0))(
  ( (Nil!28976) (Cons!28975 (h!30193 (_ BitVec 64)) (t!42515 List!28979)) )
))
(declare-fun arrayNoDuplicates!0 (array!84743 (_ BitVec 32) List!28979) Bool)

(assert (=> b!1284052 (= res!852546 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28976))))

(declare-fun b!1284053 () Bool)

(assert (=> b!1284053 (= e!733779 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsgt from!2144 (size!41420 _keys!1741))))))

(declare-fun mapNonEmpty!52292 () Bool)

(declare-fun tp!99665 () Bool)

(assert (=> mapNonEmpty!52292 (= mapRes!52292 (and tp!99665 e!733782))))

(declare-fun mapValue!52292 () ValueCell!16013)

(declare-fun mapRest!52292 () (Array (_ BitVec 32) ValueCell!16013))

(declare-fun mapKey!52292 () (_ BitVec 32))

(assert (=> mapNonEmpty!52292 (= (arr!40868 _values!1445) (store mapRest!52292 mapKey!52292 mapValue!52292))))

(declare-fun b!1284054 () Bool)

(declare-fun res!852548 () Bool)

(assert (=> b!1284054 (=> (not res!852548) (not e!733779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284054 (= res!852548 (validKeyInArray!0 (select (arr!40869 _keys!1741) from!2144)))))

(assert (= (and start!108894 res!852549) b!1284045))

(assert (= (and b!1284045 res!852550) b!1284048))

(assert (= (and b!1284048 res!852545) b!1284052))

(assert (= (and b!1284052 res!852546) b!1284049))

(assert (= (and b!1284049 res!852547) b!1284050))

(assert (= (and b!1284050 res!852543) b!1284051))

(assert (= (and b!1284051 res!852544) b!1284054))

(assert (= (and b!1284054 res!852548) b!1284053))

(assert (= (and b!1284047 condMapEmpty!52292) mapIsEmpty!52292))

(assert (= (and b!1284047 (not condMapEmpty!52292)) mapNonEmpty!52292))

(get-info :version)

(assert (= (and mapNonEmpty!52292 ((_ is ValueCellFull!16013) mapValue!52292)) b!1284044))

(assert (= (and b!1284047 ((_ is ValueCellFull!16013) mapDefault!52292)) b!1284046))

(assert (= start!108894 b!1284047))

(declare-fun m!1178449 () Bool)

(assert (=> start!108894 m!1178449))

(declare-fun m!1178451 () Bool)

(assert (=> start!108894 m!1178451))

(declare-fun m!1178453 () Bool)

(assert (=> start!108894 m!1178453))

(declare-fun m!1178455 () Bool)

(assert (=> b!1284054 m!1178455))

(assert (=> b!1284054 m!1178455))

(declare-fun m!1178457 () Bool)

(assert (=> b!1284054 m!1178457))

(declare-fun m!1178459 () Bool)

(assert (=> b!1284048 m!1178459))

(declare-fun m!1178461 () Bool)

(assert (=> b!1284050 m!1178461))

(assert (=> b!1284050 m!1178461))

(declare-fun m!1178463 () Bool)

(assert (=> b!1284050 m!1178463))

(declare-fun m!1178465 () Bool)

(assert (=> b!1284052 m!1178465))

(declare-fun m!1178467 () Bool)

(assert (=> mapNonEmpty!52292 m!1178467))

(check-sat tp_is_empty!33823 (not b_next!28183) (not b!1284048) (not b!1284050) (not b!1284052) (not start!108894) (not mapNonEmpty!52292) (not b!1284054) b_and!46251)
(check-sat b_and!46251 (not b_next!28183))
