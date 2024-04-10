; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78814 () Bool)

(assert start!78814)

(declare-fun b_free!17027 () Bool)

(declare-fun b_next!17027 () Bool)

(assert (=> start!78814 (= b_free!17027 (not b_next!17027))))

(declare-fun tp!59521 () Bool)

(declare-fun b_and!27791 () Bool)

(assert (=> start!78814 (= tp!59521 b_and!27791)))

(declare-fun b!920133 () Bool)

(declare-fun e!516445 () Bool)

(assert (=> b!920133 (= e!516445 (not true))))

(declare-datatypes ((array!55050 0))(
  ( (array!55051 (arr!26470 (Array (_ BitVec 32) (_ BitVec 64))) (size!26929 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55050)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18563 0))(
  ( (Nil!18560) (Cons!18559 (h!19705 (_ BitVec 64)) (t!26320 List!18563)) )
))
(declare-fun arrayNoDuplicates!0 (array!55050 (_ BitVec 32) List!18563) Bool)

(assert (=> b!920133 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18560)))

(declare-datatypes ((Unit!31054 0))(
  ( (Unit!31055) )
))
(declare-fun lt!413059 () Unit!31054)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55050 (_ BitVec 32) (_ BitVec 32)) Unit!31054)

(assert (=> b!920133 (= lt!413059 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31011 0))(
  ( (V!31012 (val!9818 Int)) )
))
(declare-datatypes ((tuple2!12760 0))(
  ( (tuple2!12761 (_1!6391 (_ BitVec 64)) (_2!6391 V!31011)) )
))
(declare-datatypes ((List!18564 0))(
  ( (Nil!18561) (Cons!18560 (h!19706 tuple2!12760) (t!26321 List!18564)) )
))
(declare-datatypes ((ListLongMap!11457 0))(
  ( (ListLongMap!11458 (toList!5744 List!18564)) )
))
(declare-fun lt!413063 () ListLongMap!11457)

(declare-fun lt!413064 () tuple2!12760)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4790 (ListLongMap!11457 (_ BitVec 64)) Bool)

(declare-fun +!2653 (ListLongMap!11457 tuple2!12760) ListLongMap!11457)

(assert (=> b!920133 (contains!4790 (+!2653 lt!413063 lt!413064) k!1099)))

(declare-fun lt!413061 () (_ BitVec 64))

(declare-fun lt!413065 () V!31011)

(declare-fun lt!413062 () Unit!31054)

(declare-fun addStillContains!377 (ListLongMap!11457 (_ BitVec 64) V!31011 (_ BitVec 64)) Unit!31054)

