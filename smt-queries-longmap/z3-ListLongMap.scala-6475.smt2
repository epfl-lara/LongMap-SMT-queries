; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82692 () Bool)

(assert start!82692)

(declare-fun b_free!18825 () Bool)

(declare-fun b_next!18825 () Bool)

(assert (=> start!82692 (= b_free!18825 (not b_next!18825))))

(declare-fun tp!65594 () Bool)

(declare-fun b_and!30313 () Bool)

(assert (=> start!82692 (= tp!65594 b_and!30313)))

(declare-fun mapIsEmpty!34435 () Bool)

(declare-fun mapRes!34435 () Bool)

(assert (=> mapIsEmpty!34435 mapRes!34435))

(declare-fun b!964208 () Bool)

(declare-fun res!645363 () Bool)

(declare-fun e!543594 () Bool)

(assert (=> b!964208 (=> (not res!645363) (not e!543594))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33819 0))(
  ( (V!33820 (val!10864 Int)) )
))
(declare-datatypes ((ValueCell!10332 0))(
  ( (ValueCellFull!10332 (v!13422 V!33819)) (EmptyCell!10332) )
))
(declare-datatypes ((array!59341 0))(
  ( (array!59342 (arr!28539 (Array (_ BitVec 32) ValueCell!10332)) (size!29018 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59341)

(declare-datatypes ((array!59343 0))(
  ( (array!59344 (arr!28540 (Array (_ BitVec 32) (_ BitVec 64))) (size!29019 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59343)

(declare-fun minValue!1342 () V!33819)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!33819)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!13958 0))(
  ( (tuple2!13959 (_1!6990 (_ BitVec 64)) (_2!6990 V!33819)) )
))
(declare-datatypes ((List!19806 0))(
  ( (Nil!19803) (Cons!19802 (h!20964 tuple2!13958) (t!28169 List!19806)) )
))
(declare-datatypes ((ListLongMap!12655 0))(
  ( (ListLongMap!12656 (toList!6343 List!19806)) )
))
(declare-fun contains!5446 (ListLongMap!12655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3576 (array!59343 array!59341 (_ BitVec 32) (_ BitVec 32) V!33819 V!33819 (_ BitVec 32) Int) ListLongMap!12655)

(assert (=> b!964208 (= res!645363 (contains!5446 (getCurrentListMap!3576 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28540 _keys!1686) i!803)))))

(declare-fun b!964209 () Bool)

(declare-fun e!543598 () Bool)

(declare-fun e!543596 () Bool)

(assert (=> b!964209 (= e!543598 (and e!543596 mapRes!34435))))

(declare-fun condMapEmpty!34435 () Bool)

(declare-fun mapDefault!34435 () ValueCell!10332)

(assert (=> b!964209 (= condMapEmpty!34435 (= (arr!28539 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10332)) mapDefault!34435)))))

(declare-fun b!964210 () Bool)

(declare-fun res!645366 () Bool)

(assert (=> b!964210 (=> (not res!645366) (not e!543594))))

(declare-datatypes ((List!19807 0))(
  ( (Nil!19804) (Cons!19803 (h!20965 (_ BitVec 64)) (t!28170 List!19807)) )
))
(declare-fun arrayNoDuplicates!0 (array!59343 (_ BitVec 32) List!19807) Bool)

(assert (=> b!964210 (= res!645366 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19804))))

(declare-fun b!964211 () Bool)

(declare-fun tp_is_empty!21627 () Bool)

(assert (=> b!964211 (= e!543596 tp_is_empty!21627)))

(declare-fun b!964212 () Bool)

(declare-fun res!645360 () Bool)

(assert (=> b!964212 (=> (not res!645360) (not e!543594))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!964212 (= res!645360 (bvsgt from!2084 newFrom!159))))

(declare-fun res!645364 () Bool)

(assert (=> start!82692 (=> (not res!645364) (not e!543594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82692 (= res!645364 (validMask!0 mask!2110))))

(assert (=> start!82692 e!543594))

(assert (=> start!82692 true))

(declare-fun array_inv!22103 (array!59341) Bool)

(assert (=> start!82692 (and (array_inv!22103 _values!1400) e!543598)))

(declare-fun array_inv!22104 (array!59343) Bool)

(assert (=> start!82692 (array_inv!22104 _keys!1686)))

(assert (=> start!82692 tp!65594))

(assert (=> start!82692 tp_is_empty!21627))

(declare-fun mapNonEmpty!34435 () Bool)

(declare-fun tp!65595 () Bool)

(declare-fun e!543597 () Bool)

(assert (=> mapNonEmpty!34435 (= mapRes!34435 (and tp!65595 e!543597))))

(declare-fun mapValue!34435 () ValueCell!10332)

(declare-fun mapKey!34435 () (_ BitVec 32))

(declare-fun mapRest!34435 () (Array (_ BitVec 32) ValueCell!10332))

(assert (=> mapNonEmpty!34435 (= (arr!28539 _values!1400) (store mapRest!34435 mapKey!34435 mapValue!34435))))

(declare-fun b!964213 () Bool)

(declare-fun e!543595 () Bool)

(assert (=> b!964213 (= e!543594 (not e!543595))))

(declare-fun res!645367 () Bool)

(assert (=> b!964213 (=> res!645367 e!543595)))

(assert (=> b!964213 (= res!645367 (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29019 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001))))))

(assert (=> b!964213 (contains!5446 (getCurrentListMap!3576 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28540 _keys!1686) i!803))))

