; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79060 () Bool)

(assert start!79060)

(declare-fun b_free!17273 () Bool)

(declare-fun b_next!17273 () Bool)

(assert (=> start!79060 (= b_free!17273 (not b_next!17273))))

(declare-fun tp!60259 () Bool)

(declare-fun b_and!28283 () Bool)

(assert (=> start!79060 (= tp!60259 b_and!28283)))

(declare-fun b!926879 () Bool)

(declare-fun e!520309 () Bool)

(declare-fun tp_is_empty!19781 () Bool)

(assert (=> b!926879 (= e!520309 tp_is_empty!19781)))

(declare-fun b!926880 () Bool)

(declare-fun e!520307 () Bool)

(declare-fun e!520314 () Bool)

(assert (=> b!926880 (= e!520307 e!520314)))

(declare-fun res!624402 () Bool)

(assert (=> b!926880 (=> (not res!624402) (not e!520314))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55524 0))(
  ( (array!55525 (arr!26707 (Array (_ BitVec 32) (_ BitVec 64))) (size!27166 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55524)

(assert (=> b!926880 (= res!624402 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27166 _keys!1487)))))

(declare-datatypes ((Unit!31339 0))(
  ( (Unit!31340) )
))
(declare-fun lt!417591 () Unit!31339)

(declare-fun e!520310 () Unit!31339)

(assert (=> b!926880 (= lt!417591 e!520310)))

(declare-fun c!96787 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!926880 (= c!96787 (validKeyInArray!0 k!1099))))

(declare-fun e!520318 () Bool)

(declare-fun b!926881 () Bool)

(declare-fun arrayContainsKey!0 (array!55524 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!926881 (= e!520318 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!926882 () Bool)

(declare-fun res!624403 () Bool)

(declare-fun e!520306 () Bool)

(assert (=> b!926882 (=> (not res!624403) (not e!520306))))

(declare-datatypes ((List!18773 0))(
  ( (Nil!18770) (Cons!18769 (h!19915 (_ BitVec 64)) (t!26776 List!18773)) )
))
(declare-fun arrayNoDuplicates!0 (array!55524 (_ BitVec 32) List!18773) Bool)

(assert (=> b!926882 (= res!624403 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18770))))

(declare-fun b!926883 () Bool)

(declare-fun res!624399 () Bool)

(declare-fun e!520311 () Bool)

(assert (=> b!926883 (=> (not res!624399) (not e!520311))))

(declare-datatypes ((V!31339 0))(
  ( (V!31340 (val!9941 Int)) )
))
(declare-fun v!791 () V!31339)

(declare-datatypes ((tuple2!12972 0))(
  ( (tuple2!12973 (_1!6497 (_ BitVec 64)) (_2!6497 V!31339)) )
))
(declare-datatypes ((List!18774 0))(
  ( (Nil!18771) (Cons!18770 (h!19916 tuple2!12972) (t!26777 List!18774)) )
))
(declare-datatypes ((ListLongMap!11669 0))(
  ( (ListLongMap!11670 (toList!5850 List!18774)) )
))
(declare-fun lt!417589 () ListLongMap!11669)

(declare-fun apply!680 (ListLongMap!11669 (_ BitVec 64)) V!31339)

(assert (=> b!926883 (= res!624399 (= (apply!680 lt!417589 k!1099) v!791))))

(declare-fun b!926884 () Bool)

(assert (=> b!926884 (= e!520314 e!520311)))

(declare-fun res!624398 () Bool)

(assert (=> b!926884 (=> (not res!624398) (not e!520311))))

(declare-fun contains!4909 (ListLongMap!11669 (_ BitVec 64)) Bool)

(assert (=> b!926884 (= res!624398 (contains!4909 lt!417589 k!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9409 0))(
  ( (ValueCellFull!9409 (v!12459 V!31339)) (EmptyCell!9409) )
))
(declare-datatypes ((array!55526 0))(
  ( (array!55527 (arr!26708 (Array (_ BitVec 32) ValueCell!9409)) (size!27167 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55526)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31339)

(declare-fun minValue!1173 () V!31339)

(declare-fun getCurrentListMap!3100 (array!55524 array!55526 (_ BitVec 32) (_ BitVec 32) V!31339 V!31339 (_ BitVec 32) Int) ListLongMap!11669)

(assert (=> b!926884 (= lt!417589 (getCurrentListMap!3100 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!624397 () Bool)

(assert (=> start!79060 (=> (not res!624397) (not e!520306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79060 (= res!624397 (validMask!0 mask!1881))))

(assert (=> start!79060 e!520306))

(assert (=> start!79060 true))

(assert (=> start!79060 tp_is_empty!19781))

(declare-fun e!520313 () Bool)

(declare-fun array_inv!20798 (array!55526) Bool)

(assert (=> start!79060 (and (array_inv!20798 _values!1231) e!520313)))

(assert (=> start!79060 tp!60259))

(declare-fun array_inv!20799 (array!55524) Bool)

(assert (=> start!79060 (array_inv!20799 _keys!1487)))

(declare-fun b!926885 () Bool)

(assert (=> b!926885 (= e!520311 (not true))))

(declare-fun e!520315 () Bool)

(assert (=> b!926885 e!520315))

(declare-fun res!624395 () Bool)

(assert (=> b!926885 (=> (not res!624395) (not e!520315))))

(declare-fun lt!417577 () ListLongMap!11669)

(assert (=> b!926885 (= res!624395 (contains!4909 lt!417577 k!1099))))

(assert (=> b!926885 (= lt!417577 (getCurrentListMap!3100 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!417583 () Unit!31339)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!83 (array!55524 array!55526 (_ BitVec 32) (_ BitVec 32) V!31339 V!31339 (_ BitVec 64) V!31339 (_ BitVec 32) Int) Unit!31339)

(assert (=> b!926885 (= lt!417583 (lemmaListMapApplyFromThenApplyFromZero!83 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!926886 () Bool)

(declare-fun mapRes!31428 () Bool)

(assert (=> b!926886 (= e!520313 (and e!520309 mapRes!31428))))

(declare-fun condMapEmpty!31428 () Bool)

(declare-fun mapDefault!31428 () ValueCell!9409)

