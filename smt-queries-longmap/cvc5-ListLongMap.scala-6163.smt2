; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79086 () Bool)

(assert start!79086)

(declare-fun b_free!17299 () Bool)

(declare-fun b_next!17299 () Bool)

(assert (=> start!79086 (= b_free!17299 (not b_next!17299))))

(declare-fun tp!60338 () Bool)

(declare-fun b_and!28335 () Bool)

(assert (=> start!79086 (= tp!60338 b_and!28335)))

(declare-fun b!927685 () Bool)

(declare-datatypes ((V!31375 0))(
  ( (V!31376 (val!9954 Int)) )
))
(declare-datatypes ((tuple2!12996 0))(
  ( (tuple2!12997 (_1!6509 (_ BitVec 64)) (_2!6509 V!31375)) )
))
(declare-datatypes ((List!18797 0))(
  ( (Nil!18794) (Cons!18793 (h!19939 tuple2!12996) (t!26826 List!18797)) )
))
(declare-datatypes ((ListLongMap!11693 0))(
  ( (ListLongMap!11694 (toList!5862 List!18797)) )
))
(declare-fun lt!418205 () ListLongMap!11693)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!418210 () V!31375)

(declare-fun apply!692 (ListLongMap!11693 (_ BitVec 64)) V!31375)

(assert (=> b!927685 (= (apply!692 lt!418205 k!1099) lt!418210)))

(declare-fun lt!418214 () (_ BitVec 64))

(declare-fun lt!418204 () ListLongMap!11693)

(declare-datatypes ((Unit!31382 0))(
  ( (Unit!31383) )
))
(declare-fun lt!418211 () Unit!31382)

(declare-fun lt!418208 () V!31375)

(declare-fun addApplyDifferent!407 (ListLongMap!11693 (_ BitVec 64) V!31375 (_ BitVec 64)) Unit!31382)

(assert (=> b!927685 (= lt!418211 (addApplyDifferent!407 lt!418204 lt!418214 lt!418208 k!1099))))

