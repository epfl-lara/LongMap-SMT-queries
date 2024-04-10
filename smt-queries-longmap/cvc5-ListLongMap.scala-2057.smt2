; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35510 () Bool)

(assert start!35510)

(declare-fun b!355862 () Bool)

(declare-fun res!197434 () Bool)

(declare-fun e!218017 () Bool)

(assert (=> b!355862 (=> (not res!197434) (not e!218017))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((array!19503 0))(
  ( (array!19504 (arr!9245 (Array (_ BitVec 32) (_ BitVec 64))) (size!9597 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19503)

(declare-datatypes ((V!11595 0))(
  ( (V!11596 (val!4026 Int)) )
))
(declare-datatypes ((ValueCell!3638 0))(
  ( (ValueCellFull!3638 (v!6220 V!11595)) (EmptyCell!3638) )
))
(declare-datatypes ((array!19505 0))(
  ( (array!19506 (arr!9246 (Array (_ BitVec 32) ValueCell!3638)) (size!9598 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19505)

(declare-fun mask!1842 () (_ BitVec 32))

(assert (=> b!355862 (= res!197434 (and (= (size!9598 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9597 _keys!1456) (size!9598 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13452 () Bool)

(declare-fun mapRes!13452 () Bool)

(assert (=> mapIsEmpty!13452 mapRes!13452))

(declare-fun b!355863 () Bool)

(declare-fun e!218018 () Bool)

(declare-fun e!218021 () Bool)

(assert (=> b!355863 (= e!218018 (and e!218021 mapRes!13452))))

(declare-fun condMapEmpty!13452 () Bool)

(declare-fun mapDefault!13452 () ValueCell!3638)

