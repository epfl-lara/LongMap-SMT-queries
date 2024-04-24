; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102020 () Bool)

(assert start!102020)

(declare-fun b_free!26473 () Bool)

(declare-fun b_next!26473 () Bool)

(assert (=> start!102020 (= b_free!26473 (not b_next!26473))))

(declare-fun tp!92464 () Bool)

(declare-fun b_and!44209 () Bool)

(assert (=> start!102020 (= tp!92464 b_and!44209)))

(declare-fun b!1227276 () Bool)

(declare-fun res!815283 () Bool)

(declare-fun e!697129 () Bool)

(assert (=> b!1227276 (=> (not res!815283) (not e!697129))))

(declare-datatypes ((array!79171 0))(
  ( (array!79172 (arr!38206 (Array (_ BitVec 32) (_ BitVec 64))) (size!38743 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79171)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79171 (_ BitVec 32)) Bool)

(assert (=> b!1227276 (= res!815283 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1227277 () Bool)

(declare-fun e!697130 () Bool)

(declare-fun tp_is_empty!31177 () Bool)

(assert (=> b!1227277 (= e!697130 tp_is_empty!31177)))

(declare-fun res!815285 () Bool)

(assert (=> start!102020 (=> (not res!815285) (not e!697129))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!102020 (= res!815285 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38743 _keys!1208))))))

(assert (=> start!102020 e!697129))

(assert (=> start!102020 tp_is_empty!31177))

(declare-fun array_inv!29150 (array!79171) Bool)

(assert (=> start!102020 (array_inv!29150 _keys!1208)))

(assert (=> start!102020 true))

(assert (=> start!102020 tp!92464))

(declare-datatypes ((V!46697 0))(
  ( (V!46698 (val!15645 Int)) )
))
(declare-datatypes ((ValueCell!14879 0))(
  ( (ValueCellFull!14879 (v!18303 V!46697)) (EmptyCell!14879) )
))
(declare-datatypes ((array!79173 0))(
  ( (array!79174 (arr!38207 (Array (_ BitVec 32) ValueCell!14879)) (size!38744 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79173)

(declare-fun e!697127 () Bool)

(declare-fun array_inv!29151 (array!79173) Bool)

(assert (=> start!102020 (and (array_inv!29151 _values!996) e!697127)))

(declare-fun b!1227278 () Bool)

(declare-fun e!697125 () Bool)

(assert (=> b!1227278 (= e!697125 tp_is_empty!31177)))

(declare-fun b!1227279 () Bool)

(declare-fun e!697128 () Bool)

(declare-fun e!697132 () Bool)

(assert (=> b!1227279 (= e!697128 e!697132)))

(declare-fun res!815284 () Bool)

(assert (=> b!1227279 (=> res!815284 e!697132)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1227279 (= res!815284 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46697)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!559131 () array!79173)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!20186 0))(
  ( (tuple2!20187 (_1!10104 (_ BitVec 64)) (_2!10104 V!46697)) )
))
(declare-datatypes ((List!26997 0))(
  ( (Nil!26994) (Cons!26993 (h!28211 tuple2!20186) (t!40442 List!26997)) )
))
(declare-datatypes ((ListLongMap!18163 0))(
  ( (ListLongMap!18164 (toList!9097 List!26997)) )
))
(declare-fun lt!559136 () ListLongMap!18163)

(declare-fun minValue!944 () V!46697)

(declare-fun lt!559135 () array!79171)

(declare-fun getCurrentListMapNoExtraKeys!5544 (array!79171 array!79173 (_ BitVec 32) (_ BitVec 32) V!46697 V!46697 (_ BitVec 32) Int) ListLongMap!18163)

(assert (=> b!1227279 (= lt!559136 (getCurrentListMapNoExtraKeys!5544 lt!559135 lt!559131 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!3438 (Int (_ BitVec 64)) V!46697)

(assert (=> b!1227279 (= lt!559131 (array!79174 (store (arr!38207 _values!996) i!673 (ValueCellFull!14879 (dynLambda!3438 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38744 _values!996)))))

(declare-fun lt!559134 () ListLongMap!18163)

(assert (=> b!1227279 (= lt!559134 (getCurrentListMapNoExtraKeys!5544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1227280 () Bool)

(declare-fun mapRes!48664 () Bool)

(assert (=> b!1227280 (= e!697127 (and e!697125 mapRes!48664))))

(declare-fun condMapEmpty!48664 () Bool)

(declare-fun mapDefault!48664 () ValueCell!14879)

(assert (=> b!1227280 (= condMapEmpty!48664 (= (arr!38207 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14879)) mapDefault!48664)))))

(declare-fun b!1227281 () Bool)

(assert (=> b!1227281 (= e!697132 true)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1965 (ListLongMap!18163 (_ BitVec 64)) ListLongMap!18163)

(assert (=> b!1227281 (= (getCurrentListMapNoExtraKeys!5544 lt!559135 lt!559131 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1965 (getCurrentListMapNoExtraKeys!5544 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!40607 0))(
  ( (Unit!40608) )
))
(declare-fun lt!559133 () Unit!40607)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1180 (array!79171 array!79173 (_ BitVec 32) (_ BitVec 32) V!46697 V!46697 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40607)

(assert (=> b!1227281 (= lt!559133 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1180 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1227282 () Bool)

(declare-fun res!815281 () Bool)

(assert (=> b!1227282 (=> (not res!815281) (not e!697129))))

(assert (=> b!1227282 (= res!815281 (and (= (size!38744 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38743 _keys!1208) (size!38744 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1227283 () Bool)

(declare-fun e!697126 () Bool)

(assert (=> b!1227283 (= e!697126 (not e!697128))))

(declare-fun res!815287 () Bool)

(assert (=> b!1227283 (=> res!815287 e!697128)))

(assert (=> b!1227283 (= res!815287 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!79171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227283 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!559132 () Unit!40607)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79171 (_ BitVec 64) (_ BitVec 32)) Unit!40607)

(assert (=> b!1227283 (= lt!559132 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1227284 () Bool)

(declare-fun res!815291 () Bool)

(assert (=> b!1227284 (=> (not res!815291) (not e!697129))))

(assert (=> b!1227284 (= res!815291 (= (select (arr!38206 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!48664 () Bool)

(declare-fun tp!92465 () Bool)

(assert (=> mapNonEmpty!48664 (= mapRes!48664 (and tp!92465 e!697130))))

(declare-fun mapKey!48664 () (_ BitVec 32))

(declare-fun mapValue!48664 () ValueCell!14879)

(declare-fun mapRest!48664 () (Array (_ BitVec 32) ValueCell!14879))

(assert (=> mapNonEmpty!48664 (= (arr!38207 _values!996) (store mapRest!48664 mapKey!48664 mapValue!48664))))

(declare-fun b!1227285 () Bool)

(declare-fun res!815289 () Bool)

(assert (=> b!1227285 (=> (not res!815289) (not e!697126))))

(declare-datatypes ((List!26998 0))(
  ( (Nil!26995) (Cons!26994 (h!28212 (_ BitVec 64)) (t!40443 List!26998)) )
))
(declare-fun arrayNoDuplicates!0 (array!79171 (_ BitVec 32) List!26998) Bool)

(assert (=> b!1227285 (= res!815289 (arrayNoDuplicates!0 lt!559135 #b00000000000000000000000000000000 Nil!26995))))

(declare-fun b!1227286 () Bool)

(declare-fun res!815290 () Bool)

(assert (=> b!1227286 (=> (not res!815290) (not e!697129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1227286 (= res!815290 (validMask!0 mask!1564))))

(declare-fun b!1227287 () Bool)

(declare-fun res!815282 () Bool)

(assert (=> b!1227287 (=> (not res!815282) (not e!697129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227287 (= res!815282 (validKeyInArray!0 k0!934))))

(declare-fun b!1227288 () Bool)

(declare-fun res!815286 () Bool)

(assert (=> b!1227288 (=> (not res!815286) (not e!697129))))

(assert (=> b!1227288 (= res!815286 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26995))))

(declare-fun b!1227289 () Bool)

(declare-fun res!815292 () Bool)

(assert (=> b!1227289 (=> (not res!815292) (not e!697129))))

(assert (=> b!1227289 (= res!815292 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38743 _keys!1208))))))

(declare-fun mapIsEmpty!48664 () Bool)

(assert (=> mapIsEmpty!48664 mapRes!48664))

(declare-fun b!1227290 () Bool)

(assert (=> b!1227290 (= e!697129 e!697126)))

(declare-fun res!815288 () Bool)

(assert (=> b!1227290 (=> (not res!815288) (not e!697126))))

(assert (=> b!1227290 (= res!815288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!559135 mask!1564))))

(assert (=> b!1227290 (= lt!559135 (array!79172 (store (arr!38206 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38743 _keys!1208)))))

(assert (= (and start!102020 res!815285) b!1227286))

(assert (= (and b!1227286 res!815290) b!1227282))

(assert (= (and b!1227282 res!815281) b!1227276))

(assert (= (and b!1227276 res!815283) b!1227288))

(assert (= (and b!1227288 res!815286) b!1227289))

(assert (= (and b!1227289 res!815292) b!1227287))

(assert (= (and b!1227287 res!815282) b!1227284))

(assert (= (and b!1227284 res!815291) b!1227290))

(assert (= (and b!1227290 res!815288) b!1227285))

(assert (= (and b!1227285 res!815289) b!1227283))

(assert (= (and b!1227283 (not res!815287)) b!1227279))

(assert (= (and b!1227279 (not res!815284)) b!1227281))

(assert (= (and b!1227280 condMapEmpty!48664) mapIsEmpty!48664))

(assert (= (and b!1227280 (not condMapEmpty!48664)) mapNonEmpty!48664))

(get-info :version)

(assert (= (and mapNonEmpty!48664 ((_ is ValueCellFull!14879) mapValue!48664)) b!1227277))

(assert (= (and b!1227280 ((_ is ValueCellFull!14879) mapDefault!48664)) b!1227278))

(assert (= start!102020 b!1227280))

(declare-fun b_lambda!22447 () Bool)

(assert (=> (not b_lambda!22447) (not b!1227279)))

(declare-fun t!40441 () Bool)

(declare-fun tb!11265 () Bool)

(assert (=> (and start!102020 (= defaultEntry!1004 defaultEntry!1004) t!40441) tb!11265))

(declare-fun result!23151 () Bool)

(assert (=> tb!11265 (= result!23151 tp_is_empty!31177)))

(assert (=> b!1227279 t!40441))

(declare-fun b_and!44211 () Bool)

(assert (= b_and!44209 (and (=> t!40441 result!23151) b_and!44211)))

(declare-fun m!1132673 () Bool)

(assert (=> b!1227290 m!1132673))

(declare-fun m!1132675 () Bool)

(assert (=> b!1227290 m!1132675))

(declare-fun m!1132677 () Bool)

(assert (=> b!1227276 m!1132677))

(declare-fun m!1132679 () Bool)

(assert (=> b!1227286 m!1132679))

(declare-fun m!1132681 () Bool)

(assert (=> b!1227284 m!1132681))

(declare-fun m!1132683 () Bool)

(assert (=> b!1227281 m!1132683))

(declare-fun m!1132685 () Bool)

(assert (=> b!1227281 m!1132685))

(assert (=> b!1227281 m!1132685))

(declare-fun m!1132687 () Bool)

(assert (=> b!1227281 m!1132687))

(declare-fun m!1132689 () Bool)

(assert (=> b!1227281 m!1132689))

(declare-fun m!1132691 () Bool)

(assert (=> b!1227285 m!1132691))

(declare-fun m!1132693 () Bool)

(assert (=> start!102020 m!1132693))

(declare-fun m!1132695 () Bool)

(assert (=> start!102020 m!1132695))

(declare-fun m!1132697 () Bool)

(assert (=> mapNonEmpty!48664 m!1132697))

(declare-fun m!1132699 () Bool)

(assert (=> b!1227287 m!1132699))

(declare-fun m!1132701 () Bool)

(assert (=> b!1227283 m!1132701))

(declare-fun m!1132703 () Bool)

(assert (=> b!1227283 m!1132703))

(declare-fun m!1132705 () Bool)

(assert (=> b!1227279 m!1132705))

(declare-fun m!1132707 () Bool)

(assert (=> b!1227279 m!1132707))

(declare-fun m!1132709 () Bool)

(assert (=> b!1227279 m!1132709))

(declare-fun m!1132711 () Bool)

(assert (=> b!1227279 m!1132711))

(declare-fun m!1132713 () Bool)

(assert (=> b!1227288 m!1132713))

(check-sat (not b_next!26473) b_and!44211 (not start!102020) (not b!1227287) (not b!1227276) (not b!1227281) (not b!1227285) tp_is_empty!31177 (not b!1227288) (not b!1227286) (not b!1227279) (not b_lambda!22447) (not b!1227290) (not b!1227283) (not mapNonEmpty!48664))
(check-sat b_and!44211 (not b_next!26473))
