; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133588 () Bool)

(assert start!133588)

(declare-fun b_free!32005 () Bool)

(declare-fun b_next!32005 () Bool)

(assert (=> start!133588 (= b_free!32005 (not b_next!32005))))

(declare-fun tp!113138 () Bool)

(declare-fun b_and!51521 () Bool)

(assert (=> start!133588 (= tp!113138 b_and!51521)))

(declare-fun b!1561857 () Bool)

(declare-fun res!1067891 () Bool)

(declare-fun e!870370 () Bool)

(assert (=> b!1561857 (=> (not res!1067891) (not e!870370))))

(declare-datatypes ((array!104060 0))(
  ( (array!104061 (arr!50222 (Array (_ BitVec 32) (_ BitVec 64))) (size!50772 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104060)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561857 (= res!1067891 (validKeyInArray!0 (select (arr!50222 _keys!637) from!782)))))

(declare-fun b!1561858 () Bool)

(declare-fun res!1067888 () Bool)

(assert (=> b!1561858 (=> (not res!1067888) (not e!870370))))

(declare-datatypes ((List!36459 0))(
  ( (Nil!36456) (Cons!36455 (h!37901 (_ BitVec 64)) (t!51254 List!36459)) )
))
(declare-fun arrayNoDuplicates!0 (array!104060 (_ BitVec 32) List!36459) Bool)

(assert (=> b!1561858 (= res!1067888 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36456))))

(declare-fun mapIsEmpty!59382 () Bool)

(declare-fun mapRes!59382 () Bool)

(assert (=> mapIsEmpty!59382 mapRes!59382))

(declare-fun b!1561859 () Bool)

(declare-fun res!1067892 () Bool)

(assert (=> b!1561859 (=> (not res!1067892) (not e!870370))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59769 0))(
  ( (V!59770 (val!19419 Int)) )
))
(declare-datatypes ((ValueCell!18305 0))(
  ( (ValueCellFull!18305 (v!22171 V!59769)) (EmptyCell!18305) )
))
(declare-datatypes ((array!104062 0))(
  ( (array!104063 (arr!50223 (Array (_ BitVec 32) ValueCell!18305)) (size!50773 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104062)

(assert (=> b!1561859 (= res!1067892 (and (= (size!50773 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50772 _keys!637) (size!50773 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1561860 () Bool)

(declare-fun res!1067887 () Bool)

(assert (=> b!1561860 (=> (not res!1067887) (not e!870370))))

(assert (=> b!1561860 (= res!1067887 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50772 _keys!637)) (bvslt from!782 (size!50772 _keys!637))))))

(declare-fun b!1561861 () Bool)

(declare-fun e!870369 () Bool)

(declare-fun e!870371 () Bool)

(assert (=> b!1561861 (= e!870369 (and e!870371 mapRes!59382))))

(declare-fun condMapEmpty!59382 () Bool)

(declare-fun mapDefault!59382 () ValueCell!18305)

