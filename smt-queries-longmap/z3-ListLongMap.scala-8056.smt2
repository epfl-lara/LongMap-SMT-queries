; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99412 () Bool)

(assert start!99412)

(declare-fun b_free!24781 () Bool)

(declare-fun b_next!24781 () Bool)

(assert (=> start!99412 (= b_free!24781 (not b_next!24781))))

(declare-fun tp!87053 () Bool)

(declare-fun b_and!40413 () Bool)

(assert (=> start!99412 (= tp!87053 b_and!40413)))

(declare-fun b!1168696 () Bool)

(declare-fun e!664368 () Bool)

(declare-fun e!664366 () Bool)

(assert (=> b!1168696 (= e!664368 e!664366)))

(declare-fun res!774941 () Bool)

(assert (=> b!1168696 (=> (not res!774941) (not e!664366))))

(declare-datatypes ((array!75497 0))(
  ( (array!75498 (arr!36393 (Array (_ BitVec 32) (_ BitVec 64))) (size!36930 (_ BitVec 32))) )
))
(declare-fun lt!526109 () array!75497)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75497 (_ BitVec 32)) Bool)

(assert (=> b!1168696 (= res!774941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526109 mask!1564))))

(declare-fun _keys!1208 () array!75497)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1168696 (= lt!526109 (array!75498 (store (arr!36393 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36930 _keys!1208)))))

(declare-fun b!1168697 () Bool)

(declare-fun res!774944 () Bool)

(assert (=> b!1168697 (=> (not res!774944) (not e!664368))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1168697 (= res!774944 (= (select (arr!36393 _keys!1208) i!673) k0!934))))

(declare-fun b!1168698 () Bool)

(declare-fun res!774949 () Bool)

