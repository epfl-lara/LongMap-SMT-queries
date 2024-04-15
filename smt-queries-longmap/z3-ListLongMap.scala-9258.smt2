; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110896 () Bool)

(assert start!110896)

(declare-fun b_free!29731 () Bool)

(declare-fun b_next!29731 () Bool)

(assert (=> start!110896 (= b_free!29731 (not b_next!29731))))

(declare-fun tp!104516 () Bool)

(declare-fun b_and!47921 () Bool)

(assert (=> start!110896 (= tp!104516 b_and!47921)))

(declare-fun b!1312813 () Bool)

(declare-fun res!871609 () Bool)

(declare-fun e!748812 () Bool)

(assert (=> b!1312813 (=> (not res!871609) (not e!748812))))

(declare-datatypes ((array!87805 0))(
  ( (array!87806 (arr!42383 (Array (_ BitVec 32) (_ BitVec 64))) (size!42935 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87805)

(declare-datatypes ((List!30159 0))(
  ( (Nil!30156) (Cons!30155 (h!31364 (_ BitVec 64)) (t!43757 List!30159)) )
))
(declare-fun arrayNoDuplicates!0 (array!87805 (_ BitVec 32) List!30159) Bool)

(assert (=> b!1312813 (= res!871609 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30156))))

(declare-fun b!1312814 () Bool)

(declare-fun res!871612 () Bool)

(assert (=> b!1312814 (=> (not res!871612) (not e!748812))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87805 (_ BitVec 32)) Bool)

(assert (=> b!1312814 (= res!871612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1312815 () Bool)

(declare-fun res!871611 () Bool)

(assert (=> b!1312815 (=> (not res!871611) (not e!748812))))

(declare-datatypes ((V!52385 0))(
  ( (V!52386 (val!17805 Int)) )
))
(declare-datatypes ((ValueCell!16832 0))(
  ( (ValueCellFull!16832 (v!20431 V!52385)) (EmptyCell!16832) )
))
(declare-datatypes ((array!87807 0))(
  ( (array!87808 (arr!42384 (Array (_ BitVec 32) ValueCell!16832)) (size!42936 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87807)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312815 (= res!871611 (and (= (size!42936 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42935 _keys!1628) (size!42936 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!871610 () Bool)

(assert (=> start!110896 (=> (not res!871610) (not e!748812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110896 (= res!871610 (validMask!0 mask!2040))))

(assert (=> start!110896 e!748812))

(assert (=> start!110896 tp!104516))

(declare-fun array_inv!32209 (array!87805) Bool)

(assert (=> start!110896 (array_inv!32209 _keys!1628)))

(assert (=> start!110896 true))

(declare-fun tp_is_empty!35461 () Bool)

(assert (=> start!110896 tp_is_empty!35461))

(declare-fun e!748813 () Bool)

(declare-fun array_inv!32210 (array!87807) Bool)

(assert (=> start!110896 (and (array_inv!32210 _values!1354) e!748813)))

(declare-fun b!1312816 () Bool)

(declare-fun e!748810 () Bool)

(declare-fun mapRes!54820 () Bool)

(assert (=> b!1312816 (= e!748813 (and e!748810 mapRes!54820))))

(declare-fun condMapEmpty!54820 () Bool)

(declare-fun mapDefault!54820 () ValueCell!16832)

(assert (=> b!1312816 (= condMapEmpty!54820 (= (arr!42384 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16832)) mapDefault!54820)))))

(declare-fun mapNonEmpty!54820 () Bool)

(declare-fun tp!104515 () Bool)

(declare-fun e!748811 () Bool)

(assert (=> mapNonEmpty!54820 (= mapRes!54820 (and tp!104515 e!748811))))

(declare-fun mapValue!54820 () ValueCell!16832)

(declare-fun mapKey!54820 () (_ BitVec 32))

(declare-fun mapRest!54820 () (Array (_ BitVec 32) ValueCell!16832))

(assert (=> mapNonEmpty!54820 (= (arr!42384 _values!1354) (store mapRest!54820 mapKey!54820 mapValue!54820))))

(declare-fun b!1312817 () Bool)

(assert (=> b!1312817 (= e!748812 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585429 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52385)

(declare-fun zeroValue!1296 () V!52385)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23042 0))(
  ( (tuple2!23043 (_1!11532 (_ BitVec 64)) (_2!11532 V!52385)) )
))
(declare-datatypes ((List!30160 0))(
  ( (Nil!30157) (Cons!30156 (h!31365 tuple2!23042) (t!43758 List!30160)) )
))
(declare-datatypes ((ListLongMap!20699 0))(
  ( (ListLongMap!20700 (toList!10365 List!30160)) )
))
(declare-fun contains!8442 (ListLongMap!20699 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5260 (array!87805 array!87807 (_ BitVec 32) (_ BitVec 32) V!52385 V!52385 (_ BitVec 32) Int) ListLongMap!20699)

(assert (=> b!1312817 (= lt!585429 (contains!8442 (getCurrentListMap!5260 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312818 () Bool)

(assert (=> b!1312818 (= e!748811 tp_is_empty!35461)))

(declare-fun b!1312819 () Bool)

(declare-fun res!871608 () Bool)

(assert (=> b!1312819 (=> (not res!871608) (not e!748812))))

(assert (=> b!1312819 (= res!871608 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42935 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54820 () Bool)

(assert (=> mapIsEmpty!54820 mapRes!54820))

(declare-fun b!1312820 () Bool)

(assert (=> b!1312820 (= e!748810 tp_is_empty!35461)))

(assert (= (and start!110896 res!871610) b!1312815))

(assert (= (and b!1312815 res!871611) b!1312814))

(assert (= (and b!1312814 res!871612) b!1312813))

(assert (= (and b!1312813 res!871609) b!1312819))

(assert (= (and b!1312819 res!871608) b!1312817))

(assert (= (and b!1312816 condMapEmpty!54820) mapIsEmpty!54820))

(assert (= (and b!1312816 (not condMapEmpty!54820)) mapNonEmpty!54820))

(get-info :version)

(assert (= (and mapNonEmpty!54820 ((_ is ValueCellFull!16832) mapValue!54820)) b!1312818))

(assert (= (and b!1312816 ((_ is ValueCellFull!16832) mapDefault!54820)) b!1312820))

(assert (= start!110896 b!1312816))

(declare-fun m!1201407 () Bool)

(assert (=> b!1312813 m!1201407))

(declare-fun m!1201409 () Bool)

(assert (=> mapNonEmpty!54820 m!1201409))

(declare-fun m!1201411 () Bool)

(assert (=> b!1312814 m!1201411))

(declare-fun m!1201413 () Bool)

(assert (=> b!1312817 m!1201413))

(assert (=> b!1312817 m!1201413))

(declare-fun m!1201415 () Bool)

(assert (=> b!1312817 m!1201415))

(declare-fun m!1201417 () Bool)

(assert (=> start!110896 m!1201417))

(declare-fun m!1201419 () Bool)

(assert (=> start!110896 m!1201419))

(declare-fun m!1201421 () Bool)

(assert (=> start!110896 m!1201421))

(check-sat (not b_next!29731) b_and!47921 tp_is_empty!35461 (not b!1312813) (not b!1312814) (not mapNonEmpty!54820) (not start!110896) (not b!1312817))
(check-sat b_and!47921 (not b_next!29731))
