; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83742 () Bool)

(assert start!83742)

(declare-fun b!977803 () Bool)

(declare-fun res!654372 () Bool)

(declare-fun e!551315 () Bool)

(assert (=> b!977803 (=> (not res!654372) (not e!551315))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61117 0))(
  ( (array!61118 (arr!29416 (Array (_ BitVec 32) (_ BitVec 64))) (size!29895 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61117)

(declare-datatypes ((V!35043 0))(
  ( (V!35044 (val!11323 Int)) )
))
(declare-datatypes ((ValueCell!10791 0))(
  ( (ValueCellFull!10791 (v!13885 V!35043)) (EmptyCell!10791) )
))
(declare-datatypes ((array!61119 0))(
  ( (array!61120 (arr!29417 (Array (_ BitVec 32) ValueCell!10791)) (size!29896 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61119)

(assert (=> b!977803 (= res!654372 (and (= (size!29896 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29895 _keys!1544) (size!29896 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977804 () Bool)

(declare-fun res!654370 () Bool)

(assert (=> b!977804 (=> (not res!654370) (not e!551315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61117 (_ BitVec 32)) Bool)

(assert (=> b!977804 (= res!654370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977805 () Bool)

(declare-fun e!551316 () Bool)

(declare-fun tp_is_empty!22545 () Bool)

(assert (=> b!977805 (= e!551316 tp_is_empty!22545)))

(declare-fun res!654373 () Bool)

(assert (=> start!83742 (=> (not res!654373) (not e!551315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83742 (= res!654373 (validMask!0 mask!1948))))

(assert (=> start!83742 e!551315))

(assert (=> start!83742 true))

(declare-fun e!551313 () Bool)

(declare-fun array_inv!22741 (array!61119) Bool)

(assert (=> start!83742 (and (array_inv!22741 _values!1278) e!551313)))

(declare-fun array_inv!22742 (array!61117) Bool)

(assert (=> start!83742 (array_inv!22742 _keys!1544)))

(declare-fun b!977806 () Bool)

(declare-fun e!551312 () Bool)

(declare-fun mapRes!35846 () Bool)

(assert (=> b!977806 (= e!551313 (and e!551312 mapRes!35846))))

(declare-fun condMapEmpty!35846 () Bool)

(declare-fun mapDefault!35846 () ValueCell!10791)

(assert (=> b!977806 (= condMapEmpty!35846 (= (arr!29417 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10791)) mapDefault!35846)))))

(declare-fun b!977807 () Bool)

(declare-fun res!654369 () Bool)

(assert (=> b!977807 (=> (not res!654369) (not e!551315))))

(declare-datatypes ((List!20388 0))(
  ( (Nil!20385) (Cons!20384 (h!21546 (_ BitVec 64)) (t!28903 List!20388)) )
))
(declare-fun arrayNoDuplicates!0 (array!61117 (_ BitVec 32) List!20388) Bool)

(assert (=> b!977807 (= res!654369 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20385))))

(declare-fun b!977808 () Bool)

(declare-fun res!654371 () Bool)

(assert (=> b!977808 (=> (not res!654371) (not e!551315))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977808 (= res!654371 (validKeyInArray!0 (select (arr!29416 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!35846 () Bool)

(declare-fun tp!68098 () Bool)

(assert (=> mapNonEmpty!35846 (= mapRes!35846 (and tp!68098 e!551316))))

(declare-fun mapRest!35846 () (Array (_ BitVec 32) ValueCell!10791))

(declare-fun mapValue!35846 () ValueCell!10791)

(declare-fun mapKey!35846 () (_ BitVec 32))

(assert (=> mapNonEmpty!35846 (= (arr!29417 _values!1278) (store mapRest!35846 mapKey!35846 mapValue!35846))))

(declare-fun b!977809 () Bool)

(assert (=> b!977809 (= e!551315 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun b!977810 () Bool)

(assert (=> b!977810 (= e!551312 tp_is_empty!22545)))

(declare-fun b!977811 () Bool)

(declare-fun res!654374 () Bool)

(assert (=> b!977811 (=> (not res!654374) (not e!551315))))

(assert (=> b!977811 (= res!654374 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29895 _keys!1544))))))

(declare-fun mapIsEmpty!35846 () Bool)

(assert (=> mapIsEmpty!35846 mapRes!35846))

(assert (= (and start!83742 res!654373) b!977803))

(assert (= (and b!977803 res!654372) b!977804))

(assert (= (and b!977804 res!654370) b!977807))

(assert (= (and b!977807 res!654369) b!977811))

(assert (= (and b!977811 res!654374) b!977808))

(assert (= (and b!977808 res!654371) b!977809))

(assert (= (and b!977806 condMapEmpty!35846) mapIsEmpty!35846))

(assert (= (and b!977806 (not condMapEmpty!35846)) mapNonEmpty!35846))

(get-info :version)

(assert (= (and mapNonEmpty!35846 ((_ is ValueCellFull!10791) mapValue!35846)) b!977805))

(assert (= (and b!977806 ((_ is ValueCellFull!10791) mapDefault!35846)) b!977810))

(assert (= start!83742 b!977806))

(declare-fun m!904943 () Bool)

(assert (=> mapNonEmpty!35846 m!904943))

(declare-fun m!904945 () Bool)

(assert (=> b!977808 m!904945))

(assert (=> b!977808 m!904945))

(declare-fun m!904947 () Bool)

(assert (=> b!977808 m!904947))

(declare-fun m!904949 () Bool)

(assert (=> start!83742 m!904949))

(declare-fun m!904951 () Bool)

(assert (=> start!83742 m!904951))

(declare-fun m!904953 () Bool)

(assert (=> start!83742 m!904953))

(declare-fun m!904955 () Bool)

(assert (=> b!977804 m!904955))

(declare-fun m!904957 () Bool)

(assert (=> b!977807 m!904957))

(check-sat (not mapNonEmpty!35846) (not b!977807) tp_is_empty!22545 (not b!977808) (not b!977804) (not start!83742))
(check-sat)
