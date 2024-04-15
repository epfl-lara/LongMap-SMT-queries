; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108730 () Bool)

(assert start!108730)

(declare-fun b_free!28243 () Bool)

(declare-fun b_next!28243 () Bool)

(assert (=> start!108730 (= b_free!28243 (not b_next!28243))))

(declare-fun tp!99845 () Bool)

(declare-fun b_and!46291 () Bool)

(assert (=> start!108730 (= tp!99845 b_and!46291)))

(declare-fun b!1283748 () Bool)

(declare-fun e!733352 () Bool)

(assert (=> b!1283748 (= e!733352 (not true))))

(declare-datatypes ((V!50281 0))(
  ( (V!50282 (val!17016 Int)) )
))
(declare-datatypes ((tuple2!21868 0))(
  ( (tuple2!21869 (_1!10945 (_ BitVec 64)) (_2!10945 V!50281)) )
))
(declare-datatypes ((List!29053 0))(
  ( (Nil!29050) (Cons!29049 (h!30258 tuple2!21868) (t!42589 List!29053)) )
))
(declare-datatypes ((ListLongMap!19525 0))(
  ( (ListLongMap!19526 (toList!9778 List!29053)) )
))
(declare-fun lt!576539 () ListLongMap!19525)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun contains!7825 (ListLongMap!19525 (_ BitVec 64)) Bool)

(assert (=> b!1283748 (contains!7825 lt!576539 k0!1205)))

(declare-fun minValue!1387 () V!50281)

(declare-datatypes ((Unit!42339 0))(
  ( (Unit!42340) )
))
(declare-fun lt!576540 () Unit!42339)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!20 ((_ BitVec 64) (_ BitVec 64) V!50281 ListLongMap!19525) Unit!42339)

(assert (=> b!1283748 (= lt!576540 (lemmaInListMapAfterAddingDiffThenInBefore!20 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576539))))

