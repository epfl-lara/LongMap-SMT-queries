; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82780 () Bool)

(assert start!82780)

(declare-fun b_free!18913 () Bool)

(declare-fun b_next!18913 () Bool)

(assert (=> start!82780 (= b_free!18913 (not b_next!18913))))

(declare-fun tp!65858 () Bool)

(declare-fun b_and!30401 () Bool)

(assert (=> start!82780 (= tp!65858 b_and!30401)))

(declare-fun b!965572 () Bool)

(declare-fun res!646329 () Bool)

(declare-fun e!544315 () Bool)

(assert (=> b!965572 (=> (not res!646329) (not e!544315))))

(declare-datatypes ((array!59515 0))(
  ( (array!59516 (arr!28626 (Array (_ BitVec 32) (_ BitVec 64))) (size!29105 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59515)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965572 (= res!646329 (validKeyInArray!0 (select (arr!28626 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34567 () Bool)

(declare-fun mapRes!34567 () Bool)

(declare-fun tp!65859 () Bool)

(declare-fun e!544313 () Bool)

(assert (=> mapNonEmpty!34567 (= mapRes!34567 (and tp!65859 e!544313))))

(declare-datatypes ((V!33937 0))(
  ( (V!33938 (val!10908 Int)) )
))
(declare-datatypes ((ValueCell!10376 0))(
  ( (ValueCellFull!10376 (v!13466 V!33937)) (EmptyCell!10376) )
))
(declare-fun mapRest!34567 () (Array (_ BitVec 32) ValueCell!10376))

(declare-fun mapKey!34567 () (_ BitVec 32))

(declare-datatypes ((array!59517 0))(
  ( (array!59518 (arr!28627 (Array (_ BitVec 32) ValueCell!10376)) (size!29106 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59517)

(declare-fun mapValue!34567 () ValueCell!10376)

(assert (=> mapNonEmpty!34567 (= (arr!28627 _values!1400) (store mapRest!34567 mapKey!34567 mapValue!34567))))

(declare-fun b!965573 () Bool)

(declare-fun e!544314 () Bool)

(declare-fun e!544312 () Bool)

(assert (=> b!965573 (= e!544314 (and e!544312 mapRes!34567))))

(declare-fun condMapEmpty!34567 () Bool)

(declare-fun mapDefault!34567 () ValueCell!10376)

