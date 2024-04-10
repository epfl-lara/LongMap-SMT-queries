; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78940 () Bool)

(assert start!78940)

(declare-fun b_free!17153 () Bool)

(declare-fun b_next!17153 () Bool)

(assert (=> start!78940 (= b_free!17153 (not b_next!17153))))

(declare-fun tp!59900 () Bool)

(declare-fun b_and!28043 () Bool)

(assert (=> start!78940 (= tp!59900 b_and!28043)))

(declare-fun b!923341 () Bool)

(declare-fun e!518063 () Bool)

(declare-fun e!518060 () Bool)

(assert (=> b!923341 (= e!518063 e!518060)))

(declare-fun res!622601 () Bool)

(assert (=> b!923341 (=> (not res!622601) (not e!518060))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55296 0))(
  ( (array!55297 (arr!26593 (Array (_ BitVec 32) (_ BitVec 64))) (size!27052 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55296)

(assert (=> b!923341 (= res!622601 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27052 _keys!1487)))))

(declare-datatypes ((Unit!31148 0))(
  ( (Unit!31149) )
))
(declare-fun lt!414790 () Unit!31148)

(declare-fun e!518062 () Unit!31148)

(assert (=> b!923341 (= lt!414790 e!518062)))

(declare-fun c!96248 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923341 (= c!96248 (validKeyInArray!0 k!1099))))

(declare-fun res!622597 () Bool)

(declare-fun e!518068 () Bool)

(assert (=> start!78940 (=> (not res!622597) (not e!518068))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78940 (= res!622597 (validMask!0 mask!1881))))

(assert (=> start!78940 e!518068))

(assert (=> start!78940 true))

(declare-fun tp_is_empty!19661 () Bool)

(assert (=> start!78940 tp_is_empty!19661))

