; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79786 () Bool)

(assert start!79786)

(declare-fun b_free!17759 () Bool)

(declare-fun b_next!17759 () Bool)

(assert (=> start!79786 (= b_free!17759 (not b_next!17759))))

(declare-fun tp!61736 () Bool)

(declare-fun b_and!29133 () Bool)

(assert (=> start!79786 (= tp!61736 b_and!29133)))

(declare-fun b!938497 () Bool)

(declare-fun e!527080 () Bool)

(declare-fun tp_is_empty!20267 () Bool)

(assert (=> b!938497 (= e!527080 tp_is_empty!20267)))

(declare-fun b!938498 () Bool)

(declare-fun res!631431 () Bool)

(declare-fun e!527081 () Bool)

(assert (=> b!938498 (=> (not res!631431) (not e!527081))))

(declare-datatypes ((array!56476 0))(
  ( (array!56477 (arr!27177 (Array (_ BitVec 32) (_ BitVec 64))) (size!27636 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56476)

(declare-datatypes ((List!19161 0))(
  ( (Nil!19158) (Cons!19157 (h!20303 (_ BitVec 64)) (t!27464 List!19161)) )
))
(declare-fun arrayNoDuplicates!0 (array!56476 (_ BitVec 32) List!19161) Bool)

(assert (=> b!938498 (= res!631431 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19158))))

(declare-fun b!938499 () Bool)

(declare-fun e!527079 () Bool)

(assert (=> b!938499 (= e!527079 tp_is_empty!20267)))

(declare-fun b!938500 () Bool)

(declare-datatypes ((V!31987 0))(
  ( (V!31988 (val!10184 Int)) )
))
(declare-datatypes ((tuple2!13384 0))(
  ( (tuple2!13385 (_1!6703 (_ BitVec 64)) (_2!6703 V!31987)) )
))
(declare-datatypes ((List!19162 0))(
  ( (Nil!19159) (Cons!19158 (h!20304 tuple2!13384) (t!27465 List!19162)) )
))
(declare-datatypes ((ListLongMap!12081 0))(
  ( (ListLongMap!12082 (toList!6056 List!19162)) )
))
(declare-fun lt!423826 () ListLongMap!12081)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun lt!423831 () V!31987)

(declare-fun apply!857 (ListLongMap!12081 (_ BitVec 64)) V!31987)

(assert (=> b!938500 (= (apply!857 lt!423826 k!1099) lt!423831)))

(declare-fun lt!423822 () ListLongMap!12081)

(declare-fun lt!423821 () (_ BitVec 64))

(declare-fun lt!423823 () V!31987)

(declare-datatypes ((Unit!31704 0))(
  ( (Unit!31705) )
))
(declare-fun lt!423828 () Unit!31704)

(declare-fun addApplyDifferent!442 (ListLongMap!12081 (_ BitVec 64) V!31987 (_ BitVec 64)) Unit!31704)

(assert (=> b!938500 (= lt!423828 (addApplyDifferent!442 lt!423822 lt!423821 lt!423823 k!1099))))

(assert (=> b!938500 (not (= lt!423821 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!423819 () Unit!31704)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!56476 (_ BitVec 64) (_ BitVec 32) List!19161) Unit!31704)

(assert (=> b!938500 (= lt!423819 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19158))))

(declare-fun e!527075 () Bool)

(assert (=> b!938500 e!527075))

(declare-fun c!97807 () Bool)

(assert (=> b!938500 (= c!97807 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!423824 () Unit!31704)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9652 0))(
  ( (ValueCellFull!9652 (v!12712 V!31987)) (EmptyCell!9652) )
))
(declare-datatypes ((array!56478 0))(
  ( (array!56479 (arr!27178 (Array (_ BitVec 32) ValueCell!9652)) (size!27637 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56478)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31987)

(declare-fun minValue!1173 () V!31987)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!315 (array!56476 array!56478 (_ BitVec 32) (_ BitVec 32) V!31987 V!31987 (_ BitVec 64) (_ BitVec 32) Int) Unit!31704)

(assert (=> b!938500 (= lt!423824 (lemmaListMapContainsThenArrayContainsFrom!315 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!938500 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19158)))

(declare-fun lt!423829 () Unit!31704)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56476 (_ BitVec 32) (_ BitVec 32)) Unit!31704)

(assert (=> b!938500 (= lt!423829 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!5116 (ListLongMap!12081 (_ BitVec 64)) Bool)

(assert (=> b!938500 (contains!5116 lt!423826 k!1099)))

(declare-fun lt!423820 () tuple2!13384)

(declare-fun +!2843 (ListLongMap!12081 tuple2!13384) ListLongMap!12081)

(assert (=> b!938500 (= lt!423826 (+!2843 lt!423822 lt!423820))))

(declare-fun lt!423827 () Unit!31704)

(declare-fun addStillContains!562 (ListLongMap!12081 (_ BitVec 64) V!31987 (_ BitVec 64)) Unit!31704)

(assert (=> b!938500 (= lt!423827 (addStillContains!562 lt!423822 lt!423821 lt!423823 k!1099))))

(declare-fun getCurrentListMap!3290 (array!56476 array!56478 (_ BitVec 32) (_ BitVec 32) V!31987 V!31987 (_ BitVec 32) Int) ListLongMap!12081)

(assert (=> b!938500 (= (getCurrentListMap!3290 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2843 (getCurrentListMap!3290 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!423820))))

(assert (=> b!938500 (= lt!423820 (tuple2!13385 lt!423821 lt!423823))))

(declare-fun get!14336 (ValueCell!9652 V!31987) V!31987)

(declare-fun dynLambda!1632 (Int (_ BitVec 64)) V!31987)

(assert (=> b!938500 (= lt!423823 (get!14336 (select (arr!27178 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1632 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!423818 () Unit!31704)

(declare-fun lemmaListMapRecursiveValidKeyArray!233 (array!56476 array!56478 (_ BitVec 32) (_ BitVec 32) V!31987 V!31987 (_ BitVec 32) Int) Unit!31704)

(assert (=> b!938500 (= lt!423818 (lemmaListMapRecursiveValidKeyArray!233 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!527076 () Unit!31704)

(assert (=> b!938500 (= e!527076 lt!423828)))

(declare-fun b!938501 () Bool)

(declare-fun arrayContainsKey!0 (array!56476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!938501 (= e!527075 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun v!791 () V!31987)

(declare-fun lt!423830 () ListLongMap!12081)

(declare-fun b!938502 () Bool)

(declare-fun e!527071 () Bool)

(assert (=> b!938502 (= e!527071 (not (= (apply!857 lt!423830 k!1099) v!791)))))

(declare-fun b!938503 () Bool)

(declare-fun res!631428 () Bool)

(assert (=> b!938503 (=> (not res!631428) (not e!527081))))

(assert (=> b!938503 (= res!631428 (and (= (size!27637 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27636 _keys!1487) (size!27637 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!938504 () Bool)

(declare-fun e!527078 () Unit!31704)

(declare-fun Unit!31706 () Unit!31704)

(assert (=> b!938504 (= e!527078 Unit!31706)))

(declare-fun b!938505 () Bool)

(declare-fun Unit!31707 () Unit!31704)

(assert (=> b!938505 (= e!527076 Unit!31707)))

(declare-fun b!938507 () Bool)

(declare-fun res!631427 () Bool)

(assert (=> b!938507 (=> (not res!631427) (not e!527081))))

(assert (=> b!938507 (= res!631427 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27636 _keys!1487))))))

(declare-fun b!938508 () Bool)

(declare-fun e!527074 () Bool)

(declare-fun mapRes!32176 () Bool)

(assert (=> b!938508 (= e!527074 (and e!527079 mapRes!32176))))

(declare-fun condMapEmpty!32176 () Bool)

(declare-fun mapDefault!32176 () ValueCell!9652)

