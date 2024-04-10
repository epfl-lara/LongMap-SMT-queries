; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72916 () Bool)

(assert start!72916)

(declare-fun b_free!13831 () Bool)

(declare-fun b_next!13831 () Bool)

(assert (=> start!72916 (= b_free!13831 (not b_next!13831))))

(declare-fun tp!48997 () Bool)

(declare-fun b_and!22917 () Bool)

(assert (=> start!72916 (= tp!48997 b_and!22917)))

(declare-fun b!846595 () Bool)

(declare-fun res!575187 () Bool)

(declare-fun e!472488 () Bool)

(assert (=> b!846595 (=> (not res!575187) (not e!472488))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!48146 0))(
  ( (array!48147 (arr!23104 (Array (_ BitVec 32) (_ BitVec 64))) (size!23544 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48146)

(assert (=> b!846595 (= res!575187 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23544 _keys!868))))))

(declare-fun b!846596 () Bool)

(declare-fun e!472492 () Bool)

(declare-fun e!472491 () Bool)

(declare-fun mapRes!25550 () Bool)

(assert (=> b!846596 (= e!472492 (and e!472491 mapRes!25550))))

(declare-fun condMapEmpty!25550 () Bool)

(declare-datatypes ((V!26337 0))(
  ( (V!26338 (val!8031 Int)) )
))
(declare-datatypes ((ValueCell!7544 0))(
  ( (ValueCellFull!7544 (v!10456 V!26337)) (EmptyCell!7544) )
))
(declare-datatypes ((array!48148 0))(
  ( (array!48149 (arr!23105 (Array (_ BitVec 32) ValueCell!7544)) (size!23545 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48148)

(declare-fun mapDefault!25550 () ValueCell!7544)

