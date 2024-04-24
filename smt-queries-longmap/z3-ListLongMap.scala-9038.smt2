; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109236 () Bool)

(assert start!109236)

(declare-fun b_free!28501 () Bool)

(declare-fun b_next!28501 () Bool)

(assert (=> start!109236 (= b_free!28501 (not b_next!28501))))

(declare-fun tp!100622 () Bool)

(declare-fun b_and!46593 () Bool)

(assert (=> start!109236 (= tp!100622 b_and!46593)))

(declare-fun b!1289607 () Bool)

(declare-fun res!856192 () Bool)

(declare-fun e!736493 () Bool)

(assert (=> b!1289607 (=> (not res!856192) (not e!736493))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85363 0))(
  ( (array!85364 (arr!41178 (Array (_ BitVec 32) (_ BitVec 64))) (size!41729 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85363)

(assert (=> b!1289607 (= res!856192 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41729 _keys!1741))))))

(declare-fun b!1289608 () Bool)

(declare-fun res!856185 () Bool)

(assert (=> b!1289608 (=> (not res!856185) (not e!736493))))

(assert (=> b!1289608 (= res!856185 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41729 _keys!1741))))))

(declare-fun b!1289609 () Bool)

(declare-fun e!736495 () Bool)

(declare-fun tp_is_empty!34141 () Bool)

(assert (=> b!1289609 (= e!736495 tp_is_empty!34141)))

(declare-fun mapNonEmpty!52772 () Bool)

(declare-fun mapRes!52772 () Bool)

(declare-fun tp!100621 () Bool)

(assert (=> mapNonEmpty!52772 (= mapRes!52772 (and tp!100621 e!736495))))

(declare-fun mapKey!52772 () (_ BitVec 32))

