; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101724 () Bool)

(assert start!101724)

(declare-fun b_free!26413 () Bool)

(declare-fun b_next!26413 () Bool)

(assert (=> start!101724 (= b_free!26413 (not b_next!26413))))

(declare-fun tp!92285 () Bool)

(declare-fun b_and!44087 () Bool)

(assert (=> start!101724 (= tp!92285 b_and!44087)))

(declare-fun b!1224233 () Bool)

(declare-fun e!695313 () Bool)

(declare-fun tp_is_empty!31117 () Bool)

(assert (=> b!1224233 (= e!695313 tp_is_empty!31117)))

(declare-fun b!1224234 () Bool)

(declare-fun e!695306 () Bool)

(declare-fun e!695310 () Bool)

(assert (=> b!1224234 (= e!695306 e!695310)))

(declare-fun res!813478 () Bool)

(assert (=> b!1224234 (=> (not res!813478) (not e!695310))))

(declare-datatypes ((array!79017 0))(
  ( (array!79018 (arr!38135 (Array (_ BitVec 32) (_ BitVec 64))) (size!38671 (_ BitVec 32))) )
))
(declare-fun lt!557391 () array!79017)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79017 (_ BitVec 32)) Bool)

(assert (=> b!1224234 (= res!813478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!557391 mask!1564))))

(declare-fun _keys!1208 () array!79017)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1224234 (= lt!557391 (array!79018 (store (arr!38135 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38671 _keys!1208)))))

(declare-fun b!1224235 () Bool)

(declare-fun e!695309 () Bool)

(declare-fun e!695316 () Bool)

(declare-fun mapRes!48574 () Bool)

(assert (=> b!1224235 (= e!695309 (and e!695316 mapRes!48574))))

(declare-fun condMapEmpty!48574 () Bool)

(declare-datatypes ((V!46617 0))(
  ( (V!46618 (val!15615 Int)) )
))
(declare-datatypes ((ValueCell!14849 0))(
  ( (ValueCellFull!14849 (v!18277 V!46617)) (EmptyCell!14849) )
))
(declare-datatypes ((array!79019 0))(
  ( (array!79020 (arr!38136 (Array (_ BitVec 32) ValueCell!14849)) (size!38672 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79019)

(declare-fun mapDefault!48574 () ValueCell!14849)

