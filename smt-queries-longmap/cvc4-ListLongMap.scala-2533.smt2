; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39020 () Bool)

(assert start!39020)

(declare-fun b!409082 () Bool)

(declare-fun res!236811 () Bool)

(declare-fun e!245459 () Bool)

(assert (=> b!409082 (=> (not res!236811) (not e!245459))))

(declare-datatypes ((array!24751 0))(
  ( (array!24752 (arr!11825 (Array (_ BitVec 32) (_ BitVec 64))) (size!12177 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24751)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409082 (= res!236811 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!409083 () Bool)

(declare-fun res!236808 () Bool)

(assert (=> b!409083 (=> (not res!236808) (not e!245459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409083 (= res!236808 (validKeyInArray!0 k!794))))

(declare-fun b!409084 () Bool)

(declare-fun res!236814 () Bool)

(assert (=> b!409084 (=> (not res!236814) (not e!245459))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15023 0))(
  ( (V!15024 (val!5264 Int)) )
))
(declare-datatypes ((ValueCell!4876 0))(
  ( (ValueCellFull!4876 (v!7511 V!15023)) (EmptyCell!4876) )
))
(declare-datatypes ((array!24753 0))(
  ( (array!24754 (arr!11826 (Array (_ BitVec 32) ValueCell!4876)) (size!12178 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24753)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409084 (= res!236814 (and (= (size!12178 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12177 _keys!709) (size!12178 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409085 () Bool)

(declare-fun e!245457 () Bool)

(declare-fun e!245458 () Bool)

(declare-fun mapRes!17280 () Bool)

(assert (=> b!409085 (= e!245457 (and e!245458 mapRes!17280))))

(declare-fun condMapEmpty!17280 () Bool)

(declare-fun mapDefault!17280 () ValueCell!4876)

