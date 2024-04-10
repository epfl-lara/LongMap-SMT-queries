; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111572 () Bool)

(assert start!111572)

(declare-fun b_free!30229 () Bool)

(declare-fun b_next!30229 () Bool)

(assert (=> start!111572 (= b_free!30229 (not b_next!30229))))

(declare-fun tp!106162 () Bool)

(declare-fun b_and!48617 () Bool)

(assert (=> start!111572 (= tp!106162 b_and!48617)))

(declare-fun b!1321225 () Bool)

(declare-fun res!876931 () Bool)

(declare-fun e!753555 () Bool)

(assert (=> b!1321225 (=> (not res!876931) (not e!753555))))

(declare-datatypes ((array!89026 0))(
  ( (array!89027 (arr!42987 (Array (_ BitVec 32) (_ BitVec 64))) (size!43537 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89026)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1321225 (= res!876931 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43537 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321226 () Bool)

(declare-fun res!876926 () Bool)

(assert (=> b!1321226 (=> (not res!876926) (not e!753555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321226 (= res!876926 (validKeyInArray!0 (select (arr!42987 _keys!1609) from!2000)))))

(declare-fun b!1321227 () Bool)

(declare-fun e!753559 () Bool)

(declare-fun e!753556 () Bool)

(declare-fun mapRes!55721 () Bool)

(assert (=> b!1321227 (= e!753559 (and e!753556 mapRes!55721))))

(declare-fun condMapEmpty!55721 () Bool)

(declare-datatypes ((V!53169 0))(
  ( (V!53170 (val!18099 Int)) )
))
(declare-datatypes ((ValueCell!17126 0))(
  ( (ValueCellFull!17126 (v!20729 V!53169)) (EmptyCell!17126) )
))
(declare-datatypes ((array!89028 0))(
  ( (array!89029 (arr!42988 (Array (_ BitVec 32) ValueCell!17126)) (size!43538 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89028)

(declare-fun mapDefault!55721 () ValueCell!17126)

