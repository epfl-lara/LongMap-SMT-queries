; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113614 () Bool)

(assert start!113614)

(declare-fun b_free!31441 () Bool)

(declare-fun b_next!31441 () Bool)

(assert (=> start!113614 (= b_free!31441 (not b_next!31441))))

(declare-fun tp!110128 () Bool)

(declare-fun b_and!50731 () Bool)

(assert (=> start!113614 (= tp!110128 b_and!50731)))

(declare-fun b!1347333 () Bool)

(declare-fun e!766709 () Bool)

(declare-fun e!766708 () Bool)

(declare-fun mapRes!57868 () Bool)

(assert (=> b!1347333 (= e!766709 (and e!766708 mapRes!57868))))

(declare-fun condMapEmpty!57868 () Bool)

(declare-datatypes ((V!55025 0))(
  ( (V!55026 (val!18795 Int)) )
))
(declare-datatypes ((ValueCell!17822 0))(
  ( (ValueCellFull!17822 (v!21438 V!55025)) (EmptyCell!17822) )
))
(declare-datatypes ((array!91827 0))(
  ( (array!91828 (arr!44365 (Array (_ BitVec 32) ValueCell!17822)) (size!44916 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91827)

(declare-fun mapDefault!57868 () ValueCell!17822)

(assert (=> b!1347333 (= condMapEmpty!57868 (= (arr!44365 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17822)) mapDefault!57868)))))

(declare-fun b!1347334 () Bool)

(declare-fun res!893689 () Bool)

(declare-fun e!766711 () Bool)

(assert (=> b!1347334 (=> (not res!893689) (not e!766711))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((array!91829 0))(
  ( (array!91830 (arr!44366 (Array (_ BitVec 32) (_ BitVec 64))) (size!44917 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91829)

(assert (=> b!1347334 (= res!893689 (and (= (size!44916 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44917 _keys!1571) (size!44916 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347335 () Bool)

(declare-fun res!893693 () Bool)

(assert (=> b!1347335 (=> (not res!893693) (not e!766711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91829 (_ BitVec 32)) Bool)

(assert (=> b!1347335 (= res!893693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57868 () Bool)

(declare-fun tp!110127 () Bool)

(declare-fun e!766710 () Bool)

(assert (=> mapNonEmpty!57868 (= mapRes!57868 (and tp!110127 e!766710))))

(declare-fun mapRest!57868 () (Array (_ BitVec 32) ValueCell!17822))

(declare-fun mapKey!57868 () (_ BitVec 32))

(declare-fun mapValue!57868 () ValueCell!17822)

(assert (=> mapNonEmpty!57868 (= (arr!44365 _values!1303) (store mapRest!57868 mapKey!57868 mapValue!57868))))

(declare-fun b!1347336 () Bool)

(assert (=> b!1347336 (= e!766711 false)))

(declare-fun minValue!1245 () V!55025)

(declare-fun zeroValue!1245 () V!55025)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lt!595940 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24268 0))(
  ( (tuple2!24269 (_1!12145 (_ BitVec 64)) (_2!12145 V!55025)) )
))
(declare-datatypes ((List!31412 0))(
  ( (Nil!31409) (Cons!31408 (h!32626 tuple2!24268) (t!45994 List!31412)) )
))
(declare-datatypes ((ListLongMap!21933 0))(
  ( (ListLongMap!21934 (toList!10982 List!31412)) )
))
(declare-fun contains!9170 (ListLongMap!21933 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5922 (array!91829 array!91827 (_ BitVec 32) (_ BitVec 32) V!55025 V!55025 (_ BitVec 32) Int) ListLongMap!21933)

(assert (=> b!1347336 (= lt!595940 (contains!9170 (getCurrentListMap!5922 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347337 () Bool)

(declare-fun res!893690 () Bool)

(assert (=> b!1347337 (=> (not res!893690) (not e!766711))))

(assert (=> b!1347337 (= res!893690 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44917 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1347338 () Bool)

(declare-fun res!893692 () Bool)

(assert (=> b!1347338 (=> (not res!893692) (not e!766711))))

(declare-datatypes ((List!31413 0))(
  ( (Nil!31410) (Cons!31409 (h!32627 (_ BitVec 64)) (t!45995 List!31413)) )
))
(declare-fun arrayNoDuplicates!0 (array!91829 (_ BitVec 32) List!31413) Bool)

(assert (=> b!1347338 (= res!893692 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31410))))

(declare-fun b!1347339 () Bool)

(declare-fun tp_is_empty!37441 () Bool)

(assert (=> b!1347339 (= e!766710 tp_is_empty!37441)))

(declare-fun mapIsEmpty!57868 () Bool)

(assert (=> mapIsEmpty!57868 mapRes!57868))

(declare-fun b!1347340 () Bool)

(assert (=> b!1347340 (= e!766708 tp_is_empty!37441)))

(declare-fun res!893691 () Bool)

(assert (=> start!113614 (=> (not res!893691) (not e!766711))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113614 (= res!893691 (validMask!0 mask!1977))))

(assert (=> start!113614 e!766711))

(assert (=> start!113614 tp_is_empty!37441))

(assert (=> start!113614 true))

(declare-fun array_inv!33695 (array!91829) Bool)

(assert (=> start!113614 (array_inv!33695 _keys!1571)))

(declare-fun array_inv!33696 (array!91827) Bool)

(assert (=> start!113614 (and (array_inv!33696 _values!1303) e!766709)))

(assert (=> start!113614 tp!110128))

(assert (= (and start!113614 res!893691) b!1347334))

(assert (= (and b!1347334 res!893689) b!1347335))

(assert (= (and b!1347335 res!893693) b!1347338))

(assert (= (and b!1347338 res!893692) b!1347337))

(assert (= (and b!1347337 res!893690) b!1347336))

(assert (= (and b!1347333 condMapEmpty!57868) mapIsEmpty!57868))

(assert (= (and b!1347333 (not condMapEmpty!57868)) mapNonEmpty!57868))

(get-info :version)

(assert (= (and mapNonEmpty!57868 ((_ is ValueCellFull!17822) mapValue!57868)) b!1347339))

(assert (= (and b!1347333 ((_ is ValueCellFull!17822) mapDefault!57868)) b!1347340))

(assert (= start!113614 b!1347333))

(declare-fun m!1234917 () Bool)

(assert (=> b!1347336 m!1234917))

(assert (=> b!1347336 m!1234917))

(declare-fun m!1234919 () Bool)

(assert (=> b!1347336 m!1234919))

(declare-fun m!1234921 () Bool)

(assert (=> start!113614 m!1234921))

(declare-fun m!1234923 () Bool)

(assert (=> start!113614 m!1234923))

(declare-fun m!1234925 () Bool)

(assert (=> start!113614 m!1234925))

(declare-fun m!1234927 () Bool)

(assert (=> b!1347335 m!1234927))

(declare-fun m!1234929 () Bool)

(assert (=> b!1347338 m!1234929))

(declare-fun m!1234931 () Bool)

(assert (=> mapNonEmpty!57868 m!1234931))

(check-sat (not mapNonEmpty!57868) (not b_next!31441) b_and!50731 (not b!1347338) tp_is_empty!37441 (not start!113614) (not b!1347336) (not b!1347335))
(check-sat b_and!50731 (not b_next!31441))
