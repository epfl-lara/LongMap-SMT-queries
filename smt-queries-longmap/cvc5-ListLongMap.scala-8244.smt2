; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100412 () Bool)

(assert start!100412)

(declare-fun b_free!25735 () Bool)

(declare-fun b_next!25735 () Bool)

(assert (=> start!100412 (= b_free!25735 (not b_next!25735))))

(declare-fun tp!90195 () Bool)

(declare-fun b_and!42357 () Bool)

(assert (=> start!100412 (= tp!90195 b_and!42357)))

(declare-fun b!1198572 () Bool)

(declare-fun res!797707 () Bool)

(declare-fun e!680834 () Bool)

(assert (=> b!1198572 (=> (not res!797707) (not e!680834))))

(declare-datatypes ((array!77657 0))(
  ( (array!77658 (arr!37473 (Array (_ BitVec 32) (_ BitVec 64))) (size!38009 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45713 0))(
  ( (V!45714 (val!15276 Int)) )
))
(declare-datatypes ((ValueCell!14510 0))(
  ( (ValueCellFull!14510 (v!17914 V!45713)) (EmptyCell!14510) )
))
(declare-datatypes ((array!77659 0))(
  ( (array!77660 (arr!37474 (Array (_ BitVec 32) ValueCell!14510)) (size!38010 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77659)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1198572 (= res!797707 (and (= (size!38010 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38009 _keys!1208) (size!38010 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198574 () Bool)

(declare-fun e!680836 () Bool)

(declare-fun tp_is_empty!30439 () Bool)

(assert (=> b!1198574 (= e!680836 tp_is_empty!30439)))

(declare-fun b!1198575 () Bool)

(declare-fun res!797711 () Bool)

(assert (=> b!1198575 (=> (not res!797711) (not e!680834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198575 (= res!797711 (validMask!0 mask!1564))))

(declare-fun b!1198576 () Bool)

(declare-fun res!797714 () Bool)

(assert (=> b!1198576 (=> (not res!797714) (not e!680834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77657 (_ BitVec 32)) Bool)

(assert (=> b!1198576 (= res!797714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198577 () Bool)

(declare-fun res!797705 () Bool)

(assert (=> b!1198577 (=> (not res!797705) (not e!680834))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198577 (= res!797705 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38009 _keys!1208))))))

(declare-fun b!1198578 () Bool)

(declare-fun e!680833 () Bool)

(assert (=> b!1198578 (= e!680833 tp_is_empty!30439)))

(declare-fun b!1198579 () Bool)

(declare-fun e!680835 () Bool)

(declare-fun e!680832 () Bool)

(assert (=> b!1198579 (= e!680835 (not e!680832))))

(declare-fun res!797713 () Bool)

(assert (=> b!1198579 (=> res!797713 e!680832)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1198579 (= res!797713 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!77657 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198579 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39740 0))(
  ( (Unit!39741) )
))
(declare-fun lt!543533 () Unit!39740)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77657 (_ BitVec 64) (_ BitVec 32)) Unit!39740)

(assert (=> b!1198579 (= lt!543533 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1198580 () Bool)

(declare-fun res!797706 () Bool)

(assert (=> b!1198580 (=> (not res!797706) (not e!680834))))

(declare-datatypes ((List!26363 0))(
  ( (Nil!26360) (Cons!26359 (h!27568 (_ BitVec 64)) (t!39078 List!26363)) )
))
(declare-fun arrayNoDuplicates!0 (array!77657 (_ BitVec 32) List!26363) Bool)

(assert (=> b!1198580 (= res!797706 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26360))))

(declare-fun b!1198573 () Bool)

(declare-fun res!797710 () Bool)

(assert (=> b!1198573 (=> (not res!797710) (not e!680834))))

(assert (=> b!1198573 (= res!797710 (= (select (arr!37473 _keys!1208) i!673) k!934))))

(declare-fun res!797708 () Bool)

(assert (=> start!100412 (=> (not res!797708) (not e!680834))))

(assert (=> start!100412 (= res!797708 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38009 _keys!1208))))))

(assert (=> start!100412 e!680834))

(assert (=> start!100412 tp_is_empty!30439))

(declare-fun array_inv!28560 (array!77657) Bool)

(assert (=> start!100412 (array_inv!28560 _keys!1208)))

(assert (=> start!100412 true))

(assert (=> start!100412 tp!90195))

(declare-fun e!680830 () Bool)

(declare-fun array_inv!28561 (array!77659) Bool)

(assert (=> start!100412 (and (array_inv!28561 _values!996) e!680830)))

(declare-fun b!1198581 () Bool)

(assert (=> b!1198581 (= e!680834 e!680835)))

(declare-fun res!797709 () Bool)

(assert (=> b!1198581 (=> (not res!797709) (not e!680835))))

(declare-fun lt!543532 () array!77657)

(assert (=> b!1198581 (= res!797709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543532 mask!1564))))

(assert (=> b!1198581 (= lt!543532 (array!77658 (store (arr!37473 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38009 _keys!1208)))))

(declare-fun mapNonEmpty!47501 () Bool)

(declare-fun mapRes!47501 () Bool)

(declare-fun tp!90194 () Bool)

(assert (=> mapNonEmpty!47501 (= mapRes!47501 (and tp!90194 e!680836))))

(declare-fun mapValue!47501 () ValueCell!14510)

(declare-fun mapRest!47501 () (Array (_ BitVec 32) ValueCell!14510))

(declare-fun mapKey!47501 () (_ BitVec 32))

(assert (=> mapNonEmpty!47501 (= (arr!37474 _values!996) (store mapRest!47501 mapKey!47501 mapValue!47501))))

(declare-fun b!1198582 () Bool)

(assert (=> b!1198582 (= e!680832 true)))

(declare-fun zeroValue!944 () V!45713)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19546 0))(
  ( (tuple2!19547 (_1!9784 (_ BitVec 64)) (_2!9784 V!45713)) )
))
(declare-datatypes ((List!26364 0))(
  ( (Nil!26361) (Cons!26360 (h!27569 tuple2!19546) (t!39079 List!26364)) )
))
(declare-datatypes ((ListLongMap!17515 0))(
  ( (ListLongMap!17516 (toList!8773 List!26364)) )
))
(declare-fun lt!543534 () ListLongMap!17515)

(declare-fun minValue!944 () V!45713)

(declare-fun getCurrentListMapNoExtraKeys!5212 (array!77657 array!77659 (_ BitVec 32) (_ BitVec 32) V!45713 V!45713 (_ BitVec 32) Int) ListLongMap!17515)

(declare-fun dynLambda!3132 (Int (_ BitVec 64)) V!45713)

(assert (=> b!1198582 (= lt!543534 (getCurrentListMapNoExtraKeys!5212 lt!543532 (array!77660 (store (arr!37474 _values!996) i!673 (ValueCellFull!14510 (dynLambda!3132 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38010 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543535 () ListLongMap!17515)

(assert (=> b!1198582 (= lt!543535 (getCurrentListMapNoExtraKeys!5212 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198583 () Bool)

(assert (=> b!1198583 (= e!680830 (and e!680833 mapRes!47501))))

(declare-fun condMapEmpty!47501 () Bool)

(declare-fun mapDefault!47501 () ValueCell!14510)

