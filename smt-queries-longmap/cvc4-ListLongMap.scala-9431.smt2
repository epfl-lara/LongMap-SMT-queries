; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112198 () Bool)

(assert start!112198)

(declare-fun b_free!30593 () Bool)

(declare-fun b_next!30593 () Bool)

(assert (=> start!112198 (= b_free!30593 (not b_next!30593))))

(declare-fun tp!107416 () Bool)

(declare-fun b_and!49243 () Bool)

(assert (=> start!112198 (= tp!107416 b_and!49243)))

(declare-fun b!1328832 () Bool)

(declare-fun res!881669 () Bool)

(declare-fun e!757647 () Bool)

(assert (=> b!1328832 (=> (not res!881669) (not e!757647))))

(declare-datatypes ((array!89898 0))(
  ( (array!89899 (arr!43415 (Array (_ BitVec 32) (_ BitVec 64))) (size!43965 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89898)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89898 (_ BitVec 32)) Bool)

(assert (=> b!1328832 (= res!881669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328833 () Bool)

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun from!1980 () (_ BitVec 32))

(assert (=> b!1328833 (= e!757647 (and (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1980) #b00000000000000000000000000000000)))))

(declare-fun b!1328834 () Bool)

(declare-fun e!757651 () Bool)

(declare-fun tp_is_empty!36503 () Bool)

(assert (=> b!1328834 (= e!757651 tp_is_empty!36503)))

(declare-fun b!1328835 () Bool)

(declare-fun res!881670 () Bool)

(assert (=> b!1328835 (=> (not res!881670) (not e!757647))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1328835 (= res!881670 (not (= (select (arr!43415 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1328836 () Bool)

(declare-fun res!881663 () Bool)

(assert (=> b!1328836 (=> (not res!881663) (not e!757647))))

(assert (=> b!1328836 (= res!881663 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43965 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1328837 () Bool)

(declare-fun e!757648 () Bool)

(declare-fun e!757650 () Bool)

(declare-fun mapRes!56428 () Bool)

(assert (=> b!1328837 (= e!757648 (and e!757650 mapRes!56428))))

(declare-fun condMapEmpty!56428 () Bool)

(declare-datatypes ((V!53773 0))(
  ( (V!53774 (val!18326 Int)) )
))
(declare-datatypes ((ValueCell!17353 0))(
  ( (ValueCellFull!17353 (v!20963 V!53773)) (EmptyCell!17353) )
))
(declare-datatypes ((array!89900 0))(
  ( (array!89901 (arr!43416 (Array (_ BitVec 32) ValueCell!17353)) (size!43966 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89900)

(declare-fun mapDefault!56428 () ValueCell!17353)

