; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79002 () Bool)

(assert start!79002)

(declare-fun b_free!17215 () Bool)

(declare-fun b_next!17215 () Bool)

(assert (=> start!79002 (= b_free!17215 (not b_next!17215))))

(declare-fun tp!60085 () Bool)

(declare-fun b_and!28167 () Bool)

(assert (=> start!79002 (= tp!60085 b_and!28167)))

(declare-fun b!925081 () Bool)

(declare-fun res!623441 () Bool)

(declare-fun e!519184 () Bool)

(assert (=> b!925081 (=> (not res!623441) (not e!519184))))

(declare-datatypes ((array!55414 0))(
  ( (array!55415 (arr!26652 (Array (_ BitVec 32) (_ BitVec 64))) (size!27111 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55414)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31263 0))(
  ( (V!31264 (val!9912 Int)) )
))
(declare-datatypes ((ValueCell!9380 0))(
  ( (ValueCellFull!9380 (v!12430 V!31263)) (EmptyCell!9380) )
))
(declare-datatypes ((array!55416 0))(
  ( (array!55417 (arr!26653 (Array (_ BitVec 32) ValueCell!9380)) (size!27112 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55416)

(assert (=> b!925081 (= res!623441 (and (= (size!27112 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27111 _keys!1487) (size!27112 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925082 () Bool)

(declare-fun e!519176 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(assert (=> b!925082 (= e!519176 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925083 () Bool)

(declare-fun e!519181 () Bool)

(declare-fun tp_is_empty!19723 () Bool)

(assert (=> b!925083 (= e!519181 tp_is_empty!19723)))

(declare-fun b!925084 () Bool)

(declare-fun res!623437 () Bool)

(assert (=> b!925084 (=> (not res!623437) (not e!519184))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!925084 (= res!623437 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27111 _keys!1487))))))

(declare-fun b!925085 () Bool)

(declare-fun res!623443 () Bool)

(declare-fun e!519179 () Bool)

(assert (=> b!925085 (=> (not res!623443) (not e!519179))))

(declare-fun v!791 () V!31263)

(declare-datatypes ((tuple2!12920 0))(
  ( (tuple2!12921 (_1!6471 (_ BitVec 64)) (_2!6471 V!31263)) )
))
(declare-datatypes ((List!18722 0))(
  ( (Nil!18719) (Cons!18718 (h!19864 tuple2!12920) (t!26667 List!18722)) )
))
(declare-datatypes ((ListLongMap!11617 0))(
  ( (ListLongMap!11618 (toList!5824 List!18722)) )
))
(declare-fun lt!416194 () ListLongMap!11617)

(declare-fun apply!654 (ListLongMap!11617 (_ BitVec 64)) V!31263)

(assert (=> b!925085 (= res!623443 (= (apply!654 lt!416194 k!1099) v!791))))

(declare-fun b!925086 () Bool)

(declare-fun e!519183 () Bool)

(assert (=> b!925086 (= e!519184 e!519183)))

(declare-fun res!623442 () Bool)

(assert (=> b!925086 (=> (not res!623442) (not e!519183))))

(declare-fun lt!416200 () ListLongMap!11617)

(declare-fun contains!4884 (ListLongMap!11617 (_ BitVec 64)) Bool)

(assert (=> b!925086 (= res!623442 (contains!4884 lt!416200 k!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31263)

(declare-fun minValue!1173 () V!31263)

(declare-fun getCurrentListMap!3075 (array!55414 array!55416 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 32) Int) ListLongMap!11617)

(assert (=> b!925086 (= lt!416200 (getCurrentListMap!3075 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925087 () Bool)

(declare-fun lt!416196 () ListLongMap!11617)

(declare-fun e!519178 () Bool)

(assert (=> b!925087 (= e!519178 (= (apply!654 lt!416196 k!1099) v!791))))

(declare-fun b!925088 () Bool)

(declare-fun res!623436 () Bool)

(assert (=> b!925088 (=> (not res!623436) (not e!519184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55414 (_ BitVec 32)) Bool)

(assert (=> b!925088 (= res!623436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!623438 () Bool)

(assert (=> start!79002 (=> (not res!623438) (not e!519184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79002 (= res!623438 (validMask!0 mask!1881))))

(assert (=> start!79002 e!519184))

(assert (=> start!79002 true))

(assert (=> start!79002 tp_is_empty!19723))

(declare-fun e!519185 () Bool)

(declare-fun array_inv!20756 (array!55416) Bool)

(assert (=> start!79002 (and (array_inv!20756 _values!1231) e!519185)))

(assert (=> start!79002 tp!60085))

(declare-fun array_inv!20757 (array!55414) Bool)

(assert (=> start!79002 (array_inv!20757 _keys!1487)))

(declare-fun b!925089 () Bool)

(assert (=> b!925089 (= e!519179 (not true))))

(assert (=> b!925089 e!519178))

(declare-fun res!623444 () Bool)

(assert (=> b!925089 (=> (not res!623444) (not e!519178))))

(assert (=> b!925089 (= res!623444 (contains!4884 lt!416196 k!1099))))

(assert (=> b!925089 (= lt!416196 (getCurrentListMap!3075 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-datatypes ((Unit!31246 0))(
  ( (Unit!31247) )
))
(declare-fun lt!416185 () Unit!31246)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!66 (array!55414 array!55416 (_ BitVec 32) (_ BitVec 32) V!31263 V!31263 (_ BitVec 64) V!31263 (_ BitVec 32) Int) Unit!31246)

(assert (=> b!925089 (= lt!416185 (lemmaListMapApplyFromThenApplyFromZero!66 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925090 () Bool)

(declare-fun arrayContainsKey!0 (array!55414 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925090 (= e!519176 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!925091 () Bool)

(declare-fun e!519187 () Unit!31246)

(declare-fun Unit!31248 () Unit!31246)

(assert (=> b!925091 (= e!519187 Unit!31248)))

(declare-fun b!925092 () Bool)

(declare-fun res!623439 () Bool)

(assert (=> b!925092 (=> (not res!623439) (not e!519184))))

(declare-datatypes ((List!18723 0))(
  ( (Nil!18720) (Cons!18719 (h!19865 (_ BitVec 64)) (t!26668 List!18723)) )
))
(declare-fun arrayNoDuplicates!0 (array!55414 (_ BitVec 32) List!18723) Bool)

(assert (=> b!925092 (= res!623439 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18720))))

(declare-fun b!925093 () Bool)

(declare-fun e!519182 () Bool)

(assert (=> b!925093 (= e!519183 e!519182)))

(declare-fun res!623445 () Bool)

(assert (=> b!925093 (=> (not res!623445) (not e!519182))))

(declare-fun lt!416198 () V!31263)

(assert (=> b!925093 (= res!623445 (and (= lt!416198 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925093 (= lt!416198 (apply!654 lt!416200 k!1099))))

(declare-fun b!925094 () Bool)

(declare-fun mapRes!31341 () Bool)

(assert (=> b!925094 (= e!519185 (and e!519181 mapRes!31341))))

(declare-fun condMapEmpty!31341 () Bool)

(declare-fun mapDefault!31341 () ValueCell!9380)

