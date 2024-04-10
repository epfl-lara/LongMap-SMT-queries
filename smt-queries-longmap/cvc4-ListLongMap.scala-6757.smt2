; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84798 () Bool)

(assert start!84798)

(declare-fun mapNonEmpty!37038 () Bool)

(declare-fun mapRes!37038 () Bool)

(declare-fun tp!70109 () Bool)

(declare-fun e!559105 () Bool)

(assert (=> mapNonEmpty!37038 (= mapRes!37038 (and tp!70109 e!559105))))

(declare-datatypes ((V!36077 0))(
  ( (V!36078 (val!11711 Int)) )
))
(declare-datatypes ((ValueCell!11179 0))(
  ( (ValueCellFull!11179 (v!14287 V!36077)) (EmptyCell!11179) )
))
(declare-datatypes ((array!62605 0))(
  ( (array!62606 (arr!30152 (Array (_ BitVec 32) ValueCell!11179)) (size!30631 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62605)

(declare-fun mapValue!37038 () ValueCell!11179)

(declare-fun mapRest!37038 () (Array (_ BitVec 32) ValueCell!11179))

(declare-fun mapKey!37038 () (_ BitVec 32))

(assert (=> mapNonEmpty!37038 (= (arr!30152 _values!1551) (store mapRest!37038 mapKey!37038 mapValue!37038))))

(declare-fun b!991433 () Bool)

(declare-fun e!559104 () Bool)

(declare-fun e!559107 () Bool)

(assert (=> b!991433 (= e!559104 (and e!559107 mapRes!37038))))

(declare-fun condMapEmpty!37038 () Bool)

(declare-fun mapDefault!37038 () ValueCell!11179)

