; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109198 () Bool)

(assert start!109198)

(declare-fun b_free!28687 () Bool)

(declare-fun b_next!28687 () Bool)

(assert (=> start!109198 (= b_free!28687 (not b_next!28687))))

(declare-fun tp!101180 () Bool)

(declare-fun b_and!46759 () Bool)

(assert (=> start!109198 (= tp!101180 b_and!46759)))

(declare-fun b!1291585 () Bool)

(declare-fun e!737290 () Bool)

(declare-fun e!737294 () Bool)

(assert (=> b!1291585 (= e!737290 (not e!737294))))

(declare-fun res!858151 () Bool)

(assert (=> b!1291585 (=> res!858151 e!737294)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291585 (= res!858151 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((V!50873 0))(
  ( (V!50874 (val!17238 Int)) )
))
(declare-datatypes ((tuple2!22208 0))(
  ( (tuple2!22209 (_1!11115 (_ BitVec 64)) (_2!11115 V!50873)) )
))
(declare-datatypes ((List!29362 0))(
  ( (Nil!29359) (Cons!29358 (h!30567 tuple2!22208) (t!42918 List!29362)) )
))
(declare-datatypes ((ListLongMap!19865 0))(
  ( (ListLongMap!19866 (toList!9948 List!29362)) )
))
(declare-fun contains!7996 (ListLongMap!19865 (_ BitVec 64)) Bool)

(assert (=> b!1291585 (not (contains!7996 (ListLongMap!19866 Nil!29359) k0!1205))))

(declare-datatypes ((Unit!42588 0))(
  ( (Unit!42589) )
))
(declare-fun lt!579055 () Unit!42588)

(declare-fun emptyContainsNothing!91 ((_ BitVec 64)) Unit!42588)

(assert (=> b!1291585 (= lt!579055 (emptyContainsNothing!91 k0!1205))))

(declare-fun b!1291586 () Bool)

(assert (=> b!1291586 (= e!737294 true)))

(assert (=> b!1291586 false))

(declare-fun minValue!1387 () V!50873)

(declare-fun lt!579058 () Unit!42588)

(declare-fun lt!579056 () ListLongMap!19865)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!63 ((_ BitVec 64) (_ BitVec 64) V!50873 ListLongMap!19865) Unit!42588)

(assert (=> b!1291586 (= lt!579058 (lemmaInListMapAfterAddingDiffThenInBefore!63 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579056))))

(declare-fun lt!579057 () ListLongMap!19865)

(declare-fun +!4422 (ListLongMap!19865 tuple2!22208) ListLongMap!19865)

(assert (=> b!1291586 (not (contains!7996 (+!4422 lt!579057 (tuple2!22209 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579054 () Unit!42588)

(declare-fun addStillNotContains!399 (ListLongMap!19865 (_ BitVec 64) V!50873 (_ BitVec 64)) Unit!42588)

(assert (=> b!1291586 (= lt!579054 (addStillNotContains!399 lt!579057 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(assert (=> b!1291586 (not (contains!7996 lt!579056 k0!1205))))

(declare-fun zeroValue!1387 () V!50873)

(assert (=> b!1291586 (= lt!579056 (+!4422 lt!579057 (tuple2!22209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579053 () Unit!42588)

(assert (=> b!1291586 (= lt!579053 (addStillNotContains!399 lt!579057 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16265 0))(
  ( (ValueCellFull!16265 (v!19840 V!50873)) (EmptyCell!16265) )
))
(declare-datatypes ((array!85571 0))(
  ( (array!85572 (arr!41287 (Array (_ BitVec 32) ValueCell!16265)) (size!41839 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85571)

(declare-datatypes ((array!85573 0))(
  ( (array!85574 (arr!41288 (Array (_ BitVec 32) (_ BitVec 64))) (size!41840 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85573)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6053 (array!85573 array!85571 (_ BitVec 32) (_ BitVec 32) V!50873 V!50873 (_ BitVec 32) Int) ListLongMap!19865)

(assert (=> b!1291586 (= lt!579057 (getCurrentListMapNoExtraKeys!6053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291587 () Bool)

(declare-fun res!858156 () Bool)

(assert (=> b!1291587 (=> (not res!858156) (not e!737290))))

(assert (=> b!1291587 (= res!858156 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41840 _keys!1741))))))

(declare-fun b!1291588 () Bool)

(declare-fun e!737292 () Bool)

(declare-fun tp_is_empty!34327 () Bool)

(assert (=> b!1291588 (= e!737292 tp_is_empty!34327)))

(declare-fun b!1291589 () Bool)

(declare-fun e!737291 () Bool)

(declare-fun mapRes!53051 () Bool)

(assert (=> b!1291589 (= e!737291 (and e!737292 mapRes!53051))))

(declare-fun condMapEmpty!53051 () Bool)

(declare-fun mapDefault!53051 () ValueCell!16265)

(assert (=> b!1291589 (= condMapEmpty!53051 (= (arr!41287 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16265)) mapDefault!53051)))))

(declare-fun b!1291590 () Bool)

(declare-fun res!858149 () Bool)

(assert (=> b!1291590 (=> (not res!858149) (not e!737290))))

(assert (=> b!1291590 (= res!858149 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41840 _keys!1741))))))

(declare-fun b!1291591 () Bool)

(declare-fun res!858153 () Bool)

(assert (=> b!1291591 (=> (not res!858153) (not e!737290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85573 (_ BitVec 32)) Bool)

(assert (=> b!1291591 (= res!858153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!858154 () Bool)

(assert (=> start!109198 (=> (not res!858154) (not e!737290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109198 (= res!858154 (validMask!0 mask!2175))))

(assert (=> start!109198 e!737290))

(assert (=> start!109198 tp_is_empty!34327))

(assert (=> start!109198 true))

(declare-fun array_inv!31445 (array!85571) Bool)

(assert (=> start!109198 (and (array_inv!31445 _values!1445) e!737291)))

(declare-fun array_inv!31446 (array!85573) Bool)

(assert (=> start!109198 (array_inv!31446 _keys!1741)))

(assert (=> start!109198 tp!101180))

(declare-fun mapNonEmpty!53051 () Bool)

(declare-fun tp!101181 () Bool)

(declare-fun e!737293 () Bool)

(assert (=> mapNonEmpty!53051 (= mapRes!53051 (and tp!101181 e!737293))))

(declare-fun mapKey!53051 () (_ BitVec 32))

(declare-fun mapValue!53051 () ValueCell!16265)

(declare-fun mapRest!53051 () (Array (_ BitVec 32) ValueCell!16265))

(assert (=> mapNonEmpty!53051 (= (arr!41287 _values!1445) (store mapRest!53051 mapKey!53051 mapValue!53051))))

(declare-fun b!1291592 () Bool)

(assert (=> b!1291592 (= e!737293 tp_is_empty!34327)))

(declare-fun b!1291593 () Bool)

(declare-fun res!858152 () Bool)

(assert (=> b!1291593 (=> (not res!858152) (not e!737290))))

(declare-datatypes ((List!29363 0))(
  ( (Nil!29360) (Cons!29359 (h!30568 (_ BitVec 64)) (t!42919 List!29363)) )
))
(declare-fun arrayNoDuplicates!0 (array!85573 (_ BitVec 32) List!29363) Bool)

(assert (=> b!1291593 (= res!858152 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29360))))

(declare-fun b!1291594 () Bool)

(declare-fun res!858155 () Bool)

(assert (=> b!1291594 (=> (not res!858155) (not e!737290))))

(assert (=> b!1291594 (= res!858155 (and (= (size!41839 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41840 _keys!1741) (size!41839 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291595 () Bool)

(declare-fun res!858150 () Bool)

(assert (=> b!1291595 (=> (not res!858150) (not e!737290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291595 (= res!858150 (not (validKeyInArray!0 (select (arr!41288 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53051 () Bool)

(assert (=> mapIsEmpty!53051 mapRes!53051))

(declare-fun b!1291596 () Bool)

(declare-fun res!858148 () Bool)

(assert (=> b!1291596 (=> (not res!858148) (not e!737290))))

(declare-fun getCurrentListMap!4894 (array!85573 array!85571 (_ BitVec 32) (_ BitVec 32) V!50873 V!50873 (_ BitVec 32) Int) ListLongMap!19865)

(assert (=> b!1291596 (= res!858148 (contains!7996 (getCurrentListMap!4894 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109198 res!858154) b!1291594))

(assert (= (and b!1291594 res!858155) b!1291591))

(assert (= (and b!1291591 res!858153) b!1291593))

(assert (= (and b!1291593 res!858152) b!1291587))

(assert (= (and b!1291587 res!858156) b!1291596))

(assert (= (and b!1291596 res!858148) b!1291590))

(assert (= (and b!1291590 res!858149) b!1291595))

(assert (= (and b!1291595 res!858150) b!1291585))

(assert (= (and b!1291585 (not res!858151)) b!1291586))

(assert (= (and b!1291589 condMapEmpty!53051) mapIsEmpty!53051))

(assert (= (and b!1291589 (not condMapEmpty!53051)) mapNonEmpty!53051))

(get-info :version)

(assert (= (and mapNonEmpty!53051 ((_ is ValueCellFull!16265) mapValue!53051)) b!1291592))

(assert (= (and b!1291589 ((_ is ValueCellFull!16265) mapDefault!53051)) b!1291588))

(assert (= start!109198 b!1291589))

(declare-fun m!1183875 () Bool)

(assert (=> b!1291591 m!1183875))

(declare-fun m!1183877 () Bool)

(assert (=> b!1291586 m!1183877))

(declare-fun m!1183879 () Bool)

(assert (=> b!1291586 m!1183879))

(declare-fun m!1183881 () Bool)

(assert (=> b!1291586 m!1183881))

(declare-fun m!1183883 () Bool)

(assert (=> b!1291586 m!1183883))

(declare-fun m!1183885 () Bool)

(assert (=> b!1291586 m!1183885))

(declare-fun m!1183887 () Bool)

(assert (=> b!1291586 m!1183887))

(assert (=> b!1291586 m!1183883))

(declare-fun m!1183889 () Bool)

(assert (=> b!1291586 m!1183889))

(declare-fun m!1183891 () Bool)

(assert (=> b!1291586 m!1183891))

(declare-fun m!1183893 () Bool)

(assert (=> b!1291596 m!1183893))

(assert (=> b!1291596 m!1183893))

(declare-fun m!1183895 () Bool)

(assert (=> b!1291596 m!1183895))

(declare-fun m!1183897 () Bool)

(assert (=> b!1291593 m!1183897))

(declare-fun m!1183899 () Bool)

(assert (=> b!1291585 m!1183899))

(declare-fun m!1183901 () Bool)

(assert (=> b!1291585 m!1183901))

(declare-fun m!1183903 () Bool)

(assert (=> mapNonEmpty!53051 m!1183903))

(declare-fun m!1183905 () Bool)

(assert (=> start!109198 m!1183905))

(declare-fun m!1183907 () Bool)

(assert (=> start!109198 m!1183907))

(declare-fun m!1183909 () Bool)

(assert (=> start!109198 m!1183909))

(declare-fun m!1183911 () Bool)

(assert (=> b!1291595 m!1183911))

(assert (=> b!1291595 m!1183911))

(declare-fun m!1183913 () Bool)

(assert (=> b!1291595 m!1183913))

(check-sat (not b!1291595) (not b!1291585) (not start!109198) (not b_next!28687) b_and!46759 (not b!1291586) tp_is_empty!34327 (not b!1291593) (not b!1291596) (not mapNonEmpty!53051) (not b!1291591))
(check-sat b_and!46759 (not b_next!28687))
