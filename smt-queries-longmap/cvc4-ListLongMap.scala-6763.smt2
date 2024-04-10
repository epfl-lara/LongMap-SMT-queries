; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84878 () Bool)

(assert start!84878)

(declare-fun b!991881 () Bool)

(declare-fun e!559470 () Bool)

(declare-fun tp_is_empty!23357 () Bool)

(assert (=> b!991881 (= e!559470 tp_is_empty!23357)))

(declare-fun b!991882 () Bool)

(declare-fun e!559471 () Bool)

(declare-fun e!559473 () Bool)

(declare-fun mapRes!37107 () Bool)

(assert (=> b!991882 (= e!559471 (and e!559473 mapRes!37107))))

(declare-fun condMapEmpty!37107 () Bool)

(declare-datatypes ((V!36125 0))(
  ( (V!36126 (val!11729 Int)) )
))
(declare-datatypes ((ValueCell!11197 0))(
  ( (ValueCellFull!11197 (v!14306 V!36125)) (EmptyCell!11197) )
))
(declare-datatypes ((array!62685 0))(
  ( (array!62686 (arr!30187 (Array (_ BitVec 32) ValueCell!11197)) (size!30666 (_ BitVec 32))) )
))
(declare-fun _values!1551 () array!62685)

(declare-fun mapDefault!37107 () ValueCell!11197)

