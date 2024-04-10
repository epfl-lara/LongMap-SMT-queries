; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38942 () Bool)

(assert start!38942)

(declare-fun b!407561 () Bool)

(declare-fun res!235647 () Bool)

(declare-fun e!244754 () Bool)

(assert (=> b!407561 (=> (not res!235647) (not e!244754))))

(declare-datatypes ((array!24603 0))(
  ( (array!24604 (arr!11751 (Array (_ BitVec 32) (_ BitVec 64))) (size!12103 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24603)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407561 (= res!235647 (or (= (select (arr!11751 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11751 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407562 () Bool)

(declare-fun e!244758 () Bool)

(declare-fun tp_is_empty!10361 () Bool)

(assert (=> b!407562 (= e!244758 tp_is_empty!10361)))

(declare-fun b!407563 () Bool)

(declare-fun e!244757 () Bool)

(assert (=> b!407563 (= e!244757 false)))

(declare-fun lt!188663 () Bool)

(declare-fun lt!188662 () array!24603)

(declare-datatypes ((List!6816 0))(
  ( (Nil!6813) (Cons!6812 (h!7668 (_ BitVec 64)) (t!11990 List!6816)) )
))
(declare-fun arrayNoDuplicates!0 (array!24603 (_ BitVec 32) List!6816) Bool)

(assert (=> b!407563 (= lt!188663 (arrayNoDuplicates!0 lt!188662 #b00000000000000000000000000000000 Nil!6813))))

(declare-fun res!235643 () Bool)

(assert (=> start!38942 (=> (not res!235643) (not e!244754))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38942 (= res!235643 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12103 _keys!709))))))

(assert (=> start!38942 e!244754))

(assert (=> start!38942 true))

(declare-datatypes ((V!14919 0))(
  ( (V!14920 (val!5225 Int)) )
))
(declare-datatypes ((ValueCell!4837 0))(
  ( (ValueCellFull!4837 (v!7472 V!14919)) (EmptyCell!4837) )
))
(declare-datatypes ((array!24605 0))(
  ( (array!24606 (arr!11752 (Array (_ BitVec 32) ValueCell!4837)) (size!12104 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24605)

(declare-fun e!244755 () Bool)

(declare-fun array_inv!8574 (array!24605) Bool)

(assert (=> start!38942 (and (array_inv!8574 _values!549) e!244755)))

(declare-fun array_inv!8575 (array!24603) Bool)

(assert (=> start!38942 (array_inv!8575 _keys!709)))

(declare-fun b!407564 () Bool)

(declare-fun res!235644 () Bool)

(assert (=> b!407564 (=> (not res!235644) (not e!244754))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24603 (_ BitVec 32)) Bool)

(assert (=> b!407564 (= res!235644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407565 () Bool)

(declare-fun e!244756 () Bool)

(declare-fun mapRes!17163 () Bool)

(assert (=> b!407565 (= e!244755 (and e!244756 mapRes!17163))))

(declare-fun condMapEmpty!17163 () Bool)

(declare-fun mapDefault!17163 () ValueCell!4837)

