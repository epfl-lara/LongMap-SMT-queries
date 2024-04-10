; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77410 () Bool)

(assert start!77410)

(declare-fun b!902376 () Bool)

(declare-fun e!505366 () Bool)

(declare-fun e!505365 () Bool)

(declare-fun mapRes!29371 () Bool)

(assert (=> b!902376 (= e!505366 (and e!505365 mapRes!29371))))

(declare-fun condMapEmpty!29371 () Bool)

(declare-datatypes ((V!29559 0))(
  ( (V!29560 (val!9273 Int)) )
))
(declare-datatypes ((ValueCell!8741 0))(
  ( (ValueCellFull!8741 (v!11777 V!29559)) (EmptyCell!8741) )
))
(declare-datatypes ((array!52954 0))(
  ( (array!52955 (arr!25439 (Array (_ BitVec 32) ValueCell!8741)) (size!25898 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52954)

(declare-fun mapDefault!29371 () ValueCell!8741)

