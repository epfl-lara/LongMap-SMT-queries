; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!842 () Bool)

(assert start!842)

(declare-fun b_free!235 () Bool)

(declare-fun b_next!235 () Bool)

(assert (=> start!842 (= b_free!235 (not b_next!235))))

(declare-fun tp!935 () Bool)

(declare-fun b_and!381 () Bool)

(assert (=> start!842 (= tp!935 b_and!381)))

(declare-fun b!6745 () Bool)

(declare-fun e!3727 () Bool)

(declare-fun tp_is_empty!313 () Bool)

(assert (=> b!6745 (= e!3727 tp_is_empty!313)))

(declare-fun b!6746 () Bool)

(declare-fun res!7011 () Bool)

(declare-fun e!3724 () Bool)

(assert (=> b!6746 (=> (not res!7011) (not e!3724))))

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6746 (= res!7011 (validKeyInArray!0 k0!1278))))

(declare-fun b!6747 () Bool)

(declare-fun res!7013 () Bool)

(assert (=> b!6747 (=> (not res!7013) (not e!3724))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!595 0))(
  ( (V!596 (val!162 Int)) )
))
(declare-datatypes ((ValueCell!140 0))(
  ( (ValueCellFull!140 (v!1253 V!595)) (EmptyCell!140) )
))
(declare-datatypes ((array!549 0))(
  ( (array!550 (arr!263 (Array (_ BitVec 32) ValueCell!140)) (size!325 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!549)

(declare-datatypes ((array!551 0))(
  ( (array!552 (arr!264 (Array (_ BitVec 32) (_ BitVec 64))) (size!326 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!551)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6747 (= res!7013 (and (= (size!325 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!326 _keys!1806) (size!325 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6748 () Bool)

(declare-fun e!3731 () Bool)

(assert (=> b!6748 (= e!3731 true)))

(declare-datatypes ((SeekEntryResult!23 0))(
  ( (MissingZero!23 (index!2211 (_ BitVec 32))) (Found!23 (index!2212 (_ BitVec 32))) (Intermediate!23 (undefined!835 Bool) (index!2213 (_ BitVec 32)) (x!2553 (_ BitVec 32))) (Undefined!23) (MissingVacant!23 (index!2214 (_ BitVec 32))) )
))
(declare-fun lt!1305 () SeekEntryResult!23)

(declare-fun lt!1301 () (_ BitVec 32))

(get-info :version)

(assert (=> b!6748 (and ((_ is Found!23) lt!1305) (= (index!2212 lt!1305) lt!1301))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!551 (_ BitVec 32)) SeekEntryResult!23)

(assert (=> b!6748 (= lt!1305 (seekEntry!0 k0!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!119 0))(
  ( (Unit!120) )
))
(declare-fun lt!1303 () Unit!119)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!551 (_ BitVec 32)) Unit!119)

(assert (=> b!6748 (= lt!1303 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1278 lt!1301 _keys!1806 mask!2250))))

(declare-fun b!6749 () Bool)

(declare-fun e!3728 () Bool)

(declare-fun arrayContainsKey!0 (array!551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6749 (= e!3728 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6750 () Bool)

(declare-fun res!7009 () Bool)

(assert (=> b!6750 (=> (not res!7009) (not e!3724))))

(declare-datatypes ((List!178 0))(
  ( (Nil!175) (Cons!174 (h!740 (_ BitVec 64)) (t!2313 List!178)) )
))
(declare-fun arrayNoDuplicates!0 (array!551 (_ BitVec 32) List!178) Bool)

(assert (=> b!6750 (= res!7009 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!175))))

(declare-fun b!6751 () Bool)

(declare-fun res!7015 () Bool)

(assert (=> b!6751 (=> (not res!7015) (not e!3724))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!595)

(declare-fun zeroValue!1434 () V!595)

(declare-datatypes ((tuple2!168 0))(
  ( (tuple2!169 (_1!84 (_ BitVec 64)) (_2!84 V!595)) )
))
(declare-datatypes ((List!179 0))(
  ( (Nil!176) (Cons!175 (h!741 tuple2!168) (t!2314 List!179)) )
))
(declare-datatypes ((ListLongMap!173 0))(
  ( (ListLongMap!174 (toList!102 List!179)) )
))
(declare-fun contains!76 (ListLongMap!173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!61 (array!551 array!549 (_ BitVec 32) (_ BitVec 32) V!595 V!595 (_ BitVec 32) Int) ListLongMap!173)

(assert (=> b!6751 (= res!7015 (contains!76 (getCurrentListMap!61 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!440 () Bool)

(declare-fun mapRes!440 () Bool)

(assert (=> mapIsEmpty!440 mapRes!440))

(declare-fun res!7012 () Bool)

(assert (=> start!842 (=> (not res!7012) (not e!3724))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!842 (= res!7012 (validMask!0 mask!2250))))

(assert (=> start!842 e!3724))

(assert (=> start!842 tp!935))

(assert (=> start!842 true))

(declare-fun e!3726 () Bool)

(declare-fun array_inv!187 (array!549) Bool)

(assert (=> start!842 (and (array_inv!187 _values!1492) e!3726)))

(assert (=> start!842 tp_is_empty!313))

(declare-fun array_inv!188 (array!551) Bool)

(assert (=> start!842 (array_inv!188 _keys!1806)))

(declare-fun b!6752 () Bool)

(declare-fun e!3729 () Bool)

(assert (=> b!6752 (= e!3726 (and e!3729 mapRes!440))))

(declare-fun condMapEmpty!440 () Bool)

(declare-fun mapDefault!440 () ValueCell!140)

(assert (=> b!6752 (= condMapEmpty!440 (= (arr!263 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!140)) mapDefault!440)))))

(declare-fun b!6753 () Bool)

(declare-fun e!3725 () Bool)

(assert (=> b!6753 (= e!3725 e!3731)))

(declare-fun res!7010 () Bool)

(assert (=> b!6753 (=> res!7010 e!3731)))

(assert (=> b!6753 (= res!7010 (not (= (size!326 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!551 (_ BitVec 32)) Bool)

(assert (=> b!6753 (arrayForallSeekEntryOrOpenFound!0 lt!1301 _keys!1806 mask!2250)))

(declare-fun lt!1302 () Unit!119)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!119)

(assert (=> b!6753 (= lt!1302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1301))))

(declare-fun arrayScanForKey!0 (array!551 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6753 (= lt!1301 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6754 () Bool)

(assert (=> b!6754 (= e!3728 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6755 () Bool)

(declare-fun res!7008 () Bool)

(assert (=> b!6755 (=> res!7008 e!3731)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!551 (_ BitVec 32)) SeekEntryResult!23)

(assert (=> b!6755 (= res!7008 (not (= (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250) (Found!23 lt!1301))))))

(declare-fun b!6756 () Bool)

(assert (=> b!6756 (= e!3724 (not e!3725))))

(declare-fun res!7007 () Bool)

(assert (=> b!6756 (=> res!7007 e!3725)))

(assert (=> b!6756 (= res!7007 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6756 e!3728))

(declare-fun c!485 () Bool)

(assert (=> b!6756 (= c!485 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1304 () Unit!119)

(declare-fun lemmaKeyInListMapIsInArray!43 (array!551 array!549 (_ BitVec 32) (_ BitVec 32) V!595 V!595 (_ BitVec 64) Int) Unit!119)

(assert (=> b!6756 (= lt!1304 (lemmaKeyInListMapIsInArray!43 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6757 () Bool)

(assert (=> b!6757 (= e!3729 tp_is_empty!313)))

(declare-fun mapNonEmpty!440 () Bool)

(declare-fun tp!934 () Bool)

(assert (=> mapNonEmpty!440 (= mapRes!440 (and tp!934 e!3727))))

(declare-fun mapValue!440 () ValueCell!140)

(declare-fun mapKey!440 () (_ BitVec 32))

(declare-fun mapRest!440 () (Array (_ BitVec 32) ValueCell!140))

(assert (=> mapNonEmpty!440 (= (arr!263 _values!1492) (store mapRest!440 mapKey!440 mapValue!440))))

(declare-fun b!6758 () Bool)

(declare-fun res!7014 () Bool)

(assert (=> b!6758 (=> (not res!7014) (not e!3724))))

(assert (=> b!6758 (= res!7014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!842 res!7012) b!6747))

(assert (= (and b!6747 res!7013) b!6758))

(assert (= (and b!6758 res!7014) b!6750))

(assert (= (and b!6750 res!7009) b!6751))

(assert (= (and b!6751 res!7015) b!6746))

(assert (= (and b!6746 res!7011) b!6756))

(assert (= (and b!6756 c!485) b!6749))

(assert (= (and b!6756 (not c!485)) b!6754))

(assert (= (and b!6756 (not res!7007)) b!6753))

(assert (= (and b!6753 (not res!7010)) b!6755))

(assert (= (and b!6755 (not res!7008)) b!6748))

(assert (= (and b!6752 condMapEmpty!440) mapIsEmpty!440))

(assert (= (and b!6752 (not condMapEmpty!440)) mapNonEmpty!440))

(assert (= (and mapNonEmpty!440 ((_ is ValueCellFull!140) mapValue!440)) b!6745))

(assert (= (and b!6752 ((_ is ValueCellFull!140) mapDefault!440)) b!6757))

(assert (= start!842 b!6752))

(declare-fun m!3947 () Bool)

(assert (=> b!6756 m!3947))

(declare-fun m!3949 () Bool)

(assert (=> b!6756 m!3949))

(declare-fun m!3951 () Bool)

(assert (=> b!6750 m!3951))

(declare-fun m!3953 () Bool)

(assert (=> b!6746 m!3953))

(declare-fun m!3955 () Bool)

(assert (=> b!6748 m!3955))

(declare-fun m!3957 () Bool)

(assert (=> b!6748 m!3957))

(assert (=> b!6749 m!3947))

(declare-fun m!3959 () Bool)

(assert (=> b!6755 m!3959))

(declare-fun m!3961 () Bool)

(assert (=> b!6758 m!3961))

(declare-fun m!3963 () Bool)

(assert (=> b!6753 m!3963))

(declare-fun m!3965 () Bool)

(assert (=> b!6753 m!3965))

(declare-fun m!3967 () Bool)

(assert (=> b!6753 m!3967))

(declare-fun m!3969 () Bool)

(assert (=> b!6751 m!3969))

(assert (=> b!6751 m!3969))

(declare-fun m!3971 () Bool)

(assert (=> b!6751 m!3971))

(declare-fun m!3973 () Bool)

(assert (=> mapNonEmpty!440 m!3973))

(declare-fun m!3975 () Bool)

(assert (=> start!842 m!3975))

(declare-fun m!3977 () Bool)

(assert (=> start!842 m!3977))

(declare-fun m!3979 () Bool)

(assert (=> start!842 m!3979))

(check-sat (not b!6746) tp_is_empty!313 (not start!842) (not b!6748) (not mapNonEmpty!440) (not b!6749) (not b!6756) (not b_next!235) (not b!6753) (not b!6758) (not b!6755) b_and!381 (not b!6750) (not b!6751))
(check-sat b_and!381 (not b_next!235))
