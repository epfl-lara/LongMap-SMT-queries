; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99830 () Bool)

(assert start!99830)

(declare-fun b_free!25409 () Bool)

(declare-fun b_next!25409 () Bool)

(assert (=> start!99830 (= b_free!25409 (not b_next!25409))))

(declare-fun tp!88941 () Bool)

(declare-fun b_and!41685 () Bool)

(assert (=> start!99830 (= tp!88941 b_and!41685)))

(declare-fun b!1186965 () Bool)

(declare-fun res!789118 () Bool)

(declare-fun e!674901 () Bool)

(assert (=> b!1186965 (=> (not res!789118) (not e!674901))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76673 0))(
  ( (array!76674 (arr!36986 (Array (_ BitVec 32) (_ BitVec 64))) (size!37522 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76673)

(assert (=> b!1186965 (= res!789118 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37522 _keys!1208))))))

(declare-fun b!1186966 () Bool)

(declare-fun e!674893 () Bool)

(assert (=> b!1186966 (= e!674901 e!674893)))

(declare-fun res!789116 () Bool)

(assert (=> b!1186966 (=> (not res!789116) (not e!674893))))

(declare-fun lt!539424 () array!76673)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76673 (_ BitVec 32)) Bool)

(assert (=> b!1186966 (= res!789116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539424 mask!1564))))

(assert (=> b!1186966 (= lt!539424 (array!76674 (store (arr!36986 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37522 _keys!1208)))))

(declare-fun b!1186967 () Bool)

(declare-fun res!789117 () Bool)

(assert (=> b!1186967 (=> (not res!789117) (not e!674901))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1186967 (= res!789117 (validKeyInArray!0 k!934))))

(declare-fun res!789115 () Bool)

(assert (=> start!99830 (=> (not res!789115) (not e!674901))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99830 (= res!789115 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37522 _keys!1208))))))

(assert (=> start!99830 e!674901))

(declare-fun tp_is_empty!29939 () Bool)

(assert (=> start!99830 tp_is_empty!29939))

(declare-fun array_inv!28224 (array!76673) Bool)

(assert (=> start!99830 (array_inv!28224 _keys!1208)))

(assert (=> start!99830 true))

(assert (=> start!99830 tp!88941))

(declare-datatypes ((V!45045 0))(
  ( (V!45046 (val!15026 Int)) )
))
(declare-datatypes ((ValueCell!14260 0))(
  ( (ValueCellFull!14260 (v!17664 V!45045)) (EmptyCell!14260) )
))
(declare-datatypes ((array!76675 0))(
  ( (array!76676 (arr!36987 (Array (_ BitVec 32) ValueCell!14260)) (size!37523 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76675)

(declare-fun e!674894 () Bool)

(declare-fun array_inv!28225 (array!76675) Bool)

(assert (=> start!99830 (and (array_inv!28225 _values!996) e!674894)))

(declare-fun b!1186968 () Bool)

(declare-fun e!674902 () Bool)

(assert (=> b!1186968 (= e!674893 (not e!674902))))

(declare-fun res!789108 () Bool)

(assert (=> b!1186968 (=> res!789108 e!674902)))

(assert (=> b!1186968 (= res!789108 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76673 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1186968 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39352 0))(
  ( (Unit!39353) )
))
(declare-fun lt!539416 () Unit!39352)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76673 (_ BitVec 64) (_ BitVec 32)) Unit!39352)

(assert (=> b!1186968 (= lt!539416 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1186969 () Bool)

(declare-fun e!674896 () Bool)

(declare-fun mapRes!46736 () Bool)

(assert (=> b!1186969 (= e!674894 (and e!674896 mapRes!46736))))

(declare-fun condMapEmpty!46736 () Bool)

(declare-fun mapDefault!46736 () ValueCell!14260)

