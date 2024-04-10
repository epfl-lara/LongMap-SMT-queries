; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79228 () Bool)

(assert start!79228)

(declare-fun b_free!17441 () Bool)

(declare-fun b_next!17441 () Bool)

(assert (=> start!79228 (= b_free!17441 (not b_next!17441))))

(declare-fun tp!60764 () Bool)

(declare-fun b_and!28507 () Bool)

(assert (=> start!79228 (= tp!60764 b_and!28507)))

(declare-fun b!930301 () Bool)

(declare-fun res!626517 () Bool)

(declare-fun e!522397 () Bool)

(assert (=> b!930301 (=> (not res!626517) (not e!522397))))

(declare-datatypes ((array!55844 0))(
  ( (array!55845 (arr!26867 (Array (_ BitVec 32) (_ BitVec 64))) (size!27326 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55844)

(declare-datatypes ((List!18908 0))(
  ( (Nil!18905) (Cons!18904 (h!20050 (_ BitVec 64)) (t!26965 List!18908)) )
))
(declare-fun arrayNoDuplicates!0 (array!55844 (_ BitVec 32) List!18908) Bool)

(assert (=> b!930301 (= res!626517 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18905))))

(declare-fun mapNonEmpty!31680 () Bool)

(declare-fun mapRes!31680 () Bool)

(declare-fun tp!60763 () Bool)

(declare-fun e!522393 () Bool)

(assert (=> mapNonEmpty!31680 (= mapRes!31680 (and tp!60763 e!522393))))

(declare-fun mapKey!31680 () (_ BitVec 32))

(declare-datatypes ((V!31563 0))(
  ( (V!31564 (val!10025 Int)) )
))
(declare-datatypes ((ValueCell!9493 0))(
  ( (ValueCellFull!9493 (v!12543 V!31563)) (EmptyCell!9493) )
))
(declare-fun mapRest!31680 () (Array (_ BitVec 32) ValueCell!9493))

(declare-datatypes ((array!55846 0))(
  ( (array!55847 (arr!26868 (Array (_ BitVec 32) ValueCell!9493)) (size!27327 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55846)

(declare-fun mapValue!31680 () ValueCell!9493)

(assert (=> mapNonEmpty!31680 (= (arr!26868 _values!1231) (store mapRest!31680 mapKey!31680 mapValue!31680))))

(declare-fun b!930302 () Bool)

(declare-fun e!522396 () Bool)

(assert (=> b!930302 (= e!522397 e!522396)))

(declare-fun res!626513 () Bool)

(assert (=> b!930302 (=> (not res!626513) (not e!522396))))

(declare-datatypes ((tuple2!13116 0))(
  ( (tuple2!13117 (_1!6569 (_ BitVec 64)) (_2!6569 V!31563)) )
))
(declare-datatypes ((List!18909 0))(
  ( (Nil!18906) (Cons!18905 (h!20051 tuple2!13116) (t!26966 List!18909)) )
))
(declare-datatypes ((ListLongMap!11813 0))(
  ( (ListLongMap!11814 (toList!5922 List!18909)) )
))
(declare-fun lt!419212 () ListLongMap!11813)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4973 (ListLongMap!11813 (_ BitVec 64)) Bool)

(assert (=> b!930302 (= res!626513 (contains!4973 lt!419212 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31563)

(declare-fun minValue!1173 () V!31563)

(declare-fun getCurrentListMap!3164 (array!55844 array!55846 (_ BitVec 32) (_ BitVec 32) V!31563 V!31563 (_ BitVec 32) Int) ListLongMap!11813)

(assert (=> b!930302 (= lt!419212 (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!626516 () Bool)

(assert (=> start!79228 (=> (not res!626516) (not e!522397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79228 (= res!626516 (validMask!0 mask!1881))))

(assert (=> start!79228 e!522397))

(assert (=> start!79228 true))

(declare-fun tp_is_empty!19949 () Bool)

(assert (=> start!79228 tp_is_empty!19949))

(declare-fun e!522395 () Bool)

(declare-fun array_inv!20908 (array!55846) Bool)

(assert (=> start!79228 (and (array_inv!20908 _values!1231) e!522395)))

(assert (=> start!79228 tp!60764))

(declare-fun array_inv!20909 (array!55844) Bool)

(assert (=> start!79228 (array_inv!20909 _keys!1487)))

(declare-fun b!930303 () Bool)

(declare-fun res!626514 () Bool)

(assert (=> b!930303 (=> (not res!626514) (not e!522397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55844 (_ BitVec 32)) Bool)

(assert (=> b!930303 (= res!626514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930304 () Bool)

(declare-fun res!626518 () Bool)

(assert (=> b!930304 (=> (not res!626518) (not e!522396))))

(assert (=> b!930304 (= res!626518 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930305 () Bool)

(assert (=> b!930305 (= e!522396 false)))

(declare-fun lt!419211 () Bool)

(assert (=> b!930305 (= lt!419211 (contains!4973 (getCurrentListMap!3164 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!930306 () Bool)

(declare-fun e!522394 () Bool)

(assert (=> b!930306 (= e!522394 tp_is_empty!19949)))

(declare-fun mapIsEmpty!31680 () Bool)

(assert (=> mapIsEmpty!31680 mapRes!31680))

(declare-fun b!930307 () Bool)

(declare-fun res!626512 () Bool)

(assert (=> b!930307 (=> (not res!626512) (not e!522396))))

(declare-fun v!791 () V!31563)

(declare-fun apply!744 (ListLongMap!11813 (_ BitVec 64)) V!31563)

(assert (=> b!930307 (= res!626512 (= (apply!744 lt!419212 k!1099) v!791))))

(declare-fun b!930308 () Bool)

(declare-fun res!626515 () Bool)

(assert (=> b!930308 (=> (not res!626515) (not e!522397))))

(assert (=> b!930308 (= res!626515 (and (= (size!27327 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27326 _keys!1487) (size!27327 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930309 () Bool)

(declare-fun res!626511 () Bool)

(assert (=> b!930309 (=> (not res!626511) (not e!522397))))

(assert (=> b!930309 (= res!626511 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27326 _keys!1487))))))

(declare-fun b!930310 () Bool)

(assert (=> b!930310 (= e!522393 tp_is_empty!19949)))

(declare-fun b!930311 () Bool)

(assert (=> b!930311 (= e!522395 (and e!522394 mapRes!31680))))

(declare-fun condMapEmpty!31680 () Bool)

(declare-fun mapDefault!31680 () ValueCell!9493)

