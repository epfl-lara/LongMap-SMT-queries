; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35114 () Bool)

(assert start!35114)

(declare-fun b_free!7759 () Bool)

(declare-fun b_next!7759 () Bool)

(assert (=> start!35114 (= b_free!7759 (not b_next!7759))))

(declare-fun tp!26861 () Bool)

(declare-fun b_and!14993 () Bool)

(assert (=> start!35114 (= tp!26861 b_and!14993)))

(declare-fun mapIsEmpty!13044 () Bool)

(declare-fun mapRes!13044 () Bool)

(assert (=> mapIsEmpty!13044 mapRes!13044))

(declare-fun b!352080 () Bool)

(declare-fun res!195265 () Bool)

(declare-fun e!215597 () Bool)

(assert (=> b!352080 (=> (not res!195265) (not e!215597))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11259 0))(
  ( (V!11260 (val!3900 Int)) )
))
(declare-fun zeroValue!1467 () V!11259)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3512 0))(
  ( (ValueCellFull!3512 (v!6089 V!11259)) (EmptyCell!3512) )
))
(declare-datatypes ((array!19011 0))(
  ( (array!19012 (arr!9009 (Array (_ BitVec 32) ValueCell!3512)) (size!9361 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!19011)

(declare-datatypes ((array!19013 0))(
  ( (array!19014 (arr!9010 (Array (_ BitVec 32) (_ BitVec 64))) (size!9362 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!19013)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11259)

(declare-datatypes ((tuple2!5622 0))(
  ( (tuple2!5623 (_1!2822 (_ BitVec 64)) (_2!2822 V!11259)) )
))
(declare-datatypes ((List!5244 0))(
  ( (Nil!5241) (Cons!5240 (h!6096 tuple2!5622) (t!10386 List!5244)) )
))
(declare-datatypes ((ListLongMap!4535 0))(
  ( (ListLongMap!4536 (toList!2283 List!5244)) )
))
(declare-fun contains!2354 (ListLongMap!4535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1804 (array!19013 array!19011 (_ BitVec 32) (_ BitVec 32) V!11259 V!11259 (_ BitVec 32) Int) ListLongMap!4535)

(assert (=> b!352080 (= res!195265 (not (contains!2354 (getCurrentListMap!1804 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!352081 () Bool)

(declare-fun e!215600 () Bool)

(declare-fun e!215602 () Bool)

(assert (=> b!352081 (= e!215600 (and e!215602 mapRes!13044))))

(declare-fun condMapEmpty!13044 () Bool)

(declare-fun mapDefault!13044 () ValueCell!3512)

