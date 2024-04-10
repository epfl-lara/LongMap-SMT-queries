; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38566 () Bool)

(assert start!38566)

(declare-fun b_free!9103 () Bool)

(declare-fun b_next!9103 () Bool)

(assert (=> start!38566 (= b_free!9103 (not b_next!9103))))

(declare-fun tp!32433 () Bool)

(declare-fun b_and!16489 () Bool)

(assert (=> start!38566 (= tp!32433 b_and!16489)))

(declare-fun b!399085 () Bool)

(declare-fun res!229434 () Bool)

(declare-fun e!241085 () Bool)

(assert (=> b!399085 (=> (not res!229434) (not e!241085))))

(declare-datatypes ((array!23881 0))(
  ( (array!23882 (arr!11390 (Array (_ BitVec 32) (_ BitVec 64))) (size!11742 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23881)

(declare-datatypes ((List!6592 0))(
  ( (Nil!6589) (Cons!6588 (h!7444 (_ BitVec 64)) (t!11766 List!6592)) )
))
(declare-fun arrayNoDuplicates!0 (array!23881 (_ BitVec 32) List!6592) Bool)

(assert (=> b!399085 (= res!229434 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6589))))

(declare-fun b!399086 () Bool)

(declare-fun res!229431 () Bool)

(assert (=> b!399086 (=> (not res!229431) (not e!241085))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399086 (= res!229431 (validKeyInArray!0 k!794))))

(declare-fun b!399087 () Bool)

(declare-fun res!229435 () Bool)

(assert (=> b!399087 (=> (not res!229435) (not e!241085))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23881 (_ BitVec 32)) Bool)

(assert (=> b!399087 (= res!229435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399088 () Bool)

(declare-fun e!241084 () Bool)

(declare-fun e!241083 () Bool)

(declare-fun mapRes!16599 () Bool)

(assert (=> b!399088 (= e!241084 (and e!241083 mapRes!16599))))

(declare-fun condMapEmpty!16599 () Bool)

(declare-datatypes ((V!14419 0))(
  ( (V!14420 (val!5037 Int)) )
))
(declare-datatypes ((ValueCell!4649 0))(
  ( (ValueCellFull!4649 (v!7284 V!14419)) (EmptyCell!4649) )
))
(declare-datatypes ((array!23883 0))(
  ( (array!23884 (arr!11391 (Array (_ BitVec 32) ValueCell!4649)) (size!11743 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23883)

(declare-fun mapDefault!16599 () ValueCell!4649)

