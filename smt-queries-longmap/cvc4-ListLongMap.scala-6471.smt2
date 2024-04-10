; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82670 () Bool)

(assert start!82670)

(declare-fun b_free!18803 () Bool)

(declare-fun b_next!18803 () Bool)

(assert (=> start!82670 (= b_free!18803 (not b_next!18803))))

(declare-fun tp!65528 () Bool)

(declare-fun b_and!30291 () Bool)

(assert (=> start!82670 (= tp!65528 b_and!30291)))

(declare-fun mapIsEmpty!34402 () Bool)

(declare-fun mapRes!34402 () Bool)

(assert (=> mapIsEmpty!34402 mapRes!34402))

(declare-fun b!963822 () Bool)

(declare-fun e!543409 () Bool)

(declare-fun e!543406 () Bool)

(assert (=> b!963822 (= e!543409 (and e!543406 mapRes!34402))))

(declare-fun condMapEmpty!34402 () Bool)

(declare-datatypes ((V!33789 0))(
  ( (V!33790 (val!10853 Int)) )
))
(declare-datatypes ((ValueCell!10321 0))(
  ( (ValueCellFull!10321 (v!13411 V!33789)) (EmptyCell!10321) )
))
(declare-datatypes ((array!59301 0))(
  ( (array!59302 (arr!28519 (Array (_ BitVec 32) ValueCell!10321)) (size!28998 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59301)

(declare-fun mapDefault!34402 () ValueCell!10321)

