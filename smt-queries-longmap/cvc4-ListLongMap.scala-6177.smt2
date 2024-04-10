; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79174 () Bool)

(assert start!79174)

(declare-fun b_free!17387 () Bool)

(declare-fun b_next!17387 () Bool)

(assert (=> start!79174 (= b_free!17387 (not b_next!17387))))

(declare-fun tp!60601 () Bool)

(declare-fun b_and!28453 () Bool)

(assert (=> start!79174 (= tp!60601 b_and!28453)))

(declare-fun b!929401 () Bool)

(declare-fun e!521910 () Bool)

(declare-fun tp_is_empty!19895 () Bool)

(assert (=> b!929401 (= e!521910 tp_is_empty!19895)))

(declare-fun res!625859 () Bool)

(declare-fun e!521909 () Bool)

(assert (=> start!79174 (=> (not res!625859) (not e!521909))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79174 (= res!625859 (validMask!0 mask!1881))))

(assert (=> start!79174 e!521909))

(assert (=> start!79174 true))

(assert (=> start!79174 tp_is_empty!19895))

(declare-datatypes ((V!31491 0))(
  ( (V!31492 (val!9998 Int)) )
))
(declare-datatypes ((ValueCell!9466 0))(
  ( (ValueCellFull!9466 (v!12516 V!31491)) (EmptyCell!9466) )
))
(declare-datatypes ((array!55744 0))(
  ( (array!55745 (arr!26817 (Array (_ BitVec 32) ValueCell!9466)) (size!27276 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55744)

(declare-fun e!521907 () Bool)

(declare-fun array_inv!20870 (array!55744) Bool)

(assert (=> start!79174 (and (array_inv!20870 _values!1231) e!521907)))

(assert (=> start!79174 tp!60601))

(declare-datatypes ((array!55746 0))(
  ( (array!55747 (arr!26818 (Array (_ BitVec 32) (_ BitVec 64))) (size!27277 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55746)

(declare-fun array_inv!20871 (array!55746) Bool)

(assert (=> start!79174 (array_inv!20871 _keys!1487)))

(declare-fun b!929402 () Bool)

(declare-fun res!625856 () Bool)

(assert (=> b!929402 (=> (not res!625856) (not e!521909))))

(declare-datatypes ((List!18865 0))(
  ( (Nil!18862) (Cons!18861 (h!20007 (_ BitVec 64)) (t!26922 List!18865)) )
))
(declare-fun arrayNoDuplicates!0 (array!55746 (_ BitVec 32) List!18865) Bool)

(assert (=> b!929402 (= res!625856 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18862))))

(declare-fun mapIsEmpty!31599 () Bool)

(declare-fun mapRes!31599 () Bool)

(assert (=> mapIsEmpty!31599 mapRes!31599))

(declare-fun b!929403 () Bool)

(assert (=> b!929403 (= e!521907 (and e!521910 mapRes!31599))))

(declare-fun condMapEmpty!31599 () Bool)

(declare-fun mapDefault!31599 () ValueCell!9466)

