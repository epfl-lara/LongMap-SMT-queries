; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39178 () Bool)

(assert start!39178)

(declare-fun b_free!9445 () Bool)

(declare-fun b_next!9445 () Bool)

(assert (=> start!39178 (= b_free!9445 (not b_next!9445))))

(declare-fun tp!33863 () Bool)

(declare-fun b_and!16831 () Bool)

(assert (=> start!39178 (= tp!33863 b_and!16831)))

(declare-fun b!412617 () Bool)

(declare-fun res!239636 () Bool)

(declare-fun e!246879 () Bool)

(assert (=> b!412617 (=> (not res!239636) (not e!246879))))

(declare-datatypes ((array!25055 0))(
  ( (array!25056 (arr!11977 (Array (_ BitVec 32) (_ BitVec 64))) (size!12329 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25055)

(declare-datatypes ((List!6962 0))(
  ( (Nil!6959) (Cons!6958 (h!7814 (_ BitVec 64)) (t!12136 List!6962)) )
))
(declare-fun arrayNoDuplicates!0 (array!25055 (_ BitVec 32) List!6962) Bool)

(assert (=> b!412617 (= res!239636 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6959))))

(declare-fun b!412618 () Bool)

(declare-fun res!239638 () Bool)

(assert (=> b!412618 (=> (not res!239638) (not e!246879))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412618 (= res!239638 (validKeyInArray!0 k!794))))

(declare-fun b!412619 () Bool)

(declare-fun res!239632 () Bool)

(assert (=> b!412619 (=> (not res!239632) (not e!246879))))

(declare-fun arrayContainsKey!0 (array!25055 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412619 (= res!239632 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!412620 () Bool)

(declare-fun e!246877 () Bool)

(declare-fun tp_is_empty!10597 () Bool)

(assert (=> b!412620 (= e!246877 tp_is_empty!10597)))

(declare-fun b!412621 () Bool)

(declare-fun e!246882 () Bool)

(assert (=> b!412621 (= e!246882 tp_is_empty!10597)))

(declare-fun b!412622 () Bool)

(declare-fun res!239633 () Bool)

(assert (=> b!412622 (=> (not res!239633) (not e!246879))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412622 (= res!239633 (or (= (select (arr!11977 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11977 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412623 () Bool)

(declare-fun e!246881 () Bool)

(declare-fun mapRes!17517 () Bool)

(assert (=> b!412623 (= e!246881 (and e!246877 mapRes!17517))))

(declare-fun condMapEmpty!17517 () Bool)

(declare-datatypes ((V!15235 0))(
  ( (V!15236 (val!5343 Int)) )
))
(declare-datatypes ((ValueCell!4955 0))(
  ( (ValueCellFull!4955 (v!7590 V!15235)) (EmptyCell!4955) )
))
(declare-datatypes ((array!25057 0))(
  ( (array!25058 (arr!11978 (Array (_ BitVec 32) ValueCell!4955)) (size!12330 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25057)

(declare-fun mapDefault!17517 () ValueCell!4955)

