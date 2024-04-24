; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108990 () Bool)

(assert start!108990)

(declare-fun b_free!28279 () Bool)

(declare-fun b_next!28279 () Bool)

(assert (=> start!108990 (= b_free!28279 (not b_next!28279))))

(declare-fun tp!99953 () Bool)

(declare-fun b_and!46347 () Bool)

(assert (=> start!108990 (= tp!99953 b_and!46347)))

(declare-fun mapNonEmpty!52436 () Bool)

(declare-fun mapRes!52436 () Bool)

(declare-fun tp!99952 () Bool)

(declare-fun e!734498 () Bool)

(assert (=> mapNonEmpty!52436 (= mapRes!52436 (and tp!99952 e!734498))))

(declare-datatypes ((V!50329 0))(
  ( (V!50330 (val!17034 Int)) )
))
(declare-datatypes ((ValueCell!16061 0))(
  ( (ValueCellFull!16061 (v!19631 V!50329)) (EmptyCell!16061) )
))
(declare-datatypes ((array!84925 0))(
  ( (array!84926 (arr!40960 (Array (_ BitVec 32) ValueCell!16061)) (size!41511 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84925)

(declare-fun mapKey!52436 () (_ BitVec 32))

(declare-fun mapValue!52436 () ValueCell!16061)

(declare-fun mapRest!52436 () (Array (_ BitVec 32) ValueCell!16061))

(assert (=> mapNonEmpty!52436 (= (arr!40960 _values!1445) (store mapRest!52436 mapKey!52436 mapValue!52436))))

(declare-fun b!1285685 () Bool)

(declare-fun e!734499 () Bool)

(declare-fun e!734501 () Bool)

(assert (=> b!1285685 (= e!734499 (and e!734501 mapRes!52436))))

(declare-fun condMapEmpty!52436 () Bool)

(declare-fun mapDefault!52436 () ValueCell!16061)

(assert (=> b!1285685 (= condMapEmpty!52436 (= (arr!40960 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16061)) mapDefault!52436)))))

(declare-fun b!1285686 () Bool)

(declare-fun tp_is_empty!33919 () Bool)

(assert (=> b!1285686 (= e!734501 tp_is_empty!33919)))

(declare-fun mapIsEmpty!52436 () Bool)

(assert (=> mapIsEmpty!52436 mapRes!52436))

(declare-fun b!1285687 () Bool)

(declare-fun res!853753 () Bool)

(declare-fun e!734500 () Bool)

(assert (=> b!1285687 (=> (not res!853753) (not e!734500))))

(declare-datatypes ((array!84927 0))(
  ( (array!84928 (arr!40961 (Array (_ BitVec 32) (_ BitVec 64))) (size!41512 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84927)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84927 (_ BitVec 32)) Bool)

(assert (=> b!1285687 (= res!853753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285688 () Bool)

(assert (=> b!1285688 (= e!734498 tp_is_empty!33919)))

(declare-fun res!853756 () Bool)

(assert (=> start!108990 (=> (not res!853756) (not e!734500))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108990 (= res!853756 (validMask!0 mask!2175))))

(assert (=> start!108990 e!734500))

(assert (=> start!108990 tp_is_empty!33919))

(assert (=> start!108990 true))

(declare-fun array_inv!31281 (array!84925) Bool)

(assert (=> start!108990 (and (array_inv!31281 _values!1445) e!734499)))

(declare-fun array_inv!31282 (array!84927) Bool)

(assert (=> start!108990 (array_inv!31282 _keys!1741)))

(assert (=> start!108990 tp!99953))

(declare-fun b!1285689 () Bool)

(declare-fun res!853755 () Bool)

(assert (=> b!1285689 (=> (not res!853755) (not e!734500))))

(declare-datatypes ((List!29052 0))(
  ( (Nil!29049) (Cons!29048 (h!30266 (_ BitVec 64)) (t!42588 List!29052)) )
))
(declare-fun arrayNoDuplicates!0 (array!84927 (_ BitVec 32) List!29052) Bool)

(assert (=> b!1285689 (= res!853755 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29049))))

(declare-fun b!1285690 () Bool)

(assert (=> b!1285690 (= e!734500 false)))

(declare-fun minValue!1387 () V!50329)

(declare-fun zeroValue!1387 () V!50329)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577289 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21846 0))(
  ( (tuple2!21847 (_1!10934 (_ BitVec 64)) (_2!10934 V!50329)) )
))
(declare-datatypes ((List!29053 0))(
  ( (Nil!29050) (Cons!29049 (h!30267 tuple2!21846) (t!42589 List!29053)) )
))
(declare-datatypes ((ListLongMap!19511 0))(
  ( (ListLongMap!19512 (toList!9771 List!29053)) )
))
(declare-fun contains!7902 (ListLongMap!19511 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4835 (array!84927 array!84925 (_ BitVec 32) (_ BitVec 32) V!50329 V!50329 (_ BitVec 32) Int) ListLongMap!19511)

(assert (=> b!1285690 (= lt!577289 (contains!7902 (getCurrentListMap!4835 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1285691 () Bool)

(declare-fun res!853754 () Bool)

(assert (=> b!1285691 (=> (not res!853754) (not e!734500))))

(assert (=> b!1285691 (= res!853754 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41512 _keys!1741))))))

(declare-fun b!1285692 () Bool)

(declare-fun res!853752 () Bool)

(assert (=> b!1285692 (=> (not res!853752) (not e!734500))))

(assert (=> b!1285692 (= res!853752 (and (= (size!41511 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41512 _keys!1741) (size!41511 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108990 res!853756) b!1285692))

(assert (= (and b!1285692 res!853752) b!1285687))

(assert (= (and b!1285687 res!853753) b!1285689))

(assert (= (and b!1285689 res!853755) b!1285691))

(assert (= (and b!1285691 res!853754) b!1285690))

(assert (= (and b!1285685 condMapEmpty!52436) mapIsEmpty!52436))

(assert (= (and b!1285685 (not condMapEmpty!52436)) mapNonEmpty!52436))

(get-info :version)

(assert (= (and mapNonEmpty!52436 ((_ is ValueCellFull!16061) mapValue!52436)) b!1285688))

(assert (= (and b!1285685 ((_ is ValueCellFull!16061) mapDefault!52436)) b!1285686))

(assert (= start!108990 b!1285685))

(declare-fun m!1179697 () Bool)

(assert (=> b!1285690 m!1179697))

(assert (=> b!1285690 m!1179697))

(declare-fun m!1179699 () Bool)

(assert (=> b!1285690 m!1179699))

(declare-fun m!1179701 () Bool)

(assert (=> b!1285689 m!1179701))

(declare-fun m!1179703 () Bool)

(assert (=> b!1285687 m!1179703))

(declare-fun m!1179705 () Bool)

(assert (=> start!108990 m!1179705))

(declare-fun m!1179707 () Bool)

(assert (=> start!108990 m!1179707))

(declare-fun m!1179709 () Bool)

(assert (=> start!108990 m!1179709))

(declare-fun m!1179711 () Bool)

(assert (=> mapNonEmpty!52436 m!1179711))

(check-sat (not mapNonEmpty!52436) tp_is_empty!33919 b_and!46347 (not start!108990) (not b!1285690) (not b_next!28279) (not b!1285687) (not b!1285689))
(check-sat b_and!46347 (not b_next!28279))
