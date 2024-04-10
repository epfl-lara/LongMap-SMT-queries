; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72746 () Bool)

(assert start!72746)

(declare-fun b!844298 () Bool)

(declare-fun e!471217 () Bool)

(assert (=> b!844298 (= e!471217 false)))

(declare-fun lt!381262 () Bool)

(declare-datatypes ((array!47830 0))(
  ( (array!47831 (arr!22946 (Array (_ BitVec 32) (_ BitVec 64))) (size!23386 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47830)

(declare-datatypes ((List!16267 0))(
  ( (Nil!16264) (Cons!16263 (h!17394 (_ BitVec 64)) (t!22638 List!16267)) )
))
(declare-fun arrayNoDuplicates!0 (array!47830 (_ BitVec 32) List!16267) Bool)

(assert (=> b!844298 (= lt!381262 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16264))))

(declare-fun b!844299 () Bool)

(declare-fun e!471216 () Bool)

(declare-fun e!471213 () Bool)

(declare-fun mapRes!25295 () Bool)

(assert (=> b!844299 (= e!471216 (and e!471213 mapRes!25295))))

(declare-fun condMapEmpty!25295 () Bool)

(declare-datatypes ((V!26109 0))(
  ( (V!26110 (val!7946 Int)) )
))
(declare-datatypes ((ValueCell!7459 0))(
  ( (ValueCellFull!7459 (v!10371 V!26109)) (EmptyCell!7459) )
))
(declare-datatypes ((array!47832 0))(
  ( (array!47833 (arr!22947 (Array (_ BitVec 32) ValueCell!7459)) (size!23387 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47832)

(declare-fun mapDefault!25295 () ValueCell!7459)

