; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99722 () Bool)

(assert start!99722)

(declare-fun b_free!25301 () Bool)

(declare-fun b_next!25301 () Bool)

(assert (=> start!99722 (= b_free!25301 (not b_next!25301))))

(declare-fun tp!88617 () Bool)

(declare-fun b_and!41469 () Bool)

(assert (=> start!99722 (= tp!88617 b_and!41469)))

(declare-fun b!1183617 () Bool)

(declare-fun e!672950 () Bool)

(declare-fun e!672955 () Bool)

(assert (=> b!1183617 (= e!672950 e!672955)))

(declare-fun res!786686 () Bool)

(assert (=> b!1183617 (=> res!786686 e!672955)))

(declare-datatypes ((array!76463 0))(
  ( (array!76464 (arr!36881 (Array (_ BitVec 32) (_ BitVec 64))) (size!37417 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76463)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1183617 (= res!786686 (not (= (select (arr!36881 _keys!1208) from!1455) k!934)))))

(declare-fun b!1183618 () Bool)

(declare-fun e!672953 () Bool)

(declare-fun e!672956 () Bool)

(assert (=> b!1183618 (= e!672953 (not e!672956))))

(declare-fun res!786687 () Bool)

(assert (=> b!1183618 (=> res!786687 e!672956)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183618 (= res!786687 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183618 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39176 0))(
  ( (Unit!39177) )
))
(declare-fun lt!536349 () Unit!39176)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76463 (_ BitVec 64) (_ BitVec 32)) Unit!39176)

(assert (=> b!1183618 (= lt!536349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1183619 () Bool)

(declare-fun e!672952 () Bool)

(declare-fun e!672958 () Bool)

(declare-fun mapRes!46574 () Bool)

(assert (=> b!1183619 (= e!672952 (and e!672958 mapRes!46574))))

(declare-fun condMapEmpty!46574 () Bool)

(declare-datatypes ((V!44901 0))(
  ( (V!44902 (val!14972 Int)) )
))
(declare-datatypes ((ValueCell!14206 0))(
  ( (ValueCellFull!14206 (v!17610 V!44901)) (EmptyCell!14206) )
))
(declare-datatypes ((array!76465 0))(
  ( (array!76466 (arr!36882 (Array (_ BitVec 32) ValueCell!14206)) (size!37418 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76465)

(declare-fun mapDefault!46574 () ValueCell!14206)

