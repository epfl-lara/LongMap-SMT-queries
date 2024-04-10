; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34816 () Bool)

(assert start!34816)

(declare-fun b_free!7601 () Bool)

(declare-fun b_next!7601 () Bool)

(assert (=> start!34816 (= b_free!7601 (not b_next!7601))))

(declare-fun tp!26369 () Bool)

(declare-fun b_and!14823 () Bool)

(assert (=> start!34816 (= tp!26369 b_and!14823)))

(declare-fun b!348476 () Bool)

(declare-fun e!213501 () Bool)

(declare-fun e!213505 () Bool)

(assert (=> b!348476 (= e!213501 e!213505)))

(declare-fun res!193041 () Bool)

(assert (=> b!348476 (=> (not res!193041) (not e!213505))))

(declare-datatypes ((SeekEntryResult!3415 0))(
  ( (MissingZero!3415 (index!15839 (_ BitVec 32))) (Found!3415 (index!15840 (_ BitVec 32))) (Intermediate!3415 (undefined!4227 Bool) (index!15841 (_ BitVec 32)) (x!34711 (_ BitVec 32))) (Undefined!3415) (MissingVacant!3415 (index!15842 (_ BitVec 32))) )
))
(declare-fun lt!163884 () SeekEntryResult!3415)

(assert (=> b!348476 (= res!193041 (and (not (is-Found!3415 lt!163884)) (is-MissingZero!3415 lt!163884)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!18693 0))(
  ( (array!18694 (arr!8856 (Array (_ BitVec 32) (_ BitVec 64))) (size!9208 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18693)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18693 (_ BitVec 32)) SeekEntryResult!3415)

(assert (=> b!348476 (= lt!163884 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12789 () Bool)

(declare-fun mapRes!12789 () Bool)

(assert (=> mapIsEmpty!12789 mapRes!12789))

(declare-fun b!348477 () Bool)

(declare-fun res!193043 () Bool)

(assert (=> b!348477 (=> (not res!193043) (not e!213505))))

(declare-fun arrayContainsKey!0 (array!18693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348477 (= res!193043 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348478 () Bool)

(declare-fun e!213504 () Bool)

(declare-fun e!213502 () Bool)

(assert (=> b!348478 (= e!213504 (and e!213502 mapRes!12789))))

(declare-fun condMapEmpty!12789 () Bool)

(declare-datatypes ((V!11047 0))(
  ( (V!11048 (val!3821 Int)) )
))
(declare-datatypes ((ValueCell!3433 0))(
  ( (ValueCellFull!3433 (v!6004 V!11047)) (EmptyCell!3433) )
))
(declare-datatypes ((array!18695 0))(
  ( (array!18696 (arr!8857 (Array (_ BitVec 32) ValueCell!3433)) (size!9209 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18695)

(declare-fun mapDefault!12789 () ValueCell!3433)

