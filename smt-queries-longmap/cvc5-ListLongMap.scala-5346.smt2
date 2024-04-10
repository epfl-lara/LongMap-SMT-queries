; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71438 () Bool)

(assert start!71438)

(declare-fun b_free!13483 () Bool)

(declare-fun b_next!13483 () Bool)

(assert (=> start!71438 (= b_free!13483 (not b_next!13483))))

(declare-fun tp!47230 () Bool)

(declare-fun b_and!22489 () Bool)

(assert (=> start!71438 (= tp!47230 b_and!22489)))

(declare-fun b!829650 () Bool)

(declare-fun res!565159 () Bool)

(declare-fun e!462486 () Bool)

(assert (=> b!829650 (=> (not res!565159) (not e!462486))))

(declare-datatypes ((array!46552 0))(
  ( (array!46553 (arr!22314 (Array (_ BitVec 32) (_ BitVec 64))) (size!22735 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46552)

(declare-datatypes ((List!15932 0))(
  ( (Nil!15929) (Cons!15928 (h!17057 (_ BitVec 64)) (t!22293 List!15932)) )
))
(declare-fun arrayNoDuplicates!0 (array!46552 (_ BitVec 32) List!15932) Bool)

(assert (=> b!829650 (= res!565159 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15929))))

(declare-fun mapIsEmpty!24436 () Bool)

(declare-fun mapRes!24436 () Bool)

(assert (=> mapIsEmpty!24436 mapRes!24436))

(declare-fun b!829651 () Bool)

(declare-fun e!462485 () Bool)

(declare-fun e!462487 () Bool)

(assert (=> b!829651 (= e!462485 (and e!462487 mapRes!24436))))

(declare-fun condMapEmpty!24436 () Bool)

(declare-datatypes ((V!25259 0))(
  ( (V!25260 (val!7644 Int)) )
))
(declare-datatypes ((ValueCell!7181 0))(
  ( (ValueCellFull!7181 (v!10084 V!25259)) (EmptyCell!7181) )
))
(declare-datatypes ((array!46554 0))(
  ( (array!46555 (arr!22315 (Array (_ BitVec 32) ValueCell!7181)) (size!22736 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46554)

(declare-fun mapDefault!24436 () ValueCell!7181)

