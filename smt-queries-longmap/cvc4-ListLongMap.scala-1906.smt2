; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33978 () Bool)

(assert start!33978)

(declare-fun b_free!7109 () Bool)

(declare-fun b_next!7109 () Bool)

(assert (=> start!33978 (= b_free!7109 (not b_next!7109))))

(declare-fun tp!24846 () Bool)

(declare-fun b_and!14299 () Bool)

(assert (=> start!33978 (= tp!24846 b_and!14299)))

(declare-fun b!338440 () Bool)

(declare-fun e!207663 () Bool)

(assert (=> b!338440 (= e!207663 false)))

(declare-datatypes ((Unit!10512 0))(
  ( (Unit!10513) )
))
(declare-fun lt!160806 () Unit!10512)

(declare-fun e!207662 () Unit!10512)

(assert (=> b!338440 (= lt!160806 e!207662)))

(declare-fun c!52425 () Bool)

(declare-datatypes ((array!17717 0))(
  ( (array!17718 (arr!8384 (Array (_ BitVec 32) (_ BitVec 64))) (size!8736 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17717)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17717 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338440 (= c!52425 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338441 () Bool)

(declare-fun e!207657 () Bool)

(declare-fun tp_is_empty!7061 () Bool)

(assert (=> b!338441 (= e!207657 tp_is_empty!7061)))

(declare-fun mapIsEmpty!12003 () Bool)

(declare-fun mapRes!12003 () Bool)

(assert (=> mapIsEmpty!12003 mapRes!12003))

(declare-fun b!338442 () Bool)

(declare-fun Unit!10514 () Unit!10512)

(assert (=> b!338442 (= e!207662 Unit!10514)))

(declare-fun b!338443 () Bool)

(declare-fun e!207660 () Bool)

(assert (=> b!338443 (= e!207660 e!207663)))

(declare-fun res!186950 () Bool)

(assert (=> b!338443 (=> (not res!186950) (not e!207663))))

(declare-datatypes ((SeekEntryResult!3237 0))(
  ( (MissingZero!3237 (index!15127 (_ BitVec 32))) (Found!3237 (index!15128 (_ BitVec 32))) (Intermediate!3237 (undefined!4049 Bool) (index!15129 (_ BitVec 32)) (x!33717 (_ BitVec 32))) (Undefined!3237) (MissingVacant!3237 (index!15130 (_ BitVec 32))) )
))
(declare-fun lt!160805 () SeekEntryResult!3237)

(assert (=> b!338443 (= res!186950 (and (not (is-Found!3237 lt!160805)) (is-MissingZero!3237 lt!160805)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17717 (_ BitVec 32)) SeekEntryResult!3237)

(assert (=> b!338443 (= lt!160805 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338444 () Bool)

(declare-fun e!207659 () Bool)

(assert (=> b!338444 (= e!207659 tp_is_empty!7061)))

(declare-fun b!338445 () Bool)

(declare-fun e!207658 () Bool)

(assert (=> b!338445 (= e!207658 (and e!207659 mapRes!12003))))

(declare-fun condMapEmpty!12003 () Bool)

(declare-datatypes ((V!10391 0))(
  ( (V!10392 (val!3575 Int)) )
))
(declare-datatypes ((ValueCell!3187 0))(
  ( (ValueCellFull!3187 (v!5742 V!10391)) (EmptyCell!3187) )
))
(declare-datatypes ((array!17719 0))(
  ( (array!17720 (arr!8385 (Array (_ BitVec 32) ValueCell!3187)) (size!8737 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17719)

(declare-fun mapDefault!12003 () ValueCell!3187)

