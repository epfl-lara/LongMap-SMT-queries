; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34530 () Bool)

(assert start!34530)

(declare-fun b_free!7453 () Bool)

(declare-fun b_next!7453 () Bool)

(assert (=> start!34530 (= b_free!7453 (not b_next!7453))))

(declare-fun tp!25905 () Bool)

(declare-fun b_and!14661 () Bool)

(assert (=> start!34530 (= tp!25905 b_and!14661)))

(declare-fun b!345163 () Bool)

(declare-fun res!190971 () Bool)

(declare-fun e!211553 () Bool)

(assert (=> b!345163 (=> (not res!190971) (not e!211553))))

(declare-datatypes ((array!18393 0))(
  ( (array!18394 (arr!8713 (Array (_ BitVec 32) (_ BitVec 64))) (size!9065 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18393)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18393 (_ BitVec 32)) Bool)

(assert (=> b!345163 (= res!190971 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!190968 () Bool)

(assert (=> start!34530 (=> (not res!190968) (not e!211553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34530 (= res!190968 (validMask!0 mask!2385))))

(assert (=> start!34530 e!211553))

(assert (=> start!34530 true))

(declare-fun tp_is_empty!7405 () Bool)

(assert (=> start!34530 tp_is_empty!7405))

(assert (=> start!34530 tp!25905))

(declare-datatypes ((V!10851 0))(
  ( (V!10852 (val!3747 Int)) )
))
(declare-datatypes ((ValueCell!3359 0))(
  ( (ValueCellFull!3359 (v!5923 V!10851)) (EmptyCell!3359) )
))
(declare-datatypes ((array!18395 0))(
  ( (array!18396 (arr!8714 (Array (_ BitVec 32) ValueCell!3359)) (size!9066 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18395)

(declare-fun e!211551 () Bool)

(declare-fun array_inv!6446 (array!18395) Bool)

(assert (=> start!34530 (and (array_inv!6446 _values!1525) e!211551)))

(declare-fun array_inv!6447 (array!18393) Bool)

(assert (=> start!34530 (array_inv!6447 _keys!1895)))

(declare-fun b!345164 () Bool)

(declare-fun res!190970 () Bool)

(assert (=> b!345164 (=> (not res!190970) (not e!211553))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!345164 (= res!190970 (validKeyInArray!0 k!1348))))

(declare-fun b!345165 () Bool)

(declare-datatypes ((SeekEntryResult!3358 0))(
  ( (MissingZero!3358 (index!15611 (_ BitVec 32))) (Found!3358 (index!15612 (_ BitVec 32))) (Intermediate!3358 (undefined!4170 Bool) (index!15613 (_ BitVec 32)) (x!34392 (_ BitVec 32))) (Undefined!3358) (MissingVacant!3358 (index!15614 (_ BitVec 32))) )
))
(declare-fun lt!162754 () SeekEntryResult!3358)

(assert (=> b!345165 (= e!211553 (and (is-Found!3358 lt!162754) (not (= (select (arr!8713 _keys!1895) (index!15612 lt!162754)) k!1348))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18393 (_ BitVec 32)) SeekEntryResult!3358)

(assert (=> b!345165 (= lt!162754 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!345166 () Bool)

(declare-fun res!190972 () Bool)

(assert (=> b!345166 (=> (not res!190972) (not e!211553))))

(declare-datatypes ((List!5039 0))(
  ( (Nil!5036) (Cons!5035 (h!5891 (_ BitVec 64)) (t!10155 List!5039)) )
))
(declare-fun arrayNoDuplicates!0 (array!18393 (_ BitVec 32) List!5039) Bool)

(assert (=> b!345166 (= res!190972 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5036))))

(declare-fun b!345167 () Bool)

(declare-fun e!211550 () Bool)

(declare-fun mapRes!12546 () Bool)

(assert (=> b!345167 (= e!211551 (and e!211550 mapRes!12546))))

(declare-fun condMapEmpty!12546 () Bool)

(declare-fun mapDefault!12546 () ValueCell!3359)

