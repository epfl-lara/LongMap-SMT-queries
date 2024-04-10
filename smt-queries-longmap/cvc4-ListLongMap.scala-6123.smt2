; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78850 () Bool)

(assert start!78850)

(declare-fun b_free!17063 () Bool)

(declare-fun b_next!17063 () Bool)

(assert (=> start!78850 (= b_free!17063 (not b_next!17063))))

(declare-fun tp!59629 () Bool)

(declare-fun b_and!27863 () Bool)

(assert (=> start!78850 (= tp!59629 b_and!27863)))

(declare-fun b!921091 () Bool)

(declare-fun e!516910 () Bool)

(declare-fun e!516916 () Bool)

(assert (=> b!921091 (= e!516910 e!516916)))

(declare-fun res!621147 () Bool)

(assert (=> b!921091 (=> (not res!621147) (not e!516916))))

(declare-datatypes ((V!31059 0))(
  ( (V!31060 (val!9836 Int)) )
))
(declare-datatypes ((tuple2!12790 0))(
  ( (tuple2!12791 (_1!6406 (_ BitVec 64)) (_2!6406 V!31059)) )
))
(declare-datatypes ((List!18593 0))(
  ( (Nil!18590) (Cons!18589 (h!19735 tuple2!12790) (t!26386 List!18593)) )
))
(declare-datatypes ((ListLongMap!11487 0))(
  ( (ListLongMap!11488 (toList!5759 List!18593)) )
))
(declare-fun lt!413532 () ListLongMap!11487)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4813 (ListLongMap!11487 (_ BitVec 64)) Bool)

(assert (=> b!921091 (= res!621147 (contains!4813 lt!413532 k!1099))))

(declare-datatypes ((array!55122 0))(
  ( (array!55123 (arr!26506 (Array (_ BitVec 32) (_ BitVec 64))) (size!26965 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55122)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9304 0))(
  ( (ValueCellFull!9304 (v!12354 V!31059)) (EmptyCell!9304) )
))
(declare-datatypes ((array!55124 0))(
  ( (array!55125 (arr!26507 (Array (_ BitVec 32) ValueCell!9304)) (size!26966 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55124)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31059)

(declare-fun minValue!1173 () V!31059)

(declare-fun getCurrentListMap!3013 (array!55122 array!55124 (_ BitVec 32) (_ BitVec 32) V!31059 V!31059 (_ BitVec 32) Int) ListLongMap!11487)

(assert (=> b!921091 (= lt!413532 (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!921092 () Bool)

(declare-fun e!516914 () Bool)

(assert (=> b!921092 (= e!516914 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921093 () Bool)

(declare-fun res!621153 () Bool)

(declare-fun e!516908 () Bool)

(assert (=> b!921093 (=> res!621153 e!516908)))

(declare-datatypes ((List!18594 0))(
  ( (Nil!18591) (Cons!18590 (h!19736 (_ BitVec 64)) (t!26387 List!18594)) )
))
(declare-fun noDuplicate!1340 (List!18594) Bool)

(assert (=> b!921093 (= res!621153 (not (noDuplicate!1340 Nil!18591)))))

(declare-fun b!921094 () Bool)

(declare-fun res!621146 () Bool)

(assert (=> b!921094 (=> res!621146 e!516908)))

(declare-fun contains!4814 (List!18594 (_ BitVec 64)) Bool)

(assert (=> b!921094 (= res!621146 (contains!4814 Nil!18591 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921095 () Bool)

(declare-fun e!516912 () Bool)

(assert (=> b!921095 (= e!516912 (not e!516908))))

(declare-fun res!621149 () Bool)

(assert (=> b!921095 (=> res!621149 e!516908)))

(assert (=> b!921095 (= res!621149 (or (bvsge (size!26965 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26965 _keys!1487))))))

(assert (=> b!921095 e!516914))

(declare-fun c!96096 () Bool)

(assert (=> b!921095 (= c!96096 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31080 0))(
  ( (Unit!31081) )
))
(declare-fun lt!413525 () Unit!31080)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!173 (array!55122 array!55124 (_ BitVec 32) (_ BitVec 32) V!31059 V!31059 (_ BitVec 64) (_ BitVec 32) Int) Unit!31080)

(assert (=> b!921095 (= lt!413525 (lemmaListMapContainsThenArrayContainsFrom!173 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55122 (_ BitVec 32) List!18594) Bool)

(assert (=> b!921095 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18591)))

(declare-fun lt!413530 () Unit!31080)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55122 (_ BitVec 32) (_ BitVec 32)) Unit!31080)

(assert (=> b!921095 (= lt!413530 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413526 () tuple2!12790)

(declare-fun +!2666 (ListLongMap!11487 tuple2!12790) ListLongMap!11487)

(assert (=> b!921095 (contains!4813 (+!2666 lt!413532 lt!413526) k!1099)))

(declare-fun lt!413531 () Unit!31080)

(declare-fun lt!413528 () V!31059)

(declare-fun lt!413529 () (_ BitVec 64))

(declare-fun addStillContains!390 (ListLongMap!11487 (_ BitVec 64) V!31059 (_ BitVec 64)) Unit!31080)

(assert (=> b!921095 (= lt!413531 (addStillContains!390 lt!413532 lt!413529 lt!413528 k!1099))))

(assert (=> b!921095 (= (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2666 (getCurrentListMap!3013 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413526))))

(assert (=> b!921095 (= lt!413526 (tuple2!12791 lt!413529 lt!413528))))

(declare-fun get!13909 (ValueCell!9304 V!31059) V!31059)

(declare-fun dynLambda!1455 (Int (_ BitVec 64)) V!31059)

(assert (=> b!921095 (= lt!413528 (get!13909 (select (arr!26507 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1455 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413527 () Unit!31080)

(declare-fun lemmaListMapRecursiveValidKeyArray!56 (array!55122 array!55124 (_ BitVec 32) (_ BitVec 32) V!31059 V!31059 (_ BitVec 32) Int) Unit!31080)

(assert (=> b!921095 (= lt!413527 (lemmaListMapRecursiveValidKeyArray!56 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921096 () Bool)

(declare-fun res!621143 () Bool)

(assert (=> b!921096 (=> (not res!621143) (not e!516910))))

(assert (=> b!921096 (= res!621143 (and (= (size!26966 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26965 _keys!1487) (size!26966 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!921097 () Bool)

(declare-fun res!621144 () Bool)

(assert (=> b!921097 (=> (not res!621144) (not e!516916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921097 (= res!621144 (validKeyInArray!0 k!1099))))

(declare-fun b!921098 () Bool)

(declare-fun e!516911 () Bool)

(declare-fun e!516909 () Bool)

(declare-fun mapRes!31113 () Bool)

(assert (=> b!921098 (= e!516911 (and e!516909 mapRes!31113))))

(declare-fun condMapEmpty!31113 () Bool)

(declare-fun mapDefault!31113 () ValueCell!9304)

