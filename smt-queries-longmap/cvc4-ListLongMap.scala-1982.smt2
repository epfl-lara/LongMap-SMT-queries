; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34780 () Bool)

(assert start!34780)

(declare-fun b_free!7565 () Bool)

(declare-fun b_next!7565 () Bool)

(assert (=> start!34780 (= b_free!7565 (not b_next!7565))))

(declare-fun tp!26262 () Bool)

(declare-fun b_and!14787 () Bool)

(assert (=> start!34780 (= tp!26262 b_and!14787)))

(declare-fun b!347882 () Bool)

(declare-fun res!192610 () Bool)

(declare-fun e!213161 () Bool)

(assert (=> b!347882 (=> (not res!192610) (not e!213161))))

(declare-datatypes ((SeekEntryResult!3404 0))(
  ( (MissingZero!3404 (index!15795 (_ BitVec 32))) (Found!3404 (index!15796 (_ BitVec 32))) (Intermediate!3404 (undefined!4216 Bool) (index!15797 (_ BitVec 32)) (x!34652 (_ BitVec 32))) (Undefined!3404) (MissingVacant!3404 (index!15798 (_ BitVec 32))) )
))
(declare-fun lt!163739 () SeekEntryResult!3404)

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18623 0))(
  ( (array!18624 (arr!8821 (Array (_ BitVec 32) (_ BitVec 64))) (size!9173 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18623)

(declare-fun arrayContainsKey!0 (array!18623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347882 (= res!192610 (arrayContainsKey!0 _keys!1895 k!1348 (index!15796 lt!163739)))))

(declare-fun b!347883 () Bool)

(declare-fun res!192609 () Bool)

(declare-fun e!213158 () Bool)

(assert (=> b!347883 (=> (not res!192609) (not e!213158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347883 (= res!192609 (validKeyInArray!0 k!1348))))

(declare-fun b!347884 () Bool)

(declare-fun e!213164 () Bool)

(declare-fun tp_is_empty!7517 () Bool)

(assert (=> b!347884 (= e!213164 tp_is_empty!7517)))

(declare-fun res!192613 () Bool)

(assert (=> start!34780 (=> (not res!192613) (not e!213158))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34780 (= res!192613 (validMask!0 mask!2385))))

(assert (=> start!34780 e!213158))

(assert (=> start!34780 true))

(assert (=> start!34780 tp_is_empty!7517))

(assert (=> start!34780 tp!26262))

(declare-datatypes ((V!10999 0))(
  ( (V!11000 (val!3803 Int)) )
))
(declare-datatypes ((ValueCell!3415 0))(
  ( (ValueCellFull!3415 (v!5986 V!10999)) (EmptyCell!3415) )
))
(declare-datatypes ((array!18625 0))(
  ( (array!18626 (arr!8822 (Array (_ BitVec 32) ValueCell!3415)) (size!9174 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18625)

(declare-fun e!213160 () Bool)

(declare-fun array_inv!6532 (array!18625) Bool)

(assert (=> start!34780 (and (array_inv!6532 _values!1525) e!213160)))

(declare-fun array_inv!6533 (array!18623) Bool)

(assert (=> start!34780 (array_inv!6533 _keys!1895)))

(declare-fun b!347885 () Bool)

(declare-fun e!213159 () Bool)

(assert (=> b!347885 (= e!213159 e!213161)))

(declare-fun res!192612 () Bool)

(assert (=> b!347885 (=> (not res!192612) (not e!213161))))

(assert (=> b!347885 (= res!192612 (and (is-Found!3404 lt!163739) (= (select (arr!8821 _keys!1895) (index!15796 lt!163739)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18623 (_ BitVec 32)) SeekEntryResult!3404)

(assert (=> b!347885 (= lt!163739 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!347886 () Bool)

(declare-fun mapRes!12735 () Bool)

(assert (=> b!347886 (= e!213160 (and e!213164 mapRes!12735))))

(declare-fun condMapEmpty!12735 () Bool)

(declare-fun mapDefault!12735 () ValueCell!3415)

