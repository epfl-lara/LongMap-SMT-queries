; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36912 () Bool)

(assert start!36912)

(declare-fun b_free!8039 () Bool)

(declare-fun b_next!8039 () Bool)

(assert (=> start!36912 (= b_free!8039 (not b_next!8039))))

(declare-fun tp!28833 () Bool)

(declare-fun b_and!15281 () Bool)

(assert (=> start!36912 (= tp!28833 b_and!15281)))

(declare-fun b!369800 () Bool)

(declare-fun e!225960 () Bool)

(declare-fun e!225961 () Bool)

(declare-fun mapRes!14595 () Bool)

(assert (=> b!369800 (= e!225960 (and e!225961 mapRes!14595))))

(declare-fun condMapEmpty!14595 () Bool)

(declare-datatypes ((V!12687 0))(
  ( (V!12688 (val!4388 Int)) )
))
(declare-datatypes ((ValueCell!4000 0))(
  ( (ValueCellFull!4000 (v!6585 V!12687)) (EmptyCell!4000) )
))
(declare-datatypes ((array!21319 0))(
  ( (array!21320 (arr!10128 (Array (_ BitVec 32) ValueCell!4000)) (size!10480 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21319)

(declare-fun mapDefault!14595 () ValueCell!4000)

