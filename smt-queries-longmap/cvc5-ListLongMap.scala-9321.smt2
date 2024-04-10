; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111362 () Bool)

(assert start!111362)

(declare-fun b_free!30019 () Bool)

(declare-fun b_next!30019 () Bool)

(assert (=> start!111362 (= b_free!30019 (not b_next!30019))))

(declare-fun tp!105533 () Bool)

(declare-fun b_and!48239 () Bool)

(assert (=> start!111362 (= tp!105533 b_and!48239)))

(declare-fun b!1317748 () Bool)

(declare-fun res!874564 () Bool)

(declare-fun e!751982 () Bool)

(assert (=> b!1317748 (=> (not res!874564) (not e!751982))))

(declare-datatypes ((array!88630 0))(
  ( (array!88631 (arr!42789 (Array (_ BitVec 32) (_ BitVec 64))) (size!43339 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88630)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1317748 (= res!874564 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43339 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55406 () Bool)

(declare-fun mapRes!55406 () Bool)

(assert (=> mapIsEmpty!55406 mapRes!55406))

(declare-fun b!1317749 () Bool)

(declare-fun e!751984 () Bool)

(declare-fun e!751983 () Bool)

(assert (=> b!1317749 (= e!751984 (and e!751983 mapRes!55406))))

(declare-fun condMapEmpty!55406 () Bool)

(declare-datatypes ((V!52889 0))(
  ( (V!52890 (val!17994 Int)) )
))
(declare-datatypes ((ValueCell!17021 0))(
  ( (ValueCellFull!17021 (v!20624 V!52889)) (EmptyCell!17021) )
))
(declare-datatypes ((array!88632 0))(
  ( (array!88633 (arr!42790 (Array (_ BitVec 32) ValueCell!17021)) (size!43340 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88632)

(declare-fun mapDefault!55406 () ValueCell!17021)

