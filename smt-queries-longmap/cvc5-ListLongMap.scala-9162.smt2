; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110022 () Bool)

(assert start!110022)

(declare-fun b_free!29245 () Bool)

(declare-fun b_next!29245 () Bool)

(assert (=> start!110022 (= b_free!29245 (not b_next!29245))))

(declare-fun tp!102883 () Bool)

(declare-fun b_and!47403 () Bool)

(assert (=> start!110022 (= tp!102883 b_and!47403)))

(declare-datatypes ((V!51617 0))(
  ( (V!51618 (val!17517 Int)) )
))
(declare-datatypes ((tuple2!22602 0))(
  ( (tuple2!22603 (_1!11312 (_ BitVec 64)) (_2!11312 V!51617)) )
))
(declare-fun lt!582984 () tuple2!22602)

(declare-fun b!1302982 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun e!743217 () Bool)

(declare-datatypes ((List!29729 0))(
  ( (Nil!29726) (Cons!29725 (h!30934 tuple2!22602) (t!43321 List!29729)) )
))
(declare-datatypes ((ListLongMap!20259 0))(
  ( (ListLongMap!20260 (toList!10145 List!29729)) )
))
(declare-fun lt!582985 () ListLongMap!20259)

(declare-fun contains!8279 (ListLongMap!20259 (_ BitVec 64)) Bool)

(declare-fun +!4471 (ListLongMap!20259 tuple2!22602) ListLongMap!20259)

(assert (=> b!1302982 (= e!743217 (contains!8279 (+!4471 lt!582985 lt!582984) k!1205))))

(declare-fun lt!582989 () ListLongMap!20259)

(assert (=> b!1302982 (not (contains!8279 (+!4471 lt!582989 lt!582984) k!1205))))

(declare-fun minValue!1387 () V!51617)

(assert (=> b!1302982 (= lt!582984 (tuple2!22603 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!43138 0))(
  ( (Unit!43139) )
))
(declare-fun lt!582987 () Unit!43138)

(declare-fun addStillNotContains!468 (ListLongMap!20259 (_ BitVec 64) V!51617 (_ BitVec 64)) Unit!43138)

(assert (=> b!1302982 (= lt!582987 (addStillNotContains!468 lt!582989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1302982 (not (contains!8279 lt!582985 k!1205))))

(declare-fun zeroValue!1387 () V!51617)

(assert (=> b!1302982 (= lt!582985 (+!4471 lt!582989 (tuple2!22603 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!582986 () Unit!43138)

(assert (=> b!1302982 (= lt!582986 (addStillNotContains!468 lt!582989 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16544 0))(
  ( (ValueCellFull!16544 (v!20132 V!51617)) (EmptyCell!16544) )
))
(declare-datatypes ((array!86784 0))(
  ( (array!86785 (arr!41884 (Array (_ BitVec 32) ValueCell!16544)) (size!42434 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86784)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86786 0))(
  ( (array!86787 (arr!41885 (Array (_ BitVec 32) (_ BitVec 64))) (size!42435 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86786)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6104 (array!86786 array!86784 (_ BitVec 32) (_ BitVec 32) V!51617 V!51617 (_ BitVec 32) Int) ListLongMap!20259)

(assert (=> b!1302982 (= lt!582989 (getCurrentListMapNoExtraKeys!6104 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1302983 () Bool)

(declare-fun res!865432 () Bool)

(declare-fun e!743218 () Bool)

(assert (=> b!1302983 (=> (not res!865432) (not e!743218))))

(assert (=> b!1302983 (= res!865432 (and (= (size!42434 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42435 _keys!1741) (size!42434 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1302984 () Bool)

(declare-fun res!865434 () Bool)

(assert (=> b!1302984 (=> (not res!865434) (not e!743218))))

(assert (=> b!1302984 (= res!865434 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42435 _keys!1741))))))

(declare-fun mapIsEmpty!53917 () Bool)

(declare-fun mapRes!53917 () Bool)

(assert (=> mapIsEmpty!53917 mapRes!53917))

(declare-fun b!1302985 () Bool)

(declare-fun e!743222 () Bool)

(declare-fun tp_is_empty!34885 () Bool)

(assert (=> b!1302985 (= e!743222 tp_is_empty!34885)))

(declare-fun mapNonEmpty!53917 () Bool)

(declare-fun tp!102882 () Bool)

(assert (=> mapNonEmpty!53917 (= mapRes!53917 (and tp!102882 e!743222))))

(declare-fun mapValue!53917 () ValueCell!16544)

(declare-fun mapRest!53917 () (Array (_ BitVec 32) ValueCell!16544))

(declare-fun mapKey!53917 () (_ BitVec 32))

(assert (=> mapNonEmpty!53917 (= (arr!41884 _values!1445) (store mapRest!53917 mapKey!53917 mapValue!53917))))

(declare-fun b!1302987 () Bool)

(declare-fun res!865431 () Bool)

(assert (=> b!1302987 (=> (not res!865431) (not e!743218))))

(declare-fun getCurrentListMap!5169 (array!86786 array!86784 (_ BitVec 32) (_ BitVec 32) V!51617 V!51617 (_ BitVec 32) Int) ListLongMap!20259)

(assert (=> b!1302987 (= res!865431 (contains!8279 (getCurrentListMap!5169 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1302988 () Bool)

(declare-fun res!865433 () Bool)

(assert (=> b!1302988 (=> (not res!865433) (not e!743218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86786 (_ BitVec 32)) Bool)

(assert (=> b!1302988 (= res!865433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1302989 () Bool)

(declare-fun res!865437 () Bool)

(assert (=> b!1302989 (=> (not res!865437) (not e!743218))))

(declare-datatypes ((List!29730 0))(
  ( (Nil!29727) (Cons!29726 (h!30935 (_ BitVec 64)) (t!43322 List!29730)) )
))
(declare-fun arrayNoDuplicates!0 (array!86786 (_ BitVec 32) List!29730) Bool)

(assert (=> b!1302989 (= res!865437 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29727))))

(declare-fun b!1302990 () Bool)

(assert (=> b!1302990 (= e!743218 (not e!743217))))

(declare-fun res!865429 () Bool)

(assert (=> b!1302990 (=> res!865429 e!743217)))

(assert (=> b!1302990 (= res!865429 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1302990 (not (contains!8279 (ListLongMap!20260 Nil!29726) k!1205))))

(declare-fun lt!582988 () Unit!43138)

(declare-fun emptyContainsNothing!210 ((_ BitVec 64)) Unit!43138)

(assert (=> b!1302990 (= lt!582988 (emptyContainsNothing!210 k!1205))))

(declare-fun b!1302991 () Bool)

(declare-fun res!865430 () Bool)

(assert (=> b!1302991 (=> (not res!865430) (not e!743218))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1302991 (= res!865430 (not (validKeyInArray!0 (select (arr!41885 _keys!1741) from!2144))))))

(declare-fun b!1302992 () Bool)

(declare-fun e!743220 () Bool)

(assert (=> b!1302992 (= e!743220 tp_is_empty!34885)))

(declare-fun b!1302993 () Bool)

(declare-fun e!743219 () Bool)

(assert (=> b!1302993 (= e!743219 (and e!743220 mapRes!53917))))

(declare-fun condMapEmpty!53917 () Bool)

(declare-fun mapDefault!53917 () ValueCell!16544)

