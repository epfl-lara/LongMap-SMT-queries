; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100410 () Bool)

(assert start!100410)

(declare-fun b_free!25733 () Bool)

(declare-fun b_next!25733 () Bool)

(assert (=> start!100410 (= b_free!25733 (not b_next!25733))))

(declare-fun tp!90188 () Bool)

(declare-fun b_and!42353 () Bool)

(assert (=> start!100410 (= tp!90188 b_and!42353)))

(declare-fun b!1198528 () Bool)

(declare-fun res!797677 () Bool)

(declare-fun e!680815 () Bool)

(assert (=> b!1198528 (=> (not res!797677) (not e!680815))))

(declare-datatypes ((array!77653 0))(
  ( (array!77654 (arr!37471 (Array (_ BitVec 32) (_ BitVec 64))) (size!38007 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77653)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1198528 (= res!797677 (= (select (arr!37471 _keys!1208) i!673) k!934))))

(declare-fun b!1198529 () Bool)

(declare-fun res!797676 () Bool)

(assert (=> b!1198529 (=> (not res!797676) (not e!680815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198529 (= res!797676 (validKeyInArray!0 k!934))))

(declare-fun b!1198530 () Bool)

(declare-fun e!680811 () Bool)

(declare-fun e!680814 () Bool)

(assert (=> b!1198530 (= e!680811 (not e!680814))))

(declare-fun res!797682 () Bool)

(assert (=> b!1198530 (=> res!797682 e!680814)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198530 (= res!797682 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198530 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39738 0))(
  ( (Unit!39739) )
))
(declare-fun lt!543522 () Unit!39738)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77653 (_ BitVec 64) (_ BitVec 32)) Unit!39738)

(assert (=> b!1198530 (= lt!543522 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198531 () Bool)

(assert (=> b!1198531 (= e!680814 (or (not (= from!1455 i!673)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!38007 _keys!1208)))))))

(declare-datatypes ((V!45709 0))(
  ( (V!45710 (val!15275 Int)) )
))
(declare-fun zeroValue!944 () V!45709)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19544 0))(
  ( (tuple2!19545 (_1!9783 (_ BitVec 64)) (_2!9783 V!45709)) )
))
(declare-datatypes ((List!26361 0))(
  ( (Nil!26358) (Cons!26357 (h!27566 tuple2!19544) (t!39074 List!26361)) )
))
(declare-datatypes ((ListLongMap!17513 0))(
  ( (ListLongMap!17514 (toList!8772 List!26361)) )
))
(declare-fun lt!543521 () ListLongMap!17513)

(declare-datatypes ((ValueCell!14509 0))(
  ( (ValueCellFull!14509 (v!17913 V!45709)) (EmptyCell!14509) )
))
(declare-datatypes ((array!77655 0))(
  ( (array!77656 (arr!37472 (Array (_ BitVec 32) ValueCell!14509)) (size!38008 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77655)

(declare-fun minValue!944 () V!45709)

(declare-fun lt!543523 () array!77653)

(declare-fun getCurrentListMapNoExtraKeys!5211 (array!77653 array!77655 (_ BitVec 32) (_ BitVec 32) V!45709 V!45709 (_ BitVec 32) Int) ListLongMap!17513)

(declare-fun dynLambda!3131 (Int (_ BitVec 64)) V!45709)

(assert (=> b!1198531 (= lt!543521 (getCurrentListMapNoExtraKeys!5211 lt!543523 (array!77656 (store (arr!37472 _values!996) i!673 (ValueCellFull!14509 (dynLambda!3131 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38008 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543520 () ListLongMap!17513)

(assert (=> b!1198531 (= lt!543520 (getCurrentListMapNoExtraKeys!5211 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198532 () Bool)

(declare-fun res!797679 () Bool)

(assert (=> b!1198532 (=> (not res!797679) (not e!680815))))

(declare-datatypes ((List!26362 0))(
  ( (Nil!26359) (Cons!26358 (h!27567 (_ BitVec 64)) (t!39075 List!26362)) )
))
(declare-fun arrayNoDuplicates!0 (array!77653 (_ BitVec 32) List!26362) Bool)

(assert (=> b!1198532 (= res!797679 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26359))))

(declare-fun b!1198533 () Bool)

(declare-fun res!797672 () Bool)

(assert (=> b!1198533 (=> (not res!797672) (not e!680815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198533 (= res!797672 (validMask!0 mask!1564))))

(declare-fun b!1198534 () Bool)

(declare-fun res!797675 () Bool)

(assert (=> b!1198534 (=> (not res!797675) (not e!680815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77653 (_ BitVec 32)) Bool)

(assert (=> b!1198534 (= res!797675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!797673 () Bool)

(assert (=> start!100410 (=> (not res!797673) (not e!680815))))

(assert (=> start!100410 (= res!797673 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38007 _keys!1208))))))

(assert (=> start!100410 e!680815))

(declare-fun tp_is_empty!30437 () Bool)

(assert (=> start!100410 tp_is_empty!30437))

(declare-fun array_inv!28558 (array!77653) Bool)

(assert (=> start!100410 (array_inv!28558 _keys!1208)))

(assert (=> start!100410 true))

(assert (=> start!100410 tp!90188))

(declare-fun e!680813 () Bool)

(declare-fun array_inv!28559 (array!77655) Bool)

(assert (=> start!100410 (and (array_inv!28559 _values!996) e!680813)))

(declare-fun b!1198535 () Bool)

(declare-fun e!680812 () Bool)

(declare-fun mapRes!47498 () Bool)

(assert (=> b!1198535 (= e!680813 (and e!680812 mapRes!47498))))

(declare-fun condMapEmpty!47498 () Bool)

(declare-fun mapDefault!47498 () ValueCell!14509)

