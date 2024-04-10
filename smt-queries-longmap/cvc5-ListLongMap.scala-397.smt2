; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7422 () Bool)

(assert start!7422)

(declare-fun mapIsEmpty!2132 () Bool)

(declare-fun mapRes!2132 () Bool)

(assert (=> mapIsEmpty!2132 mapRes!2132))

(declare-fun b!47721 () Bool)

(declare-fun e!30587 () Bool)

(declare-fun call!3727 () Bool)

(assert (=> b!47721 (= e!30587 (not call!3727))))

(declare-fun b!47722 () Bool)

(declare-fun e!30588 () Bool)

(declare-fun call!3726 () Bool)

(assert (=> b!47722 (= e!30588 (not call!3726))))

(declare-fun b!47723 () Bool)

(assert (=> b!47723 (= e!30587 e!30588)))

(declare-fun c!6413 () Bool)

(declare-datatypes ((SeekEntryResult!209 0))(
  ( (MissingZero!209 (index!2958 (_ BitVec 32))) (Found!209 (index!2959 (_ BitVec 32))) (Intermediate!209 (undefined!1021 Bool) (index!2960 (_ BitVec 32)) (x!8789 (_ BitVec 32))) (Undefined!209) (MissingVacant!209 (index!2961 (_ BitVec 32))) )
))
(declare-fun lt!20450 () SeekEntryResult!209)

(assert (=> b!47723 (= c!6413 (is-MissingVacant!209 lt!20450))))

(declare-fun b!47724 () Bool)

(declare-fun e!30595 () Bool)

(declare-fun e!30589 () Bool)

(assert (=> b!47724 (= e!30595 (and e!30589 mapRes!2132))))

(declare-fun condMapEmpty!2132 () Bool)

(declare-datatypes ((V!2479 0))(
  ( (V!2480 (val!1068 Int)) )
))
(declare-datatypes ((ValueCell!740 0))(
  ( (ValueCellFull!740 (v!2129 V!2479)) (EmptyCell!740) )
))
(declare-datatypes ((array!3181 0))(
  ( (array!3182 (arr!1525 (Array (_ BitVec 32) ValueCell!740)) (size!1747 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3181)

(declare-fun mapDefault!2132 () ValueCell!740)

