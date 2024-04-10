; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81998 () Bool)

(assert start!81998)

(declare-fun b!956365 () Bool)

(declare-fun res!640364 () Bool)

(declare-fun e!538888 () Bool)

(assert (=> b!956365 (=> (not res!640364) (not e!538888))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33033 0))(
  ( (V!33034 (val!10569 Int)) )
))
(declare-datatypes ((ValueCell!10037 0))(
  ( (ValueCellFull!10037 (v!13124 V!33033)) (EmptyCell!10037) )
))
(declare-datatypes ((array!58171 0))(
  ( (array!58172 (arr!27965 (Array (_ BitVec 32) ValueCell!10037)) (size!28444 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58171)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-datatypes ((array!58173 0))(
  ( (array!58174 (arr!27966 (Array (_ BitVec 32) (_ BitVec 64))) (size!28445 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58173)

(assert (=> b!956365 (= res!640364 (and (= (size!28444 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28445 _keys!1441) (size!28444 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!956366 () Bool)

(declare-fun e!538886 () Bool)

(declare-fun e!538884 () Bool)

(declare-fun mapRes!33517 () Bool)

(assert (=> b!956366 (= e!538886 (and e!538884 mapRes!33517))))

(declare-fun condMapEmpty!33517 () Bool)

(declare-fun mapDefault!33517 () ValueCell!10037)

