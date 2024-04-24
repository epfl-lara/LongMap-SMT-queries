; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112604 () Bool)

(assert start!112604)

(declare-fun b_free!30775 () Bool)

(declare-fun b_next!30775 () Bool)

(assert (=> start!112604 (= b_free!30775 (not b_next!30775))))

(declare-fun tp!107961 () Bool)

(declare-fun b_and!49607 () Bool)

(assert (=> start!112604 (= tp!107961 b_and!49607)))

(declare-fun b!1333586 () Bool)

(declare-fun e!759859 () Bool)

(declare-fun e!759857 () Bool)

(declare-fun mapRes!56701 () Bool)

(assert (=> b!1333586 (= e!759859 (and e!759857 mapRes!56701))))

(declare-fun condMapEmpty!56701 () Bool)

(declare-datatypes ((V!54017 0))(
  ( (V!54018 (val!18417 Int)) )
))
(declare-datatypes ((ValueCell!17444 0))(
  ( (ValueCellFull!17444 (v!21049 V!54017)) (EmptyCell!17444) )
))
(declare-datatypes ((array!90355 0))(
  ( (array!90356 (arr!43639 (Array (_ BitVec 32) ValueCell!17444)) (size!44190 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90355)

(declare-fun mapDefault!56701 () ValueCell!17444)

(assert (=> b!1333586 (= condMapEmpty!56701 (= (arr!43639 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17444)) mapDefault!56701)))))

(declare-fun mapNonEmpty!56701 () Bool)

(declare-fun tp!107962 () Bool)

(declare-fun e!759858 () Bool)

(assert (=> mapNonEmpty!56701 (= mapRes!56701 (and tp!107962 e!759858))))

(declare-fun mapKey!56701 () (_ BitVec 32))

(declare-fun mapValue!56701 () ValueCell!17444)

(declare-fun mapRest!56701 () (Array (_ BitVec 32) ValueCell!17444))

(assert (=> mapNonEmpty!56701 (= (arr!43639 _values!1320) (store mapRest!56701 mapKey!56701 mapValue!56701))))

(declare-fun b!1333587 () Bool)

(declare-fun res!884645 () Bool)

(declare-fun e!759855 () Bool)

(assert (=> b!1333587 (=> (not res!884645) (not e!759855))))

(declare-datatypes ((array!90357 0))(
  ( (array!90358 (arr!43640 (Array (_ BitVec 32) (_ BitVec 64))) (size!44191 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90357)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1333587 (= res!884645 (validKeyInArray!0 (select (arr!43640 _keys!1590) from!1980)))))

(declare-fun b!1333588 () Bool)

(declare-fun res!884642 () Bool)

(assert (=> b!1333588 (=> (not res!884642) (not e!759855))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54017)

(declare-fun zeroValue!1262 () V!54017)

(declare-datatypes ((tuple2!23766 0))(
  ( (tuple2!23767 (_1!11894 (_ BitVec 64)) (_2!11894 V!54017)) )
))
(declare-datatypes ((List!30925 0))(
  ( (Nil!30922) (Cons!30921 (h!32139 tuple2!23766) (t!45105 List!30925)) )
))
(declare-datatypes ((ListLongMap!21431 0))(
  ( (ListLongMap!21432 (toList!10731 List!30925)) )
))
(declare-fun contains!8907 (ListLongMap!21431 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5698 (array!90357 array!90355 (_ BitVec 32) (_ BitVec 32) V!54017 V!54017 (_ BitVec 32) Int) ListLongMap!21431)

(assert (=> b!1333588 (= res!884642 (contains!8907 (getCurrentListMap!5698 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1333589 () Bool)

(declare-fun res!884637 () Bool)

(assert (=> b!1333589 (=> (not res!884637) (not e!759855))))

(assert (=> b!1333589 (= res!884637 (and (= (size!44190 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44191 _keys!1590) (size!44190 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1333590 () Bool)

(declare-fun res!884640 () Bool)

(assert (=> b!1333590 (=> (not res!884640) (not e!759855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90357 (_ BitVec 32)) Bool)

(assert (=> b!1333590 (= res!884640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1333591 () Bool)

(declare-fun res!884643 () Bool)

(assert (=> b!1333591 (=> (not res!884643) (not e!759855))))

(assert (=> b!1333591 (= res!884643 (not (= (select (arr!43640 _keys!1590) from!1980) k0!1153)))))

(declare-fun res!884639 () Bool)

(assert (=> start!112604 (=> (not res!884639) (not e!759855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112604 (= res!884639 (validMask!0 mask!1998))))

(assert (=> start!112604 e!759855))

(declare-fun array_inv!33193 (array!90355) Bool)

(assert (=> start!112604 (and (array_inv!33193 _values!1320) e!759859)))

(assert (=> start!112604 true))

(declare-fun array_inv!33194 (array!90357) Bool)

(assert (=> start!112604 (array_inv!33194 _keys!1590)))

(assert (=> start!112604 tp!107961))

(declare-fun tp_is_empty!36685 () Bool)

(assert (=> start!112604 tp_is_empty!36685))

(declare-fun b!1333592 () Bool)

(declare-fun res!884638 () Bool)

(assert (=> b!1333592 (=> (not res!884638) (not e!759855))))

(assert (=> b!1333592 (= res!884638 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1333593 () Bool)

(assert (=> b!1333593 (= e!759858 tp_is_empty!36685)))

(declare-fun b!1333594 () Bool)

(declare-fun res!884641 () Bool)

(assert (=> b!1333594 (=> (not res!884641) (not e!759855))))

(declare-datatypes ((List!30926 0))(
  ( (Nil!30923) (Cons!30922 (h!32140 (_ BitVec 64)) (t!45106 List!30926)) )
))
(declare-fun arrayNoDuplicates!0 (array!90357 (_ BitVec 32) List!30926) Bool)

(assert (=> b!1333594 (= res!884641 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30923))))

(declare-fun b!1333595 () Bool)

(assert (=> b!1333595 (= e!759855 (not true))))

(declare-fun lt!592411 () ListLongMap!21431)

(declare-fun +!4739 (ListLongMap!21431 tuple2!23766) ListLongMap!21431)

(assert (=> b!1333595 (contains!8907 (+!4739 lt!592411 (tuple2!23767 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43788 0))(
  ( (Unit!43789) )
))
(declare-fun lt!592413 () Unit!43788)

(declare-fun addStillContains!1185 (ListLongMap!21431 (_ BitVec 64) V!54017 (_ BitVec 64)) Unit!43788)

(assert (=> b!1333595 (= lt!592413 (addStillContains!1185 lt!592411 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1333595 (contains!8907 lt!592411 k0!1153)))

(declare-fun lt!592415 () V!54017)

(declare-fun lt!592416 () Unit!43788)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!282 ((_ BitVec 64) (_ BitVec 64) V!54017 ListLongMap!21431) Unit!43788)

(assert (=> b!1333595 (= lt!592416 (lemmaInListMapAfterAddingDiffThenInBefore!282 k0!1153 (select (arr!43640 _keys!1590) from!1980) lt!592415 lt!592411))))

(declare-fun lt!592414 () ListLongMap!21431)

(assert (=> b!1333595 (contains!8907 lt!592414 k0!1153)))

(declare-fun lt!592412 () Unit!43788)

(assert (=> b!1333595 (= lt!592412 (lemmaInListMapAfterAddingDiffThenInBefore!282 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592414))))

(assert (=> b!1333595 (= lt!592414 (+!4739 lt!592411 (tuple2!23767 (select (arr!43640 _keys!1590) from!1980) lt!592415)))))

(declare-fun get!22030 (ValueCell!17444 V!54017) V!54017)

(declare-fun dynLambda!3693 (Int (_ BitVec 64)) V!54017)

(assert (=> b!1333595 (= lt!592415 (get!22030 (select (arr!43639 _values!1320) from!1980) (dynLambda!3693 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6383 (array!90357 array!90355 (_ BitVec 32) (_ BitVec 32) V!54017 V!54017 (_ BitVec 32) Int) ListLongMap!21431)

(assert (=> b!1333595 (= lt!592411 (getCurrentListMapNoExtraKeys!6383 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun mapIsEmpty!56701 () Bool)

(assert (=> mapIsEmpty!56701 mapRes!56701))

(declare-fun b!1333596 () Bool)

(assert (=> b!1333596 (= e!759857 tp_is_empty!36685)))

(declare-fun b!1333597 () Bool)

(declare-fun res!884644 () Bool)

(assert (=> b!1333597 (=> (not res!884644) (not e!759855))))

(assert (=> b!1333597 (= res!884644 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44191 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112604 res!884639) b!1333589))

(assert (= (and b!1333589 res!884637) b!1333590))

(assert (= (and b!1333590 res!884640) b!1333594))

(assert (= (and b!1333594 res!884641) b!1333597))

(assert (= (and b!1333597 res!884644) b!1333588))

(assert (= (and b!1333588 res!884642) b!1333591))

(assert (= (and b!1333591 res!884643) b!1333587))

(assert (= (and b!1333587 res!884645) b!1333592))

(assert (= (and b!1333592 res!884638) b!1333595))

(assert (= (and b!1333586 condMapEmpty!56701) mapIsEmpty!56701))

(assert (= (and b!1333586 (not condMapEmpty!56701)) mapNonEmpty!56701))

(get-info :version)

(assert (= (and mapNonEmpty!56701 ((_ is ValueCellFull!17444) mapValue!56701)) b!1333593))

(assert (= (and b!1333586 ((_ is ValueCellFull!17444) mapDefault!56701)) b!1333596))

(assert (= start!112604 b!1333586))

(declare-fun b_lambda!24029 () Bool)

(assert (=> (not b_lambda!24029) (not b!1333595)))

(declare-fun t!45104 () Bool)

(declare-fun tb!11983 () Bool)

(assert (=> (and start!112604 (= defaultEntry!1323 defaultEntry!1323) t!45104) tb!11983))

(declare-fun result!25045 () Bool)

(assert (=> tb!11983 (= result!25045 tp_is_empty!36685)))

(assert (=> b!1333595 t!45104))

(declare-fun b_and!49609 () Bool)

(assert (= b_and!49607 (and (=> t!45104 result!25045) b_and!49609)))

(declare-fun m!1222673 () Bool)

(assert (=> b!1333587 m!1222673))

(assert (=> b!1333587 m!1222673))

(declare-fun m!1222675 () Bool)

(assert (=> b!1333587 m!1222675))

(declare-fun m!1222677 () Bool)

(assert (=> b!1333590 m!1222677))

(declare-fun m!1222679 () Bool)

(assert (=> b!1333595 m!1222679))

(declare-fun m!1222681 () Bool)

(assert (=> b!1333595 m!1222681))

(declare-fun m!1222683 () Bool)

(assert (=> b!1333595 m!1222683))

(declare-fun m!1222685 () Bool)

(assert (=> b!1333595 m!1222685))

(declare-fun m!1222687 () Bool)

(assert (=> b!1333595 m!1222687))

(declare-fun m!1222689 () Bool)

(assert (=> b!1333595 m!1222689))

(declare-fun m!1222691 () Bool)

(assert (=> b!1333595 m!1222691))

(assert (=> b!1333595 m!1222673))

(declare-fun m!1222693 () Bool)

(assert (=> b!1333595 m!1222693))

(assert (=> b!1333595 m!1222673))

(declare-fun m!1222695 () Bool)

(assert (=> b!1333595 m!1222695))

(assert (=> b!1333595 m!1222681))

(declare-fun m!1222697 () Bool)

(assert (=> b!1333595 m!1222697))

(assert (=> b!1333595 m!1222689))

(declare-fun m!1222699 () Bool)

(assert (=> b!1333595 m!1222699))

(assert (=> b!1333595 m!1222695))

(declare-fun m!1222701 () Bool)

(assert (=> b!1333595 m!1222701))

(declare-fun m!1222703 () Bool)

(assert (=> mapNonEmpty!56701 m!1222703))

(declare-fun m!1222705 () Bool)

(assert (=> b!1333588 m!1222705))

(assert (=> b!1333588 m!1222705))

(declare-fun m!1222707 () Bool)

(assert (=> b!1333588 m!1222707))

(assert (=> b!1333591 m!1222673))

(declare-fun m!1222709 () Bool)

(assert (=> start!112604 m!1222709))

(declare-fun m!1222711 () Bool)

(assert (=> start!112604 m!1222711))

(declare-fun m!1222713 () Bool)

(assert (=> start!112604 m!1222713))

(declare-fun m!1222715 () Bool)

(assert (=> b!1333594 m!1222715))

(check-sat (not b_next!30775) (not b!1333590) b_and!49609 (not b!1333587) (not b!1333588) (not b!1333595) (not start!112604) (not b_lambda!24029) tp_is_empty!36685 (not b!1333594) (not mapNonEmpty!56701))
(check-sat b_and!49609 (not b_next!30775))
