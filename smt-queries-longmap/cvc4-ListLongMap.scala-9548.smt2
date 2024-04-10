; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113154 () Bool)

(assert start!113154)

(declare-fun b_free!31205 () Bool)

(declare-fun b_next!31205 () Bool)

(assert (=> start!113154 (= b_free!31205 (not b_next!31205))))

(declare-fun tp!109419 () Bool)

(declare-fun b_and!50317 () Bool)

(assert (=> start!113154 (= tp!109419 b_and!50317)))

(declare-fun b!1341790 () Bool)

(declare-fun res!890171 () Bool)

(declare-fun e!764017 () Bool)

(assert (=> b!1341790 (=> (not res!890171) (not e!764017))))

(declare-datatypes ((array!91262 0))(
  ( (array!91263 (arr!44087 (Array (_ BitVec 32) (_ BitVec 64))) (size!44637 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91262)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341790 (= res!890171 (validKeyInArray!0 (select (arr!44087 _keys!1571) from!1960)))))

(declare-fun b!1341791 () Bool)

(declare-fun e!764014 () Bool)

(declare-fun e!764018 () Bool)

(declare-fun mapRes!57514 () Bool)

(assert (=> b!1341791 (= e!764014 (and e!764018 mapRes!57514))))

(declare-fun condMapEmpty!57514 () Bool)

(declare-datatypes ((V!54709 0))(
  ( (V!54710 (val!18677 Int)) )
))
(declare-datatypes ((ValueCell!17704 0))(
  ( (ValueCellFull!17704 (v!21325 V!54709)) (EmptyCell!17704) )
))
(declare-datatypes ((array!91264 0))(
  ( (array!91265 (arr!44088 (Array (_ BitVec 32) ValueCell!17704)) (size!44638 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91264)

(declare-fun mapDefault!57514 () ValueCell!17704)

