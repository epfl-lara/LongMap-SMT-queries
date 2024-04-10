; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79430 () Bool)

(assert start!79430)

(declare-fun b_free!17617 () Bool)

(declare-fun b_next!17617 () Bool)

(assert (=> start!79430 (= b_free!17617 (not b_next!17617))))

(declare-fun tp!61294 () Bool)

(declare-fun b_and!28793 () Bool)

(assert (=> start!79430 (= tp!61294 b_and!28793)))

(declare-fun b!933634 () Bool)

(declare-fun res!628859 () Bool)

(declare-fun e!524243 () Bool)

(assert (=> b!933634 (=> (not res!628859) (not e!524243))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933634 (= res!628859 (validKeyInArray!0 k!1099))))

(declare-fun b!933635 () Bool)

(declare-fun res!628855 () Bool)

(declare-fun e!524247 () Bool)

(assert (=> b!933635 (=> (not res!628855) (not e!524247))))

(declare-datatypes ((array!56186 0))(
  ( (array!56187 (arr!27037 (Array (_ BitVec 32) (_ BitVec 64))) (size!27496 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56186)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56186 (_ BitVec 32)) Bool)

(assert (=> b!933635 (= res!628855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933636 () Bool)

(declare-fun e!524241 () Bool)

(declare-fun e!524242 () Bool)

(declare-fun mapRes!31947 () Bool)

(assert (=> b!933636 (= e!524241 (and e!524242 mapRes!31947))))

(declare-fun condMapEmpty!31947 () Bool)

(declare-datatypes ((V!31799 0))(
  ( (V!31800 (val!10113 Int)) )
))
(declare-datatypes ((ValueCell!9581 0))(
  ( (ValueCellFull!9581 (v!12632 V!31799)) (EmptyCell!9581) )
))
(declare-datatypes ((array!56188 0))(
  ( (array!56189 (arr!27038 (Array (_ BitVec 32) ValueCell!9581)) (size!27497 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56188)

(declare-fun mapDefault!31947 () ValueCell!9581)

