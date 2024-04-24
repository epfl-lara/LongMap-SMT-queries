; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113464 () Bool)

(assert start!113464)

(declare-fun b_free!31291 () Bool)

(declare-fun b_next!31291 () Bool)

(assert (=> start!113464 (= b_free!31291 (not b_next!31291))))

(declare-fun tp!109677 () Bool)

(declare-fun b_and!50491 () Bool)

(assert (=> start!113464 (= tp!109677 b_and!50491)))

(declare-fun b!1344722 () Bool)

(declare-fun res!891844 () Bool)

(declare-fun e!765502 () Bool)

(assert (=> b!1344722 (=> (not res!891844) (not e!765502))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91539 0))(
  ( (array!91540 (arr!44221 (Array (_ BitVec 32) (_ BitVec 64))) (size!44772 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91539)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344722 (= res!891844 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44772 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344723 () Bool)

(declare-fun e!765503 () Bool)

(declare-fun e!765506 () Bool)

(declare-fun mapRes!57643 () Bool)

(assert (=> b!1344723 (= e!765503 (and e!765506 mapRes!57643))))

(declare-fun condMapEmpty!57643 () Bool)

(declare-datatypes ((V!54825 0))(
  ( (V!54826 (val!18720 Int)) )
))
(declare-datatypes ((ValueCell!17747 0))(
  ( (ValueCellFull!17747 (v!21363 V!54825)) (EmptyCell!17747) )
))
(declare-datatypes ((array!91541 0))(
  ( (array!91542 (arr!44222 (Array (_ BitVec 32) ValueCell!17747)) (size!44773 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91541)

(declare-fun mapDefault!57643 () ValueCell!17747)

(assert (=> b!1344723 (= condMapEmpty!57643 (= (arr!44222 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17747)) mapDefault!57643)))))

(declare-fun b!1344725 () Bool)

(declare-fun res!891846 () Bool)

(assert (=> b!1344725 (=> (not res!891846) (not e!765502))))

(declare-fun mask!1977 () (_ BitVec 32))

(assert (=> b!1344725 (= res!891846 (and (= (size!44773 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44772 _keys!1571) (size!44773 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344726 () Bool)

(assert (=> b!1344726 (= e!765502 (not true))))

(declare-datatypes ((tuple2!24164 0))(
  ( (tuple2!24165 (_1!12093 (_ BitVec 64)) (_2!12093 V!54825)) )
))
(declare-datatypes ((List!31309 0))(
  ( (Nil!31306) (Cons!31305 (h!32523 tuple2!24164) (t!45803 List!31309)) )
))
(declare-datatypes ((ListLongMap!21829 0))(
  ( (ListLongMap!21830 (toList!10930 List!31309)) )
))
(declare-fun lt!595392 () ListLongMap!21829)

(declare-fun zeroValue!1245 () V!54825)

(declare-fun contains!9118 (ListLongMap!21829 (_ BitVec 64)) Bool)

(declare-fun +!4844 (ListLongMap!21829 tuple2!24164) ListLongMap!21829)

(assert (=> b!1344726 (contains!9118 (+!4844 lt!595392 (tuple2!24165 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44028 0))(
  ( (Unit!44029) )
))
(declare-fun lt!595396 () Unit!44028)

(declare-fun addStillContains!1206 (ListLongMap!21829 (_ BitVec 64) V!54825 (_ BitVec 64)) Unit!44028)

(assert (=> b!1344726 (= lt!595396 (addStillContains!1206 lt!595392 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344726 (contains!9118 lt!595392 k0!1142)))

(declare-fun lt!595394 () Unit!44028)

(declare-fun lt!595395 () V!54825)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!370 ((_ BitVec 64) (_ BitVec 64) V!54825 ListLongMap!21829) Unit!44028)

(assert (=> b!1344726 (= lt!595394 (lemmaInListMapAfterAddingDiffThenInBefore!370 k0!1142 (select (arr!44221 _keys!1571) from!1960) lt!595395 lt!595392))))

(declare-fun lt!595393 () ListLongMap!21829)

(assert (=> b!1344726 (contains!9118 lt!595393 k0!1142)))

(declare-fun lt!595397 () Unit!44028)

(assert (=> b!1344726 (= lt!595397 (lemmaInListMapAfterAddingDiffThenInBefore!370 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595393))))

(assert (=> b!1344726 (= lt!595393 (+!4844 lt!595392 (tuple2!24165 (select (arr!44221 _keys!1571) from!1960) lt!595395)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22350 (ValueCell!17747 V!54825) V!54825)

(declare-fun dynLambda!3798 (Int (_ BitVec 64)) V!54825)

(assert (=> b!1344726 (= lt!595395 (get!22350 (select (arr!44222 _values!1303) from!1960) (dynLambda!3798 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54825)

(declare-fun getCurrentListMapNoExtraKeys!6493 (array!91539 array!91541 (_ BitVec 32) (_ BitVec 32) V!54825 V!54825 (_ BitVec 32) Int) ListLongMap!21829)

(assert (=> b!1344726 (= lt!595392 (getCurrentListMapNoExtraKeys!6493 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapIsEmpty!57643 () Bool)

(assert (=> mapIsEmpty!57643 mapRes!57643))

(declare-fun b!1344727 () Bool)

(declare-fun res!891845 () Bool)

(assert (=> b!1344727 (=> (not res!891845) (not e!765502))))

(declare-datatypes ((List!31310 0))(
  ( (Nil!31307) (Cons!31306 (h!32524 (_ BitVec 64)) (t!45804 List!31310)) )
))
(declare-fun arrayNoDuplicates!0 (array!91539 (_ BitVec 32) List!31310) Bool)

(assert (=> b!1344727 (= res!891845 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31307))))

(declare-fun b!1344728 () Bool)

(declare-fun res!891843 () Bool)

(assert (=> b!1344728 (=> (not res!891843) (not e!765502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91539 (_ BitVec 32)) Bool)

(assert (=> b!1344728 (= res!891843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344729 () Bool)

(declare-fun e!765504 () Bool)

(declare-fun tp_is_empty!37291 () Bool)

(assert (=> b!1344729 (= e!765504 tp_is_empty!37291)))

(declare-fun b!1344730 () Bool)

(declare-fun res!891851 () Bool)

(assert (=> b!1344730 (=> (not res!891851) (not e!765502))))

(assert (=> b!1344730 (= res!891851 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344724 () Bool)

(declare-fun res!891847 () Bool)

(assert (=> b!1344724 (=> (not res!891847) (not e!765502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344724 (= res!891847 (validKeyInArray!0 (select (arr!44221 _keys!1571) from!1960)))))

(declare-fun res!891849 () Bool)

(assert (=> start!113464 (=> (not res!891849) (not e!765502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113464 (= res!891849 (validMask!0 mask!1977))))

(assert (=> start!113464 e!765502))

(assert (=> start!113464 tp_is_empty!37291))

(assert (=> start!113464 true))

(declare-fun array_inv!33601 (array!91539) Bool)

(assert (=> start!113464 (array_inv!33601 _keys!1571)))

(declare-fun array_inv!33602 (array!91541) Bool)

(assert (=> start!113464 (and (array_inv!33602 _values!1303) e!765503)))

(assert (=> start!113464 tp!109677))

(declare-fun b!1344731 () Bool)

(declare-fun res!891850 () Bool)

(assert (=> b!1344731 (=> (not res!891850) (not e!765502))))

(declare-fun getCurrentListMap!5874 (array!91539 array!91541 (_ BitVec 32) (_ BitVec 32) V!54825 V!54825 (_ BitVec 32) Int) ListLongMap!21829)

(assert (=> b!1344731 (= res!891850 (contains!9118 (getCurrentListMap!5874 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!57643 () Bool)

(declare-fun tp!109678 () Bool)

(assert (=> mapNonEmpty!57643 (= mapRes!57643 (and tp!109678 e!765504))))

(declare-fun mapKey!57643 () (_ BitVec 32))

(declare-fun mapValue!57643 () ValueCell!17747)

(declare-fun mapRest!57643 () (Array (_ BitVec 32) ValueCell!17747))

(assert (=> mapNonEmpty!57643 (= (arr!44222 _values!1303) (store mapRest!57643 mapKey!57643 mapValue!57643))))

(declare-fun b!1344732 () Bool)

(assert (=> b!1344732 (= e!765506 tp_is_empty!37291)))

(declare-fun b!1344733 () Bool)

(declare-fun res!891848 () Bool)

(assert (=> b!1344733 (=> (not res!891848) (not e!765502))))

(assert (=> b!1344733 (= res!891848 (not (= (select (arr!44221 _keys!1571) from!1960) k0!1142)))))

(assert (= (and start!113464 res!891849) b!1344725))

(assert (= (and b!1344725 res!891846) b!1344728))

(assert (= (and b!1344728 res!891843) b!1344727))

(assert (= (and b!1344727 res!891845) b!1344722))

(assert (= (and b!1344722 res!891844) b!1344731))

(assert (= (and b!1344731 res!891850) b!1344733))

(assert (= (and b!1344733 res!891848) b!1344724))

(assert (= (and b!1344724 res!891847) b!1344730))

(assert (= (and b!1344730 res!891851) b!1344726))

(assert (= (and b!1344723 condMapEmpty!57643) mapIsEmpty!57643))

(assert (= (and b!1344723 (not condMapEmpty!57643)) mapNonEmpty!57643))

(get-info :version)

(assert (= (and mapNonEmpty!57643 ((_ is ValueCellFull!17747) mapValue!57643)) b!1344729))

(assert (= (and b!1344723 ((_ is ValueCellFull!17747) mapDefault!57643)) b!1344732))

(assert (= start!113464 b!1344723))

(declare-fun b_lambda!24461 () Bool)

(assert (=> (not b_lambda!24461) (not b!1344726)))

(declare-fun t!45802 () Bool)

(declare-fun tb!12297 () Bool)

(assert (=> (and start!113464 (= defaultEntry!1306 defaultEntry!1306) t!45802) tb!12297))

(declare-fun result!25693 () Bool)

(assert (=> tb!12297 (= result!25693 tp_is_empty!37291)))

(assert (=> b!1344726 t!45802))

(declare-fun b_and!50493 () Bool)

(assert (= b_and!50491 (and (=> t!45802 result!25693) b_and!50493)))

(declare-fun m!1232733 () Bool)

(assert (=> b!1344724 m!1232733))

(assert (=> b!1344724 m!1232733))

(declare-fun m!1232735 () Bool)

(assert (=> b!1344724 m!1232735))

(declare-fun m!1232737 () Bool)

(assert (=> mapNonEmpty!57643 m!1232737))

(declare-fun m!1232739 () Bool)

(assert (=> b!1344727 m!1232739))

(assert (=> b!1344726 m!1232733))

(declare-fun m!1232741 () Bool)

(assert (=> b!1344726 m!1232741))

(declare-fun m!1232743 () Bool)

(assert (=> b!1344726 m!1232743))

(declare-fun m!1232745 () Bool)

(assert (=> b!1344726 m!1232745))

(declare-fun m!1232747 () Bool)

(assert (=> b!1344726 m!1232747))

(declare-fun m!1232749 () Bool)

(assert (=> b!1344726 m!1232749))

(assert (=> b!1344726 m!1232733))

(declare-fun m!1232751 () Bool)

(assert (=> b!1344726 m!1232751))

(declare-fun m!1232753 () Bool)

(assert (=> b!1344726 m!1232753))

(assert (=> b!1344726 m!1232749))

(declare-fun m!1232755 () Bool)

(assert (=> b!1344726 m!1232755))

(declare-fun m!1232757 () Bool)

(assert (=> b!1344726 m!1232757))

(declare-fun m!1232759 () Bool)

(assert (=> b!1344726 m!1232759))

(declare-fun m!1232761 () Bool)

(assert (=> b!1344726 m!1232761))

(assert (=> b!1344726 m!1232745))

(assert (=> b!1344726 m!1232747))

(declare-fun m!1232763 () Bool)

(assert (=> b!1344726 m!1232763))

(declare-fun m!1232765 () Bool)

(assert (=> b!1344728 m!1232765))

(assert (=> b!1344733 m!1232733))

(declare-fun m!1232767 () Bool)

(assert (=> b!1344731 m!1232767))

(assert (=> b!1344731 m!1232767))

(declare-fun m!1232769 () Bool)

(assert (=> b!1344731 m!1232769))

(declare-fun m!1232771 () Bool)

(assert (=> start!113464 m!1232771))

(declare-fun m!1232773 () Bool)

(assert (=> start!113464 m!1232773))

(declare-fun m!1232775 () Bool)

(assert (=> start!113464 m!1232775))

(check-sat b_and!50493 (not b!1344724) (not b!1344727) (not b_lambda!24461) (not b!1344731) (not b_next!31291) tp_is_empty!37291 (not mapNonEmpty!57643) (not b!1344728) (not start!113464) (not b!1344726))
(check-sat b_and!50493 (not b_next!31291))
