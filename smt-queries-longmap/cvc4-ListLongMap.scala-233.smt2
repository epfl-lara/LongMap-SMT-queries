; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4084 () Bool)

(assert start!4084)

(declare-fun b_free!989 () Bool)

(declare-fun b_next!989 () Bool)

(assert (=> start!4084 (= b_free!989 (not b_next!989))))

(declare-fun tp!4387 () Bool)

(declare-fun b_and!1799 () Bool)

(assert (=> start!4084 (= tp!4387 b_and!1799)))

(declare-fun b!30225 () Bool)

(declare-fun res!18197 () Bool)

(declare-fun e!19428 () Bool)

(assert (=> b!30225 (=> (not res!18197) (not e!19428))))

(declare-datatypes ((V!1615 0))(
  ( (V!1616 (val!698 Int)) )
))
(declare-datatypes ((ValueCell!472 0))(
  ( (ValueCellFull!472 (v!1787 V!1615)) (EmptyCell!472) )
))
(declare-datatypes ((array!1915 0))(
  ( (array!1916 (arr!911 (Array (_ BitVec 32) ValueCell!472)) (size!1012 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1915)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1917 0))(
  ( (array!1918 (arr!912 (Array (_ BitVec 32) (_ BitVec 64))) (size!1013 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1917)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30225 (= res!18197 (and (= (size!1012 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1013 _keys!1833) (size!1012 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30226 () Bool)

(declare-fun e!19426 () Bool)

(declare-fun tp_is_empty!1343 () Bool)

(assert (=> b!30226 (= e!19426 tp_is_empty!1343)))

(declare-fun b!30227 () Bool)

(declare-fun e!19429 () Bool)

(assert (=> b!30227 (= e!19429 tp_is_empty!1343)))

(declare-fun b!30228 () Bool)

(declare-fun e!19427 () Bool)

(declare-fun mapRes!1543 () Bool)

(assert (=> b!30228 (= e!19427 (and e!19429 mapRes!1543))))

(declare-fun condMapEmpty!1543 () Bool)

(declare-fun mapDefault!1543 () ValueCell!472)

