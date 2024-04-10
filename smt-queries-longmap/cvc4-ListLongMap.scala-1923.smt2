; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34188 () Bool)

(assert start!34188)

(declare-fun b_free!7211 () Bool)

(declare-fun b_next!7211 () Bool)

(assert (=> start!34188 (= b_free!7211 (not b_next!7211))))

(declare-fun tp!25166 () Bool)

(declare-fun b_and!14411 () Bool)

(assert (=> start!34188 (= tp!25166 b_and!14411)))

(declare-fun b!340825 () Bool)

(declare-fun res!188311 () Bool)

(declare-fun e!209063 () Bool)

(assert (=> b!340825 (=> (not res!188311) (not e!209063))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!340825 (= res!188311 (validKeyInArray!0 k!1348))))

(declare-fun mapNonEmpty!12171 () Bool)

(declare-fun mapRes!12171 () Bool)

(declare-fun tp!25167 () Bool)

(declare-fun e!209064 () Bool)

(assert (=> mapNonEmpty!12171 (= mapRes!12171 (and tp!25167 e!209064))))

(declare-datatypes ((V!10527 0))(
  ( (V!10528 (val!3626 Int)) )
))
(declare-datatypes ((ValueCell!3238 0))(
  ( (ValueCellFull!3238 (v!5798 V!10527)) (EmptyCell!3238) )
))
(declare-fun mapValue!12171 () ValueCell!3238)

(declare-fun mapKey!12171 () (_ BitVec 32))

(declare-fun mapRest!12171 () (Array (_ BitVec 32) ValueCell!3238))

(declare-datatypes ((array!17927 0))(
  ( (array!17928 (arr!8484 (Array (_ BitVec 32) ValueCell!3238)) (size!8836 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17927)

(assert (=> mapNonEmpty!12171 (= (arr!8484 _values!1525) (store mapRest!12171 mapKey!12171 mapValue!12171))))

(declare-fun b!340827 () Bool)

(declare-fun e!209062 () Bool)

(assert (=> b!340827 (= e!209063 e!209062)))

(declare-fun res!188307 () Bool)

(assert (=> b!340827 (=> (not res!188307) (not e!209062))))

(declare-datatypes ((SeekEntryResult!3278 0))(
  ( (MissingZero!3278 (index!15291 (_ BitVec 32))) (Found!3278 (index!15292 (_ BitVec 32))) (Intermediate!3278 (undefined!4090 Bool) (index!15293 (_ BitVec 32)) (x!33944 (_ BitVec 32))) (Undefined!3278) (MissingVacant!3278 (index!15294 (_ BitVec 32))) )
))
(declare-fun lt!161658 () SeekEntryResult!3278)

(assert (=> b!340827 (= res!188307 (and (not (is-Found!3278 lt!161658)) (not (is-MissingZero!3278 lt!161658)) (is-MissingVacant!3278 lt!161658)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((array!17929 0))(
  ( (array!17930 (arr!8485 (Array (_ BitVec 32) (_ BitVec 64))) (size!8837 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17929)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17929 (_ BitVec 32)) SeekEntryResult!3278)

(assert (=> b!340827 (= lt!161658 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12171 () Bool)

(assert (=> mapIsEmpty!12171 mapRes!12171))

(declare-fun b!340828 () Bool)

(declare-fun res!188312 () Bool)

(assert (=> b!340828 (=> (not res!188312) (not e!209063))))

(declare-datatypes ((List!4881 0))(
  ( (Nil!4878) (Cons!4877 (h!5733 (_ BitVec 64)) (t!9989 List!4881)) )
))
(declare-fun arrayNoDuplicates!0 (array!17929 (_ BitVec 32) List!4881) Bool)

(assert (=> b!340828 (= res!188312 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4878))))

(declare-fun b!340829 () Bool)

(declare-fun e!209061 () Bool)

(declare-fun e!209060 () Bool)

(assert (=> b!340829 (= e!209061 (and e!209060 mapRes!12171))))

(declare-fun condMapEmpty!12171 () Bool)

(declare-fun mapDefault!12171 () ValueCell!3238)

