; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112108 () Bool)

(assert start!112108)

(declare-fun b!1327829 () Bool)

(declare-fun e!756974 () Bool)

(declare-fun e!756973 () Bool)

(declare-fun mapRes!56293 () Bool)

(assert (=> b!1327829 (= e!756974 (and e!756973 mapRes!56293))))

(declare-fun condMapEmpty!56293 () Bool)

(declare-datatypes ((V!53653 0))(
  ( (V!53654 (val!18281 Int)) )
))
(declare-datatypes ((ValueCell!17308 0))(
  ( (ValueCellFull!17308 (v!20918 V!53653)) (EmptyCell!17308) )
))
(declare-datatypes ((array!89732 0))(
  ( (array!89733 (arr!43332 (Array (_ BitVec 32) ValueCell!17308)) (size!43882 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89732)

(declare-fun mapDefault!56293 () ValueCell!17308)

