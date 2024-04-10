; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79638 () Bool)

(assert start!79638)

(declare-fun b_free!17687 () Bool)

(declare-fun b_next!17687 () Bool)

(assert (=> start!79638 (= b_free!17687 (not b_next!17687))))

(declare-fun tp!61517 () Bool)

(declare-fun b_and!28965 () Bool)

(assert (=> start!79638 (= tp!61517 b_and!28965)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!936148 () Bool)

(declare-fun e!525647 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56332 0))(
  ( (array!56333 (arr!27106 (Array (_ BitVec 32) (_ BitVec 64))) (size!27565 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56332)

(declare-fun arrayContainsKey!0 (array!56332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936148 (= e!525647 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!936149 () Bool)

(declare-fun e!525648 () Bool)

(declare-datatypes ((V!31891 0))(
  ( (V!31892 (val!10148 Int)) )
))
(declare-datatypes ((ValueCell!9616 0))(
  ( (ValueCellFull!9616 (v!12673 V!31891)) (EmptyCell!9616) )
))
(declare-datatypes ((array!56334 0))(
  ( (array!56335 (arr!27107 (Array (_ BitVec 32) ValueCell!9616)) (size!27566 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56334)

(assert (=> b!936149 (= e!525648 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27566 _values!1231))))))

(declare-fun lt!422033 () (_ BitVec 64))

(assert (=> b!936149 (not (= lt!422033 k!1099))))

(declare-datatypes ((Unit!31575 0))(
  ( (Unit!31576) )
))
(declare-fun lt!422035 () Unit!31575)

(declare-datatypes ((List!19105 0))(
  ( (Nil!19102) (Cons!19101 (h!20247 (_ BitVec 64)) (t!27336 List!19105)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56332 (_ BitVec 64) (_ BitVec 32) List!19105) Unit!31575)

(assert (=> b!936149 (= lt!422035 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19102))))

(assert (=> b!936149 e!525647))

(declare-fun c!97362 () Bool)

(assert (=> b!936149 (= c!97362 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!422028 () Unit!31575)

(declare-fun zeroValue!1173 () V!31891)

(declare-fun minValue!1173 () V!31891)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!292 (array!56332 array!56334 (_ BitVec 32) (_ BitVec 32) V!31891 V!31891 (_ BitVec 64) (_ BitVec 32) Int) Unit!31575)

(assert (=> b!936149 (= lt!422028 (lemmaListMapContainsThenArrayContainsFrom!292 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56332 (_ BitVec 32) List!19105) Bool)

(assert (=> b!936149 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19102)))

(declare-fun lt!422036 () Unit!31575)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56332 (_ BitVec 32) (_ BitVec 32)) Unit!31575)

(assert (=> b!936149 (= lt!422036 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13324 0))(
  ( (tuple2!13325 (_1!6673 (_ BitVec 64)) (_2!6673 V!31891)) )
))
(declare-datatypes ((List!19106 0))(
  ( (Nil!19103) (Cons!19102 (h!20248 tuple2!13324) (t!27337 List!19106)) )
))
(declare-datatypes ((ListLongMap!12021 0))(
  ( (ListLongMap!12022 (toList!6026 List!19106)) )
))
(declare-fun lt!422034 () ListLongMap!12021)

(declare-fun lt!422032 () tuple2!13324)

(declare-fun contains!5087 (ListLongMap!12021 (_ BitVec 64)) Bool)

(declare-fun +!2820 (ListLongMap!12021 tuple2!13324) ListLongMap!12021)

(assert (=> b!936149 (contains!5087 (+!2820 lt!422034 lt!422032) k!1099)))

(declare-fun lt!422030 () V!31891)

(declare-fun lt!422029 () Unit!31575)

(declare-fun addStillContains!539 (ListLongMap!12021 (_ BitVec 64) V!31891 (_ BitVec 64)) Unit!31575)

(assert (=> b!936149 (= lt!422029 (addStillContains!539 lt!422034 lt!422033 lt!422030 k!1099))))

(declare-fun getCurrentListMap!3263 (array!56332 array!56334 (_ BitVec 32) (_ BitVec 32) V!31891 V!31891 (_ BitVec 32) Int) ListLongMap!12021)

(assert (=> b!936149 (= (getCurrentListMap!3263 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2820 (getCurrentListMap!3263 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!422032))))

(assert (=> b!936149 (= lt!422032 (tuple2!13325 lt!422033 lt!422030))))

(declare-fun get!14286 (ValueCell!9616 V!31891) V!31891)

(declare-fun dynLambda!1609 (Int (_ BitVec 64)) V!31891)

(assert (=> b!936149 (= lt!422030 (get!14286 (select (arr!27107 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1609 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!422031 () Unit!31575)

(declare-fun lemmaListMapRecursiveValidKeyArray!210 (array!56332 array!56334 (_ BitVec 32) (_ BitVec 32) V!31891 V!31891 (_ BitVec 32) Int) Unit!31575)

(assert (=> b!936149 (= lt!422031 (lemmaListMapRecursiveValidKeyArray!210 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!630378 () Bool)

(declare-fun e!525652 () Bool)

(assert (=> start!79638 (=> (not res!630378) (not e!525652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79638 (= res!630378 (validMask!0 mask!1881))))

(assert (=> start!79638 e!525652))

(assert (=> start!79638 true))

(declare-fun tp_is_empty!20195 () Bool)

(assert (=> start!79638 tp_is_empty!20195))

(declare-fun e!525653 () Bool)

(declare-fun array_inv!21092 (array!56334) Bool)

(assert (=> start!79638 (and (array_inv!21092 _values!1231) e!525653)))

(assert (=> start!79638 tp!61517))

(declare-fun array_inv!21093 (array!56332) Bool)

(assert (=> start!79638 (array_inv!21093 _keys!1487)))

(declare-fun b!936150 () Bool)

(declare-fun res!630376 () Bool)

(assert (=> b!936150 (=> (not res!630376) (not e!525652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56332 (_ BitVec 32)) Bool)

(assert (=> b!936150 (= res!630376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!936151 () Bool)

(declare-fun res!630385 () Bool)

(declare-fun e!525650 () Bool)

(assert (=> b!936151 (=> (not res!630385) (not e!525650))))

(assert (=> b!936151 (= res!630385 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!936152 () Bool)

(declare-fun res!630384 () Bool)

(assert (=> b!936152 (=> (not res!630384) (not e!525652))))

(assert (=> b!936152 (= res!630384 (and (= (size!27566 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27565 _keys!1487) (size!27566 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!936153 () Bool)

(assert (=> b!936153 (= e!525652 e!525650)))

(declare-fun res!630382 () Bool)

(assert (=> b!936153 (=> (not res!630382) (not e!525650))))

(assert (=> b!936153 (= res!630382 (contains!5087 lt!422034 k!1099))))

(assert (=> b!936153 (= lt!422034 (getCurrentListMap!3263 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!936154 () Bool)

(declare-fun res!630379 () Bool)

(assert (=> b!936154 (=> (not res!630379) (not e!525650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!936154 (= res!630379 (validKeyInArray!0 k!1099))))

(declare-fun b!936155 () Bool)

(declare-fun e!525654 () Bool)

(assert (=> b!936155 (= e!525654 tp_is_empty!20195)))

(declare-fun b!936156 () Bool)

(declare-fun e!525649 () Bool)

(assert (=> b!936156 (= e!525649 tp_is_empty!20195)))

(declare-fun mapIsEmpty!32064 () Bool)

(declare-fun mapRes!32064 () Bool)

(assert (=> mapIsEmpty!32064 mapRes!32064))

(declare-fun b!936157 () Bool)

(assert (=> b!936157 (= e!525647 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!936158 () Bool)

(declare-fun res!630380 () Bool)

(assert (=> b!936158 (=> (not res!630380) (not e!525650))))

(declare-fun v!791 () V!31891)

(declare-fun apply!828 (ListLongMap!12021 (_ BitVec 64)) V!31891)

(assert (=> b!936158 (= res!630380 (= (apply!828 lt!422034 k!1099) v!791))))

(declare-fun b!936159 () Bool)

(assert (=> b!936159 (= e!525650 e!525648)))

(declare-fun res!630383 () Bool)

(assert (=> b!936159 (=> (not res!630383) (not e!525648))))

(assert (=> b!936159 (= res!630383 (validKeyInArray!0 lt!422033))))

(assert (=> b!936159 (= lt!422033 (select (arr!27106 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!32064 () Bool)

(declare-fun tp!61516 () Bool)

(assert (=> mapNonEmpty!32064 (= mapRes!32064 (and tp!61516 e!525649))))

(declare-fun mapKey!32064 () (_ BitVec 32))

(declare-fun mapValue!32064 () ValueCell!9616)

(declare-fun mapRest!32064 () (Array (_ BitVec 32) ValueCell!9616))

(assert (=> mapNonEmpty!32064 (= (arr!27107 _values!1231) (store mapRest!32064 mapKey!32064 mapValue!32064))))

(declare-fun b!936160 () Bool)

(declare-fun res!630381 () Bool)

(assert (=> b!936160 (=> (not res!630381) (not e!525652))))

(assert (=> b!936160 (= res!630381 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19102))))

(declare-fun b!936161 () Bool)

(declare-fun res!630377 () Bool)

(assert (=> b!936161 (=> (not res!630377) (not e!525652))))

(assert (=> b!936161 (= res!630377 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27565 _keys!1487))))))

(declare-fun b!936162 () Bool)

(assert (=> b!936162 (= e!525653 (and e!525654 mapRes!32064))))

(declare-fun condMapEmpty!32064 () Bool)

(declare-fun mapDefault!32064 () ValueCell!9616)

