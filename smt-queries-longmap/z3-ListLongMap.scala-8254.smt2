; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100474 () Bool)

(assert start!100474)

(declare-fun b_free!25797 () Bool)

(declare-fun b_next!25797 () Bool)

(assert (=> start!100474 (= b_free!25797 (not b_next!25797))))

(declare-fun tp!90380 () Bool)

(declare-fun b_and!42481 () Bool)

(assert (=> start!100474 (= tp!90380 b_and!42481)))

(declare-fun b!1199936 () Bool)

(declare-fun e!681481 () Bool)

(declare-fun e!681487 () Bool)

(declare-fun mapRes!47594 () Bool)

(assert (=> b!1199936 (= e!681481 (and e!681487 mapRes!47594))))

(declare-fun condMapEmpty!47594 () Bool)

(declare-datatypes ((V!45795 0))(
  ( (V!45796 (val!15307 Int)) )
))
(declare-datatypes ((ValueCell!14541 0))(
  ( (ValueCellFull!14541 (v!17945 V!45795)) (EmptyCell!14541) )
))
(declare-datatypes ((array!77777 0))(
  ( (array!77778 (arr!37533 (Array (_ BitVec 32) ValueCell!14541)) (size!38069 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77777)

(declare-fun mapDefault!47594 () ValueCell!14541)

(assert (=> b!1199936 (= condMapEmpty!47594 (= (arr!37533 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14541)) mapDefault!47594)))))

(declare-fun b!1199937 () Bool)

(declare-fun res!798732 () Bool)

(declare-fun e!681486 () Bool)

(assert (=> b!1199937 (=> (not res!798732) (not e!681486))))

(declare-datatypes ((array!77779 0))(
  ( (array!77780 (arr!37534 (Array (_ BitVec 32) (_ BitVec 64))) (size!38070 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77779)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1199937 (= res!798732 (= (select (arr!37534 _keys!1208) i!673) k0!934))))

(declare-fun b!1199938 () Bool)

(declare-fun res!798733 () Bool)

(assert (=> b!1199938 (=> (not res!798733) (not e!681486))))

(assert (=> b!1199938 (= res!798733 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38070 _keys!1208))))))

(declare-fun b!1199939 () Bool)

(declare-fun res!798728 () Bool)

(assert (=> b!1199939 (=> (not res!798728) (not e!681486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199939 (= res!798728 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!47594 () Bool)

(assert (=> mapIsEmpty!47594 mapRes!47594))

(declare-fun res!798731 () Bool)

(assert (=> start!100474 (=> (not res!798731) (not e!681486))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100474 (= res!798731 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38070 _keys!1208))))))

(assert (=> start!100474 e!681486))

(declare-fun tp_is_empty!30501 () Bool)

(assert (=> start!100474 tp_is_empty!30501))

(declare-fun array_inv!28604 (array!77779) Bool)

(assert (=> start!100474 (array_inv!28604 _keys!1208)))

(assert (=> start!100474 true))

(assert (=> start!100474 tp!90380))

(declare-fun array_inv!28605 (array!77777) Bool)

(assert (=> start!100474 (and (array_inv!28605 _values!996) e!681481)))

(declare-fun b!1199940 () Bool)

(declare-fun res!798736 () Bool)

(assert (=> b!1199940 (=> (not res!798736) (not e!681486))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77779 (_ BitVec 32)) Bool)

(assert (=> b!1199940 (= res!798736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199941 () Bool)

(declare-fun res!798734 () Bool)

(declare-fun e!681483 () Bool)

(assert (=> b!1199941 (=> (not res!798734) (not e!681483))))

(declare-fun lt!543906 () array!77779)

(declare-datatypes ((List!26412 0))(
  ( (Nil!26409) (Cons!26408 (h!27617 (_ BitVec 64)) (t!39189 List!26412)) )
))
(declare-fun arrayNoDuplicates!0 (array!77779 (_ BitVec 32) List!26412) Bool)

(assert (=> b!1199941 (= res!798734 (arrayNoDuplicates!0 lt!543906 #b00000000000000000000000000000000 Nil!26409))))

(declare-fun mapNonEmpty!47594 () Bool)

(declare-fun tp!90381 () Bool)

(declare-fun e!681482 () Bool)

(assert (=> mapNonEmpty!47594 (= mapRes!47594 (and tp!90381 e!681482))))

(declare-fun mapValue!47594 () ValueCell!14541)

(declare-fun mapKey!47594 () (_ BitVec 32))

(declare-fun mapRest!47594 () (Array (_ BitVec 32) ValueCell!14541))

(assert (=> mapNonEmpty!47594 (= (arr!37533 _values!996) (store mapRest!47594 mapKey!47594 mapValue!47594))))

(declare-fun b!1199942 () Bool)

(declare-fun e!681485 () Bool)

(assert (=> b!1199942 (= e!681485 true)))

(declare-fun zeroValue!944 () V!45795)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19594 0))(
  ( (tuple2!19595 (_1!9808 (_ BitVec 64)) (_2!9808 V!45795)) )
))
(declare-datatypes ((List!26413 0))(
  ( (Nil!26410) (Cons!26409 (h!27618 tuple2!19594) (t!39190 List!26413)) )
))
(declare-datatypes ((ListLongMap!17563 0))(
  ( (ListLongMap!17564 (toList!8797 List!26413)) )
))
(declare-fun lt!543905 () ListLongMap!17563)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45795)

(declare-fun getCurrentListMapNoExtraKeys!5236 (array!77779 array!77777 (_ BitVec 32) (_ BitVec 32) V!45795 V!45795 (_ BitVec 32) Int) ListLongMap!17563)

(declare-fun dynLambda!3156 (Int (_ BitVec 64)) V!45795)

(assert (=> b!1199942 (= lt!543905 (getCurrentListMapNoExtraKeys!5236 lt!543906 (array!77778 (store (arr!37533 _values!996) i!673 (ValueCellFull!14541 (dynLambda!3156 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38069 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543907 () ListLongMap!17563)

(assert (=> b!1199942 (= lt!543907 (getCurrentListMapNoExtraKeys!5236 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199943 () Bool)

(assert (=> b!1199943 (= e!681483 (not e!681485))))

(declare-fun res!798730 () Bool)

(assert (=> b!1199943 (=> res!798730 e!681485)))

(assert (=> b!1199943 (= res!798730 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199943 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39784 0))(
  ( (Unit!39785) )
))
(declare-fun lt!543904 () Unit!39784)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77779 (_ BitVec 64) (_ BitVec 32)) Unit!39784)

(assert (=> b!1199943 (= lt!543904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199944 () Bool)

(assert (=> b!1199944 (= e!681482 tp_is_empty!30501)))

(declare-fun b!1199945 () Bool)

(declare-fun res!798729 () Bool)

(assert (=> b!1199945 (=> (not res!798729) (not e!681486))))

(assert (=> b!1199945 (= res!798729 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26409))))

(declare-fun b!1199946 () Bool)

(declare-fun res!798737 () Bool)

(assert (=> b!1199946 (=> (not res!798737) (not e!681486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199946 (= res!798737 (validMask!0 mask!1564))))

(declare-fun b!1199947 () Bool)

(declare-fun res!798735 () Bool)

(assert (=> b!1199947 (=> (not res!798735) (not e!681486))))

(assert (=> b!1199947 (= res!798735 (and (= (size!38069 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38070 _keys!1208) (size!38069 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1199948 () Bool)

(assert (=> b!1199948 (= e!681487 tp_is_empty!30501)))

(declare-fun b!1199949 () Bool)

(assert (=> b!1199949 (= e!681486 e!681483)))

(declare-fun res!798738 () Bool)

(assert (=> b!1199949 (=> (not res!798738) (not e!681483))))

(assert (=> b!1199949 (= res!798738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543906 mask!1564))))

(assert (=> b!1199949 (= lt!543906 (array!77780 (store (arr!37534 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38070 _keys!1208)))))

(assert (= (and start!100474 res!798731) b!1199946))

(assert (= (and b!1199946 res!798737) b!1199947))

(assert (= (and b!1199947 res!798735) b!1199940))

(assert (= (and b!1199940 res!798736) b!1199945))

(assert (= (and b!1199945 res!798729) b!1199938))

(assert (= (and b!1199938 res!798733) b!1199939))

(assert (= (and b!1199939 res!798728) b!1199937))

(assert (= (and b!1199937 res!798732) b!1199949))

(assert (= (and b!1199949 res!798738) b!1199941))

(assert (= (and b!1199941 res!798734) b!1199943))

(assert (= (and b!1199943 (not res!798730)) b!1199942))

(assert (= (and b!1199936 condMapEmpty!47594) mapIsEmpty!47594))

(assert (= (and b!1199936 (not condMapEmpty!47594)) mapNonEmpty!47594))

(get-info :version)

(assert (= (and mapNonEmpty!47594 ((_ is ValueCellFull!14541) mapValue!47594)) b!1199944))

(assert (= (and b!1199936 ((_ is ValueCellFull!14541) mapDefault!47594)) b!1199948))

(assert (= start!100474 b!1199936))

(declare-fun b_lambda!20993 () Bool)

(assert (=> (not b_lambda!20993) (not b!1199942)))

(declare-fun t!39188 () Bool)

(declare-fun tb!10597 () Bool)

(assert (=> (and start!100474 (= defaultEntry!1004 defaultEntry!1004) t!39188) tb!10597))

(declare-fun result!21771 () Bool)

(assert (=> tb!10597 (= result!21771 tp_is_empty!30501)))

(assert (=> b!1199942 t!39188))

(declare-fun b_and!42483 () Bool)

(assert (= b_and!42481 (and (=> t!39188 result!21771) b_and!42483)))

(declare-fun m!1106361 () Bool)

(assert (=> start!100474 m!1106361))

(declare-fun m!1106363 () Bool)

(assert (=> start!100474 m!1106363))

(declare-fun m!1106365 () Bool)

(assert (=> b!1199941 m!1106365))

(declare-fun m!1106367 () Bool)

(assert (=> b!1199945 m!1106367))

(declare-fun m!1106369 () Bool)

(assert (=> b!1199937 m!1106369))

(declare-fun m!1106371 () Bool)

(assert (=> b!1199942 m!1106371))

(declare-fun m!1106373 () Bool)

(assert (=> b!1199942 m!1106373))

(declare-fun m!1106375 () Bool)

(assert (=> b!1199942 m!1106375))

(declare-fun m!1106377 () Bool)

(assert (=> b!1199942 m!1106377))

(declare-fun m!1106379 () Bool)

(assert (=> mapNonEmpty!47594 m!1106379))

(declare-fun m!1106381 () Bool)

(assert (=> b!1199940 m!1106381))

(declare-fun m!1106383 () Bool)

(assert (=> b!1199949 m!1106383))

(declare-fun m!1106385 () Bool)

(assert (=> b!1199949 m!1106385))

(declare-fun m!1106387 () Bool)

(assert (=> b!1199943 m!1106387))

(declare-fun m!1106389 () Bool)

(assert (=> b!1199943 m!1106389))

(declare-fun m!1106391 () Bool)

(assert (=> b!1199946 m!1106391))

(declare-fun m!1106393 () Bool)

(assert (=> b!1199939 m!1106393))

(check-sat tp_is_empty!30501 (not b!1199942) (not start!100474) (not b!1199943) (not b_next!25797) (not b!1199941) (not b!1199940) (not b_lambda!20993) (not b!1199949) (not b!1199939) (not b!1199946) (not mapNonEmpty!47594) (not b!1199945) b_and!42483)
(check-sat b_and!42483 (not b_next!25797))
