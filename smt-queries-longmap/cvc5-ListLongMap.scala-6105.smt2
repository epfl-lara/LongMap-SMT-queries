; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78738 () Bool)

(assert start!78738)

(declare-fun b_free!16951 () Bool)

(declare-fun b_next!16951 () Bool)

(assert (=> start!78738 (= b_free!16951 (not b_next!16951))))

(declare-fun tp!59293 () Bool)

(declare-fun b_and!27639 () Bool)

(assert (=> start!78738 (= tp!59293 b_and!27639)))

(declare-fun b!918575 () Bool)

(declare-fun res!619334 () Bool)

(declare-fun e!515650 () Bool)

(assert (=> b!918575 (=> (not res!619334) (not e!515650))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918575 (= res!619334 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918576 () Bool)

(declare-fun e!515646 () Bool)

(assert (=> b!918576 (= e!515650 e!515646)))

(declare-fun res!619337 () Bool)

(assert (=> b!918576 (=> (not res!619337) (not e!515646))))

(declare-fun lt!412296 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918576 (= res!619337 (validKeyInArray!0 lt!412296))))

(declare-datatypes ((array!54902 0))(
  ( (array!54903 (arr!26396 (Array (_ BitVec 32) (_ BitVec 64))) (size!26855 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54902)

(assert (=> b!918576 (= lt!412296 (select (arr!26396 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918577 () Bool)

(declare-fun res!619333 () Bool)

(declare-fun e!515644 () Bool)

(assert (=> b!918577 (=> (not res!619333) (not e!515644))))

(declare-datatypes ((List!18514 0))(
  ( (Nil!18511) (Cons!18510 (h!19656 (_ BitVec 64)) (t!26195 List!18514)) )
))
(declare-fun arrayNoDuplicates!0 (array!54902 (_ BitVec 32) List!18514) Bool)

(assert (=> b!918577 (= res!619333 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18511))))

(declare-fun b!918578 () Bool)

(assert (=> b!918578 (= e!515644 e!515650)))

(declare-fun res!619330 () Bool)

(assert (=> b!918578 (=> (not res!619330) (not e!515650))))

(declare-datatypes ((V!30911 0))(
  ( (V!30912 (val!9780 Int)) )
))
(declare-datatypes ((tuple2!12708 0))(
  ( (tuple2!12709 (_1!6365 (_ BitVec 64)) (_2!6365 V!30911)) )
))
(declare-datatypes ((List!18515 0))(
  ( (Nil!18512) (Cons!18511 (h!19657 tuple2!12708) (t!26196 List!18515)) )
))
(declare-datatypes ((ListLongMap!11405 0))(
  ( (ListLongMap!11406 (toList!5718 List!18515)) )
))
(declare-fun lt!412298 () ListLongMap!11405)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4764 (ListLongMap!11405 (_ BitVec 64)) Bool)

(assert (=> b!918578 (= res!619330 (contains!4764 lt!412298 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9248 0))(
  ( (ValueCellFull!9248 (v!12298 V!30911)) (EmptyCell!9248) )
))
(declare-datatypes ((array!54904 0))(
  ( (array!54905 (arr!26397 (Array (_ BitVec 32) ValueCell!9248)) (size!26856 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54904)

(declare-fun zeroValue!1173 () V!30911)

(declare-fun minValue!1173 () V!30911)

(declare-fun getCurrentListMap!2974 (array!54902 array!54904 (_ BitVec 32) (_ BitVec 32) V!30911 V!30911 (_ BitVec 32) Int) ListLongMap!11405)

(assert (=> b!918578 (= lt!412298 (getCurrentListMap!2974 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!619339 () Bool)

(assert (=> start!78738 (=> (not res!619339) (not e!515644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78738 (= res!619339 (validMask!0 mask!1881))))

(assert (=> start!78738 e!515644))

(assert (=> start!78738 true))

(declare-fun tp_is_empty!19459 () Bool)

(assert (=> start!78738 tp_is_empty!19459))

(declare-fun e!515649 () Bool)

(declare-fun array_inv!20576 (array!54904) Bool)

(assert (=> start!78738 (and (array_inv!20576 _values!1231) e!515649)))

(assert (=> start!78738 tp!59293))

(declare-fun array_inv!20577 (array!54902) Bool)

(assert (=> start!78738 (array_inv!20577 _keys!1487)))

(declare-fun b!918579 () Bool)

(declare-fun res!619335 () Bool)

(assert (=> b!918579 (=> (not res!619335) (not e!515650))))

(declare-fun v!791 () V!30911)

(declare-fun apply!565 (ListLongMap!11405 (_ BitVec 64)) V!30911)

(assert (=> b!918579 (= res!619335 (= (apply!565 lt!412298 k!1099) v!791))))

(declare-fun mapIsEmpty!30945 () Bool)

(declare-fun mapRes!30945 () Bool)

(assert (=> mapIsEmpty!30945 mapRes!30945))

(declare-fun b!918580 () Bool)

(assert (=> b!918580 (= e!515646 (not true))))

(declare-fun lt!412300 () tuple2!12708)

(declare-fun +!2630 (ListLongMap!11405 tuple2!12708) ListLongMap!11405)

(assert (=> b!918580 (contains!4764 (+!2630 lt!412298 lt!412300) k!1099)))

(declare-fun lt!412295 () V!30911)

(declare-datatypes ((Unit!31008 0))(
  ( (Unit!31009) )
))
(declare-fun lt!412297 () Unit!31008)

(declare-fun addStillContains!354 (ListLongMap!11405 (_ BitVec 64) V!30911 (_ BitVec 64)) Unit!31008)

(assert (=> b!918580 (= lt!412297 (addStillContains!354 lt!412298 lt!412296 lt!412295 k!1099))))

(assert (=> b!918580 (= (getCurrentListMap!2974 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2630 (getCurrentListMap!2974 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412300))))

(assert (=> b!918580 (= lt!412300 (tuple2!12709 lt!412296 lt!412295))))

(declare-fun get!13837 (ValueCell!9248 V!30911) V!30911)

(declare-fun dynLambda!1419 (Int (_ BitVec 64)) V!30911)

(assert (=> b!918580 (= lt!412295 (get!13837 (select (arr!26397 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1419 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412299 () Unit!31008)

(declare-fun lemmaListMapRecursiveValidKeyArray!20 (array!54902 array!54904 (_ BitVec 32) (_ BitVec 32) V!30911 V!30911 (_ BitVec 32) Int) Unit!31008)

(assert (=> b!918580 (= lt!412299 (lemmaListMapRecursiveValidKeyArray!20 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918581 () Bool)

(declare-fun res!619338 () Bool)

(assert (=> b!918581 (=> (not res!619338) (not e!515644))))

(assert (=> b!918581 (= res!619338 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26855 _keys!1487))))))

(declare-fun b!918582 () Bool)

(declare-fun e!515647 () Bool)

(assert (=> b!918582 (= e!515647 tp_is_empty!19459)))

(declare-fun b!918583 () Bool)

(assert (=> b!918583 (= e!515649 (and e!515647 mapRes!30945))))

(declare-fun condMapEmpty!30945 () Bool)

(declare-fun mapDefault!30945 () ValueCell!9248)

