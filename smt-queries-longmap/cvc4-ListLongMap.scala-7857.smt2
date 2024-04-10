; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97890 () Bool)

(assert start!97890)

(declare-fun b_free!23591 () Bool)

(declare-fun b_next!23591 () Bool)

(assert (=> start!97890 (= b_free!23591 (not b_next!23591))))

(declare-fun tp!83476 () Bool)

(declare-fun b_and!37965 () Bool)

(assert (=> start!97890 (= tp!83476 b_and!37965)))

(declare-fun b!1121004 () Bool)

(declare-fun res!748898 () Bool)

(declare-fun e!638293 () Bool)

(assert (=> b!1121004 (=> (not res!748898) (not e!638293))))

(declare-datatypes ((array!73123 0))(
  ( (array!73124 (arr!35214 (Array (_ BitVec 32) (_ BitVec 64))) (size!35750 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73123)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1121004 (= res!748898 (= (select (arr!35214 _keys!1208) i!673) k!934))))

(declare-fun b!1121005 () Bool)

(declare-fun res!748896 () Bool)

(assert (=> b!1121005 (=> (not res!748896) (not e!638293))))

(declare-datatypes ((List!24500 0))(
  ( (Nil!24497) (Cons!24496 (h!25705 (_ BitVec 64)) (t!35083 List!24500)) )
))
(declare-fun arrayNoDuplicates!0 (array!73123 (_ BitVec 32) List!24500) Bool)

(assert (=> b!1121005 (= res!748896 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24497))))

(declare-fun res!748899 () Bool)

(assert (=> start!97890 (=> (not res!748899) (not e!638293))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97890 (= res!748899 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35750 _keys!1208))))))

(assert (=> start!97890 e!638293))

(declare-fun tp_is_empty!28121 () Bool)

(assert (=> start!97890 tp_is_empty!28121))

(declare-fun array_inv!27046 (array!73123) Bool)

(assert (=> start!97890 (array_inv!27046 _keys!1208)))

(assert (=> start!97890 true))

(assert (=> start!97890 tp!83476))

(declare-datatypes ((V!42621 0))(
  ( (V!42622 (val!14117 Int)) )
))
(declare-datatypes ((ValueCell!13351 0))(
  ( (ValueCellFull!13351 (v!16750 V!42621)) (EmptyCell!13351) )
))
(declare-datatypes ((array!73125 0))(
  ( (array!73126 (arr!35215 (Array (_ BitVec 32) ValueCell!13351)) (size!35751 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73125)

(declare-fun e!638294 () Bool)

(declare-fun array_inv!27047 (array!73125) Bool)

(assert (=> start!97890 (and (array_inv!27047 _values!996) e!638294)))

(declare-fun b!1121006 () Bool)

(declare-fun res!748897 () Bool)

(assert (=> b!1121006 (=> (not res!748897) (not e!638293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121006 (= res!748897 (validKeyInArray!0 k!934))))

(declare-fun b!1121007 () Bool)

(declare-fun e!638301 () Bool)

(declare-fun e!638297 () Bool)

(assert (=> b!1121007 (= e!638301 (not e!638297))))

(declare-fun res!748895 () Bool)

(assert (=> b!1121007 (=> res!748895 e!638297)))

(assert (=> b!1121007 (= res!748895 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121007 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36778 0))(
  ( (Unit!36779) )
))
(declare-fun lt!498210 () Unit!36778)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73123 (_ BitVec 64) (_ BitVec 32)) Unit!36778)

(assert (=> b!1121007 (= lt!498210 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1121008 () Bool)

(declare-fun res!748894 () Bool)

(assert (=> b!1121008 (=> (not res!748894) (not e!638301))))

(declare-fun lt!498215 () array!73123)

(assert (=> b!1121008 (= res!748894 (arrayNoDuplicates!0 lt!498215 #b00000000000000000000000000000000 Nil!24497))))

(declare-fun b!1121009 () Bool)

(declare-fun e!638295 () Bool)

(assert (=> b!1121009 (= e!638295 tp_is_empty!28121)))

(declare-fun b!1121010 () Bool)

(declare-fun res!748893 () Bool)

(assert (=> b!1121010 (=> (not res!748893) (not e!638293))))

(assert (=> b!1121010 (= res!748893 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35750 _keys!1208))))))

(declare-fun mapIsEmpty!43999 () Bool)

(declare-fun mapRes!43999 () Bool)

(assert (=> mapIsEmpty!43999 mapRes!43999))

(declare-datatypes ((tuple2!17716 0))(
  ( (tuple2!17717 (_1!8869 (_ BitVec 64)) (_2!8869 V!42621)) )
))
(declare-datatypes ((List!24501 0))(
  ( (Nil!24498) (Cons!24497 (h!25706 tuple2!17716) (t!35084 List!24501)) )
))
(declare-datatypes ((ListLongMap!15685 0))(
  ( (ListLongMap!15686 (toList!7858 List!24501)) )
))
(declare-fun call!47055 () ListLongMap!15685)

(declare-fun b!1121011 () Bool)

(declare-fun e!638300 () Bool)

(declare-fun call!47056 () ListLongMap!15685)

(declare-fun -!1070 (ListLongMap!15685 (_ BitVec 64)) ListLongMap!15685)

(assert (=> b!1121011 (= e!638300 (= call!47056 (-!1070 call!47055 k!934)))))

(declare-fun b!1121012 () Bool)

(assert (=> b!1121012 (= e!638293 e!638301)))

(declare-fun res!748901 () Bool)

(assert (=> b!1121012 (=> (not res!748901) (not e!638301))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73123 (_ BitVec 32)) Bool)

(assert (=> b!1121012 (= res!748901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498215 mask!1564))))

(assert (=> b!1121012 (= lt!498215 (array!73124 (store (arr!35214 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35750 _keys!1208)))))

(declare-fun b!1121013 () Bool)

(assert (=> b!1121013 (= e!638294 (and e!638295 mapRes!43999))))

(declare-fun condMapEmpty!43999 () Bool)

(declare-fun mapDefault!43999 () ValueCell!13351)