(assert (=> b!1168698 (=> (not res!774949) (not e!664368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1168698 (= res!774949 (validKeyInArray!0 k0!934))))

(declare-fun b!1168699 () Bool)

(declare-fun res!774940 () Bool)

(assert (=> b!1168699 (=> (not res!774940) (not e!664368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1168699 (= res!774940 (validMask!0 mask!1564))))

(declare-fun b!1168700 () Bool)

(declare-fun e!664367 () Bool)

(assert (=> b!1168700 (= e!664367 true)))

(declare-datatypes ((V!44209 0))(
  ( (V!44210 (val!14712 Int)) )
))
(declare-fun zeroValue!944 () V!44209)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13946 0))(
  ( (ValueCellFull!13946 (v!17345 V!44209)) (EmptyCell!13946) )
))
(declare-datatypes ((array!75499 0))(
  ( (array!75500 (arr!36394 (Array (_ BitVec 32) ValueCell!13946)) (size!36931 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75499)

(declare-fun minValue!944 () V!44209)

(declare-fun lt!526108 () array!75499)

(declare-datatypes ((tuple2!18802 0))(
  ( (tuple2!18803 (_1!9412 (_ BitVec 64)) (_2!9412 V!44209)) )
))
(declare-datatypes ((List!25543 0))(
  ( (Nil!25540) (Cons!25539 (h!26757 tuple2!18802) (t!37308 List!25543)) )
))
(declare-datatypes ((ListLongMap!16779 0))(
  ( (ListLongMap!16780 (toList!8405 List!25543)) )
))
(declare-fun getCurrentListMapNoExtraKeys!4896 (array!75497 array!75499 (_ BitVec 32) (_ BitVec 32) V!44209 V!44209 (_ BitVec 32) Int) ListLongMap!16779)

(declare-fun -!1467 (ListLongMap!16779 (_ BitVec 64)) ListLongMap!16779)

(assert (=> b!1168700 (= (getCurrentListMapNoExtraKeys!4896 lt!526109 lt!526108 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1467 (getCurrentListMapNoExtraKeys!4896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!38505 0))(
  ( (Unit!38506) )
))
(declare-fun lt!526111 () Unit!38505)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!692 (array!75497 array!75499 (_ BitVec 32) (_ BitVec 32) V!44209 V!44209 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38505)

(assert (=> b!1168700 (= lt!526111 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!692 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1168701 () Bool)

(declare-fun res!774945 () Bool)

(assert (=> b!1168701 (=> (not res!774945) (not e!664368))))

(declare-datatypes ((List!25544 0))(
  ( (Nil!25541) (Cons!25540 (h!26758 (_ BitVec 64)) (t!37309 List!25544)) )
))
(declare-fun arrayNoDuplicates!0 (array!75497 (_ BitVec 32) List!25544) Bool)

(assert (=> b!1168701 (= res!774945 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25541))))

(declare-fun b!1168702 () Bool)

(declare-fun res!774942 () Bool)

(assert (=> b!1168702 (=> (not res!774942) (not e!664366))))

(assert (=> b!1168702 (= res!774942 (arrayNoDuplicates!0 lt!526109 #b00000000000000000000000000000000 Nil!25541))))

(declare-fun b!1168703 () Bool)

(declare-fun e!664364 () Bool)

(assert (=> b!1168703 (= e!664364 e!664367)))

(declare-fun res!774943 () Bool)

(assert (=> b!1168703 (=> res!774943 e!664367)))

(assert (=> b!1168703 (= res!774943 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526107 () ListLongMap!16779)

(assert (=> b!1168703 (= lt!526107 (getCurrentListMapNoExtraKeys!4896 lt!526109 lt!526108 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2884 (Int (_ BitVec 64)) V!44209)

(assert (=> b!1168703 (= lt!526108 (array!75500 (store (arr!36394 _values!996) i!673 (ValueCellFull!13946 (dynLambda!2884 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36931 _values!996)))))

(declare-fun lt!526110 () ListLongMap!16779)

(assert (=> b!1168703 (= lt!526110 (getCurrentListMapNoExtraKeys!4896 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1168704 () Bool)

(declare-fun res!774948 () Bool)

(assert (=> b!1168704 (=> (not res!774948) (not e!664368))))

(assert (=> b!1168704 (= res!774948 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36930 _keys!1208))))))

(declare-fun b!1168705 () Bool)

(declare-fun e!664362 () Bool)

(declare-fun tp_is_empty!29311 () Bool)

(assert (=> b!1168705 (= e!664362 tp_is_empty!29311)))

(declare-fun b!1168706 () Bool)

(assert (=> b!1168706 (= e!664366 (not e!664364))))

(declare-fun res!774946 () Bool)

(assert (=> b!1168706 (=> res!774946 e!664364)))

(assert (=> b!1168706 (= res!774946 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75497 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1168706 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!526106 () Unit!38505)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75497 (_ BitVec 64) (_ BitVec 32)) Unit!38505)

(assert (=> b!1168706 (= lt!526106 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1168707 () Bool)

(declare-fun res!774947 () Bool)

(assert (=> b!1168707 (=> (not res!774947) (not e!664368))))

(assert (=> b!1168707 (= res!774947 (and (= (size!36931 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36930 _keys!1208) (size!36931 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1168708 () Bool)

(declare-fun e!664369 () Bool)

(declare-fun e!664365 () Bool)

(declare-fun mapRes!45791 () Bool)

(assert (=> b!1168708 (= e!664369 (and e!664365 mapRes!45791))))

(declare-fun condMapEmpty!45791 () Bool)

(declare-fun mapDefault!45791 () ValueCell!13946)

(assert (=> b!1168708 (= condMapEmpty!45791 (= (arr!36394 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13946)) mapDefault!45791)))))

(declare-fun mapNonEmpty!45791 () Bool)

(declare-fun tp!87054 () Bool)

(assert (=> mapNonEmpty!45791 (= mapRes!45791 (and tp!87054 e!664362))))

(declare-fun mapKey!45791 () (_ BitVec 32))

(declare-fun mapValue!45791 () ValueCell!13946)

(declare-fun mapRest!45791 () (Array (_ BitVec 32) ValueCell!13946))

(assert (=> mapNonEmpty!45791 (= (arr!36394 _values!996) (store mapRest!45791 mapKey!45791 mapValue!45791))))

(declare-fun res!774951 () Bool)

(assert (=> start!99412 (=> (not res!774951) (not e!664368))))

(assert (=> start!99412 (= res!774951 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36930 _keys!1208))))))

(assert (=> start!99412 e!664368))

(assert (=> start!99412 tp_is_empty!29311))

(declare-fun array_inv!27900 (array!75497) Bool)

(assert (=> start!99412 (array_inv!27900 _keys!1208)))

(assert (=> start!99412 true))

(assert (=> start!99412 tp!87053))

(declare-fun array_inv!27901 (array!75499) Bool)

(assert (=> start!99412 (and (array_inv!27901 _values!996) e!664369)))

(declare-fun mapIsEmpty!45791 () Bool)

(assert (=> mapIsEmpty!45791 mapRes!45791))

(declare-fun b!1168709 () Bool)

(declare-fun res!774950 () Bool)

(assert (=> b!1168709 (=> (not res!774950) (not e!664368))))

(assert (=> b!1168709 (= res!774950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1168710 () Bool)

(assert (=> b!1168710 (= e!664365 tp_is_empty!29311)))

(assert (= (and start!99412 res!774951) b!1168699))

(assert (= (and b!1168699 res!774940) b!1168707))

(assert (= (and b!1168707 res!774947) b!1168709))

(assert (= (and b!1168709 res!774950) b!1168701))

(assert (= (and b!1168701 res!774945) b!1168704))

(assert (= (and b!1168704 res!774948) b!1168698))

(assert (= (and b!1168698 res!774949) b!1168697))

(assert (= (and b!1168697 res!774944) b!1168696))

(assert (= (and b!1168696 res!774941) b!1168702))

(assert (= (and b!1168702 res!774942) b!1168706))

(assert (= (and b!1168706 (not res!774946)) b!1168703))

(assert (= (and b!1168703 (not res!774943)) b!1168700))

(assert (= (and b!1168708 condMapEmpty!45791) mapIsEmpty!45791))

(assert (= (and b!1168708 (not condMapEmpty!45791)) mapNonEmpty!45791))

(get-info :version)

(assert (= (and mapNonEmpty!45791 ((_ is ValueCellFull!13946) mapValue!45791)) b!1168705))

(assert (= (and b!1168708 ((_ is ValueCellFull!13946) mapDefault!45791)) b!1168710))

(assert (= start!99412 b!1168708))

(declare-fun b_lambda!19881 () Bool)

(assert (=> (not b_lambda!19881) (not b!1168703)))

(declare-fun t!37307 () Bool)

(declare-fun tb!9585 () Bool)

(assert (=> (and start!99412 (= defaultEntry!1004 defaultEntry!1004) t!37307) tb!9585))

(declare-fun result!19743 () Bool)

(assert (=> tb!9585 (= result!19743 tp_is_empty!29311)))

(assert (=> b!1168703 t!37307))

(declare-fun b_and!40415 () Bool)

(assert (= b_and!40413 (and (=> t!37307 result!19743) b_and!40415)))

(declare-fun m!1076915 () Bool)

(assert (=> mapNonEmpty!45791 m!1076915))

(declare-fun m!1076917 () Bool)

(assert (=> b!1168706 m!1076917))

(declare-fun m!1076919 () Bool)

(assert (=> b!1168706 m!1076919))

(declare-fun m!1076921 () Bool)

(assert (=> b!1168700 m!1076921))

(declare-fun m!1076923 () Bool)

(assert (=> b!1168700 m!1076923))

(assert (=> b!1168700 m!1076923))

(declare-fun m!1076925 () Bool)

(assert (=> b!1168700 m!1076925))

(declare-fun m!1076927 () Bool)

(assert (=> b!1168700 m!1076927))

(declare-fun m!1076929 () Bool)

(assert (=> b!1168701 m!1076929))

(declare-fun m!1076931 () Bool)

(assert (=> b!1168699 m!1076931))

(declare-fun m!1076933 () Bool)

(assert (=> b!1168702 m!1076933))

(declare-fun m!1076935 () Bool)

(assert (=> b!1168703 m!1076935))

(declare-fun m!1076937 () Bool)

(assert (=> b!1168703 m!1076937))

(declare-fun m!1076939 () Bool)

(assert (=> b!1168703 m!1076939))

(declare-fun m!1076941 () Bool)

(assert (=> b!1168703 m!1076941))

(declare-fun m!1076943 () Bool)

(assert (=> b!1168709 m!1076943))

(declare-fun m!1076945 () Bool)

(assert (=> b!1168698 m!1076945))

(declare-fun m!1076947 () Bool)

(assert (=> b!1168697 m!1076947))

(declare-fun m!1076949 () Bool)

(assert (=> b!1168696 m!1076949))

(declare-fun m!1076951 () Bool)

(assert (=> b!1168696 m!1076951))

(declare-fun m!1076953 () Bool)

(assert (=> start!99412 m!1076953))

(declare-fun m!1076955 () Bool)

(assert (=> start!99412 m!1076955))

(check-sat b_and!40415 (not b!1168709) (not b!1168696) (not start!99412) (not b_next!24781) (not b!1168698) (not mapNonEmpty!45791) tp_is_empty!29311 (not b!1168702) (not b!1168700) (not b!1168703) (not b!1168701) (not b!1168699) (not b!1168706) (not b_lambda!19881))
(check-sat b_and!40415 (not b_next!24781))
