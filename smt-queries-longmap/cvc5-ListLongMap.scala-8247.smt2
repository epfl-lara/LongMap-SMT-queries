; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100430 () Bool)

(assert start!100430)

(declare-fun b_free!25753 () Bool)

(declare-fun b_next!25753 () Bool)

(assert (=> start!100430 (= b_free!25753 (not b_next!25753))))

(declare-fun tp!90248 () Bool)

(declare-fun b_and!42393 () Bool)

(assert (=> start!100430 (= tp!90248 b_and!42393)))

(declare-fun b!1198968 () Bool)

(declare-fun res!798009 () Bool)

(declare-fun e!681025 () Bool)

(assert (=> b!1198968 (=> (not res!798009) (not e!681025))))

(declare-datatypes ((array!77691 0))(
  ( (array!77692 (arr!37490 (Array (_ BitVec 32) (_ BitVec 64))) (size!38026 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77691)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1198968 (= res!798009 (= (select (arr!37490 _keys!1208) i!673) k!934))))

(declare-fun b!1198969 () Bool)

(declare-fun res!798012 () Bool)

(assert (=> b!1198969 (=> (not res!798012) (not e!681025))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198969 (= res!798012 (validMask!0 mask!1564))))

(declare-fun b!1198970 () Bool)

(declare-fun res!798006 () Bool)

(declare-fun e!681023 () Bool)

(assert (=> b!1198970 (=> (not res!798006) (not e!681023))))

(declare-fun lt!543643 () array!77691)

(declare-datatypes ((List!26377 0))(
  ( (Nil!26374) (Cons!26373 (h!27582 (_ BitVec 64)) (t!39110 List!26377)) )
))
(declare-fun arrayNoDuplicates!0 (array!77691 (_ BitVec 32) List!26377) Bool)

(assert (=> b!1198970 (= res!798006 (arrayNoDuplicates!0 lt!543643 #b00000000000000000000000000000000 Nil!26374))))

(declare-fun b!1198971 () Bool)

(declare-fun e!681022 () Bool)

(assert (=> b!1198971 (= e!681023 (not e!681022))))

(declare-fun res!798002 () Bool)

(assert (=> b!1198971 (=> res!798002 e!681022)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198971 (= res!798002 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198971 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39754 0))(
  ( (Unit!39755) )
))
(declare-fun lt!543642 () Unit!39754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77691 (_ BitVec 64) (_ BitVec 32)) Unit!39754)

(assert (=> b!1198971 (= lt!543642 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198972 () Bool)

(declare-fun res!798005 () Bool)

(assert (=> b!1198972 (=> (not res!798005) (not e!681025))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77691 (_ BitVec 32)) Bool)

(assert (=> b!1198972 (= res!798005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198973 () Bool)

(declare-fun res!798008 () Bool)

(assert (=> b!1198973 (=> (not res!798008) (not e!681025))))

(assert (=> b!1198973 (= res!798008 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38026 _keys!1208))))))

(declare-fun b!1198975 () Bool)

(declare-fun res!798011 () Bool)

(assert (=> b!1198975 (=> (not res!798011) (not e!681025))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198975 (= res!798011 (validKeyInArray!0 k!934))))

(declare-fun b!1198976 () Bool)

(declare-fun res!798010 () Bool)

(assert (=> b!1198976 (=> (not res!798010) (not e!681025))))

(assert (=> b!1198976 (= res!798010 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26374))))

(declare-fun mapNonEmpty!47528 () Bool)

(declare-fun mapRes!47528 () Bool)

(declare-fun tp!90249 () Bool)

(declare-fun e!681019 () Bool)

(assert (=> mapNonEmpty!47528 (= mapRes!47528 (and tp!90249 e!681019))))

(declare-datatypes ((V!45737 0))(
  ( (V!45738 (val!15285 Int)) )
))
(declare-datatypes ((ValueCell!14519 0))(
  ( (ValueCellFull!14519 (v!17923 V!45737)) (EmptyCell!14519) )
))
(declare-fun mapValue!47528 () ValueCell!14519)

(declare-datatypes ((array!77693 0))(
  ( (array!77694 (arr!37491 (Array (_ BitVec 32) ValueCell!14519)) (size!38027 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77693)

(declare-fun mapRest!47528 () (Array (_ BitVec 32) ValueCell!14519))

(declare-fun mapKey!47528 () (_ BitVec 32))

(assert (=> mapNonEmpty!47528 (= (arr!37491 _values!996) (store mapRest!47528 mapKey!47528 mapValue!47528))))

(declare-fun b!1198977 () Bool)

(declare-fun res!798007 () Bool)

(assert (=> b!1198977 (=> (not res!798007) (not e!681025))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198977 (= res!798007 (and (= (size!38027 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38026 _keys!1208) (size!38027 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198978 () Bool)

(declare-fun e!681024 () Bool)

(declare-fun e!681021 () Bool)

(assert (=> b!1198978 (= e!681024 (and e!681021 mapRes!47528))))

(declare-fun condMapEmpty!47528 () Bool)

(declare-fun mapDefault!47528 () ValueCell!14519)

