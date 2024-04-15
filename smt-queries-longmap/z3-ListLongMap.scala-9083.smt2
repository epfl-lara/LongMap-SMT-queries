; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109282 () Bool)

(assert start!109282)

(declare-fun b_free!28771 () Bool)

(declare-fun b_next!28771 () Bool)

(assert (=> start!109282 (= b_free!28771 (not b_next!28771))))

(declare-fun tp!101432 () Bool)

(declare-fun b_and!46843 () Bool)

(assert (=> start!109282 (= tp!101432 b_and!46843)))

(declare-fun b!1293016 () Bool)

(declare-fun e!737966 () Bool)

(declare-fun e!737965 () Bool)

(declare-fun mapRes!53177 () Bool)

(assert (=> b!1293016 (= e!737966 (and e!737965 mapRes!53177))))

(declare-fun condMapEmpty!53177 () Bool)

(declare-datatypes ((V!50985 0))(
  ( (V!50986 (val!17280 Int)) )
))
(declare-datatypes ((ValueCell!16307 0))(
  ( (ValueCellFull!16307 (v!19882 V!50985)) (EmptyCell!16307) )
))
(declare-datatypes ((array!85737 0))(
  ( (array!85738 (arr!41370 (Array (_ BitVec 32) ValueCell!16307)) (size!41922 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85737)

(declare-fun mapDefault!53177 () ValueCell!16307)

(assert (=> b!1293016 (= condMapEmpty!53177 (= (arr!41370 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16307)) mapDefault!53177)))))

(declare-fun res!859203 () Bool)

(declare-fun e!737967 () Bool)

(assert (=> start!109282 (=> (not res!859203) (not e!737967))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109282 (= res!859203 (validMask!0 mask!2175))))

(assert (=> start!109282 e!737967))

(declare-fun tp_is_empty!34411 () Bool)

(assert (=> start!109282 tp_is_empty!34411))

(assert (=> start!109282 true))

(declare-fun array_inv!31503 (array!85737) Bool)

(assert (=> start!109282 (and (array_inv!31503 _values!1445) e!737966)))

(declare-datatypes ((array!85739 0))(
  ( (array!85740 (arr!41371 (Array (_ BitVec 32) (_ BitVec 64))) (size!41923 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85739)

(declare-fun array_inv!31504 (array!85739) Bool)

(assert (=> start!109282 (array_inv!31504 _keys!1741)))

(assert (=> start!109282 tp!101432))

(declare-fun b!1293017 () Bool)

(declare-fun res!859204 () Bool)

(assert (=> b!1293017 (=> (not res!859204) (not e!737967))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85739 (_ BitVec 32)) Bool)

(assert (=> b!1293017 (= res!859204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293018 () Bool)

(declare-fun res!859206 () Bool)

(assert (=> b!1293018 (=> (not res!859206) (not e!737967))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1293018 (= res!859206 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41923 _keys!1741))))))

(declare-fun b!1293019 () Bool)

(declare-fun res!859202 () Bool)

(assert (=> b!1293019 (=> (not res!859202) (not e!737967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293019 (= res!859202 (not (validKeyInArray!0 (select (arr!41371 _keys!1741) from!2144))))))

(declare-fun b!1293020 () Bool)

(declare-fun res!859201 () Bool)

(assert (=> b!1293020 (=> (not res!859201) (not e!737967))))

(assert (=> b!1293020 (= res!859201 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41923 _keys!1741))))))

(declare-fun mapIsEmpty!53177 () Bool)

(assert (=> mapIsEmpty!53177 mapRes!53177))

(declare-fun b!1293021 () Bool)

(declare-fun res!859207 () Bool)

(assert (=> b!1293021 (=> (not res!859207) (not e!737967))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293021 (= res!859207 (and (= (size!41922 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41923 _keys!1741) (size!41922 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293022 () Bool)

(assert (=> b!1293022 (= e!737965 tp_is_empty!34411)))

(declare-fun b!1293023 () Bool)

(declare-fun e!737970 () Bool)

(assert (=> b!1293023 (= e!737970 tp_is_empty!34411)))

(declare-fun b!1293024 () Bool)

(declare-fun e!737968 () Bool)

(assert (=> b!1293024 (= e!737968 true)))

(declare-datatypes ((tuple2!22274 0))(
  ( (tuple2!22275 (_1!11148 (_ BitVec 64)) (_2!11148 V!50985)) )
))
(declare-datatypes ((List!29425 0))(
  ( (Nil!29422) (Cons!29421 (h!30630 tuple2!22274) (t!42981 List!29425)) )
))
(declare-datatypes ((ListLongMap!19931 0))(
  ( (ListLongMap!19932 (toList!9981 List!29425)) )
))
(declare-fun lt!579281 () ListLongMap!19931)

(declare-fun zeroValue!1387 () V!50985)

(declare-fun contains!8029 (ListLongMap!19931 (_ BitVec 64)) Bool)

(declare-fun +!4430 (ListLongMap!19931 tuple2!22274) ListLongMap!19931)

(assert (=> b!1293024 (not (contains!8029 (+!4430 lt!579281 (tuple2!22275 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k0!1205))))

(declare-datatypes ((Unit!42642 0))(
  ( (Unit!42643) )
))
(declare-fun lt!579283 () Unit!42642)

(declare-fun addStillNotContains!407 (ListLongMap!19931 (_ BitVec 64) V!50985 (_ BitVec 64)) Unit!42642)

(assert (=> b!1293024 (= lt!579283 (addStillNotContains!407 lt!579281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k0!1205))))

(declare-fun minValue!1387 () V!50985)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6062 (array!85739 array!85737 (_ BitVec 32) (_ BitVec 32) V!50985 V!50985 (_ BitVec 32) Int) ListLongMap!19931)

(assert (=> b!1293024 (= lt!579281 (getCurrentListMapNoExtraKeys!6062 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293025 () Bool)

(declare-fun res!859208 () Bool)

(assert (=> b!1293025 (=> (not res!859208) (not e!737967))))

(declare-datatypes ((List!29426 0))(
  ( (Nil!29423) (Cons!29422 (h!30631 (_ BitVec 64)) (t!42982 List!29426)) )
))
(declare-fun arrayNoDuplicates!0 (array!85739 (_ BitVec 32) List!29426) Bool)

(assert (=> b!1293025 (= res!859208 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29423))))

(declare-fun b!1293026 () Bool)

(assert (=> b!1293026 (= e!737967 (not e!737968))))

(declare-fun res!859209 () Bool)

(assert (=> b!1293026 (=> res!859209 e!737968)))

(assert (=> b!1293026 (= res!859209 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293026 (not (contains!8029 (ListLongMap!19932 Nil!29422) k0!1205))))

(declare-fun lt!579282 () Unit!42642)

(declare-fun emptyContainsNothing!118 ((_ BitVec 64)) Unit!42642)

(assert (=> b!1293026 (= lt!579282 (emptyContainsNothing!118 k0!1205))))

(declare-fun b!1293027 () Bool)

(declare-fun res!859205 () Bool)

(assert (=> b!1293027 (=> (not res!859205) (not e!737967))))

(declare-fun getCurrentListMap!4920 (array!85739 array!85737 (_ BitVec 32) (_ BitVec 32) V!50985 V!50985 (_ BitVec 32) Int) ListLongMap!19931)

(assert (=> b!1293027 (= res!859205 (contains!8029 (getCurrentListMap!4920 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!53177 () Bool)

(declare-fun tp!101433 () Bool)

(assert (=> mapNonEmpty!53177 (= mapRes!53177 (and tp!101433 e!737970))))

(declare-fun mapKey!53177 () (_ BitVec 32))

(declare-fun mapValue!53177 () ValueCell!16307)

(declare-fun mapRest!53177 () (Array (_ BitVec 32) ValueCell!16307))

(assert (=> mapNonEmpty!53177 (= (arr!41370 _values!1445) (store mapRest!53177 mapKey!53177 mapValue!53177))))

(assert (= (and start!109282 res!859203) b!1293021))

(assert (= (and b!1293021 res!859207) b!1293017))

(assert (= (and b!1293017 res!859204) b!1293025))

(assert (= (and b!1293025 res!859208) b!1293020))

(assert (= (and b!1293020 res!859201) b!1293027))

(assert (= (and b!1293027 res!859205) b!1293018))

(assert (= (and b!1293018 res!859206) b!1293019))

(assert (= (and b!1293019 res!859202) b!1293026))

(assert (= (and b!1293026 (not res!859209)) b!1293024))

(assert (= (and b!1293016 condMapEmpty!53177) mapIsEmpty!53177))

(assert (= (and b!1293016 (not condMapEmpty!53177)) mapNonEmpty!53177))

(get-info :version)

(assert (= (and mapNonEmpty!53177 ((_ is ValueCellFull!16307) mapValue!53177)) b!1293023))

(assert (= (and b!1293016 ((_ is ValueCellFull!16307) mapDefault!53177)) b!1293022))

(assert (= start!109282 b!1293016))

(declare-fun m!1185015 () Bool)

(assert (=> b!1293025 m!1185015))

(declare-fun m!1185017 () Bool)

(assert (=> b!1293024 m!1185017))

(assert (=> b!1293024 m!1185017))

(declare-fun m!1185019 () Bool)

(assert (=> b!1293024 m!1185019))

(declare-fun m!1185021 () Bool)

(assert (=> b!1293024 m!1185021))

(declare-fun m!1185023 () Bool)

(assert (=> b!1293024 m!1185023))

(declare-fun m!1185025 () Bool)

(assert (=> b!1293027 m!1185025))

(assert (=> b!1293027 m!1185025))

(declare-fun m!1185027 () Bool)

(assert (=> b!1293027 m!1185027))

(declare-fun m!1185029 () Bool)

(assert (=> start!109282 m!1185029))

(declare-fun m!1185031 () Bool)

(assert (=> start!109282 m!1185031))

(declare-fun m!1185033 () Bool)

(assert (=> start!109282 m!1185033))

(declare-fun m!1185035 () Bool)

(assert (=> b!1293019 m!1185035))

(assert (=> b!1293019 m!1185035))

(declare-fun m!1185037 () Bool)

(assert (=> b!1293019 m!1185037))

(declare-fun m!1185039 () Bool)

(assert (=> b!1293026 m!1185039))

(declare-fun m!1185041 () Bool)

(assert (=> b!1293026 m!1185041))

(declare-fun m!1185043 () Bool)

(assert (=> mapNonEmpty!53177 m!1185043))

(declare-fun m!1185045 () Bool)

(assert (=> b!1293017 m!1185045))

(check-sat (not b!1293027) (not b!1293017) (not b_next!28771) (not b!1293024) (not b!1293026) (not b!1293019) (not start!109282) (not b!1293025) tp_is_empty!34411 (not mapNonEmpty!53177) b_and!46843)
(check-sat b_and!46843 (not b_next!28771))
