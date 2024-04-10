; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112276 () Bool)

(assert start!112276)

(declare-fun b_free!30671 () Bool)

(declare-fun b_next!30671 () Bool)

(assert (=> start!112276 (= b_free!30671 (not b_next!30671))))

(declare-fun tp!107649 () Bool)

(declare-fun b_and!49397 () Bool)

(assert (=> start!112276 (= tp!107649 b_and!49397)))

(declare-fun b!1330311 () Bool)

(declare-fun res!882716 () Bool)

(declare-fun e!758234 () Bool)

(assert (=> b!1330311 (=> (not res!882716) (not e!758234))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330311 (= res!882716 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330312 () Bool)

(declare-fun e!758235 () Bool)

(declare-fun tp_is_empty!36581 () Bool)

(assert (=> b!1330312 (= e!758235 tp_is_empty!36581)))

(declare-fun b!1330313 () Bool)

(declare-fun e!758232 () Bool)

(declare-fun mapRes!56545 () Bool)

(assert (=> b!1330313 (= e!758232 (and e!758235 mapRes!56545))))

(declare-fun condMapEmpty!56545 () Bool)

(declare-datatypes ((V!53877 0))(
  ( (V!53878 (val!18365 Int)) )
))
(declare-datatypes ((ValueCell!17392 0))(
  ( (ValueCellFull!17392 (v!21002 V!53877)) (EmptyCell!17392) )
))
(declare-datatypes ((array!90052 0))(
  ( (array!90053 (arr!43492 (Array (_ BitVec 32) ValueCell!17392)) (size!44042 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90052)

(declare-fun mapDefault!56545 () ValueCell!17392)

