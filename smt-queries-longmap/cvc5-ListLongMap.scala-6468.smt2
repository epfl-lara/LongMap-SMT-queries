; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82648 () Bool)

(assert start!82648)

(declare-fun b_free!18781 () Bool)

(declare-fun b_next!18781 () Bool)

(assert (=> start!82648 (= b_free!18781 (not b_next!18781))))

(declare-fun tp!65462 () Bool)

(declare-fun b_and!30269 () Bool)

(assert (=> start!82648 (= tp!65462 b_and!30269)))

(declare-fun b!963459 () Bool)

(declare-fun e!543242 () Bool)

(declare-fun e!543245 () Bool)

(declare-fun mapRes!34369 () Bool)

(assert (=> b!963459 (= e!543242 (and e!543245 mapRes!34369))))

(declare-fun condMapEmpty!34369 () Bool)

(declare-datatypes ((V!33761 0))(
  ( (V!33762 (val!10842 Int)) )
))
(declare-datatypes ((ValueCell!10310 0))(
  ( (ValueCellFull!10310 (v!13400 V!33761)) (EmptyCell!10310) )
))
(declare-datatypes ((array!59261 0))(
  ( (array!59262 (arr!28499 (Array (_ BitVec 32) ValueCell!10310)) (size!28978 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59261)

(declare-fun mapDefault!34369 () ValueCell!10310)

