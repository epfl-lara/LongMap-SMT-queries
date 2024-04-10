; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113466 () Bool)

(assert start!113466)

(declare-fun b_free!31517 () Bool)

(declare-fun b_next!31517 () Bool)

(assert (=> start!113466 (= b_free!31517 (not b_next!31517))))

(declare-fun tp!110355 () Bool)

(declare-fun b_and!50809 () Bool)

(assert (=> start!113466 (= tp!110355 b_and!50809)))

(declare-fun b!1347081 () Bool)

(declare-fun res!893878 () Bool)

(declare-fun e!766439 () Bool)

(assert (=> b!1347081 (=> (not res!893878) (not e!766439))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91866 0))(
  ( (array!91867 (arr!44389 (Array (_ BitVec 32) (_ BitVec 64))) (size!44939 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91866)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1347081 (= res!893878 (not (= (select (arr!44389 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1347082 () Bool)

(declare-fun e!766435 () Bool)

(declare-fun tp_is_empty!37517 () Bool)

(assert (=> b!1347082 (= e!766435 tp_is_empty!37517)))

(declare-fun b!1347083 () Bool)

(declare-fun e!766436 () Bool)

(assert (=> b!1347083 (= e!766436 tp_is_empty!37517)))

(declare-fun b!1347084 () Bool)

(declare-fun res!893875 () Bool)

(assert (=> b!1347084 (=> (not res!893875) (not e!766439))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55125 0))(
  ( (V!55126 (val!18833 Int)) )
))
(declare-datatypes ((ValueCell!17860 0))(
  ( (ValueCellFull!17860 (v!21481 V!55125)) (EmptyCell!17860) )
))
(declare-datatypes ((array!91868 0))(
  ( (array!91869 (arr!44390 (Array (_ BitVec 32) ValueCell!17860)) (size!44940 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91868)

(assert (=> b!1347084 (= res!893875 (and (= (size!44940 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44939 _keys!1571) (size!44940 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57982 () Bool)

(declare-fun mapRes!57982 () Bool)

(assert (=> mapIsEmpty!57982 mapRes!57982))

(declare-fun b!1347085 () Bool)

(declare-fun e!766438 () Bool)

(assert (=> b!1347085 (= e!766438 (and e!766435 mapRes!57982))))

(declare-fun condMapEmpty!57982 () Bool)

(declare-fun mapDefault!57982 () ValueCell!17860)

