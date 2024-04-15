; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109414 () Bool)

(assert start!109414)

(declare-fun b_free!28903 () Bool)

(declare-fun b_next!28903 () Bool)

(assert (=> start!109414 (= b_free!28903 (not b_next!28903))))

(declare-fun tp!101829 () Bool)

(declare-fun b_and!46975 () Bool)

(assert (=> start!109414 (= tp!101829 b_and!46975)))

(declare-fun b!1295311 () Bool)

(declare-fun res!860908 () Bool)

(declare-fun e!739072 () Bool)

(assert (=> b!1295311 (=> (not res!860908) (not e!739072))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51161 0))(
  ( (V!51162 (val!17346 Int)) )
))
(declare-datatypes ((ValueCell!16373 0))(
  ( (ValueCellFull!16373 (v!19948 V!51161)) (EmptyCell!16373) )
))
(declare-datatypes ((array!85999 0))(
  ( (array!86000 (arr!41501 (Array (_ BitVec 32) ValueCell!16373)) (size!42053 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85999)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86001 0))(
  ( (array!86002 (arr!41502 (Array (_ BitVec 32) (_ BitVec 64))) (size!42054 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86001)

(assert (=> b!1295311 (= res!860908 (and (= (size!42053 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42054 _keys!1741) (size!42053 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!53375 () Bool)

(declare-fun mapRes!53375 () Bool)

(declare-fun tp!101828 () Bool)

(declare-fun e!739073 () Bool)

(assert (=> mapNonEmpty!53375 (= mapRes!53375 (and tp!101828 e!739073))))

(declare-fun mapKey!53375 () (_ BitVec 32))

(declare-fun mapValue!53375 () ValueCell!16373)

(declare-fun mapRest!53375 () (Array (_ BitVec 32) ValueCell!16373))

(assert (=> mapNonEmpty!53375 (= (arr!41501 _values!1445) (store mapRest!53375 mapKey!53375 mapValue!53375))))

(declare-fun b!1295313 () Bool)

(declare-fun res!860910 () Bool)

(assert (=> b!1295313 (=> (not res!860910) (not e!739072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86001 (_ BitVec 32)) Bool)

(assert (=> b!1295313 (= res!860910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295314 () Bool)

(declare-fun res!860905 () Bool)

(assert (=> b!1295314 (=> (not res!860905) (not e!739072))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1295314 (= res!860905 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42054 _keys!1741))))))

(declare-fun b!1295315 () Bool)

(declare-fun res!860904 () Bool)

(assert (=> b!1295315 (=> (not res!860904) (not e!739072))))

(assert (=> b!1295315 (= res!860904 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42054 _keys!1741))))))

(declare-fun b!1295316 () Bool)

(declare-fun res!860902 () Bool)

(assert (=> b!1295316 (=> (not res!860902) (not e!739072))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295316 (= res!860902 (not (validKeyInArray!0 (select (arr!41502 _keys!1741) from!2144))))))

(declare-fun b!1295312 () Bool)

(declare-fun res!860907 () Bool)

(assert (=> b!1295312 (=> (not res!860907) (not e!739072))))

(declare-datatypes ((List!29521 0))(
  ( (Nil!29518) (Cons!29517 (h!30726 (_ BitVec 64)) (t!43077 List!29521)) )
))
(declare-fun arrayNoDuplicates!0 (array!86001 (_ BitVec 32) List!29521) Bool)

(assert (=> b!1295312 (= res!860907 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29518))))

(declare-fun res!860909 () Bool)

(assert (=> start!109414 (=> (not res!860909) (not e!739072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109414 (= res!860909 (validMask!0 mask!2175))))

(assert (=> start!109414 e!739072))

(declare-fun tp_is_empty!34543 () Bool)

(assert (=> start!109414 tp_is_empty!34543))

(assert (=> start!109414 true))

(declare-fun e!739075 () Bool)

(declare-fun array_inv!31589 (array!85999) Bool)

(assert (=> start!109414 (and (array_inv!31589 _values!1445) e!739075)))

(declare-fun array_inv!31590 (array!86001) Bool)

(assert (=> start!109414 (array_inv!31590 _keys!1741)))

(assert (=> start!109414 tp!101829))

(declare-fun b!1295317 () Bool)

(assert (=> b!1295317 (= e!739073 tp_is_empty!34543)))

(declare-fun b!1295318 () Bool)

(declare-fun e!739077 () Bool)

(assert (=> b!1295318 (= e!739077 tp_is_empty!34543)))

(declare-fun b!1295319 () Bool)

(declare-fun res!860903 () Bool)

(assert (=> b!1295319 (=> (not res!860903) (not e!739072))))

(declare-fun minValue!1387 () V!51161)

(declare-fun zeroValue!1387 () V!51161)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22388 0))(
  ( (tuple2!22389 (_1!11205 (_ BitVec 64)) (_2!11205 V!51161)) )
))
(declare-datatypes ((List!29522 0))(
  ( (Nil!29519) (Cons!29518 (h!30727 tuple2!22388) (t!43078 List!29522)) )
))
(declare-datatypes ((ListLongMap!20045 0))(
  ( (ListLongMap!20046 (toList!10038 List!29522)) )
))
(declare-fun contains!8086 (ListLongMap!20045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4964 (array!86001 array!85999 (_ BitVec 32) (_ BitVec 32) V!51161 V!51161 (_ BitVec 32) Int) ListLongMap!20045)

(assert (=> b!1295319 (= res!860903 (contains!8086 (getCurrentListMap!4964 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1295320 () Bool)

(declare-fun e!739074 () Bool)

(assert (=> b!1295320 (= e!739072 (not e!739074))))

(declare-fun res!860906 () Bool)

(assert (=> b!1295320 (=> res!860906 e!739074)))

(assert (=> b!1295320 (= res!860906 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295320 (not (contains!8086 (ListLongMap!20046 Nil!29519) k0!1205))))

(declare-datatypes ((Unit!42746 0))(
  ( (Unit!42747) )
))
(declare-fun lt!579706 () Unit!42746)

(declare-fun emptyContainsNothing!166 ((_ BitVec 64)) Unit!42746)

(assert (=> b!1295320 (= lt!579706 (emptyContainsNothing!166 k0!1205))))

(declare-fun mapIsEmpty!53375 () Bool)

(assert (=> mapIsEmpty!53375 mapRes!53375))

(declare-fun b!1295321 () Bool)

(assert (=> b!1295321 (= e!739075 (and e!739077 mapRes!53375))))

(declare-fun condMapEmpty!53375 () Bool)

(declare-fun mapDefault!53375 () ValueCell!16373)

(assert (=> b!1295321 (= condMapEmpty!53375 (= (arr!41501 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16373)) mapDefault!53375)))))

(declare-fun b!1295322 () Bool)

(assert (=> b!1295322 (= e!739074 true)))

(declare-fun lt!579705 () ListLongMap!20045)

(declare-fun +!4453 (ListLongMap!20045 tuple2!22388) ListLongMap!20045)

(assert (=> b!1295322 (not (contains!8086 (+!4453 lt!579705 (tuple2!22389 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205))))

(declare-fun lt!579704 () Unit!42746)

(declare-fun addStillNotContains!430 (ListLongMap!20045 (_ BitVec 64) V!51161 (_ BitVec 64)) Unit!42746)

(assert (=> b!1295322 (= lt!579704 (addStillNotContains!430 lt!579705 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k0!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6087 (array!86001 array!85999 (_ BitVec 32) (_ BitVec 32) V!51161 V!51161 (_ BitVec 32) Int) ListLongMap!20045)

(assert (=> b!1295322 (= lt!579705 (getCurrentListMapNoExtraKeys!6087 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(assert (= (and start!109414 res!860909) b!1295311))

(assert (= (and b!1295311 res!860908) b!1295313))

(assert (= (and b!1295313 res!860910) b!1295312))

(assert (= (and b!1295312 res!860907) b!1295315))

(assert (= (and b!1295315 res!860904) b!1295319))

(assert (= (and b!1295319 res!860903) b!1295314))

(assert (= (and b!1295314 res!860905) b!1295316))

(assert (= (and b!1295316 res!860902) b!1295320))

(assert (= (and b!1295320 (not res!860906)) b!1295322))

(assert (= (and b!1295321 condMapEmpty!53375) mapIsEmpty!53375))

(assert (= (and b!1295321 (not condMapEmpty!53375)) mapNonEmpty!53375))

(get-info :version)

(assert (= (and mapNonEmpty!53375 ((_ is ValueCellFull!16373) mapValue!53375)) b!1295317))

(assert (= (and b!1295321 ((_ is ValueCellFull!16373) mapDefault!53375)) b!1295318))

(assert (= start!109414 b!1295321))

(declare-fun m!1186899 () Bool)

(assert (=> start!109414 m!1186899))

(declare-fun m!1186901 () Bool)

(assert (=> start!109414 m!1186901))

(declare-fun m!1186903 () Bool)

(assert (=> start!109414 m!1186903))

(declare-fun m!1186905 () Bool)

(assert (=> b!1295320 m!1186905))

(declare-fun m!1186907 () Bool)

(assert (=> b!1295320 m!1186907))

(declare-fun m!1186909 () Bool)

(assert (=> b!1295322 m!1186909))

(assert (=> b!1295322 m!1186909))

(declare-fun m!1186911 () Bool)

(assert (=> b!1295322 m!1186911))

(declare-fun m!1186913 () Bool)

(assert (=> b!1295322 m!1186913))

(declare-fun m!1186915 () Bool)

(assert (=> b!1295322 m!1186915))

(declare-fun m!1186917 () Bool)

(assert (=> b!1295312 m!1186917))

(declare-fun m!1186919 () Bool)

(assert (=> b!1295313 m!1186919))

(declare-fun m!1186921 () Bool)

(assert (=> b!1295316 m!1186921))

(assert (=> b!1295316 m!1186921))

(declare-fun m!1186923 () Bool)

(assert (=> b!1295316 m!1186923))

(declare-fun m!1186925 () Bool)

(assert (=> b!1295319 m!1186925))

(assert (=> b!1295319 m!1186925))

(declare-fun m!1186927 () Bool)

(assert (=> b!1295319 m!1186927))

(declare-fun m!1186929 () Bool)

(assert (=> mapNonEmpty!53375 m!1186929))

(check-sat (not mapNonEmpty!53375) (not b!1295320) (not b!1295319) b_and!46975 (not start!109414) tp_is_empty!34543 (not b!1295312) (not b!1295313) (not b!1295316) (not b!1295322) (not b_next!28903))
(check-sat b_and!46975 (not b_next!28903))
