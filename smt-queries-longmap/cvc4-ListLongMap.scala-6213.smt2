; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79416 () Bool)

(assert start!79416)

(declare-fun b_free!17603 () Bool)

(declare-fun b_next!17603 () Bool)

(assert (=> start!79416 (= b_free!17603 (not b_next!17603))))

(declare-fun tp!61253 () Bool)

(declare-fun b_and!28765 () Bool)

(assert (=> start!79416 (= tp!61253 b_and!28765)))

(declare-fun mapNonEmpty!31926 () Bool)

(declare-fun mapRes!31926 () Bool)

(declare-fun tp!61252 () Bool)

(declare-fun e!524097 () Bool)

(assert (=> mapNonEmpty!31926 (= mapRes!31926 (and tp!61252 e!524097))))

(declare-datatypes ((V!31779 0))(
  ( (V!31780 (val!10106 Int)) )
))
(declare-datatypes ((ValueCell!9574 0))(
  ( (ValueCellFull!9574 (v!12625 V!31779)) (EmptyCell!9574) )
))
(declare-fun mapRest!31926 () (Array (_ BitVec 32) ValueCell!9574))

(declare-fun mapKey!31926 () (_ BitVec 32))

(declare-datatypes ((array!56158 0))(
  ( (array!56159 (arr!27023 (Array (_ BitVec 32) ValueCell!9574)) (size!27482 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56158)

(declare-fun mapValue!31926 () ValueCell!9574)

(assert (=> mapNonEmpty!31926 (= (arr!27023 _values!1231) (store mapRest!31926 mapKey!31926 mapValue!31926))))

(declare-fun mapIsEmpty!31926 () Bool)

(assert (=> mapIsEmpty!31926 mapRes!31926))

(declare-fun b!933347 () Bool)

(declare-fun tp_is_empty!20111 () Bool)

(assert (=> b!933347 (= e!524097 tp_is_empty!20111)))

(declare-fun b!933348 () Bool)

(declare-fun res!628649 () Bool)

(declare-fun e!524094 () Bool)

(assert (=> b!933348 (=> (not res!628649) (not e!524094))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933348 (= res!628649 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun res!628651 () Bool)

(declare-fun e!524095 () Bool)

(assert (=> start!79416 (=> (not res!628651) (not e!524095))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79416 (= res!628651 (validMask!0 mask!1881))))

(assert (=> start!79416 e!524095))

(assert (=> start!79416 true))

(assert (=> start!79416 tp_is_empty!20111))

(declare-fun e!524096 () Bool)

(declare-fun array_inv!21034 (array!56158) Bool)

(assert (=> start!79416 (and (array_inv!21034 _values!1231) e!524096)))

(assert (=> start!79416 tp!61253))

(declare-datatypes ((array!56160 0))(
  ( (array!56161 (arr!27024 (Array (_ BitVec 32) (_ BitVec 64))) (size!27483 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56160)

(declare-fun array_inv!21035 (array!56160) Bool)

(assert (=> start!79416 (array_inv!21035 _keys!1487)))

(declare-fun b!933349 () Bool)

(declare-fun res!628653 () Bool)

(assert (=> b!933349 (=> (not res!628653) (not e!524094))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933349 (= res!628653 (validKeyInArray!0 k!1099))))

(declare-fun b!933350 () Bool)

(declare-fun e!524100 () Bool)

(assert (=> b!933350 (= e!524096 (and e!524100 mapRes!31926))))

(declare-fun condMapEmpty!31926 () Bool)

(declare-fun mapDefault!31926 () ValueCell!9574)

