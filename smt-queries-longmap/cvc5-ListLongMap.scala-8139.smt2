; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99700 () Bool)

(assert start!99700)

(declare-fun b_free!25279 () Bool)

(declare-fun b_next!25279 () Bool)

(assert (=> start!99700 (= b_free!25279 (not b_next!25279))))

(declare-fun tp!88551 () Bool)

(declare-fun b_and!41425 () Bool)

(assert (=> start!99700 (= tp!88551 b_and!41425)))

(declare-fun b!1182935 () Bool)

(declare-fun res!786182 () Bool)

(declare-fun e!672553 () Bool)

(assert (=> b!1182935 (=> (not res!786182) (not e!672553))))

(declare-datatypes ((array!76421 0))(
  ( (array!76422 (arr!36860 (Array (_ BitVec 32) (_ BitVec 64))) (size!37396 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76421)

(declare-datatypes ((List!25918 0))(
  ( (Nil!25915) (Cons!25914 (h!27123 (_ BitVec 64)) (t!38189 List!25918)) )
))
(declare-fun arrayNoDuplicates!0 (array!76421 (_ BitVec 32) List!25918) Bool)

(assert (=> b!1182935 (= res!786182 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25915))))

(declare-fun b!1182936 () Bool)

(declare-fun e!672560 () Bool)

(assert (=> b!1182936 (= e!672553 e!672560)))

(declare-fun res!786181 () Bool)

(assert (=> b!1182936 (=> (not res!786181) (not e!672560))))

(declare-fun lt!535721 () array!76421)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76421 (_ BitVec 32)) Bool)

(assert (=> b!1182936 (= res!786181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535721 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182936 (= lt!535721 (array!76422 (store (arr!36860 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37396 _keys!1208)))))

(declare-fun b!1182937 () Bool)

(declare-fun e!672561 () Bool)

(declare-fun tp_is_empty!29809 () Bool)

(assert (=> b!1182937 (= e!672561 tp_is_empty!29809)))

(declare-fun b!1182938 () Bool)

(declare-fun e!672557 () Bool)

(declare-fun e!672554 () Bool)

(assert (=> b!1182938 (= e!672557 e!672554)))

(declare-fun res!786191 () Bool)

(assert (=> b!1182938 (=> res!786191 e!672554)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182938 (= res!786191 (not (validKeyInArray!0 (select (arr!36860 _keys!1208) from!1455))))))

(declare-datatypes ((V!44873 0))(
  ( (V!44874 (val!14961 Int)) )
))
(declare-datatypes ((tuple2!19178 0))(
  ( (tuple2!19179 (_1!9600 (_ BitVec 64)) (_2!9600 V!44873)) )
))
(declare-datatypes ((List!25919 0))(
  ( (Nil!25916) (Cons!25915 (h!27124 tuple2!19178) (t!38190 List!25919)) )
))
(declare-datatypes ((ListLongMap!17147 0))(
  ( (ListLongMap!17148 (toList!8589 List!25919)) )
))
(declare-fun lt!535714 () ListLongMap!17147)

(declare-fun lt!535709 () ListLongMap!17147)

(assert (=> b!1182938 (= lt!535714 lt!535709)))

(declare-fun lt!535706 () ListLongMap!17147)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1624 (ListLongMap!17147 (_ BitVec 64)) ListLongMap!17147)

(assert (=> b!1182938 (= lt!535709 (-!1624 lt!535706 k!934))))

(declare-fun zeroValue!944 () V!44873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14195 0))(
  ( (ValueCellFull!14195 (v!17599 V!44873)) (EmptyCell!14195) )
))
(declare-datatypes ((array!76423 0))(
  ( (array!76424 (arr!36861 (Array (_ BitVec 32) ValueCell!14195)) (size!37397 (_ BitVec 32))) )
))
(declare-fun lt!535707 () array!76423)

(declare-fun minValue!944 () V!44873)

(declare-fun getCurrentListMapNoExtraKeys!5040 (array!76421 array!76423 (_ BitVec 32) (_ BitVec 32) V!44873 V!44873 (_ BitVec 32) Int) ListLongMap!17147)

(assert (=> b!1182938 (= lt!535714 (getCurrentListMapNoExtraKeys!5040 lt!535721 lt!535707 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76423)

(assert (=> b!1182938 (= lt!535706 (getCurrentListMapNoExtraKeys!5040 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39143 0))(
  ( (Unit!39144) )
))
(declare-fun lt!535704 () Unit!39143)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!846 (array!76421 array!76423 (_ BitVec 32) (_ BitVec 32) V!44873 V!44873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39143)

(assert (=> b!1182938 (= lt!535704 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!846 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!46541 () Bool)

(declare-fun mapRes!46541 () Bool)

(assert (=> mapIsEmpty!46541 mapRes!46541))

(declare-fun b!1182939 () Bool)

(declare-fun res!786193 () Bool)

(assert (=> b!1182939 (=> (not res!786193) (not e!672553))))

(assert (=> b!1182939 (= res!786193 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37396 _keys!1208))))))

(declare-fun b!1182940 () Bool)

(declare-fun e!672556 () Unit!39143)

(declare-fun Unit!39145 () Unit!39143)

(assert (=> b!1182940 (= e!672556 Unit!39145)))

(declare-fun lt!535715 () Unit!39143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76421 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39143)

(assert (=> b!1182940 (= lt!535715 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182940 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535720 () Unit!39143)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76421 (_ BitVec 32) (_ BitVec 32)) Unit!39143)

(assert (=> b!1182940 (= lt!535720 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1182940 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25915)))

(declare-fun lt!535716 () Unit!39143)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76421 (_ BitVec 64) (_ BitVec 32) List!25918) Unit!39143)

(assert (=> b!1182940 (= lt!535716 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25915))))

(assert (=> b!1182940 false))

(declare-fun b!1182941 () Bool)

(declare-fun e!672559 () Bool)

(declare-fun e!672562 () Bool)

(assert (=> b!1182941 (= e!672559 (and e!672562 mapRes!46541))))

(declare-fun condMapEmpty!46541 () Bool)

(declare-fun mapDefault!46541 () ValueCell!14195)

