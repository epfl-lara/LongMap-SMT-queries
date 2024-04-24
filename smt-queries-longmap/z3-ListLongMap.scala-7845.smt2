; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98050 () Bool)

(assert start!98050)

(declare-fun b_free!23515 () Bool)

(declare-fun b_next!23515 () Bool)

(assert (=> start!98050 (= b_free!23515 (not b_next!23515))))

(declare-fun tp!83248 () Bool)

(declare-fun b_and!37823 () Bool)

(assert (=> start!98050 (= tp!83248 b_and!37823)))

(declare-fun b!1120581 () Bool)

(declare-fun e!638300 () Bool)

(declare-fun tp_is_empty!28045 () Bool)

(assert (=> b!1120581 (= e!638300 tp_is_empty!28045)))

(declare-fun b!1120582 () Bool)

(declare-fun e!638299 () Bool)

(assert (=> b!1120582 (= e!638299 true)))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((V!42521 0))(
  ( (V!42522 (val!14079 Int)) )
))
(declare-datatypes ((tuple2!17676 0))(
  ( (tuple2!17677 (_1!8849 (_ BitVec 64)) (_2!8849 V!42521)) )
))
(declare-datatypes ((List!24468 0))(
  ( (Nil!24465) (Cons!24464 (h!25682 tuple2!17676) (t!34967 List!24468)) )
))
(declare-datatypes ((ListLongMap!15653 0))(
  ( (ListLongMap!15654 (toList!7842 List!24468)) )
))
(declare-fun lt!498220 () ListLongMap!15653)

