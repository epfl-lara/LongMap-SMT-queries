; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34134 () Bool)

(assert start!34134)

(declare-fun b_free!7177 () Bool)

(declare-fun b_next!7177 () Bool)

(assert (=> start!34134 (= b_free!7177 (not b_next!7177))))

(declare-fun tp!25061 () Bool)

(declare-fun b_and!14375 () Bool)

(assert (=> start!34134 (= tp!25061 b_and!14375)))

(declare-fun b!340149 () Bool)

(declare-fun res!187870 () Bool)

(declare-fun e!208678 () Bool)

(assert (=> b!340149 (=> (not res!187870) (not e!208678))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10483 0))(
  ( (V!10484 (val!3609 Int)) )
))
(declare-fun zeroValue!1467 () V!10483)

(declare-datatypes ((ValueCell!3221 0))(
  ( (ValueCellFull!3221 (v!5780 V!10483)) (EmptyCell!3221) )
))
(declare-datatypes ((array!17861 0))(
  ( (array!17862 (arr!8452 (Array (_ BitVec 32) ValueCell!3221)) (size!8804 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17861)

(declare-datatypes ((array!17863 0))(
  ( (array!17864 (arr!8453 (Array (_ BitVec 32) (_ BitVec 64))) (size!8805 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17863)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10483)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5240 0))(
  ( (tuple2!5241 (_1!2631 (_ BitVec 64)) (_2!2631 V!10483)) )
))
(declare-datatypes ((List!4859 0))(
  ( (Nil!4856) (Cons!4855 (h!5711 tuple2!5240) (t!9965 List!4859)) )
))
(declare-datatypes ((ListLongMap!4153 0))(
  ( (ListLongMap!4154 (toList!2092 List!4859)) )
))
(declare-fun contains!2145 (ListLongMap!4153 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1613 (array!17863 array!17861 (_ BitVec 32) (_ BitVec 32) V!10483 V!10483 (_ BitVec 32) Int) ListLongMap!4153)

(assert (=> b!340149 (= res!187870 (not (contains!2145 (getCurrentListMap!1613 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!340150 () Bool)

(declare-fun e!208675 () Bool)

(declare-fun tp_is_empty!7129 () Bool)

(assert (=> b!340150 (= e!208675 tp_is_empty!7129)))

(declare-fun b!340151 () Bool)

(declare-fun e!208680 () Bool)

(declare-fun mapRes!12117 () Bool)

(assert (=> b!340151 (= e!208680 (and e!208675 mapRes!12117))))

(declare-fun condMapEmpty!12117 () Bool)

(declare-fun mapDefault!12117 () ValueCell!3221)

