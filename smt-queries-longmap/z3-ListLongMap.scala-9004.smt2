; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109008 () Bool)

(assert start!109008)

(declare-fun b_free!28297 () Bool)

(declare-fun b_next!28297 () Bool)

(assert (=> start!109008 (= b_free!28297 (not b_next!28297))))

(declare-fun tp!100007 () Bool)

(declare-fun b_and!46365 () Bool)

(assert (=> start!109008 (= tp!100007 b_and!46365)))

(declare-fun mapNonEmpty!52463 () Bool)

(declare-fun mapRes!52463 () Bool)

(declare-fun tp!100006 () Bool)

(declare-fun e!734634 () Bool)

(assert (=> mapNonEmpty!52463 (= mapRes!52463 (and tp!100006 e!734634))))

(declare-datatypes ((V!50353 0))(
  ( (V!50354 (val!17043 Int)) )
))
(declare-datatypes ((ValueCell!16070 0))(
  ( (ValueCellFull!16070 (v!19640 V!50353)) (EmptyCell!16070) )
))
(declare-fun mapRest!52463 () (Array (_ BitVec 32) ValueCell!16070))

(declare-fun mapKey!52463 () (_ BitVec 32))

(declare-datatypes ((array!84961 0))(
  ( (array!84962 (arr!40978 (Array (_ BitVec 32) ValueCell!16070)) (size!41529 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84961)

(declare-fun mapValue!52463 () ValueCell!16070)

(assert (=> mapNonEmpty!52463 (= (arr!40978 _values!1445) (store mapRest!52463 mapKey!52463 mapValue!52463))))

(declare-fun b!1285901 () Bool)

(declare-fun res!853891 () Bool)

(declare-fun e!734633 () Bool)

(assert (=> b!1285901 (=> (not res!853891) (not e!734633))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84963 0))(
  ( (array!84964 (arr!40979 (Array (_ BitVec 32) (_ BitVec 64))) (size!41530 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84963)

(assert (=> b!1285901 (= res!853891 (and (= (size!41529 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41530 _keys!1741) (size!41529 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1285902 () Bool)

(declare-fun tp_is_empty!33937 () Bool)

(assert (=> b!1285902 (= e!734634 tp_is_empty!33937)))

(declare-fun b!1285903 () Bool)

(assert (=> b!1285903 (= e!734633 false)))

(declare-fun minValue!1387 () V!50353)

(declare-fun zeroValue!1387 () V!50353)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!577316 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21860 0))(
  ( (tuple2!21861 (_1!10941 (_ BitVec 64)) (_2!10941 V!50353)) )
))
(declare-datatypes ((List!29064 0))(
  ( (Nil!29061) (Cons!29060 (h!30278 tuple2!21860) (t!42600 List!29064)) )
))
(declare-datatypes ((ListLongMap!19525 0))(
  ( (ListLongMap!19526 (toList!9778 List!29064)) )
))
(declare-fun contains!7909 (ListLongMap!19525 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4842 (array!84963 array!84961 (_ BitVec 32) (_ BitVec 32) V!50353 V!50353 (_ BitVec 32) Int) ListLongMap!19525)

(assert (=> b!1285903 (= lt!577316 (contains!7909 (getCurrentListMap!4842 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun res!853887 () Bool)

(assert (=> start!109008 (=> (not res!853887) (not e!734633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109008 (= res!853887 (validMask!0 mask!2175))))

(assert (=> start!109008 e!734633))

(assert (=> start!109008 tp_is_empty!33937))

(assert (=> start!109008 true))

(declare-fun e!734635 () Bool)

(declare-fun array_inv!31295 (array!84961) Bool)

(assert (=> start!109008 (and (array_inv!31295 _values!1445) e!734635)))

(declare-fun array_inv!31296 (array!84963) Bool)

(assert (=> start!109008 (array_inv!31296 _keys!1741)))

(assert (=> start!109008 tp!100007))

(declare-fun b!1285904 () Bool)

(declare-fun e!734637 () Bool)

(assert (=> b!1285904 (= e!734635 (and e!734637 mapRes!52463))))

(declare-fun condMapEmpty!52463 () Bool)

(declare-fun mapDefault!52463 () ValueCell!16070)

(assert (=> b!1285904 (= condMapEmpty!52463 (= (arr!40978 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16070)) mapDefault!52463)))))

(declare-fun b!1285905 () Bool)

(assert (=> b!1285905 (= e!734637 tp_is_empty!33937)))

(declare-fun b!1285906 () Bool)

(declare-fun res!853890 () Bool)

(assert (=> b!1285906 (=> (not res!853890) (not e!734633))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84963 (_ BitVec 32)) Bool)

(assert (=> b!1285906 (= res!853890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1285907 () Bool)

(declare-fun res!853889 () Bool)

(assert (=> b!1285907 (=> (not res!853889) (not e!734633))))

(declare-datatypes ((List!29065 0))(
  ( (Nil!29062) (Cons!29061 (h!30279 (_ BitVec 64)) (t!42601 List!29065)) )
))
(declare-fun arrayNoDuplicates!0 (array!84963 (_ BitVec 32) List!29065) Bool)

(assert (=> b!1285907 (= res!853889 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29062))))

(declare-fun mapIsEmpty!52463 () Bool)

(assert (=> mapIsEmpty!52463 mapRes!52463))

(declare-fun b!1285908 () Bool)

(declare-fun res!853888 () Bool)

(assert (=> b!1285908 (=> (not res!853888) (not e!734633))))

(assert (=> b!1285908 (= res!853888 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41530 _keys!1741))))))

(assert (= (and start!109008 res!853887) b!1285901))

(assert (= (and b!1285901 res!853891) b!1285906))

(assert (= (and b!1285906 res!853890) b!1285907))

(assert (= (and b!1285907 res!853889) b!1285908))

(assert (= (and b!1285908 res!853888) b!1285903))

(assert (= (and b!1285904 condMapEmpty!52463) mapIsEmpty!52463))

(assert (= (and b!1285904 (not condMapEmpty!52463)) mapNonEmpty!52463))

(get-info :version)

(assert (= (and mapNonEmpty!52463 ((_ is ValueCellFull!16070) mapValue!52463)) b!1285902))

(assert (= (and b!1285904 ((_ is ValueCellFull!16070) mapDefault!52463)) b!1285905))

(assert (= start!109008 b!1285904))

(declare-fun m!1179841 () Bool)

(assert (=> b!1285907 m!1179841))

(declare-fun m!1179843 () Bool)

(assert (=> mapNonEmpty!52463 m!1179843))

(declare-fun m!1179845 () Bool)

(assert (=> b!1285903 m!1179845))

(assert (=> b!1285903 m!1179845))

(declare-fun m!1179847 () Bool)

(assert (=> b!1285903 m!1179847))

(declare-fun m!1179849 () Bool)

(assert (=> b!1285906 m!1179849))

(declare-fun m!1179851 () Bool)

(assert (=> start!109008 m!1179851))

(declare-fun m!1179853 () Bool)

(assert (=> start!109008 m!1179853))

(declare-fun m!1179855 () Bool)

(assert (=> start!109008 m!1179855))

(check-sat (not b_next!28297) tp_is_empty!33937 (not b!1285903) (not mapNonEmpty!52463) (not b!1285906) b_and!46365 (not start!109008) (not b!1285907))
(check-sat b_and!46365 (not b_next!28297))
