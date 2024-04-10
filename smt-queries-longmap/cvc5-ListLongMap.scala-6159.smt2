; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79062 () Bool)

(assert start!79062)

(declare-fun b_free!17275 () Bool)

(declare-fun b_next!17275 () Bool)

(assert (=> start!79062 (= b_free!17275 (not b_next!17275))))

(declare-fun tp!60266 () Bool)

(declare-fun b_and!28287 () Bool)

(assert (=> start!79062 (= tp!60266 b_and!28287)))

(declare-fun b!926941 () Bool)

(declare-fun res!624435 () Bool)

(declare-fun e!520352 () Bool)

(assert (=> b!926941 (=> (not res!624435) (not e!520352))))

(declare-datatypes ((array!55528 0))(
  ( (array!55529 (arr!26709 (Array (_ BitVec 32) (_ BitVec 64))) (size!27168 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55528)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55528 (_ BitVec 32)) Bool)

(assert (=> b!926941 (= res!624435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!926942 () Bool)

(declare-datatypes ((V!31343 0))(
  ( (V!31344 (val!9942 Int)) )
))
(declare-datatypes ((tuple2!12974 0))(
  ( (tuple2!12975 (_1!6498 (_ BitVec 64)) (_2!6498 V!31343)) )
))
(declare-datatypes ((List!18775 0))(
  ( (Nil!18772) (Cons!18771 (h!19917 tuple2!12974) (t!26780 List!18775)) )
))
(declare-datatypes ((ListLongMap!11671 0))(
  ( (ListLongMap!11672 (toList!5851 List!18775)) )
))
(declare-fun lt!417628 () ListLongMap!11671)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!417629 () V!31343)

(declare-fun apply!681 (ListLongMap!11671 (_ BitVec 64)) V!31343)

(assert (=> b!926942 (= (apply!681 lt!417628 k!1099) lt!417629)))

(declare-fun lt!417640 () (_ BitVec 64))

(declare-datatypes ((Unit!31341 0))(
  ( (Unit!31342) )
))
(declare-fun lt!417637 () Unit!31341)

(declare-fun lt!417635 () ListLongMap!11671)

(declare-fun lt!417626 () V!31343)

(declare-fun addApplyDifferent!398 (ListLongMap!11671 (_ BitVec 64) V!31343 (_ BitVec 64)) Unit!31341)

(assert (=> b!926942 (= lt!417637 (addApplyDifferent!398 lt!417635 lt!417640 lt!417626 k!1099))))

(assert (=> b!926942 (not (= lt!417640 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417630 () Unit!31341)

(declare-datatypes ((List!18776 0))(
  ( (Nil!18773) (Cons!18772 (h!19918 (_ BitVec 64)) (t!26781 List!18776)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55528 (_ BitVec 64) (_ BitVec 32) List!18776) Unit!31341)

(assert (=> b!926942 (= lt!417630 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18773))))

(declare-fun e!520347 () Bool)

(assert (=> b!926942 e!520347))

(declare-fun c!96797 () Bool)

(assert (=> b!926942 (= c!96797 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!417636 () Unit!31341)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9410 0))(
  ( (ValueCellFull!9410 (v!12460 V!31343)) (EmptyCell!9410) )
))
(declare-datatypes ((array!55530 0))(
  ( (array!55531 (arr!26710 (Array (_ BitVec 32) ValueCell!9410)) (size!27169 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55530)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31343)

(declare-fun minValue!1173 () V!31343)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!249 (array!55528 array!55530 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 64) (_ BitVec 32) Int) Unit!31341)

(assert (=> b!926942 (= lt!417636 (lemmaListMapContainsThenArrayContainsFrom!249 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55528 (_ BitVec 32) List!18776) Bool)

(assert (=> b!926942 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18773)))

(declare-fun lt!417627 () Unit!31341)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55528 (_ BitVec 32) (_ BitVec 32)) Unit!31341)

(assert (=> b!926942 (= lt!417627 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4910 (ListLongMap!11671 (_ BitVec 64)) Bool)

(assert (=> b!926942 (contains!4910 lt!417628 k!1099)))

(declare-fun lt!417634 () tuple2!12974)

(declare-fun +!2742 (ListLongMap!11671 tuple2!12974) ListLongMap!11671)

(assert (=> b!926942 (= lt!417628 (+!2742 lt!417635 lt!417634))))

(declare-fun lt!417632 () Unit!31341)

(declare-fun addStillContains!466 (ListLongMap!11671 (_ BitVec 64) V!31343 (_ BitVec 64)) Unit!31341)

(assert (=> b!926942 (= lt!417632 (addStillContains!466 lt!417635 lt!417640 lt!417626 k!1099))))

(declare-fun getCurrentListMap!3101 (array!55528 array!55530 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 32) Int) ListLongMap!11671)

(assert (=> b!926942 (= (getCurrentListMap!3101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2742 (getCurrentListMap!3101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417634))))

(assert (=> b!926942 (= lt!417634 (tuple2!12975 lt!417640 lt!417626))))

(declare-fun get!14057 (ValueCell!9410 V!31343) V!31343)

(declare-fun dynLambda!1531 (Int (_ BitVec 64)) V!31343)

(assert (=> b!926942 (= lt!417626 (get!14057 (select (arr!26710 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1531 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417625 () Unit!31341)

(declare-fun lemmaListMapRecursiveValidKeyArray!132 (array!55528 array!55530 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 32) Int) Unit!31341)

(assert (=> b!926942 (= lt!417625 (lemmaListMapRecursiveValidKeyArray!132 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520348 () Unit!31341)

(assert (=> b!926942 (= e!520348 lt!417637)))

(declare-fun b!926943 () Bool)

(declare-fun Unit!31343 () Unit!31341)

(assert (=> b!926943 (= e!520348 Unit!31343)))

(declare-fun b!926944 () Bool)

(declare-fun e!520357 () Unit!31341)

(assert (=> b!926944 (= e!520357 e!520348)))

(assert (=> b!926944 (= lt!417640 (select (arr!26709 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96796 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926944 (= c!96796 (validKeyInArray!0 lt!417640))))

(declare-fun b!926945 () Bool)

(declare-fun e!520353 () Bool)

(declare-fun tp_is_empty!19783 () Bool)

(assert (=> b!926945 (= e!520353 tp_is_empty!19783)))

(declare-fun b!926946 () Bool)

(declare-fun res!624436 () Bool)

(assert (=> b!926946 (=> (not res!624436) (not e!520352))))

(assert (=> b!926946 (= res!624436 (and (= (size!27169 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27168 _keys!1487) (size!27169 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun e!520346 () Bool)

(declare-fun v!791 () V!31343)

(declare-fun b!926947 () Bool)

(declare-fun lt!417631 () ListLongMap!11671)

(assert (=> b!926947 (= e!520346 (= (apply!681 lt!417631 k!1099) v!791))))

(declare-fun b!926948 () Bool)

(declare-fun e!520355 () Bool)

(assert (=> b!926948 (= e!520355 (not true))))

(assert (=> b!926948 e!520346))

(declare-fun res!624426 () Bool)

(assert (=> b!926948 (=> (not res!624426) (not e!520346))))

(assert (=> b!926948 (= res!624426 (contains!4910 lt!417631 k!1099))))

(assert (=> b!926948 (= lt!417631 (getCurrentListMap!3101 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417639 () Unit!31341)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!84 (array!55528 array!55530 (_ BitVec 32) (_ BitVec 32) V!31343 V!31343 (_ BitVec 64) V!31343 (_ BitVec 32) Int) Unit!31341)

(assert (=> b!926948 (= lt!417639 (lemmaListMapApplyFromThenApplyFromZero!84 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926949 () Bool)

(declare-fun e!520350 () Bool)

(declare-fun mapRes!31431 () Bool)

(assert (=> b!926949 (= e!520350 (and e!520353 mapRes!31431))))

(declare-fun condMapEmpty!31431 () Bool)

(declare-fun mapDefault!31431 () ValueCell!9410)

