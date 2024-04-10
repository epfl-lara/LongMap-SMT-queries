; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!826 () Bool)

(assert start!826)

(declare-fun b_free!219 () Bool)

(declare-fun b_next!219 () Bool)

(assert (=> start!826 (= b_free!219 (not b_next!219))))

(declare-fun tp!886 () Bool)

(declare-fun b_and!365 () Bool)

(assert (=> start!826 (= tp!886 b_and!365)))

(declare-fun b!6431 () Bool)

(declare-fun res!6817 () Bool)

(declare-fun e!3533 () Bool)

(assert (=> b!6431 (=> (not res!6817) (not e!3533))))

(declare-datatypes ((array!527 0))(
  ( (array!528 (arr!252 (Array (_ BitVec 32) (_ BitVec 64))) (size!314 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!527)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!527 (_ BitVec 32)) Bool)

(assert (=> b!6431 (= res!6817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6432 () Bool)

(declare-fun e!3534 () Bool)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6432 (= e!3534 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6433 () Bool)

(declare-fun e!3536 () Bool)

(declare-fun tp_is_empty!297 () Bool)

(assert (=> b!6433 (= e!3536 tp_is_empty!297)))

(declare-fun b!6434 () Bool)

(declare-fun res!6818 () Bool)

(assert (=> b!6434 (=> (not res!6818) (not e!3533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6434 (= res!6818 (validKeyInArray!0 k0!1278))))

(declare-fun b!6435 () Bool)

(declare-fun res!6820 () Bool)

(assert (=> b!6435 (=> (not res!6820) (not e!3533))))

(declare-fun defaultEntry!1495 () Int)

(declare-datatypes ((V!573 0))(
  ( (V!574 (val!154 Int)) )
))
(declare-datatypes ((ValueCell!132 0))(
  ( (ValueCellFull!132 (v!1245 V!573)) (EmptyCell!132) )
))
(declare-datatypes ((array!529 0))(
  ( (array!530 (arr!253 (Array (_ BitVec 32) ValueCell!132)) (size!315 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!529)

(declare-fun minValue!1434 () V!573)

(declare-fun zeroValue!1434 () V!573)

(declare-datatypes ((tuple2!160 0))(
  ( (tuple2!161 (_1!80 (_ BitVec 64)) (_2!80 V!573)) )
))
(declare-datatypes ((List!170 0))(
  ( (Nil!167) (Cons!166 (h!732 tuple2!160) (t!2305 List!170)) )
))
(declare-datatypes ((ListLongMap!165 0))(
  ( (ListLongMap!166 (toList!98 List!170)) )
))
(declare-fun contains!72 (ListLongMap!165 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!57 (array!527 array!529 (_ BitVec 32) (_ BitVec 32) V!573 V!573 (_ BitVec 32) Int) ListLongMap!165)

(assert (=> b!6435 (= res!6820 (contains!72 (getCurrentListMap!57 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6436 () Bool)

(declare-fun res!6814 () Bool)

(assert (=> b!6436 (=> (not res!6814) (not e!3533))))

(assert (=> b!6436 (= res!6814 (and (= (size!315 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!314 _keys!1806) (size!315 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6437 () Bool)

(declare-fun e!3535 () Bool)

(assert (=> b!6437 (= e!3535 true)))

(declare-datatypes ((SeekEntryResult!19 0))(
  ( (MissingZero!19 (index!2195 (_ BitVec 32))) (Found!19 (index!2196 (_ BitVec 32))) (Intermediate!19 (undefined!831 Bool) (index!2197 (_ BitVec 32)) (x!2525 (_ BitVec 32))) (Undefined!19) (MissingVacant!19 (index!2198 (_ BitVec 32))) )
))
(declare-fun lt!1206 () SeekEntryResult!19)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!527 (_ BitVec 32)) SeekEntryResult!19)

(assert (=> b!6437 (= lt!1206 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6439 () Bool)

(declare-fun e!3532 () Bool)

(assert (=> b!6439 (= e!3532 e!3535)))

(declare-fun res!6819 () Bool)

(assert (=> b!6439 (=> res!6819 e!3535)))

(assert (=> b!6439 (= res!6819 (not (= (size!314 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1204 () (_ BitVec 32))

(assert (=> b!6439 (arrayForallSeekEntryOrOpenFound!0 lt!1204 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!107 0))(
  ( (Unit!108) )
))
(declare-fun lt!1205 () Unit!107)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!527 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!107)

(assert (=> b!6439 (= lt!1205 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1204))))

(declare-fun arrayScanForKey!0 (array!527 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6439 (= lt!1204 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6440 () Bool)

(declare-fun res!6813 () Bool)

(assert (=> b!6440 (=> (not res!6813) (not e!3533))))

(declare-datatypes ((List!171 0))(
  ( (Nil!168) (Cons!167 (h!733 (_ BitVec 64)) (t!2306 List!171)) )
))
(declare-fun arrayNoDuplicates!0 (array!527 (_ BitVec 32) List!171) Bool)

(assert (=> b!6440 (= res!6813 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!168))))

(declare-fun mapNonEmpty!416 () Bool)

(declare-fun mapRes!416 () Bool)

(declare-fun tp!887 () Bool)

(declare-fun e!3537 () Bool)

(assert (=> mapNonEmpty!416 (= mapRes!416 (and tp!887 e!3537))))

(declare-fun mapRest!416 () (Array (_ BitVec 32) ValueCell!132))

(declare-fun mapKey!416 () (_ BitVec 32))

(declare-fun mapValue!416 () ValueCell!132)

(assert (=> mapNonEmpty!416 (= (arr!253 _values!1492) (store mapRest!416 mapKey!416 mapValue!416))))

(declare-fun mapIsEmpty!416 () Bool)

(assert (=> mapIsEmpty!416 mapRes!416))

(declare-fun b!6441 () Bool)

(assert (=> b!6441 (= e!3533 (not e!3532))))

(declare-fun res!6816 () Bool)

(assert (=> b!6441 (=> res!6816 e!3532)))

(declare-fun arrayContainsKey!0 (array!527 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6441 (= res!6816 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6441 e!3534))

(declare-fun c!461 () Bool)

(assert (=> b!6441 (= c!461 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1203 () Unit!107)

(declare-fun lemmaKeyInListMapIsInArray!38 (array!527 array!529 (_ BitVec 32) (_ BitVec 32) V!573 V!573 (_ BitVec 64) Int) Unit!107)

(assert (=> b!6441 (= lt!1203 (lemmaKeyInListMapIsInArray!38 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6442 () Bool)

(assert (=> b!6442 (= e!3534 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6443 () Bool)

(assert (=> b!6443 (= e!3537 tp_is_empty!297)))

(declare-fun b!6438 () Bool)

(declare-fun e!3539 () Bool)

(assert (=> b!6438 (= e!3539 (and e!3536 mapRes!416))))

(declare-fun condMapEmpty!416 () Bool)

(declare-fun mapDefault!416 () ValueCell!132)

(assert (=> b!6438 (= condMapEmpty!416 (= (arr!253 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!132)) mapDefault!416)))))

(declare-fun res!6815 () Bool)

(assert (=> start!826 (=> (not res!6815) (not e!3533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!826 (= res!6815 (validMask!0 mask!2250))))

(assert (=> start!826 e!3533))

(assert (=> start!826 tp!886))

(assert (=> start!826 true))

(declare-fun array_inv!183 (array!529) Bool)

(assert (=> start!826 (and (array_inv!183 _values!1492) e!3539)))

(assert (=> start!826 tp_is_empty!297))

(declare-fun array_inv!184 (array!527) Bool)

(assert (=> start!826 (array_inv!184 _keys!1806)))

(assert (= (and start!826 res!6815) b!6436))

(assert (= (and b!6436 res!6814) b!6431))

(assert (= (and b!6431 res!6817) b!6440))

(assert (= (and b!6440 res!6813) b!6435))

(assert (= (and b!6435 res!6820) b!6434))

(assert (= (and b!6434 res!6818) b!6441))

(assert (= (and b!6441 c!461) b!6442))

(assert (= (and b!6441 (not c!461)) b!6432))

(assert (= (and b!6441 (not res!6816)) b!6439))

(assert (= (and b!6439 (not res!6819)) b!6437))

(assert (= (and b!6438 condMapEmpty!416) mapIsEmpty!416))

(assert (= (and b!6438 (not condMapEmpty!416)) mapNonEmpty!416))

(get-info :version)

(assert (= (and mapNonEmpty!416 ((_ is ValueCellFull!132) mapValue!416)) b!6443))

(assert (= (and b!6438 ((_ is ValueCellFull!132) mapDefault!416)) b!6433))

(assert (= start!826 b!6438))

(declare-fun m!3707 () Bool)

(assert (=> start!826 m!3707))

(declare-fun m!3709 () Bool)

(assert (=> start!826 m!3709))

(declare-fun m!3711 () Bool)

(assert (=> start!826 m!3711))

(declare-fun m!3713 () Bool)

(assert (=> b!6441 m!3713))

(declare-fun m!3715 () Bool)

(assert (=> b!6441 m!3715))

(assert (=> b!6442 m!3713))

(declare-fun m!3717 () Bool)

(assert (=> b!6439 m!3717))

(declare-fun m!3719 () Bool)

(assert (=> b!6439 m!3719))

(declare-fun m!3721 () Bool)

(assert (=> b!6439 m!3721))

(declare-fun m!3723 () Bool)

(assert (=> b!6440 m!3723))

(declare-fun m!3725 () Bool)

(assert (=> b!6434 m!3725))

(declare-fun m!3727 () Bool)

(assert (=> b!6437 m!3727))

(declare-fun m!3729 () Bool)

(assert (=> b!6435 m!3729))

(assert (=> b!6435 m!3729))

(declare-fun m!3731 () Bool)

(assert (=> b!6435 m!3731))

(declare-fun m!3733 () Bool)

(assert (=> b!6431 m!3733))

(declare-fun m!3735 () Bool)

(assert (=> mapNonEmpty!416 m!3735))

(check-sat (not mapNonEmpty!416) (not b!6439) (not b!6437) (not b!6431) b_and!365 (not b!6435) (not b!6440) tp_is_empty!297 (not start!826) (not b!6441) (not b!6434) (not b_next!219) (not b!6442))
(check-sat b_and!365 (not b_next!219))
