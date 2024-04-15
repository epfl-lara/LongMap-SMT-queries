; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99068 () Bool)

(assert start!99068)

(declare-fun b_free!24679 () Bool)

(declare-fun b_next!24679 () Bool)

(assert (=> start!99068 (= b_free!24679 (not b_next!24679))))

(declare-fun tp!86747 () Bool)

(declare-fun b_and!40185 () Bool)

(assert (=> start!99068 (= tp!86747 b_and!40185)))

(declare-fun b!1164938 () Bool)

(declare-fun e!662282 () Bool)

(assert (=> b!1164938 (= e!662282 true)))

(declare-datatypes ((V!44073 0))(
  ( (V!44074 (val!14661 Int)) )
))
(declare-fun zeroValue!944 () V!44073)

(declare-datatypes ((tuple2!18784 0))(
  ( (tuple2!18785 (_1!9403 (_ BitVec 64)) (_2!9403 V!44073)) )
))
(declare-datatypes ((List!25501 0))(
  ( (Nil!25498) (Cons!25497 (h!26706 tuple2!18784) (t!37163 List!25501)) )
))
(declare-datatypes ((ListLongMap!16753 0))(
  ( (ListLongMap!16754 (toList!8392 List!25501)) )
))
(declare-fun lt!524619 () ListLongMap!16753)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13895 0))(
  ( (ValueCellFull!13895 (v!17297 V!44073)) (EmptyCell!13895) )
))
(declare-datatypes ((array!75174 0))(
  ( (array!75175 (arr!36238 (Array (_ BitVec 32) ValueCell!13895)) (size!36776 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75174)

(declare-fun minValue!944 () V!44073)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!75176 0))(
  ( (array!75177 (arr!36239 (Array (_ BitVec 32) (_ BitVec 64))) (size!36777 (_ BitVec 32))) )
))
(declare-fun lt!524617 () array!75176)

(declare-fun getCurrentListMapNoExtraKeys!4868 (array!75176 array!75174 (_ BitVec 32) (_ BitVec 32) V!44073 V!44073 (_ BitVec 32) Int) ListLongMap!16753)

(declare-fun dynLambda!2801 (Int (_ BitVec 64)) V!44073)

(assert (=> b!1164938 (= lt!524619 (getCurrentListMapNoExtraKeys!4868 lt!524617 (array!75175 (store (arr!36238 _values!996) i!673 (ValueCellFull!13895 (dynLambda!2801 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36776 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!75176)

(declare-fun lt!524618 () ListLongMap!16753)

(assert (=> b!1164938 (= lt!524618 (getCurrentListMapNoExtraKeys!4868 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!772588 () Bool)

(declare-fun e!662283 () Bool)

(assert (=> start!99068 (=> (not res!772588) (not e!662283))))

(assert (=> start!99068 (= res!772588 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36777 _keys!1208))))))

(assert (=> start!99068 e!662283))

(declare-fun tp_is_empty!29209 () Bool)

(assert (=> start!99068 tp_is_empty!29209))

(declare-fun array_inv!27818 (array!75176) Bool)

(assert (=> start!99068 (array_inv!27818 _keys!1208)))

(assert (=> start!99068 true))

(assert (=> start!99068 tp!86747))

(declare-fun e!662284 () Bool)

(declare-fun array_inv!27819 (array!75174) Bool)

(assert (=> start!99068 (and (array_inv!27819 _values!996) e!662284)))

(declare-fun b!1164939 () Bool)

(declare-fun e!662280 () Bool)

(declare-fun mapRes!45638 () Bool)

(assert (=> b!1164939 (= e!662284 (and e!662280 mapRes!45638))))

(declare-fun condMapEmpty!45638 () Bool)

(declare-fun mapDefault!45638 () ValueCell!13895)

(assert (=> b!1164939 (= condMapEmpty!45638 (= (arr!36238 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13895)) mapDefault!45638)))))

(declare-fun b!1164940 () Bool)

(declare-fun res!772591 () Bool)

(assert (=> b!1164940 (=> (not res!772591) (not e!662283))))

(assert (=> b!1164940 (= res!772591 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36777 _keys!1208))))))

(declare-fun b!1164941 () Bool)

(declare-fun e!662281 () Bool)

(assert (=> b!1164941 (= e!662281 tp_is_empty!29209)))

(declare-fun b!1164942 () Bool)

(declare-fun res!772586 () Bool)

(assert (=> b!1164942 (=> (not res!772586) (not e!662283))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1164942 (= res!772586 (validKeyInArray!0 k0!934))))

(declare-fun mapNonEmpty!45638 () Bool)

(declare-fun tp!86748 () Bool)

(assert (=> mapNonEmpty!45638 (= mapRes!45638 (and tp!86748 e!662281))))

(declare-fun mapKey!45638 () (_ BitVec 32))

(declare-fun mapValue!45638 () ValueCell!13895)

(declare-fun mapRest!45638 () (Array (_ BitVec 32) ValueCell!13895))

(assert (=> mapNonEmpty!45638 (= (arr!36238 _values!996) (store mapRest!45638 mapKey!45638 mapValue!45638))))

(declare-fun b!1164943 () Bool)

(declare-fun res!772583 () Bool)

(assert (=> b!1164943 (=> (not res!772583) (not e!662283))))

(assert (=> b!1164943 (= res!772583 (= (select (arr!36239 _keys!1208) i!673) k0!934))))

(declare-fun b!1164944 () Bool)

(declare-fun res!772592 () Bool)

(assert (=> b!1164944 (=> (not res!772592) (not e!662283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1164944 (= res!772592 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!45638 () Bool)

(assert (=> mapIsEmpty!45638 mapRes!45638))

(declare-fun b!1164945 () Bool)

(declare-fun res!772587 () Bool)

(assert (=> b!1164945 (=> (not res!772587) (not e!662283))))

(declare-datatypes ((List!25502 0))(
  ( (Nil!25499) (Cons!25498 (h!26707 (_ BitVec 64)) (t!37164 List!25502)) )
))
(declare-fun arrayNoDuplicates!0 (array!75176 (_ BitVec 32) List!25502) Bool)

(assert (=> b!1164945 (= res!772587 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25499))))

(declare-fun b!1164946 () Bool)

(declare-fun res!772589 () Bool)

(declare-fun e!662286 () Bool)

(assert (=> b!1164946 (=> (not res!772589) (not e!662286))))

(assert (=> b!1164946 (= res!772589 (arrayNoDuplicates!0 lt!524617 #b00000000000000000000000000000000 Nil!25499))))

(declare-fun b!1164947 () Bool)

(assert (=> b!1164947 (= e!662283 e!662286)))

(declare-fun res!772582 () Bool)

(assert (=> b!1164947 (=> (not res!772582) (not e!662286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75176 (_ BitVec 32)) Bool)

(assert (=> b!1164947 (= res!772582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524617 mask!1564))))

(assert (=> b!1164947 (= lt!524617 (array!75177 (store (arr!36239 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36777 _keys!1208)))))

(declare-fun b!1164948 () Bool)

(assert (=> b!1164948 (= e!662286 (not e!662282))))

(declare-fun res!772590 () Bool)

(assert (=> b!1164948 (=> res!772590 e!662282)))

(assert (=> b!1164948 (= res!772590 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75176 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1164948 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38279 0))(
  ( (Unit!38280) )
))
(declare-fun lt!524616 () Unit!38279)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75176 (_ BitVec 64) (_ BitVec 32)) Unit!38279)

(assert (=> b!1164948 (= lt!524616 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1164949 () Bool)

(assert (=> b!1164949 (= e!662280 tp_is_empty!29209)))

(declare-fun b!1164950 () Bool)

(declare-fun res!772584 () Bool)

(assert (=> b!1164950 (=> (not res!772584) (not e!662283))))

(assert (=> b!1164950 (= res!772584 (and (= (size!36776 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36777 _keys!1208) (size!36776 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1164951 () Bool)

(declare-fun res!772585 () Bool)

(assert (=> b!1164951 (=> (not res!772585) (not e!662283))))

(assert (=> b!1164951 (= res!772585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99068 res!772588) b!1164944))

(assert (= (and b!1164944 res!772592) b!1164950))

(assert (= (and b!1164950 res!772584) b!1164951))

(assert (= (and b!1164951 res!772585) b!1164945))

(assert (= (and b!1164945 res!772587) b!1164940))

(assert (= (and b!1164940 res!772591) b!1164942))

(assert (= (and b!1164942 res!772586) b!1164943))

(assert (= (and b!1164943 res!772583) b!1164947))

(assert (= (and b!1164947 res!772582) b!1164946))

(assert (= (and b!1164946 res!772589) b!1164948))

(assert (= (and b!1164948 (not res!772590)) b!1164938))

(assert (= (and b!1164939 condMapEmpty!45638) mapIsEmpty!45638))

(assert (= (and b!1164939 (not condMapEmpty!45638)) mapNonEmpty!45638))

(get-info :version)

(assert (= (and mapNonEmpty!45638 ((_ is ValueCellFull!13895) mapValue!45638)) b!1164941))

(assert (= (and b!1164939 ((_ is ValueCellFull!13895) mapDefault!45638)) b!1164949))

(assert (= start!99068 b!1164939))

(declare-fun b_lambda!19767 () Bool)

(assert (=> (not b_lambda!19767) (not b!1164938)))

(declare-fun t!37162 () Bool)

(declare-fun tb!9483 () Bool)

(assert (=> (and start!99068 (= defaultEntry!1004 defaultEntry!1004) t!37162) tb!9483))

(declare-fun result!19539 () Bool)

(assert (=> tb!9483 (= result!19539 tp_is_empty!29209)))

(assert (=> b!1164938 t!37162))

(declare-fun b_and!40187 () Bool)

(assert (= b_and!40185 (and (=> t!37162 result!19539) b_and!40187)))

(declare-fun m!1072735 () Bool)

(assert (=> b!1164951 m!1072735))

(declare-fun m!1072737 () Bool)

(assert (=> mapNonEmpty!45638 m!1072737))

(declare-fun m!1072739 () Bool)

(assert (=> b!1164944 m!1072739))

(declare-fun m!1072741 () Bool)

(assert (=> start!99068 m!1072741))

(declare-fun m!1072743 () Bool)

(assert (=> start!99068 m!1072743))

(declare-fun m!1072745 () Bool)

(assert (=> b!1164948 m!1072745))

(declare-fun m!1072747 () Bool)

(assert (=> b!1164948 m!1072747))

(declare-fun m!1072749 () Bool)

(assert (=> b!1164938 m!1072749))

(declare-fun m!1072751 () Bool)

(assert (=> b!1164938 m!1072751))

(declare-fun m!1072753 () Bool)

(assert (=> b!1164938 m!1072753))

(declare-fun m!1072755 () Bool)

(assert (=> b!1164938 m!1072755))

(declare-fun m!1072757 () Bool)

(assert (=> b!1164945 m!1072757))

(declare-fun m!1072759 () Bool)

(assert (=> b!1164943 m!1072759))

(declare-fun m!1072761 () Bool)

(assert (=> b!1164946 m!1072761))

(declare-fun m!1072763 () Bool)

(assert (=> b!1164947 m!1072763))

(declare-fun m!1072765 () Bool)

(assert (=> b!1164947 m!1072765))

(declare-fun m!1072767 () Bool)

(assert (=> b!1164942 m!1072767))

(check-sat (not b!1164945) (not b!1164938) (not b!1164944) b_and!40187 (not b!1164948) (not b!1164947) (not b!1164951) (not b!1164942) (not start!99068) (not mapNonEmpty!45638) tp_is_empty!29209 (not b_next!24679) (not b!1164946) (not b_lambda!19767))
(check-sat b_and!40187 (not b_next!24679))
