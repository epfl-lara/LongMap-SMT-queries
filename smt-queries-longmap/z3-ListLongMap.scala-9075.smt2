; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109236 () Bool)

(assert start!109236)

(declare-fun b_free!28725 () Bool)

(declare-fun b_next!28725 () Bool)

(assert (=> start!109236 (= b_free!28725 (not b_next!28725))))

(declare-fun tp!101293 () Bool)

(declare-fun b_and!46815 () Bool)

(assert (=> start!109236 (= tp!101293 b_and!46815)))

(declare-fun b!1292283 () Bool)

(declare-fun e!737611 () Bool)

(declare-fun e!737614 () Bool)

(declare-fun mapRes!53108 () Bool)

(assert (=> b!1292283 (= e!737611 (and e!737614 mapRes!53108))))

(declare-fun condMapEmpty!53108 () Bool)

(declare-datatypes ((V!50923 0))(
  ( (V!50924 (val!17257 Int)) )
))
(declare-datatypes ((ValueCell!16284 0))(
  ( (ValueCellFull!16284 (v!19860 V!50923)) (EmptyCell!16284) )
))
(declare-datatypes ((array!85762 0))(
  ( (array!85763 (arr!41382 (Array (_ BitVec 32) ValueCell!16284)) (size!41932 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85762)

(declare-fun mapDefault!53108 () ValueCell!16284)

(assert (=> b!1292283 (= condMapEmpty!53108 (= (arr!41382 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16284)) mapDefault!53108)))))

(declare-fun b!1292284 () Bool)

(declare-fun e!737613 () Bool)

(assert (=> b!1292284 (= e!737613 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22200 0))(
  ( (tuple2!22201 (_1!11111 (_ BitVec 64)) (_2!11111 V!50923)) )
))
(declare-datatypes ((List!29353 0))(
  ( (Nil!29350) (Cons!29349 (h!30558 tuple2!22200) (t!42917 List!29353)) )
))
(declare-datatypes ((ListLongMap!19857 0))(
  ( (ListLongMap!19858 (toList!9944 List!29353)) )
))
(declare-fun contains!8062 (ListLongMap!19857 (_ BitVec 64)) Bool)

(assert (=> b!1292284 (not (contains!8062 (ListLongMap!19858 Nil!29350) k0!1205))))

(declare-datatypes ((Unit!42796 0))(
  ( (Unit!42797) )
))
(declare-fun lt!579323 () Unit!42796)

(declare-fun emptyContainsNothing!120 ((_ BitVec 64)) Unit!42796)

(assert (=> b!1292284 (= lt!579323 (emptyContainsNothing!120 k0!1205))))

(declare-fun mapIsEmpty!53108 () Bool)

(assert (=> mapIsEmpty!53108 mapRes!53108))

(declare-fun b!1292285 () Bool)

(declare-fun res!858644 () Bool)

(assert (=> b!1292285 (=> (not res!858644) (not e!737613))))

(declare-datatypes ((array!85764 0))(
  ( (array!85765 (arr!41383 (Array (_ BitVec 32) (_ BitVec 64))) (size!41933 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85764)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292285 (= res!858644 (not (validKeyInArray!0 (select (arr!41383 _keys!1741) from!2144))))))

(declare-fun mapNonEmpty!53108 () Bool)

(declare-fun tp!101294 () Bool)

(declare-fun e!737612 () Bool)

(assert (=> mapNonEmpty!53108 (= mapRes!53108 (and tp!101294 e!737612))))

(declare-fun mapKey!53108 () (_ BitVec 32))

(declare-fun mapRest!53108 () (Array (_ BitVec 32) ValueCell!16284))

(declare-fun mapValue!53108 () ValueCell!16284)

(assert (=> mapNonEmpty!53108 (= (arr!41382 _values!1445) (store mapRest!53108 mapKey!53108 mapValue!53108))))

(declare-fun b!1292286 () Bool)

(declare-fun tp_is_empty!34365 () Bool)

(assert (=> b!1292286 (= e!737612 tp_is_empty!34365)))

(declare-fun b!1292287 () Bool)

(declare-fun res!858641 () Bool)

(assert (=> b!1292287 (=> (not res!858641) (not e!737613))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292287 (= res!858641 (and (= (size!41932 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41933 _keys!1741) (size!41932 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292288 () Bool)

(declare-fun res!858645 () Bool)

(assert (=> b!1292288 (=> (not res!858645) (not e!737613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85764 (_ BitVec 32)) Bool)

(assert (=> b!1292288 (= res!858645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292290 () Bool)

(declare-fun res!858640 () Bool)

(assert (=> b!1292290 (=> (not res!858640) (not e!737613))))

(declare-datatypes ((List!29354 0))(
  ( (Nil!29351) (Cons!29350 (h!30559 (_ BitVec 64)) (t!42918 List!29354)) )
))
(declare-fun arrayNoDuplicates!0 (array!85764 (_ BitVec 32) List!29354) Bool)

(assert (=> b!1292290 (= res!858640 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29351))))

(declare-fun b!1292291 () Bool)

(assert (=> b!1292291 (= e!737614 tp_is_empty!34365)))

(declare-fun b!1292292 () Bool)

(declare-fun res!858642 () Bool)

(assert (=> b!1292292 (=> (not res!858642) (not e!737613))))

(assert (=> b!1292292 (= res!858642 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41933 _keys!1741))))))

(declare-fun b!1292293 () Bool)

(declare-fun res!858639 () Bool)

(assert (=> b!1292293 (=> (not res!858639) (not e!737613))))

(declare-fun minValue!1387 () V!50923)

(declare-fun zeroValue!1387 () V!50923)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4990 (array!85764 array!85762 (_ BitVec 32) (_ BitVec 32) V!50923 V!50923 (_ BitVec 32) Int) ListLongMap!19857)

(assert (=> b!1292293 (= res!858639 (contains!8062 (getCurrentListMap!4990 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292289 () Bool)

(declare-fun res!858643 () Bool)

(assert (=> b!1292289 (=> (not res!858643) (not e!737613))))

(assert (=> b!1292289 (= res!858643 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41933 _keys!1741))))))

(declare-fun res!858638 () Bool)

(assert (=> start!109236 (=> (not res!858638) (not e!737613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109236 (= res!858638 (validMask!0 mask!2175))))

(assert (=> start!109236 e!737613))

(assert (=> start!109236 tp_is_empty!34365))

(assert (=> start!109236 true))

(declare-fun array_inv!31357 (array!85762) Bool)

(assert (=> start!109236 (and (array_inv!31357 _values!1445) e!737611)))

(declare-fun array_inv!31358 (array!85764) Bool)

(assert (=> start!109236 (array_inv!31358 _keys!1741)))

(assert (=> start!109236 tp!101293))

(assert (= (and start!109236 res!858638) b!1292287))

(assert (= (and b!1292287 res!858641) b!1292288))

(assert (= (and b!1292288 res!858645) b!1292290))

(assert (= (and b!1292290 res!858640) b!1292292))

(assert (= (and b!1292292 res!858642) b!1292293))

(assert (= (and b!1292293 res!858639) b!1292289))

(assert (= (and b!1292289 res!858643) b!1292285))

(assert (= (and b!1292285 res!858644) b!1292284))

(assert (= (and b!1292283 condMapEmpty!53108) mapIsEmpty!53108))

(assert (= (and b!1292283 (not condMapEmpty!53108)) mapNonEmpty!53108))

(get-info :version)

(assert (= (and mapNonEmpty!53108 ((_ is ValueCellFull!16284) mapValue!53108)) b!1292286))

(assert (= (and b!1292283 ((_ is ValueCellFull!16284) mapDefault!53108)) b!1292291))

(assert (= start!109236 b!1292283))

(declare-fun m!1184879 () Bool)

(assert (=> b!1292288 m!1184879))

(declare-fun m!1184881 () Bool)

(assert (=> start!109236 m!1184881))

(declare-fun m!1184883 () Bool)

(assert (=> start!109236 m!1184883))

(declare-fun m!1184885 () Bool)

(assert (=> start!109236 m!1184885))

(declare-fun m!1184887 () Bool)

(assert (=> b!1292290 m!1184887))

(declare-fun m!1184889 () Bool)

(assert (=> mapNonEmpty!53108 m!1184889))

(declare-fun m!1184891 () Bool)

(assert (=> b!1292293 m!1184891))

(assert (=> b!1292293 m!1184891))

(declare-fun m!1184893 () Bool)

(assert (=> b!1292293 m!1184893))

(declare-fun m!1184895 () Bool)

(assert (=> b!1292285 m!1184895))

(assert (=> b!1292285 m!1184895))

(declare-fun m!1184897 () Bool)

(assert (=> b!1292285 m!1184897))

(declare-fun m!1184899 () Bool)

(assert (=> b!1292284 m!1184899))

(declare-fun m!1184901 () Bool)

(assert (=> b!1292284 m!1184901))

(check-sat (not b!1292290) (not start!109236) b_and!46815 (not mapNonEmpty!53108) (not b!1292284) (not b!1292288) tp_is_empty!34365 (not b_next!28725) (not b!1292285) (not b!1292293))
(check-sat b_and!46815 (not b_next!28725))
