; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113132 () Bool)

(assert start!113132)

(declare-fun b_free!31183 () Bool)

(declare-fun b_next!31183 () Bool)

(assert (=> start!113132 (= b_free!31183 (not b_next!31183))))

(declare-fun tp!109354 () Bool)

(declare-fun b_and!50255 () Bool)

(assert (=> start!113132 (= tp!109354 b_and!50255)))

(declare-fun b!1341301 () Bool)

(declare-fun res!889839 () Bool)

(declare-fun e!763819 () Bool)

(assert (=> b!1341301 (=> (not res!889839) (not e!763819))))

(declare-datatypes ((array!91159 0))(
  ( (array!91160 (arr!44036 (Array (_ BitVec 32) (_ BitVec 64))) (size!44588 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91159)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341301 (= res!889839 (validKeyInArray!0 (select (arr!44036 _keys!1571) from!1960)))))

(declare-fun b!1341302 () Bool)

(assert (=> b!1341302 (= e!763819 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!54681 0))(
  ( (V!54682 (val!18666 Int)) )
))
(declare-datatypes ((tuple2!24086 0))(
  ( (tuple2!24087 (_1!12054 (_ BitVec 64)) (_2!12054 V!54681)) )
))
(declare-datatypes ((List!31236 0))(
  ( (Nil!31233) (Cons!31232 (h!32441 tuple2!24086) (t!45622 List!31236)) )
))
(declare-datatypes ((ListLongMap!21743 0))(
  ( (ListLongMap!21744 (toList!10887 List!31236)) )
))
(declare-fun lt!593948 () ListLongMap!21743)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!8992 (ListLongMap!21743 (_ BitVec 64)) Bool)

(assert (=> b!1341302 (contains!8992 lt!593948 k0!1142)))

(declare-datatypes ((Unit!43830 0))(
  ( (Unit!43831) )
))
(declare-fun lt!593949 () Unit!43830)

(declare-fun zeroValue!1245 () V!54681)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!333 ((_ BitVec 64) (_ BitVec 64) V!54681 ListLongMap!21743) Unit!43830)

