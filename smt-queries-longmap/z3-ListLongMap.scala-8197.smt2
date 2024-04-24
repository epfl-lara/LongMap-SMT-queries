; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100284 () Bool)

(assert start!100284)

(declare-fun b_free!25627 () Bool)

(declare-fun b_next!25627 () Bool)

(assert (=> start!100284 (= b_free!25627 (not b_next!25627))))

(declare-fun tp!89594 () Bool)

(declare-fun b_and!42123 () Bool)

(assert (=> start!100284 (= tp!89594 b_and!42123)))

(declare-fun b!1193697 () Bool)

(declare-fun res!793729 () Bool)

(declare-fun e!678599 () Bool)

(assert (=> b!1193697 (=> (not res!793729) (not e!678599))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193697 (= res!793729 (validKeyInArray!0 k0!934))))

(declare-fun b!1193698 () Bool)

(declare-fun e!678597 () Bool)

(declare-fun e!678595 () Bool)

(assert (=> b!1193698 (= e!678597 e!678595)))

(declare-fun res!793735 () Bool)

(assert (=> b!1193698 (=> res!793735 e!678595)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193698 (= res!793735 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-datatypes ((V!45337 0))(
  ( (V!45338 (val!15135 Int)) )
))
(declare-fun zeroValue!944 () V!45337)

(declare-datatypes ((tuple2!19488 0))(
  ( (tuple2!19489 (_1!9755 (_ BitVec 64)) (_2!9755 V!45337)) )
))
(declare-datatypes ((List!26230 0))(
  ( (Nil!26227) (Cons!26226 (h!27444 tuple2!19488) (t!38841 List!26230)) )
))
(declare-datatypes ((ListLongMap!17465 0))(
  ( (ListLongMap!17466 (toList!8748 List!26230)) )
))
(declare-fun lt!542690 () ListLongMap!17465)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((array!77141 0))(
  ( (array!77142 (arr!37214 (Array (_ BitVec 32) (_ BitVec 64))) (size!37751 (_ BitVec 32))) )
))
(declare-fun lt!542692 () array!77141)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14369 0))(
  ( (ValueCellFull!14369 (v!17769 V!45337)) (EmptyCell!14369) )
))
(declare-datatypes ((array!77143 0))(
  ( (array!77144 (arr!37215 (Array (_ BitVec 32) ValueCell!14369)) (size!37752 (_ BitVec 32))) )
))
(declare-fun lt!542687 () array!77143)

(declare-fun minValue!944 () V!45337)

(declare-fun getCurrentListMapNoExtraKeys!5216 (array!77141 array!77143 (_ BitVec 32) (_ BitVec 32) V!45337 V!45337 (_ BitVec 32) Int) ListLongMap!17465)

