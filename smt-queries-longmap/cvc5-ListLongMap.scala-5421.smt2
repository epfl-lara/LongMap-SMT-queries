; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72310 () Bool)

(assert start!72310)

(declare-fun b!837776 () Bool)

(declare-fun e!467621 () Bool)

(declare-fun e!467619 () Bool)

(declare-fun mapRes!24641 () Bool)

(assert (=> b!837776 (= e!467621 (and e!467619 mapRes!24641))))

(declare-fun condMapEmpty!24641 () Bool)

(declare-datatypes ((V!25529 0))(
  ( (V!25530 (val!7728 Int)) )
))
(declare-datatypes ((ValueCell!7241 0))(
  ( (ValueCellFull!7241 (v!10153 V!25529)) (EmptyCell!7241) )
))
(declare-datatypes ((array!47020 0))(
  ( (array!47021 (arr!22541 (Array (_ BitVec 32) ValueCell!7241)) (size!22981 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47020)

(declare-fun mapDefault!24641 () ValueCell!7241)

