; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79782 () Bool)

(assert start!79782)

(declare-fun b_free!17755 () Bool)

(declare-fun b_next!17755 () Bool)

(assert (=> start!79782 (= b_free!17755 (not b_next!17755))))

(declare-fun tp!61724 () Bool)

(declare-fun b_and!29125 () Bool)

(assert (=> start!79782 (= tp!61724 b_and!29125)))

(declare-fun b!938385 () Bool)

(declare-fun e!527000 () Bool)

(declare-fun tp_is_empty!20263 () Bool)

(assert (=> b!938385 (= e!527000 tp_is_empty!20263)))

(declare-fun b!938386 () Bool)

(declare-datatypes ((Unit!31697 0))(
  ( (Unit!31698) )
))
(declare-fun e!527008 () Unit!31697)

(declare-fun Unit!31699 () Unit!31697)

(assert (=> b!938386 (= e!527008 Unit!31699)))

(declare-fun b!938387 () Bool)

(declare-fun res!631381 () Bool)

(declare-fun e!527002 () Bool)

(assert (=> b!938387 (=> (not res!631381) (not e!527002))))

(declare-datatypes ((array!56468 0))(
  ( (array!56469 (arr!27173 (Array (_ BitVec 32) (_ BitVec 64))) (size!27632 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56468)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56468 (_ BitVec 32)) Bool)

(assert (=> b!938387 (= res!631381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-datatypes ((V!31983 0))(
  ( (V!31984 (val!10182 Int)) )
))
(declare-fun v!791 () V!31983)

(declare-fun e!527004 () Bool)

(declare-datatypes ((tuple2!13380 0))(
  ( (tuple2!13381 (_1!6701 (_ BitVec 64)) (_2!6701 V!31983)) )
))
(declare-datatypes ((List!19158 0))(
  ( (Nil!19155) (Cons!19154 (h!20300 tuple2!13380) (t!27457 List!19158)) )
))
(declare-datatypes ((ListLongMap!12077 0))(
  ( (ListLongMap!12078 (toList!6054 List!19158)) )
))
(declare-fun lt!423738 () ListLongMap!12077)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun b!938388 () Bool)

(declare-fun apply!855 (ListLongMap!12077 (_ BitVec 64)) V!31983)

(assert (=> b!938388 (= e!527004 (not (= (apply!855 lt!423738 k!1099) v!791)))))

(declare-fun b!938389 () Bool)

(declare-fun e!527003 () Bool)

(declare-fun e!527010 () Bool)

(declare-fun mapRes!32170 () Bool)

(assert (=> b!938389 (= e!527003 (and e!527010 mapRes!32170))))

(declare-fun condMapEmpty!32170 () Bool)

(declare-datatypes ((ValueCell!9650 0))(
  ( (ValueCellFull!9650 (v!12710 V!31983)) (EmptyCell!9650) )
))
(declare-datatypes ((array!56470 0))(
  ( (array!56471 (arr!27174 (Array (_ BitVec 32) ValueCell!9650)) (size!27633 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56470)

(declare-fun mapDefault!32170 () ValueCell!9650)

