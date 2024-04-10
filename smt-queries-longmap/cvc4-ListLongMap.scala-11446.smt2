; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133478 () Bool)

(assert start!133478)

(declare-fun b!1560468 () Bool)

(declare-fun e!869539 () Bool)

(declare-fun e!869535 () Bool)

(declare-fun mapRes!59217 () Bool)

(assert (=> b!1560468 (= e!869539 (and e!869535 mapRes!59217))))

(declare-fun condMapEmpty!59217 () Bool)

(declare-datatypes ((V!59621 0))(
  ( (V!59622 (val!19364 Int)) )
))
(declare-datatypes ((ValueCell!18250 0))(
  ( (ValueCellFull!18250 (v!22116 V!59621)) (EmptyCell!18250) )
))
(declare-datatypes ((array!103846 0))(
  ( (array!103847 (arr!50115 (Array (_ BitVec 32) ValueCell!18250)) (size!50665 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103846)

(declare-fun mapDefault!59217 () ValueCell!18250)

