; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34422 () Bool)

(assert start!34422)

(declare-fun b_free!7345 () Bool)

(declare-fun b_next!7345 () Bool)

(assert (=> start!34422 (= b_free!7345 (not b_next!7345))))

(declare-fun tp!25581 () Bool)

(declare-fun b_and!14553 () Bool)

(assert (=> start!34422 (= tp!25581 b_and!14553)))

(declare-fun b!343706 () Bool)

(declare-fun res!190001 () Bool)

(declare-fun e!210741 () Bool)

(assert (=> b!343706 (=> (not res!190001) (not e!210741))))

(declare-datatypes ((array!18187 0))(
  ( (array!18188 (arr!8610 (Array (_ BitVec 32) (_ BitVec 64))) (size!8962 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18187)

(declare-datatypes ((List!4967 0))(
  ( (Nil!4964) (Cons!4963 (h!5819 (_ BitVec 64)) (t!10083 List!4967)) )
))
(declare-fun arrayNoDuplicates!0 (array!18187 (_ BitVec 32) List!4967) Bool)

(assert (=> b!343706 (= res!190001 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4964))))

(declare-fun mapNonEmpty!12384 () Bool)

(declare-fun mapRes!12384 () Bool)

(declare-fun tp!25580 () Bool)

(declare-fun e!210743 () Bool)

(assert (=> mapNonEmpty!12384 (= mapRes!12384 (and tp!25580 e!210743))))

(declare-datatypes ((V!10707 0))(
  ( (V!10708 (val!3693 Int)) )
))
(declare-datatypes ((ValueCell!3305 0))(
  ( (ValueCellFull!3305 (v!5869 V!10707)) (EmptyCell!3305) )
))
(declare-fun mapValue!12384 () ValueCell!3305)

(declare-fun mapRest!12384 () (Array (_ BitVec 32) ValueCell!3305))

(declare-datatypes ((array!18189 0))(
  ( (array!18190 (arr!8611 (Array (_ BitVec 32) ValueCell!3305)) (size!8963 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18189)

(declare-fun mapKey!12384 () (_ BitVec 32))

(assert (=> mapNonEmpty!12384 (= (arr!8611 _values!1525) (store mapRest!12384 mapKey!12384 mapValue!12384))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun b!343707 () Bool)

(declare-datatypes ((SeekEntryResult!3323 0))(
  ( (MissingZero!3323 (index!15471 (_ BitVec 32))) (Found!3323 (index!15472 (_ BitVec 32))) (Intermediate!3323 (undefined!4135 Bool) (index!15473 (_ BitVec 32)) (x!34213 (_ BitVec 32))) (Undefined!3323) (MissingVacant!3323 (index!15474 (_ BitVec 32))) )
))
(declare-fun lt!162592 () SeekEntryResult!3323)

(assert (=> b!343707 (= e!210741 (and (not (is-Found!3323 lt!162592)) (not (is-MissingZero!3323 lt!162592)) (not (is-MissingVacant!3323 lt!162592)) (is-Undefined!3323 lt!162592) (not (= (size!8962 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18187 (_ BitVec 32)) SeekEntryResult!3323)

(assert (=> b!343707 (= lt!162592 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!343708 () Bool)

(declare-fun e!210744 () Bool)

(declare-fun tp_is_empty!7297 () Bool)

(assert (=> b!343708 (= e!210744 tp_is_empty!7297)))

(declare-fun b!343705 () Bool)

(declare-fun res!189998 () Bool)

(assert (=> b!343705 (=> (not res!189998) (not e!210741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!343705 (= res!189998 (validKeyInArray!0 k!1348))))

(declare-fun res!189999 () Bool)

(assert (=> start!34422 (=> (not res!189999) (not e!210741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34422 (= res!189999 (validMask!0 mask!2385))))

(assert (=> start!34422 e!210741))

(assert (=> start!34422 true))

(assert (=> start!34422 tp_is_empty!7297))

(assert (=> start!34422 tp!25581))

(declare-fun e!210742 () Bool)

(declare-fun array_inv!6378 (array!18189) Bool)

(assert (=> start!34422 (and (array_inv!6378 _values!1525) e!210742)))

(declare-fun array_inv!6379 (array!18187) Bool)

(assert (=> start!34422 (array_inv!6379 _keys!1895)))

(declare-fun b!343709 () Bool)

(assert (=> b!343709 (= e!210743 tp_is_empty!7297)))

(declare-fun b!343710 () Bool)

(declare-fun res!189996 () Bool)

(assert (=> b!343710 (=> (not res!189996) (not e!210741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18187 (_ BitVec 32)) Bool)

(assert (=> b!343710 (= res!189996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!343711 () Bool)

(assert (=> b!343711 (= e!210742 (and e!210744 mapRes!12384))))

(declare-fun condMapEmpty!12384 () Bool)

(declare-fun mapDefault!12384 () ValueCell!3305)

