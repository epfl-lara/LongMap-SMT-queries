; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79098 () Bool)

(assert start!79098)

(declare-fun b_free!17311 () Bool)

(declare-fun b_next!17311 () Bool)

(assert (=> start!79098 (= b_free!17311 (not b_next!17311))))

(declare-fun tp!60373 () Bool)

(declare-fun b_and!28359 () Bool)

(assert (=> start!79098 (= tp!60373 b_and!28359)))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31391 0))(
  ( (V!31392 (val!9960 Int)) )
))
(declare-fun v!791 () V!31391)

(declare-datatypes ((tuple2!13008 0))(
  ( (tuple2!13009 (_1!6515 (_ BitVec 64)) (_2!6515 V!31391)) )
))
(declare-datatypes ((List!18808 0))(
  ( (Nil!18805) (Cons!18804 (h!19950 tuple2!13008) (t!26849 List!18808)) )
))
(declare-datatypes ((ListLongMap!11705 0))(
  ( (ListLongMap!11706 (toList!5868 List!18808)) )
))
(declare-fun lt!418490 () ListLongMap!11705)

(declare-fun b!928057 () Bool)

(declare-fun e!521056 () Bool)

(declare-fun apply!698 (ListLongMap!11705 (_ BitVec 64)) V!31391)

(assert (=> b!928057 (= e!521056 (= (apply!698 lt!418490 k!1099) v!791))))

(declare-fun b!928058 () Bool)

(declare-datatypes ((Unit!31401 0))(
  ( (Unit!31402) )
))
(declare-fun e!521050 () Unit!31401)

(declare-fun e!521052 () Unit!31401)

(assert (=> b!928058 (= e!521050 e!521052)))

(declare-fun lt!418492 () (_ BitVec 64))

(declare-datatypes ((array!55598 0))(
  ( (array!55599 (arr!26744 (Array (_ BitVec 32) (_ BitVec 64))) (size!27203 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55598)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928058 (= lt!418492 (select (arr!26744 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96959 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928058 (= c!96959 (validKeyInArray!0 lt!418492))))

(declare-fun mapIsEmpty!31485 () Bool)

(declare-fun mapRes!31485 () Bool)

(assert (=> mapIsEmpty!31485 mapRes!31485))

(declare-fun b!928059 () Bool)

(declare-fun e!521051 () Bool)

(declare-fun arrayContainsKey!0 (array!55598 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928059 (= e!521051 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!928060 () Bool)

(declare-fun res!625028 () Bool)

(declare-fun e!521047 () Bool)

(assert (=> b!928060 (=> (not res!625028) (not e!521047))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55598 (_ BitVec 32)) Bool)

(assert (=> b!928060 (= res!625028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!625024 () Bool)

(assert (=> start!79098 (=> (not res!625024) (not e!521047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79098 (= res!625024 (validMask!0 mask!1881))))

(assert (=> start!79098 e!521047))

(assert (=> start!79098 true))

(declare-fun tp_is_empty!19819 () Bool)

(assert (=> start!79098 tp_is_empty!19819))

(declare-datatypes ((ValueCell!9428 0))(
  ( (ValueCellFull!9428 (v!12478 V!31391)) (EmptyCell!9428) )
))
(declare-datatypes ((array!55600 0))(
  ( (array!55601 (arr!26745 (Array (_ BitVec 32) ValueCell!9428)) (size!27204 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55600)

(declare-fun e!521054 () Bool)

(declare-fun array_inv!20824 (array!55600) Bool)

(assert (=> start!79098 (and (array_inv!20824 _values!1231) e!521054)))

(assert (=> start!79098 tp!60373))

(declare-fun array_inv!20825 (array!55598) Bool)

(assert (=> start!79098 (array_inv!20825 _keys!1487)))

(declare-fun b!928061 () Bool)

(declare-fun Unit!31403 () Unit!31401)

(assert (=> b!928061 (= e!521052 Unit!31403)))

(declare-fun b!928062 () Bool)

(declare-fun e!521059 () Bool)

(assert (=> b!928062 (= e!521054 (and e!521059 mapRes!31485))))

(declare-fun condMapEmpty!31485 () Bool)

(declare-fun mapDefault!31485 () ValueCell!9428)

