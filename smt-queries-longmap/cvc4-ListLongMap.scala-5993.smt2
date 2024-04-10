; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77814 () Bool)

(assert start!77814)

(declare-fun b_free!16373 () Bool)

(declare-fun b_next!16373 () Bool)

(assert (=> start!77814 (= b_free!16373 (not b_next!16373))))

(declare-fun tp!57383 () Bool)

(declare-fun b_and!26903 () Bool)

(assert (=> start!77814 (= tp!57383 b_and!26903)))

(declare-fun b!908309 () Bool)

(declare-fun res!613045 () Bool)

(declare-fun e!509079 () Bool)

(assert (=> b!908309 (=> (not res!613045) (not e!509079))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908309 (= res!613045 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29902 () Bool)

(declare-fun mapRes!29902 () Bool)

(assert (=> mapIsEmpty!29902 mapRes!29902))

(declare-fun b!908310 () Bool)

(declare-fun e!509078 () Bool)

(declare-fun tp_is_empty!18791 () Bool)

(assert (=> b!908310 (= e!509078 tp_is_empty!18791)))

(declare-fun mapNonEmpty!29902 () Bool)

(declare-fun tp!57384 () Bool)

(assert (=> mapNonEmpty!29902 (= mapRes!29902 (and tp!57384 e!509078))))

(declare-datatypes ((V!30019 0))(
  ( (V!30020 (val!9446 Int)) )
))
(declare-datatypes ((ValueCell!8914 0))(
  ( (ValueCellFull!8914 (v!11953 V!30019)) (EmptyCell!8914) )
))
(declare-datatypes ((array!53616 0))(
  ( (array!53617 (arr!25766 (Array (_ BitVec 32) ValueCell!8914)) (size!26225 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53616)

(declare-fun mapRest!29902 () (Array (_ BitVec 32) ValueCell!8914))

(declare-fun mapKey!29902 () (_ BitVec 32))

(declare-fun mapValue!29902 () ValueCell!8914)

(assert (=> mapNonEmpty!29902 (= (arr!25766 _values!1152) (store mapRest!29902 mapKey!29902 mapValue!29902))))

(declare-fun b!908311 () Bool)

(declare-fun e!509076 () Bool)

(assert (=> b!908311 (= e!509076 e!509079)))

(declare-fun res!613047 () Bool)

(assert (=> b!908311 (=> (not res!613047) (not e!509079))))

(declare-datatypes ((tuple2!12306 0))(
  ( (tuple2!12307 (_1!6164 (_ BitVec 64)) (_2!6164 V!30019)) )
))
(declare-datatypes ((List!18104 0))(
  ( (Nil!18101) (Cons!18100 (h!19246 tuple2!12306) (t!25649 List!18104)) )
))
(declare-datatypes ((ListLongMap!11003 0))(
  ( (ListLongMap!11004 (toList!5517 List!18104)) )
))
(declare-fun lt!409667 () ListLongMap!11003)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4560 (ListLongMap!11003 (_ BitVec 64)) Bool)

(assert (=> b!908311 (= res!613047 (contains!4560 lt!409667 k!1033))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!30019)

(declare-datatypes ((array!53618 0))(
  ( (array!53619 (arr!25767 (Array (_ BitVec 32) (_ BitVec 64))) (size!26226 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53618)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30019)

(declare-fun getCurrentListMap!2780 (array!53618 array!53616 (_ BitVec 32) (_ BitVec 32) V!30019 V!30019 (_ BitVec 32) Int) ListLongMap!11003)

(assert (=> b!908311 (= lt!409667 (getCurrentListMap!2780 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908312 () Bool)

(declare-fun res!613053 () Bool)

(assert (=> b!908312 (=> (not res!613053) (not e!509076))))

(declare-datatypes ((List!18105 0))(
  ( (Nil!18102) (Cons!18101 (h!19247 (_ BitVec 64)) (t!25650 List!18105)) )
))
(declare-fun arrayNoDuplicates!0 (array!53618 (_ BitVec 32) List!18105) Bool)

(assert (=> b!908312 (= res!613053 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18102))))

(declare-fun b!908313 () Bool)

(declare-fun e!509072 () Bool)

(assert (=> b!908313 (= e!509079 (not e!509072))))

(declare-fun res!613049 () Bool)

(assert (=> b!908313 (=> res!613049 e!509072)))

(assert (=> b!908313 (= res!613049 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26226 _keys!1386))))))

(declare-fun lt!409666 () V!30019)

(declare-fun get!13563 (ValueCell!8914 V!30019) V!30019)

(declare-fun dynLambda!1376 (Int (_ BitVec 64)) V!30019)

(assert (=> b!908313 (= lt!409666 (get!13563 (select (arr!25766 _values!1152) i!717) (dynLambda!1376 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53618 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908313 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30830 0))(
  ( (Unit!30831) )
))
(declare-fun lt!409669 () Unit!30830)

(declare-fun lemmaKeyInListMapIsInArray!248 (array!53618 array!53616 (_ BitVec 32) (_ BitVec 32) V!30019 V!30019 (_ BitVec 64) Int) Unit!30830)

(assert (=> b!908313 (= lt!409669 (lemmaKeyInListMapIsInArray!248 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun res!613048 () Bool)

(assert (=> start!77814 (=> (not res!613048) (not e!509076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77814 (= res!613048 (validMask!0 mask!1756))))

(assert (=> start!77814 e!509076))

(declare-fun e!509073 () Bool)

(declare-fun array_inv!20176 (array!53616) Bool)

(assert (=> start!77814 (and (array_inv!20176 _values!1152) e!509073)))

(assert (=> start!77814 tp!57383))

(assert (=> start!77814 true))

(assert (=> start!77814 tp_is_empty!18791))

(declare-fun array_inv!20177 (array!53618) Bool)

(assert (=> start!77814 (array_inv!20177 _keys!1386)))

(declare-fun b!908314 () Bool)

(declare-fun res!613044 () Bool)

(assert (=> b!908314 (=> (not res!613044) (not e!509076))))

(assert (=> b!908314 (= res!613044 (and (= (size!26225 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26226 _keys!1386) (size!26225 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908315 () Bool)

(declare-fun e!509074 () Bool)

(assert (=> b!908315 (= e!509073 (and e!509074 mapRes!29902))))

(declare-fun condMapEmpty!29902 () Bool)

(declare-fun mapDefault!29902 () ValueCell!8914)

