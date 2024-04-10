; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39022 () Bool)

(assert start!39022)

(declare-fun b!409121 () Bool)

(declare-fun res!236843 () Bool)

(declare-fun e!245474 () Bool)

(assert (=> b!409121 (=> (not res!236843) (not e!245474))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409121 (= res!236843 (validMask!0 mask!1025))))

(declare-fun b!409122 () Bool)

(declare-fun e!245475 () Bool)

(assert (=> b!409122 (= e!245475 false)))

(declare-fun lt!188902 () Bool)

(declare-datatypes ((array!24755 0))(
  ( (array!24756 (arr!11827 (Array (_ BitVec 32) (_ BitVec 64))) (size!12179 (_ BitVec 32))) )
))
(declare-fun lt!188903 () array!24755)

(declare-datatypes ((List!6846 0))(
  ( (Nil!6843) (Cons!6842 (h!7698 (_ BitVec 64)) (t!12020 List!6846)) )
))
(declare-fun arrayNoDuplicates!0 (array!24755 (_ BitVec 32) List!6846) Bool)

(assert (=> b!409122 (= lt!188902 (arrayNoDuplicates!0 lt!188903 #b00000000000000000000000000000000 Nil!6843))))

(declare-fun b!409123 () Bool)

(declare-fun res!236847 () Bool)

(assert (=> b!409123 (=> (not res!236847) (not e!245474))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409123 (= res!236847 (validKeyInArray!0 k!794))))

(declare-fun res!236846 () Bool)

(assert (=> start!39022 (=> (not res!236846) (not e!245474))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!24755)

(assert (=> start!39022 (= res!236846 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12179 _keys!709))))))

(assert (=> start!39022 e!245474))

(assert (=> start!39022 true))

(declare-datatypes ((V!15027 0))(
  ( (V!15028 (val!5265 Int)) )
))
(declare-datatypes ((ValueCell!4877 0))(
  ( (ValueCellFull!4877 (v!7512 V!15027)) (EmptyCell!4877) )
))
(declare-datatypes ((array!24757 0))(
  ( (array!24758 (arr!11828 (Array (_ BitVec 32) ValueCell!4877)) (size!12180 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24757)

(declare-fun e!245478 () Bool)

(declare-fun array_inv!8630 (array!24757) Bool)

(assert (=> start!39022 (and (array_inv!8630 _values!549) e!245478)))

(declare-fun array_inv!8631 (array!24755) Bool)

(assert (=> start!39022 (array_inv!8631 _keys!709)))

(declare-fun b!409124 () Bool)

(declare-fun e!245473 () Bool)

(declare-fun mapRes!17283 () Bool)

(assert (=> b!409124 (= e!245478 (and e!245473 mapRes!17283))))

(declare-fun condMapEmpty!17283 () Bool)

(declare-fun mapDefault!17283 () ValueCell!4877)

