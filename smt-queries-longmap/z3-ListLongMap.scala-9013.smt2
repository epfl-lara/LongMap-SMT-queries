; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108840 () Bool)

(assert start!108840)

(declare-fun b_free!28353 () Bool)

(declare-fun b_next!28353 () Bool)

(assert (=> start!108840 (= b_free!28353 (not b_next!28353))))

(declare-fun tp!100175 () Bool)

(declare-fun b_and!46419 () Bool)

(assert (=> start!108840 (= tp!100175 b_and!46419)))

(declare-fun mapIsEmpty!52547 () Bool)

(declare-fun mapRes!52547 () Bool)

(assert (=> mapIsEmpty!52547 mapRes!52547))

(declare-fun b!1285367 () Bool)

(declare-fun e!734210 () Bool)

(declare-fun e!734206 () Bool)

(assert (=> b!1285367 (= e!734210 (and e!734206 mapRes!52547))))

(declare-fun condMapEmpty!52547 () Bool)

(declare-datatypes ((V!50427 0))(
  ( (V!50428 (val!17071 Int)) )
))
(declare-datatypes ((ValueCell!16098 0))(
  ( (ValueCellFull!16098 (v!19673 V!50427)) (EmptyCell!16098) )
))
(declare-datatypes ((array!85044 0))(
  ( (array!85045 (arr!41024 (Array (_ BitVec 32) ValueCell!16098)) (size!41574 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85044)

(declare-fun mapDefault!52547 () ValueCell!16098)

(assert (=> b!1285367 (= condMapEmpty!52547 (= (arr!41024 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16098)) mapDefault!52547)))))

(declare-fun b!1285368 () Bool)

(declare-fun e!734208 () Bool)

(assert (=> b!1285368 (= e!734208 false)))

(declare-fun minValue!1387 () V!50427)

(declare-fun zeroValue!1387 () V!50427)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576907 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85046 0))(
  ( (array!85047 (arr!41025 (Array (_ BitVec 32) (_ BitVec 64))) (size!41575 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85046)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21884 0))(
  ( (tuple2!21885 (_1!10953 (_ BitVec 64)) (_2!10953 V!50427)) )
))
(declare-datatypes ((List!29074 0))(
  ( (Nil!29071) (Cons!29070 (h!30279 tuple2!21884) (t!42618 List!29074)) )
))
(declare-datatypes ((ListLongMap!19541 0))(
  ( (ListLongMap!19542 (toList!9786 List!29074)) )
))
(declare-fun contains!7903 (ListLongMap!19541 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4864 (array!85046 array!85044 (_ BitVec 32) (_ BitVec 32) V!50427 V!50427 (_ BitVec 32) Int) ListLongMap!19541)

(assert (=> b!1285368 (= lt!576907 (contains!7903 (getCurrentListMap!4864 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52547 () Bool)

(declare-fun tp!100174 () Bool)

(declare-fun e!734207 () Bool)

(assert (=> mapNonEmpty!52547 (= mapRes!52547 (and tp!100174 e!734207))))

(declare-fun mapRest!52547 () (Array (_ BitVec 32) ValueCell!16098))

(declare-fun mapKey!52547 () (_ BitVec 32))

(declare-fun mapValue!52547 () ValueCell!16098)

(assert (=> mapNonEmpty!52547 (= (arr!41024 _values!1445) (store mapRest!52547 mapKey!52547 mapValue!52547))))

(declare-fun b!1285369 () Bool)

(declare-fun tp_is_empty!33993 () Bool)

(assert (=> b!1285369 (= e!734207 tp_is_empty!33993)))

(declare-fun b!1285370 () Bool)

(assert (=> b!1285370 (= e!734206 tp_is_empty!33993)))

(declare-fun b!1285372 () Bool)

(declare-fun res!853887 () Bool)

(assert (=> b!1285372 (=> (not res!853887) (not e!734208))))

(declare-datatypes ((List!29075 0))(
  ( (Nil!29072) (Cons!29071 (h!30280 (_ BitVec 64)) (t!42619 List!29075)) )
))
(declare-fun arrayNoDuplicates!0 (array!85046 (_ BitVec 32) List!29075) Bool)

(assert (=> b!1285372 (= res!853887 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29072))))

(declare-fun b!1285373 () Bool)

(declare-fun res!853889 () Bool)

(assert (=> b!1285373 (=> (not res!853889) (not e!734208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85046 (_ BitVec 32)) Bool)

(assert (=> b!1285373 (= res!853889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285374 () Bool)

(declare-fun res!853888 () Bool)

(assert (=> b!1285374 (=> (not res!853888) (not e!734208))))

(assert (=> b!1285374 (= res!853888 (and (= (size!41574 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41575 _keys!1741) (size!41574 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!853890 () Bool)

(assert (=> start!108840 (=> (not res!853890) (not e!734208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108840 (= res!853890 (validMask!0 mask!2175))))

(assert (=> start!108840 e!734208))

(assert (=> start!108840 tp_is_empty!33993))

(assert (=> start!108840 true))

(declare-fun array_inv!31113 (array!85044) Bool)

(assert (=> start!108840 (and (array_inv!31113 _values!1445) e!734210)))

(declare-fun array_inv!31114 (array!85046) Bool)

(assert (=> start!108840 (array_inv!31114 _keys!1741)))

(assert (=> start!108840 tp!100175))

(declare-fun b!1285371 () Bool)

(declare-fun res!853886 () Bool)

(assert (=> b!1285371 (=> (not res!853886) (not e!734208))))

(assert (=> b!1285371 (= res!853886 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41575 _keys!1741))))))

(assert (= (and start!108840 res!853890) b!1285374))

(assert (= (and b!1285374 res!853888) b!1285373))

(assert (= (and b!1285373 res!853889) b!1285372))

(assert (= (and b!1285372 res!853887) b!1285371))

(assert (= (and b!1285371 res!853886) b!1285368))

(assert (= (and b!1285367 condMapEmpty!52547) mapIsEmpty!52547))

(assert (= (and b!1285367 (not condMapEmpty!52547)) mapNonEmpty!52547))

(get-info :version)

(assert (= (and mapNonEmpty!52547 ((_ is ValueCellFull!16098) mapValue!52547)) b!1285369))

(assert (= (and b!1285367 ((_ is ValueCellFull!16098) mapDefault!52547)) b!1285370))

(assert (= start!108840 b!1285367))

(declare-fun m!1178749 () Bool)

(assert (=> b!1285373 m!1178749))

(declare-fun m!1178751 () Bool)

(assert (=> b!1285372 m!1178751))

(declare-fun m!1178753 () Bool)

(assert (=> start!108840 m!1178753))

(declare-fun m!1178755 () Bool)

(assert (=> start!108840 m!1178755))

(declare-fun m!1178757 () Bool)

(assert (=> start!108840 m!1178757))

(declare-fun m!1178759 () Bool)

(assert (=> mapNonEmpty!52547 m!1178759))

(declare-fun m!1178761 () Bool)

(assert (=> b!1285368 m!1178761))

(assert (=> b!1285368 m!1178761))

(declare-fun m!1178763 () Bool)

(assert (=> b!1285368 m!1178763))

(check-sat tp_is_empty!33993 (not b!1285372) (not b!1285368) (not start!108840) b_and!46419 (not mapNonEmpty!52547) (not b!1285373) (not b_next!28353))
(check-sat b_and!46419 (not b_next!28353))
