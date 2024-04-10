; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7364 () Bool)

(assert start!7364)

(declare-fun b!47268 () Bool)

(declare-fun res!27501 () Bool)

(declare-fun e!30251 () Bool)

(assert (=> b!47268 (=> (not res!27501) (not e!30251))))

(declare-datatypes ((array!3109 0))(
  ( (array!3110 (arr!1491 (Array (_ BitVec 32) (_ BitVec 64))) (size!1713 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3109)

(declare-fun mask!2458 () (_ BitVec 32))

(declare-datatypes ((V!2431 0))(
  ( (V!2432 (val!1050 Int)) )
))
(declare-datatypes ((ValueCell!722 0))(
  ( (ValueCellFull!722 (v!2110 V!2431)) (EmptyCell!722) )
))
(declare-datatypes ((array!3111 0))(
  ( (array!3112 (arr!1492 (Array (_ BitVec 32) ValueCell!722)) (size!1714 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3111)

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47268 (= res!27501 (and (= (size!1714 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1713 _keys!1940) (size!1714 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun b!47269 () Bool)

(declare-fun e!30250 () Bool)

(declare-fun e!30253 () Bool)

(declare-fun mapRes!2072 () Bool)

(assert (=> b!47269 (= e!30250 (and e!30253 mapRes!2072))))

(declare-fun condMapEmpty!2072 () Bool)

(declare-fun mapDefault!2072 () ValueCell!722)

