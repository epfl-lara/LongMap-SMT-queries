; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100000 () Bool)

(assert start!100000)

(declare-fun b_free!25579 () Bool)

(declare-fun b_next!25579 () Bool)

(assert (=> start!100000 (= b_free!25579 (not b_next!25579))))

(declare-fun tp!89451 () Bool)

(declare-fun b_and!42025 () Bool)

(assert (=> start!100000 (= tp!89451 b_and!42025)))

(declare-fun b!1191280 () Bool)

(declare-fun res!792362 () Bool)

(declare-fun e!677190 () Bool)

(assert (=> b!1191280 (=> (not res!792362) (not e!677190))))

(declare-datatypes ((array!77009 0))(
  ( (array!77010 (arr!37154 (Array (_ BitVec 32) (_ BitVec 64))) (size!37690 (_ BitVec 32))) )
))
(declare-fun lt!541776 () array!77009)

(declare-datatypes ((List!26164 0))(
  ( (Nil!26161) (Cons!26160 (h!27369 (_ BitVec 64)) (t!38735 List!26164)) )
))
(declare-fun arrayNoDuplicates!0 (array!77009 (_ BitVec 32) List!26164) Bool)

(assert (=> b!1191280 (= res!792362 (arrayNoDuplicates!0 lt!541776 #b00000000000000000000000000000000 Nil!26161))))

(declare-fun b!1191281 () Bool)

(declare-fun res!792364 () Bool)

(declare-fun e!677189 () Bool)

(assert (=> b!1191281 (=> (not res!792364) (not e!677189))))

(declare-fun _keys!1208 () array!77009)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45273 0))(
  ( (V!45274 (val!15111 Int)) )
))
(declare-datatypes ((ValueCell!14345 0))(
  ( (ValueCellFull!14345 (v!17749 V!45273)) (EmptyCell!14345) )
))
(declare-datatypes ((array!77011 0))(
  ( (array!77012 (arr!37155 (Array (_ BitVec 32) ValueCell!14345)) (size!37691 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77011)

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1191281 (= res!792364 (and (= (size!37691 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37690 _keys!1208) (size!37691 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46991 () Bool)

(declare-fun mapRes!46991 () Bool)

(assert (=> mapIsEmpty!46991 mapRes!46991))

(declare-fun b!1191282 () Bool)

(declare-fun res!792367 () Bool)

(assert (=> b!1191282 (=> (not res!792367) (not e!677189))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1191282 (= res!792367 (validKeyInArray!0 k!934))))

(declare-fun b!1191283 () Bool)

(declare-fun res!792359 () Bool)

(assert (=> b!1191283 (=> (not res!792359) (not e!677189))))

(assert (=> b!1191283 (= res!792359 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26161))))

(declare-fun mapNonEmpty!46991 () Bool)

(declare-fun tp!89450 () Bool)

(declare-fun e!677187 () Bool)

(assert (=> mapNonEmpty!46991 (= mapRes!46991 (and tp!89450 e!677187))))

(declare-fun mapRest!46991 () (Array (_ BitVec 32) ValueCell!14345))

(declare-fun mapValue!46991 () ValueCell!14345)

(declare-fun mapKey!46991 () (_ BitVec 32))

(assert (=> mapNonEmpty!46991 (= (arr!37155 _values!996) (store mapRest!46991 mapKey!46991 mapValue!46991))))

(declare-fun b!1191284 () Bool)

(declare-fun e!677188 () Bool)

(declare-fun tp_is_empty!30109 () Bool)

(assert (=> b!1191284 (= e!677188 tp_is_empty!30109)))

(declare-fun res!792358 () Bool)

(assert (=> start!100000 (=> (not res!792358) (not e!677189))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100000 (= res!792358 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37690 _keys!1208))))))

(assert (=> start!100000 e!677189))

(assert (=> start!100000 tp_is_empty!30109))

(declare-fun array_inv!28334 (array!77009) Bool)

(assert (=> start!100000 (array_inv!28334 _keys!1208)))

(assert (=> start!100000 true))

(assert (=> start!100000 tp!89451))

(declare-fun e!677192 () Bool)

(declare-fun array_inv!28335 (array!77011) Bool)

(assert (=> start!100000 (and (array_inv!28335 _values!996) e!677192)))

(declare-fun b!1191285 () Bool)

(assert (=> b!1191285 (= e!677187 tp_is_empty!30109)))

(declare-fun b!1191286 () Bool)

(declare-fun e!677191 () Bool)

(declare-fun e!677193 () Bool)

(assert (=> b!1191286 (= e!677191 e!677193)))

(declare-fun res!792363 () Bool)

(assert (=> b!1191286 (=> res!792363 e!677193)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1191286 (= res!792363 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45273)

(declare-datatypes ((tuple2!19420 0))(
  ( (tuple2!19421 (_1!9721 (_ BitVec 64)) (_2!9721 V!45273)) )
))
(declare-datatypes ((List!26165 0))(
  ( (Nil!26162) (Cons!26161 (h!27370 tuple2!19420) (t!38736 List!26165)) )
))
(declare-datatypes ((ListLongMap!17389 0))(
  ( (ListLongMap!17390 (toList!8710 List!26165)) )
))
(declare-fun lt!541771 () ListLongMap!17389)

(declare-fun lt!541772 () array!77011)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45273)

(declare-fun getCurrentListMapNoExtraKeys!5151 (array!77009 array!77011 (_ BitVec 32) (_ BitVec 32) V!45273 V!45273 (_ BitVec 32) Int) ListLongMap!17389)

(assert (=> b!1191286 (= lt!541771 (getCurrentListMapNoExtraKeys!5151 lt!541776 lt!541772 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3085 (Int (_ BitVec 64)) V!45273)

(assert (=> b!1191286 (= lt!541772 (array!77012 (store (arr!37155 _values!996) i!673 (ValueCellFull!14345 (dynLambda!3085 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37691 _values!996)))))

(declare-fun lt!541774 () ListLongMap!17389)

(assert (=> b!1191286 (= lt!541774 (getCurrentListMapNoExtraKeys!5151 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1191287 () Bool)

(declare-fun res!792365 () Bool)

(assert (=> b!1191287 (=> (not res!792365) (not e!677189))))

(assert (=> b!1191287 (= res!792365 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37690 _keys!1208))))))

(declare-fun b!1191288 () Bool)

(assert (=> b!1191288 (= e!677193 true)))

(declare-fun -!1735 (ListLongMap!17389 (_ BitVec 64)) ListLongMap!17389)

(assert (=> b!1191288 (= (getCurrentListMapNoExtraKeys!5151 lt!541776 lt!541772 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1735 (getCurrentListMapNoExtraKeys!5151 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k!934))))

(declare-datatypes ((Unit!39516 0))(
  ( (Unit!39517) )
))
(declare-fun lt!541775 () Unit!39516)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!944 (array!77009 array!77011 (_ BitVec 32) (_ BitVec 32) V!45273 V!45273 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39516)

(assert (=> b!1191288 (= lt!541775 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1191289 () Bool)

(declare-fun res!792356 () Bool)

(assert (=> b!1191289 (=> (not res!792356) (not e!677189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1191289 (= res!792356 (validMask!0 mask!1564))))

(declare-fun b!1191290 () Bool)

(assert (=> b!1191290 (= e!677192 (and e!677188 mapRes!46991))))

(declare-fun condMapEmpty!46991 () Bool)

(declare-fun mapDefault!46991 () ValueCell!14345)

