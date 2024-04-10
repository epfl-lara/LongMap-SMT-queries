; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82852 () Bool)

(assert start!82852)

(declare-fun b_free!18979 () Bool)

(declare-fun b_next!18979 () Bool)

(assert (=> start!82852 (= b_free!18979 (not b_next!18979))))

(declare-fun tp!66066 () Bool)

(declare-fun b_and!30467 () Bool)

(assert (=> start!82852 (= tp!66066 b_and!30467)))

(declare-fun b!966535 () Bool)

(declare-fun e!544852 () Bool)

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966535 (= e!544852 (and (bvsgt from!2084 newFrom!159) (bvsle from!2084 #b00000000000000000000000000000000)))))

(declare-fun b!966536 () Bool)

(declare-fun e!544854 () Bool)

(declare-fun e!544855 () Bool)

(declare-fun mapRes!34675 () Bool)

(assert (=> b!966536 (= e!544854 (and e!544855 mapRes!34675))))

(declare-fun condMapEmpty!34675 () Bool)

(declare-datatypes ((V!34033 0))(
  ( (V!34034 (val!10944 Int)) )
))
(declare-datatypes ((ValueCell!10412 0))(
  ( (ValueCellFull!10412 (v!13502 V!34033)) (EmptyCell!10412) )
))
(declare-datatypes ((array!59655 0))(
  ( (array!59656 (arr!28696 (Array (_ BitVec 32) ValueCell!10412)) (size!29175 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59655)

(declare-fun mapDefault!34675 () ValueCell!10412)

