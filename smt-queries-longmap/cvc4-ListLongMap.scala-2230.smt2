; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36846 () Bool)

(assert start!36846)

(declare-fun b_free!7973 () Bool)

(declare-fun b_next!7973 () Bool)

(assert (=> start!36846 (= b_free!7973 (not b_next!7973))))

(declare-fun tp!28635 () Bool)

(declare-fun b_and!15215 () Bool)

(assert (=> start!36846 (= tp!28635 b_and!15215)))

(declare-fun b!368513 () Bool)

(declare-fun res!206545 () Bool)

(declare-fun e!225369 () Bool)

(assert (=> b!368513 (=> (not res!206545) (not e!225369))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368513 (= res!206545 (validKeyInArray!0 k!778))))

(declare-fun b!368514 () Bool)

(declare-fun e!225370 () Bool)

(declare-fun e!225367 () Bool)

(declare-fun mapRes!14496 () Bool)

(assert (=> b!368514 (= e!225370 (and e!225367 mapRes!14496))))

(declare-fun condMapEmpty!14496 () Bool)

(declare-datatypes ((V!12599 0))(
  ( (V!12600 (val!4355 Int)) )
))
(declare-datatypes ((ValueCell!3967 0))(
  ( (ValueCellFull!3967 (v!6552 V!12599)) (EmptyCell!3967) )
))
(declare-datatypes ((array!21199 0))(
  ( (array!21200 (arr!10068 (Array (_ BitVec 32) ValueCell!3967)) (size!10420 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21199)

(declare-fun mapDefault!14496 () ValueCell!3967)

