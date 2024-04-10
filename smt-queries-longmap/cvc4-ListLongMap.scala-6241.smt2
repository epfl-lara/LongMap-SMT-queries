; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79874 () Bool)

(assert start!79874)

(declare-fun b_free!17771 () Bool)

(declare-fun b_next!17771 () Bool)

(assert (=> start!79874 (= b_free!17771 (not b_next!17771))))

(declare-fun tp!61777 () Bool)

(declare-fun b_and!29181 () Bool)

(assert (=> start!79874 (= tp!61777 b_and!29181)))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!32003 0))(
  ( (V!32004 (val!10190 Int)) )
))
(declare-fun v!791 () V!32003)

(declare-datatypes ((tuple2!13396 0))(
  ( (tuple2!13397 (_1!6709 (_ BitVec 64)) (_2!6709 V!32003)) )
))
(declare-datatypes ((List!19173 0))(
  ( (Nil!19170) (Cons!19169 (h!20315 tuple2!13396) (t!27488 List!19173)) )
))
(declare-datatypes ((ListLongMap!12093 0))(
  ( (ListLongMap!12094 (toList!6062 List!19173)) )
))
(declare-fun lt!424516 () ListLongMap!12093)

(declare-fun e!527639 () Bool)

(declare-fun b!939392 () Bool)

(declare-fun apply!863 (ListLongMap!12093 (_ BitVec 64)) V!32003)

(assert (=> b!939392 (= e!527639 (= (apply!863 lt!424516 k!1099) v!791))))

(declare-fun b!939393 () Bool)

(declare-fun res!631861 () Bool)

(declare-fun e!527637 () Bool)

(assert (=> b!939393 (=> (not res!631861) (not e!527637))))

(declare-datatypes ((array!56502 0))(
  ( (array!56503 (arr!27189 (Array (_ BitVec 32) (_ BitVec 64))) (size!27648 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56502)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9658 0))(
  ( (ValueCellFull!9658 (v!12721 V!32003)) (EmptyCell!9658) )
))
(declare-datatypes ((array!56504 0))(
  ( (array!56505 (arr!27190 (Array (_ BitVec 32) ValueCell!9658)) (size!27649 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56504)

(assert (=> b!939393 (= res!631861 (and (= (size!27649 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27648 _keys!1487) (size!27649 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939394 () Bool)

(declare-fun lt!424512 () ListLongMap!12093)

(declare-fun lt!424522 () V!32003)

(assert (=> b!939394 (= (apply!863 lt!424512 k!1099) lt!424522)))

(declare-fun lt!424520 () V!32003)

(declare-fun lt!424526 () ListLongMap!12093)

(declare-datatypes ((Unit!31750 0))(
  ( (Unit!31751) )
))
(declare-fun lt!424514 () Unit!31750)

(declare-fun lt!424521 () (_ BitVec 64))

(declare-fun addApplyDifferent!448 (ListLongMap!12093 (_ BitVec 64) V!32003 (_ BitVec 64)) Unit!31750)

(assert (=> b!939394 (= lt!424514 (addApplyDifferent!448 lt!424526 lt!424521 lt!424520 k!1099))))

(assert (=> b!939394 (not (= lt!424521 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!424528 () Unit!31750)

(declare-datatypes ((List!19174 0))(
  ( (Nil!19171) (Cons!19170 (h!20316 (_ BitVec 64)) (t!27489 List!19174)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56502 (_ BitVec 64) (_ BitVec 32) List!19174) Unit!31750)

(assert (=> b!939394 (= lt!424528 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19171))))

(declare-fun e!527644 () Bool)

(assert (=> b!939394 e!527644))

(declare-fun c!98002 () Bool)

(assert (=> b!939394 (= c!98002 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!424513 () Unit!31750)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!32003)

(declare-fun minValue!1173 () V!32003)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!321 (array!56502 array!56504 (_ BitVec 32) (_ BitVec 32) V!32003 V!32003 (_ BitVec 64) (_ BitVec 32) Int) Unit!31750)

(assert (=> b!939394 (= lt!424513 (lemmaListMapContainsThenArrayContainsFrom!321 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!56502 (_ BitVec 32) List!19174) Bool)

(assert (=> b!939394 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19171)))

(declare-fun lt!424518 () Unit!31750)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56502 (_ BitVec 32) (_ BitVec 32)) Unit!31750)

(assert (=> b!939394 (= lt!424518 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5124 (ListLongMap!12093 (_ BitVec 64)) Bool)

(assert (=> b!939394 (contains!5124 lt!424512 k!1099)))

(declare-fun lt!424523 () tuple2!13396)

(declare-fun +!2849 (ListLongMap!12093 tuple2!13396) ListLongMap!12093)

(assert (=> b!939394 (= lt!424512 (+!2849 lt!424526 lt!424523))))

(declare-fun lt!424519 () Unit!31750)

(declare-fun addStillContains!568 (ListLongMap!12093 (_ BitVec 64) V!32003 (_ BitVec 64)) Unit!31750)

(assert (=> b!939394 (= lt!424519 (addStillContains!568 lt!424526 lt!424521 lt!424520 k!1099))))

(declare-fun getCurrentListMap!3296 (array!56502 array!56504 (_ BitVec 32) (_ BitVec 32) V!32003 V!32003 (_ BitVec 32) Int) ListLongMap!12093)

(assert (=> b!939394 (= (getCurrentListMap!3296 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2849 (getCurrentListMap!3296 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!424523))))

(assert (=> b!939394 (= lt!424523 (tuple2!13397 lt!424521 lt!424520))))

(declare-fun get!14349 (ValueCell!9658 V!32003) V!32003)

(declare-fun dynLambda!1638 (Int (_ BitVec 64)) V!32003)

(assert (=> b!939394 (= lt!424520 (get!14349 (select (arr!27190 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1638 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!424517 () Unit!31750)

(declare-fun lemmaListMapRecursiveValidKeyArray!239 (array!56502 array!56504 (_ BitVec 32) (_ BitVec 32) V!32003 V!32003 (_ BitVec 32) Int) Unit!31750)

(assert (=> b!939394 (= lt!424517 (lemmaListMapRecursiveValidKeyArray!239 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527641 () Unit!31750)

(assert (=> b!939394 (= e!527641 lt!424514)))

(declare-fun mapIsEmpty!32198 () Bool)

(declare-fun mapRes!32198 () Bool)

(assert (=> mapIsEmpty!32198 mapRes!32198))

(declare-fun b!939396 () Bool)

(declare-fun res!631863 () Bool)

(assert (=> b!939396 (=> (not res!631863) (not e!527637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56502 (_ BitVec 32)) Bool)

(assert (=> b!939396 (= res!631863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939397 () Bool)

(declare-fun e!527645 () Bool)

(declare-fun e!527640 () Bool)

(assert (=> b!939397 (= e!527645 (and e!527640 mapRes!32198))))

(declare-fun condMapEmpty!32198 () Bool)

(declare-fun mapDefault!32198 () ValueCell!9658)

