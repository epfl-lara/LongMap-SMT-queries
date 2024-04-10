; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35004 () Bool)

(assert start!35004)

(declare-fun b_free!7693 () Bool)

(declare-fun b_next!7693 () Bool)

(assert (=> start!35004 (= b_free!7693 (not b_next!7693))))

(declare-fun tp!26657 () Bool)

(declare-fun b_and!14923 () Bool)

(assert (=> start!35004 (= tp!26657 b_and!14923)))

(declare-fun mapNonEmpty!12939 () Bool)

(declare-fun mapRes!12939 () Bool)

(declare-fun tp!26658 () Bool)

(declare-fun e!214790 () Bool)

(assert (=> mapNonEmpty!12939 (= mapRes!12939 (and tp!26658 e!214790))))

(declare-fun mapKey!12939 () (_ BitVec 32))

(declare-datatypes ((V!11171 0))(
  ( (V!11172 (val!3867 Int)) )
))
(declare-datatypes ((ValueCell!3479 0))(
  ( (ValueCellFull!3479 (v!6054 V!11171)) (EmptyCell!3479) )
))
(declare-fun mapRest!12939 () (Array (_ BitVec 32) ValueCell!3479))

(declare-datatypes ((array!18877 0))(
  ( (array!18878 (arr!8944 (Array (_ BitVec 32) ValueCell!3479)) (size!9296 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18877)

(declare-fun mapValue!12939 () ValueCell!3479)

(assert (=> mapNonEmpty!12939 (= (arr!8944 _values!1525) (store mapRest!12939 mapKey!12939 mapValue!12939))))

(declare-fun b!350678 () Bool)

(declare-fun res!194371 () Bool)

(declare-fun e!214795 () Bool)

(assert (=> b!350678 (=> (not res!194371) (not e!214795))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11171)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18879 0))(
  ( (array!18880 (arr!8945 (Array (_ BitVec 32) (_ BitVec 64))) (size!9297 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18879)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11171)

(declare-datatypes ((tuple2!5580 0))(
  ( (tuple2!5581 (_1!2801 (_ BitVec 64)) (_2!2801 V!11171)) )
))
(declare-datatypes ((List!5202 0))(
  ( (Nil!5199) (Cons!5198 (h!6054 tuple2!5580) (t!10340 List!5202)) )
))
(declare-datatypes ((ListLongMap!4493 0))(
  ( (ListLongMap!4494 (toList!2262 List!5202)) )
))
(declare-fun contains!2331 (ListLongMap!4493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1783 (array!18879 array!18877 (_ BitVec 32) (_ BitVec 32) V!11171 V!11171 (_ BitVec 32) Int) ListLongMap!4493)

(assert (=> b!350678 (= res!194371 (not (contains!2331 (getCurrentListMap!1783 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!350679 () Bool)

(declare-fun res!194369 () Bool)

(assert (=> b!350679 (=> (not res!194369) (not e!214795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350679 (= res!194369 (validKeyInArray!0 k!1348))))

(declare-fun res!194376 () Bool)

(assert (=> start!35004 (=> (not res!194376) (not e!214795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35004 (= res!194376 (validMask!0 mask!2385))))

(assert (=> start!35004 e!214795))

(assert (=> start!35004 true))

(declare-fun tp_is_empty!7645 () Bool)

(assert (=> start!35004 tp_is_empty!7645))

(assert (=> start!35004 tp!26657))

(declare-fun e!214791 () Bool)

(declare-fun array_inv!6602 (array!18877) Bool)

(assert (=> start!35004 (and (array_inv!6602 _values!1525) e!214791)))

(declare-fun array_inv!6603 (array!18879) Bool)

(assert (=> start!35004 (array_inv!6603 _keys!1895)))

(declare-fun b!350680 () Bool)

(declare-fun res!194373 () Bool)

(assert (=> b!350680 (=> (not res!194373) (not e!214795))))

(declare-datatypes ((List!5203 0))(
  ( (Nil!5200) (Cons!5199 (h!6055 (_ BitVec 64)) (t!10341 List!5203)) )
))
(declare-fun arrayNoDuplicates!0 (array!18879 (_ BitVec 32) List!5203) Bool)

(assert (=> b!350680 (= res!194373 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5200))))

(declare-fun b!350681 () Bool)

(declare-fun res!194372 () Bool)

(declare-fun e!214794 () Bool)

(assert (=> b!350681 (=> (not res!194372) (not e!214794))))

(declare-fun arrayContainsKey!0 (array!18879 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350681 (= res!194372 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!350682 () Bool)

(declare-fun res!194375 () Bool)

(assert (=> b!350682 (=> (not res!194375) (not e!214795))))

(assert (=> b!350682 (= res!194375 (and (= (size!9296 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9297 _keys!1895) (size!9296 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350683 () Bool)

(declare-fun e!214793 () Bool)

(assert (=> b!350683 (= e!214791 (and e!214793 mapRes!12939))))

(declare-fun condMapEmpty!12939 () Bool)

(declare-fun mapDefault!12939 () ValueCell!3479)

