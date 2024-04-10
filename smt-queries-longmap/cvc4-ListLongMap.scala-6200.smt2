; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79312 () Bool)

(assert start!79312)

(declare-fun b_free!17525 () Bool)

(declare-fun b_next!17525 () Bool)

(assert (=> start!79312 (= b_free!17525 (not b_next!17525))))

(declare-fun tp!61016 () Bool)

(declare-fun b_and!28601 () Bool)

(assert (=> start!79312 (= tp!61016 b_and!28601)))

(declare-fun res!627402 () Bool)

(declare-fun e!523165 () Bool)

(assert (=> start!79312 (=> (not res!627402) (not e!523165))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79312 (= res!627402 (validMask!0 mask!1881))))

(assert (=> start!79312 e!523165))

(assert (=> start!79312 true))

(declare-fun tp_is_empty!20033 () Bool)

(assert (=> start!79312 tp_is_empty!20033))

(declare-datatypes ((V!31675 0))(
  ( (V!31676 (val!10067 Int)) )
))
(declare-datatypes ((ValueCell!9535 0))(
  ( (ValueCellFull!9535 (v!12585 V!31675)) (EmptyCell!9535) )
))
(declare-datatypes ((array!56006 0))(
  ( (array!56007 (arr!26948 (Array (_ BitVec 32) ValueCell!9535)) (size!27407 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56006)

(declare-fun e!523170 () Bool)

(declare-fun array_inv!20976 (array!56006) Bool)

(assert (=> start!79312 (and (array_inv!20976 _values!1231) e!523170)))

(assert (=> start!79312 tp!61016))

(declare-datatypes ((array!56008 0))(
  ( (array!56009 (arr!26949 (Array (_ BitVec 32) (_ BitVec 64))) (size!27408 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56008)

(declare-fun array_inv!20977 (array!56008) Bool)

(assert (=> start!79312 (array_inv!20977 _keys!1487)))

(declare-fun b!931578 () Bool)

(declare-fun res!627401 () Bool)

(assert (=> b!931578 (=> (not res!627401) (not e!523165))))

(declare-datatypes ((List!18971 0))(
  ( (Nil!18968) (Cons!18967 (h!20113 (_ BitVec 64)) (t!27040 List!18971)) )
))
(declare-fun arrayNoDuplicates!0 (array!56008 (_ BitVec 32) List!18971) Bool)

(assert (=> b!931578 (= res!627401 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18968))))

(declare-fun b!931579 () Bool)

(declare-fun e!523171 () Bool)

(declare-fun e!523169 () Bool)

(assert (=> b!931579 (= e!523171 e!523169)))

(declare-fun res!627407 () Bool)

(assert (=> b!931579 (=> (not res!627407) (not e!523169))))

(declare-fun lt!419462 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931579 (= res!627407 (validKeyInArray!0 lt!419462))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931579 (= lt!419462 (select (arr!26949 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931580 () Bool)

(declare-fun e!523166 () Bool)

(assert (=> b!931580 (= e!523166 tp_is_empty!20033)))

(declare-fun b!931581 () Bool)

(declare-fun e!523168 () Bool)

(declare-fun mapRes!31806 () Bool)

(assert (=> b!931581 (= e!523170 (and e!523168 mapRes!31806))))

(declare-fun condMapEmpty!31806 () Bool)

(declare-fun mapDefault!31806 () ValueCell!9535)

