; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112564 () Bool)

(assert start!112564)

(declare-fun b_free!30959 () Bool)

(declare-fun b_next!30959 () Bool)

(assert (=> start!112564 (= b_free!30959 (not b_next!30959))))

(declare-fun tp!108514 () Bool)

(declare-fun b_and!49867 () Bool)

(assert (=> start!112564 (= tp!108514 b_and!49867)))

(declare-fun b!1335246 () Bool)

(declare-fun res!886177 () Bool)

(declare-fun e!760473 () Bool)

(assert (=> b!1335246 (=> (not res!886177) (not e!760473))))

(declare-datatypes ((array!90598 0))(
  ( (array!90599 (arr!43765 (Array (_ BitVec 32) (_ BitVec 64))) (size!44315 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90598)

(declare-datatypes ((List!31008 0))(
  ( (Nil!31005) (Cons!31004 (h!32213 (_ BitVec 64)) (t!45272 List!31008)) )
))
(declare-fun arrayNoDuplicates!0 (array!90598 (_ BitVec 32) List!31008) Bool)

(assert (=> b!1335246 (= res!886177 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!31005))))

(declare-fun b!1335247 () Bool)

(declare-fun res!886176 () Bool)

(assert (=> b!1335247 (=> (not res!886176) (not e!760473))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1335247 (= res!886176 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44315 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!56977 () Bool)

(declare-fun mapRes!56977 () Bool)

(declare-fun tp!108513 () Bool)

(declare-fun e!760474 () Bool)

(assert (=> mapNonEmpty!56977 (= mapRes!56977 (and tp!108513 e!760474))))

(declare-datatypes ((V!54261 0))(
  ( (V!54262 (val!18509 Int)) )
))
(declare-datatypes ((ValueCell!17536 0))(
  ( (ValueCellFull!17536 (v!21146 V!54261)) (EmptyCell!17536) )
))
(declare-datatypes ((array!90600 0))(
  ( (array!90601 (arr!43766 (Array (_ BitVec 32) ValueCell!17536)) (size!44316 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90600)

(declare-fun mapKey!56977 () (_ BitVec 32))

(declare-fun mapValue!56977 () ValueCell!17536)

(declare-fun mapRest!56977 () (Array (_ BitVec 32) ValueCell!17536))

(assert (=> mapNonEmpty!56977 (= (arr!43766 _values!1320) (store mapRest!56977 mapKey!56977 mapValue!56977))))

(declare-fun b!1335248 () Bool)

(assert (=> b!1335248 (= e!760473 (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000))))

(declare-fun b!1335249 () Bool)

(declare-fun e!760477 () Bool)

(declare-fun e!760476 () Bool)

(assert (=> b!1335249 (= e!760477 (and e!760476 mapRes!56977))))

(declare-fun condMapEmpty!56977 () Bool)

(declare-fun mapDefault!56977 () ValueCell!17536)

