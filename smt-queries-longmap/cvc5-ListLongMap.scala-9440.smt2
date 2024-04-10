; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112248 () Bool)

(assert start!112248)

(declare-fun b_free!30643 () Bool)

(declare-fun b_next!30643 () Bool)

(assert (=> start!112248 (= b_free!30643 (not b_next!30643))))

(declare-fun tp!107565 () Bool)

(declare-fun b_and!49341 () Bool)

(assert (=> start!112248 (= tp!107565 b_and!49341)))

(declare-fun b!1329779 () Bool)

(declare-fun e!758023 () Bool)

(declare-fun e!758022 () Bool)

(declare-fun mapRes!56503 () Bool)

(assert (=> b!1329779 (= e!758023 (and e!758022 mapRes!56503))))

(declare-fun condMapEmpty!56503 () Bool)

(declare-datatypes ((V!53841 0))(
  ( (V!53842 (val!18351 Int)) )
))
(declare-datatypes ((ValueCell!17378 0))(
  ( (ValueCellFull!17378 (v!20988 V!53841)) (EmptyCell!17378) )
))
(declare-datatypes ((array!89998 0))(
  ( (array!89999 (arr!43465 (Array (_ BitVec 32) ValueCell!17378)) (size!44015 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89998)

(declare-fun mapDefault!56503 () ValueCell!17378)

