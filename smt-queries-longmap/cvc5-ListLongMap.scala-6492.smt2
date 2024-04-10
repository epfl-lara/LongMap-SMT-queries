; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82792 () Bool)

(assert start!82792)

(declare-fun b_free!18919 () Bool)

(declare-fun b_next!18919 () Bool)

(assert (=> start!82792 (= b_free!18919 (not b_next!18919))))

(declare-fun tp!65886 () Bool)

(declare-fun b_and!30407 () Bool)

(assert (=> start!82792 (= tp!65886 b_and!30407)))

(declare-fun b!965723 () Bool)

(declare-fun res!646425 () Bool)

(declare-fun e!544406 () Bool)

(assert (=> b!965723 (=> (not res!646425) (not e!544406))))

(declare-datatypes ((array!59539 0))(
  ( (array!59540 (arr!28638 (Array (_ BitVec 32) (_ BitVec 64))) (size!29117 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59539)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965723 (= res!646425 (validKeyInArray!0 (select (arr!28638 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34585 () Bool)

(declare-fun mapRes!34585 () Bool)

(assert (=> mapIsEmpty!34585 mapRes!34585))

(declare-fun b!965724 () Bool)

(declare-fun e!544402 () Bool)

(declare-fun e!544405 () Bool)

(assert (=> b!965724 (= e!544402 (and e!544405 mapRes!34585))))

(declare-fun condMapEmpty!34585 () Bool)

(declare-datatypes ((V!33953 0))(
  ( (V!33954 (val!10914 Int)) )
))
(declare-datatypes ((ValueCell!10382 0))(
  ( (ValueCellFull!10382 (v!13472 V!33953)) (EmptyCell!10382) )
))
(declare-datatypes ((array!59541 0))(
  ( (array!59542 (arr!28639 (Array (_ BitVec 32) ValueCell!10382)) (size!29118 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59541)

(declare-fun mapDefault!34585 () ValueCell!10382)

