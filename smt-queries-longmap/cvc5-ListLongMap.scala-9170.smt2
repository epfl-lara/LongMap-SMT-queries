; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110222 () Bool)

(assert start!110222)

(declare-fun b_free!29293 () Bool)

(declare-fun b_next!29293 () Bool)

(assert (=> start!110222 (= b_free!29293 (not b_next!29293))))

(declare-fun tp!103040 () Bool)

(declare-fun b_and!47483 () Bool)

(assert (=> start!110222 (= tp!103040 b_and!47483)))

(declare-fun b!1304797 () Bool)

(declare-fun res!866506 () Bool)

(declare-fun e!744275 () Bool)

(assert (=> b!1304797 (=> (not res!866506) (not e!744275))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86882 0))(
  ( (array!86883 (arr!41929 (Array (_ BitVec 32) (_ BitVec 64))) (size!42479 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86882)

(assert (=> b!1304797 (= res!866506 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42479 _keys!1741))))))

(declare-fun b!1304798 () Bool)

(declare-fun res!866507 () Bool)

(assert (=> b!1304798 (=> (not res!866507) (not e!744275))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86882 (_ BitVec 32)) Bool)

(assert (=> b!1304798 (= res!866507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!54003 () Bool)

(declare-fun mapRes!54003 () Bool)

(assert (=> mapIsEmpty!54003 mapRes!54003))

(declare-fun b!1304799 () Bool)

(declare-fun res!866504 () Bool)

(assert (=> b!1304799 (=> (not res!866504) (not e!744275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304799 (= res!866504 (not (validKeyInArray!0 (select (arr!41929 _keys!1741) from!2144))))))

(declare-fun b!1304800 () Bool)

(declare-fun e!744276 () Bool)

(assert (=> b!1304800 (= e!744275 (not e!744276))))

(declare-fun res!866505 () Bool)

(assert (=> b!1304800 (=> res!866505 e!744276)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304800 (= res!866505 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51681 0))(
  ( (V!51682 (val!17541 Int)) )
))
(declare-datatypes ((tuple2!22642 0))(
  ( (tuple2!22643 (_1!11332 (_ BitVec 64)) (_2!11332 V!51681)) )
))
(declare-datatypes ((List!29762 0))(
  ( (Nil!29759) (Cons!29758 (h!30967 tuple2!22642) (t!43362 List!29762)) )
))
(declare-datatypes ((ListLongMap!20299 0))(
  ( (ListLongMap!20300 (toList!10165 List!29762)) )
))
(declare-fun contains!8307 (ListLongMap!20299 (_ BitVec 64)) Bool)

(assert (=> b!1304800 (not (contains!8307 (ListLongMap!20300 Nil!29759) k!1205))))

(declare-datatypes ((Unit!43210 0))(
  ( (Unit!43211) )
))
(declare-fun lt!584024 () Unit!43210)

(declare-fun emptyContainsNothing!228 ((_ BitVec 64)) Unit!43210)

(assert (=> b!1304800 (= lt!584024 (emptyContainsNothing!228 k!1205))))

(declare-fun b!1304801 () Bool)

(assert (=> b!1304801 (= e!744276 false)))

(declare-fun lt!584026 () ListLongMap!20299)

(declare-fun minValue!1387 () V!51681)

(declare-fun +!4486 (ListLongMap!20299 tuple2!22642) ListLongMap!20299)

(assert (=> b!1304801 (not (contains!8307 (+!4486 lt!584026 (tuple2!22643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!584025 () Unit!43210)

(declare-fun addStillNotContains!483 (ListLongMap!20299 (_ BitVec 64) V!51681 (_ BitVec 64)) Unit!43210)

(assert (=> b!1304801 (= lt!584025 (addStillNotContains!483 lt!584026 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51681)

(declare-datatypes ((ValueCell!16568 0))(
  ( (ValueCellFull!16568 (v!20162 V!51681)) (EmptyCell!16568) )
))
(declare-datatypes ((array!86884 0))(
  ( (array!86885 (arr!41930 (Array (_ BitVec 32) ValueCell!16568)) (size!42480 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86884)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6122 (array!86882 array!86884 (_ BitVec 32) (_ BitVec 32) V!51681 V!51681 (_ BitVec 32) Int) ListLongMap!20299)

(assert (=> b!1304801 (= lt!584026 (getCurrentListMapNoExtraKeys!6122 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304802 () Bool)

(declare-fun res!866500 () Bool)

(assert (=> b!1304802 (=> (not res!866500) (not e!744275))))

(declare-datatypes ((List!29763 0))(
  ( (Nil!29760) (Cons!29759 (h!30968 (_ BitVec 64)) (t!43363 List!29763)) )
))
(declare-fun arrayNoDuplicates!0 (array!86882 (_ BitVec 32) List!29763) Bool)

(assert (=> b!1304802 (= res!866500 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29760))))

(declare-fun b!1304803 () Bool)

(declare-fun e!744274 () Bool)

(declare-fun tp_is_empty!34933 () Bool)

(assert (=> b!1304803 (= e!744274 tp_is_empty!34933)))

(declare-fun res!866508 () Bool)

(assert (=> start!110222 (=> (not res!866508) (not e!744275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110222 (= res!866508 (validMask!0 mask!2175))))

(assert (=> start!110222 e!744275))

(assert (=> start!110222 tp_is_empty!34933))

(assert (=> start!110222 true))

(declare-fun e!744273 () Bool)

(declare-fun array_inv!31705 (array!86884) Bool)

(assert (=> start!110222 (and (array_inv!31705 _values!1445) e!744273)))

(declare-fun array_inv!31706 (array!86882) Bool)

(assert (=> start!110222 (array_inv!31706 _keys!1741)))

(assert (=> start!110222 tp!103040))

(declare-fun b!1304804 () Bool)

(declare-fun res!866502 () Bool)

(assert (=> b!1304804 (=> (not res!866502) (not e!744275))))

(assert (=> b!1304804 (= res!866502 (and (= (size!42480 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42479 _keys!1741) (size!42480 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304805 () Bool)

(declare-fun e!744272 () Bool)

(assert (=> b!1304805 (= e!744272 tp_is_empty!34933)))

(declare-fun b!1304806 () Bool)

(declare-fun res!866501 () Bool)

(assert (=> b!1304806 (=> (not res!866501) (not e!744275))))

(declare-fun getCurrentListMap!5182 (array!86882 array!86884 (_ BitVec 32) (_ BitVec 32) V!51681 V!51681 (_ BitVec 32) Int) ListLongMap!20299)

(assert (=> b!1304806 (= res!866501 (contains!8307 (getCurrentListMap!5182 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1304807 () Bool)

(declare-fun res!866503 () Bool)

(assert (=> b!1304807 (=> (not res!866503) (not e!744275))))

(assert (=> b!1304807 (= res!866503 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42479 _keys!1741))))))

(declare-fun mapNonEmpty!54003 () Bool)

(declare-fun tp!103041 () Bool)

(assert (=> mapNonEmpty!54003 (= mapRes!54003 (and tp!103041 e!744272))))

(declare-fun mapRest!54003 () (Array (_ BitVec 32) ValueCell!16568))

(declare-fun mapKey!54003 () (_ BitVec 32))

(declare-fun mapValue!54003 () ValueCell!16568)

(assert (=> mapNonEmpty!54003 (= (arr!41930 _values!1445) (store mapRest!54003 mapKey!54003 mapValue!54003))))

(declare-fun b!1304808 () Bool)

(assert (=> b!1304808 (= e!744273 (and e!744274 mapRes!54003))))

(declare-fun condMapEmpty!54003 () Bool)

(declare-fun mapDefault!54003 () ValueCell!16568)

