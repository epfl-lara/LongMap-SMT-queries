; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133580 () Bool)

(assert start!133580)

(declare-fun b_free!31997 () Bool)

(declare-fun b_next!31997 () Bool)

(assert (=> start!133580 (= b_free!31997 (not b_next!31997))))

(declare-fun tp!113115 () Bool)

(declare-fun b_and!51505 () Bool)

(assert (=> start!133580 (= tp!113115 b_and!51505)))

(declare-fun b!1561732 () Bool)

(declare-fun res!1067811 () Bool)

(declare-fun e!870302 () Bool)

(assert (=> b!1561732 (=> (not res!1067811) (not e!870302))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!104044 0))(
  ( (array!104045 (arr!50214 (Array (_ BitVec 32) (_ BitVec 64))) (size!50764 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104044)

(declare-datatypes ((V!59757 0))(
  ( (V!59758 (val!19415 Int)) )
))
(declare-datatypes ((ValueCell!18301 0))(
  ( (ValueCellFull!18301 (v!22167 V!59757)) (EmptyCell!18301) )
))
(declare-datatypes ((array!104046 0))(
  ( (array!104047 (arr!50215 (Array (_ BitVec 32) ValueCell!18301)) (size!50765 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104046)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1561732 (= res!1067811 (and (= (size!50765 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50764 _keys!637) (size!50765 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561733 () Bool)

(declare-fun e!870303 () Bool)

(declare-fun e!870304 () Bool)

(declare-fun mapRes!59370 () Bool)

(assert (=> b!1561733 (= e!870303 (and e!870304 mapRes!59370))))

(declare-fun condMapEmpty!59370 () Bool)

(declare-fun mapDefault!59370 () ValueCell!18301)

