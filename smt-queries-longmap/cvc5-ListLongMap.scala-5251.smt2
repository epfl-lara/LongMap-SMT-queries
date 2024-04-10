; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70626 () Bool)

(assert start!70626)

(declare-fun b_free!12913 () Bool)

(declare-fun b_next!12913 () Bool)

(assert (=> start!70626 (= b_free!12913 (not b_next!12913))))

(declare-fun tp!45477 () Bool)

(declare-fun b_and!21767 () Bool)

(assert (=> start!70626 (= tp!45477 b_and!21767)))

(declare-fun b!820467 () Bool)

(declare-fun res!559804 () Bool)

(declare-fun e!455826 () Bool)

(assert (=> b!820467 (=> (not res!559804) (not e!455826))))

(declare-datatypes ((array!45440 0))(
  ( (array!45441 (arr!21772 (Array (_ BitVec 32) (_ BitVec 64))) (size!22193 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45440)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45440 (_ BitVec 32)) Bool)

(assert (=> b!820467 (= res!559804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820468 () Bool)

(declare-fun e!455827 () Bool)

(declare-fun e!455823 () Bool)

(declare-fun mapRes!23539 () Bool)

(assert (=> b!820468 (= e!455827 (and e!455823 mapRes!23539))))

(declare-fun condMapEmpty!23539 () Bool)

(declare-datatypes ((V!24499 0))(
  ( (V!24500 (val!7359 Int)) )
))
(declare-datatypes ((ValueCell!6896 0))(
  ( (ValueCellFull!6896 (v!9790 V!24499)) (EmptyCell!6896) )
))
(declare-datatypes ((array!45442 0))(
  ( (array!45443 (arr!21773 (Array (_ BitVec 32) ValueCell!6896)) (size!22194 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45442)

(declare-fun mapDefault!23539 () ValueCell!6896)

