; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78832 () Bool)

(assert start!78832)

(declare-fun b_free!17045 () Bool)

(declare-fun b_next!17045 () Bool)

(assert (=> start!78832 (= b_free!17045 (not b_next!17045))))

(declare-fun tp!59575 () Bool)

(declare-fun b_and!27827 () Bool)

(assert (=> start!78832 (= tp!59575 b_and!27827)))

(declare-fun b!920587 () Bool)

(declare-fun res!620801 () Bool)

(declare-fun e!516668 () Bool)

(assert (=> b!920587 (=> (not res!620801) (not e!516668))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31035 0))(
  ( (V!31036 (val!9827 Int)) )
))
(declare-datatypes ((tuple2!12778 0))(
  ( (tuple2!12779 (_1!6400 (_ BitVec 64)) (_2!6400 V!31035)) )
))
(declare-datatypes ((List!18581 0))(
  ( (Nil!18578) (Cons!18577 (h!19723 tuple2!12778) (t!26356 List!18581)) )
))
(declare-datatypes ((ListLongMap!11475 0))(
  ( (ListLongMap!11476 (toList!5753 List!18581)) )
))
(declare-fun lt!413288 () ListLongMap!11475)

(declare-fun v!791 () V!31035)

(declare-fun apply!594 (ListLongMap!11475 (_ BitVec 64)) V!31035)

(assert (=> b!920587 (= res!620801 (= (apply!594 lt!413288 k!1099) v!791))))

(declare-fun res!620792 () Bool)

(declare-fun e!516667 () Bool)

(assert (=> start!78832 (=> (not res!620792) (not e!516667))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78832 (= res!620792 (validMask!0 mask!1881))))

(assert (=> start!78832 e!516667))

(assert (=> start!78832 true))

(declare-fun tp_is_empty!19553 () Bool)

(assert (=> start!78832 tp_is_empty!19553))

