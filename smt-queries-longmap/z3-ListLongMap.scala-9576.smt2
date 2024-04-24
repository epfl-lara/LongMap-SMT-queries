; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113542 () Bool)

(assert start!113542)

(declare-fun b_free!31369 () Bool)

(declare-fun b_next!31369 () Bool)

(assert (=> start!113542 (= b_free!31369 (not b_next!31369))))

(declare-fun tp!109911 () Bool)

(declare-fun b_and!50593 () Bool)

(assert (=> start!113542 (= tp!109911 b_and!50593)))

(declare-fun b!1345853 () Bool)

(declare-fun res!892599 () Bool)

(declare-fun e!766091 () Bool)

(assert (=> b!1345853 (=> (not res!892599) (not e!766091))))

(declare-datatypes ((array!91685 0))(
  ( (array!91686 (arr!44294 (Array (_ BitVec 32) (_ BitVec 64))) (size!44845 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91685)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345853 (= res!892599 (validKeyInArray!0 (select (arr!44294 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57760 () Bool)

(declare-fun mapRes!57760 () Bool)

(declare-fun tp!109912 () Bool)

(declare-fun e!766090 () Bool)

(assert (=> mapNonEmpty!57760 (= mapRes!57760 (and tp!109912 e!766090))))

(declare-datatypes ((V!54929 0))(
  ( (V!54930 (val!18759 Int)) )
))
(declare-datatypes ((ValueCell!17786 0))(
  ( (ValueCellFull!17786 (v!21402 V!54929)) (EmptyCell!17786) )
))
(declare-fun mapValue!57760 () ValueCell!17786)

(declare-fun mapRest!57760 () (Array (_ BitVec 32) ValueCell!17786))

(declare-datatypes ((array!91687 0))(
  ( (array!91688 (arr!44295 (Array (_ BitVec 32) ValueCell!17786)) (size!44846 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91687)

(declare-fun mapKey!57760 () (_ BitVec 32))

(assert (=> mapNonEmpty!57760 (= (arr!44295 _values!1303) (store mapRest!57760 mapKey!57760 mapValue!57760))))

(declare-fun b!1345854 () Bool)

(declare-fun res!892603 () Bool)

(assert (=> b!1345854 (=> (not res!892603) (not e!766091))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91685 (_ BitVec 32)) Bool)

(assert (=> b!1345854 (= res!892603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345855 () Bool)

(declare-fun res!892604 () Bool)

(assert (=> b!1345855 (=> (not res!892604) (not e!766091))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345855 (= res!892604 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44845 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345856 () Bool)

(declare-fun tp_is_empty!37369 () Bool)

(assert (=> b!1345856 (= e!766090 tp_is_empty!37369)))

(declare-fun b!1345857 () Bool)

(assert (=> b!1345857 (= e!766091 false)))

(declare-fun minValue!1245 () V!54929)

(declare-fun lt!595670 () Bool)

(declare-fun zeroValue!1245 () V!54929)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24216 0))(
  ( (tuple2!24217 (_1!12119 (_ BitVec 64)) (_2!12119 V!54929)) )
))
(declare-datatypes ((List!31360 0))(
  ( (Nil!31357) (Cons!31356 (h!32574 tuple2!24216) (t!45878 List!31360)) )
))
(declare-datatypes ((ListLongMap!21881 0))(
  ( (ListLongMap!21882 (toList!10956 List!31360)) )
))
(declare-fun contains!9144 (ListLongMap!21881 (_ BitVec 64)) Bool)

(declare-fun +!4851 (ListLongMap!21881 tuple2!24216) ListLongMap!21881)

(declare-fun getCurrentListMapNoExtraKeys!6500 (array!91685 array!91687 (_ BitVec 32) (_ BitVec 32) V!54929 V!54929 (_ BitVec 32) Int) ListLongMap!21881)

(declare-fun get!22383 (ValueCell!17786 V!54929) V!54929)

(declare-fun dynLambda!3805 (Int (_ BitVec 64)) V!54929)

(assert (=> b!1345857 (= lt!595670 (contains!9144 (+!4851 (getCurrentListMapNoExtraKeys!6500 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24217 (select (arr!44294 _keys!1571) from!1960) (get!22383 (select (arr!44295 _values!1303) from!1960) (dynLambda!3805 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1345858 () Bool)

(declare-fun res!892602 () Bool)

(assert (=> b!1345858 (=> (not res!892602) (not e!766091))))

(assert (=> b!1345858 (= res!892602 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1345859 () Bool)

(declare-fun res!892601 () Bool)

(assert (=> b!1345859 (=> (not res!892601) (not e!766091))))

(assert (=> b!1345859 (= res!892601 (and (= (size!44846 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44845 _keys!1571) (size!44846 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!892600 () Bool)

(assert (=> start!113542 (=> (not res!892600) (not e!766091))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113542 (= res!892600 (validMask!0 mask!1977))))

(assert (=> start!113542 e!766091))

(assert (=> start!113542 tp_is_empty!37369))

(assert (=> start!113542 true))

(declare-fun array_inv!33649 (array!91685) Bool)

(assert (=> start!113542 (array_inv!33649 _keys!1571)))

(declare-fun e!766089 () Bool)

(declare-fun array_inv!33650 (array!91687) Bool)

(assert (=> start!113542 (and (array_inv!33650 _values!1303) e!766089)))

(assert (=> start!113542 tp!109911))

(declare-fun b!1345860 () Bool)

(declare-fun res!892606 () Bool)

(assert (=> b!1345860 (=> (not res!892606) (not e!766091))))

(declare-datatypes ((List!31361 0))(
  ( (Nil!31358) (Cons!31357 (h!32575 (_ BitVec 64)) (t!45879 List!31361)) )
))
(declare-fun arrayNoDuplicates!0 (array!91685 (_ BitVec 32) List!31361) Bool)

(assert (=> b!1345860 (= res!892606 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31358))))

(declare-fun b!1345861 () Bool)

(declare-fun e!766088 () Bool)

(assert (=> b!1345861 (= e!766088 tp_is_empty!37369)))

(declare-fun b!1345862 () Bool)

(declare-fun res!892607 () Bool)

(assert (=> b!1345862 (=> (not res!892607) (not e!766091))))

(assert (=> b!1345862 (= res!892607 (not (= (select (arr!44294 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345863 () Bool)

(assert (=> b!1345863 (= e!766089 (and e!766088 mapRes!57760))))

(declare-fun condMapEmpty!57760 () Bool)

(declare-fun mapDefault!57760 () ValueCell!17786)

(assert (=> b!1345863 (= condMapEmpty!57760 (= (arr!44295 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17786)) mapDefault!57760)))))

(declare-fun b!1345864 () Bool)

(declare-fun res!892605 () Bool)

(assert (=> b!1345864 (=> (not res!892605) (not e!766091))))

(declare-fun getCurrentListMap!5900 (array!91685 array!91687 (_ BitVec 32) (_ BitVec 32) V!54929 V!54929 (_ BitVec 32) Int) ListLongMap!21881)

(assert (=> b!1345864 (= res!892605 (contains!9144 (getCurrentListMap!5900 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57760 () Bool)

(assert (=> mapIsEmpty!57760 mapRes!57760))

(assert (= (and start!113542 res!892600) b!1345859))

(assert (= (and b!1345859 res!892601) b!1345854))

(assert (= (and b!1345854 res!892603) b!1345860))

(assert (= (and b!1345860 res!892606) b!1345855))

(assert (= (and b!1345855 res!892604) b!1345864))

(assert (= (and b!1345864 res!892605) b!1345862))

(assert (= (and b!1345862 res!892607) b!1345853))

(assert (= (and b!1345853 res!892599) b!1345858))

(assert (= (and b!1345858 res!892602) b!1345857))

(assert (= (and b!1345863 condMapEmpty!57760) mapIsEmpty!57760))

(assert (= (and b!1345863 (not condMapEmpty!57760)) mapNonEmpty!57760))

(get-info :version)

(assert (= (and mapNonEmpty!57760 ((_ is ValueCellFull!17786) mapValue!57760)) b!1345856))

(assert (= (and b!1345863 ((_ is ValueCellFull!17786) mapDefault!57760)) b!1345861))

(assert (= start!113542 b!1345863))

(declare-fun b_lambda!24485 () Bool)

(assert (=> (not b_lambda!24485) (not b!1345857)))

(declare-fun t!45877 () Bool)

(declare-fun tb!12321 () Bool)

(assert (=> (and start!113542 (= defaultEntry!1306 defaultEntry!1306) t!45877) tb!12321))

(declare-fun result!25741 () Bool)

(assert (=> tb!12321 (= result!25741 tp_is_empty!37369)))

(assert (=> b!1345857 t!45877))

(declare-fun b_and!50595 () Bool)

(assert (= b_and!50593 (and (=> t!45877 result!25741) b_and!50595)))

(declare-fun m!1233705 () Bool)

(assert (=> b!1345854 m!1233705))

(declare-fun m!1233707 () Bool)

(assert (=> b!1345860 m!1233707))

(declare-fun m!1233709 () Bool)

(assert (=> b!1345853 m!1233709))

(assert (=> b!1345853 m!1233709))

(declare-fun m!1233711 () Bool)

(assert (=> b!1345853 m!1233711))

(declare-fun m!1233713 () Bool)

(assert (=> mapNonEmpty!57760 m!1233713))

(assert (=> b!1345862 m!1233709))

(declare-fun m!1233715 () Bool)

(assert (=> b!1345864 m!1233715))

(assert (=> b!1345864 m!1233715))

(declare-fun m!1233717 () Bool)

(assert (=> b!1345864 m!1233717))

(declare-fun m!1233719 () Bool)

(assert (=> b!1345857 m!1233719))

(declare-fun m!1233721 () Bool)

(assert (=> b!1345857 m!1233721))

(declare-fun m!1233723 () Bool)

(assert (=> b!1345857 m!1233723))

(declare-fun m!1233725 () Bool)

(assert (=> b!1345857 m!1233725))

(assert (=> b!1345857 m!1233719))

(declare-fun m!1233727 () Bool)

(assert (=> b!1345857 m!1233727))

(assert (=> b!1345857 m!1233721))

(assert (=> b!1345857 m!1233723))

(assert (=> b!1345857 m!1233727))

(declare-fun m!1233729 () Bool)

(assert (=> b!1345857 m!1233729))

(assert (=> b!1345857 m!1233709))

(declare-fun m!1233731 () Bool)

(assert (=> start!113542 m!1233731))

(declare-fun m!1233733 () Bool)

(assert (=> start!113542 m!1233733))

(declare-fun m!1233735 () Bool)

(assert (=> start!113542 m!1233735))

(check-sat b_and!50595 (not b_next!31369) (not b!1345860) (not b!1345854) (not start!113542) (not b!1345864) (not b_lambda!24485) tp_is_empty!37369 (not b!1345853) (not mapNonEmpty!57760) (not b!1345857))
(check-sat b_and!50595 (not b_next!31369))
