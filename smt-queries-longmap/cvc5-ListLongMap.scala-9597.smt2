; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113444 () Bool)

(assert start!113444)

(declare-fun b_free!31495 () Bool)

(declare-fun b_next!31495 () Bool)

(assert (=> start!113444 (= b_free!31495 (not b_next!31495))))

(declare-fun tp!110289 () Bool)

(declare-fun b_and!50783 () Bool)

(assert (=> start!113444 (= tp!110289 b_and!50783)))

(declare-fun b!1346709 () Bool)

(declare-fun res!893605 () Bool)

(declare-fun e!766273 () Bool)

(assert (=> b!1346709 (=> (not res!893605) (not e!766273))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91822 0))(
  ( (array!91823 (arr!44367 (Array (_ BitVec 32) (_ BitVec 64))) (size!44917 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91822)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55097 0))(
  ( (V!55098 (val!18822 Int)) )
))
(declare-datatypes ((ValueCell!17849 0))(
  ( (ValueCellFull!17849 (v!21470 V!55097)) (EmptyCell!17849) )
))
(declare-datatypes ((array!91824 0))(
  ( (array!91825 (arr!44368 (Array (_ BitVec 32) ValueCell!17849)) (size!44918 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91824)

(assert (=> b!1346709 (= res!893605 (and (= (size!44918 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44917 _keys!1571) (size!44918 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346710 () Bool)

(declare-fun res!893603 () Bool)

(assert (=> b!1346710 (=> (not res!893603) (not e!766273))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91822 (_ BitVec 32)) Bool)

(assert (=> b!1346710 (= res!893603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346711 () Bool)

(declare-fun e!766274 () Bool)

(declare-fun e!766272 () Bool)

(declare-fun mapRes!57949 () Bool)

(assert (=> b!1346711 (= e!766274 (and e!766272 mapRes!57949))))

(declare-fun condMapEmpty!57949 () Bool)

(declare-fun mapDefault!57949 () ValueCell!17849)

