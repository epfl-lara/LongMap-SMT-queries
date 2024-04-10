; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78844 () Bool)

(assert start!78844)

(declare-fun b_free!17057 () Bool)

(declare-fun b_next!17057 () Bool)

(assert (=> start!78844 (= b_free!17057 (not b_next!17057))))

(declare-fun tp!59612 () Bool)

(declare-fun b_and!27851 () Bool)

(assert (=> start!78844 (= tp!59612 b_and!27851)))

(declare-fun b!920923 () Bool)

(declare-fun res!621035 () Bool)

(declare-fun e!516835 () Bool)

(assert (=> b!920923 (=> (not res!621035) (not e!516835))))

(declare-datatypes ((array!55110 0))(
  ( (array!55111 (arr!26500 (Array (_ BitVec 32) (_ BitVec 64))) (size!26959 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55110)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55110 (_ BitVec 32)) Bool)

(assert (=> b!920923 (= res!621035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920924 () Bool)

(declare-fun res!621033 () Bool)

(assert (=> b!920924 (=> (not res!621033) (not e!516835))))

(declare-datatypes ((List!18587 0))(
  ( (Nil!18584) (Cons!18583 (h!19729 (_ BitVec 64)) (t!26374 List!18587)) )
))
(declare-fun arrayNoDuplicates!0 (array!55110 (_ BitVec 32) List!18587) Bool)

(assert (=> b!920924 (= res!621033 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18584))))

(declare-fun b!920925 () Bool)

(declare-fun e!516832 () Bool)

(assert (=> b!920925 (= e!516835 e!516832)))

(declare-fun res!621034 () Bool)

(assert (=> b!920925 (=> (not res!621034) (not e!516832))))

(declare-datatypes ((V!31051 0))(
  ( (V!31052 (val!9833 Int)) )
))
(declare-datatypes ((tuple2!12784 0))(
  ( (tuple2!12785 (_1!6403 (_ BitVec 64)) (_2!6403 V!31051)) )
))
(declare-datatypes ((List!18588 0))(
  ( (Nil!18585) (Cons!18584 (h!19730 tuple2!12784) (t!26375 List!18588)) )
))
(declare-datatypes ((ListLongMap!11481 0))(
  ( (ListLongMap!11482 (toList!5756 List!18588)) )
))
(declare-fun lt!413447 () ListLongMap!11481)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4808 (ListLongMap!11481 (_ BitVec 64)) Bool)

(assert (=> b!920925 (= res!621034 (contains!4808 lt!413447 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9301 0))(
  ( (ValueCellFull!9301 (v!12351 V!31051)) (EmptyCell!9301) )
))
(declare-datatypes ((array!55112 0))(
  ( (array!55113 (arr!26501 (Array (_ BitVec 32) ValueCell!9301)) (size!26960 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55112)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31051)

(declare-fun minValue!1173 () V!31051)

(declare-fun getCurrentListMap!3011 (array!55110 array!55112 (_ BitVec 32) (_ BitVec 32) V!31051 V!31051 (_ BitVec 32) Int) ListLongMap!11481)

(assert (=> b!920925 (= lt!413447 (getCurrentListMap!3011 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!920927 () Bool)

(declare-fun res!621036 () Bool)

(declare-fun e!516831 () Bool)

(assert (=> b!920927 (=> res!621036 e!516831)))

(declare-fun noDuplicate!1337 (List!18587) Bool)

(assert (=> b!920927 (= res!621036 (not (noDuplicate!1337 Nil!18584)))))

(declare-fun mapNonEmpty!31104 () Bool)

(declare-fun mapRes!31104 () Bool)

(declare-fun tp!59611 () Bool)

(declare-fun e!516830 () Bool)

(assert (=> mapNonEmpty!31104 (= mapRes!31104 (and tp!59611 e!516830))))

(declare-fun mapRest!31104 () (Array (_ BitVec 32) ValueCell!9301))

(declare-fun mapKey!31104 () (_ BitVec 32))

(declare-fun mapValue!31104 () ValueCell!9301)

(assert (=> mapNonEmpty!31104 (= (arr!26501 _values!1231) (store mapRest!31104 mapKey!31104 mapValue!31104))))

(declare-fun b!920928 () Bool)

(declare-fun res!621026 () Bool)

(assert (=> b!920928 (=> (not res!621026) (not e!516835))))

(assert (=> b!920928 (= res!621026 (and (= (size!26960 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26959 _keys!1487) (size!26960 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920929 () Bool)

(declare-fun res!621030 () Bool)

(assert (=> b!920929 (=> (not res!621030) (not e!516832))))

(declare-fun v!791 () V!31051)

(declare-fun apply!597 (ListLongMap!11481 (_ BitVec 64)) V!31051)

(assert (=> b!920929 (= res!621030 (= (apply!597 lt!413447 k!1099) v!791))))

(declare-fun mapIsEmpty!31104 () Bool)

(assert (=> mapIsEmpty!31104 mapRes!31104))

(declare-fun b!920930 () Bool)

(declare-fun e!516834 () Bool)

(assert (=> b!920930 (= e!516834 (not e!516831))))

(declare-fun res!621031 () Bool)

(assert (=> b!920930 (=> res!621031 e!516831)))

(assert (=> b!920930 (= res!621031 (or (bvsge (size!26959 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26959 _keys!1487))))))

(declare-fun e!516828 () Bool)

(assert (=> b!920930 e!516828))

(declare-fun c!96087 () Bool)

(assert (=> b!920930 (= c!96087 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31076 0))(
  ( (Unit!31077) )
))
(declare-fun lt!413444 () Unit!31076)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!171 (array!55110 array!55112 (_ BitVec 32) (_ BitVec 32) V!31051 V!31051 (_ BitVec 64) (_ BitVec 32) Int) Unit!31076)

(assert (=> b!920930 (= lt!413444 (lemmaListMapContainsThenArrayContainsFrom!171 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920930 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18584)))

(declare-fun lt!413452 () Unit!31076)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55110 (_ BitVec 32) (_ BitVec 32)) Unit!31076)

(assert (=> b!920930 (= lt!413452 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413446 () tuple2!12784)

(declare-fun +!2664 (ListLongMap!11481 tuple2!12784) ListLongMap!11481)

(assert (=> b!920930 (contains!4808 (+!2664 lt!413447 lt!413446) k!1099)))

(declare-fun lt!413450 () V!31051)

(declare-fun lt!413451 () Unit!31076)

(declare-fun lt!413449 () (_ BitVec 64))

(declare-fun addStillContains!388 (ListLongMap!11481 (_ BitVec 64) V!31051 (_ BitVec 64)) Unit!31076)

(assert (=> b!920930 (= lt!413451 (addStillContains!388 lt!413447 lt!413449 lt!413450 k!1099))))

(assert (=> b!920930 (= (getCurrentListMap!3011 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2664 (getCurrentListMap!3011 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413446))))

(assert (=> b!920930 (= lt!413446 (tuple2!12785 lt!413449 lt!413450))))

(declare-fun get!13905 (ValueCell!9301 V!31051) V!31051)

(declare-fun dynLambda!1453 (Int (_ BitVec 64)) V!31051)

(assert (=> b!920930 (= lt!413450 (get!13905 (select (arr!26501 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1453 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413448 () Unit!31076)

(declare-fun lemmaListMapRecursiveValidKeyArray!54 (array!55110 array!55112 (_ BitVec 32) (_ BitVec 32) V!31051 V!31051 (_ BitVec 32) Int) Unit!31076)

(assert (=> b!920930 (= lt!413448 (lemmaListMapRecursiveValidKeyArray!54 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920931 () Bool)

(declare-fun e!516833 () Bool)

(declare-fun tp_is_empty!19565 () Bool)

(assert (=> b!920931 (= e!516833 tp_is_empty!19565)))

(declare-fun b!920932 () Bool)

(assert (=> b!920932 (= e!516831 true)))

(declare-fun lt!413445 () Bool)

(declare-fun contains!4809 (List!18587 (_ BitVec 64)) Bool)

(assert (=> b!920932 (= lt!413445 (contains!4809 Nil!18584 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920933 () Bool)

(declare-fun e!516829 () Bool)

(assert (=> b!920933 (= e!516829 (and e!516833 mapRes!31104))))

(declare-fun condMapEmpty!31104 () Bool)

(declare-fun mapDefault!31104 () ValueCell!9301)

