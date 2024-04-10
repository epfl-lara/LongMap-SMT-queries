; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111392 () Bool)

(assert start!111392)

(declare-fun b_free!30049 () Bool)

(declare-fun b_next!30049 () Bool)

(assert (=> start!111392 (= b_free!30049 (not b_next!30049))))

(declare-fun tp!105622 () Bool)

(declare-fun b_and!48269 () Bool)

(assert (=> start!111392 (= tp!105622 b_and!48269)))

(declare-fun b!1318108 () Bool)

(declare-fun res!874789 () Bool)

(declare-fun e!752207 () Bool)

(assert (=> b!1318108 (=> (not res!874789) (not e!752207))))

(declare-datatypes ((array!88686 0))(
  ( (array!88687 (arr!42817 (Array (_ BitVec 32) (_ BitVec 64))) (size!43367 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88686)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1318108 (= res!874789 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43367 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1318109 () Bool)

(declare-fun e!752209 () Bool)

(declare-fun e!752205 () Bool)

(declare-fun mapRes!55451 () Bool)

(assert (=> b!1318109 (= e!752209 (and e!752205 mapRes!55451))))

(declare-fun condMapEmpty!55451 () Bool)

(declare-datatypes ((V!52929 0))(
  ( (V!52930 (val!18009 Int)) )
))
(declare-datatypes ((ValueCell!17036 0))(
  ( (ValueCellFull!17036 (v!20639 V!52929)) (EmptyCell!17036) )
))
(declare-datatypes ((array!88688 0))(
  ( (array!88689 (arr!42818 (Array (_ BitVec 32) ValueCell!17036)) (size!43368 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88688)

(declare-fun mapDefault!55451 () ValueCell!17036)

