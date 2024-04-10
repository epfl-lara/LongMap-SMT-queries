; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110168 () Bool)

(assert start!110168)

(declare-fun b_free!29291 () Bool)

(declare-fun b_next!29291 () Bool)

(assert (=> start!110168 (= b_free!29291 (not b_next!29291))))

(declare-fun tp!103031 () Bool)

(declare-fun b_and!47471 () Bool)

(assert (=> start!110168 (= tp!103031 b_and!47471)))

(declare-fun b!1304460 () Bool)

(declare-fun e!744062 () Bool)

(declare-fun tp_is_empty!34931 () Bool)

(assert (=> b!1304460 (= e!744062 tp_is_empty!34931)))

(declare-fun b!1304461 () Bool)

(declare-fun res!866342 () Bool)

(declare-fun e!744058 () Bool)

(assert (=> b!1304461 (=> (not res!866342) (not e!744058))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86876 0))(
  ( (array!86877 (arr!41927 (Array (_ BitVec 32) (_ BitVec 64))) (size!42477 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86876)

(assert (=> b!1304461 (= res!866342 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42477 _keys!1741))))))

(declare-fun b!1304462 () Bool)

(declare-fun res!866349 () Bool)

(assert (=> b!1304462 (=> (not res!866349) (not e!744058))))

(assert (=> b!1304462 (= res!866349 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42477 _keys!1741))))))

(declare-fun b!1304463 () Bool)

(declare-fun res!866343 () Bool)

(assert (=> b!1304463 (=> (not res!866343) (not e!744058))))

(declare-datatypes ((List!29760 0))(
  ( (Nil!29757) (Cons!29756 (h!30965 (_ BitVec 64)) (t!43358 List!29760)) )
))
(declare-fun arrayNoDuplicates!0 (array!86876 (_ BitVec 32) List!29760) Bool)

(assert (=> b!1304463 (= res!866343 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29757))))

(declare-fun b!1304464 () Bool)

(declare-fun res!866350 () Bool)

(assert (=> b!1304464 (=> (not res!866350) (not e!744058))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51677 0))(
  ( (V!51678 (val!17540 Int)) )
))
(declare-datatypes ((ValueCell!16567 0))(
  ( (ValueCellFull!16567 (v!20159 V!51677)) (EmptyCell!16567) )
))
(declare-datatypes ((array!86878 0))(
  ( (array!86879 (arr!41928 (Array (_ BitVec 32) ValueCell!16567)) (size!42478 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86878)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304464 (= res!866350 (and (= (size!42478 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42477 _keys!1741) (size!42478 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304465 () Bool)

(declare-fun e!744057 () Bool)

(assert (=> b!1304465 (= e!744058 (not e!744057))))

(declare-fun res!866347 () Bool)

(assert (=> b!1304465 (=> res!866347 e!744057)))

(assert (=> b!1304465 (= res!866347 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22640 0))(
  ( (tuple2!22641 (_1!11331 (_ BitVec 64)) (_2!11331 V!51677)) )
))
(declare-datatypes ((List!29761 0))(
  ( (Nil!29758) (Cons!29757 (h!30966 tuple2!22640) (t!43359 List!29761)) )
))
(declare-datatypes ((ListLongMap!20297 0))(
  ( (ListLongMap!20298 (toList!10164 List!29761)) )
))
(declare-fun contains!8304 (ListLongMap!20297 (_ BitVec 64)) Bool)

(assert (=> b!1304465 (not (contains!8304 (ListLongMap!20298 Nil!29758) k!1205))))

(declare-datatypes ((Unit!43196 0))(
  ( (Unit!43197) )
))
(declare-fun lt!583785 () Unit!43196)

(declare-fun emptyContainsNothing!227 ((_ BitVec 64)) Unit!43196)

(assert (=> b!1304465 (= lt!583785 (emptyContainsNothing!227 k!1205))))

(declare-fun mapIsEmpty!53996 () Bool)

(declare-fun mapRes!53996 () Bool)

(assert (=> mapIsEmpty!53996 mapRes!53996))

(declare-fun b!1304466 () Bool)

(declare-fun res!866344 () Bool)

(assert (=> b!1304466 (=> (not res!866344) (not e!744058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86876 (_ BitVec 32)) Bool)

(assert (=> b!1304466 (= res!866344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1304467 () Bool)

(declare-fun res!866341 () Bool)

(assert (=> b!1304467 (=> (not res!866341) (not e!744058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304467 (= res!866341 (not (validKeyInArray!0 (select (arr!41927 _keys!1741) from!2144))))))

(declare-fun b!1304468 () Bool)

(declare-fun e!744060 () Bool)

(assert (=> b!1304468 (= e!744060 (and e!744062 mapRes!53996))))

(declare-fun condMapEmpty!53996 () Bool)

(declare-fun mapDefault!53996 () ValueCell!16567)