(declare-datatypes ((V!31179 0))(
  ( (V!31180 (val!9881 Int)) )
))
(declare-datatypes ((ValueCell!9349 0))(
  ( (ValueCellFull!9349 (v!12399 V!31179)) (EmptyCell!9349) )
))
(declare-datatypes ((array!55298 0))(
  ( (array!55299 (arr!26594 (Array (_ BitVec 32) ValueCell!9349)) (size!27053 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55298)

(declare-fun e!518057 () Bool)

(declare-fun array_inv!20710 (array!55298) Bool)

(assert (=> start!78940 (and (array_inv!20710 _values!1231) e!518057)))

(assert (=> start!78940 tp!59900))

(declare-fun array_inv!20711 (array!55296) Bool)

(assert (=> start!78940 (array_inv!20711 _keys!1487)))

(declare-fun b!923342 () Bool)

(declare-fun res!622598 () Bool)

(assert (=> b!923342 (=> (not res!622598) (not e!518068))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!923342 (= res!622598 (and (= (size!27053 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27052 _keys!1487) (size!27053 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923343 () Bool)

(declare-fun e!518067 () Bool)

(assert (=> b!923343 (= e!518067 tp_is_empty!19661)))

(declare-fun b!923344 () Bool)

(declare-datatypes ((tuple2!12862 0))(
  ( (tuple2!12863 (_1!6442 (_ BitVec 64)) (_2!6442 V!31179)) )
))
(declare-datatypes ((List!18666 0))(
  ( (Nil!18663) (Cons!18662 (h!19808 tuple2!12862) (t!26549 List!18666)) )
))
(declare-datatypes ((ListLongMap!11559 0))(
  ( (ListLongMap!11560 (toList!5795 List!18666)) )
))
(declare-fun lt!414796 () ListLongMap!11559)

(declare-fun lt!414797 () V!31179)

(declare-fun apply!625 (ListLongMap!11559 (_ BitVec 64)) V!31179)

(assert (=> b!923344 (= (apply!625 lt!414796 k!1099) lt!414797)))

(declare-fun lt!414792 () ListLongMap!11559)

(declare-fun lt!414801 () (_ BitVec 64))

(declare-fun lt!414800 () V!31179)

(declare-fun lt!414802 () Unit!31148)

(declare-fun addApplyDifferent!353 (ListLongMap!11559 (_ BitVec 64) V!31179 (_ BitVec 64)) Unit!31148)

(assert (=> b!923344 (= lt!414802 (addApplyDifferent!353 lt!414792 lt!414801 lt!414800 k!1099))))

(assert (=> b!923344 (not (= lt!414801 k!1099))))

(declare-fun lt!414795 () Unit!31148)

(declare-datatypes ((List!18667 0))(
  ( (Nil!18664) (Cons!18663 (h!19809 (_ BitVec 64)) (t!26550 List!18667)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55296 (_ BitVec 64) (_ BitVec 32) List!18667) Unit!31148)

(assert (=> b!923344 (= lt!414795 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18664))))

(declare-fun e!518061 () Bool)

(assert (=> b!923344 e!518061))

(declare-fun c!96249 () Bool)

(assert (=> b!923344 (= c!96249 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!414794 () Unit!31148)

(declare-fun zeroValue!1173 () V!31179)

(declare-fun minValue!1173 () V!31179)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!204 (array!55296 array!55298 (_ BitVec 32) (_ BitVec 32) V!31179 V!31179 (_ BitVec 64) (_ BitVec 32) Int) Unit!31148)

(assert (=> b!923344 (= lt!414794 (lemmaListMapContainsThenArrayContainsFrom!204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55296 (_ BitVec 32) List!18667) Bool)

(assert (=> b!923344 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18664)))

(declare-fun lt!414793 () Unit!31148)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55296 (_ BitVec 32) (_ BitVec 32)) Unit!31148)

(assert (=> b!923344 (= lt!414793 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4857 (ListLongMap!11559 (_ BitVec 64)) Bool)

(assert (=> b!923344 (contains!4857 lt!414796 k!1099)))

(declare-fun lt!414798 () tuple2!12862)

(declare-fun +!2697 (ListLongMap!11559 tuple2!12862) ListLongMap!11559)

(assert (=> b!923344 (= lt!414796 (+!2697 lt!414792 lt!414798))))

(declare-fun lt!414788 () Unit!31148)

(declare-fun addStillContains!421 (ListLongMap!11559 (_ BitVec 64) V!31179 (_ BitVec 64)) Unit!31148)

(assert (=> b!923344 (= lt!414788 (addStillContains!421 lt!414792 lt!414801 lt!414800 k!1099))))

(declare-fun getCurrentListMap!3048 (array!55296 array!55298 (_ BitVec 32) (_ BitVec 32) V!31179 V!31179 (_ BitVec 32) Int) ListLongMap!11559)

(assert (=> b!923344 (= (getCurrentListMap!3048 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2697 (getCurrentListMap!3048 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414798))))

(assert (=> b!923344 (= lt!414798 (tuple2!12863 lt!414801 lt!414800))))

(declare-fun get!13970 (ValueCell!9349 V!31179) V!31179)

(declare-fun dynLambda!1486 (Int (_ BitVec 64)) V!31179)

(assert (=> b!923344 (= lt!414800 (get!13970 (select (arr!26594 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1486 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414791 () Unit!31148)

(declare-fun lemmaListMapRecursiveValidKeyArray!87 (array!55296 array!55298 (_ BitVec 32) (_ BitVec 32) V!31179 V!31179 (_ BitVec 32) Int) Unit!31148)

(assert (=> b!923344 (= lt!414791 (lemmaListMapRecursiveValidKeyArray!87 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!518066 () Unit!31148)

(assert (=> b!923344 (= e!518066 lt!414802)))

(declare-fun b!923345 () Bool)

(declare-fun e!518065 () Bool)

(assert (=> b!923345 (= e!518065 false)))

(declare-fun lt!414789 () V!31179)

(declare-fun lt!414799 () ListLongMap!11559)

(assert (=> b!923345 (= lt!414789 (apply!625 lt!414799 k!1099))))

(declare-fun b!923346 () Bool)

(assert (=> b!923346 (= e!518062 e!518066)))

(assert (=> b!923346 (= lt!414801 (select (arr!26593 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96247 () Bool)

(assert (=> b!923346 (= c!96247 (validKeyInArray!0 lt!414801))))

(declare-fun b!923347 () Bool)

(assert (=> b!923347 (= e!518060 e!518065)))

(declare-fun res!622596 () Bool)

(assert (=> b!923347 (=> (not res!622596) (not e!518065))))

(assert (=> b!923347 (= res!622596 (contains!4857 lt!414799 k!1099))))

(assert (=> b!923347 (= lt!414799 (getCurrentListMap!3048 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923348 () Bool)

(declare-fun res!622602 () Bool)

(assert (=> b!923348 (=> (not res!622602) (not e!518068))))

(assert (=> b!923348 (= res!622602 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18664))))

(declare-fun b!923349 () Bool)

(declare-fun e!518059 () Bool)

(assert (=> b!923349 (= e!518059 e!518063)))

(declare-fun res!622600 () Bool)

(assert (=> b!923349 (=> (not res!622600) (not e!518063))))

(declare-fun v!791 () V!31179)

(assert (=> b!923349 (= res!622600 (and (= lt!414797 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!923349 (= lt!414797 (apply!625 lt!414792 k!1099))))

(declare-fun b!923350 () Bool)

(declare-fun arrayContainsKey!0 (array!55296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923350 (= e!518061 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapIsEmpty!31248 () Bool)

(declare-fun mapRes!31248 () Bool)

(assert (=> mapIsEmpty!31248 mapRes!31248))

(declare-fun b!923351 () Bool)

(declare-fun e!518064 () Bool)

(assert (=> b!923351 (= e!518064 tp_is_empty!19661)))

(declare-fun b!923352 () Bool)

(declare-fun Unit!31150 () Unit!31148)

(assert (=> b!923352 (= e!518062 Unit!31150)))

(declare-fun b!923353 () Bool)

(assert (=> b!923353 (= e!518061 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923354 () Bool)

(declare-fun res!622595 () Bool)

(assert (=> b!923354 (=> (not res!622595) (not e!518068))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55296 (_ BitVec 32)) Bool)

(assert (=> b!923354 (= res!622595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923355 () Bool)

(declare-fun Unit!31151 () Unit!31148)

(assert (=> b!923355 (= e!518066 Unit!31151)))

(declare-fun b!923356 () Bool)

(assert (=> b!923356 (= e!518057 (and e!518064 mapRes!31248))))

(declare-fun condMapEmpty!31248 () Bool)

(declare-fun mapDefault!31248 () ValueCell!9349)