(assert (=> b!927685 (not (= lt!418214 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!418212 () Unit!31382)

(declare-datatypes ((array!55574 0))(
  ( (array!55575 (arr!26732 (Array (_ BitVec 32) (_ BitVec 64))) (size!27191 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55574)

(declare-datatypes ((List!18798 0))(
  ( (Nil!18795) (Cons!18794 (h!19940 (_ BitVec 64)) (t!26827 List!18798)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55574 (_ BitVec 64) (_ BitVec 32) List!18798) Unit!31382)

(assert (=> b!927685 (= lt!418212 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18795))))

(declare-fun e!520815 () Bool)

(assert (=> b!927685 e!520815))

(declare-fun c!96906 () Bool)

(assert (=> b!927685 (= c!96906 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9422 0))(
  ( (ValueCellFull!9422 (v!12472 V!31375)) (EmptyCell!9422) )
))
(declare-datatypes ((array!55576 0))(
  ( (array!55577 (arr!26733 (Array (_ BitVec 32) ValueCell!9422)) (size!27192 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55576)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!418215 () Unit!31382)

(declare-fun zeroValue!1173 () V!31375)

(declare-fun minValue!1173 () V!31375)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!258 (array!55574 array!55576 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 64) (_ BitVec 32) Int) Unit!31382)

(assert (=> b!927685 (= lt!418215 (lemmaListMapContainsThenArrayContainsFrom!258 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55574 (_ BitVec 32) List!18798) Bool)

(assert (=> b!927685 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18795)))

(declare-fun lt!418213 () Unit!31382)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55574 (_ BitVec 32) (_ BitVec 32)) Unit!31382)

(assert (=> b!927685 (= lt!418213 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4920 (ListLongMap!11693 (_ BitVec 64)) Bool)

(assert (=> b!927685 (contains!4920 lt!418205 k!1099)))

(declare-fun lt!418209 () tuple2!12996)

(declare-fun +!2751 (ListLongMap!11693 tuple2!12996) ListLongMap!11693)

(assert (=> b!927685 (= lt!418205 (+!2751 lt!418204 lt!418209))))

(declare-fun lt!418206 () Unit!31382)

(declare-fun addStillContains!475 (ListLongMap!11693 (_ BitVec 64) V!31375 (_ BitVec 64)) Unit!31382)

(assert (=> b!927685 (= lt!418206 (addStillContains!475 lt!418204 lt!418214 lt!418208 k!1099))))

(declare-fun getCurrentListMap!3111 (array!55574 array!55576 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 32) Int) ListLongMap!11693)

(assert (=> b!927685 (= (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2751 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418209))))

(assert (=> b!927685 (= lt!418209 (tuple2!12997 lt!418214 lt!418208))))

(declare-fun get!14074 (ValueCell!9422 V!31375) V!31375)

(declare-fun dynLambda!1540 (Int (_ BitVec 64)) V!31375)

(assert (=> b!927685 (= lt!418208 (get!14074 (select (arr!26733 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1540 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418216 () Unit!31382)

(declare-fun lemmaListMapRecursiveValidKeyArray!141 (array!55574 array!55576 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 32) Int) Unit!31382)

(assert (=> b!927685 (= lt!418216 (lemmaListMapRecursiveValidKeyArray!141 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520819 () Unit!31382)

(assert (=> b!927685 (= e!520819 lt!418211)))

(declare-fun b!927686 () Bool)

(declare-fun res!624832 () Bool)

(declare-fun e!520822 () Bool)

(assert (=> b!927686 (=> (not res!624832) (not e!520822))))

(assert (=> b!927686 (= res!624832 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18795))))

(declare-fun b!927687 () Bool)

(declare-fun e!520824 () Bool)

(declare-fun e!520825 () Bool)

(assert (=> b!927687 (= e!520824 e!520825)))

(declare-fun res!624824 () Bool)

(assert (=> b!927687 (=> (not res!624824) (not e!520825))))

(declare-fun lt!418207 () ListLongMap!11693)

(assert (=> b!927687 (= res!624824 (contains!4920 lt!418207 k!1099))))

(assert (=> b!927687 (= lt!418207 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927688 () Bool)

(declare-fun res!624823 () Bool)

(assert (=> b!927688 (=> (not res!624823) (not e!520822))))

(assert (=> b!927688 (= res!624823 (and (= (size!27192 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27191 _keys!1487) (size!27192 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!927689 () Bool)

(assert (=> b!927689 (= e!520825 (not true))))

(declare-fun e!520818 () Bool)

(assert (=> b!927689 e!520818))

(declare-fun res!624825 () Bool)

(assert (=> b!927689 (=> (not res!624825) (not e!520818))))

(declare-fun lt!418202 () ListLongMap!11693)

(assert (=> b!927689 (= res!624825 (contains!4920 lt!418202 k!1099))))

(assert (=> b!927689 (= lt!418202 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!418203 () Unit!31382)

(declare-fun v!791 () V!31375)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!92 (array!55574 array!55576 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 64) V!31375 (_ BitVec 32) Int) Unit!31382)

(assert (=> b!927689 (= lt!418203 (lemmaListMapApplyFromThenApplyFromZero!92 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!927691 () Bool)

(declare-fun Unit!31384 () Unit!31382)

(assert (=> b!927691 (= e!520819 Unit!31384)))

(declare-fun b!927692 () Bool)

(declare-fun e!520823 () Bool)

(declare-fun tp_is_empty!19807 () Bool)

(assert (=> b!927692 (= e!520823 tp_is_empty!19807)))

(declare-fun b!927693 () Bool)

(declare-fun e!520821 () Bool)

(assert (=> b!927693 (= e!520822 e!520821)))

(declare-fun res!624830 () Bool)

(assert (=> b!927693 (=> (not res!624830) (not e!520821))))

(assert (=> b!927693 (= res!624830 (contains!4920 lt!418204 k!1099))))

(assert (=> b!927693 (= lt!418204 (getCurrentListMap!3111 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!927694 () Bool)

(declare-fun e!520816 () Unit!31382)

(declare-fun Unit!31385 () Unit!31382)

(assert (=> b!927694 (= e!520816 Unit!31385)))

(declare-fun mapNonEmpty!31467 () Bool)

(declare-fun mapRes!31467 () Bool)

(declare-fun tp!60337 () Bool)

(assert (=> mapNonEmpty!31467 (= mapRes!31467 (and tp!60337 e!520823))))

(declare-fun mapRest!31467 () (Array (_ BitVec 32) ValueCell!9422))

(declare-fun mapKey!31467 () (_ BitVec 32))

(declare-fun mapValue!31467 () ValueCell!9422)

(assert (=> mapNonEmpty!31467 (= (arr!26733 _values!1231) (store mapRest!31467 mapKey!31467 mapValue!31467))))

(declare-fun b!927695 () Bool)

(declare-fun res!624826 () Bool)

(assert (=> b!927695 (=> (not res!624826) (not e!520825))))

(assert (=> b!927695 (= res!624826 (= (apply!692 lt!418207 k!1099) v!791))))

(declare-fun b!927696 () Bool)

(declare-fun e!520820 () Bool)

(assert (=> b!927696 (= e!520820 e!520824)))

(declare-fun res!624828 () Bool)

(assert (=> b!927696 (=> (not res!624828) (not e!520824))))

(assert (=> b!927696 (= res!624828 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27191 _keys!1487)))))

(declare-fun lt!418201 () Unit!31382)

(assert (=> b!927696 (= lt!418201 e!520816)))

(declare-fun c!96905 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!927696 (= c!96905 (validKeyInArray!0 k!1099))))

(declare-fun b!927697 () Bool)

(assert (=> b!927697 (= e!520816 e!520819)))

(assert (=> b!927697 (= lt!418214 (select (arr!26732 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96904 () Bool)

(assert (=> b!927697 (= c!96904 (validKeyInArray!0 lt!418214))))

(declare-fun b!927698 () Bool)

(assert (=> b!927698 (= e!520815 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!927699 () Bool)

(assert (=> b!927699 (= e!520818 (= (apply!692 lt!418202 k!1099) v!791))))

(declare-fun b!927700 () Bool)

(declare-fun res!624822 () Bool)

(assert (=> b!927700 (=> (not res!624822) (not e!520822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55574 (_ BitVec 32)) Bool)

(assert (=> b!927700 (= res!624822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31467 () Bool)

(assert (=> mapIsEmpty!31467 mapRes!31467))

(declare-fun b!927701 () Bool)

(declare-fun arrayContainsKey!0 (array!55574 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!927701 (= e!520815 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!927702 () Bool)

(declare-fun e!520817 () Bool)

(assert (=> b!927702 (= e!520817 tp_is_empty!19807)))

(declare-fun b!927703 () Bool)

(declare-fun res!624827 () Bool)

(assert (=> b!927703 (=> (not res!624827) (not e!520822))))

(assert (=> b!927703 (= res!624827 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27191 _keys!1487))))))

(declare-fun b!927704 () Bool)

(declare-fun e!520814 () Bool)

(assert (=> b!927704 (= e!520814 (and e!520817 mapRes!31467))))

(declare-fun condMapEmpty!31467 () Bool)

(declare-fun mapDefault!31467 () ValueCell!9422)

