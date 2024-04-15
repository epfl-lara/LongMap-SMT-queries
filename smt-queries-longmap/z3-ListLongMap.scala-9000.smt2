; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108760 () Bool)

(assert start!108760)

(declare-fun b_free!28273 () Bool)

(declare-fun b_next!28273 () Bool)

(assert (=> start!108760 (= b_free!28273 (not b_next!28273))))

(declare-fun tp!99936 () Bool)

(declare-fun b_and!46321 () Bool)

(assert (=> start!108760 (= tp!99936 b_and!46321)))

(declare-fun b!1284244 () Bool)

(declare-fun e!733580 () Bool)

(assert (=> b!1284244 (= e!733580 false)))

(declare-datatypes ((V!50321 0))(
  ( (V!50322 (val!17031 Int)) )
))
(declare-fun minValue!1387 () V!50321)

(declare-fun zeroValue!1387 () V!50321)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576618 () Bool)

(declare-datatypes ((ValueCell!16058 0))(
  ( (ValueCellFull!16058 (v!19632 V!50321)) (EmptyCell!16058) )
))
(declare-datatypes ((array!84781 0))(
  ( (array!84782 (arr!40893 (Array (_ BitVec 32) ValueCell!16058)) (size!41445 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84781)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84783 0))(
  ( (array!84784 (arr!40894 (Array (_ BitVec 32) (_ BitVec 64))) (size!41446 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84783)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21888 0))(
  ( (tuple2!21889 (_1!10955 (_ BitVec 64)) (_2!10955 V!50321)) )
))
(declare-datatypes ((List!29070 0))(
  ( (Nil!29067) (Cons!29066 (h!30275 tuple2!21888) (t!42606 List!29070)) )
))
(declare-datatypes ((ListLongMap!19545 0))(
  ( (ListLongMap!19546 (toList!9788 List!29070)) )
))
(declare-fun contains!7835 (ListLongMap!19545 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4758 (array!84783 array!84781 (_ BitVec 32) (_ BitVec 32) V!50321 V!50321 (_ BitVec 32) Int) ListLongMap!19545)

(assert (=> b!1284244 (= lt!576618 (contains!7835 (getCurrentListMap!4758 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284245 () Bool)

(declare-fun res!853161 () Bool)

(assert (=> b!1284245 (=> (not res!853161) (not e!733580))))

(assert (=> b!1284245 (= res!853161 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41446 _keys!1741))))))

(declare-fun b!1284246 () Bool)

(declare-fun e!733579 () Bool)

(declare-fun e!733578 () Bool)

(declare-fun mapRes!52427 () Bool)

(assert (=> b!1284246 (= e!733579 (and e!733578 mapRes!52427))))

(declare-fun condMapEmpty!52427 () Bool)

(declare-fun mapDefault!52427 () ValueCell!16058)

(assert (=> b!1284246 (= condMapEmpty!52427 (= (arr!40893 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16058)) mapDefault!52427)))))

(declare-fun res!853164 () Bool)

(assert (=> start!108760 (=> (not res!853164) (not e!733580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108760 (= res!853164 (validMask!0 mask!2175))))

(assert (=> start!108760 e!733580))

(declare-fun tp_is_empty!33913 () Bool)

(assert (=> start!108760 tp_is_empty!33913))

(assert (=> start!108760 true))

(declare-fun array_inv!31177 (array!84781) Bool)

(assert (=> start!108760 (and (array_inv!31177 _values!1445) e!733579)))

(declare-fun array_inv!31178 (array!84783) Bool)

(assert (=> start!108760 (array_inv!31178 _keys!1741)))

(assert (=> start!108760 tp!99936))

(declare-fun b!1284247 () Bool)

(assert (=> b!1284247 (= e!733578 tp_is_empty!33913)))

(declare-fun b!1284248 () Bool)

(declare-fun res!853162 () Bool)

(assert (=> b!1284248 (=> (not res!853162) (not e!733580))))

(assert (=> b!1284248 (= res!853162 (and (= (size!41445 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41446 _keys!1741) (size!41445 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284249 () Bool)

(declare-fun e!733577 () Bool)

(assert (=> b!1284249 (= e!733577 tp_is_empty!33913)))

(declare-fun mapIsEmpty!52427 () Bool)

(assert (=> mapIsEmpty!52427 mapRes!52427))

(declare-fun mapNonEmpty!52427 () Bool)

(declare-fun tp!99935 () Bool)

(assert (=> mapNonEmpty!52427 (= mapRes!52427 (and tp!99935 e!733577))))

(declare-fun mapRest!52427 () (Array (_ BitVec 32) ValueCell!16058))

(declare-fun mapKey!52427 () (_ BitVec 32))

(declare-fun mapValue!52427 () ValueCell!16058)

(assert (=> mapNonEmpty!52427 (= (arr!40893 _values!1445) (store mapRest!52427 mapKey!52427 mapValue!52427))))

(declare-fun b!1284250 () Bool)

(declare-fun res!853163 () Bool)

(assert (=> b!1284250 (=> (not res!853163) (not e!733580))))

(declare-datatypes ((List!29071 0))(
  ( (Nil!29068) (Cons!29067 (h!30276 (_ BitVec 64)) (t!42607 List!29071)) )
))
(declare-fun arrayNoDuplicates!0 (array!84783 (_ BitVec 32) List!29071) Bool)

(assert (=> b!1284250 (= res!853163 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29068))))

(declare-fun b!1284251 () Bool)

(declare-fun res!853160 () Bool)

(assert (=> b!1284251 (=> (not res!853160) (not e!733580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84783 (_ BitVec 32)) Bool)

(assert (=> b!1284251 (= res!853160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108760 res!853164) b!1284248))

(assert (= (and b!1284248 res!853162) b!1284251))

(assert (= (and b!1284251 res!853160) b!1284250))

(assert (= (and b!1284250 res!853163) b!1284245))

(assert (= (and b!1284245 res!853161) b!1284244))

(assert (= (and b!1284246 condMapEmpty!52427) mapIsEmpty!52427))

(assert (= (and b!1284246 (not condMapEmpty!52427)) mapNonEmpty!52427))

(get-info :version)

(assert (= (and mapNonEmpty!52427 ((_ is ValueCellFull!16058) mapValue!52427)) b!1284249))

(assert (= (and b!1284246 ((_ is ValueCellFull!16058) mapDefault!52427)) b!1284247))

(assert (= start!108760 b!1284246))

(declare-fun m!1177537 () Bool)

(assert (=> b!1284251 m!1177537))

(declare-fun m!1177539 () Bool)

(assert (=> b!1284244 m!1177539))

(assert (=> b!1284244 m!1177539))

(declare-fun m!1177541 () Bool)

(assert (=> b!1284244 m!1177541))

(declare-fun m!1177543 () Bool)

(assert (=> b!1284250 m!1177543))

(declare-fun m!1177545 () Bool)

(assert (=> start!108760 m!1177545))

(declare-fun m!1177547 () Bool)

(assert (=> start!108760 m!1177547))

(declare-fun m!1177549 () Bool)

(assert (=> start!108760 m!1177549))

(declare-fun m!1177551 () Bool)

(assert (=> mapNonEmpty!52427 m!1177551))

(check-sat (not mapNonEmpty!52427) (not start!108760) tp_is_empty!33913 (not b!1284250) (not b!1284251) (not b!1284244) (not b_next!28273) b_and!46321)
(check-sat b_and!46321 (not b_next!28273))
