; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100454 () Bool)

(assert start!100454)

(declare-fun b_free!25777 () Bool)

(declare-fun b_next!25777 () Bool)

(assert (=> start!100454 (= b_free!25777 (not b_next!25777))))

(declare-fun tp!90321 () Bool)

(declare-fun b_and!42441 () Bool)

(assert (=> start!100454 (= tp!90321 b_and!42441)))

(declare-fun b!1199496 () Bool)

(declare-fun res!798408 () Bool)

(declare-fun e!681272 () Bool)

(assert (=> b!1199496 (=> (not res!798408) (not e!681272))))

(declare-datatypes ((array!77737 0))(
  ( (array!77738 (arr!37513 (Array (_ BitVec 32) (_ BitVec 64))) (size!38049 (_ BitVec 32))) )
))
(declare-fun lt!543786 () array!77737)

(declare-datatypes ((List!26398 0))(
  ( (Nil!26395) (Cons!26394 (h!27603 (_ BitVec 64)) (t!39155 List!26398)) )
))
(declare-fun arrayNoDuplicates!0 (array!77737 (_ BitVec 32) List!26398) Bool)

(assert (=> b!1199496 (= res!798408 (arrayNoDuplicates!0 lt!543786 #b00000000000000000000000000000000 Nil!26395))))

(declare-fun b!1199497 () Bool)

(declare-fun res!798404 () Bool)

(declare-fun e!681271 () Bool)

(assert (=> b!1199497 (=> (not res!798404) (not e!681271))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199497 (= res!798404 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47564 () Bool)

(declare-fun mapRes!47564 () Bool)

(assert (=> mapIsEmpty!47564 mapRes!47564))

(declare-fun b!1199498 () Bool)

(declare-fun res!798400 () Bool)

(assert (=> b!1199498 (=> (not res!798400) (not e!681271))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!77737)

(assert (=> b!1199498 (= res!798400 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38049 _keys!1208))))))

(declare-fun b!1199499 () Bool)

(assert (=> b!1199499 (= e!681271 e!681272)))

(declare-fun res!798399 () Bool)

(assert (=> b!1199499 (=> (not res!798399) (not e!681272))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77737 (_ BitVec 32)) Bool)

(assert (=> b!1199499 (= res!798399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543786 mask!1564))))

(assert (=> b!1199499 (= lt!543786 (array!77738 (store (arr!37513 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38049 _keys!1208)))))

(declare-fun b!1199500 () Bool)

(declare-fun res!798405 () Bool)

(assert (=> b!1199500 (=> (not res!798405) (not e!681271))))

(assert (=> b!1199500 (= res!798405 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26395))))

(declare-fun b!1199501 () Bool)

(declare-fun e!681274 () Bool)

(assert (=> b!1199501 (= e!681272 (not e!681274))))

(declare-fun res!798406 () Bool)

(assert (=> b!1199501 (=> res!798406 e!681274)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1199501 (= res!798406 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77737 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199501 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39768 0))(
  ( (Unit!39769) )
))
(declare-fun lt!543785 () Unit!39768)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77737 (_ BitVec 64) (_ BitVec 32)) Unit!39768)

(assert (=> b!1199501 (= lt!543785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1199502 () Bool)

(declare-fun res!798398 () Bool)

(assert (=> b!1199502 (=> (not res!798398) (not e!681271))))

(assert (=> b!1199502 (= res!798398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!798402 () Bool)

(assert (=> start!100454 (=> (not res!798402) (not e!681271))))

(assert (=> start!100454 (= res!798402 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38049 _keys!1208))))))

(assert (=> start!100454 e!681271))

(declare-fun tp_is_empty!30481 () Bool)

(assert (=> start!100454 tp_is_empty!30481))

(declare-fun array_inv!28584 (array!77737) Bool)

(assert (=> start!100454 (array_inv!28584 _keys!1208)))

(assert (=> start!100454 true))

(assert (=> start!100454 tp!90321))

(declare-datatypes ((V!45769 0))(
  ( (V!45770 (val!15297 Int)) )
))
(declare-datatypes ((ValueCell!14531 0))(
  ( (ValueCellFull!14531 (v!17935 V!45769)) (EmptyCell!14531) )
))
(declare-datatypes ((array!77739 0))(
  ( (array!77740 (arr!37514 (Array (_ BitVec 32) ValueCell!14531)) (size!38050 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77739)

(declare-fun e!681275 () Bool)

(declare-fun array_inv!28585 (array!77739) Bool)

(assert (=> start!100454 (and (array_inv!28585 _values!996) e!681275)))

(declare-fun mapNonEmpty!47564 () Bool)

(declare-fun tp!90320 () Bool)

(declare-fun e!681273 () Bool)

(assert (=> mapNonEmpty!47564 (= mapRes!47564 (and tp!90320 e!681273))))

(declare-fun mapRest!47564 () (Array (_ BitVec 32) ValueCell!14531))

(declare-fun mapValue!47564 () ValueCell!14531)

(declare-fun mapKey!47564 () (_ BitVec 32))

(assert (=> mapNonEmpty!47564 (= (arr!37514 _values!996) (store mapRest!47564 mapKey!47564 mapValue!47564))))

(declare-fun b!1199503 () Bool)

(declare-fun res!798407 () Bool)

(assert (=> b!1199503 (=> (not res!798407) (not e!681271))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1199503 (= res!798407 (and (= (size!38050 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38049 _keys!1208) (size!38050 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199504 () Bool)

(assert (=> b!1199504 (= e!681274 true)))

(declare-fun zeroValue!944 () V!45769)

(declare-datatypes ((tuple2!19582 0))(
  ( (tuple2!19583 (_1!9802 (_ BitVec 64)) (_2!9802 V!45769)) )
))
(declare-datatypes ((List!26399 0))(
  ( (Nil!26396) (Cons!26395 (h!27604 tuple2!19582) (t!39156 List!26399)) )
))
(declare-datatypes ((ListLongMap!17551 0))(
  ( (ListLongMap!17552 (toList!8791 List!26399)) )
))
(declare-fun lt!543787 () ListLongMap!17551)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45769)

(declare-fun getCurrentListMapNoExtraKeys!5230 (array!77737 array!77739 (_ BitVec 32) (_ BitVec 32) V!45769 V!45769 (_ BitVec 32) Int) ListLongMap!17551)

(declare-fun dynLambda!3150 (Int (_ BitVec 64)) V!45769)

(assert (=> b!1199504 (= lt!543787 (getCurrentListMapNoExtraKeys!5230 lt!543786 (array!77740 (store (arr!37514 _values!996) i!673 (ValueCellFull!14531 (dynLambda!3150 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38050 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543784 () ListLongMap!17551)

(assert (=> b!1199504 (= lt!543784 (getCurrentListMapNoExtraKeys!5230 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199505 () Bool)

(declare-fun e!681276 () Bool)

(assert (=> b!1199505 (= e!681275 (and e!681276 mapRes!47564))))

(declare-fun condMapEmpty!47564 () Bool)

(declare-fun mapDefault!47564 () ValueCell!14531)

