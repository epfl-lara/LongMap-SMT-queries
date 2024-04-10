; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108732 () Bool)

(assert start!108732)

(declare-fun b_free!28245 () Bool)

(declare-fun b_next!28245 () Bool)

(assert (=> start!108732 (= b_free!28245 (not b_next!28245))))

(declare-fun tp!99851 () Bool)

(declare-fun b_and!46311 () Bool)

(assert (=> start!108732 (= tp!99851 b_and!46311)))

(declare-fun b!1283848 () Bool)

(declare-fun res!852855 () Bool)

(declare-fun e!733398 () Bool)

(assert (=> b!1283848 (=> (not res!852855) (not e!733398))))

(declare-datatypes ((array!84830 0))(
  ( (array!84831 (arr!40917 (Array (_ BitVec 32) (_ BitVec 64))) (size!41467 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84830)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84830 (_ BitVec 32)) Bool)

(assert (=> b!1283848 (= res!852855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283849 () Bool)

(declare-fun e!733400 () Bool)

(declare-fun tp_is_empty!33885 () Bool)

(assert (=> b!1283849 (= e!733400 tp_is_empty!33885)))

(declare-fun b!1283850 () Bool)

(declare-fun res!852859 () Bool)

(assert (=> b!1283850 (=> (not res!852859) (not e!733398))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1283850 (= res!852859 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41467 _keys!1741))))))

(declare-fun b!1283851 () Bool)

(declare-fun res!852857 () Bool)

(assert (=> b!1283851 (=> (not res!852857) (not e!733398))))

(declare-datatypes ((V!50283 0))(
  ( (V!50284 (val!17017 Int)) )
))
(declare-datatypes ((ValueCell!16044 0))(
  ( (ValueCellFull!16044 (v!19619 V!50283)) (EmptyCell!16044) )
))
(declare-datatypes ((array!84832 0))(
  ( (array!84833 (arr!40918 (Array (_ BitVec 32) ValueCell!16044)) (size!41468 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84832)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283851 (= res!852857 (and (= (size!41468 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41467 _keys!1741) (size!41468 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52385 () Bool)

(declare-fun mapRes!52385 () Bool)

(assert (=> mapIsEmpty!52385 mapRes!52385))

(declare-fun res!852853 () Bool)

(assert (=> start!108732 (=> (not res!852853) (not e!733398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108732 (= res!852853 (validMask!0 mask!2175))))

(assert (=> start!108732 e!733398))

(assert (=> start!108732 tp_is_empty!33885))

(assert (=> start!108732 true))

(declare-fun e!733399 () Bool)

(declare-fun array_inv!31035 (array!84832) Bool)

(assert (=> start!108732 (and (array_inv!31035 _values!1445) e!733399)))

(declare-fun array_inv!31036 (array!84830) Bool)

(assert (=> start!108732 (array_inv!31036 _keys!1741)))

(assert (=> start!108732 tp!99851))

(declare-fun b!1283852 () Bool)

(declare-fun res!852856 () Bool)

(assert (=> b!1283852 (=> (not res!852856) (not e!733398))))

(declare-datatypes ((List!28990 0))(
  ( (Nil!28987) (Cons!28986 (h!30195 (_ BitVec 64)) (t!42534 List!28990)) )
))
(declare-fun arrayNoDuplicates!0 (array!84830 (_ BitVec 32) List!28990) Bool)

(assert (=> b!1283852 (= res!852856 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28987))))

(declare-fun b!1283853 () Bool)

(assert (=> b!1283853 (= e!733398 (not true))))

(declare-datatypes ((tuple2!21794 0))(
  ( (tuple2!21795 (_1!10908 (_ BitVec 64)) (_2!10908 V!50283)) )
))
(declare-datatypes ((List!28991 0))(
  ( (Nil!28988) (Cons!28987 (h!30196 tuple2!21794) (t!42535 List!28991)) )
))
(declare-datatypes ((ListLongMap!19451 0))(
  ( (ListLongMap!19452 (toList!9741 List!28991)) )
))
(declare-fun lt!576724 () ListLongMap!19451)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7858 (ListLongMap!19451 (_ BitVec 64)) Bool)

(assert (=> b!1283853 (contains!7858 lt!576724 k0!1205)))

(declare-fun minValue!1387 () V!50283)

(declare-datatypes ((Unit!42489 0))(
  ( (Unit!42490) )
))
(declare-fun lt!576723 () Unit!42489)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!15 ((_ BitVec 64) (_ BitVec 64) V!50283 ListLongMap!19451) Unit!42489)

(assert (=> b!1283853 (= lt!576723 (lemmaInListMapAfterAddingDiffThenInBefore!15 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576724))))

(declare-fun zeroValue!1387 () V!50283)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4291 (ListLongMap!19451 tuple2!21794) ListLongMap!19451)

(declare-fun getCurrentListMapNoExtraKeys!5921 (array!84830 array!84832 (_ BitVec 32) (_ BitVec 32) V!50283 V!50283 (_ BitVec 32) Int) ListLongMap!19451)

(assert (=> b!1283853 (= lt!576724 (+!4291 (getCurrentListMapNoExtraKeys!5921 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21795 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283854 () Bool)

(declare-fun res!852854 () Bool)

(assert (=> b!1283854 (=> (not res!852854) (not e!733398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283854 (= res!852854 (validKeyInArray!0 (select (arr!40917 _keys!1741) from!2144)))))

(declare-fun b!1283855 () Bool)

(declare-fun res!852861 () Bool)

(assert (=> b!1283855 (=> (not res!852861) (not e!733398))))

(declare-fun getCurrentListMap!4821 (array!84830 array!84832 (_ BitVec 32) (_ BitVec 32) V!50283 V!50283 (_ BitVec 32) Int) ListLongMap!19451)

(assert (=> b!1283855 (= res!852861 (contains!7858 (getCurrentListMap!4821 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52385 () Bool)

(declare-fun tp!99850 () Bool)

(assert (=> mapNonEmpty!52385 (= mapRes!52385 (and tp!99850 e!733400))))

(declare-fun mapKey!52385 () (_ BitVec 32))

(declare-fun mapValue!52385 () ValueCell!16044)

(declare-fun mapRest!52385 () (Array (_ BitVec 32) ValueCell!16044))

(assert (=> mapNonEmpty!52385 (= (arr!40918 _values!1445) (store mapRest!52385 mapKey!52385 mapValue!52385))))

(declare-fun b!1283856 () Bool)

(declare-fun e!733396 () Bool)

(assert (=> b!1283856 (= e!733396 tp_is_empty!33885)))

(declare-fun b!1283857 () Bool)

(assert (=> b!1283857 (= e!733399 (and e!733396 mapRes!52385))))

(declare-fun condMapEmpty!52385 () Bool)

(declare-fun mapDefault!52385 () ValueCell!16044)

(assert (=> b!1283857 (= condMapEmpty!52385 (= (arr!40918 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16044)) mapDefault!52385)))))

(declare-fun b!1283858 () Bool)

(declare-fun res!852858 () Bool)

(assert (=> b!1283858 (=> (not res!852858) (not e!733398))))

(assert (=> b!1283858 (= res!852858 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283859 () Bool)

(declare-fun res!852860 () Bool)

(assert (=> b!1283859 (=> (not res!852860) (not e!733398))))

(assert (=> b!1283859 (= res!852860 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41467 _keys!1741))))))

(assert (= (and start!108732 res!852853) b!1283851))

(assert (= (and b!1283851 res!852857) b!1283848))

(assert (= (and b!1283848 res!852855) b!1283852))

(assert (= (and b!1283852 res!852856) b!1283850))

(assert (= (and b!1283850 res!852859) b!1283855))

(assert (= (and b!1283855 res!852861) b!1283859))

(assert (= (and b!1283859 res!852860) b!1283854))

(assert (= (and b!1283854 res!852854) b!1283858))

(assert (= (and b!1283858 res!852858) b!1283853))

(assert (= (and b!1283857 condMapEmpty!52385) mapIsEmpty!52385))

(assert (= (and b!1283857 (not condMapEmpty!52385)) mapNonEmpty!52385))

(get-info :version)

(assert (= (and mapNonEmpty!52385 ((_ is ValueCellFull!16044) mapValue!52385)) b!1283849))

(assert (= (and b!1283857 ((_ is ValueCellFull!16044) mapDefault!52385)) b!1283856))

(assert (= start!108732 b!1283857))

(declare-fun m!1177681 () Bool)

(assert (=> start!108732 m!1177681))

(declare-fun m!1177683 () Bool)

(assert (=> start!108732 m!1177683))

(declare-fun m!1177685 () Bool)

(assert (=> start!108732 m!1177685))

(declare-fun m!1177687 () Bool)

(assert (=> b!1283854 m!1177687))

(assert (=> b!1283854 m!1177687))

(declare-fun m!1177689 () Bool)

(assert (=> b!1283854 m!1177689))

(declare-fun m!1177691 () Bool)

(assert (=> b!1283855 m!1177691))

(assert (=> b!1283855 m!1177691))

(declare-fun m!1177693 () Bool)

(assert (=> b!1283855 m!1177693))

(declare-fun m!1177695 () Bool)

(assert (=> mapNonEmpty!52385 m!1177695))

(declare-fun m!1177697 () Bool)

(assert (=> b!1283852 m!1177697))

(declare-fun m!1177699 () Bool)

(assert (=> b!1283853 m!1177699))

(declare-fun m!1177701 () Bool)

(assert (=> b!1283853 m!1177701))

(declare-fun m!1177703 () Bool)

(assert (=> b!1283853 m!1177703))

(assert (=> b!1283853 m!1177703))

(declare-fun m!1177705 () Bool)

(assert (=> b!1283853 m!1177705))

(declare-fun m!1177707 () Bool)

(assert (=> b!1283848 m!1177707))

(check-sat (not b_next!28245) (not b!1283848) (not start!108732) (not b!1283853) (not b!1283855) b_and!46311 (not b!1283852) tp_is_empty!33885 (not b!1283854) (not mapNonEmpty!52385))
(check-sat b_and!46311 (not b_next!28245))
