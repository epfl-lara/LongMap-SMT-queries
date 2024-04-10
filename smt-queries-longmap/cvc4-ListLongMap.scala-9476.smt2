; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112468 () Bool)

(assert start!112468)

(declare-fun b_free!30863 () Bool)

(declare-fun b_next!30863 () Bool)

(assert (=> start!112468 (= b_free!30863 (not b_next!30863))))

(declare-fun tp!108225 () Bool)

(declare-fun b_and!49727 () Bool)

(assert (=> start!112468 (= tp!108225 b_and!49727)))

(declare-fun b!1333642 () Bool)

(declare-fun e!759692 () Bool)

(declare-fun e!759689 () Bool)

(declare-fun mapRes!56833 () Bool)

(assert (=> b!1333642 (= e!759692 (and e!759689 mapRes!56833))))

(declare-fun condMapEmpty!56833 () Bool)

(declare-datatypes ((V!54133 0))(
  ( (V!54134 (val!18461 Int)) )
))
(declare-datatypes ((ValueCell!17488 0))(
  ( (ValueCellFull!17488 (v!21098 V!54133)) (EmptyCell!17488) )
))
(declare-datatypes ((array!90418 0))(
  ( (array!90419 (arr!43675 (Array (_ BitVec 32) ValueCell!17488)) (size!44225 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90418)

(declare-fun mapDefault!56833 () ValueCell!17488)

