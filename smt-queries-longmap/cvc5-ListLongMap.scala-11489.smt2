; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133732 () Bool)

(assert start!133732)

(declare-fun b_free!32095 () Bool)

(declare-fun b_next!32095 () Bool)

(assert (=> start!133732 (= b_free!32095 (not b_next!32095))))

(declare-fun tp!113489 () Bool)

(declare-fun b_and!51665 () Bool)

(assert (=> start!133732 (= tp!113489 b_and!51665)))

(declare-fun b!1563695 () Bool)

(declare-fun e!871510 () Bool)

(declare-fun e!871505 () Bool)

(declare-fun mapRes!59598 () Bool)

(assert (=> b!1563695 (= e!871510 (and e!871505 mapRes!59598))))

(declare-fun condMapEmpty!59598 () Bool)

(declare-datatypes ((V!59961 0))(
  ( (V!59962 (val!19491 Int)) )
))
(declare-datatypes ((ValueCell!18377 0))(
  ( (ValueCellFull!18377 (v!22243 V!59961)) (EmptyCell!18377) )
))
(declare-datatypes ((array!104324 0))(
  ( (array!104325 (arr!50354 (Array (_ BitVec 32) ValueCell!18377)) (size!50904 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104324)

(declare-fun mapDefault!59598 () ValueCell!18377)

