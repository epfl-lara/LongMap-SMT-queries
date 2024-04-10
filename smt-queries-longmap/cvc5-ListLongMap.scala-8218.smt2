; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100216 () Bool)

(assert start!100216)

(declare-fun b!1195086 () Bool)

(declare-fun res!795191 () Bool)

(declare-fun e!679145 () Bool)

(assert (=> b!1195086 (=> (not res!795191) (not e!679145))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!77347 0))(
  ( (array!77348 (arr!37320 (Array (_ BitVec 32) (_ BitVec 64))) (size!37856 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77347)

(assert (=> b!1195086 (= res!795191 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37856 _keys!1208))))))

(declare-fun b!1195087 () Bool)

(declare-fun res!795193 () Bool)

(assert (=> b!1195087 (=> (not res!795193) (not e!679145))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1195087 (= res!795193 (= (select (arr!37320 _keys!1208) i!673) k!934))))

(declare-fun b!1195088 () Bool)

(declare-fun res!795187 () Bool)

(assert (=> b!1195088 (=> (not res!795187) (not e!679145))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77347 (_ BitVec 32)) Bool)

(assert (=> b!1195088 (= res!795187 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1195089 () Bool)

(declare-fun res!795189 () Bool)

(assert (=> b!1195089 (=> (not res!795189) (not e!679145))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1195089 (= res!795189 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!47261 () Bool)

(declare-fun mapRes!47261 () Bool)

(assert (=> mapIsEmpty!47261 mapRes!47261))

(declare-fun b!1195090 () Bool)

(declare-fun res!795194 () Bool)

(assert (=> b!1195090 (=> (not res!795194) (not e!679145))))

(declare-datatypes ((List!26271 0))(
  ( (Nil!26268) (Cons!26267 (h!27476 (_ BitVec 64)) (t!38942 List!26271)) )
))
(declare-fun arrayNoDuplicates!0 (array!77347 (_ BitVec 32) List!26271) Bool)

(assert (=> b!1195090 (= res!795194 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26268))))

(declare-fun res!795196 () Bool)

(assert (=> start!100216 (=> (not res!795196) (not e!679145))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100216 (= res!795196 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37856 _keys!1208))))))

(assert (=> start!100216 e!679145))

(declare-fun array_inv!28446 (array!77347) Bool)

(assert (=> start!100216 (array_inv!28446 _keys!1208)))

(assert (=> start!100216 true))

(declare-datatypes ((V!45505 0))(
  ( (V!45506 (val!15198 Int)) )
))
(declare-datatypes ((ValueCell!14432 0))(
  ( (ValueCellFull!14432 (v!17836 V!45505)) (EmptyCell!14432) )
))
(declare-datatypes ((array!77349 0))(
  ( (array!77350 (arr!37321 (Array (_ BitVec 32) ValueCell!14432)) (size!37857 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77349)

(declare-fun e!679147 () Bool)

(declare-fun array_inv!28447 (array!77349) Bool)

(assert (=> start!100216 (and (array_inv!28447 _values!996) e!679147)))

(declare-fun b!1195091 () Bool)

(declare-fun e!679146 () Bool)

(assert (=> b!1195091 (= e!679146 (not true))))

(declare-fun arrayContainsKey!0 (array!77347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1195091 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39618 0))(
  ( (Unit!39619) )
))
(declare-fun lt!542874 () Unit!39618)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77347 (_ BitVec 64) (_ BitVec 32)) Unit!39618)

(assert (=> b!1195091 (= lt!542874 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1195092 () Bool)

(declare-fun res!795188 () Bool)

(assert (=> b!1195092 (=> (not res!795188) (not e!679145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1195092 (= res!795188 (validMask!0 mask!1564))))

(declare-fun b!1195093 () Bool)

(declare-fun e!679142 () Bool)

(declare-fun tp_is_empty!30283 () Bool)

(assert (=> b!1195093 (= e!679142 tp_is_empty!30283)))

(declare-fun b!1195094 () Bool)

(declare-fun res!795195 () Bool)

(assert (=> b!1195094 (=> (not res!795195) (not e!679145))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1195094 (= res!795195 (and (= (size!37857 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37856 _keys!1208) (size!37857 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1195095 () Bool)

(assert (=> b!1195095 (= e!679147 (and e!679142 mapRes!47261))))

(declare-fun condMapEmpty!47261 () Bool)

(declare-fun mapDefault!47261 () ValueCell!14432)

