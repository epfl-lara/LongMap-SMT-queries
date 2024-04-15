; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109276 () Bool)

(assert start!109276)

(declare-fun b_free!28765 () Bool)

(declare-fun b_next!28765 () Bool)

(assert (=> start!109276 (= b_free!28765 (not b_next!28765))))

(declare-fun tp!101415 () Bool)

(declare-fun b_and!46837 () Bool)

(assert (=> start!109276 (= tp!101415 b_and!46837)))

(declare-fun mapNonEmpty!53168 () Bool)

(declare-fun mapRes!53168 () Bool)

(declare-fun tp!101414 () Bool)

(declare-fun e!737916 () Bool)

(assert (=> mapNonEmpty!53168 (= mapRes!53168 (and tp!101414 e!737916))))

(declare-datatypes ((V!50977 0))(
  ( (V!50978 (val!17277 Int)) )
))
(declare-datatypes ((ValueCell!16304 0))(
  ( (ValueCellFull!16304 (v!19879 V!50977)) (EmptyCell!16304) )
))
(declare-fun mapRest!53168 () (Array (_ BitVec 32) ValueCell!16304))

(declare-datatypes ((array!85725 0))(
  ( (array!85726 (arr!41364 (Array (_ BitVec 32) ValueCell!16304)) (size!41916 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85725)

(declare-fun mapValue!53168 () ValueCell!16304)

(declare-fun mapKey!53168 () (_ BitVec 32))

(assert (=> mapNonEmpty!53168 (= (arr!41364 _values!1445) (store mapRest!53168 mapKey!53168 mapValue!53168))))

(declare-fun b!1292908 () Bool)

(declare-fun e!737913 () Bool)

(declare-fun e!737912 () Bool)

(assert (=> b!1292908 (= e!737913 (and e!737912 mapRes!53168))))

(declare-fun condMapEmpty!53168 () Bool)

(declare-fun mapDefault!53168 () ValueCell!16304)

(assert (=> b!1292908 (= condMapEmpty!53168 (= (arr!41364 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16304)) mapDefault!53168)))))

(declare-fun b!1292909 () Bool)

(declare-fun res!859124 () Bool)

(declare-fun e!737915 () Bool)

(assert (=> b!1292909 (=> (not res!859124) (not e!737915))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85727 0))(
  ( (array!85728 (arr!41365 (Array (_ BitVec 32) (_ BitVec 64))) (size!41917 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85727)

(assert (=> b!1292909 (= res!859124 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41917 _keys!1741))))))

(declare-fun res!859123 () Bool)

(assert (=> start!109276 (=> (not res!859123) (not e!737915))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109276 (= res!859123 (validMask!0 mask!2175))))

(assert (=> start!109276 e!737915))

(declare-fun tp_is_empty!34405 () Bool)

(assert (=> start!109276 tp_is_empty!34405))

(assert (=> start!109276 true))

(declare-fun array_inv!31497 (array!85725) Bool)

(assert (=> start!109276 (and (array_inv!31497 _values!1445) e!737913)))

(declare-fun array_inv!31498 (array!85727) Bool)

(assert (=> start!109276 (array_inv!31498 _keys!1741)))

(assert (=> start!109276 tp!101415))

(declare-fun b!1292910 () Bool)

(declare-fun e!737911 () Bool)

(assert (=> b!1292910 (= e!737915 (not e!737911))))

(declare-fun res!859127 () Bool)

(assert (=> b!1292910 (=> res!859127 e!737911)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292910 (= res!859127 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22268 0))(
  ( (tuple2!22269 (_1!11145 (_ BitVec 64)) (_2!11145 V!50977)) )
))
(declare-datatypes ((List!29420 0))(
  ( (Nil!29417) (Cons!29416 (h!30625 tuple2!22268) (t!42976 List!29420)) )
))
(declare-datatypes ((ListLongMap!19925 0))(
  ( (ListLongMap!19926 (toList!9978 List!29420)) )
))
(declare-fun contains!8026 (ListLongMap!19925 (_ BitVec 64)) Bool)

(assert (=> b!1292910 (not (contains!8026 (ListLongMap!19926 Nil!29417) k0!1205))))

(declare-datatypes ((Unit!42636 0))(
  ( (Unit!42637) )
))
(declare-fun lt!579256 () Unit!42636)

(declare-fun emptyContainsNothing!115 ((_ BitVec 64)) Unit!42636)

(assert (=> b!1292910 (= lt!579256 (emptyContainsNothing!115 k0!1205))))

(declare-fun b!1292911 () Bool)

(declare-fun res!859122 () Bool)

(assert (=> b!1292911 (=> (not res!859122) (not e!737915))))

(declare-fun minValue!1387 () V!50977)

(declare-fun zeroValue!1387 () V!50977)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4918 (array!85727 array!85725 (_ BitVec 32) (_ BitVec 32) V!50977 V!50977 (_ BitVec 32) Int) ListLongMap!19925)

(assert (=> b!1292911 (= res!859122 (contains!8026 (getCurrentListMap!4918 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1292912 () Bool)

(assert (=> b!1292912 (= e!737912 tp_is_empty!34405)))

(declare-fun mapIsEmpty!53168 () Bool)

(assert (=> mapIsEmpty!53168 mapRes!53168))

(declare-fun b!1292913 () Bool)

(declare-fun res!859120 () Bool)

(assert (=> b!1292913 (=> (not res!859120) (not e!737915))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292913 (= res!859120 (not (validKeyInArray!0 (select (arr!41365 _keys!1741) from!2144))))))

(declare-fun b!1292914 () Bool)

(declare-fun res!859126 () Bool)

(assert (=> b!1292914 (=> (not res!859126) (not e!737915))))

(declare-datatypes ((List!29421 0))(
  ( (Nil!29418) (Cons!29417 (h!30626 (_ BitVec 64)) (t!42977 List!29421)) )
))
(declare-fun arrayNoDuplicates!0 (array!85727 (_ BitVec 32) List!29421) Bool)

(assert (=> b!1292914 (= res!859126 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29418))))

(declare-fun b!1292915 () Bool)

(declare-fun res!859125 () Bool)

(assert (=> b!1292915 (=> (not res!859125) (not e!737915))))

(assert (=> b!1292915 (= res!859125 (and (= (size!41916 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41917 _keys!1741) (size!41916 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292916 () Bool)

(assert (=> b!1292916 (= e!737916 tp_is_empty!34405)))

(declare-fun b!1292917 () Bool)

(declare-fun res!859128 () Bool)

(assert (=> b!1292917 (=> (not res!859128) (not e!737915))))

(assert (=> b!1292917 (= res!859128 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41917 _keys!1741))))))

(declare-fun b!1292918 () Bool)

(declare-fun res!859121 () Bool)

(assert (=> b!1292918 (=> (not res!859121) (not e!737915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85727 (_ BitVec 32)) Bool)

(assert (=> b!1292918 (= res!859121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292919 () Bool)

(assert (=> b!1292919 (= e!737911 true)))

(declare-fun lt!579255 () ListLongMap!19925)

(declare-fun +!4428 (ListLongMap!19925 tuple2!22268) ListLongMap!19925)

(assert (=> b!1292919 (not (contains!8026 (+!4428 lt!579255 (tuple2!22269 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-fun lt!579254 () Unit!42636)

(declare-fun addStillNotContains!405 (ListLongMap!19925 (_ BitVec 64) V!50977 (_ BitVec 64)) Unit!42636)

(assert (=> b!1292919 (= lt!579254 (addStillNotContains!405 lt!579255 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6060 (array!85727 array!85725 (_ BitVec 32) (_ BitVec 32) V!50977 V!50977 (_ BitVec 32) Int) ListLongMap!19925)

(assert (=> b!1292919 (= lt!579255 (getCurrentListMapNoExtraKeys!6060 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109276 res!859123) b!1292915))

(assert (= (and b!1292915 res!859125) b!1292918))

(assert (= (and b!1292918 res!859121) b!1292914))

(assert (= (and b!1292914 res!859126) b!1292909))

(assert (= (and b!1292909 res!859124) b!1292911))

(assert (= (and b!1292911 res!859122) b!1292917))

(assert (= (and b!1292917 res!859128) b!1292913))

(assert (= (and b!1292913 res!859120) b!1292910))

(assert (= (and b!1292910 (not res!859127)) b!1292919))

(assert (= (and b!1292908 condMapEmpty!53168) mapIsEmpty!53168))

(assert (= (and b!1292908 (not condMapEmpty!53168)) mapNonEmpty!53168))

(get-info :version)

(assert (= (and mapNonEmpty!53168 ((_ is ValueCellFull!16304) mapValue!53168)) b!1292916))

(assert (= (and b!1292908 ((_ is ValueCellFull!16304) mapDefault!53168)) b!1292912))

(assert (= start!109276 b!1292908))

(declare-fun m!1184919 () Bool)

(assert (=> b!1292918 m!1184919))

(declare-fun m!1184921 () Bool)

(assert (=> b!1292911 m!1184921))

(assert (=> b!1292911 m!1184921))

(declare-fun m!1184923 () Bool)

(assert (=> b!1292911 m!1184923))

(declare-fun m!1184925 () Bool)

(assert (=> start!109276 m!1184925))

(declare-fun m!1184927 () Bool)

(assert (=> start!109276 m!1184927))

(declare-fun m!1184929 () Bool)

(assert (=> start!109276 m!1184929))

(declare-fun m!1184931 () Bool)

(assert (=> b!1292914 m!1184931))

(declare-fun m!1184933 () Bool)

(assert (=> b!1292913 m!1184933))

(assert (=> b!1292913 m!1184933))

(declare-fun m!1184935 () Bool)

(assert (=> b!1292913 m!1184935))

(declare-fun m!1184937 () Bool)

(assert (=> b!1292919 m!1184937))

(assert (=> b!1292919 m!1184937))

(declare-fun m!1184939 () Bool)

(assert (=> b!1292919 m!1184939))

(declare-fun m!1184941 () Bool)

(assert (=> b!1292919 m!1184941))

(declare-fun m!1184943 () Bool)

(assert (=> b!1292919 m!1184943))

(declare-fun m!1184945 () Bool)

(assert (=> mapNonEmpty!53168 m!1184945))

(declare-fun m!1184947 () Bool)

(assert (=> b!1292910 m!1184947))

(declare-fun m!1184949 () Bool)

(assert (=> b!1292910 m!1184949))

(check-sat (not b!1292910) (not b!1292914) (not b!1292913) (not b!1292919) (not start!109276) (not mapNonEmpty!53168) b_and!46837 (not b_next!28765) tp_is_empty!34405 (not b!1292911) (not b!1292918))
(check-sat b_and!46837 (not b_next!28765))
