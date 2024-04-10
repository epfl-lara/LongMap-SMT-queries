; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78802 () Bool)

(assert start!78802)

(declare-fun b_free!17015 () Bool)

(declare-fun b_next!17015 () Bool)

(assert (=> start!78802 (= b_free!17015 (not b_next!17015))))

(declare-fun tp!59485 () Bool)

(declare-fun b_and!27767 () Bool)

(assert (=> start!78802 (= tp!59485 b_and!27767)))

(declare-fun b!919887 () Bool)

(declare-fun e!516316 () Bool)

(declare-fun tp_is_empty!19523 () Bool)

(assert (=> b!919887 (= e!516316 tp_is_empty!19523)))

(declare-fun b!919888 () Bool)

(declare-fun e!516317 () Bool)

(assert (=> b!919888 (= e!516317 (not true))))

(declare-datatypes ((array!55028 0))(
  ( (array!55029 (arr!26459 (Array (_ BitVec 32) (_ BitVec 64))) (size!26918 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55028)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18556 0))(
  ( (Nil!18553) (Cons!18552 (h!19698 (_ BitVec 64)) (t!26301 List!18556)) )
))
(declare-fun arrayNoDuplicates!0 (array!55028 (_ BitVec 32) List!18556) Bool)

(assert (=> b!919888 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18553)))

(declare-datatypes ((Unit!31048 0))(
  ( (Unit!31049) )
))
(declare-fun lt!412935 () Unit!31048)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55028 (_ BitVec 32) (_ BitVec 32)) Unit!31048)

(assert (=> b!919888 (= lt!412935 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!30995 0))(
  ( (V!30996 (val!9812 Int)) )
))
(declare-datatypes ((tuple2!12752 0))(
  ( (tuple2!12753 (_1!6387 (_ BitVec 64)) (_2!6387 V!30995)) )
))
(declare-datatypes ((List!18557 0))(
  ( (Nil!18554) (Cons!18553 (h!19699 tuple2!12752) (t!26302 List!18557)) )
))
(declare-datatypes ((ListLongMap!11449 0))(
  ( (ListLongMap!11450 (toList!5740 List!18557)) )
))
(declare-fun lt!412933 () ListLongMap!11449)

(declare-fun lt!412934 () tuple2!12752)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4786 (ListLongMap!11449 (_ BitVec 64)) Bool)

(declare-fun +!2650 (ListLongMap!11449 tuple2!12752) ListLongMap!11449)

(assert (=> b!919888 (contains!4786 (+!2650 lt!412933 lt!412934) k!1099)))

(declare-fun lt!412937 () V!30995)

(declare-fun lt!412939 () (_ BitVec 64))

(declare-fun lt!412938 () Unit!31048)

(declare-fun addStillContains!374 (ListLongMap!11449 (_ BitVec 64) V!30995 (_ BitVec 64)) Unit!31048)

(assert (=> b!919888 (= lt!412938 (addStillContains!374 lt!412933 lt!412939 lt!412937 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9280 0))(
  ( (ValueCellFull!9280 (v!12330 V!30995)) (EmptyCell!9280) )
))
(declare-datatypes ((array!55030 0))(
  ( (array!55031 (arr!26460 (Array (_ BitVec 32) ValueCell!9280)) (size!26919 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55030)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30995)

(declare-fun minValue!1173 () V!30995)

(declare-fun getCurrentListMap!2996 (array!55028 array!55030 (_ BitVec 32) (_ BitVec 32) V!30995 V!30995 (_ BitVec 32) Int) ListLongMap!11449)

(assert (=> b!919888 (= (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2650 (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412934))))

(assert (=> b!919888 (= lt!412934 (tuple2!12753 lt!412939 lt!412937))))

(declare-fun get!13877 (ValueCell!9280 V!30995) V!30995)

(declare-fun dynLambda!1439 (Int (_ BitVec 64)) V!30995)

(assert (=> b!919888 (= lt!412937 (get!13877 (select (arr!26460 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1439 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412936 () Unit!31048)

(declare-fun lemmaListMapRecursiveValidKeyArray!40 (array!55028 array!55030 (_ BitVec 32) (_ BitVec 32) V!30995 V!30995 (_ BitVec 32) Int) Unit!31048)

(assert (=> b!919888 (= lt!412936 (lemmaListMapRecursiveValidKeyArray!40 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapIsEmpty!31041 () Bool)

(declare-fun mapRes!31041 () Bool)

(assert (=> mapIsEmpty!31041 mapRes!31041))

(declare-fun b!919889 () Bool)

(declare-fun res!620299 () Bool)

(declare-fun e!516321 () Bool)

(assert (=> b!919889 (=> (not res!620299) (not e!516321))))

(assert (=> b!919889 (= res!620299 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26918 _keys!1487))))))

(declare-fun b!919890 () Bool)

(declare-fun e!516318 () Bool)

(assert (=> b!919890 (= e!516321 e!516318)))

(declare-fun res!620295 () Bool)

(assert (=> b!919890 (=> (not res!620295) (not e!516318))))

(assert (=> b!919890 (= res!620295 (contains!4786 lt!412933 k!1099))))

(assert (=> b!919890 (= lt!412933 (getCurrentListMap!2996 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919892 () Bool)

(declare-fun res!620296 () Bool)

(assert (=> b!919892 (=> (not res!620296) (not e!516318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919892 (= res!620296 (validKeyInArray!0 k!1099))))

(declare-fun b!919893 () Bool)

(declare-fun res!620291 () Bool)

(assert (=> b!919893 (=> (not res!620291) (not e!516318))))

(assert (=> b!919893 (= res!620291 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31041 () Bool)

(declare-fun tp!59486 () Bool)

(declare-fun e!516320 () Bool)

(assert (=> mapNonEmpty!31041 (= mapRes!31041 (and tp!59486 e!516320))))

(declare-fun mapValue!31041 () ValueCell!9280)

(declare-fun mapRest!31041 () (Array (_ BitVec 32) ValueCell!9280))

(declare-fun mapKey!31041 () (_ BitVec 32))

(assert (=> mapNonEmpty!31041 (= (arr!26460 _values!1231) (store mapRest!31041 mapKey!31041 mapValue!31041))))

(declare-fun b!919894 () Bool)

(declare-fun res!620292 () Bool)

(assert (=> b!919894 (=> (not res!620292) (not e!516321))))

(assert (=> b!919894 (= res!620292 (and (= (size!26919 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26918 _keys!1487) (size!26919 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919895 () Bool)

(declare-fun res!620297 () Bool)

(assert (=> b!919895 (=> (not res!620297) (not e!516318))))

(declare-fun v!791 () V!30995)

(declare-fun apply!583 (ListLongMap!11449 (_ BitVec 64)) V!30995)

(assert (=> b!919895 (= res!620297 (= (apply!583 lt!412933 k!1099) v!791))))

(declare-fun b!919896 () Bool)

(assert (=> b!919896 (= e!516320 tp_is_empty!19523)))

(declare-fun b!919897 () Bool)

(declare-fun res!620294 () Bool)

(assert (=> b!919897 (=> (not res!620294) (not e!516321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55028 (_ BitVec 32)) Bool)

(assert (=> b!919897 (= res!620294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919898 () Bool)

(declare-fun e!516319 () Bool)

(assert (=> b!919898 (= e!516319 (and e!516316 mapRes!31041))))

(declare-fun condMapEmpty!31041 () Bool)

(declare-fun mapDefault!31041 () ValueCell!9280)

