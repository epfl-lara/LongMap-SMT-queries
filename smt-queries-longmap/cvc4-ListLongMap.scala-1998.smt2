; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34920 () Bool)

(assert start!34920)

(declare-fun b_free!7661 () Bool)

(declare-fun b_next!7661 () Bool)

(assert (=> start!34920 (= b_free!7661 (not b_next!7661))))

(declare-fun tp!26555 () Bool)

(declare-fun b_and!14887 () Bool)

(assert (=> start!34920 (= tp!26555 b_and!14887)))

(declare-fun b!349788 () Bool)

(declare-fun res!193878 () Bool)

(declare-fun e!214261 () Bool)

(assert (=> b!349788 (=> (not res!193878) (not e!214261))))

(declare-datatypes ((SeekEntryResult!3433 0))(
  ( (MissingZero!3433 (index!15911 (_ BitVec 32))) (Found!3433 (index!15912 (_ BitVec 32))) (Intermediate!3433 (undefined!4245 Bool) (index!15913 (_ BitVec 32)) (x!34829 (_ BitVec 32))) (Undefined!3433) (MissingVacant!3433 (index!15914 (_ BitVec 32))) )
))
(declare-fun lt!164296 () SeekEntryResult!3433)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!349788 (= res!193878 (inRange!0 (index!15911 lt!164296) mask!2385))))

(declare-fun b!349789 () Bool)

(declare-fun res!193876 () Bool)

(declare-fun e!214263 () Bool)

(assert (=> b!349789 (=> (not res!193876) (not e!214263))))

(declare-datatypes ((array!18809 0))(
  ( (array!18810 (arr!8912 (Array (_ BitVec 32) (_ BitVec 64))) (size!9264 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18809 (_ BitVec 32)) Bool)

(assert (=> b!349789 (= res!193876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!349790 () Bool)

(declare-datatypes ((Unit!10835 0))(
  ( (Unit!10836) )
))
(declare-fun e!214258 () Unit!10835)

(declare-fun Unit!10837 () Unit!10835)

(assert (=> b!349790 (= e!214258 Unit!10837)))

(declare-fun b!349791 () Bool)

(declare-fun e!214262 () Bool)

(declare-fun e!214257 () Bool)

(declare-fun mapRes!12885 () Bool)

(assert (=> b!349791 (= e!214262 (and e!214257 mapRes!12885))))

(declare-fun condMapEmpty!12885 () Bool)

(declare-datatypes ((V!11127 0))(
  ( (V!11128 (val!3851 Int)) )
))
(declare-datatypes ((ValueCell!3463 0))(
  ( (ValueCellFull!3463 (v!6036 V!11127)) (EmptyCell!3463) )
))
(declare-datatypes ((array!18811 0))(
  ( (array!18812 (arr!8913 (Array (_ BitVec 32) ValueCell!3463)) (size!9265 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18811)

(declare-fun mapDefault!12885 () ValueCell!3463)

