; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4190 () Bool)

(assert start!4190)

(declare-fun b_free!1095 () Bool)

(declare-fun b_next!1095 () Bool)

(assert (=> start!4190 (= b_free!1095 (not b_next!1095))))

(declare-fun tp!4705 () Bool)

(declare-fun b_and!1905 () Bool)

(assert (=> start!4190 (= tp!4705 b_and!1905)))

(declare-fun b!31798 () Bool)

(declare-fun e!20275 () Bool)

(declare-fun e!20277 () Bool)

(declare-fun mapRes!1702 () Bool)

(assert (=> b!31798 (= e!20275 (and e!20277 mapRes!1702))))

(declare-fun condMapEmpty!1702 () Bool)

(declare-datatypes ((V!1757 0))(
  ( (V!1758 (val!751 Int)) )
))
(declare-datatypes ((ValueCell!525 0))(
  ( (ValueCellFull!525 (v!1840 V!1757)) (EmptyCell!525) )
))
(declare-datatypes ((array!2113 0))(
  ( (array!2114 (arr!1010 (Array (_ BitVec 32) ValueCell!525)) (size!1111 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2113)

(declare-fun mapDefault!1702 () ValueCell!525)

(assert (=> b!31798 (= condMapEmpty!1702 (= (arr!1010 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!525)) mapDefault!1702)))))

(declare-fun b!31799 () Bool)

(declare-fun res!19293 () Bool)

(declare-fun e!20279 () Bool)

(assert (=> b!31799 (=> (not res!19293) (not e!20279))))

(declare-datatypes ((array!2115 0))(
  ( (array!2116 (arr!1011 (Array (_ BitVec 32) (_ BitVec 64))) (size!1112 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2115)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31799 (= res!19293 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1702 () Bool)

(assert (=> mapIsEmpty!1702 mapRes!1702))

(declare-fun b!31800 () Bool)

(declare-fun res!19292 () Bool)

(assert (=> b!31800 (=> (not res!19292) (not e!20279))))

(declare-datatypes ((List!817 0))(
  ( (Nil!814) (Cons!813 (h!1380 (_ BitVec 64)) (t!3510 List!817)) )
))
(declare-fun arrayNoDuplicates!0 (array!2115 (_ BitVec 32) List!817) Bool)

(assert (=> b!31800 (= res!19292 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!814))))

(declare-fun b!31801 () Bool)

(declare-fun e!20276 () Bool)

(declare-fun tp_is_empty!1449 () Bool)

(assert (=> b!31801 (= e!20276 tp_is_empty!1449)))

(declare-fun b!31802 () Bool)

(declare-fun res!19288 () Bool)

(assert (=> b!31802 (=> (not res!19288) (not e!20279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!31802 (= res!19288 (validKeyInArray!0 k0!1304))))

(declare-fun b!31803 () Bool)

(assert (=> b!31803 (= e!20277 tp_is_empty!1449)))

(declare-fun res!19287 () Bool)

(assert (=> start!4190 (=> (not res!19287) (not e!20279))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4190 (= res!19287 (validMask!0 mask!2294))))

(assert (=> start!4190 e!20279))

(assert (=> start!4190 true))

(assert (=> start!4190 tp!4705))

(declare-fun array_inv!705 (array!2113) Bool)

(assert (=> start!4190 (and (array_inv!705 _values!1501) e!20275)))

(declare-fun array_inv!706 (array!2115) Bool)

(assert (=> start!4190 (array_inv!706 _keys!1833)))

(assert (=> start!4190 tp_is_empty!1449))

(declare-fun b!31797 () Bool)

(declare-fun res!19289 () Bool)

(assert (=> b!31797 (=> (not res!19289) (not e!20279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2115 (_ BitVec 32)) Bool)

(assert (=> b!31797 (= res!19289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31804 () Bool)

(assert (=> b!31804 (= e!20279 false)))

(declare-fun lt!11603 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2115 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31804 (= lt!11603 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!31805 () Bool)

(declare-fun res!19290 () Bool)

(assert (=> b!31805 (=> (not res!19290) (not e!20279))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1757)

(declare-fun minValue!1443 () V!1757)

(declare-datatypes ((tuple2!1224 0))(
  ( (tuple2!1225 (_1!623 (_ BitVec 64)) (_2!623 V!1757)) )
))
(declare-datatypes ((List!818 0))(
  ( (Nil!815) (Cons!814 (h!1381 tuple2!1224) (t!3511 List!818)) )
))
(declare-datatypes ((ListLongMap!801 0))(
  ( (ListLongMap!802 (toList!416 List!818)) )
))
(declare-fun contains!356 (ListLongMap!801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!244 (array!2115 array!2113 (_ BitVec 32) (_ BitVec 32) V!1757 V!1757 (_ BitVec 32) Int) ListLongMap!801)

(assert (=> b!31805 (= res!19290 (not (contains!356 (getCurrentListMap!244 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!31806 () Bool)

(declare-fun res!19291 () Bool)

(assert (=> b!31806 (=> (not res!19291) (not e!20279))))

(assert (=> b!31806 (= res!19291 (and (= (size!1111 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1112 _keys!1833) (size!1111 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1702 () Bool)

(declare-fun tp!4704 () Bool)

(assert (=> mapNonEmpty!1702 (= mapRes!1702 (and tp!4704 e!20276))))

(declare-fun mapValue!1702 () ValueCell!525)

(declare-fun mapKey!1702 () (_ BitVec 32))

(declare-fun mapRest!1702 () (Array (_ BitVec 32) ValueCell!525))

(assert (=> mapNonEmpty!1702 (= (arr!1010 _values!1501) (store mapRest!1702 mapKey!1702 mapValue!1702))))

(assert (= (and start!4190 res!19287) b!31806))

(assert (= (and b!31806 res!19291) b!31797))

(assert (= (and b!31797 res!19289) b!31800))

(assert (= (and b!31800 res!19292) b!31802))

(assert (= (and b!31802 res!19288) b!31805))

(assert (= (and b!31805 res!19290) b!31799))

(assert (= (and b!31799 res!19293) b!31804))

(assert (= (and b!31798 condMapEmpty!1702) mapIsEmpty!1702))

(assert (= (and b!31798 (not condMapEmpty!1702)) mapNonEmpty!1702))

(get-info :version)

(assert (= (and mapNonEmpty!1702 ((_ is ValueCellFull!525) mapValue!1702)) b!31801))

(assert (= (and b!31798 ((_ is ValueCellFull!525) mapDefault!1702)) b!31803))

(assert (= start!4190 b!31798))

(declare-fun m!25481 () Bool)

(assert (=> b!31802 m!25481))

(declare-fun m!25483 () Bool)

(assert (=> b!31797 m!25483))

(declare-fun m!25485 () Bool)

(assert (=> start!4190 m!25485))

(declare-fun m!25487 () Bool)

(assert (=> start!4190 m!25487))

(declare-fun m!25489 () Bool)

(assert (=> start!4190 m!25489))

(declare-fun m!25491 () Bool)

(assert (=> mapNonEmpty!1702 m!25491))

(declare-fun m!25493 () Bool)

(assert (=> b!31799 m!25493))

(declare-fun m!25495 () Bool)

(assert (=> b!31800 m!25495))

(declare-fun m!25497 () Bool)

(assert (=> b!31804 m!25497))

(declare-fun m!25499 () Bool)

(assert (=> b!31805 m!25499))

(assert (=> b!31805 m!25499))

(declare-fun m!25501 () Bool)

(assert (=> b!31805 m!25501))

(check-sat (not start!4190) b_and!1905 (not b!31797) (not b!31804) (not b!31800) tp_is_empty!1449 (not b!31802) (not mapNonEmpty!1702) (not b!31805) (not b_next!1095) (not b!31799))
(check-sat b_and!1905 (not b_next!1095))
