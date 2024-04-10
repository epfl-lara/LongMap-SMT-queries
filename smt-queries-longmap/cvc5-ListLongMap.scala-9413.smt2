; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112074 () Bool)

(assert start!112074)

(declare-fun mapNonEmpty!56257 () Bool)

(declare-fun mapRes!56257 () Bool)

(declare-fun tp!107164 () Bool)

(declare-fun e!756773 () Bool)

(assert (=> mapNonEmpty!56257 (= mapRes!56257 (and tp!107164 e!756773))))

(declare-datatypes ((V!53625 0))(
  ( (V!53626 (val!18270 Int)) )
))
(declare-datatypes ((ValueCell!17297 0))(
  ( (ValueCellFull!17297 (v!20906 V!53625)) (EmptyCell!17297) )
))
(declare-datatypes ((array!89690 0))(
  ( (array!89691 (arr!43312 (Array (_ BitVec 32) ValueCell!17297)) (size!43862 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89690)

(declare-fun mapKey!56257 () (_ BitVec 32))

(declare-fun mapValue!56257 () ValueCell!17297)

(declare-fun mapRest!56257 () (Array (_ BitVec 32) ValueCell!17297))

(assert (=> mapNonEmpty!56257 (= (arr!43312 _values!1320) (store mapRest!56257 mapKey!56257 mapValue!56257))))

(declare-fun b!1327576 () Bool)

(declare-fun e!756774 () Bool)

(declare-datatypes ((List!30693 0))(
  ( (Nil!30690) (Cons!30689 (h!31898 (_ BitVec 64)) (t!44699 List!30693)) )
))
(declare-fun contains!8784 (List!30693 (_ BitVec 64)) Bool)

(assert (=> b!1327576 (= e!756774 (contains!8784 Nil!30690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1327577 () Bool)

(declare-fun e!756775 () Bool)

(declare-fun e!756771 () Bool)

(assert (=> b!1327577 (= e!756775 (and e!756771 mapRes!56257))))

(declare-fun condMapEmpty!56257 () Bool)

(declare-fun mapDefault!56257 () ValueCell!17297)

