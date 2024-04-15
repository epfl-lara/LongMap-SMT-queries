; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108970 () Bool)

(assert start!108970)

(declare-fun b_free!28459 () Bool)

(declare-fun b_next!28459 () Bool)

(assert (=> start!108970 (= b_free!28459 (not b_next!28459))))

(declare-fun tp!100496 () Bool)

(declare-fun b_and!46531 () Bool)

(assert (=> start!108970 (= tp!100496 b_and!46531)))

(declare-fun b!1287533 () Bool)

(declare-fun res!855127 () Bool)

(declare-fun e!735291 () Bool)

(assert (=> b!1287533 (=> (not res!855127) (not e!735291))))

(declare-datatypes ((array!85137 0))(
  ( (array!85138 (arr!41070 (Array (_ BitVec 32) (_ BitVec 64))) (size!41622 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85137)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287533 (= res!855127 (not (validKeyInArray!0 (select (arr!41070 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!52709 () Bool)

(declare-fun mapRes!52709 () Bool)

(declare-fun tp!100497 () Bool)

(declare-fun e!735290 () Bool)

(assert (=> mapNonEmpty!52709 (= mapRes!52709 (and tp!100497 e!735290))))

(declare-datatypes ((V!50569 0))(
  ( (V!50570 (val!17124 Int)) )
))
(declare-datatypes ((ValueCell!16151 0))(
  ( (ValueCellFull!16151 (v!19726 V!50569)) (EmptyCell!16151) )
))
(declare-fun mapRest!52709 () (Array (_ BitVec 32) ValueCell!16151))

(declare-fun mapValue!52709 () ValueCell!16151)

(declare-datatypes ((array!85139 0))(
  ( (array!85140 (arr!41071 (Array (_ BitVec 32) ValueCell!16151)) (size!41623 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85139)

(declare-fun mapKey!52709 () (_ BitVec 32))

(assert (=> mapNonEmpty!52709 (= (arr!41071 _values!1445) (store mapRest!52709 mapKey!52709 mapValue!52709))))

(declare-fun mapIsEmpty!52709 () Bool)

(assert (=> mapIsEmpty!52709 mapRes!52709))

(declare-fun b!1287534 () Bool)

(declare-fun res!855126 () Bool)

(assert (=> b!1287534 (=> (not res!855126) (not e!735291))))

(declare-datatypes ((List!29201 0))(
  ( (Nil!29198) (Cons!29197 (h!30406 (_ BitVec 64)) (t!42757 List!29201)) )
))
(declare-fun arrayNoDuplicates!0 (array!85137 (_ BitVec 32) List!29201) Bool)

(assert (=> b!1287534 (= res!855126 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29198))))

(declare-fun b!1287535 () Bool)

(declare-fun e!735294 () Bool)

(declare-fun e!735292 () Bool)

(assert (=> b!1287535 (= e!735294 (and e!735292 mapRes!52709))))

(declare-fun condMapEmpty!52709 () Bool)

(declare-fun mapDefault!52709 () ValueCell!16151)

(assert (=> b!1287535 (= condMapEmpty!52709 (= (arr!41071 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16151)) mapDefault!52709)))))

(declare-fun b!1287536 () Bool)

(assert (=> b!1287536 (= e!735291 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22028 0))(
  ( (tuple2!22029 (_1!11025 (_ BitVec 64)) (_2!11025 V!50569)) )
))
(declare-datatypes ((List!29202 0))(
  ( (Nil!29199) (Cons!29198 (h!30407 tuple2!22028) (t!42758 List!29202)) )
))
(declare-datatypes ((ListLongMap!19685 0))(
  ( (ListLongMap!19686 (toList!9858 List!29202)) )
))
(declare-fun contains!7906 (ListLongMap!19685 (_ BitVec 64)) Bool)

(assert (=> b!1287536 (not (contains!7906 (ListLongMap!19686 Nil!29199) k0!1205))))

(declare-datatypes ((Unit!42424 0))(
  ( (Unit!42425) )
))
(declare-fun lt!577702 () Unit!42424)

(declare-fun emptyContainsNothing!19 ((_ BitVec 64)) Unit!42424)

(assert (=> b!1287536 (= lt!577702 (emptyContainsNothing!19 k0!1205))))

(declare-fun b!1287538 () Bool)

(declare-fun res!855124 () Bool)

(assert (=> b!1287538 (=> (not res!855124) (not e!735291))))

(assert (=> b!1287538 (= res!855124 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41622 _keys!1741))))))

(declare-fun b!1287539 () Bool)

(declare-fun res!855122 () Bool)

(assert (=> b!1287539 (=> (not res!855122) (not e!735291))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85137 (_ BitVec 32)) Bool)

(assert (=> b!1287539 (= res!855122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287540 () Bool)

(declare-fun tp_is_empty!34099 () Bool)

(assert (=> b!1287540 (= e!735290 tp_is_empty!34099)))

(declare-fun b!1287541 () Bool)

(declare-fun res!855128 () Bool)

(assert (=> b!1287541 (=> (not res!855128) (not e!735291))))

(assert (=> b!1287541 (= res!855128 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41622 _keys!1741))))))

(declare-fun b!1287537 () Bool)

(declare-fun res!855125 () Bool)

(assert (=> b!1287537 (=> (not res!855125) (not e!735291))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287537 (= res!855125 (and (= (size!41623 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41622 _keys!1741) (size!41623 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!855129 () Bool)

(assert (=> start!108970 (=> (not res!855129) (not e!735291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108970 (= res!855129 (validMask!0 mask!2175))))

(assert (=> start!108970 e!735291))

(assert (=> start!108970 tp_is_empty!34099))

(assert (=> start!108970 true))

(declare-fun array_inv!31299 (array!85139) Bool)

(assert (=> start!108970 (and (array_inv!31299 _values!1445) e!735294)))

(declare-fun array_inv!31300 (array!85137) Bool)

(assert (=> start!108970 (array_inv!31300 _keys!1741)))

(assert (=> start!108970 tp!100496))

(declare-fun b!1287542 () Bool)

(declare-fun res!855123 () Bool)

(assert (=> b!1287542 (=> (not res!855123) (not e!735291))))

(declare-fun minValue!1387 () V!50569)

(declare-fun zeroValue!1387 () V!50569)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4821 (array!85137 array!85139 (_ BitVec 32) (_ BitVec 32) V!50569 V!50569 (_ BitVec 32) Int) ListLongMap!19685)

(assert (=> b!1287542 (= res!855123 (contains!7906 (getCurrentListMap!4821 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287543 () Bool)

(assert (=> b!1287543 (= e!735292 tp_is_empty!34099)))

(assert (= (and start!108970 res!855129) b!1287537))

(assert (= (and b!1287537 res!855125) b!1287539))

(assert (= (and b!1287539 res!855122) b!1287534))

(assert (= (and b!1287534 res!855126) b!1287538))

(assert (= (and b!1287538 res!855124) b!1287542))

(assert (= (and b!1287542 res!855123) b!1287541))

(assert (= (and b!1287541 res!855128) b!1287533))

(assert (= (and b!1287533 res!855127) b!1287536))

(assert (= (and b!1287535 condMapEmpty!52709) mapIsEmpty!52709))

(assert (= (and b!1287535 (not condMapEmpty!52709)) mapNonEmpty!52709))

(get-info :version)

(assert (= (and mapNonEmpty!52709 ((_ is ValueCellFull!16151) mapValue!52709)) b!1287540))

(assert (= (and b!1287535 ((_ is ValueCellFull!16151) mapDefault!52709)) b!1287543))

(assert (= start!108970 b!1287535))

(declare-fun m!1179915 () Bool)

(assert (=> b!1287539 m!1179915))

(declare-fun m!1179917 () Bool)

(assert (=> start!108970 m!1179917))

(declare-fun m!1179919 () Bool)

(assert (=> start!108970 m!1179919))

(declare-fun m!1179921 () Bool)

(assert (=> start!108970 m!1179921))

(declare-fun m!1179923 () Bool)

(assert (=> b!1287542 m!1179923))

(assert (=> b!1287542 m!1179923))

(declare-fun m!1179925 () Bool)

(assert (=> b!1287542 m!1179925))

(declare-fun m!1179927 () Bool)

(assert (=> b!1287536 m!1179927))

(declare-fun m!1179929 () Bool)

(assert (=> b!1287536 m!1179929))

(declare-fun m!1179931 () Bool)

(assert (=> b!1287533 m!1179931))

(assert (=> b!1287533 m!1179931))

(declare-fun m!1179933 () Bool)

(assert (=> b!1287533 m!1179933))

(declare-fun m!1179935 () Bool)

(assert (=> b!1287534 m!1179935))

(declare-fun m!1179937 () Bool)

(assert (=> mapNonEmpty!52709 m!1179937))

(check-sat (not b_next!28459) (not start!108970) (not b!1287534) (not b!1287542) b_and!46531 (not b!1287533) (not b!1287539) (not b!1287536) (not mapNonEmpty!52709) tp_is_empty!34099)
(check-sat b_and!46531 (not b_next!28459))
