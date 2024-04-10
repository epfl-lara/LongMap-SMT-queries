; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133564 () Bool)

(assert start!133564)

(declare-fun b_free!31981 () Bool)

(declare-fun b_next!31981 () Bool)

(assert (=> start!133564 (= b_free!31981 (not b_next!31981))))

(declare-fun tp!113067 () Bool)

(declare-fun b_and!51473 () Bool)

(assert (=> start!133564 (= tp!113067 b_and!51473)))

(declare-fun b!1561500 () Bool)

(declare-fun res!1067663 () Bool)

(declare-fun e!870182 () Bool)

(assert (=> b!1561500 (=> (not res!1067663) (not e!870182))))

(declare-datatypes ((array!104012 0))(
  ( (array!104013 (arr!50198 (Array (_ BitVec 32) (_ BitVec 64))) (size!50748 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104012)

(declare-datatypes ((List!36442 0))(
  ( (Nil!36439) (Cons!36438 (h!37884 (_ BitVec 64)) (t!51213 List!36442)) )
))
(declare-fun arrayNoDuplicates!0 (array!104012 (_ BitVec 32) List!36442) Bool)

(assert (=> b!1561500 (= res!1067663 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36439))))

(declare-fun b!1561501 () Bool)

(declare-fun e!870184 () Bool)

(declare-fun e!870181 () Bool)

(declare-fun mapRes!59346 () Bool)

(assert (=> b!1561501 (= e!870184 (and e!870181 mapRes!59346))))

(declare-fun condMapEmpty!59346 () Bool)

(declare-datatypes ((V!59737 0))(
  ( (V!59738 (val!19407 Int)) )
))
(declare-datatypes ((ValueCell!18293 0))(
  ( (ValueCellFull!18293 (v!22159 V!59737)) (EmptyCell!18293) )
))
(declare-datatypes ((array!104014 0))(
  ( (array!104015 (arr!50199 (Array (_ BitVec 32) ValueCell!18293)) (size!50749 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104014)

(declare-fun mapDefault!59346 () ValueCell!18293)

