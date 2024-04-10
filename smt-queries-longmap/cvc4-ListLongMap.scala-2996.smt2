; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42284 () Bool)

(assert start!42284)

(declare-fun b_free!11789 () Bool)

(declare-fun b_next!11789 () Bool)

(assert (=> start!42284 (= b_free!11789 (not b_next!11789))))

(declare-fun tp!41395 () Bool)

(declare-fun b_and!20227 () Bool)

(assert (=> start!42284 (= tp!41395 b_and!20227)))

(declare-fun b!471835 () Bool)

(declare-fun e!276583 () Bool)

(declare-fun e!276585 () Bool)

(declare-fun mapRes!21532 () Bool)

(assert (=> b!471835 (= e!276583 (and e!276585 mapRes!21532))))

(declare-fun condMapEmpty!21532 () Bool)

(declare-datatypes ((V!18727 0))(
  ( (V!18728 (val!6653 Int)) )
))
(declare-datatypes ((ValueCell!6265 0))(
  ( (ValueCellFull!6265 (v!8944 V!18727)) (EmptyCell!6265) )
))
(declare-datatypes ((array!30193 0))(
  ( (array!30194 (arr!14518 (Array (_ BitVec 32) ValueCell!6265)) (size!14870 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30193)

(declare-fun mapDefault!21532 () ValueCell!6265)

