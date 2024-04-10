; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34840 () Bool)

(assert start!34840)

(declare-fun b_free!7625 () Bool)

(declare-fun b_next!7625 () Bool)

(assert (=> start!34840 (= b_free!7625 (not b_next!7625))))

(declare-fun tp!26441 () Bool)

(declare-fun b_and!14847 () Bool)

(assert (=> start!34840 (= tp!26441 b_and!14847)))

(declare-fun b!348872 () Bool)

(declare-fun e!213719 () Bool)

(declare-fun e!213720 () Bool)

(assert (=> b!348872 (= e!213719 e!213720)))

(declare-fun res!193333 () Bool)

(assert (=> b!348872 (=> (not res!193333) (not e!213720))))

(declare-datatypes ((SeekEntryResult!3423 0))(
  ( (MissingZero!3423 (index!15871 (_ BitVec 32))) (Found!3423 (index!15872 (_ BitVec 32))) (Intermediate!3423 (undefined!4235 Bool) (index!15873 (_ BitVec 32)) (x!34751 (_ BitVec 32))) (Undefined!3423) (MissingVacant!3423 (index!15874 (_ BitVec 32))) )
))
(declare-fun lt!163956 () SeekEntryResult!3423)

(assert (=> b!348872 (= res!193333 (and (not (is-Found!3423 lt!163956)) (is-MissingZero!3423 lt!163956)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18739 0))(
  ( (array!18740 (arr!8879 (Array (_ BitVec 32) (_ BitVec 64))) (size!9231 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18739)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18739 (_ BitVec 32)) SeekEntryResult!3423)

(assert (=> b!348872 (= lt!163956 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!348873 () Bool)

(declare-fun res!193331 () Bool)

(assert (=> b!348873 (=> (not res!193331) (not e!213719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348873 (= res!193331 (validKeyInArray!0 k!1348))))

(declare-fun b!348874 () Bool)

(declare-fun res!193335 () Bool)

(assert (=> b!348874 (=> (not res!193335) (not e!213719))))

(declare-datatypes ((V!11079 0))(
  ( (V!11080 (val!3833 Int)) )
))
(declare-fun zeroValue!1467 () V!11079)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3445 0))(
  ( (ValueCellFull!3445 (v!6016 V!11079)) (EmptyCell!3445) )
))
(declare-datatypes ((array!18741 0))(
  ( (array!18742 (arr!8880 (Array (_ BitVec 32) ValueCell!3445)) (size!9232 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18741)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11079)

(declare-datatypes ((tuple2!5538 0))(
  ( (tuple2!5539 (_1!2780 (_ BitVec 64)) (_2!2780 V!11079)) )
))
(declare-datatypes ((List!5161 0))(
  ( (Nil!5158) (Cons!5157 (h!6013 tuple2!5538) (t!10291 List!5161)) )
))
(declare-datatypes ((ListLongMap!4451 0))(
  ( (ListLongMap!4452 (toList!2241 List!5161)) )
))
(declare-fun contains!2306 (ListLongMap!4451 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1762 (array!18739 array!18741 (_ BitVec 32) (_ BitVec 32) V!11079 V!11079 (_ BitVec 32) Int) ListLongMap!4451)

(assert (=> b!348874 (= res!193335 (not (contains!2306 (getCurrentListMap!1762 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!193329 () Bool)

(assert (=> start!34840 (=> (not res!193329) (not e!213719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34840 (= res!193329 (validMask!0 mask!2385))))

(assert (=> start!34840 e!213719))

(assert (=> start!34840 true))

(declare-fun tp_is_empty!7577 () Bool)

(assert (=> start!34840 tp_is_empty!7577))

(assert (=> start!34840 tp!26441))

(declare-fun e!213721 () Bool)

(declare-fun array_inv!6568 (array!18741) Bool)

(assert (=> start!34840 (and (array_inv!6568 _values!1525) e!213721)))

(declare-fun array_inv!6569 (array!18739) Bool)

(assert (=> start!34840 (array_inv!6569 _keys!1895)))

(declare-fun b!348875 () Bool)

(declare-fun e!213717 () Bool)

(assert (=> b!348875 (= e!213717 tp_is_empty!7577)))

(declare-fun mapNonEmpty!12825 () Bool)

(declare-fun mapRes!12825 () Bool)

(declare-fun tp!26442 () Bool)

(assert (=> mapNonEmpty!12825 (= mapRes!12825 (and tp!26442 e!213717))))

(declare-fun mapRest!12825 () (Array (_ BitVec 32) ValueCell!3445))

(declare-fun mapKey!12825 () (_ BitVec 32))

(declare-fun mapValue!12825 () ValueCell!3445)

(assert (=> mapNonEmpty!12825 (= (arr!8880 _values!1525) (store mapRest!12825 mapKey!12825 mapValue!12825))))

(declare-fun b!348876 () Bool)

(declare-fun res!193330 () Bool)

(assert (=> b!348876 (=> (not res!193330) (not e!213720))))

(declare-fun arrayContainsKey!0 (array!18739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348876 (= res!193330 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348877 () Bool)

(declare-fun e!213722 () Bool)

(assert (=> b!348877 (= e!213721 (and e!213722 mapRes!12825))))

(declare-fun condMapEmpty!12825 () Bool)

(declare-fun mapDefault!12825 () ValueCell!3445)

