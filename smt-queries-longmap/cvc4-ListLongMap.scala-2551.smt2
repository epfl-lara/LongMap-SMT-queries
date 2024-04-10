; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39128 () Bool)

(assert start!39128)

(declare-fun b_free!9395 () Bool)

(declare-fun b_next!9395 () Bool)

(assert (=> start!39128 (= b_free!9395 (not b_next!9395))))

(declare-fun tp!33714 () Bool)

(declare-fun b_and!16781 () Bool)

(assert (=> start!39128 (= tp!33714 b_and!16781)))

(declare-fun b!411492 () Bool)

(declare-fun e!246432 () Bool)

(declare-fun e!246430 () Bool)

(assert (=> b!411492 (= e!246432 e!246430)))

(declare-fun res!238732 () Bool)

(assert (=> b!411492 (=> (not res!238732) (not e!246430))))

(declare-datatypes ((array!24955 0))(
  ( (array!24956 (arr!11927 (Array (_ BitVec 32) (_ BitVec 64))) (size!12279 (_ BitVec 32))) )
))
(declare-fun lt!189291 () array!24955)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24955 (_ BitVec 32)) Bool)

(assert (=> b!411492 (= res!238732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189291 mask!1025))))

(declare-fun _keys!709 () array!24955)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411492 (= lt!189291 (array!24956 (store (arr!11927 _keys!709) i!563 k!794) (size!12279 _keys!709)))))

(declare-fun b!411493 () Bool)

(declare-fun res!238735 () Bool)

(assert (=> b!411493 (=> (not res!238735) (not e!246432))))

(assert (=> b!411493 (= res!238735 (or (= (select (arr!11927 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11927 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17442 () Bool)

(declare-fun mapRes!17442 () Bool)

(declare-fun tp!33713 () Bool)

(declare-fun e!246431 () Bool)

(assert (=> mapNonEmpty!17442 (= mapRes!17442 (and tp!33713 e!246431))))

(declare-datatypes ((V!15167 0))(
  ( (V!15168 (val!5318 Int)) )
))
(declare-datatypes ((ValueCell!4930 0))(
  ( (ValueCellFull!4930 (v!7565 V!15167)) (EmptyCell!4930) )
))
(declare-fun mapRest!17442 () (Array (_ BitVec 32) ValueCell!4930))

(declare-fun mapKey!17442 () (_ BitVec 32))

(declare-datatypes ((array!24957 0))(
  ( (array!24958 (arr!11928 (Array (_ BitVec 32) ValueCell!4930)) (size!12280 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24957)

(declare-fun mapValue!17442 () ValueCell!4930)

(assert (=> mapNonEmpty!17442 (= (arr!11928 _values!549) (store mapRest!17442 mapKey!17442 mapValue!17442))))

(declare-fun b!411494 () Bool)

(declare-fun res!238740 () Bool)

(assert (=> b!411494 (=> (not res!238740) (not e!246432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411494 (= res!238740 (validMask!0 mask!1025))))

(declare-fun b!411495 () Bool)

(declare-fun res!238734 () Bool)

(assert (=> b!411495 (=> (not res!238734) (not e!246432))))

(assert (=> b!411495 (= res!238734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411496 () Bool)

(declare-fun res!238743 () Bool)

(assert (=> b!411496 (=> (not res!238743) (not e!246432))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411496 (= res!238743 (validKeyInArray!0 k!794))))

(declare-fun b!411497 () Bool)

(declare-fun e!246428 () Bool)

(declare-fun e!246427 () Bool)

(assert (=> b!411497 (= e!246428 (and e!246427 mapRes!17442))))

(declare-fun condMapEmpty!17442 () Bool)

(declare-fun mapDefault!17442 () ValueCell!4930)

