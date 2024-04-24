; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99454 () Bool)

(assert start!99454)

(declare-fun b_free!24823 () Bool)

(declare-fun b_next!24823 () Bool)

(assert (=> start!99454 (= b_free!24823 (not b_next!24823))))

(declare-fun tp!87179 () Bool)

(declare-fun b_and!40497 () Bool)

(assert (=> start!99454 (= tp!87179 b_and!40497)))

(declare-fun b!1169694 () Bool)

(declare-fun res!775708 () Bool)

(declare-fun e!664881 () Bool)

(assert (=> b!1169694 (=> (not res!775708) (not e!664881))))

(declare-datatypes ((array!75577 0))(
  ( (array!75578 (arr!36433 (Array (_ BitVec 32) (_ BitVec 64))) (size!36970 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75577)

(declare-datatypes ((List!25573 0))(
  ( (Nil!25570) (Cons!25569 (h!26787 (_ BitVec 64)) (t!37380 List!25573)) )
))
(declare-fun arrayNoDuplicates!0 (array!75577 (_ BitVec 32) List!25573) Bool)

(assert (=> b!1169694 (= res!775708 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25570))))

(declare-fun b!1169695 () Bool)

(declare-fun e!664877 () Bool)

(declare-fun e!664884 () Bool)

(assert (=> b!1169695 (= e!664877 (not e!664884))))

(declare-fun res!775715 () Bool)

(assert (=> b!1169695 (=> res!775715 e!664884)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1169695 (= res!775715 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75577 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1169695 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38533 0))(
  ( (Unit!38534) )
))
(declare-fun lt!526495 () Unit!38533)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75577 (_ BitVec 64) (_ BitVec 32)) Unit!38533)

(assert (=> b!1169695 (= lt!526495 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1169696 () Bool)

(declare-fun res!775719 () Bool)

(assert (=> b!1169696 (=> (not res!775719) (not e!664881))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44265 0))(
  ( (V!44266 (val!14733 Int)) )
))
(declare-datatypes ((ValueCell!13967 0))(
  ( (ValueCellFull!13967 (v!17366 V!44265)) (EmptyCell!13967) )
))
(declare-datatypes ((array!75579 0))(
  ( (array!75580 (arr!36434 (Array (_ BitVec 32) ValueCell!13967)) (size!36971 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75579)

(assert (=> b!1169696 (= res!775719 (and (= (size!36971 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36970 _keys!1208) (size!36971 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!45854 () Bool)

(declare-fun mapRes!45854 () Bool)

(assert (=> mapIsEmpty!45854 mapRes!45854))

(declare-fun b!1169697 () Bool)

(declare-fun res!775712 () Bool)

(assert (=> b!1169697 (=> (not res!775712) (not e!664881))))

(assert (=> b!1169697 (= res!775712 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36970 _keys!1208))))))

(declare-fun res!775707 () Bool)

(assert (=> start!99454 (=> (not res!775707) (not e!664881))))

(assert (=> start!99454 (= res!775707 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36970 _keys!1208))))))

(assert (=> start!99454 e!664881))

(declare-fun tp_is_empty!29353 () Bool)

(assert (=> start!99454 tp_is_empty!29353))

(declare-fun array_inv!27924 (array!75577) Bool)

(assert (=> start!99454 (array_inv!27924 _keys!1208)))

(assert (=> start!99454 true))

(assert (=> start!99454 tp!87179))

(declare-fun e!664880 () Bool)

(declare-fun array_inv!27925 (array!75579) Bool)

(assert (=> start!99454 (and (array_inv!27925 _values!996) e!664880)))

(declare-fun b!1169698 () Bool)

(declare-fun res!775716 () Bool)

(assert (=> b!1169698 (=> (not res!775716) (not e!664881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1169698 (= res!775716 (validMask!0 mask!1564))))

(declare-fun b!1169699 () Bool)

(declare-fun res!775711 () Bool)

(assert (=> b!1169699 (=> (not res!775711) (not e!664877))))

(declare-fun lt!526494 () array!75577)

(assert (=> b!1169699 (= res!775711 (arrayNoDuplicates!0 lt!526494 #b00000000000000000000000000000000 Nil!25570))))

(declare-fun b!1169700 () Bool)

(declare-fun res!775709 () Bool)

(assert (=> b!1169700 (=> (not res!775709) (not e!664881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1169700 (= res!775709 (validKeyInArray!0 k0!934))))

(declare-fun b!1169701 () Bool)

(declare-fun e!664885 () Bool)

(assert (=> b!1169701 (= e!664880 (and e!664885 mapRes!45854))))

(declare-fun condMapEmpty!45854 () Bool)

(declare-fun mapDefault!45854 () ValueCell!13967)

(assert (=> b!1169701 (= condMapEmpty!45854 (= (arr!36434 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13967)) mapDefault!45854)))))

(declare-fun mapNonEmpty!45854 () Bool)

(declare-fun tp!87180 () Bool)

(declare-fun e!664882 () Bool)

(assert (=> mapNonEmpty!45854 (= mapRes!45854 (and tp!87180 e!664882))))

(declare-fun mapValue!45854 () ValueCell!13967)

(declare-fun mapKey!45854 () (_ BitVec 32))

(declare-fun mapRest!45854 () (Array (_ BitVec 32) ValueCell!13967))

(assert (=> mapNonEmpty!45854 (= (arr!36434 _values!996) (store mapRest!45854 mapKey!45854 mapValue!45854))))

(declare-fun b!1169702 () Bool)

(assert (=> b!1169702 (= e!664881 e!664877)))

(declare-fun res!775714 () Bool)

(assert (=> b!1169702 (=> (not res!775714) (not e!664877))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75577 (_ BitVec 32)) Bool)

(assert (=> b!1169702 (= res!775714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!526494 mask!1564))))

(assert (=> b!1169702 (= lt!526494 (array!75578 (store (arr!36433 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36970 _keys!1208)))))

(declare-fun b!1169703 () Bool)

(assert (=> b!1169703 (= e!664885 tp_is_empty!29353)))

(declare-fun b!1169704 () Bool)

(declare-fun e!664883 () Bool)

(declare-fun e!664878 () Bool)

(assert (=> b!1169704 (= e!664883 e!664878)))

(declare-fun res!775713 () Bool)

(assert (=> b!1169704 (=> res!775713 e!664878)))

(assert (=> b!1169704 (= res!775713 (not (validKeyInArray!0 (select (arr!36433 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18832 0))(
  ( (tuple2!18833 (_1!9427 (_ BitVec 64)) (_2!9427 V!44265)) )
))
(declare-datatypes ((List!25574 0))(
  ( (Nil!25571) (Cons!25570 (h!26788 tuple2!18832) (t!37381 List!25574)) )
))
(declare-datatypes ((ListLongMap!16809 0))(
  ( (ListLongMap!16810 (toList!8420 List!25574)) )
))
(declare-fun lt!526493 () ListLongMap!16809)

(declare-fun lt!526500 () ListLongMap!16809)

(assert (=> b!1169704 (= lt!526493 lt!526500)))

(declare-fun lt!526496 () ListLongMap!16809)

(declare-fun -!1481 (ListLongMap!16809 (_ BitVec 64)) ListLongMap!16809)

(assert (=> b!1169704 (= lt!526500 (-!1481 lt!526496 k0!934))))

(declare-fun zeroValue!944 () V!44265)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!526498 () array!75579)

(declare-fun minValue!944 () V!44265)

(declare-fun getCurrentListMapNoExtraKeys!4911 (array!75577 array!75579 (_ BitVec 32) (_ BitVec 32) V!44265 V!44265 (_ BitVec 32) Int) ListLongMap!16809)

(assert (=> b!1169704 (= lt!526493 (getCurrentListMapNoExtraKeys!4911 lt!526494 lt!526498 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1169704 (= lt!526496 (getCurrentListMapNoExtraKeys!4911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!526499 () Unit!38533)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!706 (array!75577 array!75579 (_ BitVec 32) (_ BitVec 32) V!44265 V!44265 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38533)

(assert (=> b!1169704 (= lt!526499 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!706 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1169705 () Bool)

(assert (=> b!1169705 (= e!664882 tp_is_empty!29353)))

(declare-fun b!1169706 () Bool)

(declare-fun res!775718 () Bool)

(assert (=> b!1169706 (=> (not res!775718) (not e!664881))))

(assert (=> b!1169706 (= res!775718 (= (select (arr!36433 _keys!1208) i!673) k0!934))))

(declare-fun b!1169707 () Bool)

(assert (=> b!1169707 (= e!664884 e!664883)))

(declare-fun res!775710 () Bool)

(assert (=> b!1169707 (=> res!775710 e!664883)))

(assert (=> b!1169707 (= res!775710 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!526497 () ListLongMap!16809)

(assert (=> b!1169707 (= lt!526497 (getCurrentListMapNoExtraKeys!4911 lt!526494 lt!526498 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!526492 () V!44265)

(assert (=> b!1169707 (= lt!526498 (array!75580 (store (arr!36434 _values!996) i!673 (ValueCellFull!13967 lt!526492)) (size!36971 _values!996)))))

(declare-fun dynLambda!2898 (Int (_ BitVec 64)) V!44265)

(assert (=> b!1169707 (= lt!526492 (dynLambda!2898 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!526501 () ListLongMap!16809)

(assert (=> b!1169707 (= lt!526501 (getCurrentListMapNoExtraKeys!4911 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1169708 () Bool)

(declare-fun res!775717 () Bool)

(assert (=> b!1169708 (=> (not res!775717) (not e!664881))))

(assert (=> b!1169708 (= res!775717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1169709 () Bool)

(assert (=> b!1169709 (= e!664878 true)))

(declare-fun +!3767 (ListLongMap!16809 tuple2!18832) ListLongMap!16809)

(declare-fun get!18591 (ValueCell!13967 V!44265) V!44265)

(assert (=> b!1169709 (= lt!526497 (+!3767 lt!526500 (tuple2!18833 (select (arr!36433 _keys!1208) from!1455) (get!18591 (select (arr!36434 _values!996) from!1455) lt!526492))))))

(assert (= (and start!99454 res!775707) b!1169698))

(assert (= (and b!1169698 res!775716) b!1169696))

(assert (= (and b!1169696 res!775719) b!1169708))

(assert (= (and b!1169708 res!775717) b!1169694))

(assert (= (and b!1169694 res!775708) b!1169697))

(assert (= (and b!1169697 res!775712) b!1169700))

(assert (= (and b!1169700 res!775709) b!1169706))

(assert (= (and b!1169706 res!775718) b!1169702))

(assert (= (and b!1169702 res!775714) b!1169699))

(assert (= (and b!1169699 res!775711) b!1169695))

(assert (= (and b!1169695 (not res!775715)) b!1169707))

(assert (= (and b!1169707 (not res!775710)) b!1169704))

(assert (= (and b!1169704 (not res!775713)) b!1169709))

(assert (= (and b!1169701 condMapEmpty!45854) mapIsEmpty!45854))

(assert (= (and b!1169701 (not condMapEmpty!45854)) mapNonEmpty!45854))

(get-info :version)

(assert (= (and mapNonEmpty!45854 ((_ is ValueCellFull!13967) mapValue!45854)) b!1169705))

(assert (= (and b!1169701 ((_ is ValueCellFull!13967) mapDefault!45854)) b!1169703))

(assert (= start!99454 b!1169701))

(declare-fun b_lambda!19923 () Bool)

(assert (=> (not b_lambda!19923) (not b!1169707)))

(declare-fun t!37379 () Bool)

(declare-fun tb!9627 () Bool)

(assert (=> (and start!99454 (= defaultEntry!1004 defaultEntry!1004) t!37379) tb!9627))

(declare-fun result!19827 () Bool)

(assert (=> tb!9627 (= result!19827 tp_is_empty!29353)))

(assert (=> b!1169707 t!37379))

(declare-fun b_and!40499 () Bool)

(assert (= b_and!40497 (and (=> t!37379 result!19827) b_and!40499)))

(declare-fun m!1077809 () Bool)

(assert (=> b!1169702 m!1077809))

(declare-fun m!1077811 () Bool)

(assert (=> b!1169702 m!1077811))

(declare-fun m!1077813 () Bool)

(assert (=> b!1169695 m!1077813))

(declare-fun m!1077815 () Bool)

(assert (=> b!1169695 m!1077815))

(declare-fun m!1077817 () Bool)

(assert (=> b!1169700 m!1077817))

(declare-fun m!1077819 () Bool)

(assert (=> b!1169709 m!1077819))

(declare-fun m!1077821 () Bool)

(assert (=> b!1169709 m!1077821))

(assert (=> b!1169709 m!1077821))

(declare-fun m!1077823 () Bool)

(assert (=> b!1169709 m!1077823))

(declare-fun m!1077825 () Bool)

(assert (=> b!1169709 m!1077825))

(declare-fun m!1077827 () Bool)

(assert (=> b!1169698 m!1077827))

(declare-fun m!1077829 () Bool)

(assert (=> b!1169699 m!1077829))

(declare-fun m!1077831 () Bool)

(assert (=> b!1169706 m!1077831))

(declare-fun m!1077833 () Bool)

(assert (=> b!1169704 m!1077833))

(declare-fun m!1077835 () Bool)

(assert (=> b!1169704 m!1077835))

(declare-fun m!1077837 () Bool)

(assert (=> b!1169704 m!1077837))

(assert (=> b!1169704 m!1077819))

(declare-fun m!1077839 () Bool)

(assert (=> b!1169704 m!1077839))

(declare-fun m!1077841 () Bool)

(assert (=> b!1169704 m!1077841))

(assert (=> b!1169704 m!1077819))

(declare-fun m!1077843 () Bool)

(assert (=> start!99454 m!1077843))

(declare-fun m!1077845 () Bool)

(assert (=> start!99454 m!1077845))

(declare-fun m!1077847 () Bool)

(assert (=> b!1169708 m!1077847))

(declare-fun m!1077849 () Bool)

(assert (=> mapNonEmpty!45854 m!1077849))

(declare-fun m!1077851 () Bool)

(assert (=> b!1169694 m!1077851))

(declare-fun m!1077853 () Bool)

(assert (=> b!1169707 m!1077853))

(declare-fun m!1077855 () Bool)

(assert (=> b!1169707 m!1077855))

(declare-fun m!1077857 () Bool)

(assert (=> b!1169707 m!1077857))

(declare-fun m!1077859 () Bool)

(assert (=> b!1169707 m!1077859))

(check-sat (not b!1169708) (not b!1169699) (not b!1169698) (not b!1169707) (not b_lambda!19923) (not b!1169700) (not b!1169709) b_and!40499 tp_is_empty!29353 (not b!1169694) (not b_next!24823) (not mapNonEmpty!45854) (not b!1169702) (not b!1169695) (not b!1169704) (not start!99454))
(check-sat b_and!40499 (not b_next!24823))
