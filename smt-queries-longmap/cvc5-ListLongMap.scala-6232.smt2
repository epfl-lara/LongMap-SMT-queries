; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79664 () Bool)

(assert start!79664)

(declare-fun b_free!17713 () Bool)

(declare-fun b_next!17713 () Bool)

(assert (=> start!79664 (= b_free!17713 (not b_next!17713))))

(declare-fun tp!61595 () Bool)

(declare-fun b_and!29017 () Bool)

(assert (=> start!79664 (= tp!61595 b_and!29017)))

(declare-fun mapIsEmpty!32103 () Bool)

(declare-fun mapRes!32103 () Bool)

(assert (=> mapIsEmpty!32103 mapRes!32103))

(declare-fun e!526018 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((array!56382 0))(
  ( (array!56383 (arr!27131 (Array (_ BitVec 32) (_ BitVec 64))) (size!27590 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56382)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!936788 () Bool)

(declare-fun arrayContainsKey!0 (array!56382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!936788 (= e!526018 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun res!630681 () Bool)

(declare-fun e!526021 () Bool)

(assert (=> start!79664 (=> (not res!630681) (not e!526021))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79664 (= res!630681 (validMask!0 mask!1881))))

(assert (=> start!79664 e!526021))

(assert (=> start!79664 true))

(declare-fun tp_is_empty!20221 () Bool)

(assert (=> start!79664 tp_is_empty!20221))

(declare-datatypes ((V!31927 0))(
  ( (V!31928 (val!10161 Int)) )
))
(declare-datatypes ((ValueCell!9629 0))(
  ( (ValueCellFull!9629 (v!12686 V!31927)) (EmptyCell!9629) )
))
(declare-datatypes ((array!56384 0))(
  ( (array!56385 (arr!27132 (Array (_ BitVec 32) ValueCell!9629)) (size!27591 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56384)

(declare-fun e!526020 () Bool)

(declare-fun array_inv!21108 (array!56384) Bool)

(assert (=> start!79664 (and (array_inv!21108 _values!1231) e!526020)))

(assert (=> start!79664 tp!61595))

(declare-fun array_inv!21109 (array!56382) Bool)

(assert (=> start!79664 (array_inv!21109 _keys!1487)))

(declare-fun b!936789 () Bool)

(declare-fun e!526025 () Bool)

(assert (=> b!936789 (= e!526025 tp_is_empty!20221)))

(declare-fun b!936790 () Bool)

(assert (=> b!936790 (= e!526020 (and e!526025 mapRes!32103))))

(declare-fun condMapEmpty!32103 () Bool)

(declare-fun mapDefault!32103 () ValueCell!9629)