(declare-datatypes ((ValueCell!9295 0))(
  ( (ValueCellFull!9295 (v!12345 V!31035)) (EmptyCell!9295) )
))
(declare-datatypes ((array!55086 0))(
  ( (array!55087 (arr!26488 (Array (_ BitVec 32) ValueCell!9295)) (size!26947 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55086)

(declare-fun e!516666 () Bool)

(declare-fun array_inv!20642 (array!55086) Bool)

(assert (=> start!78832 (and (array_inv!20642 _values!1231) e!516666)))

(assert (=> start!78832 tp!59575))

(declare-datatypes ((array!55088 0))(
  ( (array!55089 (arr!26489 (Array (_ BitVec 32) (_ BitVec 64))) (size!26948 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55088)

(declare-fun array_inv!20643 (array!55088) Bool)

(assert (=> start!78832 (array_inv!20643 _keys!1487)))

(declare-fun b!920588 () Bool)

(declare-fun res!620800 () Bool)

(assert (=> b!920588 (=> (not res!620800) (not e!516668))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!920588 (= res!620800 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31086 () Bool)

(declare-fun mapRes!31086 () Bool)

(assert (=> mapIsEmpty!31086 mapRes!31086))

(declare-fun b!920589 () Bool)

(declare-fun e!516673 () Bool)

(declare-fun arrayContainsKey!0 (array!55088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!920589 (= e!516673 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!920590 () Bool)

(declare-fun e!516671 () Bool)

(assert (=> b!920590 (= e!516671 tp_is_empty!19553)))

(declare-fun b!920591 () Bool)

(declare-fun res!620796 () Bool)

(assert (=> b!920591 (=> (not res!620796) (not e!516667))))

(declare-datatypes ((List!18582 0))(
  ( (Nil!18579) (Cons!18578 (h!19724 (_ BitVec 64)) (t!26357 List!18582)) )
))
(declare-fun arrayNoDuplicates!0 (array!55088 (_ BitVec 32) List!18582) Bool)

(assert (=> b!920591 (= res!620796 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18579))))

(declare-fun b!920592 () Bool)

(declare-fun e!516672 () Bool)

(assert (=> b!920592 (= e!516672 true)))

(declare-fun lt!413289 () Bool)

(declare-fun contains!4802 (List!18582 (_ BitVec 64)) Bool)

(assert (=> b!920592 (= lt!413289 (contains!4802 Nil!18579 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920593 () Bool)

(declare-fun e!516669 () Bool)

(assert (=> b!920593 (= e!516668 e!516669)))

(declare-fun res!620798 () Bool)

(assert (=> b!920593 (=> (not res!620798) (not e!516669))))

(declare-fun lt!413284 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920593 (= res!620798 (validKeyInArray!0 lt!413284))))

(assert (=> b!920593 (= lt!413284 (select (arr!26489 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!920594 () Bool)

(declare-fun res!620791 () Bool)

(assert (=> b!920594 (=> res!620791 e!516672)))

(assert (=> b!920594 (= res!620791 (contains!4802 Nil!18579 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!920595 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!920595 (= e!516673 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!920596 () Bool)

(assert (=> b!920596 (= e!516669 (not e!516672))))

(declare-fun res!620799 () Bool)

(assert (=> b!920596 (=> res!620799 e!516672)))

(assert (=> b!920596 (= res!620799 (or (bvsge (size!26948 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26948 _keys!1487))))))

(assert (=> b!920596 e!516673))

(declare-fun c!96069 () Bool)

(assert (=> b!920596 (= c!96069 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!31070 0))(
  ( (Unit!31071) )
))
(declare-fun lt!413282 () Unit!31070)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31035)

(declare-fun minValue!1173 () V!31035)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!168 (array!55088 array!55086 (_ BitVec 32) (_ BitVec 32) V!31035 V!31035 (_ BitVec 64) (_ BitVec 32) Int) Unit!31070)

(assert (=> b!920596 (= lt!413282 (lemmaListMapContainsThenArrayContainsFrom!168 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!920596 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18579)))

(declare-fun lt!413286 () Unit!31070)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55088 (_ BitVec 32) (_ BitVec 32)) Unit!31070)

(assert (=> b!920596 (= lt!413286 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!413290 () tuple2!12778)

(declare-fun contains!4803 (ListLongMap!11475 (_ BitVec 64)) Bool)

(declare-fun +!2661 (ListLongMap!11475 tuple2!12778) ListLongMap!11475)

(assert (=> b!920596 (contains!4803 (+!2661 lt!413288 lt!413290) k!1099)))

(declare-fun lt!413285 () V!31035)

(declare-fun lt!413283 () Unit!31070)

(declare-fun addStillContains!385 (ListLongMap!11475 (_ BitVec 64) V!31035 (_ BitVec 64)) Unit!31070)

(assert (=> b!920596 (= lt!413283 (addStillContains!385 lt!413288 lt!413284 lt!413285 k!1099))))

(declare-fun getCurrentListMap!3008 (array!55088 array!55086 (_ BitVec 32) (_ BitVec 32) V!31035 V!31035 (_ BitVec 32) Int) ListLongMap!11475)

(assert (=> b!920596 (= (getCurrentListMap!3008 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2661 (getCurrentListMap!3008 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413290))))

(assert (=> b!920596 (= lt!413290 (tuple2!12779 lt!413284 lt!413285))))

(declare-fun get!13898 (ValueCell!9295 V!31035) V!31035)

(declare-fun dynLambda!1450 (Int (_ BitVec 64)) V!31035)

(assert (=> b!920596 (= lt!413285 (get!13898 (select (arr!26488 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1450 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413287 () Unit!31070)

(declare-fun lemmaListMapRecursiveValidKeyArray!51 (array!55088 array!55086 (_ BitVec 32) (_ BitVec 32) V!31035 V!31035 (_ BitVec 32) Int) Unit!31070)

(assert (=> b!920596 (= lt!413287 (lemmaListMapRecursiveValidKeyArray!51 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!920597 () Bool)

(declare-fun res!620793 () Bool)

(assert (=> b!920597 (=> (not res!620793) (not e!516667))))

(assert (=> b!920597 (= res!620793 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26948 _keys!1487))))))

(declare-fun b!920598 () Bool)

(declare-fun res!620802 () Bool)

(assert (=> b!920598 (=> (not res!620802) (not e!516667))))

(assert (=> b!920598 (= res!620802 (and (= (size!26947 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26948 _keys!1487) (size!26947 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!920599 () Bool)

(declare-fun e!516665 () Bool)

(assert (=> b!920599 (= e!516665 tp_is_empty!19553)))

(declare-fun b!920600 () Bool)

(declare-fun res!620795 () Bool)

(assert (=> b!920600 (=> (not res!620795) (not e!516667))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55088 (_ BitVec 32)) Bool)

(assert (=> b!920600 (= res!620795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920601 () Bool)

(declare-fun res!620794 () Bool)

(assert (=> b!920601 (=> (not res!620794) (not e!516668))))

(assert (=> b!920601 (= res!620794 (validKeyInArray!0 k!1099))))

(declare-fun b!920602 () Bool)

(assert (=> b!920602 (= e!516666 (and e!516671 mapRes!31086))))

(declare-fun condMapEmpty!31086 () Bool)

(declare-fun mapDefault!31086 () ValueCell!9295)

