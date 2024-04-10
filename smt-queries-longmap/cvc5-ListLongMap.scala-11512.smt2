; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133956 () Bool)

(assert start!133956)

(declare-fun b_free!32179 () Bool)

(declare-fun b_next!32179 () Bool)

(assert (=> start!133956 (= b_free!32179 (not b_next!32179))))

(declare-fun tp!113839 () Bool)

(declare-fun b_and!51799 () Bool)

(assert (=> start!133956 (= tp!113839 b_and!51799)))

(declare-fun b!1565983 () Bool)

(declare-fun res!1070452 () Bool)

(declare-fun e!872852 () Bool)

(assert (=> b!1565983 (=> (not res!1070452) (not e!872852))))

(declare-datatypes ((array!104592 0))(
  ( (array!104593 (arr!50483 (Array (_ BitVec 32) (_ BitVec 64))) (size!51033 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104592)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565983 (= res!1070452 (validKeyInArray!0 (select (arr!50483 _keys!637) from!782)))))

(declare-fun b!1565984 () Bool)

(declare-fun e!872853 () Bool)

(declare-fun tp_is_empty!38953 () Bool)

(assert (=> b!1565984 (= e!872853 tp_is_empty!38953)))

(declare-fun b!1565985 () Bool)

(declare-fun e!872851 () Bool)

(declare-fun e!872854 () Bool)

(declare-fun mapRes!59821 () Bool)

(assert (=> b!1565985 (= e!872851 (and e!872854 mapRes!59821))))

(declare-fun condMapEmpty!59821 () Bool)

(declare-datatypes ((V!60145 0))(
  ( (V!60146 (val!19560 Int)) )
))
(declare-datatypes ((ValueCell!18446 0))(
  ( (ValueCellFull!18446 (v!22316 V!60145)) (EmptyCell!18446) )
))
(declare-datatypes ((array!104594 0))(
  ( (array!104595 (arr!50484 (Array (_ BitVec 32) ValueCell!18446)) (size!51034 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104594)

(declare-fun mapDefault!59821 () ValueCell!18446)

