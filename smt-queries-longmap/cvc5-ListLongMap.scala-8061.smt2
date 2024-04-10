; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99206 () Bool)

(assert start!99206)

(declare-fun b_free!24811 () Bool)

(declare-fun b_next!24811 () Bool)

(assert (=> start!99206 (= b_free!24811 (not b_next!24811))))

(declare-fun tp!87143 () Bool)

(declare-fun b_and!40471 () Bool)

(assert (=> start!99206 (= tp!87143 b_and!40471)))

(declare-fun mapIsEmpty!45836 () Bool)

(declare-fun mapRes!45836 () Bool)

(assert (=> mapIsEmpty!45836 mapRes!45836))

(declare-fun b!1168112 () Bool)

(declare-fun res!774976 () Bool)

(declare-fun e!663894 () Bool)

(assert (=> b!1168112 (=> (not res!774976) (not e!663894))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168112 (= res!774976 (validMask!0 mask!1564))))

(declare-fun b!1168113 () Bool)

(declare-fun e!663897 () Bool)

(declare-fun e!663890 () Bool)

(assert (=> b!1168113 (= e!663897 (and e!663890 mapRes!45836))))

(declare-fun condMapEmpty!45836 () Bool)

(declare-datatypes ((V!44249 0))(
  ( (V!44250 (val!14727 Int)) )
))
(declare-datatypes ((ValueCell!13961 0))(
  ( (ValueCellFull!13961 (v!17364 V!44249)) (EmptyCell!13961) )
))
(declare-datatypes ((array!75505 0))(
  ( (array!75506 (arr!36403 (Array (_ BitVec 32) ValueCell!13961)) (size!36939 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75505)

(declare-fun mapDefault!45836 () ValueCell!13961)

