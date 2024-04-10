; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79044 () Bool)

(assert start!79044)

(declare-fun b_free!17257 () Bool)

(declare-fun b_next!17257 () Bool)

(assert (=> start!79044 (= b_free!17257 (not b_next!17257))))

(declare-fun tp!60212 () Bool)

(declare-fun b_and!28251 () Bool)

(assert (=> start!79044 (= tp!60212 b_and!28251)))

(declare-fun b!926383 () Bool)

(declare-datatypes ((V!31319 0))(
  ( (V!31320 (val!9933 Int)) )
))
(declare-datatypes ((tuple2!12960 0))(
  ( (tuple2!12961 (_1!6491 (_ BitVec 64)) (_2!6491 V!31319)) )
))
(declare-datatypes ((List!18761 0))(
  ( (Nil!18758) (Cons!18757 (h!19903 tuple2!12960) (t!26748 List!18761)) )
))
(declare-datatypes ((ListLongMap!11657 0))(
  ( (ListLongMap!11658 (toList!5844 List!18761)) )
))
(declare-fun lt!417206 () ListLongMap!11657)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!417207 () V!31319)

(declare-fun apply!674 (ListLongMap!11657 (_ BitVec 64)) V!31319)

(assert (=> b!926383 (= (apply!674 lt!417206 k!1099) lt!417207)))

(declare-fun lt!417205 () ListLongMap!11657)

(declare-fun lt!417203 () (_ BitVec 64))

(declare-datatypes ((Unit!31319 0))(
  ( (Unit!31320) )
))
(declare-fun lt!417200 () Unit!31319)

(declare-fun lt!417198 () V!31319)

(declare-fun addApplyDifferent!393 (ListLongMap!11657 (_ BitVec 64) V!31319 (_ BitVec 64)) Unit!31319)

(assert (=> b!926383 (= lt!417200 (addApplyDifferent!393 lt!417205 lt!417203 lt!417198 k!1099))))

(assert (=> b!926383 (not (= lt!417203 k!1099))))

(declare-datatypes ((array!55496 0))(
  ( (array!55497 (arr!26693 (Array (_ BitVec 32) (_ BitVec 64))) (size!27152 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55496)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!417208 () Unit!31319)

(declare-datatypes ((List!18762 0))(
  ( (Nil!18759) (Cons!18758 (h!19904 (_ BitVec 64)) (t!26749 List!18762)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55496 (_ BitVec 64) (_ BitVec 32) List!18762) Unit!31319)

(assert (=> b!926383 (= lt!417208 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18759))))

(declare-fun e!520005 () Bool)

(assert (=> b!926383 e!520005))

(declare-fun c!96717 () Bool)

(assert (=> b!926383 (= c!96717 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9401 0))(
  ( (ValueCellFull!9401 (v!12451 V!31319)) (EmptyCell!9401) )
))
(declare-datatypes ((array!55498 0))(
  ( (array!55499 (arr!26694 (Array (_ BitVec 32) ValueCell!9401)) (size!27153 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55498)

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!417199 () Unit!31319)

(declare-fun zeroValue!1173 () V!31319)

(declare-fun minValue!1173 () V!31319)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!244 (array!55496 array!55498 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 64) (_ BitVec 32) Int) Unit!31319)

(assert (=> b!926383 (= lt!417199 (lemmaListMapContainsThenArrayContainsFrom!244 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55496 (_ BitVec 32) List!18762) Bool)

(assert (=> b!926383 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18759)))

(declare-fun lt!417193 () Unit!31319)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55496 (_ BitVec 32) (_ BitVec 32)) Unit!31319)

(assert (=> b!926383 (= lt!417193 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4903 (ListLongMap!11657 (_ BitVec 64)) Bool)

(assert (=> b!926383 (contains!4903 lt!417206 k!1099)))

(declare-fun lt!417195 () tuple2!12960)

(declare-fun +!2737 (ListLongMap!11657 tuple2!12960) ListLongMap!11657)

(assert (=> b!926383 (= lt!417206 (+!2737 lt!417205 lt!417195))))

(declare-fun lt!417196 () Unit!31319)

(declare-fun addStillContains!461 (ListLongMap!11657 (_ BitVec 64) V!31319 (_ BitVec 64)) Unit!31319)

(assert (=> b!926383 (= lt!417196 (addStillContains!461 lt!417205 lt!417203 lt!417198 k!1099))))

(declare-fun getCurrentListMap!3094 (array!55496 array!55498 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 32) Int) ListLongMap!11657)

(assert (=> b!926383 (= (getCurrentListMap!3094 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2737 (getCurrentListMap!3094 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!417195))))

(assert (=> b!926383 (= lt!417195 (tuple2!12961 lt!417203 lt!417198))))

(declare-fun get!14046 (ValueCell!9401 V!31319) V!31319)

(declare-fun dynLambda!1526 (Int (_ BitVec 64)) V!31319)

(assert (=> b!926383 (= lt!417198 (get!14046 (select (arr!26694 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1526 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!417202 () Unit!31319)

(declare-fun lemmaListMapRecursiveValidKeyArray!127 (array!55496 array!55498 (_ BitVec 32) (_ BitVec 32) V!31319 V!31319 (_ BitVec 32) Int) Unit!31319)

(assert (=> b!926383 (= lt!417202 (lemmaListMapRecursiveValidKeyArray!127 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!520001 () Unit!31319)

(assert (=> b!926383 (= e!520001 lt!417200)))

(declare-fun b!926384 () Bool)

(declare-fun e!519997 () Bool)

(declare-fun e!520000 () Bool)

(declare-fun mapRes!31404 () Bool)

(assert (=> b!926384 (= e!519997 (and e!520000 mapRes!31404))))

(declare-fun condMapEmpty!31404 () Bool)

(declare-fun mapDefault!31404 () ValueCell!9401)

