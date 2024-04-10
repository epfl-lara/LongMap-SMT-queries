; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34166 () Bool)

(assert start!34166)

(declare-fun b_free!7189 () Bool)

(declare-fun b_next!7189 () Bool)

(assert (=> start!34166 (= b_free!7189 (not b_next!7189))))

(declare-fun tp!25100 () Bool)

(declare-fun b_and!14389 () Bool)

(assert (=> start!34166 (= tp!25100 b_and!14389)))

(declare-fun b!340462 () Bool)

(declare-fun res!188046 () Bool)

(declare-fun e!208862 () Bool)

(assert (=> b!340462 (=> (not res!188046) (not e!208862))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340462 (= res!188046 (validKeyInArray!0 k!1348))))

(declare-fun b!340463 () Bool)

(declare-fun res!188043 () Bool)

(assert (=> b!340463 (=> (not res!188043) (not e!208862))))

(declare-datatypes ((array!17887 0))(
  ( (array!17888 (arr!8464 (Array (_ BitVec 32) (_ BitVec 64))) (size!8816 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17887)

(declare-datatypes ((List!4866 0))(
  ( (Nil!4863) (Cons!4862 (h!5718 (_ BitVec 64)) (t!9974 List!4866)) )
))
(declare-fun arrayNoDuplicates!0 (array!17887 (_ BitVec 32) List!4866) Bool)

(assert (=> b!340463 (= res!188043 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4863))))

(declare-fun b!340464 () Bool)

(declare-fun e!208866 () Bool)

(assert (=> b!340464 (= e!208862 e!208866)))

(declare-fun res!188041 () Bool)

(assert (=> b!340464 (=> (not res!188041) (not e!208866))))

(declare-datatypes ((SeekEntryResult!3271 0))(
  ( (MissingZero!3271 (index!15263 (_ BitVec 32))) (Found!3271 (index!15264 (_ BitVec 32))) (Intermediate!3271 (undefined!4083 Bool) (index!15265 (_ BitVec 32)) (x!33913 (_ BitVec 32))) (Undefined!3271) (MissingVacant!3271 (index!15266 (_ BitVec 32))) )
))
(declare-fun lt!161593 () SeekEntryResult!3271)

(assert (=> b!340464 (= res!188041 (and (not (is-Found!3271 lt!161593)) (not (is-MissingZero!3271 lt!161593)) (is-MissingVacant!3271 lt!161593)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17887 (_ BitVec 32)) SeekEntryResult!3271)

(assert (=> b!340464 (= lt!161593 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!340465 () Bool)

(declare-fun e!208864 () Bool)

(declare-fun tp_is_empty!7141 () Bool)

(assert (=> b!340465 (= e!208864 tp_is_empty!7141)))

(declare-fun b!340466 () Bool)

(declare-fun res!188047 () Bool)

(assert (=> b!340466 (=> (not res!188047) (not e!208862))))

(declare-datatypes ((V!10499 0))(
  ( (V!10500 (val!3615 Int)) )
))
(declare-datatypes ((ValueCell!3227 0))(
  ( (ValueCellFull!3227 (v!5787 V!10499)) (EmptyCell!3227) )
))
(declare-datatypes ((array!17889 0))(
  ( (array!17890 (arr!8465 (Array (_ BitVec 32) ValueCell!3227)) (size!8817 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17889)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!340466 (= res!188047 (and (= (size!8817 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8816 _keys!1895) (size!8817 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!12138 () Bool)

(declare-fun mapRes!12138 () Bool)

(assert (=> mapIsEmpty!12138 mapRes!12138))

(declare-fun mapNonEmpty!12138 () Bool)

(declare-fun tp!25101 () Bool)

(declare-fun e!208865 () Bool)

(assert (=> mapNonEmpty!12138 (= mapRes!12138 (and tp!25101 e!208865))))

(declare-fun mapRest!12138 () (Array (_ BitVec 32) ValueCell!3227))

(declare-fun mapValue!12138 () ValueCell!3227)

(declare-fun mapKey!12138 () (_ BitVec 32))

(assert (=> mapNonEmpty!12138 (= (arr!8465 _values!1525) (store mapRest!12138 mapKey!12138 mapValue!12138))))

(declare-fun b!340467 () Bool)

(declare-fun res!188045 () Bool)

(assert (=> b!340467 (=> (not res!188045) (not e!208862))))

(declare-fun zeroValue!1467 () V!10499)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10499)

(declare-datatypes ((tuple2!5248 0))(
  ( (tuple2!5249 (_1!2635 (_ BitVec 64)) (_2!2635 V!10499)) )
))
(declare-datatypes ((List!4867 0))(
  ( (Nil!4864) (Cons!4863 (h!5719 tuple2!5248) (t!9975 List!4867)) )
))
(declare-datatypes ((ListLongMap!4161 0))(
  ( (ListLongMap!4162 (toList!2096 List!4867)) )
))
(declare-fun contains!2150 (ListLongMap!4161 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1617 (array!17887 array!17889 (_ BitVec 32) (_ BitVec 32) V!10499 V!10499 (_ BitVec 32) Int) ListLongMap!4161)

(assert (=> b!340467 (= res!188045 (not (contains!2150 (getCurrentListMap!1617 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!340468 () Bool)

(declare-fun res!188048 () Bool)

(assert (=> b!340468 (=> (not res!188048) (not e!208862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17887 (_ BitVec 32)) Bool)

(assert (=> b!340468 (= res!188048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!188042 () Bool)

(assert (=> start!34166 (=> (not res!188042) (not e!208862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34166 (= res!188042 (validMask!0 mask!2385))))

(assert (=> start!34166 e!208862))

(assert (=> start!34166 true))

(assert (=> start!34166 tp_is_empty!7141))

(assert (=> start!34166 tp!25100))

(declare-fun e!208861 () Bool)

(declare-fun array_inv!6270 (array!17889) Bool)

(assert (=> start!34166 (and (array_inv!6270 _values!1525) e!208861)))

(declare-fun array_inv!6271 (array!17887) Bool)

(assert (=> start!34166 (array_inv!6271 _keys!1895)))

(declare-fun b!340469 () Bool)

(assert (=> b!340469 (= e!208865 tp_is_empty!7141)))

(declare-fun b!340470 () Bool)

(declare-fun res!188044 () Bool)

(assert (=> b!340470 (=> (not res!188044) (not e!208866))))

(declare-fun arrayContainsKey!0 (array!17887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340470 (= res!188044 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340471 () Bool)

(assert (=> b!340471 (= e!208866 false)))

(declare-fun lt!161592 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17887 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340471 (= lt!161592 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340472 () Bool)

(assert (=> b!340472 (= e!208861 (and e!208864 mapRes!12138))))

(declare-fun condMapEmpty!12138 () Bool)

(declare-fun mapDefault!12138 () ValueCell!3227)

