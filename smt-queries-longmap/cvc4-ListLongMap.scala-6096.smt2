; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78688 () Bool)

(assert start!78688)

(declare-fun b_free!16901 () Bool)

(declare-fun b_next!16901 () Bool)

(assert (=> start!78688 (= b_free!16901 (not b_next!16901))))

(declare-fun tp!59144 () Bool)

(declare-fun b_and!27539 () Bool)

(assert (=> start!78688 (= tp!59144 b_and!27539)))

(declare-fun b!917550 () Bool)

(declare-fun res!618585 () Bool)

(declare-fun e!515121 () Bool)

(assert (=> b!917550 (=> (not res!618585) (not e!515121))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!30843 0))(
  ( (V!30844 (val!9755 Int)) )
))
(declare-fun v!791 () V!30843)

(declare-datatypes ((tuple2!12672 0))(
  ( (tuple2!12673 (_1!6347 (_ BitVec 64)) (_2!6347 V!30843)) )
))
(declare-datatypes ((List!18481 0))(
  ( (Nil!18478) (Cons!18477 (h!19623 tuple2!12672) (t!26112 List!18481)) )
))
(declare-datatypes ((ListLongMap!11369 0))(
  ( (ListLongMap!11370 (toList!5700 List!18481)) )
))
(declare-fun lt!412037 () ListLongMap!11369)

(declare-fun apply!552 (ListLongMap!11369 (_ BitVec 64)) V!30843)

(assert (=> b!917550 (= res!618585 (= (apply!552 lt!412037 k!1099) v!791))))

(declare-fun b!917551 () Bool)

(declare-fun res!618582 () Bool)

