; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109206 () Bool)

(assert start!109206)

(declare-fun b_free!28695 () Bool)

(declare-fun b_next!28695 () Bool)

(assert (=> start!109206 (= b_free!28695 (not b_next!28695))))

(declare-fun tp!101204 () Bool)

(declare-fun b_and!46785 () Bool)

(assert (=> start!109206 (= tp!101204 b_and!46785)))

(declare-fun b!1291788 () Bool)

(declare-fun e!737390 () Bool)

(declare-fun tp_is_empty!34335 () Bool)

(assert (=> b!1291788 (= e!737390 tp_is_empty!34335)))

(declare-fun res!858280 () Bool)

(declare-fun e!737388 () Bool)

(assert (=> start!109206 (=> (not res!858280) (not e!737388))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109206 (= res!858280 (validMask!0 mask!2175))))

(assert (=> start!109206 e!737388))

(assert (=> start!109206 tp_is_empty!34335))

(assert (=> start!109206 true))

(declare-datatypes ((V!50883 0))(
  ( (V!50884 (val!17242 Int)) )
))
(declare-datatypes ((ValueCell!16269 0))(
  ( (ValueCellFull!16269 (v!19845 V!50883)) (EmptyCell!16269) )
))
(declare-datatypes ((array!85706 0))(
  ( (array!85707 (arr!41354 (Array (_ BitVec 32) ValueCell!16269)) (size!41904 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85706)

(declare-fun e!737389 () Bool)

(declare-fun array_inv!31333 (array!85706) Bool)

(assert (=> start!109206 (and (array_inv!31333 _values!1445) e!737389)))

(declare-datatypes ((array!85708 0))(
  ( (array!85709 (arr!41355 (Array (_ BitVec 32) (_ BitVec 64))) (size!41905 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85708)

(declare-fun array_inv!31334 (array!85708) Bool)

(assert (=> start!109206 (array_inv!31334 _keys!1741)))

(assert (=> start!109206 tp!101204))

(declare-fun b!1291789 () Bool)

(assert (=> b!1291789 (= e!737388 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22176 0))(
  ( (tuple2!22177 (_1!11099 (_ BitVec 64)) (_2!11099 V!50883)) )
))
(declare-datatypes ((List!29330 0))(
  ( (Nil!29327) (Cons!29326 (h!30535 tuple2!22176) (t!42894 List!29330)) )
))
(declare-datatypes ((ListLongMap!19833 0))(
  ( (ListLongMap!19834 (toList!9932 List!29330)) )
))
(declare-fun contains!8050 (ListLongMap!19833 (_ BitVec 64)) Bool)

(assert (=> b!1291789 (not (contains!8050 (ListLongMap!19834 Nil!29327) k0!1205))))

(declare-datatypes ((Unit!42774 0))(
  ( (Unit!42775) )
))
(declare-fun lt!579278 () Unit!42774)

(declare-fun emptyContainsNothing!109 ((_ BitVec 64)) Unit!42774)

(assert (=> b!1291789 (= lt!579278 (emptyContainsNothing!109 k0!1205))))

(declare-fun b!1291790 () Bool)

(declare-fun res!858281 () Bool)

(assert (=> b!1291790 (=> (not res!858281) (not e!737388))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291790 (= res!858281 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41905 _keys!1741))))))

(declare-fun b!1291791 () Bool)

(declare-fun res!858285 () Bool)

(assert (=> b!1291791 (=> (not res!858285) (not e!737388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291791 (= res!858285 (not (validKeyInArray!0 (select (arr!41355 _keys!1741) from!2144))))))

(declare-fun b!1291792 () Bool)

(declare-fun e!737386 () Bool)

(assert (=> b!1291792 (= e!737386 tp_is_empty!34335)))

(declare-fun b!1291793 () Bool)

(declare-fun res!858284 () Bool)

(assert (=> b!1291793 (=> (not res!858284) (not e!737388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85708 (_ BitVec 32)) Bool)

(assert (=> b!1291793 (= res!858284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291794 () Bool)

(declare-fun res!858282 () Bool)

(assert (=> b!1291794 (=> (not res!858282) (not e!737388))))

(declare-fun minValue!1387 () V!50883)

(declare-fun zeroValue!1387 () V!50883)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4980 (array!85708 array!85706 (_ BitVec 32) (_ BitVec 32) V!50883 V!50883 (_ BitVec 32) Int) ListLongMap!19833)

(assert (=> b!1291794 (= res!858282 (contains!8050 (getCurrentListMap!4980 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53063 () Bool)

(declare-fun mapRes!53063 () Bool)

(declare-fun tp!101203 () Bool)

(assert (=> mapNonEmpty!53063 (= mapRes!53063 (and tp!101203 e!737386))))

(declare-fun mapKey!53063 () (_ BitVec 32))

(declare-fun mapValue!53063 () ValueCell!16269)

(declare-fun mapRest!53063 () (Array (_ BitVec 32) ValueCell!16269))

(assert (=> mapNonEmpty!53063 (= (arr!41354 _values!1445) (store mapRest!53063 mapKey!53063 mapValue!53063))))

(declare-fun b!1291795 () Bool)

(assert (=> b!1291795 (= e!737389 (and e!737390 mapRes!53063))))

(declare-fun condMapEmpty!53063 () Bool)

(declare-fun mapDefault!53063 () ValueCell!16269)

(assert (=> b!1291795 (= condMapEmpty!53063 (= (arr!41354 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16269)) mapDefault!53063)))))

(declare-fun mapIsEmpty!53063 () Bool)

(assert (=> mapIsEmpty!53063 mapRes!53063))

(declare-fun b!1291796 () Bool)

(declare-fun res!858283 () Bool)

(assert (=> b!1291796 (=> (not res!858283) (not e!737388))))

(assert (=> b!1291796 (= res!858283 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41905 _keys!1741))))))

(declare-fun b!1291797 () Bool)

(declare-fun res!858278 () Bool)

(assert (=> b!1291797 (=> (not res!858278) (not e!737388))))

(declare-datatypes ((List!29331 0))(
  ( (Nil!29328) (Cons!29327 (h!30536 (_ BitVec 64)) (t!42895 List!29331)) )
))
(declare-fun arrayNoDuplicates!0 (array!85708 (_ BitVec 32) List!29331) Bool)

(assert (=> b!1291797 (= res!858278 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29328))))

(declare-fun b!1291798 () Bool)

(declare-fun res!858279 () Bool)

(assert (=> b!1291798 (=> (not res!858279) (not e!737388))))

(assert (=> b!1291798 (= res!858279 (and (= (size!41904 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41905 _keys!1741) (size!41904 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!109206 res!858280) b!1291798))

(assert (= (and b!1291798 res!858279) b!1291793))

(assert (= (and b!1291793 res!858284) b!1291797))

(assert (= (and b!1291797 res!858278) b!1291796))

(assert (= (and b!1291796 res!858283) b!1291794))

(assert (= (and b!1291794 res!858282) b!1291790))

(assert (= (and b!1291790 res!858281) b!1291791))

(assert (= (and b!1291791 res!858285) b!1291789))

(assert (= (and b!1291795 condMapEmpty!53063) mapIsEmpty!53063))

(assert (= (and b!1291795 (not condMapEmpty!53063)) mapNonEmpty!53063))

(get-info :version)

(assert (= (and mapNonEmpty!53063 ((_ is ValueCellFull!16269) mapValue!53063)) b!1291792))

(assert (= (and b!1291795 ((_ is ValueCellFull!16269) mapDefault!53063)) b!1291788))

(assert (= start!109206 b!1291795))

(declare-fun m!1184519 () Bool)

(assert (=> b!1291791 m!1184519))

(assert (=> b!1291791 m!1184519))

(declare-fun m!1184521 () Bool)

(assert (=> b!1291791 m!1184521))

(declare-fun m!1184523 () Bool)

(assert (=> mapNonEmpty!53063 m!1184523))

(declare-fun m!1184525 () Bool)

(assert (=> b!1291793 m!1184525))

(declare-fun m!1184527 () Bool)

(assert (=> b!1291794 m!1184527))

(assert (=> b!1291794 m!1184527))

(declare-fun m!1184529 () Bool)

(assert (=> b!1291794 m!1184529))

(declare-fun m!1184531 () Bool)

(assert (=> b!1291789 m!1184531))

(declare-fun m!1184533 () Bool)

(assert (=> b!1291789 m!1184533))

(declare-fun m!1184535 () Bool)

(assert (=> b!1291797 m!1184535))

(declare-fun m!1184537 () Bool)

(assert (=> start!109206 m!1184537))

(declare-fun m!1184539 () Bool)

(assert (=> start!109206 m!1184539))

(declare-fun m!1184541 () Bool)

(assert (=> start!109206 m!1184541))

(check-sat (not b!1291797) (not b_next!28695) (not b!1291793) (not b!1291789) (not start!109206) tp_is_empty!34335 b_and!46785 (not b!1291794) (not mapNonEmpty!53063) (not b!1291791))
(check-sat b_and!46785 (not b_next!28695))
