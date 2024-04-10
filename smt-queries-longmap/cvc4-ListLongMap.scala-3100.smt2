; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43544 () Bool)

(assert start!43544)

(declare-fun b_free!12323 () Bool)

(declare-fun b_next!12323 () Bool)

(assert (=> start!43544 (= b_free!12323 (not b_next!12323))))

(declare-fun tp!43252 () Bool)

(declare-fun b_and!21083 () Bool)

(assert (=> start!43544 (= tp!43252 b_and!21083)))

(declare-fun res!287606 () Bool)

(declare-fun e!283934 () Bool)

(assert (=> start!43544 (=> (not res!287606) (not e!283934))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43544 (= res!287606 (validMask!0 mask!2352))))

(assert (=> start!43544 e!283934))

(assert (=> start!43544 true))

(declare-fun tp_is_empty!13835 () Bool)

(assert (=> start!43544 tp_is_empty!13835))

(declare-datatypes ((V!19517 0))(
  ( (V!19518 (val!6965 Int)) )
))
(declare-datatypes ((ValueCell!6556 0))(
  ( (ValueCellFull!6556 (v!9258 V!19517)) (EmptyCell!6556) )
))
(declare-datatypes ((array!31327 0))(
  ( (array!31328 (arr!15066 (Array (_ BitVec 32) ValueCell!6556)) (size!15424 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31327)

(declare-fun e!283935 () Bool)

(declare-fun array_inv!10870 (array!31327) Bool)

(assert (=> start!43544 (and (array_inv!10870 _values!1516) e!283935)))

(assert (=> start!43544 tp!43252))

(declare-datatypes ((array!31329 0))(
  ( (array!31330 (arr!15067 (Array (_ BitVec 32) (_ BitVec 64))) (size!15425 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31329)

(declare-fun array_inv!10871 (array!31329) Bool)

(assert (=> start!43544 (array_inv!10871 _keys!1874)))

(declare-fun mapIsEmpty!22462 () Bool)

(declare-fun mapRes!22462 () Bool)

(assert (=> mapIsEmpty!22462 mapRes!22462))

(declare-fun b!482479 () Bool)

(declare-fun e!283937 () Bool)

(assert (=> b!482479 (= e!283935 (and e!283937 mapRes!22462))))

(declare-fun condMapEmpty!22462 () Bool)

(declare-fun mapDefault!22462 () ValueCell!6556)

