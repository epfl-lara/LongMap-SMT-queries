; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112300 () Bool)

(assert start!112300)

(declare-fun b_free!30695 () Bool)

(declare-fun b_next!30695 () Bool)

(assert (=> start!112300 (= b_free!30695 (not b_next!30695))))

(declare-fun tp!107722 () Bool)

(declare-fun b_and!49445 () Bool)

(assert (=> start!112300 (= tp!107722 b_and!49445)))

(declare-fun b!1330767 () Bool)

(declare-fun res!883039 () Bool)

(declare-fun e!758414 () Bool)

(assert (=> b!1330767 (=> (not res!883039) (not e!758414))))

(declare-datatypes ((array!90094 0))(
  ( (array!90095 (arr!43513 (Array (_ BitVec 32) (_ BitVec 64))) (size!44063 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90094)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330767 (= res!883039 (validKeyInArray!0 (select (arr!43513 _keys!1590) from!1980)))))

(declare-fun b!1330768 () Bool)

(declare-fun res!883046 () Bool)

(assert (=> b!1330768 (=> (not res!883046) (not e!758414))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1330768 (= res!883046 (not (= (select (arr!43513 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1330769 () Bool)

(declare-fun res!883043 () Bool)

(assert (=> b!1330769 (=> (not res!883043) (not e!758414))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330769 (= res!883043 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330770 () Bool)

(declare-fun e!758416 () Bool)

(declare-fun e!758412 () Bool)

(declare-fun mapRes!56581 () Bool)

(assert (=> b!1330770 (= e!758416 (and e!758412 mapRes!56581))))

(declare-fun condMapEmpty!56581 () Bool)

(declare-datatypes ((V!53909 0))(
  ( (V!53910 (val!18377 Int)) )
))
(declare-datatypes ((ValueCell!17404 0))(
  ( (ValueCellFull!17404 (v!21014 V!53909)) (EmptyCell!17404) )
))
(declare-datatypes ((array!90096 0))(
  ( (array!90097 (arr!43514 (Array (_ BitVec 32) ValueCell!17404)) (size!44064 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90096)

(declare-fun mapDefault!56581 () ValueCell!17404)

