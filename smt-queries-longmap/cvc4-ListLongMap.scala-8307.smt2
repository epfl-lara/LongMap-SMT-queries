; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101194 () Bool)

(assert start!101194)

(declare-fun b_free!26117 () Bool)

(declare-fun b_next!26117 () Bool)

(assert (=> start!101194 (= b_free!26117 (not b_next!26117))))

(declare-fun tp!91373 () Bool)

(declare-fun b_and!43351 () Bool)

(assert (=> start!101194 (= tp!91373 b_and!43351)))

(declare-fun b!1214848 () Bool)

(declare-fun e!689861 () Bool)

(declare-fun tp_is_empty!30821 () Bool)

(assert (=> b!1214848 (= e!689861 tp_is_empty!30821)))

(declare-fun b!1214849 () Bool)

(declare-fun e!689860 () Bool)

(assert (=> b!1214849 (= e!689860 tp_is_empty!30821)))

(declare-fun b!1214850 () Bool)

(declare-fun res!806569 () Bool)

(declare-fun e!689864 () Bool)

(assert (=> b!1214850 (=> (not res!806569) (not e!689864))))

(declare-datatypes ((array!78421 0))(
  ( (array!78422 (arr!37845 (Array (_ BitVec 32) (_ BitVec 64))) (size!38381 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78421)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1214850 (= res!806569 (= (select (arr!37845 _keys!1208) i!673) k!934))))

(declare-fun b!1214851 () Bool)

(declare-fun res!806563 () Bool)

(assert (=> b!1214851 (=> (not res!806563) (not e!689864))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46221 0))(
  ( (V!46222 (val!15467 Int)) )
))
(declare-datatypes ((ValueCell!14701 0))(
  ( (ValueCellFull!14701 (v!18120 V!46221)) (EmptyCell!14701) )
))
(declare-datatypes ((array!78423 0))(
  ( (array!78424 (arr!37846 (Array (_ BitVec 32) ValueCell!14701)) (size!38382 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78423)

(assert (=> b!1214851 (= res!806563 (and (= (size!38382 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38381 _keys!1208) (size!38382 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!806567 () Bool)

(assert (=> start!101194 (=> (not res!806567) (not e!689864))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!101194 (= res!806567 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38381 _keys!1208))))))

(assert (=> start!101194 e!689864))

(assert (=> start!101194 tp_is_empty!30821))

(declare-fun array_inv!28816 (array!78421) Bool)

(assert (=> start!101194 (array_inv!28816 _keys!1208)))

(assert (=> start!101194 true))

(assert (=> start!101194 tp!91373))

(declare-fun e!689863 () Bool)

(declare-fun array_inv!28817 (array!78423) Bool)

(assert (=> start!101194 (and (array_inv!28817 _values!996) e!689863)))

(declare-fun b!1214852 () Bool)

(declare-fun mapRes!48106 () Bool)

(assert (=> b!1214852 (= e!689863 (and e!689861 mapRes!48106))))

(declare-fun condMapEmpty!48106 () Bool)

(declare-fun mapDefault!48106 () ValueCell!14701)

