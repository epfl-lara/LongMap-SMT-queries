; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99110 () Bool)

(assert start!99110)

(declare-fun b_free!24715 () Bool)

(declare-fun b_next!24715 () Bool)

(assert (=> start!99110 (= b_free!24715 (not b_next!24715))))

(declare-fun tp!86856 () Bool)

(declare-fun b_and!40279 () Bool)

(assert (=> start!99110 (= tp!86856 b_and!40279)))

(declare-fun b!1165856 () Bool)

(declare-fun e!662743 () Bool)

(declare-fun tp_is_empty!29245 () Bool)

(assert (=> b!1165856 (= e!662743 tp_is_empty!29245)))

(declare-fun mapIsEmpty!45692 () Bool)

(declare-fun mapRes!45692 () Bool)

(assert (=> mapIsEmpty!45692 mapRes!45692))

(declare-fun b!1165857 () Bool)

(declare-fun res!773248 () Bool)

(declare-fun e!662741 () Bool)

(assert (=> b!1165857 (=> (not res!773248) (not e!662741))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165857 (= res!773248 (validMask!0 mask!1564))))

(declare-fun b!1165858 () Bool)

(declare-fun e!662744 () Bool)

(assert (=> b!1165858 (= e!662744 tp_is_empty!29245)))

(declare-fun b!1165859 () Bool)

(declare-fun res!773247 () Bool)

(assert (=> b!1165859 (=> (not res!773247) (not e!662741))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44121 0))(
  ( (V!44122 (val!14679 Int)) )
))
(declare-datatypes ((ValueCell!13913 0))(
  ( (ValueCellFull!13913 (v!17316 V!44121)) (EmptyCell!13913) )
))
(declare-datatypes ((array!75321 0))(
  ( (array!75322 (arr!36311 (Array (_ BitVec 32) ValueCell!13913)) (size!36847 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75321)

(declare-datatypes ((array!75323 0))(
  ( (array!75324 (arr!36312 (Array (_ BitVec 32) (_ BitVec 64))) (size!36848 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75323)

(assert (=> b!1165859 (= res!773247 (and (= (size!36847 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36848 _keys!1208) (size!36847 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!773244 () Bool)

(assert (=> start!99110 (=> (not res!773244) (not e!662741))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99110 (= res!773244 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36848 _keys!1208))))))

(assert (=> start!99110 e!662741))

(assert (=> start!99110 tp_is_empty!29245))

(declare-fun array_inv!27772 (array!75323) Bool)

(assert (=> start!99110 (array_inv!27772 _keys!1208)))

(assert (=> start!99110 true))

(assert (=> start!99110 tp!86856))

(declare-fun e!662740 () Bool)

(declare-fun array_inv!27773 (array!75321) Bool)

(assert (=> start!99110 (and (array_inv!27773 _values!996) e!662740)))

(declare-fun mapNonEmpty!45692 () Bool)

(declare-fun tp!86855 () Bool)

(assert (=> mapNonEmpty!45692 (= mapRes!45692 (and tp!86855 e!662743))))

(declare-fun mapKey!45692 () (_ BitVec 32))

(declare-fun mapRest!45692 () (Array (_ BitVec 32) ValueCell!13913))

(declare-fun mapValue!45692 () ValueCell!13913)

(assert (=> mapNonEmpty!45692 (= (arr!36311 _values!996) (store mapRest!45692 mapKey!45692 mapValue!45692))))

(declare-fun b!1165860 () Bool)

(declare-fun res!773252 () Bool)

(declare-fun e!662745 () Bool)

(assert (=> b!1165860 (=> (not res!773252) (not e!662745))))

(declare-fun lt!525028 () array!75323)

(declare-datatypes ((List!25457 0))(
  ( (Nil!25454) (Cons!25453 (h!26662 (_ BitVec 64)) (t!37164 List!25457)) )
))
(declare-fun arrayNoDuplicates!0 (array!75323 (_ BitVec 32) List!25457) Bool)

(assert (=> b!1165860 (= res!773252 (arrayNoDuplicates!0 lt!525028 #b00000000000000000000000000000000 Nil!25454))))

(declare-fun b!1165861 () Bool)

(declare-fun res!773246 () Bool)

(assert (=> b!1165861 (=> (not res!773246) (not e!662741))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165861 (= res!773246 (= (select (arr!36312 _keys!1208) i!673) k!934))))

(declare-fun b!1165862 () Bool)

(declare-fun res!773249 () Bool)

(assert (=> b!1165862 (=> (not res!773249) (not e!662741))))

(assert (=> b!1165862 (= res!773249 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36848 _keys!1208))))))

(declare-fun b!1165863 () Bool)

(assert (=> b!1165863 (= e!662740 (and e!662744 mapRes!45692))))

(declare-fun condMapEmpty!45692 () Bool)

(declare-fun mapDefault!45692 () ValueCell!13913)

