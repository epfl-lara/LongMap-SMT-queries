; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38888 () Bool)

(assert start!38888)

(declare-fun b!406508 () Bool)

(declare-fun e!244270 () Bool)

(declare-fun tp_is_empty!10307 () Bool)

(assert (=> b!406508 (= e!244270 tp_is_empty!10307)))

(declare-fun res!234831 () Bool)

(declare-fun e!244268 () Bool)

(assert (=> start!38888 (=> (not res!234831) (not e!244268))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24503 0))(
  ( (array!24504 (arr!11701 (Array (_ BitVec 32) (_ BitVec 64))) (size!12053 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24503)

(assert (=> start!38888 (= res!234831 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12053 _keys!709))))))

(assert (=> start!38888 e!244268))

(assert (=> start!38888 true))

(declare-datatypes ((V!14847 0))(
  ( (V!14848 (val!5198 Int)) )
))
(declare-datatypes ((ValueCell!4810 0))(
  ( (ValueCellFull!4810 (v!7445 V!14847)) (EmptyCell!4810) )
))
(declare-datatypes ((array!24505 0))(
  ( (array!24506 (arr!11702 (Array (_ BitVec 32) ValueCell!4810)) (size!12054 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24505)

(declare-fun e!244269 () Bool)

(declare-fun array_inv!8544 (array!24505) Bool)

(assert (=> start!38888 (and (array_inv!8544 _values!549) e!244269)))

(declare-fun array_inv!8545 (array!24503) Bool)

(assert (=> start!38888 (array_inv!8545 _keys!709)))

(declare-fun b!406509 () Bool)

(declare-fun mapRes!17082 () Bool)

(assert (=> b!406509 (= e!244269 (and e!244270 mapRes!17082))))

(declare-fun condMapEmpty!17082 () Bool)

(declare-fun mapDefault!17082 () ValueCell!4810)