(declare-datatypes ((V!50625 0))(
  ( (V!50626 (val!17145 Int)) )
))
(declare-datatypes ((ValueCell!16172 0))(
  ( (ValueCellFull!16172 (v!19743 V!50625)) (EmptyCell!16172) )
))
(declare-datatypes ((array!85365 0))(
  ( (array!85366 (arr!41179 (Array (_ BitVec 32) ValueCell!16172)) (size!41730 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85365)

(declare-fun mapValue!52772 () ValueCell!16172)

(declare-fun mapRest!52772 () (Array (_ BitVec 32) ValueCell!16172))

(assert (=> mapNonEmpty!52772 (= (arr!41179 _values!1445) (store mapRest!52772 mapKey!52772 mapValue!52772))))

(declare-fun b!1289610 () Bool)

(declare-fun res!856188 () Bool)

(assert (=> b!1289610 (=> (not res!856188) (not e!736493))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289610 (= res!856188 (not (validKeyInArray!0 (select (arr!41178 _keys!1741) from!2144))))))

(declare-fun b!1289611 () Bool)

(declare-fun e!736496 () Bool)

(declare-fun e!736494 () Bool)

(assert (=> b!1289611 (= e!736496 (and e!736494 mapRes!52772))))

(declare-fun condMapEmpty!52772 () Bool)

(declare-fun mapDefault!52772 () ValueCell!16172)

(assert (=> b!1289611 (= condMapEmpty!52772 (= (arr!41179 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16172)) mapDefault!52772)))))

(declare-fun b!1289612 () Bool)

(declare-fun res!856189 () Bool)

(assert (=> b!1289612 (=> (not res!856189) (not e!736493))))

(declare-datatypes ((List!29209 0))(
  ( (Nil!29206) (Cons!29205 (h!30423 (_ BitVec 64)) (t!42765 List!29209)) )
))
(declare-fun arrayNoDuplicates!0 (array!85363 (_ BitVec 32) List!29209) Bool)

(assert (=> b!1289612 (= res!856189 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29206))))

(declare-fun b!1289613 () Bool)

(declare-fun res!856184 () Bool)

(assert (=> b!1289613 (=> (not res!856184) (not e!736493))))

(declare-fun minValue!1387 () V!50625)

(declare-fun zeroValue!1387 () V!50625)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22022 0))(
  ( (tuple2!22023 (_1!11022 (_ BitVec 64)) (_2!11022 V!50625)) )
))
(declare-datatypes ((List!29210 0))(
  ( (Nil!29207) (Cons!29206 (h!30424 tuple2!22022) (t!42766 List!29210)) )
))
(declare-datatypes ((ListLongMap!19687 0))(
  ( (ListLongMap!19688 (toList!9859 List!29210)) )
))
(declare-fun contains!7990 (ListLongMap!19687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4909 (array!85363 array!85365 (_ BitVec 32) (_ BitVec 32) V!50625 V!50625 (_ BitVec 32) Int) ListLongMap!19687)

(assert (=> b!1289613 (= res!856184 (contains!7990 (getCurrentListMap!4909 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1289614 () Bool)

(declare-fun e!736497 () Bool)

(assert (=> b!1289614 (= e!736497 true)))

(declare-fun lt!578441 () ListLongMap!19687)

(declare-fun +!4367 (ListLongMap!19687 tuple2!22022) ListLongMap!19687)

(assert (=> b!1289614 (not (contains!7990 (+!4367 lt!578441 (tuple2!22023 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42569 0))(
  ( (Unit!42570) )
))
(declare-fun lt!578442 () Unit!42569)

(declare-fun addStillNotContains!343 (ListLongMap!19687 (_ BitVec 64) V!50625 (_ BitVec 64)) Unit!42569)

(assert (=> b!1289614 (= lt!578442 (addStillNotContains!343 lt!578441 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6005 (array!85363 array!85365 (_ BitVec 32) (_ BitVec 32) V!50625 V!50625 (_ BitVec 32) Int) ListLongMap!19687)

(assert (=> b!1289614 (= lt!578441 (getCurrentListMapNoExtraKeys!6005 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!856190 () Bool)

(assert (=> start!109236 (=> (not res!856190) (not e!736493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109236 (= res!856190 (validMask!0 mask!2175))))

(assert (=> start!109236 e!736493))

(assert (=> start!109236 tp_is_empty!34141))

(assert (=> start!109236 true))

(declare-fun array_inv!31431 (array!85365) Bool)

(assert (=> start!109236 (and (array_inv!31431 _values!1445) e!736496)))

(declare-fun array_inv!31432 (array!85363) Bool)

(assert (=> start!109236 (array_inv!31432 _keys!1741)))

(assert (=> start!109236 tp!100622))

(declare-fun b!1289606 () Bool)

(assert (=> b!1289606 (= e!736493 (not e!736497))))

(declare-fun res!856186 () Bool)

(assert (=> b!1289606 (=> res!856186 e!736497)))

(assert (=> b!1289606 (= res!856186 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289606 (not (contains!7990 (ListLongMap!19688 Nil!29207) k0!1205))))

(declare-fun lt!578440 () Unit!42569)

(declare-fun emptyContainsNothing!38 ((_ BitVec 64)) Unit!42569)

(assert (=> b!1289606 (= lt!578440 (emptyContainsNothing!38 k0!1205))))

(declare-fun b!1289615 () Bool)

(assert (=> b!1289615 (= e!736494 tp_is_empty!34141)))

(declare-fun mapIsEmpty!52772 () Bool)

(assert (=> mapIsEmpty!52772 mapRes!52772))

(declare-fun b!1289616 () Bool)

(declare-fun res!856191 () Bool)

(assert (=> b!1289616 (=> (not res!856191) (not e!736493))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85363 (_ BitVec 32)) Bool)

(assert (=> b!1289616 (= res!856191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289617 () Bool)

(declare-fun res!856187 () Bool)

(assert (=> b!1289617 (=> (not res!856187) (not e!736493))))

(assert (=> b!1289617 (= res!856187 (and (= (size!41730 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41729 _keys!1741) (size!41730 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109236 res!856190) b!1289617))

(assert (= (and b!1289617 res!856187) b!1289616))

(assert (= (and b!1289616 res!856191) b!1289612))

(assert (= (and b!1289612 res!856189) b!1289608))

(assert (= (and b!1289608 res!856185) b!1289613))

(assert (= (and b!1289613 res!856184) b!1289607))

(assert (= (and b!1289607 res!856192) b!1289610))

(assert (= (and b!1289610 res!856188) b!1289606))

(assert (= (and b!1289606 (not res!856186)) b!1289614))

(assert (= (and b!1289611 condMapEmpty!52772) mapIsEmpty!52772))

(assert (= (and b!1289611 (not condMapEmpty!52772)) mapNonEmpty!52772))

(get-info :version)

(assert (= (and mapNonEmpty!52772 ((_ is ValueCellFull!16172) mapValue!52772)) b!1289609))

(assert (= (and b!1289611 ((_ is ValueCellFull!16172) mapDefault!52772)) b!1289615))

(assert (= start!109236 b!1289611))

(declare-fun m!1182549 () Bool)

(assert (=> b!1289616 m!1182549))

(declare-fun m!1182551 () Bool)

(assert (=> b!1289610 m!1182551))

(assert (=> b!1289610 m!1182551))

(declare-fun m!1182553 () Bool)

(assert (=> b!1289610 m!1182553))

(declare-fun m!1182555 () Bool)

(assert (=> mapNonEmpty!52772 m!1182555))

(declare-fun m!1182557 () Bool)

(assert (=> b!1289606 m!1182557))

(declare-fun m!1182559 () Bool)

(assert (=> b!1289606 m!1182559))

(declare-fun m!1182561 () Bool)

(assert (=> start!109236 m!1182561))

(declare-fun m!1182563 () Bool)

(assert (=> start!109236 m!1182563))

(declare-fun m!1182565 () Bool)

(assert (=> start!109236 m!1182565))

(declare-fun m!1182567 () Bool)

(assert (=> b!1289614 m!1182567))

(assert (=> b!1289614 m!1182567))

(declare-fun m!1182569 () Bool)

(assert (=> b!1289614 m!1182569))

(declare-fun m!1182571 () Bool)

(assert (=> b!1289614 m!1182571))

(declare-fun m!1182573 () Bool)

(assert (=> b!1289614 m!1182573))

(declare-fun m!1182575 () Bool)

(assert (=> b!1289613 m!1182575))

(assert (=> b!1289613 m!1182575))

(declare-fun m!1182577 () Bool)

(assert (=> b!1289613 m!1182577))

(declare-fun m!1182579 () Bool)

(assert (=> b!1289612 m!1182579))

(check-sat b_and!46593 (not b_next!28501) (not b!1289612) tp_is_empty!34141 (not start!109236) (not b!1289610) (not b!1289616) (not b!1289614) (not b!1289606) (not b!1289613) (not mapNonEmpty!52772))
(check-sat b_and!46593 (not b_next!28501))
