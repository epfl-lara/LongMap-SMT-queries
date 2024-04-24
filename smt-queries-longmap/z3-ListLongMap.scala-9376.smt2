; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111916 () Bool)

(assert start!111916)

(declare-fun b_free!30349 () Bool)

(declare-fun b_next!30349 () Bool)

(assert (=> start!111916 (= b_free!30349 (not b_next!30349))))

(declare-fun tp!106522 () Bool)

(declare-fun b_and!48859 () Bool)

(assert (=> start!111916 (= tp!106522 b_and!48859)))

(declare-fun b!1324624 () Bool)

(declare-fun e!755299 () Bool)

(declare-fun e!755302 () Bool)

(declare-fun mapRes!55901 () Bool)

(assert (=> b!1324624 (= e!755299 (and e!755302 mapRes!55901))))

(declare-fun condMapEmpty!55901 () Bool)

(declare-datatypes ((V!53329 0))(
  ( (V!53330 (val!18159 Int)) )
))
(declare-datatypes ((ValueCell!17186 0))(
  ( (ValueCellFull!17186 (v!20784 V!53329)) (EmptyCell!17186) )
))
(declare-datatypes ((array!89343 0))(
  ( (array!89344 (arr!43141 (Array (_ BitVec 32) ValueCell!17186)) (size!43692 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89343)

(declare-fun mapDefault!55901 () ValueCell!17186)

(assert (=> b!1324624 (= condMapEmpty!55901 (= (arr!43141 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17186)) mapDefault!55901)))))

(declare-fun mapNonEmpty!55901 () Bool)

(declare-fun tp!106523 () Bool)

(declare-fun e!755301 () Bool)

(assert (=> mapNonEmpty!55901 (= mapRes!55901 (and tp!106523 e!755301))))

(declare-fun mapValue!55901 () ValueCell!17186)

(declare-fun mapRest!55901 () (Array (_ BitVec 32) ValueCell!17186))

(declare-fun mapKey!55901 () (_ BitVec 32))

(assert (=> mapNonEmpty!55901 (= (arr!43141 _values!1337) (store mapRest!55901 mapKey!55901 mapValue!55901))))

(declare-fun b!1324625 () Bool)

(declare-fun res!878889 () Bool)

(declare-fun e!755298 () Bool)

(assert (=> b!1324625 (=> (not res!878889) (not e!755298))))

(declare-datatypes ((array!89345 0))(
  ( (array!89346 (arr!43142 (Array (_ BitVec 32) (_ BitVec 64))) (size!43693 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89345)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324625 (= res!878889 (not (= (select (arr!43142 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1324626 () Bool)

(declare-fun tp_is_empty!36169 () Bool)

(assert (=> b!1324626 (= e!755302 tp_is_empty!36169)))

(declare-fun b!1324627 () Bool)

(assert (=> b!1324627 (= e!755301 tp_is_empty!36169)))

(declare-fun b!1324628 () Bool)

(declare-fun res!878886 () Bool)

(assert (=> b!1324628 (=> (not res!878886) (not e!755298))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53329)

(declare-fun minValue!1279 () V!53329)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23450 0))(
  ( (tuple2!23451 (_1!11736 (_ BitVec 64)) (_2!11736 V!53329)) )
))
(declare-datatypes ((List!30600 0))(
  ( (Nil!30597) (Cons!30596 (h!31814 tuple2!23450) (t!44490 List!30600)) )
))
(declare-datatypes ((ListLongMap!21115 0))(
  ( (ListLongMap!21116 (toList!10573 List!30600)) )
))
(declare-fun contains!8740 (ListLongMap!21115 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5558 (array!89345 array!89343 (_ BitVec 32) (_ BitVec 32) V!53329 V!53329 (_ BitVec 32) Int) ListLongMap!21115)

(assert (=> b!1324628 (= res!878886 (contains!8740 (getCurrentListMap!5558 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324629 () Bool)

(declare-fun res!878888 () Bool)

(assert (=> b!1324629 (=> (not res!878888) (not e!755298))))

(assert (=> b!1324629 (= res!878888 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43693 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!55901 () Bool)

(assert (=> mapIsEmpty!55901 mapRes!55901))

(declare-fun b!1324630 () Bool)

(declare-fun res!878887 () Bool)

(assert (=> b!1324630 (=> (not res!878887) (not e!755298))))

(declare-datatypes ((List!30601 0))(
  ( (Nil!30598) (Cons!30597 (h!31815 (_ BitVec 64)) (t!44491 List!30601)) )
))
(declare-fun arrayNoDuplicates!0 (array!89345 (_ BitVec 32) List!30601) Bool)

(assert (=> b!1324630 (= res!878887 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30598))))

(declare-fun res!878883 () Bool)

(assert (=> start!111916 (=> (not res!878883) (not e!755298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111916 (= res!878883 (validMask!0 mask!2019))))

(assert (=> start!111916 e!755298))

(declare-fun array_inv!32843 (array!89345) Bool)

(assert (=> start!111916 (array_inv!32843 _keys!1609)))

(assert (=> start!111916 true))

(assert (=> start!111916 tp_is_empty!36169))

(declare-fun array_inv!32844 (array!89343) Bool)

(assert (=> start!111916 (and (array_inv!32844 _values!1337) e!755299)))

(assert (=> start!111916 tp!106522))

(declare-fun b!1324631 () Bool)

(assert (=> b!1324631 (= e!755298 (not true))))

(declare-fun lt!589405 () ListLongMap!21115)

(declare-fun +!4645 (ListLongMap!21115 tuple2!23450) ListLongMap!21115)

(assert (=> b!1324631 (contains!8740 (+!4645 lt!589405 (tuple2!23451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279)) k0!1164)))

(declare-datatypes ((Unit!43577 0))(
  ( (Unit!43578) )
))
(declare-fun lt!589407 () Unit!43577)

(declare-fun addStillContains!1157 (ListLongMap!21115 (_ BitVec 64) V!53329 (_ BitVec 64)) Unit!43577)

(assert (=> b!1324631 (= lt!589407 (addStillContains!1157 lt!589405 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 k0!1164))))

(assert (=> b!1324631 (contains!8740 lt!589405 k0!1164)))

(declare-fun lt!589410 () ListLongMap!21115)

(declare-fun lt!589409 () tuple2!23450)

(assert (=> b!1324631 (= lt!589405 (+!4645 lt!589410 lt!589409))))

(declare-fun lt!589403 () Unit!43577)

(assert (=> b!1324631 (= lt!589403 (addStillContains!1157 lt!589410 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 k0!1164))))

(assert (=> b!1324631 (contains!8740 lt!589410 k0!1164)))

(declare-fun lt!589411 () Unit!43577)

(declare-fun lt!589408 () V!53329)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!200 ((_ BitVec 64) (_ BitVec 64) V!53329 ListLongMap!21115) Unit!43577)

(assert (=> b!1324631 (= lt!589411 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 (select (arr!43142 _keys!1609) from!2000) lt!589408 lt!589410))))

(declare-fun lt!589404 () ListLongMap!21115)

(assert (=> b!1324631 (contains!8740 lt!589404 k0!1164)))

(declare-fun lt!589406 () Unit!43577)

(assert (=> b!1324631 (= lt!589406 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589404))))

(declare-fun lt!589402 () ListLongMap!21115)

(assert (=> b!1324631 (contains!8740 lt!589402 k0!1164)))

(declare-fun lt!589412 () Unit!43577)

(assert (=> b!1324631 (= lt!589412 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589402))))

(assert (=> b!1324631 (= lt!589402 (+!4645 lt!589404 lt!589409))))

(assert (=> b!1324631 (= lt!589409 (tuple2!23451 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279))))

(assert (=> b!1324631 (= lt!589404 (+!4645 lt!589410 (tuple2!23451 (select (arr!43142 _keys!1609) from!2000) lt!589408)))))

(declare-fun get!21756 (ValueCell!17186 V!53329) V!53329)

(declare-fun dynLambda!3599 (Int (_ BitVec 64)) V!53329)

(assert (=> b!1324631 (= lt!589408 (get!21756 (select (arr!43141 _values!1337) from!2000) (dynLambda!3599 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6284 (array!89345 array!89343 (_ BitVec 32) (_ BitVec 32) V!53329 V!53329 (_ BitVec 32) Int) ListLongMap!21115)

(assert (=> b!1324631 (= lt!589410 (getCurrentListMapNoExtraKeys!6284 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1324632 () Bool)

(declare-fun res!878884 () Bool)

(assert (=> b!1324632 (=> (not res!878884) (not e!755298))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1324632 (= res!878884 (validKeyInArray!0 (select (arr!43142 _keys!1609) from!2000)))))

(declare-fun b!1324633 () Bool)

(declare-fun res!878890 () Bool)

(assert (=> b!1324633 (=> (not res!878890) (not e!755298))))

(assert (=> b!1324633 (= res!878890 (and (= (size!43692 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43693 _keys!1609) (size!43692 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324634 () Bool)

(declare-fun res!878885 () Bool)

(assert (=> b!1324634 (=> (not res!878885) (not e!755298))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89345 (_ BitVec 32)) Bool)

(assert (=> b!1324634 (= res!878885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(assert (= (and start!111916 res!878883) b!1324633))

(assert (= (and b!1324633 res!878890) b!1324634))

(assert (= (and b!1324634 res!878885) b!1324630))

(assert (= (and b!1324630 res!878887) b!1324629))

(assert (= (and b!1324629 res!878888) b!1324628))

(assert (= (and b!1324628 res!878886) b!1324625))

(assert (= (and b!1324625 res!878889) b!1324632))

(assert (= (and b!1324632 res!878884) b!1324631))

(assert (= (and b!1324624 condMapEmpty!55901) mapIsEmpty!55901))

(assert (= (and b!1324624 (not condMapEmpty!55901)) mapNonEmpty!55901))

(get-info :version)

(assert (= (and mapNonEmpty!55901 ((_ is ValueCellFull!17186) mapValue!55901)) b!1324627))

(assert (= (and b!1324624 ((_ is ValueCellFull!17186) mapDefault!55901)) b!1324626))

(assert (= start!111916 b!1324624))

(declare-fun b_lambda!23669 () Bool)

(assert (=> (not b_lambda!23669) (not b!1324631)))

(declare-fun t!44489 () Bool)

(declare-fun tb!11693 () Bool)

(assert (=> (and start!111916 (= defaultEntry!1340 defaultEntry!1340) t!44489) tb!11693))

(declare-fun result!24449 () Bool)

(assert (=> tb!11693 (= result!24449 tp_is_empty!36169)))

(assert (=> b!1324631 t!44489))

(declare-fun b_and!48861 () Bool)

(assert (= b_and!48859 (and (=> t!44489 result!24449) b_and!48861)))

(declare-fun m!1213661 () Bool)

(assert (=> b!1324634 m!1213661))

(declare-fun m!1213663 () Bool)

(assert (=> b!1324630 m!1213663))

(declare-fun m!1213665 () Bool)

(assert (=> b!1324632 m!1213665))

(assert (=> b!1324632 m!1213665))

(declare-fun m!1213667 () Bool)

(assert (=> b!1324632 m!1213667))

(declare-fun m!1213669 () Bool)

(assert (=> b!1324631 m!1213669))

(declare-fun m!1213671 () Bool)

(assert (=> b!1324631 m!1213671))

(declare-fun m!1213673 () Bool)

(assert (=> b!1324631 m!1213673))

(assert (=> b!1324631 m!1213665))

(declare-fun m!1213675 () Bool)

(assert (=> b!1324631 m!1213675))

(declare-fun m!1213677 () Bool)

(assert (=> b!1324631 m!1213677))

(declare-fun m!1213679 () Bool)

(assert (=> b!1324631 m!1213679))

(declare-fun m!1213681 () Bool)

(assert (=> b!1324631 m!1213681))

(declare-fun m!1213683 () Bool)

(assert (=> b!1324631 m!1213683))

(declare-fun m!1213685 () Bool)

(assert (=> b!1324631 m!1213685))

(assert (=> b!1324631 m!1213679))

(assert (=> b!1324631 m!1213673))

(declare-fun m!1213687 () Bool)

(assert (=> b!1324631 m!1213687))

(assert (=> b!1324631 m!1213665))

(declare-fun m!1213689 () Bool)

(assert (=> b!1324631 m!1213689))

(declare-fun m!1213691 () Bool)

(assert (=> b!1324631 m!1213691))

(declare-fun m!1213693 () Bool)

(assert (=> b!1324631 m!1213693))

(declare-fun m!1213695 () Bool)

(assert (=> b!1324631 m!1213695))

(declare-fun m!1213697 () Bool)

(assert (=> b!1324631 m!1213697))

(declare-fun m!1213699 () Bool)

(assert (=> b!1324631 m!1213699))

(declare-fun m!1213701 () Bool)

(assert (=> b!1324631 m!1213701))

(declare-fun m!1213703 () Bool)

(assert (=> b!1324631 m!1213703))

(assert (=> b!1324631 m!1213701))

(declare-fun m!1213705 () Bool)

(assert (=> mapNonEmpty!55901 m!1213705))

(declare-fun m!1213707 () Bool)

(assert (=> b!1324628 m!1213707))

(assert (=> b!1324628 m!1213707))

(declare-fun m!1213709 () Bool)

(assert (=> b!1324628 m!1213709))

(declare-fun m!1213711 () Bool)

(assert (=> start!111916 m!1213711))

(declare-fun m!1213713 () Bool)

(assert (=> start!111916 m!1213713))

(declare-fun m!1213715 () Bool)

(assert (=> start!111916 m!1213715))

(assert (=> b!1324625 m!1213665))

(check-sat (not b!1324631) (not b!1324628) (not b!1324634) (not mapNonEmpty!55901) (not start!111916) (not b_lambda!23669) (not b!1324632) (not b_next!30349) b_and!48861 (not b!1324630) tp_is_empty!36169)
(check-sat b_and!48861 (not b_next!30349))
