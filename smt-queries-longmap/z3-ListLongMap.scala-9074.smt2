; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109230 () Bool)

(assert start!109230)

(declare-fun b_free!28719 () Bool)

(declare-fun b_next!28719 () Bool)

(assert (=> start!109230 (= b_free!28719 (not b_next!28719))))

(declare-fun tp!101275 () Bool)

(declare-fun b_and!46809 () Bool)

(assert (=> start!109230 (= tp!101275 b_and!46809)))

(declare-fun b!1292184 () Bool)

(declare-fun e!737567 () Bool)

(declare-fun tp_is_empty!34359 () Bool)

(assert (=> b!1292184 (= e!737567 tp_is_empty!34359)))

(declare-fun b!1292185 () Bool)

(declare-fun res!858573 () Bool)

(declare-fun e!737569 () Bool)

(assert (=> b!1292185 (=> (not res!858573) (not e!737569))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85752 0))(
  ( (array!85753 (arr!41377 (Array (_ BitVec 32) (_ BitVec 64))) (size!41927 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85752)

(assert (=> b!1292185 (= res!858573 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41927 _keys!1741))))))

(declare-fun mapNonEmpty!53099 () Bool)

(declare-fun mapRes!53099 () Bool)

(declare-fun tp!101276 () Bool)

(assert (=> mapNonEmpty!53099 (= mapRes!53099 (and tp!101276 e!737567))))

(declare-datatypes ((V!50915 0))(
  ( (V!50916 (val!17254 Int)) )
))
(declare-datatypes ((ValueCell!16281 0))(
  ( (ValueCellFull!16281 (v!19857 V!50915)) (EmptyCell!16281) )
))
(declare-fun mapValue!53099 () ValueCell!16281)

