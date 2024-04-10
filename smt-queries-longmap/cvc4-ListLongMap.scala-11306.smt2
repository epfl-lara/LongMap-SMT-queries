; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131744 () Bool)

(assert start!131744)

(declare-fun b!1542651 () Bool)

(declare-fun e!858306 () Bool)

(declare-fun e!858305 () Bool)

(declare-fun mapRes!58303 () Bool)

(assert (=> b!1542651 (= e!858306 (and e!858305 mapRes!58303))))

(declare-fun condMapEmpty!58303 () Bool)

(declare-datatypes ((V!58753 0))(
  ( (V!58754 (val!18944 Int)) )
))
(declare-datatypes ((ValueCell!17956 0))(
  ( (ValueCellFull!17956 (v!21745 V!58753)) (EmptyCell!17956) )
))
(declare-datatypes ((array!102696 0))(
  ( (array!102697 (arr!49550 (Array (_ BitVec 32) ValueCell!17956)) (size!50100 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102696)

(declare-fun mapDefault!58303 () ValueCell!17956)

