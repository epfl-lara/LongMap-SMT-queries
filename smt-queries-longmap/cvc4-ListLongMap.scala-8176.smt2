; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99926 () Bool)

(assert start!99926)

(declare-fun b_free!25505 () Bool)

(declare-fun b_next!25505 () Bool)

(assert (=> start!99926 (= b_free!25505 (not b_next!25505))))

(declare-fun tp!89229 () Bool)

(declare-fun b_and!41877 () Bool)

(assert (=> start!99926 (= tp!89229 b_and!41877)))

(declare-fun b!1189542 () Bool)

(declare-fun res!791035 () Bool)

(declare-fun e!676303 () Bool)

(assert (=> b!1189542 (=> (not res!791035) (not e!676303))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76865 0))(
  ( (array!76866 (arr!37082 (Array (_ BitVec 32) (_ BitVec 64))) (size!37618 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76865)

(assert (=> b!1189542 (= res!791035 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37618 _keys!1208))))))

(declare-fun b!1189543 () Bool)

(declare-fun e!676300 () Bool)

(declare-fun tp_is_empty!30035 () Bool)

(assert (=> b!1189543 (= e!676300 tp_is_empty!30035)))

(declare-fun b!1189544 () Bool)

(declare-fun e!676305 () Bool)

(assert (=> b!1189544 (= e!676303 e!676305)))

(declare-fun res!791026 () Bool)

(assert (=> b!1189544 (=> (not res!791026) (not e!676305))))

(declare-fun lt!541106 () array!76865)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76865 (_ BitVec 32)) Bool)

(assert (=> b!1189544 (= res!791026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541106 mask!1564))))

(assert (=> b!1189544 (= lt!541106 (array!76866 (store (arr!37082 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37618 _keys!1208)))))

(declare-fun b!1189545 () Bool)

(declare-fun e!676301 () Bool)

(assert (=> b!1189545 (= e!676301 tp_is_empty!30035)))

(declare-fun b!1189541 () Bool)

(declare-fun res!791024 () Bool)

(assert (=> b!1189541 (=> (not res!791024) (not e!676303))))

(declare-datatypes ((List!26106 0))(
  ( (Nil!26103) (Cons!26102 (h!27311 (_ BitVec 64)) (t!38603 List!26106)) )
))
(declare-fun arrayNoDuplicates!0 (array!76865 (_ BitVec 32) List!26106) Bool)

(assert (=> b!1189541 (= res!791024 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26103))))

(declare-fun res!791034 () Bool)

(assert (=> start!99926 (=> (not res!791034) (not e!676303))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99926 (= res!791034 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37618 _keys!1208))))))

(assert (=> start!99926 e!676303))

(assert (=> start!99926 tp_is_empty!30035))

(declare-fun array_inv!28286 (array!76865) Bool)

(assert (=> start!99926 (array_inv!28286 _keys!1208)))

(assert (=> start!99926 true))

(assert (=> start!99926 tp!89229))

(declare-datatypes ((V!45173 0))(
  ( (V!45174 (val!15074 Int)) )
))
(declare-datatypes ((ValueCell!14308 0))(
  ( (ValueCellFull!14308 (v!17712 V!45173)) (EmptyCell!14308) )
))
(declare-datatypes ((array!76867 0))(
  ( (array!76868 (arr!37083 (Array (_ BitVec 32) ValueCell!14308)) (size!37619 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76867)

(declare-fun e!676304 () Bool)

(declare-fun array_inv!28287 (array!76867) Bool)

(assert (=> start!99926 (and (array_inv!28287 _values!996) e!676304)))

(declare-fun mapNonEmpty!46880 () Bool)

(declare-fun mapRes!46880 () Bool)

(declare-fun tp!89228 () Bool)

(assert (=> mapNonEmpty!46880 (= mapRes!46880 (and tp!89228 e!676300))))

(declare-fun mapRest!46880 () (Array (_ BitVec 32) ValueCell!14308))

(declare-fun mapValue!46880 () ValueCell!14308)

(declare-fun mapKey!46880 () (_ BitVec 32))

(assert (=> mapNonEmpty!46880 (= (arr!37083 _values!996) (store mapRest!46880 mapKey!46880 mapValue!46880))))

(declare-fun b!1189546 () Bool)

(assert (=> b!1189546 (= e!676304 (and e!676301 mapRes!46880))))

(declare-fun condMapEmpty!46880 () Bool)

(declare-fun mapDefault!46880 () ValueCell!14308)

