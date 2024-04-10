; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34630 () Bool)

(assert start!34630)

(declare-fun b_free!7477 () Bool)

(declare-fun b_next!7477 () Bool)

(assert (=> start!34630 (= b_free!7477 (not b_next!7477))))

(declare-fun tp!25988 () Bool)

(declare-fun b_and!14693 () Bool)

(assert (=> start!34630 (= tp!25988 b_and!14693)))

(declare-fun b!346038 () Bool)

(declare-fun e!212091 () Bool)

(declare-fun e!212090 () Bool)

(assert (=> b!346038 (= e!212091 e!212090)))

(declare-fun res!191412 () Bool)

(assert (=> b!346038 (=> (not res!191412) (not e!212090))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18447 0))(
  ( (array!18448 (arr!8736 (Array (_ BitVec 32) (_ BitVec 64))) (size!9088 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18447)

(declare-datatypes ((SeekEntryResult!3367 0))(
  ( (MissingZero!3367 (index!15647 (_ BitVec 32))) (Found!3367 (index!15648 (_ BitVec 32))) (Intermediate!3367 (undefined!4179 Bool) (index!15649 (_ BitVec 32)) (x!34473 (_ BitVec 32))) (Undefined!3367) (MissingVacant!3367 (index!15650 (_ BitVec 32))) )
))
(declare-fun lt!163174 () SeekEntryResult!3367)

(assert (=> b!346038 (= res!191412 (and (is-Found!3367 lt!163174) (= (select (arr!8736 _keys!1895) (index!15648 lt!163174)) k!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18447 (_ BitVec 32)) SeekEntryResult!3367)

(assert (=> b!346038 (= lt!163174 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346039 () Bool)

(declare-fun e!212087 () Bool)

(declare-fun tp_is_empty!7429 () Bool)

(assert (=> b!346039 (= e!212087 tp_is_empty!7429)))

(declare-fun b!346040 () Bool)

(declare-fun e!212086 () Bool)

(declare-fun mapRes!12594 () Bool)

(assert (=> b!346040 (= e!212086 (and e!212087 mapRes!12594))))

(declare-fun condMapEmpty!12594 () Bool)

(declare-datatypes ((V!10883 0))(
  ( (V!10884 (val!3759 Int)) )
))
(declare-datatypes ((ValueCell!3371 0))(
  ( (ValueCellFull!3371 (v!5939 V!10883)) (EmptyCell!3371) )
))
(declare-datatypes ((array!18449 0))(
  ( (array!18450 (arr!8737 (Array (_ BitVec 32) ValueCell!3371)) (size!9089 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18449)

(declare-fun mapDefault!12594 () ValueCell!3371)

