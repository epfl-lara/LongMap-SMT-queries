; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34078 () Bool)

(assert start!34078)

(declare-fun b_free!7157 () Bool)

(declare-fun b_next!7157 () Bool)

(assert (=> start!34078 (= b_free!7157 (not b_next!7157))))

(declare-fun tp!24996 () Bool)

(declare-fun b_and!14351 () Bool)

(assert (=> start!34078 (= tp!24996 b_and!14351)))

(declare-fun b!339618 () Bool)

(declare-fun e!208360 () Bool)

(assert (=> b!339618 (= e!208360 false)))

(declare-datatypes ((Unit!10590 0))(
  ( (Unit!10591) )
))
(declare-fun lt!161253 () Unit!10590)

(declare-fun e!208364 () Unit!10590)

(assert (=> b!339618 (= lt!161253 e!208364)))

(declare-fun c!52575 () Bool)

(declare-datatypes ((array!17817 0))(
  ( (array!17818 (arr!8432 (Array (_ BitVec 32) (_ BitVec 64))) (size!8784 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17817)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!339618 (= c!52575 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!339619 () Bool)

(declare-fun Unit!10592 () Unit!10590)

(assert (=> b!339619 (= e!208364 Unit!10592)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10455 0))(
  ( (V!10456 (val!3599 Int)) )
))
(declare-fun zeroValue!1467 () V!10455)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3211 0))(
  ( (ValueCellFull!3211 (v!5768 V!10455)) (EmptyCell!3211) )
))
(declare-datatypes ((array!17819 0))(
  ( (array!17820 (arr!8433 (Array (_ BitVec 32) ValueCell!3211)) (size!8785 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17819)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10455)

(declare-fun lt!161254 () Unit!10590)

(declare-fun lemmaArrayContainsKeyThenInListMap!289 (array!17817 array!17819 (_ BitVec 32) (_ BitVec 32) V!10455 V!10455 (_ BitVec 64) (_ BitVec 32) Int) Unit!10590)

(declare-fun arrayScanForKey!0 (array!17817 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!339619 (= lt!161254 (lemmaArrayContainsKeyThenInListMap!289 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!339619 false))

(declare-fun mapIsEmpty!12081 () Bool)

(declare-fun mapRes!12081 () Bool)

(assert (=> mapIsEmpty!12081 mapRes!12081))

(declare-fun b!339620 () Bool)

(declare-fun e!208363 () Bool)

(declare-fun tp_is_empty!7109 () Bool)

(assert (=> b!339620 (= e!208363 tp_is_empty!7109)))

(declare-fun b!339621 () Bool)

(declare-fun res!187593 () Bool)

(declare-fun e!208361 () Bool)

(assert (=> b!339621 (=> (not res!187593) (not e!208361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17817 (_ BitVec 32)) Bool)

(assert (=> b!339621 (= res!187593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!339622 () Bool)

(declare-fun res!187594 () Bool)

(assert (=> b!339622 (=> (not res!187594) (not e!208361))))

(declare-datatypes ((List!4846 0))(
  ( (Nil!4843) (Cons!4842 (h!5698 (_ BitVec 64)) (t!9948 List!4846)) )
))
(declare-fun arrayNoDuplicates!0 (array!17817 (_ BitVec 32) List!4846) Bool)

(assert (=> b!339622 (= res!187594 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4843))))

(declare-fun b!339623 () Bool)

(declare-fun e!208362 () Bool)

(assert (=> b!339623 (= e!208362 tp_is_empty!7109)))

(declare-fun b!339624 () Bool)

(declare-fun e!208359 () Bool)

(assert (=> b!339624 (= e!208359 (and e!208362 mapRes!12081))))

(declare-fun condMapEmpty!12081 () Bool)

(declare-fun mapDefault!12081 () ValueCell!3211)

