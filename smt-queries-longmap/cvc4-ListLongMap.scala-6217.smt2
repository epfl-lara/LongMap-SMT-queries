; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79440 () Bool)

(assert start!79440)

(declare-fun b_free!17627 () Bool)

(declare-fun b_next!17627 () Bool)

(assert (=> start!79440 (= b_free!17627 (not b_next!17627))))

(declare-fun tp!61324 () Bool)

(declare-fun b_and!28813 () Bool)

(assert (=> start!79440 (= tp!61324 b_and!28813)))

(declare-fun b!933855 () Bool)

(declare-fun e!524356 () Bool)

(declare-fun e!524354 () Bool)

(assert (=> b!933855 (= e!524356 e!524354)))

(declare-fun res!629005 () Bool)

(assert (=> b!933855 (=> (not res!629005) (not e!524354))))

(declare-datatypes ((V!31811 0))(
  ( (V!31812 (val!10118 Int)) )
))
(declare-datatypes ((tuple2!13266 0))(
  ( (tuple2!13267 (_1!6644 (_ BitVec 64)) (_2!6644 V!31811)) )
))
(declare-datatypes ((List!19049 0))(
  ( (Nil!19046) (Cons!19045 (h!20191 tuple2!13266) (t!27220 List!19049)) )
))
(declare-datatypes ((ListLongMap!11963 0))(
  ( (ListLongMap!11964 (toList!5997 List!19049)) )
))
(declare-fun lt!420618 () ListLongMap!11963)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5046 (ListLongMap!11963 (_ BitVec 64)) Bool)

(assert (=> b!933855 (= res!629005 (contains!5046 lt!420618 k!1099))))

(declare-datatypes ((array!56206 0))(
  ( (array!56207 (arr!27047 (Array (_ BitVec 32) (_ BitVec 64))) (size!27506 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56206)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9586 0))(
  ( (ValueCellFull!9586 (v!12637 V!31811)) (EmptyCell!9586) )
))
(declare-datatypes ((array!56208 0))(
  ( (array!56209 (arr!27048 (Array (_ BitVec 32) ValueCell!9586)) (size!27507 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56208)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31811)

(declare-fun minValue!1173 () V!31811)

(declare-fun getCurrentListMap!3235 (array!56206 array!56208 (_ BitVec 32) (_ BitVec 32) V!31811 V!31811 (_ BitVec 32) Int) ListLongMap!11963)

(assert (=> b!933855 (= lt!420618 (getCurrentListMap!3235 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933856 () Bool)

(declare-fun e!524360 () Bool)

(declare-fun e!524359 () Bool)

(declare-fun mapRes!31962 () Bool)

(assert (=> b!933856 (= e!524360 (and e!524359 mapRes!31962))))

(declare-fun condMapEmpty!31962 () Bool)

(declare-fun mapDefault!31962 () ValueCell!9586)

