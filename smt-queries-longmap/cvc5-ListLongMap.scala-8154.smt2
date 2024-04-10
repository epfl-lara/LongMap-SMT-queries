; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99790 () Bool)

(assert start!99790)

(declare-fun b_free!25369 () Bool)

(declare-fun b_next!25369 () Bool)

(assert (=> start!99790 (= b_free!25369 (not b_next!25369))))

(declare-fun tp!88821 () Bool)

(declare-fun b_and!41605 () Bool)

(assert (=> start!99790 (= tp!88821 b_and!41605)))

(declare-fun b!1185725 () Bool)

(declare-fun e!674182 () Bool)

(declare-fun e!674171 () Bool)

(assert (=> b!1185725 (= e!674182 e!674171)))

(declare-fun res!788208 () Bool)

(assert (=> b!1185725 (=> res!788208 e!674171)))

(declare-datatypes ((array!76595 0))(
  ( (array!76596 (arr!36947 (Array (_ BitVec 32) (_ BitVec 64))) (size!37483 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76595)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185725 (= res!788208 (not (= (select (arr!36947 _keys!1208) from!1455) k!934)))))

(declare-fun b!1185726 () Bool)

(declare-fun e!674180 () Bool)

(assert (=> b!1185726 (= e!674180 true)))

(declare-datatypes ((V!44993 0))(
  ( (V!44994 (val!15006 Int)) )
))
(declare-datatypes ((tuple2!19252 0))(
  ( (tuple2!19253 (_1!9637 (_ BitVec 64)) (_2!9637 V!44993)) )
))
(declare-datatypes ((List!25992 0))(
  ( (Nil!25989) (Cons!25988 (h!27197 tuple2!19252) (t!38353 List!25992)) )
))
(declare-datatypes ((ListLongMap!17221 0))(
  ( (ListLongMap!17222 (toList!8626 List!25992)) )
))
(declare-fun lt!538282 () ListLongMap!17221)

(declare-fun lt!538276 () ListLongMap!17221)

(declare-fun -!1659 (ListLongMap!17221 (_ BitVec 64)) ListLongMap!17221)

(assert (=> b!1185726 (= (-!1659 lt!538282 k!934) lt!538276)))

(declare-fun lt!538271 () ListLongMap!17221)

(declare-fun lt!538284 () V!44993)

(declare-datatypes ((Unit!39288 0))(
  ( (Unit!39289) )
))
(declare-fun lt!538286 () Unit!39288)

(declare-fun addRemoveCommutativeForDiffKeys!184 (ListLongMap!17221 (_ BitVec 64) V!44993 (_ BitVec 64)) Unit!39288)

(assert (=> b!1185726 (= lt!538286 (addRemoveCommutativeForDiffKeys!184 lt!538271 (select (arr!36947 _keys!1208) from!1455) lt!538284 k!934))))

(declare-fun lt!538281 () ListLongMap!17221)

(declare-fun lt!538278 () ListLongMap!17221)

(declare-fun lt!538277 () ListLongMap!17221)

(assert (=> b!1185726 (and (= lt!538278 lt!538282) (= lt!538277 lt!538281))))

(declare-fun lt!538287 () tuple2!19252)

(declare-fun +!3921 (ListLongMap!17221 tuple2!19252) ListLongMap!17221)

(assert (=> b!1185726 (= lt!538282 (+!3921 lt!538271 lt!538287))))

(assert (=> b!1185726 (not (= (select (arr!36947 _keys!1208) from!1455) k!934))))

(declare-fun lt!538270 () Unit!39288)

(declare-fun e!674178 () Unit!39288)

(assert (=> b!1185726 (= lt!538270 e!674178)))

(declare-fun c!117177 () Bool)

(assert (=> b!1185726 (= c!117177 (= (select (arr!36947 _keys!1208) from!1455) k!934))))

(assert (=> b!1185726 e!674182))

(declare-fun res!788209 () Bool)

(assert (=> b!1185726 (=> (not res!788209) (not e!674182))))

(declare-fun lt!538285 () ListLongMap!17221)

(assert (=> b!1185726 (= res!788209 (= lt!538285 lt!538276))))

(assert (=> b!1185726 (= lt!538276 (+!3921 lt!538277 lt!538287))))

(assert (=> b!1185726 (= lt!538287 (tuple2!19253 (select (arr!36947 _keys!1208) from!1455) lt!538284))))

(declare-fun lt!538283 () V!44993)

(declare-datatypes ((ValueCell!14240 0))(
  ( (ValueCellFull!14240 (v!17644 V!44993)) (EmptyCell!14240) )
))
(declare-datatypes ((array!76597 0))(
  ( (array!76598 (arr!36948 (Array (_ BitVec 32) ValueCell!14240)) (size!37484 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76597)

(declare-fun get!18918 (ValueCell!14240 V!44993) V!44993)

(assert (=> b!1185726 (= lt!538284 (get!18918 (select (arr!36948 _values!996) from!1455) lt!538283))))

(declare-fun b!1185727 () Bool)

(declare-fun e!674176 () Bool)

(declare-fun e!674175 () Bool)

(assert (=> b!1185727 (= e!674176 (not e!674175))))

(declare-fun res!788217 () Bool)

(assert (=> b!1185727 (=> res!788217 e!674175)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1185727 (= res!788217 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185727 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!538269 () Unit!39288)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76595 (_ BitVec 64) (_ BitVec 32)) Unit!39288)

(assert (=> b!1185727 (= lt!538269 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185728 () Bool)

(declare-fun res!788206 () Bool)

(declare-fun e!674177 () Bool)

(assert (=> b!1185728 (=> (not res!788206) (not e!674177))))

(assert (=> b!1185728 (= res!788206 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37483 _keys!1208))))))

(declare-fun b!1185730 () Bool)

(declare-fun res!788207 () Bool)

(assert (=> b!1185730 (=> (not res!788207) (not e!674177))))

(declare-datatypes ((List!25993 0))(
  ( (Nil!25990) (Cons!25989 (h!27198 (_ BitVec 64)) (t!38354 List!25993)) )
))
(declare-fun arrayNoDuplicates!0 (array!76595 (_ BitVec 32) List!25993) Bool)

(assert (=> b!1185730 (= res!788207 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25990))))

(declare-fun b!1185731 () Bool)

(assert (=> b!1185731 (= e!674171 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185732 () Bool)

(declare-fun Unit!39290 () Unit!39288)

(assert (=> b!1185732 (= e!674178 Unit!39290)))

(declare-fun b!1185733 () Bool)

(declare-fun res!788218 () Bool)

(assert (=> b!1185733 (=> (not res!788218) (not e!674177))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1185733 (= res!788218 (validMask!0 mask!1564))))

(declare-fun b!1185734 () Bool)

(declare-fun e!674181 () Bool)

(declare-fun tp_is_empty!29899 () Bool)

(assert (=> b!1185734 (= e!674181 tp_is_empty!29899)))

(declare-fun b!1185735 () Bool)

(declare-fun res!788210 () Bool)

(assert (=> b!1185735 (=> (not res!788210) (not e!674177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185735 (= res!788210 (validKeyInArray!0 k!934))))

(declare-fun b!1185736 () Bool)

(declare-fun res!788212 () Bool)

(assert (=> b!1185736 (=> (not res!788212) (not e!674177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76595 (_ BitVec 32)) Bool)

(assert (=> b!1185736 (= res!788212 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1185737 () Bool)

(declare-fun e!674173 () Bool)

(declare-fun e!674179 () Bool)

(declare-fun mapRes!46676 () Bool)

(assert (=> b!1185737 (= e!674173 (and e!674179 mapRes!46676))))

(declare-fun condMapEmpty!46676 () Bool)

(declare-fun mapDefault!46676 () ValueCell!14240)

