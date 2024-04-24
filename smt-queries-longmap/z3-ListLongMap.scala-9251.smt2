; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111078 () Bool)

(assert start!111078)

(declare-fun b_free!29689 () Bool)

(declare-fun b_next!29689 () Bool)

(assert (=> start!111078 (= b_free!29689 (not b_next!29689))))

(declare-fun tp!104388 () Bool)

(declare-fun b_and!47899 () Bool)

(assert (=> start!111078 (= tp!104388 b_and!47899)))

(declare-fun b!1313614 () Bool)

(declare-fun e!749373 () Bool)

(declare-fun tp_is_empty!35419 () Bool)

(assert (=> b!1313614 (= e!749373 tp_is_empty!35419)))

(declare-fun b!1313615 () Bool)

(declare-fun res!871777 () Bool)

(declare-fun e!749372 () Bool)

(assert (=> b!1313615 (=> (not res!871777) (not e!749372))))

(declare-datatypes ((array!87875 0))(
  ( (array!87876 (arr!42413 (Array (_ BitVec 32) (_ BitVec 64))) (size!42964 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87875)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313615 (= res!871777 (not (= (select (arr!42413 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1313616 () Bool)

(declare-fun res!871783 () Bool)

(assert (=> b!1313616 (=> (not res!871783) (not e!749372))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87875 (_ BitVec 32)) Bool)

(assert (=> b!1313616 (= res!871783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54757 () Bool)

(declare-fun mapRes!54757 () Bool)

(declare-fun tp!104389 () Bool)

(declare-fun e!749375 () Bool)

(assert (=> mapNonEmpty!54757 (= mapRes!54757 (and tp!104389 e!749375))))

(declare-datatypes ((V!52329 0))(
  ( (V!52330 (val!17784 Int)) )
))
(declare-datatypes ((ValueCell!16811 0))(
  ( (ValueCellFull!16811 (v!20406 V!52329)) (EmptyCell!16811) )
))
(declare-datatypes ((array!87877 0))(
  ( (array!87878 (arr!42414 (Array (_ BitVec 32) ValueCell!16811)) (size!42965 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87877)

(declare-fun mapRest!54757 () (Array (_ BitVec 32) ValueCell!16811))

(declare-fun mapValue!54757 () ValueCell!16811)

(declare-fun mapKey!54757 () (_ BitVec 32))

(assert (=> mapNonEmpty!54757 (= (arr!42414 _values!1354) (store mapRest!54757 mapKey!54757 mapValue!54757))))

(declare-fun mapIsEmpty!54757 () Bool)

(assert (=> mapIsEmpty!54757 mapRes!54757))

(declare-fun b!1313617 () Bool)

(declare-fun res!871781 () Bool)

(assert (=> b!1313617 (=> (not res!871781) (not e!749372))))

(declare-datatypes ((List!30108 0))(
  ( (Nil!30105) (Cons!30104 (h!31322 (_ BitVec 64)) (t!43706 List!30108)) )
))
(declare-fun arrayNoDuplicates!0 (array!87875 (_ BitVec 32) List!30108) Bool)

(assert (=> b!1313617 (= res!871781 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30105))))

(declare-fun b!1313618 () Bool)

(declare-fun res!871782 () Bool)

(assert (=> b!1313618 (=> (not res!871782) (not e!749372))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313618 (= res!871782 (and (= (size!42965 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42964 _keys!1628) (size!42965 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313619 () Bool)

(declare-fun res!871780 () Bool)

(assert (=> b!1313619 (=> (not res!871780) (not e!749372))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1313619 (= res!871780 (validKeyInArray!0 (select (arr!42413 _keys!1628) from!2020)))))

(declare-fun b!1313620 () Bool)

(assert (=> b!1313620 (= e!749375 tp_is_empty!35419)))

(declare-fun res!871776 () Bool)

(assert (=> start!111078 (=> (not res!871776) (not e!749372))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111078 (= res!871776 (validMask!0 mask!2040))))

(assert (=> start!111078 e!749372))

(assert (=> start!111078 tp!104388))

(declare-fun array_inv!32305 (array!87875) Bool)

(assert (=> start!111078 (array_inv!32305 _keys!1628)))

(assert (=> start!111078 true))

(assert (=> start!111078 tp_is_empty!35419))

(declare-fun e!749374 () Bool)

(declare-fun array_inv!32306 (array!87877) Bool)

(assert (=> start!111078 (and (array_inv!32306 _values!1354) e!749374)))

(declare-fun b!1313621 () Bool)

(declare-fun res!871778 () Bool)

(assert (=> b!1313621 (=> (not res!871778) (not e!749372))))

(assert (=> b!1313621 (= res!871778 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42964 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313622 () Bool)

(declare-fun res!871784 () Bool)

(assert (=> b!1313622 (=> (not res!871784) (not e!749372))))

(assert (=> b!1313622 (= res!871784 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1313623 () Bool)

(declare-fun res!871779 () Bool)

(assert (=> b!1313623 (=> (not res!871779) (not e!749372))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52329)

(declare-fun zeroValue!1296 () V!52329)

(declare-datatypes ((tuple2!22956 0))(
  ( (tuple2!22957 (_1!11489 (_ BitVec 64)) (_2!11489 V!52329)) )
))
(declare-datatypes ((List!30109 0))(
  ( (Nil!30106) (Cons!30105 (h!31323 tuple2!22956) (t!43707 List!30109)) )
))
(declare-datatypes ((ListLongMap!20621 0))(
  ( (ListLongMap!20622 (toList!10326 List!30109)) )
))
(declare-fun contains!8488 (ListLongMap!20621 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5330 (array!87875 array!87877 (_ BitVec 32) (_ BitVec 32) V!52329 V!52329 (_ BitVec 32) Int) ListLongMap!20621)

(assert (=> b!1313623 (= res!871779 (contains!8488 (getCurrentListMap!5330 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313624 () Bool)

(assert (=> b!1313624 (= e!749374 (and e!749373 mapRes!54757))))

(declare-fun condMapEmpty!54757 () Bool)

(declare-fun mapDefault!54757 () ValueCell!16811)

(assert (=> b!1313624 (= condMapEmpty!54757 (= (arr!42414 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16811)) mapDefault!54757)))))

(declare-fun b!1313625 () Bool)

(assert (=> b!1313625 (= e!749372 (not true))))

(assert (=> b!1313625 (contains!8488 (getCurrentListMap!5330 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43343 0))(
  ( (Unit!43344) )
))
(declare-fun lt!586028 () Unit!43343)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!12 (array!87875 array!87877 (_ BitVec 32) (_ BitVec 32) V!52329 V!52329 (_ BitVec 64) (_ BitVec 32) Int) Unit!43343)

(assert (=> b!1313625 (= lt!586028 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!12 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(assert (= (and start!111078 res!871776) b!1313618))

(assert (= (and b!1313618 res!871782) b!1313616))

(assert (= (and b!1313616 res!871783) b!1313617))

(assert (= (and b!1313617 res!871781) b!1313621))

(assert (= (and b!1313621 res!871778) b!1313623))

(assert (= (and b!1313623 res!871779) b!1313615))

(assert (= (and b!1313615 res!871777) b!1313619))

(assert (= (and b!1313619 res!871780) b!1313622))

(assert (= (and b!1313622 res!871784) b!1313625))

(assert (= (and b!1313624 condMapEmpty!54757) mapIsEmpty!54757))

(assert (= (and b!1313624 (not condMapEmpty!54757)) mapNonEmpty!54757))

(get-info :version)

(assert (= (and mapNonEmpty!54757 ((_ is ValueCellFull!16811) mapValue!54757)) b!1313620))

(assert (= (and b!1313624 ((_ is ValueCellFull!16811) mapDefault!54757)) b!1313614))

(assert (= start!111078 b!1313624))

(declare-fun m!1203125 () Bool)

(assert (=> b!1313615 m!1203125))

(declare-fun m!1203127 () Bool)

(assert (=> start!111078 m!1203127))

(declare-fun m!1203129 () Bool)

(assert (=> start!111078 m!1203129))

(declare-fun m!1203131 () Bool)

(assert (=> start!111078 m!1203131))

(declare-fun m!1203133 () Bool)

(assert (=> mapNonEmpty!54757 m!1203133))

(declare-fun m!1203135 () Bool)

(assert (=> b!1313617 m!1203135))

(declare-fun m!1203137 () Bool)

(assert (=> b!1313625 m!1203137))

(assert (=> b!1313625 m!1203137))

(declare-fun m!1203139 () Bool)

(assert (=> b!1313625 m!1203139))

(declare-fun m!1203141 () Bool)

(assert (=> b!1313625 m!1203141))

(assert (=> b!1313619 m!1203125))

(assert (=> b!1313619 m!1203125))

(declare-fun m!1203143 () Bool)

(assert (=> b!1313619 m!1203143))

(declare-fun m!1203145 () Bool)

(assert (=> b!1313623 m!1203145))

(assert (=> b!1313623 m!1203145))

(declare-fun m!1203147 () Bool)

(assert (=> b!1313623 m!1203147))

(declare-fun m!1203149 () Bool)

(assert (=> b!1313616 m!1203149))

(check-sat tp_is_empty!35419 (not b!1313616) (not b!1313625) b_and!47899 (not b!1313623) (not mapNonEmpty!54757) (not start!111078) (not b!1313619) (not b!1313617) (not b_next!29689))
(check-sat b_and!47899 (not b_next!29689))
