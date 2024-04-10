; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113234 () Bool)

(assert start!113234)

(declare-fun b_free!31285 () Bool)

(declare-fun b_next!31285 () Bool)

(assert (=> start!113234 (= b_free!31285 (not b_next!31285))))

(declare-fun tp!109659 () Bool)

(declare-fun b_and!50477 () Bool)

(assert (=> start!113234 (= tp!109659 b_and!50477)))

(declare-fun b!1343309 () Bool)

(declare-fun res!891244 () Bool)

(declare-fun e!764617 () Bool)

(assert (=> b!1343309 (=> (not res!891244) (not e!764617))))

(declare-datatypes ((array!91416 0))(
  ( (array!91417 (arr!44164 (Array (_ BitVec 32) (_ BitVec 64))) (size!44714 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91416)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343309 (= res!891244 (validKeyInArray!0 (select (arr!44164 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57634 () Bool)

(declare-fun mapRes!57634 () Bool)

(assert (=> mapIsEmpty!57634 mapRes!57634))

(declare-fun res!891251 () Bool)

(assert (=> start!113234 (=> (not res!891251) (not e!764617))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113234 (= res!891251 (validMask!0 mask!1977))))

(assert (=> start!113234 e!764617))

(declare-fun tp_is_empty!37285 () Bool)

(assert (=> start!113234 tp_is_empty!37285))

(assert (=> start!113234 true))

(declare-fun array_inv!33289 (array!91416) Bool)

(assert (=> start!113234 (array_inv!33289 _keys!1571)))

(declare-datatypes ((V!54817 0))(
  ( (V!54818 (val!18717 Int)) )
))
(declare-datatypes ((ValueCell!17744 0))(
  ( (ValueCellFull!17744 (v!21365 V!54817)) (EmptyCell!17744) )
))
(declare-datatypes ((array!91418 0))(
  ( (array!91419 (arr!44165 (Array (_ BitVec 32) ValueCell!17744)) (size!44715 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91418)

(declare-fun e!764616 () Bool)

(declare-fun array_inv!33290 (array!91418) Bool)

(assert (=> start!113234 (and (array_inv!33290 _values!1303) e!764616)))

(assert (=> start!113234 tp!109659))

(declare-fun b!1343310 () Bool)

(declare-fun res!891248 () Bool)

(assert (=> b!1343310 (=> (not res!891248) (not e!764617))))

(declare-fun k!1142 () (_ BitVec 64))

(assert (=> b!1343310 (= res!891248 (not (= (select (arr!44164 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1343311 () Bool)

(declare-fun e!764614 () Bool)

(assert (=> b!1343311 (= e!764616 (and e!764614 mapRes!57634))))

(declare-fun condMapEmpty!57634 () Bool)

(declare-fun mapDefault!57634 () ValueCell!17744)