(assert (=> b!917551 (=> (not res!618582) (not e!515121))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917551 (= res!618582 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917552 () Bool)

(declare-fun res!618580 () Bool)

(declare-fun e!515120 () Bool)

(assert (=> b!917552 (=> (not res!618580) (not e!515120))))

(declare-datatypes ((array!54804 0))(
  ( (array!54805 (arr!26347 (Array (_ BitVec 32) (_ BitVec 64))) (size!26806 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54804)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54804 (_ BitVec 32)) Bool)

(assert (=> b!917552 (= res!618580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917553 () Bool)

(declare-fun res!618584 () Bool)

(assert (=> b!917553 (=> (not res!618584) (not e!515120))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9223 0))(
  ( (ValueCellFull!9223 (v!12273 V!30843)) (EmptyCell!9223) )
))
(declare-datatypes ((array!54806 0))(
  ( (array!54807 (arr!26348 (Array (_ BitVec 32) ValueCell!9223)) (size!26807 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54806)

(assert (=> b!917553 (= res!618584 (and (= (size!26807 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26806 _keys!1487) (size!26807 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917554 () Bool)

(declare-fun e!515124 () Bool)

(assert (=> b!917554 (= e!515124 (not true))))

(declare-fun lt!412039 () (_ BitVec 64))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30843)

(declare-fun minValue!1173 () V!30843)

(declare-fun getCurrentListMap!2958 (array!54804 array!54806 (_ BitVec 32) (_ BitVec 32) V!30843 V!30843 (_ BitVec 32) Int) ListLongMap!11369)

(declare-fun +!2615 (ListLongMap!11369 tuple2!12672) ListLongMap!11369)

(declare-fun get!13804 (ValueCell!9223 V!30843) V!30843)

(declare-fun dynLambda!1404 (Int (_ BitVec 64)) V!30843)

(assert (=> b!917554 (= (getCurrentListMap!2958 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2615 (getCurrentListMap!2958 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12673 lt!412039 (get!13804 (select (arr!26348 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1404 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30978 0))(
  ( (Unit!30979) )
))
(declare-fun lt!412038 () Unit!30978)

(declare-fun lemmaListMapRecursiveValidKeyArray!5 (array!54804 array!54806 (_ BitVec 32) (_ BitVec 32) V!30843 V!30843 (_ BitVec 32) Int) Unit!30978)

(assert (=> b!917554 (= lt!412038 (lemmaListMapRecursiveValidKeyArray!5 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917555 () Bool)

(assert (=> b!917555 (= e!515120 e!515121)))

(declare-fun res!618587 () Bool)

(assert (=> b!917555 (=> (not res!618587) (not e!515121))))

(declare-fun contains!4751 (ListLongMap!11369 (_ BitVec 64)) Bool)

(assert (=> b!917555 (= res!618587 (contains!4751 lt!412037 k!1099))))

(assert (=> b!917555 (= lt!412037 (getCurrentListMap!2958 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917556 () Bool)

(assert (=> b!917556 (= e!515121 e!515124)))

(declare-fun res!618586 () Bool)

(assert (=> b!917556 (=> (not res!618586) (not e!515124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917556 (= res!618586 (validKeyInArray!0 lt!412039))))

(assert (=> b!917556 (= lt!412039 (select (arr!26347 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!30870 () Bool)

(declare-fun mapRes!30870 () Bool)

(assert (=> mapIsEmpty!30870 mapRes!30870))

(declare-fun b!917557 () Bool)

(declare-fun res!618589 () Bool)

(assert (=> b!917557 (=> (not res!618589) (not e!515120))))

(assert (=> b!917557 (= res!618589 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26806 _keys!1487))))))

(declare-fun b!917558 () Bool)

(declare-fun e!515125 () Bool)

(declare-fun tp_is_empty!19409 () Bool)

(assert (=> b!917558 (= e!515125 tp_is_empty!19409)))

(declare-fun b!917559 () Bool)

(declare-fun res!618581 () Bool)

(assert (=> b!917559 (=> (not res!618581) (not e!515121))))

(assert (=> b!917559 (= res!618581 (validKeyInArray!0 k!1099))))

(declare-fun b!917560 () Bool)

(declare-fun res!618583 () Bool)

(assert (=> b!917560 (=> (not res!618583) (not e!515120))))

(declare-datatypes ((List!18482 0))(
  ( (Nil!18479) (Cons!18478 (h!19624 (_ BitVec 64)) (t!26113 List!18482)) )
))
(declare-fun arrayNoDuplicates!0 (array!54804 (_ BitVec 32) List!18482) Bool)

(assert (=> b!917560 (= res!618583 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18479))))

(declare-fun res!618588 () Bool)

(assert (=> start!78688 (=> (not res!618588) (not e!515120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78688 (= res!618588 (validMask!0 mask!1881))))

(assert (=> start!78688 e!515120))

(assert (=> start!78688 true))

(assert (=> start!78688 tp_is_empty!19409))

(declare-fun e!515119 () Bool)

(declare-fun array_inv!20546 (array!54806) Bool)

(assert (=> start!78688 (and (array_inv!20546 _values!1231) e!515119)))

(assert (=> start!78688 tp!59144))

(declare-fun array_inv!20547 (array!54804) Bool)

(assert (=> start!78688 (array_inv!20547 _keys!1487)))

(declare-fun mapNonEmpty!30870 () Bool)

(declare-fun tp!59143 () Bool)

(assert (=> mapNonEmpty!30870 (= mapRes!30870 (and tp!59143 e!515125))))

(declare-fun mapValue!30870 () ValueCell!9223)

(declare-fun mapKey!30870 () (_ BitVec 32))

(declare-fun mapRest!30870 () (Array (_ BitVec 32) ValueCell!9223))

(assert (=> mapNonEmpty!30870 (= (arr!26348 _values!1231) (store mapRest!30870 mapKey!30870 mapValue!30870))))

(declare-fun b!917561 () Bool)

(declare-fun e!515123 () Bool)

(assert (=> b!917561 (= e!515123 tp_is_empty!19409)))

(declare-fun b!917562 () Bool)

(assert (=> b!917562 (= e!515119 (and e!515123 mapRes!30870))))

(declare-fun condMapEmpty!30870 () Bool)

(declare-fun mapDefault!30870 () ValueCell!9223)

