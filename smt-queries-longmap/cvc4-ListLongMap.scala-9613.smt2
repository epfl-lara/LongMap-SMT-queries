; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113710 () Bool)

(assert start!113710)

(declare-fun b_free!31595 () Bool)

(declare-fun b_next!31595 () Bool)

(assert (=> start!113710 (= b_free!31595 (not b_next!31595))))

(declare-fun tp!110604 () Bool)

(declare-fun b_and!50993 () Bool)

(assert (=> start!113710 (= tp!110604 b_and!50993)))

(declare-fun b!1349638 () Bool)

(declare-fun res!895371 () Bool)

(declare-fun e!767741 () Bool)

(assert (=> b!1349638 (=> (not res!895371) (not e!767741))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!92022 0))(
  ( (array!92023 (arr!44463 (Array (_ BitVec 32) (_ BitVec 64))) (size!45013 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92022)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349638 (= res!895371 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45013 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349639 () Bool)

(declare-fun res!895365 () Bool)

(assert (=> b!1349639 (=> (not res!895365) (not e!767741))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!55229 0))(
  ( (V!55230 (val!18872 Int)) )
))
(declare-datatypes ((ValueCell!17899 0))(
  ( (ValueCellFull!17899 (v!21528 V!55229)) (EmptyCell!17899) )
))
(declare-datatypes ((array!92024 0))(
  ( (array!92025 (arr!44464 (Array (_ BitVec 32) ValueCell!17899)) (size!45014 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92024)

(assert (=> b!1349639 (= res!895365 (and (= (size!45014 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45013 _keys!1571) (size!45014 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1349640 () Bool)

(declare-fun e!767739 () Bool)

(declare-fun e!767740 () Bool)

(declare-fun mapRes!58113 () Bool)

(assert (=> b!1349640 (= e!767739 (and e!767740 mapRes!58113))))

(declare-fun condMapEmpty!58113 () Bool)

(declare-fun mapDefault!58113 () ValueCell!17899)

