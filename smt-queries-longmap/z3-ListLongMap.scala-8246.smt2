; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100426 () Bool)

(assert start!100426)

(declare-fun b_free!25749 () Bool)

(declare-fun b_next!25749 () Bool)

(assert (=> start!100426 (= b_free!25749 (not b_next!25749))))

(declare-fun tp!90236 () Bool)

(declare-fun b_and!42385 () Bool)

(assert (=> start!100426 (= tp!90236 b_and!42385)))

(declare-fun b!1198880 () Bool)

(declare-fun e!680983 () Bool)

(declare-fun e!680977 () Bool)

(assert (=> b!1198880 (= e!680983 e!680977)))

(declare-fun res!797940 () Bool)

(assert (=> b!1198880 (=> (not res!797940) (not e!680977))))

(declare-datatypes ((array!77683 0))(
  ( (array!77684 (arr!37486 (Array (_ BitVec 32) (_ BitVec 64))) (size!38022 (_ BitVec 32))) )
))
(declare-fun lt!543617 () array!77683)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77683 (_ BitVec 32)) Bool)

(assert (=> b!1198880 (= res!797940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543617 mask!1564))))

(declare-fun _keys!1208 () array!77683)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1198880 (= lt!543617 (array!77684 (store (arr!37486 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38022 _keys!1208)))))

(declare-fun b!1198881 () Bool)

(declare-fun e!680982 () Bool)

(declare-fun e!680978 () Bool)

(declare-fun mapRes!47522 () Bool)

(assert (=> b!1198881 (= e!680982 (and e!680978 mapRes!47522))))

(declare-fun condMapEmpty!47522 () Bool)

