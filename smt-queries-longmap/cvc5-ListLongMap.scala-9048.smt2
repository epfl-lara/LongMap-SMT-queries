; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109072 () Bool)

(assert start!109072)

(declare-fun b_free!28561 () Bool)

(declare-fun b_next!28561 () Bool)

(assert (=> start!109072 (= b_free!28561 (not b_next!28561))))

(declare-fun tp!100801 () Bool)

(declare-fun b_and!46651 () Bool)

(assert (=> start!109072 (= tp!100801 b_and!46651)))

(declare-fun b!1289381 () Bool)

(declare-fun e!736188 () Bool)

(declare-fun e!736190 () Bool)

(assert (=> b!1289381 (= e!736188 (not e!736190))))

(declare-fun res!856482 () Bool)

(assert (=> b!1289381 (=> res!856482 e!736190)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289381 (= res!856482 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50705 0))(
  ( (V!50706 (val!17175 Int)) )
))
(declare-datatypes ((tuple2!22060 0))(
  ( (tuple2!22061 (_1!11041 (_ BitVec 64)) (_2!11041 V!50705)) )
))
(declare-datatypes ((List!29229 0))(
  ( (Nil!29226) (Cons!29225 (h!30434 tuple2!22060) (t!42793 List!29229)) )
))
(declare-datatypes ((ListLongMap!19717 0))(
  ( (ListLongMap!19718 (toList!9874 List!29229)) )
))
(declare-fun contains!7992 (ListLongMap!19717 (_ BitVec 64)) Bool)

(assert (=> b!1289381 (not (contains!7992 (ListLongMap!19718 Nil!29226) k!1205))))

(declare-datatypes ((Unit!42666 0))(
  ( (Unit!42667) )
))
(declare-fun lt!578240 () Unit!42666)

(declare-fun emptyContainsNothing!61 ((_ BitVec 64)) Unit!42666)

(assert (=> b!1289381 (= lt!578240 (emptyContainsNothing!61 k!1205))))

(declare-fun b!1289382 () Bool)

(declare-fun res!856478 () Bool)

(assert (=> b!1289382 (=> (not res!856478) (not e!736188))))

(declare-fun minValue!1387 () V!50705)

(declare-fun zeroValue!1387 () V!50705)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16202 0))(
  ( (ValueCellFull!16202 (v!19778 V!50705)) (EmptyCell!16202) )
))
(declare-datatypes ((array!85444 0))(
  ( (array!85445 (arr!41223 (Array (_ BitVec 32) ValueCell!16202)) (size!41773 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85444)

(declare-datatypes ((array!85446 0))(
  ( (array!85447 (arr!41224 (Array (_ BitVec 32) (_ BitVec 64))) (size!41774 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85446)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMap!4934 (array!85446 array!85444 (_ BitVec 32) (_ BitVec 32) V!50705 V!50705 (_ BitVec 32) Int) ListLongMap!19717)

(assert (=> b!1289382 (= res!856478 (contains!7992 (getCurrentListMap!4934 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289383 () Bool)

(declare-fun res!856480 () Bool)

(assert (=> b!1289383 (=> (not res!856480) (not e!736188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85446 (_ BitVec 32)) Bool)

(assert (=> b!1289383 (= res!856480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289384 () Bool)

(assert (=> b!1289384 (= e!736190 true)))

(declare-fun lt!578238 () ListLongMap!19717)

(declare-fun +!4346 (ListLongMap!19717 tuple2!22060) ListLongMap!19717)

(assert (=> b!1289384 (not (contains!7992 (+!4346 lt!578238 (tuple2!22061 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578237 () Unit!42666)

(declare-fun addStillNotContains!364 (ListLongMap!19717 (_ BitVec 64) V!50705 (_ BitVec 64)) Unit!42666)

(assert (=> b!1289384 (= lt!578237 (addStillNotContains!364 lt!578238 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1289384 (not (contains!7992 (+!4346 lt!578238 (tuple2!22061 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578239 () Unit!42666)

(assert (=> b!1289384 (= lt!578239 (addStillNotContains!364 lt!578238 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5977 (array!85446 array!85444 (_ BitVec 32) (_ BitVec 32) V!50705 V!50705 (_ BitVec 32) Int) ListLongMap!19717)

(assert (=> b!1289384 (= lt!578238 (getCurrentListMapNoExtraKeys!5977 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289385 () Bool)

(declare-fun res!856474 () Bool)

(assert (=> b!1289385 (=> (not res!856474) (not e!736188))))

(declare-datatypes ((List!29230 0))(
  ( (Nil!29227) (Cons!29226 (h!30435 (_ BitVec 64)) (t!42794 List!29230)) )
))
(declare-fun arrayNoDuplicates!0 (array!85446 (_ BitVec 32) List!29230) Bool)

(assert (=> b!1289385 (= res!856474 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29227))))

(declare-fun b!1289386 () Bool)

(declare-fun res!856477 () Bool)

(assert (=> b!1289386 (=> (not res!856477) (not e!736188))))

(assert (=> b!1289386 (= res!856477 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41774 _keys!1741))))))

(declare-fun b!1289387 () Bool)

(declare-fun res!856475 () Bool)

(assert (=> b!1289387 (=> (not res!856475) (not e!736188))))

(assert (=> b!1289387 (= res!856475 (and (= (size!41773 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41774 _keys!1741) (size!41773 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289388 () Bool)

(declare-fun e!736186 () Bool)

(declare-fun e!736185 () Bool)

(declare-fun mapRes!52862 () Bool)

(assert (=> b!1289388 (= e!736186 (and e!736185 mapRes!52862))))

(declare-fun condMapEmpty!52862 () Bool)

(declare-fun mapDefault!52862 () ValueCell!16202)