(assert (=> b!920133 (= lt!413062 (addStillContains!377 lt!413063 lt!413061 lt!413065 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9286 0))(
  ( (ValueCellFull!9286 (v!12336 V!31011)) (EmptyCell!9286) )
))
(declare-datatypes ((array!55052 0))(
  ( (array!55053 (arr!26471 (Array (_ BitVec 32) ValueCell!9286)) (size!26930 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55052)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31011)

(declare-fun minValue!1173 () V!31011)

(declare-fun getCurrentListMap!3000 (array!55050 array!55052 (_ BitVec 32) (_ BitVec 32) V!31011 V!31011 (_ BitVec 32) Int) ListLongMap!11457)

(assert (=> b!920133 (= (getCurrentListMap!3000 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2653 (getCurrentListMap!3000 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413064))))

(assert (=> b!920133 (= lt!413064 (tuple2!12761 lt!413061 lt!413065))))

(declare-fun get!13884 (ValueCell!9286 V!31011) V!31011)

(declare-fun dynLambda!1442 (Int (_ BitVec 64)) V!31011)

(assert (=> b!920133 (= lt!413065 (get!13884 (select (arr!26471 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1442 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413060 () Unit!31054)

(declare-fun lemmaListMapRecursiveValidKeyArray!43 (array!55050 array!55052 (_ BitVec 32) (_ BitVec 32) V!31011 V!31011 (_ BitVec 32) Int) Unit!31054)

(assert (=> b!920133 (= lt!413060 (lemmaListMapRecursiveValidKeyArray!43 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920134 () Bool)

(declare-fun res!620477 () Bool)

(declare-fun e!516444 () Bool)

(assert (=> b!920134 (=> (not res!620477) (not e!516444))))

(assert (=> b!920134 (= res!620477 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26929 _keys!1487))))))

(declare-fun mapNonEmpty!31059 () Bool)

(declare-fun mapRes!31059 () Bool)

(declare-fun tp!59522 () Bool)

(declare-fun e!516448 () Bool)

(assert (=> mapNonEmpty!31059 (= mapRes!31059 (and tp!59522 e!516448))))

(declare-fun mapValue!31059 () ValueCell!9286)

(declare-fun mapRest!31059 () (Array (_ BitVec 32) ValueCell!9286))

(declare-fun mapKey!31059 () (_ BitVec 32))

(assert (=> mapNonEmpty!31059 (= (arr!26471 _values!1231) (store mapRest!31059 mapKey!31059 mapValue!31059))))

(declare-fun b!920135 () Bool)

(declare-fun res!620473 () Bool)

(assert (=> b!920135 (=> (not res!620473) (not e!516444))))

(assert (=> b!920135 (= res!620473 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18560))))

(declare-fun res!620479 () Bool)

(assert (=> start!78814 (=> (not res!620479) (not e!516444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78814 (= res!620479 (validMask!0 mask!1881))))

(assert (=> start!78814 e!516444))

(assert (=> start!78814 true))

(declare-fun tp_is_empty!19535 () Bool)

(assert (=> start!78814 tp_is_empty!19535))

(declare-fun e!516446 () Bool)

(declare-fun array_inv!20630 (array!55052) Bool)

(assert (=> start!78814 (and (array_inv!20630 _values!1231) e!516446)))

(assert (=> start!78814 tp!59521))

(declare-fun array_inv!20631 (array!55050) Bool)

(assert (=> start!78814 (array_inv!20631 _keys!1487)))

(declare-fun b!920136 () Bool)

(declare-fun res!620478 () Bool)

(assert (=> b!920136 (=> (not res!620478) (not e!516444))))

(assert (=> b!920136 (= res!620478 (and (= (size!26930 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26929 _keys!1487) (size!26930 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!31059 () Bool)

(assert (=> mapIsEmpty!31059 mapRes!31059))

(declare-fun b!920137 () Bool)

(declare-fun e!516442 () Bool)

(assert (=> b!920137 (= e!516442 e!516445)))

(declare-fun res!620470 () Bool)

(assert (=> b!920137 (=> (not res!620470) (not e!516445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920137 (= res!620470 (validKeyInArray!0 lt!413061))))

(assert (=> b!920137 (= lt!413061 (select (arr!26470 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920138 () Bool)

(declare-fun e!516443 () Bool)

(assert (=> b!920138 (= e!516443 tp_is_empty!19535)))

(declare-fun b!920139 () Bool)

(declare-fun res!620475 () Bool)

(assert (=> b!920139 (=> (not res!620475) (not e!516442))))

(assert (=> b!920139 (= res!620475 (validKeyInArray!0 k!1099))))

(declare-fun b!920140 () Bool)

(declare-fun res!620476 () Bool)

(assert (=> b!920140 (=> (not res!620476) (not e!516444))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55050 (_ BitVec 32)) Bool)

(assert (=> b!920140 (= res!620476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920141 () Bool)

(assert (=> b!920141 (= e!516444 e!516442)))

(declare-fun res!620474 () Bool)

(assert (=> b!920141 (=> (not res!620474) (not e!516442))))

(assert (=> b!920141 (= res!620474 (contains!4790 lt!413063 k!1099))))

(assert (=> b!920141 (= lt!413063 (getCurrentListMap!3000 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920142 () Bool)

(assert (=> b!920142 (= e!516446 (and e!516443 mapRes!31059))))

(declare-fun condMapEmpty!31059 () Bool)

(declare-fun mapDefault!31059 () ValueCell!9286)

