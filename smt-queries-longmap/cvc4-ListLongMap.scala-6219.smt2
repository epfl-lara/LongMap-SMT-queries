; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79484 () Bool)

(assert start!79484)

(declare-fun b_free!17639 () Bool)

(declare-fun b_next!17639 () Bool)

(assert (=> start!79484 (= b_free!17639 (not b_next!17639))))

(declare-fun tp!61364 () Bool)

(declare-fun b_and!28845 () Bool)

(assert (=> start!79484 (= tp!61364 b_and!28845)))

(declare-fun b!934324 () Bool)

(declare-fun res!629272 () Bool)

(declare-fun e!524627 () Bool)

(assert (=> b!934324 (=> (not res!629272) (not e!524627))))

(declare-datatypes ((array!56232 0))(
  ( (array!56233 (arr!27059 (Array (_ BitVec 32) (_ BitVec 64))) (size!27518 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56232)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56232 (_ BitVec 32)) Bool)

(assert (=> b!934324 (= res!629272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!934325 () Bool)

(declare-fun res!629269 () Bool)

(declare-fun e!524628 () Bool)

(assert (=> b!934325 (=> (not res!629269) (not e!524628))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31827 0))(
  ( (V!31828 (val!10124 Int)) )
))
(declare-fun v!791 () V!31827)

(declare-datatypes ((tuple2!13278 0))(
  ( (tuple2!13279 (_1!6650 (_ BitVec 64)) (_2!6650 V!31827)) )
))
(declare-datatypes ((List!19059 0))(
  ( (Nil!19056) (Cons!19055 (h!20201 tuple2!13278) (t!27242 List!19059)) )
))
(declare-datatypes ((ListLongMap!11975 0))(
  ( (ListLongMap!11976 (toList!6003 List!19059)) )
))
(declare-fun lt!420926 () ListLongMap!11975)

(declare-fun apply!809 (ListLongMap!11975 (_ BitVec 64)) V!31827)

(assert (=> b!934325 (= res!629269 (= (apply!809 lt!420926 k!1099) v!791))))

(declare-fun b!934326 () Bool)

(declare-fun res!629277 () Bool)

(assert (=> b!934326 (=> (not res!629277) (not e!524627))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!934326 (= res!629277 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27518 _keys!1487))))))

(declare-fun b!934327 () Bool)

(declare-fun res!629275 () Bool)

(assert (=> b!934327 (=> (not res!629275) (not e!524628))))

(assert (=> b!934327 (= res!629275 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!934328 () Bool)

(declare-fun e!524626 () Bool)

(declare-fun e!524623 () Bool)

(declare-fun mapRes!31983 () Bool)

(assert (=> b!934328 (= e!524626 (and e!524623 mapRes!31983))))

(declare-fun condMapEmpty!31983 () Bool)

(declare-datatypes ((ValueCell!9592 0))(
  ( (ValueCellFull!9592 (v!12644 V!31827)) (EmptyCell!9592) )
))
(declare-datatypes ((array!56234 0))(
  ( (array!56235 (arr!27060 (Array (_ BitVec 32) ValueCell!9592)) (size!27519 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56234)

(declare-fun mapDefault!31983 () ValueCell!9592)

