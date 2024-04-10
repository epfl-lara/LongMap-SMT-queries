; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133528 () Bool)

(assert start!133528)

(declare-fun b_free!31945 () Bool)

(declare-fun b_next!31945 () Bool)

(assert (=> start!133528 (= b_free!31945 (not b_next!31945))))

(declare-fun tp!112959 () Bool)

(declare-fun b_and!51401 () Bool)

(assert (=> start!133528 (= tp!112959 b_and!51401)))

(declare-fun res!1067338 () Bool)

(declare-fun e!869912 () Bool)

(assert (=> start!133528 (=> (not res!1067338) (not e!869912))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133528 (= res!1067338 (validMask!0 mask!947))))

(assert (=> start!133528 e!869912))

(assert (=> start!133528 tp!112959))

(declare-fun tp_is_empty!38611 () Bool)

(assert (=> start!133528 tp_is_empty!38611))

(assert (=> start!133528 true))

(declare-datatypes ((array!103940 0))(
  ( (array!103941 (arr!50162 (Array (_ BitVec 32) (_ BitVec 64))) (size!50712 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103940)

(declare-fun array_inv!38993 (array!103940) Bool)

(assert (=> start!133528 (array_inv!38993 _keys!637)))

(declare-datatypes ((V!59689 0))(
  ( (V!59690 (val!19389 Int)) )
))
(declare-datatypes ((ValueCell!18275 0))(
  ( (ValueCellFull!18275 (v!22141 V!59689)) (EmptyCell!18275) )
))
(declare-datatypes ((array!103942 0))(
  ( (array!103943 (arr!50163 (Array (_ BitVec 32) ValueCell!18275)) (size!50713 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103942)

(declare-fun e!869910 () Bool)

(declare-fun array_inv!38994 (array!103942) Bool)

(assert (=> start!133528 (and (array_inv!38994 _values!487) e!869910)))

(declare-fun mapNonEmpty!59292 () Bool)

(declare-fun mapRes!59292 () Bool)

(declare-fun tp!112958 () Bool)

(declare-fun e!869914 () Bool)

(assert (=> mapNonEmpty!59292 (= mapRes!59292 (and tp!112958 e!869914))))

(declare-fun mapValue!59292 () ValueCell!18275)

(declare-fun mapKey!59292 () (_ BitVec 32))

(declare-fun mapRest!59292 () (Array (_ BitVec 32) ValueCell!18275))

(assert (=> mapNonEmpty!59292 (= (arr!50163 _values!487) (store mapRest!59292 mapKey!59292 mapValue!59292))))

(declare-fun b!1560978 () Bool)

(declare-fun res!1067342 () Bool)

(assert (=> b!1560978 (=> (not res!1067342) (not e!869912))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560978 (= res!1067342 (and (= (size!50713 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50712 _keys!637) (size!50713 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560979 () Bool)

(assert (=> b!1560979 (= e!869912 (not true))))

(declare-datatypes ((tuple2!25042 0))(
  ( (tuple2!25043 (_1!12532 (_ BitVec 64)) (_2!12532 V!59689)) )
))
(declare-datatypes ((List!36415 0))(
  ( (Nil!36412) (Cons!36411 (h!37857 tuple2!25042) (t!51150 List!36415)) )
))
(declare-datatypes ((ListLongMap!22477 0))(
  ( (ListLongMap!22478 (toList!11254 List!36415)) )
))
(declare-fun lt!671068 () ListLongMap!22477)

(declare-fun lt!671070 () V!59689)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun contains!10244 (ListLongMap!22477 (_ BitVec 64)) Bool)

(declare-fun +!5024 (ListLongMap!22477 tuple2!25042) ListLongMap!22477)

(assert (=> b!1560979 (not (contains!10244 (+!5024 lt!671068 (tuple2!25043 (select (arr!50162 _keys!637) from!782) lt!671070)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51902 0))(
  ( (Unit!51903) )
))
(declare-fun lt!671069 () Unit!51902)

(declare-fun addStillNotContains!514 (ListLongMap!22477 (_ BitVec 64) V!59689 (_ BitVec 64)) Unit!51902)

(assert (=> b!1560979 (= lt!671069 (addStillNotContains!514 lt!671068 (select (arr!50162 _keys!637) from!782) lt!671070 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26183 (ValueCell!18275 V!59689) V!59689)

(declare-fun dynLambda!3808 (Int (_ BitVec 64)) V!59689)

(assert (=> b!1560979 (= lt!671070 (get!26183 (select (arr!50163 _values!487) from!782) (dynLambda!3808 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59689)

(declare-fun minValue!453 () V!59689)

(declare-fun getCurrentListMapNoExtraKeys!6638 (array!103940 array!103942 (_ BitVec 32) (_ BitVec 32) V!59689 V!59689 (_ BitVec 32) Int) ListLongMap!22477)

(assert (=> b!1560979 (= lt!671068 (getCurrentListMapNoExtraKeys!6638 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1560980 () Bool)

(declare-fun res!1067339 () Bool)

(assert (=> b!1560980 (=> (not res!1067339) (not e!869912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103940 (_ BitVec 32)) Bool)

(assert (=> b!1560980 (= res!1067339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560981 () Bool)

(declare-fun e!869911 () Bool)

(assert (=> b!1560981 (= e!869911 tp_is_empty!38611)))

(declare-fun b!1560982 () Bool)

(declare-fun res!1067341 () Bool)

(assert (=> b!1560982 (=> (not res!1067341) (not e!869912))))

(declare-datatypes ((List!36416 0))(
  ( (Nil!36413) (Cons!36412 (h!37858 (_ BitVec 64)) (t!51151 List!36416)) )
))
(declare-fun arrayNoDuplicates!0 (array!103940 (_ BitVec 32) List!36416) Bool)

(assert (=> b!1560982 (= res!1067341 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36413))))

(declare-fun mapIsEmpty!59292 () Bool)

(assert (=> mapIsEmpty!59292 mapRes!59292))

(declare-fun b!1560983 () Bool)

(declare-fun res!1067340 () Bool)

(assert (=> b!1560983 (=> (not res!1067340) (not e!869912))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1560983 (= res!1067340 (validKeyInArray!0 (select (arr!50162 _keys!637) from!782)))))

(declare-fun b!1560984 () Bool)

(assert (=> b!1560984 (= e!869914 tp_is_empty!38611)))

(declare-fun b!1560985 () Bool)

(declare-fun res!1067343 () Bool)

(assert (=> b!1560985 (=> (not res!1067343) (not e!869912))))

(assert (=> b!1560985 (= res!1067343 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50712 _keys!637)) (bvslt from!782 (size!50712 _keys!637))))))

(declare-fun b!1560986 () Bool)

(assert (=> b!1560986 (= e!869910 (and e!869911 mapRes!59292))))

(declare-fun condMapEmpty!59292 () Bool)

(declare-fun mapDefault!59292 () ValueCell!18275)

