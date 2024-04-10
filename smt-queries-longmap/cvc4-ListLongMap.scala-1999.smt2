; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34952 () Bool)

(assert start!34952)

(declare-fun b_free!7667 () Bool)

(declare-fun b_next!7667 () Bool)

(assert (=> start!34952 (= b_free!7667 (not b_next!7667))))

(declare-fun tp!26577 () Bool)

(declare-fun b_and!14895 () Bool)

(assert (=> start!34952 (= tp!26577 b_and!14895)))

(declare-fun b!350037 () Bool)

(declare-fun e!214412 () Bool)

(declare-fun tp_is_empty!7619 () Bool)

(assert (=> b!350037 (= e!214412 tp_is_empty!7619)))

(declare-fun b!350038 () Bool)

(declare-fun res!193991 () Bool)

(declare-fun e!214413 () Bool)

(assert (=> b!350038 (=> (not res!193991) (not e!214413))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!11135 0))(
  ( (V!11136 (val!3854 Int)) )
))
(declare-fun zeroValue!1467 () V!11135)

(declare-datatypes ((ValueCell!3466 0))(
  ( (ValueCellFull!3466 (v!6040 V!11135)) (EmptyCell!3466) )
))
(declare-datatypes ((array!18823 0))(
  ( (array!18824 (arr!8918 (Array (_ BitVec 32) ValueCell!3466)) (size!9270 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18823)

(declare-datatypes ((array!18825 0))(
  ( (array!18826 (arr!8919 (Array (_ BitVec 32) (_ BitVec 64))) (size!9271 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18825)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11135)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!5566 0))(
  ( (tuple2!5567 (_1!2794 (_ BitVec 64)) (_2!2794 V!11135)) )
))
(declare-datatypes ((List!5187 0))(
  ( (Nil!5184) (Cons!5183 (h!6039 tuple2!5566) (t!10323 List!5187)) )
))
(declare-datatypes ((ListLongMap!4479 0))(
  ( (ListLongMap!4480 (toList!2255 List!5187)) )
))
(declare-fun contains!2323 (ListLongMap!4479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1776 (array!18825 array!18823 (_ BitVec 32) (_ BitVec 32) V!11135 V!11135 (_ BitVec 32) Int) ListLongMap!4479)

(assert (=> b!350038 (= res!193991 (not (contains!2323 (getCurrentListMap!1776 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350039 () Bool)

(declare-fun e!214416 () Bool)

(declare-fun mapRes!12897 () Bool)

(assert (=> b!350039 (= e!214416 (and e!214412 mapRes!12897))))

(declare-fun condMapEmpty!12897 () Bool)

(declare-fun mapDefault!12897 () ValueCell!3466)

