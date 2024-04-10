; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112152 () Bool)

(assert start!112152)

(declare-fun b_free!30547 () Bool)

(declare-fun b_next!30547 () Bool)

(assert (=> start!112152 (= b_free!30547 (not b_next!30547))))

(declare-fun tp!107278 () Bool)

(declare-fun b_and!49197 () Bool)

(assert (=> start!112152 (= tp!107278 b_and!49197)))

(declare-fun b!1328256 () Bool)

(declare-fun e!757305 () Bool)

(declare-fun e!757304 () Bool)

(declare-fun mapRes!56359 () Bool)

(assert (=> b!1328256 (= e!757305 (and e!757304 mapRes!56359))))

(declare-fun condMapEmpty!56359 () Bool)

(declare-datatypes ((V!53713 0))(
  ( (V!53714 (val!18303 Int)) )
))
(declare-datatypes ((ValueCell!17330 0))(
  ( (ValueCellFull!17330 (v!20940 V!53713)) (EmptyCell!17330) )
))
(declare-datatypes ((array!89810 0))(
  ( (array!89811 (arr!43371 (Array (_ BitVec 32) ValueCell!17330)) (size!43921 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89810)

(declare-fun mapDefault!56359 () ValueCell!17330)