(declare-fun zeroValue!1387 () V!50281)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16043 0))(
  ( (ValueCellFull!16043 (v!19617 V!50281)) (EmptyCell!16043) )
))
(declare-datatypes ((array!84727 0))(
  ( (array!84728 (arr!40866 (Array (_ BitVec 32) ValueCell!16043)) (size!41418 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84727)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84729 0))(
  ( (array!84730 (arr!40867 (Array (_ BitVec 32) (_ BitVec 64))) (size!41419 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84729)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4335 (ListLongMap!19525 tuple2!21868) ListLongMap!19525)

(declare-fun getCurrentListMapNoExtraKeys!5966 (array!84729 array!84727 (_ BitVec 32) (_ BitVec 32) V!50281 V!50281 (_ BitVec 32) Int) ListLongMap!19525)

(assert (=> b!1283748 (= lt!576539 (+!4335 (getCurrentListMapNoExtraKeys!5966 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21869 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283749 () Bool)

(declare-fun res!852806 () Bool)

(assert (=> b!1283749 (=> (not res!852806) (not e!733352))))

(assert (=> b!1283749 (= res!852806 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41419 _keys!1741))))))

(declare-fun b!1283750 () Bool)

(declare-fun res!852807 () Bool)

(assert (=> b!1283750 (=> (not res!852807) (not e!733352))))

(declare-fun getCurrentListMap!4749 (array!84729 array!84727 (_ BitVec 32) (_ BitVec 32) V!50281 V!50281 (_ BitVec 32) Int) ListLongMap!19525)

(assert (=> b!1283750 (= res!852807 (contains!7825 (getCurrentListMap!4749 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283751 () Bool)

(declare-fun res!852802 () Bool)

(assert (=> b!1283751 (=> (not res!852802) (not e!733352))))

(assert (=> b!1283751 (= res!852802 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41419 _keys!1741))))))

(declare-fun b!1283752 () Bool)

(declare-fun e!733355 () Bool)

(declare-fun tp_is_empty!33883 () Bool)

(assert (=> b!1283752 (= e!733355 tp_is_empty!33883)))

(declare-fun b!1283753 () Bool)

(declare-fun res!852800 () Bool)

(assert (=> b!1283753 (=> (not res!852800) (not e!733352))))

(assert (=> b!1283753 (= res!852800 (and (= (size!41418 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41419 _keys!1741) (size!41418 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283754 () Bool)

(declare-fun res!852803 () Bool)

(assert (=> b!1283754 (=> (not res!852803) (not e!733352))))

(declare-datatypes ((List!29054 0))(
  ( (Nil!29051) (Cons!29050 (h!30259 (_ BitVec 64)) (t!42590 List!29054)) )
))
(declare-fun arrayNoDuplicates!0 (array!84729 (_ BitVec 32) List!29054) Bool)

(assert (=> b!1283754 (= res!852803 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29051))))

(declare-fun res!852804 () Bool)

(assert (=> start!108730 (=> (not res!852804) (not e!733352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108730 (= res!852804 (validMask!0 mask!2175))))

(assert (=> start!108730 e!733352))

(assert (=> start!108730 tp_is_empty!33883))

(assert (=> start!108730 true))

(declare-fun e!733356 () Bool)

(declare-fun array_inv!31159 (array!84727) Bool)

(assert (=> start!108730 (and (array_inv!31159 _values!1445) e!733356)))

(declare-fun array_inv!31160 (array!84729) Bool)

(assert (=> start!108730 (array_inv!31160 _keys!1741)))

(assert (=> start!108730 tp!99845))

(declare-fun mapNonEmpty!52382 () Bool)

(declare-fun mapRes!52382 () Bool)

(declare-fun tp!99846 () Bool)

(declare-fun e!733354 () Bool)

(assert (=> mapNonEmpty!52382 (= mapRes!52382 (and tp!99846 e!733354))))

(declare-fun mapRest!52382 () (Array (_ BitVec 32) ValueCell!16043))

(declare-fun mapKey!52382 () (_ BitVec 32))

(declare-fun mapValue!52382 () ValueCell!16043)

(assert (=> mapNonEmpty!52382 (= (arr!40866 _values!1445) (store mapRest!52382 mapKey!52382 mapValue!52382))))

(declare-fun mapIsEmpty!52382 () Bool)

(assert (=> mapIsEmpty!52382 mapRes!52382))

(declare-fun b!1283755 () Bool)

(declare-fun res!852799 () Bool)

(assert (=> b!1283755 (=> (not res!852799) (not e!733352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283755 (= res!852799 (validKeyInArray!0 (select (arr!40867 _keys!1741) from!2144)))))

(declare-fun b!1283756 () Bool)

(declare-fun res!852801 () Bool)

(assert (=> b!1283756 (=> (not res!852801) (not e!733352))))

(assert (=> b!1283756 (= res!852801 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283757 () Bool)

(assert (=> b!1283757 (= e!733356 (and e!733355 mapRes!52382))))

(declare-fun condMapEmpty!52382 () Bool)

(declare-fun mapDefault!52382 () ValueCell!16043)

(assert (=> b!1283757 (= condMapEmpty!52382 (= (arr!40866 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16043)) mapDefault!52382)))))

(declare-fun b!1283758 () Bool)

(declare-fun res!852805 () Bool)

(assert (=> b!1283758 (=> (not res!852805) (not e!733352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84729 (_ BitVec 32)) Bool)

(assert (=> b!1283758 (= res!852805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1283759 () Bool)

(assert (=> b!1283759 (= e!733354 tp_is_empty!33883)))

(assert (= (and start!108730 res!852804) b!1283753))

(assert (= (and b!1283753 res!852800) b!1283758))

(assert (= (and b!1283758 res!852805) b!1283754))

(assert (= (and b!1283754 res!852803) b!1283749))

(assert (= (and b!1283749 res!852806) b!1283750))

(assert (= (and b!1283750 res!852807) b!1283751))

(assert (= (and b!1283751 res!852802) b!1283755))

(assert (= (and b!1283755 res!852799) b!1283756))

(assert (= (and b!1283756 res!852801) b!1283748))

(assert (= (and b!1283757 condMapEmpty!52382) mapIsEmpty!52382))

(assert (= (and b!1283757 (not condMapEmpty!52382)) mapNonEmpty!52382))

(get-info :version)

(assert (= (and mapNonEmpty!52382 ((_ is ValueCellFull!16043) mapValue!52382)) b!1283759))

(assert (= (and b!1283757 ((_ is ValueCellFull!16043) mapDefault!52382)) b!1283752))

(assert (= start!108730 b!1283757))

(declare-fun m!1177153 () Bool)

(assert (=> b!1283755 m!1177153))

(assert (=> b!1283755 m!1177153))

(declare-fun m!1177155 () Bool)

(assert (=> b!1283755 m!1177155))

(declare-fun m!1177157 () Bool)

(assert (=> b!1283748 m!1177157))

(declare-fun m!1177159 () Bool)

(assert (=> b!1283748 m!1177159))

(declare-fun m!1177161 () Bool)

(assert (=> b!1283748 m!1177161))

(assert (=> b!1283748 m!1177161))

(declare-fun m!1177163 () Bool)

(assert (=> b!1283748 m!1177163))

(declare-fun m!1177165 () Bool)

(assert (=> b!1283750 m!1177165))

(assert (=> b!1283750 m!1177165))

(declare-fun m!1177167 () Bool)

(assert (=> b!1283750 m!1177167))

(declare-fun m!1177169 () Bool)

(assert (=> mapNonEmpty!52382 m!1177169))

(declare-fun m!1177171 () Bool)

(assert (=> b!1283754 m!1177171))

(declare-fun m!1177173 () Bool)

(assert (=> b!1283758 m!1177173))

(declare-fun m!1177175 () Bool)

(assert (=> start!108730 m!1177175))

(declare-fun m!1177177 () Bool)

(assert (=> start!108730 m!1177177))

(declare-fun m!1177179 () Bool)

(assert (=> start!108730 m!1177179))

(check-sat (not b!1283755) (not start!108730) b_and!46291 (not b!1283758) (not b!1283754) (not b_next!28243) (not b!1283750) tp_is_empty!33883 (not mapNonEmpty!52382) (not b!1283748))
(check-sat b_and!46291 (not b_next!28243))
