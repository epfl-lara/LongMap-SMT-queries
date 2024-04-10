; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133622 () Bool)

(assert start!133622)

(declare-fun b_free!32039 () Bool)

(declare-fun b_next!32039 () Bool)

(assert (=> start!133622 (= b_free!32039 (not b_next!32039))))

(declare-fun tp!113241 () Bool)

(declare-fun b_and!51589 () Bool)

(assert (=> start!133622 (= tp!113241 b_and!51589)))

(declare-fun b!1562350 () Bool)

(declare-fun res!1068195 () Bool)

(declare-fun e!870626 () Bool)

(assert (=> b!1562350 (=> (not res!1068195) (not e!870626))))

(declare-datatypes ((array!104126 0))(
  ( (array!104127 (arr!50255 (Array (_ BitVec 32) (_ BitVec 64))) (size!50805 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104126)

(declare-datatypes ((List!36479 0))(
  ( (Nil!36476) (Cons!36475 (h!37921 (_ BitVec 64)) (t!51308 List!36479)) )
))
(declare-fun arrayNoDuplicates!0 (array!104126 (_ BitVec 32) List!36479) Bool)

(assert (=> b!1562350 (= res!1068195 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36476))))

(declare-fun b!1562351 () Bool)

(declare-fun e!870627 () Bool)

(declare-fun e!870624 () Bool)

(declare-fun mapRes!59433 () Bool)

(assert (=> b!1562351 (= e!870627 (and e!870624 mapRes!59433))))

(declare-fun condMapEmpty!59433 () Bool)

(declare-datatypes ((V!59813 0))(
  ( (V!59814 (val!19436 Int)) )
))
(declare-datatypes ((ValueCell!18322 0))(
  ( (ValueCellFull!18322 (v!22188 V!59813)) (EmptyCell!18322) )
))
(declare-datatypes ((array!104128 0))(
  ( (array!104129 (arr!50256 (Array (_ BitVec 32) ValueCell!18322)) (size!50806 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104128)

(declare-fun mapDefault!59433 () ValueCell!18322)

