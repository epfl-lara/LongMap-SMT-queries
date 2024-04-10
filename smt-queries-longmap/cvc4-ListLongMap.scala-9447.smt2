; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112294 () Bool)

(assert start!112294)

(declare-fun b_free!30689 () Bool)

(declare-fun b_next!30689 () Bool)

(assert (=> start!112294 (= b_free!30689 (not b_next!30689))))

(declare-fun tp!107704 () Bool)

(declare-fun b_and!49433 () Bool)

(assert (=> start!112294 (= tp!107704 b_and!49433)))

(declare-fun b!1330653 () Bool)

(declare-fun res!882963 () Bool)

(declare-fun e!758371 () Bool)

(assert (=> b!1330653 (=> (not res!882963) (not e!758371))))

(declare-datatypes ((array!90082 0))(
  ( (array!90083 (arr!43507 (Array (_ BitVec 32) (_ BitVec 64))) (size!44057 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90082)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330653 (= res!882963 (validKeyInArray!0 (select (arr!43507 _keys!1590) from!1980)))))

(declare-fun mapIsEmpty!56572 () Bool)

(declare-fun mapRes!56572 () Bool)

(assert (=> mapIsEmpty!56572 mapRes!56572))

(declare-fun b!1330654 () Bool)

(declare-fun e!758367 () Bool)

(declare-fun e!758369 () Bool)

(assert (=> b!1330654 (= e!758367 (and e!758369 mapRes!56572))))

(declare-fun condMapEmpty!56572 () Bool)

(declare-datatypes ((V!53901 0))(
  ( (V!53902 (val!18374 Int)) )
))
(declare-datatypes ((ValueCell!17401 0))(
  ( (ValueCellFull!17401 (v!21011 V!53901)) (EmptyCell!17401) )
))
(declare-datatypes ((array!90084 0))(
  ( (array!90085 (arr!43508 (Array (_ BitVec 32) ValueCell!17401)) (size!44058 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90084)

(declare-fun mapDefault!56572 () ValueCell!17401)

