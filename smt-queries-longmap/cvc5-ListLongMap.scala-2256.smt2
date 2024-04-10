; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36998 () Bool)

(assert start!36998)

(declare-fun b_free!8125 () Bool)

(declare-fun b_next!8125 () Bool)

(assert (=> start!36998 (= b_free!8125 (not b_next!8125))))

(declare-fun tp!29090 () Bool)

(declare-fun b_and!15367 () Bool)

(assert (=> start!36998 (= tp!29090 b_and!15367)))

(declare-fun b!371477 () Bool)

(declare-fun res!208823 () Bool)

(declare-fun e!226738 () Bool)

(assert (=> b!371477 (=> (not res!208823) (not e!226738))))

(declare-datatypes ((array!21487 0))(
  ( (array!21488 (arr!10212 (Array (_ BitVec 32) (_ BitVec 64))) (size!10564 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21487)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371477 (= res!208823 (or (= (select (arr!10212 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10212 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371478 () Bool)

(declare-fun res!208826 () Bool)

(assert (=> b!371478 (=> (not res!208826) (not e!226738))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371478 (= res!208826 (validKeyInArray!0 k!778))))

(declare-fun b!371479 () Bool)

(declare-fun res!208820 () Bool)

(assert (=> b!371479 (=> (not res!208820) (not e!226738))))

(declare-fun arrayContainsKey!0 (array!21487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371479 (= res!208820 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!371480 () Bool)

(declare-fun res!208827 () Bool)

(assert (=> b!371480 (=> (not res!208827) (not e!226738))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12803 0))(
  ( (V!12804 (val!4431 Int)) )
))
(declare-datatypes ((ValueCell!4043 0))(
  ( (ValueCellFull!4043 (v!6628 V!12803)) (EmptyCell!4043) )
))
(declare-datatypes ((array!21489 0))(
  ( (array!21490 (arr!10213 (Array (_ BitVec 32) ValueCell!4043)) (size!10565 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21489)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371480 (= res!208827 (and (= (size!10565 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10564 _keys!658) (size!10565 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371481 () Bool)

(declare-fun e!226737 () Bool)

(assert (=> b!371481 (= e!226738 e!226737)))

(declare-fun res!208821 () Bool)

(assert (=> b!371481 (=> (not res!208821) (not e!226737))))

(declare-fun lt!170302 () array!21487)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21487 (_ BitVec 32)) Bool)

(assert (=> b!371481 (= res!208821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170302 mask!970))))

(assert (=> b!371481 (= lt!170302 (array!21488 (store (arr!10212 _keys!658) i!548 k!778) (size!10564 _keys!658)))))

(declare-fun b!371482 () Bool)

(declare-fun res!208822 () Bool)

(assert (=> b!371482 (=> (not res!208822) (not e!226737))))

(declare-datatypes ((List!5719 0))(
  ( (Nil!5716) (Cons!5715 (h!6571 (_ BitVec 64)) (t!10869 List!5719)) )
))
(declare-fun arrayNoDuplicates!0 (array!21487 (_ BitVec 32) List!5719) Bool)

(assert (=> b!371482 (= res!208822 (arrayNoDuplicates!0 lt!170302 #b00000000000000000000000000000000 Nil!5716))))

(declare-fun b!371483 () Bool)

(declare-fun res!208825 () Bool)

(assert (=> b!371483 (=> (not res!208825) (not e!226738))))

(assert (=> b!371483 (= res!208825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371484 () Bool)

(declare-fun e!226735 () Bool)

(declare-fun tp_is_empty!8773 () Bool)

(assert (=> b!371484 (= e!226735 tp_is_empty!8773)))

(declare-fun b!371485 () Bool)

(declare-fun e!226739 () Bool)

(declare-fun e!226736 () Bool)

(declare-fun mapRes!14724 () Bool)

(assert (=> b!371485 (= e!226739 (and e!226736 mapRes!14724))))

(declare-fun condMapEmpty!14724 () Bool)

(declare-fun mapDefault!14724 () ValueCell!4043)

