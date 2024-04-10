; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97856 () Bool)

(assert start!97856)

(declare-fun b_free!23557 () Bool)

(declare-fun b_next!23557 () Bool)

(assert (=> start!97856 (= b_free!23557 (not b_next!23557))))

(declare-fun tp!83375 () Bool)

(declare-fun b_and!37897 () Bool)

(assert (=> start!97856 (= tp!83375 b_and!37897)))

(declare-fun b!1120178 () Bool)

(declare-fun res!748315 () Bool)

(declare-fun e!637886 () Bool)

(assert (=> b!1120178 (=> (not res!748315) (not e!637886))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120178 (= res!748315 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!43948 () Bool)

(declare-fun mapRes!43948 () Bool)

(assert (=> mapIsEmpty!43948 mapRes!43948))

(declare-fun b!1120179 () Bool)

(declare-fun e!637885 () Bool)

(assert (=> b!1120179 (= e!637885 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42577 0))(
  ( (V!42578 (val!14100 Int)) )
))
(declare-datatypes ((tuple2!17690 0))(
  ( (tuple2!17691 (_1!8856 (_ BitVec 64)) (_2!8856 V!42577)) )
))
(declare-datatypes ((List!24476 0))(
  ( (Nil!24473) (Cons!24472 (h!25681 tuple2!17690) (t!35025 List!24476)) )
))
(declare-datatypes ((ListLongMap!15659 0))(
  ( (ListLongMap!15660 (toList!7845 List!24476)) )
))
(declare-fun lt!497955 () ListLongMap!15659)

(declare-datatypes ((ValueCell!13334 0))(
  ( (ValueCellFull!13334 (v!16733 V!42577)) (EmptyCell!13334) )
))
(declare-datatypes ((array!73055 0))(
  ( (array!73056 (arr!35180 (Array (_ BitVec 32) ValueCell!13334)) (size!35716 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73055)

(declare-fun minValue!944 () V!42577)

(declare-fun zeroValue!944 () V!42577)

(declare-datatypes ((array!73057 0))(
  ( (array!73058 (arr!35181 (Array (_ BitVec 32) (_ BitVec 64))) (size!35717 (_ BitVec 32))) )
))
(declare-fun lt!497957 () array!73057)

(declare-fun getCurrentListMapNoExtraKeys!4335 (array!73057 array!73055 (_ BitVec 32) (_ BitVec 32) V!42577 V!42577 (_ BitVec 32) Int) ListLongMap!15659)

(declare-fun dynLambda!2439 (Int (_ BitVec 64)) V!42577)

(assert (=> b!1120179 (= lt!497955 (getCurrentListMapNoExtraKeys!4335 lt!497957 (array!73056 (store (arr!35180 _values!996) i!673 (ValueCellFull!13334 (dynLambda!2439 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35716 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!73057)

(declare-fun lt!497954 () ListLongMap!15659)

(assert (=> b!1120179 (= lt!497954 (getCurrentListMapNoExtraKeys!4335 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120180 () Bool)

(declare-fun e!637889 () Bool)

(declare-fun tp_is_empty!28087 () Bool)

(assert (=> b!1120180 (= e!637889 tp_is_empty!28087)))

(declare-fun b!1120181 () Bool)

(declare-fun res!748305 () Bool)

(assert (=> b!1120181 (=> (not res!748305) (not e!637886))))

(assert (=> b!1120181 (= res!748305 (and (= (size!35716 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35717 _keys!1208) (size!35716 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120182 () Bool)

(declare-fun e!637890 () Bool)

(declare-fun e!637888 () Bool)

(assert (=> b!1120182 (= e!637890 (and e!637888 mapRes!43948))))

(declare-fun condMapEmpty!43948 () Bool)

(declare-fun mapDefault!43948 () ValueCell!13334)

