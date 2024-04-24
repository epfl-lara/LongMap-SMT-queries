; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113356 () Bool)

(assert start!113356)

(declare-fun b_free!31183 () Bool)

(declare-fun b_next!31183 () Bool)

(assert (=> start!113356 (= b_free!31183 (not b_next!31183))))

(declare-fun tp!109353 () Bool)

(declare-fun b_and!50275 () Bool)

(assert (=> start!113356 (= tp!109353 b_and!50275)))

(declare-fun res!890392 () Bool)

(declare-fun e!764695 () Bool)

(assert (=> start!113356 (=> (not res!890392) (not e!764695))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113356 (= res!890392 (validMask!0 mask!1977))))

(assert (=> start!113356 e!764695))

(declare-fun tp_is_empty!37183 () Bool)

(assert (=> start!113356 tp_is_empty!37183))

(assert (=> start!113356 true))

(declare-datatypes ((array!91337 0))(
  ( (array!91338 (arr!44120 (Array (_ BitVec 32) (_ BitVec 64))) (size!44671 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91337)

(declare-fun array_inv!33529 (array!91337) Bool)

(assert (=> start!113356 (array_inv!33529 _keys!1571)))

(declare-datatypes ((V!54681 0))(
  ( (V!54682 (val!18666 Int)) )
))
(declare-datatypes ((ValueCell!17693 0))(
  ( (ValueCellFull!17693 (v!21309 V!54681)) (EmptyCell!17693) )
))
(declare-datatypes ((array!91339 0))(
  ( (array!91340 (arr!44121 (Array (_ BitVec 32) ValueCell!17693)) (size!44672 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91339)

(declare-fun e!764693 () Bool)

(declare-fun array_inv!33530 (array!91339) Bool)

(assert (=> start!113356 (and (array_inv!33530 _values!1303) e!764693)))

(assert (=> start!113356 tp!109353))

(declare-fun mapIsEmpty!57481 () Bool)

(declare-fun mapRes!57481 () Bool)

(assert (=> mapIsEmpty!57481 mapRes!57481))

(declare-fun b!1342670 () Bool)

(declare-fun res!890387 () Bool)

(assert (=> b!1342670 (=> (not res!890387) (not e!764695))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342670 (= res!890387 (not (= (select (arr!44120 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1342671 () Bool)

(declare-fun res!890389 () Bool)

(assert (=> b!1342671 (=> (not res!890389) (not e!764695))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342671 (= res!890389 (validKeyInArray!0 (select (arr!44120 _keys!1571) from!1960)))))

(declare-fun b!1342672 () Bool)

(assert (=> b!1342672 (= e!764695 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!24088 0))(
  ( (tuple2!24089 (_1!12055 (_ BitVec 64)) (_2!12055 V!54681)) )
))
(declare-datatypes ((List!31243 0))(
  ( (Nil!31240) (Cons!31239 (h!32457 tuple2!24088) (t!45629 List!31243)) )
))
(declare-datatypes ((ListLongMap!21753 0))(
  ( (ListLongMap!21754 (toList!10892 List!31243)) )
))
(declare-fun lt!594610 () ListLongMap!21753)

(declare-fun contains!9080 (ListLongMap!21753 (_ BitVec 64)) Bool)

(assert (=> b!1342672 (contains!9080 lt!594610 k0!1142)))

(declare-datatypes ((Unit!43960 0))(
  ( (Unit!43961) )
))
(declare-fun lt!594611 () Unit!43960)

(declare-fun zeroValue!1245 () V!54681)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!336 ((_ BitVec 64) (_ BitVec 64) V!54681 ListLongMap!21753) Unit!43960)

(assert (=> b!1342672 (= lt!594611 (lemmaInListMapAfterAddingDiffThenInBefore!336 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594610))))

(declare-fun minValue!1245 () V!54681)

(declare-fun defaultEntry!1306 () Int)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun +!4810 (ListLongMap!21753 tuple2!24088) ListLongMap!21753)

(declare-fun getCurrentListMapNoExtraKeys!6459 (array!91337 array!91339 (_ BitVec 32) (_ BitVec 32) V!54681 V!54681 (_ BitVec 32) Int) ListLongMap!21753)

(declare-fun get!22280 (ValueCell!17693 V!54681) V!54681)

(declare-fun dynLambda!3764 (Int (_ BitVec 64)) V!54681)

(assert (=> b!1342672 (= lt!594610 (+!4810 (getCurrentListMapNoExtraKeys!6459 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24089 (select (arr!44120 _keys!1571) from!1960) (get!22280 (select (arr!44121 _values!1303) from!1960) (dynLambda!3764 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1342673 () Bool)

(declare-fun res!890388 () Bool)

(assert (=> b!1342673 (=> (not res!890388) (not e!764695))))

(declare-fun getCurrentListMap!5842 (array!91337 array!91339 (_ BitVec 32) (_ BitVec 32) V!54681 V!54681 (_ BitVec 32) Int) ListLongMap!21753)

(assert (=> b!1342673 (= res!890388 (contains!9080 (getCurrentListMap!5842 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57481 () Bool)

(declare-fun tp!109354 () Bool)

(declare-fun e!764692 () Bool)

(assert (=> mapNonEmpty!57481 (= mapRes!57481 (and tp!109354 e!764692))))

(declare-fun mapValue!57481 () ValueCell!17693)

(declare-fun mapRest!57481 () (Array (_ BitVec 32) ValueCell!17693))

(declare-fun mapKey!57481 () (_ BitVec 32))

(assert (=> mapNonEmpty!57481 (= (arr!44121 _values!1303) (store mapRest!57481 mapKey!57481 mapValue!57481))))

(declare-fun b!1342674 () Bool)

(assert (=> b!1342674 (= e!764692 tp_is_empty!37183)))

(declare-fun b!1342675 () Bool)

(declare-fun res!890391 () Bool)

(assert (=> b!1342675 (=> (not res!890391) (not e!764695))))

(assert (=> b!1342675 (= res!890391 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342676 () Bool)

(declare-fun e!764694 () Bool)

(assert (=> b!1342676 (= e!764693 (and e!764694 mapRes!57481))))

(declare-fun condMapEmpty!57481 () Bool)

(declare-fun mapDefault!57481 () ValueCell!17693)

(assert (=> b!1342676 (= condMapEmpty!57481 (= (arr!44121 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17693)) mapDefault!57481)))))

(declare-fun b!1342677 () Bool)

(declare-fun res!890385 () Bool)

(assert (=> b!1342677 (=> (not res!890385) (not e!764695))))

(declare-datatypes ((List!31244 0))(
  ( (Nil!31241) (Cons!31240 (h!32458 (_ BitVec 64)) (t!45630 List!31244)) )
))
(declare-fun arrayNoDuplicates!0 (array!91337 (_ BitVec 32) List!31244) Bool)

(assert (=> b!1342677 (= res!890385 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31241))))

(declare-fun b!1342678 () Bool)

(declare-fun res!890390 () Bool)

(assert (=> b!1342678 (=> (not res!890390) (not e!764695))))

(assert (=> b!1342678 (= res!890390 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44671 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342679 () Bool)

(declare-fun res!890386 () Bool)

(assert (=> b!1342679 (=> (not res!890386) (not e!764695))))

(assert (=> b!1342679 (= res!890386 (and (= (size!44672 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44671 _keys!1571) (size!44672 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1342680 () Bool)

(assert (=> b!1342680 (= e!764694 tp_is_empty!37183)))

(declare-fun b!1342681 () Bool)

(declare-fun res!890393 () Bool)

(assert (=> b!1342681 (=> (not res!890393) (not e!764695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91337 (_ BitVec 32)) Bool)

(assert (=> b!1342681 (= res!890393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113356 res!890392) b!1342679))

(assert (= (and b!1342679 res!890386) b!1342681))

(assert (= (and b!1342681 res!890393) b!1342677))

(assert (= (and b!1342677 res!890385) b!1342678))

(assert (= (and b!1342678 res!890390) b!1342673))

(assert (= (and b!1342673 res!890388) b!1342670))

(assert (= (and b!1342670 res!890387) b!1342671))

(assert (= (and b!1342671 res!890389) b!1342675))

(assert (= (and b!1342675 res!890391) b!1342672))

(assert (= (and b!1342676 condMapEmpty!57481) mapIsEmpty!57481))

(assert (= (and b!1342676 (not condMapEmpty!57481)) mapNonEmpty!57481))

(get-info :version)

(assert (= (and mapNonEmpty!57481 ((_ is ValueCellFull!17693) mapValue!57481)) b!1342674))

(assert (= (and b!1342676 ((_ is ValueCellFull!17693) mapDefault!57481)) b!1342680))

(assert (= start!113356 b!1342676))

(declare-fun b_lambda!24353 () Bool)

(assert (=> (not b_lambda!24353) (not b!1342672)))

(declare-fun t!45628 () Bool)

(declare-fun tb!12189 () Bool)

(assert (=> (and start!113356 (= defaultEntry!1306 defaultEntry!1306) t!45628) tb!12189))

(declare-fun result!25477 () Bool)

(assert (=> tb!12189 (= result!25477 tp_is_empty!37183)))

(assert (=> b!1342672 t!45628))

(declare-fun b_and!50277 () Bool)

(assert (= b_and!50275 (and (=> t!45628 result!25477) b_and!50277)))

(declare-fun m!1230627 () Bool)

(assert (=> b!1342672 m!1230627))

(declare-fun m!1230629 () Bool)

(assert (=> b!1342672 m!1230629))

(declare-fun m!1230631 () Bool)

(assert (=> b!1342672 m!1230631))

(declare-fun m!1230633 () Bool)

(assert (=> b!1342672 m!1230633))

(declare-fun m!1230635 () Bool)

(assert (=> b!1342672 m!1230635))

(assert (=> b!1342672 m!1230627))

(declare-fun m!1230637 () Bool)

(assert (=> b!1342672 m!1230637))

(assert (=> b!1342672 m!1230629))

(declare-fun m!1230639 () Bool)

(assert (=> b!1342672 m!1230639))

(assert (=> b!1342672 m!1230633))

(declare-fun m!1230641 () Bool)

(assert (=> b!1342672 m!1230641))

(declare-fun m!1230643 () Bool)

(assert (=> mapNonEmpty!57481 m!1230643))

(declare-fun m!1230645 () Bool)

(assert (=> start!113356 m!1230645))

(declare-fun m!1230647 () Bool)

(assert (=> start!113356 m!1230647))

(declare-fun m!1230649 () Bool)

(assert (=> start!113356 m!1230649))

(declare-fun m!1230651 () Bool)

(assert (=> b!1342681 m!1230651))

(assert (=> b!1342671 m!1230639))

(assert (=> b!1342671 m!1230639))

(declare-fun m!1230653 () Bool)

(assert (=> b!1342671 m!1230653))

(declare-fun m!1230655 () Bool)

(assert (=> b!1342673 m!1230655))

(assert (=> b!1342673 m!1230655))

(declare-fun m!1230657 () Bool)

(assert (=> b!1342673 m!1230657))

(declare-fun m!1230659 () Bool)

(assert (=> b!1342677 m!1230659))

(assert (=> b!1342670 m!1230639))

(check-sat (not b_next!31183) (not b!1342673) (not mapNonEmpty!57481) tp_is_empty!37183 (not start!113356) (not b!1342677) (not b!1342672) (not b!1342671) b_and!50277 (not b!1342681) (not b_lambda!24353))
(check-sat b_and!50277 (not b_next!31183))
