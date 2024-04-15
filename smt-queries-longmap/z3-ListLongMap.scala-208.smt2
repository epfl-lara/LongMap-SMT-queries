; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3920 () Bool)

(assert start!3920)

(declare-fun b_free!835 () Bool)

(declare-fun b_next!835 () Bool)

(assert (=> start!3920 (= b_free!835 (not b_next!835))))

(declare-fun tp!3925 () Bool)

(declare-fun b_and!1639 () Bool)

(assert (=> start!3920 (= tp!3925 b_and!1639)))

(declare-fun b!27852 () Bool)

(declare-fun res!16536 () Bool)

(declare-fun e!18070 () Bool)

(assert (=> b!27852 (=> (not res!16536) (not e!18070))))

(declare-datatypes ((array!1591 0))(
  ( (array!1592 (arr!749 (Array (_ BitVec 32) (_ BitVec 64))) (size!850 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1591)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1591 (_ BitVec 32)) Bool)

(assert (=> b!27852 (= res!16536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27853 () Bool)

(declare-fun res!16540 () Bool)

(assert (=> b!27853 (=> (not res!16540) (not e!18070))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1411 0))(
  ( (V!1412 (val!621 Int)) )
))
(declare-datatypes ((ValueCell!395 0))(
  ( (ValueCellFull!395 (v!1709 V!1411)) (EmptyCell!395) )
))
(declare-datatypes ((array!1593 0))(
  ( (array!1594 (arr!750 (Array (_ BitVec 32) ValueCell!395)) (size!851 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1593)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1411)

(declare-fun minValue!1443 () V!1411)

(declare-datatypes ((tuple2!1048 0))(
  ( (tuple2!1049 (_1!535 (_ BitVec 64)) (_2!535 V!1411)) )
))
(declare-datatypes ((List!635 0))(
  ( (Nil!632) (Cons!631 (h!1198 tuple2!1048) (t!3321 List!635)) )
))
(declare-datatypes ((ListLongMap!613 0))(
  ( (ListLongMap!614 (toList!322 List!635)) )
))
(declare-fun contains!263 (ListLongMap!613 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!152 (array!1591 array!1593 (_ BitVec 32) (_ BitVec 32) V!1411 V!1411 (_ BitVec 32) Int) ListLongMap!613)

(assert (=> b!27853 (= res!16540 (not (contains!263 (getCurrentListMap!152 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27854 () Bool)

(declare-fun e!18068 () Bool)

(declare-fun tp_is_empty!1189 () Bool)

(assert (=> b!27854 (= e!18068 tp_is_empty!1189)))

(declare-fun res!16537 () Bool)

(assert (=> start!3920 (=> (not res!16537) (not e!18070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3920 (= res!16537 (validMask!0 mask!2294))))

(assert (=> start!3920 e!18070))

(assert (=> start!3920 true))

(assert (=> start!3920 tp!3925))

(declare-fun e!18067 () Bool)

(declare-fun array_inv!531 (array!1593) Bool)

(assert (=> start!3920 (and (array_inv!531 _values!1501) e!18067)))

(declare-fun array_inv!532 (array!1591) Bool)

(assert (=> start!3920 (array_inv!532 _keys!1833)))

(assert (=> start!3920 tp_is_empty!1189))

(declare-fun b!27855 () Bool)

(declare-fun res!16538 () Bool)

(assert (=> b!27855 (=> (not res!16538) (not e!18070))))

(declare-datatypes ((List!636 0))(
  ( (Nil!633) (Cons!632 (h!1199 (_ BitVec 64)) (t!3322 List!636)) )
))
(declare-fun arrayNoDuplicates!0 (array!1591 (_ BitVec 32) List!636) Bool)

(assert (=> b!27855 (= res!16538 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!633))))

(declare-fun mapNonEmpty!1312 () Bool)

(declare-fun mapRes!1312 () Bool)

(declare-fun tp!3924 () Bool)

(assert (=> mapNonEmpty!1312 (= mapRes!1312 (and tp!3924 e!18068))))

(declare-fun mapValue!1312 () ValueCell!395)

(declare-fun mapKey!1312 () (_ BitVec 32))

(declare-fun mapRest!1312 () (Array (_ BitVec 32) ValueCell!395))

(assert (=> mapNonEmpty!1312 (= (arr!750 _values!1501) (store mapRest!1312 mapKey!1312 mapValue!1312))))

(declare-fun b!27856 () Bool)

(declare-fun e!18069 () Bool)

(assert (=> b!27856 (= e!18067 (and e!18069 mapRes!1312))))

(declare-fun condMapEmpty!1312 () Bool)

(declare-fun mapDefault!1312 () ValueCell!395)

(assert (=> b!27856 (= condMapEmpty!1312 (= (arr!750 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!395)) mapDefault!1312)))))

(declare-fun mapIsEmpty!1312 () Bool)

(assert (=> mapIsEmpty!1312 mapRes!1312))

(declare-fun b!27857 () Bool)

(assert (=> b!27857 (= e!18069 tp_is_empty!1189)))

(declare-fun b!27858 () Bool)

(declare-fun res!16534 () Bool)

(assert (=> b!27858 (=> (not res!16534) (not e!18070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27858 (= res!16534 (validKeyInArray!0 k0!1304))))

(declare-fun b!27859 () Bool)

(declare-fun res!16539 () Bool)

(assert (=> b!27859 (=> (not res!16539) (not e!18070))))

(assert (=> b!27859 (= res!16539 (and (= (size!851 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!850 _keys!1833) (size!851 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27860 () Bool)

(assert (=> b!27860 (= e!18070 false)))

(declare-fun lt!10723 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1591 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27860 (= lt!10723 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27861 () Bool)

(declare-fun res!16535 () Bool)

(assert (=> b!27861 (=> (not res!16535) (not e!18070))))

(declare-fun arrayContainsKey!0 (array!1591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27861 (= res!16535 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(assert (= (and start!3920 res!16537) b!27859))

(assert (= (and b!27859 res!16539) b!27852))

(assert (= (and b!27852 res!16536) b!27855))

(assert (= (and b!27855 res!16538) b!27858))

(assert (= (and b!27858 res!16534) b!27853))

(assert (= (and b!27853 res!16540) b!27861))

(assert (= (and b!27861 res!16535) b!27860))

(assert (= (and b!27856 condMapEmpty!1312) mapIsEmpty!1312))

(assert (= (and b!27856 (not condMapEmpty!1312)) mapNonEmpty!1312))

(get-info :version)

(assert (= (and mapNonEmpty!1312 ((_ is ValueCellFull!395) mapValue!1312)) b!27854))

(assert (= (and b!27856 ((_ is ValueCellFull!395) mapDefault!1312)) b!27857))

(assert (= start!3920 b!27856))

(declare-fun m!22167 () Bool)

(assert (=> b!27853 m!22167))

(assert (=> b!27853 m!22167))

(declare-fun m!22169 () Bool)

(assert (=> b!27853 m!22169))

(declare-fun m!22171 () Bool)

(assert (=> b!27852 m!22171))

(declare-fun m!22173 () Bool)

(assert (=> mapNonEmpty!1312 m!22173))

(declare-fun m!22175 () Bool)

(assert (=> b!27860 m!22175))

(declare-fun m!22177 () Bool)

(assert (=> b!27855 m!22177))

(declare-fun m!22179 () Bool)

(assert (=> start!3920 m!22179))

(declare-fun m!22181 () Bool)

(assert (=> start!3920 m!22181))

(declare-fun m!22183 () Bool)

(assert (=> start!3920 m!22183))

(declare-fun m!22185 () Bool)

(assert (=> b!27861 m!22185))

(declare-fun m!22187 () Bool)

(assert (=> b!27858 m!22187))

(check-sat (not b!27861) (not b!27858) (not b!27855) (not b_next!835) (not mapNonEmpty!1312) (not b!27860) (not start!3920) b_and!1639 tp_is_empty!1189 (not b!27852) (not b!27853))
(check-sat b_and!1639 (not b_next!835))
