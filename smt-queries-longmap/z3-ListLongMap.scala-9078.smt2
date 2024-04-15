; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109252 () Bool)

(assert start!109252)

(declare-fun b_free!28741 () Bool)

(declare-fun b_next!28741 () Bool)

(assert (=> start!109252 (= b_free!28741 (not b_next!28741))))

(declare-fun tp!101342 () Bool)

(declare-fun b_and!46813 () Bool)

(assert (=> start!109252 (= tp!101342 b_and!46813)))

(declare-fun b!1292483 () Bool)

(declare-fun res!858803 () Bool)

(declare-fun e!737704 () Bool)

(assert (=> b!1292483 (=> (not res!858803) (not e!737704))))

(declare-datatypes ((V!50945 0))(
  ( (V!50946 (val!17265 Int)) )
))
(declare-fun minValue!1387 () V!50945)

(declare-fun zeroValue!1387 () V!50945)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16292 0))(
  ( (ValueCellFull!16292 (v!19867 V!50945)) (EmptyCell!16292) )
))
(declare-datatypes ((array!85679 0))(
  ( (array!85680 (arr!41341 (Array (_ BitVec 32) ValueCell!16292)) (size!41893 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85679)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85681 0))(
  ( (array!85682 (arr!41342 (Array (_ BitVec 32) (_ BitVec 64))) (size!41894 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85681)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22252 0))(
  ( (tuple2!22253 (_1!11137 (_ BitVec 64)) (_2!11137 V!50945)) )
))
(declare-datatypes ((List!29402 0))(
  ( (Nil!29399) (Cons!29398 (h!30607 tuple2!22252) (t!42958 List!29402)) )
))
(declare-datatypes ((ListLongMap!19909 0))(
  ( (ListLongMap!19910 (toList!9970 List!29402)) )
))
(declare-fun contains!8018 (ListLongMap!19909 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4912 (array!85681 array!85679 (_ BitVec 32) (_ BitVec 32) V!50945 V!50945 (_ BitVec 32) Int) ListLongMap!19909)

(assert (=> b!1292483 (= res!858803 (contains!8018 (getCurrentListMap!4912 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292484 () Bool)

(declare-fun res!858807 () Bool)

(assert (=> b!1292484 (=> (not res!858807) (not e!737704))))

(assert (=> b!1292484 (= res!858807 (and (= (size!41893 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41894 _keys!1741) (size!41893 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!858804 () Bool)

(assert (=> start!109252 (=> (not res!858804) (not e!737704))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109252 (= res!858804 (validMask!0 mask!2175))))

(assert (=> start!109252 e!737704))

(declare-fun tp_is_empty!34381 () Bool)

(assert (=> start!109252 tp_is_empty!34381))

(assert (=> start!109252 true))

(declare-fun e!737702 () Bool)

(declare-fun array_inv!31481 (array!85679) Bool)

(assert (=> start!109252 (and (array_inv!31481 _values!1445) e!737702)))

(declare-fun array_inv!31482 (array!85681) Bool)

(assert (=> start!109252 (array_inv!31482 _keys!1741)))

(assert (=> start!109252 tp!101342))

(declare-fun b!1292485 () Bool)

(declare-fun res!858805 () Bool)

(assert (=> b!1292485 (=> (not res!858805) (not e!737704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85681 (_ BitVec 32)) Bool)

(assert (=> b!1292485 (= res!858805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292486 () Bool)

(declare-fun e!737705 () Bool)

(assert (=> b!1292486 (= e!737705 tp_is_empty!34381)))

(declare-fun b!1292487 () Bool)

(assert (=> b!1292487 (= e!737704 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsle from!2144 (size!41894 _keys!1741)))))))

(assert (=> b!1292487 (not (contains!8018 (ListLongMap!19910 Nil!29399) k0!1205))))

(declare-datatypes ((Unit!42622 0))(
  ( (Unit!42623) )
))
(declare-fun lt!579169 () Unit!42622)

(declare-fun emptyContainsNothing!108 ((_ BitVec 64)) Unit!42622)

(assert (=> b!1292487 (= lt!579169 (emptyContainsNothing!108 k0!1205))))

(declare-fun b!1292488 () Bool)

(declare-fun res!858806 () Bool)

(assert (=> b!1292488 (=> (not res!858806) (not e!737704))))

(assert (=> b!1292488 (= res!858806 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41894 _keys!1741))))))

(declare-fun mapIsEmpty!53132 () Bool)

(declare-fun mapRes!53132 () Bool)

(assert (=> mapIsEmpty!53132 mapRes!53132))

(declare-fun b!1292489 () Bool)

(declare-fun res!858809 () Bool)

(assert (=> b!1292489 (=> (not res!858809) (not e!737704))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292489 (= res!858809 (not (validKeyInArray!0 (select (arr!41342 _keys!1741) from!2144))))))

(declare-fun b!1292490 () Bool)

(declare-fun res!858808 () Bool)

(assert (=> b!1292490 (=> (not res!858808) (not e!737704))))

(assert (=> b!1292490 (= res!858808 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41894 _keys!1741))))))

(declare-fun b!1292491 () Bool)

(declare-fun res!858810 () Bool)

(assert (=> b!1292491 (=> (not res!858810) (not e!737704))))

(declare-datatypes ((List!29403 0))(
  ( (Nil!29400) (Cons!29399 (h!30608 (_ BitVec 64)) (t!42959 List!29403)) )
))
(declare-fun arrayNoDuplicates!0 (array!85681 (_ BitVec 32) List!29403) Bool)

(assert (=> b!1292491 (= res!858810 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29400))))

(declare-fun b!1292492 () Bool)

(declare-fun e!737703 () Bool)

(assert (=> b!1292492 (= e!737703 tp_is_empty!34381)))

(declare-fun b!1292493 () Bool)

(assert (=> b!1292493 (= e!737702 (and e!737705 mapRes!53132))))

(declare-fun condMapEmpty!53132 () Bool)

(declare-fun mapDefault!53132 () ValueCell!16292)

(assert (=> b!1292493 (= condMapEmpty!53132 (= (arr!41341 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16292)) mapDefault!53132)))))

(declare-fun mapNonEmpty!53132 () Bool)

(declare-fun tp!101343 () Bool)

(assert (=> mapNonEmpty!53132 (= mapRes!53132 (and tp!101343 e!737703))))

(declare-fun mapRest!53132 () (Array (_ BitVec 32) ValueCell!16292))

(declare-fun mapValue!53132 () ValueCell!16292)

(declare-fun mapKey!53132 () (_ BitVec 32))

(assert (=> mapNonEmpty!53132 (= (arr!41341 _values!1445) (store mapRest!53132 mapKey!53132 mapValue!53132))))

(assert (= (and start!109252 res!858804) b!1292484))

(assert (= (and b!1292484 res!858807) b!1292485))

(assert (= (and b!1292485 res!858805) b!1292491))

(assert (= (and b!1292491 res!858810) b!1292490))

(assert (= (and b!1292490 res!858808) b!1292483))

(assert (= (and b!1292483 res!858803) b!1292488))

(assert (= (and b!1292488 res!858806) b!1292489))

(assert (= (and b!1292489 res!858809) b!1292487))

(assert (= (and b!1292493 condMapEmpty!53132) mapIsEmpty!53132))

(assert (= (and b!1292493 (not condMapEmpty!53132)) mapNonEmpty!53132))

(get-info :version)

(assert (= (and mapNonEmpty!53132 ((_ is ValueCellFull!16292) mapValue!53132)) b!1292492))

(assert (= (and b!1292493 ((_ is ValueCellFull!16292) mapDefault!53132)) b!1292486))

(assert (= start!109252 b!1292493))

(declare-fun m!1184571 () Bool)

(assert (=> b!1292491 m!1184571))

(declare-fun m!1184573 () Bool)

(assert (=> b!1292487 m!1184573))

(declare-fun m!1184575 () Bool)

(assert (=> b!1292487 m!1184575))

(declare-fun m!1184577 () Bool)

(assert (=> b!1292485 m!1184577))

(declare-fun m!1184579 () Bool)

(assert (=> start!109252 m!1184579))

(declare-fun m!1184581 () Bool)

(assert (=> start!109252 m!1184581))

(declare-fun m!1184583 () Bool)

(assert (=> start!109252 m!1184583))

(declare-fun m!1184585 () Bool)

(assert (=> mapNonEmpty!53132 m!1184585))

(declare-fun m!1184587 () Bool)

(assert (=> b!1292483 m!1184587))

(assert (=> b!1292483 m!1184587))

(declare-fun m!1184589 () Bool)

(assert (=> b!1292483 m!1184589))

(declare-fun m!1184591 () Bool)

(assert (=> b!1292489 m!1184591))

(assert (=> b!1292489 m!1184591))

(declare-fun m!1184593 () Bool)

(assert (=> b!1292489 m!1184593))

(check-sat (not start!109252) (not b!1292485) (not b!1292487) (not b!1292489) (not b!1292491) (not b!1292483) tp_is_empty!34381 b_and!46813 (not b_next!28741) (not mapNonEmpty!53132))
(check-sat b_and!46813 (not b_next!28741))
