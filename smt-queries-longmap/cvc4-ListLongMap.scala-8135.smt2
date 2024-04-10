; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99680 () Bool)

(assert start!99680)

(declare-fun b_free!25259 () Bool)

(declare-fun b_next!25259 () Bool)

(assert (=> start!99680 (= b_free!25259 (not b_next!25259))))

(declare-fun tp!88491 () Bool)

(declare-fun b_and!41385 () Bool)

(assert (=> start!99680 (= tp!88491 b_and!41385)))

(declare-fun b!1182315 () Bool)

(declare-fun e!672197 () Bool)

(declare-fun e!672199 () Bool)

(assert (=> b!1182315 (= e!672197 e!672199)))

(declare-fun res!785734 () Bool)

(assert (=> b!1182315 (=> (not res!785734) (not e!672199))))

(declare-datatypes ((array!76381 0))(
  ( (array!76382 (arr!36840 (Array (_ BitVec 32) (_ BitVec 64))) (size!37376 (_ BitVec 32))) )
))
(declare-fun lt!535136 () array!76381)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76381 (_ BitVec 32)) Bool)

(assert (=> b!1182315 (= res!785734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535136 mask!1564))))

(declare-fun _keys!1208 () array!76381)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182315 (= lt!535136 (array!76382 (store (arr!36840 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37376 _keys!1208)))))

(declare-fun b!1182316 () Bool)

(declare-fun res!785742 () Bool)

(assert (=> b!1182316 (=> (not res!785742) (not e!672197))))

(assert (=> b!1182316 (= res!785742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1182317 () Bool)

(declare-fun res!785737 () Bool)

(assert (=> b!1182317 (=> (not res!785737) (not e!672197))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1182317 (= res!785737 (= (select (arr!36840 _keys!1208) i!673) k!934))))

(declare-fun b!1182318 () Bool)

(declare-fun res!785733 () Bool)

(assert (=> b!1182318 (=> (not res!785733) (not e!672197))))

(assert (=> b!1182318 (= res!785733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37376 _keys!1208))))))

(declare-fun b!1182319 () Bool)

(declare-fun res!785730 () Bool)

