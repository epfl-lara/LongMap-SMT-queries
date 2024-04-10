; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84896 () Bool)

(assert start!84896)

(declare-fun b!992085 () Bool)

(declare-fun e!559613 () Bool)

(declare-datatypes ((SeekEntryResult!9220 0))(
  ( (MissingZero!9220 (index!39251 (_ BitVec 32))) (Found!9220 (index!39252 (_ BitVec 32))) (Intermediate!9220 (undefined!10032 Bool) (index!39253 (_ BitVec 32)) (x!86333 (_ BitVec 32))) (Undefined!9220) (MissingVacant!9220 (index!39254 (_ BitVec 32))) )
))
(declare-fun lt!440050 () SeekEntryResult!9220)

(declare-fun mask!2471 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!992085 (= e!559613 (not (inRange!0 (index!39252 lt!440050) mask!2471)))))

(declare-fun b!992086 () Bool)

(declare-fun e!559615 () Bool)

(declare-fun e!559616 () Bool)

(declare-fun mapRes!37134 () Bool)

(assert (=> b!992086 (= e!559615 (and e!559616 mapRes!37134))))

(declare-fun condMapEmpty!37134 () Bool)

(declare-datatypes ((V!36149 0))(
  ( (V!36150 (val!11738 Int)) )
))
(declare-datatypes ((ValueCell!11206 0))(
  ( (ValueCellFull!11206 (v!14315 V!36149)) (EmptyCell!11206) )
))
(declare-datatypes ((array!62719 0))(
  ( (array!62720 (arr!30204 (Array (_ BitVec 32) ValueCell!11206)) (size!30683 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62719)

(declare-fun mapDefault!37134 () ValueCell!11206)

