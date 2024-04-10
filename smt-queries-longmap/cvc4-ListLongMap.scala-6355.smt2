; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81870 () Bool)

(assert start!81870)

(declare-fun b_free!18365 () Bool)

(declare-fun b_next!18365 () Bool)

(assert (=> start!81870 (= b_free!18365 (not b_next!18365))))

(declare-fun tp!63794 () Bool)

(declare-fun b_and!29851 () Bool)

(assert (=> start!81870 (= tp!63794 b_and!29851)))

(declare-fun res!639379 () Bool)

(declare-fun e!537927 () Bool)

(assert (=> start!81870 (=> (not res!639379) (not e!537927))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81870 (= res!639379 (validMask!0 mask!1823))))

(assert (=> start!81870 e!537927))

(assert (=> start!81870 true))

(declare-fun tp_is_empty!20909 () Bool)

(assert (=> start!81870 tp_is_empty!20909))

(declare-datatypes ((array!57927 0))(
  ( (array!57928 (arr!27843 (Array (_ BitVec 32) (_ BitVec 64))) (size!28322 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57927)

(declare-fun array_inv!21613 (array!57927) Bool)

(assert (=> start!81870 (array_inv!21613 _keys!1441)))

(declare-datatypes ((V!32861 0))(
  ( (V!32862 (val!10505 Int)) )
))
(declare-datatypes ((ValueCell!9973 0))(
  ( (ValueCellFull!9973 (v!13060 V!32861)) (EmptyCell!9973) )
))
(declare-datatypes ((array!57929 0))(
  ( (array!57930 (arr!27844 (Array (_ BitVec 32) ValueCell!9973)) (size!28323 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57929)

(declare-fun e!537926 () Bool)

(declare-fun array_inv!21614 (array!57929) Bool)

(assert (=> start!81870 (and (array_inv!21614 _values!1197) e!537926)))

(assert (=> start!81870 tp!63794))

(declare-fun b!954805 () Bool)

(declare-fun e!537928 () Bool)

(declare-fun mapRes!33325 () Bool)

(assert (=> b!954805 (= e!537926 (and e!537928 mapRes!33325))))

(declare-fun condMapEmpty!33325 () Bool)

(declare-fun mapDefault!33325 () ValueCell!9973)

