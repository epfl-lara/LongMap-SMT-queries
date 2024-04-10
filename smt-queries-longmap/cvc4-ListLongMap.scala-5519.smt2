; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72902 () Bool)

(assert start!72902)

(declare-fun b_free!13817 () Bool)

(declare-fun b_next!13817 () Bool)

(assert (=> start!72902 (= b_free!13817 (not b_next!13817))))

(declare-fun tp!48955 () Bool)

(declare-fun b_and!22903 () Bool)

(assert (=> start!72902 (= tp!48955 b_and!22903)))

(declare-fun b!846364 () Bool)

(declare-fun res!575020 () Bool)

(declare-fun e!472384 () Bool)

(assert (=> b!846364 (=> (not res!575020) (not e!472384))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48120 0))(
  ( (array!48121 (arr!23091 (Array (_ BitVec 32) (_ BitVec 64))) (size!23531 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48120)

(assert (=> b!846364 (= res!575020 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23531 _keys!868))))))

(declare-fun b!846365 () Bool)

(declare-fun e!472387 () Bool)

(declare-fun e!472385 () Bool)

(declare-fun mapRes!25529 () Bool)

(assert (=> b!846365 (= e!472387 (and e!472385 mapRes!25529))))

(declare-fun condMapEmpty!25529 () Bool)

(declare-datatypes ((V!26317 0))(
  ( (V!26318 (val!8024 Int)) )
))
(declare-datatypes ((ValueCell!7537 0))(
  ( (ValueCellFull!7537 (v!10449 V!26317)) (EmptyCell!7537) )
))
(declare-datatypes ((array!48122 0))(
  ( (array!48123 (arr!23092 (Array (_ BitVec 32) ValueCell!7537)) (size!23532 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48122)

(declare-fun mapDefault!25529 () ValueCell!7537)