(declare-datatypes ((array!85754 0))(
  ( (array!85755 (arr!41378 (Array (_ BitVec 32) ValueCell!16281)) (size!41928 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85754)

(declare-fun mapRest!53099 () (Array (_ BitVec 32) ValueCell!16281))

(declare-fun mapKey!53099 () (_ BitVec 32))

(assert (=> mapNonEmpty!53099 (= (arr!41378 _values!1445) (store mapRest!53099 mapKey!53099 mapValue!53099))))

(declare-fun b!1292186 () Bool)

(declare-fun res!858566 () Bool)

(assert (=> b!1292186 (=> (not res!858566) (not e!737569))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85752 (_ BitVec 32)) Bool)

(assert (=> b!1292186 (= res!858566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858570 () Bool)

(assert (=> start!109230 (=> (not res!858570) (not e!737569))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109230 (= res!858570 (validMask!0 mask!2175))))

(assert (=> start!109230 e!737569))

(assert (=> start!109230 tp_is_empty!34359))

(assert (=> start!109230 true))

(declare-fun e!737568 () Bool)

(declare-fun array_inv!31353 (array!85754) Bool)

(assert (=> start!109230 (and (array_inv!31353 _values!1445) e!737568)))

(declare-fun array_inv!31354 (array!85752) Bool)

(assert (=> start!109230 (array_inv!31354 _keys!1741)))

(assert (=> start!109230 tp!101275))

(declare-fun b!1292187 () Bool)

(declare-fun res!858568 () Bool)

(assert (=> b!1292187 (=> (not res!858568) (not e!737569))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292187 (= res!858568 (not (validKeyInArray!0 (select (arr!41377 _keys!1741) from!2144))))))

(declare-fun b!1292188 () Bool)

(declare-fun e!737566 () Bool)

(assert (=> b!1292188 (= e!737568 (and e!737566 mapRes!53099))))

(declare-fun condMapEmpty!53099 () Bool)

(declare-fun mapDefault!53099 () ValueCell!16281)

(assert (=> b!1292188 (= condMapEmpty!53099 (= (arr!41378 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16281)) mapDefault!53099)))))

(declare-fun b!1292189 () Bool)

(assert (=> b!1292189 (= e!737569 (not true))))

(declare-datatypes ((tuple2!22196 0))(
  ( (tuple2!22197 (_1!11109 (_ BitVec 64)) (_2!11109 V!50915)) )
))
(declare-datatypes ((List!29349 0))(
  ( (Nil!29346) (Cons!29345 (h!30554 tuple2!22196) (t!42913 List!29349)) )
))
(declare-datatypes ((ListLongMap!19853 0))(
  ( (ListLongMap!19854 (toList!9942 List!29349)) )
))
(declare-fun contains!8060 (ListLongMap!19853 (_ BitVec 64)) Bool)

(assert (=> b!1292189 (not (contains!8060 (ListLongMap!19854 Nil!29346) k0!1205))))

(declare-datatypes ((Unit!42794 0))(
  ( (Unit!42795) )
))
(declare-fun lt!579314 () Unit!42794)

(declare-fun emptyContainsNothing!119 ((_ BitVec 64)) Unit!42794)

(assert (=> b!1292189 (= lt!579314 (emptyContainsNothing!119 k0!1205))))

(declare-fun b!1292190 () Bool)

(declare-fun res!858572 () Bool)

(assert (=> b!1292190 (=> (not res!858572) (not e!737569))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292190 (= res!858572 (and (= (size!41928 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41927 _keys!1741) (size!41928 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292191 () Bool)

(declare-fun res!858567 () Bool)

(assert (=> b!1292191 (=> (not res!858567) (not e!737569))))

(assert (=> b!1292191 (= res!858567 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41927 _keys!1741))))))

(declare-fun b!1292192 () Bool)

(declare-fun res!858569 () Bool)

(assert (=> b!1292192 (=> (not res!858569) (not e!737569))))

(declare-fun minValue!1387 () V!50915)

(declare-fun zeroValue!1387 () V!50915)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4988 (array!85752 array!85754 (_ BitVec 32) (_ BitVec 32) V!50915 V!50915 (_ BitVec 32) Int) ListLongMap!19853)

(assert (=> b!1292192 (= res!858569 (contains!8060 (getCurrentListMap!4988 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292193 () Bool)

(assert (=> b!1292193 (= e!737566 tp_is_empty!34359)))

(declare-fun mapIsEmpty!53099 () Bool)

(assert (=> mapIsEmpty!53099 mapRes!53099))

(declare-fun b!1292194 () Bool)

(declare-fun res!858571 () Bool)

(assert (=> b!1292194 (=> (not res!858571) (not e!737569))))

(declare-datatypes ((List!29350 0))(
  ( (Nil!29347) (Cons!29346 (h!30555 (_ BitVec 64)) (t!42914 List!29350)) )
))
(declare-fun arrayNoDuplicates!0 (array!85752 (_ BitVec 32) List!29350) Bool)

(assert (=> b!1292194 (= res!858571 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29347))))

(assert (= (and start!109230 res!858570) b!1292190))

(assert (= (and b!1292190 res!858572) b!1292186))

(assert (= (and b!1292186 res!858566) b!1292194))

(assert (= (and b!1292194 res!858571) b!1292191))

(assert (= (and b!1292191 res!858567) b!1292192))

(assert (= (and b!1292192 res!858569) b!1292185))

(assert (= (and b!1292185 res!858573) b!1292187))

(assert (= (and b!1292187 res!858568) b!1292189))

(assert (= (and b!1292188 condMapEmpty!53099) mapIsEmpty!53099))

(assert (= (and b!1292188 (not condMapEmpty!53099)) mapNonEmpty!53099))

(get-info :version)

(assert (= (and mapNonEmpty!53099 ((_ is ValueCellFull!16281) mapValue!53099)) b!1292184))

(assert (= (and b!1292188 ((_ is ValueCellFull!16281) mapDefault!53099)) b!1292193))

(assert (= start!109230 b!1292188))

(declare-fun m!1184807 () Bool)

(assert (=> b!1292192 m!1184807))

(assert (=> b!1292192 m!1184807))

(declare-fun m!1184809 () Bool)

(assert (=> b!1292192 m!1184809))

(declare-fun m!1184811 () Bool)

(assert (=> b!1292194 m!1184811))

(declare-fun m!1184813 () Bool)

(assert (=> b!1292189 m!1184813))

(declare-fun m!1184815 () Bool)

(assert (=> b!1292189 m!1184815))

(declare-fun m!1184817 () Bool)

(assert (=> start!109230 m!1184817))

(declare-fun m!1184819 () Bool)

(assert (=> start!109230 m!1184819))

(declare-fun m!1184821 () Bool)

(assert (=> start!109230 m!1184821))

(declare-fun m!1184823 () Bool)

(assert (=> mapNonEmpty!53099 m!1184823))

(declare-fun m!1184825 () Bool)

(assert (=> b!1292186 m!1184825))

(declare-fun m!1184827 () Bool)

(assert (=> b!1292187 m!1184827))

(assert (=> b!1292187 m!1184827))

(declare-fun m!1184829 () Bool)

(assert (=> b!1292187 m!1184829))

(check-sat (not b!1292187) b_and!46809 tp_is_empty!34359 (not b!1292192) (not b!1292194) (not mapNonEmpty!53099) (not b!1292189) (not start!109230) (not b_next!28719) (not b!1292186))
(check-sat b_and!46809 (not b_next!28719))