(assert (=> b!1193698 (= lt!542690 (getCurrentListMapNoExtraKeys!5216 lt!542692 lt!542687 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!77143)

(declare-fun dynLambda!3166 (Int (_ BitVec 64)) V!45337)

(assert (=> b!1193698 (= lt!542687 (array!77144 (store (arr!37215 _values!996) i!673 (ValueCellFull!14369 (dynLambda!3166 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37752 _values!996)))))

(declare-fun _keys!1208 () array!77141)

(declare-fun lt!542691 () ListLongMap!17465)

(assert (=> b!1193698 (= lt!542691 (getCurrentListMapNoExtraKeys!5216 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1193699 () Bool)

(declare-fun e!678601 () Bool)

(assert (=> b!1193699 (= e!678599 e!678601)))

(declare-fun res!793738 () Bool)

(assert (=> b!1193699 (=> (not res!793738) (not e!678601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77141 (_ BitVec 32)) Bool)

(assert (=> b!1193699 (= res!793738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542692 mask!1564))))

(assert (=> b!1193699 (= lt!542692 (array!77142 (store (arr!37214 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37751 _keys!1208)))))

(declare-fun b!1193700 () Bool)

(declare-fun res!793731 () Bool)

(assert (=> b!1193700 (=> (not res!793731) (not e!678599))))

(assert (=> b!1193700 (= res!793731 (and (= (size!37752 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37751 _keys!1208) (size!37752 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun res!793730 () Bool)

(assert (=> start!100284 (=> (not res!793730) (not e!678599))))

(assert (=> start!100284 (= res!793730 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37751 _keys!1208))))))

(assert (=> start!100284 e!678599))

(declare-fun tp_is_empty!30157 () Bool)

(assert (=> start!100284 tp_is_empty!30157))

(declare-fun array_inv!28438 (array!77141) Bool)

(assert (=> start!100284 (array_inv!28438 _keys!1208)))

(assert (=> start!100284 true))

(assert (=> start!100284 tp!89594))

(declare-fun e!678600 () Bool)

(declare-fun array_inv!28439 (array!77143) Bool)

(assert (=> start!100284 (and (array_inv!28439 _values!996) e!678600)))

(declare-fun b!1193701 () Bool)

(declare-fun res!793736 () Bool)

(assert (=> b!1193701 (=> (not res!793736) (not e!678599))))

(assert (=> b!1193701 (= res!793736 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37751 _keys!1208))))))

(declare-fun b!1193702 () Bool)

(declare-fun res!793733 () Bool)

(assert (=> b!1193702 (=> (not res!793733) (not e!678599))))

(assert (=> b!1193702 (= res!793733 (= (select (arr!37214 _keys!1208) i!673) k0!934))))

(declare-fun b!1193703 () Bool)

(declare-fun e!678598 () Bool)

(assert (=> b!1193703 (= e!678598 tp_is_empty!30157)))

(declare-fun mapNonEmpty!47063 () Bool)

(declare-fun mapRes!47063 () Bool)

(declare-fun tp!89595 () Bool)

(assert (=> mapNonEmpty!47063 (= mapRes!47063 (and tp!89595 e!678598))))

(declare-fun mapRest!47063 () (Array (_ BitVec 32) ValueCell!14369))

(declare-fun mapValue!47063 () ValueCell!14369)

(declare-fun mapKey!47063 () (_ BitVec 32))

(assert (=> mapNonEmpty!47063 (= (arr!37215 _values!996) (store mapRest!47063 mapKey!47063 mapValue!47063))))

(declare-fun b!1193704 () Bool)

(declare-fun res!793734 () Bool)

(assert (=> b!1193704 (=> (not res!793734) (not e!678599))))

(assert (=> b!1193704 (= res!793734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193705 () Bool)

(declare-fun e!678596 () Bool)

(assert (=> b!1193705 (= e!678596 tp_is_empty!30157)))

(declare-fun mapIsEmpty!47063 () Bool)

(assert (=> mapIsEmpty!47063 mapRes!47063))

(declare-fun b!1193706 () Bool)

(assert (=> b!1193706 (= e!678595 true)))

(declare-fun -!1755 (ListLongMap!17465 (_ BitVec 64)) ListLongMap!17465)

(assert (=> b!1193706 (= (getCurrentListMapNoExtraKeys!5216 lt!542692 lt!542687 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) (-!1755 (getCurrentListMapNoExtraKeys!5216 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-datatypes ((Unit!39537 0))(
  ( (Unit!39538) )
))
(declare-fun lt!542688 () Unit!39537)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!970 (array!77141 array!77143 (_ BitVec 32) (_ BitVec 32) V!45337 V!45337 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39537)

(assert (=> b!1193706 (= lt!542688 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!970 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1193707 () Bool)

(declare-fun res!793732 () Bool)

(assert (=> b!1193707 (=> (not res!793732) (not e!678599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193707 (= res!793732 (validMask!0 mask!1564))))

(declare-fun b!1193708 () Bool)

(assert (=> b!1193708 (= e!678601 (not e!678597))))

(declare-fun res!793739 () Bool)

(assert (=> b!1193708 (=> res!793739 e!678597)))

(assert (=> b!1193708 (= res!793739 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1193708 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!542689 () Unit!39537)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77141 (_ BitVec 64) (_ BitVec 32)) Unit!39537)

(assert (=> b!1193708 (= lt!542689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1193709 () Bool)

(declare-fun res!793728 () Bool)

(assert (=> b!1193709 (=> (not res!793728) (not e!678599))))

(declare-datatypes ((List!26231 0))(
  ( (Nil!26228) (Cons!26227 (h!27445 (_ BitVec 64)) (t!38842 List!26231)) )
))
(declare-fun arrayNoDuplicates!0 (array!77141 (_ BitVec 32) List!26231) Bool)

(assert (=> b!1193709 (= res!793728 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26228))))

(declare-fun b!1193710 () Bool)

(assert (=> b!1193710 (= e!678600 (and e!678596 mapRes!47063))))

(declare-fun condMapEmpty!47063 () Bool)

(declare-fun mapDefault!47063 () ValueCell!14369)

(assert (=> b!1193710 (= condMapEmpty!47063 (= (arr!37215 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14369)) mapDefault!47063)))))

(declare-fun b!1193711 () Bool)

(declare-fun res!793737 () Bool)

(assert (=> b!1193711 (=> (not res!793737) (not e!678601))))

(assert (=> b!1193711 (= res!793737 (arrayNoDuplicates!0 lt!542692 #b00000000000000000000000000000000 Nil!26228))))

(assert (= (and start!100284 res!793730) b!1193707))

(assert (= (and b!1193707 res!793732) b!1193700))

(assert (= (and b!1193700 res!793731) b!1193704))

(assert (= (and b!1193704 res!793734) b!1193709))

(assert (= (and b!1193709 res!793728) b!1193701))

(assert (= (and b!1193701 res!793736) b!1193697))

(assert (= (and b!1193697 res!793729) b!1193702))

(assert (= (and b!1193702 res!793733) b!1193699))

(assert (= (and b!1193699 res!793738) b!1193711))

(assert (= (and b!1193711 res!793737) b!1193708))

(assert (= (and b!1193708 (not res!793739)) b!1193698))

(assert (= (and b!1193698 (not res!793735)) b!1193706))

(assert (= (and b!1193710 condMapEmpty!47063) mapIsEmpty!47063))

(assert (= (and b!1193710 (not condMapEmpty!47063)) mapNonEmpty!47063))

(get-info :version)

(assert (= (and mapNonEmpty!47063 ((_ is ValueCellFull!14369) mapValue!47063)) b!1193703))

(assert (= (and b!1193710 ((_ is ValueCellFull!14369) mapDefault!47063)) b!1193705))

(assert (= start!100284 b!1193710))

(declare-fun b_lambda!20765 () Bool)

(assert (=> (not b_lambda!20765) (not b!1193698)))

(declare-fun t!38840 () Bool)

(declare-fun tb!10431 () Bool)

(assert (=> (and start!100284 (= defaultEntry!1004 defaultEntry!1004) t!38840) tb!10431))

(declare-fun result!21437 () Bool)

(assert (=> tb!10431 (= result!21437 tp_is_empty!30157)))

(assert (=> b!1193698 t!38840))

(declare-fun b_and!42125 () Bool)

(assert (= b_and!42123 (and (=> t!38840 result!21437) b_and!42125)))

(declare-fun m!1102341 () Bool)

(assert (=> b!1193706 m!1102341))

(declare-fun m!1102343 () Bool)

(assert (=> b!1193706 m!1102343))

(assert (=> b!1193706 m!1102343))

(declare-fun m!1102345 () Bool)

(assert (=> b!1193706 m!1102345))

(declare-fun m!1102347 () Bool)

(assert (=> b!1193706 m!1102347))

(declare-fun m!1102349 () Bool)

(assert (=> b!1193709 m!1102349))

(declare-fun m!1102351 () Bool)

(assert (=> b!1193711 m!1102351))

(declare-fun m!1102353 () Bool)

(assert (=> b!1193698 m!1102353))

(declare-fun m!1102355 () Bool)

(assert (=> b!1193698 m!1102355))

(declare-fun m!1102357 () Bool)

(assert (=> b!1193698 m!1102357))

(declare-fun m!1102359 () Bool)

(assert (=> b!1193698 m!1102359))

(declare-fun m!1102361 () Bool)

(assert (=> b!1193707 m!1102361))

(declare-fun m!1102363 () Bool)

(assert (=> b!1193704 m!1102363))

(declare-fun m!1102365 () Bool)

(assert (=> b!1193708 m!1102365))

(declare-fun m!1102367 () Bool)

(assert (=> b!1193708 m!1102367))

(declare-fun m!1102369 () Bool)

(assert (=> mapNonEmpty!47063 m!1102369))

(declare-fun m!1102371 () Bool)

(assert (=> b!1193697 m!1102371))

(declare-fun m!1102373 () Bool)

(assert (=> b!1193699 m!1102373))

(declare-fun m!1102375 () Bool)

(assert (=> b!1193699 m!1102375))

(declare-fun m!1102377 () Bool)

(assert (=> b!1193702 m!1102377))

(declare-fun m!1102379 () Bool)

(assert (=> start!100284 m!1102379))

(declare-fun m!1102381 () Bool)

(assert (=> start!100284 m!1102381))

(check-sat (not b!1193707) (not b!1193709) (not b_next!25627) (not b!1193704) (not b!1193697) (not mapNonEmpty!47063) (not start!100284) (not b!1193698) (not b!1193706) (not b!1193699) b_and!42125 (not b!1193708) (not b!1193711) tp_is_empty!30157 (not b_lambda!20765))
(check-sat b_and!42125 (not b_next!25627))
