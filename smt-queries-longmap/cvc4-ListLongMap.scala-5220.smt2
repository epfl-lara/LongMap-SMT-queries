; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70374 () Bool)

(assert start!70374)

(declare-fun b_free!12731 () Bool)

(declare-fun b_next!12731 () Bool)

(assert (=> start!70374 (= b_free!12731 (not b_next!12731))))

(declare-fun tp!44920 () Bool)

(declare-fun b_and!21543 () Bool)

(assert (=> start!70374 (= tp!44920 b_and!21543)))

(declare-fun b!817530 () Bool)

(declare-fun e!453659 () Bool)

(declare-fun e!453657 () Bool)

(declare-fun mapRes!23254 () Bool)

(assert (=> b!817530 (= e!453659 (and e!453657 mapRes!23254))))

(declare-fun condMapEmpty!23254 () Bool)

(declare-datatypes ((V!24255 0))(
  ( (V!24256 (val!7268 Int)) )
))
(declare-datatypes ((ValueCell!6805 0))(
  ( (ValueCellFull!6805 (v!9697 V!24255)) (EmptyCell!6805) )
))
(declare-datatypes ((array!45082 0))(
  ( (array!45083 (arr!21597 (Array (_ BitVec 32) ValueCell!6805)) (size!22018 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45082)

(declare-fun mapDefault!23254 () ValueCell!6805)

