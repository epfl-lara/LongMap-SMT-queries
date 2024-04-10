; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35318 () Bool)

(assert start!35318)

(declare-fun b!353756 () Bool)

(declare-fun res!196120 () Bool)

(declare-fun e!216697 () Bool)

(assert (=> b!353756 (=> (not res!196120) (not e!216697))))

(declare-datatypes ((array!19183 0))(
  ( (array!19184 (arr!9087 (Array (_ BitVec 32) (_ BitVec 64))) (size!9439 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19183)

(assert (=> b!353756 (= res!196120 (and (bvsle #b00000000000000000000000000000000 (size!9439 _keys!1456)) (bvslt (size!9439 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353757 () Bool)

(declare-fun e!216695 () Bool)

(declare-fun tp_is_empty!7795 () Bool)

(assert (=> b!353757 (= e!216695 tp_is_empty!7795)))

(declare-fun b!353758 () Bool)

(declare-fun e!216694 () Bool)

(assert (=> b!353758 (= e!216697 e!216694)))

(declare-fun res!196117 () Bool)

(assert (=> b!353758 (=> res!196117 e!216694)))

(declare-datatypes ((List!5280 0))(
  ( (Nil!5277) (Cons!5276 (h!6132 (_ BitVec 64)) (t!10430 List!5280)) )
))
(declare-fun contains!2378 (List!5280 (_ BitVec 64)) Bool)

(assert (=> b!353758 (= res!196117 (contains!2378 Nil!5277 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!353759 () Bool)

(declare-fun e!216696 () Bool)

(declare-fun e!216699 () Bool)

(declare-fun mapRes!13194 () Bool)

(assert (=> b!353759 (= e!216696 (and e!216699 mapRes!13194))))

(declare-fun condMapEmpty!13194 () Bool)

(declare-datatypes ((V!11371 0))(
  ( (V!11372 (val!3942 Int)) )
))
(declare-datatypes ((ValueCell!3554 0))(
  ( (ValueCellFull!3554 (v!6135 V!11371)) (EmptyCell!3554) )
))
(declare-datatypes ((array!19185 0))(
  ( (array!19186 (arr!9088 (Array (_ BitVec 32) ValueCell!3554)) (size!9440 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19185)

(declare-fun mapDefault!13194 () ValueCell!3554)

