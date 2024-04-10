; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101540 () Bool)

(assert start!101540)

(declare-fun b_free!26327 () Bool)

(declare-fun b_next!26327 () Bool)

(assert (=> start!101540 (= b_free!26327 (not b_next!26327))))

(declare-fun tp!92017 () Bool)

(declare-fun b_and!43861 () Bool)

(assert (=> start!101540 (= tp!92017 b_and!43861)))

(declare-fun b!1220996 () Bool)

(declare-fun e!693356 () Bool)

(declare-fun tp_is_empty!31031 () Bool)

(assert (=> b!1220996 (= e!693356 tp_is_empty!31031)))

(declare-fun b!1220997 () Bool)

(declare-fun e!693355 () Bool)

(declare-datatypes ((array!78841 0))(
  ( (array!78842 (arr!38050 (Array (_ BitVec 32) (_ BitVec 64))) (size!38586 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78841)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1220997 (= e!693355 (or (bvsge (size!38586 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!38586 _keys!1208)) (bvslt from!1455 (size!38586 _keys!1208))))))

(declare-datatypes ((List!26850 0))(
  ( (Nil!26847) (Cons!26846 (h!28055 (_ BitVec 64)) (t!40157 List!26850)) )
))
(declare-fun arrayNoDuplicates!0 (array!78841 (_ BitVec 32) List!26850) Bool)

(assert (=> b!1220997 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26847)))

(declare-datatypes ((Unit!40452 0))(
  ( (Unit!40453) )
))
(declare-fun lt!555349 () Unit!40452)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!78841 (_ BitVec 32) (_ BitVec 32)) Unit!40452)

(assert (=> b!1220997 (= lt!555349 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1220997 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!555340 () Unit!40452)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!78841 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40452)

(assert (=> b!1220997 (= lt!555340 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1220998 () Bool)

(declare-fun res!811143 () Bool)

(declare-fun e!693347 () Bool)

(assert (=> b!1220998 (=> (not res!811143) (not e!693347))))

(assert (=> b!1220998 (= res!811143 (= (select (arr!38050 _keys!1208) i!673) k!934))))

(declare-fun res!811134 () Bool)

(assert (=> start!101540 (=> (not res!811134) (not e!693347))))

(assert (=> start!101540 (= res!811134 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38586 _keys!1208))))))

(assert (=> start!101540 e!693347))

(assert (=> start!101540 tp_is_empty!31031))

(declare-fun array_inv!28952 (array!78841) Bool)

(assert (=> start!101540 (array_inv!28952 _keys!1208)))

(assert (=> start!101540 true))

(assert (=> start!101540 tp!92017))

(declare-datatypes ((V!46501 0))(
  ( (V!46502 (val!15572 Int)) )
))
(declare-datatypes ((ValueCell!14806 0))(
  ( (ValueCellFull!14806 (v!18230 V!46501)) (EmptyCell!14806) )
))
(declare-datatypes ((array!78843 0))(
  ( (array!78844 (arr!38051 (Array (_ BitVec 32) ValueCell!14806)) (size!38587 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78843)

(declare-fun e!693358 () Bool)

(declare-fun array_inv!28953 (array!78843) Bool)

(assert (=> start!101540 (and (array_inv!28953 _values!996) e!693358)))

(declare-fun b!1220999 () Bool)

(declare-fun mapRes!48436 () Bool)

(assert (=> b!1220999 (= e!693358 (and e!693356 mapRes!48436))))

(declare-fun condMapEmpty!48436 () Bool)

(declare-fun mapDefault!48436 () ValueCell!14806)

