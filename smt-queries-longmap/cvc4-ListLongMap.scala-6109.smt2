; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78766 () Bool)

(assert start!78766)

(declare-fun b_free!16979 () Bool)

(declare-fun b_next!16979 () Bool)

(assert (=> start!78766 (= b_free!16979 (not b_next!16979))))

(declare-fun tp!59378 () Bool)

(declare-fun b_and!27695 () Bool)

(assert (=> start!78766 (= tp!59378 b_and!27695)))

(declare-fun b!919149 () Bool)

(declare-fun res!619757 () Bool)

(declare-fun e!515944 () Bool)

(assert (=> b!919149 (=> (not res!619757) (not e!515944))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919149 (= res!619757 (validKeyInArray!0 k!1099))))

(declare-fun mapNonEmpty!30987 () Bool)

(declare-fun mapRes!30987 () Bool)

(declare-fun tp!59377 () Bool)

(declare-fun e!515941 () Bool)

(assert (=> mapNonEmpty!30987 (= mapRes!30987 (and tp!59377 e!515941))))

(declare-datatypes ((V!30947 0))(
  ( (V!30948 (val!9794 Int)) )
))
(declare-datatypes ((ValueCell!9262 0))(
  ( (ValueCellFull!9262 (v!12312 V!30947)) (EmptyCell!9262) )
))
(declare-datatypes ((array!54958 0))(
  ( (array!54959 (arr!26424 (Array (_ BitVec 32) ValueCell!9262)) (size!26883 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54958)

(declare-fun mapValue!30987 () ValueCell!9262)

(declare-fun mapRest!30987 () (Array (_ BitVec 32) ValueCell!9262))

(declare-fun mapKey!30987 () (_ BitVec 32))

(assert (=> mapNonEmpty!30987 (= (arr!26424 _values!1231) (store mapRest!30987 mapKey!30987 mapValue!30987))))

(declare-fun b!919150 () Bool)

(declare-fun e!515943 () Bool)

(assert (=> b!919150 (= e!515943 e!515944)))

(declare-fun res!619753 () Bool)

(assert (=> b!919150 (=> (not res!619753) (not e!515944))))

(declare-datatypes ((tuple2!12730 0))(
  ( (tuple2!12731 (_1!6376 (_ BitVec 64)) (_2!6376 V!30947)) )
))
(declare-datatypes ((List!18534 0))(
  ( (Nil!18531) (Cons!18530 (h!19676 tuple2!12730) (t!26243 List!18534)) )
))
(declare-datatypes ((ListLongMap!11427 0))(
  ( (ListLongMap!11428 (toList!5729 List!18534)) )
))
(declare-fun lt!412557 () ListLongMap!11427)

(declare-fun contains!4775 (ListLongMap!11427 (_ BitVec 64)) Bool)

(assert (=> b!919150 (= res!619753 (contains!4775 lt!412557 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!54960 0))(
  ( (array!54961 (arr!26425 (Array (_ BitVec 32) (_ BitVec 64))) (size!26884 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54960)

(declare-fun zeroValue!1173 () V!30947)

(declare-fun minValue!1173 () V!30947)

(declare-fun getCurrentListMap!2985 (array!54960 array!54958 (_ BitVec 32) (_ BitVec 32) V!30947 V!30947 (_ BitVec 32) Int) ListLongMap!11427)

(assert (=> b!919150 (= lt!412557 (getCurrentListMap!2985 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919151 () Bool)

(declare-fun res!619750 () Bool)

(assert (=> b!919151 (=> (not res!619750) (not e!515943))))

(declare-datatypes ((List!18535 0))(
  ( (Nil!18532) (Cons!18531 (h!19677 (_ BitVec 64)) (t!26244 List!18535)) )
))
(declare-fun arrayNoDuplicates!0 (array!54960 (_ BitVec 32) List!18535) Bool)

(assert (=> b!919151 (= res!619750 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18532))))

(declare-fun b!919152 () Bool)

(declare-fun e!515942 () Bool)

(declare-fun tp_is_empty!19487 () Bool)

(assert (=> b!919152 (= e!515942 tp_is_empty!19487)))

(declare-fun b!919153 () Bool)

(declare-fun e!515940 () Bool)

(assert (=> b!919153 (= e!515944 e!515940)))

(declare-fun res!619755 () Bool)

(assert (=> b!919153 (=> (not res!619755) (not e!515940))))

(declare-fun lt!412560 () (_ BitVec 64))

(assert (=> b!919153 (= res!619755 (validKeyInArray!0 lt!412560))))

(assert (=> b!919153 (= lt!412560 (select (arr!26425 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!619756 () Bool)

(assert (=> start!78766 (=> (not res!619756) (not e!515943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78766 (= res!619756 (validMask!0 mask!1881))))

(assert (=> start!78766 e!515943))

(assert (=> start!78766 true))

(assert (=> start!78766 tp_is_empty!19487))

(declare-fun e!515939 () Bool)

(declare-fun array_inv!20594 (array!54958) Bool)

(assert (=> start!78766 (and (array_inv!20594 _values!1231) e!515939)))

(assert (=> start!78766 tp!59378))

(declare-fun array_inv!20595 (array!54960) Bool)

(assert (=> start!78766 (array_inv!20595 _keys!1487)))

(declare-fun b!919154 () Bool)

(declare-fun res!619754 () Bool)

(assert (=> b!919154 (=> (not res!619754) (not e!515943))))

(assert (=> b!919154 (= res!619754 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26884 _keys!1487))))))

(declare-fun b!919155 () Bool)

(declare-fun res!619758 () Bool)

(assert (=> b!919155 (=> (not res!619758) (not e!515943))))

(assert (=> b!919155 (= res!619758 (and (= (size!26883 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26884 _keys!1487) (size!26883 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919156 () Bool)

(declare-fun res!619751 () Bool)

(assert (=> b!919156 (=> (not res!619751) (not e!515943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54960 (_ BitVec 32)) Bool)

(assert (=> b!919156 (= res!619751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919157 () Bool)

(declare-fun res!619759 () Bool)

(assert (=> b!919157 (=> (not res!619759) (not e!515944))))

(assert (=> b!919157 (= res!619759 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!30987 () Bool)

(assert (=> mapIsEmpty!30987 mapRes!30987))

(declare-fun b!919158 () Bool)

(declare-fun res!619752 () Bool)

(assert (=> b!919158 (=> (not res!619752) (not e!515944))))

(declare-fun v!791 () V!30947)

(declare-fun apply!575 (ListLongMap!11427 (_ BitVec 64)) V!30947)

(assert (=> b!919158 (= res!619752 (= (apply!575 lt!412557 k!1099) v!791))))

(declare-fun b!919159 () Bool)

(assert (=> b!919159 (= e!515940 (not true))))

(assert (=> b!919159 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18532)))

(declare-datatypes ((Unit!31028 0))(
  ( (Unit!31029) )
))
(declare-fun lt!412555 () Unit!31028)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54960 (_ BitVec 32) (_ BitVec 32)) Unit!31028)

(assert (=> b!919159 (= lt!412555 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412561 () tuple2!12730)

(declare-fun +!2640 (ListLongMap!11427 tuple2!12730) ListLongMap!11427)

(assert (=> b!919159 (contains!4775 (+!2640 lt!412557 lt!412561) k!1099)))

(declare-fun lt!412559 () V!30947)

(declare-fun lt!412556 () Unit!31028)

(declare-fun addStillContains!364 (ListLongMap!11427 (_ BitVec 64) V!30947 (_ BitVec 64)) Unit!31028)

(assert (=> b!919159 (= lt!412556 (addStillContains!364 lt!412557 lt!412560 lt!412559 k!1099))))

(assert (=> b!919159 (= (getCurrentListMap!2985 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2640 (getCurrentListMap!2985 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412561))))

(assert (=> b!919159 (= lt!412561 (tuple2!12731 lt!412560 lt!412559))))

(declare-fun get!13855 (ValueCell!9262 V!30947) V!30947)

(declare-fun dynLambda!1429 (Int (_ BitVec 64)) V!30947)

(assert (=> b!919159 (= lt!412559 (get!13855 (select (arr!26424 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1429 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412558 () Unit!31028)

(declare-fun lemmaListMapRecursiveValidKeyArray!30 (array!54960 array!54958 (_ BitVec 32) (_ BitVec 32) V!30947 V!30947 (_ BitVec 32) Int) Unit!31028)

(assert (=> b!919159 (= lt!412558 (lemmaListMapRecursiveValidKeyArray!30 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919160 () Bool)

(assert (=> b!919160 (= e!515941 tp_is_empty!19487)))

(declare-fun b!919161 () Bool)

(assert (=> b!919161 (= e!515939 (and e!515942 mapRes!30987))))

(declare-fun condMapEmpty!30987 () Bool)

(declare-fun mapDefault!30987 () ValueCell!9262)

