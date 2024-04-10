; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108978 () Bool)

(assert start!108978)

(declare-fun b_free!28467 () Bool)

(declare-fun b_next!28467 () Bool)

(assert (=> start!108978 (= b_free!28467 (not b_next!28467))))

(declare-fun tp!100520 () Bool)

(declare-fun b_and!46557 () Bool)

(assert (=> start!108978 (= tp!100520 b_and!46557)))

(declare-fun mapNonEmpty!52721 () Bool)

(declare-fun mapRes!52721 () Bool)

(declare-fun tp!100519 () Bool)

(declare-fun e!735383 () Bool)

(assert (=> mapNonEmpty!52721 (= mapRes!52721 (and tp!100519 e!735383))))

(declare-fun mapKey!52721 () (_ BitVec 32))

(declare-datatypes ((V!50579 0))(
  ( (V!50580 (val!17128 Int)) )
))
(declare-datatypes ((ValueCell!16155 0))(
  ( (ValueCellFull!16155 (v!19731 V!50579)) (EmptyCell!16155) )
))
(declare-fun mapRest!52721 () (Array (_ BitVec 32) ValueCell!16155))

(declare-datatypes ((array!85264 0))(
  ( (array!85265 (arr!41133 (Array (_ BitVec 32) ValueCell!16155)) (size!41683 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85264)

(declare-fun mapValue!52721 () ValueCell!16155)

(assert (=> mapNonEmpty!52721 (= (arr!41133 _values!1445) (store mapRest!52721 mapKey!52721 mapValue!52721))))

(declare-fun b!1287729 () Bool)

(declare-fun e!735381 () Bool)

(declare-fun tp_is_empty!34107 () Bool)

(assert (=> b!1287729 (= e!735381 tp_is_empty!34107)))

(declare-fun b!1287730 () Bool)

(declare-fun res!855250 () Bool)

(declare-fun e!735380 () Bool)

(assert (=> b!1287730 (=> (not res!855250) (not e!735380))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85266 0))(
  ( (array!85267 (arr!41134 (Array (_ BitVec 32) (_ BitVec 64))) (size!41684 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85266)

(assert (=> b!1287730 (= res!855250 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41684 _keys!1741))))))

(declare-fun mapIsEmpty!52721 () Bool)

(assert (=> mapIsEmpty!52721 mapRes!52721))

(declare-fun b!1287731 () Bool)

(assert (=> b!1287731 (= e!735383 tp_is_empty!34107)))

(declare-fun b!1287732 () Bool)

(declare-fun res!855247 () Bool)

(assert (=> b!1287732 (=> (not res!855247) (not e!735380))))

(declare-fun minValue!1387 () V!50579)

(declare-fun zeroValue!1387 () V!50579)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21980 0))(
  ( (tuple2!21981 (_1!11001 (_ BitVec 64)) (_2!11001 V!50579)) )
))
(declare-datatypes ((List!29158 0))(
  ( (Nil!29155) (Cons!29154 (h!30363 tuple2!21980) (t!42722 List!29158)) )
))
(declare-datatypes ((ListLongMap!19637 0))(
  ( (ListLongMap!19638 (toList!9834 List!29158)) )
))
(declare-fun contains!7952 (ListLongMap!19637 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4905 (array!85266 array!85264 (_ BitVec 32) (_ BitVec 32) V!50579 V!50579 (_ BitVec 32) Int) ListLongMap!19637)

(assert (=> b!1287732 (= res!855247 (contains!7952 (getCurrentListMap!4905 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1287733 () Bool)

(declare-fun e!735382 () Bool)

(assert (=> b!1287733 (= e!735382 (and e!735381 mapRes!52721))))

(declare-fun condMapEmpty!52721 () Bool)

(declare-fun mapDefault!52721 () ValueCell!16155)

(assert (=> b!1287733 (= condMapEmpty!52721 (= (arr!41133 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16155)) mapDefault!52721)))))

(declare-fun b!1287734 () Bool)

(declare-fun res!855251 () Bool)

(assert (=> b!1287734 (=> (not res!855251) (not e!735380))))

(assert (=> b!1287734 (= res!855251 (and (= (size!41683 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41684 _keys!1741) (size!41683 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287736 () Bool)

(declare-fun res!855249 () Bool)

(assert (=> b!1287736 (=> (not res!855249) (not e!735380))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287736 (= res!855249 (not (validKeyInArray!0 (select (arr!41134 _keys!1741) from!2144))))))

(declare-fun b!1287737 () Bool)

(declare-fun res!855252 () Bool)

(assert (=> b!1287737 (=> (not res!855252) (not e!735380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85266 (_ BitVec 32)) Bool)

(assert (=> b!1287737 (= res!855252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287738 () Bool)

(declare-fun res!855248 () Bool)

(assert (=> b!1287738 (=> (not res!855248) (not e!735380))))

(declare-datatypes ((List!29159 0))(
  ( (Nil!29156) (Cons!29155 (h!30364 (_ BitVec 64)) (t!42723 List!29159)) )
))
(declare-fun arrayNoDuplicates!0 (array!85266 (_ BitVec 32) List!29159) Bool)

(assert (=> b!1287738 (= res!855248 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29156))))

(declare-fun b!1287739 () Bool)

(declare-fun res!855246 () Bool)

(assert (=> b!1287739 (=> (not res!855246) (not e!735380))))

(assert (=> b!1287739 (= res!855246 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41684 _keys!1741))))))

(declare-fun res!855245 () Bool)

(assert (=> start!108978 (=> (not res!855245) (not e!735380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108978 (= res!855245 (validMask!0 mask!2175))))

(assert (=> start!108978 e!735380))

(assert (=> start!108978 tp_is_empty!34107))

(assert (=> start!108978 true))

(declare-fun array_inv!31193 (array!85264) Bool)

(assert (=> start!108978 (and (array_inv!31193 _values!1445) e!735382)))

(declare-fun array_inv!31194 (array!85266) Bool)

(assert (=> start!108978 (array_inv!31194 _keys!1741)))

(assert (=> start!108978 tp!100520))

(declare-fun b!1287735 () Bool)

(assert (=> b!1287735 (= e!735380 (not true))))

(assert (=> b!1287735 (not (contains!7952 (ListLongMap!19638 Nil!29155) k0!1205))))

(declare-datatypes ((Unit!42588 0))(
  ( (Unit!42589) )
))
(declare-fun lt!577892 () Unit!42588)

(declare-fun emptyContainsNothing!23 ((_ BitVec 64)) Unit!42588)

(assert (=> b!1287735 (= lt!577892 (emptyContainsNothing!23 k0!1205))))

(assert (= (and start!108978 res!855245) b!1287734))

(assert (= (and b!1287734 res!855251) b!1287737))

(assert (= (and b!1287737 res!855252) b!1287738))

(assert (= (and b!1287738 res!855248) b!1287739))

(assert (= (and b!1287739 res!855246) b!1287732))

(assert (= (and b!1287732 res!855247) b!1287730))

(assert (= (and b!1287730 res!855250) b!1287736))

(assert (= (and b!1287736 res!855249) b!1287735))

(assert (= (and b!1287733 condMapEmpty!52721) mapIsEmpty!52721))

(assert (= (and b!1287733 (not condMapEmpty!52721)) mapNonEmpty!52721))

(get-info :version)

(assert (= (and mapNonEmpty!52721 ((_ is ValueCellFull!16155) mapValue!52721)) b!1287731))

(assert (= (and b!1287733 ((_ is ValueCellFull!16155) mapDefault!52721)) b!1287729))

(assert (= start!108978 b!1287733))

(declare-fun m!1180511 () Bool)

(assert (=> b!1287737 m!1180511))

(declare-fun m!1180513 () Bool)

(assert (=> b!1287735 m!1180513))

(declare-fun m!1180515 () Bool)

(assert (=> b!1287735 m!1180515))

(declare-fun m!1180517 () Bool)

(assert (=> b!1287732 m!1180517))

(assert (=> b!1287732 m!1180517))

(declare-fun m!1180519 () Bool)

(assert (=> b!1287732 m!1180519))

(declare-fun m!1180521 () Bool)

(assert (=> b!1287738 m!1180521))

(declare-fun m!1180523 () Bool)

(assert (=> start!108978 m!1180523))

(declare-fun m!1180525 () Bool)

(assert (=> start!108978 m!1180525))

(declare-fun m!1180527 () Bool)

(assert (=> start!108978 m!1180527))

(declare-fun m!1180529 () Bool)

(assert (=> mapNonEmpty!52721 m!1180529))

(declare-fun m!1180531 () Bool)

(assert (=> b!1287736 m!1180531))

(assert (=> b!1287736 m!1180531))

(declare-fun m!1180533 () Bool)

(assert (=> b!1287736 m!1180533))

(check-sat (not mapNonEmpty!52721) (not b!1287738) (not b!1287732) (not b!1287736) (not b_next!28467) b_and!46557 (not b!1287737) (not start!108978) (not b!1287735) tp_is_empty!34107)
(check-sat b_and!46557 (not b_next!28467))
