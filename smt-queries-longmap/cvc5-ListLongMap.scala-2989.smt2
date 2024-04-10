; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42224 () Bool)

(assert start!42224)

(declare-fun b_free!11743 () Bool)

(declare-fun b_next!11743 () Bool)

(assert (=> start!42224 (= b_free!11743 (not b_next!11743))))

(declare-fun tp!41253 () Bool)

(declare-fun b_and!20173 () Bool)

(assert (=> start!42224 (= tp!41253 b_and!20173)))

(declare-fun b!471267 () Bool)

(declare-fun e!276181 () Bool)

(declare-fun tp_is_empty!13171 () Bool)

(assert (=> b!471267 (= e!276181 tp_is_empty!13171)))

(declare-fun b!471268 () Bool)

(declare-fun e!276183 () Bool)

(declare-fun e!276185 () Bool)

(declare-fun mapRes!21460 () Bool)

(assert (=> b!471268 (= e!276183 (and e!276185 mapRes!21460))))

(declare-fun condMapEmpty!21460 () Bool)

(declare-datatypes ((V!18667 0))(
  ( (V!18668 (val!6630 Int)) )
))
(declare-datatypes ((ValueCell!6242 0))(
  ( (ValueCellFull!6242 (v!8921 V!18667)) (EmptyCell!6242) )
))
(declare-datatypes ((array!30107 0))(
  ( (array!30108 (arr!14476 (Array (_ BitVec 32) ValueCell!6242)) (size!14828 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30107)

(declare-fun mapDefault!21460 () ValueCell!6242)

