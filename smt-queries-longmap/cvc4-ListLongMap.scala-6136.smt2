; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78928 () Bool)

(assert start!78928)

(declare-fun b_free!17141 () Bool)

(declare-fun b_next!17141 () Bool)

(assert (=> start!78928 (= b_free!17141 (not b_next!17141))))

(declare-fun tp!59864 () Bool)

(declare-fun b_and!28019 () Bool)

(assert (=> start!78928 (= tp!59864 b_and!28019)))

(declare-fun b!923035 () Bool)

(declare-fun e!517884 () Bool)

(declare-fun e!517887 () Bool)

(assert (=> b!923035 (= e!517884 e!517887)))

(declare-fun res!622425 () Bool)

(assert (=> b!923035 (=> (not res!622425) (not e!517887))))

(declare-datatypes ((V!31163 0))(
  ( (V!31164 (val!9875 Int)) )
))
(declare-datatypes ((tuple2!12850 0))(
  ( (tuple2!12851 (_1!6436 (_ BitVec 64)) (_2!6436 V!31163)) )
))
(declare-datatypes ((List!18656 0))(
  ( (Nil!18653) (Cons!18652 (h!19798 tuple2!12850) (t!26527 List!18656)) )
))
(declare-datatypes ((ListLongMap!11547 0))(
  ( (ListLongMap!11548 (toList!5789 List!18656)) )
))
(declare-fun lt!414584 () ListLongMap!11547)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4852 (ListLongMap!11547 (_ BitVec 64)) Bool)

(assert (=> b!923035 (= res!622425 (contains!4852 lt!414584 k!1099))))

(declare-datatypes ((array!55274 0))(
  ( (array!55275 (arr!26582 (Array (_ BitVec 32) (_ BitVec 64))) (size!27041 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55274)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9343 0))(
  ( (ValueCellFull!9343 (v!12393 V!31163)) (EmptyCell!9343) )
))
(declare-datatypes ((array!55276 0))(
  ( (array!55277 (arr!26583 (Array (_ BitVec 32) ValueCell!9343)) (size!27042 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55276)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31163)

(declare-fun minValue!1173 () V!31163)

(declare-fun getCurrentListMap!3043 (array!55274 array!55276 (_ BitVec 32) (_ BitVec 32) V!31163 V!31163 (_ BitVec 32) Int) ListLongMap!11547)

(assert (=> b!923035 (= lt!414584 (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923036 () Bool)

(declare-fun e!517882 () Bool)

(assert (=> b!923036 (= e!517882 (not (bvsle from!1844 (size!27041 _keys!1487))))))

(declare-fun lt!414578 () (_ BitVec 64))

(assert (=> b!923036 (not (= lt!414578 k!1099))))

(declare-datatypes ((Unit!31134 0))(
  ( (Unit!31135) )
))
(declare-fun lt!414582 () Unit!31134)

(declare-datatypes ((List!18657 0))(
  ( (Nil!18654) (Cons!18653 (h!19799 (_ BitVec 64)) (t!26528 List!18657)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55274 (_ BitVec 64) (_ BitVec 32) List!18657) Unit!31134)

(assert (=> b!923036 (= lt!414582 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18654))))

(declare-fun e!517885 () Bool)

(assert (=> b!923036 e!517885))

(declare-fun c!96213 () Bool)

(assert (=> b!923036 (= c!96213 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!414585 () Unit!31134)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!200 (array!55274 array!55276 (_ BitVec 32) (_ BitVec 32) V!31163 V!31163 (_ BitVec 64) (_ BitVec 32) Int) Unit!31134)

(assert (=> b!923036 (= lt!414585 (lemmaListMapContainsThenArrayContainsFrom!200 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55274 (_ BitVec 32) List!18657) Bool)

(assert (=> b!923036 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18654)))

(declare-fun lt!414580 () Unit!31134)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55274 (_ BitVec 32) (_ BitVec 32)) Unit!31134)

(assert (=> b!923036 (= lt!414580 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!414586 () tuple2!12850)

(declare-fun +!2693 (ListLongMap!11547 tuple2!12850) ListLongMap!11547)

(assert (=> b!923036 (contains!4852 (+!2693 lt!414584 lt!414586) k!1099)))

(declare-fun lt!414579 () Unit!31134)

(declare-fun lt!414583 () V!31163)

(declare-fun addStillContains!417 (ListLongMap!11547 (_ BitVec 64) V!31163 (_ BitVec 64)) Unit!31134)

(assert (=> b!923036 (= lt!414579 (addStillContains!417 lt!414584 lt!414578 lt!414583 k!1099))))

(assert (=> b!923036 (= (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2693 (getCurrentListMap!3043 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!414586))))

(assert (=> b!923036 (= lt!414586 (tuple2!12851 lt!414578 lt!414583))))

(declare-fun get!13962 (ValueCell!9343 V!31163) V!31163)

(declare-fun dynLambda!1482 (Int (_ BitVec 64)) V!31163)

(assert (=> b!923036 (= lt!414583 (get!13962 (select (arr!26583 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1482 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!414581 () Unit!31134)

(declare-fun lemmaListMapRecursiveValidKeyArray!83 (array!55274 array!55276 (_ BitVec 32) (_ BitVec 32) V!31163 V!31163 (_ BitVec 32) Int) Unit!31134)

(assert (=> b!923036 (= lt!414581 (lemmaListMapRecursiveValidKeyArray!83 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923037 () Bool)

(declare-fun res!622431 () Bool)

(assert (=> b!923037 (=> (not res!622431) (not e!517884))))

(assert (=> b!923037 (= res!622431 (and (= (size!27042 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27041 _keys!1487) (size!27042 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923038 () Bool)

(assert (=> b!923038 (= e!517887 e!517882)))

(declare-fun res!622430 () Bool)

(assert (=> b!923038 (=> (not res!622430) (not e!517882))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923038 (= res!622430 (validKeyInArray!0 lt!414578))))

(assert (=> b!923038 (= lt!414578 (select (arr!26582 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!923040 () Bool)

(assert (=> b!923040 (= e!517885 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923041 () Bool)

(declare-fun e!517883 () Bool)

(declare-fun e!517888 () Bool)

(declare-fun mapRes!31230 () Bool)

(assert (=> b!923041 (= e!517883 (and e!517888 mapRes!31230))))

(declare-fun condMapEmpty!31230 () Bool)

(declare-fun mapDefault!31230 () ValueCell!9343)

