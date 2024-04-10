; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34522 () Bool)

(assert start!34522)

(declare-fun b_free!7445 () Bool)

(declare-fun b_next!7445 () Bool)

(assert (=> start!34522 (= b_free!7445 (not b_next!7445))))

(declare-fun tp!25881 () Bool)

(declare-fun b_and!14653 () Bool)

(assert (=> start!34522 (= tp!25881 b_and!14653)))

(declare-fun b!345055 () Bool)

(declare-fun res!190901 () Bool)

(declare-fun e!211490 () Bool)

(assert (=> b!345055 (=> (not res!190901) (not e!211490))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10839 0))(
  ( (V!10840 (val!3743 Int)) )
))
(declare-datatypes ((ValueCell!3355 0))(
  ( (ValueCellFull!3355 (v!5919 V!10839)) (EmptyCell!3355) )
))
(declare-datatypes ((array!18377 0))(
  ( (array!18378 (arr!8705 (Array (_ BitVec 32) ValueCell!3355)) (size!9057 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18377)

(declare-datatypes ((array!18379 0))(
  ( (array!18380 (arr!8706 (Array (_ BitVec 32) (_ BitVec 64))) (size!9058 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18379)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!345055 (= res!190901 (and (= (size!9057 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9058 _keys!1895) (size!9057 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!345056 () Bool)

(declare-fun res!190898 () Bool)

(assert (=> b!345056 (=> (not res!190898) (not e!211490))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345056 (= res!190898 (validKeyInArray!0 k!1348))))

(declare-fun b!345057 () Bool)

(declare-fun res!190897 () Bool)

(assert (=> b!345057 (=> (not res!190897) (not e!211490))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18379 (_ BitVec 32)) Bool)

(assert (=> b!345057 (= res!190897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!345058 () Bool)

(declare-fun res!190900 () Bool)

(assert (=> b!345058 (=> (not res!190900) (not e!211490))))

(declare-datatypes ((List!5035 0))(
  ( (Nil!5032) (Cons!5031 (h!5887 (_ BitVec 64)) (t!10151 List!5035)) )
))
(declare-fun arrayNoDuplicates!0 (array!18379 (_ BitVec 32) List!5035) Bool)

(assert (=> b!345058 (= res!190900 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5032))))

(declare-fun mapNonEmpty!12534 () Bool)

(declare-fun mapRes!12534 () Bool)

(declare-fun tp!25880 () Bool)

(declare-fun e!211491 () Bool)

(assert (=> mapNonEmpty!12534 (= mapRes!12534 (and tp!25880 e!211491))))

(declare-fun mapValue!12534 () ValueCell!3355)

(declare-fun mapKey!12534 () (_ BitVec 32))

(declare-fun mapRest!12534 () (Array (_ BitVec 32) ValueCell!3355))

(assert (=> mapNonEmpty!12534 (= (arr!8705 _values!1525) (store mapRest!12534 mapKey!12534 mapValue!12534))))

(declare-fun b!345060 () Bool)

(assert (=> b!345060 (= e!211490 false)))

(declare-datatypes ((SeekEntryResult!3355 0))(
  ( (MissingZero!3355 (index!15599 (_ BitVec 32))) (Found!3355 (index!15600 (_ BitVec 32))) (Intermediate!3355 (undefined!4167 Bool) (index!15601 (_ BitVec 32)) (x!34373 (_ BitVec 32))) (Undefined!3355) (MissingVacant!3355 (index!15602 (_ BitVec 32))) )
))
(declare-fun lt!162742 () SeekEntryResult!3355)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18379 (_ BitVec 32)) SeekEntryResult!3355)

(assert (=> b!345060 (= lt!162742 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!345061 () Bool)

(declare-fun e!211492 () Bool)

(declare-fun tp_is_empty!7397 () Bool)

(assert (=> b!345061 (= e!211492 tp_is_empty!7397)))

(declare-fun mapIsEmpty!12534 () Bool)

(assert (=> mapIsEmpty!12534 mapRes!12534))

(declare-fun b!345062 () Bool)

(declare-fun e!211493 () Bool)

(assert (=> b!345062 (= e!211493 (and e!211492 mapRes!12534))))

(declare-fun condMapEmpty!12534 () Bool)

(declare-fun mapDefault!12534 () ValueCell!3355)

