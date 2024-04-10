; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79382 () Bool)

(assert start!79382)

(declare-fun b_free!17569 () Bool)

(declare-fun b_next!17569 () Bool)

(assert (=> start!79382 (= b_free!17569 (not b_next!17569))))

(declare-fun tp!61151 () Bool)

(declare-fun b_and!28697 () Bool)

(assert (=> start!79382 (= tp!61151 b_and!28697)))

(declare-fun b!932650 () Bool)

(declare-fun res!628141 () Bool)

(declare-fun e!523739 () Bool)

(assert (=> b!932650 (=> (not res!628141) (not e!523739))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31735 0))(
  ( (V!31736 (val!10089 Int)) )
))
(declare-fun v!791 () V!31735)

(declare-datatypes ((tuple2!13220 0))(
  ( (tuple2!13221 (_1!6621 (_ BitVec 64)) (_2!6621 V!31735)) )
))
(declare-datatypes ((List!19002 0))(
  ( (Nil!18999) (Cons!18998 (h!20144 tuple2!13220) (t!27115 List!19002)) )
))
(declare-datatypes ((ListLongMap!11917 0))(
  ( (ListLongMap!11918 (toList!5974 List!19002)) )
))
(declare-fun lt!420001 () ListLongMap!11917)

(declare-fun apply!787 (ListLongMap!11917 (_ BitVec 64)) V!31735)

(assert (=> b!932650 (= res!628141 (= (apply!787 lt!420001 k!1099) v!791))))

(declare-fun b!932651 () Bool)

(declare-fun res!628135 () Bool)

(assert (=> b!932651 (=> (not res!628135) (not e!523739))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932651 (= res!628135 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932652 () Bool)

(declare-fun e!523743 () Bool)

(assert (=> b!932652 (= e!523743 (not true))))

(declare-datatypes ((array!56092 0))(
  ( (array!56093 (arr!26990 (Array (_ BitVec 32) (_ BitVec 64))) (size!27449 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56092)

(declare-datatypes ((List!19003 0))(
  ( (Nil!19000) (Cons!18999 (h!20145 (_ BitVec 64)) (t!27116 List!19003)) )
))
(declare-fun arrayNoDuplicates!0 (array!56092 (_ BitVec 32) List!19003) Bool)

(assert (=> b!932652 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19000)))

(declare-datatypes ((Unit!31471 0))(
  ( (Unit!31472) )
))
(declare-fun lt!420002 () Unit!31471)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56092 (_ BitVec 32) (_ BitVec 32)) Unit!31471)

(assert (=> b!932652 (= lt!420002 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!419996 () tuple2!13220)

(declare-fun contains!5023 (ListLongMap!11917 (_ BitVec 64)) Bool)

(declare-fun +!2778 (ListLongMap!11917 tuple2!13220) ListLongMap!11917)

(assert (=> b!932652 (contains!5023 (+!2778 lt!420001 lt!419996) k!1099)))

(declare-fun lt!419997 () Unit!31471)

(declare-fun lt!419998 () (_ BitVec 64))

(declare-fun lt!420000 () V!31735)

(declare-fun addStillContains!497 (ListLongMap!11917 (_ BitVec 64) V!31735 (_ BitVec 64)) Unit!31471)

(assert (=> b!932652 (= lt!419997 (addStillContains!497 lt!420001 lt!419998 lt!420000 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9557 0))(
  ( (ValueCellFull!9557 (v!12608 V!31735)) (EmptyCell!9557) )
))
(declare-datatypes ((array!56094 0))(
  ( (array!56095 (arr!26991 (Array (_ BitVec 32) ValueCell!9557)) (size!27450 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56094)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31735)

(declare-fun minValue!1173 () V!31735)

(declare-fun getCurrentListMap!3212 (array!56092 array!56094 (_ BitVec 32) (_ BitVec 32) V!31735 V!31735 (_ BitVec 32) Int) ListLongMap!11917)

(assert (=> b!932652 (= (getCurrentListMap!3212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2778 (getCurrentListMap!3212 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419996))))

(assert (=> b!932652 (= lt!419996 (tuple2!13221 lt!419998 lt!420000))))

(declare-fun get!14194 (ValueCell!9557 V!31735) V!31735)

(declare-fun dynLambda!1567 (Int (_ BitVec 64)) V!31735)

(assert (=> b!932652 (= lt!420000 (get!14194 (select (arr!26991 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1567 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419999 () Unit!31471)

(declare-fun lemmaListMapRecursiveValidKeyArray!168 (array!56092 array!56094 (_ BitVec 32) (_ BitVec 32) V!31735 V!31735 (_ BitVec 32) Int) Unit!31471)

(assert (=> b!932652 (= lt!419999 (lemmaListMapRecursiveValidKeyArray!168 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932653 () Bool)

(declare-fun e!523740 () Bool)

(declare-fun e!523737 () Bool)

(declare-fun mapRes!31875 () Bool)

(assert (=> b!932653 (= e!523740 (and e!523737 mapRes!31875))))

(declare-fun condMapEmpty!31875 () Bool)

(declare-fun mapDefault!31875 () ValueCell!9557)