(assert (=> b!1341302 (= lt!593949 (lemmaInListMapAfterAddingDiffThenInBefore!333 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593948))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17693 0))(
  ( (ValueCellFull!17693 (v!21313 V!54681)) (EmptyCell!17693) )
))
(declare-datatypes ((array!91161 0))(
  ( (array!91162 (arr!44037 (Array (_ BitVec 32) ValueCell!17693)) (size!44589 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91161)

(declare-fun minValue!1245 () V!54681)

(declare-fun +!4794 (ListLongMap!21743 tuple2!24086) ListLongMap!21743)

(declare-fun getCurrentListMapNoExtraKeys!6437 (array!91159 array!91161 (_ BitVec 32) (_ BitVec 32) V!54681 V!54681 (_ BitVec 32) Int) ListLongMap!21743)

(declare-fun get!22228 (ValueCell!17693 V!54681) V!54681)

(declare-fun dynLambda!3724 (Int (_ BitVec 64)) V!54681)

(assert (=> b!1341302 (= lt!593948 (+!4794 (getCurrentListMapNoExtraKeys!6437 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24087 (select (arr!44036 _keys!1571) from!1960) (get!22228 (select (arr!44037 _values!1303) from!1960) (dynLambda!3724 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341303 () Bool)

(declare-fun res!889844 () Bool)

(assert (=> b!1341303 (=> (not res!889844) (not e!763819))))

(assert (=> b!1341303 (= res!889844 (not (= (select (arr!44036 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!889842 () Bool)

(assert (=> start!113132 (=> (not res!889842) (not e!763819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113132 (= res!889842 (validMask!0 mask!1977))))

(assert (=> start!113132 e!763819))

(declare-fun tp_is_empty!37183 () Bool)

(assert (=> start!113132 tp_is_empty!37183))

(assert (=> start!113132 true))

(declare-fun array_inv!33389 (array!91159) Bool)

(assert (=> start!113132 (array_inv!33389 _keys!1571)))

(declare-fun e!763820 () Bool)

(declare-fun array_inv!33390 (array!91161) Bool)

(assert (=> start!113132 (and (array_inv!33390 _values!1303) e!763820)))

(assert (=> start!113132 tp!109354))

(declare-fun mapNonEmpty!57481 () Bool)

(declare-fun mapRes!57481 () Bool)

(declare-fun tp!109355 () Bool)

(declare-fun e!763816 () Bool)

(assert (=> mapNonEmpty!57481 (= mapRes!57481 (and tp!109355 e!763816))))

(declare-fun mapKey!57481 () (_ BitVec 32))

(declare-fun mapRest!57481 () (Array (_ BitVec 32) ValueCell!17693))

(declare-fun mapValue!57481 () ValueCell!17693)

(assert (=> mapNonEmpty!57481 (= (arr!44037 _values!1303) (store mapRest!57481 mapKey!57481 mapValue!57481))))

(declare-fun b!1341304 () Bool)

(declare-fun res!889838 () Bool)

(assert (=> b!1341304 (=> (not res!889838) (not e!763819))))

(assert (=> b!1341304 (= res!889838 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341305 () Bool)

(declare-fun res!889840 () Bool)

(assert (=> b!1341305 (=> (not res!889840) (not e!763819))))

(declare-datatypes ((List!31237 0))(
  ( (Nil!31234) (Cons!31233 (h!32442 (_ BitVec 64)) (t!45623 List!31237)) )
))
(declare-fun arrayNoDuplicates!0 (array!91159 (_ BitVec 32) List!31237) Bool)

(assert (=> b!1341305 (= res!889840 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31234))))

(declare-fun b!1341306 () Bool)

(declare-fun res!889841 () Bool)

(assert (=> b!1341306 (=> (not res!889841) (not e!763819))))

(assert (=> b!1341306 (= res!889841 (and (= (size!44589 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44588 _keys!1571) (size!44589 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341307 () Bool)

(declare-fun res!889843 () Bool)

(assert (=> b!1341307 (=> (not res!889843) (not e!763819))))

(declare-fun getCurrentListMap!5740 (array!91159 array!91161 (_ BitVec 32) (_ BitVec 32) V!54681 V!54681 (_ BitVec 32) Int) ListLongMap!21743)

(assert (=> b!1341307 (= res!889843 (contains!8992 (getCurrentListMap!5740 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341308 () Bool)

(declare-fun e!763818 () Bool)

(assert (=> b!1341308 (= e!763818 tp_is_empty!37183)))

(declare-fun b!1341309 () Bool)

(assert (=> b!1341309 (= e!763816 tp_is_empty!37183)))

(declare-fun mapIsEmpty!57481 () Bool)

(assert (=> mapIsEmpty!57481 mapRes!57481))

(declare-fun b!1341310 () Bool)

(declare-fun res!889846 () Bool)

(assert (=> b!1341310 (=> (not res!889846) (not e!763819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91159 (_ BitVec 32)) Bool)

(assert (=> b!1341310 (= res!889846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341311 () Bool)

(declare-fun res!889845 () Bool)

(assert (=> b!1341311 (=> (not res!889845) (not e!763819))))

(assert (=> b!1341311 (= res!889845 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44588 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341312 () Bool)

(assert (=> b!1341312 (= e!763820 (and e!763818 mapRes!57481))))

(declare-fun condMapEmpty!57481 () Bool)

(declare-fun mapDefault!57481 () ValueCell!17693)

(assert (=> b!1341312 (= condMapEmpty!57481 (= (arr!44037 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17693)) mapDefault!57481)))))

(assert (= (and start!113132 res!889842) b!1341306))

(assert (= (and b!1341306 res!889841) b!1341310))

(assert (= (and b!1341310 res!889846) b!1341305))

(assert (= (and b!1341305 res!889840) b!1341311))

(assert (= (and b!1341311 res!889845) b!1341307))

(assert (= (and b!1341307 res!889843) b!1341303))

(assert (= (and b!1341303 res!889844) b!1341301))

(assert (= (and b!1341301 res!889839) b!1341304))

(assert (= (and b!1341304 res!889838) b!1341302))

(assert (= (and b!1341312 condMapEmpty!57481) mapIsEmpty!57481))

(assert (= (and b!1341312 (not condMapEmpty!57481)) mapNonEmpty!57481))

(get-info :version)

(assert (= (and mapNonEmpty!57481 ((_ is ValueCellFull!17693) mapValue!57481)) b!1341309))

(assert (= (and b!1341312 ((_ is ValueCellFull!17693) mapDefault!57481)) b!1341308))

(assert (= start!113132 b!1341312))

(declare-fun b_lambda!24349 () Bool)

(assert (=> (not b_lambda!24349) (not b!1341302)))

(declare-fun t!45621 () Bool)

(declare-fun tb!12189 () Bool)

(assert (=> (and start!113132 (= defaultEntry!1306 defaultEntry!1306) t!45621) tb!12189))

(declare-fun result!25477 () Bool)

(assert (=> tb!12189 (= result!25477 tp_is_empty!37183)))

(assert (=> b!1341302 t!45621))

(declare-fun b_and!50257 () Bool)

(assert (= b_and!50255 (and (=> t!45621 result!25477) b_and!50257)))

(declare-fun m!1228513 () Bool)

(assert (=> b!1341301 m!1228513))

(assert (=> b!1341301 m!1228513))

(declare-fun m!1228515 () Bool)

(assert (=> b!1341301 m!1228515))

(declare-fun m!1228517 () Bool)

(assert (=> b!1341302 m!1228517))

(declare-fun m!1228519 () Bool)

(assert (=> b!1341302 m!1228519))

(declare-fun m!1228521 () Bool)

(assert (=> b!1341302 m!1228521))

(declare-fun m!1228523 () Bool)

(assert (=> b!1341302 m!1228523))

(assert (=> b!1341302 m!1228517))

(declare-fun m!1228525 () Bool)

(assert (=> b!1341302 m!1228525))

(assert (=> b!1341302 m!1228519))

(declare-fun m!1228527 () Bool)

(assert (=> b!1341302 m!1228527))

(assert (=> b!1341302 m!1228521))

(declare-fun m!1228529 () Bool)

(assert (=> b!1341302 m!1228529))

(assert (=> b!1341302 m!1228513))

(declare-fun m!1228531 () Bool)

(assert (=> b!1341305 m!1228531))

(declare-fun m!1228533 () Bool)

(assert (=> b!1341310 m!1228533))

(declare-fun m!1228535 () Bool)

(assert (=> start!113132 m!1228535))

(declare-fun m!1228537 () Bool)

(assert (=> start!113132 m!1228537))

(declare-fun m!1228539 () Bool)

(assert (=> start!113132 m!1228539))

(declare-fun m!1228541 () Bool)

(assert (=> mapNonEmpty!57481 m!1228541))

(declare-fun m!1228543 () Bool)

(assert (=> b!1341307 m!1228543))

(assert (=> b!1341307 m!1228543))

(declare-fun m!1228545 () Bool)

(assert (=> b!1341307 m!1228545))

(assert (=> b!1341303 m!1228513))

(check-sat (not b!1341305) (not b_lambda!24349) tp_is_empty!37183 (not mapNonEmpty!57481) b_and!50257 (not start!113132) (not b!1341302) (not b!1341310) (not b_next!31183) (not b!1341307) (not b!1341301))
(check-sat b_and!50257 (not b_next!31183))
