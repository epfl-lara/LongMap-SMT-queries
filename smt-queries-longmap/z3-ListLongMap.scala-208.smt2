; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3926 () Bool)

(assert start!3926)

(declare-fun b_free!835 () Bool)

(declare-fun b_next!835 () Bool)

(assert (=> start!3926 (= b_free!835 (not b_next!835))))

(declare-fun tp!3925 () Bool)

(declare-fun b_and!1635 () Bool)

(assert (=> start!3926 (= tp!3925 b_and!1635)))

(declare-fun res!16528 () Bool)

(declare-fun e!18058 () Bool)

(assert (=> start!3926 (=> (not res!16528) (not e!18058))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3926 (= res!16528 (validMask!0 mask!2294))))

(assert (=> start!3926 e!18058))

(assert (=> start!3926 true))

(assert (=> start!3926 tp!3925))

(declare-datatypes ((V!1411 0))(
  ( (V!1412 (val!621 Int)) )
))
(declare-datatypes ((ValueCell!395 0))(
  ( (ValueCellFull!395 (v!1710 V!1411)) (EmptyCell!395) )
))
(declare-datatypes ((array!1599 0))(
  ( (array!1600 (arr!753 (Array (_ BitVec 32) ValueCell!395)) (size!854 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1599)

(declare-fun e!18059 () Bool)

(declare-fun array_inv!527 (array!1599) Bool)

(assert (=> start!3926 (and (array_inv!527 _values!1501) e!18059)))

(declare-datatypes ((array!1601 0))(
  ( (array!1602 (arr!754 (Array (_ BitVec 32) (_ BitVec 64))) (size!855 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1601)

(declare-fun array_inv!528 (array!1601) Bool)

(assert (=> start!3926 (array_inv!528 _keys!1833)))

(declare-fun tp_is_empty!1189 () Bool)

(assert (=> start!3926 tp_is_empty!1189))

(declare-fun b!27834 () Bool)

(declare-fun e!18057 () Bool)

(assert (=> b!27834 (= e!18057 tp_is_empty!1189)))

(declare-fun b!27835 () Bool)

(declare-fun e!18061 () Bool)

(declare-fun mapRes!1312 () Bool)

(assert (=> b!27835 (= e!18059 (and e!18061 mapRes!1312))))

(declare-fun condMapEmpty!1312 () Bool)

(declare-fun mapDefault!1312 () ValueCell!395)

(assert (=> b!27835 (= condMapEmpty!1312 (= (arr!753 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!395)) mapDefault!1312)))))

(declare-fun b!27836 () Bool)

(declare-fun res!16529 () Bool)

(assert (=> b!27836 (=> (not res!16529) (not e!18058))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1411)

(declare-fun minValue!1443 () V!1411)

(declare-datatypes ((tuple2!1038 0))(
  ( (tuple2!1039 (_1!530 (_ BitVec 64)) (_2!530 V!1411)) )
))
(declare-datatypes ((List!631 0))(
  ( (Nil!628) (Cons!627 (h!1194 tuple2!1038) (t!3318 List!631)) )
))
(declare-datatypes ((ListLongMap!609 0))(
  ( (ListLongMap!610 (toList!320 List!631)) )
))
(declare-fun contains!262 (ListLongMap!609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!150 (array!1601 array!1599 (_ BitVec 32) (_ BitVec 32) V!1411 V!1411 (_ BitVec 32) Int) ListLongMap!609)

(assert (=> b!27836 (= res!16529 (not (contains!262 (getCurrentListMap!150 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun mapNonEmpty!1312 () Bool)

(declare-fun tp!3924 () Bool)

(assert (=> mapNonEmpty!1312 (= mapRes!1312 (and tp!3924 e!18057))))

(declare-fun mapKey!1312 () (_ BitVec 32))

(declare-fun mapRest!1312 () (Array (_ BitVec 32) ValueCell!395))

(declare-fun mapValue!1312 () ValueCell!395)

(assert (=> mapNonEmpty!1312 (= (arr!753 _values!1501) (store mapRest!1312 mapKey!1312 mapValue!1312))))

(declare-fun b!27837 () Bool)

(declare-fun res!16531 () Bool)

(assert (=> b!27837 (=> (not res!16531) (not e!18058))))

(declare-fun arrayContainsKey!0 (array!1601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27837 (= res!16531 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27838 () Bool)

(assert (=> b!27838 (= e!18061 tp_is_empty!1189)))

(declare-fun mapIsEmpty!1312 () Bool)

(assert (=> mapIsEmpty!1312 mapRes!1312))

(declare-fun b!27839 () Bool)

(declare-fun res!16532 () Bool)

(assert (=> b!27839 (=> (not res!16532) (not e!18058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1601 (_ BitVec 32)) Bool)

(assert (=> b!27839 (= res!16532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27840 () Bool)

(declare-fun res!16530 () Bool)

(assert (=> b!27840 (=> (not res!16530) (not e!18058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27840 (= res!16530 (validKeyInArray!0 k0!1304))))

(declare-fun b!27841 () Bool)

(declare-fun res!16527 () Bool)

(assert (=> b!27841 (=> (not res!16527) (not e!18058))))

(declare-datatypes ((List!632 0))(
  ( (Nil!629) (Cons!628 (h!1195 (_ BitVec 64)) (t!3319 List!632)) )
))
(declare-fun arrayNoDuplicates!0 (array!1601 (_ BitVec 32) List!632) Bool)

(assert (=> b!27841 (= res!16527 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!629))))

(declare-fun b!27842 () Bool)

(assert (=> b!27842 (= e!18058 false)))

(declare-fun lt!10683 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!1601 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27842 (= lt!10683 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27843 () Bool)

(declare-fun res!16526 () Bool)

(assert (=> b!27843 (=> (not res!16526) (not e!18058))))

(assert (=> b!27843 (= res!16526 (and (= (size!854 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!855 _keys!1833) (size!854 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!3926 res!16528) b!27843))

(assert (= (and b!27843 res!16526) b!27839))

(assert (= (and b!27839 res!16532) b!27841))

(assert (= (and b!27841 res!16527) b!27840))

(assert (= (and b!27840 res!16530) b!27836))

(assert (= (and b!27836 res!16529) b!27837))

(assert (= (and b!27837 res!16531) b!27842))

(assert (= (and b!27835 condMapEmpty!1312) mapIsEmpty!1312))

(assert (= (and b!27835 (not condMapEmpty!1312)) mapNonEmpty!1312))

(get-info :version)

(assert (= (and mapNonEmpty!1312 ((_ is ValueCellFull!395) mapValue!1312)) b!27834))

(assert (= (and b!27835 ((_ is ValueCellFull!395) mapDefault!1312)) b!27838))

(assert (= start!3926 b!27835))

(declare-fun m!22085 () Bool)

(assert (=> b!27841 m!22085))

(declare-fun m!22087 () Bool)

(assert (=> b!27837 m!22087))

(declare-fun m!22089 () Bool)

(assert (=> b!27836 m!22089))

(assert (=> b!27836 m!22089))

(declare-fun m!22091 () Bool)

(assert (=> b!27836 m!22091))

(declare-fun m!22093 () Bool)

(assert (=> mapNonEmpty!1312 m!22093))

(declare-fun m!22095 () Bool)

(assert (=> b!27842 m!22095))

(declare-fun m!22097 () Bool)

(assert (=> b!27839 m!22097))

(declare-fun m!22099 () Bool)

(assert (=> b!27840 m!22099))

(declare-fun m!22101 () Bool)

(assert (=> start!3926 m!22101))

(declare-fun m!22103 () Bool)

(assert (=> start!3926 m!22103))

(declare-fun m!22105 () Bool)

(assert (=> start!3926 m!22105))

(check-sat (not b!27842) (not b_next!835) (not b!27839) (not b!27840) (not start!3926) tp_is_empty!1189 (not mapNonEmpty!1312) (not b!27837) (not b!27836) (not b!27841) b_and!1635)
(check-sat b_and!1635 (not b_next!835))
