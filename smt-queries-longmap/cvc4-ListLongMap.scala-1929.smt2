; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34224 () Bool)

(assert start!34224)

(declare-fun b_free!7247 () Bool)

(declare-fun b_next!7247 () Bool)

(assert (=> start!34224 (= b_free!7247 (not b_next!7247))))

(declare-fun tp!25275 () Bool)

(declare-fun b_and!14447 () Bool)

(assert (=> start!34224 (= tp!25275 b_and!14447)))

(declare-fun mapNonEmpty!12225 () Bool)

(declare-fun mapRes!12225 () Bool)

(declare-fun tp!25274 () Bool)

(declare-fun e!209387 () Bool)

(assert (=> mapNonEmpty!12225 (= mapRes!12225 (and tp!25274 e!209387))))

(declare-datatypes ((V!10575 0))(
  ( (V!10576 (val!3644 Int)) )
))
(declare-datatypes ((ValueCell!3256 0))(
  ( (ValueCellFull!3256 (v!5816 V!10575)) (EmptyCell!3256) )
))
(declare-fun mapRest!12225 () (Array (_ BitVec 32) ValueCell!3256))

(declare-fun mapValue!12225 () ValueCell!3256)

(declare-fun mapKey!12225 () (_ BitVec 32))

(declare-datatypes ((array!17993 0))(
  ( (array!17994 (arr!8517 (Array (_ BitVec 32) ValueCell!3256)) (size!8869 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17993)

(assert (=> mapNonEmpty!12225 (= (arr!8517 _values!1525) (store mapRest!12225 mapKey!12225 mapValue!12225))))

(declare-fun b!341419 () Bool)

(declare-fun res!188741 () Bool)

(declare-fun e!209384 () Bool)

(assert (=> b!341419 (=> (not res!188741) (not e!209384))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341419 (= res!188741 (validKeyInArray!0 k!1348))))

(declare-fun b!341420 () Bool)

(declare-fun e!209383 () Bool)

(assert (=> b!341420 (= e!209383 false)))

(declare-fun lt!161766 () (_ BitVec 32))

(declare-datatypes ((array!17995 0))(
  ( (array!17996 (arr!8518 (Array (_ BitVec 32) (_ BitVec 64))) (size!8870 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17995)

(declare-fun arrayScanForKey!0 (array!17995 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341420 (= lt!161766 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!341421 () Bool)

(declare-fun res!188738 () Bool)

(assert (=> b!341421 (=> (not res!188738) (not e!209384))))

(declare-datatypes ((List!4901 0))(
  ( (Nil!4898) (Cons!4897 (h!5753 (_ BitVec 64)) (t!10009 List!4901)) )
))
(declare-fun arrayNoDuplicates!0 (array!17995 (_ BitVec 32) List!4901) Bool)

(assert (=> b!341421 (= res!188738 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4898))))

(declare-fun b!341422 () Bool)

(declare-fun res!188743 () Bool)

(assert (=> b!341422 (=> (not res!188743) (not e!209383))))

(declare-fun arrayContainsKey!0 (array!17995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341422 (= res!188743 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!341423 () Bool)

(declare-fun tp_is_empty!7199 () Bool)

(assert (=> b!341423 (= e!209387 tp_is_empty!7199)))

(declare-fun b!341425 () Bool)

(assert (=> b!341425 (= e!209384 e!209383)))

(declare-fun res!188739 () Bool)

(assert (=> b!341425 (=> (not res!188739) (not e!209383))))

(declare-datatypes ((SeekEntryResult!3289 0))(
  ( (MissingZero!3289 (index!15335 (_ BitVec 32))) (Found!3289 (index!15336 (_ BitVec 32))) (Intermediate!3289 (undefined!4101 Bool) (index!15337 (_ BitVec 32)) (x!34003 (_ BitVec 32))) (Undefined!3289) (MissingVacant!3289 (index!15338 (_ BitVec 32))) )
))
(declare-fun lt!161767 () SeekEntryResult!3289)

(assert (=> b!341425 (= res!188739 (and (not (is-Found!3289 lt!161767)) (not (is-MissingZero!3289 lt!161767)) (is-MissingVacant!3289 lt!161767)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17995 (_ BitVec 32)) SeekEntryResult!3289)

(assert (=> b!341425 (= lt!161767 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!341426 () Bool)

(declare-fun res!188740 () Bool)

(assert (=> b!341426 (=> (not res!188740) (not e!209384))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341426 (= res!188740 (and (= (size!8869 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8870 _keys!1895) (size!8869 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341427 () Bool)

(declare-fun e!209385 () Bool)

(declare-fun e!209386 () Bool)

(assert (=> b!341427 (= e!209385 (and e!209386 mapRes!12225))))

(declare-fun condMapEmpty!12225 () Bool)

(declare-fun mapDefault!12225 () ValueCell!3256)

