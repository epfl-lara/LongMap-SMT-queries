; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99978 () Bool)

(assert start!99978)

(declare-fun b_free!25557 () Bool)

(declare-fun b_next!25557 () Bool)

(assert (=> start!99978 (= b_free!25557 (not b_next!25557))))

(declare-fun tp!89385 () Bool)

(declare-fun b_and!41981 () Bool)

(assert (=> start!99978 (= tp!89385 b_and!41981)))

(declare-fun b!1190763 () Bool)

(declare-fun res!791963 () Bool)

(declare-fun e!676923 () Bool)

(assert (=> b!1190763 (=> (not res!791963) (not e!676923))))

(declare-datatypes ((array!76965 0))(
  ( (array!76966 (arr!37132 (Array (_ BitVec 32) (_ BitVec 64))) (size!37668 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76965)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1190763 (= res!791963 (= (select (arr!37132 _keys!1208) i!673) k0!934))))

(declare-fun b!1190764 () Bool)

(declare-fun res!791971 () Bool)

(declare-fun e!676926 () Bool)

(assert (=> b!1190764 (=> (not res!791971) (not e!676926))))

(declare-fun lt!541575 () array!76965)

(declare-datatypes ((List!26145 0))(
  ( (Nil!26142) (Cons!26141 (h!27350 (_ BitVec 64)) (t!38694 List!26145)) )
))
(declare-fun arrayNoDuplicates!0 (array!76965 (_ BitVec 32) List!26145) Bool)

(assert (=> b!1190764 (= res!791971 (arrayNoDuplicates!0 lt!541575 #b00000000000000000000000000000000 Nil!26142))))

(declare-fun mapNonEmpty!46958 () Bool)

(declare-fun mapRes!46958 () Bool)

(declare-fun tp!89384 () Bool)

(declare-fun e!676924 () Bool)

(assert (=> mapNonEmpty!46958 (= mapRes!46958 (and tp!89384 e!676924))))

(declare-fun mapKey!46958 () (_ BitVec 32))

(declare-datatypes ((V!45243 0))(
  ( (V!45244 (val!15100 Int)) )
))
(declare-datatypes ((ValueCell!14334 0))(
  ( (ValueCellFull!14334 (v!17738 V!45243)) (EmptyCell!14334) )
))
(declare-fun mapRest!46958 () (Array (_ BitVec 32) ValueCell!14334))

(declare-fun mapValue!46958 () ValueCell!14334)

(declare-datatypes ((array!76967 0))(
  ( (array!76968 (arr!37133 (Array (_ BitVec 32) ValueCell!14334)) (size!37669 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76967)

(assert (=> mapNonEmpty!46958 (= (arr!37133 _values!996) (store mapRest!46958 mapKey!46958 mapValue!46958))))

(declare-fun b!1190765 () Bool)

(declare-fun e!676929 () Bool)

(declare-fun tp_is_empty!30087 () Bool)

(assert (=> b!1190765 (= e!676929 tp_is_empty!30087)))

(declare-fun b!1190766 () Bool)

(declare-fun res!791970 () Bool)

(assert (=> b!1190766 (=> (not res!791970) (not e!676923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1190766 (= res!791970 (validKeyInArray!0 k0!934))))

(declare-fun b!1190767 () Bool)

(declare-fun res!791965 () Bool)

(assert (=> b!1190767 (=> (not res!791965) (not e!676923))))

(assert (=> b!1190767 (= res!791965 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26142))))

(declare-fun b!1190768 () Bool)

(declare-fun e!676928 () Bool)

(assert (=> b!1190768 (= e!676928 true)))

(declare-fun zeroValue!944 () V!45243)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!45243)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!541578 () array!76967)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19400 0))(
  ( (tuple2!19401 (_1!9711 (_ BitVec 64)) (_2!9711 V!45243)) )
))
(declare-datatypes ((List!26146 0))(
  ( (Nil!26143) (Cons!26142 (h!27351 tuple2!19400) (t!38695 List!26146)) )
))
(declare-datatypes ((ListLongMap!17369 0))(
  ( (ListLongMap!17370 (toList!8700 List!26146)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5141 (array!76965 array!76967 (_ BitVec 32) (_ BitVec 32) V!45243 V!45243 (_ BitVec 32) Int) ListLongMap!17369)

(declare-fun -!1726 (ListLongMap!17369 (_ BitVec 64)) ListLongMap!17369)

(assert (=> b!1190768 (= (getCurrentListMapNoExtraKeys!5141 lt!541575 lt!541578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1726 (getCurrentListMapNoExtraKeys!5141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39498 0))(
  ( (Unit!39499) )
))
(declare-fun lt!541573 () Unit!39498)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!935 (array!76965 array!76967 (_ BitVec 32) (_ BitVec 32) V!45243 V!45243 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39498)

(assert (=> b!1190768 (= lt!541573 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!935 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1190769 () Bool)

(declare-fun e!676925 () Bool)

(assert (=> b!1190769 (= e!676926 (not e!676925))))

(declare-fun res!791969 () Bool)

(assert (=> b!1190769 (=> res!791969 e!676925)))

(assert (=> b!1190769 (= res!791969 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1190769 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!541577 () Unit!39498)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76965 (_ BitVec 64) (_ BitVec 32)) Unit!39498)

(assert (=> b!1190769 (= lt!541577 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1190770 () Bool)

(declare-fun e!676930 () Bool)

(assert (=> b!1190770 (= e!676930 (and e!676929 mapRes!46958))))

(declare-fun condMapEmpty!46958 () Bool)

(declare-fun mapDefault!46958 () ValueCell!14334)

(assert (=> b!1190770 (= condMapEmpty!46958 (= (arr!37133 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14334)) mapDefault!46958)))))

(declare-fun b!1190771 () Bool)

(assert (=> b!1190771 (= e!676923 e!676926)))

(declare-fun res!791960 () Bool)

(assert (=> b!1190771 (=> (not res!791960) (not e!676926))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76965 (_ BitVec 32)) Bool)

(assert (=> b!1190771 (= res!791960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541575 mask!1564))))

(assert (=> b!1190771 (= lt!541575 (array!76966 (store (arr!37132 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37668 _keys!1208)))))

(declare-fun b!1190772 () Bool)

(declare-fun res!791964 () Bool)

(assert (=> b!1190772 (=> (not res!791964) (not e!676923))))

(assert (=> b!1190772 (= res!791964 (and (= (size!37669 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37668 _keys!1208) (size!37669 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46958 () Bool)

(assert (=> mapIsEmpty!46958 mapRes!46958))

(declare-fun b!1190773 () Bool)

(assert (=> b!1190773 (= e!676925 e!676928)))

(declare-fun res!791961 () Bool)

(assert (=> b!1190773 (=> res!791961 e!676928)))

(assert (=> b!1190773 (= res!791961 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!541576 () ListLongMap!17369)

(assert (=> b!1190773 (= lt!541576 (getCurrentListMapNoExtraKeys!5141 lt!541575 lt!541578 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3079 (Int (_ BitVec 64)) V!45243)

(assert (=> b!1190773 (= lt!541578 (array!76968 (store (arr!37133 _values!996) i!673 (ValueCellFull!14334 (dynLambda!3079 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37669 _values!996)))))

(declare-fun lt!541574 () ListLongMap!17369)

(assert (=> b!1190773 (= lt!541574 (getCurrentListMapNoExtraKeys!5141 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1190774 () Bool)

(declare-fun res!791967 () Bool)

(assert (=> b!1190774 (=> (not res!791967) (not e!676923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1190774 (= res!791967 (validMask!0 mask!1564))))

(declare-fun b!1190775 () Bool)

(assert (=> b!1190775 (= e!676924 tp_is_empty!30087)))

(declare-fun b!1190776 () Bool)

(declare-fun res!791968 () Bool)

(assert (=> b!1190776 (=> (not res!791968) (not e!676923))))

(assert (=> b!1190776 (= res!791968 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37668 _keys!1208))))))

(declare-fun res!791966 () Bool)

(assert (=> start!99978 (=> (not res!791966) (not e!676923))))

(assert (=> start!99978 (= res!791966 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37668 _keys!1208))))))

(assert (=> start!99978 e!676923))

(assert (=> start!99978 tp_is_empty!30087))

(declare-fun array_inv!28316 (array!76965) Bool)

(assert (=> start!99978 (array_inv!28316 _keys!1208)))

(assert (=> start!99978 true))

(assert (=> start!99978 tp!89385))

(declare-fun array_inv!28317 (array!76967) Bool)

(assert (=> start!99978 (and (array_inv!28317 _values!996) e!676930)))

(declare-fun b!1190777 () Bool)

(declare-fun res!791962 () Bool)

(assert (=> b!1190777 (=> (not res!791962) (not e!676923))))

(assert (=> b!1190777 (= res!791962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99978 res!791966) b!1190774))

(assert (= (and b!1190774 res!791967) b!1190772))

(assert (= (and b!1190772 res!791964) b!1190777))

(assert (= (and b!1190777 res!791962) b!1190767))

(assert (= (and b!1190767 res!791965) b!1190776))

(assert (= (and b!1190776 res!791968) b!1190766))

(assert (= (and b!1190766 res!791970) b!1190763))

(assert (= (and b!1190763 res!791963) b!1190771))

(assert (= (and b!1190771 res!791960) b!1190764))

(assert (= (and b!1190764 res!791971) b!1190769))

(assert (= (and b!1190769 (not res!791969)) b!1190773))

(assert (= (and b!1190773 (not res!791961)) b!1190768))

(assert (= (and b!1190770 condMapEmpty!46958) mapIsEmpty!46958))

(assert (= (and b!1190770 (not condMapEmpty!46958)) mapNonEmpty!46958))

(get-info :version)

(assert (= (and mapNonEmpty!46958 ((_ is ValueCellFull!14334) mapValue!46958)) b!1190775))

(assert (= (and b!1190770 ((_ is ValueCellFull!14334) mapDefault!46958)) b!1190765))

(assert (= start!99978 b!1190770))

(declare-fun b_lambda!20701 () Bool)

(assert (=> (not b_lambda!20701) (not b!1190773)))

(declare-fun t!38693 () Bool)

(declare-fun tb!10369 () Bool)

(assert (=> (and start!99978 (= defaultEntry!1004 defaultEntry!1004) t!38693) tb!10369))

(declare-fun result!21305 () Bool)

(assert (=> tb!10369 (= result!21305 tp_is_empty!30087)))

(assert (=> b!1190773 t!38693))

(declare-fun b_and!41983 () Bool)

(assert (= b_and!41981 (and (=> t!38693 result!21305) b_and!41983)))

(declare-fun m!1099299 () Bool)

(assert (=> b!1190771 m!1099299))

(declare-fun m!1099301 () Bool)

(assert (=> b!1190771 m!1099301))

(declare-fun m!1099303 () Bool)

(assert (=> b!1190764 m!1099303))

(declare-fun m!1099305 () Bool)

(assert (=> b!1190768 m!1099305))

(declare-fun m!1099307 () Bool)

(assert (=> b!1190768 m!1099307))

(assert (=> b!1190768 m!1099307))

(declare-fun m!1099309 () Bool)

(assert (=> b!1190768 m!1099309))

(declare-fun m!1099311 () Bool)

(assert (=> b!1190768 m!1099311))

(declare-fun m!1099313 () Bool)

(assert (=> b!1190769 m!1099313))

(declare-fun m!1099315 () Bool)

(assert (=> b!1190769 m!1099315))

(declare-fun m!1099317 () Bool)

(assert (=> b!1190767 m!1099317))

(declare-fun m!1099319 () Bool)

(assert (=> b!1190773 m!1099319))

(declare-fun m!1099321 () Bool)

(assert (=> b!1190773 m!1099321))

(declare-fun m!1099323 () Bool)

(assert (=> b!1190773 m!1099323))

(declare-fun m!1099325 () Bool)

(assert (=> b!1190773 m!1099325))

(declare-fun m!1099327 () Bool)

(assert (=> b!1190763 m!1099327))

(declare-fun m!1099329 () Bool)

(assert (=> b!1190777 m!1099329))

(declare-fun m!1099331 () Bool)

(assert (=> mapNonEmpty!46958 m!1099331))

(declare-fun m!1099333 () Bool)

(assert (=> b!1190774 m!1099333))

(declare-fun m!1099335 () Bool)

(assert (=> start!99978 m!1099335))

(declare-fun m!1099337 () Bool)

(assert (=> start!99978 m!1099337))

(declare-fun m!1099339 () Bool)

(assert (=> b!1190766 m!1099339))

(check-sat b_and!41983 (not b!1190773) (not b!1190767) (not start!99978) (not b!1190774) (not b!1190777) (not b_lambda!20701) tp_is_empty!30087 (not mapNonEmpty!46958) (not b!1190771) (not b_next!25557) (not b!1190764) (not b!1190769) (not b!1190766) (not b!1190768))
(check-sat b_and!41983 (not b_next!25557))
