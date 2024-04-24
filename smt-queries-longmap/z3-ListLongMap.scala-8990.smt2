; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108924 () Bool)

(assert start!108924)

(declare-fun b_free!28213 () Bool)

(declare-fun b_next!28213 () Bool)

(assert (=> start!108924 (= b_free!28213 (not b_next!28213))))

(declare-fun tp!99755 () Bool)

(declare-fun b_and!46281 () Bool)

(assert (=> start!108924 (= tp!99755 b_and!46281)))

(declare-fun b!1284577 () Bool)

(declare-fun res!852943 () Bool)

(declare-fun e!734007 () Bool)

(assert (=> b!1284577 (=> (not res!852943) (not e!734007))))

(declare-datatypes ((V!50241 0))(
  ( (V!50242 (val!17001 Int)) )
))
(declare-fun minValue!1387 () V!50241)

(declare-fun zeroValue!1387 () V!50241)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16028 0))(
  ( (ValueCellFull!16028 (v!19598 V!50241)) (EmptyCell!16028) )
))
(declare-datatypes ((array!84797 0))(
  ( (array!84798 (arr!40896 (Array (_ BitVec 32) ValueCell!16028)) (size!41447 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84797)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84799 0))(
  ( (array!84800 (arr!40897 (Array (_ BitVec 32) (_ BitVec 64))) (size!41448 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84799)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21788 0))(
  ( (tuple2!21789 (_1!10905 (_ BitVec 64)) (_2!10905 V!50241)) )
))
(declare-datatypes ((List!29001 0))(
  ( (Nil!28998) (Cons!28997 (h!30215 tuple2!21788) (t!42537 List!29001)) )
))
(declare-datatypes ((ListLongMap!19453 0))(
  ( (ListLongMap!19454 (toList!9742 List!29001)) )
))
(declare-fun contains!7873 (ListLongMap!19453 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4810 (array!84799 array!84797 (_ BitVec 32) (_ BitVec 32) V!50241 V!50241 (_ BitVec 32) Int) ListLongMap!19453)

(assert (=> b!1284577 (= res!852943 (contains!7873 (getCurrentListMap!4810 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1284578 () Bool)

(assert (=> b!1284578 (= e!734007 (not true))))

(declare-fun lt!577111 () ListLongMap!19453)

(assert (=> b!1284578 (contains!7873 lt!577111 k0!1205)))

(declare-datatypes ((Unit!42428 0))(
  ( (Unit!42429) )
))
(declare-fun lt!577112 () Unit!42428)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!4 ((_ BitVec 64) (_ BitVec 64) V!50241 ListLongMap!19453) Unit!42428)

(assert (=> b!1284578 (= lt!577112 (lemmaInListMapAfterAddingDiffThenInBefore!4 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!577111))))

(declare-fun +!4329 (ListLongMap!19453 tuple2!21788) ListLongMap!19453)

(declare-fun getCurrentListMapNoExtraKeys!5961 (array!84799 array!84797 (_ BitVec 32) (_ BitVec 32) V!50241 V!50241 (_ BitVec 32) Int) ListLongMap!19453)

(assert (=> b!1284578 (= lt!577111 (+!4329 (getCurrentListMapNoExtraKeys!5961 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21789 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284579 () Bool)

(declare-fun e!734006 () Bool)

(declare-fun tp_is_empty!33853 () Bool)

(assert (=> b!1284579 (= e!734006 tp_is_empty!33853)))

(declare-fun b!1284580 () Bool)

(declare-fun e!734004 () Bool)

(declare-fun mapRes!52337 () Bool)

(assert (=> b!1284580 (= e!734004 (and e!734006 mapRes!52337))))

(declare-fun condMapEmpty!52337 () Bool)

(declare-fun mapDefault!52337 () ValueCell!16028)

(assert (=> b!1284580 (= condMapEmpty!52337 (= (arr!40896 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16028)) mapDefault!52337)))))

(declare-fun res!852946 () Bool)

(assert (=> start!108924 (=> (not res!852946) (not e!734007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108924 (= res!852946 (validMask!0 mask!2175))))

(assert (=> start!108924 e!734007))

(assert (=> start!108924 tp_is_empty!33853))

(assert (=> start!108924 true))

(declare-fun array_inv!31233 (array!84797) Bool)

(assert (=> start!108924 (and (array_inv!31233 _values!1445) e!734004)))

(declare-fun array_inv!31234 (array!84799) Bool)

(assert (=> start!108924 (array_inv!31234 _keys!1741)))

(assert (=> start!108924 tp!99755))

(declare-fun mapNonEmpty!52337 () Bool)

(declare-fun tp!99754 () Bool)

(declare-fun e!734005 () Bool)

(assert (=> mapNonEmpty!52337 (= mapRes!52337 (and tp!99754 e!734005))))

(declare-fun mapKey!52337 () (_ BitVec 32))

(declare-fun mapValue!52337 () ValueCell!16028)

(declare-fun mapRest!52337 () (Array (_ BitVec 32) ValueCell!16028))

(assert (=> mapNonEmpty!52337 (= (arr!40896 _values!1445) (store mapRest!52337 mapKey!52337 mapValue!52337))))

(declare-fun b!1284581 () Bool)

(declare-fun res!852941 () Bool)

(assert (=> b!1284581 (=> (not res!852941) (not e!734007))))

(declare-datatypes ((List!29002 0))(
  ( (Nil!28999) (Cons!28998 (h!30216 (_ BitVec 64)) (t!42538 List!29002)) )
))
(declare-fun arrayNoDuplicates!0 (array!84799 (_ BitVec 32) List!29002) Bool)

(assert (=> b!1284581 (= res!852941 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28999))))

(declare-fun b!1284582 () Bool)

(declare-fun res!852945 () Bool)

(assert (=> b!1284582 (=> (not res!852945) (not e!734007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284582 (= res!852945 (validKeyInArray!0 (select (arr!40897 _keys!1741) from!2144)))))

(declare-fun b!1284583 () Bool)

(declare-fun res!852942 () Bool)

(assert (=> b!1284583 (=> (not res!852942) (not e!734007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84799 (_ BitVec 32)) Bool)

(assert (=> b!1284583 (= res!852942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1284584 () Bool)

(declare-fun res!852948 () Bool)

(assert (=> b!1284584 (=> (not res!852948) (not e!734007))))

(assert (=> b!1284584 (= res!852948 (and (= (size!41447 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41448 _keys!1741) (size!41447 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1284585 () Bool)

(declare-fun res!852944 () Bool)

(assert (=> b!1284585 (=> (not res!852944) (not e!734007))))

(assert (=> b!1284585 (= res!852944 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41448 _keys!1741))))))

(declare-fun mapIsEmpty!52337 () Bool)

(assert (=> mapIsEmpty!52337 mapRes!52337))

(declare-fun b!1284586 () Bool)

(declare-fun res!852947 () Bool)

(assert (=> b!1284586 (=> (not res!852947) (not e!734007))))

(assert (=> b!1284586 (= res!852947 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41448 _keys!1741))))))

(declare-fun b!1284587 () Bool)

(assert (=> b!1284587 (= e!734005 tp_is_empty!33853)))

(declare-fun b!1284588 () Bool)

(declare-fun res!852949 () Bool)

(assert (=> b!1284588 (=> (not res!852949) (not e!734007))))

(assert (=> b!1284588 (= res!852949 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!108924 res!852946) b!1284584))

(assert (= (and b!1284584 res!852948) b!1284583))

(assert (= (and b!1284583 res!852942) b!1284581))

(assert (= (and b!1284581 res!852941) b!1284585))

(assert (= (and b!1284585 res!852944) b!1284577))

(assert (= (and b!1284577 res!852943) b!1284586))

(assert (= (and b!1284586 res!852947) b!1284582))

(assert (= (and b!1284582 res!852945) b!1284588))

(assert (= (and b!1284588 res!852949) b!1284578))

(assert (= (and b!1284580 condMapEmpty!52337) mapIsEmpty!52337))

(assert (= (and b!1284580 (not condMapEmpty!52337)) mapNonEmpty!52337))

(get-info :version)

(assert (= (and mapNonEmpty!52337 ((_ is ValueCellFull!16028) mapValue!52337)) b!1284587))

(assert (= (and b!1284580 ((_ is ValueCellFull!16028) mapDefault!52337)) b!1284579))

(assert (= start!108924 b!1284580))

(declare-fun m!1178845 () Bool)

(assert (=> b!1284583 m!1178845))

(declare-fun m!1178847 () Bool)

(assert (=> b!1284578 m!1178847))

(declare-fun m!1178849 () Bool)

(assert (=> b!1284578 m!1178849))

(declare-fun m!1178851 () Bool)

(assert (=> b!1284578 m!1178851))

(assert (=> b!1284578 m!1178851))

(declare-fun m!1178853 () Bool)

(assert (=> b!1284578 m!1178853))

(declare-fun m!1178855 () Bool)

(assert (=> b!1284581 m!1178855))

(declare-fun m!1178857 () Bool)

(assert (=> b!1284577 m!1178857))

(assert (=> b!1284577 m!1178857))

(declare-fun m!1178859 () Bool)

(assert (=> b!1284577 m!1178859))

(declare-fun m!1178861 () Bool)

(assert (=> start!108924 m!1178861))

(declare-fun m!1178863 () Bool)

(assert (=> start!108924 m!1178863))

(declare-fun m!1178865 () Bool)

(assert (=> start!108924 m!1178865))

(declare-fun m!1178867 () Bool)

(assert (=> mapNonEmpty!52337 m!1178867))

(declare-fun m!1178869 () Bool)

(assert (=> b!1284582 m!1178869))

(assert (=> b!1284582 m!1178869))

(declare-fun m!1178871 () Bool)

(assert (=> b!1284582 m!1178871))

(check-sat (not b!1284577) (not b_next!28213) (not b!1284578) (not b!1284581) (not b!1284583) (not start!108924) b_and!46281 (not mapNonEmpty!52337) tp_is_empty!33853 (not b!1284582))
(check-sat b_and!46281 (not b_next!28213))
