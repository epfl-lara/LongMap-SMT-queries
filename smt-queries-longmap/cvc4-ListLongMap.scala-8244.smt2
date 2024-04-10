; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100416 () Bool)

(assert start!100416)

(declare-fun b_free!25739 () Bool)

(declare-fun b_next!25739 () Bool)

(assert (=> start!100416 (= b_free!25739 (not b_next!25739))))

(declare-fun tp!90207 () Bool)

(declare-fun b_and!42365 () Bool)

(assert (=> start!100416 (= tp!90207 b_and!42365)))

(declare-fun b!1198660 () Bool)

(declare-fun res!797773 () Bool)

(declare-fun e!680877 () Bool)

(assert (=> b!1198660 (=> (not res!797773) (not e!680877))))

(declare-datatypes ((array!77665 0))(
  ( (array!77666 (arr!37477 (Array (_ BitVec 32) (_ BitVec 64))) (size!38013 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77665)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45717 0))(
  ( (V!45718 (val!15278 Int)) )
))
(declare-datatypes ((ValueCell!14512 0))(
  ( (ValueCellFull!14512 (v!17916 V!45717)) (EmptyCell!14512) )
))
(declare-datatypes ((array!77667 0))(
  ( (array!77668 (arr!37478 (Array (_ BitVec 32) ValueCell!14512)) (size!38014 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77667)

(assert (=> b!1198660 (= res!797773 (and (= (size!38014 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38013 _keys!1208) (size!38014 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198661 () Bool)

(declare-fun e!680874 () Bool)

(declare-fun tp_is_empty!30443 () Bool)

(assert (=> b!1198661 (= e!680874 tp_is_empty!30443)))

(declare-fun b!1198662 () Bool)

(declare-fun e!680876 () Bool)

(assert (=> b!1198662 (= e!680877 e!680876)))

(declare-fun res!797780 () Bool)

(assert (=> b!1198662 (=> (not res!797780) (not e!680876))))

(declare-fun lt!543557 () array!77665)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77665 (_ BitVec 32)) Bool)

(assert (=> b!1198662 (= res!797780 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543557 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198662 (= lt!543557 (array!77666 (store (arr!37477 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38013 _keys!1208)))))

(declare-fun b!1198663 () Bool)

(declare-fun res!797779 () Bool)

(assert (=> b!1198663 (=> (not res!797779) (not e!680876))))

(declare-datatypes ((List!26367 0))(
  ( (Nil!26364) (Cons!26363 (h!27572 (_ BitVec 64)) (t!39086 List!26367)) )
))
(declare-fun arrayNoDuplicates!0 (array!77665 (_ BitVec 32) List!26367) Bool)

(assert (=> b!1198663 (= res!797779 (arrayNoDuplicates!0 lt!543557 #b00000000000000000000000000000000 Nil!26364))))

(declare-fun b!1198664 () Bool)

(declare-fun res!797771 () Bool)

(assert (=> b!1198664 (=> (not res!797771) (not e!680877))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198664 (= res!797771 (validMask!0 mask!1564))))

(declare-fun b!1198665 () Bool)

(declare-fun res!797775 () Bool)

(assert (=> b!1198665 (=> (not res!797775) (not e!680877))))

(assert (=> b!1198665 (= res!797775 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26364))))

(declare-fun b!1198667 () Bool)

(declare-fun e!680873 () Bool)

(assert (=> b!1198667 (= e!680873 tp_is_empty!30443)))

(declare-fun b!1198668 () Bool)

(declare-fun res!797772 () Bool)

(assert (=> b!1198668 (=> (not res!797772) (not e!680877))))

(assert (=> b!1198668 (= res!797772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198669 () Bool)

(declare-fun e!680872 () Bool)

(assert (=> b!1198669 (= e!680876 (not e!680872))))

(declare-fun res!797778 () Bool)

(assert (=> b!1198669 (=> res!797778 e!680872)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198669 (= res!797778 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77665 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198669 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39744 0))(
  ( (Unit!39745) )
))
(declare-fun lt!543558 () Unit!39744)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77665 (_ BitVec 64) (_ BitVec 32)) Unit!39744)

(assert (=> b!1198669 (= lt!543558 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198670 () Bool)

(declare-fun res!797774 () Bool)

(assert (=> b!1198670 (=> (not res!797774) (not e!680877))))

(assert (=> b!1198670 (= res!797774 (= (select (arr!37477 _keys!1208) i!673) k!934))))

(declare-fun mapIsEmpty!47507 () Bool)

(declare-fun mapRes!47507 () Bool)

(assert (=> mapIsEmpty!47507 mapRes!47507))

(declare-fun mapNonEmpty!47507 () Bool)

(declare-fun tp!90206 () Bool)

(assert (=> mapNonEmpty!47507 (= mapRes!47507 (and tp!90206 e!680873))))

(declare-fun mapKey!47507 () (_ BitVec 32))

(declare-fun mapValue!47507 () ValueCell!14512)

(declare-fun mapRest!47507 () (Array (_ BitVec 32) ValueCell!14512))

(assert (=> mapNonEmpty!47507 (= (arr!37478 _values!996) (store mapRest!47507 mapKey!47507 mapValue!47507))))

(declare-fun b!1198671 () Bool)

(declare-fun res!797776 () Bool)

(assert (=> b!1198671 (=> (not res!797776) (not e!680877))))

(assert (=> b!1198671 (= res!797776 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38013 _keys!1208))))))

(declare-fun b!1198672 () Bool)

(assert (=> b!1198672 (= e!680872 true)))

(declare-fun zeroValue!944 () V!45717)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45717)

(declare-datatypes ((tuple2!19550 0))(
  ( (tuple2!19551 (_1!9786 (_ BitVec 64)) (_2!9786 V!45717)) )
))
(declare-datatypes ((List!26368 0))(
  ( (Nil!26365) (Cons!26364 (h!27573 tuple2!19550) (t!39087 List!26368)) )
))
(declare-datatypes ((ListLongMap!17519 0))(
  ( (ListLongMap!17520 (toList!8775 List!26368)) )
))
(declare-fun lt!543559 () ListLongMap!17519)

(declare-fun getCurrentListMapNoExtraKeys!5214 (array!77665 array!77667 (_ BitVec 32) (_ BitVec 32) V!45717 V!45717 (_ BitVec 32) Int) ListLongMap!17519)

(declare-fun dynLambda!3134 (Int (_ BitVec 64)) V!45717)

(assert (=> b!1198672 (= lt!543559 (getCurrentListMapNoExtraKeys!5214 lt!543557 (array!77668 (store (arr!37478 _values!996) i!673 (ValueCellFull!14512 (dynLambda!3134 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38014 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543556 () ListLongMap!17519)

(assert (=> b!1198672 (= lt!543556 (getCurrentListMapNoExtraKeys!5214 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198673 () Bool)

(declare-fun e!680878 () Bool)

(assert (=> b!1198673 (= e!680878 (and e!680874 mapRes!47507))))

(declare-fun condMapEmpty!47507 () Bool)

(declare-fun mapDefault!47507 () ValueCell!14512)

