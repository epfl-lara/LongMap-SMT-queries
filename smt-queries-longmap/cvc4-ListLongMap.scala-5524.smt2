; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72932 () Bool)

(assert start!72932)

(declare-fun b_free!13847 () Bool)

(declare-fun b_next!13847 () Bool)

(assert (=> start!72932 (= b_free!13847 (not b_next!13847))))

(declare-fun tp!49044 () Bool)

(declare-fun b_and!22933 () Bool)

(assert (=> start!72932 (= tp!49044 b_and!22933)))

(declare-fun b!846859 () Bool)

(declare-fun res!575374 () Bool)

(declare-fun e!472610 () Bool)

(assert (=> b!846859 (=> (not res!575374) (not e!472610))))

(declare-datatypes ((array!48178 0))(
  ( (array!48179 (arr!23120 (Array (_ BitVec 32) (_ BitVec 64))) (size!23560 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48178)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48178 (_ BitVec 32)) Bool)

(assert (=> b!846859 (= res!575374 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25574 () Bool)

(declare-fun mapRes!25574 () Bool)

(assert (=> mapIsEmpty!25574 mapRes!25574))

(declare-fun b!846860 () Bool)

(declare-fun e!472612 () Bool)

(declare-fun tp_is_empty!15983 () Bool)

(assert (=> b!846860 (= e!472612 tp_is_empty!15983)))

(declare-fun mapNonEmpty!25574 () Bool)

(declare-fun tp!49045 () Bool)

(declare-fun e!472609 () Bool)

(assert (=> mapNonEmpty!25574 (= mapRes!25574 (and tp!49045 e!472609))))

(declare-datatypes ((V!26357 0))(
  ( (V!26358 (val!8039 Int)) )
))
(declare-datatypes ((ValueCell!7552 0))(
  ( (ValueCellFull!7552 (v!10464 V!26357)) (EmptyCell!7552) )
))
(declare-fun mapValue!25574 () ValueCell!7552)

(declare-fun mapRest!25574 () (Array (_ BitVec 32) ValueCell!7552))

(declare-fun mapKey!25574 () (_ BitVec 32))

(declare-datatypes ((array!48180 0))(
  ( (array!48181 (arr!23121 (Array (_ BitVec 32) ValueCell!7552)) (size!23561 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48180)

(assert (=> mapNonEmpty!25574 (= (arr!23121 _values!688) (store mapRest!25574 mapKey!25574 mapValue!25574))))

(declare-fun b!846862 () Bool)

(declare-fun e!472611 () Bool)

(assert (=> b!846862 (= e!472611 (and e!472612 mapRes!25574))))

(declare-fun condMapEmpty!25574 () Bool)

(declare-fun mapDefault!25574 () ValueCell!7552)

