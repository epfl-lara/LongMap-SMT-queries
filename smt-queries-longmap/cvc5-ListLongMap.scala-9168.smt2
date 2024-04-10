; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110158 () Bool)

(assert start!110158)

(declare-fun b_free!29281 () Bool)

(declare-fun b_next!29281 () Bool)

(assert (=> start!110158 (= b_free!29281 (not b_next!29281))))

(declare-fun tp!103001 () Bool)

(declare-fun b_and!47461 () Bool)

(assert (=> start!110158 (= tp!103001 b_and!47461)))

(declare-fun b!1304272 () Bool)

(declare-fun res!866206 () Bool)

(declare-fun e!743964 () Bool)

(assert (=> b!1304272 (=> (not res!866206) (not e!743964))))

(declare-datatypes ((array!86856 0))(
  ( (array!86857 (arr!41917 (Array (_ BitVec 32) (_ BitVec 64))) (size!42467 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86856)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86856 (_ BitVec 32)) Bool)

(assert (=> b!1304272 (= res!866206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304273 () Bool)

(declare-fun e!743963 () Bool)

(assert (=> b!1304273 (= e!743964 (not e!743963))))

(declare-fun res!866202 () Bool)

(assert (=> b!1304273 (=> res!866202 e!743963)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304273 (= res!866202 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51665 0))(
  ( (V!51666 (val!17535 Int)) )
))
(declare-datatypes ((tuple2!22632 0))(
  ( (tuple2!22633 (_1!11327 (_ BitVec 64)) (_2!11327 V!51665)) )
))
(declare-datatypes ((List!29754 0))(
  ( (Nil!29751) (Cons!29750 (h!30959 tuple2!22632) (t!43352 List!29754)) )
))
(declare-datatypes ((ListLongMap!20289 0))(
  ( (ListLongMap!20290 (toList!10160 List!29754)) )
))
(declare-fun contains!8300 (ListLongMap!20289 (_ BitVec 64)) Bool)

(assert (=> b!1304273 (not (contains!8300 (ListLongMap!20290 Nil!29751) k!1205))))

(declare-datatypes ((Unit!43188 0))(
  ( (Unit!43189) )
))
(declare-fun lt!583757 () Unit!43188)

(declare-fun emptyContainsNothing!223 ((_ BitVec 64)) Unit!43188)

(assert (=> b!1304273 (= lt!583757 (emptyContainsNothing!223 k!1205))))

(declare-fun b!1304274 () Bool)

(declare-fun res!866201 () Bool)

(assert (=> b!1304274 (=> (not res!866201) (not e!743964))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1304274 (= res!866201 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42467 _keys!1741))))))

(declare-fun b!1304275 () Bool)

(assert (=> b!1304275 (= e!743963 true)))

(declare-fun lt!583758 () ListLongMap!20289)

(declare-fun zeroValue!1387 () V!51665)

(declare-fun +!4483 (ListLongMap!20289 tuple2!22632) ListLongMap!20289)

(assert (=> b!1304275 (not (contains!8300 (+!4483 lt!583758 (tuple2!22633 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!583756 () Unit!43188)

(declare-fun addStillNotContains!480 (ListLongMap!20289 (_ BitVec 64) V!51665 (_ BitVec 64)) Unit!43188)

(assert (=> b!1304275 (= lt!583756 (addStillNotContains!480 lt!583758 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!51665)

(declare-datatypes ((ValueCell!16562 0))(
  ( (ValueCellFull!16562 (v!20154 V!51665)) (EmptyCell!16562) )
))
(declare-datatypes ((array!86858 0))(
  ( (array!86859 (arr!41918 (Array (_ BitVec 32) ValueCell!16562)) (size!42468 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86858)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6118 (array!86856 array!86858 (_ BitVec 32) (_ BitVec 32) V!51665 V!51665 (_ BitVec 32) Int) ListLongMap!20289)

(assert (=> b!1304275 (= lt!583758 (getCurrentListMapNoExtraKeys!6118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304276 () Bool)

(declare-fun res!866205 () Bool)

(assert (=> b!1304276 (=> (not res!866205) (not e!743964))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304276 (= res!866205 (not (validKeyInArray!0 (select (arr!41917 _keys!1741) from!2144))))))

(declare-fun b!1304277 () Bool)

(declare-fun e!743960 () Bool)

(declare-fun tp_is_empty!34921 () Bool)

(assert (=> b!1304277 (= e!743960 tp_is_empty!34921)))

(declare-fun b!1304278 () Bool)

(declare-fun res!866203 () Bool)

(assert (=> b!1304278 (=> (not res!866203) (not e!743964))))

(assert (=> b!1304278 (= res!866203 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42467 _keys!1741))))))

(declare-fun b!1304279 () Bool)

(declare-fun res!866204 () Bool)

(assert (=> b!1304279 (=> (not res!866204) (not e!743964))))

(assert (=> b!1304279 (= res!866204 (and (= (size!42468 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42467 _keys!1741) (size!42468 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304280 () Bool)

(declare-fun e!743961 () Bool)

(declare-fun e!743962 () Bool)

(declare-fun mapRes!53981 () Bool)

(assert (=> b!1304280 (= e!743961 (and e!743962 mapRes!53981))))

(declare-fun condMapEmpty!53981 () Bool)

(declare-fun mapDefault!53981 () ValueCell!16562)

