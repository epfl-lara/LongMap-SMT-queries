; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99930 () Bool)

(assert start!99930)

(declare-fun b_free!25509 () Bool)

(declare-fun b_next!25509 () Bool)

(assert (=> start!99930 (= b_free!25509 (not b_next!25509))))

(declare-fun tp!89240 () Bool)

(declare-fun b_and!41885 () Bool)

(assert (=> start!99930 (= tp!89240 b_and!41885)))

(declare-fun b!1189635 () Bool)

(declare-fun res!791098 () Bool)

(declare-fun e!676353 () Bool)

(assert (=> b!1189635 (=> (not res!791098) (not e!676353))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1189635 (= res!791098 (validKeyInArray!0 k0!934))))

(declare-fun b!1189636 () Bool)

(declare-fun res!791103 () Bool)

(assert (=> b!1189636 (=> (not res!791103) (not e!676353))))

(declare-datatypes ((array!76871 0))(
  ( (array!76872 (arr!37085 (Array (_ BitVec 32) (_ BitVec 64))) (size!37621 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76871)

(declare-datatypes ((List!26107 0))(
  ( (Nil!26104) (Cons!26103 (h!27312 (_ BitVec 64)) (t!38608 List!26107)) )
))
(declare-fun arrayNoDuplicates!0 (array!76871 (_ BitVec 32) List!26107) Bool)

(assert (=> b!1189636 (= res!791103 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26104))))

(declare-fun mapNonEmpty!46886 () Bool)

(declare-fun mapRes!46886 () Bool)

(declare-fun tp!89241 () Bool)

(declare-fun e!676347 () Bool)

(assert (=> mapNonEmpty!46886 (= mapRes!46886 (and tp!89241 e!676347))))

(declare-fun mapKey!46886 () (_ BitVec 32))

(declare-datatypes ((V!45179 0))(
  ( (V!45180 (val!15076 Int)) )
))
(declare-datatypes ((ValueCell!14310 0))(
  ( (ValueCellFull!14310 (v!17714 V!45179)) (EmptyCell!14310) )
))
(declare-fun mapValue!46886 () ValueCell!14310)

(declare-datatypes ((array!76873 0))(
  ( (array!76874 (arr!37086 (Array (_ BitVec 32) ValueCell!14310)) (size!37622 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76873)

(declare-fun mapRest!46886 () (Array (_ BitVec 32) ValueCell!14310))

(assert (=> mapNonEmpty!46886 (= (arr!37086 _values!996) (store mapRest!46886 mapKey!46886 mapValue!46886))))

(declare-fun b!1189637 () Bool)

(declare-fun res!791101 () Bool)

(assert (=> b!1189637 (=> (not res!791101) (not e!676353))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76871 (_ BitVec 32)) Bool)

(assert (=> b!1189637 (= res!791101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1189638 () Bool)

(declare-fun e!676349 () Bool)

(declare-fun e!676348 () Bool)

(assert (=> b!1189638 (= e!676349 (and e!676348 mapRes!46886))))

(declare-fun condMapEmpty!46886 () Bool)

(declare-fun mapDefault!46886 () ValueCell!14310)

(assert (=> b!1189638 (= condMapEmpty!46886 (= (arr!37086 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14310)) mapDefault!46886)))))

(declare-fun b!1189639 () Bool)

(declare-fun res!791106 () Bool)

(assert (=> b!1189639 (=> (not res!791106) (not e!676353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189639 (= res!791106 (validMask!0 mask!1564))))

(declare-fun b!1189640 () Bool)

(declare-fun tp_is_empty!30039 () Bool)

(assert (=> b!1189640 (= e!676348 tp_is_empty!30039)))

(declare-fun b!1189641 () Bool)

(declare-fun e!676350 () Bool)

(declare-fun e!676351 () Bool)

(assert (=> b!1189641 (= e!676350 e!676351)))

(declare-fun res!791105 () Bool)

(assert (=> b!1189641 (=> res!791105 e!676351)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189641 (= res!791105 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45179)

(declare-fun lt!541146 () array!76873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19362 0))(
  ( (tuple2!19363 (_1!9692 (_ BitVec 64)) (_2!9692 V!45179)) )
))
(declare-datatypes ((List!26108 0))(
  ( (Nil!26105) (Cons!26104 (h!27313 tuple2!19362) (t!38609 List!26108)) )
))
(declare-datatypes ((ListLongMap!17331 0))(
  ( (ListLongMap!17332 (toList!8681 List!26108)) )
))
(declare-fun lt!541142 () ListLongMap!17331)

(declare-fun lt!541144 () array!76871)

(declare-fun minValue!944 () V!45179)

(declare-fun getCurrentListMapNoExtraKeys!5122 (array!76871 array!76873 (_ BitVec 32) (_ BitVec 32) V!45179 V!45179 (_ BitVec 32) Int) ListLongMap!17331)

(assert (=> b!1189641 (= lt!541142 (getCurrentListMapNoExtraKeys!5122 lt!541144 lt!541146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3065 (Int (_ BitVec 64)) V!45179)

(assert (=> b!1189641 (= lt!541146 (array!76874 (store (arr!37086 _values!996) i!673 (ValueCellFull!14310 (dynLambda!3065 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37622 _values!996)))))

(declare-fun lt!541141 () ListLongMap!17331)

(assert (=> b!1189641 (= lt!541141 (getCurrentListMapNoExtraKeys!5122 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1189642 () Bool)

(assert (=> b!1189642 (= e!676347 tp_is_empty!30039)))

(declare-fun b!1189643 () Bool)

(declare-fun res!791102 () Bool)

(declare-fun e!676352 () Bool)

(assert (=> b!1189643 (=> (not res!791102) (not e!676352))))

(assert (=> b!1189643 (= res!791102 (arrayNoDuplicates!0 lt!541144 #b00000000000000000000000000000000 Nil!26104))))

(declare-fun b!1189644 () Bool)

(assert (=> b!1189644 (= e!676352 (not e!676350))))

(declare-fun res!791104 () Bool)

(assert (=> b!1189644 (=> res!791104 e!676350)))

(assert (=> b!1189644 (= res!791104 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76871 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189644 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39462 0))(
  ( (Unit!39463) )
))
(declare-fun lt!541143 () Unit!39462)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76871 (_ BitVec 64) (_ BitVec 32)) Unit!39462)

(assert (=> b!1189644 (= lt!541143 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1189645 () Bool)

(declare-fun res!791099 () Bool)

(assert (=> b!1189645 (=> (not res!791099) (not e!676353))))

(assert (=> b!1189645 (= res!791099 (= (select (arr!37085 _keys!1208) i!673) k0!934))))

(declare-fun b!1189646 () Bool)

(declare-fun res!791107 () Bool)

(assert (=> b!1189646 (=> (not res!791107) (not e!676353))))

(assert (=> b!1189646 (= res!791107 (and (= (size!37622 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37621 _keys!1208) (size!37622 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189647 () Bool)

(assert (=> b!1189647 (= e!676353 e!676352)))

(declare-fun res!791100 () Bool)

(assert (=> b!1189647 (=> (not res!791100) (not e!676352))))

(assert (=> b!1189647 (= res!791100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541144 mask!1564))))

(assert (=> b!1189647 (= lt!541144 (array!76872 (store (arr!37085 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37621 _keys!1208)))))

(declare-fun b!1189648 () Bool)

(declare-fun res!791096 () Bool)

(assert (=> b!1189648 (=> (not res!791096) (not e!676353))))

(assert (=> b!1189648 (= res!791096 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37621 _keys!1208))))))

(declare-fun res!791097 () Bool)

(assert (=> start!99930 (=> (not res!791097) (not e!676353))))

(assert (=> start!99930 (= res!791097 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37621 _keys!1208))))))

(assert (=> start!99930 e!676353))

(assert (=> start!99930 tp_is_empty!30039))

(declare-fun array_inv!28288 (array!76871) Bool)

(assert (=> start!99930 (array_inv!28288 _keys!1208)))

(assert (=> start!99930 true))

(assert (=> start!99930 tp!89240))

(declare-fun array_inv!28289 (array!76873) Bool)

(assert (=> start!99930 (and (array_inv!28289 _values!996) e!676349)))

(declare-fun mapIsEmpty!46886 () Bool)

(assert (=> mapIsEmpty!46886 mapRes!46886))

(declare-fun b!1189649 () Bool)

(assert (=> b!1189649 (= e!676351 true)))

(declare-fun -!1710 (ListLongMap!17331 (_ BitVec 64)) ListLongMap!17331)

(assert (=> b!1189649 (= (getCurrentListMapNoExtraKeys!5122 lt!541144 lt!541146 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1710 (getCurrentListMapNoExtraKeys!5122 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun lt!541145 () Unit!39462)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!919 (array!76871 array!76873 (_ BitVec 32) (_ BitVec 32) V!45179 V!45179 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39462)

(assert (=> b!1189649 (= lt!541145 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!919 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99930 res!791097) b!1189639))

(assert (= (and b!1189639 res!791106) b!1189646))

(assert (= (and b!1189646 res!791107) b!1189637))

(assert (= (and b!1189637 res!791101) b!1189636))

(assert (= (and b!1189636 res!791103) b!1189648))

(assert (= (and b!1189648 res!791096) b!1189635))

(assert (= (and b!1189635 res!791098) b!1189645))

(assert (= (and b!1189645 res!791099) b!1189647))

(assert (= (and b!1189647 res!791100) b!1189643))

(assert (= (and b!1189643 res!791102) b!1189644))

(assert (= (and b!1189644 (not res!791104)) b!1189641))

(assert (= (and b!1189641 (not res!791105)) b!1189649))

(assert (= (and b!1189638 condMapEmpty!46886) mapIsEmpty!46886))

(assert (= (and b!1189638 (not condMapEmpty!46886)) mapNonEmpty!46886))

(get-info :version)

(assert (= (and mapNonEmpty!46886 ((_ is ValueCellFull!14310) mapValue!46886)) b!1189642))

(assert (= (and b!1189638 ((_ is ValueCellFull!14310) mapDefault!46886)) b!1189640))

(assert (= start!99930 b!1189638))

(declare-fun b_lambda!20653 () Bool)

(assert (=> (not b_lambda!20653) (not b!1189641)))

(declare-fun t!38607 () Bool)

(declare-fun tb!10321 () Bool)

(assert (=> (and start!99930 (= defaultEntry!1004 defaultEntry!1004) t!38607) tb!10321))

(declare-fun result!21209 () Bool)

(assert (=> tb!10321 (= result!21209 tp_is_empty!30039)))

(assert (=> b!1189641 t!38607))

(declare-fun b_and!41887 () Bool)

(assert (= b_and!41885 (and (=> t!38607 result!21209) b_and!41887)))

(declare-fun m!1098291 () Bool)

(assert (=> start!99930 m!1098291))

(declare-fun m!1098293 () Bool)

(assert (=> start!99930 m!1098293))

(declare-fun m!1098295 () Bool)

(assert (=> b!1189644 m!1098295))

(declare-fun m!1098297 () Bool)

(assert (=> b!1189644 m!1098297))

(declare-fun m!1098299 () Bool)

(assert (=> mapNonEmpty!46886 m!1098299))

(declare-fun m!1098301 () Bool)

(assert (=> b!1189641 m!1098301))

(declare-fun m!1098303 () Bool)

(assert (=> b!1189641 m!1098303))

(declare-fun m!1098305 () Bool)

(assert (=> b!1189641 m!1098305))

(declare-fun m!1098307 () Bool)

(assert (=> b!1189641 m!1098307))

(declare-fun m!1098309 () Bool)

(assert (=> b!1189639 m!1098309))

(declare-fun m!1098311 () Bool)

(assert (=> b!1189636 m!1098311))

(declare-fun m!1098313 () Bool)

(assert (=> b!1189649 m!1098313))

(declare-fun m!1098315 () Bool)

(assert (=> b!1189649 m!1098315))

(assert (=> b!1189649 m!1098315))

(declare-fun m!1098317 () Bool)

(assert (=> b!1189649 m!1098317))

(declare-fun m!1098319 () Bool)

(assert (=> b!1189649 m!1098319))

(declare-fun m!1098321 () Bool)

(assert (=> b!1189637 m!1098321))

(declare-fun m!1098323 () Bool)

(assert (=> b!1189635 m!1098323))

(declare-fun m!1098325 () Bool)

(assert (=> b!1189645 m!1098325))

(declare-fun m!1098327 () Bool)

(assert (=> b!1189643 m!1098327))

(declare-fun m!1098329 () Bool)

(assert (=> b!1189647 m!1098329))

(declare-fun m!1098331 () Bool)

(assert (=> b!1189647 m!1098331))

(check-sat (not start!99930) tp_is_empty!30039 (not b!1189641) (not b!1189647) (not b_next!25509) (not b!1189649) b_and!41887 (not b!1189639) (not b!1189635) (not b!1189644) (not b_lambda!20653) (not b!1189637) (not b!1189643) (not b!1189636) (not mapNonEmpty!46886))
(check-sat b_and!41887 (not b_next!25509))
