; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113260 () Bool)

(assert start!113260)

(declare-fun b_free!31311 () Bool)

(declare-fun b_next!31311 () Bool)

(assert (=> start!113260 (= b_free!31311 (not b_next!31311))))

(declare-fun tp!109738 () Bool)

(declare-fun b_and!50529 () Bool)

(assert (=> start!113260 (= tp!109738 b_and!50529)))

(declare-fun b!1343803 () Bool)

(declare-fun res!891595 () Bool)

(declare-fun e!764811 () Bool)

(assert (=> b!1343803 (=> (not res!891595) (not e!764811))))

(declare-datatypes ((array!91466 0))(
  ( (array!91467 (arr!44189 (Array (_ BitVec 32) (_ BitVec 64))) (size!44739 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91466)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91466 (_ BitVec 32)) Bool)

(assert (=> b!1343803 (= res!891595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!891600 () Bool)

(assert (=> start!113260 (=> (not res!891600) (not e!764811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113260 (= res!891600 (validMask!0 mask!1977))))

(assert (=> start!113260 e!764811))

(declare-fun tp_is_empty!37311 () Bool)

(assert (=> start!113260 tp_is_empty!37311))

(assert (=> start!113260 true))

(declare-fun array_inv!33305 (array!91466) Bool)

(assert (=> start!113260 (array_inv!33305 _keys!1571)))

(declare-datatypes ((V!54851 0))(
  ( (V!54852 (val!18730 Int)) )
))
(declare-datatypes ((ValueCell!17757 0))(
  ( (ValueCellFull!17757 (v!21378 V!54851)) (EmptyCell!17757) )
))
(declare-datatypes ((array!91468 0))(
  ( (array!91469 (arr!44190 (Array (_ BitVec 32) ValueCell!17757)) (size!44740 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91468)

(declare-fun e!764812 () Bool)

(declare-fun array_inv!33306 (array!91468) Bool)

(assert (=> start!113260 (and (array_inv!33306 _values!1303) e!764812)))

(assert (=> start!113260 tp!109738))

(declare-fun mapNonEmpty!57673 () Bool)

(declare-fun mapRes!57673 () Bool)

(declare-fun tp!109737 () Bool)

(declare-fun e!764809 () Bool)

(assert (=> mapNonEmpty!57673 (= mapRes!57673 (and tp!109737 e!764809))))

(declare-fun mapValue!57673 () ValueCell!17757)

(declare-fun mapKey!57673 () (_ BitVec 32))

(declare-fun mapRest!57673 () (Array (_ BitVec 32) ValueCell!17757))

(assert (=> mapNonEmpty!57673 (= (arr!44190 _values!1303) (store mapRest!57673 mapKey!57673 mapValue!57673))))

(declare-fun mapIsEmpty!57673 () Bool)

(assert (=> mapIsEmpty!57673 mapRes!57673))

(declare-fun b!1343804 () Bool)

(declare-fun res!891603 () Bool)

(assert (=> b!1343804 (=> (not res!891603) (not e!764811))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1343804 (= res!891603 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44739 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343805 () Bool)

(declare-fun res!891597 () Bool)

(assert (=> b!1343805 (=> (not res!891597) (not e!764811))))

(declare-datatypes ((List!31287 0))(
  ( (Nil!31284) (Cons!31283 (h!32492 (_ BitVec 64)) (t!45809 List!31287)) )
))
(declare-fun arrayNoDuplicates!0 (array!91466 (_ BitVec 32) List!31287) Bool)

(assert (=> b!1343805 (= res!891597 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31284))))

(declare-fun b!1343806 () Bool)

(declare-fun e!764810 () Bool)

(assert (=> b!1343806 (= e!764812 (and e!764810 mapRes!57673))))

(declare-fun condMapEmpty!57673 () Bool)

(declare-fun mapDefault!57673 () ValueCell!17757)

(assert (=> b!1343806 (= condMapEmpty!57673 (= (arr!44190 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17757)) mapDefault!57673)))))

(declare-fun b!1343807 () Bool)

(declare-fun res!891599 () Bool)

(assert (=> b!1343807 (=> (not res!891599) (not e!764811))))

(assert (=> b!1343807 (= res!891599 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343808 () Bool)

(declare-fun res!891602 () Bool)

(assert (=> b!1343808 (=> (not res!891602) (not e!764811))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343808 (= res!891602 (validKeyInArray!0 (select (arr!44189 _keys!1571) from!1960)))))

(declare-fun b!1343809 () Bool)

(declare-fun res!891596 () Bool)

(assert (=> b!1343809 (=> (not res!891596) (not e!764811))))

(assert (=> b!1343809 (= res!891596 (and (= (size!44740 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44739 _keys!1571) (size!44740 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343810 () Bool)

(assert (=> b!1343810 (= e!764809 tp_is_empty!37311)))

(declare-fun b!1343811 () Bool)

(declare-fun res!891598 () Bool)

(assert (=> b!1343811 (=> (not res!891598) (not e!764811))))

(declare-fun minValue!1245 () V!54851)

(declare-fun zeroValue!1245 () V!54851)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24132 0))(
  ( (tuple2!24133 (_1!12077 (_ BitVec 64)) (_2!12077 V!54851)) )
))
(declare-datatypes ((List!31288 0))(
  ( (Nil!31285) (Cons!31284 (h!32493 tuple2!24132) (t!45810 List!31288)) )
))
(declare-datatypes ((ListLongMap!21789 0))(
  ( (ListLongMap!21790 (toList!10910 List!31288)) )
))
(declare-fun contains!9086 (ListLongMap!21789 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5867 (array!91466 array!91468 (_ BitVec 32) (_ BitVec 32) V!54851 V!54851 (_ BitVec 32) Int) ListLongMap!21789)

(assert (=> b!1343811 (= res!891598 (contains!9086 (getCurrentListMap!5867 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343812 () Bool)

(assert (=> b!1343812 (= e!764810 tp_is_empty!37311)))

(declare-fun b!1343813 () Bool)

(declare-fun res!891601 () Bool)

(assert (=> b!1343813 (=> (not res!891601) (not e!764811))))

(assert (=> b!1343813 (= res!891601 (not (= (select (arr!44189 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343814 () Bool)

(assert (=> b!1343814 (= e!764811 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-fun lt!595097 () ListLongMap!21789)

(declare-fun +!4817 (ListLongMap!21789 tuple2!24132) ListLongMap!21789)

(assert (=> b!1343814 (contains!9086 (+!4817 lt!595097 (tuple2!24133 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44111 0))(
  ( (Unit!44112) )
))
(declare-fun lt!595098 () Unit!44111)

(declare-fun addStillContains!1210 (ListLongMap!21789 (_ BitVec 64) V!54851 (_ BitVec 64)) Unit!44111)

(assert (=> b!1343814 (= lt!595098 (addStillContains!1210 lt!595097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343814 (contains!9086 lt!595097 k0!1142)))

(declare-fun lt!595099 () V!54851)

(declare-fun lt!595100 () Unit!44111)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!386 ((_ BitVec 64) (_ BitVec 64) V!54851 ListLongMap!21789) Unit!44111)

(assert (=> b!1343814 (= lt!595100 (lemmaInListMapAfterAddingDiffThenInBefore!386 k0!1142 (select (arr!44189 _keys!1571) from!1960) lt!595099 lt!595097))))

(declare-fun lt!595101 () ListLongMap!21789)

(assert (=> b!1343814 (contains!9086 lt!595101 k0!1142)))

(declare-fun lt!595096 () Unit!44111)

(assert (=> b!1343814 (= lt!595096 (lemmaInListMapAfterAddingDiffThenInBefore!386 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595101))))

(assert (=> b!1343814 (= lt!595101 (+!4817 lt!595097 (tuple2!24133 (select (arr!44189 _keys!1571) from!1960) lt!595099)))))

(declare-fun get!22326 (ValueCell!17757 V!54851) V!54851)

(declare-fun dynLambda!3756 (Int (_ BitVec 64)) V!54851)

(assert (=> b!1343814 (= lt!595099 (get!22326 (select (arr!44190 _values!1303) from!1960) (dynLambda!3756 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6459 (array!91466 array!91468 (_ BitVec 32) (_ BitVec 32) V!54851 V!54851 (_ BitVec 32) Int) ListLongMap!21789)

(assert (=> b!1343814 (= lt!595097 (getCurrentListMapNoExtraKeys!6459 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(assert (= (and start!113260 res!891600) b!1343809))

(assert (= (and b!1343809 res!891596) b!1343803))

(assert (= (and b!1343803 res!891595) b!1343805))

(assert (= (and b!1343805 res!891597) b!1343804))

(assert (= (and b!1343804 res!891603) b!1343811))

(assert (= (and b!1343811 res!891598) b!1343813))

(assert (= (and b!1343813 res!891601) b!1343808))

(assert (= (and b!1343808 res!891602) b!1343807))

(assert (= (and b!1343807 res!891599) b!1343814))

(assert (= (and b!1343806 condMapEmpty!57673) mapIsEmpty!57673))

(assert (= (and b!1343806 (not condMapEmpty!57673)) mapNonEmpty!57673))

(get-info :version)

(assert (= (and mapNonEmpty!57673 ((_ is ValueCellFull!17757) mapValue!57673)) b!1343810))

(assert (= (and b!1343806 ((_ is ValueCellFull!17757) mapDefault!57673)) b!1343812))

(assert (= start!113260 b!1343806))

(declare-fun b_lambda!24487 () Bool)

(assert (=> (not b_lambda!24487) (not b!1343814)))

(declare-fun t!45808 () Bool)

(declare-fun tb!12325 () Bool)

(assert (=> (and start!113260 (= defaultEntry!1306 defaultEntry!1306) t!45808) tb!12325))

(declare-fun result!25741 () Bool)

(assert (=> tb!12325 (= result!25741 tp_is_empty!37311)))

(assert (=> b!1343814 t!45808))

(declare-fun b_and!50531 () Bool)

(assert (= b_and!50529 (and (=> t!45808 result!25741) b_and!50531)))

(declare-fun m!1231575 () Bool)

(assert (=> b!1343813 m!1231575))

(assert (=> b!1343808 m!1231575))

(assert (=> b!1343808 m!1231575))

(declare-fun m!1231577 () Bool)

(assert (=> b!1343808 m!1231577))

(declare-fun m!1231579 () Bool)

(assert (=> b!1343814 m!1231579))

(declare-fun m!1231581 () Bool)

(assert (=> b!1343814 m!1231581))

(declare-fun m!1231583 () Bool)

(assert (=> b!1343814 m!1231583))

(declare-fun m!1231585 () Bool)

(assert (=> b!1343814 m!1231585))

(declare-fun m!1231587 () Bool)

(assert (=> b!1343814 m!1231587))

(assert (=> b!1343814 m!1231575))

(declare-fun m!1231589 () Bool)

(assert (=> b!1343814 m!1231589))

(assert (=> b!1343814 m!1231585))

(declare-fun m!1231591 () Bool)

(assert (=> b!1343814 m!1231591))

(declare-fun m!1231593 () Bool)

(assert (=> b!1343814 m!1231593))

(declare-fun m!1231595 () Bool)

(assert (=> b!1343814 m!1231595))

(assert (=> b!1343814 m!1231583))

(assert (=> b!1343814 m!1231595))

(declare-fun m!1231597 () Bool)

(assert (=> b!1343814 m!1231597))

(assert (=> b!1343814 m!1231575))

(declare-fun m!1231599 () Bool)

(assert (=> b!1343814 m!1231599))

(declare-fun m!1231601 () Bool)

(assert (=> b!1343814 m!1231601))

(declare-fun m!1231603 () Bool)

(assert (=> b!1343803 m!1231603))

(declare-fun m!1231605 () Bool)

(assert (=> mapNonEmpty!57673 m!1231605))

(declare-fun m!1231607 () Bool)

(assert (=> start!113260 m!1231607))

(declare-fun m!1231609 () Bool)

(assert (=> start!113260 m!1231609))

(declare-fun m!1231611 () Bool)

(assert (=> start!113260 m!1231611))

(declare-fun m!1231613 () Bool)

(assert (=> b!1343811 m!1231613))

(assert (=> b!1343811 m!1231613))

(declare-fun m!1231615 () Bool)

(assert (=> b!1343811 m!1231615))

(declare-fun m!1231617 () Bool)

(assert (=> b!1343805 m!1231617))

(check-sat (not b!1343805) (not b!1343803) (not start!113260) (not b_next!31311) (not b_lambda!24487) (not mapNonEmpty!57673) (not b!1343814) (not b!1343811) tp_is_empty!37311 b_and!50531 (not b!1343808))
(check-sat b_and!50531 (not b_next!31311))
