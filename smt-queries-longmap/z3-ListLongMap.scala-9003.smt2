; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109002 () Bool)

(assert start!109002)

(declare-fun b_free!28291 () Bool)

(declare-fun b_next!28291 () Bool)

(assert (=> start!109002 (= b_free!28291 (not b_next!28291))))

(declare-fun tp!99989 () Bool)

(declare-fun b_and!46359 () Bool)

(assert (=> start!109002 (= tp!99989 b_and!46359)))

(declare-fun b!1285829 () Bool)

(declare-fun e!734591 () Bool)

(declare-fun tp_is_empty!33931 () Bool)

(assert (=> b!1285829 (= e!734591 tp_is_empty!33931)))

(declare-fun b!1285830 () Bool)

(declare-fun e!734592 () Bool)

(assert (=> b!1285830 (= e!734592 false)))

(declare-datatypes ((V!50345 0))(
  ( (V!50346 (val!17040 Int)) )
))
(declare-fun minValue!1387 () V!50345)

(declare-fun zeroValue!1387 () V!50345)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577307 () Bool)

(declare-datatypes ((ValueCell!16067 0))(
  ( (ValueCellFull!16067 (v!19637 V!50345)) (EmptyCell!16067) )
))
(declare-datatypes ((array!84949 0))(
  ( (array!84950 (arr!40972 (Array (_ BitVec 32) ValueCell!16067)) (size!41523 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84949)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84951 0))(
  ( (array!84952 (arr!40973 (Array (_ BitVec 32) (_ BitVec 64))) (size!41524 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84951)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21856 0))(
  ( (tuple2!21857 (_1!10939 (_ BitVec 64)) (_2!10939 V!50345)) )
))
(declare-datatypes ((List!29060 0))(
  ( (Nil!29057) (Cons!29056 (h!30274 tuple2!21856) (t!42596 List!29060)) )
))
(declare-datatypes ((ListLongMap!19521 0))(
  ( (ListLongMap!19522 (toList!9776 List!29060)) )
))
(declare-fun contains!7907 (ListLongMap!19521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4840 (array!84951 array!84949 (_ BitVec 32) (_ BitVec 32) V!50345 V!50345 (_ BitVec 32) Int) ListLongMap!19521)

(assert (=> b!1285830 (= lt!577307 (contains!7907 (getCurrentListMap!4840 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285831 () Bool)

(declare-fun e!734589 () Bool)

(assert (=> b!1285831 (= e!734589 tp_is_empty!33931)))

(declare-fun b!1285832 () Bool)

(declare-fun res!853844 () Bool)

(assert (=> b!1285832 (=> (not res!853844) (not e!734592))))

(declare-datatypes ((List!29061 0))(
  ( (Nil!29058) (Cons!29057 (h!30275 (_ BitVec 64)) (t!42597 List!29061)) )
))
(declare-fun arrayNoDuplicates!0 (array!84951 (_ BitVec 32) List!29061) Bool)

(assert (=> b!1285832 (= res!853844 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29058))))

(declare-fun res!853843 () Bool)

(assert (=> start!109002 (=> (not res!853843) (not e!734592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109002 (= res!853843 (validMask!0 mask!2175))))

(assert (=> start!109002 e!734592))

(assert (=> start!109002 tp_is_empty!33931))

(assert (=> start!109002 true))

(declare-fun e!734590 () Bool)

(declare-fun array_inv!31291 (array!84949) Bool)

(assert (=> start!109002 (and (array_inv!31291 _values!1445) e!734590)))

(declare-fun array_inv!31292 (array!84951) Bool)

(assert (=> start!109002 (array_inv!31292 _keys!1741)))

(assert (=> start!109002 tp!99989))

(declare-fun b!1285833 () Bool)

(declare-fun res!853845 () Bool)

(assert (=> b!1285833 (=> (not res!853845) (not e!734592))))

(assert (=> b!1285833 (= res!853845 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41524 _keys!1741))))))

(declare-fun mapNonEmpty!52454 () Bool)

(declare-fun mapRes!52454 () Bool)

(declare-fun tp!99988 () Bool)

(assert (=> mapNonEmpty!52454 (= mapRes!52454 (and tp!99988 e!734589))))

(declare-fun mapKey!52454 () (_ BitVec 32))

(declare-fun mapValue!52454 () ValueCell!16067)

(declare-fun mapRest!52454 () (Array (_ BitVec 32) ValueCell!16067))

(assert (=> mapNonEmpty!52454 (= (arr!40972 _values!1445) (store mapRest!52454 mapKey!52454 mapValue!52454))))

(declare-fun mapIsEmpty!52454 () Bool)

(assert (=> mapIsEmpty!52454 mapRes!52454))

(declare-fun b!1285834 () Bool)

(declare-fun res!853842 () Bool)

(assert (=> b!1285834 (=> (not res!853842) (not e!734592))))

(assert (=> b!1285834 (= res!853842 (and (= (size!41523 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41524 _keys!1741) (size!41523 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285835 () Bool)

(assert (=> b!1285835 (= e!734590 (and e!734591 mapRes!52454))))

(declare-fun condMapEmpty!52454 () Bool)

(declare-fun mapDefault!52454 () ValueCell!16067)

(assert (=> b!1285835 (= condMapEmpty!52454 (= (arr!40972 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16067)) mapDefault!52454)))))

(declare-fun b!1285836 () Bool)

(declare-fun res!853846 () Bool)

(assert (=> b!1285836 (=> (not res!853846) (not e!734592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84951 (_ BitVec 32)) Bool)

(assert (=> b!1285836 (= res!853846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!109002 res!853843) b!1285834))

(assert (= (and b!1285834 res!853842) b!1285836))

(assert (= (and b!1285836 res!853846) b!1285832))

(assert (= (and b!1285832 res!853844) b!1285833))

(assert (= (and b!1285833 res!853845) b!1285830))

(assert (= (and b!1285835 condMapEmpty!52454) mapIsEmpty!52454))

(assert (= (and b!1285835 (not condMapEmpty!52454)) mapNonEmpty!52454))

(get-info :version)

(assert (= (and mapNonEmpty!52454 ((_ is ValueCellFull!16067) mapValue!52454)) b!1285831))

(assert (= (and b!1285835 ((_ is ValueCellFull!16067) mapDefault!52454)) b!1285829))

(assert (= start!109002 b!1285835))

(declare-fun m!1179793 () Bool)

(assert (=> b!1285836 m!1179793))

(declare-fun m!1179795 () Bool)

(assert (=> b!1285832 m!1179795))

(declare-fun m!1179797 () Bool)

(assert (=> mapNonEmpty!52454 m!1179797))

(declare-fun m!1179799 () Bool)

(assert (=> start!109002 m!1179799))

(declare-fun m!1179801 () Bool)

(assert (=> start!109002 m!1179801))

(declare-fun m!1179803 () Bool)

(assert (=> start!109002 m!1179803))

(declare-fun m!1179805 () Bool)

(assert (=> b!1285830 m!1179805))

(assert (=> b!1285830 m!1179805))

(declare-fun m!1179807 () Bool)

(assert (=> b!1285830 m!1179807))

(check-sat (not start!109002) (not mapNonEmpty!52454) (not b!1285830) b_and!46359 tp_is_empty!33931 (not b!1285836) (not b_next!28291) (not b!1285832))
(check-sat b_and!46359 (not b_next!28291))
