; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99992 () Bool)

(assert start!99992)

(declare-fun b_free!25571 () Bool)

(declare-fun b_next!25571 () Bool)

(assert (=> start!99992 (= b_free!25571 (not b_next!25571))))

(declare-fun tp!89427 () Bool)

(declare-fun b_and!42009 () Bool)

(assert (=> start!99992 (= tp!89427 b_and!42009)))

(declare-fun b!1191092 () Bool)

(declare-fun res!792222 () Bool)

(declare-fun e!677096 () Bool)

(assert (=> b!1191092 (=> (not res!792222) (not e!677096))))

(declare-datatypes ((array!76993 0))(
  ( (array!76994 (arr!37146 (Array (_ BitVec 32) (_ BitVec 64))) (size!37682 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76993)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76993 (_ BitVec 32)) Bool)

(assert (=> b!1191092 (= res!792222 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1191093 () Bool)

(declare-fun e!677093 () Bool)

(declare-fun tp_is_empty!30101 () Bool)

(assert (=> b!1191093 (= e!677093 tp_is_empty!30101)))

(declare-fun b!1191094 () Bool)

(declare-fun e!677091 () Bool)

(assert (=> b!1191094 (= e!677096 e!677091)))

(declare-fun res!792213 () Bool)

(assert (=> b!1191094 (=> (not res!792213) (not e!677091))))

(declare-fun lt!541703 () array!76993)

(assert (=> b!1191094 (= res!792213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541703 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191094 (= lt!541703 (array!76994 (store (arr!37146 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37682 _keys!1208)))))

(declare-fun b!1191095 () Bool)

(declare-fun res!792220 () Bool)

(assert (=> b!1191095 (=> (not res!792220) (not e!677096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191095 (= res!792220 (validMask!0 mask!1564))))

(declare-fun b!1191096 () Bool)

(declare-fun res!792218 () Bool)

(assert (=> b!1191096 (=> (not res!792218) (not e!677096))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1191096 (= res!792218 (= (select (arr!37146 _keys!1208) i!673) k!934))))

(declare-fun b!1191097 () Bool)

(declare-fun res!792215 () Bool)

(assert (=> b!1191097 (=> (not res!792215) (not e!677096))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45261 0))(
  ( (V!45262 (val!15107 Int)) )
))
(declare-datatypes ((ValueCell!14341 0))(
  ( (ValueCellFull!14341 (v!17745 V!45261)) (EmptyCell!14341) )
))
(declare-datatypes ((array!76995 0))(
  ( (array!76996 (arr!37147 (Array (_ BitVec 32) ValueCell!14341)) (size!37683 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76995)

(assert (=> b!1191097 (= res!792215 (and (= (size!37683 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37682 _keys!1208) (size!37683 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1191098 () Bool)

(declare-fun e!677092 () Bool)

(declare-fun e!677094 () Bool)

(declare-fun mapRes!46979 () Bool)

(assert (=> b!1191098 (= e!677092 (and e!677094 mapRes!46979))))

(declare-fun condMapEmpty!46979 () Bool)

(declare-fun mapDefault!46979 () ValueCell!14341)