(assert (=> b!1182319 (=> (not res!785730) (not e!672197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182319 (= res!785730 (validKeyInArray!0 k!934))))

(declare-fun b!1182320 () Bool)

(declare-fun e!672194 () Bool)

(assert (=> b!1182320 (= e!672194 true)))

(declare-datatypes ((V!44845 0))(
  ( (V!44846 (val!14951 Int)) )
))
(declare-datatypes ((tuple2!19160 0))(
  ( (tuple2!19161 (_1!9591 (_ BitVec 64)) (_2!9591 V!44845)) )
))
(declare-datatypes ((List!25901 0))(
  ( (Nil!25898) (Cons!25897 (h!27106 tuple2!19160) (t!38152 List!25901)) )
))
(declare-datatypes ((ListLongMap!17129 0))(
  ( (ListLongMap!17130 (toList!8580 List!25901)) )
))
(declare-fun lt!535143 () ListLongMap!17129)

(declare-fun lt!535144 () ListLongMap!17129)

(declare-fun -!1618 (ListLongMap!17129 (_ BitVec 64)) ListLongMap!17129)

(assert (=> b!1182320 (= (-!1618 lt!535143 k!934) lt!535144)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39115 0))(
  ( (Unit!39116) )
))
(declare-fun lt!535137 () Unit!39115)

(declare-fun lt!535148 () ListLongMap!17129)

(declare-fun lt!535135 () V!44845)

(declare-fun addRemoveCommutativeForDiffKeys!147 (ListLongMap!17129 (_ BitVec 64) V!44845 (_ BitVec 64)) Unit!39115)

(assert (=> b!1182320 (= lt!535137 (addRemoveCommutativeForDiffKeys!147 lt!535148 (select (arr!36840 _keys!1208) from!1455) lt!535135 k!934))))

(declare-fun lt!535145 () ListLongMap!17129)

(declare-fun lt!535134 () ListLongMap!17129)

(declare-fun lt!535151 () ListLongMap!17129)

(assert (=> b!1182320 (and (= lt!535145 lt!535143) (= lt!535151 lt!535134))))

(declare-fun lt!535150 () tuple2!19160)

(declare-fun +!3884 (ListLongMap!17129 tuple2!19160) ListLongMap!17129)

(assert (=> b!1182320 (= lt!535143 (+!3884 lt!535148 lt!535150))))

(assert (=> b!1182320 (not (= (select (arr!36840 _keys!1208) from!1455) k!934))))

(declare-fun lt!535142 () Unit!39115)

(declare-fun e!672200 () Unit!39115)

(assert (=> b!1182320 (= lt!535142 e!672200)))

(declare-fun c!117012 () Bool)

(assert (=> b!1182320 (= c!117012 (= (select (arr!36840 _keys!1208) from!1455) k!934))))

(declare-fun e!672195 () Bool)

(assert (=> b!1182320 e!672195))

(declare-fun res!785740 () Bool)

(assert (=> b!1182320 (=> (not res!785740) (not e!672195))))

(declare-fun lt!535152 () ListLongMap!17129)

(assert (=> b!1182320 (= res!785740 (= lt!535152 lt!535144))))

(assert (=> b!1182320 (= lt!535144 (+!3884 lt!535151 lt!535150))))

(assert (=> b!1182320 (= lt!535150 (tuple2!19161 (select (arr!36840 _keys!1208) from!1455) lt!535135))))

(declare-datatypes ((ValueCell!14185 0))(
  ( (ValueCellFull!14185 (v!17589 V!44845)) (EmptyCell!14185) )
))
(declare-datatypes ((array!76383 0))(
  ( (array!76384 (arr!36841 (Array (_ BitVec 32) ValueCell!14185)) (size!37377 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76383)

(declare-fun lt!535138 () V!44845)

(declare-fun get!18843 (ValueCell!14185 V!44845) V!44845)

(assert (=> b!1182320 (= lt!535135 (get!18843 (select (arr!36841 _values!996) from!1455) lt!535138))))

(declare-fun res!785738 () Bool)

(assert (=> start!99680 (=> (not res!785738) (not e!672197))))

(assert (=> start!99680 (= res!785738 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37376 _keys!1208))))))

(assert (=> start!99680 e!672197))

(declare-fun tp_is_empty!29789 () Bool)

(assert (=> start!99680 tp_is_empty!29789))

(declare-fun array_inv!28128 (array!76381) Bool)

(assert (=> start!99680 (array_inv!28128 _keys!1208)))

(assert (=> start!99680 true))

(assert (=> start!99680 tp!88491))

(declare-fun e!672191 () Bool)

(declare-fun array_inv!28129 (array!76383) Bool)

(assert (=> start!99680 (and (array_inv!28129 _values!996) e!672191)))

(declare-fun mapIsEmpty!46511 () Bool)

(declare-fun mapRes!46511 () Bool)

(assert (=> mapIsEmpty!46511 mapRes!46511))

(declare-fun b!1182321 () Bool)

(declare-fun e!672202 () Bool)

(assert (=> b!1182321 (= e!672195 e!672202)))

(declare-fun res!785741 () Bool)

(assert (=> b!1182321 (=> res!785741 e!672202)))

(assert (=> b!1182321 (= res!785741 (not (= (select (arr!36840 _keys!1208) from!1455) k!934)))))

(declare-fun b!1182322 () Bool)

(declare-fun res!785731 () Bool)

(assert (=> b!1182322 (=> (not res!785731) (not e!672199))))

(declare-datatypes ((List!25902 0))(
  ( (Nil!25899) (Cons!25898 (h!27107 (_ BitVec 64)) (t!38153 List!25902)) )
))
(declare-fun arrayNoDuplicates!0 (array!76381 (_ BitVec 32) List!25902) Bool)

(assert (=> b!1182322 (= res!785731 (arrayNoDuplicates!0 lt!535136 #b00000000000000000000000000000000 Nil!25899))))

(declare-fun b!1182323 () Bool)

(declare-fun res!785732 () Bool)

(assert (=> b!1182323 (=> (not res!785732) (not e!672197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182323 (= res!785732 (validMask!0 mask!1564))))

(declare-fun b!1182324 () Bool)

(declare-fun e!672192 () Bool)

(assert (=> b!1182324 (= e!672191 (and e!672192 mapRes!46511))))

(declare-fun condMapEmpty!46511 () Bool)

(declare-fun mapDefault!46511 () ValueCell!14185)