(declare-datatypes ((ValueCell!13313 0))(
  ( (ValueCellFull!13313 (v!16708 V!42521)) (EmptyCell!13313) )
))
(declare-datatypes ((array!73023 0))(
  ( (array!73024 (arr!35158 (Array (_ BitVec 32) ValueCell!13313)) (size!35695 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73023)

(declare-fun minValue!944 () V!42521)

(declare-datatypes ((array!73025 0))(
  ( (array!73026 (arr!35159 (Array (_ BitVec 32) (_ BitVec 64))) (size!35696 (_ BitVec 32))) )
))
(declare-fun lt!498219 () array!73025)

(declare-fun zeroValue!944 () V!42521)

(declare-fun getCurrentListMapNoExtraKeys!4372 (array!73025 array!73023 (_ BitVec 32) (_ BitVec 32) V!42521 V!42521 (_ BitVec 32) Int) ListLongMap!15653)

(declare-fun dynLambda!2461 (Int (_ BitVec 64)) V!42521)

(assert (=> b!1120582 (= lt!498220 (getCurrentListMapNoExtraKeys!4372 lt!498219 (array!73024 (store (arr!35158 _values!996) i!673 (ValueCellFull!13313 (dynLambda!2461 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35695 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!73025)

(declare-fun lt!498217 () ListLongMap!15653)

(assert (=> b!1120582 (= lt!498217 (getCurrentListMapNoExtraKeys!4372 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120583 () Bool)

(declare-fun e!638303 () Bool)

(assert (=> b!1120583 (= e!638303 (not e!638299))))

(declare-fun res!748144 () Bool)

(assert (=> b!1120583 (=> res!748144 e!638299)))

(assert (=> b!1120583 (= res!748144 (bvsgt from!1455 i!673))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!73025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1120583 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36713 0))(
  ( (Unit!36714) )
))
(declare-fun lt!498218 () Unit!36713)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73025 (_ BitVec 64) (_ BitVec 32)) Unit!36713)

(assert (=> b!1120583 (= lt!498218 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1120584 () Bool)

(declare-fun res!748139 () Bool)

(declare-fun e!638304 () Bool)

(assert (=> b!1120584 (=> (not res!748139) (not e!638304))))

(assert (=> b!1120584 (= res!748139 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35696 _keys!1208))))))

(declare-fun b!1120585 () Bool)

(declare-fun res!748142 () Bool)

(assert (=> b!1120585 (=> (not res!748142) (not e!638303))))

(declare-datatypes ((List!24469 0))(
  ( (Nil!24466) (Cons!24465 (h!25683 (_ BitVec 64)) (t!34968 List!24469)) )
))
(declare-fun arrayNoDuplicates!0 (array!73025 (_ BitVec 32) List!24469) Bool)

(assert (=> b!1120585 (= res!748142 (arrayNoDuplicates!0 lt!498219 #b00000000000000000000000000000000 Nil!24466))))

(declare-fun b!1120586 () Bool)

(declare-fun e!638302 () Bool)

(assert (=> b!1120586 (= e!638302 tp_is_empty!28045)))

(declare-fun b!1120587 () Bool)

(declare-fun res!748135 () Bool)

(assert (=> b!1120587 (=> (not res!748135) (not e!638304))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1120587 (= res!748135 (validKeyInArray!0 k0!934))))

(declare-fun b!1120588 () Bool)

(declare-fun res!748140 () Bool)

(assert (=> b!1120588 (=> (not res!748140) (not e!638304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120588 (= res!748140 (validMask!0 mask!1564))))

(declare-fun b!1120589 () Bool)

(declare-fun e!638301 () Bool)

(declare-fun mapRes!43885 () Bool)

(assert (=> b!1120589 (= e!638301 (and e!638300 mapRes!43885))))

(declare-fun condMapEmpty!43885 () Bool)

(declare-fun mapDefault!43885 () ValueCell!13313)

(assert (=> b!1120589 (= condMapEmpty!43885 (= (arr!35158 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13313)) mapDefault!43885)))))

(declare-fun b!1120590 () Bool)

(declare-fun res!748136 () Bool)

(assert (=> b!1120590 (=> (not res!748136) (not e!638304))))

(assert (=> b!1120590 (= res!748136 (and (= (size!35695 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35696 _keys!1208) (size!35695 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43885 () Bool)

(assert (=> mapIsEmpty!43885 mapRes!43885))

(declare-fun b!1120591 () Bool)

(assert (=> b!1120591 (= e!638304 e!638303)))

(declare-fun res!748143 () Bool)

(assert (=> b!1120591 (=> (not res!748143) (not e!638303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73025 (_ BitVec 32)) Bool)

(assert (=> b!1120591 (= res!748143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498219 mask!1564))))

(assert (=> b!1120591 (= lt!498219 (array!73026 (store (arr!35159 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35696 _keys!1208)))))

(declare-fun b!1120592 () Bool)

(declare-fun res!748141 () Bool)

(assert (=> b!1120592 (=> (not res!748141) (not e!638304))))

(assert (=> b!1120592 (= res!748141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!43885 () Bool)

(declare-fun tp!83249 () Bool)

(assert (=> mapNonEmpty!43885 (= mapRes!43885 (and tp!83249 e!638302))))

(declare-fun mapKey!43885 () (_ BitVec 32))

(declare-fun mapRest!43885 () (Array (_ BitVec 32) ValueCell!13313))

(declare-fun mapValue!43885 () ValueCell!13313)

(assert (=> mapNonEmpty!43885 (= (arr!35158 _values!996) (store mapRest!43885 mapKey!43885 mapValue!43885))))

(declare-fun res!748137 () Bool)

(assert (=> start!98050 (=> (not res!748137) (not e!638304))))

(assert (=> start!98050 (= res!748137 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35696 _keys!1208))))))

(assert (=> start!98050 e!638304))

(assert (=> start!98050 tp_is_empty!28045))

(declare-fun array_inv!27070 (array!73025) Bool)

(assert (=> start!98050 (array_inv!27070 _keys!1208)))

(assert (=> start!98050 true))

(assert (=> start!98050 tp!83248))

(declare-fun array_inv!27071 (array!73023) Bool)

(assert (=> start!98050 (and (array_inv!27071 _values!996) e!638301)))

(declare-fun b!1120593 () Bool)

(declare-fun res!748134 () Bool)

(assert (=> b!1120593 (=> (not res!748134) (not e!638304))))

(assert (=> b!1120593 (= res!748134 (= (select (arr!35159 _keys!1208) i!673) k0!934))))

(declare-fun b!1120594 () Bool)

(declare-fun res!748138 () Bool)

(assert (=> b!1120594 (=> (not res!748138) (not e!638304))))

(assert (=> b!1120594 (= res!748138 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24466))))

(assert (= (and start!98050 res!748137) b!1120588))

(assert (= (and b!1120588 res!748140) b!1120590))

(assert (= (and b!1120590 res!748136) b!1120592))

(assert (= (and b!1120592 res!748141) b!1120594))

(assert (= (and b!1120594 res!748138) b!1120584))

(assert (= (and b!1120584 res!748139) b!1120587))

(assert (= (and b!1120587 res!748135) b!1120593))

(assert (= (and b!1120593 res!748134) b!1120591))

(assert (= (and b!1120591 res!748143) b!1120585))

(assert (= (and b!1120585 res!748142) b!1120583))

(assert (= (and b!1120583 (not res!748144)) b!1120582))

(assert (= (and b!1120589 condMapEmpty!43885) mapIsEmpty!43885))

(assert (= (and b!1120589 (not condMapEmpty!43885)) mapNonEmpty!43885))

(get-info :version)

(assert (= (and mapNonEmpty!43885 ((_ is ValueCellFull!13313) mapValue!43885)) b!1120586))

(assert (= (and b!1120589 ((_ is ValueCellFull!13313) mapDefault!43885)) b!1120581))

(assert (= start!98050 b!1120589))

(declare-fun b_lambda!18495 () Bool)

(assert (=> (not b_lambda!18495) (not b!1120582)))

(declare-fun t!34966 () Bool)

(declare-fun tb!8319 () Bool)

(assert (=> (and start!98050 (= defaultEntry!1004 defaultEntry!1004) t!34966) tb!8319))

(declare-fun result!17207 () Bool)

(assert (=> tb!8319 (= result!17207 tp_is_empty!28045)))

(assert (=> b!1120582 t!34966))

(declare-fun b_and!37825 () Bool)

(assert (= b_and!37823 (and (=> t!34966 result!17207) b_and!37825)))

(declare-fun m!1036251 () Bool)

(assert (=> b!1120583 m!1036251))

(declare-fun m!1036253 () Bool)

(assert (=> b!1120583 m!1036253))

(declare-fun m!1036255 () Bool)

(assert (=> b!1120591 m!1036255))

(declare-fun m!1036257 () Bool)

(assert (=> b!1120591 m!1036257))

(declare-fun m!1036259 () Bool)

(assert (=> b!1120588 m!1036259))

(declare-fun m!1036261 () Bool)

(assert (=> start!98050 m!1036261))

(declare-fun m!1036263 () Bool)

(assert (=> start!98050 m!1036263))

(declare-fun m!1036265 () Bool)

(assert (=> mapNonEmpty!43885 m!1036265))

(declare-fun m!1036267 () Bool)

(assert (=> b!1120593 m!1036267))

(declare-fun m!1036269 () Bool)

(assert (=> b!1120592 m!1036269))

(declare-fun m!1036271 () Bool)

(assert (=> b!1120594 m!1036271))

(declare-fun m!1036273 () Bool)

(assert (=> b!1120585 m!1036273))

(declare-fun m!1036275 () Bool)

(assert (=> b!1120587 m!1036275))

(declare-fun m!1036277 () Bool)

(assert (=> b!1120582 m!1036277))

(declare-fun m!1036279 () Bool)

(assert (=> b!1120582 m!1036279))

(declare-fun m!1036281 () Bool)

(assert (=> b!1120582 m!1036281))

(declare-fun m!1036283 () Bool)

(assert (=> b!1120582 m!1036283))

(check-sat (not b!1120585) (not b!1120588) (not b!1120583) (not start!98050) (not b!1120594) (not b_lambda!18495) (not mapNonEmpty!43885) b_and!37825 tp_is_empty!28045 (not b_next!23515) (not b!1120592) (not b!1120587) (not b!1120591) (not b!1120582))
(check-sat b_and!37825 (not b_next!23515))
