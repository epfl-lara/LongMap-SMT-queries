; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133544 () Bool)

(assert start!133544)

(declare-fun b_free!31961 () Bool)

(declare-fun b_next!31961 () Bool)

(assert (=> start!133544 (= b_free!31961 (not b_next!31961))))

(declare-fun tp!113007 () Bool)

(declare-fun b_and!51433 () Bool)

(assert (=> start!133544 (= tp!113007 b_and!51433)))

(declare-fun res!1067487 () Bool)

(declare-fun e!870034 () Bool)

(assert (=> start!133544 (=> (not res!1067487) (not e!870034))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133544 (= res!1067487 (validMask!0 mask!947))))

(assert (=> start!133544 e!870034))

(assert (=> start!133544 tp!113007))

(declare-fun tp_is_empty!38627 () Bool)

(assert (=> start!133544 tp_is_empty!38627))

(assert (=> start!133544 true))

(declare-datatypes ((array!103972 0))(
  ( (array!103973 (arr!50178 (Array (_ BitVec 32) (_ BitVec 64))) (size!50728 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103972)

(declare-fun array_inv!39005 (array!103972) Bool)

(assert (=> start!133544 (array_inv!39005 _keys!637)))

(declare-datatypes ((V!59709 0))(
  ( (V!59710 (val!19397 Int)) )
))
(declare-datatypes ((ValueCell!18283 0))(
  ( (ValueCellFull!18283 (v!22149 V!59709)) (EmptyCell!18283) )
))
(declare-datatypes ((array!103974 0))(
  ( (array!103975 (arr!50179 (Array (_ BitVec 32) ValueCell!18283)) (size!50729 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103974)

(declare-fun e!870032 () Bool)

(declare-fun array_inv!39006 (array!103974) Bool)

(assert (=> start!133544 (and (array_inv!39006 _values!487) e!870032)))

(declare-fun b!1561210 () Bool)

(assert (=> b!1561210 (= e!870034 (not true))))

(declare-datatypes ((tuple2!25056 0))(
  ( (tuple2!25057 (_1!12539 (_ BitVec 64)) (_2!12539 V!59709)) )
))
(declare-datatypes ((List!36428 0))(
  ( (Nil!36425) (Cons!36424 (h!37870 tuple2!25056) (t!51179 List!36428)) )
))
(declare-datatypes ((ListLongMap!22491 0))(
  ( (ListLongMap!22492 (toList!11261 List!36428)) )
))
(declare-fun lt!671140 () ListLongMap!22491)

(declare-fun lt!671141 () V!59709)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun contains!10251 (ListLongMap!22491 (_ BitVec 64)) Bool)

(declare-fun +!5031 (ListLongMap!22491 tuple2!25056) ListLongMap!22491)

(assert (=> b!1561210 (not (contains!10251 (+!5031 lt!671140 (tuple2!25057 (select (arr!50178 _keys!637) from!782) lt!671141)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51916 0))(
  ( (Unit!51917) )
))
(declare-fun lt!671142 () Unit!51916)

(declare-fun addStillNotContains!521 (ListLongMap!22491 (_ BitVec 64) V!59709 (_ BitVec 64)) Unit!51916)

(assert (=> b!1561210 (= lt!671142 (addStillNotContains!521 lt!671140 (select (arr!50178 _keys!637) from!782) lt!671141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26194 (ValueCell!18283 V!59709) V!59709)

(declare-fun dynLambda!3815 (Int (_ BitVec 64)) V!59709)

(assert (=> b!1561210 (= lt!671141 (get!26194 (select (arr!50179 _values!487) from!782) (dynLambda!3815 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59709)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!59709)

(declare-fun getCurrentListMapNoExtraKeys!6645 (array!103972 array!103974 (_ BitVec 32) (_ BitVec 32) V!59709 V!59709 (_ BitVec 32) Int) ListLongMap!22491)

(assert (=> b!1561210 (= lt!671140 (getCurrentListMapNoExtraKeys!6645 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561211 () Bool)

(declare-fun e!870031 () Bool)

(assert (=> b!1561211 (= e!870031 tp_is_empty!38627)))

(declare-fun mapNonEmpty!59316 () Bool)

(declare-fun mapRes!59316 () Bool)

(declare-fun tp!113006 () Bool)

(assert (=> mapNonEmpty!59316 (= mapRes!59316 (and tp!113006 e!870031))))

(declare-fun mapRest!59316 () (Array (_ BitVec 32) ValueCell!18283))

(declare-fun mapKey!59316 () (_ BitVec 32))

(declare-fun mapValue!59316 () ValueCell!18283)

(assert (=> mapNonEmpty!59316 (= (arr!50179 _values!487) (store mapRest!59316 mapKey!59316 mapValue!59316))))

(declare-fun b!1561212 () Bool)

(declare-fun res!1067482 () Bool)

(assert (=> b!1561212 (=> (not res!1067482) (not e!870034))))

(assert (=> b!1561212 (= res!1067482 (and (= (size!50729 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50728 _keys!637) (size!50729 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561213 () Bool)

(declare-fun e!870030 () Bool)

(assert (=> b!1561213 (= e!870032 (and e!870030 mapRes!59316))))

(declare-fun condMapEmpty!59316 () Bool)

(declare-fun mapDefault!59316 () ValueCell!18283)

