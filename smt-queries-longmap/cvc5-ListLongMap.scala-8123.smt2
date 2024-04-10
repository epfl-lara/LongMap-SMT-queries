; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99604 () Bool)

(assert start!99604)

(declare-fun b_free!25183 () Bool)

(declare-fun b_next!25183 () Bool)

(assert (=> start!99604 (= b_free!25183 (not b_next!25183))))

(declare-fun tp!88262 () Bool)

(declare-fun b_and!41233 () Bool)

(assert (=> start!99604 (= tp!88262 b_and!41233)))

(declare-fun b!1179801 () Bool)

(declare-fun res!783864 () Bool)

(declare-fun e!670753 () Bool)

(assert (=> b!1179801 (=> (not res!783864) (not e!670753))))

(declare-datatypes ((array!76229 0))(
  ( (array!76230 (arr!36764 (Array (_ BitVec 32) (_ BitVec 64))) (size!37300 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76229)

(declare-datatypes ((List!25830 0))(
  ( (Nil!25827) (Cons!25826 (h!27035 (_ BitVec 64)) (t!38005 List!25830)) )
))
(declare-fun arrayNoDuplicates!0 (array!76229 (_ BitVec 32) List!25830) Bool)

(assert (=> b!1179801 (= res!783864 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25827))))

(declare-fun b!1179802 () Bool)

(declare-fun e!670751 () Bool)

(declare-datatypes ((V!44745 0))(
  ( (V!44746 (val!14913 Int)) )
))
(declare-datatypes ((tuple2!19092 0))(
  ( (tuple2!19093 (_1!9557 (_ BitVec 64)) (_2!9557 V!44745)) )
))
(declare-datatypes ((List!25831 0))(
  ( (Nil!25828) (Cons!25827 (h!27036 tuple2!19092) (t!38006 List!25831)) )
))
(declare-datatypes ((ListLongMap!17061 0))(
  ( (ListLongMap!17062 (toList!8546 List!25831)) )
))
(declare-fun lt!533284 () ListLongMap!17061)

(declare-fun lt!533294 () ListLongMap!17061)

(assert (=> b!1179802 (= e!670751 (= lt!533284 lt!533294))))

(declare-fun b!1179803 () Bool)

(declare-fun res!783863 () Bool)

(assert (=> b!1179803 (=> (not res!783863) (not e!670753))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179803 (= res!783863 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37300 _keys!1208))))))

(declare-fun b!1179804 () Bool)

(declare-datatypes ((Unit!38990 0))(
  ( (Unit!38991) )
))
(declare-fun e!670746 () Unit!38990)

(declare-fun Unit!38992 () Unit!38990)

(assert (=> b!1179804 (= e!670746 Unit!38992)))

(declare-fun b!1179805 () Bool)

(declare-fun res!783866 () Bool)

(declare-fun e!670748 () Bool)

(assert (=> b!1179805 (=> (not res!783866) (not e!670748))))

(declare-fun lt!533290 () array!76229)

(assert (=> b!1179805 (= res!783866 (arrayNoDuplicates!0 lt!533290 #b00000000000000000000000000000000 Nil!25827))))

(declare-fun b!1179806 () Bool)

(assert (=> b!1179806 (= e!670753 e!670748)))

(declare-fun res!783877 () Bool)

(assert (=> b!1179806 (=> (not res!783877) (not e!670748))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76229 (_ BitVec 32)) Bool)

(assert (=> b!1179806 (= res!783877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!533290 mask!1564))))

(assert (=> b!1179806 (= lt!533290 (array!76230 (store (arr!36764 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37300 _keys!1208)))))

(declare-fun b!1179807 () Bool)

(declare-fun e!670750 () Bool)

(declare-fun e!670749 () Bool)

(declare-fun mapRes!46397 () Bool)

(assert (=> b!1179807 (= e!670750 (and e!670749 mapRes!46397))))

(declare-fun condMapEmpty!46397 () Bool)

(declare-datatypes ((ValueCell!14147 0))(
  ( (ValueCellFull!14147 (v!17551 V!44745)) (EmptyCell!14147) )
))
(declare-datatypes ((array!76231 0))(
  ( (array!76232 (arr!36765 (Array (_ BitVec 32) ValueCell!14147)) (size!37301 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76231)

(declare-fun mapDefault!46397 () ValueCell!14147)

