; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113390 () Bool)

(assert start!113390)

(declare-fun b_free!31441 () Bool)

(declare-fun b_next!31441 () Bool)

(assert (=> start!113390 (= b_free!31441 (not b_next!31441))))

(declare-fun tp!110128 () Bool)

(declare-fun b_and!50711 () Bool)

(assert (=> start!113390 (= tp!110128 b_and!50711)))

(declare-fun b!1345964 () Bool)

(declare-fun res!893142 () Bool)

(declare-fun e!765833 () Bool)

(assert (=> b!1345964 (=> (not res!893142) (not e!765833))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91663 0))(
  ( (array!91664 (arr!44288 (Array (_ BitVec 32) (_ BitVec 64))) (size!44840 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91663)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345964 (= res!893142 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44840 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345965 () Bool)

(declare-fun res!893145 () Bool)

(assert (=> b!1345965 (=> (not res!893145) (not e!765833))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91663 (_ BitVec 32)) Bool)

(assert (=> b!1345965 (= res!893145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57868 () Bool)

(declare-fun mapRes!57868 () Bool)

(assert (=> mapIsEmpty!57868 mapRes!57868))

(declare-fun res!893143 () Bool)

(assert (=> start!113390 (=> (not res!893143) (not e!765833))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113390 (= res!893143 (validMask!0 mask!1977))))

(assert (=> start!113390 e!765833))

(declare-fun tp_is_empty!37441 () Bool)

(assert (=> start!113390 tp_is_empty!37441))

(assert (=> start!113390 true))

(declare-fun array_inv!33567 (array!91663) Bool)

(assert (=> start!113390 (array_inv!33567 _keys!1571)))

(declare-datatypes ((V!55025 0))(
  ( (V!55026 (val!18795 Int)) )
))
(declare-datatypes ((ValueCell!17822 0))(
  ( (ValueCellFull!17822 (v!21442 V!55025)) (EmptyCell!17822) )
))
(declare-datatypes ((array!91665 0))(
  ( (array!91666 (arr!44289 (Array (_ BitVec 32) ValueCell!17822)) (size!44841 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91665)

(declare-fun e!765836 () Bool)

(declare-fun array_inv!33568 (array!91665) Bool)

(assert (=> start!113390 (and (array_inv!33568 _values!1303) e!765836)))

(assert (=> start!113390 tp!110128))

(declare-fun mapNonEmpty!57868 () Bool)

(declare-fun tp!110129 () Bool)

(declare-fun e!765835 () Bool)

(assert (=> mapNonEmpty!57868 (= mapRes!57868 (and tp!110129 e!765835))))

(declare-fun mapKey!57868 () (_ BitVec 32))

(declare-fun mapValue!57868 () ValueCell!17822)

(declare-fun mapRest!57868 () (Array (_ BitVec 32) ValueCell!17822))

(assert (=> mapNonEmpty!57868 (= (arr!44289 _values!1303) (store mapRest!57868 mapKey!57868 mapValue!57868))))

(declare-fun b!1345966 () Bool)

(declare-fun e!765834 () Bool)

(assert (=> b!1345966 (= e!765834 tp_is_empty!37441)))

(declare-fun b!1345967 () Bool)

(assert (=> b!1345967 (= e!765833 false)))

(declare-fun minValue!1245 () V!55025)

(declare-fun zeroValue!1245 () V!55025)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!595278 () Bool)

(declare-datatypes ((tuple2!24298 0))(
  ( (tuple2!24299 (_1!12160 (_ BitVec 64)) (_2!12160 V!55025)) )
))
(declare-datatypes ((List!31433 0))(
  ( (Nil!31430) (Cons!31429 (h!32638 tuple2!24298) (t!46015 List!31433)) )
))
(declare-datatypes ((ListLongMap!21955 0))(
  ( (ListLongMap!21956 (toList!10993 List!31433)) )
))
(declare-fun contains!9098 (ListLongMap!21955 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5832 (array!91663 array!91665 (_ BitVec 32) (_ BitVec 32) V!55025 V!55025 (_ BitVec 32) Int) ListLongMap!21955)

(assert (=> b!1345967 (= lt!595278 (contains!9098 (getCurrentListMap!5832 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345968 () Bool)

(declare-fun res!893144 () Bool)

(assert (=> b!1345968 (=> (not res!893144) (not e!765833))))

(assert (=> b!1345968 (= res!893144 (and (= (size!44841 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44840 _keys!1571) (size!44841 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345969 () Bool)

(assert (=> b!1345969 (= e!765835 tp_is_empty!37441)))

(declare-fun b!1345970 () Bool)

(assert (=> b!1345970 (= e!765836 (and e!765834 mapRes!57868))))

(declare-fun condMapEmpty!57868 () Bool)

(declare-fun mapDefault!57868 () ValueCell!17822)

(assert (=> b!1345970 (= condMapEmpty!57868 (= (arr!44289 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17822)) mapDefault!57868)))))

(declare-fun b!1345971 () Bool)

(declare-fun res!893146 () Bool)

(assert (=> b!1345971 (=> (not res!893146) (not e!765833))))

(declare-datatypes ((List!31434 0))(
  ( (Nil!31431) (Cons!31430 (h!32639 (_ BitVec 64)) (t!46016 List!31434)) )
))
(declare-fun arrayNoDuplicates!0 (array!91663 (_ BitVec 32) List!31434) Bool)

(assert (=> b!1345971 (= res!893146 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31431))))

(assert (= (and start!113390 res!893143) b!1345968))

(assert (= (and b!1345968 res!893144) b!1345965))

(assert (= (and b!1345965 res!893145) b!1345971))

(assert (= (and b!1345971 res!893146) b!1345964))

(assert (= (and b!1345964 res!893142) b!1345967))

(assert (= (and b!1345970 condMapEmpty!57868) mapIsEmpty!57868))

(assert (= (and b!1345970 (not condMapEmpty!57868)) mapNonEmpty!57868))

(get-info :version)

(assert (= (and mapNonEmpty!57868 ((_ is ValueCellFull!17822) mapValue!57868)) b!1345969))

(assert (= (and b!1345970 ((_ is ValueCellFull!17822) mapDefault!57868)) b!1345966))

(assert (= start!113390 b!1345970))

(declare-fun m!1232803 () Bool)

(assert (=> b!1345967 m!1232803))

(assert (=> b!1345967 m!1232803))

(declare-fun m!1232805 () Bool)

(assert (=> b!1345967 m!1232805))

(declare-fun m!1232807 () Bool)

(assert (=> b!1345971 m!1232807))

(declare-fun m!1232809 () Bool)

(assert (=> start!113390 m!1232809))

(declare-fun m!1232811 () Bool)

(assert (=> start!113390 m!1232811))

(declare-fun m!1232813 () Bool)

(assert (=> start!113390 m!1232813))

(declare-fun m!1232815 () Bool)

(assert (=> b!1345965 m!1232815))

(declare-fun m!1232817 () Bool)

(assert (=> mapNonEmpty!57868 m!1232817))

(check-sat (not b!1345967) tp_is_empty!37441 (not b!1345971) (not b!1345965) (not b_next!31441) (not start!113390) (not mapNonEmpty!57868) b_and!50711)
(check-sat b_and!50711 (not b_next!31441))