(declare-datatypes ((Unit!32269 0))(
  ( (Unit!32270) )
))
(declare-fun lt!431065 () Unit!32269)

(declare-fun lemmaInListMapFromThenInFromMinusOne!29 (array!59343 array!59341 (_ BitVec 32) (_ BitVec 32) V!33819 V!33819 (_ BitVec 32) (_ BitVec 32) Int) Unit!32269)

(assert (=> b!964213 (= lt!431065 (lemmaInListMapFromThenInFromMinusOne!29 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!964214 () Bool)

(assert (=> b!964214 (= e!543595 true)))

(assert (=> b!964214 (contains!5446 (getCurrentListMap!3576 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 newFrom!159 defaultEntry!1403) (select (arr!28540 _keys!1686) i!803))))

(declare-fun lt!431064 () Unit!32269)

(declare-fun lemmaInListMapFromThenInFromSmaller!28 (array!59343 array!59341 (_ BitVec 32) (_ BitVec 32) V!33819 V!33819 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Int) Unit!32269)

(assert (=> b!964214 (= lt!431064 (lemmaInListMapFromThenInFromSmaller!28 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159 i!803 defaultEntry!1403))))

(declare-fun b!964215 () Bool)

(declare-fun res!645361 () Bool)

(assert (=> b!964215 (=> (not res!645361) (not e!543594))))

(assert (=> b!964215 (= res!645361 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29019 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29019 _keys!1686))))))

(declare-fun b!964216 () Bool)

(declare-fun res!645365 () Bool)

(assert (=> b!964216 (=> (not res!645365) (not e!543594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59343 (_ BitVec 32)) Bool)

(assert (=> b!964216 (= res!645365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!964217 () Bool)

(declare-fun res!645359 () Bool)

(assert (=> b!964217 (=> (not res!645359) (not e!543594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!964217 (= res!645359 (validKeyInArray!0 (select (arr!28540 _keys!1686) i!803)))))

(declare-fun b!964218 () Bool)

(declare-fun res!645362 () Bool)

(assert (=> b!964218 (=> (not res!645362) (not e!543594))))

(assert (=> b!964218 (= res!645362 (and (= (size!29018 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29019 _keys!1686) (size!29018 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!964219 () Bool)

(assert (=> b!964219 (= e!543597 tp_is_empty!21627)))

(assert (= (and start!82692 res!645364) b!964218))

(assert (= (and b!964218 res!645362) b!964216))

(assert (= (and b!964216 res!645365) b!964210))

(assert (= (and b!964210 res!645366) b!964215))

(assert (= (and b!964215 res!645361) b!964217))

(assert (= (and b!964217 res!645359) b!964208))

(assert (= (and b!964208 res!645363) b!964212))

(assert (= (and b!964212 res!645360) b!964213))

(assert (= (and b!964213 (not res!645367)) b!964214))

(assert (= (and b!964209 condMapEmpty!34435) mapIsEmpty!34435))

(assert (= (and b!964209 (not condMapEmpty!34435)) mapNonEmpty!34435))

(get-info :version)

(assert (= (and mapNonEmpty!34435 ((_ is ValueCellFull!10332) mapValue!34435)) b!964219))

(assert (= (and b!964209 ((_ is ValueCellFull!10332) mapDefault!34435)) b!964211))

(assert (= start!82692 b!964209))

(declare-fun m!893489 () Bool)

(assert (=> b!964216 m!893489))

(declare-fun m!893491 () Bool)

(assert (=> b!964214 m!893491))

(declare-fun m!893493 () Bool)

(assert (=> b!964214 m!893493))

(assert (=> b!964214 m!893491))

(assert (=> b!964214 m!893493))

(declare-fun m!893495 () Bool)

(assert (=> b!964214 m!893495))

(declare-fun m!893497 () Bool)

(assert (=> b!964214 m!893497))

(declare-fun m!893499 () Bool)

(assert (=> start!82692 m!893499))

(declare-fun m!893501 () Bool)

(assert (=> start!82692 m!893501))

(declare-fun m!893503 () Bool)

(assert (=> start!82692 m!893503))

(assert (=> b!964217 m!893493))

(assert (=> b!964217 m!893493))

(declare-fun m!893505 () Bool)

(assert (=> b!964217 m!893505))

(declare-fun m!893507 () Bool)

(assert (=> b!964213 m!893507))

(assert (=> b!964213 m!893493))

(assert (=> b!964213 m!893507))

(assert (=> b!964213 m!893493))

(declare-fun m!893509 () Bool)

(assert (=> b!964213 m!893509))

(declare-fun m!893511 () Bool)

(assert (=> b!964213 m!893511))

(declare-fun m!893513 () Bool)

(assert (=> mapNonEmpty!34435 m!893513))

(declare-fun m!893515 () Bool)

(assert (=> b!964208 m!893515))

(assert (=> b!964208 m!893493))

(assert (=> b!964208 m!893515))

(assert (=> b!964208 m!893493))

(declare-fun m!893517 () Bool)

(assert (=> b!964208 m!893517))

(declare-fun m!893519 () Bool)

(assert (=> b!964210 m!893519))

(check-sat tp_is_empty!21627 (not b!964214) (not b!964213) (not b!964210) (not mapNonEmpty!34435) (not b_next!18825) (not start!82692) (not b!964208) (not b!964217) (not b!964216) b_and!30313)
(check-sat b_and!30313 (not b_next!18825))
