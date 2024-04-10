; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113676 () Bool)

(assert start!113676)

(declare-fun b_free!31585 () Bool)

(declare-fun b_next!31585 () Bool)

(assert (=> start!113676 (= b_free!31585 (not b_next!31585))))

(declare-fun tp!110571 () Bool)

(declare-fun b_and!50969 () Bool)

(assert (=> start!113676 (= tp!110571 b_and!50969)))

(declare-fun b!1349262 () Bool)

(declare-fun res!895159 () Bool)

(declare-fun e!767540 () Bool)

(assert (=> b!1349262 (=> (not res!895159) (not e!767540))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!92000 0))(
  ( (array!92001 (arr!44453 (Array (_ BitVec 32) (_ BitVec 64))) (size!45003 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!92000)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349262 (= res!895159 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!45003 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349263 () Bool)

(declare-fun res!895157 () Bool)

(assert (=> b!1349263 (=> (not res!895157) (not e!767540))))

(declare-datatypes ((V!55217 0))(
  ( (V!55218 (val!18867 Int)) )
))
(declare-datatypes ((ValueCell!17894 0))(
  ( (ValueCellFull!17894 (v!21522 V!55217)) (EmptyCell!17894) )
))
(declare-datatypes ((array!92002 0))(
  ( (array!92003 (arr!44454 (Array (_ BitVec 32) ValueCell!17894)) (size!45004 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!92002)

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1349263 (= res!895157 (and (= (size!45004 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!45003 _keys!1571) (size!45004 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58095 () Bool)

(declare-fun mapRes!58095 () Bool)

(declare-fun tp!110570 () Bool)

(declare-fun e!767543 () Bool)

(assert (=> mapNonEmpty!58095 (= mapRes!58095 (and tp!110570 e!767543))))

(declare-fun mapRest!58095 () (Array (_ BitVec 32) ValueCell!17894))

(declare-fun mapValue!58095 () ValueCell!17894)

(declare-fun mapKey!58095 () (_ BitVec 32))

(assert (=> mapNonEmpty!58095 (= (arr!44454 _values!1303) (store mapRest!58095 mapKey!58095 mapValue!58095))))

(declare-fun b!1349264 () Bool)

(declare-fun res!895158 () Bool)

(assert (=> b!1349264 (=> (not res!895158) (not e!767540))))

(assert (=> b!1349264 (= res!895158 (not (= (select (arr!44453 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1349265 () Bool)

(declare-fun res!895156 () Bool)

(assert (=> b!1349265 (=> (not res!895156) (not e!767540))))

(declare-datatypes ((List!31485 0))(
  ( (Nil!31482) (Cons!31481 (h!32690 (_ BitVec 64)) (t!46137 List!31485)) )
))
(declare-fun arrayNoDuplicates!0 (array!92000 (_ BitVec 32) List!31485) Bool)

(assert (=> b!1349265 (= res!895156 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31482))))

(declare-fun b!1349266 () Bool)

(declare-fun e!767542 () Bool)

(declare-fun e!767539 () Bool)

(assert (=> b!1349266 (= e!767542 (and e!767539 mapRes!58095))))

(declare-fun condMapEmpty!58095 () Bool)

(declare-fun mapDefault!58095 () ValueCell!17894)

