; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99844 () Bool)

(assert start!99844)

(declare-fun b_free!25423 () Bool)

(declare-fun b_next!25423 () Bool)

(assert (=> start!99844 (= b_free!25423 (not b_next!25423))))

(declare-fun tp!88982 () Bool)

(declare-fun b_and!41713 () Bool)

(assert (=> start!99844 (= tp!88982 b_and!41713)))

(declare-fun mapNonEmpty!46757 () Bool)

(declare-fun mapRes!46757 () Bool)

(declare-fun tp!88983 () Bool)

(declare-fun e!675145 () Bool)

(assert (=> mapNonEmpty!46757 (= mapRes!46757 (and tp!88983 e!675145))))

(declare-datatypes ((V!45065 0))(
  ( (V!45066 (val!15033 Int)) )
))
(declare-datatypes ((ValueCell!14267 0))(
  ( (ValueCellFull!14267 (v!17671 V!45065)) (EmptyCell!14267) )
))
(declare-fun mapValue!46757 () ValueCell!14267)

(declare-fun mapKey!46757 () (_ BitVec 32))

(declare-datatypes ((array!76701 0))(
  ( (array!76702 (arr!37000 (Array (_ BitVec 32) ValueCell!14267)) (size!37536 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76701)

(declare-fun mapRest!46757 () (Array (_ BitVec 32) ValueCell!14267))

(assert (=> mapNonEmpty!46757 (= (arr!37000 _values!996) (store mapRest!46757 mapKey!46757 mapValue!46757))))

(declare-fun b!1187399 () Bool)

(declare-fun res!789433 () Bool)

(declare-fun e!675146 () Bool)

(assert (=> b!1187399 (=> (not res!789433) (not e!675146))))

(declare-datatypes ((array!76703 0))(
  ( (array!76704 (arr!37001 (Array (_ BitVec 32) (_ BitVec 64))) (size!37537 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76703)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1187399 (= res!789433 (= (select (arr!37001 _keys!1208) i!673) k!934))))

(declare-fun b!1187400 () Bool)

(declare-fun tp_is_empty!29953 () Bool)

(assert (=> b!1187400 (= e!675145 tp_is_empty!29953)))

(declare-fun b!1187401 () Bool)

(declare-fun e!675151 () Bool)

(declare-fun e!675149 () Bool)

(assert (=> b!1187401 (= e!675151 e!675149)))

(declare-fun res!789428 () Bool)

(assert (=> b!1187401 (=> res!789428 e!675149)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1187401 (= res!789428 (not (= (select (arr!37001 _keys!1208) from!1455) k!934)))))

(declare-fun b!1187402 () Bool)

(declare-fun res!789419 () Bool)

(assert (=> b!1187402 (=> (not res!789419) (not e!675146))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76703 (_ BitVec 32)) Bool)

(assert (=> b!1187402 (= res!789419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187403 () Bool)

(declare-fun res!789431 () Bool)

(assert (=> b!1187403 (=> (not res!789431) (not e!675146))))

(assert (=> b!1187403 (= res!789431 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37537 _keys!1208))))))

(declare-fun b!1187404 () Bool)

(declare-fun res!789420 () Bool)

(assert (=> b!1187404 (=> (not res!789420) (not e!675146))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1187404 (= res!789420 (and (= (size!37536 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37537 _keys!1208) (size!37536 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1187405 () Bool)

(declare-fun e!675154 () Bool)

(declare-fun e!675147 () Bool)

(assert (=> b!1187405 (= e!675154 e!675147)))

(declare-fun res!789429 () Bool)

(assert (=> b!1187405 (=> res!789429 e!675147)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187405 (= res!789429 (not (validKeyInArray!0 (select (arr!37001 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19298 0))(
  ( (tuple2!19299 (_1!9660 (_ BitVec 64)) (_2!9660 V!45065)) )
))
(declare-datatypes ((List!26038 0))(
  ( (Nil!26035) (Cons!26034 (h!27243 tuple2!19298) (t!38453 List!26038)) )
))
(declare-datatypes ((ListLongMap!17267 0))(
  ( (ListLongMap!17268 (toList!8649 List!26038)) )
))
(declare-fun lt!539823 () ListLongMap!17267)

(declare-fun lt!539813 () ListLongMap!17267)

(assert (=> b!1187405 (= lt!539823 lt!539813)))

(declare-fun lt!539812 () ListLongMap!17267)

(declare-fun -!1680 (ListLongMap!17267 (_ BitVec 64)) ListLongMap!17267)

(assert (=> b!1187405 (= lt!539813 (-!1680 lt!539812 k!934))))

(declare-fun zeroValue!944 () V!45065)

(declare-fun lt!539814 () array!76703)

(declare-fun lt!539809 () array!76701)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45065)

(declare-fun getCurrentListMapNoExtraKeys!5091 (array!76703 array!76701 (_ BitVec 32) (_ BitVec 32) V!45065 V!45065 (_ BitVec 32) Int) ListLongMap!17267)

(assert (=> b!1187405 (= lt!539823 (getCurrentListMapNoExtraKeys!5091 lt!539814 lt!539809 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187405 (= lt!539812 (getCurrentListMapNoExtraKeys!5091 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!39374 0))(
  ( (Unit!39375) )
))
(declare-fun lt!539824 () Unit!39374)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!891 (array!76703 array!76701 (_ BitVec 32) (_ BitVec 32) V!45065 V!45065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39374)

(assert (=> b!1187405 (= lt!539824 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!891 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187406 () Bool)

(declare-fun e!675153 () Bool)

(declare-fun e!675148 () Bool)

(assert (=> b!1187406 (= e!675153 (and e!675148 mapRes!46757))))

(declare-fun condMapEmpty!46757 () Bool)

(declare-fun mapDefault!46757 () ValueCell!14267)

