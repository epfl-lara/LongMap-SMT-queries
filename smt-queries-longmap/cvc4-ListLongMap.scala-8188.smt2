; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99998 () Bool)

(assert start!99998)

(declare-fun b_free!25577 () Bool)

(declare-fun b_next!25577 () Bool)

(assert (=> start!99998 (= b_free!25577 (not b_next!25577))))

(declare-fun tp!89444 () Bool)

(declare-fun b_and!42021 () Bool)

(assert (=> start!99998 (= tp!89444 b_and!42021)))

(declare-fun b!1191233 () Bool)

(declare-fun res!792329 () Bool)

(declare-fun e!677163 () Bool)

(assert (=> b!1191233 (=> (not res!792329) (not e!677163))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191233 (= res!792329 (validKeyInArray!0 k!934))))

(declare-fun b!1191234 () Bool)

(declare-fun e!677168 () Bool)

(assert (=> b!1191234 (= e!677168 true)))

(declare-datatypes ((V!45269 0))(
  ( (V!45270 (val!15110 Int)) )
))
(declare-fun zeroValue!944 () V!45269)

(declare-datatypes ((array!77005 0))(
  ( (array!77006 (arr!37152 (Array (_ BitVec 32) (_ BitVec 64))) (size!37688 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77005)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14344 0))(
  ( (ValueCellFull!14344 (v!17748 V!45269)) (EmptyCell!14344) )
))
(declare-datatypes ((array!77007 0))(
  ( (array!77008 (arr!37153 (Array (_ BitVec 32) ValueCell!14344)) (size!37689 (_ BitVec 32))) )
))
(declare-fun lt!541753 () array!77007)

(declare-fun _values!996 () array!77007)

(declare-fun minValue!944 () V!45269)

(declare-fun lt!541756 () array!77005)

(declare-datatypes ((tuple2!19418 0))(
  ( (tuple2!19419 (_1!9720 (_ BitVec 64)) (_2!9720 V!45269)) )
))
(declare-datatypes ((List!26163 0))(
  ( (Nil!26160) (Cons!26159 (h!27368 tuple2!19418) (t!38732 List!26163)) )
))
(declare-datatypes ((ListLongMap!17387 0))(
  ( (ListLongMap!17388 (toList!8709 List!26163)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5150 (array!77005 array!77007 (_ BitVec 32) (_ BitVec 32) V!45269 V!45269 (_ BitVec 32) Int) ListLongMap!17387)

(declare-fun -!1734 (ListLongMap!17387 (_ BitVec 64)) ListLongMap!17387)

(assert (=> b!1191234 (= (getCurrentListMapNoExtraKeys!5150 lt!541756 lt!541753 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1734 (getCurrentListMapNoExtraKeys!5150 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!39514 0))(
  ( (Unit!39515) )
))
(declare-fun lt!541758 () Unit!39514)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!943 (array!77005 array!77007 (_ BitVec 32) (_ BitVec 32) V!45269 V!45269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39514)

(assert (=> b!1191234 (= lt!541758 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!943 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!792326 () Bool)

(assert (=> start!99998 (=> (not res!792326) (not e!677163))))

(assert (=> start!99998 (= res!792326 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37688 _keys!1208))))))

(assert (=> start!99998 e!677163))

(declare-fun tp_is_empty!30107 () Bool)

(assert (=> start!99998 tp_is_empty!30107))

(declare-fun array_inv!28332 (array!77005) Bool)

(assert (=> start!99998 (array_inv!28332 _keys!1208)))

(assert (=> start!99998 true))

(assert (=> start!99998 tp!89444))

(declare-fun e!677165 () Bool)

(declare-fun array_inv!28333 (array!77007) Bool)

(assert (=> start!99998 (and (array_inv!28333 _values!996) e!677165)))

(declare-fun b!1191235 () Bool)

(declare-fun e!677169 () Bool)

(declare-fun mapRes!46988 () Bool)

(assert (=> b!1191235 (= e!677165 (and e!677169 mapRes!46988))))

(declare-fun condMapEmpty!46988 () Bool)

(declare-fun mapDefault!46988 () ValueCell!14344)