(declare-datatypes ((V!45731 0))(
  ( (V!45732 (val!15283 Int)) )
))
(declare-datatypes ((ValueCell!14517 0))(
  ( (ValueCellFull!14517 (v!17921 V!45731)) (EmptyCell!14517) )
))
(declare-datatypes ((array!77685 0))(
  ( (array!77686 (arr!37487 (Array (_ BitVec 32) ValueCell!14517)) (size!38023 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77685)

(declare-fun mapDefault!47522 () ValueCell!14517)

(assert (=> b!1198881 (= condMapEmpty!47522 (= (arr!37487 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14517)) mapDefault!47522)))))

(declare-fun b!1198882 () Bool)

(declare-fun res!797946 () Bool)

(assert (=> b!1198882 (=> (not res!797946) (not e!680983))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1198882 (= res!797946 (and (= (size!38023 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38022 _keys!1208) (size!38023 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1198883 () Bool)

(declare-fun res!797944 () Bool)

(assert (=> b!1198883 (=> (not res!797944) (not e!680983))))

(assert (=> b!1198883 (= res!797944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1198884 () Bool)

(declare-fun tp_is_empty!30453 () Bool)

(assert (=> b!1198884 (= e!680978 tp_is_empty!30453)))

(declare-fun b!1198885 () Bool)

(declare-fun e!680979 () Bool)

(assert (=> b!1198885 (= e!680979 true)))

(declare-fun zeroValue!944 () V!45731)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19558 0))(
  ( (tuple2!19559 (_1!9790 (_ BitVec 64)) (_2!9790 V!45731)) )
))
(declare-datatypes ((List!26374 0))(
  ( (Nil!26371) (Cons!26370 (h!27579 tuple2!19558) (t!39103 List!26374)) )
))
(declare-datatypes ((ListLongMap!17527 0))(
  ( (ListLongMap!17528 (toList!8779 List!26374)) )
))
(declare-fun lt!543619 () ListLongMap!17527)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45731)

(declare-fun getCurrentListMapNoExtraKeys!5218 (array!77683 array!77685 (_ BitVec 32) (_ BitVec 32) V!45731 V!45731 (_ BitVec 32) Int) ListLongMap!17527)

(declare-fun dynLambda!3138 (Int (_ BitVec 64)) V!45731)

(assert (=> b!1198885 (= lt!543619 (getCurrentListMapNoExtraKeys!5218 lt!543617 (array!77686 (store (arr!37487 _values!996) i!673 (ValueCellFull!14517 (dynLambda!3138 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38023 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543616 () ListLongMap!17527)

(assert (=> b!1198885 (= lt!543616 (getCurrentListMapNoExtraKeys!5218 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1198886 () Bool)

(declare-fun res!797936 () Bool)

(assert (=> b!1198886 (=> (not res!797936) (not e!680983))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1198886 (= res!797936 (= (select (arr!37486 _keys!1208) i!673) k0!934))))

(declare-fun b!1198887 () Bool)

(declare-fun res!797942 () Bool)

(assert (=> b!1198887 (=> (not res!797942) (not e!680983))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1198887 (= res!797942 (validKeyInArray!0 k0!934))))

(declare-fun b!1198888 () Bool)

(declare-fun res!797943 () Bool)

(assert (=> b!1198888 (=> (not res!797943) (not e!680977))))

(declare-datatypes ((List!26375 0))(
  ( (Nil!26372) (Cons!26371 (h!27580 (_ BitVec 64)) (t!39104 List!26375)) )
))
(declare-fun arrayNoDuplicates!0 (array!77683 (_ BitVec 32) List!26375) Bool)

(assert (=> b!1198888 (= res!797943 (arrayNoDuplicates!0 lt!543617 #b00000000000000000000000000000000 Nil!26372))))

(declare-fun b!1198889 () Bool)

(declare-fun res!797941 () Bool)

(assert (=> b!1198889 (=> (not res!797941) (not e!680983))))

(assert (=> b!1198889 (= res!797941 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26372))))

(declare-fun res!797938 () Bool)

(assert (=> start!100426 (=> (not res!797938) (not e!680983))))

(assert (=> start!100426 (= res!797938 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38022 _keys!1208))))))

(assert (=> start!100426 e!680983))

(assert (=> start!100426 tp_is_empty!30453))

(declare-fun array_inv!28568 (array!77683) Bool)

(assert (=> start!100426 (array_inv!28568 _keys!1208)))

(assert (=> start!100426 true))

(assert (=> start!100426 tp!90236))

(declare-fun array_inv!28569 (array!77685) Bool)

(assert (=> start!100426 (and (array_inv!28569 _values!996) e!680982)))

(declare-fun b!1198890 () Bool)

(assert (=> b!1198890 (= e!680977 (not e!680979))))

(declare-fun res!797937 () Bool)

(assert (=> b!1198890 (=> res!797937 e!680979)))

(assert (=> b!1198890 (= res!797937 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1198890 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39752 0))(
  ( (Unit!39753) )
))
(declare-fun lt!543618 () Unit!39752)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77683 (_ BitVec 64) (_ BitVec 32)) Unit!39752)

(assert (=> b!1198890 (= lt!543618 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!47522 () Bool)

(assert (=> mapIsEmpty!47522 mapRes!47522))

(declare-fun b!1198891 () Bool)

(declare-fun res!797945 () Bool)

(assert (=> b!1198891 (=> (not res!797945) (not e!680983))))

(assert (=> b!1198891 (= res!797945 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38022 _keys!1208))))))

(declare-fun b!1198892 () Bool)

(declare-fun res!797939 () Bool)

(assert (=> b!1198892 (=> (not res!797939) (not e!680983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1198892 (= res!797939 (validMask!0 mask!1564))))

(declare-fun b!1198893 () Bool)

(declare-fun e!680981 () Bool)

(assert (=> b!1198893 (= e!680981 tp_is_empty!30453)))

(declare-fun mapNonEmpty!47522 () Bool)

(declare-fun tp!90237 () Bool)

(assert (=> mapNonEmpty!47522 (= mapRes!47522 (and tp!90237 e!680981))))

(declare-fun mapValue!47522 () ValueCell!14517)

(declare-fun mapRest!47522 () (Array (_ BitVec 32) ValueCell!14517))

(declare-fun mapKey!47522 () (_ BitVec 32))

(assert (=> mapNonEmpty!47522 (= (arr!37487 _values!996) (store mapRest!47522 mapKey!47522 mapValue!47522))))

(assert (= (and start!100426 res!797938) b!1198892))

(assert (= (and b!1198892 res!797939) b!1198882))

(assert (= (and b!1198882 res!797946) b!1198883))

(assert (= (and b!1198883 res!797944) b!1198889))

(assert (= (and b!1198889 res!797941) b!1198891))

(assert (= (and b!1198891 res!797945) b!1198887))

(assert (= (and b!1198887 res!797942) b!1198886))

(assert (= (and b!1198886 res!797936) b!1198880))

(assert (= (and b!1198880 res!797940) b!1198888))

(assert (= (and b!1198888 res!797943) b!1198890))

(assert (= (and b!1198890 (not res!797937)) b!1198885))

(assert (= (and b!1198881 condMapEmpty!47522) mapIsEmpty!47522))

(assert (= (and b!1198881 (not condMapEmpty!47522)) mapNonEmpty!47522))

(get-info :version)

(assert (= (and mapNonEmpty!47522 ((_ is ValueCellFull!14517) mapValue!47522)) b!1198893))

(assert (= (and b!1198881 ((_ is ValueCellFull!14517) mapDefault!47522)) b!1198884))

(assert (= start!100426 b!1198881))

(declare-fun b_lambda!20945 () Bool)

(assert (=> (not b_lambda!20945) (not b!1198885)))

(declare-fun t!39102 () Bool)

(declare-fun tb!10549 () Bool)

(assert (=> (and start!100426 (= defaultEntry!1004 defaultEntry!1004) t!39102) tb!10549))

(declare-fun result!21675 () Bool)

(assert (=> tb!10549 (= result!21675 tp_is_empty!30453)))

(assert (=> b!1198885 t!39102))

(declare-fun b_and!42387 () Bool)

(assert (= b_and!42385 (and (=> t!39102 result!21675) b_and!42387)))

(declare-fun m!1105545 () Bool)

(assert (=> mapNonEmpty!47522 m!1105545))

(declare-fun m!1105547 () Bool)

(assert (=> b!1198880 m!1105547))

(declare-fun m!1105549 () Bool)

(assert (=> b!1198880 m!1105549))

(declare-fun m!1105551 () Bool)

(assert (=> b!1198890 m!1105551))

(declare-fun m!1105553 () Bool)

(assert (=> b!1198890 m!1105553))

(declare-fun m!1105555 () Bool)

(assert (=> b!1198886 m!1105555))

(declare-fun m!1105557 () Bool)

(assert (=> b!1198889 m!1105557))

(declare-fun m!1105559 () Bool)

(assert (=> b!1198892 m!1105559))

(declare-fun m!1105561 () Bool)

(assert (=> b!1198885 m!1105561))

(declare-fun m!1105563 () Bool)

(assert (=> b!1198885 m!1105563))

(declare-fun m!1105565 () Bool)

(assert (=> b!1198885 m!1105565))

(declare-fun m!1105567 () Bool)

(assert (=> b!1198885 m!1105567))

(declare-fun m!1105569 () Bool)

(assert (=> start!100426 m!1105569))

(declare-fun m!1105571 () Bool)

(assert (=> start!100426 m!1105571))

(declare-fun m!1105573 () Bool)

(assert (=> b!1198887 m!1105573))

(declare-fun m!1105575 () Bool)

(assert (=> b!1198883 m!1105575))

(declare-fun m!1105577 () Bool)

(assert (=> b!1198888 m!1105577))

(check-sat (not b!1198890) (not b_next!25749) tp_is_empty!30453 (not b!1198887) (not b!1198889) (not mapNonEmpty!47522) (not b!1198883) (not b!1198892) b_and!42387 (not b!1198888) (not b_lambda!20945) (not b!1198880) (not b!1198885) (not start!100426))
(check-sat b_and!42387 (not b_next!25749))
