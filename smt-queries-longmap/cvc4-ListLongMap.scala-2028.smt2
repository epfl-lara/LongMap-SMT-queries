; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35306 () Bool)

(assert start!35306)

(declare-fun b!353706 () Bool)

(declare-fun res!196090 () Bool)

(declare-fun e!216656 () Bool)

(assert (=> b!353706 (=> (not res!196090) (not e!216656))))

(declare-datatypes ((array!19177 0))(
  ( (array!19178 (arr!9085 (Array (_ BitVec 32) (_ BitVec 64))) (size!9437 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19177)

(assert (=> b!353706 (= res!196090 (and (bvsle #b00000000000000000000000000000000 (size!9437 _keys!1456)) (bvslt (size!9437 _keys!1456) #b01111111111111111111111111111111)))))

(declare-fun b!353707 () Bool)

(declare-fun e!216658 () Bool)

(declare-fun e!216659 () Bool)

(declare-fun mapRes!13188 () Bool)

(assert (=> b!353707 (= e!216658 (and e!216659 mapRes!13188))))

(declare-fun condMapEmpty!13188 () Bool)

(declare-datatypes ((V!11367 0))(
  ( (V!11368 (val!3941 Int)) )
))
(declare-datatypes ((ValueCell!3553 0))(
  ( (ValueCellFull!3553 (v!6134 V!11367)) (EmptyCell!3553) )
))
(declare-datatypes ((array!19179 0))(
  ( (array!19180 (arr!9086 (Array (_ BitVec 32) ValueCell!3553)) (size!9438 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19179)

(declare-fun mapDefault!13188 () ValueCell!3553)

