; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34482 () Bool)

(assert start!34482)

(declare-fun b_free!7405 () Bool)

(declare-fun b_next!7405 () Bool)

(assert (=> start!34482 (= b_free!7405 (not b_next!7405))))

(declare-fun tp!25761 () Bool)

(declare-fun b_and!14613 () Bool)

(assert (=> start!34482 (= tp!25761 b_and!14613)))

(declare-fun e!211193 () Bool)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!344515 () Bool)

(declare-datatypes ((SeekEntryResult!3341 0))(
  ( (MissingZero!3341 (index!15543 (_ BitVec 32))) (Found!3341 (index!15544 (_ BitVec 32))) (Intermediate!3341 (undefined!4153 Bool) (index!15545 (_ BitVec 32)) (x!34311 (_ BitVec 32))) (Undefined!3341) (MissingVacant!3341 (index!15546 (_ BitVec 32))) )
))
(declare-fun lt!162682 () SeekEntryResult!3341)

(declare-datatypes ((array!18301 0))(
  ( (array!18302 (arr!8667 (Array (_ BitVec 32) (_ BitVec 64))) (size!9019 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18301)

(assert (=> b!344515 (= e!211193 (and (not (is-Found!3341 lt!162682)) (not (is-MissingZero!3341 lt!162682)) (not (is-MissingVacant!3341 lt!162682)) (not (is-Undefined!3341 lt!162682)) (not (= (size!9019 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18301 (_ BitVec 32)) SeekEntryResult!3341)

(assert (=> b!344515 (= lt!162682 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!344516 () Bool)

(declare-fun e!211191 () Bool)

(declare-fun tp_is_empty!7357 () Bool)

(assert (=> b!344516 (= e!211191 tp_is_empty!7357)))

(declare-fun b!344517 () Bool)

(declare-fun res!190536 () Bool)

(assert (=> b!344517 (=> (not res!190536) (not e!211193))))

(declare-datatypes ((V!10787 0))(
  ( (V!10788 (val!3723 Int)) )
))
(declare-fun zeroValue!1467 () V!10787)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3335 0))(
  ( (ValueCellFull!3335 (v!5899 V!10787)) (EmptyCell!3335) )
))
(declare-datatypes ((array!18303 0))(
  ( (array!18304 (arr!8668 (Array (_ BitVec 32) ValueCell!3335)) (size!9020 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18303)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10787)

(declare-datatypes ((tuple2!5388 0))(
  ( (tuple2!5389 (_1!2705 (_ BitVec 64)) (_2!2705 V!10787)) )
))
(declare-datatypes ((List!5010 0))(
  ( (Nil!5007) (Cons!5006 (h!5862 tuple2!5388) (t!10126 List!5010)) )
))
(declare-datatypes ((ListLongMap!4301 0))(
  ( (ListLongMap!4302 (toList!2166 List!5010)) )
))
(declare-fun contains!2224 (ListLongMap!4301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1687 (array!18301 array!18303 (_ BitVec 32) (_ BitVec 32) V!10787 V!10787 (_ BitVec 32) Int) ListLongMap!4301)

(assert (=> b!344517 (= res!190536 (not (contains!2224 (getCurrentListMap!1687 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!190541 () Bool)

(assert (=> start!34482 (=> (not res!190541) (not e!211193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34482 (= res!190541 (validMask!0 mask!2385))))

(assert (=> start!34482 e!211193))

(assert (=> start!34482 true))

(assert (=> start!34482 tp_is_empty!7357))

(assert (=> start!34482 tp!25761))

(declare-fun e!211192 () Bool)

(declare-fun array_inv!6418 (array!18303) Bool)

(assert (=> start!34482 (and (array_inv!6418 _values!1525) e!211192)))

(declare-fun array_inv!6419 (array!18301) Bool)

(assert (=> start!34482 (array_inv!6419 _keys!1895)))

(declare-fun b!344518 () Bool)

(declare-fun e!211194 () Bool)

(assert (=> b!344518 (= e!211194 tp_is_empty!7357)))

(declare-fun mapNonEmpty!12474 () Bool)

(declare-fun mapRes!12474 () Bool)

(declare-fun tp!25760 () Bool)

(assert (=> mapNonEmpty!12474 (= mapRes!12474 (and tp!25760 e!211191))))

(declare-fun mapRest!12474 () (Array (_ BitVec 32) ValueCell!3335))

(declare-fun mapKey!12474 () (_ BitVec 32))

(declare-fun mapValue!12474 () ValueCell!3335)

(assert (=> mapNonEmpty!12474 (= (arr!8668 _values!1525) (store mapRest!12474 mapKey!12474 mapValue!12474))))

(declare-fun b!344519 () Bool)

(declare-fun res!190538 () Bool)

(assert (=> b!344519 (=> (not res!190538) (not e!211193))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!344519 (= res!190538 (validKeyInArray!0 k!1348))))

(declare-fun b!344520 () Bool)

(declare-fun res!190539 () Bool)

(assert (=> b!344520 (=> (not res!190539) (not e!211193))))

(assert (=> b!344520 (= res!190539 (and (= (size!9020 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9019 _keys!1895) (size!9020 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!344521 () Bool)

(declare-fun res!190540 () Bool)

(assert (=> b!344521 (=> (not res!190540) (not e!211193))))

(declare-datatypes ((List!5011 0))(
  ( (Nil!5008) (Cons!5007 (h!5863 (_ BitVec 64)) (t!10127 List!5011)) )
))
(declare-fun arrayNoDuplicates!0 (array!18301 (_ BitVec 32) List!5011) Bool)

(assert (=> b!344521 (= res!190540 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5008))))

(declare-fun mapIsEmpty!12474 () Bool)

(assert (=> mapIsEmpty!12474 mapRes!12474))

(declare-fun b!344522 () Bool)

(assert (=> b!344522 (= e!211192 (and e!211194 mapRes!12474))))

(declare-fun condMapEmpty!12474 () Bool)

(declare-fun mapDefault!12474 () ValueCell!3335)

