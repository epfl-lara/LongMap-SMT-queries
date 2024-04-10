; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99718 () Bool)

(assert start!99718)

(declare-fun b_free!25297 () Bool)

(declare-fun b_next!25297 () Bool)

(assert (=> start!99718 (= b_free!25297 (not b_next!25297))))

(declare-fun tp!88605 () Bool)

(declare-fun b_and!41461 () Bool)

(assert (=> start!99718 (= tp!88605 b_and!41461)))

(declare-fun b!1183493 () Bool)

(declare-fun res!786584 () Bool)

(declare-fun e!672879 () Bool)

(assert (=> b!1183493 (=> (not res!786584) (not e!672879))))

(declare-datatypes ((array!76455 0))(
  ( (array!76456 (arr!36877 (Array (_ BitVec 32) (_ BitVec 64))) (size!37413 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76455)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1183493 (= res!786584 (= (select (arr!36877 _keys!1208) i!673) k!934))))

(declare-fun res!786587 () Bool)

(assert (=> start!99718 (=> (not res!786587) (not e!672879))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99718 (= res!786587 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37413 _keys!1208))))))

(assert (=> start!99718 e!672879))

(declare-fun tp_is_empty!29827 () Bool)

(assert (=> start!99718 tp_is_empty!29827))

(declare-fun array_inv!28148 (array!76455) Bool)

(assert (=> start!99718 (array_inv!28148 _keys!1208)))

(assert (=> start!99718 true))

(assert (=> start!99718 tp!88605))

(declare-datatypes ((V!44897 0))(
  ( (V!44898 (val!14970 Int)) )
))
(declare-datatypes ((ValueCell!14204 0))(
  ( (ValueCellFull!14204 (v!17608 V!44897)) (EmptyCell!14204) )
))
(declare-datatypes ((array!76457 0))(
  ( (array!76458 (arr!36878 (Array (_ BitVec 32) ValueCell!14204)) (size!37414 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76457)

(declare-fun e!672876 () Bool)

(declare-fun array_inv!28149 (array!76457) Bool)

(assert (=> start!99718 (and (array_inv!28149 _values!996) e!672876)))

(declare-fun b!1183494 () Bool)

(declare-fun e!672877 () Bool)

(declare-fun arrayContainsKey!0 (array!76455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183494 (= e!672877 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183495 () Bool)

(declare-fun res!786596 () Bool)

(assert (=> b!1183495 (=> (not res!786596) (not e!672879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183495 (= res!786596 (validKeyInArray!0 k!934))))

(declare-fun mapNonEmpty!46568 () Bool)

(declare-fun mapRes!46568 () Bool)

(declare-fun tp!88604 () Bool)

(declare-fun e!672881 () Bool)

(assert (=> mapNonEmpty!46568 (= mapRes!46568 (and tp!88604 e!672881))))

(declare-fun mapKey!46568 () (_ BitVec 32))

(declare-fun mapValue!46568 () ValueCell!14204)

(declare-fun mapRest!46568 () (Array (_ BitVec 32) ValueCell!14204))

(assert (=> mapNonEmpty!46568 (= (arr!36878 _values!996) (store mapRest!46568 mapKey!46568 mapValue!46568))))

(declare-fun b!1183496 () Bool)

(declare-fun e!672880 () Bool)

(declare-fun e!672884 () Bool)

(assert (=> b!1183496 (= e!672880 (not e!672884))))

(declare-fun res!786588 () Bool)

(assert (=> b!1183496 (=> res!786588 e!672884)))

(assert (=> b!1183496 (= res!786588 (bvsgt from!1455 i!673))))

(assert (=> b!1183496 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39170 0))(
  ( (Unit!39171) )
))
(declare-fun lt!536223 () Unit!39170)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76455 (_ BitVec 64) (_ BitVec 32)) Unit!39170)

(assert (=> b!1183496 (= lt!536223 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183497 () Bool)

(declare-fun res!786594 () Bool)

(assert (=> b!1183497 (=> (not res!786594) (not e!672879))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76455 (_ BitVec 32)) Bool)

(assert (=> b!1183497 (= res!786594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183498 () Bool)

(declare-fun e!672875 () Bool)

(assert (=> b!1183498 (= e!672875 e!672877)))

(declare-fun res!786595 () Bool)

(assert (=> b!1183498 (=> res!786595 e!672877)))

(assert (=> b!1183498 (= res!786595 (not (= (select (arr!36877 _keys!1208) from!1455) k!934)))))

(declare-fun b!1183499 () Bool)

(declare-fun e!672883 () Bool)

(assert (=> b!1183499 (= e!672876 (and e!672883 mapRes!46568))))

(declare-fun condMapEmpty!46568 () Bool)

(declare-fun mapDefault!46568 () ValueCell!14204)

